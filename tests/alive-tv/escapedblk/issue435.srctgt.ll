; ModuleID = './example.cpp'
source_filename = "./example.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: uwtable
define dso_local void @src(i32 %i) local_unnamed_addr #0 {
entry:
  %storage = alloca [16 x i8], align 16
  %0 = getelementptr inbounds [16 x i8], [16 x i8]* %storage, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #4
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %0, i8 0, i64 16, i1 false)
  %idxprom = sext i32 %i to i64
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %storage, i64 0, i64 %idxprom
  call void @_Z3useRc(i8* nonnull align 1 dereferenceable(1) %arrayidx)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #4
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @_Z3useRc(i8* nonnull align 1 dereferenceable(1)) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: uwtable
define dso_local void @tgt(i32 %i) local_unnamed_addr #0 {
entry:
  %storage = alloca [16 x i8], align 16
  %0 = getelementptr inbounds [16 x i8], [16 x i8]* %storage, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #4
  %idxprom = sext i32 %i to i64
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %storage, i64 0, i64 %idxprom
  call void @_Z3useRc(i8* nonnull align 1 dereferenceable(1) %arrayidx)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #4
  ret void
}

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { argmemonly nounwind willreturn writeonly }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git e477a5f6c88de0ef7745694ec5f00bd69da23177)"}

; ERROR: Source is more defined than target
