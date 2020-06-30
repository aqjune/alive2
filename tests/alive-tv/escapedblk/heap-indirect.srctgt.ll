declare i8* @malloc(i64)

define i8* @src() {
  %p = call i8* @malloc(i64 1)
  store i8 1, i8* %p
  %q = call i8* @malloc(i64 8)
  %q8 = bitcast i8* %q to i8**
  store i8* %p, i8** %q8
  ret i8* %q
}

define i8* @tgt() {
  %p = call i8* @malloc(i64 1)
  store i8 2, i8* %p
  %q = call i8* @malloc(i64 8)
  %q8 = bitcast i8* %q to i8**
  store i8* %p, i8** %q8
  ret i8* %q
}

; ERROR: Mismatch in memory
