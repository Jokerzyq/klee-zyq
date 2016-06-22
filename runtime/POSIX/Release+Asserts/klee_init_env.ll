; ModuleID = 'klee_init_env.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str1 = private unnamed_addr constant [593 x i8] c"klee_init_env\0A\0Ausage: (klee_init_env) [options] [program arguments]\0A  -sym-arg <N>              - Replace by a symbolic argument with length N\0A  -sym-args <MIN> <MAX> <N> - Replace by at least MIN arguments and at most\0A                              MAX arguments, each with maximum length N\0A  -sym-files <NUM> <N>      - Make stdin and up to NUM symbolic files, each\0A                              with maximum size N.\0A  -sym-stdout               - Make stdout symbolic.\0A  -max-fail <N>             - Allow up to <N> injected failures\0A  -fd-fail                  - Shortcut for '-max-fail 1'\0A\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"--sym-arg\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"-sym-arg\00", align 1
@.str4 = private unnamed_addr constant [48 x i8] c"--sym-arg expects an integer argument <max-len>\00", align 1
@.str5 = private unnamed_addr constant [11 x i8] c"--sym-args\00", align 1
@.str6 = private unnamed_addr constant [10 x i8] c"-sym-args\00", align 1
@.str7 = private unnamed_addr constant [77 x i8] c"--sym-args expects three integer arguments <min-argvs> <max-argvs> <max-len>\00", align 1
@.str8 = private unnamed_addr constant [7 x i8] c"n_args\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"--sym-files\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"-sym-files\00", align 1
@.str11 = private unnamed_addr constant [72 x i8] c"--sym-files expects two integer arguments <no-sym-files> <sym-file-len>\00", align 1
@.str12 = private unnamed_addr constant [13 x i8] c"--sym-stdout\00", align 1
@.str13 = private unnamed_addr constant [12 x i8] c"-sym-stdout\00", align 1
@.str14 = private unnamed_addr constant [18 x i8] c"--save-all-writes\00", align 1
@.str15 = private unnamed_addr constant [17 x i8] c"-save-all-writes\00", align 1
@.str16 = private unnamed_addr constant [10 x i8] c"--fd-fail\00", align 1
@.str17 = private unnamed_addr constant [9 x i8] c"-fd-fail\00", align 1
@.str18 = private unnamed_addr constant [11 x i8] c"--max-fail\00", align 1
@.str19 = private unnamed_addr constant [10 x i8] c"-max-fail\00", align 1
@.str20 = private unnamed_addr constant [54 x i8] c"--max-fail expects an integer argument <max-failures>\00", align 1
@.str21 = private unnamed_addr constant [37 x i8] c"too many arguments for klee_init_env\00", align 1
@.str22 = private unnamed_addr constant [16 x i8] c"klee_init_env.c\00", align 1
@.str23 = private unnamed_addr constant [9 x i8] c"user.err\00", align 1

; Function Attrs: nounwind uwtable
define void @klee_init_env(i32* nocapture %argcPtr, i8*** nocapture %argvPtr) #0 {
entry:
  %new_argv = alloca [1024 x i8*], align 16
  %sym_arg_name = alloca [5 x i8], align 4
  call void @llvm.dbg.value(metadata !{i32* %argcPtr}, i64 0, metadata !16), !dbg !105
  call void @llvm.dbg.value(metadata !{i8*** %argvPtr}, i64 0, metadata !17), !dbg !105
  %0 = load i32* %argcPtr, align 4, !dbg !106, !tbaa !107
  call void @llvm.dbg.value(metadata !{i32 %0}, i64 0, metadata !18), !dbg !106
  %1 = load i8*** %argvPtr, align 8, !dbg !111, !tbaa !112
  call void @llvm.dbg.value(metadata !{i8** %1}, i64 0, metadata !19), !dbg !111
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !114
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !115
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !116
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !117
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !20), !dbg !118
  %2 = bitcast [1024 x i8*]* %new_argv to i8*, !dbg !119
  call void @llvm.lifetime.start(i64 8192, i8* %2) #2, !dbg !119
  call void @llvm.dbg.declare(metadata !{[1024 x i8*]* %new_argv}, metadata !22), !dbg !119
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !30), !dbg !120
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !31), !dbg !120
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !32), !dbg !121
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !33), !dbg !122
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !34), !dbg !123
  call void @llvm.dbg.declare(metadata !{[5 x i8]* %sym_arg_name}, metadata !36), !dbg !124
  %3 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 0, !dbg !124
  %4 = bitcast [5 x i8]* %sym_arg_name to i32*, !dbg !124
  store i32 6779489, i32* %4, align 4, !dbg !124
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !40), !dbg !125
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !41), !dbg !126
  %arrayidx = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 4, !dbg !127
  store i8 0, i8* %arrayidx, align 4, !dbg !127, !tbaa !128
  %cmp = icmp eq i32 %0, 2, !dbg !129
  br i1 %cmp, label %land.lhs.true, label %while.cond.preheader, !dbg !129

land.lhs.true:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds i8** %1, i64 1, !dbg !129
  %5 = load i8** %arrayidx1, align 8, !dbg !129, !tbaa !112
  tail call void @llvm.dbg.value(metadata !{i8* %5}, i64 0, metadata !131), !dbg !132
  tail call void @llvm.dbg.value(metadata !133, i64 0, metadata !134), !dbg !132
  %6 = load i8* %5, align 1, !dbg !135, !tbaa !128
  %cmp7.i = icmp eq i8 %6, 45, !dbg !135
  br i1 %cmp7.i, label %while.body.i, label %while.body.lr.ph, !dbg !135

while.body.i:                                     ; preds = %land.lhs.true, %if.end.i
  %7 = phi i8 [ %8, %if.end.i ], [ 45, %land.lhs.true ]
  %b.addr.09.i = phi i8* [ %incdec.ptr3.i, %if.end.i ], [ getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), %land.lhs.true ]
  %a.addr.08.i = phi i8* [ %incdec.ptr.i, %if.end.i ], [ %5, %land.lhs.true ]
  %tobool.i = icmp eq i8 %7, 0, !dbg !136
  br i1 %tobool.i, label %if.then, label %if.end.i, !dbg !136

if.end.i:                                         ; preds = %while.body.i
  %incdec.ptr.i = getelementptr inbounds i8* %a.addr.08.i, i64 1, !dbg !139
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i}, i64 0, metadata !131), !dbg !139
  %incdec.ptr3.i = getelementptr inbounds i8* %b.addr.09.i, i64 1, !dbg !140
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i}, i64 0, metadata !134), !dbg !140
  %8 = load i8* %incdec.ptr.i, align 1, !dbg !135, !tbaa !128
  %9 = load i8* %incdec.ptr3.i, align 1, !dbg !135, !tbaa !128
  %cmp.i = icmp eq i8 %8, %9, !dbg !135
  br i1 %cmp.i, label %while.body.i, label %while.cond.preheader, !dbg !135

while.cond.preheader:                             ; preds = %if.end.i, %entry
  %cmp2699 = icmp sgt i32 %0, 0, !dbg !141
  br i1 %cmp2699, label %while.body.lr.ph, label %while.end, !dbg !141

while.body.lr.ph:                                 ; preds = %land.lhs.true, %while.cond.preheader
  %arrayidx20 = getelementptr inbounds [5 x i8]* %sym_arg_name, i64 0, i64 3, !dbg !142
  br label %while.body, !dbg !141

if.then:                                          ; preds = %while.body.i
  call fastcc void @__emit_error(i8* getelementptr inbounds ([593 x i8]* @.str1, i64 0, i64 0)), !dbg !143
  unreachable

while.body:                                       ; preds = %while.body.lr.ph, %while.cond.backedge
  %sym_files.0743 = phi i32 [ 0, %while.body.lr.ph ], [ %sym_files.0.be, %while.cond.backedge ]
  %sym_file_len.0736 = phi i32 [ 0, %while.body.lr.ph ], [ %sym_file_len.0.be, %while.cond.backedge ]
  %sym_stdout_flag.0729 = phi i32 [ 0, %while.body.lr.ph ], [ %sym_stdout_flag.0.be, %while.cond.backedge ]
  %k.0721 = phi i32 [ 0, %while.body.lr.ph ], [ %k.0.be, %while.cond.backedge ]
  %sym_arg_num.0713 = phi i32 [ 0, %while.body.lr.ph ], [ %sym_arg_num.0.be, %while.cond.backedge ]
  %save_all_writes_flag.0706 = phi i32 [ 0, %while.body.lr.ph ], [ %save_all_writes_flag.0.be, %while.cond.backedge ]
  %fd_fail.0700 = phi i32 [ 0, %while.body.lr.ph ], [ %fd_fail.0.be, %while.cond.backedge ]
  %10 = phi i32 [ 0, %while.body.lr.ph ], [ %.be, %while.cond.backedge ]
  %idxprom = sext i32 %k.0721 to i64, !dbg !145
  %arrayidx3 = getelementptr inbounds i8** %1, i64 %idxprom, !dbg !145
  %11 = load i8** %arrayidx3, align 8, !dbg !145, !tbaa !112
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !146), !dbg !147
  tail call void @llvm.dbg.value(metadata !148, i64 0, metadata !149), !dbg !147
  %12 = load i8* %11, align 1, !dbg !150, !tbaa !128
  %cmp7.i247 = icmp eq i8 %12, 45, !dbg !150
  br i1 %cmp7.i247, label %while.body.i251, label %if.else153, !dbg !150

while.body.i251:                                  ; preds = %while.body, %if.end.i255
  %13 = phi i8 [ %14, %if.end.i255 ], [ 45, %while.body ]
  %b.addr.09.i248 = phi i8* [ %incdec.ptr3.i253, %if.end.i255 ], [ getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0), %while.body ]
  %a.addr.08.i249 = phi i8* [ %incdec.ptr.i252, %if.end.i255 ], [ %11, %while.body ]
  %tobool.i250 = icmp eq i8 %13, 0, !dbg !151
  br i1 %tobool.i250, label %if.then10, label %if.end.i255, !dbg !151

if.end.i255:                                      ; preds = %while.body.i251
  %incdec.ptr.i252 = getelementptr inbounds i8* %a.addr.08.i249, i64 1, !dbg !152
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i252}, i64 0, metadata !146), !dbg !152
  %incdec.ptr3.i253 = getelementptr inbounds i8* %b.addr.09.i248, i64 1, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i253}, i64 0, metadata !149), !dbg !153
  %14 = load i8* %incdec.ptr.i252, align 1, !dbg !150, !tbaa !128
  %15 = load i8* %incdec.ptr3.i253, align 1, !dbg !150, !tbaa !128
  %cmp.i254 = icmp eq i8 %14, %15, !dbg !150
  br i1 %cmp.i254, label %while.body.i251, label %lor.lhs.false, !dbg !150

lor.lhs.false:                                    ; preds = %if.end.i255
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !146), !dbg !147
  tail call void @llvm.dbg.value(metadata !154, i64 0, metadata !149), !dbg !147
  br i1 %cmp7.i247, label %while.body.i265, label %if.else153, !dbg !150

while.body.i265:                                  ; preds = %lor.lhs.false, %if.end.i269
  %16 = phi i8 [ %17, %if.end.i269 ], [ 45, %lor.lhs.false ]
  %b.addr.09.i262 = phi i8* [ %incdec.ptr3.i267, %if.end.i269 ], [ getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0), %lor.lhs.false ]
  %a.addr.08.i263 = phi i8* [ %incdec.ptr.i266, %if.end.i269 ], [ %11, %lor.lhs.false ]
  %tobool.i264 = icmp eq i8 %16, 0, !dbg !151
  br i1 %tobool.i264, label %if.then10, label %if.end.i269, !dbg !151

if.end.i269:                                      ; preds = %while.body.i265
  %incdec.ptr.i266 = getelementptr inbounds i8* %a.addr.08.i263, i64 1, !dbg !152
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i266}, i64 0, metadata !146), !dbg !152
  %incdec.ptr3.i267 = getelementptr inbounds i8* %b.addr.09.i262, i64 1, !dbg !153
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i267}, i64 0, metadata !149), !dbg !153
  %17 = load i8* %incdec.ptr.i266, align 1, !dbg !150, !tbaa !128
  %18 = load i8* %incdec.ptr3.i267, align 1, !dbg !150, !tbaa !128
  %cmp.i268 = icmp eq i8 %17, %18, !dbg !150
  br i1 %cmp.i268, label %while.body.i265, label %if.else, !dbg !150

if.then10:                                        ; preds = %while.body.i265, %while.body.i251
  call void @llvm.dbg.value(metadata !155, i64 0, metadata !43), !dbg !156
  %inc = add nsw i32 %k.0721, 1, !dbg !157
  call void @llvm.dbg.value(metadata !{i32 %inc}, i64 0, metadata !41), !dbg !157
  %cmp11 = icmp eq i32 %inc, %0, !dbg !157
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !157

if.then12:                                        ; preds = %if.then10
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)), !dbg !159
  unreachable

if.end13:                                         ; preds = %if.then10
  %inc14 = add nsw i32 %k.0721, 2, !dbg !160
  call void @llvm.dbg.value(metadata !{i32 %inc14}, i64 0, metadata !41), !dbg !160
  %idxprom15 = sext i32 %inc to i64, !dbg !160
  %arrayidx16 = getelementptr inbounds i8** %1, i64 %idxprom15, !dbg !160
  %19 = load i8** %arrayidx16, align 8, !dbg !160, !tbaa !112
  call void @llvm.dbg.value(metadata !{i8* %19}, i64 0, metadata !161) #2, !dbg !162
  call void @llvm.dbg.value(metadata !163, i64 0, metadata !164) #2, !dbg !162
  call void @llvm.dbg.value(metadata !165, i64 0, metadata !166) #2, !dbg !167
  %20 = load i8* %19, align 1, !dbg !168, !tbaa !128
  %tobool.i272 = icmp eq i8 %20, 0, !dbg !168
  br i1 %tobool.i272, label %if.then.i273, label %while.body.i278, !dbg !168

if.then.i273:                                     ; preds = %if.end13
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !168
  unreachable

