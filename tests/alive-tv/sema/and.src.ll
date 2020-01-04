; TEST-ARGS: -sema-andor-freeze
define i1 @f(i1 %a) {
  %c = and i1 %a, 1
  ret i1 %c
}

; ERROR: Target is more poisonous than source
