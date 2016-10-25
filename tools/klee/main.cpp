/* -*- mode: c++; c-basic-offset: 2; -*- */

// FIXME: This does not belong here.
//qmh add
#include "../../lib/Core/FloatingPoint.h"
//end add
#include "../lib/Core/Common.h"

#include "klee/ExecutionState.h"
#include "klee/Expr.h"
#include "klee/Interpreter.h"
#include "klee/Statistics.h"
#include "klee/Config/Version.h"
#include "klee/Internal/ADT/KTest.h"
#include "klee/Internal/ADT/TreeStream.h"
#include "klee/Internal/Support/Debug.h"
#include "klee/Internal/Support/ModuleUtil.h"
#include "klee/Internal/System/Time.h"
#include "klee/Internal/Support/PrintVersion.h"

#if LLVM_VERSION_CODE > LLVM_VERSION(3, 2)
#include "llvm/IR/Constants.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#else
#include "llvm/Constants.h"
#include "llvm/Module.h"
#include "llvm/Type.h"
#include "llvm/InstrTypes.h"
#include "llvm/Instruction.h"
#include "llvm/Instructions.h"
#include "llvm/LLVMContext.h"
#include "llvm/Support/FileSystem.h"
#endif
#include "llvm/Support/FileSystem.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/raw_ostream.h"

#if LLVM_VERSION_CODE < LLVM_VERSION(3, 0)
#include "llvm/Target/TargetSelect.h"
#else
#include "llvm/Support/TargetSelect.h"
#endif
#include "llvm/Support/Signals.h"

#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
#include "llvm/Support/system_error.h"
#endif


//cyj add
#include "klee/Config/IfLazyInitialization.h"
#if ifLazyInitialization == true
#include "../lib/Core/LIExecutor.h"
#endif
//end add

#include <dirent.h>
#include <signal.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/wait.h>

#include <cerrno>
#include <fstream>
#include <iomanip>
#include <iterator>
#include <sstream>


using namespace llvm;
using namespace klee;

//qmh add
//namespace fpklee{
std::vector<std::string> fpFunctions;
std::vector<std::string> fpStapleFunctions;
std::vector<std::string> fpCmpFunctions;
//}
//using namespace fpklee;
//end add

//zyq add----------------------------------------------------------------------------------------------------------------
std::vector<Function *> IRfunction;
//end add----------------------------------------------------------------------------------------------------------------

namespace {
  cl::opt<std::string>		//cyj: opts info
  InputFile(cl::desc("<input bytecode>"), cl::Positional, cl::init("-"));

  cl::opt<std::string>
  RunInDir("run-in", cl::desc("Change to the given directory prior to executing"));

  cl::opt<std::string>
  Environ("environ", cl::desc("Parse environ from given file (in \"env\" format)"));

  cl::list<std::string>
  InputArgv(cl::ConsumeAfter, 
            cl::desc("<program arguments>..."));

  cl::opt<bool>
  NoOutput("no-output", 
           cl::desc("Don't generate test files"));
    
  cl::opt<bool>
  WarnAllExternals("warn-all-externals", 
                   cl::desc("Give initial warning for all externals."));
    
  cl::opt<bool>
  WriteCVCs("write-cvcs", 
            cl::desc("Write .cvc files for each test case"));

  cl::opt<bool>
  WritePCs("write-pcs", 
            cl::desc("Write .pc files for each test case"));
  
  cl::opt<bool>
  WriteSMT2s("write-smt2s",
            cl::desc("Write .smt2 (SMT-LIBv2) files for each test case"));

  cl::opt<bool>
  WriteCov("write-cov", 
           cl::desc("Write coverage information for each test case"));
  
  cl::opt<bool>
  WriteTestInfo("write-test-info", 
                cl::desc("Write additional test case information"));
  
  cl::opt<bool>
  WritePaths("write-paths", 
                cl::desc("Write .path files for each test case"));
    
  cl::opt<bool>
  WriteSymPaths("write-sym-paths", 
                cl::desc("Write .sym.path files for each test case"));
    
  cl::opt<bool>
  ExitOnError("exit-on-error", 
              cl::desc("Exit if errors occur"));
    

  enum LibcType {
    NoLibc, KleeLibc, UcLibc
  };

  cl::opt<LibcType>
  Libc("libc", 
       cl::desc("Choose libc version (none by default)."),
       cl::values(clEnumValN(NoLibc, "none", "Don't link in a libc"),
                  clEnumValN(KleeLibc, "klee", "Link in klee libc"),
		  clEnumValN(UcLibc, "uclibc", "Link in uclibc (adapted for klee)"),
		  clEnumValEnd),
       cl::init(NoLibc));

    
  cl::opt<bool>
  WithPOSIXRuntime("posix-runtime", 
		cl::desc("Link with POSIX runtime.  Options that can be passed as arguments to the programs are: --sym-argv <max-len>  --sym-argvs <min-argvs> <max-argvs> <max-len> + file model options"),
		cl::init(false));
    
  cl::opt<bool>
  OptimizeModule("optimize", 
                 cl::desc("Optimize before execution"),
		 cl::init(false));

  cl::opt<bool>
  CheckDivZero("check-div-zero", 
               cl::desc("Inject checks for division-by-zero"),
               cl::init(true));

  cl::opt<bool>
  CheckOvershift("check-overshift",
               cl::desc("Inject checks for overshift"),
               cl::init(true));

  cl::opt<std::string>
  OutputDir("output-dir", 
            cl::desc("Directory to write results in (defaults to klee-out-N)"),
            cl::init(""));

  cl::opt<bool>
  ReplayKeepSymbolic("replay-keep-symbolic", 
                     cl::desc("Replay the test cases only by asserting "
                              "the bytes, not necessarily making them concrete."));
    
  cl::list<std::string>
  ReplayOutFile("replay-out",
                cl::desc("Specify an out file to replay"),
                cl::value_desc("out file"));

  cl::list<std::string>
  ReplayOutDir("replay-out-dir",
	       cl::desc("Specify a directory to replay .out files from"),
	       cl::value_desc("output directory"));

  cl::opt<std::string>
  ReplayPathFile("replay-path",
                 cl::desc("Specify a path file to replay"),
                 cl::value_desc("path file"));

  cl::list<std::string>
  SeedOutFile("seed-out");
  
  cl::list<std::string>
  SeedOutDir("seed-out-dir");
  
  cl::opt<unsigned>
  MakeConcreteSymbolic("make-concrete-symbolic",
                       cl::desc("Probabilistic rate at which to make concrete reads symbolic, "
				"i.e. approximately 1 in n concrete reads will be made symbolic (0=off, 1=all).  "
				"Used for testing."),
                       cl::init(0));
 
  cl::opt<unsigned>
  StopAfterNTests("stop-after-n-tests",
	     cl::desc("Stop execution after generating the given number of tests.  Extra tests corresponding to partially explored paths will also be dumped."),
	     cl::init(0));

  cl::opt<bool>
  Watchdog("watchdog",
           cl::desc("Use a watchdog process to enforce --max-time."),
           cl::init(0));

  //cyj add-----------------------------------------------------------------------------------------------------------------------------------------
  cl::opt<bool>
  RunAllFunctions("run-all-functions",
                 cl::desc("Run all functions in module, not just main function. (default=false) (add by cyj)"),
		 cl::init(false));

  cl::list<std::string>
  RunSpecifiedFunction("run-specified-function",
	       cl::desc("Run specified function in module. (add by cyj)"),
	       cl::value_desc("specified function"));

  cl::list<std::string>
  FunctionExcept("function-except",
	       cl::desc("Run all functions except specified function. (add by cyj)"),
	       cl::value_desc("excepted function"));
  //end add----------------------------------------------------------------------------------------------------------------------------------------

  //zyq add----------------------------------------------------------------------------------------------------------------
  cl::list<std::string>
  InterruptFunction("interrupt-function",
		  cl::desc("Interrupt function(add by zyq)."),
		  cl::value_desc("interrupt function"));
  //end add----------------------------------------------------------------------------------------------------------------

}

extern cl::opt<double> MaxTime;

/***/

//cyj: KleeHandler最外层的控制器, 主要是通过main函数调用实现功能, 作用是生成输出结果的文件
class KleeHandler : public InterpreterHandler {
private:
  Interpreter *m_interpreter;
  TreeStreamWriter *m_pathWriter, *m_symPathWriter;
  llvm::raw_ostream *m_infoFile;

  SmallString<128> m_originalOutputDirectory;	//cyj: klee-out-i
  SmallString<128> m_outputDirectory;		//cyj: klee-out-i/functionName

  unsigned m_testIndex;  // number of tests written so far
  unsigned m_pathsExplored; // number of paths explored so far

  // used for writing .ktest files
  int m_argc;
  char **m_argv;

public:
  KleeHandler(int argc, char **argv);
  ~KleeHandler();

  llvm::raw_ostream &getInfoStream() const { return *m_infoFile; }
  unsigned getNumTestCases() { return m_testIndex; }
  unsigned getNumPathsExplored() { return m_pathsExplored; }
  void incPathsExplored() { m_pathsExplored++; }

  void setInterpreter(Interpreter *i);

  void processTestCase(const ExecutionState  &state,
                       const char *errorMessage, 
                       const char *errorSuffix);

  std::string getOutputFilename(const std::string &filename);
  llvm::raw_fd_ostream *openOutputFile(const std::string &filename);
  std::string getTestFilename(const std::string &suffix, unsigned id);
  llvm::raw_fd_ostream *openTestFile(const std::string &suffix, unsigned id);

  // load a .out file
  static void loadOutFile(std::string name, 
                          std::vector<unsigned char> &buffer);

  // load a .path file
  static void loadPathFile(std::string name, 
                           std::vector<bool> &buffer);

  static void getOutFiles(std::string path,
			  std::vector<std::string> &results);

  static std::string getRunTimeLibraryPath(const char *argv0);

  //cyj add--------------------------------------------------------------------------------------------------------------------------
  void setFunctionName(std::string &name);

  void parseExceptOutput(llvm::raw_ostream &file);

  void generateLazyIniInfoFile(std::vector<std::string> lazyIniInfo,
  		std::vector< std::pair<std::string, unsigned> > newArrayObjectSize,
  		std::vector< std::pair<std::string, unsigned char*> > newArrayObjectValue,
		unsigned id);
  //end add---------------------------------------------------------------------------------------------------------------------------
};

