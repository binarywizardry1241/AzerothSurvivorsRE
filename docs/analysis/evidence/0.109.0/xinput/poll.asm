14037d9d0: 55 push rbp
14037d9d1: 4157 push r15
14037d9d3: 4156 push r14
14037d9d5: 4155 push r13
14037d9d7: 4154 push r12
14037d9d9: 56 push rsi
14037d9da: 57 push rdi
14037d9db: 53 push rbx
14037d9dc: 4881ece8020000 sub rsp, 0x2e8
14037d9e3: 488dac2480000000 lea rbp, [rsp + 0x80]
14037d9eb: 440f29ad50020000 movaps xmmword ptr [rbp + 0x250], xmm13
14037d9f3: 66440f7fa540020000 movdqa xmmword ptr [rbp + 0x240], xmm12
14037d9fc: 440f299d30020000 movaps xmmword ptr [rbp + 0x230], xmm11
14037da04: 440f299520020000 movaps xmmword ptr [rbp + 0x220], xmm10
14037da0c: 440f298d10020000 movaps xmmword ptr [rbp + 0x210], xmm9
14037da14: 440f298500020000 movaps xmmword ptr [rbp + 0x200], xmm8
14037da1c: 0f29bdf0010000 movaps xmmword ptr [rbp + 0x1f0], xmm7
14037da23: 0f29b5e0010000 movaps xmmword ptr [rbp + 0x1e0], xmm6
14037da2a: 48c785d8010000feffffff mov qword ptr [rbp + 0x1d8], 0xfffffffffffffffe
14037da35: 488b85e8020000 mov rax, qword ptr [rbp + 0x2e8]
14037da3c: 488b8de0020000 mov rcx, qword ptr [rbp + 0x2e0]
14037da43: 4c8b95d8020000 mov r10, qword ptr [rbp + 0x2d8]
14037da4a: 4c8b9dd0020000 mov r11, qword ptr [rbp + 0x2d0]
14037da51: 488b7220 mov rsi, qword ptr [rdx + 0x20]
14037da55: 488975c0 mov qword ptr [rbp - 0x40], rsi
14037da59: 0f1002 movups xmm0, xmmword ptr [rdx]
14037da5c: 0f104a10 movups xmm1, xmmword ptr [rdx + 0x10]
14037da60: 0f294db0 movaps xmmword ptr [rbp - 0x50], xmm1
14037da64: 0f2945a0 movaps xmmword ptr [rbp - 0x60], xmm0
14037da68: 410f1000 movups xmm0, xmmword ptr [r8]
14037da6c: 410f104810 movups xmm1, xmmword ptr [r8 + 0x10]
14037da71: 0f114dd8 movups xmmword ptr [rbp - 0x28], xmm1
14037da75: 0f1145c8 movups xmmword ptr [rbp - 0x38], xmm0
14037da79: 410f1001 movups xmm0, xmmword ptr [r9]
14037da7d: 410f104910 movups xmm1, xmmword ptr [r9 + 0x10]
14037da82: 0f114df8 movups xmmword ptr [rbp - 8], xmm1
14037da86: 0f1145e8 movups xmmword ptr [rbp - 0x18], xmm0
14037da8a: 410f1003 movups xmm0, xmmword ptr [r11]
14037da8e: 410f104b10 movups xmm1, xmmword ptr [r11 + 0x10]
14037da93: 0f114d18 movups xmmword ptr [rbp + 0x18], xmm1
14037da97: 0f114508 movups xmmword ptr [rbp + 8], xmm0
14037da9b: 410f1002 movups xmm0, xmmword ptr [r10]
14037da9f: 410f104a10 movups xmm1, xmmword ptr [r10 + 0x10]
14037daa4: 0f114d38 movups xmmword ptr [rbp + 0x38], xmm1
14037daa8: 0f114528 movups xmmword ptr [rbp + 0x28], xmm0
14037daac: 0f1001 movups xmm0, xmmword ptr [rcx]
14037daaf: 0f104910 movups xmm1, xmmword ptr [rcx + 0x10]
14037dab3: 0f114548 movups xmmword ptr [rbp + 0x48], xmm0
14037dab7: 0f114d58 movups xmmword ptr [rbp + 0x58], xmm1
14037dabb: 0f1000 movups xmm0, xmmword ptr [rax]
14037dabe: 0f104810 movups xmm1, xmmword ptr [rax + 0x10]
14037dac2: 0f114568 movups xmmword ptr [rbp + 0x68], xmm0
14037dac6: 0f114d78 movups xmmword ptr [rbp + 0x78], xmm1
14037daca: 488b45e8 mov rax, qword ptr [rbp - 0x18]
14037dace: f30f10b08c000000 movss xmm6, dword ptr [rax + 0x8c]
14037dad6: 4c8b65c8 mov r12, qword ptr [rbp - 0x38]
14037dada: 488b45d8 mov rax, qword ptr [rbp - 0x28]
14037dade: 48898548010000 mov qword ptr [rbp + 0x148], rax
14037dae5: f3410f107c2468 movss xmm7, dword ptr [r12 + 0x68]
14037daec: 0f2ef7 ucomiss xmm6, xmm7
14037daef: 8b45e4 mov eax, dword ptr [rbp - 0x1c]
14037daf2: 8985b0010000 mov dword ptr [rbp + 0x1b0], eax
14037daf8: 7222 jb 0x14037db1c
14037dafa: 488b8548010000 mov rax, qword ptr [rbp + 0x148]
14037db01: 8b8db0010000 mov ecx, dword ptr [rbp + 0x1b0]
14037db07: 8908 mov dword ptr [rax], ecx
14037db09: f30f1005f771a505 movss xmm0, dword ptr [rip + 0x5a571f7]
14037db11: f30f58c6 addss xmm0, xmm6
14037db15: f3410f11442468 movss dword ptr [r12 + 0x68], xmm0
14037db1c: 4d8d4c2408 lea r9, [r12 + 8]
14037db21: 8b4544 mov eax, dword ptr [rbp + 0x44]
14037db24: 898560010000 mov dword ptr [rbp + 0x160], eax
14037db2a: 488b4528 mov rax, qword ptr [rbp + 0x28]
14037db2e: 488b4d38 mov rcx, qword ptr [rbp + 0x38]
14037db32: 48898d00010000 mov qword ptr [rbp + 0x100], rcx
14037db39: 48898550010000 mov qword ptr [rbp + 0x150], rax
14037db40: 4883c020 add rax, 0x20
14037db44: 48898510010000 mov qword ptr [rbp + 0x110], rax
14037db4b: 450f57c0 xorps xmm8, xmm8
14037db4f: f3440f100d6473a505 movss xmm9, dword ptr [rip + 0x5a57364]
14037db58: f3440f10153ff7a105 movss xmm10, dword ptr [rip + 0x5a1f73f]
14037db61: 66440f6e1df665a705 movd xmm11, dword ptr [rip + 0x5a765f6]
14037db6a: 48c785b801000000000000 mov qword ptr [rbp + 0x1b8], 0
14037db75: 4c89a508010000 mov qword ptr [rbp + 0x108], r12
14037db7c: 4c898d58010000 mov qword ptr [rbp + 0x158], r9
14037db83: eb42 jmp 0x14037dbc7
14037db85: 66662e0f1f840000000000 nop word ptr cs:[rax + rax]
14037db90: 488b9550010000 mov rdx, qword ptr [rbp + 0x150]
14037db97: 488b4228 mov rax, qword ptr [rdx + 0x28]
14037db9b: 488d0c7f lea rcx, [rdi + rdi*2]
14037db9f: 48c1e104 shl rcx, 4
14037dba3: 48c70408ffffffff mov qword ptr [rax + rcx], 0xffffffffffffffff
14037dbab: 4889740820 mov qword ptr [rax + rcx + 0x20], rsi
14037dbb0: 48895c0828 mov qword ptr [rax + rcx + 0x28], rbx
14037dbb5: 48ffc7 inc rdi
14037dbb8: 48897a30 mov qword ptr [rdx + 0x30], rdi
14037dbbc: 48ff4240 inc qword ptr [rdx + 0x40]
14037dbc0: 4c8b8d58010000 mov r9, qword ptr [rbp + 0x158]
14037dbc7: 488b85b8010000 mov rax, qword ptr [rbp + 0x1b8]
14037dbce: 4883f804 cmp rax, 4
14037dbd2: 0f83370a0000 jae 0x14037e60f
14037dbd8: 488d4801 lea rcx, [rax + 1]
14037dbdc: 0f2ef7 ucomiss xmm6, xmm7
14037dbdf: 488d1440 lea rdx, [rax + rax*2]
14037dbe3: 498d3cd1 lea rdi, [r9 + rdx*8]
14037dbe7: 0f8383000000 jae 0x14037dc70
14037dbed: 41833cd100 cmp dword ptr [r9 + rdx*8], 0
14037dbf2: 0f8578000000 jne 0x14037dc70
14037dbf8: 4883f803 cmp rax, 3
14037dbfc: 0f840d0a0000 je 0x14037e60f
14037dc02: 488d5002 lea rdx, [rax + 2]
14037dc06: 0f2ef7 ucomiss xmm6, xmm7
14037dc09: 4c8d0449 lea r8, [rcx + rcx*2]
14037dc0d: 4b8d3cc1 lea rdi, [r9 + r8*8]
14037dc11: 736d jae 0x14037dc80
14037dc13: 43833cc100 cmp dword ptr [r9 + r8*8], 0
14037dc18: 7566 jne 0x14037dc80
14037dc1a: 4883f801 cmp rax, 1
14037dc1e: 0f87eb090000 ja 0x14037e60f
14037dc24: 488d4803 lea rcx, [rax + 3]
14037dc28: 0f2ef7 ucomiss xmm6, xmm7
14037dc2b: 4c8d0452 lea r8, [rdx + rdx*2]
14037dc2f: 4b8d3cc1 lea rdi, [r9 + r8*8]
14037dc33: 7354 jae 0x14037dc89
14037dc35: 43833cc100 cmp dword ptr [r9 + r8*8], 0
14037dc3a: 754d jne 0x14037dc89
14037dc3c: 4885c0 test rax, rax
14037dc3f: 0f85ca090000 jne 0x14037e60f
14037dc45: 0f2ef7 ucomiss xmm6, xmm7
14037dc48: 488d0449 lea rax, [rcx + rcx*2]
14037dc4c: 498d3cc1 lea rdi, [r9 + rax*8]
14037dc50: ba04000000 mov edx, 4
14037dc55: 488995b8010000 mov qword ptr [rbp + 0x1b8], rdx
14037dc5c: 7342 jae 0x14037dca0
14037dc5e: 41833cc100 cmp dword ptr [r9 + rax*8], 0
14037dc63: 753b jne 0x14037dca0
14037dc65: e9a5090000 jmp 0x14037e60f
14037dc6a: 660f1f440000 nop word ptr [rax + rax]
14037dc70: 48898db8010000 mov qword ptr [rbp + 0x1b8], rcx
14037dc77: 4889c1 mov rcx, rax
14037dc7a: eb24 jmp 0x14037dca0
14037dc7c: 0f1f4000 nop dword ptr [rax]
14037dc80: 488995b8010000 mov qword ptr [rbp + 0x1b8], rdx
14037dc87: eb17 jmp 0x14037dca0
14037dc89: 48898db8010000 mov qword ptr [rbp + 0x1b8], rcx
14037dc90: 4889d1 mov rcx, rdx
14037dc93: 666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14037dca0: 440f298520010000 movaps xmmword ptr [rbp + 0x120], xmm8
14037dca8: 488d9520010000 lea rdx, [rbp + 0x120]
14037dcaf: 41ff1424 call qword ptr [r12]
14037dcb3: 448b2f mov r13d, dword ptr [rdi]
14037dcb6: 8b7704 mov esi, dword ptr [rdi + 4]
14037dcb9: 440fb75f08 movzx r11d, word ptr [rdi + 8]
14037dcbe: 0fb64f0a movzx ecx, byte ptr [rdi + 0xa]
14037dcc2: 0fb6570b movzx edx, byte ptr [rdi + 0xb]
14037dcc6: 8995c0010000 mov dword ptr [rbp + 0x1c0], edx
14037dccc: 0fb7570e movzx edx, word ptr [rdi + 0xe]
14037dcd0: 8995b4010000 mov dword ptr [rbp + 0x1b4], edx
14037dcd6: 0fb7570c movzx edx, word ptr [rdi + 0xc]
14037dcda: 668995d4010000 mov word ptr [rbp + 0x1d4], dx
14037dce1: 440fb74710 movzx r8d, word ptr [rdi + 0x10]
14037dce6: 440fb74f12 movzx r9d, word ptr [rdi + 0x12]
14037dceb: 8b5714 mov edx, dword ptr [rdi + 0x14]
14037dcee: 4d85ed test r13, r13
14037dcf1: 0f84b9000000 je 0x14037ddb0
14037dcf7: 85c0 test eax, eax
14037dcf9: 0f8421020000 je 0x14037df20
14037dcff: 488b8548010000 mov rax, qword ptr [rbp + 0x148]
14037dd06: 8b8db0010000 mov ecx, dword ptr [rbp + 0x1b0]
14037dd0c: 8908 mov dword ptr [rax], ecx
14037dd0e: c70700000000 mov dword ptr [rdi], 0
14037dd14: 8b4524 mov eax, dword ptr [rbp + 0x24]
14037dd17: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14037dd1b: 8901 mov dword ptr [rcx], eax
14037dd1d: 488b7d08 mov rdi, qword ptr [rbp + 8]
14037dd21: 4c8b7730 mov r14, qword ptr [rdi + 0x30]
14037dd25: 488b5f40 mov rbx, qword ptr [rdi + 0x40]
14037dd29: 4c3b7720 cmp r14, qword ptr [rdi + 0x20]
14037dd2d: 750a jne 0x14037dd39
14037dd2f: 488d4f20 lea rcx, [rdi + 0x20]
14037dd33: e888cf8705 call 0x145bfacc0
14037dd38: 90 nop
14037dd39: 48c1e620 shl rsi, 0x20
14037dd3d: 4c09ee or rsi, r13
14037dd40: 488b4728 mov rax, qword ptr [rdi + 0x28]
14037dd44: 4b8d0c76 lea rcx, [r14 + r14*2]
14037dd48: 48c1e104 shl rcx, 4
14037dd4c: 48c70408ffffffff mov qword ptr [rax + rcx], 0xffffffffffffffff
14037dd54: 4889740820 mov qword ptr [rax + rcx + 0x20], rsi
14037dd59: 48895c0828 mov qword ptr [rax + rcx + 0x28], rbx
14037dd5e: 49ffc6 inc r14
14037dd61: 4c897730 mov qword ptr [rdi + 0x30], r14
14037dd65: 48ff4740 inc qword ptr [rdi + 0x40]
14037dd69: 8b8560010000 mov eax, dword ptr [rbp + 0x160]
14037dd6f: 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
14037dd76: 8901 mov dword ptr [rcx], eax
14037dd78: 488b8550010000 mov rax, qword ptr [rbp + 0x150]
14037dd7f: 488b7830 mov rdi, qword ptr [rax + 0x30]
14037dd83: 488b5840 mov rbx, qword ptr [rax + 0x40]
14037dd87: 483b7820 cmp rdi, qword ptr [rax + 0x20]
14037dd8b: 0f85fffdffff jne 0x14037db90
14037dd91: 488b8d10010000 mov rcx, qword ptr [rbp + 0x110]
14037dd98: e823cf8705 call 0x145bfacc0
14037dd9d: e9eefdffff jmp 0x14037db90
14037dda2: 66666666662e0f1f840000000000 nop word ptr cs:[rax + rax]
14037ddb0: 85c0 test eax, eax
14037ddb2: 0f8508feffff jne 0x14037dbc0
14037ddb8: c7859001000000000000 mov dword ptr [rbp + 0x190], 0
14037ddc2: 89b594010000 mov dword ptr [rbp + 0x194], esi
14037ddc8: 6644899d98010000 mov word ptr [rbp + 0x198], r11w
14037ddd0: 888d9a010000 mov byte ptr [rbp + 0x19a], cl
14037ddd6: 8b85c0010000 mov eax, dword ptr [rbp + 0x1c0]
14037dddc: 88859b010000 mov byte ptr [rbp + 0x19b], al
14037dde2: 0fb785d4010000 movzx eax, word ptr [rbp + 0x1d4]
14037dde9: 6689859c010000 mov word ptr [rbp + 0x19c], ax
14037ddf0: 8b85b4010000 mov eax, dword ptr [rbp + 0x1b4]
14037ddf6: 6689859e010000 mov word ptr [rbp + 0x19e], ax
14037ddfd: 66448985a0010000 mov word ptr [rbp + 0x1a0], r8w
14037de05: 6644898da2010000 mov word ptr [rbp + 0x1a2], r9w
14037de0d: 8995a4010000 mov dword ptr [rbp + 0x1a4], edx
14037de13: 4c8da5b0000000 lea r12, [rbp + 0xb0]
14037de1a: 4c89e1 mov rcx, r12
14037de1d: 488d55a0 lea rdx, [rbp - 0x60]
14037de21: 4c8d0530f9a705 lea r8, [rip + 0x5a7f930]
14037de28: e8f317b004 call 0x144e7f620
14037de2d: 448bbdb0000000 mov r15d, dword ptr [rbp + 0xb0]
14037de34: 8bb5b4000000 mov esi, dword ptr [rbp + 0xb4]
14037de3a: 488b85b8010000 mov rax, qword ptr [rbp + 0x1b8]
14037de41: 48898598000000 mov qword ptr [rbp + 0x98], rax
14037de48: 488d8598000000 lea rax, [rbp + 0x98]
14037de4f: 48898588000000 mov qword ptr [rbp + 0x88], rax
14037de56: 488d0573198605 lea rax, [rip + 0x5861973]
14037de5d: 48898590000000 mov qword ptr [rbp + 0x90], rax
14037de64: 488d9d70010000 lea rbx, [rbp + 0x170]
14037de6b: 4889d9 mov rcx, rbx
14037de6e: 488d15fbf8a705 lea rdx, [rip + 0x5a7f8fb]
14037de75: 4c8d8588000000 lea r8, [rbp + 0x88]
14037de7c: e8afef8405 call 0x145bcce30
14037de81: 4489bdd0000000 mov dword ptr [rbp + 0xd0], r15d
14037de88: 89b5d4000000 mov dword ptr [rbp + 0xd4], esi
14037de8e: 0f108570010000 movups xmm0, xmmword ptr [rbp + 0x170]
14037de95: 0f2985b0000000 movaps xmmword ptr [rbp + 0xb0], xmm0
14037de9c: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14037dea3: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14037deaa: 66c785c80000000000 mov word ptr [rbp + 0xc8], 0
14037deb3: 66c785cc0000000000 mov word ptr [rbp + 0xcc], 0
14037debc: 4c8bb5d0000000 mov r14, qword ptr [rbp + 0xd0]
14037dec3: 4883bdb0000000ff cmp qword ptr [rbp + 0xb0], -1
14037decb: 4c89ada0000000 mov qword ptr [rbp + 0xa0], r13
14037ded2: 0f84c0000000 je 0x14037df98
14037ded8: c685d701000001 mov byte ptr [rbp + 0x1d7], 1
14037dedf: 4889d9 mov rcx, rbx
14037dee2: 4c89e2 mov rdx, r12
14037dee5: e806f48405 call 0x145bcd2f0
14037deea: 90 nop
14037deeb: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14037def2: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14037def9: 488b8578010000 mov rax, qword ptr [rbp + 0x178]
14037df00: 48898518010000 mov qword ptr [rbp + 0x118], rax
14037df07: 488b8580010000 mov rax, qword ptr [rbp + 0x180]
14037df0e: 488985a8000000 mov qword ptr [rbp + 0xa8], rax
14037df15: e989000000 jmp 0x14037dfa3
14037df1a: 660f1f440000 nop word ptr [rax + rax]
14037df20: 660f6e470c movd xmm0, dword ptr [rdi + 0xc]
14037df25: 4489ad90010000 mov dword ptr [rbp + 0x190], r13d
14037df2c: 89b594010000 mov dword ptr [rbp + 0x194], esi
14037df32: 6644899d98010000 mov word ptr [rbp + 0x198], r11w
14037df3a: 888d9a010000 mov byte ptr [rbp + 0x19a], cl
14037df40: 8b85c0010000 mov eax, dword ptr [rbp + 0x1c0]
14037df46: 88859b010000 mov byte ptr [rbp + 0x19b], al
14037df4c: 0fb785d4010000 movzx eax, word ptr [rbp + 0x1d4]
14037df53: 6689859c010000 mov word ptr [rbp + 0x19c], ax
14037df5a: 8b85b4010000 mov eax, dword ptr [rbp + 0x1b4]
14037df60: 6689859e010000 mov word ptr [rbp + 0x19e], ax
14037df67: 66448985a0010000 mov word ptr [rbp + 0x1a0], r8w
14037df6f: 6644898da2010000 mov word ptr [rbp + 0x1a2], r9w
14037df77: 44898564010000 mov dword ptr [rbp + 0x164], r8d
14037df7e: 66410fc4c002 pinsrw xmm0, r8d, 2
14037df84: 8995a4010000 mov dword ptr [rbp + 0x1a4], edx
14037df8a: 66410fc4c303 pinsrw xmm0, r11d, 3
14037df90: 4589ef mov r15d, r13d
14037df93: e986010000 jmp 0x14037e11e
14037df98: 48c785c8010000ffffffff mov qword ptr [rbp + 0x1c8], 0xffffffffffffffff
14037dfa3: 8b4524 mov eax, dword ptr [rbp + 0x24]
14037dfa6: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14037dfaa: 8901 mov dword ptr [rcx], eax
14037dfac: 4c8b6508 mov r12, qword ptr [rbp + 8]
14037dfb0: 498b5c2430 mov rbx, qword ptr [r12 + 0x30]
14037dfb5: 4d8b6c2440 mov r13, qword ptr [r12 + 0x40]
14037dfba: 493b5c2420 cmp rbx, qword ptr [r12 + 0x20]
14037dfbf: 750b jne 0x14037dfcc
14037dfc1: 498d4c2420 lea rcx, [r12 + 0x20]
14037dfc6: e8f5cc8705 call 0x145bfacc0
14037dfcb: 90 nop
14037dfcc: 498b442428 mov rax, qword ptr [r12 + 0x28]
14037dfd1: 488d0c5b lea rcx, [rbx + rbx*2]
14037dfd5: 48c1e104 shl rcx, 4
14037dfd9: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14037dfe0: 48891408 mov qword ptr [rax + rcx], rdx
14037dfe4: 488b9518010000 mov rdx, qword ptr [rbp + 0x118]
14037dfeb: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14037dff0: 488b95a8000000 mov rdx, qword ptr [rbp + 0xa8]
14037dff7: 4889540810 mov qword ptr [rax + rcx + 0x10], rdx
14037dffc: 66c74408180000 mov word ptr [rax + rcx + 0x18], 0
14037e003: 66c744081c0000 mov word ptr [rax + rcx + 0x1c], 0
14037e00a: 4c89740820 mov qword ptr [rax + rcx + 0x20], r14
14037e00f: 4c896c0828 mov qword ptr [rax + rcx + 0x28], r13
14037e014: 48ffc3 inc rbx
14037e017: 49895c2430 mov qword ptr [r12 + 0x30], rbx
14037e01c: 49ff442440 inc qword ptr [r12 + 0x40]
14037e021: 488b85b0000000 mov rax, qword ptr [rbp + 0xb0]
14037e028: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14037e02f: 488b85b8000000 mov rax, qword ptr [rbp + 0xb8]
14037e036: 48898568010000 mov qword ptr [rbp + 0x168], rax
14037e03d: 488d85c0000000 lea rax, [rbp + 0xc0]
14037e044: 0f1000 movups xmm0, xmmword ptr [rax]
14037e047: 0f298570010000 movaps xmmword ptr [rbp + 0x170], xmm0
14037e04e: 488b4010 mov rax, qword ptr [rax + 0x10]
14037e052: 48898580010000 mov qword ptr [rbp + 0x180], rax
14037e059: 8b8560010000 mov eax, dword ptr [rbp + 0x160]
14037e05f: 488b8d00010000 mov rcx, qword ptr [rbp + 0x100]
14037e066: 8901 mov dword ptr [rcx], eax
14037e068: 488b8550010000 mov rax, qword ptr [rbp + 0x150]
14037e06f: 488b5830 mov rbx, qword ptr [rax + 0x30]
14037e073: 4c8b7040 mov r14, qword ptr [rax + 0x40]
14037e077: 483b5820 cmp rbx, qword ptr [rax + 0x20]
14037e07b: 750d jne 0x14037e08a
14037e07d: 488b8d10010000 mov rcx, qword ptr [rbp + 0x110]
14037e084: e837cc8705 call 0x145bfacc0
14037e089: 90 nop
14037e08a: 4c8b8550010000 mov r8, qword ptr [rbp + 0x150]
14037e091: 498b4028 mov rax, qword ptr [r8 + 0x28]
14037e095: 488d0c5b lea rcx, [rbx + rbx*2]
14037e099: 48c1e104 shl rcx, 4
14037e09d: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14037e0a4: 48891408 mov qword ptr [rax + rcx], rdx
14037e0a8: 488b9568010000 mov rdx, qword ptr [rbp + 0x168]
14037e0af: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14037e0b4: 0f288570010000 movaps xmm0, xmmword ptr [rbp + 0x170]
14037e0bb: 0f11440810 movups xmmword ptr [rax + rcx + 0x10], xmm0
14037e0c0: 488b9580010000 mov rdx, qword ptr [rbp + 0x180]
14037e0c7: 4889540820 mov qword ptr [rax + rcx + 0x20], rdx
14037e0cc: 4c89740828 mov qword ptr [rax + rcx + 0x28], r14
14037e0d1: 48ffc3 inc rbx
14037e0d4: 49895830 mov qword ptr [r8 + 0x30], rbx
14037e0d8: 49ff4040 inc qword ptr [r8 + 0x40]
14037e0dc: 66c785d40100000080 mov word ptr [rbp + 0x1d4], 0x8000
14037e0e5: 4531db xor r11d, r11d
14037e0e8: 31c9 xor ecx, ecx
14037e0ea: c785c001000000000000 mov dword ptr [rbp + 0x1c0], 0
14037e0f4: c785b401000000000000 mov dword ptr [rbp + 0x1b4], 0
14037e0fe: c7856401000000000000 mov dword ptr [rbp + 0x164], 0
14037e108: 4531c9 xor r9d, r9d
14037e10b: 66410f6fc3 movdqa xmm0, xmm11
14037e110: 4c8ba508010000 mov r12, qword ptr [rbp + 0x108]
14037e117: 4c8bada0000000 mov r13, qword ptr [rbp + 0xa0]
14037e11e: 4489bd70010000 mov dword ptr [rbp + 0x170], r15d
14037e125: 89b574010000 mov dword ptr [rbp + 0x174], esi
14037e12b: 440fb7b524010000 movzx r14d, word ptr [rbp + 0x124]
14037e133: 0fb6b526010000 movzx esi, byte ptr [rbp + 0x126]
14037e13a: 0fb69d27010000 movzx ebx, byte ptr [rbp + 0x127]
14037e141: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14037e148: f3440f7ea528010000 movq xmm12, qword ptr [rbp + 0x128]
14037e151: 66450fc5d403 pextrw r10d, xmm12, 3
14037e157: 488b9548010000 mov rdx, qword ptr [rbp + 0x148]
14037e15e: 448b85b0010000 mov r8d, dword ptr [rbp + 0x1b0]
14037e165: 448902 mov dword ptr [rdx], r8d
14037e168: 488907 mov qword ptr [rdi], rax
14037e16b: 6644897708 mov word ptr [rdi + 8], r14w
14037e170: 4088770a mov byte ptr [rdi + 0xa], sil
14037e174: 885f0b mov byte ptr [rdi + 0xb], bl
14037e177: 66440fd6670c movq qword ptr [rdi + 0xc], xmm12
14037e17d: 4038ce cmp sil, cl
14037e180: 0f94c2 sete dl
14037e183: 66410f6fcc movdqa xmm1, xmm12
14037e188: 4489b568010000 mov dword ptr [rbp + 0x168], r14d
14037e18f: 66410fc4ce03 pinsrw xmm1, r14d, 3
14037e195: 660f75c8 pcmpeqw xmm1, xmm0
14037e199: 664539ca cmp r10w, r9w
14037e19d: 0f94c0 sete al
14037e1a0: 660f61c9 punpcklwd xmm1, xmm1
14037e1a4: 0f50c9 movmskps ecx, xmm1
14037e1a7: 83f90f cmp ecx, 0xf
14037e1aa: 7514 jne 0x14037e1c0
14037e1ac: 84c0 test al, al
14037e1ae: 7410 je 0x14037e1c0
14037e1b0: 84d2 test dl, dl
14037e1b2: 740c je 0x14037e1c0
14037e1b4: 3a9dc0010000 cmp bl, byte ptr [rbp + 0x1c0]
14037e1ba: 0f8400faffff je 0x14037dbc0
14037e1c0: 8895c5010000 mov byte ptr [rbp + 0x1c5], dl
14037e1c6: 4088b5c7010000 mov byte ptr [rbp + 0x1c7], sil
14037e1cd: 889dc6010000 mov byte ptr [rbp + 0x1c6], bl
14037e1d3: 4489953c010000 mov dword ptr [rbp + 0x13c], r10d
14037e1da: 44898d38010000 mov dword ptr [rbp + 0x138], r9d
14037e1e1: 48c785b80000000e000000 mov qword ptr [rbp + 0xb8], 0xe
14037e1ec: 0f1005b5f5a705 movups xmm0, xmmword ptr [rip + 0x5a7f5b5]
14037e1f3: 488d85c0000000 lea rax, [rbp + 0xc0]
14037e1fa: 0f114020 movups xmmword ptr [rax + 0x20], xmm0
14037e1fe: 0f100593f5a705 movups xmm0, xmmword ptr [rip + 0x5a7f593]
14037e205: 0f114010 movups xmmword ptr [rax + 0x10], xmm0
14037e209: 0f100578f5a705 movups xmm0, xmmword ptr [rip + 0x5a7f578]
14037e210: 0f1100 movups xmmword ptr [rax], xmm0
14037e213: 48b90040030000800200 movabs rcx, 0x2800000034000
14037e21d: 48894830 mov qword ptr [rax + 0x30], rcx
14037e221: 44339d68010000 xor r11d, dword ptr [rbp + 0x168]
14037e228: 8b4564 mov eax, dword ptr [rbp + 0x64]
14037e22b: 8985ac010000 mov dword ptr [rbp + 0x1ac], eax
14037e231: 488b7548 mov rsi, qword ptr [rbp + 0x48]
14037e235: 488b4558 mov rax, qword ptr [rbp + 0x58]
14037e239: 48898540010000 mov qword ptr [rbp + 0x140], rax
14037e240: 31ff xor edi, edi
14037e242: 44899d34010000 mov dword ptr [rbp + 0x134], r11d
14037e249: eb45 jmp 0x14037e290
14037e24b: 0f1f440000 nop dword ptr [rax + rax]
14037e250: 488b4628 mov rax, qword ptr [rsi + 0x28]
14037e254: 488d0c5b lea rcx, [rbx + rbx*2]
14037e258: 4c892cc8 mov qword ptr [rax + rcx*8], r13
14037e25c: 4c897cc808 mov qword ptr [rax + rcx*8 + 8], r15
14037e261: f3440f116cc810 movss dword ptr [rax + rcx*8 + 0x10], xmm13
14037e268: 66448964c814 mov word ptr [rax + rcx*8 + 0x14], r12w
14037e26e: 48ffc3 inc rbx
14037e271: 48895e30 mov qword ptr [rsi + 0x30], rbx
14037e275: 48ff4640 inc qword ptr [rsi + 0x40]
14037e279: 4d89f5 mov r13, r14
14037e27c: 448b9d34010000 mov r11d, dword ptr [rbp + 0x134]
14037e283: 48ffc7 inc rdi
14037e286: 4883ff0e cmp rdi, 0xe
14037e28a: 0f84ed000000 je 0x14037e37d
14037e290: 448ba4bdc0000000 mov r12d, dword ptr [rbp + rdi*4 + 0xc0]
14037e298: 4489e0 mov eax, r12d
14037e29b: f7d0 not eax
14037e29d: a90000ff00 test eax, 0xff0000
14037e2a2: 0f84d5000000 je 0x14037e37d
14037e2a8: 4585ed test r13d, r13d
14037e2ab: 740b je 0x14037e2b8
14037e2ad: 4489d8 mov eax, r11d
14037e2b0: 4421e0 and eax, r12d
14037e2b3: 6685c0 test ax, ax
14037e2b6: 74cb je 0x14037e283
14037e2b8: 4d89ee mov r14, r13
14037e2bb: 450f57ed xorps xmm13, xmm13
14037e2bf: 664485a568010000 test word ptr [rbp + 0x168], r12w
14037e2c7: 7404 je 0x14037e2cd
14037e2c9: 450f28ea movaps xmm13, xmm10
14037e2cd: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14037e2d4: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14037e2db: 8b4524 mov eax, dword ptr [rbp + 0x24]
14037e2de: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14037e2e2: 8901 mov dword ptr [rcx], eax
14037e2e4: 4c8b6d08 mov r13, qword ptr [rbp + 8]
14037e2e8: 498b5d30 mov rbx, qword ptr [r13 + 0x30]
14037e2ec: 4d8b7d40 mov r15, qword ptr [r13 + 0x40]
14037e2f0: 493b5d20 cmp rbx, qword ptr [r13 + 0x20]
14037e2f4: 750a jne 0x14037e300
14037e2f6: 498d4d20 lea rcx, [r13 + 0x20]
14037e2fa: e8c1c98705 call 0x145bfacc0
14037e2ff: 90 nop
14037e300: 41c1ec10 shr r12d, 0x10
14037e304: 498b4528 mov rax, qword ptr [r13 + 0x28]
14037e308: 488d0c5b lea rcx, [rbx + rbx*2]
14037e30c: 48c1e104 shl rcx, 4
14037e310: 48ba0000000000000080 movabs rdx, 0x8000000000000000
14037e31a: 48891408 mov qword ptr [rax + rcx], rdx
14037e31e: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14037e325: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14037e32a: f3440f116c0810 movss dword ptr [rax + rcx + 0x10], xmm13
14037e331: 664489640814 mov word ptr [rax + rcx + 0x14], r12w
14037e337: 4c897c0828 mov qword ptr [rax + rcx + 0x28], r15
14037e33c: 48ffc3 inc rbx
14037e33f: 49895d30 mov qword ptr [r13 + 0x30], rbx
14037e343: 49ff4540 inc qword ptr [r13 + 0x40]
14037e347: 4c8bbd70010000 mov r15, qword ptr [rbp + 0x170]
14037e34e: 8b85ac010000 mov eax, dword ptr [rbp + 0x1ac]
14037e354: 488b8d40010000 mov rcx, qword ptr [rbp + 0x140]
14037e35b: 8901 mov dword ptr [rcx], eax
14037e35d: 488b5e30 mov rbx, qword ptr [rsi + 0x30]
14037e361: 4c8b6e40 mov r13, qword ptr [rsi + 0x40]
14037e365: 483b5e20 cmp rbx, qword ptr [rsi + 0x20]
14037e369: 0f85e1feffff jne 0x14037e250
14037e36f: 488d4e20 lea rcx, [rsi + 0x20]
14037e373: e868c88705 call 0x145bfabe0
14037e378: e9d3feffff jmp 0x14037e250
14037e37d: 4585ed test r13d, r13d
14037e380: 0f94c0 sete al
14037e383: 0fb68dc5010000 movzx ecx, byte ptr [rbp + 0x1c5]
14037e38a: 80f101 xor cl, 1
14037e38d: 08c1 or cl, al
14037e38f: 4c8ba508010000 mov r12, qword ptr [rbp + 0x108]
14037e396: 0f84df000000 je 0x14037e47b
14037e39c: 0fb685c7010000 movzx eax, byte ptr [rbp + 0x1c7]
14037e3a3: 450f57ed xorps xmm13, xmm13
14037e3a7: f3440f2ae8 cvtsi2ss xmm13, eax
14037e3ac: f3450f5ee9 divss xmm13, xmm9
14037e3b1: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14037e3b8: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14037e3bf: 8b4524 mov eax, dword ptr [rbp + 0x24]
14037e3c2: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14037e3c6: 8901 mov dword ptr [rcx], eax
14037e3c8: 488b7d08 mov rdi, qword ptr [rbp + 8]
14037e3cc: 488b5f30 mov rbx, qword ptr [rdi + 0x30]
14037e3d0: 4c8b7740 mov r14, qword ptr [rdi + 0x40]
14037e3d4: 483b5f20 cmp rbx, qword ptr [rdi + 0x20]
14037e3d8: 750a jne 0x14037e3e4
14037e3da: 488d4f20 lea rcx, [rdi + 0x20]
14037e3de: e8ddc88705 call 0x145bfacc0
14037e3e3: 90 nop
14037e3e4: 488b4728 mov rax, qword ptr [rdi + 0x28]
14037e3e8: 488d0c5b lea rcx, [rbx + rbx*2]
14037e3ec: 48c1e104 shl rcx, 4
14037e3f0: 48ba0000000000000080 movabs rdx, 0x8000000000000000
14037e3fa: 48891408 mov qword ptr [rax + rcx], rdx
14037e3fe: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14037e405: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14037e40a: f3440f116c0810 movss dword ptr [rax + rcx + 0x10], xmm13
14037e411: c644081407 mov byte ptr [rax + rcx + 0x14], 7
14037e416: 4c89740828 mov qword ptr [rax + rcx + 0x28], r14
14037e41b: 48ffc3 inc rbx
14037e41e: 48895f30 mov qword ptr [rdi + 0x30], rbx
14037e422: 48ff4740 inc qword ptr [rdi + 0x40]
14037e426: 488b9d70010000 mov rbx, qword ptr [rbp + 0x170]
14037e42d: 8b85ac010000 mov eax, dword ptr [rbp + 0x1ac]
14037e433: 488b8d40010000 mov rcx, qword ptr [rbp + 0x140]
14037e43a: 8901 mov dword ptr [rcx], eax
14037e43c: 488b7e30 mov rdi, qword ptr [rsi + 0x30]
14037e440: 4c8b7640 mov r14, qword ptr [rsi + 0x40]
14037e444: 483b7e20 cmp rdi, qword ptr [rsi + 0x20]
14037e448: 7509 jne 0x14037e453
14037e44a: 488d4e20 lea rcx, [rsi + 0x20]
14037e44e: e88dc78705 call 0x145bfabe0
14037e453: 488b4628 mov rax, qword ptr [rsi + 0x28]
14037e457: 488d0c7f lea rcx, [rdi + rdi*2]
14037e45b: 4c8934c8 mov qword ptr [rax + rcx*8], r14
14037e45f: 48895cc808 mov qword ptr [rax + rcx*8 + 8], rbx
14037e464: f3440f116cc810 movss dword ptr [rax + rcx*8 + 0x10], xmm13
14037e46b: c644c81407 mov byte ptr [rax + rcx*8 + 0x14], 7
14037e470: 48ffc7 inc rdi
14037e473: 48897e30 mov qword ptr [rsi + 0x30], rdi
14037e477: 48ff4640 inc qword ptr [rsi + 0x40]
14037e47b: 0fb695c6010000 movzx edx, byte ptr [rbp + 0x1c6]
14037e482: 3a95c0010000 cmp dl, byte ptr [rbp + 0x1c0]
14037e488: 0f94c0 sete al
14037e48b: 4585ed test r13d, r13d
14037e48e: 0f95c1 setne cl
14037e491: 84c1 test cl, al
14037e493: 0f85db000000 jne 0x14037e574
14037e499: 0fb6c2 movzx eax, dl
14037e49c: 450f57ed xorps xmm13, xmm13
14037e4a0: f3440f2ae8 cvtsi2ss xmm13, eax
14037e4a5: f3450f5ee9 divss xmm13, xmm9
14037e4aa: 488b8570010000 mov rax, qword ptr [rbp + 0x170]
14037e4b1: 488985c8010000 mov qword ptr [rbp + 0x1c8], rax
14037e4b8: 8b4524 mov eax, dword ptr [rbp + 0x24]
14037e4bb: 488b4d18 mov rcx, qword ptr [rbp + 0x18]
14037e4bf: 8901 mov dword ptr [rcx], eax
14037e4c1: 488b7d08 mov rdi, qword ptr [rbp + 8]
14037e4c5: 488b5f30 mov rbx, qword ptr [rdi + 0x30]
14037e4c9: 4c8b7740 mov r14, qword ptr [rdi + 0x40]
14037e4cd: 483b5f20 cmp rbx, qword ptr [rdi + 0x20]
14037e4d1: 750a jne 0x14037e4dd
14037e4d3: 488d4f20 lea rcx, [rdi + 0x20]
14037e4d7: e8e4c78705 call 0x145bfacc0
14037e4dc: 90 nop
14037e4dd: 488b4728 mov rax, qword ptr [rdi + 0x28]
14037e4e1: 488d0c5b lea rcx, [rbx + rbx*2]
14037e4e5: 48c1e104 shl rcx, 4
14037e4e9: 48ba0000000000000080 movabs rdx, 0x8000000000000000
14037e4f3: 48891408 mov qword ptr [rax + rcx], rdx
14037e4f7: 488b95c8010000 mov rdx, qword ptr [rbp + 0x1c8]
14037e4fe: 4889540808 mov qword ptr [rax + rcx + 8], rdx
14037e503: f3440f116c0810 movss dword ptr [rax + rcx + 0x10], xmm13
14037e50a: c644081409 mov byte ptr [rax + rcx + 0x14], 9
14037e50f: 4c89740828 mov qword ptr [rax + rcx + 0x28], r14
14037e514: 48ffc3 inc rbx
14037e517: 48895f30 mov qword ptr [rdi + 0x30], rbx
14037e51b: 48ff4740 inc qword ptr [rdi + 0x40]
14037e51f: 488b9d70010000 mov rbx, qword ptr [rbp + 0x170]
14037e526: 8b85ac010000 mov eax, dword ptr [rbp + 0x1ac]
14037e52c: 488b8d40010000 mov rcx, qword ptr [rbp + 0x140]
14037e533: 8901 mov dword ptr [rcx], eax
14037e535: 488b7e30 mov rdi, qword ptr [rsi + 0x30]
14037e539: 4c8b7640 mov r14, qword ptr [rsi + 0x40]
14037e53d: 483b7e20 cmp rdi, qword ptr [rsi + 0x20]
14037e541: 7509 jne 0x14037e54c
14037e543: 488d4e20 lea rcx, [rsi + 0x20]
14037e547: e894c68705 call 0x145bfabe0
14037e54c: 488b4628 mov rax, qword ptr [rsi + 0x28]
14037e550: 488d0c7f lea rcx, [rdi + rdi*2]
14037e554: 4c8934c8 mov qword ptr [rax + rcx*8], r14
14037e558: 48895cc808 mov qword ptr [rax + rcx*8 + 8], rbx
14037e55d: f3440f116cc810 movss dword ptr [rax + rcx*8 + 0x10], xmm13
14037e564: c644c81409 mov byte ptr [rax + rcx*8 + 0x14], 9
14037e569: 48ffc7 inc rdi
14037e56c: 48897e30 mov qword ptr [rsi + 0x30], rdi
14037e570: 48ff4640 inc qword ptr [rsi + 0x40]
14037e574: 488d8590010000 lea rax, [rbp + 0x190]
14037e57b: 488985b0000000 mov qword ptr [rbp + 0xb0], rax
14037e582: 488d4508 lea rax, [rbp + 8]
14037e586: 488985b8000000 mov qword ptr [rbp + 0xb8], rax
14037e58d: 488d8570010000 lea rax, [rbp + 0x170]
14037e594: 488985c0000000 mov qword ptr [rbp + 0xc0], rax
14037e59b: 488d4568 lea rax, [rbp + 0x68]
14037e59f: 488985c8000000 mov qword ptr [rbp + 0xc8], rax
14037e5a6: 66450f7ee0 movd r8d, xmm12
14037e5ab: 488db5b0000000 lea rsi, [rbp + 0xb0]
14037e5b2: 4889f1 mov rcx, rsi
14037e5b5: 31d2 xor edx, edx
14037e5b7: 440fb78dd4010000 movzx r9d, word ptr [rbp + 0x1d4]
14037e5bf: e88c5cfeff call 0x140364250
14037e5c4: 66450fc5c401 pextrw r8d, xmm12, 1
14037e5ca: 4889f1 mov rcx, rsi
14037e5cd: b201 mov dl, 1
14037e5cf: 448b8db4010000 mov r9d, dword ptr [rbp + 0x1b4]
14037e5d6: e8755cfeff call 0x140364250
14037e5db: 66450fc5c402 pextrw r8d, xmm12, 2
14037e5e1: 4889f1 mov rcx, rsi
14037e5e4: b203 mov dl, 3
14037e5e6: 448b8d64010000 mov r9d, dword ptr [rbp + 0x164]
14037e5ed: e85e5cfeff call 0x140364250
14037e5f2: 4889f1 mov rcx, rsi
14037e5f5: b204 mov dl, 4
14037e5f7: 448b853c010000 mov r8d, dword ptr [rbp + 0x13c]
14037e5fe: 448b8d38010000 mov r9d, dword ptr [rbp + 0x138]
14037e605: e8465cfeff call 0x140364250
14037e60a: e9b1f5ffff jmp 0x14037dbc0
14037e60f: 0f28b5e0010000 movaps xmm6, xmmword ptr [rbp + 0x1e0]
14037e616: 0f28bdf0010000 movaps xmm7, xmmword ptr [rbp + 0x1f0]
14037e61d: 440f288500020000 movaps xmm8, xmmword ptr [rbp + 0x200]
14037e625: 440f288d10020000 movaps xmm9, xmmword ptr [rbp + 0x210]
14037e62d: 440f289520020000 movaps xmm10, xmmword ptr [rbp + 0x220]
14037e635: 440f289d30020000 movaps xmm11, xmmword ptr [rbp + 0x230]
14037e63d: 440f28a540020000 movaps xmm12, xmmword ptr [rbp + 0x240]
14037e645: 440f28ad50020000 movaps xmm13, xmmword ptr [rbp + 0x250]
14037e64d: 4881c4e8020000 add rsp, 0x2e8
14037e654: 5b pop rbx
14037e655: 5f pop rdi
14037e656: 5e pop rsi
14037e657: 415c pop r12
14037e659: 415d pop r13
14037e65b: 415e pop r14
14037e65d: 415f pop r15
14037e65f: 5d pop rbp
14037e660: c3 ret
