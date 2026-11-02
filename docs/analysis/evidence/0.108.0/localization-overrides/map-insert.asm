14599a6d0: push	rbp
14599a6d1: push	r15
14599a6d3: push	r14
14599a6d5: push	r13
14599a6d7: push	r12
14599a6d9: push	rsi
14599a6da: push	rdi
14599a6db: push	rbx
14599a6dc: sub	rsp, 0xb8
14599a6e3: lea	rbp, [rsp + 0x80]
14599a6eb: movdqa	xmmword ptr [rbp + 0x20], xmm8
14599a6f1: movdqa	xmmword ptr [rbp + 0x10], xmm7
14599a6f6: movaps	xmmword ptr [rbp], xmm6
14599a6fa: mov	qword ptr [rbp - 8], 0xfffffffffffffffe
14599a702: mov	rdi, r9
14599a705: mov	rsi, r8
14599a708: mov	rbx, rcx
14599a70b: lea	r15, [rcx + 0x20]
14599a70f: mov	rcx, r15
14599a712: mov	qword ptr [rbp - 0x10], rdx
14599a716: call	0x140017260
14599a71b: nop
14599a71c: mov	r14, rax
14599a71f: cmp	qword ptr [rbx + 0x10], 0
14599a724: je	0x14599a920
14599a72a: mov	qword ptr [rbp - 0x20], rsi
14599a72e: mov	r13, qword ptr [rbx]
14599a731: mov	r9, qword ptr [rbx + 8]
14599a735: mov	rsi, r14
14599a738: shr	rsi, 0x39
14599a73c: movd	xmm0, esi
14599a740: punpcklbw	xmm0, xmm0
14599a744: pshuflw	xmm0, xmm0, 0
14599a749: pshufd	xmm6, xmm0, 0x44
14599a74e: mov	r11, qword ptr [rbp - 0x10]
14599a752: mov	r15, qword ptr [r11 + 8]
14599a756: mov	r8, qword ptr [r11 + 0x10]
14599a75a: xor	edx, edx
14599a75c: pcmpeqd	xmm7, xmm7
14599a760: xor	ecx, ecx
14599a762: and	r14, r9
14599a765: movdqu	xmm8, xmmword ptr [r13 + r14]
14599a76c: movdqa	xmm0, xmm8
14599a771: pcmpeqb	xmm0, xmm6
14599a775: pmovmskb	r12d, xmm0
14599a77a: test	r12d, r12d
14599a77d: je	0x14599a800
14599a783: mov	qword ptr [rbp - 0x18], rdi
14599a787: mov	qword ptr [rbp - 0x48], r9
14599a78b: mov	qword ptr [rbp - 0x40], rbx
14599a78f: mov	qword ptr [rbp - 0x38], rcx
14599a793: mov	qword ptr [rbp - 0x30], rdx
14599a797: tzcnt	eax, r12d
14599a79c: add	rax, r14
14599a79f: and	rax, r9
14599a7a2: neg	rax
14599a7a5: lea	rax, [rax + rax*4]
14599a7a9: cmp	r8, qword ptr [r13 + rax*8 - 0x18]
14599a7ae: jne	0x14599a7d5
14599a7b0: lea	rdi, [rax*8]
14599a7b8: add	rdi, r13
14599a7bb: mov	rdx, qword ptr [rdi - 0x20]
14599a7bf: mov	rcx, r15
14599a7c2: mov	rbx, r8
14599a7c5: call	0x145bf2947
14599a7ca: mov	r8, rbx
14599a7cd: mov	r11, qword ptr [rbp - 0x10]
14599a7d1: test	eax, eax
14599a7d3: je	0x14599a849
14599a7d5: lea	eax, [r12 - 1]
14599a7da: and	ax, r12w
14599a7de: mov	r12d, eax
14599a7e1: mov	rdi, qword ptr [rbp - 0x18]
14599a7e5: mov	r9, qword ptr [rbp - 0x48]
14599a7e9: mov	rbx, qword ptr [rbp - 0x40]
14599a7ed: mov	rcx, qword ptr [rbp - 0x38]
14599a7f1: mov	rdx, qword ptr [rbp - 0x30]
14599a7f5: jne	0x14599a797
14599a7f7: nop	word ptr [rax + rax]
14599a800: cmp	rdx, 1
14599a804: mov	r10, qword ptr [rbp - 0x28]
14599a808: je	0x14599a81e
14599a80a: pmovmskb	eax, xmm8
14599a80f: test	eax, eax
14599a811: je	0x14599a833
14599a813: tzcnt	r10d, eax
14599a818: add	r10, r14
14599a81b: and	r10, r9
14599a81e: pcmpeqb	xmm8, xmm7
14599a823: pmovmskb	eax, xmm8
14599a828: test	eax, eax
14599a82a: jne	0x14599a87e
14599a82c: mov	edx, 1
14599a831: jmp	0x14599a835
14599a833: xor	edx, edx
14599a835: mov	qword ptr [rbp - 0x28], r10
14599a839: add	r14, rcx
14599a83c: add	r14, 0x10
14599a840: add	rcx, 0x10
14599a844: jmp	0x14599a762
14599a849: mov	rbx, qword ptr [rdi - 0x10]
14599a84d: mov	r14, qword ptr [rdi - 8]
14599a851: mov	rax, qword ptr [rbp - 0x20]
14599a855: mov	qword ptr [rdi - 0x10], rax
14599a859: mov	rax, qword ptr [rbp - 0x18]
14599a85d: mov	qword ptr [rdi - 8], rax
14599a861: mov	rdx, qword ptr [r11]
14599a864: test	rdx, rdx
14599a867: je	0x14599a8f9
14599a86d: mov	rcx, qword ptr [r11 + 8]
14599a871: mov	r8d, 1
14599a877: call	0x1400021d0
14599a87c: jmp	0x14599a8f9
14599a87e: movzx	eax, byte ptr [r13 + r10]
14599a884: test	al, al
14599a886: mov	rdx, qword ptr [rbp - 0x20]
14599a88a: jns	0x14599a939
14599a890: mov	rcx, qword ptr [r11 + 0x10]
14599a894: mov	qword ptr [rbp - 0x50], rcx
14599a898: movups	xmm0, xmmword ptr [r11]
14599a89c: movaps	xmmword ptr [rbp - 0x60], xmm0
14599a8a0: and	al, 1
14599a8a2: lea	rcx, [r10 - 0x10]
14599a8a6: and	rcx, r9
14599a8a9: mov	byte ptr [r13 + r10], sil
14599a8ae: mov	byte ptr [r13 + rcx + 0x10], sil
14599a8b3: movzx	eax, al
14599a8b6: movd	xmm0, eax
14599a8ba: shufpd	xmm0, xmmword ptr [rip + 0x3fccdd], 2
14599a8c3: movdqu	xmm1, xmmword ptr [rbx + 0x10]
14599a8c8: psubq	xmm1, xmm0
14599a8cc: movdqu	xmmword ptr [rbx + 0x10], xmm1
14599a8d1: neg	r10
14599a8d4: lea	rax, [r10 + r10*4]
14599a8d8: mov	rcx, qword ptr [rbp - 0x50]
14599a8dc: mov	qword ptr [r13 + rax*8 - 0x18], rcx
14599a8e1: movdqa	xmm0, xmmword ptr [rbp - 0x60]
14599a8e6: movdqu	xmmword ptr [r13 + rax*8 - 0x28], xmm0
14599a8ed: mov	qword ptr [r13 + rax*8 - 0x10], rdx
14599a8f2: mov	qword ptr [r13 + rax*8 - 8], rdi
14599a8f7: xor	ebx, ebx
14599a8f9: mov	rax, rbx
14599a8fc: mov	rdx, r14
14599a8ff: movaps	xmm6, xmmword ptr [rbp]
14599a903: movaps	xmm7, xmmword ptr [rbp + 0x10]
14599a907: movaps	xmm8, xmmword ptr [rbp + 0x20]
14599a90c: add	rsp, 0xb8
14599a913: pop	rbx
14599a914: pop	rdi
14599a915: pop	rsi
14599a916: pop	r12
14599a918: pop	r13
14599a91a: pop	r14
14599a91c: pop	r15
14599a91e: pop	rbp
14599a91f: ret
14599a920: mov	edx, 1
14599a925: mov	rcx, rbx
14599a928: mov	r8, r15
14599a92b: mov	r9b, 1
14599a92e: call	0x145d76fb0
14599a933: nop
14599a934: jmp	0x14599a72a
14599a939: movdqa	xmm0, xmmword ptr [r13]
14599a93f: pmovmskb	eax, xmm0
14599a943: tzcnt	r10d, eax
14599a948: movzx	eax, byte ptr [r13 + r10]
14599a94e: jmp	0x14599a890
