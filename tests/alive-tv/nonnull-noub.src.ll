declare void @g(i8* nonnull)

define void @f() {
  call void @g(i8* null)
  ret void
}
; ERROR: Source is more defined than target
