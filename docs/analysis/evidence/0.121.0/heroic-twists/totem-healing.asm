0000000145bffd11 31c0                           xor eax, eax
0000000145bffd13 80b96f03000005                 cmp byte ptr [rcx + 0x36f], 5
0000000145bffd1a 0f93c0                         setae al
0000000145bffd1d 488d15fcf6a801                 lea rdx, [rip + 0x1a8f6fc]
0000000145bffd24 f30f590c82                     mulss xmm1, dword ptr [rdx + rax*4]
0000000145bffd29 f30f109138050000               movss xmm2, dword ptr [rcx + 0x538]
0000000145bffd31 f30f58ca                       addss xmm1, xmm2
0000000145bffd35 0f28d9                         movaps xmm3, xmm1
0000000145bffd38 f30f5dde                       minss xmm3, xmm6
0000000145bffd3c 0f28c3                         movaps xmm0, xmm3
0000000145bffd3f f30fc2c303                     cmpunordss xmm0, xmm3
0000000145bffd44 0f54c8                         andps xmm1, xmm0
0000000145bffd47 0f55c3                         andnps xmm0, xmm3
0000000145bffd4a 0f56c1                         orps xmm0, xmm1
0000000145bffd4d 4889cb                         mov rbx, rcx
0000000145bffd50 f30f118138050000               movss dword ptr [rcx + 0x538], xmm0
0000000145bffd58 440f28c0                       movaps xmm8, xmm0
