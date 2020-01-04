; TEST-ARGS: -sema-andor-freeze

define i1 @select(i1 %c, i1 %a) {
  %d = and i1 %c, %a
  ret i1 %d
}

define i1 @select2(i1 %c, i1 %a) {
  %d = or i1 %c, %a
  ret i1 %d
}
