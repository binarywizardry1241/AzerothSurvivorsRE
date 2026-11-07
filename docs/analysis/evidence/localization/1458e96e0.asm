; 0.109.0 SHA256 76e7fb483ce65a43e3d54cb85fe87e250a28b052dc3a3be01332741b4c932fb0
; 0x1458e96e0..0x1458e9f1e SHA256 35b35f2ebf6e24b5e47dd016fb82c08ee6cf43ba70819ec017c568bafc19f19d
0x1458e96e0: push rbp
0x1458e96e1: push r15
0x1458e96e3: push r14
0x1458e96e5: push r13
0x1458e96e7: push r12
0x1458e96e9: push rsi
0x1458e96ea: push rdi
0x1458e96eb: push rbx
0x1458e96ec: sub rsp, 0xb8
0x1458e96f3: lea rbp, [rsp + 0x80]
0x1458e96fb: mov qword ptr [rbp + 0x30], 0xfffffffffffffffe
0x1458e9703: mov rdi, rdx
0x1458e9706: mov rsi, rcx
0x1458e9709: lea rcx, [rbp - 0x10]
0x1458e970d: mov r8b, 0x22
0x1458e9710: call 0x1458e94d0
0x1458e9715: cmp qword ptr [rbp - 0x10], -1
0x1458e971a: je 0x1458e973a
0x1458e971c: mov rax, qword ptr [rbp]
0x1458e9720: mov qword ptr [rsi + 0x18], rax
0x1458e9724: movdqu xmm0, xmmword ptr [rbp - 0x10]
0x1458e9729: movdqu xmmword ptr [rsi + 8], xmm0
0x1458e972e: mov qword ptr [rsi], 1
0x1458e9735: jmp 0x1458e9d8f
0x1458e973a: mov qword ptr [rbp + 0x10], 0
0x1458e9742: mov qword ptr [rbp + 0x18], 1
0x1458e974a: mov qword ptr [rbp + 0x20], 0
0x1458e9752: xor r15d, r15d
0x1458e9755: lea r12, [rip + 0x15e957c]
0x1458e975c: mov rcx, qword ptr [rdi + 8]
0x1458e9760: mov rax, qword ptr [rdi + 0x10]
0x1458e9764: cmp rax, rcx
0x1458e9767: jb 0x1458e97cc
0x1458e9769: inc rax
0x1458e976c: mov qword ptr [rdi + 0x10], rax
0x1458e9770: lea rdx, [rip + 0x1307f70]
0x1458e9777: mov qword ptr [rbp - 0x38], rdx
0x1458e977b: mov qword ptr [rbp - 0x30], 0x13
0x1458e9783: cmp rcx, rax
0x1458e9786: cmovb rax, rcx
0x1458e978a: test rax, rax
0x1458e978d: je 0x1458e9b3d
0x1458e9793: mov rcx, qword ptr [rdi]
0x1458e9796: cmp rax, 4
0x1458e979a: jae 0x1458e9b45
0x1458e97a0: xor edx, edx
0x1458e97a2: xor r8d, r8d
0x1458e97a5: jmp 0x1458e9da3
0x1458e97aa: nop word ptr [rax + rax]
0x1458e97b0: mov rax, qword ptr [rbp + 0x18]
0x1458e97b4: mov byte ptr [rax + r15], bl
0x1458e97b8: inc r15
0x1458e97bb: mov qword ptr [rbp + 0x20], r15
0x1458e97bf: mov rcx, qword ptr [rdi + 8]
0x1458e97c3: mov rax, qword ptr [rdi + 0x10]
0x1458e97c7: cmp rax, rcx
0x1458e97ca: jae 0x1458e9769
0x1458e97cc: mov r13, qword ptr [rdi]
0x1458e97cf: movzx ebx, byte ptr [r13 + rax]
0x1458e97d5: lea r14, [rax + 1]
0x1458e97d9: mov qword ptr [rdi + 0x10], r14
0x1458e97dd: cmp ebx, 0x5c
0x1458e97e0: je 0x1458e9810
0x1458e97e2: cmp ebx, 0x22
0x1458e97e5: je 0x1458e9aa4
0x1458e97eb: cmp r15, qword ptr [rbp + 0x10]
0x1458e97ef: jne 0x1458e97b0
0x1458e97f1: mov byte ptr [rbp + 0x2f], 1
0x1458e97f5: lea rcx, [rbp + 0x10]
0x1458e97f9: call 0x145d991b0
0x1458e97fe: nop
0x1458e97ff: jmp 0x1458e97b0
0x1458e9801: nop word ptr cs:[rax + rax]
0x1458e9810: cmp r14, rcx
0x1458e9813: jae 0x1458e9afc
0x1458e9819: movzx r14d, byte ptr [r13 + rax + 1]
0x1458e981f: add rax, 2
0x1458e9823: mov qword ptr [rdi + 0x10], rax
0x1458e9827: lea ecx, [r14 - 0x22]
0x1458e982b: cmp ecx, 0x53
0x1458e982e: ja 0x1458e9ca8
0x1458e9834: movsxd rcx, dword ptr [r12 + rcx*4]
0x1458e9838: add rcx, r12
0x1458e983b: jmp rcx
0x1458e983d: cmp r15, qword ptr [rbp + 0x10]
0x1458e9841: jne 0x1458e9851
0x1458e9843: mov byte ptr [rbp + 0x2f], 1
0x1458e9847: lea rcx, [rbp + 0x10]
0x1458e984b: call 0x145d991b0
0x1458e9850: nop
0x1458e9851: mov rax, qword ptr [rbp + 0x18]
0x1458e9855: mov byte ptr [rax + r15], r14b
0x1458e9859: jmp 0x1458e97b8
0x1458e985e: cmp r15, qword ptr [rbp + 0x10]
0x1458e9862: jne 0x1458e9872
0x1458e9864: mov byte ptr [rbp + 0x2f], 1
0x1458e9868: lea rcx, [rbp + 0x10]
0x1458e986c: call 0x145d991b0
0x1458e9871: nop
0x1458e9872: mov rax, qword ptr [rbp + 0x18]
0x1458e9876: mov byte ptr [rax + r15], 8
0x1458e987b: jmp 0x1458e97b8
0x1458e9880: cmp r15, qword ptr [rbp + 0x10]
0x1458e9884: jne 0x1458e9894
0x1458e9886: mov byte ptr [rbp + 0x2f], 1
0x1458e988a: lea rcx, [rbp + 0x10]
0x1458e988e: call 0x145d991b0
0x1458e9893: nop
0x1458e9894: mov rax, qword ptr [rbp + 0x18]
0x1458e9898: mov byte ptr [rax + r15], 0xc
0x1458e989d: jmp 0x1458e97b8
0x1458e98a2: mov byte ptr [rbp + 0x2f], 1
0x1458e98a6: lea rcx, [rbp - 0x10]
0x1458e98aa: mov rdx, rdi
0x1458e98ad: call 0x1458e9020
0x1458e98b2: nop
0x1458e98b3: mov rax, qword ptr [rbp - 0x10]
0x1458e98b7: mov r14d, dword ptr [rbp - 8]
0x1458e98bb: cmp rax, -1
0x1458e98bf: jne 0x1458e9d5a
0x1458e98c5: mov eax, r14d
0x1458e98c8: and eax, 0xfffffc00
0x1458e98cd: cmp eax, 0xd800
0x1458e98d2: jne 0x1458e992c
0x1458e98d4: mov rax, qword ptr [rdi + 0x10]
0x1458e98d8: cmp rax, -2
0x1458e98dc: jae 0x1458e992c
0x1458e98de: lea rcx, [rax + 2]
0x1458e98e2: cmp rcx, qword ptr [rdi + 8]
0x1458e98e6: ja 0x1458e992c
0x1458e98e8: mov rdx, qword ptr [rdi]
0x1458e98eb: cmp word ptr [rdx + rax], 0x755c
0x1458e98f1: jne 0x1458e992c
0x1458e98f3: mov qword ptr [rdi + 0x10], rcx
0x1458e98f7: mov byte ptr [rbp + 0x2f], 1
0x1458e98fb: lea rcx, [rbp - 0x10]
0x1458e98ff: mov rdx, rdi
0x1458e9902: call 0x1458e9020
0x1458e9907: nop
0x1458e9908: mov rcx, qword ptr [rbp - 0x10]
0x1458e990c: mov eax, dword ptr [rbp - 8]
0x1458e990f: cmp rcx, -1
0x1458e9913: jne 0x1458e9d75
0x1458e9919: shl r14d, 0xa
0x1458e991d: and eax, 0x3ff
0x1458e9922: add r14d, eax
0x1458e9925: add r14d, 0xfca10000
0x1458e992c: mov eax, r14d
0x1458e992f: xor eax, 0xd800
0x1458e9934: add eax, 0xffef0000
0x1458e9939: cmp eax, 0xffef0800
0x1458e993e: mov eax, 0xfffd
0x1458e9943: cmovb r14d, eax
0x1458e9947: mov dword ptr [rbp - 0x10], 0
0x1458e994e: cmp r14d, 0x80
0x1458e9955: jae 0x1458e99cc
0x1458e9957: mov byte ptr [rbp - 0x10], r14b
0x1458e995b: mov r15d, 1
0x1458e9961: jmp 0x1458e9a3d
0x1458e9966: cmp r15, qword ptr [rbp + 0x10]
0x1458e996a: jne 0x1458e997a
0x1458e996c: mov byte ptr [rbp + 0x2f], 1
0x1458e9970: lea rcx, [rbp + 0x10]
0x1458e9974: call 0x145d991b0
0x1458e9979: nop
0x1458e997a: mov rax, qword ptr [rbp + 0x18]
0x1458e997e: mov byte ptr [rax + r15], 0xd
0x1458e9983: jmp 0x1458e97b8
0x1458e9988: cmp r15, qword ptr [rbp + 0x10]
0x1458e998c: jne 0x1458e999c
0x1458e998e: mov byte ptr [rbp + 0x2f], 1
0x1458e9992: lea rcx, [rbp + 0x10]
0x1458e9996: call 0x145d991b0
0x1458e999b: nop
0x1458e999c: mov rax, qword ptr [rbp + 0x18]
0x1458e99a0: mov byte ptr [rax + r15], 0xa
0x1458e99a5: jmp 0x1458e97b8
0x1458e99aa: cmp r15, qword ptr [rbp + 0x10]
0x1458e99ae: jne 0x1458e99be
0x1458e99b0: mov byte ptr [rbp + 0x2f], 1
0x1458e99b4: lea rcx, [rbp + 0x10]
0x1458e99b8: call 0x145d991b0
0x1458e99bd: nop
0x1458e99be: mov rax, qword ptr [rbp + 0x18]
0x1458e99c2: mov byte ptr [rax + r15], 9
0x1458e99c7: jmp 0x1458e97b8
0x1458e99cc: mov eax, r14d
0x1458e99cf: and al, 0x3f
0x1458e99d1: or al, 0x80
0x1458e99d3: mov ecx, r14d
0x1458e99d6: shr ecx, 6
0x1458e99d9: cmp r14d, 0x800
0x1458e99e0: jae 0x1458e99f3
0x1458e99e2: or cl, 0xc0
0x1458e99e5: mov byte ptr [rbp - 0x10], cl
0x1458e99e8: mov byte ptr [rbp - 0xf], al
0x1458e99eb: mov r15d, 2
0x1458e99f1: jmp 0x1458e9a3d
0x1458e99f3: and cl, 0x3f
0x1458e99f6: or cl, 0x80
0x1458e99f9: mov edx, r14d
0x1458e99fc: shr edx, 0xc
0x1458e99ff: cmp r14d, 0xffff
0x1458e9a06: ja 0x1458e9a1c
0x1458e9a08: or dl, 0xe0
0x1458e9a0b: mov byte ptr [rbp - 0x10], dl
0x1458e9a0e: mov byte ptr [rbp - 0xf], cl
0x1458e9a11: mov byte ptr [rbp - 0xe], al
0x1458e9a14: mov r15d, 3
0x1458e9a1a: jmp 0x1458e9a3d
0x1458e9a1c: and dl, 0x3f
0x1458e9a1f: or dl, 0x80
0x1458e9a22: shr r14d, 0x12
0x1458e9a26: or r14b, 0xf0
0x1458e9a2a: mov byte ptr [rbp - 0x10], r14b
0x1458e9a2e: mov byte ptr [rbp - 0xf], dl
0x1458e9a31: mov byte ptr [rbp - 0xe], cl
0x1458e9a34: mov byte ptr [rbp - 0xd], al
0x1458e9a37: mov r15d, 4
0x1458e9a3d: mov rax, qword ptr [rbp + 0x10]
0x1458e9a41: mov rdx, qword ptr [rbp + 0x20]
0x1458e9a45: sub rax, rdx
0x1458e9a48: cmp r15, rax
0x1458e9a4b: ja 0x1458e9a7e
0x1458e9a4d: add rdx, qword ptr [rbp + 0x18]
0x1458e9a51: mov rcx, rdx
0x1458e9a54: lea rdx, [rbp - 0x10]
0x1458e9a58: mov r8, r15
0x1458e9a5b: call 0x145bfa0e7
0x1458e9a60: add r15, qword ptr [rbp + 0x20]
0x1458e9a64: mov qword ptr [rbp + 0x20], r15
0x1458e9a68: mov rcx, qword ptr [rdi + 8]
0x1458e9a6c: mov rax, qword ptr [rdi + 0x10]
0x1458e9a70: cmp rax, rcx
0x1458e9a73: jb 0x1458e97cc
0x1458e9a79: jmp 0x1458e9769
0x1458e9a7e: mov byte ptr [rbp + 0x2f], 1
0x1458e9a82: mov qword ptr [rsp + 0x20], 1
0x1458e9a8b: mov r9d, 1
0x1458e9a91: lea rcx, [rbp + 0x10]
0x1458e9a95: mov r8, r15
0x1458e9a98: call 0x145bfa970
0x1458e9a9d: nop
0x1458e9a9e: mov rdx, qword ptr [rbp + 0x20]
0x1458e9aa2: jmp 0x1458e9a4d
0x1458e9aa4: mov rax, qword ptr [rbp + 0x10]
0x1458e9aa8: mov qword ptr [rbp - 0x18], rax
0x1458e9aac: mov rdx, qword ptr [rbp + 0x18]
0x1458e9ab0: lea rcx, [rbp - 0x10]
0x1458e9ab4: mov qword ptr [rbp - 0x20], rdx
0x1458e9ab8: mov r8, r15
0x1458e9abb: call 0x145bd5650
0x1458e9ac0: nop
0x1458e9ac1: cmp byte ptr [rbp - 0x10], 0
0x1458e9ac5: je 0x1458e9bd9
0x1458e9acb: cmp qword ptr [rbp - 0x18], -1
0x1458e9ad0: je 0x1458e9bed
0x1458e9ad6: lea rax, [rip + 0x1307ac0]
0x1458e9add: mov qword ptr [rbp - 0x38], rax
0x1458e9ae1: mov qword ptr [rbp - 0x30], 9
0x1458e9ae9: cmp r14, 4
0x1458e9aed: jae 0x1458e9c10
0x1458e9af3: xor eax, eax
0x1458e9af5: xor ecx, ecx
0x1458e9af7: jmp 0x1458e9e39
0x1458e9afc: add rax, 2
0x1458e9b00: mov qword ptr [rdi + 0x10], rax
0x1458e9b04: lea rdx, [rip + 0x1307bef]
0x1458e9b0b: mov qword ptr [rbp - 0x38], rdx
0x1458e9b0f: mov qword ptr [rbp - 0x30], 0xa
0x1458e9b17: cmp rcx, rax
0x1458e9b1a: cmovae rcx, rax
0x1458e9b1e: test rax, rax
0x1458e9b21: mov rax, rcx
0x1458e9b24: je 0x1458e9be3
0x1458e9b2a: cmp rax, 4
0x1458e9b2e: jae 0x1458e9cc5
0x1458e9b34: xor ecx, ecx
0x1458e9b36: xor edx, edx
0x1458e9b38: jmp 0x1458e9ebb
0x1458e9b3d: xor r8d, r8d
0x1458e9b40: jmp 0x1458e9db9
0x1458e9b45: mov rdx, rax
0x1458e9b48: and rdx, 0xfffffffffffffffc
0x1458e9b4c: pxor xmm0, xmm0
0x1458e9b50: xor r8d, r8d
0x1458e9b53: movdqa xmm1, xmmword ptr [rip + 0x777d15]
0x1458e9b5b: movdqa xmm3, xmmword ptr [rip + 0x4b38fd]
0x1458e9b63: pxor xmm2, xmm2
0x1458e9b67: nop word ptr [rax + rax]
0x1458e9b70: movzx r9d, word ptr [rcx + r8]
0x1458e9b75: movd xmm4, r9d
0x1458e9b7a: movzx r9d, word ptr [rcx + r8 + 2]
0x1458e9b80: movd xmm5, r9d
0x1458e9b85: pcmpeqb xmm4, xmm1
0x1458e9b89: punpcklbw xmm4, xmm4
0x1458e9b8d: pshuflw xmm4, xmm4, 0xd4
0x1458e9b92: pshufd xmm4, xmm4, 0xd4
0x1458e9b97: pand xmm4, xmm3
0x1458e9b9b: paddq xmm2, xmm4
0x1458e9b9f: pcmpeqb xmm5, xmm1
0x1458e9ba3: punpcklbw xmm5, xmm5
0x1458e9ba7: pshuflw xmm4, xmm5, 0xd4
0x1458e9bac: pshufd xmm4, xmm4, 0xd4
0x1458e9bb1: pand xmm4, xmm3
0x1458e9bb5: paddq xmm0, xmm4
0x1458e9bb9: add r8, 4
0x1458e9bbd: cmp rdx, r8
0x1458e9bc0: jne 0x1458e9b70
0x1458e9bc2: paddq xmm0, xmm2
0x1458e9bc6: pshufd xmm1, xmm0, 0xee
0x1458e9bcb: paddq xmm1, xmm0
0x1458e9bcf: movq r8, xmm1
0x1458e9bd4: jmp 0x1458e9db4
0x1458e9bd9: mov rax, qword ptr [rbp - 0x18]
0x1458e9bdd: mov rcx, qword ptr [rbp - 0x20]
0x1458e9be1: jmp 0x1458e9bf8
0x1458e9be3: mov edx, 1
0x1458e9be8: jmp 0x1458e9ed6
0x1458e9bed: mov rax, qword ptr [rbp - 0x20]
0x1458e9bf1: mov rcx, r15
0x1458e9bf4: mov r15, qword ptr [rbp - 8]
0x1458e9bf8: mov qword ptr [rsi + 8], rax
0x1458e9bfc: mov qword ptr [rsi + 0x10], rcx
0x1458e9c00: mov qword ptr [rsi + 0x18], r15
0x1458e9c04: mov qword ptr [rsi], 0
0x1458e9c0b: jmp 0x1458e9d8f
0x1458e9c10: mov rax, r14
0x1458e9c13: and rax, 0xfffffffffffffffc
0x1458e9c17: pxor xmm0, xmm0
0x1458e9c1b: xor ecx, ecx
0x1458e9c1d: movdqa xmm1, xmmword ptr [rip + 0x777c4b]
0x1458e9c25: movdqa xmm3, xmmword ptr [rip + 0x4b3833]
0x1458e9c2d: pxor xmm2, xmm2
0x1458e9c31: nop word ptr cs:[rax + rax]
0x1458e9c40: movzx edx, word ptr [r13 + rcx]
0x1458e9c46: movd xmm4, edx
0x1458e9c4a: movzx edx, word ptr [r13 + rcx + 2]
0x1458e9c50: movd xmm5, edx
0x1458e9c54: pcmpeqb xmm4, xmm1
0x1458e9c58: punpcklbw xmm4, xmm4
0x1458e9c5c: pshuflw xmm4, xmm4, 0xd4
0x1458e9c61: pshufd xmm4, xmm4, 0xd4
0x1458e9c66: pand xmm4, xmm3
0x1458e9c6a: paddq xmm2, xmm4
0x1458e9c6e: pcmpeqb xmm5, xmm1
0x1458e9c72: punpcklbw xmm5, xmm5
0x1458e9c76: pshuflw xmm4, xmm5, 0xd4
0x1458e9c7b: pshufd xmm4, xmm4, 0xd4
0x1458e9c80: pand xmm4, xmm3
0x1458e9c84: paddq xmm0, xmm4
0x1458e9c88: add rcx, 4
0x1458e9c8c: cmp rax, rcx
0x1458e9c8f: jne 0x1458e9c40
0x1458e9c91: paddq xmm0, xmm2
0x1458e9c95: pshufd xmm1, xmm0, 0xee
0x1458e9c9a: paddq xmm1, xmm0
0x1458e9c9e: movq rcx, xmm1
0x1458e9ca3: jmp 0x1458e9e4a
0x1458e9ca8: lea rcx, [rip + 0x1307a4b]
0x1458e9caf: mov qword ptr [rbp - 0x38], rcx
0x1458e9cb3: mov qword ptr [rbp - 0x30], 0xa
0x1458e9cbb: cmp rax, 4
0x1458e9cbf: jb 0x1458e9b34
0x1458e9cc5: mov rcx, rax
0x1458e9cc8: and rcx, 0xfffffffffffffffc
0x1458e9ccc: pxor xmm0, xmm0
0x1458e9cd0: xor edx, edx
0x1458e9cd2: movdqa xmm1, xmmword ptr [rip + 0x777b96]
0x1458e9cda: movdqa xmm3, xmmword ptr [rip + 0x4b377e]
0x1458e9ce2: pxor xmm2, xmm2
0x1458e9ce6: nop word ptr cs:[rax + rax]
0x1458e9cf0: movzx r8d, word ptr [r13 + rdx]
0x1458e9cf6: movd xmm4, r8d
0x1458e9cfb: movzx r8d, word ptr [r13 + rdx + 2]
0x1458e9d01: movd xmm5, r8d
0x1458e9d06: pcmpeqb xmm4, xmm1
0x1458e9d0a: punpcklbw xmm4, xmm4
0x1458e9d0e: pshuflw xmm4, xmm4, 0xd4
0x1458e9d13: pshufd xmm4, xmm4, 0xd4
0x1458e9d18: pand xmm4, xmm3
0x1458e9d1c: paddq xmm2, xmm4
0x1458e9d20: pcmpeqb xmm5, xmm1
0x1458e9d24: punpcklbw xmm5, xmm5
0x1458e9d28: pshuflw xmm4, xmm5, 0xd4
0x1458e9d2d: pshufd xmm4, xmm4, 0xd4
0x1458e9d32: pand xmm4, xmm3
0x1458e9d36: paddq xmm0, xmm4
0x1458e9d3a: add rdx, 4
0x1458e9d3e: cmp rcx, rdx
0x1458e9d41: jne 0x1458e9cf0
0x1458e9d43: paddq xmm0, xmm2
0x1458e9d47: pshufd xmm1, xmm0, 0xee
0x1458e9d4c: paddq xmm1, xmm0
0x1458e9d50: movq rdx, xmm1
0x1458e9d55: jmp 0x1458e9ece
0x1458e9d5a: mov ecx, dword ptr [rbp + 4]
0x1458e9d5d: mov dword ptr [rsi + 0x1c], ecx
0x1458e9d60: mov rcx, qword ptr [rbp - 4]
0x1458e9d64: mov qword ptr [rsi + 0x14], rcx
0x1458e9d68: mov qword ptr [rsi + 8], rax
0x1458e9d6c: mov dword ptr [rsi + 0x10], r14d
0x1458e9d70: jmp 0x1458e9e11
0x1458e9d75: mov edx, dword ptr [rbp + 4]
0x1458e9d78: mov dword ptr [rsi + 0x1c], edx
0x1458e9d7b: mov rdx, qword ptr [rbp - 4]
0x1458e9d7f: mov qword ptr [rsi + 0x14], rdx
0x1458e9d83: mov qword ptr [rsi + 8], rcx
0x1458e9d87: mov dword ptr [rsi + 0x10], eax
0x1458e9d8a: jmp 0x1458e9e11
0x1458e9d8f: add rsp, 0xb8
0x1458e9d96: pop rbx
0x1458e9d97: pop rdi
0x1458e9d98: pop rsi
0x1458e9d99: pop r12
0x1458e9d9b: pop r13
0x1458e9d9d: pop r14
0x1458e9d9f: pop r15
0x1458e9da1: pop rbp
0x1458e9da2: ret
0x1458e9da3: xor r9d, r9d
0x1458e9da6: cmp byte ptr [rcx + rdx], 0xa
0x1458e9daa: sete r9b
0x1458e9dae: add r8, r9
0x1458e9db1: inc rdx
0x1458e9db4: cmp rax, rdx
0x1458e9db7: jne 0x1458e9da3
0x1458e9db9: inc r8
0x1458e9dbc: mov qword ptr [rbp - 0x28], r8
0x1458e9dc0: lea rax, [rbp - 0x28]
0x1458e9dc4: mov qword ptr [rbp - 0x10], rax
0x1458e9dc8: lea rax, [rip + 0x2f5a01]
0x1458e9dcf: mov qword ptr [rbp - 8], rax
0x1458e9dd3: lea rax, [rbp - 0x38]
0x1458e9dd7: mov qword ptr [rbp], rax
0x1458e9ddb: lea rax, [rip - 0x58e7d22]
0x1458e9de2: mov qword ptr [rbp + 8], rax
0x1458e9de6: mov byte ptr [rbp + 0x2f], 1
0x1458e9dea: lea rdx, [rip + 0x13078de]
0x1458e9df1: lea rcx, [rbp - 0x50]
0x1458e9df5: lea r8, [rbp - 0x10]
0x1458e9df9: call 0x145bcce30
0x1458e9dfe: nop
0x1458e9dff: mov rax, qword ptr [rbp - 0x40]
0x1458e9e03: mov qword ptr [rsi + 0x18], rax
0x1458e9e07: movdqu xmm0, xmmword ptr [rbp - 0x50]
0x1458e9e0c: movdqu xmmword ptr [rsi + 8], xmm0
0x1458e9e11: mov qword ptr [rsi], 1
0x1458e9e18: mov rdx, qword ptr [rbp + 0x10]
0x1458e9e1c: test rdx, rdx
0x1458e9e1f: je 0x1458e9d8f
0x1458e9e25: mov rcx, qword ptr [rbp + 0x18]
0x1458e9e29: mov r8d, 1
0x1458e9e2f: call 0x1400021d0
0x1458e9e34: jmp 0x1458e9d8f
0x1458e9e39: xor edx, edx
0x1458e9e3b: cmp byte ptr [r13 + rax], 0xa
0x1458e9e41: sete dl
0x1458e9e44: add rcx, rdx
0x1458e9e47: inc rax
0x1458e9e4a: cmp r14, rax
0x1458e9e4d: jne 0x1458e9e39
0x1458e9e4f: inc rcx
0x1458e9e52: mov qword ptr [rbp - 0x28], rcx
0x1458e9e56: lea rax, [rbp - 0x28]
0x1458e9e5a: mov qword ptr [rbp - 0x10], rax
0x1458e9e5e: lea rax, [rip + 0x2f596b]
0x1458e9e65: mov qword ptr [rbp - 8], rax
0x1458e9e69: lea rax, [rbp - 0x38]
0x1458e9e6d: mov qword ptr [rbp], rax
0x1458e9e71: lea rax, [rip - 0x58e7db8]
0x1458e9e78: mov qword ptr [rbp + 8], rax
0x1458e9e7c: lea rdx, [rip + 0x130784c]
0x1458e9e83: lea rcx, [rbp - 0x50]
0x1458e9e87: lea r8, [rbp - 0x10]
0x1458e9e8b: call 0x145bcce30
0x1458e9e90: nop
0x1458e9e91: mov rdx, qword ptr [rbp - 0x18]
0x1458e9e95: test rdx, rdx
0x1458e9e98: je 0x1458e9ea9
0x1458e9e9a: mov r8d, 1
0x1458e9ea0: mov rcx, qword ptr [rbp - 0x20]
0x1458e9ea4: call 0x1400021d0
0x1458e9ea9: mov rax, qword ptr [rbp - 0x40]
0x1458e9ead: mov qword ptr [rsi + 0x18], rax
0x1458e9eb1: movdqu xmm0, xmmword ptr [rbp - 0x50]
0x1458e9eb6: jmp 0x1458e9729
0x1458e9ebb: xor r8d, r8d
0x1458e9ebe: cmp byte ptr [r13 + rcx], 0xa
0x1458e9ec4: sete r8b
0x1458e9ec8: add rdx, r8
0x1458e9ecb: inc rcx
0x1458e9ece: cmp rax, rcx
0x1458e9ed1: jne 0x1458e9ebb
0x1458e9ed3: inc rdx
0x1458e9ed6: mov qword ptr [rbp - 0x28], rdx
0x1458e9eda: lea rax, [rbp - 0x28]
0x1458e9ede: mov qword ptr [rbp - 0x10], rax
0x1458e9ee2: lea rax, [rip + 0x2f58e7]
0x1458e9ee9: mov qword ptr [rbp - 8], rax
0x1458e9eed: lea rax, [rbp - 0x38]
0x1458e9ef1: mov qword ptr [rbp], rax
0x1458e9ef5: lea rax, [rip - 0x58e7e3c]
0x1458e9efc: mov qword ptr [rbp + 8], rax
0x1458e9f00: mov byte ptr [rbp + 0x2f], 1
0x1458e9f04: lea rdx, [rip + 0x13077c4]
0x1458e9f0b: lea rcx, [rbp - 0x50]
0x1458e9f0f: lea r8, [rbp - 0x10]
0x1458e9f13: call 0x145bcce30
0x1458e9f18: nop
0x1458e9f19: jmp 0x1458e9dff
