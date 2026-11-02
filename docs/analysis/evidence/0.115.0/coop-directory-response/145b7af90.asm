0x145b7af90: push rbp
0x145b7af91: push r15
0x145b7af93: push r14
0x145b7af95: push r13
0x145b7af97: push r12
0x145b7af99: push rsi
0x145b7af9a: push rdi
0x145b7af9b: push rbx
0x145b7af9c: sub rsp, 0x228
0x145b7afa3: lea rbp, [rsp + 0x80]
0x145b7afab: mov qword ptr [rbp + 0x1a0], 0xfffffffffffffffe
0x145b7afb6: mov r15, rcx
0x145b7afb9: mov qword ptr [rbp + 0x168], rdx
0x145b7afc0: mov qword ptr [rbp + 0x170], r8
0x145b7afc7: mov byte ptr [rbp + 0x180], 1
0x145b7afce: test r8, r8
0x145b7afd1: je 0x145b7b03e
0x145b7afd3: mov qword ptr [rbp + 0x178], 1
0x145b7afde: movzx eax, byte ptr [rdx]
0x145b7afe1: add eax, -0x14
0x145b7afe4: cmp eax, 0xa
0x145b7afe7: ja 0x145b7b03e
0x145b7afe9: lea rcx, [rip + 0x18323cc]
0x145b7aff0: movsxd rax, dword ptr [rcx + rax*4]
0x145b7aff4: add rax, rcx
0x145b7aff7: mov qword ptr [rbp + 0x150], r15
0x145b7affe: jmp rax
0x145b7b000: mov qword ptr [rbp + 0x130], 0
0x145b7b00b: mov qword ptr [rbp + 0x138], 8
0x145b7b016: mov qword ptr [rbp + 0x140], 0
0x145b7b021: cmp r8, 4
0x145b7b025: ja 0x145b7b2db
0x145b7b02b: mov byte ptr [rbp + 0x180], 0
0x145b7b032: mov qword ptr [rbp + 0x178], r8
0x145b7b039: jmp 0x145b7b318
0x145b7b03e: mov qword ptr [r15], 0xffffffffffffffff
0x145b7b045: jmp 0x145b7ba1e
0x145b7b04a: cmp r8, 4
0x145b7b04e: ja 0x145b7b2c9
0x145b7b054: mov byte ptr [rbp + 0x180], 0
0x145b7b05b: movabs r15, 0x8000000000000004
0x145b7b065: jmp 0x145b7b1e4
0x145b7b06a: lea rcx, [rbp + 0x50]
0x145b7b06e: lea rdx, [rbp + 0x168]
0x145b7b075: call 0x145b7bf90
0x145b7b07a: mov edi, dword ptr [rbp + 0x50]
0x145b7b07d: mov r12d, dword ptr [rbp + 0x54]
0x145b7b081: mov r13, qword ptr [rbp + 0x58]
0x145b7b085: mov rax, qword ptr [rbp + 0x60]
0x145b7b089: mov qword ptr [rbp + 0x198], rax
0x145b7b090: mov r8d, dword ptr [rbp + 0x68]
0x145b7b094: mov esi, dword ptr [rbp + 0x6c]
0x145b7b097: mov r10, qword ptr [rbp + 0x70]
0x145b7b09b: mov r11, qword ptr [rbp + 0x78]
0x145b7b09f: mov rax, qword ptr [rbp + 0x80]
0x145b7b0a6: mov qword ptr [rbp + 0x188], rax
0x145b7b0ad: mov rax, qword ptr [rbp + 0x88]
0x145b7b0b4: mov qword ptr [rbp + 0x158], rax
0x145b7b0bb: mov rbx, qword ptr [rbp + 0x90]
0x145b7b0c2: mov r9, qword ptr [rbp + 0x98]
0x145b7b0c9: mov rax, qword ptr [rbp + 0xb8]
0x145b7b0d0: mov qword ptr [rbp + 0x40], rax
0x145b7b0d4: mov r14, qword ptr [rbp + 0xa0]
0x145b7b0db: movups xmm0, xmmword ptr [rbp + 0xa8]
0x145b7b0e2: movaps xmmword ptr [rbp + 0x30], xmm0
0x145b7b0e6: movabs r15, 0x8000000000000009
0x145b7b0f0: jmp 0x145b7b940
0x145b7b0f5: lea rcx, [rbp + 0x50]
0x145b7b0f9: lea rdx, [rbp + 0x168]
0x145b7b100: call 0x145b7c600
0x145b7b105: mov edi, dword ptr [rbp + 0x50]
0x145b7b108: mov r12d, dword ptr [rbp + 0x54]
0x145b7b10c: mov r13, qword ptr [rbp + 0x58]
0x145b7b110: mov rax, qword ptr [rbp + 0x60]
0x145b7b114: mov qword ptr [rbp + 0x198], rax
0x145b7b11b: movabs r15, 0x8000000000000002
0x145b7b125: jmp 0x145b7b940
0x145b7b12a: lea rcx, [rbp + 0x50]
0x145b7b12e: lea rdx, [rbp + 0x168]
0x145b7b135: call 0x145b7c600
0x145b7b13a: mov edi, dword ptr [rbp + 0x50]
0x145b7b13d: mov r12d, dword ptr [rbp + 0x54]
0x145b7b141: mov r13, qword ptr [rbp + 0x58]
0x145b7b145: mov rax, qword ptr [rbp + 0x60]
0x145b7b149: mov qword ptr [rbp + 0x198], rax
0x145b7b150: movabs r15, 0x8000000000000003
0x145b7b15a: jmp 0x145b7b940
0x145b7b15f: lea rcx, [rbp + 0x50]
0x145b7b163: lea rdx, [rbp + 0x168]
0x145b7b16a: call 0x145b7c600
0x145b7b16f: mov edi, dword ptr [rbp + 0x50]
0x145b7b172: mov r12d, dword ptr [rbp + 0x54]
0x145b7b176: mov r13, qword ptr [rbp + 0x58]
0x145b7b17a: mov rax, qword ptr [rbp + 0x60]
0x145b7b17e: mov qword ptr [rbp + 0x198], rax
0x145b7b185: movabs r15, 0x8000000000000007
0x145b7b18f: jmp 0x145b7b940
0x145b7b194: lea rcx, [rbp + 0x50]
0x145b7b198: lea rdx, [rbp + 0x168]
0x145b7b19f: call 0x145b7c600
0x145b7b1a4: mov edi, dword ptr [rbp + 0x50]
0x145b7b1a7: mov r12d, dword ptr [rbp + 0x54]
0x145b7b1ab: mov r13, qword ptr [rbp + 0x58]
0x145b7b1af: mov rax, qword ptr [rbp + 0x60]
0x145b7b1b3: mov qword ptr [rbp + 0x198], rax
0x145b7b1ba: movabs r15, 0x8000000000000001
0x145b7b1c4: jmp 0x145b7b940
0x145b7b1c9: cmp r8, 4
0x145b7b1cd: ja 0x145b7b830
0x145b7b1d3: mov byte ptr [rbp + 0x180], 0
0x145b7b1da: movabs r15, 0x8000000000000005
0x145b7b1e4: xor edi, edi
0x145b7b1e6: jmp 0x145b7b83d
0x145b7b1eb: cmp r8, 4
0x145b7b1ef: ja 0x145b7b842
0x145b7b1f5: mov byte ptr [rbp + 0x180], 0
0x145b7b1fc: mov dword ptr [rbp + 0x190], 0
0x145b7b206: mov rax, r8
0x145b7b209: lea rsi, [rax + 4]
0x145b7b20d: cmp rsi, r8
0x145b7b210: jbe 0x145b7b859
0x145b7b216: jmp 0x145b7b86b
0x145b7b21b: lea rcx, [rbp + 0x118]
0x145b7b222: lea rdi, [rbp + 0x168]
0x145b7b229: mov rdx, rdi
0x145b7b22c: call 0x145b7c600
0x145b7b231: nop
0x145b7b232: lea rcx, [rbp + 0x50]
0x145b7b236: mov rdx, rdi
0x145b7b239: call 0x145b79f90
0x145b7b23e: nop
0x145b7b23f: mov r15, qword ptr [rbp + 0x118]
0x145b7b246: mov edi, dword ptr [rbp + 0x120]
0x145b7b24c: mov r12d, dword ptr [rbp + 0x124]
0x145b7b253: mov r13, qword ptr [rbp + 0x128]
0x145b7b25a: mov rax, qword ptr [rbp + 0x50]
0x145b7b25e: mov qword ptr [rbp + 0x198], rax
0x145b7b265: mov r8d, dword ptr [rbp + 0x58]
0x145b7b269: mov esi, dword ptr [rbp + 0x5c]
0x145b7b26c: mov r10, qword ptr [rbp + 0x60]
0x145b7b270: mov r11, qword ptr [rbp + 0x68]
0x145b7b274: mov rax, qword ptr [rbp + 0x70]
0x145b7b278: mov qword ptr [rbp + 0x188], rax
0x145b7b27f: mov rax, qword ptr [rbp + 0x78]
0x145b7b283: mov qword ptr [rbp + 0x158], rax
0x145b7b28a: mov rbx, qword ptr [rbp + 0x80]
0x145b7b291: mov rax, qword ptr [rbp + 0xa8]
0x145b7b298: mov qword ptr [rbp + 0x40], rax
0x145b7b29c: mov r9, qword ptr [rbp + 0x88]
0x145b7b2a3: movups xmm0, xmmword ptr [rbp + 0x98]
0x145b7b2aa: movaps xmmword ptr [rbp + 0x30], xmm0
0x145b7b2ae: mov r14, qword ptr [rbp + 0x90]
0x145b7b2b5: jmp 0x145b7b940
0x145b7b2ba: movabs r15, 0x8000000000000008
0x145b7b2c4: jmp 0x145b7b940
0x145b7b2c9: mov edi, dword ptr [rdx + 1]
0x145b7b2cc: movabs r15, 0x8000000000000004
0x145b7b2d6: jmp 0x145b7b83d
0x145b7b2db: mov qword ptr [rbp + 0x178], 5
0x145b7b2e6: add r8, -5
0x145b7b2ea: movabs rcx, 0x8888888888888889
0x145b7b2f4: mov rax, r8
0x145b7b2f7: mov r8, rdx
0x145b7b2fa: mul rcx
0x145b7b2fd: mov eax, dword ptr [r8 + 1]
0x145b7b301: shr rdx, 4
0x145b7b305: mov qword ptr [rbp + 0x148], rax
0x145b7b30c: cmp rdx, rax
0x145b7b30f: jae 0x145b7b323
0x145b7b311: mov byte ptr [rbp + 0x180], 0
0x145b7b318: mov qword ptr [rbp + 0x148], 0
0x145b7b323: lea rdi, [rbp + 0x68]
0x145b7b327: mov eax, 8
0x145b7b32c: mov qword ptr [rbp + 0x160], rax
0x145b7b333: lea rbx, [rbp + 0x168]
0x145b7b33a: mov rsi, 0xffffffffffffffff
0x145b7b341: mov qword ptr [rbp + 0x198], 0
0x145b7b34c: xor r13d, r13d
0x145b7b34f: jmp 0x145b7b3b3
0x145b7b351: nop word ptr cs:[rax + rax]
0x145b7b360: mov rax, qword ptr [rbp + 0x138]
0x145b7b367: mov qword ptr [rbp + 0x160], rax
0x145b7b36e: inc rsi
0x145b7b371: mov rax, qword ptr [rbp + 0x198]
0x145b7b378: mov r13, rsi
0x145b7b37b: mov rsi, rax
0x145b7b37e: imul rcx, rax, 0xc8
0x145b7b385: add rcx, qword ptr [rbp + 0x160]
0x145b7b38c: mov r8d, 0xc8
0x145b7b392: lea rdx, [rbp + 0x50]
0x145b7b396: call 0x145d145fb
0x145b7b39b: inc rsi
0x145b7b39e: mov qword ptr [rbp + 0x198], rsi
0x145b7b3a5: mov qword ptr [rbp + 0x140], rsi
0x145b7b3ac: mov rsi, 0xffffffffffffffff
0x145b7b3b3: mov qword ptr [rbp + 0x158], r13
0x145b7b3ba: cmp r13, qword ptr [rbp + 0x148]
0x145b7b3c1: jae 0x145b7b7a7
0x145b7b3c7: lea rcx, [rbp + 0x18]
0x145b7b3cb: mov rdx, rbx
0x145b7b3ce: call 0x145b7c600
0x145b7b3d3: nop
0x145b7b3d4: mov rcx, rbp
0x145b7b3d7: mov rdx, rbx
0x145b7b3da: call 0x145b7c600
0x145b7b3df: nop
0x145b7b3e0: lea rcx, [rbp - 0x18]
0x145b7b3e4: mov rdx, rbx
0x145b7b3e7: call 0x145b7c600
0x145b7b3ec: nop
0x145b7b3ed: lea rcx, [rbp - 0x30]
0x145b7b3f1: mov rdx, rbx
0x145b7b3f4: call 0x145b7c600
0x145b7b3f9: nop
0x145b7b3fa: mov rdx, qword ptr [rbp + 0x170]
0x145b7b401: mov rax, qword ptr [rbp + 0x178]
0x145b7b408: mov rcx, rax
0x145b7b40b: inc rcx
0x145b7b40e: mov r8, rcx
0x145b7b411: cmove r8, rsi
0x145b7b415: cmp r8, rdx
0x145b7b418: jbe 0x145b7b430
0x145b7b41a: mov byte ptr [rbp + 0x180], 0
0x145b7b421: mov qword ptr [rbp + 0x178], rdx
0x145b7b428: jmp 0x145b7b450
0x145b7b42a: nop word ptr [rax + rax]
0x145b7b430: mov rdx, qword ptr [rbp + 0x168]
0x145b7b437: sub r8, rax
0x145b7b43a: mov qword ptr [rbp + 0x178], rcx
0x145b7b441: cmp r8, 1
0x145b7b445: jne 0x145b7b450
0x145b7b447: movzx r13d, byte ptr [rdx + rax]
0x145b7b44c: jmp 0x145b7b453
0x145b7b44e: nop
0x145b7b450: xor r13d, r13d
0x145b7b453: lea rcx, [rbp - 0x48]
0x145b7b457: mov rdx, rbx
0x145b7b45a: call 0x145b7c600
0x145b7b45f: nop
0x145b7b460: mov rax, qword ptr [rbp + 0x170]
0x145b7b467: mov rcx, qword ptr [rbp + 0x178]
0x145b7b46e: mov rdx, rcx
0x145b7b471: inc rdx
0x145b7b474: mov r8, rdx
0x145b7b477: cmove r8, rsi
0x145b7b47b: cmp r8, rax
0x145b7b47e: jbe 0x145b7b490
0x145b7b480: mov byte ptr [rbp + 0x180], 0
0x145b7b487: xor r14d, r14d
0x145b7b48a: mov rdx, rax
0x145b7b48d: jmp 0x145b7b4b3
0x145b7b48f: nop
0x145b7b490: sub r8, rcx
0x145b7b493: cmp r8, 1
0x145b7b497: jne 0x145b7b4b0
0x145b7b499: mov r8, qword ptr [rbp + 0x168]
0x145b7b4a0: movzx r14d, byte ptr [r8 + rcx]
0x145b7b4a5: jmp 0x145b7b4b3
0x145b7b4a7: nop word ptr [rax + rax]
0x145b7b4b0: xor r14d, r14d
0x145b7b4b3: mov rcx, rdx
0x145b7b4b6: inc rcx
0x145b7b4b9: mov r8, rcx
0x145b7b4bc: cmove r8, rsi
0x145b7b4c0: cmp r8, rax
0x145b7b4c3: jbe 0x145b7b4e0
0x145b7b4c5: mov byte ptr [rbp + 0x180], 0
0x145b7b4cc: xor r12d, r12d
0x145b7b4cf: mov rcx, rax
0x145b7b4d2: jmp 0x145b7b503
0x145b7b4d4: nop word ptr cs:[rax + rax]
0x145b7b4e0: sub r8, rdx
0x145b7b4e3: cmp r8, 1
0x145b7b4e7: jne 0x145b7b500
0x145b7b4e9: mov r8, qword ptr [rbp + 0x168]
0x145b7b4f0: cmp byte ptr [r8 + rdx], 0
0x145b7b4f5: setne r12b
0x145b7b4f9: jmp 0x145b7b503
0x145b7b4fb: nop dword ptr [rax + rax]
0x145b7b500: xor r12d, r12d
0x145b7b503: mov rdx, rcx
0x145b7b506: inc rdx
0x145b7b509: mov r8, rdx
0x145b7b50c: cmove r8, rsi
0x145b7b510: cmp r8, rax
0x145b7b513: jbe 0x145b7b530
0x145b7b515: mov byte ptr [rbp + 0x180], 0
0x145b7b51c: mov qword ptr [rbp + 0x178], rax
0x145b7b523: jmp 0x145b7b560
0x145b7b525: nop word ptr cs:[rax + rax]
0x145b7b530: mov rax, qword ptr [rbp + 0x168]
0x145b7b537: sub r8, rcx
0x145b7b53a: mov qword ptr [rbp + 0x178], rdx
0x145b7b541: cmp r8, 1
0x145b7b545: jne 0x145b7b560
0x145b7b547: cmp byte ptr [rax + rcx], 0
0x145b7b54b: setne r15b
0x145b7b54f: jmp 0x145b7b563
0x145b7b551: nop word ptr cs:[rax + rax]
0x145b7b560: xor r15d, r15d
0x145b7b563: lea rcx, [rbp - 0x60]
0x145b7b567: mov rdx, rbx
0x145b7b56a: call 0x145b7c600
0x145b7b56f: nop
0x145b7b570: mov rax, qword ptr [rbp + 0x170]
0x145b7b577: mov rdx, qword ptr [rbp + 0x178]
0x145b7b57e: mov rcx, rdx
0x145b7b581: add rcx, 4
0x145b7b585: mov r8, rcx
0x145b7b588: cmovb r8, rsi
0x145b7b58c: cmp r8, rax
0x145b7b58f: jbe 0x145b7b5a0
0x145b7b591: mov byte ptr [rbp + 0x180], 0
0x145b7b598: mov rcx, rax
0x145b7b59b: jmp 0x145b7b5c0
0x145b7b59d: nop dword ptr [rax]
0x145b7b5a0: sub r8, rdx
0x145b7b5a3: cmp r8, 4
0x145b7b5a7: jne 0x145b7b5c0
0x145b7b5a9: mov r8, qword ptr [rbp + 0x168]
0x145b7b5b0: mov edx, dword ptr [r8 + rdx]
0x145b7b5b4: jmp 0x145b7b5c2
0x145b7b5b6: nop word ptr cs:[rax + rax]
0x145b7b5c0: xor edx, edx
0x145b7b5c2: add rdx, rcx
0x145b7b5c5: mov r8, rdx
0x145b7b5c8: cmovb r8, rsi
0x145b7b5cc: cmp r8, rax
0x145b7b5cf: jbe 0x145b7b600
0x145b7b5d1: mov byte ptr [rbp + 0x180], 0
0x145b7b5d8: mov qword ptr [rbp + 0x178], rax
0x145b7b5df: mov eax, 1
0x145b7b5e4: mov qword ptr [rbp + 0x190], rax
0x145b7b5eb: mov qword ptr [rbp + 0x188], 0
0x145b7b5f6: jmp 0x145b7b6a9
0x145b7b5fb: nop dword ptr [rax + rax]
0x145b7b600: mov esi, r15d
0x145b7b603: mov r15d, r12d
0x145b7b606: mov r12d, r14d
0x145b7b609: mov r14d, r13d
0x145b7b60c: mov r13, qword ptr [rbp + 0x168]
0x145b7b613: add r13, rcx
0x145b7b616: sub r8, rcx
0x145b7b619: mov qword ptr [rbp + 0x188], r8
0x145b7b620: mov qword ptr [rbp + 0x178], rdx
0x145b7b627: js 0x145b7bc48
0x145b7b62d: jne 0x145b7b650
0x145b7b62f: mov eax, 1
0x145b7b634: mov qword ptr [rbp + 0x190], rax
0x145b7b63b: mov qword ptr [rbp + 0x188], 0
0x145b7b646: jmp 0x145b7b69d
0x145b7b648: nop dword ptr [rax + rax]
0x145b7b650: mov rdi, rbx
0x145b7b653: call 0x140002200
0x145b7b658: mov eax, 1
0x145b7b65d: mov qword ptr [rbp + 0x190], rax
0x145b7b664: mov edx, 1
0x145b7b669: mov rbx, qword ptr [rbp + 0x188]
0x145b7b670: mov rcx, rbx
0x145b7b673: call 0x1400021c0
0x145b7b678: test rax, rax
0x145b7b67b: je 0x145b7bc5a
0x145b7b681: mov qword ptr [rbp + 0x190], rax
0x145b7b688: mov rcx, rax
0x145b7b68b: mov rdx, r13
0x145b7b68e: mov r8, rbx
0x145b7b691: call 0x145d145fb
0x145b7b696: mov rbx, rdi
0x145b7b699: lea rdi, [rbp + 0x68]
0x145b7b69d: mov r13d, r14d
0x145b7b6a0: mov r14d, r12d
0x145b7b6a3: mov r12d, r15d
0x145b7b6a6: mov r15d, esi
0x145b7b6a9: lea rcx, [rbp + 0x118]
0x145b7b6b0: mov rdx, rbx
0x145b7b6b3: call 0x145b7c600
0x145b7b6b8: nop
0x145b7b6b9: mov rsi, qword ptr [rbp + 0x158]
0x145b7b6c0: mov rax, qword ptr [rbp + 0x28]
0x145b7b6c4: mov qword ptr [rbp + 0x60], rax
0x145b7b6c8: movups xmm0, xmmword ptr [rbp + 0x18]
0x145b7b6cc: movaps xmmword ptr [rbp + 0x50], xmm0
0x145b7b6d0: mov rax, qword ptr [rbp + 0x10]
0x145b7b6d4: mov qword ptr [rdi + 0x10], rax
0x145b7b6d8: movups xmm0, xmmword ptr [rbp]
0x145b7b6dc: movups xmmword ptr [rdi], xmm0
0x145b7b6df: mov rax, qword ptr [rbp - 8]
0x145b7b6e3: mov qword ptr [rdi + 0x28], rax
0x145b7b6e7: movups xmm0, xmmword ptr [rbp - 0x18]
0x145b7b6eb: movups xmmword ptr [rdi + 0x18], xmm0
0x145b7b6ef: mov rax, qword ptr [rbp - 0x20]
0x145b7b6f3: mov qword ptr [rdi + 0x40], rax
0x145b7b6f7: movups xmm0, xmmword ptr [rbp - 0x30]
0x145b7b6fb: movups xmmword ptr [rdi + 0x30], xmm0
0x145b7b6ff: mov byte ptr [rbp + 0x112], r13b
0x145b7b706: mov rax, qword ptr [rbp - 0x38]
0x145b7b70a: mov qword ptr [rdi + 0x58], rax
0x145b7b70e: movups xmm0, xmmword ptr [rbp - 0x48]
0x145b7b712: movups xmmword ptr [rdi + 0x48], xmm0
0x145b7b716: mov byte ptr [rbp + 0x113], r14b
0x145b7b71d: mov byte ptr [rbp + 0x110], r12b
0x145b7b724: mov byte ptr [rbp + 0x111], r15b
0x145b7b72b: mov rax, qword ptr [rbp - 0x50]
0x145b7b72f: mov qword ptr [rdi + 0x70], rax
0x145b7b733: movups xmm0, xmmword ptr [rbp - 0x60]
0x145b7b737: movups xmmword ptr [rdi + 0x60], xmm0
0x145b7b73b: mov rax, qword ptr [rbp + 0x188]
0x145b7b742: mov qword ptr [rbp + 0xe0], rax
0x145b7b749: mov rcx, qword ptr [rbp + 0x190]
0x145b7b750: mov qword ptr [rbp + 0xe8], rcx
0x145b7b757: mov qword ptr [rbp + 0xf0], rax
0x145b7b75e: mov rax, qword ptr [rbp + 0x128]
0x145b7b765: mov qword ptr [rdi + 0xa0], rax
0x145b7b76c: movups xmm0, xmmword ptr [rbp + 0x118]
0x145b7b773: movups xmmword ptr [rdi + 0x90], xmm0
0x145b7b77a: mov byte ptr [rbp + 0x114], 5
0x145b7b781: mov rax, qword ptr [rbp + 0x198]
0x145b7b788: cmp rax, qword ptr [rbp + 0x130]
0x145b7b78f: jne 0x145b7b36e
0x145b7b795: lea rcx, [rbp + 0x130]
0x145b7b79c: call 0x145e9e0b0
0x145b7b7a1: nop
0x145b7b7a2: jmp 0x145b7b360
0x145b7b7a7: cmp qword ptr [rbp + 0x198], 0
0x145b7b7af: je 0x145b7b922
0x145b7b7b5: imul rcx, qword ptr [rbp + 0x198], 0xc8
0x145b7b7c0: mov r8, qword ptr [rbp + 0x178]
0x145b7b7c7: mov r9, qword ptr [rbp + 0x168]
0x145b7b7ce: mov r10, qword ptr [rbp + 0x170]
0x145b7b7d5: lea r11, [rcx - 0xc8]
0x145b7b7dc: mov rax, r11
0x145b7b7df: shr rax, 3
0x145b7b7e3: movabs rdx, 0x28f5c28f5c28f5c3
0x145b7b7ed: mul rdx
0x145b7b7f0: bt edx, 2
0x145b7b7f4: jb 0x145b7b89e
0x145b7b7fa: mov rax, qword ptr [rbp + 0x160]
0x145b7b801: add rax, 0xc8
0x145b7b807: cmp r8, r10
0x145b7b80a: jae 0x145b7b915
0x145b7b810: movzx edx, byte ptr [r9 + r8]
0x145b7b815: test dl, dl
0x145b7b817: je 0x145b7b903
0x145b7b81d: movzx esi, dl
0x145b7b820: cmp dl, 5
0x145b7b823: mov edx, 5
0x145b7b828: cmovb edx, esi
0x145b7b82b: jmp 0x145b7b905
0x145b7b830: mov edi, dword ptr [rdx + 1]
0x145b7b833: movabs r15, 0x8000000000000005
0x145b7b83d: jmp 0x145b7b940
0x145b7b842: mov eax, dword ptr [rdx + 1]
0x145b7b845: mov dword ptr [rbp + 0x190], eax
0x145b7b84b: mov eax, 5
0x145b7b850: lea rsi, [rax + 4]
0x145b7b854: cmp rsi, r8
0x145b7b857: ja 0x145b7b86b
0x145b7b859: mov eax, dword ptr [rdx + rax]
0x145b7b85c: mov qword ptr [rbp + 0x198], rax
0x145b7b863: add rax, rsi
0x145b7b866: cmp rax, r8
0x145b7b869: jbe 0x145b7b8a7
0x145b7b86b: mov byte ptr [rbp + 0x180], 0
0x145b7b872: movabs r15, 0x8000000000000006
0x145b7b87c: xor r12d, r12d
0x145b7b87f: mov r13d, 1
0x145b7b885: mov qword ptr [rbp + 0x198], 0
0x145b7b890: xor edi, edi
0x145b7b892: mov r8d, dword ptr [rbp + 0x190]
0x145b7b899: jmp 0x145b7b940
0x145b7b89e: mov rax, qword ptr [rbp + 0x160]
0x145b7b8a5: jmp 0x145b7b915
0x145b7b8a7: movabs r15, 0x8000000000000006
0x145b7b8b1: xor r12d, r12d
0x145b7b8b4: cmp dword ptr [rbp + 0x198], 0
0x145b7b8bb: je 0x145b7b87f
0x145b7b8bd: mov rdi, rdx
0x145b7b8c0: call 0x140002200
0x145b7b8c5: mov edx, 1
0x145b7b8ca: mov rcx, qword ptr [rbp + 0x198]
0x145b7b8d1: call 0x1400021c0
0x145b7b8d6: test rax, rax
0x145b7b8d9: je 0x145b7bc6c
0x145b7b8df: mov rdx, rdi
0x145b7b8e2: add rdx, rsi
0x145b7b8e5: mov r13, rax
0x145b7b8e8: mov rcx, rax
0x145b7b8eb: mov rdi, qword ptr [rbp + 0x198]
0x145b7b8f2: mov r8, rdi
0x145b7b8f5: call 0x145d145fb
0x145b7b8fa: mov r8d, dword ptr [rbp + 0x190]
0x145b7b901: jmp 0x145b7b940
0x145b7b903: mov dl, 1
0x145b7b905: inc r8
0x145b7b908: mov rsi, qword ptr [rbp + 0x160]
0x145b7b90f: mov byte ptr [rsi + 0xc4], dl
0x145b7b915: cmp r11, 0xc8
0x145b7b91c: jae 0x145b7bbba
0x145b7b922: mov r13, qword ptr [rbp + 0x160]
0x145b7b929: mov edi, dword ptr [rbp + 0x130]
0x145b7b92f: mov r12d, dword ptr [rbp + 0x134]
0x145b7b936: movabs r15, 0x8000000000000000
0x145b7b940: cmp byte ptr [rbp + 0x180], 0
0x145b7b947: je 0x145b7b9bd
0x145b7b949: shl r12, 0x20
0x145b7b94d: mov eax, edi
0x145b7b94f: or rax, r12
0x145b7b952: shl rsi, 0x20
0x145b7b956: mov ecx, r8d
0x145b7b959: or rcx, rsi
0x145b7b95c: mov rdx, qword ptr [rbp + 0x40]
0x145b7b960: mov r8, qword ptr [rbp + 0x150]
0x145b7b967: mov qword ptr [r8 + 0x70], rdx
0x145b7b96b: movaps xmm0, xmmword ptr [rbp + 0x30]
0x145b7b96f: movups xmmword ptr [r8 + 0x60], xmm0
0x145b7b974: mov qword ptr [r8], r15
0x145b7b977: mov r15, r8
0x145b7b97a: mov qword ptr [r8 + 8], rax
0x145b7b97e: mov qword ptr [r8 + 0x10], r13
0x145b7b982: mov rax, qword ptr [rbp + 0x198]
0x145b7b989: mov qword ptr [r8 + 0x18], rax
0x145b7b98d: mov qword ptr [r8 + 0x20], rcx
0x145b7b991: mov qword ptr [r8 + 0x28], r10
0x145b7b995: mov qword ptr [r8 + 0x30], r11
0x145b7b999: mov rax, qword ptr [rbp + 0x188]
0x145b7b9a0: mov qword ptr [r8 + 0x38], rax
0x145b7b9a4: mov rax, qword ptr [rbp + 0x158]
0x145b7b9ab: mov qword ptr [r8 + 0x40], rax
0x145b7b9af: mov qword ptr [r8 + 0x48], rbx
0x145b7b9b3: mov qword ptr [r8 + 0x50], r9
0x145b7b9b7: mov qword ptr [r8 + 0x58], r14
0x145b7b9bb: jmp 0x145b7ba1e
0x145b7b9bd: mov rax, qword ptr [rbp + 0x150]
0x145b7b9c4: mov qword ptr [rax], 0xffffffffffffffff
0x145b7b9cb: movabs rcx, 0x8000000000000000
0x145b7b9d5: xor rcx, r15
0x145b7b9d8: test r15, r15
0x145b7b9db: mov eax, 0xa
0x145b7b9e0: cmovs rax, rcx
0x145b7b9e4: cmp rax, 9
0x145b7b9e8: ja 0x145b7bb19
0x145b7b9ee: lea rcx, [rip + 0x18319f3]
0x145b7b9f5: movsxd rax, dword ptr [rcx + rax*4]
0x145b7b9f9: add rax, rcx
0x145b7b9fc: mov r15, qword ptr [rbp + 0x150]
0x145b7ba03: jmp rax
0x145b7ba05: shl r12, 0x20
0x145b7ba09: mov edx, edi
0x145b7ba0b: or rdx, r12
0x145b7ba0e: je 0x145b7ba1e
0x145b7ba10: mov r8d, 1
0x145b7ba16: mov rcx, r13
0x145b7ba19: call 0x1400021d0
0x145b7ba1e: mov rax, r15
0x145b7ba21: add rsp, 0x228
0x145b7ba28: pop rbx
0x145b7ba29: pop rdi
0x145b7ba2a: pop rsi
0x145b7ba2b: pop r12
0x145b7ba2d: pop r13
0x145b7ba2f: pop r14
0x145b7ba31: pop r15
0x145b7ba33: pop rbp
0x145b7ba34: ret
0x145b7ba35: shl r12, 0x20
0x145b7ba39: mov edx, edi
0x145b7ba3b: or rdx, r12
0x145b7ba3e: je 0x145b7ba68
0x145b7ba40: mov dword ptr [rbp + 0x190], r8d
0x145b7ba47: mov r8d, 1
0x145b7ba4d: mov rcx, r13
0x145b7ba50: mov rdi, r9
0x145b7ba53: mov r12, r10
0x145b7ba56: call 0x1400021d0
0x145b7ba5b: mov r8d, dword ptr [rbp + 0x190]
0x145b7ba62: mov r10, r12
0x145b7ba65: mov r9, rdi
0x145b7ba68: shl rsi, 0x20
0x145b7ba6c: mov edx, r8d
0x145b7ba6f: or rdx, rsi
0x145b7ba72: je 0x145b7ba88
0x145b7ba74: mov r8d, 1
0x145b7ba7a: mov rcx, r10
0x145b7ba7d: mov rsi, r9
0x145b7ba80: call 0x1400021d0
0x145b7ba85: mov r9, rsi
0x145b7ba88: mov rdx, qword ptr [rbp + 0x188]
0x145b7ba8f: test rdx, rdx
0x145b7ba92: je 0x145b7baac
0x145b7ba94: mov r8d, 1
0x145b7ba9a: mov rcx, qword ptr [rbp + 0x158]
0x145b7baa1: mov rsi, r9
0x145b7baa4: call 0x1400021d0
0x145b7baa9: mov r9, rsi
0x145b7baac: test r9, r9
0x145b7baaf: je 0x145b7ba1e
0x145b7bab5: mov r8d, 1
0x145b7babb: mov rcx, r14
0x145b7babe: mov rdx, r9
0x145b7bac1: jmp 0x145b7ba19
0x145b7bac6: cmp qword ptr [rbp + 0x198], 0
0x145b7bace: je 0x145b7baf8
0x145b7bad0: mov r14, r13
0x145b7bad3: nop word ptr cs:[rax + rax]
0x145b7bae0: mov rcx, r14
0x145b7bae3: call 0x1405866c0
0x145b7bae8: add r14, 0xc8
0x145b7baef: dec qword ptr [rbp + 0x198]
0x145b7baf6: jne 0x145b7bae0
0x145b7baf8: shl r12, 0x20
0x145b7bafc: mov eax, edi
0x145b7bafe: or rax, r12
0x145b7bb01: je 0x145b7ba1e
0x145b7bb07: imul rdx, rax, 0xc8
0x145b7bb0e: mov r8d, 8
0x145b7bb14: jmp 0x145b7ba16
0x145b7bb19: test r15, r15
0x145b7bb1c: je 0x145b7bb47
0x145b7bb1e: shl r12, 0x20
0x145b7bb22: mov ecx, edi
0x145b7bb24: or rcx, r12
0x145b7bb27: mov r12d, r8d
0x145b7bb2a: mov r8d, 1
0x145b7bb30: mov rdx, r15
0x145b7bb33: mov rdi, r9
0x145b7bb36: mov r14, r11
0x145b7bb39: call 0x1400021d0
0x145b7bb3e: mov r8d, r12d
0x145b7bb41: mov r11, r14
0x145b7bb44: mov r9, rdi
0x145b7bb47: cmp qword ptr [rbp + 0x198], 0
0x145b7bb4f: je 0x145b7bb79
0x145b7bb51: shl rsi, 0x20
0x145b7bb55: mov ecx, r8d
0x145b7bb58: or rcx, rsi
0x145b7bb5b: mov r8d, 1
0x145b7bb61: mov rdx, qword ptr [rbp + 0x198]
0x145b7bb68: mov rsi, r9
0x145b7bb6b: mov rdi, r11
0x145b7bb6e: call 0x1400021d0
0x145b7bb73: mov r11, rdi
0x145b7bb76: mov r9, rsi
0x145b7bb79: test r11, r11
0x145b7bb7c: mov r15, qword ptr [rbp + 0x150]
0x145b7bb83: je 0x145b7bba0
0x145b7bb85: mov r8d, 1
0x145b7bb8b: mov rcx, qword ptr [rbp + 0x188]
0x145b7bb92: mov rdx, r11
0x145b7bb95: mov rsi, r9
0x145b7bb98: call 0x1400021d0
0x145b7bb9d: mov r9, rsi
0x145b7bba0: test rbx, rbx
0x145b7bba3: je 0x145b7ba1e
0x145b7bba9: mov r8d, 1
0x145b7bbaf: mov rcx, r9
0x145b7bbb2: mov rdx, rbx
0x145b7bbb5: jmp 0x145b7ba19
0x145b7bbba: add rcx, qword ptr [rbp + 0x160]
0x145b7bbc1: mov edx, 5
0x145b7bbc6: jmp 0x145b7bbed
0x145b7bbc8: movzx r11d, sil
0x145b7bbcc: cmp sil, 5
0x145b7bbd0: cmovae r11d, edx
0x145b7bbd4: inc r8
0x145b7bbd7: mov byte ptr [rax + 0x18c], r11b
0x145b7bbde: add rax, 0x190
0x145b7bbe4: cmp rax, rcx
0x145b7bbe7: je 0x145b7b922
0x145b7bbed: cmp r8, r10
0x145b7bbf0: jae 0x145b7bc20
0x145b7bbf2: movzx esi, byte ptr [r9 + r8]
0x145b7bbf7: test sil, sil
0x145b7bbfa: je 0x145b7bc34
0x145b7bbfc: movzx r11d, sil
0x145b7bc00: cmp sil, 5
0x145b7bc04: cmovae r11d, edx
0x145b7bc08: inc r8
0x145b7bc0b: mov byte ptr [rax + 0xc4], r11b
0x145b7bc12: cmp r8, r10
0x145b7bc15: jae 0x145b7bbde
0x145b7bc17: jmp 0x145b7bc25
0x145b7bc19: nop dword ptr [rax]
0x145b7bc20: cmp r8, r10
0x145b7bc23: jae 0x145b7bbde
0x145b7bc25: movzx esi, byte ptr [r9 + r8]
0x145b7bc2a: test sil, sil
0x145b7bc2d: jne 0x145b7bbc8
0x145b7bc2f: mov r11b, 1
0x145b7bc32: jmp 0x145b7bbd4
0x145b7bc34: mov r11b, 1
0x145b7bc37: inc r8
0x145b7bc3a: mov byte ptr [rax + 0xc4], r11b
0x145b7bc41: cmp r8, r10
0x145b7bc44: jae 0x145b7bbde
0x145b7bc46: jmp 0x145b7bc25
0x145b7bc48: mov qword ptr [rbp + 0x190], 0
0x145b7bc53: mov rbx, qword ptr [rbp + 0x188]
0x145b7bc5a: mov rcx, qword ptr [rbp + 0x190]
0x145b7bc61: mov rdx, rbx
0x145b7bc64: call 0x145eb6fcb
0x145b7bc69: nop
0x145b7bc6a: ud2
0x145b7bc6c: mov ecx, 1
0x145b7bc71: mov rdx, qword ptr [rbp + 0x198]
0x145b7bc78: call 0x145eb6fcb
0x145b7bc7d: ud2