//cyj: KleeHandler作用: 获取符号执行结果的输出路径,在该路径生成klee-out-目录,并生成klee-last链接
//cyj: 在klee-out-目录下创建warnings.txt, messages.txt, info
KleeHandler::KleeHandler(int argc, char **argv)
  : m_interpreter(0),
    m_pathWriter(0),
    m_symPathWriter(0),
    m_infoFile(0),
	m_originalOutputDirectory(),
    m_outputDirectory(),
    m_testIndex(0),
    m_pathsExplored(0),
    m_argc(argc),
    m_argv(argv) {

  // create output directory (OutputDir or "klee-out-<i>")
  bool dir_given = OutputDir != "";
  SmallString<128> directory(dir_given ? OutputDir : InputFile);

  if (!dir_given) sys::path::remove_filename(directory);	//cyj: dir_given=0, directory=InputFile
  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	//cyj: 取InputFile的路径名, 去掉文件名
#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
  error_code ec;
  if ((ec = sys::fs::make_absolute(directory)) != errc::success) {	//cyj: 获得绝对路径
#else
  if (auto ec = sys::fs::make_absolute(directory)) {
#endif
    klee_error("unable to determine absolute path: %s", ec.message().c_str());
  }

  if (dir_given) {		//cyj: OutputDir != ""
    // OutputDir
    if (mkdir(directory.c_str(), 0775) < 0)
      klee_error("cannot create \"%s\": %s", directory.c_str(), strerror(errno));

    m_originalOutputDirectory = directory;
  } else {
    // "klee-out-<i>"
    int i = 0;
    for (; i <= INT_MAX; ++i) {
      SmallString<128> d(directory);
      llvm::sys::path::append(d, "klee-out-");
      raw_svector_ostream ds(d); ds << i; ds.flush();

      // create directory and try to link klee-last
      if (mkdir(d.c_str(), 0775) == 0) {
    	  m_originalOutputDirectory = d;

        SmallString<128> klee_last(directory);
        llvm::sys::path::append(klee_last, "klee-last");

        if (((unlink(klee_last.c_str()) < 0) && (errno != ENOENT)) ||
            symlink(m_originalOutputDirectory.c_str(), klee_last.c_str()) < 0) {

          klee_warning("cannot create klee-last symlink: %s", strerror(errno));
        }

        break;
      }

      // otherwise try again or exit on error
      if (errno != EEXIST)
        klee_error("cannot create \"%s\": %s", m_originalOutputDirectory.c_str(), strerror(errno));
    }
    if (i == INT_MAX && m_originalOutputDirectory.str().equals(""))
        klee_error("cannot create output directory: index out of range");
  }

  m_outputDirectory = m_originalOutputDirectory;

  if(!RunAllFunctions && RunSpecifiedFunction.empty()) {
    klee_message("output directory is \"%s\"", m_outputDirectory.c_str());

    // open warnings.txt
    std::string file_path = getOutputFilename("warnings.txt");		//cyj: 在klee-out-目录下创建warnings.txt
    if ((klee_warning_file = fopen(file_path.c_str(), "w")) == NULL)
      klee_error("cannot open file \"%s\": %s", file_path.c_str(), strerror(errno));

    // open messages.txt
    file_path = getOutputFilename("messages.txt");		//cyj: 在klee-out-目录下创建messages.txt
    if ((klee_message_file = fopen(file_path.c_str(), "w")) == NULL)
      klee_error("cannot open file \"%s\": %s", file_path.c_str(), strerror(errno));

    // open info
    m_infoFile = openOutputFile("info");		//cyj: 在klee-out-目录下创建info
  }
}


KleeHandler::~KleeHandler() {
  if (m_pathWriter) delete m_pathWriter;
  if (m_symPathWriter) delete m_symPathWriter;
  fclose(klee_warning_file);
  fclose(klee_message_file);
  delete m_infoFile;
}


void KleeHandler::setFunctionName(std::string &name) {
	  //cyj add--------------------------------------------------------------------------------------------------------------------------------
	  m_testIndex = 0;
	  m_pathsExplored = 0;
	  m_outputDirectory = m_originalOutputDirectory;
	  llvm::sys::path::append(m_outputDirectory, name);
	  if (mkdir(m_outputDirectory.c_str(), 0775) < 0)
	       klee_error("cannot create \"%s\": %s", m_outputDirectory.c_str(), strerror(errno));
	  //end add-------------------------------------------------------------------------------------------------------------------------------

	  klee_message("output directory is \"%s\"", m_outputDirectory.c_str());
	  // open warnings.txt
	  std::string file_path = getOutputFilename("warnings.txt");		//cyj: 在klee-out-/functionName目录下创建warnings.txt
	  if ((klee_warning_file = fopen(file_path.c_str(), "w")) == NULL)
	    klee_error("cannot open file \"%s\": %s", file_path.c_str(), strerror(errno));

	  // open messages.txt
	  file_path = getOutputFilename("messages.txt");		//cyj: 在klee-out-/functionName目录下创建messages.txt
	  if ((klee_message_file = fopen(file_path.c_str(), "w")) == NULL)
	    klee_error("cannot open file \"%s\": %s", file_path.c_str(), strerror(errno));

	  // open info
	  m_infoFile = openOutputFile("info");		//cyj: 在klee-out-/functionName目录下创建info
}


//cyj: 配置解释器
void KleeHandler::setInterpreter(Interpreter *i) {
  m_interpreter = i;

  if (WritePaths) {		//cyj: Write .path files for each test case
    m_pathWriter = new TreeStreamWriter(getOutputFilename("paths.ts"));
    assert(m_pathWriter->good());
    m_interpreter->setPathWriter(m_pathWriter);		//cyj: 配置解释器
  }

  if (WriteSymPaths) {		//cyj: Write .sym.path files for each test case
    m_symPathWriter = new TreeStreamWriter(getOutputFilename("symPaths.ts"));
    assert(m_symPathWriter->good());
    m_interpreter->setSymbolicPathWriter(m_symPathWriter);		//cyj: 配置解释器
  }
}

//cyj: getOutputFilename作用: 返回"klee-out-目录下的filename文件"文件名
std::string KleeHandler::getOutputFilename(const std::string &filename) {
  SmallString<128> path = m_outputDirectory;
  sys::path::append(path,filename);
  return path.str();
}

//cyj: openOutputFile作用: 返回输出流"klee-out-目录下的filename文件"
llvm::raw_fd_ostream *KleeHandler::openOutputFile(const std::string &filename) {
  llvm::raw_fd_ostream *f;
  std::string Error;
  std::string path = getOutputFilename(filename);
#if LLVM_VERSION_CODE >= LLVM_VERSION(3,5)
  f = new llvm::raw_fd_ostream(path.c_str(), Error, llvm::sys::fs::F_None);
#elif LLVM_VERSION_CODE >= LLVM_VERSION(3,4)
  f = new llvm::raw_fd_ostream(path.c_str(), Error, llvm::sys::fs::F_Binary);
	  	  //cyj: raw_fd_ostream - A raw_ostream that writes to a file descriptor.
#else
  f = new llvm::raw_fd_ostream(path.c_str(), Error, llvm::raw_fd_ostream::F_Binary);
#endif
  if (!Error.empty()) {
    klee_error("error opening file \"%s\".  KLEE may have run out of file "
               "descriptors: try to increase the maximum number of open file "
               "descriptors by using ulimit (%s).",
               filename.c_str(), Error.c_str());
    delete f;
    f = NULL;
  }

  return f;
}


//cyj: 返回test00000*.suffix文件名
std::string KleeHandler::getTestFilename(const std::string &suffix, unsigned id) {
  std::stringstream filename;
  filename << "test" << std::setfill('0') << std::setw(6) << id << '.' << suffix;
  return filename.str();
}

llvm::raw_fd_ostream *KleeHandler::openTestFile(const std::string &suffix,
                                                unsigned id) {
  return openOutputFile(getTestFilename(suffix, id));
}

//cyj: 只有在terminateState时才会调用processTestCase函数
//cyj: 通过求解器计算当前state每个符号化变量的初始值, 生成一个testcase(test00000*.****文件).
/* Outputs all files (.ktest, .pc, .cov etc.) describing a test case */
void KleeHandler::processTestCase(const ExecutionState &state,
                                  const char *errorMessage, 
                                  const char *errorSuffix) {
  if (errorMessage && ExitOnError) {
    llvm::errs() << "EXITING ON ERROR:\n" << errorMessage << "\n";
    exit(1);
  }

  if (!NoOutput) {		//cyj: NoOutput: Don't generate test files
    std::vector< std::pair<std::string, std::vector<unsigned char> > > out;
    bool success = m_interpreter->getSymbolicSolution(state, out);
    						//cyj: 只有processTestCase函数会调用getSymbolicSolution函数.
    						//cyj: 通过求解器计算当前state每个符号化变量的具体值, 结果放入out内

    if (!success)
      klee_warning("unable to get symbolic solution, losing test case");

    double start_time = util::getWallTime();

    unsigned id = ++m_testIndex;

    //cyj: replay模式也会生成输出文件   success=1, out=null
    //cyj add-------------------------------------------------------------------------------------------------------------------------------
#if ifLazyInitialization == true
    std::string newArrayObjectName = "newArrayObject";
    std::vector< std::pair<std::string, unsigned> > newArrayObjectSize;
    std::vector< std::pair<std::string, unsigned char*> > newArrayObjectValue;
#endif
    //end add-------------------------------------------------------------------------------------------------------------------------------
    if (success) {
        KTest b;
        b.numArgs = m_argc;
        b.args = m_argv;
       	b.symArgvs = 0;
       	b.symArgvLen = 0;
       	b.numObjects = out.size();		//cyj: 符号化变量的数量
       	b.objects = new KTestObject[b.numObjects];		//cyj: 符号化变量的对象
       	assert(b.objects);
       	for (unsigned i=0; i<b.numObjects; i++) {
       		KTestObject *o = &b.objects[i];
       		o->name = const_cast<char*>(out[i].first.c_str());
//cyj add--------------------------------------------------------------------------------------------------------------------------------
#if ifLazyInitialization == true
       		std::string oName = o->name;
       		if (!oName.find(newArrayObjectName)){
       			if(oName.find("_size") < oName.size()){	//	懒初始化产生的size的符号化变量
       				o->numBytes = out[i].second.size();		//cyj: 8
       				o->bytes = new unsigned char[o->numBytes];
       				assert(o->bytes);
       				std::copy(out[i].second.begin(), out[i].second.end(), o->bytes);

        			unsigned oValue = 0;
        			for(int j=o->numBytes-1; j>=0; j--){
        				oValue *= 16*16;
        				oValue += o->bytes[j];
       				}
       				newArrayObjectSize.push_back(std::make_pair(oName, oValue));
       			} else {
       				o->numBytes = newArrayObjectSize.back().second;		// 上一个size的具体值
       				o->bytes = new unsigned char[o->numBytes];
       				assert(o->bytes);
       				std::copy(out[i].second.begin(), out[i].second.begin()+o->numBytes, o->bytes);
       				newArrayObjectValue.push_back(std::make_pair(oName, o->bytes));
       			}
       		} else {
       			o->numBytes = out[i].second.size();			//cyj: 某个符号化变量的位数
       			o->bytes = new unsigned char[o->numBytes];
        		assert(o->bytes);
        		std::copy(out[i].second.begin(), out[i].second.end(), o->bytes);
        	}
#else
        	o->numBytes = out[i].second.size();			//cyj: 某个符号化变量的位数
        	o->bytes = new unsigned char[o->numBytes];
        	assert(o->bytes);
        	std::copy(out[i].second.begin(), out[i].second.end(), o->bytes);
#endif
//end add-------------------------------------------------------------------------------------------------------------------------------
        }			//cyj: 对b.objects分别赋值

        if (!kTest_toFile(&b, getOutputFilename(getTestFilename("ktest", id)).c_str())) {
       		//cyj: kTest_toFile: 将b内容写入klee-out-*/test00000*.ktest)文件中
       		klee_warning("unable to write output test case, losing it");
       	}

        //cyj add------------------------------------------------------------------------------------------------------
#if ifLazyInitialization == true
        generateLazyIniInfoFile(state.lazyIniInfo, newArrayObjectSize, newArrayObjectValue, id);
#endif
        //end add-----------------------------------------------------------------------------------------------------

        for (unsigned i=0; i<b.numObjects; i++)
       		delete[] b.objects[i].bytes;
       	delete[] b.objects;
       }

       if (errorMessage) {			//cyj: 生成***.err文件
         llvm::raw_ostream *f = openTestFile(errorSuffix, id);
         *f << errorMessage;
         delete f;
       }

       if (m_pathWriter) {		//cyj: 生成.path文件
         std::vector<unsigned char> concreteBranches;
         m_pathWriter->readStream(m_interpreter->getPathStreamID(state),
                                  concreteBranches);
         llvm::raw_fd_ostream *f = openTestFile("path", id);
         for (std::vector<unsigned char>::iterator I = concreteBranches.begin(),
                                                   E = concreteBranches.end();
              I != E; ++I) {
           *f << *I << "\n";
         }
         delete f;
       }

       if (errorMessage || WritePCs) {		//cyj: 生成.pc文件
         std::string constraints;
         m_interpreter->getConstraintLog(state, constraints,Interpreter::KQUERY);
         llvm::raw_ostream *f = openTestFile("pc", id);
         *f << constraints;
         delete f;
       }

       if (WriteCVCs) {			//cyj: 生成.cvc文件
         std::string constraints;
         m_interpreter->getConstraintLog(state, constraints, Interpreter::STP);
         llvm::raw_ostream *f = openTestFile("cvc", id);
         *f << constraints;
         delete f;
       }

       if(WriteSMT2s) {			//cyj: 生成.smt2文件
         std::string constraints;
         m_interpreter->getConstraintLog(state, constraints, Interpreter::SMTLIB2);
         llvm::raw_ostream *f = openTestFile("smt2", id);
         *f << constraints;
         delete f;
       }

       if (m_symPathWriter) {		//cyj: 生成.sym.path文件
         std::vector<unsigned char> symbolicBranches;
         m_symPathWriter->readStream(m_interpreter->getSymbolicPathStreamID(state),
                                     symbolicBranches);
         llvm::raw_fd_ostream *f = openTestFile("sym.path", id);
         for (std::vector<unsigned char>::iterator I = symbolicBranches.begin(), E = symbolicBranches.end(); I!=E; ++I) {
           *f << *I << "\n";
         }
         delete f;
       }

       if (WriteCov) {			//cyj: 生成.cov文件
         std::map<const std::string*, std::set<unsigned> > cov;
         m_interpreter->getCoveredLines(state, cov);
         llvm::raw_ostream *f = openTestFile("cov", id);
         for (std::map<const std::string*, std::set<unsigned> >::iterator
                 it = cov.begin(), ie = cov.end();
        		 it != ie; ++it) {
           for (std::set<unsigned>::iterator
                   it2 = it->second.begin(), ie = it->second.end();
        		   it2 != ie; ++it2)
             *f << *it->first << ":" << *it2 << "\n";
         }
         delete f;
       }

       if (m_testIndex == StopAfterNTests)		//cyj: stop-after-n-tests: init(0)
         m_interpreter->setHaltExecution(true);

       if (WriteTestInfo) {			//cyj: 生成.info文件
         double elapsed_time = util::getWallTime() - start_time;
         llvm::raw_ostream *f = openTestFile("info", id);
         *f << "Time to generate test case: "
            << elapsed_time << "s\n";
         delete f;
       }
    }
}

  // load a .path file
void KleeHandler::loadPathFile(std::string name, 
                                     std::vector<bool> &buffer) {
  std::ifstream f(name.c_str(), std::ios::in | std::ios::binary);

  if (!f.good())
    assert(0 && "unable to open path file");

  while (f.good()) {
    unsigned value;
    f >> value;
    buffer.push_back(!!value);
    f.get();
  }
}

//cyj: 把path所在目录(klee-out-)中的所有.ktest文件名加入results中
void KleeHandler::getOutFiles(std::string path,
			      std::vector<std::string> &results) {
#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
  error_code ec;
#else
  std::error_code ec;
#endif
  for (llvm::sys::fs::directory_iterator i(path,ec),e; i!=e && !ec; i.increment(ec)){
    std::string f = (*i).path();
    if (f.substr(f.size()-6,f.size()) == ".ktest") {
          results.push_back(f);
    }
  }

  if (ec) {
    llvm::errs() << "ERROR: unable to read output directory: " << path << ": "
                 << ec.message() << "\n";
    exit(1);
  }
}

//cyj: 得到RunTime LibraryPath: KLEE_INSTALL_RUNTIME_DIR, KLEE_DIR+....
std::string KleeHandler::getRunTimeLibraryPath(const char *argv0) {
  // allow specifying the path to the runtime library
  const char *env = getenv("KLEE_RUNTIME_LIBRARY_PATH");
  	  	  //cyj: getenv() 参数为环境变量的名称，如果该变量存在则会返回指向该内容的指针
  if (env)
    return std::string(env);

  // Take any function from the execution binary but not main (as not allowed by
  // C++ standard)
  void *MainExecAddr = (void *)(intptr_t)getRunTimeLibraryPath;		//cyj: 这是什么意思?
  SmallString<128> toolRoot(
      #if LLVM_VERSION_CODE >= LLVM_VERSION(3,4)
      llvm::sys::fs::getMainExecutable(argv0, MainExecAddr)
      #else
      llvm::sys::Path::GetMainExecutable(argv0, MainExecAddr).str()
      #endif
      );

  // Strip off executable so we have a directory path
  llvm::sys::path::remove_filename(toolRoot);

  SmallString<128> libDir;

  if ( strcmp(toolRoot.c_str(), KLEE_INSTALL_BIN_DIR ) == 0)
  {
    KLEE_DEBUG_WITH_TYPE("klee_runtime", llvm::dbgs() <<
                         "Using installed KLEE library runtime: ");
    libDir = KLEE_INSTALL_RUNTIME_DIR ;
  }
  else
  {
    KLEE_DEBUG_WITH_TYPE("klee_runtime", llvm::dbgs() <<
                         "Using build directory KLEE library runtime :");
    libDir = KLEE_DIR;
    llvm::sys::path::append(libDir,RUNTIME_CONFIGURATION);
    llvm::sys::path::append(libDir,"lib");
  }

  KLEE_DEBUG_WITH_TYPE("klee_runtime", llvm::dbgs() <<
                       libDir.c_str() << "\n");
  return libDir.str();
}

//===----------------------------------------------------------------------===//
// main Driver function
//
//cyj: strip 删除字符串中开头、结尾处的空格
static std::string strip(std::string &in) {
  unsigned len = in.size();
  unsigned lead = 0, trail = len;
  while (lead<len && isspace(in[lead]))	//cyj: isspace(int c)若参数c为空格字符，则返回TRUE，否则返回NULL(0)
    ++lead;
  while (trail>lead && isspace(in[trail-1]))
    --trail;
  return in.substr(lead, trail-lead);		//cyj: 为什么不是(lead, trail)?
}

//cyj:
static void parseArguments(int argc, char **argv) {
  cl::SetVersionPrinter(klee::printVersion);		//cyj: klee -version
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 2)		//cyj: (3,4)
  // This version always reads response files
  cl::ParseCommandLineOptions(argc, argv, " klee\n");
#else
  cl::ParseCommandLineOptions(argc, argv, " klee\n", /*ReadResponseFiles=*/ true);
#endif
}

