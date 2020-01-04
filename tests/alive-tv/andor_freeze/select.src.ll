; TEST-ARGS: -sema-andor-freeze

define i1 @select(i1 %c, i1 %a) {
  %d = select i1 %c, i1 %a, i1 0
  ret i1 %d
}

define i1 @select2(i1 %c, i1 %a) {
  %d = select i1 %c, i1 1, i1 %a
  ret i1 %d
}
