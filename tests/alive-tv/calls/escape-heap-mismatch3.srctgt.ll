declare i8* @malloc(i64)

@glb = global i8* null
@glb2 = global i8* null
declare void @f(i8*)

define void @src() {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  %c1 = icmp eq i8* %p, null
  %c2 = icmp eq i8* %q, null
  %c = and i1 %c1, %c2
  br i1 %c, label %A, label %B
A:
  store i8* %p, i8** @glb
  store i8* %q, i8** @glb2
  ret void
B:
  ret void
}

define void @tgt() {
  %p = call i8* @malloc(i64 4)
  %q = call i8* @malloc(i64 4)
  %c1 = icmp eq i8* %p, null
  %c2 = icmp eq i8* %q, null
  %c = and i1 %c1, %c2
  br i1 %c, label %A, label %B
A:
  store i8* %p, i8** @glb
  store i8* %p, i8** @glb2
  ret void
B:
  ret void
}

; ERROR: Value mismatch
