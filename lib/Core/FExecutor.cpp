//===-- FExecutor.cpp ------------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "Common.h"
#include "Executor.h"
#include "FExecutor.h"
#include "FloatingPoint.h"
#include "Context.h"
#include "CoreStats.h"
#include "ExternalDispatcher.h"
#include "ImpliedValue.h"
#include "Memory.h"
#include "MemoryManager.h"
#include "PTree.h"
#include "Searcher.h"
#include "SeedInfo.h"
#include "SpecialFunctionHandler.h"
#include "StatsTracker.h"
#include "TimingSolver.h"
#include "UserSearcher.h"
#include "ExecutorTimerInfo.h"

#include "../Solver/SolverStats.h"

#include "klee/ExecutionState.h"
#include "klee/Expr.h"
#include "klee/Interpreter.h"
#include "klee/TimerStatIncrementer.h"
#include "klee/CommandLine.h"
#include "klee/Common.h"
#include "klee/util/Assignment.h"
#include "klee/util/ExprPPrinter.h"
#include "klee/util/ExprSMTLIBPrinter.h"
#include "klee/util/ExprUtil.h"
#include "klee/util/GetElementPtrTypeIterator.h"
#include "klee/Config/Version.h"
#include "klee/Internal/ADT/KTest.h"
#include "klee/Internal/ADT/RNG.h"
#include "klee/Internal/Module/Cell.h"
#include "klee/Internal/Module/InstructionInfoTable.h"
#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"
#include "klee/Internal/Support/FloatEvaluation.h"
#include "klee/Internal/System/Time.h"
#include "klee/Internal/System/MemoryUsage.h"

#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include "llvm/IR/Function.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/TypeBuilder.h"
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
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/Process.h"
#include "llvm/Support/raw_ostream.h"

#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
#include "llvm/Support/CallSite.h"
#else
#include "llvm/IR/CallSite.h"
#endif

#include <cassert>
#include <algorithm>
#include <iomanip>
#include <iosfwd>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <algorithm>

#include <sys/mman.h>

#include <errno.h>
#include <cxxabi.h>


using namespace llvm;
using namespace klee;

//namespace fpklee{
int lib_id_number=0;
int hotspot_id =0;
int hotspot=0;
int ret_true=0;
int ret_false=0;
bool fpEnough=false;
bool ret_ok=false;
int ret_count=0;
int ret_count_max=1;
int ret_true_max=3;
int ret_false_max=3;
//}
//using namespace fpklee;


void FExecutor::executeFloatlibMethodArith(ExecutionState &state, KInstruction *ki, std::string method){
	Instruction *i = ki->inst;
	//get the arguments of FAdd
    ref<Expr> left = eval(ki, 0, state).value;
    ref<Expr> right = eval(ki, 1, state).value;
    if(((left->getWidth()==64)||(right->getWidth()==64))&&(left->getWidth()<80)&&(right->getWidth()<80))
    {
    	int pos=method.find("32");
    	method=method.replace(pos,2,"64");
    }
    Function *f = kmodule->module->getFunction(method);
    std::vector< ref<Expr> > arguments;
    arguments.reserve(2);
    arguments.push_back(left);
    arguments.push_back(right);

    //create a faked instruction and KInstruction, mainly used for invoking executeCall
	std::vector<Value*> Args(2);
	if((left->getWidth()==32)&&(right->getWidth()==32)){
		Args[0] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(32));
		Args[1] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(32));
	}
	else
		if(((left->getWidth()==64)||(right->getWidth()==64))&&(left->getWidth()<80)&&(right->getWidth()<80))
		{
			Args[0] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(64));
			Args[1] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(64));
		}
		else
		{
			llvm::errs()<<"Cannot support float point width!\n";
			exit(1);
		}
	//CallInst *ci = CallInst::Create(f, Args.begin(), Args.end(), "", i);
	CallInst *ci = CallInst::Create(f, Args, "", i);
	KInstruction *kci = new KInstruction();
	kci->inst = ci;
	//state.executor->kmodule->infos->infos.insert(std::make_pair(ci,state.executor->kmodule->infos->dummyInfo));//InstructionInfo(0,"",-1, 0,0)));
	kmodule->infos->infos.insert(std::make_pair(ci,kmodule->infos->dummyInfo));
	//execute the softfloat function
	executeCall(state, kci, f, arguments);
}

