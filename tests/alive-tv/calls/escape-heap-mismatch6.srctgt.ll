declare i8* @malloc(i64)

define void @src(i8** %glb, i8** %glb2) {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  store i8* %p, i8** %glb
  store i8* %p, i8** %glb2
  ret void
}

define void @tgt(i8** %glb, i8** %glb2) {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  store i8* %p, i8** %glb
  store i8* %q, i8** %glb2
  ret void
}

; ERROR: Mismatch in memory
