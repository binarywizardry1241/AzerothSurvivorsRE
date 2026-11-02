1458a9410	push	r15
1458a9412	push	r14
1458a9414	push	rsi
1458a9415	push	rdi
1458a9416	push	rbx
1458a9417	sub	rsp, 0x70
1458a941b	mov	rdi, r9
1458a941e	mov	rbx, r8
1458a9421	mov	rsi, rcx
1458a9424	mov	qword ptr [rsp + 0x40], r8
1458a9429	mov	qword ptr [rsp + 0x48], r9
1458a942e	mov	qword ptr [rsp + 0x50], 0
1458a9437	mov	qword ptr [rsp + 0x58], r9
1458a943c	mov	byte ptr [rsp + 0x68], 1
1458a9441	movabs	rax, 0x3a0000003a
1458a944b	mov	qword ptr [rsp + 0x60], rax
1458a9450	lea	rcx, [rsp + 0x28]
1458a9455	lea	rdx, [rsp + 0x40]
1458a945a	call	0x1458aabb0
1458a945f	cmp	dword ptr [rsp + 0x28], 1
1458a9464	jne	0x1458a9495
1458a9466	mov	r9, qword ptr [rsp + 0x30]
1458a946b	test	r9, r9
1458a946e	je	0x1458a949d
1458a9470	mov	rcx, qword ptr [rsp + 0x38]
1458a9475	cmp	r9, 1
1458a9479	jne	0x1458a94a5
1458a947b	movzx	eax, byte ptr [rbx]
1458a947e	xor	r8d, r8d
1458a9481	cmp	eax, 0x2b
1458a9484	je	0x1458a962c
1458a948a	cmp	eax, 0x2d
1458a948d	je	0x1458a962c
1458a9493	jmp	0x1458a94a8
1458a9495	xor	r8d, r8d
1458a9498	jmp	0x1458a962c
1458a949d	mov	r8, r9
1458a94a0	jmp	0x1458a962c
1458a94a5	movzx	eax, byte ptr [rbx]
1458a94a8	xor	r10d, r10d
1458a94ab	cmp	al, 0x2b
1458a94ad	sete	r10b
1458a94b1	mov	rax, r10
1458a94b4	neg	rax
1458a94b7	mov	rdx, r9
1458a94ba	sub	rdx, r10
1458a94bd	add	r10, rbx
1458a94c0	cmp	rdx, 0x11
1458a94c4	jae	0x1458a950b
1458a94c6	test	rdx, rdx
1458a94c9	je	0x1458a9555
1458a94cf	add	r9, rax
1458a94d2	neg	r9
1458a94d5	xor	r8d, r8d
1458a94d8	xor	edx, edx
1458a94da	xor	eax, eax
1458a94dc	nop	dword ptr [rax]
1458a94e0	movzx	r11d, byte ptr [r10 + rdx]
1458a94e5	add	r11d, -0x30
1458a94e9	cmp	r11d, 9
1458a94ed	ja	0x1458a962c
1458a94f3	lea	rax, [rax + rax*4]
1458a94f7	mov	r11d, r11d
1458a94fa	lea	rax, [r11 + rax*2]
1458a94fe	inc	rdx
1458a9501	mov	r11, r9
1458a9504	add	r11, rdx
1458a9507	jne	0x1458a94e0
1458a9509	jmp	0x1458a9557
1458a950b	add	r9, rax
1458a950e	neg	r9
1458a9511	xor	r8d, r8d
1458a9514	mov	r11d, 0xa
1458a951a	xor	r14d, r14d
1458a951d	xor	eax, eax
1458a951f	mov	rdx, r9
1458a9522	add	rdx, r14
1458a9525	je	0x1458a9557
1458a9527	mul	r11
1458a952a	jo	0x1458a962c
1458a9530	movzx	r15d, byte ptr [r10 + r14]
1458a9535	add	r15d, -0x30
1458a9539	add	rax, r15
1458a953c	setb	dl
1458a953f	cmp	r15d, 9
1458a9543	ja	0x1458a962c
1458a9549	inc	r14
1458a954c	test	dl, dl
1458a954e	je	0x1458a951f
1458a9550	jmp	0x1458a962c
1458a9555	xor	eax, eax
1458a9557	sub	rdi, rcx
1458a955a	je	0x1458a957f
1458a955c	add	rbx, rcx
1458a955f	cmp	rdi, 1
1458a9563	jne	0x1458a9587
1458a9565	movzx	ecx, byte ptr [rbx]
1458a9568	xor	r8d, r8d
1458a956b	cmp	ecx, 0x2b
1458a956e	je	0x1458a962c
1458a9574	cmp	ecx, 0x2d
1458a9577	je	0x1458a962c
1458a957d	jmp	0x1458a958a
1458a957f	mov	r8, rdi
1458a9582	jmp	0x1458a962c
1458a9587	movzx	ecx, byte ptr [rbx]
1458a958a	xor	edx, edx
1458a958c	cmp	cl, 0x2b
1458a958f	sete	dl
1458a9592	sub	rdi, rdx
1458a9595	add	rbx, rdx
1458a9598	cmp	rdi, 9
1458a959c	jae	0x1458a95ca
1458a959e	test	rdi, rdi
1458a95a1	je	0x1458a9607
1458a95a3	xor	r8d, r8d
1458a95a6	xor	edx, edx
1458a95a8	xor	ecx, ecx
1458a95aa	movzx	r9d, byte ptr [rbx + rdx]
1458a95af	add	r9d, -0x30
1458a95b3	cmp	r9d, 9
1458a95b7	ja	0x1458a962c
1458a95b9	lea	ecx, [rcx + rcx*4]
1458a95bc	lea	ecx, [r9 + rcx*2]
1458a95c0	inc	rdx
1458a95c3	cmp	rdi, rdx
1458a95c6	jne	0x1458a95aa
1458a95c8	jmp	0x1458a9609
1458a95ca	xor	r8d, r8d
1458a95cd	mov	r10d, 0xa
1458a95d3	xor	r9d, r9d
1458a95d6	xor	ecx, ecx
1458a95d8	cmp	rdi, r9
1458a95db	je	0x1458a9609
1458a95dd	mov	r11, rax
1458a95e0	mov	eax, ecx
1458a95e2	mul	r10d
1458a95e5	jo	0x1458a963e
1458a95e7	mov	ecx, eax
1458a95e9	movzx	eax, byte ptr [rbx + r9]
1458a95ee	add	eax, -0x30
1458a95f1	add	ecx, eax
1458a95f3	setb	dl
1458a95f6	cmp	eax, 9
1458a95f9	ja	0x1458a962c
1458a95fb	mov	rax, r11
1458a95fe	inc	r9
1458a9601	test	dl, dl
1458a9603	je	0x1458a95d8
1458a9605	jmp	0x1458a962c
1458a9607	xor	ecx, ecx
1458a9609	shl	rcx, 0x20
1458a960d	xor	r8d, r8d
1458a9610	test	cl, 1
1458a9613	jne	0x1458a962c
1458a9615	cmp	rax, 0x12
1458a9619	ja	0x1458a962c
1458a961b	shr	rcx, 0x20
1458a961f	mov	qword ptr [rsi + 8], rax
1458a9623	mov	dword ptr [rsi + 0x10], ecx
1458a9626	mov	r8d, 1
1458a962c	mov	qword ptr [rsi], r8
1458a962f	mov	rax, rsi
1458a9632	add	rsp, 0x70
1458a9636	pop	rbx
1458a9637	pop	rdi
1458a9638	pop	rsi
1458a9639	pop	r14
1458a963b	pop	r15
1458a963d	ret
1458a963e	movzx	eax, byte ptr [rbx + r9]
1458a9643	add	al, 0xd0
1458a9645	xor	ecx, ecx
1458a9647	cmp	al, 0xa
1458a9649	setb	cl
1458a964c	shl	ecx, 8
1458a964f	add	rcx, 0x101
1458a9656	mov	rax, r11
1458a9659	xor	r8d, r8d
1458a965c	test	cl, 1
1458a965f	je	0x1458a9615
1458a9661	jmp	0x1458a962c
