; ModuleID = 'x86-pshufb.ll'
target triple = "x86_64-unknown-unknown"

; These are copied from Transforms/InstCombine/X86/x86-pshufb.ll.

define <16 x i8> @identity_test(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <16 x i8> %1
}

define <32 x i8> @identity_test_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <32 x i8> %1
}

define <64 x i8> @identity_test_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <64 x i8> %1
}

define <16 x i8> @fold_to_zero_vector(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <16 x i8> %1
}

define <32 x i8> @fold_to_zero_vector_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <32 x i8> %1
}

define <64 x i8> @fold_to_zero_vector_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <64 x i8> %1
}

define <16 x i8> @splat_test(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> zeroinitializer)
  ret <16 x i8> %1
}

; In the test case below, elements in the low 128-bit lane of the result
; vector are equal to the lower byte of %InVec (shuffle index 0).
; Elements in the high 128-bit lane of the result vector are equal to
; the lower byte in the high 128-bit lane of %InVec (shuffle index 16).

define <32 x i8> @splat_test_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> zeroinitializer)
  ret <32 x i8> %1
}

define <64 x i8> @splat_test_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> zeroinitializer)
  ret <64 x i8> %1
}

; Each of the byte shuffles in the following tests is equivalent to a blend between
; vector %InVec and a vector of all zeroes.

define <16 x i8> @blend1(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 -128, i8 1, i8 -128, i8 3, i8 -128, i8 5, i8 -128, i8 7, i8 -128, i8 9, i8 -128, i8 11, i8 -128, i8 13, i8 -128, i8 15>)
  ret <16 x i8> %1
}

define <16 x i8> @blend2(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 -128, i8 -128, i8 2, i8 3, i8 -128, i8 -128, i8 6, i8 7, i8 -128, i8 -128, i8 10, i8 11, i8 -128, i8 -128, i8 14, i8 15>)
  ret <16 x i8> %1
}

define <16 x i8> @blend3(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 12, i8 13, i8 14, i8 15>)
  ret <16 x i8> %1
}

define <16 x i8> @blend4(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <16 x i8> %1
}

define <16 x i8> @blend5(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <16 x i8> %1
}

define <16 x i8> @blend6(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 0, i8 1, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <16 x i8> %1
}

define <32 x i8> @blend1_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 -128, i8 1, i8 -128, i8 3, i8 -128, i8 5, i8 -128, i8 7, i8 -128, i8 9, i8 -128, i8 11, i8 -128, i8 13, i8 -128, i8 15, i8 -128, i8 1, i8 -128, i8 3, i8 -128, i8 5, i8 -128, i8 7, i8 -128, i8 9, i8 -128, i8 11, i8 -128, i8 13, i8 -128, i8 15>)
  ret <32 x i8> %1
}

define <32 x i8> @blend2_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 -128, i8 -128, i8 2, i8 3, i8 -128, i8 -128, i8 6, i8 7, i8 -128, i8 -128, i8 10, i8 11, i8 -128, i8 -128, i8 14, i8 15, i8 -128, i8 -128, i8 2, i8 3, i8 -128, i8 -128, i8 6, i8 7, i8 -128, i8 -128, i8 10, i8 11, i8 -128, i8 -128, i8 14, i8 15>)
  ret <32 x i8> %1
}

define <32 x i8> @blend3_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 12, i8 13, i8 14, i8 15, i8 -128, i8 -128, i8 -128, i8 -128, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 12, i8 13, i8 14, i8 15>)
  ret <32 x i8> %1
}

define <32 x i8> @blend4_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <32 x i8> %1
}

define <32 x i8> @blend5_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 0, i8 1, i8 2, i8 3, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 0, i8 1, i8 2, i8 3, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <32 x i8> %1
}

define <32 x i8> @blend6_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 0, i8 1, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 0, i8 1, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <32 x i8> %1
}

