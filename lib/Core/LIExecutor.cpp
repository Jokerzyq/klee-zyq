//===-- LIExecutor.cpp ------------------------------------------------------===//

#include "LIExecutor.h"

#include "Common.h"
//#include "Context.h"
//#include "CoreStats.h"
#include "ExternalDispatcher.h"
//#include "ImpliedValue.h"
#include "Memory.h"
#include "MemoryManager.h"
#include "PTree.h"
//#include "Searcher.h"
#include "SeedInfo.h"
#include "SpecialFunctionHandler.h"
#include "StatsTracker.h"
#include "TimingSolver.h"
#include "UserSearcher.h"
//#include "ExecutorTimerInfo.h"
#include "CoreStats.h"

//#include "../Solver/SolverStats.h"

//#include "klee/ExecutionState.h"
//#include "klee/Expr.h"
//#include "klee/Interpreter.h"
//#include "klee/TimerStatIncrementer.h"
//#include "klee/CommandLine.h"
//#include "klee/Common.h"
//#include "klee/util/Assignment.h"
//#include "klee/util/ExprPPrinter.h"
//#include "klee/util/ExprSMTLIBPrinter.h"
//#include "klee/util/ExprUtil.h"
#include "klee/util/GetElementPtrTypeIterator.h"
//#include "klee/Config/Version.h"
#include "klee/Config/IfLazyInitialization.h"
#include "klee/Internal/ADT/KTest.h"
#include "klee/Internal/ADT/RNG.h"
//#include "klee/Internal/Module/Cell.h"
#include "klee/Internal/Module/InstructionInfoTable.h"
//#include "klee/Internal/Module/KInstruction.h"
//#include "klee/Internal/Module/KModule.h"
//#include "klee/Internal/Support/FloatEvaluation.h"
//#include "klee/Internal/System/Time.h"
//#include "klee/Internal/System/MemoryUsage.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)  //cyj: LLVM_VERSION_CODE=(3,4)
//#include "llvm/IR/Function.h"
//#include "llvm/IR/Attributes.h"
//#include "llvm/IR/BasicBlock.h"
//#include "llvm/IR/Constants.h"
//#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
//#include "llvm/IR/IntrinsicInst.h"
//#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DataLayout.h"
//#include "llvm/IR/TypeBuilder.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Value.h"

#else
#include "llvm/Attributes.h"
#include "llvm/BasicBlock.h"
#include "llvm/Constants.h"
#include "llvm/Function.h"
#include "llvm/Instructions.h"
#include "llvm/IntrinsicInst.h"
#include "llvm/LLVMContext.h"
#include "llvm/Module.h"
#if LLVM_VERSION_CODE <= LLVM_VERSION(3, 1)
#include "llvm/Target/TargetData.h"
#else
#include "llvm/DataLayout.h"
#include "llvm/TypeBuilder.h"
#endif
#endif
//#include "llvm/ADT/SmallPtrSet.h"
//#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/CommandLine.h"
//#include "llvm/Support/ErrorHandling.h"
//#include "llvm/Support/Process.h"
//#include "llvm/Support/raw_ostream.h"

#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
//#include "llvm/Support/CallSite.h"
#else
#include "llvm/IR/CallSite.h"
#endif

//#include <cassert>
//#include <algorithm>
//#include <iomanip>
//#include <iosfwd>
//#include <fstream>
//#include <sstream>
//#include <vector>
//#include <string>

//#include <sys/mman.h>

//#include <errno.h>
//#include <cxxabi.h>

using namespace llvm;
using namespace klee;

extern std::vector<Function *> IRfunction;

namespace klee{
extern cl::opt<bool> SimplifySymIndices;
extern cl::opt<unsigned> MaxSymArraySize;
extern cl::opt<bool> NamedSeedMatching;
extern cl::opt<bool> ZeroSeedExtension;
extern cl::opt<bool> AllowSeedExtension;
extern cl::opt<bool> AllowSeedTruncation;
extern cl::opt<bool> AlwaysOutputSeeds;
extern cl::opt<bool> OnlyOutputStatesCoveringNew;
extern cl::opt<bool>EmitAllErrors;

//cyj add--------------------------------------------------------------------------------------------------------------------
cl::opt<bool>
OnlyOutputExceptionStates("only-output-exception-states",
		cl::init(false),
		cl::desc("Only output test cases exception (error and early). (add by cyj)"));
//end add-------------------------------------------------------------------------------------------------------------------

//zyq add------------------------------------------------------------------------------

cl::opt<int>
	InstructionNum("InstructionNum",
		cl::desc("Insert a interrupt function after executing the ginven number instructions(add by zyq)."),
		cl::init(0));
cl::opt<int>
	InterruptNum("InterruptNum",
		cl::desc("Insert the given number interrupt functions(add by zyq)."),
		cl::init(0));
//end add-------------------------------------------------------------------------------
}

LIExecutor::LIExecutor(const InterpreterOptions &opts, InterpreterHandler *ie)
			: FExecutor(opts, ie), newStructObjectNum(0), newArrayObjectNum(0), newPointerArrayObjectNum(0) {}


LIExecutor::~LIExecutor() {
  structMDNodeInfo.clear();
  symbolicPointerInfoMap.clear();
  argumentsMO.clear();

  //zyq add----------------------------------------------------------------------------------------------------------------
  reglobalObject.clear();
  flaglobalObject.clear();
  //end add----------------------------------------------------------------------------------------------------------------
}


//cyj: 对LIExecutor初始化
Interpreter *LIExecutor::create(const InterpreterOptions &opts,
                                 InterpreterHandler *ih) {
  return new LIExecutor(opts, ih);
}


Module *LIExecutor::setModule(llvm::Module *module,
                                  const ModuleOptions &opts) {
  assert(!kmodule && module && "can only register one module"); // XXX gross
  kmodule = new KModule(module);
  //cyj add--------------------------------------------------------------------------------------------------------
  getStructMDNodeInfo();
  //end add-------------------------------------------------------------------------------------------------------

  // Initialize the context.
#if LLVM_VERSION_CODE <= LLVM_VERSION(3, 1)
  TargetData *TD = kmodule->targetData;
#else
  DataLayout *TD = kmodule->targetData;
#endif
  Context::initialize(TD->isLittleEndian(),
                      (Expr::Width) TD->getPointerSizeInBits());

  specialFunctionHandler = new SpecialFunctionHandler(*this);

  specialFunctionHandler->prepare();
  kmodule->prepare(opts, interpreterHandler);
  specialFunctionHandler->bind();

  if (StatsTracker::useStatistics()) {
    statsTracker =
      new StatsTracker(*this,
                       interpreterHandler->getOutputFilename("assembly.ll"),
                       userSearcherRequiresMD2U());
  }
  return module;
}


void LIExecutor::runOneFunction(llvm::Function *f){
	std::vector<ref<Expr> > arguments;

	// force deterministic initialization of memory objects
	srand(1);
	srandom(1);

	//MemoryObject *argvMO = 0;

	// In order to make uclibc happy and be closer to what the system is
	// doing we lay out the environments at the end of the argv array
	// (both are terminated by a null). There is also a final terminating
	// null that uclibc seems to expect, possibly the ELF header?
	//cyj: 下面代码作用: 把argc大小, argv地址, envp地址加载到arguments中
	//int envc;
	//for (envc=0; envp[envc]; ++envc) ;

	unsigned NumPtrBytes = Context::get().getPointerWidth() / 8;
	  	  	//cyj: getPointerWidth: The pointer width of the target architecture.
	KFunction *kf = kmodule->functionMap[f];
	  	  	  //cyj: return the data of the (key,data) %pair
	assert(kf);

	//cyj: 下面代码作用: 新建一个state对象, 把arguments绑定到ExecutionState中kfunction对应的的StackFrame中
	ExecutionState *state = new ExecutionState(kmodule->functionMap[f]);
	  	  	  //cyj: ExecutionState representing a path under exploration
	if (pathWriter)
	  state->pathOS = pathWriter->open();
	if (symPathWriter)
	  state->symPathOS = symPathWriter->open();

	if (statsTracker)
	  statsTracker->framePushed(*state, 0);	//cyj: 对ExecutionState的最后一个StackFrame进行配置

	for(Function::arg_iterator ai = f->arg_begin(), ae = f->arg_end(); ai != ae; ai++){
		Argument *targetArgument = ai;
		std::string argName = targetArgument->getName().str();
		Type *argType = targetArgument->getType();
		uint64_t argSize = kmodule->targetData->getTypeAllocSize(argType);
		MemoryObject *argMO = memory->allocate(argSize, false, true, targetArgument);
		argMO->setName(argName);
		argumentsMO.insert(argMO);
		executeMakeSymbolic(*state, argMO, argName);
		ObjectState *argOS = state->addressSpace.objects.find(argMO)->second;
		ref<Expr> argValue = argOS->read(0, getWidthForLLVMType(argType));
		arguments.push_back(argValue);
	}


	assert(arguments.size() == f->arg_size() && "wrong number of arguments");
	for (unsigned i = 0, e = f->arg_size(); i != e; ++i)
	  bindArgument(kf, i, *state, arguments[i]);//cyj: 把arguments中的三个expr绑定到stackFrame中
	 			//cyj: state.stack里最后一个stackFrame的第i个cell的value值为arguments[i]

	//cyj: 对module中每个函数/别名及其地址引用的map放在globalAddresses中,
	//cyj: 对每个全局变量创建MemoryObject与ObjectState, 并放在Map中, 并进行初始化
	initializeGlobals(*state);
	//cyj: Module与ExecutionState的联系? Module中也有KFunction与MO

	//cyj: 下面代码作用: executor运行state
	processTree = new PTree(state);
	state->ptreeNode = processTree->root;	//cyj: Pointer to the process tree of the current state
	run(*state);
	delete processTree;
	processTree = 0;

	// hack to clear memory objects
	delete memory;
	memory = new MemoryManager();

	globalObjects.clear();
	globalAddresses.clear();

	if (statsTracker)
	  statsTracker->done();

	//cyj add------------------------------------------------------------------------------------------------------------------------------------------------
	if(!timers.empty()) {
		delete timers.back();
		timers.pop_back();
	}
	haltExecution = false;
	argumentsMO.clear();
	//end add-----------------------------------------------------------------------------------------------------------------------------------------------
}


