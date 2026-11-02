0x1458fc5c0: push rbp
0x1458fc5c1: push r15
0x1458fc5c3: push r14
0x1458fc5c5: push r13
0x1458fc5c7: push r12
0x1458fc5c9: push rsi
0x1458fc5ca: push rdi
0x1458fc5cb: push rbx
0x1458fc5cc: sub rsp, 0xb8
0x1458fc5d3: lea rbp, [rsp + 0x80]
0x1458fc5db: mov qword ptr [rbp + 0x30], 0xfffffffffffffffe
0x1458fc5e3: lea rbx, [rbp - 0x58]
0x1458fc5e7: xor r14d, r14d
0x1458fc5ea: lea rsi, [rip + 0x162a72f]
0x1458fc5f1: lea r12, [rbp - 0x60]
0x1458fc5f5: cmp r14, 0x78
0x1458fc5f9: je 0x1458fc7cf
0x1458fc5ff: movups xmm0, xmmword ptr [r14 + rsi]
0x1458fc604: movups xmmword ptr [rbp - 0x20], xmm0
0x1458fc608: mov rdi, qword ptr [r14 + rsi + 0x10]
0x1458fc60d: mov r13, qword ptr [r14 + rsi + 0x18]
0x1458fc612: cmp byte ptr [r14 + rsi + 0x20], 0
0x1458fc618: je 0x1458fc6f0
0x1458fc61e: mov rcx, r12
0x1458fc621: mov rdx, rdi
0x1458fc624: mov r8, r13
0x1458fc627: call 0x1458f8cd0
0x1458fc62c: cmp byte ptr [rbp - 0x60], 0
0x1458fc630: je 0x1458fc740
0x1458fc636: mov rax, qword ptr [rbx + 0x10]
0x1458fc63a: mov qword ptr [rbp], rax
0x1458fc63e: movups xmm0, xmmword ptr [rbx]
0x1458fc641: movaps xmmword ptr [rbp - 0x10], xmm0
0x1458fc645: lea rax, [rbp - 0x20]
0x1458fc649: mov qword ptr [rbp - 0x40], rax
0x1458fc64d: lea rax, [rip - 0x58fa594]
0x1458fc654: mov qword ptr [rbp - 0x38], rax
0x1458fc658: lea rax, [rbp - 0x10]
0x1458fc65c: mov qword ptr [rbp - 0x30], rax
0x1458fc660: lea rax, [rip - 0x58fa587]
0x1458fc667: mov qword ptr [rbp - 0x28], rax
0x1458fc66b: lea rcx, [rip + 0x15d6a46]
0x1458fc672: lea rdx, [rbp - 0x40]
0x1458fc676: call 0x145bb6590
0x1458fc67b: nop
0x1458fc67c: test r13, r13
0x1458fc67f: js 0x1458fc7ef
0x1458fc685: je 0x1458fc771
0x1458fc68b: mov r12, rbx
0x1458fc68e: call 0x140002200
0x1458fc693: mov ebx, 1
0x1458fc698: mov edx, 1
0x1458fc69d: mov rcx, r13
0x1458fc6a0: call 0x1400021c0
0x1458fc6a5: test rax, rax
0x1458fc6a8: je 0x1458fc812
0x1458fc6ae: mov qword ptr [rbp + 0x10], r13
0x1458fc6b2: mov qword ptr [rbp + 0x18], rax
0x1458fc6b6: mov qword ptr [rbp + 8], rax
0x1458fc6ba: mov rcx, rax
0x1458fc6bd: mov rdx, rdi
0x1458fc6c0: mov r8, r13
0x1458fc6c3: call 0x145bfa0e7
0x1458fc6c8: mov rbx, r12
0x1458fc6cb: lea r12, [rbp - 0x60]
0x1458fc6cf: mov qword ptr [rbp + 0x20], r13
0x1458fc6d3: mov rdx, qword ptr [rbp - 0x10]
0x1458fc6d7: test rdx, rdx
0x1458fc6da: jne 0x1458fc797
0x1458fc6e0: jmp 0x1458fc7b0
0x1458fc6e5: nop word ptr cs:[rax + rax]
0x1458fc6f0: test r13, r13
0x1458fc6f3: js 0x1458fc7e3
0x1458fc6f9: je 0x1458fc751
0x1458fc6fb: call 0x140002200
0x1458fc700: mov edx, 1
0x1458fc705: mov rcx, r13
0x1458fc708: call 0x1400021c0
0x1458fc70d: test rax, rax
0x1458fc710: je 0x1458fc800
0x1458fc716: mov r15, rax
0x1458fc719: mov qword ptr [rbp + 0x10], r13
0x1458fc71d: mov qword ptr [rbp + 0x18], rax
0x1458fc721: mov rcx, rax
0x1458fc724: mov rdx, rdi
0x1458fc727: mov r8, r13
0x1458fc72a: call 0x145bfa0e7
0x1458fc72f: mov qword ptr [rbp + 0x20], r13
0x1458fc733: jmp 0x1458fc7b0
0x1458fc735: nop word ptr cs:[rax + rax]
0x1458fc740: mov rax, qword ptr [rbx + 0x10]
0x1458fc744: mov qword ptr [rbp + 0x20], rax
0x1458fc748: movups xmm0, xmmword ptr [rbx]
0x1458fc74b: movaps xmmword ptr [rbp + 0x10], xmm0
0x1458fc74f: jmp 0x1458fc7b0
0x1458fc751: mov qword ptr [rbp + 0x10], 0
0x1458fc759: mov qword ptr [rbp + 0x18], 1
0x1458fc761: mov qword ptr [rbp + 0x20], 0
0x1458fc769: mov r15d, 1
0x1458fc76f: jmp 0x1458fc7b0
0x1458fc771: mov qword ptr [rbp + 0x10], 0
0x1458fc779: mov qword ptr [rbp + 0x18], 1
0x1458fc781: mov eax, 1
0x1458fc786: mov qword ptr [rbp + 8], rax
0x1458fc78a: mov qword ptr [rbp + 0x20], r13
0x1458fc78e: mov rdx, qword ptr [rbp - 0x10]
0x1458fc792: test rdx, rdx
0x1458fc795: je 0x1458fc7b0
0x1458fc797: mov rcx, qword ptr [rbp - 8]
0x1458fc79b: mov r8d, 1
0x1458fc7a1: call 0x1400021d0
0x1458fc7a6: nop word ptr cs:[rax + rax]
0x1458fc7b0: add r14, 0x28
0x1458fc7b4: mov rcx, qword ptr [rbp - 0x20]
0x1458fc7b8: mov rdx, qword ptr [rbp - 0x18]
0x1458fc7bc: lea r8, [rbp + 0x10]
0x1458fc7c0: call 0x145acb540
0x1458fc7c5: cmp r14, 0x78
0x1458fc7c9: jne 0x1458fc5ff
0x1458fc7cf: add rsp, 0xb8
0x1458fc7d6: pop rbx
0x1458fc7d7: pop rdi
0x1458fc7d8: pop rsi
0x1458fc7d9: pop r12
0x1458fc7db: pop r13
0x1458fc7dd: pop r14
0x1458fc7df: pop r15
0x1458fc7e1: pop rbp
0x1458fc7e2: ret
0x1458fc7e3: xor ecx, ecx
0x1458fc7e5: mov rdx, r15
0x1458fc7e8: call 0x145d992bb
0x1458fc7ed: ud2
0x1458fc7ef: xor ebx, ebx
0x1458fc7f1: mov rcx, rbx
0x1458fc7f4: mov rdx, qword ptr [rbp + 8]
0x1458fc7f8: call 0x145d992bb
0x1458fc7fd: nop
0x1458fc7fe: ud2
0x1458fc800: mov r15, r13
0x1458fc803: mov ecx, 1
0x1458fc808: mov rdx, r15
0x1458fc80b: call 0x145d992bb
0x1458fc810: ud2
0x1458fc812: mov qword ptr [rbp + 8], r13
0x1458fc816: jmp 0x1458fc7f1
