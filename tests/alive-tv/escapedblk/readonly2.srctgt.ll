declare i8* @malloc(i64)

declare void @f(i8*) readonly
@glb = global i8* null

define void @src() {
  %p = call i8* @malloc(i64 1)
  %q = call i8* @malloc(i64 1)
  store i8 1, i8* %p
  store i8 1, i8* %q
  store i8* %p, i8** @glb
  call void @f(i8* %p)
  call void @f(i8* %q)
  ret void
}

define void @tgt() {
  %p = call i8* @malloc(i64 1)
  store i8 1, i8* %p
  store i8* %p, i8** @glb
  call void @f(i8* %p)
  call void @f(i8* %p)
  ret void
}

; ERROR: Mismatch in memory
