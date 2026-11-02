0x145851e30: push rbp
0x145851e31: push rsi
0x145851e32: push rdi
0x145851e33: push rbx
0x145851e34: sub rsp, 0x188
0x145851e3b: lea rbp, [rsp + 0x80]
0x145851e43: mov qword ptr [rbp + 0xf8], 0xfffffffffffffffe
0x145851e4e: mov rsi, qword ptr [rcx]
0x145851e51: mov rdi, qword ptr [rcx + 8]
0x145851e55: mov rax, qword ptr [rcx + 0x40]
0x145851e59: mov qword ptr [rbp + 0x90], rax
0x145851e60: movups xmm0, xmmword ptr [rcx + 0x30]
0x145851e64: movaps xmmword ptr [rbp + 0x80], xmm0
0x145851e6b: movups xmm0, xmmword ptr [rcx + 0x20]
0x145851e6f: movaps xmmword ptr [rbp + 0x70], xmm0
0x145851e73: movups xmm0, xmmword ptr [rcx + 0x10]
0x145851e77: movaps xmmword ptr [rbp + 0x60], xmm0
0x145851e7b: movups xmm0, xmmword ptr [rcx + 0x48]
0x145851e7f: movups xmm1, xmmword ptr [rcx + 0x58]
0x145851e83: movups xmmword ptr [rbp + 0x98], xmm0
0x145851e8a: movups xmmword ptr [rbp + 0xa8], xmm1
0x145851e91: mov qword ptr [rbp - 0x58], rsi
0x145851e95: mov qword ptr [rbp - 0x50], rdi
0x145851e99: mov rax, qword ptr [rbp + 0x90]
0x145851ea0: mov qword ptr [rbp - 0x18], rax
0x145851ea4: mov rax, qword ptr [rbp + 0x98]
0x145851eab: mov qword ptr [rbp - 0x10], rax
0x145851eaf: movaps xmm0, xmmword ptr [rbp + 0xa0]
0x145851eb6: movups xmmword ptr [rbp - 8], xmm0
0x145851eba: movaps xmm0, xmmword ptr [rbp + 0x60]
0x145851ebe: movaps xmm1, xmmword ptr [rbp + 0x70]
0x145851ec2: movaps xmm2, xmmword ptr [rbp + 0x80]
0x145851ec9: movups xmmword ptr [rbp - 0x48], xmm0
0x145851ecd: movups xmmword ptr [rbp - 0x38], xmm1
0x145851ed1: movups xmmword ptr [rbp - 0x28], xmm2
0x145851ed5: mov rax, qword ptr [rbp + 0xb0]
0x145851edc: mov qword ptr [rbp + 8], rax
0x145851ee0: movups xmm0, xmmword ptr [rcx + 0x48]
0x145851ee4: mov qword ptr [rbp + 0xd8], rcx
0x145851eeb: movups xmm1, xmmword ptr [rcx + 0x58]
0x145851eef: movaps xmmword ptr [rbp + 0x20], xmm1
0x145851ef3: movaps xmmword ptr [rbp + 0x10], xmm0
0x145851ef7: mov byte ptr [rbp + 0xf7], 1
0x145851efe: lea rcx, [rbp + 0x10]
0x145851f02: call 0x1401f24b0
0x145851f07: nop
0x145851f08: mov rax, qword ptr [rbp + 0xd8]
0x145851f0f: add rax, 0x10
0x145851f13: mov qword ptr [rbp + 0x10], rsi
0x145851f17: mov qword ptr [rbp + 0x18], rdi
0x145851f1b: movups xmm0, xmmword ptr [rax]
0x145851f1e: movups xmm1, xmmword ptr [rax + 0x10]
0x145851f22: movups xmm2, xmmword ptr [rax + 0x20]
0x145851f26: movups xmmword ptr [rbp + 0x20], xmm0
0x145851f2a: movups xmmword ptr [rbp + 0x30], xmm1
0x145851f2e: movups xmmword ptr [rbp + 0x40], xmm2
0x145851f32: mov rax, qword ptr [rax + 0x30]
0x145851f36: mov qword ptr [rbp + 0x50], rax
0x145851f3a: mov byte ptr [rbp + 0xf7], 0
0x145851f41: lea rcx, [rbp + 0x10]
0x145851f45: call 0x1458b1940
0x145851f4a: nop
0x145851f4b: xor esi, esi
0x145851f4d: mov rax, qword ptr [rbp + 0xd8]
0x145851f54: mov rbx, qword ptr [rax + 0x68]
0x145851f58: add rax, 0x68
0x145851f5c: mov qword ptr [rbp + 0xd8], rax
0x145851f63: cmp qword ptr [rbx + 0x18], 0
0x145851f68: je 0x145851fe1
0x145851f6a: mov rax, qword ptr [rbx + 0x20]
0x145851f6e: mov qword ptr [rbp + 0xc8], rax
0x145851f75: test rax, rax
0x145851f78: je 0x145851fe1
0x145851f7a: mov qword ptr [rbp + 0xe8], rdi
0x145851f81: mov qword ptr [rbp + 0xe0], rsi
0x145851f88: mov qword ptr [rbp + 0xc0], rbx
0x145851f8f: mov rax, qword ptr [rbx + 0x28]
0x145851f93: mov qword ptr [rbp + 0xd0], rax
0x145851f9a: mov rax, qword ptr [rax]
0x145851f9d: test rax, rax
0x145851fa0: je 0x145851fac
0x145851fa2: mov rcx, qword ptr [rbp + 0xc8]
0x145851fa9: call rax
0x145851fab: nop
0x145851fac: mov rax, qword ptr [rbp + 0xd0]
0x145851fb3: mov rdx, qword ptr [rax + 8]
0x145851fb7: test rdx, rdx
0x145851fba: mov rsi, qword ptr [rbp + 0xe0]
0x145851fc1: mov rdi, qword ptr [rbp + 0xe8]
0x145851fc8: mov rbx, qword ptr [rbp + 0xc0]
0x145851fcf: je 0x145851fe1
0x145851fd1: mov r8, qword ptr [rax + 0x10]
0x145851fd5: mov rcx, qword ptr [rbp + 0xc8]
0x145851fdc: call 0x1400021d0
0x145851fe1: mov qword ptr [rbx + 0x18], 1
0x145851fe9: mov qword ptr [rbx + 0x20], rsi
0x145851fed: mov qword ptr [rbx + 0x28], rdi
0x145851ff1: mov qword ptr [rbp + 0xb8], rbx
0x145851ff8: lock dec qword ptr [rbx]
0x145851ffc: jne 0x145852012
0x145851ffe: mov byte ptr [rbp + 0xf6], 0
0x145852005: lea rcx, [rbp + 0xb8]
0x14585200c: call 0x145ccc910
0x145852011: nop
0x145852012: add rsp, 0x188
0x145852019: pop rbx
0x14585201a: pop rdi
0x14585201b: pop rsi
0x14585201c: pop rbp
0x14585201d: ret
0x14585201e: mov rsi, qword ptr [rbp + 0xe0]
0x145852025: mov rdi, qword ptr [rbp + 0xe8]
0x14585202c: jmp 0x145851f4d
