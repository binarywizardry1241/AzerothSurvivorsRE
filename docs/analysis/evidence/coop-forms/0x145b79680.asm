0x145b79680: push rbp
0x145b79681: push r15
0x145b79683: push r14
0x145b79685: push r13
0x145b79687: push r12
0x145b79689: push rsi
0x145b7968a: push rdi
0x145b7968b: push rbx
0x145b7968c: sub rsp, 0x78
0x145b79690: lea rbp, [rsp + 0x70]
0x145b79695: movdqa xmmword ptr [rbp - 0x10], xmm7
0x145b7969a: movdqa xmmword ptr [rbp - 0x20], xmm6
0x145b7969f: mov qword ptr [rbp - 0x28], 0xfffffffffffffffe
0x145b796a7: mov rsi, rcx
0x145b796aa: mov rcx, rdx
0x145b796ad: mov rdx, r8
0x145b796b0: call 0x1401edaa0
0x145b796b5: test rdx, rdx
0x145b796b8: je 0x145b796fc
0x145b796ba: mov rbx, rax
0x145b796bd: mov r14, rdx
0x145b796c0: call 0x140002200
0x145b796c5: mov edx, 1
0x145b796ca: mov rcx, r14
0x145b796cd: call 0x1400021c0
0x145b796d2: test rax, rax
0x145b796d5: je 0x145b79823
0x145b796db: mov rdi, rax
0x145b796de: mov r15, rax
0x145b796e1: mov rcx, rdi
0x145b796e4: mov rdx, rbx
0x145b796e7: mov r8, r14
0x145b796ea: call 0x145d145fb
0x145b796ef: cmp r14, 8
0x145b796f3: jae 0x145b79730
0x145b796f5: xor eax, eax
0x145b796f7: jmp 0x145b7984e
0x145b796fc: mov qword ptr [rbp - 0x40], 0
0x145b79704: mov qword ptr [rbp - 0x38], 1
0x145b7970c: mov qword ptr [rbp - 0x30], 0
0x145b79714: mov rax, qword ptr [rbp - 0x40]
0x145b79718: mov qword ptr [rsi], rax
0x145b7971b: mov rax, qword ptr [rbp - 0x38]
0x145b7971f: mov qword ptr [rsi + 8], rax
0x145b79723: mov qword ptr [rsi + 0x10], 0
0x145b7972b: jmp 0x145b79832
0x145b79730: cmp r14, 0x20
0x145b79734: jae 0x145b7973d
0x145b79736: xor eax, eax
0x145b79738: jmp 0x145b797ce
0x145b7973d: mov rax, r14
0x145b79740: and rax, 0xffffffffffffffe0
0x145b79744: xor ecx, ecx
0x145b79746: movdqa xmm0, xmmword ptr [rip + 0x3aa342]
0x145b7974e: movdqa xmm1, xmmword ptr [rip + 0x341a5a]
0x145b79756: movdqa xmm2, xmmword ptr [rip + 0x341a62]
0x145b7975e: nop
0x145b79760: movdqu xmm3, xmmword ptr [r15 + rcx]
0x145b79766: movdqu xmm4, xmmword ptr [r15 + rcx + 0x10]
0x145b7976d: movdqa xmm5, xmm3
0x145b79771: paddb xmm5, xmm0
0x145b79775: movdqa xmm6, xmm4
0x145b79779: paddb xmm6, xmm0
0x145b7977d: movdqa xmm7, xmm5
0x145b79781: pminub xmm7, xmm1
0x145b79785: pcmpeqb xmm7, xmm5
0x145b79789: pand xmm7, xmm2
0x145b7978d: movdqa xmm5, xmm6
0x145b79791: pminub xmm5, xmm1
0x145b79795: pcmpeqb xmm5, xmm6
0x145b79799: pand xmm5, xmm2
0x145b7979d: pxor xmm7, xmm3
0x145b797a1: pxor xmm5, xmm4
0x145b797a5: movdqu xmmword ptr [r15 + rcx], xmm7
0x145b797ab: movdqu xmmword ptr [r15 + rcx + 0x10], xmm5
0x145b797b2: add rcx, 0x20
0x145b797b6: cmp rax, rcx
0x145b797b9: jne 0x145b79760
0x145b797bb: cmp r14, rax
0x145b797be: je 0x145b7986d
0x145b797c4: test r14b, 0x18
0x145b797c8: je 0x145b7984e
0x145b797ce: mov rcx, rax
0x145b797d1: mov rax, r14
0x145b797d4: and rax, 0xfffffffffffffff8
0x145b797d8: movdqa xmm0, xmmword ptr [rip + 0x3aa2c0]
0x145b797e0: movdqa xmm1, xmmword ptr [rip + 0x3419f8]
0x145b797e8: movdqa xmm2, xmmword ptr [rip + 0x341a00]
0x145b797f0: movq xmm3, qword ptr [r15 + rcx]
0x145b797f6: movdqa xmm4, xmm3
0x145b797fa: paddb xmm4, xmm0
0x145b797fe: movdqa xmm5, xmm4
0x145b79802: pmaxub xmm5, xmm1
0x145b79806: pcmpeqb xmm5, xmm4
0x145b7980a: pandn xmm5, xmm2
0x145b7980e: pxor xmm5, xmm3
0x145b79812: movq qword ptr [r15 + rcx], xmm5
0x145b79818: add rcx, 8
0x145b7981c: cmp rax, rcx
0x145b7981f: jne 0x145b797f0
0x145b79821: jmp 0x145b79868
0x145b79823: mov ecx, 1
0x145b79828: mov rdx, r14
0x145b7982b: call 0x145eb6fcb
0x145b79830: ud2
0x145b79832: mov rax, rsi
0x145b79835: movaps xmm6, xmmword ptr [rbp - 0x20]
0x145b79839: movaps xmm7, xmmword ptr [rbp - 0x10]
0x145b7983d: add rsp, 0x78
0x145b79841: pop rbx
0x145b79842: pop rdi
0x145b79843: pop rsi
0x145b79844: pop r12
0x145b79846: pop r13
0x145b79848: pop r14
0x145b7984a: pop r15
0x145b7984c: pop rbp
0x145b7984d: ret
0x145b7984e: movzx ecx, byte ptr [r15 + rax]
0x145b79853: lea edx, [rcx - 0x61]
0x145b79856: cmp dl, 0x1a
0x145b79859: setb dl
0x145b7985c: shl dl, 5
0x145b7985f: xor dl, cl
0x145b79861: mov byte ptr [r15 + rax], dl
0x145b79865: inc rax
0x145b79868: cmp r14, rax
0x145b7986b: jne 0x145b7984e
0x145b7986d: mov qword ptr [rbp - 0x50], r14
0x145b79871: add rdi, r14
0x145b79874: mov qword ptr [rbp - 0x40], 0
0x145b7987c: mov qword ptr [rbp - 0x38], 1
0x145b79884: mov qword ptr [rbp - 0x30], 0
0x145b7988c: mov eax, 1
0x145b79891: xor ebx, ebx
0x145b79893: lea r14, [rbp - 0x40]
0x145b79897: mov qword ptr [rbp - 0x48], r15
0x145b7989b: mov r12, r15
0x145b7989e: jmp 0x145b798b4
0x145b798a0: mov byte ptr [rax + rbx], r13b
0x145b798a4: add rbx, r15
0x145b798a7: mov qword ptr [rbp - 0x30], rbx
0x145b798ab: cmp r12, rdi
0x145b798ae: je 0x145b79a6b
0x145b798b4: movzx edx, byte ptr [r12]
0x145b798b9: movzx r13d, dl
0x145b798bd: test r13b, r13b
0x145b798c0: js 0x145b798e0
0x145b798c2: inc r12
0x145b798c5: lea ecx, [r13 - 0x30]
0x145b798c9: cmp ecx, 0xa
0x145b798cc: jae 0x145b79970
0x145b798d2: jmp 0x145b79982
0x145b798d7: nop word ptr [rax + rax]
0x145b798e0: mov ecx, r13d
0x145b798e3: and ecx, 0x1f
0x145b798e6: movzx r8d, byte ptr [r12 + 1]
0x145b798ec: and r8d, 0x3f
0x145b798f0: cmp r13b, 0xdf
0x145b798f4: jbe 0x145b79936
0x145b798f6: movzx r13d, byte ptr [r12 + 2]
0x145b798fc: shl r8d, 6
0x145b79900: and r13d, 0x3f
0x145b79904: or r13d, r8d
0x145b79907: cmp dl, 0xf0
0x145b7990a: jb 0x145b7994e
0x145b7990c: movzx edx, byte ptr [r12 + 3]
0x145b79912: add r12, 4
0x145b79916: and ecx, 7
0x145b79919: shl ecx, 0x12
0x145b7991c: shl r13d, 6
0x145b79920: and edx, 0x3f
0x145b79923: or edx, r13d
0x145b79926: or edx, ecx
0x145b79928: mov r13d, edx
0x145b7992b: lea ecx, [r13 - 0x30]
0x145b7992f: cmp ecx, 0xa
0x145b79932: jae 0x145b79970
0x145b79934: jmp 0x145b79982
0x145b79936: add r12, 2
0x145b7993a: shl ecx, 6
0x145b7993d: or ecx, r8d
0x145b79940: mov r13d, ecx
0x145b79943: lea ecx, [r13 - 0x30]
0x145b79947: cmp ecx, 0xa
0x145b7994a: jae 0x145b79970
0x145b7994c: jmp 0x145b79982
0x145b7994e: add r12, 3
0x145b79952: shl ecx, 0xc
0x145b79955: or r13d, ecx
0x145b79958: lea ecx, [r13 - 0x30]
0x145b7995c: cmp ecx, 0xa
0x145b7995f: jb 0x145b79982
0x145b79961: nop word ptr cs:[rax + rax]
0x145b79970: mov ecx, r13d
0x145b79973: and ecx, 0xffffffdf
0x145b79976: add ecx, -0x41
0x145b79979: cmp ecx, 0x19
0x145b7997c: ja 0x145b798ab
0x145b79982: mov r15d, 1
0x145b79988: cmp r13d, 0x80
0x145b7998f: jb 0x145b799b1
0x145b79991: mov r15d, 2
0x145b79997: cmp r13d, 0x800
0x145b7999e: jb 0x145b799b1
0x145b799a0: cmp r13d, 0x10000
0x145b799a7: mov r15d, 4
0x145b799ad: sbb r15, 0
0x145b799b1: mov rcx, qword ptr [rbp - 0x40]
0x145b799b5: sub rcx, rbx
0x145b799b8: cmp r15, rcx
0x145b799bb: ja 0x145b79a46
0x145b799c1: cmp r13d, 0x80
0x145b799c8: jb 0x145b798a0
0x145b799ce: mov ecx, r13d
0x145b799d1: and cl, 0x3f
0x145b799d4: or cl, 0x80
0x145b799d7: mov edx, r13d
0x145b799da: shr edx, 6
0x145b799dd: cmp r13d, 0x800
0x145b799e4: jae 0x145b799f5
0x145b799e6: or dl, 0xc0
0x145b799e9: mov byte ptr [rax + rbx], dl
0x145b799ec: mov byte ptr [rax + rbx + 1], cl
0x145b799f0: jmp 0x145b798a4
0x145b799f5: and dl, 0x3f
0x145b799f8: or dl, 0x80
0x145b799fb: mov r8d, r13d
0x145b799fe: shr r8d, 0xc
0x145b79a02: cmp r13d, 0xffff
0x145b79a09: ja 0x145b79a20
0x145b79a0b: or r8b, 0xe0
0x145b79a0f: mov byte ptr [rax + rbx], r8b
0x145b79a13: mov byte ptr [rax + rbx + 1], dl
0x145b79a17: mov byte ptr [rax + rbx + 2], cl
0x145b79a1b: jmp 0x145b798a4
0x145b79a20: and r8b, 0x3f
0x145b79a24: or r8b, 0x80
0x145b79a28: shr r13d, 0x12
0x145b79a2c: or r13b, 0xf0
0x145b79a30: mov byte ptr [rax + rbx], r13b
0x145b79a34: mov byte ptr [rax + rbx + 1], r8b
0x145b79a39: mov byte ptr [rax + rbx + 2], dl
0x145b79a3d: mov byte ptr [rax + rbx + 3], cl
0x145b79a41: jmp 0x145b798a4
0x145b79a46: mov rcx, r14
0x145b79a49: mov rdx, rbx
0x145b79a4c: mov r8, r15
0x145b79a4f: call 0x145e9e020
0x145b79a54: nop
0x145b79a55: mov rax, qword ptr [rbp - 0x38]
0x145b79a59: cmp r13d, 0x80
0x145b79a60: jb 0x145b798a0
0x145b79a66: jmp 0x145b799ce
0x145b79a6b: mov rax, qword ptr [rbp - 0x30]
0x145b79a6f: mov qword ptr [rsi + 0x10], rax
0x145b79a73: movups xmm0, xmmword ptr [rbp - 0x40]
0x145b79a77: movups xmmword ptr [rsi], xmm0
0x145b79a7a: mov r8d, 1
0x145b79a80: mov rcx, qword ptr [rbp - 0x48]
0x145b79a84: mov rdx, qword ptr [rbp - 0x50]
0x145b79a88: call 0x1400021d0
0x145b79a8d: jmp 0x145b79832
