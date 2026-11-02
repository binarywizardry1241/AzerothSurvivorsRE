0x145883b80: push rbp
0x145883b81: push r15
0x145883b83: push r14
0x145883b85: push r13
0x145883b87: push r12
0x145883b89: push rsi
0x145883b8a: push rdi
0x145883b8b: push rbx
0x145883b8c: mov eax, 0x2d68
0x145883b91: call 0x145d13ac0
0x145883b96: sub rsp, rax
0x145883b99: lea rbp, [rsp + 0x80]
0x145883ba1: movaps xmmword ptr [rbp + 0x2cd0], xmm6
0x145883ba8: mov qword ptr [rbp + 0x2cc8], 0xfffffffffffffffe
0x145883bb3: mov rdi, r9
0x145883bb6: mov ebx, r8d
0x145883bb9: mov r13, rdx
0x145883bbc: mov rsi, rcx
0x145883bbf: mov r14, qword ptr [rbp + 0x2d50]
0x145883bc6: mov rax, qword ptr [rcx + 0xc58]
0x145883bcd: cmp rax, 1
0x145883bd1: ja 0x145883c39
0x145883bd3: cmp byte ptr [rsi + 0xf49], 0
0x145883bda: je 0x145883c39
0x145883bdc: cmp bx, 0x4b
0x145883be0: je 0x145883d88
0x145883be6: movzx eax, bx
0x145883be9: cmp eax, 0x1ce
0x145883bee: je 0x145883d88
0x145883bf4: cmp eax, 0x1dc
0x145883bf9: je 0x145883d88
0x145883bff: test r14, r14
0x145883c02: je 0x145883f18
0x145883c08: call 0x140002200
0x145883c0d: mov edx, 1
0x145883c12: mov rcx, r14
0x145883c15: call 0x1400021c0
0x145883c1a: test rax, rax
0x145883c1d: je 0x145887cca
0x145883c23: mov r15, rax
0x145883c26: mov rcx, rax
0x145883c29: mov rdx, rdi
0x145883c2c: mov r8, r14
0x145883c2f: call 0x145d145fb
0x145883c34: jmp 0x145883f1e
0x145883c39: movzx edx, bx
0x145883c3c: lea ecx, [rdx - 0x36]
0x145883c3f: cmp ecx, 7
0x145883c42: ja 0x145883c87
0x145883c44: lea rdx, [rip + 0x17abfcd]
0x145883c4b: movsxd rcx, dword ptr [rdx + rcx*4]
0x145883c4f: add rcx, rdx
0x145883c52: jmp rcx
0x145883c54: mov r15b, 0x45
0x145883c57: test r14, r14
0x145883c5a: je 0x1458861c1
0x145883c60: xor ebx, ebx
0x145883c62: nop word ptr cs:[rax + rax]
0x145883c70: cmp byte ptr [rdi + rbx], 0
0x145883c74: je 0x145884272
0x145883c7a: inc rbx
0x145883c7d: cmp r14, rbx
0x145883c80: jne 0x145883c70
0x145883c82: jmp 0x1458861c1
0x145883c87: cmp edx, 0x1ed
0x145883c8d: jne 0x145883d88
0x145883c93: test byte ptr [rsi + 0x17e0], 1
0x145883c9a: xorps xmm0, xmm0
0x145883c9d: movaps xmmword ptr [rbp + 0x2ba0], xmm0
0x145883ca4: movaps xmmword ptr [rbp + 0x2b90], xmm0
0x145883cab: mov qword ptr [rbp + 0x2bb0], 0
0x145883cb6: je 0x145883ce2
0x145883cb8: mov rax, qword ptr [rsi + 0x1801]
0x145883cbf: mov qword ptr [rbp + 0x2bb0], rax
0x145883cc6: movups xmm0, xmmword ptr [rsi + 0x17e1]
0x145883ccd: movups xmm1, xmmword ptr [rsi + 0x17f1]
0x145883cd4: movaps xmmword ptr [rbp + 0x2ba0], xmm1
0x145883cdb: movaps xmmword ptr [rbp + 0x2b90], xmm0
0x145883ce2: mov rdx, qword ptr [rsi + 0xf90]
0x145883ce9: cmp r13, rdx
0x145883cec: jae 0x145887cd9
0x145883cf2: mov rax, qword ptr [rsi + 0xf88]
0x145883cf9: imul rcx, r13, 0xb0
0x145883d00: mov byte ptr [rax + rcx + 0x30], 1
0x145883d05: movaps xmm0, xmmword ptr [rbp + 0x2b90]
0x145883d0c: movaps xmm1, xmmword ptr [rbp + 0x2ba0]
0x145883d13: movups xmmword ptr [rax + rcx + 0x31], xmm0
0x145883d18: movups xmmword ptr [rax + rcx + 0x41], xmm1
0x145883d1d: mov rdx, qword ptr [rbp + 0x2bb0]
0x145883d24: mov qword ptr [rax + rcx + 0x51], rdx
0x145883d29: mov word ptr [rax + rcx + 0x59], 0
0x145883d30: movdqa xmm0, xmmword ptr [rbp + 0x2b90]
0x145883d38: movaps xmm1, xmmword ptr [rbp + 0x2ba0]
0x145883d3f: movdqu xmmword ptr [rax + rcx + 0x5b], xmm0
0x145883d45: movups xmmword ptr [rax + rcx + 0x6b], xmm1
0x145883d4a: mov rdx, qword ptr [rbp + 0x2bb0]
0x145883d51: mov qword ptr [rax + rcx + 0x7b], rdx
0x145883d56: mov word ptr [rax + rcx + 0x83], 0
0x145883d60: lea rdi, [rbp + 0x1c50]
0x145883d67: mov rcx, rdi
0x145883d6a: call 0x1459afe20
0x145883d6f: mov rcx, qword ptr [rsi + 0xf88]
0x145883d76: mov rdx, qword ptr [rsi + 0xf90]
0x145883d7d: mov r8, r13
0x145883d80: mov r9, rdi
0x145883d83: jmp 0x14588621f
0x145883d88: mov qword ptr [rsp + 0x28], r14
0x145883d8d: mov qword ptr [rsp + 0x20], rdi
0x145883d92: mov rcx, rsi
0x145883d95: xor edx, edx
0x145883d97: mov r8, r13
0x145883d9a: mov r9d, ebx
0x145883d9d: call 0x145873b00
0x145883da2: jmp 0x145886224
