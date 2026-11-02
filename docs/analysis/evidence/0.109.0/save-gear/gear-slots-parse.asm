1459c01c0	push	rbp
1459c01c1	push	r15
1459c01c3	push	r14
1459c01c5	push	r13
1459c01c7	push	r12
1459c01c9	push	rsi
1459c01ca	push	rdi
1459c01cb	push	rbx
1459c01cc	sub	rsp, 0xd8
1459c01d3	lea	rbp, [rsp + 0x80]
1459c01db	mov	qword ptr [rbp + 0x50], 0xfffffffffffffffe
1459c01e3	mov	rsi, rcx
1459c01e6	lea	rax, [rdx + 0x48]
1459c01ea	mov	qword ptr [rbp - 0x50], rax
1459c01ee	cmp	byte ptr [rdx + 0x41], 0
1459c01f2	jne	0x1459c027b
1459c01f8	mov	rbx, rdx
1459c01fb	lea	rdi, [rdx + 0x10]
1459c01ff	lea	r14, [rbp - 0x20]
1459c0203	lea	r15, [rbp - 0x50]
1459c0207	nop	word ptr [rax + rax]
1459c0210	mov	r12, qword ptr [rdi]
1459c0213	mov	rcx, r14
1459c0216	mov	rdx, rdi
1459c0219	call	0x1459c7330
1459c021e	cmp	dword ptr [rbp - 0x20], 1
1459c0222	jne	0x1459c0240
1459c0224	mov	r9, qword ptr [rbp - 0x18]
1459c0228	mov	rax, qword ptr [rbp - 0x10]
1459c022c	mov	rcx, qword ptr [rbx]
1459c022f	sub	r9, rcx
1459c0232	add	r12, rcx
1459c0235	mov	qword ptr [rbx], rax
1459c0238	jmp	0x1459c0261
1459c023a	nop	word ptr [rax + rax]
1459c0240	cmp	byte ptr [rbx + 0x41], 0
1459c0244	jne	0x1459c027b
1459c0246	mov	byte ptr [rbx + 0x41], 1
1459c024a	mov	r12, qword ptr [rbx]
1459c024d	mov	r9, qword ptr [rbx + 8]
1459c0251	sub	r9, r12
1459c0254	setne	al
1459c0257	or	al, byte ptr [rbx + 0x40]
1459c025a	cmp	al, 1
1459c025c	jne	0x1459c027b
1459c025e	add	r12, qword ptr [rdi]
1459c0261	mov	rcx, r14
1459c0264	mov	rdx, r15
1459c0267	mov	r8, r12
1459c026a	call	0x1458a9410
1459c026f	cmp	byte ptr [rbp - 0x20], 0
1459c0273	jne	0x1459c02a9
1459c0275	cmp	byte ptr [rbx + 0x41], 0
1459c0279	je	0x1459c0210
1459c027b	mov	qword ptr [rsi], 0
1459c0282	mov	qword ptr [rsi + 8], 8
1459c028a	mov	qword ptr [rsi + 0x10], 0
1459c0292	mov	rax, rsi
1459c0295	add	rsp, 0xd8
1459c029c	pop	rbx
1459c029d	pop	rdi
1459c029e	pop	rsi
1459c029f	pop	r12
1459c02a1	pop	r13
1459c02a3	pop	r14
1459c02a5	pop	r15
1459c02a7	pop	rbp
1459c02a8	ret
1459c02a9	mov	qword ptr [rbp - 0x38], rsi
1459c02ad	mov	rsi, qword ptr [rbp - 0x18]
1459c02b1	mov	edi, dword ptr [rbp - 0x10]
1459c02b4	call	0x140002200
1459c02b9	mov	ecx, 0x40
1459c02be	mov	edx, 8
1459c02c3	call	0x1400021c0
1459c02c8	test	rax, rax
1459c02cb	je	0x1459c0579
1459c02d1	mov	qword ptr [rax], rsi
1459c02d4	mov	dword ptr [rax + 8], edi
1459c02d7	mov	qword ptr [rbp + 0x30], 4
1459c02df	mov	qword ptr [rbp - 0x28], rax
1459c02e3	mov	qword ptr [rbp + 0x38], rax
1459c02e7	mov	qword ptr [rbp + 0x40], 1
1459c02ef	mov	rax, qword ptr [rbx + 0x40]
1459c02f3	mov	qword ptr [rbp + 0x20], rax
1459c02f7	movups	xmm0, xmmword ptr [rbx]
1459c02fa	movups	xmm1, xmmword ptr [rbx + 0x10]
1459c02fe	movups	xmm2, xmmword ptr [rbx + 0x20]
1459c0302	movups	xmm3, xmmword ptr [rbx + 0x30]
1459c0306	movaps	xmmword ptr [rbp + 0x10], xmm3
1459c030a	movaps	xmmword ptr [rbp], xmm2
1459c030e	movaps	xmmword ptr [rbp - 0x10], xmm1
1459c0312	movaps	xmmword ptr [rbp - 0x20], xmm0
1459c0316	lea	rax, [rbp + 0x28]
1459c031a	mov	qword ptr [rbp - 0x30], rax
1459c031e	cmp	byte ptr [rbp + 0x21], 0
1459c0322	je	0x1459c0344
1459c0324	mov	rax, qword ptr [rbp + 0x40]
1459c0328	mov	rsi, qword ptr [rbp - 0x38]
1459c032c	mov	qword ptr [rsi + 0x10], rax
1459c0330	mov	rax, qword ptr [rbp + 0x30]
1459c0334	mov	qword ptr [rsi], rax
1459c0337	mov	rax, qword ptr [rbp + 0x38]
1459c033b	mov	qword ptr [rsi + 8], rax
1459c033f	jmp	0x1459c0292
1459c0344	mov	eax, 1
1459c0349	mov	qword ptr [rbp + 0x48], rax
1459c034d	nop	dword ptr [rax]
1459c0350	mov	rsi, qword ptr [rbp - 8]
1459c0354	mov	r14, qword ptr [rbp + 8]
1459c0358	cmp	r14, rsi
1459c035b	seta	al
1459c035e	mov	rdi, qword ptr [rbp]
1459c0362	cmp	r14, rdi
1459c0365	setb	cl
1459c0368	or	cl, al
1459c036a	jne	0x1459c04a4
1459c0370	mov	r13, qword ptr [rbp - 0x10]
1459c0374	movzx	ebx, byte ptr [rbp + 0x18]
1459c0378	movzx	r15d, byte ptr [rbp + rbx + 0xf]
1459c037e	cmp	rbx, 5
1459c0382	jb	0x1459c0409
1459c0388	mov	r8, r14
1459c038b	sub	r8, rdi
1459c038e	lea	rax, [rdi + r13]
1459c0392	cmp	r8, 0xf
1459c0396	ja	0x1459c03b4
1459c0398	xor	edx, edx
1459c039a	test	r8, r8
1459c039d	je	0x1459c03b0
1459c039f	cmp	byte ptr [rax + rdx], r15b
1459c03a3	je	0x1459c03c2
1459c03a5	inc	rdx
1459c03a8	cmp	r8, rdx
1459c03ab	jne	0x1459c039f
1459c03ad	mov	rdx, r8
1459c03b0	xor	eax, eax
1459c03b2	jmp	0x1459c03c7
1459c03b4	mov	ecx, r15d
1459c03b7	mov	rdx, rax
1459c03ba	call	0x145bd5860
1459c03bf	nop
1459c03c0	jmp	0x1459c03c7
1459c03c2	mov	eax, 1
1459c03c7	cmp	rax, 1
1459c03cb	jne	0x1459c04a0
1459c03d1	add	rdi, rdx
1459c03d4	inc	rdi
1459c03d7	mov	qword ptr [rbp], rdi
1459c03db	cmp	rdi, rbx
1459c03de	setb	al
1459c03e1	cmp	rdi, rsi
1459c03e4	seta	cl
1459c03e7	or	cl, al
1459c03e9	je	0x1459c058a
1459c03ef	cmp	r14, rdi
1459c03f2	jae	0x1459c0388
1459c03f4	jmp	0x1459c04a4
1459c03f9	nop	dword ptr [rax]
1459c0400	cmp	r14, rdi
1459c0403	jb	0x1459c04a4
1459c0409	mov	r8, r14
1459c040c	sub	r8, rdi
1459c040f	lea	rax, [rdi + r13]
1459c0413	cmp	r8, 0x10
1459c0417	jae	0x1459c0440
1459c0419	xor	edx, edx
1459c041b	test	r8, r8
1459c041e	je	0x1459c0431
1459c0420	cmp	byte ptr [rax + rdx], r15b
1459c0424	je	0x1459c0489
1459c0426	inc	rdx
1459c0429	cmp	r8, rdx
1459c042c	jne	0x1459c0420
1459c042e	mov	rdx, r8
1459c0431	xor	eax, eax
1459c0433	cmp	rax, 1
1459c0437	je	0x1459c0452
1459c0439	jmp	0x1459c04a0
1459c043b	nop	dword ptr [rax + rax]
1459c0440	mov	ecx, r15d
1459c0443	mov	rdx, rax
1459c0446	call	0x145bd5860
1459c044b	nop
1459c044c	cmp	rax, 1
1459c0450	jne	0x1459c04a0
1459c0452	add	rdi, rdx
1459c0455	inc	rdi
1459c0458	mov	qword ptr [rbp], rdi
1459c045c	mov	r12, rdi
1459c045f	sub	r12, rbx
1459c0462	setb	al
1459c0465	cmp	rdi, rsi
1459c0468	seta	cl
1459c046b	or	cl, al
1459c046d	jne	0x1459c0400
1459c046f	lea	rcx, [r12 + r13]
1459c0473	lea	rdx, [rbp + 0x10]
1459c0477	mov	r8, rbx
1459c047a	call	0x145bfa0e1
1459c047f	test	eax, eax
1459c0481	jne	0x1459c0400
1459c0487	jmp	0x1459c04f8
1459c0489	mov	eax, 1
1459c048e	cmp	rax, 1
1459c0492	je	0x1459c0452
1459c0494	nop	word ptr cs:[rax + rax]
1459c04a0	mov	qword ptr [rbp], r14
1459c04a4	cmp	byte ptr [rbp + 0x21], 0
1459c04a8	jne	0x1459c0324
1459c04ae	mov	byte ptr [rbp + 0x21], 1
1459c04b2	mov	r13, qword ptr [rbp - 0x20]
1459c04b6	mov	r12, qword ptr [rbp - 0x18]
1459c04ba	sub	r12, r13
1459c04bd	setne	al
1459c04c0	or	al, byte ptr [rbp + 0x20]
1459c04c3	test	al, 1
1459c04c5	je	0x1459c0324
1459c04cb	add	r13, qword ptr [rbp - 0x10]
1459c04cf	lea	rcx, [rbp - 0x50]
1459c04d3	lea	rdx, [rbp - 0x30]
1459c04d7	mov	r8, r13
1459c04da	mov	r9, r12
1459c04dd	call	0x1458a9410
1459c04e2	nop
1459c04e3	cmp	byte ptr [rbp - 0x50], 0
1459c04e7	jne	0x1459c0508
1459c04e9	cmp	byte ptr [rbp + 0x21], 0
1459c04ed	je	0x1459c0350
1459c04f3	jmp	0x1459c0324
1459c04f8	mov	rax, qword ptr [rbp - 0x20]
1459c04fc	sub	r12, rax
1459c04ff	add	r13, rax
1459c0502	mov	qword ptr [rbp - 0x20], rdi
1459c0506	jmp	0x1459c04cf
1459c0508	mov	rsi, qword ptr [rbp - 0x48]
1459c050c	mov	edi, dword ptr [rbp - 0x40]
1459c050f	mov	rdx, qword ptr [rbp + 0x48]
1459c0513	cmp	rdx, qword ptr [rbp + 0x30]
1459c0517	mov	rcx, qword ptr [rbp - 0x28]
1459c051b	jne	0x1459c0544
1459c051d	mov	qword ptr [rsp + 0x20], 0x10
1459c0526	mov	r8d, 1
1459c052c	mov	r9d, 8
1459c0532	lea	rcx, [rbp + 0x30]
1459c0536	call	0x145bfa970
1459c053b	nop
1459c053c	mov	rcx, qword ptr [rbp + 0x38]
1459c0540	mov	rdx, qword ptr [rbp + 0x48]
1459c0544	mov	rax, rdx
1459c0547	shl	rax, 4
1459c054b	mov	qword ptr [rcx + rax], rsi
1459c054f	mov	qword ptr [rbp - 0x28], rcx
1459c0553	mov	dword ptr [rcx + rax + 8], edi
1459c0557	inc	rdx
1459c055a	mov	qword ptr [rbp + 0x48], rdx
1459c055e	mov	qword ptr [rbp + 0x40], rdx
1459c0562	lea	rax, [rbp + 0x28]
1459c0566	mov	qword ptr [rbp - 0x30], rax
1459c056a	cmp	byte ptr [rbp + 0x21], 0
1459c056e	je	0x1459c0350
1459c0574	jmp	0x1459c0324
1459c0579	mov	ecx, 8
1459c057e	mov	edx, 0x40
1459c0583	call	0x145d992bb
1459c0588	ud2
1459c058a	lea	r9, [rip + 0x187674f]
1459c0591	mov	r8d, 4
1459c0597	xor	ecx, ecx
1459c0599	mov	rdx, rbx
1459c059c	call	0x145d99860
1459c05a1	nop
1459c05a2	ud2
