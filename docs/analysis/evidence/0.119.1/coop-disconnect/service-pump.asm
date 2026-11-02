0x145aad8b0: push rbp
0x145aad8b1: push r15
0x145aad8b3: push r14
0x145aad8b5: push r13
0x145aad8b7: push r12
0x145aad8b9: push rsi
0x145aad8ba: push rdi
0x145aad8bb: push rbx
0x145aad8bc: sub rsp, 0x278
0x145aad8c3: lea rbp, [rsp + 0x80]
0x145aad8cb: movdqa xmmword ptr [rbp + 0x1e0], xmm7
0x145aad8d3: movaps xmmword ptr [rbp + 0x1d0], xmm6
0x145aad8da: mov qword ptr [rbp + 0x1c8], 0xfffffffffffffffe
0x145aad8e5: mov r13, rcx
0x145aad8e8: cmp dword ptr [rcx + 0x88], -1
0x145aad8ef: je 0x145aad951
0x145aad8f1: mov rcx, qword ptr [r13 + 0x70]
0x145aad8f5: mov rax, qword ptr [r13 + 0x78]
0x145aad8f9: call qword ptr [rax + 0x28]
0x145aad8fc: test al, al
0x145aad8fe: jne 0x145aad951
0x145aad900: lea rcx, [r13 + 0x80]
0x145aad907: call 0x145f41110
0x145aad90c: test rax, rax
0x145aad90f: js 0x145aad918
0x145aad911: cvtsi2ss xmm0, rax
0x145aad916: jmp 0x145aad92d
0x145aad918: mov rcx, rax
0x145aad91b: shr rcx, 1
0x145aad91e: and eax, 1
0x145aad921: or rax, rcx
0x145aad924: cvtsi2ss xmm0, rax
0x145aad929: addss xmm0, xmm0
0x145aad92d: cvtsi2ss xmm1, edx
0x145aad931: divss xmm1, dword ptr [rip + 0x738ea7]
0x145aad939: addss xmm1, xmm0
0x145aad93d: ucomiss xmm1, dword ptr [rip + 0x6b94bc]
0x145aad944: jbe 0x145aad951
0x145aad946: mov rcx, qword ptr [r13 + 0x70]
0x145aad94a: mov rax, qword ptr [r13 + 0x78]
0x145aad94e: call qword ptr [rax + 0x30]
0x145aad951: mov qword ptr [rbp + 0x148], 0
0x145aad95c: mov qword ptr [rbp + 0x150], 8
0x145aad967: mov qword ptr [rbp + 0x158], 0
0x145aad972: lea rsi, [rbp + 0xa0]
0x145aad979: lea rdi, [rbp + 0x148]
0x145aad980: jmp 0x145aad9bc
0x145aad982: nop word ptr cs:[rax + rax]
0x145aad990: mov rax, qword ptr [rbp + 0x150]
0x145aad997: lea rcx, [rbx + rbx*2]
0x145aad99b: mov rdx, qword ptr [rbp + 0xb0]
0x145aad9a2: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145aad9a7: movups xmm0, xmmword ptr [rbp + 0xa0]
0x145aad9ae: movups xmmword ptr [rax + rcx*8], xmm0
0x145aad9b2: inc rbx
0x145aad9b5: mov qword ptr [rbp + 0x158], rbx
0x145aad9bc: mov rdx, qword ptr [r13 + 0x90]
0x145aad9c3: mov rax, qword ptr [r13 + 0x98]
0x145aad9ca: mov rax, qword ptr [rax + 0x20]
0x145aad9ce: mov byte ptr [rbp + 0x1c7], 1
0x145aad9d5: mov rcx, rsi
0x145aad9d8: call rax
0x145aad9da: nop
0x145aad9db: mov rax, qword ptr [rbp + 0xa0]
0x145aad9e2: cmp rax, -1
0x145aad9e6: je 0x145aada1b
0x145aad9e8: mov qword ptr [rbp + 0x198], rax
0x145aad9ef: mov rbx, qword ptr [rbp + 0x158]
0x145aad9f6: cmp rbx, qword ptr [rbp + 0x148]
0x145aad9fd: jne 0x145aad990
0x145aad9ff: mov rax, qword ptr [rbp + 0xa8]
0x145aada06: mov qword ptr [rbp + 0x178], rax
0x145aada0d: mov rcx, rdi
0x145aada10: call 0x145f97890
0x145aada15: nop
0x145aada16: jmp 0x145aad990
0x145aada1b: cmp dword ptr [r13 + 0x88], -1
0x145aada23: je 0x145aadac5
0x145aada29: lea rsi, [rbp + 0xa0]
0x145aada30: lea rdi, [rbp + 0x148]
0x145aada37: jmp 0x145aada6c
0x145aada39: nop dword ptr [rax]
0x145aada40: mov rax, qword ptr [rbp + 0x150]
0x145aada47: lea rcx, [rbx + rbx*2]
0x145aada4b: mov rdx, qword ptr [rbp + 0xb0]
0x145aada52: mov qword ptr [rax + rcx*8 + 0x10], rdx
0x145aada57: movups xmm0, xmmword ptr [rbp + 0xa0]
0x145aada5e: movups xmmword ptr [rax + rcx*8], xmm0
0x145aada62: inc rbx
0x145aada65: mov qword ptr [rbp + 0x158], rbx
0x145aada6c: mov rdx, qword ptr [r13 + 0x70]
0x145aada70: mov rax, qword ptr [r13 + 0x78]
0x145aada74: mov rax, qword ptr [rax + 0x20]
0x145aada78: mov byte ptr [rbp + 0x1c7], 1
0x145aada7f: mov rcx, rsi
0x145aada82: call rax
0x145aada84: nop
0x145aada85: mov rax, qword ptr [rbp + 0xa0]
0x145aada8c: cmp rax, -1
0x145aada90: je 0x145aadac5
0x145aada92: mov qword ptr [rbp + 0x198], rax
0x145aada99: mov rbx, qword ptr [rbp + 0x158]
0x145aadaa0: cmp rbx, qword ptr [rbp + 0x148]
0x145aadaa7: jne 0x145aada40
0x145aadaa9: mov rax, qword ptr [rbp + 0xa8]
0x145aadab0: mov qword ptr [rbp + 0x178], rax
0x145aadab7: mov rcx, rdi
0x145aadaba: call 0x145f97890
0x145aadabf: nop
0x145aadac0: jmp 0x145aada40
0x145aadac5: mov rdx, qword ptr [rbp + 0x148]
0x145aadacc: mov rcx, qword ptr [rbp + 0x150]
0x145aadad3: mov rax, qword ptr [rbp + 0x158]
0x145aadada: shl rax, 3
0x145aadade: lea r8, [rax + rax*2]
0x145aadae2: add r8, rcx
0x145aadae5: mov qword ptr [rbp - 0x60], rcx
0x145aadae9: mov qword ptr [rbp - 0x10], rdx
0x145aadaed: mov qword ptr [rbp - 0x50], rdx
0x145aadaf1: mov qword ptr [rbp + 0x88], r8
0x145aadaf8: mov qword ptr [rbp - 0x48], r8
0x145aadafc: lea rdx, [r13 + 0xa8]
0x145aadb03: mov qword ptr [rbp - 0x18], rdx
0x145aadb07: lea rdx, [r13 + 0x40]
0x145aadb0b: mov qword ptr [rbp + 8], rdx
0x145aadb0f: lea rdx, [r13 + 0x20]
0x145aadb13: mov qword ptr [rbp], rdx
0x145aadb17: lea rdx, [r13 + 0xc8]
0x145aadb1e: mov qword ptr [rbp + 0x90], rdx
0x145aadb25: lea r15, [rcx + 0x20]
0x145aadb29: lea r12, [rax + rax*2 - 0x18]
0x145aadb2e: lea r14, [rbp + 0xa0]
0x145aadb35: xorps xmm6, xmm6
0x145aadb38: pcmpeqd xmm7, xmm7
0x145aadb3c: mov edi, 0x4c4
0x145aadb41: mov qword ptr [rbp - 8], rcx
0x145aadb45: mov rax, rcx
0x145aadb48: mov qword ptr [rbp + 0x168], r13
0x145aadb4f: jmp 0x145aadb6b
0x145aadb51: nop word ptr cs:[rax + rax]
0x145aadb60: add r15, 0x18
0x145aadb64: add r12, -0x18
0x145aadb68: mov rax, rbx
0x145aadb6b: cmp rax, qword ptr [rbp + 0x88]
0x145aadb72: je 0x145aae712
0x145aadb78: lea rbx, [rax + 0x18]
0x145aadb7c: mov qword ptr [rbp - 0x58], rbx
0x145aadb80: mov rcx, qword ptr [rax]
0x145aadb83: cmp rcx, -1
0x145aadb87: je 0x145aae6c7
0x145aadb8d: mov qword ptr [rbp + 0x198], rcx
0x145aadb94: mov rdx, qword ptr [rax + 8]
0x145aadb98: mov r8, qword ptr [rax + 0x10]
0x145aadb9c: mov rcx, r14
0x145aadb9f: mov qword ptr [rbp + 0x178], rdx
0x145aadba6: call 0x145df8c10
0x145aadbab: nop
0x145aadbac: cmp qword ptr [rbp + 0xa0], -1
0x145aadbb4: je 0x145aae650
0x145aadbba: mov rax, qword ptr [rbp + 0x110]
0x145aadbc1: mov qword ptr [rbp + 0x80], rax
0x145aadbc8: movups xmm0, xmmword ptr [rbp + 0x100]
0x145aadbcf: movaps xmmword ptr [rbp + 0x70], xmm0
0x145aadbd3: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145aadbda: movaps xmmword ptr [rbp + 0x60], xmm0
0x145aadbde: movups xmm0, xmmword ptr [rbp + 0xe0]
0x145aadbe5: movaps xmmword ptr [rbp + 0x50], xmm0
0x145aadbe9: movdqu xmm0, xmmword ptr [rbp + 0xa0]
0x145aadbf1: movdqu xmm1, xmmword ptr [rbp + 0xb0]
0x145aadbf9: movdqu xmm2, xmmword ptr [rbp + 0xc0]
0x145aadc01: movups xmm3, xmmword ptr [rbp + 0xd0]
0x145aadc08: movaps xmmword ptr [rbp + 0x40], xmm3
0x145aadc0c: movdqa xmmword ptr [rbp + 0x30], xmm2
0x145aadc11: movdqa xmmword ptr [rbp + 0x20], xmm1
0x145aadc16: movdqa xmmword ptr [rbp + 0x10], xmm0
0x145aadc1b: mov rcx, qword ptr [rbp + 0x10]
0x145aadc1f: mov rsi, rcx
0x145aadc22: movabs rax, 0x8000000000000000
0x145aadc2c: xor rsi, rax
0x145aadc2f: mov qword ptr [rbp + 0x180], rcx
0x145aadc36: test rcx, rcx
0x145aadc39: mov eax, 0xa
0x145aadc3e: cmovns rsi, rax
0x145aadc42: lea rdx, [rsi - 2]
0x145aadc46: cmp rdx, 8
0x145aadc4a: ja 0x145aadcb6
0x145aadc4c: lea rcx, [rip + 0x18237d9]
0x145aadc53: movsxd rax, dword ptr [rcx + rdx*4]
0x145aadc57: add rax, rcx
0x145aadc5a: jmp rax
0x145aadc5c: mov qword ptr [rbp + 0x188], rdx
0x145aadc63: lea rcx, [rbp + 0x28]
0x145aadc67: mov rax, qword ptr [rcx]
0x145aadc6a: lea rdx, [rbp + 0xa8]
0x145aadc71: mov qword ptr [rdx + 0x10], rax
0x145aadc75: movdqu xmm0, xmmword ptr [rcx - 0x10]
0x145aadc7a: movdqu xmmword ptr [rdx], xmm0
0x145aadc7e: mov byte ptr [r13 + 0xd8], 1
0x145aadc86: movabs rax, 0x8000000000000002
0x145aadc90: mov qword ptr [rbp + 0xa0], rax
0x145aadc97: mov rcx, qword ptr [r13]
0x145aadc9b: mov rax, qword ptr [r13 + 0x18]
0x145aadc9f: cmp rax, rcx
0x145aadca2: jne 0x145aadeaa
0x145aadca8: mov rcx, r13
0x145aadcab: call 0x145c5f020
0x145aadcb0: nop
0x145aadcb1: jmp 0x145aadea2
0x145aadcb6: mov qword ptr [rbp + 0x188], rdx
0x145aadcbd: mov rax, qword ptr [rbp + 0x80]
0x145aadcc4: mov qword ptr [rbp + 0x110], rax
0x145aadccb: movaps xmm0, xmmword ptr [rbp + 0x70]
0x145aadccf: movaps xmmword ptr [rbp + 0x100], xmm0
0x145aadcd6: movaps xmm0, xmmword ptr [rbp + 0x60]
0x145aadcda: movaps xmmword ptr [rbp + 0xf0], xmm0
0x145aadce1: movaps xmm0, xmmword ptr [rbp + 0x50]
0x145aadce5: movaps xmmword ptr [rbp + 0xe0], xmm0
0x145aadcec: movdqa xmm0, xmmword ptr [rbp + 0x10]
0x145aadcf1: movdqa xmm1, xmmword ptr [rbp + 0x20]
0x145aadcf6: movdqa xmm2, xmmword ptr [rbp + 0x30]
0x145aadcfb: movaps xmm3, xmmword ptr [rbp + 0x40]
0x145aadcff: movaps xmmword ptr [rbp + 0xd0], xmm3
0x145aadd06: movdqa xmmword ptr [rbp + 0xc0], xmm2
0x145aadd0e: movdqa xmmword ptr [rbp + 0xb0], xmm1
0x145aadd16: movdqa xmmword ptr [rbp + 0xa0], xmm0
0x145aadd1e: mov rax, qword ptr [r13]
0x145aadd22: mov rcx, qword ptr [r13 + 0x18]
0x145aadd26: cmp rcx, rax
0x145aadd29: jne 0x145aadd3c
0x145aadd2b: mov rcx, r13
0x145aadd2e: call 0x145c5f020
0x145aadd33: nop
0x145aadd34: mov rax, qword ptr [r13]
0x145aadd38: mov rcx, qword ptr [r13 + 0x18]
0x145aadd3c: lea rdx, [rcx + 1]
0x145aadd40: mov qword ptr [r13 + 0x18], rdx
0x145aadd44: add rcx, qword ptr [r13 + 0x10]
0x145aadd48: cmp rcx, rax
0x145aadd4b: mov edx, 0
0x145aadd50: cmovb rax, rdx
0x145aadd54: sub rcx, rax
0x145aadd57: mov rax, qword ptr [r13 + 8]
0x145aadd5b: imul rcx, rcx, 0x78
0x145aadd5f: mov rdx, qword ptr [rbp + 0x110]
0x145aadd66: mov qword ptr [rax + rcx + 0x70], rdx
0x145aadd6b: movaps xmm0, xmmword ptr [rbp + 0x100]
0x145aadd72: movups xmmword ptr [rax + rcx + 0x60], xmm0
0x145aadd77: movaps xmm0, xmmword ptr [rbp + 0xf0]
0x145aadd7e: movups xmmword ptr [rax + rcx + 0x50], xmm0
0x145aadd83: movaps xmm0, xmmword ptr [rbp + 0xe0]
0x145aadd8a: movups xmmword ptr [rax + rcx + 0x40], xmm0
0x145aadd8f: movaps xmm0, xmmword ptr [rbp + 0xa0]
0x145aadd96: movaps xmm1, xmmword ptr [rbp + 0xb0]
0x145aadd9d: movdqa xmm2, xmmword ptr [rbp + 0xc0]
0x145aadda5: movaps xmm3, xmmword ptr [rbp + 0xd0]
0x145aaddac: movups xmmword ptr [rax + rcx + 0x30], xmm3
0x145aaddb1: movdqu xmmword ptr [rax + rcx + 0x20], xmm2
0x145aaddb7: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x145aaddbc: movups xmmword ptr [rax + rcx], xmm0
0x145aaddc0: jmp 0x145aae650
0x145aaddc5: mov qword ptr [rbp + 0x188], rdx
0x145aaddcc: mov rax, qword ptr [rbp + 0x18]
0x145aaddd0: mov qword ptr [rbp + 0x1b0], rax
0x145aaddd7: mov rax, qword ptr [rbp + 0x20]
0x145aadddb: mov qword ptr [rbp + 0x1a8], rax
0x145aadde2: mov rsi, qword ptr [rbp + 0x28]
0x145aadde6: mov byte ptr [r13 + 0xd8], 0
0x145aaddee: mov rcx, qword ptr [r13 + 0x70]
0x145aaddf2: mov rdx, qword ptr [r13 + 0x78]
0x145aaddf6: mov eax, dword ptr [r13 + 0x88]
0x145aaddfd: mov dword ptr [r13 + 0x88], 0xffffffff
0x145aade08: cmp eax, -1
0x145aade0b: je 0x145aade58
0x145aade0d: mov qword ptr [rbp + 0x190], rcx
0x145aade14: mov qword ptr [rbp + 0x1a0], rdx
0x145aade1b: call qword ptr [rdx + 0x30]
0x145aade1e: nop
0x145aade1f: mov rax, qword ptr [rbp + 0x1a0]
0x145aade26: mov rax, qword ptr [rax]
0x145aade29: test rax, rax
0x145aade2c: je 0x145aade38
0x145aade2e: mov rcx, qword ptr [rbp + 0x190]
0x145aade35: call rax
0x145aade37: nop
0x145aade38: mov rax, qword ptr [rbp + 0x1a0]
0x145aade3f: mov rdx, qword ptr [rax + 8]
0x145aade43: test rdx, rdx
0x145aade46: mov rcx, qword ptr [rbp + 0x190]
0x145aade4d: je 0x145aade58
0x145aade4f: mov r8, qword ptr [rax + 0x10]
0x145aade53: call 0x1400021d0
0x145aade58: mov rax, qword ptr [rbp + 0x1b0]
0x145aade5f: mov qword ptr [rbp + 0xa8], rax
0x145aade66: mov rax, qword ptr [rbp + 0x1a8]
0x145aade6d: mov qword ptr [rbp + 0xb0], rax
0x145aade74: mov qword ptr [rbp + 0xb8], rsi
0x145aade7b: movabs rax, 0x8000000000000007
0x145aade85: mov qword ptr [rbp + 0xa0], rax
0x145aade8c: mov rcx, qword ptr [r13]
0x145aade90: mov rax, qword ptr [r13 + 0x18]
0x145aade94: cmp rax, rcx
0x145aade97: jne 0x145aadeaa
0x145aade99: mov rcx, r13
0x145aade9c: call 0x145c5f020
0x145aadea1: nop
0x145aadea2: mov rcx, qword ptr [r13]
0x145aadea6: mov rax, qword ptr [r13 + 0x18]
0x145aadeaa: lea rdx, [rax + 1]
0x145aadeae: mov qword ptr [r13 + 0x18], rdx
0x145aadeb2: add rax, qword ptr [r13 + 0x10]
0x145aadeb6: cmp rax, rcx
0x145aadeb9: mov edx, 0
0x145aadebe: cmovae rdx, rcx
0x145aadec2: sub rax, rdx
0x145aadec5: mov rcx, qword ptr [r13 + 8]
0x145aadec9: imul rax, rax, 0x78
0x145aadecd: mov rdx, qword ptr [rbp + 0x110]
0x145aaded4: mov qword ptr [rcx + rax + 0x70], rdx
0x145aaded9: movups xmm0, xmmword ptr [rbp + 0x100]
0x145aadee0: movups xmmword ptr [rcx + rax + 0x60], xmm0
0x145aadee5: movups xmm0, xmmword ptr [rbp + 0xf0]
0x145aadeec: movups xmmword ptr [rcx + rax + 0x50], xmm0
0x145aadef1: movups xmm0, xmmword ptr [rbp + 0xe0]
0x145aadef8: movups xmmword ptr [rcx + rax + 0x40], xmm0
0x145aadefd: movups xmm0, xmmword ptr [rbp + 0xa0]
0x145aadf04: movups xmm1, xmmword ptr [rbp + 0xb0]
0x145aadf0b: movdqu xmm2, xmmword ptr [rbp + 0xc0]
0x145aadf13: movups xmm3, xmmword ptr [rbp + 0xd0]
0x145aadf1a: movups xmmword ptr [rcx + rax + 0x30], xmm3
0x145aadf1f: movdqu xmmword ptr [rcx + rax + 0x20], xmm2
0x145aadf25: movups xmmword ptr [rcx + rax + 0x10], xmm1
0x145aadf2a: movups xmmword ptr [rcx + rax], xmm0
0x145aadf2e: jmp 0x145aae650
0x145aadf33: mov qword ptr [rbp + 0x188], rdx
0x145aadf3a: mov rsi, r12
0x145aadf3d: mov rax, qword ptr [rbp + 0x18]
0x145aadf41: mov qword ptr [rbp + 0x1a0], rax
0x145aadf48: mov r12, qword ptr [rbp + 0x20]
0x145aadf4c: mov rcx, qword ptr [r13 + 0x70]
0x145aadf50: mov rdx, qword ptr [r13 + 0x78]
0x145aadf54: mov eax, dword ptr [r13 + 0x88]
0x145aadf5b: mov dword ptr [r13 + 0x88], 0xffffffff
0x145aadf66: cmp eax, -1
0x145aadf69: je 0x145aadfb6
0x145aadf6b: mov qword ptr [rbp + 0x1a8], rcx
0x145aadf72: mov qword ptr [rbp + 0x1b0], rdx
0x145aadf79: call qword ptr [rdx + 0x30]
0x145aadf7c: nop
0x145aadf7d: mov rax, qword ptr [rbp + 0x1b0]
0x145aadf84: mov rax, qword ptr [rax]
0x145aadf87: test rax, rax
0x145aadf8a: je 0x145aadf96
0x145aadf8c: mov rcx, qword ptr [rbp + 0x1a8]
0x145aadf93: call rax
0x145aadf95: nop
0x145aadf96: mov rax, qword ptr [rbp + 0x1b0]
0x145aadf9d: mov rdx, qword ptr [rax + 8]
0x145aadfa1: test rdx, rdx
0x145aadfa4: mov rcx, qword ptr [rbp + 0x1a8]
0x145aadfab: je 0x145aadfb6
0x145aadfad: mov r8, qword ptr [rax + 0x10]
0x145aadfb1: call 0x1400021d0
0x145aadfb6: mov rax, qword ptr [r13 + 0xa0]
0x145aadfbd: mov byte ptr [rbp + 0x1c1], 1
0x145aadfc4: mov rcx, qword ptr [rbp + 0x1a0]
0x145aadfcb: mov rdx, r12
0x145aadfce: call rax
0x145aadfd0: mov qword ptr [rbp + 0x1a8], rax
0x145aadfd7: mov qword ptr [rbp + 0x1b0], rdx
0x145aadfde: lea rax, [rbp + 0x28]
0x145aadfe2: movups xmm0, xmmword ptr [rax + 0x50]
0x145aadfe6: lea rcx, [rbp + 0xa8]
0x145aadfed: movups xmmword ptr [rcx + 0x50], xmm0
0x145aadff1: movups xmm0, xmmword ptr [rax + 0x40]
0x145aadff5: movups xmmword ptr [rcx + 0x40], xmm0
0x145aadff9: movdqu xmm0, xmmword ptr [rax]
0x145aadffd: movdqu xmm1, xmmword ptr [rax + 0x10]
0x145aae002: movdqu xmm2, xmmword ptr [rax + 0x20]
0x145aae007: movups xmm3, xmmword ptr [rax + 0x30]
0x145aae00b: movups xmmword ptr [rcx + 0x30], xmm3
0x145aae00f: movdqu xmmword ptr [rcx + 0x20], xmm2
0x145aae014: movdqu xmmword ptr [rcx + 0x10], xmm1
0x145aae019: movdqu xmmword ptr [rcx], xmm0
0x145aae01d: movabs rax, 0x800000000000000a
0x145aae027: mov qword ptr [rbp + 0xa0], rax
0x145aae02e: lea rdi, [rbp - 0x40]
0x145aae032: mov rcx, rdi
0x145aae035: mov rdx, r14
0x145aae038: call 0x145df83c0
0x145aae03d: nop
0x145aae03e: mov r12, rsi
0x145aae041: mov rcx, qword ptr [rbp + 0x1a8]
0x145aae048: mov rdx, rdi
0x145aae04b: mov rax, qword ptr [rbp + 0x1b0]
0x145aae052: call qword ptr [rax + 0x18]
0x145aae055: nop
0x145aae056: mov rcx, r14
0x145aae059: call 0x145aaa290
0x145aae05e: nop
0x145aae05f: call 0x145f40fc0
0x145aae064: nop
0x145aae065: mov edi, 0x4c4
0x145aae06a: mov esi, edx
0x145aae06c: mov qword ptr [rbp + 0x190], rax
0x145aae073: cmp dword ptr [r13 + 0x88], -1
0x145aae07b: je 0x145aae0d8
0x145aae07d: mov dword ptr [rbp + 0x164], esi
0x145aae083: mov rax, qword ptr [r13 + 0x70]
0x145aae087: mov qword ptr [rbp + 0x170], rax
0x145aae08e: mov rax, qword ptr [r13 + 0x78]
0x145aae092: mov qword ptr [rbp + 0x98], rax
0x145aae099: mov rax, qword ptr [rax]
0x145aae09c: test rax, rax
0x145aae09f: je 0x145aae0ab
0x145aae0a1: mov rcx, qword ptr [rbp + 0x170]
0x145aae0a8: call rax
0x145aae0aa: nop
0x145aae0ab: mov rcx, qword ptr [rbp + 0x170]
0x145aae0b2: mov rax, qword ptr [rbp + 0x98]
0x145aae0b9: mov rdx, qword ptr [rax + 8]
0x145aae0bd: test rdx, rdx
0x145aae0c0: mov r13, qword ptr [rbp + 0x168]
0x145aae0c7: mov esi, dword ptr [rbp + 0x164]
0x145aae0cd: je 0x145aae0d8
0x145aae0cf: mov r8, qword ptr [rax + 0x10]
0x145aae0d3: call 0x1400021d0
0x145aae0d8: mov rax, qword ptr [rbp + 0x1a8]
0x145aae0df: mov qword ptr [r13 + 0x70], rax
0x145aae0e3: mov rax, qword ptr [rbp + 0x1b0]
0x145aae0ea: mov qword ptr [r13 + 0x78], rax
0x145aae0ee: mov rax, qword ptr [rbp + 0x190]
0x145aae0f5: mov qword ptr [r13 + 0x80], rax
0x145aae0fc: mov dword ptr [r13 + 0x88], esi
0x145aae103: cmp qword ptr [rbp + 0x180], 0
0x145aae10b: je 0x145aae650
0x145aae111: mov r8d, 1
0x145aae117: mov rcx, qword ptr [rbp + 0x1a0]
0x145aae11e: mov rdx, qword ptr [rbp + 0x180]
0x145aae125: call 0x1400021d0
0x145aae12a: jmp 0x145aae650
0x145aae12f: mov qword ptr [rbp + 0x188], rdx
0x145aae136: mov r8d, dword ptr [rbp + 0x18]
0x145aae13a: mov qword ptr [rbp + 0xa0], 0
0x145aae145: mov qword ptr [rbp + 0xa8], 8
0x145aae150: lea rax, [rbp + 0xa8]
0x145aae157: movups xmmword ptr [rax + 8], xmm6
0x145aae15b: mov byte ptr [rbp + 0xc0], 1
0x145aae162: mov byte ptr [rbp + 0x1c6], 1
0x145aae169: mov byte ptr [rbp + 0x1c5], 1
0x145aae170: mov byte ptr [rbp + 0x1c4], 1
0x145aae177: mov byte ptr [rbp + 0x1c3], 1
0x145aae17e: mov byte ptr [rbp + 0x1c2], 1
0x145aae185: lea rcx, [rbp - 0x40]
0x145aae189: mov rdx, qword ptr [rbp - 0x18]
0x145aae18d: mov dword ptr [rbp + 0x1b0], r8d
0x145aae194: mov r9, r14
0x145aae197: call 0x145b505a0
0x145aae19c: nop
0x145aae19d: mov rax, qword ptr [rbp - 0x40]
0x145aae1a1: cmp rax, -1
0x145aae1a5: je 0x145aae406
0x145aae1ab: mov qword ptr [rbp + 0x1a8], rax
0x145aae1b2: mov qword ptr [rbp + 0x1a0], r12
0x145aae1b9: mov r12, qword ptr [rbp - 0x28]
0x145aae1bd: test r12, r12
0x145aae1c0: je 0x145aae3d5
0x145aae1c6: mov r14, qword ptr [rbp - 0x38]
0x145aae1ca: mov rax, qword ptr [rbp - 0x30]
0x145aae1ce: mov r9, qword ptr [rbp + 0x1a8]
0x145aae1d5: cmp rax, r9
0x145aae1d8: mov rcx, r9
0x145aae1db: mov r8d, 0
0x145aae1e1: cmovb rcx, r8
0x145aae1e5: mov rdx, rax
0x145aae1e8: sub rdx, rcx
0x145aae1eb: mov r10, r9
0x145aae1ee: sub r10, rdx
0x145aae1f1: lea rdi, [rdx + r12]
0x145aae1f5: mov qword ptr [rbp + 0x190], r12
0x145aae1fc: mov qword ptr [rbp + 0x170], r10
0x145aae203: sub r12, r10
0x145aae206: cmovb r12, r8
0x145aae20a: cmova rdi, r9
0x145aae20e: sub rdi, rdx
0x145aae211: jne 0x145aae677
0x145aae217: mov rax, qword ptr [rbp + 0x170]
0x145aae21e: cmp rax, qword ptr [rbp + 0x190]
0x145aae225: mov r13, qword ptr [rbp + 0x168]
0x145aae22c: mov edi, 0x4c4
0x145aae231: jae 0x145aae3d5
0x145aae237: add r14, 8
0x145aae23b: jmp 0x145aae24d
0x145aae23d: nop dword ptr [rax]
0x145aae240: add r14, 0x18
0x145aae244: dec r12
0x145aae247: je 0x145aae3d5
0x145aae24d: mov rdx, qword ptr [r14 - 8]
0x145aae251: test rdx, rdx
0x145aae254: je 0x145aae240
0x145aae256: mov rcx, qword ptr [r14]
0x145aae259: mov r8d, 1
0x145aae25f: call 0x1400021d0
0x145aae264: jmp 0x145aae240
0x145aae266: mov r14d, dword ptr [rbp + 0x18]
0x145aae26a: mov dword ptr [rbp + 0xa0], r14d
0x145aae271: cmp qword ptr [r13 + 0xc0], 0
0x145aae279: je 0x145aae564
0x145aae27f: mov rcx, qword ptr [rbp + 0x90]
0x145aae286: lea rdx, [rbp + 0xa0]
0x145aae28d: call 0x1407ff4d0
0x145aae292: mov r8, rax
0x145aae295: shr r8, 0x39
0x145aae299: mov rcx, qword ptr [r13 + 0xa8]
0x145aae2a0: mov rdx, qword ptr [r13 + 0xb0]
0x145aae2a7: movd xmm0, r8d
0x145aae2ac: punpcklbw xmm0, xmm0
0x145aae2b0: pshuflw xmm0, xmm0, 0
0x145aae2b5: pshufd xmm0, xmm0, 0x44
0x145aae2ba: xor r8d, r8d
0x145aae2bd: and rax, rdx
0x145aae2c0: movdqu xmm1, xmmword ptr [rcx + rax]
0x145aae2c5: movdqa xmm2, xmm1
0x145aae2c9: pcmpeqb xmm2, xmm0
0x145aae2cd: pmovmskb r9d, xmm2
0x145aae2d2: test r9d, r9d
0x145aae2d5: je 0x145aae310
0x145aae2d7: tzcnt r10d, r9d
0x145aae2dc: add r10, rax
0x145aae2df: and r10, rdx
0x145aae2e2: neg r10
0x145aae2e5: lea r10, [r10 + r10*2]
0x145aae2e9: shl r10, 4
0x145aae2ed: cmp r14d, dword ptr [rcx + r10 - 0x30]
0x145aae2f2: je 0x145aae55d
0x145aae2f8: lea r10d, [r9 - 1]
0x145aae2fc: and r10w, r9w
0x145aae300: mov r9d, r10d
0x145aae303: jne 0x145aae2d7
0x145aae305: nop word ptr cs:[rax + rax]
0x145aae310: pcmpeqb xmm1, xmm7
0x145aae314: pmovmskb r9d, xmm1
0x145aae319: test r9d, r9d
0x145aae31c: jne 0x145aae564
0x145aae322: add rax, r8
0x145aae325: add rax, 0x10
0x145aae329: add r8, 0x10
0x145aae32d: jmp 0x145aae2bd
0x145aae32f: mov qword ptr [rbp + 0x188], rdx
0x145aae336: mov r14d, dword ptr [rbp + 0x30]
0x145aae33a: test r14d, r14d
0x145aae33d: jne 0x145aae47f
0x145aae343: cmp byte ptr [r13 + 0xd8], 0
0x145aae34b: je 0x145aae47f
0x145aae351: mov rax, qword ptr [rbp + 0x18]
0x145aae355: mov qword ptr [rbp + 0x1b0], rax
0x145aae35c: mov rax, qword ptr [rbp + 0x20]
0x145aae360: mov qword ptr [rbp + 0x1a8], rax
0x145aae367: mov rsi, qword ptr [rbp + 0x28]
0x145aae36b: mov rcx, qword ptr [r13 + 0x40]
0x145aae36f: mov rax, qword ptr [r13 + 0x58]
0x145aae373: cmp rax, rcx
0x145aae376: lea r14, [rbp + 0xa0]
0x145aae37d: jne 0x145aae391
0x145aae37f: mov rcx, qword ptr [rbp + 8]
0x145aae383: call 0x1419f6300
0x145aae388: nop
0x145aae389: mov rcx, qword ptr [r13 + 0x40]
0x145aae38d: mov rax, qword ptr [r13 + 0x58]
0x145aae391: lea rdx, [rax + 1]
0x145aae395: mov qword ptr [r13 + 0x58], rdx
0x145aae399: add rax, qword ptr [r13 + 0x50]
0x145aae39d: cmp rax, rcx
0x145aae3a0: mov edx, 0
0x145aae3a5: cmovae rdx, rcx
0x145aae3a9: sub rax, rdx
0x145aae3ac: mov rcx, qword ptr [r13 + 0x48]
0x145aae3b0: lea rax, [rax + rax*2]
0x145aae3b4: mov rdx, qword ptr [rbp + 0x1b0]
0x145aae3bb: mov qword ptr [rcx + rax*8], rdx
0x145aae3bf: mov rdx, qword ptr [rbp + 0x1a8]
0x145aae3c6: mov qword ptr [rcx + rax*8 + 8], rdx
0x145aae3cb: mov qword ptr [rcx + rax*8 + 0x10], rsi
0x145aae3d0: jmp 0x145aae650
0x145aae3d5: mov rax, qword ptr [rbp + 0x1a8]
0x145aae3dc: test rax, rax
0x145aae3df: mov r12, qword ptr [rbp + 0x1a0]
0x145aae3e6: lea r14, [rbp + 0xa0]
0x145aae3ed: je 0x145aae406
0x145aae3ef: mov rcx, qword ptr [rbp - 0x38]
0x145aae3f3: shl rax, 3
0x145aae3f7: lea rdx, [rax + rax*2]
0x145aae3fb: mov r8d, 8
0x145aae401: call 0x1400021d0
0x145aae406: mov rcx, qword ptr [r13 + 0x20]
0x145aae40a: mov rax, qword ptr [r13 + 0x38]
0x145aae40e: cmp rax, rcx
0x145aae411: jne 0x145aae448
0x145aae413: mov byte ptr [rbp + 0x1c6], 1
0x145aae41a: mov byte ptr [rbp + 0x1c5], 1
0x145aae421: mov byte ptr [rbp + 0x1c4], 1
0x145aae428: mov byte ptr [rbp + 0x1c3], 1
0x145aae42f: mov byte ptr [rbp + 0x1c2], 1
0x145aae436: mov rcx, qword ptr [rbp]
0x145aae43a: call 0x1423daa80
0x145aae43f: nop
0x145aae440: mov rcx, qword ptr [r13 + 0x20]
0x145aae444: mov rax, qword ptr [r13 + 0x38]
0x145aae448: lea rdx, [rax + 1]
0x145aae44c: mov qword ptr [r13 + 0x38], rdx
0x145aae450: add rax, qword ptr [r13 + 0x30]
0x145aae454: cmp rax, rcx
0x145aae457: mov edx, 0
0x145aae45c: cmovae rdx, rcx
0x145aae460: sub rax, rdx
0x145aae463: mov rcx, qword ptr [r13 + 0x28]
0x145aae467: mov edx, dword ptr [rbp + 0x1b0]
0x145aae46d: mov dword ptr [rcx + rax*4], edx
0x145aae470: cmp rsi, 0xa
0x145aae474: jbe 0x145aae631
0x145aae47a: jmp 0x145aae637
0x145aae47f: mov dword ptr [rbp + 0xa0], r14d
0x145aae486: mov rax, qword ptr [rbp + 0x18]
0x145aae48a: mov qword ptr [rbp + 0x1b0], rax
0x145aae491: mov rax, qword ptr [rbp + 0x20]
0x145aae495: mov qword ptr [rbp + 0x1a8], rax
0x145aae49c: cmp qword ptr [r13 + 0xc0], 0
0x145aae4a4: je 0x145aae57a
0x145aae4aa: mov rax, qword ptr [rbp + 0x28]
0x145aae4ae: mov qword ptr [rbp + 0x1a0], rax
0x145aae4b5: mov rcx, qword ptr [rbp + 0x90]
0x145aae4bc: lea rdx, [rbp + 0xa0]
0x145aae4c3: call 0x1407ff4d0
0x145aae4c8: mov rdx, rax
0x145aae4cb: shr rdx, 0x39
0x145aae4cf: mov rcx, qword ptr [rbp + 0x168]
0x145aae4d6: mov r13, qword ptr [rcx + 0xa8]
0x145aae4dd: mov rcx, qword ptr [rcx + 0xb0]
0x145aae4e4: movd xmm0, edx
0x145aae4e8: punpcklbw xmm0, xmm0
0x145aae4ec: pshuflw xmm0, xmm0, 0
0x145aae4f1: pshufd xmm0, xmm0, 0x44
0x145aae4f6: xor edx, edx
0x145aae4f8: and rax, rcx
0x145aae4fb: movdqu xmm1, xmmword ptr [r13 + rax]
0x145aae502: movdqa xmm2, xmm1
0x145aae506: pcmpeqb xmm2, xmm0
0x145aae50a: pmovmskb r8d, xmm2
0x145aae50f: test r8d, r8d
0x145aae512: je 0x145aae542
0x145aae514: tzcnt r9d, r8d
0x145aae519: add r9, rax
0x145aae51c: and r9, rcx
0x145aae51f: neg r9
0x145aae522: lea r9, [r9 + r9*2]
0x145aae526: shl r9, 4
0x145aae52a: cmp r14d, dword ptr [r13 + r9 - 0x30]
0x145aae52f: je 0x145aae5b5
0x145aae535: lea r9d, [r8 - 1]
0x145aae539: and r9w, r8w
0x145aae53d: mov r8d, r9d
0x145aae540: jne 0x145aae514
0x145aae542: pcmpeqb xmm1, xmm7
0x145aae546: pmovmskb r8d, xmm1
0x145aae54b: test r8d, r8d
0x145aae54e: jne 0x145aae57a
0x145aae550: add rax, rdx
0x145aae553: add rax, 0x10
0x145aae557: add rdx, 0x10
0x145aae55b: jmp 0x145aae4f8
0x145aae55d: add rcx, r10
0x145aae560: mov byte ptr [rcx - 8], 0
0x145aae564: lea r14, [rbp + 0xa0]
0x145aae56b: cmp rsi, 0xa
0x145aae56f: jbe 0x145aae631
0x145aae575: jmp 0x145aae637
0x145aae57a: mov rdx, qword ptr [rbp + 0x1b0]
0x145aae581: test rdx, rdx
0x145aae584: lea r14, [rbp + 0xa0]
0x145aae58b: je 0x145aae59f
0x145aae58d: mov r8d, 1
0x145aae593: mov rcx, qword ptr [rbp + 0x1a8]
0x145aae59a: call 0x1400021d0
0x145aae59f: mov r13, qword ptr [rbp + 0x168]
0x145aae5a6: cmp rsi, 0xa
0x145aae5aa: jbe 0x145aae631
0x145aae5b0: jmp 0x145aae637
0x145aae5b5: add r13, r9
0x145aae5b8: mov rcx, qword ptr [r13 - 0x28]
0x145aae5bc: mov rax, qword ptr [r13 - 0x10]
0x145aae5c0: cmp rax, rcx
0x145aae5c3: lea r14, [rbp + 0xa0]
0x145aae5ca: jne 0x145aae5de
0x145aae5cc: lea rcx, [r13 - 0x28]
0x145aae5d0: call 0x1419f6300
0x145aae5d5: nop
0x145aae5d6: mov rcx, qword ptr [r13 - 0x28]
0x145aae5da: mov rax, qword ptr [r13 - 0x10]
0x145aae5de: lea rdx, [rax + 1]
0x145aae5e2: mov qword ptr [r13 - 0x10], rdx
0x145aae5e6: add rax, qword ptr [r13 - 0x18]
0x145aae5ea: cmp rax, rcx
0x145aae5ed: mov edx, 0
0x145aae5f2: cmovae rdx, rcx
0x145aae5f6: sub rax, rdx
0x145aae5f9: mov rcx, qword ptr [r13 - 0x20]
0x145aae5fd: lea rax, [rax + rax*2]
0x145aae601: mov rdx, qword ptr [rbp + 0x1b0]
0x145aae608: mov qword ptr [rcx + rax*8], rdx
0x145aae60c: mov rdx, qword ptr [rbp + 0x1a8]
0x145aae613: mov qword ptr [rcx + rax*8 + 8], rdx
0x145aae618: mov rdx, qword ptr [rbp + 0x1a0]
0x145aae61f: mov qword ptr [rcx + rax*8 + 0x10], rdx
0x145aae624: mov r13, qword ptr [rbp + 0x168]
0x145aae62b: cmp rsi, 0xa
0x145aae62f: ja 0x145aae637
0x145aae631: bt rdi, rsi
0x145aae635: jb 0x145aae650
0x145aae637: lea rcx, [rbp + 0x10]
0x145aae63b: call 0x145aaa060
0x145aae640: nop
0x145aae641: nop word ptr cs:[rax + rax]
0x145aae650: mov rdx, qword ptr [rbp + 0x198]
0x145aae657: test rdx, rdx
0x145aae65a: je 0x145aadb60
0x145aae660: mov r8d, 1
0x145aae666: mov rcx, qword ptr [rbp + 0x178]
0x145aae66d: call 0x1400021d0
0x145aae672: jmp 0x145aadb60
0x145aae677: shl rax, 3
0x145aae67b: lea rax, [rax + rax*2]
0x145aae67f: shl rcx, 3
0x145aae683: lea rcx, [rcx + rcx*2]
0x145aae687: sub rax, rcx
0x145aae68a: lea r13, [r14 + rax]
0x145aae68e: add r13, 8
0x145aae692: jmp 0x145aae6ad
0x145aae694: nop word ptr cs:[rax + rax]
0x145aae6a0: add r13, 0x18
0x145aae6a4: dec rdi
0x145aae6a7: je 0x145aae217
0x145aae6ad: mov rdx, qword ptr [r13 - 8]
0x145aae6b1: test rdx, rdx
0x145aae6b4: je 0x145aae6a0
0x145aae6b6: mov rcx, qword ptr [r13]
0x145aae6ba: mov r8d, 1
0x145aae6c0: call 0x1400021d0
0x145aae6c5: jmp 0x145aae6a0
0x145aae6c7: cmp qword ptr [rbp + 0x88], rbx
0x145aae6ce: je 0x145aae712
0x145aae6d0: movabs rcx, 0xaaaaaaaaaaaaaaab
0x145aae6da: mov rax, r12
0x145aae6dd: mul rcx
0x145aae6e0: mov rdi, rdx
0x145aae6e3: shr rdi, 4
0x145aae6e7: jmp 0x145aae6f9
0x145aae6e9: nop dword ptr [rax]
0x145aae6f0: add r15, 0x18
0x145aae6f4: dec rdi
0x145aae6f7: je 0x145aae712
0x145aae6f9: mov rdx, qword ptr [r15 - 8]
0x145aae6fd: test rdx, rdx
0x145aae700: je 0x145aae6f0
0x145aae702: mov rcx, qword ptr [r15]
0x145aae705: mov r8d, 1
0x145aae70b: call 0x1400021d0
0x145aae710: jmp 0x145aae6f0
0x145aae712: mov rax, qword ptr [rbp - 0x10]
0x145aae716: test rax, rax
0x145aae719: je 0x145aae732
0x145aae71b: shl rax, 3
0x145aae71f: lea rdx, [rax + rax*2]
0x145aae723: mov r8d, 8
0x145aae729: mov rcx, qword ptr [rbp - 8]
0x145aae72d: call 0x1400021d0
0x145aae732: lea rcx, [r13 + 0x60]
0x145aae736: mov byte ptr [rbp + 0x1c7], 0
0x145aae73d: call 0x145f41110
0x145aae742: nop
0x145aae743: test rax, rax
0x145aae746: js 0x145aae752
0x145aae748: xorps xmm0, xmm0
0x145aae74b: cvtsi2ss xmm0, rax
0x145aae750: jmp 0x145aae76a
0x145aae752: mov rcx, rax
0x145aae755: shr rcx, 1
0x145aae758: and eax, 1
0x145aae75b: or rax, rcx
0x145aae75e: xorps xmm0, xmm0
0x145aae761: cvtsi2ss xmm0, rax
0x145aae766: addss xmm0, xmm0
0x145aae76a: xorps xmm1, xmm1
0x145aae76d: cvtsi2ss xmm1, edx
0x145aae771: divss xmm1, dword ptr [rip + 0x738067]
0x145aae779: addss xmm1, xmm0
0x145aae77d: ucomiss xmm1, dword ptr [rip + 0x6c924c]
0x145aae784: jb 0x145aae85f
0x145aae78a: mov byte ptr [rbp + 0x1c7], 0
0x145aae791: call 0x145f40fc0
0x145aae796: nop
0x145aae797: mov qword ptr [r13 + 0x60], rax
0x145aae79b: mov dword ptr [r13 + 0x68], edx
0x145aae79f: mov rcx, qword ptr [r13 + 0x90]
0x145aae7a6: mov rax, qword ptr [r13 + 0x98]
0x145aae7ad: mov rax, qword ptr [rax + 0x28]
0x145aae7b1: mov byte ptr [rbp + 0x1c7], 0
0x145aae7b8: call rax
0x145aae7ba: nop
0x145aae7bb: cmp al, 1
0x145aae7bd: jne 0x145aae800
0x145aae7bf: mov rsi, qword ptr [r13 + 0x90]
0x145aae7c6: mov rdi, qword ptr [r13 + 0x98]
0x145aae7cd: mov byte ptr [rbp + 0x1c7], 0
0x145aae7d4: lea rdx, [rip + 0x181ca3d]
0x145aae7db: lea rcx, [rbp + 0xa0]
0x145aae7e2: call 0x145df83c0
0x145aae7e7: nop
0x145aae7e8: mov rax, qword ptr [rdi + 0x18]
0x145aae7ec: mov byte ptr [rbp + 0x1c7], 0
0x145aae7f3: lea rdx, [rbp + 0xa0]
0x145aae7fa: mov rcx, rsi
0x145aae7fd: call rax
0x145aae7ff: nop
0x145aae800: cmp dword ptr [r13 + 0x88], -1
0x145aae808: je 0x145aae85f
0x145aae80a: mov rcx, qword ptr [r13 + 0x70]
0x145aae80e: mov rax, qword ptr [r13 + 0x78]
0x145aae812: mov rax, qword ptr [rax + 0x28]
0x145aae816: mov byte ptr [rbp + 0x1c7], 0
0x145aae81d: call rax
0x145aae81f: nop
0x145aae820: cmp al, 1
0x145aae822: jne 0x145aae85f
0x145aae824: mov rsi, qword ptr [r13 + 0x70]
0x145aae828: mov rdi, qword ptr [r13 + 0x78]
0x145aae82c: mov byte ptr [rbp + 0x1c7], 0
0x145aae833: lea rdx, [rip + 0x181c9de]
0x145aae83a: lea rcx, [rbp + 0xa0]
0x145aae841: call 0x145df83c0
0x145aae846: nop
0x145aae847: mov rax, qword ptr [rdi + 0x18]
0x145aae84b: mov byte ptr [rbp + 0x1c7], 0
0x145aae852: lea rdx, [rbp + 0xa0]
0x145aae859: mov rcx, rsi
0x145aae85c: call rax
0x145aae85e: nop
0x145aae85f: movaps xmm6, xmmword ptr [rbp + 0x1d0]
0x145aae866: movaps xmm7, xmmword ptr [rbp + 0x1e0]
0x145aae86d: add rsp, 0x278
0x145aae874: pop rbx
0x145aae875: pop rdi
0x145aae876: pop rsi
0x145aae877: pop r12
0x145aae879: pop r13
0x145aae87b: pop r14
0x145aae87d: pop r15
0x145aae87f: pop rbp
0x145aae880: ret