void FExecutor::executeFloatlibMethodConv(ExecutionState &state, KInstruction *ki, std::string method) {
	//Instruction *i = ki->inst;
	Instruction *i = ki ? ki->inst : 0;
	LLVM_TYPE_Q Type *t = i->getType();
	Expr::Width to = getWidthForLLVMType(t);
	//get the arguments of Conv
	ref<Expr> from = eval(ki, 0, state).value;
	if(method=="int32_to_float32")
	{
		if(from->getWidth()==32&&to==32)
		{
			method="int32_to_float32";
		}
		else
			if(from->getWidth()==32&&to==64)
			{
				method="int32_to_float64";
			}
			else
				if(from->getWidth()==64&&to==32)
				{
					method="int64_to_float32";
				}
				else
					if(from->getWidth()==64&&to==64)
					{
						method="int64_to_float64";
					}
					else
					{
						llvm::errs()<<"Cannot support float point width!\n";
						exit(1);
					}
	}
	else
		if(method=="float32_to_int32")
		{
			if(from->getWidth()==32&&to==32)
			{
				method="float32_to_int32";
			}
			else
				if(from->getWidth()==32&&to==64)
				{
					method="float32_to_int64";
				}
				else
					if(from->getWidth()==64&&to==32)
					{
						method="float64_to_int32";
					}
					else
						if(from->getWidth()==64&&to==64)
						{
							method="float64_to_int64";
						}
						else
							{
								llvm::errs()<<"Cannot support float point width!\n";
								exit(1);
							}
			}

	Function *f = kmodule->module->getFunction(method);


    //ref<Expr> right = eval(ki, 1, state).value;
    std::vector< ref<Expr> > arguments;
    arguments.reserve(1);
    arguments.push_back(from);
    //arguments.push_back(right);

    //create a faked instruction and KInstruction, mainly used for invoking executeCall
	std::vector<Value*> Args(1);
	if(from->getWidth()==32)
	{
		Args[0] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(32));
	}
	else
		if(from->getWidth()==64)
			{
				Args[0] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(64));
			}
		else
		{
			llvm::errs()<<"Cannot support float point width!\n";
			exit(1);
		}
	//Args[1] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(32));
	//CallInst *ci = CallInst::Create(f, Args.begin(), Args.end(), "", i);
	CallInst *ci = CallInst::Create(f, Args, "", i);
	KInstruction *kci = new KInstruction();
	kci->inst = ci;
	//state.executor->kmodule->infos->infos.insert(std::make_pair(ci,state.executor->kmodule->infos->dummyInfo));//InstructionInfo(0,"",-1, 0,0)));
	kmodule->infos->infos.insert(std::make_pair(ci,kmodule->infos->dummyInfo));
	//execute the softfloat function
	executeCall(state, kci, f, arguments);
}

