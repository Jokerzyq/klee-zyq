//===-- Version.h -----------------------------------------------*- C++ -*-===//


#ifndef KLEE_CONFIG_IFLAZYINITIALIZATION_H
#define KLEE_CONFIG_IFLAZYINITIALIZATION_H


//----------------------------------------------------- 懒初始化 --------------------------------------
#define ifLazyInitialization true

#define maxCharArraySize 100

#define maxIntArraySize 20

#define maxPointerArraySize 10

#define maxFloatArraySize	 10

//---------------------------------------------------- 全局变量的符号化 ----------------------------
#define globalIsSymbolic true

//----------------------------------------- 是否允许extern全局变量的出现----------------------------
#define allowExternGlobal true


#endif
