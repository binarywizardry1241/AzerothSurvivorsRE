145946259: 4183bed0000000ff cmp dword ptr [r14 + 0xd0], -1
145946261: 0f84aa000000 je 0x145946311
145946267: f3410f1086e8000000 movss xmm0, dword ptr [r14 + 0xe8]
145946270: 0f2ef0 ucomiss xmm6, xmm0
145946273: 4c8bbd20030000 mov r15, qword ptr [rbp + 0x320]
14594627a: 730e jae 0x14594628a
14594627c: 410f2eb6ec000000 ucomiss xmm6, dword ptr [r14 + 0xec]
145946284: 0f8252faffff jb 0x145945cdc
14594628a: f3450f11a6ec000000 movss dword ptr [r14 + 0xec], xmm12
145946293: f3410f108e90010000 movss xmm1, dword ptr [r14 + 0x190]
14594629c: 440f2ee9 ucomiss xmm13, xmm1
1459462a0: 0f8310010000 jae 0x1459463b6
1459462a6: 0f28d6 movaps xmm2, xmm6
1459462a9: f3410f5c968c010000 subss xmm2, dword ptr [r14 + 0x18c]
1459462b2: f30f5ed1 divss xmm2, xmm1
1459462b6: 0f57c9 xorps xmm1, xmm1
1459462b9: f30f5fca maxss xmm1, xmm2
1459462bd: f30f10159b6f4600 movss xmm2, dword ptr [rip + 0x466f9b]
1459462c5: f30f5dd1 minss xmm2, xmm1
1459462c9: f2410f108e74010000 movsd xmm1, qword ptr [r14 + 0x174]
1459462d2: f2410f109e80010000 movsd xmm3, qword ptr [r14 + 0x180]
1459462db: 0f5cd9 subps xmm3, xmm1
1459462de: f3440f12ca movsldup xmm9, xmm2
1459462e3: 440f59cb mulps xmm9, xmm3
1459462e7: 440f58c9 addps xmm9, xmm1
1459462eb: f3410f108e7c010000 movss xmm1, dword ptr [r14 + 0x17c]
1459462f4: f3450f109688010000 movss xmm10, dword ptr [r14 + 0x188]
1459462fd: f3440f5cd1 subss xmm10, xmm1
145946302: f3440f59d2 mulss xmm10, xmm2
145946307: f3440f58d1 addss xmm10, xmm1
14594630c: e9b7000000 jmp 0x1459463c8
