//===-- FloatingPoint.cpp --------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "FloatingPoint.h"
#include <algorithm>



bool isFPFunction(std::string function){
	return fpFunctions.end() != find(fpFunctions.begin(), fpFunctions.end(), function);
}

bool isFPStapleFunction(std::string function){
	return fpStapleFunctions.end() != find(fpStapleFunctions.begin(), fpStapleFunctions.end(), function);
}

bool isFPCmpFunction(std::string function){
	return fpCmpFunctions.end() != find(fpCmpFunctions.begin(), fpCmpFunctions.end(), function);
}

bool isFPEnough(klee::ExecutionState &state, klee::ref<klee::Expr> &result){
	if(isFPCmpFunction(state.currentFrame.second)) return ret_ok;
	else return ret_count>ret_count_max;
}
