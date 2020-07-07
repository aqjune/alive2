declare void @f()
declare void @g()
@glb = global i64* null
@glb2 = global i64* null

define i64 @src() {
  %p = alloca i64
  store i64 1, i64* %p, align 8

  call void @f()
  %r = load i64*, i64** @glb
  store i64* %r, i64** @glb2
  call void @g()

  %v = load i64, i64* %p
  ret i64 %v
}

define i64 @tgt() {
  %p = alloca i64
  store i64 1, i64* %p, align 8

  call void @f()
  %r = load i64*, i64** @glb
  store i64* %r, i64** @glb2
  call void @g()

  ret i64 1
}