//cyj: 在module存储的main函数的指令前加入initEnv指令
static int initEnv(Module *mainModule) {

  /*
    Instructions:
    nArgcP = alloc oldArgc->getType()
    nArgvV = alloc oldArgv->getType()
    store oldArgc nArgcP
    store oldArgv nArgvP
    klee_init_environment(nArgcP, nArgvP)
    nArgc = load nArgcP
    nArgv = load nArgvP
    oldArgc->replaceAllUsesWith(nArgc)
    oldArgv->replaceAllUsesWith(nArgv)
    firstInst
  */

  Function *mainFn = mainModule->getFunction("main");
    
  if (mainFn->arg_size() < 2) {
    klee_error("Cannot handle ""--posix-runtime"" when main() has less than two arguments.\n");
  }

  Instruction* firstInst = mainFn->begin()->begin();

  Value* oldArgc = mainFn->arg_begin();
  Value* oldArgv = ++mainFn->arg_begin();
  
  AllocaInst* argcPtr = 
    new AllocaInst(oldArgc->getType(), "argcPtr", firstInst);
  AllocaInst* argvPtr = 
    new AllocaInst(oldArgv->getType(), "argvPtr", firstInst);

  /* Insert void klee_init_env(int* argc, char*** argv) */
  std::vector<const Type*> params;
  params.push_back(Type::getInt32Ty(getGlobalContext()));
  params.push_back(Type::getInt32Ty(getGlobalContext()));
  Function* initEnvFn = 
    cast<Function>(mainModule->getOrInsertFunction("klee_init_env",
                                                   Type::getVoidTy(getGlobalContext()),
                                                   argcPtr->getType(),
                                                   argvPtr->getType(),
                                                   NULL));
  assert(initEnvFn);    
  std::vector<Value*> args;
  args.push_back(argcPtr);
  args.push_back(argvPtr);
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 0)
  Instruction* initEnvCall = CallInst::Create(initEnvFn, args,
					      "", firstInst);
#else
  Instruction* initEnvCall = CallInst::Create(initEnvFn, args.begin(), args.end(), 
					      "", firstInst);
#endif
  Value *argc = new LoadInst(argcPtr, "newArgc", firstInst);
  Value *argv = new LoadInst(argvPtr, "newArgv", firstInst);
  
  oldArgc->replaceAllUsesWith(argc);
  oldArgv->replaceAllUsesWith(argv);

  new StoreInst(oldArgc, argcPtr, initEnvCall);
  new StoreInst(oldArgv, argvPtr, initEnvCall);

  return 0;
}


// This is a terrible hack until we get some real modeling of the
// system. All we do is check the undefined symbols and warn about
// any "unrecognized" externals and about any obviously unsafe ones.

