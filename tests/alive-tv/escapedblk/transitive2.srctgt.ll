declare void @f(i8**)

define i8 @src() {
  %p = alloca i8
  %q = alloca i8*
  store i8 1, i8* %p
  store i8* %p, i8** %q
  call void @f(i8** %q)
  %v = load i8, i8* %p
  ret i8 %v
}

define i8 @tgt() {
  %p = alloca i8
  %q = alloca i8*
  store i8 1, i8* %p
  store i8* %p, i8** %q
  call void @f(i8** %q)
  ret i8 1
}

; ERROR: Value mismatch
