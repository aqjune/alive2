declare i8* @malloc(i64)

@glb = global i8* null
declare void @f(i8*)

define void @src() {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 8)
  store i8* %p, i8** @glb
  call void @f(i8* %p)
  ret void
}

define void @tgt() {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 8)
  store i8* %p, i8** @glb
  call void @f(i8* %q)
  ret void
}

; ERROR: Source is more defined than target
