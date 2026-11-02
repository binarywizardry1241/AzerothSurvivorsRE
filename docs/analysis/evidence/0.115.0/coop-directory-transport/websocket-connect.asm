0x1458b0720: push rbp
0x1458b0721: push r15
0x1458b0723: push r14
0x1458b0725: push r13
0x1458b0727: push r12
0x1458b0729: push rsi
0x1458b072a: push rdi
0x1458b072b: push rbx
0x1458b072c: sub rsp, 0x988
0x1458b0733: lea rbp, [rsp + 0x80]
0x1458b073b: movdqa xmmword ptr [rbp + 0x8f0], xmm13
0x1458b0744: movdqa xmmword ptr [rbp + 0x8e0], xmm12
0x1458b074d: movdqa xmmword ptr [rbp + 0x8d0], xmm11
0x1458b0756: movdqa xmmword ptr [rbp + 0x8c0], xmm10
0x1458b075f: movdqa xmmword ptr [rbp + 0x8b0], xmm9
0x1458b0768: movdqa xmmword ptr [rbp + 0x8a0], xmm8
0x1458b0771: movdqa xmmword ptr [rbp + 0x890], xmm7
0x1458b0779: movdqa xmmword ptr [rbp + 0x880], xmm6
0x1458b0781: mov qword ptr [rbp + 0x878], 0xfffffffffffffffe
0x1458b078c: mov rdi, r9
0x1458b078f: mov r14, rcx
0x1458b0792: lea rcx, [rbp - 0x60]
0x1458b0796: call 0x145a73720
0x1458b079b: mov rsi, qword ptr [rbp - 0x60]
0x1458b079f: movups xmm0, xmmword ptr [rbp - 0x58]
0x1458b07a3: movaps xmmword ptr [rbp + 0x550], xmm0
0x1458b07aa: movups xmm0, xmmword ptr [rbp - 0x48]
0x1458b07ae: movaps xmmword ptr [rbp + 0x560], xmm0
0x1458b07b5: cmp rsi, -1
0x1458b07b9: je 0x1458b081a
0x1458b07bb: lea rdx, [rbp - 0x38]
0x1458b07bf: lea rcx, [rbp + 0x660]
0x1458b07c6: mov r8d, 0xb8
0x1458b07cc: call 0x145d145fb
0x1458b07d1: movdqa xmm0, xmmword ptr [rbp + 0x550]
0x1458b07d9: movdqa xmm1, xmmword ptr [rbp + 0x560]
0x1458b07e1: movdqu xmmword ptr [rbp + 0x640], xmm0
0x1458b07e9: movdqu xmmword ptr [rbp + 0x650], xmm1
0x1458b07f1: mov qword ptr [rbp + 0x638], rsi
0x1458b07f8: movzx esi, byte ptr [rbp + 0x698]
0x1458b07ff: test esi, esi
0x1458b0801: mov dword ptr [rbp + 0x868], esi
0x1458b0807: je 0x1458b0842
0x1458b0809: cmp esi, 1
0x1458b080c: jne 0x1458b0844
0x1458b080e: movzx ebx, byte ptr [rbp + 0x699]
0x1458b0815: jmp 0x1458b08a2
0x1458b081a: movdqa xmm0, xmmword ptr [rbp + 0x550]
0x1458b0822: movdqa xmm1, xmmword ptr [rbp + 0x560]
0x1458b082a: movdqu xmmword ptr [r14 + 0x18], xmm1
0x1458b0830: movdqu xmmword ptr [r14 + 8], xmm0
0x1458b0836: mov qword ptr [r14], 2
0x1458b083d: jmp 0x1458b1006
0x1458b0842: jmp 0x1458b08a2
0x1458b0844: mov rbx, qword ptr [rbp + 0x6a0]
0x1458b084b: call 0x140002200
0x1458b0850: mov ecx, 0x20
0x1458b0855: mov edx, 8
0x1458b085a: call 0x1400021c0
0x1458b085f: mov qword ptr [rbp + 0x860], rax
0x1458b0866: test rax, rax
0x1458b0869: je 0x1458b1076
0x1458b086f: mov rax, qword ptr [rbx]
0x1458b0872: mov r8, qword ptr [rbx + 8]
0x1458b0876: mov r9, qword ptr [rbx + 0x10]
0x1458b087a: add rbx, 0x18
0x1458b087e: lea rcx, [rbp - 0x60]
0x1458b0882: mov rdx, rbx
0x1458b0885: call qword ptr [rax]
0x1458b0887: nop
0x1458b0888: movdqu xmm0, xmmword ptr [rbp - 0x60]
0x1458b088d: movdqu xmm1, xmmword ptr [rbp - 0x50]
0x1458b0892: mov rax, qword ptr [rbp + 0x860]
0x1458b0899: movdqu xmmword ptr [rax + 0x10], xmm1
0x1458b089e: movdqu xmmword ptr [rax], xmm0
0x1458b08a2: mov rax, qword ptr [rbp + 0x6a8]
0x1458b08a9: mov r8, qword ptr [rbp + 0x6b0]
0x1458b08b0: lea rdx, [rbp + 0x6c0]
0x1458b08b7: mov r9, qword ptr [rbp + 0x6b8]
0x1458b08be: lea rcx, [rbp - 0x60]
0x1458b08c2: call qword ptr [rax]
0x1458b08c4: nop
0x1458b08c5: mov qword ptr [rbp + 0x858], r14
0x1458b08cc: movdqu xmm0, xmmword ptr [rbp - 0x60]
0x1458b08d1: movdqu xmm1, xmmword ptr [rbp - 0x50]
0x1458b08d6: movdqa xmmword ptr [rbp + 0x560], xmm1
0x1458b08de: movdqa xmmword ptr [rbp + 0x550], xmm0
0x1458b08e6: mov rax, qword ptr [rbp + 0x6c8]
0x1458b08ed: mov r8, qword ptr [rbp + 0x6d0]
0x1458b08f4: lea rdx, [rbp + 0x6e0]
0x1458b08fb: mov r9, qword ptr [rbp + 0x6d8]
0x1458b0902: lea rcx, [rbp - 0x60]
0x1458b0906: call qword ptr [rax]
0x1458b0908: nop
0x1458b0909: movups xmm0, xmmword ptr [rbp - 0x60]
0x1458b090d: movups xmm1, xmmword ptr [rbp - 0x50]
0x1458b0911: movups xmmword ptr [rbp + 0x778], xmm1
0x1458b0918: movups xmmword ptr [rbp + 0x768], xmm0
0x1458b091f: movzx eax, word ptr [rbp + 0x6e8]
0x1458b0926: mov ecx, dword ptr [rbp + 0x868]
0x1458b092c: mov byte ptr [rbp + 0x738], cl
0x1458b0932: mov byte ptr [rbp + 0x739], bl
0x1458b0938: mov rcx, qword ptr [rbp + 0x860]
0x1458b093f: mov qword ptr [rbp + 0x740], rcx
0x1458b0946: movdqa xmm0, xmmword ptr [rbp + 0x550]
0x1458b094e: movdqa xmm1, xmmword ptr [rbp + 0x560]
0x1458b0956: movdqu xmmword ptr [rbp + 0x748], xmm0
0x1458b095e: movdqu xmmword ptr [rbp + 0x758], xmm1
0x1458b0966: mov word ptr [rbp + 0x788], ax
0x1458b096d: lea r13, [rbp + 0x7f2]
0x1458b0974: xor r14d, r14d
0x1458b0977: lea r12, [rbp + 0x738]
0x1458b097e: lea rbx, [rbp + 0x7f0]
0x1458b0985: lea r15, [rbp + 0x718]
0x1458b098c: movdqa xmm6, xmmword ptr [rip + 0x177fefc]
0x1458b0994: movdqa xmm7, xmmword ptr [rip + 0x177ff04]
0x1458b099c: movdqa xmm8, xmmword ptr [rip + 0xd3c80b]
0x1458b09a5: pcmpeqd xmm9, xmm9
0x1458b09aa: movdqa xmm10, xmmword ptr [rip + 0x177febd]
0x1458b09b3: movdqa xmm11, xmmword ptr [rip + 0x177fec4]
0x1458b09bc: movdqa xmm12, xmmword ptr [rip + 0x634e1b]
0x1458b09c5: jmp 0x1458b09dd
0x1458b09c7: nop word ptr [rax + rax]
0x1458b09d0: lea rcx, [rbp - 0x60]
0x1458b09d4: call 0x1458af660
0x1458b09d9: nop
0x1458b09da: mov r14d, esi
0x1458b09dd: cmp r14b, byte ptr [rbp + 0x970]
0x1458b09e4: ja 0x1458b105b
0x1458b09ea: mov sil, r14b
0x1458b09ed: adc sil, 0
0x1458b09f1: lea rcx, [rbp + 0x550]
0x1458b09f8: lea rdx, [rbp + 0x638]
0x1458b09ff: mov r8, r12
0x1458b0a02: call 0x145a72410
0x1458b0a07: nop
0x1458b0a08: movdqu xmm0, xmmword ptr [rdi]
0x1458b0a0c: movdqu xmm1, xmmword ptr [rdi + 0x10]
0x1458b0a11: movdqu xmm2, xmmword ptr [rdi + 0x20]
0x1458b0a16: movdqu xmm3, xmmword ptr [rdi + 0x30]
0x1458b0a1b: movdqa xmmword ptr [rbp + 0x820], xmm3
0x1458b0a23: movdqa xmmword ptr [rbp + 0x810], xmm2
0x1458b0a2b: movdqa xmmword ptr [rbp + 0x800], xmm1
0x1458b0a33: movdqa xmmword ptr [rbp + 0x7f0], xmm0
0x1458b0a3b: lea rcx, [rbp - 0x60]
0x1458b0a3f: lea rdx, [rbp + 0x550]
0x1458b0a46: mov r8, rbx
0x1458b0a49: call 0x145a72fc0
0x1458b0a4e: nop
0x1458b0a4f: cmp dword ptr [rbp - 0x60], 2
0x1458b0a53: jne 0x1458b0e78
0x1458b0a59: cmp byte ptr [rbp - 0x58], 0xa
0x1458b0a5d: jne 0x1458b0e78
0x1458b0a63: cmp r14b, byte ptr [rbp + 0x970]
0x1458b0a6a: jae 0x1458b0e78
0x1458b0a70: mov r9, qword ptr [rbp - 0x50]
0x1458b0a74: mov eax, dword ptr [r9 + 0x68]
0x1458b0a78: mov ecx, 0xfffffed4
0x1458b0a7d: add eax, ecx
0x1458b0a7f: cmp ax, 0x63
0x1458b0a83: ja 0x1458b0e78
0x1458b0a89: mov r8d, 8
0x1458b0a8f: mov rcx, rbx
0x1458b0a92: lea rdx, [rip + 0x178011f]
0x1458b0a99: mov qword ptr [rbp + 0x868], r9
0x1458b0aa0: call 0x1458bf8a0
0x1458b0aa5: nop
0x1458b0aa6: mov r14, qword ptr [rbp + 0x858]
0x1458b0aad: mov rax, qword ptr [rbp + 0x7f0]
0x1458b0ab4: cmp rax, 2
0x1458b0ab8: je 0x1458b0e93
0x1458b0abe: cmp eax, 1
0x1458b0ac1: jne 0x1458b0e93
0x1458b0ac7: mov rcx, qword ptr [rbp + 0x800]
0x1458b0ace: mov rax, qword ptr [rbp + 0x868]
0x1458b0ad5: mov rdx, qword ptr [rax + 0x28]
0x1458b0ad9: cmp rcx, rdx
0x1458b0adc: jae 0x1458b1088
0x1458b0ae2: mov rax, qword ptr [rax + 0x20]
0x1458b0ae6: imul rcx, rcx, 0x68
0x1458b0aea: mov rdx, qword ptr [rax + rcx + 0x20]
0x1458b0aef: mov r8, qword ptr [rax + rcx + 0x28]
0x1458b0af4: test r8, r8
0x1458b0af7: je 0x1458b0c70
0x1458b0afd: cmp r8, 8
0x1458b0b01: jae 0x1458b0b10
0x1458b0b03: xor r9d, r9d
0x1458b0b06: mov rcx, rdx
0x1458b0b09: jmp 0x1458b0c2f
0x1458b0b0e: nop
0x1458b0b10: cmp r8, 0x20
0x1458b0b14: jae 0x1458b0b20
0x1458b0b16: xor eax, eax
0x1458b0b18: xor r9d, r9d
0x1458b0b1b: jmp 0x1458b0bc3
0x1458b0b20: mov rax, r8
0x1458b0b23: and rax, 0xffffffffffffffe0
0x1458b0b27: pxor xmm0, xmm0
0x1458b0b2b: xor ecx, ecx
0x1458b0b2d: pxor xmm1, xmm1
0x1458b0b31: nop word ptr cs:[rax + rax]
0x1458b0b40: movdqu xmm2, xmmword ptr [rdx + rcx]
0x1458b0b45: movdqu xmm3, xmmword ptr [rdx + rcx + 0x10]
0x1458b0b4b: movdqa xmm4, xmm2
0x1458b0b4f: paddb xmm4, xmm10
0x1458b0b54: movdqa xmm5, xmm3
0x1458b0b58: paddb xmm5, xmm10
0x1458b0b5d: movdqa xmm13, xmm4
0x1458b0b62: pminub xmm13, xmm11
0x1458b0b67: pcmpeqb xmm13, xmm4
0x1458b0b6c: movdqa xmm4, xmm5
0x1458b0b70: pminub xmm4, xmm11
0x1458b0b75: pcmpeqb xmm4, xmm5
0x1458b0b79: pcmpeqb xmm2, xmm12
0x1458b0b7e: pandn xmm2, xmm13
0x1458b0b83: por xmm1, xmm2
0x1458b0b87: pcmpeqb xmm3, xmm12
0x1458b0b8c: pandn xmm3, xmm4
0x1458b0b90: por xmm0, xmm3
0x1458b0b94: add rcx, 0x20
0x1458b0b98: cmp rax, rcx
0x1458b0b9b: jne 0x1458b0b40
0x1458b0b9d: por xmm0, xmm1
0x1458b0ba1: psllw xmm0, 7
0x1458b0ba6: pmovmskb ecx, xmm0
0x1458b0baa: test ecx, ecx
0x1458b0bac: setne r9b
0x1458b0bb0: cmp r8, rax
0x1458b0bb3: je 0x1458b0c66
0x1458b0bb9: test r8b, 0x18
0x1458b0bbd: je 0x1458b0e6d
0x1458b0bc3: mov r10, r8
0x1458b0bc6: and r10, 0xfffffffffffffff8
0x1458b0bca: lea rcx, [rdx + r10]
0x1458b0bce: movzx r9d, r9b
0x1458b0bd2: movd xmm0, r9d
0x1458b0bd7: nop word ptr [rax + rax]
0x1458b0be0: movq xmm1, qword ptr [rdx + rax]
0x1458b0be5: movdqa xmm2, xmm1
0x1458b0be9: paddb xmm2, xmm6
0x1458b0bed: movdqa xmm3, xmm2
0x1458b0bf1: pmaxub xmm3, xmm7
0x1458b0bf5: pcmpeqb xmm3, xmm2
0x1458b0bf9: pcmpeqb xmm1, xmm8
0x1458b0bfe: por xmm1, xmm3
0x1458b0c02: punpcklbw xmm1, xmm1
0x1458b0c06: pxor xmm1, xmm9
0x1458b0c0b: por xmm0, xmm1
0x1458b0c0f: add rax, 8
0x1458b0c13: cmp r10, rax
0x1458b0c16: jne 0x1458b0be0
0x1458b0c18: psllw xmm0, 7
0x1458b0c1d: pmovmskb eax, xmm0
0x1458b0c21: test eax, 0x5555
0x1458b0c26: setne r9b
0x1458b0c2a: cmp r8, r10
0x1458b0c2d: je 0x1458b0c66
0x1458b0c2f: lea rax, [rdx + r8]
0x1458b0c33: nop word ptr cs:[rax + rax]
0x1458b0c40: movzx r10d, byte ptr [rcx]
0x1458b0c44: inc rcx
0x1458b0c47: lea r11d, [r10 - 0x7f]
0x1458b0c4b: cmp r11b, 0xa1
0x1458b0c4f: setb r11b
0x1458b0c53: cmp r10b, 9
0x1458b0c57: setne r10b
0x1458b0c5b: and r10b, r11b
0x1458b0c5e: or r9b, r10b
0x1458b0c61: cmp rcx, rax
0x1458b0c64: jne 0x1458b0c40
0x1458b0c66: test r9b, 1
0x1458b0c6a: jne 0x1458b0f86
0x1458b0c70: mov rcx, r15
0x1458b0c73: call 0x145b78210
0x1458b0c78: nop
0x1458b0c79: mov rcx, rbx
0x1458b0c7c: mov rdx, r15
0x1458b0c7f: call 0x145b723f0
0x1458b0c84: nop
0x1458b0c85: movzx ecx, byte ptr [rbp + 0x7f0]
0x1458b0c8c: movzx eax, byte ptr [rbp + 0x7f1]
0x1458b0c93: cmp cl, 0xff
0x1458b0c96: je 0x1458b0f79
0x1458b0c9c: mov byte ptr [rbp + 0x877], cl
0x1458b0ca2: mov byte ptr [rbp + 0x860], al
0x1458b0ca8: mov rax, qword ptr [r13 + 0x4e]
0x1458b0cac: mov qword ptr [rbp + 0x7de], rax
0x1458b0cb3: movups xmm0, xmmword ptr [r13 + 0x40]
0x1458b0cb8: movaps xmmword ptr [rbp + 0x7d0], xmm0
0x1458b0cbf: movups xmm0, xmmword ptr [r13]
0x1458b0cc4: movups xmm1, xmmword ptr [r13 + 0x10]
0x1458b0cc9: movups xmm2, xmmword ptr [r13 + 0x20]
0x1458b0cce: movups xmm3, xmmword ptr [r13 + 0x30]
0x1458b0cd3: movaps xmmword ptr [rbp + 0x7c0], xmm3
0x1458b0cda: movaps xmmword ptr [rbp + 0x7b0], xmm2
0x1458b0ce1: movaps xmmword ptr [rbp + 0x7a0], xmm1
0x1458b0ce8: movaps xmmword ptr [rbp + 0x790], xmm0
0x1458b0cef: mov rcx, r12
0x1458b0cf2: call 0x1458b0170
0x1458b0cf7: nop
0x1458b0cf8: movzx eax, byte ptr [rbp + 0x877]
0x1458b0cff: mov byte ptr [rbp + 0x738], al
0x1458b0d05: movzx eax, byte ptr [rbp + 0x860]
0x1458b0d0c: mov byte ptr [rbp + 0x739], al
0x1458b0d12: mov rax, qword ptr [rbp + 0x7de]
0x1458b0d19: lea rcx, [rbp + 0x73a]
0x1458b0d20: mov qword ptr [rcx + 0x4e], rax
0x1458b0d24: movaps xmm0, xmmword ptr [rbp + 0x7d0]
0x1458b0d2b: movups xmmword ptr [rcx + 0x40], xmm0
0x1458b0d2f: movdqa xmm0, xmmword ptr [rbp + 0x790]
0x1458b0d37: movdqa xmm1, xmmword ptr [rbp + 0x7a0]
0x1458b0d3f: movdqa xmm2, xmmword ptr [rbp + 0x7b0]
0x1458b0d47: movdqa xmm3, xmmword ptr [rbp + 0x7c0]
0x1458b0d4f: movdqu xmmword ptr [rcx + 0x30], xmm3
0x1458b0d54: movdqu xmmword ptr [rcx + 0x20], xmm2
0x1458b0d59: movdqu xmmword ptr [rcx + 0x10], xmm1
0x1458b0d5e: movdqu xmmword ptr [rcx], xmm0
0x1458b0d62: mov rax, qword ptr [rip + 0x2963b7f]
0x1458b0d69: mov rax, qword ptr [rax]
0x1458b0d6c: cmp rax, 4
0x1458b0d70: jb 0x1458b0e26
0x1458b0d76: mov qword ptr [rbp + 0x718], r12
0x1458b0d7d: lea rax, [rip + 0x2c26dc]
0x1458b0d84: mov qword ptr [rbp + 0x720], rax
0x1458b0d8b: mov qword ptr [rbp + 0x820], 4
0x1458b0d96: lea rax, [rip + 0x177fe35]
0x1458b0d9d: mov qword ptr [rbp + 0x828], rax
0x1458b0da4: mov qword ptr [rbp + 0x830], 0x13
0x1458b0daf: lea rcx, [rip + 0x177fe0a]
0x1458b0db6: mov qword ptr [rbp + 0x840], rcx
0x1458b0dbd: mov qword ptr [rbp + 0x848], r15
0x1458b0dc4: mov qword ptr [rbp + 0x7f0], 0
0x1458b0dcf: mov qword ptr [rbp + 0x7f8], rax
0x1458b0dd6: mov qword ptr [rbp + 0x800], 0x13
0x1458b0de1: mov qword ptr [rbp + 0x808], 0
0x1458b0dec: lea rax, [rip + 0x177fd43]
0x1458b0df3: mov qword ptr [rbp + 0x810], rax
0x1458b0dfa: mov qword ptr [rbp + 0x818], 0x65
0x1458b0e05: movabs rax, 0x6200000001
0x1458b0e0f: mov qword ptr [rbp + 0x838], rax
0x1458b0e16: lea rcx, [rbp + 0x876]
0x1458b0e1d: mov rdx, rbx
0x1458b0e20: call 0x145b714c0
0x1458b0e25: nop
0x1458b0e26: mov rcx, qword ptr [rbp + 0x868]
0x1458b0e2d: call 0x1458afa30
0x1458b0e32: nop
0x1458b0e33: mov edx, 0x88
0x1458b0e38: mov r8d, 8
0x1458b0e3e: mov rcx, qword ptr [rbp + 0x868]
0x1458b0e45: call 0x1400021d0
0x1458b0e4a: cmp dword ptr [rbp - 0x60], 2
0x1458b0e4e: jne 0x1458b09d0
0x1458b0e54: cmp byte ptr [rbp - 0x58], 0xa
0x1458b0e58: je 0x1458b09da
0x1458b0e5e: lea rcx, [rbp - 0x58]
0x1458b0e62: call 0x1458b0390
0x1458b0e67: nop
0x1458b0e68: jmp 0x1458b09da
0x1458b0e6d: add rax, rdx
0x1458b0e70: mov rcx, rax
0x1458b0e73: jmp 0x1458b0c2f
0x1458b0e78: lea rdx, [rbp - 0x60]
0x1458b0e7c: mov r8d, 0x5b0
0x1458b0e82: mov rcx, qword ptr [rbp + 0x858]
0x1458b0e89: call 0x145d145fb
0x1458b0e8e: jmp 0x1458b0fe6
0x1458b0e93: mov rax, qword ptr [rip + 0x2963a4e]
0x1458b0e9a: mov rax, qword ptr [rax]
0x1458b0e9d: cmp rax, 2
0x1458b0ea1: jb 0x1458b0f4a
0x1458b0ea7: mov qword ptr [rbp + 0x820], 2
0x1458b0eb2: lea rcx, [rip + 0x177fd19]
0x1458b0eb9: mov qword ptr [rbp + 0x828], rcx
0x1458b0ec0: mov qword ptr [rbp + 0x830], 0x13
0x1458b0ecb: lea rax, [rip + 0x177fd13]
0x1458b0ed2: mov qword ptr [rbp + 0x840], rax
0x1458b0ed9: mov qword ptr [rbp + 0x848], 0x3f
0x1458b0ee4: mov qword ptr [rbp + 0x7f0], 0
0x1458b0eef: mov qword ptr [rbp + 0x7f8], rcx
0x1458b0ef6: mov qword ptr [rbp + 0x800], 0x13
0x1458b0f01: mov qword ptr [rbp + 0x808], 0
0x1458b0f0c: lea rax, [rip + 0x177fc23]
0x1458b0f13: mov qword ptr [rbp + 0x810], rax
0x1458b0f1a: mov qword ptr [rbp + 0x818], 0x65
0x1458b0f25: movabs rax, 0x6500000001
0x1458b0f2f: mov qword ptr [rbp + 0x838], rax
0x1458b0f36: lea rcx, [rbp + 0x876]
0x1458b0f3d: lea rdx, [rbp + 0x7f0]
0x1458b0f44: call 0x145b714c0
0x1458b0f49: nop
0x1458b0f4a: mov byte ptr [r14 + 8], 0xa
0x1458b0f4f: mov rax, qword ptr [rbp + 0x868]
0x1458b0f56: mov qword ptr [r14 + 0x10], rax
0x1458b0f5a: mov qword ptr [r14], 2
0x1458b0f61: cmp dword ptr [rbp - 0x60], 2
0x1458b0f65: jne 0x1458b0fdc
0x1458b0f67: cmp byte ptr [rbp - 0x58], 0xa
0x1458b0f6b: je 0x1458b0fe6
0x1458b0f6d: lea rcx, [rbp - 0x58]
0x1458b0f71: call 0x1458b0390
0x1458b0f76: nop
0x1458b0f77: jmp 0x1458b0fe6
0x1458b0f79: mov word ptr [r14 + 8], 0x20b
0x1458b0f80: mov byte ptr [r14 + 0xa], al
0x1458b0f84: jmp 0x1458b0fab
0x1458b0f86: lea rcx, [rbp + 0x718]
0x1458b0f8d: call 0x145a6ff70
0x1458b0f92: nop
0x1458b0f93: movups xmm0, xmmword ptr [rbp + 0x718]
0x1458b0f9a: movups xmm1, xmmword ptr [rbp + 0x728]
0x1458b0fa1: movups xmmword ptr [r14 + 0x18], xmm1
0x1458b0fa6: movups xmmword ptr [r14 + 8], xmm0
0x1458b0fab: mov qword ptr [r14], 2
0x1458b0fb2: mov rcx, qword ptr [rbp + 0x868]
0x1458b0fb9: call 0x1458afa30
0x1458b0fbe: nop
0x1458b0fbf: mov edx, 0x88
0x1458b0fc4: mov r8d, 8
0x1458b0fca: mov rcx, qword ptr [rbp + 0x868]
0x1458b0fd1: call 0x1400021d0
0x1458b0fd6: cmp dword ptr [rbp - 0x60], 2
0x1458b0fda: je 0x1458b0f67
0x1458b0fdc: lea rcx, [rbp - 0x60]
0x1458b0fe0: call 0x1458af660
0x1458b0fe5: nop
0x1458b0fe6: lea rcx, [rbp + 0x738]
0x1458b0fed: call 0x1458b0170
0x1458b0ff2: nop
0x1458b0ff3: lea rcx, [rbp + 0x638]
0x1458b0ffa: call 0x1458b0270
0x1458b0fff: mov r14, qword ptr [rbp + 0x858]
0x1458b1006: mov rax, r14
0x1458b1009: movaps xmm6, xmmword ptr [rbp + 0x880]
0x1458b1010: movaps xmm7, xmmword ptr [rbp + 0x890]
0x1458b1017: movaps xmm8, xmmword ptr [rbp + 0x8a0]
0x1458b101f: movaps xmm9, xmmword ptr [rbp + 0x8b0]
0x1458b1027: movaps xmm10, xmmword ptr [rbp + 0x8c0]
0x1458b102f: movaps xmm11, xmmword ptr [rbp + 0x8d0]
0x1458b1037: movaps xmm12, xmmword ptr [rbp + 0x8e0]
0x1458b103f: movaps xmm13, xmmword ptr [rbp + 0x8f0]
0x1458b1047: add rsp, 0x988
0x1458b104e: pop rbx
0x1458b104f: pop rdi
0x1458b1050: pop rsi
0x1458b1051: pop r12
0x1458b1053: pop r13
0x1458b1055: pop r14
0x1458b1057: pop r15
0x1458b1059: pop rbp
0x1458b105a: ret
0x1458b105b: lea rcx, [rip + 0x177fa8a]
0x1458b1062: lea r8, [rip + 0x177fb37]
0x1458b1069: mov edx, 0x95
0x1458b106e: call 0x145eb7540
0x1458b1073: nop
0x1458b1074: jmp 0x1458b1095
0x1458b1076: mov ecx, 8
0x1458b107b: mov edx, 0x20
0x1458b1080: call 0x145eb6fb1
0x1458b1085: nop
0x1458b1086: jmp 0x1458b1095
0x1458b1088: lea r8, [rip + 0x1a7dd51]
0x1458b108f: call 0x145eb7363
0x1458b1094: nop
0x1458b1095: ud2
