define float @src(i8* %v, i8** %p) {
	store i8* %v, i8** %p, align 4
	%p2 = bitcast i8** %p to float*
  %a = load float, float* %p2, align 4
  ret float %a
}

define float @tgt(i8* %v, i8** %p) {
  store i8* %v, i8** %p, align 4
  %x = ptrtoint i8* %v to i32
  %y = bitcast i32 %x to float
  ret float %y
}

