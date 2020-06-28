; Readonly function cannot distinguish these two
; This is implemented by not updating local block mapping if it is readonly
declare i8* @malloc(i64)

declare void @f(i8*) readonly

define void @src() {
  %p = call i8* @malloc(i64 1)
  %q = call i8* @malloc(i64 1)
  store i8 1, i8* %p
  store i8 1, i8* %q
  call void @f(i8* %p)
  call void @f(i8* %q)
  ret void
}

define void @tgt() {
  %p = call i8* @malloc(i64 1)
  store i8 1, i8* %p
  call void @f(i8* %p)
  call void @f(i8* %p)
  ret void
}
