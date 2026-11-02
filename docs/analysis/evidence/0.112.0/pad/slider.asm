14011dad8: 0f57c9 xorps xmm1, xmm1
14011dadb: 440f2ec1 ucomiss xmm8, xmm1
14011dadf: 7712 ja 0x14011daf3
14011dae1: 440f28c6 movaps xmm8, xmm6
14011dae5: f3440f5cc7 subss xmm8, xmm7
14011daea: f3440f5e05413cc905 divss xmm8, dword ptr [rip + 0x5c93c41]
14011daf3: f3410f59d0 mulss xmm2, xmm8
14011daf8: f30f58d0 addss xmm2, xmm0
14011dafc: f30f5ffa maxss xmm7, xmm2
14011db00: f30f5df7 minss xmm6, xmm7
