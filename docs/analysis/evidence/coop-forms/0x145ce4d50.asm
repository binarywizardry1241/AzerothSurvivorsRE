0x145ce4d50: push rbp
0x145ce4d51: push r15
0x145ce4d53: push r14
0x145ce4d55: push r13
0x145ce4d57: push r12
0x145ce4d59: push rsi
0x145ce4d5a: push rdi
0x145ce4d5b: push rbx
0x145ce4d5c: sub rsp, 0x88
0x145ce4d63: lea rbp, [rsp + 0x80]
0x145ce4d6b: mov qword ptr [rbp], 0xfffffffffffffffe
0x145ce4d73: mov r14, r8
0x145ce4d76: mov rsi, rcx
0x145ce4d79: mov qword ptr [rbp - 0x28], rdx
0x145ce4d7d: mov qword ptr [rbp - 0x20], r8
0x145ce4d81: lea rcx, [rbp - 0x48]
0x145ce4d85: lea rdx, [rbp - 0x28]
0x145ce4d89: call 0x145cf7c50
0x145ce4d8e: mov r15, qword ptr [rbp - 0x48]
0x145ce4d92: test r15, r15
0x145ce4d95: je 0x145ce4dc7
0x145ce4d97: mov rbx, qword ptr [rbp - 0x40]
0x145ce4d9b: cmp qword ptr [rbp - 0x30], 0
0x145ce4da0: je 0x145ce4dcf
0x145ce4da2: test r14, r14
0x145ce4da5: je 0x145ce4de3
0x145ce4da7: call 0x140002200
0x145ce4dac: mov edx, 1
0x145ce4db1: mov rcx, r14
0x145ce4db4: call 0x1400021c0
0x145ce4db9: test rax, rax
0x145ce4dbc: je 0x145ce4f6b
0x145ce4dc2: mov r12, rax
0x145ce4dc5: jmp 0x145ce4de9
0x145ce4dc7: mov r15d, 1
0x145ce4dcd: xor ebx, ebx
0x145ce4dcf: mov qword ptr [rsi + 8], r15
0x145ce4dd3: mov qword ptr [rsi + 0x10], rbx
0x145ce4dd7: mov qword ptr [rsi], 0xffffffffffffffff
0x145ce4dde: jmp 0x145ce4f14
0x145ce4de3: mov r12d, 1
0x145ce4de9: mov qword ptr [rbp - 0x18], r14
0x145ce4ded: mov qword ptr [rbp - 0x10], r12
0x145ce4df1: mov qword ptr [rbp - 8], 0
0x145ce4df9: cmp rbx, r14
0x145ce4dfc: ja 0x145ce4f2b
0x145ce4e02: xor edi, edi
0x145ce4e04: test rbx, rbx
0x145ce4e07: je 0x145ce4e18
0x145ce4e09: lea rcx, [r12 + rdi]
0x145ce4e0d: mov rdx, r15
0x145ce4e10: mov r8, rbx
0x145ce4e13: call 0x145d145fb
0x145ce4e18: add rdi, rbx
0x145ce4e1b: mov qword ptr [rbp - 8], rdi
0x145ce4e1f: sub r14, rdi
0x145ce4e22: cmp r14, 2
0x145ce4e26: jbe 0x145ce4f4b
0x145ce4e2c: mov byte ptr [r12 + rdi + 2], 0xbd
0x145ce4e32: mov word ptr [r12 + rdi], 0xbfef
0x145ce4e39: add rdi, 3
0x145ce4e3d: mov qword ptr [rbp - 8], rdi
0x145ce4e41: movups xmm0, xmmword ptr [rbp - 0x28]
0x145ce4e45: movups xmmword ptr [rbp - 0x58], xmm0
0x145ce4e49: lea rbx, [rbp - 0x48]
0x145ce4e4d: lea r14, [rbp - 0x58]
0x145ce4e51: nop word ptr cs:[rax + rax]
0x145ce4e60: mov rcx, rbx
0x145ce4e63: mov rdx, r14
0x145ce4e66: call 0x145cf7c50
0x145ce4e6b: nop
0x145ce4e6c: mov r13, qword ptr [rbp - 0x48]
0x145ce4e70: test r13, r13
0x145ce4e73: je 0x145ce4f05
0x145ce4e79: mov r12, qword ptr [rbp - 0x40]
0x145ce4e7d: mov r15, qword ptr [rbp - 0x30]
0x145ce4e81: mov rax, qword ptr [rbp - 0x18]
0x145ce4e85: sub rax, rdi
0x145ce4e88: cmp r12, rax
0x145ce4e8b: ja 0x145ce4ed6
0x145ce4e8d: test r12, r12
0x145ce4e90: je 0x145ce4ea4
0x145ce4e92: mov rcx, qword ptr [rbp - 0x10]
0x145ce4e96: add rcx, rdi
0x145ce4e99: mov rdx, r13
0x145ce4e9c: mov r8, r12
0x145ce4e9f: call 0x145d145fb
0x145ce4ea4: add rdi, r12
0x145ce4ea7: mov qword ptr [rbp - 8], rdi
0x145ce4eab: test r15, r15
0x145ce4eae: je 0x145ce4e60
0x145ce4eb0: mov rax, qword ptr [rbp - 0x18]
0x145ce4eb4: sub rax, rdi
0x145ce4eb7: cmp rax, 2
0x145ce4ebb: jbe 0x145ce4eec
0x145ce4ebd: mov rax, qword ptr [rbp - 0x10]
0x145ce4ec1: mov byte ptr [rax + rdi + 2], 0xbd
0x145ce4ec6: mov word ptr [rax + rdi], 0xbfef
0x145ce4ecc: add rdi, 3
0x145ce4ed0: mov qword ptr [rbp - 8], rdi
0x145ce4ed4: jmp 0x145ce4e60
0x145ce4ed6: lea rcx, [rbp - 0x18]
0x145ce4eda: mov rdx, rdi
0x145ce4edd: mov r8, r12
0x145ce4ee0: call 0x145eb6e40
0x145ce4ee5: nop
0x145ce4ee6: mov rdi, qword ptr [rbp - 8]
0x145ce4eea: jmp 0x145ce4e92
0x145ce4eec: mov r8d, 3
0x145ce4ef2: lea rcx, [rbp - 0x18]
0x145ce4ef6: mov rdx, rdi
0x145ce4ef9: call 0x145eb6e40
0x145ce4efe: nop
0x145ce4eff: mov rdi, qword ptr [rbp - 8]
0x145ce4f03: jmp 0x145ce4ebd
0x145ce4f05: mov rax, qword ptr [rbp - 8]
0x145ce4f09: mov qword ptr [rsi + 0x10], rax
0x145ce4f0d: movups xmm0, xmmword ptr [rbp - 0x18]
0x145ce4f11: movups xmmword ptr [rsi], xmm0
0x145ce4f14: mov rax, rsi
0x145ce4f17: add rsp, 0x88
0x145ce4f1e: pop rbx
0x145ce4f1f: pop rdi
0x145ce4f20: pop rsi
0x145ce4f21: pop r12
0x145ce4f23: pop r13
0x145ce4f25: pop r14
0x145ce4f27: pop r15
0x145ce4f29: pop rbp
0x145ce4f2a: ret
0x145ce4f2b: lea rcx, [rbp - 0x18]
0x145ce4f2f: xor edx, edx
0x145ce4f31: mov r8, rbx
0x145ce4f34: call 0x145eb6e40
0x145ce4f39: nop
0x145ce4f3a: mov rdi, qword ptr [rbp - 8]
0x145ce4f3e: mov r14, qword ptr [rbp - 0x18]
0x145ce4f42: mov r12, qword ptr [rbp - 0x10]
0x145ce4f46: jmp 0x145ce4e09
0x145ce4f4b: lea rcx, [rbp - 0x18]
0x145ce4f4f: mov r8d, 3
0x145ce4f55: mov rdx, rdi
0x145ce4f58: call 0x145eb6e40
0x145ce4f5d: nop
0x145ce4f5e: mov r12, qword ptr [rbp - 0x10]
0x145ce4f62: mov rdi, qword ptr [rbp - 8]
0x145ce4f66: jmp 0x145ce4e2c
0x145ce4f6b: mov ecx, 1
0x145ce4f70: mov rdx, r14
0x145ce4f73: call 0x145eb6fcb
0x145ce4f78: ud2