void LIExecutor::getStructMDNodeInfo(){

  for (Module::iterator it = kmodule->module->begin(), ie = kmodule->module->end(); it != ie; ++it) {
    KFunction *kf = new KFunction(it, kmodule);
	for (unsigned i=0; i<kf->numInstructions; ++i) {
	  Instruction *inst = kf->instructions[i]->inst;
	  if(inst->getOpcode() == Instruction::Call && inst->getNumOperands() == 3 &&
	    		  	  	  	 !inst->getOperand(2)->getName().str().compare("llvm.dbg.declare")){
	    //inst->dump();
		Type *mdPointType = cast<MDNode>(inst->getOperand(0))->getOperand(0)->getType()->getPointerElementType();
		Type *structType = 0;
		MDNode *structTypeMD = 0;
		if(mdPointType->isStructTy()){
		  structType = mdPointType;
		  MDNode *auto_variable = cast<MDNode>(inst->getOperand(1));
		  MDNode *typedefOrStruct = cast<MDNode>(auto_variable->getOperand(5));
		  if(typedefOrStruct->getNumOperands() == 10){	//cyj: This is a typedef metadata of struct.
		    structTypeMD = cast<MDNode>(typedefOrStruct->getOperand(9));
		  }else if(typedefOrStruct->getNumOperands() == 15){ 	//cyj: This is a struct metadata.
		    structTypeMD = typedefOrStruct;
		  }
		}
		else if(mdPointType->isPointerTy()){
		  if(mdPointType->getPointerElementType()->isStructTy()){
		    structType = mdPointType->getPointerElementType();
		    MDNode *auto_variable = cast<MDNode>(inst->getOperand(1));
		    MDNode *pointerType = cast<MDNode>(auto_variable->getOperand(5));
		    MDNode *typedefOrStruct = cast<MDNode>(pointerType->getOperand(9));
		    if(typedefOrStruct->getNumOperands() == 10){	//cyj: This is a typedef metadata of struct.
		      structTypeMD = cast<MDNode>(typedefOrStruct->getOperand(9));
		    }else if(typedefOrStruct->getNumOperands() == 15){ 	//cyj: This is a struct metadata.
		      structTypeMD = typedefOrStruct;
		    }
	      }
	    }
		if(structType && structTypeMD){
		  if(structMDNodeInfo.find(structType) == structMDNodeInfo.end()){
			if(structTypeMD->getNumOperands() > 10){
			  if(MDNode *structFields = dyn_cast<MDNode>(structTypeMD->getOperand(10))){
			    for(unsigned i=0; i<structFields->getNumOperands(); i++){
			      std::string fieldName = cast<MDNode>(structFields->getOperand(i))->getOperand(3)->getName().str();
			      structMDNodeInfo[structType].push_back(fieldName);
			      //TODO: 结构体嵌套怎么办?
			      //TODO: 如果一个结构体只定义了, 没有声明对象, 而没有MD信息, 怎么办?
		        }
			  }
			}
		  }
		}

	  }
	}
  }
}


void LIExecutor::executeInstruction(ExecutionState &state, KInstruction *ki) {
	Instruction *i = ki->inst;
	switch (i->getOpcode()) {
	case Instruction::GetElementPtr: {	//cyj: example: get <node.next>
	    KGEPInstruction *kgepi = static_cast<KGEPInstruction*>(ki);
	    ref<Expr> base = eval(ki, 0, state).value;
	    // 如果: 指针为NULL, offset为符号值, 也报空指针错
	    if(ConstantExpr *conBase = dyn_cast<ConstantExpr>(base)) {
	    	if(conBase->getZExtValue() == 0) {
	    		terminateStateOnError(state, "memory error: point to 0", "ptr.err");
	    	}
	    }

	    for (std::vector< std::pair<unsigned, uint64_t> >::iterator
	           it = kgepi->indices.begin(), ie = kgepi->indices.end();
	         it != ie; ++it) {	//cyj: loop once: kgepi->indices = <1, 8>
	      uint64_t elementSize = it->second;	//cyj: elementSize = 8
	      ref<Expr> index = eval(ki, it->first, state).value;	//cyj: it->first = 1; index = 2
	      base = AddExpr::create(base,
	                             MulExpr::create(Expr::createSExtToPointerWidth(index),
	                                             Expr::createPointer(elementSize)));
	    }
	    if (kgepi->offset)
	      base = AddExpr::create(base,
	                             Expr::createPointer(kgepi->offset));		//cyj: node.next的offset为0
	    bindLocal(ki, state, base);	//cyj: base为存储node.next内容的所在地址
	    break;
	  }

	default:
		FExecutor::executeInstruction(state, ki);
		break;
	}

	//zyq add----------------------------------------------------------------------------------------------------------------
	if (!IRfunction.empty())
	{
		llvm::errs()<<"--------------\n";
		llvm::errs()<<"now-> block:   "<<state.pBlock<<"\n";
		int fblock = 0;
		if (state.BlockCount.count(state.pBlock) != 0)
			fblock = state.BlockCount.count(state.pBlock);
		state.BlockCount.insert(std::make_pair(state.pBlock,fblock));

		llvm::errs()<<"flblock:  "<<fblock<<"\n";
		int IRflag = 0;
		Function *temf;
		for (std::vector<Function *>::iterator it = IRfunction.begin();
				it != IRfunction.end(); it++){
			Function * irf = *it;
			if (IRflag == 1){
				temf = *it;
				break;
			}
			for (llvm::iplist<BasicBlock>::iterator jt = irf->begin();
					jt != irf->end(); jt++){
				BasicBlock *tempblock = jt;
				if (tempblock == state.pBlock){
					IRflag = 1;
					break;
				}
			}
		}
		if (IRflag == 0) temf = *(IRfunction.begin());
		if (temf && fblock == InstructionNum && state.BlockIRnum.count(state.pBlock) < InterruptNum){
			state.BlockIRnum.insert(state.pBlock);
			std::vector< ref<Expr> > arguements;
			std::vector<Value *> Args;
			CallInst *ci = CallInst::Create(temf, Args, "",i);
			KInstruction *kci = new KInstruction();
			kci->inst = ci;
			kmodule->infos->infos.insert(std::make_pair(ci, kmodule->infos->dummyInfo));
			executeCall(state,kci,temf,arguements);
			llvm::errs()<<"temf:    "<<*(temf->begin())<<"\n";
		}
	}
		//end add----------------------------------------------------------------------------------------------------------------
}



