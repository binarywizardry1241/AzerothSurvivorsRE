0x145b7bf90: push rbp
0x145b7bf91: push r15
0x145b7bf93: push r14
0x145b7bf95: push r13
0x145b7bf97: push r12
0x145b7bf99: push rsi
0x145b7bf9a: push rdi
0x145b7bf9b: push rbx
0x145b7bf9c: sub rsp, 0x78
0x145b7bfa0: lea rbp, [rsp + 0x70]
0x145b7bfa5: mov qword ptr [rbp], 0xfffffffffffffffe
0x145b7bfad: mov rdi, rdx
0x145b7bfb0: mov rsi, rcx
0x145b7bfb3: lea rcx, [rbp - 0x18]
0x145b7bfb7: call 0x145b7c600
0x145b7bfbc: mov rdx, qword ptr [rdi + 8]
0x145b7bfc0: mov rax, qword ptr [rdi + 0x10]
0x145b7bfc4: mov rcx, rax
0x145b7bfc7: add rcx, 8
0x145b7bfcb: mov r8, 0xffffffffffffffff
0x145b7bfd2: cmovae r8, rcx
0x145b7bfd6: cmp r8, rdx
0x145b7bfd9: jbe 0x145b7bfe5
0x145b7bfdb: mov byte ptr [rdi + 0x18], 0
0x145b7bfdf: mov qword ptr [rdi + 0x10], rdx
0x145b7bfe3: jmp 0x145b7bffb
0x145b7bfe5: mov rdx, qword ptr [rdi]
0x145b7bfe8: sub r8, rax
0x145b7bfeb: mov qword ptr [rdi + 0x10], rcx
0x145b7bfef: cmp r8, 8
0x145b7bff3: jne 0x145b7bffb
0x145b7bff5: mov r12, qword ptr [rdx + rax]
0x145b7bff9: jmp 0x145b7bffe
0x145b7bffb: xor r12d, r12d
0x145b7bffe: lea rcx, [rbp - 0x30]
0x145b7c002: mov rdx, rdi
0x145b7c005: call 0x145b7c600
0x145b7c00a: nop
0x145b7c00b: lea rcx, [rbp - 0x48]
0x145b7c00f: mov rdx, rdi
0x145b7c012: call 0x145b7c600
0x145b7c017: nop
0x145b7c018: mov rax, qword ptr [rdi + 8]
0x145b7c01c: mov rdx, qword ptr [rdi + 0x10]
0x145b7c020: mov rcx, rdx
0x145b7c023: add rcx, 8
0x145b7c027: mov r8, 0xffffffffffffffff
0x145b7c02e: cmovae r8, rcx
0x145b7c032: cmp r8, rax
0x145b7c035: jbe 0x145b7c047
0x145b7c037: mov byte ptr [rdi + 0x18], 0
0x145b7c03b: mov qword ptr [rdi + 0x10], rax
0x145b7c03f: xor r13d, r13d
0x145b7c042: mov rcx, rax
0x145b7c045: jmp 0x145b7c060
0x145b7c047: mov r9, qword ptr [rdi]
0x145b7c04a: sub r8, rdx
0x145b7c04d: mov qword ptr [rdi + 0x10], rcx
0x145b7c051: cmp r8, 8
0x145b7c055: jne 0x145b7c05d
0x145b7c057: mov r13, qword ptr [r9 + rdx]
0x145b7c05b: jmp 0x145b7c060
0x145b7c05d: xor r13d, r13d
0x145b7c060: mov rdx, rcx
0x145b7c063: add rdx, 4
0x145b7c067: mov r8, 0xffffffffffffffff
0x145b7c06e: cmovae r8, rdx
0x145b7c072: cmp r8, rax
0x145b7c075: jbe 0x145b7c082
0x145b7c077: mov byte ptr [rdi + 0x18], 0
0x145b7c07b: xor ecx, ecx
0x145b7c07d: mov rdx, rax
0x145b7c080: jmp 0x145b7c096
0x145b7c082: sub r8, rcx
0x145b7c085: cmp r8, 4
0x145b7c089: jne 0x145b7c094
0x145b7c08b: mov r8, qword ptr [rdi]
0x145b7c08e: mov ecx, dword ptr [r8 + rcx]
0x145b7c092: jmp 0x145b7c096
0x145b7c094: xor ecx, ecx
0x145b7c096: add rcx, rdx
0x145b7c099: mov rbx, 0xffffffffffffffff
0x145b7c0a0: cmovae rbx, rcx
0x145b7c0a4: cmp rbx, rax
0x145b7c0a7: jbe 0x145b7c0b3
0x145b7c0a9: mov byte ptr [rdi + 0x18], 0
0x145b7c0ad: mov qword ptr [rdi + 0x10], rax
0x145b7c0b1: jmp 0x145b7c0c8
0x145b7c0b3: mov r14, qword ptr [rdi]
0x145b7c0b6: add r14, rdx
0x145b7c0b9: sub rbx, rdx
0x145b7c0bc: mov qword ptr [rdi + 0x10], rcx
0x145b7c0c0: js 0x145b7c156
0x145b7c0c6: jne 0x145b7c0d1
0x145b7c0c8: mov edi, 1
0x145b7c0cd: xor ebx, ebx
0x145b7c0cf: jmp 0x145b7c0ff
0x145b7c0d1: call 0x140002200
0x145b7c0d6: mov r15d, 1
0x145b7c0dc: mov edx, 1
0x145b7c0e1: mov rcx, rbx
0x145b7c0e4: call 0x1400021c0
0x145b7c0e9: test rax, rax
0x145b7c0ec: je 0x145b7c159
0x145b7c0ee: mov rdi, rax
0x145b7c0f1: mov rcx, rax
0x145b7c0f4: mov rdx, r14
0x145b7c0f7: mov r8, rbx
0x145b7c0fa: call 0x145d145fb
0x145b7c0ff: mov rax, qword ptr [rbp - 8]
0x145b7c103: mov qword ptr [rsi + 0x10], rax
0x145b7c107: movups xmm0, xmmword ptr [rbp - 0x18]
0x145b7c10b: movups xmmword ptr [rsi], xmm0
0x145b7c10e: mov qword ptr [rsi + 0x60], r12
0x145b7c112: movups xmm0, xmmword ptr [rbp - 0x30]
0x145b7c116: movups xmmword ptr [rsi + 0x18], xmm0
0x145b7c11a: mov rax, qword ptr [rbp - 0x20]
0x145b7c11e: mov qword ptr [rsi + 0x28], rax
0x145b7c122: movups xmm0, xmmword ptr [rbp - 0x48]
0x145b7c126: movups xmmword ptr [rsi + 0x30], xmm0
0x145b7c12a: mov rax, qword ptr [rbp - 0x38]
0x145b7c12e: mov qword ptr [rsi + 0x40], rax
0x145b7c132: mov qword ptr [rsi + 0x68], r13
0x145b7c136: mov qword ptr [rsi + 0x48], rbx
0x145b7c13a: mov qword ptr [rsi + 0x50], rdi
0x145b7c13e: mov qword ptr [rsi + 0x58], rbx
0x145b7c142: mov rax, rsi
0x145b7c145: add rsp, 0x78
0x145b7c149: pop rbx
0x145b7c14a: pop rdi
0x145b7c14b: pop rsi
0x145b7c14c: pop r12
0x145b7c14e: pop r13
0x145b7c150: pop r14
0x145b7c152: pop r15
0x145b7c154: pop rbp
0x145b7c155: ret
0x145b7c156: xor r15d, r15d
0x145b7c159: mov rcx, r15
0x145b7c15c: mov rdx, rbx
0x145b7c15f: call 0x145eb6fcb
0x145b7c164: nop
0x145b7c165: ud2
