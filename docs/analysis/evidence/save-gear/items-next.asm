1459b74e0	push	r15
1459b74e2	push	r14
1459b74e4	push	r13
1459b74e6	push	r12
1459b74e8	push	rsi
1459b74e9	push	rdi
1459b74ea	push	rbp
1459b74eb	push	rbx
1459b74ec	sub	rsp, 0x98
1459b74f3	xor	esi, esi
1459b74f5	cmp	byte ptr [rcx + 0x41], 0
1459b74f9	je	0x1459b7514
1459b74fb	mov	eax, esi
1459b74fd	mov	edx, r15d
1459b7500	add	rsp, 0x98
1459b7507	pop	rbx
1459b7508	pop	rbp
1459b7509	pop	rdi
1459b750a	pop	rsi
1459b750b	pop	r12
1459b750d	pop	r13
1459b750f	pop	r14
1459b7511	pop	r15
1459b7513	ret
1459b7514	mov	rdi, rcx
1459b7517	lea	rbx, [rcx + 0x10]
1459b751b	lea	r14, [rsp + 0x28]
1459b7520	mov	ebp, 0xa
1459b7525	jmp	0x1459b7546
1459b7527	test	bpl, bpl
1459b752a	mov	ebp, 0xa
1459b752f	jne	0x1459b77e0
1459b7535	nop	word ptr cs:[rax + rax]
1459b7540	cmp	byte ptr [rdi + 0x41], 1
1459b7544	je	0x1459b74fb
1459b7546	mov	r15, qword ptr [rbx]
1459b7549	mov	rcx, r14
1459b754c	mov	rdx, rbx
1459b754f	call	0x1459c7330
1459b7554	cmp	dword ptr [rsp + 0x28], 1
1459b7559	jne	0x1459b7580
1459b755b	mov	r8, qword ptr [rsp + 0x30]
1459b7560	mov	rax, qword ptr [rsp + 0x38]
1459b7565	mov	rcx, qword ptr [rdi]
1459b7568	sub	r8, rcx
1459b756b	add	r15, rcx
1459b756e	mov	qword ptr [rdi], rax
1459b7571	test	r8, r8
1459b7574	jne	0x1459b75ae
1459b7576	jmp	0x1459b7540
1459b7578	nop	dword ptr [rax + rax]
1459b7580	cmp	byte ptr [rdi + 0x41], 0
1459b7584	jne	0x1459b74fb
1459b758a	mov	byte ptr [rdi + 0x41], 1
1459b758e	mov	r15, qword ptr [rdi]
1459b7591	mov	r8, qword ptr [rdi + 8]
1459b7595	sub	r8, r15
1459b7598	setne	al
1459b759b	or	al, byte ptr [rdi + 0x40]
1459b759e	cmp	al, 1
1459b75a0	jne	0x1459b74fb
1459b75a6	add	r15, qword ptr [rbx]
1459b75a9	test	r8, r8
1459b75ac	je	0x1459b7540
1459b75ae	cmp	r8, 1
1459b75b2	jne	0x1459b75d0
1459b75b4	movzx	ecx, byte ptr [r15]
1459b75b8	cmp	ecx, 0x2b
1459b75bb	je	0x1459b7540
1459b75bd	cmp	ecx, 0x2d
1459b75c0	je	0x1459b7540
1459b75c6	jmp	0x1459b75d4
1459b75c8	nop	dword ptr [rax + rax]
1459b75d0	movzx	ecx, byte ptr [r15]
1459b75d4	xor	eax, eax
1459b75d6	cmp	cl, 0x2b
1459b75d9	sete	al
1459b75dc	mov	rcx, r8
1459b75df	sub	rcx, rax
1459b75e2	add	r15, rax
1459b75e5	cmp	rcx, 9
1459b75e9	jae	0x1459b7700
1459b75ef	test	rcx, rcx
1459b75f2	je	0x1459b7742
1459b75f8	movzx	eax, byte ptr [r15]
1459b75fc	add	eax, -0x30
1459b75ff	cmp	eax, 9
1459b7602	ja	0x1459b7540
1459b7608	cmp	rcx, 1
1459b760c	je	0x1459b7744
1459b7612	movzx	edx, byte ptr [r15 + 1]
1459b7617	add	edx, -0x30
1459b761a	cmp	edx, 9
1459b761d	ja	0x1459b7540
1459b7623	lea	eax, [rax + rax*4]
1459b7626	lea	eax, [rdx + rax*2]
1459b7629	cmp	rcx, 2
1459b762d	je	0x1459b7744
1459b7633	movzx	edx, byte ptr [r15 + 2]
1459b7638	add	edx, -0x30
1459b763b	cmp	edx, 9
1459b763e	ja	0x1459b7540
1459b7644	lea	eax, [rax + rax*4]
1459b7647	lea	eax, [rdx + rax*2]
1459b764a	cmp	rcx, 3
1459b764e	je	0x1459b7744
1459b7654	movzx	edx, byte ptr [r15 + 3]
1459b7659	add	edx, -0x30
1459b765c	cmp	edx, 9
1459b765f	ja	0x1459b7540
1459b7665	lea	eax, [rax + rax*4]
1459b7668	lea	eax, [rdx + rax*2]
1459b766b	cmp	rcx, 4
1459b766f	je	0x1459b7744
1459b7675	movzx	edx, byte ptr [r15 + 4]
1459b767a	add	edx, -0x30
1459b767d	cmp	edx, 9
1459b7680	ja	0x1459b7540
1459b7686	lea	eax, [rax + rax*4]
1459b7689	lea	eax, [rdx + rax*2]
1459b768c	cmp	rcx, 5
1459b7690	je	0x1459b7744
1459b7696	movzx	edx, byte ptr [r15 + 5]
1459b769b	add	edx, -0x30
1459b769e	cmp	edx, 9
1459b76a1	ja	0x1459b7540
1459b76a7	lea	eax, [rax + rax*4]
1459b76aa	lea	eax, [rdx + rax*2]
1459b76ad	cmp	rcx, 6
1459b76b1	je	0x1459b7744
1459b76b7	movzx	edx, byte ptr [r15 + 6]
1459b76bc	add	edx, -0x30
1459b76bf	cmp	edx, 9
1459b76c2	ja	0x1459b7540
1459b76c8	lea	eax, [rax + rax*4]
1459b76cb	lea	eax, [rdx + rax*2]
1459b76ce	cmp	rcx, 7
1459b76d2	je	0x1459b7744
1459b76d4	movzx	ecx, byte ptr [r15 + 7]
1459b76d9	add	ecx, -0x30
1459b76dc	cmp	ecx, 9
1459b76df	ja	0x1459b7540
1459b76e5	lea	eax, [rax + rax*4]
1459b76e8	lea	eax, [rcx + rax*2]
1459b76eb	shl	rax, 0x20
1459b76ef	test	al, 1
1459b76f1	jne	0x1459b7540
1459b76f7	jmp	0x1459b7750
1459b76f9	nop	dword ptr [rax]
1459b7700	neg	rax
1459b7703	add	r8, rax
1459b7706	neg	r8
1459b7709	xor	eax, eax
1459b770b	xor	ecx, ecx
1459b770d	mov	rdx, r8
1459b7710	add	rdx, rcx
1459b7713	je	0x1459b7744
1459b7715	mul	ebp
1459b7717	jo	0x1459b77ba
1459b771d	movzx	r9d, byte ptr [r15 + rcx]
1459b7722	add	r9d, -0x30
1459b7726	add	eax, r9d
1459b7729	setb	dl
1459b772c	cmp	r9d, 9
1459b7730	ja	0x1459b7540
1459b7736	inc	rcx
1459b7739	test	dl, dl
1459b773b	je	0x1459b770d
1459b773d	jmp	0x1459b7540
1459b7742	xor	eax, eax
1459b7744	shl	rax, 0x20
1459b7748	test	al, 1
1459b774a	jne	0x1459b7540
1459b7750	shr	rax, 0x20
1459b7754	mov	rcx, r14
1459b7757	mov	r15, rax
1459b775a	mov	edx, eax
1459b775c	call	0x1459a4ba0
1459b7761	mov	rdx, qword ptr [rsp + 0x28]
1459b7766	cmp	rdx, -1
1459b776a	je	0x1459b7540
1459b7770	mov	r12, qword ptr [rsp + 0x40]
1459b7775	mov	r13, qword ptr [rsp + 0x48]
1459b777a	movzx	ebp, byte ptr [rsp + 0x91]
1459b7782	test	rdx, rdx
1459b7785	je	0x1459b7797
1459b7787	mov	rcx, qword ptr [rsp + 0x30]
1459b778c	mov	r8d, 1
1459b7792	call	0x1400021d0
1459b7797	test	r12, r12
1459b779a	je	0x1459b7527
1459b77a0	shl	r12, 3
1459b77a4	mov	r8d, 4
1459b77aa	mov	rcx, r13
1459b77ad	mov	rdx, r12
1459b77b0	call	0x1400021d0
1459b77b5	jmp	0x1459b7527
1459b77ba	movzx	ecx, byte ptr [r15 + rcx]
1459b77bf	add	cl, 0xd0
1459b77c2	xor	eax, eax
1459b77c4	cmp	cl, 0xa
1459b77c7	setb	al
1459b77ca	shl	eax, 8
1459b77cd	add	rax, 0x101
1459b77d3	test	al, 1
1459b77d5	jne	0x1459b7540
1459b77db	jmp	0x1459b7750
1459b77e0	mov	esi, 1
1459b77e5	jmp	0x1459b74fb
