1458a8bd0	push	rbp
1458a8bd1	push	rsi
1458a8bd2	sub	rsp, 0x88
1458a8bd9	lea	rbp, [rsp + 0x80]
1458a8be1	mov	qword ptr [rbp], 0xfffffffffffffffe
1458a8be9	mov	rsi, rcx
1458a8bec	lea	rcx, [rbp - 0x30]
1458a8bf0	call	0x1458ef170
1458a8bf5	mov	rax, qword ptr [rbp - 0x30]
1458a8bf9	cmp	rax, -1
1458a8bfd	je	0x1458a8c52
1458a8bff	mov	qword ptr [rbp - 8], rax
1458a8c03	mov	rdx, qword ptr [rbp - 0x28]
1458a8c07	mov	r8, qword ptr [rbp - 0x20]
1458a8c0b	mov	qword ptr [rsp + 0x20], 5
1458a8c14	lea	r9, [rip + 0x1342dae]
1458a8c1b	lea	rcx, [rbp - 0x50]
1458a8c1f	mov	qword ptr [rbp - 0x10], rdx
1458a8c23	call	0x145ba6d40
1458a8c28	nop
1458a8c29	movups	xmm0, xmmword ptr [rbp - 0x50]
1458a8c2d	movups	xmm1, xmmword ptr [rbp - 0x40]
1458a8c31	movups	xmmword ptr [rsi + 0x10], xmm1
1458a8c35	movups	xmmword ptr [rsi], xmm0
1458a8c38	mov	rdx, qword ptr [rbp - 8]
1458a8c3c	test	rdx, rdx
1458a8c3f	je	0x1458a8c59
1458a8c41	mov	r8d, 1
1458a8c47	mov	rcx, qword ptr [rbp - 0x10]
1458a8c4b	call	0x1400021d0
1458a8c50	jmp	0x1458a8c59
1458a8c52	mov	qword ptr [rsi], 0xffffffffffffffff
1458a8c59	mov	rax, rsi
1458a8c5c	add	rsp, 0x88
1458a8c63	pop	rsi
1458a8c64	pop	rbp
1458a8c65	ret
