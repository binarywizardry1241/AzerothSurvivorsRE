1458ef170	push	rbp
1458ef171	push	rsi
1458ef172	sub	rsp, 0xa8
1458ef179	lea	rbp, [rsp + 0x80]
1458ef181	mov	qword ptr [rbp + 0x20], 0xfffffffffffffffe
1458ef189	mov	rsi, rcx
1458ef18c	lea	rdx, [rip + 0x15e37e1]
1458ef193	lea	rcx, [rbp - 0x38]
1458ef197	mov	r8d, 0xe
1458ef19d	call	0x145bb9990
1458ef1a2	mov	rax, qword ptr [rbp - 0x38]
1458ef1a6	cmp	rax, -1
1458ef1aa	je	0x1458ef1dd
1458ef1ac	mov	qword ptr [rbp + 0x18], rax
1458ef1b0	mov	rcx, qword ptr [rbp - 0x30]
1458ef1b4	mov	rdx, qword ptr [rbp - 0x28]
1458ef1b8	mov	qword ptr [rbp + 0x10], rcx
1458ef1bc	call	0x145ba6e70
1458ef1c1	nop
1458ef1c2	test	rax, rax
1458ef1c5	je	0x1458ef261
1458ef1cb	mov	r8, rdx
1458ef1ce	lea	rcx, [rbp - 0x10]
1458ef1d2	mov	rdx, rax
1458ef1d5	call	0x145bcc5b0
1458ef1da	nop
1458ef1db	jmp	0x1458ef247
1458ef1dd	lea	rdx, [rip + 0x15e379e]
1458ef1e4	lea	rcx, [rbp - 0x10]
1458ef1e8	mov	r8d, 7
1458ef1ee	call	0x145bb9990
1458ef1f3	mov	rax, qword ptr [rbp - 0x10]
1458ef1f7	cmp	rax, -1
1458ef1fb	jne	0x1458ef21d
1458ef1fd	lea	rdx, [rip + 0x130243b]
1458ef204	lea	rcx, [rbp - 0x10]
1458ef208	mov	r8d, 0xd
1458ef20e	call	0x145bb9990
1458ef213	mov	rax, qword ptr [rbp - 0x10]
1458ef217	cmp	rax, -1
1458ef21b	je	0x1458ef28d
1458ef21d	mov	qword ptr [rbp + 0x18], rax
1458ef221	mov	rdx, qword ptr [rbp - 8]
1458ef225	mov	r8, qword ptr [rbp]
1458ef229	mov	qword ptr [rsp + 0x20], 0xd
1458ef232	lea	r9, [rip + 0x15e3750]
1458ef239	lea	rcx, [rbp - 0x10]
1458ef23d	mov	qword ptr [rbp + 0x10], rdx
1458ef241	call	0x145ba6d40
1458ef246	nop
1458ef247	movups	xmm0, xmmword ptr [rbp - 0x10]
1458ef24b	movups	xmm1, xmmword ptr [rbp]
1458ef24f	movups	xmmword ptr [rsi + 0x10], xmm1
1458ef253	movups	xmmword ptr [rsi], xmm0
1458ef256	mov	rdx, qword ptr [rbp + 0x18]
1458ef25a	test	rdx, rdx
1458ef25d	jne	0x1458ef271
1458ef25f	jmp	0x1458ef280
1458ef261	mov	qword ptr [rsi], 0xffffffffffffffff
1458ef268	mov	rdx, qword ptr [rbp + 0x18]
1458ef26c	test	rdx, rdx
1458ef26f	je	0x1458ef280
1458ef271	mov	r8d, 1
1458ef277	mov	rcx, qword ptr [rbp + 0x10]
1458ef27b	call	0x1400021d0
1458ef280	mov	rax, rsi
1458ef283	add	rsp, 0xa8
1458ef28a	pop	rsi
1458ef28b	pop	rbp
1458ef28c	ret
1458ef28d	lea	rdx, [rip + 0x13022e5]
1458ef294	lea	rcx, [rbp - 0x58]
1458ef298	mov	r8d, 4
1458ef29e	call	0x145bb9990
1458ef2a3	mov	rax, qword ptr [rbp - 0x58]
1458ef2a7	cmp	rax, -1
1458ef2ab	je	0x1458ef34c
1458ef2b1	mov	qword ptr [rbp + 0x18], rax
1458ef2b5	mov	rdx, qword ptr [rbp - 0x50]
1458ef2b9	mov	r8, qword ptr [rbp - 0x48]
1458ef2bd	mov	qword ptr [rsp + 0x20], 6
1458ef2c6	lea	r9, [rip + 0x13022a1]
1458ef2cd	lea	rcx, [rbp - 0x10]
1458ef2d1	mov	qword ptr [rbp + 0x10], rdx
1458ef2d5	call	0x145ba6d40
1458ef2da	nop
1458ef2db	mov	rdx, qword ptr [rbp - 8]
1458ef2df	mov	r8, qword ptr [rbp]
1458ef2e3	mov	qword ptr [rsp + 0x20], 5
1458ef2ec	lea	r9, [rip + 0x1302281]
1458ef2f3	lea	rcx, [rbp - 0x38]
1458ef2f7	mov	qword ptr [rbp - 0x18], rdx
1458ef2fb	call	0x145ba6d40
1458ef300	nop
1458ef301	mov	rdx, qword ptr [rbp - 0x10]
1458ef305	test	rdx, rdx
1458ef308	je	0x1458ef319
1458ef30a	mov	r8d, 1
1458ef310	mov	rcx, qword ptr [rbp - 0x18]
1458ef314	call	0x1400021d0
1458ef319	mov	rdx, qword ptr [rbp + 0x18]
1458ef31d	test	rdx, rdx
1458ef320	je	0x1458ef331
1458ef322	mov	r8d, 1
1458ef328	mov	rcx, qword ptr [rbp + 0x10]
1458ef32c	call	0x1400021d0
1458ef331	mov	rax, qword ptr [rbp - 0x38]
1458ef335	cmp	rax, -1
1458ef339	je	0x1458ef34c
1458ef33b	mov	qword ptr [rbp + 0x18], rax
1458ef33f	mov	rdx, qword ptr [rbp - 0x30]
1458ef343	mov	r8, qword ptr [rbp - 0x28]
1458ef347	jmp	0x1458ef229
1458ef34c	mov	qword ptr [rsi], 0xffffffffffffffff
1458ef353	jmp	0x1458ef280