//cyj: isWrite=false时, load指令, 从address对应的OS里read内容, 写入指令目标cell.value里
//cyj: isWrite=true时, store指令, 把value值写入address对应的OS里
void LIExecutor::executeMemoryOperation(ExecutionState &state,
                                      bool isWrite,
                                      ref<Expr> address,
                                      ref<Expr> value /* undef if read */,
                                      KInstruction *target /* undef if write */) {
  //cyj add-------------------------------------------------------------------------------------------------------------------------------------------
  //cyj: 将通过malloc分配得到的MemoryObject的<结构体类型, 首地址>保存在mallocObject中, 供懒初始化结构体时使用.
  if(isWrite && target){
	  if(Instruction *operand0 = dyn_cast<Instruction>(target->inst->getOperand(0))){
		  if(operand0->getOpcode() == Instruction::BitCast){
			  Type *operand1 = target->inst->getOperand(1)->getType()->getPointerElementType();
			  if(operand1->isPointerTy()){
				  state.mallocStructObject.insert(std::make_pair(operand1->getPointerElementType(), value));
			  }
		  }
	  }
  }
  /*---------------------------------------------------------------------------------------
   * struct Node *node1;
   * node1 = malloc(sizeof(struct Node));
   * --------------------------------------------------------------------------------------
   * %node1 = alloca %struct.Node*, align 8
   * %2 = call noalias i8* @malloc(i64 16) #4, !dbg !32
   * %3 = bitcast i8* %2 to %struct.Node*, !dbg !32
   * store %struct.Node* %3, %struct.Node** %node1, align 8, !dbg !32
   * -------------------------------------------------------------------------------------- */
//end add-----------------------------------------------------------------------------------------------------------------------------------------

  if(isa<ConstantExpr>(address)) {
	  uint64_t constantAddress = cast<ConstantExpr>(address)->getZExtValue();
	  if(constantAddress < maxCharArraySize || constantAddress < maxIntArraySize * 4){
		  terminateStateOnError(state, "memory error: point to 0", "ptr.err");
		  return;
	  }
  }
  // 如果: 指针为NULL, offset为符号值, 也报空指针错, 在 Instruction::GetElementPtr 代码里处理

  Expr::Width type = (isWrite ? value->getWidth() :
                     getWidthForLLVMType(target->inst->getType()));
  unsigned bytes = Expr::getMinBytesForWidth(type);

/*  if (SimplifySymIndices) {
    if (!isa<ConstantExpr>(address))
      address = state.constraints.simplifyExpr(address);
    if (isWrite && !isa<ConstantExpr>(value))
      value = state.constraints.simplifyExpr(value);
  }*/

  //cyj modify------------------------------------------------------------------------------------------------------------------------------
  if (!isa<ConstantExpr>(address))
	  address = state.constraints.simplifyExpr(address);
  if (isWrite && !isa<ConstantExpr>(value))
      value = state.constraints.simplifyExpr(value);
  //modify end-----------------------------------------------------------------------------------------------------------------------------

  // fast path: single in-bounds resolution
  ObjectPair op;
  bool success;
  solver->setTimeout(coreSolverTimeout);
  if (!state.addressSpace.resolveOne(state, solver, address, op, success)) {
    //cyj: 符号化address没有走进来过, resolveOne = true, success = false
	address = toConstant(state, address, "resolveOne failure");
    success = state.addressSpace.resolveOne(cast<ConstantExpr>(address), op);
  }
  solver->setTimeout(0);

  if (success) {
    const MemoryObject *mo = op.first;

    if (MaxSymArraySize && mo->size>=MaxSymArraySize) {
      address = toConstant(state, address, "max-sym-array-size");
    }

    ref<Expr> offset = mo->getOffsetExpr(address);

    /*//cyj add---------------------
    llvm::errs() << "Instruction:\t";
    target->inst->dump();
    llvm::errs() << "offset:\t";
    offset->dump();
    //end add--------------*/

    bool inBounds;
    solver->setTimeout(coreSolverTimeout);
    bool success = solver->mustBeTrue(state,
                                      mo->getBoundsCheckOffset(offset, bytes),
                                      inBounds);
    solver->setTimeout(0);
    if (!success) {
      state.pc = state.prevPC;
      terminateStateEarly(state, "Query timed out (bounds check).");
      return;
    }

    /*zyq add----------------------------------------------------------------------------------------------------------------
        if (!isWrite && reglobalObject.count(mo)!=0){
        	const ObjectState *tos = op.second;
        	ref<Expr> result0 = tos->read(offset,type);
        	if (!dyn_cast<ConstantExpr> (result0)){
        		int flag = 0;
        		if (flaglobalObject.count(mo) != 0)
        			flag = flaglobalObject.count(mo);
        		std::stringstream ss;
        		ss<<flag;
        		std::string str = ss.str();
        		const Array *array = Array::CreateArray(std::string(reglobalObject.find(mo)->second->getName())+str,mo->size);
        		bindObjectInState(state,mo,false,array);
        		state.addSymbolic(mo,array);
        		success = state.addressSpace.resolveOne(cast<ConstantExpr>(address),op);
        		ref <Expr> result = tos->read(offset,type);
        		flaglobalObject.insert(std::make_pair(mo,result));
        		llvm::errs()<<"************************new objectstate******************\n";
        	}
        }
        //end add----------------------------------------------------------------------------------------------------------------
         */

//cyj add-------------------------------------------------------------------------------------------------------------------------------------------
    //如果offset为符号值, 则fork以下两种情况, 把offset>100的情况合并到out-of-bound情况中
    std::map<uint64_t, uint64_t>::iterator pointerMaxDerefeOffset = state.maxDereferenceSize.find(mo->address);
    if(pointerMaxDerefeOffset != state.maxDereferenceSize.end()){
    	if(!dyn_cast<ConstantExpr>(offset)) {
    		//case1: out-of-bound
    		ExecutionState *outOfBoundState = outOfBoundFork(&state);
    		const MemoryObject *symbolicSizeMO = state.arrayObjectSymbolicSize[mo->address];
    		assert(symbolicSizeMO && "Error!");
    		ObjectState *symbolicSizeOS = state.addressSpace.objects.find(symbolicSizeMO)->second;
   			ref<Expr> symbolicSize = symbolicSizeOS->read(0, Expr::Int64);
   			ref<Expr> bytesExpr = ConstantExpr::create(bytes -1, Expr::Int64);
   			ref<Expr> sizeBound = AddExpr::create(offset, bytesExpr);
   			addConstraint(*outOfBoundState, UgeExpr::create(sizeBound, symbolicSize));		// offset + bytes -1 >= symbolicSize
    		terminateStateOnError(*outOfBoundState,
    		    			    	 "memory error: out of bound pointer",
    		    			    	 "ptr.err");

    		//case2: doesn't out-of-bound, normal execution
    		addConstraint(state, UltExpr::create(sizeBound, symbolicSize));		// offset + bytes -1 < symbolicSize
    		inBounds = true;

    		// 如果为双重指针, offset为符号值, 则具体化offset
    		if(state.pointToPointerLIOffset.find(mo->address) != state.pointToPointerLIOffset.end()){
    			ref<ConstantExpr> ce;
    			bool success = solver->getValue(state, offset, ce);
    			assert(success && "FIXME: Unhandled solver failure (LIExecutor-executeMemoryOperation())");

    			addConstraint(state, EqExpr::create(offset, ce));		// offset == ce
    			offset = ce;
    			address = AddExpr::create(mo->getBaseExpr(), ce);
    		}
    	}
    }

//add end------------------------------------------------------------------------------------------------------------------------------------------

    if (inBounds) {
//cyj add---------------------------------------------------------------------------------------------------------------------------------------------
    	if(pointerMaxDerefeOffset != state.maxDereferenceSize.end()){
    		if(ConstantExpr *offsetCE = dyn_cast<ConstantExpr>(offset)){
    			if(offsetCE->getZExtValue() > pointerMaxDerefeOffset->second){	//条件: offsetCE < MO->size && offsetCE > pointerMaxDerefeOffset
    				if(state.pointToPointerLIOffset.find(mo->address) == state.pointToPointerLIOffset.end()){
    															// 如果不是双重指针
    					//case1: out-of-bound
    					ExecutionState *outOfBoundState = outOfBoundFork(&state);
    					const MemoryObject *symbolicSizeMO = state.arrayObjectSymbolicSize[mo->address];
    					assert(symbolicSizeMO && "Error!");
    					ObjectState *symbolicSizeOS = state.addressSpace.objects.find(symbolicSizeMO)->second;
    					ref<Expr> symbolicSize = symbolicSizeOS->read(0, Expr::Int64);
    					ref<Expr> sizeBound = ConstantExpr::create(offsetCE->getZExtValue() + bytes -1, Expr::Int64);
    					addConstraint(*outOfBoundState, UgeExpr::create(sizeBound, symbolicSize));		// offsetCE + bytes -1 >= symbolicSize
    					terminateStateOnError(*outOfBoundState,
    				                            "memory error: out of bound pointer",
    				                            "ptr.err");

    					//case2: doesn't out-of-bound, normal execution
    					addConstraint(state, UltExpr::create(sizeBound, symbolicSize));		// offsetCE + bytes -1 < symbolicSize
    					state.maxDereferenceSize[mo->address] = offsetCE->getZExtValue();
    				}
    				else { 	// 如果该指针为双重指针, 则需要处理后面的每一个指针
    					//case1: out-of-bound
    					ExecutionState *outOfBoundState = outOfBoundFork(&state);
    					const MemoryObject *symbolicSizeMO = state.arrayObjectSymbolicSize[mo->address];
    					assert(symbolicSizeMO && "Error!");
    					ObjectState *symbolicSizeOS = state.addressSpace.objects.find(symbolicSizeMO)->second;
    					ref<Expr> symbolicSize = symbolicSizeOS->read(0, Expr::Int64);
    					ref<Expr> sizeBound = ConstantExpr::create(offsetCE->getZExtValue() + bytes -1, Expr::Int64);
    					addConstraint(*outOfBoundState, UgeExpr::create(sizeBound, symbolicSize));		// offsetCE + bytes -1 >= symbolicSize
    					terminateStateOnError(*outOfBoundState,
    					    				      "memory error: out of bound pointer",
    					    				      "ptr.err");

    					//case2: doesn't out-of-bound, normal execution
    					unsigned oldLIOffset = state.pointToPointerLIOffset[mo->address];
    					unsigned newLIOffset = offsetCE->getZExtValue() / 8;
    					Type *typePointTo = state.pointToPointerArrayType[mo->address];
    					for(unsigned i=oldLIOffset+1; i<=newLIOffset; i++){
    						uint64_t pointerAddress = mo->address + i * 8;
    						state.pointerBeAccessed[pointerAddress] = false;
    						std::stringstream PointerArrayName;
    						PointerArrayName << state.pointToPointerArrayName[mo->address] << "[" << i << "]";
    						PointerInfo *pointerInfo = new PointerInfo(typePointTo, pointerAddress, "",
    														PointerArrayName.str(), MOIsNewCreatePinterArray);
    						this->symbolicPointerInfoMap[pointerAddress] = pointerInfo;
    					}
    					addConstraint(state, UltExpr::create(sizeBound, symbolicSize));		// offsetCE + bytes -1 < symbolicSize
    					state.pointToPointerLIOffset[mo->address] = newLIOffset;
    				}
    			}
    		//else normal execution
    		}	// end if ConstantExpr
    		/*else {	// offset is not ConstantExpr
    		}	//end else*/
    	}

//end add-------------------------------------------------------------------------------------------------------------------------------------------

      const ObjectState *os = op.second;
      if (isWrite) {	//store
    	  /*//cyj add
    	  llvm::errs() << "----------------------------normal write\n";
    	  target->inst->dump();
    	  value.get()->dump();
    	  llvm::errs() << "size: " << mo->size << "\n";
    	  llvm::errs() << "address: " << mo->address << "\n";
    	  llvm::errs() << "read only: " << os->readOnly << "\n";
    	  //end add*/
//cyj add---------------------------------------------------------------------------------------------------------------------------------------------
    	//cyj: 如果store指令第一个参数为符号化指针, 判断是否访问过.
    	std::map<ref<Expr>, const MemoryObject *>::iterator moOfArg1Value = symbolicPointerValue.find(value);
    	if(moOfArg1Value != symbolicPointerValue.end()) {
    		const MemoryObject *arg1MO = moOfArg1Value->second;
    		std::map<uint64_t, bool>::iterator arg1MObeAccessed = state.pointerBeAccessed.find(arg1MO->address);
    		if(arg1MObeAccessed != state.pointerBeAccessed.end() && arg1MObeAccessed->second == false){
    			arg1MObeAccessed->second = true;
    			ObjectPair arg1OP;
    			if(!state.addressSpace.resolveOne(cast<ConstantExpr>(arg1MO->getBaseExpr()), arg1OP)) {
    				assert("Error: LIExecutor-executeMemoryOperation-write!");
    			}
    			ref<Expr> arg1Offset = ConstantExpr::create(0, Context::get().getPointerWidth());
    			state.pc = state.prevPC;
    			lazyInitialization(state, arg1MO->address, arg1OP, arg1Offset, 0);
    			++state.pc;
    			// 当前state懒初始化进行fork, fork了多种state, 但是当前state变为nullState, 该情况下value要赋值为null.
    			ref<Expr> nullValue = ConstantExpr::create(0, Context::get().getPointerWidth());
    			value = nullValue;
    		}
    	}

    	//cyj: 该指针是否是第一次被访问, 如果是, 设置为被访问过.
    	std::map<uint64_t, bool>::iterator arg2MObeAccessed =
    									state.pointerBeAccessed.find(cast<ConstantExpr>(address)->getZExtValue());
    	if(arg2MObeAccessed != state.pointerBeAccessed.end() && arg2MObeAccessed->second == false) {
    		arg2MObeAccessed->second = true;
    	}
//end add-------------------------------------------------------------------------------------------------------------------------------------------

    	if (os->readOnly) {
    		terminateStateOnError(state,
                                "memory error: object read only",
                                "readonly.err");
    	} else {
    		ObjectState *wos = state.addressSpace.getWriteable(mo, os);
    		wos->write(offset, value);
    	}
      } else {	//isRead-load
//cyj add---------------------------------------------------------------------------------------------------------------------------------------------
    	//cyj: 该指针是否是第一次被访问, 如果是, 进行懒初始化.
    	std::map<uint64_t, bool>::iterator beAccessed =
    									state.pointerBeAccessed.find(cast<ConstantExpr>(address)->getZExtValue());
    	if(beAccessed != state.pointerBeAccessed.end() && beAccessed->second == false){
    		beAccessed->second = true;
    		lazyInitialization(state, beAccessed->first, op, offset, type);
    	}
//end add-------------------------------------------------------------------------------------------------------------------------------------------
    	else{
    		ref<Expr> result = os->read(offset, type);

    		if (interpreterOpts.MakeConcreteSymbolic)
    			result = replaceReadWithSymbolic(state, result);

    		bindLocal(target, state, result);
    	}
      }

      return;
    }
  }

  // we are on an error path (no resolution, multiple resolution, one
  // resolution with out of bounds)
  ResolutionList rl;
  solver->setTimeout(coreSolverTimeout);
  bool incomplete = state.addressSpace.resolve(state, solver, address, rl,
                                               0, coreSolverTimeout);
  solver->setTimeout(0);

  // XXX there is some query wasteage here. who cares?
  ExecutionState *unbound = &state;

  /*//cyj add
  llvm::errs() << "============================unnormal wirte\n";
  target->inst->dump();
  int iiii = 0;
  //end add*/
	  /*//cyj add
	  llvm::errs() << "----------------------------unnormal read\n";
	  target->inst->dump();
	  int iiii = 0;
	  //add end*/
  for (ResolutionList::iterator i = rl.begin(), ie = rl.end(); i != ie; ++i) {
	/*//cyj add
	  iiii++;
	  if(i->first->allocSite)
		  i->first->allocSite->dump();
	  llvm::errs() << "size: " << i->first->size << "\n";
	  llvm::errs() << "address: " << i->first->address << "\n";
	  llvm::errs() << "read only: " << i->second->readOnly << "\n";
	//end add*/
	const MemoryObject *mo = i->first;
    const ObjectState *os = i->second;
    ref<Expr> inBounds = mo->getBoundsCheckPointer(address, bytes);

    StatePair branches = fork(*unbound, inBounds, true);
    ExecutionState *bound = branches.first;

    // bound can be 0 on failure or overlapped
    if (bound) {
      if (isWrite) {	//store
    	if (os->readOnly) {
          terminateStateOnError(*bound,
                                "memory error: object read only",
                                "readonly.err");
        } else {
          ObjectState *wos = bound->addressSpace.getWriteable(mo, os);
          wos->write(mo->getOffsetExpr(address), value);
        }
      } else {	//isRead-load
        ref<Expr> result = os->read(mo->getOffsetExpr(address), type);
        bindLocal(target, *bound, result);
      }
    }

    unbound = branches.second;
    if (!unbound)
      break;
  }

  // XXX should we distinguish out of bounds and overlapped cases?
  if (unbound) {
    if (incomplete) {
      terminateStateEarly(*unbound, "Query timed out (resolve).");
    } else {
      terminateStateOnError(*unbound,
                            "memory error: out of bound pointer",
                            "ptr.err",
                            getAddressInfo(*unbound, address));
    }
  }
}


