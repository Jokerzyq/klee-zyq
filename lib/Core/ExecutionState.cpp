//===-- ExecutionState.cpp ------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "klee/ExecutionState.h"

#include "klee/Internal/Module/Cell.h"
#include "klee/Internal/Module/InstructionInfoTable.h"
#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"

#include "klee/Expr.h"

#include "Memory.h"
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 3)
#include "llvm/IR/Function.h"
#else
#include "llvm/Function.h"
#endif
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"

#include <iomanip>
#include <sstream>
#include <cassert>
#include <map>
#include <set>
#include <stdarg.h>

//qmh add
#include <string>
#include <vector>
#include <algorithm>
#include <FloatingPoint.h>
//using namespace fpklee;
//end add

using namespace llvm;
using namespace klee;

namespace { 
  cl::opt<bool>
  DebugLogStateMerge("debug-log-state-merge");
}

/***/

StackFrame::StackFrame(KInstIterator _caller, KFunction *_kf)
  : frame_id(0),caller(_caller), kf(_kf), callPathNode(0),										//added by qmh
    minDistToUncoveredOnReturn(0), varargs(0) {
  locals = new Cell[kf->numRegisters];
}

StackFrame::StackFrame(const StackFrame &s) 
  : frame_id(s.frame_id),																		//added by qmh
	caller(s.caller),
    kf(s.kf),
    callPathNode(s.callPathNode),
    allocas(s.allocas),
    minDistToUncoveredOnReturn(s.minDistToUncoveredOnReturn),
    varargs(s.varargs) {
  locals = new Cell[s.kf->numRegisters];
  for (unsigned i=0; i<s.kf->numRegisters; i++)
    locals[i] = s.locals[i];
}

StackFrame::~StackFrame() { 
  delete[] locals; 
}

/***/

ExecutionState::ExecutionState(KFunction *kf) :
    pc(kf->instructions),
    prevPC(pc),

    queryCost(0.), 
    weight(1),
    depth(0),
	//qmh add
	isBr(false),
	lib_id(0),
	priority(0),
	isInSoftFloat(0),
	ret_color(0),
	//end add

	//zyq add
	IRclock(false),
	pBlock(0),
	flagterminate(false),
	//end add

    instsSinceCovNew(0),
    coveredNew(false),
    forkDisabled(false),
    ptreeNode(0) {
  pushFrame(0, kf);			//cyj: 新建一个StackFrame对象, 放入stack容器中
}

ExecutionState::ExecutionState(const std::vector<ref<Expr> > &assumptions)
    : constraints(assumptions), queryCost(0.),isBr(false),lib_id(0),priority(0),isInSoftFloat(0),ret_color(0), ptreeNode(0) {}

ExecutionState::~ExecutionState() {
  for (unsigned int i=0; i<symbolics.size(); i++)
  {
    const MemoryObject *mo = symbolics[i].first;
    assert(mo->refCount > 0);
    mo->refCount--;
    if (mo->refCount == 0)
      delete mo;
  }
  //cyj add
  mallocStructObject.clear();
  defineBeforeStructSymbolic.clear();
  mallocBeforeStructSymbolic.clear();
  pointerBeAccessed.clear();
  LICreateStructObject.clear();
  lazyIniInfo.clear();
  maxDereferenceSize.clear();
  arrayObjectSymbolicSize.clear();
  pointToPointerLIOffset.clear();
  pointToPointerArrayName.clear();
  pointToPointerArrayType.clear();
  //end add

  //zyq add
  BlockCount.clear();
  BlockIRnum.clear();
  IRvisit.clear();
  IRpcstack.clear();
  //end add

  while (!stack.empty()) popFrame();
}

ExecutionState::ExecutionState(const ExecutionState& state):
    fnAliases(state.fnAliases),
    pc(state.pc),
    prevPC(state.prevPC),
    stack(state.stack),
    incomingBBIndex(state.incomingBBIndex),

    addressSpace(state.addressSpace),
    constraints(state.constraints),

	//cyj add
	mallocStructObject(state.mallocStructObject),
	defineBeforeStructSymbolic(state.defineBeforeStructSymbolic),
	mallocBeforeStructSymbolic(state.mallocBeforeStructSymbolic),
	pointerBeAccessed(state.pointerBeAccessed),
	LICreateStructObject(state.LICreateStructObject),
	lazyIniInfo(state.lazyIniInfo),
	maxDereferenceSize(state.maxDereferenceSize),
	arrayObjectSymbolicSize(state.arrayObjectSymbolicSize),
	pointToPointerLIOffset(state.pointToPointerLIOffset),
	pointToPointerArrayName(state.pointToPointerArrayName),
	pointToPointerArrayType(state.pointToPointerArrayType),
	//end add
	//qmh add
	isBr(state.isBr),
	lib_id(state.lib_id),
	priority(state.priority),
	isInSoftFloat(state.isInSoftFloat),
	ret_color(state.ret_color),
    queryCost(state.queryCost),
	//end add

	//zyq add
	pBlock(state.pBlock),
	BlockIRnum(state.BlockIRnum),
	BlockCount(state.BlockCount),
	IRpcstack(state.IRpcstack),
	IRvisit(state.IRvisit),
	IRclock(state.IRclock),
	flagterminate(state.flagterminate),
	//end add

    weight(state.weight),
    depth(state.depth),

    pathOS(state.pathOS),
    symPathOS(state.symPathOS),

    instsSinceCovNew(state.instsSinceCovNew),
    coveredNew(state.coveredNew),
    forkDisabled(state.forkDisabled),
    coveredLines(state.coveredLines),
    ptreeNode(state.ptreeNode),
    symbolics(state.symbolics),
    arrayNames(state.arrayNames)
{
  for (unsigned int i=0; i<symbolics.size(); i++)
    symbolics[i].first->refCount++;
}

