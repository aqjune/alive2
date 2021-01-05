target triple = "x86_64-unknown-unknown"

define <16 x i8> @id(<16 x i8> %x) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %x, <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <16 x i8> %1
}

define <32 x i8> @id_avx2(<32 x i8> %x) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %x, <32 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <32 x i8> %1
}

define <64 x i8> @id_avx512(<64 x i8> %x) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %x, <64 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <64 x i8> %1
}

define <16 x i8> @zero(<16 x i8> %x) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %x, <16 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <16 x i8> %1
}

define <32 x i8> @zero_avx2(<32 x i8> %x) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %x, <32 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <32 x i8> %1
}

define <64 x i8> @zero_avx512(<64 x i8> %x) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %x, <64 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <64 x i8> %1
}

define <16 x i8> @splat(<16 x i8> %x) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %x, <16 x i8> zeroinitializer)
  ret <16 x i8> %1
}

define <32 x i8> @splat_avx2(<32 x i8> %x) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %x, <32 x i8> zeroinitializer)
  ret <32 x i8> %1
}

define <64 x i8> @splat_avx512(<64 x i8> %x) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %x, <64 x i8> zeroinitializer)
  ret <64 x i8> %1
}

define <16 x i8> @undef(<16 x i8> %x) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %x, <16 x i8> undef)
  ret <16 x i8> %1
}

define <16 x i8> @param(<16 x i8> %x, <16 x i8> %mask) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %x, <16 x i8> %mask)
  ret <16 x i8> %1
}

declare <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8>, <16 x i8>)
declare <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8>, <32 x i8>)
declare <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8>, <64 x i8>)
