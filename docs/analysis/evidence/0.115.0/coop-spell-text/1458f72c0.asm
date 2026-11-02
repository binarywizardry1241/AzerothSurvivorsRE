0x1458f72c0: push rbp
0x1458f72c1: push r15
0x1458f72c3: push r14
0x1458f72c5: push r13
0x1458f72c7: push r12
0x1458f72c9: push rsi
0x1458f72ca: push rdi
0x1458f72cb: push rbx
0x1458f72cc: sub rsp, 0x48
0x1458f72d0: lea rbp, [rsp + 0x40]
0x1458f72d5: mov qword ptr [rbp], 0xfffffffffffffffe
0x1458f72dd: mov rdi, rdx
0x1458f72e0: mov rsi, rcx
0x1458f72e3: mov qword ptr [rbp - 0x18], 0
0x1458f72eb: mov qword ptr [rbp - 0x10], 8
0x1458f72f3: mov qword ptr [rbp - 8], 0
0x1458f72fb: mov r13, r8
0x1458f72fe: shl r13, 6
0x1458f7302: lea rbx, [rdx + r13]
0x1458f7306: xor r14d, r14d
0x1458f7309: test r8, r8
0x1458f730c: je 0x1458f7384
0x1458f730e: mov eax, 0x80140000
0x1458f7313: xor ecx, ecx
0x1458f7315: xor r15d, r15d
0x1458f7318: jmp 0x1458f732c
0x1458f731a: nop word ptr [rax + rax]
0x1458f7320: inc r15
0x1458f7323: add rcx, 0x40
0x1458f7327: cmp r13, rcx
0x1458f732a: je 0x1458f735d
0x1458f732c: movzx edx, byte ptr [rdi + rcx]
0x1458f7330: cmp edx, 0x1f
0x1458f7333: ja 0x1458f7320
0x1458f7335: bt eax, edx
0x1458f7338: jae 0x1458f7320
0x1458f733a: lea rcx, [rbp - 0x18]
0x1458f733e: call 0x145d151d0
0x1458f7343: nop
0x1458f7344: mov rax, qword ptr [rbp - 0x10]
0x1458f7348: mov qword ptr [rax], r15
0x1458f734b: mov byte ptr [rax + 8], 0
0x1458f734f: mov qword ptr [rbp - 8], 1
0x1458f7357: mov r14d, 1
0x1458f735d: xor r15d, r15d
0x1458f7360: xor eax, eax
0x1458f7362: xor r12d, r12d
0x1458f7365: nop word ptr cs:[rax + rax]
0x1458f7370: cmp byte ptr [rdi + rax], 0x13
0x1458f7374: je 0x1458f7389
0x1458f7376: inc r12
0x1458f7379: add rax, 0x40
0x1458f737d: cmp r13, rax
0x1458f7380: jne 0x1458f7370
0x1458f7382: jmp 0x1458f73bc
0x1458f7384: xor r15d, r15d
0x1458f7387: jmp 0x1458f73bc
0x1458f7389: mov r13b, 2
0x1458f738c: cmp r14, qword ptr [rbp - 0x18]
0x1458f7390: jne 0x1458f739c
0x1458f7392: lea rcx, [rbp - 0x18]
0x1458f7396: call 0x145d151d0
0x1458f739b: nop
0x1458f739c: xor r15d, r15d
0x1458f739f: jmp 0x1458f73a1
0x1458f73a1: mov rax, qword ptr [rbp - 0x10]
0x1458f73a5: mov rcx, r14
0x1458f73a8: shl rcx, 4
0x1458f73ac: mov qword ptr [rax + rcx], r12
0x1458f73b0: mov byte ptr [rax + rcx + 8], r13b
0x1458f73b5: inc r14
0x1458f73b8: mov qword ptr [rbp - 8], r14
0x1458f73bc: xor eax, eax
0x1458f73be: mov rcx, rdi
0x1458f73c1: nop word ptr cs:[rax + rax]
0x1458f73d0: cmp rcx, rbx
0x1458f73d3: je 0x1458f7400
0x1458f73d5: lea rdi, [rcx + 0x40]
0x1458f73d9: dec rax
0x1458f73dc: cmp byte ptr [rcx], 0xf
0x1458f73df: mov rcx, rdi
0x1458f73e2: jne 0x1458f73d0
0x1458f73e4: sub r15, rax
0x1458f73e7: lea r12, [r15 - 1]
0x1458f73eb: mov r13b, 1
0x1458f73ee: cmp r14, qword ptr [rbp - 0x18]
0x1458f73f2: jne 0x1458f73a1
0x1458f73f4: lea rcx, [rbp - 0x18]
0x1458f73f8: call 0x145d151d0
0x1458f73fd: nop
0x1458f73fe: jmp 0x1458f73a1
0x1458f7400: mov rax, qword ptr [rbp - 8]
0x1458f7404: mov qword ptr [rsi + 0x10], rax
0x1458f7408: movups xmm0, xmmword ptr [rbp - 0x18]
0x1458f740c: movups xmmword ptr [rsi], xmm0
0x1458f740f: add rsp, 0x48
0x1458f7413: pop rbx
0x1458f7414: pop rdi
0x1458f7415: pop rsi
0x1458f7416: pop r12
0x1458f7418: pop r13
0x1458f741a: pop r14
0x1458f741c: pop r15
0x1458f741e: pop rbp
0x1458f741f: ret
