0x1453c6e50: push rbp
0x1453c6e51: push r15
0x1453c6e53: push r14
0x1453c6e55: push r13
0x1453c6e57: push r12
0x1453c6e59: push rsi
0x1453c6e5a: push rdi
0x1453c6e5b: push rbx
0x1453c6e5c: sub rsp, 0x388
0x1453c6e63: lea rbp, [rsp + 0x80]
0x1453c6e6b: mov qword ptr [rbp + 0x2f8], 0xfffffffffffffffe
0x1453c6e76: mov rsi, r8
0x1453c6e79: mov rbx, rdx
0x1453c6e7c: mov rdi, rcx
0x1453c6e7f: mov rcx, rdx
0x1453c6e82: call 0x14579a780
0x1453c6e87: mov qword ptr [rbp + 0x2e0], rax
0x1453c6e8e: inc dword ptr [rax + 0x50]
0x1453c6e91: mov r14, qword ptr [rax + 0x18]
0x1453c6e95: mov r15, qword ptr [rax + 0x48]
0x1453c6e99: mov qword ptr [rax + 0x18], rbx
0x1453c6e9d: call 0x14579ed00
0x1453c6ea2: nop
0x1453c6ea3: movups xmm0, xmmword ptr [rax]
0x1453c6ea6: mov qword ptr [rax], r15
0x1453c6ea9: mov qword ptr [rax + 8], rbx
0x1453c6ead: lea rax, [rbp + 0x2e0]
0x1453c6eb4: mov qword ptr [rbp + 0x70], rax
0x1453c6eb8: mov qword ptr [rbp + 0x78], r14
0x1453c6ebc: movups xmmword ptr [rbp + 0x80], xmm0
0x1453c6ec3: movapd xmm0, xmmword ptr [rip + 0x18c6345]
0x1453c6ecb: movupd xmmword ptr [rbp - 0x20], xmm0
0x1453c6ed0: movupd xmmword ptr [rbp - 0x30], xmm0
0x1453c6ed5: movupd xmmword ptr [rbp], xmm0
0x1453c6eda: movupd xmmword ptr [rbp - 0x10], xmm0
0x1453c6edf: mov rbx, qword ptr [rbp + 0x2e0]
0x1453c6ee6: cmp rsi, 9
0x1453c6eea: jae 0x1453c6f0b
0x1453c6eec: mov byte ptr [rbp + 0x2f7], 0
0x1453c6ef3: call 0x14579ed00
0x1453c6ef8: nop
0x1453c6ef9: mov rcx, qword ptr [rax]
0x1453c6efc: cmp rcx, qword ptr [rbx + 0x48]
0x1453c6f00: jne 0x1453c6f2a
0x1453c6f02: add rax, 8
0x1453c6f06: mov rbx, rax
0x1453c6f09: jmp 0x1453c6f3e
0x1453c6f0b: mov byte ptr [rbp + 0x2f7], 0
0x1453c6f12: call 0x14579ed00
0x1453c6f17: nop
0x1453c6f18: mov rcx, qword ptr [rax]
0x1453c6f1b: cmp rcx, qword ptr [rbx + 0x48]
0x1453c6f1f: jne 0x1453c6f85
0x1453c6f21: add rax, 8
0x1453c6f25: mov rbx, rax
0x1453c6f28: jmp 0x1453c6f99
0x1453c6f2a: cmp byte ptr [rbx + 0x54], 0
0x1453c6f2e: je 0x1453c6f3a
0x1453c6f30: cmp dword ptr [rbx + 0x50], 0
0x1453c6f34: je 0x1453c7d6f
0x1453c6f3a: add rbx, 0x18
0x1453c6f3e: mov rcx, qword ptr [rbx]
0x1453c6f41: mov byte ptr [rbp + 0x2f7], 0
0x1453c6f48: mov rdx, rsi
0x1453c6f4b: call 0x1457b9e20
0x1453c6f50: nop
0x1453c6f51: cmp rsi, rdx
0x1453c6f54: jne 0x1453c7cf1
0x1453c6f5a: lea r8, [rsi*8]
0x1453c6f62: lea r13, [rbp - 0x30]
0x1453c6f66: mov rcx, r13
0x1453c6f69: mov rdx, rax
0x1453c6f6c: call 0x145d145fb
0x1453c6f71: xor r14d, r14d
0x1453c6f74: test rsi, rsi
0x1453c6f77: je 0x1453c703a
0x1453c6f7d: mov rbx, rsi
0x1453c6f80: jmp 0x1453c7034
0x1453c6f85: cmp byte ptr [rbx + 0x54], 0
0x1453c6f89: je 0x1453c6f95
0x1453c6f8b: cmp dword ptr [rbx + 0x50], 0
0x1453c6f8f: je 0x1453c7db2
0x1453c6f95: add rbx, 0x18
0x1453c6f99: mov rcx, qword ptr [rbx]
0x1453c6f9c: mov byte ptr [rbp + 0x2f7], 0
0x1453c6fa3: mov rdx, rsi
0x1453c6fa6: call 0x1457b9e20
0x1453c6fab: nop
0x1453c6fac: mov rbx, rdx
0x1453c6faf: lea r14, [rdx*8]
0x1453c6fb7: mov rcx, rdx
0x1453c6fba: shr rcx, 0x3d
0x1453c6fbe: setne cl
0x1453c6fc1: movabs rdx, 0x7ffffffffffffff8
0x1453c6fcb: cmp r14, rdx
0x1453c6fce: seta dl
0x1453c6fd1: or dl, cl
0x1453c6fd3: je 0x1453c6ff0
0x1453c6fd5: xor r15d, r15d
0x1453c6fd8: mov byte ptr [rbp + 0x2f7], 0
0x1453c6fdf: mov rcx, r15
0x1453c6fe2: mov rdx, r14
0x1453c6fe5: call 0x145eb6fcb
0x1453c6fea: nop
0x1453c6feb: jmp 0x1453c7f02
0x1453c6ff0: test r14, r14
0x1453c6ff3: je 0x1453c7048
0x1453c6ff5: mov r12, rax
0x1453c6ff8: call 0x140002200
0x1453c6ffd: mov r15d, 8
0x1453c7003: mov edx, 8
0x1453c7008: mov rcx, r14
0x1453c700b: call 0x1400021c0
0x1453c7010: test rax, rax
0x1453c7013: je 0x1453c6fd8
0x1453c7015: mov r13, rax
0x1453c7018: mov r15, rbx
0x1453c701b: mov rax, r12
0x1453c701e: test rbx, rbx
0x1453c7021: je 0x1453c7056
0x1453c7023: mov rcx, r13
0x1453c7026: mov rdx, rax
0x1453c7029: mov r8, r14
0x1453c702c: call 0x145d145fb
0x1453c7031: mov r14b, 1
0x1453c7034: mov r8, qword ptr [r13]
0x1453c7038: jmp 0x1453c7065
0x1453c703a: movabs r8, 0xfffc000000000000
0x1453c7044: xor ebx, ebx
0x1453c7046: jmp 0x1453c7065
0x1453c7048: mov r13d, 8
0x1453c704e: xor r15d, r15d
0x1453c7051: test rbx, rbx
0x1453c7054: jne 0x1453c7023
0x1453c7056: movabs r8, 0xfffc000000000000
0x1453c7060: mov r14b, 1
0x1453c7063: xor ebx, ebx
0x1453c7065: mov qword ptr [rbp + 0x2c8], r13
0x1453c706c: mov qword ptr [rbp + 0x2c0], r15
0x1453c7073: mov byte ptr [rbp + 0x2f7], r14b
0x1453c707a: lea rcx, [rbp + 0x1b0]
0x1453c7081: lea rdx, [rbp + 0x2e0]
0x1453c7088: call 0x14579a650
0x1453c708d: nop
0x1453c708e: mov qword ptr [rbp + 0x2c8], r13
0x1453c7095: mov qword ptr [rbp + 0x2c0], r15
0x1453c709c: mov byte ptr [rbp + 0x2f7], r14b
0x1453c70a3: lea rcx, [rbp + 0x210]
0x1453c70aa: lea rdx, [rbp + 0x1b0]
0x1453c70b1: lea r8, [rbp + 0x2e0]
0x1453c70b8: call 0x14579ddd0
0x1453c70bd: nop
0x1453c70be: cmp byte ptr [rbp + 0x210], 0xff
0x1453c70c5: mov qword ptr [rbp + 0x2a8], r15
0x1453c70cc: mov qword ptr [rbp + 0x2d8], r14
0x1453c70d3: je 0x1453c7246
0x1453c70d9: mov qword ptr [rbp + 0x2c8], r13
0x1453c70e0: mov qword ptr [rbp + 0x2c0], r15
0x1453c70e7: mov byte ptr [rbp + 0x2f7], r14b
0x1453c70ee: lea rcx, [rbp + 0x1b0]
0x1453c70f5: lea r8, [rbp + 0x210]
0x1453c70fc: mov edx, 1
0x1453c7101: call 0x1457a3c40
0x1453c7106: nop
0x1453c7107: mov rax, qword ptr [rbp + 0x1f0]
0x1453c710e: mov qword ptr [rbp + 0x250], rax
0x1453c7115: movups xmm0, xmmword ptr [rbp + 0x1b0]
0x1453c711c: movups xmm1, xmmword ptr [rbp + 0x1c0]
0x1453c7123: movups xmm2, xmmword ptr [rbp + 0x1d0]
0x1453c712a: movups xmm3, xmmword ptr [rbp + 0x1e0]
0x1453c7131: movaps xmmword ptr [rbp + 0x240], xmm3
0x1453c7138: movaps xmmword ptr [rbp + 0x230], xmm2
0x1453c713f: movaps xmmword ptr [rbp + 0x220], xmm1
0x1453c7146: movaps xmmword ptr [rbp + 0x210], xmm0
0x1453c714d: movzx r14d, byte ptr [rbp + 0x210]
0x1453c7155: mov rax, qword ptr [rbp + 0x248]
0x1453c715c: mov qword ptr [rbp + 0x168], rax
0x1453c7163: mov rax, qword ptr [rbp + 0x250]
0x1453c716a: mov qword ptr [rbp + 0x170], rax
0x1453c7171: movzx eax, byte ptr [rbp + 0x217]
0x1453c7178: shl eax, 0x10
0x1453c717b: movzx ecx, word ptr [rbp + 0x215]
0x1453c7182: or ecx, eax
0x1453c7184: shl rcx, 0x20
0x1453c7188: mov edi, dword ptr [rbp + 0x211]
0x1453c718e: or rdi, rcx
0x1453c7191: mov r15, qword ptr [rbp + 0x218]
0x1453c7198: mov rax, qword ptr [rbp + 0x220]
0x1453c719f: mov qword ptr [rbp + 0x2e8], rax
0x1453c71a6: mov rax, qword ptr [rbp + 0x228]
0x1453c71ad: mov qword ptr [rbp + 0x2a0], rax
0x1453c71b4: mov rax, qword ptr [rbp + 0x240]
0x1453c71bb: mov qword ptr [rbp + 0x160], rax
0x1453c71c2: movapd xmm0, xmmword ptr [rbp + 0x230]
0x1453c71ca: movapd xmmword ptr [rbp + 0x150], xmm0
0x1453c71d2: mov rax, qword ptr [rbp + 0x170]
0x1453c71d9: movapd xmm0, xmmword ptr [rbp + 0x150]
0x1453c71e1: movaps xmm1, xmmword ptr [rbp + 0x160]
0x1453c71e8: movapd xmmword ptr [rbp + 0xa0], xmm0
0x1453c71f0: movaps xmmword ptr [rbp + 0xb0], xmm1
0x1453c71f7: mov qword ptr [rbp + 0xc0], rax
0x1453c71fe: cmp byte ptr [rbp + 0x2d8], 0
0x1453c7205: je 0x1453c7225
0x1453c7207: mov rdx, qword ptr [rbp + 0x2a8]
0x1453c720e: test rdx, rdx
0x1453c7211: je 0x1453c7225
0x1453c7213: shl rdx, 3
0x1453c7217: mov r8d, 8
0x1453c721d: mov rcx, r13
0x1453c7220: call 0x1400021d0
0x1453c7225: cmp r14b, 0xff
0x1453c7229: je 0x1453c7b6e
0x1453c722f: movzx eax, r14b
0x1453c7233: cmp eax, 0xfe
0x1453c7238: jne 0x1453c7292
0x1453c723a: mov qword ptr [rbp + 0x2d8], r15
0x1453c7241: jmp 0x1453c7e2c
0x1453c7246: movupd xmm0, xmmword ptr [rbp + 0x218]
0x1453c724e: movups xmm1, xmmword ptr [rbp + 0x228]
0x1453c7255: movups xmm2, xmmword ptr [rbp + 0x238]
0x1453c725c: movaps xmmword ptr [rbp + 0x1a0], xmm2
0x1453c7263: movaps xmmword ptr [rbp + 0x190], xmm1
0x1453c726a: movapd xmmword ptr [rbp + 0x180], xmm0
0x1453c7272: cmp rbx, 2
0x1453c7276: mov qword ptr [rbp + 0x2d0], r13
0x1453c727d: jae 0x1453c732a
0x1453c7283: movabs rdx, 0xfffc000000000000
0x1453c728d: jmp 0x1453c732e
0x1453c7292: mov byte ptr [rbp + 0x1b0], r14b
0x1453c7299: mov dword ptr [rbp + 0x1b1], edi
0x1453c729f: mov rax, rdi
0x1453c72a2: shr rax, 0x30
0x1453c72a6: mov byte ptr [rbp + 0x1b7], al
0x1453c72ac: shr rdi, 0x20
0x1453c72b0: mov word ptr [rbp + 0x1b5], di
0x1453c72b7: mov qword ptr [rbp + 0x1b8], r15
0x1453c72be: mov rax, qword ptr [rbp + 0x2e8]
0x1453c72c5: mov qword ptr [rbp + 0x1c0], rax
0x1453c72cc: mov rax, qword ptr [rbp + 0x2a0]
0x1453c72d3: mov qword ptr [rbp + 0x1c8], rax
0x1453c72da: movapd xmm0, xmmword ptr [rbp + 0xa0]
0x1453c72e2: movaps xmm1, xmmword ptr [rbp + 0xb0]
0x1453c72e9: movupd xmmword ptr [rbp + 0x1d0], xmm0
0x1453c72f1: movups xmmword ptr [rbp + 0x1e0], xmm1
0x1453c72f8: mov rax, qword ptr [rbp + 0xc0]
0x1453c72ff: mov qword ptr [rbp + 0x1f0], rax
0x1453c7306: lea rcx, [rbp + 0x2e0]
0x1453c730d: lea r8, [rbp + 0x1b0]
0x1453c7314: mov rdx, rsi
0x1453c7317: call 0x1457980b0
0x1453c731c: nop
0x1453c731d: mov r15, rax
0x1453c7320: mov esi, 1
0x1453c7325: jmp 0x1453c7e88
0x1453c732a: mov rdx, qword ptr [r13 + 8]
0x1453c732e: lea rcx, [rbp + 0x100]
0x1453c7335: lea r8, [rbp + 0x2e0]
0x1453c733c: call 0x1457a0230
0x1453c7341: nop
0x1453c7342: cmp byte ptr [rbp + 0x100], 0xff
0x1453c7349: je 0x1453c7498
0x1453c734f: lea rcx, [rbp + 0x1b0]
0x1453c7356: lea r8, [rbp + 0x100]
0x1453c735d: mov edx, 2
0x1453c7362: call 0x1457a3c40
0x1453c7367: nop
0x1453c7368: mov rax, qword ptr [rbp + 0x1f0]
0x1453c736f: mov qword ptr [rbp + 0x140], rax
0x1453c7376: movupd xmm0, xmmword ptr [rbp + 0x1b0]
0x1453c737e: movups xmm1, xmmword ptr [rbp + 0x1c0]
0x1453c7385: movups xmm2, xmmword ptr [rbp + 0x1d0]
0x1453c738c: movups xmm3, xmmword ptr [rbp + 0x1e0]
0x1453c7393: movaps xmmword ptr [rbp + 0x130], xmm3
0x1453c739a: movaps xmmword ptr [rbp + 0x120], xmm2
0x1453c73a1: movaps xmmword ptr [rbp + 0x110], xmm1
0x1453c73a8: movapd xmmword ptr [rbp + 0x100], xmm0
0x1453c73b0: mov r14b, byte ptr [rbp + 0x100]
0x1453c73b7: movaps xmmword ptr [rbp + 0x150], xmm2
0x1453c73be: movaps xmmword ptr [rbp + 0x160], xmm3
0x1453c73c5: mov qword ptr [rbp + 0x170], rax
0x1453c73cc: movzx r12d, byte ptr [rbp + 0x107]
0x1453c73d4: movzx ebx, word ptr [rbp + 0x105]
0x1453c73db: mov edi, dword ptr [rbp + 0x101]
0x1453c73e1: mov r15, qword ptr [rbp + 0x108]
0x1453c73e8: mov rax, qword ptr [rbp + 0x110]
0x1453c73ef: mov qword ptr [rbp + 0x2e8], rax
0x1453c73f6: mov rax, qword ptr [rbp + 0x118]
0x1453c73fd: mov qword ptr [rbp + 0x2a0], rax
0x1453c7404: lea rcx, [rbp + 0x180]
0x1453c740b: call 0x14579e640
0x1453c7410: nop
0x1453c7411: mov rax, qword ptr [rbp + 0x180]
0x1453c7418: dec qword ptr [rax]
0x1453c741b: jne 0x1453c742a
0x1453c741d: lea rcx, [rbp + 0x180]
0x1453c7424: call 0x1457c1790
0x1453c7429: nop
0x1453c742a: shl r12d, 0x10
0x1453c742e: or ebx, r12d
0x1453c7431: shl rbx, 0x20
0x1453c7435: or rdi, rbx
0x1453c7438: mov rcx, qword ptr [rbp + 0x188]
0x1453c743f: cmp rcx, -1
0x1453c7443: je 0x1453c76cb
0x1453c7449: dec qword ptr [rcx + 8]
0x1453c744d: mov r13, qword ptr [rbp + 0x2d0]
0x1453c7454: jne 0x1453c71d2
0x1453c745a: mov rax, qword ptr [rbp + 0x190]
0x1453c7461: mov rdx, qword ptr [rax + 8]
0x1453c7465: mov rax, qword ptr [rax + 0x10]
0x1453c7469: cmp rax, 9
0x1453c746d: mov r8d, 8
0x1453c7473: cmovae r8, rax
0x1453c7477: lea rax, [rdx + r8]
0x1453c747b: add rax, 0xf
0x1453c747f: mov rdx, r8
0x1453c7482: neg rdx
0x1453c7485: and rdx, rax
0x1453c7488: je 0x1453c71d2
0x1453c748e: call 0x1400021d0
0x1453c7493: jmp 0x1453c71d2
0x1453c7498: cmp rbx, 3
0x1453c749c: jae 0x1453c74aa
0x1453c749e: movabs r8, 0xfffc000000000000
0x1453c74a8: jmp 0x1453c74b5
0x1453c74aa: mov rax, qword ptr [rbp + 0x2d0]
0x1453c74b1: mov r8, qword ptr [rax + 0x10]
0x1453c74b5: mov rax, qword ptr [rbp + 0x110]
0x1453c74bc: mov qword ptr [rbp + 0x2b8], rax
0x1453c74c3: mov rax, qword ptr [rbp + 0x108]
0x1453c74ca: mov qword ptr [rbp + 0x2b0], rax
0x1453c74d1: lea rbx, [rbp + 0x260]
0x1453c74d8: lea rdx, [rbp + 0x2e0]
0x1453c74df: mov rcx, rbx
0x1453c74e2: call 0x14579a650
0x1453c74e7: nop
0x1453c74e8: movups xmm0, xmmword ptr [rbx]
0x1453c74eb: movups xmm1, xmmword ptr [rbx + 0x10]
0x1453c74ef: movups xmm2, xmmword ptr [rbx + 0x20]
0x1453c74f3: movaps xmmword ptr [rbp + 0x1d0], xmm0
0x1453c74fa: mov rax, qword ptr [rbx + 0x30]
0x1453c74fe: mov qword ptr [rbp + 0x200], rax
0x1453c7505: movaps xmmword ptr [rbp + 0x1f0], xmm2
0x1453c750c: movaps xmmword ptr [rbp + 0x1e0], xmm1
0x1453c7513: mov rcx, qword ptr [rbp + 0x180]
0x1453c751a: mov r8, qword ptr [rbp + 0x188]
0x1453c7521: movaps xmm0, xmmword ptr [rbp + 0x190]
0x1453c7528: movaps xmmword ptr [rbp + 0x1b0], xmm0
0x1453c752f: movaps xmm1, xmmword ptr [rbp + 0x1a0]
0x1453c7536: movaps xmmword ptr [rbp + 0x1c0], xmm1
0x1453c753d: mov r15, qword ptr [rbp + 0x118]
0x1453c7544: movaps xmmword ptr [rbp + 0x150], xmm0
0x1453c754b: movaps xmmword ptr [rbp + 0x160], xmm1
0x1453c7552: mov rax, qword ptr [rbp + 0x1d0]
0x1453c7559: mov qword ptr [rbp + 0x170], rax
0x1453c7560: movupd xmm0, xmmword ptr [rbp + 0x268]
0x1453c7568: movups xmm1, xmmword ptr [rbp + 0x278]
0x1453c756f: movups xmm2, xmmword ptr [rbp + 0x288]
0x1453c7576: movapd xmmword ptr [rbp + 0xd0], xmm0
0x1453c757e: movaps xmmword ptr [rbp + 0xe0], xmm1
0x1453c7585: movaps xmmword ptr [rbp + 0xf0], xmm2
0x1453c758c: mov rax, qword ptr [rbp + 0x2b0]
0x1453c7593: cmp rax, -1
0x1453c7597: je 0x1453c76ac
0x1453c759d: mov r12, r15
0x1453c75a0: mov rax, qword ptr [rbp + 0x170]
0x1453c75a7: mov qword ptr [rbp + 0x60], rax
0x1453c75ab: movaps xmm0, xmmword ptr [rbp + 0x150]
0x1453c75b2: movaps xmm1, xmmword ptr [rbp + 0x160]
0x1453c75b9: movaps xmmword ptr [rbp + 0x50], xmm1
0x1453c75bd: movaps xmmword ptr [rbp + 0x40], xmm0
0x1453c75c1: movaps xmm2, xmmword ptr [rbp + 0xd0]
0x1453c75c8: movaps xmm3, xmmword ptr [rbp + 0xe0]
0x1453c75cf: movaps xmm4, xmmword ptr [rbp + 0xf0]
0x1453c75d6: movaps xmmword ptr [rbp + 0x10], xmm2
0x1453c75da: movaps xmmword ptr [rbp + 0x20], xmm3
0x1453c75de: movaps xmmword ptr [rbp + 0x30], xmm4
0x1453c75e2: mov qword ptr [rbp + 0x1d0], rax
0x1453c75e9: movaps xmmword ptr [rbp + 0x1c0], xmm1
0x1453c75f0: movaps xmmword ptr [rbp + 0x1b0], xmm0
0x1453c75f7: movaps xmm2, xmmword ptr [rbp + 0x10]
0x1453c75fb: movaps xmm3, xmmword ptr [rbp + 0x20]
0x1453c75ff: movaps xmm4, xmmword ptr [rbp + 0x30]
0x1453c7603: movups xmmword ptr [rbp + 0x1d8], xmm2
0x1453c760a: movups xmmword ptr [rbp + 0x1e8], xmm3
0x1453c7611: movups xmmword ptr [rbp + 0x1f8], xmm4
0x1453c7618: mov qword ptr [rbp + 0x210], rcx
0x1453c761f: mov qword ptr [rbp + 0x218], r8
0x1453c7626: movups xmmword ptr [rbp + 0x220], xmm0
0x1453c762d: movups xmmword ptr [rbp + 0x230], xmm1
0x1453c7634: mov rax, qword ptr [rbp + 0x1d0]
0x1453c763b: mov rcx, qword ptr [rbp + 0x1d8]
0x1453c7642: movapd xmm0, xmmword ptr [rbp + 0x1e0]
0x1453c764a: movaps xmm1, xmmword ptr [rbp + 0x1f0]
0x1453c7651: mov qword ptr [rbp + 0x100], rax
0x1453c7658: mov qword ptr [rbp + 0x108], rcx
0x1453c765f: mov rax, qword ptr [rbp + 0x200]
0x1453c7666: mov qword ptr [rbp + 0x130], rax
0x1453c766d: movaps xmmword ptr [rbp + 0x120], xmm1
0x1453c7674: movapd xmmword ptr [rbp + 0x110], xmm0
0x1453c767c: movzx eax, byte ptr [rbp + 0x100]
0x1453c7683: movabs rbx, 0x7fffffffffffffff
0x1453c768d: cmp eax, 5
0x1453c7690: je 0x1453c76fd
0x1453c7692: cmp eax, 4
0x1453c7695: je 0x1453c76d7
0x1453c7697: cmp eax, 3
0x1453c769a: jne 0x1453c7757
0x1453c76a0: mov r14, qword ptr [rbp + 0x108]
0x1453c76a7: jmp 0x1453c775a
0x1453c76ac: mov qword ptr [rbp + 0x2a0], r8
0x1453c76b3: mov qword ptr [rbp + 0x2e8], rcx
0x1453c76ba: mov rax, qword ptr [rbp + 0x2b8]
0x1453c76c1: mov rdi, rax
0x1453c76c4: shr rdi, 8
0x1453c76c8: mov r14d, eax
0x1453c76cb: mov r13, qword ptr [rbp + 0x2d0]
0x1453c76d2: jmp 0x1453c71d2
0x1453c76d7: movsd xmm0, qword ptr [rbp + 0x108]
0x1453c76df: cvttsd2si rax, xmm0
0x1453c76e4: ucomisd xmm0, qword ptr [rip + 0xb1c59c]
0x1453c76ec: cmova rax, rbx
0x1453c76f0: xor r14d, r14d
0x1453c76f3: ucomisd xmm0, xmm0
0x1453c76f7: cmovnp r14, rax
0x1453c76fb: jmp 0x1453c775a
0x1453c76fd: lea rdx, [rbp + 0x108]
0x1453c7704: lea rcx, [rbp + 0x258]
0x1453c770b: call 0x14579d0d0
0x1453c7710: nop
0x1453c7711: cmp byte ptr [rbp + 0x258], 0xff
0x1453c7718: je 0x1453c7729
0x1453c771a: lea rcx, [rbp + 0x258]
0x1453c7721: call 0x1452d5a00
0x1453c7726: nop
0x1453c7727: jmp 0x1453c7757
0x1453c7729: movzx ecx, byte ptr [rbp + 0x260]
0x1453c7730: movupd xmm0, xmmword ptr [rbp + 0x261]
0x1453c7738: movapd xmmword ptr [rbp + 0xd0], xmm0
0x1453c7740: mov rax, qword ptr [rbp + 0x270]
0x1453c7747: mov qword ptr [rbp + 0xdf], rax
0x1453c774e: cmp cl, 2
0x1453c7751: jne 0x1453c7b75
0x1453c7757: xor r14d, r14d
0x1453c775a: mov rcx, qword ptr [rbp + 0x2e0]
0x1453c7761: call 0x1452c4780
0x1453c7766: nop
0x1453c7767: mov r13, rax
0x1453c776a: test rax, rax
0x1453c776d: je 0x1453c7e0e
0x1453c7773: mov qword ptr [rbp + 0x258], r13
0x1453c777a: mov rax, qword ptr [r13 + 0x10]
0x1453c777e: cmp rax, rbx
0x1453c7781: jae 0x1453c7df5
0x1453c7787: lea rcx, [r13 + 0x10]
0x1453c778b: inc rax
0x1453c778e: mov qword ptr [r13 + 0x10], rax
0x1453c7792: mov rdx, r13
0x1453c7795: add rdx, 0x18
0x1453c7799: mov qword ptr [rbp + 0xd0], rdx
0x1453c77a0: mov qword ptr [rbp + 0xd8], rcx
0x1453c77a7: mov qword ptr [rbp + 0xe0], r13
0x1453c77ae: cmp r14, 2
0x1453c77b2: mov r15d, 1
0x1453c77b8: cmovge r15, r14
0x1453c77bc: lea rcx, [rbp + 0x258]
0x1453c77c3: mov r8, qword ptr [rbp + 0x2b8]
0x1453c77ca: mov r9, r12
0x1453c77cd: call 0x1451efd10
0x1453c77d2: nop
0x1453c77d3: lea rbx, [rbp + 0xe0]
0x1453c77da: movzx r14d, byte ptr [rbp + 0x258]
0x1453c77e2: cmp r14b, 0xff
0x1453c77e6: je 0x1453c78cf
0x1453c77ec: mov rcx, r13
0x1453c77ef: movzx r13d, byte ptr [rbp + 0x25f]
0x1453c77f7: movzx r12d, word ptr [rbp + 0x25d]
0x1453c77ff: mov edi, dword ptr [rbp + 0x259]
0x1453c7805: mov r15, qword ptr [rbp + 0x260]
0x1453c780c: mov rax, qword ptr [rbp + 0x268]
0x1453c7813: mov qword ptr [rbp + 0x2e8], rax
0x1453c781a: mov rax, qword ptr [rbp + 0x270]
0x1453c7821: mov qword ptr [rbp + 0x2a0], rax
0x1453c7828: movups xmm0, xmmword ptr [rbp + 0x278]
0x1453c782f: movaps xmmword ptr [rbp + 0x180], xmm0
0x1453c7836: movupd xmm0, xmmword ptr [rbp + 0x288]
0x1453c783e: movapd xmmword ptr [rbp + 0x190], xmm0
0x1453c7846: mov rax, qword ptr [rbp + 0x298]
0x1453c784d: mov qword ptr [rbp + 0x1a0], rax
0x1453c7854: dec qword ptr [rcx + 0x10]
0x1453c7858: dec qword ptr [rcx]
0x1453c785b: jne 0x1453c7866
0x1453c785d: mov rcx, rbx
0x1453c7860: call 0x145074f00
0x1453c7865: nop
0x1453c7866: lea rcx, [rbp + 0x100]
0x1453c786d: call 0x1452d5780
0x1453c7872: nop
0x1453c7873: mov rdx, qword ptr [rbp + 0x2b0]
0x1453c787a: test rdx, rdx
0x1453c787d: je 0x1453c7892
0x1453c787f: mov r8d, 1
0x1453c7885: mov rcx, qword ptr [rbp + 0x2b8]
0x1453c788c: call 0x1400021d0
0x1453c7891: nop
0x1453c7892: lea rcx, [rbp + 0x210]
0x1453c7899: call 0x14579e640
0x1453c789e: nop
0x1453c789f: shl r13d, 0x10
0x1453c78a3: or r12d, r13d
0x1453c78a6: shl r12, 0x20
0x1453c78aa: or rdi, r12
0x1453c78ad: mov rax, qword ptr [rbp + 0x210]
0x1453c78b4: dec qword ptr [rax]
0x1453c78b7: jne 0x1453c7ab0
0x1453c78bd: lea rcx, [rbp + 0x210]
0x1453c78c4: call 0x1457c1790
0x1453c78c9: nop
0x1453c78ca: jmp 0x1453c7ab0
0x1453c78cf: mov rax, qword ptr [rbp + 0x260]
0x1453c78d6: mov r14, 0xfffffffffffffffe
0x1453c78dd: test rax, rax
0x1453c78e0: je 0x1453c7941
0x1453c78e2: dec r15
0x1453c78e5: mov r8, qword ptr [rbp + 0x268]
0x1453c78ec: imul rcx, r8, 0x68
0x1453c78f0: mov rdx, rax
0x1453c78f3: test r15, r15
0x1453c78f6: je 0x1453c7924
0x1453c78f8: test r8, r8
0x1453c78fb: je 0x1453c7941
0x1453c78fd: movzx r8d, byte ptr [rdi]
0x1453c7901: lea rdx, [rax + 0x68]
0x1453c7905: mov r9, rcx
0x1453c7908: xor r10d, r10d
0x1453c790b: cmp byte ptr [rdx - 0xc], r8b
0x1453c790f: sete r10b
0x1453c7913: sub r15, r10
0x1453c7916: je 0x1453c7924
0x1453c7918: add rdx, 0x68
0x1453c791c: add r9, -0x68
0x1453c7920: jne 0x1453c7908
0x1453c7922: jmp 0x1453c7941
0x1453c7924: add rax, rcx
0x1453c7927: cmp rdx, rax
0x1453c792a: je 0x1453c7941
0x1453c792c: movzx ecx, byte ptr [rdi]
0x1453c792f: cmp byte ptr [rdx + 0x5c], cl
0x1453c7932: je 0x1453c7bd9
0x1453c7938: add rdx, 0x68
0x1453c793c: cmp rdx, rax
0x1453c793f: jne 0x1453c792f
0x1453c7941: dec qword ptr [r13 + 0x10]
0x1453c7945: dec qword ptr [r13]
0x1453c7949: jne 0x1453c7954
0x1453c794b: mov rcx, rbx
0x1453c794e: call 0x145074f00
0x1453c7953: nop
0x1453c7954: xor eax, eax
0x1453c7956: cmp r14, -2
0x1453c795a: lea rcx, [rbp + 0x158]
0x1453c7961: lea rdx, [rbp + 0x40]
0x1453c7965: cmove rdx, rcx
0x1453c7969: cmove edi, eax
0x1453c796c: mov qword ptr [rbp + 0x150], 0xffffffffffffffff
0x1453c7977: mov rax, 0xffffffffffffffff
0x1453c797e: cmovne rax, r14
0x1453c7982: movupd xmm0, xmmword ptr [rdx]
0x1453c7986: movapd xmmword ptr [rbp - 0x40], xmm0
0x1453c798b: mov qword ptr [rbp + 0xd0], rax
0x1453c7992: movupd xmmword ptr [rbp + 0xd8], xmm0
0x1453c799a: lea rax, [rbp + 0x150]
0x1453c79a1: mov qword ptr [rsp + 0x30], rax
0x1453c79a6: movabs rax, 0x100000000
0x1453c79b0: mov qword ptr [rsp + 0x28], rax
0x1453c79b5: lea rax, [rbp + 0xd0]
0x1453c79bc: mov qword ptr [rsp + 0x20], rax
0x1453c79c1: lea rcx, [rbp + 0x258]
0x1453c79c8: lea rdx, [rbp + 0x2e0]
0x1453c79cf: lea r8, [rbp + 0x210]
0x1453c79d6: mov r9d, edi
0x1453c79d9: call 0x1451c9110
0x1453c79de: nop
0x1453c79df: movzx r14d, byte ptr [rbp + 0x258]
0x1453c79e7: cmp r14b, 0xff
0x1453c79eb: je 0x1453c7a5e
0x1453c79ed: movzx eax, byte ptr [rbp + 0x25f]
0x1453c79f4: shl eax, 0x10
0x1453c79f7: movzx ecx, word ptr [rbp + 0x25d]
0x1453c79fe: or ecx, eax
0x1453c7a00: shl rcx, 0x20
0x1453c7a04: mov edi, dword ptr [rbp + 0x259]
0x1453c7a0a: or rdi, rcx
0x1453c7a0d: mov r15, qword ptr [rbp + 0x260]
0x1453c7a14: mov rax, qword ptr [rbp + 0x268]
0x1453c7a1b: mov qword ptr [rbp + 0x2e8], rax
0x1453c7a22: mov rax, qword ptr [rbp + 0x270]
0x1453c7a29: mov qword ptr [rbp + 0x2a0], rax
0x1453c7a30: movups xmm0, xmmword ptr [rbp + 0x278]
0x1453c7a37: movaps xmmword ptr [rbp + 0x180], xmm0
0x1453c7a3e: movupd xmm0, xmmword ptr [rbp + 0x288]
0x1453c7a46: movapd xmmword ptr [rbp + 0x190], xmm0
0x1453c7a4e: mov rax, qword ptr [rbp + 0x298]
0x1453c7a55: mov qword ptr [rbp + 0x1a0], rax
0x1453c7a5c: jmp 0x1453c7a5e
0x1453c7a5e: lea rcx, [rbp + 0x100]
0x1453c7a65: call 0x1452d5780
0x1453c7a6a: nop
0x1453c7a6b: mov rdx, qword ptr [rbp + 0x2b0]
0x1453c7a72: test rdx, rdx
0x1453c7a75: je 0x1453c7a8a
0x1453c7a77: mov r8d, 1
0x1453c7a7d: mov rcx, qword ptr [rbp + 0x2b8]
0x1453c7a84: call 0x1400021d0
0x1453c7a89: nop
0x1453c7a8a: lea rcx, [rbp + 0x210]
0x1453c7a91: call 0x14579e640
0x1453c7a96: nop
0x1453c7a97: mov rax, qword ptr [rbp + 0x210]
0x1453c7a9e: dec qword ptr [rax]
0x1453c7aa1: jne 0x1453c7ab0
0x1453c7aa3: lea rcx, [rbp + 0x210]
0x1453c7aaa: call 0x1457c1790
0x1453c7aaf: nop
0x1453c7ab0: mov rcx, qword ptr [rbp + 0x218]
0x1453c7ab7: cmp rcx, -1
0x1453c7abb: je 0x1453c7af8
0x1453c7abd: dec qword ptr [rcx + 8]
0x1453c7ac1: jne 0x1453c7af8
0x1453c7ac3: mov rax, qword ptr [rbp + 0x220]
0x1453c7aca: mov rdx, qword ptr [rax + 8]
0x1453c7ace: mov rax, qword ptr [rax + 0x10]
0x1453c7ad2: cmp rax, 9
0x1453c7ad6: mov r8d, 8
0x1453c7adc: cmovae r8, rax
0x1453c7ae0: lea rax, [rdx + r8]
0x1453c7ae4: add rax, 0xf
0x1453c7ae8: mov rdx, r8
0x1453c7aeb: neg rdx
0x1453c7aee: and rdx, rax
0x1453c7af1: je 0x1453c7af8
0x1453c7af3: call 0x1400021d0
0x1453c7af8: cmp r14b, 0xff
0x1453c7afc: mov r13, qword ptr [rbp + 0x2d0]
0x1453c7b03: je 0x1453c7b36
0x1453c7b05: mov rax, qword ptr [rbp + 0x1a0]
0x1453c7b0c: mov qword ptr [rbp + 0xc0], rax
0x1453c7b13: movapd xmm0, xmmword ptr [rbp + 0x180]
0x1453c7b1b: movaps xmm1, xmmword ptr [rbp + 0x190]
0x1453c7b22: movaps xmmword ptr [rbp + 0xb0], xmm1
0x1453c7b29: movapd xmmword ptr [rbp + 0xa0], xmm0
0x1453c7b31: jmp 0x1453c71fe
0x1453c7b36: cmp rsi, 0x1f3f
0x1453c7b3d: jbe 0x1453c7b47
0x1453c7b3f: mov r14b, 4
0x1453c7b42: jmp 0x1453c71fe
0x1453c7b47: cmp byte ptr [rbp + 0x2d8], 0
0x1453c7b4e: je 0x1453c7b6b
0x1453c7b50: mov r14b, 0xff
0x1453c7b53: xor r15d, r15d
0x1453c7b56: mov rdx, qword ptr [rbp + 0x2a8]
0x1453c7b5d: test rdx, rdx
0x1453c7b60: jne 0x1453c7213
0x1453c7b66: jmp 0x1453c7225
0x1453c7b6b: xor r15d, r15d
0x1453c7b6e: xor esi, esi
0x1453c7b70: jmp 0x1453c7e88
0x1453c7b75: mov rax, qword ptr [rbp + 0xdf]
0x1453c7b7c: mov qword ptr [rbp + 0x268], rax
0x1453c7b83: movapd xmm0, xmmword ptr [rbp + 0xd0]
0x1453c7b8b: movupd xmmword ptr [rbp + 0x259], xmm0
0x1453c7b93: mov byte ptr [rbp + 0x2e8], cl
0x1453c7b99: mov byte ptr [rbp + 0x258], cl
0x1453c7b9f: lea rcx, [rbp + 0x258]
0x1453c7ba6: call 0x14579d350
0x1453c7bab: nop
0x1453c7bac: test rdx, rdx
0x1453c7baf: je 0x1453c7c14
0x1453c7bb1: cmp rdx, 1
0x1453c7bb5: movzx r10d, byte ptr [rbp + 0x2e8]
0x1453c7bbd: jne 0x1453c7c24
0x1453c7bbf: movzx ecx, byte ptr [rax]
0x1453c7bc2: xor r14d, r14d
0x1453c7bc5: cmp ecx, 0x2b
0x1453c7bc8: je 0x1453c7d3f
0x1453c7bce: cmp ecx, 0x2d
0x1453c7bd1: je 0x1453c7d3f
0x1453c7bd7: jmp 0x1453c7c27
0x1453c7bd9: mov edi, dword ptr [rdx + 0x58]
0x1453c7bdc: cmp qword ptr [rdx], -1
0x1453c7be0: je 0x1453c7c08
0x1453c7be2: lea rcx, [rbp + 0x258]
0x1453c7be9: call 0x145ce7810
0x1453c7bee: nop
0x1453c7bef: mov r14, qword ptr [rbp + 0x258]
0x1453c7bf6: movupd xmm0, xmmword ptr [rbp + 0x260]
0x1453c7bfe: movapd xmmword ptr [rbp + 0x40], xmm0
0x1453c7c03: jmp 0x1453c7941
0x1453c7c08: mov r14, 0xffffffffffffffff
0x1453c7c0f: jmp 0x1453c7941
0x1453c7c14: mov r14, rdx
0x1453c7c17: movzx r10d, byte ptr [rbp + 0x2e8]
0x1453c7c1f: jmp 0x1453c7d3f
0x1453c7c24: movzx ecx, byte ptr [rax]
0x1453c7c27: cmp cl, 0x2d
0x1453c7c2a: je 0x1453c7c7d
0x1453c7c2c: movzx ecx, cl
0x1453c7c2f: cmp ecx, 0x2b
0x1453c7c32: jne 0x1453c7c3a
0x1453c7c34: inc rax
0x1453c7c37: dec rdx
0x1453c7c3a: cmp rdx, 0x10
0x1453c7c3e: jae 0x1453c7cc5
0x1453c7c44: test rdx, rdx
0x1453c7c47: je 0x1453c7d3c
0x1453c7c4d: xor ecx, ecx
0x1453c7c4f: xor r14d, r14d
0x1453c7c52: movzx r8d, byte ptr [rax + rcx]
0x1453c7c57: add r8d, -0x30
0x1453c7c5b: cmp r8d, 9
0x1453c7c5f: ja 0x1453c7d3c
0x1453c7c65: lea r9, [r14 + r14*4]
0x1453c7c69: mov r8d, r8d
0x1453c7c6c: lea r14, [r8 + r9*2]
0x1453c7c70: inc rcx
0x1453c7c73: cmp rdx, rcx
0x1453c7c76: jne 0x1453c7c52
0x1453c7c78: jmp 0x1453c7d3f
0x1453c7c7d: cmp rdx, 0x11
0x1453c7c81: jae 0x1453c7d0d
0x1453c7c87: mov rcx, rdx
0x1453c7c8a: dec rcx
0x1453c7c8d: je 0x1453c7d3c
0x1453c7c93: mov ecx, 1
0x1453c7c98: xor r14d, r14d
0x1453c7c9b: movzx r8d, byte ptr [rax + rcx]
0x1453c7ca0: add r8d, -0x30
0x1453c7ca4: cmp r8d, 9
0x1453c7ca8: ja 0x1453c7d3c
0x1453c7cae: add r14, r14
0x1453c7cb1: lea r14, [r14 + r14*4]
0x1453c7cb5: mov r8d, r8d
0x1453c7cb8: sub r14, r8
0x1453c7cbb: inc rcx
0x1453c7cbe: cmp rdx, rcx
0x1453c7cc1: jne 0x1453c7c9b
0x1453c7cc3: jmp 0x1453c7d3f
0x1453c7cc5: xor ecx, ecx
0x1453c7cc7: xor r14d, r14d
0x1453c7cca: imul r14, r14, 0xa
0x1453c7cce: jo 0x1453c7d3c
0x1453c7cd0: movzx r8d, byte ptr [rax + rcx]
0x1453c7cd5: add r8d, -0x30
0x1453c7cd9: cmp r8d, 9
0x1453c7cdd: ja 0x1453c7d3c
0x1453c7cdf: mov r8d, r8d
0x1453c7ce2: add r14, r8
0x1453c7ce5: jo 0x1453c7d3c
0x1453c7ce7: inc rcx
0x1453c7cea: cmp rdx, rcx
0x1453c7ced: jne 0x1453c7cca
0x1453c7cef: jmp 0x1453c7d3f
0x1453c7cf1: mov byte ptr [rbp + 0x2f7], 0
0x1453c7cf8: lea r8, [rip + 0x18d5811]
0x1453c7cff: mov rcx, rsi
0x1453c7d02: call 0x145eb7730
0x1453c7d07: nop
0x1453c7d08: jmp 0x1453c7f02
0x1453c7d0d: mov ecx, 1
0x1453c7d12: xor r14d, r14d
0x1453c7d15: imul r14, r14, 0xa
0x1453c7d19: jo 0x1453c7d3c
0x1453c7d1b: movzx r8d, byte ptr [rax + rcx]
0x1453c7d20: add r8d, -0x30
0x1453c7d24: cmp r8d, 9
0x1453c7d28: ja 0x1453c7d3c
0x1453c7d2a: mov r8d, r8d
0x1453c7d2d: sub r14, r8
0x1453c7d30: jo 0x1453c7d3c
0x1453c7d32: inc rcx
0x1453c7d35: cmp rdx, rcx
0x1453c7d38: jne 0x1453c7d15
0x1453c7d3a: jmp 0x1453c7d3f
0x1453c7d3c: xor r14d, r14d
0x1453c7d3f: test r10b, r10b
0x1453c7d42: je 0x1453c775a
0x1453c7d48: mov rdx, qword ptr [rbp + 0x268]
0x1453c7d4f: test rdx, rdx
0x1453c7d52: je 0x1453c775a
0x1453c7d58: mov rcx, qword ptr [rbp + 0x260]
0x1453c7d5f: mov r8d, 1
0x1453c7d65: call 0x1400021d0
0x1453c7d6a: jmp 0x1453c775a
0x1453c7d6f: lea rax, [rip + 0x18e1cfa]
0x1453c7d76: mov qword ptr [rbp + 0x1b0], rax
0x1453c7d7d: lea rax, [rip - 0x53c5cc4]
0x1453c7d84: mov qword ptr [rbp + 0x1b8], rax
0x1453c7d8b: mov byte ptr [rbp + 0x2f7], 0
0x1453c7d92: lea rcx, [rip + 0x18e1ce7]
0x1453c7d99: lea r8, [rip + 0x18e1ce8]
0x1453c7da0: lea rdx, [rbp + 0x1b0]
0x1453c7da7: call 0x145eb7540
0x1453c7dac: nop
0x1453c7dad: jmp 0x1453c7f02
0x1453c7db2: lea rax, [rip + 0x18e1cb7]
0x1453c7db9: mov qword ptr [rbp + 0x1b0], rax
0x1453c7dc0: lea rax, [rip - 0x53c5d07]
0x1453c7dc7: mov qword ptr [rbp + 0x1b8], rax
0x1453c7dce: mov byte ptr [rbp + 0x2f7], 0
0x1453c7dd5: lea rcx, [rip + 0x18e1ca4]
0x1453c7ddc: lea r8, [rip + 0x18e1ca5]
0x1453c7de3: lea rdx, [rbp + 0x1b0]
0x1453c7dea: call 0x145eb7540
0x1453c7def: nop
0x1453c7df0: jmp 0x1453c7f02
0x1453c7df5: mov qword ptr [rbp + 0x2e8], r13
0x1453c7dfc: lea rcx, [rip + 0x18c55cd]
0x1453c7e03: call 0x145eb7240
0x1453c7e08: nop
0x1453c7e09: jmp 0x1453c7f02
0x1453c7e0e: lea rcx, [rip + 0x18d5962]
0x1453c7e15: lea r8, [rip + 0x18d9024]
0x1453c7e1c: mov edx, 0xe
0x1453c7e21: call 0x145eb7280
0x1453c7e26: nop
0x1453c7e27: jmp 0x1453c7f02
0x1453c7e2c: mov rsi, qword ptr [rbp + 0x2e0]
0x1453c7e33: mov byte ptr [rbp + 0x2f6], 1
0x1453c7e3a: call 0x14579ed00
0x1453c7e3f: nop
0x1453c7e40: mov rcx, qword ptr [rax]
0x1453c7e43: cmp rcx, qword ptr [rsi + 0x48]
0x1453c7e47: jne 0x1453c7e52
0x1453c7e49: add rax, 8
0x1453c7e4d: mov rsi, rax
0x1453c7e50: jmp 0x1453c7e62
0x1453c7e52: cmp byte ptr [rsi + 0x54], 0
0x1453c7e56: je 0x1453c7e5e
0x1453c7e58: cmp dword ptr [rsi + 0x50], 0
0x1453c7e5c: je 0x1453c7ec4
0x1453c7e5e: add rsi, 0x18
0x1453c7e62: mov rdx, qword ptr [rbp + 0x2d8]
0x1453c7e69: mov r8, qword ptr [rbp + 0x2e8]
0x1453c7e70: mov rcx, qword ptr [rsi]
0x1453c7e73: mov byte ptr [rbp + 0x2f6], 0
0x1453c7e7a: call 0x1457979a0
0x1453c7e7f: nop
0x1453c7e80: mov esi, 1
0x1453c7e85: mov r15, rax
0x1453c7e88: lea rcx, [rbp + 0x70]
0x1453c7e8c: call 0x14579d940
0x1453c7e91: nop
0x1453c7e92: mov rax, qword ptr [rbp + 0x2e0]
0x1453c7e99: dec qword ptr [rax]
0x1453c7e9c: jne 0x1453c7eaa
0x1453c7e9e: lea rcx, [rbp + 0x2e0]
0x1453c7ea5: call 0x1457a1ee0
0x1453c7eaa: mov rax, rsi
0x1453c7ead: mov rdx, r15
0x1453c7eb0: add rsp, 0x388
0x1453c7eb7: pop rbx
0x1453c7eb8: pop rdi
0x1453c7eb9: pop rsi
0x1453c7eba: pop r12
0x1453c7ebc: pop r13
0x1453c7ebe: pop r14
0x1453c7ec0: pop r15
0x1453c7ec2: pop rbp
0x1453c7ec3: ret
0x1453c7ec4: lea rax, [rip + 0x18e1ba5]
0x1453c7ecb: mov qword ptr [rbp + 0x90], rax
0x1453c7ed2: lea rax, [rip - 0x53c5e19]
0x1453c7ed9: mov qword ptr [rbp + 0x98], rax
0x1453c7ee0: mov byte ptr [rbp + 0x2f6], 1
0x1453c7ee7: lea rcx, [rip + 0x18e1b92]
0x1453c7eee: lea r8, [rip + 0x18e1b93]
0x1453c7ef5: lea rdx, [rbp + 0x90]
0x1453c7efc: call 0x145eb7540
0x1453c7f01: nop
0x1453c7f02: ud2
