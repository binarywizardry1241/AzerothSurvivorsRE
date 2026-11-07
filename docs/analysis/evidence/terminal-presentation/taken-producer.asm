145920ce2 c6455a00 mov byte ptr [rbp + 0x5a], 0
145920ce6 488d5538 lea rdx, [rbp + 0x38]
145920cea 4c89e9 mov rcx, r13
145920ced 4531c0 xor r8d, r8d
145920cf0 e8eb670400 call 0x1459674e0
145920cf5 f3410f1085e0040000 movss xmm0, dword ptr [r13 + 0x4e0]
145920cfe f30f5cc7 subss xmm0, xmm7
145920d02 f3410f1185e0040000 movss dword ptr [r13 + 0x4e0], xmm0
145920d0b f3450f118550050000 movss dword ptr [r13 + 0x550], xmm8
145920d14 450f57c9 xorps xmm9, xmm9
145920d18 f3440f5acf cvtss2sd xmm9, xmm7
145920d1d f2410f108510070000 movsd xmm0, qword ptr [r13 + 0x710]
145920d26 f2410f58c1 addsd xmm0, xmm9
145920d2b f2410f118510070000 movsd qword ptr [r13 + 0x710], xmm0
