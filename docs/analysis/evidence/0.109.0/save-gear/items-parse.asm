1459c3640	push	rbp
1459c3641	push	r15
1459c3643	push	r14
1459c3645	push	r13
1459c3647	push	r12
1459c3649	push	rsi
1459c364a	push	rdi
1459c364b	push	rbx
1459c364c	sub	rsp, 0x138
1459c3653	lea	rbp, [rsp + 0x80]
1459c365b	mov	qword ptr [rbp + 0xb0], 0xfffffffffffffffe
1459c3666	mov	rsi, rdx
1459c3669	mov	qword ptr [rbp + 0x90], rcx
1459c3670	lea	rax, [rdx + 0xd8]
1459c3677	mov	qword ptr [rbp - 0x50], rax
1459c367b	lea	rbx, [rdx + 0x48]
1459c367f	cmp	dword ptr [rdx + 0x7c], -1
1459c3683	je	0x1459c3691
1459c3685	mov	rcx, rbx
1459c3688	call	0x1459b74e0
1459c368d	test	al, 1
1459c368f	jne	0x1459c36da
1459c3691	mov	dword ptr [rsi + 0x7c], 0xffffffff
1459c3698	cmp	dword ptr [rsi + 0x34], -1
1459c369c	je	0x1459c36b1
1459c369e	lea	rdx, [rbp - 0x50]
1459c36a2	mov	rcx, rsi
1459c36a5	mov	r8, rbx
1459c36a8	call	0x1459cca70
1459c36ad	test	al, 1
1459c36af	jne	0x1459c36da
1459c36b1	mov	dword ptr [rsi + 0x7c], 0xffffffff
1459c36b8	cmp	dword ptr [rsi + 0xc4], -1
1459c36bf	je	0x1459c3811
1459c36c5	lea	rcx, [rsi + 0x90]
1459c36cc	call	0x1459b74e0
1459c36d1	cmp	eax, 1
1459c36d4	jne	0x1459c3811
1459c36da	mov	edi, edx
1459c36dc	call	0x140002200
1459c36e1	mov	ecx, 0x10
1459c36e6	mov	edx, 4
1459c36eb	call	0x1400021c0
1459c36f0	test	rax, rax
1459c36f3	je	0x1459c3843
1459c36f9	mov	rbx, rax
1459c36fc	mov	dword ptr [rax], edi
1459c36fe	mov	qword ptr [rbp + 0x98], 4
1459c3709	mov	qword ptr [rbp + 0xa0], rax
1459c3710	mov	qword ptr [rbp + 0xa8], 1
1459c371b	lea	rcx, [rbp - 0x50]
1459c371f	mov	r8d, 0xd8
1459c3725	mov	rdx, rsi
1459c3728	call	0x145bfa0e7
1459c372d	lea	r13, [rbp + 0x88]
1459c3734	lea	r14, [rbp - 8]
1459c3738	mov	r15d, 1
1459c373e	lea	r12, [rbp + 0x40]
1459c3742	lea	rsi, [rbp + 0x98]
1459c3749	jmp	0x1459c375e
1459c374b	nop	dword ptr [rax + rax]
1459c3750	mov	dword ptr [rbx + r15*4], edi
1459c3754	inc	r15
1459c3757	mov	qword ptr [rbp + 0xa8], r15
1459c375e	mov	qword ptr [rbp + 0x88], r13
1459c3765	cmp	dword ptr [rbp + 0x2c], -1
1459c3769	je	0x1459c3778
1459c376b	mov	rcx, r14
1459c376e	call	0x1459b74e0
1459c3773	nop
1459c3774	test	al, 1
1459c3776	jne	0x1459c37b8
1459c3778	mov	dword ptr [rbp + 0x2c], 0xffffffff
1459c377f	cmp	dword ptr [rbp - 0x1c], -1
1459c3783	je	0x1459c379d
1459c3785	lea	rcx, [rbp - 0x50]
1459c3789	lea	rdx, [rbp + 0x88]
1459c3790	mov	r8, r14
1459c3793	call	0x1459cca70
1459c3798	nop
1459c3799	test	al, 1
1459c379b	jne	0x1459c37b8
1459c379d	mov	dword ptr [rbp + 0x2c], 0xffffffff
1459c37a4	cmp	dword ptr [rbp + 0x74], -1
1459c37a8	je	0x1459c37f0
1459c37aa	mov	rcx, r12
1459c37ad	call	0x1459b74e0
1459c37b2	nop
1459c37b3	cmp	eax, 1
1459c37b6	jne	0x1459c37f0
1459c37b8	mov	edi, edx
1459c37ba	cmp	r15, qword ptr [rbp + 0x98]
1459c37c1	jne	0x1459c3750
1459c37c3	mov	qword ptr [rsp + 0x20], 4
1459c37cc	mov	r8d, 1
1459c37d2	mov	r9d, 4
1459c37d8	mov	rcx, rsi
1459c37db	mov	rdx, r15
1459c37de	call	0x145bfa970
1459c37e3	nop
1459c37e4	mov	rbx, qword ptr [rbp + 0xa0]
1459c37eb	jmp	0x1459c3750
1459c37f0	mov	rax, qword ptr [rbp + 0xa8]
1459c37f7	mov	rcx, qword ptr [rbp + 0x90]
1459c37fe	mov	qword ptr [rcx + 0x10], rax
1459c3802	mov	rax, rcx
1459c3805	movups	xmm0, xmmword ptr [rbp + 0x98]
1459c380c	movups	xmmword ptr [rcx], xmm0
1459c380f	jmp	0x1459c382f
1459c3811	mov	rax, qword ptr [rbp + 0x90]
1459c3818	mov	qword ptr [rax], 0
1459c381f	mov	qword ptr [rax + 8], 4
1459c3827	mov	qword ptr [rax + 0x10], 0
1459c382f	add	rsp, 0x138
1459c3836	pop	rbx
1459c3837	pop	rdi
1459c3838	pop	rsi
1459c3839	pop	r12
1459c383b	pop	r13
1459c383d	pop	r14
1459c383f	pop	r15
1459c3841	pop	rbp
1459c3842	ret
1459c3843	mov	ecx, 4
1459c3848	mov	edx, 0x10
1459c384d	call	0x145d992bb
1459c3852	ud2
