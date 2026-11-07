1401c02ff: 488b442430 mov rax, qword ptr [rsp + 0x30]
1401c0304: f3410f1016 movss xmm2, dword ptr [r14]
1401c0309: 0f590560a8bf05 mulps xmm0, xmmword ptr [rip + 0x5bfa860]
1401c0310: f30f5f1584adbf05 maxss xmm2, dword ptr [rip + 0x5bfad84]
1401c0318: 0f14c0 unpcklps xmm0, xmm0
1401c031b: f30f100d3dcfbe05 movss xmm1, dword ptr [rip + 0x5becf3d]
1401c0323: f30f5eca divss xmm1, xmm2
1401c0327: 0f281522d2be05 movaps xmm2, xmmword ptr [rip + 0x5bed222]
1401c032e: 0f57d0 xorps xmm2, xmm0
1401c0331: 0f2818 movaps xmm3, xmmword ptr [rax]
1401c0334: 0f59d3 mulps xmm2, xmm3
1401c0337: 0f59c3 mulps xmm0, xmm3
1401c033a: 48891e mov qword ptr [rsi], rbx
1401c033d: 48897e08 mov qword ptr [rsi + 8], rdi
1401c0341: f20f125810 movddup xmm3, qword ptr [rax + 0x10]
1401c0346: 0f28e2 movaps xmm4, xmm2
1401c0349: 0f16e0 movlhps xmm4, xmm0
1401c034c: 0f12c2 movhlps xmm0, xmm2
1401c034f: 0f58c4 addps xmm0, xmm4
1401c0352: 0f58c3 addps xmm0, xmm3
1401c0355: 0fc6c900 shufps xmm1, xmm1, 0
1401c0359: 0f59c8 mulps xmm1, xmm0
1401c035c: 0f28c1 movaps xmm0, xmm1
1401c035f: 0fc6c14e shufps xmm0, xmm1, 0x4e
1401c0363: 0f28d1 movaps xmm2, xmm1
1401c0366: 0fc2d001 cmpltps xmm2, xmm0
1401c036a: f20f12c1 movddup xmm0, xmm1
1401c036e: 660f15c9 unpckhpd xmm1, xmm1
1401c0372: 660f54c2 andpd xmm0, xmm2
1401c0376: 660f55d1 andnpd xmm2, xmm1
1401c037a: 660f56d0 orpd xmm2, xmm0
1401c037e: 660f115610 movupd xmmword ptr [rsi + 0x10], xmm2
1401c0383: e96affffff jmp 0x1401c02f2
