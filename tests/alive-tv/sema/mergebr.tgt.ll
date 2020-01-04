; TEST-ARGS: -sema-andor-freeze
define i32 @f(i1 %a, i1 %b) {
  %cond = and i1 %a, %b
  br i1 %cond, label %B, label %EXIT
B:
  ret i32 1
EXIT:
  ret i32 2
}

define i32 @f2(i1 %a, i1 %b) {
  %cond = and i1 %a, %b
  %v = select i1 %cond, i32 1, i32 2
  ret i32 %v
}
