; TEST-ARGS: -sema-andor-freeze
define i1 @src(i1 %a) {
 %c = and i1 %a, 1
 ret i1 %c
}

define i1 @tgt(i1 %a) {
 ret i1 %a
}

; ERROR: Target is more poisonous than source