// Symbols we explicitly support
static const char *modelledExternals[] = {
  "_ZTVN10__cxxabiv117__class_type_infoE",
  "_ZTVN10__cxxabiv120__si_class_type_infoE",
  "_ZTVN10__cxxabiv121__vmi_class_type_infoE",

  // special functions
  "_assert", 
  "__assert_fail", 
  "__assert_rtn", 
  "calloc", 
  "_exit", 
  "exit", 
  "free", 
  "abort", 
  "klee_abort", 
  "klee_assume", 
  "klee_check_memory_access",
  "klee_define_fixed_object",
  "klee_get_errno", 
  "klee_get_valuef",
  "klee_get_valued",
  "klee_get_valuel",
  "klee_get_valuell",
  "klee_get_value_i32",
  "klee_get_value_i64",
  "klee_get_obj_size", 
  "klee_is_symbolic", 
  "klee_make_symbolic", 
  "klee_mark_global", 
  "klee_merge", 
  "klee_prefer_cex",
  "klee_print_expr", 
  "klee_print_range", 
  "klee_report_error", 
  "klee_set_forking",
  "klee_silent_exit", 
  "klee_warning", 
  "klee_warning_once", 
  "klee_alias_function",
  "klee_stack_trace",
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 1)
  "llvm.dbg.declare",
  "llvm.dbg.value",
#endif
  "llvm.va_start", 
  "llvm.va_end", 
  "malloc", 
  "realloc", 
  "_ZdaPv", 
  "_ZdlPv", 
  "_Znaj", 
  "_Znwj", 
  "_Znam", 
  "_Znwm", 
  "__ubsan_handle_add_overflow",
  "__ubsan_handle_sub_overflow",
  "__ubsan_handle_mul_overflow",
  "__ubsan_handle_divrem_overflow",
};
// Symbols we aren't going to warn about
static const char *dontCareExternals[] = {
#if 0
  // stdio
  "fprintf",
  "fflush",
  "fopen",
  "fclose",
  "fputs_unlocked",
  "putchar_unlocked",
  "vfprintf",
  "fwrite",
  "puts",
  "printf",
  "stdin",
  "stdout",
  "stderr",
  "_stdio_term",
  "__errno_location",
  "fstat",
#endif

  // static information, pretty ok to return
  "getegid",
  "geteuid",
  "getgid",
  "getuid",
  "getpid",
  "gethostname",
  "getpgrp",
  "getppid",
  "getpagesize",
  "getpriority",
  "getgroups",
  "getdtablesize",
  "getrlimit",
  "getrlimit64",
  "getcwd",
  "getwd",
  "gettimeofday",
  "uname",

  // fp stuff we just don't worry about yet
  "frexp",  
  "ldexp",
  "__isnan",
  "__signbit",
};
// Extra symbols we aren't going to warn about with klee-libc
static const char *dontCareKlee[] = {
  "__ctype_b_loc",
  "__ctype_get_mb_cur_max",

  // io system calls
  "open",
  "write",
  "read",
  "close",
};
// Extra symbols we aren't going to warn about with uclibc
static const char *dontCareUclibc[] = {
  "__dso_handle",

  // Don't warn about these since we explicitly commented them out of
  // uclibc.
  "printf",
  "vprintf"
};
// Symbols we consider unsafe
static const char *unsafeExternals[] = {
  "fork", // oh lord
  "exec", // heaven help us
  "error", // calls _exit
  "raise", // yeah
  "kill", // mmmhmmm
};

//cyj: 检查module中出现的所有外部调用/函数/全局变量的合法性安全性
#define NELEMS(array) (sizeof(array)/sizeof(array[0]))
void externalsAndGlobalsCheck(const Module *m) {
  std::map<std::string, bool> externals;
  std::set<std::string> modelled(modelledExternals, 		//cyj: 字符串起始地址
                                 modelledExternals+NELEMS(modelledExternals));	//cyj: 字符串结束地址
  std::set<std::string> dontCare(dontCareExternals, 
                                 dontCareExternals+NELEMS(dontCareExternals));
  std::set<std::string> unsafe(unsafeExternals, 
                               unsafeExternals+NELEMS(unsafeExternals));

  switch (Libc) {
  case KleeLibc: 
    dontCare.insert(dontCareKlee, dontCareKlee+NELEMS(dontCareKlee));
    break;
  case UcLibc:
    dontCare.insert(dontCareUclibc,
                    dontCareUclibc+NELEMS(dontCareUclibc));
    break;
  case NoLibc: /* silence compiler warning */
    break;
  }
  

  if (WithPOSIXRuntime)
    dontCare.insert("syscall");

  for (Module::const_iterator fnIt = m->begin(), fn_ie = m->end(); 	//cyj: Module中第一个函数, 最后一个函数
       fnIt != fn_ie; ++fnIt) {
	//llvm::errs() << fnIt->getName().data() << "\n";
    if (fnIt->isDeclaration() && !fnIt->use_empty())	//cyj: Return 'true' if the global value is a declaration.
      externals.insert(std::make_pair(fnIt->getName(), false));
    for (Function::const_iterator bbIt = fnIt->begin(), bb_ie = fnIt->end(); 
         bbIt != bb_ie; ++bbIt) {
      for (BasicBlock::const_iterator it = bbIt->begin(), ie = bbIt->end(); 
           it != ie; ++it) {
        if (const CallInst *ci = dyn_cast<CallInst>(it)) {
          if (isa<InlineAsm>(ci->getCalledValue())) {			//cyj: InlineAsm: 内嵌汇编
        	  	  //cyj: Get a pointer to the function that is invoked by this instruction.
        	 klee_warning_once(&*fnIt,
                              "function \"%s\" has inline asm", 
                              fnIt->getName().data());
          }
        }
      }
    }
  }
  for (Module::const_global_iterator 
         it = m->global_begin(), ie = m->global_end(); 
       it != ie; ++it)
    if (it->isDeclaration() && !it->use_empty())
      externals.insert(std::make_pair(it->getName(), true));
  // and remove aliases(别名) (they define the symbol after global
  // initialization)
  for (Module::const_alias_iterator 
         it = m->alias_begin(), ie = m->alias_end(); 
       it != ie; ++it) {
    std::map<std::string, bool>::iterator it2 = 
      externals.find(it->getName());
    if (it2!=externals.end())
      externals.erase(it2);
  }

  std::map<std::string, bool> foundUnsafe;
  for (std::map<std::string, bool>::iterator
         it = externals.begin(), ie = externals.end();
       it != ie; ++it) {
    const std::string &ext = it->first;
    if (!modelled.count(ext) && (WarnAllExternals || 
                                 !dontCare.count(ext))) {
      if (unsafe.count(ext)) {
        foundUnsafe.insert(*it);
      } else {
        klee_warning("undefined reference to %s: %s",
                     it->second ? "variable" : "function",
                     ext.c_str());
      }
    }
  }

  for (std::map<std::string, bool>::iterator
         it = foundUnsafe.begin(), ie = foundUnsafe.end();
       it != ie; ++it) {
    const std::string &ext = it->first;
    klee_warning("undefined reference to %s: %s (UNSAFE)!",
                 it->second ? "variable" : "function",
                 ext.c_str());
  }
}

static Interpreter *theInterpreter = 0;

static bool interrupted = false;

// Pulled out so it can be easily called from a debugger.
extern "C"
void halt_execution() {
  theInterpreter->setHaltExecution(true);
}

extern "C"
void stop_forking() {
  theInterpreter->setInhibitForking(true);
}

static void interrupt_handle() {
  if (!interrupted && theInterpreter) {
    llvm::errs() << "KLEE: ctrl-c detected, requesting interpreter to halt.\n";
    halt_execution();
    sys::SetInterruptFunction(interrupt_handle);
  } else {
    llvm::errs() << "KLEE: ctrl-c detected, exiting.\n";
    exit(1);
  }
  interrupted = true;
}

static void interrupt_handle_watchdog() {
  // just wait for the child to finish
}

// This is a temporary hack. If the running process has access to
// externals then it can disable interrupts, which screws up the
// normal "nice" watchdog termination process. We try to request the
// interpreter to halt using this mechanism as a last resort to save
// the state data before going ahead and killing it.
//cyj: @brief: 可以被阻塞的结束进程
static void halt_via_gdb(int pid) {
  char buffer[256];
  sprintf(buffer, 
          "gdb --batch --eval-command=\"p halt_execution()\" "
          "--eval-command=detach --pid=%d &> /dev/null",
          pid);
  //  fprintf(stderr, "KLEE: WATCHDOG: running: %s\n", buffer);
  if (system(buffer)==-1) 
    perror("system");
}

// returns the end of the string put in buf
//cyj: 在buf中加入时间信息
static char *format_tdiff(char *buf, long seconds)
{
  assert(seconds >= 0);

  long minutes = seconds / 60;  seconds %= 60;
  long hours   = minutes / 60;  minutes %= 60;
  long days    = hours   / 24;  hours   %= 24;

  buf = strrchr(buf, '\0');		//cyj: strrchr() 函数查找字符在指定字符串中从正面开始的最后一次出现的位置，
  	  	  	  	  	  	  	  	//cyj: 如果成功，则返回从该位置到字符串结尾的所有字符
  if (days > 0) buf += sprintf(buf, "%ld days, ", days);		//cyj: 把格式化的数据写入buf字符串中, 返回字符串长度
  buf += sprintf(buf, "%02ld:%02ld:%02ld", hours, minutes, seconds);
  return buf;
}