//cyj: 对MemoryObject创建一个ObjectState与其绑定.
//cyj: 在replay-out模式下, 将replayOut(KTest)的第replayPosition个KTObjects的bytes写入ObjectState中.
//cyj: 在非replay-out模式下, 对MemoryObject创建一个Array与其绑定, 保存到symbolics中.
//cyj: 在seed模式下, 每个seedInfo生成与array对应的vector<unsigned char>, 值为KTestObject的bytes
//----------------------------------------------------------------------------------------------------------------------------
//cyj: replay-out与seed的区别: replay没有创建Array, 没有加入symbolics, 只是对mo所对应的os赋值.
//cyj: seed生成了symbolics, 生成了vector<unsigned char>来保存变量的具体值(KTestObjects.bytes)
void LIExecutor::executeMakeSymbolic(ExecutionState &state, const MemoryObject *mo,
                                   const std::string &name) {
  // Create a new object state for the memory object (instead of a copy).
  if (!replayOut) {		//cyj: 没有使用replay模式
    // Find a unique name for this array.  First try the original name,
    // or if that fails try adding a unique identifier.
    unsigned id = 0;
    std::string uniqueName = name;
    while (!state.arrayNames.insert(uniqueName).second) {	//cyj: insert不成功, 在set中已经存在
      uniqueName = name + "_" + llvm::utostr(++id);
    }
    const Array *array = Array::CreateArray(uniqueName, mo->size);
    bindObjectInState(state, mo, false, array);
    //cyj: Array数据类型作用是什么? 与mo和os有什么关系??
    state.addSymbolic(mo, array);	//cyj: 将mo与array加入到state的symbolics中. replay模式不用symbolics

//cyj add---------------------------------------------------------------------------------------------------------------------------------------------------------------
    //cyj: 判断该符号化MemoryObject是否为懒初始化过程中新建的, 得到符号化类型
    Type * symbolicObjectType = 0;
    bool isNewCreateObject;	//cyj: 该MemoryObject是否为懒初始化过程中新建的, 还是原程序中就存在的
    if(mo->allocSite) {
    	if(argumentsMO.find(mo) != argumentsMO.end()){
    		symbolicObjectType = mo->allocSite->getType();
    	} else {
    		symbolicObjectType = mo->allocSite->getType()->getPointerElementType(); //cyj: mo->allocSite->getType() = pointerType
    	}
    	isNewCreateObject = false;
    } else {
    	for(std::set<std::pair<llvm::Type *, std::pair<uint64_t, std::string> > >::iterator it = state.LICreateStructObject.begin(),
    					ie = state.LICreateStructObject.end(); it != ie; ++it){
    		if(it->second.first == mo->address){
    			symbolicObjectType = it->first;	//cyj: struct, char, int
    			isNewCreateObject = true;
    			break;
    		}
    	}
    }

    if(symbolicObjectType && symbolicObjectType->isStructTy()){		//cyj: 如果符号化类型为结构体类型
    	getPointerInfoOfStruct(symbolicObjectType, state, mo->address, mo->name, isNewCreateObject);
        							//cyj: 得到符号化结构体中指针的信息 PointerInfo
    	if(!isNewCreateObject){
    		for(MemoryMap::iterator it = state.addressSpace.objects.begin(), ie = state.addressSpace.objects.end(); it != ie; ++it){
    			const llvm::Value *allocS = it->first->allocSite;
    			if(allocS){
    				if(isa<Instruction>(allocS))
    					if(allocS->getType()->getTypeID() == Type::StructTyID)
    						state.defineBeforeStructSymbolic[mo].insert(it->first);
    			}	//cyj: 该结构体中的Struct指针可能指向符号化之前定义的每个StructObject
    		}
    		for(ExecutionState::sturctMallocInfo::iterator it = state.mallocStructObject.begin(),
    													ie = state.mallocStructObject.end(); it != ie; ++it){
    			state.mallocBeforeStructSymbolic[mo].insert(*it);
    		}	//cyj: 该结构体中的Struct指针可能指向其符号化之前malloc的每个StructObject
    	}
    }
    else if(symbolicObjectType && symbolicObjectType->isPointerTy()){		//cyj: 如果符号化类型为指针类型(包含双重指针)

    	uint64_t pointerAddress = mo->address;
    	state.pointerBeAccessed[pointerAddress] = false;
    	PointerInfo *pointerInfo = new PointerInfo(symbolicObjectType->getPointerElementType(),
    												pointerAddress, "", mo->name, MOIsPointer);
    	this->symbolicPointerInfoMap[pointerAddress] = pointerInfo;

    	ObjectState *os = state.addressSpace.objects.find(mo)->second;
    	ref<Expr> symbolicValue = os->read(0, getWidthForLLVMType(symbolicObjectType));
    	this->symbolicPointerValue[symbolicValue] = mo;

    	if(symbolicObjectType->getPointerElementType()->isStructTy()){	//cyj: 指针指向结构体类型
        	for(MemoryMap::iterator it = state.addressSpace.objects.begin(), ie = state.addressSpace.objects.end(); it != ie; ++it){
        		const llvm::Value *allocS = it->first->allocSite;
        		if(allocS){
        			if(isa<Instruction>(allocS))
        				if(allocS->getType()->getTypeID() == Type::StructTyID)
        					state.defineBeforeStructSymbolic[mo].insert(it->first);
        		}
        	}
        	for(ExecutionState::sturctMallocInfo::iterator it = state.mallocStructObject.begin(), ie = state.mallocStructObject.end(); it != ie; ++it){
        		state.mallocBeforeStructSymbolic[mo].insert(*it);
        	}
    	}
    }

//end add---------------------------------------------------------------------------------------------------------------------------------------------------------------

    std::map< ExecutionState*, std::vector<SeedInfo> >::iterator it =
      seedMap.find(&state);
    //cyj: 如果使用seed模式, 每个SeedInfo生成一个与array对应的vector<unsigned char>,
    //cyj: 值为KTestObject的bytes.
    if (it!=seedMap.end()) { // In seed mode we need to add this as a
                             // binding.
      for (std::vector<SeedInfo>::iterator siit = it->second.begin(),
             siie = it->second.end(); siit != siie; ++siit) {
        SeedInfo &si = *siit;
        KTestObject *obj = si.getNextInput(mo, NamedSeedMatching);
        						//cyj: 为MemoryObject返回一个KTestObject

        if (!obj) {	//cyj: 如果没有找到KTestObject
          if (ZeroSeedExtension) {	//cyj: 用0扩充array所对应的vector<unsigned char>
            std::vector<unsigned char> &values = si.assignment.bindings[array];
            values = std::vector<unsigned char>(mo->size, '\0');
          } else if (!AllowSeedExtension) {	//cyj: 如果不允许扩充seed, 终结该state
            terminateStateOnError(state,
                                  "ran out of inputs during seeding",
                                  "user.err");
            break;
          }
        } else {	//cyj: 找到相应的KTestObject
          if (obj->numBytes != mo->size &&
              ((!(AllowSeedExtension || ZeroSeedExtension)
                && obj->numBytes < mo->size) ||
               (!AllowSeedTruncation && obj->numBytes > mo->size))) {	//cyj: 长度不匹配
	    std::stringstream msg;
	    msg << "replace size mismatch: "
		<< mo->name << "[" << mo->size << "]"
		<< " vs " << obj->name << "[" << obj->numBytes << "]"
		<< " in test\n";

            terminateStateOnError(state,
                                  msg.str(),
                                  "user.err");
            break;
          } else {	//cyj: 生成与array对应的vector<unsigned char>, 值为KTestObject的bytes
            std::vector<unsigned char> &values = si.assignment.bindings[array];
            	//cyj: typedef std::map<const Array*, std::vector<unsigned char> > bindings
            values.insert(values.begin(), obj->bytes,
                          obj->bytes + std::min(obj->numBytes, mo->size));
            				//cyj: 在指定位置begin前插入区间[arg2, arg3)的所有元素
            if (ZeroSeedExtension) {
              for (unsigned i=obj->numBytes; i<mo->size; ++i)
                values.push_back('\0');
            }
          }
        }
      }
    }	//cyj: end if (it!=seedMap.end())
  }		//cyj: end if (!replayOut)
  else {//cyj: if (replayOut)
    //cyj: 如果使用了replay, 将replayOut的第replayPosition个objects的bytes写入ObjectState中
	ObjectState *os = bindObjectInState(state, mo, false);
    						//cyj: 根据MemoryObject新建一个ObjectState, 绑定为一个pair
    if (replayPosition >= replayOut->numObjects) {
      terminateStateOnError(state, "replay count mismatch", "user.err");
    } else {
      KTestObject *obj = &replayOut->objects[replayPosition++];
      if (obj->numBytes != mo->size) {
        terminateStateOnError(state, "replay size mismatch", "user.err");
      } else {
        for (unsigned i=0; i<mo->size; i++)
          os->write8(i, obj->bytes[i]);
      }
    }
  }
}


