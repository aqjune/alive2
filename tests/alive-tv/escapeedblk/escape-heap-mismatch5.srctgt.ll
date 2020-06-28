declare i8* @malloc(i64)
declare void @f()

define i8* @src(i8** %glb, i8** %glb2) {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  store i8* %p, i8** %glb
  call void @f()
  store i8* %q, i8** %glb2
  call void @f()
  ret i8* %p
}

define i8* @tgt(i8** %glb, i8** %glb2) {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  store i8* %p, i8** %glb
  call void @f()
  store i8* %q, i8** %glb2
  call void @f()
  ret i8* %q
}

; ERROR: Value mismatch
