; ModuleID = '/mnt/c/Users/marco/OneDrive/Documents/GitHub/codigo-fonte-analises/teste_estresse/codigo_estresse.c'
source_filename = "/mnt/c/Users/marco/OneDrive/Documents/GitHub/codigo-fonte-analises/teste_estresse/codigo_estresse.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"Tempo: %.4f s | Check: %e\0A\00", align 1

; Function Attrs: nounwind uwtable vscale_range(1,16)
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = tail call noalias dereferenceable_or_null(32000000) ptr @malloc(i64 noundef 32000000) #6
  %2 = tail call noalias dereferenceable_or_null(32000000) ptr @malloc(i64 noundef 32000000) #6
  %3 = tail call noalias dereferenceable_or_null(32000000) ptr @malloc(i64 noundef 32000000) #6
  %4 = icmp ne ptr %1, null
  %5 = icmp ne ptr %2, null
  %6 = and i1 %4, %5
  %7 = icmp ne ptr %3, null
  %8 = and i1 %6, %7
  br i1 %8, label %9, label %87

9:                                                ; preds = %0
  %10 = tail call i64 @llvm.vscale.i64()
  %11 = mul nuw nsw i64 %10, 4194300
  %12 = and i64 %11, 4000000
  %13 = tail call i64 @llvm.vscale.i64()
  %14 = shl nuw nsw i64 %13, 2
  %15 = tail call <vscale x 2 x i32> @llvm.experimental.stepvector.nxv2i32()
  %16 = tail call i32 @llvm.vscale.i32()
  %17 = shl nuw nsw i32 %16, 1
  %18 = insertelement <vscale x 2 x i32> poison, i32 %17, i64 0
  %19 = shufflevector <vscale x 2 x i32> %18, <vscale x 2 x i32> poison, <vscale x 2 x i32> zeroinitializer
  %20 = tail call i64 @llvm.vscale.i64()
  %21 = shl nuw nsw i64 %20, 1
  %22 = tail call i64 @llvm.vscale.i64()
  %23 = shl nuw nsw i64 %22, 1
  br label %24

24:                                               ; preds = %24, %9
  %25 = phi i64 [ 0, %9 ], [ %38, %24 ]
  %26 = phi <vscale x 2 x i32> [ %15, %9 ], [ %39, %24 ]
  %27 = add <vscale x 2 x i32> %26, %19
  %28 = sitofp <vscale x 2 x i32> %26 to <vscale x 2 x double>
  %29 = sitofp <vscale x 2 x i32> %27 to <vscale x 2 x double>
  %30 = fadd <vscale x 2 x double> %28, shufflevector (<vscale x 2 x double> insertelement (<vscale x 2 x double> poison, double 1.000000e+00, i64 0), <vscale x 2 x double> poison, <vscale x 2 x i32> zeroinitializer)
  %31 = fadd <vscale x 2 x double> %29, shufflevector (<vscale x 2 x double> insertelement (<vscale x 2 x double> poison, double 1.000000e+00, i64 0), <vscale x 2 x double> poison, <vscale x 2 x i32> zeroinitializer)
  %32 = getelementptr inbounds double, ptr %1, i64 %25
  %33 = getelementptr inbounds double, ptr %32, i64 %21
  store <vscale x 2 x double> %30, ptr %32, align 8, !tbaa !6
  store <vscale x 2 x double> %31, ptr %33, align 8, !tbaa !6
  %34 = fadd <vscale x 2 x double> %28, shufflevector (<vscale x 2 x double> insertelement (<vscale x 2 x double> poison, double 2.000000e+00, i64 0), <vscale x 2 x double> poison, <vscale x 2 x i32> zeroinitializer)
  %35 = fadd <vscale x 2 x double> %29, shufflevector (<vscale x 2 x double> insertelement (<vscale x 2 x double> poison, double 2.000000e+00, i64 0), <vscale x 2 x double> poison, <vscale x 2 x i32> zeroinitializer)
  %36 = getelementptr inbounds double, ptr %2, i64 %25
  %37 = getelementptr inbounds double, ptr %36, i64 %23
  store <vscale x 2 x double> %34, ptr %36, align 8, !tbaa !6
  store <vscale x 2 x double> %35, ptr %37, align 8, !tbaa !6
  %38 = add nuw i64 %25, %14
  %39 = add <vscale x 2 x i32> %27, %19
  %40 = icmp eq i64 %38, %12
  br i1 %40, label %41, label %24, !llvm.loop !10

