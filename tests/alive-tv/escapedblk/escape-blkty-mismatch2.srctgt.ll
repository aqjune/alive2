declare i8* @malloc(i64)

declare void @f(i8*)

define void @src() {
  %p = alloca i32
  %p8 = bitcast i32* %p to i8*
  call void @f(i8* %p8)
  ret void
}

define void @tgt() {
  %p = call i8* @malloc(i64 4)
  call void @f(i8* %p)
  ret void
}

; ERROR: Source is more defined than target
