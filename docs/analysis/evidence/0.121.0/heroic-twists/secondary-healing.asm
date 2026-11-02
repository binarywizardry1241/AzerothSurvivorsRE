0000000145c000fb 31c0                           xor eax, eax
0000000145c000fd 80bf6f03000005                 cmp byte ptr [rdi + 0x36f], 5
0000000145c00104 0f93c0                         setae al
0000000145c00107 488d1512f3a801                 lea rdx, [rip + 0x1a8f312]
0000000145c0010e f30f593c82                     mulss xmm7, dword ptr [rdx + rax*4]
0000000145c00113 f30f108738050000               movss xmm0, dword ptr [rdi + 0x538]
0000000145c0011b f30f58f8                       addss xmm7, xmm0
0000000145c0011f 0f28cf                         movaps xmm1, xmm7
0000000145c00122 f30f5d8fc8040000               minss xmm1, dword ptr [rdi + 0x4c8]
0000000145c0012a 0f28f1                         movaps xmm6, xmm1
0000000145c0012d f30fc2f103                     cmpunordss xmm6, xmm1
0000000145c00132 0f54fe                         andps xmm7, xmm6
0000000145c00135 0f55f1                         andnps xmm6, xmm1
0000000145c00138 0f56f7                         orps xmm6, xmm7
0000000145c0013b f30f11b738050000               movss dword ptr [rdi + 0x538], xmm6
0000000145c00143 f30f5cf0                       subss xmm6, xmm0
