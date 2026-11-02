0x14582a230: push rbp
0x14582a231: push r15
0x14582a233: push r14
0x14582a235: push r13
0x14582a237: push r12
0x14582a239: push rsi
0x14582a23a: push rdi
0x14582a23b: push rbx
0x14582a23c: sub rsp, 0xe8
0x14582a243: lea rbp, [rsp + 0x80]
0x14582a24b: mov qword ptr [rbp + 0x60], 0xfffffffffffffffe
0x14582a253: mov rdi, rdx
0x14582a256: mov rsi, rcx
0x14582a259: lea r13, [rdx + 0x100]
0x14582a260: movzx ecx, byte ptr [rdx + 0xfa]
0x14582a267: test ecx, ecx
0x14582a269: je 0x14582a287
0x14582a26b: lea rax, [rip + 0x14a2282]
0x14582a272: cmp ecx, 4
0x14582a275: jne 0x14582a2cc
0x14582a277: mov byte ptr [rbp + 0x30], 1
0x14582a27b: mov rcx, qword ptr [r8]
0x14582a27e: movsxd rcx, dword ptr [rax + rcx*4]
0x14582a282: add rcx, rax
0x14582a285: jmp rcx
0x14582a287: mov rcx, qword ptr [r8]
0x14582a28a: lea rax, [rip + 0x14a221f]
0x14582a291: mov qword ptr [rbp + 0x20], rcx
0x14582a295: movsxd rcx, dword ptr [rax + rcx*4]
0x14582a299: add rcx, rax
0x14582a29c: mov qword ptr [rbp + 0x28], r8
0x14582a2a0: jmp rcx
0x14582a2a2: movups xmm0, xmmword ptr [r8 + 8]
0x14582a2a7: movups xmm1, xmmword ptr [r8 + 0x18]
0x14582a2ac: movaps xmmword ptr [rbp - 0x40], xmm1
0x14582a2b0: movaps xmmword ptr [rbp - 0x50], xmm0
0x14582a2b4: movsd xmm0, qword ptr [rip + 0x14a0fb4]
0x14582a2bc: mov bl, 1
0x14582a2be: xor r15d, r15d
0x14582a2c1: mov r14b, 1
0x14582a2c4: mov r12b, 1
0x14582a2c7: jmp 0x14582a436
0x14582a2cc: mov byte ptr [rbp + 0x30], 5
0x14582a2d0: mov byte ptr [rbp + 0x38], 0xe
0x14582a2d4: mov rcx, qword ptr [r8]
0x14582a2d7: movsxd rcx, dword ptr [rax + rcx*4]
0x14582a2db: add rcx, rax
0x14582a2de: jmp rcx
0x14582a2e0: mov rax, qword ptr [r8 + 0x28]
0x14582a2e4: mov qword ptr [rbp + 0x10], rax
0x14582a2e8: movups xmm0, xmmword ptr [r8 + 8]
0x14582a2ed: movups xmm1, xmmword ptr [r8 + 0x18]
0x14582a2f2: movaps xmmword ptr [rbp], xmm1
0x14582a2f6: movaps xmmword ptr [rbp - 0x10], xmm0
0x14582a2fa: mov byte ptr [rbp + 0x5f], 1
0x14582a2fe: mov byte ptr [rbp + 0x5e], 1
0x14582a302: mov byte ptr [rbp + 0x5d], 1
0x14582a306: mov byte ptr [rbp + 0x5c], 1
0x14582a30a: mov byte ptr [rbp + 0x5b], 1
0x14582a30e: mov byte ptr [rbp + 0x5a], 1
0x14582a312: lea rcx, [rbp + 0x30]
0x14582a316: lea r9, [rbp - 0x10]
0x14582a31a: mov rdx, rdi
0x14582a31d: mov r8, r13
0x14582a320: call 0x145827ba0
0x14582a325: nop
0x14582a326: jmp 0x14582a68e
0x14582a32b: movups xmm0, xmmword ptr [r8 + 8]
0x14582a330: movups xmm1, xmmword ptr [r8 + 0x18]
0x14582a335: movaps xmmword ptr [rbp - 0x40], xmm1
0x14582a339: movaps xmmword ptr [rbp - 0x50], xmm0
0x14582a33d: movsd xmm0, qword ptr [rip + 0x14a0f0b]
0x14582a345: mov r14b, 1
0x14582a348: xor ebx, ebx
0x14582a34a: jmp 0x14582a405
0x14582a34f: movups xmm0, xmmword ptr [r8 + 8]
0x14582a354: movups xmm1, xmmword ptr [r8 + 0x18]
0x14582a359: movaps xmmword ptr [rbp], xmm1
0x14582a35d: movaps xmmword ptr [rbp - 0x10], xmm0
0x14582a361: mov dword ptr [rbp + 0x10], 1
0x14582a368: mov word ptr [rbp + 0x14], 0x201
0x14582a36e: mov byte ptr [rbp + 0x17], 0
0x14582a372: mov byte ptr [rbp + 0x5f], 0
0x14582a376: mov byte ptr [rbp + 0x5e], 0
0x14582a37a: mov byte ptr [rbp + 0x5d], 1
0x14582a37e: mov byte ptr [rbp + 0x5c], 1
0x14582a382: mov byte ptr [rbp + 0x5b], 1
0x14582a386: mov byte ptr [rbp + 0x5a], 1
0x14582a38a: lea rdx, [rbp - 0x10]
0x14582a38e: mov rcx, rdi
0x14582a391: call 0x145a6b920
0x14582a396: nop
0x14582a397: mov byte ptr [rbp + 0x10], 2
0x14582a39b: mov byte ptr [rbp + 0x5f], 0
0x14582a39f: mov byte ptr [rbp + 0x5e], 0
0x14582a3a3: mov byte ptr [rbp + 0x5d], 1
0x14582a3a7: mov byte ptr [rbp + 0x5c], 1
0x14582a3ab: mov byte ptr [rbp + 0x5b], 1
0x14582a3af: mov byte ptr [rbp + 0x5a], 1
0x14582a3b3: lea rcx, [rbp - 0x30]
0x14582a3b7: lea r9, [rbp - 0x10]
0x14582a3bb: mov rdx, rdi
0x14582a3be: mov r8, r13
0x14582a3c1: call 0x145828250
0x14582a3c6: nop
0x14582a3c7: cmp byte ptr [rbp - 0x30], 0xff
0x14582a3cb: je 0x14582a556
0x14582a3d1: movups xmm0, xmmword ptr [rbp - 0x30]
0x14582a3d5: movups xmm1, xmmword ptr [rbp - 0x20]
0x14582a3d9: movaps xmmword ptr [rbp + 0x40], xmm1
0x14582a3dd: movaps xmmword ptr [rbp + 0x30], xmm0
0x14582a3e1: jmp 0x14582a68e
0x14582a3e6: movups xmm0, xmmword ptr [r8 + 8]
0x14582a3eb: movups xmm1, xmmword ptr [r8 + 0x18]
0x14582a3f0: movaps xmmword ptr [rbp - 0x40], xmm1
0x14582a3f4: movaps xmmword ptr [rbp - 0x50], xmm0
0x14582a3f8: movsd xmm0, qword ptr [rip + 0x14a0e60]
0x14582a400: mov bl, 1
0x14582a402: xor r14d, r14d
0x14582a405: mov r15b, 1
0x14582a408: mov r12b, 1
0x14582a40b: jmp 0x14582a436
0x14582a40d: movups xmm0, xmmword ptr [r8 + 8]
0x14582a412: movups xmm1, xmmword ptr [r8 + 0x18]
0x14582a417: movaps xmmword ptr [rbp - 0x40], xmm1
0x14582a41b: movaps xmmword ptr [rbp - 0x50], xmm0
0x14582a41f: movsd xmm0, qword ptr [r8 + 0x28]
0x14582a425: movsd xmm1, qword ptr [r8 + 0x30]
0x14582a42b: mov bl, 1
0x14582a42d: xor r12d, r12d
0x14582a430: mov r14b, 1
0x14582a433: mov r15b, 1
0x14582a436: movlhps xmm0, xmm1
0x14582a439: movaps xmm1, xmmword ptr [rbp - 0x50]
0x14582a43d: movaps xmm2, xmmword ptr [rbp - 0x40]
0x14582a441: movaps xmmword ptr [rbp], xmm2
0x14582a445: movaps xmmword ptr [rbp - 0x10], xmm1
0x14582a449: movaps xmmword ptr [rbp + 0x10], xmm0
0x14582a44d: mov byte ptr [rbp + 0x5f], 0
0x14582a451: mov byte ptr [rbp + 0x5e], 1
0x14582a455: mov byte ptr [rbp + 0x5d], bl
0x14582a458: mov byte ptr [rbp + 0x5c], r14b
0x14582a45c: mov byte ptr [rbp + 0x5b], r15b
0x14582a460: mov byte ptr [rbp + 0x5a], r12b
0x14582a464: lea rcx, [rbp - 0x30]
0x14582a468: lea r9, [rbp - 0x10]
0x14582a46c: mov rdx, rdi
0x14582a46f: mov r8, r13
0x14582a472: call 0x145828250
0x14582a477: nop
0x14582a478: movzx ecx, byte ptr [rbp - 0x30]
0x14582a47c: movzx eax, byte ptr [rbp - 0x2f]
0x14582a480: cmp cl, 0xff
0x14582a483: je 0x14582a4c1
0x14582a485: movups xmm0, xmmword ptr [rbp - 0x2e]
0x14582a489: movups xmm1, xmmword ptr [rbp - 0x20]
0x14582a48d: movups xmmword ptr [rbp + 0x40], xmm1
0x14582a491: movups xmmword ptr [rbp + 0x32], xmm0
0x14582a495: mov byte ptr [rbp + 0x30], cl
0x14582a498: mov byte ptr [rbp + 0x31], al
0x14582a49b: lea rax, [rip + 0x14a203a]
0x14582a4a2: mov rcx, qword ptr [rbp + 0x20]
0x14582a4a6: movsxd rcx, dword ptr [rax + rcx*4]
0x14582a4aa: add rcx, rax
0x14582a4ad: mov r8, qword ptr [rbp + 0x28]
0x14582a4b1: jmp rcx
0x14582a4b3: test r15b, r15b
0x14582a4b6: jne 0x14582a67b
0x14582a4bc: jmp 0x14582a68e
0x14582a4c1: test al, 1
0x14582a4c3: je 0x14582a6b6
0x14582a4c9: mov byte ptr [rbp + 0x10], 2
0x14582a4cd: mov byte ptr [rbp + 0x5f], 0
0x14582a4d1: mov byte ptr [rbp + 0x5e], 1
0x14582a4d5: mov byte ptr [rbp + 0x5d], bl
0x14582a4d8: mov byte ptr [rbp + 0x5c], r14b
0x14582a4dc: mov byte ptr [rbp + 0x5b], r15b
0x14582a4e0: mov byte ptr [rbp + 0x5a], r12b
0x14582a4e4: lea rcx, [rbp - 0x30]
0x14582a4e8: lea r9, [rbp - 0x10]
0x14582a4ec: mov rdx, rdi
0x14582a4ef: mov r8, r13
0x14582a4f2: call 0x145828250
0x14582a4f7: nop
0x14582a4f8: movzx eax, byte ptr [rbp - 0x30]
0x14582a4fc: cmp al, 0xff
0x14582a4fe: je 0x14582a55f
0x14582a500: movzx ecx, byte ptr [rbp - 0x2f]
0x14582a504: mov edx, dword ptr [rbp - 0x2e]
0x14582a507: mov dword ptr [rbp + 0x54], edx
0x14582a50a: movzx edx, word ptr [rbp - 0x2a]
0x14582a50e: mov word ptr [rbp + 0x58], dx
0x14582a512: mov rdx, qword ptr [rbp - 0x28]
0x14582a516: movups xmm0, xmmword ptr [rbp - 0x20]
0x14582a51a: movaps xmmword ptr [rbp - 0x60], xmm0
0x14582a51e: mov byte ptr [rbp + 0x30], al
0x14582a521: mov byte ptr [rbp + 0x31], cl
0x14582a524: mov eax, dword ptr [rbp + 0x54]
0x14582a527: mov dword ptr [rbp + 0x32], eax
0x14582a52a: movzx eax, word ptr [rbp + 0x58]
0x14582a52e: mov word ptr [rbp + 0x36], ax
0x14582a532: mov qword ptr [rbp + 0x38], rdx
0x14582a536: movaps xmm0, xmmword ptr [rbp - 0x60]
0x14582a53a: movaps xmmword ptr [rbp + 0x40], xmm0
0x14582a53e: lea rax, [rip + 0x14a1f97]
0x14582a545: mov rcx, qword ptr [rbp + 0x20]
0x14582a549: movsxd rcx, dword ptr [rax + rcx*4]
0x14582a54d: add rcx, rax
0x14582a550: mov r8, qword ptr [rbp + 0x28]
0x14582a554: jmp rcx
0x14582a556: mov byte ptr [rbp + 0x30], 0xff
0x14582a55a: jmp 0x14582a68e
0x14582a55f: lea rdx, [rdi + 0x40]
0x14582a563: mov byte ptr [rbp + 0x5f], 0
0x14582a567: mov byte ptr [rbp + 0x5e], 1
0x14582a56b: mov byte ptr [rbp + 0x5d], bl
0x14582a56e: mov byte ptr [rbp + 0x5c], r14b
0x14582a572: mov byte ptr [rbp + 0x5b], r15b
0x14582a576: mov byte ptr [rbp + 0x5a], r12b
0x14582a57a: lea rcx, [rbp - 0x10]
0x14582a57e: mov r8, r13
0x14582a581: call 0x1458af550
0x14582a586: nop
0x14582a587: movzx eax, byte ptr [rbp - 0x10]
0x14582a58b: cmp al, 0xff
0x14582a58d: je 0x14582a5f3
0x14582a58f: movzx ecx, byte ptr [rbp - 0xf]
0x14582a593: mov edx, dword ptr [rbp - 0xe]
0x14582a596: mov dword ptr [rbp + 0x54], edx
0x14582a599: movzx edx, word ptr [rbp - 0xa]
0x14582a59d: mov word ptr [rbp + 0x58], dx
0x14582a5a1: mov rdx, qword ptr [rbp - 8]
0x14582a5a5: movups xmm0, xmmword ptr [rbp]
0x14582a5a9: movaps xmmword ptr [rbp - 0x60], xmm0
0x14582a5ad: mov byte ptr [rbp + 0x30], al
0x14582a5b0: mov byte ptr [rbp + 0x31], cl
0x14582a5b3: mov eax, dword ptr [rbp + 0x54]
0x14582a5b6: mov dword ptr [rbp + 0x32], eax
0x14582a5b9: movzx eax, word ptr [rbp + 0x58]
0x14582a5bd: mov word ptr [rbp + 0x36], ax
0x14582a5c1: mov qword ptr [rbp + 0x38], rdx
0x14582a5c5: movaps xmm0, xmmword ptr [rbp - 0x60]
0x14582a5c9: movaps xmmword ptr [rbp + 0x40], xmm0
0x14582a5cd: lea rax, [rip + 0x14a1f08]
0x14582a5d4: mov rcx, qword ptr [rbp + 0x20]
0x14582a5d8: movsxd rcx, dword ptr [rax + rcx*4]
0x14582a5dc: add rcx, rax
0x14582a5df: mov r8, qword ptr [rbp + 0x28]
0x14582a5e3: jmp rcx
0x14582a5e5: test r14b, r14b
0x14582a5e8: jne 0x14582a67b
0x14582a5ee: jmp 0x14582a68e
0x14582a5f3: cmp dword ptr [r13], 2
0x14582a5f8: je 0x14582a6af
0x14582a5fe: lea rax, [rdi + 0x520]
0x14582a605: mov qword ptr [rbp - 0x10], r13
0x14582a609: mov qword ptr [rbp - 8], rax
0x14582a60d: mov byte ptr [rbp + 0x5f], 0
0x14582a611: mov byte ptr [rbp + 0x5e], 1
0x14582a615: mov byte ptr [rbp + 0x5d], bl
0x14582a618: mov byte ptr [rbp + 0x5c], r14b
0x14582a61c: mov byte ptr [rbp + 0x5b], r15b
0x14582a620: mov byte ptr [rbp + 0x5a], r12b
0x14582a624: lea rcx, [rbp - 0x10]
0x14582a628: call 0x145824630
0x14582a62d: nop
0x14582a62e: test rax, rax
0x14582a631: je 0x14582a6af
0x14582a633: mov cl, 2
0x14582a635: mov byte ptr [rbp + 0x30], cl
0x14582a638: mov byte ptr [rbp + 0x31], al
0x14582a63b: mov ecx, dword ptr [rbp + 0x54]
0x14582a63e: mov dword ptr [rbp + 0x32], ecx
0x14582a641: movzx ecx, word ptr [rbp + 0x58]
0x14582a645: mov word ptr [rbp + 0x36], cx
0x14582a649: mov qword ptr [rbp + 0x38], rax
0x14582a64d: movaps xmm0, xmmword ptr [rbp - 0x60]
0x14582a651: movaps xmmword ptr [rbp + 0x40], xmm0
0x14582a655: lea rax, [rip + 0x14a1e80]
0x14582a65c: mov rcx, qword ptr [rbp + 0x20]
0x14582a660: movsxd rcx, dword ptr [rax + rcx*4]
0x14582a664: add rcx, rax
0x14582a667: mov r8, qword ptr [rbp + 0x28]
0x14582a66b: jmp rcx
0x14582a66d: test bl, bl
0x14582a66f: jne 0x14582a67b
0x14582a671: jmp 0x14582a68e
0x14582a673: cmp word ptr [r8 + 0x28], -1
0x14582a679: je 0x14582a68e
0x14582a67b: lea rcx, [r8 + 0x20]
0x14582a67f: mov rax, qword ptr [r8 + 8]
0x14582a683: mov rdx, qword ptr [r8 + 0x10]
0x14582a687: mov r8, qword ptr [r8 + 0x18]
0x14582a68b: call qword ptr [rax + 0x20]
0x14582a68e: cmp byte ptr [rbp + 0x30], 0xff
0x14582a692: je 0x14582a6b6
0x14582a694: movaps xmm0, xmmword ptr [rbp + 0x30]
0x14582a698: movaps xmm1, xmmword ptr [rbp + 0x40]
0x14582a69c: movups xmmword ptr [rsi + 0x10], xmm1
0x14582a6a0: movups xmmword ptr [rsi], xmm0
0x14582a6a3: jmp 0x14582a7e5
0x14582a6a8: test r12b, r12b
0x14582a6ab: jne 0x14582a67b
0x14582a6ad: jmp 0x14582a68e
0x14582a6af: mov byte ptr [rdi + 0xf9], 0
0x14582a6b6: mov byte ptr [rbp + 0x10], 2
0x14582a6ba: lea rcx, [rbp - 0x30]
0x14582a6be: lea r9, [rbp - 0x10]
0x14582a6c2: mov rdx, rdi
0x14582a6c5: mov r8, r13
0x14582a6c8: call 0x145828250
0x14582a6cd: movzx eax, byte ptr [rbp - 0x30]
0x14582a6d1: cmp al, 0xff
0x14582a6d3: je 0x14582a6f3
0x14582a6d5: movzx ecx, byte ptr [rbp - 0x2f]
0x14582a6d9: movups xmm0, xmmword ptr [rbp - 0x20]
0x14582a6dd: movups xmmword ptr [rsi + 0x10], xmm0
0x14582a6e1: movups xmm0, xmmword ptr [rbp - 0x2e]
0x14582a6e5: movups xmmword ptr [rsi + 2], xmm0
0x14582a6e9: mov byte ptr [rsi], al
0x14582a6eb: mov byte ptr [rsi + 1], cl
0x14582a6ee: jmp 0x14582a7e5
0x14582a6f3: mov rbx, qword ptr [rdi + 0x50]
0x14582a6f7: test rbx, rbx
0x14582a6fa: je 0x14582a78e
0x14582a700: mov r14, qword ptr [rdi + 0x48]
0x14582a704: lea r15, [rbp - 0x10]
0x14582a708: cmp dword ptr [r13], 2
0x14582a70d: jne 0x14582a730
0x14582a70f: nop
0x14582a710: lea rcx, [rdi + 0x108]
0x14582a717: mov rdx, r14
0x14582a71a: mov r8, rbx
0x14582a71d: call 0x145cbeae0
0x14582a722: jmp 0x14582a74d
0x14582a724: nop word ptr cs:[rax + rax]
0x14582a730: mov qword ptr [rbp - 0x10], r13
0x14582a734: lea rax, [rdi + 0x520]
0x14582a73b: mov qword ptr [rbp - 8], rax
0x14582a73f: mov rcx, r15
0x14582a742: mov rdx, r14
0x14582a745: mov r8, rbx
0x14582a748: call 0x145824800
0x14582a74d: test al, 1
0x14582a74f: jne 0x14582a7de
0x14582a755: test rdx, rdx
0x14582a758: je 0x14582a7c7
0x14582a75a: mov r12, rbx
0x14582a75d: sub r12, rdx
0x14582a760: jb 0x14582a7fc
0x14582a766: mov qword ptr [rdi + 0x50], 0
0x14582a76e: je 0x14582a78e
0x14582a770: add rdx, r14
0x14582a773: mov rcx, r14
0x14582a776: mov r8, r12
0x14582a779: call 0x145d14607
0x14582a77e: mov qword ptr [rdi + 0x50], r12
0x14582a782: mov rbx, r12
0x14582a785: cmp dword ptr [r13], 2
0x14582a78a: jne 0x14582a730
0x14582a78c: jmp 0x14582a710
0x14582a78e: cmp dword ptr [r13], 2
0x14582a793: je 0x14582a7bb
0x14582a795: lea rax, [rdi + 0x520]
0x14582a79c: mov qword ptr [rbp - 0x10], r13
0x14582a7a0: mov qword ptr [rbp - 8], rax
0x14582a7a4: lea rcx, [rbp - 0x10]
0x14582a7a8: call 0x145824630
0x14582a7ad: test rax, rax
0x14582a7b0: je 0x14582a7bb
0x14582a7b2: mov byte ptr [rsi], 2
0x14582a7b5: mov qword ptr [rsi + 8], rax
0x14582a7b9: jmp 0x14582a7e5
0x14582a7bb: mov byte ptr [rdi + 0xf9], 0
0x14582a7c2: mov byte ptr [rsi], 0xff
0x14582a7c5: jmp 0x14582a7e5
0x14582a7c7: lea rdx, [rip + 0x1806212]
0x14582a7ce: mov r8d, 0x1e
0x14582a7d4: mov cl, 3
0x14582a7d6: call 0x145cb8110
0x14582a7db: mov rdx, rax
0x14582a7de: mov byte ptr [rsi], 2
0x14582a7e1: mov qword ptr [rsi + 8], rdx
0x14582a7e5: mov rax, rsi
0x14582a7e8: add rsp, 0xe8
0x14582a7ef: pop rbx
0x14582a7f0: pop rdi
0x14582a7f1: pop rsi
0x14582a7f2: pop r12
0x14582a7f4: pop r13
0x14582a7f6: pop r14
0x14582a7f8: pop r15
0x14582a7fa: pop rbp
0x14582a7fb: ret
0x14582a7fc: lea r9, [rip + 0x1b0f53d]
0x14582a803: xor ecx, ecx
0x14582a805: mov r8, rbx
0x14582a808: call 0x145eb7570
0x14582a80d: ud2