//cyj add-------------------------------------------------------------------------------------------------------------
ExecutionState::ExecutionState(const ExecutionState& state, std::vector<std::string> previousInfo):
    fnAliases(state.fnAliases),
    pc(state.pc),
    prevPC(state.prevPC),
    stack(state.stack),
    incomingBBIndex(state.incomingBBIndex),

    addressSpace(state.addressSpace),
    constraints(state.constraints),

	//cyj add
	mallocStructObject(state.mallocStructObject),
	defineBeforeStructSymbolic(state.defineBeforeStructSymbolic),
	mallocBeforeStructSymbolic(state.mallocBeforeStructSymbolic),
	pointerBeAccessed(state.pointerBeAccessed),
	LICreateStructObject(state.LICreateStructObject),
	lazyIniInfo(previousInfo),
	maxDereferenceSize(state.maxDereferenceSize),
	arrayObjectSymbolicSize(state.arrayObjectSymbolicSize),
	pointToPointerLIOffset(state.pointToPointerLIOffset),
	pointToPointerArrayName(state.pointToPointerArrayName),
	pointToPointerArrayType(state.pointToPointerArrayType),
	//end add

	//qmh add
	isBr(state.isBr),
	lib_id(state.lib_id),
	priority(state.priority),
	isInSoftFloat(state.isInSoftFloat),
	ret_color(state.ret_color),
	//end add

	//zyq add
	pBlock(state.pBlock),
	BlockIRnum(state.BlockIRnum),
	BlockCount(state.BlockCount),
	IRpcstack(state.IRpcstack),
	IRvisit(state.IRvisit),
	IRclock(state.IRclock),
	flagterminate(state.flagterminate),
	//end add

    queryCost(state.queryCost),
    weight(state.weight),
    depth(state.depth),

    pathOS(state.pathOS),
    symPathOS(state.symPathOS),

    instsSinceCovNew(state.instsSinceCovNew),
    coveredNew(state.coveredNew),
    forkDisabled(state.forkDisabled),
    coveredLines(state.coveredLines),
    ptreeNode(state.ptreeNode),
    symbolics(state.symbolics),
    arrayNames(state.arrayNames)
{
  for (unsigned int i=0; i<symbolics.size(); i++)
    symbolics[i].first->refCount++;
}
//end add---------------------------------------------------------------------------------------------------------------

//cyj: 创建一个falseState
ExecutionState *ExecutionState::branch() {
  depth++;	//cyj: Exploration depth, i.e., number of times KLEE branched for this state

  ExecutionState *falseState = new ExecutionState(*this);
  falseState->coveredNew = false;
  falseState->coveredLines.clear();

  weight *= .5;		//cyj: searchers to decide what paths to explore
  falseState->weight -= weight;

  return falseState;
}

//cyj: 新建一个StackFrame对象, 放入stack容器中
void ExecutionState::pushFrame(KInstIterator caller, KFunction *kf) {
  stack.push_back(StackFrame(caller,kf));

  //qmh add
  //update frame_id of new StackFrame
  	std::string function = kf->function->getName().str();
  	if(isFPStapleFunction(function)){
      	stack.back().frame_id = ++lib_id_number;
      	hotspot_id = stack.back().frame_id;
      }else{
      	stack.back().frame_id = stack.size() == 1 ? 0 : (stack.end()-2)->frame_id;
      }
  //end add
}

//cyj: 删除StackFrame中的每一个MemoryObject, 并删除StackFrame
void ExecutionState::popFrame() {
  StackFrame &sf = stack.back();
  for (std::vector<const MemoryObject*>::iterator it = sf.allocas.begin(), 
         ie = sf.allocas.end(); it != ie; ++it)
    addressSpace.unbindObject(*it);			//cyj: addressSpace.MemoryMap.remove(MemoryObject)
  stack.pop_back();			//cyj: Removes last element
}

