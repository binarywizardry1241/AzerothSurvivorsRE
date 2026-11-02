0x145aeaa40: push rbp
0x145aeaa41: push r15
0x145aeaa43: push r14
0x145aeaa45: push r13
0x145aeaa47: push r12
0x145aeaa49: push rsi
0x145aeaa4a: push rdi
0x145aeaa4b: push rbx
0x145aeaa4c: sub rsp, 0x278
0x145aeaa53: lea rbp, [rsp + 0x80]
0x145aeaa5b: movdqa xmmword ptr [rbp + 0x1e0], xmm7
0x145aeaa63: movaps xmmword ptr [rbp + 0x1d0], xmm6
0x145aeaa6a: mov qword ptr [rbp + 0x1c8], 0xfffffffffffffffe
0x145aeaa75: mov r13, rcx
0x145aeaa78: cmp dword ptr [rcx + 0x88], -1
0x145aeaa7f: je 0x145aeaae1
0x145aeaa81: mov rcx, qword ptr [r13 + 0x70]
0x145aeaa85: mov rax, qword ptr [r13 + 0x78]
0x145aeaa89: call qword ptr [rax + 0x28]
0x145aeaa8c: test al, al
0x145aeaa8e: jne 0x145aeaae1
0x145aeaa90: lea rcx, [r13 + 0x80]
0x145aeaa97: call 0x145f4d7e0
0x145aeaa9c: test rax, rax
0x145aeaa9f: js 0x145aeaaa8
0x145aeaaa1: cvtsi2ss xmm0, rax
0x145aeaaa6: jmp 0x145aeaabd
0x145aeaaa8: mov rcx, rax
0x145aeaaab: shr rcx, 1
0x145aeaaae: and eax, 1
0x145aeaab1: or rax, rcx
0x145aeaab4: cvtsi2ss xmm0, rax
0x145aeaab9: addss xmm0, xmm0
0x145aeaabd: cvtsi2ss xmm1, edx
0x145aeaac1: divss xmm1, dword ptr [rip + 0x7081e7]
0x145aeaac9: addss xmm1, xmm0
0x145aeaacd: ucomiss xmm1, dword ptr [rip + 0x688fcc]
0x145aeaad4: jbe 0x145aeaae1
0x145aeaad6: mov rcx, qword ptr [r13 + 0x70]
0x145aeaada: mov rax, qword ptr [r13 + 0x78]
0x145aeaade: call qword ptr [rax + 0x30]
0x145aeaae1: mov qword ptr [rbp + 0x148], 0
0x145aeaaec: mov qword ptr [rbp + 0x150], 8
0x145aeaaf7: mov qword ptr [rbp + 0x158], 0
0x145aeab02: lea rsi, [rbp + 0xa0]
0x145aeab09: lea rdi, [rbp + 0x148]
0x145aeab10: jmp 0x145aeab4c
0x145aeab12: nop word ptr cs:[rax + rax]
0x145aeab20: mov rax, qword ptr [rbp + 0x150]
0x145aeab27: lea rcx, [rbx + rbx*2]
0x145aeab2b: mov rdx, qword ptr [rbp + 0xb0]
0x145aeab32: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145aeab37: movups xmm0, xmmword ptr [rbp + 0xa0]
0x145aeab3e: movups xmmword ptr [rax + rcx*8], xmm0
0x145aeab42: inc rbx
0x145aeab45: mov qword ptr [rbp + 0x158], rbx
0x145aeab4c: mov rdx, qword ptr [r13 + 0x90]
0x145aeab53: mov rax, qword ptr [r13 + 0x98]
0x145aeab5a: mov rax, qword ptr [rax + 0x20]
0x145aeab5e: mov byte ptr [rbp + 0x1c7], 1
0x145aeab65: mov rcx, rsi
0x145aeab68: call rax
0x145aeab6a: nop
0x145aeab6b: mov rax, qword ptr [rbp + 0xa0]
0x145aeab72: cmp rax, -1
0x145aeab76: je 0x145aeabab
0x145aeab78: mov qword ptr [rbp + 0x198], rax
0x145aeab7f: mov rbx, qword ptr [rbp + 0x158]
0x145aeab86: cmp rbx, qword ptr [rbp + 0x148]
0x145aeab8d: jne 0x145aeab20
0x145aeab8f: mov rax, qword ptr [rbp + 0xa8]
0x145aeab96: mov qword ptr [rbp + 0x178], rax
0x145aeab9d: mov rcx, rdi
0x145aeaba0: call 0x145fa3f60
0x145aeaba5: nop
0x145aeaba6: jmp 0x145aeab20
0x145aeabab: cmp dword ptr [r13 + 0x88], -1
0x145aeabb3: je 0x145aeac55
0x145aeabb9: lea rsi, [rbp + 0xa0]
0x145aeabc0: lea rdi, [rbp + 0x148]
0x145aeabc7: jmp 0x145aeabfc
0x145aeabc9: nop dword ptr [rax]
0x145aeabd0: mov rax, qword ptr [rbp + 0x150]
0x145aeabd7: lea rcx, [rbx + rbx*2]
0x145aeabdb: mov rdx, qword ptr [rbp + 0xb0]
0x145aeabe2: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145aeabe7: movups xmm0, xmmword ptr [rbp + 0xa0]
0x145aeabee: movups xmmword ptr [rax + rcx*8], xmm0
0x145aeabf2: inc rbx
0x145aeabf5: mov qword ptr [rbp + 0x158], rbx
0x145aeabfc: mov rdx, qword ptr [r13 + 0x70]
0x145aeac00: mov rax, qword ptr [r13 + 0x78]
0x145aeac04: mov rax, qword ptr [rax + 0x20]
0x145aeac08: mov byte ptr [rbp + 0x1c7], 1
0x145aeac0f: mov rcx, rsi
0x145aeac12: call rax
0x145aeac14: nop
0x145aeac15: mov rax, qword ptr [rbp + 0xa0]
0x145aeac1c: cmp rax, -1
0x145aeac20: je 0x145aeac55
0x145aeac22: mov qword ptr [rbp + 0x198], rax
0x145aeac29: mov rbx, qword ptr [rbp + 0x158]
0x145aeac30: cmp rbx, qword ptr [rbp + 0x148]
0x145aeac37: jne 0x145aeabd0
0x145aeac39: mov rax, qword ptr [rbp + 0xa8]
0x145aeac40: mov qword ptr [rbp + 0x178], rax
0x145aeac47: mov rcx, rdi
0x145aeac4a: call 0x145fa3f60
0x145aeac4f: nop
0x145aeac50: jmp 0x145aeabd0
0x145aeac55: mov rdx, qword ptr [rbp + 0x148]
0x145aeac5c: mov rcx, qword ptr [rbp + 0x150]
0x145aeac63: mov rax, qword ptr [rbp + 0x158]
0x145aeac6a: shl rax, 3
0x145aeac6e: lea r8, [rax + rax*2]
0x145aeac72: add r8, rcx
0x145aeac75: mov qword ptr [rbp - 0x60], rcx
0x145aeac79: mov qword ptr [rbp - 0x10], rdx
0x145aeac7d: mov qword ptr [rbp - 0x50], rdx
0x145aeac81: mov qword ptr [rbp + 0x88], r8
0x145aeac88: mov qword ptr [rbp - 0x48], r8
0x145aeac8c: lea rdx, [r13 + 0xa8]
0x145aeac93: mov qword ptr [rbp - 0x18], rdx
0x145aeac97: lea rdx, [r13 + 0x40]
0x145aeac9b: mov qword ptr [rbp + 8], rdx
0x145aeac9f: lea rdx, [r13 + 0x20]
0x145aeaca3: mov qword ptr [rbp], rdx
0x145aeaca7: lea rdx, [r13 + 0xc8]
0x145aeacae: mov qword ptr [rbp + 0x90], rdx
0x145aeacb5: lea r15, [rcx + 0x20]
0x145aeacb9: lea r12, [rax + rax*2 - 0x18]
0x145aeacbe: lea r14, [rbp + 0xa0]
0x145aeacc5: xorps xmm6, xmm6
0x145aeacc8: pcmpeqd xmm7, xmm7
0x145aeaccc: mov edi, 0x4c4
0x145aeacd1: mov qword ptr [rbp - 8], rcx
0x145aeacd5: mov rax, rcx
0x145aeacd8: mov qword ptr [rbp + 0x168], r13
0x145aeacdf: jmp 0x145aeacfb
0x145aeace1: nop word ptr cs:[rax + rax]
0x145aeacf0: add r15, 0x18
0x145aeacf4: add r12, -0x18
0x145aeacf8: mov rax, rbx
0x145aeacfb: cmp rax, qword ptr [rbp + 0x88]
0x145aead02: je 0x145aeb8a2
0x145aead08: lea rbx, [rax + 0x18]
0x145aead0c: mov qword ptr [rbp - 0x58], rbx
0x145aead10: mov rcx, qword ptr [rax]
0x145aead13: cmp rcx, -1
0x145aead17: je 0x145aeb857
0x145aead1d: mov qword ptr [rbp + 0x198], rcx
0x145aead24: mov rdx, qword ptr [rax + 8]
0x145aead28: mov r8, qword ptr [rax + 0x10]
0x145aead2c: mov rcx, r14
0x145aead2f: mov qword ptr [rbp + 0x178], rdx
0x145aead36: call 0x145e04390
0x145aead3b: nop
0x145aead3c: cmp qword ptr [rbp + 0xa0], -1
0x145aead44: je 0x145aeb7e0
0x145aead4a: mov rax, qword ptr [rbp + 0x110]
0x145aead51: mov qword ptr [rbp + 0x80], rax
0x145aead58: movups xmm0, xmmword ptr [rbp + 0x100]
0x145aead5f: movaps xmmword ptr [rbp + 0x70], xmm0
0x145aead63: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145aead6a: movaps xmmword ptr [rbp + 0x60], xmm0
0x145aead6e: movups xmm0, xmmword ptr [rbp + 0xe0]
0x145aead75: movaps xmmword ptr [rbp + 0x50], xmm0
0x145aead79: movdqu xmm0, xmmword ptr [rbp + 0xa0]
0x145aead81: movdqu xmm1, xmmword ptr [rbp + 0xb0]
0x145aead89: movdqu xmm2, xmmword ptr [rbp + 0xc0]
0x145aead91: movups xmm3, xmmword ptr [rbp + 0xd0]
0x145aead98: movaps xmmword ptr [rbp + 0x40], xmm3
0x145aead9c: movdqa xmmword ptr [rbp + 0x30], xmm2
0x145aeada1: movdqa xmmword ptr [rbp + 0x20], xmm1
0x145aeada6: movdqa xmmword ptr [rbp + 0x10], xmm0
0x145aeadab: mov rcx, qword ptr [rbp + 0x10]
0x145aeadaf: mov rsi, rcx
0x145aeadb2: movabs rax, 0x8000000000000000
0x145aeadbc: xor rsi, rax
0x145aeadbf: mov qword ptr [rbp + 0x180], rcx
0x145aeadc6: test rcx, rcx
0x145aeadc9: mov eax, 0xa
0x145aeadce: cmovns rsi, rax
0x145aeadd2: lea rdx, [rsi - 2]
0x145aeadd6: cmp rdx, 8
0x145aeadda: ja 0x145aeae46
0x145aeaddc: lea rcx, [rip + 0x14cd7b1]
0x145aeade3: movsxd rax, dword ptr [rcx + rdx*4]
0x145aeade7: add rax, rcx
0x145aeadea: jmp rax
0x145aeadec: mov qword ptr [rbp + 0x188], rdx
0x145aeadf3: lea rcx, [rbp + 0x28]
0x145aeadf7: mov rax, qword ptr [rcx]
0x145aeadfa: lea rdx, [rbp + 0xa8]
0x145aeae01: mov qword ptr [rdx + 0x10], rax
0x145aeae05: movdqu xmm0, xmmword ptr [rcx - 0x10]
0x145aeae0a: movdqu xmmword ptr [rdx], xmm0
0x145aeae0e: mov byte ptr [r13 + 0xd8], 1
0x145aeae16: movabs rax, 0x8000000000000002
0x145aeae20: mov qword ptr [rbp + 0xa0], rax
0x145aeae27: mov rcx, qword ptr [r13]
0x145aeae2b: mov rax, qword ptr [r13 + 0x18]
0x145aeae2f: cmp rax, rcx
0x145aeae32: jne 0x145aeb03a
0x145aeae38: mov rcx, r13
0x145aeae3b: call 0x145adfdc0
0x145aeae40: nop
0x145aeae41: jmp 0x145aeb032
0x145aeae46: mov qword ptr [rbp + 0x188], rdx
0x145aeae4d: mov rax, qword ptr [rbp + 0x80]
0x145aeae54: mov qword ptr [rbp + 0x110], rax
0x145aeae5b: movaps xmm0, xmmword ptr [rbp + 0x70]
0x145aeae5f: movaps xmmword ptr [rbp + 0x100], xmm0
0x145aeae66: movaps xmm0, xmmword ptr [rbp + 0x60]
0x145aeae6a: movaps xmmword ptr [rbp + 0xf0], xmm0
0x145aeae71: movaps xmm0, xmmword ptr [rbp + 0x50]
0x145aeae75: movaps xmmword ptr [rbp + 0xe0], xmm0
0x145aeae7c: movdqa xmm0, xmmword ptr [rbp + 0x10]
0x145aeae81: movdqa xmm1, xmmword ptr [rbp + 0x20]
0x145aeae86: movdqa xmm2, xmmword ptr [rbp + 0x30]
0x145aeae8b: movaps xmm3, xmmword ptr [rbp + 0x40]
0x145aeae8f: movaps xmmword ptr [rbp + 0xd0], xmm3
0x145aeae96: movdqa xmmword ptr [rbp + 0xc0], xmm2
0x145aeae9e: movdqa xmmword ptr [rbp + 0xb0], xmm1
0x145aeaea6: movdqa xmmword ptr [rbp + 0xa0], xmm0
0x145aeaeae: mov rax, qword ptr [r13]
0x145aeaeb2: mov rcx, qword ptr [r13 + 0x18]
0x145aeaeb6: cmp rcx, rax
0x145aeaeb9: jne 0x145aeaecc
0x145aeaebb: mov rcx, r13
0x145aeaebe: call 0x145adfdc0
0x145aeaec3: nop
0x145aeaec4: mov rax, qword ptr [r13]
0x145aeaec8: mov rcx, qword ptr [r13 + 0x18]
0x145aeaecc: lea rdx, [rcx + 1]
0x145aeaed0: mov qword ptr [r13 + 0x18], rdx
0x145aeaed4: add rcx, qword ptr [r13 + 0x10]
0x145aeaed8: cmp rcx, rax
0x145aeaedb: mov edx, 0
0x145aeaee0: cmovb rax, rdx
0x145aeaee4: sub rcx, rax
0x145aeaee7: mov rax, qword ptr [r13 + 8]
0x145aeaeeb: imul rcx, rcx, 0x78
0x145aeaeef: mov rdx, qword ptr [rbp + 0x110]
0x145aeaef6: mov qword ptr [rax + rcx + 0x70], rdx
0x145aeaefb: movaps xmm0, xmmword ptr [rbp + 0x100]
0x145aeaf02: movups xmmword ptr [rax + rcx + 0x60], xmm0
0x145aeaf07: movaps xmm0, xmmword ptr [rbp + 0xf0]
0x145aeaf0e: movups xmmword ptr [rax + rcx + 0x50], xmm0
0x145aeaf13: movaps xmm0, xmmword ptr [rbp + 0xe0]
0x145aeaf1a: movups xmmword ptr [rax + rcx + 0x40], xmm0
0x145aeaf1f: movaps xmm0, xmmword ptr [rbp + 0xa0]
0x145aeaf26: movaps xmm1, xmmword ptr [rbp + 0xb0]
0x145aeaf2d: movdqa xmm2, xmmword ptr [rbp + 0xc0]
0x145aeaf35: movaps xmm3, xmmword ptr [rbp + 0xd0]
0x145aeaf3c: movups xmmword ptr [rax + rcx + 0x30], xmm3
0x145aeaf41: movdqu xmmword ptr [rax + rcx + 0x20], xmm2
0x145aeaf47: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145aeaf4c: movups xmmword ptr [rax + rcx], xmm0
0x145aeaf50: jmp 0x145aeb7e0
0x145aeaf55: mov qword ptr [rbp + 0x188], rdx
0x145aeaf5c: mov rax, qword ptr [rbp + 0x18]
0x145aeaf60: mov qword ptr [rbp + 0x1b0], rax
0x145aeaf67: mov rax, qword ptr [rbp + 0x20]
0x145aeaf6b: mov qword ptr [rbp + 0x1a8], rax
0x145aeaf72: mov rsi, qword ptr [rbp + 0x28]
0x145aeaf76: mov byte ptr [r13 + 0xd8], 0
0x145aeaf7e: mov rcx, qword ptr [r13 + 0x70]
0x145aeaf82: mov rdx, qword ptr [r13 + 0x78]
0x145aeaf86: mov eax, dword ptr [r13 + 0x88]
0x145aeaf8d: mov dword ptr [r13 + 0x88], 0xffffffff
0x145aeaf98: cmp eax, -1
0x145aeaf9b: je 0x145aeafe8
0x145aeaf9d: mov qword ptr [rbp + 0x190], rcx
0x145aeafa4: mov qword ptr [rbp + 0x1a0], rdx
0x145aeafab: call qword ptr [rdx + 0x30]
0x145aeafae: nop
0x145aeafaf: mov rax, qword ptr [rbp + 0x1a0]
0x145aeafb6: mov rax, qword ptr [rax]
0x145aeafb9: test rax, rax
0x145aeafbc: je 0x145aeafc8
0x145aeafbe: mov rcx, qword ptr [rbp + 0x190]
0x145aeafc5: call rax
0x145aeafc7: nop
0x145aeafc8: mov rax, qword ptr [rbp + 0x1a0]
0x145aeafcf: mov rdx, qword ptr [rax + 8]
0x145aeafd3: test rdx, rdx
0x145aeafd6: mov rcx, qword ptr [rbp + 0x190]
0x145aeafdd: je 0x145aeafe8
0x145aeafdf: mov r8, qword ptr [rax + 0x10]
0x145aeafe3: call 0x1400021d0
0x145aeafe8: mov rax, qword ptr [rbp + 0x1b0]
0x145aeafef: mov qword ptr [rbp + 0xa8], rax
0x145aeaff6: mov rax, qword ptr [rbp + 0x1a8]
0x145aeaffd: mov qword ptr [rbp + 0xb0], rax
0x145aeb004: mov qword ptr [rbp + 0xb8], rsi
0x145aeb00b: movabs rax, 0x8000000000000007
0x145aeb015: mov qword ptr [rbp + 0xa0], rax
0x145aeb01c: mov rcx, qword ptr [r13]
0x145aeb020: mov rax, qword ptr [r13 + 0x18]
0x145aeb024: cmp rax, rcx
0x145aeb027: jne 0x145aeb03a
0x145aeb029: mov rcx, r13
0x145aeb02c: call 0x145adfdc0
0x145aeb031: nop
0x145aeb032: mov rcx, qword ptr [r13]
0x145aeb036: mov rax, qword ptr [r13 + 0x18]
0x145aeb03a: lea rdx, [rax + 1]
0x145aeb03e: mov qword ptr [r13 + 0x18], rdx
0x145aeb042: add rax, qword ptr [r13 + 0x10]
0x145aeb046: cmp rax, rcx
0x145aeb049: mov edx, 0
0x145aeb04e: cmovae rdx, rcx
0x145aeb052: sub rax, rdx
0x145aeb055: mov rcx, qword ptr [r13 + 8]
0x145aeb059: imul rax, rax, 0x78
0x145aeb05d: mov rdx, qword ptr [rbp + 0x110]
0x145aeb064: mov qword ptr [rcx + rax + 0x70], rdx
0x145aeb069: movups xmm0, xmmword ptr [rbp + 0x100]
0x145aeb070: movups xmmword ptr [rcx + rax + 0x60], xmm0
0x145aeb075: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145aeb07c: movups xmmword ptr [rcx + rax + 0x50], xmm0
0x145aeb081: movups xmm0, xmmword ptr [rbp + 0xe0]
0x145aeb088: movups xmmword ptr [rcx + rax + 0x40], xmm0
0x145aeb08d: movups xmm0, xmmword ptr [rbp + 0xa0]
0x145aeb094: movups xmm1, xmmword ptr [rbp + 0xb0]
0x145aeb09b: movdqu xmm2, xmmword ptr [rbp + 0xc0]
0x145aeb0a3: movups xmm3, xmmword ptr [rbp + 0xd0]
0x145aeb0aa: movups xmmword ptr [rcx + rax + 0x30], xmm3
0x145aeb0af: movdqu xmmword ptr [rcx + rax + 0x20], xmm2
0x145aeb0b5: movups xmmword ptr [rcx + rax + 0x10], xmm1
0x145aeb0ba: movups xmmword ptr [rcx + rax], xmm0
0x145aeb0be: jmp 0x145aeb7e0
0x145aeb0c3: mov qword ptr [rbp + 0x188], rdx
0x145aeb0ca: mov rsi, r12
0x145aeb0cd: mov rax, qword ptr [rbp + 0x18]
0x145aeb0d1: mov qword ptr [rbp + 0x1a0], rax
0x145aeb0d8: mov r12, qword ptr [rbp + 0x20]
0x145aeb0dc: mov rcx, qword ptr [r13 + 0x70]
0x145aeb0e0: mov rdx, qword ptr [r13 + 0x78]
0x145aeb0e4: mov eax, dword ptr [r13 + 0x88]
0x145aeb0eb: mov dword ptr [r13 + 0x88], 0xffffffff
0x145aeb0f6: cmp eax, -1
0x145aeb0f9: je 0x145aeb146
0x145aeb0fb: mov qword ptr [rbp + 0x1a8], rcx
0x145aeb102: mov qword ptr [rbp + 0x1b0], rdx
0x145aeb109: call qword ptr [rdx + 0x30]
0x145aeb10c: nop
0x145aeb10d: mov rax, qword ptr [rbp + 0x1b0]
0x145aeb114: mov rax, qword ptr [rax]
0x145aeb117: test rax, rax
0x145aeb11a: je 0x145aeb126
0x145aeb11c: mov rcx, qword ptr [rbp + 0x1a8]
0x145aeb123: call rax
0x145aeb125: nop
0x145aeb126: mov rax, qword ptr [rbp + 0x1b0]
0x145aeb12d: mov rdx, qword ptr [rax + 8]
0x145aeb131: test rdx, rdx
0x145aeb134: mov rcx, qword ptr [rbp + 0x1a8]
0x145aeb13b: je 0x145aeb146
0x145aeb13d: mov r8, qword ptr [rax + 0x10]
0x145aeb141: call 0x1400021d0
0x145aeb146: mov rax, qword ptr [r13 + 0xa0]
0x145aeb14d: mov byte ptr [rbp + 0x1c1], 1
0x145aeb154: mov rcx, qword ptr [rbp + 0x1a0]
0x145aeb15b: mov rdx, r12
0x145aeb15e: call rax
0x145aeb160: mov qword ptr [rbp + 0x1a8], rax
0x145aeb167: mov qword ptr [rbp + 0x1b0], rdx
0x145aeb16e: lea rax, [rbp + 0x28]
0x145aeb172: movups xmm0, xmmword ptr [rax + 0x50]
0x145aeb176: lea rcx, [rbp + 0xa8]
0x145aeb17d: movups xmmword ptr [rcx + 0x50], xmm0
0x145aeb181: movups xmm0, xmmword ptr [rax + 0x40]
0x145aeb185: movups xmmword ptr [rcx + 0x40], xmm0
0x145aeb189: movdqu xmm0, xmmword ptr [rax]
0x145aeb18d: movdqu xmm1, xmmword ptr [rax + 0x10]
0x145aeb192: movdqu xmm2, xmmword ptr [rax + 0x20]
0x145aeb197: movups xmm3, xmmword ptr [rax + 0x30]
0x145aeb19b: movups xmmword ptr [rcx + 0x30], xmm3
0x145aeb19f: movdqu xmmword ptr [rcx + 0x20], xmm2
0x145aeb1a4: movdqu xmmword ptr [rcx + 0x10], xmm1
0x145aeb1a9: movdqu xmmword ptr [rcx], xmm0
0x145aeb1ad: movabs rax, 0x800000000000000a
0x145aeb1b7: mov qword ptr [rbp + 0xa0], rax
0x145aeb1be: lea rdi, [rbp - 0x40]
0x145aeb1c2: mov rcx, rdi
0x145aeb1c5: mov rdx, r14
0x145aeb1c8: call 0x145e03b40
0x145aeb1cd: nop
0x145aeb1ce: mov r12, rsi
0x145aeb1d1: mov rcx, qword ptr [rbp + 0x1a8]
0x145aeb1d8: mov rdx, rdi
0x145aeb1db: mov rax, qword ptr [rbp + 0x1b0]
0x145aeb1e2: call qword ptr [rax + 0x18]
0x145aeb1e5: nop
0x145aeb1e6: mov rcx, r14
0x145aeb1e9: call 0x145ae64c0
0x145aeb1ee: nop
0x145aeb1ef: call 0x145f4d690
0x145aeb1f4: nop
0x145aeb1f5: mov edi, 0x4c4
0x145aeb1fa: mov esi, edx
0x145aeb1fc: mov qword ptr [rbp + 0x190], rax
0x145aeb203: cmp dword ptr [r13 + 0x88], -1
0x145aeb20b: je 0x145aeb268
0x145aeb20d: mov dword ptr [rbp + 0x164], esi
0x145aeb213: mov rax, qword ptr [r13 + 0x70]
0x145aeb217: mov qword ptr [rbp + 0x170], rax
0x145aeb21e: mov rax, qword ptr [r13 + 0x78]
0x145aeb222: mov qword ptr [rbp + 0x98], rax
0x145aeb229: mov rax, qword ptr [rax]
0x145aeb22c: test rax, rax
0x145aeb22f: je 0x145aeb23b
0x145aeb231: mov rcx, qword ptr [rbp + 0x170]
0x145aeb238: call rax
0x145aeb23a: nop
0x145aeb23b: mov rcx, qword ptr [rbp + 0x170]
0x145aeb242: mov rax, qword ptr [rbp + 0x98]
0x145aeb249: mov rdx, qword ptr [rax + 8]
0x145aeb24d: test rdx, rdx
0x145aeb250: mov r13, qword ptr [rbp + 0x168]
0x145aeb257: mov esi, dword ptr [rbp + 0x164]
0x145aeb25d: je 0x145aeb268
0x145aeb25f: mov r8, qword ptr [rax + 0x10]
0x145aeb263: call 0x1400021d0
0x145aeb268: mov rax, qword ptr [rbp + 0x1a8]
0x145aeb26f: mov qword ptr [r13 + 0x70], rax
0x145aeb273: mov rax, qword ptr [rbp + 0x1b0]
0x145aeb27a: mov qword ptr [r13 + 0x78], rax
0x145aeb27e: mov rax, qword ptr [rbp + 0x190]
0x145aeb285: mov qword ptr [r13 + 0x80], rax
0x145aeb28c: mov dword ptr [r13 + 0x88], esi
0x145aeb293: cmp qword ptr [rbp + 0x180], 0
0x145aeb29b: je 0x145aeb7e0
0x145aeb2a1: mov r8d, 1
0x145aeb2a7: mov rcx, qword ptr [rbp + 0x1a0]
0x145aeb2ae: mov rdx, qword ptr [rbp + 0x180]
0x145aeb2b5: call 0x1400021d0
0x145aeb2ba: jmp 0x145aeb7e0
0x145aeb2bf: mov qword ptr [rbp + 0x188], rdx
0x145aeb2c6: mov r8d, dword ptr [rbp + 0x18]
0x145aeb2ca: mov qword ptr [rbp + 0xa0], 0
0x145aeb2d5: mov qword ptr [rbp + 0xa8], 8
0x145aeb2e0: lea rax, [rbp + 0xa8]
0x145aeb2e7: movups xmmword ptr [rax + 8], xmm6
0x145aeb2eb: mov byte ptr [rbp + 0xc0], 1
0x145aeb2f2: mov byte ptr [rbp + 0x1c6], 1
0x145aeb2f9: mov byte ptr [rbp + 0x1c5], 1
0x145aeb300: mov byte ptr [rbp + 0x1c4], 1
0x145aeb307: mov byte ptr [rbp + 0x1c3], 1
0x145aeb30e: mov byte ptr [rbp + 0x1c2], 1
0x145aeb315: lea rcx, [rbp - 0x40]
0x145aeb319: mov rdx, qword ptr [rbp - 0x18]
0x145aeb31d: mov dword ptr [rbp + 0x1b0], r8d
0x145aeb324: mov r9, r14
0x145aeb327: call 0x145b2f930
0x145aeb32c: nop
0x145aeb32d: mov rax, qword ptr [rbp - 0x40]
0x145aeb331: cmp rax, -1
0x145aeb335: je 0x145aeb596
0x145aeb33b: mov qword ptr [rbp + 0x1a8], rax
0x145aeb342: mov qword ptr [rbp + 0x1a0], r12
0x145aeb349: mov r12, qword ptr [rbp - 0x28]
0x145aeb34d: test r12, r12
0x145aeb350: je 0x145aeb565
0x145aeb356: mov r14, qword ptr [rbp - 0x38]
0x145aeb35a: mov rax, qword ptr [rbp - 0x30]
0x145aeb35e: mov r9, qword ptr [rbp + 0x1a8]
0x145aeb365: cmp rax, r9
0x145aeb368: mov rcx, r9
0x145aeb36b: mov r8d, 0
0x145aeb371: cmovb rcx, r8
0x145aeb375: mov rdx, rax
0x145aeb378: sub rdx, rcx
0x145aeb37b: mov r10, r9
0x145aeb37e: sub r10, rdx
0x145aeb381: lea rdi, [rdx + r12]
0x145aeb385: mov qword ptr [rbp + 0x190], r12
0x145aeb38c: mov qword ptr [rbp + 0x170], r10
0x145aeb393: sub r12, r10
0x145aeb396: cmovb r12, r8
0x145aeb39a: cmova rdi, r9
0x145aeb39e: sub rdi, rdx
0x145aeb3a1: jne 0x145aeb807
0x145aeb3a7: mov rax, qword ptr [rbp + 0x170]
0x145aeb3ae: cmp rax, qword ptr [rbp + 0x190]
0x145aeb3b5: mov r13, qword ptr [rbp + 0x168]
0x145aeb3bc: mov edi, 0x4c4
0x145aeb3c1: jae 0x145aeb565
0x145aeb3c7: add r14, 8
0x145aeb3cb: jmp 0x145aeb3dd
0x145aeb3cd: nop dword ptr [rax]
0x145aeb3d0: add r14, 0x18
0x145aeb3d4: dec r12
0x145aeb3d7: je 0x145aeb565
0x145aeb3dd: mov rdx, qword ptr [r14 - 8]
0x145aeb3e1: test rdx, rdx
0x145aeb3e4: je 0x145aeb3d0
0x145aeb3e6: mov rcx, qword ptr [r14]
0x145aeb3e9: mov r8d, 1
0x145aeb3ef: call 0x1400021d0
0x145aeb3f4: jmp 0x145aeb3d0
0x145aeb3f6: mov r14d, dword ptr [rbp + 0x18]
0x145aeb3fa: mov dword ptr [rbp + 0xa0], r14d
0x145aeb401: cmp qword ptr [r13 + 0xc0], 0
0x145aeb409: je 0x145aeb6f4
0x145aeb40f: mov rcx, qword ptr [rbp + 0x90]
0x145aeb416: lea rdx, [rbp + 0xa0]
0x145aeb41d: call 0x140518720
0x145aeb422: mov r8, rax
0x145aeb425: shr r8, 0x39
0x145aeb429: mov rcx, qword ptr [r13 + 0xa8]
0x145aeb430: mov rdx, qword ptr [r13 + 0xb0]
0x145aeb437: movd xmm0, r8d
0x145aeb43c: punpcklbw xmm0, xmm0
0x145aeb440: pshuflw xmm0, xmm0, 0
0x145aeb445: pshufd xmm0, xmm0, 0x44
0x145aeb44a: xor r8d, r8d
0x145aeb44d: and rax, rdx
0x145aeb450: movdqu xmm1, xmmword ptr [rcx + rax]
0x145aeb455: movdqa xmm2, xmm1
0x145aeb459: pcmpeqb xmm2, xmm0
0x145aeb45d: pmovmskb r9d, xmm2
0x145aeb462: test r9d, r9d
0x145aeb465: je 0x145aeb4a0
0x145aeb467: tzcnt r10d, r9d
0x145aeb46c: add r10, rax
0x145aeb46f: and r10, rdx
0x145aeb472: neg r10
0x145aeb475: lea r10, [r10 + r10*2]
0x145aeb479: shl r10, 4
0x145aeb47d: cmp r14d, dword ptr [rcx + r10 - 0x30]
0x145aeb482: je 0x145aeb6ed
0x145aeb488: lea r10d, [r9 - 1]
0x145aeb48c: and r10w, r9w
0x145aeb490: mov r9d, r10d
0x145aeb493: jne 0x145aeb467
0x145aeb495: nop word ptr cs:[rax + rax]
0x145aeb4a0: pcmpeqb xmm1, xmm7
0x145aeb4a4: pmovmskb r9d, xmm1
0x145aeb4a9: test r9d, r9d
0x145aeb4ac: jne 0x145aeb6f4
0x145aeb4b2: add rax, r8
0x145aeb4b5: add rax, 0x10
0x145aeb4b9: add r8, 0x10
0x145aeb4bd: jmp 0x145aeb44d
0x145aeb4bf: mov qword ptr [rbp + 0x188], rdx
0x145aeb4c6: mov r14d, dword ptr [rbp + 0x30]
0x145aeb4ca: test r14d, r14d
0x145aeb4cd: jne 0x145aeb60f
0x145aeb4d3: cmp byte ptr [r13 + 0xd8], 0
0x145aeb4db: je 0x145aeb60f
0x145aeb4e1: mov rax, qword ptr [rbp + 0x18]
0x145aeb4e5: mov qword ptr [rbp + 0x1b0], rax
0x145aeb4ec: mov rax, qword ptr [rbp + 0x20]
0x145aeb4f0: mov qword ptr [rbp + 0x1a8], rax
0x145aeb4f7: mov rsi, qword ptr [rbp + 0x28]
0x145aeb4fb: mov rcx, qword ptr [r13 + 0x40]
0x145aeb4ff: mov rax, qword ptr [r13 + 0x58]
0x145aeb503: cmp rax, rcx
0x145aeb506: lea r14, [rbp + 0xa0]
0x145aeb50d: jne 0x145aeb521
0x145aeb50f: mov rcx, qword ptr [rbp + 8]
0x145aeb513: call 0x1418d5040
0x145aeb518: nop
0x145aeb519: mov rcx, qword ptr [r13 + 0x40]
0x145aeb51d: mov rax, qword ptr [r13 + 0x58]
0x145aeb521: lea rdx, [rax + 1]
0x145aeb525: mov qword ptr [r13 + 0x58], rdx
0x145aeb529: add rax, qword ptr [r13 + 0x50]
0x145aeb52d: cmp rax, rcx
0x145aeb530: mov edx, 0
0x145aeb535: cmovae rdx, rcx
0x145aeb539: sub rax, rdx
0x145aeb53c: mov rcx, qword ptr [r13 + 0x48]
0x145aeb540: lea rax, [rax + rax*2]
0x145aeb544: mov rdx, qword ptr [rbp + 0x1b0]
0x145aeb54b: mov qword ptr [rcx + rax*8], rdx
0x145aeb54f: mov rdx, qword ptr [rbp + 0x1a8]
0x145aeb556: mov qword ptr [rcx + rax*8 + 8], rdx
0x145aeb55b: mov qword ptr [rcx + rax*8 + 0x10], rsi
0x145aeb560: jmp 0x145aeb7e0
0x145aeb565: mov rax, qword ptr [rbp + 0x1a8]
0x145aeb56c: test rax, rax
0x145aeb56f: mov r12, qword ptr [rbp + 0x1a0]
0x145aeb576: lea r14, [rbp + 0xa0]
0x145aeb57d: je 0x145aeb596
0x145aeb57f: mov rcx, qword ptr [rbp - 0x38]
0x145aeb583: shl rax, 3
0x145aeb587: lea rdx, [rax + rax*2]
0x145aeb58b: mov r8d, 8
0x145aeb591: call 0x1400021d0
0x145aeb596: mov rcx, qword ptr [r13 + 0x20]
0x145aeb59a: mov rax, qword ptr [r13 + 0x38]
0x145aeb59e: cmp rax, rcx
0x145aeb5a1: jne 0x145aeb5d8
0x145aeb5a3: mov byte ptr [rbp + 0x1c6], 1
0x145aeb5aa: mov byte ptr [rbp + 0x1c5], 1
0x145aeb5b1: mov byte ptr [rbp + 0x1c4], 1
0x145aeb5b8: mov byte ptr [rbp + 0x1c3], 1
0x145aeb5bf: mov byte ptr [rbp + 0x1c2], 1
0x145aeb5c6: mov rcx, qword ptr [rbp]
0x145aeb5ca: call 0x1423e53e0
0x145aeb5cf: nop
0x145aeb5d0: mov rcx, qword ptr [r13 + 0x20]
0x145aeb5d4: mov rax, qword ptr [r13 + 0x38]
0x145aeb5d8: lea rdx, [rax + 1]
0x145aeb5dc: mov qword ptr [r13 + 0x38], rdx
0x145aeb5e0: add rax, qword ptr [r13 + 0x30]
0x145aeb5e4: cmp rax, rcx
0x145aeb5e7: mov edx, 0
0x145aeb5ec: cmovae rdx, rcx
0x145aeb5f0: sub rax, rdx
0x145aeb5f3: mov rcx, qword ptr [r13 + 0x28]
0x145aeb5f7: mov edx, dword ptr [rbp + 0x1b0]
0x145aeb5fd: mov dword ptr [rcx + rax*4], edx
0x145aeb600: cmp rsi, 0xa
0x145aeb604: jbe 0x145aeb7c1
0x145aeb60a: jmp 0x145aeb7c7
0x145aeb60f: mov dword ptr [rbp + 0xa0], r14d
0x145aeb616: mov rax, qword ptr [rbp + 0x18]
0x145aeb61a: mov qword ptr [rbp + 0x1b0], rax
0x145aeb621: mov rax, qword ptr [rbp + 0x20]
0x145aeb625: mov qword ptr [rbp + 0x1a8], rax
0x145aeb62c: cmp qword ptr [r13 + 0xc0], 0
0x145aeb634: je 0x145aeb70a
0x145aeb63a: mov rax, qword ptr [rbp + 0x28]
0x145aeb63e: mov qword ptr [rbp + 0x1a0], rax
0x145aeb645: mov rcx, qword ptr [rbp + 0x90]
0x145aeb64c: lea rdx, [rbp + 0xa0]
0x145aeb653: call 0x140518720
0x145aeb658: mov rdx, rax
0x145aeb65b: shr rdx, 0x39
0x145aeb65f: mov rcx, qword ptr [rbp + 0x168]
0x145aeb666: mov r13, qword ptr [rcx + 0xa8]
0x145aeb66d: mov rcx, qword ptr [rcx + 0xb0]
0x145aeb674: movd xmm0, edx
0x145aeb678: punpcklbw xmm0, xmm0
0x145aeb67c: pshuflw xmm0, xmm0, 0
0x145aeb681: pshufd xmm0, xmm0, 0x44
0x145aeb686: xor edx, edx
0x145aeb688: and rax, rcx
0x145aeb68b: movdqu xmm1, xmmword ptr [r13 + rax]
0x145aeb692: movdqa xmm2, xmm1
0x145aeb696: pcmpeqb xmm2, xmm0
0x145aeb69a: pmovmskb r8d, xmm2
0x145aeb69f: test r8d, r8d
0x145aeb6a2: je 0x145aeb6d2
0x145aeb6a4: tzcnt r9d, r8d
0x145aeb6a9: add r9, rax
0x145aeb6ac: and r9, rcx
0x145aeb6af: neg r9
0x145aeb6b2: lea r9, [r9 + r9*2]
0x145aeb6b6: shl r9, 4
0x145aeb6ba: cmp r14d, dword ptr [r13 + r9 - 0x30]
0x145aeb6bf: je 0x145aeb745
0x145aeb6c5: lea r9d, [r8 - 1]
0x145aeb6c9: and r9w, r8w
0x145aeb6cd: mov r8d, r9d
0x145aeb6d0: jne 0x145aeb6a4
0x145aeb6d2: pcmpeqb xmm1, xmm7
0x145aeb6d6: pmovmskb r8d, xmm1
0x145aeb6db: test r8d, r8d
0x145aeb6de: jne 0x145aeb70a
0x145aeb6e0: add rax, rdx
0x145aeb6e3: add rax, 0x10
0x145aeb6e7: add rdx, 0x10
0x145aeb6eb: jmp 0x145aeb688
0x145aeb6ed: add rcx, r10
0x145aeb6f0: mov byte ptr [rcx - 8], 0
0x145aeb6f4: lea r14, [rbp + 0xa0]
0x145aeb6fb: cmp rsi, 0xa
0x145aeb6ff: jbe 0x145aeb7c1
0x145aeb705: jmp 0x145aeb7c7
0x145aeb70a: mov rdx, qword ptr [rbp + 0x1b0]
0x145aeb711: test rdx, rdx
0x145aeb714: lea r14, [rbp + 0xa0]
0x145aeb71b: je 0x145aeb72f
0x145aeb71d: mov r8d, 1
0x145aeb723: mov rcx, qword ptr [rbp + 0x1a8]
0x145aeb72a: call 0x1400021d0
0x145aeb72f: mov r13, qword ptr [rbp + 0x168]
0x145aeb736: cmp rsi, 0xa
0x145aeb73a: jbe 0x145aeb7c1
0x145aeb740: jmp 0x145aeb7c7
0x145aeb745: add r13, r9
0x145aeb748: mov rcx, qword ptr [r13 - 0x28]
0x145aeb74c: mov rax, qword ptr [r13 - 0x10]
0x145aeb750: cmp rax, rcx
0x145aeb753: lea r14, [rbp + 0xa0]
0x145aeb75a: jne 0x145aeb76e
0x145aeb75c: lea rcx, [r13 - 0x28]
0x145aeb760: call 0x1418d5040
0x145aeb765: nop
0x145aeb766: mov rcx, qword ptr [r13 - 0x28]
0x145aeb76a: mov rax, qword ptr [r13 - 0x10]
0x145aeb76e: lea rdx, [rax + 1]
0x145aeb772: mov qword ptr [r13 - 0x10], rdx
0x145aeb776: add rax, qword ptr [r13 - 0x18]
0x145aeb77a: cmp rax, rcx
0x145aeb77d: mov edx, 0
0x145aeb782: cmovae rdx, rcx
0x145aeb786: sub rax, rdx
0x145aeb789: mov rcx, qword ptr [r13 - 0x20]
0x145aeb78d: lea rax, [rax + rax*2]
0x145aeb791: mov rdx, qword ptr [rbp + 0x1b0]
0x145aeb798: mov qword ptr [rcx + rax*8], rdx
0x145aeb79c: mov rdx, qword ptr [rbp + 0x1a8]
0x145aeb7a3: mov qword ptr [rcx + rax*8 + 8], rdx
0x145aeb7a8: mov rdx, qword ptr [rbp + 0x1a0]
0x145aeb7af: mov qword ptr [rcx + rax*8 + 0x10], rdx
0x145aeb7b4: mov r13, qword ptr [rbp + 0x168]
0x145aeb7bb: cmp rsi, 0xa
0x145aeb7bf: ja 0x145aeb7c7
0x145aeb7c1: bt rdi, rsi
0x145aeb7c5: jb 0x145aeb7e0
0x145aeb7c7: lea rcx, [rbp + 0x10]
0x145aeb7cb: call 0x145ae6290
0x145aeb7d0: nop
0x145aeb7d1: nop word ptr cs:[rax + rax]
0x145aeb7e0: mov rdx, qword ptr [rbp + 0x198]
0x145aeb7e7: test rdx, rdx
0x145aeb7ea: je 0x145aeacf0
0x145aeb7f0: mov r8d, 1
0x145aeb7f6: mov rcx, qword ptr [rbp + 0x178]
0x145aeb7fd: call 0x1400021d0
0x145aeb802: jmp 0x145aeacf0
0x145aeb807: shl rax, 3
0x145aeb80b: lea rax, [rax + rax*2]
0x145aeb80f: shl rcx, 3
0x145aeb813: lea rcx, [rcx + rcx*2]
0x145aeb817: sub rax, rcx
0x145aeb81a: lea r13, [r14 + rax]
0x145aeb81e: add r13, 8
0x145aeb822: jmp 0x145aeb83d
0x145aeb824: nop word ptr cs:[rax + rax]
0x145aeb830: add r13, 0x18
0x145aeb834: dec rdi
0x145aeb837: je 0x145aeb3a7
0x145aeb83d: mov rdx, qword ptr [r13 - 8]
0x145aeb841: test rdx, rdx
0x145aeb844: je 0x145aeb830
0x145aeb846: mov rcx, qword ptr [r13]
0x145aeb84a: mov r8d, 1
0x145aeb850: call 0x1400021d0
0x145aeb855: jmp 0x145aeb830
0x145aeb857: cmp qword ptr [rbp + 0x88], rbx
0x145aeb85e: je 0x145aeb8a2
0x145aeb860: movabs rcx, 0xaaaaaaaaaaaaaaab
0x145aeb86a: mov rax, r12
0x145aeb86d: mul rcx
0x145aeb870: mov rdi, rdx
0x145aeb873: shr rdi, 4
0x145aeb877: jmp 0x145aeb889
0x145aeb879: nop dword ptr [rax]
0x145aeb880: add r15, 0x18
0x145aeb884: dec rdi
0x145aeb887: je 0x145aeb8a2
0x145aeb889: mov rdx, qword ptr [r15 - 8]
0x145aeb88d: test rdx, rdx
0x145aeb890: je 0x145aeb880
0x145aeb892: mov rcx, qword ptr [r15]
0x145aeb895: mov r8d, 1
0x145aeb89b: call 0x1400021d0
0x145aeb8a0: jmp 0x145aeb880
0x145aeb8a2: mov rax, qword ptr [rbp - 0x10]
0x145aeb8a6: test rax, rax
0x145aeb8a9: je 0x145aeb8c2
0x145aeb8ab: shl rax, 3
0x145aeb8af: lea rdx, [rax + rax*2]
0x145aeb8b3: mov r8d, 8
0x145aeb8b9: mov rcx, qword ptr [rbp - 8]
0x145aeb8bd: call 0x1400021d0
0x145aeb8c2: lea rcx, [r13 + 0x60]
0x145aeb8c6: mov byte ptr [rbp + 0x1c7], 0
0x145aeb8cd: call 0x145f4d7e0
0x145aeb8d2: nop
0x145aeb8d3: test rax, rax
0x145aeb8d6: js 0x145aeb8e2
0x145aeb8d8: xorps xmm0, xmm0
0x145aeb8db: cvtsi2ss xmm0, rax
0x145aeb8e0: jmp 0x145aeb8fa
0x145aeb8e2: mov rcx, rax
0x145aeb8e5: shr rcx, 1
0x145aeb8e8: and eax, 1
0x145aeb8eb: or rax, rcx
0x145aeb8ee: xorps xmm0, xmm0
0x145aeb8f1: cvtsi2ss xmm0, rax
0x145aeb8f6: addss xmm0, xmm0
0x145aeb8fa: xorps xmm1, xmm1
0x145aeb8fd: cvtsi2ss xmm1, edx
0x145aeb901: divss xmm1, dword ptr [rip + 0x7073a7]
0x145aeb909: addss xmm1, xmm0
0x145aeb90d: ucomiss xmm1, dword ptr [rip + 0x6c59fc]
0x145aeb914: jb 0x145aeb9ef
0x145aeb91a: mov byte ptr [rbp + 0x1c7], 0
0x145aeb921: call 0x145f4d690
0x145aeb926: nop
0x145aeb927: mov qword ptr [r13 + 0x60], rax
0x145aeb92b: mov dword ptr [r13 + 0x68], edx
0x145aeb92f: mov rcx, qword ptr [r13 + 0x90]
0x145aeb936: mov rax, qword ptr [r13 + 0x98]
0x145aeb93d: mov rax, qword ptr [rax + 0x28]
0x145aeb941: mov byte ptr [rbp + 0x1c7], 0
0x145aeb948: call rax
0x145aeb94a: nop
0x145aeb94b: cmp al, 1
0x145aeb94d: jne 0x145aeb990
0x145aeb94f: mov rsi, qword ptr [r13 + 0x90]
0x145aeb956: mov rdi, qword ptr [r13 + 0x98]
0x145aeb95d: mov byte ptr [rbp + 0x1c7], 0
0x145aeb964: lea rdx, [rip + 0x14c6925]
0x145aeb96b: lea rcx, [rbp + 0xa0]
0x145aeb972: call 0x145e03b40
0x145aeb977: nop
0x145aeb978: mov rax, qword ptr [rdi + 0x18]
0x145aeb97c: mov byte ptr [rbp + 0x1c7], 0
0x145aeb983: lea rdx, [rbp + 0xa0]
0x145aeb98a: mov rcx, rsi
0x145aeb98d: call rax
0x145aeb98f: nop
0x145aeb990: cmp dword ptr [r13 + 0x88], -1
0x145aeb998: je 0x145aeb9ef
0x145aeb99a: mov rcx, qword ptr [r13 + 0x70]
0x145aeb99e: mov rax, qword ptr [r13 + 0x78]
0x145aeb9a2: mov rax, qword ptr [rax + 0x28]
0x145aeb9a6: mov byte ptr [rbp + 0x1c7], 0
0x145aeb9ad: call rax
0x145aeb9af: nop
0x145aeb9b0: cmp al, 1
0x145aeb9b2: jne 0x145aeb9ef
0x145aeb9b4: mov rsi, qword ptr [r13 + 0x70]
0x145aeb9b8: mov rdi, qword ptr [r13 + 0x78]
0x145aeb9bc: mov byte ptr [rbp + 0x1c7], 0
0x145aeb9c3: lea rdx, [rip + 0x14c68c6]
0x145aeb9ca: lea rcx, [rbp + 0xa0]
0x145aeb9d1: call 0x145e03b40
0x145aeb9d6: nop
0x145aeb9d7: mov rax, qword ptr [rdi + 0x18]
0x145aeb9db: mov byte ptr [rbp + 0x1c7], 0
0x145aeb9e2: lea rdx, [rbp + 0xa0]
0x145aeb9e9: mov rcx, rsi
0x145aeb9ec: call rax
0x145aeb9ee: nop
0x145aeb9ef: movaps xmm6, xmmword ptr [rbp + 0x1d0]
0x145aeb9f6: movaps xmm7, xmmword ptr [rbp + 0x1e0]
0x145aeb9fd: add rsp, 0x278
0x145aeba04: pop rbx
0x145aeba05: pop rdi
0x145aeba06: pop rsi
0x145aeba07: pop r12
0x145aeba09: pop r13
0x145aeba0b: pop r14
0x145aeba0d: pop r15
0x145aeba0f: pop rbp
0x145aeba10: ret
