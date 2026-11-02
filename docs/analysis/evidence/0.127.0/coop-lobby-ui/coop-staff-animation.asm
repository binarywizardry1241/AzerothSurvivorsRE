0x1402e36d0: push rbp
0x1402e36d1: push r15
0x1402e36d3: push r14
0x1402e36d5: push r13
0x1402e36d7: push r12
0x1402e36d9: push rsi
0x1402e36da: push rdi
0x1402e36db: push rbx
0x1402e36dc: sub rsp, 0x1a8
0x1402e36e3: lea rbp, [rsp + 0x80]
0x1402e36eb: mov qword ptr [rbp + 0x120], 0xfffffffffffffffe
0x1402e36f6: mov rdi, qword ptr [r8]
0x1402e36f9: cmp qword ptr [rdi + 0x50], 0
0x1402e36fe: je 0x1402e374a
0x1402e3700: mov rax, qword ptr [rdi + 0x18]
0x1402e3704: mov rcx, qword ptr [rdi + 0x20]
0x1402e3708: cmp rcx, 4
0x1402e370c: je 0x1402e377e
0x1402e370e: cmp rcx, 6
0x1402e3712: je 0x1402e376a
0x1402e3714: cmp rcx, 7
0x1402e3718: jne 0x1402e374a
0x1402e371a: mov ecx, 0x74736f68
0x1402e371f: xor ecx, dword ptr [rax]
0x1402e3721: mov r10d, 0x676e6974
0x1402e3727: xor r10d, dword ptr [rax + 3]
0x1402e372b: or r10d, ecx
0x1402e372e: je 0x1402e43ce
0x1402e3734: mov ecx, 0x6e696f6a
0x1402e3739: xor ecx, dword ptr [rax]
0x1402e373b: mov r10d, 0x676e696e
0x1402e3741: xor r10d, dword ptr [rax + 3]
0x1402e3745: or r10d, ecx
0x1402e3748: jmp 0x1402e3784
0x1402e374a: mov dword ptr [rbp + 0x118], 0
0x1402e3754: mov rbx, qword ptr [rdx]
0x1402e3757: mov rax, qword ptr [rdx + 8]
0x1402e375b: cmp byte ptr [rdi + 0x1b4], 0
0x1402e3762: je 0x1402e3985
0x1402e3768: jmp 0x1402e37a1
0x1402e376a: mov ecx, 0x6e696f6a
0x1402e376f: xor ecx, dword ptr [rax]
0x1402e3771: movzx eax, word ptr [rax + 4]
0x1402e3775: xor eax, 0x6465
0x1402e377a: or eax, ecx
0x1402e377c: jmp 0x1402e3784
0x1402e377e: cmp dword ptr [rax], 0x7466656c
0x1402e3784: sete al
0x1402e3787: mov dword ptr [rbp + 0x118], eax
0x1402e378d: mov rbx, qword ptr [rdx]
0x1402e3790: mov rax, qword ptr [rdx + 8]
0x1402e3794: cmp byte ptr [rdi + 0x1b4], 0
0x1402e379b: je 0x1402e3985
0x1402e37a1: mov rsi, qword ptr [rbp + 0x198]
0x1402e37a8: mov rcx, qword ptr [rbp + 0x190]
0x1402e37af: mov rdx, qword ptr [r8 + 0x10]
0x1402e37b3: mov qword ptr [rbp + 0xf0], rdx
0x1402e37ba: mov edx, dword ptr [r8 + 0x1c]
0x1402e37be: mov dword ptr [rbp + 0x10c], edx
0x1402e37c4: mov r14, qword ptr [r9]
0x1402e37c7: mov rcx, qword ptr [rcx]
0x1402e37ca: mov qword ptr [rbp + 0xd0], rcx
0x1402e37d1: mov rcx, qword ptr [rsi]
0x1402e37d4: mov r10, qword ptr [rsi + 0x10]
0x1402e37d8: mov r11d, dword ptr [rsi + 0x1c]
0x1402e37dc: mov rdx, qword ptr [rsi + 0x20]
0x1402e37e0: mov r8, qword ptr [rsi + 0x28]
0x1402e37e4: movzx r9d, byte ptr [rdi + 0x1ba]
0x1402e37ec: test r9b, r9b
0x1402e37ef: je 0x1402e3808
0x1402e37f1: movzx esi, r9b
0x1402e37f5: cmp byte ptr [rbp + 0x118], 0
0x1402e37fc: mov r9d, 6
0x1402e3802: cmove r9d, esi
0x1402e3806: jmp 0x1402e3818
0x1402e3808: mov r9b, 6
0x1402e380b: cmp byte ptr [rbp + 0x118], 0
0x1402e3812: je 0x1402e3985
0x1402e3818: mov qword ptr [rbp + 0xc8], r14
0x1402e381f: mov qword ptr [rbp + 0x100], rdi
0x1402e3826: mov dword ptr [r10], r11d
0x1402e3829: mov r10, qword ptr [rdx + 0xf8]
0x1402e3830: mov r11, qword ptr [rdx + 0x100]
0x1402e3837: lea r11, [r10 + r11*4]
0x1402e383b: cmp byte ptr [rdx + 0x108], 0
0x1402e3842: mov qword ptr [rbp + 0xe8], rbx
0x1402e3849: je 0x1402e3991
0x1402e384f: xor edi, edi
0x1402e3851: xor r15d, r15d
0x1402e3854: xor ebx, ebx
0x1402e3856: xor r13d, r13d
0x1402e3859: xor r14d, r14d
0x1402e385c: cmp r15d, ebx
0x1402e385f: jne 0x1402e394d
0x1402e3865: mov r12, qword ptr [rbp + 0xe8]
0x1402e386c: nop dword ptr [rax]
0x1402e3870: cmp r10, r11
0x1402e3873: je 0x1402e3b44
0x1402e3879: mov edi, dword ptr [r10]
0x1402e387c: add r10, 4
0x1402e3880: mov rsi, qword ptr [r8 + 0x1a8]
0x1402e3887: lea rdi, [rdi + rdi*8]
0x1402e388b: mov rbx, qword ptr [rsi + rdi*8 + 0x10]
0x1402e3890: test rbx, rbx
0x1402e3893: je 0x1402e3870
0x1402e3895: lea rdi, [rsi + rdi*8]
0x1402e3899: mov rsi, qword ptr [rdx + 0x110]
0x1402e38a0: mov r15, qword ptr [rdi + 0x40]
0x1402e38a4: cmp rsi, r15
0x1402e38a7: jae 0x1402e38d8
0x1402e38a9: mov r14, qword ptr [rdi + 0x38]
0x1402e38ad: mov rsi, qword ptr [r14 + rsi*8]
0x1402e38b1: test rsi, rsi
0x1402e38b4: je 0x1402e38d8
0x1402e38b6: mov r14, qword ptr [rdi + 0x18]
0x1402e38ba: not rsi
0x1402e38bd: lea rsi, [rsi + rsi*2]
0x1402e38c1: shl rsi, 4
0x1402e38c5: mov r14, qword ptr [r14 + rsi + 0x10]
0x1402e38ca: mov rsi, qword ptr [rdx + 0x118]
0x1402e38d1: cmp rsi, r15
0x1402e38d4: jb 0x1402e38e7
0x1402e38d6: jmp 0x1402e3916
0x1402e38d8: xor r14d, r14d
0x1402e38db: mov rsi, qword ptr [rdx + 0x118]
0x1402e38e2: cmp rsi, r15
0x1402e38e5: jae 0x1402e3916
0x1402e38e7: mov r12, qword ptr [rdi + 0x38]
0x1402e38eb: mov rsi, qword ptr [r12 + rsi*8]
0x1402e38ef: test rsi, rsi
0x1402e38f2: je 0x1402e3916
0x1402e38f4: mov r12, qword ptr [rdi + 0x18]
0x1402e38f8: not rsi
0x1402e38fb: lea rsi, [rsi + rsi*2]
0x1402e38ff: shl rsi, 4
0x1402e3903: mov r13, qword ptr [r12 + rsi + 0x10]
0x1402e3908: mov rsi, qword ptr [rdx + 0x120]
0x1402e390f: cmp rsi, r15
0x1402e3912: jae 0x1402e3948
0x1402e3914: jmp 0x1402e3925
0x1402e3916: xor r13d, r13d
0x1402e3919: mov rsi, qword ptr [rdx + 0x120]
0x1402e3920: cmp rsi, r15
0x1402e3923: jae 0x1402e3948
0x1402e3925: mov r15, qword ptr [rdi + 0x38]
0x1402e3929: mov rsi, qword ptr [r15 + rsi*8]
0x1402e392d: test rsi, rsi
0x1402e3930: je 0x1402e3948
0x1402e3932: mov rdi, qword ptr [rdi + 0x18]
0x1402e3936: not rsi
0x1402e3939: lea rsi, [rsi + rsi*2]
0x1402e393d: shl rsi, 4
0x1402e3941: mov rdi, qword ptr [rdi + rsi + 0x10]
0x1402e3946: jmp 0x1402e394a
0x1402e3948: xor edi, edi
0x1402e394a: xor r15d, r15d
0x1402e394d: mov r12d, r15d
0x1402e3950: inc r15d
0x1402e3953: mov rsi, r12
0x1402e3956: shl rsi, 4
0x1402e395a: cmp byte ptr [r14 + rsi], 7
0x1402e395f: jne 0x1402e385c
0x1402e3965: add rsi, r14
0x1402e3968: cmp byte ptr [rsi + 1], r9b
0x1402e396c: jne 0x1402e385c
0x1402e3972: imul rdx, r12, 0x68
0x1402e3976: add r13, rdx
0x1402e3979: shl r12, 5
0x1402e397d: add rdi, r12
0x1402e3980: jmp 0x1402e3b0f
0x1402e3985: mov rax, qword ptr [rax + 0x40]
0x1402e3989: mov qword ptr [rbx], rax
0x1402e398c: jmp 0x1402e43ba
0x1402e3991: mov r15d, 8
0x1402e3997: xor edi, edi
0x1402e3999: xor r12d, r12d
0x1402e399c: xor ebx, ebx
0x1402e399e: mov qword ptr [rbp + 0xe0], 0
0x1402e39a9: xor r14d, r14d
0x1402e39ac: cmp r12d, ebx
0x1402e39af: jne 0x1402e3aca
0x1402e39b5: mov r12, qword ptr [rbp + 0xe8]
0x1402e39bc: nop dword ptr [rax]
0x1402e39c0: cmp r10, r11
0x1402e39c3: je 0x1402e3b44
0x1402e39c9: mov esi, dword ptr [r10]
0x1402e39cc: add r10, 4
0x1402e39d0: mov r15, qword ptr [r8 + 0x108]
0x1402e39d7: lea rsi, [rsi + rsi*4]
0x1402e39db: shl rsi, 5
0x1402e39df: mov rbx, qword ptr [r15 + rsi + 0x58]
0x1402e39e4: test rbx, rbx
0x1402e39e7: je 0x1402e39c0
0x1402e39e9: add r15, rsi
0x1402e39ec: mov esi, dword ptr [r15 + 0x94]
0x1402e39f3: mov r14, qword ptr [r8 + 0x1a8]
0x1402e39fa: lea r12, [rsi + rsi*8]
0x1402e39fe: lea rdi, [r14 + r12*8]
0x1402e3a02: mov rsi, qword ptr [rdx + 0x110]
0x1402e3a09: mov r12, qword ptr [r14 + r12*8 + 0x40]
0x1402e3a0e: cmp rsi, r12
0x1402e3a11: jae 0x1402e3a42
0x1402e3a13: mov r14, qword ptr [rdi + 0x38]
0x1402e3a17: mov rsi, qword ptr [r14 + rsi*8]
0x1402e3a1b: test rsi, rsi
0x1402e3a1e: je 0x1402e3a42
0x1402e3a20: mov r14, qword ptr [rdi + 0x18]
0x1402e3a24: not rsi
0x1402e3a27: lea rsi, [rsi + rsi*2]
0x1402e3a2b: shl rsi, 4
0x1402e3a2f: mov r14, qword ptr [r14 + rsi + 0x10]
0x1402e3a34: mov rsi, qword ptr [rdx + 0x118]
0x1402e3a3b: cmp rsi, r12
0x1402e3a3e: jb 0x1402e3a51
0x1402e3a40: jmp 0x1402e3a88
0x1402e3a42: xor r14d, r14d
0x1402e3a45: mov rsi, qword ptr [rdx + 0x118]
0x1402e3a4c: cmp rsi, r12
0x1402e3a4f: jae 0x1402e3a88
0x1402e3a51: mov r13, qword ptr [rdi + 0x38]
0x1402e3a55: mov rsi, qword ptr [r13 + rsi*8]
0x1402e3a5a: test rsi, rsi
0x1402e3a5d: je 0x1402e3a88
0x1402e3a5f: mov r13, qword ptr [rdi + 0x18]
0x1402e3a63: not rsi
0x1402e3a66: lea rsi, [rsi + rsi*2]
0x1402e3a6a: shl rsi, 4
0x1402e3a6e: mov r13, qword ptr [r13 + rsi + 0x10]
0x1402e3a73: mov rsi, qword ptr [rdx + 0x120]
0x1402e3a7a: cmp rsi, r12
0x1402e3a7d: mov qword ptr [rbp + 0xe0], r13
0x1402e3a84: jae 0x1402e3ac1
0x1402e3a86: jmp 0x1402e3a9e
0x1402e3a88: xor r13d, r13d
0x1402e3a8b: mov rsi, qword ptr [rdx + 0x120]
0x1402e3a92: cmp rsi, r12
0x1402e3a95: mov qword ptr [rbp + 0xe0], r13
0x1402e3a9c: jae 0x1402e3ac1
0x1402e3a9e: mov r12, qword ptr [rdi + 0x38]
0x1402e3aa2: mov rsi, qword ptr [r12 + rsi*8]
0x1402e3aa6: test rsi, rsi
0x1402e3aa9: je 0x1402e3ac1
0x1402e3aab: mov rdi, qword ptr [rdi + 0x18]
0x1402e3aaf: not rsi
0x1402e3ab2: lea rsi, [rsi + rsi*2]
0x1402e3ab6: shl rsi, 4
0x1402e3aba: mov rdi, qword ptr [rdi + rsi + 0x10]
0x1402e3abf: jmp 0x1402e3ac3
0x1402e3ac1: xor edi, edi
0x1402e3ac3: mov r15, qword ptr [r15 + 0x50]
0x1402e3ac7: xor r12d, r12d
0x1402e3aca: mov esi, r12d
0x1402e3acd: shl rsi, 4
0x1402e3ad1: inc r12d
0x1402e3ad4: mov esi, dword ptr [r15 + rsi + 8]
0x1402e3ad9: not esi
0x1402e3adb: mov r13, rsi
0x1402e3ade: shl r13, 4
0x1402e3ae2: cmp byte ptr [r14 + r13], 7
0x1402e3ae7: jne 0x1402e39ac
0x1402e3aed: add r13, r14
0x1402e3af0: cmp byte ptr [r13 + 1], r9b
0x1402e3af4: jne 0x1402e39ac
0x1402e3afa: imul rdx, rsi, 0x68
0x1402e3afe: mov r13, qword ptr [rbp + 0xe0]
0x1402e3b05: add r13, rdx
0x1402e3b08: shl rsi, 5
0x1402e3b0c: add rdi, rsi
0x1402e3b0f: movsd xmm0, qword ptr [r13 + 0x30]
0x1402e3b15: movsd xmm1, qword ptr [rdi + 0x10]
0x1402e3b1a: mulps xmm0, xmmword ptr [rip + 0x5f77d3f]
0x1402e3b21: addsubps xmm1, xmm0
0x1402e3b25: movss xmm0, dword ptr [r13 + 0x64]
0x1402e3b2b: movsldup xmm0, xmm0
0x1402e3b2f: mulps xmm0, xmm1
0x1402e3b32: mov byte ptr [rcx + 0x18], 1
0x1402e3b36: mov edx, 1
0x1402e3b3b: mov r12, qword ptr [rbp + 0xe8]
0x1402e3b42: jmp 0x1402e3b4f
0x1402e3b44: mov byte ptr [rcx + 0x18], 1
0x1402e3b48: mov edx, dword ptr [rcx]
0x1402e3b4a: movsd xmm0, qword ptr [rcx + 4]
0x1402e3b4f: mov dword ptr [rcx], edx
0x1402e3b51: movlps qword ptr [rcx + 4], xmm0
0x1402e3b55: mov rcx, qword ptr [r12]
0x1402e3b59: xor r10d, r10d
0x1402e3b5c: mov rdx, rcx
0x1402e3b5f: sub rdx, qword ptr [rax + 0x18]
0x1402e3b63: cmovb rdx, r10
0x1402e3b67: sub rcx, qword ptr [rax + 0x38]
0x1402e3b6b: cmovb rcx, r10
0x1402e3b6f: imul r14, rdx, 0x58
0x1402e3b73: add r14, qword ptr [rax + 8]
0x1402e3b77: mov r8, qword ptr [rax + 0x10]
0x1402e3b7b: sub r8, rdx
0x1402e3b7e: cmovb r8, r10
0x1402e3b82: mov rdx, qword ptr [rax + 0x30]
0x1402e3b86: mov r9d, 8
0x1402e3b8c: cmovb r14, r9
0x1402e3b90: imul rbx, rcx, 0x58
0x1402e3b94: add rbx, qword ptr [rax + 0x28]
0x1402e3b98: sub rdx, rcx
0x1402e3b9b: cmovb rbx, r9
0x1402e3b9f: cmovb rdx, r10
0x1402e3ba3: mov rax, qword ptr [rax + 0x40]
0x1402e3ba7: sub rax, rdx
0x1402e3baa: sub rax, r8
0x1402e3bad: mov qword ptr [r12], rax
0x1402e3bb1: imul rax, r8, 0x58
0x1402e3bb5: add rax, r14
0x1402e3bb8: mov qword ptr [rbp + 0xe0], rax
0x1402e3bbf: imul rax, rdx, 0x58
0x1402e3bc3: add rax, rbx
0x1402e3bc6: mov qword ptr [rbp + 0x90], rax
0x1402e3bcd: mov rax, qword ptr [rbp + 0x100]
0x1402e3bd4: lea rcx, [rax + 0x130]
0x1402e3bdb: mov qword ptr [rbp + 0xa0], rcx
0x1402e3be2: lea rcx, [rax + 0x118]
0x1402e3be9: mov qword ptr [rbp + 0xa8], rcx
0x1402e3bf0: lea rcx, [rax + 0xe8]
0x1402e3bf7: mov qword ptr [rbp + 0xb0], rcx
0x1402e3bfe: lea rcx, [rax + 0x100]
0x1402e3c05: mov qword ptr [rbp + 0xb8], rcx
0x1402e3c0c: lea rcx, [rax + 0xd0]
0x1402e3c13: mov qword ptr [rbp + 0xc0], rcx
0x1402e3c1a: add rax, 0x160
0x1402e3c20: mov qword ptr [rbp + 0x98], rax
0x1402e3c27: xor esi, esi
0x1402e3c29: jmp 0x1402e3c3f
0x1402e3c2b: movzx ecx, byte ptr [rax + 0x28]
0x1402e3c2f: cmp cl, 0xff
0x1402e3c32: jne 0x1402e3ea2
0x1402e3c38: mov r12, qword ptr [rbp + 0xe8]
0x1402e3c3f: test r14, r14
0x1402e3c42: je 0x1402e3c70
0x1402e3c44: cmp r14, qword ptr [rbp + 0xe0]
0x1402e3c4b: je 0x1402e3c70
0x1402e3c4d: lea rcx, [r14 + 0x58]
0x1402e3c51: mov rax, r14
0x1402e3c54: inc qword ptr [r12]
0x1402e3c58: mov r14, rcx
0x1402e3c5b: cmp byte ptr [rax + 0x54], 0
0x1402e3c5f: jne 0x1402e3c3f
0x1402e3c61: jmp 0x1402e3c9c
0x1402e3c63: nop word ptr cs:[rax + rax]
0x1402e3c70: test rbx, rbx
0x1402e3c73: je 0x1402e4397
0x1402e3c79: cmp rbx, qword ptr [rbp + 0x90]
0x1402e3c80: je 0x1402e4397
0x1402e3c86: mov rax, rbx
0x1402e3c89: add rbx, 0x58
0x1402e3c8d: xor ecx, ecx
0x1402e3c8f: inc qword ptr [r12]
0x1402e3c93: mov r14, rcx
0x1402e3c96: cmp byte ptr [rax + 0x54], 0
0x1402e3c9a: jne 0x1402e3c3f
0x1402e3c9c: cmp byte ptr [rbp + 0x118], 0
0x1402e3ca3: je 0x1402e3cea
0x1402e3ca5: cmp dword ptr [rax + 8], 0x11
0x1402e3ca9: mov rcx, qword ptr [rbp + 0xf0]
0x1402e3cb0: mov edx, dword ptr [rbp + 0x10c]
0x1402e3cb6: mov dword ptr [rcx], edx
0x1402e3cb8: je 0x1402e3dfd
0x1402e3cbe: xor r13d, r13d
0x1402e3cc1: mov ecx, 0xa0
0x1402e3cc6: mov qword ptr [rbp + 0x110], rcx
0x1402e3ccd: mov ecx, 5
0x1402e3cd2: mov r12, qword ptr [rbp + 0x98]
0x1402e3cd9: mov edi, dword ptr [rax + 8]
0x1402e3cdc: cmp edi, 1
0x1402e3cdf: je 0x1402e3c2b
0x1402e3ce5: jmp 0x1402e3db1
0x1402e3cea: mov rcx, qword ptr [rbp + 0x100]
0x1402e3cf1: movzx ecx, byte ptr [rcx + 0x1ba]
0x1402e3cf8: lea rdx, [rip + 0x5f96d75]
0x1402e3cff: movsxd rcx, dword ptr [rdx + rcx*4]
0x1402e3d03: add rcx, rdx
0x1402e3d06: jmp rcx
0x1402e3d08: mov ecx, 0x20
0x1402e3d0d: mov qword ptr [rbp + 0x110], rcx
0x1402e3d14: xor r13d, r13d
0x1402e3d17: xor ecx, ecx
0x1402e3d19: mov r12, qword ptr [rbp + 0xc0]
0x1402e3d20: jmp 0x1402e3d94
0x1402e3d22: mov ecx, 5
0x1402e3d27: mov qword ptr [rbp + 0x110], rcx
0x1402e3d2e: mov ecx, 3
0x1402e3d33: mov r13b, 1
0x1402e3d36: mov r12, qword ptr [rbp + 0xa8]
0x1402e3d3d: jmp 0x1402e3d94
0x1402e3d3f: mov ecx, 0x78
0x1402e3d44: mov qword ptr [rbp + 0x110], rcx
0x1402e3d4b: mov ecx, 1
0x1402e3d50: xor r13d, r13d
0x1402e3d53: mov r12, qword ptr [rbp + 0xb8]
0x1402e3d5a: jmp 0x1402e3d94
0x1402e3d5c: mov ecx, 0x20
0x1402e3d61: mov qword ptr [rbp + 0x110], rcx
0x1402e3d68: mov ecx, 2
0x1402e3d6d: xor r13d, r13d
0x1402e3d70: mov r12, qword ptr [rbp + 0xb0]
0x1402e3d77: jmp 0x1402e3d94
0x1402e3d79: mov ecx, 0x20
0x1402e3d7e: mov qword ptr [rbp + 0x110], rcx
0x1402e3d85: mov ecx, 4
0x1402e3d8a: xor r13d, r13d
0x1402e3d8d: mov r12, qword ptr [rbp + 0xa0]
0x1402e3d94: mov rdx, qword ptr [rbp + 0xf0]
0x1402e3d9b: mov r8d, dword ptr [rbp + 0x10c]
0x1402e3da2: mov dword ptr [rdx], r8d
0x1402e3da5: mov edi, dword ptr [rax + 8]
0x1402e3da8: cmp edi, 1
0x1402e3dab: je 0x1402e3c2b
0x1402e3db1: mov dword ptr [rbp - 0x58], 0xffffffff
0x1402e3db8: cmp edi, 0x1c
0x1402e3dbb: ja 0x1402e3c38
0x1402e3dc1: mov r8d, edi
0x1402e3dc4: lea r9, [rip + 0x5f96cc5]
0x1402e3dcb: movsxd r8, dword ptr [r9 + r8*4]
0x1402e3dcf: add r8, r9
0x1402e3dd2: jmp r8
0x1402e3dd5: test r13b, r13b
0x1402e3dd8: jne 0x1402e3c38
0x1402e3dde: mov rcx, qword ptr [r12 + 8]
0x1402e3de3: mov rdx, qword ptr [r12 + 0x10]
0x1402e3de8: cmp rdx, 0x20
0x1402e3dec: jae 0x1402e42c1
0x1402e3df2: call 0x14603cbd0
0x1402e3df7: nop 
0x1402e3df8: jmp 0x1402e42c7
0x1402e3dfd: mov rax, qword ptr [rbp + 0x100]
0x1402e3e04: mov rcx, qword ptr [rax + 0x160]
0x1402e3e0b: mov qword ptr [rbp + 0x110], rcx
0x1402e3e12: mov rcx, qword ptr [rax + 0x168]
0x1402e3e19: mov r15, qword ptr [rax + 0x170]
0x1402e3e20: mov qword ptr [rax + 0x160], 0
0x1402e3e2b: mov qword ptr [rax + 0x168], 1
0x1402e3e36: mov qword ptr [rax + 0x170], 0
0x1402e3e41: mov byte ptr [rbp + 0x11f], 0
0x1402e3e48: mov qword ptr [rbp + 0xf8], rcx
0x1402e3e4f: mov rdx, r15
0x1402e3e52: call 0x140207170
0x1402e3e57: nop 
0x1402e3e58: test rdx, rdx
0x1402e3e5b: je 0x1402e4297
0x1402e3e61: mov rax, qword ptr [rbp + 0x110]
0x1402e3e68: mov qword ptr [rbp - 0x50], rax
0x1402e3e6c: mov rax, qword ptr [rbp + 0xf8]
0x1402e3e73: mov qword ptr [rbp - 0x48], rax
0x1402e3e77: mov qword ptr [rbp - 0x40], r15
0x1402e3e7b: mov dword ptr [rbp - 0x58], 0x1b
0x1402e3e82: mov byte ptr [rbp + 0x11f], 1
0x1402e3e89: mov rcx, qword ptr [rbp + 0xd0]
0x1402e3e90: lea rdx, [rbp - 0x58]
0x1402e3e94: call 0x140246550
0x1402e3e99: nop 
0x1402e3e9a: mov sil, 1
0x1402e3e9d: jmp 0x1402e3c3f
0x1402e3ea2: cmp cl, 0x19
0x1402e3ea5: jne 0x1402e3eb6
0x1402e3ea7: mov r8, qword ptr [rax + 0x30]
0x1402e3eab: lock inc qword ptr [r8]
0x1402e3eaf: jg 0x1402e3ed0
0x1402e3eb1: jmp 0x1402e43ea
0x1402e3eb6: mov r8d, dword ptr [rax + 0x29]
0x1402e3eba: mov r9d, dword ptr [rax + 0x2c]
0x1402e3ebe: mov dword ptr [rbp + 0xdb], r9d
0x1402e3ec5: mov dword ptr [rbp + 0xd8], r8d
0x1402e3ecc: mov r8, qword ptr [rax + 0x30]
0x1402e3ed0: mov r9, qword ptr [rax + 0x38]
0x1402e3ed4: mov r10d, dword ptr [rbp + 0xd8]
0x1402e3edb: mov r11d, dword ptr [rbp + 0xdb]
0x1402e3ee2: lea rsi, [rbp - 0x4f]
0x1402e3ee6: mov dword ptr [rsi + 3], r11d
0x1402e3eea: mov dword ptr [rsi], r10d
0x1402e3eed: mov dword ptr [rbp - 0x58], 0
0x1402e3ef4: mov byte ptr [rbp - 0x50], cl
0x1402e3ef7: mov qword ptr [rbp - 0x48], r8
0x1402e3efb: mov qword ptr [rbp - 0x40], r9
0x1402e3eff: jmp 0x1402e3f98
0x1402e3f04: mov rax, qword ptr [r12 + 0x10]
0x1402e3f09: test rax, rax
0x1402e3f0c: je 0x1402e432e
0x1402e3f12: mov r9, qword ptr [r12 + 8]
0x1402e3f17: mov rcx, 0xffffffffffffffff
0x1402e3f1e: cmp byte ptr [r9 + rax - 1], 0
0x1402e3f24: jns 0x1402e4326
0x1402e3f2a: movzx edx, byte ptr [r9 + rax - 2]
0x1402e3f30: cmp dl, 0xbf
0x1402e3f33: jg 0x1402e42f3
0x1402e3f39: movzx r8d, byte ptr [r9 + rax - 3]
0x1402e3f3f: cmp r8b, 0xbf
0x1402e3f43: jg 0x1402e42f8
0x1402e3f49: movzx r9d, byte ptr [r9 + rax - 4]
0x1402e3f4f: and r9d, 7
0x1402e3f53: shl r9d, 6
0x1402e3f57: and r8d, 0x3f
0x1402e3f5b: or r8d, r9d
0x1402e3f5e: jmp 0x1402e42fc
0x1402e3f63: shl ecx, 3
0x1402e3f66: movabs rax, 0x60405010302
0x1402e3f70: shr rax, cl
0x1402e3f73: mov rcx, qword ptr [rbp + 0xf0]
0x1402e3f7a: mov edx, dword ptr [rbp + 0x10c]
0x1402e3f80: mov dword ptr [rcx], edx
0x1402e3f82: mov rcx, qword ptr [rbp + 0x100]
0x1402e3f89: mov byte ptr [rcx + 0x1ba], al
0x1402e3f8f: jmp 0x1402e432e
0x1402e3f94: movzx ecx, byte ptr [rax + 0x10]
0x1402e3f98: movzx edx, cl
0x1402e3f9b: lea r8, [rdx - 0x17]
0x1402e3f9f: cmp dl, 0x18
0x1402e3fa2: mov r9d, 0
0x1402e3fa8: cmovb r8, r9
0x1402e3fac: test r8, r8
0x1402e3faf: je 0x1402e3fda
0x1402e3fb1: lea rcx, [rax + 0x18]
0x1402e3fb5: add rax, 0x20
0x1402e3fb9: cmp r8d, 1
0x1402e3fbd: jne 0x1402e3ff7
0x1402e3fbf: cmp edi, 1
0x1402e3fc2: lea rdx, [rbp - 0x48]
0x1402e3fc6: cmove rcx, rdx
0x1402e3fca: mov rsi, qword ptr [rcx]
0x1402e3fcd: lea rcx, [rbp - 0x40]
0x1402e3fd1: cmove rax, rcx
0x1402e3fd5: mov rdx, qword ptr [rax]
0x1402e3fd8: jmp 0x1402e4014
0x1402e3fda: cmp cl, 0x18
0x1402e3fdd: jae 0x1402e43d5
0x1402e3fe3: add rax, 0x11
0x1402e3fe7: cmp edi, 1
0x1402e3fea: lea rcx, [rbp - 0x4f]
0x1402e3fee: cmove rax, rcx
0x1402e3ff2: mov rsi, rax
0x1402e3ff5: jmp 0x1402e4014
0x1402e3ff7: cmp edi, 1
0x1402e3ffa: lea rdx, [rbp - 0x48]
0x1402e3ffe: cmove rcx, rdx
0x1402e4002: mov rsi, qword ptr [rcx]
0x1402e4005: lea rcx, [rbp - 0x40]
0x1402e4009: cmove rax, rcx
0x1402e400d: mov rdx, qword ptr [rax]
0x1402e4010: add rsi, 0x10
0x1402e4014: add rdx, rsi
0x1402e4017: mov qword ptr [rbp + 0xf8], rdx
0x1402e401e: jmp 0x1402e4040
0x1402e4020: or cl, 0xc0
0x1402e4023: mov byte ptr [rdx + r15], cl
0x1402e4027: mov byte ptr [rdx + r15 + 1], al
0x1402e402c: mov eax, 2
0x1402e4031: add r15, rax
0x1402e4034: mov qword ptr [r12 + 0x10], r15
0x1402e4039: nop dword ptr [rax]
0x1402e4040: cmp rsi, qword ptr [rbp + 0xf8]
0x1402e4047: je 0x1402e432e
0x1402e404d: movzx edx, byte ptr [rsi]
0x1402e4050: movzx eax, dl
0x1402e4053: test al, al
0x1402e4055: js 0x1402e4060
0x1402e4057: inc rsi
0x1402e405a: jmp 0x1402e40c0
0x1402e405c: nop dword ptr [rax]
0x1402e4060: mov ecx, eax
0x1402e4062: and ecx, 0x1f
0x1402e4065: movzx r8d, byte ptr [rsi + 1]
0x1402e406a: and r8d, 0x3f
0x1402e406e: cmp al, 0xdf
0x1402e4070: jbe 0x1402e40a1
0x1402e4072: movzx eax, byte ptr [rsi + 2]
0x1402e4076: shl r8d, 6
0x1402e407a: and eax, 0x3f
0x1402e407d: or eax, r8d
0x1402e4080: cmp dl, 0xf0
0x1402e4083: jb 0x1402e40af
0x1402e4085: movzx edx, byte ptr [rsi + 3]
0x1402e4089: add rsi, 4
0x1402e408d: and ecx, 7
0x1402e4090: shl ecx, 0x12
0x1402e4093: shl eax, 6
0x1402e4096: and edx, 0x3f
0x1402e4099: or edx, eax
0x1402e409b: or edx, ecx
0x1402e409d: mov eax, edx
0x1402e409f: jmp 0x1402e40c0
0x1402e40a1: add rsi, 2
0x1402e40a5: shl ecx, 6
0x1402e40a8: or ecx, r8d
0x1402e40ab: mov eax, ecx
0x1402e40ad: jmp 0x1402e40c0
0x1402e40af: add rsi, 3
0x1402e40b3: shl ecx, 0xc
0x1402e40b6: or eax, ecx
0x1402e40b8: nop dword ptr [rax + rax]
0x1402e40c0: cmp eax, 0x20
0x1402e40c3: setb cl
0x1402e40c6: lea edx, [rax - 0x7f]
0x1402e40c9: cmp edx, 0x21
0x1402e40cc: setb dl
0x1402e40cf: or dl, cl
0x1402e40d1: jne 0x1402e4040
0x1402e40d7: lea ecx, [rax - 0x61]
0x1402e40da: mov edi, eax
0x1402e40dc: and edi, 0x5f
0x1402e40df: cmp ecx, 0x1a
0x1402e40e2: cmovae edi, eax
0x1402e40e5: test r13b, r13b
0x1402e40e8: cmove edi, eax
0x1402e40eb: mov rcx, qword ptr [r12 + 8]
0x1402e40f0: mov rdx, qword ptr [r12 + 0x10]
0x1402e40f5: cmp rdx, 0x20
0x1402e40f9: jae 0x1402e4110
0x1402e40fb: call 0x14603cbd0
0x1402e4100: nop 
0x1402e4101: jmp 0x1402e4116
0x1402e4103: nop word ptr cs:[rax + rax]
0x1402e4110: call 0x14603c5b0
0x1402e4115: nop 
0x1402e4116: cmp rax, qword ptr [rbp + 0x110]
0x1402e411d: jae 0x1402e4040
0x1402e4123: test r13b, r13b
0x1402e4126: je 0x1402e4148
0x1402e4128: lea eax, [rdi - 0x30]
0x1402e412b: cmp eax, 0xa
0x1402e412e: jb 0x1402e4141
0x1402e4130: mov eax, edi
0x1402e4132: and eax, 0xffffffdf
0x1402e4135: add eax, -0x41
0x1402e4138: cmp eax, 0x19
0x1402e413b: ja 0x1402e4040
0x1402e4141: mov r15, qword ptr [r12 + 0x10]
0x1402e4146: jmp 0x1402e4155
0x1402e4148: mov r15, qword ptr [r12 + 0x10]
0x1402e414d: cmp edi, 0x80
0x1402e4153: jae 0x1402e4172
0x1402e4155: cmp qword ptr [r12], r15
0x1402e4159: je 0x1402e421a
0x1402e415f: mov rax, qword ptr [r12 + 8]
0x1402e4164: mov byte ptr [rax + r15], dil
0x1402e4168: mov eax, 1
0x1402e416d: jmp 0x1402e4031
0x1402e4172: cmp edi, 0x10000
0x1402e4178: mov r8d, 4
0x1402e417e: sbb r8, 0
0x1402e4182: cmp edi, 0x800
0x1402e4188: mov eax, 2
0x1402e418d: cmovb r8, rax
0x1402e4191: mov rax, qword ptr [r12]
0x1402e4195: sub rax, r15
0x1402e4198: cmp r8, rax
0x1402e419b: ja 0x1402e4240
0x1402e41a1: mov eax, edi
0x1402e41a3: and al, 0x3f
0x1402e41a5: or al, 0x80
0x1402e41a7: mov ecx, edi
0x1402e41a9: shr ecx, 6
0x1402e41ac: mov rdx, qword ptr [r12 + 8]
0x1402e41b1: cmp edi, 0x800
0x1402e41b7: jb 0x1402e4020
0x1402e41bd: and cl, 0x3f
0x1402e41c0: or cl, 0x80
0x1402e41c3: mov r8d, edi
0x1402e41c6: shr r8d, 0xc
0x1402e41ca: cmp edi, 0xffff
0x1402e41d0: ja 0x1402e41ee
0x1402e41d2: or r8b, 0xe0
0x1402e41d6: mov byte ptr [rdx + r15], r8b
0x1402e41da: mov byte ptr [rdx + r15 + 1], cl
0x1402e41df: mov byte ptr [rdx + r15 + 2], al
0x1402e41e4: mov eax, 3
0x1402e41e9: jmp 0x1402e4031
0x1402e41ee: and r8b, 0x3f
0x1402e41f2: or r8b, 0x80
0x1402e41f6: shr edi, 0x12
0x1402e41f9: or dil, 0xf0
0x1402e41fd: mov byte ptr [rdx + r15], dil
0x1402e4201: mov byte ptr [rdx + r15 + 1], r8b
0x1402e4206: mov byte ptr [rdx + r15 + 2], cl
0x1402e420b: mov byte ptr [rdx + r15 + 3], al
0x1402e4210: mov eax, 4
0x1402e4215: jmp 0x1402e4031
0x1402e421a: mov qword ptr [rsp + 0x20], 1
0x1402e4223: mov r8d, 1
0x1402e4229: mov r9d, 1
0x1402e422f: mov rcx, r12
0x1402e4232: mov rdx, r15
0x1402e4235: call 0x146061b30
0x1402e423a: nop 
0x1402e423b: jmp 0x1402e415f
0x1402e4240: mov qword ptr [rsp + 0x20], 1
0x1402e4249: mov r9d, 1
0x1402e424f: mov rcx, r12
0x1402e4252: mov rdx, r15
0x1402e4255: call 0x146061b30
0x1402e425a: nop 
0x1402e425b: jmp 0x1402e41a1
0x1402e4260: mov rcx, qword ptr [rbp + 0x100]
0x1402e4267: movzx r9d, byte ptr [rcx + 0x1b9]
0x1402e426f: mov rax, qword ptr [rbp + 0xf0]
0x1402e4276: mov edx, dword ptr [rbp + 0x10c]
0x1402e427c: mov dword ptr [rax], edx
0x1402e427e: mov rdx, qword ptr [rbp + 0xd0]
0x1402e4285: mov r8, qword ptr [rbp + 0xc8]
0x1402e428c: call 0x1402be2d0
0x1402e4291: nop 
0x1402e4292: jmp 0x1402e432e
0x1402e4297: mov sil, 1
0x1402e429a: mov rdx, qword ptr [rbp + 0x110]
0x1402e42a1: test rdx, rdx
0x1402e42a4: je 0x1402e3c3f
0x1402e42aa: mov r8d, 1
0x1402e42b0: mov rcx, qword ptr [rbp + 0xf8]
0x1402e42b7: call 0x1400021d0
0x1402e42bc: jmp 0x1402e3c3f
0x1402e42c1: call 0x14603c5b0
0x1402e42c6: nop 
0x1402e42c7: cmp rax, qword ptr [rbp + 0x110]
0x1402e42ce: jae 0x1402e432e
0x1402e42d0: mov r15, qword ptr [r12 + 0x10]
0x1402e42d5: cmp qword ptr [r12], r15
0x1402e42d9: je 0x1402e4371
0x1402e42df: mov rax, qword ptr [r12 + 8]
0x1402e42e4: mov byte ptr [rax + r15], 0x20
0x1402e42e9: inc r15
0x1402e42ec: mov qword ptr [r12 + 0x10], r15
0x1402e42f1: jmp 0x1402e432e
0x1402e42f3: and edx, 0x1f
0x1402e42f6: jmp 0x1402e4306
0x1402e42f8: and r8d, 0xf
0x1402e42fc: shl r8d, 6
0x1402e4300: and edx, 0x3f
0x1402e4303: or edx, r8d
0x1402e4306: cmp edx, 2
0x1402e4309: jb 0x1402e4326
0x1402e430b: mov rcx, 0xfffffffffffffffe
0x1402e4312: cmp edx, 0x20
0x1402e4315: jb 0x1402e4326
0x1402e4317: xor ecx, ecx
0x1402e4319: cmp edx, 0x400
0x1402e431f: setb cl
0x1402e4322: or rcx, 0xfffffffffffffffc
0x1402e4326: add rcx, rax
0x1402e4329: mov qword ptr [r12 + 0x10], rcx
0x1402e432e: mov eax, dword ptr [rbp - 0x58]
0x1402e4331: cmp eax, -1
0x1402e4334: mov r12, qword ptr [rbp + 0xe8]
0x1402e433b: je 0x1402e4369
0x1402e433d: test eax, eax
0x1402e433f: je 0x1402e4350
0x1402e4341: cmp eax, 1
0x1402e4344: jne 0x1402e4369
0x1402e4346: cmp byte ptr [rbp - 0x50], 0x19
0x1402e434a: ja 0x1402e4369
0x1402e434c: je 0x1402e4356
0x1402e434e: jmp 0x1402e4369
0x1402e4350: cmp byte ptr [rbp - 0x50], 0x19
0x1402e4354: jb 0x1402e4369
0x1402e4356: mov rax, qword ptr [rbp - 0x48]
0x1402e435a: lock dec qword ptr [rax]
0x1402e435e: jne 0x1402e4369
0x1402e4360: lea rcx, [rbp - 0x48]
0x1402e4364: call 0x14267f1e0
0x1402e4369: mov sil, 1
0x1402e436c: jmp 0x1402e3c3f
0x1402e4371: mov qword ptr [rsp + 0x20], 1
0x1402e437a: mov r8d, 1
0x1402e4380: mov r9d, 1
0x1402e4386: mov rcx, r12
0x1402e4389: mov rdx, r15
0x1402e438c: call 0x146061b30
0x1402e4391: nop 
0x1402e4392: jmp 0x1402e42df
0x1402e4397: test sil, 1
0x1402e439b: je 0x1402e43ba
0x1402e439d: mov rax, qword ptr [rbp + 0xf0]
0x1402e43a4: mov ecx, dword ptr [rbp + 0x10c]
0x1402e43aa: mov dword ptr [rax], ecx
0x1402e43ac: mov rax, qword ptr [rbp + 0x100]
0x1402e43b3: inc qword ptr [rax + 0x1a8]
0x1402e43ba: add rsp, 0x1a8
0x1402e43c1: pop rbx
0x1402e43c2: pop rdi
0x1402e43c3: pop rsi
0x1402e43c4: pop r12
0x1402e43c6: pop r13
0x1402e43c8: pop r14
0x1402e43ca: pop r15
0x1402e43cc: pop rbp
0x1402e43cd: ret 
0x1402e43ce: mov al, 1
0x1402e43d0: jmp 0x1402e3787
0x1402e43d5: lea r9, [rip + 0x5f94224]
0x1402e43dc: mov r8d, 0x17
0x1402e43e2: xor ecx, ecx
0x1402e43e4: call 0x146208f10
0x1402e43e9: nop 
0x1402e43ea: ud2 
