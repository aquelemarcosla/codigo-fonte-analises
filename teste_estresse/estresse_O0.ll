; ModuleID = '/mnt/c/Users/marco/OneDrive/Documents/GitHub/codigo-fonte-analises/teste_estresse/codigo_estresse.c'
source_filename = "/mnt/c/Users/marco/OneDrive/Documents/GitHub/codigo-fonte-analises/teste_estresse/codigo_estresse.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"Tempo: %.4f s | Check: %e\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable vscale_range(1,16)
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %12 = call noalias ptr @malloc(i64 noundef 32000000) #4
  store ptr %12, ptr %2, align 8
  %13 = call noalias ptr @malloc(i64 noundef 32000000) #4
  store ptr %13, ptr %3, align 8
  %14 = call noalias ptr @malloc(i64 noundef 32000000) #4
  store ptr %14, ptr %4, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %23

17:                                               ; preds = %0
  %18 = load ptr, ptr %3, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %23

20:                                               ; preds = %17
  %21 = load ptr, ptr %4, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %24, label %23

23:                                               ; preds = %20, %17, %0
  store i32 1, ptr %1, align 4
  br label %111

24:                                               ; preds = %20
  store i32 0, ptr %5, align 4
  br label %25

25:                                               ; preds = %43, %24
  %26 = load i32, ptr %5, align 4
  %27 = icmp slt i32 %26, 4000000
  br i1 %27, label %28, label %46

28:                                               ; preds = %25
  %29 = load i32, ptr %5, align 4
  %30 = sitofp i32 %29 to double
  %31 = fadd double %30, 1.000000e+00
  %32 = load ptr, ptr %2, align 8
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, ptr %32, i64 %34
  store double %31, ptr %35, align 8
  %36 = load i32, ptr %5, align 4
  %37 = sitofp i32 %36 to double
  %38 = fadd double %37, 2.000000e+00
  %39 = load ptr, ptr %3, align 8
  %40 = load i32, ptr %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, ptr %39, i64 %41
  store double %38, ptr %42, align 8
  br label %43

43:                                               ; preds = %28
  %44 = load i32, ptr %5, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %5, align 4
  br label %25, !llvm.loop !6

46:                                               ; preds = %25
  %47 = call i64 @clock() #5
  store i64 %47, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %48

48:                                               ; preds = %94, %46
  %49 = load i32, ptr %7, align 4
  %50 = icmp slt i32 %49, 2000
  br i1 %50, label %51, label %97

51:                                               ; preds = %48
  store i32 0, ptr %8, align 4
  br label %52

52:                                               ; preds = %90, %51
  %53 = load i32, ptr %8, align 4
  %54 = icmp slt i32 %53, 2000
  br i1 %54, label %55, label %93

55:                                               ; preds = %52
  %56 = load ptr, ptr %2, align 8
  %57 = load i32, ptr %7, align 4
  %58 = mul nsw i32 %57, 2000
  %59 = load i32, ptr %8, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, ptr %56, i64 %61
  %63 = load double, ptr %62, align 8
  store double %63, ptr %9, align 8
  store i32 0, ptr %10, align 4
  br label %64

64:                                               ; preds = %78, %55
  %65 = load i32, ptr %10, align 4
  %66 = icmp slt i32 %65, 2000
  br i1 %66, label %67, label %81

67:                                               ; preds = %64
  %68 = load ptr, ptr %3, align 8
  %69 = load i32, ptr %10, align 4
  %70 = mul nsw i32 %69, 2000
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %70, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, ptr %68, i64 %73
  %75 = load double, ptr %74, align 8
  %76 = load double, ptr %9, align 8
  %77 = fdiv double %76, %75
  store double %77, ptr %9, align 8
  br label %78

78:                                               ; preds = %67
  %79 = load i32, ptr %10, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %10, align 4
  br label %64, !llvm.loop !8

81:                                               ; preds = %64
  %82 = load double, ptr %9, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = load i32, ptr %7, align 4
  %85 = mul nsw i32 %84, 2000
  %86 = load i32, ptr %8, align 4
  %87 = add nsw i32 %85, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, ptr %83, i64 %88
  store double %82, ptr %89, align 8
  br label %90

90:                                               ; preds = %81
  %91 = load i32, ptr %8, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %8, align 4
  br label %52, !llvm.loop !9

93:                                               ; preds = %52
  br label %94

94:                                               ; preds = %93
  %95 = load i32, ptr %7, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, ptr %7, align 4
  br label %48, !llvm.loop !10

97:                                               ; preds = %48
  %98 = call i64 @clock() #5
  store i64 %98, ptr %11, align 8
  %99 = load i64, ptr %11, align 8
  %100 = load i64, ptr %6, align 8
  %101 = sub nsw i64 %99, %100
  %102 = sitofp i64 %101 to double
  %103 = fdiv double %102, 1.000000e+06
  %104 = load ptr, ptr %4, align 8
  %105 = getelementptr inbounds double, ptr %104, i64 0
  %106 = load double, ptr %105, align 8
  %107 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %103, double noundef %106)
  %108 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %108) #5
  %109 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %109) #5
  %110 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %110) #5
  store i32 0, ptr %1, align 4
  br label %111

111:                                              ; preds = %97, %23
  %112 = load i32, ptr %1, align 4
  ret i32 %112
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare i64 @clock() #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare void @free(ptr noundef) #2

attributes #0 = { noinline nounwind optnone uwtable vscale_range(1,16) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #2 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+complxnum,+crc,+dotprod,+fp-armv8,+fullfp16,+jsconv,+lse,+neon,+outline-atomics,+pauth,+ras,+rcpc,+rdm,+sve,+sve2,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
