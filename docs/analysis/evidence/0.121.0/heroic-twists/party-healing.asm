0000000145c2142b 31c0                           xor eax, eax
0000000145c2142d 488b8da8030000                 mov rcx, qword ptr [rbp + 0x3a8]
0000000145c21434 80b96f03000005                 cmp byte ptr [rcx + 0x36f], 5
0000000145c2143b f30f59f7                       mulss xmm6, xmm7
0000000145c2143f 0f93c0                         setae al
0000000145c21442 488d15d7dfa601                 lea rdx, [rip + 0x1a6dfd7]
0000000145c21449 f30f593482                     mulss xmm6, dword ptr [rdx + rax*4]
0000000145c2144e f30f10b9c8040000               movss xmm7, dword ptr [rcx + 0x4c8]
0000000145c21456 f30f108938050000               movss xmm1, dword ptr [rcx + 0x538]
0000000145c2145e f30f58f1                       addss xmm6, xmm1
0000000145c21462 0f28d6                         movaps xmm2, xmm6
0000000145c21465 f30f5dd7                       minss xmm2, xmm7
0000000145c21469 0f28c2                         movaps xmm0, xmm2
0000000145c2146c f30fc2c203                     cmpunordss xmm0, xmm2
0000000145c21471 0f54f0                         andps xmm6, xmm0
0000000145c21474 0f55c2                         andnps xmm0, xmm2
0000000145c21477 0f56c6                         orps xmm0, xmm6
0000000145c2147a f30f118138050000               movss dword ptr [rcx + 0x538], xmm0
0000000145c21482 0f28f0                         movaps xmm6, xmm0
0000000145c21485 f30f5cf1                       subss xmm6, xmm1
