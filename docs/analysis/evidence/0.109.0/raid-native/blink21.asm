14595a587: 8b01 mov eax, dword ptr [rcx]
14595a589: 898550010000 mov dword ptr [rbp + 0x150], eax
14595a58f: 0f107104 movups xmm6, xmmword ptr [rcx + 4]
14595a593: f3440f108578010000 movss xmm8, dword ptr [rbp + 0x178]
14595a59c: 410f28c0 movaps xmm0, xmm8
14595a5a0: e878fb2900 call 0x145bfa11d
14595a5a5: 0f28f8 movaps xmm7, xmm0
14595a5a8: 410f28c0 movaps xmm0, xmm8
14595a5ac: e866fb2900 call 0x145bfa117
14595a5b1: 0f14f8 unpcklps xmm7, xmm0
14595a5b4: f30f12c6 movsldup xmm0, xmm6
14595a5b8: 0f59c7 mulps xmm0, xmm7
14595a5bb: 0f5885d0000000 addps xmm0, xmmword ptr [rbp + 0xd0]
14595a5c2: 0f1385c0000000 movlps qword ptr [rbp + 0xc0], xmm0
14595a5c9: f3440f119dc8000000 movss dword ptr [rbp + 0xc8], xmm11
14595a5d2: 4c8bb698090000 mov r14, qword ptr [rsi + 0x998]
14595a5d9: 49837e40ff cmp qword ptr [r14 + 0x40], -1
14595a5de: 0f84051b0000 je 0x14595c0e9
14595a5e4: 4983c640 add r14, 0x40
14595a5e8: 488d4d30 lea rcx, [rbp + 0x30]
14595a5ec: 4c8d45f0 lea r8, [rbp - 0x10]
14595a5f0: 4c8d8dc0000000 lea r9, [rbp + 0xc0]
14595a5f7: 4c89f2 mov rdx, r14
14595a5fa: e89176f7ff call 0x1458d1c90
14595a5ff: 4c8bb698090000 mov r14, qword ptr [rsi + 0x998]
14595a606: e9f21a0000 jmp 0x14595c0fd
