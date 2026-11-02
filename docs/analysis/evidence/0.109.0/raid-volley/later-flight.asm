14595ca1f: 0f2885f0000000 movaps xmm0, xmmword ptr [rbp + 0xf0]
14595ca26: f3410f5cc3 subss xmm0, xmm11
14595ca2b: 0f288d50010000 movaps xmm1, xmmword ptr [rbp + 0x150]
14595ca32: f3410f5cca subss xmm1, xmm10
14595ca37: f30f59c9 mulss xmm1, xmm1
14595ca3b: f30f59c0 mulss xmm0, xmm0
14595ca3f: f30f58c1 addss xmm0, xmm1
14595ca43: 0f57ff xorps xmm7, xmm7
14595ca46: f30f51f8 sqrtss xmm7, xmm0
14595ca4a: f30f5ebde0000000 divss xmm7, dword ptr [rbp + 0xe0]
14595ca52: f30f5f3da2064700 maxss xmm7, dword ptr [rip + 0x4706a2]
14595ca5a: 8bbe380a0000 mov edi, dword ptr [rsi + 0xa38]
14595ca60: ffc7 inc edi
14595ca62: 89be380a0000 mov dword ptr [rsi + 0xa38], edi
14595ca68: f3440f10b6340a0000 movss xmm14, dword ptr [rsi + 0xa34]
