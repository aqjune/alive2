define void @src(i32 %a, i32 %b, {i32, i1}* %p) {
  %mul = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %a, i32 %b)
  store {i32, i1} %mul, {i32, i1}* %p
  ret void
}

define void @tgt(i32 %a, i32 %b, {i32, i1}* %p) {
  %mul = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %a, i32 %b)
  store {i32, i1} %mul, {i32, i1}* %p
  ret void
}

declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) nounwind readnone speculatable willreturn
