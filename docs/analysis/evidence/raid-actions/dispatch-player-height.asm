145957aef: 488b8e98090000 mov rcx, qword ptr [rsi + 0x998]
145957af6: 4883c110 add rcx, 0x10
145957afa: f20f108ec8040000 movsd xmm1, qword ptr [rsi + 0x4c8]
145957b02: f30f16d1 movshdup xmm2, xmm1
145957b06: f30f10b6d0040000 movss xmm6, dword ptr [rsi + 0x4d0]
145957b0e: 0f298dd0000000 movaps xmmword ptr [rbp + 0xd0], xmm1
145957b15: 0f2995e0000000 movaps xmmword ptr [rbp + 0xe0], xmm2
145957b1c: e86ff4f7ff call 0x1458d6f90
145957b21: 440f28d8 movaps xmm11, xmm0
145957b25: a801 test al, 1
145957b27: 7504 jne 0x145957b2d
145957b29: 440f28de movaps xmm11, xmm6
145957b2d: 440f28add0000000 movaps xmm13, xmmword ptr [rbp + 0xd0]
145957b35: f2440f116df0 movsd qword ptr [rbp - 0x10], xmm13
145957b3b: f3440f115df8 movss dword ptr [rbp - 8], xmm11
145957b41: f20f1085a8000000 movsd xmm0, qword ptr [rbp + 0xa8]
145957b49: f3440f16d0 movshdup xmm10, xmm0
145957b4e: 440f28a5e0000000 movaps xmm12, xmmword ptr [rbp + 0xe0]
145957b56: f3450f5ce2 subss xmm12, xmm10
145957b5b: 0f298550010000 movaps xmmword ptr [rbp + 0x150], xmm0
145957b62: f3440f5ce8 subss xmm13, xmm0
145957b67: 410f28c4 movaps xmm0, xmm12
145957b6b: 410f28cd movaps xmm1, xmm13
145957b6f: e8af252a00 call 0x145bfa123
145957b74: f30f118578010000 movss dword ptr [rbp + 0x178], xmm0