while.body.i278:                                  ; preds = %if.end13, %if.then10.i284
  %21 = phi i8 [ %23, %if.then10.i284 ], [ %20, %if.end13 ]
  %s.pn.i274 = phi i8* [ %incdec.ptr26.i276, %if.then10.i284 ], [ %19, %if.end13 ]
  %res.025.i275 = phi i64 [ %add.i282, %if.then10.i284 ], [ 0, %if.end13 ]
  %incdec.ptr26.i276 = getelementptr inbounds i8* %s.pn.i274, i64 1, !dbg !170
  %.off.i277 = add i8 %21, -48, !dbg !171
  %22 = icmp ult i8 %.off.i277, 10, !dbg !171
  br i1 %22, label %if.then10.i284, label %if.else13.i285, !dbg !171

if.then10.i284:                                   ; preds = %while.body.i278
  %conv.i279 = sext i8 %21 to i64, !dbg !175
  %mul.i280 = mul nsw i64 %res.025.i275, 10, !dbg !176
  %sub.i281 = add i64 %conv.i279, -48, !dbg !176
  %add.i282 = add i64 %sub.i281, %mul.i280, !dbg !176
  call void @llvm.dbg.value(metadata !{i64 %add.i282}, i64 0, metadata !166) #2, !dbg !176
  call void @llvm.dbg.value(metadata !{i8* %incdec.ptr26.i276}, i64 0, metadata !161) #2, !dbg !170
  %23 = load i8* %incdec.ptr26.i276, align 1, !dbg !170, !tbaa !128
  call void @llvm.dbg.value(metadata !{i8 %21}, i64 0, metadata !178) #2, !dbg !170
  %tobool1.i283 = icmp eq i8 %23, 0, !dbg !170
  br i1 %tobool1.i283, label %__str_to_int.exit286, label %while.body.i278, !dbg !170

if.else13.i285:                                   ; preds = %while.body.i278
  call fastcc void @__emit_error(i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)) #2, !dbg !179
  unreachable

__str_to_int.exit286:                             ; preds = %if.then10.i284
  %conv = trunc i64 %add.i282 to i32, !dbg !160
  call void @llvm.dbg.value(metadata !{i32 %conv}, i64 0, metadata !26), !dbg !160
  call void @llvm.dbg.value(metadata !{i32 %inc18}, i64 0, metadata !40), !dbg !142
  %add = add i32 %sym_arg_num.0713, 48, !dbg !142
  %conv19 = trunc i32 %add to i8, !dbg !142
  store i8 %conv19, i8* %arrayidx20, align 1, !dbg !142, !tbaa !128
  %call22 = call fastcc i8* @__get_sym_str(i32 %conv, i8* %3), !dbg !181
  call void @llvm.dbg.value(metadata !182, i64 0, metadata !183) #2, !dbg !185
  %cmp.i287 = icmp eq i32 %10, 1024, !dbg !186
  br i1 %cmp.i287, label %if.then.i288, label %__add_arg.exit293, !dbg !186

if.then.i288:                                     ; preds = %__str_to_int.exit286
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str21, i64 0, i64 0)) #2, !dbg !188
  unreachable

__add_arg.exit293:                                ; preds = %__str_to_int.exit286
  %inc18 = add i32 %sym_arg_num.0713, 1, !dbg !142
  %idxprom.i289 = sext i32 %10 to i64, !dbg !190
  %arrayidx.i290 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %idxprom.i289, !dbg !190
  store i8* %call22, i8** %arrayidx.i290, align 8, !dbg !190, !tbaa !112
  %inc.i291 = add nsw i32 %10, 1, !dbg !192
  call void @llvm.dbg.value(metadata !{i32 %inc.i291}, i64 0, metadata !20), !dbg !192
  call void @llvm.dbg.value(metadata !{i32 %inc.i291}, i64 0, metadata !20), !dbg !115
  call void @llvm.dbg.value(metadata !{i32 %inc.i291}, i64 0, metadata !20), !dbg !116
  call void @llvm.dbg.value(metadata !{i32 %inc.i291}, i64 0, metadata !20), !dbg !117
  call void @llvm.dbg.value(metadata !{i32 %inc.i291}, i64 0, metadata !20), !dbg !118
  br label %while.cond.backedge, !dbg !193

if.else:                                          ; preds = %if.end.i269
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !194), !dbg !196
  tail call void @llvm.dbg.value(metadata !197, i64 0, metadata !198), !dbg !196
  br i1 %cmp7.i247, label %while.body.i298, label %if.else153, !dbg !199

while.body.i298:                                  ; preds = %if.else, %if.end.i302
  %24 = phi i8 [ %25, %if.end.i302 ], [ 45, %if.else ]
  %b.addr.09.i295 = phi i8* [ %incdec.ptr3.i300, %if.end.i302 ], [ getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0), %if.else ]
  %a.addr.08.i296 = phi i8* [ %incdec.ptr.i299, %if.end.i302 ], [ %11, %if.else ]
  %tobool.i297 = icmp eq i8 %24, 0, !dbg !200
  br i1 %tobool.i297, label %if.then32, label %if.end.i302, !dbg !200

if.end.i302:                                      ; preds = %while.body.i298
  %incdec.ptr.i299 = getelementptr inbounds i8* %a.addr.08.i296, i64 1, !dbg !201
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i299}, i64 0, metadata !194), !dbg !201
  %incdec.ptr3.i300 = getelementptr inbounds i8* %b.addr.09.i295, i64 1, !dbg !202
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i300}, i64 0, metadata !198), !dbg !202
  %25 = load i8* %incdec.ptr.i299, align 1, !dbg !199, !tbaa !128
  %26 = load i8* %incdec.ptr3.i300, align 1, !dbg !199, !tbaa !128
  %cmp.i301 = icmp eq i8 %25, %26, !dbg !199
  br i1 %cmp.i301, label %while.body.i298, label %lor.lhs.false27, !dbg !199

lor.lhs.false27:                                  ; preds = %if.end.i302
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !194), !dbg !196
  tail call void @llvm.dbg.value(metadata !203, i64 0, metadata !198), !dbg !196
  br i1 %cmp7.i247, label %while.body.i309, label %if.else153, !dbg !199

while.body.i309:                                  ; preds = %lor.lhs.false27, %if.end.i313
  %27 = phi i8 [ %28, %if.end.i313 ], [ 45, %lor.lhs.false27 ]
  %b.addr.09.i306 = phi i8* [ %incdec.ptr3.i311, %if.end.i313 ], [ getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0), %lor.lhs.false27 ]
  %a.addr.08.i307 = phi i8* [ %incdec.ptr.i310, %if.end.i313 ], [ %11, %lor.lhs.false27 ]
  %tobool.i308 = icmp eq i8 %27, 0, !dbg !200
  br i1 %tobool.i308, label %if.then32, label %if.end.i313, !dbg !200

if.end.i313:                                      ; preds = %while.body.i309
  %incdec.ptr.i310 = getelementptr inbounds i8* %a.addr.08.i307, i64 1, !dbg !201
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i310}, i64 0, metadata !194), !dbg !201
  %incdec.ptr3.i311 = getelementptr inbounds i8* %b.addr.09.i306, i64 1, !dbg !202
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i311}, i64 0, metadata !198), !dbg !202
  %28 = load i8* %incdec.ptr.i310, align 1, !dbg !199, !tbaa !128
  %29 = load i8* %incdec.ptr3.i311, align 1, !dbg !199, !tbaa !128
  %cmp.i312 = icmp eq i8 %28, %29, !dbg !199
  br i1 %cmp.i312, label %while.body.i309, label %if.else67, !dbg !199

if.then32:                                        ; preds = %while.body.i309, %while.body.i298
  call void @llvm.dbg.value(metadata !204, i64 0, metadata !49), !dbg !205
  %add34 = add nsw i32 %k.0721, 3, !dbg !206
  %cmp35 = icmp slt i32 %add34, %0, !dbg !206
  br i1 %cmp35, label %if.end38, label %if.then37, !dbg !206

if.then37:                                        ; preds = %if.then32
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)), !dbg !208
  unreachable

if.end38:                                         ; preds = %if.then32
  %inc39 = add nsw i32 %k.0721, 1, !dbg !209
  call void @llvm.dbg.value(metadata !{i32 %inc39}, i64 0, metadata !41), !dbg !209
  %inc40 = add nsw i32 %k.0721, 2, !dbg !210
  call void @llvm.dbg.value(metadata !{i32 %inc40}, i64 0, metadata !41), !dbg !210
  %idxprom41 = sext i32 %inc39 to i64, !dbg !210
  %arrayidx42 = getelementptr inbounds i8** %1, i64 %idxprom41, !dbg !210
  %30 = load i8** %arrayidx42, align 8, !dbg !210, !tbaa !112
  call void @llvm.dbg.value(metadata !{i8* %30}, i64 0, metadata !211) #2, !dbg !212
  call void @llvm.dbg.value(metadata !213, i64 0, metadata !214) #2, !dbg !212
  call void @llvm.dbg.value(metadata !165, i64 0, metadata !215) #2, !dbg !216
  %31 = load i8* %30, align 1, !dbg !217, !tbaa !128
  %tobool.i316 = icmp eq i8 %31, 0, !dbg !217
  br i1 %tobool.i316, label %if.then.i317, label %while.body.i322, !dbg !217

if.then.i317:                                     ; preds = %if.end38
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !217
  unreachable

while.body.i322:                                  ; preds = %if.end38, %if.then10.i328
  %32 = phi i8 [ %34, %if.then10.i328 ], [ %31, %if.end38 ]
  %s.pn.i318 = phi i8* [ %incdec.ptr26.i320, %if.then10.i328 ], [ %30, %if.end38 ]
  %res.025.i319 = phi i64 [ %add.i326, %if.then10.i328 ], [ 0, %if.end38 ]
  %incdec.ptr26.i320 = getelementptr inbounds i8* %s.pn.i318, i64 1, !dbg !218
  %.off.i321 = add i8 %32, -48, !dbg !219
  %33 = icmp ult i8 %.off.i321, 10, !dbg !219
  br i1 %33, label %if.then10.i328, label %if.else13.i329, !dbg !219

if.then10.i328:                                   ; preds = %while.body.i322
  %conv.i323 = sext i8 %32 to i64, !dbg !220
  %mul.i324 = mul nsw i64 %res.025.i319, 10, !dbg !221
  %sub.i325 = add i64 %conv.i323, -48, !dbg !221
  %add.i326 = add i64 %sub.i325, %mul.i324, !dbg !221
  call void @llvm.dbg.value(metadata !{i64 %add.i326}, i64 0, metadata !215) #2, !dbg !221
  call void @llvm.dbg.value(metadata !{i8* %incdec.ptr26.i320}, i64 0, metadata !211) #2, !dbg !218
  %34 = load i8* %incdec.ptr26.i320, align 1, !dbg !218, !tbaa !128
  call void @llvm.dbg.value(metadata !{i8 %32}, i64 0, metadata !222) #2, !dbg !218
  %tobool1.i327 = icmp eq i8 %34, 0, !dbg !218
  br i1 %tobool1.i327, label %__str_to_int.exit330, label %while.body.i322, !dbg !218

if.else13.i329:                                   ; preds = %while.body.i322
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !223
  unreachable

__str_to_int.exit330:                             ; preds = %if.then10.i328
  %conv44 = trunc i64 %add.i326 to i32, !dbg !210
  call void @llvm.dbg.value(metadata !{i32 %conv44}, i64 0, metadata !28), !dbg !210
  call void @llvm.dbg.value(metadata !{i32 %add34}, i64 0, metadata !41), !dbg !224
  %idxprom46 = sext i32 %inc40 to i64, !dbg !224
  %arrayidx47 = getelementptr inbounds i8** %1, i64 %idxprom46, !dbg !224
  %35 = load i8** %arrayidx47, align 8, !dbg !224, !tbaa !112
  call void @llvm.dbg.value(metadata !{i8* %35}, i64 0, metadata !225) #2, !dbg !226
  call void @llvm.dbg.value(metadata !213, i64 0, metadata !227) #2, !dbg !226
  call void @llvm.dbg.value(metadata !165, i64 0, metadata !228) #2, !dbg !229
  %36 = load i8* %35, align 1, !dbg !230, !tbaa !128
  %tobool.i331 = icmp eq i8 %36, 0, !dbg !230
  br i1 %tobool.i331, label %if.then.i332, label %while.body.i337, !dbg !230

if.then.i332:                                     ; preds = %__str_to_int.exit330
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !230
  unreachable

while.body.i337:                                  ; preds = %__str_to_int.exit330, %if.then10.i343
  %37 = phi i8 [ %39, %if.then10.i343 ], [ %36, %__str_to_int.exit330 ]
  %s.pn.i333 = phi i8* [ %incdec.ptr26.i335, %if.then10.i343 ], [ %35, %__str_to_int.exit330 ]
  %res.025.i334 = phi i64 [ %add.i341, %if.then10.i343 ], [ 0, %__str_to_int.exit330 ]
  %incdec.ptr26.i335 = getelementptr inbounds i8* %s.pn.i333, i64 1, !dbg !231
  %.off.i336 = add i8 %37, -48, !dbg !232
  %38 = icmp ult i8 %.off.i336, 10, !dbg !232
  br i1 %38, label %if.then10.i343, label %if.else13.i344, !dbg !232

if.then10.i343:                                   ; preds = %while.body.i337
  %conv.i338 = sext i8 %37 to i64, !dbg !233
  %mul.i339 = mul nsw i64 %res.025.i334, 10, !dbg !234
  %sub.i340 = add i64 %conv.i338, -48, !dbg !234
  %add.i341 = add i64 %sub.i340, %mul.i339, !dbg !234
  call void @llvm.dbg.value(metadata !{i64 %add.i341}, i64 0, metadata !228) #2, !dbg !234
  call void @llvm.dbg.value(metadata !{i8* %incdec.ptr26.i335}, i64 0, metadata !225) #2, !dbg !231
  %39 = load i8* %incdec.ptr26.i335, align 1, !dbg !231, !tbaa !128
  call void @llvm.dbg.value(metadata !{i8 %37}, i64 0, metadata !235) #2, !dbg !231
  %tobool1.i342 = icmp eq i8 %39, 0, !dbg !231
  br i1 %tobool1.i342, label %__str_to_int.exit345, label %while.body.i337, !dbg !231

