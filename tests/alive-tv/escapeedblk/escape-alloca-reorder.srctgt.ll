declare void @use(...)

define void @src() {
  %a = alloca <16 x i8>
  %b = alloca {  }
  call void (...) @use( <16 x i8>* %a )
  call void (...) @use( {  }* %b )
  ret void
}

define void @tgt() {
  %b = alloca {  }
  %a = alloca <16 x i8>
  call void (...) @use( <16 x i8>* %a )
  call void (...) @use( {  }* %b )
  ret void
}
