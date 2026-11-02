0x1459bb9f0: push r15
0x1459bb9f2: push r14
0x1459bb9f4: push r12
0x1459bb9f6: push rsi
0x1459bb9f7: push rdi
0x1459bb9f8: push rbp
0x1459bb9f9: push rbx
0x1459bb9fa: mov rax, qword ptr [rcx + 0x10]
0x1459bb9fe: test rax, rax
0x1459bba01: je 0x1459bbae1
0x1459bba07: mov r8, qword ptr [rcx + 8]
0x1459bba0b: mov rdx, qword ptr [rdx]
0x1459bba0e: mov r11, qword ptr [rdx + 8]
0x1459bba12: mov rsi, qword ptr [rdx + 0x10]
0x1459bba16: movabs r9, 0x1ffffffffffffff0
0x1459bba20: mov rdi, rsi
0x1459bba23: and rdi, r9
0x1459bba26: lea rbx, [r11 + rdi*4]
0x1459bba2a: and esi, 0xf
0x1459bba2d: shl esi, 2
0x1459bba30: xor r10d, r10d
0x1459bba33: jmp 0x1459bba4c
0x1459bba35: nop word ptr cs:[rax + rax]
0x1459bba40: inc r10
0x1459bba43: cmp r10, rax
0x1459bba46: je 0x1459bbae1
0x1459bba4c: mov ebp, dword ptr [r8 + r10*8]
0x1459bba50: movd xmm0, ebp
0x1459bba54: pshufd xmm0, xmm0, 0
0x1459bba59: xor r14d, r14d
0x1459bba5c: nop dword ptr [rax]
0x1459bba60: cmp rdi, r14
0x1459bba63: je 0x1459bbab0
0x1459bba65: movdqu xmm1, xmmword ptr [r11 + r14*4]
0x1459bba6b: movdqu xmm2, xmmword ptr [r11 + r14*4 + 0x10]
0x1459bba72: movdqu xmm3, xmmword ptr [r11 + r14*4 + 0x20]
0x1459bba79: movdqu xmm4, xmmword ptr [r11 + r14*4 + 0x30]
0x1459bba80: pcmpeqd xmm2, xmm0
0x1459bba84: pcmpeqd xmm1, xmm0
0x1459bba88: packssdw xmm1, xmm2
0x1459bba8c: pcmpeqd xmm3, xmm0
0x1459bba90: pcmpeqd xmm4, xmm0
0x1459bba94: packssdw xmm3, xmm4
0x1459bba98: packsswb xmm1, xmm3
0x1459bba9c: pmovmskb r15d, xmm1
0x1459bbaa1: add r14, 0x10
0x1459bbaa5: test r15d, r15d
0x1459bbaa8: je 0x1459bba60
0x1459bbaaa: jmp 0x1459bba40
0x1459bbaac: nop dword ptr [rax]
0x1459bbab0: xor r14d, r14d
0x1459bbab3: nop word ptr cs:[rax + rax]
0x1459bbac0: cmp rsi, r14
0x1459bbac3: je 0x1459bbad4
0x1459bbac5: cmp dword ptr [rbx + r14], ebp
0x1459bbac9: lea r14, [r14 + 4]
0x1459bbacd: jne 0x1459bbac0
0x1459bbacf: jmp 0x1459bba40
0x1459bbad4: lea r11, [r10 + 1]
0x1459bbad8: cmp r11, rax
0x1459bbadb: jb 0x1459bbb03
0x1459bbadd: mov qword ptr [rcx + 0x10], r10
0x1459bbae1: pop rbx
0x1459bbae2: pop rbp
0x1459bbae3: pop rdi
0x1459bbae4: pop rsi
0x1459bbae5: pop r12
0x1459bbae7: pop r14
0x1459bbae9: pop r15
0x1459bbaeb: ret
0x1459bbaec: nop dword ptr [rax]
0x1459bbaf0: mov rsi, qword ptr [r8 + r11*8]
0x1459bbaf4: mov qword ptr [r8 + r10*8], rsi
0x1459bbaf8: inc r10
0x1459bbafb: inc r11
0x1459bbafe: cmp r11, rax
0x1459bbb01: je 0x1459bbadd
0x1459bbb03: mov esi, dword ptr [r8 + r11*8]
0x1459bbb07: mov r14, qword ptr [rdx + 8]
0x1459bbb0b: mov rdi, qword ptr [rdx + 0x10]
0x1459bbb0f: mov r15, rdi
0x1459bbb12: and r15, r9
0x1459bbb15: lea rbx, [r14 + r15*4]
0x1459bbb19: and edi, 0xf
0x1459bbb1c: movd xmm0, esi
0x1459bbb20: pshufd xmm0, xmm0, 0
0x1459bbb25: xor r12d, r12d
0x1459bbb28: nop dword ptr [rax + rax]
0x1459bbb30: cmp r15, r12
0x1459bbb33: je 0x1459bbb80
0x1459bbb35: movdqu xmm1, xmmword ptr [r14 + r12*4]
0x1459bbb3b: movdqu xmm2, xmmword ptr [r14 + r12*4 + 0x10]
0x1459bbb42: movdqu xmm3, xmmword ptr [r14 + r12*4 + 0x20]
0x1459bbb49: movdqu xmm4, xmmword ptr [r14 + r12*4 + 0x30]
0x1459bbb50: pcmpeqd xmm2, xmm0
0x1459bbb54: pcmpeqd xmm1, xmm0
0x1459bbb58: packssdw xmm1, xmm2
0x1459bbb5c: pcmpeqd xmm3, xmm0
0x1459bbb60: pcmpeqd xmm4, xmm0
0x1459bbb64: packssdw xmm3, xmm4
0x1459bbb68: packsswb xmm1, xmm3
0x1459bbb6c: pmovmskb ebp, xmm1
0x1459bbb70: add r12, 0x10
0x1459bbb74: test ebp, ebp
0x1459bbb76: je 0x1459bbb30
0x1459bbb78: jmp 0x1459bbaf0
0x1459bbb7d: nop dword ptr [rax]
0x1459bbb80: shl edi, 2
0x1459bbb83: xor r14d, r14d
0x1459bbb86: nop word ptr cs:[rax + rax]
0x1459bbb90: cmp rdi, r14
0x1459bbb93: je 0x1459bbafb
0x1459bbb99: cmp dword ptr [rbx + r14], esi
0x1459bbb9d: lea r14, [r14 + 4]
0x1459bbba1: jne 0x1459bbb90
0x1459bbba3: jmp 0x1459bbaf0
