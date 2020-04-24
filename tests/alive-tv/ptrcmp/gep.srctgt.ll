define i1 @src(i8* %x, i8* %y) {
  %tmp.1 = getelementptr i8, i8* %x, i32 1
  %tmp.3 = getelementptr i8, i8* %y, i32 1
  %tmp.4 = icmp eq i8* %tmp.1, %tmp.3
  ret i1 %tmp.4
}

define i1 @tgt(i8* %x, i8* %y) {
  %tmp.4 = icmp eq i8* %x, %y
  ret i1 %tmp.4
}
