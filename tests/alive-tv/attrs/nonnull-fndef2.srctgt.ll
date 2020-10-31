define nonnull i8* @src(i8* %p) {
  ret i8* null
}

define nonnull i8* @tgt(i8* %p) {
  unreachable
}

; ERROR: Source is more defined than target
