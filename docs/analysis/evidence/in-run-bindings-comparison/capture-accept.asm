14001eb10	push	rbp
14001eb11	push	r15
14001eb13	push	r14
14001eb15	push	rsi
14001eb16	push	rdi
14001eb17	push	rbx
14001eb18	sub	rsp, 0x78
14001eb1c	lea	rbp, [rsp + 0x70]
14001eb21	mov	qword ptr [rbp], 0xfffffffffffffffe
14001eb29	mov	r14, qword ptr [r8]
14001eb2c	cmp	r14, -1
14001eb30	je	0x14001ed2c
14001eb36	mov	r15, qword ptr [r8 + 8]
14001eb3a	cmp	qword ptr [rcx + 0x90], 0
14001eb42	je	0x14001ecd1
14001eb48	mov	rax, qword ptr [r8 + 0x10]
14001eb4c	mov	r8, qword ptr [rcx + 0x78]
14001eb50	mov	r9, qword ptr [rcx + 0x80]
14001eb57	movabs	r10, 0x7c00e6ba9569de82
14001eb61	xor	r11d, r11d
14001eb64	movdqa	xmm0, xmmword ptr [rip + 0x5d7ea84]
14001eb6c	pcmpeqd	xmm1, xmm1
14001eb70	movdqa	xmm2, xmmword ptr [rip + 0x5d7ea88]
14001eb78	and	r10, r9
14001eb7b	movdqu	xmm3, xmmword ptr [r8 + r10]
14001eb81	movdqa	xmm4, xmm3
14001eb85	pcmpeqb	xmm4, xmm0
14001eb89	pmovmskb	esi, xmm4
14001eb8d	test	esi, esi
14001eb8f	je	0x14001ebd0
14001eb91	tzcnt	edi, esi
14001eb95	add	rdi, r10
14001eb98	and	rdi, r9
14001eb9b	neg	rdi
14001eb9e	lea	rdi, [rdi + rdi*2]
14001eba2	movdqu	xmm4, xmmword ptr [r8 + rdi*8 - 0x18]
14001eba9	pcmpeqb	xmm4, xmm2
14001ebad	pmovmskb	ebx, xmm4
14001ebb1	cmp	ebx, 0xffff
14001ebb7	je	0x14001ebed
14001ebb9	lea	edi, [rsi - 1]
14001ebbc	and	di, si
14001ebbf	mov	esi, edi
14001ebc1	jne	0x14001eb91
14001ebc3	nop	word ptr cs:[rax + rax]
14001ebd0	pcmpeqb	xmm3, xmm1
14001ebd4	pmovmskb	esi, xmm3
14001ebd8	test	esi, esi
14001ebda	jne	0x14001ecd1
14001ebe0	add	r10, r11
14001ebe3	add	r10, 0x10
14001ebe7	add	r11, 0x10
14001ebeb	jmp	0x14001eb78
14001ebed	lea	r8, [r8 + rdi*8]
14001ebf1	mov	r8, qword ptr [r8 - 8]
14001ebf5	cmp	r8, qword ptr [rcx + 0x218]
14001ebfc	jae	0x14001ecd1
14001ec02	mov	r9, qword ptr [rcx + 0x210]
14001ec09	mov	r9, qword ptr [r9 + r8*8]
14001ec0d	test	r9, r9
14001ec10	je	0x14001ecd1
14001ec16	mov	r8, qword ptr [rcx + 0x1e0]
14001ec1d	not	r9
14001ec20	imul	r9, r9, 0x38
14001ec24	cmp	byte ptr [r8 + r9 + 0x30], 0
14001ec2a	je	0x14001ecd1
14001ec30	add	r8, r9
14001ec33	mov	r10, qword ptr [r8 + 0x10]
14001ec37	mov	r9d, dword ptr [rcx + 0x5b0]
14001ec3e	mov	dword ptr [r8 + 0x2c], r9d
14001ec42	mov	r8, qword ptr [r10 + 0x90]
14001ec49	mov	r9, qword ptr [r10 + 0xa8]
14001ec50	mov	qword ptr [r10 + 0x90], 0xffffffffffffffff
14001ec5b	cmp	r8, -1
14001ec5f	je	0x14001ed0a
14001ec65	mov	qword ptr [rbp - 0x10], r8
14001ec69	mov	rsi, rcx
14001ec6c	mov	r11, qword ptr [r10 + 0x98]
14001ec73	mov	r8, qword ptr [r10 + 0xa0]
14001ec7a	mov	rdi, rdx
14001ec7d	lea	rcx, [rdx + 0x48]
14001ec81	mov	qword ptr [rbp - 0x28], r14
14001ec85	mov	qword ptr [rbp - 0x40], r14
14001ec89	mov	qword ptr [rbp - 0x20], r15
14001ec8d	mov	qword ptr [rbp - 0x38], r15
14001ec91	mov	qword ptr [rbp - 0x30], rax
14001ec95	lea	rax, [rbp - 0x40]
14001ec99	mov	qword ptr [rsp + 0x20], rax
14001ec9e	mov	qword ptr [rbp - 0x18], r11
14001eca2	mov	rdx, r11
14001eca5	call	0x14001bec0
14001ecaa	nop
14001ecab	mov	rdx, qword ptr [rdi + 0x50]
14001ecaf	mov	r8, qword ptr [rdi + 0x58]
14001ecb3	mov	rcx, rsi
14001ecb6	call	0x14001b9a0
14001ecbb	nop
14001ecbc	mov	rdx, qword ptr [rbp - 0x10]
14001ecc0	test	rdx, rdx
14001ecc3	je	0x14001ed2c
14001ecc5	mov	r8d, 1
14001eccb	mov	rcx, qword ptr [rbp - 0x18]
14001eccf	jmp	0x14001ed1b
14001ecd1	mov	qword ptr [rbp - 0x20], r15
14001ecd5	mov	qword ptr [rbp - 0x28], r14
14001ecd9	lea	rax, [rbp - 2]
14001ecdd	mov	qword ptr [rbp - 0x40], rax
14001ece1	lea	rax, [rip + 0x4fde618]
14001ece8	mov	qword ptr [rbp - 0x38], rax
14001ecec	mov	byte ptr [rbp - 1], 0
14001ecf0	lea	rcx, [rip + 0x5d7f001]
14001ecf7	lea	r8, [rip + 0x5d86bea]
14001ecfe	lea	rdx, [rbp - 0x40]
14001ed02	call	0x145d99830
14001ed07	nop
14001ed08	ud2
14001ed0a	test	r14, r14
14001ed0d	je	0x14001ed2c
14001ed0f	mov	r8d, 1
14001ed15	mov	rcx, r15
14001ed18	mov	rdx, r14
14001ed1b	add	rsp, 0x78
14001ed1f	pop	rbx
14001ed20	pop	rdi
14001ed21	pop	rsi
14001ed22	pop	r14
14001ed24	pop	r15
14001ed26	pop	rbp
14001ed27	jmp	0x1400021d0
14001ed2c	add	rsp, 0x78
14001ed30	pop	rbx
14001ed31	pop	rdi
14001ed32	pop	rsi
14001ed33	pop	r14
14001ed35	pop	r15
14001ed37	pop	rbp
14001ed38	ret
