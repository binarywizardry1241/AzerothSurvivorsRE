1400a91d0	push	rbp
1400a91d1	push	r15
1400a91d3	push	r14
1400a91d5	push	r13
1400a91d7	push	r12
1400a91d9	push	rsi
1400a91da	push	rdi
1400a91db	push	rbx
1400a91dc	sub	rsp, 0x88
1400a91e3	lea	rbp, [rsp + 0x80]
1400a91eb	mov	qword ptr [rbp], 0xfffffffffffffffe
1400a91f3	mov	edi, r8d
1400a91f6	mov	r13, rcx
1400a91f9	movsxd	rax, r8d
1400a91fc	movsxd	rcx, edx
1400a91ff	mov	r12, rax
1400a9202	sub	r12, rcx
1400a9205	xor	r15d, r15d
1400a9208	cmp	eax, ecx
1400a920a	mov	eax, 0
1400a920f	cmovg	rax, r12
1400a9213	mov	r14, rax
1400a9216	shl	r14, 5
1400a921a	mov	rcx, rax
1400a921d	shr	rcx, 0x3b
1400a9221	setne	cl
1400a9224	movabs	r8, 0x7ffffffffffffff8
1400a922e	cmp	r14, r8
1400a9231	seta	r8b
1400a9235	or	r8b, cl
1400a9238	je	0x1400a9247
1400a923a	mov	rcx, r15
1400a923d	mov	rdx, r14
1400a9240	call	0x145d992bb
1400a9245	ud2
1400a9247	test	rax, rax
1400a924a	je	0x1400a9272
1400a924c	mov	esi, edx
1400a924e	call	0x140002200
1400a9253	mov	r15d, 8
1400a9259	mov	edx, 8
1400a925e	mov	rcx, r14
1400a9261	call	0x1400021c0
1400a9266	test	rax, rax
1400a9269	je	0x1400a923a
1400a926b	mov	edx, esi
1400a926d	mov	rbx, rax
1400a9270	jmp	0x1400a927a
1400a9272	mov	ebx, 8
1400a9277	xor	r12d, r12d
1400a927a	mov	qword ptr [rbp - 0x18], r13
1400a927e	mov	qword ptr [rbp - 0x30], r12
1400a9282	mov	qword ptr [rbp - 0x28], rbx
1400a9286	sub	edi, edx
1400a9288	jle	0x1400a9316
1400a928e	mov	r13d, edx
1400a9291	xor	ecx, ecx
1400a9293	lea	rsi, [rip + 0x5b35776]
1400a929a	lea	r14, [rip + 0x5d2fce3]
1400a92a1	lea	r15, [rbp - 0x50]
1400a92a5	lea	r12, [rbp - 0x60]
1400a92a9	nop	dword ptr [rax]
1400a92b0	mov	qword ptr [rbp - 0x10], rcx
1400a92b4	lea	eax, [rcx + r13]
1400a92b8	mov	dword ptr [rbp - 4], eax
1400a92bb	lea	rax, [rbp - 4]
1400a92bf	mov	qword ptr [rbp - 0x60], rax
1400a92c3	mov	qword ptr [rbp - 0x58], rsi
1400a92c7	mov	rcx, r15
1400a92ca	mov	rdx, r14
1400a92cd	mov	r8, r12
1400a92d0	call	0x145bcce30
1400a92d5	nop
1400a92d6	mov	byte ptr [rbp - 0x38], 1
1400a92da	mov	rax, qword ptr [rbp - 0x40]
1400a92de	mov	qword ptr [rbx + 0x10], rax
1400a92e2	movzx	eax, byte ptr [rbp - 0x38]
1400a92e6	mov	byte ptr [rbx + 0x18], al
1400a92e9	mov	eax, dword ptr [rbp - 0x37]
1400a92ec	mov	dword ptr [rbx + 0x19], eax
1400a92ef	movzx	eax, word ptr [rbp - 0x33]
1400a92f3	mov	word ptr [rbx + 0x1d], ax
1400a92f7	movzx	eax, byte ptr [rbp - 0x31]
1400a92fb	mov	byte ptr [rbx + 0x1f], al
1400a92fe	movups	xmm0, xmmword ptr [rbp - 0x50]
1400a9302	movups	xmmword ptr [rbx], xmm0
1400a9305	mov	rcx, qword ptr [rbp - 0x10]
1400a9309	inc	rcx
1400a930c	add	rbx, 0x20
1400a9310	cmp	edi, ecx
1400a9312	jne	0x1400a92b0
1400a9314	jmp	0x1400a9318
1400a9316	xor	ecx, ecx
1400a9318	mov	qword ptr [rbp - 0x20], rcx
1400a931c	mov	rax, qword ptr [rbp - 0x18]
1400a9320	mov	qword ptr [rax + 0x10], rcx
1400a9324	movups	xmm0, xmmword ptr [rbp - 0x30]
1400a9328	movups	xmmword ptr [rax], xmm0
1400a932b	add	rsp, 0x88
1400a9332	pop	rbx
1400a9333	pop	rdi
1400a9334	pop	rsi
1400a9335	pop	r12
1400a9337	pop	r13
1400a9339	pop	r14
1400a933b	pop	r15
1400a933d	pop	rbp
1400a933e	ret
