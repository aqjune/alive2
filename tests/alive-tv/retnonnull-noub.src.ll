define nonnull i8* @f(i8* %arg) {
  ret i8* null
}
; ERROR: Source is more defined than target
