1459a29c0	push	rbp
1459a29c1	push	rsi
1459a29c2	push	rdi
1459a29c3	push	rbx
1459a29c4	sub	rsp, 0x428
1459a29cb	lea	rbp, [rsp + 0x80]
1459a29d3	mov	qword ptr [rbp + 0x3a0], 0xfffffffffffffffe
1459a29de	mov	eax, dword ptr [rip + 0x26e7dd4]
1459a29e4	test	eax, eax
1459a29e6	je	0x1459a2b88
1459a29ec	lea	rcx, [rbp + 0x188]
1459a29f3	call	0x145a67850
1459a29f8	mov	rax, qword ptr [rbp + 0x188]
1459a29ff	xor	r8d, r8d
1459a2a02	cmp	rax, -1
1459a2a06	mov	edx, 1
1459a2a0b	cmovne	rdx, qword ptr [rbp + 0x190]
1459a2a13	cmove	rax, r8
1459a2a17	mov	qword ptr [rbp + 0x398], rax
1459a2a1e	cmovne	r8, qword ptr [rbp + 0x198]
1459a2a26	lea	rcx, [rbp - 0x58]
1459a2a2a	mov	qword ptr [rbp + 0x390], rdx
1459a2a31	call	0x145ac7450
1459a2a36	nop
1459a2a37	mov	rax, qword ptr [rbp - 0x58]
1459a2a3b	lea	rcx, [rbp - 0x50]
1459a2a3f	cmp	rax, -1
1459a2a43	je	0x1459a2ba2
1459a2a49	mov	rdx, qword ptr [rcx + 0x10]
1459a2a4d	mov	qword ptr [rbp + 0x388], rdx
1459a2a54	movups	xmm0, xmmword ptr [rcx]
1459a2a57	movups	xmmword ptr [rbp + 0x378], xmm0
1459a2a5e	mov	qword ptr [rbp + 0x370], rax
1459a2a65	mov	rdx, qword ptr [rbp + 0x398]
1459a2a6c	test	rdx, rdx
1459a2a6f	je	0x1459a2a84
1459a2a71	mov	r8d, 1
1459a2a77	mov	rcx, qword ptr [rbp + 0x390]
1459a2a7e	call	0x1400021d0
1459a2a83	nop
1459a2a84	lea	rcx, [rbp - 0x58]
1459a2a88	lea	rdx, [rbp + 0x370]
1459a2a8f	call	0x145a7d0b0
1459a2a94	nop
1459a2a95	mov	rdi, qword ptr [rbp - 0x58]
1459a2a99	lea	rdx, [rbp - 0x50]
1459a2a9d	cmp	rdi, -1
1459a2aa1	je	0x1459a2bca
1459a2aa7	lea	rsi, [rbp + 0x190]
1459a2aae	mov	r8d, 0x1d8
1459a2ab4	mov	rcx, rsi
1459a2ab7	call	0x145bfa0e7
1459a2abc	mov	qword ptr [rbp + 0x188], rdi
1459a2ac3	mov	eax, dword ptr [rip + 0x26e7cef]
1459a2ac9	test	eax, eax
1459a2acb	jne	0x1459a2c76
1459a2ad1	mov	rdi, qword ptr [rbp + 0x188]
1459a2ad8	cmp	rdi, -1
1459a2adc	je	0x1459a2afe
1459a2ade	lea	rcx, [rbp - 0x50]
1459a2ae2	mov	r8d, 0x1d8
1459a2ae8	mov	rdx, rsi
1459a2aeb	call	0x145bfa0e7
1459a2af0	mov	qword ptr [rbp - 0x58], rdi
1459a2af4	lea	rcx, [rbp - 0x58]
1459a2af8	call	0x14091e930
1459a2afd	nop
1459a2afe	mov	rax, qword ptr [rbp + 0x380]
1459a2b05	mov	qword ptr [rbp + 0x390], rax
1459a2b0c	test	rax, rax
1459a2b0f	je	0x1459a2b66
1459a2b11	mov	rsi, qword ptr [rbp + 0x378]
1459a2b18	mov	rdi, qword ptr [rbp + 0x390]
1459a2b1f	neg	rdi
1459a2b22	mov	ecx, 1
1459a2b27	mov	qword ptr [rbp + 0x368], rsi
1459a2b2e	jmp	0x1459a2b4b
1459a2b30	mov	rcx, qword ptr [rbp + 0x398]
1459a2b37	lea	rax, [rdi + rcx]
1459a2b3b	inc	rax
1459a2b3e	inc	rcx
1459a2b41	add	rsi, 8
1459a2b45	cmp	rax, 1
1459a2b49	je	0x1459a2b66
1459a2b4b	mov	qword ptr [rbp + 0x398], rcx
1459a2b52	mov	rax, qword ptr [rsi]
1459a2b55	lock dec	qword ptr [rax]
1459a2b59	jne	0x1459a2b30
1459a2b5b	mov	rcx, rsi
1459a2b5e	call	0x145a71530
1459a2b63	nop
1459a2b64	jmp	0x1459a2b30
1459a2b66	mov	rdx, qword ptr [rbp + 0x370]
1459a2b6d	test	rdx, rdx
1459a2b70	je	0x1459a2b88
1459a2b72	mov	rcx, qword ptr [rbp + 0x378]
1459a2b79	shl	rdx, 3
1459a2b7d	mov	r8d, 8
1459a2b83	call	0x1400021d0
1459a2b88	lea	rcx, [rip + 0x26e7a49]
1459a2b8f	mov	edx, dword ptr [rip + 0x26e7c23]
1459a2b95	xor	eax, eax
1459a2b97	test	edx, edx
1459a2b99	cmove	rax, rcx
1459a2b9d	jmp	0x1459a2c6a
1459a2ba2	call	0x145b9d070
1459a2ba7	nop
1459a2ba8	mov	rdx, qword ptr [rbp + 0x398]
1459a2baf	test	rdx, rdx
1459a2bb2	je	0x1459a2c68
1459a2bb8	mov	r8d, 1
1459a2bbe	mov	rcx, qword ptr [rbp + 0x390]
1459a2bc5	jmp	0x1459a2c63
1459a2bca	mov	rcx, rdx
1459a2bcd	call	0x145b9d070
1459a2bd2	nop
1459a2bd3	mov	rax, qword ptr [rbp + 0x380]
1459a2bda	mov	qword ptr [rbp + 0x390], rax
1459a2be1	test	rax, rax
1459a2be4	je	0x1459a2c46
1459a2be6	mov	rsi, qword ptr [rbp + 0x378]
1459a2bed	mov	rdi, qword ptr [rbp + 0x390]
1459a2bf4	neg	rdi
1459a2bf7	mov	ecx, 1
1459a2bfc	mov	qword ptr [rbp + 0x368], rsi
1459a2c03	jmp	0x1459a2c2b
1459a2c05	nop	word ptr cs:[rax + rax]
1459a2c10	mov	rcx, qword ptr [rbp + 0x398]
1459a2c17	lea	rax, [rdi + rcx]
1459a2c1b	inc	rax
1459a2c1e	inc	rcx
1459a2c21	add	rsi, 8
1459a2c25	cmp	rax, 1
1459a2c29	je	0x1459a2c46
1459a2c2b	mov	qword ptr [rbp + 0x398], rcx
1459a2c32	mov	rax, qword ptr [rsi]
1459a2c35	lock dec	qword ptr [rax]
1459a2c39	jne	0x1459a2c10
1459a2c3b	mov	rcx, rsi
1459a2c3e	call	0x145a71530
1459a2c43	nop
1459a2c44	jmp	0x1459a2c10
1459a2c46	mov	rdx, qword ptr [rbp + 0x370]
1459a2c4d	test	rdx, rdx
1459a2c50	je	0x1459a2c68
1459a2c52	mov	rcx, qword ptr [rbp + 0x378]
1459a2c59	shl	rdx, 3
1459a2c5d	mov	r8d, 8
1459a2c63	call	0x1400021d0
1459a2c68	xor	eax, eax
1459a2c6a	add	rsp, 0x428
1459a2c71	pop	rbx
1459a2c72	pop	rdi
1459a2c73	pop	rsi
1459a2c74	pop	rbp
1459a2c75	ret
1459a2c76	lea	rcx, [rip + 0x26e795b]
1459a2c7d	lea	rdx, [rbp + 0x188]
1459a2c84	call	0x145d7e2c4
1459a2c89	nop
1459a2c8a	jmp	0x1459a2ad1
