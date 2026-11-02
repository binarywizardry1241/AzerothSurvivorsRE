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
