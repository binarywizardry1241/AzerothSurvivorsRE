1400909c0	push	rbp
1400909c1	push	r15
1400909c3	push	r14
1400909c5	push	r13
1400909c7	push	r12
1400909c9	push	rsi
1400909ca	push	rdi
1400909cb	push	rbx
1400909cc	mov	eax, 0x1058
1400909d1	call	0x145bf95a0
1400909d6	sub	rsp, rax
1400909d9	lea	rbp, [rsp + 0x80]
1400909e1	mov	qword ptr [rbp + 0xfd0], 0xfffffffffffffffe
1400909ec	mov	r9, rdx
1400909ef	shr	r9, 1
1400909f2	mov	rax, rdx
1400909f5	sub	rax, r9
1400909f8	cmp	rdx, 0x1b207
1400909ff	mov	r9d, 0x1b207
140090a05	cmovb	r9, rdx
140090a09	cmp	r9, rax
140090a0c	cmovbe	r9, rax
140090a10	cmp	r9, 0x31
140090a14	mov	r14d, 0x30
140090a1a	cmovae	r14, r9
140090a1e	cmp	r9, 0x39
140090a22	jae	0x140090a37
140090a24	lea	rsi, [rbp - 0x50]
140090a28	mov	r9d, 0x38
140090a2e	xor	edi, edi
140090a30	xor	ebx, ebx
140090a32	jmp	0x140090ad3
140090a37	lea	r9, [r14*8]
140090a3f	lea	rdi, [r9 + r9*8]
140090a43	movabs	r9, 0x1c71c71c71c71c7
140090a4d	cmp	rax, r9
140090a50	jbe	0x140090a69
140090a52	xor	ebx, ebx
140090a54	mov	byte ptr [rbp + 0xfcf], 0
140090a5b	mov	rcx, rbx
140090a5e	mov	rdx, rdi
140090a61	call	0x145d992bb
140090a66	nop
140090a67	ud2
140090a69	test	rdi, rdi
140090a6c	je	0x140090aa4
140090a6e	mov	r15, r8
140090a71	mov	r12, rcx
140090a74	mov	r13, rdx
140090a77	call	0x140002200
140090a7c	mov	ebx, 8
140090a81	mov	edx, 8
140090a86	mov	rcx, rdi
140090a89	call	0x1400021c0
140090a8e	test	rax, rax
140090a91	je	0x140090a54
140090a93	mov	rsi, rax
140090a96	mov	rdx, r13
140090a99	mov	rcx, r12
140090a9c	mov	r8, r15
140090a9f	mov	r9, r14
140090aa2	jmp	0x140090aac
140090aa4	mov	esi, 8
140090aa9	xor	r9d, r9d
140090aac	mov	qword ptr [rbp + 0xfb0], r9
140090ab3	mov	qword ptr [rbp + 0xfb8], rsi
140090aba	mov	qword ptr [rbp + 0xfc0], 0
140090ac5	lea	rax, [r9*8]
140090acd	lea	rdi, [rax + rax*8]
140090ad1	mov	bl, 1
140090ad3	mov	byte ptr [rbp + 0xfcf], bl
140090ad9	cmp	rdx, 0x41
140090add	mov	qword ptr [rsp + 0x28], r8
140090ae2	setb	byte ptr [rsp + 0x20]
140090ae7	mov	r8, rsi
140090aea	call	0x1401389e0
140090aef	nop
140090af0	test	bl, bl
140090af2	je	0x140090b06
140090af4	mov	r8d, 8
140090afa	mov	rcx, rsi
140090afd	mov	rdx, rdi
140090b00	call	0x1400021d0
140090b05	nop
140090b06	add	rsp, 0x1058
140090b0d	pop	rbx
140090b0e	pop	rdi
140090b0f	pop	rsi
140090b10	pop	r12
140090b12	pop	r13
140090b14	pop	r14
140090b16	pop	r15
140090b18	pop	rbp
140090b19	ret
