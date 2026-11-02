0x145891df0: push rbp
0x145891df1: push r15
0x145891df3: push r14
0x145891df5: push r12
0x145891df7: push rsi
0x145891df8: push rdi
0x145891df9: push rbx
0x145891dfa: sub rsp, 0x250
0x145891e01: lea rbp, [rsp + 0x80]
0x145891e09: mov qword ptr [rbp + 0x1c8], 0xfffffffffffffffe
0x145891e14: mov qword ptr [rbp + 0x1b0], rdx
0x145891e1b: cmp dword ptr [rcx + 0x10], 2
0x145891e1f: mov qword ptr [rbp + 0x1b8], r8
0x145891e26: jne 0x145891e8b
0x145891e28: cmp dword ptr [rcx + 0xc58], 2
0x145891e2f: jne 0x145891e8b
0x145891e31: mov rdi, r9
0x145891e34: mov r15, rcx
0x145891e37: call 0x140002200
0x145891e3c: mov ecx, 7
0x145891e41: mov edx, 1
0x145891e46: call 0x1400021c0
0x145891e4b: test rax, rax
0x145891e4e: je 0x14589206d
0x145891e54: mov r12, rax
0x145891e57: mov rsi, qword ptr [rbp + 0x230]
0x145891e5e: mov dword ptr [rax + 3], 0x302e3531
0x145891e65: mov dword ptr [rax], 0x31312e30
0x145891e6b: test rsi, rsi
0x145891e6e: jns 0x145891ed1
0x145891e70: xor r14d, r14d
0x145891e73: mov qword ptr [rbp + 0x1a8], r12
0x145891e7a: mov rcx, r14
0x145891e7d: mov rdx, rsi
0x145891e80: call 0x145eb6fcb
0x145891e85: nop
0x145891e86: jmp 0x145892084
0x145891e8b: mov rax, qword ptr [r8]
0x145891e8e: test rax, rax
0x145891e91: je 0x145891e9d
0x145891e93: mov rcx, qword ptr [rbp + 0x1b0]
0x145891e9a: call rax
0x145891e9c: nop
0x145891e9d: mov rax, qword ptr [rbp + 0x1b8]
0x145891ea4: mov rdx, qword ptr [rax + 8]
0x145891ea8: test rdx, rdx
0x145891eab: je 0x145891ebd
0x145891ead: mov r8, qword ptr [rax + 0x10]
0x145891eb1: mov rcx, qword ptr [rbp + 0x1b0]
0x145891eb8: call 0x1400021d0
0x145891ebd: xor eax, eax
0x145891ebf: add rsp, 0x250
0x145891ec6: pop rbx
0x145891ec7: pop rdi
0x145891ec8: pop rsi
0x145891ec9: pop r12
0x145891ecb: pop r14
0x145891ecd: pop r15
0x145891ecf: pop rbp
0x145891ed0: ret
0x145891ed1: je 0x145891f03
0x145891ed3: call 0x140002200
0x145891ed8: mov r14d, 1
0x145891ede: mov edx, 1
0x145891ee3: mov rcx, rsi
0x145891ee6: call 0x1400021c0
0x145891eeb: test rax, rax
0x145891eee: je 0x145891e73
0x145891ef0: mov rbx, rax
0x145891ef3: mov rcx, rax
0x145891ef6: mov rdx, rdi
0x145891ef9: mov r8, rsi
0x145891efc: call 0x145d145fb
0x145891f01: jmp 0x145891f08
0x145891f03: mov ebx, 1
0x145891f08: mov dword ptr [rbp - 0x20], 4
0x145891f0f: mov qword ptr [rbp - 0x50], 7
0x145891f17: mov qword ptr [rbp - 0x48], r12
0x145891f1b: mov qword ptr [rbp - 0x40], 7
0x145891f23: mov qword ptr [rbp - 0x38], rsi
0x145891f27: mov qword ptr [rbp - 0x30], rbx
0x145891f2b: mov qword ptr [rbp - 0x28], rsi
0x145891f2f: movabs rax, 0x8000000000000000
0x145891f39: mov qword ptr [rbp - 0x58], rax
0x145891f3d: lea rcx, [rbp + 0x190]
0x145891f44: lea rdx, [rbp - 0x58]
0x145891f48: call 0x14581c690
0x145891f4d: nop
0x145891f4e: mov rdx, qword ptr [rbp + 0x198]
0x145891f55: mov r8, qword ptr [rbp + 0x1a0]
0x145891f5c: lock add qword ptr [rip + 0x29851e4], r8
0x145891f64: lock inc qword ptr [rip + 0x29851ec]
0x145891f6c: mov rcx, qword ptr [rbp + 0x1b0]
0x145891f73: mov qword ptr [rbp + 0x1a8], rdx
0x145891f7a: mov rax, qword ptr [rbp + 0x1b8]
0x145891f81: call qword ptr [rax + 0x18]
0x145891f84: nop
0x145891f85: mov rdx, qword ptr [rbp + 0x190]
0x145891f8c: test rdx, rdx
0x145891f8f: je 0x145891fa3
0x145891f91: mov r8d, 1
0x145891f97: mov rcx, qword ptr [rbp + 0x1a8]
0x145891f9e: call 0x1400021d0
0x145891fa3: mov byte ptr [rbp + 0x1c7], 1
0x145891faa: lea rcx, [rbp - 0x58]
0x145891fae: call 0x1458712e0
0x145891fb3: nop
0x145891fb4: mov rcx, r15
0x145891fb7: mov qword ptr [r15 + 0xc58], 0
0x145891fc2: mov qword ptr [r15 + 0xc68], 0xffffffffffffffff
0x145891fcd: mov qword ptr [r15 + 0xc80], 0
0x145891fd8: mov qword ptr [r15 + 0xc88], 8
0x145891fe3: mov qword ptr [r15 + 0xc90], 0
0x145891fee: mov qword ptr [r15 + 0xc98], 0xffffffffffffffff
0x145891ff9: mov qword ptr [r15 + 0xe80], 0xffffffffffffffff
0x145892004: mov rax, qword ptr [rbp + 0x1b0]
0x14589200b: mov qword ptr [r15 + 0xf10], rax
0x145892012: mov rax, qword ptr [rbp + 0x1b8]
0x145892019: mov qword ptr [r15 + 0xf18], rax
0x145892020: mov qword ptr [r15 + 0xf20], 0
0x14589202b: xorps xmm0, xmm0
0x14589202e: movups xmmword ptr [r15 + 0xf30], xmm0
0x145892036: movups xmmword ptr [r15 + 0xf3a], xmm0
0x14589203e: mov byte ptr [rbp + 0x1c7], 0
0x145892045: mov qword ptr [rsp + 0x20], 0
0x14589204e: lea rdx, [rip + 0x179ae28]
0x145892055: mov r8d, 7
0x14589205b: mov r9d, 1
0x145892061: call 0x145893140
0x145892066: mov al, 1
0x145892068: jmp 0x145891ebf
0x14589206d: mov byte ptr [rbp + 0x1c7], 1
0x145892074: mov ecx, 1
0x145892079: mov edx, 7
0x14589207e: call 0x145eb6fcb
0x145892083: nop
0x145892084: ud2
