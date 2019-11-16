; target: 64 bits ptr addr
; TEST-ARGS: -smt-to=12000 -disable-undef-input
; To resolve timeout error, it is assumed that input %pptr is never an undef pointer
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"

define i8 @freshbid_malloc(i8** %pptr) {
  %ptr = call noalias i8* @malloc(i64 1)
  %i = ptrtoint i8* %ptr to i64
  %cmp = icmp eq i64 %i, 0
  br i1 %cmp, label %BB1, label %BB2
BB1:
  ret i8 0
BB2:
  ; Interestingly, dereferencing %pptr at here rather than at entry basic block resolves
  ; Timeout error.
  %ptr0 = load i8*, i8** %pptr
  store i8 10, i8* %ptr
  store i8 20, i8* %ptr0
  %v = load i8, i8* %ptr
  ret i8 %v
}

declare noalias i8* @malloc(i64)
declare void @free(i8*)
