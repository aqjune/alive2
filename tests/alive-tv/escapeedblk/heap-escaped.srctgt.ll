@glb = global i8* null

declare i8* @malloc(i64)

define void @src(i64 %x) {
  %p = call i8* @malloc(i64 1)
  store i8 1, i8* %p
  store i8* %p, i8** @glb
  ret void
}

define void @tgt(i64 %x) {
  %p = call i8* @malloc(i64 1)
  store i8 2, i8* %p
  store i8* %p, i8** @glb
  ret void
}

; ERROR: Mismatch in memory
