0x145ec09c0: push rbp
0x145ec09c1: push r15
0x145ec09c3: push r14
0x145ec09c5: push r13
0x145ec09c7: push r12
0x145ec09c9: push rsi
0x145ec09ca: push rdi
0x145ec09cb: push rbx
0x145ec09cc: sub rsp, 0x78
0x145ec09d0: lea rbp, [rsp + 0x70]
0x145ec09d5: mov qword ptr [rbp], 0xfffffffffffffffe
0x145ec09dd: mov rbx, rdx
0x145ec09e0: mov qword ptr [rbp - 0x20], rcx
0x145ec09e4: call 0x140002200
0x145ec09e9: mov edi, 0x16
0x145ec09ee: mov ecx, 0x16
0x145ec09f3: mov edx, 1
0x145ec09f8: call 0x1400021c0
0x145ec09fd: test rax, rax
0x145ec0a00: je 0x145ec0b78
0x145ec0a06: mov qword ptr [rbp - 0x18], 0x16
0x145ec0a0e: mov qword ptr [rbp - 0x10], rax
0x145ec0a12: movups xmm0, xmmword ptr [rip + 0x18d295f]
0x145ec0a19: movups xmmword ptr [rax], xmm0
0x145ec0a1c: movabs rcx, 0x3176206863756f
0x145ec0a26: mov qword ptr [rax + 0xe], rcx
0x145ec0a2a: mov qword ptr [rbp - 8], 0x16
0x145ec0a32: lea rax, [rbx + 0x18]
0x145ec0a36: lea rcx, [rbx + 0x30]
0x145ec0a3a: mov qword ptr [rbp - 0x40], 3
0x145ec0a42: mov qword ptr [rbp - 0x38], rbx
0x145ec0a46: mov qword ptr [rbp - 0x30], rax
0x145ec0a4a: mov qword ptr [rbp - 0x28], rcx
0x145ec0a4e: xor eax, eax
0x145ec0a50: lea r14, [rbp - 0x18]
0x145ec0a54: jmp 0x145ec0a72
0x145ec0a56: nop word ptr cs:[rax + rax]
0x145ec0a60: mov rax, qword ptr [rbp - 0x10]
0x145ec0a64: mov byte ptr [rax + rdi], 0
0x145ec0a68: inc rdi
0x145ec0a6b: mov qword ptr [rbp - 8], rdi
0x145ec0a6f: mov rax, r15
0x145ec0a72: cmp rax, 3
0x145ec0a76: je 0x145ec0ae4
0x145ec0a78: lea r15, [rax + 1]
0x145ec0a7c: mov qword ptr [rbp - 0x48], r15
0x145ec0a80: mov rax, qword ptr [rbp + rax*8 - 0x38]
0x145ec0a85: mov r12, qword ptr [rax + 8]
0x145ec0a89: mov r13, qword ptr [rax + 0x10]
0x145ec0a8d: add r13, r12
0x145ec0a90: cmp r12, r13
0x145ec0a93: je 0x145ec0ad0
0x145ec0a95: movzx esi, byte ptr [r12]
0x145ec0a9a: inc r12
0x145ec0a9d: test sil, sil
0x145ec0aa0: je 0x145ec0a90
0x145ec0aa2: cmp rdi, qword ptr [rbp - 0x18]
0x145ec0aa6: jne 0x145ec0aba
0x145ec0aa8: mov r8d, 1
0x145ec0aae: mov rcx, r14
0x145ec0ab1: mov rdx, rdi
0x145ec0ab4: call 0x1461f0080
0x145ec0ab9: nop 
0x145ec0aba: mov rax, qword ptr [rbp - 0x10]
0x145ec0abe: mov byte ptr [rax + rdi], sil
0x145ec0ac2: inc rdi
0x145ec0ac5: mov qword ptr [rbp - 8], rdi
0x145ec0ac9: jmp 0x145ec0a90
0x145ec0acb: nop dword ptr [rax + rax]
0x145ec0ad0: cmp rdi, qword ptr [rbp - 0x18]
0x145ec0ad4: jne 0x145ec0a60
0x145ec0ad6: mov rcx, r14
0x145ec0ad9: call 0x146208860
0x145ec0ade: nop 
0x145ec0adf: jmp 0x145ec0a60
0x145ec0ae4: mov r14, qword ptr [rbx + 0x60]
0x145ec0ae8: mov rax, qword ptr [rbp - 0x18]
0x145ec0aec: sub rax, rdi
0x145ec0aef: cmp rax, 7
0x145ec0af3: jbe 0x145ec0b46
0x145ec0af5: mov rax, qword ptr [rbp - 0x10]
0x145ec0af9: mov qword ptr [rax + rdi], r14
0x145ec0afd: add rdi, 8
0x145ec0b01: mov qword ptr [rbp - 8], rdi
0x145ec0b05: mov rbx, qword ptr [rbx + 0x68]
0x145ec0b09: mov rax, qword ptr [rbp - 0x18]
0x145ec0b0d: sub rax, rdi
0x145ec0b10: cmp rax, 7
0x145ec0b14: jbe 0x145ec0b5f
0x145ec0b16: mov rax, qword ptr [rbp - 0x10]
0x145ec0b1a: mov qword ptr [rax + rdi], rbx
0x145ec0b1e: add rdi, 8
0x145ec0b22: mov qword ptr [rbp - 8], rdi
0x145ec0b26: mov rax, qword ptr [rbp - 0x20]
0x145ec0b2a: mov qword ptr [rax + 0x10], rdi
0x145ec0b2e: movups xmm0, xmmword ptr [rbp - 0x18]
0x145ec0b32: movups xmmword ptr [rax], xmm0
0x145ec0b35: add rsp, 0x78
0x145ec0b39: pop rbx
0x145ec0b3a: pop rdi
0x145ec0b3b: pop rsi
0x145ec0b3c: pop r12
0x145ec0b3e: pop r13
0x145ec0b40: pop r14
0x145ec0b42: pop r15
0x145ec0b44: pop rbp
0x145ec0b45: ret 
0x145ec0b46: lea rcx, [rbp - 0x18]
0x145ec0b4a: mov r8d, 8
0x145ec0b50: mov rdx, rdi
0x145ec0b53: call 0x1461f0080
0x145ec0b58: nop 
0x145ec0b59: mov rdi, qword ptr [rbp - 8]
0x145ec0b5d: jmp 0x145ec0af5
0x145ec0b5f: lea rcx, [rbp - 0x18]
0x145ec0b63: mov r8d, 8
0x145ec0b69: mov rdx, rdi
0x145ec0b6c: call 0x1461f0080
0x145ec0b71: nop 
0x145ec0b72: mov rdi, qword ptr [rbp - 8]
0x145ec0b76: jmp 0x145ec0b16
0x145ec0b78: mov ecx, 1
0x145ec0b7d: mov edx, 0x16
0x145ec0b82: call 0x14620896b
0x145ec0b87: ud2 
