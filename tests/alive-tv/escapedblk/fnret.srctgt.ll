declare i64* @f()
declare void @g()
@glb = global i64* null

define i64 @src() {
  %p = alloca i64
  store i64 1, i64* %p, align 8

  %r = call i64* @f()
  store i64* %r, i64** @glb
  call void @g()

  %v = load i64, i64* %p
  ret i64 %v
}

define i64 @tgt() {
  %p = alloca i64
  store i64 1, i64* %p, align 8

  %r = call i64* @f()
  store i64* %r, i64** @glb
  call void @g()

  ret i64 1
}
