declare void @g(i8* nonnull)

define void @f(i8* %arg) {
  %p = getelementptr inbounds i8, i8* %arg, i64 1
  call void @g(i8* %p)
  ret void
}

define void @f2() {
  call void @g(i8* null)
  ret void
}