if.else13.i344:                                   ; preds = %while.body.i337
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !236
  unreachable

__str_to_int.exit345:                             ; preds = %if.then10.i343
  %conv49 = trunc i64 %add.i341 to i32, !dbg !224
  call void @llvm.dbg.value(metadata !{i32 %conv49}, i64 0, metadata !29), !dbg !224
  %inc50 = add nsw i32 %k.0721, 4, !dbg !237
  call void @llvm.dbg.value(metadata !{i32 %inc50}, i64 0, metadata !41), !dbg !237
  %idxprom51 = sext i32 %add34 to i64, !dbg !237
  %arrayidx52 = getelementptr inbounds i8** %1, i64 %idxprom51, !dbg !237
  %40 = load i8** %arrayidx52, align 8, !dbg !237, !tbaa !112
  call void @llvm.dbg.value(metadata !{i8* %40}, i64 0, metadata !238) #2, !dbg !239
  call void @llvm.dbg.value(metadata !213, i64 0, metadata !240) #2, !dbg !239
  call void @llvm.dbg.value(metadata !165, i64 0, metadata !241) #2, !dbg !242
  %41 = load i8* %40, align 1, !dbg !243, !tbaa !128
  %tobool.i346 = icmp eq i8 %41, 0, !dbg !243
  br i1 %tobool.i346, label %if.then.i347, label %while.body.i352, !dbg !243

if.then.i347:                                     ; preds = %__str_to_int.exit345
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !243
  unreachable

while.body.i352:                                  ; preds = %__str_to_int.exit345, %if.then10.i358
  %42 = phi i8 [ %44, %if.then10.i358 ], [ %41, %__str_to_int.exit345 ]
  %s.pn.i348 = phi i8* [ %incdec.ptr26.i350, %if.then10.i358 ], [ %40, %__str_to_int.exit345 ]
  %res.025.i349 = phi i64 [ %add.i356, %if.then10.i358 ], [ 0, %__str_to_int.exit345 ]
  %incdec.ptr26.i350 = getelementptr inbounds i8* %s.pn.i348, i64 1, !dbg !244
  %.off.i351 = add i8 %42, -48, !dbg !245
  %43 = icmp ult i8 %.off.i351, 10, !dbg !245
  br i1 %43, label %if.then10.i358, label %if.else13.i359, !dbg !245

if.then10.i358:                                   ; preds = %while.body.i352
  %conv.i353 = sext i8 %42 to i64, !dbg !246
  %mul.i354 = mul nsw i64 %res.025.i349, 10, !dbg !247
  %sub.i355 = add i64 %conv.i353, -48, !dbg !247
  %add.i356 = add i64 %sub.i355, %mul.i354, !dbg !247
  call void @llvm.dbg.value(metadata !{i64 %add.i356}, i64 0, metadata !241) #2, !dbg !247
  call void @llvm.dbg.value(metadata !{i8* %incdec.ptr26.i350}, i64 0, metadata !238) #2, !dbg !244
  %44 = load i8* %incdec.ptr26.i350, align 1, !dbg !244, !tbaa !128
  call void @llvm.dbg.value(metadata !{i8 %42}, i64 0, metadata !248) #2, !dbg !244
  %tobool1.i357 = icmp eq i8 %44, 0, !dbg !244
  br i1 %tobool1.i357, label %__str_to_int.exit360, label %while.body.i352, !dbg !244

if.else13.i359:                                   ; preds = %while.body.i352
  call fastcc void @__emit_error(i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)) #2, !dbg !249
  unreachable

__str_to_int.exit360:                             ; preds = %if.then10.i358
  %conv54 = trunc i64 %add.i356 to i32, !dbg !237
  call void @llvm.dbg.value(metadata !{i32 %conv54}, i64 0, metadata !26), !dbg !237
  %add55 = add i32 %conv49, 1, !dbg !250
  %call56 = call i32 @klee_range(i32 %conv44, i32 %add55, i8* getelementptr inbounds ([7 x i8]* @.str8, i64 0, i64 0)) #2, !dbg !250
  call void @llvm.dbg.value(metadata !{i32 %call56}, i64 0, metadata !21), !dbg !250
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !42), !dbg !251
  %cmp57568 = icmp sgt i32 %call56, 0, !dbg !251
  br i1 %cmp57568, label %for.body.lr.ph, label %while.cond.backedge, !dbg !251

for.body.lr.ph:                                   ; preds = %__str_to_int.exit360
  %45 = sext i32 %10 to i64
  br label %for.body, !dbg !251

for.body:                                         ; preds = %for.body.lr.ph, %__add_arg.exit367
  %indvars.iv = phi i64 [ %45, %for.body.lr.ph ], [ %indvars.iv.next, %__add_arg.exit367 ]
  %i.0570 = phi i32 [ 0, %for.body.lr.ph ], [ %inc66, %__add_arg.exit367 ]
  %sym_arg_num.1569 = phi i32 [ %sym_arg_num.0713, %for.body.lr.ph ], [ %inc59, %__add_arg.exit367 ]
  %46 = phi i32 [ %10, %for.body.lr.ph ], [ %inc.i365, %__add_arg.exit367 ]
  call void @llvm.dbg.value(metadata !{i32 %inc59}, i64 0, metadata !40), !dbg !253
  %add60 = add i32 %sym_arg_num.1569, 48, !dbg !253
  %conv61 = trunc i32 %add60 to i8, !dbg !253
  store i8 %conv61, i8* %arrayidx20, align 1, !dbg !253, !tbaa !128
  %call65 = call fastcc i8* @__get_sym_str(i32 %conv54, i8* %3), !dbg !255
  call void @llvm.dbg.value(metadata !182, i64 0, metadata !256) #2, !dbg !258
  %47 = trunc i64 %indvars.iv to i32, !dbg !259
  %cmp.i361 = icmp eq i32 %47, 1024, !dbg !259
  br i1 %cmp.i361, label %if.then.i362, label %__add_arg.exit367, !dbg !259

if.then.i362:                                     ; preds = %for.body
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str21, i64 0, i64 0)) #2, !dbg !260
  unreachable

__add_arg.exit367:                                ; preds = %for.body
  %inc59 = add i32 %sym_arg_num.1569, 1, !dbg !253
  %arrayidx.i364 = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %indvars.iv, !dbg !261
  store i8* %call65, i8** %arrayidx.i364, align 8, !dbg !261, !tbaa !112
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !251
  %inc.i365 = add nsw i32 %46, 1, !dbg !262
  call void @llvm.dbg.value(metadata !{i32 %inc.i365}, i64 0, metadata !20), !dbg !262
  call void @llvm.dbg.value(metadata !{i32 %inc.i365}, i64 0, metadata !20), !dbg !115
  call void @llvm.dbg.value(metadata !{i32 %inc.i365}, i64 0, metadata !20), !dbg !116
  call void @llvm.dbg.value(metadata !{i32 %inc.i365}, i64 0, metadata !20), !dbg !117
  call void @llvm.dbg.value(metadata !{i32 %inc.i365}, i64 0, metadata !20), !dbg !118
  %inc66 = add nsw i32 %i.0570, 1, !dbg !251
  call void @llvm.dbg.value(metadata !{i32 %inc66}, i64 0, metadata !42), !dbg !251
  %cmp57 = icmp slt i32 %inc66, %call56, !dbg !251
  br i1 %cmp57, label %for.body, label %while.cond.backedge, !dbg !251

if.else67:                                        ; preds = %if.end.i313
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !263), !dbg !265
  tail call void @llvm.dbg.value(metadata !266, i64 0, metadata !267), !dbg !265
  br i1 %cmp7.i247, label %while.body.i372, label %if.else153, !dbg !268

while.body.i372:                                  ; preds = %if.else67, %if.end.i376
  %48 = phi i8 [ %49, %if.end.i376 ], [ 45, %if.else67 ]
  %b.addr.09.i369 = phi i8* [ %incdec.ptr3.i374, %if.end.i376 ], [ getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0), %if.else67 ]
  %a.addr.08.i370 = phi i8* [ %incdec.ptr.i373, %if.end.i376 ], [ %11, %if.else67 ]
  %tobool.i371 = icmp eq i8 %48, 0, !dbg !269
  br i1 %tobool.i371, label %if.then77, label %if.end.i376, !dbg !269

if.end.i376:                                      ; preds = %while.body.i372
  %incdec.ptr.i373 = getelementptr inbounds i8* %a.addr.08.i370, i64 1, !dbg !270
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i373}, i64 0, metadata !263), !dbg !270
  %incdec.ptr3.i374 = getelementptr inbounds i8* %b.addr.09.i369, i64 1, !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i374}, i64 0, metadata !267), !dbg !271
  %49 = load i8* %incdec.ptr.i373, align 1, !dbg !268, !tbaa !128
  %50 = load i8* %incdec.ptr3.i374, align 1, !dbg !268, !tbaa !128
  %cmp.i375 = icmp eq i8 %49, %50, !dbg !268
  br i1 %cmp.i375, label %while.body.i372, label %lor.lhs.false72, !dbg !268

lor.lhs.false72:                                  ; preds = %if.end.i376
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !263), !dbg !265
  tail call void @llvm.dbg.value(metadata !272, i64 0, metadata !267), !dbg !265
  br i1 %cmp7.i247, label %while.body.i383, label %if.else153, !dbg !268

while.body.i383:                                  ; preds = %lor.lhs.false72, %if.end.i387
  %51 = phi i8 [ %52, %if.end.i387 ], [ 45, %lor.lhs.false72 ]
  %b.addr.09.i380 = phi i8* [ %incdec.ptr3.i385, %if.end.i387 ], [ getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0), %lor.lhs.false72 ]
  %a.addr.08.i381 = phi i8* [ %incdec.ptr.i384, %if.end.i387 ], [ %11, %lor.lhs.false72 ]
  %tobool.i382 = icmp eq i8 %51, 0, !dbg !269
  br i1 %tobool.i382, label %if.then77, label %if.end.i387, !dbg !269

if.end.i387:                                      ; preds = %while.body.i383
  %incdec.ptr.i384 = getelementptr inbounds i8* %a.addr.08.i381, i64 1, !dbg !270
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i384}, i64 0, metadata !263), !dbg !270
  %incdec.ptr3.i385 = getelementptr inbounds i8* %b.addr.09.i380, i64 1, !dbg !271
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i385}, i64 0, metadata !267), !dbg !271
  %52 = load i8* %incdec.ptr.i384, align 1, !dbg !268, !tbaa !128
  %53 = load i8* %incdec.ptr3.i385, align 1, !dbg !268, !tbaa !128
  %cmp.i386 = icmp eq i8 %52, %53, !dbg !268
  br i1 %cmp.i386, label %while.body.i383, label %if.else95, !dbg !268

if.then77:                                        ; preds = %while.body.i383, %while.body.i372
  call void @llvm.dbg.value(metadata !273, i64 0, metadata !52), !dbg !274
  %add79 = add nsw i32 %k.0721, 2, !dbg !275
  %cmp80 = icmp slt i32 %add79, %0, !dbg !275
  br i1 %cmp80, label %if.end83, label %if.then82, !dbg !275

if.then82:                                        ; preds = %if.then77
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)), !dbg !277
  unreachable

if.end83:                                         ; preds = %if.then77
  %inc84 = add nsw i32 %k.0721, 1, !dbg !278
  call void @llvm.dbg.value(metadata !{i32 %inc84}, i64 0, metadata !41), !dbg !278
  call void @llvm.dbg.value(metadata !{i32 %add79}, i64 0, metadata !41), !dbg !279
  %idxprom86 = sext i32 %inc84 to i64, !dbg !279
  %arrayidx87 = getelementptr inbounds i8** %1, i64 %idxprom86, !dbg !279
  %54 = load i8** %arrayidx87, align 8, !dbg !279, !tbaa !112
  call void @llvm.dbg.value(metadata !{i8* %54}, i64 0, metadata !280) #2, !dbg !281
  call void @llvm.dbg.value(metadata !282, i64 0, metadata !283) #2, !dbg !281
  call void @llvm.dbg.value(metadata !165, i64 0, metadata !284) #2, !dbg !285
  %55 = load i8* %54, align 1, !dbg !286, !tbaa !128
  %tobool.i390 = icmp eq i8 %55, 0, !dbg !286
  br i1 %tobool.i390, label %if.then.i391, label %while.body.i396, !dbg !286

if.then.i391:                                     ; preds = %if.end83
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !286
  unreachable

while.body.i396:                                  ; preds = %if.end83, %if.then10.i402
  %56 = phi i8 [ %58, %if.then10.i402 ], [ %55, %if.end83 ]
  %s.pn.i392 = phi i8* [ %incdec.ptr26.i394, %if.then10.i402 ], [ %54, %if.end83 ]
  %res.025.i393 = phi i64 [ %add.i400, %if.then10.i402 ], [ 0, %if.end83 ]
  %incdec.ptr26.i394 = getelementptr inbounds i8* %s.pn.i392, i64 1, !dbg !287
  %.off.i395 = add i8 %56, -48, !dbg !288
  %57 = icmp ult i8 %.off.i395, 10, !dbg !288
  br i1 %57, label %if.then10.i402, label %if.else13.i403, !dbg !288

if.then10.i402:                                   ; preds = %while.body.i396
  %conv.i397 = sext i8 %56 to i64, !dbg !289
  %mul.i398 = mul nsw i64 %res.025.i393, 10, !dbg !290
  %sub.i399 = add i64 %conv.i397, -48, !dbg !290
  %add.i400 = add i64 %sub.i399, %mul.i398, !dbg !290
  call void @llvm.dbg.value(metadata !{i64 %add.i400}, i64 0, metadata !284) #2, !dbg !290
  call void @llvm.dbg.value(metadata !{i8* %incdec.ptr26.i394}, i64 0, metadata !280) #2, !dbg !287
  %58 = load i8* %incdec.ptr26.i394, align 1, !dbg !287, !tbaa !128
  call void @llvm.dbg.value(metadata !{i8 %56}, i64 0, metadata !291) #2, !dbg !287
  %tobool1.i401 = icmp eq i8 %58, 0, !dbg !287
  br i1 %tobool1.i401, label %__str_to_int.exit404, label %while.body.i396, !dbg !287

