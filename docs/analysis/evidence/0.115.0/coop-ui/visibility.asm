00000001402f2930: push r15
00000001402f2932: push r14
00000001402f2934: push r13
00000001402f2936: push r12
00000001402f2938: push rsi
00000001402f2939: push rdi
00000001402f293a: push rbp
00000001402f293b: push rbx
00000001402f293c: sub rsp, 0x138
00000001402f2943: mov rdi, rdx
00000001402f2946: mov rsi, rcx
00000001402f2949: mov r13, qword ptr [rcx]
00000001402f294c: mov rax, qword ptr [rcx + 0x28]
00000001402f2950: mov qword ptr [rsp + 0xd8], r13
00000001402f2958: movups xmm0, xmmword ptr [rcx + 8]
00000001402f295c: movups xmmword ptr [rsp + 0xe0], xmm0
00000001402f2964: movups xmm0, xmmword ptr [rcx + 0x18]
00000001402f2968: movups xmmword ptr [rsp + 0xf0], xmm0
00000001402f2970: mov qword ptr [rsp + 0x100], rax
00000001402f2978: movzx ebp, byte ptr [r8 + 0x130]
00000001402f2980: lea rcx, [rip + 0x5c35224]
00000001402f2987: mov edx, 0xf
00000001402f298c: call 0x1458dfee0
00000001402f2991: mov rbx, rdx
00000001402f2994: test rdx, rdx
00000001402f2997: jns 0x1402f29a9
00000001402f2999: xor r12d, r12d
00000001402f299c: mov rcx, r12
00000001402f299f: mov rdx, rbx
00000001402f29a2: call 0x145eb6fcb
00000001402f29a7: ud2
00000001402f29a9: je 0x1402f29fc
00000001402f29ab: mov r15, rax
00000001402f29ae: call 0x140002200
00000001402f29b3: mov r12d, 1
00000001402f29b9: mov edx, 1
00000001402f29be: mov rcx, rbx
00000001402f29c1: call 0x1400021c0
00000001402f29c6: test rax, rax
00000001402f29c9: je 0x1402f299c
00000001402f29cb: mov r14, rax
00000001402f29ce: mov rcx, rax
00000001402f29d1: mov rdx, r15
00000001402f29d4: mov r8, rbx
00000001402f29d7: call 0x145d145fb
00000001402f29dc: cmp byte ptr [rdi], 1
00000001402f29df: jne 0x1402f2a07
00000001402f29e1: mov eax, dword ptr [rdi + 1]
00000001402f29e4: mov ecx, dword ptr [rdi + 4]
00000001402f29e7: mov dword ptr [rsp + 0x37], ecx
00000001402f29eb: mov dword ptr [rsp + 0x34], eax
00000001402f29ef: mov rax, qword ptr [rdi + 8]
00000001402f29f3: movzx ecx, byte ptr [rdi + 0x10]
00000001402f29f7: mov r8b, 1
00000001402f29fa: jmp 0x1402f2a18
00000001402f29fc: mov r14d, 1
00000001402f2a02: cmp byte ptr [rdi], 1
00000001402f2a05: je 0x1402f29e1
00000001402f2a07: mov rax, qword ptr [rdi + 8]
00000001402f2a0b: lock inc qword ptr [rax]
00000001402f2a0f: jle 0x1402f2b74
00000001402f2a15: xor r8d, r8d
00000001402f2a18: lea rdx, [rsp + 0xe0]
00000001402f2a20: movups xmm0, xmmword ptr [rip + 0x5c31c2d]
00000001402f2a27: movups xmmword ptr [rsp + 0x3c], xmm0
00000001402f2a2c: mov dword ptr [rsp + 0x4c], 0x3f800000
00000001402f2a34: mov qword ptr [rsp + 0x58], rbx
00000001402f2a39: mov qword ptr [rsp + 0x60], r14
00000001402f2a3e: mov qword ptr [rsp + 0x68], rbx
00000001402f2a43: mov qword ptr [rsp + 0x70], 0
00000001402f2a4c: mov qword ptr [rsp + 0x78], 4
00000001402f2a55: mov qword ptr [rsp + 0x80], 0
00000001402f2a61: mov byte ptr [rsp + 0x88], r8b
00000001402f2a69: mov r8d, dword ptr [rsp + 0x34]
00000001402f2a6e: mov r9d, dword ptr [rsp + 0x37]
00000001402f2a73: mov dword ptr [rsp + 0x89], r8d
00000001402f2a7b: mov dword ptr [rsp + 0x8c], r9d
00000001402f2a83: mov qword ptr [rsp + 0x90], rax
00000001402f2a8b: mov qword ptr [rsp + 0x98], rcx
00000001402f2a93: mov dword ptr [rsp + 0xa0], 0x41800000
00000001402f2a9e: mov word ptr [rsp + 0xa4], 0x190
00000001402f2aa8: mov byte ptr [rsp + 0xa6], 1
00000001402f2ab0: movups xmm0, xmmword ptr [rsp + 0x3b]
00000001402f2ab5: movups xmmword ptr [rsp + 0xa7], xmm0
00000001402f2abd: mov rax, qword ptr [rsp + 0x48]
00000001402f2ac2: mov qword ptr [rsp + 0xb4], rax
00000001402f2aca: mov eax, dword ptr [rip + 0x5c22810]
00000001402f2ad0: mov dword ptr [rsp + 0xcc], eax
00000001402f2ad7: movups xmm0, xmmword ptr [rip + 0x5c227f2]
00000001402f2ade: movups xmmword ptr [rsp + 0xbc], xmm0
00000001402f2ae6: movsd xmm0, qword ptr [rip + 0x5bed482]
00000001402f2aee: movsd qword ptr [rsp + 0xd0], xmm0
00000001402f2af7: mov qword ptr [rsp + 0x50], r13
00000001402f2afc: lea rcx, [rsp + 0x108]
00000001402f2b04: lea r8, [rsp + 0x50]
00000001402f2b09: call 0x1402bacf0
00000001402f2b0e: test bpl, 1
00000001402f2b12: je 0x1402f2b22
00000001402f2b14: lea rcx, [rip + 0x5c350b2]
00000001402f2b1b: mov edx, 0x15
00000001402f2b20: jmp 0x1402f2b2e
00000001402f2b22: lea rcx, [rip + 0x5c35091]
00000001402f2b29: mov edx, 0x13
00000001402f2b2e: call 0x1458dfee0
00000001402f2b33: mov byte ptr [rsp + 0x50], 3
00000001402f2b38: mov qword ptr [rsp + 0x20], rdx
00000001402f2b3d: mov dword ptr [rsp + 0x28], 0x41700000
00000001402f2b45: lea rcx, [rsp + 0xd8]
00000001402f2b4d: lea r8, [rsp + 0x50]
00000001402f2b52: mov rdx, rdi
00000001402f2b55: mov r9, rax
00000001402f2b58: call 0x14020dbd0
00000001402f2b5d: mov rax, rsi
00000001402f2b60: add rsp, 0x138
00000001402f2b67: pop rbx
00000001402f2b68: pop rbp
00000001402f2b69: pop rdi
00000001402f2b6a: pop rsi
00000001402f2b6b: pop r12
00000001402f2b6d: pop r13
00000001402f2b6f: pop r14
00000001402f2b71: pop r15
00000001402f2b73: ret
00000001402f2b74: ud2
