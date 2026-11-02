140105ab0	push	rbp
140105ab1	push	r15
140105ab3	push	r14
140105ab5	push	r13
140105ab7	push	r12
140105ab9	push	rsi
140105aba	push	rdi
140105abb	push	rbx
140105abc	sub	rsp, 0x168
140105ac3	lea	rbp, [rsp + 0x80]
140105acb	mov	qword ptr [rbp + 0xe0], 0xfffffffffffffffe
140105ad6	mov	rsi, qword ptr [rcx + 0x18]
140105ada	mov	qword ptr [rcx + 0x18], 0xffffffffffffffff
140105ae2	cmp	rsi, -1
140105ae6	je	0x140105cbf
140105aec	mov	rbx, r8
140105aef	mov	r14, rdx
140105af2	mov	qword ptr [rbp + 0xa0], rsi
140105af9	movups	xmm0, xmmword ptr [rcx + 0x20]
140105afd	movups	xmm1, xmmword ptr [rcx + 0x30]
140105b01	movups	xmmword ptr [rbp + 0xa8], xmm0
140105b08	movups	xmmword ptr [rbp + 0xb8], xmm1
140105b0f	mov	rax, qword ptr [rcx + 0x40]
140105b13	mov	qword ptr [rbp + 0xc8], rax
140105b1a	mov	byte ptr [rbp + 0xdf], 1
140105b21	lea	rcx, [rbp + 0x88]
140105b28	lea	rdx, [rbp + 0xa0]
140105b2f	call	0x1400af1a0
140105b34	nop
140105b35	mov	rdi, qword ptr [rbp + 0xc8]
140105b3c	lea	r15, [rdi*4]
140105b44	mov	rax, rdi
140105b47	shr	rax, 0x3e
140105b4b	setne	al
140105b4e	movabs	rcx, 0x7ffffffffffffffc
140105b58	cmp	r15, rcx
140105b5b	seta	cl
140105b5e	or	cl, al
140105b60	je	0x140105b73
140105b62	xor	r13d, r13d
140105b65	mov	rcx, r13
140105b68	mov	rdx, r15
140105b6b	call	0x145d992bb
140105b70	nop
140105b71	ud2
140105b73	mov	rax, qword ptr [rbp + 0xc0]
140105b7a	mov	qword ptr [rbp + 0xd0], rax
140105b81	test	r15, r15
140105b84	je	0x140105cd3
140105b8a	call	0x140002200
140105b8f	mov	r13d, 4
140105b95	mov	edx, 4
140105b9a	mov	rcx, r15
140105b9d	call	0x1400021c0
140105ba2	test	rax, rax
140105ba5	je	0x140105b65
140105ba7	mov	r12, rax
140105baa	mov	r13, rdi
140105bad	test	rdi, rdi
140105bb0	je	0x140105bc4
140105bb2	mov	rcx, r12
140105bb5	mov	rdx, qword ptr [rbp + 0xd0]
140105bbc	mov	r8, r15
140105bbf	call	0x145bfa0e7
140105bc4	mov	rax, qword ptr [rbp + 0x98]
140105bcb	mov	qword ptr [rbp - 0x50], rax
140105bcf	movups	xmm0, xmmword ptr [rbp + 0x88]
140105bd6	movaps	xmmword ptr [rbp - 0x60], xmm0
140105bda	mov	qword ptr [rbp - 0x48], r13
140105bde	mov	qword ptr [rbp - 0x40], r12
140105be2	mov	qword ptr [rbp - 0x38], rdi
140105be6	mov	byte ptr [rbp + 0xdf], 1
140105bed	lea	rcx, [rbp - 0x60]
140105bf1	mov	rdx, r14
140105bf4	call	0x1458d8080
140105bf9	nop
140105bfa	test	al, al
140105bfc	je	0x140105c3f
140105bfe	movups	xmm0, xmmword ptr [rbp + 0xa0]
140105c05	movups	xmm1, xmmword ptr [rbp + 0xb0]
140105c0c	movups	xmm2, xmmword ptr [rbp + 0xc0]
140105c13	movups	xmmword ptr [rbp - 0x38], xmm2
140105c17	movups	xmmword ptr [rbp - 0x48], xmm1
140105c1b	movups	xmmword ptr [rbp - 0x58], xmm0
140105c1f	mov	dword ptr [rbp - 0x60], 0x11
140105c26	mov	byte ptr [rbp + 0xdf], 0
140105c2d	lea	rdx, [rbp - 0x60]
140105c31	mov	rcx, rbx
140105c34	call	0x1401838a0
140105c39	nop
140105c3a	jmp	0x140105cbf
140105c3f	mov	rbx, qword ptr [rbp + 0xa8]
140105c46	mov	rdi, qword ptr [rbp + 0xb0]
140105c4d	test	rdi, rdi
140105c50	je	0x140105c82
140105c52	lea	r14, [rbx + 8]
140105c56	jmp	0x140105c69
140105c58	nop	dword ptr [rax + rax]
140105c60	add	r14, 0x20
140105c64	dec	rdi
140105c67	je	0x140105c82
140105c69	mov	rdx, qword ptr [r14 - 8]
140105c6d	test	rdx, rdx
140105c70	je	0x140105c60
140105c72	mov	rcx, qword ptr [r14]
140105c75	mov	r8d, 1
140105c7b	call	0x1400021d0
140105c80	jmp	0x140105c60
140105c82	test	rsi, rsi
140105c85	je	0x140105c9c
140105c87	shl	rsi, 5
140105c8b	mov	r8d, 8
140105c91	mov	rcx, rbx
140105c94	mov	rdx, rsi
140105c97	call	0x1400021d0
140105c9c	mov	rdx, qword ptr [rbp + 0xb8]
140105ca3	test	rdx, rdx
140105ca6	je	0x140105cbf
140105ca8	shl	rdx, 2
140105cac	mov	r8d, 4
140105cb2	mov	rcx, qword ptr [rbp + 0xd0]
140105cb9	call	0x1400021d0
140105cbe	nop
140105cbf	add	rsp, 0x168
140105cc6	pop	rbx
140105cc7	pop	rdi
140105cc8	pop	rsi
140105cc9	pop	r12
140105ccb	pop	r13
140105ccd	pop	r14
140105ccf	pop	r15
140105cd1	pop	rbp
140105cd2	ret
140105cd3	mov	r12d, 4
140105cd9	xor	r13d, r13d
140105cdc	test	rdi, rdi
140105cdf	jne	0x140105bb2
140105ce5	jmp	0x140105bc4
