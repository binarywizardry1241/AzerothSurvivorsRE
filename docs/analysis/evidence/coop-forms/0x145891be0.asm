0x145891be0: push rbp
0x145891be1: push r15
0x145891be3: push r14
0x145891be5: push r12
0x145891be7: push rsi
0x145891be8: push rdi
0x145891be9: push rbx
0x145891bea: sub rsp, 0x40
0x145891bee: lea rbp, [rsp + 0x40]
0x145891bf3: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145891bfb: mov qword ptr [rbp - 0x18], rdx
0x145891bff: cmp dword ptr [rcx + 0x10], 2
0x145891c03: jne 0x145891c2c
0x145891c05: cmp dword ptr [rcx + 0xc58], 2
0x145891c0c: jne 0x145891c2c
0x145891c0e: mov rsi, qword ptr [rbp + 0x60]
0x145891c12: test rsi, rsi
0x145891c15: jns 0x145891c6a
0x145891c17: xor r14d, r14d
0x145891c1a: mov qword ptr [rbp - 0x10], r8
0x145891c1e: mov rcx, r14
0x145891c21: mov rdx, rsi
0x145891c24: call 0x145eb6fcb
0x145891c29: nop
0x145891c2a: ud2
0x145891c2c: mov qword ptr [rbp - 0x10], r8
0x145891c30: mov rax, qword ptr [r8]
0x145891c33: test rax, rax
0x145891c36: je 0x145891c3f
0x145891c38: mov rcx, qword ptr [rbp - 0x18]
0x145891c3c: call rax
0x145891c3e: nop
0x145891c3f: mov rax, qword ptr [rbp - 0x10]
0x145891c43: mov rdx, qword ptr [rax + 8]
0x145891c47: test rdx, rdx
0x145891c4a: je 0x145891c59
0x145891c4c: mov r8, qword ptr [rax + 0x10]
0x145891c50: mov rcx, qword ptr [rbp - 0x18]
0x145891c54: call 0x1400021d0
0x145891c59: xor eax, eax
0x145891c5b: add rsp, 0x40
0x145891c5f: pop rbx
0x145891c60: pop rdi
0x145891c61: pop rsi
0x145891c62: pop r12
0x145891c64: pop r14
0x145891c66: pop r15
0x145891c68: pop rbp
0x145891c69: ret
0x145891c6a: je 0x145891cae
0x145891c6c: mov rbx, r9
0x145891c6f: mov r15, rcx
0x145891c72: mov r12, r8
0x145891c75: call 0x140002200
0x145891c7a: mov r14d, 1
0x145891c80: mov edx, 1
0x145891c85: mov rcx, rsi
0x145891c88: call 0x1400021c0
0x145891c8d: mov r8, r12
0x145891c90: test rax, rax
0x145891c93: je 0x145891c1a
0x145891c95: mov rdi, rax
0x145891c98: mov rcx, rax
0x145891c9b: mov rdx, rbx
0x145891c9e: mov r8, rsi
0x145891ca1: call 0x145d145fb
0x145891ca6: mov r8, r12
0x145891ca9: mov rcx, r15
0x145891cac: jmp 0x145891cb3
0x145891cae: mov edi, 1
0x145891cb3: mov qword ptr [rcx + 0xc58], 3
0x145891cbe: mov qword ptr [rcx + 0xc60], 0
0x145891cc9: mov qword ptr [rcx + 0xc70], rsi
0x145891cd0: mov qword ptr [rcx + 0xc78], rdi
0x145891cd7: mov qword ptr [rcx + 0xc80], rsi
0x145891cde: mov qword ptr [rcx + 0xc88], 0
0x145891ce9: mov qword ptr [rcx + 0xc90], 8
0x145891cf4: xorps xmm0, xmm0
0x145891cf7: movups xmmword ptr [rcx + 0xc98], xmm0
0x145891cfe: mov qword ptr [rcx + 0xca8], 8
0x145891d09: mov qword ptr [rcx + 0xcb0], 0
0x145891d14: mov rax, qword ptr [rbp - 0x18]
0x145891d18: mov qword ptr [rcx + 0xcb8], rax
0x145891d1f: mov qword ptr [rcx + 0xcc0], r8
0x145891d26: movups xmmword ptr [rcx + 0xcc8], xmm0
0x145891d2d: mov byte ptr [rcx + 0xcd8], 1
0x145891d34: mov qword ptr [rsp + 0x20], 0
0x145891d3d: lea rdx, [rip + 0x179b03c]
0x145891d44: mov r8d, 7
0x145891d4a: mov r9d, 1
0x145891d50: call 0x145893140
0x145891d55: mov al, 1
0x145891d57: jmp 0x145891c5b
