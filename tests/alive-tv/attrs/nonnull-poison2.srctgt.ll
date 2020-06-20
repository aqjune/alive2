declare void @g(i8* nonnull)

define void @src() {
  %p = getelementptr inbounds i8, i8* null, i64 1
  call void @g(i8* %p)
  ret void
}

define void @tgt() {
  call void @g(i8* null)
  ret void
}
