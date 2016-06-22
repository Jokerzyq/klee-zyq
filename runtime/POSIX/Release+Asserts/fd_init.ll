; ModuleID = 'fd_init.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.stat64 = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }

@__exe_env = global { [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] } { [32 x %struct.exe_file_t] [%struct.exe_file_t { i32 0, i32 5, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 1, i32 9, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 2, i32 9, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer], i32 18, i32 0, i32 0, [4 x i8] undef }, align 8
@klee_init_fds.name = private unnamed_addr constant [7 x i8] c"?-data\00", align 1
@.str = private unnamed_addr constant [2 x i8] c".\00", align 1
@__exe_fs = common global %struct.exe_file_system_t zeroinitializer, align 8
@.str1 = private unnamed_addr constant [6 x i8] c"stdin\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"read_fail\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"write_fail\00", align 1
@.str4 = private unnamed_addr constant [11 x i8] c"close_fail\00", align 1
@.str5 = private unnamed_addr constant [15 x i8] c"ftruncate_fail\00", align 1
@.str6 = private unnamed_addr constant [12 x i8] c"getcwd_fail\00", align 1
@.str7 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@.str8 = private unnamed_addr constant [14 x i8] c"model_version\00", align 1
@.str9 = private unnamed_addr constant [6 x i8] c"-stat\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str11 = private unnamed_addr constant [10 x i8] c"fd_init.c\00", align 1
@__PRETTY_FUNCTION__.__create_new_dfile = private unnamed_addr constant [88 x i8] c"void __create_new_dfile(exe_disk_file_t *, unsigned int, const char *, struct stat64 *)\00", align 1

; Function Attrs: nounwind uwtable
define void @klee_init_fds(i32 %n_files, i32 %file_length, i32 %sym_stdout_flag, i32 %save_all_writes_flag, i32 %max_failures) #0 {
entry:
  %x.i = alloca i32, align 4
  %name = alloca [7 x i8], align 1
  %s = alloca %struct.stat64, align 8
  call void @llvm.dbg.value(metadata !{i32 %n_files}, i64 0, metadata !12), !dbg !146
  call void @llvm.dbg.value(metadata !{i32 %file_length}, i64 0, metadata !13), !dbg !146
  call void @llvm.dbg.value(metadata !{i32 %sym_stdout_flag}, i64 0, metadata !14), !dbg !147
  call void @llvm.dbg.value(metadata !{i32 %save_all_writes_flag}, i64 0, metadata !15), !dbg !147
  call void @llvm.dbg.value(metadata !{i32 %max_failures}, i64 0, metadata !16), !dbg !148
  call void @llvm.dbg.declare(metadata !{[7 x i8]* %name}, metadata !18), !dbg !149
  %0 = getelementptr inbounds [7 x i8]* %name, i64 0, i64 0, !dbg !149
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([7 x i8]* @klee_init_fds.name, i64 0, i64 0), i64 7, i32 1, i1 false), !dbg !149
  %1 = bitcast %struct.stat64* %s to i8*, !dbg !150
  call void @llvm.lifetime.start(i64 144, i8* %1) #2, !dbg !150
  call void @llvm.dbg.declare(metadata !{%struct.stat64* %s}, metadata !23), !dbg !150
  call void @llvm.dbg.value(metadata !151, i64 0, metadata !152) #2, !dbg !154
  call void @llvm.dbg.value(metadata !{%struct.stat64* %s}, i64 0, metadata !155) #2, !dbg !154
  %call.i = call i32 @__xstat64(i32 1, i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0), %struct.stat64* %s) #2, !dbg !156
  store i32 %n_files, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 0), align 8, !dbg !158, !tbaa !159
  %conv = zext i32 %n_files to i64, !dbg !165
  %mul = mul i64 %conv, 24, !dbg !165
  %call1 = call noalias i8* @malloc(i64 %mul) #2, !dbg !165
  %2 = bitcast i8* %call1 to %struct.exe_disk_file_t*, !dbg !165
  store %struct.exe_disk_file_t* %2, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !165, !tbaa !166
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !17), !dbg !167
  %cmp30 = icmp eq i32 %n_files, 0, !dbg !167
  br i1 %cmp30, label %for.end, label %for.body, !dbg !167

for.body:                                         ; preds = %entry, %for.body.for.body_crit_edge
  %3 = phi %struct.exe_disk_file_t* [ %.pre, %for.body.for.body_crit_edge ], [ %2, %entry ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body.for.body_crit_edge ], [ 0, %entry ]
  %4 = trunc i64 %indvars.iv to i8, !dbg !169
  %add = add i8 %4, 65, !dbg !169
  store i8 %add, i8* %0, align 1, !dbg !169, !tbaa !171
  %arrayidx4 = getelementptr inbounds %struct.exe_disk_file_t* %3, i64 %indvars.iv, !dbg !172
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %arrayidx4, i32 %file_length, i8* %0, %struct.stat64* %s), !dbg !172
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !167
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !167
  %exitcond = icmp eq i32 %lftr.wideiv, %n_files, !dbg !167
  br i1 %exitcond, label %for.end, label %for.body.for.body_crit_edge, !dbg !167

for.body.for.body_crit_edge:                      ; preds = %for.body
  %.pre = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 4), align 8, !dbg !172, !tbaa !166
  br label %for.body, !dbg !167

for.end:                                          ; preds = %for.body, %entry
  %tobool = icmp eq i32 %file_length, 0, !dbg !173
  br i1 %tobool, label %if.else, label %if.then, !dbg !173

if.then:                                          ; preds = %for.end
  %call5 = call noalias i8* @malloc(i64 24) #2, !dbg !175
  %5 = bitcast i8* %call5 to %struct.exe_disk_file_t*, !dbg !175
  store %struct.exe_disk_file_t* %5, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !175, !tbaa !177
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %5, i32 %file_length, i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), %struct.stat64* %s), !dbg !178
  %6 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !179, !tbaa !177
  store %struct.exe_disk_file_t* %6, %struct.exe_disk_file_t** getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 0, i64 0, i32 3), align 8, !dbg !179, !tbaa !180
  br label %if.end, !dbg !183

if.else:                                          ; preds = %for.end
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 1), align 8, !dbg !184, !tbaa !177
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 %max_failures, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 5), align 8, !dbg !185, !tbaa !186
  %tobool6 = icmp eq i32 %max_failures, 0, !dbg !187
  br i1 %tobool6, label %if.end13, label %if.then7, !dbg !187

