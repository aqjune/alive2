define i1 @f(i8* %p, i8* %q) {
  %c = icmp eq i8* %p, %q
  ret i1 %c
}
