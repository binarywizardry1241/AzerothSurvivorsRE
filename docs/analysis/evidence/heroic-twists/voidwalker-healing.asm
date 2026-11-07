0000000145c3a0ef 4531c9                         xor r9d, r9d
0000000145c3a0f2 80bb6f03000005                 cmp byte ptr [rbx + 0x36f], 5
0000000145c3a0f9 410f93c1                       setae r9b
0000000145c3a0fd f3440f1083c8040000             movss xmm8, dword ptr [rbx + 0x4c8]
0000000145c3a106 f30f109338050000               movss xmm2, dword ptr [rbx + 0x538]
0000000145c3a10e 4c8d15f356a501                 lea r10, [rip + 0x1a556f3]
0000000145c3a115 f3430f100c8a                   movss xmm1, dword ptr [r10 + r9*4]
0000000145c3a11b f30f58ca                       addss xmm1, xmm2
0000000145c3a11f 0f28d9                         movaps xmm3, xmm1
0000000145c3a122 f3410f5dd8                     minss xmm3, xmm8
0000000145c3a127 0f28c3                         movaps xmm0, xmm3
0000000145c3a12a f30fc2c303                     cmpunordss xmm0, xmm3
0000000145c3a12f 0f54c8                         andps xmm1, xmm0
0000000145c3a132 0f55c3                         andnps xmm0, xmm3
0000000145c3a135 0f56c1                         orps xmm0, xmm1
0000000145c3a138 f30f118338050000               movss dword ptr [rbx + 0x538], xmm0
0000000145c3a140 0f28c8                         movaps xmm1, xmm0
0000000145c3a143 f30f5cca                       subss xmm1, xmm2
