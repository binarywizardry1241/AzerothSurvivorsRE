0000000145c27c9d 4084ff                         test dil, dil
0000000145c27ca0 740a                           je 0x145c27cac
0000000145c27ca2 f30f1005f6045700               movss xmm0, dword ptr [rip + 0x5704f6]
0000000145c27caa eb07                           jmp 0x145c27cb3
0000000145c27cac f3410f104424f4                 movss xmm0, dword ptr [r12 - 0xc]
0000000145c27cb3 f3440f5986f80c0000             mulss xmm8, dword ptr [rsi + 0xcf8]
0000000145c27cbc 0f57c9                         xorps xmm1, xmm1
0000000145c27cbf f3410f51c8                     sqrtss xmm1, xmm8
0000000145c27cc4 488b95d8010000                 mov rdx, qword ptr [rbp + 0x1d8]
0000000145c27ccb f30f594a58                     mulss xmm1, dword ptr [rdx + 0x58]
0000000145c27cd0 f30f59f9                       mulss xmm7, xmm1
0000000145c27cd4 f30f59f8                       mulss xmm7, xmm0
