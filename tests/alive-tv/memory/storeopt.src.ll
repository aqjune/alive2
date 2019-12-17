define void @f(i8* %p, i1 %cond) {
  %v = load i8, i8* %p
  br i1 %cond, label %A, label %B
A:
  store i8 %v, i8* %p
  ret void
B:
  ret void
}
