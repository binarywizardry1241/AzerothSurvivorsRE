14065e210	56	push	rsi
14065e211	4883b99000000000	cmp	qword ptr [rcx + 0x90], 0
14065e219	0f84df000000	je	0x14065e2fe
14065e21f	488b4178	mov	rax, qword ptr [rcx + 0x78]
14065e223	488b9180000000	mov	rdx, qword ptr [rcx + 0x80]
14065e22a	49b8b7da7e81c3eb3522	movabs	r8, 0x2235ebc3817edab7
14065e234	4531c9	xor	r9d, r9d
14065e237	660f6f05213f7605	movdqa	xmm0, xmmword ptr [rip + 0x5763f21]
14065e23f	660f76c9	pcmpeqd	xmm1, xmm1
14065e243	660f6f1515578505	movdqa	xmm2, xmmword ptr [rip + 0x5855715]
14065e24b	4921d0	and	r8, rdx
14065e24e	f3420f6f1c00	movdqu	xmm3, xmmword ptr [rax + r8]
14065e254	660f6fe3	movdqa	xmm4, xmm3
14065e258	660f74e0	pcmpeqb	xmm4, xmm0
14065e25c	66440fd7d4	pmovmskb	r10d, xmm4
14065e261	4585d2	test	r10d, r10d
14065e264	743a	je	0x14065e2a0
14065e266	f3450fbcda	tzcnt	r11d, r10d
14065e26b	4d01c3	add	r11, r8
14065e26e	4921d3	and	r11, rdx
14065e271	49f7db	neg	r11
14065e274	4f8d1c5b	lea	r11, [r11 + r11*2]
14065e278	f3420f6f64d8e8	movdqu	xmm4, xmmword ptr [rax + r11*8 - 0x18]
14065e27f	660f74e2	pcmpeqb	xmm4, xmm2
14065e283	660fd7f4	pmovmskb	esi, xmm4
14065e287	81feffff0000	cmp	esi, 0xffff
14065e28d	742c	je	0x14065e2bb
14065e28f	458d5aff	lea	r11d, [r10 - 1]
14065e293	664521d3	and	r11w, r10w
14065e297	4589da	mov	r10d, r11d
14065e29a	75ca	jne	0x14065e266
14065e29c	0f1f4000	nop	dword ptr [rax]
14065e2a0	660f74d9	pcmpeqb	xmm3, xmm1
14065e2a4	66440fd7d3	pmovmskb	r10d, xmm3
14065e2a9	4585d2	test	r10d, r10d
14065e2ac	7550	jne	0x14065e2fe
14065e2ae	4d01c8	add	r8, r9
14065e2b1	4983c010	add	r8, 0x10
14065e2b5	4983c110	add	r9, 0x10
14065e2b9	eb90	jmp	0x14065e24b
14065e2bb	4a8d04d8	lea	rax, [rax + r11*8]
14065e2bf	488b40f8	mov	rax, qword ptr [rax - 8]
14065e2c3	483b8118020000	cmp	rax, qword ptr [rcx + 0x218]
14065e2ca	7332	jae	0x14065e2fe
14065e2cc	488b9110020000	mov	rdx, qword ptr [rcx + 0x210]
14065e2d3	488b14c2	mov	rdx, qword ptr [rdx + rax*8]
14065e2d7	4885d2	test	rdx, rdx
14065e2da	7422	je	0x14065e2fe
14065e2dc	488b81e0010000	mov	rax, qword ptr [rcx + 0x1e0]
14065e2e3	48f7d2	not	rdx
14065e2e6	486bca38	imul	rcx, rdx, 0x38
14065e2ea	807c083001	cmp	byte ptr [rax + rcx + 0x30], 1
14065e2ef	750d	jne	0x14065e2fe
14065e2f1	4801c8	add	rax, rcx
14065e2f4	488b4010	mov	rax, qword ptr [rax + 0x10]
14065e2f8	0fb64018	movzx	eax, byte ptr [rax + 0x18]
14065e2fc	5e	pop	rsi
14065e2fd	c3	ret
14065e2fe	31c0	xor	eax, eax
14065e300	5e	pop	rsi
14065e301	c3	ret
