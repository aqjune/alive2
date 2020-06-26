target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @src(i32 %x) {
  %p = alloca i32
  store i32 %x, i32* %p
  %call = call i32* @g() #5
  ret void
}

define void @tgt(i32 %x) {
  %p = alloca i32
  store i32 %x, i32* %p
  %call = call i32* @g() #5
  ret void
}

declare i32* @g()

attributes #5 = { readnone }

