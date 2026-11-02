0x1458649b7: mov r13d, dword ptr [r12 + 0x40]
0x1458649bc: mov qword ptr [rbp + 0x1d0], r12
0x1458649c3: lea rax, [rip - 0x586290a]
0x1458649ca: mov qword ptr [rbp + 0x1d8], rax
0x1458649d1: mov byte ptr [rbp + 0x327], 1
0x1458649d8: lea rdx, [rip + 0x14504a1]
0x1458649df: lea rcx, [rbp + 0xe0]
0x1458649e6: lea r8, [rbp + 0x1d0]
0x1458649ed: call 0x145ce7350
0x1458649f2: nop
0x1458649f3: mov rcx, qword ptr [rbp + 0xe8]
0x1458649fa: mov rdx, qword ptr [rbp + 0xf0]
0x145864a01: mov rsi, qword ptr [r12 + 0x10]
0x145864a06: mov rbx, qword ptr [r12 + 0x18]
0x145864a0b: mov qword ptr [rbp + 0x310], rcx
0x145864a12: call 0x1458dff90
0x145864a17: nop
0x145864a18: mov rdi, rax
0x145864a1b: mov r14, rdx
0x145864a1e: mov rdx, qword ptr [rbp + 0xe0]
0x145864a25: test rdx, rdx
0x145864a28: je 0x145864a3c
0x145864a2a: mov r8d, 1
0x145864a30: mov rcx, qword ptr [rbp + 0x310]
0x145864a37: call 0x1400021d0
0x145864a3c: test rdi, rdi
0x145864a3f: cmovne rsi, rdi
0x145864a43: cmove r14, rbx
0x145864a47: test r14, r14
0x145864a4a: jns 0x145864a66
0x145864a4c: xor edi, edi
0x145864a4e: mov byte ptr [rbp + 0x327], 1
0x145864a55: mov rcx, rdi
0x145864a58: mov rdx, r14
0x145864a5b: call 0x145eb6fcb
0x145864a60: nop
0x145864a61: jmp 0x14586664c
0x145864a66: mov qword ptr [rbp + 0x310], r14
0x145864a6d: je 0x145864ab1
0x145864a6f: call 0x140002200
0x145864a74: mov edi, 1
0x145864a79: mov edx, 1
0x145864a7e: mov rcx, r14
0x145864a81: call 0x1400021c0
0x145864a86: test rax, rax
0x145864a89: je 0x145864a4e
0x145864a8b: mov qword ptr [rbp + 8], rax
0x145864a8f: mov rcx, rax
0x145864a92: mov rdx, rsi
0x145864a95: mov r8, r14
0x145864a98: call 0x145d145fb
0x145864a9d: movzx eax, r15b
0x145864aa1: lea rcx, [rip + 0x17c79c4]
0x145864aa8: movsxd rax, dword ptr [rcx + rax*4]
0x145864aac: add rax, rcx
0x145864aaf: jmp rax
0x145864ab1: mov eax, 1
0x145864ab6: mov qword ptr [rbp + 8], rax
0x145864aba: movzx eax, r15b
0x145864abe: lea rcx, [rip + 0x17c79a7]
0x145864ac5: movsxd rax, dword ptr [rcx + rax*4]
0x145864ac9: add rax, rcx
0x145864acc: jmp rax
0x145864ace: mov byte ptr [rbp + 0x323], 1
0x145864ad5: lea rsi, [rip + 0x17c69d1]
0x145864adc: mov edi, 8
0x145864ae1: mov edx, 8
0x145864ae6: mov rcx, rsi
0x145864ae9: call 0x1458dff90
0x145864aee: nop
0x145864aef: mov r8, rdx
0x145864af2: test rax, rax
0x145864af5: cmovne rsi, rax
0x145864af9: cmove r8, rdi
0x145864afd: mov rax, qword ptr [rbp + 0x2f0]
0x145864b04: lea rax, [rax + 8]
0x145864b08: lea rcx, [rip + 0x17a8081]
0x145864b0f: mov qword ptr [rbp + 0xe0], rcx
0x145864b16: mov qword ptr [rbp + 0xe8], 1
0x145864b21: mov qword ptr [rbp + 0xf0], rax
0x145864b28: lea rax, [rip + 0x17a80e9]
0x145864b2f: mov qword ptr [rbp + 0xf8], rax
0x145864b36: mov byte ptr [rbp + 0x323], 1
0x145864b3d: mov qword ptr [rsp + 0x20], 1
0x145864b46: lea rcx, [rbp + 0x1d0]
0x145864b4d: lea r9, [rbp + 0xe0]
0x145864b54: mov rdx, rsi
0x145864b57: call 0x1458e0370
0x145864b5c: nop
0x145864b5d: mov rax, qword ptr [rbp + 0x1d0]
0x145864b64: mov qword ptr [rbp + 0xd0], rax
0x145864b6b: mov rax, qword ptr [rbp + 0x1d8]
0x145864b72: mov qword ptr [rbp + 0xd8], rax
0x145864b79: mov r14, qword ptr [rbp + 0x1e0]
0x145864b80: movzx eax, byte ptr [r12 + 0x75]
0x145864b86: add eax, -2
0x145864b89: cmp eax, 9
0x145864b8c: jbe 0x145864d29
0x145864b92: jmp 0x14586515f
