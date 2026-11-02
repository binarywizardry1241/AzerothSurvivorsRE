0x14586c6d0: push rbp
0x14586c6d1: push r15
0x14586c6d3: push r14
0x14586c6d5: push r13
0x14586c6d7: push r12
0x14586c6d9: push rsi
0x14586c6da: push rdi
0x14586c6db: push rbx
0x14586c6dc: sub rsp, 0x158
0x14586c6e3: lea rbp, [rsp + 0x80]
0x14586c6eb: mov qword ptr [rbp + 0xd0], 0xfffffffffffffffe
0x14586c6f6: mov r14, rdx
0x14586c6f9: imul r13, r8, 0xb0
0x14586c700: mov qword ptr [rbp + 0x80], r8
0x14586c707: test r8, r8
0x14586c70a: mov qword ptr [rbp + 0x58], rcx
0x14586c70e: je 0x14586c730
0x14586c710: call 0x140002200
0x14586c715: mov edx, 8
0x14586c71a: mov rcx, r13
0x14586c71d: call 0x1400021c0
0x14586c722: test rax, rax
0x14586c725: je 0x14586cb9c
0x14586c72b: mov r15, rax
0x14586c72e: jmp 0x14586c736
0x14586c730: mov r15d, 8
0x14586c736: mov rsi, qword ptr [rbp + 0x80]
0x14586c73d: mov qword ptr [rbp + 0x20], rsi
0x14586c741: mov qword ptr [rbp + 0x28], r15
0x14586c745: add r13, r14
0x14586c748: lea r12, [rbp - 0x48]
0x14586c74c: xor eax, eax
0x14586c74e: lea rdi, [rbp + 0x90]
0x14586c755: sub rsi, 1
0x14586c759: jb 0x14586c9db
0x14586c75f: nop
0x14586c760: cmp r14, r13
0x14586c763: je 0x14586c9db
0x14586c769: mov qword ptr [rbp + 0x88], rax
0x14586c770: cmp rax, qword ptr [rbp + 0x80]
0x14586c777: jae 0x14586cb7f
0x14586c77d: mov ebx, dword ptr [r14 + 0xa8]
0x14586c784: lea rcx, [rbp + 8]
0x14586c788: mov rdx, r14
0x14586c78b: call 0x145ce7810
0x14586c790: nop
0x14586c791: mov qword ptr [rbp + 0xb0], 0xffffffffffffffff
0x14586c79c: cmp qword ptr [r14 + 0x48], -1
0x14586c7a1: mov qword ptr [rbp + 0xc0], 0xffffffffffffffff
0x14586c7ac: je 0x14586c7df
0x14586c7ae: lea rdx, [r14 + 0x48]
0x14586c7b2: mov rcx, rdi
0x14586c7b5: call 0x145ce7810
0x14586c7ba: nop
0x14586c7bb: mov rax, qword ptr [rbp + 0x90]
0x14586c7c2: mov qword ptr [rbp + 0xc0], rax
0x14586c7c9: mov rax, qword ptr [rbp + 0x98]
0x14586c7d0: mov qword ptr [rbp + 0x70], rax
0x14586c7d4: mov rax, qword ptr [rbp + 0xa0]
0x14586c7db: mov qword ptr [rbp + 0x38], rax
0x14586c7df: cmp qword ptr [r14 + 0x60], -1
0x14586c7e4: je 0x14586c817
0x14586c7e6: lea rdx, [r14 + 0x60]
0x14586c7ea: mov rcx, rdi
0x14586c7ed: call 0x145ce7810
0x14586c7f2: nop
0x14586c7f3: mov rax, qword ptr [rbp + 0x90]
0x14586c7fa: mov qword ptr [rbp + 0xb0], rax
0x14586c801: mov rax, qword ptr [rbp + 0x98]
0x14586c808: mov qword ptr [rbp + 0x78], rax
0x14586c80c: mov rax, qword ptr [rbp + 0xa0]
0x14586c813: mov qword ptr [rbp + 0x40], rax
0x14586c817: mov qword ptr [rbp + 0xb8], 0xffffffffffffffff
0x14586c822: cmp qword ptr [r14 + 0x78], -1
0x14586c827: mov qword ptr [rbp + 0xc8], 0xffffffffffffffff
0x14586c832: je 0x14586c865
0x14586c834: lea rdx, [r14 + 0x78]
0x14586c838: mov rcx, rdi
0x14586c83b: call 0x145ce7810
0x14586c840: nop
0x14586c841: mov rax, qword ptr [rbp + 0x90]
0x14586c848: mov qword ptr [rbp + 0xc8], rax
0x14586c84f: mov rax, qword ptr [rbp + 0x98]
0x14586c856: mov qword ptr [rbp + 0x60], rax
0x14586c85a: mov rax, qword ptr [rbp + 0xa0]
0x14586c861: mov qword ptr [rbp + 0x48], rax
0x14586c865: cmp qword ptr [r14 + 0x90], -1
0x14586c86d: je 0x14586c8a3
0x14586c86f: lea rdx, [r14 + 0x90]
0x14586c876: mov rcx, rdi
0x14586c879: call 0x145ce7810
0x14586c87e: nop
0x14586c87f: mov rax, qword ptr [rbp + 0x90]
0x14586c886: mov qword ptr [rbp + 0xb8], rax
0x14586c88d: mov rax, qword ptr [rbp + 0x98]
0x14586c894: mov qword ptr [rbp + 0x68], rax
0x14586c898: mov rax, qword ptr [rbp + 0xa0]
0x14586c89f: mov qword ptr [rbp + 0x50], rax
0x14586c8a3: lea rdx, [r14 + 0x18]
0x14586c8a7: lea rcx, [rbp - 0x10]
0x14586c8ab: call 0x145ce7810
0x14586c8b0: nop
0x14586c8b1: lea rdx, [r14 + 0x30]
0x14586c8b5: mov rcx, rdi
0x14586c8b8: call 0x145ce7810
0x14586c8bd: nop
0x14586c8be: mov rax, qword ptr [rbp + 0x18]
0x14586c8c2: mov qword ptr [rbp - 0x50], rax
0x14586c8c6: movups xmm0, xmmword ptr [rbp + 8]
0x14586c8ca: movaps xmmword ptr [rbp - 0x60], xmm0
0x14586c8ce: mov rax, qword ptr [rbp]
0x14586c8d2: mov qword ptr [r12 + 0x10], rax
0x14586c8d7: movups xmm0, xmmword ptr [rbp - 0x10]
0x14586c8db: movups xmmword ptr [r12], xmm0
0x14586c8e0: mov rax, qword ptr [rbp + 0xa0]
0x14586c8e7: mov qword ptr [r12 + 0x28], rax
0x14586c8ec: movups xmm0, xmmword ptr [rbp + 0x90]
0x14586c8f3: movups xmmword ptr [r12 + 0x18], xmm0
0x14586c8f9: mov rdx, qword ptr [rbp + 0x88]
0x14586c900: imul rax, rdx, 0xb0
0x14586c907: mov rcx, qword ptr [rbp - 0x20]
0x14586c90b: mov qword ptr [r15 + rax + 0x40], rcx
0x14586c910: movaps xmm0, xmmword ptr [rbp - 0x60]
0x14586c914: movaps xmm1, xmmword ptr [rbp - 0x50]
0x14586c918: movaps xmm2, xmmword ptr [rbp - 0x40]
0x14586c91c: movaps xmm3, xmmword ptr [rbp - 0x30]
0x14586c920: movups xmmword ptr [r15 + rax + 0x30], xmm3
0x14586c926: movups xmmword ptr [r15 + rax + 0x20], xmm2
0x14586c92c: movups xmmword ptr [r15 + rax + 0x10], xmm1
0x14586c932: movups xmmword ptr [r15 + rax], xmm0
0x14586c937: mov rcx, qword ptr [rbp + 0xc0]
0x14586c93e: mov qword ptr [r15 + rax + 0x48], rcx
0x14586c943: mov rcx, qword ptr [rbp + 0x70]
0x14586c947: mov qword ptr [r15 + rax + 0x50], rcx
0x14586c94c: mov rcx, qword ptr [rbp + 0x38]
0x14586c950: mov qword ptr [r15 + rax + 0x58], rcx
0x14586c955: mov rcx, qword ptr [rbp + 0xb0]
0x14586c95c: mov qword ptr [r15 + rax + 0x60], rcx
0x14586c961: mov rcx, qword ptr [rbp + 0x78]
0x14586c965: mov qword ptr [r15 + rax + 0x68], rcx
0x14586c96a: mov rcx, qword ptr [rbp + 0x40]
0x14586c96e: mov qword ptr [r15 + rax + 0x70], rcx
0x14586c973: mov rcx, qword ptr [rbp + 0xc8]
0x14586c97a: mov qword ptr [r15 + rax + 0x78], rcx
0x14586c97f: mov rcx, qword ptr [rbp + 0x60]
0x14586c983: mov qword ptr [r15 + rax + 0x80], rcx
0x14586c98b: mov rcx, qword ptr [rbp + 0x48]
0x14586c98f: mov qword ptr [r15 + rax + 0x88], rcx
0x14586c997: mov rcx, qword ptr [rbp + 0xb8]
0x14586c99e: mov qword ptr [r15 + rax + 0x90], rcx
0x14586c9a6: mov rcx, qword ptr [rbp + 0x68]
0x14586c9aa: mov qword ptr [r15 + rax + 0x98], rcx
0x14586c9b2: mov rcx, qword ptr [rbp + 0x50]
0x14586c9b6: mov qword ptr [r15 + rax + 0xa0], rcx
0x14586c9be: mov dword ptr [r15 + rax + 0xa8], ebx
0x14586c9c6: add r14, 0xb0
0x14586c9cd: lea rax, [rdx + 1]
0x14586c9d1: sub rsi, 1
0x14586c9d5: jae 0x14586c760
0x14586c9db: movups xmm0, xmmword ptr [rbp + 0x20]
0x14586c9df: movaps xmmword ptr [rbp + 0x90], xmm0
0x14586c9e6: mov rax, qword ptr [rbp + 0x80]
0x14586c9ed: mov qword ptr [rbp + 0xa0], rax
0x14586c9f4: mov rax, qword ptr [rbp + 0x58]
0x14586c9f8: mov rbx, qword ptr [rax + 0x10]
0x14586c9fc: lea rdi, [rbx + 0x10]
0x14586ca00: mov cl, 1
0x14586ca02: xor eax, eax
0x14586ca04: lock cmpxchg byte ptr [rbx + 0x10], cl
0x14586ca09: jne 0x14586cb25
0x14586ca0f: mov rsi, qword ptr [rip + 0x29a8022]
0x14586ca16: mov rax, qword ptr [rsi]
0x14586ca19: shl rax, 1
0x14586ca1c: test rax, rax
0x14586ca1f: jne 0x14586cb33
0x14586ca25: xor r14d, r14d
0x14586ca28: movzx eax, byte ptr [rbx + 0x11]
0x14586ca2c: lea r15, [rbx + 0x68]
0x14586ca30: cmp qword ptr [rbx + 0x68], -1
0x14586ca35: je 0x14586cae3
0x14586ca3b: mov qword ptr [rbp + 0xc8], r15
0x14586ca42: mov dword ptr [rbp + 0xb8], r14d
0x14586ca49: mov qword ptr [rbp + 0x70], rdi
0x14586ca4d: mov rcx, qword ptr [rbx + 0x70]
0x14586ca51: mov qword ptr [rbp + 0x88], rbx
0x14586ca58: mov rax, qword ptr [rbx + 0x78]
0x14586ca5c: mov qword ptr [rbp + 0xb0], rax
0x14586ca63: mov qword ptr [rbp + 0xc0], 0
0x14586ca6e: mov qword ptr [rbp + 0x78], rcx
0x14586ca72: nop word ptr cs:[rax + rax]
0x14586ca80: mov rax, qword ptr [rbp + 0xc0]
0x14586ca87: cmp qword ptr [rbp + 0xb0], rax
0x14586ca8e: je 0x14586caac
0x14586ca90: inc rax
0x14586ca93: mov qword ptr [rbp + 0xc0], rax
0x14586ca9a: lea rdi, [rcx + 0xb0]
0x14586caa1: call 0x14006bb30
0x14586caa6: nop
0x14586caa7: mov rcx, rdi
0x14586caaa: jmp 0x14586ca80
0x14586caac: mov r15, qword ptr [rbp + 0xc8]
0x14586cab3: mov rax, qword ptr [r15]
0x14586cab6: test rax, rax
0x14586cab9: mov rbx, qword ptr [rbp + 0x88]
0x14586cac0: lea rdi, [rbx + 0x10]
0x14586cac4: mov r14d, dword ptr [rbp + 0xb8]
0x14586cacb: je 0x14586cae3
0x14586cacd: mov rcx, qword ptr [rbx + 0x70]
0x14586cad1: imul rdx, rax, 0xb0
0x14586cad8: mov r8d, 8
0x14586cade: call 0x1400021d0
0x14586cae3: mov rax, qword ptr [rbp + 0xa0]
0x14586caea: mov qword ptr [r15 + 0x10], rax
0x14586caee: movaps xmm0, xmmword ptr [rbp + 0x90]
0x14586caf5: movups xmmword ptr [r15], xmm0
0x14586caf9: test r14b, r14b
0x14586cafc: jne 0x14586cb09
0x14586cafe: mov rax, qword ptr [rsi]
0x14586cb01: shl rax, 1
0x14586cb04: test rax, rax
0x14586cb07: jne 0x14586cb70
0x14586cb09: xor eax, eax
0x14586cb0b: xchg byte ptr [rdi], al
0x14586cb0d: cmp al, 2
0x14586cb0f: je 0x14586cb55
0x14586cb11: add rsp, 0x158
0x14586cb18: pop rbx
0x14586cb19: pop rdi
0x14586cb1a: pop rsi
0x14586cb1b: pop r12
0x14586cb1d: pop r13
0x14586cb1f: pop r14
0x14586cb21: pop r15
0x14586cb23: pop rbp
0x14586cb24: ret
0x14586cb25: mov rcx, rdi
0x14586cb28: call 0x145eb5670
0x14586cb2d: nop
0x14586cb2e: jmp 0x14586ca0f
0x14586cb33: call 0x145eb6400
0x14586cb38: nop
0x14586cb39: mov r14d, eax
0x14586cb3c: xor r14b, 1
0x14586cb40: movzx eax, byte ptr [rbx + 0x11]
0x14586cb44: lea r15, [rbx + 0x68]
0x14586cb48: cmp qword ptr [rbx + 0x68], -1
0x14586cb4d: jne 0x14586ca3b
0x14586cb53: jmp 0x14586cae3
0x14586cb55: mov rcx, rdi
0x14586cb58: add rsp, 0x158
0x14586cb5f: pop rbx
0x14586cb60: pop rdi
0x14586cb61: pop rsi
0x14586cb62: pop r12
0x14586cb64: pop r13
0x14586cb66: pop r14
0x14586cb68: pop r15
0x14586cb6a: pop rbp
0x14586cb6b: jmp 0x145eb5730
0x14586cb70: call 0x145eb6400
0x14586cb75: test al, al
0x14586cb77: jne 0x14586cb09
0x14586cb79: mov byte ptr [rbx + 0x11], 1
0x14586cb7d: jmp 0x14586cb09
0x14586cb7f: lea r8, [rip + 0x179ff62]
0x14586cb86: mov rcx, qword ptr [rbp + 0x88]
0x14586cb8d: mov rdx, qword ptr [rbp + 0x80]
0x14586cb94: call 0x145eb7363
0x14586cb99: nop
0x14586cb9a: ud2
0x14586cb9c: mov ecx, 8
0x14586cba1: mov rdx, r13
0x14586cba4: call 0x145eb6fcb
0x14586cba9: ud2
