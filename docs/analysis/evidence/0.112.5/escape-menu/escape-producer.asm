14007d170	55	push	rbp
14007d171	4157	push	r15
14007d173	4156	push	r14
14007d175	4155	push	r13
14007d177	4154	push	r12
14007d179	56	push	rsi
14007d17a	57	push	rdi
14007d17b	53	push	rbx
14007d17c	4881ec28010000	sub	rsp, 0x128
14007d183	488dac2480000000	lea	rbp, [rsp + 0x80]
14007d18b	66440f7f8d90000000	movdqa	xmmword ptr [rbp + 0x90], xmm9
14007d194	66440f7f8580000000	movdqa	xmmword ptr [rbp + 0x80], xmm8
14007d19d	660f7f7d70	movdqa	xmmword ptr [rbp + 0x70], xmm7
14007d1a2	660f7f7560	movdqa	xmmword ptr [rbp + 0x60], xmm6
14007d1a7	48c74558feffffff	mov	qword ptr [rbp + 0x58], 0xfffffffffffffffe
14007d1af	4883ba9000000000	cmp	qword ptr [rdx + 0x90], 0
14007d1b7	0f848a020000	je	0x14007d447
14007d1bd	488b4278	mov	rax, qword ptr [rdx + 0x78]
14007d1c1	488b8a80000000	mov	rcx, qword ptr [rdx + 0x80]
14007d1c8	49b9bb2c35c05cbce5a7	movabs	r9, 0xa7e5bc5cc0352cbb
14007d1d2	4531d2	xor	r10d, r10d
14007d1d5	660f6f35d387d405	movdqa	xmm6, xmmword ptr [rip + 0x5d487d3]
14007d1dd	660f76c0	pcmpeqd	xmm0, xmm0
14007d1e1	660f6f3dd787d405	movdqa	xmm7, xmmword ptr [rip + 0x5d487d7]
14007d1e9	4921c9	and	r9, rcx
14007d1ec	f3420f6f0c08	movdqu	xmm1, xmmword ptr [rax + r9]
14007d1f2	660f6fd1	movdqa	xmm2, xmm1
14007d1f6	660f74d6	pcmpeqb	xmm2, xmm6
14007d1fa	66440fd7da	pmovmskb	r11d, xmm2
14007d1ff	4585db	test	r11d, r11d
14007d202	743c	je	0x14007d240
14007d204	f3410fbcf3	tzcnt	esi, r11d
14007d209	4c01ce	add	rsi, r9
14007d20c	4821ce	and	rsi, rcx
14007d20f	48f7de	neg	rsi
14007d212	488d3476	lea	rsi, [rsi + rsi*2]
14007d216	f30f6f54f0e8	movdqu	xmm2, xmmword ptr [rax + rsi*8 - 0x18]
14007d21c	660f74d7	pcmpeqb	xmm2, xmm7
14007d220	660fd7fa	pmovmskb	edi, xmm2
14007d224	81ffffff0000	cmp	edi, 0xffff
14007d22a	7433	je	0x14007d25f
14007d22c	418d73ff	lea	esi, [r11 - 1]
14007d230	664421de	and	si, r11w
14007d234	4189f3	mov	r11d, esi
14007d237	75cb	jne	0x14007d204
14007d239	0f1f8000000000	nop	dword ptr [rax]
14007d240	660f74c8	pcmpeqb	xmm1, xmm0
14007d244	66440fd7d9	pmovmskb	r11d, xmm1
14007d249	4585db	test	r11d, r11d
14007d24c	0f85f5010000	jne	0x14007d447
14007d252	4d01d1	add	r9, r10
14007d255	4983c110	add	r9, 0x10
14007d259	4983c210	add	r10, 0x10
14007d25d	eb8a	jmp	0x14007d1e9
14007d25f	488d04f0	lea	rax, [rax + rsi*8]
14007d263	488b40f8	mov	rax, qword ptr [rax - 8]
14007d267	483b8218020000	cmp	rax, qword ptr [rdx + 0x218]
14007d26e	0f83d3010000	jae	0x14007d447
14007d274	488b8a10020000	mov	rcx, qword ptr [rdx + 0x210]
14007d27b	488b0cc1	mov	rcx, qword ptr [rcx + rax*8]
14007d27f	4885c9	test	rcx, rcx
14007d282	0f84bf010000	je	0x14007d447
14007d288	488b82e0010000	mov	rax, qword ptr [rdx + 0x1e0]
14007d28f	48f7d1	not	rcx
14007d292	486bc938	imul	rcx, rcx, 0x38
14007d296	807c083000	cmp	byte ptr [rax + rcx + 0x30], 0
14007d29b	0f84a6010000	je	0x14007d447
14007d2a1	4801c8	add	rax, rcx
14007d2a4	488b4810	mov	rcx, qword ptr [rax + 0x10]
14007d2a8	448b8ab0050000	mov	r9d, dword ptr [rdx + 0x5b0]
14007d2af	4489482c	mov	dword ptr [rax + 0x2c], r9d
14007d2b3	c60100	mov	byte ptr [rcx], 0
14007d2b6	4883ba9000000000	cmp	qword ptr [rdx + 0x90], 0
14007d2be	0f84af010000	je	0x14007d473
14007d2c4	488b4278	mov	rax, qword ptr [rdx + 0x78]
14007d2c8	488b8a80000000	mov	rcx, qword ptr [rdx + 0x80]
14007d2cf	49b9341eb4c0e2b643c8	movabs	r9, 0xc843b6e2c0b41e34
14007d2d9	4531d2	xor	r10d, r10d
14007d2dc	660f6f05fc3cd505	movdqa	xmm0, xmmword ptr [rip + 0x5d53cfc]
14007d2e4	660f76c9	pcmpeqd	xmm1, xmm1
14007d2e8	660f6f15003dd505	movdqa	xmm2, xmmword ptr [rip + 0x5d53d00]
14007d2f0	4921c9	and	r9, rcx
14007d2f3	f3420f6f1c08	movdqu	xmm3, xmmword ptr [rax + r9]
14007d2f9	660f6fe3	movdqa	xmm4, xmm3
14007d2fd	660f74e0	pcmpeqb	xmm4, xmm0
14007d301	66440fd7dc	pmovmskb	r11d, xmm4
14007d306	4585db	test	r11d, r11d
14007d309	7435	je	0x14007d340
14007d30b	f3410fbcf3	tzcnt	esi, r11d
14007d310	4c01ce	add	rsi, r9
14007d313	4821ce	and	rsi, rcx
14007d316	48f7de	neg	rsi
14007d319	488d3476	lea	rsi, [rsi + rsi*2]
14007d31d	f30f6f64f0e8	movdqu	xmm4, xmmword ptr [rax + rsi*8 - 0x18]
14007d323	660f74e2	pcmpeqb	xmm4, xmm2
14007d327	660fd7fc	pmovmskb	edi, xmm4
14007d32b	81ffffff0000	cmp	edi, 0xffff
14007d331	742c	je	0x14007d35f
14007d333	418d73ff	lea	esi, [r11 - 1]
14007d337	664421de	and	si, r11w
14007d33b	4189f3	mov	r11d, esi
14007d33e	75cb	jne	0x14007d30b
14007d340	660f74d9	pcmpeqb	xmm3, xmm1
14007d344	66440fd7db	pmovmskb	r11d, xmm3
14007d349	4585db	test	r11d, r11d
14007d34c	0f8521010000	jne	0x14007d473
14007d352	4d01d1	add	r9, r10
14007d355	4983c110	add	r9, 0x10
14007d359	4983c210	add	r10, 0x10
14007d35d	eb91	jmp	0x14007d2f0
14007d35f	4c8d0cf0	lea	r9, [rax + rsi*8]
14007d363	4d8b49f8	mov	r9, qword ptr [r9 - 8]
14007d367	4c8b9218020000	mov	r10, qword ptr [rdx + 0x218]
14007d36e	4d39d1	cmp	r9, r10
14007d371	0f83fc000000	jae	0x14007d473
14007d377	4c8b9a10020000	mov	r11, qword ptr [rdx + 0x210]
14007d37e	4b8b34cb	mov	rsi, qword ptr [r11 + r9*8]
14007d382	4885f6	test	rsi, rsi
14007d385	0f84e8000000	je	0x14007d473
14007d38b	4c8b8ae0010000	mov	r9, qword ptr [rdx + 0x1e0]
14007d392	48f7d6	not	rsi
14007d395	486bf638	imul	rsi, rsi, 0x38
14007d399	41807c313000	cmp	byte ptr [r9 + rsi + 0x30], 0
14007d39f	0f84ce000000	je	0x14007d473
14007d3a5	4c01ce	add	rsi, r9
14007d3a8	488b7610	mov	rsi, qword ptr [rsi + 0x10]
14007d3ac	807e0d00	cmp	byte ptr [rsi + 0xd], 0
14007d3b0	0f852e010000	jne	0x14007d4e4
14007d3b6	48becf3d27b21f690680	movabs	rsi, 0x8006691fb2273dcf
14007d3c0	31ff	xor	edi, edi
14007d3c2	660f6f058681d405	movdqa	xmm0, xmmword ptr [rip + 0x5d48186]
14007d3ca	660f76c9	pcmpeqd	xmm1, xmm1
14007d3ce	660f6f158a81d405	movdqa	xmm2, xmmword ptr [rip + 0x5d4818a]
14007d3d6	4821ce	and	rsi, rcx
14007d3d9	f30f6f1c30	movdqu	xmm3, xmmword ptr [rax + rsi]
14007d3de	660f6fe3	movdqa	xmm4, xmm3
14007d3e2	660f74e0	pcmpeqb	xmm4, xmm0
14007d3e6	660fd7dc	pmovmskb	ebx, xmm4
14007d3ea	85db	test	ebx, ebx
14007d3ec	743c	je	0x14007d42a
14007d3ee	f3440fbcf3	tzcnt	r14d, ebx
14007d3f3	4901f6	add	r14, rsi
14007d3f6	4921ce	and	r14, rcx
14007d3f9	49f7de	neg	r14
14007d3fc	4f8d3476	lea	r14, [r14 + r14*2]
14007d400	f3420f6f64f0e8	movdqu	xmm4, xmmword ptr [rax + r14*8 - 0x18]
14007d407	660f74e2	pcmpeqb	xmm4, xmm2
14007d40b	66440fd7fc	pmovmskb	r15d, xmm4
14007d410	4181ffffff0000	cmp	r15d, 0xffff
14007d417	0f8482000000	je	0x14007d49f
14007d41d	448d73ff	lea	r14d, [rbx - 1]
14007d421	664121de	and	r14w, bx
14007d425	4489f3	mov	ebx, r14d
14007d428	75c4	jne	0x14007d3ee
14007d42a	660f74d9	pcmpeqb	xmm3, xmm1
14007d42e	660fd7db	pmovmskb	ebx, xmm3
14007d432	85db	test	ebx, ebx
14007d434	0f858e040000	jne	0x14007d8c8
14007d43a	4801fe	add	rsi, rdi
14007d43d	4883c610	add	rsi, 0x10
14007d441	4883c710	add	rdi, 0x10
14007d445	eb8f	jmp	0x14007d3d6
14007d447	488d4557	lea	rax, [rbp + 0x57]
14007d44b	488945e8	mov	qword ptr [rbp - 0x18], rax
14007d44f	488d054afaf904	lea	rax, [rip + 0x4f9fa4a]
14007d456	488945f0	mov	qword ptr [rbp - 0x10], rax
14007d45a	488d0ddf3ed505	lea	rcx, [rip + 0x5d53edf]
14007d461	4c8d059072d705	lea	r8, [rip + 0x5d77290]
14007d468	488d55e8	lea	rdx, [rbp - 0x18]
14007d46c	e84f0cd405	call	0x145dbe0c0
14007d471	0f0b	ud2
14007d473	488d4557	lea	rax, [rbp + 0x57]
14007d477	488945e8	mov	qword ptr [rbp - 0x18], rax
14007d47b	488d051efaf904	lea	rax, [rip + 0x4f9fa1e]
14007d482	488945f0	mov	qword ptr [rbp - 0x10], rax
14007d486	488d0db33ed505	lea	rcx, [rip + 0x5d53eb3]
14007d48d	4c8d057c72d705	lea	r8, [rip + 0x5d7727c]
14007d494	488d55e8	lea	rdx, [rbp - 0x18]
14007d498	e8230cd405	call	0x145dbe0c0
14007d49d	0f0b	ud2
14007d49f	4a8d04f0	lea	rax, [rax + r14*8]
14007d4a3	488b40f8	mov	rax, qword ptr [rax - 8]
14007d4a7	4c39d0	cmp	rax, r10
14007d4aa	0f8318040000	jae	0x14007d8c8
14007d4b0	498b04c3	mov	rax, qword ptr [r11 + rax*8]
14007d4b4	4885c0	test	rax, rax
14007d4b7	0f840b040000	je	0x14007d8c8
14007d4bd	48f7d0	not	rax
14007d4c0	486bc038	imul	rax, rax, 0x38
14007d4c4	41807c013000	cmp	byte ptr [r9 + rax + 0x30], 0
14007d4ca	0f84f8030000	je	0x14007d8c8
14007d4d0	4901c1	add	r9, rax
14007d4d3	498b4110	mov	rax, qword ptr [r9 + 0x10]
14007d4d7	80b8e800000000	cmp	byte ptr [rax + 0xe8], 0
14007d4de	0f8410040000	je	0x14007d8f4
14007d4e4	4889d1	mov	rcx, rdx
14007d4e7	4889d6	mov	rsi, rdx
14007d4ea	4c89c7	mov	rdi, r8
14007d4ed	e81e0d5e00	call	0x14065e210
14007d4f2	4889f2	mov	rdx, rsi
14007d4f5	4883be9000000000	cmp	qword ptr [rsi + 0x90], 0
14007d4fd	0f84fd000000	je	0x14007d600
14007d503	4989f8	mov	r8, rdi
14007d506	89c6	mov	esi, eax
14007d508	4080f601	xor	sil, 1
14007d50c	488b4278	mov	rax, qword ptr [rdx + 0x78]
14007d510	488b8a80000000	mov	rcx, qword ptr [rdx + 0x80]
14007d517	49b9938fc55bdbd64e17	movabs	r9, 0x174ed6db5bc58f93
14007d521	4531d2	xor	r10d, r10d
14007d524	66440f6f056350d405	movdqa	xmm8, xmmword ptr [rip + 0x5d45063]
14007d52d	660f76c0	pcmpeqd	xmm0, xmm0
14007d531	66440f6f0d8680d405	movdqa	xmm9, xmmword ptr [rip + 0x5d48086]
14007d53a	4921c9	and	r9, rcx
14007d53d	f3420f6f0c08	movdqu	xmm1, xmmword ptr [rax + r9]
14007d543	660f6fd1	movdqa	xmm2, xmm1
14007d547	66410f74d0	pcmpeqb	xmm2, xmm8
14007d54c	66440fd7da	pmovmskb	r11d, xmm2
14007d551	4585db	test	r11d, r11d
14007d554	7436	je	0x14007d58c
14007d556	f3410fbcfb	tzcnt	edi, r11d
14007d55b	4c01cf	add	rdi, r9
14007d55e	4821cf	and	rdi, rcx
14007d561	48f7df	neg	rdi
14007d564	488d3c7f	lea	rdi, [rdi + rdi*2]
14007d568	f30f6f54f8e8	movdqu	xmm2, xmmword ptr [rax + rdi*8 - 0x18]
14007d56e	66410f74d1	pcmpeqb	xmm2, xmm9
14007d573	660fd7da	pmovmskb	ebx, xmm2
14007d577	81fbffff0000	cmp	ebx, 0xffff
14007d57d	7428	je	0x14007d5a7
14007d57f	418d7bff	lea	edi, [r11 - 1]
14007d583	664421df	and	di, r11w
14007d587	4189fb	mov	r11d, edi
14007d58a	75ca	jne	0x14007d556
14007d58c	660f74c8	pcmpeqb	xmm1, xmm0
14007d590	66440fd7d9	pmovmskb	r11d, xmm1
14007d595	4585db	test	r11d, r11d
14007d598	7566	jne	0x14007d600
14007d59a	4d01d1	add	r9, r10
14007d59d	4983c110	add	r9, 0x10
14007d5a1	4983c210	add	r10, 0x10
14007d5a5	eb93	jmp	0x14007d53a
14007d5a7	4c8d0cf8	lea	r9, [rax + rdi*8]
14007d5ab	4d8b59f8	mov	r11, qword ptr [r9 - 8]
14007d5af	4c8b8a18020000	mov	r9, qword ptr [rdx + 0x218]
14007d5b6	4d39cb	cmp	r11, r9
14007d5b9	7345	jae	0x14007d600
14007d5bb	4c8b9210020000	mov	r10, qword ptr [rdx + 0x210]
14007d5c2	4f8b1cda	mov	r11, qword ptr [r10 + r11*8]
14007d5c6	4d85db	test	r11, r11
14007d5c9	7435	je	0x14007d600
14007d5cb	488bbae0010000	mov	rdi, qword ptr [rdx + 0x1e0]
14007d5d2	49f7d3	not	r11
14007d5d5	4d6bdb38	imul	r11, r11, 0x38
14007d5d9	42807c1f3000	cmp	byte ptr [rdi + r11 + 0x30], 0
14007d5df	741f	je	0x14007d600
14007d5e1	4901fb	add	r11, rdi
14007d5e4	4d8b5b10	mov	r11, qword ptr [r11 + 0x10]
14007d5e8	4180bbc001000001	cmp	byte ptr [r11 + 0x1c0], 1
14007d5f0	753a	jne	0x14007d62c
14007d5f2	4983bb90000000ff	cmp	qword ptr [r11 + 0x90], -1
14007d5fa	410f95c3	setne	r11b
14007d5fe	eb2f	jmp	0x14007d62f
14007d600	488d4557	lea	rax, [rbp + 0x57]
14007d604	488945e8	mov	qword ptr [rbp - 0x18], rax
14007d608	488d0591f8f904	lea	rax, [rip + 0x4f9f891]
14007d60f	488945f0	mov	qword ptr [rbp - 0x10], rax
14007d613	488d0d263dd505	lea	rcx, [rip + 0x5d53d26]
14007d61a	4c8d051f71d705	lea	r8, [rip + 0x5d7711f]
14007d621	488d55e8	lea	rdx, [rbp - 0x18]
14007d625	e8960ad405	call	0x145dbe0c0
14007d62a	0f0b	ud2
14007d62c	4531db	xor	r11d, r11d
14007d62f	44885d53	mov	byte ptr [rbp + 0x53], r11b
14007d633	49bb0d1dcea66ed7252a	movabs	r11, 0x2a25d76ea6ce1d0d
14007d63d	31db	xor	ebx, ebx
14007d63f	660f6f05b939d505	movdqa	xmm0, xmmword ptr [rip + 0x5d539b9]
14007d647	660f76c9	pcmpeqd	xmm1, xmm1
14007d64b	660f6f15bd39d505	movdqa	xmm2, xmmword ptr [rip + 0x5d539bd]
14007d653	4921cb	and	r11, rcx
14007d656	f3420f6f1c18	movdqu	xmm3, xmmword ptr [rax + r11]
14007d65c	660f6fe3	movdqa	xmm4, xmm3
14007d660	660f74e0	pcmpeqb	xmm4, xmm0
14007d664	66440fd7f4	pmovmskb	r14d, xmm4
14007d669	4585f6	test	r14d, r14d
14007d66c	7438	je	0x14007d6a6
14007d66e	f3450fbcfe	tzcnt	r15d, r14d
14007d673	4d01df	add	r15, r11
14007d676	4921cf	and	r15, rcx
14007d679	49f7df	neg	r15
14007d67c	4f8d3c7f	lea	r15, [r15 + r15*2]
14007d680	f3420f6f64f8e8	movdqu	xmm4, xmmword ptr [rax + r15*8 - 0x18]
14007d687	660f74e2	pcmpeqb	xmm4, xmm2
14007d68b	66440fd7e4	pmovmskb	r12d, xmm4
14007d690	4181fcffff0000	cmp	r12d, 0xffff
14007d697	742c	je	0x14007d6c5
14007d699	458d7eff	lea	r15d, [r14 - 1]
14007d69d	664521f7	and	r15w, r14w
14007d6a1	4589fe	mov	r14d, r15d
14007d6a4	75c8	jne	0x14007d66e
14007d6a6	660f74d9	pcmpeqb	xmm3, xmm1
14007d6aa	66440fd7f3	pmovmskb	r14d, xmm3
14007d6af	4585f6	test	r14d, r14d
14007d6b2	0f85e4010000	jne	0x14007d89c
14007d6b8	4901db	add	r11, rbx
14007d6bb	4983c310	add	r11, 0x10
14007d6bf	4883c310	add	rbx, 0x10
14007d6c3	eb8e	jmp	0x14007d653
14007d6c5	4a8d04f8	lea	rax, [rax + r15*8]
14007d6c9	488b40f8	mov	rax, qword ptr [rax - 8]
14007d6cd	4c39c8	cmp	rax, r9
14007d6d0	0f83c6010000	jae	0x14007d89c
14007d6d6	498b04c2	mov	rax, qword ptr [r10 + rax*8]
14007d6da	4885c0	test	rax, rax
14007d6dd	0f84b9010000	je	0x14007d89c
14007d6e3	48f7d0	not	rax
14007d6e6	486bc038	imul	rax, rax, 0x38
14007d6ea	807c073000	cmp	byte ptr [rdi + rax + 0x30], 0
14007d6ef	0f84a7010000	je	0x14007d89c
14007d6f5	4801c7	add	rdi, rax
14007d6f8	4c8b7710	mov	r14, qword ptr [rdi + 0x10]
14007d6fc	48895540	mov	qword ptr [rbp + 0x40], rdx
14007d700	448bbab0050000	mov	r15d, dword ptr [rdx + 0x5b0]
14007d707	498b08	mov	rcx, qword ptr [r8]
14007d70a	31db	xor	ebx, ebx
14007d70c	4889ca	mov	rdx, rcx
14007d70f	492b5618	sub	rdx, qword ptr [r14 + 0x18]
14007d713	480f42d3	cmovb	rdx, rbx
14007d717	492b4e38	sub	rcx, qword ptr [r14 + 0x38]
14007d71b	480f42cb	cmovb	rcx, rbx
14007d71f	486bc258	imul	rax, rdx, 0x58
14007d723	49034608	add	rax, qword ptr [r14 + 8]
14007d727	4d8b4e10	mov	r9, qword ptr [r14 + 0x10]
14007d72b	4929d1	sub	r9, rdx
14007d72e	4c0f42cb	cmovb	r9, rbx
14007d732	ba08000000	mov	edx, 8
14007d737	480f42c2	cmovb	rax, rdx
14007d73b	4c6bd158	imul	r10, rcx, 0x58
14007d73f	4d035628	add	r10, qword ptr [r14 + 0x28]
14007d743	4d8b5e30	mov	r11, qword ptr [r14 + 0x30]
14007d747	4929cb	sub	r11, rcx
14007d74a	4c0f42d2	cmovb	r10, rdx
14007d74e	4c0f42db	cmovb	r11, rbx
14007d752	4b8d0c0b	lea	rcx, [r11 + r9]
14007d756	498b5640	mov	rdx, qword ptr [r14 + 0x40]
14007d75a	4829ca	sub	rdx, rcx
14007d75d	498910	mov	qword ptr [r8], rdx
14007d760	496bd158	imul	rdx, r9, 0x58
14007d764	4801c2	add	rdx, rax
14007d767	4d6bcb58	imul	r9, r11, 0x58
14007d76b	4d01d1	add	r9, r10
14007d76e	4c894538	mov	qword ptr [rbp + 0x38], r8
14007d772	4c8945e8	mov	qword ptr [rbp - 0x18], r8
14007d776	488945f0	mov	qword ptr [rbp - 0x10], rax
14007d77a	488955f8	mov	qword ptr [rbp - 8], rdx
14007d77e	4c895500	mov	qword ptr [rbp], r10
14007d782	4c894d08	mov	qword ptr [rbp + 8], r9
14007d786	48894d10	mov	qword ptr [rbp + 0x10], rcx
14007d78a	488d4dc8	lea	rcx, [rbp - 0x38]
14007d78e	488d55e8	lea	rdx, [rbp - 0x18]
14007d792	e849682200	call	0x1402a3fe0
14007d797	4c8b5dd0	mov	r11, qword ptr [rbp - 0x30]
14007d79b	4c8b6dd8	mov	r13, qword ptr [rbp - 0x28]
14007d79f	4084f6	test	sil, sil
14007d7a2	7438	je	0x14007d7dc
14007d7a4	4c89e8	mov	rax, r13
14007d7a7	48c1e004	shl	rax, 4
14007d7ab	488d1480	lea	rdx, [rax + rax*4]
14007d7af	4c89d9	mov	rcx, r11
14007d7b2	66666666662e0f1f840000000000	nop	word ptr cs:[rax + rax]
14007d7c0	4889d0	mov	rax, rdx
14007d7c3	4885d2	test	rdx, rdx
14007d7c6	740e	je	0x14007d7d6
14007d7c8	83794073	cmp	dword ptr [rcx + 0x40], 0x73
14007d7cc	488d4950	lea	rcx, [rcx + 0x50]
14007d7d0	488d50b0	lea	rdx, [rax - 0x50]
14007d7d4	75ea	jne	0x14007d7c0
14007d7d6	4885c0	test	rax, rax
14007d7d9	0f95c3	setne	bl
14007d7dc	885d52	mov	byte ptr [rbp + 0x52], bl
14007d7df	488d4552	lea	rax, [rbp + 0x52]
14007d7e3	488945a0	mov	qword ptr [rbp - 0x60], rax
14007d7e7	488d4553	lea	rax, [rbp + 0x53]
14007d7eb	488945a8	mov	qword ptr [rbp - 0x58], rax
14007d7ef	4d85ed	test	r13, r13
14007d7f2	0f847b010000	je	0x14007d973
14007d7f8	4c89e9	mov	rcx, r13
14007d7fb	48c1e104	shl	rcx, 4
14007d7ff	488d0c89	lea	rcx, [rcx + rcx*4]
14007d803	f6455301	test	byte ptr [rbp + 0x53], 1
14007d807	0f84ee000000	je	0x14007d8fb
14007d80d	48ba000000000000187b	movabs	rdx, 0x7b18000000000000
14007d817	4531c0	xor	r8d, r8d
14007d81a	84db	test	bl, bl
14007d81c	754f	jne	0x14007d86d
14007d81e	eb0d	jmp	0x14007d82d
14007d820	4983c050	add	r8, 0x50
14007d824	4c39c1	cmp	rcx, r8
14007d827	0f8446010000	je	0x14007d973
14007d82d	43f644034c01	test	byte ptr [r11 + r8 + 0x4c], 1
14007d833	75eb	jne	0x14007d820
14007d835	478b4c0340	mov	r9d, dword ptr [r11 + r8 + 0x40]
14007d83a	4183f973	cmp	r9d, 0x73
14007d83e	74e0	je	0x14007d820
14007d840	4183f93e	cmp	r9d, 0x3e
14007d844	0f87db000000	ja	0x14007d925
14007d84a	4589c9	mov	r9d, r9d
14007d84d	4c0fa3ca	bt	rdx, r9
14007d851	72cd	jb	0x14007d820
14007d853	e9cd000000	jmp	0x14007d925
14007d858	0f1f840000000000	nop	dword ptr [rax + rax]
14007d860	4983c050	add	r8, 0x50
14007d864	4c39c1	cmp	rcx, r8
14007d867	0f8406010000	je	0x14007d973
14007d86d	478b4c0340	mov	r9d, dword ptr [r11 + r8 + 0x40]
14007d872	4183f973	cmp	r9d, 0x73
14007d876	0f84a9000000	je	0x14007d925
14007d87c	43f644034c01	test	byte ptr [r11 + r8 + 0x4c], 1
14007d882	75dc	jne	0x14007d860
14007d884	4183f93e	cmp	r9d, 0x3e
14007d888	0f8797000000	ja	0x14007d925
14007d88e	4589c9	mov	r9d, r9d
14007d891	4c0fa3ca	bt	rdx, r9
14007d895	72c9	jb	0x14007d860
14007d897	e989000000	jmp	0x14007d925
14007d89c	488d4557	lea	rax, [rbp + 0x57]
14007d8a0	488945e8	mov	qword ptr [rbp - 0x18], rax
14007d8a4	488d05f5f5f904	lea	rax, [rip + 0x4f9f5f5]
14007d8ab	488945f0	mov	qword ptr [rbp - 0x10], rax
14007d8af	488d0d8a3ad505	lea	rcx, [rip + 0x5d53a8a]
14007d8b6	4c8d059b6ed705	lea	r8, [rip + 0x5d76e9b]
14007d8bd	488d55e8	lea	rdx, [rbp - 0x18]
14007d8c1	e8fa07d405	call	0x145dbe0c0
14007d8c6	0f0b	ud2
14007d8c8	488d4557	lea	rax, [rbp + 0x57]
14007d8cc	488945e8	mov	qword ptr [rbp - 0x18], rax
14007d8d0	488d05c9f5f904	lea	rax, [rip + 0x4f9f5c9]
14007d8d7	488945f0	mov	qword ptr [rbp - 0x10], rax
14007d8db	488d0d5e3ad505	lea	rcx, [rip + 0x5d53a5e]
14007d8e2	4c8d053f6ed705	lea	r8, [rip + 0x5d76e3f]
14007d8e9	488d55e8	lea	rdx, [rbp - 0x18]
14007d8ed	e8ce07d405	call	0x145dbe0c0
14007d8f2	0f0b	ud2
14007d8f4	31f6	xor	esi, esi
14007d8f6	e911fcffff	jmp	0x14007d50c
14007d8fb	84db	test	bl, bl
14007d8fd	7407	je	0x14007d906
14007d8ff	41837b4073	cmp	dword ptr [r11 + 0x40], 0x73
14007d904	7427	je	0x14007d92d
14007d906	84db	test	bl, bl
14007d908	7469	je	0x14007d973
14007d90a	488d51b0	lea	rdx, [rcx - 0x50]
14007d90e	4531c0	xor	r8d, r8d
14007d911	4c39c2	cmp	rdx, r8
14007d914	745d	je	0x14007d973
14007d916	4383bc039000000073	cmp	dword ptr [r11 + r8 + 0x90], 0x73
14007d91f	4d8d4050	lea	r8, [r8 + 0x50]
14007d923	75ec	jne	0x14007d911
14007d925	84db	test	bl, bl
14007d927	0f84a0000000	je	0x14007d9cd
14007d92d	4989c8	mov	r8, rcx
14007d930	4d89d9	mov	r9, r11
14007d933	666666662e0f1f840000000000	nop	word ptr cs:[rax + rax]
14007d940	4c89c2	mov	rdx, r8
14007d943	4d85c0	test	r8, r8
14007d946	7420	je	0x14007d968
14007d948	4d89ca	mov	r10, r9
14007d94b	4983c150	add	r9, 0x50
14007d94f	4c8d42b0	lea	r8, [rdx - 0x50]
14007d953	41837a4073	cmp	dword ptr [r10 + 0x40], 0x73
14007d958	75e6	jne	0x14007d940
14007d95a	41807a4c00	cmp	byte ptr [r10 + 0x4c], 0
14007d95f	75df	jne	0x14007d940
14007d961	41807a4d00	cmp	byte ptr [r10 + 0x4d], 0
14007d966	75d8	jne	0x14007d940
14007d968	4885d2	test	rdx, rdx
14007d96b	0f95c2	setne	dl
14007d96e	895548	mov	dword ptr [rbp + 0x48], edx
14007d971	eb61	jmp	0x14007d9d4
14007d973	4c895d40	mov	qword ptr [rbp + 0x40], r11
14007d977	488d4dc8	lea	rcx, [rbp - 0x38]
14007d97b	e8e0672300	call	0x1402b4160
14007d980	90	nop
14007d981	488b45c8	mov	rax, qword ptr [rbp - 0x38]
14007d985	4885c0	test	rax, rax
14007d988	7417	je	0x14007d9a1
14007d98a	48c1e004	shl	rax, 4
14007d98e	488d1480	lea	rdx, [rax + rax*4]
14007d992	41b808000000	mov	r8d, 8
14007d998	488b4d40	mov	rcx, qword ptr [rbp + 0x40]
14007d99c	e82f48f8ff	call	0x1400021d0
14007d9a1	0f287560	movaps	xmm6, xmmword ptr [rbp + 0x60]
14007d9a5	0f287d70	movaps	xmm7, xmmword ptr [rbp + 0x70]
14007d9a9	440f288580000000	movaps	xmm8, xmmword ptr [rbp + 0x80]
14007d9b1	440f288d90000000	movaps	xmm9, xmmword ptr [rbp + 0x90]
14007d9b9	4881c428010000	add	rsp, 0x128
14007d9c0	5b	pop	rbx
14007d9c1	5f	pop	rdi
14007d9c2	5e	pop	rsi
14007d9c3	415c	pop	r12
14007d9c5	415d	pop	r13
14007d9c7	415e	pop	r14
14007d9c9	415f	pop	r15
14007d9cb	5d	pop	rbp
14007d9cc	c3	ret
14007d9cd	c7454800000000	mov	dword ptr [rbp + 0x48], 0
14007d9d4	4c01d9	add	rcx, r11
14007d9d7	4d89dc	mov	r12, r11
14007d9da	4c895de8	mov	qword ptr [rbp - 0x18], r11
14007d9de	48894df0	mov	qword ptr [rbp - 0x10], rcx
14007d9e2	488945f8	mov	qword ptr [rbp - 8], rax
14007d9e6	488d5da0	lea	rbx, [rbp - 0x60]
14007d9ea	48895d00	mov	qword ptr [rbp], rbx
14007d9ee	c6455401	mov	byte ptr [rbp + 0x54], 1
14007d9f2	488d4db0	lea	rcx, [rbp - 0x50]
14007d9f6	488d55e8	lea	rdx, [rbp - 0x18]
14007d9fa	e8216a2200	call	0x1402a4420
14007d9ff	90	nop
14007da00	44897f2c	mov	dword ptr [rdi + 0x2c], r15d
14007da04	498b4640	mov	rax, qword ptr [r14 + 0x40]
14007da08	49894618	mov	qword ptr [r14 + 0x18], rax
14007da0c	498d7620	lea	rsi, [r14 + 0x20]
14007da10	49894638	mov	qword ptr [r14 + 0x38], rax
14007da14	498b4608	mov	rax, qword ptr [r14 + 8]
14007da18	498b4e10	mov	rcx, qword ptr [r14 + 0x10]
14007da1c	49c7461000000000	mov	qword ptr [r14 + 0x10], 0
14007da24	486bd158	imul	rdx, rcx, 0x58
14007da28	4801c2	add	rdx, rax
14007da2b	4d8b4630	mov	r8, qword ptr [r14 + 0x30]
14007da2f	49c7463000000000	mov	qword ptr [r14 + 0x30], 0
14007da37	4d8b4e28	mov	r9, qword ptr [r14 + 0x28]
14007da3b	4d6bd058	imul	r10, r8, 0x58
14007da3f	4d01ca	add	r10, r9
14007da42	488945e8	mov	qword ptr [rbp - 0x18], rax
14007da46	488955f0	mov	qword ptr [rbp - 0x10], rdx
14007da4a	4c8975f8	mov	qword ptr [rbp - 8], r14
14007da4e	48894d00	mov	qword ptr [rbp], rcx
14007da52	48c7450800000000	mov	qword ptr [rbp + 8], 0
14007da5a	4c894d10	mov	qword ptr [rbp + 0x10], r9
14007da5e	4c895518	mov	qword ptr [rbp + 0x18], r10
14007da62	48897520	mov	qword ptr [rbp + 0x20], rsi
14007da66	4c894528	mov	qword ptr [rbp + 0x28], r8
14007da6a	48c7453000000000	mov	qword ptr [rbp + 0x30], 0
14007da72	c6455601	mov	byte ptr [rbp + 0x56], 1
14007da76	c6455501	mov	byte ptr [rbp + 0x55], 1
14007da7a	488d4de8	lea	rcx, [rbp - 0x18]
14007da7e	e8dd312400	call	0x1402c0c60
14007da83	90	nop
14007da84	44897f2c	mov	dword ptr [rdi + 0x2c], r15d
14007da88	488b45c8	mov	rax, qword ptr [rbp - 0x38]
14007da8c	4a8d0cad00000000	lea	rcx, [r13*4]
14007da94	4c01e9	add	rcx, r13
14007da97	48c1e104	shl	rcx, 4
14007da9b	4c01e1	add	rcx, r12
14007da9e	498b5640	mov	rdx, qword ptr [r14 + 0x40]
14007daa2	488955e0	mov	qword ptr [rbp - 0x20], rdx
14007daa6	4c8965e8	mov	qword ptr [rbp - 0x18], r12
14007daaa	4c8965f0	mov	qword ptr [rbp - 0x10], r12
14007daae	488945f8	mov	qword ptr [rbp - 8], rax
14007dab2	48894d00	mov	qword ptr [rbp], rcx
14007dab6	48895d08	mov	qword ptr [rbp + 8], rbx
14007daba	488d45e0	lea	rax, [rbp - 0x20]
14007dabe	48894510	mov	qword ptr [rbp + 0x10], rax
14007dac2	c6455601	mov	byte ptr [rbp + 0x56], 1
14007dac6	c6455500	mov	byte ptr [rbp + 0x55], 0
14007daca	488d55e8	lea	rdx, [rbp - 0x18]
14007dace	4889f1	mov	rcx, rsi
14007dad1	e83ac92100	call	0x14029a410
14007dad6	90	nop
14007dad7	488b45e0	mov	rax, qword ptr [rbp - 0x20]
14007dadb	49894640	mov	qword ptr [r14 + 0x40], rax
14007dadf	488b4d38	mov	rcx, qword ptr [rbp + 0x38]
14007dae3	488901	mov	qword ptr [rcx], rax
14007dae6	488b5d40	mov	rbx, qword ptr [rbp + 0x40]
14007daea	4883bb9000000000	cmp	qword ptr [rbx + 0x90], 0
14007daf2	0f846a020000	je	0x14007dd62
14007daf8	488b4378	mov	rax, qword ptr [rbx + 0x78]
14007dafc	488b8b80000000	mov	rcx, qword ptr [rbx + 0x80]
14007db03	48babb2c35c05cbce5a7	movabs	rdx, 0xa7e5bc5cc0352cbb
14007db0d	4531c0	xor	r8d, r8d
14007db10	660f76c0	pcmpeqd	xmm0, xmm0
14007db14	4821ca	and	rdx, rcx
14007db17	f30f6f0c10	movdqu	xmm1, xmmword ptr [rax + rdx]
14007db1c	660f6fd1	movdqa	xmm2, xmm1
14007db20	660f74d6	pcmpeqb	xmm2, xmm6
14007db24	66440fd7ca	pmovmskb	r9d, xmm2
14007db29	4585c9	test	r9d, r9d
14007db2c	7438	je	0x14007db66
14007db2e	f3450fbcd1	tzcnt	r10d, r9d
14007db33	4901d2	add	r10, rdx
14007db36	4921ca	and	r10, rcx
14007db39	49f7da	neg	r10
14007db3c	4f8d1452	lea	r10, [r10 + r10*2]
14007db40	f3420f6f54d0e8	movdqu	xmm2, xmmword ptr [rax + r10*8 - 0x18]
14007db47	660f74d7	pcmpeqb	xmm2, xmm7
14007db4b	66440fd7da	pmovmskb	r11d, xmm2
14007db50	4181fbffff0000	cmp	r11d, 0xffff
14007db57	742c	je	0x14007db85
14007db59	458d51ff	lea	r10d, [r9 - 1]
14007db5d	664521ca	and	r10w, r9w
14007db61	4589d1	mov	r9d, r10d
14007db64	75c8	jne	0x14007db2e
14007db66	660f74c8	pcmpeqb	xmm1, xmm0
14007db6a	66440fd7c9	pmovmskb	r9d, xmm1
14007db6f	4585c9	test	r9d, r9d
14007db72	0f85ea010000	jne	0x14007dd62
14007db78	4c01c2	add	rdx, r8
14007db7b	4883c210	add	rdx, 0x10
14007db7f	4983c010	add	r8, 0x10
14007db83	eb8f	jmp	0x14007db14
14007db85	4a8d04d0	lea	rax, [rax + r10*8]
14007db89	488b40f8	mov	rax, qword ptr [rax - 8]
14007db8d	483b8318020000	cmp	rax, qword ptr [rbx + 0x218]
14007db94	0f83c8010000	jae	0x14007dd62
14007db9a	488b8b10020000	mov	rcx, qword ptr [rbx + 0x210]
14007dba1	488b0cc1	mov	rcx, qword ptr [rcx + rax*8]
14007dba5	4885c9	test	rcx, rcx
14007dba8	0f84b4010000	je	0x14007dd62
14007dbae	488b83e0010000	mov	rax, qword ptr [rbx + 0x1e0]
14007dbb5	48f7d1	not	rcx
14007dbb8	486bc938	imul	rcx, rcx, 0x38
14007dbbc	807c083000	cmp	byte ptr [rax + rcx + 0x30], 0
14007dbc1	0f849b010000	je	0x14007dd62
14007dbc7	4801c8	add	rax, rcx
14007dbca	488b4810	mov	rcx, qword ptr [rax + 0x10]
14007dbce	8b93b0050000	mov	edx, dword ptr [rbx + 0x5b0]
14007dbd4	89502c	mov	dword ptr [rax + 0x2c], edx
14007dbd7	8b4548	mov	eax, dword ptr [rbp + 0x48]
14007dbda	8801	mov	byte ptr [rcx], al
14007dbdc	4883bb9000000000	cmp	qword ptr [rbx + 0x90], 0
14007dbe4	0f84ad010000	je	0x14007dd97
14007dbea	488b4378	mov	rax, qword ptr [rbx + 0x78]
14007dbee	488b8b80000000	mov	rcx, qword ptr [rbx + 0x80]
14007dbf5	48ba938fc55bdbd64e17	movabs	rdx, 0x174ed6db5bc58f93
14007dbff	4531c0	xor	r8d, r8d
14007dc02	660f76c0	pcmpeqd	xmm0, xmm0
14007dc06	4821ca	and	rdx, rcx
14007dc09	f30f6f0c10	movdqu	xmm1, xmmword ptr [rax + rdx]
14007dc0e	660f6fd1	movdqa	xmm2, xmm1
14007dc12	66410f74d0	pcmpeqb	xmm2, xmm8
14007dc17	66440fd7ca	pmovmskb	r9d, xmm2
14007dc1c	4585c9	test	r9d, r9d
14007dc1f	7439	je	0x14007dc5a
14007dc21	f3450fbcd1	tzcnt	r10d, r9d
14007dc26	4901d2	add	r10, rdx
14007dc29	4921ca	and	r10, rcx
14007dc2c	49f7da	neg	r10
14007dc2f	4f8d1452	lea	r10, [r10 + r10*2]
14007dc33	f3420f6f54d0e8	movdqu	xmm2, xmmword ptr [rax + r10*8 - 0x18]
14007dc3a	66410f74d1	pcmpeqb	xmm2, xmm9
14007dc3f	66440fd7da	pmovmskb	r11d, xmm2
14007dc44	4181fbffff0000	cmp	r11d, 0xffff
14007dc4b	742c	je	0x14007dc79
14007dc4d	458d51ff	lea	r10d, [r9 - 1]
14007dc51	664521ca	and	r10w, r9w
14007dc55	4589d1	mov	r9d, r10d
14007dc58	75c7	jne	0x14007dc21
14007dc5a	660f74c8	pcmpeqb	xmm1, xmm0
14007dc5e	66440fd7c9	pmovmskb	r9d, xmm1
14007dc63	4585c9	test	r9d, r9d
14007dc66	0f852b010000	jne	0x14007dd97
14007dc6c	4c01c2	add	rdx, r8
14007dc6f	4883c210	add	rdx, 0x10
14007dc73	4983c010	add	r8, 0x10
14007dc77	eb8d	jmp	0x14007dc06
14007dc79	4a8d04d0	lea	rax, [rax + r10*8]
14007dc7d	488b40f8	mov	rax, qword ptr [rax - 8]
14007dc81	483b8318020000	cmp	rax, qword ptr [rbx + 0x218]
14007dc88	0f8309010000	jae	0x14007dd97
14007dc8e	488b8b10020000	mov	rcx, qword ptr [rbx + 0x210]
14007dc95	488b04c1	mov	rax, qword ptr [rcx + rax*8]
14007dc99	4885c0	test	rax, rax
14007dc9c	0f84f5000000	je	0x14007dd97
14007dca2	488bbbe0010000	mov	rdi, qword ptr [rbx + 0x1e0]
14007dca9	48f7d0	not	rax
14007dcac	486bc038	imul	rax, rax, 0x38
14007dcb0	807c073000	cmp	byte ptr [rdi + rax + 0x30], 0
14007dcb5	0f84dc000000	je	0x14007dd97
14007dcbb	4801c7	add	rdi, rax
14007dcbe	4c8b7710	mov	r14, qword ptr [rdi + 0x10]
14007dcc2	8b83b0050000	mov	eax, dword ptr [rbx + 0x5b0]
14007dcc8	894540	mov	dword ptr [rbp + 0x40], eax
14007dccb	488b45b0	mov	rax, qword ptr [rbp - 0x50]
14007dccf	48894548	mov	qword ptr [rbp + 0x48], rax
14007dcd3	488b45b8	mov	rax, qword ptr [rbp - 0x48]
14007dcd7	48894538	mov	qword ptr [rbp + 0x38], rax
14007dcdb	488b45c0	mov	rax, qword ptr [rbp - 0x40]
14007dcdf	4885c0	test	rax, rax
14007dce2	745a	je	0x14007dd3e
14007dce4	488d0440	lea	rax, [rax + rax*2]
14007dce8	4c8b6538	mov	r12, qword ptr [rbp + 0x38]
14007dcec	4d8d3c84	lea	r15, [r12 + rax*4]
14007dcf0	eb21	jmp	0x14007dd13
14007dcf2	498b4620	mov	rax, qword ptr [r14 + 0x20]
14007dcf6	488d0c76	lea	rcx, [rsi + rsi*2]
14007dcfa	44892c88	mov	dword ptr [rax + rcx*4], r13d
14007dcfe	48895c8804	mov	qword ptr [rax + rcx*4 + 4], rbx
14007dd03	48ffc6	inc	rsi
14007dd06	49897628	mov	qword ptr [r14 + 0x28], rsi
14007dd0a	4983c40c	add	r12, 0xc
14007dd0e	4d39fc	cmp	r12, r15
14007dd11	742b	je	0x14007dd3e
14007dd13	458b2c24	mov	r13d, dword ptr [r12]
14007dd17	4183fdff	cmp	r13d, -1
14007dd1b	7421	je	0x14007dd3e
14007dd1d	498b5c2404	mov	rbx, qword ptr [r12 + 4]
14007dd22	8b4540	mov	eax, dword ptr [rbp + 0x40]
14007dd25	89472c	mov	dword ptr [rdi + 0x2c], eax
14007dd28	498b7628	mov	rsi, qword ptr [r14 + 0x28]
14007dd2c	493b7618	cmp	rsi, qword ptr [r14 + 0x18]
14007dd30	75c0	jne	0x14007dcf2
14007dd32	498d4e18	lea	rcx, [r14 + 0x18]
14007dd36	e825e8bc05	call	0x145c4c560
14007dd3b	90	nop
14007dd3c	ebb4	jmp	0x14007dcf2
14007dd3e	488b4548	mov	rax, qword ptr [rbp + 0x48]
14007dd42	4885c0	test	rax, rax
14007dd45	0f8456fcffff	je	0x14007d9a1
14007dd4b	48c1e002	shl	rax, 2
14007dd4f	488d1440	lea	rdx, [rax + rax*2]
14007dd53	41b804000000	mov	r8d, 4
14007dd59	488b4d38	mov	rcx, qword ptr [rbp + 0x38]
14007dd5d	e93afcffff	jmp	0x14007d99c
14007dd62	488d4557	lea	rax, [rbp + 0x57]
14007dd66	488945e8	mov	qword ptr [rbp - 0x18], rax
14007dd6a	488d052ff1f904	lea	rax, [rip + 0x4f9f12f]
14007dd71	488945f0	mov	qword ptr [rbp - 0x10], rax
14007dd75	c6455601	mov	byte ptr [rbp + 0x56], 1
14007dd79	c6455500	mov	byte ptr [rbp + 0x55], 0
14007dd7d	488d0dbc35d505	lea	rcx, [rip + 0x5d535bc]
14007dd84	4c8d05e569d705	lea	r8, [rip + 0x5d769e5]
14007dd8b	488d55e8	lea	rdx, [rbp - 0x18]
14007dd8f	e82c03d405	call	0x145dbe0c0
14007dd94	90	nop
14007dd95	eb33	jmp	0x14007ddca
14007dd97	488d4557	lea	rax, [rbp + 0x57]
14007dd9b	488945e8	mov	qword ptr [rbp - 0x18], rax
14007dd9f	488d05faf0f904	lea	rax, [rip + 0x4f9f0fa]
14007dda6	488945f0	mov	qword ptr [rbp - 0x10], rax
14007ddaa	c6455601	mov	byte ptr [rbp + 0x56], 1
14007ddae	c6455500	mov	byte ptr [rbp + 0x55], 0
14007ddb2	488d0d8735d505	lea	rcx, [rip + 0x5d53587]
14007ddb9	4c8d05c869d705	lea	r8, [rip + 0x5d769c8]
14007ddc0	488d55e8	lea	rdx, [rbp - 0x18]
14007ddc4	e8f702d405	call	0x145dbe0c0
14007ddc9	90	nop
14007ddca	0f0b	ud2