void FExecutor::executeFloatlibMethodCmp(ExecutionState &state, KInstruction *ki, std::string method) {
		/*Instruction *i = ki->inst;

		Function *f = kmodule->module->getFunction(method);
	    ref<Expr> left = eval(ki, 0, state).value;
	    ref<Expr> right = eval(ki, 1, state).value;
	    std::vector< ref<Expr> > arguments;
	    arguments.reserve(2);
	    arguments.push_back(left);
	    arguments.push_back(right);
	    //create a faked instruction and KInstruction, mainly used for invoking executeCall
		std::vector<Value*> Args(2);
		Args[0] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(32));
		Args[1] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(32));
		CallInst *ci = CallInst::Create(f, Args, "", i);
		KInstruction *kci = new KInstruction();
		kci->inst = ci;
		kmodule->infos->infos.insert(std::make_pair(ci,kmodule->infos->dummyInfo));
		executeCall(state, kci, f, arguments);
		//temp= dyn_cast < ConstantExpr > (xxx)->getSExtValue();//ref<klee::Expr>
		//state.stack.back().locals[ki->dest].value.get()->dump();*/
	Instruction *i = ki->inst;
		//get the arguments of FCmp
	    ref<Expr> left = eval(ki, 0, state).value;
	    ref<Expr> right = eval(ki, 1, state).value;
	    if(((left->getWidth()==64)||(right->getWidth()==64))&&(left->getWidth()<80)&&(right->getWidth()<80))
	        {
	        	int pos=method.find("32");
	        	method=method.replace(pos,2,"64");
	        }
	        Function *f = kmodule->module->getFunction(method);
	        std::vector< ref<Expr> > arguments;
	        arguments.reserve(2);
	        arguments.push_back(left);
	        arguments.push_back(right);

	        //create a faked instruction and KInstruction, mainly used for invoking executeCall
	    	std::vector<Value*> Args(2);
	    	if((left->getWidth()==32)&&(right->getWidth()==32)){
	    		Args[0] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(32));
	    		Args[1] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(32));
	    	}
	    	else
	    		if(((left->getWidth()==64)||(right->getWidth()==64))&&(left->getWidth()<80)&&(right->getWidth()<80))
	    		{
	    			Args[0] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(64));
	    			Args[1] = ConstantInt::get(kmodule->module->getContext(), llvm::APInt::getNullValue(64));
	    		}
	    		else
	    		{
	    			llvm::errs()<<"Cannot support float point width!\n";
	    			exit(1);
	    		}
		//CallInst *ci = CallInst::Create(f, Args.begin(), Args.end(), "", i);
		CallInst *ci = CallInst::Create(f, Args, "", i);
		KInstruction *kci = new KInstruction();
		kci->inst = ci;
		//state.executor->kmodule->infos->infos.insert(std::make_pair(ci,state.executor->kmodule->infos->dummyInfo));//InstructionInfo(0,"",-1, 0,0)));
		kmodule->infos->infos.insert(std::make_pair(ci,kmodule->infos->dummyInfo));
		//execute the softfloat function
		executeCall(state, kci, f, arguments);
}

static bool isDebugIntrinsic(const Function *f, KModule *KM) {
  return false;
}

