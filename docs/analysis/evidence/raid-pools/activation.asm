14595072e: 41c6457d01 mov byte ptr [r13 + 0x7d], 1
145950733: f30f108534020000 movss xmm0, dword ptr [rbp + 0x234]
14595073b: f3410f114568 movss dword ptr [r13 + 0x68], xmm0
145950741: f3410f104570 movss xmm0, dword ptr [r13 + 0x70]
145950747: 0f57c9 xorps xmm1, xmm1
14595074a: 0f2ec1 ucomiss xmm0, xmm1
14595074d: 7605 jbe 0x145950754
14595074f: 41c6457c00 mov byte ptr [r13 + 0x7c], 0
