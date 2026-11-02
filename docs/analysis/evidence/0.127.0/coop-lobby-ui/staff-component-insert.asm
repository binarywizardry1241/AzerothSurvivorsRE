0x140177bd0: push r14
0x140177bd2: push rsi
0x140177bd3: push rdi
0x140177bd4: push rbp
0x140177bd5: push rbx
0x140177bd6: sub rsp, 0x50
0x140177bda: mov r9, qword ptr [rcx]
0x140177bdd: mov rax, r9
0x140177be0: mov r8d, r9d
0x140177be3: mov r10d, 0xffffffff
0x140177be9: xor r10, r8
0x140177bec: lea rsi, [r10 + r10*2]
0x140177bf0: shl rsi, 3
0x140177bf4: add rsi, qword ptr [rdx + 8]
0x140177bf8: shr rax, 0x20
0x140177bfc: cmp r10, qword ptr [rdx + 0x10]
0x140177c00: lea r11, [rip + 0x60d87b9]
0x140177c07: cmovb r11, rsi
0x140177c0b: mov r10d, dword ptr [r11 + 0x10]
0x140177c0f: cmp r10d, eax
0x140177c12: jne 0x140177c57
0x140177c14: mov r8d, dword ptr [r11]
0x140177c17: test r8d, r8d
0x140177c1a: je 0x140177c5b
0x140177c1c: movzx ecx, byte ptr [rcx + 8]
0x140177c20: mov rax, qword ptr [r11 + 4]
0x140177c24: mov r10d, dword ptr [r11 + 0xc]
0x140177c28: mov qword ptr [rsp + 0x20], rdx
0x140177c2d: mov qword ptr [rsp + 0x28], r9
0x140177c32: mov dword ptr [rsp + 0x30], r8d
0x140177c37: mov qword ptr [rsp + 0x34], rax
0x140177c3c: mov dword ptr [rsp + 0x3c], r10d
0x140177c41: lea rdx, [rsp + 0x20]
0x140177c46: call 0x1402cc8f0
0x140177c4b: nop 
0x140177c4c: add rsp, 0x50
0x140177c50: pop rbx
0x140177c51: pop rbp
0x140177c52: pop rdi
0x140177c53: pop rsi
0x140177c54: pop r14
0x140177c56: ret 
0x140177c57: xor eax, eax
0x140177c59: jmp 0x140177c61
0x140177c5b: xor r8d, r8d
0x140177c5e: mov r10, r9
0x140177c61: movabs rcx, 0xffffffff00000000
0x140177c6b: and r9, rcx
0x140177c6e: or r9, r8
0x140177c71: mov qword ptr [rsp + 0x40], r9
0x140177c76: mov dword ptr [rsp + 0x48], r10d
0x140177c7b: mov rcx, qword ptr [rsp + 0x44]
0x140177c80: lea rsi, [rip - 0x20887]
0x140177c87: cmp qword ptr [rdx + 0x90], 0
0x140177c8f: je 0x140177d66
0x140177c95: mov r9, qword ptr [rdx + 0x78]
0x140177c99: mov r10, qword ptr [rdx + 0x80]
0x140177ca0: movabs r11, 0xdfb0d1bbf0b0379b
0x140177caa: xor edi, edi
0x140177cac: movdqa xmm0, xmmword ptr [rip + 0x60b9ecc]
0x140177cb4: pcmpeqd xmm1, xmm1
0x140177cb8: movdqa xmm2, xmmword ptr [rip + 0x60d7f50]
0x140177cc0: and r11, r10
0x140177cc3: movdqu xmm3, xmmword ptr [r9 + r11]
0x140177cc9: movdqa xmm4, xmm3
0x140177ccd: pcmpeqb xmm4, xmm0
0x140177cd1: pmovmskb ebx, xmm4
0x140177cd5: test ebx, ebx
0x140177cd7: je 0x140177d0c
0x140177cd9: tzcnt r14d, ebx
0x140177cde: add r14, r11
0x140177ce1: and r14, r10
0x140177ce4: neg r14
0x140177ce7: lea r14, [r14 + r14*2]
0x140177ceb: movdqu xmm4, xmmword ptr [r9 + r14*8 - 0x18]
0x140177cf2: pcmpeqb xmm4, xmm2
0x140177cf6: pmovmskb ebp, xmm4
0x140177cfa: cmp ebp, 0xffff
0x140177d00: je 0x140177d25
0x140177d02: lea ebp, [rbx - 1]
0x140177d05: and bp, bx
0x140177d08: mov ebx, ebp
0x140177d0a: jne 0x140177cd9
0x140177d0c: pcmpeqb xmm3, xmm1
0x140177d10: pmovmskb ebx, xmm3
0x140177d14: test ebx, ebx
0x140177d16: jne 0x140177d66
0x140177d18: add r11, rdi
0x140177d1b: add r11, 0x10
0x140177d1f: add rdi, 0x10
0x140177d23: jmp 0x140177cc0
0x140177d25: lea r9, [r9 + r14*8]
0x140177d29: mov r9, qword ptr [r9 - 8]
0x140177d2d: cmp r9, qword ptr [rdx + 0x218]
0x140177d34: jae 0x140177d66
0x140177d36: mov r10, qword ptr [rdx + 0x210]
0x140177d3d: mov r9, qword ptr [r10 + r9*8]
0x140177d41: test r9, r9
0x140177d44: je 0x140177d66
0x140177d46: mov rdx, qword ptr [rdx + 0x1e0]
0x140177d4d: not r9
0x140177d50: imul r9, r9, 0x38
0x140177d54: cmp byte ptr [rdx + r9 + 0x30], 1
0x140177d5a: jne 0x140177d66
0x140177d5c: add rdx, r9
0x140177d5f: mov rdx, qword ptr [rdx + 0x10]
0x140177d63: mov rsi, qword ptr [rdx]
0x140177d66: mov qword ptr [rsp + 0x20], 0
0x140177d6f: mov dword ptr [rsp + 0x28], r8d
0x140177d74: mov qword ptr [rsp + 0x2c], rcx
0x140177d79: mov dword ptr [rsp + 0x34], eax
0x140177d7d: lea rcx, [rsp + 0x20]
0x140177d82: call 0x146065b60
0x140177d87: mov edx, 2
0x140177d8c: mov rcx, rax
0x140177d8f: call rsi
0x140177d91: jmp 0x140177c4c
