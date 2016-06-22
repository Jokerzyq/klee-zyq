; ModuleID = 'fd.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.timeval = type { i64, i64 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.statfs = type { i64, i64, i64, i64, i64, i64, i64, %struct.__fsid_t, i64, i64, i64, [4 x i64] }
%struct.__fsid_t = type { [2 x i32] }
%struct.fd_set = type { [16 x i64] }

@__exe_env = external global %struct.exe_sym_env_t
@.str1 = private unnamed_addr constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 1
@.str2 = private unnamed_addr constant [44 x i8] c"symbolic file descriptor, ignoring (ENOENT)\00", align 1
@close.n_calls = internal unnamed_addr global i32 0, align 4
@__exe_fs = external global %struct.exe_file_system_t
@read.n_calls = internal unnamed_addr global i32 0, align 4
@.str3 = private unnamed_addr constant [12 x i8] c"f->off >= 0\00", align 1
@.str4 = private unnamed_addr constant [5 x i8] c"fd.c\00", align 1
@__PRETTY_FUNCTION__.read = private unnamed_addr constant [34 x i8] c"ssize_t read(int, void *, size_t)\00", align 1
@write.n_calls = internal unnamed_addr global i32 0, align 4
@.str5 = private unnamed_addr constant [7 x i8] c"r >= 0\00", align 1
@__PRETTY_FUNCTION__.write = private unnamed_addr constant [41 x i8] c"ssize_t write(int, const void *, size_t)\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str7 = private unnamed_addr constant [24 x i8] c"write() ignores bytes.\0A\00", align 1
@.str8 = private unnamed_addr constant [18 x i8] c"new_off == f->off\00", align 1
@__PRETTY_FUNCTION__.__fd_lseek = private unnamed_addr constant [38 x i8] c"off64_t __fd_lseek(int, off64_t, int)\00", align 1
@.str9 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 1
@chmod.n_calls = internal unnamed_addr global i32 0, align 4
@fchmod.n_calls = internal unnamed_addr global i32 0, align 4
@__fd_ftruncate.n_calls = internal unnamed_addr global i32 0, align 4
@.str10 = private unnamed_addr constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1
@.str11 = private unnamed_addr constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 1
@.str12 = private unnamed_addr constant [18 x i8] c"s != (off64_t) -1\00", align 1
@__PRETTY_FUNCTION__.__fd_getdents = private unnamed_addr constant [65 x i8] c"int __fd_getdents(unsigned int, struct dirent64 *, unsigned int)\00", align 1
@.str13 = private unnamed_addr constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 1
@.str14 = private unnamed_addr constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 1
@.str15 = private unnamed_addr constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 1
@.str16 = private unnamed_addr constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 1
@.str17 = private unnamed_addr constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 1
@.str18 = private unnamed_addr constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 1
@.str19 = private unnamed_addr constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 1
@.str20 = private unnamed_addr constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 1
@.str21 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 1
@.str22 = private unnamed_addr constant [17 x i8] c"ignoring (EPERM)\00", align 1
@getcwd.n_calls = internal unnamed_addr global i32 0, align 4
@.str23 = private unnamed_addr constant [18 x i8] c"ignoring (ENOENT)\00", align 1
@.str24 = private unnamed_addr constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 1

; Function Attrs: nounwind uwtable
define i32 @access(i8* %pathname, i32 %mode) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !34), !dbg !689
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !35), !dbg !689
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !690), !dbg !692
  %0 = load i8* %pathname, align 1, !dbg !693, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !697), !dbg !693
  %conv.i = sext i8 %0 to i32, !dbg !698
  %cmp.i = icmp eq i8 %0, 0, !dbg !698
  br i1 %cmp.i, label %if.else, label %lor.lhs.false.i, !dbg !698

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %pathname, i64 1, !dbg !698
  %1 = load i8* %arrayidx2.i, align 1, !dbg !698, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !698
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.else, !dbg !698

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !700, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !700
  br i1 %cmp626.i, label %if.else, label %for.body.i, !dbg !700

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !700
  br i1 %cmp6.i, label %for.body.i, label %if.else, !dbg !700

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !705
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !705
  %add.i = add nsw i32 %conv10.i, 65, !dbg !705
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !705
  %inc.i = add i32 %i.027.i, 1, !dbg !700
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !706), !dbg !700
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !705

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !707
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !707, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !709
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !709, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !709
  %5 = load i64* %st_ino.i, align 8, !dbg !709, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !709
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !707
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !717
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !709
  br i1 %or.cond, label %if.else, label %return, !dbg !709

if.else:                                          ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !718) #5, !dbg !720
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !721) #5, !dbg !723
  %6 = ptrtoint i8* %pathname to i64, !dbg !724
  %call.i.i = tail call i64 @klee_get_valuel(i64 %6) #5, !dbg !724
  %7 = inttoptr i64 %call.i.i to i8*, !dbg !724
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !725) #5, !dbg !724
  %cmp.i.i = icmp eq i8* %7, %pathname, !dbg !726
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !726
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !726
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !727) #5, !dbg !722
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !728) #5, !dbg !729
  br label %for.cond.i9, !dbg !729

for.cond.i9:                                      ; preds = %for.inc.i, %if.else
  %i.0.i = phi i32 [ 0, %if.else ], [ %inc.i11, %for.inc.i ]
  %sc.0.i = phi i8* [ %7, %if.else ], [ %sc.1.i, %for.inc.i ]
  %8 = load i8* %sc.0.i, align 1, !dbg !730, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %8}, i64 0, metadata !731) #5, !dbg !730
  %sub.i = add i32 %i.0.i, -1, !dbg !732
  %and.i = and i32 %sub.i, %i.0.i, !dbg !732
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !732
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !732

if.then.i:                                        ; preds = %for.cond.i9
  switch i8 %8, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !733

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !736, !tbaa !694
  br label %__concretize_string.exit, !dbg !738

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !739
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !727) #5, !dbg !739
  store i8 47, i8* %sc.0.i, align 1, !dbg !739, !tbaa !694
  br label %for.inc.i, !dbg !742

if.else7.i:                                       ; preds = %for.cond.i9
  %conv8.i = sext i8 %8 to i64, !dbg !743
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !743
  %conv10.i10 = trunc i64 %call9.i to i8, !dbg !743
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i10}, i64 0, metadata !744) #5, !dbg !743
  %cmp13.i = icmp eq i8 %conv10.i10, %8, !dbg !745
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !745
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !745
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !746
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !727) #5, !dbg !746
  store i8 %conv10.i10, i8* %sc.0.i, align 1, !dbg !746, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i10, 0, !dbg !747
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !747

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i11 = add i32 %i.0.i, 1, !dbg !729
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i11}, i64 0, metadata !728) #5, !dbg !729
  br label %for.cond.i9, !dbg !729

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call2 = tail call i64 (i64, ...)* @syscall(i64 21, i8* %pathname, i32 %mode) #5, !dbg !719
  %conv = trunc i64 %call2 to i32, !dbg !719
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !86), !dbg !719
  %cmp = icmp eq i32 %conv, -1, !dbg !749
  br i1 %cmp, label %if.then4, label %return, !dbg !749

if.then4:                                         ; preds = %__concretize_string.exit
  %call5 = tail call i32 @klee_get_errno() #5, !dbg !751
  %call6 = tail call i32* @__errno_location() #1, !dbg !751
  store i32 %call5, i32* %call6, align 4, !dbg !751, !tbaa !752
  br label %return, !dbg !751

return:                                           ; preds = %if.then13.i, %__concretize_string.exit, %if.then4
  %retval.0 = phi i32 [ -1, %if.then4 ], [ %conv, %__concretize_string.exit ], [ 0, %if.then13.i ]
  ret i32 %retval.0, !dbg !753
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare i64 @syscall(i64, ...) #2

declare i32 @klee_get_errno() #3

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #4

; Function Attrs: nounwind uwtable
define i32 @umask(i32 %mask) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %mask}, i64 0, metadata !94), !dbg !754
  %0 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !755, !tbaa !756
  tail call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !95), !dbg !755
  %and = and i32 %mask, 511, !dbg !758
  store i32 %and, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !758, !tbaa !756
  ret i32 %0, !dbg !759
}

; Function Attrs: nounwind uwtable
define i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !100), !dbg !760
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !101), !dbg !760
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !102), !dbg !760
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !115), !dbg !761
  br label %for.body, !dbg !761

for.cond:                                         ; preds = %for.body
  %0 = trunc i64 %indvars.iv.next to i32, !dbg !761
  %cmp = icmp slt i32 %0, 32, !dbg !761
  br i1 %cmp, label %for.body, label %for.end, !dbg !761

for.body:                                         ; preds = %entry, %for.cond
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.cond ]
  %fd.0110 = phi i32 [ 0, %entry ], [ %inc, %for.cond ]
  %flags1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !763
  %1 = load i32* %flags1, align 4, !dbg !763, !tbaa !765
  %and = and i32 %1, 1, !dbg !763
  %tobool = icmp eq i32 %and, 0, !dbg !763
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !761
  %inc = add nsw i32 %fd.0110, 1, !dbg !761
  tail call void @llvm.dbg.value(metadata !{i32 %inc}, i64 0, metadata !115), !dbg !761
  br i1 %tobool, label %for.end, label %for.cond, !dbg !763

for.end:                                          ; preds = %for.body, %for.cond
  %fd.0.lcssa = phi i32 [ %fd.0110, %for.body ], [ %inc, %for.cond ]
  %cmp2 = icmp eq i32 %fd.0.lcssa, 32, !dbg !767
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !767

if.then3:                                         ; preds = %for.end
  %call = tail call i32* @__errno_location() #1, !dbg !769
  store i32 24, i32* %call, align 4, !dbg !769, !tbaa !752
  br label %return, !dbg !771

if.end4:                                          ; preds = %for.end
  %idxprom5 = sext i32 %fd.0.lcssa to i64, !dbg !772
  %arrayidx6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom5, !dbg !772
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx6}, i64 0, metadata !104), !dbg !772
  %2 = bitcast %struct.exe_file_t* %arrayidx6 to i8*, !dbg !773
  tail call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 24, i32 8, i1 false), !dbg !773
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !774), !dbg !776
  %3 = load i8* %pathname, align 1, !dbg !777, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %3}, i64 0, metadata !778), !dbg !777
  %conv.i = sext i8 %3 to i32, !dbg !779
  %cmp.i = icmp eq i8 %3, 0, !dbg !779
  br i1 %cmp.i, label %if.else45, label %lor.lhs.false.i, !dbg !779

lor.lhs.false.i:                                  ; preds = %if.end4
  %arrayidx2.i = getelementptr inbounds i8* %pathname, i64 1, !dbg !779
  %4 = load i8* %arrayidx2.i, align 1, !dbg !779, !tbaa !694
  %cmp4.i = icmp eq i8 %4, 0, !dbg !779
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.else45, !dbg !779

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !780, !tbaa !701
  %cmp626.i = icmp eq i32 %5, 0, !dbg !780
  br i1 %cmp626.i, label %if.else45, label %for.body.i, !dbg !780

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %5, !dbg !780
  br i1 %cmp6.i, label %for.body.i, label %if.else45, !dbg !780

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !781
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !781
  %add.i = add nsw i32 %conv10.i, 65, !dbg !781
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !781
  %inc.i = add i32 %i.027.i, 1, !dbg !780
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !782), !dbg !780
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !781

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !783
  %6 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !783, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %6, i64 %idxprom.i, i32 2, !dbg !784
  %7 = load %struct.stat64** %stat.i, align 8, !dbg !784, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %7, i64 0, i32 1, !dbg !784
  %8 = load i64* %st_ino.i, align 8, !dbg !784, !tbaa !713
  %cmp15.i = icmp eq i64 %8, 0, !dbg !784
  br i1 %cmp15.i, label %if.else45, label %__get_sym_file.exit, !dbg !784

__get_sym_file.exit:                              ; preds = %if.then13.i
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %6, i64 %idxprom.i, !dbg !783
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %arrayidx14.i}, i64 0, metadata !103), !dbg !775
  %tobool8 = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !785
  br i1 %tobool8, label %if.else45, label %if.then9, !dbg !785

if.then9:                                         ; preds = %__get_sym_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom5, i32 3, !dbg !786
  store %struct.exe_disk_file_t* %arrayidx14.i, %struct.exe_disk_file_t** %dfile, align 8, !dbg !786, !tbaa !788
  %9 = and i32 %flags, 192, !dbg !789
  switch i32 %9, label %if.end32 [
    i32 192, label %if.then14
    i32 128, label %if.then30
  ], !dbg !789

if.then14:                                        ; preds = %if.then9
  %call15 = tail call i32* @__errno_location() #1, !dbg !791
  store i32 17, i32* %call15, align 4, !dbg !791, !tbaa !752
  br label %return, !dbg !793

if.then30:                                        ; preds = %if.then9
  tail call void @klee_warning(i8* getelementptr inbounds ([47 x i8]* @.str1, i64 0, i64 0)) #5, !dbg !794
  %call31 = tail call i32* @__errno_location() #1, !dbg !797
  store i32 13, i32* %call31, align 4, !dbg !797, !tbaa !752
  br label %return, !dbg !798

if.end32:                                         ; preds = %if.then9
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !799), !dbg !802
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %7}, i64 0, metadata !803), !dbg !802
  %st_mode.i = getelementptr inbounds %struct.stat64* %7, i64 0, i32 3, !dbg !804
  %10 = load i32* %st_mode.i, align 4, !dbg !804, !tbaa !805
  tail call void @llvm.dbg.value(metadata !{i32 %10}, i64 0, metadata !806), !dbg !804
  %and1.i = and i32 %flags, 2, !dbg !807
  %tobool2.i = icmp eq i32 %and1.i, 0, !dbg !807
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !809), !dbg !810
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !811), !dbg !812
  %or15.i = and i32 %10, 292, !dbg !814
  %tobool16.i = icmp eq i32 %or15.i, 0, !dbg !814
  %or.cond37.i = or i1 %tobool2.i, %tobool16.i, !dbg !814
  br i1 %or.cond37.i, label %has_permission.exit, label %if.then35, !dbg !814

has_permission.exit:                              ; preds = %if.end32
  %11 = and i32 %flags, 3, !dbg !816
  %not..i = icmp ne i32 %11, 0, !dbg !816
  %or25.i = and i32 %10, 146, !dbg !817
  %tobool26.i = icmp eq i32 %or25.i, 0, !dbg !817
  %or.cond38.i = and i1 %not..i, %tobool26.i, !dbg !817
  br i1 %or.cond38.i, label %if.then35, label %if.else, !dbg !800

if.then35:                                        ; preds = %if.end32, %has_permission.exit
  %call36 = tail call i32* @__errno_location() #1, !dbg !819
  store i32 13, i32* %call36, align 4, !dbg !819, !tbaa !752
  br label %return, !dbg !821

if.else:                                          ; preds = %has_permission.exit
  %and39 = and i32 %10, -512, !dbg !822
  %12 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 1), align 8, !dbg !822, !tbaa !756
  %neg = xor i32 %12, -1, !dbg !822
  %and40 = and i32 %neg, %mode, !dbg !822
  %or = or i32 %and40, %and39, !dbg !822
  store i32 %or, i32* %st_mode.i, align 4, !dbg !822, !tbaa !805
  br label %if.end55, !dbg !823

if.else45:                                        ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %if.end4, %lor.lhs.false.i, %__get_sym_file.exit
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !824) #5, !dbg !826
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !827) #5, !dbg !829
  %13 = ptrtoint i8* %pathname to i64, !dbg !830
  %call.i.i = tail call i64 @klee_get_valuel(i64 %13) #5, !dbg !830
  %14 = inttoptr i64 %call.i.i to i8*, !dbg !830
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !831) #5, !dbg !830
  %cmp.i.i = icmp eq i8* %14, %pathname, !dbg !832
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !832
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !832
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !833) #5, !dbg !828
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !834) #5, !dbg !835
  br label %for.cond.i101, !dbg !835

for.cond.i101:                                    ; preds = %for.inc.i, %if.else45
  %i.0.i = phi i32 [ 0, %if.else45 ], [ %inc.i103, %for.inc.i ]
  %sc.0.i = phi i8* [ %14, %if.else45 ], [ %sc.1.i, %for.inc.i ]
  %15 = load i8* %sc.0.i, align 1, !dbg !836, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %15}, i64 0, metadata !837) #5, !dbg !836
  %sub.i = add i32 %i.0.i, -1, !dbg !838
  %and.i = and i32 %sub.i, %i.0.i, !dbg !838
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !838
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !838

if.then.i:                                        ; preds = %for.cond.i101
  switch i8 %15, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !839

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !840, !tbaa !694
  br label %__concretize_string.exit, !dbg !841

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !842
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !833) #5, !dbg !842
  store i8 47, i8* %sc.0.i, align 1, !dbg !842, !tbaa !694
  br label %for.inc.i, !dbg !843

if.else7.i:                                       ; preds = %for.cond.i101
  %conv8.i = sext i8 %15 to i64, !dbg !844
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !844
  %conv10.i102 = trunc i64 %call9.i to i8, !dbg !844
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i102}, i64 0, metadata !845) #5, !dbg !844
  %cmp13.i = icmp eq i8 %conv10.i102, %15, !dbg !846
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !846
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !846
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !847
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !833) #5, !dbg !847
  store i8 %conv10.i102, i8* %sc.0.i, align 1, !dbg !847, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i102, 0, !dbg !848
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !848

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i103 = add i32 %i.0.i, 1, !dbg !835
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i103}, i64 0, metadata !834) #5, !dbg !835
  br label %for.cond.i101, !dbg !835

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call47 = tail call i64 (i64, ...)* @syscall(i64 2, i8* %pathname, i32 %flags, i32 %mode) #5, !dbg !825
  %conv = trunc i64 %call47 to i32, !dbg !825
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !116), !dbg !825
  %cmp48 = icmp eq i32 %conv, -1, !dbg !849
  br i1 %cmp48, label %if.then50, label %if.end53, !dbg !849

if.then50:                                        ; preds = %__concretize_string.exit
  %call51 = tail call i32 @klee_get_errno() #5, !dbg !851
  %call52 = tail call i32* @__errno_location() #1, !dbg !851
  store i32 %call51, i32* %call52, align 4, !dbg !851, !tbaa !752
  br label %return, !dbg !853

if.end53:                                         ; preds = %__concretize_string.exit
  %fd54 = getelementptr inbounds %struct.exe_file_t* %arrayidx6, i64 0, i32 0, !dbg !854
  store i32 %conv, i32* %fd54, align 8, !dbg !854, !tbaa !855
  %and57.pre = and i32 %flags, 3, !dbg !856
  br label %if.end55

if.end55:                                         ; preds = %if.end53, %if.else
  %and57.pre-phi = phi i32 [ %and57.pre, %if.end53 ], [ %11, %if.else ], !dbg !856
  %flags56 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom5, i32 1, !dbg !858
  store i32 1, i32* %flags56, align 4, !dbg !858, !tbaa !765
  switch i32 %and57.pre-phi, label %if.else70 [
    i32 0, label %if.then60
    i32 1, label %if.then67
  ], !dbg !856

if.then60:                                        ; preds = %if.end55
  store i32 5, i32* %flags56, align 4, !dbg !859, !tbaa !765
  br label %return, !dbg !861

if.then67:                                        ; preds = %if.end55
  store i32 9, i32* %flags56, align 4, !dbg !862, !tbaa !765
  br label %return, !dbg !865

if.else70:                                        ; preds = %if.end55
  store i32 13, i32* %flags56, align 4, !dbg !866, !tbaa !765
  br label %return

return:                                           ; preds = %if.then60, %if.else70, %if.then67, %if.then50, %if.then35, %if.then30, %if.then14, %if.then3
  %retval.0 = phi i32 [ -1, %if.then3 ], [ -1, %if.then14 ], [ -1, %if.then35 ], [ -1, %if.then30 ], [ -1, %if.then50 ], [ %fd.0.lcssa, %if.then67 ], [ %fd.0.lcssa, %if.else70 ], [ %fd.0.lcssa, %if.then60 ]
  ret i32 %retval.0, !dbg !868
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

declare void @klee_warning(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @__fd_openat(i32 %basefd, i8* %pathname, i32 %flags, i32 %mode) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %basefd}, i64 0, metadata !123), !dbg !869
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !124), !dbg !869
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !125), !dbg !869
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !126), !dbg !869
  %cmp = icmp eq i32 %basefd, -100, !dbg !870
  br i1 %cmp, label %if.end8, label %if.then, !dbg !870

if.then:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata !{i32 %basefd}, i64 0, metadata !871), !dbg !873
  %0 = icmp ult i32 %basefd, 32, !dbg !874
  br i1 %0, label %if.then.i, label %if.then1, !dbg !874

if.then.i:                                        ; preds = %if.then
  %idxprom.i = sext i32 %basefd to i64, !dbg !875
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !876
  %1 = load i32* %flags.i, align 4, !dbg !876, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !876
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !876
  br i1 %tobool.i, label %if.then1, label %__get_file.exit, !dbg !876

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !875
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !129), !dbg !872
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !878
  br i1 %tobool, label %if.then1, label %if.else, !dbg !878

if.then1:                                         ; preds = %if.then, %if.then.i, %__get_file.exit
  %call2 = tail call i32* @__errno_location() #1, !dbg !880
  store i32 9, i32* %call2, align 4, !dbg !880, !tbaa !752
  br label %return, !dbg !882

if.else:                                          ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !883
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !883, !tbaa !788
  %tobool3 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !883
  br i1 %tobool3, label %if.end6, label %if.then4, !dbg !883

if.then4:                                         ; preds = %if.else
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !885
  %call5 = tail call i32* @__errno_location() #1, !dbg !887
  store i32 2, i32* %call5, align 4, !dbg !887, !tbaa !752
  br label %return, !dbg !888

if.end6:                                          ; preds = %if.else
  %fd7 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !889
  %3 = load i32* %fd7, align 8, !dbg !889, !tbaa !855
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !123), !dbg !889
  %phitmp = sext i32 %3 to i64, !dbg !890
  br label %if.end8, !dbg !890

if.end8:                                          ; preds = %entry, %if.end6
  %basefd.addr.0 = phi i64 [ %phitmp, %if.end6 ], [ -100, %entry ]
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !891), !dbg !894
  %4 = load i8* %pathname, align 1, !dbg !895, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %4}, i64 0, metadata !896), !dbg !895
  %conv.i = sext i8 %4 to i32, !dbg !897
  %cmp.i = icmp eq i8 %4, 0, !dbg !897
  br i1 %cmp.i, label %for.body, label %lor.lhs.false.i, !dbg !897

lor.lhs.false.i:                                  ; preds = %if.end8
  %arrayidx2.i = getelementptr inbounds i8* %pathname, i64 1, !dbg !897
  %5 = load i8* %arrayidx2.i, align 1, !dbg !897, !tbaa !694
  %cmp4.i = icmp eq i8 %5, 0, !dbg !897
  br i1 %cmp4.i, label %for.cond.preheader.i, label %for.body, !dbg !897

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %6 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !898, !tbaa !701
  %cmp626.i = icmp eq i32 %6, 0, !dbg !898
  br i1 %cmp626.i, label %for.body, label %for.body.i, !dbg !898

for.cond.i78:                                     ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i80, %6, !dbg !898
  br i1 %cmp6.i, label %for.body.i, label %for.body, !dbg !898

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i78
  %i.027.i = phi i32 [ %inc.i80, %for.cond.i78 ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !899
  %conv10.i79 = ashr exact i32 %sext.i, 24, !dbg !899
  %add.i = add nsw i32 %conv10.i79, 65, !dbg !899
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !899
  %inc.i80 = add i32 %i.027.i, 1, !dbg !898
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i80}, i64 0, metadata !900), !dbg !898
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i78, !dbg !899

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i81 = zext i32 %i.027.i to i64, !dbg !901
  %7 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !901, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %7, i64 %idxprom.i81, i32 2, !dbg !902
  %8 = load %struct.stat64** %stat.i, align 8, !dbg !902, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %8, i64 0, i32 1, !dbg !902
  %9 = load i64* %st_ino.i, align 8, !dbg !902, !tbaa !713
  %cmp15.i = icmp eq i64 %9, 0, !dbg !902
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %7, i64 %idxprom.i81, !dbg !901
  %tobool10 = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !892
  %or.cond = or i1 %cmp15.i, %tobool10, !dbg !902
  br i1 %or.cond, label %for.body, label %if.then11, !dbg !902

if.then11:                                        ; preds = %if.then13.i
  %call12 = tail call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode), !dbg !903
  br label %return, !dbg !903

for.cond:                                         ; preds = %for.body
  %10 = trunc i64 %indvars.iv.next to i32, !dbg !905
  %cmp14 = icmp slt i32 %10, 32, !dbg !905
  br i1 %cmp14, label %for.body, label %for.end, !dbg !905

for.body:                                         ; preds = %for.cond.preheader.i, %if.then13.i, %if.end8, %lor.lhs.false.i, %for.cond.i78, %for.cond
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond ], [ 0, %for.cond.i78 ], [ 0, %lor.lhs.false.i ], [ 0, %if.end8 ], [ 0, %if.then13.i ], [ 0, %for.cond.preheader.i ]
  %fd.086 = phi i32 [ %inc, %for.cond ], [ 0, %for.cond.i78 ], [ 0, %lor.lhs.false.i ], [ 0, %if.end8 ], [ 0, %if.then13.i ], [ 0, %for.cond.preheader.i ]
  %flags15 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !907
  %11 = load i32* %flags15, align 4, !dbg !907, !tbaa !765
  %and = and i32 %11, 1, !dbg !907
  %tobool16 = icmp eq i32 %and, 0, !dbg !907
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !905
  %inc = add nsw i32 %fd.086, 1, !dbg !905
  tail call void @llvm.dbg.value(metadata !{i32 %inc}, i64 0, metadata !128), !dbg !905
  br i1 %tobool16, label %for.end, label %for.cond, !dbg !907

for.end:                                          ; preds = %for.body, %for.cond
  %fd.0.lcssa = phi i32 [ %fd.086, %for.body ], [ %inc, %for.cond ]
  %cmp19 = icmp eq i32 %fd.0.lcssa, 32, !dbg !909
  br i1 %cmp19, label %if.then20, label %if.end22, !dbg !909

if.then20:                                        ; preds = %for.end
  %call21 = tail call i32* @__errno_location() #1, !dbg !911
  store i32 24, i32* %call21, align 4, !dbg !911, !tbaa !752
  br label %return, !dbg !913

if.end22:                                         ; preds = %for.end
  %idxprom23 = sext i32 %fd.0.lcssa to i64, !dbg !914
  %arrayidx24 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom23, !dbg !914
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx24}, i64 0, metadata !127), !dbg !914
  %12 = bitcast %struct.exe_file_t* %arrayidx24 to i8*, !dbg !915
  tail call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 24, i32 8, i1 false), !dbg !915
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !916) #5, !dbg !918
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !919) #5, !dbg !921
  %13 = ptrtoint i8* %pathname to i64, !dbg !922
  %call.i.i = tail call i64 @klee_get_valuel(i64 %13) #5, !dbg !922
  %14 = inttoptr i64 %call.i.i to i8*, !dbg !922
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !923) #5, !dbg !922
  %cmp.i.i = icmp eq i8* %14, %pathname, !dbg !924
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !924
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !924
  tail call void @llvm.dbg.value(metadata !{i8* %14}, i64 0, metadata !925) #5, !dbg !920
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !926) #5, !dbg !927
  br label %for.cond.i, !dbg !927

for.cond.i:                                       ; preds = %for.inc.i, %if.end22
  %i.0.i = phi i32 [ 0, %if.end22 ], [ %inc.i, %for.inc.i ]
  %sc.0.i = phi i8* [ %14, %if.end22 ], [ %sc.1.i, %for.inc.i ]
  %15 = load i8* %sc.0.i, align 1, !dbg !928, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %15}, i64 0, metadata !929) #5, !dbg !928
  %sub.i = add i32 %i.0.i, -1, !dbg !930
  %and.i74 = and i32 %sub.i, %i.0.i, !dbg !930
  %tobool.i75 = icmp eq i32 %and.i74, 0, !dbg !930
  br i1 %tobool.i75, label %if.then.i76, label %if.else7.i, !dbg !930

if.then.i76:                                      ; preds = %for.cond.i
  switch i8 %15, label %for.inc.i [
    i8 0, label %if.then2.i77
    i8 47, label %if.then4.i
  ], !dbg !931

if.then2.i77:                                     ; preds = %if.then.i76
  store i8 0, i8* %sc.0.i, align 1, !dbg !932, !tbaa !694
  br label %__concretize_string.exit, !dbg !933

if.then4.i:                                       ; preds = %if.then.i76
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !934
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !925) #5, !dbg !934
  store i8 47, i8* %sc.0.i, align 1, !dbg !934, !tbaa !694
  br label %for.inc.i, !dbg !935

if.else7.i:                                       ; preds = %for.cond.i
  %conv8.i = sext i8 %15 to i64, !dbg !936
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !936
  %conv10.i = trunc i64 %call9.i to i8, !dbg !936
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i}, i64 0, metadata !937) #5, !dbg !936
  %cmp13.i = icmp eq i8 %conv10.i, %15, !dbg !938
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !938
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !938
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !939
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !925) #5, !dbg !939
  store i8 %conv10.i, i8* %sc.0.i, align 1, !dbg !939, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i, 0, !dbg !940
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !940

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i76
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i76 ]
  %inc.i = add i32 %i.0.i, 1, !dbg !927
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !926) #5, !dbg !927
  br label %for.cond.i, !dbg !927

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i77
  %conv26 = sext i32 %flags to i64, !dbg !917
  %call27 = tail call i64 (i64, ...)* @syscall(i64 257, i64 %basefd.addr.0, i8* %pathname, i64 %conv26, i32 %mode) #5, !dbg !917
  %conv28 = trunc i64 %call27 to i32, !dbg !917
  tail call void @llvm.dbg.value(metadata !{i32 %conv28}, i64 0, metadata !132), !dbg !917
  %cmp29 = icmp eq i32 %conv28, -1, !dbg !941
  br i1 %cmp29, label %if.then31, label %if.end34, !dbg !941

if.then31:                                        ; preds = %__concretize_string.exit
  %call32 = tail call i32 @klee_get_errno() #5, !dbg !943
  %call33 = tail call i32* @__errno_location() #1, !dbg !943
  store i32 %call32, i32* %call33, align 4, !dbg !943, !tbaa !752
  br label %return, !dbg !945

if.end34:                                         ; preds = %__concretize_string.exit
  %fd35 = getelementptr inbounds %struct.exe_file_t* %arrayidx24, i64 0, i32 0, !dbg !946
  store i32 %conv28, i32* %fd35, align 8, !dbg !946, !tbaa !855
  %flags36 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom23, i32 1, !dbg !947
  store i32 1, i32* %flags36, align 4, !dbg !947, !tbaa !765
  %and37 = and i32 %flags, 3, !dbg !948
  switch i32 %and37, label %if.else49 [
    i32 0, label %if.then40
    i32 1, label %if.then46
  ], !dbg !948

if.then40:                                        ; preds = %if.end34
  store i32 5, i32* %flags36, align 4, !dbg !950, !tbaa !765
  br label %return, !dbg !952

if.then46:                                        ; preds = %if.end34
  store i32 9, i32* %flags36, align 4, !dbg !953, !tbaa !765
  br label %return, !dbg !956

if.else49:                                        ; preds = %if.end34
  store i32 13, i32* %flags36, align 4, !dbg !957, !tbaa !765
  br label %return

return:                                           ; preds = %if.then40, %if.else49, %if.then46, %if.then31, %if.then20, %if.then11, %if.then4, %if.then1
  %retval.0 = phi i32 [ -1, %if.then4 ], [ %call12, %if.then11 ], [ -1, %if.then20 ], [ -1, %if.then31 ], [ -1, %if.then1 ], [ %fd.0.lcssa, %if.then46 ], [ %fd.0.lcssa, %if.else49 ], [ %fd.0.lcssa, %if.then40 ]
  ret i32 %retval.0, !dbg !959
}

; Function Attrs: nounwind uwtable
define i32 @utimes(i8* %path, %struct.timeval* %times) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !145), !dbg !960
  tail call void @llvm.dbg.value(metadata !{%struct.timeval* %times}, i64 0, metadata !146), !dbg !960
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !961), !dbg !963
  %0 = load i8* %path, align 1, !dbg !964, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !965), !dbg !964
  %conv.i = sext i8 %0 to i32, !dbg !966
  %cmp.i = icmp eq i8 %0, 0, !dbg !966
  br i1 %cmp.i, label %if.end, label %lor.lhs.false.i, !dbg !966

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !966
  %1 = load i8* %arrayidx2.i, align 1, !dbg !966, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !966
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end, !dbg !966

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !967, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !967
  br i1 %cmp626.i, label %if.end, label %for.body.i, !dbg !967

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !967
  br i1 %cmp6.i, label %for.body.i, label %if.end, !dbg !967

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !968
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !968
  %add.i = add nsw i32 %conv10.i, 65, !dbg !968
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !968
  %inc.i = add i32 %i.027.i, 1, !dbg !967
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !969), !dbg !967
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !968

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !970
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !970, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !971
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !971, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !971
  %5 = load i64* %st_ino.i, align 8, !dbg !971, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !971
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !970
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !972
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !971
  br i1 %or.cond, label %if.end, label %if.then, !dbg !971

if.then:                                          ; preds = %if.then13.i
  %tv_sec = getelementptr inbounds %struct.timeval* %times, i64 0, i32 0, !dbg !974
  %6 = load i64* %tv_sec, align 8, !dbg !974, !tbaa !976
  %tv_sec1 = getelementptr inbounds %struct.stat64* %4, i64 0, i32 11, i32 0, !dbg !974
  store i64 %6, i64* %tv_sec1, align 8, !dbg !974, !tbaa !978
  %tv_sec3 = getelementptr inbounds %struct.timeval* %times, i64 1, i32 0, !dbg !979
  %7 = load i64* %tv_sec3, align 8, !dbg !979, !tbaa !976
  %tv_sec5 = getelementptr inbounds %struct.stat64* %4, i64 0, i32 12, i32 0, !dbg !979
  store i64 %7, i64* %tv_sec5, align 8, !dbg !979, !tbaa !980
  %mul = mul nsw i64 %6, 1000000000, !dbg !981
  %tv_nsec = getelementptr inbounds %struct.stat64* %4, i64 0, i32 11, i32 1, !dbg !981
  store i64 %mul, i64* %tv_nsec, align 8, !dbg !981, !tbaa !982
  %mul12 = mul nsw i64 %7, 1000000000, !dbg !983
  %tv_nsec15 = getelementptr inbounds %struct.stat64* %4, i64 0, i32 12, i32 1, !dbg !983
  store i64 %mul12, i64* %tv_nsec15, align 8, !dbg !983, !tbaa !984
  br label %return, !dbg !985

if.end:                                           ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !986) #5, !dbg !988
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !989) #5, !dbg !991
  %8 = ptrtoint i8* %path to i64, !dbg !992
  %call.i.i = tail call i64 @klee_get_valuel(i64 %8) #5, !dbg !992
  %9 = inttoptr i64 %call.i.i to i8*, !dbg !992
  tail call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !993) #5, !dbg !992
  %cmp.i.i = icmp eq i8* %9, %path, !dbg !994
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !994
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !994
  tail call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !995) #5, !dbg !990
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !996) #5, !dbg !997
  br label %for.cond.i33, !dbg !997

for.cond.i33:                                     ; preds = %for.inc.i, %if.end
  %i.0.i = phi i32 [ 0, %if.end ], [ %inc.i35, %for.inc.i ]
  %sc.0.i = phi i8* [ %9, %if.end ], [ %sc.1.i, %for.inc.i ]
  %10 = load i8* %sc.0.i, align 1, !dbg !998, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %10}, i64 0, metadata !999) #5, !dbg !998
  %sub.i = add i32 %i.0.i, -1, !dbg !1000
  %and.i = and i32 %sub.i, %i.0.i, !dbg !1000
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1000
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !1000

if.then.i:                                        ; preds = %for.cond.i33
  switch i8 %10, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !1001

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !1002, !tbaa !694
  br label %__concretize_string.exit, !dbg !1003

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1004
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !995) #5, !dbg !1004
  store i8 47, i8* %sc.0.i, align 1, !dbg !1004, !tbaa !694
  br label %for.inc.i, !dbg !1005

if.else7.i:                                       ; preds = %for.cond.i33
  %conv8.i = sext i8 %10 to i64, !dbg !1006
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1006
  %conv10.i34 = trunc i64 %call9.i to i8, !dbg !1006
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i34}, i64 0, metadata !1007) #5, !dbg !1006
  %cmp13.i = icmp eq i8 %conv10.i34, %10, !dbg !1008
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1008
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1008
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1009
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !995) #5, !dbg !1009
  store i8 %conv10.i34, i8* %sc.0.i, align 1, !dbg !1009, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i34, 0, !dbg !1010
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !1010

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i35 = add i32 %i.0.i, 1, !dbg !997
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i35}, i64 0, metadata !996) #5, !dbg !997
  br label %for.cond.i33, !dbg !997

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call17 = tail call i64 (i64, ...)* @syscall(i64 235, i8* %path, %struct.timeval* %times) #5, !dbg !987
  %conv = trunc i64 %call17 to i32, !dbg !987
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !148), !dbg !987
  %cmp = icmp eq i32 %conv, -1, !dbg !1011
  br i1 %cmp, label %if.then19, label %return, !dbg !1011

if.then19:                                        ; preds = %__concretize_string.exit
  %call20 = tail call i32 @klee_get_errno() #5, !dbg !1013
  %call21 = tail call i32* @__errno_location() #1, !dbg !1013
  store i32 %call20, i32* %call21, align 4, !dbg !1013, !tbaa !752
  br label %return, !dbg !1013

return:                                           ; preds = %__concretize_string.exit, %if.then19, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ -1, %if.then19 ], [ %conv, %__concretize_string.exit ]
  ret i32 %retval.0, !dbg !1014
}

; Function Attrs: nounwind uwtable
define i32 @futimesat(i32 %fd, i8* %path, %struct.timeval* %times) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !153), !dbg !1015
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !154), !dbg !1015
  tail call void @llvm.dbg.value(metadata !{%struct.timeval* %times}, i64 0, metadata !155), !dbg !1015
  %cmp = icmp eq i32 %fd, -100, !dbg !1016
  br i1 %cmp, label %if.end8, label %if.then, !dbg !1016

if.then:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1017), !dbg !1019
  %0 = icmp ult i32 %fd, 32, !dbg !1020
  br i1 %0, label %if.then.i, label %if.then1, !dbg !1020

if.then.i:                                        ; preds = %if.then
  %idxprom.i = sext i32 %fd to i64, !dbg !1021
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1022
  %1 = load i32* %flags.i, align 4, !dbg !1022, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1022
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1022
  br i1 %tobool.i, label %if.then1, label %__get_file.exit, !dbg !1022

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1021
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !156), !dbg !1018
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1023
  br i1 %tobool, label %if.then1, label %if.else, !dbg !1023

if.then1:                                         ; preds = %if.then, %if.then.i, %__get_file.exit
  %call2 = tail call i32* @__errno_location() #1, !dbg !1025
  store i32 9, i32* %call2, align 4, !dbg !1025, !tbaa !752
  br label %return, !dbg !1027

if.else:                                          ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1028
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1028, !tbaa !788
  %tobool3 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !1028
  br i1 %tobool3, label %if.end6, label %if.then4, !dbg !1028

if.then4:                                         ; preds = %if.else
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !1030
  %call5 = tail call i32* @__errno_location() #1, !dbg !1032
  store i32 2, i32* %call5, align 4, !dbg !1032, !tbaa !752
  br label %return, !dbg !1033

if.end6:                                          ; preds = %if.else
  %fd7 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1034
  %3 = load i32* %fd7, align 8, !dbg !1034, !tbaa !855
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !153), !dbg !1034
  %phitmp = sext i32 %3 to i64, !dbg !1035
  br label %if.end8, !dbg !1035

if.end8:                                          ; preds = %entry, %if.end6
  %fd.addr.0 = phi i64 [ %phitmp, %if.end6 ], [ -100, %entry ]
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1036), !dbg !1039
  %4 = load i8* %path, align 1, !dbg !1040, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %4}, i64 0, metadata !1041), !dbg !1040
  %conv.i = sext i8 %4 to i32, !dbg !1042
  %cmp.i = icmp eq i8 %4, 0, !dbg !1042
  br i1 %cmp.i, label %if.end13, label %lor.lhs.false.i, !dbg !1042

lor.lhs.false.i:                                  ; preds = %if.end8
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !1042
  %5 = load i8* %arrayidx2.i, align 1, !dbg !1042, !tbaa !694
  %cmp4.i = icmp eq i8 %5, 0, !dbg !1042
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end13, !dbg !1042

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %6 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1043, !tbaa !701
  %cmp626.i = icmp eq i32 %6, 0, !dbg !1043
  br i1 %cmp626.i, label %if.end13, label %for.body.i, !dbg !1043

for.cond.i37:                                     ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i39, %6, !dbg !1043
  br i1 %cmp6.i, label %for.body.i, label %if.end13, !dbg !1043

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i37
  %i.027.i = phi i32 [ %inc.i39, %for.cond.i37 ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !1044
  %conv10.i38 = ashr exact i32 %sext.i, 24, !dbg !1044
  %add.i = add nsw i32 %conv10.i38, 65, !dbg !1044
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !1044
  %inc.i39 = add i32 %i.027.i, 1, !dbg !1043
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i39}, i64 0, metadata !1045), !dbg !1043
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i37, !dbg !1044

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i40 = zext i32 %i.027.i to i64, !dbg !1046
  %7 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1046, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %7, i64 %idxprom.i40, i32 2, !dbg !1047
  %8 = load %struct.stat64** %stat.i, align 8, !dbg !1047, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %8, i64 0, i32 1, !dbg !1047
  %9 = load i64* %st_ino.i, align 8, !dbg !1047, !tbaa !713
  %cmp15.i = icmp eq i64 %9, 0, !dbg !1047
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %7, i64 %idxprom.i40, !dbg !1046
  %tobool10 = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !1037
  %or.cond = or i1 %cmp15.i, %tobool10, !dbg !1047
  br i1 %or.cond, label %if.end13, label %if.then11, !dbg !1047

if.then11:                                        ; preds = %if.then13.i
  %call12 = tail call i32 @utimes(i8* %path, %struct.timeval* %times), !dbg !1048
  br label %return, !dbg !1048

if.end13:                                         ; preds = %for.cond.i37, %for.cond.preheader.i, %if.then13.i, %if.end8, %lor.lhs.false.i
  %tobool14 = icmp eq i8* %path, null, !dbg !1050
  br i1 %tobool14, label %cond.end, label %cond.true, !dbg !1050

cond.true:                                        ; preds = %if.end13
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1051) #5, !dbg !1053
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1054) #5, !dbg !1056
  %10 = ptrtoint i8* %path to i64, !dbg !1057
  %call.i.i = tail call i64 @klee_get_valuel(i64 %10) #5, !dbg !1057
  %11 = inttoptr i64 %call.i.i to i8*, !dbg !1057
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !1058) #5, !dbg !1057
  %cmp.i.i = icmp eq i8* %11, %path, !dbg !1059
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !1059
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !1059
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !1060) #5, !dbg !1055
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1061) #5, !dbg !1062
  br label %for.cond.i, !dbg !1062

for.cond.i:                                       ; preds = %for.inc.i, %cond.true
  %i.0.i = phi i32 [ 0, %cond.true ], [ %inc.i, %for.inc.i ]
  %sc.0.i = phi i8* [ %11, %cond.true ], [ %sc.1.i, %for.inc.i ]
  %12 = load i8* %sc.0.i, align 1, !dbg !1063, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %12}, i64 0, metadata !1064) #5, !dbg !1063
  %sub.i = add i32 %i.0.i, -1, !dbg !1065
  %and.i33 = and i32 %sub.i, %i.0.i, !dbg !1065
  %tobool.i34 = icmp eq i32 %and.i33, 0, !dbg !1065
  br i1 %tobool.i34, label %if.then.i35, label %if.else7.i, !dbg !1065

if.then.i35:                                      ; preds = %for.cond.i
  switch i8 %12, label %for.inc.i [
    i8 0, label %if.then2.i36
    i8 47, label %if.then4.i
  ], !dbg !1066

if.then2.i36:                                     ; preds = %if.then.i35
  store i8 0, i8* %sc.0.i, align 1, !dbg !1067, !tbaa !694
  br label %cond.end, !dbg !1068

if.then4.i:                                       ; preds = %if.then.i35
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1069
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !1060) #5, !dbg !1069
  store i8 47, i8* %sc.0.i, align 1, !dbg !1069, !tbaa !694
  br label %for.inc.i, !dbg !1070

if.else7.i:                                       ; preds = %for.cond.i
  %conv8.i = sext i8 %12 to i64, !dbg !1071
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1071
  %conv10.i = trunc i64 %call9.i to i8, !dbg !1071
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i}, i64 0, metadata !1072) #5, !dbg !1071
  %cmp13.i = icmp eq i8 %conv10.i, %12, !dbg !1073
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1073
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1073
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1074
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !1060) #5, !dbg !1074
  store i8 %conv10.i, i8* %sc.0.i, align 1, !dbg !1074, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i, 0, !dbg !1075
  br i1 %tobool17.i, label %cond.end, label %for.inc.i, !dbg !1075

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i35
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i35 ]
  %inc.i = add i32 %i.0.i, 1, !dbg !1062
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !1061) #5, !dbg !1062
  br label %for.cond.i, !dbg !1062

cond.end:                                         ; preds = %if.else7.i, %if.then2.i36, %if.end13
  %cond = phi i8* [ null, %if.end13 ], [ %path, %if.then2.i36 ], [ %path, %if.else7.i ], !dbg !1052
  %call16 = tail call i64 (i64, ...)* @syscall(i64 261, i64 %fd.addr.0, i8* %cond, %struct.timeval* %times) #5, !dbg !1050
  %conv17 = trunc i64 %call16 to i32, !dbg !1050
  tail call void @llvm.dbg.value(metadata !{i32 %conv17}, i64 0, metadata !159), !dbg !1050
  %cmp18 = icmp eq i32 %conv17, -1, !dbg !1076
  br i1 %cmp18, label %if.then20, label %return, !dbg !1076

if.then20:                                        ; preds = %cond.end
  %call21 = tail call i32 @klee_get_errno() #5, !dbg !1078
  %call22 = tail call i32* @__errno_location() #1, !dbg !1078
  store i32 %call21, i32* %call22, align 4, !dbg !1078, !tbaa !752
  br label %return, !dbg !1078

return:                                           ; preds = %cond.end, %if.then20, %if.then11, %if.then4, %if.then1
  %retval.0 = phi i32 [ -1, %if.then4 ], [ %call12, %if.then11 ], [ -1, %if.then1 ], [ -1, %if.then20 ], [ %conv17, %cond.end ]
  ret i32 %retval.0, !dbg !1079
}

; Function Attrs: nounwind uwtable
define i32 @close(i32 %fd) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !164), !dbg !1080
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !166), !dbg !1081
  %0 = load i32* @close.n_calls, align 4, !dbg !1082, !tbaa !752
  %inc = add nsw i32 %0, 1, !dbg !1082
  store i32 %inc, i32* @close.n_calls, align 4, !dbg !1082, !tbaa !752
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1083), !dbg !1085
  %1 = icmp ult i32 %fd, 32, !dbg !1086
  br i1 %1, label %if.then.i, label %if.then, !dbg !1086

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1087
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1088
  %2 = load i32* %flags.i, align 4, !dbg !1088, !tbaa !765
  %and.i = and i32 %2, 1, !dbg !1088
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1088
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !1088

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1087
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !165), !dbg !1084
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1089
  br i1 %tobool, label %if.then, label %if.end, !dbg !1089

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !1091
  store i32 9, i32* %call1, align 4, !dbg !1091, !tbaa !752
  br label %return, !dbg !1093

if.end:                                           ; preds = %__get_file.exit
  %3 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1094, !tbaa !1096
  %tobool2 = icmp eq i32 %3, 0, !dbg !1094
  br i1 %tobool2, label %if.end5, label %land.lhs.true, !dbg !1094

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !1094, !tbaa !1097
  %5 = load i32* %4, align 4, !dbg !1094, !tbaa !752
  %cmp = icmp eq i32 %5, %inc, !dbg !1094
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !1094

if.then3:                                         ; preds = %land.lhs.true
  %dec = add i32 %3, -1, !dbg !1098
  store i32 %dec, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1098, !tbaa !1096
  %call4 = tail call i32* @__errno_location() #1, !dbg !1100
  store i32 5, i32* %call4, align 4, !dbg !1100, !tbaa !752
  br label %return, !dbg !1101

if.end5:                                          ; preds = %if.end, %land.lhs.true
  %6 = bitcast %struct.exe_file_t* %arrayidx.i to i8*, !dbg !1102
  tail call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 24, i32 8, i1 false), !dbg !1102
  br label %return, !dbg !1103

return:                                           ; preds = %if.end5, %if.then3, %if.then
  %retval.0 = phi i32 [ -1, %if.then3 ], [ 0, %if.end5 ], [ -1, %if.then ]
  ret i32 %retval.0, !dbg !1104
}

; Function Attrs: nounwind uwtable
define i64 @read(i32 %fd, i8* %buf, i64 %count) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !175), !dbg !1105
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !176), !dbg !1105
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !177), !dbg !1105
  %0 = load i32* @read.n_calls, align 4, !dbg !1106, !tbaa !752
  %inc = add nsw i32 %0, 1, !dbg !1106
  store i32 %inc, i32* @read.n_calls, align 4, !dbg !1106, !tbaa !752
  %cmp = icmp eq i64 %count, 0, !dbg !1107
  br i1 %cmp, label %return, label %if.end, !dbg !1107

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i8* %buf, null, !dbg !1109
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !1109

if.then2:                                         ; preds = %if.end
  %call = tail call i32* @__errno_location() #1, !dbg !1111
  store i32 14, i32* %call, align 4, !dbg !1111, !tbaa !752
  br label %return, !dbg !1113

if.end3:                                          ; preds = %if.end
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1114), !dbg !1116
  %1 = icmp ult i32 %fd, 32, !dbg !1117
  br i1 %1, label %if.then.i, label %if.then5, !dbg !1117

if.then.i:                                        ; preds = %if.end3
  %idxprom.i = sext i32 %fd to i64, !dbg !1118
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1119
  %2 = load i32* %flags.i, align 4, !dbg !1119, !tbaa !765
  %and.i = and i32 %2, 1, !dbg !1119
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1119
  br i1 %tobool.i, label %if.then5, label %__get_file.exit, !dbg !1119

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1118
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !178), !dbg !1115
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1120
  br i1 %tobool, label %if.then5, label %if.end7, !dbg !1120

if.then5:                                         ; preds = %if.end3, %if.then.i, %__get_file.exit
  %call6 = tail call i32* @__errno_location() #1, !dbg !1122
  store i32 9, i32* %call6, align 4, !dbg !1122, !tbaa !752
  br label %return, !dbg !1124

if.end7:                                          ; preds = %__get_file.exit
  %3 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1125, !tbaa !1096
  %tobool8 = icmp eq i32 %3, 0, !dbg !1125
  br i1 %tobool8, label %if.end12, label %land.lhs.true, !dbg !1125

land.lhs.true:                                    ; preds = %if.end7
  %4 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !1125, !tbaa !1127
  %5 = load i32* %4, align 4, !dbg !1125, !tbaa !752
  %cmp9 = icmp eq i32 %5, %inc, !dbg !1125
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !1125

if.then10:                                        ; preds = %land.lhs.true
  %dec = add i32 %3, -1, !dbg !1128
  store i32 %dec, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1128, !tbaa !1096
  %call11 = tail call i32* @__errno_location() #1, !dbg !1130
  store i32 5, i32* %call11, align 4, !dbg !1130, !tbaa !752
  br label %return, !dbg !1131

if.end12:                                         ; preds = %if.end7, %land.lhs.true
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1132
  %6 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1132, !tbaa !788
  %tobool13 = icmp eq %struct.exe_disk_file_t* %6, null, !dbg !1132
  br i1 %tobool13, label %if.then14, label %if.else40, !dbg !1132

if.then14:                                        ; preds = %if.end12
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !1133) #5, !dbg !1135
  %7 = ptrtoint i8* %buf to i64, !dbg !1136
  %call.i98 = tail call i64 @klee_get_valuel(i64 %7) #5, !dbg !1136
  %8 = inttoptr i64 %call.i98 to i8*, !dbg !1136
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !1137) #5, !dbg !1136
  %cmp.i99 = icmp eq i8* %8, %buf, !dbg !1138
  %conv1.i100 = zext i1 %cmp.i99 to i64, !dbg !1138
  tail call void @klee_assume(i64 %conv1.i100) #5, !dbg !1138
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !176), !dbg !1134
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !1139) #5, !dbg !1141
  %call.i = tail call i64 @klee_get_valuel(i64 %count) #5, !dbg !1142
  tail call void @llvm.dbg.value(metadata !{i64 %call.i}, i64 0, metadata !1143) #5, !dbg !1142
  %cmp.i = icmp eq i64 %call.i, %count, !dbg !1144
  %conv1.i = zext i1 %cmp.i to i64, !dbg !1144
  tail call void @klee_assume(i64 %conv1.i) #5, !dbg !1144
  tail call void @llvm.dbg.value(metadata !{i64 %call.i}, i64 0, metadata !177), !dbg !1140
  tail call void @klee_check_memory_access(i8* %8, i64 %call.i) #5, !dbg !1145
  %fd17 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1146
  %9 = load i32* %fd17, align 8, !dbg !1146, !tbaa !855
  %cmp18 = icmp eq i32 %9, 0, !dbg !1146
  br i1 %cmp18, label %if.then19, label %if.else, !dbg !1146

if.then19:                                        ; preds = %if.then14
  %call21 = tail call i64 (i64, ...)* @syscall(i64 0, i32 0, i8* %8, i64 %call.i) #5, !dbg !1148
  br label %if.end25, !dbg !1148

if.else:                                          ; preds = %if.then14
  %off = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1149
  %10 = load i64* %off, align 8, !dbg !1149, !tbaa !1150
  %call23 = tail call i64 (i64, ...)* @syscall(i64 17, i32 %9, i8* %8, i64 %call.i, i64 %10) #5, !dbg !1149
  br label %if.end25

if.end25:                                         ; preds = %if.else, %if.then19
  %r.0.in = phi i64 [ %call21, %if.then19 ], [ %call23, %if.else ]
  %r.0 = trunc i64 %r.0.in to i32, !dbg !1148
  %cmp26 = icmp eq i32 %r.0, -1, !dbg !1151
  br i1 %cmp26, label %if.then28, label %if.end31, !dbg !1151

if.then28:                                        ; preds = %if.end25
  %call29 = tail call i32 @klee_get_errno() #5, !dbg !1153
  %call30 = tail call i32* @__errno_location() #1, !dbg !1153
  store i32 %call29, i32* %call30, align 4, !dbg !1153, !tbaa !752
  br label %return, !dbg !1155

if.end31:                                         ; preds = %if.end25
  %11 = load i32* %fd17, align 8, !dbg !1156, !tbaa !855
  %cmp33 = icmp eq i32 %11, 0, !dbg !1156
  %sext.pre = shl i64 %r.0.in, 32, !dbg !1158
  %conv39.pre = ashr exact i64 %sext.pre, 32, !dbg !1158
  br i1 %cmp33, label %return, label %if.then35, !dbg !1156

if.then35:                                        ; preds = %if.end31
  %off37 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1159
  %12 = load i64* %off37, align 8, !dbg !1159, !tbaa !1150
  %add = add nsw i64 %12, %conv39.pre, !dbg !1159
  store i64 %add, i64* %off37, align 8, !dbg !1159, !tbaa !1150
  br label %return, !dbg !1159

if.else40:                                        ; preds = %if.end12
  %off41 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1160
  %13 = load i64* %off41, align 8, !dbg !1160, !tbaa !1150
  %cmp42 = icmp sgt i64 %13, -1, !dbg !1160
  br i1 %cmp42, label %cond.end, label %cond.false, !dbg !1160

cond.false:                                       ; preds = %if.else40
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 386, i8* getelementptr inbounds ([34 x i8]* @__PRETTY_FUNCTION__.read, i64 0, i64 0)) #8, !dbg !1160
  unreachable, !dbg !1160

cond.end:                                         ; preds = %if.else40
  %size = getelementptr inbounds %struct.exe_disk_file_t* %6, i64 0, i32 0, !dbg !1162
  %14 = load i32* %size, align 4, !dbg !1162, !tbaa !1164
  %conv45 = zext i32 %14 to i64, !dbg !1162
  %cmp47 = icmp slt i64 %conv45, %13, !dbg !1162
  br i1 %cmp47, label %return, label %if.end50, !dbg !1162

if.end50:                                         ; preds = %cond.end
  %add52 = add i64 %13, %count, !dbg !1165
  %cmp56 = icmp ugt i64 %add52, %conv45, !dbg !1165
  %sub = sub nsw i64 %conv45, %13, !dbg !1167
  tail call void @llvm.dbg.value(metadata !{i64 %sub}, i64 0, metadata !177), !dbg !1167
  %sub.count = select i1 %cmp56, i64 %sub, i64 %count, !dbg !1165
  %contents = getelementptr inbounds %struct.exe_disk_file_t* %6, i64 0, i32 1, !dbg !1169
  %15 = load i8** %contents, align 8, !dbg !1169, !tbaa !1170
  %add.ptr = getelementptr inbounds i8* %15, i64 %13, !dbg !1169
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %buf, i8* %add.ptr, i64 %sub.count, i32 1, i1 false), !dbg !1169
  %16 = load i64* %off41, align 8, !dbg !1171, !tbaa !1150
  %add67 = add i64 %16, %sub.count, !dbg !1171
  store i64 %add67, i64* %off41, align 8, !dbg !1171, !tbaa !1150
  br label %return, !dbg !1172

return:                                           ; preds = %if.end31, %if.then35, %cond.end, %entry, %if.end50, %if.then28, %if.then10, %if.then5, %if.then2
  %retval.0 = phi i64 [ -1, %if.then2 ], [ -1, %if.then10 ], [ %sub.count, %if.end50 ], [ -1, %if.then28 ], [ -1, %if.then5 ], [ 0, %entry ], [ 0, %cond.end ], [ %conv39.pre, %if.then35 ], [ %conv39.pre, %if.end31 ]
  ret i64 %retval.0, !dbg !1173
}

declare void @klee_check_memory_access(i8*, i64) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #6

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define i64 @write(i32 %fd, i8* %buf, i64 %count) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !188), !dbg !1174
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !189), !dbg !1174
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !190), !dbg !1174
  %0 = load i32* @write.n_calls, align 4, !dbg !1175, !tbaa !752
  %inc = add nsw i32 %0, 1, !dbg !1175
  store i32 %inc, i32* @write.n_calls, align 4, !dbg !1175, !tbaa !752
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1176), !dbg !1178
  %1 = icmp ult i32 %fd, 32, !dbg !1179
  br i1 %1, label %if.then.i, label %if.then, !dbg !1179

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1180
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1181
  %2 = load i32* %flags.i, align 4, !dbg !1181, !tbaa !765
  %and.i = and i32 %2, 1, !dbg !1181
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1181
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !1181

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1180
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !191), !dbg !1177
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1182
  br i1 %tobool, label %if.then, label %if.end, !dbg !1182

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !1184
  store i32 9, i32* %call1, align 4, !dbg !1184, !tbaa !752
  br label %return, !dbg !1186

if.end:                                           ; preds = %__get_file.exit
  %3 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1187, !tbaa !1096
  %tobool2 = icmp eq i32 %3, 0, !dbg !1187
  br i1 %tobool2, label %if.end5, label %land.lhs.true, !dbg !1187

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !1187, !tbaa !1189
  %5 = load i32* %4, align 4, !dbg !1187, !tbaa !752
  %cmp = icmp eq i32 %5, %inc, !dbg !1187
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !1187

if.then3:                                         ; preds = %land.lhs.true
  %dec = add i32 %3, -1, !dbg !1190
  store i32 %dec, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1190, !tbaa !1096
  %call4 = tail call i32* @__errno_location() #1, !dbg !1192
  store i32 5, i32* %call4, align 4, !dbg !1192, !tbaa !752
  br label %return, !dbg !1193

if.end5:                                          ; preds = %if.end, %land.lhs.true
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1194
  %6 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1194, !tbaa !788
  %tobool6 = icmp eq %struct.exe_disk_file_t* %6, null, !dbg !1194
  br i1 %tobool6, label %if.then7, label %if.else41, !dbg !1194

if.then7:                                         ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !1195) #5, !dbg !1197
  %7 = ptrtoint i8* %buf to i64, !dbg !1198
  %call.i126 = tail call i64 @klee_get_valuel(i64 %7) #5, !dbg !1198
  %8 = inttoptr i64 %call.i126 to i8*, !dbg !1198
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !1199) #5, !dbg !1198
  %cmp.i127 = icmp eq i8* %8, %buf, !dbg !1200
  %conv1.i128 = zext i1 %cmp.i127 to i64, !dbg !1200
  tail call void @klee_assume(i64 %conv1.i128) #5, !dbg !1200
  tail call void @llvm.dbg.value(metadata !{i8* %8}, i64 0, metadata !189), !dbg !1196
  tail call void @llvm.dbg.value(metadata !{i64 %count}, i64 0, metadata !1201) #5, !dbg !1203
  %call.i = tail call i64 @klee_get_valuel(i64 %count) #5, !dbg !1204
  tail call void @llvm.dbg.value(metadata !{i64 %call.i}, i64 0, metadata !1205) #5, !dbg !1204
  %cmp.i = icmp eq i64 %call.i, %count, !dbg !1206
  %conv1.i = zext i1 %cmp.i to i64, !dbg !1206
  tail call void @klee_assume(i64 %conv1.i) #5, !dbg !1206
  tail call void @llvm.dbg.value(metadata !{i64 %call.i}, i64 0, metadata !190), !dbg !1202
  tail call void @klee_check_memory_access(i8* %8, i64 %call.i) #5, !dbg !1207
  %fd10 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1208
  %9 = load i32* %fd10, align 8, !dbg !1208, !tbaa !855
  %.off = add i32 %9, -1, !dbg !1208
  %switch = icmp ult i32 %.off, 2, !dbg !1208
  br i1 %switch, label %if.then14, label %if.else, !dbg !1208

if.then14:                                        ; preds = %if.then7
  %call16 = tail call i64 (i64, ...)* @syscall(i64 1, i32 %9, i8* %8, i64 %call.i) #5, !dbg !1210
  br label %if.end20, !dbg !1210

if.else:                                          ; preds = %if.then7
  %off = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1211
  %10 = load i64* %off, align 8, !dbg !1211, !tbaa !1150
  %call18 = tail call i64 (i64, ...)* @syscall(i64 18, i32 %9, i8* %8, i64 %call.i, i64 %10) #5, !dbg !1211
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then14
  %r.0.in = phi i64 [ %call16, %if.then14 ], [ %call18, %if.else ]
  %r.0 = trunc i64 %r.0.in to i32, !dbg !1210
  %cmp21 = icmp eq i32 %r.0, -1, !dbg !1212
  br i1 %cmp21, label %if.then23, label %if.end26, !dbg !1212

if.then23:                                        ; preds = %if.end20
  %call24 = tail call i32 @klee_get_errno() #5, !dbg !1214
  %call25 = tail call i32* @__errno_location() #1, !dbg !1214
  store i32 %call24, i32* %call25, align 4, !dbg !1214, !tbaa !752
  br label %return, !dbg !1216

if.end26:                                         ; preds = %if.end20
  %cmp27 = icmp sgt i32 %r.0, -1, !dbg !1217
  br i1 %cmp27, label %cond.end, label %cond.false, !dbg !1217

cond.false:                                       ; preds = %if.end26
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 440, i8* getelementptr inbounds ([41 x i8]* @__PRETTY_FUNCTION__.write, i64 0, i64 0)) #8, !dbg !1217
  unreachable, !dbg !1217

cond.end:                                         ; preds = %if.end26
  %11 = load i32* %fd10, align 8, !dbg !1218, !tbaa !855
  %.off124 = add i32 %11, -1, !dbg !1218
  %switch125 = icmp ult i32 %.off124, 2, !dbg !1218
  %sext.pre = shl i64 %r.0.in, 32, !dbg !1220
  %conv40.pre = ashr exact i64 %sext.pre, 32, !dbg !1220
  br i1 %switch125, label %return, label %if.then36, !dbg !1218

if.then36:                                        ; preds = %cond.end
  %off38 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1221
  %12 = load i64* %off38, align 8, !dbg !1221, !tbaa !1150
  %add = add nsw i64 %12, %conv40.pre, !dbg !1221
  store i64 %add, i64* %off38, align 8, !dbg !1221, !tbaa !1150
  br label %return, !dbg !1221

if.else41:                                        ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata !1222, i64 0, metadata !195), !dbg !1223
  %off42 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1224
  %13 = load i64* %off42, align 8, !dbg !1224, !tbaa !1150
  %add43 = add i64 %13, %count, !dbg !1224
  %size = getelementptr inbounds %struct.exe_disk_file_t* %6, i64 0, i32 0, !dbg !1224
  %14 = load i32* %size, align 4, !dbg !1224, !tbaa !1164
  %conv45 = zext i32 %14 to i64, !dbg !1224
  %cmp46 = icmp ugt i64 %add43, %conv45, !dbg !1224
  br i1 %cmp46, label %if.else49, label %if.end66, !dbg !1224

if.else49:                                        ; preds = %if.else41
  %15 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i64 0, i32 3), align 8, !dbg !1226, !tbaa !1229
  %tobool50 = icmp eq i32 %15, 0, !dbg !1226
  br i1 %tobool50, label %if.else52, label %if.then51, !dbg !1226

if.then51:                                        ; preds = %if.else49
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 453, i8* getelementptr inbounds ([41 x i8]* @__PRETTY_FUNCTION__.write, i64 0, i64 0)) #8, !dbg !1230
  unreachable, !dbg !1230

if.else52:                                        ; preds = %if.else49
  %cmp57 = icmp sgt i64 %conv45, %13, !dbg !1231
  %sub = sub nsw i64 %conv45, %13, !dbg !1234
  tail call void @llvm.dbg.value(metadata !{i64 %sub}, i64 0, metadata !195), !dbg !1234
  br i1 %cmp57, label %if.end66, label %if.end71

if.end66:                                         ; preds = %if.else52, %if.else41
  %actual_count.0 = phi i64 [ %count, %if.else41 ], [ %sub, %if.else52 ]
  %tobool67 = icmp eq i64 %actual_count.0, 0, !dbg !1235
  br i1 %tobool67, label %if.end71, label %if.then68, !dbg !1235

if.then68:                                        ; preds = %if.end66
  %contents = getelementptr inbounds %struct.exe_disk_file_t* %6, i64 0, i32 1, !dbg !1237
  %16 = load i8** %contents, align 8, !dbg !1237, !tbaa !1170
  %add.ptr = getelementptr inbounds i8* %16, i64 %13, !dbg !1237
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %add.ptr, i8* %buf, i64 %actual_count.0, i32 1, i1 false), !dbg !1237
  br label %if.end71, !dbg !1237

if.end71:                                         ; preds = %if.else52, %if.end66, %if.then68
  %actual_count.0131 = phi i64 [ 0, %if.end66 ], [ %actual_count.0, %if.then68 ], [ 0, %if.else52 ]
  %cmp72 = icmp eq i64 %actual_count.0131, %count, !dbg !1238
  br i1 %cmp72, label %if.end75, label %if.then74, !dbg !1238

if.then74:                                        ; preds = %if.end71
  tail call void @klee_warning(i8* getelementptr inbounds ([24 x i8]* @.str7, i64 0, i64 0)) #5, !dbg !1240
  br label %if.end75, !dbg !1240

if.end75:                                         ; preds = %if.end71, %if.then74
  %17 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1241, !tbaa !788
  %18 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !1241, !tbaa !1243
  %cmp77 = icmp eq %struct.exe_disk_file_t* %17, %18, !dbg !1241
  br i1 %cmp77, label %if.then79, label %if.end83, !dbg !1241

if.then79:                                        ; preds = %if.end75
  %19 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1244, !tbaa !1245
  %conv80 = zext i32 %19 to i64, !dbg !1244
  %add81 = add i64 %conv80, %actual_count.0131, !dbg !1244
  %conv82 = trunc i64 %add81 to i32, !dbg !1244
  store i32 %conv82, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !1244, !tbaa !1245
  br label %if.end83, !dbg !1244

if.end83:                                         ; preds = %if.then79, %if.end75
  %20 = load i64* %off42, align 8, !dbg !1246, !tbaa !1150
  %add85 = add i64 %20, %count, !dbg !1246
  store i64 %add85, i64* %off42, align 8, !dbg !1246, !tbaa !1150
  br label %return, !dbg !1247

return:                                           ; preds = %cond.end, %if.then36, %if.end83, %if.then23, %if.then3, %if.then
  %retval.0 = phi i64 [ -1, %if.then3 ], [ %count, %if.end83 ], [ -1, %if.then23 ], [ -1, %if.then ], [ %conv40.pre, %if.then36 ], [ %conv40.pre, %cond.end ]
  ret i64 %retval.0, !dbg !1248
}

; Function Attrs: nounwind uwtable
define i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !201), !dbg !1249
  tail call void @llvm.dbg.value(metadata !{i64 %offset}, i64 0, metadata !202), !dbg !1249
  tail call void @llvm.dbg.value(metadata !{i32 %whence}, i64 0, metadata !203), !dbg !1249
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1250), !dbg !1252
  %0 = icmp ult i32 %fd, 32, !dbg !1253
  br i1 %0, label %if.then.i, label %if.then, !dbg !1253

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1254
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1255
  %1 = load i32* %flags.i, align 4, !dbg !1255, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1255
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1255
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !1255

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1254
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !205), !dbg !1251
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1256
  br i1 %tobool, label %if.then, label %if.end, !dbg !1256

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !1258
  store i32 9, i32* %call1, align 4, !dbg !1258, !tbaa !752
  br label %return, !dbg !1260

if.end:                                           ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1261
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1261, !tbaa !788
  %tobool2 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !1261
  br i1 %tobool2, label %if.then3, label %if.end23, !dbg !1261

if.then3:                                         ; preds = %if.end
  %cmp = icmp eq i32 %whence, 0, !dbg !1263
  %fd5 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1266
  %3 = load i32* %fd5, align 8, !dbg !1266, !tbaa !855
  br i1 %cmp, label %if.then4, label %if.else, !dbg !1263

if.then4:                                         ; preds = %if.then3
  %call6 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %3, i64 %offset, i32 0) #5, !dbg !1266
  tail call void @llvm.dbg.value(metadata !{i64 %call6}, i64 0, metadata !204), !dbg !1266
  br label %if.end16, !dbg !1268

if.else:                                          ; preds = %if.then3
  %off = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1269
  %4 = load i64* %off, align 8, !dbg !1269, !tbaa !1150
  %call8 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %3, i64 %4, i32 0) #5, !dbg !1269
  tail call void @llvm.dbg.value(metadata !{i64 %call8}, i64 0, metadata !204), !dbg !1269
  %cmp9 = icmp eq i64 %call8, -1, !dbg !1271
  br i1 %cmp9, label %if.then18, label %if.then10, !dbg !1271

if.then10:                                        ; preds = %if.else
  %5 = load i64* %off, align 8, !dbg !1273, !tbaa !1150
  %cmp12 = icmp eq i64 %call8, %5, !dbg !1273
  br i1 %cmp12, label %cond.end, label %cond.false, !dbg !1273

cond.false:                                       ; preds = %if.then10
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 499, i8* getelementptr inbounds ([38 x i8]* @__PRETTY_FUNCTION__.__fd_lseek, i64 0, i64 0)) #8, !dbg !1273
  unreachable, !dbg !1273

cond.end:                                         ; preds = %if.then10
  %6 = load i32* %fd5, align 8, !dbg !1275, !tbaa !855
  %call14 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %6, i64 %offset, i32 %whence) #5, !dbg !1275
  tail call void @llvm.dbg.value(metadata !{i64 %call14}, i64 0, metadata !204), !dbg !1275
  br label %if.end16, !dbg !1276

if.end16:                                         ; preds = %cond.end, %if.then4
  %new_off.0 = phi i64 [ %call6, %if.then4 ], [ %call14, %cond.end ]
  %cmp17 = icmp eq i64 %new_off.0, -1, !dbg !1277
  br i1 %cmp17, label %if.then18, label %if.end21, !dbg !1277

if.then18:                                        ; preds = %if.else, %if.end16
  %call19 = tail call i32 @klee_get_errno() #5, !dbg !1279
  %call20 = tail call i32* @__errno_location() #1, !dbg !1279
  store i32 %call19, i32* %call20, align 4, !dbg !1279, !tbaa !752
  br label %return, !dbg !1281

if.end21:                                         ; preds = %if.end16
  %off22 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1282
  store i64 %new_off.0, i64* %off22, align 8, !dbg !1282, !tbaa !1150
  br label %return, !dbg !1283

if.end23:                                         ; preds = %if.end
  switch i32 %whence, label %sw.default [
    i32 0, label %sw.epilog
    i32 1, label %sw.bb24
    i32 2, label %sw.bb26
  ], !dbg !1284

sw.bb24:                                          ; preds = %if.end23
  %off25 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1285
  %7 = load i64* %off25, align 8, !dbg !1285, !tbaa !1150
  %add = add nsw i64 %7, %offset, !dbg !1285
  tail call void @llvm.dbg.value(metadata !{i64 %add}, i64 0, metadata !204), !dbg !1285
  br label %sw.epilog, !dbg !1285

sw.bb26:                                          ; preds = %if.end23
  %size = getelementptr inbounds %struct.exe_disk_file_t* %2, i64 0, i32 0, !dbg !1287
  %8 = load i32* %size, align 4, !dbg !1287, !tbaa !1164
  %conv = zext i32 %8 to i64, !dbg !1287
  %add28 = add nsw i64 %conv, %offset, !dbg !1287
  tail call void @llvm.dbg.value(metadata !{i64 %add28}, i64 0, metadata !204), !dbg !1287
  br label %sw.epilog, !dbg !1287

sw.default:                                       ; preds = %if.end23
  %call29 = tail call i32* @__errno_location() #1, !dbg !1288
  store i32 22, i32* %call29, align 4, !dbg !1288, !tbaa !752
  br label %return, !dbg !1290

sw.epilog:                                        ; preds = %if.end23, %sw.bb26, %sw.bb24
  %new_off.1 = phi i64 [ %add28, %sw.bb26 ], [ %add, %sw.bb24 ], [ %offset, %if.end23 ]
  %cmp30 = icmp slt i64 %new_off.1, 0, !dbg !1291
  br i1 %cmp30, label %if.then32, label %if.end34, !dbg !1291

if.then32:                                        ; preds = %sw.epilog
  %call33 = tail call i32* @__errno_location() #1, !dbg !1293
  store i32 22, i32* %call33, align 4, !dbg !1293, !tbaa !752
  br label %return, !dbg !1295

if.end34:                                         ; preds = %sw.epilog
  %off35 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1296
  store i64 %new_off.1, i64* %off35, align 8, !dbg !1296, !tbaa !1150
  br label %return, !dbg !1297

return:                                           ; preds = %if.end34, %if.then32, %sw.default, %if.end21, %if.then18, %if.then
  %retval.0 = phi i64 [ -1, %sw.default ], [ -1, %if.then32 ], [ %new_off.1, %if.end34 ], [ -1, %if.then18 ], [ %new_off.0, %if.end21 ], [ -1, %if.then ]
  ret i64 %retval.0, !dbg !1298
}

; Function Attrs: nounwind uwtable
define i32 @__fd_stat(i8* %path, %struct.stat64* %buf) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !210), !dbg !1299
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !211), !dbg !1299
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1300), !dbg !1302
  %0 = load i8* %path, align 1, !dbg !1303, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !1304), !dbg !1303
  %conv.i = sext i8 %0 to i32, !dbg !1305
  %cmp.i = icmp eq i8 %0, 0, !dbg !1305
  br i1 %cmp.i, label %if.end, label %lor.lhs.false.i, !dbg !1305

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !1305
  %1 = load i8* %arrayidx2.i, align 1, !dbg !1305, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !1305
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end, !dbg !1305

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1306, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !1306
  br i1 %cmp626.i, label %if.end, label %for.body.i, !dbg !1306

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !1306
  br i1 %cmp6.i, label %for.body.i, label %if.end, !dbg !1306

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !1307
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !1307
  %add.i = add nsw i32 %conv10.i, 65, !dbg !1307
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !1307
  %inc.i = add i32 %i.027.i, 1, !dbg !1306
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !1308), !dbg !1306
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !1307

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !1309
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1309, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !1310
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !1310, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !1310
  %5 = load i64* %st_ino.i, align 8, !dbg !1310, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !1310
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !1309
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !1311
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !1310
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1310

if.then:                                          ; preds = %if.then13.i
  %6 = bitcast %struct.stat64* %buf to i8*, !dbg !1313
  %7 = bitcast %struct.stat64* %4 to i8*, !dbg !1313
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 144, i32 8, i1 false), !dbg !1313
  br label %return, !dbg !1315

if.end:                                           ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1316) #5, !dbg !1318
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1319) #5, !dbg !1321
  %8 = ptrtoint i8* %path to i64, !dbg !1322
  %call.i.i = tail call i64 @klee_get_valuel(i64 %8) #5, !dbg !1322
  %9 = inttoptr i64 %call.i.i to i8*, !dbg !1322
  tail call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !1323) #5, !dbg !1322
  %cmp.i.i = icmp eq i8* %9, %path, !dbg !1324
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !1324
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !1324
  tail call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !1325) #5, !dbg !1320
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1326) #5, !dbg !1327
  br label %for.cond.i12, !dbg !1327

for.cond.i12:                                     ; preds = %for.inc.i, %if.end
  %i.0.i = phi i32 [ 0, %if.end ], [ %inc.i14, %for.inc.i ]
  %sc.0.i = phi i8* [ %9, %if.end ], [ %sc.1.i, %for.inc.i ]
  %10 = load i8* %sc.0.i, align 1, !dbg !1328, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %10}, i64 0, metadata !1329) #5, !dbg !1328
  %sub.i = add i32 %i.0.i, -1, !dbg !1330
  %and.i = and i32 %sub.i, %i.0.i, !dbg !1330
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1330
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !1330

if.then.i:                                        ; preds = %for.cond.i12
  switch i8 %10, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !1331

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !1332, !tbaa !694
  br label %__concretize_string.exit, !dbg !1333

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1334
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !1325) #5, !dbg !1334
  store i8 47, i8* %sc.0.i, align 1, !dbg !1334, !tbaa !694
  br label %for.inc.i, !dbg !1335

if.else7.i:                                       ; preds = %for.cond.i12
  %conv8.i = sext i8 %10 to i64, !dbg !1336
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1336
  %conv10.i13 = trunc i64 %call9.i to i8, !dbg !1336
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i13}, i64 0, metadata !1337) #5, !dbg !1336
  %cmp13.i = icmp eq i8 %conv10.i13, %10, !dbg !1338
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1338
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1338
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1339
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !1325) #5, !dbg !1339
  store i8 %conv10.i13, i8* %sc.0.i, align 1, !dbg !1339, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i13, 0, !dbg !1340
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !1340

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i14 = add i32 %i.0.i, 1, !dbg !1327
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i14}, i64 0, metadata !1326) #5, !dbg !1327
  br label %for.cond.i12, !dbg !1327

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call2 = tail call i64 (i64, ...)* @syscall(i64 4, i8* %path, %struct.stat64* %buf) #5, !dbg !1317
  %conv = trunc i64 %call2 to i32, !dbg !1317
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !213), !dbg !1317
  %cmp = icmp eq i32 %conv, -1, !dbg !1341
  br i1 %cmp, label %if.then4, label %return, !dbg !1341

if.then4:                                         ; preds = %__concretize_string.exit
  %call5 = tail call i32 @klee_get_errno() #5, !dbg !1343
  %call6 = tail call i32* @__errno_location() #1, !dbg !1343
  store i32 %call5, i32* %call6, align 4, !dbg !1343, !tbaa !752
  br label %return, !dbg !1343

return:                                           ; preds = %__concretize_string.exit, %if.then4, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ -1, %if.then4 ], [ %conv, %__concretize_string.exit ]
  ret i32 %retval.0, !dbg !1344
}

; Function Attrs: inlinehint nounwind uwtable
define i32 @fstatat(i32 %fd, i8* %path, %struct.stat* %buf, i32 %flags) #7 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !239), !dbg !1345
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !240), !dbg !1345
  tail call void @llvm.dbg.value(metadata !{%struct.stat* %buf}, i64 0, metadata !241), !dbg !1345
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !242), !dbg !1345
  %cmp = icmp eq i32 %fd, -100, !dbg !1346
  br i1 %cmp, label %if.end8, label %if.then, !dbg !1346

if.then:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1347), !dbg !1349
  %0 = icmp ult i32 %fd, 32, !dbg !1350
  br i1 %0, label %if.then.i, label %if.then1, !dbg !1350

if.then.i:                                        ; preds = %if.then
  %idxprom.i = sext i32 %fd to i64, !dbg !1351
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1352
  %1 = load i32* %flags.i, align 4, !dbg !1352, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1352
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1352
  br i1 %tobool.i, label %if.then1, label %__get_file.exit, !dbg !1352

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1351
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !243), !dbg !1348
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1353
  br i1 %tobool, label %if.then1, label %if.else, !dbg !1353

if.then1:                                         ; preds = %if.then, %if.then.i, %__get_file.exit
  %call2 = tail call i32* @__errno_location() #1, !dbg !1355
  store i32 9, i32* %call2, align 4, !dbg !1355, !tbaa !752
  br label %return, !dbg !1357

if.else:                                          ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1358
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1358, !tbaa !788
  %tobool3 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !1358
  br i1 %tobool3, label %if.end6, label %if.then4, !dbg !1358

if.then4:                                         ; preds = %if.else
  tail call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str2, i64 0, i64 0)) #5, !dbg !1360
  %call5 = tail call i32* @__errno_location() #1, !dbg !1362
  store i32 2, i32* %call5, align 4, !dbg !1362, !tbaa !752
  br label %return, !dbg !1363

if.end6:                                          ; preds = %if.else
  %fd7 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1364
  %3 = load i32* %fd7, align 8, !dbg !1364, !tbaa !855
  tail call void @llvm.dbg.value(metadata !{i32 %3}, i64 0, metadata !239), !dbg !1364
  %phitmp = sext i32 %3 to i64, !dbg !1365
  br label %if.end8, !dbg !1365

if.end8:                                          ; preds = %entry, %if.end6
  %fd.addr.0 = phi i64 [ %phitmp, %if.end6 ], [ -100, %entry ]
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1366), !dbg !1368
  %4 = load i8* %path, align 1, !dbg !1369, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %4}, i64 0, metadata !1370), !dbg !1369
  %conv.i = sext i8 %4 to i32, !dbg !1371
  %cmp.i = icmp eq i8 %4, 0, !dbg !1371
  br i1 %cmp.i, label %if.end13, label %lor.lhs.false.i, !dbg !1371

lor.lhs.false.i:                                  ; preds = %if.end8
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !1371
  %5 = load i8* %arrayidx2.i, align 1, !dbg !1371, !tbaa !694
  %cmp4.i = icmp eq i8 %5, 0, !dbg !1371
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end13, !dbg !1371

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %6 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1372, !tbaa !701
  %cmp626.i = icmp eq i32 %6, 0, !dbg !1372
  br i1 %cmp626.i, label %if.end13, label %for.body.i, !dbg !1372

for.cond.i38:                                     ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i40, %6, !dbg !1372
  br i1 %cmp6.i, label %for.body.i, label %if.end13, !dbg !1372

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i38
  %i.027.i = phi i32 [ %inc.i40, %for.cond.i38 ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !1373
  %conv10.i39 = ashr exact i32 %sext.i, 24, !dbg !1373
  %add.i = add nsw i32 %conv10.i39, 65, !dbg !1373
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !1373
  %inc.i40 = add i32 %i.027.i, 1, !dbg !1372
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i40}, i64 0, metadata !1374), !dbg !1372
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i38, !dbg !1373

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i41 = zext i32 %i.027.i to i64, !dbg !1375
  %7 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1375, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %7, i64 %idxprom.i41, i32 2, !dbg !1376
  %8 = load %struct.stat64** %stat.i, align 8, !dbg !1376, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %8, i64 0, i32 1, !dbg !1376
  %9 = load i64* %st_ino.i, align 8, !dbg !1376, !tbaa !713
  %cmp15.i = icmp eq i64 %9, 0, !dbg !1376
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %7, i64 %idxprom.i41, !dbg !1375
  %tobool11 = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !1377
  %or.cond = or i1 %cmp15.i, %tobool11, !dbg !1376
  br i1 %or.cond, label %if.end13, label %if.then12, !dbg !1376

if.then12:                                        ; preds = %if.then13.i
  %10 = bitcast %struct.stat* %buf to i8*, !dbg !1379
  %11 = bitcast %struct.stat64* %8 to i8*, !dbg !1379
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 144, i32 8, i1 false), !dbg !1379
  br label %return, !dbg !1381

if.end13:                                         ; preds = %for.cond.i38, %for.cond.preheader.i, %if.then13.i, %if.end8, %lor.lhs.false.i
  %tobool14 = icmp eq i8* %path, null, !dbg !1382
  br i1 %tobool14, label %cond.end, label %cond.true, !dbg !1382

cond.true:                                        ; preds = %if.end13
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1383) #5, !dbg !1385
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1386) #5, !dbg !1388
  %12 = ptrtoint i8* %path to i64, !dbg !1389
  %call.i.i = tail call i64 @klee_get_valuel(i64 %12) #5, !dbg !1389
  %13 = inttoptr i64 %call.i.i to i8*, !dbg !1389
  tail call void @llvm.dbg.value(metadata !{i8* %13}, i64 0, metadata !1390) #5, !dbg !1389
  %cmp.i.i = icmp eq i8* %13, %path, !dbg !1391
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !1391
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !1391
  tail call void @llvm.dbg.value(metadata !{i8* %13}, i64 0, metadata !1392) #5, !dbg !1387
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1393) #5, !dbg !1394
  br label %for.cond.i, !dbg !1394

for.cond.i:                                       ; preds = %for.inc.i, %cond.true
  %i.0.i = phi i32 [ 0, %cond.true ], [ %inc.i, %for.inc.i ]
  %sc.0.i = phi i8* [ %13, %cond.true ], [ %sc.1.i, %for.inc.i ]
  %14 = load i8* %sc.0.i, align 1, !dbg !1395, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %14}, i64 0, metadata !1396) #5, !dbg !1395
  %sub.i = add i32 %i.0.i, -1, !dbg !1397
  %and.i34 = and i32 %sub.i, %i.0.i, !dbg !1397
  %tobool.i35 = icmp eq i32 %and.i34, 0, !dbg !1397
  br i1 %tobool.i35, label %if.then.i36, label %if.else7.i, !dbg !1397

if.then.i36:                                      ; preds = %for.cond.i
  switch i8 %14, label %for.inc.i [
    i8 0, label %if.then2.i37
    i8 47, label %if.then4.i
  ], !dbg !1398

if.then2.i37:                                     ; preds = %if.then.i36
  store i8 0, i8* %sc.0.i, align 1, !dbg !1399, !tbaa !694
  br label %cond.end, !dbg !1400

if.then4.i:                                       ; preds = %if.then.i36
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1401
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !1392) #5, !dbg !1401
  store i8 47, i8* %sc.0.i, align 1, !dbg !1401, !tbaa !694
  br label %for.inc.i, !dbg !1402

if.else7.i:                                       ; preds = %for.cond.i
  %conv8.i = sext i8 %14 to i64, !dbg !1403
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1403
  %conv10.i = trunc i64 %call9.i to i8, !dbg !1403
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i}, i64 0, metadata !1404) #5, !dbg !1403
  %cmp13.i = icmp eq i8 %conv10.i, %14, !dbg !1405
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1405
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1405
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1406
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !1392) #5, !dbg !1406
  store i8 %conv10.i, i8* %sc.0.i, align 1, !dbg !1406, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i, 0, !dbg !1407
  br i1 %tobool17.i, label %cond.end, label %for.inc.i, !dbg !1407

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i36
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i36 ]
  %inc.i = add i32 %i.0.i, 1, !dbg !1394
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !1393) #5, !dbg !1394
  br label %for.cond.i, !dbg !1394

cond.end:                                         ; preds = %if.else7.i, %if.then2.i37, %if.end13
  %cond = phi i8* [ null, %if.end13 ], [ %path, %if.then2.i37 ], [ %path, %if.else7.i ], !dbg !1384
  %conv16 = sext i32 %flags to i64, !dbg !1382
  %call17 = tail call i64 (i64, ...)* @syscall(i64 262, i64 %fd.addr.0, i8* %cond, %struct.stat* %buf, i64 %conv16) #5, !dbg !1382
  %conv18 = trunc i64 %call17 to i32, !dbg !1382
  tail call void @llvm.dbg.value(metadata !{i32 %conv18}, i64 0, metadata !247), !dbg !1382
  %cmp19 = icmp eq i32 %conv18, -1, !dbg !1408
  br i1 %cmp19, label %if.then21, label %return, !dbg !1408

if.then21:                                        ; preds = %cond.end
  %call22 = tail call i32 @klee_get_errno() #5, !dbg !1410
  %call23 = tail call i32* @__errno_location() #1, !dbg !1410
  store i32 %call22, i32* %call23, align 4, !dbg !1410, !tbaa !752
  br label %return, !dbg !1410

return:                                           ; preds = %cond.end, %if.then21, %if.then12, %if.then4, %if.then1
  %retval.0 = phi i32 [ -1, %if.then4 ], [ 0, %if.then12 ], [ -1, %if.then1 ], [ -1, %if.then21 ], [ %conv18, %cond.end ]
  ret i32 %retval.0, !dbg !1411
}

; Function Attrs: nounwind uwtable
define i32 @__fd_lstat(i8* %path, %struct.stat64* %buf) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !250), !dbg !1412
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !251), !dbg !1412
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1413), !dbg !1415
  %0 = load i8* %path, align 1, !dbg !1416, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !1417), !dbg !1416
  %conv.i = sext i8 %0 to i32, !dbg !1418
  %cmp.i = icmp eq i8 %0, 0, !dbg !1418
  br i1 %cmp.i, label %if.end, label %lor.lhs.false.i, !dbg !1418

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !1418
  %1 = load i8* %arrayidx2.i, align 1, !dbg !1418, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !1418
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end, !dbg !1418

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1419, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !1419
  br i1 %cmp626.i, label %if.end, label %for.body.i, !dbg !1419

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !1419
  br i1 %cmp6.i, label %for.body.i, label %if.end, !dbg !1419

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !1420
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !1420
  %add.i = add nsw i32 %conv10.i, 65, !dbg !1420
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !1420
  %inc.i = add i32 %i.027.i, 1, !dbg !1419
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !1421), !dbg !1419
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !1420

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !1422
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1422, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !1423
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !1423, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !1423
  %5 = load i64* %st_ino.i, align 8, !dbg !1423, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !1423
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !1422
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !1424
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !1423
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1423

if.then:                                          ; preds = %if.then13.i
  %6 = bitcast %struct.stat64* %buf to i8*, !dbg !1426
  %7 = bitcast %struct.stat64* %4 to i8*, !dbg !1426
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 144, i32 8, i1 false), !dbg !1426
  br label %return, !dbg !1428

if.end:                                           ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1429) #5, !dbg !1431
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1432) #5, !dbg !1434
  %8 = ptrtoint i8* %path to i64, !dbg !1435
  %call.i.i = tail call i64 @klee_get_valuel(i64 %8) #5, !dbg !1435
  %9 = inttoptr i64 %call.i.i to i8*, !dbg !1435
  tail call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !1436) #5, !dbg !1435
  %cmp.i.i = icmp eq i8* %9, %path, !dbg !1437
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !1437
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !1437
  tail call void @llvm.dbg.value(metadata !{i8* %9}, i64 0, metadata !1438) #5, !dbg !1433
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1439) #5, !dbg !1440
  br label %for.cond.i12, !dbg !1440

for.cond.i12:                                     ; preds = %for.inc.i, %if.end
  %i.0.i = phi i32 [ 0, %if.end ], [ %inc.i14, %for.inc.i ]
  %sc.0.i = phi i8* [ %9, %if.end ], [ %sc.1.i, %for.inc.i ]
  %10 = load i8* %sc.0.i, align 1, !dbg !1441, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %10}, i64 0, metadata !1442) #5, !dbg !1441
  %sub.i = add i32 %i.0.i, -1, !dbg !1443
  %and.i = and i32 %sub.i, %i.0.i, !dbg !1443
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1443
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !1443

if.then.i:                                        ; preds = %for.cond.i12
  switch i8 %10, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !1444

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !1445, !tbaa !694
  br label %__concretize_string.exit, !dbg !1446

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1447
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !1438) #5, !dbg !1447
  store i8 47, i8* %sc.0.i, align 1, !dbg !1447, !tbaa !694
  br label %for.inc.i, !dbg !1448

if.else7.i:                                       ; preds = %for.cond.i12
  %conv8.i = sext i8 %10 to i64, !dbg !1449
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1449
  %conv10.i13 = trunc i64 %call9.i to i8, !dbg !1449
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i13}, i64 0, metadata !1450) #5, !dbg !1449
  %cmp13.i = icmp eq i8 %conv10.i13, %10, !dbg !1451
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1451
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1451
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1452
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !1438) #5, !dbg !1452
  store i8 %conv10.i13, i8* %sc.0.i, align 1, !dbg !1452, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i13, 0, !dbg !1453
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !1453

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i14 = add i32 %i.0.i, 1, !dbg !1440
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i14}, i64 0, metadata !1439) #5, !dbg !1440
  br label %for.cond.i12, !dbg !1440

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call2 = tail call i64 (i64, ...)* @syscall(i64 6, i8* %path, %struct.stat64* %buf) #5, !dbg !1430
  %conv = trunc i64 %call2 to i32, !dbg !1430
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !253), !dbg !1430
  %cmp = icmp eq i32 %conv, -1, !dbg !1454
  br i1 %cmp, label %if.then4, label %return, !dbg !1454

if.then4:                                         ; preds = %__concretize_string.exit
  %call5 = tail call i32 @klee_get_errno() #5, !dbg !1456
  %call6 = tail call i32* @__errno_location() #1, !dbg !1456
  store i32 %call5, i32* %call6, align 4, !dbg !1456, !tbaa !752
  br label %return, !dbg !1456

return:                                           ; preds = %__concretize_string.exit, %if.then4, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ -1, %if.then4 ], [ %conv, %__concretize_string.exit ]
  ret i32 %retval.0, !dbg !1457
}

; Function Attrs: nounwind uwtable
define i32 @chdir(i8* %path) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !259), !dbg !1458
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1459), !dbg !1461
  %0 = load i8* %path, align 1, !dbg !1462, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !1463), !dbg !1462
  %conv.i = sext i8 %0 to i32, !dbg !1464
  %cmp.i = icmp eq i8 %0, 0, !dbg !1464
  br i1 %cmp.i, label %if.end, label %lor.lhs.false.i, !dbg !1464

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !1464
  %1 = load i8* %arrayidx2.i, align 1, !dbg !1464, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !1464
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end, !dbg !1464

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1465, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !1465
  br i1 %cmp626.i, label %if.end, label %for.body.i, !dbg !1465

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !1465
  br i1 %cmp6.i, label %for.body.i, label %if.end, !dbg !1465

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !1466
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !1466
  %add.i = add nsw i32 %conv10.i, 65, !dbg !1466
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !1466
  %inc.i = add i32 %i.027.i, 1, !dbg !1465
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !1467), !dbg !1465
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !1466

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !1468
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1468, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !1469
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !1469, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !1469
  %5 = load i64* %st_ino.i, align 8, !dbg !1469, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !1469
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !1468
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !1470
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !1469
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1469

if.then:                                          ; preds = %if.then13.i
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !1472
  %call1 = tail call i32* @__errno_location() #1, !dbg !1474
  store i32 2, i32* %call1, align 4, !dbg !1474, !tbaa !752
  br label %return, !dbg !1475

if.end:                                           ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1476) #5, !dbg !1478
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1479) #5, !dbg !1481
  %6 = ptrtoint i8* %path to i64, !dbg !1482
  %call.i.i = tail call i64 @klee_get_valuel(i64 %6) #5, !dbg !1482
  %7 = inttoptr i64 %call.i.i to i8*, !dbg !1482
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !1483) #5, !dbg !1482
  %cmp.i.i = icmp eq i8* %7, %path, !dbg !1484
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !1484
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !1484
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !1485) #5, !dbg !1480
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1486) #5, !dbg !1487
  br label %for.cond.i11, !dbg !1487

for.cond.i11:                                     ; preds = %for.inc.i, %if.end
  %i.0.i = phi i32 [ 0, %if.end ], [ %inc.i13, %for.inc.i ]
  %sc.0.i = phi i8* [ %7, %if.end ], [ %sc.1.i, %for.inc.i ]
  %8 = load i8* %sc.0.i, align 1, !dbg !1488, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %8}, i64 0, metadata !1489) #5, !dbg !1488
  %sub.i = add i32 %i.0.i, -1, !dbg !1490
  %and.i = and i32 %sub.i, %i.0.i, !dbg !1490
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1490
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !1490

if.then.i:                                        ; preds = %for.cond.i11
  switch i8 %8, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !1491

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !1492, !tbaa !694
  br label %__concretize_string.exit, !dbg !1493

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1494
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !1485) #5, !dbg !1494
  store i8 47, i8* %sc.0.i, align 1, !dbg !1494, !tbaa !694
  br label %for.inc.i, !dbg !1495

if.else7.i:                                       ; preds = %for.cond.i11
  %conv8.i = sext i8 %8 to i64, !dbg !1496
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1496
  %conv10.i12 = trunc i64 %call9.i to i8, !dbg !1496
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i12}, i64 0, metadata !1497) #5, !dbg !1496
  %cmp13.i = icmp eq i8 %conv10.i12, %8, !dbg !1498
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1498
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1498
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1499
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !1485) #5, !dbg !1499
  store i8 %conv10.i12, i8* %sc.0.i, align 1, !dbg !1499, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i12, 0, !dbg !1500
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !1500

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i13 = add i32 %i.0.i, 1, !dbg !1487
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i13}, i64 0, metadata !1486) #5, !dbg !1487
  br label %for.cond.i11, !dbg !1487

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call3 = tail call i64 (i64, ...)* @syscall(i64 80, i8* %path) #5, !dbg !1477
  %conv = trunc i64 %call3 to i32, !dbg !1477
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !261), !dbg !1477
  %cmp = icmp eq i32 %conv, -1, !dbg !1501
  br i1 %cmp, label %if.then5, label %return, !dbg !1501

if.then5:                                         ; preds = %__concretize_string.exit
  %call6 = tail call i32 @klee_get_errno() #5, !dbg !1503
  %call7 = tail call i32* @__errno_location() #1, !dbg !1503
  store i32 %call6, i32* %call7, align 4, !dbg !1503, !tbaa !752
  br label %return, !dbg !1503

return:                                           ; preds = %__concretize_string.exit, %if.then5, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ -1, %if.then5 ], [ %conv, %__concretize_string.exit ]
  ret i32 %retval.0, !dbg !1504
}

; Function Attrs: nounwind uwtable
define i32 @fchdir(i32 %fd) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !265), !dbg !1505
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1506), !dbg !1508
  %0 = icmp ult i32 %fd, 32, !dbg !1509
  br i1 %0, label %if.then.i, label %if.then, !dbg !1509

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1510
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1511
  %1 = load i32* %flags.i, align 4, !dbg !1511, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1511
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1511
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !1511

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1510
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !266), !dbg !1507
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1512
  br i1 %tobool, label %if.then, label %if.end, !dbg !1512

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !1514
  store i32 9, i32* %call1, align 4, !dbg !1514, !tbaa !752
  br label %return, !dbg !1516

if.end:                                           ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1517
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1517, !tbaa !788
  %tobool2 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !1517
  br i1 %tobool2, label %if.else, label %if.then3, !dbg !1517

if.then3:                                         ; preds = %if.end
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !1518
  %call4 = tail call i32* @__errno_location() #1, !dbg !1520
  store i32 2, i32* %call4, align 4, !dbg !1520, !tbaa !752
  br label %return, !dbg !1521

if.else:                                          ; preds = %if.end
  %fd5 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1522
  %3 = load i32* %fd5, align 8, !dbg !1522, !tbaa !855
  %call6 = tail call i64 (i64, ...)* @syscall(i64 81, i32 %3) #5, !dbg !1522
  %conv = trunc i64 %call6 to i32, !dbg !1522
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !267), !dbg !1522
  %cmp = icmp eq i32 %conv, -1, !dbg !1523
  br i1 %cmp, label %if.then8, label %return, !dbg !1523

if.then8:                                         ; preds = %if.else
  %call9 = tail call i32 @klee_get_errno() #5, !dbg !1525
  %call10 = tail call i32* @__errno_location() #1, !dbg !1525
  store i32 %call9, i32* %call10, align 4, !dbg !1525, !tbaa !752
  br label %return, !dbg !1525

return:                                           ; preds = %if.else, %if.then8, %if.then3, %if.then
  %retval.0 = phi i32 [ -1, %if.then3 ], [ -1, %if.then ], [ -1, %if.then8 ], [ %conv, %if.else ]
  ret i32 %retval.0, !dbg !1526
}

; Function Attrs: nounwind uwtable
define i32 @chmod(i8* %path, i32 %mode) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !274), !dbg !1527
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !275), !dbg !1527
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1528), !dbg !1530
  %0 = load i8* %path, align 1, !dbg !1531, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !1532), !dbg !1531
  %conv.i = sext i8 %0 to i32, !dbg !1533
  %cmp.i = icmp eq i8 %0, 0, !dbg !1533
  br i1 %cmp.i, label %__get_sym_file.exit, label %lor.lhs.false.i, !dbg !1533

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !1533
  %1 = load i8* %arrayidx2.i, align 1, !dbg !1533, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !1533
  br i1 %cmp4.i, label %for.cond.preheader.i, label %__get_sym_file.exit, !dbg !1533

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1534, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !1534
  br i1 %cmp626.i, label %__get_sym_file.exit, label %for.body.i, !dbg !1534

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !1534
  br i1 %cmp6.i, label %for.body.i, label %__get_sym_file.exit, !dbg !1534

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !1535
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !1535
  %add.i = add nsw i32 %conv10.i, 65, !dbg !1535
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !1535
  %inc.i = add i32 %i.027.i, 1, !dbg !1534
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !1536), !dbg !1534
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !1535

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !1537
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1537, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !1538
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !1538, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !1538
  %5 = load i64* %st_ino.i, align 8, !dbg !1538, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !1538
  br i1 %cmp15.i, label %__get_sym_file.exit, label %if.end18.i, !dbg !1538

if.end18.i:                                       ; preds = %if.then13.i
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !1537
  br label %__get_sym_file.exit, !dbg !1539

__get_sym_file.exit:                              ; preds = %for.cond.i, %entry, %lor.lhs.false.i, %for.cond.preheader.i, %if.then13.i, %if.end18.i
  %retval.0.i = phi %struct.exe_disk_file_t* [ %arrayidx14.i, %if.end18.i ], [ null, %lor.lhs.false.i ], [ null, %entry ], [ null, %if.then13.i ], [ null, %for.cond.preheader.i ], [ null, %for.cond.i ]
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %retval.0.i}, i64 0, metadata !276), !dbg !1529
  %6 = load i32* @chmod.n_calls, align 4, !dbg !1540, !tbaa !752
  %inc = add nsw i32 %6, 1, !dbg !1540
  store i32 %inc, i32* @chmod.n_calls, align 4, !dbg !1540, !tbaa !752
  %7 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1541, !tbaa !1096
  %tobool = icmp eq i32 %7, 0, !dbg !1541
  br i1 %tobool, label %if.end, label %land.lhs.true, !dbg !1541

land.lhs.true:                                    ; preds = %__get_sym_file.exit
  %8 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 11), align 8, !dbg !1541, !tbaa !1543
  %9 = load i32* %8, align 4, !dbg !1541, !tbaa !752
  %cmp = icmp eq i32 %9, %inc, !dbg !1541
  br i1 %cmp, label %if.then, label %if.end, !dbg !1541

if.then:                                          ; preds = %land.lhs.true
  %dec = add i32 %7, -1, !dbg !1544
  store i32 %dec, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1544, !tbaa !1096
  %call1 = tail call i32* @__errno_location() #1, !dbg !1546
  store i32 5, i32* %call1, align 4, !dbg !1546, !tbaa !752
  br label %return, !dbg !1547

if.end:                                           ; preds = %__get_sym_file.exit, %land.lhs.true
  %tobool2 = icmp eq %struct.exe_disk_file_t* %retval.0.i, null, !dbg !1548
  br i1 %tobool2, label %if.else, label %if.then3, !dbg !1548

if.then3:                                         ; preds = %if.end
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %retval.0.i}, i64 0, metadata !1549) #5, !dbg !1552
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !1553) #5, !dbg !1552
  %call.i = tail call i32 @geteuid() #5, !dbg !1554
  %stat.i20 = getelementptr inbounds %struct.exe_disk_file_t* %retval.0.i, i64 0, i32 2, !dbg !1554
  %10 = load %struct.stat64** %stat.i20, align 8, !dbg !1554, !tbaa !711
  %st_uid.i = getelementptr inbounds %struct.stat64* %10, i64 0, i32 4, !dbg !1554
  %11 = load i32* %st_uid.i, align 4, !dbg !1554, !tbaa !1556
  %cmp.i21 = icmp eq i32 %call.i, %11, !dbg !1554
  br i1 %cmp.i21, label %if.then.i23, label %if.else.i, !dbg !1554

if.then.i23:                                      ; preds = %if.then3
  %call1.i = tail call i32 @getgid() #5, !dbg !1557
  %12 = load %struct.stat64** %stat.i20, align 8, !dbg !1557, !tbaa !711
  %st_gid.i = getelementptr inbounds %struct.stat64* %12, i64 0, i32 5, !dbg !1557
  %13 = load i32* %st_gid.i, align 4, !dbg !1557, !tbaa !1560
  %cmp3.i = icmp eq i32 %call1.i, %13, !dbg !1557
  %and.i22 = and i32 %mode, 3071, !dbg !1561
  tail call void @llvm.dbg.value(metadata !{i32 %and.i22}, i64 0, metadata !1553) #5, !dbg !1561
  %mode.and.i = select i1 %cmp3.i, i32 %mode, i32 %and.i22, !dbg !1557
  %st_mode.i = getelementptr inbounds %struct.stat64* %12, i64 0, i32 3, !dbg !1562
  %14 = load i32* %st_mode.i, align 4, !dbg !1562, !tbaa !805
  %and6.i = and i32 %14, -4096, !dbg !1562
  %and7.i = and i32 %mode.and.i, 4095, !dbg !1562
  %or.i = or i32 %and7.i, %and6.i, !dbg !1562
  store i32 %or.i, i32* %st_mode.i, align 4, !dbg !1562, !tbaa !805
  br label %return, !dbg !1563

if.else.i:                                        ; preds = %if.then3
  %call10.i = tail call i32* @__errno_location() #1, !dbg !1564
  store i32 1, i32* %call10.i, align 4, !dbg !1564, !tbaa !752
  br label %return, !dbg !1566

if.else:                                          ; preds = %if.end
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1567) #5, !dbg !1569
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1570) #5, !dbg !1572
  %15 = ptrtoint i8* %path to i64, !dbg !1573
  %call.i.i = tail call i64 @klee_get_valuel(i64 %15) #5, !dbg !1573
  %16 = inttoptr i64 %call.i.i to i8*, !dbg !1573
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !1574) #5, !dbg !1573
  %cmp.i.i = icmp eq i8* %16, %path, !dbg !1575
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !1575
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !1575
  tail call void @llvm.dbg.value(metadata !{i8* %16}, i64 0, metadata !1576) #5, !dbg !1571
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1577) #5, !dbg !1578
  br label %for.cond.i17, !dbg !1578

for.cond.i17:                                     ; preds = %for.inc.i, %if.else
  %i.0.i = phi i32 [ 0, %if.else ], [ %inc.i19, %for.inc.i ]
  %sc.0.i = phi i8* [ %16, %if.else ], [ %sc.1.i, %for.inc.i ]
  %17 = load i8* %sc.0.i, align 1, !dbg !1579, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %17}, i64 0, metadata !1580) #5, !dbg !1579
  %sub.i = add i32 %i.0.i, -1, !dbg !1581
  %and.i = and i32 %sub.i, %i.0.i, !dbg !1581
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1581
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !1581

if.then.i:                                        ; preds = %for.cond.i17
  switch i8 %17, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !1582

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !1583, !tbaa !694
  br label %__concretize_string.exit, !dbg !1584

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1585
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !1576) #5, !dbg !1585
  store i8 47, i8* %sc.0.i, align 1, !dbg !1585, !tbaa !694
  br label %for.inc.i, !dbg !1586

if.else7.i:                                       ; preds = %for.cond.i17
  %conv8.i = sext i8 %17 to i64, !dbg !1587
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1587
  %conv10.i18 = trunc i64 %call9.i to i8, !dbg !1587
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i18}, i64 0, metadata !1588) #5, !dbg !1587
  %cmp13.i = icmp eq i8 %conv10.i18, %17, !dbg !1589
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1589
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1589
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1590
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !1576) #5, !dbg !1590
  store i8 %conv10.i18, i8* %sc.0.i, align 1, !dbg !1590, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i18, 0, !dbg !1591
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !1591

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i19 = add i32 %i.0.i, 1, !dbg !1578
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i19}, i64 0, metadata !1577) #5, !dbg !1578
  br label %for.cond.i17, !dbg !1578

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call6 = tail call i64 (i64, ...)* @syscall(i64 90, i8* %path, i32 %mode) #5, !dbg !1568
  %conv = trunc i64 %call6 to i32, !dbg !1568
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !277), !dbg !1568
  %cmp7 = icmp eq i32 %conv, -1, !dbg !1592
  br i1 %cmp7, label %if.then9, label %return, !dbg !1592

if.then9:                                         ; preds = %__concretize_string.exit
  %call10 = tail call i32 @klee_get_errno() #5, !dbg !1594
  %call11 = tail call i32* @__errno_location() #1, !dbg !1594
  store i32 %call10, i32* %call11, align 4, !dbg !1594, !tbaa !752
  br label %return, !dbg !1594

return:                                           ; preds = %if.else.i, %if.then.i23, %__concretize_string.exit, %if.then9, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ -1, %if.then9 ], [ %conv, %__concretize_string.exit ], [ 0, %if.then.i23 ], [ -1, %if.else.i ]
  ret i32 %retval.0, !dbg !1595
}

; Function Attrs: nounwind uwtable
define i32 @fchmod(i32 %fd, i32 %mode) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !284), !dbg !1596
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !285), !dbg !1596
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1597), !dbg !1599
  %0 = icmp ult i32 %fd, 32, !dbg !1600
  br i1 %0, label %if.then.i, label %if.then, !dbg !1600

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1601
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1602
  %1 = load i32* %flags.i, align 4, !dbg !1602, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1602
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1602
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !1602

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1601
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !286), !dbg !1598
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1603
  br i1 %tobool, label %if.then, label %if.end, !dbg !1603

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !1605
  store i32 9, i32* %call1, align 4, !dbg !1605, !tbaa !752
  br label %return, !dbg !1607

if.end:                                           ; preds = %__get_file.exit
  %2 = load i32* @fchmod.n_calls, align 4, !dbg !1608, !tbaa !752
  %inc = add nsw i32 %2, 1, !dbg !1608
  store i32 %inc, i32* @fchmod.n_calls, align 4, !dbg !1608, !tbaa !752
  %3 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1609, !tbaa !1096
  %tobool2 = icmp eq i32 %3, 0, !dbg !1609
  br i1 %tobool2, label %if.end5, label %land.lhs.true, !dbg !1609

land.lhs.true:                                    ; preds = %if.end
  %4 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 12), align 8, !dbg !1609, !tbaa !1611
  %5 = load i32* %4, align 4, !dbg !1609, !tbaa !752
  %cmp = icmp eq i32 %5, %inc, !dbg !1609
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !1609

if.then3:                                         ; preds = %land.lhs.true
  %dec = add i32 %3, -1, !dbg !1612
  store i32 %dec, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1612, !tbaa !1096
  %call4 = tail call i32* @__errno_location() #1, !dbg !1614
  store i32 5, i32* %call4, align 4, !dbg !1614, !tbaa !752
  br label %return, !dbg !1615

if.end5:                                          ; preds = %if.end, %land.lhs.true
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1616
  %6 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1616, !tbaa !788
  %tobool6 = icmp eq %struct.exe_disk_file_t* %6, null, !dbg !1616
  br i1 %tobool6, label %if.else, label %if.then7, !dbg !1616

if.then7:                                         ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %6}, i64 0, metadata !1617) #5, !dbg !1620
  tail call void @llvm.dbg.value(metadata !{i32 %mode}, i64 0, metadata !1621) #5, !dbg !1620
  %call.i = tail call i32 @geteuid() #5, !dbg !1622
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %6, i64 0, i32 2, !dbg !1622
  %7 = load %struct.stat64** %stat.i, align 8, !dbg !1622, !tbaa !711
  %st_uid.i = getelementptr inbounds %struct.stat64* %7, i64 0, i32 4, !dbg !1622
  %8 = load i32* %st_uid.i, align 4, !dbg !1622, !tbaa !1556
  %cmp.i = icmp eq i32 %call.i, %8, !dbg !1622
  br i1 %cmp.i, label %if.then.i23, label %if.else.i, !dbg !1622

if.then.i23:                                      ; preds = %if.then7
  %call1.i = tail call i32 @getgid() #5, !dbg !1623
  %9 = load %struct.stat64** %stat.i, align 8, !dbg !1623, !tbaa !711
  %st_gid.i = getelementptr inbounds %struct.stat64* %9, i64 0, i32 5, !dbg !1623
  %10 = load i32* %st_gid.i, align 4, !dbg !1623, !tbaa !1560
  %cmp3.i = icmp eq i32 %call1.i, %10, !dbg !1623
  %and.i22 = and i32 %mode, 3071, !dbg !1624
  tail call void @llvm.dbg.value(metadata !{i32 %and.i22}, i64 0, metadata !1621) #5, !dbg !1624
  %mode.and.i = select i1 %cmp3.i, i32 %mode, i32 %and.i22, !dbg !1623
  %st_mode.i = getelementptr inbounds %struct.stat64* %9, i64 0, i32 3, !dbg !1625
  %11 = load i32* %st_mode.i, align 4, !dbg !1625, !tbaa !805
  %and6.i = and i32 %11, -4096, !dbg !1625
  %and7.i = and i32 %mode.and.i, 4095, !dbg !1625
  %or.i = or i32 %and7.i, %and6.i, !dbg !1625
  store i32 %or.i, i32* %st_mode.i, align 4, !dbg !1625, !tbaa !805
  br label %return, !dbg !1626

if.else.i:                                        ; preds = %if.then7
  %call10.i = tail call i32* @__errno_location() #1, !dbg !1627
  store i32 1, i32* %call10.i, align 4, !dbg !1627, !tbaa !752
  br label %return, !dbg !1628

if.else:                                          ; preds = %if.end5
  %fd10 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1629
  %12 = load i32* %fd10, align 8, !dbg !1629, !tbaa !855
  %call11 = tail call i64 (i64, ...)* @syscall(i64 91, i32 %12, i32 %mode) #5, !dbg !1629
  %conv = trunc i64 %call11 to i32, !dbg !1629
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !287), !dbg !1629
  %cmp12 = icmp eq i32 %conv, -1, !dbg !1630
  br i1 %cmp12, label %if.then14, label %return, !dbg !1630

if.then14:                                        ; preds = %if.else
  %call15 = tail call i32 @klee_get_errno() #5, !dbg !1632
  %call16 = tail call i32* @__errno_location() #1, !dbg !1632
  store i32 %call15, i32* %call16, align 4, !dbg !1632, !tbaa !752
  br label %return, !dbg !1632

return:                                           ; preds = %if.else.i, %if.then.i23, %if.else, %if.then14, %if.then3, %if.then
  %retval.0 = phi i32 [ -1, %if.then3 ], [ -1, %if.then ], [ -1, %if.then14 ], [ %conv, %if.else ], [ 0, %if.then.i23 ], [ -1, %if.else.i ]
  ret i32 %retval.0, !dbg !1633
}

; Function Attrs: nounwind uwtable
define i32 @chown(i8* %path, i32 %owner, i32 %group) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !296), !dbg !1634
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !297), !dbg !1634
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !298), !dbg !1634
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1635), !dbg !1637
  %0 = load i8* %path, align 1, !dbg !1638, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !1639), !dbg !1638
  %conv.i = sext i8 %0 to i32, !dbg !1640
  %cmp.i = icmp eq i8 %0, 0, !dbg !1640
  br i1 %cmp.i, label %if.else, label %lor.lhs.false.i, !dbg !1640

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !1640
  %1 = load i8* %arrayidx2.i, align 1, !dbg !1640, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !1640
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.else, !dbg !1640

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1641, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !1641
  br i1 %cmp626.i, label %if.else, label %for.body.i, !dbg !1641

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !1641
  br i1 %cmp6.i, label %for.body.i, label %if.else, !dbg !1641

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !1642
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !1642
  %add.i = add nsw i32 %conv10.i, 65, !dbg !1642
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !1642
  %inc.i = add i32 %i.027.i, 1, !dbg !1641
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !1643), !dbg !1641
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !1642

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !1644
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1644, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !1645
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !1645, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !1645
  %5 = load i64* %st_ino.i, align 8, !dbg !1645, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !1645
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !1644
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !1646
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !1645
  br i1 %or.cond, label %if.else, label %if.then, !dbg !1645

if.then:                                          ; preds = %if.then13.i
  tail call void @llvm.dbg.value(metadata !1647, i64 0, metadata !1648) #5, !dbg !1651
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1652) #5, !dbg !1651
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1653) #5, !dbg !1651
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1654
  %call.i = tail call i32* @__errno_location() #1, !dbg !1655
  store i32 1, i32* %call.i, align 4, !dbg !1655, !tbaa !752
  br label %return, !dbg !1649

if.else:                                          ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1656) #5, !dbg !1658
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1659) #5, !dbg !1661
  %6 = ptrtoint i8* %path to i64, !dbg !1662
  %call.i.i = tail call i64 @klee_get_valuel(i64 %6) #5, !dbg !1662
  %7 = inttoptr i64 %call.i.i to i8*, !dbg !1662
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !1663) #5, !dbg !1662
  %cmp.i.i = icmp eq i8* %7, %path, !dbg !1664
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !1664
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !1664
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !1665) #5, !dbg !1660
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1666) #5, !dbg !1667
  br label %for.cond.i13, !dbg !1667

for.cond.i13:                                     ; preds = %for.inc.i, %if.else
  %i.0.i = phi i32 [ 0, %if.else ], [ %inc.i15, %for.inc.i ]
  %sc.0.i = phi i8* [ %7, %if.else ], [ %sc.1.i, %for.inc.i ]
  %8 = load i8* %sc.0.i, align 1, !dbg !1668, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %8}, i64 0, metadata !1669) #5, !dbg !1668
  %sub.i = add i32 %i.0.i, -1, !dbg !1670
  %and.i = and i32 %sub.i, %i.0.i, !dbg !1670
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1670
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !1670

if.then.i:                                        ; preds = %for.cond.i13
  switch i8 %8, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !1671

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !1672, !tbaa !694
  br label %__concretize_string.exit, !dbg !1673

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1674
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !1665) #5, !dbg !1674
  store i8 47, i8* %sc.0.i, align 1, !dbg !1674, !tbaa !694
  br label %for.inc.i, !dbg !1675

if.else7.i:                                       ; preds = %for.cond.i13
  %conv8.i = sext i8 %8 to i64, !dbg !1676
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1676
  %conv10.i14 = trunc i64 %call9.i to i8, !dbg !1676
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i14}, i64 0, metadata !1677) #5, !dbg !1676
  %cmp13.i = icmp eq i8 %conv10.i14, %8, !dbg !1678
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1678
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1678
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1679
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !1665) #5, !dbg !1679
  store i8 %conv10.i14, i8* %sc.0.i, align 1, !dbg !1679, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i14, 0, !dbg !1680
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !1680

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i15 = add i32 %i.0.i, 1, !dbg !1667
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i15}, i64 0, metadata !1666) #5, !dbg !1667
  br label %for.cond.i13, !dbg !1667

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call3 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) #5, !dbg !1657
  %conv = trunc i64 %call3 to i32, !dbg !1657
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !300), !dbg !1657
  %cmp = icmp eq i32 %conv, -1, !dbg !1681
  br i1 %cmp, label %if.then5, label %return, !dbg !1681

if.then5:                                         ; preds = %__concretize_string.exit
  %call6 = tail call i32 @klee_get_errno() #5, !dbg !1683
  %call7 = tail call i32* @__errno_location() #1, !dbg !1683
  store i32 %call6, i32* %call7, align 4, !dbg !1683, !tbaa !752
  br label %return, !dbg !1683

return:                                           ; preds = %__concretize_string.exit, %if.then5, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ -1, %if.then5 ], [ %conv, %__concretize_string.exit ]
  ret i32 %retval.0, !dbg !1684
}

; Function Attrs: nounwind uwtable
define i32 @fchown(i32 %fd, i32 %owner, i32 %group) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !307), !dbg !1685
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !308), !dbg !1685
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !309), !dbg !1685
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1686), !dbg !1688
  %0 = icmp ult i32 %fd, 32, !dbg !1689
  br i1 %0, label %if.then.i, label %if.then, !dbg !1689

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1690
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1691
  %1 = load i32* %flags.i, align 4, !dbg !1691, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1691
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1691
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1690
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1692
  %or.cond = or i1 %tobool.i, %tobool, !dbg !1691
  br i1 %or.cond, label %if.then, label %if.end, !dbg !1691

if.then:                                          ; preds = %entry, %if.then.i
  %call1 = tail call i32* @__errno_location() #1, !dbg !1694
  store i32 9, i32* %call1, align 4, !dbg !1694, !tbaa !752
  br label %return, !dbg !1696

if.end:                                           ; preds = %if.then.i
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1697
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1697, !tbaa !788
  %tobool2 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !1697
  br i1 %tobool2, label %if.else, label %if.then3, !dbg !1697

if.then3:                                         ; preds = %if.end
  tail call void @llvm.dbg.value(metadata !1647, i64 0, metadata !1698) #5, !dbg !1701
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1702) #5, !dbg !1701
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1703) #5, !dbg !1701
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1704
  %call.i = tail call i32* @__errno_location() #1, !dbg !1705
  store i32 1, i32* %call.i, align 4, !dbg !1705, !tbaa !752
  br label %return, !dbg !1699

if.else:                                          ; preds = %if.end
  %call6 = tail call i64 (i64, ...)* @syscall(i64 93, i32 %fd, i32 %owner, i32 %group) #5, !dbg !1706
  %conv = trunc i64 %call6 to i32, !dbg !1706
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !311), !dbg !1706
  %cmp = icmp eq i32 %conv, -1, !dbg !1707
  br i1 %cmp, label %if.then8, label %return, !dbg !1707

if.then8:                                         ; preds = %if.else
  %call9 = tail call i32 @klee_get_errno() #5, !dbg !1709
  %call10 = tail call i32* @__errno_location() #1, !dbg !1709
  store i32 %call9, i32* %call10, align 4, !dbg !1709, !tbaa !752
  br label %return, !dbg !1709

return:                                           ; preds = %if.else, %if.then8, %if.then3, %if.then
  %retval.0 = phi i32 [ -1, %if.then3 ], [ -1, %if.then ], [ -1, %if.then8 ], [ %conv, %if.else ]
  ret i32 %retval.0, !dbg !1710
}

; Function Attrs: nounwind uwtable
define i32 @lchown(i8* %path, i32 %owner, i32 %group) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !316), !dbg !1711
  tail call void @llvm.dbg.value(metadata !{i32 %owner}, i64 0, metadata !317), !dbg !1711
  tail call void @llvm.dbg.value(metadata !{i32 %group}, i64 0, metadata !318), !dbg !1711
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1712), !dbg !1714
  %0 = load i8* %path, align 1, !dbg !1715, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !1716), !dbg !1715
  %conv.i = sext i8 %0 to i32, !dbg !1717
  %cmp.i = icmp eq i8 %0, 0, !dbg !1717
  br i1 %cmp.i, label %if.else, label %lor.lhs.false.i, !dbg !1717

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !1717
  %1 = load i8* %arrayidx2.i, align 1, !dbg !1717, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !1717
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.else, !dbg !1717

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1718, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !1718
  br i1 %cmp626.i, label %if.else, label %for.body.i, !dbg !1718

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !1718
  br i1 %cmp6.i, label %for.body.i, label %if.else, !dbg !1718

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !1719
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !1719
  %add.i = add nsw i32 %conv10.i, 65, !dbg !1719
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !1719
  %inc.i = add i32 %i.027.i, 1, !dbg !1718
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !1720), !dbg !1718
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !1719

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !1721
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1721, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !1722
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !1722, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !1722
  %5 = load i64* %st_ino.i, align 8, !dbg !1722, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !1722
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !1721
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !1723
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !1722
  br i1 %or.cond, label %if.else, label %if.then, !dbg !1722

if.then:                                          ; preds = %if.then13.i
  tail call void @llvm.dbg.value(metadata !1647, i64 0, metadata !1724) #5, !dbg !1727
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1728) #5, !dbg !1727
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1729) #5, !dbg !1727
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str24, i64 0, i64 0)) #5, !dbg !1730
  %call.i = tail call i32* @__errno_location() #1, !dbg !1731
  store i32 1, i32* %call.i, align 4, !dbg !1731, !tbaa !752
  br label %return, !dbg !1725

if.else:                                          ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1732) #5, !dbg !1734
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !1735) #5, !dbg !1737
  %6 = ptrtoint i8* %path to i64, !dbg !1738
  %call.i.i = tail call i64 @klee_get_valuel(i64 %6) #5, !dbg !1738
  %7 = inttoptr i64 %call.i.i to i8*, !dbg !1738
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !1739) #5, !dbg !1738
  %cmp.i.i = icmp eq i8* %7, %path, !dbg !1740
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !1740
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !1740
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !1741) #5, !dbg !1736
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !1742) #5, !dbg !1743
  br label %for.cond.i13, !dbg !1743

for.cond.i13:                                     ; preds = %for.inc.i, %if.else
  %i.0.i = phi i32 [ 0, %if.else ], [ %inc.i15, %for.inc.i ]
  %sc.0.i = phi i8* [ %7, %if.else ], [ %sc.1.i, %for.inc.i ]
  %8 = load i8* %sc.0.i, align 1, !dbg !1744, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %8}, i64 0, metadata !1745) #5, !dbg !1744
  %sub.i = add i32 %i.0.i, -1, !dbg !1746
  %and.i = and i32 %sub.i, %i.0.i, !dbg !1746
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1746
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !1746

if.then.i:                                        ; preds = %for.cond.i13
  switch i8 %8, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !1747

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !1748, !tbaa !694
  br label %__concretize_string.exit, !dbg !1749

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1750
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !1741) #5, !dbg !1750
  store i8 47, i8* %sc.0.i, align 1, !dbg !1750, !tbaa !694
  br label %for.inc.i, !dbg !1751

if.else7.i:                                       ; preds = %for.cond.i13
  %conv8.i = sext i8 %8 to i64, !dbg !1752
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !1752
  %conv10.i14 = trunc i64 %call9.i to i8, !dbg !1752
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i14}, i64 0, metadata !1753) #5, !dbg !1752
  %cmp13.i = icmp eq i8 %conv10.i14, %8, !dbg !1754
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !1754
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !1754
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !1755
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !1741) #5, !dbg !1755
  store i8 %conv10.i14, i8* %sc.0.i, align 1, !dbg !1755, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i14, 0, !dbg !1756
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !1756

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i15 = add i32 %i.0.i, 1, !dbg !1743
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i15}, i64 0, metadata !1742) #5, !dbg !1743
  br label %for.cond.i13, !dbg !1743

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call3 = tail call i64 (i64, ...)* @syscall(i64 92, i8* %path, i32 %owner, i32 %group) #5, !dbg !1733
  %conv = trunc i64 %call3 to i32, !dbg !1733
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !320), !dbg !1733
  %cmp = icmp eq i32 %conv, -1, !dbg !1757
  br i1 %cmp, label %if.then5, label %return, !dbg !1757

if.then5:                                         ; preds = %__concretize_string.exit
  %call6 = tail call i32 @klee_get_errno() #5, !dbg !1759
  %call7 = tail call i32* @__errno_location() #1, !dbg !1759
  store i32 %call6, i32* %call7, align 4, !dbg !1759, !tbaa !752
  br label %return, !dbg !1759

return:                                           ; preds = %__concretize_string.exit, %if.then5, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ -1, %if.then5 ], [ %conv, %__concretize_string.exit ]
  ret i32 %retval.0, !dbg !1760
}

; Function Attrs: nounwind uwtable
define i32 @__fd_fstat(i32 %fd, %struct.stat64* %buf) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !327), !dbg !1761
  tail call void @llvm.dbg.value(metadata !{%struct.stat64* %buf}, i64 0, metadata !328), !dbg !1761
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1762), !dbg !1764
  %0 = icmp ult i32 %fd, 32, !dbg !1765
  br i1 %0, label %if.then.i, label %if.then, !dbg !1765

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1766
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1767
  %1 = load i32* %flags.i, align 4, !dbg !1767, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1767
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1767
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !1767

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1766
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !329), !dbg !1763
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1768
  br i1 %tobool, label %if.then, label %if.end, !dbg !1768

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !1770
  store i32 9, i32* %call1, align 4, !dbg !1770, !tbaa !752
  br label %return, !dbg !1772

if.end:                                           ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1773
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1773, !tbaa !788
  %tobool2 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !1773
  br i1 %tobool2, label %if.then3, label %if.end11, !dbg !1773

if.then3:                                         ; preds = %if.end
  %fd4 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1774
  %3 = load i32* %fd4, align 8, !dbg !1774, !tbaa !855
  %call5 = tail call i64 (i64, ...)* @syscall(i64 5, i32 %3, %struct.stat64* %buf) #5, !dbg !1774
  %conv = trunc i64 %call5 to i32, !dbg !1774
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !330), !dbg !1774
  %cmp = icmp eq i32 %conv, -1, !dbg !1775
  br i1 %cmp, label %if.then7, label %return, !dbg !1775

if.then7:                                         ; preds = %if.then3
  %call8 = tail call i32 @klee_get_errno() #5, !dbg !1777
  %call9 = tail call i32* @__errno_location() #1, !dbg !1777
  store i32 %call8, i32* %call9, align 4, !dbg !1777, !tbaa !752
  br label %return, !dbg !1777

if.end11:                                         ; preds = %if.end
  %4 = bitcast %struct.stat64* %buf to i8*, !dbg !1778
  %stat = getelementptr inbounds %struct.exe_disk_file_t* %2, i64 0, i32 2, !dbg !1778
  %5 = load %struct.stat64** %stat, align 8, !dbg !1778, !tbaa !711
  %6 = bitcast %struct.stat64* %5 to i8*, !dbg !1778
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %6, i64 144, i32 8, i1 false), !dbg !1778
  br label %return, !dbg !1779

return:                                           ; preds = %if.then3, %if.then7, %if.end11, %if.then
  %retval.0 = phi i32 [ 0, %if.end11 ], [ -1, %if.then ], [ -1, %if.then7 ], [ %conv, %if.then3 ]
  ret i32 %retval.0, !dbg !1780
}

; Function Attrs: nounwind uwtable
define i32 @__fd_ftruncate(i32 %fd, i64 %length) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !337), !dbg !1781
  tail call void @llvm.dbg.value(metadata !{i64 %length}, i64 0, metadata !338), !dbg !1781
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1782), !dbg !1784
  %0 = icmp ult i32 %fd, 32, !dbg !1785
  br i1 %0, label %if.then.i, label %__get_file.exit.thread, !dbg !1785

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1786
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1787
  %1 = load i32* %flags.i, align 4, !dbg !1787, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1787
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1787
  br i1 %tobool.i, label %__get_file.exit.thread, label %__get_file.exit, !dbg !1787

__get_file.exit.thread:                           ; preds = %if.then.i, %entry
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !339), !dbg !1783
  %2 = load i32* @__fd_ftruncate.n_calls, align 4, !dbg !1788, !tbaa !752
  %inc20 = add nsw i32 %2, 1, !dbg !1788
  store i32 %inc20, i32* @__fd_ftruncate.n_calls, align 4, !dbg !1788, !tbaa !752
  br label %if.then, !dbg !1789

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1786
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !339), !dbg !1783
  %3 = load i32* @__fd_ftruncate.n_calls, align 4, !dbg !1788, !tbaa !752
  %inc = add nsw i32 %3, 1, !dbg !1788
  store i32 %inc, i32* @__fd_ftruncate.n_calls, align 4, !dbg !1788, !tbaa !752
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1789
  br i1 %tobool, label %if.then, label %if.end, !dbg !1789

if.then:                                          ; preds = %__get_file.exit.thread, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !1791
  store i32 9, i32* %call1, align 4, !dbg !1791, !tbaa !752
  br label %return, !dbg !1793

if.end:                                           ; preds = %__get_file.exit
  %4 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1794, !tbaa !1096
  %tobool2 = icmp eq i32 %4, 0, !dbg !1794
  br i1 %tobool2, label %if.end5, label %land.lhs.true, !dbg !1794

land.lhs.true:                                    ; preds = %if.end
  %5 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !1794, !tbaa !1796
  %6 = load i32* %5, align 4, !dbg !1794, !tbaa !752
  %cmp = icmp eq i32 %6, %inc, !dbg !1794
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !1794

if.then3:                                         ; preds = %land.lhs.true
  %dec = add i32 %4, -1, !dbg !1797
  store i32 %dec, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !1797, !tbaa !1096
  %call4 = tail call i32* @__errno_location() #1, !dbg !1799
  store i32 5, i32* %call4, align 4, !dbg !1799, !tbaa !752
  br label %return, !dbg !1800

if.end5:                                          ; preds = %if.end, %land.lhs.true
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1801
  %7 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1801, !tbaa !788
  %tobool6 = icmp eq %struct.exe_disk_file_t* %7, null, !dbg !1801
  br i1 %tobool6, label %if.else, label %if.then7, !dbg !1801

if.then7:                                         ; preds = %if.end5
  tail call void @klee_warning(i8* getelementptr inbounds ([30 x i8]* @.str10, i64 0, i64 0)) #5, !dbg !1802
  %call8 = tail call i32* @__errno_location() #1, !dbg !1804
  store i32 5, i32* %call8, align 4, !dbg !1804, !tbaa !752
  br label %return, !dbg !1805

if.else:                                          ; preds = %if.end5
  %fd9 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1806
  %8 = load i32* %fd9, align 8, !dbg !1806, !tbaa !855
  %call10 = tail call i64 (i64, ...)* @syscall(i64 77, i32 %8, i64 %length) #5, !dbg !1806
  %conv = trunc i64 %call10 to i32, !dbg !1806
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !340), !dbg !1806
  %cmp11 = icmp eq i32 %conv, -1, !dbg !1807
  br i1 %cmp11, label %if.then13, label %return, !dbg !1807

if.then13:                                        ; preds = %if.else
  %call14 = tail call i32 @klee_get_errno() #5, !dbg !1809
  %call15 = tail call i32* @__errno_location() #1, !dbg !1809
  store i32 %call14, i32* %call15, align 4, !dbg !1809, !tbaa !752
  br label %return, !dbg !1809

return:                                           ; preds = %if.else, %if.then13, %if.then7, %if.then3, %if.then
  %retval.0 = phi i32 [ -1, %if.then3 ], [ -1, %if.then7 ], [ -1, %if.then ], [ -1, %if.then13 ], [ %conv, %if.else ]
  ret i32 %retval.0, !dbg !1810
}

; Function Attrs: nounwind uwtable
define i32 @__fd_getdents(i32 %fd, %struct.dirent64* %dirp, i32 %count) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !361), !dbg !1811
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %dirp}, i64 0, metadata !362), !dbg !1811
  tail call void @llvm.dbg.value(metadata !{i32 %count}, i64 0, metadata !363), !dbg !1811
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1812), !dbg !1814
  %0 = icmp ult i32 %fd, 32, !dbg !1815
  br i1 %0, label %if.then.i, label %if.then, !dbg !1815

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1816
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1817
  %1 = load i32* %flags.i, align 4, !dbg !1817, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1817
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1817
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !1817

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1816
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !364), !dbg !1813
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1818
  br i1 %tobool, label %if.then, label %if.end, !dbg !1818

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !1820
  store i32 9, i32* %call1, align 4, !dbg !1820, !tbaa !752
  br label %return, !dbg !1822

if.end:                                           ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1823
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1823, !tbaa !788
  %tobool2 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !1823
  br i1 %tobool2, label %if.else, label %if.then3, !dbg !1823

if.then3:                                         ; preds = %if.end
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !1824
  %call4 = tail call i32* @__errno_location() #1, !dbg !1826
  store i32 22, i32* %call4, align 4, !dbg !1826, !tbaa !752
  br label %return, !dbg !1827

if.else:                                          ; preds = %if.end
  %off = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1828
  %3 = load i64* %off, align 8, !dbg !1828, !tbaa !1150
  %cmp = icmp ult i64 %3, 4096, !dbg !1828
  br i1 %cmp, label %if.then5, label %if.else43, !dbg !1828

if.then5:                                         ; preds = %if.else
  tail call void @llvm.dbg.value(metadata !1222, i64 0, metadata !371), !dbg !1829
  %div = udiv i64 %3, 280, !dbg !1830
  tail call void @llvm.dbg.value(metadata !{i64 %div}, i64 0, metadata !365), !dbg !1830
  %mul = mul i64 %div, 280, !dbg !1831
  %cmp8 = icmp eq i64 %mul, %3, !dbg !1831
  br i1 %cmp8, label %lor.lhs.false, label %if.then11, !dbg !1831

lor.lhs.false:                                    ; preds = %if.then5
  %4 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1831, !tbaa !701
  %conv = zext i32 %4 to i64, !dbg !1831
  %cmp9 = icmp ugt i64 %div, %conv, !dbg !1831
  br i1 %cmp9, label %if.then11, label %for.cond.preheader, !dbg !1831

for.cond.preheader:                               ; preds = %lor.lhs.false
  %cmp15123 = icmp ult i64 %div, %conv, !dbg !1833
  br i1 %cmp15123, label %for.body, label %for.end, !dbg !1833

if.then11:                                        ; preds = %if.then5, %lor.lhs.false
  %call12 = tail call i32* @__errno_location() #1, !dbg !1834
  store i32 22, i32* %call12, align 4, !dbg !1834, !tbaa !752
  br label %return, !dbg !1836

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %dirp.addr.0126 = phi %struct.dirent64* [ %incdec.ptr, %for.body ], [ %dirp, %for.cond.preheader ]
  %i.0125 = phi i64 [ %add23, %for.body ], [ %div, %for.cond.preheader ]
  %bytes.0124 = phi i64 [ %add27, %for.body ], [ 0, %for.cond.preheader ]
  %5 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !1837, !tbaa !708
  %stat = getelementptr inbounds %struct.exe_disk_file_t* %5, i64 %i.0125, i32 2, !dbg !1838
  %6 = load %struct.stat64** %stat, align 8, !dbg !1838, !tbaa !711
  %st_ino = getelementptr inbounds %struct.stat64* %6, i64 0, i32 1, !dbg !1838
  %7 = load i64* %st_ino, align 8, !dbg !1838, !tbaa !713
  %d_ino = getelementptr inbounds %struct.dirent64* %dirp.addr.0126, i64 0, i32 0, !dbg !1838
  store i64 %7, i64* %d_ino, align 8, !dbg !1838, !tbaa !1839
  %d_reclen = getelementptr inbounds %struct.dirent64* %dirp.addr.0126, i64 0, i32 2, !dbg !1842
  store i16 280, i16* %d_reclen, align 2, !dbg !1842, !tbaa !1843
  %st_mode = getelementptr inbounds %struct.stat64* %6, i64 0, i32 3, !dbg !1844
  %8 = load i32* %st_mode, align 4, !dbg !1844, !tbaa !805
  %and = lshr i32 %8, 12, !dbg !1844
  %and.tr = trunc i32 %and to i8, !dbg !1844
  %conv18 = and i8 %and.tr, 15, !dbg !1844
  %d_type = getelementptr inbounds %struct.dirent64* %dirp.addr.0126, i64 0, i32 3, !dbg !1844
  store i8 %conv18, i8* %d_type, align 1, !dbg !1844, !tbaa !1845
  %add = add nsw i64 %i.0125, 65, !dbg !1846
  %conv19 = trunc i64 %add to i8, !dbg !1846
  %arrayidx20 = getelementptr inbounds %struct.dirent64* %dirp.addr.0126, i64 0, i32 4, i64 0, !dbg !1846
  store i8 %conv19, i8* %arrayidx20, align 1, !dbg !1846, !tbaa !694
  %arrayidx22 = getelementptr inbounds %struct.dirent64* %dirp.addr.0126, i64 0, i32 4, i64 1, !dbg !1847
  store i8 0, i8* %arrayidx22, align 1, !dbg !1847, !tbaa !694
  %add23 = add nsw i64 %i.0125, 1, !dbg !1848
  %mul24 = mul i64 %add23, 280, !dbg !1848
  %d_off = getelementptr inbounds %struct.dirent64* %dirp.addr.0126, i64 0, i32 1, !dbg !1848
  store i64 %mul24, i64* %d_off, align 8, !dbg !1848, !tbaa !1849
  %add27 = add nsw i64 %bytes.0124, 280, !dbg !1850
  tail call void @llvm.dbg.value(metadata !{i64 %add27}, i64 0, metadata !371), !dbg !1850
  %incdec.ptr = getelementptr inbounds %struct.dirent64* %dirp.addr.0126, i64 1, !dbg !1851
  tail call void @llvm.dbg.value(metadata !{%struct.dirent64* %incdec.ptr}, i64 0, metadata !362), !dbg !1851
  tail call void @llvm.dbg.value(metadata !{i64 %add23}, i64 0, metadata !365), !dbg !1833
  %9 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !1833, !tbaa !701
  %conv14 = zext i32 %9 to i64, !dbg !1833
  %cmp15 = icmp slt i64 %add23, %conv14, !dbg !1833
  br i1 %cmp15, label %for.body, label %for.end, !dbg !1833

for.end:                                          ; preds = %for.body, %for.cond.preheader
  %dirp.addr.0.lcssa = phi %struct.dirent64* [ %dirp, %for.cond.preheader ], [ %incdec.ptr, %for.body ]
  %bytes.0.lcssa = phi i64 [ 0, %for.cond.preheader ], [ %add27, %for.body ]
  %cmp28 = icmp ult i32 %count, 4096, !dbg !1852
  %10 = zext i32 %count to i64, !dbg !1852
  %conv30 = select i1 %cmp28, i64 %10, i64 4096, !dbg !1852
  tail call void @llvm.dbg.value(metadata !{i64 %conv30}, i64 0, metadata !370), !dbg !1852
  %d_ino31 = getelementptr inbounds %struct.dirent64* %dirp.addr.0.lcssa, i64 0, i32 0, !dbg !1853
  store i64 0, i64* %d_ino31, align 8, !dbg !1853, !tbaa !1839
  %sub = sub nsw i64 %conv30, %bytes.0.lcssa, !dbg !1854
  %conv32 = trunc i64 %sub to i16, !dbg !1854
  %d_reclen33 = getelementptr inbounds %struct.dirent64* %dirp.addr.0.lcssa, i64 0, i32 2, !dbg !1854
  store i16 %conv32, i16* %d_reclen33, align 2, !dbg !1854, !tbaa !1843
  %d_type34 = getelementptr inbounds %struct.dirent64* %dirp.addr.0.lcssa, i64 0, i32 3, !dbg !1855
  store i8 0, i8* %d_type34, align 1, !dbg !1855, !tbaa !1845
  %arrayidx36 = getelementptr inbounds %struct.dirent64* %dirp.addr.0.lcssa, i64 0, i32 4, i64 0, !dbg !1856
  store i8 0, i8* %arrayidx36, align 1, !dbg !1856, !tbaa !694
  %d_off37 = getelementptr inbounds %struct.dirent64* %dirp.addr.0.lcssa, i64 0, i32 1, !dbg !1857
  store i64 4096, i64* %d_off37, align 8, !dbg !1857, !tbaa !1849
  %conv39 = and i64 %sub, 65535, !dbg !1858
  %add40 = add nsw i64 %conv39, %bytes.0.lcssa, !dbg !1858
  tail call void @llvm.dbg.value(metadata !{i64 %add40}, i64 0, metadata !371), !dbg !1858
  store i64 %conv30, i64* %off, align 8, !dbg !1859, !tbaa !1150
  %conv42 = trunc i64 %add40 to i32, !dbg !1860
  br label %return, !dbg !1860

if.else43:                                        ; preds = %if.else
  %sub45 = add nsw i64 %3, -4096, !dbg !1861
  tail call void @llvm.dbg.value(metadata !{i64 %sub45}, i64 0, metadata !375), !dbg !1861
  tail call void @llvm.dbg.value(metadata !1222, i64 0, metadata !378), !dbg !1862
  %11 = bitcast %struct.dirent64* %dirp to i8*, !dbg !1863
  %conv46 = zext i32 %count to i64, !dbg !1863
  tail call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 %conv46, i32 8, i1 false), !dbg !1863
  %fd47 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !1864
  %12 = load i32* %fd47, align 8, !dbg !1864, !tbaa !855
  %call48 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %12, i64 %sub45, i32 0) #5, !dbg !1864
  tail call void @llvm.dbg.value(metadata !{i64 %call48}, i64 0, metadata !378), !dbg !1864
  %cmp49 = icmp eq i64 %call48, -1, !dbg !1865
  br i1 %cmp49, label %cond.false52, label %cond.end53, !dbg !1865

cond.false52:                                     ; preds = %if.else43
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str4, i64 0, i64 0), i32 875, i8* getelementptr inbounds ([65 x i8]* @__PRETTY_FUNCTION__.__fd_getdents, i64 0, i64 0)) #8, !dbg !1865
  unreachable, !dbg !1865

cond.end53:                                       ; preds = %if.else43
  %13 = load i32* %fd47, align 8, !dbg !1866, !tbaa !855
  %call55 = tail call i64 (i64, ...)* @syscall(i64 217, i32 %13, %struct.dirent64* %dirp, i32 %count) #5, !dbg !1866
  %conv56 = trunc i64 %call55 to i32, !dbg !1866
  tail call void @llvm.dbg.value(metadata !{i32 %conv56}, i64 0, metadata !377), !dbg !1866
  %cmp57 = icmp eq i32 %conv56, -1, !dbg !1867
  br i1 %cmp57, label %if.then59, label %if.else62, !dbg !1867

if.then59:                                        ; preds = %cond.end53
  %call60 = tail call i32 @klee_get_errno() #5, !dbg !1868
  %call61 = tail call i32* @__errno_location() #1, !dbg !1868
  store i32 %call60, i32* %call61, align 4, !dbg !1868, !tbaa !752
  br label %return, !dbg !1870

if.else62:                                        ; preds = %cond.end53
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !379), !dbg !1871
  %14 = load i32* %fd47, align 8, !dbg !1872, !tbaa !855
  %call64 = tail call i64 (i64, ...)* @syscall(i64 8, i32 %14, i32 0, i32 1) #5, !dbg !1872
  %add65 = add nsw i64 %call64, 4096, !dbg !1872
  store i64 %add65, i64* %off, align 8, !dbg !1872, !tbaa !1150
  %cmp67128 = icmp sgt i32 %conv56, 0, !dbg !1873
  br i1 %cmp67128, label %while.body, label %return, !dbg !1873

while.body:                                       ; preds = %if.else62, %while.body
  %pos.0129 = phi i32 [ %add73, %while.body ], [ 0, %if.else62 ]
  %idx.ext = sext i32 %pos.0129 to i64, !dbg !1874
  %add.ptr.sum = add i64 %idx.ext, 8, !dbg !1875
  %d_off69 = getelementptr inbounds i8* %11, i64 %add.ptr.sum, !dbg !1875
  %15 = bitcast i8* %d_off69 to i64*, !dbg !1875
  %16 = load i64* %15, align 8, !dbg !1875, !tbaa !1849
  %add70 = add nsw i64 %16, 4096, !dbg !1875
  store i64 %add70, i64* %15, align 8, !dbg !1875, !tbaa !1849
  %add.ptr.sum120 = add i64 %idx.ext, 16, !dbg !1876
  %d_reclen71 = getelementptr inbounds i8* %11, i64 %add.ptr.sum120, !dbg !1876
  %17 = bitcast i8* %d_reclen71 to i16*, !dbg !1876
  %18 = load i16* %17, align 2, !dbg !1876, !tbaa !1843
  %conv72 = zext i16 %18 to i32, !dbg !1876
  %add73 = add nsw i32 %conv72, %pos.0129, !dbg !1876
  tail call void @llvm.dbg.value(metadata !{i32 %add73}, i64 0, metadata !379), !dbg !1876
  %cmp67 = icmp slt i32 %add73, %conv56, !dbg !1873
  br i1 %cmp67, label %while.body, label %return, !dbg !1873

return:                                           ; preds = %while.body, %if.else62, %if.then59, %for.end, %if.then11, %if.then3, %if.then
  %retval.0 = phi i32 [ -1, %if.then3 ], [ -1, %if.then11 ], [ %conv42, %for.end ], [ -1, %if.then ], [ -1, %if.then59 ], [ %conv56, %if.else62 ], [ %conv56, %while.body ]
  ret i32 %retval.0, !dbg !1877
}

; Function Attrs: nounwind uwtable
define i32 @ioctl(i32 %fd, i64 %request, ...) #0 {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !388), !dbg !1878
  call void @llvm.dbg.value(metadata !{i64 %request}, i64 0, metadata !389), !dbg !1878
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !1879), !dbg !1881
  %0 = icmp ult i32 %fd, 32, !dbg !1882
  br i1 %0, label %if.then.i, label %if.then, !dbg !1882

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !1883
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !1884
  %1 = load i32* %flags.i, align 4, !dbg !1884, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !1884
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !1884
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !1884

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !1883
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !390), !dbg !1880
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !391), !dbg !1885
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !1886
  br i1 %tobool, label %if.then, label %if.end, !dbg !1886

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = call i32* @__errno_location() #1, !dbg !1888
  store i32 9, i32* %call1, align 4, !dbg !1888, !tbaa !752
  br label %return, !dbg !1890

if.end:                                           ; preds = %__get_file.exit
  %arraydecay2 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !1891
  call void @llvm.va_start(i8* %arraydecay2), !dbg !1891
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !1892
  %gp_offset = load i32* %gp_offset_p, align 16, !dbg !1892
  %fits_in_gp = icmp ult i32 %gp_offset, 41, !dbg !1892
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !1892

vaarg.in_reg:                                     ; preds = %if.end
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !1892
  %reg_save_area = load i8** %2, align 16, !dbg !1892
  %3 = sext i32 %gp_offset to i64, !dbg !1892
  %4 = getelementptr i8* %reg_save_area, i64 %3, !dbg !1892
  %5 = add i32 %gp_offset, 8, !dbg !1892
  store i32 %5, i32* %gp_offset_p, align 16, !dbg !1892
  br label %vaarg.end, !dbg !1892

vaarg.in_mem:                                     ; preds = %if.end
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !1892
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8, !dbg !1892
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8, !dbg !1892
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8, !dbg !1892
  br label %vaarg.end, !dbg !1892

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %4, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i8**, !dbg !1892
  %6 = load i8** %vaarg.addr, align 8, !dbg !1892
  call void @llvm.dbg.value(metadata !{i8* %6}, i64 0, metadata !405), !dbg !1892
  call void @llvm.va_end(i8* %arraydecay2), !dbg !1893
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !1894
  %7 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1894, !tbaa !788
  %tobool6 = icmp eq %struct.exe_disk_file_t* %7, null, !dbg !1894
  br i1 %tobool6, label %if.else103, label %if.then7, !dbg !1894

if.then7:                                         ; preds = %vaarg.end
  %stat9 = getelementptr inbounds %struct.exe_disk_file_t* %7, i64 0, i32 2, !dbg !1895
  %8 = load %struct.stat64** %stat9, align 8, !dbg !1895, !tbaa !711
  switch i64 %request, label %sw.default [
    i64 21505, label %sw.bb
    i64 21506, label %sw.bb48
    i64 21507, label %sw.bb55
    i64 21508, label %sw.bb60
    i64 21523, label %sw.bb67
    i64 21524, label %sw.bb74
    i64 21531, label %sw.bb82
    i64 2150657282, label %sw.bb100
  ], !dbg !1896

sw.bb:                                            ; preds = %if.then7
  call void @klee_warning_once(i8* getelementptr inbounds ([41 x i8]* @.str13, i64 0, i64 0)) #5, !dbg !1897
  %9 = getelementptr inbounds %struct.stat64* %8, i64 0, i32 3, !dbg !1898
  %10 = load i32* %9, align 4, !dbg !1898, !tbaa !1900
  %and = and i32 %10, 61440, !dbg !1898
  %cmp = icmp eq i32 %and, 8192, !dbg !1898
  br i1 %cmp, label %if.then10, label %if.else, !dbg !1898

if.then10:                                        ; preds = %sw.bb
  %c_iflag = bitcast i8* %6 to i32*, !dbg !1902
  store i32 27906, i32* %c_iflag, align 4, !dbg !1902, !tbaa !1904
  %c_oflag = getelementptr inbounds i8* %6, i64 4, !dbg !1906
  %11 = bitcast i8* %c_oflag to i32*, !dbg !1906
  store i32 5, i32* %11, align 4, !dbg !1906, !tbaa !1907
  %c_cflag = getelementptr inbounds i8* %6, i64 8, !dbg !1908
  %12 = bitcast i8* %c_cflag to i32*, !dbg !1908
  store i32 1215, i32* %12, align 4, !dbg !1908, !tbaa !1909
  %c_lflag = getelementptr inbounds i8* %6, i64 12, !dbg !1910
  %13 = bitcast i8* %c_lflag to i32*, !dbg !1910
  store i32 35287, i32* %13, align 4, !dbg !1910, !tbaa !1911
  %14 = getelementptr inbounds i8* %6, i64 16, !dbg !1912
  store i8 0, i8* %14, align 1, !dbg !1912, !tbaa !1913
  %c_cc = getelementptr inbounds i8* %6, i64 17, !dbg !1914
  store i8 3, i8* %c_cc, align 1, !dbg !1914, !tbaa !694
  %arrayidx12 = getelementptr inbounds i8* %6, i64 18, !dbg !1915
  store i8 28, i8* %arrayidx12, align 1, !dbg !1915, !tbaa !694
  %arrayidx14 = getelementptr inbounds i8* %6, i64 19, !dbg !1916
  store i8 127, i8* %arrayidx14, align 1, !dbg !1916, !tbaa !694
  %arrayidx16 = getelementptr inbounds i8* %6, i64 20, !dbg !1917
  store i8 21, i8* %arrayidx16, align 1, !dbg !1917, !tbaa !694
  %arrayidx18 = getelementptr inbounds i8* %6, i64 21, !dbg !1918
  store i8 4, i8* %arrayidx18, align 1, !dbg !1918, !tbaa !694
  %arrayidx20 = getelementptr inbounds i8* %6, i64 22, !dbg !1919
  store i8 0, i8* %arrayidx20, align 1, !dbg !1919, !tbaa !694
  %arrayidx22 = getelementptr inbounds i8* %6, i64 23, !dbg !1920
  store i8 1, i8* %arrayidx22, align 1, !dbg !1920, !tbaa !694
  %arrayidx24 = getelementptr inbounds i8* %6, i64 24, !dbg !1921
  store i8 -1, i8* %arrayidx24, align 1, !dbg !1921, !tbaa !694
  %arrayidx26 = getelementptr inbounds i8* %6, i64 25, !dbg !1922
  store i8 17, i8* %arrayidx26, align 1, !dbg !1922, !tbaa !694
  %arrayidx28 = getelementptr inbounds i8* %6, i64 26, !dbg !1923
  store i8 19, i8* %arrayidx28, align 1, !dbg !1923, !tbaa !694
  %arrayidx30 = getelementptr inbounds i8* %6, i64 27, !dbg !1924
  store i8 26, i8* %arrayidx30, align 1, !dbg !1924, !tbaa !694
  %arrayidx32 = getelementptr inbounds i8* %6, i64 28, !dbg !1925
  store i8 -1, i8* %arrayidx32, align 1, !dbg !1925, !tbaa !694
  %arrayidx34 = getelementptr inbounds i8* %6, i64 29, !dbg !1926
  store i8 18, i8* %arrayidx34, align 1, !dbg !1926, !tbaa !694
  %arrayidx36 = getelementptr inbounds i8* %6, i64 30, !dbg !1927
  store i8 15, i8* %arrayidx36, align 1, !dbg !1927, !tbaa !694
  %arrayidx38 = getelementptr inbounds i8* %6, i64 31, !dbg !1928
  store i8 23, i8* %arrayidx38, align 1, !dbg !1928, !tbaa !694
  %arrayidx40 = getelementptr inbounds i8* %6, i64 32, !dbg !1929
  store i8 22, i8* %arrayidx40, align 1, !dbg !1929, !tbaa !694
  %arrayidx42 = getelementptr inbounds i8* %6, i64 33, !dbg !1930
  store i8 -1, i8* %arrayidx42, align 1, !dbg !1930, !tbaa !694
  %arrayidx44 = getelementptr inbounds i8* %6, i64 34, !dbg !1931
  store i8 0, i8* %arrayidx44, align 1, !dbg !1931, !tbaa !694
  %arrayidx46 = getelementptr inbounds i8* %6, i64 35, !dbg !1932
  store i8 0, i8* %arrayidx46, align 1, !dbg !1932, !tbaa !694
  br label %return, !dbg !1933

if.else:                                          ; preds = %sw.bb
  %call47 = call i32* @__errno_location() #1, !dbg !1934
  store i32 25, i32* %call47, align 4, !dbg !1934, !tbaa !752
  br label %return, !dbg !1936

sw.bb48:                                          ; preds = %if.then7
  call void @klee_warning_once(i8* getelementptr inbounds ([42 x i8]* @.str14, i64 0, i64 0)) #5, !dbg !1937
  %15 = getelementptr inbounds %struct.stat64* %8, i64 0, i32 3, !dbg !1939
  %16 = load i32* %15, align 4, !dbg !1939, !tbaa !1900
  %and50 = and i32 %16, 61440, !dbg !1939
  %cmp51 = icmp eq i32 %and50, 8192, !dbg !1939
  br i1 %cmp51, label %return, label %if.else53, !dbg !1939

if.else53:                                        ; preds = %sw.bb48
  %call54 = call i32* @__errno_location() #1, !dbg !1941
  store i32 25, i32* %call54, align 4, !dbg !1941, !tbaa !752
  br label %return, !dbg !1943

sw.bb55:                                          ; preds = %if.then7
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str15, i64 0, i64 0)) #5, !dbg !1944
  %cmp56 = icmp eq i32 %fd, 0, !dbg !1946
  br i1 %cmp56, label %return, label %if.else58, !dbg !1946

if.else58:                                        ; preds = %sw.bb55
  %call59 = call i32* @__errno_location() #1, !dbg !1948
  store i32 25, i32* %call59, align 4, !dbg !1948, !tbaa !752
  br label %return, !dbg !1950

sw.bb60:                                          ; preds = %if.then7
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str16, i64 0, i64 0)) #5, !dbg !1951
  %17 = getelementptr inbounds %struct.stat64* %8, i64 0, i32 3, !dbg !1953
  %18 = load i32* %17, align 4, !dbg !1953, !tbaa !1900
  %and62 = and i32 %18, 61440, !dbg !1953
  %cmp63 = icmp eq i32 %and62, 8192, !dbg !1953
  br i1 %cmp63, label %return, label %if.else65, !dbg !1953

if.else65:                                        ; preds = %sw.bb60
  %call66 = call i32* @__errno_location() #1, !dbg !1955
  store i32 25, i32* %call66, align 4, !dbg !1955, !tbaa !752
  br label %return, !dbg !1957

sw.bb67:                                          ; preds = %if.then7
  %ws_row = bitcast i8* %6 to i16*, !dbg !1958
  store i16 24, i16* %ws_row, align 2, !dbg !1958, !tbaa !1959
  %ws_col = getelementptr inbounds i8* %6, i64 2, !dbg !1961
  %19 = bitcast i8* %ws_col to i16*, !dbg !1961
  store i16 80, i16* %19, align 2, !dbg !1961, !tbaa !1962
  call void @klee_warning_once(i8* getelementptr inbounds ([45 x i8]* @.str17, i64 0, i64 0)) #5, !dbg !1963
  %20 = getelementptr inbounds %struct.stat64* %8, i64 0, i32 3, !dbg !1964
  %21 = load i32* %20, align 4, !dbg !1964, !tbaa !1900
  %and69 = and i32 %21, 61440, !dbg !1964
  %cmp70 = icmp eq i32 %and69, 8192, !dbg !1964
  br i1 %cmp70, label %return, label %if.else72, !dbg !1964

if.else72:                                        ; preds = %sw.bb67
  %call73 = call i32* @__errno_location() #1, !dbg !1966
  store i32 25, i32* %call73, align 4, !dbg !1966, !tbaa !752
  br label %return, !dbg !1968

sw.bb74:                                          ; preds = %if.then7
  call void @klee_warning_once(i8* getelementptr inbounds ([46 x i8]* @.str18, i64 0, i64 0)) #5, !dbg !1969
  %22 = getelementptr inbounds %struct.stat64* %8, i64 0, i32 3, !dbg !1971
  %23 = load i32* %22, align 4, !dbg !1971, !tbaa !1900
  %and76 = and i32 %23, 61440, !dbg !1971
  %cmp77 = icmp eq i32 %and76, 8192, !dbg !1971
  %call79 = call i32* @__errno_location() #1, !dbg !1973
  br i1 %cmp77, label %if.then78, label %if.else80, !dbg !1971

if.then78:                                        ; preds = %sw.bb74
  store i32 22, i32* %call79, align 4, !dbg !1973, !tbaa !752
  br label %return, !dbg !1975

if.else80:                                        ; preds = %sw.bb74
  store i32 25, i32* %call79, align 4, !dbg !1976, !tbaa !752
  br label %return, !dbg !1978

sw.bb82:                                          ; preds = %if.then7
  %24 = bitcast i8* %6 to i32*, !dbg !1979
  call void @llvm.dbg.value(metadata !{i32* %24}, i64 0, metadata !440), !dbg !1979
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str19, i64 0, i64 0)) #5, !dbg !1980
  %25 = getelementptr inbounds %struct.stat64* %8, i64 0, i32 3, !dbg !1981
  %26 = load i32* %25, align 4, !dbg !1981, !tbaa !1900
  %and84 = and i32 %26, 61440, !dbg !1981
  %cmp85 = icmp eq i32 %and84, 8192, !dbg !1981
  br i1 %cmp85, label %if.then86, label %if.else98, !dbg !1981

if.then86:                                        ; preds = %sw.bb82
  %off = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 2, !dbg !1983
  %27 = load i64* %off, align 8, !dbg !1983, !tbaa !1150
  %28 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !1983, !tbaa !788
  %size = getelementptr inbounds %struct.exe_disk_file_t* %28, i64 0, i32 0, !dbg !1983
  %29 = load i32* %size, align 4, !dbg !1983, !tbaa !1164
  %conv = zext i32 %29 to i64, !dbg !1983
  %cmp88 = icmp sgt i64 %conv, %27, !dbg !1983
  br i1 %cmp88, label %if.then90, label %if.end97, !dbg !1983

if.then90:                                        ; preds = %if.then86
  %sub = sub nsw i64 %conv, %27, !dbg !1986
  %conv95 = trunc i64 %sub to i32, !dbg !1986
  br label %if.end97, !dbg !1988

if.end97:                                         ; preds = %if.then86, %if.then90
  %storemerge = phi i32 [ %conv95, %if.then90 ], [ 0, %if.then86 ]
  store i32 %storemerge, i32* %24, align 4, !dbg !1986, !tbaa !752
  br label %return, !dbg !1989

if.else98:                                        ; preds = %sw.bb82
  %call99 = call i32* @__errno_location() #1, !dbg !1990
  store i32 25, i32* %call99, align 4, !dbg !1990, !tbaa !752
  br label %return, !dbg !1992

sw.bb100:                                         ; preds = %if.then7
  call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str20, i64 0, i64 0)) #5, !dbg !1993
  %call101 = call i32* @__errno_location() #1, !dbg !1995
  store i32 22, i32* %call101, align 4, !dbg !1995, !tbaa !752
  br label %return, !dbg !1996

sw.default:                                       ; preds = %if.then7
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !1997
  %call102 = call i32* @__errno_location() #1, !dbg !1998
  store i32 22, i32* %call102, align 4, !dbg !1998, !tbaa !752
  br label %return, !dbg !1999

if.else103:                                       ; preds = %vaarg.end
  %fd104 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !2000
  %30 = load i32* %fd104, align 8, !dbg !2000, !tbaa !855
  %call105 = call i64 (i64, ...)* @syscall(i64 16, i32 %30, i64 %request, i8* %6) #5, !dbg !2000
  %conv106 = trunc i64 %call105 to i32, !dbg !2000
  call void @llvm.dbg.value(metadata !{i32 %conv106}, i64 0, metadata !443), !dbg !2000
  %cmp107 = icmp eq i32 %conv106, -1, !dbg !2001
  br i1 %cmp107, label %if.then109, label %return, !dbg !2001

if.then109:                                       ; preds = %if.else103
  %call110 = call i32 @klee_get_errno() #5, !dbg !2003
  %call111 = call i32* @__errno_location() #1, !dbg !2003
  store i32 %call110, i32* %call111, align 4, !dbg !2003, !tbaa !752
  br label %return, !dbg !2003

return:                                           ; preds = %if.else103, %if.then109, %sw.bb67, %sw.bb60, %sw.bb55, %sw.bb48, %sw.default, %sw.bb100, %if.else98, %if.end97, %if.else80, %if.then78, %if.else72, %if.else65, %if.else58, %if.else53, %if.else, %if.then10, %if.then
  %retval.0 = phi i32 [ -1, %sw.default ], [ -1, %sw.bb100 ], [ 0, %if.end97 ], [ -1, %if.else98 ], [ -1, %if.then78 ], [ -1, %if.else80 ], [ -1, %if.else72 ], [ -1, %if.else65 ], [ -1, %if.else58 ], [ -1, %if.else53 ], [ 0, %if.then10 ], [ -1, %if.else ], [ -1, %if.then ], [ 0, %sw.bb48 ], [ 0, %sw.bb55 ], [ 0, %sw.bb60 ], [ 0, %sw.bb67 ], [ -1, %if.then109 ], [ %conv106, %if.else103 ]
  ret i32 %retval.0, !dbg !2004
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #5

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #5

declare void @klee_warning_once(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @fcntl(i32 %fd, i32 %cmd, ...) #0 {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !449), !dbg !2005
  call void @llvm.dbg.value(metadata !{i32 %cmd}, i64 0, metadata !450), !dbg !2005
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2006), !dbg !2008
  %0 = icmp ult i32 %fd, 32, !dbg !2009
  br i1 %0, label %if.then.i, label %if.then, !dbg !2009

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !2010
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !2011
  %1 = load i32* %flags.i, align 4, !dbg !2011, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !2011
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !2011
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !2011

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !2010
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !451), !dbg !2007
  call void @llvm.dbg.declare(metadata !{[1 x %struct.__va_list_tag]* %ap}, metadata !452), !dbg !2012
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !2013
  br i1 %tobool, label %if.then, label %if.end, !dbg !2013

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = call i32* @__errno_location() #1, !dbg !2015
  store i32 9, i32* %call1, align 4, !dbg !2015, !tbaa !752
  br label %return, !dbg !2017

if.end:                                           ; preds = %__get_file.exit
  switch i32 %cmd, label %if.else [
    i32 1026, label %if.end16
    i32 1025, label %if.end16
    i32 11, label %if.end16
    i32 9, label %if.end16
    i32 3, label %if.end16
    i32 1, label %if.end16
  ], !dbg !2018

if.else:                                          ; preds = %if.end
  %arraydecay12 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*, !dbg !2020
  call void @llvm.va_start(i8* %arraydecay12), !dbg !2020
  %gp_offset_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 0, !dbg !2022
  %gp_offset = load i32* %gp_offset_p, align 16, !dbg !2022
  %fits_in_gp = icmp ult i32 %gp_offset, 41, !dbg !2022
  br i1 %fits_in_gp, label %vaarg.in_reg, label %vaarg.in_mem, !dbg !2022

vaarg.in_reg:                                     ; preds = %if.else
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 3, !dbg !2022
  %reg_save_area = load i8** %2, align 16, !dbg !2022
  %3 = sext i32 %gp_offset to i64, !dbg !2022
  %4 = getelementptr i8* %reg_save_area, i64 %3, !dbg !2022
  %5 = add i32 %gp_offset, 8, !dbg !2022
  store i32 %5, i32* %gp_offset_p, align 16, !dbg !2022
  br label %vaarg.end, !dbg !2022

vaarg.in_mem:                                     ; preds = %if.else
  %overflow_arg_area_p = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0, i32 2, !dbg !2022
  %overflow_arg_area = load i8** %overflow_arg_area_p, align 8, !dbg !2022
  %overflow_arg_area.next = getelementptr i8* %overflow_arg_area, i64 8, !dbg !2022
  store i8* %overflow_arg_area.next, i8** %overflow_arg_area_p, align 8, !dbg !2022
  br label %vaarg.end, !dbg !2022

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr.in = phi i8* [ %4, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %vaarg.addr = bitcast i8* %vaarg.addr.in to i32*, !dbg !2022
  %6 = load i32* %vaarg.addr, align 4, !dbg !2022
  call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !453), !dbg !2022
  call void @llvm.va_end(i8* %arraydecay12), !dbg !2023
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %vaarg.end
  %arg.0 = phi i32 [ %6, %vaarg.end ], [ 0, %if.end ], [ 0, %if.end ], [ 0, %if.end ], [ 0, %if.end ], [ 0, %if.end ], [ 0, %if.end ]
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !2024
  %7 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !2024, !tbaa !788
  %tobool17 = icmp eq %struct.exe_disk_file_t* %7, null, !dbg !2024
  br i1 %tobool17, label %if.else34, label %if.then18, !dbg !2024

if.then18:                                        ; preds = %if.end16
  switch i32 %cmd, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb23
    i32 3, label %return
  ], !dbg !2025

sw.bb:                                            ; preds = %if.then18
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !454), !dbg !2026
  %8 = load i32* %flags.i, align 4, !dbg !2027, !tbaa !765
  call void @llvm.dbg.value(metadata !2029, i64 0, metadata !454), !dbg !2030
  %and = lshr i32 %8, 1, !dbg !2027
  %and.lobit = and i32 %and, 1, !dbg !2027
  br label %return, !dbg !2031

sw.bb23:                                          ; preds = %if.then18
  %9 = load i32* %flags.i, align 4, !dbg !2032, !tbaa !765
  %and25 = and i32 %9, -3, !dbg !2032
  %and26 = and i32 %arg.0, 1, !dbg !2034
  %tobool27 = icmp eq i32 %and26, 0, !dbg !2034
  %or30 = or i32 %9, 2, !dbg !2036
  %and25.or30 = select i1 %tobool27, i32 %and25, i32 %or30, !dbg !2034
  store i32 %and25.or30, i32* %flags.i, align 4, !dbg !2032, !tbaa !765
  br label %return, !dbg !2037

sw.default:                                       ; preds = %if.then18
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str11, i64 0, i64 0)) #5, !dbg !2038
  %call33 = call i32* @__errno_location() #1, !dbg !2039
  store i32 22, i32* %call33, align 4, !dbg !2039, !tbaa !752
  br label %return, !dbg !2040

if.else34:                                        ; preds = %if.end16
  %fd35 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !2041
  %10 = load i32* %fd35, align 8, !dbg !2041, !tbaa !855
  %call36 = call i64 (i64, ...)* @syscall(i64 72, i32 %10, i32 %cmd, i32 %arg.0) #5, !dbg !2041
  %conv = trunc i64 %call36 to i32, !dbg !2041
  call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !459), !dbg !2041
  %cmp37 = icmp eq i32 %conv, -1, !dbg !2042
  br i1 %cmp37, label %if.then39, label %return, !dbg !2042

if.then39:                                        ; preds = %if.else34
  %call40 = call i32 @klee_get_errno() #5, !dbg !2044
  %call41 = call i32* @__errno_location() #1, !dbg !2044
  store i32 %call40, i32* %call41, align 4, !dbg !2044, !tbaa !752
  br label %return, !dbg !2044

return:                                           ; preds = %if.else34, %if.then39, %if.then18, %sw.default, %sw.bb23, %sw.bb, %if.then
  %retval.0 = phi i32 [ -1, %sw.default ], [ 0, %sw.bb23 ], [ %and.lobit, %sw.bb ], [ -1, %if.then ], [ 0, %if.then18 ], [ -1, %if.then39 ], [ %conv, %if.else34 ]
  ret i32 %retval.0, !dbg !2045
}

; Function Attrs: nounwind uwtable
define i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !495), !dbg !2046
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !496), !dbg !2046
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2047), !dbg !2049
  %0 = load i8* %path, align 1, !dbg !2050, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !2051), !dbg !2050
  %conv.i = sext i8 %0 to i32, !dbg !2052
  %cmp.i = icmp eq i8 %0, 0, !dbg !2052
  br i1 %cmp.i, label %if.end, label %lor.lhs.false.i, !dbg !2052

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !2052
  %1 = load i8* %arrayidx2.i, align 1, !dbg !2052, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !2052
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end, !dbg !2052

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2053, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !2053
  br i1 %cmp626.i, label %if.end, label %for.body.i, !dbg !2053

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !2053
  br i1 %cmp6.i, label %for.body.i, label %if.end, !dbg !2053

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !2054
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !2054
  %add.i = add nsw i32 %conv10.i, 65, !dbg !2054
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !2054
  %inc.i = add i32 %i.027.i, 1, !dbg !2053
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !2055), !dbg !2053
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !2054

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !2056
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2056, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !2057
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !2057, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !2057
  %5 = load i64* %st_ino.i, align 8, !dbg !2057, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !2057
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !2056
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !2058
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !2057
  br i1 %or.cond, label %if.end, label %if.then, !dbg !2057

if.then:                                          ; preds = %if.then13.i
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str9, i64 0, i64 0)) #5, !dbg !2060
  %call1 = tail call i32* @__errno_location() #1, !dbg !2062
  store i32 2, i32* %call1, align 4, !dbg !2062, !tbaa !752
  br label %return, !dbg !2063

if.end:                                           ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2064) #5, !dbg !2066
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2067) #5, !dbg !2069
  %6 = ptrtoint i8* %path to i64, !dbg !2070
  %call.i.i = tail call i64 @klee_get_valuel(i64 %6) #5, !dbg !2070
  %7 = inttoptr i64 %call.i.i to i8*, !dbg !2070
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !2071) #5, !dbg !2070
  %cmp.i.i = icmp eq i8* %7, %path, !dbg !2072
  %conv1.i.i = zext i1 %cmp.i.i to i64, !dbg !2072
  tail call void @klee_assume(i64 %conv1.i.i) #5, !dbg !2072
  tail call void @llvm.dbg.value(metadata !{i8* %7}, i64 0, metadata !2073) #5, !dbg !2068
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !2074) #5, !dbg !2075
  br label %for.cond.i11, !dbg !2075

for.cond.i11:                                     ; preds = %for.inc.i, %if.end
  %i.0.i = phi i32 [ 0, %if.end ], [ %inc.i13, %for.inc.i ]
  %sc.0.i = phi i8* [ %7, %if.end ], [ %sc.1.i, %for.inc.i ]
  %8 = load i8* %sc.0.i, align 1, !dbg !2076, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %8}, i64 0, metadata !2077) #5, !dbg !2076
  %sub.i = add i32 %i.0.i, -1, !dbg !2078
  %and.i = and i32 %sub.i, %i.0.i, !dbg !2078
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !2078
  br i1 %tobool.i, label %if.then.i, label %if.else7.i, !dbg !2078

if.then.i:                                        ; preds = %for.cond.i11
  switch i8 %8, label %for.inc.i [
    i8 0, label %if.then2.i
    i8 47, label %if.then4.i
  ], !dbg !2079

if.then2.i:                                       ; preds = %if.then.i
  store i8 0, i8* %sc.0.i, align 1, !dbg !2080, !tbaa !694
  br label %__concretize_string.exit, !dbg !2081

if.then4.i:                                       ; preds = %if.then.i
  %incdec.ptr5.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2082
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr5.i}, i64 0, metadata !2073) #5, !dbg !2082
  store i8 47, i8* %sc.0.i, align 1, !dbg !2082, !tbaa !694
  br label %for.inc.i, !dbg !2083

if.else7.i:                                       ; preds = %for.cond.i11
  %conv8.i = sext i8 %8 to i64, !dbg !2084
  %call9.i = tail call i64 @klee_get_valuel(i64 %conv8.i) #5, !dbg !2084
  %conv10.i12 = trunc i64 %call9.i to i8, !dbg !2084
  tail call void @llvm.dbg.value(metadata !{i8 %conv10.i12}, i64 0, metadata !2085) #5, !dbg !2084
  %cmp13.i = icmp eq i8 %conv10.i12, %8, !dbg !2086
  %conv15.i = zext i1 %cmp13.i to i64, !dbg !2086
  tail call void @klee_assume(i64 %conv15.i) #5, !dbg !2086
  %incdec.ptr16.i = getelementptr inbounds i8* %sc.0.i, i64 1, !dbg !2087
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr16.i}, i64 0, metadata !2073) #5, !dbg !2087
  store i8 %conv10.i12, i8* %sc.0.i, align 1, !dbg !2087, !tbaa !694
  %tobool17.i = icmp eq i8 %conv10.i12, 0, !dbg !2088
  br i1 %tobool17.i, label %__concretize_string.exit, label %for.inc.i, !dbg !2088

for.inc.i:                                        ; preds = %if.else7.i, %if.then4.i, %if.then.i
  %sc.1.i = phi i8* [ %incdec.ptr16.i, %if.else7.i ], [ %incdec.ptr5.i, %if.then4.i ], [ %sc.0.i, %if.then.i ]
  %inc.i13 = add i32 %i.0.i, 1, !dbg !2075
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i13}, i64 0, metadata !2074) #5, !dbg !2075
  br label %for.cond.i11, !dbg !2075

__concretize_string.exit:                         ; preds = %if.else7.i, %if.then2.i
  %call3 = tail call i64 (i64, ...)* @syscall(i64 137, i8* %path, %struct.statfs* %buf) #5, !dbg !2065
  %conv = trunc i64 %call3 to i32, !dbg !2065
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !498), !dbg !2065
  %cmp = icmp eq i32 %conv, -1, !dbg !2089
  br i1 %cmp, label %if.then5, label %return, !dbg !2089

if.then5:                                         ; preds = %__concretize_string.exit
  %call6 = tail call i32 @klee_get_errno() #5, !dbg !2091
  %call7 = tail call i32* @__errno_location() #1, !dbg !2091
  store i32 %call6, i32* %call7, align 4, !dbg !2091, !tbaa !752
  br label %return, !dbg !2091

return:                                           ; preds = %__concretize_string.exit, %if.then5, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ -1, %if.then5 ], [ %conv, %__concretize_string.exit ]
  ret i32 %retval.0, !dbg !2092
}

; Function Attrs: nounwind uwtable
define i32 @fstatfs(i32 %fd, %struct.statfs* %buf) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !504), !dbg !2093
  tail call void @llvm.dbg.value(metadata !{%struct.statfs* %buf}, i64 0, metadata !505), !dbg !2093
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2094), !dbg !2096
  %0 = icmp ult i32 %fd, 32, !dbg !2097
  br i1 %0, label %if.then.i, label %if.then, !dbg !2097

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !2098
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !2099
  %1 = load i32* %flags.i, align 4, !dbg !2099, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !2099
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !2099
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !2099

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !2098
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !506), !dbg !2095
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !2100
  br i1 %tobool, label %if.then, label %if.end, !dbg !2100

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !2102
  store i32 9, i32* %call1, align 4, !dbg !2102, !tbaa !752
  br label %return, !dbg !2104

if.end:                                           ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !2105
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !2105, !tbaa !788
  %tobool2 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !2105
  br i1 %tobool2, label %if.else, label %if.then3, !dbg !2105

if.then3:                                         ; preds = %if.end
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str21, i64 0, i64 0)) #5, !dbg !2106
  %call4 = tail call i32* @__errno_location() #1, !dbg !2108
  store i32 9, i32* %call4, align 4, !dbg !2108, !tbaa !752
  br label %return, !dbg !2109

if.else:                                          ; preds = %if.end
  %fd5 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !2110
  %3 = load i32* %fd5, align 8, !dbg !2110, !tbaa !855
  %call6 = tail call i64 (i64, ...)* @syscall(i64 138, i32 %3, %struct.statfs* %buf) #5, !dbg !2110
  %conv = trunc i64 %call6 to i32, !dbg !2110
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !507), !dbg !2110
  %cmp = icmp eq i32 %conv, -1, !dbg !2111
  br i1 %cmp, label %if.then8, label %return, !dbg !2111

if.then8:                                         ; preds = %if.else
  %call9 = tail call i32 @klee_get_errno() #5, !dbg !2113
  %call10 = tail call i32* @__errno_location() #1, !dbg !2113
  store i32 %call9, i32* %call10, align 4, !dbg !2113, !tbaa !752
  br label %return, !dbg !2113

return:                                           ; preds = %if.else, %if.then8, %if.then3, %if.then
  %retval.0 = phi i32 [ -1, %if.then3 ], [ -1, %if.then ], [ -1, %if.then8 ], [ %conv, %if.else ]
  ret i32 %retval.0, !dbg !2114
}

; Function Attrs: nounwind uwtable
define i32 @fsync(i32 %fd) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !512), !dbg !2115
  tail call void @llvm.dbg.value(metadata !{i32 %fd}, i64 0, metadata !2116), !dbg !2118
  %0 = icmp ult i32 %fd, 32, !dbg !2119
  br i1 %0, label %if.then.i, label %if.then, !dbg !2119

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %fd to i64, !dbg !2120
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !2121
  %1 = load i32* %flags.i, align 4, !dbg !2121, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !2121
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !2121
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !2121

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !2120
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !513), !dbg !2117
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !2122
  br i1 %tobool, label %if.then, label %if.else, !dbg !2122

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call1 = tail call i32* @__errno_location() #1, !dbg !2123
  store i32 9, i32* %call1, align 4, !dbg !2123, !tbaa !752
  br label %return, !dbg !2125

if.else:                                          ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 3, !dbg !2126
  %2 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !2126, !tbaa !788
  %tobool2 = icmp eq %struct.exe_disk_file_t* %2, null, !dbg !2126
  br i1 %tobool2, label %if.else4, label %return, !dbg !2126

if.else4:                                         ; preds = %if.else
  %fd5 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !2127
  %3 = load i32* %fd5, align 8, !dbg !2127, !tbaa !855
  %call6 = tail call i64 (i64, ...)* @syscall(i64 74, i32 %3) #5, !dbg !2127
  %conv = trunc i64 %call6 to i32, !dbg !2127
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !514), !dbg !2127
  %cmp = icmp eq i32 %conv, -1, !dbg !2128
  br i1 %cmp, label %if.then8, label %return, !dbg !2128

if.then8:                                         ; preds = %if.else4
  %call9 = tail call i32 @klee_get_errno() #5, !dbg !2130
  %call10 = tail call i32* @__errno_location() #1, !dbg !2130
  store i32 %call9, i32* %call10, align 4, !dbg !2130, !tbaa !752
  br label %return, !dbg !2130

return:                                           ; preds = %if.else4, %if.then8, %if.else, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ 0, %if.else ], [ -1, %if.then8 ], [ %conv, %if.else4 ]
  ret i32 %retval.0, !dbg !2131
}

; Function Attrs: nounwind uwtable
define i32 @dup2(i32 %oldfd, i32 %newfd) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !520), !dbg !2132
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !521), !dbg !2132
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !2133), !dbg !2135
  %0 = icmp ult i32 %oldfd, 32, !dbg !2136
  br i1 %0, label %if.then.i, label %if.then, !dbg !2136

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %oldfd to i64, !dbg !2137
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !2138
  %1 = load i32* %flags.i, align 4, !dbg !2138, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !2138
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !2138
  br i1 %tobool.i, label %if.then, label %__get_file.exit, !dbg !2138

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !2137
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !522), !dbg !2134
  %tobool = icmp ne %struct.exe_file_t* %arrayidx.i, null, !dbg !2139
  %cmp = icmp sgt i32 %newfd, -1, !dbg !2139
  %or.cond = and i1 %tobool, %cmp, !dbg !2139
  %cmp1 = icmp slt i32 %newfd, 32, !dbg !2139
  %or.cond8 = and i1 %or.cond, %cmp1, !dbg !2139
  br i1 %or.cond8, label %if.else, label %if.then, !dbg !2139

if.then:                                          ; preds = %entry, %if.then.i, %__get_file.exit
  %call2 = tail call i32* @__errno_location() #1, !dbg !2140
  store i32 9, i32* %call2, align 4, !dbg !2140, !tbaa !752
  br label %return, !dbg !2142

if.else:                                          ; preds = %__get_file.exit
  %idxprom = sext i32 %newfd to i64, !dbg !2143
  %arrayidx = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom, !dbg !2143
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx}, i64 0, metadata !523), !dbg !2143
  %flags = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom, i32 1, !dbg !2144
  %2 = load i32* %flags, align 4, !dbg !2144, !tbaa !765
  %and = and i32 %2, 1, !dbg !2144
  %tobool3 = icmp eq i32 %and, 0, !dbg !2144
  br i1 %tobool3, label %if.end, label %if.then4, !dbg !2144

if.then4:                                         ; preds = %if.else
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !2146) #5, !dbg !2147
  tail call void @llvm.dbg.value(metadata !22, i64 0, metadata !2148) #5, !dbg !2149
  %3 = load i32* @close.n_calls, align 4, !dbg !2150, !tbaa !752
  %inc.i = add nsw i32 %3, 1, !dbg !2150
  store i32 %inc.i, i32* @close.n_calls, align 4, !dbg !2150, !tbaa !752
  tail call void @llvm.dbg.value(metadata !{i32 %newfd}, i64 0, metadata !2151) #5, !dbg !2153
  %4 = icmp ugt i32 %newfd, 31, !dbg !2154
  %tobool.i16 = icmp eq %struct.exe_file_t* %arrayidx, null, !dbg !2155
  %or.cond25 = or i1 %4, %tobool.i16, !dbg !2154
  tail call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx}, i64 0, metadata !2156) #5, !dbg !2152
  br i1 %or.cond25, label %if.then.i17, label %if.end.i, !dbg !2154

if.then.i17:                                      ; preds = %if.then4
  %call1.i = tail call i32* @__errno_location() #1, !dbg !2157
  store i32 9, i32* %call1.i, align 4, !dbg !2157, !tbaa !752
  br label %if.end, !dbg !2158

if.end.i:                                         ; preds = %if.then4
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2159, !tbaa !1096
  %tobool2.i = icmp eq i32 %5, 0, !dbg !2159
  br i1 %tobool2.i, label %if.end5.i, label %land.lhs.true.i, !dbg !2159

land.lhs.true.i:                                  ; preds = %if.end.i
  %6 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !2159, !tbaa !1097
  %7 = load i32* %6, align 4, !dbg !2159, !tbaa !752
  %cmp.i = icmp eq i32 %7, %inc.i, !dbg !2159
  br i1 %cmp.i, label %if.then3.i, label %if.end5.i, !dbg !2159

if.then3.i:                                       ; preds = %land.lhs.true.i
  %dec.i = add i32 %5, -1, !dbg !2160
  store i32 %dec.i, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2160, !tbaa !1096
  %call4.i = tail call i32* @__errno_location() #1, !dbg !2161
  store i32 5, i32* %call4.i, align 4, !dbg !2161, !tbaa !752
  br label %if.end, !dbg !2162

if.end5.i:                                        ; preds = %land.lhs.true.i, %if.end.i
  %8 = bitcast %struct.exe_file_t* %arrayidx to i8*, !dbg !2163
  tail call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 24, i32 8, i1 false) #5, !dbg !2163
  br label %if.end, !dbg !2164

if.end:                                           ; preds = %if.end5.i, %if.then3.i, %if.then.i17, %if.else
  %9 = bitcast %struct.exe_file_t* %arrayidx to i8*, !dbg !2165
  %10 = bitcast %struct.exe_file_t* %arrayidx.i to i8*, !dbg !2165
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 24, i32 8, i1 false), !dbg !2165, !tbaa.struct !2166
  %11 = load i32* %flags, align 4, !dbg !2169, !tbaa !765
  %and7 = and i32 %11, -3, !dbg !2169
  store i32 %and7, i32* %flags, align 4, !dbg !2169, !tbaa !765
  br label %return, !dbg !2170

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ %newfd, %if.end ], [ -1, %if.then ]
  ret i32 %retval.0, !dbg !2171
}

; Function Attrs: nounwind uwtable
define i32 @dup(i32 %oldfd) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !528), !dbg !2172
  tail call void @llvm.dbg.value(metadata !{i32 %oldfd}, i64 0, metadata !2173), !dbg !2175
  %0 = icmp ult i32 %oldfd, 32, !dbg !2176
  br i1 %0, label %if.then.i, label %if.then, !dbg !2176

if.then.i:                                        ; preds = %entry
  %idxprom.i = sext i32 %oldfd to i64, !dbg !2177
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, i32 1, !dbg !2178
  %1 = load i32* %flags.i, align 4, !dbg !2178, !tbaa !765
  %and.i = and i32 %1, 1, !dbg !2178
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !2178
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %idxprom.i, !dbg !2177
  %tobool = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !2179
  %or.cond = or i1 %tobool.i, %tobool, !dbg !2178
  br i1 %or.cond, label %if.then, label %for.body, !dbg !2178

if.then:                                          ; preds = %entry, %if.then.i
  %call1 = tail call i32* @__errno_location() #1, !dbg !2180
  store i32 9, i32* %call1, align 4, !dbg !2180, !tbaa !752
  br label %return, !dbg !2182

for.cond:                                         ; preds = %for.body
  %2 = trunc i64 %indvars.iv.next to i32, !dbg !2183
  %cmp = icmp slt i32 %2, 32, !dbg !2183
  br i1 %cmp, label %for.body, label %for.end, !dbg !2183

for.body:                                         ; preds = %if.then.i, %for.cond
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond ], [ 0, %if.then.i ]
  %fd.015 = phi i32 [ %inc, %for.cond ], [ 0, %if.then.i ]
  %flags = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !2185
  %3 = load i32* %flags, align 4, !dbg !2185, !tbaa !765
  %and = and i32 %3, 1, !dbg !2185
  %tobool2 = icmp eq i32 %and, 0, !dbg !2185
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2183
  %inc = add nsw i32 %fd.015, 1, !dbg !2183
  tail call void @llvm.dbg.value(metadata !{i32 %inc}, i64 0, metadata !530), !dbg !2183
  br i1 %tobool2, label %for.end, label %for.cond, !dbg !2185

for.end:                                          ; preds = %for.body, %for.cond
  %fd.0.lcssa = phi i32 [ %fd.015, %for.body ], [ %inc, %for.cond ]
  %cmp4 = icmp eq i32 %fd.0.lcssa, 32, !dbg !2187
  br i1 %cmp4, label %if.then5, label %if.else7, !dbg !2187

if.then5:                                         ; preds = %for.end
  %call6 = tail call i32* @__errno_location() #1, !dbg !2189
  store i32 24, i32* %call6, align 4, !dbg !2189, !tbaa !752
  br label %return, !dbg !2191

if.else7:                                         ; preds = %for.end
  %call8 = tail call i32 @dup2(i32 %oldfd, i32 %fd.0.lcssa) #5, !dbg !2192
  br label %return, !dbg !2192

return:                                           ; preds = %if.else7, %if.then5, %if.then
  %retval.0 = phi i32 [ -1, %if.then5 ], [ %call8, %if.else7 ], [ -1, %if.then ]
  ret i32 %retval.0, !dbg !2194
}

; Function Attrs: nounwind uwtable
define i32 @rmdir(i8* nocapture readonly %pathname) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !535), !dbg !2195
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2196), !dbg !2198
  %0 = load i8* %pathname, align 1, !dbg !2199, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !2200), !dbg !2199
  %conv.i = sext i8 %0 to i32, !dbg !2201
  %cmp.i = icmp eq i8 %0, 0, !dbg !2201
  br i1 %cmp.i, label %if.end, label %lor.lhs.false.i, !dbg !2201

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %pathname, i64 1, !dbg !2201
  %1 = load i8* %arrayidx2.i, align 1, !dbg !2201, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !2201
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end, !dbg !2201

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2202, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !2202
  br i1 %cmp626.i, label %if.end, label %for.body.i, !dbg !2202

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !2202
  br i1 %cmp6.i, label %for.body.i, label %if.end, !dbg !2202

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !2203
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !2203
  %add.i = add nsw i32 %conv10.i, 65, !dbg !2203
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !2203
  %inc.i = add i32 %i.027.i, 1, !dbg !2202
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !2204), !dbg !2202
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !2203

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !2205
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2205, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !2206
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !2206, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !2206
  %5 = load i64* %st_ino.i, align 8, !dbg !2206, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !2206
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !2205
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !2207
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !2206
  br i1 %or.cond, label %if.end, label %if.then, !dbg !2206

if.then:                                          ; preds = %if.then13.i
  %st_mode = getelementptr inbounds %struct.stat64* %4, i64 0, i32 3, !dbg !2209
  %6 = load i32* %st_mode, align 4, !dbg !2209, !tbaa !805
  %and = and i32 %6, 61440, !dbg !2209
  %cmp = icmp eq i32 %and, 16384, !dbg !2209
  br i1 %cmp, label %if.then1, label %if.else, !dbg !2209

if.then1:                                         ; preds = %if.then
  store i64 0, i64* %st_ino.i, align 8, !dbg !2212, !tbaa !713
  br label %return, !dbg !2214

if.else:                                          ; preds = %if.then
  %call3 = tail call i32* @__errno_location() #1, !dbg !2215
  store i32 20, i32* %call3, align 4, !dbg !2215, !tbaa !752
  br label %return, !dbg !2217

if.end:                                           ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2218
  %call4 = tail call i32* @__errno_location() #1, !dbg !2219
  store i32 1, i32* %call4, align 4, !dbg !2219, !tbaa !752
  br label %return, !dbg !2220

return:                                           ; preds = %if.end, %if.else, %if.then1
  %retval.0 = phi i32 [ 0, %if.then1 ], [ -1, %if.else ], [ -1, %if.end ]
  ret i32 %retval.0, !dbg !2221
}

; Function Attrs: nounwind uwtable
define i32 @unlink(i8* nocapture readonly %pathname) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !539), !dbg !2222
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2223), !dbg !2225
  %0 = load i8* %pathname, align 1, !dbg !2226, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !2227), !dbg !2226
  %conv.i = sext i8 %0 to i32, !dbg !2228
  %cmp.i = icmp eq i8 %0, 0, !dbg !2228
  br i1 %cmp.i, label %if.end, label %lor.lhs.false.i, !dbg !2228

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %pathname, i64 1, !dbg !2228
  %1 = load i8* %arrayidx2.i, align 1, !dbg !2228, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !2228
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end, !dbg !2228

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2229, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !2229
  br i1 %cmp626.i, label %if.end, label %for.body.i, !dbg !2229

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !2229
  br i1 %cmp6.i, label %for.body.i, label %if.end, !dbg !2229

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !2230
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !2230
  %add.i = add nsw i32 %conv10.i, 65, !dbg !2230
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !2230
  %inc.i = add i32 %i.027.i, 1, !dbg !2229
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !2231), !dbg !2229
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !2230

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !2232
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2232, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !2233
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !2233, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !2233
  %5 = load i64* %st_ino.i, align 8, !dbg !2233, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !2233
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !2232
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !2234
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !2233
  br i1 %or.cond, label %if.end, label %if.then, !dbg !2233

if.then:                                          ; preds = %if.then13.i
  %st_mode = getelementptr inbounds %struct.stat64* %4, i64 0, i32 3, !dbg !2236
  %6 = load i32* %st_mode, align 4, !dbg !2236, !tbaa !805
  %and = and i32 %6, 61440, !dbg !2236
  %cmp = icmp eq i32 %and, 32768, !dbg !2236
  br i1 %cmp, label %if.then1, label %if.else, !dbg !2236

if.then1:                                         ; preds = %if.then
  store i64 0, i64* %st_ino.i, align 8, !dbg !2239, !tbaa !713
  br label %return, !dbg !2241

if.else:                                          ; preds = %if.then
  %cmp6 = icmp eq i32 %and, 16384, !dbg !2242
  %call8 = tail call i32* @__errno_location() #1, !dbg !2244
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !2242

if.then7:                                         ; preds = %if.else
  store i32 21, i32* %call8, align 4, !dbg !2244, !tbaa !752
  br label %return, !dbg !2246

if.else9:                                         ; preds = %if.else
  store i32 1, i32* %call8, align 4, !dbg !2247, !tbaa !752
  br label %return, !dbg !2249

if.end:                                           ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2250
  %call11 = tail call i32* @__errno_location() #1, !dbg !2251
  store i32 1, i32* %call11, align 4, !dbg !2251, !tbaa !752
  br label %return, !dbg !2252

return:                                           ; preds = %if.end, %if.else9, %if.then7, %if.then1
  %retval.0 = phi i32 [ 0, %if.then1 ], [ -1, %if.then7 ], [ -1, %if.else9 ], [ -1, %if.end ]
  ret i32 %retval.0, !dbg !2253
}

; Function Attrs: nounwind uwtable
define i32 @unlinkat(i32 %dirfd, i8* nocapture readonly %pathname, i32 %flags) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %dirfd}, i64 0, metadata !545), !dbg !2254
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !546), !dbg !2254
  tail call void @llvm.dbg.value(metadata !{i32 %flags}, i64 0, metadata !547), !dbg !2254
  tail call void @llvm.dbg.value(metadata !{i8* %pathname}, i64 0, metadata !2255), !dbg !2257
  %0 = load i8* %pathname, align 1, !dbg !2258, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !2259), !dbg !2258
  %conv.i = sext i8 %0 to i32, !dbg !2260
  %cmp.i = icmp eq i8 %0, 0, !dbg !2260
  br i1 %cmp.i, label %if.end, label %lor.lhs.false.i, !dbg !2260

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %pathname, i64 1, !dbg !2260
  %1 = load i8* %arrayidx2.i, align 1, !dbg !2260, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !2260
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.end, !dbg !2260

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2261, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !2261
  br i1 %cmp626.i, label %if.end, label %for.body.i, !dbg !2261

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !2261
  br i1 %cmp6.i, label %for.body.i, label %if.end, !dbg !2261

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !2262
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !2262
  %add.i = add nsw i32 %conv10.i, 65, !dbg !2262
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !2262
  %inc.i = add i32 %i.027.i, 1, !dbg !2261
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !2263), !dbg !2261
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !2262

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !2264
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2264, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !2265
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !2265, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !2265
  %5 = load i64* %st_ino.i, align 8, !dbg !2265, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !2265
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !2264
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !2266
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !2265
  br i1 %or.cond, label %if.end, label %if.then, !dbg !2265

if.then:                                          ; preds = %if.then13.i
  %st_mode = getelementptr inbounds %struct.stat64* %4, i64 0, i32 3, !dbg !2268
  %6 = load i32* %st_mode, align 4, !dbg !2268, !tbaa !805
  %and = and i32 %6, 61440, !dbg !2268
  %cmp = icmp eq i32 %and, 32768, !dbg !2268
  br i1 %cmp, label %if.then1, label %if.else, !dbg !2268

if.then1:                                         ; preds = %if.then
  store i64 0, i64* %st_ino.i, align 8, !dbg !2271, !tbaa !713
  br label %return, !dbg !2273

if.else:                                          ; preds = %if.then
  %cmp6 = icmp eq i32 %and, 16384, !dbg !2274
  %call8 = tail call i32* @__errno_location() #1, !dbg !2276
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !2274

if.then7:                                         ; preds = %if.else
  store i32 21, i32* %call8, align 4, !dbg !2276, !tbaa !752
  br label %return, !dbg !2278

if.else9:                                         ; preds = %if.else
  store i32 1, i32* %call8, align 4, !dbg !2279, !tbaa !752
  br label %return, !dbg !2281

if.end:                                           ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str22, i64 0, i64 0)) #5, !dbg !2282
  %call11 = tail call i32* @__errno_location() #1, !dbg !2283
  store i32 1, i32* %call11, align 4, !dbg !2283, !tbaa !752
  br label %return, !dbg !2284

return:                                           ; preds = %if.end, %if.else9, %if.then7, %if.then1
  %retval.0 = phi i32 [ 0, %if.then1 ], [ -1, %if.then7 ], [ -1, %if.else9 ], [ -1, %if.end ]
  ret i32 %retval.0, !dbg !2285
}

; Function Attrs: nounwind uwtable
define i64 @readlink(i8* %path, i8* %buf, i64 %bufsize) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !553), !dbg !2286
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !554), !dbg !2286
  tail call void @llvm.dbg.value(metadata !{i64 %bufsize}, i64 0, metadata !555), !dbg !2286
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !2287), !dbg !2289
  %0 = load i8* %path, align 1, !dbg !2290, !tbaa !694
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !2291), !dbg !2290
  %conv.i = sext i8 %0 to i32, !dbg !2292
  %cmp.i = icmp eq i8 %0, 0, !dbg !2292
  br i1 %cmp.i, label %if.else20, label %lor.lhs.false.i, !dbg !2292

lor.lhs.false.i:                                  ; preds = %entry
  %arrayidx2.i = getelementptr inbounds i8* %path, i64 1, !dbg !2292
  %1 = load i8* %arrayidx2.i, align 1, !dbg !2292, !tbaa !694
  %cmp4.i = icmp eq i8 %1, 0, !dbg !2292
  br i1 %cmp4.i, label %for.cond.preheader.i, label %if.else20, !dbg !2292

for.cond.preheader.i:                             ; preds = %lor.lhs.false.i
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !2293, !tbaa !701
  %cmp626.i = icmp eq i32 %2, 0, !dbg !2293
  br i1 %cmp626.i, label %if.else20, label %for.body.i, !dbg !2293

for.cond.i:                                       ; preds = %for.body.i
  %cmp6.i = icmp ult i32 %inc.i, %2, !dbg !2293
  br i1 %cmp6.i, label %for.body.i, label %if.else20, !dbg !2293

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.cond.i
  %i.027.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.cond.preheader.i ]
  %sext.i = shl i32 %i.027.i, 24, !dbg !2294
  %conv10.i = ashr exact i32 %sext.i, 24, !dbg !2294
  %add.i = add nsw i32 %conv10.i, 65, !dbg !2294
  %cmp11.i = icmp eq i32 %conv.i, %add.i, !dbg !2294
  %inc.i = add i32 %i.027.i, 1, !dbg !2293
  tail call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !2295), !dbg !2293
  br i1 %cmp11.i, label %if.then13.i, label %for.cond.i, !dbg !2294

if.then13.i:                                      ; preds = %for.body.i
  %idxprom.i = zext i32 %i.027.i to i64, !dbg !2296
  %3 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !2296, !tbaa !708
  %stat.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, i32 2, !dbg !2297
  %4 = load %struct.stat64** %stat.i, align 8, !dbg !2297, !tbaa !711
  %st_ino.i = getelementptr inbounds %struct.stat64* %4, i64 0, i32 1, !dbg !2297
  %5 = load i64* %st_ino.i, align 8, !dbg !2297, !tbaa !713
  %cmp15.i = icmp eq i64 %5, 0, !dbg !2297
  %arrayidx14.i = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %idxprom.i, !dbg !2296
  %tobool = icmp eq %struct.exe_disk_file_t* %arrayidx14.i, null, !dbg !2298
  %or.cond = or i1 %cmp15.i, %tobool, !dbg !2297
  br i1 %or.cond, label %if.else20, label %if.then, !dbg !2297

if.then:                                          ; preds = %if.then13.i
  %st_mode = getelementptr inbounds %struct.stat64* %4, i64 0, i32 3, !dbg !2299
  %6 = load i32* %st_mode, align 4, !dbg !2299, !tbaa !805
  %and = and i32 %6, 61440, !dbg !2299
  %cmp = icmp eq i32 %and, 40960, !dbg !2299
  br i1 %cmp, label %if.then1, label %if.else, !dbg !2299

if.then1:                                         ; preds = %if.then
  store i8 %0, i8* %buf, align 1, !dbg !2302, !tbaa !694
  %cmp3 = icmp ugt i64 %bufsize, 1, !dbg !2304
  br i1 %cmp3, label %if.end, label %if.end17, !dbg !2304

if.end:                                           ; preds = %if.then1
  %arrayidx5 = getelementptr inbounds i8* %buf, i64 1, !dbg !2304
  store i8 46, i8* %arrayidx5, align 1, !dbg !2304, !tbaa !694
  %cmp6 = icmp ugt i64 %bufsize, 2, !dbg !2306
  br i1 %cmp6, label %if.end9, label %if.end17, !dbg !2306

if.end9:                                          ; preds = %if.end
  %arrayidx8 = getelementptr inbounds i8* %buf, i64 2, !dbg !2306
  store i8 108, i8* %arrayidx8, align 1, !dbg !2306, !tbaa !694
  %cmp10 = icmp ugt i64 %bufsize, 3, !dbg !2308
  br i1 %cmp10, label %if.end13, label %if.end17, !dbg !2308

if.end13:                                         ; preds = %if.end9
  %arrayidx12 = getelementptr inbounds i8* %buf, i64 3, !dbg !2308
  store i8 110, i8* %arrayidx12, align 1, !dbg !2308, !tbaa !694
  %cmp14 = icmp ugt i64 %bufsize, 4, !dbg !2310
  br i1 %cmp14, label %if.then15, label %if.end17, !dbg !2310

if.then15:                                        ; preds = %if.end13
  %arrayidx16 = getelementptr inbounds i8* %buf, i64 4, !dbg !2310
  store i8 107, i8* %arrayidx16, align 1, !dbg !2310, !tbaa !694
  br label %if.end17, !dbg !2310

if.end17:                                         ; preds = %if.end, %if.then1, %if.end9, %if.then15, %if.end13
  %cmp18 = icmp ugt i64 %bufsize, 5, !dbg !2312
  %cond = select i1 %cmp18, i64 5, i64 %bufsize, !dbg !2312
  br label %return, !dbg !2312

if.else:                                          ; preds = %if.then
  %call19 = tail call i32* @__errno_location() #1, !dbg !2313
  store i32 22, i32* %call19, align 4, !dbg !2313, !tbaa !752
  br label %return, !dbg !2315

if.else20:                                        ; preds = %for.cond.i, %for.cond.preheader.i, %if.then13.i, %entry, %lor.lhs.false.i
  %call21 = tail call i64 (i64, ...)* @syscall(i64 89, i8* %path, i8* %buf, i64 %bufsize) #5, !dbg !2316
  %conv = trunc i64 %call21 to i32, !dbg !2316
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !557), !dbg !2316
  %cmp22 = icmp eq i32 %conv, -1, !dbg !2317
  br i1 %cmp22, label %if.then24, label %if.end27, !dbg !2317

if.then24:                                        ; preds = %if.else20
  %call25 = tail call i32 @klee_get_errno() #5, !dbg !2319
  %call26 = tail call i32* @__errno_location() #1, !dbg !2319
  store i32 %call25, i32* %call26, align 4, !dbg !2319, !tbaa !752
  br label %if.end27, !dbg !2319

if.end27:                                         ; preds = %if.then24, %if.else20
  %sext = shl i64 %call21, 32, !dbg !2320
  %conv28 = ashr exact i64 %sext, 32, !dbg !2320
  br label %return, !dbg !2320

return:                                           ; preds = %if.end27, %if.else, %if.end17
  %retval.0 = phi i64 [ %cond, %if.end17 ], [ -1, %if.else ], [ %conv28, %if.end27 ]
  ret i64 %retval.0, !dbg !2321
}

; Function Attrs: nounwind uwtable
define i32 @select(i32 %nfds, %struct.fd_set* %read, %struct.fd_set* %write, %struct.fd_set* %except, %struct.timeval* nocapture readnone %timeout) #0 {
entry:
  %in_read = alloca %struct.fd_set, align 8
  %in_write = alloca %struct.fd_set, align 8
  %in_except = alloca %struct.fd_set, align 8
  %os_read = alloca %struct.fd_set, align 8
  %os_write = alloca %struct.fd_set, align 8
  %os_except = alloca %struct.fd_set, align 8
  %tv = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata !{i32 %nfds}, i64 0, metadata !575), !dbg !2322
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %read}, i64 0, metadata !576), !dbg !2322
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %write}, i64 0, metadata !577), !dbg !2322
  call void @llvm.dbg.value(metadata !{%struct.fd_set* %except}, i64 0, metadata !578), !dbg !2323
  call void @llvm.dbg.value(metadata !{%struct.timeval* %timeout}, i64 0, metadata !579), !dbg !2323
  %0 = bitcast %struct.fd_set* %in_read to i8*, !dbg !2324
  call void @llvm.lifetime.start(i64 128, i8* %0) #5, !dbg !2324
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_read}, metadata !580), !dbg !2324
  %1 = bitcast %struct.fd_set* %in_write to i8*, !dbg !2324
  call void @llvm.lifetime.start(i64 128, i8* %1) #5, !dbg !2324
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_write}, metadata !581), !dbg !2324
  %2 = bitcast %struct.fd_set* %in_except to i8*, !dbg !2324
  call void @llvm.lifetime.start(i64 128, i8* %2) #5, !dbg !2324
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %in_except}, metadata !582), !dbg !2324
  %3 = bitcast %struct.fd_set* %os_read to i8*, !dbg !2324
  call void @llvm.lifetime.start(i64 128, i8* %3) #5, !dbg !2324
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_read}, metadata !583), !dbg !2324
  %4 = bitcast %struct.fd_set* %os_write to i8*, !dbg !2324
  call void @llvm.lifetime.start(i64 128, i8* %4) #5, !dbg !2324
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_write}, metadata !584), !dbg !2324
  %5 = bitcast %struct.fd_set* %os_except to i8*, !dbg !2324
  call void @llvm.lifetime.start(i64 128, i8* %5) #5, !dbg !2324
  call void @llvm.dbg.declare(metadata !{%struct.fd_set* %os_except}, metadata !585), !dbg !2324
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !587), !dbg !2325
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !588), !dbg !2325
  %tobool = icmp ne %struct.fd_set* %read, null, !dbg !2326
  br i1 %tobool, label %if.then, label %if.else, !dbg !2326

if.then:                                          ; preds = %entry
  %6 = bitcast %struct.fd_set* %read to i8*, !dbg !2328
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %6, i64 128, i32 8, i1 false), !dbg !2328, !tbaa.struct !2330
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 128, i32 1, i1 false), !dbg !2331
  br label %if.end, !dbg !2332

if.else:                                          ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 128, i32 8, i1 false), !dbg !2333
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tobool1 = icmp ne %struct.fd_set* %write, null, !dbg !2335
  br i1 %tobool1, label %if.then2, label %if.else3, !dbg !2335

if.then2:                                         ; preds = %if.end
  %7 = bitcast %struct.fd_set* %write to i8*, !dbg !2337
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %7, i64 128, i32 8, i1 false), !dbg !2337, !tbaa.struct !2330
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 128, i32 1, i1 false), !dbg !2339
  br label %if.end4, !dbg !2340

if.else3:                                         ; preds = %if.end
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 128, i32 8, i1 false), !dbg !2341
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %tobool5 = icmp ne %struct.fd_set* %except, null, !dbg !2343
  br i1 %tobool5, label %if.then6, label %if.else7, !dbg !2343

if.then6:                                         ; preds = %if.end4
  %8 = bitcast %struct.fd_set* %except to i8*, !dbg !2345
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %8, i64 128, i32 8, i1 false), !dbg !2345, !tbaa.struct !2330
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 128, i32 1, i1 false), !dbg !2347
  br label %if.end8, !dbg !2348

if.else7:                                         ; preds = %if.end4
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 128, i32 8, i1 false), !dbg !2349
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 128, i32 8, i1 false), !dbg !2351
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 128, i32 8, i1 false), !dbg !2352
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 128, i32 8, i1 false), !dbg !2353
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !586), !dbg !2354
  %cmp367 = icmp sgt i32 %nfds, 0, !dbg !2354
  br i1 %cmp367, label %for.body, label %cleanup, !dbg !2354

for.body:                                         ; preds = %if.end8, %for.inc
  %indvars.iv373 = phi i64 [ %indvars.iv.next374, %for.inc ], [ 0, %if.end8 ]
  %count.0369 = phi i32 [ %count.1, %for.inc ], [ 0, %if.end8 ]
  %os_nfds.0368 = phi i32 [ %os_nfds.1, %for.inc ], [ 0, %if.end8 ]
  %9 = trunc i64 %indvars.iv373 to i32, !dbg !2355
  %div = sdiv i32 %9, 64, !dbg !2355
  %idxprom = sext i32 %div to i64, !dbg !2355
  %arrayidx = getelementptr inbounds %struct.fd_set* %in_read, i64 0, i32 0, i64 %idxprom, !dbg !2355
  %10 = load i64* %arrayidx, align 8, !dbg !2355, !tbaa !2167
  %rem347 = and i32 %9, 63, !dbg !2355
  %shl = shl i32 1, %rem347, !dbg !2355
  %conv = sext i32 %shl to i64, !dbg !2355
  %and = and i64 %10, %conv, !dbg !2355
  %tobool9 = icmp eq i64 %and, 0, !dbg !2355
  br i1 %tobool9, label %lor.lhs.false, label %if.then29, !dbg !2355

lor.lhs.false:                                    ; preds = %for.body
  %arrayidx13 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %idxprom, !dbg !2355
  %11 = load i64* %arrayidx13, align 8, !dbg !2355, !tbaa !2167
  %and17 = and i64 %11, %conv, !dbg !2355
  %tobool18 = icmp eq i64 %and17, 0, !dbg !2355
  br i1 %tobool18, label %lor.lhs.false19, label %if.then29, !dbg !2355

lor.lhs.false19:                                  ; preds = %lor.lhs.false
  %arrayidx23 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %idxprom, !dbg !2355
  %12 = load i64* %arrayidx23, align 8, !dbg !2355, !tbaa !2167
  %and27 = and i64 %12, %conv, !dbg !2355
  %tobool28 = icmp eq i64 %and27, 0, !dbg !2355
  br i1 %tobool28, label %for.inc, label %if.then29, !dbg !2355

if.then29:                                        ; preds = %lor.lhs.false19, %lor.lhs.false, %for.body
  tail call void @llvm.dbg.value(metadata !2356, i64 0, metadata !2357), !dbg !2359
  %13 = icmp ult i32 %9, 32, !dbg !2360
  br i1 %13, label %if.then.i, label %if.then31, !dbg !2360

if.then.i:                                        ; preds = %if.then29
  %flags.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv373, i32 1, !dbg !2361
  %14 = load i32* %flags.i, align 4, !dbg !2361, !tbaa !765
  %and.i = and i32 %14, 1, !dbg !2361
  %tobool.i = icmp eq i32 %and.i, 0, !dbg !2361
  br i1 %tobool.i, label %if.then31, label %__get_file.exit, !dbg !2361

__get_file.exit:                                  ; preds = %if.then.i
  %arrayidx.i = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv373, !dbg !2362
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i}, i64 0, metadata !589), !dbg !2358
  %tobool30 = icmp eq %struct.exe_file_t* %arrayidx.i, null, !dbg !2363
  br i1 %tobool30, label %if.then31, label %if.else33, !dbg !2363

if.then31:                                        ; preds = %if.then29, %if.then.i, %__get_file.exit
  %call32 = call i32* @__errno_location() #1, !dbg !2365
  store i32 9, i32* %call32, align 4, !dbg !2365, !tbaa !752
  br label %cleanup, !dbg !2367

if.else33:                                        ; preds = %__get_file.exit
  %dfile = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv373, i32 3, !dbg !2368
  %15 = load %struct.exe_disk_file_t** %dfile, align 8, !dbg !2368, !tbaa !788
  %tobool34 = icmp eq %struct.exe_disk_file_t* %15, null, !dbg !2368
  %tobool44 = icmp ne i64 %and, 0, !dbg !2370
  br i1 %tobool34, label %if.else92, label %if.then35, !dbg !2368

if.then35:                                        ; preds = %if.else33
  br i1 %tobool44, label %if.then45, label %if.end53, !dbg !2370

if.then45:                                        ; preds = %if.then35
  %arrayidx52 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %idxprom, !dbg !2370
  %16 = load i64* %arrayidx52, align 8, !dbg !2370, !tbaa !2167
  %or = or i64 %16, %conv, !dbg !2370
  store i64 %or, i64* %arrayidx52, align 8, !dbg !2370, !tbaa !2167
  br label %if.end53, !dbg !2370

if.end53:                                         ; preds = %if.then45, %if.then35
  %arrayidx57 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %idxprom, !dbg !2373
  %17 = load i64* %arrayidx57, align 8, !dbg !2373, !tbaa !2167
  %and61 = and i64 %17, %conv, !dbg !2373
  %tobool62 = icmp eq i64 %and61, 0, !dbg !2373
  br i1 %tobool62, label %if.end72, label %if.then63, !dbg !2373

if.then63:                                        ; preds = %if.end53
  %arrayidx70 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %idxprom, !dbg !2373
  %18 = load i64* %arrayidx70, align 8, !dbg !2373, !tbaa !2167
  %or71 = or i64 %18, %conv, !dbg !2373
  store i64 %or71, i64* %arrayidx70, align 8, !dbg !2373, !tbaa !2167
  br label %if.end72, !dbg !2373

if.end72:                                         ; preds = %if.end53, %if.then63
  %arrayidx76 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %idxprom, !dbg !2375
  %19 = load i64* %arrayidx76, align 8, !dbg !2375, !tbaa !2167
  %and80 = and i64 %19, %conv, !dbg !2375
  %tobool81 = icmp eq i64 %and80, 0, !dbg !2375
  br i1 %tobool81, label %if.end91, label %if.then82, !dbg !2375

if.then82:                                        ; preds = %if.end72
  %arrayidx89 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %idxprom, !dbg !2375
  %20 = load i64* %arrayidx89, align 8, !dbg !2375, !tbaa !2167
  %or90 = or i64 %20, %conv, !dbg !2375
  store i64 %or90, i64* %arrayidx89, align 8, !dbg !2375, !tbaa !2167
  br label %if.end91, !dbg !2375

if.end91:                                         ; preds = %if.end72, %if.then82
  %inc = add nsw i32 %count.0369, 1, !dbg !2377
  call void @llvm.dbg.value(metadata !{i32 %inc}, i64 0, metadata !587), !dbg !2377
  br label %for.inc, !dbg !2378

if.else92:                                        ; preds = %if.else33
  br i1 %tobool44, label %if.then102, label %if.end112, !dbg !2379

if.then102:                                       ; preds = %if.else92
  %fd = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !2379
  %21 = load i32* %fd, align 8, !dbg !2379, !tbaa !855
  %rem103350 = and i32 %21, 63, !dbg !2379
  %shl104 = shl i32 1, %rem103350, !dbg !2379
  %conv105 = sext i32 %shl104 to i64, !dbg !2379
  %div107 = sdiv i32 %21, 64, !dbg !2379
  %idxprom108 = sext i32 %div107 to i64, !dbg !2379
  %arrayidx110 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %idxprom108, !dbg !2379
  %22 = load i64* %arrayidx110, align 8, !dbg !2379, !tbaa !2167
  %or111 = or i64 %conv105, %22, !dbg !2379
  store i64 %or111, i64* %arrayidx110, align 8, !dbg !2379, !tbaa !2167
  br label %if.end112, !dbg !2379

if.end112:                                        ; preds = %if.then102, %if.else92
  %arrayidx116 = getelementptr inbounds %struct.fd_set* %in_write, i64 0, i32 0, i64 %idxprom, !dbg !2382
  %23 = load i64* %arrayidx116, align 8, !dbg !2382, !tbaa !2167
  %and120 = and i64 %23, %conv, !dbg !2382
  %tobool121 = icmp eq i64 %and120, 0, !dbg !2382
  br i1 %tobool121, label %if.end133, label %if.then122, !dbg !2382

if.then122:                                       ; preds = %if.end112
  %fd123 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0, !dbg !2382
  %24 = load i32* %fd123, align 8, !dbg !2382, !tbaa !855
  %rem124349 = and i32 %24, 63, !dbg !2382
  %shl125 = shl i32 1, %rem124349, !dbg !2382
  %conv126 = sext i32 %shl125 to i64, !dbg !2382
  %div128 = sdiv i32 %24, 64, !dbg !2382
  %idxprom129 = sext i32 %div128 to i64, !dbg !2382
  %arrayidx131 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %idxprom129, !dbg !2382
  %25 = load i64* %arrayidx131, align 8, !dbg !2382, !tbaa !2167
  %or132 = or i64 %conv126, %25, !dbg !2382
  store i64 %or132, i64* %arrayidx131, align 8, !dbg !2382, !tbaa !2167
  br label %if.end133, !dbg !2382

if.end133:                                        ; preds = %if.end112, %if.then122
  %arrayidx137 = getelementptr inbounds %struct.fd_set* %in_except, i64 0, i32 0, i64 %idxprom, !dbg !2384
  %26 = load i64* %arrayidx137, align 8, !dbg !2384, !tbaa !2167
  %and141 = and i64 %26, %conv, !dbg !2384
  %tobool142 = icmp eq i64 %and141, 0, !dbg !2384
  %fd155.phi.trans.insert = getelementptr inbounds %struct.exe_file_t* %arrayidx.i, i64 0, i32 0
  %.pre = load i32* %fd155.phi.trans.insert, align 8, !dbg !2386, !tbaa !855
  br i1 %tobool142, label %if.end154, label %if.then143, !dbg !2384

if.then143:                                       ; preds = %if.end133
  %rem145348 = and i32 %.pre, 63, !dbg !2384
  %shl146 = shl i32 1, %rem145348, !dbg !2384
  %conv147 = sext i32 %shl146 to i64, !dbg !2384
  %div149 = sdiv i32 %.pre, 64, !dbg !2384
  %idxprom150 = sext i32 %div149 to i64, !dbg !2384
  %arrayidx152 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %idxprom150, !dbg !2384
  %27 = load i64* %arrayidx152, align 8, !dbg !2384, !tbaa !2167
  %or153 = or i64 %conv147, %27, !dbg !2384
  store i64 %or153, i64* %arrayidx152, align 8, !dbg !2384, !tbaa !2167
  br label %if.end154, !dbg !2384

if.end154:                                        ; preds = %if.end133, %if.then143
  %cmp156 = icmp slt i32 %.pre, %os_nfds.0368, !dbg !2386
  %add = add nsw i32 %.pre, 1, !dbg !2386
  call void @llvm.dbg.value(metadata !{i32 %add}, i64 0, metadata !588), !dbg !2386
  %os_nfds.0.add = select i1 %cmp156, i32 %os_nfds.0368, i32 %add, !dbg !2386
  br label %for.inc, !dbg !2386

for.inc:                                          ; preds = %if.end154, %lor.lhs.false19, %if.end91
  %os_nfds.1 = phi i32 [ %os_nfds.0368, %if.end91 ], [ %os_nfds.0368, %lor.lhs.false19 ], [ %os_nfds.0.add, %if.end154 ]
  %count.1 = phi i32 [ %inc, %if.end91 ], [ %count.0369, %lor.lhs.false19 ], [ %count.0369, %if.end154 ]
  %indvars.iv.next374 = add nuw nsw i64 %indvars.iv373, 1, !dbg !2354
  %28 = trunc i64 %indvars.iv.next374 to i32, !dbg !2354
  %cmp = icmp slt i32 %28, %nfds, !dbg !2354
  br i1 %cmp, label %for.body, label %for.end, !dbg !2354

for.end:                                          ; preds = %for.inc
  %cmp165 = icmp sgt i32 %os_nfds.1, 0, !dbg !2388
  br i1 %cmp165, label %if.then167, label %cleanup, !dbg !2388

if.then167:                                       ; preds = %for.end
  call void @llvm.dbg.declare(metadata !{%struct.timeval* %tv}, metadata !594), !dbg !2389
  %29 = bitcast %struct.timeval* %tv to i8*, !dbg !2389
  call void @llvm.memset.p0i8.i64(i8* %29, i8 0, i64 16, i32 8, i1 false), !dbg !2389
  %call168 = call i64 (i64, ...)* @syscall(i64 23, i32 %os_nfds.1, %struct.fd_set* %os_read, %struct.fd_set* %os_write, %struct.fd_set* %os_except, %struct.timeval* %tv) #5, !dbg !2390
  %conv169 = trunc i64 %call168 to i32, !dbg !2390
  call void @llvm.dbg.value(metadata !{i32 %conv169}, i64 0, metadata !597), !dbg !2390
  %cmp170 = icmp eq i32 %conv169, -1, !dbg !2391
  br i1 %cmp170, label %if.then172, label %if.else178, !dbg !2391

if.then172:                                       ; preds = %if.then167
  %tobool173 = icmp eq i32 %count.1, 0, !dbg !2392
  br i1 %tobool173, label %if.then174, label %cleanup, !dbg !2392

if.then174:                                       ; preds = %if.then172
  %call175 = call i32 @klee_get_errno() #5, !dbg !2395
  %call176 = call i32* @__errno_location() #1, !dbg !2395
  store i32 %call175, i32* %call176, align 4, !dbg !2395, !tbaa !752
  br label %cleanup, !dbg !2397

if.else178:                                       ; preds = %if.then167
  %add179 = add nsw i32 %conv169, %count.1, !dbg !2398
  call void @llvm.dbg.value(metadata !{i32 %add179}, i64 0, metadata !587), !dbg !2398
  call void @llvm.dbg.value(metadata !22, i64 0, metadata !586), !dbg !2399
  br i1 %cmp367, label %for.body183, label %cleanup, !dbg !2399

for.body183:                                      ; preds = %if.else178, %for.inc260
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc260 ], [ 0, %if.else178 ]
  tail call void @llvm.dbg.value(metadata !2356, i64 0, metadata !2400), !dbg !2402
  %30 = trunc i64 %indvars.iv to i32, !dbg !2403
  %31 = icmp ult i32 %30, 32, !dbg !2403
  br i1 %31, label %if.then.i355, label %for.inc260, !dbg !2403

if.then.i355:                                     ; preds = %for.body183
  %flags.i352 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 1, !dbg !2404
  %32 = load i32* %flags.i352, align 4, !dbg !2404, !tbaa !765
  %and.i353 = and i32 %32, 1, !dbg !2404
  %tobool.i354 = icmp eq i32 %and.i353, 0, !dbg !2404
  br i1 %tobool.i354, label %for.inc260, label %__get_file.exit359, !dbg !2404

__get_file.exit359:                               ; preds = %if.then.i355
  %arrayidx.i356 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, !dbg !2405
  call void @llvm.dbg.value(metadata !{%struct.exe_file_t* %arrayidx.i356}, i64 0, metadata !598), !dbg !2401
  %tobool186 = icmp eq %struct.exe_file_t* %arrayidx.i356, null, !dbg !2406
  br i1 %tobool186, label %for.inc260, label %land.lhs.true, !dbg !2406

land.lhs.true:                                    ; preds = %__get_file.exit359
  %dfile187 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i64 0, i32 0, i64 %indvars.iv, i32 3, !dbg !2406
  %33 = load %struct.exe_disk_file_t** %dfile187, align 8, !dbg !2406, !tbaa !788
  %tobool188 = icmp eq %struct.exe_disk_file_t* %33, null, !dbg !2406
  br i1 %tobool188, label %if.then189, label %for.inc260, !dbg !2406

if.then189:                                       ; preds = %land.lhs.true
  br i1 %tobool, label %land.lhs.true191, label %if.end212, !dbg !2408

land.lhs.true191:                                 ; preds = %if.then189
  %fd192 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i356, i64 0, i32 0, !dbg !2408
  %34 = load i32* %fd192, align 8, !dbg !2408, !tbaa !855
  %div193 = sdiv i32 %34, 64, !dbg !2408
  %idxprom194 = sext i32 %div193 to i64, !dbg !2408
  %arrayidx196 = getelementptr inbounds %struct.fd_set* %os_read, i64 0, i32 0, i64 %idxprom194, !dbg !2408
  %35 = load i64* %arrayidx196, align 8, !dbg !2408, !tbaa !2167
  %rem198345 = and i32 %34, 63, !dbg !2408
  %shl199 = shl i32 1, %rem198345, !dbg !2408
  %conv200 = sext i32 %shl199 to i64, !dbg !2408
  %and201 = and i64 %conv200, %35, !dbg !2408
  %tobool202 = icmp eq i64 %and201, 0, !dbg !2408
  br i1 %tobool202, label %if.end212, label %if.then203, !dbg !2408

if.then203:                                       ; preds = %land.lhs.true191
  %rem204346 = and i32 %30, 63, !dbg !2408
  %shl205 = shl i32 1, %rem204346, !dbg !2408
  %conv206 = sext i32 %shl205 to i64, !dbg !2408
  %div207 = sdiv i32 %30, 64, !dbg !2408
  %idxprom208 = sext i32 %div207 to i64, !dbg !2408
  %arrayidx210 = getelementptr inbounds %struct.fd_set* %read, i64 0, i32 0, i64 %idxprom208, !dbg !2408
  %36 = load i64* %arrayidx210, align 8, !dbg !2408, !tbaa !2167
  %or211 = or i64 %36, %conv206, !dbg !2408
  store i64 %or211, i64* %arrayidx210, align 8, !dbg !2408, !tbaa !2167
  br label %if.end212, !dbg !2408

if.end212:                                        ; preds = %land.lhs.true191, %if.then203, %if.then189
  br i1 %tobool1, label %land.lhs.true214, label %if.end235, !dbg !2411

land.lhs.true214:                                 ; preds = %if.end212
  %fd215 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i356, i64 0, i32 0, !dbg !2411
  %37 = load i32* %fd215, align 8, !dbg !2411, !tbaa !855
  %div216 = sdiv i32 %37, 64, !dbg !2411
  %idxprom217 = sext i32 %div216 to i64, !dbg !2411
  %arrayidx219 = getelementptr inbounds %struct.fd_set* %os_write, i64 0, i32 0, i64 %idxprom217, !dbg !2411
  %38 = load i64* %arrayidx219, align 8, !dbg !2411, !tbaa !2167
  %rem221343 = and i32 %37, 63, !dbg !2411
  %shl222 = shl i32 1, %rem221343, !dbg !2411
  %conv223 = sext i32 %shl222 to i64, !dbg !2411
  %and224 = and i64 %conv223, %38, !dbg !2411
  %tobool225 = icmp eq i64 %and224, 0, !dbg !2411
  br i1 %tobool225, label %if.end235, label %if.then226, !dbg !2411

if.then226:                                       ; preds = %land.lhs.true214
  %rem227344 = and i32 %30, 63, !dbg !2411
  %shl228 = shl i32 1, %rem227344, !dbg !2411
  %conv229 = sext i32 %shl228 to i64, !dbg !2411
  %div230 = sdiv i32 %30, 64, !dbg !2411
  %idxprom231 = sext i32 %div230 to i64, !dbg !2411
  %arrayidx233 = getelementptr inbounds %struct.fd_set* %write, i64 0, i32 0, i64 %idxprom231, !dbg !2411
  %39 = load i64* %arrayidx233, align 8, !dbg !2411, !tbaa !2167
  %or234 = or i64 %39, %conv229, !dbg !2411
  store i64 %or234, i64* %arrayidx233, align 8, !dbg !2411, !tbaa !2167
  br label %if.end235, !dbg !2411

if.end235:                                        ; preds = %land.lhs.true214, %if.then226, %if.end212
  br i1 %tobool5, label %land.lhs.true237, label %for.inc260, !dbg !2413

land.lhs.true237:                                 ; preds = %if.end235
  %fd238 = getelementptr inbounds %struct.exe_file_t* %arrayidx.i356, i64 0, i32 0, !dbg !2413
  %40 = load i32* %fd238, align 8, !dbg !2413, !tbaa !855
  %div239 = sdiv i32 %40, 64, !dbg !2413
  %idxprom240 = sext i32 %div239 to i64, !dbg !2413
  %arrayidx242 = getelementptr inbounds %struct.fd_set* %os_except, i64 0, i32 0, i64 %idxprom240, !dbg !2413
  %41 = load i64* %arrayidx242, align 8, !dbg !2413, !tbaa !2167
  %rem244341 = and i32 %40, 63, !dbg !2413
  %shl245 = shl i32 1, %rem244341, !dbg !2413
  %conv246 = sext i32 %shl245 to i64, !dbg !2413
  %and247 = and i64 %conv246, %41, !dbg !2413
  %tobool248 = icmp eq i64 %and247, 0, !dbg !2413
  br i1 %tobool248, label %for.inc260, label %if.then249, !dbg !2413

if.then249:                                       ; preds = %land.lhs.true237
  %rem250342 = and i32 %30, 63, !dbg !2413
  %shl251 = shl i32 1, %rem250342, !dbg !2413
  %conv252 = sext i32 %shl251 to i64, !dbg !2413
  %div253 = sdiv i32 %30, 64, !dbg !2413
  %idxprom254 = sext i32 %div253 to i64, !dbg !2413
  %arrayidx256 = getelementptr inbounds %struct.fd_set* %except, i64 0, i32 0, i64 %idxprom254, !dbg !2413
  %42 = load i64* %arrayidx256, align 8, !dbg !2413, !tbaa !2167
  %or257 = or i64 %42, %conv252, !dbg !2413
  store i64 %or257, i64* %arrayidx256, align 8, !dbg !2413, !tbaa !2167
  br label %for.inc260, !dbg !2413

for.inc260:                                       ; preds = %for.body183, %if.then.i355, %land.lhs.true237, %land.lhs.true, %__get_file.exit359, %if.then249, %if.end235
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2399
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !2399
  %exitcond = icmp eq i32 %lftr.wideiv, %nfds, !dbg !2399
  br i1 %exitcond, label %cleanup, label %for.body183, !dbg !2399

cleanup:                                          ; preds = %for.inc260, %if.end8, %if.else178, %for.end, %if.then172, %if.then174, %if.then31
  %retval.0 = phi i32 [ -1, %if.then31 ], [ -1, %if.then174 ], [ %count.1, %if.then172 ], [ %count.1, %for.end ], [ %add179, %if.else178 ], [ 0, %if.end8 ], [ %add179, %for.inc260 ]
  call void @llvm.lifetime.end(i64 128, i8* %5) #5, !dbg !2415
  call void @llvm.lifetime.end(i64 128, i8* %4) #5, !dbg !2415
  call void @llvm.lifetime.end(i64 128, i8* %3) #5, !dbg !2415
  call void @llvm.lifetime.end(i64 128, i8* %2) #5, !dbg !2415
  call void @llvm.lifetime.end(i64 128, i8* %1) #5, !dbg !2415
  call void @llvm.lifetime.end(i64 128, i8* %0) #5, !dbg !2415
  ret i32 %retval.0, !dbg !2415
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #5

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #5

; Function Attrs: nounwind uwtable
define i8* @getcwd(i8* %buf, i64 %size) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %buf}, i64 0, metadata !607), !dbg !2416
  tail call void @llvm.dbg.value(metadata !{i64 %size}, i64 0, metadata !608), !dbg !2416
  %0 = load i32* @getcwd.n_calls, align 4, !dbg !2417, !tbaa !752
  %inc = add nsw i32 %0, 1, !dbg !2417
  store i32 %inc, i32* @getcwd.n_calls, align 4, !dbg !2417, !tbaa !752
  %1 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2418, !tbaa !1096
  %tobool = icmp eq i32 %1, 0, !dbg !2418
  br i1 %tobool, label %if.end, label %land.lhs.true, !dbg !2418

land.lhs.true:                                    ; preds = %entry
  %2 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !2418, !tbaa !2420
  %3 = load i32* %2, align 4, !dbg !2418, !tbaa !752
  %cmp = icmp eq i32 %3, %inc, !dbg !2418
  br i1 %cmp, label %if.then, label %if.end, !dbg !2418

if.then:                                          ; preds = %land.lhs.true
  %dec = add i32 %1, -1, !dbg !2421
  store i32 %dec, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !2421, !tbaa !1096
  %call = tail call i32* @__errno_location() #1, !dbg !2423
  store i32 34, i32* %call, align 4, !dbg !2423, !tbaa !752
  br label %return, !dbg !2424

if.end:                                           ; preds = %entry, %land.lhs.true
  %tobool1 = icmp eq i8* %buf, null, !dbg !2425
  br i1 %tobool1, label %if.then2, label %if.end7, !dbg !2425

if.then2:                                         ; preds = %if.end
  %tobool3 = icmp eq i64 %size, 0, !dbg !2427
  tail call void @llvm.dbg.value(metadata !2430, i64 0, metadata !608), !dbg !2431
  %.size = select i1 %tobool3, i64 1024, i64 %size, !dbg !2427
  %call6 = tail call noalias i8* @malloc(i64 %.size) #5, !dbg !2432
  tail call void @llvm.dbg.value(metadata !{i8* %call6}, i64 0, metadata !607), !dbg !2432
  br label %if.end7, !dbg !2433

if.end7:                                          ; preds = %if.end, %if.then2
  %buf.addr.0 = phi i8* [ %buf, %if.end ], [ %call6, %if.then2 ]
  %size.addr.1 = phi i64 [ %size, %if.end ], [ %.size, %if.then2 ]
  tail call void @llvm.dbg.value(metadata !{i8* %buf.addr.0}, i64 0, metadata !2434) #5, !dbg !2436
  %4 = ptrtoint i8* %buf.addr.0 to i64, !dbg !2437
  %call.i = tail call i64 @klee_get_valuel(i64 %4) #5, !dbg !2437
  %5 = inttoptr i64 %call.i to i8*, !dbg !2437
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !2438) #5, !dbg !2437
  %cmp.i = icmp eq i8* %5, %buf.addr.0, !dbg !2439
  %conv1.i = zext i1 %cmp.i to i64, !dbg !2439
  tail call void @klee_assume(i64 %conv1.i) #5, !dbg !2439
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !607), !dbg !2435
  tail call void @llvm.dbg.value(metadata !{i64 %size.addr.1}, i64 0, metadata !2440) #5, !dbg !2442
  %call.i25 = tail call i64 @klee_get_valuel(i64 %size.addr.1) #5, !dbg !2443
  tail call void @llvm.dbg.value(metadata !{i64 %call.i25}, i64 0, metadata !2444) #5, !dbg !2443
  %cmp.i26 = icmp eq i64 %call.i25, %size.addr.1, !dbg !2445
  %conv1.i27 = zext i1 %cmp.i26 to i64, !dbg !2445
  tail call void @klee_assume(i64 %conv1.i27) #5, !dbg !2445
  tail call void @llvm.dbg.value(metadata !{i64 %call.i25}, i64 0, metadata !608), !dbg !2441
  tail call void @klee_check_memory_access(i8* %5, i64 %call.i25) #5, !dbg !2446
  %call10 = tail call i64 (i64, ...)* @syscall(i64 79, i8* %5, i64 %call.i25) #5, !dbg !2447
  %conv = trunc i64 %call10 to i32, !dbg !2447
  tail call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !609), !dbg !2447
  %cmp11 = icmp eq i32 %conv, -1, !dbg !2448
  br i1 %cmp11, label %if.then13, label %return, !dbg !2448

if.then13:                                        ; preds = %if.end7
  %call14 = tail call i32 @klee_get_errno() #5, !dbg !2450
  %call15 = tail call i32* @__errno_location() #1, !dbg !2450
  store i32 %call14, i32* %call15, align 4, !dbg !2450, !tbaa !752
  br label %return, !dbg !2452

return:                                           ; preds = %if.end7, %if.then13, %if.then
  %retval.0 = phi i8* [ null, %if.then ], [ null, %if.then13 ], [ %5, %if.end7 ]
  ret i8* %retval.0, !dbg !2453
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define i32 @chroot(i8* nocapture readonly %path) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %path}, i64 0, metadata !612), !dbg !2454
  %0 = load i8* %path, align 1, !dbg !2455, !tbaa !694
  switch i8 %0, label %if.end11 [
    i8 0, label %if.then
    i8 47, label %land.lhs.true
  ], !dbg !2455

if.then:                                          ; preds = %entry
  %call = tail call i32* @__errno_location() #1, !dbg !2457
  store i32 2, i32* %call, align 4, !dbg !2457, !tbaa !752
  br label %return, !dbg !2459

land.lhs.true:                                    ; preds = %entry
  %arrayidx6 = getelementptr inbounds i8* %path, i64 1, !dbg !2460
  %1 = load i8* %arrayidx6, align 1, !dbg !2460, !tbaa !694
  %cmp8 = icmp eq i8 %1, 0, !dbg !2460
  br i1 %cmp8, label %return, label %if.end11, !dbg !2460

if.end11:                                         ; preds = %entry, %land.lhs.true
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str23, i64 0, i64 0)) #5, !dbg !2462
  %call12 = tail call i32* @__errno_location() #1, !dbg !2463
  store i32 2, i32* %call12, align 4, !dbg !2463, !tbaa !752
  br label %return, !dbg !2464

return:                                           ; preds = %land.lhs.true, %if.end11, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ -1, %if.end11 ], [ 0, %land.lhs.true ]
  ret i32 %retval.0, !dbg !2465
}

declare i64 @klee_get_valuel(i64) #3

declare void @klee_assume(i64) #3

; Function Attrs: nounwind
declare i32 @geteuid() #2

; Function Attrs: nounwind
declare i32 @getgid() #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!686, !687}
!llvm.ident = !{!688}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !22, metadata !23, metadata !678, metadata !22, metadata !""} ; [ DW_TAG_compile_unit ] [/home/joker/klee-lf/runtime/POSIX//home/joker/klee-lf/runtime/POSIX/fd.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/joker/klee-lf/runtime/POSIX/fd.c", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!2 = metadata !{metadata !3, metadata !10}
!3 = metadata !{i32 786436, metadata !4, null, metadata !"", i32 26, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 26, size 32, align 32, offset 0] [def] [from ]
!4 = metadata !{metadata !"/home/joker/klee-lf/runtime/POSIX/fd.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9}
!6 = metadata !{i32 786472, metadata !"eOpen", i64 1} ; [ DW_TAG_enumerator ] [eOpen :: 1]
!7 = metadata !{i32 786472, metadata !"eCloseOnExec", i64 2} ; [ DW_TAG_enumerator ] [eCloseOnExec :: 2]
!8 = metadata !{i32 786472, metadata !"eReadable", i64 4} ; [ DW_TAG_enumerator ] [eReadable :: 4]
!9 = metadata !{i32 786472, metadata !"eWriteable", i64 8} ; [ DW_TAG_enumerator ] [eWriteable :: 8]
!10 = metadata !{i32 786436, metadata !11, null, metadata !"", i32 97, i64 32, i64 32, i32 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_enumeration_type ] [line 97, size 32, align 32, offset 0] [def] [from ]
!11 = metadata !{metadata !"/usr/include/dirent.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21}
!13 = metadata !{i32 786472, metadata !"DT_UNKNOWN", i64 0} ; [ DW_TAG_enumerator ] [DT_UNKNOWN :: 0]
!14 = metadata !{i32 786472, metadata !"DT_FIFO", i64 1} ; [ DW_TAG_enumerator ] [DT_FIFO :: 1]
!15 = metadata !{i32 786472, metadata !"DT_CHR", i64 2} ; [ DW_TAG_enumerator ] [DT_CHR :: 2]
!16 = metadata !{i32 786472, metadata !"DT_DIR", i64 4} ; [ DW_TAG_enumerator ] [DT_DIR :: 4]
!17 = metadata !{i32 786472, metadata !"DT_BLK", i64 6} ; [ DW_TAG_enumerator ] [DT_BLK :: 6]
!18 = metadata !{i32 786472, metadata !"DT_REG", i64 8} ; [ DW_TAG_enumerator ] [DT_REG :: 8]
!19 = metadata !{i32 786472, metadata !"DT_LNK", i64 10} ; [ DW_TAG_enumerator ] [DT_LNK :: 10]
!20 = metadata !{i32 786472, metadata !"DT_SOCK", i64 12} ; [ DW_TAG_enumerator ] [DT_SOCK :: 12]
!21 = metadata !{i32 786472, metadata !"DT_WHT", i64 14} ; [ DW_TAG_enumerator ] [DT_WHT :: 14]
!22 = metadata !{i32 0}
!23 = metadata !{metadata !24, metadata !89, metadata !96, metadata !119, metadata !133, metadata !149, metadata !160, metadata !167, metadata !182, metadata !197, metadata !206, metadata !215, metadata !248, metadata !255, metadata !263, metadata !270, metadata !280, metadata !290, metadata !303, metadata !314, metadata !323, metadata !333, metadata !343, metadata !384, metadata !445, metadata !461, metadata !500, metadata !510, metadata !518, metadata !526, metadata !533, metadata !537, metadata !541, metadata !549, metadata !560, metadata !603, metadata !610, metadata !613, metadata !626, metadata !632, metadata !638, metadata !645, metadata !651, metadata !659, metadata !666}
!24 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"access", metadata !"access", metadata !"", i32 73, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @access, null, null, metadata !33, i32 73} ; [ DW_TAG_subprogram ] [line 73] [def] [access]
!25 = metadata !{metadata !"fd.c", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!26 = metadata !{i32 786473, metadata !25}        ; [ DW_TAG_file_type ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!27 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = metadata !{metadata !29, metadata !30, metadata !29}
!29 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!32 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!33 = metadata !{metadata !34, metadata !35, metadata !36, metadata !86}
!34 = metadata !{i32 786689, metadata !24, metadata !"pathname", metadata !26, i32 16777289, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 73]
!35 = metadata !{i32 786689, metadata !24, metadata !"mode", metadata !26, i32 33554505, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 73]
!36 = metadata !{i32 786688, metadata !24, metadata !"dfile", metadata !26, i32 74, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 74]
!37 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !38} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_disk_file_t]
!38 = metadata !{i32 786454, metadata !25, null, metadata !"exe_disk_file_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ] [exe_disk_file_t] [line 24, size 0, align 0, offset 0] [from ]
!39 = metadata !{i32 786451, metadata !4, null, metadata !"", i32 20, i64 192, i64 64, i32 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 20, size 192, align 64, offset 0] [def] [from ]
!40 = metadata !{metadata !41, metadata !43, metadata !45}
!41 = metadata !{i32 786445, metadata !4, metadata !39, metadata !"size", i32 21, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_member ] [size] [line 21, size 32, align 32, offset 0] [from unsigned int]
!42 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!43 = metadata !{i32 786445, metadata !4, metadata !39, metadata !"contents", i32 22, i64 64, i64 64, i64 64, i32 0, metadata !44} ; [ DW_TAG_member ] [contents] [line 22, size 64, align 64, offset 64] [from ]
!44 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!45 = metadata !{i32 786445, metadata !4, metadata !39, metadata !"stat", i32 23, i64 64, i64 64, i64 128, i32 0, metadata !46} ; [ DW_TAG_member ] [stat] [line 23, size 64, align 64, offset 128] [from ]
!46 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !47} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!47 = metadata !{i32 786451, metadata !48, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!48 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!49 = metadata !{metadata !50, metadata !53, metadata !55, metadata !57, metadata !59, metadata !61, metadata !63, metadata !64, metadata !65, metadata !68, metadata !70, metadata !72, metadata !80, metadata !81, metadata !82}
!50 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!51 = metadata !{i32 786454, metadata !48, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!52 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!53 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !54} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!54 = metadata !{i32 786454, metadata !48, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!55 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !56} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!56 = metadata !{i32 786454, metadata !48, null, metadata !"__nlink_t", i32 130, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__nlink_t] [line 130, size 0, align 0, offset 0] [from long unsigned int]
!57 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !58} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!58 = metadata !{i32 786454, metadata !48, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!59 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !60} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!60 = metadata !{i32 786454, metadata !48, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!61 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !62} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!62 = metadata !{i32 786454, metadata !48, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!63 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !29} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!64 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !51} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!65 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !66} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!66 = metadata !{i32 786454, metadata !48, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!67 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!68 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !69} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!69 = metadata !{i32 786454, metadata !48, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!70 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !71} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!71 = metadata !{i32 786454, metadata !48, null, metadata !"__blkcnt64_t", i32 159, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__blkcnt64_t] [line 159, size 0, align 0, offset 0] [from long int]
!72 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !73} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!73 = metadata !{i32 786451, metadata !74, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !75, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!74 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!75 = metadata !{metadata !76, metadata !78}
!76 = metadata !{i32 786445, metadata !74, metadata !73, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !77} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!77 = metadata !{i32 786454, metadata !74, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!78 = metadata !{i32 786445, metadata !74, metadata !73, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !79} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!79 = metadata !{i32 786454, metadata !74, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!80 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !73} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!81 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !73} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!82 = metadata !{i32 786445, metadata !48, metadata !47, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !83} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!83 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !79, metadata !84, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!84 = metadata !{metadata !85}
!85 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!86 = metadata !{i32 786688, metadata !87, metadata !"r", metadata !26, i32 81, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 81]
!87 = metadata !{i32 786443, metadata !25, metadata !88, i32 80, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!88 = metadata !{i32 786443, metadata !25, metadata !24, i32 76, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!89 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"umask", metadata !"umask", metadata !"", i32 88, metadata !90, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @umask, null, null, metadata !93, i32 88} ; [ DW_TAG_subprogram ] [line 88] [def] [umask]
!90 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !91, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!91 = metadata !{metadata !58, metadata !92}
!92 = metadata !{i32 786454, metadata !25, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !58} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!93 = metadata !{metadata !94, metadata !95}
!94 = metadata !{i32 786689, metadata !89, metadata !"mask", metadata !26, i32 16777304, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mask] [line 88]
!95 = metadata !{i32 786688, metadata !89, metadata !"r", metadata !26, i32 89, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 89]
!96 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_open", metadata !"__fd_open", metadata !"", i32 128, metadata !97, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @__fd_open, null, null, metadata !99, i32 128} ; [ DW_TAG_subprogram ] [line 128] [def] [__fd_open]
!97 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = metadata !{metadata !29, metadata !30, metadata !29, metadata !92}
!99 = metadata !{metadata !100, metadata !101, metadata !102, metadata !103, metadata !104, metadata !115, metadata !116}
!100 = metadata !{i32 786689, metadata !96, metadata !"pathname", metadata !26, i32 16777344, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 128]
!101 = metadata !{i32 786689, metadata !96, metadata !"flags", metadata !26, i32 33554560, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 128]
!102 = metadata !{i32 786689, metadata !96, metadata !"mode", metadata !26, i32 50331776, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 128]
!103 = metadata !{i32 786688, metadata !96, metadata !"df", metadata !26, i32 129, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 129]
!104 = metadata !{i32 786688, metadata !96, metadata !"f", metadata !26, i32 130, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 130]
!105 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !106} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_file_t]
!106 = metadata !{i32 786454, metadata !25, null, metadata !"exe_file_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_typedef ] [exe_file_t] [line 40, size 0, align 0, offset 0] [from ]
!107 = metadata !{i32 786451, metadata !4, null, metadata !"", i32 33, i64 192, i64 64, i32 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 33, size 192, align 64, offset 0] [def] [from ]
!108 = metadata !{metadata !109, metadata !110, metadata !111, metadata !114}
!109 = metadata !{i32 786445, metadata !4, metadata !107, metadata !"fd", i32 34, i64 32, i64 32, i64 0, i32 0, metadata !29} ; [ DW_TAG_member ] [fd] [line 34, size 32, align 32, offset 0] [from int]
!110 = metadata !{i32 786445, metadata !4, metadata !107, metadata !"flags", i32 35, i64 32, i64 32, i64 32, i32 0, metadata !42} ; [ DW_TAG_member ] [flags] [line 35, size 32, align 32, offset 32] [from unsigned int]
!111 = metadata !{i32 786445, metadata !4, metadata !107, metadata !"off", i32 38, i64 64, i64 64, i64 64, i32 0, metadata !112} ; [ DW_TAG_member ] [off] [line 38, size 64, align 64, offset 64] [from off64_t]
!112 = metadata !{i32 786454, metadata !4, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !113} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!113 = metadata !{i32 786454, metadata !4, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!114 = metadata !{i32 786445, metadata !4, metadata !107, metadata !"dfile", i32 39, i64 64, i64 64, i64 128, i32 0, metadata !37} ; [ DW_TAG_member ] [dfile] [line 39, size 64, align 64, offset 128] [from ]
!115 = metadata !{i32 786688, metadata !96, metadata !"fd", metadata !26, i32 131, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 131]
!116 = metadata !{i32 786688, metadata !117, metadata !"os_fd", metadata !26, i32 181, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_fd] [line 181]
!117 = metadata !{i32 786443, metadata !25, metadata !118, i32 180, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!118 = metadata !{i32 786443, metadata !25, metadata !96, i32 147, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!119 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_openat", metadata !"__fd_openat", metadata !"", i32 201, metadata !120, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32, i32)* @__fd_openat, null, null, metadata !122, i32 201} ; [ DW_TAG_subprogram ] [line 201] [def] [__fd_openat]
!120 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !121, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!121 = metadata !{metadata !29, metadata !29, metadata !30, metadata !29, metadata !92}
!122 = metadata !{metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !129, metadata !132}
!123 = metadata !{i32 786689, metadata !119, metadata !"basefd", metadata !26, i32 16777417, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [basefd] [line 201]
!124 = metadata !{i32 786689, metadata !119, metadata !"pathname", metadata !26, i32 33554633, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 201]
!125 = metadata !{i32 786689, metadata !119, metadata !"flags", metadata !26, i32 50331849, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 201]
!126 = metadata !{i32 786689, metadata !119, metadata !"mode", metadata !26, i32 67109065, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 201]
!127 = metadata !{i32 786688, metadata !119, metadata !"f", metadata !26, i32 202, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 202]
!128 = metadata !{i32 786688, metadata !119, metadata !"fd", metadata !26, i32 203, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 203]
!129 = metadata !{i32 786688, metadata !130, metadata !"bf", metadata !26, i32 205, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bf] [line 205]
!130 = metadata !{i32 786443, metadata !25, metadata !131, i32 204, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!131 = metadata !{i32 786443, metadata !25, metadata !119, i32 204, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!132 = metadata !{i32 786688, metadata !119, metadata !"os_fd", metadata !26, i32 236, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_fd] [line 236]
!133 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"utimes", metadata !"utimes", metadata !"", i32 256, metadata !134, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.timeval*)* @utimes, null, null, metadata !144, i32 256} ; [ DW_TAG_subprogram ] [line 256] [def] [utimes]
!134 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!135 = metadata !{metadata !29, metadata !30, metadata !136}
!136 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !137} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!137 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !138} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from timeval]
!138 = metadata !{i32 786451, metadata !139, null, metadata !"timeval", i32 30, i64 128, i64 64, i32 0, i32 0, null, metadata !140, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timeval] [line 30, size 128, align 64, offset 0] [def] [from ]
!139 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/time.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!140 = metadata !{metadata !141, metadata !142}
!141 = metadata !{i32 786445, metadata !139, metadata !138, metadata !"tv_sec", i32 32, i64 64, i64 64, i64 0, i32 0, metadata !77} ; [ DW_TAG_member ] [tv_sec] [line 32, size 64, align 64, offset 0] [from __time_t]
!142 = metadata !{i32 786445, metadata !139, metadata !138, metadata !"tv_usec", i32 33, i64 64, i64 64, i64 64, i32 0, metadata !143} ; [ DW_TAG_member ] [tv_usec] [line 33, size 64, align 64, offset 64] [from __suseconds_t]
!143 = metadata !{i32 786454, metadata !139, null, metadata !"__suseconds_t", i32 141, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__suseconds_t] [line 141, size 0, align 0, offset 0] [from long int]
!144 = metadata !{metadata !145, metadata !146, metadata !147, metadata !148}
!145 = metadata !{i32 786689, metadata !133, metadata !"path", metadata !26, i32 16777472, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 256]
!146 = metadata !{i32 786689, metadata !133, metadata !"times", metadata !26, i32 33554688, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 256]
!147 = metadata !{i32 786688, metadata !133, metadata !"dfile", metadata !26, i32 257, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 257]
!148 = metadata !{i32 786688, metadata !133, metadata !"r", metadata !26, i32 269, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 269]
!149 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"futimesat", metadata !"futimesat", metadata !"", i32 277, metadata !150, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.timeval*)* @futimesat, null, null, metadata !152, i32 277} ; [ DW_TAG_subprogram ] [line 277] [def] [futimesat]
!150 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !151, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!151 = metadata !{metadata !29, metadata !29, metadata !30, metadata !136}
!152 = metadata !{metadata !153, metadata !154, metadata !155, metadata !156, metadata !159}
!153 = metadata !{i32 786689, metadata !149, metadata !"fd", metadata !26, i32 16777493, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 277]
!154 = metadata !{i32 786689, metadata !149, metadata !"path", metadata !26, i32 33554709, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 277]
!155 = metadata !{i32 786689, metadata !149, metadata !"times", metadata !26, i32 50331925, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [times] [line 277]
!156 = metadata !{i32 786688, metadata !157, metadata !"f", metadata !26, i32 279, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 279]
!157 = metadata !{i32 786443, metadata !25, metadata !158, i32 278, i32 0, i32 49} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!158 = metadata !{i32 786443, metadata !25, metadata !149, i32 278, i32 0, i32 48} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!159 = metadata !{i32 786688, metadata !149, metadata !"r", metadata !26, i32 295, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 295]
!160 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"close", metadata !"close", metadata !"", i32 303, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @close, null, null, metadata !163, i32 303} ; [ DW_TAG_subprogram ] [line 303] [def] [close]
!161 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !162, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!162 = metadata !{metadata !29, metadata !29}
!163 = metadata !{metadata !164, metadata !165, metadata !166}
!164 = metadata !{i32 786689, metadata !160, metadata !"fd", metadata !26, i32 16777519, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 303]
!165 = metadata !{i32 786688, metadata !160, metadata !"f", metadata !26, i32 305, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 305]
!166 = metadata !{i32 786688, metadata !160, metadata !"r", metadata !26, i32 306, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 306]
!167 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"read", metadata !"read", metadata !"", i32 335, metadata !168, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @read, null, null, metadata !174, i32 335} ; [ DW_TAG_subprogram ] [line 335] [def] [read]
!168 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !169, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!169 = metadata !{metadata !170, metadata !29, metadata !172, metadata !173}
!170 = metadata !{i32 786454, metadata !25, null, metadata !"ssize_t", i32 109, i64 0, i64 0, i64 0, i32 0, metadata !171} ; [ DW_TAG_typedef ] [ssize_t] [line 109, size 0, align 0, offset 0] [from __ssize_t]
!171 = metadata !{i32 786454, metadata !25, null, metadata !"__ssize_t", i32 172, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__ssize_t] [line 172, size 0, align 0, offset 0] [from long int]
!172 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!173 = metadata !{i32 786454, metadata !25, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!174 = metadata !{metadata !175, metadata !176, metadata !177, metadata !178, metadata !179}
!175 = metadata !{i32 786689, metadata !167, metadata !"fd", metadata !26, i32 16777551, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 335]
!176 = metadata !{i32 786689, metadata !167, metadata !"buf", metadata !26, i32 33554767, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 335]
!177 = metadata !{i32 786689, metadata !167, metadata !"count", metadata !26, i32 50331983, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 335]
!178 = metadata !{i32 786688, metadata !167, metadata !"f", metadata !26, i32 337, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 337]
!179 = metadata !{i32 786688, metadata !180, metadata !"r", metadata !26, i32 364, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 364]
!180 = metadata !{i32 786443, metadata !25, metadata !181, i32 362, i32 0, i32 69} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!181 = metadata !{i32 786443, metadata !25, metadata !167, i32 362, i32 0, i32 68} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!182 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"write", metadata !"write", metadata !"", i32 403, metadata !183, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i8*, i64)* @write, null, null, metadata !187, i32 403} ; [ DW_TAG_subprogram ] [line 403] [def] [write]
!183 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !184, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!184 = metadata !{metadata !170, metadata !29, metadata !185, metadata !173}
!185 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !186} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!186 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!187 = metadata !{metadata !188, metadata !189, metadata !190, metadata !191, metadata !192, metadata !195}
!188 = metadata !{i32 786689, metadata !182, metadata !"fd", metadata !26, i32 16777619, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 403]
!189 = metadata !{i32 786689, metadata !182, metadata !"buf", metadata !26, i32 33554835, metadata !185, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 403]
!190 = metadata !{i32 786689, metadata !182, metadata !"count", metadata !26, i32 50332051, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 403]
!191 = metadata !{i32 786688, metadata !182, metadata !"f", metadata !26, i32 405, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 405]
!192 = metadata !{i32 786688, metadata !193, metadata !"r", metadata !26, i32 423, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 423]
!193 = metadata !{i32 786443, metadata !25, metadata !194, i32 422, i32 0, i32 83} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!194 = metadata !{i32 786443, metadata !25, metadata !182, i32 422, i32 0, i32 82} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!195 = metadata !{i32 786688, metadata !196, metadata !"actual_count", metadata !26, i32 448, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [actual_count] [line 448]
!196 = metadata !{i32 786443, metadata !25, metadata !194, i32 446, i32 0, i32 88} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!197 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !"", i32 475, metadata !198, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32, i64, i32)* @__fd_lseek, null, null, metadata !200, i32 475} ; [ DW_TAG_subprogram ] [line 475] [def] [__fd_lseek]
!198 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !199, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!199 = metadata !{metadata !112, metadata !29, metadata !112, metadata !29}
!200 = metadata !{metadata !201, metadata !202, metadata !203, metadata !204, metadata !205}
!201 = metadata !{i32 786689, metadata !197, metadata !"fd", metadata !26, i32 16777691, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 475]
!202 = metadata !{i32 786689, metadata !197, metadata !"offset", metadata !26, i32 33554907, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 475]
!203 = metadata !{i32 786689, metadata !197, metadata !"whence", metadata !26, i32 50332123, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [whence] [line 475]
!204 = metadata !{i32 786688, metadata !197, metadata !"new_off", metadata !26, i32 476, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_off] [line 476]
!205 = metadata !{i32 786688, metadata !197, metadata !"f", metadata !26, i32 477, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 477]
!206 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_stat", metadata !"__fd_stat", metadata !"", i32 532, metadata !207, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_stat, null, null, metadata !209, i32 532} ; [ DW_TAG_subprogram ] [line 532] [def] [__fd_stat]
!207 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !208, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!208 = metadata !{metadata !29, metadata !30, metadata !46}
!209 = metadata !{metadata !210, metadata !211, metadata !212, metadata !213}
!210 = metadata !{i32 786689, metadata !206, metadata !"path", metadata !26, i32 16777748, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 532]
!211 = metadata !{i32 786689, metadata !206, metadata !"buf", metadata !26, i32 33554964, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 532]
!212 = metadata !{i32 786688, metadata !206, metadata !"dfile", metadata !26, i32 533, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 533]
!213 = metadata !{i32 786688, metadata !214, metadata !"r", metadata !26, i32 541, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 541]
!214 = metadata !{i32 786443, metadata !25, metadata !206, i32 539, i32 0, i32 114} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!215 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fstatat", metadata !"fstatat", metadata !"", i32 551, metadata !216, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, %struct.stat*, i32)* @fstatat, null, null, metadata !238, i32 551} ; [ DW_TAG_subprogram ] [line 551] [def] [fstatat]
!216 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !217, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!217 = metadata !{metadata !29, metadata !29, metadata !30, metadata !218, metadata !29}
!218 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !219} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat]
!219 = metadata !{i32 786451, metadata !48, null, metadata !"stat", i32 46, i64 1152, i64 64, i32 0, i32 0, null, metadata !220, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat] [line 46, size 1152, align 64, offset 0] [def] [from ]
!220 = metadata !{metadata !221, metadata !222, metadata !224, metadata !225, metadata !226, metadata !227, metadata !228, metadata !229, metadata !230, metadata !231, metadata !232, metadata !234, metadata !235, metadata !236, metadata !237}
!221 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_dev", i32 48, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_member ] [st_dev] [line 48, size 64, align 64, offset 0] [from __dev_t]
!222 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_ino", i32 53, i64 64, i64 64, i64 64, i32 0, metadata !223} ; [ DW_TAG_member ] [st_ino] [line 53, size 64, align 64, offset 64] [from __ino_t]
!223 = metadata !{i32 786454, metadata !48, null, metadata !"__ino_t", i32 127, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__ino_t] [line 127, size 0, align 0, offset 0] [from long unsigned int]
!224 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_nlink", i32 61, i64 64, i64 64, i64 128, i32 0, metadata !56} ; [ DW_TAG_member ] [st_nlink] [line 61, size 64, align 64, offset 128] [from __nlink_t]
!225 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_mode", i32 62, i64 32, i64 32, i64 192, i32 0, metadata !58} ; [ DW_TAG_member ] [st_mode] [line 62, size 32, align 32, offset 192] [from __mode_t]
!226 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_uid", i32 64, i64 32, i64 32, i64 224, i32 0, metadata !60} ; [ DW_TAG_member ] [st_uid] [line 64, size 32, align 32, offset 224] [from __uid_t]
!227 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_gid", i32 65, i64 32, i64 32, i64 256, i32 0, metadata !62} ; [ DW_TAG_member ] [st_gid] [line 65, size 32, align 32, offset 256] [from __gid_t]
!228 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"__pad0", i32 67, i64 32, i64 32, i64 288, i32 0, metadata !29} ; [ DW_TAG_member ] [__pad0] [line 67, size 32, align 32, offset 288] [from int]
!229 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_rdev", i32 69, i64 64, i64 64, i64 320, i32 0, metadata !51} ; [ DW_TAG_member ] [st_rdev] [line 69, size 64, align 64, offset 320] [from __dev_t]
!230 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_size", i32 74, i64 64, i64 64, i64 384, i32 0, metadata !66} ; [ DW_TAG_member ] [st_size] [line 74, size 64, align 64, offset 384] [from __off_t]
!231 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_blksize", i32 78, i64 64, i64 64, i64 448, i32 0, metadata !69} ; [ DW_TAG_member ] [st_blksize] [line 78, size 64, align 64, offset 448] [from __blksize_t]
!232 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_blocks", i32 80, i64 64, i64 64, i64 512, i32 0, metadata !233} ; [ DW_TAG_member ] [st_blocks] [line 80, size 64, align 64, offset 512] [from __blkcnt_t]
!233 = metadata !{i32 786454, metadata !48, null, metadata !"__blkcnt_t", i32 158, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__blkcnt_t] [line 158, size 0, align 0, offset 0] [from long int]
!234 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_atim", i32 91, i64 128, i64 64, i64 576, i32 0, metadata !73} ; [ DW_TAG_member ] [st_atim] [line 91, size 128, align 64, offset 576] [from timespec]
!235 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_mtim", i32 92, i64 128, i64 64, i64 704, i32 0, metadata !73} ; [ DW_TAG_member ] [st_mtim] [line 92, size 128, align 64, offset 704] [from timespec]
!236 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"st_ctim", i32 93, i64 128, i64 64, i64 832, i32 0, metadata !73} ; [ DW_TAG_member ] [st_ctim] [line 93, size 128, align 64, offset 832] [from timespec]
!237 = metadata !{i32 786445, metadata !48, metadata !219, metadata !"__glibc_reserved", i32 106, i64 192, i64 64, i64 960, i32 0, metadata !83} ; [ DW_TAG_member ] [__glibc_reserved] [line 106, size 192, align 64, offset 960] [from ]
!238 = metadata !{metadata !239, metadata !240, metadata !241, metadata !242, metadata !243, metadata !246, metadata !247}
!239 = metadata !{i32 786689, metadata !215, metadata !"fd", metadata !26, i32 16777767, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 551]
!240 = metadata !{i32 786689, metadata !215, metadata !"path", metadata !26, i32 33554983, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 551]
!241 = metadata !{i32 786689, metadata !215, metadata !"buf", metadata !26, i32 50332199, metadata !218, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 551]
!242 = metadata !{i32 786689, metadata !215, metadata !"flags", metadata !26, i32 67109415, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 551]
!243 = metadata !{i32 786688, metadata !244, metadata !"f", metadata !26, i32 553, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 553]
!244 = metadata !{i32 786443, metadata !25, metadata !245, i32 552, i32 0, i32 117} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!245 = metadata !{i32 786443, metadata !25, metadata !215, i32 552, i32 0, i32 116} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!246 = metadata !{i32 786688, metadata !215, metadata !"dfile", metadata !26, i32 565, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 565]
!247 = metadata !{i32 786688, metadata !215, metadata !"r", metadata !26, i32 572, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 572]
!248 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !"", i32 587, metadata !207, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.stat64*)* @__fd_lstat, null, null, metadata !249, i32 587} ; [ DW_TAG_subprogram ] [line 587] [def] [__fd_lstat]
!249 = metadata !{metadata !250, metadata !251, metadata !252, metadata !253}
!250 = metadata !{i32 786689, metadata !248, metadata !"path", metadata !26, i32 16777803, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 587]
!251 = metadata !{i32 786689, metadata !248, metadata !"buf", metadata !26, i32 33555019, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 587]
!252 = metadata !{i32 786688, metadata !248, metadata !"dfile", metadata !26, i32 588, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 588]
!253 = metadata !{i32 786688, metadata !254, metadata !"r", metadata !26, i32 596, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 596]
!254 = metadata !{i32 786443, metadata !25, metadata !248, i32 594, i32 0, i32 127} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!255 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"chdir", metadata !"chdir", metadata !"", i32 606, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chdir, null, null, metadata !258, i32 606} ; [ DW_TAG_subprogram ] [line 606] [def] [chdir]
!256 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !257, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!257 = metadata !{metadata !29, metadata !30}
!258 = metadata !{metadata !259, metadata !260, metadata !261}
!259 = metadata !{i32 786689, metadata !255, metadata !"path", metadata !26, i32 16777822, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 606]
!260 = metadata !{i32 786688, metadata !255, metadata !"dfile", metadata !26, i32 607, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 607]
!261 = metadata !{i32 786688, metadata !262, metadata !"r", metadata !26, i32 617, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 617]
!262 = metadata !{i32 786443, metadata !25, metadata !255, i32 616, i32 0, i32 131} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!263 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fchdir", metadata !"fchdir", metadata !"", i32 624, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fchdir, null, null, metadata !264, i32 624} ; [ DW_TAG_subprogram ] [line 624] [def] [fchdir]
!264 = metadata !{metadata !265, metadata !266, metadata !267}
!265 = metadata !{i32 786689, metadata !263, metadata !"fd", metadata !26, i32 16777840, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 624]
!266 = metadata !{i32 786688, metadata !263, metadata !"f", metadata !26, i32 625, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 625]
!267 = metadata !{i32 786688, metadata !268, metadata !"r", metadata !26, i32 637, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 637]
!268 = metadata !{i32 786443, metadata !25, metadata !269, i32 636, i32 0, i32 137} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!269 = metadata !{i32 786443, metadata !25, metadata !263, i32 632, i32 0, i32 135} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!270 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"chmod", metadata !"chmod", metadata !"", i32 658, metadata !271, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @chmod, null, null, metadata !273, i32 658} ; [ DW_TAG_subprogram ] [line 658] [def] [chmod]
!271 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !272, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!272 = metadata !{metadata !29, metadata !30, metadata !92}
!273 = metadata !{metadata !274, metadata !275, metadata !276, metadata !277}
!274 = metadata !{i32 786689, metadata !270, metadata !"path", metadata !26, i32 16777874, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 658]
!275 = metadata !{i32 786689, metadata !270, metadata !"mode", metadata !26, i32 33555090, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 658]
!276 = metadata !{i32 786688, metadata !270, metadata !"dfile", metadata !26, i32 661, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 661]
!277 = metadata !{i32 786688, metadata !278, metadata !"r", metadata !26, i32 673, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 673]
!278 = metadata !{i32 786443, metadata !25, metadata !279, i32 672, i32 0, i32 143} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!279 = metadata !{i32 786443, metadata !25, metadata !270, i32 670, i32 0, i32 141} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!280 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fchmod", metadata !"fchmod", metadata !"", i32 680, metadata !281, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @fchmod, null, null, metadata !283, i32 680} ; [ DW_TAG_subprogram ] [line 680] [def] [fchmod]
!281 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !282, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!282 = metadata !{metadata !29, metadata !29, metadata !92}
!283 = metadata !{metadata !284, metadata !285, metadata !286, metadata !287}
!284 = metadata !{i32 786689, metadata !280, metadata !"fd", metadata !26, i32 16777896, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 680]
!285 = metadata !{i32 786689, metadata !280, metadata !"mode", metadata !26, i32 33555112, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 680]
!286 = metadata !{i32 786688, metadata !280, metadata !"f", metadata !26, i32 683, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 683]
!287 = metadata !{i32 786688, metadata !288, metadata !"r", metadata !26, i32 700, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 700]
!288 = metadata !{i32 786443, metadata !25, metadata !289, i32 699, i32 0, i32 151} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!289 = metadata !{i32 786443, metadata !25, metadata !280, i32 697, i32 0, i32 149} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!290 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"chown", metadata !"chown", metadata !"", i32 713, metadata !291, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @chown, null, null, metadata !295, i32 713} ; [ DW_TAG_subprogram ] [line 713] [def] [chown]
!291 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !292, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!292 = metadata !{metadata !29, metadata !30, metadata !293, metadata !294}
!293 = metadata !{i32 786454, metadata !25, null, metadata !"uid_t", i32 80, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ] [uid_t] [line 80, size 0, align 0, offset 0] [from __uid_t]
!294 = metadata !{i32 786454, metadata !25, null, metadata !"gid_t", i32 65, i64 0, i64 0, i64 0, i32 0, metadata !62} ; [ DW_TAG_typedef ] [gid_t] [line 65, size 0, align 0, offset 0] [from __gid_t]
!295 = metadata !{metadata !296, metadata !297, metadata !298, metadata !299, metadata !300}
!296 = metadata !{i32 786689, metadata !290, metadata !"path", metadata !26, i32 16777929, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 713]
!297 = metadata !{i32 786689, metadata !290, metadata !"owner", metadata !26, i32 33555145, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 713]
!298 = metadata !{i32 786689, metadata !290, metadata !"group", metadata !26, i32 50332361, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 713]
!299 = metadata !{i32 786688, metadata !290, metadata !"df", metadata !26, i32 714, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 714]
!300 = metadata !{i32 786688, metadata !301, metadata !"r", metadata !26, i32 719, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 719]
!301 = metadata !{i32 786443, metadata !25, metadata !302, i32 718, i32 0, i32 155} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!302 = metadata !{i32 786443, metadata !25, metadata !290, i32 716, i32 0, i32 153} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!303 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fchown", metadata !"fchown", metadata !"", i32 726, metadata !304, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i32)* @fchown, null, null, metadata !306, i32 726} ; [ DW_TAG_subprogram ] [line 726] [def] [fchown]
!304 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !305, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!305 = metadata !{metadata !29, metadata !29, metadata !293, metadata !294}
!306 = metadata !{metadata !307, metadata !308, metadata !309, metadata !310, metadata !311}
!307 = metadata !{i32 786689, metadata !303, metadata !"fd", metadata !26, i32 16777942, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 726]
!308 = metadata !{i32 786689, metadata !303, metadata !"owner", metadata !26, i32 33555158, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 726]
!309 = metadata !{i32 786689, metadata !303, metadata !"group", metadata !26, i32 50332374, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 726]
!310 = metadata !{i32 786688, metadata !303, metadata !"f", metadata !26, i32 727, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 727]
!311 = metadata !{i32 786688, metadata !312, metadata !"r", metadata !26, i32 737, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 737]
!312 = metadata !{i32 786443, metadata !25, metadata !313, i32 736, i32 0, i32 161} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!313 = metadata !{i32 786443, metadata !25, metadata !303, i32 734, i32 0, i32 159} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!314 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"lchown", metadata !"lchown", metadata !"", i32 744, metadata !291, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @lchown, null, null, metadata !315, i32 744} ; [ DW_TAG_subprogram ] [line 744] [def] [lchown]
!315 = metadata !{metadata !316, metadata !317, metadata !318, metadata !319, metadata !320}
!316 = metadata !{i32 786689, metadata !314, metadata !"path", metadata !26, i32 16777960, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 744]
!317 = metadata !{i32 786689, metadata !314, metadata !"owner", metadata !26, i32 33555176, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 744]
!318 = metadata !{i32 786689, metadata !314, metadata !"group", metadata !26, i32 50332392, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 744]
!319 = metadata !{i32 786688, metadata !314, metadata !"df", metadata !26, i32 746, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 746]
!320 = metadata !{i32 786688, metadata !321, metadata !"r", metadata !26, i32 751, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 751]
!321 = metadata !{i32 786443, metadata !25, metadata !322, i32 750, i32 0, i32 165} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!322 = metadata !{i32 786443, metadata !25, metadata !314, i32 748, i32 0, i32 163} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!323 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !"", i32 758, metadata !324, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.stat64*)* @__fd_fstat, null, null, metadata !326, i32 758} ; [ DW_TAG_subprogram ] [line 758] [def] [__fd_fstat]
!324 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !325, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!325 = metadata !{metadata !29, metadata !29, metadata !46}
!326 = metadata !{metadata !327, metadata !328, metadata !329, metadata !330}
!327 = metadata !{i32 786689, metadata !323, metadata !"fd", metadata !26, i32 16777974, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 758]
!328 = metadata !{i32 786689, metadata !323, metadata !"buf", metadata !26, i32 33555190, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 758]
!329 = metadata !{i32 786688, metadata !323, metadata !"f", metadata !26, i32 759, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 759]
!330 = metadata !{i32 786688, metadata !331, metadata !"r", metadata !26, i32 768, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 768]
!331 = metadata !{i32 786443, metadata !25, metadata !332, i32 766, i32 0, i32 170} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!332 = metadata !{i32 786443, metadata !25, metadata !323, i32 766, i32 0, i32 169} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!333 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !"", i32 781, metadata !334, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @__fd_ftruncate, null, null, metadata !336, i32 781} ; [ DW_TAG_subprogram ] [line 781] [def] [__fd_ftruncate]
!334 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !335, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!335 = metadata !{metadata !29, metadata !29, metadata !112}
!336 = metadata !{metadata !337, metadata !338, metadata !339, metadata !340}
!337 = metadata !{i32 786689, metadata !333, metadata !"fd", metadata !26, i32 16777997, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 781]
!338 = metadata !{i32 786689, metadata !333, metadata !"length", metadata !26, i32 33555213, metadata !112, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [length] [line 781]
!339 = metadata !{i32 786688, metadata !333, metadata !"f", metadata !26, i32 783, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 783]
!340 = metadata !{i32 786688, metadata !341, metadata !"r", metadata !26, i32 804, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 804]
!341 = metadata !{i32 786443, metadata !25, metadata !342, i32 802, i32 0, i32 178} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!342 = metadata !{i32 786443, metadata !25, metadata !333, i32 798, i32 0, i32 176} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!343 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !"", i32 814, metadata !344, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.dirent64*, i32)* @__fd_getdents, null, null, metadata !360, i32 814} ; [ DW_TAG_subprogram ] [line 814] [def] [__fd_getdents]
!344 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !345, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!345 = metadata !{metadata !29, metadata !42, metadata !346, metadata !42}
!346 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !347} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dirent64]
!347 = metadata !{i32 786451, metadata !348, null, metadata !"dirent64", i32 37, i64 2240, i64 64, i32 0, i32 0, null, metadata !349, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [dirent64] [line 37, size 2240, align 64, offset 0] [def] [from ]
!348 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/dirent.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!349 = metadata !{metadata !350, metadata !351, metadata !352, metadata !354, metadata !356}
!350 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_ino", i32 39, i64 64, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_member ] [d_ino] [line 39, size 64, align 64, offset 0] [from __ino64_t]
!351 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_off", i32 40, i64 64, i64 64, i64 64, i32 0, metadata !113} ; [ DW_TAG_member ] [d_off] [line 40, size 64, align 64, offset 64] [from __off64_t]
!352 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_reclen", i32 41, i64 16, i64 16, i64 128, i32 0, metadata !353} ; [ DW_TAG_member ] [d_reclen] [line 41, size 16, align 16, offset 128] [from unsigned short]
!353 = metadata !{i32 786468, null, null, metadata !"unsigned short", i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!354 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_type", i32 42, i64 8, i64 8, i64 144, i32 0, metadata !355} ; [ DW_TAG_member ] [d_type] [line 42, size 8, align 8, offset 144] [from unsigned char]
!355 = metadata !{i32 786468, null, null, metadata !"unsigned char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!356 = metadata !{i32 786445, metadata !348, metadata !347, metadata !"d_name", i32 43, i64 2048, i64 8, i64 152, i32 0, metadata !357} ; [ DW_TAG_member ] [d_name] [line 43, size 2048, align 8, offset 152] [from ]
!357 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !32, metadata !358, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!358 = metadata !{metadata !359}
!359 = metadata !{i32 786465, i64 0, i64 256}     ; [ DW_TAG_subrange_type ] [0, 255]
!360 = metadata !{metadata !361, metadata !362, metadata !363, metadata !364, metadata !365, metadata !370, metadata !371, metadata !372, metadata !375, metadata !377, metadata !378, metadata !379, metadata !382}
!361 = metadata !{i32 786689, metadata !343, metadata !"fd", metadata !26, i32 16778030, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 814]
!362 = metadata !{i32 786689, metadata !343, metadata !"dirp", metadata !26, i32 33555246, metadata !346, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirp] [line 814]
!363 = metadata !{i32 786689, metadata !343, metadata !"count", metadata !26, i32 50332462, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 814]
!364 = metadata !{i32 786688, metadata !343, metadata !"f", metadata !26, i32 815, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 815]
!365 = metadata !{i32 786688, metadata !366, metadata !"i", metadata !26, i32 829, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 829]
!366 = metadata !{i32 786443, metadata !25, metadata !367, i32 827, i32 0, i32 186} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!367 = metadata !{i32 786443, metadata !25, metadata !368, i32 827, i32 0, i32 185} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!368 = metadata !{i32 786443, metadata !25, metadata !369, i32 826, i32 0, i32 184} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!369 = metadata !{i32 786443, metadata !25, metadata !343, i32 822, i32 0, i32 182} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!370 = metadata !{i32 786688, metadata !366, metadata !"pad", metadata !26, i32 829, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pad] [line 829]
!371 = metadata !{i32 786688, metadata !366, metadata !"bytes", metadata !26, i32 829, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bytes] [line 829]
!372 = metadata !{i32 786688, metadata !373, metadata !"df", metadata !26, i32 839, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 839]
!373 = metadata !{i32 786443, metadata !25, metadata !374, i32 838, i32 0, i32 190} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!374 = metadata !{i32 786443, metadata !25, metadata !366, i32 838, i32 0, i32 189} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!375 = metadata !{i32 786688, metadata !376, metadata !"os_pos", metadata !26, i32 862, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_pos] [line 862]
!376 = metadata !{i32 786443, metadata !25, metadata !367, i32 861, i32 0, i32 191} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!377 = metadata !{i32 786688, metadata !376, metadata !"res", metadata !26, i32 863, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 863]
!378 = metadata !{i32 786688, metadata !376, metadata !"s", metadata !26, i32 864, metadata !112, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 864]
!379 = metadata !{i32 786688, metadata !380, metadata !"pos", metadata !26, i32 880, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 880]
!380 = metadata !{i32 786443, metadata !25, metadata !381, i32 879, i32 0, i32 194} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!381 = metadata !{i32 786443, metadata !25, metadata !376, i32 877, i32 0, i32 192} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!382 = metadata !{i32 786688, metadata !383, metadata !"dp", metadata !26, i32 886, metadata !346, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dp] [line 886]
!383 = metadata !{i32 786443, metadata !25, metadata !380, i32 885, i32 0, i32 195} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!384 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"ioctl", metadata !"ioctl", metadata !"", i32 898, metadata !385, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64, ...)* @ioctl, null, null, metadata !387, i32 898} ; [ DW_TAG_subprogram ] [line 898] [def] [ioctl]
!385 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !386, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!386 = metadata !{metadata !29, metadata !29, metadata !52}
!387 = metadata !{metadata !388, metadata !389, metadata !390, metadata !391, metadata !405, metadata !406, metadata !409, metadata !430, metadata !440, metadata !443}
!388 = metadata !{i32 786689, metadata !384, metadata !"fd", metadata !26, i32 16778114, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 898]
!389 = metadata !{i32 786689, metadata !384, metadata !"request", metadata !26, i32 33555330, metadata !52, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [request] [line 898]
!390 = metadata !{i32 786688, metadata !384, metadata !"f", metadata !26, i32 902, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 902]
!391 = metadata !{i32 786688, metadata !384, metadata !"ap", metadata !26, i32 903, metadata !392, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 903]
!392 = metadata !{i32 786454, metadata !25, null, metadata !"va_list", i32 79, i64 0, i64 0, i64 0, i32 0, metadata !393} ; [ DW_TAG_typedef ] [va_list] [line 79, size 0, align 0, offset 0] [from __gnuc_va_list]
!393 = metadata !{i32 786454, metadata !25, null, metadata !"__gnuc_va_list", i32 48, i64 0, i64 0, i64 0, i32 0, metadata !394} ; [ DW_TAG_typedef ] [__gnuc_va_list] [line 48, size 0, align 0, offset 0] [from __builtin_va_list]
!394 = metadata !{i32 786454, metadata !25, null, metadata !"__builtin_va_list", i32 903, i64 0, i64 0, i64 0, i32 0, metadata !395} ; [ DW_TAG_typedef ] [__builtin_va_list] [line 903, size 0, align 0, offset 0] [from ]
!395 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !396, metadata !403, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __va_list_tag]
!396 = metadata !{i32 786454, metadata !25, null, metadata !"__va_list_tag", i32 903, i64 0, i64 0, i64 0, i32 0, metadata !397} ; [ DW_TAG_typedef ] [__va_list_tag] [line 903, size 0, align 0, offset 0] [from __va_list_tag]
!397 = metadata !{i32 786451, metadata !1, null, metadata !"__va_list_tag", i32 903, i64 192, i64 64, i32 0, i32 0, null, metadata !398, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 903, size 192, align 64, offset 0] [def] [from ]
!398 = metadata !{metadata !399, metadata !400, metadata !401, metadata !402}
!399 = metadata !{i32 786445, metadata !1, metadata !397, metadata !"gp_offset", i32 903, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_member ] [gp_offset] [line 903, size 32, align 32, offset 0] [from unsigned int]
!400 = metadata !{i32 786445, metadata !1, metadata !397, metadata !"fp_offset", i32 903, i64 32, i64 32, i64 32, i32 0, metadata !42} ; [ DW_TAG_member ] [fp_offset] [line 903, size 32, align 32, offset 32] [from unsigned int]
!401 = metadata !{i32 786445, metadata !1, metadata !397, metadata !"overflow_arg_area", i32 903, i64 64, i64 64, i64 64, i32 0, metadata !172} ; [ DW_TAG_member ] [overflow_arg_area] [line 903, size 64, align 64, offset 64] [from ]
!402 = metadata !{i32 786445, metadata !1, metadata !397, metadata !"reg_save_area", i32 903, i64 64, i64 64, i64 128, i32 0, metadata !172} ; [ DW_TAG_member ] [reg_save_area] [line 903, size 64, align 64, offset 128] [from ]
!403 = metadata !{metadata !404}
!404 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 0]
!405 = metadata !{i32 786688, metadata !384, metadata !"buf", metadata !26, i32 904, metadata !172, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [buf] [line 904]
!406 = metadata !{i32 786688, metadata !407, metadata !"stat", metadata !26, i32 920, metadata !218, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stat] [line 920]
!407 = metadata !{i32 786443, metadata !25, metadata !408, i32 919, i32 0, i32 199} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!408 = metadata !{i32 786443, metadata !25, metadata !384, i32 919, i32 0, i32 198} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!409 = metadata !{i32 786688, metadata !410, metadata !"ts", metadata !26, i32 924, metadata !412, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ts] [line 924]
!410 = metadata !{i32 786443, metadata !25, metadata !411, i32 923, i32 0, i32 201} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!411 = metadata !{i32 786443, metadata !25, metadata !407, i32 922, i32 0, i32 200} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!412 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !413} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from termios]
!413 = metadata !{i32 786451, metadata !414, null, metadata !"termios", i32 28, i64 480, i64 32, i32 0, i32 0, null, metadata !415, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [termios] [line 28, size 480, align 32, offset 0] [def] [from ]
!414 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/termios.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!415 = metadata !{metadata !416, metadata !418, metadata !419, metadata !420, metadata !421, metadata !423, metadata !427, metadata !429}
!416 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_iflag", i32 30, i64 32, i64 32, i64 0, i32 0, metadata !417} ; [ DW_TAG_member ] [c_iflag] [line 30, size 32, align 32, offset 0] [from tcflag_t]
!417 = metadata !{i32 786454, metadata !414, null, metadata !"tcflag_t", i32 25, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [tcflag_t] [line 25, size 0, align 0, offset 0] [from unsigned int]
!418 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_oflag", i32 31, i64 32, i64 32, i64 32, i32 0, metadata !417} ; [ DW_TAG_member ] [c_oflag] [line 31, size 32, align 32, offset 32] [from tcflag_t]
!419 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_cflag", i32 32, i64 32, i64 32, i64 64, i32 0, metadata !417} ; [ DW_TAG_member ] [c_cflag] [line 32, size 32, align 32, offset 64] [from tcflag_t]
!420 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_lflag", i32 33, i64 32, i64 32, i64 96, i32 0, metadata !417} ; [ DW_TAG_member ] [c_lflag] [line 33, size 32, align 32, offset 96] [from tcflag_t]
!421 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_line", i32 34, i64 8, i64 8, i64 128, i32 0, metadata !422} ; [ DW_TAG_member ] [c_line] [line 34, size 8, align 8, offset 128] [from cc_t]
!422 = metadata !{i32 786454, metadata !414, null, metadata !"cc_t", i32 23, i64 0, i64 0, i64 0, i32 0, metadata !355} ; [ DW_TAG_typedef ] [cc_t] [line 23, size 0, align 0, offset 0] [from unsigned char]
!423 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_cc", i32 35, i64 256, i64 8, i64 136, i32 0, metadata !424} ; [ DW_TAG_member ] [c_cc] [line 35, size 256, align 8, offset 136] [from ]
!424 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 8, i32 0, i32 0, metadata !422, metadata !425, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 8, offset 0] [from cc_t]
!425 = metadata !{metadata !426}
!426 = metadata !{i32 786465, i64 0, i64 32}      ; [ DW_TAG_subrange_type ] [0, 31]
!427 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_ispeed", i32 36, i64 32, i64 32, i64 416, i32 0, metadata !428} ; [ DW_TAG_member ] [c_ispeed] [line 36, size 32, align 32, offset 416] [from speed_t]
!428 = metadata !{i32 786454, metadata !414, null, metadata !"speed_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ] [speed_t] [line 24, size 0, align 0, offset 0] [from unsigned int]
!429 = metadata !{i32 786445, metadata !414, metadata !413, metadata !"c_ospeed", i32 37, i64 32, i64 32, i64 448, i32 0, metadata !428} ; [ DW_TAG_member ] [c_ospeed] [line 37, size 32, align 32, offset 448] [from speed_t]
!430 = metadata !{i32 786688, metadata !431, metadata !"ws", metadata !26, i32 993, metadata !432, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ws] [line 993]
!431 = metadata !{i32 786443, metadata !25, metadata !411, i32 992, i32 0, i32 217} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!432 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !433} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from winsize]
!433 = metadata !{i32 786451, metadata !434, null, metadata !"winsize", i32 27, i64 64, i64 16, i32 0, i32 0, null, metadata !435, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [winsize] [line 27, size 64, align 16, offset 0] [def] [from ]
!434 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/ioctl-types.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!435 = metadata !{metadata !436, metadata !437, metadata !438, metadata !439}
!436 = metadata !{i32 786445, metadata !434, metadata !433, metadata !"ws_row", i32 29, i64 16, i64 16, i64 0, i32 0, metadata !353} ; [ DW_TAG_member ] [ws_row] [line 29, size 16, align 16, offset 0] [from unsigned short]
!437 = metadata !{i32 786445, metadata !434, metadata !433, metadata !"ws_col", i32 30, i64 16, i64 16, i64 16, i32 0, metadata !353} ; [ DW_TAG_member ] [ws_col] [line 30, size 16, align 16, offset 16] [from unsigned short]
!438 = metadata !{i32 786445, metadata !434, metadata !433, metadata !"ws_xpixel", i32 31, i64 16, i64 16, i64 32, i32 0, metadata !353} ; [ DW_TAG_member ] [ws_xpixel] [line 31, size 16, align 16, offset 32] [from unsigned short]
!439 = metadata !{i32 786445, metadata !434, metadata !433, metadata !"ws_ypixel", i32 32, i64 16, i64 16, i64 48, i32 0, metadata !353} ; [ DW_TAG_member ] [ws_ypixel] [line 32, size 16, align 16, offset 48] [from unsigned short]
!440 = metadata !{i32 786688, metadata !441, metadata !"res", metadata !26, i32 1016, metadata !442, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 1016]
!441 = metadata !{i32 786443, metadata !25, metadata !411, i32 1015, i32 0, i32 225} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!442 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!443 = metadata !{i32 786688, metadata !444, metadata !"r", metadata !26, i32 1041, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1041]
!444 = metadata !{i32 786443, metadata !25, metadata !408, i32 1040, i32 0, i32 233} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!445 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fcntl", metadata !"fcntl", metadata !"", i32 1048, metadata !446, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, ...)* @fcntl, null, null, metadata !448, i32 1048} ; [ DW_TAG_subprogram ] [line 1048] [def] [fcntl]
!446 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !447, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!447 = metadata !{metadata !29, metadata !29, metadata !29}
!448 = metadata !{metadata !449, metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !459}
!449 = metadata !{i32 786689, metadata !445, metadata !"fd", metadata !26, i32 16778264, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1048]
!450 = metadata !{i32 786689, metadata !445, metadata !"cmd", metadata !26, i32 33555480, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cmd] [line 1048]
!451 = metadata !{i32 786688, metadata !445, metadata !"f", metadata !26, i32 1049, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1049]
!452 = metadata !{i32 786688, metadata !445, metadata !"ap", metadata !26, i32 1050, metadata !392, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ap] [line 1050]
!453 = metadata !{i32 786688, metadata !445, metadata !"arg", metadata !26, i32 1051, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arg] [line 1051]
!454 = metadata !{i32 786688, metadata !455, metadata !"flags", metadata !26, i32 1070, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flags] [line 1070]
!455 = metadata !{i32 786443, metadata !25, metadata !456, i32 1069, i32 0, i32 243} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!456 = metadata !{i32 786443, metadata !25, metadata !457, i32 1068, i32 0, i32 242} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!457 = metadata !{i32 786443, metadata !25, metadata !458, i32 1067, i32 0, i32 241} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!458 = metadata !{i32 786443, metadata !25, metadata !445, i32 1067, i32 0, i32 240} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!459 = metadata !{i32 786688, metadata !460, metadata !"r", metadata !26, i32 1096, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1096]
!460 = metadata !{i32 786443, metadata !25, metadata !458, i32 1095, i32 0, i32 248} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!461 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !"", i32 1103, metadata !462, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.statfs*)* @__fd_statfs, null, null, metadata !494, i32 1103} ; [ DW_TAG_subprogram ] [line 1103] [def] [__fd_statfs]
!462 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !463, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!463 = metadata !{metadata !29, metadata !30, metadata !464}
!464 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !465} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from statfs]
!465 = metadata !{i32 786451, metadata !466, null, metadata !"statfs", i32 24, i64 960, i64 64, i32 0, i32 0, null, metadata !467, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [statfs] [line 24, size 960, align 64, offset 0] [def] [from ]
!466 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/statfs.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!467 = metadata !{metadata !468, metadata !470, metadata !471, metadata !473, metadata !474, metadata !475, metadata !477, metadata !478, metadata !487, metadata !488, metadata !489, metadata !490}
!468 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_type", i32 26, i64 64, i64 64, i64 0, i32 0, metadata !469} ; [ DW_TAG_member ] [f_type] [line 26, size 64, align 64, offset 0] [from __fsword_t]
!469 = metadata !{i32 786454, metadata !466, null, metadata !"__fsword_t", i32 170, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__fsword_t] [line 170, size 0, align 0, offset 0] [from long int]
!470 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_bsize", i32 27, i64 64, i64 64, i64 64, i32 0, metadata !469} ; [ DW_TAG_member ] [f_bsize] [line 27, size 64, align 64, offset 64] [from __fsword_t]
!471 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_blocks", i32 29, i64 64, i64 64, i64 128, i32 0, metadata !472} ; [ DW_TAG_member ] [f_blocks] [line 29, size 64, align 64, offset 128] [from __fsblkcnt_t]
!472 = metadata !{i32 786454, metadata !466, null, metadata !"__fsblkcnt_t", i32 162, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__fsblkcnt_t] [line 162, size 0, align 0, offset 0] [from long unsigned int]
!473 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_bfree", i32 30, i64 64, i64 64, i64 192, i32 0, metadata !472} ; [ DW_TAG_member ] [f_bfree] [line 30, size 64, align 64, offset 192] [from __fsblkcnt_t]
!474 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_bavail", i32 31, i64 64, i64 64, i64 256, i32 0, metadata !472} ; [ DW_TAG_member ] [f_bavail] [line 31, size 64, align 64, offset 256] [from __fsblkcnt_t]
!475 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_files", i32 32, i64 64, i64 64, i64 320, i32 0, metadata !476} ; [ DW_TAG_member ] [f_files] [line 32, size 64, align 64, offset 320] [from __fsfilcnt_t]
!476 = metadata !{i32 786454, metadata !466, null, metadata !"__fsfilcnt_t", i32 166, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [__fsfilcnt_t] [line 166, size 0, align 0, offset 0] [from long unsigned int]
!477 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_ffree", i32 33, i64 64, i64 64, i64 384, i32 0, metadata !476} ; [ DW_TAG_member ] [f_ffree] [line 33, size 64, align 64, offset 384] [from __fsfilcnt_t]
!478 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_fsid", i32 41, i64 64, i64 32, i64 448, i32 0, metadata !479} ; [ DW_TAG_member ] [f_fsid] [line 41, size 64, align 32, offset 448] [from __fsid_t]
!479 = metadata !{i32 786454, metadata !466, null, metadata !"__fsid_t", i32 134, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_typedef ] [__fsid_t] [line 134, size 0, align 0, offset 0] [from ]
!480 = metadata !{i32 786451, metadata !481, null, metadata !"", i32 134, i64 64, i64 32, i32 0, i32 0, null, metadata !482, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 134, size 64, align 32, offset 0] [def] [from ]
!481 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/types.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!482 = metadata !{metadata !483}
!483 = metadata !{i32 786445, metadata !481, metadata !480, metadata !"__val", i32 134, i64 64, i64 32, i64 0, i32 0, metadata !484} ; [ DW_TAG_member ] [__val] [line 134, size 64, align 32, offset 0] [from ]
!484 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 64, i64 32, i32 0, i32 0, metadata !29, metadata !485, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!485 = metadata !{metadata !486}
!486 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 1]
!487 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_namelen", i32 42, i64 64, i64 64, i64 512, i32 0, metadata !469} ; [ DW_TAG_member ] [f_namelen] [line 42, size 64, align 64, offset 512] [from __fsword_t]
!488 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_frsize", i32 43, i64 64, i64 64, i64 576, i32 0, metadata !469} ; [ DW_TAG_member ] [f_frsize] [line 43, size 64, align 64, offset 576] [from __fsword_t]
!489 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_flags", i32 44, i64 64, i64 64, i64 640, i32 0, metadata !469} ; [ DW_TAG_member ] [f_flags] [line 44, size 64, align 64, offset 640] [from __fsword_t]
!490 = metadata !{i32 786445, metadata !466, metadata !465, metadata !"f_spare", i32 45, i64 256, i64 64, i64 704, i32 0, metadata !491} ; [ DW_TAG_member ] [f_spare] [line 45, size 256, align 64, offset 704] [from ]
!491 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 256, i64 64, i32 0, i32 0, metadata !469, metadata !492, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from __fsword_t]
!492 = metadata !{metadata !493}
!493 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ] [0, 3]
!494 = metadata !{metadata !495, metadata !496, metadata !497, metadata !498}
!495 = metadata !{i32 786689, metadata !461, metadata !"path", metadata !26, i32 16778319, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1103]
!496 = metadata !{i32 786689, metadata !461, metadata !"buf", metadata !26, i32 33555535, metadata !464, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1103]
!497 = metadata !{i32 786688, metadata !461, metadata !"dfile", metadata !26, i32 1104, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1104]
!498 = metadata !{i32 786688, metadata !499, metadata !"r", metadata !26, i32 1113, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1113]
!499 = metadata !{i32 786443, metadata !25, metadata !461, i32 1112, i32 0, i32 252} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!500 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fstatfs", metadata !"fstatfs", metadata !"", i32 1120, metadata !501, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.statfs*)* @fstatfs, null, null, metadata !503, i32 1120} ; [ DW_TAG_subprogram ] [line 1120] [def] [fstatfs]
!501 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !502, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!502 = metadata !{metadata !29, metadata !29, metadata !464}
!503 = metadata !{metadata !504, metadata !505, metadata !506, metadata !507}
!504 = metadata !{i32 786689, metadata !500, metadata !"fd", metadata !26, i32 16778336, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1120]
!505 = metadata !{i32 786689, metadata !500, metadata !"buf", metadata !26, i32 33555552, metadata !464, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1120]
!506 = metadata !{i32 786688, metadata !500, metadata !"f", metadata !26, i32 1121, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1121]
!507 = metadata !{i32 786688, metadata !508, metadata !"r", metadata !26, i32 1133, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1133]
!508 = metadata !{i32 786443, metadata !25, metadata !509, i32 1132, i32 0, i32 258} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!509 = metadata !{i32 786443, metadata !25, metadata !500, i32 1128, i32 0, i32 256} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!510 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"fsync", metadata !"fsync", metadata !"", i32 1140, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @fsync, null, null, metadata !511, i32 1140} ; [ DW_TAG_subprogram ] [line 1140] [def] [fsync]
!511 = metadata !{metadata !512, metadata !513, metadata !514}
!512 = metadata !{i32 786689, metadata !510, metadata !"fd", metadata !26, i32 16778356, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 1140]
!513 = metadata !{i32 786688, metadata !510, metadata !"f", metadata !26, i32 1141, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1141]
!514 = metadata !{i32 786688, metadata !515, metadata !"r", metadata !26, i32 1149, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1149]
!515 = metadata !{i32 786443, metadata !25, metadata !516, i32 1148, i32 0, i32 264} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!516 = metadata !{i32 786443, metadata !25, metadata !517, i32 1146, i32 0, i32 262} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!517 = metadata !{i32 786443, metadata !25, metadata !510, i32 1143, i32 0, i32 260} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!518 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"dup2", metadata !"dup2", metadata !"", i32 1156, metadata !446, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @dup2, null, null, metadata !519, i32 1156} ; [ DW_TAG_subprogram ] [line 1156] [def] [dup2]
!519 = metadata !{metadata !520, metadata !521, metadata !522, metadata !523}
!520 = metadata !{i32 786689, metadata !518, metadata !"oldfd", metadata !26, i32 16778372, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldfd] [line 1156]
!521 = metadata !{i32 786689, metadata !518, metadata !"newfd", metadata !26, i32 33555588, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [newfd] [line 1156]
!522 = metadata !{i32 786688, metadata !518, metadata !"f", metadata !26, i32 1157, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1157]
!523 = metadata !{i32 786688, metadata !524, metadata !"f2", metadata !26, i32 1163, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f2] [line 1163]
!524 = metadata !{i32 786443, metadata !25, metadata !525, i32 1162, i32 0, i32 268} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!525 = metadata !{i32 786443, metadata !25, metadata !518, i32 1159, i32 0, i32 266} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!526 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"dup", metadata !"dup", metadata !"", i32 1181, metadata !161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @dup, null, null, metadata !527, i32 1181} ; [ DW_TAG_subprogram ] [line 1181] [def] [dup]
!527 = metadata !{metadata !528, metadata !529, metadata !530}
!528 = metadata !{i32 786689, metadata !526, metadata !"oldfd", metadata !26, i32 16778397, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [oldfd] [line 1181]
!529 = metadata !{i32 786688, metadata !526, metadata !"f", metadata !26, i32 1182, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1182]
!530 = metadata !{i32 786688, metadata !531, metadata !"fd", metadata !26, i32 1187, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd] [line 1187]
!531 = metadata !{i32 786443, metadata !25, metadata !532, i32 1186, i32 0, i32 272} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!532 = metadata !{i32 786443, metadata !25, metadata !526, i32 1183, i32 0, i32 270} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!533 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"rmdir", metadata !"rmdir", metadata !"", i32 1200, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @rmdir, null, null, metadata !534, i32 1200} ; [ DW_TAG_subprogram ] [line 1200] [def] [rmdir]
!534 = metadata !{metadata !535, metadata !536}
!535 = metadata !{i32 786689, metadata !533, metadata !"pathname", metadata !26, i32 16778416, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1200]
!536 = metadata !{i32 786688, metadata !533, metadata !"dfile", metadata !26, i32 1201, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1201]
!537 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"unlink", metadata !"unlink", metadata !"", i32 1218, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @unlink, null, null, metadata !538, i32 1218} ; [ DW_TAG_subprogram ] [line 1218] [def] [unlink]
!538 = metadata !{metadata !539, metadata !540}
!539 = metadata !{i32 786689, metadata !537, metadata !"pathname", metadata !26, i32 16778434, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1218]
!540 = metadata !{i32 786688, metadata !537, metadata !"dfile", metadata !26, i32 1219, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1219]
!541 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"unlinkat", metadata !"unlinkat", metadata !"", i32 1239, metadata !542, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8*, i32)* @unlinkat, null, null, metadata !544, i32 1239} ; [ DW_TAG_subprogram ] [line 1239] [def] [unlinkat]
!542 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !543, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!543 = metadata !{metadata !29, metadata !29, metadata !30, metadata !29}
!544 = metadata !{metadata !545, metadata !546, metadata !547, metadata !548}
!545 = metadata !{i32 786689, metadata !541, metadata !"dirfd", metadata !26, i32 16778455, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dirfd] [line 1239]
!546 = metadata !{i32 786689, metadata !541, metadata !"pathname", metadata !26, i32 33555671, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 1239]
!547 = metadata !{i32 786689, metadata !541, metadata !"flags", metadata !26, i32 50332887, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 1239]
!548 = metadata !{i32 786688, metadata !541, metadata !"dfile", metadata !26, i32 1242, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1242]
!549 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"readlink", metadata !"readlink", metadata !"", i32 1262, metadata !550, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i8*, i8*, i64)* @readlink, null, null, metadata !552, i32 1262} ; [ DW_TAG_subprogram ] [line 1262] [def] [readlink]
!550 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !551, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!551 = metadata !{metadata !170, metadata !30, metadata !44, metadata !173}
!552 = metadata !{metadata !553, metadata !554, metadata !555, metadata !556, metadata !557}
!553 = metadata !{i32 786689, metadata !549, metadata !"path", metadata !26, i32 16778478, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1262]
!554 = metadata !{i32 786689, metadata !549, metadata !"buf", metadata !26, i32 33555694, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1262]
!555 = metadata !{i32 786689, metadata !549, metadata !"bufsize", metadata !26, i32 50332910, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bufsize] [line 1262]
!556 = metadata !{i32 786688, metadata !549, metadata !"dfile", metadata !26, i32 1263, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dfile] [line 1263]
!557 = metadata !{i32 786688, metadata !558, metadata !"r", metadata !26, i32 1279, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1279]
!558 = metadata !{i32 786443, metadata !25, metadata !559, i32 1278, i32 0, i32 306} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!559 = metadata !{i32 786443, metadata !25, metadata !549, i32 1264, i32 0, i32 297} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!560 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"select", metadata !"select", metadata !"", i32 1294, metadata !561, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*)* @select, null, null, metadata !574, i32 1295} ; [ DW_TAG_subprogram ] [line 1294] [def] [scope 1295] [select]
!561 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !562, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!562 = metadata !{metadata !29, metadata !29, metadata !563, metadata !563, metadata !563, metadata !573}
!563 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !564} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from fd_set]
!564 = metadata !{i32 786454, metadata !25, null, metadata !"fd_set", i32 75, i64 0, i64 0, i64 0, i32 0, metadata !565} ; [ DW_TAG_typedef ] [fd_set] [line 75, size 0, align 0, offset 0] [from ]
!565 = metadata !{i32 786451, metadata !566, null, metadata !"", i32 64, i64 1024, i64 64, i32 0, i32 0, null, metadata !567, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 64, size 1024, align 64, offset 0] [def] [from ]
!566 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/select.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!567 = metadata !{metadata !568}
!568 = metadata !{i32 786445, metadata !566, metadata !565, metadata !"fds_bits", i32 69, i64 1024, i64 64, i64 0, i32 0, metadata !569} ; [ DW_TAG_member ] [fds_bits] [line 69, size 1024, align 64, offset 0] [from ]
!569 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 1024, i64 64, i32 0, i32 0, metadata !570, metadata !571, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 1024, align 64, offset 0] [from __fd_mask]
!570 = metadata !{i32 786454, metadata !566, null, metadata !"__fd_mask", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !67} ; [ DW_TAG_typedef ] [__fd_mask] [line 54, size 0, align 0, offset 0] [from long int]
!571 = metadata !{metadata !572}
!572 = metadata !{i32 786465, i64 0, i64 16}      ; [ DW_TAG_subrange_type ] [0, 15]
!573 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !138} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from timeval]
!574 = metadata !{metadata !575, metadata !576, metadata !577, metadata !578, metadata !579, metadata !580, metadata !581, metadata !582, metadata !583, metadata !584, metadata !585, metadata !586, metadata !587, metadata !588, metadata !589, metadata !594, metadata !597, metadata !598}
!575 = metadata !{i32 786689, metadata !560, metadata !"nfds", metadata !26, i32 16778510, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [nfds] [line 1294]
!576 = metadata !{i32 786689, metadata !560, metadata !"read", metadata !26, i32 33555726, metadata !563, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [read] [line 1294]
!577 = metadata !{i32 786689, metadata !560, metadata !"write", metadata !26, i32 50332942, metadata !563, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [write] [line 1294]
!578 = metadata !{i32 786689, metadata !560, metadata !"except", metadata !26, i32 67110159, metadata !563, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [except] [line 1295]
!579 = metadata !{i32 786689, metadata !560, metadata !"timeout", metadata !26, i32 83887375, metadata !573, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [timeout] [line 1295]
!580 = metadata !{i32 786688, metadata !560, metadata !"in_read", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_read] [line 1296]
!581 = metadata !{i32 786688, metadata !560, metadata !"in_write", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_write] [line 1296]
!582 = metadata !{i32 786688, metadata !560, metadata !"in_except", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [in_except] [line 1296]
!583 = metadata !{i32 786688, metadata !560, metadata !"os_read", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_read] [line 1296]
!584 = metadata !{i32 786688, metadata !560, metadata !"os_write", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_write] [line 1296]
!585 = metadata !{i32 786688, metadata !560, metadata !"os_except", metadata !26, i32 1296, metadata !564, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_except] [line 1296]
!586 = metadata !{i32 786688, metadata !560, metadata !"i", metadata !26, i32 1297, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 1297]
!587 = metadata !{i32 786688, metadata !560, metadata !"count", metadata !26, i32 1297, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 1297]
!588 = metadata !{i32 786688, metadata !560, metadata !"os_nfds", metadata !26, i32 1297, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [os_nfds] [line 1297]
!589 = metadata !{i32 786688, metadata !590, metadata !"f", metadata !26, i32 1327, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1327]
!590 = metadata !{i32 786443, metadata !25, metadata !591, i32 1326, i32 0, i32 320} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!591 = metadata !{i32 786443, metadata !25, metadata !592, i32 1326, i32 0, i32 319} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!592 = metadata !{i32 786443, metadata !25, metadata !593, i32 1325, i32 0, i32 318} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!593 = metadata !{i32 786443, metadata !25, metadata !560, i32 1325, i32 0, i32 317} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!594 = metadata !{i32 786688, metadata !595, metadata !"tv", metadata !26, i32 1349, metadata !138, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tv] [line 1349]
!595 = metadata !{i32 786443, metadata !25, metadata !596, i32 1346, i32 0, i32 334} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!596 = metadata !{i32 786443, metadata !25, metadata !560, i32 1346, i32 0, i32 333} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!597 = metadata !{i32 786688, metadata !595, metadata !"r", metadata !26, i32 1350, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1350]
!598 = metadata !{i32 786688, metadata !599, metadata !"f", metadata !26, i32 1365, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 1365]
!599 = metadata !{i32 786443, metadata !25, metadata !600, i32 1364, i32 0, i32 341} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!600 = metadata !{i32 786443, metadata !25, metadata !601, i32 1364, i32 0, i32 340} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!601 = metadata !{i32 786443, metadata !25, metadata !602, i32 1360, i32 0, i32 339} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!602 = metadata !{i32 786443, metadata !25, metadata !595, i32 1353, i32 0, i32 335} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!603 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"getcwd", metadata !"getcwd", metadata !"", i32 1380, metadata !604, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i64)* @getcwd, null, null, metadata !606, i32 1380} ; [ DW_TAG_subprogram ] [line 1380] [def] [getcwd]
!604 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !605, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!605 = metadata !{metadata !44, metadata !44, metadata !173}
!606 = metadata !{metadata !607, metadata !608, metadata !609}
!607 = metadata !{i32 786689, metadata !603, metadata !"buf", metadata !26, i32 16778596, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [buf] [line 1380]
!608 = metadata !{i32 786689, metadata !603, metadata !"size", metadata !26, i32 33555812, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 1380]
!609 = metadata !{i32 786688, metadata !603, metadata !"r", metadata !26, i32 1382, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 1382]
!610 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"chroot", metadata !"chroot", metadata !"", i32 1457, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @chroot, null, null, metadata !611, i32 1457} ; [ DW_TAG_subprogram ] [line 1457] [def] [chroot]
!611 = metadata !{metadata !612}
!612 = metadata !{i32 786689, metadata !610, metadata !"path", metadata !26, i32 16778673, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [path] [line 1457]
!613 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__concretize_string", metadata !"__concretize_string", metadata !"", i32 1428, metadata !614, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !616, i32 1428} ; [ DW_TAG_subprogram ] [line 1428] [local] [def] [__concretize_string]
!614 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !615, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!615 = metadata !{metadata !30, metadata !30}
!616 = metadata !{metadata !617, metadata !618, metadata !619, metadata !620, metadata !623}
!617 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!618 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!619 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!620 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!621 = metadata !{i32 786443, metadata !25, metadata !622, i32 1432, i32 0, i32 359} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!622 = metadata !{i32 786443, metadata !25, metadata !613, i32 1432, i32 0, i32 358} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!623 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!624 = metadata !{i32 786443, metadata !25, metadata !625, i32 1441, i32 0, i32 366} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!625 = metadata !{i32 786443, metadata !25, metadata !621, i32 1434, i32 0, i32 360} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!626 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__concretize_size", metadata !"__concretize_size", metadata !"", i32 1422, metadata !627, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !629, i32 1422} ; [ DW_TAG_subprogram ] [line 1422] [local] [def] [__concretize_size]
!627 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !628, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!628 = metadata !{metadata !173, metadata !173}
!629 = metadata !{metadata !630, metadata !631}
!630 = metadata !{i32 786689, metadata !626, metadata !"s", metadata !26, i32 16778638, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!631 = metadata !{i32 786688, metadata !626, metadata !"sc", metadata !26, i32 1423, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!632 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !"", i32 1415, metadata !633, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !635, i32 1415} ; [ DW_TAG_subprogram ] [line 1415] [local] [def] [__concretize_ptr]
!633 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !634, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!634 = metadata !{metadata !172, metadata !185}
!635 = metadata !{metadata !636, metadata !637}
!636 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!637 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!638 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__df_chown", metadata !"__df_chown", metadata !"", i32 707, metadata !639, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !641, i32 707} ; [ DW_TAG_subprogram ] [line 707] [local] [def] [__df_chown]
!639 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !640, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!640 = metadata !{metadata !29, metadata !37, metadata !293, metadata !294}
!641 = metadata !{metadata !642, metadata !643, metadata !644}
!642 = metadata !{i32 786689, metadata !638, metadata !"df", metadata !26, i32 16777923, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [df] [line 707]
!643 = metadata !{i32 786689, metadata !638, metadata !"owner", metadata !26, i32 33555139, metadata !293, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!644 = metadata !{i32 786689, metadata !638, metadata !"group", metadata !26, i32 50332355, metadata !294, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [group] [line 707]
!645 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__df_chmod", metadata !"__df_chmod", metadata !"", i32 645, metadata !646, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !648, i32 645} ; [ DW_TAG_subprogram ] [line 645] [local] [def] [__df_chmod]
!646 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !647, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!647 = metadata !{metadata !29, metadata !37, metadata !92}
!648 = metadata !{metadata !649, metadata !650}
!649 = metadata !{i32 786689, metadata !645, metadata !"df", metadata !26, i32 16777861, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [df] [line 645]
!650 = metadata !{i32 786689, metadata !645, metadata !"mode", metadata !26, i32 33555077, metadata !92, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!651 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__get_file", metadata !"__get_file", metadata !"", i32 63, metadata !652, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !654, i32 63} ; [ DW_TAG_subprogram ] [line 63] [local] [def] [__get_file]
!652 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !653, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!653 = metadata !{metadata !105, metadata !29}
!654 = metadata !{metadata !655, metadata !656}
!655 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!656 = metadata !{i32 786688, metadata !657, metadata !"f", metadata !26, i32 65, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 65]
!657 = metadata !{i32 786443, metadata !25, metadata !658, i32 64, i32 0, i32 373} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!658 = metadata !{i32 786443, metadata !25, metadata !651, i32 64, i32 0, i32 372} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!659 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"has_permission", metadata !"has_permission", metadata !"", i32 97, metadata !324, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !660, i32 97} ; [ DW_TAG_subprogram ] [line 97] [local] [def] [has_permission]
!660 = metadata !{metadata !661, metadata !662, metadata !663, metadata !664, metadata !665}
!661 = metadata !{i32 786689, metadata !659, metadata !"flags", metadata !26, i32 16777313, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 97]
!662 = metadata !{i32 786689, metadata !659, metadata !"s", metadata !26, i32 33554529, metadata !46, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 97]
!663 = metadata !{i32 786688, metadata !659, metadata !"write_access", metadata !26, i32 98, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [write_access] [line 98]
!664 = metadata !{i32 786688, metadata !659, metadata !"read_access", metadata !26, i32 98, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [read_access] [line 98]
!665 = metadata !{i32 786688, metadata !659, metadata !"mode", metadata !26, i32 99, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mode] [line 99]
!666 = metadata !{i32 786478, metadata !25, metadata !26, metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !"", i32 39, metadata !667, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !669, i32 39} ; [ DW_TAG_subprogram ] [line 39] [local] [def] [__get_sym_file]
!667 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !668, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!668 = metadata !{metadata !37, metadata !30}
!669 = metadata !{metadata !670, metadata !671, metadata !672, metadata !673}
!670 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!671 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 40]
!672 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 41]
!673 = metadata !{i32 786688, metadata !674, metadata !"df", metadata !26, i32 48, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [df] [line 48]
!674 = metadata !{i32 786443, metadata !25, metadata !675, i32 47, i32 0, i32 383} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!675 = metadata !{i32 786443, metadata !25, metadata !676, i32 47, i32 0, i32 382} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!676 = metadata !{i32 786443, metadata !25, metadata !677, i32 46, i32 0, i32 381} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!677 = metadata !{i32 786443, metadata !25, metadata !666, i32 46, i32 0, i32 380} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!678 = metadata !{metadata !679, metadata !680, metadata !681, metadata !682, metadata !683, metadata !684, metadata !685}
!679 = metadata !{i32 786484, i32 0, metadata !160, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 304, metadata !29, i32 1, i32 1, i32* @close.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 304] [local] [def]
!680 = metadata !{i32 786484, i32 0, metadata !167, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 336, metadata !29, i32 1, i32 1, i32* @read.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 336] [local] [def]
!681 = metadata !{i32 786484, i32 0, metadata !182, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 404, metadata !29, i32 1, i32 1, i32* @write.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 404] [local] [def]
!682 = metadata !{i32 786484, i32 0, metadata !270, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 659, metadata !29, i32 1, i32 1, i32* @chmod.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 659] [local] [def]
!683 = metadata !{i32 786484, i32 0, metadata !280, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 681, metadata !29, i32 1, i32 1, i32* @fchmod.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 681] [local] [def]
!684 = metadata !{i32 786484, i32 0, metadata !333, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 782, metadata !29, i32 1, i32 1, i32* @__fd_ftruncate.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 782] [local] [def]
!685 = metadata !{i32 786484, i32 0, metadata !603, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !26, i32 1381, metadata !29, i32 1, i32 1, i32* @getcwd.n_calls, null} ; [ DW_TAG_variable ] [n_calls] [line 1381] [local] [def]
!686 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!687 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!688 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!689 = metadata !{i32 73, i32 0, metadata !24, null}
!690 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !691} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!691 = metadata !{i32 74, i32 0, metadata !24, null}
!692 = metadata !{i32 39, i32 0, metadata !666, metadata !691}
!693 = metadata !{i32 40, i32 0, metadata !666, metadata !691}
!694 = metadata !{metadata !695, metadata !695, i64 0}
!695 = metadata !{metadata !"omnipotent char", metadata !696, i64 0}
!696 = metadata !{metadata !"Simple C/C++ TBAA"}
!697 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !691} ; [ DW_TAG_auto_variable ] [c] [line 40]
!698 = metadata !{i32 43, i32 0, metadata !699, metadata !691}
!699 = metadata !{i32 786443, metadata !25, metadata !666, i32 43, i32 0, i32 379} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!700 = metadata !{i32 46, i32 0, metadata !677, metadata !691}
!701 = metadata !{metadata !702, metadata !703, i64 0}
!702 = metadata !{metadata !"", metadata !703, i64 0, metadata !704, i64 8, metadata !704, i64 16, metadata !703, i64 24, metadata !704, i64 32, metadata !703, i64 40, metadata !704, i64 48, metadata !704, i64 56, metadata !704, i64 64, metadata !704, i64 72, metadata !704, i64 80, metadata !704, i64 88, metadata !704, i64 96}
!703 = metadata !{metadata !"int", metadata !695, i64 0}
!704 = metadata !{metadata !"any pointer", metadata !695, i64 0}
!705 = metadata !{i32 47, i32 0, metadata !675, metadata !691}
!706 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !691} ; [ DW_TAG_auto_variable ] [i] [line 41]
!707 = metadata !{i32 48, i32 0, metadata !674, metadata !691}
!708 = metadata !{metadata !702, metadata !704, i64 32}
!709 = metadata !{i32 49, i32 0, metadata !710, metadata !691}
!710 = metadata !{i32 786443, metadata !25, metadata !674, i32 49, i32 0, i32 384} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!711 = metadata !{metadata !712, metadata !704, i64 16}
!712 = metadata !{metadata !"", metadata !703, i64 0, metadata !704, i64 8, metadata !704, i64 16}
!713 = metadata !{metadata !714, metadata !715, i64 8}
!714 = metadata !{metadata !"stat64", metadata !715, i64 0, metadata !715, i64 8, metadata !715, i64 16, metadata !703, i64 24, metadata !703, i64 28, metadata !703, i64 32, metadata !703, i64 36, metadata !715, i64 40, metadata !715, i64 48, metadata !715, i64 56, metadata !715, i64 64, metadata !716, i64 72, metadata !716, i64 88, metadata !716, i64 104, metadata !695, i64 120}
!715 = metadata !{metadata !"long", metadata !695, i64 0}
!716 = metadata !{metadata !"timespec", metadata !715, i64 0, metadata !715, i64 8}
!717 = metadata !{i32 76, i32 0, metadata !88, null}
!718 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !719} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!719 = metadata !{i32 81, i32 0, metadata !87, null}
!720 = metadata !{i32 1428, i32 0, metadata !613, metadata !719}
!721 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !722} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!722 = metadata !{i32 1429, i32 0, metadata !613, metadata !719}
!723 = metadata !{i32 1415, i32 0, metadata !632, metadata !722}
!724 = metadata !{i32 1417, i32 0, metadata !632, metadata !722}
!725 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !722} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!726 = metadata !{i32 1418, i32 0, metadata !632, metadata !722}
!727 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !719} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!728 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !719} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!729 = metadata !{i32 1432, i32 0, metadata !622, metadata !719}
!730 = metadata !{i32 1433, i32 0, metadata !621, metadata !719}
!731 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !719} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!732 = metadata !{i32 1434, i32 0, metadata !625, metadata !719}
!733 = metadata !{i32 1435, i32 0, metadata !734, metadata !719}
!734 = metadata !{i32 786443, metadata !25, metadata !735, i32 1435, i32 0, i32 362} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!735 = metadata !{i32 786443, metadata !25, metadata !625, i32 1434, i32 0, i32 361} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!736 = metadata !{i32 1436, i32 0, metadata !737, metadata !719}
!737 = metadata !{i32 786443, metadata !25, metadata !734, i32 1435, i32 0, i32 363} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!738 = metadata !{i32 1437, i32 0, metadata !737, metadata !719}
!739 = metadata !{i32 1439, i32 0, metadata !740, metadata !719}
!740 = metadata !{i32 786443, metadata !25, metadata !741, i32 1438, i32 0, i32 365} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!741 = metadata !{i32 786443, metadata !25, metadata !734, i32 1438, i32 0, i32 364} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!742 = metadata !{i32 1440, i32 0, metadata !740, metadata !719}
!743 = metadata !{i32 1442, i32 0, metadata !624, metadata !719}
!744 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !719} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!745 = metadata !{i32 1443, i32 0, metadata !624, metadata !719}
!746 = metadata !{i32 1444, i32 0, metadata !624, metadata !719}
!747 = metadata !{i32 1445, i32 0, metadata !748, metadata !719}
!748 = metadata !{i32 786443, metadata !25, metadata !624, i32 1445, i32 0, i32 367} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!749 = metadata !{i32 82, i32 0, metadata !750, null}
!750 = metadata !{i32 786443, metadata !25, metadata !87, i32 82, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!751 = metadata !{i32 83, i32 0, metadata !750, null}
!752 = metadata !{metadata !703, metadata !703, i64 0}
!753 = metadata !{i32 86, i32 0, metadata !24, null}
!754 = metadata !{i32 88, i32 0, metadata !89, null}
!755 = metadata !{i32 89, i32 0, metadata !89, null}
!756 = metadata !{metadata !757, metadata !703, i64 768}
!757 = metadata !{metadata !"", metadata !695, i64 0, metadata !703, i64 768, metadata !703, i64 772, metadata !703, i64 776}
!758 = metadata !{i32 90, i32 0, metadata !89, null}
!759 = metadata !{i32 91, i32 0, metadata !89, null}
!760 = metadata !{i32 128, i32 0, metadata !96, null}
!761 = metadata !{i32 133, i32 0, metadata !762, null}
!762 = metadata !{i32 786443, metadata !25, metadata !96, i32 133, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!763 = metadata !{i32 134, i32 0, metadata !764, null}
!764 = metadata !{i32 786443, metadata !25, metadata !762, i32 134, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!765 = metadata !{metadata !766, metadata !703, i64 4}
!766 = metadata !{metadata !"", metadata !703, i64 0, metadata !703, i64 4, metadata !715, i64 8, metadata !704, i64 16}
!767 = metadata !{i32 136, i32 0, metadata !768, null}
!768 = metadata !{i32 786443, metadata !25, metadata !96, i32 136, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!769 = metadata !{i32 137, i32 0, metadata !770, null}
!770 = metadata !{i32 786443, metadata !25, metadata !768, i32 136, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!771 = metadata !{i32 138, i32 0, metadata !770, null}
!772 = metadata !{i32 141, i32 0, metadata !96, null}
!773 = metadata !{i32 144, i32 0, metadata !96, null}
!774 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !775} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!775 = metadata !{i32 146, i32 0, metadata !96, null}
!776 = metadata !{i32 39, i32 0, metadata !666, metadata !775}
!777 = metadata !{i32 40, i32 0, metadata !666, metadata !775}
!778 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !775} ; [ DW_TAG_auto_variable ] [c] [line 40]
!779 = metadata !{i32 43, i32 0, metadata !699, metadata !775}
!780 = metadata !{i32 46, i32 0, metadata !677, metadata !775}
!781 = metadata !{i32 47, i32 0, metadata !675, metadata !775}
!782 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !775} ; [ DW_TAG_auto_variable ] [i] [line 41]
!783 = metadata !{i32 48, i32 0, metadata !674, metadata !775}
!784 = metadata !{i32 49, i32 0, metadata !710, metadata !775}
!785 = metadata !{i32 147, i32 0, metadata !118, null}
!786 = metadata !{i32 150, i32 0, metadata !787, null}
!787 = metadata !{i32 786443, metadata !25, metadata !118, i32 147, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!788 = metadata !{metadata !766, metadata !704, i64 16}
!789 = metadata !{i32 152, i32 0, metadata !790, null}
!790 = metadata !{i32 786443, metadata !25, metadata !787, i32 152, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!791 = metadata !{i32 153, i32 0, metadata !792, null}
!792 = metadata !{i32 786443, metadata !25, metadata !790, i32 152, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!793 = metadata !{i32 154, i32 0, metadata !792, null}
!794 = metadata !{i32 168, i32 0, metadata !795, null}
!795 = metadata !{i32 786443, metadata !25, metadata !796, i32 165, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!796 = metadata !{i32 786443, metadata !25, metadata !787, i32 165, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!797 = metadata !{i32 169, i32 0, metadata !795, null}
!798 = metadata !{i32 170, i32 0, metadata !795, null}
!799 = metadata !{i32 786689, metadata !659, metadata !"flags", metadata !26, i32 16777313, metadata !29, i32 0, metadata !800} ; [ DW_TAG_arg_variable ] [flags] [line 97]
!800 = metadata !{i32 173, i32 0, metadata !801, null}
!801 = metadata !{i32 786443, metadata !25, metadata !787, i32 173, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!802 = metadata !{i32 97, i32 0, metadata !659, metadata !800}
!803 = metadata !{i32 786689, metadata !659, metadata !"s", metadata !26, i32 33554529, metadata !46, i32 0, metadata !800} ; [ DW_TAG_arg_variable ] [s] [line 97]
!804 = metadata !{i32 99, i32 0, metadata !659, metadata !800}
!805 = metadata !{metadata !714, metadata !703, i64 24}
!806 = metadata !{i32 786688, metadata !659, metadata !"mode", metadata !26, i32 99, metadata !92, i32 0, metadata !800} ; [ DW_TAG_auto_variable ] [mode] [line 99]
!807 = metadata !{i32 101, i32 0, metadata !808, metadata !800}
!808 = metadata !{i32 786443, metadata !25, metadata !659, i32 101, i32 0, i32 375} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!809 = metadata !{i32 786688, metadata !659, metadata !"read_access", metadata !26, i32 98, metadata !29, i32 0, metadata !800} ; [ DW_TAG_auto_variable ] [read_access] [line 98]
!810 = metadata !{i32 103, i32 0, metadata !808, metadata !800}
!811 = metadata !{i32 786688, metadata !659, metadata !"write_access", metadata !26, i32 98, metadata !29, i32 0, metadata !800} ; [ DW_TAG_auto_variable ] [write_access] [line 98]
!812 = metadata !{i32 107, i32 0, metadata !813, metadata !800}
!813 = metadata !{i32 786443, metadata !25, metadata !659, i32 105, i32 0, i32 376} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!814 = metadata !{i32 118, i32 0, metadata !815, metadata !800}
!815 = metadata !{i32 786443, metadata !25, metadata !659, i32 118, i32 0, i32 377} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!816 = metadata !{i32 105, i32 0, metadata !813, metadata !800}
!817 = metadata !{i32 121, i32 0, metadata !818, metadata !800}
!818 = metadata !{i32 786443, metadata !25, metadata !659, i32 121, i32 0, i32 378} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!819 = metadata !{i32 174, i32 0, metadata !820, null}
!820 = metadata !{i32 786443, metadata !25, metadata !801, i32 173, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!821 = metadata !{i32 175, i32 0, metadata !820, null}
!822 = metadata !{i32 178, i32 0, metadata !801, null}
!823 = metadata !{i32 180, i32 0, metadata !787, null}
!824 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !825} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!825 = metadata !{i32 181, i32 0, metadata !117, null}
!826 = metadata !{i32 1428, i32 0, metadata !613, metadata !825}
!827 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !828} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!828 = metadata !{i32 1429, i32 0, metadata !613, metadata !825}
!829 = metadata !{i32 1415, i32 0, metadata !632, metadata !828}
!830 = metadata !{i32 1417, i32 0, metadata !632, metadata !828}
!831 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !828} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!832 = metadata !{i32 1418, i32 0, metadata !632, metadata !828}
!833 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !825} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!834 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !825} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!835 = metadata !{i32 1432, i32 0, metadata !622, metadata !825}
!836 = metadata !{i32 1433, i32 0, metadata !621, metadata !825}
!837 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !825} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!838 = metadata !{i32 1434, i32 0, metadata !625, metadata !825}
!839 = metadata !{i32 1435, i32 0, metadata !734, metadata !825}
!840 = metadata !{i32 1436, i32 0, metadata !737, metadata !825}
!841 = metadata !{i32 1437, i32 0, metadata !737, metadata !825}
!842 = metadata !{i32 1439, i32 0, metadata !740, metadata !825}
!843 = metadata !{i32 1440, i32 0, metadata !740, metadata !825}
!844 = metadata !{i32 1442, i32 0, metadata !624, metadata !825}
!845 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !825} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!846 = metadata !{i32 1443, i32 0, metadata !624, metadata !825}
!847 = metadata !{i32 1444, i32 0, metadata !624, metadata !825}
!848 = metadata !{i32 1445, i32 0, metadata !748, metadata !825}
!849 = metadata !{i32 182, i32 0, metadata !850, null}
!850 = metadata !{i32 786443, metadata !25, metadata !117, i32 182, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!851 = metadata !{i32 183, i32 0, metadata !852, null}
!852 = metadata !{i32 786443, metadata !25, metadata !850, i32 182, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!853 = metadata !{i32 184, i32 0, metadata !852, null}
!854 = metadata !{i32 186, i32 0, metadata !117, null}
!855 = metadata !{metadata !766, metadata !703, i64 0}
!856 = metadata !{i32 190, i32 0, metadata !857, null}
!857 = metadata !{i32 786443, metadata !25, metadata !96, i32 190, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!858 = metadata !{i32 189, i32 0, metadata !96, null}
!859 = metadata !{i32 191, i32 0, metadata !860, null}
!860 = metadata !{i32 786443, metadata !25, metadata !857, i32 190, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!861 = metadata !{i32 192, i32 0, metadata !860, null}
!862 = metadata !{i32 193, i32 0, metadata !863, null}
!863 = metadata !{i32 786443, metadata !25, metadata !864, i32 192, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!864 = metadata !{i32 786443, metadata !25, metadata !857, i32 192, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!865 = metadata !{i32 194, i32 0, metadata !863, null}
!866 = metadata !{i32 195, i32 0, metadata !867, null}
!867 = metadata !{i32 786443, metadata !25, metadata !864, i32 194, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!868 = metadata !{i32 199, i32 0, metadata !96, null}
!869 = metadata !{i32 201, i32 0, metadata !119, null}
!870 = metadata !{i32 204, i32 0, metadata !131, null}
!871 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !872} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!872 = metadata !{i32 205, i32 0, metadata !130, null}
!873 = metadata !{i32 63, i32 0, metadata !651, metadata !872}
!874 = metadata !{i32 64, i32 0, metadata !658, metadata !872}
!875 = metadata !{i32 65, i32 0, metadata !657, metadata !872}
!876 = metadata !{i32 66, i32 0, metadata !877, metadata !872}
!877 = metadata !{i32 786443, metadata !25, metadata !657, i32 66, i32 0, i32 374} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!878 = metadata !{i32 207, i32 0, metadata !879, null}
!879 = metadata !{i32 786443, metadata !25, metadata !130, i32 207, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!880 = metadata !{i32 208, i32 0, metadata !881, null}
!881 = metadata !{i32 786443, metadata !25, metadata !879, i32 207, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!882 = metadata !{i32 209, i32 0, metadata !881, null}
!883 = metadata !{i32 210, i32 0, metadata !884, null}
!884 = metadata !{i32 786443, metadata !25, metadata !879, i32 210, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!885 = metadata !{i32 211, i32 0, metadata !886, null}
!886 = metadata !{i32 786443, metadata !25, metadata !884, i32 210, i32 0, i32 31} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!887 = metadata !{i32 212, i32 0, metadata !886, null}
!888 = metadata !{i32 213, i32 0, metadata !886, null}
!889 = metadata !{i32 215, i32 0, metadata !130, null}
!890 = metadata !{i32 216, i32 0, metadata !130, null}
!891 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !892} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!892 = metadata !{i32 218, i32 0, metadata !893, null}
!893 = metadata !{i32 786443, metadata !25, metadata !119, i32 218, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!894 = metadata !{i32 39, i32 0, metadata !666, metadata !892}
!895 = metadata !{i32 40, i32 0, metadata !666, metadata !892}
!896 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !892} ; [ DW_TAG_auto_variable ] [c] [line 40]
!897 = metadata !{i32 43, i32 0, metadata !699, metadata !892}
!898 = metadata !{i32 46, i32 0, metadata !677, metadata !892}
!899 = metadata !{i32 47, i32 0, metadata !675, metadata !892}
!900 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !892} ; [ DW_TAG_auto_variable ] [i] [line 41]
!901 = metadata !{i32 48, i32 0, metadata !674, metadata !892}
!902 = metadata !{i32 49, i32 0, metadata !710, metadata !892}
!903 = metadata !{i32 220, i32 0, metadata !904, null}
!904 = metadata !{i32 786443, metadata !25, metadata !893, i32 218, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!905 = metadata !{i32 223, i32 0, metadata !906, null}
!906 = metadata !{i32 786443, metadata !25, metadata !119, i32 223, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!907 = metadata !{i32 224, i32 0, metadata !908, null}
!908 = metadata !{i32 786443, metadata !25, metadata !906, i32 224, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!909 = metadata !{i32 226, i32 0, metadata !910, null}
!910 = metadata !{i32 786443, metadata !25, metadata !119, i32 226, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!911 = metadata !{i32 227, i32 0, metadata !912, null}
!912 = metadata !{i32 786443, metadata !25, metadata !910, i32 226, i32 0, i32 37} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!913 = metadata !{i32 228, i32 0, metadata !912, null}
!914 = metadata !{i32 231, i32 0, metadata !119, null}
!915 = metadata !{i32 234, i32 0, metadata !119, null}
!916 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !917} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!917 = metadata !{i32 236, i32 0, metadata !119, null}
!918 = metadata !{i32 1428, i32 0, metadata !613, metadata !917}
!919 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !920} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!920 = metadata !{i32 1429, i32 0, metadata !613, metadata !917}
!921 = metadata !{i32 1415, i32 0, metadata !632, metadata !920}
!922 = metadata !{i32 1417, i32 0, metadata !632, metadata !920}
!923 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !920} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!924 = metadata !{i32 1418, i32 0, metadata !632, metadata !920}
!925 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !917} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!926 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !917} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!927 = metadata !{i32 1432, i32 0, metadata !622, metadata !917}
!928 = metadata !{i32 1433, i32 0, metadata !621, metadata !917}
!929 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !917} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!930 = metadata !{i32 1434, i32 0, metadata !625, metadata !917}
!931 = metadata !{i32 1435, i32 0, metadata !734, metadata !917}
!932 = metadata !{i32 1436, i32 0, metadata !737, metadata !917}
!933 = metadata !{i32 1437, i32 0, metadata !737, metadata !917}
!934 = metadata !{i32 1439, i32 0, metadata !740, metadata !917}
!935 = metadata !{i32 1440, i32 0, metadata !740, metadata !917}
!936 = metadata !{i32 1442, i32 0, metadata !624, metadata !917}
!937 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !917} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!938 = metadata !{i32 1443, i32 0, metadata !624, metadata !917}
!939 = metadata !{i32 1444, i32 0, metadata !624, metadata !917}
!940 = metadata !{i32 1445, i32 0, metadata !748, metadata !917}
!941 = metadata !{i32 237, i32 0, metadata !942, null}
!942 = metadata !{i32 786443, metadata !25, metadata !119, i32 237, i32 0, i32 38} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!943 = metadata !{i32 238, i32 0, metadata !944, null}
!944 = metadata !{i32 786443, metadata !25, metadata !942, i32 237, i32 0, i32 39} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!945 = metadata !{i32 239, i32 0, metadata !944, null}
!946 = metadata !{i32 242, i32 0, metadata !119, null}
!947 = metadata !{i32 243, i32 0, metadata !119, null}
!948 = metadata !{i32 244, i32 0, metadata !949, null}
!949 = metadata !{i32 786443, metadata !25, metadata !119, i32 244, i32 0, i32 40} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!950 = metadata !{i32 245, i32 0, metadata !951, null}
!951 = metadata !{i32 786443, metadata !25, metadata !949, i32 244, i32 0, i32 41} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!952 = metadata !{i32 246, i32 0, metadata !951, null}
!953 = metadata !{i32 247, i32 0, metadata !954, null}
!954 = metadata !{i32 786443, metadata !25, metadata !955, i32 246, i32 0, i32 43} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!955 = metadata !{i32 786443, metadata !25, metadata !949, i32 246, i32 0, i32 42} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!956 = metadata !{i32 248, i32 0, metadata !954, null}
!957 = metadata !{i32 249, i32 0, metadata !958, null}
!958 = metadata !{i32 786443, metadata !25, metadata !955, i32 248, i32 0, i32 44} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!959 = metadata !{i32 253, i32 0, metadata !119, null}
!960 = metadata !{i32 256, i32 0, metadata !133, null}
!961 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !962} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!962 = metadata !{i32 257, i32 0, metadata !133, null}
!963 = metadata !{i32 39, i32 0, metadata !666, metadata !962}
!964 = metadata !{i32 40, i32 0, metadata !666, metadata !962}
!965 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !962} ; [ DW_TAG_auto_variable ] [c] [line 40]
!966 = metadata !{i32 43, i32 0, metadata !699, metadata !962}
!967 = metadata !{i32 46, i32 0, metadata !677, metadata !962}
!968 = metadata !{i32 47, i32 0, metadata !675, metadata !962}
!969 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !962} ; [ DW_TAG_auto_variable ] [i] [line 41]
!970 = metadata !{i32 48, i32 0, metadata !674, metadata !962}
!971 = metadata !{i32 49, i32 0, metadata !710, metadata !962}
!972 = metadata !{i32 259, i32 0, metadata !973, null}
!973 = metadata !{i32 786443, metadata !25, metadata !133, i32 259, i32 0, i32 45} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!974 = metadata !{i32 261, i32 0, metadata !975, null}
!975 = metadata !{i32 786443, metadata !25, metadata !973, i32 259, i32 0, i32 46} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!976 = metadata !{metadata !977, metadata !715, i64 0}
!977 = metadata !{metadata !"timeval", metadata !715, i64 0, metadata !715, i64 8}
!978 = metadata !{metadata !714, metadata !715, i64 72}
!979 = metadata !{i32 262, i32 0, metadata !975, null}
!980 = metadata !{metadata !714, metadata !715, i64 88}
!981 = metadata !{i32 264, i32 0, metadata !975, null}
!982 = metadata !{metadata !714, metadata !715, i64 80}
!983 = metadata !{i32 265, i32 0, metadata !975, null}
!984 = metadata !{metadata !714, metadata !715, i64 96}
!985 = metadata !{i32 267, i32 0, metadata !975, null}
!986 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !987} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!987 = metadata !{i32 269, i32 0, metadata !133, null}
!988 = metadata !{i32 1428, i32 0, metadata !613, metadata !987}
!989 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !990} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!990 = metadata !{i32 1429, i32 0, metadata !613, metadata !987}
!991 = metadata !{i32 1415, i32 0, metadata !632, metadata !990}
!992 = metadata !{i32 1417, i32 0, metadata !632, metadata !990}
!993 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !990} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!994 = metadata !{i32 1418, i32 0, metadata !632, metadata !990}
!995 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !987} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!996 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !987} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!997 = metadata !{i32 1432, i32 0, metadata !622, metadata !987}
!998 = metadata !{i32 1433, i32 0, metadata !621, metadata !987}
!999 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !987} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1000 = metadata !{i32 1434, i32 0, metadata !625, metadata !987}
!1001 = metadata !{i32 1435, i32 0, metadata !734, metadata !987}
!1002 = metadata !{i32 1436, i32 0, metadata !737, metadata !987}
!1003 = metadata !{i32 1437, i32 0, metadata !737, metadata !987}
!1004 = metadata !{i32 1439, i32 0, metadata !740, metadata !987}
!1005 = metadata !{i32 1440, i32 0, metadata !740, metadata !987}
!1006 = metadata !{i32 1442, i32 0, metadata !624, metadata !987}
!1007 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !987} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1008 = metadata !{i32 1443, i32 0, metadata !624, metadata !987}
!1009 = metadata !{i32 1444, i32 0, metadata !624, metadata !987}
!1010 = metadata !{i32 1445, i32 0, metadata !748, metadata !987}
!1011 = metadata !{i32 270, i32 0, metadata !1012, null}
!1012 = metadata !{i32 786443, metadata !25, metadata !133, i32 270, i32 0, i32 47} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1013 = metadata !{i32 271, i32 0, metadata !1012, null}
!1014 = metadata !{i32 274, i32 0, metadata !133, null}
!1015 = metadata !{i32 277, i32 0, metadata !149, null}
!1016 = metadata !{i32 278, i32 0, metadata !158, null}
!1017 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1018} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1018 = metadata !{i32 279, i32 0, metadata !157, null}
!1019 = metadata !{i32 63, i32 0, metadata !651, metadata !1018}
!1020 = metadata !{i32 64, i32 0, metadata !658, metadata !1018}
!1021 = metadata !{i32 65, i32 0, metadata !657, metadata !1018}
!1022 = metadata !{i32 66, i32 0, metadata !877, metadata !1018}
!1023 = metadata !{i32 281, i32 0, metadata !1024, null}
!1024 = metadata !{i32 786443, metadata !25, metadata !157, i32 281, i32 0, i32 50} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1025 = metadata !{i32 282, i32 0, metadata !1026, null}
!1026 = metadata !{i32 786443, metadata !25, metadata !1024, i32 281, i32 0, i32 51} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1027 = metadata !{i32 283, i32 0, metadata !1026, null}
!1028 = metadata !{i32 284, i32 0, metadata !1029, null}
!1029 = metadata !{i32 786443, metadata !25, metadata !1024, i32 284, i32 0, i32 52} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1030 = metadata !{i32 285, i32 0, metadata !1031, null}
!1031 = metadata !{i32 786443, metadata !25, metadata !1029, i32 284, i32 0, i32 53} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1032 = metadata !{i32 286, i32 0, metadata !1031, null}
!1033 = metadata !{i32 287, i32 0, metadata !1031, null}
!1034 = metadata !{i32 289, i32 0, metadata !157, null}
!1035 = metadata !{i32 290, i32 0, metadata !157, null}
!1036 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1037} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1037 = metadata !{i32 291, i32 0, metadata !1038, null}
!1038 = metadata !{i32 786443, metadata !25, metadata !149, i32 291, i32 0, i32 54} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1039 = metadata !{i32 39, i32 0, metadata !666, metadata !1037}
!1040 = metadata !{i32 40, i32 0, metadata !666, metadata !1037}
!1041 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1037} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1042 = metadata !{i32 43, i32 0, metadata !699, metadata !1037}
!1043 = metadata !{i32 46, i32 0, metadata !677, metadata !1037}
!1044 = metadata !{i32 47, i32 0, metadata !675, metadata !1037}
!1045 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1037} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1046 = metadata !{i32 48, i32 0, metadata !674, metadata !1037}
!1047 = metadata !{i32 49, i32 0, metadata !710, metadata !1037}
!1048 = metadata !{i32 292, i32 0, metadata !1049, null}
!1049 = metadata !{i32 786443, metadata !25, metadata !1038, i32 291, i32 0, i32 55} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1050 = metadata !{i32 295, i32 0, metadata !149, null}
!1051 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1052} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1052 = metadata !{i32 296, i32 0, metadata !149, null}
!1053 = metadata !{i32 1428, i32 0, metadata !613, metadata !1052}
!1054 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1055} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1055 = metadata !{i32 1429, i32 0, metadata !613, metadata !1052}
!1056 = metadata !{i32 1415, i32 0, metadata !632, metadata !1055}
!1057 = metadata !{i32 1417, i32 0, metadata !632, metadata !1055}
!1058 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1055} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1059 = metadata !{i32 1418, i32 0, metadata !632, metadata !1055}
!1060 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1052} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1061 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1052} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1062 = metadata !{i32 1432, i32 0, metadata !622, metadata !1052}
!1063 = metadata !{i32 1433, i32 0, metadata !621, metadata !1052}
!1064 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1052} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1065 = metadata !{i32 1434, i32 0, metadata !625, metadata !1052}
!1066 = metadata !{i32 1435, i32 0, metadata !734, metadata !1052}
!1067 = metadata !{i32 1436, i32 0, metadata !737, metadata !1052}
!1068 = metadata !{i32 1437, i32 0, metadata !737, metadata !1052}
!1069 = metadata !{i32 1439, i32 0, metadata !740, metadata !1052}
!1070 = metadata !{i32 1440, i32 0, metadata !740, metadata !1052}
!1071 = metadata !{i32 1442, i32 0, metadata !624, metadata !1052}
!1072 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1052} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1073 = metadata !{i32 1443, i32 0, metadata !624, metadata !1052}
!1074 = metadata !{i32 1444, i32 0, metadata !624, metadata !1052}
!1075 = metadata !{i32 1445, i32 0, metadata !748, metadata !1052}
!1076 = metadata !{i32 298, i32 0, metadata !1077, null}
!1077 = metadata !{i32 786443, metadata !25, metadata !149, i32 298, i32 0, i32 56} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1078 = metadata !{i32 299, i32 0, metadata !1077, null}
!1079 = metadata !{i32 301, i32 0, metadata !149, null}
!1080 = metadata !{i32 303, i32 0, metadata !160, null}
!1081 = metadata !{i32 306, i32 0, metadata !160, null}
!1082 = metadata !{i32 308, i32 0, metadata !160, null}
!1083 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1084} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1084 = metadata !{i32 310, i32 0, metadata !160, null}
!1085 = metadata !{i32 63, i32 0, metadata !651, metadata !1084}
!1086 = metadata !{i32 64, i32 0, metadata !658, metadata !1084}
!1087 = metadata !{i32 65, i32 0, metadata !657, metadata !1084}
!1088 = metadata !{i32 66, i32 0, metadata !877, metadata !1084}
!1089 = metadata !{i32 311, i32 0, metadata !1090, null}
!1090 = metadata !{i32 786443, metadata !25, metadata !160, i32 311, i32 0, i32 57} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1091 = metadata !{i32 312, i32 0, metadata !1092, null}
!1092 = metadata !{i32 786443, metadata !25, metadata !1090, i32 311, i32 0, i32 58} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1093 = metadata !{i32 313, i32 0, metadata !1092, null}
!1094 = metadata !{i32 316, i32 0, metadata !1095, null}
!1095 = metadata !{i32 786443, metadata !25, metadata !160, i32 316, i32 0, i32 59} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1096 = metadata !{metadata !702, metadata !703, i64 40}
!1097 = metadata !{metadata !702, metadata !704, i64 64}
!1098 = metadata !{i32 317, i32 0, metadata !1099, null}
!1099 = metadata !{i32 786443, metadata !25, metadata !1095, i32 316, i32 0, i32 60} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1100 = metadata !{i32 318, i32 0, metadata !1099, null}
!1101 = metadata !{i32 319, i32 0, metadata !1099, null}
!1102 = metadata !{i32 330, i32 0, metadata !160, null}
!1103 = metadata !{i32 332, i32 0, metadata !160, null}
!1104 = metadata !{i32 333, i32 0, metadata !160, null}
!1105 = metadata !{i32 335, i32 0, metadata !167, null}
!1106 = metadata !{i32 339, i32 0, metadata !167, null}
!1107 = metadata !{i32 341, i32 0, metadata !1108, null}
!1108 = metadata !{i32 786443, metadata !25, metadata !167, i32 341, i32 0, i32 61} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1109 = metadata !{i32 344, i32 0, metadata !1110, null}
!1110 = metadata !{i32 786443, metadata !25, metadata !167, i32 344, i32 0, i32 62} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1111 = metadata !{i32 345, i32 0, metadata !1112, null}
!1112 = metadata !{i32 786443, metadata !25, metadata !1110, i32 344, i32 0, i32 63} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1113 = metadata !{i32 346, i32 0, metadata !1112, null}
!1114 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1115} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1115 = metadata !{i32 349, i32 0, metadata !167, null}
!1116 = metadata !{i32 63, i32 0, metadata !651, metadata !1115}
!1117 = metadata !{i32 64, i32 0, metadata !658, metadata !1115}
!1118 = metadata !{i32 65, i32 0, metadata !657, metadata !1115}
!1119 = metadata !{i32 66, i32 0, metadata !877, metadata !1115}
!1120 = metadata !{i32 351, i32 0, metadata !1121, null}
!1121 = metadata !{i32 786443, metadata !25, metadata !167, i32 351, i32 0, i32 64} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1122 = metadata !{i32 352, i32 0, metadata !1123, null}
!1123 = metadata !{i32 786443, metadata !25, metadata !1121, i32 351, i32 0, i32 65} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1124 = metadata !{i32 353, i32 0, metadata !1123, null}
!1125 = metadata !{i32 356, i32 0, metadata !1126, null}
!1126 = metadata !{i32 786443, metadata !25, metadata !167, i32 356, i32 0, i32 66} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1127 = metadata !{metadata !702, metadata !704, i64 48}
!1128 = metadata !{i32 357, i32 0, metadata !1129, null}
!1129 = metadata !{i32 786443, metadata !25, metadata !1126, i32 356, i32 0, i32 67} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1130 = metadata !{i32 358, i32 0, metadata !1129, null}
!1131 = metadata !{i32 359, i32 0, metadata !1129, null}
!1132 = metadata !{i32 362, i32 0, metadata !181, null}
!1133 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1134} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1134 = metadata !{i32 365, i32 0, metadata !180, null}
!1135 = metadata !{i32 1415, i32 0, metadata !632, metadata !1134}
!1136 = metadata !{i32 1417, i32 0, metadata !632, metadata !1134}
!1137 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1134} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1138 = metadata !{i32 1418, i32 0, metadata !632, metadata !1134}
!1139 = metadata !{i32 786689, metadata !626, metadata !"s", metadata !26, i32 16778638, metadata !173, i32 0, metadata !1140} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!1140 = metadata !{i32 366, i32 0, metadata !180, null}
!1141 = metadata !{i32 1422, i32 0, metadata !626, metadata !1140}
!1142 = metadata !{i32 1423, i32 0, metadata !626, metadata !1140}
!1143 = metadata !{i32 786688, metadata !626, metadata !"sc", metadata !26, i32 1423, metadata !173, i32 0, metadata !1140} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!1144 = metadata !{i32 1424, i32 0, metadata !626, metadata !1140}
!1145 = metadata !{i32 370, i32 0, metadata !180, null}
!1146 = metadata !{i32 371, i32 0, metadata !1147, null}
!1147 = metadata !{i32 786443, metadata !25, metadata !180, i32 371, i32 0, i32 70} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1148 = metadata !{i32 372, i32 0, metadata !1147, null}
!1149 = metadata !{i32 374, i32 0, metadata !1147, null}
!1150 = metadata !{metadata !766, metadata !715, i64 8}
!1151 = metadata !{i32 376, i32 0, metadata !1152, null}
!1152 = metadata !{i32 786443, metadata !25, metadata !180, i32 376, i32 0, i32 71} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1153 = metadata !{i32 377, i32 0, metadata !1154, null}
!1154 = metadata !{i32 786443, metadata !25, metadata !1152, i32 376, i32 0, i32 72} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1155 = metadata !{i32 378, i32 0, metadata !1154, null}
!1156 = metadata !{i32 381, i32 0, metadata !1157, null}
!1157 = metadata !{i32 786443, metadata !25, metadata !180, i32 381, i32 0, i32 73} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1158 = metadata !{i32 383, i32 0, metadata !180, null}
!1159 = metadata !{i32 382, i32 0, metadata !1157, null}
!1160 = metadata !{i32 386, i32 0, metadata !1161, null}
!1161 = metadata !{i32 786443, metadata !25, metadata !181, i32 385, i32 0, i32 74} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1162 = metadata !{i32 387, i32 0, metadata !1163, null}
!1163 = metadata !{i32 786443, metadata !25, metadata !1161, i32 387, i32 0, i32 75} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1164 = metadata !{metadata !712, metadata !703, i64 0}
!1165 = metadata !{i32 391, i32 0, metadata !1166, null}
!1166 = metadata !{i32 786443, metadata !25, metadata !1161, i32 391, i32 0, i32 76} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1167 = metadata !{i32 392, i32 0, metadata !1168, null}
!1168 = metadata !{i32 786443, metadata !25, metadata !1166, i32 391, i32 0, i32 77} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1169 = metadata !{i32 395, i32 0, metadata !1161, null}
!1170 = metadata !{metadata !712, metadata !704, i64 8}
!1171 = metadata !{i32 396, i32 0, metadata !1161, null}
!1172 = metadata !{i32 398, i32 0, metadata !1161, null}
!1173 = metadata !{i32 400, i32 0, metadata !167, null}
!1174 = metadata !{i32 403, i32 0, metadata !182, null}
!1175 = metadata !{i32 407, i32 0, metadata !182, null}
!1176 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1177} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1177 = metadata !{i32 409, i32 0, metadata !182, null}
!1178 = metadata !{i32 63, i32 0, metadata !651, metadata !1177}
!1179 = metadata !{i32 64, i32 0, metadata !658, metadata !1177}
!1180 = metadata !{i32 65, i32 0, metadata !657, metadata !1177}
!1181 = metadata !{i32 66, i32 0, metadata !877, metadata !1177}
!1182 = metadata !{i32 411, i32 0, metadata !1183, null}
!1183 = metadata !{i32 786443, metadata !25, metadata !182, i32 411, i32 0, i32 78} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1184 = metadata !{i32 412, i32 0, metadata !1185, null}
!1185 = metadata !{i32 786443, metadata !25, metadata !1183, i32 411, i32 0, i32 79} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1186 = metadata !{i32 413, i32 0, metadata !1185, null}
!1187 = metadata !{i32 416, i32 0, metadata !1188, null}
!1188 = metadata !{i32 786443, metadata !25, metadata !182, i32 416, i32 0, i32 80} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1189 = metadata !{metadata !702, metadata !704, i64 56}
!1190 = metadata !{i32 417, i32 0, metadata !1191, null}
!1191 = metadata !{i32 786443, metadata !25, metadata !1188, i32 416, i32 0, i32 81} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1192 = metadata !{i32 418, i32 0, metadata !1191, null}
!1193 = metadata !{i32 419, i32 0, metadata !1191, null}
!1194 = metadata !{i32 422, i32 0, metadata !194, null}
!1195 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1196} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1196 = metadata !{i32 425, i32 0, metadata !193, null}
!1197 = metadata !{i32 1415, i32 0, metadata !632, metadata !1196}
!1198 = metadata !{i32 1417, i32 0, metadata !632, metadata !1196}
!1199 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1196} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1200 = metadata !{i32 1418, i32 0, metadata !632, metadata !1196}
!1201 = metadata !{i32 786689, metadata !626, metadata !"s", metadata !26, i32 16778638, metadata !173, i32 0, metadata !1202} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!1202 = metadata !{i32 426, i32 0, metadata !193, null}
!1203 = metadata !{i32 1422, i32 0, metadata !626, metadata !1202}
!1204 = metadata !{i32 1423, i32 0, metadata !626, metadata !1202}
!1205 = metadata !{i32 786688, metadata !626, metadata !"sc", metadata !26, i32 1423, metadata !173, i32 0, metadata !1202} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!1206 = metadata !{i32 1424, i32 0, metadata !626, metadata !1202}
!1207 = metadata !{i32 430, i32 0, metadata !193, null}
!1208 = metadata !{i32 431, i32 0, metadata !1209, null}
!1209 = metadata !{i32 786443, metadata !25, metadata !193, i32 431, i32 0, i32 84} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1210 = metadata !{i32 432, i32 0, metadata !1209, null}
!1211 = metadata !{i32 433, i32 0, metadata !1209, null}
!1212 = metadata !{i32 435, i32 0, metadata !1213, null}
!1213 = metadata !{i32 786443, metadata !25, metadata !193, i32 435, i32 0, i32 85} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1214 = metadata !{i32 436, i32 0, metadata !1215, null}
!1215 = metadata !{i32 786443, metadata !25, metadata !1213, i32 435, i32 0, i32 86} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1216 = metadata !{i32 437, i32 0, metadata !1215, null}
!1217 = metadata !{i32 440, i32 0, metadata !193, null}
!1218 = metadata !{i32 441, i32 0, metadata !1219, null}
!1219 = metadata !{i32 786443, metadata !25, metadata !193, i32 441, i32 0, i32 87} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1220 = metadata !{i32 444, i32 0, metadata !193, null}
!1221 = metadata !{i32 442, i32 0, metadata !1219, null}
!1222 = metadata !{i64 0}
!1223 = metadata !{i32 448, i32 0, metadata !196, null}
!1224 = metadata !{i32 449, i32 0, metadata !1225, null}
!1225 = metadata !{i32 786443, metadata !25, metadata !196, i32 449, i32 0, i32 89} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1226 = metadata !{i32 452, i32 0, metadata !1227, null}
!1227 = metadata !{i32 786443, metadata !25, metadata !1228, i32 452, i32 0, i32 91} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1228 = metadata !{i32 786443, metadata !25, metadata !1225, i32 451, i32 0, i32 90} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1229 = metadata !{metadata !757, metadata !703, i64 776}
!1230 = metadata !{i32 453, i32 0, metadata !1227, null}
!1231 = metadata !{i32 455, i32 0, metadata !1232, null}
!1232 = metadata !{i32 786443, metadata !25, metadata !1233, i32 455, i32 0, i32 93} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1233 = metadata !{i32 786443, metadata !25, metadata !1227, i32 454, i32 0, i32 92} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1234 = metadata !{i32 456, i32 0, metadata !1232, null}
!1235 = metadata !{i32 460, i32 0, metadata !1236, null}
!1236 = metadata !{i32 786443, metadata !25, metadata !196, i32 460, i32 0, i32 94} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1237 = metadata !{i32 461, i32 0, metadata !1236, null}
!1238 = metadata !{i32 463, i32 0, metadata !1239, null}
!1239 = metadata !{i32 786443, metadata !25, metadata !196, i32 463, i32 0, i32 95} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1240 = metadata !{i32 464, i32 0, metadata !1239, null}
!1241 = metadata !{i32 466, i32 0, metadata !1242, null}
!1242 = metadata !{i32 786443, metadata !25, metadata !196, i32 466, i32 0, i32 96} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1243 = metadata !{metadata !702, metadata !704, i64 16}
!1244 = metadata !{i32 467, i32 0, metadata !1242, null}
!1245 = metadata !{metadata !702, metadata !703, i64 24}
!1246 = metadata !{i32 469, i32 0, metadata !196, null}
!1247 = metadata !{i32 470, i32 0, metadata !196, null}
!1248 = metadata !{i32 472, i32 0, metadata !182, null}
!1249 = metadata !{i32 475, i32 0, metadata !197, null}
!1250 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1251} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1251 = metadata !{i32 477, i32 0, metadata !197, null}
!1252 = metadata !{i32 63, i32 0, metadata !651, metadata !1251}
!1253 = metadata !{i32 64, i32 0, metadata !658, metadata !1251}
!1254 = metadata !{i32 65, i32 0, metadata !657, metadata !1251}
!1255 = metadata !{i32 66, i32 0, metadata !877, metadata !1251}
!1256 = metadata !{i32 479, i32 0, metadata !1257, null}
!1257 = metadata !{i32 786443, metadata !25, metadata !197, i32 479, i32 0, i32 97} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1258 = metadata !{i32 480, i32 0, metadata !1259, null}
!1259 = metadata !{i32 786443, metadata !25, metadata !1257, i32 479, i32 0, i32 98} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1260 = metadata !{i32 481, i32 0, metadata !1259, null}
!1261 = metadata !{i32 484, i32 0, metadata !1262, null}
!1262 = metadata !{i32 786443, metadata !25, metadata !197, i32 484, i32 0, i32 99} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1263 = metadata !{i32 491, i32 0, metadata !1264, null}
!1264 = metadata !{i32 786443, metadata !25, metadata !1265, i32 491, i32 0, i32 101} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1265 = metadata !{i32 786443, metadata !25, metadata !1262, i32 484, i32 0, i32 100} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1266 = metadata !{i32 492, i32 0, metadata !1267, null}
!1267 = metadata !{i32 786443, metadata !25, metadata !1264, i32 491, i32 0, i32 102} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1268 = metadata !{i32 493, i32 0, metadata !1267, null}
!1269 = metadata !{i32 494, i32 0, metadata !1270, null}
!1270 = metadata !{i32 786443, metadata !25, metadata !1264, i32 493, i32 0, i32 103} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1271 = metadata !{i32 498, i32 0, metadata !1272, null}
!1272 = metadata !{i32 786443, metadata !25, metadata !1270, i32 498, i32 0, i32 104} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1273 = metadata !{i32 499, i32 0, metadata !1274, null}
!1274 = metadata !{i32 786443, metadata !25, metadata !1272, i32 498, i32 0, i32 105} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1275 = metadata !{i32 500, i32 0, metadata !1274, null}
!1276 = metadata !{i32 501, i32 0, metadata !1274, null}
!1277 = metadata !{i32 504, i32 0, metadata !1278, null}
!1278 = metadata !{i32 786443, metadata !25, metadata !1265, i32 504, i32 0, i32 106} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1279 = metadata !{i32 505, i32 0, metadata !1280, null}
!1280 = metadata !{i32 786443, metadata !25, metadata !1278, i32 504, i32 0, i32 107} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1281 = metadata !{i32 506, i32 0, metadata !1280, null}
!1282 = metadata !{i32 509, i32 0, metadata !1265, null}
!1283 = metadata !{i32 510, i32 0, metadata !1265, null}
!1284 = metadata !{i32 513, i32 0, metadata !197, null}
!1285 = metadata !{i32 515, i32 0, metadata !1286, null}
!1286 = metadata !{i32 786443, metadata !25, metadata !197, i32 513, i32 0, i32 108} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1287 = metadata !{i32 516, i32 0, metadata !1286, null}
!1288 = metadata !{i32 518, i32 0, metadata !1289, null}
!1289 = metadata !{i32 786443, metadata !25, metadata !1286, i32 517, i32 0, i32 109} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1290 = metadata !{i32 519, i32 0, metadata !1289, null}
!1291 = metadata !{i32 523, i32 0, metadata !1292, null}
!1292 = metadata !{i32 786443, metadata !25, metadata !197, i32 523, i32 0, i32 110} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1293 = metadata !{i32 524, i32 0, metadata !1294, null}
!1294 = metadata !{i32 786443, metadata !25, metadata !1292, i32 523, i32 0, i32 111} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1295 = metadata !{i32 525, i32 0, metadata !1294, null}
!1296 = metadata !{i32 528, i32 0, metadata !197, null}
!1297 = metadata !{i32 529, i32 0, metadata !197, null}
!1298 = metadata !{i32 530, i32 0, metadata !197, null}
!1299 = metadata !{i32 532, i32 0, metadata !206, null}
!1300 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1301} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1301 = metadata !{i32 533, i32 0, metadata !206, null}
!1302 = metadata !{i32 39, i32 0, metadata !666, metadata !1301}
!1303 = metadata !{i32 40, i32 0, metadata !666, metadata !1301}
!1304 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1301} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1305 = metadata !{i32 43, i32 0, metadata !699, metadata !1301}
!1306 = metadata !{i32 46, i32 0, metadata !677, metadata !1301}
!1307 = metadata !{i32 47, i32 0, metadata !675, metadata !1301}
!1308 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1301} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1309 = metadata !{i32 48, i32 0, metadata !674, metadata !1301}
!1310 = metadata !{i32 49, i32 0, metadata !710, metadata !1301}
!1311 = metadata !{i32 534, i32 0, metadata !1312, null}
!1312 = metadata !{i32 786443, metadata !25, metadata !206, i32 534, i32 0, i32 112} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1313 = metadata !{i32 535, i32 0, metadata !1314, null}
!1314 = metadata !{i32 786443, metadata !25, metadata !1312, i32 534, i32 0, i32 113} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1315 = metadata !{i32 536, i32 0, metadata !1314, null}
!1316 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1317} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1317 = metadata !{i32 541, i32 0, metadata !214, null}
!1318 = metadata !{i32 1428, i32 0, metadata !613, metadata !1317}
!1319 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1320} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1320 = metadata !{i32 1429, i32 0, metadata !613, metadata !1317}
!1321 = metadata !{i32 1415, i32 0, metadata !632, metadata !1320}
!1322 = metadata !{i32 1417, i32 0, metadata !632, metadata !1320}
!1323 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1320} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1324 = metadata !{i32 1418, i32 0, metadata !632, metadata !1320}
!1325 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1317} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1326 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1317} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1327 = metadata !{i32 1432, i32 0, metadata !622, metadata !1317}
!1328 = metadata !{i32 1433, i32 0, metadata !621, metadata !1317}
!1329 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1317} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1330 = metadata !{i32 1434, i32 0, metadata !625, metadata !1317}
!1331 = metadata !{i32 1435, i32 0, metadata !734, metadata !1317}
!1332 = metadata !{i32 1436, i32 0, metadata !737, metadata !1317}
!1333 = metadata !{i32 1437, i32 0, metadata !737, metadata !1317}
!1334 = metadata !{i32 1439, i32 0, metadata !740, metadata !1317}
!1335 = metadata !{i32 1440, i32 0, metadata !740, metadata !1317}
!1336 = metadata !{i32 1442, i32 0, metadata !624, metadata !1317}
!1337 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1317} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1338 = metadata !{i32 1443, i32 0, metadata !624, metadata !1317}
!1339 = metadata !{i32 1444, i32 0, metadata !624, metadata !1317}
!1340 = metadata !{i32 1445, i32 0, metadata !748, metadata !1317}
!1341 = metadata !{i32 545, i32 0, metadata !1342, null}
!1342 = metadata !{i32 786443, metadata !25, metadata !214, i32 545, i32 0, i32 115} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1343 = metadata !{i32 546, i32 0, metadata !1342, null}
!1344 = metadata !{i32 549, i32 0, metadata !206, null}
!1345 = metadata !{i32 551, i32 0, metadata !215, null}
!1346 = metadata !{i32 552, i32 0, metadata !245, null}
!1347 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1348} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1348 = metadata !{i32 553, i32 0, metadata !244, null}
!1349 = metadata !{i32 63, i32 0, metadata !651, metadata !1348}
!1350 = metadata !{i32 64, i32 0, metadata !658, metadata !1348}
!1351 = metadata !{i32 65, i32 0, metadata !657, metadata !1348}
!1352 = metadata !{i32 66, i32 0, metadata !877, metadata !1348}
!1353 = metadata !{i32 555, i32 0, metadata !1354, null}
!1354 = metadata !{i32 786443, metadata !25, metadata !244, i32 555, i32 0, i32 118} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1355 = metadata !{i32 556, i32 0, metadata !1356, null}
!1356 = metadata !{i32 786443, metadata !25, metadata !1354, i32 555, i32 0, i32 119} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1357 = metadata !{i32 557, i32 0, metadata !1356, null}
!1358 = metadata !{i32 558, i32 0, metadata !1359, null}
!1359 = metadata !{i32 786443, metadata !25, metadata !1354, i32 558, i32 0, i32 120} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1360 = metadata !{i32 559, i32 0, metadata !1361, null}
!1361 = metadata !{i32 786443, metadata !25, metadata !1359, i32 558, i32 0, i32 121} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1362 = metadata !{i32 560, i32 0, metadata !1361, null}
!1363 = metadata !{i32 561, i32 0, metadata !1361, null}
!1364 = metadata !{i32 563, i32 0, metadata !244, null}
!1365 = metadata !{i32 564, i32 0, metadata !244, null}
!1366 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1367} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1367 = metadata !{i32 565, i32 0, metadata !215, null}
!1368 = metadata !{i32 39, i32 0, metadata !666, metadata !1367}
!1369 = metadata !{i32 40, i32 0, metadata !666, metadata !1367}
!1370 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1367} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1371 = metadata !{i32 43, i32 0, metadata !699, metadata !1367}
!1372 = metadata !{i32 46, i32 0, metadata !677, metadata !1367}
!1373 = metadata !{i32 47, i32 0, metadata !675, metadata !1367}
!1374 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1367} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1375 = metadata !{i32 48, i32 0, metadata !674, metadata !1367}
!1376 = metadata !{i32 49, i32 0, metadata !710, metadata !1367}
!1377 = metadata !{i32 566, i32 0, metadata !1378, null}
!1378 = metadata !{i32 786443, metadata !25, metadata !215, i32 566, i32 0, i32 122} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1379 = metadata !{i32 567, i32 0, metadata !1380, null}
!1380 = metadata !{i32 786443, metadata !25, metadata !1378, i32 566, i32 0, i32 123} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1381 = metadata !{i32 568, i32 0, metadata !1380, null}
!1382 = metadata !{i32 572, i32 0, metadata !215, null}
!1383 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1384} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1384 = metadata !{i32 573, i32 0, metadata !215, null}
!1385 = metadata !{i32 1428, i32 0, metadata !613, metadata !1384}
!1386 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1387} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1387 = metadata !{i32 1429, i32 0, metadata !613, metadata !1384}
!1388 = metadata !{i32 1415, i32 0, metadata !632, metadata !1387}
!1389 = metadata !{i32 1417, i32 0, metadata !632, metadata !1387}
!1390 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1387} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1391 = metadata !{i32 1418, i32 0, metadata !632, metadata !1387}
!1392 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1384} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1393 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1384} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1394 = metadata !{i32 1432, i32 0, metadata !622, metadata !1384}
!1395 = metadata !{i32 1433, i32 0, metadata !621, metadata !1384}
!1396 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1384} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1397 = metadata !{i32 1434, i32 0, metadata !625, metadata !1384}
!1398 = metadata !{i32 1435, i32 0, metadata !734, metadata !1384}
!1399 = metadata !{i32 1436, i32 0, metadata !737, metadata !1384}
!1400 = metadata !{i32 1437, i32 0, metadata !737, metadata !1384}
!1401 = metadata !{i32 1439, i32 0, metadata !740, metadata !1384}
!1402 = metadata !{i32 1440, i32 0, metadata !740, metadata !1384}
!1403 = metadata !{i32 1442, i32 0, metadata !624, metadata !1384}
!1404 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1384} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1405 = metadata !{i32 1443, i32 0, metadata !624, metadata !1384}
!1406 = metadata !{i32 1444, i32 0, metadata !624, metadata !1384}
!1407 = metadata !{i32 1445, i32 0, metadata !748, metadata !1384}
!1408 = metadata !{i32 581, i32 0, metadata !1409, null}
!1409 = metadata !{i32 786443, metadata !25, metadata !215, i32 581, i32 0, i32 124} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1410 = metadata !{i32 582, i32 0, metadata !1409, null}
!1411 = metadata !{i32 584, i32 0, metadata !215, null}
!1412 = metadata !{i32 587, i32 0, metadata !248, null}
!1413 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1414} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1414 = metadata !{i32 588, i32 0, metadata !248, null}
!1415 = metadata !{i32 39, i32 0, metadata !666, metadata !1414}
!1416 = metadata !{i32 40, i32 0, metadata !666, metadata !1414}
!1417 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1414} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1418 = metadata !{i32 43, i32 0, metadata !699, metadata !1414}
!1419 = metadata !{i32 46, i32 0, metadata !677, metadata !1414}
!1420 = metadata !{i32 47, i32 0, metadata !675, metadata !1414}
!1421 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1414} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1422 = metadata !{i32 48, i32 0, metadata !674, metadata !1414}
!1423 = metadata !{i32 49, i32 0, metadata !710, metadata !1414}
!1424 = metadata !{i32 589, i32 0, metadata !1425, null}
!1425 = metadata !{i32 786443, metadata !25, metadata !248, i32 589, i32 0, i32 125} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1426 = metadata !{i32 590, i32 0, metadata !1427, null}
!1427 = metadata !{i32 786443, metadata !25, metadata !1425, i32 589, i32 0, i32 126} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1428 = metadata !{i32 591, i32 0, metadata !1427, null}
!1429 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1430} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1430 = metadata !{i32 596, i32 0, metadata !254, null}
!1431 = metadata !{i32 1428, i32 0, metadata !613, metadata !1430}
!1432 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1433} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1433 = metadata !{i32 1429, i32 0, metadata !613, metadata !1430}
!1434 = metadata !{i32 1415, i32 0, metadata !632, metadata !1433}
!1435 = metadata !{i32 1417, i32 0, metadata !632, metadata !1433}
!1436 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1433} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1437 = metadata !{i32 1418, i32 0, metadata !632, metadata !1433}
!1438 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1430} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1439 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1430} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1440 = metadata !{i32 1432, i32 0, metadata !622, metadata !1430}
!1441 = metadata !{i32 1433, i32 0, metadata !621, metadata !1430}
!1442 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1430} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1443 = metadata !{i32 1434, i32 0, metadata !625, metadata !1430}
!1444 = metadata !{i32 1435, i32 0, metadata !734, metadata !1430}
!1445 = metadata !{i32 1436, i32 0, metadata !737, metadata !1430}
!1446 = metadata !{i32 1437, i32 0, metadata !737, metadata !1430}
!1447 = metadata !{i32 1439, i32 0, metadata !740, metadata !1430}
!1448 = metadata !{i32 1440, i32 0, metadata !740, metadata !1430}
!1449 = metadata !{i32 1442, i32 0, metadata !624, metadata !1430}
!1450 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1430} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1451 = metadata !{i32 1443, i32 0, metadata !624, metadata !1430}
!1452 = metadata !{i32 1444, i32 0, metadata !624, metadata !1430}
!1453 = metadata !{i32 1445, i32 0, metadata !748, metadata !1430}
!1454 = metadata !{i32 600, i32 0, metadata !1455, null}
!1455 = metadata !{i32 786443, metadata !25, metadata !254, i32 600, i32 0, i32 128} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1456 = metadata !{i32 601, i32 0, metadata !1455, null}
!1457 = metadata !{i32 604, i32 0, metadata !248, null}
!1458 = metadata !{i32 606, i32 0, metadata !255, null}
!1459 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1460} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1460 = metadata !{i32 607, i32 0, metadata !255, null}
!1461 = metadata !{i32 39, i32 0, metadata !666, metadata !1460}
!1462 = metadata !{i32 40, i32 0, metadata !666, metadata !1460}
!1463 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1460} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1464 = metadata !{i32 43, i32 0, metadata !699, metadata !1460}
!1465 = metadata !{i32 46, i32 0, metadata !677, metadata !1460}
!1466 = metadata !{i32 47, i32 0, metadata !675, metadata !1460}
!1467 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1460} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1468 = metadata !{i32 48, i32 0, metadata !674, metadata !1460}
!1469 = metadata !{i32 49, i32 0, metadata !710, metadata !1460}
!1470 = metadata !{i32 609, i32 0, metadata !1471, null}
!1471 = metadata !{i32 786443, metadata !25, metadata !255, i32 609, i32 0, i32 129} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1472 = metadata !{i32 611, i32 0, metadata !1473, null}
!1473 = metadata !{i32 786443, metadata !25, metadata !1471, i32 609, i32 0, i32 130} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1474 = metadata !{i32 612, i32 0, metadata !1473, null}
!1475 = metadata !{i32 613, i32 0, metadata !1473, null}
!1476 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1477} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1477 = metadata !{i32 617, i32 0, metadata !262, null}
!1478 = metadata !{i32 1428, i32 0, metadata !613, metadata !1477}
!1479 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1480} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1480 = metadata !{i32 1429, i32 0, metadata !613, metadata !1477}
!1481 = metadata !{i32 1415, i32 0, metadata !632, metadata !1480}
!1482 = metadata !{i32 1417, i32 0, metadata !632, metadata !1480}
!1483 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1480} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1484 = metadata !{i32 1418, i32 0, metadata !632, metadata !1480}
!1485 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1477} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1486 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1477} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1487 = metadata !{i32 1432, i32 0, metadata !622, metadata !1477}
!1488 = metadata !{i32 1433, i32 0, metadata !621, metadata !1477}
!1489 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1477} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1490 = metadata !{i32 1434, i32 0, metadata !625, metadata !1477}
!1491 = metadata !{i32 1435, i32 0, metadata !734, metadata !1477}
!1492 = metadata !{i32 1436, i32 0, metadata !737, metadata !1477}
!1493 = metadata !{i32 1437, i32 0, metadata !737, metadata !1477}
!1494 = metadata !{i32 1439, i32 0, metadata !740, metadata !1477}
!1495 = metadata !{i32 1440, i32 0, metadata !740, metadata !1477}
!1496 = metadata !{i32 1442, i32 0, metadata !624, metadata !1477}
!1497 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1477} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1498 = metadata !{i32 1443, i32 0, metadata !624, metadata !1477}
!1499 = metadata !{i32 1444, i32 0, metadata !624, metadata !1477}
!1500 = metadata !{i32 1445, i32 0, metadata !748, metadata !1477}
!1501 = metadata !{i32 618, i32 0, metadata !1502, null}
!1502 = metadata !{i32 786443, metadata !25, metadata !262, i32 618, i32 0, i32 132} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1503 = metadata !{i32 619, i32 0, metadata !1502, null}
!1504 = metadata !{i32 622, i32 0, metadata !255, null}
!1505 = metadata !{i32 624, i32 0, metadata !263, null}
!1506 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1507} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1507 = metadata !{i32 625, i32 0, metadata !263, null}
!1508 = metadata !{i32 63, i32 0, metadata !651, metadata !1507}
!1509 = metadata !{i32 64, i32 0, metadata !658, metadata !1507}
!1510 = metadata !{i32 65, i32 0, metadata !657, metadata !1507}
!1511 = metadata !{i32 66, i32 0, metadata !877, metadata !1507}
!1512 = metadata !{i32 627, i32 0, metadata !1513, null}
!1513 = metadata !{i32 786443, metadata !25, metadata !263, i32 627, i32 0, i32 133} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1514 = metadata !{i32 628, i32 0, metadata !1515, null}
!1515 = metadata !{i32 786443, metadata !25, metadata !1513, i32 627, i32 0, i32 134} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1516 = metadata !{i32 629, i32 0, metadata !1515, null}
!1517 = metadata !{i32 632, i32 0, metadata !269, null}
!1518 = metadata !{i32 633, i32 0, metadata !1519, null}
!1519 = metadata !{i32 786443, metadata !25, metadata !269, i32 632, i32 0, i32 136} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1520 = metadata !{i32 634, i32 0, metadata !1519, null}
!1521 = metadata !{i32 635, i32 0, metadata !1519, null}
!1522 = metadata !{i32 637, i32 0, metadata !268, null}
!1523 = metadata !{i32 638, i32 0, metadata !1524, null}
!1524 = metadata !{i32 786443, metadata !25, metadata !268, i32 638, i32 0, i32 138} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1525 = metadata !{i32 639, i32 0, metadata !1524, null}
!1526 = metadata !{i32 642, i32 0, metadata !263, null}
!1527 = metadata !{i32 658, i32 0, metadata !270, null}
!1528 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1529} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1529 = metadata !{i32 661, i32 0, metadata !270, null}
!1530 = metadata !{i32 39, i32 0, metadata !666, metadata !1529}
!1531 = metadata !{i32 40, i32 0, metadata !666, metadata !1529}
!1532 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1529} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1533 = metadata !{i32 43, i32 0, metadata !699, metadata !1529}
!1534 = metadata !{i32 46, i32 0, metadata !677, metadata !1529}
!1535 = metadata !{i32 47, i32 0, metadata !675, metadata !1529}
!1536 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1529} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1537 = metadata !{i32 48, i32 0, metadata !674, metadata !1529}
!1538 = metadata !{i32 49, i32 0, metadata !710, metadata !1529}
!1539 = metadata !{i32 51, i32 0, metadata !674, metadata !1529}
!1540 = metadata !{i32 663, i32 0, metadata !270, null}
!1541 = metadata !{i32 664, i32 0, metadata !1542, null}
!1542 = metadata !{i32 786443, metadata !25, metadata !270, i32 664, i32 0, i32 139} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1543 = metadata !{metadata !702, metadata !704, i64 88}
!1544 = metadata !{i32 665, i32 0, metadata !1545, null}
!1545 = metadata !{i32 786443, metadata !25, metadata !1542, i32 664, i32 0, i32 140} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1546 = metadata !{i32 666, i32 0, metadata !1545, null}
!1547 = metadata !{i32 667, i32 0, metadata !1545, null}
!1548 = metadata !{i32 670, i32 0, metadata !279, null}
!1549 = metadata !{i32 786689, metadata !645, metadata !"df", metadata !26, i32 16777861, metadata !37, i32 0, metadata !1550} ; [ DW_TAG_arg_variable ] [df] [line 645]
!1550 = metadata !{i32 671, i32 0, metadata !1551, null}
!1551 = metadata !{i32 786443, metadata !25, metadata !279, i32 670, i32 0, i32 142} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1552 = metadata !{i32 645, i32 0, metadata !645, metadata !1550}
!1553 = metadata !{i32 786689, metadata !645, metadata !"mode", metadata !26, i32 33555077, metadata !92, i32 0, metadata !1550} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!1554 = metadata !{i32 646, i32 0, metadata !1555, metadata !1550}
!1555 = metadata !{i32 786443, metadata !25, metadata !645, i32 646, i32 0, i32 368} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1556 = metadata !{metadata !714, metadata !703, i64 28}
!1557 = metadata !{i32 647, i32 0, metadata !1558, metadata !1550}
!1558 = metadata !{i32 786443, metadata !25, metadata !1559, i32 647, i32 0, i32 370} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1559 = metadata !{i32 786443, metadata !25, metadata !1555, i32 646, i32 0, i32 369} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1560 = metadata !{metadata !714, metadata !703, i64 32}
!1561 = metadata !{i32 648, i32 0, metadata !1558, metadata !1550}
!1562 = metadata !{i32 649, i32 0, metadata !1559, metadata !1550}
!1563 = metadata !{i32 651, i32 0, metadata !1559, metadata !1550}
!1564 = metadata !{i32 653, i32 0, metadata !1565, metadata !1550}
!1565 = metadata !{i32 786443, metadata !25, metadata !1555, i32 652, i32 0, i32 371} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1566 = metadata !{i32 654, i32 0, metadata !1565, metadata !1550}
!1567 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1568} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1568 = metadata !{i32 673, i32 0, metadata !278, null}
!1569 = metadata !{i32 1428, i32 0, metadata !613, metadata !1568}
!1570 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1571} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1571 = metadata !{i32 1429, i32 0, metadata !613, metadata !1568}
!1572 = metadata !{i32 1415, i32 0, metadata !632, metadata !1571}
!1573 = metadata !{i32 1417, i32 0, metadata !632, metadata !1571}
!1574 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1571} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1575 = metadata !{i32 1418, i32 0, metadata !632, metadata !1571}
!1576 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1568} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1577 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1568} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1578 = metadata !{i32 1432, i32 0, metadata !622, metadata !1568}
!1579 = metadata !{i32 1433, i32 0, metadata !621, metadata !1568}
!1580 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1568} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1581 = metadata !{i32 1434, i32 0, metadata !625, metadata !1568}
!1582 = metadata !{i32 1435, i32 0, metadata !734, metadata !1568}
!1583 = metadata !{i32 1436, i32 0, metadata !737, metadata !1568}
!1584 = metadata !{i32 1437, i32 0, metadata !737, metadata !1568}
!1585 = metadata !{i32 1439, i32 0, metadata !740, metadata !1568}
!1586 = metadata !{i32 1440, i32 0, metadata !740, metadata !1568}
!1587 = metadata !{i32 1442, i32 0, metadata !624, metadata !1568}
!1588 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1568} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1589 = metadata !{i32 1443, i32 0, metadata !624, metadata !1568}
!1590 = metadata !{i32 1444, i32 0, metadata !624, metadata !1568}
!1591 = metadata !{i32 1445, i32 0, metadata !748, metadata !1568}
!1592 = metadata !{i32 674, i32 0, metadata !1593, null}
!1593 = metadata !{i32 786443, metadata !25, metadata !278, i32 674, i32 0, i32 144} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1594 = metadata !{i32 675, i32 0, metadata !1593, null}
!1595 = metadata !{i32 678, i32 0, metadata !270, null}
!1596 = metadata !{i32 680, i32 0, metadata !280, null}
!1597 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1598} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1598 = metadata !{i32 683, i32 0, metadata !280, null}
!1599 = metadata !{i32 63, i32 0, metadata !651, metadata !1598}
!1600 = metadata !{i32 64, i32 0, metadata !658, metadata !1598}
!1601 = metadata !{i32 65, i32 0, metadata !657, metadata !1598}
!1602 = metadata !{i32 66, i32 0, metadata !877, metadata !1598}
!1603 = metadata !{i32 685, i32 0, metadata !1604, null}
!1604 = metadata !{i32 786443, metadata !25, metadata !280, i32 685, i32 0, i32 145} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1605 = metadata !{i32 686, i32 0, metadata !1606, null}
!1606 = metadata !{i32 786443, metadata !25, metadata !1604, i32 685, i32 0, i32 146} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1607 = metadata !{i32 687, i32 0, metadata !1606, null}
!1608 = metadata !{i32 690, i32 0, metadata !280, null}
!1609 = metadata !{i32 691, i32 0, metadata !1610, null}
!1610 = metadata !{i32 786443, metadata !25, metadata !280, i32 691, i32 0, i32 147} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1611 = metadata !{metadata !702, metadata !704, i64 96}
!1612 = metadata !{i32 692, i32 0, metadata !1613, null}
!1613 = metadata !{i32 786443, metadata !25, metadata !1610, i32 691, i32 0, i32 148} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1614 = metadata !{i32 693, i32 0, metadata !1613, null}
!1615 = metadata !{i32 694, i32 0, metadata !1613, null}
!1616 = metadata !{i32 697, i32 0, metadata !289, null}
!1617 = metadata !{i32 786689, metadata !645, metadata !"df", metadata !26, i32 16777861, metadata !37, i32 0, metadata !1618} ; [ DW_TAG_arg_variable ] [df] [line 645]
!1618 = metadata !{i32 698, i32 0, metadata !1619, null}
!1619 = metadata !{i32 786443, metadata !25, metadata !289, i32 697, i32 0, i32 150} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1620 = metadata !{i32 645, i32 0, metadata !645, metadata !1618}
!1621 = metadata !{i32 786689, metadata !645, metadata !"mode", metadata !26, i32 33555077, metadata !92, i32 0, metadata !1618} ; [ DW_TAG_arg_variable ] [mode] [line 645]
!1622 = metadata !{i32 646, i32 0, metadata !1555, metadata !1618}
!1623 = metadata !{i32 647, i32 0, metadata !1558, metadata !1618}
!1624 = metadata !{i32 648, i32 0, metadata !1558, metadata !1618}
!1625 = metadata !{i32 649, i32 0, metadata !1559, metadata !1618}
!1626 = metadata !{i32 651, i32 0, metadata !1559, metadata !1618}
!1627 = metadata !{i32 653, i32 0, metadata !1565, metadata !1618}
!1628 = metadata !{i32 654, i32 0, metadata !1565, metadata !1618}
!1629 = metadata !{i32 700, i32 0, metadata !288, null}
!1630 = metadata !{i32 701, i32 0, metadata !1631, null}
!1631 = metadata !{i32 786443, metadata !25, metadata !288, i32 701, i32 0, i32 152} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1632 = metadata !{i32 702, i32 0, metadata !1631, null}
!1633 = metadata !{i32 705, i32 0, metadata !280, null}
!1634 = metadata !{i32 713, i32 0, metadata !290, null}
!1635 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1636} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1636 = metadata !{i32 714, i32 0, metadata !290, null}
!1637 = metadata !{i32 39, i32 0, metadata !666, metadata !1636}
!1638 = metadata !{i32 40, i32 0, metadata !666, metadata !1636}
!1639 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1636} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1640 = metadata !{i32 43, i32 0, metadata !699, metadata !1636}
!1641 = metadata !{i32 46, i32 0, metadata !677, metadata !1636}
!1642 = metadata !{i32 47, i32 0, metadata !675, metadata !1636}
!1643 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1636} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1644 = metadata !{i32 48, i32 0, metadata !674, metadata !1636}
!1645 = metadata !{i32 49, i32 0, metadata !710, metadata !1636}
!1646 = metadata !{i32 716, i32 0, metadata !302, null}
!1647 = metadata !{%struct.exe_disk_file_t* null}
!1648 = metadata !{i32 786689, metadata !638, metadata !"df", metadata !26, i32 16777923, metadata !37, i32 0, metadata !1649} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1649 = metadata !{i32 717, i32 0, metadata !1650, null}
!1650 = metadata !{i32 786443, metadata !25, metadata !302, i32 716, i32 0, i32 154} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1651 = metadata !{i32 707, i32 0, metadata !638, metadata !1649}
!1652 = metadata !{i32 786689, metadata !638, metadata !"owner", metadata !26, i32 33555139, metadata !293, i32 0, metadata !1649} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1653 = metadata !{i32 786689, metadata !638, metadata !"group", metadata !26, i32 50332355, metadata !294, i32 0, metadata !1649} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1654 = metadata !{i32 708, i32 0, metadata !638, metadata !1649}
!1655 = metadata !{i32 709, i32 0, metadata !638, metadata !1649}
!1656 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1657} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1657 = metadata !{i32 719, i32 0, metadata !301, null}
!1658 = metadata !{i32 1428, i32 0, metadata !613, metadata !1657}
!1659 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1660} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1660 = metadata !{i32 1429, i32 0, metadata !613, metadata !1657}
!1661 = metadata !{i32 1415, i32 0, metadata !632, metadata !1660}
!1662 = metadata !{i32 1417, i32 0, metadata !632, metadata !1660}
!1663 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1660} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1664 = metadata !{i32 1418, i32 0, metadata !632, metadata !1660}
!1665 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1657} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1666 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1657} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1667 = metadata !{i32 1432, i32 0, metadata !622, metadata !1657}
!1668 = metadata !{i32 1433, i32 0, metadata !621, metadata !1657}
!1669 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1657} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1670 = metadata !{i32 1434, i32 0, metadata !625, metadata !1657}
!1671 = metadata !{i32 1435, i32 0, metadata !734, metadata !1657}
!1672 = metadata !{i32 1436, i32 0, metadata !737, metadata !1657}
!1673 = metadata !{i32 1437, i32 0, metadata !737, metadata !1657}
!1674 = metadata !{i32 1439, i32 0, metadata !740, metadata !1657}
!1675 = metadata !{i32 1440, i32 0, metadata !740, metadata !1657}
!1676 = metadata !{i32 1442, i32 0, metadata !624, metadata !1657}
!1677 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1657} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1678 = metadata !{i32 1443, i32 0, metadata !624, metadata !1657}
!1679 = metadata !{i32 1444, i32 0, metadata !624, metadata !1657}
!1680 = metadata !{i32 1445, i32 0, metadata !748, metadata !1657}
!1681 = metadata !{i32 720, i32 0, metadata !1682, null}
!1682 = metadata !{i32 786443, metadata !25, metadata !301, i32 720, i32 0, i32 156} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1683 = metadata !{i32 721, i32 0, metadata !1682, null}
!1684 = metadata !{i32 724, i32 0, metadata !290, null}
!1685 = metadata !{i32 726, i32 0, metadata !303, null}
!1686 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1687} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1687 = metadata !{i32 727, i32 0, metadata !303, null}
!1688 = metadata !{i32 63, i32 0, metadata !651, metadata !1687}
!1689 = metadata !{i32 64, i32 0, metadata !658, metadata !1687}
!1690 = metadata !{i32 65, i32 0, metadata !657, metadata !1687}
!1691 = metadata !{i32 66, i32 0, metadata !877, metadata !1687}
!1692 = metadata !{i32 729, i32 0, metadata !1693, null}
!1693 = metadata !{i32 786443, metadata !25, metadata !303, i32 729, i32 0, i32 157} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1694 = metadata !{i32 730, i32 0, metadata !1695, null}
!1695 = metadata !{i32 786443, metadata !25, metadata !1693, i32 729, i32 0, i32 158} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1696 = metadata !{i32 731, i32 0, metadata !1695, null}
!1697 = metadata !{i32 734, i32 0, metadata !313, null}
!1698 = metadata !{i32 786689, metadata !638, metadata !"df", metadata !26, i32 16777923, metadata !37, i32 0, metadata !1699} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1699 = metadata !{i32 735, i32 0, metadata !1700, null}
!1700 = metadata !{i32 786443, metadata !25, metadata !313, i32 734, i32 0, i32 160} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1701 = metadata !{i32 707, i32 0, metadata !638, metadata !1699}
!1702 = metadata !{i32 786689, metadata !638, metadata !"owner", metadata !26, i32 33555139, metadata !293, i32 0, metadata !1699} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1703 = metadata !{i32 786689, metadata !638, metadata !"group", metadata !26, i32 50332355, metadata !294, i32 0, metadata !1699} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1704 = metadata !{i32 708, i32 0, metadata !638, metadata !1699}
!1705 = metadata !{i32 709, i32 0, metadata !638, metadata !1699}
!1706 = metadata !{i32 737, i32 0, metadata !312, null}
!1707 = metadata !{i32 738, i32 0, metadata !1708, null}
!1708 = metadata !{i32 786443, metadata !25, metadata !312, i32 738, i32 0, i32 162} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1709 = metadata !{i32 739, i32 0, metadata !1708, null}
!1710 = metadata !{i32 742, i32 0, metadata !303, null}
!1711 = metadata !{i32 744, i32 0, metadata !314, null}
!1712 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !1713} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!1713 = metadata !{i32 746, i32 0, metadata !314, null}
!1714 = metadata !{i32 39, i32 0, metadata !666, metadata !1713}
!1715 = metadata !{i32 40, i32 0, metadata !666, metadata !1713}
!1716 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !1713} ; [ DW_TAG_auto_variable ] [c] [line 40]
!1717 = metadata !{i32 43, i32 0, metadata !699, metadata !1713}
!1718 = metadata !{i32 46, i32 0, metadata !677, metadata !1713}
!1719 = metadata !{i32 47, i32 0, metadata !675, metadata !1713}
!1720 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !1713} ; [ DW_TAG_auto_variable ] [i] [line 41]
!1721 = metadata !{i32 48, i32 0, metadata !674, metadata !1713}
!1722 = metadata !{i32 49, i32 0, metadata !710, metadata !1713}
!1723 = metadata !{i32 748, i32 0, metadata !322, null}
!1724 = metadata !{i32 786689, metadata !638, metadata !"df", metadata !26, i32 16777923, metadata !37, i32 0, metadata !1725} ; [ DW_TAG_arg_variable ] [df] [line 707]
!1725 = metadata !{i32 749, i32 0, metadata !1726, null}
!1726 = metadata !{i32 786443, metadata !25, metadata !322, i32 748, i32 0, i32 164} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1727 = metadata !{i32 707, i32 0, metadata !638, metadata !1725}
!1728 = metadata !{i32 786689, metadata !638, metadata !"owner", metadata !26, i32 33555139, metadata !293, i32 0, metadata !1725} ; [ DW_TAG_arg_variable ] [owner] [line 707]
!1729 = metadata !{i32 786689, metadata !638, metadata !"group", metadata !26, i32 50332355, metadata !294, i32 0, metadata !1725} ; [ DW_TAG_arg_variable ] [group] [line 707]
!1730 = metadata !{i32 708, i32 0, metadata !638, metadata !1725}
!1731 = metadata !{i32 709, i32 0, metadata !638, metadata !1725}
!1732 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !1733} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!1733 = metadata !{i32 751, i32 0, metadata !321, null}
!1734 = metadata !{i32 1428, i32 0, metadata !613, metadata !1733}
!1735 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !1736} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!1736 = metadata !{i32 1429, i32 0, metadata !613, metadata !1733}
!1737 = metadata !{i32 1415, i32 0, metadata !632, metadata !1736}
!1738 = metadata !{i32 1417, i32 0, metadata !632, metadata !1736}
!1739 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !1736} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!1740 = metadata !{i32 1418, i32 0, metadata !632, metadata !1736}
!1741 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !1733} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!1742 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !1733} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!1743 = metadata !{i32 1432, i32 0, metadata !622, metadata !1733}
!1744 = metadata !{i32 1433, i32 0, metadata !621, metadata !1733}
!1745 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !1733} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!1746 = metadata !{i32 1434, i32 0, metadata !625, metadata !1733}
!1747 = metadata !{i32 1435, i32 0, metadata !734, metadata !1733}
!1748 = metadata !{i32 1436, i32 0, metadata !737, metadata !1733}
!1749 = metadata !{i32 1437, i32 0, metadata !737, metadata !1733}
!1750 = metadata !{i32 1439, i32 0, metadata !740, metadata !1733}
!1751 = metadata !{i32 1440, i32 0, metadata !740, metadata !1733}
!1752 = metadata !{i32 1442, i32 0, metadata !624, metadata !1733}
!1753 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !1733} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!1754 = metadata !{i32 1443, i32 0, metadata !624, metadata !1733}
!1755 = metadata !{i32 1444, i32 0, metadata !624, metadata !1733}
!1756 = metadata !{i32 1445, i32 0, metadata !748, metadata !1733}
!1757 = metadata !{i32 752, i32 0, metadata !1758, null}
!1758 = metadata !{i32 786443, metadata !25, metadata !321, i32 752, i32 0, i32 166} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1759 = metadata !{i32 753, i32 0, metadata !1758, null}
!1760 = metadata !{i32 756, i32 0, metadata !314, null}
!1761 = metadata !{i32 758, i32 0, metadata !323, null}
!1762 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1763} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1763 = metadata !{i32 759, i32 0, metadata !323, null}
!1764 = metadata !{i32 63, i32 0, metadata !651, metadata !1763}
!1765 = metadata !{i32 64, i32 0, metadata !658, metadata !1763}
!1766 = metadata !{i32 65, i32 0, metadata !657, metadata !1763}
!1767 = metadata !{i32 66, i32 0, metadata !877, metadata !1763}
!1768 = metadata !{i32 761, i32 0, metadata !1769, null}
!1769 = metadata !{i32 786443, metadata !25, metadata !323, i32 761, i32 0, i32 167} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1770 = metadata !{i32 762, i32 0, metadata !1771, null}
!1771 = metadata !{i32 786443, metadata !25, metadata !1769, i32 761, i32 0, i32 168} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1772 = metadata !{i32 763, i32 0, metadata !1771, null}
!1773 = metadata !{i32 766, i32 0, metadata !332, null}
!1774 = metadata !{i32 768, i32 0, metadata !331, null}
!1775 = metadata !{i32 772, i32 0, metadata !1776, null}
!1776 = metadata !{i32 786443, metadata !25, metadata !331, i32 772, i32 0, i32 171} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1777 = metadata !{i32 773, i32 0, metadata !1776, null}
!1778 = metadata !{i32 777, i32 0, metadata !323, null}
!1779 = metadata !{i32 778, i32 0, metadata !323, null}
!1780 = metadata !{i32 779, i32 0, metadata !323, null}
!1781 = metadata !{i32 781, i32 0, metadata !333, null}
!1782 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1783} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1783 = metadata !{i32 783, i32 0, metadata !333, null}
!1784 = metadata !{i32 63, i32 0, metadata !651, metadata !1783}
!1785 = metadata !{i32 64, i32 0, metadata !658, metadata !1783}
!1786 = metadata !{i32 65, i32 0, metadata !657, metadata !1783}
!1787 = metadata !{i32 66, i32 0, metadata !877, metadata !1783}
!1788 = metadata !{i32 785, i32 0, metadata !333, null}
!1789 = metadata !{i32 787, i32 0, metadata !1790, null}
!1790 = metadata !{i32 786443, metadata !25, metadata !333, i32 787, i32 0, i32 172} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1791 = metadata !{i32 788, i32 0, metadata !1792, null}
!1792 = metadata !{i32 786443, metadata !25, metadata !1790, i32 787, i32 0, i32 173} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1793 = metadata !{i32 789, i32 0, metadata !1792, null}
!1794 = metadata !{i32 792, i32 0, metadata !1795, null}
!1795 = metadata !{i32 786443, metadata !25, metadata !333, i32 792, i32 0, i32 174} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1796 = metadata !{metadata !702, metadata !704, i64 72}
!1797 = metadata !{i32 793, i32 0, metadata !1798, null}
!1798 = metadata !{i32 786443, metadata !25, metadata !1795, i32 792, i32 0, i32 175} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1799 = metadata !{i32 794, i32 0, metadata !1798, null}
!1800 = metadata !{i32 795, i32 0, metadata !1798, null}
!1801 = metadata !{i32 798, i32 0, metadata !342, null}
!1802 = metadata !{i32 799, i32 0, metadata !1803, null}
!1803 = metadata !{i32 786443, metadata !25, metadata !342, i32 798, i32 0, i32 177} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1804 = metadata !{i32 800, i32 0, metadata !1803, null}
!1805 = metadata !{i32 801, i32 0, metadata !1803, null}
!1806 = metadata !{i32 804, i32 0, metadata !341, null}
!1807 = metadata !{i32 808, i32 0, metadata !1808, null}
!1808 = metadata !{i32 786443, metadata !25, metadata !341, i32 808, i32 0, i32 179} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1809 = metadata !{i32 809, i32 0, metadata !1808, null}
!1810 = metadata !{i32 812, i32 0, metadata !333, null}
!1811 = metadata !{i32 814, i32 0, metadata !343, null}
!1812 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1813} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1813 = metadata !{i32 815, i32 0, metadata !343, null}
!1814 = metadata !{i32 63, i32 0, metadata !651, metadata !1813}
!1815 = metadata !{i32 64, i32 0, metadata !658, metadata !1813}
!1816 = metadata !{i32 65, i32 0, metadata !657, metadata !1813}
!1817 = metadata !{i32 66, i32 0, metadata !877, metadata !1813}
!1818 = metadata !{i32 817, i32 0, metadata !1819, null}
!1819 = metadata !{i32 786443, metadata !25, metadata !343, i32 817, i32 0, i32 180} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1820 = metadata !{i32 818, i32 0, metadata !1821, null}
!1821 = metadata !{i32 786443, metadata !25, metadata !1819, i32 817, i32 0, i32 181} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1822 = metadata !{i32 819, i32 0, metadata !1821, null}
!1823 = metadata !{i32 822, i32 0, metadata !369, null}
!1824 = metadata !{i32 823, i32 0, metadata !1825, null}
!1825 = metadata !{i32 786443, metadata !25, metadata !369, i32 822, i32 0, i32 183} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1826 = metadata !{i32 824, i32 0, metadata !1825, null}
!1827 = metadata !{i32 825, i32 0, metadata !1825, null}
!1828 = metadata !{i32 827, i32 0, metadata !367, null}
!1829 = metadata !{i32 829, i32 0, metadata !366, null}
!1830 = metadata !{i32 832, i32 0, metadata !366, null}
!1831 = metadata !{i32 833, i32 0, metadata !1832, null}
!1832 = metadata !{i32 786443, metadata !25, metadata !366, i32 833, i32 0, i32 187} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1833 = metadata !{i32 838, i32 0, metadata !374, null}
!1834 = metadata !{i32 835, i32 0, metadata !1835, null}
!1835 = metadata !{i32 786443, metadata !25, metadata !1832, i32 834, i32 0, i32 188} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1836 = metadata !{i32 836, i32 0, metadata !1835, null}
!1837 = metadata !{i32 839, i32 0, metadata !373, null}
!1838 = metadata !{i32 840, i32 0, metadata !373, null}
!1839 = metadata !{metadata !1840, metadata !715, i64 0}
!1840 = metadata !{metadata !"dirent64", metadata !715, i64 0, metadata !715, i64 8, metadata !1841, i64 16, metadata !695, i64 18, metadata !695, i64 19}
!1841 = metadata !{metadata !"short", metadata !695, i64 0}
!1842 = metadata !{i32 841, i32 0, metadata !373, null}
!1843 = metadata !{metadata !1840, metadata !1841, i64 16}
!1844 = metadata !{i32 842, i32 0, metadata !373, null}
!1845 = metadata !{metadata !1840, metadata !695, i64 18}
!1846 = metadata !{i32 843, i32 0, metadata !373, null}
!1847 = metadata !{i32 844, i32 0, metadata !373, null}
!1848 = metadata !{i32 845, i32 0, metadata !373, null}
!1849 = metadata !{metadata !1840, metadata !715, i64 8}
!1850 = metadata !{i32 846, i32 0, metadata !373, null}
!1851 = metadata !{i32 847, i32 0, metadata !373, null}
!1852 = metadata !{i32 851, i32 0, metadata !366, null}
!1853 = metadata !{i32 852, i32 0, metadata !366, null}
!1854 = metadata !{i32 853, i32 0, metadata !366, null}
!1855 = metadata !{i32 854, i32 0, metadata !366, null}
!1856 = metadata !{i32 855, i32 0, metadata !366, null}
!1857 = metadata !{i32 856, i32 0, metadata !366, null}
!1858 = metadata !{i32 857, i32 0, metadata !366, null}
!1859 = metadata !{i32 858, i32 0, metadata !366, null}
!1860 = metadata !{i32 860, i32 0, metadata !366, null}
!1861 = metadata !{i32 862, i32 0, metadata !376, null}
!1862 = metadata !{i32 864, i32 0, metadata !376, null}
!1863 = metadata !{i32 873, i32 0, metadata !376, null}
!1864 = metadata !{i32 874, i32 0, metadata !376, null}
!1865 = metadata !{i32 875, i32 0, metadata !376, null}
!1866 = metadata !{i32 876, i32 0, metadata !376, null}
!1867 = metadata !{i32 877, i32 0, metadata !381, null}
!1868 = metadata !{i32 878, i32 0, metadata !1869, null}
!1869 = metadata !{i32 786443, metadata !25, metadata !381, i32 877, i32 0, i32 193} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1870 = metadata !{i32 879, i32 0, metadata !1869, null}
!1871 = metadata !{i32 880, i32 0, metadata !380, null}
!1872 = metadata !{i32 881, i32 0, metadata !380, null}
!1873 = metadata !{i32 885, i32 0, metadata !380, null}
!1874 = metadata !{i32 886, i32 0, metadata !383, null}
!1875 = metadata !{i32 887, i32 0, metadata !383, null}
!1876 = metadata !{i32 888, i32 0, metadata !383, null}
!1877 = metadata !{i32 895, i32 0, metadata !343, null}
!1878 = metadata !{i32 898, i32 0, metadata !384, null}
!1879 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !1880} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!1880 = metadata !{i32 902, i32 0, metadata !384, null}
!1881 = metadata !{i32 63, i32 0, metadata !651, metadata !1880}
!1882 = metadata !{i32 64, i32 0, metadata !658, metadata !1880}
!1883 = metadata !{i32 65, i32 0, metadata !657, metadata !1880}
!1884 = metadata !{i32 66, i32 0, metadata !877, metadata !1880}
!1885 = metadata !{i32 903, i32 0, metadata !384, null}
!1886 = metadata !{i32 910, i32 0, metadata !1887, null}
!1887 = metadata !{i32 786443, metadata !25, metadata !384, i32 910, i32 0, i32 196} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1888 = metadata !{i32 911, i32 0, metadata !1889, null}
!1889 = metadata !{i32 786443, metadata !25, metadata !1887, i32 910, i32 0, i32 197} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1890 = metadata !{i32 912, i32 0, metadata !1889, null}
!1891 = metadata !{i32 915, i32 0, metadata !384, null}
!1892 = metadata !{i32 916, i32 0, metadata !384, null}
!1893 = metadata !{i32 917, i32 0, metadata !384, null}
!1894 = metadata !{i32 919, i32 0, metadata !408, null}
!1895 = metadata !{i32 920, i32 0, metadata !407, null}
!1896 = metadata !{i32 922, i32 0, metadata !407, null}
!1897 = metadata !{i32 926, i32 0, metadata !410, null}
!1898 = metadata !{i32 929, i32 0, metadata !1899, null}
!1899 = metadata !{i32 786443, metadata !25, metadata !410, i32 929, i32 0, i32 202} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1900 = metadata !{metadata !1901, metadata !703, i64 24}
!1901 = metadata !{metadata !"stat", metadata !715, i64 0, metadata !715, i64 8, metadata !715, i64 16, metadata !703, i64 24, metadata !703, i64 28, metadata !703, i64 32, metadata !703, i64 36, metadata !715, i64 40, metadata !715, i64 48, metadata !715, i64 56, metadata !715, i64 64, metadata !716, i64 72, metadata !716, i64 88, metadata !716, i64 104, metadata !695, i64 120}
!1902 = metadata !{i32 932, i32 0, metadata !1903, null}
!1903 = metadata !{i32 786443, metadata !25, metadata !1899, i32 929, i32 0, i32 203} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1904 = metadata !{metadata !1905, metadata !703, i64 0}
!1905 = metadata !{metadata !"termios", metadata !703, i64 0, metadata !703, i64 4, metadata !703, i64 8, metadata !703, i64 12, metadata !695, i64 16, metadata !695, i64 17, metadata !703, i64 52, metadata !703, i64 56}
!1906 = metadata !{i32 933, i32 0, metadata !1903, null}
!1907 = metadata !{metadata !1905, metadata !703, i64 4}
!1908 = metadata !{i32 934, i32 0, metadata !1903, null}
!1909 = metadata !{metadata !1905, metadata !703, i64 8}
!1910 = metadata !{i32 935, i32 0, metadata !1903, null}
!1911 = metadata !{metadata !1905, metadata !703, i64 12}
!1912 = metadata !{i32 936, i32 0, metadata !1903, null}
!1913 = metadata !{metadata !1905, metadata !695, i64 16}
!1914 = metadata !{i32 937, i32 0, metadata !1903, null}
!1915 = metadata !{i32 938, i32 0, metadata !1903, null}
!1916 = metadata !{i32 939, i32 0, metadata !1903, null}
!1917 = metadata !{i32 940, i32 0, metadata !1903, null}
!1918 = metadata !{i32 941, i32 0, metadata !1903, null}
!1919 = metadata !{i32 942, i32 0, metadata !1903, null}
!1920 = metadata !{i32 943, i32 0, metadata !1903, null}
!1921 = metadata !{i32 944, i32 0, metadata !1903, null}
!1922 = metadata !{i32 945, i32 0, metadata !1903, null}
!1923 = metadata !{i32 946, i32 0, metadata !1903, null}
!1924 = metadata !{i32 947, i32 0, metadata !1903, null}
!1925 = metadata !{i32 948, i32 0, metadata !1903, null}
!1926 = metadata !{i32 949, i32 0, metadata !1903, null}
!1927 = metadata !{i32 950, i32 0, metadata !1903, null}
!1928 = metadata !{i32 951, i32 0, metadata !1903, null}
!1929 = metadata !{i32 952, i32 0, metadata !1903, null}
!1930 = metadata !{i32 953, i32 0, metadata !1903, null}
!1931 = metadata !{i32 954, i32 0, metadata !1903, null}
!1932 = metadata !{i32 955, i32 0, metadata !1903, null}
!1933 = metadata !{i32 956, i32 0, metadata !1903, null}
!1934 = metadata !{i32 958, i32 0, metadata !1935, null}
!1935 = metadata !{i32 786443, metadata !25, metadata !1899, i32 957, i32 0, i32 204} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1936 = metadata !{i32 959, i32 0, metadata !1935, null}
!1937 = metadata !{i32 964, i32 0, metadata !1938, null}
!1938 = metadata !{i32 786443, metadata !25, metadata !411, i32 962, i32 0, i32 205} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1939 = metadata !{i32 965, i32 0, metadata !1940, null}
!1940 = metadata !{i32 786443, metadata !25, metadata !1938, i32 965, i32 0, i32 206} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1941 = metadata !{i32 968, i32 0, metadata !1942, null}
!1942 = metadata !{i32 786443, metadata !25, metadata !1940, i32 967, i32 0, i32 208} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1943 = metadata !{i32 969, i32 0, metadata !1942, null}
!1944 = metadata !{i32 974, i32 0, metadata !1945, null}
!1945 = metadata !{i32 786443, metadata !25, metadata !411, i32 972, i32 0, i32 209} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1946 = metadata !{i32 975, i32 0, metadata !1947, null}
!1947 = metadata !{i32 786443, metadata !25, metadata !1945, i32 975, i32 0, i32 210} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1948 = metadata !{i32 978, i32 0, metadata !1949, null}
!1949 = metadata !{i32 786443, metadata !25, metadata !1947, i32 977, i32 0, i32 212} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1950 = metadata !{i32 979, i32 0, metadata !1949, null}
!1951 = metadata !{i32 984, i32 0, metadata !1952, null}
!1952 = metadata !{i32 786443, metadata !25, metadata !411, i32 982, i32 0, i32 213} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1953 = metadata !{i32 985, i32 0, metadata !1954, null}
!1954 = metadata !{i32 786443, metadata !25, metadata !1952, i32 985, i32 0, i32 214} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1955 = metadata !{i32 988, i32 0, metadata !1956, null}
!1956 = metadata !{i32 786443, metadata !25, metadata !1954, i32 987, i32 0, i32 216} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1957 = metadata !{i32 989, i32 0, metadata !1956, null}
!1958 = metadata !{i32 994, i32 0, metadata !431, null}
!1959 = metadata !{metadata !1960, metadata !1841, i64 0}
!1960 = metadata !{metadata !"winsize", metadata !1841, i64 0, metadata !1841, i64 2, metadata !1841, i64 4, metadata !1841, i64 6}
!1961 = metadata !{i32 995, i32 0, metadata !431, null}
!1962 = metadata !{metadata !1960, metadata !1841, i64 2}
!1963 = metadata !{i32 996, i32 0, metadata !431, null}
!1964 = metadata !{i32 997, i32 0, metadata !1965, null}
!1965 = metadata !{i32 786443, metadata !25, metadata !431, i32 997, i32 0, i32 218} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1966 = metadata !{i32 1000, i32 0, metadata !1967, null}
!1967 = metadata !{i32 786443, metadata !25, metadata !1965, i32 999, i32 0, i32 220} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1968 = metadata !{i32 1001, i32 0, metadata !1967, null}
!1969 = metadata !{i32 1006, i32 0, metadata !1970, null}
!1970 = metadata !{i32 786443, metadata !25, metadata !411, i32 1004, i32 0, i32 221} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1971 = metadata !{i32 1007, i32 0, metadata !1972, null}
!1972 = metadata !{i32 786443, metadata !25, metadata !1970, i32 1007, i32 0, i32 222} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1973 = metadata !{i32 1008, i32 0, metadata !1974, null}
!1974 = metadata !{i32 786443, metadata !25, metadata !1972, i32 1007, i32 0, i32 223} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1975 = metadata !{i32 1009, i32 0, metadata !1974, null}
!1976 = metadata !{i32 1011, i32 0, metadata !1977, null}
!1977 = metadata !{i32 786443, metadata !25, metadata !1972, i32 1010, i32 0, i32 224} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1978 = metadata !{i32 1012, i32 0, metadata !1977, null}
!1979 = metadata !{i32 1016, i32 0, metadata !441, null}
!1980 = metadata !{i32 1017, i32 0, metadata !441, null}
!1981 = metadata !{i32 1018, i32 0, metadata !1982, null}
!1982 = metadata !{i32 786443, metadata !25, metadata !441, i32 1018, i32 0, i32 226} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1983 = metadata !{i32 1019, i32 0, metadata !1984, null}
!1984 = metadata !{i32 786443, metadata !25, metadata !1985, i32 1019, i32 0, i32 228} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1985 = metadata !{i32 786443, metadata !25, metadata !1982, i32 1018, i32 0, i32 227} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1986 = metadata !{i32 1020, i32 0, metadata !1987, null}
!1987 = metadata !{i32 786443, metadata !25, metadata !1984, i32 1019, i32 0, i32 229} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1988 = metadata !{i32 1021, i32 0, metadata !1987, null}
!1989 = metadata !{i32 1024, i32 0, metadata !1985, null}
!1990 = metadata !{i32 1026, i32 0, metadata !1991, null}
!1991 = metadata !{i32 786443, metadata !25, metadata !1982, i32 1025, i32 0, i32 231} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1992 = metadata !{i32 1027, i32 0, metadata !1991, null}
!1993 = metadata !{i32 1031, i32 0, metadata !1994, null}
!1994 = metadata !{i32 786443, metadata !25, metadata !411, i32 1030, i32 0, i32 232} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!1995 = metadata !{i32 1032, i32 0, metadata !1994, null}
!1996 = metadata !{i32 1033, i32 0, metadata !1994, null}
!1997 = metadata !{i32 1036, i32 0, metadata !411, null}
!1998 = metadata !{i32 1037, i32 0, metadata !411, null}
!1999 = metadata !{i32 1038, i32 0, metadata !411, null}
!2000 = metadata !{i32 1041, i32 0, metadata !444, null}
!2001 = metadata !{i32 1042, i32 0, metadata !2002, null}
!2002 = metadata !{i32 786443, metadata !25, metadata !444, i32 1042, i32 0, i32 234} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2003 = metadata !{i32 1043, i32 0, metadata !2002, null}
!2004 = metadata !{i32 1046, i32 0, metadata !384, null}
!2005 = metadata !{i32 1048, i32 0, metadata !445, null}
!2006 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2007} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2007 = metadata !{i32 1049, i32 0, metadata !445, null}
!2008 = metadata !{i32 63, i32 0, metadata !651, metadata !2007}
!2009 = metadata !{i32 64, i32 0, metadata !658, metadata !2007}
!2010 = metadata !{i32 65, i32 0, metadata !657, metadata !2007}
!2011 = metadata !{i32 66, i32 0, metadata !877, metadata !2007}
!2012 = metadata !{i32 1050, i32 0, metadata !445, null}
!2013 = metadata !{i32 1053, i32 0, metadata !2014, null}
!2014 = metadata !{i32 786443, metadata !25, metadata !445, i32 1053, i32 0, i32 235} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2015 = metadata !{i32 1054, i32 0, metadata !2016, null}
!2016 = metadata !{i32 786443, metadata !25, metadata !2014, i32 1053, i32 0, i32 236} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2017 = metadata !{i32 1055, i32 0, metadata !2016, null}
!2018 = metadata !{i32 1058, i32 0, metadata !2019, null}
!2019 = metadata !{i32 786443, metadata !25, metadata !445, i32 1058, i32 0, i32 237} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2020 = metadata !{i32 1062, i32 0, metadata !2021, null}
!2021 = metadata !{i32 786443, metadata !25, metadata !2019, i32 1061, i32 0, i32 239} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2022 = metadata !{i32 1063, i32 0, metadata !2021, null}
!2023 = metadata !{i32 1064, i32 0, metadata !2021, null}
!2024 = metadata !{i32 1067, i32 0, metadata !458, null}
!2025 = metadata !{i32 1068, i32 0, metadata !457, null}
!2026 = metadata !{i32 1070, i32 0, metadata !455, null}
!2027 = metadata !{i32 1071, i32 0, metadata !2028, null}
!2028 = metadata !{i32 786443, metadata !25, metadata !455, i32 1071, i32 0, i32 244} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2029 = metadata !{i32 1}
!2030 = metadata !{i32 1072, i32 0, metadata !2028, null}
!2031 = metadata !{i32 1073, i32 0, metadata !455, null}
!2032 = metadata !{i32 1076, i32 0, metadata !2033, null}
!2033 = metadata !{i32 786443, metadata !25, metadata !456, i32 1075, i32 0, i32 245} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2034 = metadata !{i32 1077, i32 0, metadata !2035, null}
!2035 = metadata !{i32 786443, metadata !25, metadata !2033, i32 1077, i32 0, i32 246} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2036 = metadata !{i32 1078, i32 0, metadata !2035, null}
!2037 = metadata !{i32 1079, i32 0, metadata !2033, null}
!2038 = metadata !{i32 1091, i32 0, metadata !456, null}
!2039 = metadata !{i32 1092, i32 0, metadata !456, null}
!2040 = metadata !{i32 1093, i32 0, metadata !456, null}
!2041 = metadata !{i32 1096, i32 0, metadata !460, null}
!2042 = metadata !{i32 1097, i32 0, metadata !2043, null}
!2043 = metadata !{i32 786443, metadata !25, metadata !460, i32 1097, i32 0, i32 249} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2044 = metadata !{i32 1098, i32 0, metadata !2043, null}
!2045 = metadata !{i32 1101, i32 0, metadata !445, null}
!2046 = metadata !{i32 1103, i32 0, metadata !461, null}
!2047 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2048} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2048 = metadata !{i32 1104, i32 0, metadata !461, null}
!2049 = metadata !{i32 39, i32 0, metadata !666, metadata !2048}
!2050 = metadata !{i32 40, i32 0, metadata !666, metadata !2048}
!2051 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2048} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2052 = metadata !{i32 43, i32 0, metadata !699, metadata !2048}
!2053 = metadata !{i32 46, i32 0, metadata !677, metadata !2048}
!2054 = metadata !{i32 47, i32 0, metadata !675, metadata !2048}
!2055 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2048} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2056 = metadata !{i32 48, i32 0, metadata !674, metadata !2048}
!2057 = metadata !{i32 49, i32 0, metadata !710, metadata !2048}
!2058 = metadata !{i32 1105, i32 0, metadata !2059, null}
!2059 = metadata !{i32 786443, metadata !25, metadata !461, i32 1105, i32 0, i32 250} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2060 = metadata !{i32 1107, i32 0, metadata !2061, null}
!2061 = metadata !{i32 786443, metadata !25, metadata !2059, i32 1105, i32 0, i32 251} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2062 = metadata !{i32 1108, i32 0, metadata !2061, null}
!2063 = metadata !{i32 1109, i32 0, metadata !2061, null}
!2064 = metadata !{i32 786689, metadata !613, metadata !"s", metadata !26, i32 16778644, metadata !30, i32 0, metadata !2065} ; [ DW_TAG_arg_variable ] [s] [line 1428]
!2065 = metadata !{i32 1113, i32 0, metadata !499, null}
!2066 = metadata !{i32 1428, i32 0, metadata !613, metadata !2065}
!2067 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !2068} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!2068 = metadata !{i32 1429, i32 0, metadata !613, metadata !2065}
!2069 = metadata !{i32 1415, i32 0, metadata !632, metadata !2068}
!2070 = metadata !{i32 1417, i32 0, metadata !632, metadata !2068}
!2071 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !2068} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!2072 = metadata !{i32 1418, i32 0, metadata !632, metadata !2068}
!2073 = metadata !{i32 786688, metadata !613, metadata !"sc", metadata !26, i32 1429, metadata !44, i32 0, metadata !2065} ; [ DW_TAG_auto_variable ] [sc] [line 1429]
!2074 = metadata !{i32 786688, metadata !613, metadata !"i", metadata !26, i32 1430, metadata !42, i32 0, metadata !2065} ; [ DW_TAG_auto_variable ] [i] [line 1430]
!2075 = metadata !{i32 1432, i32 0, metadata !622, metadata !2065}
!2076 = metadata !{i32 1433, i32 0, metadata !621, metadata !2065}
!2077 = metadata !{i32 786688, metadata !621, metadata !"c", metadata !26, i32 1433, metadata !32, i32 0, metadata !2065} ; [ DW_TAG_auto_variable ] [c] [line 1433]
!2078 = metadata !{i32 1434, i32 0, metadata !625, metadata !2065}
!2079 = metadata !{i32 1435, i32 0, metadata !734, metadata !2065}
!2080 = metadata !{i32 1436, i32 0, metadata !737, metadata !2065}
!2081 = metadata !{i32 1437, i32 0, metadata !737, metadata !2065}
!2082 = metadata !{i32 1439, i32 0, metadata !740, metadata !2065}
!2083 = metadata !{i32 1440, i32 0, metadata !740, metadata !2065}
!2084 = metadata !{i32 1442, i32 0, metadata !624, metadata !2065}
!2085 = metadata !{i32 786688, metadata !624, metadata !"cc", metadata !26, i32 1442, metadata !32, i32 0, metadata !2065} ; [ DW_TAG_auto_variable ] [cc] [line 1442]
!2086 = metadata !{i32 1443, i32 0, metadata !624, metadata !2065}
!2087 = metadata !{i32 1444, i32 0, metadata !624, metadata !2065}
!2088 = metadata !{i32 1445, i32 0, metadata !748, metadata !2065}
!2089 = metadata !{i32 1114, i32 0, metadata !2090, null}
!2090 = metadata !{i32 786443, metadata !25, metadata !499, i32 1114, i32 0, i32 253} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2091 = metadata !{i32 1115, i32 0, metadata !2090, null}
!2092 = metadata !{i32 1118, i32 0, metadata !461, null}
!2093 = metadata !{i32 1120, i32 0, metadata !500, null}
!2094 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2095} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2095 = metadata !{i32 1121, i32 0, metadata !500, null}
!2096 = metadata !{i32 63, i32 0, metadata !651, metadata !2095}
!2097 = metadata !{i32 64, i32 0, metadata !658, metadata !2095}
!2098 = metadata !{i32 65, i32 0, metadata !657, metadata !2095}
!2099 = metadata !{i32 66, i32 0, metadata !877, metadata !2095}
!2100 = metadata !{i32 1123, i32 0, metadata !2101, null}
!2101 = metadata !{i32 786443, metadata !25, metadata !500, i32 1123, i32 0, i32 254} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2102 = metadata !{i32 1124, i32 0, metadata !2103, null}
!2103 = metadata !{i32 786443, metadata !25, metadata !2101, i32 1123, i32 0, i32 255} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2104 = metadata !{i32 1125, i32 0, metadata !2103, null}
!2105 = metadata !{i32 1128, i32 0, metadata !509, null}
!2106 = metadata !{i32 1129, i32 0, metadata !2107, null}
!2107 = metadata !{i32 786443, metadata !25, metadata !509, i32 1128, i32 0, i32 257} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2108 = metadata !{i32 1130, i32 0, metadata !2107, null}
!2109 = metadata !{i32 1131, i32 0, metadata !2107, null}
!2110 = metadata !{i32 1133, i32 0, metadata !508, null}
!2111 = metadata !{i32 1134, i32 0, metadata !2112, null}
!2112 = metadata !{i32 786443, metadata !25, metadata !508, i32 1134, i32 0, i32 259} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2113 = metadata !{i32 1135, i32 0, metadata !2112, null}
!2114 = metadata !{i32 1138, i32 0, metadata !500, null}
!2115 = metadata !{i32 1140, i32 0, metadata !510, null}
!2116 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2117} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2117 = metadata !{i32 1141, i32 0, metadata !510, null}
!2118 = metadata !{i32 63, i32 0, metadata !651, metadata !2117}
!2119 = metadata !{i32 64, i32 0, metadata !658, metadata !2117}
!2120 = metadata !{i32 65, i32 0, metadata !657, metadata !2117}
!2121 = metadata !{i32 66, i32 0, metadata !877, metadata !2117}
!2122 = metadata !{i32 1143, i32 0, metadata !517, null}
!2123 = metadata !{i32 1144, i32 0, metadata !2124, null}
!2124 = metadata !{i32 786443, metadata !25, metadata !517, i32 1143, i32 0, i32 261} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2125 = metadata !{i32 1145, i32 0, metadata !2124, null}
!2126 = metadata !{i32 1146, i32 0, metadata !516, null}
!2127 = metadata !{i32 1149, i32 0, metadata !515, null}
!2128 = metadata !{i32 1150, i32 0, metadata !2129, null}
!2129 = metadata !{i32 786443, metadata !25, metadata !515, i32 1150, i32 0, i32 265} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2130 = metadata !{i32 1151, i32 0, metadata !2129, null}
!2131 = metadata !{i32 1154, i32 0, metadata !510, null}
!2132 = metadata !{i32 1156, i32 0, metadata !518, null}
!2133 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2134} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2134 = metadata !{i32 1157, i32 0, metadata !518, null}
!2135 = metadata !{i32 63, i32 0, metadata !651, metadata !2134}
!2136 = metadata !{i32 64, i32 0, metadata !658, metadata !2134}
!2137 = metadata !{i32 65, i32 0, metadata !657, metadata !2134}
!2138 = metadata !{i32 66, i32 0, metadata !877, metadata !2134}
!2139 = metadata !{i32 1159, i32 0, metadata !525, null}
!2140 = metadata !{i32 1160, i32 0, metadata !2141, null}
!2141 = metadata !{i32 786443, metadata !25, metadata !525, i32 1159, i32 0, i32 267} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2142 = metadata !{i32 1161, i32 0, metadata !2141, null}
!2143 = metadata !{i32 1163, i32 0, metadata !524, null}
!2144 = metadata !{i32 1164, i32 0, metadata !2145, null}
!2145 = metadata !{i32 786443, metadata !25, metadata !524, i32 1164, i32 0, i32 269} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2146 = metadata !{i32 786689, metadata !160, metadata !"fd", metadata !26, i32 16777519, metadata !29, i32 0, metadata !2144} ; [ DW_TAG_arg_variable ] [fd] [line 303]
!2147 = metadata !{i32 303, i32 0, metadata !160, metadata !2144}
!2148 = metadata !{i32 786688, metadata !160, metadata !"r", metadata !26, i32 306, metadata !29, i32 0, metadata !2144} ; [ DW_TAG_auto_variable ] [r] [line 306]
!2149 = metadata !{i32 306, i32 0, metadata !160, metadata !2144}
!2150 = metadata !{i32 308, i32 0, metadata !160, metadata !2144}
!2151 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2152} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2152 = metadata !{i32 310, i32 0, metadata !160, metadata !2144}
!2153 = metadata !{i32 63, i32 0, metadata !651, metadata !2152}
!2154 = metadata !{i32 64, i32 0, metadata !658, metadata !2152}
!2155 = metadata !{i32 311, i32 0, metadata !1090, metadata !2144}
!2156 = metadata !{i32 786688, metadata !160, metadata !"f", metadata !26, i32 305, metadata !105, i32 0, metadata !2144} ; [ DW_TAG_auto_variable ] [f] [line 305]
!2157 = metadata !{i32 312, i32 0, metadata !1092, metadata !2144}
!2158 = metadata !{i32 313, i32 0, metadata !1092, metadata !2144}
!2159 = metadata !{i32 316, i32 0, metadata !1095, metadata !2144}
!2160 = metadata !{i32 317, i32 0, metadata !1099, metadata !2144}
!2161 = metadata !{i32 318, i32 0, metadata !1099, metadata !2144}
!2162 = metadata !{i32 319, i32 0, metadata !1099, metadata !2144}
!2163 = metadata !{i32 330, i32 0, metadata !160, metadata !2144}
!2164 = metadata !{i32 332, i32 0, metadata !160, metadata !2144}
!2165 = metadata !{i32 1168, i32 0, metadata !524, null}
!2166 = metadata !{i64 0, i64 4, metadata !752, i64 4, i64 4, metadata !752, i64 8, i64 8, metadata !2167, i64 16, i64 8, metadata !2168}
!2167 = metadata !{metadata !715, metadata !715, i64 0}
!2168 = metadata !{metadata !704, metadata !704, i64 0}
!2169 = metadata !{i32 1170, i32 0, metadata !524, null}
!2170 = metadata !{i32 1177, i32 0, metadata !524, null}
!2171 = metadata !{i32 1179, i32 0, metadata !518, null}
!2172 = metadata !{i32 1181, i32 0, metadata !526, null}
!2173 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2174} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2174 = metadata !{i32 1182, i32 0, metadata !526, null}
!2175 = metadata !{i32 63, i32 0, metadata !651, metadata !2174}
!2176 = metadata !{i32 64, i32 0, metadata !658, metadata !2174}
!2177 = metadata !{i32 65, i32 0, metadata !657, metadata !2174}
!2178 = metadata !{i32 66, i32 0, metadata !877, metadata !2174}
!2179 = metadata !{i32 1183, i32 0, metadata !532, null}
!2180 = metadata !{i32 1184, i32 0, metadata !2181, null}
!2181 = metadata !{i32 786443, metadata !25, metadata !532, i32 1183, i32 0, i32 271} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2182 = metadata !{i32 1185, i32 0, metadata !2181, null}
!2183 = metadata !{i32 1188, i32 0, metadata !2184, null}
!2184 = metadata !{i32 786443, metadata !25, metadata !531, i32 1188, i32 0, i32 273} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2185 = metadata !{i32 1189, i32 0, metadata !2186, null}
!2186 = metadata !{i32 786443, metadata !25, metadata !2184, i32 1189, i32 0, i32 274} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2187 = metadata !{i32 1191, i32 0, metadata !2188, null}
!2188 = metadata !{i32 786443, metadata !25, metadata !531, i32 1191, i32 0, i32 275} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2189 = metadata !{i32 1192, i32 0, metadata !2190, null}
!2190 = metadata !{i32 786443, metadata !25, metadata !2188, i32 1191, i32 0, i32 276} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2191 = metadata !{i32 1193, i32 0, metadata !2190, null}
!2192 = metadata !{i32 1195, i32 0, metadata !2193, null}
!2193 = metadata !{i32 786443, metadata !25, metadata !2188, i32 1194, i32 0, i32 277} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2194 = metadata !{i32 1198, i32 0, metadata !526, null}
!2195 = metadata !{i32 1200, i32 0, metadata !533, null}
!2196 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2197} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2197 = metadata !{i32 1201, i32 0, metadata !533, null}
!2198 = metadata !{i32 39, i32 0, metadata !666, metadata !2197}
!2199 = metadata !{i32 40, i32 0, metadata !666, metadata !2197}
!2200 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2197} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2201 = metadata !{i32 43, i32 0, metadata !699, metadata !2197}
!2202 = metadata !{i32 46, i32 0, metadata !677, metadata !2197}
!2203 = metadata !{i32 47, i32 0, metadata !675, metadata !2197}
!2204 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2197} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2205 = metadata !{i32 48, i32 0, metadata !674, metadata !2197}
!2206 = metadata !{i32 49, i32 0, metadata !710, metadata !2197}
!2207 = metadata !{i32 1202, i32 0, metadata !2208, null}
!2208 = metadata !{i32 786443, metadata !25, metadata !533, i32 1202, i32 0, i32 278} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2209 = metadata !{i32 1204, i32 0, metadata !2210, null}
!2210 = metadata !{i32 786443, metadata !25, metadata !2211, i32 1204, i32 0, i32 280} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2211 = metadata !{i32 786443, metadata !25, metadata !2208, i32 1202, i32 0, i32 279} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2212 = metadata !{i32 1205, i32 0, metadata !2213, null}
!2213 = metadata !{i32 786443, metadata !25, metadata !2210, i32 1204, i32 0, i32 281} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2214 = metadata !{i32 1206, i32 0, metadata !2213, null}
!2215 = metadata !{i32 1208, i32 0, metadata !2216, null}
!2216 = metadata !{i32 786443, metadata !25, metadata !2210, i32 1207, i32 0, i32 282} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2217 = metadata !{i32 1209, i32 0, metadata !2216, null}
!2218 = metadata !{i32 1213, i32 0, metadata !533, null}
!2219 = metadata !{i32 1214, i32 0, metadata !533, null}
!2220 = metadata !{i32 1215, i32 0, metadata !533, null}
!2221 = metadata !{i32 1216, i32 0, metadata !533, null}
!2222 = metadata !{i32 1218, i32 0, metadata !537, null}
!2223 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2224} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2224 = metadata !{i32 1219, i32 0, metadata !537, null}
!2225 = metadata !{i32 39, i32 0, metadata !666, metadata !2224}
!2226 = metadata !{i32 40, i32 0, metadata !666, metadata !2224}
!2227 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2224} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2228 = metadata !{i32 43, i32 0, metadata !699, metadata !2224}
!2229 = metadata !{i32 46, i32 0, metadata !677, metadata !2224}
!2230 = metadata !{i32 47, i32 0, metadata !675, metadata !2224}
!2231 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2224} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2232 = metadata !{i32 48, i32 0, metadata !674, metadata !2224}
!2233 = metadata !{i32 49, i32 0, metadata !710, metadata !2224}
!2234 = metadata !{i32 1220, i32 0, metadata !2235, null}
!2235 = metadata !{i32 786443, metadata !25, metadata !537, i32 1220, i32 0, i32 283} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2236 = metadata !{i32 1222, i32 0, metadata !2237, null}
!2237 = metadata !{i32 786443, metadata !25, metadata !2238, i32 1222, i32 0, i32 285} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2238 = metadata !{i32 786443, metadata !25, metadata !2235, i32 1220, i32 0, i32 284} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2239 = metadata !{i32 1223, i32 0, metadata !2240, null}
!2240 = metadata !{i32 786443, metadata !25, metadata !2237, i32 1222, i32 0, i32 286} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2241 = metadata !{i32 1224, i32 0, metadata !2240, null}
!2242 = metadata !{i32 1225, i32 0, metadata !2243, null}
!2243 = metadata !{i32 786443, metadata !25, metadata !2237, i32 1225, i32 0, i32 287} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2244 = metadata !{i32 1226, i32 0, metadata !2245, null}
!2245 = metadata !{i32 786443, metadata !25, metadata !2243, i32 1225, i32 0, i32 288} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2246 = metadata !{i32 1227, i32 0, metadata !2245, null}
!2247 = metadata !{i32 1229, i32 0, metadata !2248, null}
!2248 = metadata !{i32 786443, metadata !25, metadata !2243, i32 1228, i32 0, i32 289} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2249 = metadata !{i32 1230, i32 0, metadata !2248, null}
!2250 = metadata !{i32 1234, i32 0, metadata !537, null}
!2251 = metadata !{i32 1235, i32 0, metadata !537, null}
!2252 = metadata !{i32 1236, i32 0, metadata !537, null}
!2253 = metadata !{i32 1237, i32 0, metadata !537, null}
!2254 = metadata !{i32 1239, i32 0, metadata !541, null}
!2255 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2256} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2256 = metadata !{i32 1242, i32 0, metadata !541, null}
!2257 = metadata !{i32 39, i32 0, metadata !666, metadata !2256}
!2258 = metadata !{i32 40, i32 0, metadata !666, metadata !2256}
!2259 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2256} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2260 = metadata !{i32 43, i32 0, metadata !699, metadata !2256}
!2261 = metadata !{i32 46, i32 0, metadata !677, metadata !2256}
!2262 = metadata !{i32 47, i32 0, metadata !675, metadata !2256}
!2263 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2256} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2264 = metadata !{i32 48, i32 0, metadata !674, metadata !2256}
!2265 = metadata !{i32 49, i32 0, metadata !710, metadata !2256}
!2266 = metadata !{i32 1243, i32 0, metadata !2267, null}
!2267 = metadata !{i32 786443, metadata !25, metadata !541, i32 1243, i32 0, i32 290} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2268 = metadata !{i32 1245, i32 0, metadata !2269, null}
!2269 = metadata !{i32 786443, metadata !25, metadata !2270, i32 1245, i32 0, i32 292} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2270 = metadata !{i32 786443, metadata !25, metadata !2267, i32 1243, i32 0, i32 291} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2271 = metadata !{i32 1246, i32 0, metadata !2272, null}
!2272 = metadata !{i32 786443, metadata !25, metadata !2269, i32 1245, i32 0, i32 293} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2273 = metadata !{i32 1247, i32 0, metadata !2272, null}
!2274 = metadata !{i32 1248, i32 0, metadata !2275, null}
!2275 = metadata !{i32 786443, metadata !25, metadata !2269, i32 1248, i32 0, i32 294} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2276 = metadata !{i32 1249, i32 0, metadata !2277, null}
!2277 = metadata !{i32 786443, metadata !25, metadata !2275, i32 1248, i32 0, i32 295} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2278 = metadata !{i32 1250, i32 0, metadata !2277, null}
!2279 = metadata !{i32 1252, i32 0, metadata !2280, null}
!2280 = metadata !{i32 786443, metadata !25, metadata !2275, i32 1251, i32 0, i32 296} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2281 = metadata !{i32 1253, i32 0, metadata !2280, null}
!2282 = metadata !{i32 1257, i32 0, metadata !541, null}
!2283 = metadata !{i32 1258, i32 0, metadata !541, null}
!2284 = metadata !{i32 1259, i32 0, metadata !541, null}
!2285 = metadata !{i32 1260, i32 0, metadata !541, null}
!2286 = metadata !{i32 1262, i32 0, metadata !549, null}
!2287 = metadata !{i32 786689, metadata !666, metadata !"pathname", metadata !26, i32 16777255, metadata !30, i32 0, metadata !2288} ; [ DW_TAG_arg_variable ] [pathname] [line 39]
!2288 = metadata !{i32 1263, i32 0, metadata !549, null}
!2289 = metadata !{i32 39, i32 0, metadata !666, metadata !2288}
!2290 = metadata !{i32 40, i32 0, metadata !666, metadata !2288}
!2291 = metadata !{i32 786688, metadata !666, metadata !"c", metadata !26, i32 40, metadata !32, i32 0, metadata !2288} ; [ DW_TAG_auto_variable ] [c] [line 40]
!2292 = metadata !{i32 43, i32 0, metadata !699, metadata !2288}
!2293 = metadata !{i32 46, i32 0, metadata !677, metadata !2288}
!2294 = metadata !{i32 47, i32 0, metadata !675, metadata !2288}
!2295 = metadata !{i32 786688, metadata !666, metadata !"i", metadata !26, i32 41, metadata !42, i32 0, metadata !2288} ; [ DW_TAG_auto_variable ] [i] [line 41]
!2296 = metadata !{i32 48, i32 0, metadata !674, metadata !2288}
!2297 = metadata !{i32 49, i32 0, metadata !710, metadata !2288}
!2298 = metadata !{i32 1264, i32 0, metadata !559, null}
!2299 = metadata !{i32 1267, i32 0, metadata !2300, null}
!2300 = metadata !{i32 786443, metadata !25, metadata !2301, i32 1267, i32 0, i32 299} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2301 = metadata !{i32 786443, metadata !25, metadata !559, i32 1264, i32 0, i32 298} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2302 = metadata !{i32 1268, i32 0, metadata !2303, null}
!2303 = metadata !{i32 786443, metadata !25, metadata !2300, i32 1267, i32 0, i32 300} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2304 = metadata !{i32 1269, i32 0, metadata !2305, null}
!2305 = metadata !{i32 786443, metadata !25, metadata !2303, i32 1269, i32 0, i32 301} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2306 = metadata !{i32 1270, i32 0, metadata !2307, null}
!2307 = metadata !{i32 786443, metadata !25, metadata !2303, i32 1270, i32 0, i32 302} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2308 = metadata !{i32 1271, i32 0, metadata !2309, null}
!2309 = metadata !{i32 786443, metadata !25, metadata !2303, i32 1271, i32 0, i32 303} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2310 = metadata !{i32 1272, i32 0, metadata !2311, null}
!2311 = metadata !{i32 786443, metadata !25, metadata !2303, i32 1272, i32 0, i32 304} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2312 = metadata !{i32 1273, i32 0, metadata !2303, null}
!2313 = metadata !{i32 1275, i32 0, metadata !2314, null}
!2314 = metadata !{i32 786443, metadata !25, metadata !2300, i32 1274, i32 0, i32 305} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2315 = metadata !{i32 1276, i32 0, metadata !2314, null}
!2316 = metadata !{i32 1279, i32 0, metadata !558, null}
!2317 = metadata !{i32 1280, i32 0, metadata !2318, null}
!2318 = metadata !{i32 786443, metadata !25, metadata !558, i32 1280, i32 0, i32 307} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2319 = metadata !{i32 1281, i32 0, metadata !2318, null}
!2320 = metadata !{i32 1282, i32 0, metadata !558, null}
!2321 = metadata !{i32 1284, i32 0, metadata !549, null}
!2322 = metadata !{i32 1294, i32 0, metadata !560, null}
!2323 = metadata !{i32 1295, i32 0, metadata !560, null}
!2324 = metadata !{i32 1296, i32 0, metadata !560, null}
!2325 = metadata !{i32 1297, i32 0, metadata !560, null}
!2326 = metadata !{i32 1299, i32 0, metadata !2327, null}
!2327 = metadata !{i32 786443, metadata !25, metadata !560, i32 1299, i32 0, i32 308} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2328 = metadata !{i32 1300, i32 0, metadata !2329, null}
!2329 = metadata !{i32 786443, metadata !25, metadata !2327, i32 1299, i32 0, i32 309} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2330 = metadata !{i64 0, i64 128, metadata !694}
!2331 = metadata !{i32 1301, i32 0, metadata !2329, null}
!2332 = metadata !{i32 1302, i32 0, metadata !2329, null}
!2333 = metadata !{i32 1303, i32 0, metadata !2334, null}
!2334 = metadata !{i32 786443, metadata !25, metadata !2327, i32 1302, i32 0, i32 310} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2335 = metadata !{i32 1306, i32 0, metadata !2336, null}
!2336 = metadata !{i32 786443, metadata !25, metadata !560, i32 1306, i32 0, i32 311} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2337 = metadata !{i32 1307, i32 0, metadata !2338, null}
!2338 = metadata !{i32 786443, metadata !25, metadata !2336, i32 1306, i32 0, i32 312} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2339 = metadata !{i32 1308, i32 0, metadata !2338, null}
!2340 = metadata !{i32 1309, i32 0, metadata !2338, null}
!2341 = metadata !{i32 1310, i32 0, metadata !2342, null}
!2342 = metadata !{i32 786443, metadata !25, metadata !2336, i32 1309, i32 0, i32 313} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2343 = metadata !{i32 1313, i32 0, metadata !2344, null}
!2344 = metadata !{i32 786443, metadata !25, metadata !560, i32 1313, i32 0, i32 314} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2345 = metadata !{i32 1314, i32 0, metadata !2346, null}
!2346 = metadata !{i32 786443, metadata !25, metadata !2344, i32 1313, i32 0, i32 315} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2347 = metadata !{i32 1315, i32 0, metadata !2346, null}
!2348 = metadata !{i32 1316, i32 0, metadata !2346, null}
!2349 = metadata !{i32 1317, i32 0, metadata !2350, null}
!2350 = metadata !{i32 786443, metadata !25, metadata !2344, i32 1316, i32 0, i32 316} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2351 = metadata !{i32 1320, i32 0, metadata !560, null}
!2352 = metadata !{i32 1321, i32 0, metadata !560, null}
!2353 = metadata !{i32 1322, i32 0, metadata !560, null}
!2354 = metadata !{i32 1325, i32 0, metadata !593, null}
!2355 = metadata !{i32 1326, i32 0, metadata !591, null}
!2356 = metadata !{i32 undef}
!2357 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2358} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2358 = metadata !{i32 1327, i32 0, metadata !590, null}
!2359 = metadata !{i32 63, i32 0, metadata !651, metadata !2358}
!2360 = metadata !{i32 64, i32 0, metadata !658, metadata !2358}
!2361 = metadata !{i32 66, i32 0, metadata !877, metadata !2358}
!2362 = metadata !{i32 65, i32 0, metadata !657, metadata !2358}
!2363 = metadata !{i32 1328, i32 0, metadata !2364, null}
!2364 = metadata !{i32 786443, metadata !25, metadata !590, i32 1328, i32 0, i32 321} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2365 = metadata !{i32 1329, i32 0, metadata !2366, null}
!2366 = metadata !{i32 786443, metadata !25, metadata !2364, i32 1328, i32 0, i32 322} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2367 = metadata !{i32 1330, i32 0, metadata !2366, null}
!2368 = metadata !{i32 1331, i32 0, metadata !2369, null}
!2369 = metadata !{i32 786443, metadata !25, metadata !2364, i32 1331, i32 0, i32 323} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2370 = metadata !{i32 1333, i32 0, metadata !2371, null}
!2371 = metadata !{i32 786443, metadata !25, metadata !2372, i32 1333, i32 0, i32 325} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2372 = metadata !{i32 786443, metadata !25, metadata !2369, i32 1331, i32 0, i32 324} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2373 = metadata !{i32 1334, i32 0, metadata !2374, null}
!2374 = metadata !{i32 786443, metadata !25, metadata !2372, i32 1334, i32 0, i32 326} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2375 = metadata !{i32 1335, i32 0, metadata !2376, null}
!2376 = metadata !{i32 786443, metadata !25, metadata !2372, i32 1335, i32 0, i32 327} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2377 = metadata !{i32 1336, i32 0, metadata !2372, null}
!2378 = metadata !{i32 1337, i32 0, metadata !2372, null}
!2379 = metadata !{i32 1338, i32 0, metadata !2380, null}
!2380 = metadata !{i32 786443, metadata !25, metadata !2381, i32 1338, i32 0, i32 329} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2381 = metadata !{i32 786443, metadata !25, metadata !2369, i32 1337, i32 0, i32 328} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2382 = metadata !{i32 1339, i32 0, metadata !2383, null}
!2383 = metadata !{i32 786443, metadata !25, metadata !2381, i32 1339, i32 0, i32 330} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2384 = metadata !{i32 1340, i32 0, metadata !2385, null}
!2385 = metadata !{i32 786443, metadata !25, metadata !2381, i32 1340, i32 0, i32 331} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2386 = metadata !{i32 1341, i32 0, metadata !2387, null}
!2387 = metadata !{i32 786443, metadata !25, metadata !2381, i32 1341, i32 0, i32 332} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2388 = metadata !{i32 1346, i32 0, metadata !596, null}
!2389 = metadata !{i32 1349, i32 0, metadata !595, null}
!2390 = metadata !{i32 1350, i32 0, metadata !595, null}
!2391 = metadata !{i32 1353, i32 0, metadata !602, null}
!2392 = metadata !{i32 1356, i32 0, metadata !2393, null}
!2393 = metadata !{i32 786443, metadata !25, metadata !2394, i32 1356, i32 0, i32 337} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2394 = metadata !{i32 786443, metadata !25, metadata !602, i32 1353, i32 0, i32 336} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2395 = metadata !{i32 1357, i32 0, metadata !2396, null}
!2396 = metadata !{i32 786443, metadata !25, metadata !2393, i32 1356, i32 0, i32 338} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2397 = metadata !{i32 1358, i32 0, metadata !2396, null}
!2398 = metadata !{i32 1361, i32 0, metadata !601, null}
!2399 = metadata !{i32 1364, i32 0, metadata !600, null}
!2400 = metadata !{i32 786689, metadata !651, metadata !"fd", metadata !26, i32 16777279, metadata !29, i32 0, metadata !2401} ; [ DW_TAG_arg_variable ] [fd] [line 63]
!2401 = metadata !{i32 1365, i32 0, metadata !599, null}
!2402 = metadata !{i32 63, i32 0, metadata !651, metadata !2401}
!2403 = metadata !{i32 64, i32 0, metadata !658, metadata !2401}
!2404 = metadata !{i32 66, i32 0, metadata !877, metadata !2401}
!2405 = metadata !{i32 65, i32 0, metadata !657, metadata !2401}
!2406 = metadata !{i32 1366, i32 0, metadata !2407, null}
!2407 = metadata !{i32 786443, metadata !25, metadata !599, i32 1366, i32 0, i32 342} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2408 = metadata !{i32 1367, i32 0, metadata !2409, null}
!2409 = metadata !{i32 786443, metadata !25, metadata !2410, i32 1367, i32 0, i32 344} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2410 = metadata !{i32 786443, metadata !25, metadata !2407, i32 1366, i32 0, i32 343} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2411 = metadata !{i32 1368, i32 0, metadata !2412, null}
!2412 = metadata !{i32 786443, metadata !25, metadata !2410, i32 1368, i32 0, i32 345} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2413 = metadata !{i32 1369, i32 0, metadata !2414, null}
!2414 = metadata !{i32 786443, metadata !25, metadata !2410, i32 1369, i32 0, i32 346} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2415 = metadata !{i32 1376, i32 0, metadata !560, null}
!2416 = metadata !{i32 1380, i32 0, metadata !603, null}
!2417 = metadata !{i32 1384, i32 0, metadata !603, null}
!2418 = metadata !{i32 1386, i32 0, metadata !2419, null}
!2419 = metadata !{i32 786443, metadata !25, metadata !603, i32 1386, i32 0, i32 347} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2420 = metadata !{metadata !702, metadata !704, i64 80}
!2421 = metadata !{i32 1387, i32 0, metadata !2422, null}
!2422 = metadata !{i32 786443, metadata !25, metadata !2419, i32 1386, i32 0, i32 348} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2423 = metadata !{i32 1388, i32 0, metadata !2422, null}
!2424 = metadata !{i32 1389, i32 0, metadata !2422, null}
!2425 = metadata !{i32 1392, i32 0, metadata !2426, null}
!2426 = metadata !{i32 786443, metadata !25, metadata !603, i32 1392, i32 0, i32 349} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2427 = metadata !{i32 1393, i32 0, metadata !2428, null}
!2428 = metadata !{i32 786443, metadata !25, metadata !2429, i32 1393, i32 0, i32 351} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2429 = metadata !{i32 786443, metadata !25, metadata !2426, i32 1392, i32 0, i32 350} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2430 = metadata !{i64 1024}
!2431 = metadata !{i32 1394, i32 0, metadata !2428, null}
!2432 = metadata !{i32 1395, i32 0, metadata !2429, null}
!2433 = metadata !{i32 1396, i32 0, metadata !2429, null}
!2434 = metadata !{i32 786689, metadata !632, metadata !"p", metadata !26, i32 16778631, metadata !185, i32 0, metadata !2435} ; [ DW_TAG_arg_variable ] [p] [line 1415]
!2435 = metadata !{i32 1398, i32 0, metadata !603, null}
!2436 = metadata !{i32 1415, i32 0, metadata !632, metadata !2435}
!2437 = metadata !{i32 1417, i32 0, metadata !632, metadata !2435}
!2438 = metadata !{i32 786688, metadata !632, metadata !"pc", metadata !26, i32 1417, metadata !44, i32 0, metadata !2435} ; [ DW_TAG_auto_variable ] [pc] [line 1417]
!2439 = metadata !{i32 1418, i32 0, metadata !632, metadata !2435}
!2440 = metadata !{i32 786689, metadata !626, metadata !"s", metadata !26, i32 16778638, metadata !173, i32 0, metadata !2441} ; [ DW_TAG_arg_variable ] [s] [line 1422]
!2441 = metadata !{i32 1399, i32 0, metadata !603, null}
!2442 = metadata !{i32 1422, i32 0, metadata !626, metadata !2441}
!2443 = metadata !{i32 1423, i32 0, metadata !626, metadata !2441}
!2444 = metadata !{i32 786688, metadata !626, metadata !"sc", metadata !26, i32 1423, metadata !173, i32 0, metadata !2441} ; [ DW_TAG_auto_variable ] [sc] [line 1423]
!2445 = metadata !{i32 1424, i32 0, metadata !626, metadata !2441}
!2446 = metadata !{i32 1403, i32 0, metadata !603, null}
!2447 = metadata !{i32 1404, i32 0, metadata !603, null}
!2448 = metadata !{i32 1405, i32 0, metadata !2449, null}
!2449 = metadata !{i32 786443, metadata !25, metadata !603, i32 1405, i32 0, i32 352} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2450 = metadata !{i32 1406, i32 0, metadata !2451, null}
!2451 = metadata !{i32 786443, metadata !25, metadata !2449, i32 1405, i32 0, i32 353} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2452 = metadata !{i32 1407, i32 0, metadata !2451, null}
!2453 = metadata !{i32 1411, i32 0, metadata !603, null}
!2454 = metadata !{i32 1457, i32 0, metadata !610, null}
!2455 = metadata !{i32 1458, i32 0, metadata !2456, null}
!2456 = metadata !{i32 786443, metadata !25, metadata !610, i32 1458, i32 0, i32 354} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2457 = metadata !{i32 1459, i32 0, metadata !2458, null}
!2458 = metadata !{i32 786443, metadata !25, metadata !2456, i32 1458, i32 0, i32 355} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2459 = metadata !{i32 1460, i32 0, metadata !2458, null}
!2460 = metadata !{i32 1463, i32 0, metadata !2461, null}
!2461 = metadata !{i32 786443, metadata !25, metadata !610, i32 1463, i32 0, i32 356} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd.c]
!2462 = metadata !{i32 1467, i32 0, metadata !610, null}
!2463 = metadata !{i32 1468, i32 0, metadata !610, null}
!2464 = metadata !{i32 1469, i32 0, metadata !610, null}
!2465 = metadata !{i32 1470, i32 0, metadata !610, null}
