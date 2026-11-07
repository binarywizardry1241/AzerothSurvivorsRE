0x1459c2b50: push rbp
0x1459c2b51: push r15
0x1459c2b53: push r14
0x1459c2b55: push r13
0x1459c2b57: push r12
0x1459c2b59: push rsi
0x1459c2b5a: push rdi
0x1459c2b5b: push rbx
0x1459c2b5c: sub rsp, 0xa8
0x1459c2b63: lea rbp, [rsp + 0x80]
0x1459c2b6b: mov qword ptr [rbp + 0x20], 0xfffffffffffffffe
0x1459c2b73: mov rsi, rcx
0x1459c2b76: lea rax, [rdx + 0x10]
0x1459c2b7a: mov qword ptr [rbp - 0x10], rax
0x1459c2b7e: mov r15, qword ptr [rdx]
0x1459c2b81: mov r12, qword ptr [rdx + 8]
0x1459c2b85: cmp r15, r12
0x1459c2b88: je 0x1459c2c02
0x1459c2b8a: mov rbx, rdx
0x1459c2b8d: lea rdi, [rbp - 0x10]
0x1459c2b91: lea r14, [rbp - 0x50]
0x1459c2b95: nop word ptr cs:[rax + rax]
0x1459c2ba0: lea r13, [r15 + 0x10]
0x1459c2ba4: mov qword ptr [rbx], r13
0x1459c2ba7: mov qword ptr [rbp - 0x50], r15
0x1459c2bab: mov rcx, rdi
0x1459c2bae: mov rdx, r14
0x1459c2bb1: call 0x14586b890
0x1459c2bb6: test al, al
0x1459c2bb8: jne 0x1459c2bc4
0x1459c2bba: mov r15, r13
0x1459c2bbd: cmp r13, r12
0x1459c2bc0: jne 0x1459c2ba0
0x1459c2bc2: jmp 0x1459c2c02
0x1459c2bc4: test r15, r15
0x1459c2bc7: je 0x1459c2c02
0x1459c2bc9: mov rax, qword ptr [r15]
0x1459c2bcc: mov rdi, qword ptr [rax + 0x40]
0x1459c2bd0: mov r14, qword ptr [rax + 0x48]
0x1459c2bd4: mov rcx, rdi
0x1459c2bd7: mov rdx, r14
0x1459c2bda: call 0x1458dff90
0x1459c2bdf: test rax, rax
0x1459c2be2: cmove rax, rdi
0x1459c2be6: mov r15, rdx
0x1459c2be9: cmove r15, r14
0x1459c2bed: test r15, r15
0x1459c2bf0: jns 0x1459c2c30
0x1459c2bf2: xor r14d, r14d
0x1459c2bf5: mov rcx, r14
0x1459c2bf8: mov rdx, r15
0x1459c2bfb: call 0x145eb6fcb
0x1459c2c00: ud2
0x1459c2c02: mov qword ptr [rsi], 0
0x1459c2c09: mov qword ptr [rsi + 8], 8
0x1459c2c11: mov qword ptr [rsi + 0x10], 0
0x1459c2c19: mov rax, rsi
0x1459c2c1c: add rsp, 0xa8
0x1459c2c23: pop rbx
0x1459c2c24: pop rdi
0x1459c2c25: pop rsi
0x1459c2c26: pop r12
0x1459c2c28: pop r13
0x1459c2c2a: pop r14
0x1459c2c2c: pop r15
0x1459c2c2e: pop rbp
0x1459c2c2f: ret
0x1459c2c30: je 0x1459c2c65
0x1459c2c32: mov rdi, rax
0x1459c2c35: call 0x140002200
0x1459c2c3a: mov r14d, 1
0x1459c2c40: mov edx, 1
0x1459c2c45: mov rcx, r15
0x1459c2c48: call 0x1400021c0
0x1459c2c4d: test rax, rax
0x1459c2c50: je 0x1459c2bf5
0x1459c2c52: mov r12, rax
0x1459c2c55: mov rcx, rax
0x1459c2c58: mov rdx, rdi
0x1459c2c5b: mov r8, r15
0x1459c2c5e: call 0x145d145fb
0x1459c2c63: jmp 0x1459c2c6b
0x1459c2c65: mov r12d, 1
0x1459c2c6b: call 0x140002200
0x1459c2c70: mov ecx, 0x60
0x1459c2c75: mov edx, 8
0x1459c2c7a: call 0x1400021c0
0x1459c2c7f: test rax, rax
0x1459c2c82: je 0x1459c2e28
0x1459c2c88: mov rdi, rax
0x1459c2c8b: mov qword ptr [rax], r15
0x1459c2c8e: mov qword ptr [rax + 8], r12
0x1459c2c92: mov qword ptr [rax + 0x10], r15
0x1459c2c96: mov qword ptr [rbp - 0x10], 4
0x1459c2c9e: mov qword ptr [rbp - 8], rax
0x1459c2ca2: mov qword ptr [rbp], 1
0x1459c2caa: movups xmm0, xmmword ptr [rbx]
0x1459c2cad: movups xmm1, xmmword ptr [rbx + 0x10]
0x1459c2cb1: movups xmm2, xmmword ptr [rbx + 0x20]
0x1459c2cb5: movaps xmmword ptr [rbp - 0x30], xmm2
0x1459c2cb9: movaps xmmword ptr [rbp - 0x40], xmm1
0x1459c2cbd: movaps xmmword ptr [rbp - 0x50], xmm0
0x1459c2cc1: lea rax, [rbp - 0x40]
0x1459c2cc5: mov qword ptr [rbp - 0x18], rax
0x1459c2cc9: mov rbx, qword ptr [rbp - 0x50]
0x1459c2ccd: mov r13, qword ptr [rbp - 0x48]
0x1459c2cd1: cmp rbx, r13
0x1459c2cd4: je 0x1459c2e02
0x1459c2cda: mov eax, 1
0x1459c2cdf: mov qword ptr [rbp + 0x10], rax
0x1459c2ce3: lea r14, [rbp - 0x18]
0x1459c2ce7: lea r15, [rbp - 0x58]
0x1459c2ceb: nop dword ptr [rax + rax]
0x1459c2cf0: lea r12, [rbx + 0x10]
0x1459c2cf4: mov qword ptr [rbp - 0x50], r12
0x1459c2cf8: mov qword ptr [rbp - 0x58], rbx
0x1459c2cfc: mov rcx, r14
0x1459c2cff: mov rdx, r15
0x1459c2d02: call 0x14586b890
0x1459c2d07: nop
0x1459c2d08: test al, al
0x1459c2d0a: jne 0x1459c2d19
0x1459c2d0c: mov rbx, r12
0x1459c2d0f: cmp r12, r13
0x1459c2d12: jne 0x1459c2cf0
0x1459c2d14: jmp 0x1459c2e02
0x1459c2d19: test rbx, rbx
0x1459c2d1c: je 0x1459c2e02
0x1459c2d22: mov rax, qword ptr [rbx]
0x1459c2d25: mov r13, qword ptr [rax + 0x40]
0x1459c2d29: mov r12, qword ptr [rax + 0x48]
0x1459c2d2d: mov rcx, r13
0x1459c2d30: mov rdx, r12
0x1459c2d33: call 0x1458dff90
0x1459c2d38: nop
0x1459c2d39: mov rbx, rdx
0x1459c2d3c: test rax, rax
0x1459c2d3f: cmovne r13, rax
0x1459c2d43: cmove rbx, r12
0x1459c2d47: test rbx, rbx
0x1459c2d4a: js 0x1459c2e16
0x1459c2d50: mov qword ptr [rbp + 8], rbx
0x1459c2d54: je 0x1459c2d8b
0x1459c2d56: call 0x140002200
0x1459c2d5b: mov r12d, 1
0x1459c2d61: mov edx, 1
0x1459c2d66: mov rcx, rbx
0x1459c2d69: call 0x1400021c0
0x1459c2d6e: test rax, rax
0x1459c2d71: je 0x1459c2e42
0x1459c2d77: mov qword ptr [rbp + 0x18], rax
0x1459c2d7b: mov rcx, rax
0x1459c2d7e: mov rdx, r13
0x1459c2d81: mov r8, rbx
0x1459c2d84: call 0x145d145fb
0x1459c2d89: jmp 0x1459c2d94
0x1459c2d8b: mov eax, 1
0x1459c2d90: mov qword ptr [rbp + 0x18], rax
0x1459c2d94: mov rbx, qword ptr [rbp + 0x10]
0x1459c2d98: cmp rbx, qword ptr [rbp - 0x10]
0x1459c2d9c: jne 0x1459c2dc4
0x1459c2d9e: mov qword ptr [rsp + 0x20], 0x18
0x1459c2da7: mov r8d, 1
0x1459c2dad: mov r9d, 8
0x1459c2db3: lea rcx, [rbp - 0x10]
0x1459c2db7: mov rdx, rbx
0x1459c2dba: call 0x145d14a10
0x1459c2dbf: nop
0x1459c2dc0: mov rdi, qword ptr [rbp - 8]
0x1459c2dc4: lea rax, [rbx + rbx*2]
0x1459c2dc8: mov rdx, qword ptr [rbp + 8]
0x1459c2dcc: mov qword ptr [rdi + rax*8], rdx
0x1459c2dd0: mov rcx, qword ptr [rbp + 0x18]
0x1459c2dd4: mov qword ptr [rdi + rax*8 + 8], rcx
0x1459c2dd9: mov qword ptr [rdi + rax*8 + 0x10], rdx
0x1459c2dde: inc rbx
0x1459c2de1: mov qword ptr [rbp + 0x10], rbx
0x1459c2de5: mov qword ptr [rbp], rbx
0x1459c2de9: lea rax, [rbp - 0x40]
0x1459c2ded: mov qword ptr [rbp - 0x18], rax
0x1459c2df1: mov rbx, qword ptr [rbp - 0x50]
0x1459c2df5: mov r13, qword ptr [rbp - 0x48]
0x1459c2df9: cmp rbx, r13
0x1459c2dfc: jne 0x1459c2cf0
0x1459c2e02: mov rax, qword ptr [rbp]
0x1459c2e06: mov qword ptr [rsi + 0x10], rax
0x1459c2e0a: movups xmm0, xmmword ptr [rbp - 0x10]
0x1459c2e0e: movups xmmword ptr [rsi], xmm0
0x1459c2e11: jmp 0x1459c2c19
0x1459c2e16: xor r12d, r12d
0x1459c2e19: mov rcx, r12
0x1459c2e1c: mov rdx, qword ptr [rbp + 0x18]
0x1459c2e20: call 0x145eb6fcb
0x1459c2e25: nop
0x1459c2e26: jmp 0x1459c2e40
0x1459c2e28: mov qword ptr [rbp + 0x18], r12
0x1459c2e2c: mov qword ptr [rbp + 0x10], r15
0x1459c2e30: mov ecx, 8
0x1459c2e35: mov edx, 0x60
0x1459c2e3a: call 0x145eb6fcb
0x1459c2e3f: nop
0x1459c2e40: ud2
0x1459c2e42: mov qword ptr [rbp + 0x18], rbx
0x1459c2e46: jmp 0x1459c2e19
