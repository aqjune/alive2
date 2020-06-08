declare void @free(i8*)

define i8* @src(i8* %p, i8* %q) {
  call void @free(i8* %p)
  call void @free(i8* %q)
  ret i8* %p
}

define i8* @tgt(i8* %p, i8* %q) {
  call void @free(i8* %p)
  call void @free(i8* %q)
  ret i8* %q
}

; ERROR: Value mismatch
