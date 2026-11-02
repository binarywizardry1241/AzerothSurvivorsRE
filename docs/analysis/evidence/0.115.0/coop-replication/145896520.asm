0x145896520: push rbp
0x145896521: push r15
0x145896523: push r14
0x145896525: push r13
0x145896527: push r12
0x145896529: push rsi
0x14589652a: push rdi
0x14589652b: push rbx
0x14589652c: sub rsp, 0x488
0x145896533: lea rbp, [rsp + 0x80]
0x14589653b: movapd xmmword ptr [rbp + 0x3f0], xmm6
0x145896543: mov qword ptr [rbp + 0x3e8], 0xfffffffffffffffe
0x14589654e: mov rsi, rcx
0x145896551: mov qword ptr [rbp + 0x3c8], rdx
0x145896558: mov rax, qword ptr [rdx]
0x14589655b: movabs rcx, 0x8000000000000000
0x145896565: xor rcx, rax
0x145896568: test rax, rax
0x14589656b: mov eax, 3
0x145896570: cmovs rax, rcx
0x145896574: mov qword ptr [rbp + 0x3b0], rax
0x14589657b: dec rax
0x14589657e: cmp rax, 0x11
0x145896582: ja 0x145897644
0x145896588: movapd xmm6, xmm2
0x14589658c: lea rcx, [rip + 0x17998ad]
0x145896593: movsxd rax, dword ptr [rcx + rax*4]
0x145896597: add rax, rcx
0x14589659a: jmp rax
0x14589659c: cmp dword ptr [rsi + 0xc58], 1
0x1458965a3: ja 0x1458965ac
0x1458965a5: mov byte ptr [rsi + 0xf48], 1
0x1458965ac: cmp qword ptr [rsi + 0x1590], -1
0x1458965b4: je 0x1458975fa
0x1458965ba: mov rax, qword ptr [rbp + 0x3c8]
0x1458965c1: movzx eax, byte ptr [rax + 9]
0x1458965c5: test al, al
0x1458965c7: je 0x1458975f2
0x1458965cd: movzx ecx, al
0x1458965d0: cmp al, 5
0x1458965d2: mov eax, 5
0x1458965d7: cmovb eax, ecx
0x1458965da: jmp 0x1458975f4
0x1458965df: mov rax, qword ptr [rsi + 0xc58]
0x1458965e6: cmp rax, 1
0x1458965ea: ja 0x145896613
0x1458965ec: test byte ptr [rsi + 0xf49], 1
0x1458965f3: je 0x145896613
0x1458965f5: mov byte ptr [rbp + 0x3e7], 1
0x1458965fc: mov byte ptr [rbp + 0x3e6], 1
0x145896603: mov rcx, rsi
0x145896606: call 0x1458948f0
0x14589660b: nop
0x14589660c: mov rax, qword ptr [rsi + 0xc58]
0x145896613: cmp eax, 1
0x145896616: ja 0x145896643
0x145896618: mov qword ptr [rsi + 0xf20], 0
0x145896623: lea rdi, [rsi + 0xe80]
0x14589662a: cmp qword ptr [rsi + 0xe80], -1
0x145896632: je 0x14589663c
0x145896634: mov rcx, rdi
0x145896637: call 0x145813250
0x14589663c: mov qword ptr [rdi], 0xffffffffffffffff
0x145896643: mov byte ptr [rbp + 0x3e7], 1
0x14589664a: mov byte ptr [rbp + 0x3e6], 1
0x145896651: mov rcx, rsi
0x145896654: call 0x145893fc0
0x145896659: nop
0x14589665a: mov byte ptr [rbp + 0x3e7], 1
0x145896661: mov byte ptr [rbp + 0x3e6], 1
0x145896668: mov qword ptr [rsp + 0x20], 0
0x145896671: lea rdx, [rip + 0x1796f68]
0x145896678: mov r8d, 6
0x14589667e: mov r9d, 1
0x145896684: mov rcx, rsi
0x145896687: call 0x145893140
0x14589668c: nop
0x14589668d: jmp 0x145897644
0x145896692: mov rax, qword ptr [rbp + 0x3c8]
0x145896699: mov rdx, qword ptr [rax + 8]
0x14589669d: mov rcx, qword ptr [rax + 0x10]
0x1458966a1: mov r15, qword ptr [rax + 0x20]
0x1458966a5: mov r12, qword ptr [rax + 0x28]
0x1458966a9: mov rbx, qword ptr [rax + 0x38]
0x1458966ad: mov r14, qword ptr [rax + 0x40]
0x1458966b1: mov rdi, qword ptr [rax + 0x50]
0x1458966b5: mov rax, qword ptr [rax + 0x58]
0x1458966b9: mov qword ptr [rbp + 0x3d8], rax
0x1458966c0: cmp dword ptr [rsi + 0xc58], 1
0x1458966c7: ja 0x145897389
0x1458966cd: mov r13, qword ptr [rsi + 0xf20]
0x1458966d4: test r13, r13
0x1458966d7: je 0x145897389
0x1458966dd: mov rax, qword ptr [rbp + 0x3c8]
0x1458966e4: lea rdx, [rax + 8]
0x1458966e8: mov bl, byte ptr [rsi + 0x11a0]
0x1458966ee: mov r14, qword ptr [rsi + 0xf28]
0x1458966f5: lea rdi, [rbp - 0x50]
0x1458966f9: mov r8d, 0x90
0x1458966ff: mov rcx, rdi
0x145896702: call 0x145d145fb
0x145896707: subsd xmm6, qword ptr [rsi + 0xf30]
0x14589670f: mov byte ptr [rbp + 0x3e7], 1
0x145896716: mov byte ptr [rbp + 0x3e6], 1
0x14589671d: movsd qword ptr [rsp + 0x28], xmm6
0x145896723: mov qword ptr [rsp + 0x20], r14
0x145896728: lea rcx, [rbp + 0x2e0]
0x14589672f: mov rdx, rdi
0x145896732: mov r8d, ebx
0x145896735: mov r9, r13
0x145896738: call 0x14584a9b0
0x14589673d: nop
0x14589673e: cmp qword ptr [rbp + 0x2e0], -1
0x145896746: je 0x1458976da
0x14589674c: lea rcx, [rbp - 0x50]
0x145896750: lea rdx, [rbp + 0x2e0]
0x145896757: mov r8d, 0x90
0x14589675d: call 0x145d145fb
0x145896762: cmp byte ptr [rbp + 0x35], 0
0x145896766: je 0x1458976f5
0x14589676c: mov bl, byte ptr [rbp + 0x38]
0x14589676f: lea rcx, [rbp + 0x2e8]
0x145896776: mov byte ptr [rbp + 0x3e5], 1
0x14589677d: lea rdx, [rbp - 0x50]
0x145896781: call 0x145ce7810
0x145896786: nop
0x145896787: mov r15, qword ptr [rbp + 0x2e8]
0x14589678e: mov r12, qword ptr [rbp + 0x2f0]
0x145896795: mov rdi, qword ptr [rbp + 0x2f8]
0x14589679c: jmp 0x1458976fc
0x1458967a1: mov rcx, qword ptr [rbp + 0x3c8]
0x1458967a8: mov rax, qword ptr [rcx + 0x18]
0x1458967ac: mov qword ptr [rbp + 0x2f0], rax
0x1458967b3: movups xmm0, xmmword ptr [rcx + 8]
0x1458967b7: movaps xmmword ptr [rbp + 0x2e0], xmm0
0x1458967be: lea rcx, [rbp + 0x2e0]
0x1458967c5: mov edx, 5
0x1458967ca: call 0x1459bf6f0
0x1458967cf: nop
0x1458967d0: mov r13, qword ptr [rbp + 0x2e8]
0x1458967d7: mov rax, qword ptr [rbp + 0x2f0]
0x1458967de: mov qword ptr [rbp + 0x3d0], rax
0x1458967e5: imul r12, rax, 0x98
0x1458967ec: add r12, r13
0x1458967ef: lea rbx, [rbp - 0x50]
0x1458967f3: mov qword ptr [rbp + 0x3d8], r13
0x1458967fa: jmp 0x145896822
0x1458967fc: nop dword ptr [rax]
0x145896800: mov rcx, qword ptr [r13 + 8]
0x145896804: mov r8d, 1
0x14589680a: call 0x1400021d0
0x14589680f: mov qword ptr [r13], r15
0x145896813: mov qword ptr [r13 + 8], r14
0x145896817: mov qword ptr [r13 + 0x10], rdi
0x14589681b: add r13, 0x98
0x145896822: cmp r13, r12
0x145896825: je 0x14589732c
0x14589682b: mov r14, qword ptr [r13 + 8]
0x14589682f: mov r15, qword ptr [r13 + 0x10]
0x145896833: mov rcx, r14
0x145896836: mov rdx, r15
0x145896839: call 0x145836f10
0x14589683e: nop
0x14589683f: cmp al, 0xff
0x145896841: je 0x145896880
0x145896843: call 0x140002200
0x145896848: mov ecx, 4
0x14589684d: mov edx, 1
0x145896852: call 0x1400021c0
0x145896857: test rax, rax
0x14589685a: je 0x1458978b0
0x145896860: mov r14, rax
0x145896863: mov dword ptr [rax], 0x6f726548
0x145896869: mov edi, 4
0x14589686e: mov r15d, 4
0x145896874: mov rdx, qword ptr [r13]
0x145896878: test rdx, rdx
0x14589687b: jne 0x145896800
0x14589687d: jmp 0x14589680f
0x14589687f: nop
0x145896880: mov rcx, r14
0x145896883: mov rdx, r15
0x145896886: call 0x1401edaa0
0x14589688b: nop
0x14589688c: mov r8, rdx
0x14589688f: mov rcx, rbx
0x145896892: mov rdx, rax
0x145896895: call 0x1458377a0
0x14589689a: nop
0x14589689b: mov r15, qword ptr [rbp - 0x50]
0x14589689f: cmp r15, -1
0x1458968a3: je 0x145896843
0x1458968a5: mov r14, qword ptr [rbp - 0x48]
0x1458968a9: mov rdi, qword ptr [rbp - 0x40]
0x1458968ad: mov rdx, qword ptr [r13]
0x1458968b1: test rdx, rdx
0x1458968b4: jne 0x145896800
0x1458968ba: jmp 0x14589680f
0x1458968bf: mov rax, qword ptr [rbp + 0x3c8]
0x1458968c6: mov rcx, qword ptr [rax + 8]
0x1458968ca: mov qword ptr [rbp + 0x3d0], rcx
0x1458968d1: mov rcx, qword ptr [rax + 0x10]
0x1458968d5: mov rdx, qword ptr [rax + 0x18]
0x1458968d9: mov qword ptr [rbp + 0x3c0], rcx
0x1458968e0: call 0x1458095e0
0x1458968e5: imul rax, rax, 0xf0
0x1458968ec: lea rcx, [rip + 0x142a415]
0x1458968f3: mov rbx, qword ptr [rax + rcx + 8]
0x1458968f8: mov r14, qword ptr [rax + rcx + 0x10]
0x1458968fd: cmp dword ptr [rsi + 0xc58], 1
0x145896904: ja 0x145896947
0x145896906: mov qword ptr [rsi + 0xf20], rbx
0x14589690d: mov qword ptr [rsi + 0xf28], r14
0x145896914: cmp qword ptr [rsi + 0xe80], -1
0x14589691c: je 0x14589692a
0x14589691e: lea rcx, [rsi + 0xe80]
0x145896925: call 0x145813250
0x14589692a: mov qword ptr [rsi + 0xe80], 0xffffffffffffffff
0x145896935: movsd qword ptr [rsi + 0xf30], xmm6
0x14589693d: xorps xmm0, xmm0
0x145896940: movups xmmword ptr [rsi + 0xf38], xmm0
0x145896947: mov byte ptr [rsi + 0x180a], 0
0x14589694e: xorps xmm0, xmm0
0x145896951: movups xmmword ptr [rsi + 0x1708], xmm0
0x145896958: movups xmmword ptr [rsi + 0x1718], xmm0
0x14589695f: movups xmmword ptr [rsi + 0x1728], xmm0
0x145896966: mov qword ptr [rsi + 0x1738], 0
0x145896971: mov byte ptr [rsi + 0x180e], 0xff
0x145896978: movups xmmword ptr [rsi + 0x17cc], xmm0
0x14589697f: mov dword ptr [rsi + 0x17dc], 0
0x145896989: mov rax, qword ptr [rsi + 0x17c0]
0x145896990: mov qword ptr [rsi + 0x1700], rax
0x145896997: lea rcx, [rsi + 0xf98]
0x14589699e: movzx edx, byte ptr [rsi + 0x11a0]
0x1458969a5: call 0x1458d4190
0x1458969aa: nop
0x1458969ab: movss dword ptr [rsi + 0x17c8], xmm0
0x1458969b3: mov rdi, qword ptr [rsi + 0x16f0]
0x1458969ba: mov rsi, qword ptr [rsi + 0x16f8]
0x1458969c1: call 0x140002200
0x1458969c6: mov ecx, 1
0x1458969cb: mov edx, 1
0x1458969d0: call 0x1400021c0
0x1458969d5: test rax, rax
0x1458969d8: je 0x1458978c2
0x1458969de: mov byte ptr [rax], 0x7b
0x1458969e1: mov qword ptr [rbp - 0x50], 1
0x1458969e9: mov qword ptr [rbp - 0x48], rax
0x1458969ed: mov qword ptr [rbp - 0x40], 1
0x1458969f5: mov byte ptr [rbp - 0x38], 1
0x1458969f9: lea rax, [rip + 0x1796c07]
0x145896a00: mov qword ptr [rsp + 0x20], rax
0x145896a05: mov qword ptr [rsp + 0x28], 9
0x145896a0e: lea r8, [rip + 0x1795cbe]
0x145896a15: lea rcx, [rbp + 0x2e0]
0x145896a1c: lea rdx, [rbp - 0x50]
0x145896a20: mov r9d, 4
0x145896a26: call 0x145858350
0x145896a2b: nop
0x145896a2c: mov qword ptr [rsp + 0x28], r14
0x145896a31: mov qword ptr [rsp + 0x20], rbx
0x145896a36: lea r8, [rip + 0x1795dd1]
0x145896a3d: lea rcx, [rbp - 0x50]
0x145896a41: lea rdx, [rbp + 0x2e0]
0x145896a48: mov r9d, 2
0x145896a4e: call 0x145858350
0x145896a53: nop
0x145896a54: mov rax, qword ptr [rbp - 0x50]
0x145896a58: mov r8, qword ptr [rbp - 0x40]
0x145896a5c: mov qword ptr [rbp + 0x3d8], rax
0x145896a63: cmp rax, r8
0x145896a66: je 0x145897878
0x145896a6c: mov rdx, qword ptr [rbp - 0x48]
0x145896a70: mov byte ptr [rdx + r8], 0x7d
0x145896a75: inc r8
0x145896a78: mov rcx, rdi
0x145896a7b: mov qword ptr [rbp + 0x3b8], rdx
0x145896a82: call qword ptr [rsi + 0x18]
0x145896a85: nop
0x145896a86: mov rdx, qword ptr [rbp + 0x3d8]
0x145896a8d: test rdx, rdx
0x145896a90: je 0x145896aa4
0x145896a92: mov r8d, 1
0x145896a98: mov rcx, qword ptr [rbp + 0x3b8]
0x145896a9f: call 0x1400021d0
0x145896aa4: mov rdx, qword ptr [rbp + 0x3d0]
0x145896aab: test rdx, rdx
0x145896aae: je 0x1458976da
0x145896ab4: mov r8d, 1
0x145896aba: mov rcx, qword ptr [rbp + 0x3c0]
0x145896ac1: jmp 0x1458976d5
0x145896ac6: mov rax, qword ptr [rbp + 0x3c8]
0x145896acd: mov r8, qword ptr [rax + 0x18]
0x145896ad1: cmp r8, 0x10000
0x145896ad8: ja 0x1458976b4
0x145896ade: mov rax, qword ptr [rbp + 0x3c8]
0x145896ae5: mov rcx, qword ptr [rax + 8]
0x145896ae9: mov qword ptr [rbp + 0x3d8], rcx
0x145896af0: mov rdx, qword ptr [rax + 0x10]
0x145896af4: mov rcx, qword ptr [rsi + 0x16f0]
0x145896afb: mov rax, qword ptr [rsi + 0x16f8]
0x145896b02: mov qword ptr [rbp + 0x3d0], rdx
0x145896b09: call qword ptr [rax + 0x20]
0x145896b0c: nop
0x145896b0d: cmp dword ptr [rsi + 0xc58], 1
0x145896b14: ja 0x145896b7b
0x145896b16: lea rdx, [rsi + 0xc58]
0x145896b1d: lea rcx, [rbp - 0x50]
0x145896b21: movapd xmm2, xmm6
0x145896b25: call 0x145816a30
0x145896b2a: nop
0x145896b2b: mov rax, qword ptr [rbp - 0x50]
0x145896b2f: cmp rax, -1
0x145896b33: je 0x145896b7b
0x145896b35: mov qword ptr [rbp + 0x3c0], rax
0x145896b3c: mov rdx, qword ptr [rbp - 0x48]
0x145896b40: mov r8, qword ptr [rbp - 0x40]
0x145896b44: mov rcx, qword ptr [rsi + 0x16f0]
0x145896b4b: mov rax, qword ptr [rsi + 0x16f8]
0x145896b52: mov qword ptr [rbp + 0x3b8], rdx
0x145896b59: call qword ptr [rax + 0x18]
0x145896b5c: nop
0x145896b5d: mov rdx, qword ptr [rbp + 0x3c0]
0x145896b64: test rdx, rdx
0x145896b67: je 0x145896b7b
0x145896b69: mov r8d, 1
0x145896b6f: mov rcx, qword ptr [rbp + 0x3b8]
0x145896b76: call 0x1400021d0
0x145896b7b: mov rdx, qword ptr [rbp + 0x3d8]
0x145896b82: test rdx, rdx
0x145896b85: je 0x1458976da
0x145896b8b: mov r8d, 1
0x145896b91: mov rcx, qword ptr [rbp + 0x3d0]
0x145896b98: jmp 0x14589757b
0x145896b9d: mov byte ptr [rbp + 0x3e7], 1
0x145896ba4: mov byte ptr [rbp + 0x3e6], 1
0x145896bab: mov rcx, rsi
0x145896bae: call 0x145892c40
0x145896bb3: nop
0x145896bb4: jmp 0x145897644
0x145896bb9: mov rax, qword ptr [rbp + 0x3c8]
0x145896bc0: mov rcx, qword ptr [rax + 8]
0x145896bc4: mov qword ptr [rbp + 0x3d0], rcx
0x145896bcb: mov rcx, qword ptr [rax + 0x10]
0x145896bcf: mov qword ptr [rbp + 0x3d8], rcx
0x145896bd6: mov rdi, qword ptr [rax + 0x18]
0x145896bda: lea rdx, [rsi + 0xc58]
0x145896be1: lea rcx, [rbp - 0x50]
0x145896be5: mov r8d, 0x2f8
0x145896beb: call 0x145d145fb
0x145896bf0: mov qword ptr [rsi + 0xc58], 2
0x145896bfb: mov rax, qword ptr [rbp - 0x50]
0x145896bff: cmp rax, 1
0x145896c03: ja 0x1458974d7
0x145896c09: mov rcx, qword ptr [rbp + 0x268]
0x145896c10: mov rax, qword ptr [rbp + 0x270]
0x145896c17: call qword ptr [rax + 0x30]
0x145896c1a: nop
0x145896c1b: lea rcx, [rbp - 0x50]
0x145896c1f: call 0x145871d50
0x145896c24: nop
0x145896c25: jmp 0x1458974e6
0x145896c2a: mov rcx, qword ptr [rbp + 0x3c8]
0x145896c31: mov rax, qword ptr [rcx + 0x18]
0x145896c35: mov qword ptr [rbp + 0x2f0], rax
0x145896c3c: movups xmm0, xmmword ptr [rcx + 8]
0x145896c40: movaps xmmword ptr [rbp + 0x2e0], xmm0
0x145896c47: mov rdi, qword ptr [rsi + 0x16f0]
0x145896c4e: mov rsi, qword ptr [rsi + 0x16f8]
0x145896c55: mov byte ptr [rbp + 0x3e7], 1
0x145896c5c: mov byte ptr [rbp + 0x3e6], 1
0x145896c63: lea rcx, [rbp - 0x50]
0x145896c67: lea rdx, [rbp + 0x2e0]
0x145896c6e: call 0x14584b0b0
0x145896c73: nop
0x145896c74: mov rbx, qword ptr [rbp - 0x48]
0x145896c78: mov r8, qword ptr [rbp - 0x40]
0x145896c7c: mov rcx, rdi
0x145896c7f: mov rdx, rbx
0x145896c82: mov qword ptr [rbp + 0x3d0], r8
0x145896c89: call qword ptr [rsi + 0x30]
0x145896c8c: nop
0x145896c8d: mov qword ptr [rbp + 0x3d8], 0
0x145896c98: mov qword ptr [rbp + 0x3c0], rbx
0x145896c9f: mov rcx, rbx
0x145896ca2: nop word ptr cs:[rax + rax]
0x145896cb0: mov rax, qword ptr [rbp + 0x3d8]
0x145896cb7: cmp qword ptr [rbp + 0x3d0], rax
0x145896cbe: je 0x1458972b5
0x145896cc4: inc rax
0x145896cc7: mov qword ptr [rbp + 0x3d8], rax
0x145896cce: lea rsi, [rcx + 0xb0]
0x145896cd5: call 0x14006bb30
0x145896cda: nop
0x145896cdb: mov rcx, rsi
0x145896cde: jmp 0x145896cb0
0x145896ce0: mov rax, qword ptr [rbp + 0x3c8]
0x145896ce7: mov rbx, qword ptr [rax + 0x10]
0x145896ceb: mov rax, qword ptr [rax + 0x18]
0x145896cef: mov rcx, qword ptr [rsi + 0x16f0]
0x145896cf6: mov r9, qword ptr [rsi + 0x16f8]
0x145896cfd: mov r8d, 0x80
0x145896d03: cmp rax, 0x7f
0x145896d07: ja 0x145896d15
0x145896d09: mov r8, rax
0x145896d0c: test rax, rax
0x145896d0f: je 0x145897870
0x145896d15: lea rdx, [rbx + 0x10]
0x145896d19: xor eax, eax
0x145896d1b: mov r10d, 0x7fffffff
0x145896d21: nop word ptr cs:[rax + rax]
0x145896d30: mov r11d, dword ptr [rdx - 0xc]
0x145896d34: and r11d, r10d
0x145896d37: cmp r11d, 0x7f800000
0x145896d3e: jge 0x145897816
0x145896d44: inc rax
0x145896d47: add rdx, 0xc
0x145896d4b: cmp r8, rax
0x145896d4e: jne 0x145896d30
0x145896d50: lea rax, [r8*4]
0x145896d58: lea r10, [rax + rax*2]
0x145896d5c: lea rax, [rax + rax*2]
0x145896d60: add rax, -0xc
0x145896d64: mov r11, rbx
0x145896d67: cmp rax, 0x30
0x145896d6b: jb 0x145896e17
0x145896d71: movabs rdx, 0xaaaaaaaaaaaaaaab
0x145896d7b: mul rdx
0x145896d7e: shr rdx, 3
0x145896d82: inc rdx
0x145896d85: mov eax, edx
0x145896d87: and eax, 3
0x145896d8a: mov r11d, 4
0x145896d90: cmovne r11, rax
0x145896d94: sub rdx, r11
0x145896d97: lea rax, [rdx + rdx*2]
0x145896d9b: lea r11, [rbx + rax*4]
0x145896d9f: lea rax, [rbx + 0x28]
0x145896da3: movaps xmm0, xmmword ptr [rip + 0x97d506]
0x145896daa: movaps xmm1, xmmword ptr [rip + 0x972e7f]
0x145896db1: nop word ptr cs:[rax + rax]
0x145896dc0: movss xmm2, dword ptr [rax - 0x24]
0x145896dc5: movss xmm3, dword ptr [rax - 0x18]
0x145896dca: unpcklps xmm2, xmm3
0x145896dcd: movss xmm3, dword ptr [rax - 0xc]
0x145896dd2: movss xmm4, dword ptr [rax]
0x145896dd6: unpcklps xmm3, xmm4
0x145896dd9: movlhps xmm2, xmm3
0x145896ddc: movaps xmm3, xmm0
0x145896ddf: maxps xmm3, xmm2
0x145896de2: movaps xmm2, xmm1
0x145896de5: minps xmm2, xmm3
0x145896de8: movaps xmm3, xmm2
0x145896deb: movshdup xmm4, xmm2
0x145896def: movaps xmm5, xmm2
0x145896df2: unpckhpd xmm5, xmm2
0x145896df6: shufps xmm2, xmm2, 0xff
0x145896dfa: movss dword ptr [rax - 0x24], xmm3
0x145896dff: movss dword ptr [rax - 0x18], xmm4
0x145896e04: movss dword ptr [rax - 0xc], xmm5
0x145896e09: movss dword ptr [rax], xmm2
0x145896e0d: add rax, 0x30
0x145896e11: add rdx, -4
0x145896e15: jne 0x145896dc0
0x145896e17: add r10, rbx
0x145896e1a: movss xmm0, dword ptr [rip + 0x64979e]
0x145896e22: movss xmm1, dword ptr [rip + 0x649562]
0x145896e2a: nop word ptr [rax + rax]
0x145896e30: movaps xmm2, xmm0
0x145896e33: maxss xmm2, dword ptr [r11 + 4]
0x145896e39: movaps xmm3, xmm1
0x145896e3c: minss xmm3, xmm2
0x145896e40: movss dword ptr [r11 + 4], xmm3
0x145896e46: add r11, 0xc
0x145896e4a: cmp r11, r10
0x145896e4d: jne 0x145896e30
0x145896e4f: mov rax, qword ptr [rbp + 0x3c8]
0x145896e56: mov rax, qword ptr [rax + 8]
0x145896e5a: mov qword ptr [rbp + 0x3d8], rax
0x145896e61: mov qword ptr [rbp + 0x3d0], rbx
0x145896e68: mov rdx, rbx
0x145896e6b: call qword ptr [r9 + 0x38]
0x145896e6f: nop
0x145896e70: mov rax, qword ptr [rbp + 0x3d8]
0x145896e77: test rax, rax
0x145896e7a: je 0x145897684
0x145896e80: shl rax, 2
0x145896e84: lea rdx, [rax + rax*2]
0x145896e88: mov r8d, 4
0x145896e8e: mov rcx, qword ptr [rbp + 0x3d0]
0x145896e95: call 0x1400021d0
0x145896e9a: jmp 0x145897684
0x145896e9f: mov rax, qword ptr [rbp + 0x3c8]
0x145896ea6: mov rcx, qword ptr [rax + 8]
0x145896eaa: mov qword ptr [rbp + 0x3b8], rcx
0x145896eb1: mov rdx, qword ptr [rax + 0x10]
0x145896eb5: mov r8, qword ptr [rax + 0x18]
0x145896eb9: lea rcx, [rbp - 0x50]
0x145896ebd: mov qword ptr [rbp + 0x390], rdx
0x145896ec4: call 0x145821360
0x145896ec9: nop
0x145896eca: mov r13, qword ptr [rbp - 0x50]
0x145896ece: xor eax, eax
0x145896ed0: cmp r13, -1
0x145896ed4: mov rcx, qword ptr [rbp - 0x40]
0x145896ed8: cmove rcx, rax
0x145896edc: cmove r13, rax
0x145896ee0: mov r12d, 8
0x145896ee6: cmovne r12, qword ptr [rbp - 0x48]
0x145896eeb: imul r14, rcx, 0x1e8
0x145896ef2: add r14, r12
0x145896ef5: mov qword ptr [rbp + 0x2e0], r12
0x145896efc: mov qword ptr [rbp + 0x2e8], r12
0x145896f03: mov qword ptr [rbp + 0x2f0], r13
0x145896f0a: mov qword ptr [rbp + 0x2f8], r14
0x145896f11: mov rdx, r12
0x145896f14: test rcx, rcx
0x145896f17: je 0x145896f96
0x145896f1d: lea rdi, [rbp - 0x48]
0x145896f21: lea rax, [r12 + 0x1e8]
0x145896f29: lea rbx, [rbp - 0x50]
0x145896f2d: nop dword ptr [rax]
0x145896f30: mov rdx, rax
0x145896f33: mov rax, qword ptr [rax - 0x1e8]
0x145896f3a: cmp rax, -1
0x145896f3e: je 0x145896f8f
0x145896f40: lea r15, [rdx - 0x1e8]
0x145896f47: mov qword ptr [rbp - 0x50], rax
0x145896f4b: mov qword ptr [rbp + 0x3c0], rdx
0x145896f52: lea rdx, [r15 + 8]
0x145896f56: mov r8d, 0x1e0
0x145896f5c: mov rcx, rdi
0x145896f5f: call 0x145d145fb
0x145896f64: nop
0x145896f65: mov rcx, rsi
0x145896f68: mov rdx, rbx
0x145896f6b: movapd xmm2, xmm6
0x145896f6f: call 0x145896520
0x145896f74: nop
0x145896f75: mov rdx, qword ptr [rbp + 0x3c0]
0x145896f7c: lea rax, [rdx + 0x1e8]
0x145896f83: add r15, 0x1e8
0x145896f8a: cmp r15, r14
0x145896f8d: jne 0x145896f30
0x145896f8f: mov qword ptr [rbp + 0x2e8], rdx
0x145896f96: mov qword ptr [rbp + 0x3a0], r13
0x145896f9d: mov qword ptr [rbp + 0x398], r12
0x145896fa4: sub r14, rdx
0x145896fa7: shr r14, 3
0x145896fab: movabs rax, 0x4fbcda3ac10c9715
0x145896fb5: imul rax, r14
0x145896fb9: mov qword ptr [rbp + 0x3d0], rax
0x145896fc0: mov qword ptr [rbp + 0x3d8], 0
0x145896fcb: mov qword ptr [rbp + 0x3c0], rdx
0x145896fd2: mov rcx, rdx
0x145896fd5: nop word ptr cs:[rax + rax]
0x145896fe0: mov rax, qword ptr [rbp + 0x3d8]
0x145896fe7: cmp qword ptr [rbp + 0x3d0], rax
0x145896fee: je 0x1458972e0
0x145896ff4: inc rax
0x145896ff7: mov qword ptr [rbp + 0x3d8], rax
0x145896ffe: lea rsi, [rcx + 0x1e8]
0x145897005: call 0x1458e3e00
0x14589700a: nop
0x14589700b: mov rcx, rsi
0x14589700e: jmp 0x145896fe0
0x145897010: mov rax, qword ptr [rbp + 0x3c8]
0x145897017: mov rdi, qword ptr [rax + 8]
0x14589701b: mov rbx, qword ptr [rax + 0x10]
0x14589701f: cmp dword ptr [rsi + 0xc58], 1
0x145897026: ja 0x14589708e
0x145897028: test byte ptr [rsi + 0xf49], 1
0x14589702f: je 0x14589708e
0x145897031: mov rax, qword ptr [rbp + 0x3c8]
0x145897038: movzx r14d, word ptr [rax + 0x20]
0x14589703d: mov r15, qword ptr [rax + 0x18]
0x145897041: mov ecx, r14d
0x145897044: mov rdx, r15
0x145897047: call 0x14584a880
0x14589704c: test al, al
0x14589704e: je 0x14589708e
0x145897050: mov rdx, qword ptr [rsi + 0xf90]
0x145897057: test rdx, rdx
0x14589705a: je 0x14589708e
0x14589705c: mov rcx, qword ptr [rsi + 0xf88]
0x145897063: imul rax, rdx, 0xb0
0x14589706a: xor r8d, r8d
0x14589706d: xor r9d, r9d
0x145897070: cmp byte ptr [rcx + r9 + 0xa8], 0
0x145897079: jne 0x1458977e8
0x14589707f: inc r8
0x145897082: add r9, 0xb0
0x145897089: cmp rax, r9
0x14589708c: jne 0x145897070
0x14589708e: test rdi, rdi
0x145897091: je 0x145897684
0x145897097: mov r8d, 1
0x14589709d: mov rcx, rbx
0x1458970a0: mov rdx, rdi
0x1458970a3: call 0x1400021d0
0x1458970a8: jmp 0x145897684
0x1458970ad: mov rax, qword ptr [rbp + 0x3c8]
0x1458970b4: mov rcx, qword ptr [rax + 0x10]
0x1458970b8: mov rdi, qword ptr [rax + 0x18]
0x1458970bc: mov byte ptr [rbp + 0x3e7], 1
0x1458970c3: mov byte ptr [rbp + 0x3e6], 1
0x1458970ca: mov qword ptr [rbp + 0x3d8], rcx
0x1458970d1: mov rdx, rdi
0x1458970d4: call 0x14584b400
0x1458970d9: nop
0x1458970da: test al, al
0x1458970dc: je 0x1458976b4
0x1458970e2: mov rax, qword ptr [rbp + 0x3c8]
0x1458970e9: mov rax, qword ptr [rax + 8]
0x1458970ed: mov qword ptr [rbp + 0x3d0], rax
0x1458970f4: cmp dword ptr [rsi + 0xc58], 1
0x1458970fb: ja 0x145897114
0x1458970fd: lea rcx, [rsi + 0xc58]
0x145897104: mov rdx, qword ptr [rbp + 0x3d8]
0x14589710b: mov r8, rdi
0x14589710e: call 0x145816a80
0x145897113: nop
0x145897114: mov rcx, qword ptr [rsi + 0x16f0]
0x14589711b: mov rax, qword ptr [rsi + 0x16f8]
0x145897122: mov rdx, qword ptr [rbp + 0x3d8]
0x145897129: mov r8, rdi
0x14589712c: call qword ptr [rax + 0x18]
0x14589712f: nop
0x145897130: jmp 0x145897508
0x145897135: mov rax, qword ptr [rbp + 0x3c8]
0x14589713c: mov rdi, qword ptr [rax + 8]
0x145897140: mov rbx, qword ptr [rax + 0x10]
0x145897144: mov r14, qword ptr [rax + 0x18]
0x145897148: cmp dword ptr [rsi + 0xc58], 1
0x14589714f: ja 0x145897527
0x145897155: cmp qword ptr [rsi + 0xf20], 0
0x14589715d: je 0x145897527
0x145897163: shl r14, 5
0x145897167: add r14, rbx
0x14589716a: mov qword ptr [rbp - 0x50], rbx
0x14589716e: mov qword ptr [rbp - 0x48], rbx
0x145897172: mov qword ptr [rbp - 0x40], rdi
0x145897176: mov qword ptr [rbp - 0x38], r14
0x14589717a: lea rax, [rbp + 0x3af]
0x145897181: mov qword ptr [rbp - 0x30], rax
0x145897185: mov qword ptr [rbp - 0x28], 0x20
0x14589718d: mov byte ptr [rbp + 0x3e7], 1
0x145897194: mov byte ptr [rbp + 0x3e6], 1
0x14589719b: lea rcx, [rbp + 0x378]
0x1458971a2: lea rdx, [rbp - 0x50]
0x1458971a6: call 0x1458e4ae0
0x1458971ab: nop
0x1458971ac: mov rax, qword ptr [rsi + 0xf40]
0x1458971b3: xor edi, edi
0x1458971b5: mov ecx, 0x190
0x1458971ba: sub rcx, rax
0x1458971bd: cmovae rdi, rcx
0x1458971c1: mov rcx, qword ptr [rbp + 0x388]
0x1458971c8: mov rbx, rcx
0x1458971cb: sub rbx, rdi
0x1458971ce: jae 0x14589759a
0x1458971d4: mov rdi, rcx
0x1458971d7: jmp 0x14589765c
0x1458971dc: mov rax, qword ptr [rbp + 0x3c8]
0x1458971e3: mov rdx, qword ptr [rax + 8]
0x1458971e7: mov rcx, qword ptr [rax + 0x10]
0x1458971eb: cmp dword ptr [rsi + 0xc58], 1
0x1458971f2: ja 0x1458973ed
0x1458971f8: mov r9, qword ptr [rsi + 0xf20]
0x1458971ff: test r9, r9
0x145897202: je 0x1458973ed
0x145897208: mov rax, qword ptr [rbp + 0x3c8]
0x14589720f: add rax, 8
0x145897213: movzx r8d, byte ptr [rsi + 0x11a0]
0x14589721b: mov bl, byte ptr [rsi + 0x11a1]
0x145897221: mov rcx, qword ptr [rsi + 0xf28]
0x145897228: mov rdx, qword ptr [rax + 0x10]
0x14589722c: mov qword ptr [rbp - 0x40], rdx
0x145897230: movups xmm0, xmmword ptr [rax]
0x145897233: movaps xmmword ptr [rbp - 0x50], xmm0
0x145897237: mov byte ptr [rbp + 0x3e7], 1
0x14589723e: mov byte ptr [rbp + 0x3e6], 1
0x145897245: mov qword ptr [rsp + 0x20], rcx
0x14589724a: lea rcx, [rbp + 0x2c8]
0x145897251: lea rdx, [rbp - 0x50]
0x145897255: call 0x14584b280
0x14589725a: nop
0x14589725b: mov rax, qword ptr [rsi + 0xf38]
0x145897262: xor ecx, ecx
0x145897264: mov edx, 0x40
0x145897269: sub rdx, rax
0x14589726c: cmovae rcx, rdx
0x145897270: mov rdx, qword ptr [rbp + 0x2d8]
0x145897277: cmp rcx, rdx
0x14589727a: cmovae rcx, rdx
0x14589727e: mov qword ptr [rbp + 0x2d8], rcx
0x145897285: add rcx, rax
0x145897288: mov qword ptr [rsi + 0xf38], rcx
0x14589728f: mov byte ptr [rbp + 0x3e7], 1
0x145897296: mov byte ptr [rbp + 0x3e6], 1
0x14589729d: lea rdx, [rbp + 0x2c8]
0x1458972a4: mov rcx, rsi
0x1458972a7: mov r8d, ebx
0x1458972aa: call 0x145872850
0x1458972af: nop
0x1458972b0: jmp 0x1458976da
0x1458972b5: mov rax, qword ptr [rbp - 0x50]
0x1458972b9: test rax, rax
0x1458972bc: je 0x145897684
0x1458972c2: imul rdx, rax, 0xb0
0x1458972c9: mov r8d, 8
0x1458972cf: mov rcx, qword ptr [rbp + 0x3c0]
0x1458972d6: call 0x1400021d0
0x1458972db: jmp 0x145897684
0x1458972e0: mov rax, qword ptr [rbp + 0x3a0]
0x1458972e7: test rax, rax
0x1458972ea: je 0x145897305
0x1458972ec: imul rdx, rax, 0x1e8
0x1458972f3: mov r8d, 8
0x1458972f9: mov rcx, qword ptr [rbp + 0x398]
0x145897300: call 0x1400021d0
0x145897305: mov rdx, qword ptr [rbp + 0x3b8]
0x14589730c: test rdx, rdx
0x14589730f: je 0x145897684
0x145897315: mov r8d, 1
0x14589731b: mov rcx, qword ptr [rbp + 0x390]
0x145897322: call 0x1400021d0
0x145897327: jmp 0x145897684
0x14589732c: mov rbx, qword ptr [rsi + 0x17c0]
0x145897333: mov ecx, 1
0x145897338: cmp qword ptr [rsi + 0x1590], -1
0x145897340: je 0x145897405
0x145897346: cmp qword ptr [rsi + 0x15c0], -1
0x14589734e: je 0x145897405
0x145897354: lea rdx, [rsi + 0x15c0]
0x14589735b: lea rcx, [rbp + 0x2b0]
0x145897362: call 0x145ce7810
0x145897367: nop
0x145897368: mov rax, qword ptr [rbp + 0x2b0]
0x14589736f: mov qword ptr [rbp + 0x3c0], rax
0x145897376: mov rcx, qword ptr [rbp + 0x2b8]
0x14589737d: mov rax, qword ptr [rbp + 0x2c0]
0x145897384: jmp 0x145897412
0x145897389: test rdx, rdx
0x14589738c: je 0x145897399
0x14589738e: mov r8d, 1
0x145897394: call 0x1400021d0
0x145897399: test r15, r15
0x14589739c: je 0x1458973b3
0x14589739e: shl r15, 3
0x1458973a2: mov r8d, 4
0x1458973a8: mov rcx, r12
0x1458973ab: mov rdx, r15
0x1458973ae: call 0x1400021d0
0x1458973b3: test rbx, rbx
0x1458973b6: je 0x1458973ce
0x1458973b8: shl rbx, 2
0x1458973bc: lea rdx, [rbx + rbx*2]
0x1458973c0: mov r8d, 4
0x1458973c6: mov rcx, r14
0x1458973c9: call 0x1400021d0
0x1458973ce: test rdi, rdi
0x1458973d1: je 0x1458976da
0x1458973d7: shl rdi, 2
0x1458973db: mov r8d, 4
0x1458973e1: mov rcx, qword ptr [rbp + 0x3d8]
0x1458973e8: jmp 0x145897578
0x1458973ed: test rdx, rdx
0x1458973f0: je 0x1458976da
0x1458973f6: shl rdx, 2
0x1458973fa: mov r8d, 4
0x145897400: jmp 0x14589757b
0x145897405: xor eax, eax
0x145897407: mov qword ptr [rbp + 0x3c0], 0
0x145897412: mov r14, qword ptr [rsi + 0x16f0]
0x145897419: mov rsi, qword ptr [rsi + 0x16f8]
0x145897420: mov qword ptr [rsp + 0x28], rax
0x145897425: mov qword ptr [rbp + 0x3b8], rcx
0x14589742c: mov qword ptr [rsp + 0x20], rcx
0x145897431: lea rcx, [rbp - 0x50]
0x145897435: mov rdx, qword ptr [rbp + 0x3d8]
0x14589743c: mov r8, qword ptr [rbp + 0x3d0]
0x145897443: mov r9, rbx
0x145897446: call 0x145822f80
0x14589744b: nop
0x14589744c: mov rdx, qword ptr [rbp - 0x48]
0x145897450: mov r8, qword ptr [rbp - 0x40]
0x145897454: mov rcx, r14
0x145897457: mov qword ptr [rbp + 0x3d0], rdx
0x14589745e: call qword ptr [rsi + 0x18]
0x145897461: nop
0x145897462: mov rdx, qword ptr [rbp - 0x50]
0x145897466: test rdx, rdx
0x145897469: je 0x14589747d
0x14589746b: mov r8d, 1
0x145897471: mov rcx, qword ptr [rbp + 0x3d0]
0x145897478: call 0x1400021d0
0x14589747d: mov rdx, qword ptr [rbp + 0x3c0]
0x145897484: test rdx, rdx
0x145897487: je 0x14589749c
0x145897489: mov r8d, 1
0x14589748f: mov rcx, qword ptr [rbp + 0x3b8]
0x145897496: call 0x1400021d0
0x14589749b: nop
0x14589749c: lea rcx, [rbp + 0x2e0]
0x1458974a3: call 0x1459d9720
0x1458974a8: nop
0x1458974a9: mov rax, qword ptr [rbp + 0x2e0]
0x1458974b0: test rax, rax
0x1458974b3: je 0x145897684
0x1458974b9: imul rdx, rax, 0x98
0x1458974c0: mov r8d, 8
0x1458974c6: mov rcx, qword ptr [rbp + 0x3d8]
0x1458974cd: call 0x1400021d0
0x1458974d2: jmp 0x145897684
0x1458974d7: cmp eax, 2
0x1458974da: je 0x1458974e6
0x1458974dc: lea rcx, [rbp - 0x48]
0x1458974e0: call 0x1458718c0
0x1458974e5: nop
0x1458974e6: mov qword ptr [rsp + 0x20], rdi
0x1458974eb: lea rdx, [rip + 0x179610e]
0x1458974f2: mov r8d, 7
0x1458974f8: mov rcx, rsi
0x1458974fb: mov r9, qword ptr [rbp + 0x3d8]
0x145897502: call 0x145893140
0x145897507: nop
0x145897508: mov rdx, qword ptr [rbp + 0x3d0]
0x14589750f: test rdx, rdx
0x145897512: je 0x1458976da
0x145897518: mov r8d, 1
0x14589751e: mov rcx, qword ptr [rbp + 0x3d8]
0x145897525: jmp 0x14589757b
0x145897527: test r14, r14
0x14589752a: je 0x145897562
0x14589752c: lea rsi, [rbx + 8]
0x145897530: jmp 0x145897549
0x145897532: nop word ptr cs:[rax + rax]
0x145897540: add rsi, 0x20
0x145897544: dec r14
0x145897547: je 0x145897562
0x145897549: mov rdx, qword ptr [rsi - 8]
0x14589754d: test rdx, rdx
0x145897550: je 0x145897540
0x145897552: mov rcx, qword ptr [rsi]
0x145897555: mov r8d, 1
0x14589755b: call 0x1400021d0
0x145897560: jmp 0x145897540
0x145897562: test rdi, rdi
0x145897565: je 0x1458976da
0x14589756b: shl rdi, 5
0x14589756f: mov r8d, 8
0x145897575: mov rcx, rbx
0x145897578: mov rdx, rdi
0x14589757b: movaps xmm6, xmmword ptr [rbp + 0x3f0]
0x145897582: add rsp, 0x488
0x145897589: pop rbx
0x14589758a: pop rdi
0x14589758b: pop rsi
0x14589758c: pop r12
0x14589758e: pop r13
0x145897590: pop r14
0x145897592: pop r15
0x145897594: pop rbp
0x145897595: jmp 0x1400021d0
0x14589759a: mov r14, qword ptr [rbp + 0x380]
0x1458975a1: mov qword ptr [rbp + 0x388], rdi
0x1458975a8: je 0x14589765c
0x1458975ae: cmp rax, 0x190
0x1458975b4: mov ecx, 0x190
0x1458975b9: cmovb rcx, rax
0x1458975bd: shl ecx, 5
0x1458975c0: sub r14, rcx
0x1458975c3: add r14, 0x3208
0x1458975ca: jmp 0x1458975d9
0x1458975cc: nop dword ptr [rax]
0x1458975d0: add r14, 0x20
0x1458975d4: dec rbx
0x1458975d7: je 0x145897655
0x1458975d9: mov rdx, qword ptr [r14 - 8]
0x1458975dd: test rdx, rdx
0x1458975e0: je 0x1458975d0
0x1458975e2: mov rcx, qword ptr [r14]
0x1458975e5: mov r8d, 1
0x1458975eb: call 0x1400021d0
0x1458975f0: jmp 0x1458975d0
0x1458975f2: mov al, 1
0x1458975f4: mov byte ptr [rsi + 0x16d1], al
0x1458975fa: mov byte ptr [rbp + 0x3e7], 1
0x145897601: mov byte ptr [rbp + 0x3e6], 1
0x145897608: mov rcx, rsi
0x14589760b: call 0x145893fc0
0x145897610: nop
0x145897611: mov byte ptr [rbp + 0x3e7], 1
0x145897618: mov byte ptr [rbp + 0x3e6], 1
0x14589761f: mov qword ptr [rsp + 0x20], 0
0x145897628: lea rdx, [rip + 0x1795fb1]
0x14589762f: mov r8d, 6
0x145897635: mov r9d, 1
0x14589763b: mov rcx, rsi
0x14589763e: call 0x145893140
0x145897643: nop
0x145897644: mov rcx, qword ptr [rbp + 0x3c8]
0x14589764b: call 0x1458712e0
0x145897650: jmp 0x1458976da
0x145897655: mov rax, qword ptr [rsi + 0xf40]
0x14589765c: add rax, rdi
0x14589765f: mov qword ptr [rsi + 0xf40], rax
0x145897666: mov byte ptr [rbp + 0x3e7], 1
0x14589766d: mov byte ptr [rbp + 0x3e6], 1
0x145897674: lea rdx, [rbp + 0x378]
0x14589767b: mov rcx, rsi
0x14589767e: call 0x14588fec0
0x145897683: nop
0x145897684: cmp qword ptr [rbp + 0x3b0], 0x12
0x14589768c: ja 0x145897644
0x14589768e: mov eax, 0x57c54
0x145897693: mov rcx, qword ptr [rbp + 0x3b0]
0x14589769a: bt rax, rcx
0x14589769e: jb 0x1458976da
0x1458976a0: cmp qword ptr [rbp + 0x3b0], 8
0x1458976a8: je 0x1458976b4
0x1458976aa: cmp qword ptr [rbp + 0x3b0], 9
0x1458976b2: jne 0x145897644
0x1458976b4: mov rax, qword ptr [rbp + 0x3c8]
0x1458976bb: mov rdx, qword ptr [rax + 8]
0x1458976bf: test rdx, rdx
0x1458976c2: je 0x1458976da
0x1458976c4: mov rax, qword ptr [rbp + 0x3c8]
0x1458976cb: mov rcx, qword ptr [rax + 0x10]
0x1458976cf: mov r8d, 1
0x1458976d5: call 0x1400021d0
0x1458976da: movaps xmm6, xmmword ptr [rbp + 0x3f0]
0x1458976e1: add rsp, 0x488
0x1458976e8: pop rbx
0x1458976e9: pop rdi
0x1458976ea: pop rsi
0x1458976eb: pop r12
0x1458976ed: pop r13
0x1458976ef: pop r14
0x1458976f1: pop r15
0x1458976f3: pop rbp
0x1458976f4: ret
0x1458976f5: mov r15, 0xffffffffffffffff
0x1458976fc: lea r14, [rsi + 0xe80]
0x145897703: cmp qword ptr [rsi + 0xe80], -1
0x14589770b: je 0x145897715
0x14589770d: mov rcx, r14
0x145897710: call 0x145813250
0x145897715: lea rdx, [rbp - 0x50]
0x145897719: mov r8d, 0x90
0x14589771f: mov rcx, r14
0x145897722: call 0x145d145fb
0x145897727: cmp r15, -1
0x14589772b: je 0x14589776a
0x14589772d: mov qword ptr [rbp + 0x3d8], r15
0x145897734: mov rcx, rsi
0x145897737: mov edx, ebx
0x145897739: mov qword ptr [rbp + 0x3d0], r12
0x145897740: mov r8, r12
0x145897743: mov r9, rdi
0x145897746: call 0x1458901a0
0x14589774b: nop
0x14589774c: mov rdx, qword ptr [rbp + 0x3d8]
0x145897753: test rdx, rdx
0x145897756: mov rcx, qword ptr [rbp + 0x3d0]
0x14589775d: je 0x14589776a
0x14589775f: mov r8d, 1
0x145897765: call 0x1400021d0
0x14589776a: mov byte ptr [rbp + 0x3e5], 0
0x145897771: mov rcx, rsi
0x145897774: call 0x145873710
0x145897779: nop
0x14589777a: cmp dword ptr [rsi + 0xc58], 1
0x145897781: ja 0x1458976da
0x145897787: cmp qword ptr [rsi + 0xe80], -1
0x14589778f: je 0x1458976da
0x145897795: movzx ecx, byte ptr [rsi + 0xf07]
0x14589779c: xor eax, eax
0x14589779e: cmp cl, 6
0x1458977a1: cmovb eax, ecx
0x1458977a4: cmp byte ptr [rsi + 0xf04], 0
0x1458977ab: je 0x1458976da
0x1458977b1: cmp byte ptr [rsi + 0x180e], al
0x1458977b7: je 0x1458976da
0x1458977bd: mov byte ptr [rsi + 0x180e], al
0x1458977c3: mov byte ptr [rbp + 0x3e5], 0
0x1458977ca: mov rcx, rsi
0x1458977cd: call 0x145889ce0
0x1458977d2: nop
0x1458977d3: mov byte ptr [rbp + 0x3e5], 0
0x1458977da: mov rcx, rsi
0x1458977dd: call 0x14588f7f0
0x1458977e2: nop
0x1458977e3: jmp 0x1458976da
0x1458977e8: mov qword ptr [rbp - 0x50], rdi
0x1458977ec: mov qword ptr [rbp - 0x48], rbx
0x1458977f0: mov qword ptr [rbp - 0x40], r15
0x1458977f4: mov word ptr [rbp - 0x38], r14w
0x1458977f9: mov byte ptr [rbp + 0x3e7], 1
0x145897800: mov byte ptr [rbp + 0x3e6], 1
0x145897807: lea r9, [rbp - 0x50]
0x14589780b: call 0x145877580
0x145897810: nop
0x145897811: jmp 0x145897684
0x145897816: lea r10, [rax + 1]
0x14589781a: cmp r10, r8
0x14589781d: jae 0x145897864
0x14589781f: mov r10, rax
0x145897822: not r10
0x145897825: add r10, r8
0x145897828: mov r8d, 0x7fffffff
0x14589782e: jmp 0x145897839
0x145897830: add rdx, 0xc
0x145897834: dec r10
0x145897837: je 0x145897864
0x145897839: mov r11d, dword ptr [rdx]
0x14589783c: and r11d, r8d
0x14589783f: cmp r11d, 0x7f7fffff
0x145897846: jg 0x145897830
0x145897848: lea r11, [rdx - 4]
0x14589784c: lea rsi, [rax + rax*2]
0x145897850: mov edi, dword ptr [r11 + 8]
0x145897854: mov dword ptr [rbx + rsi*4 + 8], edi
0x145897858: mov r11, qword ptr [r11]
0x14589785b: mov qword ptr [rbx + rsi*4], r11
0x14589785f: inc rax
0x145897862: jmp 0x145897830
0x145897864: mov r8, rax
0x145897867: test rax, rax
0x14589786a: jne 0x145896d50
0x145897870: xor r8d, r8d
0x145897873: jmp 0x145896e4f
0x145897878: mov qword ptr [rsp + 0x20], 1
0x145897881: lea rcx, [rbp - 0x50]
0x145897885: mov rdx, r8
0x145897888: mov r8d, 1
0x14589788e: mov r9d, 1
0x145897894: mov rbx, rdx
0x145897897: call 0x145d14a10
0x14589789c: nop
0x14589789d: mov rax, qword ptr [rbp - 0x50]
0x1458978a1: mov qword ptr [rbp + 0x3d8], rax
0x1458978a8: mov r8, rbx
0x1458978ab: jmp 0x145896a6c
0x1458978b0: mov ecx, 1
0x1458978b5: mov edx, 4
0x1458978ba: call 0x145eb6fcb
0x1458978bf: nop
0x1458978c0: jmp 0x1458978d2
0x1458978c2: mov ecx, 1
0x1458978c7: mov edx, 1
0x1458978cc: call 0x145eb6fcb
0x1458978d1: nop
0x1458978d2: ud2
