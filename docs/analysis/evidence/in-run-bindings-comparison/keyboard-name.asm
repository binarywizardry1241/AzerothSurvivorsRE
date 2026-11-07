140728300	push	rbp
140728301	push	r15
140728303	push	r14
140728305	push	rsi
140728306	push	rdi
140728307	push	rbx
140728308	sub	rsp, 0xc8
14072830f	lea	rbp, [rsp + 0x80]
140728317	mov	qword ptr [rbp + 0x40], 0xfffffffffffffffe
14072831f	mov	ebx, r9d
140728322	mov	r14, r8
140728325	mov	rdi, rdx
140728328	mov	rsi, rcx
14072832b	call	0x145ba3770
140728330	cmp	byte ptr [rax + 0x10], 1
140728334	jne	0x14072865d
14072833a	mov	rcx, qword ptr [rax]
14072833d	mov	rdx, qword ptr [rax + 8]
140728341	lea	r8, [rcx + 1]
140728345	mov	qword ptr [rax], r8
140728348	movups	xmm0, xmmword ptr [rip + 0x577d0d1]
14072834f	movaps	xmmword ptr [rbp - 0x30], xmm0
140728353	movdqu	xmm0, xmmword ptr [rip + 0x577d0b5]
14072835b	movdqa	xmmword ptr [rbp - 0x40], xmm0
140728360	mov	qword ptr [rbp - 0x20], rcx
140728364	mov	qword ptr [rbp - 0x18], rdx
140728368	cmp	qword ptr [rdi + 0x90], 0
140728370	je	0x14072845a
140728376	mov	rcx, qword ptr [rdi + 0x78]
14072837a	mov	rdx, qword ptr [rdi + 0x80]
140728381	movabs	r8, 0x355708d3a0e6f47b
14072838b	xor	eax, eax
14072838d	movdqa	xmm0, xmmword ptr [rip + 0x5754b8b]
140728395	pcmpeqd	xmm1, xmm1
140728399	movdqa	xmm2, xmmword ptr [rip + 0x577b2af]
1407283a1	xor	r9d, r9d
1407283a4	and	r8, rdx
1407283a7	movdqu	xmm3, xmmword ptr [rcx + r8]
1407283ad	movdqa	xmm4, xmm3
1407283b1	pcmpeqb	xmm4, xmm0
1407283b5	pmovmskb	r10d, xmm4
1407283ba	test	r10d, r10d
1407283bd	je	0x140728400
1407283bf	tzcnt	r11d, r10d
1407283c4	add	r11, r8
1407283c7	and	r11, rdx
1407283ca	neg	r11
1407283cd	lea	r11, [r11 + r11*2]
1407283d1	movdqu	xmm4, xmmword ptr [rcx + r11*8 - 0x18]
1407283d8	pcmpeqb	xmm4, xmm2
1407283dc	pmovmskb	r15d, xmm4
1407283e1	cmp	r15d, 0xffff
1407283e8	je	0x14072841b
1407283ea	lea	r11d, [r10 - 1]
1407283ee	and	r11w, r10w
1407283f2	mov	r10d, r11d
1407283f5	jne	0x1407283bf
1407283f7	nop	word ptr [rax + rax]
140728400	pcmpeqb	xmm3, xmm1
140728404	pmovmskb	r10d, xmm3
140728409	test	r10d, r10d
14072840c	jne	0x14072845c
14072840e	add	r8, r9
140728411	add	r8, 0x10
140728415	add	r9, 0x10
140728419	jmp	0x1407283a4
14072841b	lea	rax, [rcx + r11*8]
14072841f	mov	rax, qword ptr [rax - 8]
140728423	cmp	rax, qword ptr [rdi + 0x218]
14072842a	jae	0x14072845a
14072842c	mov	rcx, qword ptr [rdi + 0x210]
140728433	mov	rcx, qword ptr [rcx + rax*8]
140728437	test	rcx, rcx
14072843a	je	0x14072845a
14072843c	mov	rax, qword ptr [rdi + 0x1e0]
140728443	not	rcx
140728446	imul	rcx, rcx, 0x38
14072844a	cmp	byte ptr [rax + rcx + 0x30], 1
14072844f	jne	0x14072845a
140728451	add	rax, rcx
140728454	mov	rax, qword ptr [rax + 0x10]
140728458	jmp	0x14072845c
14072845a	xor	eax, eax
14072845c	test	rax, rax
14072845f	lea	rcx, [rbp - 0x40]
140728463	cmovne	rcx, rax
140728467	mov	eax, dword ptr [r14 + 8]
14072846b	mov	dword ptr [rbp + 8], eax
14072846e	mov	rax, qword ptr [r14]
140728471	mov	qword ptr [rbp], rax
140728475	mov	rdi, rbp
140728478	mov	rdx, rdi
14072847b	call	0x140cc0080
140728480	nop
140728481	cmp	eax, -2
140728484	je	0x1407284aa
140728486	cmp	eax, -1
140728489	je	0x140728538
14072848f	lea	ecx, [rax - 0x61]
140728492	mov	edx, eax
140728494	and	edx, 0x5f
140728497	cmp	ecx, 0x1a
14072849a	cmovae	edx, eax
14072849d	mov	qword ptr [rbp + 0x28], 0
1407284a5	mov	dword ptr [rbp + 0x30], edx
1407284a8	jmp	0x1407284bc
1407284aa	mov	edx, dword ptr [r14]
1407284ad	lea	rcx, [rbp + 0x20]
1407284b1	call	0x1410ac3c0
1407284b6	cmp	dword ptr [rbp + 0x20], 1
1407284ba	jne	0x140728538
1407284bc	mov	rax, qword ptr [rbp + 0x28]
1407284c0	mov	qword ptr [rbp - 0x10], rax
1407284c4	mov	eax, dword ptr [rbp + 0x30]
1407284c7	mov	dword ptr [rbp - 8], eax
1407284ca	mov	eax, dword ptr [rbp + 0x34]
1407284cd	mov	dword ptr [rbp - 4], eax
1407284d0	mov	qword ptr [rbp + 0x20], 0
1407284d8	mov	qword ptr [rbp + 0x28], 1
1407284e0	mov	qword ptr [rbp + 0x30], 0
1407284e8	test	bl, bl
1407284ea	je	0x140728544
1407284ec	mov	qword ptr [rsp + 0x20], 1
1407284f5	lea	rcx, [rbp + 0x20]
1407284f9	mov	r8d, 4
1407284ff	mov	r9d, 1
140728505	xor	edx, edx
140728507	call	0x145bfa970
14072850c	nop
14072850d	mov	rax, qword ptr [rbp + 0x28]
140728511	mov	rdx, qword ptr [rbp + 0x30]
140728515	mov	dword ptr [rax + rdx], 0x2d544c41
14072851c	add	rdx, 4
140728520	mov	qword ptr [rbp + 0x30], rdx
140728524	cmp	byte ptr [rbp + 0xa0], 0
14072852b	jne	0x140728554
14072852d	cmp	byte ptr [rbp + 0xa8], 0
140728534	jne	0x140728582
140728536	jmp	0x1407285a9
140728538	mov	qword ptr [rsi], 0xffffffffffffffff
14072853f	jmp	0x14072864a
140728544	mov	eax, 1
140728549	xor	edx, edx
14072854b	cmp	byte ptr [rbp + 0xa0], 0
140728552	je	0x14072852d
140728554	mov	rcx, qword ptr [rbp + 0x20]
140728558	sub	rcx, rdx
14072855b	cmp	rcx, 4
14072855f	jbe	0x14072867c
140728565	mov	byte ptr [rax + rdx + 4], 0x2d
14072856a	mov	dword ptr [rax + rdx], 0x4c525443
140728571	add	rdx, 5
140728575	mov	qword ptr [rbp + 0x30], rdx
140728579	cmp	byte ptr [rbp + 0xa8], 0
140728580	je	0x1407285a9
140728582	mov	rcx, qword ptr [rbp + 0x20]
140728586	sub	rcx, rdx
140728589	cmp	rcx, 5
14072858d	jbe	0x1407286a8
140728593	mov	word ptr [rax + rdx + 4], 0x2d54
14072859a	mov	dword ptr [rax + rdx], 0x46494853
1407285a1	add	rdx, 6
1407285a5	mov	qword ptr [rbp + 0x30], rdx
1407285a9	mov	rax, qword ptr [rbp + 0x30]
1407285ad	mov	qword ptr [rbp + 0x10], rax
1407285b1	movdqu	xmm0, xmmword ptr [rbp + 0x20]
1407285b6	movdqa	xmmword ptr [rbp], xmm0
1407285bb	mov	qword ptr [rbp + 0x20], rdi
1407285bf	lea	rax, [rip - 0x7264e6]
1407285c6	mov	qword ptr [rbp + 0x28], rax
1407285ca	lea	rax, [rbp - 0x10]
1407285ce	mov	qword ptr [rbp + 0x30], rax
1407285d2	lea	rax, [rip + 0x989c97]
1407285d9	mov	qword ptr [rbp + 0x38], rax
1407285dd	lea	rdx, [rip + 0x577fd95]
1407285e4	lea	rcx, [rbp - 0x58]
1407285e8	lea	r8, [rbp + 0x20]
1407285ec	call	0x145bcce30
1407285f1	nop
1407285f2	mov	rdx, qword ptr [rbp]
1407285f6	test	rdx, rdx
1407285f9	je	0x14072860a
1407285fb	mov	rcx, qword ptr [rbp + 8]
1407285ff	mov	r8d, 1
140728605	call	0x1400021d0
14072860a	mov	rax, qword ptr [rbp - 0x48]
14072860e	mov	qword ptr [rsi + 0x10], rax
140728612	movdqu	xmm0, xmmword ptr [rbp - 0x58]
140728617	movdqu	xmmword ptr [rsi], xmm0
14072861b	mov	rdx, qword ptr [rbp - 0x38]
14072861f	test	rdx, rdx
140728622	je	0x14072864a
140728624	mov	rax, rdx
140728627	shl	rax, 4
14072862b	add	rdx, rax
14072862e	add	rdx, 0x21
140728632	je	0x14072864a
140728634	mov	rcx, qword ptr [rbp - 0x40]
140728638	sub	rcx, rax
14072863b	add	rcx, -0x10
14072863f	mov	r8d, 0x10
140728645	call	0x1400021d0
14072864a	mov	rax, rsi
14072864d	add	rsp, 0xc8
140728654	pop	rbx
140728655	pop	rdi
140728656	pop	rsi
140728657	pop	r14
140728659	pop	r15
14072865b	pop	rbp
14072865c	ret
14072865d	mov	r15, rax
140728660	call	0x145bb7390
140728665	mov	rcx, rax
140728668	mov	rax, r15
14072866b	mov	qword ptr [r15], rcx
14072866e	mov	qword ptr [r15 + 8], rdx
140728672	mov	byte ptr [r15 + 0x10], 1
140728677	jmp	0x140728341
14072867c	mov	qword ptr [rsp + 0x20], 1
140728685	lea	rcx, [rbp + 0x20]
140728689	mov	r8d, 5
14072868f	mov	r9d, 1
140728695	call	0x145bfa970
14072869a	nop
14072869b	mov	rax, qword ptr [rbp + 0x28]
14072869f	mov	rdx, qword ptr [rbp + 0x30]
1407286a3	jmp	0x140728565
1407286a8	mov	qword ptr [rsp + 0x20], 1
1407286b1	lea	rcx, [rbp + 0x20]
1407286b5	mov	r8d, 6
1407286bb	mov	r9d, 1
1407286c1	call	0x145bfa970
1407286c6	nop
1407286c7	mov	rax, qword ptr [rbp + 0x28]
1407286cb	mov	rdx, qword ptr [rbp + 0x30]
1407286cf	jmp	0x140728593