#ifndef SUPPORT_KLEE_UCLIBC
static llvm::Module *linkWithUclibc(llvm::Module *mainModule, StringRef libDir) {
  fprintf(stderr, "error: invalid libc, no uclibc support!\n");
  exit(1);
  return 0;
}
#else
static void replaceOrRenameFunction(llvm::Module *module,
		const char *old_name, const char *new_name)
{
  Function *f, *f2;
  f = module->getFunction(new_name);
  f2 = module->getFunction(old_name);
  if (f2) {
    if (f) {
      f2->replaceAllUsesWith(f);
      f2->eraseFromParent();
    } else {
      f2->setName(new_name);
      assert(f2->getName() == new_name);
    }
  }
}
static llvm::Module *linkWithUclibc(llvm::Module *mainModule, StringRef libDir) {
  // Ensure that klee-uclibc exists
  SmallString<128> uclibcBCA(libDir);
  llvm::sys::path::append(uclibcBCA, KLEE_UCLIBC_BCA_NAME);

  bool uclibcExists=false;
  llvm::sys::fs::exists(uclibcBCA.c_str(), uclibcExists);
  if (!uclibcExists)
    klee_error("Cannot find klee-uclibc : %s", uclibcBCA.c_str());

  Function *f;
  // force import of __uClibc_main
  mainModule->getOrInsertFunction("__uClibc_main",
                                  FunctionType::get(Type::getVoidTy(getGlobalContext()),
                                               std::vector<LLVM_TYPE_Q Type*>(),
                                                    true));
  
  // force various imports
  if (WithPOSIXRuntime) {
    LLVM_TYPE_Q llvm::Type *i8Ty = Type::getInt8Ty(getGlobalContext());
    mainModule->getOrInsertFunction("realpath",
                                    PointerType::getUnqual(i8Ty),
                                    PointerType::getUnqual(i8Ty),
                                    PointerType::getUnqual(i8Ty),
                                    NULL);
    mainModule->getOrInsertFunction("getutent",
                                    PointerType::getUnqual(i8Ty),
                                    NULL);
    mainModule->getOrInsertFunction("__fgetc_unlocked",
                                    Type::getInt32Ty(getGlobalContext()),
                                    PointerType::getUnqual(i8Ty),
                                    NULL);
    mainModule->getOrInsertFunction("__fputc_unlocked",
                                    Type::getInt32Ty(getGlobalContext()),
                                    Type::getInt32Ty(getGlobalContext()),
                                    PointerType::getUnqual(i8Ty),
                                    NULL);
  }

  f = mainModule->getFunction("__ctype_get_mb_cur_max");
  if (f) f->setName("_stdlib_mb_cur_max");

  // Strip of asm prefixes for 64 bit versions because they are not
  // present in uclibc and we want to make sure stuff will get
  // linked. In the off chance that both prefixed and unprefixed
  // versions are present in the module, make sure we don't create a
  // naming conflict.
  for (Module::iterator fi = mainModule->begin(), fe = mainModule->end();
       fi != fe; ++fi) {
    Function *f = fi;
    const std::string &name = f->getName();
    if (name[0]=='\01') {
      unsigned size = name.size();
      if (name[size-2]=='6' && name[size-1]=='4') {
        std::string unprefixed = name.substr(1);

        // See if the unprefixed version exists.
        if (Function *f2 = mainModule->getFunction(unprefixed)) {
          f->replaceAllUsesWith(f2);
          f->eraseFromParent();
        } else {
          f->setName(unprefixed);
        }
      }
    }
  }
  
  mainModule = klee::linkWithLibrary(mainModule, uclibcBCA.c_str());
  assert(mainModule && "unable to link with uclibc");


  replaceOrRenameFunction(mainModule, "__libc_open", "open");
  replaceOrRenameFunction(mainModule, "__libc_fcntl", "fcntl");

  // Take care of fortified functions
  replaceOrRenameFunction(mainModule, "__fprintf_chk", "fprintf");

  // XXX we need to rearchitect so this can also be used with
  // programs externally linked with uclibc.

  // We now need to swap things so that __uClibc_main is the entry
  // point, in such a way that the arguments are passed to
  // __uClibc_main correctly. We do this by renaming the user main
  // and generating a stub function to call __uClibc_main. There is
  // also an implicit cooperation in that runFunctionAsMain sets up
  // the environment arguments to what uclibc expects (following
  // argv), since it does not explicitly take an envp argument.
  //cyj add----------------------------------------------------------------------------------------------------
  if (!RunAllFunctions && RunSpecifiedFunction.empty()) {
    Function *userMainFn = mainModule->getFunction("main");
    assert(userMainFn && "unable to get user main");
    Function *uclibcMainFn = mainModule->getFunction("__uClibc_main");
    assert(uclibcMainFn && "unable to get uclibc main");
    userMainFn->setName("__user_main");

    const FunctionType *ft = uclibcMainFn->getFunctionType();
    assert(ft->getNumParams() == 7);

    std::vector<LLVM_TYPE_Q Type*> fArgs;
    fArgs.push_back(ft->getParamType(1)); // argc
    fArgs.push_back(ft->getParamType(2)); // argv
    Function *stub = Function::Create(FunctionType::get(Type::getInt32Ty(getGlobalContext()), fArgs, false),
      		  	        GlobalVariable::ExternalLinkage,
      			        "main",
      			        mainModule);
    BasicBlock *bb = BasicBlock::Create(getGlobalContext(), "entry", stub);

    std::vector<llvm::Value*> args;
    args.push_back(llvm::ConstantExpr::getBitCast(userMainFn,
                                                ft->getParamType(0)));
    args.push_back(stub->arg_begin()); // argc
    args.push_back(++stub->arg_begin()); // argv
    args.push_back(Constant::getNullValue(ft->getParamType(3))); // app_init
    args.push_back(Constant::getNullValue(ft->getParamType(4))); // app_fini
    args.push_back(Constant::getNullValue(ft->getParamType(5))); // rtld_fini
    args.push_back(Constant::getNullValue(ft->getParamType(6))); // stack_end
#if LLVM_VERSION_CODE >= LLVM_VERSION(3, 0)
    CallInst::Create(uclibcMainFn, args, "", bb);
#else
    CallInst::Create(uclibcMainFn, args.begin(), args.end(), "", bb);
#endif
  
    new UnreachableInst(getGlobalContext(), bb);

    klee_message("NOTE: Using klee-uclibc : %s", uclibcBCA.c_str());
  }
  return mainModule;
}
#endif

/*cyj:---------------------------------- seed与replay的区别 ------------------------------------------------------
1.	在replay-out模式下, 不需要符号化变量, 而是用KTObjects->bytes实际值代替变量, 因此就是
	实际执行程序, 每一个replay-out都会生成一个.ktest文件, 但是没有符号化变量.
2.	在replay-path模式下, 还是会对变量符号化, 但是在fork时, 会根据.path文件的1/0选择相应分支,
	而不是fork出两个state, 最终只有一个state, 结束时求解出符号化变量实际值, 生成一个.ktest文件.
	(与replay-out不能一起使用, 否则replay-path会无效)
3.	在seed模式下, 还是会对变量符号化, fork时seedInfo也会与state一样分为两部分. 但是seed所在
	的state会在常规模式前执行, 而且不需要搜索策略去选择下一个stete, 而是按照map中的顺序执行.
	但是结束时符号化变量是否需要求解实际值, 还是直接赋值为KTObjects->bytes, 还不了解.
	bre: 先执行每个seed所在的路径, 然后再执行其他的路径
	(在executeMakeSymbolic函数中, 体现了两种模式对变量具体符号化时的区别)
--------------------------------------------------------------------------------------------------------------------------*/
//cyj: klee入口, 处理记录输入的参数信息, 并针对参数信息进行配置, 通过interpreter运行待测程序main函数,
//cyj: 将符号执行部分结果写入info文件中, 部分结果输出.
//cyj: interpreter->runFunctionAsMain()调用executor模块

//qmh add
static llvm::Module *linkWithLibm(llvm::Module *mainModule) {
	mainModule = klee::linkWithLibrary(mainModule, "/home/joker/klee-uclibc/lib/libm.a");
	return mainModule;
}
static llvm::Module *linkWithFPLib(llvm::Module *mainModule) {
	mainModule = klee::linkWithFPLibrary(mainModule, "/home/joker/klee-lf/softfloat/bits64/SPARC-Solaris-GCC/softfloat.o");
	return mainModule;
}
//end add

int main(int argc, char **argv, char **envp) {
  atexit(llvm_shutdown);  // Call llvm_shutdown() on exit.
  //cyj: llvm_shutdown - Deallocate and destroy all ManagedStatic variables.
  llvm::InitializeNativeTarget();

  parseArguments(argc, argv);	//cyj: 处理参数: 得到文件名,位置参数,ConsumeAfter. 并验证参数的合法性
  sys::PrintStackTraceOnErrorSignal();	//cyj: Print a stack trace if a fatal signal occurs.

  if (Watchdog) {		//cyj: Use a watchdog process to enforce --max-time
    if (MaxTime==0) {
      klee_error("--watchdog used without --max-time");
    }

    int pid = fork();
    if (pid<0) {
      klee_error("unable to fork watchdog");
    } else if (pid) {		//cyj: 父进程
      fprintf(stderr, "KLEE: WATCHDOG: watching %d\n", pid);
      fflush(stderr);		//cyj: 把输出缓冲区里的东西立刻打印到标准输出设备上
      sys::SetInterruptFunction(interrupt_handle_watchdog);
      	  	  //cyj: SetInterruptFunction: Register a function to be called when ctrl-c is pressed
      double nextStep = util::getWallTime() + MaxTime*1.1;
      int level = 0;

      // Simple stupid code...
      while (1) {
        sleep(1);		//cyj: Sleep()单位为毫秒，sleep()单位为秒

        int status, res = waitpid(pid, &status, WNOHANG);
        	//cyj: WNOHANG 若pid指定的子进程没有结束，则waitpid()函数返回0，不予以等待。
        	//cyj: 若结束，则返回该子进程的ID. 返回值-1,失败原因存于 errno 中
        if (res < 0) {	//cyj: waitpid发生错误
          if (errno==ECHILD) { // No child, no need to watch but
                               // return error since we didn't catch
                               // the exit.
            fprintf(stderr, "KLEE: watchdog exiting (no child)\n");
            return 1;
          } else if (errno!=EINTR) {
            perror("watchdog waitpid");	//cyj: 参数 s 所指的字符串会先打印出，后面再加上错误原因字符串
            exit(1);
          }
        } else if (res==pid && WIFEXITED(status)) {		//cyj: ifexited正常结束子进程
          return WEXITSTATUS(status);		//cyj: exit status 取子进程传给exit或_eixt的低8位
        } else {		//cyj: 子进程没有结束
          double time = util::getWallTime();

          if (time > nextStep) {		//cyj: 超过maxtime
            ++level;
            
            if (level==1) {		//cyj: 超过1次
              fprintf(stderr, "KLEE: WATCHDOG: time expired, attempting halt via INT\n");
              kill(pid, SIGINT);	//cyj: SIGINT: 与ctrl+c关联,只能结束前台进程
            } else if (level==2) {
              fprintf(stderr, "KLEE: WATCHDOG: time expired, attempting halt via gdb\n");
              halt_via_gdb(pid);	//cyj: 可以被阻塞的结束进程
            } else {
              fprintf(stderr, "KLEE: WATCHDOG: kill(9)ing child (I tried to be nice)\n");
              kill(pid, SIGKILL);	//cyj: 强制结束
              return 1; // what more can we do
            }

            // Ideally this triggers a dump, which may take a while,
            // so try and give the process extra time to clean up.
            nextStep = util::getWallTime() + std::max(15., MaxTime*.1);
          }
        }
      }		//cyj: end while(1)

      return 0;
    }	//cyj: end 父进程
  }		//cyj: end if (Watchdog)

  sys::SetInterruptFunction(interrupt_handle);	//cyj: SetInterruptFunction: Register a function to be called when ctrl-c is pressed

  // Load the bytecode...
  std::string ErrorMsg;
  Module *mainModule = 0;
#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)		//cyj: (3,4)
  OwningPtr<MemoryBuffer> BufferPtr;
  error_code ec=MemoryBuffer::getFileOrSTDIN(InputFile.c_str(), BufferPtr);	//cyj: 读文件内容到BufferPtr
  if (ec) {
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               ec.message().c_str());		//cyj: run "klee abc"
  }

  mainModule = getLazyBitcodeModule(BufferPtr.get(), getGlobalContext(), &ErrorMsg);

  if (mainModule) {
    if (mainModule->MaterializeAllPermanently(&ErrorMsg)) {
      delete mainModule;
      mainModule = 0;
    }
  }
  if (!mainModule)
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               ErrorMsg.c_str());		//cyj: run klee abc
#else
  auto Buffer = MemoryBuffer::getFileOrSTDIN(InputFile.c_str());
  if (!Buffer)
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               Buffer.getError().message().c_str());

  auto mainModuleOrError = getLazyBitcodeModule(Buffer->get(), getGlobalContext());

  if (!mainModuleOrError) {
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               mainModuleOrError.getError().message().c_str());
  }
  else {
    // The module has taken ownership of the MemoryBuffer so release it
    // from the std::unique_ptr
    Buffer->release();
  }

  mainModule = *mainModuleOrError;
  if (auto ec = mainModule->materializeAllPermanently()) {
    klee_error("error loading program '%s': %s", InputFile.c_str(),
               ec.message().c_str());
  }