define <64 x i8> @blend1_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 -128, i8 1, i8 -128, i8 3, i8 -128, i8 5, i8 -128, i8 7, i8 -128, i8 9, i8 -128, i8 11, i8 -128, i8 13, i8 -128, i8 15, i8 -128, i8 1, i8 -128, i8 3, i8 -128, i8 5, i8 -128, i8 7, i8 -128, i8 9, i8 -128, i8 11, i8 -128, i8 13, i8 -128, i8 15, i8 -128, i8 1, i8 -128, i8 3, i8 -128, i8 5, i8 -128, i8 7, i8 -128, i8 9, i8 -128, i8 11, i8 -128, i8 13, i8 -128, i8 15, i8 -128, i8 1, i8 -128, i8 3, i8 -128, i8 5, i8 -128, i8 7, i8 -128, i8 9, i8 -128, i8 11, i8 -128, i8 13, i8 -128, i8 15>)
  ret <64 x i8> %1
}

define <64 x i8> @blend2_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 -128, i8 -128, i8 2, i8 3, i8 -128, i8 -128, i8 6, i8 7, i8 -128, i8 -128, i8 10, i8 11, i8 -128, i8 -128, i8 14, i8 15, i8 -128, i8 -128, i8 2, i8 3, i8 -128, i8 -128, i8 6, i8 7, i8 -128, i8 -128, i8 10, i8 11, i8 -128, i8 -128, i8 14, i8 15, i8 -128, i8 -128, i8 2, i8 3, i8 -128, i8 -128, i8 6, i8 7, i8 -128, i8 -128, i8 10, i8 11, i8 -128, i8 -128, i8 14, i8 15, i8 -128, i8 -128, i8 2, i8 3, i8 -128, i8 -128, i8 6, i8 7, i8 -128, i8 -128, i8 10, i8 11, i8 -128, i8 -128, i8 14, i8 15>)
  ret <64 x i8> %1
}

define <64 x i8> @blend3_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 12, i8 13, i8 14, i8 15, i8 -128, i8 -128, i8 -128, i8 -128, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 12, i8 13, i8 14, i8 15, i8 -128, i8 -128, i8 -128, i8 -128, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 12, i8 13, i8 14, i8 15, i8 -128, i8 -128, i8 -128, i8 -128, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 12, i8 13, i8 14, i8 15>)
  ret <64 x i8> %1
}

define <64 x i8> @blend4_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <64 x i8> %1
}

define <64 x i8> @blend5_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 0, i8 1, i8 2, i8 3, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 0, i8 1, i8 2, i8 3, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 0, i8 1, i8 2, i8 3, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 0, i8 1, i8 2, i8 3, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <64 x i8> %1
}

define <64 x i8> @blend6_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 0, i8 1, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128,i8 0, i8 1, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 0, i8 1, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 0, i8 1, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <64 x i8> %1
}

; movq idiom.
define <16 x i8> @movq_idiom(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <16 x i8> %1
}

define <32 x i8> @movq_idiom_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <32 x i8> %1
}

define <64 x i8> @movq_idiom_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>)
  ret <64 x i8> %1
}

; Vector permutations using byte shuffles.

define <16 x i8> @permute1(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 4, i8 5, i8 6, i8 7, i8 4, i8 5, i8 6, i8 7, i8 12, i8 13, i8 14, i8 15, i8 12, i8 13, i8 14, i8 15>)
  ret <16 x i8> %1
}

define <16 x i8> @permute2(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7>)
  ret <16 x i8> %1
}

define <32 x i8> @permute1_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 4, i8 5, i8 6, i8 7, i8 4, i8 5, i8 6, i8 7, i8 12, i8 13, i8 14, i8 15, i8 12, i8 13, i8 14, i8 15, i8 4, i8 5, i8 6, i8 7, i8 4, i8 5, i8 6, i8 7, i8 12, i8 13, i8 14, i8 15, i8 12, i8 13, i8 14, i8 15>)
  ret <32 x i8> %1
}

define <32 x i8> @permute2_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7>)
  ret <32 x i8> %1
}

define <64 x i8> @permute1_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 4, i8 5, i8 6, i8 7, i8 4, i8 5, i8 6, i8 7, i8 12, i8 13, i8 14, i8 15, i8 12, i8 13, i8 14, i8 15, i8 4, i8 5, i8 6, i8 7, i8 4, i8 5, i8 6, i8 7, i8 12, i8 13, i8 14, i8 15, i8 12, i8 13, i8 14, i8 15, i8 4, i8 5, i8 6, i8 7, i8 4, i8 5, i8 6, i8 7, i8 12, i8 13, i8 14, i8 15, i8 12, i8 13, i8 14, i8 15, i8 4, i8 5, i8 6, i8 7, i8 4, i8 5, i8 6, i8 7, i8 12, i8 13, i8 14, i8 15, i8 12, i8 13, i8 14, i8 15>)
  ret <64 x i8> %1
}

