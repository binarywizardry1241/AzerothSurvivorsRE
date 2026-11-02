0x1402e5540: push r15
0x1402e5542: push r14
0x1402e5544: push r13
0x1402e5546: push r12
0x1402e5548: push rsi
0x1402e5549: push rdi
0x1402e554a: push rbp
0x1402e554b: push rbx
0x1402e554c: sub rsp, 0x1c8
0x1402e5553: movaps xmmword ptr [rsp + 0x1b0], xmm9
0x1402e555c: movaps xmmword ptr [rsp + 0x1a0], xmm8
0x1402e5565: movaps xmmword ptr [rsp + 0x190], xmm7
0x1402e556d: movaps xmmword ptr [rsp + 0x180], xmm6
0x1402e5575: mov rax, qword ptr [r9]
0x1402e5578: mov qword ptr [rsp + 0x170], rax
0x1402e5580: test rax, rax
0x1402e5583: je 0x1402e60e0
0x1402e5589: mov rax, qword ptr [rsp + 0x240]
0x1402e5591: mov rcx, qword ptr [rsp + 0x238]
0x1402e5599: mov r9, qword ptr [rsp + 0x230]
0x1402e55a1: mov r10, qword ptr [rdx]
0x1402e55a4: mov qword ptr [rsp + 0x108], r10
0x1402e55ac: mov r10, qword ptr [rdx + 8]
0x1402e55b0: mov qword ptr [rsp + 0x100], r10
0x1402e55b8: mov r10, qword ptr [rdx + 0x10]
0x1402e55bc: mov r11, qword ptr [rdx + 0x18]
0x1402e55c0: mov rdx, qword ptr [rdx + 0x20]
0x1402e55c4: mov qword ptr [rsp + 0xe8], rdx
0x1402e55cc: mov r13, qword ptr [r8]
0x1402e55cf: mov rdx, qword ptr [r9]
0x1402e55d2: mov qword ptr [rsp + 0x178], rdx
0x1402e55da: mov edx, dword ptr [rcx + 0x14]
0x1402e55dd: mov dword ptr [rsp + 0x6c], edx
0x1402e55e1: mov rdx, qword ptr [rax]
0x1402e55e4: mov qword ptr [rsp + 0x90], rdx
0x1402e55ec: mov rax, qword ptr [rax + 8]
0x1402e55f0: mov qword ptr [rsp + 0xe0], rax
0x1402e55f8: mov rdx, qword ptr [rcx]
0x1402e55fb: mov rbp, qword ptr [rcx + 8]
0x1402e55ff: mov r14, qword ptr [rdx + 0xf8]
0x1402e5606: mov rax, qword ptr [rdx + 0x100]
0x1402e560d: test r10, r10
0x1402e5610: mov qword ptr [rsp + 0xf8], r10
0x1402e5618: mov qword ptr [rsp + 0xf0], r11
0x1402e5620: cmove r10, r11
0x1402e5624: mov qword ptr [rsp + 0xd0], r10
0x1402e562c: mov r11, rdx
0x1402e562f: lea r12, [r14 + rax*4]
0x1402e5633: xorps xmm6, xmm6
0x1402e5636: movss xmm7, dword ptr [rip + 0x5f921ae]
0x1402e563e: movss xmm8, dword ptr [rip + 0x5f4daed]
0x1402e5647: movzx r15d, byte ptr [rdx + 0x108]
0x1402e564f: mov edi, 8
0x1402e5654: mov eax, 0
0x1402e5659: mov qword ptr [rsp + 0x80], rax
0x1402e5661: mov eax, 0
0x1402e5666: mov qword ptr [rsp + 0x88], rax
0x1402e566e: mov dword ptr [rsp + 0x38], 0
0x1402e5676: mov eax, 0
0x1402e567b: mov qword ptr [rsp + 0x48], rax
0x1402e5680: mov r9d, 8
0x1402e5686: mov ebx, 0
0x1402e568b: mov edx, 0
0x1402e5690: mov esi, 0
0x1402e5695: mov byte ptr [rsp + 0x36], r15b
0x1402e569a: test r15b, r15b
0x1402e569d: je 0x1402e56c7
0x1402e569f: jmp 0x1402e59d2
0x1402e56a4: nop word ptr cs:[rax + rax]
0x1402e56b0: mov edx, r15d
0x1402e56b3: mov ecx, esi
0x1402e56b5: shl rcx, 4
0x1402e56b9: inc esi
0x1402e56bb: mov rax, qword ptr [rdi + rcx]
0x1402e56bf: test eax, eax
0x1402e56c1: jne 0x1402e58be
0x1402e56c7: mov r15d, edx
0x1402e56ca: cmp esi, edx
0x1402e56cc: jne 0x1402e56b0
0x1402e56ce: nop 
0x1402e56d0: cmp r14, r12
0x1402e56d3: je 0x1402e57a0
0x1402e56d9: mov eax, dword ptr [r14]
0x1402e56dc: add r14, 4
0x1402e56e0: mov rcx, qword ptr [rbp + 0x108]
0x1402e56e7: lea rdx, [rax + rax*4]
0x1402e56eb: shl rdx, 5
0x1402e56ef: mov rax, qword ptr [rcx + rdx + 0x58]
0x1402e56f4: test rax, rax
0x1402e56f7: je 0x1402e56d0
0x1402e56f9: mov r15, r10
0x1402e56fc: mov rdi, r9
0x1402e56ff: add rcx, rdx
0x1402e5702: mov edx, dword ptr [rcx + 0x94]
0x1402e5708: mov r8, qword ptr [rbp + 0x1a8]
0x1402e570f: lea r10, [rdx + rdx*8]
0x1402e5713: mov r9, qword ptr [r8 + r10*8 + 0x40]
0x1402e5718: mov rdx, qword ptr [r8 + r10*8 + 0x18]
0x1402e571d: mov r8, qword ptr [r8 + r10*8 + 0x38]
0x1402e5722: mov r10, qword ptr [r11 + 0x118]
0x1402e5729: cmp r10, qword ptr [rcx + 0x88]
0x1402e5730: jae 0x1402e57ef
0x1402e5736: mov rsi, r11
0x1402e5739: mov r11, qword ptr [rcx + 0x80]
0x1402e5740: cmp qword ptr [r11 + r10*8], 0
0x1402e5745: je 0x1402e581c
0x1402e574b: mov r11b, 1
0x1402e574e: mov dword ptr [rsp + 0x38], r11d
0x1402e5753: cmp r10, r9
0x1402e5756: mov r11, rsi
0x1402e5759: jae 0x1402e5805
0x1402e575f: mov r10, qword ptr [r8 + r10*8]
0x1402e5763: test r10, r10
0x1402e5766: je 0x1402e5805
0x1402e576c: not r10
0x1402e576f: lea r10, [r10 + r10*2]
0x1402e5773: shl r10, 4
0x1402e5777: mov r10, qword ptr [rdx + r10 + 0x10]
0x1402e577c: mov qword ptr [rsp + 0x48], r10
0x1402e5781: mov r10, qword ptr [r11 + 0x128]
0x1402e5788: cmp r10, r9
0x1402e578b: jb 0x1402e5833
0x1402e5791: jmp 0x1402e584e
0x1402e5796: nop word ptr cs:[rax + rax]
0x1402e57a0: movabs rax, 0xffffffff00000000
0x1402e57aa: and r10, rax
0x1402e57ad: mov edx, r15d
0x1402e57b0: mov esi, r15d
0x1402e57b3: test r10d, r10d
0x1402e57b6: je 0x1402e60e0
0x1402e57bc: mov rax, qword ptr [rsp + 0x50]
0x1402e57c1: mov rax, qword ptr [rax]
0x1402e57c4: cmp rax, qword ptr [r13 + 0x198]
0x1402e57cb: jne 0x1402e56c7
0x1402e57d1: mov rax, qword ptr [rsp + 0x50]
0x1402e57d6: mov rcx, qword ptr [rax + 8]
0x1402e57da: mov rax, qword ptr [r13 + 0x190]
0x1402e57e1: cmp rcx, rax
0x1402e57e4: je 0x1402e56c7
0x1402e57ea: jmp 0x1402e5b80
0x1402e57ef: mov dword ptr [rsp + 0x38], 0
0x1402e57f7: mov r10, qword ptr [r11 + 0x128]
0x1402e57fe: cmp r10, r9
0x1402e5801: jb 0x1402e5833
0x1402e5803: jmp 0x1402e584e
0x1402e5805: mov qword ptr [rsp + 0x48], 0
0x1402e580e: mov r10, qword ptr [r11 + 0x128]
0x1402e5815: cmp r10, r9
0x1402e5818: jae 0x1402e584e
0x1402e581a: jmp 0x1402e5833
0x1402e581c: mov dword ptr [rsp + 0x38], 0
0x1402e5824: mov r11, rsi
0x1402e5827: mov r10, qword ptr [r11 + 0x128]
0x1402e582e: cmp r10, r9
0x1402e5831: jae 0x1402e584e
0x1402e5833: mov r9, qword ptr [r8 + r10*8]
0x1402e5837: test r9, r9
0x1402e583a: je 0x1402e584e
0x1402e583c: not r9
0x1402e583f: lea r9, [r9 + r9*2]
0x1402e5843: shl r9, 4
0x1402e5847: mov rbx, qword ptr [rdx + r9 + 0x10]
0x1402e584c: jmp 0x1402e5850
0x1402e584e: xor ebx, ebx
0x1402e5850: mov r10, r15
0x1402e5853: mov r9, qword ptr [r11 + 0x110]
0x1402e585a: mov r9, qword ptr [r8 + r9*8]
0x1402e585e: not r9
0x1402e5861: lea r9, [r9 + r9*2]
0x1402e5865: shl r9, 4
0x1402e5869: mov rsi, qword ptr [rdx + r9 + 0x10]
0x1402e586e: mov qword ptr [rsp + 0x88], rsi
0x1402e5876: mov r9, qword ptr [rdx + r9 + 0x28]
0x1402e587b: mov qword ptr [rsp + 0xb0], r9
0x1402e5883: mov r9, qword ptr [r11 + 0x120]
0x1402e588a: mov r8, qword ptr [r8 + r9*8]
0x1402e588e: not r8
0x1402e5891: lea r8, [r8 + r8*2]
0x1402e5895: shl r8, 4
0x1402e5899: mov r9, qword ptr [rdx + r8 + 0x10]
0x1402e589e: mov qword ptr [rsp + 0x80], r9
0x1402e58a6: mov r8, qword ptr [rdx + r8 + 0x28]
0x1402e58ab: mov rcx, qword ptr [rcx + 0x50]
0x1402e58af: xor esi, esi
0x1402e58b1: mov edx, eax
0x1402e58b3: mov r9, rdi
0x1402e58b6: mov rdi, rcx
0x1402e58b9: jmp 0x1402e56b3
0x1402e58be: add rcx, rdi
0x1402e58c1: mov ecx, dword ptr [rcx + 8]
0x1402e58c4: not ecx
0x1402e58c6: mov r15d, edx
0x1402e58c9: mov rdx, rcx
0x1402e58cc: shl rdx, 4
0x1402e58d0: add rdx, qword ptr [rsp + 0x88]
0x1402e58d8: mov qword ptr [rsp + 0x50], rdx
0x1402e58dd: mov rdx, qword ptr [rsp + 0xb0]
0x1402e58e5: lea rdx, [rdx + rcx*4]
0x1402e58e9: mov qword ptr [rsp + 0x120], rdx
0x1402e58f1: lea rdx, [rcx + rcx*2]
0x1402e58f5: mov r10, r8
0x1402e58f8: mov r8, qword ptr [rsp + 0x48]
0x1402e58fd: lea r8, [r8 + rdx*8]
0x1402e5901: test byte ptr [rsp + 0x38], 1
0x1402e5906: mov edx, 0
0x1402e590b: cmove r8, rdx
0x1402e590f: mov qword ptr [rsp + 0xa8], r8
0x1402e5917: mov r8, r10
0x1402e591a: mov rdx, qword ptr [rsp + 0x80]
0x1402e5922: lea rdx, [rdx + rcx*8]
0x1402e5926: mov qword ptr [rsp + 0xa0], rdx
0x1402e592e: lea rdx, [r10 + rcx*4]
0x1402e5932: mov qword ptr [rsp + 0x110], rdx
0x1402e593a: mov edx, r15d
0x1402e593d: imul rcx, rcx, 0x68
0x1402e5941: add rcx, rbx
0x1402e5944: mov qword ptr [rsp + 0x118], rcx
0x1402e594c: mov r10, rax
0x1402e594f: test r10d, r10d
0x1402e5952: jne 0x1402e57bc
0x1402e5958: jmp 0x1402e60e0
0x1402e595d: xor ebx, ebx
0x1402e595f: mov r10, rsi
0x1402e5962: mov r9, qword ptr [r11 + 0x110]
0x1402e5969: mov r9, qword ptr [r8 + r9*8]
0x1402e596d: not r9
0x1402e5970: lea r9, [r9 + r9*2]
0x1402e5974: shl r9, 4
0x1402e5978: mov rsi, qword ptr [rdx + r9 + 0x10]
0x1402e597d: mov qword ptr [rsp + 0x88], rsi
0x1402e5985: mov r9, qword ptr [rdx + r9 + 0x28]
0x1402e598a: mov qword ptr [rsp + 0xb0], r9
0x1402e5992: mov r9, qword ptr [r11 + 0x120]
0x1402e5999: mov r8, qword ptr [r8 + r9*8]
0x1402e599d: not r8
0x1402e59a0: lea r8, [r8 + r8*2]
0x1402e59a4: shl r8, 4
0x1402e59a8: mov r9, qword ptr [rdx + r8 + 0x10]
0x1402e59ad: mov qword ptr [rsp + 0x80], r9
0x1402e59b5: mov r8, qword ptr [rdx + r8 + 0x28]
0x1402e59ba: mov r9, qword ptr [rcx + 8]
0x1402e59be: xor esi, esi
0x1402e59c0: mov edx, eax
0x1402e59c2: mov ecx, esi
0x1402e59c4: inc esi
0x1402e59c6: mov rax, qword ptr [r9 + rcx*8]
0x1402e59ca: test eax, eax
0x1402e59cc: jne 0x1402e5ae5
0x1402e59d2: cmp esi, edx
0x1402e59d4: jne 0x1402e59c2
0x1402e59d6: mov esi, edx
0x1402e59d8: nop dword ptr [rax + rax]
0x1402e59e0: cmp r14, r12
0x1402e59e3: je 0x1402e5a60
0x1402e59e5: mov eax, dword ptr [r14]
0x1402e59e8: add r14, 4
0x1402e59ec: mov rcx, qword ptr [rbp + 0x1a8]
0x1402e59f3: lea rdx, [rax + rax*8]
0x1402e59f7: mov rax, qword ptr [rcx + rdx*8 + 0x10]
0x1402e59fc: test rax, rax
0x1402e59ff: je 0x1402e59e0
0x1402e5a01: mov rsi, r10
0x1402e5a04: lea rcx, [rcx + rdx*8]
0x1402e5a08: mov r9, qword ptr [rcx + 0x40]
0x1402e5a0c: mov rdx, qword ptr [rcx + 0x18]
0x1402e5a10: mov r8, qword ptr [rcx + 0x38]
0x1402e5a14: mov r10, qword ptr [r11 + 0x118]
0x1402e5a1b: cmp r10, r9
0x1402e5a1e: jae 0x1402e5aab
0x1402e5a24: mov r10, qword ptr [r8 + r10*8]
0x1402e5a28: test r10, r10
0x1402e5a2b: je 0x1402e5aab
0x1402e5a31: not r10
0x1402e5a34: lea r10, [r10 + r10*2]
0x1402e5a38: shl r10, 4
0x1402e5a3c: mov r10, qword ptr [rdx + r10 + 0x10]
0x1402e5a41: mov qword ptr [rsp + 0x48], r10
0x1402e5a46: mov r10b, 1
0x1402e5a49: mov dword ptr [rsp + 0x38], r10d
0x1402e5a4e: mov r10, qword ptr [r11 + 0x128]
0x1402e5a55: cmp r10, r9
0x1402e5a58: jae 0x1402e595d
0x1402e5a5e: jmp 0x1402e5ac3
0x1402e5a60: movabs rax, 0xffffffff00000000
0x1402e5a6a: and r10, rax
0x1402e5a6d: mov edx, esi
0x1402e5a6f: test r10d, r10d
0x1402e5a72: je 0x1402e60e0
0x1402e5a78: mov rax, qword ptr [rsp + 0x50]
0x1402e5a7d: mov rax, qword ptr [rax]
0x1402e5a80: cmp rax, qword ptr [r13 + 0x198]
0x1402e5a87: jne 0x1402e59d2
0x1402e5a8d: mov rax, qword ptr [rsp + 0x50]
0x1402e5a92: mov rcx, qword ptr [rax + 8]
0x1402e5a96: mov rax, qword ptr [r13 + 0x190]
0x1402e5a9d: cmp rcx, rax
0x1402e5aa0: je 0x1402e59d2
0x1402e5aa6: jmp 0x1402e5b80
0x1402e5aab: mov dword ptr [rsp + 0x38], 0
0x1402e5ab3: mov r10, qword ptr [r11 + 0x128]
0x1402e5aba: cmp r10, r9
0x1402e5abd: jae 0x1402e595d
0x1402e5ac3: mov r9, qword ptr [r8 + r10*8]
0x1402e5ac7: test r9, r9
0x1402e5aca: je 0x1402e595d
0x1402e5ad0: not r9
0x1402e5ad3: lea r9, [r9 + r9*2]
0x1402e5ad7: shl r9, 4
0x1402e5adb: mov rbx, qword ptr [rdx + r9 + 0x10]
0x1402e5ae0: jmp 0x1402e595f
0x1402e5ae5: mov r15d, edx
0x1402e5ae8: mov rdx, rcx
0x1402e5aeb: shl rdx, 4
0x1402e5aef: add rdx, qword ptr [rsp + 0x88]
0x1402e5af7: mov qword ptr [rsp + 0x50], rdx
0x1402e5afc: mov rdx, qword ptr [rsp + 0xb0]
0x1402e5b04: lea rdx, [rdx + rcx*4]
0x1402e5b08: mov qword ptr [rsp + 0x120], rdx
0x1402e5b10: lea rdx, [rcx + rcx*2]
0x1402e5b14: mov r10, r8
0x1402e5b17: mov r8, qword ptr [rsp + 0x48]
0x1402e5b1c: lea r8, [r8 + rdx*8]
0x1402e5b20: test byte ptr [rsp + 0x38], 1
0x1402e5b25: mov edx, 0
0x1402e5b2a: cmove r8, rdx
0x1402e5b2e: mov qword ptr [rsp + 0xa8], r8
0x1402e5b36: mov r8, r10
0x1402e5b39: mov rdx, qword ptr [rsp + 0x80]
0x1402e5b41: lea rdx, [rdx + rcx*8]
0x1402e5b45: mov qword ptr [rsp + 0xa0], rdx
0x1402e5b4d: lea rdx, [r10 + rcx*4]
0x1402e5b51: mov qword ptr [rsp + 0x110], rdx
0x1402e5b59: mov edx, r15d
0x1402e5b5c: imul rcx, rcx, 0x68
0x1402e5b60: add rcx, rbx
0x1402e5b63: mov qword ptr [rsp + 0x118], rcx
0x1402e5b6b: mov r10, rax
0x1402e5b6e: test r10d, r10d
0x1402e5b71: jne 0x1402e5a78
0x1402e5b77: jmp 0x1402e60e0
0x1402e5b7c: nop dword ptr [rax]
0x1402e5b80: mov dword ptr [rsp + 0x3c], edx
0x1402e5b84: mov r15, rax
0x1402e5b87: sub r15, rcx
0x1402e5b8a: mov rcx, qword ptr [r13 + 0x158]
0x1402e5b91: cmp rcx, r15
0x1402e5b94: mov qword ptr [rsp + 0x168], r15
0x1402e5b9c: mov qword ptr [rsp + 0x160], rcx
0x1402e5ba4: cmovb r15, rcx
0x1402e5ba8: mov ecx, dword ptr [rsp + 0x6c]
0x1402e5bac: mov rdx, qword ptr [rsp + 0x120]
0x1402e5bb4: mov dword ptr [rdx], ecx
0x1402e5bb6: mov rcx, qword ptr [rsp + 0x50]
0x1402e5bbb: mov qword ptr [rcx + 8], rax
0x1402e5bbf: mov rdx, qword ptr [r13 + 0x158]
0x1402e5bc6: mov rcx, rdx
0x1402e5bc9: mov qword ptr [rsp + 0x40], r15
0x1402e5bce: sub rcx, r15
0x1402e5bd1: jb 0x1402e6116
0x1402e5bd7: shl rcx, 6
0x1402e5bdb: mov dl, 1
0x1402e5bdd: mov qword ptr [rsp + 0x60], r13
0x1402e5be2: add rcx, qword ptr [r13 + 0x150]
0x1402e5be9: mov qword ptr [rsp + 0xd8], rcx
0x1402e5bf1: mov rax, qword ptr [rsp + 0x118]
0x1402e5bf9: movss xmm0, dword ptr [rax + 0x34]
0x1402e5bfe: ucomiss xmm6, xmm0
0x1402e5c01: mov qword ptr [rsp + 0xc8], r11
0x1402e5c09: mov qword ptr [rsp + 0xb8], rbp
0x1402e5c11: jae 0x1402e5c70
0x1402e5c13: movss xmm1, dword ptr [rax + 0x3c]
0x1402e5c18: subss xmm1, xmm0
0x1402e5c1c: maxss xmm1, xmm6
0x1402e5c20: mulss xmm1, dword ptr [rax + 0x64]
0x1402e5c25: mov rax, qword ptr [rsp + 0xa0]
0x1402e5c2d: movss xmm0, dword ptr [rax + 4]
0x1402e5c32: addss xmm1, xmm7
0x1402e5c36: ucomiss xmm0, xmm1
0x1402e5c39: jae 0x1402e5c70
0x1402e5c3b: mov rax, qword ptr [rsp + 0x40]
0x1402e5c40: shl rax, 6
0x1402e5c44: mov rcx, qword ptr [rsp + 0xd8]
0x1402e5c4c: nop dword ptr [rax]
0x1402e5c50: test rax, rax
0x1402e5c53: setne dl
0x1402e5c56: je 0x1402e5c70
0x1402e5c58: add rax, -0x40
0x1402e5c5c: cmp byte ptr [rcx + 0x38], 1
0x1402e5c60: lea rcx, [rcx + 0x40]
0x1402e5c64: jne 0x1402e5c50
0x1402e5c66: nop word ptr cs:[rax + rax]
0x1402e5c70: mov byte ptr [rsp + 0x37], dl
0x1402e5c74: mov qword ptr [rsp + 0x58], r8
0x1402e5c79: mov qword ptr [rsp + 0x70], rbx
0x1402e5c7e: mov qword ptr [rsp + 0xc0], rdi
0x1402e5c86: mov qword ptr [rsp + 0x78], r9
0x1402e5c8b: mov qword ptr [rsp + 0x98], r10
0x1402e5c93: mov qword ptr [rsp + 0x128], r10
0x1402e5c9b: mov rax, qword ptr [rsp + 0x108]
0x1402e5ca3: mov qword ptr [rsp + 0x130], rax
0x1402e5cab: mov rax, qword ptr [rsp + 0x100]
0x1402e5cb3: mov qword ptr [rsp + 0x138], rax
0x1402e5cbb: mov rax, qword ptr [rsp + 0xf8]
0x1402e5cc3: mov qword ptr [rsp + 0x140], rax
0x1402e5ccb: mov rax, qword ptr [rsp + 0xf0]
0x1402e5cd3: mov qword ptr [rsp + 0x148], rax
0x1402e5cdb: mov rax, qword ptr [rsp + 0xe8]
0x1402e5ce3: mov qword ptr [rsp + 0x150], rax
0x1402e5ceb: cmp qword ptr [rsp + 0x40], 0
0x1402e5cf1: mov rbp, qword ptr [rsp + 0x170]
0x1402e5cf9: mov r9, qword ptr [rsp + 0x60]
0x1402e5cfe: lea r15, [rsp + 0x128]
0x1402e5d06: mov r13, qword ptr [rsp + 0xd8]
0x1402e5d0e: je 0x1402e5d48
0x1402e5d10: mov rbx, qword ptr [rsp + 0x40]
0x1402e5d15: shl rbx, 6
0x1402e5d19: add r13, rbx
0x1402e5d1c: neg rbx
0x1402e5d1f: nop 
0x1402e5d20: lea rax, [rbx + r13]
0x1402e5d24: mov qword ptr [rsp + 0x20], rax
0x1402e5d29: mov rcx, r15
0x1402e5d2c: mov rdx, rbp
0x1402e5d2f: mov r8, qword ptr [rsp + 0x178]
0x1402e5d37: mov rdi, r9
0x1402e5d3a: call 0x1402c08e0
0x1402e5d3f: mov r9, rdi
0x1402e5d42: add rbx, 0x40
0x1402e5d46: jne 0x1402e5d20
0x1402e5d48: mov rax, qword ptr [rsp + 0xa8]
0x1402e5d50: test rax, rax
0x1402e5d53: je 0x1402e5d5b
0x1402e5d55: mov rax, qword ptr [rax + 0x10]
0x1402e5d59: jmp 0x1402e5d5d
0x1402e5d5b: xor eax, eax
0x1402e5d5d: mov r13, qword ptr [rsp + 0x60]
0x1402e5d62: mov r11, qword ptr [rsp + 0xc8]
0x1402e5d6a: mov r9, qword ptr [rsp + 0x78]
0x1402e5d6f: mov rdi, qword ptr [rsp + 0xc0]
0x1402e5d77: mov rbx, qword ptr [rsp + 0x70]
0x1402e5d7c: mov r8, qword ptr [rsp + 0x58]
0x1402e5d81: mov rbp, qword ptr [rsp + 0xb8]
0x1402e5d89: mov r10, qword ptr [rsp + 0x40]
0x1402e5d8e: add r10, rax
0x1402e5d91: mov rcx, qword ptr [r13 + 0x158]
0x1402e5d98: sub r10, rcx
0x1402e5d9b: mov edx, 0
0x1402e5da0: cmovae rdx, r10
0x1402e5da4: cmp rax, rdx
0x1402e5da7: cmovb rdx, rax
0x1402e5dab: test rdx, rdx
0x1402e5dae: mov r10, qword ptr [rsp + 0x98]
0x1402e5db6: jne 0x1402e5dd2
0x1402e5db8: cmp byte ptr [rsp + 0x37], 0
0x1402e5dbd: movzx r15d, byte ptr [rsp + 0x36]
0x1402e5dc3: mov edx, dword ptr [rsp + 0x3c]
0x1402e5dc7: je 0x1402e569a
0x1402e5dcd: jmp 0x1402e600b
0x1402e5dd2: mov r15, qword ptr [rsp + 0x168]
0x1402e5dda: mov rdx, qword ptr [rsp + 0x160]
0x1402e5de2: cmp rdx, r15
0x1402e5de5: cmovb r15, rdx
0x1402e5de9: add r15, rax
0x1402e5dec: sub r15, rcx
0x1402e5def: mov ecx, 0
0x1402e5df4: cmovb r15, rcx
0x1402e5df8: cmp rax, r15
0x1402e5dfb: cmovb r15, rax
0x1402e5dff: neg r15
0x1402e5e02: xorps xmm9, xmm9
0x1402e5e06: mov rax, qword ptr [rsp + 0xa8]
0x1402e5e0e: mov qword ptr [rsp + 0x40], rax
0x1402e5e13: xor r13d, r13d
0x1402e5e16: mov edx, dword ptr [rsp + 0x3c]
0x1402e5e1a: jmp 0x1402e5ebb
0x1402e5e1f: add r13, 8
0x1402e5e23: addss xmm9, xmm0
0x1402e5e28: mov rcx, qword ptr [rsp + 0xf8]
0x1402e5e30: mov qword ptr [rsp + 0x140], rcx
0x1402e5e38: mov rcx, qword ptr [rsp + 0xf0]
0x1402e5e40: mov qword ptr [rsp + 0x148], rcx
0x1402e5e48: mov rcx, qword ptr [rsp + 0xe8]
0x1402e5e50: mov qword ptr [rsp + 0x150], rcx
0x1402e5e58: mov qword ptr [rsp + 0x128], rax
0x1402e5e60: mov rax, qword ptr [rsp + 0x108]
0x1402e5e68: mov qword ptr [rsp + 0x130], rax
0x1402e5e70: mov rax, qword ptr [rsp + 0x100]
0x1402e5e78: mov qword ptr [rsp + 0x138], rax
0x1402e5e80: lea rcx, [rsp + 0x128]
0x1402e5e88: lea rdx, [rip + 0x5f932b9]
0x1402e5e8f: call 0x1450b3990
0x1402e5e94: inc r15
0x1402e5e97: mov r11, rbx
0x1402e5e9a: mov r9, qword ptr [rsp + 0x78]
0x1402e5e9f: mov r10, qword ptr [rsp + 0x98]
0x1402e5ea7: mov rbx, qword ptr [rsp + 0x70]
0x1402e5eac: mov r8, qword ptr [rsp + 0x58]
0x1402e5eb1: mov edx, dword ptr [rsp + 0x3c]
0x1402e5eb5: je 0x1402e5ffe
0x1402e5ebb: test r13, r13
0x1402e5ebe: je 0x1402e5eca
0x1402e5ec0: cmp r13, qword ptr [rsp + 0x158]
0x1402e5ec8: jne 0x1402e5f05
0x1402e5eca: mov rcx, qword ptr [rsp + 0x40]
0x1402e5ecf: test rcx, rcx
0x1402e5ed2: je 0x1402e5ffe
0x1402e5ed8: mov r13, qword ptr [rcx + 8]
0x1402e5edc: mov rax, qword ptr [rcx + 0x10]
0x1402e5ee0: lea rcx, [rax*8]
0x1402e5ee8: add rcx, r13
0x1402e5eeb: mov qword ptr [rsp + 0x158], rcx
0x1402e5ef3: test rax, rax
0x1402e5ef6: je 0x1402e5ffa
0x1402e5efc: mov qword ptr [rsp + 0x40], 0
0x1402e5f05: mov rbx, r11
0x1402e5f08: mov rax, qword ptr [r13]
0x1402e5f0c: mov edx, eax
0x1402e5f0e: not edx
0x1402e5f10: mov r8, rax
0x1402e5f13: shr r8, 0x20
0x1402e5f17: lea rcx, [rdx + rdx*2]
0x1402e5f1b: shl rcx, 3
0x1402e5f1f: mov r9, qword ptr [rsp + 0xe0]
0x1402e5f27: add rcx, qword ptr [r9 + 8]
0x1402e5f2b: cmp rdx, qword ptr [r9 + 0x10]
0x1402e5f2f: lea rdx, [rip + 0x5f92652]
0x1402e5f36: cmovae rcx, rdx
0x1402e5f3a: movaps xmm0, xmm8
0x1402e5f3e: cmp dword ptr [rcx + 0x10], r8d
0x1402e5f42: jne 0x1402e5e1f
0x1402e5f48: cmp dword ptr [rcx], 0
0x1402e5f4b: movaps xmm0, xmm8
0x1402e5f4f: je 0x1402e5e1f
0x1402e5f55: mov rdx, qword ptr [rcx + 4]
0x1402e5f59: mov r8, rdx
0x1402e5f5c: shr r8, 0x20
0x1402e5f60: movaps xmm0, xmm8
0x1402e5f64: mov r9, qword ptr [rsp + 0x90]
0x1402e5f6c: cmp qword ptr [r9 + 0x38], r8
0x1402e5f70: jbe 0x1402e5e1f
0x1402e5f76: mov r9, rdx
0x1402e5f79: shr r9, 0x26
0x1402e5f7d: mov r10, qword ptr [rsp + 0x90]
0x1402e5f85: mov r10, qword ptr [r10 + 0x28]
0x1402e5f89: mov r9, qword ptr [r10 + r9*8]
0x1402e5f8d: bt r9, r8
0x1402e5f91: movaps xmm0, xmm8
0x1402e5f95: jae 0x1402e5e1f
0x1402e5f9b: mov ecx, dword ptr [rcx + 0xc]
0x1402e5f9e: mov r8, qword ptr [rsp + 0xe0]
0x1402e5fa6: mov r8, qword ptr [r8 + 0x1a8]
0x1402e5fad: lea rcx, [rcx + rcx*8]
0x1402e5fb1: mov r9, qword ptr [rsp + 0x90]
0x1402e5fb9: mov r9, qword ptr [r9 + 0x110]
0x1402e5fc0: mov r10, qword ptr [r8 + rcx*8 + 0x18]
0x1402e5fc5: mov rcx, qword ptr [r8 + rcx*8 + 0x38]
0x1402e5fca: mov rcx, qword ptr [rcx + r9*8]
0x1402e5fce: not rcx
0x1402e5fd1: lea rcx, [rcx + rcx*2]
0x1402e5fd5: shl rcx, 4
0x1402e5fd9: mov rcx, qword ptr [r10 + rcx + 0x10]
0x1402e5fde: not edx
0x1402e5fe0: imul rdx, rdx, 0x68
0x1402e5fe4: movss xmm0, dword ptr [rcx + rdx + 0x34]
0x1402e5fea: mulss xmm0, dword ptr [rcx + rdx + 0x64]
0x1402e5ff0: addss xmm0, xmm8
0x1402e5ff5: jmp 0x1402e5e1f
0x1402e5ffa: mov edx, dword ptr [rsp + 0x3c]
0x1402e5ffe: cmp byte ptr [rsp + 0x37], 0
0x1402e6003: movzx r15d, byte ptr [rsp + 0x36]
0x1402e6009: je 0x1402e6053
0x1402e600b: mov rcx, qword ptr [rsp + 0xd0]
0x1402e6013: mov rax, qword ptr [rcx]
0x1402e6016: mov r13, qword ptr [rcx + 0x10]
0x1402e601a: sub rax, r13
0x1402e601d: cmp rax, 0x17
0x1402e6021: jbe 0x1402e6093
0x1402e6023: mov rax, qword ptr [rcx + 8]
0x1402e6027: lea rdx, [rip + 0xdd092]
0x1402e602e: mov qword ptr [rax + r13], rdx
0x1402e6032: mov qword ptr [rax + r13 + 8], r10
0x1402e6037: mov byte ptr [rax + r13 + 0x10], 0
0x1402e603d: add r13, 0x18
0x1402e6041: mov qword ptr [rcx + 0x10], r13
0x1402e6045: mov r13, qword ptr [rsp + 0x60]
0x1402e604a: mov edx, dword ptr [rsp + 0x3c]
0x1402e604e: jmp 0x1402e569a
0x1402e6053: ucomiss xmm9, xmm6
0x1402e6057: mov r13, qword ptr [rsp + 0x60]
0x1402e605c: jbe 0x1402e569a
0x1402e6062: mov rdx, qword ptr [rsp + 0xa0]
0x1402e606a: movss xmm0, dword ptr [rdx + 4]
0x1402e606f: subss xmm0, xmm9
0x1402e6074: maxss xmm0, xmm6
0x1402e6078: mov eax, dword ptr [rsp + 0x6c]
0x1402e607c: mov r8, qword ptr [rsp + 0x110]
0x1402e6084: mov dword ptr [r8], eax
0x1402e6087: mov r8, qword ptr [rsp + 0x58]
0x1402e608c: movss dword ptr [rdx + 4], xmm0
0x1402e6091: jmp 0x1402e604a
0x1402e6093: mov qword ptr [rsp + 0x20], 1
0x1402e609c: mov r8d, 0x18
0x1402e60a2: mov r9d, 1
0x1402e60a8: mov rdx, r13
0x1402e60ab: mov rbx, r11
0x1402e60ae: call 0x146061b30
0x1402e60b3: mov r8, qword ptr [rsp + 0x58]
0x1402e60b8: mov r10, qword ptr [rsp + 0x98]
0x1402e60c0: mov r9, qword ptr [rsp + 0x78]
0x1402e60c5: movzx r15d, byte ptr [rsp + 0x36]
0x1402e60cb: mov r11, rbx
0x1402e60ce: mov rbx, qword ptr [rsp + 0x70]
0x1402e60d3: mov rcx, qword ptr [rsp + 0xd0]
0x1402e60db: jmp 0x1402e6023
0x1402e60e0: movaps xmm6, xmmword ptr [rsp + 0x180]
0x1402e60e8: movaps xmm7, xmmword ptr [rsp + 0x190]
0x1402e60f0: movaps xmm8, xmmword ptr [rsp + 0x1a0]
0x1402e60f9: movaps xmm9, xmmword ptr [rsp + 0x1b0]
0x1402e6102: add rsp, 0x1c8
0x1402e6109: pop rbx
0x1402e610a: pop rbp
0x1402e610b: pop rdi
0x1402e610c: pop rsi
0x1402e610d: pop r12
0x1402e610f: pop r13
0x1402e6111: pop r14
0x1402e6113: pop r15
0x1402e6115: ret 
0x1402e6116: lea r9, [rip + 0x5f93043]
0x1402e611d: mov r8, rdx
0x1402e6120: call 0x146208f10
0x1402e6125: ud2 
