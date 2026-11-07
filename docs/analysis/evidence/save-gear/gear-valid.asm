14589bc20	push	r15
14589bc22	push	r14
14589bc24	push	rsi
14589bc25	push	rdi
14589bc26	push	rbp
14589bc27	push	rbx
14589bc28	sub	rsp, 0x98
14589bc2f	mov	r14, r8
14589bc32	mov	rsi, rcx
14589bc35	lea	eax, [rdx - 0x15f9b]
14589bc3b	cmp	eax, 0xe
14589bc3e	jb	0x14589bc4f
14589bc40	lea	eax, [rdx - 0x15f91]
14589bc46	cmp	eax, 5
14589bc49	ja	0x14589bce5
14589bc4f	cmp	r14, 0x12
14589bc53	jne	0x14589bce5
14589bc59	mov	rax, qword ptr [rsi + 8]
14589bc5d	mov	rcx, qword ptr [rsi + 0x10]
14589bc61	movabs	r9, 0x1ffffffffffffff0
14589bc6b	and	r9, rcx
14589bc6e	lea	r8, [rax + r9*4]
14589bc72	and	ecx, 0xf
14589bc75	movd	xmm0, edx
14589bc79	pshufd	xmm0, xmm0, 0
14589bc7e	xor	r10d, r10d
14589bc81	nop	word ptr cs:[rax + rax]
14589bc90	cmp	r9, r10
14589bc93	je	0x14589bd63
14589bc99	movdqu	xmm1, xmmword ptr [rax + r10*4]
14589bc9f	movdqu	xmm2, xmmword ptr [rax + r10*4 + 0x10]
14589bca6	movdqu	xmm3, xmmword ptr [rax + r10*4 + 0x20]
14589bcad	movdqu	xmm4, xmmword ptr [rax + r10*4 + 0x30]
14589bcb4	pcmpeqd	xmm2, xmm0
14589bcb8	pcmpeqd	xmm1, xmm0
14589bcbc	packssdw	xmm1, xmm2
14589bcc0	pcmpeqd	xmm3, xmm0
14589bcc4	pcmpeqd	xmm4, xmm0
14589bcc8	packssdw	xmm3, xmm4
14589bccc	packsswb	xmm1, xmm3
14589bcd0	pmovmskb	r11d, xmm1
14589bcd5	add	r10, 0x10
14589bcd9	test	r11d, r11d
14589bcdc	je	0x14589bc90
14589bcde	mov	al, 1
14589bce0	jmp	0x14589bdb0
14589bce5	lea	rcx, [rsp + 0x28]
14589bcea	mov	r15, rdx
14589bced	call	0x1459a4ba0
14589bcf2	mov	rdx, qword ptr [rsp + 0x28]
14589bcf7	cmp	rdx, -1
14589bcfb	je	0x14589bdae
14589bd01	mov	rcx, qword ptr [rsp + 0x30]
14589bd06	mov	rdi, qword ptr [rsp + 0x40]
14589bd0b	mov	rbx, qword ptr [rsp + 0x48]
14589bd10	movzx	eax, byte ptr [rsp + 0x90]
14589bd18	cmp	r14, rax
14589bd1b	jne	0x14589bd84
14589bd1d	mov	rax, qword ptr [rsi]
14589bd20	movzx	ebp, byte ptr [rsp + 0x91]
14589bd28	movzx	r14d, byte ptr [rax]
14589bd2c	test	rdx, rdx
14589bd2f	je	0x14589bd3c
14589bd31	mov	r8d, 1
14589bd37	call	0x1400021d0
14589bd3c	test	rdi, rdi
14589bd3f	je	0x14589bd56
14589bd41	shl	rdi, 3
14589bd45	mov	r8d, 4
14589bd4b	mov	rcx, rbx
14589bd4e	mov	rdx, rdi
14589bd51	call	0x1400021d0
14589bd56	cmp	bpl, r14b
14589bd59	jne	0x14589bdae
14589bd5b	mov	rdx, r15
14589bd5e	jmp	0x14589bc59
14589bd63	shl	ecx, 2
14589bd66	xor	r9d, r9d
14589bd69	nop	dword ptr [rax]
14589bd70	cmp	rcx, r9
14589bd73	setne	al
14589bd76	je	0x14589bdb0
14589bd78	cmp	dword ptr [r8 + r9], edx
14589bd7c	lea	r9, [r9 + 4]
14589bd80	jne	0x14589bd70
14589bd82	jmp	0x14589bdb0
14589bd84	test	rdx, rdx
14589bd87	je	0x14589bd94
14589bd89	mov	r8d, 1
14589bd8f	call	0x1400021d0
14589bd94	test	rdi, rdi
14589bd97	je	0x14589bdae
14589bd99	shl	rdi, 3
14589bd9d	mov	r8d, 4
14589bda3	mov	rcx, rbx
14589bda6	mov	rdx, rdi
14589bda9	call	0x1400021d0
14589bdae	xor	eax, eax
14589bdb0	add	rsp, 0x98
14589bdb7	pop	rbx
14589bdb8	pop	rbp
14589bdb9	pop	rdi
14589bdba	pop	rsi
14589bdbb	pop	r14
14589bdbd	pop	r15
14589bdbf	ret