if.then7:                                         ; preds = %if.end
  %call8 = call noalias i8* @malloc(i64 4) #2, !dbg !189
  %7 = bitcast i8* %call8 to i32*, !dbg !189
  store i32* %7, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 6), align 8, !dbg !189, !tbaa !191
  %call9 = call noalias i8* @malloc(i64 4) #2, !dbg !192
  %8 = bitcast i8* %call9 to i32*, !dbg !192
  store i32* %8, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !192, !tbaa !193
  %call10 = call noalias i8* @malloc(i64 4) #2, !dbg !194
  %9 = bitcast i8* %call10 to i32*, !dbg !194
  store i32* %9, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !194, !tbaa !195
  %call11 = call noalias i8* @malloc(i64 4) #2, !dbg !196
  %10 = bitcast i8* %call11 to i32*, !dbg !196
  store i32* %10, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !196, !tbaa !197
  %call12 = call noalias i8* @malloc(i64 4) #2, !dbg !198
  %11 = bitcast i8* %call12 to i32*, !dbg !198
  store i32* %11, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !198, !tbaa !199
  call void @klee_make_symbolic(i8* %call8, i64 4, i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) #2, !dbg !200
  %12 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 7), align 8, !dbg !201, !tbaa !193
  %13 = bitcast i32* %12 to i8*, !dbg !201
  call void @klee_make_symbolic(i8* %13, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0)) #2, !dbg !201
  %14 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 8), align 8, !dbg !202, !tbaa !195
  %15 = bitcast i32* %14 to i8*, !dbg !202
  call void @klee_make_symbolic(i8* %15, i64 4, i8* getelementptr inbounds ([11 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !202
  %16 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 9), align 8, !dbg !203, !tbaa !197
  %17 = bitcast i32* %16 to i8*, !dbg !203
  call void @klee_make_symbolic(i8* %17, i64 4, i8* getelementptr inbounds ([15 x i8]* @.str5, i64 0, i64 0)) #2, !dbg !203
  %18 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 10), align 8, !dbg !204, !tbaa !199
  %19 = bitcast i32* %18 to i8*, !dbg !204
  call void @klee_make_symbolic(i8* %19, i64 4, i8* getelementptr inbounds ([12 x i8]* @.str6, i64 0, i64 0)) #2, !dbg !204
  br label %if.end13, !dbg !205

if.end13:                                         ; preds = %if.end, %if.then7
  %tobool14 = icmp eq i32 %sym_stdout_flag, 0, !dbg !206
  br i1 %tobool14, label %if.else17, label %if.then15, !dbg !206

if.then15:                                        ; preds = %if.end13
  %call16 = call noalias i8* @malloc(i64 24) #2, !dbg !208
  %20 = bitcast i8* %call16 to %struct.exe_disk_file_t*, !dbg !208
  store %struct.exe_disk_file_t* %20, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !208, !tbaa !210
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %20, i32 1024, i8* getelementptr inbounds ([7 x i8]* @.str7, i64 0, i64 0), %struct.stat64* %s), !dbg !211
  %21 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !212, !tbaa !210
  store %struct.exe_disk_file_t* %21, %struct.exe_disk_file_t** getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 0, i64 1, i32 3), align 8, !dbg !212, !tbaa !180
  store i32 0, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 3), align 8, !dbg !213, !tbaa !214
  br label %if.end18, !dbg !215

if.else17:                                        ; preds = %if.end13
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i64 0, i32 2), align 8, !dbg !216, !tbaa !210
  br label %if.end18

if.end18:                                         ; preds = %if.else17, %if.then15
  store i32 %save_all_writes_flag, i32* getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 3), align 8, !dbg !217, !tbaa !218
  %22 = bitcast i32* %x.i to i8*, !dbg !220
  call void @llvm.lifetime.start(i64 4, i8* %22) #2, !dbg !220
  call void @llvm.dbg.value(metadata !222, i64 0, metadata !223) #2, !dbg !220
  call void @llvm.dbg.declare(metadata !{i32* %x.i}, metadata !70) #2, !dbg !224
  call void @klee_make_symbolic(i8* %22, i64 4, i8* getelementptr inbounds ([14 x i8]* @.str8, i64 0, i64 0)) #2, !dbg !225
  call void @llvm.dbg.value(metadata !{i32* %x.i}, i64 0, metadata !226) #2, !dbg !227
  call void @llvm.dbg.value(metadata !{i32* %x.i}, i64 0, metadata !70), !dbg !227
  %23 = load i32* %x.i, align 4, !dbg !227, !tbaa !228
  call void @llvm.lifetime.end(i64 4, i8* %22) #2, !dbg !227
  store i32 %23, i32* getelementptr inbounds ({ [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, i64 0, i32 2), align 4, !dbg !221, !tbaa !229
  %cmp20 = icmp eq i32 %23, 1, !dbg !230
  %conv22 = zext i1 %cmp20 to i64, !dbg !230
  call void @klee_assume(i64 %conv22) #2, !dbg !230
  call void @llvm.lifetime.end(i64 144, i8* %1) #2, !dbg !231
  ret void, !dbg !231
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind uwtable
define internal fastcc void @__create_new_dfile(%struct.exe_disk_file_t* nocapture %dfile, i32 %size, i8* %name, %struct.stat64* nocapture readonly %defaults) #0 {
entry:
  %sname = alloca [64 x i8], align 16
  call void @llvm.dbg.value(metadata !{%struct.exe_disk_file_t* %dfile}, i64 0, metadata !85), !dbg !232
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !86), !dbg !232
  call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !87), !dbg !233
  call void @llvm.dbg.value(metadata !{%struct.stat64* %defaults}, i64 0, metadata !88), !dbg !233
  %call = call noalias i8* @malloc(i64 144) #2, !dbg !234
  %0 = bitcast i8* %call to %struct.stat64*, !dbg !234
  call void @llvm.dbg.value(metadata !{%struct.stat64* %0}, i64 0, metadata !89), !dbg !234
  %1 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 0, !dbg !235
  call void @llvm.lifetime.start(i64 64, i8* %1) #2, !dbg !235
  call void @llvm.dbg.declare(metadata !{[64 x i8]* %sname}, metadata !91), !dbg !235
  call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !90), !dbg !236
  %2 = load i8* %name, align 1, !dbg !236, !tbaa !171
  %tobool148 = icmp eq i8 %2, 0, !dbg !236
  %sub.ptr.rhs.cast2 = ptrtoint i8* %name to i64, !dbg !238
  br i1 %tobool148, label %for.end, label %for.body, !dbg !236

for.body:                                         ; preds = %entry, %for.body
  %arrayidx4152 = phi i8* [ %arrayidx4, %for.body ], [ %1, %entry ]
  %3 = phi i8 [ %4, %for.body ], [ %2, %entry ]
  %sp.0151 = phi i8* [ %incdec.ptr, %for.body ], [ %name, %entry ]
  store i8 %3, i8* %arrayidx4152, align 1, !dbg !239, !tbaa !171
  %incdec.ptr = getelementptr inbounds i8* %sp.0151, i64 1, !dbg !236
  call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !90), !dbg !236
  %4 = load i8* %incdec.ptr, align 1, !dbg !236, !tbaa !171
  %tobool = icmp eq i8 %4, 0, !dbg !236
  %sub.ptr.lhs.cast1 = ptrtoint i8* %incdec.ptr to i64, !dbg !238
  %sub.ptr.sub3 = sub i64 %sub.ptr.lhs.cast1, %sub.ptr.rhs.cast2, !dbg !238
  %arrayidx4 = getelementptr inbounds [64 x i8]* %sname, i64 0, i64 %sub.ptr.sub3, !dbg !238
  br i1 %tobool, label %for.end, label %for.body, !dbg !236

for.end:                                          ; preds = %for.body, %entry
  %arrayidx4.lcssa = phi i8* [ %1, %entry ], [ %arrayidx4, %for.body ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %arrayidx4.lcssa, i8* getelementptr inbounds ([6 x i8]* @.str9, i64 0, i64 0), i64 6, i32 1, i1 false), !dbg !238
  %tobool5 = icmp eq i32 %size, 0, !dbg !240
  br i1 %tobool5, label %cond.false, label %cond.end, !dbg !240

cond.false:                                       ; preds = %for.end
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8]* @.str10, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str11, i64 0, i64 0), i32 55, i8* getelementptr inbounds ([88 x i8]* @__PRETTY_FUNCTION__.__create_new_dfile, i64 0, i64 0)) #6, !dbg !240
  unreachable, !dbg !240

