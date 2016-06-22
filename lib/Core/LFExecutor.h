//===-- LFExecutor.h ----------------------------------------------*- C++ -*-===//
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

#ifndef KLEE_LFEXECUTOR_H
#define KLEE_LFEXECUTOR_H
#include "LIExecutor.h"
#include "FExecutor.h"

/*
namespace klee{

	class LFExecutor: public LIExecutor, public FExecutor{
	  friend class BumpMergingSearcher;
	  friend class MergingSearcher;
	  friend class RandomPathSearcher;
	  friend class OwningSearcher;
	  friend class WeightedRandomSearcher;
	  friend class SpecialFunctionHandler;
	  friend class StatsTracker;
	  friend class ToySearcher;

	public:
		 LFExecutor(const InterpreterOptions &opts, InterpreterHandler *ie);
		 ~LFExecutor();

	protected:
	virtual void executeInstruction(ExecutionState &state, KInstruction *ki){}

	};



}
*/

#endif
