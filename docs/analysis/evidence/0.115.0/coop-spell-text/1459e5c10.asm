0x1459e5c10: push rbp
0x1459e5c11: push r15
0x1459e5c13: push r14
0x1459e5c15: push r13
0x1459e5c17: push r12
0x1459e5c19: push rsi
0x1459e5c1a: push rdi
0x1459e5c1b: push rbx
0x1459e5c1c: sub rsp, 0x218
0x1459e5c23: lea rbp, [rsp + 0x80]
0x1459e5c2b: movaps xmmword ptr [rbp + 0x180], xmm9
0x1459e5c33: movaps xmmword ptr [rbp + 0x170], xmm8
0x1459e5c3b: movaps xmmword ptr [rbp + 0x160], xmm7
0x1459e5c42: movaps xmmword ptr [rbp + 0x150], xmm6
0x1459e5c49: mov qword ptr [rbp + 0x148], 0xfffffffffffffffe
0x1459e5c54: mov rdi, qword ptr [rcx]
0x1459e5c57: mov rbx, qword ptr [rcx + 8]
0x1459e5c5b: mov rax, qword ptr [rdx]
0x1459e5c5e: mov qword ptr [rbp + 0x138], rax
0x1459e5c65: mov r14, qword ptr [rdx + 8]
0x1459e5c69: cmp rdi, rbx
0x1459e5c6c: je 0x1459e5f54
0x1459e5c72: mov rax, qword ptr [rcx + 0x20]
0x1459e5c76: mov qword ptr [rbp + 0x120], rax
0x1459e5c7d: mov rax, qword ptr [rdx + 0x10]
0x1459e5c81: mov qword ptr [rbp + 0xe0], rax
0x1459e5c88: mov rax, qword ptr [rcx + 0x10]
0x1459e5c8c: mov rcx, qword ptr [rcx + 0x18]
0x1459e5c90: mov qword ptr [rbp + 0x118], rcx
0x1459e5c97: sub rbx, rdi
0x1459e5c9a: shr rbx, 4
0x1459e5c9e: mov qword ptr [rbp + 0xd8], rax
0x1459e5ca5: add rax, 0x800
0x1459e5cab: mov qword ptr [rbp + 0xe8], rax
0x1459e5cb2: lea r12, [rip + 0x12de8c7]
0x1459e5cb9: xorps xmm6, xmm6
0x1459e5cbc: movsd xmm7, qword ptr [rip + 0x50a88c]
0x1459e5cc4: movsd xmm8, qword ptr [rip + 0x4fa1f3]
0x1459e5ccd: movaps xmm9, xmmword ptr [rip + 0x50a88b]
0x1459e5cd5: xor esi, esi
0x1459e5cd7: mov qword ptr [rbp + 0x128], rdi
0x1459e5cde: mov qword ptr [rbp + 0x130], rbx
0x1459e5ce5: jmp 0x1459e5d31
0x1459e5ce7: nop word ptr [rax + rax]
0x1459e5cf0: mov rdi, qword ptr [rbp + 0x128]
0x1459e5cf7: mov rbx, qword ptr [rbp + 0x130]
0x1459e5cfe: mov r14, qword ptr [rbp + 0x110]
0x1459e5d05: imul rcx, r14, 0xb0
0x1459e5d0c: add rcx, qword ptr [rbp + 0xe0]
0x1459e5d13: mov r8d, 0xb0
0x1459e5d19: lea rdx, [rbp - 0x50]
0x1459e5d1d: call 0x145d145fb
0x1459e5d22: inc r14
0x1459e5d25: inc rsi
0x1459e5d28: cmp rsi, rbx
0x1459e5d2b: je 0x1459e5f54
0x1459e5d31: mov rax, rsi
0x1459e5d34: shl rax, 4
0x1459e5d38: mov r15, qword ptr [rdi + rax]
0x1459e5d3c: mov rdi, qword ptr [rdi + rax + 8]
0x1459e5d41: mov qword ptr [rbp + 0x60], r15
0x1459e5d45: mov qword ptr [rbp + 0x68], rdi
0x1459e5d49: xor r13d, r13d
0x1459e5d4c: mov qword ptr [rbp + 0x110], r14
0x1459e5d53: jmp 0x1459e5d71
0x1459e5d55: nop word ptr cs:[rax + rax]
0x1459e5d60: add r13, 0x78
0x1459e5d64: cmp r13, 0x34f8
0x1459e5d6b: je 0x1459e5f90
0x1459e5d71: cmp qword ptr [r13 + r12 + 8], rdi
0x1459e5d76: jne 0x1459e5d60
0x1459e5d78: mov rbx, qword ptr [r13 + r12]
0x1459e5d7d: mov rcx, rbx
0x1459e5d80: mov rdx, r15
0x1459e5d83: mov r8, rdi
0x1459e5d86: call 0x145d14601
0x1459e5d8b: test eax, eax
0x1459e5d8d: jne 0x1459e5d60
0x1459e5d8f: add r13, r12
0x1459e5d92: mov qword ptr [rbp + 0xb8], r13
0x1459e5d99: mov qword ptr [rbp + 0xf0], r13
0x1459e5da0: lea rdx, [rbp + 0xb8]
0x1459e5da7: mov qword ptr [rbp + 0xf8], rdx
0x1459e5dae: mov qword ptr [rbp + 0x60], rdx
0x1459e5db2: mov qword ptr [rbp + 0x68], r13
0x1459e5db6: mov rcx, qword ptr [rbp + 0xd8]
0x1459e5dbd: mov rax, qword ptr [rcx + 0x1d0]
0x1459e5dc4: mov rcx, qword ptr [rcx + 0x1d8]
0x1459e5dcb: shl rcx, 4
0x1459e5dcf: add rcx, rax
0x1459e5dd2: mov qword ptr [rbp - 0x50], rax
0x1459e5dd6: mov qword ptr [rbp - 0x48], rcx
0x1459e5dda: lea rax, [rbp + 0xf0]
0x1459e5de1: mov qword ptr [rbp - 0x40], rax
0x1459e5de5: lea rax, [rbp + 0x60]
0x1459e5de9: mov qword ptr [rbp - 0x38], rax
0x1459e5ded: mov qword ptr [rbp - 0x30], r13
0x1459e5df1: mov qword ptr [rbp - 0x28], rdx
0x1459e5df5: lea rcx, [rbp + 0xc0]
0x1459e5dfc: lea rdx, [rbp - 0x50]
0x1459e5e00: call 0x1459c2b50
0x1459e5e05: nop
0x1459e5e06: mov rax, qword ptr [rbp + 0x118]
0x1459e5e0d: mov rax, qword ptr [rax + 0x10]
0x1459e5e11: test rax, rax
0x1459e5e14: je 0x1459e5ea0
0x1459e5e1a: mov rcx, qword ptr [rbp + 0x118]
0x1459e5e21: mov r15, qword ptr [rcx + 8]
0x1459e5e25: imul r14, rax, 0x58
0x1459e5e29: jmp 0x1459e5e3a
0x1459e5e2b: nop dword ptr [rax + rax]
0x1459e5e30: add r15, 0x58
0x1459e5e34: add r14, -0x58
0x1459e5e38: je 0x1459e5ea0
0x1459e5e3a: mov rax, qword ptr [r15]
0x1459e5e3d: cmp qword ptr [rax + 8], rdi
0x1459e5e41: jne 0x1459e5e30
0x1459e5e43: mov rcx, qword ptr [rax]
0x1459e5e46: mov rdx, rbx
0x1459e5e49: mov r8, rdi
0x1459e5e4c: call 0x145d14601
0x1459e5e51: test eax, eax
0x1459e5e53: jne 0x1459e5e30
0x1459e5e55: mov rax, qword ptr [rbp + 0xd0]
0x1459e5e5c: mov qword ptr [rbp + 0x70], rax
0x1459e5e60: movups xmm0, xmmword ptr [rbp + 0xc0]
0x1459e5e67: movaps xmmword ptr [rbp + 0x60], xmm0
0x1459e5e6b: mov byte ptr [rbp + 0x147], 0
0x1459e5e72: lea rax, [rbp + 0x60]
0x1459e5e76: mov qword ptr [rsp + 0x20], rax
0x1459e5e7b: lea rcx, [rbp - 0x50]
0x1459e5e7f: mov rdx, r15
0x1459e5e82: mov r8, qword ptr [rbp + 0x120]
0x1459e5e89: xor r9d, r9d
0x1459e5e8c: call 0x1458629b0
0x1459e5e91: nop
0x1459e5e92: jmp 0x1459e5cf0
0x1459e5e97: nop word ptr [rax + rax]
0x1459e5ea0: lea rax, [rbp + 0x84]
0x1459e5ea7: movups xmmword ptr [rax], xmm6
0x1459e5eaa: mov dword ptr [rax + 0x10], 0
0x1459e5eb1: mov qword ptr [rbp + 0x60], r13
0x1459e5eb5: mov dword ptr [rbp + 0x68], 1
0x1459e5ebc: movsd qword ptr [rbp + 0x6c], xmm7
0x1459e5ec1: mov qword ptr [rbp + 0x74], 0x3f800000
0x1459e5ec9: movsd qword ptr [rbp + 0x7c], xmm8
0x1459e5ecf: movsd qword ptr [rbp + 0x98], xmm8
0x1459e5ed8: mov dword ptr [rbp + 0xa0], 0
0x1459e5ee2: movups xmmword ptr [rbp + 0xa4], xmm9
0x1459e5eea: mov byte ptr [rbp + 0x147], 1
0x1459e5ef1: lea rcx, [rbp + 0x98]
0x1459e5ef8: mov rdx, qword ptr [rbp + 0xe8]
0x1459e5eff: mov r8, r13
0x1459e5f02: call 0x1458de0a0
0x1459e5f07: nop
0x1459e5f08: mov rax, qword ptr [rbp + 0xd0]
0x1459e5f0f: mov qword ptr [rbp + 0x100], rax
0x1459e5f16: movups xmm0, xmmword ptr [rbp + 0xc0]
0x1459e5f1d: movaps xmmword ptr [rbp + 0xf0], xmm0
0x1459e5f24: mov byte ptr [rbp + 0x147], 0
0x1459e5f2b: lea rax, [rbp + 0xf0]
0x1459e5f32: mov qword ptr [rsp + 0x20], rax
0x1459e5f37: lea rcx, [rbp - 0x50]
0x1459e5f3b: lea rdx, [rbp + 0x60]
0x1459e5f3f: mov r8, qword ptr [rbp + 0x120]
0x1459e5f46: mov r9b, 1
0x1459e5f49: call 0x1458629b0
0x1459e5f4e: nop
0x1459e5f4f: jmp 0x1459e5cf0
0x1459e5f54: mov rax, qword ptr [rbp + 0x138]
0x1459e5f5b: mov qword ptr [rax], r14
0x1459e5f5e: movaps xmm6, xmmword ptr [rbp + 0x150]
0x1459e5f65: movaps xmm7, xmmword ptr [rbp + 0x160]
0x1459e5f6c: movaps xmm8, xmmword ptr [rbp + 0x170]
0x1459e5f74: movaps xmm9, xmmword ptr [rbp + 0x180]
0x1459e5f7c: add rsp, 0x218
0x1459e5f83: pop rbx
0x1459e5f84: pop rdi
0x1459e5f85: pop rsi
0x1459e5f86: pop r12
0x1459e5f88: pop r13
0x1459e5f8a: pop r14
0x1459e5f8c: pop r15
0x1459e5f8e: pop rbp
0x1459e5f8f: ret
0x1459e5f90: lea rax, [rbp + 0x60]
0x1459e5f94: mov qword ptr [rbp - 0x50], rax
0x1459e5f98: lea rax, [rip - 0x59e3edf]
0x1459e5f9f: mov qword ptr [rbp - 0x48], rax
0x1459e5fa3: lea rcx, [rip + 0x12dd7be]
0x1459e5faa: lea r8, [rip + 0x12dd7c7]
0x1459e5fb1: lea rdx, [rbp - 0x50]
0x1459e5fb5: call 0x145eb7540
0x1459e5fba: nop
0x1459e5fbb: ud2
