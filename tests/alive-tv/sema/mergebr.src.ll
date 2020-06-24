; TEST-ARGS: -sema-andor-freeze
define i32 @f(i1 %a, i1 %b) {
 br i1 %a, label %A, label %EXIT
A:
 br i1 %b, label %B, label %EXIT
B:
 ret i32 1
EXIT:
 ret i32 2
}

define i32 @f2(i1 %a, i1 %b) {
 br i1 %a, label %A, label %EXIT
A:
 br i1 %b, label %B, label %EXIT
B:
 ret i32 1
EXIT:
 ret i32 2
}