if.else13.i403:                                   ; preds = %while.body.i396
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !292
  unreachable

__str_to_int.exit404:                             ; preds = %if.then10.i402
  %conv89 = trunc i64 %add.i400 to i32, !dbg !279
  call void @llvm.dbg.value(metadata !{i32 %conv89}, i64 0, metadata !30), !dbg !279
  %inc90 = add nsw i32 %k.0721, 3, !dbg !293
  call void @llvm.dbg.value(metadata !{i32 %inc90}, i64 0, metadata !41), !dbg !293
  %idxprom91 = sext i32 %add79 to i64, !dbg !293
  %arrayidx92 = getelementptr inbounds i8** %1, i64 %idxprom91, !dbg !293
  %59 = load i8** %arrayidx92, align 8, !dbg !293, !tbaa !112
  call void @llvm.dbg.value(metadata !{i8* %59}, i64 0, metadata !294) #2, !dbg !295
  call void @llvm.dbg.value(metadata !282, i64 0, metadata !296) #2, !dbg !295
  call void @llvm.dbg.value(metadata !165, i64 0, metadata !297) #2, !dbg !298
  %60 = load i8* %59, align 1, !dbg !299, !tbaa !128
  %tobool.i405 = icmp eq i8 %60, 0, !dbg !299
  br i1 %tobool.i405, label %if.then.i406, label %while.body.i411, !dbg !299

if.then.i406:                                     ; preds = %__str_to_int.exit404
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !299
  unreachable

while.body.i411:                                  ; preds = %__str_to_int.exit404, %if.then10.i417
  %61 = phi i8 [ %63, %if.then10.i417 ], [ %60, %__str_to_int.exit404 ]
  %s.pn.i407 = phi i8* [ %incdec.ptr26.i409, %if.then10.i417 ], [ %59, %__str_to_int.exit404 ]
  %res.025.i408 = phi i64 [ %add.i415, %if.then10.i417 ], [ 0, %__str_to_int.exit404 ]
  %incdec.ptr26.i409 = getelementptr inbounds i8* %s.pn.i407, i64 1, !dbg !300
  %.off.i410 = add i8 %61, -48, !dbg !301
  %62 = icmp ult i8 %.off.i410, 10, !dbg !301
  br i1 %62, label %if.then10.i417, label %if.else13.i418, !dbg !301

if.then10.i417:                                   ; preds = %while.body.i411
  %conv.i412 = sext i8 %61 to i64, !dbg !302
  %mul.i413 = mul nsw i64 %res.025.i408, 10, !dbg !303
  %sub.i414 = add i64 %conv.i412, -48, !dbg !303
  %add.i415 = add i64 %sub.i414, %mul.i413, !dbg !303
  call void @llvm.dbg.value(metadata !{i64 %add.i415}, i64 0, metadata !297) #2, !dbg !303
  call void @llvm.dbg.value(metadata !{i8* %incdec.ptr26.i409}, i64 0, metadata !294) #2, !dbg !300
  %63 = load i8* %incdec.ptr26.i409, align 1, !dbg !300, !tbaa !128
  call void @llvm.dbg.value(metadata !{i8 %61}, i64 0, metadata !304) #2, !dbg !300
  %tobool1.i416 = icmp eq i8 %63, 0, !dbg !300
  br i1 %tobool1.i416, label %__str_to_int.exit419, label %while.body.i411, !dbg !300

if.else13.i418:                                   ; preds = %while.body.i411
  call fastcc void @__emit_error(i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)) #2, !dbg !305
  unreachable

__str_to_int.exit419:                             ; preds = %if.then10.i417
  %conv94 = trunc i64 %add.i415 to i32, !dbg !293
  call void @llvm.dbg.value(metadata !{i32 %conv94}, i64 0, metadata !31), !dbg !293
  br label %while.cond.backedge, !dbg !306

if.else95:                                        ; preds = %if.end.i387
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !307), !dbg !309
  tail call void @llvm.dbg.value(metadata !310, i64 0, metadata !311), !dbg !309
  br i1 %cmp7.i247, label %while.body.i424, label %if.else153, !dbg !312

while.body.i424:                                  ; preds = %if.else95, %if.end.i428
  %64 = phi i8 [ %65, %if.end.i428 ], [ 45, %if.else95 ]
  %b.addr.09.i421 = phi i8* [ %incdec.ptr3.i426, %if.end.i428 ], [ getelementptr inbounds ([13 x i8]* @.str12, i64 0, i64 0), %if.else95 ]
  %a.addr.08.i422 = phi i8* [ %incdec.ptr.i425, %if.end.i428 ], [ %11, %if.else95 ]
  %tobool.i423 = icmp eq i8 %64, 0, !dbg !313
  br i1 %tobool.i423, label %if.then105, label %if.end.i428, !dbg !313

if.end.i428:                                      ; preds = %while.body.i424
  %incdec.ptr.i425 = getelementptr inbounds i8* %a.addr.08.i422, i64 1, !dbg !314
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i425}, i64 0, metadata !307), !dbg !314
  %incdec.ptr3.i426 = getelementptr inbounds i8* %b.addr.09.i421, i64 1, !dbg !315
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i426}, i64 0, metadata !311), !dbg !315
  %65 = load i8* %incdec.ptr.i425, align 1, !dbg !312, !tbaa !128
  %66 = load i8* %incdec.ptr3.i426, align 1, !dbg !312, !tbaa !128
  %cmp.i427 = icmp eq i8 %65, %66, !dbg !312
  br i1 %cmp.i427, label %while.body.i424, label %lor.lhs.false100, !dbg !312

lor.lhs.false100:                                 ; preds = %if.end.i428
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !307), !dbg !309
  tail call void @llvm.dbg.value(metadata !316, i64 0, metadata !311), !dbg !309
  br i1 %cmp7.i247, label %while.body.i435, label %if.else153, !dbg !312

while.body.i435:                                  ; preds = %lor.lhs.false100, %if.end.i439
  %67 = phi i8 [ %68, %if.end.i439 ], [ 45, %lor.lhs.false100 ]
  %b.addr.09.i432 = phi i8* [ %incdec.ptr3.i437, %if.end.i439 ], [ getelementptr inbounds ([12 x i8]* @.str13, i64 0, i64 0), %lor.lhs.false100 ]
  %a.addr.08.i433 = phi i8* [ %incdec.ptr.i436, %if.end.i439 ], [ %11, %lor.lhs.false100 ]
  %tobool.i434 = icmp eq i8 %67, 0, !dbg !313
  br i1 %tobool.i434, label %if.then105, label %if.end.i439, !dbg !313

if.end.i439:                                      ; preds = %while.body.i435
  %incdec.ptr.i436 = getelementptr inbounds i8* %a.addr.08.i433, i64 1, !dbg !314
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i436}, i64 0, metadata !307), !dbg !314
  %incdec.ptr3.i437 = getelementptr inbounds i8* %b.addr.09.i432, i64 1, !dbg !315
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i437}, i64 0, metadata !311), !dbg !315
  %68 = load i8* %incdec.ptr.i436, align 1, !dbg !312, !tbaa !128
  %69 = load i8* %incdec.ptr3.i437, align 1, !dbg !312, !tbaa !128
  %cmp.i438 = icmp eq i8 %68, %69, !dbg !312
  br i1 %cmp.i438, label %while.body.i435, label %if.else107, !dbg !312

if.then105:                                       ; preds = %while.body.i435, %while.body.i424
  call void @llvm.dbg.value(metadata !317, i64 0, metadata !32), !dbg !318
  %inc106 = add nsw i32 %k.0721, 1, !dbg !320
  call void @llvm.dbg.value(metadata !{i32 %inc106}, i64 0, metadata !41), !dbg !320
  br label %while.cond.backedge, !dbg !321

while.cond.backedge:                              ; preds = %__add_arg.exit367, %__str_to_int.exit360, %if.then105, %if.then129, %__add_arg.exit, %__str_to_int.exit, %if.then117, %__str_to_int.exit419, %__add_arg.exit293
  %.be = phi i32 [ %inc.i291, %__add_arg.exit293 ], [ %10, %__str_to_int.exit419 ], [ %10, %if.then105 ], [ %10, %if.then117 ], [ %10, %if.then129 ], [ %10, %__str_to_int.exit ], [ %inc.i, %__add_arg.exit ], [ %10, %__str_to_int.exit360 ], [ %inc.i365, %__add_arg.exit367 ]
  %fd_fail.0.be = phi i32 [ %fd_fail.0700, %__add_arg.exit293 ], [ %fd_fail.0700, %__str_to_int.exit419 ], [ %fd_fail.0700, %if.then105 ], [ %fd_fail.0700, %if.then117 ], [ 1, %if.then129 ], [ %conv152, %__str_to_int.exit ], [ %fd_fail.0700, %__add_arg.exit ], [ %fd_fail.0700, %__str_to_int.exit360 ], [ %fd_fail.0700, %__add_arg.exit367 ]
  %save_all_writes_flag.0.be = phi i32 [ %save_all_writes_flag.0706, %__add_arg.exit293 ], [ %save_all_writes_flag.0706, %__str_to_int.exit419 ], [ %save_all_writes_flag.0706, %if.then105 ], [ 1, %if.then117 ], [ %save_all_writes_flag.0706, %if.then129 ], [ %save_all_writes_flag.0706, %__str_to_int.exit ], [ %save_all_writes_flag.0706, %__add_arg.exit ], [ %save_all_writes_flag.0706, %__str_to_int.exit360 ], [ %save_all_writes_flag.0706, %__add_arg.exit367 ]
  %sym_arg_num.0.be = phi i32 [ %inc18, %__add_arg.exit293 ], [ %sym_arg_num.0713, %__str_to_int.exit419 ], [ %sym_arg_num.0713, %if.then105 ], [ %sym_arg_num.0713, %if.then117 ], [ %sym_arg_num.0713, %if.then129 ], [ %sym_arg_num.0713, %__str_to_int.exit ], [ %sym_arg_num.0713, %__add_arg.exit ], [ %sym_arg_num.0713, %__str_to_int.exit360 ], [ %inc59, %__add_arg.exit367 ]
  %k.0.be = phi i32 [ %inc14, %__add_arg.exit293 ], [ %inc90, %__str_to_int.exit419 ], [ %inc106, %if.then105 ], [ %inc118, %if.then117 ], [ %inc130, %if.then129 ], [ %inc148, %__str_to_int.exit ], [ %inc155, %__add_arg.exit ], [ %inc50, %__str_to_int.exit360 ], [ %inc50, %__add_arg.exit367 ]
  %sym_stdout_flag.0.be = phi i32 [ %sym_stdout_flag.0729, %__add_arg.exit293 ], [ %sym_stdout_flag.0729, %__str_to_int.exit419 ], [ 1, %if.then105 ], [ %sym_stdout_flag.0729, %if.then117 ], [ %sym_stdout_flag.0729, %if.then129 ], [ %sym_stdout_flag.0729, %__str_to_int.exit ], [ %sym_stdout_flag.0729, %__add_arg.exit ], [ %sym_stdout_flag.0729, %__str_to_int.exit360 ], [ %sym_stdout_flag.0729, %__add_arg.exit367 ]
  %sym_file_len.0.be = phi i32 [ %sym_file_len.0736, %__add_arg.exit293 ], [ %conv94, %__str_to_int.exit419 ], [ %sym_file_len.0736, %if.then105 ], [ %sym_file_len.0736, %if.then117 ], [ %sym_file_len.0736, %if.then129 ], [ %sym_file_len.0736, %__str_to_int.exit ], [ %sym_file_len.0736, %__add_arg.exit ], [ %sym_file_len.0736, %__str_to_int.exit360 ], [ %sym_file_len.0736, %__add_arg.exit367 ]
  %sym_files.0.be = phi i32 [ %sym_files.0743, %__add_arg.exit293 ], [ %conv89, %__str_to_int.exit419 ], [ %sym_files.0743, %if.then105 ], [ %sym_files.0743, %if.then117 ], [ %sym_files.0743, %if.then129 ], [ %sym_files.0743, %__str_to_int.exit ], [ %sym_files.0743, %__add_arg.exit ], [ %sym_files.0743, %__str_to_int.exit360 ], [ %sym_files.0743, %__add_arg.exit367 ]
  %cmp2 = icmp slt i32 %k.0.be, %0, !dbg !141
  br i1 %cmp2, label %while.body, label %while.end, !dbg !141

if.else107:                                       ; preds = %if.end.i439
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !322), !dbg !324
  tail call void @llvm.dbg.value(metadata !325, i64 0, metadata !326), !dbg !324
  br i1 %cmp7.i247, label %while.body.i446, label %if.else153, !dbg !327

while.body.i446:                                  ; preds = %if.else107, %if.end.i450
  %70 = phi i8 [ %71, %if.end.i450 ], [ 45, %if.else107 ]
  %b.addr.09.i443 = phi i8* [ %incdec.ptr3.i448, %if.end.i450 ], [ getelementptr inbounds ([18 x i8]* @.str14, i64 0, i64 0), %if.else107 ]
  %a.addr.08.i444 = phi i8* [ %incdec.ptr.i447, %if.end.i450 ], [ %11, %if.else107 ]
  %tobool.i445 = icmp eq i8 %70, 0, !dbg !328
  br i1 %tobool.i445, label %if.then117, label %if.end.i450, !dbg !328

