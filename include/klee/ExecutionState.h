//===-- ExecutionState.h ----------------------------------------*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef KLEE_EXECUTIONSTATE_H
#define KLEE_EXECUTIONSTATE_H

#include "klee/Constraints.h"
#include "klee/Expr.h"
#include "klee/Internal/ADT/TreeStream.h"
//qmh add
#include "../../lib/Core/CallPathManager.h"
//end add

//zyq add
#include "llvm/IR/BasicBlock.h"
//end add

// FIXME: We do not want to be exposing these? :(
#include "../../lib/Core/AddressSpace.h"
#include "klee/Internal/Module/KInstIterator.h"

#include <map>
#include <set>
#include <vector>

//qmh add
#include <string>
//end add

namespace klee {
class Array;
class CallPathNode;
struct Cell;
struct KFunction;
struct KInstruction;
class MemoryObject;
class PTreeNode;
struct InstructionInfo;

llvm::raw_ostream &operator<<(llvm::raw_ostream &os, const MemoryMap &mm);

struct StackFrame {
  //qmh add
  int frame_id;
  //end add
  KInstIterator caller;
  KFunction *kf;
  CallPathNode *callPathNode;

  std::vector<const MemoryObject *> allocas;
  Cell *locals;

  /// Minimum distance to an uncovered instruction once the function
  /// returns. This is not a good place for this but is used to
  /// quickly compute the context sensitive minimum distance to an
  /// uncovered instruction. This value is updated by the StatsTracker
  /// periodically.
  unsigned minDistToUncoveredOnReturn;

  // For vararg functions: arguments not passed via parameter are
  // stored (packed tightly) in a local (alloca) memory object. This
  // is setup to match the way the front-end generates vaarg code (it
  // does not pass vaarg through as expected). VACopy is lowered inside
  // of intrinsic lowering.
  MemoryObject *varargs;

  StackFrame(KInstIterator caller, KFunction *kf);
  StackFrame(const StackFrame &s);
  ~StackFrame();
};

/// @brief ExecutionState representing a path under exploration
class ExecutionState {
public:
  typedef std::vector<StackFrame> stack_ty;

private:
  // unsupported, use copy constructor
  ExecutionState &operator=(const ExecutionState &);

  std::map<std::string, std::string> fnAliases;

public:
  // Execution - Control Flow specific

  /// @brief Pointer to instruction to be executed after the current
  /// instruction
  KInstIterator pc;

  /// @brief Pointer to instruction which is currently executed
  KInstIterator prevPC;

  /// @brief Stack representing the current instruction stream
  stack_ty stack;

  /// @brief Remember from which Basic Block control flow arrived
  /// (i.e. to select the right phi values)
  unsigned incomingBBIndex;

  // Overall state of the state - Data specific

  /// @brief Address space used by this state (e.g. Global and Heap)
  AddressSpace addressSpace;

  /// @brief Constraints collected so far
  ConstraintManager constraints;

  /// Statistics and information

  /// @brief Costs for all queries issued for this state, in seconds
  mutable double queryCost;

  //qmh add
  	bool isBr;
    mutable int lib_id;
    mutable int priority;
    mutable int isInSoftFloat;
    mutable int ret_color;
    std::pair<std::string,std::string> currentFrame;
  //end add

  /// @brief Weight assigned for importance of this state.  Can be
  /// used for searchers to decide what paths to explore
  double weight;

  /// @brief Exploration depth, i.e., number of times KLEE branched for this state
  unsigned depth;

  /// @brief History of complete path: represents branches taken to
  /// reach/create this state (both concrete and symbolic)
  TreeOStream pathOS;

  /// @brief History of symbolic path: represents symbolic branches
  /// taken to reach/create this state
  TreeOStream symPathOS;

  /// @brief Counts how many instructions were executed since the last new
  /// instruction was covered.
  unsigned instsSinceCovNew;

  /// @brief Whether a new instruction was covered in this state
  bool coveredNew;

