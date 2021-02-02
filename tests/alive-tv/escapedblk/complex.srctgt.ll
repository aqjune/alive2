declare void @f(i8*)

define i8 @src(i8*** %x) {
  %p = alloca i8
  %q = alloca i8*
  store i8 1, i8* %p
  store i8* %p, i8** %q

  %x2 = getelementptr i8**, i8*** %x, i64 1
  %y = load i8**, i8*** %x2
  %y2 = getelementptr i8*, i8** %y, i64 1
  %z = load i8*, i8** %y2
  call void @f(i8* %z)

  %v = load i8, i8* %p
  ret i8 %v
}

define i8 @tgt(i8*** %x) {
  %x2 = getelementptr i8**, i8*** %x, i64 1
  %y = load i8**, i8*** %x2
  %y2 = getelementptr i8*, i8** %y, i64 1
  %z = load i8*, i8** %y2
  call void @f(i8* %z)

  ret i8 1
}