#endif

  //cyj modify----------------
  //if (WithPOSIXRuntime) {
  if (WithPOSIXRuntime && !RunAllFunctions && RunSpecifiedFunction.empty()) {
    int r = initEnv(mainModule);		//cyj: 针对该选项初始化mainModule的环境
    if (r != 0)
      return r;
  }

  std::string LibraryDir = KleeHandler::getRunTimeLibraryPath(argv[0]);
  	  	  //cyj: 得到RunTime LibraryPath: KLEE_INSTALL_RUNTIME_DIR, KLEE_DIR+....
  Interpreter::ModuleOptions Opts(LibraryDir.c_str(),
                                  /*Optimize=*/OptimizeModule, 
                                  /*CheckDivZero=*/CheckDivZero,
                                  /*CheckOvershift=*/CheckOvershift);
  
  ///*zyq add----------------------------------------------------------------------------------------------------------------
  if (!InterruptFunction.empty()){
	  for (std::vector<std::string>::iterator it = InterruptFunction.begin(), ie = InterruptFunction.end();
			  it != ie; it++){
		  Function *interruptF = mainModule->getFunction(*it);
		  if (!interruptF){
			  llvm::errs()<<*it<<"interrupt function not found in module.\n";
		  }
		  else IRfunction.push_back(interruptF);
	  }
  }
  //end add----------------------------------------------------------------------------------------------------------------*/

  //cyj: 在这里得到所需的函数---------------------------------------------------------------------------------------------------
  if(!FunctionExcept.empty()){
	if(!RunAllFunctions) {
	  llvm::errs() << "Error: function-except option must be used with run-all-functions option!\n";
	  return -1;
	}
  }

  Function *mainFn = 0;
  std::set<Function *> functions;
  if(!RunAllFunctions && RunSpecifiedFunction.empty()){
	  mainFn = mainModule->getFunction("main");
	  if (!mainFn) {
      llvm::errs() << "'main' function not found in module.\n";
      return -1;
    }
  } else {
    if(RunAllFunctions){
      for (Module::iterator fi = mainModule->begin(), fe = mainModule->end(); fi != fe; ++fi) {
	      Function *F = fi;
	      if(!F->empty()){
		     if(FunctionExcept.empty() || std::find(FunctionExcept.begin(), FunctionExcept.end(),
		    		 	 	 	 	 	 	 	 F->getName().str()) == FunctionExcept.end()){
		    	 functions.insert(F);
		    	 llvm::errs() << "load function: " << F->getName().str() << "\n";
		     }
	      }
      }
    } else {	// !RunAllFunctions && !RunSpecifiedFunction.empty()
      for(std::vector<std::string>::iterator it=RunSpecifiedFunction.begin(),
    		  	  	  	  	  	  	  	  ie=RunSpecifiedFunction.end(); it!=ie; it++){
    	  Function *specifiedF = mainModule->getFunction(*it);
    	  if (!specifiedF) {
    	    llvm::errs() << *it << " function not found in module.\n";
    	    return -1;
    	 }
    	 functions.insert(specifiedF);
    	 llvm::errs() << "load function: " << *it << "\n";
      }
    }
    llvm::errs() << "functions numbers: " << functions.size() << "\n";
    if(functions.empty()){
	  llvm::errs() << "function not found in module.\n";
	  return -1;
    }
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------

  switch (Libc) {
  case NoLibc: /* silence compiler warning */
    break;

  case KleeLibc: {
    // FIXME: Find a reasonable solution for this.
    SmallString<128> Path(Opts.LibraryDir);
#if LLVM_VERSION_CODE >= LLVM_VERSION(3,3)
    llvm::sys::path::append(Path, "klee-libc.bc");
#else
    llvm::sys::path::append(Path, "libklee-libc.bca");
#endif
    mainModule = klee::linkWithLibrary(mainModule, Path.c_str());
    assert(mainModule && "unable to link with klee-libc");
    break;
  }

  case UcLibc:
    mainModule = linkWithUclibc(mainModule, LibraryDir);
    break;
  }

  //if (WithPOSIXRuntime) {		//cyj: 第二遍, 作用?(将LibraryDir载入到mainModule?)
  if (WithPOSIXRuntime && !RunAllFunctions && RunSpecifiedFunction.empty()) {
    SmallString<128> Path(Opts.LibraryDir);
    llvm::sys::path::append(Path, "libkleeRuntimePOSIX.bca");
    klee_message("NOTE: Using model: %s", Path.c_str());
    mainModule = klee::linkWithLibrary(mainModule, Path.c_str());
    assert(mainModule && "unable to link with simple model");
  }  

  //qmh add
  mainModule = linkWithFPLib(mainModule);
  mainModule = linkWithLibm(mainModule);
  //end add

  // FIXME: Change me to std types.
  int pArgc;
  char **pArgv;
  char **pEnvp;
  if (Environ != "") {		//cyj: -environ=<string>
    std::vector<std::string> items;
    std::ifstream f(Environ.c_str());
    if (!f.good())
      klee_error("unable to open --environ file: %s", Environ.c_str());
    while (!f.eof()) {
      std::string line;
      std::getline(f, line);
      line = strip(line);		//cyj: strip 删除字符串中开头、结尾处的空格
      if (!line.empty())
        items.push_back(line);
    }
    f.close();
    pEnvp = new char *[items.size()+1];
    unsigned i=0;
    for (; i != items.size(); ++i)
      pEnvp[i] = strdup(items[i].c_str());	//cyj: 返回一个指针,指向为复制字符串分配的空间;如果分配空间失败,则返回NULL值
    pEnvp[i] = 0;
  } else {
    pEnvp = envp;
  }

  if (!RunAllFunctions && RunSpecifiedFunction.empty()) {
	pArgc = InputArgv.size() + 1; 	//cyj: InputArgv: ConsumeAfter, program arguments
	pArgv = new char *[pArgc];
	for (unsigned i=0; i<InputArgv.size()+1; i++) {
	  std::string &arg = (i==0 ? InputFile : InputArgv[i-1]);
	  unsigned size = arg.size() + 1;
	  char *pArg = new char[size];

	  std::copy(arg.begin(), arg.end(), pArg);
	  pArg[size - 1] = 0;

	  pArgv[i] = pArg;
	}		//cyj: 读取program arguments到pArgv中
  } else {	//cyj: 输入参数只有文件路径, 没有.bc文件中main()需要的参数
	pArgc = 1; 	//cyj: InputArgv: ConsumeAfter, program arguments
	pArgv = new char *[pArgc];
	std::string &arg = InputFile;
	unsigned size = arg.size() + 1;
	char *pArg = new char[size];
	std::copy(arg.begin(), arg.end(), pArg);
	pArg[size - 1] = 0;
	pArgv[0] = pArg;
  }

  std::vector<bool> replayPath;

  if (ReplayPathFile != "") {
    KleeHandler::loadPathFile(ReplayPathFile, replayPath);	//cyj: 从ReplayPathFile中读取二进制信息
  }

  Interpreter::InterpreterOptions IOpts;
  IOpts.MakeConcreteSymbolic = MakeConcreteSymbolic;	//cyj: 载入参数MakeConcreteSymbolic

  if (RunInDir != "") {
    int res = chdir(RunInDir.c_str());
    if (res < 0) {
      klee_error("Unable to change directory to: %s", RunInDir.c_str());
    }
  }

  KleeHandler *handler = new KleeHandler(pArgc, pArgv);


  //--------------------------------------------- cyj modify: LazyInitialization controller -------------------------------------------------------
#if ifLazyInitialization == false
  // CASE: NO LazyInitialization, create Executor.
  Interpreter *interpreter = theInterpreter = Interpreter::create(IOpts, handler);		//cyj: 对Executor初始化
  //---------------------------------------------------------------------------------------------------------------------
#else
  // CASE: DO LazyInitialization, create LIExecutor.
  Interpreter *interpreter = theInterpreter = LIExecutor::create(IOpts, handler);		//cyj: 对LIExecutor初始化
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------
#endif

  handler->setInterpreter(interpreter);		//cyj: 载入参数

  const Module *finalModule = interpreter->setModule(mainModule, Opts);
  //cyj: 构造specialFunctionHandler, 把bitcode中存在的特殊函数绑定在handlers(map)中.
  externalsAndGlobalsCheck(finalModule);		//cyj: 检查finalModule中的外部调用函数和全局函数(klee_waring)


  //cyj modify--------------------------------------- case: run main function --------------------------------------------------------------------
  if (!RunAllFunctions && RunSpecifiedFunction.empty()) {
    llvm::raw_ostream &infoFile = handler->getInfoStream();	//cyj: infoFile输出流, 写入info文件
    for (int i=0; i<argc; i++) {
      infoFile << argv[i] << (i+1<argc ? " ":"\n");
    }
    infoFile << "PID: " << getpid() << "\n";

    if (ReplayPathFile != "") {
      interpreter->setReplayPath(&replayPath);		//cyj: 把replayPath载入到解释器中
    }

    char buf[256];
    time_t t[2];
    t[0] = time(NULL);		//cyj: 返回当前时间
    strftime(buf, sizeof(buf), "Started: %Y-%m-%d %H:%M:%S\n", localtime(&t[0]));
  	//cyj: 我们可以根据参数三的格式把参数四中保存的时间信息放在参数一指向的字符串中，
  	//cyj: 最多向参数一中存放参数二个字符。该函数返回向参数一指向的字符串中放置的字符数。
    infoFile << buf;
    infoFile.flush();

    if (!ReplayOutDir.empty() || !ReplayOutFile.empty()) {		//cyj: Replay
      assert(SeedOutFile.empty());
      assert(SeedOutDir.empty());

      std::vector<std::string> outFiles = ReplayOutFile;
      for (std::vector<std::string>::iterator it = ReplayOutDir.begin(), ie = ReplayOutDir.end();
    		  it != ie; ++it)
        KleeHandler::getOutFiles(*it, outFiles);		//cyj: 把it中的.ktest加入outFiles容器中
      std::vector<KTest*> kTests;
      for (std::vector<std::string>::iterator it = outFiles.begin(), ie = outFiles.end();
    		  it != ie; ++it) {
        KTest *out = kTest_fromFile(it->c_str());		//cyj: 读取.ktest文件内容, 生成相应KTest对象
        if (out) {
          kTests.push_back(out);
        } else {
          llvm::errs() << "KLEE: unable to open: " << *it << "\n";
        }
      }	//cyj: 把所有ReplayOut的.ktest文件生成相应的KTest对象

/*    if (RunInDir != "") {
      int res = chdir(RunInDir.c_str());		//cyj: 更改当前工作目录. 成功返回0 ，失败返回-1
      if (res < 0) {
        klee_error("Unable to change directory to: %s", RunInDir.c_str());
      }
    }*/

      unsigned i=0;
      for (std::vector<KTest*>::iterator it = kTests.begin(), ie = kTests.end(); it != ie; ++it) {
        KTest *out = *it;
        interpreter->setReplayOut(out);		//cyj: supply a test case to replay
        llvm::errs() << "KLEE: replaying: " << *it << " (" << kTest_numBytes(out)
                    << " bytes)"
                    << " (" << ++i << "/" << outFiles.size() << ")\n";
        // XXX should put envp in .ktest ?
        interpreter->runFunctionAsMain(mainFn, out->numArgs, out->args, pEnvp);	//cyj: Replay
        if (interrupted) break;
      }
      interpreter->setReplayOut(0);		//cyj: use NULL to reset
      while (!kTests.empty()) {
        kTest_free(kTests.back());		//cyj:  back(): Returns a read/write reference to the data at the last
        kTests.pop_back();		//cyj:  Removes last element
      }
    }		//cyj: end if (!ReplayOutDir.empty() || !ReplayOutFile.empty())
    else {
      std::vector<KTest *> seeds;
      /// When non-null a list of "seed" inputs which will be used to drive execution.
      for (std::vector<std::string>::iterator it = SeedOutFile.begin(), ie = SeedOutFile.end();
    		  it != ie; ++it) {
        KTest *out = kTest_fromFile(it->c_str());		//cyj: 读取.ktest文件内容, 生成相应KTest对象
        if (!out) {
          llvm::errs() << "KLEE: unable to open: " << *it << "\n";
          exit(1);
        }
        seeds.push_back(out);
      }
      for (std::vector<std::string>::iterator it = SeedOutDir.begin(), ie = SeedOutDir.end();
    		  it != ie; ++it) {
        std::vector<std::string> outFiles;
        KleeHandler::getOutFiles(*it, outFiles);		//cyj: 把SeedOutDir中的.ktest加入outFiles容器中
        for (std::vector<std::string>::iterator it2 = outFiles.begin(), ie = outFiles.end();
        		it2 != ie; ++it2) {
          KTest *out = kTest_fromFile(it2->c_str());		//cyj: 读取.ktest文件内容, 生成相应KTest对象
          if (!out) {
            llvm::errs() << "KLEE: unable to open: " << *it2 << "\n";
            exit(1);
          }
          seeds.push_back(out);
        }
        if (outFiles.empty()) {
          llvm::errs() << "KLEE: seeds directory is empty: " << *it << "\n";
          exit(1);
        }
      }

      if (!seeds.empty()) {
        llvm::errs() << "KLEE: using " << seeds.size() << " seeds\n";
        interpreter->useSeeds(&seeds);		//cyj: 载入seeds到解释器中
      	//cyj: supply a set of symbolic bindings that will be used as "seeds" for the search.
      }
/*    if (RunInDir != "") {
      int res = chdir(RunInDir.c_str());
      if (res < 0) {
        klee_error("Unable to change directory to: %s", RunInDir.c_str());
      }
    }*/
      interpreter->runFunctionAsMain(mainFn, pArgc, pArgv, pEnvp);		//运行main函数
      //cyj: 此时interpreter为Executor类对象
      while (!seeds.empty()) {		//释放seeds栈
        kTest_free(seeds.back());
        seeds.pop_back();
      }
    }		//cyj: end else
      
    t[1] = time(NULL);		//cyj: 返回当前时间
    strftime(buf, sizeof(buf), "Finished: %Y-%m-%d %H:%M:%S\n", localtime(&t[1]));
  	  	  //cyj: 我们可以根据参数三的格式把参数四中保存的时间信息放在参数一指向的字符串中，
   	  	  //cyj: 最多向参数一中存放参数二个字符。该函数返回向参数一指向的字符串中放置的字符数。
    infoFile << buf;

    strcpy(buf, "Elapsed: ");
    strcpy(format_tdiff(buf, t[1] - t[0]), "\n");	//cyj: format_tdiff: 在buf中加入时间信息
    infoFile << buf;

    uint64_t queries =
      *theStatisticManager->getStatisticByName("Queries");
    uint64_t queriesValid =
      *theStatisticManager->getStatisticByName("QueriesValid");
    uint64_t queriesInvalid =
      *theStatisticManager->getStatisticByName("QueriesInvalid");
    uint64_t queryCounterexamples =
      *theStatisticManager->getStatisticByName("QueriesCEX");
    uint64_t queryConstructs =
      *theStatisticManager->getStatisticByName("QueriesConstructs");
    uint64_t instructions =
      *theStatisticManager->getStatisticByName("Instructions");
    uint64_t forks =
      *theStatisticManager->getStatisticByName("Forks");

    handler->getInfoStream()
      << "KLEE: done: explored paths = " << 1 + forks << "\n";

    // Write some extra information in the info file which users won't
    // necessarily care about or understand.
    if (queries)
      handler->getInfoStream()
        << "KLEE: done: avg. constructs per query = "
                             << queryConstructs / queries << "\n";
    handler->getInfoStream() 
      << "KLEE: done: total queries = " << queries << "\n"
      << "KLEE: done: valid queries = " << queriesValid << "\n"
      << "KLEE: done: invalid queries = " << queriesInvalid << "\n"
      << "KLEE: done: query cex = " << queryCounterexamples << "\n";

    std::stringstream stats;		//cyj: 输出流
    stats << "\n";
    stats << "KLEE: done: total instructions = "
         << instructions << "\n";
    stats << "KLEE: done: completed paths = "
         << handler->getNumPathsExplored() << "\n";
    stats << "KLEE: done: generated tests = "
         << handler->getNumTestCases() << "\n";

    bool useColors = llvm::errs().is_displayed();
    if (useColors)
      llvm::errs().changeColor(llvm::raw_ostream::GREEN,
                             /*bold=*/true,
                             /*bg=*/false);

    llvm::errs() << stats.str();		//cyj: 输出信息

    if (useColors)
      llvm::errs().resetColor();

    handler->getInfoStream() << stats.str();

  }	//cyj: end run main function
  //cyj add------------------------------ case: run all functions or specified function --------------------------------------------------------
  else {
	  llvm::raw_ostream &exceptionInfoFile = *handler->openOutputFile("exceptionInfo");
	  	  	  	  	  	  	  	  	  	  	  	  	  //cyj: 在klee-out-目录下创建exceptionInfo
	  for (int i=0; i<argc; i++) {
		  exceptionInfoFile << argv[i] << (i+1<argc ? " ":"\n");
	  }
	  exceptionInfoFile << "PID: " << getpid() << "\n";

	  char whole_buf[256];
	  time_t whole_t[2];
	  whole_t[0] = time(NULL);		//cyj: 返回当前时间
	  strftime(whole_buf, sizeof(whole_buf), "Started: %Y-%m-%d %H:%M:%S\n", localtime(&whole_t[0]));
	  	  	  	  //cyj: 我们可以根据参数三的格式把参数四中保存的时间信息放在参数一指向的字符串中，
	  	  	  	  //cyj: 最多向参数一中存放参数二个字符。该函数返回向参数一指向的字符串中放置的字符数。
	  exceptionInfoFile << whole_buf;
	  exceptionInfoFile.flush();

	  //cyj: 下面开始符号执行每个function.---------------------------------------------------------------------------------------------------------------
	  for(std::set<Function *>::iterator fi = functions.begin(), fe = functions.end(); fi != fe; ++fi) {
		interpreter->resetEmittedErrors();
		Function *F = *fi;
		std::string functionName = F->getName().str();
		handler->setFunctionName(functionName);
		llvm::raw_ostream &infoFile = handler->getInfoStream();	//cyj: infoFile输出流, 写入info文件
		for (int i=0; i<argc; i++) {
		  infoFile << argv[i] << (i+1<argc ? " ":"\n");
		}
		infoFile << "PID: " << getpid() << "\n";

	    char buf[256];
	    time_t t[2];
	    t[0] = time(NULL);		//cyj: 返回当前时间
	    strftime(buf, sizeof(buf), "Started: %Y-%m-%d %H:%M:%S\n", localtime(&t[0]));
	  	  	  //cyj: 我们可以根据参数三的格式把参数四中保存的时间信息放在参数一指向的字符串中，
	  	  	  //cyj: 最多向参数一中存放参数二个字符。该函数返回向参数一指向的字符串中放置的字符数。
	    infoFile << buf;
	    infoFile.flush();

	    interpreter->runOneFunction(F);

	    t[1] = time(NULL);		//cyj: 返回当前时间
	    strftime(buf, sizeof(buf), "Finished: %Y-%m-%d %H:%M:%S\n", localtime(&t[1]));
	  	  	  //cyj: 我们可以根据参数三的格式把参数四中保存的时间信息放在参数一指向的字符串中，
	   	  	  //cyj: 最多向参数一中存放参数二个字符。该函数返回向参数一指向的字符串中放置的字符数。
	    infoFile << buf;

	    strcpy(buf, "Elapsed: ");
	    strcpy(format_tdiff(buf, t[1] - t[0]), "\n");	//cyj: format_tdiff: 在buf中加入时间信息
	    infoFile << buf;

	    uint64_t queries =
	      *theStatisticManager->getStatisticByName("Queries");
	    uint64_t queriesValid =
	      *theStatisticManager->getStatisticByName("QueriesValid");
	    uint64_t queriesInvalid =
	      *theStatisticManager->getStatisticByName("QueriesInvalid");
	    uint64_t queryCounterexamples =
	      *theStatisticManager->getStatisticByName("QueriesCEX");
	    uint64_t queryConstructs =
	      *theStatisticManager->getStatisticByName("QueriesConstructs");
	    uint64_t instructions =
	      *theStatisticManager->getStatisticByName("Instructions");
	    uint64_t forks =
	      *theStatisticManager->getStatisticByName("Forks");

	    infoFile << "KLEE: done: explored paths = " << 1 + forks << "\n";

	  // Write some extra information in the info file which users won't
	  // necessarily care about or understand.
	    if (queries)
	    	infoFile << "KLEE: done: avg. constructs per query = "
	                             << queryConstructs / queries << "\n";
	    infoFile
	      << "KLEE: done: total queries = " << queries << "\n"
	      << "KLEE: done: valid queries = " << queriesValid << "\n"
	      << "KLEE: done: invalid queries = " << queriesInvalid << "\n"
	      << "KLEE: done: query cex = " << queryCounterexamples << "\n";

	    std::stringstream stats;		//cyj: 输出流
	    stats << "\n";
	    stats << "KLEE: done: total instructions = "
	          << instructions << "\n";
	    stats << "KLEE: done: completed paths = "
	          << handler->getNumPathsExplored() << "\n";
	    stats << "KLEE: done: generated tests = "
	          << handler->getNumTestCases() << "\n";

	    bool useColors = llvm::errs().is_displayed();
	    if (useColors)
	      llvm::errs().changeColor(llvm::raw_ostream::GREEN,
	                             /*bold=*/true,
	                             /*bg=*/false);

	    llvm::errs() << stats.str() << "--------------------------------------------------------------------------------\n";//cyj: 输出信息

	  	if (useColors)
		  llvm::errs().resetColor();

	  	infoFile << stats.str();
	  	infoFile.flush();

	    theStatisticManager->resetValue(*theStatisticManager->getStatisticByName("Queries"));
	    theStatisticManager->resetValue(*theStatisticManager->getStatisticByName("QueriesValid"));
	    theStatisticManager->resetValue(*theStatisticManager->getStatisticByName("QueriesInvalid"));
	    theStatisticManager->resetValue(*theStatisticManager->getStatisticByName("QueriesCEX"));
	    theStatisticManager->resetValue(*theStatisticManager->getStatisticByName("QueriesConstructs"));
	    theStatisticManager->resetValue(*theStatisticManager->getStatisticByName("Instructions"));
	    theStatisticManager->resetValue(*theStatisticManager->getStatisticByName("Forks"));
	  }	//end for

	  whole_t[1] = time(NULL);		//cyj: 返回当前时间
	  strftime(whole_buf, sizeof(whole_buf), "Finished: %Y-%m-%d %H:%M:%S\n", localtime(&whole_t[1]));
	  	  	  	  //cyj: 我们可以根据参数三的格式把参数四中保存的时间信息放在参数一指向的字符串中，
	  	   	  	  //cyj: 最多向参数一中存放参数二个字符。该函数返回向参数一指向的字符串中放置的字符数。
	  exceptionInfoFile << whole_buf;

	  strcpy(whole_buf, "Elapsed: ");
	  strcpy(format_tdiff(whole_buf, whole_t[1] - whole_t[0]), "\n\n");	//cyj: format_tdiff: 在buf中加入时间信息
	  exceptionInfoFile << whole_buf;
	  exceptionInfoFile << "Function number: " << functions.size() << "\n";
	  exceptionInfoFile.flush();

	  handler->parseExceptOutput(exceptionInfoFile);
  }	// end else

  // Free all the args.
  for (unsigned i=0; i<InputArgv.size()+1; i++)	//cyj: InputArgv: ConsumeAfter, program arguments
    delete[] pArgv[i];
  delete[] pArgv;

  delete interpreter;

#if LLVM_VERSION_CODE < LLVM_VERSION(3, 5)
  // FIXME: This really doesn't look right
  // This is preventing the module from being
  // deleted automatically
  BufferPtr.take();
#endif

  delete handler;

  return 0;
}

