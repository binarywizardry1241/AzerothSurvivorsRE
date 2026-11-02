0x14006c3c0: push rbp
0x14006c3c1: push r15
0x14006c3c3: push r14
0x14006c3c5: push r13
0x14006c3c7: push r12
0x14006c3c9: push rsi
0x14006c3ca: push rdi
0x14006c3cb: push rbx
0x14006c3cc: sub rsp, 0x58
0x14006c3d0: lea rbp, [rsp + 0x50]
0x14006c3d5: mov qword ptr [rbp], 0xfffffffffffffffe
0x14006c3dd: mov rax, rdx
0x14006c3e0: shr rax, 1
0x14006c3e3: mov r9, rdx
0x14006c3e6: sub r9, rax
0x14006c3e9: cmp rdx, 0x8235
0x14006c3f0: mov eax, 0x8235
0x14006c3f5: cmovb rax, rdx
0x14006c3f9: cmp rax, r9
0x14006c3fc: cmovbe rax, r9
0x14006c400: cmp rax, 0x31
0x14006c404: mov esi, 0x30
0x14006c409: cmovae rsi, rax
0x14006c40d: imul rbx, rsi, 0xf0
0x14006c414: movabs rax, 0x88888888888888
0x14006c41e: cmp r9, rax
0x14006c421: jbe 0x14006c438
0x14006c423: xor r14d, r14d
0x14006c426: mov byte ptr [rbp - 1], 0
0x14006c42a: mov rcx, r14
0x14006c42d: mov rdx, rbx
0x14006c430: call 0x145eb6fcb
0x14006c435: nop
0x14006c436: ud2
0x14006c438: test rbx, rbx
0x14006c43b: je 0x14006c471
0x14006c43d: mov r15, rcx
0x14006c440: mov r12, r8
0x14006c443: mov r13, rdx
0x14006c446: call 0x140002200
0x14006c44b: mov r14d, 8
0x14006c451: mov edx, 8
0x14006c456: mov rcx, rbx
0x14006c459: call 0x1400021c0
0x14006c45e: test rax, rax
0x14006c461: je 0x14006c426
0x14006c463: mov rdi, rax
0x14006c466: mov rdx, r13
0x14006c469: mov r8, r12
0x14006c46c: mov rcx, r15
0x14006c46f: jmp 0x14006c478
0x14006c471: mov edi, 8
0x14006c476: xor esi, esi
0x14006c478: mov qword ptr [rbp - 0x20], rsi
0x14006c47c: mov qword ptr [rbp - 0x18], rdi
0x14006c480: mov qword ptr [rbp - 0x10], 0
0x14006c488: mov byte ptr [rbp - 1], 1
0x14006c48c: cmp rdx, 0x41
0x14006c490: mov qword ptr [rsp + 0x28], r8
0x14006c495: setb byte ptr [rsp + 0x20]
0x14006c49a: mov r8, rdi
0x14006c49d: mov r9, rsi
0x14006c4a0: call 0x1400f8f00
0x14006c4a5: nop
0x14006c4a6: imul rdx, rsi, 0xf0
0x14006c4ad: mov r8d, 8
0x14006c4b3: mov rcx, rdi
0x14006c4b6: add rsp, 0x58
0x14006c4ba: pop rbx
0x14006c4bb: pop rdi
0x14006c4bc: pop rsi
0x14006c4bd: pop r12
0x14006c4bf: pop r13
0x14006c4c1: pop r14
0x14006c4c3: pop r15
0x14006c4c5: pop rbp
0x14006c4c6: jmp 0x1400021d0
