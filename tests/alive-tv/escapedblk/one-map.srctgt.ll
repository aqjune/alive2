declare i8* @malloc(i64)
@glb = global i8* null

define void @src(i1 %c0) {
  %p = call i8* @malloc(i64 1)
  store i8* %p, i8** @glb
  ret void
}

define void @tgt(i1 %c0) {
  %p = call i8* @malloc(i64 1)
  %q = call i8* @malloc(i64 1)
  %c = freeze i1 %c0
  %r = select i1 %c, i8* %p, i8* %q
  store i8* %r, i8** @glb
  ret void
}