void LIExecutor::getPointerInfoOfStruct(LLVM_TYPE_Q llvm::Type *structType,
					ExecutionState &state, uint64_t base, std::string structName, bool isNewCreateObject){

	for(unsigned int i=0; i<structType->getNumContainedTypes(); i++){
		Type *elemType = structType->getContainedType(i);

		if(elemType->isPointerTy()){	//cyj: 如果该成员类型为指针类型, 则添加到pointerMap里
			uint64_t pointerOffset = this->kmodule->targetData->getStructLayout(dyn_cast<StructType>(structType))->getElementOffset(i);
			uint64_t pointerAddress = base + pointerOffset;
			state.pointerBeAccessed[pointerAddress] = false;

			std::string pointerName;
			if(structMDNodeInfo.find(structType) != structMDNodeInfo.end()){
				pointerName = structMDNodeInfo[structType][i];
			} else {
				std::stringstream nameStream;
				nameStream << "field[" << i << "]";
				pointerName = nameStream.str();
			}	//cyj: 得到指针的名字

			if(isNewCreateObject){
				PointerInfo *pointerInfo = new PointerInfo(elemType->getPointerElementType(),
								pointerAddress, structName, pointerName, MOIsNewCreateStruct);	//cyj: get information of pointer
				this->symbolicPointerInfoMap[pointerAddress] = pointerInfo;
			} else {
				PointerInfo *pointerInfo = new PointerInfo(elemType->getPointerElementType(),
								pointerAddress, structName, pointerName, MOIsStruct);	//cyj: get information of pointer
				this->symbolicPointerInfoMap[pointerAddress] = pointerInfo;
			}

		}//end 指针类型
		else if(elemType->isStructTy()){		//cyj: 如果是嵌套结构体
		/*	uint64_t structOffset = this->kmodule->targetData->getStructLayout(dyn_cast<StructType>(structType))->getElementOffset(i);
			uint64_t structAddress = base + structOffset;
			std::string elemName;
			if(structMDNodeInfo.find(structType) != structMDNodeInfo.end()){
				elemName = structMDNodeInfo[structType][i];
			} else {
				std::stringstream nameStream;
				nameStream << "field[" << i << "]";
				elemName = nameStream.str();
			}
			structName += "." + elemName;
			getPointerInfoOfStruct(elemType, state, structAddress, structName); */
		}
	}//end for
}


void LIExecutor::lazyInitialization(ExecutionState &current, uint64_t address, ObjectPair op, ref<Expr> offset, Expr::Width type){

	PointerInfo *pointerInfo = this->symbolicPointerInfoMap.find(address)->second;
	Type *typePointTo = pointerInfo->getTypePointTo();

	switch(typePointTo->getTypeID()){
	case llvm::Type::StructTyID : {		//该指针指向结构体
		lazyInitializationOfStructType(current, pointerInfo, op, offset, type);
		break;
	}
	case llvm::Type::IntegerTyID : {	//该指针指向char/int/void/short/long
		lazyInitializationOfIntegerType(current, pointerInfo, op, offset, type);
		break;
	}
	case llvm::Type::PointerTyID : {	//该指针指向指针
		lazyInitializationOfPointerType(current, pointerInfo, op, offset, type);
		break;	//case break
	}
	case llvm::Type::FloatTyID : 	//该指针指向float
	case llvm::Type::DoubleTyID : {	//该指针指向double
		lazyInitializationOfFloatType(current, pointerInfo, op, offset, type);
		break;	//case break
	}

	default:
		assert("Error: LIExecutor-lazyInitialization()!");
		break;
	}
}


void LIExecutor::writeAndReadAfterStateFork(const ObjectState *os, ref<Expr> offset,
				ref<Expr> value, const MemoryObject *mo, ExecutionState &state, Expr::Width type){

	ObjectState *wos = state.addressSpace.getWriteable(mo, os);
	wos->write(offset, value);

	KInstruction *target = state.prevPC;
	if (type) {	//case: load指令时懒初始化
		ref<Expr> result = wos->read(offset, type);
		if (interpreterOpts.MakeConcreteSymbolic)
			result = replaceReadWithSymbolic(state, result);
		bindLocal(target, state, result);
	}
	else {	//case: store指令第一个参数为符号化指针, 进行懒初始化. (type=0)
		state.stack.back().locals[target->operands[0]].value = value;
	}
}


ExecutionState *LIExecutor::lazyIniStateFork(ExecutionState *state, const std::vector<std::string> previousInfo) {

	ExecutionState *forkState = new ExecutionState(*state, previousInfo);
	forkState->coveredNew = false;
	forkState->coveredLines.clear();

	++stats::forks;
	addedStates.insert(forkState);

	state->ptreeNode->data = 0;
	std::pair<PTree::Node*, PTree::Node*> res = processTree->split(state->ptreeNode, forkState, state);
	forkState->ptreeNode = res.first;
	state->ptreeNode = res.second;

	return forkState;
}


ExecutionState *LIExecutor::outOfBoundFork(ExecutionState *state) {
	ExecutionState *forkState = new ExecutionState(*state);
	forkState->coveredNew = false;
	forkState->coveredLines.clear();

	++stats::forks;
	addedStates.insert(forkState);

	state->ptreeNode->data = 0;
	std::pair<PTree::Node*, PTree::Node*> res = processTree->split(state->ptreeNode, forkState, state);
	forkState->ptreeNode = res.first;
	state->ptreeNode = res.second;

	return forkState;
}


MemoryObject *LIExecutor::lazyIniCreateNewStructObject(ExecutionState &state, llvm::Type *type) {

	uint64_t newObjectSize =  this->kmodule->targetData->getTypeAllocSize(type);
	MemoryObject *mo = memory->allocate(newObjectSize, false, false, 0); //cyj: isLocal: 栈是true, 堆是false
	assert(mo && "Can't allocate a new object!");

	std::stringstream newName;
	newName << "newStructObject_" << ++newStructObjectNum;
	mo->setName(newName.str());	// "newStructObject_1"
	state.LICreateStructObject.insert(std::make_pair(type, std::make_pair(mo->address, mo->name)));
	state.stack.back().allocas.push_back(mo);

	//ObjectState *os = new ObjectState(mo);
	//state.addressSpace.bindObject(mo, os);

	return mo;
}


MemoryObject *LIExecutor::lazyIniCreateNewArrayObject(ExecutionState &state, llvm::Type *type) {
	//这里把新建的MO添加到state.stack中, 并没有添加到addressSpace中, 但是在符号化该MO的时候, 通过bindObjectInState()添加到addressSpace
	uint64_t newObjectSize = 0;
	if(this->kmodule->targetData->getTypeAllocSize(type) == 1)
		newObjectSize = maxCharArraySize;
	else if(this->kmodule->targetData->getTypeAllocSize(type) == 2)
		newObjectSize = maxIntArraySize * 2;
	else if(this->kmodule->targetData->getTypeAllocSize(type) == 4)
		newObjectSize = maxIntArraySize * 4;
	else if(this->kmodule->targetData->getTypeAllocSize(type) == 8) {
		if(type->isPointerTy())
			newObjectSize = maxPointerArraySize * 8;	// long
		else
			newObjectSize = maxIntArraySize * 8;	// 双重指针
	}
	else
		assert("Error: lazyIniCreateNewArrayObject()");
	MemoryObject *mo = memory->allocate(newObjectSize, false, false, 0); //cyj: isLocal: 栈是true, 堆是false
	assert(mo && "Can't allocate a new object!");

	std::stringstream newName;
	if(type->isPointerTy())
		newName << "newArrayObjectPointer_" << ++newPointerArrayObjectNum;
	else
		newName << "newArrayObject_" << ++newArrayObjectNum;
	mo->setName(newName.str());

	//添加符号化变量symbolicSize, 用来记录该ArrayObject解引用的符号化size信息
	MemoryObject *symbolicSizeMO = memory->allocate(sizeof(uint64_t), false, false, 0);
	symbolicSizeMO->setName(newName.str() + "_size");	// "newArrayObject_1_size"
	LIExecutor::executeMakeSymbolic(state, symbolicSizeMO, symbolicSizeMO->name);
	state.arrayObjectSymbolicSize[mo->address] = symbolicSizeMO;
	ObjectState *symbolicSizeOS = state.addressSpace.objects.find(symbolicSizeMO)->second;
	ref<Expr> symbolicSize = symbolicSizeOS->read(0, Expr::Int64);

	if(this->kmodule->targetData->getTypeAllocSize(type) == 1){		// maxCharArraySize >= symbolicSize
		addConstraint(state, UgeExpr::create(symbolicSize, ConstantExpr::create(1, Expr::Int64)));	// symbolicSize >=1
		addConstraint(state, UgeExpr::create(ConstantExpr::create(maxCharArraySize, Expr::Int64), symbolicSize));
	} else if(this->kmodule->targetData->getTypeAllocSize(type) == 2){		// maxIntArraySize*2 >= symbolicSize
			addConstraint(state, UgeExpr::create(symbolicSize, ConstantExpr::create(2, Expr::Int64)));	// symbolicSize >=4
			addConstraint(state, UgeExpr::create(ConstantExpr::create(maxIntArraySize*2, Expr::Int64), symbolicSize));
	} else if(this->kmodule->targetData->getTypeAllocSize(type) == 4){		// maxIntArraySize*4 >= symbolicSize
		addConstraint(state, UgeExpr::create(symbolicSize, ConstantExpr::create(4, Expr::Int64)));	// symbolicSize >=4
		addConstraint(state, UgeExpr::create(ConstantExpr::create(maxIntArraySize*4, Expr::Int64), symbolicSize));
	} else if(this->kmodule->targetData->getTypeAllocSize(type) == 8){
		addConstraint(state, UgeExpr::create(symbolicSize, ConstantExpr::create(8, Expr::Int64)));	// symbolicSize >=8
		if(type->isArrayTy())													// maxIntArraySize*8 >= symbolicSize
			addConstraint(state, UgeExpr::create(ConstantExpr::create(maxIntArraySize*8, Expr::Int64), symbolicSize));
		else																	// maxPointerArraySize*8 >= symbolicSize
			addConstraint(state, UgeExpr::create(ConstantExpr::create(maxPointerArraySize*8, Expr::Int64), symbolicSize));
	} else assert("lazyIniCreateNewArrayObject_ERROR");

	//ObjectState *os = new ObjectState(mo);
	//state.addressSpace.bindObject(mo, os);

	return mo;
}


