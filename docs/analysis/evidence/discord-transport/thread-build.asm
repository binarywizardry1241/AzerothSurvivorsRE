140046860	push	rbp
140046861	push	r15
140046863	push	r14
140046865	push	r12
140046867	push	rsi
140046868	push	rdi
140046869	push	rbx
14004686a	sub	rsp, 0x100
140046871	lea	rbp, [rsp + 0x80]
140046879	mov	qword ptr [rbp + 0x78], 0xfffffffffffffffe
140046881	mov	rdi, r9
140046884	mov	qword ptr [rbp + 0x50], rdx
140046888	mov	rsi, rcx
14004688b	mov	rbx, qword ptr [rbp + 0xf8]
140046892	mov	r14, qword ptr [rbp + 0xf0]
140046899	mov	r15, qword ptr [rbp + 0xe8]
1400468a0	mov	qword ptr [rbp - 0x60], r14
1400468a4	mov	qword ptr [rbp - 0x58], rbx
1400468a8	test	r8b, 1
1400468ac	jne	0x140046a29
1400468b2	mov	r12, qword ptr [rip + 0x8044127]
1400468b9	mov	rdi, qword ptr [r12]
1400468bd	test	rdi, rdi
1400468c0	je	0x1400468ca
1400468c2	dec	rdi
1400468c5	jmp	0x140046a29
1400468ca	mov	byte ptr [rbp + 0x77], 1
1400468ce	mov	byte ptr [rbp + 0x76], 1
1400468d2	mov	byte ptr [rbp + 0x75], 1
1400468d6	lea	rdx, [rip + 0x5d628eb]
1400468dd	lea	rcx, [rbp + 0x10]
1400468e1	mov	r8d, 0xe
1400468e7	call	0x145bb9990
1400468ec	nop
1400468ed	mov	rax, qword ptr [rbp + 0x10]
1400468f1	cmp	rax, -1
1400468f5	je	0x14004694a
1400468f7	mov	qword ptr [rbp + 0x60], rax
1400468fb	mov	rdx, qword ptr [rbp + 0x18]
1400468ff	mov	r8, qword ptr [rbp + 0x20]
140046903	lea	rcx, [rbp - 0x30]
140046907	mov	qword ptr [rbp + 8], rdx
14004690b	call	0x145bd5650
140046910	nop
140046911	cmp	dword ptr [rbp - 0x30], 1
140046915	je	0x1400469e7
14004691b	mov	rcx, qword ptr [rbp - 0x20]
14004691f	test	rcx, rcx
140046922	je	0x1400469e7
140046928	mov	r8, qword ptr [rbp - 0x28]
14004692c	cmp	rcx, 1
140046930	jne	0x140046954
140046932	movzx	eax, byte ptr [r8]
140046936	cmp	eax, 0x2b
140046939	je	0x1400469e7
14004693f	cmp	eax, 0x2d
140046942	je	0x1400469e7
140046948	jmp	0x140046958
14004694a	mov	edi, 0x200000
14004694f	jmp	0x140046a21
140046954	movzx	eax, byte ptr [r8]
140046958	xor	r9d, r9d
14004695b	cmp	al, 0x2b
14004695d	sete	r9b
140046961	mov	rdx, rcx
140046964	sub	rdx, r9
140046967	add	r8, r9
14004696a	mov	rax, r9
14004696d	neg	rax
140046970	cmp	rdx, 0x11
140046974	jae	0x1400469a9
140046976	test	rdx, rdx
140046979	je	0x1400469f7
14004697b	add	rcx, rax
14004697e	neg	rcx
140046981	xor	edi, edi
140046983	xor	eax, eax
140046985	movzx	edx, byte ptr [r8 + rax]
14004698a	add	edx, -0x30
14004698d	cmp	edx, 9
140046990	ja	0x140046a04
140046992	lea	r9, [rdi + rdi*4]
140046996	mov	edx, edx
140046998	lea	rdi, [rdx + r9*2]
14004699c	inc	rax
14004699f	mov	rdx, rcx
1400469a2	add	rdx, rax
1400469a5	jne	0x140046985
1400469a7	jmp	0x140046a09
1400469a9	add	rcx, rax
1400469ac	neg	rcx
1400469af	xor	edi, edi
1400469b1	mov	r9d, 0xa
1400469b7	xor	r10d, r10d
1400469ba	mov	rax, rcx
1400469bd	add	rax, r10
1400469c0	je	0x140046a09
1400469c2	mov	rax, rdi
1400469c5	mul	r9
1400469c8	jo	0x1400469e7
1400469ca	mov	rdi, rax
1400469cd	movzx	edx, byte ptr [r8 + r10]
1400469d2	add	edx, -0x30
1400469d5	add	rdi, rdx
1400469d8	setb	al
1400469db	cmp	edx, 9
1400469de	ja	0x1400469e7
1400469e0	inc	r10
1400469e3	test	al, al
1400469e5	je	0x1400469ba
1400469e7	mov	edi, 0x200000
1400469ec	mov	rdx, qword ptr [rbp + 0x60]
1400469f0	test	rdx, rdx
1400469f3	jne	0x140046a12
1400469f5	jmp	0x140046a21
1400469f7	xor	edi, edi
1400469f9	mov	rdx, qword ptr [rbp + 0x60]
1400469fd	test	rdx, rdx
140046a00	jne	0x140046a12
140046a02	jmp	0x140046a21
140046a04	mov	edi, 0x200000
140046a09	mov	rdx, qword ptr [rbp + 0x60]
140046a0d	test	rdx, rdx
140046a10	je	0x140046a21
140046a12	mov	r8d, 1
140046a18	mov	rcx, qword ptr [rbp + 8]
140046a1c	call	0x1400021d0
140046a21	lea	rax, [rdi + 1]
140046a25	mov	qword ptr [r12], rax
140046a29	mov	byte ptr [rbp + 0x77], 1
140046a2d	mov	byte ptr [rbp + 0x76], 1
140046a31	mov	byte ptr [rbp + 0x75], 1
140046a35	call	0x145ba4a80
140046a3a	nop
140046a3b	mov	byte ptr [rbp + 0x77], 1
140046a3f	mov	byte ptr [rbp + 0x76], 1
140046a43	mov	byte ptr [rbp + 0x75], 0
140046a47	mov	rcx, rax
140046a4a	mov	rdx, qword ptr [rbp + 0x50]
140046a4e	call	0x145baed70
140046a53	nop
140046a54	movzx	ecx, byte ptr [rbp + 0xe0]
140046a5b	mov	qword ptr [rbp + 0x68], rax
140046a5f	test	cl, cl
140046a61	je	0x140046a7c
140046a63	mov	qword ptr [rbp - 0x50], 0
140046a6b	mov	qword ptr [rbp - 0x48], 8
140046a73	xorps	xmm0, xmm0
140046a76	movups	xmmword ptr [rbp - 0x40], xmm0
140046a7a	jmp	0x140046a92
140046a7c	mov	byte ptr [rbp + 0x73], 1
140046a80	mov	byte ptr [rbp + 0x72], 1
140046a84	lea	rcx, [rbp - 0x50]
140046a88	lea	rdx, [rbp + 0x68]
140046a8c	call	0x145bb7890
140046a91	nop
140046a92	mov	qword ptr [rbp + 0x10], 1
140046a9a	mov	qword ptr [rbp + 0x18], 1
140046aa2	mov	qword ptr [rbp + 0x20], r15
140046aa6	mov	qword ptr [rbp + 0x28], 0
140046aae	call	0x140002200
140046ab3	mov	ecx, 0x30
140046ab8	mov	edx, 8
140046abd	call	0x1400021c0
140046ac2	test	rax, rax
140046ac5	mov	qword ptr [rbp + 0x60], rax
140046ac9	je	0x140046c5b
140046acf	movups	xmm0, xmmword ptr [rbp + 0x10]
140046ad3	movups	xmm1, xmmword ptr [rbp + 0x20]
140046ad7	movups	xmm2, xmmword ptr [rbp + 0x30]
140046adb	movups	xmmword ptr [rax + 0x20], xmm2
140046adf	movups	xmmword ptr [rax + 0x10], xmm1
140046ae3	movups	xmmword ptr [rax], xmm0
140046ae6	mov	qword ptr [rbp + 0x58], rax
140046aea	lock inc	qword ptr [rax]
140046aee	jle	0x140046c8f
140046af4	mov	qword ptr [rbp - 0x30], r14
140046af8	mov	qword ptr [rbp - 0x28], rbx
140046afc	movups	xmm0, xmmword ptr [rbp - 0x50]
140046b00	movups	xmm1, xmmword ptr [rbp - 0x40]
140046b04	movups	xmmword ptr [rbp - 0x10], xmm1
140046b08	movups	xmmword ptr [rbp - 0x20], xmm0
140046b0c	mov	qword ptr [rbp], rax
140046b10	mov	rcx, qword ptr [rax + 0x10]
140046b14	test	rcx, rcx
140046b17	je	0x140046b27
140046b19	add	rcx, 0x10
140046b1d	mov	byte ptr [rbp + 0x74], 1
140046b21	call	0x145ba4b00
140046b26	nop
140046b27	mov	rax, qword ptr [rbp]
140046b2b	mov	qword ptr [rbp + 0x40], rax
140046b2f	mov	rax, qword ptr [rbp - 0x30]
140046b33	mov	rcx, qword ptr [rbp - 0x28]
140046b37	movups	xmm0, xmmword ptr [rbp - 0x20]
140046b3b	movups	xmm1, xmmword ptr [rbp - 0x10]
140046b3f	movaps	xmmword ptr [rbp + 0x30], xmm1
140046b43	movaps	xmmword ptr [rbp + 0x20], xmm0
140046b47	mov	qword ptr [rbp + 0x10], rax
140046b4b	mov	qword ptr [rbp + 0x18], rcx
140046b4f	call	0x140002200
140046b54	mov	ecx, 0x38
140046b59	mov	edx, 8
140046b5e	call	0x1400021c0
140046b63	test	rax, rax
140046b66	je	0x140046c6d
140046b6c	mov	rcx, qword ptr [rbp]
140046b70	mov	qword ptr [rax + 0x30], rcx
140046b74	movups	xmm0, xmmword ptr [rbp - 0x30]
140046b78	movups	xmm1, xmmword ptr [rbp - 0x20]
140046b7c	movups	xmm2, xmmword ptr [rbp - 0x10]
140046b80	movups	xmmword ptr [rax + 0x20], xmm2
140046b84	movups	xmmword ptr [rax + 0x10], xmm1
140046b88	movups	xmmword ptr [rax], xmm0
140046b8b	mov	rcx, qword ptr [rbp + 0x68]
140046b8f	lock inc	qword ptr [rcx]
140046b93	jle	0x140046c8f
140046b99	mov	rcx, qword ptr [rbp + 0x68]
140046b9d	mov	qword ptr [rbp + 0x10], rcx
140046ba1	mov	qword ptr [rbp + 0x18], rax
140046ba5	lea	rax, [rip + 0x5d62524]
140046bac	mov	qword ptr [rbp + 0x20], rax
140046bb0	call	0x140002200
140046bb5	mov	ecx, 0x18
140046bba	mov	edx, 8
140046bbf	call	0x1400021c0
140046bc4	test	rax, rax
140046bc7	je	0x140046c7f
140046bcd	mov	rcx, qword ptr [rbp + 0x20]
140046bd1	mov	qword ptr [rax + 0x10], rcx
140046bd5	movups	xmm0, xmmword ptr [rbp + 0x10]
140046bd9	movups	xmmword ptr [rax], xmm0
140046bdc	mov	byte ptr [rbp + 0x74], 0
140046be0	mov	rcx, rdi
140046be3	mov	rdx, rax
140046be6	call	0x145ba4b90
140046beb	nop
140046bec	cmp	rax, 1
140046bf0	jne	0x140046c33
140046bf2	mov	qword ptr [rsi + 8], rdx
140046bf6	mov	qword ptr [rsi], 0
140046bfd	mov	rax, qword ptr [rbp + 0x58]
140046c01	lock dec	qword ptr [rax]
140046c05	jne	0x140046c11
140046c07	lea	rcx, [rbp + 0x58]
140046c0b	call	0x145bb2690
140046c10	nop
140046c11	mov	rax, qword ptr [rbp + 0x68]
140046c15	lock dec	qword ptr [rax]
140046c19	jne	0x140046c46
140046c1b	mov	byte ptr [rbp + 0x77], 0
140046c1f	mov	byte ptr [rbp + 0x76], 0
140046c23	mov	byte ptr [rbp + 0x75], 0
140046c27	lea	rcx, [rbp + 0x68]
140046c2b	call	0x145bb27d0
140046c30	nop
140046c31	jmp	0x140046c46
140046c33	mov	rax, qword ptr [rbp + 0x68]
140046c37	mov	rcx, qword ptr [rbp + 0x58]
140046c3b	mov	qword ptr [rsi], rax
140046c3e	mov	qword ptr [rsi + 8], rcx
140046c42	mov	qword ptr [rsi + 0x10], rdx
140046c46	mov	rax, rsi
140046c49	add	rsp, 0x100
140046c50	pop	rbx
140046c51	pop	rdi
140046c52	pop	rsi
140046c53	pop	r12
140046c55	pop	r14
140046c57	pop	r15
140046c59	pop	rbp
140046c5a	ret
140046c5b	mov	ecx, 8
140046c60	mov	edx, 0x30
140046c65	call	0x145d992a1
140046c6a	nop
140046c6b	jmp	0x140046c8f
140046c6d	mov	ecx, 8
140046c72	mov	edx, 0x38
140046c77	call	0x145d992a1
140046c7c	nop
140046c7d	jmp	0x140046c8f
140046c7f	mov	ecx, 8
140046c84	mov	edx, 0x18
140046c89	call	0x145d992a1
140046c8e	nop
140046c8f	ud2
