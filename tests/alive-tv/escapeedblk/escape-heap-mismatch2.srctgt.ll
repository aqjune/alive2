declare i8* @malloc(i64)

declare void @f(i8*)

define i8* @src() {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  call void @f(i8* %p)
  ret i8* %p
}

define i8* @tgt() {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  call void @f(i8* %q)
  ret i8* %p
}

; ERROR: Value mismatch
