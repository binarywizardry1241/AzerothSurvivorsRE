14018f60f: movss xmm7, dword ptr [r14]
14018f614: xorps xmm3, xmm3
14018f617: cvtsi2ss xmm3, r8
14018f61c: xorps xmm4, xmm4
14018f61f: cvtsi2ss xmm4, rbx
14018f624: divss xmm4, xmm7
14018f628: movss xmm6, dword ptr [r10]
14018f62d: movss xmm5, dword ptr [r10 + 4]
14018f633: movaps xmm8, xmm4
14018f637: divss xmm8, xmm6
14018f63c: divss xmm3, xmm7
14018f640: movaps xmm7, xmm3
14018f643: divss xmm7, xmm5
14018f647: movaps xmm9, xmm8
14018f64b: minss xmm9, xmm7
14018f650: movaps xmm7, xmm9
14018f654: cmpunordss xmm7, xmm9
14018f65a: movaps xmm10, xmm7
14018f65e: andnps xmm10, xmm9
14018f662: andps xmm7, xmm8
14018f666: orps xmm7, xmm10
14018f66a: movss xmm8, dword ptr [r10 + 8]
14018f670: movaps xmm9, xmm7
14018f674: minss xmm9, xmm8
14018f679: movaps xmm8, xmm9
14018f67d: cmpunordss xmm8, xmm9
14018f683: andps xmm7, xmm8
14018f687: andnps xmm8, xmm9
14018f68b: orps xmm8, xmm7
14018f68f: maxss xmm8, xmm0
14018f694: divss xmm4, xmm8
14018f699: subss xmm4, xmm6
14018f69d: mulss xmm4, xmm1
14018f6a1: divss xmm3, xmm8
14018f6a6: subss xmm3, xmm5
14018f6aa: mulss xmm3, xmm1
