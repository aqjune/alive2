declare void @g(i8* nonnull)

define void @f(i8* %arg) {
  %p = getelementptr inbounds i8, i8* null, i64 1
  call void @g(i8* %p)
  ret void
}

define void @f2() {
  %p0 = getelementptr inbounds i8, i8* null, i64 1
  %p = getelementptr inbounds i8, i8* %p0, i64 -1
  call void @g(i8* %p)
  ret void
}