//cyj: 将mo与array加入到state的symbolics中
void ExecutionState::addSymbolic(const MemoryObject *mo, const Array *array) { 
  mo->refCount++;
  symbolics.push_back(std::make_pair(mo, array));
}
///

std::string ExecutionState::getFnAlias(std::string fn) {
  std::map < std::string, std::string >::iterator it = fnAliases.find(fn);
  if (it != fnAliases.end())
    return it->second;
  else return "";
}

void ExecutionState::addFnAlias(std::string old_fn, std::string new_fn) {
  fnAliases[old_fn] = new_fn;
}

void ExecutionState::removeFnAlias(std::string fn) {
  fnAliases.erase(fn);
}

/**/

llvm::raw_ostream &klee::operator<<(llvm::raw_ostream &os, const MemoryMap &mm) {
  os << "{";
  MemoryMap::iterator it = mm.begin();
  MemoryMap::iterator ie = mm.end();
  if (it!=ie) {
    os << "MO" << it->first->id << ":" << it->second;
    for (++it; it!=ie; ++it)
      os << ", MO" << it->first->id << ":" << it->second;
  }
  os << "}";
  return os;
}

bool ExecutionState::merge(const ExecutionState &b) {
  if (DebugLogStateMerge)
    llvm::errs() << "-- attempting merge of A:" << this << " with B:" << &b
                 << "--\n";
  if (pc != b.pc)
    return false;

  // XXX is it even possible for these to differ? does it matter? probably
  // implies difference in object states?
  if (symbolics!=b.symbolics)
    return false;

  {
    std::vector<StackFrame>::const_iterator itA = stack.begin();
    std::vector<StackFrame>::const_iterator itB = b.stack.begin();
    while (itA!=stack.end() && itB!=b.stack.end()) {
      // XXX vaargs?
      if (itA->caller!=itB->caller || itA->kf!=itB->kf)
        return false;
      ++itA;
      ++itB;
    }
    if (itA!=stack.end() || itB!=b.stack.end())
      return false;
  }

  std::set< ref<Expr> > aConstraints(constraints.begin(), constraints.end());
  std::set< ref<Expr> > bConstraints(b.constraints.begin(), 
                                     b.constraints.end());
  std::set< ref<Expr> > commonConstraints, aSuffix, bSuffix;
  std::set_intersection(aConstraints.begin(), aConstraints.end(),
                        bConstraints.begin(), bConstraints.end(),
                        std::inserter(commonConstraints, commonConstraints.begin()));
  std::set_difference(aConstraints.begin(), aConstraints.end(),
                      commonConstraints.begin(), commonConstraints.end(),
                      std::inserter(aSuffix, aSuffix.end()));
  std::set_difference(bConstraints.begin(), bConstraints.end(),
                      commonConstraints.begin(), commonConstraints.end(),
                      std::inserter(bSuffix, bSuffix.end()));
  if (DebugLogStateMerge) {
    llvm::errs() << "\tconstraint prefix: [";
    for (std::set<ref<Expr> >::iterator it = commonConstraints.begin(),
                                        ie = commonConstraints.end();
         it != ie; ++it)
      llvm::errs() << *it << ", ";
    llvm::errs() << "]\n";
    llvm::errs() << "\tA suffix: [";
    for (std::set<ref<Expr> >::iterator it = aSuffix.begin(),
                                        ie = aSuffix.end();
         it != ie; ++it)
      llvm::errs() << *it << ", ";
    llvm::errs() << "]\n";
    llvm::errs() << "\tB suffix: [";
    for (std::set<ref<Expr> >::iterator it = bSuffix.begin(),
                                        ie = bSuffix.end();
         it != ie; ++it)
      llvm::errs() << *it << ", ";
    llvm::errs() << "]\n";
  }

  // We cannot merge if addresses would resolve differently in the
  // states. This means:
  // 
  // 1. Any objects created since the branch in either object must
  // have been free'd.
  //
  // 2. We cannot have free'd any pre-existing object in one state
  // and not the other

  if (DebugLogStateMerge) {
    llvm::errs() << "\tchecking object states\n";
    llvm::errs() << "A: " << addressSpace.objects << "\n";
    llvm::errs() << "B: " << b.addressSpace.objects << "\n";
  }
    
  std::set<const MemoryObject*> mutated;
  MemoryMap::iterator ai = addressSpace.objects.begin();
  MemoryMap::iterator bi = b.addressSpace.objects.begin();
  MemoryMap::iterator ae = addressSpace.objects.end();
  MemoryMap::iterator be = b.addressSpace.objects.end();
  for (; ai!=ae && bi!=be; ++ai, ++bi) {
    if (ai->first != bi->first) {
      if (DebugLogStateMerge) {
        if (ai->first < bi->first) {
          llvm::errs() << "\t\tB misses binding for: " << ai->first->id << "\n";
        } else {
          llvm::errs() << "\t\tA misses binding for: " << bi->first->id << "\n";
        }
      }
      return false;
    }
    if (ai->second != bi->second) {
      if (DebugLogStateMerge)
        llvm::errs() << "\t\tmutated: " << ai->first->id << "\n";
      mutated.insert(ai->first);
    }
  }
  if (ai!=ae || bi!=be) {
    if (DebugLogStateMerge)
      llvm::errs() << "\t\tmappings differ\n";
    return false;
  }
  
  // merge stack

  ref<Expr> inA = ConstantExpr::alloc(1, Expr::Bool);
  ref<Expr> inB = ConstantExpr::alloc(1, Expr::Bool);
  for (std::set< ref<Expr> >::iterator it = aSuffix.begin(), 
         ie = aSuffix.end(); it != ie; ++it)
    inA = AndExpr::create(inA, *it);
  for (std::set< ref<Expr> >::iterator it = bSuffix.begin(), 
         ie = bSuffix.end(); it != ie; ++it)
    inB = AndExpr::create(inB, *it);

  // XXX should we have a preference as to which predicate to use?
  // it seems like it can make a difference, even though logically
  // they must contradict each other and so inA => !inB

  std::vector<StackFrame>::iterator itA = stack.begin();
  std::vector<StackFrame>::const_iterator itB = b.stack.begin();
  for (; itA!=stack.end(); ++itA, ++itB) {
    StackFrame &af = *itA;
    const StackFrame &bf = *itB;
    for (unsigned i=0; i<af.kf->numRegisters; i++) {
      ref<Expr> &av = af.locals[i].value;
      const ref<Expr> &bv = bf.locals[i].value;
      if (av.isNull() || bv.isNull()) {
        // if one is null then by implication (we are at same pc)
        // we cannot reuse this local, so just ignore
      } else {
        av = SelectExpr::create(inA, av, bv);
      }
    }
  }

  for (std::set<const MemoryObject*>::iterator it = mutated.begin(), 
         ie = mutated.end(); it != ie; ++it) {
    const MemoryObject *mo = *it;
    const ObjectState *os = addressSpace.findObject(mo);
    const ObjectState *otherOS = b.addressSpace.findObject(mo);
    assert(os && !os->readOnly && 
           "objects mutated but not writable in merging state");
    assert(otherOS);

    ObjectState *wos = addressSpace.getWriteable(mo, os);
    for (unsigned i=0; i<mo->size; i++) {
      ref<Expr> av = wos->read8(i);
      ref<Expr> bv = otherOS->read8(i);
      wos->write(i, SelectExpr::create(inA, av, bv));
    }
  }

  constraints = ConstraintManager();
  for (std::set< ref<Expr> >::iterator it = commonConstraints.begin(), 
         ie = commonConstraints.end(); it != ie; ++it)
    constraints.addConstraint(*it);
  constraints.addConstraint(OrExpr::create(inA, inB));

  return true;
}