//cyj add------------------------------------------------------------------------------------------------------------------------------------------------------
void KleeHandler::generateLazyIniInfoFile(std::vector<std::string> lazyIniInfo,
		std::vector< std::pair<std::string, unsigned> > newArrayObjectSize,
		std::vector< std::pair<std::string, unsigned char*> > newArrayObjectValue,
		unsigned id) {

	if(lazyIniInfo.size()){
		llvm::raw_ostream *f = openTestFile("lazyIniInfo", id);
		if(unsigned objectNum = newArrayObjectValue.size()) {
			unsigned index = 0;
			for(unsigned i=0; i<lazyIniInfo.size(); i++) {
				std::string I = lazyIniInfo[i];
				std::string name = newArrayObjectValue[index].first;
				std::string mallocInfo = name + " = malloc";
				if(I.find(mallocInfo) < I.size()){
					std::stringstream sizestream;
					sizestream << newArrayObjectSize[index].second;
					std::string size = sizestream.str();

					if(I.find("size1") < I.size()){			// char*|void*
						I.replace(I.find("size1"), 5, size);
						*f << I << "\n";
						std::stringstream valueStream;
						unsigned char *value = newArrayObjectValue[index].second;
						for(unsigned j=0; j<newArrayObjectSize[index].second; j++) {
							valueStream << name << "[" << j <<"] = ";
							unsigned char C = *(value + j);
							valueStream << (unsigned)C << ";\n";
						}
						*f << valueStream.str();
					}
					else if(I.find("size2") < I.size()) {		// short*
						I.replace(I.find("size2"), 5, size);
						*f << I << "\n";
						std::stringstream valueStream;
						unsigned char *value = newArrayObjectValue[index].second;
						for(unsigned j=0; j<newArrayObjectSize[index].second/2; j++) {
							valueStream << name << "[" << j <<"] = ";
							unsigned C1 = *(value + j * 2);
							unsigned C2 = *(value + j * 2 + 1);
							unsigned C = C1 + (C2 << 8);
							valueStream << C << ";\n";
						}
						*f << valueStream.str();
					}
					else if(I.find("size4") < I.size()) {		// int*
						I.replace(I.find("size4"), 5, size);
						*f << I << "\n";
						std::stringstream valueStream;
						unsigned char *value = newArrayObjectValue[index].second;
						for(unsigned j=0; j<newArrayObjectSize[index].second/4; j++) {
							valueStream << name << "[" << j <<"] = ";
							unsigned C1 = *(value + j * 4);
							unsigned C2 = *(value + j * 4 + 1);
							unsigned C3 = *(value + j * 4 + 2);
							unsigned C4 = *(value + j * 4 + 3);
							unsigned C = C1 + (C2 << 8) + (C3 << 16) + (C4 << 24);
							valueStream << C << ";\n";
						}
						*f << valueStream.str();
					}
					else if(I.find("size8") < I.size()) {		// long*
						I.replace(I.find("size8"), 5, size);
						*f << I << "\n";
						std::stringstream valueStream;
						unsigned char *value = newArrayObjectValue[index].second;
						for(unsigned j=0; j<newArrayObjectSize[index].second/8; j++) {
							valueStream << name << "[" << j <<"] = ";
							unsigned long C1 = *(value + j * 8);
							unsigned long C2 = *(value + j * 8 + 1);
							unsigned long C3 = *(value + j * 8 + 2);
							unsigned long C4 = *(value + j * 8 + 3);
							unsigned long C5 = *(value + j * 8 + 4);
							unsigned long C6 = *(value + j * 8 + 5);
							unsigned long C7 = *(value + j * 8 + 6);
							unsigned long C8 = *(value + j * 8 + 7);
							unsigned long C = C1 + (C2 << 8) + (C3 << 16) + (C4 << 24)
												+ (C5 << 32) + (C6 << 40) + (C7 << 48) + (C8 << 56);
							valueStream << C << ";\n";
						}
						*f << valueStream.str();
					}
					else if(I.find("sizeP") < I.size()) {		// 双重指针
						I.replace(I.find("sizeP"), 5, size);
						*f << I << "\n";
					}
					else if(I.find("sizeF") < I.size()) {		// float
						I.replace(I.find("sizeF"), 5, size);
						*f << I << "\n";
					}
					else if(I.find("sizeD") < I.size()) {		// double
						I.replace(I.find("sizeD"), 5, size);
						*f << I << "\n";
					}
					else
						assert("Error: generateLazyIniInfoFile()");

					index++;
					if(index == objectNum)
						index--;
				} else {
					*f << I << "\n";
				}
			}
		} else {
			for (unsigned int k=0; k<lazyIniInfo.size(); ++k){
				*f << lazyIniInfo[k] << "\n";
			}
		}

		f->flush();
		delete f;
	}
}