MemoryObject *LIExecutor::lazyIniCreateNewFloatArrayObject(ExecutionState &state, llvm::Type *type) {
	//这里把新建的MO添加到state.stack中, 并没有添加到addressSpace中, 但是在符号化该MO的时候, 通过bindObjectInState()添加到addressSpace
	uint64_t newObjectSize = 0;
	if(type->isFloatTy())
		newObjectSize = maxFloatArraySize * 4;
	else if(type->isDoubleTy())
		newObjectSize = maxFloatArraySize * 8;
	else
		assert("Error: lazyIniCreateNewFloatArrayObject()");
	MemoryObject *mo = memory->allocate(newObjectSize, false, false, 0); //cyj: isLocal: 栈是true, 堆是false
	assert(mo && "Can't allocate a new object!");

	std::stringstream newName;
	newName << "newArrayObjectFloat_" << ++newFloatArrayObjectNum;
	mo->setName(newName.str());

	//添加符号化变量symbolicSize, 用来记录该ArrayObject解引用的符号化size信息
	MemoryObject *symbolicSizeMO = memory->allocate(sizeof(uint64_t), false, false, 0);
	symbolicSizeMO->setName(newName.str() + "_size");	// "newFloatArrayObject_1_size"
	LIExecutor::executeMakeSymbolic(state, symbolicSizeMO, symbolicSizeMO->name);
	state.arrayObjectSymbolicSize[mo->address] = symbolicSizeMO;
	ObjectState *symbolicSizeOS = state.addressSpace.objects.find(symbolicSizeMO)->second;
	ref<Expr> symbolicSize = symbolicSizeOS->read(0, Expr::Int64);

	if(type->isFloatTy()){		// maxFloatArraySize*4 >= symbolicSize
		addConstraint(state, UgeExpr::create(symbolicSize, ConstantExpr::create(4, Expr::Int64)));	// symbolicSize >=4
		addConstraint(state, UgeExpr::create(ConstantExpr::create(maxFloatArraySize*4, Expr::Int64), symbolicSize));
	} else if(type->isDoubleTy()){			// maxFloatArraySize*8 >= symbolicSize
		addConstraint(state, UgeExpr::create(symbolicSize, ConstantExpr::create(8, Expr::Int64)));	// symbolicSize >=8
		addConstraint(state, UgeExpr::create(ConstantExpr::create(maxFloatArraySize*8, Expr::Int64), symbolicSize));
	} else
		assert("lazyIniCreateNewFloatArrayObject_ERROR");

	//ObjectState *os = new ObjectState(mo);
	//state.addressSpace.bindObject(mo, os);

	return mo;
}


void LIExecutor::lazyInitializationOfStructType(ExecutionState &current, PointerInfo *pointerInfo,
													ObjectPair op, ref<Expr> offset, Expr::Width type) {
	//cyj: 这里的参数op是指针所属的结构体的op
	// This ObjectState can't be readOnly!
	const ObjectState *os = op.second;
	if (os->readOnly) {
		terminateStateOnError(current, "memory error: object read only",
				"readonly.err");
		return;
	}
	const MemoryObject *mo = op.first;
	std::vector<std::string> previousInfo = current.lazyIniInfo;
	Type *typePointTo = pointerInfo->getTypePointTo();

	unsigned int forkNum = 0;	//record the number of LazyIniStatefork.
	unsigned int fatherNum = 1;	//record the number of state fork's fathers, is power of 2
	unsigned index = 0;
	std::vector<ExecutionState *> fatherStateVector;
	fatherStateVector.push_back(&current);

	//case1: next = &(each existence Struct Node object)
	for (std::set<const MemoryObject *>::iterator it =
			current.defineBeforeStructSymbolic[mo].begin(), ie =
			current.defineBeforeStructSymbolic[mo].end(); it != ie; ++it) {
		if ((*it)->allocSite->getType()->getPointerElementType()
				== typePointTo) {	// struct Node node1
			++forkNum;
			index = (forkNum + 1) % fatherNum;// the purpose of +1 is to 最后再fork NULL(current)状态
			if (index == 0)
				fatherNum *= 2;	// 这层已经fork完, 需要在下一层fork
			ExecutionState *fatherState = fatherStateVector[index];
			ExecutionState *existenceState = lazyIniStateFork(fatherState, previousInfo);
			fatherStateVector.push_back(existenceState);

			ref<Expr> existenceAddress = (*it)->getBaseExpr();
			writeAndReadAfterStateFork(os, offset, existenceAddress, mo,
					*existenceState, type);

			std::string nameString;
			if ((*it)->name.compare("unnamed"))
				nameString = "&" + (*it)->name;
			else{
				std::stringstream addressStream;
				addressStream << (*it)->address;
				nameString = addressStream.str();
			}
			std::string existenceInfo = getLazyInitializationInfo(pointerInfo, nameString);
			existenceInfo += "\t// define";
			existenceState->lazyIniInfo.push_back(existenceInfo);
		}
	}
	for (ExecutionState::sturctMallocInfo::iterator it =
			current.mallocBeforeStructSymbolic[mo].begin(), ie =
			current.mallocBeforeStructSymbolic[mo].end(); it != ie; ++it) {
		if (it->first == typePointTo) {	// struct Node *node1;	node1 = malloc(sizeof(struct Node))
			++forkNum;
			index = (forkNum + 1) % fatherNum;// the purpose of +1 is to 最后再fork NULL(current)状态
			if (index == 0)
				fatherNum *= 2;	// 这层已经fork完, 需要在下一层fork
			ExecutionState *fatherState = fatherStateVector[index];
			ExecutionState *existenceState = lazyIniStateFork(fatherState, previousInfo);
			fatherStateVector.push_back(existenceState);

			writeAndReadAfterStateFork(os, offset, it->second, mo, *existenceState, type);

			std::stringstream addressStream;
			addressStream << dyn_cast<ConstantExpr>(it->second)->getZExtValue();
			std::string addressString = addressStream.str();
			std::string mallocInfo = getLazyInitializationInfo(pointerInfo, addressString);
			mallocInfo += "\t// malloc";
			existenceState->lazyIniInfo.push_back(mallocInfo);
		}
	}
	for (std::set<std::pair<llvm::Type *, std::pair<uint64_t, std::string> > >::iterator
			setit = current.LICreateStructObject.begin(), setie =
					current.LICreateStructObject.end(); setit != setie;
			++setit) {
		if (setit->first == typePointTo) {
			++forkNum;
			index = (forkNum + 1) % fatherNum;// the purpose of +1 is to 最后再fork NULL(current)状态
			if (index == 0)
				fatherNum *= 2;	// 这层已经fork完, 需要在下一层fork
			ExecutionState *fatherState = fatherStateVector[index];
			ExecutionState *existenceState = lazyIniStateFork(fatherState, previousInfo);
			fatherStateVector.push_back(existenceState);

			ref<Expr> existenceAddress = ConstantExpr::create(
					setit->second.first, Context::get().getPointerWidth());
			writeAndReadAfterStateFork(os, offset, existenceAddress, mo,
					*existenceState, type);

			std::string existenceInfo = getLazyInitializationInfo(pointerInfo, setit->second.second);
			existenceState->lazyIniInfo.push_back(existenceInfo);
		}
	}

	//case2: next = &(new Struct Node object)
	++forkNum;
	index = (forkNum + 1) % fatherNum;// the purpose of +1 is to 最后再fork NULL(current)状态
	ExecutionState *fatherState = fatherStateVector[index];
	ExecutionState *newObjectState = lazyIniStateFork(fatherState, previousInfo);

	MemoryObject *newMO = lazyIniCreateNewStructObject(*newObjectState,
			typePointTo);
	LIExecutor::executeMakeSymbolic(*newObjectState, newMO, newMO->name);
	ref<Expr> newObjectAddress = ConstantExpr::create(newMO->address,
			Context::get().getPointerWidth());
	writeAndReadAfterStateFork(os, offset, newObjectAddress, mo,
			*newObjectState, type);

	std::string structName = typePointTo->getStructName().str();// "struct.Node"
	structName = structName.replace(structName.find('.'), 1, " ");// "struct Node"
	std::string newObjectInfo1 = structName + " *" + newMO->name
			+ " = malloc(sizeof(" + structName + "));";
	// "struct Node *newObject_1 = malloc(sizeof(struct Node));"
	std::string newObjectInfo2 = getLazyInitializationInfo(pointerInfo, newMO->name);
	newObjectState->lazyIniInfo.push_back(newObjectInfo1);
	newObjectState->lazyIniInfo.push_back(newObjectInfo2);

	std::set<const MemoryObject *> defineBeforeSymbolic =
			newObjectState->defineBeforeStructSymbolic[mo];
	newObjectState->defineBeforeStructSymbolic[newMO] = defineBeforeSymbolic;
	ExecutionState::sturctMallocInfo mallocBeforeSymbolic =
			newObjectState->mallocBeforeStructSymbolic[mo];
	newObjectState->mallocBeforeStructSymbolic[newMO] = mallocBeforeSymbolic;

	//case3: next = NULL
	ExecutionState *nullState = &current;
	ref<Expr> nullValue = ConstantExpr::create(0, Context::get().getPointerWidth());
	writeAndReadAfterStateFork(os, offset, nullValue, mo, *nullState, type);

	std::string nullInfo = getLazyInitializationInfo(pointerInfo, "NULL");
	nullState->lazyIniInfo.push_back(nullInfo);
	//terminateStateOnError(*nullState, "memory error: point to 0", "ptr.err");

	fatherStateVector.clear();
}


