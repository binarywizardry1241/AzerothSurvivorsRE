0000000145c2f36d 31c9                           xor ecx, ecx
0000000145c2f36f 80be6f03000005                 cmp byte ptr [rsi + 0x36f], 5
0000000145c2f376 0f93c1                         setae cl
0000000145c2f379 4c8d05a000a601                 lea r8, [rip + 0x1a600a0]
0000000145c2f380 f3410f593c88                   mulss xmm7, dword ptr [r8 + rcx*4]
0000000145c2f386 f30f10b6c8040000               movss xmm6, dword ptr [rsi + 0x4c8]
0000000145c2f38e f30f109638050000               movss xmm2, dword ptr [rsi + 0x538]
0000000145c2f396 f30f58fa                       addss xmm7, xmm2
0000000145c2f39a 0f28cf                         movaps xmm1, xmm7
0000000145c2f39d f30f5dce                       minss xmm1, xmm6
0000000145c2f3a1 0f28c1                         movaps xmm0, xmm1
0000000145c2f3a4 f30fc2c103                     cmpunordss xmm0, xmm1
0000000145c2f3a9 0f54f8                         andps xmm7, xmm0
0000000145c2f3ac 0f55c1                         andnps xmm0, xmm1
0000000145c2f3af 0f56c7                         orps xmm0, xmm7
0000000145c2f3b2 f30f118638050000               movss dword ptr [rsi + 0x538], xmm0
0000000145c2f3ba 0f28c8                         movaps xmm1, xmm0
0000000145c2f3bd f30f5cca                       subss xmm1, xmm2
