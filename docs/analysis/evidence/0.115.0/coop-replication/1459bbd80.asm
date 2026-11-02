0x1459bbd80: push r14
0x1459bbd82: push rsi
0x1459bbd83: push rdi
0x1459bbd84: push rbp
0x1459bbd85: push rbx
0x1459bbd86: mov rax, qword ptr [rcx + 0x10]
0x1459bbd8a: test rax, rax
0x1459bbd8d: je 0x1459bbf1c
0x1459bbd93: mov r8, qword ptr [rcx + 8]
0x1459bbd97: mov r9, qword ptr [rdx + 8]
0x1459bbd9b: mov rdx, qword ptr [rdx + 0x10]
0x1459bbd9f: movabs r10, 0x1ffffffffffffff0
0x1459bbda9: and r10, rdx
0x1459bbdac: lea r11, [r9 + r10*4]
0x1459bbdb0: and edx, 0xf
0x1459bbdb3: lea edi, [rdx*4]
0x1459bbdba: xor esi, esi
0x1459bbdbc: jmp 0x1459bbdcc
0x1459bbdbe: nop
0x1459bbdc0: inc rsi
0x1459bbdc3: cmp rsi, rax
0x1459bbdc6: je 0x1459bbf1c
0x1459bbdcc: mov ebx, dword ptr [r8 + rsi*4]
0x1459bbdd0: movd xmm0, ebx
0x1459bbdd4: pshufd xmm0, xmm0, 0
0x1459bbdd9: xor r14d, r14d
0x1459bbddc: nop dword ptr [rax]
0x1459bbde0: cmp r10, r14
0x1459bbde3: je 0x1459bbe30
0x1459bbde5: movdqu xmm1, xmmword ptr [r9 + r14*4]
0x1459bbdeb: movdqu xmm2, xmmword ptr [r9 + r14*4 + 0x10]
0x1459bbdf2: movdqu xmm3, xmmword ptr [r9 + r14*4 + 0x20]
0x1459bbdf9: movdqu xmm4, xmmword ptr [r9 + r14*4 + 0x30]
0x1459bbe00: pcmpeqd xmm2, xmm0
0x1459bbe04: pcmpeqd xmm1, xmm0
0x1459bbe08: packssdw xmm1, xmm2
0x1459bbe0c: pcmpeqd xmm3, xmm0
0x1459bbe10: pcmpeqd xmm4, xmm0
0x1459bbe14: packssdw xmm3, xmm4
0x1459bbe18: packsswb xmm1, xmm3
0x1459bbe1c: pmovmskb ebp, xmm1
0x1459bbe20: add r14, 0x10
0x1459bbe24: test ebp, ebp
0x1459bbe26: je 0x1459bbde0
0x1459bbe28: jmp 0x1459bbdc0
0x1459bbe2a: nop word ptr [rax + rax]
0x1459bbe30: xor r14d, r14d
0x1459bbe33: nop word ptr cs:[rax + rax]
0x1459bbe40: cmp rdi, r14
0x1459bbe43: je 0x1459bbe54
0x1459bbe45: cmp dword ptr [r11 + r14], ebx
0x1459bbe49: lea r14, [r14 + 4]
0x1459bbe4d: jne 0x1459bbe40
0x1459bbe4f: jmp 0x1459bbdc0
0x1459bbe54: lea rdi, [rsi + 1]
0x1459bbe58: cmp rdi, rax
0x1459bbe5b: jae 0x1459bbf18
0x1459bbe61: shl edx, 2
0x1459bbe64: jmp 0x1459bbe83
0x1459bbe66: nop word ptr cs:[rax + rax]
0x1459bbe70: mov dword ptr [r8 + rsi*4], ebx
0x1459bbe74: inc rsi
0x1459bbe77: inc rdi
0x1459bbe7a: cmp rdi, rax
0x1459bbe7d: je 0x1459bbf18
0x1459bbe83: mov ebx, dword ptr [r8 + rdi*4]
0x1459bbe87: movd xmm0, ebx
0x1459bbe8b: pshufd xmm0, xmm0, 0
0x1459bbe90: xor r14d, r14d
0x1459bbe93: nop word ptr cs:[rax + rax]
0x1459bbea0: cmp r10, r14
0x1459bbea3: je 0x1459bbef0
0x1459bbea5: movdqu xmm1, xmmword ptr [r9 + r14*4]
0x1459bbeab: movdqu xmm2, xmmword ptr [r9 + r14*4 + 0x10]
0x1459bbeb2: movdqu xmm3, xmmword ptr [r9 + r14*4 + 0x20]
0x1459bbeb9: movdqu xmm4, xmmword ptr [r9 + r14*4 + 0x30]
0x1459bbec0: pcmpeqd xmm2, xmm0
0x1459bbec4: pcmpeqd xmm1, xmm0
0x1459bbec8: packssdw xmm1, xmm2
0x1459bbecc: pcmpeqd xmm3, xmm0
0x1459bbed0: pcmpeqd xmm4, xmm0
0x1459bbed4: packssdw xmm3, xmm4
0x1459bbed8: packsswb xmm1, xmm3
0x1459bbedc: pmovmskb ebp, xmm1
0x1459bbee0: add r14, 0x10
0x1459bbee4: test ebp, ebp
0x1459bbee6: je 0x1459bbea0
0x1459bbee8: jmp 0x1459bbe70
0x1459bbeea: nop word ptr [rax + rax]
0x1459bbef0: xor r14d, r14d
0x1459bbef3: nop word ptr cs:[rax + rax]
0x1459bbf00: cmp rdx, r14
0x1459bbf03: je 0x1459bbe77
0x1459bbf09: cmp dword ptr [r11 + r14], ebx
0x1459bbf0d: lea r14, [r14 + 4]
0x1459bbf11: jne 0x1459bbf00
0x1459bbf13: jmp 0x1459bbe70
0x1459bbf18: mov qword ptr [rcx + 0x10], rsi
0x1459bbf1c: pop rbx
0x1459bbf1d: pop rbp
0x1459bbf1e: pop rdi
0x1459bbf1f: pop rsi
0x1459bbf20: pop r14
0x1459bbf22: ret
