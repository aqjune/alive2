declare i8* @realloc(i8*, i64)

define void @src(i8* %p) {
  %poison = add nuw i64 -1, -1
  %call = call i8* @realloc(i8* %p, i64 %poison)
  ret void
}

define void @tgt(i8* %p) {
  %call = call i8* @realloc(i8* %p, i64 5)
  ret void
}

