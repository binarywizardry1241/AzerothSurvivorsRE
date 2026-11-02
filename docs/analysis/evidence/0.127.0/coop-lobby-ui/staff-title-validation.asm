0x145b05cc0: push rbp
0x145b05cc1: push r15
0x145b05cc3: push r14
0x145b05cc5: push rsi
0x145b05cc6: push rdi
0x145b05cc7: push rbx
0x145b05cc8: sub rsp, 0x208
0x145b05ccf: lea rbp, [rsp + 0x80]
0x145b05cd7: mov qword ptr [rbp + 0x180], 0xfffffffffffffffe
0x145b05ce2: mov rdi, r8
0x145b05ce5: mov rsi, rcx
0x145b05ce8: mov r8, qword ptr [rbp + 0x1e0]
0x145b05cef: test r8, r8
0x145b05cf2: je 0x145b05eb6
0x145b05cf8: cmp qword ptr [rdi + 0x10], r8
0x145b05cfc: jne 0x145b05eb6
0x145b05d02: mov rbx, rdx
0x145b05d05: mov rcx, qword ptr [rdi + 8]
0x145b05d09: mov rdx, r9
0x145b05d0c: call 0x146061721
0x145b05d11: test eax, eax
0x145b05d13: jne 0x145b05eb6
0x145b05d19: mov rax, qword ptr [rbp + 0x1e8]
0x145b05d20: cmp qword ptr [rdi + 0x60], rax
0x145b05d24: jne 0x145b05eb6
0x145b05d2a: mov r8, qword ptr [rbp + 0x1f8]
0x145b05d31: cmp qword ptr [rdi + 0x28], r8
0x145b05d35: jne 0x145b05eb6
0x145b05d3b: mov rdx, qword ptr [rbp + 0x1f0]
0x145b05d42: mov rcx, qword ptr [rdi + 0x20]
0x145b05d46: call 0x146061721
0x145b05d4b: test eax, eax
0x145b05d4d: jne 0x145b05eb6
0x145b05d53: mov rax, qword ptr [rbp + 0x200]
0x145b05d5a: cmp qword ptr [rdi + 0x68], rax
0x145b05d5e: jbe 0x145b05eb6
0x145b05d64: mov r15, qword ptr [rdi + 0x40]
0x145b05d68: test r15, r15
0x145b05d6b: je 0x145b05eb6
0x145b05d71: movups xmm0, xmmword ptr [rbx]
0x145b05d74: movups xmm1, xmmword ptr [rbx + 0x10]
0x145b05d78: movaps xmmword ptr [rbp + 0x80], xmm1
0x145b05d7f: movaps xmmword ptr [rbp + 0x70], xmm0
0x145b05d83: lea rcx, [rbp + 0xc8]
0x145b05d8a: lea r14, [rbp + 0x70]
0x145b05d8e: mov rdx, r14
0x145b05d91: call 0x145d34680
0x145b05d96: cmp dword ptr [rbp + 0xc8], 1
0x145b05d9d: jne 0x145b05e5a
0x145b05da3: mov rax, qword ptr [rbp + 0xd0]
0x145b05daa: movups xmm0, xmmword ptr [rbp + 0xd8]
0x145b05db1: movups xmmword ptr [rbp - 0x28], xmm0
0x145b05db5: mov rcx, qword ptr [rbp + 0xe8]
0x145b05dbc: mov qword ptr [rbp - 0x18], rcx
0x145b05dc0: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145b05dc7: movaps xmmword ptr [rbp - 0x10], xmm0
0x145b05dcb: movups xmm0, xmmword ptr [rbp + 0x100]
0x145b05dd2: movaps xmmword ptr [rbp], xmm0
0x145b05dd6: movups xmm0, xmmword ptr [rbp + 0x110]
0x145b05ddd: movaps xmmword ptr [rbp + 0x10], xmm0
0x145b05de1: movups xmm0, xmmword ptr [rbp + 0x120]
0x145b05de8: movaps xmmword ptr [rbp + 0x20], xmm0
0x145b05dec: movups xmm0, xmmword ptr [rbp + 0x130]
0x145b05df3: movaps xmmword ptr [rbp + 0x30], xmm0
0x145b05df7: movups xmm0, xmmword ptr [rbp + 0x140]
0x145b05dfe: movaps xmmword ptr [rbp + 0x40], xmm0
0x145b05e02: movups xmm0, xmmword ptr [rbp + 0x150]
0x145b05e09: movaps xmmword ptr [rbp + 0x50], xmm0
0x145b05e0d: movups xmm0, xmmword ptr [rbp + 0x160]
0x145b05e14: movaps xmmword ptr [rbp + 0x60], xmm0
0x145b05e18: movups xmm0, xmmword ptr [rbx + 0x10]
0x145b05e1c: movaps xmmword ptr [rbp - 0x40], xmm0
0x145b05e20: movups xmm0, xmmword ptr [rbx]
0x145b05e23: movaps xmmword ptr [rbp - 0x50], xmm0
0x145b05e27: mov qword ptr [rbp - 0x30], rax
0x145b05e2b: mov rdx, qword ptr [rdi + 0x50]
0x145b05e2f: mov r8, qword ptr [rdi + 0x58]
0x145b05e33: lea rcx, [rbp + 0xc8]
0x145b05e3a: call 0x145d3d590
0x145b05e3f: cmp byte ptr [rbp + 0xc8], 0
0x145b05e46: je 0x145b05ed0
0x145b05e4c: lea rcx, [rbp + 0xc8]
0x145b05e53: call 0x1401c7670
0x145b05e58: jmp 0x145b05eb6
0x145b05e5a: mov qword ptr [rbp + 0xc8], 0
0x145b05e65: lea rcx, [rbp + 0xc8]
0x145b05e6c: call 0x145d2c9f0
0x145b05e71: mov qword ptr [rbp + 0x178], rax
0x145b05e78: test rax, rax
0x145b05e7b: je 0x145b05eb6
0x145b05e7d: mov qword ptr [rbp + 0x170], rdx
0x145b05e84: mov rax, qword ptr [rdx]
0x145b05e87: test rax, rax
0x145b05e8a: je 0x145b05e96
0x145b05e8c: mov rcx, qword ptr [rbp + 0x178]
0x145b05e93: call rax
0x145b05e95: nop 
0x145b05e96: mov rax, qword ptr [rbp + 0x170]
0x145b05e9d: mov rdx, qword ptr [rax + 8]
0x145b05ea1: test rdx, rdx
0x145b05ea4: je 0x145b05eb6
0x145b05ea6: mov r8, qword ptr [rax + 0x10]
0x145b05eaa: mov rcx, qword ptr [rbp + 0x178]
0x145b05eb1: call 0x1400021d0
0x145b05eb6: mov qword ptr [rsi], 0xffffffffffffffff
0x145b05ebd: mov rax, rsi
0x145b05ec0: add rsp, 0x208
0x145b05ec7: pop rbx
0x145b05ec8: pop rdi
0x145b05ec9: pop rsi
0x145b05eca: pop r14
0x145b05ecc: pop r15
0x145b05ece: pop rbp
0x145b05ecf: ret 
0x145b05ed0: movups xmm0, xmmword ptr [rbp + 0xc9]
0x145b05ed7: movups xmm1, xmmword ptr [rbp + 0xd9]
0x145b05ede: movups xmm2, xmmword ptr [rbp + 0xe9]
0x145b05ee5: movups xmm3, xmmword ptr [rbp + 0xf9]
0x145b05eec: movaps xmmword ptr [rbp + 0xa0], xmm3
0x145b05ef3: movaps xmmword ptr [rbp + 0x90], xmm2
0x145b05efa: movaps xmmword ptr [rbp + 0x80], xmm1
0x145b05f01: movaps xmmword ptr [rbp + 0x70], xmm0
0x145b05f05: lea rcx, [rbp + 0xc8]
0x145b05f0c: mov rdx, rdi
0x145b05f0f: call 0x145ec09c0
0x145b05f14: mov r8, qword ptr [rbp + 0xd0]
0x145b05f1b: mov r9, qword ptr [rbp + 0xd8]
0x145b05f22: mov qword ptr [rsp + 0x20], r14
0x145b05f27: lea rcx, [rbp + 0xb0]
0x145b05f2e: lea rdx, [rbp - 0x50]
0x145b05f32: mov qword ptr [rbp + 0x178], r8
0x145b05f39: call 0x145d2c330
0x145b05f3e: nop 
0x145b05f3f: cmp dword ptr [rbp + 0xb0], 1
0x145b05f46: jne 0x145b05f83
0x145b05f48: lea rcx, [rbp + 0xb0]
0x145b05f4f: call 0x1401c7670
0x145b05f54: nop 
0x145b05f55: mov qword ptr [rsi], 0xffffffffffffffff
0x145b05f5c: mov rdx, qword ptr [rbp + 0xc8]
0x145b05f63: test rdx, rdx
0x145b05f66: je 0x145b05ebd
0x145b05f6c: mov r8d, 1
0x145b05f72: mov rcx, qword ptr [rbp + 0x178]
0x145b05f79: call 0x1400021d0
0x145b05f7e: jmp 0x145b05ebd
0x145b05f83: mov rdx, qword ptr [rbp + 0xc8]
0x145b05f8a: test rdx, rdx
0x145b05f8d: je 0x145b05fa1
0x145b05f8f: mov r8d, 1
0x145b05f95: mov rcx, qword ptr [rbp + 0x178]
0x145b05f9c: call 0x1400021d0
0x145b05fa1: mov rax, qword ptr [rdi + 0x38]
0x145b05fa5: add r15, rax
0x145b05fa8: mov qword ptr [rbp + 0xc8], rax
0x145b05faf: mov qword ptr [rbp + 0xd0], r15
0x145b05fb6: mov qword ptr [rbp + 0xd8], 0x18
0x145b05fc1: lea rdx, [rbp + 0xc8]
0x145b05fc8: mov rcx, rsi
0x145b05fcb: call 0x145b46990
0x145b05fd0: jmp 0x145b05ebd
