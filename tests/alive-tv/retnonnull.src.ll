define nonnull i8* @f(i8* %arg) {
  ret i8* null
}

define nonnull i8* @f2() {
  %p0 = getelementptr inbounds i8, i8* null, i64 1
  %p = getelementptr inbounds i8, i8* %p0, i64 -1
  ret i8* %p
}
