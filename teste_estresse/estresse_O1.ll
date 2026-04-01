; ModuleID = '/mnt/c/Users/marco/OneDrive/Documents/GitHub/codigo-fonte-analises/teste_estresse/codigo_estresse.c'
source_filename = "/mnt/c/Users/marco/OneDrive/Documents/GitHub/codigo-fonte-analises/teste_estresse/codigo_estresse.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"Tempo: %.4f s | Check: %e\0A\00", align 1

; Function Attrs: nounwind uwtable vscale_range(1,16)
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = tail call noalias dereferenceable_or_null(32000000) ptr @malloc(i64 noundef 32000000) #5
  %2 = tail call noalias dereferenceable_or_null(32000000) ptr @malloc(i64 noundef 32000000) #5
  %3 = tail call noalias dereferenceable_or_null(32000000) ptr @malloc(i64 noundef 32000000) #5
  %4 = icmp ne ptr %1, null
  %5 = icmp ne ptr %2, null
  %6 = and i1 %4, %5
  %7 = icmp ne ptr %3, null
  %8 = and i1 %6, %7
  br i1 %8, label %11, label %53

9:                                                ; preds = %11
  %10 = tail call i64 @clock() #6
  br label %21

11:                                               ; preds = %0, %11
  %12 = phi i64 [ %19, %11 ], [ 0, %0 ]
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds double, ptr %1, i64 %12
  store double %15, ptr %16, align 8, !tbaa !6
  %17 = fadd double %14, 2.000000e+00
  %18 = getelementptr inbounds double, ptr %2, i64 %12
  store double %17, ptr %18, align 8, !tbaa !6
  %19 = add nuw nsw i64 %12, 1
  %20 = icmp eq i64 %19, 4000000
  br i1 %20, label %9, label %11, !llvm.loop !10

21:                                               ; preds = %9, %31
  %22 = phi i64 [ 0, %9 ], [ %32, %31 ]
  %23 = mul nuw nsw i64 %22, 2000
  br label %34

24:                                               ; preds = %31
  %25 = tail call i64 @clock() #6
  %26 = sub nsw i64 %25, %10
  %27 = sitofp i64 %26 to double
  %28 = fdiv double %27, 1.000000e+06
  %29 = load double, ptr %3, align 8, !tbaa !6
  %30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %28, double noundef %29)
  tail call void @free(ptr noundef %1) #6
  tail call void @free(ptr noundef %2) #6
  tail call void @free(ptr noundef %3) #6
  br label %53

31:                                               ; preds = %40
  %32 = add nuw nsw i64 %22, 1
  %33 = icmp eq i64 %32, 2000
  br i1 %33, label %24, label %21, !llvm.loop !13

34:                                               ; preds = %21, %40
  %35 = phi i64 [ 0, %21 ], [ %42, %40 ]
  %36 = add nuw nsw i64 %35, %23
  %37 = getelementptr inbounds double, ptr %1, i64 %36
  %38 = load double, ptr %37, align 8, !tbaa !6
  %39 = getelementptr double, ptr %2, i64 %35
  br label %44

40:                                               ; preds = %44
  %41 = getelementptr inbounds double, ptr %3, i64 %36
  store double %50, ptr %41, align 8, !tbaa !6
  %42 = add nuw nsw i64 %35, 1
  %43 = icmp eq i64 %42, 2000
  br i1 %43, label %31, label %34, !llvm.loop !14

44:                                               ; preds = %34, %44
  %45 = phi i64 [ 0, %34 ], [ %51, %44 ]
  %46 = phi double [ %38, %34 ], [ %50, %44 ]
  %47 = mul nuw nsw i64 %45, 2000
  %48 = getelementptr double, ptr %39, i64 %47
  %49 = load double, ptr %48, align 8, !tbaa !6
  %50 = fdiv double %46, %49
  %51 = add nuw nsw i64 %45, 1
  %52 = icmp eq i64 %51, 2000
  br i1 %52, label %40, label %44, !llvm.loop !15

53:                                               ; preds = %0, %24
  %54 = phi i32 [ 0, %24 ], [ 1, %0 ]
  ret i32 %54
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @clock() local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #4

attributes #0 = { nounwind uwtable vscale_range(1,16) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #3 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #4 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"double", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !11, !12}
!14 = distinct !{!14, !11, !12}
!15 = distinct !{!15, !11, !12}