cond.end:                                         ; preds = %for.end
  %size6 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 0, !dbg !241
  store i32 %size, i32* %size6, align 4, !dbg !241, !tbaa !242
  %conv = zext i32 %size to i64, !dbg !244
  %call8 = call noalias i8* @malloc(i64 %conv) #2, !dbg !244
  %contents = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 1, !dbg !244
  store i8* %call8, i8** %contents, align 8, !dbg !244, !tbaa !245
  call void @klee_make_symbolic(i8* %call8, i64 %conv, i8* %name) #2, !dbg !246
  call void @klee_make_symbolic(i8* %call, i64 144, i8* %1) #2, !dbg !247
  %st_ino = getelementptr inbounds i8* %call, i64 8, !dbg !248
  %5 = bitcast i8* %st_ino to i64*, !dbg !248
  %6 = load i64* %5, align 8, !dbg !248, !tbaa !250
  %call12 = call i32 @klee_is_symbolic(i64 %6) #2, !dbg !248
  %tobool13 = icmp eq i32 %call12, 0, !dbg !248
  %7 = load i64* %5, align 8, !dbg !248, !tbaa !250
  %and = and i64 %7, 2147483647, !dbg !248
  %cmp = icmp eq i64 %and, 0, !dbg !248
  %or.cond = and i1 %tobool13, %cmp, !dbg !248
  br i1 %or.cond, label %if.then, label %if.end, !dbg !248

if.then:                                          ; preds = %cond.end
  %st_ino16 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 1, !dbg !253
  %8 = load i64* %st_ino16, align 8, !dbg !253, !tbaa !250
  store i64 %8, i64* %5, align 8, !dbg !253, !tbaa !250
  br label %if.end, !dbg !253

if.end:                                           ; preds = %cond.end, %if.then
  %9 = phi i64 [ %8, %if.then ], [ %7, %cond.end ]
  %and19 = and i64 %9, 2147483647, !dbg !254
  %cmp20 = icmp ne i64 %and19, 0, !dbg !254
  %conv22 = zext i1 %cmp20 to i64, !dbg !254
  call void @klee_assume(i64 %conv22) #2, !dbg !254
  %st_blksize = getelementptr inbounds i8* %call, i64 56, !dbg !255
  %10 = bitcast i8* %st_blksize to i64*, !dbg !255
  %11 = load i64* %10, align 8, !dbg !255, !tbaa !256
  %cmp24 = icmp ult i64 %11, 65536, !dbg !255
  %conv26 = zext i1 %cmp24 to i64, !dbg !255
  call void @klee_assume(i64 %conv26) #2, !dbg !255
  %st_mode = getelementptr inbounds i8* %call, i64 24, !dbg !257
  %12 = bitcast i8* %st_mode to i32*, !dbg !257
  %13 = load i32* %12, align 4, !dbg !257, !tbaa !258
  %and27 = and i32 %13, -61952, !dbg !257
  %lnot = icmp eq i32 %and27, 0, !dbg !257
  %conv29 = zext i1 %lnot to i64, !dbg !257
  call void @klee_prefer_cex(i8* %call, i64 %conv29) #2, !dbg !257
  %st_dev = bitcast i8* %call to i64*, !dbg !259
  %14 = load i64* %st_dev, align 8, !dbg !259, !tbaa !260
  %st_dev30 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 0, !dbg !259
  %15 = load i64* %st_dev30, align 8, !dbg !259, !tbaa !260
  %cmp31 = icmp eq i64 %14, %15, !dbg !259
  %conv33 = zext i1 %cmp31 to i64, !dbg !259
  call void @klee_prefer_cex(i8* %call, i64 %conv33) #2, !dbg !259
  %st_rdev = getelementptr inbounds i8* %call, i64 40, !dbg !261
  %16 = bitcast i8* %st_rdev to i64*, !dbg !261
  %17 = load i64* %16, align 8, !dbg !261, !tbaa !262
  %st_rdev34 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 7, !dbg !261
  %18 = load i64* %st_rdev34, align 8, !dbg !261, !tbaa !262
  %cmp35 = icmp eq i64 %17, %18, !dbg !261
  %conv37 = zext i1 %cmp35 to i64, !dbg !261
  call void @klee_prefer_cex(i8* %call, i64 %conv37) #2, !dbg !261
  %19 = load i32* %12, align 4, !dbg !263, !tbaa !258
  %and39 = and i32 %19, 448, !dbg !263
  %cmp40 = icmp eq i32 %and39, 384, !dbg !263
  %conv42 = zext i1 %cmp40 to i64, !dbg !263
  call void @klee_prefer_cex(i8* %call, i64 %conv42) #2, !dbg !263
  %20 = load i32* %12, align 4, !dbg !264, !tbaa !258
  %and44 = and i32 %20, 56, !dbg !264
  %cmp45 = icmp eq i32 %and44, 16, !dbg !264
  %conv47 = zext i1 %cmp45 to i64, !dbg !264
  call void @klee_prefer_cex(i8* %call, i64 %conv47) #2, !dbg !264
  %21 = load i32* %12, align 4, !dbg !265, !tbaa !258
  %and49 = and i32 %21, 7, !dbg !265
  %cmp50 = icmp eq i32 %and49, 2, !dbg !265
  %conv52 = zext i1 %cmp50 to i64, !dbg !265
  call void @klee_prefer_cex(i8* %call, i64 %conv52) #2, !dbg !265
  %22 = load i32* %12, align 4, !dbg !266, !tbaa !258
  %and54 = and i32 %22, 61440, !dbg !266
  %cmp55 = icmp eq i32 %and54, 32768, !dbg !266
  %conv57 = zext i1 %cmp55 to i64, !dbg !266
  call void @klee_prefer_cex(i8* %call, i64 %conv57) #2, !dbg !266
  %st_nlink = getelementptr inbounds i8* %call, i64 16, !dbg !267
  %23 = bitcast i8* %st_nlink to i64*, !dbg !267
  %24 = load i64* %23, align 8, !dbg !267, !tbaa !268
  %cmp58 = icmp eq i64 %24, 1, !dbg !267
  %conv60 = zext i1 %cmp58 to i64, !dbg !267
  call void @klee_prefer_cex(i8* %call, i64 %conv60) #2, !dbg !267
  %st_uid = getelementptr inbounds i8* %call, i64 28, !dbg !269
  %25 = bitcast i8* %st_uid to i32*, !dbg !269
  %26 = load i32* %25, align 4, !dbg !269, !tbaa !270
  %st_uid61 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 4, !dbg !269
  %27 = load i32* %st_uid61, align 4, !dbg !269, !tbaa !270
  %cmp62 = icmp eq i32 %26, %27, !dbg !269
  %conv64 = zext i1 %cmp62 to i64, !dbg !269
  call void @klee_prefer_cex(i8* %call, i64 %conv64) #2, !dbg !269
  %st_gid = getelementptr inbounds i8* %call, i64 32, !dbg !271
  %28 = bitcast i8* %st_gid to i32*, !dbg !271
  %29 = load i32* %28, align 4, !dbg !271, !tbaa !272
  %st_gid65 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 5, !dbg !271
  %30 = load i32* %st_gid65, align 4, !dbg !271, !tbaa !272
  %cmp66 = icmp eq i32 %29, %30, !dbg !271
  %conv68 = zext i1 %cmp66 to i64, !dbg !271
  call void @klee_prefer_cex(i8* %call, i64 %conv68) #2, !dbg !271
  %31 = load i64* %10, align 8, !dbg !273, !tbaa !256
  %cmp70 = icmp eq i64 %31, 4096, !dbg !273
  %conv72 = zext i1 %cmp70 to i64, !dbg !273
  call void @klee_prefer_cex(i8* %call, i64 %conv72) #2, !dbg !273
  %st_atim = getelementptr inbounds i8* %call, i64 72, !dbg !274
  %tv_sec = bitcast i8* %st_atim to i64*, !dbg !274
  %32 = load i64* %tv_sec, align 8, !dbg !274, !tbaa !275
  %tv_sec74 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 11, i32 0, !dbg !274
  %33 = load i64* %tv_sec74, align 8, !dbg !274, !tbaa !275
  %cmp75 = icmp eq i64 %32, %33, !dbg !274
  %conv77 = zext i1 %cmp75 to i64, !dbg !274
  call void @klee_prefer_cex(i8* %call, i64 %conv77) #2, !dbg !274
  %st_mtim = getelementptr inbounds i8* %call, i64 88, !dbg !276
  %tv_sec78 = bitcast i8* %st_mtim to i64*, !dbg !276
  %34 = load i64* %tv_sec78, align 8, !dbg !276, !tbaa !277
  %tv_sec80 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 12, i32 0, !dbg !276
  %35 = load i64* %tv_sec80, align 8, !dbg !276, !tbaa !277
  %cmp81 = icmp eq i64 %34, %35, !dbg !276
  %conv83 = zext i1 %cmp81 to i64, !dbg !276
  call void @klee_prefer_cex(i8* %call, i64 %conv83) #2, !dbg !276
  %st_ctim = getelementptr inbounds i8* %call, i64 104, !dbg !278
  %tv_sec84 = bitcast i8* %st_ctim to i64*, !dbg !278
  %36 = load i64* %tv_sec84, align 8, !dbg !278, !tbaa !279
  %tv_sec86 = getelementptr inbounds %struct.stat64* %defaults, i64 0, i32 13, i32 0, !dbg !278
  %37 = load i64* %tv_sec86, align 8, !dbg !278, !tbaa !279
  %cmp87 = icmp eq i64 %36, %37, !dbg !278
  %conv89 = zext i1 %cmp87 to i64, !dbg !278
  call void @klee_prefer_cex(i8* %call, i64 %conv89) #2, !dbg !278
  %38 = load i32* %size6, align 4, !dbg !280, !tbaa !242
  %conv91 = zext i32 %38 to i64, !dbg !280
  %st_size = getelementptr inbounds i8* %call, i64 48, !dbg !280
  %39 = bitcast i8* %st_size to i64*, !dbg !280
  store i64 %conv91, i64* %39, align 8, !dbg !280, !tbaa !281
  %st_blocks = getelementptr inbounds i8* %call, i64 64, !dbg !282
  %40 = bitcast i8* %st_blocks to i64*, !dbg !282
  store i64 8, i64* %40, align 8, !dbg !282, !tbaa !283
  %stat = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i64 0, i32 2, !dbg !284
  store %struct.stat64* %0, %struct.stat64** %stat, align 8, !dbg !284, !tbaa !285
  call void @llvm.lifetime.end(i64 64, i8* %1) #2, !dbg !286
  ret void, !dbg !286
}

