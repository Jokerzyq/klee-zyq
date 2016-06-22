//===-- PointerInfo.h -----------implementation by cyj-----*- C++ -*-===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is used to record the information of a pointer in struct. The information will be used to
// implement lazy initialization of struct list.
//
//===----------------------------------------------------------------------===//

#ifndef __POINTERINFO_H__
#define __POINTERINFO_H__

#include "llvm/IR/Type.h"
#include <string>

namespace klee {

	enum PointerKind {
		pointToSturct = 0,
		pointToInteger,		//point to Arbitrary bit width integers
		pointToPointer		//双重指针
	};

	enum SymbolicMOKind {	//cyj: lazyInitialization函数中MO参数属于什么类型: 指针?结构体?新建的结构体?
		MOIsPointer = 0,
		MOIsStruct,
		MOIsNewCreateStruct,
		MOIsNewCreatePinterArray		// 双重指针
	};


	class PointerInfo {

	public:

	  PointerInfo(llvm::Type *pointerType, unsigned long address,
			  	  	  	  std::string structName, std::string pointerName, SymbolicMOKind moKind);
	  ~PointerInfo();

	  llvm::Type * getTypePointTo(){
		  return typePointTo;
	  }

	  std::string getPointerName(){
		  return pointerName;
	  }

	  std::string getStructNamePointerBelong(){
		  return structNamePointerBelong;
	  }

	  SymbolicMOKind getSymbolicMOKind(){
	  		  return symbolicMOKind;
	  }


	private:
	  //指针的地址
	  unsigned long pointerAddress;
	  // if this pointer is accessed
	  //bool beAccessed;
	  //指针所指向的类型 struct.Node
	  llvm::Type *typePointTo;
	  //指针所属的(子)结构体类型
	  //llvm::Type *structTypePointerBelong;	//FixMe: 是否有用, 无用删掉
	  //该指针的名字, 如 next
	  std::string pointerName;
	  //该指针所属的结构体的名字, 如 node1 (嵌套结构体: node1.abc)
	  std::string structNamePointerBelong;
	  //符号化MemoryObject(该指针所属的MO)的类型
	  SymbolicMOKind symbolicMOKind;

	};		//end class

}	//end namespace klee

#endif