void LIExecutor::lazyInitializationOfIntegerType(ExecutionState &current, PointerInfo *pointerInfo,
													ObjectPair op, ref<Expr> offset, Expr::Width type) {
	//cyj: 这里的参数op是指针所属的结构体的op
	// This ObjectState can't be readOnly!
	const ObjectState *os = op.second;
	if (os->readOnly) {
		terminateStateOnError(current, "memory error: object read only",
				"readonly.err");
		return;
	}
	const MemoryObject *mo = op.first;
	Type *typePointTo = pointerInfo->getTypePointTo();

	//case1: pointer = &(new array object)
	ExecutionState *newObjectState = lazyIniStateFork(&current, current.lazyIniInfo);
	MemoryObject *newMO = lazyIniCreateNewArrayObject(*newObjectState, typePointTo);
	//添加具体变量maxDereferenceOffset, 用来记录该ArrayObject解引用的最大具体size
	newObjectState->maxDereferenceSize[newMO->address] = 0;		//FIXME: 是否考虑地址处不存在MO的情况?
	LIExecutor::executeMakeSymbolic(*newObjectState, newMO, newMO->name);
	ref<Expr> newObjectAddress = ConstantExpr::create(newMO->address, Context::get().getPointerWidth());
	writeAndReadAfterStateFork(os, offset, newObjectAddress, mo, *newObjectState, type);

	std::stringstream newObjectInfo1;
	if(this->kmodule->targetData->getTypeAllocSize(typePointTo) == 1)
		newObjectInfo1 << "char *" << newMO->name << " = malloc(size1);";
		// "char *newArrayObject_1 = malloc(...);"
	else if(this->kmodule->targetData->getTypeAllocSize(typePointTo) == 2)
		newObjectInfo1 << "unsigned short *" << newMO->name << " = malloc(size2);";
		// "unsigned short *newArrayObject_1 = malloc(...);"
	else if(this->kmodule->targetData->getTypeAllocSize(typePointTo) == 4)
		newObjectInfo1 << "unsigned int *" << newMO->name << " = malloc(size4);";
		// "unsigned *newArrayObject_1 = malloc(...);"
	else if(this->kmodule->targetData->getTypeAllocSize(typePointTo) == 8)
		newObjectInfo1 << "unsigned long *" << newMO->name << " = malloc(size8);";
		// "unsigned long *newArrayObject_1 = malloc(...);"
	else
		assert("Error: LIExecutor-lazyInitializationOfInterType()!");

	std::string newObjectInfo2 = getLazyInitializationInfo(pointerInfo, newMO->name);
	newObjectState->lazyIniInfo.push_back(newObjectInfo1.str());
	newObjectState->lazyIniInfo.push_back(newObjectInfo2);

	//case2: pointer = NULL
	ExecutionState *nullState = &current;
	ref<Expr> nullValue = ConstantExpr::create(0, Context::get().getPointerWidth());
	writeAndReadAfterStateFork(os, offset, nullValue, mo, *nullState, type);

	std::string nullInfo = getLazyInitializationInfo(pointerInfo, "NULL");
	nullState->lazyIniInfo.push_back(nullInfo);
	//terminateStateOnError(*nullState, "memory error: point to 0", "ptr.err");
}

void LIExecutor::lazyInitializationOfFloatType(ExecutionState &current, PointerInfo *pointerInfo,
													ObjectPair op, ref<Expr> offset, Expr::Width type) {
	//cyj: 这里的参数op是指针所属的结构体的op
	// This ObjectState can't be readOnly!
	const ObjectState *os = op.second;
	if (os->readOnly) {
		terminateStateOnError(current, "memory error: object read only",
				"readonly.err");
		return;
	}
	const MemoryObject *mo = op.first;
	Type *typePointTo = pointerInfo->getTypePointTo();

	//case1: pointer = &(new array object)
	ExecutionState *newObjectState = lazyIniStateFork(&current, current.lazyIniInfo);
	MemoryObject *newMO = lazyIniCreateNewFloatArrayObject(*newObjectState, typePointTo);
	//添加具体变量maxDereferenceOffset, 用来记录该ArrayObject解引用的最大具体size
	newObjectState->maxDereferenceSize[newMO->address] = 0;		//FIXME: 是否考虑地址处不存在MO的情况?
	LIExecutor::executeMakeSymbolic(*newObjectState, newMO, newMO->name);
	ref<Expr> newObjectAddress = ConstantExpr::create(newMO->address, Context::get().getPointerWidth());
	writeAndReadAfterStateFork(os, offset, newObjectAddress, mo, *newObjectState, type);

	std::stringstream newObjectInfo1;
	if(typePointTo->isFloatTy())
		newObjectInfo1 << "float *" << newMO->name << " = malloc(sizeF);";
		// "float *newFloatArrayObject_1 = malloc(...);"
	else if(typePointTo->isDoubleTy())
		newObjectInfo1 << "double *" << newMO->name << " = malloc(sizeD);";
		// "double *newFloatArrayObject_1 = malloc(...);"
	else
		assert("Error: LIExecutor-lazyInitializationOfFloatType()!");

	std::string newObjectInfo2 = getLazyInitializationInfo(pointerInfo, newMO->name);
	newObjectState->lazyIniInfo.push_back(newObjectInfo1.str());
	newObjectState->lazyIniInfo.push_back(newObjectInfo2);

	//case2: pointer = NULL
	ExecutionState *nullState = &current;
	ref<Expr> nullValue = ConstantExpr::create(0, Context::get().getPointerWidth());
	writeAndReadAfterStateFork(os, offset, nullValue, mo, *nullState, type);

	std::string nullInfo = getLazyInitializationInfo(pointerInfo, "NULL");
	nullState->lazyIniInfo.push_back(nullInfo);
	//terminateStateOnError(*nullState, "memory error: point to 0", "ptr.err");
}


void LIExecutor::lazyInitializationOfPointerType(ExecutionState &current, PointerInfo *pointerInfo,
													ObjectPair op, ref<Expr> offset, Expr::Width type) {
	//cyj: 这里的参数op是指针所属的结构体的op
	// This ObjectState can't be readOnly!
	const ObjectState *os = op.second;
	if (os->readOnly) {
		terminateStateOnError(current, "memory error: object read only",
				"readonly.err");
		return;
	}
	const MemoryObject *mo = op.first;
	Type *typePointTo = pointerInfo->getTypePointTo();

	//case1: pointer = &(new array object)
	ExecutionState *newObjectState = lazyIniStateFork(&current, current.lazyIniInfo);
	MemoryObject *newMO = lazyIniCreateNewArrayObject(*newObjectState, typePointTo);
	//添加具体变量maxDereferenceOffset, 用来记录该ArrayObject解引用的最大具体size
	newObjectState->maxDereferenceSize[newMO->address] = 0;		//FIXME: 是否考虑地址处不存在MO的情况?
	LIExecutor::executeMakeSymbolic(*newObjectState, newMO, newMO->name);
	ref<Expr> newObjectAddress = ConstantExpr::create(newMO->address, Context::get().getPointerWidth());
	writeAndReadAfterStateFork(os, offset, newObjectAddress, mo, *newObjectState, type);
	newObjectState->pointToPointerArrayName[newMO->address] = newMO->name;
	newObjectState->pointToPointerArrayType[newMO->address] = typePointTo->getPointerElementType();

	newObjectState->pointerBeAccessed[newMO->address] = false;
	PointerInfo *newPointerInfo = new PointerInfo(typePointTo->getPointerElementType(),
			newMO->address, "", newMO->name + "[0]", MOIsNewCreatePinterArray);	// 对第一个指针懒初始化准备
	this->symbolicPointerInfoMap[newMO->address] = newPointerInfo;
	newObjectState->pointToPointerLIOffset[newMO->address] = 0;

	std::stringstream newObjectInfo1;
	newObjectInfo1 << "unsigned long *" << newMO->name << " = malloc(sizeP);";
	//"unsigned long *newPointerArrayObject_1 = malloc(sizeP);"
	std::string newObjectInfo2 = getLazyInitializationInfo(pointerInfo, newMO->name);
	newObjectState->lazyIniInfo.push_back(newObjectInfo1.str());
	newObjectState->lazyIniInfo.push_back(newObjectInfo2);

	//case2: pointer = NULL
	ExecutionState *nullState = &current;
	ref<Expr> nullValue = ConstantExpr::create(0, Context::get().getPointerWidth());
	writeAndReadAfterStateFork(os, offset, nullValue, mo, *nullState, type);

	std::string nullInfo = getLazyInitializationInfo(pointerInfo, "NULL");
	nullState->lazyIniInfo.push_back(nullInfo);
	//terminateStateOnError(*nullState, "memory error: point to 0", "ptr.err");
}


std::string LIExecutor::getLazyInitializationInfo(PointerInfo *pointerInfo, std::string name) {
	std::string info;
	std::string structNamePointerBelong = pointerInfo->getStructNamePointerBelong();
	std::string pointerName = pointerInfo->getPointerName();
	SymbolicMOKind symbolicMOKind = pointerInfo->getSymbolicMOKind();	//cyj: 参数MemoryObject的类型

	switch (symbolicMOKind) {
	case MOIsPointer:
		break;
	case MOIsStruct: {
		info = structNamePointerBelong + ".";
		break;
	}
	case MOIsNewCreateStruct: {
		info = structNamePointerBelong + "->";
		break;
	}
	default:
		assert("Error: LIExecutor-getLazyInitializationInfo()");
		break;
	}
	info += pointerName + " = " + name + ";";
	return info;
}


void LIExecutor::terminateStateOnExit(ExecutionState &state) {
  if (!OnlyOutputExceptionStates && (!OnlyOutputStatesCoveringNew || state.coveredNew ||
      (AlwaysOutputSeeds && seedMap.count(&state))))
    interpreterHandler->processTestCase(state, 0, 0);
  terminateState(state);
}


