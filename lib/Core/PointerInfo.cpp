//===-- PointerInfo.h -----------implementation by cyj-----*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is used to record the information of a pointer in struct. The information will be used to
// implement lazy initialization of struct list.
//
//===----------------------------------------------------------------------===//

#include "PointerInfo.h"
#include "llvm/Support/raw_ostream.h"

#include <iosfwd>
//#include <fstream>
#include <sstream>

using namespace llvm;
using namespace klee;

PointerInfo::PointerInfo(Type *pointerType, unsigned long address,
									std::string structName, std::string pointerName, SymbolicMOKind moKind)
	: pointerAddress(address),
	  typePointTo(pointerType),
	  structNamePointerBelong(structName),
	  pointerName(pointerName),
	  symbolicMOKind(moKind) {
//	std::stringstream info;		//cyj: 输出流
//	info << "pointerAddress: " << address <<"\n";
//	info << "typePointTo: " << typePointTo->getTypeID() <<"\n";
//	info << "structNamePointerBelong: " << structNamePointerBelong <<"\n";
//	info << "pointerName: " << pointerName <<"\n";
//	llvm::errs() << info.str();
}


