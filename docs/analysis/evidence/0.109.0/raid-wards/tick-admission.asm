145978959: 4183bed0000000ff cmp dword ptr [r14 + 0xd0], -1
145978961: 0f84aa000000 je 0x145978a11
145978967: f3410f1086e8000000 movss xmm0, dword ptr [r14 + 0xe8]
145978970: 0f2ef0 ucomiss xmm6, xmm0
145978973: 4c8bbd18030000 mov r15, qword ptr [rbp + 0x318]
14597897a: 730e jae 0x14597898a
14597897c: 410f2eb6ec000000 ucomiss xmm6, dword ptr [r14 + 0xec]
145978984: 0f8252faffff jb 0x1459783dc
14597898a: f3450f11a6ec000000 movss dword ptr [r14 + 0xec], xmm12
145978993: f3410f108e90010000 movss xmm1, dword ptr [r14 + 0x190]
14597899c: 440f2ee9 ucomiss xmm13, xmm1
1459789a0: 0f8310010000 jae 0x145978ab6
1459789a6: 0f28d6 movaps xmm2, xmm6
1459789a9: f3410f5c968c010000 subss xmm2, dword ptr [r14 + 0x18c]
1459789b2: f30f5ed1 divss xmm2, xmm1
1459789b6: 0f57c9 xorps xmm1, xmm1
1459789b9: f30f5fca maxss xmm1, xmm2
1459789bd: f30f1015db484200 movss xmm2, dword ptr [rip + 0x4248db]
1459789c5: f30f5dd1 minss xmm2, xmm1
1459789c9: f2410f108e74010000 movsd xmm1, qword ptr [r14 + 0x174]
1459789d2: f2410f109e80010000 movsd xmm3, qword ptr [r14 + 0x180]
1459789db: 0f5cd9 subps xmm3, xmm1
1459789de: f3440f12ca movsldup xmm9, xmm2
1459789e3: 440f59cb mulps xmm9, xmm3
1459789e7: 440f58c9 addps xmm9, xmm1
1459789eb: f3410f108e7c010000 movss xmm1, dword ptr [r14 + 0x17c]
1459789f4: f3450f109688010000 movss xmm10, dword ptr [r14 + 0x188]
1459789fd: f3440f5cd1 subss xmm10, xmm1
145978a02: f3440f59d2 mulss xmm10, xmm2
145978a07: f3440f58d1 addss xmm10, xmm1
145978a0c: e9b7000000 jmp 0x145978ac8
