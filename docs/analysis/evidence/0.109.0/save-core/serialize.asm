1458a4340	push	rbp
1458a4341	push	r15
1458a4343	push	r14
1458a4345	push	r13
1458a4347	push	r12
1458a4349	push	rsi
1458a434a	push	rdi
1458a434b	push	rbx
1458a434c	sub	rsp, 0x1a8
1458a4353	lea	rbp, [rsp + 0x80]
1458a435b	mov	qword ptr [rbp + 0x120], 0xfffffffffffffffe
1458a4366	mov	qword ptr [rbp - 0x58], rcx
1458a436a	mov	qword ptr [rbp + 0xf8], 0
1458a4375	mov	qword ptr [rbp + 0x100], 1
1458a4380	mov	qword ptr [rbp + 0x108], 0
1458a438b	mov	rsi, qword ptr [rdx + 8]
1458a438f	mov	qword ptr [rbp + 0xb8], rdx
1458a4396	imul	rbx, qword ptr [rdx + 0x10], 0x38
1458a439b	add	rbx, rsi
1458a439e	mov	r15, rbp
1458a43a1	lea	r12, [rip + 0x1347483]
1458a43a8	jmp	0x1458a43b3
1458a43aa	nop	word ptr [rax + rax]
1458a43b0	mov	rsi, r13
1458a43b3	cmp	rsi, rbx
1458a43b6	je	0x1458a4606
1458a43bc	lea	r13, [rsi + 0x38]
1458a43c0	lea	rdx, [rsi + 0x33]
1458a43c4	lea	rcx, [rbp + 0xa0]
1458a43cb	mov	r8, r13
1458a43ce	call	0x1459c8eb0
1458a43d3	nop
1458a43d4	mov	rdi, qword ptr [rbp + 0xa8]
1458a43db	mov	r14, qword ptr [rbp + 0xb0]
1458a43e2	mov	qword ptr [rsp + 0x20], 1
1458a43eb	mov	rcx, r15
1458a43ee	mov	rdx, rdi
1458a43f1	mov	r8, r14
1458a43f4	lea	r9, [rip + 0x13470d9]
1458a43fb	call	0x14588ad20
1458a4400	nop
1458a4401	lea	rax, [rsi + 0x32]
1458a4405	lea	rcx, [rsi + 0x31]
1458a4409	lea	rdx, [rsi + 0x30]
1458a440d	lea	r8, [rsi + 0x18]
1458a4411	mov	r9, qword ptr [rbp + 0x10]
1458a4415	mov	qword ptr [rbp + 0xf0], r9
1458a441c	movdqu	xmm0, xmmword ptr [rbp]
1458a4421	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a4429	lea	r9, [rsi + 0x20]
1458a442d	lea	r10, [rsi + 0x24]
1458a4431	lea	r11, [rsi + 0x28]
1458a4435	mov	qword ptr [rbp], r8
1458a4439	lea	r8, [rip + 0x33b390]
1458a4440	mov	qword ptr [rbp + 8], r8
1458a4444	mov	qword ptr [rbp + 0x10], rsi
1458a4448	add	rsi, 0x2c
1458a444c	lea	r8, [rip - 0x58a2373]
1458a4453	mov	qword ptr [rbp + 0x18], r8
1458a4457	mov	qword ptr [rbp + 0x20], rdx
1458a445b	lea	rdx, [rip + 0x336dae]
1458a4462	mov	qword ptr [rbp + 0x28], rdx
1458a4466	mov	qword ptr [rbp + 0x30], rcx
1458a446a	mov	qword ptr [rbp + 0x38], rdx
1458a446e	mov	qword ptr [rbp + 0x40], rax
1458a4472	mov	qword ptr [rbp + 0x48], rdx
1458a4476	lea	rax, [rbp + 0xe0]
1458a447d	mov	qword ptr [rbp + 0x50], rax
1458a4481	mov	qword ptr [rbp + 0x58], r8
1458a4485	mov	qword ptr [rbp + 0x60], r9
1458a4489	lea	rax, [rip + 0x33a450]
1458a4490	mov	qword ptr [rbp + 0x68], rax
1458a4494	mov	qword ptr [rbp + 0x70], r10
1458a4498	mov	qword ptr [rbp + 0x78], rax
1458a449c	mov	qword ptr [rbp + 0x80], r11
1458a44a3	mov	qword ptr [rbp + 0x88], rax
1458a44aa	mov	qword ptr [rbp + 0x90], rsi
1458a44b1	mov	qword ptr [rbp + 0x98], rax
1458a44b8	lea	rcx, [rbp + 0xc0]
1458a44bf	mov	rdx, r12
1458a44c2	mov	r8, r15
1458a44c5	call	0x145bcce30
1458a44ca	nop
1458a44cb	mov	rdx, qword ptr [rbp + 0xe0]
1458a44d2	test	rdx, rdx
1458a44d5	je	0x1458a44e9
1458a44d7	mov	rcx, qword ptr [rbp + 0xe8]
1458a44de	mov	r8d, 1
1458a44e4	call	0x1400021d0
1458a44e9	mov	rax, qword ptr [rbp + 0xc0]
1458a44f0	mov	qword ptr [rbp + 0x110], rax
1458a44f7	mov	rax, qword ptr [rbp + 0xc8]
1458a44fe	mov	qword ptr [rbp + 0x118], rax
1458a4505	mov	rsi, qword ptr [rbp + 0xd0]
1458a450c	mov	rax, qword ptr [rbp + 0xf8]
1458a4513	mov	rdx, qword ptr [rbp + 0x108]
1458a451a	sub	rax, rdx
1458a451d	cmp	rsi, rax
1458a4520	ja	0x1458a45db
1458a4526	test	rsi, rsi
1458a4529	je	0x1458a454b
1458a452b	add	rdx, qword ptr [rbp + 0x100]
1458a4532	mov	rcx, rdx
1458a4535	mov	rdx, qword ptr [rbp + 0x118]
1458a453c	mov	r8, rsi
1458a453f	call	0x145bfa0e7
1458a4544	mov	rdx, qword ptr [rbp + 0x108]
1458a454b	add	rdx, rsi
1458a454e	mov	qword ptr [rbp + 0x108], rdx
1458a4555	mov	rdx, qword ptr [rbp + 0x110]
1458a455c	test	rdx, rdx
1458a455f	je	0x1458a4573
1458a4561	mov	r8d, 1
1458a4567	mov	rcx, qword ptr [rbp + 0x118]
1458a456e	call	0x1400021d0
1458a4573	test	r14, r14
1458a4576	je	0x1458a45b0
1458a4578	lea	rsi, [rdi + 8]
1458a457c	jmp	0x1458a4589
1458a457e	nop
1458a4580	add	rsi, 0x18
1458a4584	dec	r14
1458a4587	je	0x1458a45b0
1458a4589	mov	rdx, qword ptr [rsi - 8]
1458a458d	test	rdx, rdx
1458a4590	je	0x1458a4580
1458a4592	mov	rcx, qword ptr [rsi]
1458a4595	mov	r8d, 1
1458a459b	call	0x1400021d0
1458a45a0	jmp	0x1458a4580
1458a45a2	nop	word ptr cs:[rax + rax]
1458a45b0	mov	rax, qword ptr [rbp + 0xa0]
1458a45b7	test	rax, rax
1458a45ba	je	0x1458a43b0
1458a45c0	shl	rax, 3
1458a45c4	lea	rdx, [rax + rax*2]
1458a45c8	mov	r8d, 8
1458a45ce	mov	rcx, rdi
1458a45d1	call	0x1400021d0
1458a45d6	jmp	0x1458a43b0
1458a45db	mov	qword ptr [rsp + 0x20], 1
1458a45e4	mov	r9d, 1
1458a45ea	lea	rcx, [rbp + 0xf8]
1458a45f1	mov	r8, rsi
1458a45f4	call	0x145bfa970
1458a45f9	nop
1458a45fa	mov	rdx, qword ptr [rbp + 0x108]
1458a4601	jmp	0x1458a452b
1458a4606	mov	r14, qword ptr [rbp + 0xb8]
1458a460d	cmp	qword ptr [r14 + 0x150], -1
1458a4615	je	0x1458a4818
1458a461b	lea	rdx, [r14 + 0x18b]
1458a4622	lea	r8, [r14 + 0x190]
1458a4629	lea	rcx, [rbp + 0xa0]
1458a4630	call	0x1459c8eb0
1458a4635	nop
1458a4636	mov	rsi, qword ptr [rbp + 0xa8]
1458a463d	mov	rdi, qword ptr [rbp + 0xb0]
1458a4644	mov	qword ptr [rsp + 0x20], 1
1458a464d	lea	r9, [rip + 0x1346e80]
1458a4654	mov	rcx, rbp
1458a4657	mov	rdx, rsi
1458a465a	mov	r8, rdi
1458a465d	call	0x14588ad20
1458a4662	nop
1458a4663	mov	rax, qword ptr [rbp + 0x10]
1458a4667	mov	qword ptr [rbp + 0xd0], rax
1458a466e	movdqu	xmm0, xmmword ptr [rbp]
1458a4673	movdqa	xmmword ptr [rbp + 0xc0], xmm0
1458a467b	mov	r14, qword ptr [rbp + 0xb8]
1458a4682	lea	rdx, [r14 + 0x180]
1458a4689	lea	rbx, [rbp + 0xe0]
1458a4690	mov	rcx, rbx
1458a4693	call	0x14590e510
1458a4698	nop
1458a4699	lea	rax, [r14 + 0x150]
1458a46a0	lea	rcx, [r14 + 0x188]
1458a46a7	lea	rdx, [r14 + 0x189]
1458a46ae	lea	r8, [r14 + 0x18a]
1458a46b5	lea	r9, [r14 + 0x168]
1458a46bc	mov	qword ptr [rbp], rcx
1458a46c0	lea	rcx, [rip + 0x336b49]
1458a46c7	mov	qword ptr [rbp + 8], rcx
1458a46cb	mov	qword ptr [rbp + 0x10], rdx
1458a46cf	mov	qword ptr [rbp + 0x18], rcx
1458a46d3	mov	qword ptr [rbp + 0x20], r8
1458a46d7	mov	qword ptr [rbp + 0x28], rcx
1458a46db	mov	qword ptr [rbp + 0x30], r9
1458a46df	lea	rcx, [rip - 0x58a2606]
1458a46e6	mov	qword ptr [rbp + 0x38], rcx
1458a46ea	mov	qword ptr [rbp + 0x40], rax
1458a46ee	mov	qword ptr [rbp + 0x48], rcx
1458a46f2	lea	rax, [rbp + 0xc0]
1458a46f9	mov	qword ptr [rbp + 0x50], rax
1458a46fd	mov	qword ptr [rbp + 0x58], rcx
1458a4701	mov	qword ptr [rbp + 0x60], rbx
1458a4705	mov	qword ptr [rbp + 0x68], rcx
1458a4709	lea	rdx, [rip + 0x1347268]
1458a4710	lea	rcx, [rbp - 0x20]
1458a4714	mov	r8, rbp
1458a4717	call	0x145bcce30
1458a471c	nop
1458a471d	mov	rdx, qword ptr [rbp + 0xe0]
1458a4724	test	rdx, rdx
1458a4727	je	0x1458a473b
1458a4729	mov	rcx, qword ptr [rbp + 0xe8]
1458a4730	mov	r8d, 1
1458a4736	call	0x1400021d0
1458a473b	mov	rdx, qword ptr [rbp + 0xc0]
1458a4742	test	rdx, rdx
1458a4745	je	0x1458a4759
1458a4747	mov	rcx, qword ptr [rbp + 0xc8]
1458a474e	mov	r8d, 1
1458a4754	call	0x1400021d0
1458a4759	test	rdi, rdi
1458a475c	je	0x1458a4792
1458a475e	lea	rbx, [rsi + 8]
1458a4762	jmp	0x1458a4779
1458a4764	nop	word ptr cs:[rax + rax]
1458a4770	add	rbx, 0x18
1458a4774	dec	rdi
1458a4777	je	0x1458a4792
1458a4779	mov	rdx, qword ptr [rbx - 8]
1458a477d	test	rdx, rdx
1458a4780	je	0x1458a4770
1458a4782	mov	rcx, qword ptr [rbx]
1458a4785	mov	r8d, 1
1458a478b	call	0x1400021d0
1458a4790	jmp	0x1458a4770
1458a4792	mov	rax, qword ptr [rbp + 0xa0]
1458a4799	test	rax, rax
1458a479c	je	0x1458a47b4
1458a479e	shl	rax, 3
1458a47a2	lea	rdx, [rax + rax*2]
1458a47a6	mov	r8d, 8
1458a47ac	mov	rcx, rsi
1458a47af	call	0x1400021d0
1458a47b4	mov	rdi, qword ptr [rbp - 0x18]
1458a47b8	mov	rsi, qword ptr [rbp - 0x10]
1458a47bc	mov	rax, qword ptr [rbp + 0xf8]
1458a47c3	mov	rdx, qword ptr [rbp + 0x108]
1458a47ca	sub	rax, rdx
1458a47cd	cmp	rsi, rax
1458a47d0	ja	0x1458a6513
1458a47d6	test	rsi, rsi
1458a47d9	je	0x1458a47f7
1458a47db	add	rdx, qword ptr [rbp + 0x100]
1458a47e2	mov	rcx, rdx
1458a47e5	mov	rdx, rdi
1458a47e8	mov	r8, rsi
1458a47eb	call	0x145bfa0e7
1458a47f0	mov	rdx, qword ptr [rbp + 0x108]
1458a47f7	add	rdx, rsi
1458a47fa	mov	qword ptr [rbp + 0x108], rdx
1458a4801	mov	rdx, qword ptr [rbp - 0x20]
1458a4805	test	rdx, rdx
1458a4808	je	0x1458a4818
1458a480a	mov	r8d, 1
1458a4810	mov	rcx, rdi
1458a4813	call	0x1400021d0
1458a4818	mov	r15, qword ptr [r14 + 0x20]
1458a481c	mov	r12, qword ptr [r14 + 0x28]
1458a4820	shl	r12, 4
1458a4824	add	r12, r15
1458a4827	lea	r13, [rip + 0x1339b62]
1458a482e	lea	rsi, [rip + 0x1347033]
1458a4835	mov	rdi, rbp
1458a4838	lea	rbx, [rbp + 0xf8]
1458a483f	jmp	0x1458a4854
1458a4841	nop	word ptr cs:[rax + rax]
1458a4850	add	r15, 0x10
1458a4854	cmp	r15, r12
1458a4857	je	0x1458a4985
1458a485d	movzx	eax, byte ptr [r15]
1458a4861	mov	byte ptr [rbp + 0xc0], al
1458a4867	mov	rcx, qword ptr [r15 + 8]
1458a486b	cmp	rcx, 0xc
1458a486f	mov	eax, 0xc
1458a4874	cmovb	rax, rcx
1458a4878	dec	rax
1458a487b	test	rcx, rcx
1458a487e	cmove	rax, rcx
1458a4882	cmp	rax, 0xc
1458a4886	jae	0x1458a67e0
1458a488c	imul	rax, rax, 0xf0
1458a4893	add	rax, r13
1458a4896	add	rax, 8
1458a489a	lea	rcx, [rbp + 0xc0]
1458a48a1	mov	qword ptr [rbp], rcx
1458a48a5	lea	rcx, [rip + 0x336964]
1458a48ac	mov	qword ptr [rbp + 8], rcx
1458a48b0	mov	qword ptr [rbp + 0x10], rax
1458a48b4	lea	rax, [rip - 0x58a27fb]
1458a48bb	mov	qword ptr [rbp + 0x18], rax
1458a48bf	lea	rcx, [rbp + 0xe0]
1458a48c6	mov	rdx, rsi
1458a48c9	mov	r8, rdi
1458a48cc	call	0x145bcce30
1458a48d1	nop
1458a48d2	mov	rax, qword ptr [rbp + 0xe0]
1458a48d9	mov	qword ptr [rbp + 0x110], rax
1458a48e0	mov	rax, qword ptr [rbp + 0xe8]
1458a48e7	mov	qword ptr [rbp + 0x118], rax
1458a48ee	mov	r14, qword ptr [rbp + 0xf0]
1458a48f5	mov	rax, qword ptr [rbp + 0xf8]
1458a48fc	mov	rdx, qword ptr [rbp + 0x108]
1458a4903	sub	rax, rdx
1458a4906	cmp	r14, rax
1458a4909	ja	0x1458a4961
1458a490b	test	r14, r14
1458a490e	je	0x1458a4930
1458a4910	add	rdx, qword ptr [rbp + 0x100]
1458a4917	mov	rcx, rdx
1458a491a	mov	rdx, qword ptr [rbp + 0x118]
1458a4921	mov	r8, r14
1458a4924	call	0x145bfa0e7
1458a4929	mov	rdx, qword ptr [rbp + 0x108]
1458a4930	add	rdx, r14
1458a4933	mov	qword ptr [rbp + 0x108], rdx
1458a493a	mov	rdx, qword ptr [rbp + 0x110]
1458a4941	test	rdx, rdx
1458a4944	je	0x1458a4850
1458a494a	mov	r8d, 1
1458a4950	mov	rcx, qword ptr [rbp + 0x118]
1458a4957	call	0x1400021d0
1458a495c	jmp	0x1458a4850
1458a4961	mov	qword ptr [rsp + 0x20], 1
1458a496a	mov	r9d, 1
1458a4970	mov	rcx, rbx
1458a4973	mov	r8, r14
1458a4976	call	0x145bfa970
1458a497b	nop
1458a497c	mov	rdx, qword ptr [rbp + 0x108]
1458a4983	jmp	0x1458a4910
1458a4985	mov	r14, qword ptr [rbp + 0xb8]
1458a498c	mov	rax, qword ptr [r14 + 0x40]
1458a4990	test	rax, rax
1458a4993	je	0x1458a4b04
1458a4999	mov	rdx, qword ptr [r14 + 0x38]
1458a499d	lea	r8, [rdx + rax*4]
1458a49a1	lea	rcx, [rbp + 0xc0]
1458a49a8	call	0x1459c9080
1458a49ad	nop
1458a49ae	mov	rsi, qword ptr [rbp + 0xc8]
1458a49b5	mov	rdi, qword ptr [rbp + 0xd0]
1458a49bc	mov	qword ptr [rsp + 0x20], 1
1458a49c5	lea	r9, [rip + 0x1346b08]
1458a49cc	mov	rcx, rbp
1458a49cf	mov	rdx, rsi
1458a49d2	mov	r8, rdi
1458a49d5	call	0x14588ad20
1458a49da	nop
1458a49db	mov	rax, qword ptr [rbp + 0x10]
1458a49df	mov	qword ptr [rbp + 0xf0], rax
1458a49e6	movdqu	xmm0, xmmword ptr [rbp]
1458a49eb	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a49f3	lea	rax, [rbp + 0xe0]
1458a49fa	mov	qword ptr [rbp + 0xa0], rax
1458a4a01	lea	rax, [rip - 0x58a2928]
1458a4a08	mov	qword ptr [rbp + 0xa8], rax
1458a4a0f	lea	rdx, [rip + 0x1346e5f]
1458a4a16	mov	rcx, rbp
1458a4a19	lea	r8, [rbp + 0xa0]
1458a4a20	call	0x145bcce30
1458a4a25	nop
1458a4a26	mov	rdx, qword ptr [rbp + 0xe0]
1458a4a2d	test	rdx, rdx
1458a4a30	je	0x1458a4a44
1458a4a32	mov	rcx, qword ptr [rbp + 0xe8]
1458a4a39	mov	r8d, 1
1458a4a3f	call	0x1400021d0
1458a4a44	mov	r15, qword ptr [rbp]
1458a4a48	mov	r12, qword ptr [rbp + 8]
1458a4a4c	mov	rbx, qword ptr [rbp + 0x10]
1458a4a50	mov	rax, qword ptr [rbp + 0xf8]
1458a4a57	mov	rdx, qword ptr [rbp + 0x108]
1458a4a5e	sub	rax, rdx
1458a4a61	cmp	rbx, rax
1458a4a64	mov	r14, qword ptr [rbp + 0xb8]
1458a4a6b	ja	0x1458a654c
1458a4a71	test	rbx, rbx
1458a4a74	je	0x1458a4a92
1458a4a76	add	rdx, qword ptr [rbp + 0x100]
1458a4a7d	mov	rcx, rdx
1458a4a80	mov	rdx, r12
1458a4a83	mov	r8, rbx
1458a4a86	call	0x145bfa0e7
1458a4a8b	mov	rdx, qword ptr [rbp + 0x108]
1458a4a92	add	rdx, rbx
1458a4a95	mov	qword ptr [rbp + 0x108], rdx
1458a4a9c	test	r15, r15
1458a4a9f	je	0x1458a4ab2
1458a4aa1	mov	r8d, 1
1458a4aa7	mov	rcx, r12
1458a4aaa	mov	rdx, r15
1458a4aad	call	0x1400021d0
1458a4ab2	test	rdi, rdi
1458a4ab5	je	0x1458a4ae2
1458a4ab7	lea	rbx, [rsi + 8]
1458a4abb	jmp	0x1458a4ac9
1458a4abd	nop	dword ptr [rax]
1458a4ac0	add	rbx, 0x18
1458a4ac4	dec	rdi
1458a4ac7	je	0x1458a4ae2
1458a4ac9	mov	rdx, qword ptr [rbx - 8]
1458a4acd	test	rdx, rdx
1458a4ad0	je	0x1458a4ac0
1458a4ad2	mov	rcx, qword ptr [rbx]
1458a4ad5	mov	r8d, 1
1458a4adb	call	0x1400021d0
1458a4ae0	jmp	0x1458a4ac0
1458a4ae2	mov	rax, qword ptr [rbp + 0xc0]
1458a4ae9	test	rax, rax
1458a4aec	je	0x1458a4b04
1458a4aee	shl	rax, 3
1458a4af2	lea	rdx, [rax + rax*2]
1458a4af6	mov	r8d, 8
1458a4afc	mov	rcx, rsi
1458a4aff	call	0x1400021d0
1458a4b04	imul	rax, qword ptr [r14 + 0x58], 0xe8
1458a4b0c	mov	r13, qword ptr [r14 + 0x50]
1458a4b10	add	rax, r13
1458a4b13	mov	qword ptr [rbp + 0x118], rax
1458a4b1a	mov	r12, rbp
1458a4b1d	jmp	0x1458a4b27
1458a4b1f	nop
1458a4b20	add	r13, 0xe8
1458a4b27	cmp	r13, qword ptr [rbp + 0x118]
1458a4b2e	je	0x1458a4f4a
1458a4b34	lea	rsi, [r13 + 0x98]
1458a4b3b	lea	rax, [r13 + 0xe4]
1458a4b42	mov	r15b, byte ptr [r13 + 0xe4]
1458a4b49	lea	rcx, [rip + 0x1346c38]
1458a4b50	mov	qword ptr [rbp - 0x20], rcx
1458a4b54	mov	qword ptr [rbp - 0x18], 5
1458a4b5c	mov	byte ptr [rbp - 0x28], r15b
1458a4b60	mov	qword ptr [rbp], rsi
1458a4b64	mov	qword ptr [rbp + 8], rax
1458a4b68	mov	qword ptr [rbp + 0x10], 0
1458a4b70	lea	rcx, [rbp + 0xc0]
1458a4b77	mov	rdx, r12
1458a4b7a	call	0x1459b8310
1458a4b7f	nop
1458a4b80	mov	rdi, qword ptr [rbp + 0xc8]
1458a4b87	mov	rbx, qword ptr [rbp + 0xd0]
1458a4b8e	mov	qword ptr [rsp + 0x20], 1
1458a4b97	mov	rcx, r12
1458a4b9a	mov	rdx, rdi
1458a4b9d	mov	r8, rbx
1458a4ba0	lea	r9, [rip + 0x134692d]
1458a4ba7	call	0x14588ad20
1458a4bac	nop
1458a4bad	mov	rax, qword ptr [rbp + 0x10]
1458a4bb1	mov	qword ptr [rbp + 0xf0], rax
1458a4bb8	movdqu	xmm0, xmmword ptr [rbp]
1458a4bbd	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a4bc5	lea	rax, [rbp - 0x20]
1458a4bc9	mov	qword ptr [rbp], rax
1458a4bcd	lea	rax, [rip - 0x58a2b14]
1458a4bd4	mov	qword ptr [rbp + 8], rax
1458a4bd8	lea	rax, [rbp - 0x28]
1458a4bdc	mov	qword ptr [rbp + 0x10], rax
1458a4be0	lea	rax, [rip + 0x336629]
1458a4be7	mov	qword ptr [rbp + 0x18], rax
1458a4beb	lea	rax, [rbp + 0xe0]
1458a4bf2	mov	qword ptr [rbp + 0x20], rax
1458a4bf6	lea	rax, [rip - 0x58a2b1d]
1458a4bfd	mov	qword ptr [rbp + 0x28], rax
1458a4c01	lea	rcx, [rbp + 0xa0]
1458a4c08	lea	rdx, [rip + 0x13468c6]
1458a4c0f	mov	r8, r12
1458a4c12	call	0x145bcce30
1458a4c17	nop
1458a4c18	mov	rdx, qword ptr [rbp + 0xe0]
1458a4c1f	test	rdx, rdx
1458a4c22	je	0x1458a4c36
1458a4c24	mov	rcx, qword ptr [rbp + 0xe8]
1458a4c2b	mov	r8d, 1
1458a4c31	call	0x1400021d0
1458a4c36	test	rbx, rbx
1458a4c39	je	0x1458a4c80
1458a4c3b	lea	r14, [rdi + 8]
1458a4c3f	jmp	0x1458a4c59
1458a4c41	nop	word ptr cs:[rax + rax]
1458a4c50	add	r14, 0x18
1458a4c54	dec	rbx
1458a4c57	je	0x1458a4c80
1458a4c59	mov	rdx, qword ptr [r14 - 8]
1458a4c5d	test	rdx, rdx
1458a4c60	je	0x1458a4c50
1458a4c62	mov	rcx, qword ptr [r14]
1458a4c65	mov	r8d, 1
1458a4c6b	call	0x1400021d0
1458a4c70	jmp	0x1458a4c50
1458a4c72	nop	word ptr cs:[rax + rax]
1458a4c80	mov	rax, qword ptr [rbp + 0xc0]
1458a4c87	test	rax, rax
1458a4c8a	je	0x1458a4ca2
1458a4c8c	shl	rax, 3
1458a4c90	lea	rdx, [rax + rax*2]
1458a4c94	mov	r8d, 8
1458a4c9a	mov	rcx, rdi
1458a4c9d	call	0x1400021d0
1458a4ca2	mov	rbx, qword ptr [rbp + 0xa8]
1458a4ca9	mov	rdi, qword ptr [rbp + 0xb0]
1458a4cb0	mov	rax, qword ptr [rbp + 0xf8]
1458a4cb7	mov	rdx, qword ptr [rbp + 0x108]
1458a4cbe	sub	rax, rdx
1458a4cc1	cmp	rdi, rax
1458a4cc4	ja	0x1458a4ed8
1458a4cca	test	rdi, rdi
1458a4ccd	je	0x1458a4ceb
1458a4ccf	add	rdx, qword ptr [rbp + 0x100]
1458a4cd6	mov	rcx, rdx
1458a4cd9	mov	rdx, rbx
1458a4cdc	mov	r8, rdi
1458a4cdf	call	0x145bfa0e7
1458a4ce4	mov	rdx, qword ptr [rbp + 0x108]
1458a4ceb	add	rdx, rdi
1458a4cee	mov	qword ptr [rbp + 0x108], rdx
1458a4cf5	mov	rdx, qword ptr [rbp + 0xa0]
1458a4cfc	test	rdx, rdx
1458a4cff	je	0x1458a4d0f
1458a4d01	mov	r8d, 1
1458a4d07	mov	rcx, rbx
1458a4d0a	call	0x1400021d0
1458a4d0f	lea	rax, [rip + 0x1346a77]
1458a4d16	mov	qword ptr [rbp - 0x20], rax
1458a4d1a	mov	qword ptr [rbp - 0x18], 4
1458a4d22	mov	byte ptr [rbp - 0x28], r15b
1458a4d26	mov	qword ptr [rbp], r13
1458a4d2a	mov	qword ptr [rbp + 8], rsi
1458a4d2e	mov	qword ptr [rbp + 0x10], 0
1458a4d36	lea	rcx, [rbp + 0xc0]
1458a4d3d	mov	rdx, r12
1458a4d40	call	0x1459b8000
1458a4d45	nop
1458a4d46	mov	rdi, qword ptr [rbp + 0xc8]
1458a4d4d	mov	rbx, qword ptr [rbp + 0xd0]
1458a4d54	mov	qword ptr [rsp + 0x20], 1
1458a4d5d	mov	rcx, r12
1458a4d60	mov	rdx, rdi
1458a4d63	mov	r8, rbx
1458a4d66	lea	r9, [rip + 0x1346767]
1458a4d6d	call	0x14588ad20
1458a4d72	nop
1458a4d73	mov	rax, qword ptr [rbp + 0x10]
1458a4d77	mov	qword ptr [rbp + 0xf0], rax
1458a4d7e	movdqu	xmm0, xmmword ptr [rbp]
1458a4d83	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a4d8b	lea	rax, [rbp - 0x20]
1458a4d8f	mov	qword ptr [rbp], rax
1458a4d93	lea	rax, [rip - 0x58a2cda]
1458a4d9a	mov	qword ptr [rbp + 8], rax
1458a4d9e	lea	rax, [rbp - 0x28]
1458a4da2	mov	qword ptr [rbp + 0x10], rax
1458a4da6	lea	rax, [rip + 0x336463]
1458a4dad	mov	qword ptr [rbp + 0x18], rax
1458a4db1	lea	rax, [rbp + 0xe0]
1458a4db8	mov	qword ptr [rbp + 0x20], rax
1458a4dbc	lea	rax, [rip - 0x58a2ce3]
1458a4dc3	mov	qword ptr [rbp + 0x28], rax
1458a4dc7	lea	rcx, [rbp + 0xa0]
1458a4dce	lea	rdx, [rip + 0x1346700]
1458a4dd5	mov	r8, r12
1458a4dd8	call	0x145bcce30
1458a4ddd	nop
1458a4dde	mov	rdx, qword ptr [rbp + 0xe0]
1458a4de5	test	rdx, rdx
1458a4de8	je	0x1458a4dfc
1458a4dea	mov	rcx, qword ptr [rbp + 0xe8]
1458a4df1	mov	r8d, 1
1458a4df7	call	0x1400021d0
1458a4dfc	test	rbx, rbx
1458a4dff	mov	r14, qword ptr [rbp + 0xb8]
1458a4e06	je	0x1458a4e40
1458a4e08	lea	rsi, [rdi + 8]
1458a4e0c	jmp	0x1458a4e19
1458a4e0e	nop
1458a4e10	add	rsi, 0x18
1458a4e14	dec	rbx
1458a4e17	je	0x1458a4e40
1458a4e19	mov	rdx, qword ptr [rsi - 8]
1458a4e1d	test	rdx, rdx
1458a4e20	je	0x1458a4e10
1458a4e22	mov	rcx, qword ptr [rsi]
1458a4e25	mov	r8d, 1
1458a4e2b	call	0x1400021d0
1458a4e30	jmp	0x1458a4e10
1458a4e32	nop	word ptr cs:[rax + rax]
1458a4e40	mov	rax, qword ptr [rbp + 0xc0]
1458a4e47	test	rax, rax
1458a4e4a	je	0x1458a4e62
1458a4e4c	shl	rax, 3
1458a4e50	lea	rdx, [rax + rax*2]
1458a4e54	mov	r8d, 8
1458a4e5a	mov	rcx, rdi
1458a4e5d	call	0x1400021d0
1458a4e62	mov	rsi, qword ptr [rbp + 0xa8]
1458a4e69	mov	rdi, qword ptr [rbp + 0xb0]
1458a4e70	mov	rax, qword ptr [rbp + 0xf8]
1458a4e77	mov	rdx, qword ptr [rbp + 0x108]
1458a4e7e	sub	rax, rdx
1458a4e81	cmp	rdi, rax
1458a4e84	ja	0x1458a4f11
1458a4e8a	test	rdi, rdi
1458a4e8d	je	0x1458a4eab
1458a4e8f	add	rdx, qword ptr [rbp + 0x100]
1458a4e96	mov	rcx, rdx
1458a4e99	mov	rdx, rsi
1458a4e9c	mov	r8, rdi
1458a4e9f	call	0x145bfa0e7
1458a4ea4	mov	rdx, qword ptr [rbp + 0x108]
1458a4eab	add	rdx, rdi
1458a4eae	mov	qword ptr [rbp + 0x108], rdx
1458a4eb5	mov	rdx, qword ptr [rbp + 0xa0]
1458a4ebc	test	rdx, rdx
1458a4ebf	je	0x1458a4b20
1458a4ec5	mov	r8d, 1
1458a4ecb	mov	rcx, rsi
1458a4ece	call	0x1400021d0
1458a4ed3	jmp	0x1458a4b20
1458a4ed8	mov	qword ptr [rbp + 0x110], rbx
1458a4edf	mov	qword ptr [rsp + 0x20], 1
1458a4ee8	mov	r9d, 1
1458a4eee	lea	rcx, [rbp + 0xf8]
1458a4ef5	mov	r8, rdi
1458a4ef8	call	0x145bfa970
1458a4efd	nop
1458a4efe	mov	rdx, qword ptr [rbp + 0x108]
1458a4f05	mov	rbx, qword ptr [rbp + 0x110]
1458a4f0c	jmp	0x1458a4ccf
1458a4f11	mov	qword ptr [rbp + 0x110], rsi
1458a4f18	mov	qword ptr [rsp + 0x20], 1
1458a4f21	mov	r9d, 1
1458a4f27	lea	rcx, [rbp + 0xf8]
1458a4f2e	mov	r8, rdi
1458a4f31	call	0x145bfa970
1458a4f36	nop
1458a4f37	mov	rdx, qword ptr [rbp + 0x108]
1458a4f3e	mov	rsi, qword ptr [rbp + 0x110]
1458a4f45	jmp	0x1458a4e8f
1458a4f4a	mov	r15, qword ptr [r14 + 0x68]
1458a4f4e	mov	r14, qword ptr [r14 + 0x70]
1458a4f52	shl	r14, 5
1458a4f56	add	r14, r15
1458a4f59	lea	r13, [rip - 0x53e8dc0]
1458a4f60	lea	rsi, [rip + 0x1346919]
1458a4f67	lea	rdi, [rbp + 0xc0]
1458a4f6e	mov	rbx, rbp
1458a4f71	jmp	0x1458a4f84
1458a4f73	nop	word ptr cs:[rax + rax]
1458a4f80	add	r15, 0x20
1458a4f84	cmp	r15, r14
1458a4f87	je	0x1458a50c9
1458a4f8d	lea	rax, [r15 + 4]
1458a4f91	mov	qword ptr [rbp - 0x20], rax
1458a4f95	mov	qword ptr [rbp + 0xa0], r15
1458a4f9c	lea	rdx, [r15 + 8]
1458a4fa0	lea	rcx, [rbp + 0xe0]
1458a4fa7	call	0x1459105e0
1458a4fac	nop
1458a4fad	lea	rax, [rbp - 0x20]
1458a4fb1	mov	qword ptr [rbp], rax
1458a4fb5	mov	qword ptr [rbp + 8], r13
1458a4fb9	lea	rax, [rbp + 0xa0]
1458a4fc0	mov	qword ptr [rbp + 0x10], rax
1458a4fc4	lea	rax, [rip - 0x577453b]
1458a4fcb	mov	qword ptr [rbp + 0x18], rax
1458a4fcf	lea	rax, [rbp + 0xe0]
1458a4fd6	mov	qword ptr [rbp + 0x20], rax
1458a4fda	lea	rax, [rip - 0x58a2f01]
1458a4fe1	mov	qword ptr [rbp + 0x28], rax
1458a4fe5	mov	rcx, rdi
1458a4fe8	mov	rdx, rsi
1458a4feb	mov	r8, rbx
1458a4fee	call	0x145bcce30
1458a4ff3	nop
1458a4ff4	mov	rdx, qword ptr [rbp + 0xe0]
1458a4ffb	test	rdx, rdx
1458a4ffe	je	0x1458a5012
1458a5000	mov	rcx, qword ptr [rbp + 0xe8]
1458a5007	mov	r8d, 1
1458a500d	call	0x1400021d0
1458a5012	mov	rax, qword ptr [rbp + 0xc0]
1458a5019	mov	qword ptr [rbp + 0x110], rax
1458a5020	mov	rax, qword ptr [rbp + 0xc8]
1458a5027	mov	qword ptr [rbp + 0x118], rax
1458a502e	mov	r12, qword ptr [rbp + 0xd0]
1458a5035	mov	rax, qword ptr [rbp + 0xf8]
1458a503c	mov	rdx, qword ptr [rbp + 0x108]
1458a5043	sub	rax, rdx
1458a5046	cmp	r12, rax
1458a5049	ja	0x1458a50a1
1458a504b	test	r12, r12
1458a504e	je	0x1458a5070
1458a5050	add	rdx, qword ptr [rbp + 0x100]
1458a5057	mov	rcx, rdx
1458a505a	mov	rdx, qword ptr [rbp + 0x118]
1458a5061	mov	r8, r12
1458a5064	call	0x145bfa0e7
1458a5069	mov	rdx, qword ptr [rbp + 0x108]
1458a5070	add	rdx, r12
1458a5073	mov	qword ptr [rbp + 0x108], rdx
1458a507a	mov	rdx, qword ptr [rbp + 0x110]
1458a5081	test	rdx, rdx
1458a5084	je	0x1458a4f80
1458a508a	mov	r8d, 1
1458a5090	mov	rcx, qword ptr [rbp + 0x118]
1458a5097	call	0x1400021d0
1458a509c	jmp	0x1458a4f80
1458a50a1	mov	qword ptr [rsp + 0x20], 1
1458a50aa	mov	r9d, 1
1458a50b0	lea	rcx, [rbp + 0xf8]
1458a50b7	mov	r8, r12
1458a50ba	call	0x145bfa970
1458a50bf	nop
1458a50c0	mov	rdx, qword ptr [rbp + 0x108]
1458a50c7	jmp	0x1458a5050
1458a50c9	mov	rax, qword ptr [rbp + 0xb8]
1458a50d0	mov	r14, qword ptr [rax + 0x80]
1458a50d7	mov	rax, qword ptr [rax + 0x88]
1458a50de	lea	r15, [rax + rax*4]
1458a50e2	shl	r15, 4
1458a50e6	add	r15, r14
1458a50e9	mov	rsi, rbp
1458a50ec	jmp	0x1458a50f4
1458a50ee	nop
1458a50f0	add	r14, 0x50
1458a50f4	cmp	r14, r15
1458a50f7	je	0x1458a5396
1458a50fd	mov	qword ptr [rbp - 0x28], r14
1458a5101	lea	rax, [r14 + 1]
1458a5105	mov	qword ptr [rbp - 0x20], rax
1458a5109	call	0x140002200
1458a510e	mov	ecx, 0x48
1458a5113	mov	edx, 8
1458a5118	call	0x1400021c0
1458a511d	test	rax, rax
1458a5120	je	0x1458a67fb
1458a5126	mov	rdi, rax
1458a5129	lea	rdx, [r14 + 8]
1458a512d	mov	qword ptr [rbp + 0xe0], 3
1458a5138	mov	qword ptr [rbp + 0xe8], rax
1458a513f	mov	qword ptr [rbp - 0x30], 0
1458a5147	mov	rcx, rsi
1458a514a	call	0x1459105e0
1458a514f	nop
1458a5150	mov	rax, qword ptr [rbp + 0x10]
1458a5154	mov	qword ptr [rdi + 0x10], rax
1458a5158	movdqu	xmm0, xmmword ptr [rbp]
1458a515d	movdqu	xmmword ptr [rdi], xmm0
1458a5161	lea	rdx, [r14 + 0x20]
1458a5165	mov	qword ptr [rbp - 0x30], 1
1458a516d	mov	rcx, rsi
1458a5170	call	0x1459105e0
1458a5175	nop
1458a5176	mov	rax, qword ptr [rbp + 0x10]
1458a517a	mov	qword ptr [rdi + 0x28], rax
1458a517e	movdqu	xmm0, xmmword ptr [rbp]
1458a5183	movdqu	xmmword ptr [rdi + 0x18], xmm0
1458a5188	lea	rdx, [r14 + 0x38]
1458a518c	mov	qword ptr [rbp - 0x30], 2
1458a5194	mov	rcx, rsi
1458a5197	call	0x1459105e0
1458a519c	nop
1458a519d	mov	rax, qword ptr [rbp + 0x10]
1458a51a1	mov	qword ptr [rdi + 0x40], rax
1458a51a5	movups	xmm0, xmmword ptr [rbp]
1458a51a9	movups	xmmword ptr [rdi + 0x30], xmm0
1458a51ad	movdqu	xmm0, xmmword ptr [rbp + 0xe0]
1458a51b5	movdqa	xmmword ptr [rbp + 0xa0], xmm0
1458a51bd	mov	qword ptr [rbp + 0xb0], 3
1458a51c8	mov	rdi, qword ptr [rbp + 0xa8]
1458a51cf	mov	r12d, 3
1458a51d5	mov	qword ptr [rsp + 0x20], 1
1458a51de	mov	r8d, 3
1458a51e4	mov	rcx, rsi
1458a51e7	mov	rdx, rdi
1458a51ea	lea	r9, [rip + 0x13466a1]
1458a51f1	call	0x14588ad20
1458a51f6	nop
1458a51f7	mov	rax, qword ptr [rbp + 0x10]
1458a51fb	mov	qword ptr [rbp + 0xf0], rax
1458a5202	movdqu	xmm0, xmmword ptr [rbp]
1458a5207	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a520f	lea	rax, [rbp - 0x28]
1458a5213	mov	qword ptr [rbp], rax
1458a5217	mov	qword ptr [rbp + 8], r13
1458a521b	lea	rax, [rbp - 0x20]
1458a521f	mov	qword ptr [rbp + 0x10], rax
1458a5223	mov	qword ptr [rbp + 0x18], r13
1458a5227	lea	rax, [rbp + 0xe0]
1458a522e	mov	qword ptr [rbp + 0x20], rax
1458a5232	lea	rax, [rip - 0x58a3159]
1458a5239	mov	qword ptr [rbp + 0x28], rax
1458a523d	lea	rcx, [rbp + 0xc0]
1458a5244	lea	rdx, [rip + 0x1346648]
1458a524b	mov	r8, rsi
1458a524e	call	0x145bcce30
1458a5253	nop
1458a5254	mov	rdx, qword ptr [rbp + 0xe0]
1458a525b	test	rdx, rdx
1458a525e	je	0x1458a5272
1458a5260	mov	rcx, qword ptr [rbp + 0xe8]
1458a5267	mov	r8d, 1
1458a526d	call	0x1400021d0
1458a5272	mov	rax, qword ptr [rbp + 0xc0]
1458a5279	mov	qword ptr [rbp + 0x110], rax
1458a5280	mov	rax, qword ptr [rbp + 0xc8]
1458a5287	mov	qword ptr [rbp + 0x118], rax
1458a528e	mov	rbx, qword ptr [rbp + 0xd0]
1458a5295	mov	rax, qword ptr [rbp + 0xf8]
1458a529c	mov	rdx, qword ptr [rbp + 0x108]
1458a52a3	sub	rax, rdx
1458a52a6	cmp	rbx, rax
1458a52a9	ja	0x1458a536b
1458a52af	test	rbx, rbx
1458a52b2	je	0x1458a52d4
1458a52b4	add	rdx, qword ptr [rbp + 0x100]
1458a52bb	mov	rcx, rdx
1458a52be	mov	rdx, qword ptr [rbp + 0x118]
1458a52c5	mov	r8, rbx
1458a52c8	call	0x145bfa0e7
1458a52cd	mov	rdx, qword ptr [rbp + 0x108]
1458a52d4	add	rdx, rbx
1458a52d7	mov	qword ptr [rbp + 0x108], rdx
1458a52de	mov	rdx, qword ptr [rbp + 0x110]
1458a52e5	test	rdx, rdx
1458a52e8	je	0x1458a52fc
1458a52ea	mov	r8d, 1
1458a52f0	mov	rcx, qword ptr [rbp + 0x118]
1458a52f7	call	0x1400021d0
1458a52fc	test	r12, r12
1458a52ff	je	0x1458a5340
1458a5301	lea	rbx, [rdi + 8]
1458a5305	jmp	0x1458a5319
1458a5307	nop	word ptr [rax + rax]
1458a5310	add	rbx, 0x18
1458a5314	dec	r12
1458a5317	je	0x1458a5340
1458a5319	mov	rdx, qword ptr [rbx - 8]
1458a531d	test	rdx, rdx
1458a5320	je	0x1458a5310
1458a5322	mov	rcx, qword ptr [rbx]
1458a5325	mov	r8d, 1
1458a532b	call	0x1400021d0
1458a5330	jmp	0x1458a5310
1458a5332	nop	word ptr cs:[rax + rax]
1458a5340	mov	rax, qword ptr [rbp + 0xa0]
1458a5347	test	rax, rax
1458a534a	je	0x1458a50f0
1458a5350	shl	rax, 3
1458a5354	lea	rdx, [rax + rax*2]
1458a5358	mov	r8d, 8
1458a535e	mov	rcx, rdi
1458a5361	call	0x1400021d0
1458a5366	jmp	0x1458a50f0
1458a536b	mov	qword ptr [rsp + 0x20], 1
1458a5374	mov	r9d, 1
1458a537a	lea	rcx, [rbp + 0xf8]
1458a5381	mov	r8, rbx
1458a5384	call	0x145bfa970
1458a5389	nop
1458a538a	mov	rdx, qword ptr [rbp + 0x108]
1458a5391	jmp	0x1458a52b4
1458a5396	mov	r14, qword ptr [rbp + 0xb8]
1458a539d	mov	r8, qword ptr [r14 + 0xa0]
1458a53a4	test	r8, r8
1458a53a7	je	0x1458a5524
1458a53ad	mov	rdx, qword ptr [r14 + 0x98]
1458a53b4	shl	r8, 5
1458a53b8	add	r8, rdx
1458a53bb	lea	rcx, [rbp + 0xc0]
1458a53c2	call	0x1459c8670
1458a53c7	nop
1458a53c8	mov	rsi, qword ptr [rbp + 0xc8]
1458a53cf	mov	rdi, qword ptr [rbp + 0xd0]
1458a53d6	mov	qword ptr [rsp + 0x20], 1
1458a53df	lea	r9, [rip + 0x13460ee]
1458a53e6	mov	rcx, rbp
1458a53e9	mov	rdx, rsi
1458a53ec	mov	r8, rdi
1458a53ef	call	0x14588ad20
1458a53f4	nop
1458a53f5	mov	rax, qword ptr [rbp + 0x10]
1458a53f9	mov	qword ptr [rbp + 0xf0], rax
1458a5400	movdqu	xmm0, xmmword ptr [rbp]
1458a5405	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a540d	lea	rax, [rbp + 0xe0]
1458a5414	mov	qword ptr [rbp + 0xa0], rax
1458a541b	lea	rax, [rip - 0x58a3342]
1458a5422	mov	qword ptr [rbp + 0xa8], rax
1458a5429	lea	rdx, [rip + 0x1346473]
1458a5430	mov	rcx, rbp
1458a5433	lea	r8, [rbp + 0xa0]
1458a543a	call	0x145bcce30
1458a543f	nop
1458a5440	mov	rdx, qword ptr [rbp + 0xe0]
1458a5447	test	rdx, rdx
1458a544a	je	0x1458a545e
1458a544c	mov	rcx, qword ptr [rbp + 0xe8]
1458a5453	mov	r8d, 1
1458a5459	call	0x1400021d0
1458a545e	mov	r15, qword ptr [rbp]
1458a5462	mov	r12, qword ptr [rbp + 8]
1458a5466	mov	rbx, qword ptr [rbp + 0x10]
1458a546a	mov	rax, qword ptr [rbp + 0xf8]
1458a5471	mov	rdx, qword ptr [rbp + 0x108]
1458a5478	sub	rax, rdx
1458a547b	cmp	rbx, rax
1458a547e	mov	r14, qword ptr [rbp + 0xb8]
1458a5485	ja	0x1458a6593
1458a548b	test	rbx, rbx
1458a548e	je	0x1458a54ac
1458a5490	add	rdx, qword ptr [rbp + 0x100]
1458a5497	mov	rcx, rdx
1458a549a	mov	rdx, r12
1458a549d	mov	r8, rbx
1458a54a0	call	0x145bfa0e7
1458a54a5	mov	rdx, qword ptr [rbp + 0x108]
1458a54ac	add	rdx, rbx
1458a54af	mov	qword ptr [rbp + 0x108], rdx
1458a54b6	test	r15, r15
1458a54b9	je	0x1458a54cc
1458a54bb	mov	r8d, 1
1458a54c1	mov	rcx, r12
1458a54c4	mov	rdx, r15
1458a54c7	call	0x1400021d0
1458a54cc	test	rdi, rdi
1458a54cf	je	0x1458a5502
1458a54d1	lea	rbx, [rsi + 8]
1458a54d5	jmp	0x1458a54e9
1458a54d7	nop	word ptr [rax + rax]
1458a54e0	add	rbx, 0x18
1458a54e4	dec	rdi
1458a54e7	je	0x1458a5502
1458a54e9	mov	rdx, qword ptr [rbx - 8]
1458a54ed	test	rdx, rdx
1458a54f0	je	0x1458a54e0
1458a54f2	mov	rcx, qword ptr [rbx]
1458a54f5	mov	r8d, 1
1458a54fb	call	0x1400021d0
1458a5500	jmp	0x1458a54e0
1458a5502	mov	rax, qword ptr [rbp + 0xc0]
1458a5509	test	rax, rax
1458a550c	je	0x1458a5524
1458a550e	shl	rax, 3
1458a5512	lea	rdx, [rax + rax*2]
1458a5516	mov	r8d, 8
1458a551c	mov	rcx, rsi
1458a551f	call	0x1400021d0
1458a5524	mov	r8, qword ptr [r14 + 0xb8]
1458a552b	test	r8, r8
1458a552e	je	0x1458a562b
1458a5534	mov	rdx, qword ptr [r14 + 0xb0]
1458a553b	mov	qword ptr [rsp + 0x20], 1
1458a5544	lea	r9, [rip + 0x1345f89]
1458a554b	mov	rcx, rbp
1458a554e	call	0x14588ad20
1458a5553	nop
1458a5554	mov	rax, qword ptr [rbp + 0x10]
1458a5558	mov	qword ptr [rbp + 0xf0], rax
1458a555f	movdqu	xmm0, xmmword ptr [rbp]
1458a5564	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a556c	lea	rax, [rbp + 0xe0]
1458a5573	mov	qword ptr [rbp + 0xc0], rax
1458a557a	lea	rax, [rip - 0x58a34a1]
1458a5581	mov	qword ptr [rbp + 0xc8], rax
1458a5588	lea	rdx, [rip + 0x134631e]
1458a558f	mov	rcx, rbp
1458a5592	lea	r8, [rbp + 0xc0]
1458a5599	call	0x145bcce30
1458a559e	nop
1458a559f	mov	rdx, qword ptr [rbp + 0xe0]
1458a55a6	test	rdx, rdx
1458a55a9	je	0x1458a55bd
1458a55ab	mov	rcx, qword ptr [rbp + 0xe8]
1458a55b2	mov	r8d, 1
1458a55b8	call	0x1400021d0
1458a55bd	mov	rdi, qword ptr [rbp]
1458a55c1	mov	rbx, qword ptr [rbp + 8]
1458a55c5	mov	rsi, qword ptr [rbp + 0x10]
1458a55c9	mov	rax, qword ptr [rbp + 0xf8]
1458a55d0	mov	rdx, qword ptr [rbp + 0x108]
1458a55d7	sub	rax, rdx
1458a55da	cmp	rsi, rax
1458a55dd	ja	0x1458a65da
1458a55e3	test	rsi, rsi
1458a55e6	mov	r14, qword ptr [rbp + 0xb8]
1458a55ed	je	0x1458a560b
1458a55ef	add	rdx, qword ptr [rbp + 0x100]
1458a55f6	mov	rcx, rdx
1458a55f9	mov	rdx, rbx
1458a55fc	mov	r8, rsi
1458a55ff	call	0x145bfa0e7
1458a5604	mov	rdx, qword ptr [rbp + 0x108]
1458a560b	add	rdx, rsi
1458a560e	mov	qword ptr [rbp + 0x108], rdx
1458a5615	test	rdi, rdi
1458a5618	je	0x1458a562b
1458a561a	mov	r8d, 1
1458a5620	mov	rcx, rbx
1458a5623	mov	rdx, rdi
1458a5626	call	0x1400021d0
1458a562b	mov	r8, qword ptr [r14 + 0xd0]
1458a5632	test	r8, r8
1458a5635	je	0x1458a57b4
1458a563b	mov	rdx, qword ptr [r14 + 0xc8]
1458a5642	shl	r8, 5
1458a5646	add	r8, rdx
1458a5649	lea	rcx, [rbp + 0xc0]
1458a5650	call	0x1459c89b0
1458a5655	nop
1458a5656	mov	rsi, qword ptr [rbp + 0xc8]
1458a565d	mov	rdi, qword ptr [rbp + 0xd0]
1458a5664	mov	qword ptr [rsp + 0x20], 1
1458a566d	lea	r9, [rip + 0x1345e60]
1458a5674	mov	rcx, rbp
1458a5677	mov	rdx, rsi
1458a567a	mov	r8, rdi
1458a567d	call	0x14588ad20
1458a5682	nop
1458a5683	mov	rax, qword ptr [rbp + 0x10]
1458a5687	mov	qword ptr [rbp + 0xf0], rax
1458a568e	movdqu	xmm0, xmmword ptr [rbp]
1458a5693	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a569b	lea	rax, [rbp + 0xe0]
1458a56a2	mov	qword ptr [rbp + 0xa0], rax
1458a56a9	lea	rax, [rip - 0x58a35d0]
1458a56b0	mov	qword ptr [rbp + 0xa8], rax
1458a56b7	lea	rdx, [rip + 0x13461f8]
1458a56be	mov	rcx, rbp
1458a56c1	lea	r8, [rbp + 0xa0]
1458a56c8	call	0x145bcce30
1458a56cd	nop
1458a56ce	mov	rdx, qword ptr [rbp + 0xe0]
1458a56d5	test	rdx, rdx
1458a56d8	je	0x1458a56ec
1458a56da	mov	rcx, qword ptr [rbp + 0xe8]
1458a56e1	mov	r8d, 1
1458a56e7	call	0x1400021d0
1458a56ec	mov	r15, qword ptr [rbp]
1458a56f0	mov	r12, qword ptr [rbp + 8]
1458a56f4	mov	rbx, qword ptr [rbp + 0x10]
1458a56f8	mov	rax, qword ptr [rbp + 0xf8]
1458a56ff	mov	rdx, qword ptr [rbp + 0x108]
1458a5706	sub	rax, rdx
1458a5709	cmp	rbx, rax
1458a570c	mov	r14, qword ptr [rbp + 0xb8]
1458a5713	ja	0x1458a6628
1458a5719	test	rbx, rbx
1458a571c	je	0x1458a573a
1458a571e	add	rdx, qword ptr [rbp + 0x100]
1458a5725	mov	rcx, rdx
1458a5728	mov	rdx, r12
1458a572b	mov	r8, rbx
1458a572e	call	0x145bfa0e7
1458a5733	mov	rdx, qword ptr [rbp + 0x108]
1458a573a	add	rdx, rbx
1458a573d	mov	qword ptr [rbp + 0x108], rdx
1458a5744	test	r15, r15
1458a5747	je	0x1458a575a
1458a5749	mov	r8d, 1
1458a574f	mov	rcx, r12
1458a5752	mov	rdx, r15
1458a5755	call	0x1400021d0
1458a575a	test	rdi, rdi
1458a575d	je	0x1458a5792
1458a575f	lea	rbx, [rsi + 8]
1458a5763	jmp	0x1458a5779
1458a5765	nop	word ptr cs:[rax + rax]
1458a5770	add	rbx, 0x18
1458a5774	dec	rdi
1458a5777	je	0x1458a5792
1458a5779	mov	rdx, qword ptr [rbx - 8]
1458a577d	test	rdx, rdx
1458a5780	je	0x1458a5770
1458a5782	mov	rcx, qword ptr [rbx]
1458a5785	mov	r8d, 1
1458a578b	call	0x1400021d0
1458a5790	jmp	0x1458a5770
1458a5792	mov	rax, qword ptr [rbp + 0xc0]
1458a5799	test	rax, rax
1458a579c	je	0x1458a57b4
1458a579e	shl	rax, 3
1458a57a2	lea	rdx, [rax + rax*2]
1458a57a6	mov	r8d, 8
1458a57ac	mov	rcx, rsi
1458a57af	call	0x1400021d0
1458a57b4	cmp	qword ptr [r14 + 0x190], 0
1458a57bc	jne	0x1458a57fe
1458a57be	cmp	qword ptr [r14 + 0x198], 0
1458a57c6	jne	0x1458a57fe
1458a57c8	cmp	qword ptr [r14 + 0x1a0], 0
1458a57d0	jne	0x1458a57fe
1458a57d2	cmp	qword ptr [r14 + 0x1a8], 0
1458a57da	jne	0x1458a57fe
1458a57dc	cmp	qword ptr [r14 + 0x1b0], 0
1458a57e4	jne	0x1458a57fe
1458a57e6	cmp	qword ptr [r14 + 0x1b8], 0
1458a57ee	jne	0x1458a57fe
1458a57f0	cmp	qword ptr [r14 + 0x1c0], 0
1458a57f8	je	0x1458a5984
1458a57fe	lea	rax, [rip + 0x1345f63]
1458a5805	mov	qword ptr [rbp], rax
1458a5809	lea	rax, [rip + 0x1345f5f]
1458a5810	mov	qword ptr [rbp + 8], rax
1458a5814	mov	qword ptr [rbp + 0x10], r14
1458a5818	lea	rcx, [rbp + 0xc0]
1458a581f	mov	rdx, rbp
1458a5822	call	0x1459c8290
1458a5827	nop
1458a5828	mov	rsi, qword ptr [rbp + 0xc8]
1458a582f	mov	rdi, qword ptr [rbp + 0xd0]
1458a5836	mov	qword ptr [rsp + 0x20], 1
1458a583f	lea	r9, [rip + 0x1345c8e]
1458a5846	mov	rcx, rbp
1458a5849	mov	rdx, rsi
1458a584c	mov	r8, rdi
1458a584f	call	0x14588ad20
1458a5854	nop
1458a5855	mov	rax, qword ptr [rbp + 0x10]
1458a5859	mov	qword ptr [rbp + 0xf0], rax
1458a5860	movdqu	xmm0, xmmword ptr [rbp]
1458a5865	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a586d	lea	rax, [rbp + 0xe0]
1458a5874	mov	qword ptr [rbp + 0xa0], rax
1458a587b	lea	rax, [rip - 0x58a37a2]
1458a5882	mov	qword ptr [rbp + 0xa8], rax
1458a5889	lea	rdx, [rip + 0x1346031]
1458a5890	mov	rcx, rbp
1458a5893	lea	r8, [rbp + 0xa0]
1458a589a	call	0x145bcce30
1458a589f	nop
1458a58a0	mov	rdx, qword ptr [rbp + 0xe0]
1458a58a7	test	rdx, rdx
1458a58aa	je	0x1458a58be
1458a58ac	mov	rcx, qword ptr [rbp + 0xe8]
1458a58b3	mov	r8d, 1
1458a58b9	call	0x1400021d0
1458a58be	mov	r15, qword ptr [rbp]
1458a58c2	mov	r12, qword ptr [rbp + 8]
1458a58c6	mov	rbx, qword ptr [rbp + 0x10]
1458a58ca	mov	rax, qword ptr [rbp + 0xf8]
1458a58d1	mov	rdx, qword ptr [rbp + 0x108]
1458a58d8	sub	rax, rdx
1458a58db	cmp	rbx, rax
1458a58de	mov	r14, qword ptr [rbp + 0xb8]
1458a58e5	ja	0x1458a6799
1458a58eb	test	rbx, rbx
1458a58ee	je	0x1458a590c
1458a58f0	add	rdx, qword ptr [rbp + 0x100]
1458a58f7	mov	rcx, rdx
1458a58fa	mov	rdx, r12
1458a58fd	mov	r8, rbx
1458a5900	call	0x145bfa0e7
1458a5905	mov	rdx, qword ptr [rbp + 0x108]
1458a590c	add	rdx, rbx
1458a590f	mov	qword ptr [rbp + 0x108], rdx
1458a5916	test	r15, r15
1458a5919	je	0x1458a592c
1458a591b	mov	r8d, 1
1458a5921	mov	rcx, r12
1458a5924	mov	rdx, r15
1458a5927	call	0x1400021d0
1458a592c	test	rdi, rdi
1458a592f	je	0x1458a5962
1458a5931	lea	rbx, [rsi + 8]
1458a5935	jmp	0x1458a5949
1458a5937	nop	word ptr [rax + rax]
1458a5940	add	rbx, 0x18
1458a5944	dec	rdi
1458a5947	je	0x1458a5962
1458a5949	mov	rdx, qword ptr [rbx - 8]
1458a594d	test	rdx, rdx
1458a5950	je	0x1458a5940
1458a5952	mov	rcx, qword ptr [rbx]
1458a5955	mov	r8d, 1
1458a595b	call	0x1400021d0
1458a5960	jmp	0x1458a5940
1458a5962	mov	rax, qword ptr [rbp + 0xc0]
1458a5969	test	rax, rax
1458a596c	je	0x1458a5984
1458a596e	shl	rax, 3
1458a5972	lea	rdx, [rax + rax*2]
1458a5976	mov	r8d, 8
1458a597c	mov	rcx, rsi
1458a597f	call	0x1400021d0
1458a5984	mov	rax, qword ptr [r14 + 0xe0]
1458a598b	mov	qword ptr [rbp - 8], rax
1458a598f	mov	rsi, qword ptr [r14 + 0xe8]
1458a5996	test	rsi, rsi
1458a5999	je	0x1458a59c6
1458a599b	call	0x140002200
1458a59a0	mov	edx, 1
1458a59a5	mov	rcx, rsi
1458a59a8	call	0x1400021c0
1458a59ad	test	rax, rax
1458a59b0	je	0x1458a680d
1458a59b6	mov	rbx, rax
1458a59b9	cmp	rsi, 4
1458a59bd	jae	0x1458a59d3
1458a59bf	xor	eax, eax
1458a59c1	jmp	0x1458a5b2d
1458a59c6	mov	ebx, 1
1458a59cb	xor	r12d, r12d
1458a59ce	jmp	0x1458a5bc3
1458a59d3	cmp	rsi, 0x10
1458a59d7	jae	0x1458a59e0
1458a59d9	xor	eax, eax
1458a59db	jmp	0x1458a5ac8
1458a59e0	mov	rax, rsi
1458a59e3	and	rax, 0xfffffffffffffff0
1458a59e7	mov	rcx, qword ptr [rbp - 8]
1458a59eb	add	rcx, 0xf0
1458a59f2	xor	edx, edx
1458a59f4	nop	word ptr cs:[rax + rax]
1458a5a00	movd	xmm0, dword ptr [rcx]
1458a5a04	movd	xmm1, dword ptr [rcx - 0x10]
1458a5a09	punpcklbw	xmm1, xmm0
1458a5a0d	movd	xmm0, dword ptr [rcx - 0x20]
1458a5a12	movd	xmm2, dword ptr [rcx - 0x30]
1458a5a17	punpcklbw	xmm2, xmm0
1458a5a1b	punpcklwd	xmm2, xmm1
1458a5a1f	movd	xmm0, dword ptr [rcx - 0x40]
1458a5a24	movd	xmm1, dword ptr [rcx - 0x50]
1458a5a29	punpcklbw	xmm1, xmm0
1458a5a2d	movd	xmm0, dword ptr [rcx - 0x60]
1458a5a32	movd	xmm3, dword ptr [rcx - 0x70]
1458a5a37	punpcklbw	xmm3, xmm0
1458a5a3b	punpcklwd	xmm3, xmm1
1458a5a3f	punpckldq	xmm3, xmm2
1458a5a43	movd	xmm0, dword ptr [rcx - 0x80]
1458a5a48	movd	xmm1, dword ptr [rcx - 0x90]
1458a5a50	punpcklbw	xmm1, xmm0
1458a5a54	movd	xmm0, dword ptr [rcx - 0xa0]
1458a5a5c	movd	xmm2, dword ptr [rcx - 0xb0]
1458a5a64	punpcklbw	xmm2, xmm0
1458a5a68	punpcklwd	xmm2, xmm1
1458a5a6c	movd	xmm0, dword ptr [rcx - 0xc0]
1458a5a74	movd	xmm1, dword ptr [rcx - 0xd0]
1458a5a7c	punpcklbw	xmm1, xmm0
1458a5a80	movd	xmm0, dword ptr [rcx - 0xe0]
1458a5a88	movd	xmm4, dword ptr [rcx - 0xf0]
1458a5a90	punpcklbw	xmm4, xmm0
1458a5a94	punpcklwd	xmm4, xmm1
1458a5a98	punpckldq	xmm4, xmm2
1458a5a9c	punpcklqdq	xmm4, xmm3
1458a5aa0	movdqu	xmmword ptr [rbx + rdx], xmm4
1458a5aa5	add	rdx, 0x10
1458a5aa9	add	rcx, 0x100
1458a5ab0	cmp	rax, rdx
1458a5ab3	jne	0x1458a5a00
1458a5ab9	cmp	rsi, rax
1458a5abc	je	0x1458a5b52
1458a5ac2	test	sil, 0xc
1458a5ac6	je	0x1458a5b2d
1458a5ac8	mov	rcx, rax
1458a5acb	mov	rax, rsi
1458a5ace	and	rax, 0xfffffffffffffffc
1458a5ad2	mov	rdx, rcx
1458a5ad5	shl	rdx, 4
1458a5ad9	mov	r8, qword ptr [rbp - 8]
1458a5add	add	rdx, r8
1458a5ae0	add	rdx, 0x30
1458a5ae4	nop	word ptr cs:[rax + rax]
1458a5af0	movzx	r8d, byte ptr [rdx - 0x30]
1458a5af5	movzx	r9d, byte ptr [rdx - 0x20]
1458a5afa	movzx	r10d, byte ptr [rdx - 0x10]
1458a5aff	shl	r9d, 8
1458a5b03	or	r9d, r8d
1458a5b06	shl	r10d, 0x10
1458a5b0a	or	r10d, r9d
1458a5b0d	mov	r8d, dword ptr [rdx]
1458a5b10	shl	r8d, 0x18
1458a5b14	or	r8d, r10d
1458a5b17	mov	dword ptr [rbx + rcx], r8d
1458a5b1b	add	rcx, 4
1458a5b1f	add	rdx, 0x40
1458a5b23	cmp	rax, rcx
1458a5b26	jne	0x1458a5af0
1458a5b28	cmp	rsi, rax
1458a5b2b	je	0x1458a5b52
1458a5b2d	mov	rcx, rax
1458a5b30	shl	rcx, 4
1458a5b34	add	rcx, qword ptr [rbp - 8]
1458a5b38	nop	dword ptr [rax + rax]
1458a5b40	movzx	edx, byte ptr [rcx]
1458a5b43	mov	byte ptr [rbx + rax], dl
1458a5b46	inc	rax
1458a5b49	add	rcx, 0x10
1458a5b4d	cmp	rsi, rax
1458a5b50	jne	0x1458a5b40
1458a5b52	mov	r12d, 1
1458a5b58	cmp	rsi, 1
1458a5b5c	je	0x1458a5bc3
1458a5b5e	lea	rax, [rsi - 1]
1458a5b62	xor	ecx, ecx
1458a5b64	nop	word ptr cs:[rax + rax]
1458a5b70	movzx	edx, byte ptr [rbx + rcx + 1]
1458a5b75	cmp	dl, byte ptr [rbx + rcx]
1458a5b78	je	0x1458a5b87
1458a5b7a	inc	rcx
1458a5b7d	cmp	rax, rcx
1458a5b80	jne	0x1458a5b70
1458a5b82	mov	r12, rsi
1458a5b85	jmp	0x1458a5bc3
1458a5b87	lea	rax, [rcx + 2]
1458a5b8b	lea	r12, [rcx + 1]
1458a5b8f	cmp	rax, rsi
1458a5b92	jae	0x1458a5bc3
1458a5b94	mov	r8d, esi
1458a5b97	sub	r8d, ecx
1458a5b9a	lea	rdx, [rsi - 3]
1458a5b9e	test	r8b, 1
1458a5ba2	je	0x1458a5bba
1458a5ba4	movzx	eax, byte ptr [rbx + rcx + 2]
1458a5ba9	cmp	al, byte ptr [rbx + rcx]
1458a5bac	je	0x1458a5bb6
1458a5bae	mov	byte ptr [rbx + rcx + 1], al
1458a5bb2	lea	r12, [rcx + 2]
1458a5bb6	lea	rax, [rcx + 3]
1458a5bba	cmp	rdx, rcx
1458a5bbd	jne	0x1458a5dbd
1458a5bc3	lea	rax, [r14 + 0x1c8]
1458a5bca	mov	qword ptr [rbp - 0x50], rax
1458a5bce	mov	qword ptr [rbp - 0x40], rsi
1458a5bd2	shl	rsi, 4
1458a5bd6	add	rsi, qword ptr [rbp - 8]
1458a5bda	add	r12, rbx
1458a5bdd	mov	rdi, rbp
1458a5be0	lea	r14, [rip + 0x1345d23]
1458a5be7	lea	r15, [rbp + 0xc0]
1458a5bee	mov	qword ptr [rbp - 0x38], rbx
1458a5bf2	jmp	0x1458a5c03
1458a5bf4	nop	word ptr cs:[rax + rax]
1458a5c00	inc	rbx
1458a5c03	cmp	rbx, r12
1458a5c06	je	0x1458a5dfc
1458a5c0c	movzx	eax, byte ptr [rbx]
1458a5c0f	mov	byte ptr [rbp - 0x20], al
1458a5c12	mov	rax, qword ptr [rbp - 8]
1458a5c16	mov	qword ptr [rbp], rax
1458a5c1a	mov	qword ptr [rbp + 8], rsi
1458a5c1e	lea	rax, [rbp - 0x20]
1458a5c22	mov	qword ptr [rbp + 0x10], rax
1458a5c26	lea	rcx, [rbp + 0xa0]
1458a5c2d	mov	rdx, rdi
1458a5c30	call	0x1459bd540
1458a5c35	nop
1458a5c36	mov	rdx, qword ptr [rbp + 0xa8]
1458a5c3d	mov	r8, qword ptr [rbp + 0xb0]
1458a5c44	mov	qword ptr [rsp + 0x20], 1
1458a5c4d	mov	rcx, rdi
1458a5c50	mov	qword ptr [rbp - 0x48], rdx
1458a5c54	lea	r9, [rip + 0x1345879]
1458a5c5b	call	0x14588b2e0
1458a5c60	nop
1458a5c61	mov	rax, qword ptr [rbp + 0x10]
1458a5c65	mov	qword ptr [rbp + 0xf0], rax
1458a5c6c	movdqu	xmm0, xmmword ptr [rbp]
1458a5c71	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a5c79	lea	rax, [rbp - 0x20]
1458a5c7d	mov	qword ptr [rbp], rax
1458a5c81	lea	rax, [rip + 0x335588]
1458a5c88	mov	qword ptr [rbp + 8], rax
1458a5c8c	lea	rax, [rbp + 0xe0]
1458a5c93	mov	qword ptr [rbp + 0x10], rax
1458a5c97	lea	rax, [rip - 0x58a3bbe]
1458a5c9e	mov	qword ptr [rbp + 0x18], rax
1458a5ca2	mov	rcx, r15
1458a5ca5	mov	rdx, r14
1458a5ca8	mov	r8, rdi
1458a5cab	call	0x145bcce30
1458a5cb0	nop
1458a5cb1	mov	rdx, qword ptr [rbp + 0xe0]
1458a5cb8	test	rdx, rdx
1458a5cbb	je	0x1458a5ccf
1458a5cbd	mov	rcx, qword ptr [rbp + 0xe8]
1458a5cc4	mov	r8d, 1
1458a5cca	call	0x1400021d0
1458a5ccf	mov	rax, qword ptr [rbp + 0xc0]
1458a5cd6	mov	qword ptr [rbp + 0x110], rax
1458a5cdd	mov	rax, qword ptr [rbp + 0xc8]
1458a5ce4	mov	qword ptr [rbp + 0x118], rax
1458a5ceb	mov	r13, qword ptr [rbp + 0xd0]
1458a5cf2	mov	rax, qword ptr [rbp + 0xf8]
1458a5cf9	mov	rdx, qword ptr [rbp + 0x108]
1458a5d00	sub	rax, rdx
1458a5d03	cmp	r13, rax
1458a5d06	ja	0x1458a5d7d
1458a5d08	test	r13, r13
1458a5d0b	je	0x1458a5d2d
1458a5d0d	add	rdx, qword ptr [rbp + 0x100]
1458a5d14	mov	rcx, rdx
1458a5d17	mov	rdx, qword ptr [rbp + 0x118]
1458a5d1e	mov	r8, r13
1458a5d21	call	0x145bfa0e7
1458a5d26	mov	rdx, qword ptr [rbp + 0x108]
1458a5d2d	add	rdx, r13
1458a5d30	mov	qword ptr [rbp + 0x108], rdx
1458a5d37	mov	rdx, qword ptr [rbp + 0x110]
1458a5d3e	test	rdx, rdx
1458a5d41	je	0x1458a5d55
1458a5d43	mov	r8d, 1
1458a5d49	mov	rcx, qword ptr [rbp + 0x118]
1458a5d50	call	0x1400021d0
1458a5d55	mov	rdx, qword ptr [rbp + 0xa0]
1458a5d5c	test	rdx, rdx
1458a5d5f	je	0x1458a5c00
1458a5d65	shl	rdx, 4
1458a5d69	mov	r8d, 8
1458a5d6f	mov	rcx, qword ptr [rbp - 0x48]
1458a5d73	call	0x1400021d0
1458a5d78	jmp	0x1458a5c00
1458a5d7d	mov	qword ptr [rsp + 0x20], 1
1458a5d86	mov	r9d, 1
1458a5d8c	lea	rcx, [rbp + 0xf8]
1458a5d93	mov	r8, r13
1458a5d96	call	0x145bfa970
1458a5d9b	nop
1458a5d9c	mov	rdx, qword ptr [rbp + 0x108]
1458a5da3	jmp	0x1458a5d0d
1458a5da8	nop	dword ptr [rax + rax]
1458a5db0	add	rax, 2
1458a5db4	cmp	rsi, rax
1458a5db7	je	0x1458a5bc3
1458a5dbd	movzx	ecx, byte ptr [rbx + rax]
1458a5dc1	cmp	cl, byte ptr [rbx + r12 - 1]
1458a5dc6	jne	0x1458a5de0
1458a5dc8	movzx	ecx, byte ptr [rbx + rax + 1]
1458a5dcd	cmp	cl, byte ptr [rbx + r12 - 1]
1458a5dd2	je	0x1458a5db0
1458a5dd4	jmp	0x1458a5df3
1458a5dd6	nop	word ptr cs:[rax + rax]
1458a5de0	mov	byte ptr [rbx + r12], cl
1458a5de4	inc	r12
1458a5de7	movzx	ecx, byte ptr [rbx + rax + 1]
1458a5dec	cmp	cl, byte ptr [rbx + r12 - 1]
1458a5df1	je	0x1458a5db0
1458a5df3	mov	byte ptr [rbx + r12], cl
1458a5df7	inc	r12
1458a5dfa	jmp	0x1458a5db0
1458a5dfc	mov	rdx, qword ptr [rbp - 0x40]
1458a5e00	test	rdx, rdx
1458a5e03	je	0x1458a5e14
1458a5e05	mov	r8d, 1
1458a5e0b	mov	rcx, qword ptr [rbp - 0x38]
1458a5e0f	call	0x1400021d0
1458a5e14	mov	r14, qword ptr [rbp + 0xb8]
1458a5e1b	mov	r8, qword ptr [r14 + 0x100]
1458a5e22	test	r8, r8
1458a5e25	je	0x1458a5fa4
1458a5e2b	mov	rdx, qword ptr [r14 + 0xf8]
1458a5e32	shl	r8, 5
1458a5e36	add	r8, rdx
1458a5e39	lea	rcx, [rbp + 0xc0]
1458a5e40	call	0x1459c8810
1458a5e45	nop
1458a5e46	mov	rsi, qword ptr [rbp + 0xc8]
1458a5e4d	mov	rdi, qword ptr [rbp + 0xd0]
1458a5e54	mov	qword ptr [rsp + 0x20], 1
1458a5e5d	lea	r9, [rip + 0x1345670]
1458a5e64	mov	rcx, rbp
1458a5e67	mov	rdx, rsi
1458a5e6a	mov	r8, rdi
1458a5e6d	call	0x14588ad20
1458a5e72	nop
1458a5e73	mov	rax, qword ptr [rbp + 0x10]
1458a5e77	mov	qword ptr [rbp + 0xf0], rax
1458a5e7e	movdqu	xmm0, xmmword ptr [rbp]
1458a5e83	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a5e8b	lea	rax, [rbp + 0xe0]
1458a5e92	mov	qword ptr [rbp + 0xa0], rax
1458a5e99	lea	rax, [rip - 0x58a3dc0]
1458a5ea0	mov	qword ptr [rbp + 0xa8], rax
1458a5ea7	lea	rdx, [rip + 0x1345a1d]
1458a5eae	mov	rcx, rbp
1458a5eb1	lea	r8, [rbp + 0xa0]
1458a5eb8	call	0x145bcce30
1458a5ebd	nop
1458a5ebe	mov	rdx, qword ptr [rbp + 0xe0]
1458a5ec5	test	rdx, rdx
1458a5ec8	je	0x1458a5edc
1458a5eca	mov	rcx, qword ptr [rbp + 0xe8]
1458a5ed1	mov	r8d, 1
1458a5ed7	call	0x1400021d0
1458a5edc	mov	r15, qword ptr [rbp]
1458a5ee0	mov	r12, qword ptr [rbp + 8]
1458a5ee4	mov	rbx, qword ptr [rbp + 0x10]
1458a5ee8	mov	rax, qword ptr [rbp + 0xf8]
1458a5eef	mov	rdx, qword ptr [rbp + 0x108]
1458a5ef6	sub	rax, rdx
1458a5ef9	cmp	rbx, rax
1458a5efc	mov	r14, qword ptr [rbp + 0xb8]
1458a5f03	ja	0x1458a666f
1458a5f09	test	rbx, rbx
1458a5f0c	je	0x1458a5f2a
1458a5f0e	add	rdx, qword ptr [rbp + 0x100]
1458a5f15	mov	rcx, rdx
1458a5f18	mov	rdx, r12
1458a5f1b	mov	r8, rbx
1458a5f1e	call	0x145bfa0e7
1458a5f23	mov	rdx, qword ptr [rbp + 0x108]
1458a5f2a	add	rdx, rbx
1458a5f2d	mov	qword ptr [rbp + 0x108], rdx
1458a5f34	test	r15, r15
1458a5f37	je	0x1458a5f4a
1458a5f39	mov	r8d, 1
1458a5f3f	mov	rcx, r12
1458a5f42	mov	rdx, r15
1458a5f45	call	0x1400021d0
1458a5f4a	test	rdi, rdi
1458a5f4d	je	0x1458a5f82
1458a5f4f	lea	rbx, [rsi + 8]
1458a5f53	jmp	0x1458a5f69
1458a5f55	nop	word ptr cs:[rax + rax]
1458a5f60	add	rbx, 0x18
1458a5f64	dec	rdi
1458a5f67	je	0x1458a5f82
1458a5f69	mov	rdx, qword ptr [rbx - 8]
1458a5f6d	test	rdx, rdx
1458a5f70	je	0x1458a5f60
1458a5f72	mov	rcx, qword ptr [rbx]
1458a5f75	mov	r8d, 1
1458a5f7b	call	0x1400021d0
1458a5f80	jmp	0x1458a5f60
1458a5f82	mov	rax, qword ptr [rbp + 0xc0]
1458a5f89	test	rax, rax
1458a5f8c	je	0x1458a5fa4
1458a5f8e	shl	rax, 3
1458a5f92	lea	rdx, [rax + rax*2]
1458a5f96	mov	r8d, 8
1458a5f9c	mov	rcx, rsi
1458a5f9f	call	0x1400021d0
1458a5fa4	mov	rax, qword ptr [r14 + 0x118]
1458a5fab	test	rax, rax
1458a5fae	je	0x1458a6124
1458a5fb4	mov	rdx, qword ptr [r14 + 0x110]
1458a5fbb	lea	r8, [rdx + rax*4]
1458a5fbf	lea	rcx, [rbp + 0xc0]
1458a5fc6	call	0x1459c9080
1458a5fcb	nop
1458a5fcc	mov	rsi, qword ptr [rbp + 0xc8]
1458a5fd3	mov	rdi, qword ptr [rbp + 0xd0]
1458a5fda	mov	qword ptr [rsp + 0x20], 1
1458a5fe3	lea	r9, [rip + 0x13454ea]
1458a5fea	mov	rcx, rbp
1458a5fed	mov	rdx, rsi
1458a5ff0	mov	r8, rdi
1458a5ff3	call	0x14588ad20
1458a5ff8	nop
1458a5ff9	mov	rax, qword ptr [rbp + 0x10]
1458a5ffd	mov	qword ptr [rbp + 0xf0], rax
1458a6004	movdqu	xmm0, xmmword ptr [rbp]
1458a6009	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a6011	lea	rax, [rbp + 0xe0]
1458a6018	mov	qword ptr [rbp + 0xa0], rax
1458a601f	lea	rax, [rip - 0x58a3f46]
1458a6026	mov	qword ptr [rbp + 0xa8], rax
1458a602d	lea	rdx, [rip + 0x13458a1]
1458a6034	mov	rcx, rbp
1458a6037	lea	r8, [rbp + 0xa0]
1458a603e	call	0x145bcce30
1458a6043	nop
1458a6044	mov	rdx, qword ptr [rbp + 0xe0]
1458a604b	test	rdx, rdx
1458a604e	je	0x1458a6062
1458a6050	mov	rcx, qword ptr [rbp + 0xe8]
1458a6057	mov	r8d, 1
1458a605d	call	0x1400021d0
1458a6062	mov	r15, qword ptr [rbp]
1458a6066	mov	r12, qword ptr [rbp + 8]
1458a606a	mov	rbx, qword ptr [rbp + 0x10]
1458a606e	mov	rax, qword ptr [rbp + 0xf8]
1458a6075	mov	rdx, qword ptr [rbp + 0x108]
1458a607c	sub	rax, rdx
1458a607f	cmp	rbx, rax
1458a6082	mov	r14, qword ptr [rbp + 0xb8]
1458a6089	ja	0x1458a66b6
1458a608f	test	rbx, rbx
1458a6092	je	0x1458a60b0
1458a6094	add	rdx, qword ptr [rbp + 0x100]
1458a609b	mov	rcx, rdx
1458a609e	mov	rdx, r12
1458a60a1	mov	r8, rbx
1458a60a4	call	0x145bfa0e7
1458a60a9	mov	rdx, qword ptr [rbp + 0x108]
1458a60b0	add	rdx, rbx
1458a60b3	mov	qword ptr [rbp + 0x108], rdx
1458a60ba	test	r15, r15
1458a60bd	je	0x1458a60d0
1458a60bf	mov	r8d, 1
1458a60c5	mov	rcx, r12
1458a60c8	mov	rdx, r15
1458a60cb	call	0x1400021d0
1458a60d0	test	rdi, rdi
1458a60d3	je	0x1458a6102
1458a60d5	lea	rbx, [rsi + 8]
1458a60d9	jmp	0x1458a60e9
1458a60db	nop	dword ptr [rax + rax]
1458a60e0	add	rbx, 0x18
1458a60e4	dec	rdi
1458a60e7	je	0x1458a6102
1458a60e9	mov	rdx, qword ptr [rbx - 8]
1458a60ed	test	rdx, rdx
1458a60f0	je	0x1458a60e0
1458a60f2	mov	rcx, qword ptr [rbx]
1458a60f5	mov	r8d, 1
1458a60fb	call	0x1400021d0
1458a6100	jmp	0x1458a60e0
1458a6102	mov	rax, qword ptr [rbp + 0xc0]
1458a6109	test	rax, rax
1458a610c	je	0x1458a6124
1458a610e	shl	rax, 3
1458a6112	lea	rdx, [rax + rax*2]
1458a6116	mov	r8d, 8
1458a611c	mov	rcx, rsi
1458a611f	call	0x1400021d0
1458a6124	mov	r8, qword ptr [r14 + 0x130]
1458a612b	test	r8, r8
1458a612e	je	0x1458a622b
1458a6134	mov	rdx, qword ptr [r14 + 0x128]
1458a613b	mov	qword ptr [rsp + 0x20], 1
1458a6144	lea	r9, [rip + 0x1345389]
1458a614b	mov	rcx, rbp
1458a614e	call	0x14588ad20
1458a6153	nop
1458a6154	mov	rax, qword ptr [rbp + 0x10]
1458a6158	mov	qword ptr [rbp + 0xf0], rax
1458a615f	movdqu	xmm0, xmmword ptr [rbp]
1458a6164	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a616c	lea	rax, [rbp + 0xe0]
1458a6173	mov	qword ptr [rbp + 0xc0], rax
1458a617a	lea	rax, [rip - 0x58a40a1]
1458a6181	mov	qword ptr [rbp + 0xc8], rax
1458a6188	lea	rdx, [rip + 0x1345752]
1458a618f	mov	rcx, rbp
1458a6192	lea	r8, [rbp + 0xc0]
1458a6199	call	0x145bcce30
1458a619e	nop
1458a619f	mov	rdx, qword ptr [rbp + 0xe0]
1458a61a6	test	rdx, rdx
1458a61a9	je	0x1458a61bd
1458a61ab	mov	rcx, qword ptr [rbp + 0xe8]
1458a61b2	mov	r8d, 1
1458a61b8	call	0x1400021d0
1458a61bd	mov	rdi, qword ptr [rbp]
1458a61c1	mov	rbx, qword ptr [rbp + 8]
1458a61c5	mov	rsi, qword ptr [rbp + 0x10]
1458a61c9	mov	rax, qword ptr [rbp + 0xf8]
1458a61d0	mov	rdx, qword ptr [rbp + 0x108]
1458a61d7	sub	rax, rdx
1458a61da	cmp	rsi, rax
1458a61dd	ja	0x1458a66fd
1458a61e3	test	rsi, rsi
1458a61e6	mov	r14, qword ptr [rbp + 0xb8]
1458a61ed	je	0x1458a620b
1458a61ef	add	rdx, qword ptr [rbp + 0x100]
1458a61f6	mov	rcx, rdx
1458a61f9	mov	rdx, rbx
1458a61fc	mov	r8, rsi
1458a61ff	call	0x145bfa0e7
1458a6204	mov	rdx, qword ptr [rbp + 0x108]
1458a620b	add	rdx, rsi
1458a620e	mov	qword ptr [rbp + 0x108], rdx
1458a6215	test	rdi, rdi
1458a6218	je	0x1458a622b
1458a621a	mov	r8d, 1
1458a6220	mov	rcx, rbx
1458a6223	mov	rdx, rdi
1458a6226	call	0x1400021d0
1458a622b	mov	rax, qword ptr [rbp - 0x50]
1458a622f	cmp	dword ptr [rax], 0
1458a6232	je	0x1458a62d2
1458a6238	mov	qword ptr [rbp + 0xe0], rax
1458a623f	lea	rax, [rip + 0x33869a]
1458a6246	mov	qword ptr [rbp + 0xe8], rax
1458a624d	lea	rdx, [rip + 0x1345697]
1458a6254	mov	rcx, rbp
1458a6257	lea	r8, [rbp + 0xe0]
1458a625e	call	0x145bcce30
1458a6263	nop
1458a6264	mov	rdi, qword ptr [rbp]
1458a6268	mov	rbx, qword ptr [rbp + 8]
1458a626c	mov	rsi, qword ptr [rbp + 0x10]
1458a6270	mov	rax, qword ptr [rbp + 0xf8]
1458a6277	mov	rdx, qword ptr [rbp + 0x108]
1458a627e	sub	rax, rdx
1458a6281	cmp	rsi, rax
1458a6284	ja	0x1458a674b
1458a628a	test	rsi, rsi
1458a628d	mov	r14, qword ptr [rbp + 0xb8]
1458a6294	je	0x1458a62b2
1458a6296	add	rdx, qword ptr [rbp + 0x100]
1458a629d	mov	rcx, rdx
1458a62a0	mov	rdx, rbx
1458a62a3	mov	r8, rsi
1458a62a6	call	0x145bfa0e7
1458a62ab	mov	rdx, qword ptr [rbp + 0x108]
1458a62b2	add	rdx, rsi
1458a62b5	mov	qword ptr [rbp + 0x108], rdx
1458a62bc	test	rdi, rdi
1458a62bf	je	0x1458a62d2
1458a62c1	mov	r8d, 1
1458a62c7	mov	rcx, rbx
1458a62ca	mov	rdx, rdi
1458a62cd	call	0x1400021d0
1458a62d2	mov	rdi, qword ptr [r14 + 0x140]
1458a62d9	mov	rax, qword ptr [r14 + 0x148]
1458a62e0	lea	r15, [rdi + rax*8]
1458a62e4	mov	r14, rbp
1458a62e7	lea	r12, [rbp + 0xc0]
1458a62ee	jmp	0x1458a62f3
1458a62f0	mov	rdi, r13
1458a62f3	cmp	rdi, r15
1458a62f6	je	0x1458a64e6
1458a62fc	lea	r13, [rdi + 8]
1458a6300	lea	rdx, [rdi + 3]
1458a6304	lea	rcx, [rbp + 0xa0]
1458a630b	mov	r8, r13
1458a630e	call	0x1459c8eb0
1458a6313	nop
1458a6314	mov	rbx, qword ptr [rbp + 0xa8]
1458a631b	mov	rsi, qword ptr [rbp + 0xb0]
1458a6322	mov	qword ptr [rsp + 0x20], 1
1458a632b	mov	rcx, r14
1458a632e	mov	rdx, rbx
1458a6331	mov	r8, rsi
1458a6334	lea	r9, [rip + 0x1345199]
1458a633b	call	0x14588ad20
1458a6340	nop
1458a6341	lea	rax, [rdi + 2]
1458a6345	mov	rcx, qword ptr [rbp + 0x10]
1458a6349	mov	qword ptr [rbp + 0xf0], rcx
1458a6350	movdqu	xmm0, xmmword ptr [rbp]
1458a6355	movdqa	xmmword ptr [rbp + 0xe0], xmm0
1458a635d	mov	qword ptr [rbp], rdi
1458a6361	inc	rdi
1458a6364	lea	rcx, [rip + 0x334ea5]
1458a636b	mov	qword ptr [rbp + 8], rcx
1458a636f	mov	qword ptr [rbp + 0x10], rdi
1458a6373	mov	qword ptr [rbp + 0x18], rcx
1458a6377	mov	qword ptr [rbp + 0x20], rax
1458a637b	mov	qword ptr [rbp + 0x28], rcx
1458a637f	lea	rax, [rbp + 0xe0]
1458a6386	mov	qword ptr [rbp + 0x30], rax
1458a638a	lea	rax, [rip - 0x58a42b1]
1458a6391	mov	qword ptr [rbp + 0x38], rax
1458a6395	mov	rcx, r12
1458a6398	lea	rdx, [rip + 0x1345558]
1458a639f	mov	r8, r14
1458a63a2	call	0x145bcce30
1458a63a7	nop
1458a63a8	mov	rdx, qword ptr [rbp + 0xe0]
1458a63af	test	rdx, rdx
1458a63b2	je	0x1458a63c6
1458a63b4	mov	rcx, qword ptr [rbp + 0xe8]
1458a63bb	mov	r8d, 1
1458a63c1	call	0x1400021d0
1458a63c6	mov	rax, qword ptr [rbp + 0xc0]
1458a63cd	mov	qword ptr [rbp + 0x110], rax
1458a63d4	mov	rax, qword ptr [rbp + 0xc8]
1458a63db	mov	qword ptr [rbp + 0x118], rax
1458a63e2	mov	rdi, qword ptr [rbp + 0xd0]
1458a63e9	mov	rax, qword ptr [rbp + 0xf8]
1458a63f0	mov	rdx, qword ptr [rbp + 0x108]
1458a63f7	sub	rax, rdx
1458a63fa	cmp	rdi, rax
1458a63fd	ja	0x1458a64bb
1458a6403	test	rdi, rdi
1458a6406	je	0x1458a6428
1458a6408	add	rdx, qword ptr [rbp + 0x100]
1458a640f	mov	rcx, rdx
1458a6412	mov	rdx, qword ptr [rbp + 0x118]
1458a6419	mov	r8, rdi
1458a641c	call	0x145bfa0e7
1458a6421	mov	rdx, qword ptr [rbp + 0x108]
1458a6428	add	rdx, rdi
1458a642b	mov	qword ptr [rbp + 0x108], rdx
1458a6432	mov	rdx, qword ptr [rbp + 0x110]
1458a6439	test	rdx, rdx
1458a643c	je	0x1458a6450
1458a643e	mov	r8d, 1
1458a6444	mov	rcx, qword ptr [rbp + 0x118]
1458a644b	call	0x1400021d0
1458a6450	test	rsi, rsi
1458a6453	je	0x1458a6490
1458a6455	lea	rdi, [rbx + 8]
1458a6459	jmp	0x1458a6469
1458a645b	nop	dword ptr [rax + rax]
1458a6460	add	rdi, 0x18
1458a6464	dec	rsi
1458a6467	je	0x1458a6490
1458a6469	mov	rdx, qword ptr [rdi - 8]
1458a646d	test	rdx, rdx
1458a6470	je	0x1458a6460
1458a6472	mov	rcx, qword ptr [rdi]
1458a6475	mov	r8d, 1
1458a647b	call	0x1400021d0
1458a6480	jmp	0x1458a6460
1458a6482	nop	word ptr cs:[rax + rax]
1458a6490	mov	rax, qword ptr [rbp + 0xa0]
1458a6497	test	rax, rax
1458a649a	je	0x1458a62f0
1458a64a0	shl	rax, 3
1458a64a4	lea	rdx, [rax + rax*2]
1458a64a8	mov	r8d, 8
1458a64ae	mov	rcx, rbx
1458a64b1	call	0x1400021d0
1458a64b6	jmp	0x1458a62f0
1458a64bb	mov	qword ptr [rsp + 0x20], 1
1458a64c4	mov	r9d, 1
1458a64ca	lea	rcx, [rbp + 0xf8]
1458a64d1	mov	r8, rdi
1458a64d4	call	0x145bfa970
1458a64d9	nop
1458a64da	mov	rdx, qword ptr [rbp + 0x108]
1458a64e1	jmp	0x1458a6408
1458a64e6	mov	rcx, qword ptr [rbp + 0x108]
1458a64ed	mov	rax, qword ptr [rbp - 0x58]
1458a64f1	mov	qword ptr [rax + 0x10], rcx
1458a64f5	movups	xmm0, xmmword ptr [rbp + 0xf8]
1458a64fc	movups	xmmword ptr [rax], xmm0
1458a64ff	add	rsp, 0x1a8
1458a6506	pop	rbx
1458a6507	pop	rdi
1458a6508	pop	rsi
1458a6509	pop	r12
1458a650b	pop	r13
1458a650d	pop	r14
1458a650f	pop	r15
1458a6511	pop	rbp
1458a6512	ret
1458a6513	mov	qword ptr [rbp + 0x118], rdi
1458a651a	mov	qword ptr [rsp + 0x20], 1
1458a6523	lea	rcx, [rbp + 0xf8]
1458a652a	mov	r9d, 1
1458a6530	mov	r8, rsi
1458a6533	call	0x145bfa970
1458a6538	nop
1458a6539	mov	rdx, qword ptr [rbp + 0x108]
1458a6540	mov	rdi, qword ptr [rbp + 0x118]
1458a6547	jmp	0x1458a47db
1458a654c	mov	qword ptr [rbp + 0x110], r12
1458a6553	mov	qword ptr [rbp + 0x118], r15
1458a655a	mov	qword ptr [rsp + 0x20], 1
1458a6563	lea	rcx, [rbp + 0xf8]
1458a656a	mov	r9d, 1
1458a6570	mov	r8, rbx
1458a6573	call	0x145bfa970
1458a6578	nop
1458a6579	mov	rdx, qword ptr [rbp + 0x108]
1458a6580	mov	r15, qword ptr [rbp + 0x118]
1458a6587	mov	r12, qword ptr [rbp + 0x110]
1458a658e	jmp	0x1458a4a76
1458a6593	mov	qword ptr [rbp + 0x110], r12
1458a659a	mov	qword ptr [rbp + 0x118], r15
1458a65a1	mov	qword ptr [rsp + 0x20], 1
1458a65aa	lea	rcx, [rbp + 0xf8]
1458a65b1	mov	r9d, 1
1458a65b7	mov	r8, rbx
1458a65ba	call	0x145bfa970
1458a65bf	nop
1458a65c0	mov	rdx, qword ptr [rbp + 0x108]
1458a65c7	mov	r15, qword ptr [rbp + 0x118]
1458a65ce	mov	r12, qword ptr [rbp + 0x110]
1458a65d5	jmp	0x1458a5490
1458a65da	mov	qword ptr [rbp + 0x110], rbx
1458a65e1	mov	qword ptr [rbp + 0x118], rdi
1458a65e8	mov	qword ptr [rsp + 0x20], 1
1458a65f1	lea	rcx, [rbp + 0xf8]
1458a65f8	mov	r9d, 1
1458a65fe	mov	r8, rsi
1458a6601	call	0x145bfa970
1458a6606	nop
1458a6607	mov	r14, qword ptr [rbp + 0xb8]
1458a660e	mov	rdx, qword ptr [rbp + 0x108]
1458a6615	mov	rdi, qword ptr [rbp + 0x118]
1458a661c	mov	rbx, qword ptr [rbp + 0x110]
1458a6623	jmp	0x1458a55ef
1458a6628	mov	qword ptr [rbp + 0x110], r12
1458a662f	mov	qword ptr [rbp + 0x118], r15
1458a6636	mov	qword ptr [rsp + 0x20], 1
1458a663f	lea	rcx, [rbp + 0xf8]
1458a6646	mov	r9d, 1
1458a664c	mov	r8, rbx
1458a664f	call	0x145bfa970
1458a6654	nop
1458a6655	mov	rdx, qword ptr [rbp + 0x108]
1458a665c	mov	r15, qword ptr [rbp + 0x118]
1458a6663	mov	r12, qword ptr [rbp + 0x110]
1458a666a	jmp	0x1458a571e
1458a666f	mov	qword ptr [rbp + 0x110], r12
1458a6676	mov	qword ptr [rbp + 0x118], r15
1458a667d	mov	qword ptr [rsp + 0x20], 1
1458a6686	lea	rcx, [rbp + 0xf8]
1458a668d	mov	r9d, 1
1458a6693	mov	r8, rbx
1458a6696	call	0x145bfa970
1458a669b	nop
1458a669c	mov	rdx, qword ptr [rbp + 0x108]
1458a66a3	mov	r15, qword ptr [rbp + 0x118]
1458a66aa	mov	r12, qword ptr [rbp + 0x110]
1458a66b1	jmp	0x1458a5f0e
1458a66b6	mov	qword ptr [rbp + 0x110], r12
1458a66bd	mov	qword ptr [rbp + 0x118], r15
1458a66c4	mov	qword ptr [rsp + 0x20], 1
1458a66cd	lea	rcx, [rbp + 0xf8]
1458a66d4	mov	r9d, 1
1458a66da	mov	r8, rbx
1458a66dd	call	0x145bfa970
1458a66e2	nop
1458a66e3	mov	rdx, qword ptr [rbp + 0x108]
1458a66ea	mov	r15, qword ptr [rbp + 0x118]
1458a66f1	mov	r12, qword ptr [rbp + 0x110]
1458a66f8	jmp	0x1458a6094
1458a66fd	mov	qword ptr [rbp + 0x110], rbx
1458a6704	mov	qword ptr [rbp + 0x118], rdi
1458a670b	mov	qword ptr [rsp + 0x20], 1
1458a6714	lea	rcx, [rbp + 0xf8]
1458a671b	mov	r9d, 1
1458a6721	mov	r8, rsi
1458a6724	call	0x145bfa970
1458a6729	nop
1458a672a	mov	r14, qword ptr [rbp + 0xb8]
1458a6731	mov	rdx, qword ptr [rbp + 0x108]
1458a6738	mov	rdi, qword ptr [rbp + 0x118]
1458a673f	mov	rbx, qword ptr [rbp + 0x110]
1458a6746	jmp	0x1458a61ef
1458a674b	mov	qword ptr [rbp + 0x110], rbx
1458a6752	mov	qword ptr [rbp + 0x118], rdi
1458a6759	mov	qword ptr [rsp + 0x20], 1
1458a6762	lea	rcx, [rbp + 0xf8]
1458a6769	mov	r9d, 1
1458a676f	mov	r8, rsi
1458a6772	call	0x145bfa970
1458a6777	nop
1458a6778	mov	rdx, qword ptr [rbp + 0x108]
1458a677f	mov	r14, qword ptr [rbp + 0xb8]
1458a6786	mov	rdi, qword ptr [rbp + 0x118]
1458a678d	mov	rbx, qword ptr [rbp + 0x110]
1458a6794	jmp	0x1458a6296
1458a6799	mov	qword ptr [rbp + 0x110], r12
1458a67a0	mov	qword ptr [rbp + 0x118], r15
1458a67a7	mov	qword ptr [rsp + 0x20], 1
1458a67b0	lea	rcx, [rbp + 0xf8]
1458a67b7	mov	r9d, 1
1458a67bd	mov	r8, rbx
1458a67c0	call	0x145bfa970
1458a67c5	nop
1458a67c6	mov	rdx, qword ptr [rbp + 0x108]
1458a67cd	mov	r15, qword ptr [rbp + 0x118]
1458a67d4	mov	r12, qword ptr [rbp + 0x110]
1458a67db	jmp	0x1458a58f0
1458a67e0	lea	r8, [rip + 0x1345069]
1458a67e7	mov	edx, 0xc
1458a67ec	mov	rcx, 0xffffffffffffffff
1458a67f3	call	0x145d99653
1458a67f8	nop
1458a67f9	jmp	0x1458a681b
1458a67fb	mov	ecx, 8
1458a6800	mov	edx, 0x48
1458a6805	call	0x145d992bb
1458a680a	nop
1458a680b	jmp	0x1458a681b
1458a680d	mov	ecx, 1
1458a6812	mov	rdx, rsi
1458a6815	call	0x145d992bb
1458a681a	nop
1458a681b	ud2
