1402bca50	55	push	rbp
1402bca51	4157	push	r15
1402bca53	4156	push	r14
1402bca55	4155	push	r13
1402bca57	4154	push	r12
1402bca59	56	push	rsi
1402bca5a	57	push	rdi
1402bca5b	53	push	rbx
1402bca5c	4881ec18010000	sub	rsp, 0x118
1402bca63	488dac2480000000	lea	rbp, [rsp + 0x80]
1402bca6b	48c78590000000feffffff	mov	qword ptr [rbp + 0x90], 0xfffffffffffffffe
1402bca76	4889ce	mov	rsi, rcx
1402bca79	488b4208	mov	rax, qword ptr [rdx + 8]
1402bca7d	488b4a18	mov	rcx, qword ptr [rdx + 0x18]
1402bca81	4839c8	cmp	rax, rcx
1402bca84	0f84b5010000	je	0x1402bcc3f
1402bca8a	4889d7	mov	rdi, rdx
1402bca8d	488d5df0	lea	rbx, [rbp - 0x10]
1402bca91	4c8d7508	lea	r14, [rbp + 8]
1402bca95	4c8d7d74	lea	r15, [rbp + 0x74]
1402bca99	4d8b20	mov	r12, qword ptr [r8]
1402bca9c	49bd000000000000187b	movabs	r13, 0x7b18000000000000
1402bcaa6	eb19	jmp	0x1402bcac1
1402bcaa8	0f1f840000000000	nop	dword ptr [rax + rax]
1402bcab0	488b4708	mov	rax, qword ptr [rdi + 8]
1402bcab4	488b4f18	mov	rcx, qword ptr [rdi + 0x18]
1402bcab8	4839c8	cmp	rax, rcx
1402bcabb	0f847e010000	je	0x1402bcc3f
1402bcac1	0f104040	movups	xmm0, xmmword ptr [rax + 0x40]
1402bcac5	0f294570	movaps	xmmword ptr [rbp + 0x70], xmm0
1402bcac9	0f1000	movups	xmm0, xmmword ptr [rax]
1402bcacc	0f104810	movups	xmm1, xmmword ptr [rax + 0x10]
1402bcad0	0f105020	movups	xmm2, xmmword ptr [rax + 0x20]
1402bcad4	0f105830	movups	xmm3, xmmword ptr [rax + 0x30]
1402bcad8	0f295d60	movaps	xmmword ptr [rbp + 0x60], xmm3
1402bcadc	0f295550	movaps	xmmword ptr [rbp + 0x50], xmm2
1402bcae0	0f294d40	movaps	xmmword ptr [rbp + 0x40], xmm1
1402bcae4	0f294530	movaps	xmmword ptr [rbp + 0x30], xmm0
1402bcae8	4883c050	add	rax, 0x50
1402bcaec	48894708	mov	qword ptr [rdi + 8], rax
1402bcaf0	0f284570	movaps	xmm0, xmmword ptr [rbp + 0x70]
1402bcaf4	0f294520	movaps	xmmword ptr [rbp + 0x20], xmm0
1402bcaf8	0f284530	movaps	xmm0, xmmword ptr [rbp + 0x30]
1402bcafc	0f284d40	movaps	xmm1, xmmword ptr [rbp + 0x40]
1402bcb00	0f285550	movaps	xmm2, xmmword ptr [rbp + 0x50]
1402bcb04	0f285d60	movaps	xmm3, xmmword ptr [rbp + 0x60]
1402bcb08	0f295d10	movaps	xmmword ptr [rbp + 0x10], xmm3
1402bcb0c	0f295500	movaps	xmmword ptr [rbp], xmm2
1402bcb10	0f294df0	movaps	xmmword ptr [rbp - 0x10], xmm1
1402bcb14	0f2945e0	movaps	xmmword ptr [rbp - 0x20], xmm0
1402bcb18	8b5520	mov	edx, dword ptr [rbp + 0x20]
1402bcb1b	4d8b0424	mov	r8, qword ptr [r12]
1402bcb1f	83fa73	cmp	edx, 0x73
1402bcb22	410f94c1	sete	r9b
1402bcb26	458408	test	byte ptr [r8], r9b
1402bcb29	7435	je	0x1402bcb60
1402bcb2b	8b45e0	mov	eax, dword ptr [rbp - 0x20]
1402bcb2e	85c0	test	eax, eax
1402bcb30	0f84ba000000	je	0x1402bcbf0
1402bcb36	83f801	cmp	eax, 1
1402bcb39	0f85d1000000	jne	0x1402bcc10
1402bcb3f	807de819	cmp	byte ptr [rbp - 0x18], 0x19
1402bcb43	0f87c7000000	ja	0x1402bcc10
1402bcb49	0f84a7000000	je	0x1402bcbf6
1402bcb4f	e9bc000000	jmp	0x1402bcc10
1402bcb54	6666662e0f1f840000000000	nop	word ptr cs:[rax + rax]
1402bcb60	83fa73	cmp	edx, 0x73
1402bcb63	410f94c0	sete	r8b
1402bcb67	4d8b4c2408	mov	r9, qword ptr [r12 + 8]
1402bcb6c	450fb609	movzx	r9d, byte ptr [r9]
1402bcb70	41f6d1	not	r9b
1402bcb73	440a452c	or	r8b, byte ptr [rbp + 0x2c]
1402bcb77	4508c8	or	r8b, r9b
1402bcb7a	41f6c001	test	r8b, 1
1402bcb7e	7450	je	0x1402bcbd0
1402bcb80	0f284530	movaps	xmm0, xmmword ptr [rbp + 0x30]
1402bcb84	0f284d40	movaps	xmm1, xmmword ptr [rbp + 0x40]
1402bcb88	0f285550	movaps	xmm2, xmmword ptr [rbp + 0x50]
1402bcb8c	0f285d60	movaps	xmm3, xmmword ptr [rbp + 0x60]
1402bcb90	0f295dd0	movaps	xmmword ptr [rbp - 0x30], xmm3
1402bcb94	0f2955c0	movaps	xmmword ptr [rbp - 0x40], xmm2
1402bcb98	0f294db0	movaps	xmmword ptr [rbp - 0x50], xmm1
1402bcb9c	0f2945a0	movaps	xmmword ptr [rbp - 0x60], xmm0
1402bcba0	4d8b07	mov	r8, qword ptr [r15]
1402bcba3	4c898580000000	mov	qword ptr [rbp + 0x80], r8
1402bcbaa	458b4708	mov	r8d, dword ptr [r15 + 8]
1402bcbae	44898588000000	mov	dword ptr [rbp + 0x88], r8d
1402bcbb5	83faff	cmp	edx, -1
1402bcbb8	0f84fafeffff	je	0x1402bcab8
1402bcbbe	e9b9000000	jmp	0x1402bcc7c
1402bcbc3	666666662e0f1f840000000000	nop	word ptr cs:[rax + rax]
1402bcbd0	83fa3e	cmp	edx, 0x3e
1402bcbd3	0f8752ffffff	ja	0x1402bcb2b
1402bcbd9	89d0	mov	eax, edx
1402bcbdb	490fa3c5	bt	r13, rax
1402bcbdf	0f8346ffffff	jae	0x1402bcb2b
1402bcbe5	eb61	jmp	0x1402bcc48
1402bcbe7	660f1f840000000000	nop	word ptr [rax + rax]
1402bcbf0	807de819	cmp	byte ptr [rbp - 0x18], 0x19
1402bcbf4	721a	jb	0x1402bcc10
1402bcbf6	488b45f0	mov	rax, qword ptr [rbp - 0x10]
1402bcbfa	f048ff08	lock dec	qword ptr [rax]
1402bcbfe	7510	jne	0x1402bcc10
1402bcc00	4889d9	mov	rcx, rbx
1402bcc03	e8a8c71a02	call	0x1424693b0
1402bcc08	90	nop
1402bcc09	0f1f8000000000	nop	dword ptr [rax]
1402bcc10	0fb64500	movzx	eax, byte ptr [rbp]
1402bcc14	3cff	cmp	al, 0xff
1402bcc16	0f8494feffff	je	0x1402bcab0
1402bcc1c	3c19	cmp	al, 0x19
1402bcc1e	0f828cfeffff	jb	0x1402bcab0
1402bcc24	488b4508	mov	rax, qword ptr [rbp + 8]
1402bcc28	f048ff08	lock dec	qword ptr [rax]
1402bcc2c	0f857efeffff	jne	0x1402bcab0
1402bcc32	4c89f1	mov	rcx, r14
1402bcc35	e876c71a02	call	0x1424693b0
1402bcc3a	e971feffff	jmp	0x1402bcab0
1402bcc3f	c74640ffffffff	mov	dword ptr [rsi + 0x40], 0xffffffff
1402bcc46	eb6a	jmp	0x1402bccb2
1402bcc48	0f284530	movaps	xmm0, xmmword ptr [rbp + 0x30]
1402bcc4c	0f284d40	movaps	xmm1, xmmword ptr [rbp + 0x40]
1402bcc50	0f285550	movaps	xmm2, xmmword ptr [rbp + 0x50]
1402bcc54	0f285d60	movaps	xmm3, xmmword ptr [rbp + 0x60]
1402bcc58	0f295dd0	movaps	xmmword ptr [rbp - 0x30], xmm3
1402bcc5c	0f2955c0	movaps	xmmword ptr [rbp - 0x40], xmm2
1402bcc60	0f294db0	movaps	xmmword ptr [rbp - 0x50], xmm1
1402bcc64	0f2945a0	movaps	xmmword ptr [rbp - 0x60], xmm0
1402bcc68	488b4574	mov	rax, qword ptr [rbp + 0x74]
1402bcc6c	48898580000000	mov	qword ptr [rbp + 0x80], rax
1402bcc73	8b457c	mov	eax, dword ptr [rbp + 0x7c]
1402bcc76	898588000000	mov	dword ptr [rbp + 0x88], eax
1402bcc7c	0f2845a0	movaps	xmm0, xmmword ptr [rbp - 0x60]
1402bcc80	0f284db0	movaps	xmm1, xmmword ptr [rbp - 0x50]
1402bcc84	0f2855c0	movaps	xmm2, xmmword ptr [rbp - 0x40]
1402bcc88	0f285dd0	movaps	xmm3, xmmword ptr [rbp - 0x30]
1402bcc8c	0f115e30	movups	xmmword ptr [rsi + 0x30], xmm3
1402bcc90	0f115620	movups	xmmword ptr [rsi + 0x20], xmm2
1402bcc94	0f114e10	movups	xmmword ptr [rsi + 0x10], xmm1
1402bcc98	0f1106	movups	xmmword ptr [rsi], xmm0
1402bcc9b	488b8580000000	mov	rax, qword ptr [rbp + 0x80]
1402bcca2	48894644	mov	qword ptr [rsi + 0x44], rax
1402bcca6	8b8588000000	mov	eax, dword ptr [rbp + 0x88]
1402bccac	89464c	mov	dword ptr [rsi + 0x4c], eax
1402bccaf	895640	mov	dword ptr [rsi + 0x40], edx
1402bccb2	4889f0	mov	rax, rsi
1402bccb5	4881c418010000	add	rsp, 0x118
1402bccbc	5b	pop	rbx
1402bccbd	5f	pop	rdi
1402bccbe	5e	pop	rsi
1402bccbf	415c	pop	r12
1402bccc1	415d	pop	r13
1402bccc3	415e	pop	r14
1402bccc5	415f	pop	r15
1402bccc7	5d	pop	rbp
1402bccc8	c3	ret