declare void @klee_make_symbolic(i8*, i64, i8*) #4

declare void @klee_assume(i64) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #5

declare i32 @klee_is_symbolic(i64) #4

declare void @klee_prefer_cex(i8*, i64) #4

; Function Attrs: nounwind
declare i32 @__xstat64(i32, i8*, %struct.stat64*) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!143, !144}
!llvm.ident = !{!145}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !103, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/joker/klee-lf/runtime/POSIX//home/joker/klee-lf/runtime/POSIX/fd_init.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/joker/klee-lf/runtime/POSIX/fd_init.c", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !63, metadata !71, metadata !95}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"klee_init_fds", metadata !"klee_init_fds", metadata !"", i32 110, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, i32, i32, i32, i32)* @klee_init_fds, null, null, metadata !11, i32 112} ; [ DW_TAG_subprogram ] [line 110] [def] [scope 112] [klee_init_fds]
!5 = metadata !{metadata !"fd_init.c", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !10, metadata !10, metadata !9}
!9 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!10 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !23}
!12 = metadata !{i32 786689, metadata !4, metadata !"n_files", metadata !6, i32 16777326, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n_files] [line 110]
!13 = metadata !{i32 786689, metadata !4, metadata !"file_length", metadata !6, i32 33554542, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file_length] [line 110]
!14 = metadata !{i32 786689, metadata !4, metadata !"sym_stdout_flag", metadata !6, i32 50331759, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sym_stdout_flag] [line 111]
!15 = metadata !{i32 786689, metadata !4, metadata !"save_all_writes_flag", metadata !6, i32 67108975, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [save_all_writes_flag] [line 111]
!16 = metadata !{i32 786689, metadata !4, metadata !"max_failures", metadata !6, i32 83886192, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [max_failures] [line 112]
!17 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !6, i32 113, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 113]
!18 = metadata !{i32 786688, metadata !4, metadata !"name", metadata !6, i32 114, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [name] [line 114]
!19 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 56, i64 8, i32 0, i32 0, metadata !20, metadata !21, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 56, align 8, offset 0] [from char]
!20 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786465, i64 0, i64 7}        ; [ DW_TAG_subrange_type ] [0, 6]
!23 = metadata !{i32 786688, metadata !4, metadata !"s", metadata !6, i32 115, metadata !24, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 115]
!24 = metadata !{i32 786451, metadata !25, null, metadata !"stat64", i32 119, i64 1152, i64 64, i32 0, i32 0, null, metadata !26, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [stat64] [line 119, size 1152, align 64, offset 0] [def] [from ]
!25 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/bits/stat.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!26 = metadata !{metadata !27, metadata !30, metadata !32, metadata !34, metadata !36, metadata !38, metadata !40, metadata !41, metadata !42, metadata !45, metadata !47, metadata !49, metadata !57, metadata !58, metadata !59}
!27 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_dev", i32 121, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_member ] [st_dev] [line 121, size 64, align 64, offset 0] [from __dev_t]
!28 = metadata !{i32 786454, metadata !25, null, metadata !"__dev_t", i32 124, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [__dev_t] [line 124, size 0, align 0, offset 0] [from long unsigned int]
!29 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!30 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_ino", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !31} ; [ DW_TAG_member ] [st_ino] [line 123, size 64, align 64, offset 64] [from __ino64_t]
!31 = metadata !{i32 786454, metadata !25, null, metadata !"__ino64_t", i32 128, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [__ino64_t] [line 128, size 0, align 0, offset 0] [from long unsigned int]
!32 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_nlink", i32 124, i64 64, i64 64, i64 128, i32 0, metadata !33} ; [ DW_TAG_member ] [st_nlink] [line 124, size 64, align 64, offset 128] [from __nlink_t]
!33 = metadata !{i32 786454, metadata !25, null, metadata !"__nlink_t", i32 130, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [__nlink_t] [line 130, size 0, align 0, offset 0] [from long unsigned int]
!34 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_mode", i32 125, i64 32, i64 32, i64 192, i32 0, metadata !35} ; [ DW_TAG_member ] [st_mode] [line 125, size 32, align 32, offset 192] [from __mode_t]
!35 = metadata !{i32 786454, metadata !25, null, metadata !"__mode_t", i32 129, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__mode_t] [line 129, size 0, align 0, offset 0] [from unsigned int]
!36 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_uid", i32 132, i64 32, i64 32, i64 224, i32 0, metadata !37} ; [ DW_TAG_member ] [st_uid] [line 132, size 32, align 32, offset 224] [from __uid_t]
!37 = metadata !{i32 786454, metadata !25, null, metadata !"__uid_t", i32 125, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__uid_t] [line 125, size 0, align 0, offset 0] [from unsigned int]
!38 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_gid", i32 133, i64 32, i64 32, i64 256, i32 0, metadata !39} ; [ DW_TAG_member ] [st_gid] [line 133, size 32, align 32, offset 256] [from __gid_t]
!39 = metadata !{i32 786454, metadata !25, null, metadata !"__gid_t", i32 126, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ] [__gid_t] [line 126, size 0, align 0, offset 0] [from unsigned int]
!40 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"__pad0", i32 135, i64 32, i64 32, i64 288, i32 0, metadata !10} ; [ DW_TAG_member ] [__pad0] [line 135, size 32, align 32, offset 288] [from int]
!41 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_rdev", i32 136, i64 64, i64 64, i64 320, i32 0, metadata !28} ; [ DW_TAG_member ] [st_rdev] [line 136, size 64, align 64, offset 320] [from __dev_t]
!42 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_size", i32 137, i64 64, i64 64, i64 384, i32 0, metadata !43} ; [ DW_TAG_member ] [st_size] [line 137, size 64, align 64, offset 384] [from __off_t]
!43 = metadata !{i32 786454, metadata !25, null, metadata !"__off_t", i32 131, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!44 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!45 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_blksize", i32 143, i64 64, i64 64, i64 448, i32 0, metadata !46} ; [ DW_TAG_member ] [st_blksize] [line 143, size 64, align 64, offset 448] [from __blksize_t]
!46 = metadata !{i32 786454, metadata !25, null, metadata !"__blksize_t", i32 153, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ] [__blksize_t] [line 153, size 0, align 0, offset 0] [from long int]
!47 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_blocks", i32 144, i64 64, i64 64, i64 512, i32 0, metadata !48} ; [ DW_TAG_member ] [st_blocks] [line 144, size 64, align 64, offset 512] [from __blkcnt64_t]
!48 = metadata !{i32 786454, metadata !25, null, metadata !"__blkcnt64_t", i32 159, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ] [__blkcnt64_t] [line 159, size 0, align 0, offset 0] [from long int]
!49 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_atim", i32 152, i64 128, i64 64, i64 576, i32 0, metadata !50} ; [ DW_TAG_member ] [st_atim] [line 152, size 128, align 64, offset 576] [from timespec]
!50 = metadata !{i32 786451, metadata !51, null, metadata !"timespec", i32 120, i64 128, i64 64, i32 0, i32 0, null, metadata !52, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [timespec] [line 120, size 128, align 64, offset 0] [def] [from ]
!51 = metadata !{metadata !"/usr/include/time.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!52 = metadata !{metadata !53, metadata !55}
!53 = metadata !{i32 786445, metadata !51, metadata !50, metadata !"tv_sec", i32 122, i64 64, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_member ] [tv_sec] [line 122, size 64, align 64, offset 0] [from __time_t]
!54 = metadata !{i32 786454, metadata !51, null, metadata !"__time_t", i32 139, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ] [__time_t] [line 139, size 0, align 0, offset 0] [from long int]
!55 = metadata !{i32 786445, metadata !51, metadata !50, metadata !"tv_nsec", i32 123, i64 64, i64 64, i64 64, i32 0, metadata !56} ; [ DW_TAG_member ] [tv_nsec] [line 123, size 64, align 64, offset 64] [from __syscall_slong_t]
!56 = metadata !{i32 786454, metadata !51, null, metadata !"__syscall_slong_t", i32 175, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ] [__syscall_slong_t] [line 175, size 0, align 0, offset 0] [from long int]
!57 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_mtim", i32 153, i64 128, i64 64, i64 704, i32 0, metadata !50} ; [ DW_TAG_member ] [st_mtim] [line 153, size 128, align 64, offset 704] [from timespec]
!58 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"st_ctim", i32 154, i64 128, i64 64, i64 832, i32 0, metadata !50} ; [ DW_TAG_member ] [st_ctim] [line 154, size 128, align 64, offset 832] [from timespec]
!59 = metadata !{i32 786445, metadata !25, metadata !24, metadata !"__glibc_reserved", i32 164, i64 192, i64 64, i64 960, i32 0, metadata !60} ; [ DW_TAG_member ] [__glibc_reserved] [line 164, size 192, align 64, offset 960] [from ]
!60 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 192, i64 64, i32 0, i32 0, metadata !56, metadata !61, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 192, align 64, offset 0] [from __syscall_slong_t]
!61 = metadata !{metadata !62}
!62 = metadata !{i32 786465, i64 0, i64 3}        ; [ DW_TAG_subrange_type ] [0, 2]
!63 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__sym_uint32", metadata !"__sym_uint32", metadata !"", i32 97, metadata !64, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !68, i32 97} ; [ DW_TAG_subprogram ] [line 97] [local] [def] [__sym_uint32]
!64 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !65, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!65 = metadata !{metadata !9, metadata !66}
!66 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !67} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!67 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!68 = metadata !{metadata !69, metadata !70}
!69 = metadata !{i32 786689, metadata !63, metadata !"name", metadata !6, i32 16777313, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 97]
!70 = metadata !{i32 786688, metadata !63, metadata !"x", metadata !6, i32 98, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 98]
!71 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__create_new_dfile", metadata !"__create_new_dfile", metadata !"", i32 46, metadata !72, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.exe_disk_file_t*, i32, i8*, %struct.stat64*)* @__create_new_dfile, null, null, metadata !84, i32 47} ; [ DW_TAG_subprogram ] [line 46] [local] [def] [scope 47] [__create_new_dfile]
!72 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !73, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = metadata !{null, metadata !74, metadata !9, metadata !66, metadata !83}
!74 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !75} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from exe_disk_file_t]
!75 = metadata !{i32 786454, metadata !76, null, metadata !"exe_disk_file_t", i32 24, i64 0, i64 0, i64 0, i32 0, metadata !77} ; [ DW_TAG_typedef ] [exe_disk_file_t] [line 24, size 0, align 0, offset 0] [from ]
!76 = metadata !{metadata !"/home/joker/klee-lf/runtime/POSIX/fd.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!77 = metadata !{i32 786451, metadata !76, null, metadata !"", i32 20, i64 192, i64 64, i32 0, i32 0, null, metadata !78, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 20, size 192, align 64, offset 0] [def] [from ]
!78 = metadata !{metadata !79, metadata !80, metadata !82}
!79 = metadata !{i32 786445, metadata !76, metadata !77, metadata !"size", i32 21, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [size] [line 21, size 32, align 32, offset 0] [from unsigned int]
!80 = metadata !{i32 786445, metadata !76, metadata !77, metadata !"contents", i32 22, i64 64, i64 64, i64 64, i32 0, metadata !81} ; [ DW_TAG_member ] [contents] [line 22, size 64, align 64, offset 64] [from ]
!81 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!82 = metadata !{i32 786445, metadata !76, metadata !77, metadata !"stat", i32 23, i64 64, i64 64, i64 128, i32 0, metadata !83} ; [ DW_TAG_member ] [stat] [line 23, size 64, align 64, offset 128] [from ]
!83 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from stat64]
!84 = metadata !{metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !90, metadata !91}
!85 = metadata !{i32 786689, metadata !71, metadata !"dfile", metadata !6, i32 16777262, metadata !74, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dfile] [line 46]
!86 = metadata !{i32 786689, metadata !71, metadata !"size", metadata !6, i32 33554478, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 46]
!87 = metadata !{i32 786689, metadata !71, metadata !"name", metadata !6, i32 50331695, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 47]
!88 = metadata !{i32 786689, metadata !71, metadata !"defaults", metadata !6, i32 67108911, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [defaults] [line 47]
!89 = metadata !{i32 786688, metadata !71, metadata !"s", metadata !6, i32 48, metadata !83, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 48]
!90 = metadata !{i32 786688, metadata !71, metadata !"sp", metadata !6, i32 49, metadata !66, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sp] [line 49]
!91 = metadata !{i32 786688, metadata !71, metadata !"sname", metadata !6, i32 50, metadata !92, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sname] [line 50]
!92 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 512, i64 8, i32 0, i32 0, metadata !20, metadata !93, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!93 = metadata !{metadata !94}
!94 = metadata !{i32 786465, i64 0, i64 64}       ; [ DW_TAG_subrange_type ] [0, 63]
!95 = metadata !{i32 786478, metadata !96, metadata !97, metadata !"stat64", metadata !"stat64", metadata !"", i32 502, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !100, i32 503} ; [ DW_TAG_subprogram ] [line 502] [def] [scope 503] [stat64]
!96 = metadata !{metadata !"/usr/include/x86_64-linux-gnu/sys/stat.h", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!97 = metadata !{i32 786473, metadata !96}        ; [ DW_TAG_file_type ] [/home/joker/klee-lf/runtime/POSIX//usr/include/x86_64-linux-gnu/sys/stat.h]
!98 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!99 = metadata !{metadata !10, metadata !66, metadata !83}
!100 = metadata !{metadata !101, metadata !102}
!101 = metadata !{i32 786689, metadata !95, metadata !"__path", metadata !97, i32 16777718, metadata !66, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__path] [line 502]
!102 = metadata !{i32 786689, metadata !95, metadata !"__statbuf", metadata !97, i32 33554934, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__statbuf] [line 502]
!103 = metadata !{metadata !104, metadata !125}
!104 = metadata !{i32 786484, i32 0, null, metadata !"__exe_env", metadata !"__exe_env", metadata !"", metadata !6, i32 37, metadata !105, i32 0, i32 1, { [32 x %struct.exe_file_t], i32, i32, i32, [4 x i8] }* @__exe_env, null} ; [ DW_TAG_variable ] [__exe_env] [line 37] [def]
!105 = metadata !{i32 786454, metadata !5, null, metadata !"exe_sym_env_t", i32 69, i64 0, i64 0, i64 0, i32 0, metadata !106} ; [ DW_TAG_typedef ] [exe_sym_env_t] [line 69, size 0, align 0, offset 0] [from ]
!106 = metadata !{i32 786451, metadata !76, null, metadata !"", i32 61, i64 6272, i64 64, i32 0, i32 0, null, metadata !107, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 61, size 6272, align 64, offset 0] [def] [from ]
!107 = metadata !{metadata !108, metadata !121, metadata !123, metadata !124}
!108 = metadata !{i32 786445, metadata !76, metadata !106, metadata !"fds", i32 62, i64 6144, i64 64, i64 0, i32 0, metadata !109} ; [ DW_TAG_member ] [fds] [line 62, size 6144, align 64, offset 0] [from ]
!109 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 6144, i64 64, i32 0, i32 0, metadata !110, metadata !119, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 6144, align 64, offset 0] [from exe_file_t]
!110 = metadata !{i32 786454, metadata !76, null, metadata !"exe_file_t", i32 40, i64 0, i64 0, i64 0, i32 0, metadata !111} ; [ DW_TAG_typedef ] [exe_file_t] [line 40, size 0, align 0, offset 0] [from ]
!111 = metadata !{i32 786451, metadata !76, null, metadata !"", i32 33, i64 192, i64 64, i32 0, i32 0, null, metadata !112, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 33, size 192, align 64, offset 0] [def] [from ]
!112 = metadata !{metadata !113, metadata !114, metadata !115, metadata !118}
!113 = metadata !{i32 786445, metadata !76, metadata !111, metadata !"fd", i32 34, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_member ] [fd] [line 34, size 32, align 32, offset 0] [from int]
!114 = metadata !{i32 786445, metadata !76, metadata !111, metadata !"flags", i32 35, i64 32, i64 32, i64 32, i32 0, metadata !9} ; [ DW_TAG_member ] [flags] [line 35, size 32, align 32, offset 32] [from unsigned int]
!115 = metadata !{i32 786445, metadata !76, metadata !111, metadata !"off", i32 38, i64 64, i64 64, i64 64, i32 0, metadata !116} ; [ DW_TAG_member ] [off] [line 38, size 64, align 64, offset 64] [from off64_t]
!116 = metadata !{i32 786454, metadata !76, null, metadata !"off64_t", i32 93, i64 0, i64 0, i64 0, i32 0, metadata !117} ; [ DW_TAG_typedef ] [off64_t] [line 93, size 0, align 0, offset 0] [from __off64_t]
!117 = metadata !{i32 786454, metadata !76, null, metadata !"__off64_t", i32 132, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!118 = metadata !{i32 786445, metadata !76, metadata !111, metadata !"dfile", i32 39, i64 64, i64 64, i64 128, i32 0, metadata !74} ; [ DW_TAG_member ] [dfile] [line 39, size 64, align 64, offset 128] [from ]
!119 = metadata !{metadata !120}
!120 = metadata !{i32 786465, i64 0, i64 32}      ; [ DW_TAG_subrange_type ] [0, 31]
!121 = metadata !{i32 786445, metadata !76, metadata !106, metadata !"umask", i32 63, i64 32, i64 32, i64 6144, i32 0, metadata !122} ; [ DW_TAG_member ] [umask] [line 63, size 32, align 32, offset 6144] [from mode_t]
!122 = metadata !{i32 786454, metadata !76, null, metadata !"mode_t", i32 70, i64 0, i64 0, i64 0, i32 0, metadata !35} ; [ DW_TAG_typedef ] [mode_t] [line 70, size 0, align 0, offset 0] [from __mode_t]
!123 = metadata !{i32 786445, metadata !76, metadata !106, metadata !"version", i32 64, i64 32, i64 32, i64 6176, i32 0, metadata !9} ; [ DW_TAG_member ] [version] [line 64, size 32, align 32, offset 6176] [from unsigned int]
!124 = metadata !{i32 786445, metadata !76, metadata !106, metadata !"save_all_writes", i32 68, i64 32, i64 32, i64 6208, i32 0, metadata !10} ; [ DW_TAG_member ] [save_all_writes] [line 68, size 32, align 32, offset 6208] [from int]
!125 = metadata !{i32 786484, i32 0, null, metadata !"__exe_fs", metadata !"__exe_fs", metadata !"", metadata !6, i32 24, metadata !126, i32 0, i32 1, %struct.exe_file_system_t* @__exe_fs, null} ; [ DW_TAG_variable ] [__exe_fs] [line 24] [def]
!126 = metadata !{i32 786454, metadata !5, null, metadata !"exe_file_system_t", i32 54, i64 0, i64 0, i64 0, i32 0, metadata !127} ; [ DW_TAG_typedef ] [exe_file_system_t] [line 54, size 0, align 0, offset 0] [from ]
!127 = metadata !{i32 786451, metadata !76, null, metadata !"", i32 42, i64 832, i64 64, i32 0, i32 0, null, metadata !128, i32 0, null, null, null} ; [ DW_TAG_structure_type ] [line 42, size 832, align 64, offset 0] [def] [from ]
!128 = metadata !{metadata !129, metadata !130, metadata !131, metadata !132, metadata !133, metadata !134, metadata !135, metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142}
!129 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"n_sym_files", i32 43, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [n_sym_files] [line 43, size 32, align 32, offset 0] [from unsigned int]
!130 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"sym_stdin", i32 44, i64 64, i64 64, i64 64, i32 0, metadata !74} ; [ DW_TAG_member ] [sym_stdin] [line 44, size 64, align 64, offset 64] [from ]
!131 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"sym_stdout", i32 44, i64 64, i64 64, i64 128, i32 0, metadata !74} ; [ DW_TAG_member ] [sym_stdout] [line 44, size 64, align 64, offset 128] [from ]
!132 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"stdout_writes", i32 45, i64 32, i64 32, i64 192, i32 0, metadata !9} ; [ DW_TAG_member ] [stdout_writes] [line 45, size 32, align 32, offset 192] [from unsigned int]
!133 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"sym_files", i32 46, i64 64, i64 64, i64 256, i32 0, metadata !74} ; [ DW_TAG_member ] [sym_files] [line 46, size 64, align 64, offset 256] [from ]
!134 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"max_failures", i32 49, i64 32, i64 32, i64 320, i32 0, metadata !9} ; [ DW_TAG_member ] [max_failures] [line 49, size 32, align 32, offset 320] [from unsigned int]
!135 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"read_fail", i32 52, i64 64, i64 64, i64 384, i32 0, metadata !136} ; [ DW_TAG_member ] [read_fail] [line 52, size 64, align 64, offset 384] [from ]
!136 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!137 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"write_fail", i32 52, i64 64, i64 64, i64 448, i32 0, metadata !136} ; [ DW_TAG_member ] [write_fail] [line 52, size 64, align 64, offset 448] [from ]
!138 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"close_fail", i32 52, i64 64, i64 64, i64 512, i32 0, metadata !136} ; [ DW_TAG_member ] [close_fail] [line 52, size 64, align 64, offset 512] [from ]
!139 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"ftruncate_fail", i32 52, i64 64, i64 64, i64 576, i32 0, metadata !136} ; [ DW_TAG_member ] [ftruncate_fail] [line 52, size 64, align 64, offset 576] [from ]
!140 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"getcwd_fail", i32 52, i64 64, i64 64, i64 640, i32 0, metadata !136} ; [ DW_TAG_member ] [getcwd_fail] [line 52, size 64, align 64, offset 640] [from ]
!141 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"chmod_fail", i32 53, i64 64, i64 64, i64 704, i32 0, metadata !136} ; [ DW_TAG_member ] [chmod_fail] [line 53, size 64, align 64, offset 704] [from ]
!142 = metadata !{i32 786445, metadata !76, metadata !127, metadata !"fchmod_fail", i32 53, i64 64, i64 64, i64 768, i32 0, metadata !136} ; [ DW_TAG_member ] [fchmod_fail] [line 53, size 64, align 64, offset 768] [from ]
!143 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!144 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!145 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!146 = metadata !{i32 110, i32 0, metadata !4, null}
!147 = metadata !{i32 111, i32 0, metadata !4, null}
!148 = metadata !{i32 112, i32 0, metadata !4, null}
!149 = metadata !{i32 114, i32 0, metadata !4, null}
!150 = metadata !{i32 115, i32 0, metadata !4, null}
!151 = metadata !{i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0)}
!152 = metadata !{i32 786689, metadata !95, metadata !"__path", metadata !97, i32 16777718, metadata !66, i32 0, metadata !153} ; [ DW_TAG_arg_variable ] [__path] [line 502]
!153 = metadata !{i32 117, i32 0, metadata !4, null}
!154 = metadata !{i32 502, i32 0, metadata !95, metadata !153}
!155 = metadata !{i32 786689, metadata !95, metadata !"__statbuf", metadata !97, i32 33554934, metadata !83, i32 0, metadata !153} ; [ DW_TAG_arg_variable ] [__statbuf] [line 502]
!156 = metadata !{i32 504, i32 0, metadata !157, metadata !153}
!157 = metadata !{i32 786443, metadata !96, metadata !95} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX//usr/include/x86_64-linux-gnu/sys/stat.h]
!158 = metadata !{i32 119, i32 0, metadata !4, null}
!159 = metadata !{metadata !160, metadata !161, i64 0}
!160 = metadata !{metadata !"", metadata !161, i64 0, metadata !164, i64 8, metadata !164, i64 16, metadata !161, i64 24, metadata !164, i64 32, metadata !161, i64 40, metadata !164, i64 48, metadata !164, i64 56, metadata !164, i64 64, metadata !164, i64 72, metadata !164, i64 80, metadata !164, i64 88, metadata !164, i64 96}
!161 = metadata !{metadata !"int", metadata !162, i64 0}
!162 = metadata !{metadata !"omnipotent char", metadata !163, i64 0}
!163 = metadata !{metadata !"Simple C/C++ TBAA"}
!164 = metadata !{metadata !"any pointer", metadata !162, i64 0}
!165 = metadata !{i32 120, i32 0, metadata !4, null}
!166 = metadata !{metadata !160, metadata !164, i64 32}
!167 = metadata !{i32 121, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !5, metadata !4, i32 121, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!169 = metadata !{i32 122, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !5, metadata !168, i32 121, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!171 = metadata !{metadata !162, metadata !162, i64 0}
!172 = metadata !{i32 123, i32 0, metadata !170, null}
!173 = metadata !{i32 127, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !5, metadata !4, i32 127, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!175 = metadata !{i32 128, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !5, metadata !174, i32 127, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!177 = metadata !{metadata !160, metadata !164, i64 8}
!178 = metadata !{i32 129, i32 0, metadata !176, null}
!179 = metadata !{i32 130, i32 0, metadata !176, null}
!180 = metadata !{metadata !181, metadata !164, i64 16}
!181 = metadata !{metadata !"", metadata !161, i64 0, metadata !161, i64 4, metadata !182, i64 8, metadata !164, i64 16}
!182 = metadata !{metadata !"long", metadata !162, i64 0}
!183 = metadata !{i32 131, i32 0, metadata !176, null}
!184 = metadata !{i32 132, i32 0, metadata !174, null}
!185 = metadata !{i32 134, i32 0, metadata !4, null}
!186 = metadata !{metadata !160, metadata !161, i64 40}
!187 = metadata !{i32 135, i32 0, metadata !188, null}
!188 = metadata !{i32 786443, metadata !5, metadata !4, i32 135, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!189 = metadata !{i32 136, i32 0, metadata !190, null}
!190 = metadata !{i32 786443, metadata !5, metadata !188, i32 135, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!191 = metadata !{metadata !160, metadata !164, i64 48}
!192 = metadata !{i32 137, i32 0, metadata !190, null}
!193 = metadata !{metadata !160, metadata !164, i64 56}
!194 = metadata !{i32 138, i32 0, metadata !190, null}
!195 = metadata !{metadata !160, metadata !164, i64 64}
!196 = metadata !{i32 139, i32 0, metadata !190, null}
!197 = metadata !{metadata !160, metadata !164, i64 72}
!198 = metadata !{i32 140, i32 0, metadata !190, null}
!199 = metadata !{metadata !160, metadata !164, i64 80}
!200 = metadata !{i32 142, i32 0, metadata !190, null}
!201 = metadata !{i32 143, i32 0, metadata !190, null}
!202 = metadata !{i32 144, i32 0, metadata !190, null}
!203 = metadata !{i32 145, i32 0, metadata !190, null}
!204 = metadata !{i32 146, i32 0, metadata !190, null}
!205 = metadata !{i32 147, i32 0, metadata !190, null}
!206 = metadata !{i32 150, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !5, metadata !4, i32 150, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!208 = metadata !{i32 151, i32 0, metadata !209, null}
!209 = metadata !{i32 786443, metadata !5, metadata !207, i32 150, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!210 = metadata !{metadata !160, metadata !164, i64 16}
!211 = metadata !{i32 152, i32 0, metadata !209, null}
!212 = metadata !{i32 153, i32 0, metadata !209, null}
!213 = metadata !{i32 154, i32 0, metadata !209, null}
!214 = metadata !{metadata !160, metadata !161, i64 24}
!215 = metadata !{i32 155, i32 0, metadata !209, null}
!216 = metadata !{i32 156, i32 0, metadata !207, null}
!217 = metadata !{i32 158, i32 0, metadata !4, null}
!218 = metadata !{metadata !219, metadata !161, i64 776}
!219 = metadata !{metadata !"", metadata !162, i64 0, metadata !161, i64 768, metadata !161, i64 772, metadata !161, i64 776}
!220 = metadata !{i32 97, i32 0, metadata !63, metadata !221}
!221 = metadata !{i32 159, i32 0, metadata !4, null}
!222 = metadata !{null}
!223 = metadata !{i32 786689, metadata !63, metadata !"name", metadata !6, i32 16777313, metadata !66, i32 0, metadata !221} ; [ DW_TAG_arg_variable ] [name] [line 97]
!224 = metadata !{i32 98, i32 0, metadata !63, metadata !221}
!225 = metadata !{i32 99, i32 0, metadata !63, metadata !221}
!226 = metadata !{i32 786688, metadata !63, metadata !"x", metadata !6, i32 98, metadata !9, i32 0, metadata !221} ; [ DW_TAG_auto_variable ] [x] [line 98]
!227 = metadata !{i32 100, i32 0, metadata !63, metadata !221}
!228 = metadata !{metadata !161, metadata !161, i64 0}
!229 = metadata !{metadata !219, metadata !161, i64 772}
!230 = metadata !{i32 160, i32 0, metadata !4, null}
!231 = metadata !{i32 161, i32 0, metadata !4, null}
!232 = metadata !{i32 46, i32 0, metadata !71, null}
!233 = metadata !{i32 47, i32 0, metadata !71, null}
!234 = metadata !{i32 48, i32 0, metadata !71, null}
!235 = metadata !{i32 50, i32 0, metadata !71, null}
!236 = metadata !{i32 51, i32 0, metadata !237, null}
!237 = metadata !{i32 786443, metadata !5, metadata !71, i32 51, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!238 = metadata !{i32 53, i32 0, metadata !71, null}
!239 = metadata !{i32 52, i32 0, metadata !237, null}
!240 = metadata !{i32 55, i32 0, metadata !71, null}
!241 = metadata !{i32 57, i32 0, metadata !71, null}
!242 = metadata !{metadata !243, metadata !161, i64 0}
!243 = metadata !{metadata !"", metadata !161, i64 0, metadata !164, i64 8, metadata !164, i64 16}
!244 = metadata !{i32 58, i32 0, metadata !71, null} ; [ DW_TAG_imported_module ]
!245 = metadata !{metadata !243, metadata !164, i64 8}
!246 = metadata !{i32 59, i32 0, metadata !71, null}
!247 = metadata !{i32 61, i32 0, metadata !71, null}
!248 = metadata !{i32 64, i32 0, metadata !249, null}
!249 = metadata !{i32 786443, metadata !5, metadata !71, i32 64, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/fd_init.c]
!250 = metadata !{metadata !251, metadata !182, i64 8}
!251 = metadata !{metadata !"stat64", metadata !182, i64 0, metadata !182, i64 8, metadata !182, i64 16, metadata !161, i64 24, metadata !161, i64 28, metadata !161, i64 32, metadata !161, i64 36, metadata !182, i64 40, metadata !182, i64 48, metadata !182, i64 56, metadata !182, i64 64, metadata !252, i64 72, metadata !252, i64 88, metadata !252, i64 104, metadata !162, i64 120}
!252 = metadata !{metadata !"timespec", metadata !182, i64 0, metadata !182, i64 8}
!253 = metadata !{i32 66, i32 0, metadata !249, null}
!254 = metadata !{i32 71, i32 0, metadata !71, null}
!255 = metadata !{i32 75, i32 0, metadata !71, null}
!256 = metadata !{metadata !251, metadata !182, i64 56}
!257 = metadata !{i32 77, i32 0, metadata !71, null}
!258 = metadata !{metadata !251, metadata !161, i64 24}
!259 = metadata !{i32 78, i32 0, metadata !71, null}
!260 = metadata !{metadata !251, metadata !182, i64 0}
!261 = metadata !{i32 79, i32 0, metadata !71, null}
!262 = metadata !{metadata !251, metadata !182, i64 40}
!263 = metadata !{i32 80, i32 0, metadata !71, null}
!264 = metadata !{i32 81, i32 0, metadata !71, null}
!265 = metadata !{i32 82, i32 0, metadata !71, null}
!266 = metadata !{i32 83, i32 0, metadata !71, null}
!267 = metadata !{i32 84, i32 0, metadata !71, null}
!268 = metadata !{metadata !251, metadata !182, i64 16}
!269 = metadata !{i32 85, i32 0, metadata !71, null}
!270 = metadata !{metadata !251, metadata !161, i64 28}
!271 = metadata !{i32 86, i32 0, metadata !71, null}
!272 = metadata !{metadata !251, metadata !161, i64 32}
!273 = metadata !{i32 87, i32 0, metadata !71, null}
!274 = metadata !{i32 88, i32 0, metadata !71, null}
!275 = metadata !{metadata !251, metadata !182, i64 72}
!276 = metadata !{i32 89, i32 0, metadata !71, null}
!277 = metadata !{metadata !251, metadata !182, i64 88}
!278 = metadata !{i32 90, i32 0, metadata !71, null}
!279 = metadata !{metadata !251, metadata !182, i64 104}
!280 = metadata !{i32 92, i32 0, metadata !71, null}
!281 = metadata !{metadata !251, metadata !182, i64 48}
!282 = metadata !{i32 93, i32 0, metadata !71, null}
!283 = metadata !{metadata !251, metadata !182, i64 64}
!284 = metadata !{i32 94, i32 0, metadata !71, null}
!285 = metadata !{metadata !243, metadata !164, i64 16}
!286 = metadata !{i32 95, i32 0, metadata !71, null}
