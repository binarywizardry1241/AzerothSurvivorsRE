0x1459ba540: push r15
0x1459ba542: push r14
0x1459ba544: push r13
0x1459ba546: push r12
0x1459ba548: push rsi
0x1459ba549: push rdi
0x1459ba54a: push rbp
0x1459ba54b: push rbx
0x1459ba54c: mov rax, qword ptr [rcx + 0x10]
0x1459ba550: test rax, rax
0x1459ba553: je 0x1459ba631
0x1459ba559: mov r8, qword ptr [rcx + 8]
0x1459ba55d: mov rdx, qword ptr [rdx]
0x1459ba560: mov r11, qword ptr [rdx + 8]
0x1459ba564: mov rsi, qword ptr [rdx + 0x10]
0x1459ba568: movabs r9, 0x1ffffffffffffff0
0x1459ba572: mov rdi, rsi
0x1459ba575: and rdi, r9
0x1459ba578: lea rbx, [r11 + rdi*4]
0x1459ba57c: and esi, 0xf
0x1459ba57f: shl esi, 2
0x1459ba582: xor r10d, r10d
0x1459ba585: jmp 0x1459ba59c
0x1459ba587: nop word ptr [rax + rax]
0x1459ba590: inc r10
0x1459ba593: cmp r10, rax
0x1459ba596: je 0x1459ba631
0x1459ba59c: lea r14, [r10 + r10*2]
0x1459ba5a0: mov ebp, dword ptr [r8 + r14*4]
0x1459ba5a4: movd xmm0, ebp
0x1459ba5a8: pshufd xmm0, xmm0, 0
0x1459ba5ad: xor r14d, r14d
0x1459ba5b0: cmp rdi, r14
0x1459ba5b3: je 0x1459ba600
0x1459ba5b5: movdqu xmm1, xmmword ptr [r11 + r14*4]
0x1459ba5bb: movdqu xmm2, xmmword ptr [r11 + r14*4 + 0x10]
0x1459ba5c2: movdqu xmm3, xmmword ptr [r11 + r14*4 + 0x20]
0x1459ba5c9: movdqu xmm4, xmmword ptr [r11 + r14*4 + 0x30]
0x1459ba5d0: pcmpeqd xmm2, xmm0
0x1459ba5d4: pcmpeqd xmm1, xmm0
0x1459ba5d8: packssdw xmm1, xmm2
0x1459ba5dc: pcmpeqd xmm3, xmm0
0x1459ba5e0: pcmpeqd xmm4, xmm0
0x1459ba5e4: packssdw xmm3, xmm4
0x1459ba5e8: packsswb xmm1, xmm3
0x1459ba5ec: pmovmskb r15d, xmm1
0x1459ba5f1: add r14, 0x10
0x1459ba5f5: test r15d, r15d
0x1459ba5f8: je 0x1459ba5b0
0x1459ba5fa: jmp 0x1459ba590
0x1459ba5fc: nop dword ptr [rax]
0x1459ba600: xor r14d, r14d
0x1459ba603: nop word ptr cs:[rax + rax]
0x1459ba610: cmp rsi, r14
0x1459ba613: je 0x1459ba624
0x1459ba615: cmp dword ptr [rbx + r14], ebp
0x1459ba619: lea r14, [r14 + 4]
0x1459ba61d: jne 0x1459ba610
0x1459ba61f: jmp 0x1459ba590
0x1459ba624: lea r11, [r10 + 1]
0x1459ba628: cmp r11, rax
0x1459ba62b: jb 0x1459ba65e
0x1459ba62d: mov qword ptr [rcx + 0x10], r10
0x1459ba631: pop rbx
0x1459ba632: pop rbp
0x1459ba633: pop rdi
0x1459ba634: pop rsi
0x1459ba635: pop r12
0x1459ba637: pop r13
0x1459ba639: pop r14
0x1459ba63b: pop r15
0x1459ba63d: ret
0x1459ba63e: nop
0x1459ba640: lea rdi, [r10 + r10*2]
0x1459ba644: mov ebx, dword ptr [rsi + 8]
0x1459ba647: mov dword ptr [r8 + rdi*4 + 8], ebx
0x1459ba64c: mov rsi, qword ptr [rsi]
0x1459ba64f: mov qword ptr [r8 + rdi*4], rsi
0x1459ba653: inc r10
0x1459ba656: inc r11
0x1459ba659: cmp r11, rax
0x1459ba65c: je 0x1459ba62d
0x1459ba65e: lea rdi, [r11 + r11*2]
0x1459ba662: lea rsi, [r8 + rdi*4]
0x1459ba666: mov edi, dword ptr [r8 + rdi*4]
0x1459ba66a: mov r15, qword ptr [rdx + 8]
0x1459ba66e: mov rbx, qword ptr [rdx + 0x10]
0x1459ba672: mov r12, rbx
0x1459ba675: and r12, r9
0x1459ba678: lea r14, [r15 + r12*4]
0x1459ba67c: and ebx, 0xf
0x1459ba67f: movd xmm0, edi
0x1459ba683: pshufd xmm0, xmm0, 0
0x1459ba688: xor r13d, r13d
0x1459ba68b: nop dword ptr [rax + rax]
0x1459ba690: cmp r12, r13
0x1459ba693: je 0x1459ba6e0
0x1459ba695: movdqu xmm1, xmmword ptr [r15 + r13*4]
0x1459ba69b: movdqu xmm2, xmmword ptr [r15 + r13*4 + 0x10]
0x1459ba6a2: movdqu xmm3, xmmword ptr [r15 + r13*4 + 0x20]
0x1459ba6a9: movdqu xmm4, xmmword ptr [r15 + r13*4 + 0x30]
0x1459ba6b0: pcmpeqd xmm2, xmm0
0x1459ba6b4: pcmpeqd xmm1, xmm0
0x1459ba6b8: packssdw xmm1, xmm2
0x1459ba6bc: pcmpeqd xmm3, xmm0
0x1459ba6c0: pcmpeqd xmm4, xmm0
0x1459ba6c4: packssdw xmm3, xmm4
0x1459ba6c8: packsswb xmm1, xmm3
0x1459ba6cc: pmovmskb ebp, xmm1
0x1459ba6d0: add r13, 0x10
0x1459ba6d4: test ebp, ebp
0x1459ba6d6: je 0x1459ba690
0x1459ba6d8: jmp 0x1459ba640
0x1459ba6dd: nop dword ptr [rax]
0x1459ba6e0: shl ebx, 2
0x1459ba6e3: xor r15d, r15d
0x1459ba6e6: nop word ptr cs:[rax + rax]
0x1459ba6f0: cmp rbx, r15
0x1459ba6f3: je 0x1459ba656
0x1459ba6f9: cmp dword ptr [r14 + r15], edi
0x1459ba6fd: lea r15, [r15 + 4]
0x1459ba701: jne 0x1459ba6f0
0x1459ba703: jmp 0x1459ba640
