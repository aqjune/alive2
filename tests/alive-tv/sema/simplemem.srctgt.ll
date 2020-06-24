; TEST-ARGS: -inputmem-simple

define void @src(i8** %p) {
  %q = load i8*, i8** %p
  %c = icmp eq i8* %q, null
  br i1 %c, label %A, label %B
A:
  ret void
B:
  ret void
}

define void @tgt(i8** %p) {
  %q = load i8*, i8** %p
  %c = icmp eq i8* %q, null
  br i1 %c, label %A, label %B
A:
  unreachable
B:
  unreachable
}
