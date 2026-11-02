1401c208f: 488b442430 mov rax, qword ptr [rsp + 0x30]
1401c2094: f3410f1016 movss xmm2, dword ptr [r14]
1401c2099: 0f5905c001c205 mulps xmm0, xmmword ptr [rip + 0x5c201c0]
1401c20a0: f30f5f157404c205 maxss xmm2, dword ptr [rip + 0x5c20474]
1401c20a8: 0f14c0 unpcklps xmm0, xmm0
1401c20ab: f30f100dedb1bd05 movss xmm1, dword ptr [rip + 0x5bdb1ed]
1401c20b3: f30f5eca divss xmm1, xmm2
1401c20b7: 0f2815e2afc005 movaps xmm2, xmmword ptr [rip + 0x5c0afe2]
1401c20be: 0f57d0 xorps xmm2, xmm0
1401c20c1: 0f2818 movaps xmm3, xmmword ptr [rax]
1401c20c4: 0f59d3 mulps xmm2, xmm3
1401c20c7: 0f59c3 mulps xmm0, xmm3
1401c20ca: 48891e mov qword ptr [rsi], rbx
1401c20cd: 48897e08 mov qword ptr [rsi + 8], rdi
1401c20d1: f20f125810 movddup xmm3, qword ptr [rax + 0x10]
1401c20d6: 0f28e2 movaps xmm4, xmm2
1401c20d9: 0f16e0 movlhps xmm4, xmm0
1401c20dc: 0f12c2 movhlps xmm0, xmm2
1401c20df: 0f58c4 addps xmm0, xmm4
1401c20e2: 0f58c3 addps xmm0, xmm3
1401c20e5: 0fc6c900 shufps xmm1, xmm1, 0
1401c20e9: 0f59c8 mulps xmm1, xmm0
1401c20ec: 0f28c1 movaps xmm0, xmm1
1401c20ef: 0fc6c14e shufps xmm0, xmm1, 0x4e
1401c20f3: 0f28d1 movaps xmm2, xmm1
1401c20f6: 0fc2d001 cmpltps xmm2, xmm0
1401c20fa: f20f12c1 movddup xmm0, xmm1
1401c20fe: 660f15c9 unpckhpd xmm1, xmm1
1401c2102: 660f54c2 andpd xmm0, xmm2
1401c2106: 660f55d1 andnpd xmm2, xmm1
1401c210a: 660f56d0 orpd xmm2, xmm0
1401c210e: 660f115610 movupd xmmword ptr [rsi + 0x10], xmm2
1401c2113: e96affffff jmp 0x1401c2082
