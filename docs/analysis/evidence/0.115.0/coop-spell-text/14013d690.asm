0x14013d690: push rbp
0x14013d691: push r15
0x14013d693: push r14
0x14013d695: push r13
0x14013d697: push r12
0x14013d699: push rsi
0x14013d69a: push rdi
0x14013d69b: push rbx
0x14013d69c: sub rsp, 0x298
0x14013d6a3: lea rbp, [rsp + 0x80]
0x14013d6ab: movdqa xmmword ptr [rbp + 0x200], xmm8
0x14013d6b4: movaps xmmword ptr [rbp + 0x1f0], xmm7
0x14013d6bb: movaps xmmword ptr [rbp + 0x1e0], xmm6
0x14013d6c2: mov qword ptr [rbp + 0x1d8], 0xfffffffffffffffe
0x14013d6cd: mov rax, qword ptr [rbp + 0x288]
0x14013d6d4: mov r10, qword ptr [rbp + 0x280]
0x14013d6db: mov rcx, qword ptr [rdx]
0x14013d6de: mov rdx, qword ptr [r8]
0x14013d6e1: mov qword ptr [rbp + 0x1c0], rdx
0x14013d6e8: mov rdx, qword ptr [r8 + 0x10]
0x14013d6ec: mov qword ptr [rbp + 0x1b0], rdx
0x14013d6f3: mov edx, dword ptr [r8 + 0x1c]
0x14013d6f7: mov dword ptr [rbp + 0x1d0], edx
0x14013d6fd: mov r13, qword ptr [r9]
0x14013d700: mov rdx, qword ptr [r9 + 0x10]
0x14013d704: mov qword ptr [rbp + 0xe0], rdx
0x14013d70b: mov edx, dword ptr [r9 + 0x1c]
0x14013d70f: mov dword ptr [rbp + 0x12c], edx
0x14013d715: mov rsi, qword ptr [r10]
0x14013d718: mov rdx, qword ptr [r10 + 0x10]
0x14013d71c: mov qword ptr [rbp + 0x58], rdx
0x14013d720: mov edx, dword ptr [r10 + 0x1c]
0x14013d724: mov dword ptr [rbp + 0xdc], edx
0x14013d72a: mov rdi, qword ptr [rax]
0x14013d72d: mov rdx, qword ptr [rax + 0x10]
0x14013d731: mov qword ptr [rbp - 8], rdx
0x14013d735: mov eax, dword ptr [rax + 0x1c]
0x14013d738: mov dword ptr [rbp + 0x84], eax
0x14013d73e: mov rax, qword ptr [rbp + 0x290]
0x14013d745: mov rbx, qword ptr [rax]
0x14013d748: call 0x140cf8880
0x14013d74d: mov rcx, rax
0x14013d750: mov byte ptr [rbp + 0x110], dl
0x14013d756: mov rax, qword ptr [rax + 0x20]
0x14013d75a: mov qword ptr [rcx + 0x20], 0
0x14013d762: mov qword ptr [rbp + 0x190], rcx
0x14013d769: add rcx, 8
0x14013d76d: mov qword ptr [rbp + 0x150], rcx
0x14013d774: mov qword ptr [rbp + 0x158], rax
0x14013d77b: xorps xmm0, xmm0
0x14013d77e: movups xmmword ptr [rbp + 0x160], xmm0
0x14013d785: mov qword ptr [rbp + 0x170], rax
0x14013d78c: lea rcx, [rbp - 0x58]
0x14013d790: lea rdx, [rbp + 0x150]
0x14013d797: call 0x1400dd650
0x14013d79c: nop
0x14013d79d: mov rcx, qword ptr [rbp + 0x190]
0x14013d7a4: mov r12, qword ptr [rcx + 0x40]
0x14013d7a8: mov rax, qword ptr [rcx + 0x48]
0x14013d7ac: mov qword ptr [rbp + 0xc8], rax
0x14013d7b3: mov r14, qword ptr [rcx + 0x50]
0x14013d7b7: mov qword ptr [rcx + 0x40], 0xffffffffffffffff
0x14013d7bf: mov rax, qword ptr [rcx + 0x68]
0x14013d7c3: mov qword ptr [rbp + 0x30], rax
0x14013d7c7: movups xmm0, xmmword ptr [rcx + 0x58]
0x14013d7cb: movaps xmmword ptr [rbp + 0x20], xmm0
0x14013d7cf: mov qword ptr [rcx + 0x58], 0xffffffffffffffff
0x14013d7d7: mov rax, qword ptr [rcx + 0x70]
0x14013d7db: mov qword ptr [rbp + 0xc0], rax
0x14013d7e2: mov rax, qword ptr [rcx + 0x78]
0x14013d7e6: mov qword ptr [rbp + 0x60], rax
0x14013d7ea: mov r15, qword ptr [rcx + 0x80]
0x14013d7f1: mov qword ptr [rcx + 0x70], 0xffffffffffffffff
0x14013d7f9: test byte ptr [rbp + 0x110], 1
0x14013d800: jne 0x14013d818
0x14013d802: mov rax, qword ptr [rip + 0x80d722f]
0x14013d809: mov rax, qword ptr [rax]
0x14013d80c: shl rax, 1
0x14013d80f: test rax, rax
0x14013d812: jne 0x14013ee3c
0x14013d818: xor eax, eax
0x14013d81a: xchg byte ptr [rcx], al
0x14013d81c: cmp al, 2
0x14013d81e: je 0x14013ee32
0x14013d824: mov rax, qword ptr [rbp - 0x48]
0x14013d828: mov qword ptr [rbp + 0x50], rax
0x14013d82c: movups xmm0, xmmword ptr [rbp - 0x58]
0x14013d830: movaps xmmword ptr [rbp + 0x40], xmm0
0x14013d834: movdqa xmm0, xmmword ptr [rbp + 0x20]
0x14013d839: movdqa xmmword ptr [rbp - 0x20], xmm0
0x14013d83e: mov rax, qword ptr [rbp + 0x30]
0x14013d842: mov qword ptr [rbp - 0x10], rax
0x14013d846: mov rax, qword ptr [rbp - 0x20]
0x14013d84a: mov qword ptr [rbp + 0x10], rax
0x14013d84e: cmp rax, -1
0x14013d852: mov qword ptr [rbp + 0xf8], r12
0x14013d859: je 0x14013d9a6
0x14013d85f: mov rax, qword ptr [rbp + 0x30]
0x14013d863: mov qword ptr [rbp + 0xb0], rax
0x14013d86a: movdqa xmm0, xmmword ptr [rbp + 0x20]
0x14013d86f: movdqa xmmword ptr [rbp + 0xa0], xmm0
0x14013d877: mov byte ptr [rbp + 0x1bf], 1
0x14013d87e: lea rcx, [rbp + 0x150]
0x14013d885: lea rdx, [rbp + 0xa0]
0x14013d88c: call 0x1400eda20
0x14013d891: nop
0x14013d892: mov rax, qword ptr [rbp + 0x1b0]
0x14013d899: mov ecx, dword ptr [rbp + 0x1d0]
0x14013d89f: mov dword ptr [rax], ecx
0x14013d8a1: mov rax, qword ptr [rbp + 0x1c0]
0x14013d8a8: lea rcx, [rax + 0x48]
0x14013d8ac: mov qword ptr [rbp + 0x120], rcx
0x14013d8b3: mov rcx, qword ptr [rax + 0x50]
0x14013d8b7: mov rax, qword ptr [rax + 0x58]
0x14013d8bb: mov qword ptr [rbp + 0x110], rax
0x14013d8c2: mov qword ptr [rbp + 0x190], 0
0x14013d8cd: mov qword ptr [rbp + 0x88], rcx
0x14013d8d4: nop word ptr cs:[rax + rax]
0x14013d8e0: mov rax, qword ptr [rbp + 0x190]
0x14013d8e7: cmp qword ptr [rbp + 0x110], rax
0x14013d8ee: je 0x14013d90c
0x14013d8f0: inc rax
0x14013d8f3: mov qword ptr [rbp + 0x190], rax
0x14013d8fa: lea r12, [rcx + 0xb0]
0x14013d901: call 0x14006bb30
0x14013d906: nop
0x14013d907: mov rcx, r12
0x14013d90a: jmp 0x14013d8e0
0x14013d90c: mov r12, qword ptr [rbp + 0x120]
0x14013d913: mov rax, qword ptr [r12]
0x14013d917: test rax, rax
0x14013d91a: mov rcx, qword ptr [rbp + 0x1c0]
0x14013d921: je 0x14013d939
0x14013d923: mov rcx, qword ptr [rcx + 0x50]
0x14013d927: imul rdx, rax, 0xb0
0x14013d92e: mov r8d, 8
0x14013d934: call 0x1400021d0
0x14013d939: mov rax, qword ptr [rbp + 0x160]
0x14013d940: mov qword ptr [r12 + 0x10], rax
0x14013d945: movdqu xmm0, xmmword ptr [rbp + 0x150]
0x14013d94d: movdqu xmmword ptr [r12], xmm0
0x14013d953: mov rax, qword ptr [rbp + 0xa0]
0x14013d95a: mov rcx, qword ptr [rbp + 0xa8]
0x14013d961: imul rdx, qword ptr [rbp + 0xb0], 0xb0
0x14013d96c: add rdx, rcx
0x14013d96f: mov qword ptr [rbp + 0x150], rcx
0x14013d976: mov qword ptr [rbp + 0x158], rcx
0x14013d97d: mov qword ptr [rbp + 0x160], rax
0x14013d984: mov qword ptr [rbp + 0x168], rdx
0x14013d98b: mov byte ptr [rbp + 0x1bf], 0
0x14013d992: lea rcx, [rbp + 0x150]
0x14013d999: call 0x140239a00
0x14013d99e: nop
0x14013d99f: mov r12, qword ptr [rbp + 0xf8]
0x14013d9a6: cmp qword ptr [rbp + 0xc0], -1
0x14013d9ae: sete byte ptr [rbp + 0x1af]
0x14013d9b5: je 0x14013da0f
0x14013d9b7: lea rax, [r15 + r15*2]
0x14013d9bb: mov rcx, qword ptr [rbp + 0x60]
0x14013d9bf: lea rax, [rcx + rax*4]
0x14013d9c3: mov qword ptr [rbp + 0x150], rcx
0x14013d9ca: mov qword ptr [rbp + 0x158], rcx
0x14013d9d1: mov rcx, qword ptr [rbp + 0xc0]
0x14013d9d8: mov qword ptr [rbp + 0x160], rcx
0x14013d9df: mov qword ptr [rbp + 0x168], rax
0x14013d9e6: mov byte ptr [rbp + 0x1cf], 0
0x14013d9ed: mov byte ptr [rbp + 0x1ce], 1
0x14013d9f4: mov byte ptr [rbp + 0x1cd], 1
0x14013d9fb: lea rcx, [rbp + 0x150]
0x14013da02: call 0x140239900
0x14013da07: nop
0x14013da08: mov r12, qword ptr [rbp + 0xf8]
0x14013da0f: cmp r12, -1
0x14013da13: sete r15b
0x14013da17: mov r12, qword ptr [rbp + 0x1c0]
0x14013da1e: je 0x14013db1a
0x14013da24: mov rax, qword ptr [rbp + 0xc8]
0x14013da2b: mov qword ptr [rbp + 0x150], rax
0x14013da32: mov qword ptr [rbp + 0x158], r14
0x14013da39: pxor xmm0, xmm0
0x14013da3d: movdqu xmmword ptr [rbp + 0x160], xmm0
0x14013da45: mov qword ptr [rbp + 0x170], rax
0x14013da4c: mov qword ptr [rbp + 0x178], r14
0x14013da53: lea rcx, [rbp + 0xa0]
0x14013da5a: lea rdx, [rbp + 0x150]
0x14013da61: call 0x1400c9870
0x14013da66: nop
0x14013da67: movzx eax, byte ptr [rbp + 0xa0]
0x14013da6e: mov byte ptr [rbp + 0x190], al
0x14013da74: cmp al, 0xff
0x14013da76: je 0x14013da98
0x14013da78: movdqu xmm0, xmmword ptr [rbp + 0xa1]
0x14013da80: movups xmm1, xmmword ptr [rbp + 0xb0]
0x14013da87: movups xmmword ptr [rbp + 0x15f], xmm1
0x14013da8e: movdqa xmmword ptr [rbp + 0x150], xmm0
0x14013da96: jmp 0x14013daa5
0x14013da98: lea rcx, [rbp + 0xa0]
0x14013da9f: call 0x140128ac0
0x14013daa4: nop
0x14013daa5: mov rax, qword ptr [rbp + 0x1b0]
0x14013daac: mov ecx, dword ptr [rbp + 0x1d0]
0x14013dab2: mov dword ptr [rax], ecx
0x14013dab4: cmp byte ptr [r12 + 0x60], 0xff
0x14013daba: je 0x14013dacd
0x14013dabc: mov rax, qword ptr [rbp + 0x1c0]
0x14013dac3: lea rcx, [rax + 0x60]
0x14013dac7: call 0x140023810
0x14013dacc: nop
0x14013dacd: movzx eax, byte ptr [rbp + 0x190]
0x14013dad4: mov r12, qword ptr [rbp + 0x1c0]
0x14013dadb: mov byte ptr [r12 + 0x60], al
0x14013dae0: movaps xmm0, xmmword ptr [rbp + 0x150]
0x14013dae7: movups xmmword ptr [r12 + 0x61], xmm0
0x14013daed: movdqu xmm0, xmmword ptr [rbp + 0x15f]
0x14013daf5: movdqu xmmword ptr [r12 + 0x70], xmm0
0x14013dafc: mov rdx, qword ptr [rbp + 0xf8]
0x14013db03: test rdx, rdx
0x14013db06: je 0x14013db1a
0x14013db08: mov r8d, 1
0x14013db0e: mov rcx, qword ptr [rbp + 0xc8]
0x14013db15: call 0x1400021d0
0x14013db1a: mov byte ptr [rbp + 0x1ac], r15b
0x14013db21: movss xmm6, dword ptr [rbx + 0x5c]
0x14013db26: mov rcx, qword ptr [rbp + 0x40]
0x14013db2a: mov rdx, qword ptr [rbp + 0x48]
0x14013db2e: mov rax, qword ptr [rbp + 0x50]
0x14013db32: lea rax, [rax + rax*2]
0x14013db36: lea r14, [rdx + rax*8]
0x14013db3a: mov qword ptr [rbp - 0x40], rdx
0x14013db3e: mov qword ptr [rbp], rcx
0x14013db42: mov qword ptr [rbp - 0x30], rcx
0x14013db46: mov qword ptr [rbp - 0x28], r14
0x14013db4a: lea rcx, [r12 + 0x18]
0x14013db4f: mov qword ptr [rbp + 0x100], rcx
0x14013db56: lea rcx, [r12 + 0x28]
0x14013db5b: mov qword ptr [rbp + 0x90], rcx
0x14013db62: lea rcx, [r12 + 0x30]
0x14013db67: mov qword ptr [rbp + 0xe8], rcx
0x14013db6e: lea rcx, [r12 + 0x40]
0x14013db73: mov qword ptr [rbp + 0x68], rcx
0x14013db77: lea rcx, [r12 + 0xa0]
0x14013db7f: mov qword ptr [rbp + 0x1a0], rcx
0x14013db86: lea rcx, [r12 + 0x80]
0x14013db8e: mov qword ptr [rbp + 0x198], rcx
0x14013db95: lea rax, [rdx + rax*8 - 0x18]
0x14013db9a: mov qword ptr [rbp + 0x88], rax
0x14013dba1: xorps xmm7, xmm7
0x14013dba4: pcmpeqd xmm8, xmm8
0x14013dba9: lea rax, [r12 + 0xc0]
0x14013dbb1: mov qword ptr [rbp + 0x118], rax
0x14013dbb8: lea rax, [r12 + 0x60]
0x14013dbbd: mov qword ptr [rbp + 0x18], rax
0x14013dbc1: lea rax, [r12 + 0x48]
0x14013dbc6: mov qword ptr [rbp + 0xd0], rax
0x14013dbcd: lea rax, [r12 + 0x10]
0x14013dbd2: mov qword ptr [rbp + 0x70], rax
0x14013dbd6: mov qword ptr [rbp + 8], rdx
0x14013dbda: mov r12, rdx
0x14013dbdd: mov qword ptr [rbp + 0x120], r13
0x14013dbe4: mov rbx, qword ptr [rbp + 0x88]
0x14013dbeb: sub rbx, r12
0x14013dbee: lea r15, [r12 + 0x20]
0x14013dbf3: jmp 0x14013dc25
0x14013dbf5: nop word ptr cs:[rax + rax]
0x14013dc00: lea rcx, [rbp + 0xa0]
0x14013dc07: call 0x140128ac0
0x14013dc0c: nop
0x14013dc0d: add rbx, -0x18
0x14013dc11: add r15, 0x18
0x14013dc15: mov rdx, qword ptr [rbp + 0x190]
0x14013dc1c: test rdx, rdx
0x14013dc1f: jne 0x14013ed4d
0x14013dc25: cmp r12, r14
0x14013dc28: je 0x14013edc2
0x14013dc2e: mov rax, r12
0x14013dc31: add r12, 0x18
0x14013dc35: mov qword ptr [rbp - 0x38], r12
0x14013dc39: mov rcx, qword ptr [rax]
0x14013dc3c: cmp rcx, -1
0x14013dc40: je 0x14013ed78
0x14013dc46: mov qword ptr [rbp + 0x190], rcx
0x14013dc4d: mov rcx, qword ptr [rax + 8]
0x14013dc51: mov rax, qword ptr [rax + 0x10]
0x14013dc55: mov qword ptr [rbp + 0x150], rcx
0x14013dc5c: mov qword ptr [rbp + 0x158], rax
0x14013dc63: lea rdx, [rbp + 0x160]
0x14013dc6a: movups xmmword ptr [rdx], xmm7
0x14013dc6d: mov qword ptr [rbp + 0x110], rcx
0x14013dc74: mov qword ptr [rbp + 0x170], rcx
0x14013dc7b: mov qword ptr [rbp + 0x178], rax
0x14013dc82: lea rcx, [rbp + 0xa0]
0x14013dc89: lea rdx, [rbp + 0x150]
0x14013dc90: call 0x1400c9870
0x14013dc95: nop
0x14013dc96: cmp byte ptr [rbp + 0xa0], 0xff
0x14013dc9d: je 0x14013dc00
0x14013dca3: movdqu xmm0, xmmword ptr [rbp + 0xa0]
0x14013dcab: movups xmm1, xmmword ptr [rbp + 0xb0]
0x14013dcb2: movaps xmmword ptr [rbp + 0x140], xmm1
0x14013dcb9: movdqa xmmword ptr [rbp + 0x130], xmm0
0x14013dcc1: mov byte ptr [rbp + 0x1d7], 1
0x14013dcc8: mov edx, 4
0x14013dccd: lea rcx, [rip + 0x5db6fce]
0x14013dcd4: lea r8, [rbp + 0x130]
0x14013dcdb: call 0x142a769a0
0x14013dce0: nop
0x14013dce1: test rax, rax
0x14013dce4: jne 0x14013dced
0x14013dce6: mov rax, qword ptr [rip + 0x80ac523]
0x14013dced: cmp byte ptr [rax], 3
0x14013dcf0: jne 0x14013dfd0
0x14013dcf6: mov rcx, qword ptr [rax + 0x18]
0x14013dcfa: add rcx, -2
0x14013dcfe: cmp rcx, 5
0x14013dd02: ja 0x14013dfd0
0x14013dd08: mov rax, qword ptr [rax + 0x10]
0x14013dd0c: lea rdx, [rip + 0x5dc2c0d]
0x14013dd13: movsxd rcx, dword ptr [rdx + rcx*4]
0x14013dd17: add rcx, rdx
0x14013dd1a: jmp rcx
0x14013dd1c: cmp word ptr [rax], 0x7a68
0x14013dd21: je 0x14013dd83
0x14013dd23: jmp 0x14013dfd0
0x14013dd28: cmp dword ptr [rax], 0x706f6f63
0x14013dd2e: je 0x14013ddeb
0x14013dd34: jmp 0x14013dfd0
0x14013dd39: mov ecx, dword ptr [rax]
0x14013dd3b: mov edx, 0x6e657a68
0x14013dd40: xor ecx, edx
0x14013dd42: movzx edx, byte ptr [rax + 4]
0x14013dd46: xor edx, 0x64
0x14013dd49: or edx, ecx
0x14013dd4b: je 0x14013dd83
0x14013dd4d: mov ecx, dword ptr [rax]
0x14013dd4f: mov edx, 0x74726170
0x14013dd54: xor ecx, edx
0x14013dd56: movzx edx, byte ptr [rax + 4]
0x14013dd5a: xor edx, 0x79
0x14013dd5d: or edx, ecx
0x14013dd5f: je 0x14013ddeb
0x14013dd65: jmp 0x14013de90
0x14013dd6a: movzx ecx, word ptr [rax]
0x14013dd6d: xor ecx, 0x7a68
0x14013dd73: movzx eax, byte ptr [rax + 2]
0x14013dd77: xor eax, 0x74
0x14013dd7a: or ax, cx
0x14013dd7d: jne 0x14013dfd0
0x14013dd83: mov rax, qword ptr [rbp + 0x58]
0x14013dd87: mov ecx, dword ptr [rbp + 0xdc]
0x14013dd8d: mov dword ptr [rax], ecx
0x14013dd8f: mov r13, qword ptr [rsi + 0x10]
0x14013dd93: cmp r13, qword ptr [rsi]
0x14013dd96: jne 0x14013dda1
0x14013dd98: mov rcx, rsi
0x14013dd9b: call 0x145d150f0
0x14013dda0: nop
0x14013dda1: mov rax, qword ptr [rsi + 8]
0x14013dda5: mov rcx, r13
0x14013dda8: shl rcx, 5
0x14013ddac: movdqa xmm0, xmmword ptr [rbp + 0x130]
0x14013ddb4: movaps xmm1, xmmword ptr [rbp + 0x140]
0x14013ddbb: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x14013ddc0: movdqu xmmword ptr [rax + rcx], xmm0
0x14013ddc5: inc r13
0x14013ddc8: mov qword ptr [rsi + 0x10], r13
0x14013ddcc: jmp 0x14013de34
0x14013ddce: mov ecx, dword ptr [rax]
0x14013ddd0: mov edx, 0x62626f6c
0x14013ddd5: xor ecx, edx
0x14013ddd7: mov edx, dword ptr [rax + 3]
0x14013ddda: mov r8d, 0x73656962
0x14013dde0: xor edx, r8d
0x14013dde3: or edx, ecx
0x14013dde5: jne 0x14013de73
0x14013ddeb: mov rax, qword ptr [rbp - 8]
0x14013ddef: mov ecx, dword ptr [rbp + 0x84]
0x14013ddf5: mov dword ptr [rax], ecx
0x14013ddf7: mov r13, qword ptr [rdi + 0x10]
0x14013ddfb: cmp r13, qword ptr [rdi]
0x14013ddfe: jne 0x14013de09
0x14013de00: mov rcx, rdi
0x14013de03: call 0x145d150f0
0x14013de08: nop
0x14013de09: mov rax, qword ptr [rdi + 8]
0x14013de0d: mov rcx, r13
0x14013de10: shl rcx, 5
0x14013de14: movdqa xmm0, xmmword ptr [rbp + 0x130]
0x14013de1c: movaps xmm1, xmmword ptr [rbp + 0x140]
0x14013de23: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x14013de28: movdqu xmmword ptr [rax + rcx], xmm0
0x14013de2d: inc r13
0x14013de30: mov qword ptr [rdi + 0x10], r13
0x14013de34: mov r13, qword ptr [rbp + 0x120]
0x14013de3b: jmp 0x14013dc0d
0x14013de40: mov ecx, dword ptr [rax]
0x14013de42: mov edx, 0x65666564
0x14013de47: xor ecx, edx
0x14013de49: movzx edx, word ptr [rax + 4]
0x14013de4d: xor edx, 0x7461
0x14013de53: or edx, ecx
0x14013de55: je 0x14013dea8
0x14013de57: mov ecx, dword ptr [rax]
0x14013de59: mov edx, 0x6f676f6c
0x14013de5e: xor ecx, edx
0x14013de60: movzx eax, word ptr [rax + 4]
0x14013de64: xor eax, 0x7475
0x14013de69: or eax, ecx
0x14013de6b: jne 0x14013dfd0
0x14013de71: jmp 0x14013dea8
0x14013de73: mov ecx, dword ptr [rax]
0x14013de75: mov edx, 0x74636976
0x14013de7a: xor ecx, edx
0x14013de7c: mov eax, dword ptr [rax + 3]
0x14013de7f: mov edx, 0x79726f74
0x14013de84: xor eax, edx
0x14013de86: or eax, ecx
0x14013de88: jne 0x14013dfd0
0x14013de8e: jmp 0x14013dea8
0x14013de90: mov ecx, dword ptr [rax]
0x14013de92: mov edx, 0x64616572
0x14013de97: xor ecx, edx
0x14013de99: movzx eax, byte ptr [rax + 4]
0x14013de9d: xor eax, 0x79
0x14013dea0: or eax, ecx
0x14013dea2: jne 0x14013dfd0
0x14013dea8: mov rax, qword ptr [rbp + 0x58]
0x14013deac: mov ecx, dword ptr [rbp + 0xdc]
0x14013deb2: mov dword ptr [rax], ecx
0x14013deb4: movzx ebx, byte ptr [rbp + 0x130]
0x14013debb: movzx eax, bl
0x14013debe: lea rcx, [rip + 0x5dc2a73]
0x14013dec5: movsxd rax, dword ptr [rcx + rax*4]
0x14013dec9: add rax, rcx
0x14013decc: jmp rax
0x14013dece: movzx eax, byte ptr [rbp + 0x131]
0x14013ded5: mov byte ptr [rbp + 0x151], al
0x14013dedb: jmp 0x14013df82
0x14013dee0: mov byte ptr [rbp + 0x1d7], 1
0x14013dee7: lea rcx, [rbp + 0x158]
0x14013deee: lea rdx, [rbp + 0x138]
0x14013def5: call 0x1400ec990
0x14013defa: nop
0x14013defb: jmp 0x14013df82
0x14013df00: lea rax, [rbp + 0x138]
0x14013df07: movdqu xmm0, xmmword ptr [rax]
0x14013df0b: lea rax, [rbp + 0x158]
0x14013df12: movdqu xmmword ptr [rax], xmm0
0x14013df16: jmp 0x14013df82
0x14013df18: mov byte ptr [rbp + 0x1d7], 1
0x14013df1f: lea rcx, [rbp + 0x158]
0x14013df26: lea rdx, [rbp + 0x138]
0x14013df2d: call 0x145ce7810
0x14013df32: nop
0x14013df33: jmp 0x14013df82
0x14013df35: cmp qword ptr [rbp + 0x148], 0
0x14013df3d: je 0x14013df6c
0x14013df3f: mov rdx, qword ptr [rbp + 0x138]
0x14013df46: test rdx, rdx
0x14013df49: je 0x14013ee59
0x14013df4f: mov r8, qword ptr [rbp + 0x140]
0x14013df56: mov byte ptr [rbp + 0x1d7], 1
0x14013df5d: lea rcx, [rbp + 0x158]
0x14013df64: call 0x140071b30
0x14013df69: nop
0x14013df6a: jmp 0x14013df82
0x14013df6c: mov qword ptr [rbp + 0x158], 0
0x14013df77: mov qword ptr [rbp + 0x168], 0
0x14013df82: mov byte ptr [rbp + 0x150], bl
0x14013df88: mov rbx, qword ptr [rsi + 0x10]
0x14013df8c: cmp rbx, qword ptr [rsi]
0x14013df8f: jne 0x14013df9a
0x14013df91: mov rcx, rsi
0x14013df94: call 0x145d150f0
0x14013df99: nop
0x14013df9a: mov rax, qword ptr [rsi + 8]
0x14013df9e: mov rcx, rbx
0x14013dfa1: shl rcx, 5
0x14013dfa5: movdqu xmm0, xmmword ptr [rbp + 0x150]
0x14013dfad: movups xmm1, xmmword ptr [rbp + 0x160]
0x14013dfb4: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x14013dfb9: movdqu xmmword ptr [rax + rcx], xmm0
0x14013dfbe: inc rbx
0x14013dfc1: mov qword ptr [rsi + 0x10], rbx
0x14013dfc5: nop word ptr cs:[rax + rax]
0x14013dfd0: mov byte ptr [rbp + 0x1d7], 1
0x14013dfd7: mov edx, 4
0x14013dfdc: lea rcx, [rip + 0x5db6cbf]
0x14013dfe3: lea r8, [rbp + 0x130]
0x14013dfea: call 0x142a769a0
0x14013dfef: nop
0x14013dff0: test rax, rax
0x14013dff3: jne 0x14013dffc
0x14013dff5: mov rax, qword ptr [rip + 0x80ac214]
0x14013dffc: cmp byte ptr [rax], 3
0x14013dfff: jne 0x14013ed30
0x14013e005: mov rcx, qword ptr [rax + 0x18]
0x14013e009: add rcx, -4
0x14013e00d: cmp rcx, 5
0x14013e011: ja 0x14013ed30
0x14013e017: mov rax, qword ptr [rax + 0x10]
0x14013e01b: lea rdx, [rip + 0x5dc292e]
0x14013e022: movsxd rcx, dword ptr [rdx + rcx*4]
0x14013e026: add rcx, rdx
0x14013e029: jmp rcx
0x14013e02b: cmp dword ptr [rax], 0x706f7264
0x14013e031: jne 0x14013ed30
0x14013e037: mov rax, qword ptr [rbp + 0x1b0]
0x14013e03e: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e044: mov dword ptr [rax], ecx
0x14013e046: movzx ebx, byte ptr [rbp + 0x130]
0x14013e04d: movzx eax, bl
0x14013e050: lea rcx, [rip + 0x5dc2911]
0x14013e057: movsxd rax, dword ptr [rcx + rax*4]
0x14013e05b: add rax, rcx
0x14013e05e: jmp rax
0x14013e060: movzx eax, byte ptr [rbp + 0x131]
0x14013e067: mov byte ptr [rbp + 0x151], al
0x14013e06d: jmp 0x14013ebe5
0x14013e072: movabs rcx, 0x6465737561706e75
0x14013e07c: cmp qword ptr [rax], rcx
0x14013e07f: je 0x14013e571
0x14013e085: movabs rcx, 0x7078746e656c6174
0x14013e08f: cmp qword ptr [rax], rcx
0x14013e092: je 0x14013e826
0x14013e098: movabs rcx, 0x64656b636f6c6e75
0x14013e0a2: cmp qword ptr [rax], rcx
0x14013e0a5: jne 0x14013ed30
0x14013e0ab: mov rax, qword ptr [rbp + 0x1b0]
0x14013e0b2: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e0b8: mov dword ptr [rax], ecx
0x14013e0ba: mov rax, qword ptr [rbp + 0x1a0]
0x14013e0c1: cmp byte ptr [rax], 0xff
0x14013e0c4: je 0x14013ed30
0x14013e0ca: mov byte ptr [rbp + 0x1d7], 1
0x14013e0d1: mov edx, 2
0x14013e0d6: lea rcx, [rip + 0x5db6bd5]
0x14013e0dd: lea r8, [rbp + 0x130]
0x14013e0e4: call 0x142a769a0
0x14013e0e9: nop
0x14013e0ea: test rax, rax
0x14013e0ed: jne 0x14013e0f6
0x14013e0ef: mov rax, qword ptr [rip + 0x80ac11a]
0x14013e0f6: cmp byte ptr [rax], 3
0x14013e0f9: jne 0x14013eaea
0x14013e0ff: mov rbx, qword ptr [rax + 0x18]
0x14013e103: test rbx, rbx
0x14013e106: js 0x14013ee0c
0x14013e10c: je 0x14013ed64
0x14013e112: mov r13, qword ptr [rax + 0x10]
0x14013e116: call 0x140002200
0x14013e11b: mov edx, 1
0x14013e120: mov rcx, rbx
0x14013e123: call 0x1400021c0
0x14013e128: test rax, rax
0x14013e12b: je 0x14013ee85
0x14013e131: mov r15, rax
0x14013e134: mov rcx, rax
0x14013e137: mov rdx, r13
0x14013e13a: mov r8, rbx
0x14013e13d: call 0x145d145fb
0x14013e142: jmp 0x14013ed6c
0x14013e147: mov ecx, dword ptr [rax]
0x14013e149: mov edx, 0x74736f72
0x14013e14e: xor ecx, edx
0x14013e150: movzx edx, word ptr [rax + 4]
0x14013e154: xor edx, 0x7265
0x14013e15a: or edx, ecx
0x14013e15c: je 0x14013e593
0x14013e162: mov ecx, dword ptr [rax]
0x14013e164: mov edx, 0x6b636970
0x14013e169: xor ecx, edx
0x14013e16b: movzx edx, word ptr [rax + 4]
0x14013e16f: xor edx, 0x6465
0x14013e175: or edx, ecx
0x14013e177: je 0x14013e8cc
0x14013e17d: mov ecx, dword ptr [rax]
0x14013e17f: mov edx, 0x73756170
0x14013e184: xor ecx, edx
0x14013e186: movzx edx, word ptr [rax + 4]
0x14013e18a: xor edx, 0x6465
0x14013e190: or edx, ecx
0x14013e192: je 0x14013e935
0x14013e198: mov ecx, dword ptr [rax]
0x14013e19a: mov edx, 0x75736572
0x14013e19f: xor ecx, edx
0x14013e1a1: movzx edx, word ptr [rax + 4]
0x14013e1a5: xor edx, 0x656d
0x14013e1ab: or edx, ecx
0x14013e1ad: je 0x14013e957
0x14013e1b3: mov ecx, dword ptr [rax]
0x14013e1b5: mov edx, 0x6e6e6162
0x14013e1ba: xor ecx, edx
0x14013e1bc: movzx edx, word ptr [rax + 4]
0x14013e1c0: xor edx, 0x7265
0x14013e1c6: or edx, ecx
0x14013e1c8: je 0x14013ea40
0x14013e1ce: mov ecx, dword ptr [rax]
0x14013e1d0: mov edx, 0x65666564
0x14013e1d5: xor ecx, edx
0x14013e1d7: movzx edx, word ptr [rax + 4]
0x14013e1db: xor edx, 0x7461
0x14013e1e1: or edx, ecx
0x14013e1e3: je 0x14013e448
0x14013e1e9: mov ecx, dword ptr [rax]
0x14013e1eb: mov edx, 0x6f676f6c
0x14013e1f0: xor ecx, edx
0x14013e1f2: movzx eax, word ptr [rax + 4]
0x14013e1f6: xor eax, 0x7475
0x14013e1fb: or eax, ecx
0x14013e1fd: jne 0x14013ed30
0x14013e203: mov rax, qword ptr [rbp + 0x1c0]
0x14013e20a: movq xmm0, qword ptr [rax + 0xe0]
0x14013e212: psubd xmm0, xmm8
0x14013e217: movdqa xmmword ptr [rbp + 0x180], xmm0
0x14013e21f: mov rcx, qword ptr [rbp + 0x1b0]
0x14013e226: mov edx, dword ptr [rbp + 0x1d0]
0x14013e22c: mov dword ptr [rcx], edx
0x14013e22e: cmp byte ptr [rax + 0x60], 0xff
0x14013e232: je 0x14013e23e
0x14013e234: mov rcx, qword ptr [rbp + 0x18]
0x14013e238: call 0x140023810
0x14013e23d: nop
0x14013e23e: mov rcx, qword ptr [rbp + 0x198]
0x14013e245: cmp byte ptr [rcx], 0xff
0x14013e248: je 0x14013e250
0x14013e24a: call 0x140023810
0x14013e24f: nop
0x14013e250: mov rcx, qword ptr [rbp + 0x1a0]
0x14013e257: cmp byte ptr [rcx], 0xff
0x14013e25a: je 0x14013e262
0x14013e25c: call 0x140023810
0x14013e261: nop
0x14013e262: mov rcx, qword ptr [rbp + 0x118]
0x14013e269: cmp byte ptr [rcx], 0xff
0x14013e26c: je 0x14013e274
0x14013e26e: call 0x140023810
0x14013e273: nop
0x14013e274: mov rcx, qword ptr [rbp + 0x1c0]
0x14013e27b: call 0x1400f1210
0x14013e280: nop
0x14013e281: mov rax, qword ptr [rbp + 0x1c0]
0x14013e288: mov rdx, qword ptr [rax]
0x14013e28b: test rdx, rdx
0x14013e28e: je 0x14013e2a4
0x14013e290: mov rcx, qword ptr [rax + 8]
0x14013e294: shl rdx, 5
0x14013e298: mov r8d, 8
0x14013e29e: call 0x1400021d0
0x14013e2a3: nop
0x14013e2a4: mov rcx, qword ptr [rbp + 0x100]
0x14013e2ab: call 0x1400f0890
0x14013e2b0: nop
0x14013e2b1: mov rax, qword ptr [rbp + 0x100]
0x14013e2b8: mov rdx, qword ptr [rax]
0x14013e2bb: test rdx, rdx
0x14013e2be: je 0x14013e2db
0x14013e2c0: mov rax, qword ptr [rbp + 0x1c0]
0x14013e2c7: mov rcx, qword ptr [rax + 0x20]
0x14013e2cb: shl rdx, 5
0x14013e2cf: mov r8d, 8
0x14013e2d5: call 0x1400021d0
0x14013e2da: nop
0x14013e2db: mov rcx, qword ptr [rbp + 0xe8]
0x14013e2e2: call 0x1400f1260
0x14013e2e7: nop
0x14013e2e8: mov rax, qword ptr [rbp + 0xe8]
0x14013e2ef: mov rax, qword ptr [rax]
0x14013e2f2: test rax, rax
0x14013e2f5: je 0x14013e316
0x14013e2f7: mov rcx, qword ptr [rbp + 0x1c0]
0x14013e2fe: mov rcx, qword ptr [rcx + 0x38]
0x14013e302: shl rax, 3
0x14013e306: lea rdx, [rax + rax*4]
0x14013e30a: mov r8d, 8
0x14013e310: call 0x1400021d0
0x14013e315: nop
0x14013e316: mov rcx, qword ptr [rbp + 0xd0]
0x14013e31d: call 0x1400f10d0
0x14013e322: nop
0x14013e323: mov rax, qword ptr [rbp + 0xd0]
0x14013e32a: mov rax, qword ptr [rax]
0x14013e32d: test rax, rax
0x14013e330: mov rbx, qword ptr [rbp + 0x1c0]
0x14013e337: je 0x14013e34f
0x14013e339: mov rcx, qword ptr [rbx + 0x50]
0x14013e33d: imul rdx, rax, 0xb0
0x14013e344: mov r8d, 8
0x14013e34a: call 0x1400021d0
0x14013e34f: mov qword ptr [rbx], 0
0x14013e356: mov qword ptr [rbx + 8], 8
0x14013e35e: mov rax, qword ptr [rbp + 0x70]
0x14013e362: movups xmmword ptr [rax], xmm7
0x14013e365: mov qword ptr [rbx + 0x20], 8
0x14013e36d: mov rax, qword ptr [rbp + 0x90]
0x14013e374: movups xmmword ptr [rax], xmm7
0x14013e377: mov qword ptr [rbx + 0x38], 8
0x14013e37f: mov rax, qword ptr [rbp + 0x68]
0x14013e383: movups xmmword ptr [rax], xmm7
0x14013e386: mov qword ptr [rbx + 0x50], 8
0x14013e38e: mov qword ptr [rbx + 0x58], 0
0x14013e396: mov byte ptr [rbx + 0x60], 0xff
0x14013e39a: mov byte ptr [rbx + 0x80], 0xff
0x14013e3a1: mov byte ptr [rbx + 0xa0], 0xff
0x14013e3a8: mov byte ptr [rbx + 0xc0], 0xff
0x14013e3af: movdqa xmm0, xmmword ptr [rbp + 0x180]
0x14013e3b7: movq qword ptr [rbx + 0xe0], xmm0
0x14013e3bf: mov word ptr [rbx + 0xe8], 0
0x14013e3c8: mov byte ptr [rbx + 0xea], 0
0x14013e3cf: mov rcx, qword ptr [rbp + 0xe0]
0x14013e3d6: mov edx, dword ptr [rbp + 0x12c]
0x14013e3dc: mov dword ptr [rcx], edx
0x14013e3de: mov byte ptr [r13 + 0xe], 0
0x14013e3e3: movzx eax, byte ptr [r13 + 0xc]
0x14013e3e8: mov dword ptr [rcx], edx
0x14013e3ea: mov byte ptr [r13 + 0xd], al
0x14013e3ee: jmp 0x14013ed30
0x14013e3f3: mov ecx, dword ptr [rax]
0x14013e3f5: mov edx, 0x696f6863
0x14013e3fa: xor ecx, edx
0x14013e3fc: mov edx, dword ptr [rax + 3]
0x14013e3ff: mov r8d, 0x73656369
0x14013e405: xor edx, r8d
0x14013e408: or edx, ecx
0x14013e40a: je 0x14013e5ac
0x14013e410: mov ecx, dword ptr [rax]
0x14013e412: mov edx, 0x6c646e65
0x14013e417: xor ecx, edx
0x14013e419: mov edx, dword ptr [rax + 3]
0x14013e41c: mov r8d, 0x7373656c
0x14013e422: xor edx, r8d
0x14013e425: or edx, ecx
0x14013e427: je 0x14013e8e5
0x14013e42d: mov ecx, dword ptr [rax]
0x14013e42f: mov edx, 0x74636976
0x14013e434: xor ecx, edx
0x14013e436: mov eax, dword ptr [rax + 3]
0x14013e439: mov edx, 0x79726f74
0x14013e43e: xor eax, edx
0x14013e440: or eax, ecx
0x14013e442: jne 0x14013ed30
0x14013e448: mov rax, qword ptr [rbp + 0x1c0]
0x14013e44f: mov byte ptr [rax + 0xea], 0
0x14013e456: mov rcx, qword ptr [rbp + 0x1b0]
0x14013e45d: mov edx, dword ptr [rbp + 0x1d0]
0x14013e463: mov dword ptr [rcx], edx
0x14013e465: cmp byte ptr [rax + 0x80], 0xff
0x14013e46c: je 0x14013e47b
0x14013e46e: mov rcx, qword ptr [rbp + 0x198]
0x14013e475: call 0x140023810
0x14013e47a: nop
0x14013e47b: mov rax, qword ptr [rbp + 0x1c0]
0x14013e482: mov byte ptr [rax + 0x80], 0xff
0x14013e489: mov rcx, qword ptr [rbp + 0x1b0]
0x14013e490: mov edx, dword ptr [rbp + 0x1d0]
0x14013e496: mov dword ptr [rcx], edx
0x14013e498: inc dword ptr [rax + 0xe0]
0x14013e49e: mov dword ptr [rcx], edx
0x14013e4a0: cmp byte ptr [rax + 0xa0], 0xff
0x14013e4a7: je 0x14013e4b6
0x14013e4a9: mov rcx, qword ptr [rbp + 0x1a0]
0x14013e4b0: call 0x140023810
0x14013e4b5: nop
0x14013e4b6: movdqa xmm0, xmmword ptr [rbp + 0x130]
0x14013e4be: movaps xmm1, xmmword ptr [rbp + 0x140]
0x14013e4c5: mov rax, qword ptr [rbp + 0x1a0]
0x14013e4cc: jmp 0x14013e8a3
0x14013e4d1: mov ecx, dword ptr [rax]
0x14013e4d3: mov edx, 0x64616572
0x14013e4d8: xor ecx, edx
0x14013e4da: movzx edx, byte ptr [rax + 4]
0x14013e4de: xor edx, 0x79
0x14013e4e1: or edx, ecx
0x14013e4e3: je 0x14013e613
0x14013e4e9: mov ecx, dword ptr [rax]
0x14013e4eb: mov edx, 0x72617473
0x14013e4f0: xor ecx, edx
0x14013e4f2: movzx eax, byte ptr [rax + 4]
0x14013e4f6: xor eax, 0x74
0x14013e4f9: or eax, ecx
0x14013e4fb: jne 0x14013ed30
0x14013e501: mov rax, qword ptr [rbp + 0x1b0]
0x14013e508: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e50e: mov dword ptr [rax], ecx
0x14013e510: mov rax, qword ptr [rbp + 0x1c0]
0x14013e517: mov byte ptr [rax + 0xe9], 1
0x14013e51e: jmp 0x14013ed30
0x14013e523: mov rcx, qword ptr [rax]
0x14013e526: movabs rdx, 0x72617473706f6f63
0x14013e530: xor rcx, rdx
0x14013e533: movzx eax, byte ptr [rax + 8]
0x14013e537: xor rax, 0x74
0x14013e53b: or rax, rcx
0x14013e53e: jne 0x14013ed30
0x14013e544: cmp dword ptr [r13], 0
0x14013e549: jne 0x14013ed30
0x14013e54f: mov rax, qword ptr [rbp + 0xe0]
0x14013e556: mov ecx, dword ptr [rbp + 0x12c]
0x14013e55c: mov dword ptr [rax], ecx
0x14013e55e: movabs rax, 0xbf80000000000001
0x14013e568: mov qword ptr [r13], rax
0x14013e56c: jmp 0x14013ed30
0x14013e571: mov rax, qword ptr [rbp + 0x1b0]
0x14013e578: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e57e: mov dword ptr [rax], ecx
0x14013e580: mov rax, qword ptr [rbp + 0x1c0]
0x14013e587: mov byte ptr [rax + 0xea], 0
0x14013e58e: jmp 0x14013ed30
0x14013e593: mov rax, qword ptr [rbp + 0xe0]
0x14013e59a: mov ecx, dword ptr [rbp + 0x12c]
0x14013e5a0: mov dword ptr [rax], ecx
0x14013e5a2: mov byte ptr [r13 + 0xe], 1
0x14013e5a7: jmp 0x14013ed30
0x14013e5ac: mov rax, qword ptr [rbp + 0x1b0]
0x14013e5b3: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e5b9: mov dword ptr [rax], ecx
0x14013e5bb: mov rax, qword ptr [rbp + 0x198]
0x14013e5c2: cmp byte ptr [rax], 0xff
0x14013e5c5: je 0x14013e5d4
0x14013e5c7: mov rcx, qword ptr [rbp + 0x198]
0x14013e5ce: call 0x140023810
0x14013e5d3: nop
0x14013e5d4: movdqa xmm0, xmmword ptr [rbp + 0x130]
0x14013e5dc: movaps xmm1, xmmword ptr [rbp + 0x140]
0x14013e5e3: mov rax, qword ptr [rbp + 0x198]
0x14013e5ea: movups xmmword ptr [rax + 0x10], xmm1
0x14013e5ee: movdqu xmmword ptr [rax], xmm0
0x14013e5f2: mov rax, qword ptr [rbp + 0x1b0]
0x14013e5f9: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e5ff: mov dword ptr [rax], ecx
0x14013e601: mov rax, qword ptr [rbp + 0x1c0]
0x14013e608: inc dword ptr [rax + 0xe0]
0x14013e60e: jmp 0x14013ed3d
0x14013e613: mov rax, qword ptr [rbp + 0x1c0]
0x14013e61a: mov word ptr [rax + 0xe8], 1
0x14013e623: mov byte ptr [rax + 0xea], 0
0x14013e62a: mov rcx, qword ptr [rbp + 0x1b0]
0x14013e631: mov edx, dword ptr [rbp + 0x1d0]
0x14013e637: mov dword ptr [rcx], edx
0x14013e639: cmp byte ptr [rax + 0xa0], 0xff
0x14013e640: je 0x14013e64f
0x14013e642: mov rcx, qword ptr [rbp + 0x1a0]
0x14013e649: call 0x140023810
0x14013e64e: nop
0x14013e64f: mov rax, qword ptr [rbp + 0x1c0]
0x14013e656: mov byte ptr [rax + 0xa0], 0xff
0x14013e65d: mov rcx, qword ptr [rbp + 0x1b0]
0x14013e664: mov edx, dword ptr [rbp + 0x1d0]
0x14013e66a: mov dword ptr [rcx], edx
0x14013e66c: inc dword ptr [rax + 0xe4]
0x14013e672: mov dword ptr [rcx], edx
0x14013e674: cmp byte ptr [rax + 0x80], 0xff
0x14013e67b: je 0x14013e68a
0x14013e67d: mov rcx, qword ptr [rbp + 0x198]
0x14013e684: call 0x140023810
0x14013e689: nop
0x14013e68a: mov rax, qword ptr [rbp + 0x1c0]
0x14013e691: mov byte ptr [rax + 0x80], 0xff
0x14013e698: mov rcx, qword ptr [rbp + 0x1b0]
0x14013e69f: mov edx, dword ptr [rbp + 0x1d0]
0x14013e6a5: mov dword ptr [rcx], edx
0x14013e6a7: inc dword ptr [rax + 0xe0]
0x14013e6ad: mov dword ptr [rcx], edx
0x14013e6af: mov rcx, qword ptr [rax + 0x20]
0x14013e6b3: mov rdx, qword ptr [rax + 0x28]
0x14013e6b7: mov qword ptr [rbp + 0xf0], rdx
0x14013e6be: mov qword ptr [rax + 0x28], 0
0x14013e6c6: mov qword ptr [rbp + 0x98], rcx
0x14013e6cd: mov qword ptr [rbp + 0x180], 0
0x14013e6d8: nop dword ptr [rax + rax]
0x14013e6e0: mov rax, qword ptr [rbp + 0x180]
0x14013e6e7: cmp qword ptr [rbp + 0xf0], rax
0x14013e6ee: je 0x14013e709
0x14013e6f0: inc rax
0x14013e6f3: mov qword ptr [rbp + 0x180], rax
0x14013e6fa: lea rbx, [rcx + 0x20]
0x14013e6fe: call 0x140023810
0x14013e703: nop
0x14013e704: mov rcx, rbx
0x14013e707: jmp 0x14013e6e0
0x14013e709: mov rax, qword ptr [rbp + 0x1b0]
0x14013e710: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e716: mov dword ptr [rax], ecx
0x14013e718: mov rax, qword ptr [rbp + 0x1c0]
0x14013e71f: mov rcx, qword ptr [rax + 0x38]
0x14013e723: mov rdx, qword ptr [rax + 0x40]
0x14013e727: mov qword ptr [rbp + 0xf0], rdx
0x14013e72e: mov qword ptr [rax + 0x40], 0
0x14013e736: mov qword ptr [rbp + 0x98], rcx
0x14013e73d: mov qword ptr [rbp + 0x180], 0
0x14013e748: nop dword ptr [rax + rax]
0x14013e750: mov rax, qword ptr [rbp + 0x180]
0x14013e757: cmp qword ptr [rbp + 0xf0], rax
0x14013e75e: je 0x14013e779
0x14013e760: inc rax
0x14013e763: mov qword ptr [rbp + 0x180], rax
0x14013e76a: lea rbx, [rcx + 0x28]
0x14013e76e: call 0x140023810
0x14013e773: nop
0x14013e774: mov rcx, rbx
0x14013e777: jmp 0x14013e750
0x14013e779: mov byte ptr [r13 + 0xd], 0
0x14013e77e: mov dword ptr [r13], 0
0x14013e786: mov rax, qword ptr [rbp + 0xe0]
0x14013e78d: mov ecx, dword ptr [rbp + 0x12c]
0x14013e793: mov dword ptr [rax], ecx
0x14013e795: mov byte ptr [r13 + 0xe], 0
0x14013e79a: mov byte ptr [rbp + 0x1d7], 1
0x14013e7a1: mov edx, 7
0x14013e7a6: lea rcx, [rip + 0x5db6515]
0x14013e7ad: lea r8, [rbp + 0x130]
0x14013e7b4: call 0x142a769a0
0x14013e7b9: nop
0x14013e7ba: test rax, rax
0x14013e7bd: jne 0x14013e7c6
0x14013e7bf: mov rax, qword ptr [rip + 0x80aba4a]
0x14013e7c6: cmp byte ptr [rax], 0
0x14013e7c9: je 0x14013e7db
0x14013e7cb: mov rax, qword ptr [rbp + 0x118]
0x14013e7d2: cmp byte ptr [rax], 0xff
0x14013e7d5: jne 0x14013ed30
0x14013e7db: mov rax, qword ptr [rbp + 0x1b0]
0x14013e7e2: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e7e8: mov dword ptr [rax], ecx
0x14013e7ea: mov rax, qword ptr [rbp + 0x118]
0x14013e7f1: cmp byte ptr [rax], 0xff
0x14013e7f4: je 0x14013e803
0x14013e7f6: mov rcx, qword ptr [rbp + 0x118]
0x14013e7fd: call 0x140023810
0x14013e802: nop
0x14013e803: movdqa xmm0, xmmword ptr [rbp + 0x130]
0x14013e80b: movaps xmm1, xmmword ptr [rbp + 0x140]
0x14013e812: mov rax, qword ptr [rbp + 0x118]
0x14013e819: movups xmmword ptr [rax + 0x10], xmm1
0x14013e81d: movdqu xmmword ptr [rax], xmm0
0x14013e821: jmp 0x14013ed3d
0x14013e826: mov rax, qword ptr [rbp + 0x1b0]
0x14013e82d: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e833: mov dword ptr [rax], ecx
0x14013e835: mov r8, qword ptr [rbp + 0x1a0]
0x14013e83c: cmp byte ptr [r8], 0xff
0x14013e840: je 0x14013ed30
0x14013e846: movdqa xmm0, xmmword ptr [rbp + 0x130]
0x14013e84e: movaps xmm1, xmmword ptr [rbp + 0x140]
0x14013e855: movaps xmmword ptr [rbp + 0x160], xmm1
0x14013e85c: movdqa xmmword ptr [rbp + 0x150], xmm0
0x14013e864: mov byte ptr [rbp + 0x1ad], 1
0x14013e86b: mov edx, 6
0x14013e870: lea rcx, [rip + 0x5db643d]
0x14013e877: call 0x142a76aa0
0x14013e87c: nop
0x14013e87d: mov qword ptr [rbp + 0x180], rax
0x14013e884: mov rcx, rax
0x14013e887: call 0x140023810
0x14013e88c: nop
0x14013e88d: movdqa xmm0, xmmword ptr [rbp + 0x130]
0x14013e895: movaps xmm1, xmmword ptr [rbp + 0x140]
0x14013e89c: mov rax, qword ptr [rbp + 0x180]
0x14013e8a3: movups xmmword ptr [rax + 0x10], xmm1
0x14013e8a7: movdqu xmmword ptr [rax], xmm0
0x14013e8ab: mov rax, qword ptr [rbp + 0x1b0]
0x14013e8b2: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e8b8: mov dword ptr [rax], ecx
0x14013e8ba: mov rax, qword ptr [rbp + 0x1c0]
0x14013e8c1: inc dword ptr [rax + 0xe4]
0x14013e8c7: jmp 0x14013ed3d
0x14013e8cc: mov rax, qword ptr [rbp + 0xe0]
0x14013e8d3: mov ecx, dword ptr [rbp + 0x12c]
0x14013e8d9: mov dword ptr [rax], ecx
0x14013e8db: mov byte ptr [r13 + 0xf], 1
0x14013e8e0: jmp 0x14013ed30
0x14013e8e5: mov rax, qword ptr [rbp + 0x1b0]
0x14013e8ec: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e8f2: mov dword ptr [rax], ecx
0x14013e8f4: mov rax, qword ptr [rbp + 0x1a0]
0x14013e8fb: cmp byte ptr [rax], 0xff
0x14013e8fe: je 0x14013e90d
0x14013e900: mov rcx, qword ptr [rbp + 0x1a0]
0x14013e907: call 0x140023810
0x14013e90c: nop
0x14013e90d: mov rax, qword ptr [rbp + 0x1c0]
0x14013e914: mov byte ptr [rax + 0xa0], 0xff
0x14013e91b: mov rcx, qword ptr [rbp + 0x1b0]
0x14013e922: mov edx, dword ptr [rbp + 0x1d0]
0x14013e928: mov dword ptr [rcx], edx
0x14013e92a: inc dword ptr [rax + 0xe4]
0x14013e930: jmp 0x14013ed30
0x14013e935: mov rax, qword ptr [rbp + 0x1b0]
0x14013e93c: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e942: mov dword ptr [rax], ecx
0x14013e944: mov rax, qword ptr [rbp + 0x1c0]
0x14013e94b: mov byte ptr [rax + 0xea], 1
0x14013e952: jmp 0x14013ed30
0x14013e957: mov rax, qword ptr [rbp + 0x1b0]
0x14013e95e: mov ecx, dword ptr [rbp + 0x1d0]
0x14013e964: mov dword ptr [rax], ecx
0x14013e966: mov rax, qword ptr [rbp + 0x198]
0x14013e96d: cmp byte ptr [rax], 0xff
0x14013e970: je 0x14013e97f
0x14013e972: mov rcx, qword ptr [rbp + 0x198]
0x14013e979: call 0x140023810
0x14013e97e: nop
0x14013e97f: mov rax, qword ptr [rbp + 0x1c0]
0x14013e986: mov byte ptr [rax + 0x80], 0xff
0x14013e98d: mov rcx, qword ptr [rbp + 0x1b0]
0x14013e994: mov edx, dword ptr [rbp + 0x1d0]
0x14013e99a: mov dword ptr [rcx], edx
0x14013e99c: inc dword ptr [rax + 0xe0]
0x14013e9a2: jmp 0x14013ed30
0x14013e9a7: mov byte ptr [rbp + 0x1d7], 1
0x14013e9ae: lea rcx, [rbp + 0x158]
0x14013e9b5: lea rdx, [rbp + 0x138]
0x14013e9bc: call 0x1400ec990
0x14013e9c1: nop
0x14013e9c2: jmp 0x14013ebe5
0x14013e9c7: lea rax, [rbp + 0x138]
0x14013e9ce: movdqu xmm0, xmmword ptr [rax]
0x14013e9d2: lea rax, [rbp + 0x158]
0x14013e9d9: movdqu xmmword ptr [rax], xmm0
0x14013e9dd: jmp 0x14013ebe5
0x14013e9e2: mov byte ptr [rbp + 0x1d7], 1
0x14013e9e9: lea rcx, [rbp + 0x158]
0x14013e9f0: lea rdx, [rbp + 0x138]
0x14013e9f7: call 0x145ce7810
0x14013e9fc: nop
0x14013e9fd: jmp 0x14013ebe5
0x14013ea02: cmp qword ptr [rbp + 0x148], 0
0x14013ea0a: je 0x14013ebcf
0x14013ea10: mov rdx, qword ptr [rbp + 0x138]
0x14013ea17: test rdx, rdx
0x14013ea1a: je 0x14013ee6f
0x14013ea20: mov r8, qword ptr [rbp + 0x140]
0x14013ea27: mov byte ptr [rbp + 0x1d7], 1
0x14013ea2e: lea rcx, [rbp + 0x158]
0x14013ea35: call 0x140071b30
0x14013ea3a: nop
0x14013ea3b: jmp 0x14013ebe5
0x14013ea40: mov rax, qword ptr [rbp + 0x1b0]
0x14013ea47: mov ecx, dword ptr [rbp + 0x1d0]
0x14013ea4d: mov dword ptr [rax], ecx
0x14013ea4f: mov byte ptr [rbp + 0x1d7], 1
0x14013ea56: mov edx, 4
0x14013ea5b: lea rcx, [rip + 0x5db6258]
0x14013ea62: lea r8, [rbp + 0x130]
0x14013ea69: call 0x142a769a0
0x14013ea6e: nop
0x14013ea6f: test rax, rax
0x14013ea72: jne 0x14013ea7b
0x14013ea74: mov rax, qword ptr [rip + 0x80ab795]
0x14013ea7b: cmp byte ptr [rax], 3
0x14013ea7e: mov rdx, qword ptr [rbp + 0x108]
0x14013ea85: jne 0x14013eb81
0x14013ea8b: mov rcx, qword ptr [rax + 0x18]
0x14013ea8f: test rcx, rcx
0x14013ea92: js 0x14013ee21
0x14013ea98: mov qword ptr [rbp + 0x180], rcx
0x14013ea9f: je 0x14013eb81
0x14013eaa5: mov rbx, qword ptr [rax + 0x10]
0x14013eaa9: call 0x140002200
0x14013eaae: mov edx, 1
0x14013eab3: mov rcx, qword ptr [rbp + 0x180]
0x14013eaba: call 0x1400021c0
0x14013eabf: mov qword ptr [rbp + 0x108], rax
0x14013eac6: test rax, rax
0x14013eac9: je 0x14013ee93
0x14013eacf: mov rcx, qword ptr [rbp + 0x108]
0x14013ead6: mov rdx, rbx
0x14013ead9: mov r8, qword ptr [rbp + 0x180]
0x14013eae0: call 0x145d145fb
0x14013eae5: jmp 0x14013eb98
0x14013eaea: mov r15d, 1
0x14013eaf0: xor ebx, ebx
0x14013eaf2: mov qword ptr [rbp + 0x158], rbx
0x14013eaf9: mov qword ptr [rbp + 0x78], r15
0x14013eafd: mov qword ptr [rbp + 0x160], r15
0x14013eb04: mov qword ptr [rbp + 0x168], rbx
0x14013eb0b: mov byte ptr [rbp + 0x150], 3
0x14013eb12: mov byte ptr [rbp + 0x1ae], 1
0x14013eb19: mov edx, 8
0x14013eb1e: lea rcx, [rip + 0x5db6185]
0x14013eb25: mov r8, qword ptr [rbp + 0x1a0]
0x14013eb2c: call 0x142a76aa0
0x14013eb31: nop
0x14013eb32: mov qword ptr [rbp + 0x180], rax
0x14013eb39: mov rcx, rax
0x14013eb3c: call 0x140023810
0x14013eb41: nop
0x14013eb42: movdqu xmm0, xmmword ptr [rbp + 0x150]
0x14013eb4a: movups xmm1, xmmword ptr [rbp + 0x160]
0x14013eb51: mov rax, qword ptr [rbp + 0x180]
0x14013eb58: movups xmmword ptr [rax + 0x10], xmm1
0x14013eb5c: movdqu xmmword ptr [rax], xmm0
0x14013eb60: mov rax, qword ptr [rbp + 0x1b0]
0x14013eb67: mov ecx, dword ptr [rbp + 0x1d0]
0x14013eb6d: mov dword ptr [rax], ecx
0x14013eb6f: mov rax, qword ptr [rbp + 0x1c0]
0x14013eb76: inc dword ptr [rax + 0xe4]
0x14013eb7c: jmp 0x14013ed30
0x14013eb81: mov eax, 1
0x14013eb86: mov qword ptr [rbp + 0x108], rax
0x14013eb8d: mov qword ptr [rbp + 0x180], 0
0x14013eb98: mov edx, 4
0x14013eb9d: lea rcx, [rip + 0x5db611a]
0x14013eba4: lea r8, [rbp + 0x130]
0x14013ebab: call 0x142a769a0
0x14013ebb0: nop
0x14013ebb1: test rax, rax
0x14013ebb4: jne 0x14013ebbd
0x14013ebb6: mov rax, qword ptr [rip + 0x80ab653]
0x14013ebbd: cmp byte ptr [rax], 1
0x14013ebc0: jne 0x14013ecc7
0x14013ebc6: movzx ebx, byte ptr [rax + 1]
0x14013ebca: jmp 0x14013ecc9
0x14013ebcf: mov qword ptr [rbp + 0x158], 0
0x14013ebda: mov qword ptr [rbp + 0x168], 0
0x14013ebe5: mov byte ptr [rbp + 0x150], bl
0x14013ebeb: mov rax, qword ptr [rbp + 0x90]
0x14013ebf2: mov rbx, qword ptr [rax]
0x14013ebf5: mov rax, qword ptr [rbp + 0x100]
0x14013ebfc: cmp rbx, qword ptr [rax]
0x14013ebff: jne 0x14013ec0e
0x14013ec01: mov rcx, qword ptr [rbp + 0x100]
0x14013ec08: call 0x145d150f0
0x14013ec0d: nop
0x14013ec0e: mov rdx, qword ptr [rbp + 0x1c0]
0x14013ec15: mov rax, qword ptr [rdx + 0x20]
0x14013ec19: mov rcx, rbx
0x14013ec1c: shl rcx, 5
0x14013ec20: movups xmm0, xmmword ptr [rbp + 0x150]
0x14013ec27: movups xmm1, xmmword ptr [rbp + 0x160]
0x14013ec2e: movups xmmword ptr [rax + rcx + 0x10], xmm1
0x14013ec33: movups xmmword ptr [rax + rcx], xmm0
0x14013ec37: inc rbx
0x14013ec3a: mov qword ptr [rdx + 0x28], rbx
0x14013ec3e: mov rax, qword ptr [rbp + 0x1b0]
0x14013ec45: mov ecx, dword ptr [rbp + 0x1d0]
0x14013ec4b: mov dword ptr [rax], ecx
0x14013ec4d: movdqa xmm0, xmmword ptr [rbp + 0x130]
0x14013ec55: movaps xmm1, xmmword ptr [rbp + 0x140]
0x14013ec5c: movaps xmmword ptr [rbp + 0x160], xmm1
0x14013ec63: movdqa xmmword ptr [rbp + 0x150], xmm0
0x14013ec6b: movss dword ptr [rbp + 0x170], xmm6
0x14013ec73: mov rbx, qword ptr [rdx + 0x40]
0x14013ec77: cmp rbx, qword ptr [rdx + 0x30]
0x14013ec7b: jne 0x14013ec8a
0x14013ec7d: mov rcx, qword ptr [rbp + 0xe8]
0x14013ec84: call 0x145d15160
0x14013ec89: nop
0x14013ec8a: mov r8, qword ptr [rbp + 0x1c0]
0x14013ec91: mov rax, qword ptr [r8 + 0x38]
0x14013ec95: lea rcx, [rbx + rbx*4]
0x14013ec99: mov rdx, qword ptr [rbp + 0x170]
0x14013eca0: mov qword ptr [rax + rcx*8 + 0x20], rdx
0x14013eca5: movdqa xmm0, xmmword ptr [rbp + 0x150]
0x14013ecad: movaps xmm1, xmmword ptr [rbp + 0x160]
0x14013ecb4: movups xmmword ptr [rax + rcx*8 + 0x10], xmm1
0x14013ecb9: movdqu xmmword ptr [rax + rcx*8], xmm0
0x14013ecbe: inc rbx
0x14013ecc1: mov qword ptr [r8 + 0x40], rbx
0x14013ecc5: jmp 0x14013ed3d
0x14013ecc7: xor ebx, ebx
0x14013ecc9: mov r13, qword ptr [rbp + 0x1c0]
0x14013ecd0: mov r15, qword ptr [r13 + 0x10]
0x14013ecd4: cmp r15, qword ptr [r13]
0x14013ecd8: jne 0x14013ece3
0x14013ecda: mov rcx, r13
0x14013ecdd: call 0x145d150f0
0x14013ece2: nop
0x14013ece3: mov rax, qword ptr [r13 + 8]
0x14013ece7: mov rcx, r15
0x14013ecea: shl rcx, 5
0x14013ecee: mov r8, qword ptr [rbp + 0x180]
0x14013ecf5: mov qword ptr [rax + rcx], r8
0x14013ecf9: mov rdx, qword ptr [rbp + 0x108]
0x14013ed00: mov qword ptr [rax + rcx + 8], rdx
0x14013ed05: mov qword ptr [rax + rcx + 0x10], r8
0x14013ed0a: mov byte ptr [rax + rcx + 0x18], bl
0x14013ed0e: movss dword ptr [rax + rcx + 0x1c], xmm6
0x14013ed14: inc r15
0x14013ed17: mov qword ptr [r13 + 0x10], r15
0x14013ed1b: mov r13, qword ptr [rbp + 0x120]
0x14013ed22: nop word ptr cs:[rax + rax]
0x14013ed30: lea rcx, [rbp + 0x130]
0x14013ed37: call 0x140023810
0x14013ed3c: nop
0x14013ed3d: mov rdx, qword ptr [rbp + 0x190]
0x14013ed44: test rdx, rdx
0x14013ed47: je 0x14013dbe4
0x14013ed4d: mov r8d, 1
0x14013ed53: mov rcx, qword ptr [rbp + 0x110]
0x14013ed5a: call 0x1400021d0
0x14013ed5f: jmp 0x14013dbe4
0x14013ed64: mov r15d, 1
0x14013ed6a: xor ebx, ebx
0x14013ed6c: mov r13, qword ptr [rbp + 0x120]
0x14013ed73: jmp 0x14013eaf2
0x14013ed78: cmp r14, r12
0x14013ed7b: je 0x14013edc2
0x14013ed7d: movabs rcx, 0xaaaaaaaaaaaaaaab
0x14013ed87: mov rax, rbx
0x14013ed8a: mul rcx
0x14013ed8d: mov rsi, rdx
0x14013ed90: shr rsi, 4
0x14013ed94: jmp 0x14013eda9
0x14013ed96: nop word ptr cs:[rax + rax]
0x14013eda0: add r15, 0x18
0x14013eda4: dec rsi
0x14013eda7: je 0x14013edc2
0x14013eda9: mov rdx, qword ptr [r15 - 8]
0x14013edad: test rdx, rdx
0x14013edb0: je 0x14013eda0
0x14013edb2: mov rcx, qword ptr [r15]
0x14013edb5: mov r8d, 1
0x14013edbb: call 0x1400021d0
0x14013edc0: jmp 0x14013eda0
0x14013edc2: mov rax, qword ptr [rbp]
0x14013edc6: test rax, rax
0x14013edc9: je 0x14013ede2
0x14013edcb: shl rax, 3
0x14013edcf: lea rdx, [rax + rax*2]
0x14013edd3: mov r8d, 8
0x14013edd9: mov rcx, qword ptr [rbp + 8]
0x14013eddd: call 0x1400021d0
0x14013ede2: movaps xmm6, xmmword ptr [rbp + 0x1e0]
0x14013ede9: movaps xmm7, xmmword ptr [rbp + 0x1f0]
0x14013edf0: movaps xmm8, xmmword ptr [rbp + 0x200]
0x14013edf8: add rsp, 0x298
0x14013edff: pop rbx
0x14013ee00: pop rdi
0x14013ee01: pop rsi
0x14013ee02: pop r12
0x14013ee04: pop r13
0x14013ee06: pop r14
0x14013ee08: pop r15
0x14013ee0a: pop rbp
0x14013ee0b: ret
0x14013ee0c: xor ecx, ecx
0x14013ee0e: mov byte ptr [rbp + 0x1d7], 1
0x14013ee15: mov rdx, qword ptr [rbp + 0x78]
0x14013ee19: call 0x145eb6fcb
0x14013ee1e: nop
0x14013ee1f: jmp 0x14013ee83
0x14013ee21: xor ecx, ecx
0x14013ee23: mov byte ptr [rbp + 0x1d7], 1
0x14013ee2a: call 0x145eb6fcb
0x14013ee2f: nop
0x14013ee30: jmp 0x14013ee83
0x14013ee32: call 0x145eb5730
0x14013ee37: jmp 0x14013d824
0x14013ee3c: call 0x145eb6400
0x14013ee41: mov rcx, qword ptr [rbp + 0x190]
0x14013ee48: test al, al
0x14013ee4a: jne 0x14013d818
0x14013ee50: mov byte ptr [rcx + 1], 1
0x14013ee54: jmp 0x14013d818
0x14013ee59: mov byte ptr [rbp + 0x1d7], 1
0x14013ee60: lea rcx, [rip + 0x5da5d19]
0x14013ee67: call 0x145eb72c0
0x14013ee6c: nop
0x14013ee6d: jmp 0x14013ee83
0x14013ee6f: mov byte ptr [rbp + 0x1d7], 1
0x14013ee76: lea rcx, [rip + 0x5da5d03]
0x14013ee7d: call 0x145eb72c0
0x14013ee82: nop
0x14013ee83: ud2
0x14013ee85: mov qword ptr [rbp + 0x78], rbx
0x14013ee89: mov ecx, 1
0x14013ee8e: jmp 0x14013ee0e
0x14013ee93: mov rdx, qword ptr [rbp + 0x180]
0x14013ee9a: mov ecx, 1
0x14013ee9f: jmp 0x14013ee23
