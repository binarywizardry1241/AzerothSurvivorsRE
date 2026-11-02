0000000145c28c26 83bc08b000000001               cmp dword ptr [rax + rcx + 0xb0], 1
0000000145c28c2e 74e0                           je 0x145c28c10
0000000145c28c30 f30f10840860010000             movss xmm0, dword ptr [rax + rcx + 0x160]
0000000145c28c39 f30f108c0864010000             movss xmm1, dword ptr [rax + rcx + 0x164]
0000000145c28c42 0f28d1                         movaps xmm2, xmm1
0000000145c28c45 f30f59d6                       mulss xmm2, xmm6
0000000145c28c49 f30f5cc8                       subss xmm1, xmm0
0000000145c28c4d 0f28da                         movaps xmm3, xmm2
0000000145c28c50 f30f5dd9                       minss xmm3, xmm1
0000000145c28c54 0f28cb                         movaps xmm1, xmm3
0000000145c28c57 f30fc2cb03                     cmpunordss xmm1, xmm3
0000000145c28c5c 0f28e1                         movaps xmm4, xmm1
0000000145c28c5f 0f55e3                         andnps xmm4, xmm3
0000000145c28c62 0f54ca                         andps xmm1, xmm2
0000000145c28c65 0f56cc                         orps xmm1, xmm4
0000000145c28c68 f3410f5fc8                     maxss xmm1, xmm8
0000000145c28c6d 440f2ec1                       ucomiss xmm8, xmm1
0000000145c28c71 0f8359ffffff                   jae 0x145c28bd0
0000000145c28c77 f30f58c1                       addss xmm0, xmm1
0000000145c28c7b f30f11840860010000             movss dword ptr [rax + rcx + 0x160], xmm0
