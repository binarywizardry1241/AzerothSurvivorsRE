0x1402ef2c0: push r15
0x1402ef2c2: push r14
0x1402ef2c4: push r13
0x1402ef2c6: push r12
0x1402ef2c8: push rsi
0x1402ef2c9: push rdi
0x1402ef2ca: push rbp
0x1402ef2cb: push rbx
0x1402ef2cc: sub rsp, 0x158
0x1402ef2d3: movaps xmmword ptr [rsp + 0x140], xmm7
0x1402ef2db: movaps xmmword ptr [rsp + 0x130], xmm6
0x1402ef2e3: mov rbx, r8
0x1402ef2e6: mov rdi, rdx
0x1402ef2e9: mov rsi, rcx
0x1402ef2ec: mov rbp, qword ptr [rcx]
0x1402ef2ef: mov rax, qword ptr [rcx + 0x28]
0x1402ef2f3: mov qword ptr [rsp + 0xd0], rbp
0x1402ef2fb: movups xmm0, xmmword ptr [rcx + 8]
0x1402ef2ff: movups xmmword ptr [rsp + 0xd8], xmm0
0x1402ef307: movups xmm0, xmmword ptr [rcx + 0x18]
0x1402ef30b: movups xmmword ptr [rsp + 0xe8], xmm0
0x1402ef313: mov qword ptr [rsp + 0xf8], rax
0x1402ef31b: lea rcx, [rip + 0x5c3879a]
0x1402ef322: mov edx, 0xa
0x1402ef327: call 0x1458dfee0
0x1402ef32c: mov r15, rdx
0x1402ef32f: test rdx, rdx
0x1402ef332: jns 0x1402ef344
0x1402ef334: xor r13d, r13d
0x1402ef337: mov rcx, r13
0x1402ef33a: mov rdx, r15
0x1402ef33d: call 0x145eb6fcb
0x1402ef342: ud2
0x1402ef344: je 0x1402ef39b
0x1402ef346: mov r14, rax
0x1402ef349: call 0x140002200
0x1402ef34e: mov r13d, 1
0x1402ef354: mov edx, 1
0x1402ef359: mov rcx, r15
0x1402ef35c: call 0x1400021c0
0x1402ef361: test rax, rax
0x1402ef364: je 0x1402ef337
0x1402ef366: mov r12, rax
0x1402ef369: mov rcx, rax
0x1402ef36c: mov rdx, r14
0x1402ef36f: mov r8, r15
0x1402ef372: call 0x145d145fb
0x1402ef377: movzx r14d, byte ptr [rdi]
0x1402ef37b: cmp r14b, 1
0x1402ef37f: jne 0x1402ef3ab
0x1402ef381: mov eax, dword ptr [rdi + 1]
0x1402ef384: mov ecx, dword ptr [rdi + 4]
0x1402ef387: mov dword ptr [rsp + 0x27], ecx
0x1402ef38b: mov dword ptr [rsp + 0x24], eax
0x1402ef38f: mov r13, qword ptr [rdi + 8]
0x1402ef393: movzx eax, byte ptr [rdi + 0x10]
0x1402ef397: mov cl, 1
0x1402ef399: jmp 0x1402ef3bc
0x1402ef39b: mov r12d, 1
0x1402ef3a1: movzx r14d, byte ptr [rdi]
0x1402ef3a5: cmp r14b, 1
0x1402ef3a9: je 0x1402ef381
0x1402ef3ab: mov r13, qword ptr [rdi + 8]
0x1402ef3af: lock inc qword ptr [r13]
0x1402ef3b4: jle 0x1402ef5f5
0x1402ef3ba: xor ecx, ecx
0x1402ef3bc: lea rdx, [rsp + 0xd8]
0x1402ef3c4: movups xmm0, xmmword ptr [rip + 0x5c35289]
0x1402ef3cb: movups xmmword ptr [rsp + 0x34], xmm0
0x1402ef3d0: mov dword ptr [rsp + 0x44], 0x3f800000
0x1402ef3d8: mov qword ptr [rsp + 0x50], r15
0x1402ef3dd: mov qword ptr [rsp + 0x58], r12
0x1402ef3e2: mov r12, rdx
0x1402ef3e5: mov qword ptr [rsp + 0x60], r15
0x1402ef3ea: mov qword ptr [rsp + 0x68], 0
0x1402ef3f3: mov qword ptr [rsp + 0x70], 4
0x1402ef3fc: mov qword ptr [rsp + 0x78], 0
0x1402ef405: mov byte ptr [rsp + 0x80], cl
0x1402ef40c: mov ecx, dword ptr [rsp + 0x24]
0x1402ef410: mov edx, dword ptr [rsp + 0x27]
0x1402ef414: mov dword ptr [rsp + 0x81], ecx
0x1402ef41b: mov dword ptr [rsp + 0x84], edx
0x1402ef422: mov qword ptr [rsp + 0x88], r13
0x1402ef42a: mov qword ptr [rsp + 0x90], rax
0x1402ef432: mov dword ptr [rsp + 0x98], 0x41900000
0x1402ef43d: mov word ptr [rsp + 0x9c], 0x190
0x1402ef447: mov byte ptr [rsp + 0x9e], 1
0x1402ef44f: movups xmm0, xmmword ptr [rsp + 0x33]
0x1402ef454: movups xmmword ptr [rsp + 0x9f], xmm0
0x1402ef45c: mov rax, qword ptr [rsp + 0x40]
0x1402ef461: mov qword ptr [rsp + 0xac], rax
0x1402ef469: mov r15d, dword ptr [rip + 0x5c25e70]
0x1402ef470: mov dword ptr [rsp + 0xc4], r15d
0x1402ef478: movups xmm6, xmmword ptr [rip + 0x5c25e51]
0x1402ef47f: movups xmmword ptr [rsp + 0xb4], xmm6
0x1402ef487: movsd xmm7, qword ptr [rip + 0x5bf0ae1]
0x1402ef48f: movsd qword ptr [rsp + 0xc8], xmm7
0x1402ef498: mov qword ptr [rsp + 0x48], rbp
0x1402ef49d: lea rcx, [rsp + 0x100]
0x1402ef4a5: lea r8, [rsp + 0x48]
0x1402ef4aa: mov rdx, r12
0x1402ef4ad: call 0x1402bacf0
0x1402ef4b2: add rbx, 0x48
0x1402ef4b6: lea rcx, [rsp + 0x100]
0x1402ef4be: mov rdx, rbx
0x1402ef4c1: call 0x145ce7810
0x1402ef4c6: test r14b, r14b
0x1402ef4c9: je 0x1402ef4e1
0x1402ef4cb: mov eax, dword ptr [rdi + 1]
0x1402ef4ce: mov ecx, dword ptr [rdi + 4]
0x1402ef4d1: mov dword ptr [rsp + 0x2f], ecx
0x1402ef4d5: mov dword ptr [rsp + 0x2c], eax
0x1402ef4d9: movzx eax, byte ptr [rdi + 0x10]
0x1402ef4dd: mov cl, 1
0x1402ef4df: jmp 0x1402ef4ee
0x1402ef4e1: lock inc qword ptr [r13]
0x1402ef4e6: jle 0x1402ef5f5
0x1402ef4ec: xor ecx, ecx
0x1402ef4ee: mov rdx, qword ptr [rsp + 0x110]
0x1402ef4f6: mov qword ptr [rsp + 0x60], rdx
0x1402ef4fb: movups xmm0, xmmword ptr [rsp + 0x100]
0x1402ef503: movups xmmword ptr [rsp + 0x50], xmm0
0x1402ef508: movups xmm0, xmmword ptr [rip + 0x5c34f5d]
0x1402ef50f: movups xmmword ptr [rsp + 0x34], xmm0
0x1402ef514: mov dword ptr [rsp + 0x44], 0x3f800000
0x1402ef51c: mov qword ptr [rsp + 0x68], 0
0x1402ef525: mov qword ptr [rsp + 0x70], 4
0x1402ef52e: mov qword ptr [rsp + 0x78], 0
0x1402ef537: mov byte ptr [rsp + 0x80], cl
0x1402ef53e: mov ecx, dword ptr [rsp + 0x2c]
0x1402ef542: mov edx, dword ptr [rsp + 0x2f]
0x1402ef546: mov dword ptr [rsp + 0x81], ecx
0x1402ef54d: mov dword ptr [rsp + 0x84], edx
0x1402ef554: mov qword ptr [rsp + 0x88], r13
0x1402ef55c: mov qword ptr [rsp + 0x90], rax
0x1402ef564: mov dword ptr [rsp + 0x98], 0x41f00000
0x1402ef56f: mov word ptr [rsp + 0x9c], 0x190
0x1402ef579: mov byte ptr [rsp + 0x9e], 1
0x1402ef581: mov rax, qword ptr [rsp + 0x40]
0x1402ef586: mov qword ptr [rsp + 0xac], rax
0x1402ef58e: movups xmm0, xmmword ptr [rsp + 0x33]
0x1402ef593: movups xmmword ptr [rsp + 0x9f], xmm0
0x1402ef59b: mov dword ptr [rsp + 0xc4], r15d
0x1402ef5a3: movups xmmword ptr [rsp + 0xb4], xmm6
0x1402ef5ab: movsd qword ptr [rsp + 0xc8], xmm7
0x1402ef5b4: mov qword ptr [rsp + 0x48], rbp
0x1402ef5b9: lea rcx, [rsp + 0x100]
0x1402ef5c1: lea r8, [rsp + 0x48]
0x1402ef5c6: mov rdx, r12
0x1402ef5c9: call 0x1402bacf0
0x1402ef5ce: mov rax, rsi
0x1402ef5d1: movaps xmm6, xmmword ptr [rsp + 0x130]
0x1402ef5d9: movaps xmm7, xmmword ptr [rsp + 0x140]
0x1402ef5e1: add rsp, 0x158
0x1402ef5e8: pop rbx
0x1402ef5e9: pop rbp
0x1402ef5ea: pop rdi
0x1402ef5eb: pop rsi
0x1402ef5ec: pop r12
0x1402ef5ee: pop r13
0x1402ef5f0: pop r14
0x1402ef5f2: pop r15
0x1402ef5f4: ret
0x1402ef5f5: ud2
