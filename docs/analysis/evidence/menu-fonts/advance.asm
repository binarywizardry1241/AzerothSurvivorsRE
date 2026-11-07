0x1458f9f77: cmp byte ptr [rbp + 0x1f0], 4
0x1458f9f7e: jne 0x1458f9fb4
0x1458f9f80: subss xmm6, xmm15
0x1458f9f85: addss xmm6, xmm9
0x1458f9f8a: movaps xmm0, xmm6
0x1458f9f8d: call 0x145bfa10b
0x1458f9f92: xorps xmm1, xmm1
0x1458f9f95: maxss xmm1, xmm0
0x1458f9f99: movss xmm0, dword ptr [rip + 0x643b93]
0x1458f9fa1: minss xmm0, xmm1
0x1458f9fa5: cvttss2si eax, xmm0
0x1458f9fa9: add bx, ax
0x1458f9fac: mov eax, 0xffff
0x1458f9fb1: cmovb ebx, eax
