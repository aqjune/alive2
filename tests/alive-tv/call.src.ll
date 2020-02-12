define i8 @f1() {
  %a = alloca i8
  %b = call i8 @g(i8* %a)
  ret i8 %b
}

define i8 @f2(i8* %a) {
  %b = call i8 @g(i8* %a)
  ret i8 %b
}

define i8 @f3(i8* %a) {
  store i8 undef, i8* %a
  %b = call i8 @g(i8* %a)
  ret i8 %b
}

define i8 @f4(i8* %a) {
  store i8 3, i8* %a
  %b = call i8 @h(i8* %a)
  ret i8 %b
}

define i8 @f5() {
  %p0 = alloca i8
  %p = alloca i8
  %b = call i8 @g(i8* %p)
  ret i8 %b
}

define i8 @f6(i8* byval %p) {
  %a = alloca i8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %a, i8* %p, i64 1, i1 false)
  %b = call i8 @g(i8* %a)
  ret i8 %b
}

define i8 @f6_2(i8* %p) {
  %a = alloca i8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %a, i8* %p, i64 1, i1 false)
  %b = call i8 @g2(i8* byval %a)
  ret i8 %b
}

define void @f7() {
  %ptr = call i8* @k()
  %a = load i8, i8* %ptr, align 4
  ret void
}

define void @f8() {
  %p = alloca i8, align 1
  %call = call i8* @k()
  %x = load i8, i8* %call, align 1
  ret void
}

define i1 @f9() {
  %p = call i8* @kn()
  %cmp = icmp eq i8* %p, null
  ret i1 %cmp
}

declare i8 @g(i8*)
declare i8 @g2(i8* byval)
declare i8 @h(i8*) readnone
declare i8* @k()
declare nonnull i8* @kn()

declare void @llvm.memcpy.p0i8.p0i8.i64(i8*, i8*, i64, i1)
