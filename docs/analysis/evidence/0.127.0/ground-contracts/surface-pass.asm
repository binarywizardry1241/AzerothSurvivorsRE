145ba2c8e: cmp qword ptr [rbp + 0x1b0], 0
145ba2c96: je 0x145ba2e55
145ba2c9c: mov rax, qword ptr [rbp + 0x1b0]
145ba2ca3: dec rax
145ba2ca6: mov qword ptr [rbp + 0x190], rax
145ba2cad: xor ecx, ecx
145ba2caf: xor r9d, r9d
145ba2cb2: jmp 0x145ba2ce1
145ba2cb4: nop word ptr cs:[rax + rax]
145ba2cc0: mov rax, qword ptr [rbp + 0x1b0]
145ba2cc7: mov rcx, qword ptr [rbp + 0x130]
145ba2cce: add rcx, rax
145ba2cd1: mov r9, qword ptr [rbp + 0x158]
145ba2cd8: cmp r9, rax
145ba2cdb: je 0x145ba2e55
145ba2ce1: lea r11, [r9 + 1]
145ba2ce5: mov rax, qword ptr [rbp + 0x190]
145ba2cec: cmp rax, r11
145ba2cef: mov qword ptr [rbp + 0x158], r11
145ba2cf6: cmovb r11, rax
145ba2cfa: cmp r9, 1
145ba2cfe: mov r10, r9
145ba2d01: adc r10, -1
145ba2d05: cmp r10, r11
145ba2d08: mov qword ptr [rbp + 0x130], rcx
145ba2d0f: jbe 0x145ba2d40
145ba2d11: mov rax, qword ptr [rbp + 0x1b0]
145ba2d18: nop dword ptr [rax + rax]
145ba2d20: cmp rcx, rsi
145ba2d23: jae 0x145ba300e
145ba2d29: inc rcx
145ba2d2c: dec rax
145ba2d2f: jne 0x145ba2d20
145ba2d31: jmp 0x145ba2cc0
145ba2d33: nop word ptr cs:[rax + rax]
145ba2d40: imul r9, qword ptr [rbp + 0x1b0]
145ba2d48: xor edx, edx
145ba2d4a: jmp 0x145ba2d64
145ba2d4c: nop dword ptr [rax]
145ba2d50: cmp rdx, qword ptr [rbp + 0x1b0]
145ba2d57: mov rdi, qword ptr [rbp + 0x1a8]
145ba2d5e: je 0x145ba2cc0
145ba2d64: lea rcx, [rdx + r9]
145ba2d68: cmp rcx, rsi
145ba2d6b: jae 0x145ba300e
145ba2d71: mov rbx, rdx
145ba2d74: inc rdx
145ba2d77: movss xmm0, dword ptr [rdi + rcx*4]
145ba2d7c: ucomiss xmm0, xmm0
145ba2d7f: jp 0x145ba2d50
145ba2d81: mov rax, qword ptr [rbp + 0x190]
145ba2d88: cmp rax, rdx
145ba2d8b: mov r15, rdx
145ba2d8e: cmovb r15, rax
145ba2d92: cmp rbx, 1
145ba2d96: adc rbx, -1
145ba2d9a: mov rax, r10
145ba2d9d: mov rdi, r10
145ba2da0: cmp rbx, r15
145ba2da3: jbe 0x145ba2dd0
145ba2da5: nop word ptr cs:[rax + rax]
145ba2db0: mov rcx, rax
145ba2db3: cmp rax, r11
145ba2db6: adc rax, 0
145ba2dba: cmp rcx, r11
145ba2dbd: jae 0x145ba2d50
145ba2dbf: cmp rax, r11
145ba2dc2: jbe 0x145ba2db0
145ba2dc4: jmp 0x145ba2d50
145ba2dc6: nop word ptr cs:[rax + rax]
145ba2dd0: mov r12, rdi
145ba2dd3: cmp rdi, r11
145ba2dd6: adc rdi, 0
145ba2dda: mov r13, r12
145ba2ddd: imul r13, qword ptr [rbp + 0x1b0]
145ba2de5: mov r14, rbx
145ba2de8: mov r8, rbx
145ba2deb: nop dword ptr [rax + rax]
145ba2df0: cmp r14, r15
145ba2df3: adc r8, 0
145ba2df7: lea rax, [r14 + r13]
145ba2dfb: cmp rax, rsi
145ba2dfe: jae 0x145ba2fa6
145ba2e04: mov rsi, qword ptr [rbp + 0x1a8]
145ba2e0b: movss xmm1, dword ptr [rsi + rax*4]
145ba2e10: movaps xmm2, xmm1
145ba2e13: subss xmm2, xmm0
145ba2e17: ucomiss xmm6, xmm2
145ba2e1a: mov rax, qword ptr [rbp + 0x1a0]
145ba2e21: jb 0x145ba2e2e
145ba2e23: ucomiss xmm1, dword ptr [rax + rcx*4]
145ba2e27: jbe 0x145ba2e2e
145ba2e29: movss dword ptr [rax + rcx*4], xmm1
145ba2e2e: cmp r14, r15
145ba2e31: mov rsi, qword ptr [rbp + 0x170]
145ba2e38: jae 0x145ba2e42
145ba2e3a: mov r14, r8
145ba2e3d: cmp r8, r15
145ba2e40: jbe 0x145ba2df0
145ba2e42: cmp r12, r11
145ba2e45: jae 0x145ba2d50
145ba2e4b: cmp rdi, r11
145ba2e4e: jbe 0x145ba2dd0
145ba2e50: jmp 0x145ba2d50
145ba2e55: test rsi, rsi
145ba2e58: je 0x145ba2e73
145ba2e5a: mov r8d, 4
145ba2e60: mov rcx, qword ptr [rbp + 0x168]
145ba2e67: mov rdx, qword ptr [rbp + 0x160]
145ba2e6e: call 0x1400021d0
145ba2e73: mov rax, qword ptr [rbp + 0xd8]
145ba2e7a: mov qword ptr [rax], rsi
145ba2e7d: mov qword ptr [rax + 8], rdi
145ba2e81: mov qword ptr [rax + 0x10], rsi
145ba2e85: mov qword ptr [rax + 0x18], rsi
145ba2e89: mov rcx, qword ptr [rbp + 0x1a0]
145ba2e90: mov qword ptr [rax + 0x20], rcx
145ba2e94: mov qword ptr [rax + 0x28], rsi
145ba2e98: mov rcx, qword ptr [rbp + 0x1b0]
145ba2e9f: mov qword ptr [rax + 0x30], rcx
145ba2ea3: movlps qword ptr [rax + 0x38], xmm7
