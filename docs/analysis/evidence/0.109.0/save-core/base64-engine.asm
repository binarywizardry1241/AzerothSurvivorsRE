1459f8370	push	r15
1459f8372	push	r14
1459f8374	push	r13
1459f8376	push	r12
1459f8378	push	rsi
1459f8379	push	rdi
1459f837a	push	rbp
1459f837b	push	rbx
1459f837c	sub	rsp, 0x68
1459f8380	mov	r14, qword ptr [rsp + 0xe0]
1459f8388	movzx	ebx, byte ptr [rdx + 1]
1459f838c	movzx	edi, byte ptr [rdx + 2]
1459f8390	cmp	r14, 1
1459f8394	jne	0x1459f83ba
1459f8396	mov	rax, r9
1459f8399	sub	rax, 1
1459f839d	jb	0x1459f8fed
1459f83a3	movzx	r10d, byte ptr [r8 + rax]
1459f83a8	cmp	r10, 0x3d
1459f83ac	je	0x1459f83ba
1459f83ae	cmp	byte ptr [rdx + r10 + 0x43], 0xff
1459f83b4	je	0x1459f8a23
1459f83ba	mov	rsi, qword ptr [rsp + 0xd8]
1459f83c2	xor	r11d, r11d
1459f83c5	mov	rax, r9
1459f83c8	sub	rax, r14
1459f83cb	cmovae	r11, rax
1459f83cf	test	r14, r14
1459f83d2	jne	0x1459f83de
1459f83d4	xor	eax, eax
1459f83d6	sub	r11, 4
1459f83da	cmovb	r11, rax
1459f83de	mov	r13, r11
1459f83e1	shr	r13, 2
1459f83e5	lea	rax, [r13*2]
1459f83ed	add	rax, r13
1459f83f0	cmp	rsi, rax
1459f83f3	jae	0x1459f83ff
1459f83f5	mov	dl, 0xff
1459f83f7	mov	byte ptr [rcx + 8], dl
1459f83fa	jmp	0x1459f8cfd
1459f83ff	movabs	r14, 0x7fffffffffffffe0
1459f8409	and	r14, r11
1459f840c	cmp	r14, r9
1459f840f	ja	0x1459f8e20
1459f8415	mov	dword ptr [rsp + 0x54], edi
1459f8419	mov	byte ptr [rsp + 0x37], bl
1459f841d	mov	qword ptr [rsp + 0x38], rax
1459f8422	test	r14, r14
1459f8425	mov	qword ptr [rsp + 0x28], r11
1459f842a	mov	qword ptr [rsp + 0x40], r9
1459f842f	mov	qword ptr [rsp + 0x48], r14
1459f8434	je	0x1459f8901
1459f843a	movabs	r10, 0xaaaaaaaaaaaaaaab
1459f8444	mov	rax, rsi
1459f8447	mov	rdi, rdx
1459f844a	mul	r10
1459f844d	mov	rax, rdx
1459f8450	mov	rdx, rdi
1459f8453	shr	rax, 4
1459f8457	lea	rax, [rax + rax*2]
1459f845b	lea	rdi, [rax*8 + 0x18]
1459f8463	xor	ebx, ebx
1459f8465	xor	r12d, r12d
1459f8468	mov	qword ptr [rsp + 0x58], rdi
1459f846d	lea	rax, [rbx + 0x18]
1459f8471	cmp	rdi, rax
1459f8474	je	0x1459f8e39
1459f847a	movzx	r10d, byte ptr [r8 + r12]
1459f847f	movzx	r15d, byte ptr [rdx + r10 + 0x43]
1459f8485	cmp	r15, 0xff
1459f848c	je	0x1459f8b4a
1459f8492	movzx	r10d, byte ptr [r8 + r12 + 1]
1459f8498	movzx	esi, byte ptr [rdx + r10 + 0x43]
1459f849e	cmp	rsi, 0xff
1459f84a5	je	0x1459f8b23
1459f84ab	movzx	r10d, byte ptr [r8 + r12 + 2]
1459f84b1	movzx	ebp, byte ptr [rdx + r10 + 0x43]
1459f84b7	cmp	rbp, 0xff
1459f84be	je	0x1459f8b28
1459f84c4	mov	qword ptr [rsp + 0x60], rax
1459f84c9	movzx	r10d, byte ptr [r8 + r12 + 3]
1459f84cf	movzx	eax, byte ptr [rdx + r10 + 0x43]
1459f84d5	cmp	rax, 0xff
1459f84db	je	0x1459f8b2e
1459f84e1	movzx	r10d, byte ptr [r8 + r12 + 4]
1459f84e7	movzx	r14d, byte ptr [rdx + r10 + 0x43]
1459f84ed	cmp	r14, 0xff
1459f84f4	je	0x1459f8b34
1459f84fa	movzx	r10d, byte ptr [r8 + r12 + 5]
1459f8500	movzx	edi, byte ptr [rdx + r10 + 0x43]
1459f8506	cmp	rdi, 0xff
1459f850d	je	0x1459f8b3a
1459f8513	movzx	r10d, byte ptr [r8 + r12 + 6]
1459f8519	movzx	r9d, byte ptr [rdx + r10 + 0x43]
1459f851f	cmp	r9, 0xff
1459f8526	je	0x1459f8b40
1459f852c	movzx	r10d, byte ptr [r8 + r12 + 7]
1459f8532	movzx	r11d, byte ptr [rdx + r10 + 0x43]
1459f8538	cmp	r11, 0xff
1459f853f	je	0x1459f8b46
1459f8545	shl	r15, 0x3a
1459f8549	shl	rsi, 0x34
1459f854d	or	rsi, r15
1459f8550	shl	rbp, 0x2e
1459f8554	shl	rax, 0x28
1459f8558	or	rax, rbp
1459f855b	or	rax, rsi
1459f855e	shl	r14, 0x22
1459f8562	shl	rdi, 0x1c
1459f8566	or	rdi, r14
1459f8569	shl	r9d, 0x16
1459f856d	or	r9, rdi
1459f8570	or	r9, rax
1459f8573	shl	r11d, 0x10
1459f8577	or	r11, r9
1459f857a	bswap	r11
1459f857d	mov	rax, qword ptr [rsp + 0xd0]
1459f8585	mov	dword ptr [rax + rbx], r11d
1459f8589	shr	r11, 0x20
1459f858d	mov	word ptr [rax + rbx + 4], r11w
1459f8593	movzx	r10d, byte ptr [r8 + r12 + 8]
1459f8599	movzx	r15d, byte ptr [rdx + r10 + 0x43]
1459f859f	cmp	r15, 0xff
1459f85a6	je	0x1459f8b5b
1459f85ac	movzx	r10d, byte ptr [r8 + r12 + 9]
1459f85b2	movzx	eax, byte ptr [rdx + r10 + 0x43]
1459f85b8	cmp	rax, 0xff
1459f85be	je	0x1459f8b65
1459f85c4	movzx	r10d, byte ptr [r8 + r12 + 0xa]
1459f85ca	movzx	ebp, byte ptr [rdx + r10 + 0x43]
1459f85d0	cmp	rbp, 0xff
1459f85d7	je	0x1459f8b6f
1459f85dd	movzx	r10d, byte ptr [r8 + r12 + 0xb]
1459f85e3	movzx	esi, byte ptr [rdx + r10 + 0x43]
1459f85e9	cmp	rsi, 0xff
1459f85f0	je	0x1459f8b79
1459f85f6	movzx	r10d, byte ptr [r8 + r12 + 0xc]
1459f85fc	movzx	r11d, byte ptr [rdx + r10 + 0x43]
1459f8602	cmp	r11, 0xff
1459f8609	je	0x1459f8b83
1459f860f	movzx	r10d, byte ptr [r8 + r12 + 0xd]
1459f8615	movzx	r14d, byte ptr [rdx + r10 + 0x43]
1459f861b	cmp	r14, 0xff
1459f8622	je	0x1459f8b8d
1459f8628	movzx	r10d, byte ptr [r8 + r12 + 0xe]
1459f862e	movzx	edi, byte ptr [rdx + r10 + 0x43]
1459f8634	cmp	rdi, 0xff
1459f863b	je	0x1459f8b97
1459f8641	movzx	r10d, byte ptr [r8 + r12 + 0xf]
1459f8647	movzx	r9d, byte ptr [rdx + r10 + 0x43]
1459f864d	cmp	r9, 0xff
1459f8654	je	0x1459f8ba1
1459f865a	shl	r15, 0x3a
1459f865e	shl	rax, 0x34
1459f8662	or	rax, r15
1459f8665	shl	rbp, 0x2e
1459f8669	shl	rsi, 0x28
1459f866d	or	rsi, rbp
1459f8670	or	rsi, rax
1459f8673	shl	r11, 0x22
1459f8677	shl	r14, 0x1c
1459f867b	or	r14, r11
1459f867e	shl	edi, 0x16
1459f8681	or	rdi, r14
1459f8684	or	rdi, rsi
1459f8687	shl	r9d, 0x10
1459f868b	or	r9, rdi
1459f868e	bswap	r9
1459f8691	mov	rax, qword ptr [rsp + 0xd0]
1459f8699	mov	dword ptr [rax + rbx + 6], r9d
1459f869e	shr	r9, 0x20
1459f86a2	mov	word ptr [rax + rbx + 0xa], r9w
1459f86a8	movzx	r10d, byte ptr [r8 + r12 + 0x10]
1459f86ae	movzx	r15d, byte ptr [rdx + r10 + 0x43]
1459f86b4	cmp	r15, 0xff
1459f86bb	je	0x1459f8bab
1459f86c1	movzx	r10d, byte ptr [r8 + r12 + 0x11]
1459f86c7	movzx	eax, byte ptr [rdx + r10 + 0x43]
1459f86cd	cmp	rax, 0xff
1459f86d3	je	0x1459f8bc3
1459f86d9	movzx	r10d, byte ptr [r8 + r12 + 0x12]
1459f86df	movzx	ebp, byte ptr [rdx + r10 + 0x43]
1459f86e5	cmp	rbp, 0xff
1459f86ec	je	0x1459f8bcd
1459f86f2	movzx	r10d, byte ptr [r8 + r12 + 0x13]
1459f86f8	movzx	esi, byte ptr [rdx + r10 + 0x43]
1459f86fe	cmp	rsi, 0xff
1459f8705	je	0x1459f8bd7
1459f870b	movzx	r10d, byte ptr [r8 + r12 + 0x14]
1459f8711	movzx	r11d, byte ptr [rdx + r10 + 0x43]
1459f8717	cmp	r11, 0xff
1459f871e	je	0x1459f8be1
1459f8724	movzx	r10d, byte ptr [r8 + r12 + 0x15]
1459f872a	movzx	r14d, byte ptr [rdx + r10 + 0x43]
1459f8730	cmp	r14, 0xff
1459f8737	je	0x1459f8beb
1459f873d	movzx	r10d, byte ptr [r8 + r12 + 0x16]
1459f8743	movzx	edi, byte ptr [rdx + r10 + 0x43]
1459f8749	cmp	rdi, 0xff
1459f8750	je	0x1459f8bf5
1459f8756	movzx	r10d, byte ptr [r8 + r12 + 0x17]
1459f875c	movzx	r9d, byte ptr [rdx + r10 + 0x43]
1459f8762	cmp	r9, 0xff
1459f8769	je	0x1459f8bff
1459f876f	shl	r15, 0x3a
1459f8773	shl	rax, 0x34
1459f8777	or	rax, r15
1459f877a	shl	rbp, 0x2e
1459f877e	shl	rsi, 0x28
1459f8782	or	rsi, rbp
1459f8785	or	rsi, rax
1459f8788	shl	r11, 0x22
1459f878c	shl	r14, 0x1c
1459f8790	or	r14, r11
1459f8793	shl	edi, 0x16
1459f8796	or	rdi, r14
1459f8799	or	rdi, rsi
1459f879c	shl	r9d, 0x10
1459f87a0	or	r9, rdi
1459f87a3	bswap	r9
1459f87a6	mov	rax, qword ptr [rsp + 0xd0]
1459f87ae	mov	dword ptr [rax + rbx + 0xc], r9d
1459f87b3	shr	r9, 0x20
1459f87b7	mov	word ptr [rax + rbx + 0x10], r9w
1459f87bd	movzx	r10d, byte ptr [r8 + r12 + 0x18]
1459f87c3	movzx	r15d, byte ptr [rdx + r10 + 0x43]
1459f87c9	cmp	r15, 0xff
1459f87d0	je	0x1459f8c09
1459f87d6	movzx	r10d, byte ptr [r8 + r12 + 0x19]
1459f87dc	movzx	eax, byte ptr [rdx + r10 + 0x43]
1459f87e2	cmp	rax, 0xff
1459f87e8	je	0x1459f8c13
1459f87ee	movzx	r10d, byte ptr [r8 + r12 + 0x1a]
1459f87f4	movzx	ebp, byte ptr [rdx + r10 + 0x43]
1459f87fa	cmp	rbp, 0xff
1459f8801	je	0x1459f8c1d
1459f8807	movzx	r10d, byte ptr [r8 + r12 + 0x1b]
1459f880d	movzx	esi, byte ptr [rdx + r10 + 0x43]
1459f8813	cmp	rsi, 0xff
1459f881a	je	0x1459f8cd5
1459f8820	movzx	r10d, byte ptr [r8 + r12 + 0x1c]
1459f8826	movzx	edi, byte ptr [rdx + r10 + 0x43]
1459f882c	cmp	rdi, 0xff
1459f8833	je	0x1459f8cdc
1459f8839	movzx	r10d, byte ptr [r8 + r12 + 0x1d]
1459f883f	movzx	r11d, byte ptr [rdx + r10 + 0x43]
1459f8845	cmp	r11, 0xff
1459f884c	je	0x1459f8ce3
1459f8852	movzx	r10d, byte ptr [r8 + r12 + 0x1e]
1459f8858	movzx	r9d, byte ptr [rdx + r10 + 0x43]
1459f885e	cmp	r9, 0xff
1459f8865	je	0x1459f8cea
1459f886b	movzx	r10d, byte ptr [r8 + r12 + 0x1f]
1459f8871	movzx	r14d, byte ptr [rdx + r10 + 0x43]
1459f8877	cmp	r14, 0xff
1459f887e	je	0x1459f8cf1
1459f8884	add	r12, 0x20
1459f8888	shl	r15, 0x3a
1459f888c	shl	rax, 0x34
1459f8890	or	rax, r15
1459f8893	shl	rbp, 0x2e
1459f8897	shl	rsi, 0x28
1459f889b	or	rsi, rbp
1459f889e	or	rsi, rax
1459f88a1	shl	rdi, 0x22
1459f88a5	shl	r11, 0x1c
1459f88a9	or	r11, rdi
1459f88ac	shl	r9d, 0x16
1459f88b0	or	r9, r11
1459f88b3	or	r9, rsi
1459f88b6	shl	r14d, 0x10
1459f88ba	or	r14, r9
1459f88bd	bswap	r14
1459f88c0	mov	rax, qword ptr [rsp + 0xd0]
1459f88c8	mov	dword ptr [rax + rbx + 0x12], r14d
1459f88cd	shr	r14, 0x20
1459f88d1	mov	word ptr [rax + rbx + 0x16], r14w
1459f88d7	mov	rbx, qword ptr [rsp + 0x60]
1459f88dc	mov	r14, qword ptr [rsp + 0x48]
1459f88e1	cmp	r14, r12
1459f88e4	mov	r11, qword ptr [rsp + 0x28]
1459f88e9	mov	rsi, qword ptr [rsp + 0xd8]
1459f88f1	mov	r9, qword ptr [rsp + 0x40]
1459f88f6	mov	rdi, qword ptr [rsp + 0x58]
1459f88fb	jne	0x1459f846d
1459f8901	mov	r10, r14
1459f8904	shr	r10, 2
1459f8908	lea	rax, [r10 + r10*2]
1459f890c	cmp	r13, r10
1459f890f	jb	0x1459f8ec3
1459f8915	cmp	r9, r11
1459f8918	jb	0x1459f8edc
1459f891e	mov	r10, r11
1459f8921	and	r10, 0x1c
1459f8925	je	0x1459f89f2
1459f892b	mov	rsi, qword ptr [rsp + 0x38]
1459f8930	sub	rsi, rax
1459f8933	add	rax, qword ptr [rsp + 0xd0]
1459f893b	mov	r9, qword ptr [rsp + 0x48]
1459f8940	lea	r12, [r8 + r9]
1459f8944	xor	ebx, ebx
1459f8946	xor	r14d, r14d
1459f8949	nop	dword ptr [rax]
1459f8950	lea	r15, [rbx + 3]
1459f8954	cmp	r15, rsi
1459f8957	ja	0x1459f8dd1
1459f895d	movzx	r13d, byte ptr [r12 + r14]
1459f8962	movzx	r11d, byte ptr [rdx + r13 + 0x43]
1459f8968	cmp	r11d, 0xff
1459f896f	je	0x1459f8a4a
1459f8975	movzx	r13d, byte ptr [r12 + r14 + 1]
1459f897b	movzx	r9d, byte ptr [rdx + r13 + 0x43]
1459f8981	cmp	r9d, 0xff
1459f8988	je	0x1459f8a57
1459f898e	movzx	r13d, byte ptr [r12 + r14 + 2]
1459f8994	movzx	ebp, byte ptr [rdx + r13 + 0x43]
1459f899a	cmp	ebp, 0xff
1459f89a0	je	0x1459f8a64
1459f89a6	movzx	r13d, byte ptr [r12 + r14 + 3]
1459f89ac	movzx	edi, byte ptr [rdx + r13 + 0x43]
1459f89b2	cmp	edi, 0xff
1459f89b8	je	0x1459f8acc
1459f89be	shl	r11d, 0x1a
1459f89c2	shl	r9d, 0x14
1459f89c6	or	r9d, r11d
1459f89c9	shl	ebp, 0xe
1459f89cc	shl	edi, 8
1459f89cf	or	edi, ebp
1459f89d1	or	edi, r9d
1459f89d4	bswap	edi
1459f89d6	mov	word ptr [rax + rbx], di
1459f89da	shr	edi, 0x10
1459f89dd	mov	byte ptr [rax + rbx + 2], dil
1459f89e2	add	r14, 4
1459f89e6	mov	rbx, r15
1459f89e9	cmp	r10, r14
1459f89ec	jne	0x1459f8950
1459f89f2	mov	r14, qword ptr [rsp + 0x40]
1459f89f7	mov	r12, r14
1459f89fa	mov	r11, qword ptr [rsp + 0x28]
1459f89ff	sub	r12, r11
1459f8a02	jne	0x1459f8a2a
1459f8a04	xor	r8d, r8d
1459f8a07	test	r14, r14
1459f8a0a	je	0x1459f8ae5
1459f8a10	xor	r9d, r9d
1459f8a13	add	r9, r11
1459f8a16	mov	byte ptr [rcx + 8], 1
1459f8a1a	mov	qword ptr [rcx + 0x10], r9
1459f8a1e	jmp	0x1459f8d05
1459f8a23	xor	edx, edx
1459f8a25	jmp	0x1459f83f7
1459f8a2a	movzx	edi, byte ptr [r8 + r11]
1459f8a2f	cmp	rdi, 0x3d
1459f8a33	jne	0x1459f8a72
1459f8a35	xor	r10d, r10d
1459f8a38	add	r10, r11
1459f8a3b	mov	word ptr [rcx + 8], 0x3d00
1459f8a41	mov	qword ptr [rcx + 0x10], r10
1459f8a45	jmp	0x1459f8d05
1459f8a4a	mov	rax, qword ptr [rsp + 0x48]
1459f8a4f	add	rax, r14
1459f8a52	jmp	0x1459f8ad8
1459f8a57	mov	rax, qword ptr [rsp + 0x48]
1459f8a5c	add	rax, r14
1459f8a5f	inc	rax
1459f8a62	jmp	0x1459f8ad8
1459f8a64	mov	rax, qword ptr [rsp + 0x48]
1459f8a69	add	rax, r14
1459f8a6c	add	rax, 2
1459f8a70	jmp	0x1459f8ad8
1459f8a72	movzx	eax, byte ptr [rdx + rdi + 0x43]
1459f8a77	cmp	al, 0xff
1459f8a79	je	0x1459f8bb5
1459f8a7f	lea	r10, [r11 + 1]
1459f8a83	mov	r9d, 1
1459f8a89	cmp	r10, r14
1459f8a8c	je	0x1459f8a13
1459f8a8e	lea	rbx, [r8 + r11]
1459f8a92	movzx	edi, byte ptr [rbx + 1]
1459f8a96	mov	r10d, 1
1459f8a9c	cmp	rdi, 0x3d
1459f8aa0	je	0x1459f8a38
1459f8aa2	movzx	ebp, byte ptr [rdx + rdi + 0x43]
1459f8aa7	cmp	bpl, 0xff
1459f8aab	je	0x1459f8d42
1459f8ab1	lea	r13, [r11 + 2]
1459f8ab5	cmp	r13, r14
1459f8ab8	jne	0x1459f8d9c
1459f8abe	mov	r9d, 2
1459f8ac4	xor	r8d, r8d
1459f8ac7	xor	r15d, r15d
1459f8aca	jmp	0x1459f8af1
1459f8acc	mov	rax, qword ptr [rsp + 0x48]
1459f8ad1	add	rax, r14
1459f8ad4	add	rax, 3
1459f8ad8	mov	byte ptr [rcx + 8], 0
1459f8adc	mov	byte ptr [rcx + 9], r13b
1459f8ae0	jmp	0x1459f8d01
1459f8ae5	xor	r15d, r15d
1459f8ae8	xor	r9d, r9d
1459f8aeb	xor	edi, edi
1459f8aed	xor	eax, eax
1459f8aef	xor	ebp, ebp
1459f8af1	xor	r14d, r14d
1459f8af4	xor	r13d, r13d
1459f8af7	mov	edx, dword ptr [rsp + 0x54]
1459f8afb	test	edx, edx
1459f8afd	je	0x1459f8c30
1459f8b03	cmp	edx, 1
1459f8b06	jne	0x1459f8c27
1459f8b0c	lea	r10d, [r9 + r8]
1459f8b10	test	r10b, 3
1459f8b14	je	0x1459f8c30
1459f8b1a	mov	byte ptr [rcx + 8], 3
1459f8b1e	jmp	0x1459f8d05
1459f8b23	inc	r12
1459f8b26	jmp	0x1459f8b4a
1459f8b28	add	r12, 2
1459f8b2c	jmp	0x1459f8b4a
1459f8b2e	add	r12, 3
1459f8b32	jmp	0x1459f8b4a
1459f8b34	add	r12, 4
1459f8b38	jmp	0x1459f8b4a
1459f8b3a	add	r12, 5
1459f8b3e	jmp	0x1459f8b4a
1459f8b40	add	r12, 6
1459f8b44	jmp	0x1459f8b4a
1459f8b46	add	r12, 7
1459f8b4a	mov	byte ptr [rcx + 8], 0
1459f8b4e	mov	byte ptr [rcx + 9], r10b
1459f8b52	mov	qword ptr [rcx + 0x10], r12
1459f8b56	jmp	0x1459f8d05
1459f8b5b	mov	eax, 8
1459f8b60	jmp	0x1459f8cf6
1459f8b65	mov	eax, 9
1459f8b6a	jmp	0x1459f8cf6
1459f8b6f	mov	eax, 0xa
1459f8b74	jmp	0x1459f8cf6
1459f8b79	mov	eax, 0xb
1459f8b7e	jmp	0x1459f8cf6
1459f8b83	mov	eax, 0xc
1459f8b88	jmp	0x1459f8cf6
1459f8b8d	mov	eax, 0xd
1459f8b92	jmp	0x1459f8cf6
1459f8b97	mov	eax, 0xe
1459f8b9c	jmp	0x1459f8cf6
1459f8ba1	mov	eax, 0xf
1459f8ba6	jmp	0x1459f8cf6
1459f8bab	mov	eax, 0x10
1459f8bb0	jmp	0x1459f8cf6
1459f8bb5	xor	eax, eax
1459f8bb7	add	rax, r11
1459f8bba	mov	byte ptr [rcx + 8], 0
1459f8bbe	jmp	0x1459f8c89
1459f8bc3	mov	eax, 0x11
1459f8bc8	jmp	0x1459f8cf6
1459f8bcd	mov	eax, 0x12
1459f8bd2	jmp	0x1459f8cf6
1459f8bd7	mov	eax, 0x13
1459f8bdc	jmp	0x1459f8cf6
1459f8be1	mov	eax, 0x14
1459f8be6	jmp	0x1459f8cf6
1459f8beb	mov	eax, 0x15
1459f8bf0	jmp	0x1459f8cf6
1459f8bf5	mov	eax, 0x16
1459f8bfa	jmp	0x1459f8cf6
1459f8bff	mov	eax, 0x17
1459f8c04	jmp	0x1459f8cf6
1459f8c09	mov	eax, 0x18
1459f8c0e	jmp	0x1459f8cf6
1459f8c13	mov	eax, 0x19
1459f8c18	jmp	0x1459f8cf6
1459f8c1d	mov	eax, 0x1a
1459f8c22	jmp	0x1459f8cf6
1459f8c27	test	r8, r8
1459f8c2a	jne	0x1459f8b1a
1459f8c30	lea	r10d, [r9 + r9]
1459f8c34	lea	r10, [r10 + r10*2]
1459f8c38	movzx	eax, al
1459f8c3b	shl	eax, 0x1a
1459f8c3e	movzx	r11d, bpl
1459f8c42	shl	r11d, 0x14
1459f8c46	or	r11d, eax
1459f8c49	movzx	eax, r14b
1459f8c4d	shl	eax, 0xe
1459f8c50	movzx	ebx, r13b
1459f8c54	shl	ebx, 8
1459f8c57	or	ebx, eax
1459f8c59	mov	esi, ebx
1459f8c5b	or	esi, r11d
1459f8c5e	cmp	byte ptr [rsp + 0x37], 0
1459f8c63	jne	0x1459f8c8f
1459f8c65	mov	eax, r10d
1459f8c68	and	al, 0x18
1459f8c6a	mov	edx, esi
1459f8c6c	mov	r14, rcx
1459f8c6f	mov	ecx, eax
1459f8c71	shl	edx, cl
1459f8c73	mov	rcx, r14
1459f8c76	test	edx, edx
1459f8c78	je	0x1459f8c8f
1459f8c7a	mov	rax, qword ptr [rsp + 0x28]
1459f8c7f	add	rax, r9
1459f8c82	dec	rax
1459f8c85	mov	byte ptr [rcx + 8], 2
1459f8c89	mov	byte ptr [rcx + 9], dil
1459f8c8d	jmp	0x1459f8d01
1459f8c8f	shr	r10d, 3
1459f8c93	test	r10, r10
1459f8c96	je	0x1459f8d20
1459f8c9c	mov	r9, qword ptr [rsp + 0xd8]
1459f8ca4	mov	rax, qword ptr [rsp + 0x38]
1459f8ca9	cmp	rax, r9
1459f8cac	mov	rdx, qword ptr [rsp + 0x28]
1459f8cb1	jae	0x1459f8d93
1459f8cb7	shr	r11d, 0x18
1459f8cbb	mov	rdi, qword ptr [rsp + 0xd0]
1459f8cc3	mov	byte ptr [rdi + rax], r11b
1459f8cc7	inc	rax
1459f8cca	cmp	r10d, 1
1459f8cce	jne	0x1459f8d4c
1459f8cd0	mov	r9, rax
1459f8cd3	jmp	0x1459f8d2a
1459f8cd5	mov	eax, 0x1b
1459f8cda	jmp	0x1459f8cf6
1459f8cdc	mov	eax, 0x1c
1459f8ce1	jmp	0x1459f8cf6
1459f8ce3	mov	eax, 0x1d
1459f8ce8	jmp	0x1459f8cf6
1459f8cea	mov	eax, 0x1e
1459f8cef	jmp	0x1459f8cf6
1459f8cf1	mov	eax, 0x1f
1459f8cf6	add	rax, r12
1459f8cf9	mov	byte ptr [rcx + 8], 0
1459f8cfd	mov	byte ptr [rcx + 9], r10b
1459f8d01	mov	qword ptr [rcx + 0x10], rax
1459f8d05	mov	qword ptr [rcx], 2
1459f8d0c	mov	rax, rcx
1459f8d0f	add	rsp, 0x68
1459f8d13	pop	rbx
1459f8d14	pop	rbp
1459f8d15	pop	rdi
1459f8d16	pop	rsi
1459f8d17	pop	r12
1459f8d19	pop	r13
1459f8d1b	pop	r14
1459f8d1d	pop	r15
1459f8d1f	ret
1459f8d20	mov	rdx, qword ptr [rsp + 0x28]
1459f8d25	mov	r9, qword ptr [rsp + 0x38]
1459f8d2a	xor	eax, eax
1459f8d2c	test	r8, r8
1459f8d2f	setne	al
1459f8d32	add	r15, rdx
1459f8d35	mov	qword ptr [rcx], rax
1459f8d38	mov	qword ptr [rcx + 8], r15
1459f8d3c	mov	qword ptr [rcx + 0x10], r9
1459f8d40	jmp	0x1459f8d0c
1459f8d42	mov	eax, 1
1459f8d47	jmp	0x1459f8bb7
1459f8d4c	cmp	rax, r9
1459f8d4f	mov	rax, qword ptr [rsp + 0x38]
1459f8d54	jae	0x1459f8d93
1459f8d56	shr	esi, 0x10
1459f8d59	mov	r11, qword ptr [rsp + 0xd0]
1459f8d61	mov	byte ptr [r11 + rax + 1], sil
1459f8d66	add	rax, 2
1459f8d6a	cmp	r10d, 2
1459f8d6e	je	0x1459f8cd0
1459f8d74	cmp	rax, r9
1459f8d77	mov	rax, qword ptr [rsp + 0x38]
1459f8d7c	jae	0x1459f8d93
1459f8d7e	mov	rsi, qword ptr [rsp + 0xd0]
1459f8d86	mov	byte ptr [rsi + rax + 2], bh
1459f8d8a	add	rax, 3
1459f8d8e	mov	r9, rax
1459f8d91	jmp	0x1459f8d2a
1459f8d93	mov	byte ptr [rcx + 8], 0xff
1459f8d97	jmp	0x1459f8d05
1459f8d9c	add	r8, r14
1459f8d9f	movzx	esi, byte ptr [rbx + 2]
1459f8da3	cmp	rsi, 0x3d
1459f8da7	jne	0x1459f8de9
1459f8da9	lea	rdx, [rbx + 2]
1459f8dad	sub	r8, rdx
1459f8db0	lea	rdx, [r11 + 3]
1459f8db4	mov	r15d, 2
1459f8dba	cmp	rdx, r14
1459f8dbd	jne	0x1459f8e50
1459f8dc3	xor	r14d, r14d
1459f8dc6	mov	r9d, 2
1459f8dcc	jmp	0x1459f8af4
1459f8dd1	lea	rdx, [rbx + 3]
1459f8dd5	lea	r9, [rip + 0x183fc1c]
1459f8ddc	mov	rcx, rbx
1459f8ddf	mov	r8, rsi
1459f8de2	call	0x145d99860
1459f8de7	ud2
1459f8de9	movzx	r14d, byte ptr [rdx + rsi + 0x43]
1459f8def	cmp	r14b, 0xff
1459f8df3	je	0x1459f8e83
1459f8df9	mov	r9, qword ptr [rsp + 0x28]
1459f8dfe	lea	r11, [r9 + 3]
1459f8e02	cmp	r11, qword ptr [rsp + 0x40]
1459f8e07	jne	0x1459f8e94
1459f8e0d	mov	r9d, 3
1459f8e13	xor	r8d, r8d
1459f8e16	xor	r15d, r15d
1459f8e19	mov	edi, esi
1459f8e1b	jmp	0x1459f8af4
1459f8e20	lea	rax, [rip + 0x183fc31]
1459f8e27	xor	ecx, ecx
1459f8e29	mov	rdx, r14
1459f8e2c	mov	r8, r9
1459f8e2f	mov	r9, rax
1459f8e32	call	0x145d99860
1459f8e37	ud2
1459f8e39	lea	r9, [rip + 0x183fc00]
1459f8e40	mov	rcx, rbx
1459f8e43	mov	rdx, rdi
1459f8e46	mov	r8, rsi
1459f8e49	call	0x145d99860
1459f8e4e	ud2
1459f8e50	mov	r9d, 3
1459f8e56	xor	r10d, r10d
1459f8e59	cmp	byte ptr [rbx + r9], 0x3d
1459f8e5e	jne	0x1459f8fc5
1459f8e64	test	r9, r9
1459f8e67	je	0x1459f8fb8
1459f8e6d	inc	r9
1459f8e70	xor	r14d, r14d
1459f8e73	cmp	r12, r9
1459f8e76	jne	0x1459f8e59
1459f8e78	mov	r9d, 2
1459f8e7e	jmp	0x1459f8af4
1459f8e83	mov	eax, 2
1459f8e88	mov	edi, esi
1459f8e8a	mov	r11, qword ptr [rsp + 0x28]
1459f8e8f	jmp	0x1459f8bb7
1459f8e94	movzx	edi, byte ptr [rbx + 3]
1459f8e98	cmp	rdi, 0x3d
1459f8e9c	jne	0x1459f8ef6
1459f8e9e	lea	rdx, [rbx + 3]
1459f8ea2	sub	r8, rdx
1459f8ea5	mov	rdx, qword ptr [rsp + 0x28]
1459f8eaa	add	rdx, 4
1459f8eae	mov	r15d, 3
1459f8eb4	cmp	rdx, qword ptr [rsp + 0x40]
1459f8eb9	jne	0x1459f8f26
1459f8ebb	xor	r13d, r13d
1459f8ebe	jmp	0x1459f8f4a
1459f8ec3	lea	r9, [rip + 0x183fb5e]
1459f8eca	mov	rcx, rax
1459f8ecd	mov	rdx, qword ptr [rsp + 0x38]
1459f8ed2	mov	r8, rsi
1459f8ed5	call	0x145d99860
1459f8eda	ud2
1459f8edc	lea	rax, [rip + 0x183fb2d]
1459f8ee3	mov	rcx, r14
1459f8ee6	mov	rdx, r11
1459f8ee9	mov	r8, r9
1459f8eec	mov	r9, rax
1459f8eef	call	0x145d99860
1459f8ef4	ud2
1459f8ef6	movzx	r13d, byte ptr [rdx + rdi + 0x43]
1459f8efc	cmp	r13b, 0xff
1459f8f00	je	0x1459f8f57
1459f8f02	mov	r9, rdx
1459f8f05	mov	rdx, qword ptr [rsp + 0x28]
1459f8f0a	add	rdx, 4
1459f8f0e	cmp	rdx, qword ptr [rsp + 0x40]
1459f8f13	jne	0x1459f8f66
1459f8f15	mov	r9d, 4
1459f8f1b	xor	r8d, r8d
1459f8f1e	xor	r15d, r15d
1459f8f21	jmp	0x1459f8af7
1459f8f26	mov	r9d, 4
1459f8f2c	xor	r10d, r10d
1459f8f2f	cmp	byte ptr [rbx + r9], 0x3d
1459f8f34	jne	0x1459f8fc2
1459f8f3a	test	r9, r9
1459f8f3d	je	0x1459f8fb8
1459f8f3f	inc	r9
1459f8f42	xor	r13d, r13d
1459f8f45	cmp	r12, r9
1459f8f48	jne	0x1459f8f2f
1459f8f4a	mov	r9d, 3
1459f8f50	mov	edi, esi
1459f8f52	jmp	0x1459f8af7
1459f8f57	mov	eax, 3
1459f8f5c	mov	r11, qword ptr [rsp + 0x28]
1459f8f61	jmp	0x1459f8bb7
1459f8f66	mov	r11, rdx
1459f8f69	lea	r10, [rbx + 4]
1459f8f6d	movzx	edx, byte ptr [r10]
1459f8f71	cmp	rdx, 0x3d
1459f8f75	jne	0x1459f8fd4
1459f8f77	sub	r8, r10
1459f8f7a	mov	rdx, qword ptr [rsp + 0x28]
1459f8f7f	add	rdx, 5
1459f8f83	mov	r15d, 4
1459f8f89	cmp	rdx, qword ptr [rsp + 0x40]
1459f8f8e	je	0x1459f8fad
1459f8f90	mov	r9d, 5
1459f8f96	xor	r10d, r10d
1459f8f99	cmp	byte ptr [rbx + r9], 0x3d
1459f8f9e	jne	0x1459f8fc2
1459f8fa0	test	r9, r9
1459f8fa3	je	0x1459f8fb8
1459f8fa5	inc	r9
1459f8fa8	cmp	r12, r9
1459f8fab	jne	0x1459f8f99
1459f8fad	mov	r9d, 4
1459f8fb3	jmp	0x1459f8af7
1459f8fb8	mov	r11, qword ptr [rsp + 0x28]
1459f8fbd	jmp	0x1459f8a38
1459f8fc2	mov	r13, r11
1459f8fc5	mov	word ptr [rcx + 8], 0x3d00
1459f8fcb	mov	qword ptr [rcx + 0x10], r13
1459f8fcf	jmp	0x1459f8d05
1459f8fd4	cmp	byte ptr [r9 + rdx + 0x43], 0xff
1459f8fda	jne	0x1459f9000
1459f8fdc	mov	eax, 4
1459f8fe1	mov	edi, edx
1459f8fe3	mov	r11, qword ptr [rsp + 0x28]
1459f8fe8	jmp	0x1459f8bb7
1459f8fed	lea	r8, [rip + 0x183fa7c]
1459f8ff4	mov	rcx, rax
1459f8ff7	xor	edx, edx
1459f8ff9	call	0x145d99653
1459f8ffe	ud2
1459f9000	lea	r8, [rip + 0x183f961]
1459f9007	mov	ecx, 4
1459f900c	mov	edx, 4
1459f9011	call	0x145d99653
1459f9016	ud2