void FExecutor::executeInstruction(ExecutionState &state, KInstruction *ki) {
  Instruction *i = ki->inst;
  switch (i->getOpcode()) {
    // Floating point instructions

  case Instruction::Ret: {																			//return
        ReturnInst *ri = cast<ReturnInst>(i);														//convert i to ReturnInst ri
        KInstIterator kcaller = state.stack.back().caller;
        Instruction *caller = kcaller ? kcaller->inst : 0;
        bool isVoidReturn = (ri->getNumOperands() == 0);
        ref<Expr> result = ConstantExpr::alloc(0, Expr::Bool);										//result is a ref<Expr>, APInt is 0

        if (!isVoidReturn) {
          result = eval(ki, 0, state).value;														//result is state.stack.back().locals[0].value, ref<Expr>
        }

        if (state.stack.size() <= 1) {																//is main function return
          assert(!caller && "caller set on initial stack frame");
          terminateStateOnExit(state);
        } else {
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        	//std::cout << "state.priotiry == " << state.priority << ";\t" << "state.lib_id == " << state.lib_id << ";\t"
        			//<< "result->getWidth == " << result->getWidth() << std::endl;
        	//if(result->getWidth() == Expr::Bool) std::cout << result->isTrue() << "<->" << result->isFalse() << std::endl;
        	if(state.priority <= 0
			||state.lib_id != hotspot_id
			||!isFPCmpFunction(state.currentFrame.second)
			||(result->isTrue() && (ret_true == 0 || ret_true > ret_true_max))
			||(ret_false == 0 || ret_false > ret_false_max)	){

			if(state.priority > 0 && state.lib_id == hotspot_id){
				if(!isFPCmpFunction(state.currentFrame.second)){
					if(isFPStapleFunction(state.currentFrame.second)){
						ret_count++;
					}
				}else{
					if(result->isTrue()){
						//std::cout << "return true" << std::endl;
						if(ret_false >= 1){
							//std::cout << "modify ret_ok" << std::endl;
							ret_ok = true;
						}else{
							ret_true = 1;
						}
					}else{
						//std::cout << "return false " << std::endl;
						if(ret_true >= 1){
							//std::cout << "modify ret_ok" << std::endl;
							ret_ok = true;
						}else{
							ret_false = 1;
						}
					}
				}

				fpEnough=isFPEnough(state, result);
				//std::cout << "Ret fpEnough == " << fpEnough << std::endl;
			}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
			state.popFrame();																		//delete the stackframe that ri belongs to

			if (statsTracker)
			  statsTracker->framePopped(state);

			if (InvokeInst *ii = dyn_cast<InvokeInst>(caller)) {									//convert caller to InvokeInst ii
			  transferToBasicBlock(ii->getNormalDest(), caller->getParent(), state);
			} else {
			  state.pc = kcaller;
			  ++state.pc;
			}

			if (!isVoidReturn) {
			  LLVM_TYPE_Q Type *t = caller->getType();
			  if (t != Type::getVoidTy(getGlobalContext())) {
				// may need to do coercion due to bitcasts
				Expr::Width from = result->getWidth();
				Expr::Width to = getWidthForLLVMType(t);

				if (from != to) {
				  CallSite cs = (isa<InvokeInst>(caller) ? CallSite(cast<InvokeInst>(caller)) :
								 CallSite(cast<CallInst>(caller)));

				  // XXX need to check other param attrs ?
	  #if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
			bool isSExt = cs.paramHasAttr(0, llvm::Attribute::SExt);
	  #elif LLVM_VERSION_CODE >= LLVM_VERSION(3, 2)
			bool isSExt = cs.paramHasAttr(0, llvm::Attributes::SExt);
	  #else
			bool isSExt = cs.paramHasAttr(0, llvm::Attribute::SExt);
	  #endif
				  if (isSExt) {
					result = SExtExpr::create(result, to);
				  } else {
					result = ZExtExpr::create(result, to);
				  }
				}

				bindLocal(kcaller, state, result);
			  }
			} else {
			  // We check that the return value has no users instead of
			  // checking the type, since C defaults to returning int for
			  // undeclared functions.
			  if (!caller->use_empty()) {
				//terminateStateOnExecError(state, "return void when caller expected a result");
			  }
			}
		  }else if(result->getWidth() == Expr::Bool){
        	std::cout << "duplicate same type return" << std::endl;
        	if(result->isTrue()){
        		ret_true++;
        	}else{
        		ret_false++;
        	}
        	reselectState=true;
		  }
        }
        break;
      }
    #if LLVM_VERSION_CODE < LLVM_VERSION(3, 1)
      case Instruction::Unwind: {
        for (;;) {
          KInstruction *kcaller = state.stack.back().caller;
          state.popFrame();

          if (statsTracker)
            statsTracker->framePopped(state);

          if (state.stack.empty()) {
            terminateStateOnExecError(state, "unwind from initial stack frame");
            break;
          } else {
            Instruction *caller = kcaller->inst;
            if (InvokeInst *ii = dyn_cast<InvokeInst>(caller)) {
              transferToBasicBlock(ii->getUnwindDest(), caller->getParent(), state);
              break;
            }
          }
        }
        break;
      }
    #endif

    case Instruction::Invoke:
      case Instruction::Call: {																//call instruction
        CallSite cs(i);																		//i represents a instruction

        unsigned numArgs = cs.arg_size();
        Value *fp = cs.getCalledValue();
        Function *f = getTargetFunction(fp, state);

        //added by qmh
       //if(cs.getCaller())hotspotFrame.first = cs.getCaller()->getName().str();				//update the hotspotFrame
       //if(f)hotspotFrame.second = f->getName().str();


        // Skip debug intrinsics, we can't evaluate their metadata arguments.
        if (f && isDebugIntrinsic(f, kmodule))
          break;

        if (isa<InlineAsm>(fp)) {
          terminateStateOnExecError(state, "inline assembly is unsupported");
          break;
        }
        // evaluate arguments
        std::vector< ref<Expr> > arguments;
        arguments.reserve(numArgs);

        for (unsigned j=0; j<numArgs; ++j)
          arguments.push_back(eval(ki, j+1, state).value);

        if (f) {
          const FunctionType *fType =
            dyn_cast<FunctionType>(cast<PointerType>(f->getType())->getElementType());
          const FunctionType *fpType =
            dyn_cast<FunctionType>(cast<PointerType>(fp->getType())->getElementType());

          // special case the call with a bitcast case
          if (fType != fpType) {
            assert(fType && fpType && "unable to get function type");

            // XXX check result coercion

            // XXX this really needs thought and validation
            unsigned i=0;
            for (std::vector< ref<Expr> >::iterator
                   ai = arguments.begin(), ie = arguments.end();
                 ai != ie; ++ai) {
              Expr::Width to, from = (*ai)->getWidth();

              if (i<fType->getNumParams()) {
                to = getWidthForLLVMType(fType->getParamType(i));

                if (from != to) {
                  // XXX need to check other param attrs ?
    #if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
                  bool isSExt = cs.paramHasAttr(i+1, llvm::Attribute::SExt);
    #elif LLVM_VERSION_CODE >= LLVM_VERSION(3, 2)
    	      bool isSExt = cs.paramHasAttr(i+1, llvm::Attributes::SExt);
    #else
    	      bool isSExt = cs.paramHasAttr(i+1, llvm::Attribute::SExt);
    #endif
                  if (isSExt) {
                    arguments[i] = SExtExpr::create(arguments[i], to);
                  } else {
                    arguments[i] = ZExtExpr::create(arguments[i], to);
                  }
                }
              }

              i++;
            }
          }


          executeCall(state, ki, f, arguments);
        } else {
          ref<Expr> v = eval(ki, 0, state).value;

          ExecutionState *free = &state;
          bool hasInvalid = false, first = true;

          /* XXX This is wasteful, no need to do a full evaluate since we
             have already got a value. But in the end the caches should
             handle it for us, albeit with some overhead. */
          do {
            ref<ConstantExpr> value;
            bool success = solver->getValue(*free, v, value);
            assert(success && "FIXME: Unhandled solver failure");
            (void) success;
            StatePair res = fork(*free, EqExpr::create(v, value), true);
            if (res.first) {
              uint64_t addr = value->getZExtValue();
              if (legalFunctions.count(addr)) {
                f = (Function*) addr;

                // Don't give warning on unique resolution
                if (res.second || !first)
                  klee_warning_once((void*) (unsigned long) addr,
                                    "resolved symbolic function pointer to: %s",
                                    f->getName().data());

                executeCall(*res.first, ki, f, arguments);
              } else {
                if (!hasInvalid) {
                  terminateStateOnExecError(state, "invalid function pointer");
                  hasInvalid = true;
                }
              }
            }

            first = false;
            free = res.second;
          } while (free);
        }
        break;
      }

      case Instruction::Br: {																//branch

    	 // llvm::errs()<<"Br\n";
          BranchInst *bi = cast<BranchInst>(i);

          bool no = false;
          if (bi->isUnconditional()) {														//unconditional branch, jump directly
           //  llvm::errs()<<"\n\n\n"<<*(bi->getSuccessor(0))<<"\n";
            transferToBasicBlock(bi->getSuccessor(0), bi->getParent(), state);
          } else {																			//conditional branch
            // llvm::errs()<<"\n\n\n"<<*(bi->getSuccessor(0))<<"\n";
            //  llvm::errs()<<*(bi->getSuccessor(1))<<"\n\n\n\n";
            // FIXME: Find a way that we don't have this hidden dependency.
            assert(bi->getCondition() == bi->getOperand(0) &&									//ensure the condition is the first operand
                   "Wrong operand index!");
            ref<Expr> cond = eval(ki, 0, state).value;


      		  Executor::StatePair branches = fork(state, cond, false);

      		  // NOTE: There is a hidden dependency here, markBranchVisited
      		  // requires that we still be in the context of the branch
      		  // instruction (it reuses its statistic id). Should be cleaned
      		  // up with convenient instruction specific data.
      	    ///*
      		  if (statsTracker && state.stack.back().kf->trackCoverage)
      			statsTracker->markBranchVisited(branches.first, branches.second);
      		  if (branches.first)																//will always choose the first branch?
      			transferToBasicBlock(bi->getSuccessor(0), bi->getParent(), *branches.first);
      		  if (branches.second)
      			transferToBasicBlock(bi->getSuccessor(1), bi->getParent(), *branches.second);
      			//*/
      		}
          break;
        }

  case Instruction::FAdd: {
	executeFloatlibMethodArith(state, ki, "float32_add");
    break;
  }

  case Instruction::FSub: {
	executeFloatlibMethodArith(state, ki, "float32_sub");
    break;
  }

  case Instruction::FMul: {
	executeFloatlibMethodArith(state, ki, "float32_mul");
    break;
  }

  case Instruction::FDiv: {
	executeFloatlibMethodArith(state, ki, "float32_div");
    break;
  }

  case Instruction::FRem: {
	executeFloatlibMethodArith(state, ki, "float32_rem");
    break;
  }

  case Instruction::FPTrunc: {
	executeFloatlibMethodConv(state, ki, "float64_to_float32");
    break;
  }

  case Instruction::FPExt: {
	executeFloatlibMethodConv(state, ki, "float32_to_float64");
    break;
  }

  case Instruction::FPToUI: {
	executeFloatlibMethodConv(state, ki, "float32_to_int32");
    break;
  }

  case Instruction::FPToSI: {
	executeFloatlibMethodConv(state, ki, "float32_to_int32");
    break;
  }

  case Instruction::UIToFP: {
	executeFloatlibMethodConv(state, ki, "int32_to_float32");
    break;
  }

  case Instruction::SIToFP: {
	executeFloatlibMethodConv(state, ki, "int32_to_float32");
    break;
  }

  case Instruction::FCmp: {
	  FCmpInst *fi = cast<FCmpInst>(i);
	  	      switch( fi->getPredicate() ) {
	  	        // Predicates which only care about whether or not the operands are NaNs.
	  	      case FCmpInst::FCMP_ORD:
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_ord_quiet");
	  	        break;

	  	      case FCmpInst::FCMP_UNO:
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_uno_quiet");
	  	        break;

	  	        // Ordered comparisons return false if either operand is NaN.  Unordered
	  	        // comparisons return true if either operand is NaN.
	  	      case FCmpInst::FCMP_UEQ:
	  		  executeFloatlibMethodCmp(state, ki, "float32_eq_signaling");
	  	    	  break;
	  	      case FCmpInst::FCMP_OEQ://float32_eq-------------------1
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_eq");
	  	        break;

	  	      case FCmpInst::FCMP_UGT:
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_gt_quiet");
	  	    	  	          break;
	  	      case FCmpInst::FCMP_OGT://float32_gt--------------------------2
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_gt");
	  	        break;

	  	      case FCmpInst::FCMP_UGE:
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_ge_quiet");
	  	    	  	          break;
	  	      case FCmpInst::FCMP_OGE://float32_ge---------------------------------3
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_ge");
	  	        break;

	  	      case FCmpInst::FCMP_ULT:
	  		  	  executeFloatlibMethodCmp(state, ki, "float32_lt_quiet");
	  	    	break;
	  	      case FCmpInst::FCMP_OLT://float32_lt------------------------------------------4
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_lt");
	  	        break;

	  	      case FCmpInst::FCMP_ULE:
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_le_quiet");
	  	    	  	          break;
	  	      case FCmpInst::FCMP_OLE://float32_le-----------------------------------------------------5
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_le");
	  	        break;

	  	      case FCmpInst::FCMP_UNE:
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_ne");
	  	    	  break;
	  	      case FCmpInst::FCMP_ONE:
	  	    	  executeFloatlibMethodCmp(state, ki, "float32_one_quiet");
	  	    	break;

	  	      default:
	  	        assert(0 && "Invalid FCMP predicate!");
	  	      case FCmpInst::FCMP_FALSE:
	  	    	  bindLocal(ki, state, ConstantExpr::alloc(false, Expr::Bool));
	  	        break;
	  	      case FCmpInst::FCMP_TRUE:
	  	    	  bindLocal(ki, state, ConstantExpr::alloc(true, Expr::Bool));
	  	        break;
	  	      }
    break;
  }

  default:Executor::executeInstruction(state,ki);
  	  	  break;
  }
}

  FExecutor::~FExecutor() {
  }
