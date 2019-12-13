declare void @llvm.lifetime.start.p0i8(i64, i8*)
declare void @llvm.lifetime.end.p0i8(i64, i8*)

define void @f(i8* %p) {
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %p)
  store i8 0, i8* %p
  ret void
}
