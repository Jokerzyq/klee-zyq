//===-- FExecutor.h ----------------------------------------------*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Class to perform actual execution, hides implementation details from external
// interpreter.
//
//===----------------------------------------------------------------------===//

#ifndef KLEE_FEXECUTOR_H
#define KLEE_FEXECUTOR_H

#include "Executor.h"
#include "klee/ExecutionState.h"
#include "klee/Interpreter.h"
#include "klee/Internal/Module/Cell.h"
#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"

#include "llvm/ADT/Twine.h"
#include <vector>
#include <string>
#include <map>
#include <set>
#include <iostream>
#include <fstream>
#include <sstream>
#include "FloatingPoint.h"
#include <algorithm>

struct KTest;

namespace llvm {
  class BasicBlock;
  class BranchInst;
  class CallInst;
  class Constant;
  class ConstantExpr;
  class Function;
  class GlobalValue;
  class Instruction;
#if LLVM_VERSION_CODE <= LLVM_VERSION(3, 1)
  class TargetData;
#else
  class DataLayout;
#endif
  class Twine;
  class Value;
}

namespace klee {
  class Array;
  struct Cell;
  class ExecutionState;
  class ExternalDispatcher;
  class Expr;
  class InstructionInfoTable;
  struct KFunction;
  struct KInstruction;
  class KInstIterator;
  class KModule;
  class MemoryManager;
  class MemoryObject;
  class ObjectState;
  class PTree;
  class Searcher;
  class SeedInfo;
  class SpecialFunctionHandler;
  struct StackFrame;
  class StatsTracker;
  class TimingSolver;
  class TreeStreamWriter;
  template<class T> class ref;

class FExecutor: public Executor{
  friend class BumpMergingSearcher;
  friend class MergingSearcher;
  friend class RandomPathSearcher;
  friend class OwningSearcher;
  friend class WeightedRandomSearcher;
  friend class SpecialFunctionHandler;
  friend class StatsTracker;
  friend class ToySearcher;

public:
  FExecutor(const InterpreterOptions &opts, InterpreterHandler *ie):Executor(opts, ie){
  }
  ~FExecutor();

protected:

  void executeFloatlibMethodArith(ExecutionState &state, KInstruction *ki, std::string method);
  void executeFloatlibMethodConv(ExecutionState &state, KInstruction *ki, std::string method);
  void executeFloatlibMethodCmp(ExecutionState &state, KInstruction *ki, std::string method);
  virtual void executeInstruction(ExecutionState &state, KInstruction *ki);

};

}

#endif
