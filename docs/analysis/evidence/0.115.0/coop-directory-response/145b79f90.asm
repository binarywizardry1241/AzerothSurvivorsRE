0x145b79f90: push rbp
0x145b79f91: push r15
0x145b79f93: push r14
0x145b79f95: push r13
0x145b79f97: push r12
0x145b79f99: push rsi
0x145b79f9a: push rdi
0x145b79f9b: push rbx
0x145b79f9c: sub rsp, 0x68
0x145b79fa0: lea rbp, [rsp + 0x60]
0x145b79fa5: mov qword ptr [rbp], 0xfffffffffffffffe
0x145b79fad: mov rdi, rdx
0x145b79fb0: mov rsi, rcx
0x145b79fb3: lea rcx, [rbp - 0x20]
0x145b79fb7: call 0x145b7c600
0x145b79fbc: mov rcx, qword ptr [rdi + 8]
0x145b79fc0: mov rdx, qword ptr [rdi + 0x10]
0x145b79fc4: mov rax, rdx
0x145b79fc7: add rax, 8
0x145b79fcb: mov r8, 0xffffffffffffffff
0x145b79fd2: cmovae r8, rax
0x145b79fd6: cmp r8, rcx
0x145b79fd9: jbe 0x145b79feb
0x145b79fdb: mov byte ptr [rdi + 0x18], 0
0x145b79fdf: mov qword ptr [rdi + 0x10], rcx
0x145b79fe3: xor r12d, r12d
0x145b79fe6: mov rax, rcx
0x145b79fe9: jmp 0x145b7a004
0x145b79feb: mov r9, qword ptr [rdi]
0x145b79fee: sub r8, rdx
0x145b79ff1: mov qword ptr [rdi + 0x10], rax
0x145b79ff5: cmp r8, 8
0x145b79ff9: jne 0x145b7a001
0x145b79ffb: mov r12, qword ptr [r9 + rdx]
0x145b79fff: jmp 0x145b7a004
0x145b7a001: xor r12d, r12d
0x145b7a004: mov rdx, rax
0x145b7a007: add rdx, 4
0x145b7a00b: mov r8, 0xffffffffffffffff
0x145b7a012: cmovae r8, rdx
0x145b7a016: cmp r8, rcx
0x145b7a019: jbe 0x145b7a028
0x145b7a01b: mov byte ptr [rdi + 0x18], 0
0x145b7a01f: mov qword ptr [rdi + 0x10], rcx
0x145b7a023: xor r13d, r13d
0x145b7a026: jmp 0x145b7a03f
0x145b7a028: mov rcx, qword ptr [rdi]
0x145b7a02b: sub r8, rax
0x145b7a02e: xor r13d, r13d
0x145b7a031: mov qword ptr [rdi + 0x10], rdx
0x145b7a035: cmp r8, 4
0x145b7a039: jne 0x145b7a03f
0x145b7a03b: mov r13d, dword ptr [rcx + rax]
0x145b7a03f: lea rcx, [rbp - 0x38]
0x145b7a043: mov rdx, rdi
0x145b7a046: call 0x145b7c600
0x145b7a04b: nop
0x145b7a04c: mov rax, qword ptr [rdi + 8]
0x145b7a050: mov rdx, qword ptr [rdi + 0x10]
0x145b7a054: mov rcx, rdx
0x145b7a057: add rcx, 8
0x145b7a05b: mov r8, 0xffffffffffffffff
0x145b7a062: cmovae r8, rcx
0x145b7a066: cmp r8, rax
0x145b7a069: jbe 0x145b7a07b
0x145b7a06b: mov byte ptr [rdi + 0x18], 0
0x145b7a06f: mov qword ptr [rdi + 0x10], rax
0x145b7a073: xor r15d, r15d
0x145b7a076: mov rcx, rax
0x145b7a079: jmp 0x145b7a094
0x145b7a07b: mov r9, qword ptr [rdi]
0x145b7a07e: sub r8, rdx
0x145b7a081: mov qword ptr [rdi + 0x10], rcx
0x145b7a085: cmp r8, 8
0x145b7a089: jne 0x145b7a091
0x145b7a08b: mov r15, qword ptr [r9 + rdx]
0x145b7a08f: jmp 0x145b7a094
0x145b7a091: xor r15d, r15d
0x145b7a094: mov rdx, rcx
0x145b7a097: add rdx, 4
0x145b7a09b: mov r8, 0xffffffffffffffff
0x145b7a0a2: cmovae r8, rdx
0x145b7a0a6: cmp r8, rax
0x145b7a0a9: jbe 0x145b7a0b6
0x145b7a0ab: mov byte ptr [rdi + 0x18], 0
0x145b7a0af: xor ecx, ecx
0x145b7a0b1: mov rdx, rax
0x145b7a0b4: jmp 0x145b7a0ca
0x145b7a0b6: sub r8, rcx
0x145b7a0b9: cmp r8, 4
0x145b7a0bd: jne 0x145b7a0c8
0x145b7a0bf: mov r8, qword ptr [rdi]
0x145b7a0c2: mov ecx, dword ptr [r8 + rcx]
0x145b7a0c6: jmp 0x145b7a0ca
0x145b7a0c8: xor ecx, ecx
0x145b7a0ca: add rcx, rdx
0x145b7a0cd: mov rbx, 0xffffffffffffffff
0x145b7a0d4: cmovae rbx, rcx
0x145b7a0d8: cmp rbx, rax
0x145b7a0db: jbe 0x145b7a0e7
0x145b7a0dd: mov byte ptr [rdi + 0x18], 0
0x145b7a0e1: mov qword ptr [rdi + 0x10], rax
0x145b7a0e5: jmp 0x145b7a0fc
0x145b7a0e7: mov r14, qword ptr [rdi]
0x145b7a0ea: add r14, rdx
0x145b7a0ed: sub rbx, rdx
0x145b7a0f0: mov qword ptr [rdi + 0x10], rcx
0x145b7a0f4: js 0x145b7a17e
0x145b7a0fa: jne 0x145b7a105
0x145b7a0fc: mov edi, 1
0x145b7a101: xor ebx, ebx
0x145b7a103: jmp 0x145b7a136
0x145b7a105: call 0x140002200
0x145b7a10a: mov eax, 1
0x145b7a10f: mov qword ptr [rbp - 8], rax
0x145b7a113: mov edx, 1
0x145b7a118: mov rcx, rbx
0x145b7a11b: call 0x1400021c0
0x145b7a120: test rax, rax
0x145b7a123: je 0x145b7a186
0x145b7a125: mov rdi, rax
0x145b7a128: mov rcx, rax
0x145b7a12b: mov rdx, r14
0x145b7a12e: mov r8, rbx
0x145b7a131: call 0x145d145fb
0x145b7a136: mov rax, qword ptr [rbp - 0x10]
0x145b7a13a: mov qword ptr [rsi + 0x10], rax
0x145b7a13e: movups xmm0, xmmword ptr [rbp - 0x20]
0x145b7a142: movups xmmword ptr [rsi], xmm0
0x145b7a145: mov qword ptr [rsi + 0x48], r12
0x145b7a149: mov dword ptr [rsi + 0x58], r13d
0x145b7a14d: movups xmm0, xmmword ptr [rbp - 0x38]
0x145b7a151: movups xmmword ptr [rsi + 0x18], xmm0
0x145b7a155: mov rax, qword ptr [rbp - 0x28]
0x145b7a159: mov qword ptr [rsi + 0x28], rax
0x145b7a15d: mov qword ptr [rsi + 0x50], r15
0x145b7a161: mov qword ptr [rsi + 0x30], rbx
0x145b7a165: mov qword ptr [rsi + 0x38], rdi
0x145b7a169: mov qword ptr [rsi + 0x40], rbx
0x145b7a16d: add rsp, 0x68
0x145b7a171: pop rbx
0x145b7a172: pop rdi
0x145b7a173: pop rsi
0x145b7a174: pop r12
0x145b7a176: pop r13
0x145b7a178: pop r14
0x145b7a17a: pop r15
0x145b7a17c: pop rbp
0x145b7a17d: ret
0x145b7a17e: mov qword ptr [rbp - 8], 0
0x145b7a186: mov rcx, qword ptr [rbp - 8]
0x145b7a18a: mov rdx, rbx
0x145b7a18d: call 0x145eb6fcb
0x145b7a192: nop
0x145b7a193: ud2
