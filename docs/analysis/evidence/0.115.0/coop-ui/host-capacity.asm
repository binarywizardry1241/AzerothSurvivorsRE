0x1402f2b80: push rbp
0x1402f2b81: push r15
0x1402f2b83: push r14
0x1402f2b85: push r13
0x1402f2b87: push r12
0x1402f2b89: push rsi
0x1402f2b8a: push rdi
0x1402f2b8b: push rbx
0x1402f2b8c: sub rsp, 0x358
0x1402f2b93: lea rbp, [rsp + 0x80]
0x1402f2b9b: mov qword ptr [rbp + 0x2d0], 0xfffffffffffffffe
0x1402f2ba6: mov rbx, r8
0x1402f2ba9: mov rdi, rdx
0x1402f2bac: mov rsi, rcx
0x1402f2baf: mov r14, qword ptr [rcx]
0x1402f2bb2: mov rax, qword ptr [rcx + 0x28]
0x1402f2bb6: mov qword ptr [rbp + 0x1f0], r14
0x1402f2bbd: movups xmm0, xmmword ptr [rcx + 8]
0x1402f2bc1: movups xmmword ptr [rbp + 0x1f8], xmm0
0x1402f2bc8: movups xmm0, xmmword ptr [rcx + 0x18]
0x1402f2bcc: movups xmmword ptr [rbp + 0x208], xmm0
0x1402f2bd3: mov qword ptr [rbp + 0x218], rax
0x1402f2bda: lea rcx, [rip + 0x5c3500f]
0x1402f2be1: mov edx, 0xb
0x1402f2be6: call 0x1458dfee0
0x1402f2beb: mov r8, rdx
0x1402f2bee: mov qword ptr [rsp + 0x20], 0
0x1402f2bf7: lea rcx, [rbp + 0x1c0]
0x1402f2bfe: mov r9d, 8
0x1402f2c04: mov rdx, rax
0x1402f2c07: call 0x1458e0370
0x1402f2c0c: cmp byte ptr [rdi], 1
0x1402f2c0f: jne 0x1402f2c30
0x1402f2c11: mov eax, dword ptr [rdi + 1]
0x1402f2c14: mov ecx, dword ptr [rdi + 4]
0x1402f2c17: mov dword ptr [rbp + 0x2c7], ecx
0x1402f2c1d: mov dword ptr [rbp + 0x2c4], eax
0x1402f2c23: mov rax, qword ptr [rdi + 8]
0x1402f2c27: movzx ecx, byte ptr [rdi + 0x10]
0x1402f2c2b: mov r8b, 1
0x1402f2c2e: jmp 0x1402f2c41
0x1402f2c30: mov rax, qword ptr [rdi + 8]
0x1402f2c34: lock inc qword ptr [rax]
0x1402f2c38: jle 0x1402f308a
0x1402f2c3e: xor r8d, r8d
0x1402f2c41: lea rdx, [rbp + 0x1f8]
0x1402f2c48: mov r9, qword ptr [rbp + 0x1d0]
0x1402f2c4f: mov qword ptr [rbp - 0x30], r9
0x1402f2c53: movups xmm0, xmmword ptr [rbp + 0x1c0]
0x1402f2c5a: movups xmmword ptr [rbp - 0x40], xmm0
0x1402f2c5e: movups xmm0, xmmword ptr [rip + 0x5c319ef]
0x1402f2c65: movups xmmword ptr [rbp + 0x28c], xmm0
0x1402f2c6c: mov dword ptr [rbp + 0x29c], 0x3f800000
0x1402f2c76: movups xmm0, xmmword ptr [rip + 0x5c31803]
0x1402f2c7d: movaps xmmword ptr [rbp + 0x220], xmm0
0x1402f2c84: mov qword ptr [rbp + 0x230], 0
0x1402f2c8f: movups xmm0, xmmword ptr [rip + 0x5c31802]
0x1402f2c96: movups xmmword ptr [rbp + 0x238], xmm0
0x1402f2c9d: mov qword ptr [rbp + 0x248], 0
0x1402f2ca8: movups xmm0, xmmword ptr [rip + 0x5c31801]
0x1402f2caf: movaps xmmword ptr [rbp + 0x250], xmm0
0x1402f2cb6: mov qword ptr [rbp + 0x260], 0
0x1402f2cc1: movups xmm0, xmmword ptr [rip + 0x5c31800]
0x1402f2cc8: movups xmmword ptr [rbp + 0x268], xmm0
0x1402f2ccf: mov qword ptr [rbp + 0x278], 0
0x1402f2cda: xorps xmm0, xmm0
0x1402f2cdd: movups xmmword ptr [rbp + 0xe0], xmm0
0x1402f2ce4: movups xmmword ptr [rbp + 0xd0], xmm0
0x1402f2ceb: movups xmmword ptr [rbp + 0xc0], xmm0
0x1402f2cf2: movups xmmword ptr [rbp + 0xb0], xmm0
0x1402f2cf9: movups xmmword ptr [rbp + 0xa0], xmm0
0x1402f2d00: mov qword ptr [rbp + 0xf0], 0
0x1402f2d0b: mov dword ptr [rbp + 0x1ba], 0
0x1402f2d15: mov qword ptr [rbp + 0x1b2], 0
0x1402f2d20: mov qword ptr [rbp - 0x28], 0
0x1402f2d28: mov qword ptr [rbp - 0x20], 4
0x1402f2d30: mov qword ptr [rbp - 0x18], 0
0x1402f2d38: mov byte ptr [rbp - 0x10], r8b
0x1402f2d3c: mov r8d, dword ptr [rbp + 0x2c4]
0x1402f2d43: mov r9d, dword ptr [rbp + 0x2c7]
0x1402f2d4a: mov dword ptr [rbp - 0xc], r9d
0x1402f2d4e: mov dword ptr [rbp - 0xf], r8d
0x1402f2d52: mov qword ptr [rbp - 8], rax
0x1402f2d56: mov qword ptr [rbp], rcx
0x1402f2d5a: mov dword ptr [rbp + 8], 0x41800000
0x1402f2d61: mov word ptr [rbp + 0xc], 0x190
0x1402f2d67: mov byte ptr [rbp + 0xe], 1
0x1402f2d6b: mov rax, qword ptr [rbp + 0x298]
0x1402f2d72: mov qword ptr [rbp + 0x1c], rax
0x1402f2d76: movups xmm0, xmmword ptr [rbp + 0x28b]
0x1402f2d7d: movups xmmword ptr [rbp + 0xf], xmm0
0x1402f2d81: mov eax, dword ptr [rip + 0x5c22559]
0x1402f2d87: mov dword ptr [rbp + 0x34], eax
0x1402f2d8a: movups xmm0, xmmword ptr [rip + 0x5c2253f]
0x1402f2d91: movups xmmword ptr [rbp + 0x24], xmm0
0x1402f2d95: movsd xmm0, qword ptr [rip + 0x5bed1d3]
0x1402f2d9d: movsd qword ptr [rbp + 0x38], xmm0
0x1402f2da2: movaps xmm0, xmmword ptr [rbp + 0x270]
0x1402f2da9: movups xmmword ptr [rbp + 0x90], xmm0
0x1402f2db0: movaps xmm0, xmmword ptr [rbp + 0x260]
0x1402f2db7: movups xmmword ptr [rbp + 0x80], xmm0
0x1402f2dbe: movaps xmm0, xmmword ptr [rbp + 0x220]
0x1402f2dc5: movaps xmm1, xmmword ptr [rbp + 0x230]
0x1402f2dcc: movaps xmm2, xmmword ptr [rbp + 0x240]
0x1402f2dd3: movaps xmm3, xmmword ptr [rbp + 0x250]
0x1402f2dda: movups xmmword ptr [rbp + 0x70], xmm3
0x1402f2dde: movups xmmword ptr [rbp + 0x60], xmm2
0x1402f2de2: movups xmmword ptr [rbp + 0x50], xmm1
0x1402f2de6: movups xmmword ptr [rbp + 0x40], xmm0
0x1402f2dea: movaps xmm0, xmmword ptr [rip + 0x5bed45f]
0x1402f2df1: movups xmmword ptr [rbp + 0xf8], xmm0
0x1402f2df8: movaps xmm0, xmmword ptr [rip + 0x5bed441]
0x1402f2dff: movups xmmword ptr [rbp + 0x108], xmm0
0x1402f2e06: movups xmm0, xmmword ptr [rip + 0x5c3175b]
0x1402f2e0d: movups xmmword ptr [rbp + 0x128], xmm0
0x1402f2e14: movups xmm0, xmmword ptr [rip + 0x5c3173d]
0x1402f2e1b: movups xmmword ptr [rbp + 0x118], xmm0
0x1402f2e22: movups xmm0, xmmword ptr [rip + 0x5c3175f]
0x1402f2e29: movups xmmword ptr [rbp + 0x148], xmm0
0x1402f2e30: movups xmm0, xmmword ptr [rip + 0x5c31741]
0x1402f2e37: movups xmmword ptr [rbp + 0x138], xmm0
0x1402f2e3e: movups xmm0, xmmword ptr [rip + 0x5c31763]
0x1402f2e45: movups xmmword ptr [rbp + 0x168], xmm0
0x1402f2e4c: movups xmm0, xmmword ptr [rip + 0x5c31745]
0x1402f2e53: movups xmmword ptr [rbp + 0x158], xmm0
0x1402f2e5a: movaps xmm0, xmmword ptr [rip + 0x5bed09f]
0x1402f2e61: movups xmmword ptr [rbp + 0x178], xmm0
0x1402f2e68: mov dword ptr [rbp + 0x188], 1
0x1402f2e72: mov qword ptr [rbp + 0x18c], 0
0x1402f2e7d: mov byte ptr [rbp + 0x194], 1
0x1402f2e84: mov qword ptr [rbp + 0x198], 0
0x1402f2e8f: mov dword ptr [rbp + 0x1a0], 0x3f800000
0x1402f2e99: mov word ptr [rbp + 0x1a4], 0
0x1402f2ea2: mov word ptr [rbp + 0x1aa], 0
0x1402f2eab: mov dword ptr [rbp + 0x1a6], 0x10000
0x1402f2eb5: mov word ptr [rbp + 0x1b0], 0
0x1402f2ebe: mov dword ptr [rbp + 0x1ac], 0x10000
0x1402f2ec8: mov qword ptr [rbp - 0x48], r14
0x1402f2ecc: lea rcx, [rbp + 0x1c0]
0x1402f2ed3: lea r8, [rbp - 0x48]
0x1402f2ed7: call 0x1402cc8f0
0x1402f2edc: mov word ptr [rbp - 0x48], 0x10a
0x1402f2ee2: lea rdx, [rbp + 0x1c0]
0x1402f2ee9: mov r8d, 3
0x1402f2eef: mov cl, 1
0x1402f2ef1: call 0x145cea9d0
0x1402f2ef6: test rdx, rdx
0x1402f2ef9: js 0x1402f307d
0x1402f2eff: movzx r8d, byte ptr [rbx + 0x133]
0x1402f2f07: test r8b, r8b
0x1402f2f0a: mov qword ptr [rbp + 0x2a0], rdi
0x1402f2f11: mov qword ptr [rbp + 0x2a8], rsi
0x1402f2f18: je 0x1402f2f35
0x1402f2f1a: movzx ecx, r8b
0x1402f2f1e: cmp r8b, 5
0x1402f2f22: mov r8d, 5
0x1402f2f28: cmovb r8d, ecx
0x1402f2f2c: mov dword ptr [rbp + 0x2cc], r8d
0x1402f2f33: jmp 0x1402f2f3d
0x1402f2f35: mov cl, 5
0x1402f2f37: mov dword ptr [rbp + 0x2cc], ecx
0x1402f2f3d: mov dil, 1
0x1402f2f40: mov bl, 2
0x1402f2f42: lea r15, [rbp - 0x48]
0x1402f2f46: xor esi, esi
0x1402f2f48: mov r12d, ebx
0x1402f2f4b: test rdx, rdx
0x1402f2f4e: je 0x1402f2fa0
0x1402f2f50: mov r14, rax
0x1402f2f53: mov r13, rdx
0x1402f2f56: call 0x140002200
0x1402f2f5b: mov ebx, 1
0x1402f2f60: mov edx, 1
0x1402f2f65: mov rcx, r13
0x1402f2f68: call 0x1400021c0
0x1402f2f6d: test rax, rax
0x1402f2f70: je 0x1402f3055
0x1402f2f76: mov rcx, rax
0x1402f2f79: mov rdx, r14
0x1402f2f7c: mov r8, r13
0x1402f2f7f: mov rbx, rax
0x1402f2f82: call 0x145d145fb
0x1402f2f87: mov r9, rbx
0x1402f2f8a: mov rdx, r13
0x1402f2f8d: lea r15, [rbp - 0x48]
0x1402f2f91: jmp 0x1402f2fab
0x1402f2f93: nop word ptr cs:[rax + rax]
0x1402f2fa0: mov r9d, 1
0x1402f2fa6: mov ebx, 1
0x1402f2fab: mov qword ptr [rbp + 0x2b0], rdx
0x1402f2fb2: cmp dil, byte ptr [rbp + 0x2cc]
0x1402f2fb9: sete byte ptr [rsp + 0x28]
0x1402f2fbe: mov qword ptr [rsp + 0x20], rdx
0x1402f2fc3: lea rcx, [rbp + 0x1f0]
0x1402f2fca: mov rdx, qword ptr [rbp + 0x2a0]
0x1402f2fd1: mov r8, r15
0x1402f2fd4: mov qword ptr [rbp + 0x2b8], r9
0x1402f2fdb: call 0x14020e190
0x1402f2fe0: nop
0x1402f2fe1: mov rdx, qword ptr [rbp + 0x2b0]
0x1402f2fe8: test rdx, rdx
0x1402f2feb: je 0x1402f2fff
0x1402f2fed: mov r8d, 1
0x1402f2ff3: mov rcx, qword ptr [rbp + 0x2b8]
0x1402f2ffa: call 0x1400021d0
0x1402f2fff: cmp r12b, 6
0x1402f3003: setae al
0x1402f3006: or sil, al
0x1402f3009: test sil, 1
0x1402f300d: jne 0x1402f3062
0x1402f300f: mov r13, rbx
0x1402f3012: lea eax, [r12 + 1]
0x1402f3017: cmp r12b, 5
0x1402f301b: sete sil
0x1402f301f: movzx ebx, al
0x1402f3022: mov eax, 5
0x1402f3027: cmove ebx, eax
0x1402f302a: mov byte ptr [rbp - 0x47], r12b
0x1402f302e: mov byte ptr [rbp - 0x48], 0xa
0x1402f3032: mov r8d, 3
0x1402f3038: mov ecx, r12d
0x1402f303b: lea rdx, [rbp + 0x1c0]
0x1402f3042: call 0x145cea9d0
0x1402f3047: mov edi, r12d
0x1402f304a: test rdx, rdx
0x1402f304d: jns 0x1402f2f48
0x1402f3053: xor ebx, ebx
0x1402f3055: mov rcx, rbx
0x1402f3058: mov rdx, r13
0x1402f305b: call 0x145eb6fcb
0x1402f3060: ud2
0x1402f3062: mov rax, qword ptr [rbp + 0x2a8]
0x1402f3069: add rsp, 0x358
0x1402f3070: pop rbx
0x1402f3071: pop rdi
0x1402f3072: pop rsi
0x1402f3073: pop r12
0x1402f3075: pop r13
0x1402f3077: pop r14
0x1402f3079: pop r15
0x1402f307b: pop rbp
0x1402f307c: ret
0x1402f307d: xor ebx, ebx
0x1402f307f: mov rcx, rbx
0x1402f3082: mov rdx, r13
0x1402f3085: call 0x145eb6fcb
0x1402f308a: ud2