void LIExecutor::terminateStateOnError(ExecutionState &state,
                                     const llvm::Twine &messaget,
                                     const char *suffix,
                                     const llvm::Twine &info) {
  std::string message = messaget.str();
  Instruction * lastInst;
  const InstructionInfo &ii = getLastNonKleeInternalInstruction(state, &lastInst);

  if (EmitAllErrors ||			//cyj: EmitAllErrors = false
      emittedErrors.insert(std::make_pair(lastInst, message)).second) {	//cyj: second为true说明插入成功, 若插入内容与set中重复, 则插入失败
	if (ii.file != "") {
      klee_message("ERROR: %s:%d: %s", ii.file.c_str(), ii.line, message.c_str());
    } else {
      klee_message("ERROR: (location information missing) %s", message.c_str());
    }
    if (!EmitAllErrors)
      klee_message("NOTE: now ignoring this error at this location");

    std::string MsgString;
    llvm::raw_string_ostream msg(MsgString);
    msg << "Error: " << message << "\n";
    if (ii.file != "") {
      msg << "File: " << ii.file << "\n";
      msg << "Line: " << ii.line << "\n";
      msg << "assembly.ll line: " << ii.assemblyLine << "\n";
    }
    msg << "Stack: \n";
    state.dumpStack(msg);

    std::string info_str = info.str();
    if (info_str != "")
      msg << "Info: \n" << info_str;

    interpreterHandler->processTestCase(state, msg.str().c_str(), suffix);		//cyj: 生成相应的.err文件
  }

  terminateState(state);
}


void LIExecutor::resetEmittedErrors(){
	emittedErrors.clear();
}

//cyj: 将module中的每个函数/别名及其地址引用的map放在globalAddresses中,
//cyj: 将module中的每个全局变量创建MemoryObject与ObjectState,
//cyj: 将Expr与MemoryObject存入globalAddresses与globalObjects的Map中,
//cyj: 并对每个全局变量进行初始化
void LIExecutor::initializeGlobals(ExecutionState &state) {
  Module *m = kmodule->module;

  if (m->getModuleInlineAsm() != "")
	  	 //cyj: getModuleInlineAsm: returns a string containing the module-scope inline assembly blocks
    klee_warning("executable has module level assembly (ignoring)");
#if LLVM_VERSION_CODE < LLVM_VERSION(3, 3)
  assert(m->lib_begin() == m->lib_end() &&
         "XXX do not support dependent libraries");
#endif
  // represent function globals using the address of the actual llvm function
  // object. given that we use malloc to allocate memory in states this also
  // ensures that we won't conflict. we don't need to allocate a memory object
  // since reading/writing via a function pointer is unsupported anyway.
  //cyj: for循环作用: 将module中的每个函数及其地址引用的map放在globalAddresses中
  for (Module::iterator i = m->begin(), ie = m->end(); i != ie; ++i) {
    Function *f = i;
    ref<ConstantExpr> addr(0);		//cyj: ref为"引用"类型, 成员包括指向ConstantExpr的指针

    // If the symbol has external weak linkage then it is implicitly
    // not defined in this module; if it isn't resolvable then it
    // should be null.
    if (f->hasExternalWeakLinkage() &&
        !externalDispatcher->resolveSymbol(f->getName())) {
      addr = Expr::createPointer(0);
    } else {
      addr = Expr::createPointer((unsigned long) (void*) f);
      legalFunctions.insert((uint64_t) (unsigned long) (void*) f);
    }

    globalAddresses.insert(std::make_pair(f, addr));
  }

  // Disabled, we don't want to promote use of live externals.
#ifdef HAVE_CTYPE_EXTERNALS
#ifndef WINDOWS
#ifndef DARWIN
  /* From /usr/include/errno.h: it [errno] is a per-thread variable. */
  int *errno_addr = __errno_location();
  	  	  	  //cyj: errno 是记录系统的最后一次错误代码。代码是一个int型的值，在errno.h中定义
  addExternalObject(state, (void *)errno_addr, sizeof *errno_addr, false);
  	  	  	  //cyj: 创建MemoryObject与ObjectState, ObjectState的concreteStore为errno
  /* from /usr/include/ctype.h:
       These point into arrays of 384, so they can be indexed by any `unsigned
       char' value [0,255]; by EOF (-1); or by any `signed char' value
       [-128,-1).  ISO C requires that the ctype functions work for `unsigned */
  const uint16_t **addr = __ctype_b_loc();
  addExternalObject(state, const_cast<uint16_t*>(*addr-128),
                    384 * sizeof **addr, true);
  addExternalObject(state, addr, sizeof(*addr), true);

  const int32_t **lower_addr = __ctype_tolower_loc();
  addExternalObject(state, const_cast<int32_t*>(*lower_addr-128),
                    384 * sizeof **lower_addr, true);
  addExternalObject(state, lower_addr, sizeof(*lower_addr), true);

  const int32_t **upper_addr = __ctype_toupper_loc();
  addExternalObject(state, const_cast<int32_t*>(*upper_addr-128),
                    384 * sizeof **upper_addr, true);
  addExternalObject(state, upper_addr, sizeof(*upper_addr), true);
#endif
#endif
#endif

  // allocate and initialize globals, done in two passes since we may
  // need address of a global in order to initialize some other one.

  // allocate memory objects for all globals
  //cyj: for循环作用: 对module中的每个全局变量创建MemoryObject与ObjectState,
  for (Module::const_global_iterator i = m->global_begin(),
         e = m->global_end();
       i != e; ++i) {
#if allowExternGlobal == true
	if (false) {
#else
	if (i->isDeclaration()) {
#endif
      // FIXME: We have no general way of handling unknown external
      // symbols. If we really cared about making external stuff work
      // better we could support user definition, or use the EXE style
      // hack where we check the object file information.

      LLVM_TYPE_Q Type *ty = i->getType()->getElementType();
      uint64_t size = kmodule->targetData->getTypeStoreSize(ty);

      // XXX - DWD - hardcode some things until we decide how to fix.
#ifndef WINDOWS
      if (i->getName() == "_ZTVN10__cxxabiv117__class_type_infoE") {
        size = 0x2C;
      } else if (i->getName() == "_ZTVN10__cxxabiv120__si_class_type_infoE") {
        size = 0x2C;
      } else if (i->getName() == "_ZTVN10__cxxabiv121__vmi_class_type_infoE") {
        size = 0x2C;
      }
#endif

      if (size == 0) {
        llvm::errs() << "Unable to find size for global variable: "
                     << i->getName()
                     << " (use will result in out of bounds access)\n";
      }

      MemoryObject *mo = memory->allocate(size, false, true, i);
      ObjectState *os = bindObjectInState(state, mo, false);
      globalObjects.insert(std::make_pair(i, mo));
      globalAddresses.insert(std::make_pair(i, mo->getBaseExpr()));

      // Program already running = object already initialized.  Read
      // concrete value and write it to our copy.
      if (size) {
        void *addr;
        if (i->getName() == "__dso_handle") {
          addr = &__dso_handle; // wtf ?
        } else {
          addr = externalDispatcher->resolveSymbol(i->getName());
        }
        if (!addr)
          klee_error("unable to load symbol(%s) while initializing globals.",
                     i->getName().data());

        for (unsigned offset=0; offset<mo->size; offset++)
          os->write8(offset, ((unsigned char*)addr)[offset]);
      }
    } else {
      LLVM_TYPE_Q Type *ty = i->getType()->getElementType();
      uint64_t size = kmodule->targetData->getTypeStoreSize(ty);
      MemoryObject *mo = memory->allocate(size, false, true, &*i);
      if (!mo)
        llvm::report_fatal_error("out of memory");
      ObjectState *os = bindObjectInState(state, mo, false);
      globalObjects.insert(std::make_pair(i, mo));
      globalAddresses.insert(std::make_pair(i, mo->getBaseExpr()));
      if (!i->hasInitializer())
          os->initializeToRandom();
    }
  }

  // link aliases to their definitions (if bound)
  //cyj: for循环作用: 对module中的每个别名及其Expr存入globalAddresses(Map)中
  for (Module::alias_iterator i = m->alias_begin(), ie = m->alias_end();
       i != ie; ++i) {
    // Map the alias to its aliasee's address. This works because we have
    // addresses for everything, even undefined functions.
    globalAddresses.insert(std::make_pair(i, evalConstant(i->getAliasee())));
  }

  // once all objects are allocated, do the actual initialization
  //cyj: 对每个全局变量进行初始化
  for (Module::const_global_iterator i = m->global_begin(),
         e = m->global_end();
       i != e; ++i) {
	MemoryObject *mo = globalObjects.find(i)->second;
    if (i->hasInitializer()) {
      const ObjectState *os = state.addressSpace.findObject(mo);
      assert(os);
      ObjectState *wos = state.addressSpace.getWriteable(mo, os);

      initializeGlobalObject(state, wos, i->getInitializer(), 0);
      	  	  //cyj: 根据i->getInitializer()的不同类型(组合类型拆分为单类型),
      	  	  //cyj: 将ObjectState.ConcreteStore写为i->getInitializer()相应的ConstantExpr对象地址
      // if(i->isConstant()) os->setReadOnly(true);
    }

    //--------------------------------------------- cyj modify: MakeGlobalSymbolic controller --------------------------------------------------
#if globalIsSymbolic == true	//cyj: 对每个全局变量进行符号化
    if(i->getName().find('.') != 0 && i->getName().find('_') != 0 && i->getName() != "stdin"
  				  && i->getName() != "stdout" && i->getName() != "stderr"
  				  && i->getName() != "errno" && i->getName() != "h_errno"
  				  && i->getName() != "float_rounding_mode" && i->getName() != "float_exception_flags"
  				  && i->getName() != "floatx80_rounding_precision" && i->getName() != "float_detect_tininess"
  				  && i->getName().find("estimateSqrt32") != 0
  				  && i->getName() != "countLeadingZeros32.countLeadingZerosHigh" ) {
  	  executeMakeSymbolic(state, mo, i->getName());
    }
#endif
  }
}

//cyj: 根据KInstruction->inst的不同类型, 计算KGEPInstruction的Offsets
void LIExecutor::bindInstructionConstants(KInstruction *KI) {
  KGEPInstruction *kgepi = static_cast<KGEPInstruction*>(KI);	//cyj: GEP: GetElementPointer

  if (GetElementPtrInst *gepi = dyn_cast<GetElementPtrInst>(KI->inst)) {
	kgepi->indices.clear();
	computeOffsets(kgepi, gep_type_begin(gepi), gep_type_end(gepi));
      		//cyj: 根据参数二/参数三之间的值, 计算kgepi->offset
  } else if (InsertValueInst *ivi = dyn_cast<InsertValueInst>(KI->inst)) {
    computeOffsets(kgepi, iv_type_begin(ivi), iv_type_end(ivi));
    assert(kgepi->indices.empty() && "InsertValue constant offset expected");
  } else if (ExtractValueInst *evi = dyn_cast<ExtractValueInst>(KI->inst)) {
    computeOffsets(kgepi, ev_type_begin(evi), ev_type_end(evi));
    assert(kgepi->indices.empty() && "ExtractValue constant offset expected");
  }
}
