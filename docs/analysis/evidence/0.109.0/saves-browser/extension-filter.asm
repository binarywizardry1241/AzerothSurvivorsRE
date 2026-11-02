140025a10	push	rbp
140025a11	push	rsi
140025a12	sub	rsp, 0x58
140025a16	lea	rbp, [rsp + 0x50]
140025a1b	mov	qword ptr [rbp], 0xfffffffffffffffe
140025a23	lea	rcx, [rbp - 0x28]
140025a27	call	0x145bae010
140025a2c	mov	rcx, qword ptr [rbp - 0x20]
140025a30	mov	rdx, qword ptr [rbp - 0x18]
140025a34	mov	qword ptr [rbp - 8], rcx
140025a38	call	0x145ba7030
140025a3d	nop
140025a3e	test	rax, rax
140025a41	setne	cl
140025a44	cmp	rdx, 3
140025a48	sete	dl
140025a4b	and	dl, cl
140025a4d	cmp	dl, 1
140025a50	jne	0x140025aa3
140025a52	movzx	ecx, byte ptr [rax]
140025a55	lea	edx, [rcx - 0x41]
140025a58	cmp	dl, 0x1a
140025a5b	setb	dl
140025a5e	shl	dl, 5
140025a61	or	dl, cl
140025a63	cmp	dl, 0x73
140025a66	jne	0x140025aa3
140025a68	movzx	ecx, byte ptr [rax + 1]
140025a6c	lea	edx, [rcx - 0x41]
140025a6f	cmp	dl, 0x1a
140025a72	setb	dl
140025a75	shl	dl, 5
140025a78	or	dl, cl
140025a7a	cmp	dl, 0x61
140025a7d	jne	0x140025aa3
140025a7f	movzx	eax, byte ptr [rax + 2]
140025a83	lea	ecx, [rax - 0x41]
140025a86	cmp	cl, 0x1a
140025a89	setb	cl
140025a8c	shl	cl, 5
140025a8f	or	cl, al
140025a91	cmp	cl, 0x76
140025a94	sete	sil
140025a98	mov	rdx, qword ptr [rbp - 0x28]
140025a9c	test	rdx, rdx
140025a9f	jne	0x140025aae
140025aa1	jmp	0x140025abd
140025aa3	xor	esi, esi
140025aa5	mov	rdx, qword ptr [rbp - 0x28]
140025aa9	test	rdx, rdx
140025aac	je	0x140025abd
140025aae	mov	r8d, 1
140025ab4	mov	rcx, qword ptr [rbp - 8]
140025ab8	call	0x1400021d0
140025abd	mov	eax, esi
140025abf	add	rsp, 0x58
140025ac3	pop	rsi
140025ac4	pop	rbp
140025ac5	ret
