145958665: 448b39 mov r15d, dword ptr [rcx]
145958668: 440f288550010000 movaps xmm8, xmmword ptr [rbp + 0x150]
145958670: 410f28c0 movaps xmm0, xmm8
145958674: 0f5c85d0000000 subps xmm0, xmmword ptr [rbp + 0xd0]
14595867b: 0f59c0 mulps xmm0, xmm0
14595867e: f30f16c8 movshdup xmm1, xmm0
145958682: f30f58c8 addss xmm1, xmm0
145958686: f30f51f9 sqrtss xmm7, xmm1
14595868a: f30f583df6c24700 addss xmm7, dword ptr [rip + 0x47c2f6]
145958692: f3440f108d78010000 movss xmm9, dword ptr [rbp + 0x178]
14595869b: 410f28c1 movaps xmm0, xmm9
14595869f: e8791a2a00 call 0x145bfa11d
1459586a4: 0f28f0 movaps xmm6, xmm0
1459586a7: 410f28c1 movaps xmm0, xmm9
1459586ab: e8671a2a00 call 0x145bfa117
1459586b0: 0f14f0 unpcklps xmm6, xmm0
1459586b3: f30f12c7 movsldup xmm0, xmm7
1459586b7: 0f59c6 mulps xmm0, xmm6
1459586ba: 410f58c0 addps xmm0, xmm8
1459586be: 0f1385c0000000 movlps qword ptr [rbp + 0xc0], xmm0
1459586c5: f3440f119dc8000000 movss dword ptr [rbp + 0xc8], xmm11
1459586ce: 488b9698090000 mov rdx, qword ptr [rsi + 0x998]
1459586d5: 48837a40ff cmp qword ptr [rdx + 0x40], -1
1459586da: 0f8464380000 je 0x14595bf44
1459586e0: 450f28e2 movaps xmm12, xmm10
1459586e4: 4883c240 add rdx, 0x40
1459586e8: 488d4d78 lea rcx, [rbp + 0x78]
1459586ec: 4c8d85a8000000 lea r8, [rbp + 0xa8]
1459586f3: 4c8d8dc0000000 lea r9, [rbp + 0xc0]
1459586fa: e89195f7ff call 0x1458d1c90
1459586ff: 488b9698090000 mov rdx, qword ptr [rsi + 0x998]
145958706: e954380000 jmp 0x14595bf5f
