declare i8* @malloc(i64)
declare void @free(i8*)

define void @src(i8*) {
  %poison = add nuw i64 -1, -1
  %call = call i8* @malloc(i64 %poison)
  call void @free(i8* null)
  ret void
}

define void @tgt(i8*) {
  ret void
}

