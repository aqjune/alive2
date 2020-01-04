; TEST-ARGS: -sema-ptrcmp-phy
define i1 @f(i8* %p, i8* %q) {
  %i = ptrtoint i8* %p to i64
  %j = ptrtoint i8* %q to i64
  %c = icmp eq i64 %i, %j
  ret i1 %c
}
