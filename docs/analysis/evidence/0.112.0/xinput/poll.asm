14031d0a0: 55 push rbp
14031d0a1: 4157 push r15
14031d0a3: 4156 push r14
14031d0a5: 4155 push r13
14031d0a7: 4154 push r12
14031d0a9: 56 push rsi
14031d0aa: 57 push rdi
14031d0ab: 53 push rbx
14031d0ac: 4881ece8020000 sub rsp, 0x2e8
14031d0b3: 488dac2480000000 lea rbp, [rsp + 0x80]
14031d0bb: 440f29ad50020000 movaps xmmword ptr [rbp + 0x250], xmm13
14031d0c3: 66440f7fa540020000 movdqa xmmword ptr [rbp + 0x240], xmm12
14031d0cc: 440f299d30020000 movaps xmmword ptr [rbp + 0x230], xmm11
14031d0d4: 440f299520020000 movaps xmmword ptr [rbp + 0x220], xmm10
14031d0dc: 440f298d10020000 movaps xmmword ptr [rbp + 0x210], xmm9
14031d0e4: 440f298500020000 movaps xmmword ptr [rbp + 0x200], xmm8
14031d0ec: 0f29bdf0010000 movaps xmmword ptr [rbp + 0x1f0], xmm7
14031d0f3: 0f29b5e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm6
14031d0fa: 48c785d8010000feffffff mov qword ptr [rbp + 0x1d8], 0xfffffffffffffffe
14031d105: 488b85e8020000 mov rax, qword ptr [rbp + 0x2e8]
14031d10c: 488b8de0020000 mov rcx, qword ptr [rbp + 0x2e0]
14031d113: 4c8b95d8020000 mov r10, qword ptr [rbp + 0x2d8]
14031d11a: 4c8b9dd0020000 mov r11, qword ptr [rbp + 0x2d0]
14031d121: 488b7220 mov rsi, qword ptr [rdx + 0x20]
14031d125: 488975c0 mov qword ptr [rbp - 0x40], rsi
14031d129: 0f1002 movups xmm0, xmmword ptr [rdx]
14031d12c: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
14031d130: 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
14031d134: 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
14031d138: 410f1000 movups xmm0, xmmword ptr [r8]
14031d13c: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
14031d141: 0f114dd8 movups xmmword ptr [rbp - 0x28], xmm1
14031d145: 0f1145c8 movups xmmword ptr [rbp - 0x38], xmm0
14031d149: 410f1001 movups xmm0, xmmword ptr [r9]
14031d14d: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
14031d152: 0f114df8 movups xmmword ptr [rbp - 8], xmm1
14031d156: 0f1145e8 movups xmmword ptr [rbp - 0x18], xmm0
14031d15a: 410f1003 movups xmm0, xmmword ptr [r11]
14031d15e: 410f104b10 movups xmm1, xmmword ptr [r11 + 0x10]
14031d163: 0f114d18 movups xmmword ptr [rbp + 0x18], xmm1
14031d167: 0f114508 movups xmmword ptr [rbp + 8], xmm0
14031d16b: 410f1002 movups xmm0, xmmword ptr [r10]
14031d16f: 410f104a10 movups xmm1, xmmword ptr [r10 + 0x10]
14031d174: 0f114d38 movups xmmword ptr [rbp + 0x38], xmm1
14031d178: 0f114528 movups xmmword ptr [rbp + 0x28], xmm0
14031d17c: 0f1001 movups xmm0, xmmword ptr [rcx]
14031d17f: 0f104910 movups xmm1, xmmword ptr [rcx + 0x10]
14031d183: 0f114548 movups xmmword ptr [rbp + 0x48], xmm0
14031d187: 0f114d58 movups xmmword ptr [rbp + 0x58], xmm1
14031d18b: 0f1000 movups xmm0, xmmword ptr [rax]
14031d18e: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
14031d192: 0f114568 movups xmmword ptr [rbp + 0x68], xmm0
14031d196: 0f114d78 movups xmmword ptr [rbp + 0x78], xmm1
14031d19a: 488b45e8 mov rax, qword ptr [rbp - 0x18]
14031d19e: f30f10b08c000000 movss xmm6, dword ptr [rax + 0x8c]
14031d1a6: 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
14031d1aa: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14031d1ae: 48898548010000 mov qword ptr [rbp + 0x148], rax
14031d1b5: f3410f107c2468 movss xmm7, dword ptr [r12 + 0x68]
14031d1bc: 0f2ef7 ucomiss xmm6, xmm7
14031d1bf: 8b45e4 mov eax, dword ptr [rbp - 0x1c]
14031d1c2: 8985b0010000 mov dword ptr [rbp + 0x1b0], eax
14031d1c8: 7222 jb 0x14031d1ec
14031d1ca: 488b8548010000 mov rax, qword ptr [rbp + 0x148]
14031d1d1: 8b8db0010000 mov ecx, dword ptr [rbp + 0x1b0]
14031d1d7: 8908 mov dword ptr [rax], ecx
14031d1d9: f30f10058700a905 movss xmm0, dword ptr [rip + 0x5a90087]
14031d1e1: f30f58c6 addss xmm0, xmm6
14031d1e5: f3410f11442468 movss dword ptr [r12 + 0x68], xmm0
14031d1ec: 4d8d4c2408 lea r9, [r12 + 8]
14031d1f1: 8b4544 mov eax, dword ptr [rbp + 0x44]
14031d1f4: 898560010000 mov dword ptr [rbp + 0x160], eax
14031d1fa: 488b4528 mov rax, qword ptr [rbp + 0x28]
14031d1fe: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
14031d202: 48898d00010000 mov qword ptr [rbp + 0x100], rcx
14031d209: 48898550010000 mov qword ptr [rbp + 0x150], rax
14031d210: 4883c020 add rax, 0x20
14031d214: 48898510010000 mov qword ptr [rbp + 0x110], rax
14031d21b: 450f57c0 xorps xmm8, xmm8
14031d21f: f3440f100d84dea905 movss xmm9, dword ptr [rip + 0x5a9de84]
14031d228: f3440f10152f00a905 movss xmm10, dword ptr [rip + 0x5a9002f]
14031d231: 66440f6e1d06fbae05 movd xmm11, dword ptr [rip + 0x5aefb06]
14031d23a: 48c785b801000000000000 mov qword ptr [rbp + 0x1b8], 0
14031d245: 4c89a508010000 mov qword ptr [rbp + 0x108], r12
14031d24c: 4c898d58010000 mov qword ptr [rbp + 0x158], r9
14031d253: eb42 jmp 0x14031d297
14031d255: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14031d260: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
14031d267: 488b4228 mov rax, qword ptr [rdx + 0x28]
14031d26b: 488d0c7f lea rcx, [rdi + rdi*2]
14031d26f: 48c1e104 shl rcx, 4
14031d273: 48c70408ffffffff mov qword ptr [rax + rcx], 0xffffffffffffffff
14031d27b: 4889740820 mov qword ptr [rax + rcx + 0x20], rsi
14031d280: 48895c0828 mov qword ptr [rax + rcx + 0x28], rbx
14031d285: 48ffc7 inc rdi
14031d288: 48897a30 mov qword ptr [rdx + 0x30], rdi
14031d28c: 48ff4240 inc qword ptr [rdx + 0x40]
14031d290: 4c8b8d58010000 mov r9, qword ptr [rbp + 0x158]
14031d297: 488b85b8010000 mov rax, qword ptr [rbp + 0x1b8]
14031d29e: 4883f804 cmp rax, 4
14031d2a2: 0f83370a0000 jae 0x14031dcdf
14031d2a8: 488d4801 lea rcx, [rax + 1]
14031d2ac: 0f2ef7 ucomiss xmm6, xmm7
14031d2af: 488d1440 lea rdx, [rax + rax*2]
14031d2b3: 498d3cd1 lea rdi, [r9 + rdx*8]
14031d2b7: 0f8383000000 jae 0x14031d340
14031d2bd: 41833cd100 cmp dword ptr [r9 + rdx*8], 0
14031d2c2: 0f8578000000 jne 0x14031d340
14031d2c8: 4883f803 cmp rax, 3
14031d2cc: 0f840d0a0000 je 0x14031dcdf
14031d2d2: 488d5002 lea rdx, [rax + 2]
14031d2d6: 0f2ef7 ucomiss xmm6, xmm7
14031d2d9: 4c8d0449 lea r8, [rcx + rcx*2]
14031d2dd: 4b8d3cc1 lea rdi, [r9 + r8*8]
14031d2e1: 736d jae 0x14031d350
14031d2e3: 43833cc100 cmp dword ptr [r9 + r8*8], 0
14031d2e8: 7566 jne 0x14031d350
14031d2ea: 4883f801 cmp rax, 1
14031d2ee: 0f87eb090000 ja 0x14031dcdf
14031d2f4: 488d4803 lea rcx, [rax + 3]
14031d2f8: 0f2ef7 ucomiss xmm6, xmm7
14031d2fb: 4c8d0452 lea r8, [rdx + rdx*2]
14031d2ff: 4b8d3cc1 lea rdi, [r9 + r8*8]
14031d303: 7354 jae 0x14031d359
14031d305: 43833cc100 cmp dword ptr [r9 + r8*8], 0
14031d30a: 754d jne 0x14031d359
14031d30c: 4885c0 test rax, rax
14031d30f: 0f85ca090000 jne 0x14031dcdf
14031d315: 0f2ef7 ucomiss xmm6, xmm7
14031d318: 488d0449 lea rax, [rcx + rcx*2]
14031d31c: 498d3cc1 lea rdi, [r9 + rax*8]
14031d320: ba04000000 mov edx, 4
14031d325: 488995b8010000 mov qword ptr [rbp + 0x1b8], rdx
14031d32c: 7342 jae 0x14031d370
14031d32e: 41833cc100 cmp dword ptr [r9 + rax*8], 0
14031d333: 753b jne 0x14031d370
14031d335: e9a5090000 jmp 0x14031dcdf
14031d33a: 660f1f440000 nop word ptr [rax + rax]
14031d340: 48898db8010000 mov qword ptr [rbp + 0x1b8], rcx
14031d347: 4889c1 mov rcx, rax
14031d34a: eb24 jmp 0x14031d370
14031d34c: 0f1f4000 nop dword ptr [rax]
14031d350: 488995b8010000 mov qword ptr [rbp + 0x1b8], rdx
14031d357: eb17 jmp 0x14031d370
14031d359: 48898db8010000 mov qword ptr [rbp + 0x1b8], rcx
14031d360: 4889d1 mov rcx, rdx
14031d363: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14031d370: 440f298520010000 movaps xmmword ptr [rbp + 0x120], xmm8
14031d378: 488d9520010000 lea rdx, [rbp + 0x120]
14031d37f: 41ff1424 call qword ptr [r12]
14031d383: 448b2f mov r13d, dword ptr [rdi]
14031d386: 8b7704 mov esi, dword ptr [rdi + 4]
14031d389: 440fb75f08 movzx r11d, word ptr [rdi + 8]
14031d38e: 0fb64f0a movzx ecx, byte ptr [rdi + 0xa]
14031d392: 0fb6570b movzx edx, byte ptr [rdi + 0xb]
14031d396: 8995c0010000 mov dword ptr [rbp + 0x1c0], edx
14031d39c: 0fb7570e movzx edx, word ptr [rdi + 0xe]
14031d3a0: 8995b4010000 mov dword ptr [rbp + 0x1b4], edx
14031d3a6: 0fb7570c movzx edx, word ptr [rdi + 0xc]
14031d3aa: 668995d4010000 mov word ptr [rbp + 0x1d4], dx
14031d3b1: 440fb74710 movzx r8d, word ptr [rdi + 0x10]
14031d3b6: 440fb74f12 movzx r9d, word ptr [rdi + 0x12]
14031d3bb: 8b5714 mov edx, dword ptr [rdi + 0x14]
14031d3be: 4d85ed test r13, r13
14031d3c1: 0f84b9000000 je 0x14031d480
14031d3c7: 85c0 test eax, eax
14031d3c9: 0f8421020000 je 0x14031d5f0
14031d3cf: 488b8548010000 mov rax, qword ptr [rbp + 0x148]
14031d3d6: 8b8db0010000 mov ecx, dword ptr [rbp + 0x1b0]
14031d3dc: 8908 mov dword ptr [rax], ecx
14031d3de: c70700000000 mov dword ptr [rdi], 0
14031d3e4: 8b4524 mov eax, dword ptr [rbp + 0x24]
14031d3e7: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14031d3eb: 8901 mov dword ptr [rcx], eax
14031d3ed: 488b7d08 mov rdi, qword ptr [rbp + 8]
14031d3f1: 4c8b7730 mov r14, qword ptr [rdi + 0x30]
14031d3f5: 488b5f40 mov rbx, qword ptr [rdi + 0x40]
14031d3f9: 4c3b7720 cmp r14, qword ptr [rdi + 0x20]
14031d3fd: 750a jne 0x14031d409
14031d3ff: 488d4f20 lea rcx, [rdi + 0x20]
14031d403: e878068f05 call 0x145c0da80
14031d408: 90 nop
14031d409: 48c1e620 shl rsi, 0x20
14031d40d: 4c09ee or rsi, r13
14031d410: 488b4728 mov rax, qword ptr [rdi + 0x28]
14031d414: 4b8d0c76 lea rcx, [r14 + r14*2]
14031d418: 48c1e104 shl rcx, 4
14031d41c: 48c70408ffffffff mov qword ptr [rax + rcx], 0xffffffffffffffff
14031d424: 4889740820 mov qword ptr [rax + rcx + 0x20], rsi
14031d429: 48895c0828 mov qword ptr [rax + rcx + 0x28], rbx
14031d42e: 49ffc6 inc r14
14031d431: 4c897730 mov qword ptr [rdi + 0x30], r14
14031d435: 48ff4740 inc qword ptr [rdi + 0x40]
14031d439: 8b8560010000 mov eax, dword ptr [rbp + 0x160]
14031d43f: 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
14031d446: 8901 mov dword ptr [rcx], eax
14031d448: 488b8550010000 mov rax, qword ptr [rbp + 0x150]
14031d44f: 488b7830 mov rdi, qword ptr [rax + 0x30]
14031d453: 488b5840 mov rbx, qword ptr [rax + 0x40]
14031d457: 483b7820 cmp rdi, qword ptr [rax + 0x20]
14031d45b: 0f85fffdffff jne 0x14031d260
14031d461: 488b8d10010000 mov rcx, qword ptr [rbp + 0x110]
14031d468: e813068f05 call 0x145c0da80
14031d46d: e9eefdffff jmp 0x14031d260
14031d472: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14031d480: 85c0 test eax, eax
14031d482: 0f8508feffff jne 0x14031d290
14031d488: c7859001000000000000 mov dword ptr [rbp + 0x190], 0
14031d492: 89b594010000 mov dword ptr [rbp + 0x194], esi
14031d498: 6644899d98010000 mov word ptr [rbp + 0x198], r11w
14031d4a0: 888d9a010000 mov byte ptr [rbp + 0x19a], cl
14031d4a6: 8b85c0010000 mov eax, dword ptr [rbp + 0x1c0]
14031d4ac: 88859b010000 mov byte ptr [rbp + 0x19b], al
14031d4b2: 0fb785d4010000 movzx eax, word ptr [rbp + 0x1d4]
14031d4b9: 6689859c010000 mov word ptr [rbp + 0x19c], ax
14031d4c0: 8b85b4010000 mov eax, dword ptr [rbp + 0x1b4]
14031d4c6: 6689859e010000 mov word ptr [rbp + 0x19e], ax
14031d4cd: 66448985a0010000 mov word ptr [rbp + 0x1a0], r8w
14031d4d5: 6644898da2010000 mov word ptr [rbp + 0x1a2], r9w
14031d4dd: 8995a4010000 mov dword ptr [rbp + 0x1a4], edx
14031d4e3: 4c8da5b0000000 lea r12, [rbp + 0xb0]
14031d4ea: 4c89e1 mov rcx, r12
14031d4ed: 488d55a0 lea rdx, [rbp - 0x60]
14031d4f1: 4c8d052895af05 lea r8, [rip + 0x5af9528]
14031d4f8: e8d343b604 call 0x144e818d0
14031d4fd: 448bbdb0000000 mov r15d, dword ptr [rbp + 0xb0]
14031d504: 8bb5b4000000 mov esi, dword ptr [rbp + 0xb4]
14031d50a: 488b85b8010000 mov rax, qword ptr [rbp + 0x1b8]
14031d511: 48898598000000 mov qword ptr [rbp + 0x98], rax
14031d518: 488d8598000000 lea rax, [rbp + 0x98]
14031d51f: 48898588000000 mov qword ptr [rbp + 0x88], rax
14031d526: 488d05a3258d05 lea rax, [rip + 0x58d25a3]
14031d52d: 48898590000000 mov qword ptr [rbp + 0x90], rax
14031d534: 488d9d70010000 lea rbx, [rbp + 0x170]
14031d53b: 4889d9 mov rcx, rbx
14031d53e: 488d15f394af05 lea rdx, [rip + 0x5af94f3]
14031d545: 4c8d8588000000 lea r8, [rbp + 0x88]
14031d54c: e8dffb8b05 call 0x145bdd130
14031d551: 4489bdd0000000 mov dword ptr [rbp + 0xd0], r15d
14031d558: 89b5d4000000 mov dword ptr [rbp + 0xd4], esi
14031d55e: 0f108570010000 movups xmm0, xmmword ptr [rbp + 0x170]
14031d565: 0f2985b0000000 movaps xmmword ptr [rbp + 0xb0], xmm0
14031d56c: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14031d573: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14031d57a: 66c785c80000000000 mov word ptr [rbp + 0xc8], 0
14031d583: 66c785cc0000000000 mov word ptr [rbp + 0xcc], 0
14031d58c: 4c8bb5d0000000 mov r14, qword ptr [rbp + 0xd0]
14031d593: 4883bdb0000000ff cmp qword ptr [rbp + 0xb0], -1
14031d59b: 4c89ada0000000 mov qword ptr [rbp + 0xa0], r13
14031d5a2: 0f84c0000000 je 0x14031d668
14031d5a8: c685d701000001 mov byte ptr [rbp + 0x1d7], 1
14031d5af: 4889d9 mov rcx, rbx
14031d5b2: 4c89e2 mov rdx, r12
14031d5b5: e836008c05 call 0x145bdd5f0
14031d5ba: 90 nop
14031d5bb: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14031d5c2: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14031d5c9: 488b8578010000 mov rax, qword ptr [rbp + 0x178]
14031d5d0: 48898518010000 mov qword ptr [rbp + 0x118], rax
14031d5d7: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14031d5de: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
14031d5e5: e989000000 jmp 0x14031d673
14031d5ea: 660f1f440000 nop word ptr [rax + rax]
14031d5f0: 660f6e470c movd xmm0, dword ptr [rdi + 0xc]
14031d5f5: 4489ad90010000 mov dword ptr [rbp + 0x190], r13d
14031d5fc: 89b594010000 mov dword ptr [rbp + 0x194], esi
14031d602: 6644899d98010000 mov word ptr [rbp + 0x198], r11w
14031d60a: 888d9a010000 mov byte ptr [rbp + 0x19a], cl
14031d610: 8b85c0010000 mov eax, dword ptr [rbp + 0x1c0]
14031d616: 88859b010000 mov byte ptr [rbp + 0x19b], al
14031d61c: 0fb785d4010000 movzx eax, word ptr [rbp + 0x1d4]
14031d623: 6689859c010000 mov word ptr [rbp + 0x19c], ax
14031d62a: 8b85b4010000 mov eax, dword ptr [rbp + 0x1b4]
14031d630: 6689859e010000 mov word ptr [rbp + 0x19e], ax
14031d637: 66448985a0010000 mov word ptr [rbp + 0x1a0], r8w
14031d63f: 6644898da2010000 mov word ptr [rbp + 0x1a2], r9w
14031d647: 44898564010000 mov dword ptr [rbp + 0x164], r8d
14031d64e: 66410fc4c002 pinsrw xmm0, r8d, 2
14031d654: 8995a4010000 mov dword ptr [rbp + 0x1a4], edx
14031d65a: 66410fc4c303 pinsrw xmm0, r11d, 3
14031d660: 4589ef mov r15d, r13d
14031d663: e986010000 jmp 0x14031d7ee
14031d668: 48c785c8010000ffffffff mov qword ptr [rbp + 0x1c8], 0xffffffffffffffff
14031d673: 8b4524 mov eax, dword ptr [rbp + 0x24]
14031d676: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14031d67a: 8901 mov dword ptr [rcx], eax
14031d67c: 4c8b6508 mov r12, qword ptr [rbp + 8]
14031d680: 498b5c2430 mov rbx, qword ptr [r12 + 0x30]
14031d685: 4d8b6c2440 mov r13, qword ptr [r12 + 0x40]
14031d68a: 493b5c2420 cmp rbx, qword ptr [r12 + 0x20]
14031d68f: 750b jne 0x14031d69c
14031d691: 498d4c2420 lea rcx, [r12 + 0x20]
14031d696: e8e5038f05 call 0x145c0da80
14031d69b: 90 nop
14031d69c: 498b442428 mov rax, qword ptr [r12 + 0x28]
14031d6a1: 488d0c5b lea rcx, [rbx + rbx*2]
14031d6a5: 48c1e104 shl rcx, 4
14031d6a9: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14031d6b0: 48891408 mov qword ptr [rax + rcx], rdx
14031d6b4: 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
14031d6bb: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14031d6c0: 488b95a8000000 mov rdx, qword ptr [rbp + 0xa8]
14031d6c7: 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
14031d6cc: 66c74408180000 mov word ptr [rax + rcx + 0x18], 0
14031d6d3: 66c744081c0000 mov word ptr [rax + rcx + 0x1c], 0
14031d6da: 4c89740820 mov qword ptr [rax + rcx + 0x20], r14
14031d6df: 4c896c0828 mov qword ptr [rax + rcx + 0x28], r13
14031d6e4: 48ffc3 inc rbx
14031d6e7: 49895c2430 mov qword ptr [r12 + 0x30], rbx
14031d6ec: 49ff442440 inc qword ptr [r12 + 0x40]
14031d6f1: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
14031d6f8: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14031d6ff: 488b85b8000000 mov rax, qword ptr [rbp + 0xb8]
14031d706: 48898568010000 mov qword ptr [rbp + 0x168], rax
14031d70d: 488d85c0000000 lea rax, [rbp + 0xc0]
14031d714: 0f1000 movups xmm0, xmmword ptr [rax]
14031d717: 0f298570010000 movaps xmmword ptr [rbp + 0x170], xmm0
14031d71e: 488b4010 mov rax, qword ptr [rax + 0x10]
14031d722: 48898580010000 mov qword ptr [rbp + 0x180], rax
14031d729: 8b8560010000 mov eax, dword ptr [rbp + 0x160]
14031d72f: 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
14031d736: 8901 mov dword ptr [rcx], eax
14031d738: 488b8550010000 mov rax, qword ptr [rbp + 0x150]
14031d73f: 488b5830 mov rbx, qword ptr [rax + 0x30]
14031d743: 4c8b7040 mov r14, qword ptr [rax + 0x40]
14031d747: 483b5820 cmp rbx, qword ptr [rax + 0x20]
14031d74b: 750d jne 0x14031d75a
14031d74d: 488b8d10010000 mov rcx, qword ptr [rbp + 0x110]
14031d754: e827038f05 call 0x145c0da80
14031d759: 90 nop
14031d75a: 4c8b8550010000 mov r8, qword ptr [rbp + 0x150]
14031d761: 498b4028 mov rax, qword ptr [r8 + 0x28]
14031d765: 488d0c5b lea rcx, [rbx + rbx*2]
14031d769: 48c1e104 shl rcx, 4
14031d76d: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14031d774: 48891408 mov qword ptr [rax + rcx], rdx
14031d778: 488b9568010000 mov rdx, qword ptr [rbp + 0x168]
14031d77f: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14031d784: 0f288570010000 movaps xmm0, xmmword ptr [rbp + 0x170]
14031d78b: 0f11440810 movups xmmword ptr [rax + rcx + 0x10], xmm0
14031d790: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14031d797: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
14031d79c: 4c89740828 mov qword ptr [rax + rcx + 0x28], r14
14031d7a1: 48ffc3 inc rbx
14031d7a4: 49895830 mov qword ptr [r8 + 0x30], rbx
14031d7a8: 49ff4040 inc qword ptr [r8 + 0x40]
14031d7ac: 66c785d40100000080 mov word ptr [rbp + 0x1d4], 0x8000
14031d7b5: 4531db xor r11d, r11d
14031d7b8: 31c9 xor ecx, ecx
14031d7ba: c785c001000000000000 mov dword ptr [rbp + 0x1c0], 0
14031d7c4: c785b401000000000000 mov dword ptr [rbp + 0x1b4], 0
14031d7ce: c7856401000000000000 mov dword ptr [rbp + 0x164], 0
14031d7d8: 4531c9 xor r9d, r9d
14031d7db: 66410f6fc3 movdqa xmm0, xmm11
14031d7e0: 4c8ba508010000 mov r12, qword ptr [rbp + 0x108]
14031d7e7: 4c8bada0000000 mov r13, qword ptr [rbp + 0xa0]
14031d7ee: 4489bd70010000 mov dword ptr [rbp + 0x170], r15d
14031d7f5: 89b574010000 mov dword ptr [rbp + 0x174], esi
14031d7fb: 440fb7b524010000 movzx r14d, word ptr [rbp + 0x124]
14031d803: 0fb6b526010000 movzx esi, byte ptr [rbp + 0x126]
14031d80a: 0fb69d27010000 movzx ebx, byte ptr [rbp + 0x127]
14031d811: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14031d818: f3440f7ea528010000 movq xmm12, qword ptr [rbp + 0x128]
14031d821: 66450fc5d403 pextrw r10d, xmm12, 3
14031d827: 488b9548010000 mov rdx, qword ptr [rbp + 0x148]
14031d82e: 448b85b0010000 mov r8d, dword ptr [rbp + 0x1b0]
14031d835: 448902 mov dword ptr [rdx], r8d
14031d838: 488907 mov qword ptr [rdi], rax
14031d83b: 6644897708 mov word ptr [rdi + 8], r14w
14031d840: 4088770a mov byte ptr [rdi + 0xa], sil
14031d844: 885f0b mov byte ptr [rdi + 0xb], bl
14031d847: 66440fd6670c movq qword ptr [rdi + 0xc], xmm12
14031d84d: 4038ce cmp sil, cl
14031d850: 0f94c2 sete dl
14031d853: 66410f6fcc movdqa xmm1, xmm12
14031d858: 4489b568010000 mov dword ptr [rbp + 0x168], r14d
14031d85f: 66410fc4ce03 pinsrw xmm1, r14d, 3
14031d865: 660f75c8 pcmpeqw xmm1, xmm0
14031d869: 664539ca cmp r10w, r9w
14031d86d: 0f94c0 sete al
14031d870: 660f61c9 punpcklwd xmm1, xmm1
14031d874: 0f50c9 movmskps ecx, xmm1
14031d877: 83f90f cmp ecx, 0xf
14031d87a: 7514 jne 0x14031d890
14031d87c: 84c0 test al, al
14031d87e: 7410 je 0x14031d890
14031d880: 84d2 test dl, dl
14031d882: 740c je 0x14031d890
14031d884: 3a9dc0010000 cmp bl, byte ptr [rbp + 0x1c0]
14031d88a: 0f8400faffff je 0x14031d290
14031d890: 8895c5010000 mov byte ptr [rbp + 0x1c5], dl
14031d896: 4088b5c7010000 mov byte ptr [rbp + 0x1c7], sil
14031d89d: 889dc6010000 mov byte ptr [rbp + 0x1c6], bl
14031d8a3: 4489953c010000 mov dword ptr [rbp + 0x13c], r10d
14031d8aa: 44898d38010000 mov dword ptr [rbp + 0x138], r9d
14031d8b1: 48c785b80000000e000000 mov qword ptr [rbp + 0xb8], 0xe
14031d8bc: 0f1005ad91af05 movups xmm0, xmmword ptr [rip + 0x5af91ad]
14031d8c3: 488d85c0000000 lea rax, [rbp + 0xc0]
14031d8ca: 0f114020 movups xmmword ptr [rax + 0x20], xmm0
14031d8ce: 0f10058b91af05 movups xmm0, xmmword ptr [rip + 0x5af918b]
14031d8d5: 0f114010 movups xmmword ptr [rax + 0x10], xmm0
14031d8d9: 0f10057091af05 movups xmm0, xmmword ptr [rip + 0x5af9170]
14031d8e0: 0f1100 movups xmmword ptr [rax], xmm0
14031d8e3: 48b90040030000800200 movabs rcx, 0x2800000034000
14031d8ed: 48894830 mov qword ptr [rax + 0x30], rcx
14031d8f1: 44339d68010000 xor r11d, dword ptr [rbp + 0x168]
14031d8f8: 8b4564 mov eax, dword ptr [rbp + 0x64]
14031d8fb: 8985ac010000 mov dword ptr [rbp + 0x1ac], eax
14031d901: 488b7548 mov rsi, qword ptr [rbp + 0x48]
14031d905: 488b4558 mov rax, qword ptr [rbp + 0x58]
14031d909: 48898540010000 mov qword ptr [rbp + 0x140], rax
14031d910: 31ff xor edi, edi
14031d912: 44899d34010000 mov dword ptr [rbp + 0x134], r11d
14031d919: eb45 jmp 0x14031d960
14031d91b: 0f1f440000 nop dword ptr [rax + rax]
14031d920: 488b4628 mov rax, qword ptr [rsi + 0x28]
14031d924: 488d0c5b lea rcx, [rbx + rbx*2]
14031d928: 4c892cc8 mov qword ptr [rax + rcx*8], r13
14031d92c: 4c897cc808 mov qword ptr [rax + rcx*8 + 8], r15
14031d931: f3440f116cc810 movss dword ptr [rax + rcx*8 + 0x10], xmm13
14031d938: 66448964c814 mov word ptr [rax + rcx*8 + 0x14], r12w
14031d93e: 48ffc3 inc rbx
14031d941: 48895e30 mov qword ptr [rsi + 0x30], rbx
14031d945: 48ff4640 inc qword ptr [rsi + 0x40]
14031d949: 4d89f5 mov r13, r14
14031d94c: 448b9d34010000 mov r11d, dword ptr [rbp + 0x134]
14031d953: 48ffc7 inc rdi
14031d956: 4883ff0e cmp rdi, 0xe
14031d95a: 0f84ed000000 je 0x14031da4d
14031d960: 448ba4bdc0000000 mov r12d, dword ptr [rbp + rdi*4 + 0xc0]
14031d968: 4489e0 mov eax, r12d
14031d96b: f7d0 not eax
14031d96d: a90000ff00 test eax, 0xff0000
14031d972: 0f84d5000000 je 0x14031da4d
14031d978: 4585ed test r13d, r13d
14031d97b: 740b je 0x14031d988
14031d97d: 4489d8 mov eax, r11d
14031d980: 4421e0 and eax, r12d
14031d983: 6685c0 test ax, ax
14031d986: 74cb je 0x14031d953
14031d988: 4d89ee mov r14, r13
14031d98b: 450f57ed xorps xmm13, xmm13
14031d98f: 664485a568010000 test word ptr [rbp + 0x168], r12w
14031d997: 7404 je 0x14031d99d
14031d999: 450f28ea movaps xmm13, xmm10
14031d99d: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14031d9a4: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14031d9ab: 8b4524 mov eax, dword ptr [rbp + 0x24]
14031d9ae: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14031d9b2: 8901 mov dword ptr [rcx], eax
14031d9b4: 4c8b6d08 mov r13, qword ptr [rbp + 8]
14031d9b8: 498b5d30 mov rbx, qword ptr [r13 + 0x30]
14031d9bc: 4d8b7d40 mov r15, qword ptr [r13 + 0x40]
14031d9c0: 493b5d20 cmp rbx, qword ptr [r13 + 0x20]
14031d9c4: 750a jne 0x14031d9d0
14031d9c6: 498d4d20 lea rcx, [r13 + 0x20]
14031d9ca: e8b1008f05 call 0x145c0da80
14031d9cf: 90 nop
14031d9d0: 41c1ec10 shr r12d, 0x10
14031d9d4: 498b4528 mov rax, qword ptr [r13 + 0x28]
14031d9d8: 488d0c5b lea rcx, [rbx + rbx*2]
14031d9dc: 48c1e104 shl rcx, 4
14031d9e0: 48ba0000000000000080 movabs rdx, 0x8000000000000000
14031d9ea: 48891408 mov qword ptr [rax + rcx], rdx
14031d9ee: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14031d9f5: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14031d9fa: f3440f116c0810 movss dword ptr [rax + rcx + 0x10], xmm13
14031da01: 664489640814 mov word ptr [rax + rcx + 0x14], r12w
14031da07: 4c897c0828 mov qword ptr [rax + rcx + 0x28], r15
14031da0c: 48ffc3 inc rbx
14031da0f: 49895d30 mov qword ptr [r13 + 0x30], rbx
14031da13: 49ff4540 inc qword ptr [r13 + 0x40]
14031da17: 4c8bbd70010000 mov r15, qword ptr [rbp + 0x170]
14031da1e: 8b85ac010000 mov eax, dword ptr [rbp + 0x1ac]
14031da24: 488b8d40010000 mov rcx, qword ptr [rbp + 0x140]
14031da2b: 8901 mov dword ptr [rcx], eax
14031da2d: 488b5e30 mov rbx, qword ptr [rsi + 0x30]
14031da31: 4c8b6e40 mov r13, qword ptr [rsi + 0x40]
14031da35: 483b5e20 cmp rbx, qword ptr [rsi + 0x20]
14031da39: 0f85e1feffff jne 0x14031d920
14031da3f: 488d4e20 lea rcx, [rsi + 0x20]
14031da43: e858ff8e05 call 0x145c0d9a0
14031da48: e9d3feffff jmp 0x14031d920
14031da4d: 4585ed test r13d, r13d
14031da50: 0f94c0 sete al
14031da53: 0fb68dc5010000 movzx ecx, byte ptr [rbp + 0x1c5]
14031da5a: 80f101 xor cl, 1
14031da5d: 08c1 or cl, al
14031da5f: 4c8ba508010000 mov r12, qword ptr [rbp + 0x108]
14031da66: 0f84df000000 je 0x14031db4b
14031da6c: 0fb685c7010000 movzx eax, byte ptr [rbp + 0x1c7]
14031da73: 450f57ed xorps xmm13, xmm13
14031da77: f3440f2ae8 cvtsi2ss xmm13, eax
14031da7c: f3450f5ee9 divss xmm13, xmm9
14031da81: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14031da88: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14031da8f: 8b4524 mov eax, dword ptr [rbp + 0x24]
14031da92: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14031da96: 8901 mov dword ptr [rcx], eax
14031da98: 488b7d08 mov rdi, qword ptr [rbp + 8]
14031da9c: 488b5f30 mov rbx, qword ptr [rdi + 0x30]
14031daa0: 4c8b7740 mov r14, qword ptr [rdi + 0x40]
14031daa4: 483b5f20 cmp rbx, qword ptr [rdi + 0x20]
14031daa8: 750a jne 0x14031dab4
14031daaa: 488d4f20 lea rcx, [rdi + 0x20]
14031daae: e8cdff8e05 call 0x145c0da80
14031dab3: 90 nop
14031dab4: 488b4728 mov rax, qword ptr [rdi + 0x28]
14031dab8: 488d0c5b lea rcx, [rbx + rbx*2]
14031dabc: 48c1e104 shl rcx, 4
14031dac0: 48ba0000000000000080 movabs rdx, 0x8000000000000000
14031daca: 48891408 mov qword ptr [rax + rcx], rdx
14031dace: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14031dad5: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14031dada: f3440f116c0810 movss dword ptr [rax + rcx + 0x10], xmm13
14031dae1: c644081407 mov byte ptr [rax + rcx + 0x14], 7
14031dae6: 4c89740828 mov qword ptr [rax + rcx + 0x28], r14
14031daeb: 48ffc3 inc rbx
14031daee: 48895f30 mov qword ptr [rdi + 0x30], rbx
14031daf2: 48ff4740 inc qword ptr [rdi + 0x40]
14031daf6: 488b9d70010000 mov rbx, qword ptr [rbp + 0x170]
14031dafd: 8b85ac010000 mov eax, dword ptr [rbp + 0x1ac]
14031db03: 488b8d40010000 mov rcx, qword ptr [rbp + 0x140]
14031db0a: 8901 mov dword ptr [rcx], eax
14031db0c: 488b7e30 mov rdi, qword ptr [rsi + 0x30]
14031db10: 4c8b7640 mov r14, qword ptr [rsi + 0x40]
14031db14: 483b7e20 cmp rdi, qword ptr [rsi + 0x20]
14031db18: 7509 jne 0x14031db23
14031db1a: 488d4e20 lea rcx, [rsi + 0x20]
14031db1e: e87dfe8e05 call 0x145c0d9a0
14031db23: 488b4628 mov rax, qword ptr [rsi + 0x28]
14031db27: 488d0c7f lea rcx, [rdi + rdi*2]
14031db2b: 4c8934c8 mov qword ptr [rax + rcx*8], r14
14031db2f: 48895cc808 mov qword ptr [rax + rcx*8 + 8], rbx
14031db34: f3440f116cc810 movss dword ptr [rax + rcx*8 + 0x10], xmm13
14031db3b: c644c81407 mov byte ptr [rax + rcx*8 + 0x14], 7
14031db40: 48ffc7 inc rdi
14031db43: 48897e30 mov qword ptr [rsi + 0x30], rdi
14031db47: 48ff4640 inc qword ptr [rsi + 0x40]
14031db4b: 0fb695c6010000 movzx edx, byte ptr [rbp + 0x1c6]
14031db52: 3a95c0010000 cmp dl, byte ptr [rbp + 0x1c0]
14031db58: 0f94c0 sete al
14031db5b: 4585ed test r13d, r13d
14031db5e: 0f95c1 setne cl
14031db61: 84c1 test cl, al
14031db63: 0f85db000000 jne 0x14031dc44
14031db69: 0fb6c2 movzx eax, dl
14031db6c: 450f57ed xorps xmm13, xmm13
14031db70: f3440f2ae8 cvtsi2ss xmm13, eax
14031db75: f3450f5ee9 divss xmm13, xmm9
14031db7a: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14031db81: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14031db88: 8b4524 mov eax, dword ptr [rbp + 0x24]
14031db8b: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14031db8f: 8901 mov dword ptr [rcx], eax
14031db91: 488b7d08 mov rdi, qword ptr [rbp + 8]
14031db95: 488b5f30 mov rbx, qword ptr [rdi + 0x30]
14031db99: 4c8b7740 mov r14, qword ptr [rdi + 0x40]
14031db9d: 483b5f20 cmp rbx, qword ptr [rdi + 0x20]
14031dba1: 750a jne 0x14031dbad
14031dba3: 488d4f20 lea rcx, [rdi + 0x20]
14031dba7: e8d4fe8e05 call 0x145c0da80
14031dbac: 90 nop
14031dbad: 488b4728 mov rax, qword ptr [rdi + 0x28]
14031dbb1: 488d0c5b lea rcx, [rbx + rbx*2]
14031dbb5: 48c1e104 shl rcx, 4
14031dbb9: 48ba0000000000000080 movabs rdx, 0x8000000000000000
14031dbc3: 48891408 mov qword ptr [rax + rcx], rdx
14031dbc7: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14031dbce: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14031dbd3: f3440f116c0810 movss dword ptr [rax + rcx + 0x10], xmm13
14031dbda: c644081409 mov byte ptr [rax + rcx + 0x14], 9
14031dbdf: 4c89740828 mov qword ptr [rax + rcx + 0x28], r14
14031dbe4: 48ffc3 inc rbx
14031dbe7: 48895f30 mov qword ptr [rdi + 0x30], rbx
14031dbeb: 48ff4740 inc qword ptr [rdi + 0x40]
14031dbef: 488b9d70010000 mov rbx, qword ptr [rbp + 0x170]
14031dbf6: 8b85ac010000 mov eax, dword ptr [rbp + 0x1ac]
14031dbfc: 488b8d40010000 mov rcx, qword ptr [rbp + 0x140]
14031dc03: 8901 mov dword ptr [rcx], eax
14031dc05: 488b7e30 mov rdi, qword ptr [rsi + 0x30]
14031dc09: 4c8b7640 mov r14, qword ptr [rsi + 0x40]
14031dc0d: 483b7e20 cmp rdi, qword ptr [rsi + 0x20]
14031dc11: 7509 jne 0x14031dc1c
14031dc13: 488d4e20 lea rcx, [rsi + 0x20]
14031dc17: e884fd8e05 call 0x145c0d9a0
14031dc1c: 488b4628 mov rax, qword ptr [rsi + 0x28]
14031dc20: 488d0c7f lea rcx, [rdi + rdi*2]
14031dc24: 4c8934c8 mov qword ptr [rax + rcx*8], r14
14031dc28: 48895cc808 mov qword ptr [rax + rcx*8 + 8], rbx
14031dc2d: f3440f116cc810 movss dword ptr [rax + rcx*8 + 0x10], xmm13
14031dc34: c644c81409 mov byte ptr [rax + rcx*8 + 0x14], 9
14031dc39: 48ffc7 inc rdi
14031dc3c: 48897e30 mov qword ptr [rsi + 0x30], rdi
14031dc40: 48ff4640 inc qword ptr [rsi + 0x40]
14031dc44: 488d8590010000 lea rax, [rbp + 0x190]
14031dc4b: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14031dc52: 488d4508 lea rax, [rbp + 8]
14031dc56: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14031dc5d: 488d8570010000 lea rax, [rbp + 0x170]
14031dc64: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14031dc6b: 488d4568 lea rax, [rbp + 0x68]
14031dc6f: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
14031dc76: 66450f7ee0 movd r8d, xmm12
14031dc7b: 488db5b0000000 lea rsi, [rbp + 0xb0]
14031dc82: 4889f1 mov rcx, rsi
14031dc85: 31d2 xor edx, edx
14031dc87: 440fb78dd4010000 movzx r9d, word ptr [rbp + 0x1d4]
14031dc8f: e8ac25feff call 0x140300240
14031dc94: 66450fc5c401 pextrw r8d, xmm12, 1
14031dc9a: 4889f1 mov rcx, rsi
14031dc9d: b201 mov dl, 1
14031dc9f: 448b8db4010000 mov r9d, dword ptr [rbp + 0x1b4]
14031dca6: e89525feff call 0x140300240
14031dcab: 66450fc5c402 pextrw r8d, xmm12, 2
14031dcb1: 4889f1 mov rcx, rsi
14031dcb4: b203 mov dl, 3
14031dcb6: 448b8d64010000 mov r9d, dword ptr [rbp + 0x164]
14031dcbd: e87e25feff call 0x140300240
14031dcc2: 4889f1 mov rcx, rsi
14031dcc5: b204 mov dl, 4
14031dcc7: 448b853c010000 mov r8d, dword ptr [rbp + 0x13c]
14031dcce: 448b8d38010000 mov r9d, dword ptr [rbp + 0x138]
14031dcd5: e86625feff call 0x140300240
14031dcda: e9b1f5ffff jmp 0x14031d290
14031dcdf: 0f28b5e0010000 movaps xmm6, xmmword ptr [rbp + 0x1e0]
14031dce6: 0f28bdf0010000 movaps xmm7, xmmword ptr [rbp + 0x1f0]
14031dced: 440f288500020000 movaps xmm8, xmmword ptr [rbp + 0x200]
14031dcf5: 440f288d10020000 movaps xmm9, xmmword ptr [rbp + 0x210]
14031dcfd: 440f289520020000 movaps xmm10, xmmword ptr [rbp + 0x220]
14031dd05: 440f289d30020000 movaps xmm11, xmmword ptr [rbp + 0x230]
14031dd0d: 440f28a540020000 movaps xmm12, xmmword ptr [rbp + 0x240]
14031dd15: 440f28ad50020000 movaps xmm13, xmmword ptr [rbp + 0x250]
14031dd1d: 4881c4e8020000 add rsp, 0x2e8
14031dd24: 5b pop rbx
14031dd25: 5f pop rdi
14031dd26: 5e pop rsi
14031dd27: 415c pop r12
14031dd29: 415d pop r13
14031dd2b: 415e pop r14
14031dd2d: 415f pop r15
14031dd2f: 5d pop rbp
14031dd30: c3 ret