if.end.i450:                                      ; preds = %while.body.i446
  %incdec.ptr.i447 = getelementptr inbounds i8* %a.addr.08.i444, i64 1, !dbg !329
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i447}, i64 0, metadata !322), !dbg !329
  %incdec.ptr3.i448 = getelementptr inbounds i8* %b.addr.09.i443, i64 1, !dbg !330
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i448}, i64 0, metadata !326), !dbg !330
  %71 = load i8* %incdec.ptr.i447, align 1, !dbg !327, !tbaa !128
  %72 = load i8* %incdec.ptr3.i448, align 1, !dbg !327, !tbaa !128
  %cmp.i449 = icmp eq i8 %71, %72, !dbg !327
  br i1 %cmp.i449, label %while.body.i446, label %lor.lhs.false112, !dbg !327

lor.lhs.false112:                                 ; preds = %if.end.i450
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !322), !dbg !324
  tail call void @llvm.dbg.value(metadata !331, i64 0, metadata !326), !dbg !324
  br i1 %cmp7.i247, label %while.body.i457, label %if.else153, !dbg !327

while.body.i457:                                  ; preds = %lor.lhs.false112, %if.end.i461
  %73 = phi i8 [ %74, %if.end.i461 ], [ 45, %lor.lhs.false112 ]
  %b.addr.09.i454 = phi i8* [ %incdec.ptr3.i459, %if.end.i461 ], [ getelementptr inbounds ([17 x i8]* @.str15, i64 0, i64 0), %lor.lhs.false112 ]
  %a.addr.08.i455 = phi i8* [ %incdec.ptr.i458, %if.end.i461 ], [ %11, %lor.lhs.false112 ]
  %tobool.i456 = icmp eq i8 %73, 0, !dbg !328
  br i1 %tobool.i456, label %if.then117, label %if.end.i461, !dbg !328

if.end.i461:                                      ; preds = %while.body.i457
  %incdec.ptr.i458 = getelementptr inbounds i8* %a.addr.08.i455, i64 1, !dbg !329
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i458}, i64 0, metadata !322), !dbg !329
  %incdec.ptr3.i459 = getelementptr inbounds i8* %b.addr.09.i454, i64 1, !dbg !330
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i459}, i64 0, metadata !326), !dbg !330
  %74 = load i8* %incdec.ptr.i458, align 1, !dbg !327, !tbaa !128
  %75 = load i8* %incdec.ptr3.i459, align 1, !dbg !327, !tbaa !128
  %cmp.i460 = icmp eq i8 %74, %75, !dbg !327
  br i1 %cmp.i460, label %while.body.i457, label %if.else119, !dbg !327

if.then117:                                       ; preds = %while.body.i457, %while.body.i446
  call void @llvm.dbg.value(metadata !317, i64 0, metadata !33), !dbg !332
  %inc118 = add nsw i32 %k.0721, 1, !dbg !334
  call void @llvm.dbg.value(metadata !{i32 %inc118}, i64 0, metadata !41), !dbg !334
  br label %while.cond.backedge, !dbg !335

if.else119:                                       ; preds = %if.end.i461
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !336), !dbg !338
  tail call void @llvm.dbg.value(metadata !339, i64 0, metadata !340), !dbg !338
  br i1 %cmp7.i247, label %while.body.i501, label %if.else153, !dbg !341

while.body.i501:                                  ; preds = %if.else119, %if.end.i505
  %76 = phi i8 [ %77, %if.end.i505 ], [ 45, %if.else119 ]
  %b.addr.09.i498 = phi i8* [ %incdec.ptr3.i503, %if.end.i505 ], [ getelementptr inbounds ([10 x i8]* @.str16, i64 0, i64 0), %if.else119 ]
  %a.addr.08.i499 = phi i8* [ %incdec.ptr.i502, %if.end.i505 ], [ %11, %if.else119 ]
  %tobool.i500 = icmp eq i8 %76, 0, !dbg !342
  br i1 %tobool.i500, label %if.then129, label %if.end.i505, !dbg !342

if.end.i505:                                      ; preds = %while.body.i501
  %incdec.ptr.i502 = getelementptr inbounds i8* %a.addr.08.i499, i64 1, !dbg !343
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i502}, i64 0, metadata !336), !dbg !343
  %incdec.ptr3.i503 = getelementptr inbounds i8* %b.addr.09.i498, i64 1, !dbg !344
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i503}, i64 0, metadata !340), !dbg !344
  %77 = load i8* %incdec.ptr.i502, align 1, !dbg !341, !tbaa !128
  %78 = load i8* %incdec.ptr3.i503, align 1, !dbg !341, !tbaa !128
  %cmp.i504 = icmp eq i8 %77, %78, !dbg !341
  br i1 %cmp.i504, label %while.body.i501, label %lor.lhs.false124, !dbg !341

lor.lhs.false124:                                 ; preds = %if.end.i505
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !336), !dbg !338
  tail call void @llvm.dbg.value(metadata !345, i64 0, metadata !340), !dbg !338
  br i1 %cmp7.i247, label %while.body.i490, label %if.else153, !dbg !341

while.body.i490:                                  ; preds = %lor.lhs.false124, %if.end.i494
  %79 = phi i8 [ %80, %if.end.i494 ], [ 45, %lor.lhs.false124 ]
  %b.addr.09.i487 = phi i8* [ %incdec.ptr3.i492, %if.end.i494 ], [ getelementptr inbounds ([9 x i8]* @.str17, i64 0, i64 0), %lor.lhs.false124 ]
  %a.addr.08.i488 = phi i8* [ %incdec.ptr.i491, %if.end.i494 ], [ %11, %lor.lhs.false124 ]
  %tobool.i489 = icmp eq i8 %79, 0, !dbg !342
  br i1 %tobool.i489, label %if.then129, label %if.end.i494, !dbg !342

if.end.i494:                                      ; preds = %while.body.i490
  %incdec.ptr.i491 = getelementptr inbounds i8* %a.addr.08.i488, i64 1, !dbg !343
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i491}, i64 0, metadata !336), !dbg !343
  %incdec.ptr3.i492 = getelementptr inbounds i8* %b.addr.09.i487, i64 1, !dbg !344
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i492}, i64 0, metadata !340), !dbg !344
  %80 = load i8* %incdec.ptr.i491, align 1, !dbg !341, !tbaa !128
  %81 = load i8* %incdec.ptr3.i492, align 1, !dbg !341, !tbaa !128
  %cmp.i493 = icmp eq i8 %80, %81, !dbg !341
  br i1 %cmp.i493, label %while.body.i490, label %if.else131, !dbg !341

if.then129:                                       ; preds = %while.body.i490, %while.body.i501
  call void @llvm.dbg.value(metadata !317, i64 0, metadata !34), !dbg !346
  %inc130 = add nsw i32 %k.0721, 1, !dbg !348
  call void @llvm.dbg.value(metadata !{i32 %inc130}, i64 0, metadata !41), !dbg !348
  br label %while.cond.backedge, !dbg !349

if.else131:                                       ; preds = %if.end.i494
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !350), !dbg !352
  tail call void @llvm.dbg.value(metadata !353, i64 0, metadata !354), !dbg !352
  br i1 %cmp7.i247, label %while.body.i479, label %if.else153, !dbg !355

while.body.i479:                                  ; preds = %if.else131, %if.end.i483
  %82 = phi i8 [ %83, %if.end.i483 ], [ 45, %if.else131 ]
  %b.addr.09.i476 = phi i8* [ %incdec.ptr3.i481, %if.end.i483 ], [ getelementptr inbounds ([11 x i8]* @.str18, i64 0, i64 0), %if.else131 ]
  %a.addr.08.i477 = phi i8* [ %incdec.ptr.i480, %if.end.i483 ], [ %11, %if.else131 ]
  %tobool.i478 = icmp eq i8 %82, 0, !dbg !356
  br i1 %tobool.i478, label %if.then141, label %if.end.i483, !dbg !356

if.end.i483:                                      ; preds = %while.body.i479
  %incdec.ptr.i480 = getelementptr inbounds i8* %a.addr.08.i477, i64 1, !dbg !357
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i480}, i64 0, metadata !350), !dbg !357
  %incdec.ptr3.i481 = getelementptr inbounds i8* %b.addr.09.i476, i64 1, !dbg !358
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i481}, i64 0, metadata !354), !dbg !358
  %83 = load i8* %incdec.ptr.i480, align 1, !dbg !355, !tbaa !128
  %84 = load i8* %incdec.ptr3.i481, align 1, !dbg !355, !tbaa !128
  %cmp.i482 = icmp eq i8 %83, %84, !dbg !355
  br i1 %cmp.i482, label %while.body.i479, label %lor.lhs.false136, !dbg !355

lor.lhs.false136:                                 ; preds = %if.end.i483
  tail call void @llvm.dbg.value(metadata !{i8* %11}, i64 0, metadata !350), !dbg !352
  tail call void @llvm.dbg.value(metadata !359, i64 0, metadata !354), !dbg !352
  br i1 %cmp7.i247, label %while.body.i468, label %if.else153, !dbg !355

while.body.i468:                                  ; preds = %lor.lhs.false136, %if.end.i472
  %85 = phi i8 [ %86, %if.end.i472 ], [ 45, %lor.lhs.false136 ]
  %b.addr.09.i465 = phi i8* [ %incdec.ptr3.i470, %if.end.i472 ], [ getelementptr inbounds ([10 x i8]* @.str19, i64 0, i64 0), %lor.lhs.false136 ]
  %a.addr.08.i466 = phi i8* [ %incdec.ptr.i469, %if.end.i472 ], [ %11, %lor.lhs.false136 ]
  %tobool.i467 = icmp eq i8 %85, 0, !dbg !356
  br i1 %tobool.i467, label %if.then141, label %if.end.i472, !dbg !356

if.end.i472:                                      ; preds = %while.body.i468
  %incdec.ptr.i469 = getelementptr inbounds i8* %a.addr.08.i466, i64 1, !dbg !357
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr.i469}, i64 0, metadata !350), !dbg !357
  %incdec.ptr3.i470 = getelementptr inbounds i8* %b.addr.09.i465, i64 1, !dbg !358
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr3.i470}, i64 0, metadata !354), !dbg !358
  %86 = load i8* %incdec.ptr.i469, align 1, !dbg !355, !tbaa !128
  %87 = load i8* %incdec.ptr3.i470, align 1, !dbg !355, !tbaa !128
  %cmp.i471 = icmp eq i8 %86, %87, !dbg !355
  br i1 %cmp.i471, label %while.body.i468, label %if.else153, !dbg !355

if.then141:                                       ; preds = %while.body.i468, %while.body.i479
  call void @llvm.dbg.value(metadata !360, i64 0, metadata !55), !dbg !361
  %inc143 = add nsw i32 %k.0721, 1, !dbg !362
  call void @llvm.dbg.value(metadata !{i32 %inc143}, i64 0, metadata !41), !dbg !362
  %cmp144 = icmp eq i32 %inc143, %0, !dbg !362
  br i1 %cmp144, label %if.then146, label %if.end147, !dbg !362

if.then146:                                       ; preds = %if.then141
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str20, i64 0, i64 0)), !dbg !364
  unreachable

if.end147:                                        ; preds = %if.then141
  %inc148 = add nsw i32 %k.0721, 2, !dbg !365
  call void @llvm.dbg.value(metadata !{i32 %inc148}, i64 0, metadata !41), !dbg !365
  %idxprom149 = sext i32 %inc143 to i64, !dbg !365
  %arrayidx150 = getelementptr inbounds i8** %1, i64 %idxprom149, !dbg !365
  %88 = load i8** %arrayidx150, align 8, !dbg !365, !tbaa !112
  call void @llvm.dbg.value(metadata !{i8* %88}, i64 0, metadata !366) #2, !dbg !367
  call void @llvm.dbg.value(metadata !368, i64 0, metadata !369) #2, !dbg !367
  call void @llvm.dbg.value(metadata !165, i64 0, metadata !370) #2, !dbg !371
  %89 = load i8* %88, align 1, !dbg !372, !tbaa !128
  %tobool.i258 = icmp eq i8 %89, 0, !dbg !372
  br i1 %tobool.i258, label %if.then.i259, label %while.body.i260, !dbg !372

if.then.i259:                                     ; preds = %if.end147
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str20, i64 0, i64 0)) #2, !dbg !372
  unreachable

while.body.i260:                                  ; preds = %if.end147, %if.then10.i
  %90 = phi i8 [ %92, %if.then10.i ], [ %89, %if.end147 ]
  %s.pn.i = phi i8* [ %incdec.ptr26.i, %if.then10.i ], [ %88, %if.end147 ]
  %res.025.i = phi i64 [ %add.i, %if.then10.i ], [ 0, %if.end147 ]
  %incdec.ptr26.i = getelementptr inbounds i8* %s.pn.i, i64 1, !dbg !373
  %.off.i = add i8 %90, -48, !dbg !374
  %91 = icmp ult i8 %.off.i, 10, !dbg !374
  br i1 %91, label %if.then10.i, label %if.else13.i, !dbg !374

if.then10.i:                                      ; preds = %while.body.i260
  %conv.i = sext i8 %90 to i64, !dbg !375
  %mul.i = mul nsw i64 %res.025.i, 10, !dbg !376
  %sub.i = add i64 %conv.i, -48, !dbg !376
  %add.i = add i64 %sub.i, %mul.i, !dbg !376
  call void @llvm.dbg.value(metadata !{i64 %add.i}, i64 0, metadata !370) #2, !dbg !376
  call void @llvm.dbg.value(metadata !{i8* %incdec.ptr26.i}, i64 0, metadata !366) #2, !dbg !373
  %92 = load i8* %incdec.ptr26.i, align 1, !dbg !373, !tbaa !128
  call void @llvm.dbg.value(metadata !{i8 %90}, i64 0, metadata !377) #2, !dbg !373
  %tobool1.i = icmp eq i8 %92, 0, !dbg !373
  br i1 %tobool1.i, label %__str_to_int.exit, label %while.body.i260, !dbg !373

if.else13.i:                                      ; preds = %while.body.i260
  call fastcc void @__emit_error(i8* getelementptr inbounds ([54 x i8]* @.str20, i64 0, i64 0)) #2, !dbg !378
  unreachable

__str_to_int.exit:                                ; preds = %if.then10.i
  %conv152 = trunc i64 %add.i to i32, !dbg !365
  call void @llvm.dbg.value(metadata !{i32 %conv152}, i64 0, metadata !34), !dbg !365
  br label %while.cond.backedge, !dbg !379

