1401a5860	push	rsi
1401a5861	sub	rsp, 0x80
1401a5868	mov	rsi, rcx
1401a586b	mov	rax, qword ptr [rdx + 0x20]
1401a586f	mov	qword ptr [rsp + 0x70], rax
1401a5874	movups	xmm0, xmmword ptr [rdx + 0x10]
1401a5878	movaps	xmmword ptr [rsp + 0x60], xmm0
1401a587d	mov	rax, qword ptr [rdx]
1401a5880	mov	r10, qword ptr [rdx + 8]
1401a5884	movzx	ecx, byte ptr [rdx + 0x28]
1401a5888	mov	qword ptr [rsp + 0x38], r9
1401a588d	mov	qword ptr [rsp + 0x30], r8
1401a5892	mov	byte ptr [rsp + 0x20], cl
1401a5896	mov	qword ptr [rsp + 0x28], 0
1401a589f	lea	rcx, [rsp + 0x40]
1401a58a4	lea	rdx, [rsp + 0x60]
1401a58a9	mov	r8, rax
1401a58ac	mov	r9, r10
1401a58af	call	0x140046860
1401a58b4	movaps	xmm0, xmmword ptr [rsp + 0x40]
1401a58b9	cmp	qword ptr [rsp + 0x40], 0
1401a58bf	je	0x1401a58ca
1401a58c1	mov	rax, qword ptr [rsp + 0x50]
1401a58c6	mov	qword ptr [rsi + 0x10], rax
1401a58ca	movups	xmmword ptr [rsi], xmm0
1401a58cd	mov	rax, rsi
1401a58d0	add	rsp, 0x80
1401a58d7	pop	rsi
1401a58d8	ret
