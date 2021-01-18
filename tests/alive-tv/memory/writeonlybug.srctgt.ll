define void @src(i8* %p) {
  %call = call i8* @g1(i8* %p)
  call void @g2(i8* %call)
  ret void
}

define void @tgt(i8* %p) {
  %call = call i8* @g1(i8* %p)
  call void @g2(i8* %call)
  ret void
}

declare i8* @g1(i8*)
declare void @g2(i8*) writeonly