41:                                               ; preds = %24
  %42 = icmp eq i64 %12, 4000000
  br i1 %42, label %43, label %45

43:                                               ; preds = %45, %41
  %44 = tail call i64 @clock() #7
  br label %55

45:                                               ; preds = %41, %45
  %46 = phi i64 [ %53, %45 ], [ %12, %41 ]
  %47 = trunc i64 %46 to i32
  %48 = sitofp i32 %47 to double
  %49 = fadd double %48, 1.000000e+00
  %50 = getelementptr inbounds double, ptr %1, i64 %46
  store double %49, ptr %50, align 8, !tbaa !6
  %51 = fadd double %48, 2.000000e+00
  %52 = getelementptr inbounds double, ptr %2, i64 %46
  store double %51, ptr %52, align 8, !tbaa !6
  %53 = add nuw nsw i64 %46, 1
  %54 = icmp eq i64 %53, 4000000
  br i1 %54, label %43, label %45, !llvm.loop !14

55:                                               ; preds = %43, %65
  %56 = phi i64 [ 0, %43 ], [ %66, %65 ]
  %57 = mul nuw nsw i64 %56, 2000
  br label %68

58:                                               ; preds = %65
  %59 = tail call i64 @clock() #7
  %60 = sub nsw i64 %59, %44
  %61 = sitofp i64 %60 to double
  %62 = fdiv double %61, 1.000000e+06
  %63 = load double, ptr %3, align 8, !tbaa !6
  %64 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %62, double noundef %63)
  tail call void @free(ptr noundef %1) #7
  tail call void @free(ptr noundef nonnull %2) #7
  tail call void @free(ptr noundef nonnull %3) #7
  br label %87

65:                                               ; preds = %74
  %66 = add nuw nsw i64 %56, 1
  %67 = icmp eq i64 %66, 2000
  br i1 %67, label %58, label %55, !llvm.loop !15

68:                                               ; preds = %55, %74
  %69 = phi i64 [ 0, %55 ], [ %76, %74 ]
  %70 = add nuw nsw i64 %69, %57
  %71 = getelementptr inbounds double, ptr %1, i64 %70
  %72 = load double, ptr %71, align 8, !tbaa !6
  %73 = getelementptr double, ptr %2, i64 %69
  br label %78

74:                                               ; preds = %78
  %75 = getelementptr inbounds double, ptr %3, i64 %70
  store double %84, ptr %75, align 8, !tbaa !6
  %76 = add nuw nsw i64 %69, 1
  %77 = icmp eq i64 %76, 2000
  br i1 %77, label %65, label %68, !llvm.loop !16

78:                                               ; preds = %68, %78
  %79 = phi i64 [ 0, %68 ], [ %85, %78 ]
  %80 = phi double [ %72, %68 ], [ %84, %78 ]
  %81 = mul nuw nsw i64 %79, 2000
  %82 = getelementptr double, ptr %73, i64 %81
  %83 = load double, ptr %82, align 8, !tbaa !6
  %84 = fdiv double %80, %83
  %85 = add nuw nsw i64 %79, 1
  %86 = icmp eq i64 %85, 2000
  br i1 %86, label %74, label %78, !llvm.loop !17

87:                                               ; preds = %0, %58
  %88 = phi i32 [ 0, %58 ], [ 1, %0 ]
  ret i32 %88
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @clock() local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 2 x i32> @llvm.experimental.stepvector.nxv2i32() #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.vscale.i32() #5

attributes #0 = { nounwind uwtable vscale_range(1,16) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #1 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #3 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #4 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }

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
!10 = distinct !{!10, !11, !12, !13}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
!14 = distinct !{!14, !11, !13, !12}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11}