void ExecutionState::dumpStack(llvm::raw_ostream &out) const {
  unsigned idx = 0;
  const KInstruction *target = prevPC;
  for (ExecutionState::stack_ty::const_reverse_iterator
         it = stack.rbegin(), ie = stack.rend();
       it != ie; ++it) {
    const StackFrame &sf = *it;
    Function *f = sf.kf->function;
    const InstructionInfo &ii = *target->info;
    out << "\t#" << idx++;
    std::stringstream AssStream;
    AssStream << std::setw(8) << std::setfill('0') << ii.assemblyLine;
    out << AssStream.str();
    out << " in " << f->getName().str() << " (";
    // Yawn, we could go up and print varargs if we wanted to.
    unsigned index = 0;
    for (Function::arg_iterator ai = f->arg_begin(), ae = f->arg_end();
         ai != ae; ++ai) {
      if (ai!=f->arg_begin()) out << ", ";

      out << ai->getName().str();
      // XXX should go through function
      ref<Expr> value = sf.locals[sf.kf->getArgRegister(index++)].value; 
      if (isa<ConstantExpr>(value))
        out << "=" << value;
    }
    out << ")";
    if (ii.file != "")
      out << " at " << ii.file << ":" << ii.line;
    out << "\n";
    target = sf.caller;
  }
}

//qmh add
void ExecutionState::updateFrame(){
	if(stack.back().caller){
		currentFrame.first = stack.back().callPathNode->parent->function->getName().str();
	}
	else currentFrame.first = " ";
	currentFrame.second = stack.back().kf->function->getName().str();
	lib_id = stack.back().frame_id;
}
//end add
