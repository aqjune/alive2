declare void @f(i8*)
declare void @g()

define i8 @src(i1 %c) {
  %p = alloca i8
  %q = alloca i8
  store i8 1, i8* %p
  store i8 2, i8* %q
  br i1 %c, label %A, label %B
A:
  call void @f(i8* %p)
  br label %C
B:
  call void @f(i8* %q)
  br label %C
C:
  call void @g() ; Alive2 conservatively assumes that both %p and %q can be touched
  br i1 %c, label %A2, label %B2
A2:
  %v = load i8, i8* %q
  ret i8 %v
B2:
  %w = load i8, i8* %p
  ret i8 %w
}

define i8 @tgt(i1 %c) {
  %p = alloca i8
  %q = alloca i8
  store i8 1, i8* %p
  store i8 2, i8* %q
  br i1 %c, label %A, label %B
A:
  call void @f(i8* %p)
  br label %C
B:
  call void @f(i8* %q)
  br label %C
C:
  call void @g()
  br i1 %c, label %A2, label %B2
A2:
  ret i8 2
B2:
  ret i8 1
}

; ERROR: Value mismatch
