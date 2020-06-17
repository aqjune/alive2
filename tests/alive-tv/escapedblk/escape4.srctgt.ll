; from test/Transforms/InstCombine/alloca.ll
declare void @f(i32*)

define void @src() {
  %p = alloca i32
  call void @f(i32* %p)
  call void @f(i32* %p)
  ret void
}

define void @tgt() {
  %q = alloca i32
  call void @f(i32* %q)
  call void @f(i32* %q)
  ret void
}