define <64 x i8> @permute2_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7>)
  ret <64 x i8> %1
}

; Test that instcombine correctly folds a pshufb with values that
; are not -128 and that are not encoded in four bits.

define <16 x i8> @identity_test2_2(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>)
  ret <16 x i8> %1
}

define <32 x i8> @identity_test_avx2_2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 16, i8 33, i8 66, i8 19, i8 36, i8 69, i8 22, i8 39, i8 72, i8 25, i8 42, i8 75, i8 28, i8 45, i8 78, i8 31, i8 48, i8 81, i8 34, i8 51, i8 84, i8 37, i8 54, i8 87, i8 40, i8 57, i8 90, i8 43, i8 60, i8 93, i8 46, i8 63>)
  ret <32 x i8> %1
}

define <64 x i8> @identity_test_avx512_2(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 16, i8 33, i8 66, i8 19, i8 36, i8 69, i8 22, i8 39, i8 72, i8 25, i8 42, i8 75, i8 28, i8 45, i8 78, i8 31, i8 48, i8 81, i8 34, i8 51, i8 84, i8 37, i8 54, i8 87, i8 40, i8 57, i8 90, i8 43, i8 60, i8 93, i8 46, i8 63, i8 96, i8 49, i8 66, i8 99, i8 52, i8 69, i8 102, i8 55, i8 72, i8 105, i8 58, i8 75, i8 108, i8 61, i8 78, i8 111, i8 64, i8 81, i8 114, i8 67, i8 84, i8 117, i8 70, i8 87, i8 120, i8 73, i8 90, i8 123, i8 76, i8 93, i8 126, i8 79>)
  ret <64 x i8> %1
}

define <16 x i8> @fold_to_zero_vector_2(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 -125, i8 -1, i8 -53, i8 -32, i8 -4, i8 -7, i8 -33, i8 -66, i8 -99, i8 -120, i8 -100, i8 -22, i8 -17, i8 -1, i8 -11, i8 -15>)
  ret <16 x i8> %1
}

define <32 x i8> @fold_to_zero_vector_avx2_2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 -127, i8 -1, i8 -53, i8 -32, i8 -4, i8 -7, i8 -33, i8 -66, i8 -99, i8 -120, i8 -100, i8 -22, i8 -17, i8 -1, i8 -11, i8 -15, i8 -126, i8 -2, i8 -52, i8 -31, i8 -5, i8 -8, i8 -34, i8 -67, i8 -100, i8 -119, i8 -101, i8 -23, i8 -16, i8 -2, i8 -12, i8 -16>)
  ret <32 x i8> %1
}

define <64 x i8> @fold_to_zero_vector_avx512_2(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 -127, i8 -1, i8 -53, i8 -32, i8 -4, i8 -7, i8 -33, i8 -66, i8 -99, i8 -120, i8 -100, i8 -22, i8 -17, i8 -1, i8 -11, i8 -15, i8 -126, i8 -2, i8 -52, i8 -31, i8 -5, i8 -8, i8 -34, i8 -67, i8 -100, i8 -119, i8 -101, i8 -23, i8 -16, i8 -2, i8 -12, i8 -16, i8 -125, i8 -3, i8 -51, i8 -30, i8 -6, i8 -9, i8 -35, i8 -68, i8 -101, i8 -118, i8 -102, i8 -24, i8 -15, i8 -3, i8 -13, i8 -17, i8 -124, i8 -4, i8 -56, i8 -29, i8 -7, i8 -10, i8 -36, i8 -69, i8 -102, i8 -117, i8 -103, i8 -25, i8 -14, i8 -4, i8 -14, i8 -18>)
  ret <64 x i8> %1
}

