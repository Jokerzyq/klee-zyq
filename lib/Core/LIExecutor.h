//===-- Executor.h ----------------------------------------------*- C++ -*-===//


#ifndef KLEE_LIEXECUTOR_H
#define KLEE_LIEXECUTOR_H

#include "Executor.h"
#include "FExecutor.h"
#include "PointerInfo.h"


namespace klee {

class LIExecutor : public FExecutor {

protected:

	  std::map<const llvm::Type *, std::vector<std::string> > structMDNodeInfo;

	  std::map<const uint64_t, PointerInfo *> symbolicPointerInfoMap;

	  std::map<ref<Expr>, const MemoryObject *> symbolicPointerValue;

	  std::set<const MemoryObject *> argumentsMO;

	  unsigned int newStructObjectNum;

	  unsigned int newArrayObjectNum;

	  unsigned int newPointerArrayObjectNum;

	  unsigned int newFloatArrayObjectNum;

	  std::set<std::pair<llvm::Instruction*, std::string> > emittedErrors;

	  //zyq add----------------------------------------------------------------------------------------------------------------
	  std::map<const MemoryObject *, const llvm::GlobalValue *> reglobalObject;

	  std::multimap<const MemoryObject *, ref <Expr> >flaglobalObject;

	  bool Retflag;

	  void IRfork(ExecutionState &current);

	  bool IRinsert(ExecutionState &state, KInstruction *ki);

	  virtual void run(ExecutionState &initialState);
	  //end add----------------------------------------------------------------------------------------------------------------

	  virtual llvm::Module *setModule(llvm::Module *module, const ModuleOptions &opts);

	  void getStructMDNodeInfo();

	  virtual void executeInstruction(ExecutionState &state, KInstruction *ki);

	  virtual void executeMemoryOperation(ExecutionState &state,
			  	  	  	  	  bool isWrite, ref<Expr> address, ref<Expr> value, KInstruction *target);

	  virtual void executeMakeSymbolic(ExecutionState &state, const MemoryObject *mo, const std::string &name);

	  void getPointerInfoOfStruct(llvm::Type * structType, ExecutionState &state, uint64_t base, std::string name, bool isNewObject);

	  void lazyInitialization(ExecutionState &state, uint64_t address, ObjectPair op, ref<Expr> offset, Expr::Width type);

	  void lazyInitializationOfStructType(ExecutionState &current, PointerInfo *pointerInfo,
			  	  	  	  	  	  	  	  	  	  	  ObjectPair op, ref<Expr> offset, Expr::Width type);
	  void lazyInitializationOfIntegerType(ExecutionState &current, PointerInfo *pointerInfo,
	  			  	  	  	  	  	  	  	  	  	  	  ObjectPair op, ref<Expr> offset, Expr::Width type);
	  void lazyInitializationOfFloatType(ExecutionState &current, PointerInfo *pointerInfo,
	  													ObjectPair op, ref<Expr> offset, Expr::Width type);
	  void lazyInitializationOfPointerType(ExecutionState &current, PointerInfo *pointerInfo,
	  			  	  	  	  	  	  	  	  	  	  	  ObjectPair op, ref<Expr> offset, Expr::Width type);

	  std::string getLazyInitializationInfo(PointerInfo *pointer, std::string name);

	  void writeAndReadAfterStateFork(const ObjectState *os, ref<Expr> offset, ref<Expr> value,
			  	  	  const MemoryObject *mo, ExecutionState &state, Expr::Width type);

	  ExecutionState *lazyIniStateFork(ExecutionState *state, std::vector<std::string> previousInfo);

	  ExecutionState *outOfBoundFork(ExecutionState *state);

	  MemoryObject *lazyIniCreateNewStructObject(ExecutionState &state, llvm::Type *type);

	  MemoryObject *lazyIniCreateNewArrayObject(ExecutionState &state, llvm::Type *type);

	  MemoryObject *lazyIniCreateNewFloatArrayObject(ExecutionState &state, llvm::Type *type);

	  virtual void terminateStateOnExit(ExecutionState &state);

	  virtual void terminateStateOnError(ExecutionState &state,
	                               const llvm::Twine &message,
	                               const char *suffix,
	                               const llvm::Twine &longMessage="");

	  virtual void initializeGlobals(ExecutionState &state);

	  virtual void bindInstructionConstants(KInstruction *KI);


public:
	  LIExecutor(const InterpreterOptions &opts, InterpreterHandler *ie);

	  virtual ~LIExecutor();

	  static Interpreter *create(const InterpreterOptions &_interpreterOpts, InterpreterHandler *ih);

	  virtual void runOneFunction(llvm::Function *f);

	  virtual void resetEmittedErrors();

};

}

#endif
