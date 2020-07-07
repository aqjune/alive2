@glb = global i8** null
declare void @f()

define i8 @src() {
  %p = alloca i8
  %q = alloca i8*
  %q2 = alloca i8*
  store i8 1, i8* %p
  store i8* %p, i8** %q
  store i8* %p, i8** %q2
  store i8** %q2, i8*** @glb
  call void @f()
  %v = load i8, i8* %p
  ret i8 %v
}

define i8 @tgt() {
  %p = alloca i8
  %q = alloca i8*
  %q2 = alloca i8*
  store i8 1, i8* %p
  store i8* %p, i8** %q
  store i8* %p, i8** %q2
  store i8** %q2, i8*** @glb
  call void @f()
  ret i8 1
}

; ERROR: Value mismatch