if.else153:                                       ; preds = %if.end.i472, %lor.lhs.false72, %if.else67, %lor.lhs.false27, %if.else, %lor.lhs.false, %while.body, %if.else107, %lor.lhs.false112, %if.else95, %lor.lhs.false100, %lor.lhs.false124, %if.else119, %if.else131, %lor.lhs.false136
  call void @llvm.dbg.value(metadata !{i32 %inc155}, i64 0, metadata !41), !dbg !380
  call void @llvm.dbg.value(metadata !182, i64 0, metadata !382) #2, !dbg !383
  %cmp.i245 = icmp eq i32 %10, 1024, !dbg !384
  br i1 %cmp.i245, label %if.then.i, label %__add_arg.exit, !dbg !384

if.then.i:                                        ; preds = %if.else153
  call fastcc void @__emit_error(i8* getelementptr inbounds ([37 x i8]* @.str21, i64 0, i64 0)) #2, !dbg !385
  unreachable

__add_arg.exit:                                   ; preds = %if.else153
  %inc155 = add nsw i32 %k.0721, 1, !dbg !380
  %idxprom.i = sext i32 %10 to i64, !dbg !386
  %arrayidx.i = getelementptr inbounds [1024 x i8*]* %new_argv, i64 0, i64 %idxprom.i, !dbg !386
  store i8* %11, i8** %arrayidx.i, align 8, !dbg !386, !tbaa !112
  %inc.i = add nsw i32 %10, 1, !dbg !387
  call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !20), !dbg !387
  call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !20), !dbg !115
  call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !20), !dbg !116
  call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !20), !dbg !117
  call void @llvm.dbg.value(metadata !{i32 %inc.i}, i64 0, metadata !20), !dbg !118
  br label %while.cond.backedge

while.end:                                        ; preds = %while.cond.backedge, %while.cond.preheader
  %sym_files.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %sym_files.0.be, %while.cond.backedge ]
  %sym_file_len.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %sym_file_len.0.be, %while.cond.backedge ]
  %sym_stdout_flag.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %sym_stdout_flag.0.be, %while.cond.backedge ]
  %save_all_writes_flag.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %save_all_writes_flag.0.be, %while.cond.backedge ]
  %fd_fail.0.lcssa = phi i32 [ 0, %while.cond.preheader ], [ %fd_fail.0.be, %while.cond.backedge ]
  %.lcssa572 = phi i32 [ 0, %while.cond.preheader ], [ %.be, %while.cond.backedge ]
  %add165 = add nsw i32 %.lcssa572, 1, !dbg !115
  %conv166 = sext i32 %add165 to i64, !dbg !115
  %mul = shl nsw i64 %conv166, 3, !dbg !115
  %call167 = call noalias i8* @malloc(i64 %mul) #2, !dbg !115
  %93 = bitcast i8* %call167 to i8**, !dbg !115
  call void @llvm.dbg.value(metadata !{i8** %93}, i64 0, metadata !35), !dbg !115
  call void @klee_mark_global(i8* %call167) #2, !dbg !388
  %conv168 = sext i32 %.lcssa572 to i64, !dbg !116
  %mul169 = shl nsw i64 %conv168, 3, !dbg !116
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %call167, i8* %2, i64 %mul169, i32 8, i1 false), !dbg !116
  %arrayidx171 = getelementptr inbounds i8** %93, i64 %conv168, !dbg !117
  store i8* null, i8** %arrayidx171, align 8, !dbg !117, !tbaa !112
  store i32 %.lcssa572, i32* %argcPtr, align 4, !dbg !118, !tbaa !107
  store i8** %93, i8*** %argvPtr, align 8, !dbg !389, !tbaa !112
  call void @klee_init_fds(i32 %sym_files.0.lcssa, i32 %sym_file_len.0.lcssa, i32 %sym_stdout_flag.0.lcssa, i32 %save_all_writes_flag.0.lcssa, i32 %fd_fail.0.lcssa) #2, !dbg !390
  call void @llvm.lifetime.end(i64 8192, i8* %2) #2, !dbg !391
  ret void, !dbg !391
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind uwtable
define internal fastcc void @__emit_error(i8* %msg) #3 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %msg}, i64 0, metadata !95), !dbg !392
  tail call void @klee_report_error(i8* getelementptr inbounds ([16 x i8]* @.str22, i64 0, i64 0), i32 24, i8* %msg, i8* getelementptr inbounds ([9 x i8]* @.str23, i64 0, i64 0)) #7, !dbg !393
  unreachable, !dbg !393
}

; Function Attrs: nounwind uwtable
define internal fastcc i8* @__get_sym_str(i32 %numChars, i8* %name) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %numChars}, i64 0, metadata !65), !dbg !394
  tail call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !66), !dbg !394
  %add = add nsw i32 %numChars, 1, !dbg !395
  %conv = sext i32 %add to i64, !dbg !395
  %call = tail call noalias i8* @malloc(i64 %conv) #2, !dbg !395
  tail call void @llvm.dbg.value(metadata !{i8* %call}, i64 0, metadata !68), !dbg !395
  tail call void @klee_mark_global(i8* %call) #2, !dbg !396
  tail call void @klee_make_symbolic(i8* %call, i64 %conv, i8* %name) #2, !dbg !397
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !67), !dbg !398
  %cmp18 = icmp sgt i32 %numChars, 0, !dbg !398
  br i1 %cmp18, label %for.body, label %for.end, !dbg !398

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds i8* %call, i64 %indvars.iv, !dbg !400
  %0 = load i8* %arrayidx, align 1, !dbg !400, !tbaa !128
  tail call void @llvm.dbg.value(metadata !{i8 %0}, i64 0, metadata !401), !dbg !402
  %cmp.i = icmp sgt i8 %0, 31, !dbg !403
  %cmp3.i = icmp ne i8 %0, 127, !dbg !403
  %cmp3..i = and i1 %cmp.i, %cmp3.i, !dbg !403
  %conv5 = zext i1 %cmp3..i to i64, !dbg !400
  tail call void @klee_prefer_cex(i8* %call, i64 %conv5) #2, !dbg !400
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !398
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !398
  %exitcond = icmp eq i32 %lftr.wideiv, %numChars, !dbg !398
  br i1 %exitcond, label %for.end, label %for.body, !dbg !398

for.end:                                          ; preds = %for.body, %entry
  %idxprom6 = sext i32 %numChars to i64, !dbg !404
  %arrayidx7 = getelementptr inbounds i8* %call, i64 %idxprom6, !dbg !404
  store i8 0, i8* %arrayidx7, align 1, !dbg !404, !tbaa !128
  ret i8* %call, !dbg !405
}

