declare i8* @g(i8*)
declare void @h()

define void @src(i8* %p) {
entry:
  %call = call i8* @g(i8* %p)
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %if.then, label %if.end
if.then:
  call void @h()
  br label %if.end
if.end:
  ret void
}

define void @tgt(i8* %p) { ; equivalent fn
entry:
  %call = call i8* @g(i8* %p)
  %tobool = icmp eq i8* %call, null
  br i1 %tobool, label %if.then, label %if.end
if.then:
  call void @h()
  br label %if.end
if.end:
  ret void
}
