0x1459c1b00: push rbp
0x1459c1b01: push r15
0x1459c1b03: push r14
0x1459c1b05: push r13
0x1459c1b07: push r12
0x1459c1b09: push rsi
0x1459c1b0a: push rdi
0x1459c1b0b: push rbx
0x1459c1b0c: sub rsp, 0x198
0x1459c1b13: lea rbp, [rsp + 0x80]
0x1459c1b1b: mov qword ptr [rbp + 0x110], 0xfffffffffffffffe
0x1459c1b26: mov qword ptr [rbp + 0xf0], rcx
0x1459c1b2d: mov byte ptr [rbp + 0x10f], 1
0x1459c1b34: lea rcx, [rbp + 0xb8]
0x1459c1b3b: mov qword ptr [rbp + 0xf8], rdx
0x1459c1b42: call 0x1459d1360
0x1459c1b47: nop
0x1459c1b48: mov rsi, qword ptr [rbp + 0xb8]
0x1459c1b4f: cmp rsi, -1
0x1459c1b53: je 0x1459c1ca4
0x1459c1b59: mov rdi, qword ptr [rbp + 0xc0]
0x1459c1b60: call 0x140002200
0x1459c1b65: mov ecx, 0x60
0x1459c1b6a: mov edx, 8
0x1459c1b6f: call 0x1400021c0
0x1459c1b74: test rax, rax
0x1459c1b77: je 0x1459c1e38
0x1459c1b7d: mov rbx, rax
0x1459c1b80: mov rax, qword ptr [rbp + 0xc8]
0x1459c1b87: mov qword ptr [rbx + 0x10], rax
0x1459c1b8b: movups xmm0, xmmword ptr [rbp + 0xb8]
0x1459c1b92: movups xmmword ptr [rbx], xmm0
0x1459c1b95: mov qword ptr [rbp + 0xd0], 4
0x1459c1ba0: mov qword ptr [rbp + 0xd8], rbx
0x1459c1ba7: mov qword ptr [rbp + 0xe0], 1
0x1459c1bb2: lea rdi, [rbp - 0x50]
0x1459c1bb6: mov r8d, 0xf0
0x1459c1bbc: mov rcx, rdi
0x1459c1bbf: mov rdx, qword ptr [rbp + 0xf8]
0x1459c1bc6: call 0x145d145fb
0x1459c1bcb: mov r14d, 1
0x1459c1bd1: lea r15, [rbp + 0xa0]
0x1459c1bd8: lea r12, [rbp + 0xd0]
0x1459c1bdf: jmp 0x1459c1c15
0x1459c1be1: nop word ptr cs:[rax + rax]
0x1459c1bf0: lea rax, [r14 + r14*2]
0x1459c1bf4: mov rcx, qword ptr [rbp + 0xb0]
0x1459c1bfb: mov qword ptr [rbx + rax*8 + 0x10], rcx
0x1459c1c00: movups xmm0, xmmword ptr [rbp + 0xa0]
0x1459c1c07: movups xmmword ptr [rbx + rax*8], xmm0
0x1459c1c0b: inc r14
0x1459c1c0e: mov qword ptr [rbp + 0xe0], r14
0x1459c1c15: mov rcx, r15
0x1459c1c18: mov rdx, rdi
0x1459c1c1b: call 0x1459d1360
0x1459c1c20: nop
0x1459c1c21: mov rax, qword ptr [rbp + 0xa0]
0x1459c1c28: cmp rax, -1
0x1459c1c2c: je 0x1459c1c79
0x1459c1c2e: cmp r14, qword ptr [rbp + 0xd0]
0x1459c1c35: jne 0x1459c1bf0
0x1459c1c37: mov qword ptr [rbp + 0x100], rax
0x1459c1c3e: mov rax, qword ptr [rbp + 0xa8]
0x1459c1c45: mov qword ptr [rbp + 0xe8], rax
0x1459c1c4c: mov qword ptr [rsp + 0x20], 0x18
0x1459c1c55: mov r8d, 1
0x1459c1c5b: mov r9d, 8
0x1459c1c61: mov rcx, r12
0x1459c1c64: mov rdx, r14
0x1459c1c67: call 0x145d14a10
0x1459c1c6c: nop
0x1459c1c6d: mov rbx, qword ptr [rbp + 0xd8]
0x1459c1c74: jmp 0x1459c1bf0
0x1459c1c79: mov rax, qword ptr [rbp - 0x50]
0x1459c1c7d: mov rbx, qword ptr [rbp - 0x48]
0x1459c1c81: sub rbx, rax
0x1459c1c84: jne 0x1459c1cf4
0x1459c1c86: mov rax, qword ptr [rbp + 0xe0]
0x1459c1c8d: mov rcx, qword ptr [rbp + 0xf0]
0x1459c1c94: mov qword ptr [rcx + 0x10], rax
0x1459c1c98: movups xmm0, xmmword ptr [rbp + 0xd0]
0x1459c1c9f: movups xmmword ptr [rcx], xmm0
0x1459c1ca2: jmp 0x1459c1cd9
0x1459c1ca4: mov rax, qword ptr [rbp + 0xf0]
0x1459c1cab: mov qword ptr [rax], 0
0x1459c1cb2: mov qword ptr [rax + 8], 8
0x1459c1cba: mov qword ptr [rax + 0x10], 0
0x1459c1cc2: mov rcx, qword ptr [rbp + 0xf8]
0x1459c1cc9: mov rax, qword ptr [rcx]
0x1459c1ccc: mov rbx, qword ptr [rcx + 8]
0x1459c1cd0: sub rbx, rax
0x1459c1cd3: jne 0x1459c1d98
0x1459c1cd9: mov rax, qword ptr [rbp + 0xf0]
0x1459c1ce0: add rsp, 0x198
0x1459c1ce7: pop rbx
0x1459c1ce8: pop rdi
0x1459c1ce9: pop rsi
0x1459c1cea: pop r12
0x1459c1cec: pop r13
0x1459c1cee: pop r14
0x1459c1cf0: pop r15
0x1459c1cf2: pop rbp
0x1459c1cf3: ret
0x1459c1cf4: imul rax, rax, 0x38
0x1459c1cf8: lea r14, [rax + rbp]
0x1459c1cfc: add r14, -0x40
0x1459c1d00: xor r15d, r15d
0x1459c1d03: jmp 0x1459c1d1c
0x1459c1d05: nop word ptr cs:[rax + rax]
0x1459c1d10: inc r15
0x1459c1d13: cmp r15, rbx
0x1459c1d16: je 0x1459c1c86
0x1459c1d1c: imul r12, r15, 0x38
0x1459c1d20: mov rdi, qword ptr [r14 + r12 + 0x28]
0x1459c1d25: mov r13, qword ptr [r14 + r12 + 0x30]
0x1459c1d2a: test r13, r13
0x1459c1d2d: je 0x1459c1d70
0x1459c1d2f: lea rsi, [rdi + 8]
0x1459c1d33: jmp 0x1459c1d49
0x1459c1d35: nop word ptr cs:[rax + rax]
0x1459c1d40: add rsi, 0x18
0x1459c1d44: dec r13
0x1459c1d47: je 0x1459c1d70
0x1459c1d49: mov rdx, qword ptr [rsi - 8]
0x1459c1d4d: test rdx, rdx
0x1459c1d50: je 0x1459c1d40
0x1459c1d52: mov rcx, qword ptr [rsi]
0x1459c1d55: mov r8d, 1
0x1459c1d5b: call 0x1400021d0
0x1459c1d60: jmp 0x1459c1d40
0x1459c1d62: nop word ptr cs:[rax + rax]
0x1459c1d70: add r12, r14
0x1459c1d73: mov rax, qword ptr [r12 + 0x20]
0x1459c1d78: test rax, rax
0x1459c1d7b: je 0x1459c1d10
0x1459c1d7d: shl rax, 3
0x1459c1d81: lea rdx, [rax + rax*2]
0x1459c1d85: mov r8d, 8
0x1459c1d8b: mov rcx, rdi
0x1459c1d8e: call 0x1400021d0
0x1459c1d93: jmp 0x1459c1d10
0x1459c1d98: imul rax, rax, 0x38
0x1459c1d9c: lea r14, [rcx + rax]
0x1459c1da0: add r14, 0x10
0x1459c1da4: xor r15d, r15d
0x1459c1da7: jmp 0x1459c1dbc
0x1459c1da9: nop dword ptr [rax]
0x1459c1db0: inc r15
0x1459c1db3: cmp r15, rbx
0x1459c1db6: je 0x1459c1cd9
0x1459c1dbc: imul r12, r15, 0x38
0x1459c1dc0: mov rdi, qword ptr [r14 + r12 + 0x28]
0x1459c1dc5: mov r13, qword ptr [r14 + r12 + 0x30]
0x1459c1dca: test r13, r13
0x1459c1dcd: je 0x1459c1e10
0x1459c1dcf: lea rsi, [rdi + 8]
0x1459c1dd3: jmp 0x1459c1de9
0x1459c1dd5: nop word ptr cs:[rax + rax]
0x1459c1de0: add rsi, 0x18
0x1459c1de4: dec r13
0x1459c1de7: je 0x1459c1e10
0x1459c1de9: mov rdx, qword ptr [rsi - 8]
0x1459c1ded: test rdx, rdx
0x1459c1df0: je 0x1459c1de0
0x1459c1df2: mov rcx, qword ptr [rsi]
0x1459c1df5: mov r8d, 1
0x1459c1dfb: call 0x1400021d0
0x1459c1e00: jmp 0x1459c1de0
0x1459c1e02: nop word ptr cs:[rax + rax]
0x1459c1e10: add r12, r14
0x1459c1e13: mov rax, qword ptr [r12 + 0x20]
0x1459c1e18: test rax, rax
0x1459c1e1b: je 0x1459c1db0
0x1459c1e1d: shl rax, 3
0x1459c1e21: lea rdx, [rax + rax*2]
0x1459c1e25: mov r8d, 8
0x1459c1e2b: mov rcx, rdi
0x1459c1e2e: call 0x1400021d0
0x1459c1e33: jmp 0x1459c1db0
0x1459c1e38: mov qword ptr [rbp + 0xe8], rdi
0x1459c1e3f: mov qword ptr [rbp + 0x100], rsi
0x1459c1e46: mov ecx, 8
0x1459c1e4b: mov edx, 0x60
0x1459c1e50: call 0x145eb6fcb
0x1459c1e55: nop
0x1459c1e56: ud2
