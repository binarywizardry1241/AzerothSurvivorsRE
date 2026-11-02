1458f7312: 488d056f862f01 lea rax, [rip + 0x12f866f]
1458f7319: f60001 test byte ptr [rax], 1
1458f731c: 4489bd28040000 mov dword ptr [rbp + 0x428], r15d
1458f7323: 7534 jne 0x1458f7359
1458f7325: e9f1020000 jmp 0x1458f761b
1458f732a: 4531ff xor r15d, r15d
1458f732d: 410fb6851c030000 movzx eax, byte ptr [r13 + 0x31c]
1458f7335: 04fe add al, 0xfe
1458f7337: 3c09 cmp al, 9
1458f7339: 77d7 ja 0x1458f7312
1458f733b: 0fb6c0 movzx eax, al
1458f733e: 488d0dd3fd3001 lea rcx, [rip + 0x130fdd3]
1458f7345: 488b04c1 mov rax, qword ptr [rcx + rax*8]
1458f7349: f60001 test byte ptr [rax], 1
1458f734c: 4489bd28040000 mov dword ptr [rbp + 0x428], r15d
1458f7353: 0f84c2020000 je 0x1458f761b
1458f7359: 4d8b8508080000 mov r8, qword ptr [r13 + 0x808]
1458f7360: 4d85c0 test r8, r8
1458f7363: 7419 je 0x1458f737e
1458f7365: 498b8d00080000 mov rcx, qword ptr [r13 + 0x800]
1458f736c: 4983f801 cmp r8, 1
1458f7370: 7516 jne 0x1458f7388
1458f7372: f30f103d76114b00 movss xmm7, dword ptr [rip + 0x4b1176]
1458f737a: 31d2 xor edx, edx
1458f737c: eb5d jmp 0x1458f73db
1458f737e: f30f103dea0e4b00 movss xmm7, dword ptr [rip + 0x4b0eea]
1458f7386: eb67 jmp 0x1458f73ef
1458f7388: 4d89c1 mov r9, r8
1458f738b: 4983e1fe and r9, 0xfffffffffffffffe
1458f738f: f30f103d59114b00 movss xmm7, dword ptr [rip + 0x4b1159]
1458f7397: 31d2 xor edx, edx
1458f7399: eb0e jmp 0x1458f73a9
1458f739b: 0f1f440000 nop dword ptr [rax + rax]
1458f73a0: 4883c202 add rdx, 2
1458f73a4: 4939d1 cmp r9, rdx
1458f73a7: 742c je 0x1458f73d5
1458f73a9: 803cd110 cmp byte ptr [rcx + rdx*8], 0x10
1458f73ad: 7411 je 0x1458f73c0
1458f73af: 807cd10810 cmp byte ptr [rcx + rdx*8 + 8], 0x10
1458f73b4: 75ea jne 0x1458f73a0
1458f73b6: eb15 jmp 0x1458f73cd
1458f73b8: 0f1f840000000000 nop dword ptr [rax + rax]
1458f73c0: f30f587cd104 addss xmm7, dword ptr [rcx + rdx*8 + 4]
1458f73c6: 807cd10810 cmp byte ptr [rcx + rdx*8 + 8], 0x10
1458f73cb: 75d3 jne 0x1458f73a0
1458f73cd: f30f587cd10c addss xmm7, dword ptr [rcx + rdx*8 + 0xc]
1458f73d3: ebcb jmp 0x1458f73a0
1458f73d5: 41f6c001 test r8b, 1
1458f73d9: 740c je 0x1458f73e7
1458f73db: 803cd110 cmp byte ptr [rcx + rdx*8], 0x10
1458f73df: 7506 jne 0x1458f73e7
1458f73e1: f30f587cd104 addss xmm7, dword ptr [rcx + rdx*8 + 4]
1458f73e7: f30f583d810e4b00 addss xmm7, dword ptr [rip + 0x4b0e81]
1458f73ef: f3440f104808 movss xmm9, dword ptr [rax + 8]
1458f73f5: f30f10580c movss xmm3, dword ptr [rax + 0xc]
1458f73fa: f3440f105004 movss xmm10, dword ptr [rax + 4]
1458f7400: f3410f108548050000 movss xmm0, dword ptr [r13 + 0x548]
1458f7409: f30f5cc6 subss xmm0, xmm6
1458f740d: f3410f118548050000 movss dword ptr [r13 + 0x548], xmm0
1458f7416: 0f57c9 xorps xmm1, xmm1
1458f7419: 0f2ec8 ucomiss xmm1, xmm0
1458f741c: 0f82f9010000 jb 0x1458f761b
1458f7422: 418b85e0040000 mov eax, dword ptr [r13 + 0x4e0]
1458f7429: 8985a8000000 mov dword ptr [rbp + 0xa8], eax
1458f742f: 498b85d8040000 mov rax, qword ptr [r13 + 0x4d8]
1458f7436: 488985a0000000 mov qword ptr [rbp + 0xa0], rax
1458f743d: 4488bd47040000 mov byte ptr [rbp + 0x447], r15b
1458f7444: 488d8df0020000 lea rcx, [rbp + 0x2f0]
1458f744b: 4c8d85a0000000 lea r8, [rbp + 0xa0]
1458f7452: 4c89ea mov rdx, r13
1458f7455: e846ed0200 call 0x1459261a0
1458f745a: 90 nop
1458f745b: 488b8df8020000 mov rcx, qword ptr [rbp + 0x2f8]
1458f7462: 4883bd0003000000 cmp qword ptr [rbp + 0x300], 0
1458f746a: 0f843b100000 je 0x1458f84ab
1458f7470: f3440f5915dff04b00 mulss xmm10, dword ptr [rip + 0x4bf0df]
1458f7479: f3410f59fa mulss xmm7, xmm10
1458f747e: 498b95c0090000 mov rdx, qword ptr [r13 + 0x9c0]
1458f7485: 498b85d8090000 mov rax, qword ptr [r13 + 0x9d8]
1458f748c: 4c8d1c10 lea r11, [rax + rdx]
1458f7490: 49c1c317 rol r11, 0x17
1458f7494: 48898d10040000 mov qword ptr [rbp + 0x410], rcx
1458f749b: 488b39 mov rdi, qword ptr [rcx]
1458f749e: 4901d3 add r11, rdx
1458f74a1: 4d8b85c8090000 mov r8, qword ptr [r13 + 0x9c8]
1458f74a8: 4d89c1 mov r9, r8
1458f74ab: 49c1e111 shl r9, 0x11
1458f74af: 4d8b95d0090000 mov r10, qword ptr [r13 + 0x9d0]
1458f74b6: 4931d2 xor r10, rdx
1458f74b9: 4c31c0 xor rax, r8
1458f74bc: 4d31d0 xor r8, r10
1458f74bf: 4d8985c8090000 mov qword ptr [r13 + 0x9c8], r8
1458f74c6: 4831c2 xor rdx, rax
1458f74c9: 498995c0090000 mov qword ptr [r13 + 0x9c0], rdx
1458f74d0: 4d31ca xor r10, r9
1458f74d3: 4d8995d0090000 mov qword ptr [r13 + 0x9d0], r10
1458f74da: 48c1c02d rol rax, 0x2d
1458f74de: 49c1eb28 shr r11, 0x28
1458f74e2: 450f57d2 xorps xmm10, xmm10
1458f74e6: f3450f2ad3 cvtsi2ss xmm10, r11d
1458f74eb: 498985d8090000 mov qword ptr [r13 + 0x9d8], rax
1458f74f2: f3440f591555655c00 mulss xmm10, dword ptr [rip + 0x5c6555]
1458f74fb: f3450f109d94040000 movss xmm11, dword ptr [r13 + 0x494]
1458f7504: 450f2eda ucomiss xmm11, xmm10
1458f7508: f3410f59bd8c040000 mulss xmm7, dword ptr [r13 + 0x48c]
1458f7511: 7609 jbe 0x1458f751c
1458f7513: f3410f59bd98040000 mulss xmm7, dword ptr [r13 + 0x498]
1458f751c: 498b9570040000 mov rdx, qword ptr [r13 + 0x470]
1458f7523: 450f2eda ucomiss xmm11, xmm10
1458f7527: 0f97442420 seta byte ptr [rsp + 0x20]
1458f752c: f3480f2cc7 cvttss2si rax, xmm7
1458f7531: 31c9 xor ecx, ecx
1458f7533: 0f57c0 xorps xmm0, xmm0
1458f7536: 0f2ef8 ucomiss xmm7, xmm0
1458f7539: 0f43c8 cmovae ecx, eax
1458f753c: 0f2e3d21a64b00 ucomiss xmm7, dword ptr [rip + 0x4ba621]
1458f7543: 41b9ffffffff mov r9d, 0xffffffff
1458f7549: 440f46c9 cmovbe r9d, ecx
1458f754d: 488d8da0000000 lea rcx, [rbp + 0xa0]
1458f7554: 4989f8 mov r8, rdi
1458f7557: e82489fcff call 0x1458bfe80
1458f755c: 90 nop
1458f755d: 498bb538060000 mov rsi, qword ptr [r13 + 0x638]
1458f7564: 493bb528060000 cmp rsi, qword ptr [r13 + 0x628]
1458f756b: 750d jne 0x1458f757a
1458f756d: 498d8d28060000 lea rcx, [r13 + 0x628]
1458f7574: e857113100 call 0x145c086d0
1458f7579: 90 nop
1458f757a: 498b8530060000 mov rax, qword ptr [r13 + 0x630]
1458f7581: 4889f1 mov rcx, rsi
1458f7584: 48c1e105 shl rcx, 5
1458f7588: 0f1085a0000000 movups xmm0, xmmword ptr [rbp + 0xa0]
1458f758f: 0f108db0000000 movups xmm1, xmmword ptr [rbp + 0xb0]
1458f7596: 0f114c0810 movups xmmword ptr [rax + rcx + 0x10], xmm1
1458f759b: 0f110408 movups xmmword ptr [rax + rcx], xmm0
1458f759f: 48ffc6 inc rsi
1458f75a2: 4989b538060000 mov qword ptr [r13 + 0x638], rsi
1458f75a9: 450f2eda ucomiss xmm11, xmm10
1458f75ad: 0f97442428 seta byte ptr [rsp + 0x28]
1458f75b2: c644243001 mov byte ptr [rsp + 0x30], 1
1458f75b7: c644242000 mov byte ptr [rsp + 0x20], 0
1458f75bc: 4c89e9 mov rcx, r13
1458f75bf: 4889fa mov rdx, rdi
1458f75c2: 0f28d7 movaps xmm2, xmm7
1458f75c5: 4531c9 xor r9d, r9d
1458f75c8: e8e3230400 call 0x1459399b0
1458f75cd: 90 nop
1458f75ce: f3440f590de9ef4b00 mulss xmm9, dword ptr [rip + 0x4befe9]
1458f75d7: f3410f108590040000 movss xmm0, dword ptr [r13 + 0x490]
1458f75e0: f30f51c0 sqrtss xmm0, xmm0
1458f75e4: f3410f59c1 mulss xmm0, xmm9
1458f75e9: 448bbd28040000 mov r15d, dword ptr [rbp + 0x428]
1458f75f0: 488b8d10040000 mov rcx, qword ptr [rbp + 0x410]
1458f75f7: f3410f118548050000 movss dword ptr [r13 + 0x548], xmm0
1458f7600: 488b95f0020000 mov rdx, qword ptr [rbp + 0x2f0]
1458f7607: 4885d2 test rdx, rdx
1458f760a: 740f je 0x1458f761b
1458f760c: 48c1e203 shl rdx, 3
1458f7610: 41b808000000 mov r8d, 8
1458f7616: e8b5ab70fa call 0x1400021d0
