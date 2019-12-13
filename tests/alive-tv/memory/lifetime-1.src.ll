define i32 @f() {
  %p = alloca i32
  store i32 10, i32* %p
  %v = load i32, i32* %p
  ret i32 %v
}

