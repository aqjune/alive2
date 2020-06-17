declare i8* @malloc(i64)

@glb = global i8* null
@glb2 = global i8* null
declare void @f(i8*)

define void @src() {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  store i8* %p, i8** @glb
  store i8* %q, i8** @glb2
  ret void
}

define void @tgt() {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  store i8* %p, i8** @glb
  store i8* %p, i8** @glb2
  ret void
}

; ERROR: Mismatch in memory
