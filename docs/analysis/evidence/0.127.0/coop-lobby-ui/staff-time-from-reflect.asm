0x142038990: push r15
0x142038992: push r14
0x142038994: push r13
0x142038996: push r12
0x142038998: push rsi
0x142038999: push rdi
0x14203899a: push rbp
0x14203899b: push rbx
0x14203899c: sub rsp, 0xc8
0x1420389a3: movaps xmmword ptr [rsp + 0xb0], xmm11
0x1420389ac: movaps xmmword ptr [rsp + 0xa0], xmm10
0x1420389b5: movaps xmmword ptr [rsp + 0x90], xmm9
0x1420389be: movaps xmmword ptr [rsp + 0x80], xmm8
0x1420389c7: movaps xmmword ptr [rsp + 0x70], xmm7
0x1420389cc: movaps xmmword ptr [rsp + 0x60], xmm6
0x1420389d1: mov rax, rdx
0x1420389d4: mov rdx, rcx
0x1420389d7: lea rcx, [rsp + 0x30]
0x1420389dc: call qword ptr [rax + 0x90]
0x1420389e2: cmp qword ptr [rsp + 0x30], 0
0x1420389e8: je 0x1420389f1
0x1420389ea: xor eax, eax
0x1420389ec: jmp 0x142038c8c
0x1420389f1: mov rdi, qword ptr [rsp + 0x38]
0x1420389f6: mov rax, qword ptr [rsp + 0x40]
0x1420389fb: mov r15, qword ptr [rax + 0xd8]
0x142038a02: lea rdx, [rip + 0x457f317]
0x142038a09: mov r8d, 7
0x142038a0f: mov rcx, rdi
0x142038a12: call r15
0x142038a15: test rax, rax
0x142038a18: je 0x142038a2c
0x142038a1a: mov r8, rdx
0x142038a1d: lea rcx, [rsp + 0x48]
0x142038a22: mov rdx, rax
0x142038a25: call qword ptr [r8 + 0x90]
0x142038a2c: lea rdx, [rip + 0x457f2f4]
0x142038a33: mov r8d, 0xb
0x142038a39: mov rcx, rdi
0x142038a3c: call r15
0x142038a3f: xor esi, esi
0x142038a41: test rax, rax
0x142038a44: je 0x142038a6a
0x142038a46: mov rcx, rax
0x142038a49: call 0x145124e60
0x142038a4e: xor ecx, ecx
0x142038a50: cmp edx, -1
0x142038a53: cmovne ecx, edx
0x142038a56: mov dword ptr [rsp + 0x24], ecx
0x142038a5a: mov ecx, 0xe10
0x142038a5f: cmovne rcx, rax
0x142038a63: mov qword ptr [rsp + 0x28], rcx
0x142038a68: jmp 0x142038a7c
0x142038a6a: mov eax, 0xe10
0x142038a6f: mov qword ptr [rsp + 0x28], rax
0x142038a74: mov dword ptr [rsp + 0x24], 0
0x142038a7c: lea rdx, [rip + 0x457f2af]
0x142038a83: mov r8d, 5
0x142038a89: mov rcx, rdi
0x142038a8c: call r15
0x142038a8f: test rax, rax
0x142038a92: je 0x142038aae
0x142038a94: mov rcx, rax
0x142038a97: call 0x145124e60
0x142038a9c: mov esi, edx
0x142038a9e: xor r13d, r13d
0x142038aa1: cmp edx, -1
0x142038aa4: cmove esi, r13d
0x142038aa8: cmovne r13, rax
0x142038aac: jmp 0x142038ab1
0x142038aae: xor r13d, r13d
0x142038ab1: lea rdx, [rip + 0x457f27f]
0x142038ab8: mov r8d, 0xa
0x142038abe: mov rcx, rdi
0x142038ac1: call r15
0x142038ac4: xorps xmm6, xmm6
0x142038ac7: test rax, rax
0x142038aca: je 0x142038adb
0x142038acc: mov rcx, rax
0x142038acf: call 0x145118870
0x142038ad4: test al, 1
0x142038ad6: je 0x142038adb
0x142038ad8: movaps xmm6, xmm0
0x142038adb: lea rdx, [rip + 0x457f25f]
0x142038ae2: mov r8d, 0xe
0x142038ae8: mov rcx, rdi
0x142038aeb: call r15
0x142038aee: xorps xmm7, xmm7
0x142038af1: test rax, rax
0x142038af4: je 0x142038b07
0x142038af6: mov rcx, rax
0x142038af9: call 0x1451188e0
0x142038afe: cmp rax, 1
0x142038b02: jne 0x142038b07
0x142038b04: movaps xmm7, xmm0
0x142038b07: lea rdx, [rip + 0x457f241]
0x142038b0e: mov r8d, 7
0x142038b14: mov rcx, rdi
0x142038b17: call r15
0x142038b1a: test rax, rax
0x142038b1d: je 0x142038b37
0x142038b1f: mov rcx, rax
0x142038b22: call 0x145124e60
0x142038b27: mov ebx, edx
0x142038b29: xor ebp, ebp
0x142038b2b: cmp edx, -1
0x142038b2e: cmove ebx, ebp
0x142038b31: cmovne rbp, rax
0x142038b35: jmp 0x142038b3b
0x142038b37: xor ebx, ebx
0x142038b39: xor ebp, ebp
0x142038b3b: lea rdx, [rip + 0x457f214]
0x142038b42: mov r8d, 0xc
0x142038b48: mov rcx, rdi
0x142038b4b: call r15
0x142038b4e: xorps xmm8, xmm8
0x142038b52: test rax, rax
0x142038b55: je 0x142038b67
0x142038b57: mov rcx, rax
0x142038b5a: call 0x145118870
0x142038b5f: test al, 1
0x142038b61: je 0x142038b67
0x142038b63: movaps xmm8, xmm0
0x142038b67: lea rdx, [rip + 0x457f1f4]
0x142038b6e: mov r8d, 0x10
0x142038b74: mov rcx, rdi
0x142038b77: call r15
0x142038b7a: xorps xmm9, xmm9
0x142038b7e: test rax, rax
0x142038b81: je 0x142038b95
0x142038b83: mov rcx, rax
0x142038b86: call 0x1451188e0
0x142038b8b: cmp rax, 1
0x142038b8f: jne 0x142038b95
0x142038b91: movaps xmm9, xmm0
0x142038b95: lea rdx, [rip + 0x457f1d6]
0x142038b9c: mov r8d, 0xf
0x142038ba2: mov rcx, rdi
0x142038ba5: call r15
0x142038ba8: test rax, rax
0x142038bab: je 0x142038bc8
0x142038bad: mov rcx, rax
0x142038bb0: call 0x145124e60
0x142038bb5: mov r14d, edx
0x142038bb8: xor r12d, r12d
0x142038bbb: cmp edx, -1
0x142038bbe: cmove r14d, r12d
0x142038bc2: cmovne r12, rax
0x142038bc6: jmp 0x142038bce
0x142038bc8: xor r14d, r14d
0x142038bcb: xor r12d, r12d
0x142038bce: lea rdx, [rip + 0x457f1ac]
0x142038bd5: mov r8d, 0x14
0x142038bdb: mov rcx, rdi
0x142038bde: call r15
0x142038be1: xorps xmm10, xmm10
0x142038be5: test rax, rax
0x142038be8: je 0x142038bfa
0x142038bea: mov rcx, rax
0x142038bed: call 0x145118870
0x142038bf2: test al, 1
0x142038bf4: je 0x142038bfa
0x142038bf6: movaps xmm10, xmm0
0x142038bfa: lea rdx, [rip + 0x457f194]
0x142038c01: mov r8d, 0x18
0x142038c07: mov rcx, rdi
0x142038c0a: call r15
0x142038c0d: xorps xmm11, xmm11
0x142038c11: test rax, rax
0x142038c14: je 0x142038c28
0x142038c16: mov rcx, rax
0x142038c19: call 0x1451188e0
0x142038c1e: cmp rax, 1
0x142038c22: jne 0x142038c28
0x142038c24: movaps xmm11, xmm0
0x142038c28: call 0x140002200
0x142038c2d: mov ecx, 0x68
0x142038c32: mov edx, 8
0x142038c37: call 0x1400021c0
0x142038c3c: test rax, rax
0x142038c3f: je 0x142038cd5
0x142038c45: mov rcx, qword ptr [rsp + 0x28]
0x142038c4a: mov qword ptr [rax], rcx
0x142038c4d: mov ecx, dword ptr [rsp + 0x24]
0x142038c51: mov dword ptr [rax + 8], ecx
0x142038c54: mov qword ptr [rax + 0x10], r13
0x142038c58: mov dword ptr [rax + 0x18], esi
0x142038c5b: mov qword ptr [rax + 0x20], rbp
0x142038c5f: mov dword ptr [rax + 0x28], ebx
0x142038c62: mov qword ptr [rax + 0x30], r12
0x142038c66: mov dword ptr [rax + 0x38], r14d
0x142038c6a: movsd qword ptr [rax + 0x40], xmm7
0x142038c6f: movsd qword ptr [rax + 0x48], xmm9
0x142038c75: movsd qword ptr [rax + 0x50], xmm11
0x142038c7b: movss dword ptr [rax + 0x58], xmm6
0x142038c80: movss dword ptr [rax + 0x5c], xmm8
0x142038c86: movss dword ptr [rax + 0x60], xmm10
0x142038c8c: lea rdx, [rip + 0x4578015]
0x142038c93: movaps xmm6, xmmword ptr [rsp + 0x60]
0x142038c98: movaps xmm7, xmmword ptr [rsp + 0x70]
0x142038c9d: movaps xmm8, xmmword ptr [rsp + 0x80]
0x142038ca6: movaps xmm9, xmmword ptr [rsp + 0x90]
0x142038caf: movaps xmm10, xmmword ptr [rsp + 0xa0]
0x142038cb8: movaps xmm11, xmmword ptr [rsp + 0xb0]
0x142038cc1: add rsp, 0xc8
0x142038cc8: pop rbx
0x142038cc9: pop rbp
0x142038cca: pop rdi
0x142038ccb: pop rsi
0x142038ccc: pop r12
0x142038cce: pop r13
0x142038cd0: pop r14
0x142038cd2: pop r15
0x142038cd4: ret 
0x142038cd5: mov ecx, 8
0x142038cda: mov edx, 0x68
0x142038cdf: call 0x146208951
0x142038ce4: ud2 