  /// @brief Disables forking for this state. Set by user code
  bool forkDisabled;

  /// @brief Set containing which lines in which files are covered by this state
  std::map<const std::string *, std::set<unsigned> > coveredLines;

  //cyj add----------------------------------------------------------------------------------------------------------------------
  typedef std::set<std::pair<llvm::Type *, ref<Expr> > > sturctMallocInfo;

  sturctMallocInfo mallocStructObject;	// malloc的MO的Type为int, 而不是struct, 没有结构体类型信息, 所以需要通过mallocInfo存储需要的信息

  std::map<const MemoryObject *, std::set<const MemoryObject *> > defineBeforeStructSymbolic;	//之后定义的MemoryObject不能被懒初始化取到

  std::map<const MemoryObject *, sturctMallocInfo > mallocBeforeStructSymbolic;	//之后malloc的MemoryObject不能被懒初始化取到

  std::map<uint64_t, bool> pointerBeAccessed;	//记录该指针是否被访问过(第一次访问)

  std::set<std::pair<llvm::Type *, std::pair<uint64_t, std::string> > > LICreateStructObject;//新建的Object没有allocSite, 不能记录类型信息

  std::vector<std::string> lazyIniInfo;	//记录懒初始化产生的结构体和array的形态信息, 并在最后输出

  std::map<uint64_t, uint64_t> maxDereferenceSize;	//只有指向Array的指针才会产生, 记录ArrayObject的解引用最大具体偏移量

  std::map<uint64_t, const MemoryObject *> arrayObjectSymbolicSize;		//<指针指向的Array地址, symbolicSize MO的地址>

  std::map<uint64_t, unsigned> pointToPointerLIOffset;	// first:记录所有存储双重指针的地址. second:该双重指针目前懒初始化的offset

  std::map<uint64_t, std::string> pointToPointerArrayName;	// first:记录所有存储双重指针的地址. second:该双重指针的Array名称

  std::map<uint64_t, llvm::Type *> pointToPointerArrayType;	// first:记录所有存储双重指针的地址. second:该双重指针所指的类型

  //add end----------------------------------------------------------------------------------------------------------------------

  /// @brief Pointer to the process tree of the current state
  PTreeNode *ptreeNode;

  /// @brief Ordered list of symbolics: used to generate test cases.
  //
  // FIXME: Move to a shared list structure (not critical).
  std::vector<std::pair<const MemoryObject *, const Array *> > symbolics;

  /// @brief Set of used array names for this state.  Used to avoid collisions.
  std::set<std::string> arrayNames;

  //zyq add------------------------------------------------------------
    std::multimap <llvm::BasicBlock *, int> BlockCount;
    std::set <llvm::BasicBlock *> BlockIRnum;
    llvm::BasicBlock *pBlock;
  //end add------------------------------------------------------------

  std::string getFnAlias(std::string fn);
  void addFnAlias(std::string old_fn, std::string new_fn);
  void removeFnAlias(std::string fn);

private:
  ExecutionState() : ptreeNode(0) {}

public:
  ExecutionState(KFunction *kf);

  // XXX total hack, just used to make a state so solver can
  // use on structure
  ExecutionState(const std::vector<ref<Expr> > &assumptions);

  ExecutionState(const ExecutionState &state);

  //cyj add
  ExecutionState(const ExecutionState &state, const std::vector<std::string> previousInfo);
  //end add

  ~ExecutionState();

  ExecutionState *branch();

  void pushFrame(KInstIterator caller, KFunction *kf);
  void popFrame();

  void addSymbolic(const MemoryObject *mo, const Array *array);
  void addConstraint(ref<Expr> e) { constraints.addConstraint(e); }
  	  	  	  	  //cyj: 把expr化简后加入到原有的约束条件里

  bool merge(const ExecutionState &b);
  void dumpStack(llvm::raw_ostream &out) const;

  //qmh add
  void updateFrame();
  //end add
};
}

#endif