define <16 x i8> @permute3(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 48, i8 17, i8 34, i8 51, i8 20, i8 37, i8 54, i8 23, i8 16, i8 49, i8 66, i8 19, i8 52, i8 69, i8 22, i8 55>)
  ret <16 x i8> %1
}

define <32 x i8> @permute3_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 52, i8 21, i8 38, i8 55, i8 20, i8 37, i8 54, i8 23, i8 28, i8 61, i8 78, i8 31, i8 60, i8 29, i8 30, i8 79, i8 52, i8 21, i8 38, i8 55, i8 20, i8 53, i8 102, i8 23, i8 92, i8 93, i8 94, i8 95, i8 108, i8 109, i8 110, i8 111>)
  ret <32 x i8> %1
}

define <64 x i8> @permute3_avx512(<64 x i8> %InVec) {
  %1 = tail call <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8> %InVec, <64 x i8> <i8 52, i8 21, i8 38, i8 55, i8 20, i8 37, i8 54, i8 23, i8 28, i8 61, i8 78, i8 31, i8 60, i8 29, i8 30, i8 79, i8 52, i8 21, i8 38, i8 55, i8 20, i8 53, i8 102, i8 23, i8 92, i8 93, i8 94, i8 95, i8 108, i8 109, i8 110, i8 111, i8 52, i8 21, i8 38, i8 55, i8 20, i8 37, i8 54, i8 23, i8 28, i8 61, i8 78, i8 31, i8 60, i8 29, i8 30, i8 79, i8 52, i8 21, i8 38, i8 55, i8 20, i8 53, i8 102, i8 23, i8 108, i8 109, i8 110, i8 111, i8 124, i8 125, i8 126, i8 127>)
  ret <64 x i8> %1
}

; shuffles with undef mask elements.

define <16 x i8> @fold_with_undef_elts(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> <i8 0, i8 -128, i8 undef, i8 -128, i8 1, i8 -128, i8 undef, i8 -128, i8 2, i8 -128, i8 undef, i8 -128, i8 3, i8 -128, i8 undef, i8 -128>)
  ret <16 x i8> %1
}

define <32 x i8> @fold_with_undef_elts_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 0, i8 -128, i8 undef, i8 -128, i8 1, i8 -128, i8 undef, i8 -128, i8 2, i8 -128, i8 undef, i8 -128, i8 3, i8 -128, i8 undef, i8 -128, i8 0, i8 -128, i8 undef, i8 -128, i8 1, i8 -128, i8 undef, i8 -128, i8 2, i8 -128, i8 undef, i8 -128, i8 3, i8 -128, i8 undef, i8 -128>)
  ret <32 x i8> %1
}

define <16 x i8> @fold_with_allundef_elts(<16 x i8> %InVec) {
  %1 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> undef)
  ret <16 x i8> %1
}

define <32 x i8> @fold_with_allundef_elts_avx2(<32 x i8> %InVec) {
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> undef)
  ret <32 x i8> %1
}

; Demanded elts tests.

define <16 x i8> @demanded_elts_insertion(<16 x i8> %InVec, <16 x i8> %BaseMask, i8 %M0, i8 %M15) {
  %1 = insertelement <16 x i8> %BaseMask, i8 %M0, i32 0
  %2 = insertelement <16 x i8> %1, i8 %M15, i32 15
  %3 = tail call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %InVec, <16 x i8> %2)
  %4 = shufflevector <16 x i8> %3, <16 x i8> undef, <16 x i32> <i32 undef, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 undef>
  ret <16 x i8> %4
}

define <32 x i8> @demanded_elts_insertion_avx2(<32 x i8> %InVec, <32 x i8> %BaseMask, i8 %M0, i8 %M22) {
  %1 = insertelement <32 x i8> %BaseMask, i8 %M0, i32 0
  %2 = insertelement <32 x i8> %1, i8 %M22, i32 22
  %3 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> %2)
  %4 = shufflevector <32 x i8> %3, <32 x i8> undef, <32 x i32> <i32 undef, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 undef, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  ret <32 x i8> %4
}

declare <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8>, <16 x i8>)
declare <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8>, <32 x i8>)
declare <64 x i8> @llvm.x86.avx512.pshuf.b.512(<64 x i8>, <64 x i8>)
