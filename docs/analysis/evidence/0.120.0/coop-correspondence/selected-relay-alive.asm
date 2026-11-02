0x145af29b0: push rbp
0x145af29b1: push rsi
0x145af29b2: push rdi
0x145af29b3: sub rsp, 0x40
0x145af29b7: lea rbp, [rsp + 0x40]
0x145af29bc: mov qword ptr [rbp - 8], 0xfffffffffffffffe
0x145af29c4: mov rdi, qword ptr [rcx]
0x145af29c7: mov cl, 1
0x145af29c9: xor eax, eax
0x145af29cb: lock cmpxchg byte ptr [rdi + 0x10], cl
0x145af29d0: jne 0x145af2a1e
0x145af29d2: mov rsi, qword ptr [rip + 0x2a3919f]
0x145af29d9: mov rax, qword ptr [rsi]
0x145af29dc: shl rax, 1
0x145af29df: test rax, rax
0x145af29e2: jne 0x145af2a29
0x145af29e4: xor ecx, ecx
0x145af29e6: movzx eax, byte ptr [rdi + 0x11]
0x145af29ea: cmp dword ptr [rdi + 0xa0], -1
0x145af29f1: je 0x145af2a40
0x145af29f3: mov dword ptr [rbp - 0xc], ecx
0x145af29f6: mov rcx, qword ptr [rdi + 0x88]
0x145af29fd: mov qword ptr [rbp - 0x18], rdi
0x145af2a01: mov rax, qword ptr [rdi + 0x90]
0x145af2a08: call qword ptr [rax + 0x28]
0x145af2a0b: nop
0x145af2a0c: cmp al, 2
0x145af2a0e: setne al
0x145af2a11: mov rdi, qword ptr [rbp - 0x18]
0x145af2a15: mov ecx, dword ptr [rbp - 0xc]
0x145af2a18: test cl, cl
0x145af2a1a: je 0x145af2a46
0x145af2a1c: jmp 0x145af2a51
0x145af2a1e: lea rcx, [rdi + 0x10]
0x145af2a22: call 0x146149410
0x145af2a27: jmp 0x145af29d2
0x145af2a29: call 0x14614a1a0
0x145af2a2e: mov ecx, eax
0x145af2a30: xor cl, 1
0x145af2a33: movzx eax, byte ptr [rdi + 0x11]
0x145af2a37: cmp dword ptr [rdi + 0xa0], -1
0x145af2a3e: jne 0x145af29f3
0x145af2a40: xor eax, eax
0x145af2a42: test cl, cl
0x145af2a44: jne 0x145af2a51
0x145af2a46: mov rcx, qword ptr [rsi]
0x145af2a49: shl rcx, 1
0x145af2a4c: test rcx, rcx
0x145af2a4f: jne 0x145af2a75
0x145af2a51: xor ecx, ecx
0x145af2a53: xchg byte ptr [rdi + 0x10], cl
0x145af2a56: cmp cl, 2
0x145af2a59: je 0x145af2a63
0x145af2a5b: add rsp, 0x40
0x145af2a5f: pop rdi
0x145af2a60: pop rsi
0x145af2a61: pop rbp
0x145af2a62: ret
0x145af2a63: add rdi, 0x10
0x145af2a67: mov rcx, rdi
0x145af2a6a: mov esi, eax
0x145af2a6c: call 0x1461494d0
0x145af2a71: mov eax, esi
0x145af2a73: jmp 0x145af2a5b
0x145af2a75: mov esi, eax
0x145af2a77: call 0x14614a1a0
0x145af2a7c: mov ecx, eax
0x145af2a7e: mov eax, esi
0x145af2a80: test cl, cl
0x145af2a82: jne 0x145af2a51
0x145af2a84: mov byte ptr [rdi + 0x11], 1
0x145af2a88: jmp 0x145af2a51
