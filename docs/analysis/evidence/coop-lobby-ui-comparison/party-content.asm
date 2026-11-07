0x140285800: push r15
0x140285802: push r14
0x140285804: push r13
0x140285806: push r12
0x140285808: push rsi
0x140285809: push rdi
0x14028580a: push rbp
0x14028580b: push rbx
0x14028580c: sub rsp, 0x4d8
0x140285813: movaps xmmword ptr [rsp + 0x4c0], xmm15
0x14028581c: movaps xmmword ptr [rsp + 0x4b0], xmm14
0x140285825: movaps xmmword ptr [rsp + 0x4a0], xmm13
0x14028582e: movaps xmmword ptr [rsp + 0x490], xmm12
0x140285837: movaps xmmword ptr [rsp + 0x480], xmm11
0x140285840: movaps xmmword ptr [rsp + 0x470], xmm10
0x140285849: movaps xmmword ptr [rsp + 0x460], xmm9
0x140285852: movaps xmmword ptr [rsp + 0x450], xmm8
0x14028585b: movaps xmmword ptr [rsp + 0x440], xmm7
0x140285863: movaps xmmword ptr [rsp + 0x430], xmm6
0x14028586b: mov r15, rdx
0x14028586e: mov rsi, rcx
0x140285871: mov rdi, qword ptr [rcx]
0x140285874: mov rax, qword ptr [rcx + 0x28]
0x140285878: mov qword ptr [rsp + 0x2b8], rdi
0x140285880: lea rbp, [rsp + 0x2c0]
0x140285888: movups xmm0, xmmword ptr [rcx + 8]
0x14028588c: movups xmmword ptr [rsp + 0x2c0], xmm0
0x140285894: movups xmm0, xmmword ptr [rcx + 0x18]
0x140285898: movups xmmword ptr [rsp + 0x2d0], xmm0
0x1402858a0: mov qword ptr [rsp + 0x2e0], rax
0x1402858a8: mov rax, qword ptr [rdx]
0x1402858ab: mov rbx, qword ptr [rax]
0x1402858ae: test rbx, rbx
0x1402858b1: je 0x140285bb5
0x1402858b7: mov r14, qword ptr [r15 + 8]
0x1402858bb: movzx ecx, byte ptr [rbx + 0x6f]
0x1402858bf: call 0x145aaf610
0x1402858c4: mov r8, qword ptr [rax + 0x60]
0x1402858c8: mov r9, qword ptr [rax + 0x68]
0x1402858cc: lea r12, [rsp + 0x90]
0x1402858d4: mov rcx, r12
0x1402858d7: mov rdx, r14
0x1402858da: call 0x14014d5a0
0x1402858df: lea r14, [rsp + 0x2f0]
0x1402858e7: mov rcx, r14
0x1402858ea: mov rdx, r12
0x1402858ed: call 0x1428de760
0x1402858f2: mov rax, qword ptr [rip + 0x5f3e827]
0x1402858f9: mov qword ptr [rsp + 0xa0], rax
0x140285901: movups xmm1, xmmword ptr [rip + 0x5f3e808]
0x140285908: movups xmm0, xmmword ptr [rip + 0x5f3e819]
0x14028590f: movups xmmword ptr [rsp + 0xa8], xmm0
0x140285917: mov rax, qword ptr [rip + 0x5f3e81a]
0x14028591e: mov qword ptr [rsp + 0xb8], rax
0x140285926: mov rax, qword ptr [rip + 0x5f3e823]
0x14028592d: mov qword ptr [rsp + 0xd0], rax
0x140285935: movups xmm12, xmmword ptr [rip + 0x5f3e803]
0x14028593d: movups xmm11, xmmword ptr [rip + 0x5f3e813]
0x140285945: movups xmmword ptr [rsp + 0xd8], xmm11
0x14028594e: mov rax, qword ptr [rip + 0x5f3e813]
0x140285955: mov qword ptr [rsp + 0xe8], rax
0x14028595d: movups xmmword ptr [rsp + 0x378], xmm1
0x140285965: movups xmmword ptr [rsp + 0x3a8], xmm12
0x14028596e: mov rax, qword ptr [rsp + 0xa0]
0x140285976: mov qword ptr [rsp + 0x388], rax
0x14028597e: mov rax, qword ptr [rsp + 0xa8]
0x140285986: mov qword ptr [rsp + 0x390], rax
0x14028598e: mov rax, qword ptr [rsp + 0xb0]
0x140285996: mov qword ptr [rsp + 0x398], rax
0x14028599e: mov rax, qword ptr [rsp + 0xb8]
0x1402859a6: mov qword ptr [rsp + 0x3a0], rax
0x1402859ae: movaps xmm0, xmmword ptr [rsp + 0xd0]
0x1402859b6: movups xmmword ptr [rsp + 0x3b8], xmm0
0x1402859be: mov rax, qword ptr [rsp + 0xe0]
0x1402859c6: mov qword ptr [rsp + 0x3c8], rax
0x1402859ce: mov rax, qword ptr [rsp + 0xe8]
0x1402859d6: mov qword ptr [rsp + 0x3d0], rax
0x1402859de: lea rcx, [rsp + 0x98]
0x1402859e6: mov r8d, 0xe8
0x1402859ec: mov rdx, r14
0x1402859ef: call 0x14600504b
0x1402859f4: xorps xmm0, xmm0
0x1402859f7: movups xmmword ptr [rsp + 0x180], xmm0
0x1402859ff: movups xmmword ptr [rsp + 0x190], xmm0
0x140285a07: mov qword ptr [rsp + 0x1a0], 0
0x140285a13: movaps xmm1, xmmword ptr [rip + 0x5f3d9b6]
0x140285a1a: movups xmmword ptr [rsp + 0x1a8], xmm1
0x140285a22: movups xmmword ptr [rsp + 0x1b8], xmm0
0x140285a2a: movups xmmword ptr [rsp + 0x1c8], xmm0
0x140285a32: movups xmm13, xmmword ptr [rip + 0x5f3e78e]
0x140285a3a: movups xmmword ptr [rsp + 0x1d8], xmm13
0x140285a43: movups xmm14, xmmword ptr [rip + 0x5f3e78d]
0x140285a4b: movups xmmword ptr [rsp + 0x1e8], xmm14
0x140285a54: movups xmm15, xmmword ptr [rip + 0x5f3e78c]
0x140285a5c: movups xmmword ptr [rsp + 0x1f8], xmm15
0x140285a65: movups xmm6, xmmword ptr [rip + 0x5f3e78c]
0x140285a6c: movups xmmword ptr [rsp + 0x208], xmm6
0x140285a74: movups xmm7, xmmword ptr [rip + 0x5f3e78d]
0x140285a7b: movups xmmword ptr [rsp + 0x218], xmm7
0x140285a83: movups xmm8, xmmword ptr [rip + 0x5f3e78d]
0x140285a8b: movups xmmword ptr [rsp + 0x228], xmm8
0x140285a94: movups xmm9, xmmword ptr [rip + 0x5f3e79c]
0x140285a9c: movups xmmword ptr [rsp + 0x248], xmm9
0x140285aa5: movups xmm10, xmmword ptr [rip + 0x5f3e77b]
0x140285aad: movups xmmword ptr [rsp + 0x238], xmm10
0x140285ab6: movaps xmm0, xmmword ptr [rip + 0x5f2c733]
0x140285abd: movups xmmword ptr [rsp + 0x258], xmm0
0x140285ac5: mov dword ptr [rsp + 0x268], 1
0x140285ad0: mov qword ptr [rsp + 0x26c], 0
0x140285adc: mov byte ptr [rsp + 0x274], 1
0x140285ae4: mov qword ptr [rsp + 0x278], 0
0x140285af0: mov qword ptr [rsp + 0x27e], 0
0x140285afc: mov eax, dword ptr [rip + 0x5f3e774]
0x140285b02: mov dword ptr [rsp + 0x286], eax
0x140285b09: mov rdx, rbp
0x140285b0c: movzx ebp, word ptr [rip + 0x5f3e767]
0x140285b13: mov word ptr [rsp + 0x28a], bp
0x140285b1b: mov eax, dword ptr [rip + 0x5f3e75b]
0x140285b21: mov dword ptr [rsp + 0x28c], eax
0x140285b28: movzx r13d, word ptr [rip + 0x5f3e750]
0x140285b30: mov word ptr [rsp + 0x290], r13w
0x140285b39: mov dword ptr [rsp + 0x29a], 0
0x140285b44: mov qword ptr [rsp + 0x292], 0
0x140285b50: mov qword ptr [rsp + 0x90], rdi
0x140285b58: lea rcx, [rsp + 0x60]
0x140285b5d: lea r8, [rsp + 0x90]
0x140285b65: call 0x14025ab20
0x140285b6a: cmp qword ptr [rbx + 0x58], 0
0x140285b6f: je 0x140285be2
0x140285b71: mov r14, qword ptr [r15 + 0x10]
0x140285b75: lea r12, [rsp + 0x90]
0x140285b7d: mov rcx, r12
0x140285b80: mov rdx, rbx
0x140285b83: call 0x145fd8260
0x140285b88: mov r9, qword ptr [rbx + 0x50]
0x140285b8c: mov rax, qword ptr [rbx + 0x58]
0x140285b90: mov qword ptr [rsp + 0x20], rax
0x140285b95: mov dword ptr [rsp + 0x28], 0x41880000
0x140285b9d: lea rcx, [rsp + 0x2b8]
0x140285ba5: mov rdx, r14
0x140285ba8: mov r8, r12
0x140285bab: call 0x140145530
0x140285bb0: jmp 0x140285dd8
0x140285bb5: mov r13, qword ptr [r15 + 0x10]
0x140285bb9: lea rcx, [rip + 0x5f8bfa6]
0x140285bc0: mov edx, 9
0x140285bc5: call 0x145bbfea0
0x140285bca: mov rbx, rdx
0x140285bcd: test rdx, rdx
0x140285bd0: jns 0x140285bf5
0x140285bd2: xor r12d, r12d
0x140285bd5: mov rcx, r12
0x140285bd8: mov rdx, rbx
0x140285bdb: call 0x1461add5b
0x140285be0: ud2 
0x140285be2: mov r14, qword ptr [r15 + 0x10]
0x140285be6: cmp byte ptr [rbx + 0x6d], 0
0x140285bea: je 0x140285c5b
0x140285bec: movups xmm0, xmmword ptr [rip + 0x5f88119]
0x140285bf3: jmp 0x140285c62
0x140285bf5: je 0x1402864ad
0x140285bfb: mov r15, rax
0x140285bfe: call 0x140002200
0x140285c03: mov r12d, 1
0x140285c09: mov edx, 1
0x140285c0e: mov rcx, rbx
0x140285c11: call 0x1400021c0
0x140285c16: test rax, rax
0x140285c19: je 0x140286c0b
0x140285c1f: mov r14, rax
0x140285c22: mov rcx, rax
0x140285c25: mov rdx, r15
0x140285c28: mov r8, rbx
0x140285c2b: call 0x14600504b
0x140285c30: cmp byte ptr [r13], 1
0x140285c35: jne 0x1402864be
0x140285c3b: mov eax, dword ptr [r13 + 1]
0x140285c3f: mov ecx, dword ptr [r13 + 4]
0x140285c43: mov dword ptr [rsp + 0x4b], ecx
0x140285c47: mov dword ptr [rsp + 0x48], eax
0x140285c4b: mov rax, qword ptr [r13 + 8]
0x140285c4f: movzx ecx, byte ptr [r13 + 0x10]
0x140285c54: mov dl, 1
0x140285c56: jmp 0x1402864d6
0x140285c5b: movups xmm0, xmmword ptr [rip + 0x5f88112]
0x140285c62: movaps xmmword ptr [rsp + 0x30], xmm0
0x140285c67: mov dword ptr [rsp + 0x40], 0x3f800000
0x140285c6f: lea rcx, [rsp + 0x2f0]
0x140285c77: mov rdx, rbx
0x140285c7a: call 0x145fd8260
0x140285c7f: cmp byte ptr [r14], 1
0x140285c83: jne 0x140285ca8
0x140285c85: mov eax, dword ptr [r14 + 1]
0x140285c89: mov ecx, dword ptr [r14 + 4]
0x140285c8d: mov dword ptr [rsp + 0x2a3], ecx
0x140285c94: mov dword ptr [rsp + 0x2a0], eax
0x140285c9b: mov rax, qword ptr [r14 + 8]
0x140285c9f: movzx edx, byte ptr [r14 + 0x10]
0x140285ca4: mov cl, 1
0x140285ca6: jmp 0x140285cb8
0x140285ca8: mov rax, qword ptr [r14 + 8]
0x140285cac: lock inc qword ptr [rax]
0x140285cb0: jle 0x1402869e4
0x140285cb6: xor ecx, ecx
0x140285cb8: mov r8, qword ptr [rsp + 0x300]
0x140285cc0: mov qword ptr [rsp + 0xa8], r8
0x140285cc8: movups xmm0, xmmword ptr [rsp + 0x2f0]
0x140285cd0: movups xmmword ptr [rsp + 0x98], xmm0
0x140285cd8: mov r8d, dword ptr [rsp + 0x2a0]
0x140285ce0: mov r9d, dword ptr [rsp + 0x2a3]
0x140285ce8: mov dword ptr [rsp + 0xc9], r8d
0x140285cf0: mov dword ptr [rsp + 0xcc], r9d
0x140285cf8: movaps xmm0, xmmword ptr [rsp + 0x30]
0x140285cfd: movups xmmword ptr [rsp + 0x61], xmm0
0x140285d02: mov r8d, dword ptr [rsp + 0x40]
0x140285d07: mov dword ptr [rsp + 0x71], r8d
0x140285d0c: mov r8, qword ptr [rsp + 0x2b8]
0x140285d14: mov qword ptr [rsp + 0xb0], 0
0x140285d20: mov qword ptr [rsp + 0xb8], 4
0x140285d2c: mov qword ptr [rsp + 0xc0], 0
0x140285d38: mov byte ptr [rsp + 0xc8], cl
0x140285d3f: mov qword ptr [rsp + 0xd0], rax
0x140285d47: mov qword ptr [rsp + 0xd8], rdx
0x140285d4f: mov dword ptr [rsp + 0xe0], 0x41880000
0x140285d5a: mov word ptr [rsp + 0xe4], 0x190
0x140285d64: mov byte ptr [rsp + 0xe6], 1
0x140285d6c: mov rax, qword ptr [rsp + 0x6d]
0x140285d71: mov qword ptr [rsp + 0xf4], rax
0x140285d79: movups xmm0, xmmword ptr [rsp + 0x60]
0x140285d7e: movups xmmword ptr [rsp + 0xe7], xmm0
0x140285d86: mov eax, dword ptr [rip + 0x5f3e514]
0x140285d8c: mov dword ptr [rsp + 0x10c], eax
0x140285d93: movups xmm0, xmmword ptr [rip + 0x5f3e4f6]
0x140285d9a: movups xmmword ptr [rsp + 0xfc], xmm0
0x140285da2: movsd xmm0, qword ptr [rip + 0x5f2c746]
0x140285daa: movsd qword ptr [rsp + 0x110], xmm0
0x140285db3: mov qword ptr [rsp + 0x90], r8
0x140285dbb: lea rcx, [rsp + 0x2f0]
0x140285dc3: lea r8, [rsp + 0x90]
0x140285dcb: lea rdx, [rsp + 0x2c0]
0x140285dd3: call 0x14025a890
0x140285dd8: lea rdx, [rbx + 0x18]
0x140285ddc: lea rcx, [rsp + 0x2f0]
0x140285de4: call 0x145fd8260
0x140285de9: cmp byte ptr [r14], 1
0x140285ded: jne 0x140285e0c
0x140285def: mov eax, dword ptr [r14 + 1]
0x140285df3: mov ecx, dword ptr [r14 + 4]
0x140285df7: mov dword ptr [rsp + 0x33], ecx
0x140285dfb: mov dword ptr [rsp + 0x30], eax
0x140285dff: mov rax, qword ptr [r14 + 8]
0x140285e03: movzx edx, byte ptr [r14 + 0x10]
0x140285e08: mov cl, 1
0x140285e0a: jmp 0x140285e1c
0x140285e0c: mov rax, qword ptr [r14 + 8]
0x140285e10: lock inc qword ptr [rax]
0x140285e14: jle 0x1402869e4
0x140285e1a: xor ecx, ecx
0x140285e1c: mov r8, qword ptr [rsp + 0x300]
0x140285e24: mov qword ptr [rsp + 0xa8], r8
0x140285e2c: movups xmm0, xmmword ptr [rsp + 0x2f0]
0x140285e34: movups xmmword ptr [rsp + 0x98], xmm0
0x140285e3c: mov r8d, dword ptr [rsp + 0x30]
0x140285e41: mov r9d, dword ptr [rsp + 0x33]
0x140285e46: mov dword ptr [rsp + 0xc9], r8d
0x140285e4e: mov dword ptr [rsp + 0xcc], r9d
0x140285e56: movups xmm0, xmmword ptr [rip + 0x5f87e7f]
0x140285e5d: movups xmmword ptr [rsp + 0x61], xmm0
0x140285e62: mov dword ptr [rsp + 0x71], 0x3f800000
0x140285e6a: mov r8, qword ptr [rsp + 0x2b8]
0x140285e72: mov qword ptr [rsp + 0xb0], 0
0x140285e7e: mov qword ptr [rsp + 0xb8], 4
0x140285e8a: mov qword ptr [rsp + 0xc0], 0
0x140285e96: mov byte ptr [rsp + 0xc8], cl
0x140285e9d: mov qword ptr [rsp + 0xd0], rax
0x140285ea5: mov qword ptr [rsp + 0xd8], rdx
0x140285ead: mov dword ptr [rsp + 0xe0], 0x41500000
0x140285eb8: mov word ptr [rsp + 0xe4], 0x190
0x140285ec2: mov byte ptr [rsp + 0xe6], 1
0x140285eca: mov rax, qword ptr [rsp + 0x6d]
0x140285ecf: mov qword ptr [rsp + 0xf4], rax
0x140285ed7: movups xmm0, xmmword ptr [rsp + 0x60]
0x140285edc: movups xmmword ptr [rsp + 0xe7], xmm0
0x140285ee4: mov eax, dword ptr [rip + 0x5f3e3b6]
0x140285eea: mov dword ptr [rsp + 0x10c], eax
0x140285ef1: movups xmm0, xmmword ptr [rip + 0x5f3e398]
0x140285ef8: movups xmmword ptr [rsp + 0xfc], xmm0
0x140285f00: movsd xmm0, qword ptr [rip + 0x5f2c5e8]
0x140285f08: movsd qword ptr [rsp + 0x110], xmm0
0x140285f11: mov qword ptr [rsp + 0x90], r8
0x140285f19: lea rcx, [rsp + 0x2f0]
0x140285f21: lea r8, [rsp + 0x90]
0x140285f29: lea rdx, [rsp + 0x2c0]
0x140285f31: call 0x14025a890
0x140285f36: movzx ecx, byte ptr [rbx + 0x6f]
0x140285f3a: call 0x145aaf610
0x140285f3f: mov rdx, qword ptr [rax + 0x50]
0x140285f43: mov r8, qword ptr [rax + 0x58]
0x140285f47: mov rcx, r8
0x140285f4a: sub rcx, rdx
0x140285f4d: sub rcx, r8
0x140285f50: xor r9d, r9d
0x140285f53: jmp 0x140285f70
0x140285f55: nop word ptr cs:[rax + rax]
0x140285f60: inc r9
0x140285f63: add r9, rcx
0x140285f66: cmp r10d, 0x23
0x140285f6a: jne 0x140286001
0x140285f70: cmp r9, r8
0x140285f73: je 0x140285ffe
0x140285f79: mov rax, r9
0x140285f7c: add r9, rdx
0x140285f7f: movzx edi, byte ptr [r9]
0x140285f83: movzx r10d, dil
0x140285f87: test r10b, r10b
0x140285f8a: jns 0x140285f60
0x140285f8c: mov r11d, r10d
0x140285f8f: and r11d, 0x1f
0x140285f93: movzx r12d, byte ptr [r9 + 1]
0x140285f98: and r12d, 0x3f
0x140285f9c: cmp r10b, 0xdf
0x140285fa0: jbe 0x140285fdb
0x140285fa2: movzx r10d, byte ptr [r9 + 2]
0x140285fa7: shl r12d, 6
0x140285fab: and r10d, 0x3f
0x140285faf: or r10d, r12d
0x140285fb2: cmp dil, 0xf0
0x140285fb6: jb 0x140285fee
0x140285fb8: movzx edi, byte ptr [r9 + 3]
0x140285fbd: add r9, 4
0x140285fc1: and r11d, 7
0x140285fc5: shl r11d, 0x12
0x140285fc9: shl r10d, 6
0x140285fcd: and edi, 0x3f
0x140285fd0: or edi, r10d
0x140285fd3: or edi, r11d
0x140285fd6: mov r10d, edi
0x140285fd9: jmp 0x140285f63
0x140285fdb: add r9, 2
0x140285fdf: shl r11d, 6
0x140285fe3: or r11d, r12d
0x140285fe6: mov r10d, r11d
0x140285fe9: jmp 0x140285f63
0x140285fee: add r9, 3
0x140285ff2: shl r11d, 0xc
0x140285ff6: or r10d, r11d
0x140285ff9: jmp 0x140285f63
0x140285ffe: mov rax, r8
0x140286001: sub r8, rax
0x140286004: add rdx, rax
0x140286007: lea rcx, [rsp + 0x90]
0x14028600f: call 0x140043460
0x140286014: cmp dword ptr [rsp + 0x90], 1
0x14028601c: jne 0x140286027
0x14028601e: movups xmm0, xmmword ptr [rip + 0x5f3eaeb]
0x140286025: jmp 0x14028602f
0x140286027: movups xmm0, xmmword ptr [rsp + 0x94]
0x14028602f: movaps xmmword ptr [rsp + 0x2a0], xmm0
0x140286037: lea rdx, [rbx + 0x30]
0x14028603b: lea rcx, [rsp + 0x2f0]
0x140286043: call 0x145fd8260
0x140286048: cmp byte ptr [r14], 1
0x14028604c: jne 0x14028606b
0x14028604e: mov eax, dword ptr [r14 + 1]
0x140286052: mov ecx, dword ptr [r14 + 4]
0x140286056: mov dword ptr [rsp + 0x63], ecx
0x14028605a: mov dword ptr [rsp + 0x60], eax
0x14028605e: mov rax, qword ptr [r14 + 8]
0x140286062: movzx edx, byte ptr [r14 + 0x10]
0x140286067: mov cl, 1
0x140286069: jmp 0x14028607b
0x14028606b: mov rax, qword ptr [r14 + 8]
0x14028606f: lock inc qword ptr [rax]
0x140286073: jle 0x1402869e4
0x140286079: xor ecx, ecx
0x14028607b: mov r8, qword ptr [rsp + 0x300]
0x140286083: mov qword ptr [rsp + 0xa8], r8
0x14028608b: movups xmm0, xmmword ptr [rsp + 0x2f0]
0x140286093: movups xmmword ptr [rsp + 0x98], xmm0
0x14028609b: mov r8d, dword ptr [rsp + 0x60]
0x1402860a0: mov r9d, dword ptr [rsp + 0x63]
0x1402860a5: mov dword ptr [rsp + 0xc9], r8d
0x1402860ad: mov dword ptr [rsp + 0xcc], r9d
0x1402860b5: movaps xmm0, xmmword ptr [rsp + 0x2a0]
0x1402860bd: movups xmmword ptr [rsp + 0xec], xmm0
0x1402860c5: mov r8, qword ptr [rsp + 0x2b8]
0x1402860cd: mov qword ptr [rsp + 0xb0], 0
0x1402860d9: mov qword ptr [rsp + 0xb8], 4
0x1402860e5: mov qword ptr [rsp + 0xc0], 0
0x1402860f1: mov byte ptr [rsp + 0xc8], cl
0x1402860f8: mov qword ptr [rsp + 0xd0], rax
0x140286100: mov qword ptr [rsp + 0xd8], rdx
0x140286108: mov dword ptr [rsp + 0xe0], 0x41600000
0x140286113: mov word ptr [rsp + 0xe4], 0x190
0x14028611d: mov byte ptr [rsp + 0xe6], 1
0x140286125: mov dword ptr [rsp + 0xe8], 0
0x140286130: mov eax, dword ptr [rip + 0x5f3e16a]
0x140286136: mov dword ptr [rsp + 0x10c], eax
0x14028613d: movups xmm0, xmmword ptr [rip + 0x5f3e14c]
0x140286144: movups xmmword ptr [rsp + 0xfc], xmm0
0x14028614c: movsd xmm0, qword ptr [rip + 0x5f2c39c]
0x140286154: movsd qword ptr [rsp + 0x110], xmm0
0x14028615d: mov qword ptr [rsp + 0x90], r8
0x140286165: lea rcx, [rsp + 0x2f0]
0x14028616d: lea r8, [rsp + 0x90]
0x140286175: lea rdi, [rsp + 0x2c0]
0x14028617d: mov rdx, rdi
0x140286180: call 0x14025a890
0x140286185: mov eax, dword ptr [rbx + 0x68]
0x140286188: mov dword ptr [rsp + 0x30], eax
0x14028618c: movups xmm0, xmmword ptr [rip + 0x5f3df7d]
0x140286193: movaps xmmword ptr [rsp + 0x2f0], xmm0
0x14028619b: mov rax, qword ptr [rip + 0x5f3df7e]
0x1402861a2: mov qword ptr [rsp + 0x300], rax
0x1402861aa: movups xmm0, xmmword ptr [rip + 0x5f3df77]
0x1402861b1: movups xmmword ptr [rsp + 0x308], xmm0
0x1402861b9: mov rax, qword ptr [rip + 0x5f3df78]
0x1402861c0: mov qword ptr [rsp + 0x318], rax
0x1402861c8: movaps xmmword ptr [rsp + 0x320], xmm12
0x1402861d1: mov rax, qword ptr [rip + 0x5f3df78]
0x1402861d8: mov qword ptr [rsp + 0x330], rax
0x1402861e0: movups xmmword ptr [rsp + 0x338], xmm11
0x1402861e9: mov rax, qword ptr [rip + 0x5f3df78]
0x1402861f0: mov qword ptr [rsp + 0x348], rax
0x1402861f8: mov rax, qword ptr [rsp + 0x2b8]
0x140286200: movaps xmm0, xmmword ptr [rsp + 0x2f0]
0x140286208: mov rcx, qword ptr [rsp + 0x300]
0x140286210: mov rdx, qword ptr [rsp + 0x308]
0x140286218: mov r8, qword ptr [rsp + 0x310]
0x140286220: mov r9, qword ptr [rsp + 0x318]
0x140286228: movaps xmm1, xmmword ptr [rsp + 0x320]
0x140286230: movups xmmword ptr [rsp + 0x98], xmm0
0x140286238: mov qword ptr [rsp + 0xa8], rcx
0x140286240: mov qword ptr [rsp + 0xb0], rdx
0x140286248: mov qword ptr [rsp + 0xb8], r8
0x140286250: mov qword ptr [rsp + 0xc0], r9
0x140286258: movups xmmword ptr [rsp + 0xc8], xmm1
0x140286260: movaps xmm0, xmmword ptr [rsp + 0x330]
0x140286268: movups xmmword ptr [rsp + 0xd8], xmm0
0x140286270: movaps xmm0, xmmword ptr [rsp + 0x340]
0x140286278: movups xmmword ptr [rsp + 0xe8], xmm0
0x140286280: xorps xmm11, xmm11
0x140286284: movups xmmword ptr [rsp + 0xf8], xmm11
0x14028628d: movups xmmword ptr [rsp + 0x108], xmm11
0x140286296: movups xmmword ptr [rsp + 0x118], xmm11
0x14028629f: movups xmmword ptr [rsp + 0x128], xmm11
0x1402862a8: movups xmmword ptr [rsp + 0x138], xmm11
0x1402862b1: mov qword ptr [rsp + 0x148], 0
0x1402862bd: movups xmmword ptr [rsp + 0x160], xmm14
0x1402862c6: movups xmmword ptr [rsp + 0x150], xmm13
0x1402862cf: movups xmmword ptr [rsp + 0x170], xmm15
0x1402862d8: movups xmmword ptr [rsp + 0x180], xmm6
0x1402862e0: movups xmmword ptr [rsp + 0x190], xmm7
0x1402862e8: movups xmmword ptr [rsp + 0x1a0], xmm8
0x1402862f1: movups xmmword ptr [rsp + 0x1b0], xmm10
0x1402862fa: movups xmmword ptr [rsp + 0x1c0], xmm9
0x140286303: movaps xmm6, xmmword ptr [rip + 0x5f2bee6]
0x14028630a: movups xmmword ptr [rsp + 0x1d0], xmm6
0x140286312: mov dword ptr [rsp + 0x1e0], 1
0x14028631d: mov qword ptr [rsp + 0x1e4], 0
0x140286329: mov byte ptr [rsp + 0x1ec], 1
0x140286331: mov qword ptr [rsp + 0x1f0], 0
0x14028633d: mov dword ptr [rsp + 0x1f8], 0x3f800000
0x140286348: mov word ptr [rsp + 0x1fc], 0
0x140286352: mov word ptr [rsp + 0x202], bp
0x14028635a: mov rbp, rdi
0x14028635d: mov ecx, dword ptr [rip + 0x5f3df13]
0x140286363: mov dword ptr [rsp + 0x1fe], ecx
0x14028636a: mov word ptr [rsp + 0x208], r13w
0x140286373: mov ecx, dword ptr [rip + 0x5f3df03]
0x140286379: mov dword ptr [rsp + 0x204], ecx
0x140286380: mov dword ptr [rsp + 0x212], 0
0x14028638b: mov qword ptr [rsp + 0x20a], 0
0x140286397: mov word ptr [rsp + 0x218], 0x102
0x1402863a1: mov qword ptr [rsp + 0x90], rax
0x1402863a9: lea r12, [rsp + 0x60]
0x1402863ae: lea r8, [rsp + 0x90]
0x1402863b6: mov rcx, r12
0x1402863b9: mov rdx, rdi
0x1402863bc: call 0x140248060
0x1402863c1: lea r8, [rsp + 0x30]
0x1402863c6: mov rcx, r12
0x1402863c9: mov rdx, r14
0x1402863cc: call 0x140283860
0x1402863d1: mov rdi, qword ptr [r15 + 0x18]
0x1402863d5: cmp byte ptr [rbx + 0x6e], 0
0x1402863d9: jne 0x14028674c
0x1402863df: cmp byte ptr [rdi + 0x173], 0
0x1402863e6: je 0x140286481
0x1402863ec: lea rcx, [rip + 0x5f8b795]
0x1402863f3: mov edx, 0x1f
0x1402863f8: call 0x145bbfea0
0x1402863fd: mov r8, rdx
0x140286400: lea rcx, [rdi + 0xb8]
0x140286407: lea rdx, [rip + 0x5f8b799]
0x14028640e: mov qword ptr [rsp + 0x90], rdx
0x140286416: mov qword ptr [rsp + 0x98], 0xa
0x140286422: mov qword ptr [rsp + 0xa0], rcx
0x14028642a: lea rcx, [rip + 0x5f87c3f]
0x140286431: mov qword ptr [rsp + 0xa8], rcx
0x140286439: mov qword ptr [rsp + 0x20], 1
0x140286442: lea rcx, [rsp + 0x30]
0x140286447: lea r9, [rsp + 0x90]
0x14028644f: mov rdx, rax
0x140286452: call 0x145bc0330
0x140286457: cmp byte ptr [r14], 1
0x14028645b: jne 0x14028662f
0x140286461: mov eax, dword ptr [r14 + 1]
0x140286465: mov ecx, dword ptr [r14 + 4]
0x140286469: mov dword ptr [rsp + 0x53], ecx
0x14028646d: mov dword ptr [rsp + 0x50], eax
0x140286471: mov rax, qword ptr [r14 + 8]
0x140286475: movzx ecx, byte ptr [r14 + 0x10]
0x14028647a: mov dl, 1
0x14028647c: jmp 0x14028663f
0x140286481: lea rcx, [rip + 0x5f8b6e7]
0x140286488: mov edx, 0x19
0x14028648d: call 0x145bbfea0
0x140286492: mov r12, rdx
0x140286495: test rdx, rdx
0x140286498: jns 0x1402865c6
0x14028649e: xor ebp, ebp
0x1402864a0: mov rcx, rbp
0x1402864a3: mov rdx, r12
0x1402864a6: call 0x1461add5b
0x1402864ab: ud2 
0x1402864ad: mov r14d, 1
0x1402864b3: cmp byte ptr [r13], 1
0x1402864b8: je 0x140285c3b
0x1402864be: mov rax, qword ptr [r13 + 8]
0x1402864c2: lock inc qword ptr [rax]
0x1402864c6: jle 0x1402869e4
0x1402864cc: mov rdi, qword ptr [rsp + 0x2b8]
0x1402864d4: xor edx, edx
0x1402864d6: movups xmm0, xmmword ptr [rip + 0x5f8b667]
0x1402864dd: movups xmmword ptr [rsp + 0x61], xmm0
0x1402864e2: mov dword ptr [rsp + 0x71], 0x3f0ccccd
0x1402864ea: mov qword ptr [rsp + 0x98], rbx
0x1402864f2: mov qword ptr [rsp + 0xa0], r14
0x1402864fa: mov qword ptr [rsp + 0xa8], rbx
0x140286502: mov qword ptr [rsp + 0xb0], 0
0x14028650e: mov qword ptr [rsp + 0xb8], 4
0x14028651a: mov qword ptr [rsp + 0xc0], 0
0x140286526: mov byte ptr [rsp + 0xc8], dl
0x14028652d: mov edx, dword ptr [rsp + 0x48]
0x140286531: mov r8d, dword ptr [rsp + 0x4b]
0x140286536: mov dword ptr [rsp + 0xc9], edx
0x14028653d: mov dword ptr [rsp + 0xcc], r8d
0x140286545: mov qword ptr [rsp + 0xd0], rax
0x14028654d: mov qword ptr [rsp + 0xd8], rcx
0x140286555: mov dword ptr [rsp + 0xe0], 0x41700000
0x140286560: mov word ptr [rsp + 0xe4], 0x190
0x14028656a: mov byte ptr [rsp + 0xe6], 1
0x140286572: movups xmm0, xmmword ptr [rsp + 0x60]
0x140286577: movups xmmword ptr [rsp + 0xe7], xmm0
0x14028657f: mov rax, qword ptr [rsp + 0x6d]
0x140286584: mov qword ptr [rsp + 0xf4], rax
0x14028658c: mov eax, dword ptr [rip + 0x5f3dd0e]
0x140286592: mov dword ptr [rsp + 0x10c], eax
0x140286599: movups xmm0, xmmword ptr [rip + 0x5f3dcf0]
0x1402865a0: movups xmmword ptr [rsp + 0xfc], xmm0
0x1402865a8: movsd xmm0, qword ptr [rip + 0x5f2bf40]
0x1402865b0: movsd qword ptr [rsp + 0x110], xmm0
0x1402865b9: mov qword ptr [rsp + 0x90], rdi
0x1402865c1: jmp 0x140286b84
0x1402865c6: je 0x140286610
0x1402865c8: mov qword ptr [rsp + 0x2e8], rax
0x1402865d0: call 0x140002200
0x1402865d5: mov ebp, 1
0x1402865da: mov edx, 1
0x1402865df: mov rcx, r12
0x1402865e2: call 0x1400021c0
0x1402865e7: test rax, rax
0x1402865ea: je 0x1402864a0
0x1402865f0: mov r13, rax
0x1402865f3: mov rcx, rax
0x1402865f6: mov rdx, qword ptr [rsp + 0x2e8]
0x1402865fe: mov r8, r12
0x140286601: call 0x14600504b
0x140286606: lea rbp, [rsp + 0x2c0]
0x14028660e: jmp 0x140286616
0x140286610: mov r13d, 1
0x140286616: mov qword ptr [rsp + 0x30], r12
0x14028661b: mov qword ptr [rsp + 0x38], r13
0x140286620: mov qword ptr [rsp + 0x40], r12
0x140286625: cmp byte ptr [r14], 1
0x140286629: je 0x140286461
0x14028662f: mov rax, qword ptr [r14 + 8]
0x140286633: lock inc qword ptr [rax]
0x140286637: jle 0x1402869e4
0x14028663d: xor edx, edx
0x14028663f: mov r8, qword ptr [rsp + 0x40]
0x140286644: mov qword ptr [rsp + 0xa8], r8
0x14028664c: movups xmm0, xmmword ptr [rsp + 0x30]
0x140286651: movups xmmword ptr [rsp + 0x98], xmm0
0x140286659: movups xmm0, xmmword ptr [rip + 0x5f87698]
0x140286660: movups xmmword ptr [rsp + 0x61], xmm0
0x140286665: mov dword ptr [rsp + 0x71], 0x3f800000
0x14028666d: mov r8, qword ptr [rsp + 0x2b8]
0x140286675: mov qword ptr [rsp + 0xb0], 0
0x140286681: mov qword ptr [rsp + 0xb8], 4
0x14028668d: mov qword ptr [rsp + 0xc0], 0
0x140286699: mov byte ptr [rsp + 0xc8], dl
0x1402866a0: mov edx, dword ptr [rsp + 0x50]
0x1402866a4: mov r9d, dword ptr [rsp + 0x53]
0x1402866a9: mov dword ptr [rsp + 0xc9], edx
0x1402866b0: mov dword ptr [rsp + 0xcc], r9d
0x1402866b8: mov qword ptr [rsp + 0xd0], rax
0x1402866c0: mov qword ptr [rsp + 0xd8], rcx
0x1402866c8: mov dword ptr [rsp + 0xe0], 0x41500000
0x1402866d3: mov word ptr [rsp + 0xe4], 0x190
0x1402866dd: mov byte ptr [rsp + 0xe6], 1
0x1402866e5: mov rax, qword ptr [rsp + 0x6d]
0x1402866ea: mov qword ptr [rsp + 0xf4], rax
0x1402866f2: movups xmm0, xmmword ptr [rsp + 0x60]
0x1402866f7: movups xmmword ptr [rsp + 0xe7], xmm0
0x1402866ff: movups xmm0, xmmword ptr [rip + 0x5f3db8a]
0x140286706: movups xmmword ptr [rsp + 0xfc], xmm0
0x14028670e: mov eax, dword ptr [rip + 0x5f3db8c]
0x140286714: mov dword ptr [rsp + 0x10c], eax
0x14028671b: movsd xmm0, qword ptr [rip + 0x5f2bdcd]
0x140286723: movsd qword ptr [rsp + 0x110], xmm0
0x14028672c: mov qword ptr [rsp + 0x90], r8
0x140286734: lea rcx, [rsp + 0x2f0]
0x14028673c: lea r8, [rsp + 0x90]
0x140286744: mov rdx, rbp
0x140286747: call 0x14025a890
0x14028674c: movaps xmmword ptr [rsp + 0x390], xmm11
0x140286755: movaps xmmword ptr [rsp + 0x380], xmm11
0x14028675e: movaps xmmword ptr [rsp + 0x370], xmm11
0x140286767: movaps xmmword ptr [rsp + 0x360], xmm11
0x140286770: movaps xmmword ptr [rsp + 0x350], xmm11
0x140286779: mov qword ptr [rsp + 0x3a0], 0
0x140286785: mov word ptr [rsp + 0x214], 0
0x14028678f: mov dword ptr [rsp + 0x210], 0
0x14028679a: movups xmm0, xmmword ptr [rip + 0x5f873ef]
0x1402867a1: movups xmmword ptr [rsp + 0x3a8], xmm0
0x1402867a9: movups xmm0, xmmword ptr [rip + 0x5f873f0]
0x1402867b0: movups xmmword ptr [rsp + 0x3b8], xmm0
0x1402867b8: movups xmm0, xmmword ptr [rip + 0x5f873f1]
0x1402867bf: movups xmmword ptr [rsp + 0x3c8], xmm0
0x1402867c7: movups xmm0, xmmword ptr [rip + 0x5f873f2]
0x1402867ce: movups xmmword ptr [rsp + 0x3d8], xmm0
0x1402867d6: movups xmm0, xmmword ptr [rip + 0x5f87403]
0x1402867dd: movups xmmword ptr [rsp + 0x3f8], xmm0
0x1402867e5: movups xmm0, xmmword ptr [rip + 0x5f873e4]
0x1402867ec: movups xmmword ptr [rsp + 0x3e8], xmm0
0x1402867f4: movups xmm0, xmmword ptr [rip + 0x5f87405]
0x1402867fb: movups xmmword ptr [rsp + 0x418], xmm0
0x140286803: movups xmm0, xmmword ptr [rip + 0x5f873e6]
0x14028680a: movups xmmword ptr [rsp + 0x408], xmm0
0x140286812: movups xmm0, xmmword ptr [rip + 0x5f872bf]
0x140286819: movaps xmmword ptr [rsp + 0x2f0], xmm0
0x140286821: mov qword ptr [rsp + 0x300], 0
0x14028682d: movups xmm0, xmmword ptr [rip + 0x5f872bc]
0x140286834: movups xmmword ptr [rsp + 0x308], xmm0
0x14028683c: mov qword ptr [rsp + 0x318], 0
0x140286848: movups xmm0, xmmword ptr [rip + 0x5f872b9]
0x14028684f: movaps xmmword ptr [rsp + 0x320], xmm0
0x140286857: mov qword ptr [rsp + 0x330], 0
0x140286863: movups xmm0, xmmword ptr [rip + 0x5f872b6]
0x14028686a: movups xmmword ptr [rsp + 0x338], xmm0
0x140286872: mov qword ptr [rsp + 0x348], 0
0x14028687e: mov r12, qword ptr [rsp + 0x2b8]
0x140286886: lea rcx, [rsp + 0x98]
0x14028688e: lea rdx, [rsp + 0x2f0]
0x140286896: mov r8d, 0x138
0x14028689c: call 0x14600504b
0x1402868a1: movups xmmword ptr [rsp + 0x1d0], xmm6
0x1402868a9: mov dword ptr [rsp + 0x1e0], 1
0x1402868b4: mov qword ptr [rsp + 0x1e4], 0
0x1402868c0: mov byte ptr [rsp + 0x1ec], 1
0x1402868c8: movsd xmm0, qword ptr [rip + 0x5f2b9e0]
0x1402868d0: movsd qword ptr [rsp + 0x1f0], xmm0
0x1402868d9: mov dword ptr [rsp + 0x1f8], 0x3f800000
0x1402868e4: mov word ptr [rsp + 0x1fc], 0
0x1402868ee: mov dword ptr [rsp + 0x1fe], 0x10000
0x1402868f9: mov word ptr [rsp + 0x202], 0
0x140286903: mov dword ptr [rsp + 0x204], 0x10000
0x14028690e: mov word ptr [rsp + 0x208], 0
0x140286918: mov dword ptr [rsp + 0x20a], 0
0x140286923: mov word ptr [rsp + 0x20e], 0
0x14028692d: mov qword ptr [rsp + 0x90], r12
0x140286935: lea rcx, [rsp + 0x60]
0x14028693a: lea r8, [rsp + 0x90]
0x140286942: mov rdx, rbp
0x140286945: call 0x1402441d0
0x14028694a: cmp qword ptr [rdi + 0x50], 4
0x14028694f: jne 0x1402869b3
0x140286951: mov rax, qword ptr [rdi + 0x48]
0x140286955: cmp dword ptr [rax], 0x74736f68
0x14028695b: jne 0x1402869b3
0x14028695d: cmp byte ptr [rbx + 0x6c], 0
0x140286961: jne 0x1402869b3
0x140286963: mov rax, qword ptr [r15 + 0x20]
0x140286967: mov rax, qword ptr [rax]
0x14028696a: mov qword ptr [rsp + 0x98], rax
0x140286972: mov byte ptr [rsp + 0x90], 8
0x14028697a: lea rcx, [rip + 0x5f8b230]
0x140286981: mov edx, 4
0x140286986: call 0x145bbfea0
0x14028698b: mov qword ptr [rsp + 0x20], rdx
0x140286990: mov dword ptr [rsp + 0x28], 0x41500000
0x140286998: lea rcx, [rsp + 0x2b8]
0x1402869a0: lea r8, [rsp + 0x90]
0x1402869a8: mov rdx, r14
0x1402869ab: mov r9, rax
0x1402869ae: call 0x1401488f0
0x1402869b3: movzx eax, byte ptr [rbx + 0x6d]
0x1402869b7: cmp byte ptr [rbx + 0x6c], 0
0x1402869bb: je 0x1402869e6
0x1402869bd: test al, al
0x1402869bf: je 0x140286a05
0x1402869c1: lea rcx, [rip + 0x5f8b1f0]
0x1402869c8: mov edx, 0xa
0x1402869cd: call 0x145bbfea0
0x1402869d2: mov rbx, rdx
0x1402869d5: test rdx, rdx
0x1402869d8: jns 0x140286a1e
0x1402869da: xor ecx, ecx
0x1402869dc: mov rdx, rbx
0x1402869df: call 0x1461add5b
0x1402869e4: ud2 
0x1402869e6: test al, al
0x1402869e8: je 0x140286a68
0x1402869ea: lea rcx, [rip + 0x5f8b1c4]
0x1402869f1: mov edx, 3
0x1402869f6: call 0x145bbfea0
0x1402869fb: mov rbx, rdx
0x1402869fe: test rdx, rdx
0x140286a01: js 0x1402869da
0x140286a03: jmp 0x140286a1e
0x140286a05: lea rcx, [rip + 0x5f8741b]
0x140286a0c: mov edx, 4
0x140286a11: call 0x145bbfea0
0x140286a16: mov rbx, rdx
0x140286a19: test rdx, rdx
0x140286a1c: js 0x1402869da
0x140286a1e: je 0x140286a68
0x140286a20: mov r12, rax
0x140286a23: call 0x140002200
0x140286a28: mov edx, 1
0x140286a2d: mov rcx, rbx
0x140286a30: call 0x1400021c0
0x140286a35: mov ecx, 1
0x140286a3a: test rax, rax
0x140286a3d: je 0x140285bd8
0x140286a43: mov r15, rax
0x140286a46: mov rcx, rax
0x140286a49: mov rdx, r12
0x140286a4c: mov r8, rbx
0x140286a4f: call 0x14600504b
0x140286a54: cmp byte ptr [r14], 1
0x140286a58: je 0x140286a76
0x140286a5a: mov rax, qword ptr [r14 + 8]
0x140286a5e: lock inc qword ptr [rax]
0x140286a62: jle 0x1402869e4
0x140286a64: xor edx, edx
0x140286a66: jmp 0x140286a91
0x140286a68: mov r15d, 1
0x140286a6e: xor ebx, ebx
0x140286a70: cmp byte ptr [r14], 1
0x140286a74: jne 0x140286a5a
0x140286a76: mov eax, dword ptr [r14 + 1]
0x140286a7a: mov ecx, dword ptr [r14 + 4]
0x140286a7e: mov dword ptr [rsp + 0x5b], ecx
0x140286a82: mov dword ptr [rsp + 0x58], eax
0x140286a86: mov rax, qword ptr [r14 + 8]
0x140286a8a: movzx ecx, byte ptr [r14 + 0x10]
0x140286a8f: mov dl, 1
0x140286a91: movups xmm0, xmmword ptr [rip + 0x5f871c0]
0x140286a98: movups xmmword ptr [rsp + 0x61], xmm0
0x140286a9d: mov dword ptr [rsp + 0x71], 0x3f800000
0x140286aa5: mov r8, qword ptr [rsp + 0x2b8]
0x140286aad: mov qword ptr [rsp + 0x98], rbx
0x140286ab5: mov qword ptr [rsp + 0xa0], r15
0x140286abd: mov qword ptr [rsp + 0xa8], rbx
0x140286ac5: mov qword ptr [rsp + 0xb0], 0
0x140286ad1: mov qword ptr [rsp + 0xb8], 4
0x140286add: mov qword ptr [rsp + 0xc0], 0
0x140286ae9: mov byte ptr [rsp + 0xc8], dl
0x140286af0: mov edx, dword ptr [rsp + 0x58]
0x140286af4: mov r9d, dword ptr [rsp + 0x5b]
0x140286af9: mov dword ptr [rsp + 0xc9], edx
0x140286b00: mov dword ptr [rsp + 0xcc], r9d
0x140286b08: mov qword ptr [rsp + 0xd0], rax
0x140286b10: mov qword ptr [rsp + 0xd8], rcx
0x140286b18: mov dword ptr [rsp + 0xe0], 0x41500000
0x140286b23: mov word ptr [rsp + 0xe4], 0x190
0x140286b2d: mov byte ptr [rsp + 0xe6], 1
0x140286b35: movups xmm0, xmmword ptr [rsp + 0x60]
0x140286b3a: movups xmmword ptr [rsp + 0xe7], xmm0
0x140286b42: mov rax, qword ptr [rsp + 0x6d]
0x140286b47: mov qword ptr [rsp + 0xf4], rax
0x140286b4f: movups xmm0, xmmword ptr [rip + 0x5f3d73a]
0x140286b56: movups xmmword ptr [rsp + 0xfc], xmm0
0x140286b5e: mov eax, dword ptr [rip + 0x5f3d73c]
0x140286b64: mov dword ptr [rsp + 0x10c], eax
0x140286b6b: movsd xmm0, qword ptr [rip + 0x5f2b97d]
0x140286b73: movsd qword ptr [rsp + 0x110], xmm0
0x140286b7c: mov qword ptr [rsp + 0x90], r8
0x140286b84: lea rcx, [rsp + 0x2f0]
0x140286b8c: lea r8, [rsp + 0x90]
0x140286b94: mov rdx, rbp
0x140286b97: call 0x14025a890
0x140286b9c: mov rax, rsi
0x140286b9f: movaps xmm6, xmmword ptr [rsp + 0x430]
0x140286ba7: movaps xmm7, xmmword ptr [rsp + 0x440]
0x140286baf: movaps xmm8, xmmword ptr [rsp + 0x450]
0x140286bb8: movaps xmm9, xmmword ptr [rsp + 0x460]
0x140286bc1: movaps xmm10, xmmword ptr [rsp + 0x470]
0x140286bca: movaps xmm11, xmmword ptr [rsp + 0x480]
0x140286bd3: movaps xmm12, xmmword ptr [rsp + 0x490]
0x140286bdc: movaps xmm13, xmmword ptr [rsp + 0x4a0]
0x140286be5: movaps xmm14, xmmword ptr [rsp + 0x4b0]
0x140286bee: movaps xmm15, xmmword ptr [rsp + 0x4c0]
0x140286bf7: add rsp, 0x4d8
0x140286bfe: pop rbx
0x140286bff: pop rbp
0x140286c00: pop rdi
0x140286c01: pop rsi
0x140286c02: pop r12
0x140286c04: pop r13
0x140286c06: pop r14
0x140286c08: pop r15
0x140286c0a: ret 
0x140286c0b: mov rcx, r12
0x140286c0e: mov rdx, rbx
0x140286c11: call 0x1461add5b
0x140286c16: ud2 