void KleeHandler::parseExceptOutput(llvm::raw_ostream &exceptionInfoFile) {
	unsigned normalFunction = 0;
	std::vector<std::string> earlyFunction;
	std::map<std::string, std::vector<std::string> > errorFunction;

	DIR *directory = NULL;
	struct dirent *functionDirent = NULL;
	if ((directory = opendir(m_originalOutputDirectory.c_str())) == NULL)
      klee_error("cannot open dir \"%s\".", m_originalOutputDirectory.c_str());
	else {
	  while((functionDirent = readdir(directory)) != NULL) {
	    if(functionDirent->d_type & DT_DIR){	// 如果读取的为目录
	      if(strcmp(functionDirent->d_name,".")==0 || strcmp(functionDirent->d_name,"..")==0)
	    	            //如果读取的d_name为 . 或者.. 表示读取的是当前目录符和上一目录符
	        continue;

	      unsigned earlyNum = 0;
		  unsigned errorNum = 0;
	      SmallString<128> functionPath = m_originalOutputDirectory;
		  sys::path::append(functionPath, functionDirent->d_name);
		  DIR *functionDir = opendir(functionPath.c_str());

		  if(functionDir == NULL)
	        klee_error("cannot open dir \"%s\".", functionPath.c_str());
		  else {
		    struct dirent *outputFile = NULL;
		    std::vector<std::string> errInfos;
			while((outputFile = readdir(functionDir)) != NULL) {
	          if(outputFile->d_type & DT_REG){ // 如果读取的为文件
	            char *fileName = outputFile->d_name;
	        	if(strstr(fileName, "err")){
	        	  SmallString<128> errPath = functionPath;
	        	  sys::path::append(errPath, fileName);
	        	  FILE *errFile = fopen(errPath.c_str(), "r");
	        	  if(errFile == NULL)
	        	    klee_error("cannot open file \"%s\".", errPath.c_str());
	        	  char buf[128];
				  for (int i=0; i<4; i++){
				    if (fgets(buf, 128, errFile) != NULL){
					  int len = strlen(buf);
					  buf[len] = '\0';
					  errInfos.push_back(buf);
					}
				  }
				  char empty[2] = {'\n', '\0'};
				  errInfos.push_back(empty);
	        	  errorNum++;
	            }
	        	else if(strstr(fileName, "early")){
	        	  earlyNum++;
	        	}
		      } // 如果读取的为文件
		    } // end while()
			delete outputFile;

			if(earlyNum == 0 && errorNum == 0){
			  normalFunction++;
			} else {
			  if(earlyNum != 0){
			    earlyFunction.push_back(functionDirent->d_name);
			  }
			  if(errorNum != 0){
			    errorFunction[functionDirent->d_name] = errInfos;
			  }
			}
     	  } // functionDir != NULL

	    } // 如果读取的为目录
	  }	// functionDirent != NULL
	} // directory != NULL

	std::stringstream infoStream;
	infoStream << "Normal function number: " << normalFunction << "\n";
	infoStream << "Error function number: " << errorFunction.size() << "\n";
	infoStream << "Early function number: " << earlyFunction.size() << "\n";

	if(errorFunction.size() > 0){
		infoStream << "\nError function:\n";
	  for(std::map<std::string, std::vector<std::string> >::iterator it = errorFunction.begin(), ie = errorFunction.end();
			  	  	  	  	  	  	  	  	  	  	  	  	  it != ie; it++) {
		infoStream << it->first << ":  ----------------------------------------------------------------------\n";
		for(std::vector<std::string>::iterator b = it->second.begin(), e = it->second.end(); b!=e; b++){
		  infoStream << *b;
		}
		infoStream << "\n";
	  }
	}

	if(earlyFunction.size() > 0){
	  infoStream << "\nEarly function:\n";
	  for(int i=0; i<earlyFunction.size(); i++)
	    infoStream << earlyFunction[i] << "\n";
	}

	llvm::errs() << infoStream.str();
	exceptionInfoFile << infoStream.str();
	exceptionInfoFile.flush();

	delete functionDirent;
	delete directory;
}

//end add-----------------------------------------------------------------------------------------------------------------------------------------------
