0000000145c59229 4889c1                         mov rcx, rax
0000000145c5922c 48d1e9                         shr rcx, 1
0000000145c5922f 83e001                         and eax, 1
0000000145c59232 4809c8                         or rax, rcx
0000000145c59235 0f57c0                         xorps xmm0, xmm0
0000000145c59238 f3480f2ac0                     cvtsi2ss xmm0, rax
0000000145c5923d f30f58c0                       addss xmm0, xmm0
0000000145c59241 0f57c9                         xorps xmm1, xmm1
0000000145c59244 f30f2aca                       cvtsi2ss xmm1, edx
0000000145c59248 f30f5e0d80345e00               divss xmm1, dword ptr [rip + 0x5e3480]
0000000145c59250 f30f58c8                       addss xmm1, xmm0
0000000145c59254 0f2e0dcdf05300                 ucomiss xmm1, dword ptr [rip + 0x53f0cd]
0000000145c5925b 0f8758feffff                   ja 0x145c590b9
