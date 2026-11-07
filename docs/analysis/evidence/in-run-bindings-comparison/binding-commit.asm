14001b9a0	push	rsi
14001b9a1	push	rdi
14001b9a2	push	rbx
14001b9a3	sub	rsp, 0x40
14001b9a7	mov	rsi, r8
14001b9aa	mov	rdi, rdx
14001b9ad	mov	rbx, rcx
14001b9b0	mov	rcx, rdx
14001b9b3	mov	rdx, r8
14001b9b6	call	0x1407270d0
14001b9bb	cmp	qword ptr [rbx + 0x90], 0
14001b9c3	je	0x14001bac6
14001b9c9	mov	rax, qword ptr [rbx + 0x78]
14001b9cd	mov	rcx, qword ptr [rbx + 0x80]
14001b9d4	movabs	rdx, 0x20c5b97f928e3b62
14001b9de	xor	r8d, r8d
14001b9e1	movdqa	xmm0, xmmword ptr [rip + 0x5d81b97]
14001b9e9	pcmpeqd	xmm1, xmm1
14001b9ed	movdqa	xmm2, xmmword ptr [rip + 0x5d81b9b]
14001b9f5	and	rdx, rcx
14001b9f8	movdqu	xmm3, xmmword ptr [rax + rdx]
14001b9fd	movdqa	xmm4, xmm3
14001ba01	pcmpeqb	xmm4, xmm0
14001ba05	pmovmskb	r9d, xmm4
14001ba0a	test	r9d, r9d
14001ba0d	je	0x14001ba50
14001ba0f	tzcnt	r10d, r9d
14001ba14	add	r10, rdx
14001ba17	and	r10, rcx
14001ba1a	neg	r10
14001ba1d	lea	r10, [r10 + r10*2]
14001ba21	movdqu	xmm4, xmmword ptr [rax + r10*8 - 0x18]
14001ba28	pcmpeqb	xmm4, xmm2
14001ba2c	pmovmskb	r11d, xmm4
14001ba31	cmp	r11d, 0xffff
14001ba38	je	0x14001ba6b
14001ba3a	lea	r10d, [r9 - 1]
14001ba3e	and	r10w, r9w
14001ba42	mov	r9d, r10d
14001ba45	jne	0x14001ba0f
14001ba47	nop	word ptr [rax + rax]
14001ba50	pcmpeqb	xmm3, xmm1
14001ba54	pmovmskb	r9d, xmm3
14001ba59	test	r9d, r9d
14001ba5c	jne	0x14001bac6
14001ba5e	add	rdx, r8
14001ba61	add	rdx, 0x10
14001ba65	add	r8, 0x10
14001ba69	jmp	0x14001b9f5
14001ba6b	lea	rax, [rax + r10*8]
14001ba6f	mov	rax, qword ptr [rax - 8]
14001ba73	cmp	rax, qword ptr [rbx + 0x218]
14001ba7a	jae	0x14001bac6
14001ba7c	mov	rcx, qword ptr [rbx + 0x210]
14001ba83	mov	rcx, qword ptr [rcx + rax*8]
14001ba87	test	rcx, rcx
14001ba8a	je	0x14001bac6
14001ba8c	mov	rax, qword ptr [rbx + 0x1e0]
14001ba93	not	rcx
14001ba96	imul	rcx, rcx, 0x38
14001ba9a	cmp	byte ptr [rax + rcx + 0x30], 0
14001ba9f	je	0x14001bac6
14001baa1	add	rax, rcx
14001baa4	mov	rax, qword ptr [rax + 0x10]
14001baa8	cmp	byte ptr [rax + 0xe8], 1
14001baaf	jne	0x14001baf6
14001bab1	mov	rcx, rbx
14001bab4	mov	rdx, rdi
14001bab7	mov	r8, rsi
14001baba	add	rsp, 0x40
14001babe	pop	rbx
14001babf	pop	rdi
14001bac0	pop	rsi
14001bac1	jmp	0x140725d50
14001bac6	lea	rax, [rsp + 0x2f]
14001bacb	mov	qword ptr [rsp + 0x30], rax
14001bad0	lea	rax, [rip + 0x4fe1829]
14001bad7	mov	qword ptr [rsp + 0x38], rax
14001badc	lea	rcx, [rip + 0x5d82215]
14001bae3	lea	r8, [rip + 0x5d8380e]
14001baea	lea	rdx, [rsp + 0x30]
14001baef	call	0x145d99830
14001baf4	ud2
14001baf6	add	rsp, 0x40
14001bafa	pop	rbx
14001bafb	pop	rdi
14001bafc	pop	rsi
14001bafd	ret
