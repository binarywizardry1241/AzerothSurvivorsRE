14000ece0	push	rbp
14000ece1	push	rsi
14000ece2	sub	rsp, 0x38
14000ece6	lea	rbp, [rsp + 0x30]
14000eceb	mov	qword ptr [rbp], 0xfffffffffffffffe
14000ecf3	mov	rsi, rcx
14000ecf6	mov	byte ptr [rcx + 0x1c0], 0
14000ecfd	mov	rdx, qword ptr [rcx + 0x90]
14000ed04	cmp	rdx, -1
14000ed08	je	0x14000ed21
14000ed0a	test	rdx, rdx
14000ed0d	je	0x14000ed21
14000ed0f	mov	rcx, qword ptr [rsi + 0x98]
14000ed16	mov	r8d, 1
14000ed1c	call	0x1400021d0
14000ed21	mov	qword ptr [rsi + 0x90], 0xffffffffffffffff
14000ed2c	mov	qword ptr [rsi + 0x28], 0
14000ed34	mov	rdx, qword ptr [rsi + 0x188]
14000ed3b	cmp	rdx, -1
14000ed3f	je	0x14000ed76
14000ed41	test	rdx, rdx
14000ed44	je	0x14000ed58
14000ed46	mov	rcx, qword ptr [rsi + 0x190]
14000ed4d	mov	r8d, 1
14000ed53	call	0x1400021d0
14000ed58	mov	rdx, qword ptr [rsi + 0x1a0]
14000ed5f	test	rdx, rdx
14000ed62	je	0x14000ed76
14000ed64	mov	rcx, qword ptr [rsi + 0x1a8]
14000ed6b	mov	r8d, 1
14000ed71	call	0x1400021d0
14000ed76	mov	qword ptr [rsi + 0x188], 0xffffffffffffffff
14000ed81	mov	qword ptr [rsi + 0x88], 0
14000ed8c	lea	rcx, [rsi + 0xb0]
14000ed93	mov	qword ptr [rbp - 8], rcx
14000ed97	call	0x140007c10
14000ed9c	nop
14000ed9d	mov	qword ptr [rsi + 0xb0], 0xffffffffffffffff
14000eda8	mov	qword ptr [rsi], 0
14000edaf	add	rsp, 0x38
14000edb3	pop	rsi
14000edb4	pop	rbp
14000edb5	ret