declare i32 @klee_range(i32, i32, i8*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

declare void @klee_mark_global(i8*) #4

declare void @klee_init_fds(i32, i32, i32, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

declare void @klee_make_symbolic(i8*, i64, i8*) #4

declare void @klee_prefer_cex(i8*, i64) #4

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #6

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!102, !103}
!llvm.ident = !{!104}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/joker/klee-lf/runtime/POSIX//home/joker/klee-lf/runtime/POSIX/klee_init_env.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/joker/klee-lf/runtime/POSIX/klee_init_env.c", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !61, metadata !69, metadata !74, metadata !82, metadata !91, metadata !96}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"klee_init_env", metadata !"klee_init_env", metadata !"", i32 85, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i8***)* @klee_init_env, null, null, metadata !15, i32 85} ; [ DW_TAG_subprogram ] [line 85] [def] [klee_init_env]
!5 = metadata !{metadata !"klee_init_env.c", metadata !"/home/joker/klee-lf/runtime/POSIX"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !11}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!10 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!12 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!13 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!14 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!15 = metadata !{metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !26, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !40, metadata !41, metadata !42, metadata !43, metadata !49, metadata !52, metadata !55}
!16 = metadata !{i32 786689, metadata !4, metadata !"argcPtr", metadata !6, i32 16777301, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argcPtr] [line 85]
!17 = metadata !{i32 786689, metadata !4, metadata !"argvPtr", metadata !6, i32 33554517, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argvPtr] [line 85]
!18 = metadata !{i32 786688, metadata !4, metadata !"argc", metadata !6, i32 86, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argc] [line 86]
!19 = metadata !{i32 786688, metadata !4, metadata !"argv", metadata !6, i32 87, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [argv] [line 87]
!20 = metadata !{i32 786688, metadata !4, metadata !"new_argc", metadata !6, i32 89, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_argc] [line 89]
!21 = metadata !{i32 786688, metadata !4, metadata !"n_args", metadata !6, i32 89, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n_args] [line 89]
!22 = metadata !{i32 786688, metadata !4, metadata !"new_argv", metadata !6, i32 90, metadata !23, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [new_argv] [line 90]
!23 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 65536, i64 64, i32 0, i32 0, metadata !13, metadata !24, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 64, offset 0] [from ]
!24 = metadata !{metadata !25}
!25 = metadata !{i32 786465, i64 0, i64 1024}     ; [ DW_TAG_subrange_type ] [0, 1023]
!26 = metadata !{i32 786688, metadata !4, metadata !"max_len", metadata !6, i32 91, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_len] [line 91]
!27 = metadata !{i32 786468, null, null, metadata !"unsigned int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!28 = metadata !{i32 786688, metadata !4, metadata !"min_argvs", metadata !6, i32 91, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [min_argvs] [line 91]
!29 = metadata !{i32 786688, metadata !4, metadata !"max_argvs", metadata !6, i32 91, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [max_argvs] [line 91]
!30 = metadata !{i32 786688, metadata !4, metadata !"sym_files", metadata !6, i32 92, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_files] [line 92]
!31 = metadata !{i32 786688, metadata !4, metadata !"sym_file_len", metadata !6, i32 92, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_file_len] [line 92]
!32 = metadata !{i32 786688, metadata !4, metadata !"sym_stdout_flag", metadata !6, i32 93, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_stdout_flag] [line 93]
!33 = metadata !{i32 786688, metadata !4, metadata !"save_all_writes_flag", metadata !6, i32 94, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [save_all_writes_flag] [line 94]
!34 = metadata !{i32 786688, metadata !4, metadata !"fd_fail", metadata !6, i32 95, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [fd_fail] [line 95]
!35 = metadata !{i32 786688, metadata !4, metadata !"final_argv", metadata !6, i32 96, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [final_argv] [line 96]
!36 = metadata !{i32 786688, metadata !4, metadata !"sym_arg_name", metadata !6, i32 97, metadata !37, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_arg_name] [line 97]
!37 = metadata !{i32 786433, null, null, metadata !"", i32 0, i64 40, i64 8, i32 0, i32 0, metadata !14, metadata !38, i32 0, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 40, align 8, offset 0] [from char]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 786465, i64 0, i64 5}        ; [ DW_TAG_subrange_type ] [0, 4]
!40 = metadata !{i32 786688, metadata !4, metadata !"sym_arg_num", metadata !6, i32 98, metadata !27, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sym_arg_num] [line 98]
!41 = metadata !{i32 786688, metadata !4, metadata !"k", metadata !6, i32 99, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [k] [line 99]
!42 = metadata !{i32 786688, metadata !4, metadata !"i", metadata !6, i32 99, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 99]
!43 = metadata !{i32 786688, metadata !44, metadata !"msg", metadata !6, i32 119, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 119]
!44 = metadata !{i32 786443, metadata !5, metadata !45, i32 118, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!45 = metadata !{i32 786443, metadata !5, metadata !46, i32 118, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!46 = metadata !{i32 786443, metadata !5, metadata !4, i32 117, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!47 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !48} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!48 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!49 = metadata !{i32 786688, metadata !50, metadata !"msg", metadata !6, i32 130, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 130]
!50 = metadata !{i32 786443, metadata !5, metadata !51, i32 129, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!51 = metadata !{i32 786443, metadata !5, metadata !45, i32 129, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!52 = metadata !{i32 786688, metadata !53, metadata !"msg", metadata !6, i32 150, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 150]
!53 = metadata !{i32 786443, metadata !5, metadata !54, i32 149, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!54 = metadata !{i32 786443, metadata !5, metadata !51, i32 149, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!55 = metadata !{i32 786688, metadata !56, metadata !"msg", metadata !6, i32 173, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [msg] [line 173]
!56 = metadata !{i32 786443, metadata !5, metadata !57, i32 172, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!57 = metadata !{i32 786443, metadata !5, metadata !58, i32 172, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!58 = metadata !{i32 786443, metadata !5, metadata !59, i32 168, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!59 = metadata !{i32 786443, metadata !5, metadata !60, i32 164, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!60 = metadata !{i32 786443, metadata !5, metadata !54, i32 160, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!61 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__get_sym_str", metadata !"__get_sym_str", metadata !"", i32 63, metadata !62, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i32, i8*)* @__get_sym_str, null, null, metadata !64, i32 63} ; [ DW_TAG_subprogram ] [line 63] [local] [def] [__get_sym_str]
!62 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{metadata !13, metadata !10, metadata !13}
!64 = metadata !{metadata !65, metadata !66, metadata !67, metadata !68}
!65 = metadata !{i32 786689, metadata !61, metadata !"numChars", metadata !6, i32 16777279, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [numChars] [line 63]
!66 = metadata !{i32 786689, metadata !61, metadata !"name", metadata !6, i32 33554495, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 63]
!67 = metadata !{i32 786688, metadata !61, metadata !"i", metadata !6, i32 64, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 64]
!68 = metadata !{i32 786688, metadata !61, metadata !"s", metadata !6, i32 65, metadata !13, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [s] [line 65]
!69 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__isprint", metadata !"__isprint", metadata !"", i32 48, metadata !70, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !72, i32 48} ; [ DW_TAG_subprogram ] [line 48] [local] [def] [__isprint]
!70 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{metadata !10, metadata !48}
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786689, metadata !69, metadata !"c", metadata !6, i32 16777264, metadata !48, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [c] [line 48]
!74 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__add_arg", metadata !"__add_arg", metadata !"", i32 76, metadata !75, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !77, i32 76} ; [ DW_TAG_subprogram ] [line 76] [local] [def] [__add_arg]
!75 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{null, metadata !9, metadata !12, metadata !13, metadata !10}
!77 = metadata !{metadata !78, metadata !79, metadata !80, metadata !81}
!78 = metadata !{i32 786689, metadata !74, metadata !"argc", metadata !6, i32 16777292, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 76]
!79 = metadata !{i32 786689, metadata !74, metadata !"argv", metadata !6, i32 33554508, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 76]
!80 = metadata !{i32 786689, metadata !74, metadata !"arg", metadata !6, i32 50331724, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arg] [line 76]
!81 = metadata !{i32 786689, metadata !74, metadata !"argcMax", metadata !6, i32 67108940, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!82 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__str_to_int", metadata !"__str_to_int", metadata !"", i32 30, metadata !83, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !86, i32 30} ; [ DW_TAG_subprogram ] [line 30] [local] [def] [__str_to_int]
!83 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{metadata !85, metadata !13, metadata !47}
!85 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!86 = metadata !{metadata !87, metadata !88, metadata !89, metadata !90}
!87 = metadata !{i32 786689, metadata !82, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 30]
!88 = metadata !{i32 786689, metadata !82, metadata !"error_msg", metadata !6, i32 33554462, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!89 = metadata !{i32 786688, metadata !82, metadata !"res", metadata !6, i32 31, metadata !85, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [res] [line 31]
!90 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 32]
!91 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__emit_error", metadata !"__emit_error", metadata !"", i32 23, metadata !92, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*)* @__emit_error, null, null, metadata !94, i32 23} ; [ DW_TAG_subprogram ] [line 23] [local] [def] [__emit_error]
!92 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !93, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!93 = metadata !{null, metadata !47}
!94 = metadata !{metadata !95}
!95 = metadata !{i32 786689, metadata !91, metadata !"msg", metadata !6, i32 16777239, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [msg] [line 23]
!96 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"__streq", metadata !"__streq", metadata !"", i32 53, metadata !97, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !99, i32 53} ; [ DW_TAG_subprogram ] [line 53] [local] [def] [__streq]
!97 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = metadata !{metadata !10, metadata !47, metadata !47}
!99 = metadata !{metadata !100, metadata !101}
!100 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 53]
!101 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 53]
!102 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!103 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!104 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!105 = metadata !{i32 85, i32 0, metadata !4, null}
!106 = metadata !{i32 86, i32 0, metadata !4, null}
!107 = metadata !{metadata !108, metadata !108, i64 0}
!108 = metadata !{metadata !"int", metadata !109, i64 0}
!109 = metadata !{metadata !"omnipotent char", metadata !110, i64 0}
!110 = metadata !{metadata !"Simple C/C++ TBAA"}
!111 = metadata !{i32 87, i32 0, metadata !4, null}
!112 = metadata !{metadata !113, metadata !113, i64 0}
!113 = metadata !{metadata !"any pointer", metadata !109, i64 0}
!114 = metadata !{i32 89, i32 0, metadata !4, null}
!115 = metadata !{i32 185, i32 0, metadata !4, null}
!116 = metadata !{i32 187, i32 0, metadata !4, null}
!117 = metadata !{i32 188, i32 0, metadata !4, null}
!118 = metadata !{i32 190, i32 0, metadata !4, null}
!119 = metadata !{i32 90, i32 0, metadata !4, null}
!120 = metadata !{i32 92, i32 0, metadata !4, null}
!121 = metadata !{i32 93, i32 0, metadata !4, null}
!122 = metadata !{i32 94, i32 0, metadata !4, null}
!123 = metadata !{i32 95, i32 0, metadata !4, null}
!124 = metadata !{i32 97, i32 0, metadata !4, null}
!125 = metadata !{i32 98, i32 0, metadata !4, null}
!126 = metadata !{i32 99, i32 0, metadata !4, null}
!127 = metadata !{i32 101, i32 0, metadata !4, null}
!128 = metadata !{metadata !109, metadata !109, i64 0}
!129 = metadata !{i32 104, i32 0, metadata !130, null}
!130 = metadata !{i32 786443, metadata !5, metadata !4, i32 104, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!131 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, metadata !129} ; [ DW_TAG_arg_variable ] [a] [line 53]
!132 = metadata !{i32 53, i32 0, metadata !96, metadata !129}
!133 = metadata !{i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0)}
!134 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, metadata !129} ; [ DW_TAG_arg_variable ] [b] [line 53]
!135 = metadata !{i32 54, i32 0, metadata !96, metadata !129}
!136 = metadata !{i32 55, i32 0, metadata !137, metadata !129}
!137 = metadata !{i32 786443, metadata !5, metadata !138, i32 55, i32 0, i32 36} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!138 = metadata !{i32 786443, metadata !5, metadata !96, i32 54, i32 0, i32 35} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!139 = metadata !{i32 57, i32 0, metadata !138, metadata !129}
!140 = metadata !{i32 58, i32 0, metadata !138, metadata !129} ; [ DW_TAG_imported_module ]
!141 = metadata !{i32 117, i32 0, metadata !4, null}
!142 = metadata !{i32 124, i32 0, metadata !44, null}
!143 = metadata !{i32 105, i32 0, metadata !144, null}
!144 = metadata !{i32 786443, metadata !5, metadata !130, i32 104, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!145 = metadata !{i32 118, i32 0, metadata !45, null}
!146 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, metadata !145} ; [ DW_TAG_arg_variable ] [a] [line 53]
!147 = metadata !{i32 53, i32 0, metadata !96, metadata !145}
!148 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)}
!149 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, metadata !145} ; [ DW_TAG_arg_variable ] [b] [line 53]
!150 = metadata !{i32 54, i32 0, metadata !96, metadata !145}
!151 = metadata !{i32 55, i32 0, metadata !137, metadata !145}
!152 = metadata !{i32 57, i32 0, metadata !138, metadata !145}
!153 = metadata !{i32 58, i32 0, metadata !138, metadata !145} ; [ DW_TAG_imported_module ]
!154 = metadata !{i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0)}
!155 = metadata !{null}
!156 = metadata !{i32 119, i32 0, metadata !44, null}
!157 = metadata !{i32 120, i32 0, metadata !158, null}
!158 = metadata !{i32 786443, metadata !5, metadata !44, i32 120, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!159 = metadata !{i32 121, i32 0, metadata !158, null}
!160 = metadata !{i32 123, i32 0, metadata !44, null}
!161 = metadata !{i32 786689, metadata !82, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !160} ; [ DW_TAG_arg_variable ] [s] [line 30]
!162 = metadata !{i32 30, i32 0, metadata !82, metadata !160}
!163 = metadata !{i8* getelementptr inbounds ([48 x i8]* @.str4, i64 0, i64 0)}
!164 = metadata !{i32 786689, metadata !82, metadata !"error_msg", metadata !6, i32 33554462, metadata !47, i32 0, metadata !160} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!165 = metadata !{i64 0}
!166 = metadata !{i32 786688, metadata !82, metadata !"res", metadata !6, i32 31, metadata !85, i32 0, metadata !160} ; [ DW_TAG_auto_variable ] [res] [line 31]
!167 = metadata !{i32 31, i32 0, metadata !82, metadata !160}
!168 = metadata !{i32 34, i32 0, metadata !169, metadata !160}
!169 = metadata !{i32 786443, metadata !5, metadata !82, i32 34, i32 0, i32 28} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!170 = metadata !{i32 36, i32 0, metadata !82, metadata !160}
!171 = metadata !{i32 39, i32 0, metadata !172, metadata !160}
!172 = metadata !{i32 786443, metadata !5, metadata !173, i32 39, i32 0, i32 32} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!173 = metadata !{i32 786443, metadata !5, metadata !174, i32 37, i32 0, i32 30} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!174 = metadata !{i32 786443, metadata !5, metadata !82, i32 36, i32 0, i32 29} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!175 = metadata !{i32 37, i32 0, metadata !173, metadata !160}
!176 = metadata !{i32 40, i32 0, metadata !177, metadata !160}
!177 = metadata !{i32 786443, metadata !5, metadata !172, i32 39, i32 0, i32 33} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!178 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !160} ; [ DW_TAG_auto_variable ] [c] [line 32]
!179 = metadata !{i32 42, i32 0, metadata !180, metadata !160}
!180 = metadata !{i32 786443, metadata !5, metadata !172, i32 41, i32 0, i32 34} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!181 = metadata !{i32 126, i32 0, metadata !44, null}
!182 = metadata !{i32 1024}
!183 = metadata !{i32 786689, metadata !74, metadata !"argcMax", metadata !6, i32 67108940, metadata !10, i32 0, metadata !184} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!184 = metadata !{i32 125, i32 0, metadata !44, null}
!185 = metadata !{i32 76, i32 0, metadata !74, metadata !184}
!186 = metadata !{i32 77, i32 0, metadata !187, metadata !184}
!187 = metadata !{i32 786443, metadata !5, metadata !74, i32 77, i32 0, i32 25} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!188 = metadata !{i32 78, i32 0, metadata !189, metadata !184}
!189 = metadata !{i32 786443, metadata !5, metadata !187, i32 77, i32 0, i32 26} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!190 = metadata !{i32 80, i32 0, metadata !191, metadata !184}
!191 = metadata !{i32 786443, metadata !5, metadata !187, i32 79, i32 0, i32 27} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!192 = metadata !{i32 81, i32 0, metadata !191, metadata !184}
!193 = metadata !{i32 128, i32 0, metadata !44, null}
!194 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [a] [line 53]
!195 = metadata !{i32 129, i32 0, metadata !51, null}
!196 = metadata !{i32 53, i32 0, metadata !96, metadata !195}
!197 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str5, i64 0, i64 0)}
!198 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, metadata !195} ; [ DW_TAG_arg_variable ] [b] [line 53]
!199 = metadata !{i32 54, i32 0, metadata !96, metadata !195}
!200 = metadata !{i32 55, i32 0, metadata !137, metadata !195}
!201 = metadata !{i32 57, i32 0, metadata !138, metadata !195}
!202 = metadata !{i32 58, i32 0, metadata !138, metadata !195} ; [ DW_TAG_imported_module ]
!203 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str6, i64 0, i64 0)}
!204 = metadata !{null}
!205 = metadata !{i32 130, i32 0, metadata !50, null}
!206 = metadata !{i32 133, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !5, metadata !50, i32 133, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!208 = metadata !{i32 134, i32 0, metadata !207, null}
!209 = metadata !{i32 136, i32 0, metadata !50, null}
!210 = metadata !{i32 137, i32 0, metadata !50, null}
!211 = metadata !{i32 786689, metadata !82, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !210} ; [ DW_TAG_arg_variable ] [s] [line 30]
!212 = metadata !{i32 30, i32 0, metadata !82, metadata !210}
!213 = metadata !{i8* getelementptr inbounds ([77 x i8]* @.str7, i64 0, i64 0)}
!214 = metadata !{i32 786689, metadata !82, metadata !"error_msg", metadata !6, i32 33554462, metadata !47, i32 0, metadata !210} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!215 = metadata !{i32 786688, metadata !82, metadata !"res", metadata !6, i32 31, metadata !85, i32 0, metadata !210} ; [ DW_TAG_auto_variable ] [res] [line 31]
!216 = metadata !{i32 31, i32 0, metadata !82, metadata !210}
!217 = metadata !{i32 34, i32 0, metadata !169, metadata !210}
!218 = metadata !{i32 36, i32 0, metadata !82, metadata !210}
!219 = metadata !{i32 39, i32 0, metadata !172, metadata !210}
!220 = metadata !{i32 37, i32 0, metadata !173, metadata !210}
!221 = metadata !{i32 40, i32 0, metadata !177, metadata !210}
!222 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !210} ; [ DW_TAG_auto_variable ] [c] [line 32]
!223 = metadata !{i32 42, i32 0, metadata !180, metadata !210}
!224 = metadata !{i32 138, i32 0, metadata !50, null}
!225 = metadata !{i32 786689, metadata !82, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !224} ; [ DW_TAG_arg_variable ] [s] [line 30]
!226 = metadata !{i32 30, i32 0, metadata !82, metadata !224}
!227 = metadata !{i32 786689, metadata !82, metadata !"error_msg", metadata !6, i32 33554462, metadata !47, i32 0, metadata !224} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!228 = metadata !{i32 786688, metadata !82, metadata !"res", metadata !6, i32 31, metadata !85, i32 0, metadata !224} ; [ DW_TAG_auto_variable ] [res] [line 31]
!229 = metadata !{i32 31, i32 0, metadata !82, metadata !224}
!230 = metadata !{i32 34, i32 0, metadata !169, metadata !224}
!231 = metadata !{i32 36, i32 0, metadata !82, metadata !224}
!232 = metadata !{i32 39, i32 0, metadata !172, metadata !224}
!233 = metadata !{i32 37, i32 0, metadata !173, metadata !224}
!234 = metadata !{i32 40, i32 0, metadata !177, metadata !224}
!235 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !224} ; [ DW_TAG_auto_variable ] [c] [line 32]
!236 = metadata !{i32 42, i32 0, metadata !180, metadata !224}
!237 = metadata !{i32 139, i32 0, metadata !50, null}
!238 = metadata !{i32 786689, metadata !82, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !237} ; [ DW_TAG_arg_variable ] [s] [line 30]
!239 = metadata !{i32 30, i32 0, metadata !82, metadata !237}
!240 = metadata !{i32 786689, metadata !82, metadata !"error_msg", metadata !6, i32 33554462, metadata !47, i32 0, metadata !237} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!241 = metadata !{i32 786688, metadata !82, metadata !"res", metadata !6, i32 31, metadata !85, i32 0, metadata !237} ; [ DW_TAG_auto_variable ] [res] [line 31]
!242 = metadata !{i32 31, i32 0, metadata !82, metadata !237}
!243 = metadata !{i32 34, i32 0, metadata !169, metadata !237}
!244 = metadata !{i32 36, i32 0, metadata !82, metadata !237}
!245 = metadata !{i32 39, i32 0, metadata !172, metadata !237}
!246 = metadata !{i32 37, i32 0, metadata !173, metadata !237}
!247 = metadata !{i32 40, i32 0, metadata !177, metadata !237}
!248 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !237} ; [ DW_TAG_auto_variable ] [c] [line 32]
!249 = metadata !{i32 42, i32 0, metadata !180, metadata !237}
!250 = metadata !{i32 141, i32 0, metadata !50, null}
!251 = metadata !{i32 142, i32 0, metadata !252, null}
!252 = metadata !{i32 786443, metadata !5, metadata !50, i32 142, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!253 = metadata !{i32 143, i32 0, metadata !254, null}
!254 = metadata !{i32 786443, metadata !5, metadata !252, i32 142, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!255 = metadata !{i32 145, i32 0, metadata !254, null}
!256 = metadata !{i32 786689, metadata !74, metadata !"argcMax", metadata !6, i32 67108940, metadata !10, i32 0, metadata !257} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!257 = metadata !{i32 144, i32 0, metadata !254, null}
!258 = metadata !{i32 76, i32 0, metadata !74, metadata !257}
!259 = metadata !{i32 77, i32 0, metadata !187, metadata !257}
!260 = metadata !{i32 78, i32 0, metadata !189, metadata !257}
!261 = metadata !{i32 80, i32 0, metadata !191, metadata !257}
!262 = metadata !{i32 81, i32 0, metadata !191, metadata !257}
!263 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, metadata !264} ; [ DW_TAG_arg_variable ] [a] [line 53]
!264 = metadata !{i32 149, i32 0, metadata !54, null}
!265 = metadata !{i32 53, i32 0, metadata !96, metadata !264}
!266 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str9, i64 0, i64 0)}
!267 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, metadata !264} ; [ DW_TAG_arg_variable ] [b] [line 53]
!268 = metadata !{i32 54, i32 0, metadata !96, metadata !264}
!269 = metadata !{i32 55, i32 0, metadata !137, metadata !264}
!270 = metadata !{i32 57, i32 0, metadata !138, metadata !264}
!271 = metadata !{i32 58, i32 0, metadata !138, metadata !264} ; [ DW_TAG_imported_module ]
!272 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str10, i64 0, i64 0)}
!273 = metadata !{null}
!274 = metadata !{i32 150, i32 0, metadata !53, null}
!275 = metadata !{i32 152, i32 0, metadata !276, null}
!276 = metadata !{i32 786443, metadata !5, metadata !53, i32 152, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!277 = metadata !{i32 153, i32 0, metadata !276, null}
!278 = metadata !{i32 155, i32 0, metadata !53, null}
!279 = metadata !{i32 156, i32 0, metadata !53, null}
!280 = metadata !{i32 786689, metadata !82, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !279} ; [ DW_TAG_arg_variable ] [s] [line 30]
!281 = metadata !{i32 30, i32 0, metadata !82, metadata !279}
!282 = metadata !{i8* getelementptr inbounds ([72 x i8]* @.str11, i64 0, i64 0)}
!283 = metadata !{i32 786689, metadata !82, metadata !"error_msg", metadata !6, i32 33554462, metadata !47, i32 0, metadata !279} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!284 = metadata !{i32 786688, metadata !82, metadata !"res", metadata !6, i32 31, metadata !85, i32 0, metadata !279} ; [ DW_TAG_auto_variable ] [res] [line 31]
!285 = metadata !{i32 31, i32 0, metadata !82, metadata !279}
!286 = metadata !{i32 34, i32 0, metadata !169, metadata !279}
!287 = metadata !{i32 36, i32 0, metadata !82, metadata !279}
!288 = metadata !{i32 39, i32 0, metadata !172, metadata !279}
!289 = metadata !{i32 37, i32 0, metadata !173, metadata !279}
!290 = metadata !{i32 40, i32 0, metadata !177, metadata !279}
!291 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !279} ; [ DW_TAG_auto_variable ] [c] [line 32]
!292 = metadata !{i32 42, i32 0, metadata !180, metadata !279}
!293 = metadata !{i32 157, i32 0, metadata !53, null}
!294 = metadata !{i32 786689, metadata !82, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !293} ; [ DW_TAG_arg_variable ] [s] [line 30]
!295 = metadata !{i32 30, i32 0, metadata !82, metadata !293}
!296 = metadata !{i32 786689, metadata !82, metadata !"error_msg", metadata !6, i32 33554462, metadata !47, i32 0, metadata !293} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!297 = metadata !{i32 786688, metadata !82, metadata !"res", metadata !6, i32 31, metadata !85, i32 0, metadata !293} ; [ DW_TAG_auto_variable ] [res] [line 31]
!298 = metadata !{i32 31, i32 0, metadata !82, metadata !293}
!299 = metadata !{i32 34, i32 0, metadata !169, metadata !293}
!300 = metadata !{i32 36, i32 0, metadata !82, metadata !293}
!301 = metadata !{i32 39, i32 0, metadata !172, metadata !293}
!302 = metadata !{i32 37, i32 0, metadata !173, metadata !293}
!303 = metadata !{i32 40, i32 0, metadata !177, metadata !293}
!304 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !293} ; [ DW_TAG_auto_variable ] [c] [line 32]
!305 = metadata !{i32 42, i32 0, metadata !180, metadata !293}
!306 = metadata !{i32 159, i32 0, metadata !53, null}
!307 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, metadata !308} ; [ DW_TAG_arg_variable ] [a] [line 53]
!308 = metadata !{i32 160, i32 0, metadata !60, null}
!309 = metadata !{i32 53, i32 0, metadata !96, metadata !308}
!310 = metadata !{i8* getelementptr inbounds ([13 x i8]* @.str12, i64 0, i64 0)}
!311 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, metadata !308} ; [ DW_TAG_arg_variable ] [b] [line 53]
!312 = metadata !{i32 54, i32 0, metadata !96, metadata !308}
!313 = metadata !{i32 55, i32 0, metadata !137, metadata !308}
!314 = metadata !{i32 57, i32 0, metadata !138, metadata !308}
!315 = metadata !{i32 58, i32 0, metadata !138, metadata !308} ; [ DW_TAG_imported_module ]
!316 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str13, i64 0, i64 0)}
!317 = metadata !{i32 1}
!318 = metadata !{i32 161, i32 0, metadata !319, null}
!319 = metadata !{i32 786443, metadata !5, metadata !60, i32 160, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!320 = metadata !{i32 162, i32 0, metadata !319, null}
!321 = metadata !{i32 163, i32 0, metadata !319, null}
!322 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, metadata !323} ; [ DW_TAG_arg_variable ] [a] [line 53]
!323 = metadata !{i32 164, i32 0, metadata !59, null}
!324 = metadata !{i32 53, i32 0, metadata !96, metadata !323}
!325 = metadata !{i8* getelementptr inbounds ([18 x i8]* @.str14, i64 0, i64 0)}
!326 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, metadata !323} ; [ DW_TAG_arg_variable ] [b] [line 53]
!327 = metadata !{i32 54, i32 0, metadata !96, metadata !323}
!328 = metadata !{i32 55, i32 0, metadata !137, metadata !323}
!329 = metadata !{i32 57, i32 0, metadata !138, metadata !323}
!330 = metadata !{i32 58, i32 0, metadata !138, metadata !323} ; [ DW_TAG_imported_module ]
!331 = metadata !{i8* getelementptr inbounds ([17 x i8]* @.str15, i64 0, i64 0)}
!332 = metadata !{i32 165, i32 0, metadata !333, null}
!333 = metadata !{i32 786443, metadata !5, metadata !59, i32 164, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!334 = metadata !{i32 166, i32 0, metadata !333, null}
!335 = metadata !{i32 167, i32 0, metadata !333, null}
!336 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [a] [line 53]
!337 = metadata !{i32 168, i32 0, metadata !58, null}
!338 = metadata !{i32 53, i32 0, metadata !96, metadata !337}
!339 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str16, i64 0, i64 0)}
!340 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, metadata !337} ; [ DW_TAG_arg_variable ] [b] [line 53]
!341 = metadata !{i32 54, i32 0, metadata !96, metadata !337}
!342 = metadata !{i32 55, i32 0, metadata !137, metadata !337}
!343 = metadata !{i32 57, i32 0, metadata !138, metadata !337}
!344 = metadata !{i32 58, i32 0, metadata !138, metadata !337} ; [ DW_TAG_imported_module ]
!345 = metadata !{i8* getelementptr inbounds ([9 x i8]* @.str17, i64 0, i64 0)}
!346 = metadata !{i32 169, i32 0, metadata !347, null}
!347 = metadata !{i32 786443, metadata !5, metadata !58, i32 168, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!348 = metadata !{i32 170, i32 0, metadata !347, null}
!349 = metadata !{i32 171, i32 0, metadata !347, null}
!350 = metadata !{i32 786689, metadata !96, metadata !"a", metadata !6, i32 16777269, metadata !47, i32 0, metadata !351} ; [ DW_TAG_arg_variable ] [a] [line 53]
!351 = metadata !{i32 172, i32 0, metadata !57, null}
!352 = metadata !{i32 53, i32 0, metadata !96, metadata !351}
!353 = metadata !{i8* getelementptr inbounds ([11 x i8]* @.str18, i64 0, i64 0)}
!354 = metadata !{i32 786689, metadata !96, metadata !"b", metadata !6, i32 33554485, metadata !47, i32 0, metadata !351} ; [ DW_TAG_arg_variable ] [b] [line 53]
!355 = metadata !{i32 54, i32 0, metadata !96, metadata !351}
!356 = metadata !{i32 55, i32 0, metadata !137, metadata !351}
!357 = metadata !{i32 57, i32 0, metadata !138, metadata !351}
!358 = metadata !{i32 58, i32 0, metadata !138, metadata !351} ; [ DW_TAG_imported_module ]
!359 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str19, i64 0, i64 0)}
!360 = metadata !{null}
!361 = metadata !{i32 173, i32 0, metadata !56, null}
!362 = metadata !{i32 174, i32 0, metadata !363, null}
!363 = metadata !{i32 786443, metadata !5, metadata !56, i32 174, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!364 = metadata !{i32 175, i32 0, metadata !363, null}
!365 = metadata !{i32 177, i32 0, metadata !56, null}
!366 = metadata !{i32 786689, metadata !82, metadata !"s", metadata !6, i32 16777246, metadata !13, i32 0, metadata !365} ; [ DW_TAG_arg_variable ] [s] [line 30]
!367 = metadata !{i32 30, i32 0, metadata !82, metadata !365}
!368 = metadata !{i8* getelementptr inbounds ([54 x i8]* @.str20, i64 0, i64 0)}
!369 = metadata !{i32 786689, metadata !82, metadata !"error_msg", metadata !6, i32 33554462, metadata !47, i32 0, metadata !365} ; [ DW_TAG_arg_variable ] [error_msg] [line 30]
!370 = metadata !{i32 786688, metadata !82, metadata !"res", metadata !6, i32 31, metadata !85, i32 0, metadata !365} ; [ DW_TAG_auto_variable ] [res] [line 31]
!371 = metadata !{i32 31, i32 0, metadata !82, metadata !365}
!372 = metadata !{i32 34, i32 0, metadata !169, metadata !365}
!373 = metadata !{i32 36, i32 0, metadata !82, metadata !365}
!374 = metadata !{i32 39, i32 0, metadata !172, metadata !365}
!375 = metadata !{i32 37, i32 0, metadata !173, metadata !365}
!376 = metadata !{i32 40, i32 0, metadata !177, metadata !365}
!377 = metadata !{i32 786688, metadata !82, metadata !"c", metadata !6, i32 32, metadata !14, i32 0, metadata !365} ; [ DW_TAG_auto_variable ] [c] [line 32]
!378 = metadata !{i32 42, i32 0, metadata !180, metadata !365}
!379 = metadata !{i32 178, i32 0, metadata !56, null}
!380 = metadata !{i32 181, i32 0, metadata !381, null}
!381 = metadata !{i32 786443, metadata !5, metadata !57, i32 179, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!382 = metadata !{i32 786689, metadata !74, metadata !"argcMax", metadata !6, i32 67108940, metadata !10, i32 0, metadata !380} ; [ DW_TAG_arg_variable ] [argcMax] [line 76]
!383 = metadata !{i32 76, i32 0, metadata !74, metadata !380}
!384 = metadata !{i32 77, i32 0, metadata !187, metadata !380}
!385 = metadata !{i32 78, i32 0, metadata !189, metadata !380}
!386 = metadata !{i32 80, i32 0, metadata !191, metadata !380}
!387 = metadata !{i32 81, i32 0, metadata !191, metadata !380}
!388 = metadata !{i32 186, i32 0, metadata !4, null}
!389 = metadata !{i32 191, i32 0, metadata !4, null}
!390 = metadata !{i32 193, i32 0, metadata !4, null}
!391 = metadata !{i32 196, i32 0, metadata !4, null}
!392 = metadata !{i32 23, i32 0, metadata !91, null}
!393 = metadata !{i32 24, i32 0, metadata !91, null}
!394 = metadata !{i32 63, i32 0, metadata !61, null}
!395 = metadata !{i32 65, i32 0, metadata !61, null}
!396 = metadata !{i32 66, i32 0, metadata !61, null}
!397 = metadata !{i32 67, i32 0, metadata !61, null}
!398 = metadata !{i32 69, i32 0, metadata !399, null}
!399 = metadata !{i32 786443, metadata !5, metadata !61, i32 69, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/joker/klee-lf/runtime/POSIX/klee_init_env.c]
!400 = metadata !{i32 70, i32 0, metadata !399, null}
!401 = metadata !{i32 786689, metadata !69, metadata !"c", metadata !6, i32 16777264, metadata !48, i32 0, metadata !400} ; [ DW_TAG_arg_variable ] [c] [line 48]
!402 = metadata !{i32 48, i32 0, metadata !69, metadata !400}
!403 = metadata !{i32 50, i32 0, metadata !69, metadata !400}
!404 = metadata !{i32 72, i32 0, metadata !61, null}
!405 = metadata !{i32 73, i32 0, metadata !61, null}
