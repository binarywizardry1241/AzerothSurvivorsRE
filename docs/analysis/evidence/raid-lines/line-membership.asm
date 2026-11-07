145950436: 0f28c6 movaps xmm0, xmm6
145950439: e8df9c2a00 call 0x145bfa11d
14595043e: 440f28f8 movaps xmm15, xmm0
145950442: 0f28c6 movaps xmm0, xmm6
145950445: e8cd9c2a00 call 0x145bfa117
14595044a: 410f28d7 movaps xmm2, xmm15
14595044e: 0f14d0 unpcklps xmm2, xmm0
145950451: 410f59d6 mulps xmm2, xmm14
145950455: f30f16ca movshdup xmm1, xmm2
145950459: f30f58ca addss xmm1, xmm2
14595045d: 31c0 xor eax, eax
14595045f: 0f57d2 xorps xmm2, xmm2
145950462: 0f2eca ucomiss xmm1, xmm2
145950465: 0f82bb000000 jb 0x145950526
14595046b: 440f2ec1 ucomiss xmm8, xmm1
14595046f: 0f82b1000000 jb 0x145950526
145950475: 410f14c7 unpcklps xmm0, xmm15
145950479: 440f59f0 mulps xmm14, xmm0
14595047d: f3410f16c6 movshdup xmm0, xmm14
145950482: f3410f5cc6 subss xmm0, xmm14
145950487: 410f54c3 andps xmm0, xmm11
14595048b: f3410f104d38 movss xmm1, dword ptr [r13 + 0x38]
145950491: f30f59cf mulss xmm1, xmm7
145950495: 0f2ec8 ucomiss xmm1, xmm0
145950498: 0f93c0 setae al
