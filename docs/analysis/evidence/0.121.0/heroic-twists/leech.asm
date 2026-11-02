0000000145bfee64 31c0                           xor eax, eax
0000000145bfee66 80be6f03000005                 cmp byte ptr [rsi + 0x36f], 5
0000000145bfee6d 0f93c0                         setae al
0000000145bfee70 488d0da905a901                 lea rcx, [rip + 0x1a905a9]
0000000145bfee77 f30f593481                     mulss xmm6, dword ptr [rcx + rax*4]
0000000145bfee7c f30f108638050000               movss xmm0, dword ptr [rsi + 0x538]
0000000145bfee84 f30f58f0                       addss xmm6, xmm0
0000000145bfee88 0f28ce                         movaps xmm1, xmm6
0000000145bfee8b f3410f5dcd                     minss xmm1, xmm13
0000000145bfee90 440f28e9                       movaps xmm13, xmm1
0000000145bfee94 f3440fc2e903                   cmpunordss xmm13, xmm1
0000000145bfee9a 410f54f5                       andps xmm6, xmm13
0000000145bfee9e 440f55e9                       andnps xmm13, xmm1
0000000145bfeea2 440f56ee                       orps xmm13, xmm6
0000000145bfeea6 f3440f11ae38050000             movss dword ptr [rsi + 0x538], xmm13
0000000145bfeeaf f3440f5ce8                     subss xmm13, xmm0
