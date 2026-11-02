1458e7920	push	rbp
1458e7921	push	r15
1458e7923	push	r14
1458e7925	push	r12
1458e7927	push	rsi
1458e7928	push	rdi
1458e7929	push	rbx
1458e792a	sub	rsp, 0x90
1458e7931	lea	rbp, [rsp + 0x80]
1458e7939	mov	qword ptr [rbp + 8], 0xfffffffffffffffe
1458e7941	mov	rsi, rcx
1458e7944	lea	r12, [r9 + 3]
1458e7948	shr	r12, 2
1458e794c	lea	r15, [r12 + r12*2]
1458e7950	mov	qword ptr [rbp - 0x10], r12
1458e7954	je	0x1458e7985
1458e7956	mov	rdi, rdx
1458e7959	mov	rbx, r8
1458e795c	mov	r14, r9
1458e795f	call	0x140002200
1458e7964	mov	edx, 1
1458e7969	mov	rcx, r15
1458e796c	call	0x1400021f0
1458e7971	test	rax, rax
1458e7974	je	0x1458e7a7c
1458e797a	mov	r9, r14
1458e797d	mov	r8, rbx
1458e7980	mov	rdx, rdi
1458e7983	jmp	0x1458e798a
1458e7985	mov	eax, 1
1458e798a	mov	ecx, r9d
1458e798d	and	ecx, 3
1458e7990	mov	qword ptr [rsp + 0x38], r15
1458e7995	mov	qword ptr [rsp + 0x30], rcx
1458e799a	mov	qword ptr [rbp - 8], r15
1458e799e	mov	qword ptr [rsp + 0x28], r15
1458e79a3	mov	qword ptr [rbp], rax
1458e79a7	mov	qword ptr [rsp + 0x20], rax
1458e79ac	lea	rcx, [rbp - 0x28]
1458e79b0	call	0x1459f8370
1458e79b5	nop
1458e79b6	cmp	dword ptr [rbp - 0x28], 2
1458e79ba	jne	0x1458e7a19
1458e79bc	movzx	eax, byte ptr [rbp - 0x20]
1458e79c0	cmp	rax, 0xff
1458e79c6	mov	r9, qword ptr [rbp - 0x10]
1458e79ca	lea	rdx, [r9 + r9*2]
1458e79ce	je	0x1458e7a4c
1458e79d0	movzx	ecx, byte ptr [rbp - 0x19]
1458e79d4	shl	ecx, 0x10
1458e79d7	movzx	r8d, word ptr [rbp - 0x1b]
1458e79dc	or	r8d, ecx
1458e79df	mov	ecx, dword ptr [rbp - 0x1f]
1458e79e2	shl	r8, 0x28
1458e79e6	shl	rcx, 8
1458e79ea	or	rcx, r8
1458e79ed	or	rcx, rax
1458e79f0	mov	rax, qword ptr [rbp - 0x18]
1458e79f4	mov	qword ptr [rsi + 8], rcx
1458e79f8	mov	qword ptr [rsi + 0x10], rax
1458e79fc	mov	qword ptr [rsi], 0xffffffffffffffff
1458e7a03	test	r9, r9
1458e7a06	je	0x1458e7a37
1458e7a08	mov	r8d, 1
1458e7a0e	mov	rcx, qword ptr [rbp]
1458e7a12	call	0x1400021d0
1458e7a17	jmp	0x1458e7a37
1458e7a19	mov	rax, qword ptr [rbp - 0x18]
1458e7a1d	mov	rcx, qword ptr [rbp - 8]
1458e7a21	cmp	rax, rcx
1458e7a24	cmovae	rax, rcx
1458e7a28	mov	qword ptr [rsi], rcx
1458e7a2b	mov	rcx, qword ptr [rbp]
1458e7a2f	mov	qword ptr [rsi + 8], rcx
1458e7a33	mov	qword ptr [rsi + 0x10], rax
1458e7a37	mov	rax, rsi
1458e7a3a	add	rsp, 0x90
1458e7a41	pop	rbx
1458e7a42	pop	rdi
1458e7a43	pop	rsi
1458e7a44	pop	r12
1458e7a46	pop	r14
1458e7a48	pop	r15
1458e7a4a	pop	rbp
1458e7a4b	ret
1458e7a4c	lea	rax, [rip + 0x1309a0d]
1458e7a53	mov	qword ptr [rbp - 0x38], rax
1458e7a57	lea	rax, [rip - 0x58e599e]
1458e7a5e	mov	qword ptr [rbp - 0x30], rax
1458e7a62	lea	rcx, [rip + 0x1309a07]
1458e7a69	lea	r8, [rip + 0x1309a98]
1458e7a70	lea	rdx, [rbp - 0x38]
1458e7a74	call	0x145d99830
1458e7a79	nop
1458e7a7a	ud2
1458e7a7c	mov	ecx, 1
1458e7a81	mov	rdx, r15
1458e7a84	call	0x145d992bb
1458e7a89	ud2
