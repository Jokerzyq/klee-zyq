; ModuleID = 'memcpy.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #0 {
entry:
  tail call void @llvm.dbg.value(metadata !{i8* %destaddr}, i64 0, metadata !15), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %srcaddr}, i64 0, metadata !16), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i64 %len}, i64 0, metadata !17), !dbg !27
  tail call void @llvm.dbg.value(metadata !{i8* %destaddr}, i64 0, metadata !18), !dbg !28
  tail call void @llvm.dbg.value(metadata !{i8* %srcaddr}, i64 0, metadata !21), !dbg !29
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !17), !dbg !30
  %cmp3 = icmp eq i64 %len, 0, !dbg !30
  br i1 %cmp3, label %while.end, label %while.body.preheader, !dbg !30

while.body.preheader:                             ; preds = %entry
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %0 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %while.body.preheader
  %scevgep7 = getelementptr i8* %srcaddr, i64 %0
  %scevgep = getelementptr i8* %destaddr, i64 %0
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep7, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end9 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep106 = getelementptr i8* %destaddr, i64 %index
  %1 = bitcast i8* %next.gep to <16 x i8>*, !dbg !31
  %wide.load = load <16 x i8>* %1, align 1, !dbg !31
  %next.gep.sum282 = or i64 %index, 16, !dbg !31
  %2 = getelementptr i8* %srcaddr, i64 %next.gep.sum282, !dbg !31
  %3 = bitcast i8* %2 to <16 x i8>*, !dbg !31
  %wide.load203 = load <16 x i8>* %3, align 1, !dbg !31
  %4 = bitcast i8* %next.gep106 to <16 x i8>*, !dbg !31
  store <16 x i8> %wide.load, <16 x i8>* %4, align 1, !dbg !31
  %next.gep106.sum299 = or i64 %index, 16, !dbg !31
  %5 = getelementptr i8* %destaddr, i64 %next.gep106.sum299, !dbg !31
  %6 = bitcast i8* %5 to <16 x i8>*, !dbg !31
  store <16 x i8> %wide.load203, <16 x i8>* %6, align 1, !dbg !31
  %index.next = add i64 %index, 32
  %7 = icmp eq i64 %index.next, %n.vec
  br i1 %7, label %middle.block, label %vector.body, !llvm.loop !32

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %while.body.preheader
  %resume.val = phi i8* [ %srcaddr, %while.body.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val8 = phi i8* [ %destaddr, %while.body.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end9, %vector.body ]
  %resume.val10 = phi i64 [ %len, %while.body.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %while.body.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %while.end, label %while.body

while.body:                                       ; preds = %middle.block, %while.body
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %middle.block ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %resume.val8, %middle.block ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %resume.val10, %middle.block ]
  %dec = add i64 %len.addr.04, -1, !dbg !30
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr}, i64 0, metadata !21), !dbg !31
  %8 = load i8* %src.06, align 1, !dbg !31, !tbaa !35
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !31
  tail call void @llvm.dbg.value(metadata !{i8* %incdec.ptr1}, i64 0, metadata !18), !dbg !31
  store i8 %8, i8* %dest.05, align 1, !dbg !31, !tbaa !35
  tail call void @llvm.dbg.value(metadata !{i64 %dec}, i64 0, metadata !17), !dbg !30
  %cmp = icmp eq i64 %dec, 0, !dbg !30
  br i1 %cmp, label %while.end, label %while.body, !dbg !30, !llvm.loop !38

while.end:                                        ; preds = %while.body, %middle.block, %entry
  ret i8* %destaddr, !dbg !39
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!26}

!0 = metadata !{i32 786449, metadata !1, i32 1, metadata !"clang version 3.4 (tags/RELEASE_34/final)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/joker/klee-lf/runtime/Intrinsic//home/joker/klee-lf/runtime/Intrinsic/memcpy.c] [DW_LANG_C89]
!1 = metadata !{metadata !"/home/joker/klee-lf/runtime/Intrinsic/memcpy.c", metadata !"/home/joker/klee-lf/runtime/Intrinsic"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{i32 786478, metadata !5, metadata !6, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !14, i32 12} ; [ DW_TAG_subprogram ] [line 12] [def] [memcpy]
!5 = metadata !{metadata !"memcpy.c", metadata !"/home/joker/klee-lf/runtime/Intrinsic"}
!6 = metadata !{i32 786473, metadata !5}          ; [ DW_TAG_file_type ] [/home/joker/klee-lf/runtime/Intrinsic/memcpy.c]
!7 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{metadata !9, metadata !9, metadata !10, metadata !12}
!9 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!11 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{i32 786454, metadata !5, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !13} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!13 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!14 = metadata !{metadata !15, metadata !16, metadata !17, metadata !18, metadata !21}
!15 = metadata !{i32 786689, metadata !4, metadata !"destaddr", metadata !6, i32 16777228, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!16 = metadata !{i32 786689, metadata !4, metadata !"srcaddr", metadata !6, i32 33554444, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!17 = metadata !{i32 786689, metadata !4, metadata !"len", metadata !6, i32 50331660, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!18 = metadata !{i32 786688, metadata !4, metadata !"dest", metadata !6, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!19 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!20 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!21 = metadata !{i32 786688, metadata !4, metadata !"src", metadata !6, i32 14, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!22 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!24 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!25 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!26 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!27 = metadata !{i32 12, i32 0, metadata !4, null}
!28 = metadata !{i32 13, i32 0, metadata !4, null}
!29 = metadata !{i32 14, i32 0, metadata !4, null}
!30 = metadata !{i32 16, i32 0, metadata !4, null}
!31 = metadata !{i32 17, i32 0, metadata !4, null}
!32 = metadata !{metadata !32, metadata !33, metadata !34}
!33 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!34 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!35 = metadata !{metadata !36, metadata !36, i64 0}
!36 = metadata !{metadata !"omnipotent char", metadata !37, i64 0}
!37 = metadata !{metadata !"Simple C/C++ TBAA"}
!38 = metadata !{metadata !38, metadata !33, metadata !34}
!39 = metadata !{i32 18, i32 0, metadata !4, null}
