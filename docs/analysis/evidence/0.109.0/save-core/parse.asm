14589e380	push	rbp
14589e381	push	r15
14589e383	push	r14
14589e385	push	r13
14589e387	push	r12
14589e389	push	rsi
14589e38a	push	rdi
14589e38b	push	rbx
14589e38c	sub	rsp, 0x458
14589e393	lea	rbp, [rsp + 0x80]
14589e39b	movaps	xmmword ptr [rbp + 0x3c0], xmm6
14589e3a2	mov	qword ptr [rbp + 0x3b8], 0xfffffffffffffffe
14589e3ad	mov	rsi, r8
14589e3b0	mov	rdi, rdx
14589e3b3	mov	qword ptr [rbp + 0x18], rcx
14589e3b7	mov	qword ptr [rbp + 0x240], 0
14589e3c2	mov	qword ptr [rbp + 0x248], r8
14589e3c9	mov	qword ptr [rbp + 0x250], rdx
14589e3d0	mov	qword ptr [rbp + 0x258], r8
14589e3d7	mov	qword ptr [rbp + 0x260], 0
14589e3e2	mov	qword ptr [rbp + 0x268], r8
14589e3e9	movabs	rbx, 0xa0000000a
14589e3f3	mov	qword ptr [rbp + 0x270], rbx
14589e3fa	mov	byte ptr [rbp + 0x278], 1
14589e401	mov	word ptr [rbp + 0x280], 0
14589e40a	mov	rcx, rbp
14589e40d	lea	r14, [rbp + 0x240]
14589e414	mov	rdx, r14
14589e417	call	0x1459bb340
14589e41c	mov	qword ptr [rbp + 0x320], 0
14589e427	mov	qword ptr [rbp + 0x328], rsi
14589e42e	lea	r15, [rbp + 0x330]
14589e435	mov	qword ptr [rbp + 0x370], rdi
14589e43c	mov	qword ptr [rbp + 0x330], rdi
14589e443	mov	qword ptr [rbp + 0x338], rsi
14589e44a	mov	qword ptr [rbp + 0x340], 0
14589e455	mov	qword ptr [rbp + 0x378], rsi
14589e45c	mov	qword ptr [rbp + 0x348], rsi
14589e463	mov	qword ptr [rbp + 0x350], rbx
14589e46a	mov	byte ptr [rbp + 0x358], 1
14589e471	mov	word ptr [rbp + 0x360], 0
14589e47a	lea	r12, [rbp + 0x220]
14589e481	xor	eax, eax
14589e483	mov	rdi, 0xffffffffffffffff
14589e48a	test	al, 1
14589e48c	je	0x1458a1b76
14589e492	mov	qword ptr [rbp + 0x58], rdi
14589e496	mov	qword ptr [rbp + 0x208], 0
14589e4a1	mov	qword ptr [rbp + 0x210], 8
14589e4ac	mov	qword ptr [rbp + 0x218], 0
14589e4b7	mov	qword ptr [rbp + 0x320], 0
14589e4c2	mov	rax, qword ptr [rbp + 0x378]
14589e4c9	mov	qword ptr [rbp + 0x328], rax
14589e4d0	lea	r14, [rbp + 0x330]
14589e4d7	mov	rcx, qword ptr [rbp + 0x370]
14589e4de	mov	qword ptr [rbp + 0x330], rcx
14589e4e5	mov	qword ptr [rbp + 0x338], rax
14589e4ec	mov	qword ptr [rbp + 0x340], 0
14589e4f7	mov	qword ptr [rbp + 0x348], rax
14589e4fe	movabs	rax, 0xa0000000a
14589e508	mov	qword ptr [rbp + 0x350], rax
14589e50f	mov	byte ptr [rbp + 0x358], 1
14589e516	mov	word ptr [rbp + 0x360], 0
14589e51f	xor	eax, eax
14589e521	lea	r15, [rbp + 0x240]
14589e528	lea	r12, [rbp + 0x1c0]
14589e52f	mov	edi, 0x6f6c6e75
14589e534	lea	rbx, [rip + 0x134d055]
14589e53b	jmp	0x14589e585
14589e53d	mov	rax, qword ptr [rsi]
14589e540	mov	ecx, dword ptr [rax]
14589e542	xor	ecx, edi
14589e544	movzx	eax, word ptr [rax + 4]
14589e548	xor	eax, 0x6b63
14589e54d	or	eax, ecx
14589e54f	je	0x14589e712
14589e555	nop	word ptr cs:[rax + rax]
14589e560	mov	rdx, qword ptr [rbp + 0x1c0]
14589e567	test	rdx, rdx
14589e56a	je	0x14589e57e
14589e56c	shl	rdx, 4
14589e570	mov	r8d, 8
14589e576	mov	rcx, rsi
14589e579	call	0x1400021d0
14589e57e	movzx	eax, byte ptr [rbp + 0x361]
14589e585	test	al, 1
14589e587	jne	0x14589ecdd
14589e58d	mov	rsi, qword ptr [rbp + 0x330]
14589e594	mov	rcx, r15
14589e597	mov	rdx, r14
14589e59a	call	0x1458aabb0
14589e59f	nop
14589e5a0	cmp	dword ptr [rbp + 0x240], 1
14589e5a7	jne	0x14589e5d0
14589e5a9	mov	rdx, qword ptr [rbp + 0x250]
14589e5b0	mov	rax, qword ptr [rbp + 0x320]
14589e5b7	mov	qword ptr [rbp + 0x320], rdx
14589e5be	sub	rdx, rax
14589e5c1	add	rsi, rax
14589e5c4	test	rdx, rdx
14589e5c7	jne	0x14589e612
14589e5c9	jmp	0x14589e640
14589e5cb	nop	dword ptr [rax + rax]
14589e5d0	cmp	byte ptr [rbp + 0x361], 0
14589e5d7	jne	0x14589ecdd
14589e5dd	mov	byte ptr [rbp + 0x361], 1
14589e5e4	mov	rsi, qword ptr [rbp + 0x320]
14589e5eb	mov	rdx, qword ptr [rbp + 0x328]
14589e5f2	sub	rdx, rsi
14589e5f5	setne	al
14589e5f8	or	al, byte ptr [rbp + 0x360]
14589e5fe	cmp	al, 1
14589e600	jne	0x14589ecdd
14589e606	add	rsi, qword ptr [rbp + 0x330]
14589e60d	test	rdx, rdx
14589e610	je	0x14589e640
14589e612	cmp	byte ptr [rsi + rdx - 1], 0xa
14589e617	jne	0x14589e640
14589e619	mov	rax, rdx
14589e61c	dec	rax
14589e61f	je	0x14589e62e
14589e621	cmp	byte ptr [rsi + rdx - 2], 0xd
14589e626	jne	0x14589e632
14589e628	add	rdx, -2
14589e62c	jmp	0x14589e640
14589e62e	xor	edx, edx
14589e630	jmp	0x14589e640
14589e632	mov	rdx, rax
14589e635	nop	word ptr cs:[rax + rax]
14589e640	mov	rcx, rsi
14589e643	call	0x140089200
14589e648	nop
14589e649	mov	qword ptr [rbp + 0x240], 0
14589e654	mov	qword ptr [rbp + 0x248], rdx
14589e65b	mov	qword ptr [rbp + 0x250], rax
14589e662	mov	qword ptr [rbp + 0x258], rdx
14589e669	mov	qword ptr [rbp + 0x260], 0
14589e674	mov	qword ptr [rbp + 0x268], rdx
14589e67b	movabs	rax, 0x7c0000007c
14589e685	mov	qword ptr [rbp + 0x270], rax
14589e68c	mov	byte ptr [rbp + 0x278], 1
14589e693	mov	word ptr [rbp + 0x280], 1
14589e69c	mov	rcx, r12
14589e69f	mov	rdx, r15
14589e6a2	call	0x1459bd2c0
14589e6a7	nop
14589e6a8	mov	rsi, qword ptr [rbp + 0x1c8]
14589e6af	cmp	qword ptr [rbp + 0x1d0], 3
14589e6b7	jne	0x14589e560
14589e6bd	mov	rax, qword ptr [rsi + 8]
14589e6c1	cmp	rax, 6
14589e6c5	je	0x14589e53d
14589e6cb	cmp	rax, 4
14589e6cf	jne	0x14589e560
14589e6d5	mov	rax, qword ptr [rsi]
14589e6d8	cmp	dword ptr [rax], 0x6e65706f
14589e6de	jne	0x14589e560
14589e6e4	mov	rdx, qword ptr [rsi + 0x18]
14589e6e8	test	rdx, rdx
14589e6eb	je	0x14589e560
14589e6f1	mov	rcx, qword ptr [rsi + 0x10]
14589e6f5	cmp	rdx, 1
14589e6f9	jne	0x14589e749
14589e6fb	movzx	eax, byte ptr [rcx]
14589e6fe	cmp	eax, 0x2b
14589e701	je	0x14589e560
14589e707	cmp	eax, 0x2d
14589e70a	je	0x14589e560
14589e710	jmp	0x14589e74c
14589e712	mov	r8, qword ptr [rsi + 0x18]
14589e716	mov	cl, 1
14589e718	test	r8, r8
14589e71b	je	0x14589e7e7
14589e721	mov	rdx, qword ptr [rsi + 0x10]
14589e725	cmp	r8, 1
14589e729	jne	0x14589e7b0
14589e72f	movzx	r9d, byte ptr [rdx]
14589e733	cmp	r9d, 0x2b
14589e737	je	0x14589e7e7
14589e73d	cmp	r9d, 0x2d
14589e741	je	0x14589e7e7
14589e747	jmp	0x14589e7b4
14589e749	movzx	eax, byte ptr [rcx]
14589e74c	xor	r8d, r8d
14589e74f	cmp	al, 0x2b
14589e751	sete	r8b
14589e755	mov	rax, rdx
14589e758	sub	rax, r8
14589e75b	add	rcx, r8
14589e75e	cmp	rax, 3
14589e762	jae	0x14589e7f9
14589e768	test	rax, rax
14589e76b	je	0x14589e995
14589e771	movzx	r13d, byte ptr [rcx]
14589e775	add	r13d, -0x30
14589e779	cmp	r13d, 9
14589e77d	ja	0x14589e560
14589e783	cmp	rax, 1
14589e787	je	0x14589e998
14589e78d	movzx	eax, byte ptr [rcx + 1]
14589e791	add	eax, -0x30
14589e794	cmp	eax, 9
14589e797	ja	0x14589e560
14589e79d	movzx	ecx, r13b
14589e7a1	add	ecx, ecx
14589e7a3	lea	ecx, [rcx + rcx*4]
14589e7a6	add	al, cl
14589e7a8	mov	r13d, eax
14589e7ab	jmp	0x14589e998
14589e7b0	movzx	r9d, byte ptr [rdx]
14589e7b4	xor	eax, eax
14589e7b6	cmp	r9b, 0x2b
14589e7ba	sete	al
14589e7bd	mov	r9, r8
14589e7c0	sub	r9, rax
14589e7c3	add	rdx, rax
14589e7c6	cmp	r9, 3
14589e7ca	jae	0x14589e84b
14589e7cc	test	r9, r9
14589e7cf	je	0x14589e9b2
14589e7d5	movzx	r13d, byte ptr [rdx]
14589e7d9	add	r13d, -0x30
14589e7dd	cmp	r13d, 9
14589e7e1	jbe	0x14589ea5f
14589e7e7	mov	r8, qword ptr [rsi + 0x28]
14589e7eb	test	r8, r8
14589e7ee	jne	0x14589e8a4
14589e7f4	jmp	0x14589e560
14589e7f9	neg	r8
14589e7fc	add	rdx, r8
14589e7ff	neg	rdx
14589e802	xor	r8d, r8d
14589e805	xor	r13d, r13d
14589e808	mov	rax, rdx
14589e80b	add	rax, r8
14589e80e	je	0x14589e998
14589e814	mov	eax, r13d
14589e817	mov	r9b, 0xa
14589e81a	mul	r9b
14589e81d	jo	0x14589e560
14589e823	mov	r13d, eax
14589e826	movzx	r9d, byte ptr [rcx + r8]
14589e82b	add	r9d, -0x30
14589e82f	add	r13b, r9b
14589e832	setb	al
14589e835	cmp	r9d, 9
14589e839	ja	0x14589e560
14589e83f	inc	r8
14589e842	test	al, al
14589e844	je	0x14589e808
14589e846	jmp	0x14589e560
14589e84b	neg	rax
14589e84e	add	r8, rax
14589e851	neg	r8
14589e854	xor	r9d, r9d
14589e857	xor	r13d, r13d
14589e85a	mov	rax, r8
14589e85d	add	rax, r9
14589e860	setne	cl
14589e863	je	0x14589e897
14589e865	mov	eax, r13d
14589e868	mov	r10b, 0xa
14589e86b	mul	r10b
14589e86e	jo	0x14589e7e7
14589e874	mov	r13d, eax
14589e877	movzx	r10d, byte ptr [rdx + r9]
14589e87c	add	r10d, -0x30
14589e880	add	r13b, r10b
14589e883	setb	al
14589e886	cmp	r10d, 9
14589e88a	ja	0x14589e7e7
14589e890	inc	r9
14589e893	test	al, al
14589e895	je	0x14589e85a
14589e897	mov	r8, qword ptr [rsi + 0x28]
14589e89b	test	r8, r8
14589e89e	je	0x14589e560
14589e8a4	mov	r9, qword ptr [rsi + 0x20]
14589e8a8	cmp	r8, 1
14589e8ac	jne	0x14589e8c6
14589e8ae	movzx	eax, byte ptr [r9]
14589e8b2	cmp	eax, 0x2b
14589e8b5	je	0x14589e560
14589e8bb	cmp	eax, 0x2d
14589e8be	je	0x14589e560
14589e8c4	jmp	0x14589e8ca
14589e8c6	movzx	eax, byte ptr [r9]
14589e8ca	xor	r10d, r10d
14589e8cd	cmp	al, 0x2b
14589e8cf	sete	r10b
14589e8d3	mov	rdx, r8
14589e8d6	sub	rdx, r10
14589e8d9	add	r9, r10
14589e8dc	mov	rax, r10
14589e8df	neg	rax
14589e8e2	cmp	rdx, 0x11
14589e8e6	jae	0x14589e94f
14589e8e8	test	rdx, rdx
14589e8eb	je	0x14589e9c9
14589e8f1	add	r8, rax
14589e8f4	neg	r8
14589e8f7	xor	edx, edx
14589e8f9	xor	eax, eax
14589e8fb	nop	dword ptr [rax + rax]
14589e900	movzx	r10d, byte ptr [r9 + rdx]
14589e905	add	r10d, -0x30
14589e909	cmp	r10d, 9
14589e90d	ja	0x14589e560
14589e913	lea	rax, [rax + rax*4]
14589e917	mov	r10d, r10d
14589e91a	lea	rax, [r10 + rax*2]
14589e91e	inc	rdx
14589e921	mov	r10, r8
14589e924	add	r10, rdx
14589e927	jne	0x14589e900
14589e929	cmp	rax, 9
14589e92d	mov	edx, 9
14589e932	cmovb	rdx, rax
14589e936	test	rax, rax
14589e939	mov	eax, 1
14589e93e	cmove	rdx, rax
14589e942	test	cl, cl
14589e944	jne	0x14589e560
14589e94a	jmp	0x14589e9d6
14589e94f	add	r8, rax
14589e952	neg	r8
14589e955	xor	r10d, r10d
14589e958	xor	eax, eax
14589e95a	mov	rdx, r8
14589e95d	add	rdx, r10
14589e960	je	0x14589e929
14589e962	mov	edx, 0xa
14589e967	mul	rdx
14589e96a	jo	0x14589e560
14589e970	movzx	r11d, byte ptr [r9 + r10]
14589e975	add	r11d, -0x30
14589e979	add	rax, r11
14589e97c	setb	dl
14589e97f	cmp	r11d, 9
14589e983	ja	0x14589e560
14589e989	inc	r10
14589e98c	test	dl, dl
14589e98e	je	0x14589e95a
14589e990	jmp	0x14589e560
14589e995	xor	r13d, r13d
14589e998	lea	rax, [rsi + 0x20]
14589e99c	lea	rcx, [rsi + 0x28]
14589e9a0	mov	rcx, qword ptr [rcx]
14589e9a3	lea	rdx, [rcx - 2]
14589e9a7	cmp	rdx, 6
14589e9ab	jbe	0x14589e9fb
14589e9ad	jmp	0x14589e560
14589e9b2	xor	ecx, ecx
14589e9b4	xor	r13d, r13d
14589e9b7	mov	r8, qword ptr [rsi + 0x28]
14589e9bb	test	r8, r8
14589e9be	jne	0x14589e8a4
14589e9c4	jmp	0x14589e560
14589e9c9	mov	edx, 1
14589e9ce	test	cl, cl
14589e9d0	jne	0x14589e560
14589e9d6	shl	rdx, 4
14589e9da	lea	rax, [rdx + rbx]
14589e9de	add	rax, -0x10
14589e9e2	lea	rcx, [rdx + rbx]
14589e9e6	add	rcx, -8
14589e9ea	mov	rcx, qword ptr [rcx]
14589e9ed	lea	rdx, [rcx - 2]
14589e9f1	cmp	rdx, 6
14589e9f5	ja	0x14589e560
14589e9fb	mov	rax, qword ptr [rax]
14589e9fe	lea	r8, [rip + 0x134d23b]
14589ea05	movsxd	rdx, dword ptr [r8 + rdx*4]
14589ea09	add	rdx, r8
14589ea0c	jmp	rdx
14589ea0e	movzx	edx, word ptr [rip + 0x13377ec]
14589ea15	cmp	dx, word ptr [rax]
14589ea18	je	0x14589ebf6
14589ea1e	movzx	edx, word ptr [rip + 0x133a47b]
14589ea25	cmp	dx, word ptr [rax]
14589ea28	je	0x14589ec20
14589ea2e	movzx	edx, word ptr [rip + 0x133b525]
14589ea35	cmp	dx, word ptr [rax]
14589ea38	je	0x14589ec2e
14589ea3e	movzx	edx, word ptr [rip + 0x133d6e2]
14589ea45	cmp	dx, word ptr [rax]
14589ea48	jne	0x14589ebb4
14589ea4e	mov	qword ptr [rbp + 0x3a8], rsi
14589ea55	mov	esi, 0xb
14589ea5a	jmp	0x14589ec3a
14589ea5f	cmp	r9, 1
14589ea63	jne	0x14589ea79
14589ea65	xor	ecx, ecx
14589ea67	mov	r8, qword ptr [rsi + 0x28]
14589ea6b	test	r8, r8
14589ea6e	jne	0x14589e8a4
14589ea74	jmp	0x14589e560
14589ea79	movzx	eax, byte ptr [rdx + 1]
14589ea7d	add	eax, -0x30
14589ea80	cmp	eax, 9
14589ea83	ja	0x14589e897
14589ea89	movzx	ecx, r13b
14589ea8d	add	ecx, ecx
14589ea8f	lea	ecx, [rcx + rcx*4]
14589ea92	add	al, cl
14589ea94	xor	ecx, ecx
14589ea96	mov	r13d, eax
14589ea99	jmp	0x14589e897
14589ea9e	movzx	edx, word ptr [rip + 0x1335ae1]
14589eaa5	xor	dx, word ptr [rax]
14589eaa8	movzx	r8d, byte ptr [rip + 0x1335ad8]
14589eab0	xor	r8b, byte ptr [rax + 2]
14589eab4	movzx	r8d, r8b
14589eab8	or	r8w, dx
14589eabc	je	0x14589ebe8
14589eac2	movzx	edx, word ptr [rip + 0x133c360]
14589eac9	xor	dx, word ptr [rax]
14589eacc	movzx	r8d, byte ptr [rip + 0x133c357]
14589ead4	xor	r8b, byte ptr [rax + 2]
14589ead8	movzx	r8d, r8b
14589eadc	or	r8w, dx
14589eae0	jne	0x14589ebb4
14589eae6	mov	qword ptr [rbp + 0x3a8], rsi
14589eaed	mov	esi, 0xa
14589eaf2	jmp	0x14589ec3a
14589eaf7	mov	edx, dword ptr [rip + 0x1333bbb]
14589eafd	xor	edx, dword ptr [rax]
14589eaff	movzx	r8d, word ptr [rip + 0x1333bb5]
14589eb07	xor	r8w, word ptr [rax + 4]
14589eb0c	movzx	r8d, r8w
14589eb10	or	r8d, edx
14589eb13	je	0x14589ec04
14589eb19	mov	edx, dword ptr [rip + 0x1336888]
14589eb1f	xor	edx, dword ptr [rax]
14589eb21	movzx	r8d, word ptr [rip + 0x1336882]
14589eb29	xor	r8w, word ptr [rax + 4]
14589eb2e	movzx	r8d, r8w
14589eb32	or	r8d, edx
14589eb35	jne	0x14589eb58
14589eb37	mov	qword ptr [rbp + 0x3a8], rsi
14589eb3e	mov	esi, 4
14589eb43	jmp	0x14589ec3a
14589eb48	mov	rdx, qword ptr [rip + 0x1334bec]
14589eb4f	cmp	rdx, qword ptr [rax]
14589eb52	je	0x14589ec12
14589eb58	cmp	rcx, 4
14589eb5c	je	0x14589ebbe
14589eb5e	cmp	rcx, 5
14589eb62	je	0x14589eb97
14589eb64	cmp	rcx, 7
14589eb68	jne	0x14589e560
14589eb6e	mov	edx, dword ptr [rip + 0x13384d4]
14589eb74	xor	edx, dword ptr [rax]
14589eb76	mov	r8d, dword ptr [rip + 0x13384ce]
14589eb7d	xor	r8d, dword ptr [rax + 3]
14589eb81	or	r8d, edx
14589eb84	jne	0x14589ebb4
14589eb86	mov	qword ptr [rbp + 0x3a8], rsi
14589eb8d	mov	esi, 6
14589eb92	jmp	0x14589ec3a
14589eb97	mov	edx, dword ptr [rip + 0x13393c9]
14589eb9d	xor	edx, dword ptr [rax]
14589eb9f	movzx	r8d, byte ptr [rip + 0x13393c3]
14589eba7	xor	r8b, byte ptr [rax + 4]
14589ebab	movzx	r8d, r8b
14589ebaf	or	r8d, edx
14589ebb2	je	0x14589ebda
14589ebb4	cmp	rcx, 4
14589ebb8	jne	0x14589e560
14589ebbe	mov	ecx, dword ptr [rip + 0x133e3f6]
14589ebc4	cmp	ecx, dword ptr [rax]
14589ebc6	jne	0x14589e560
14589ebcc	mov	qword ptr [rbp + 0x3a8], rsi
14589ebd3	mov	esi, 0xc
14589ebd8	jmp	0x14589ec3a
14589ebda	mov	qword ptr [rbp + 0x3a8], rsi
14589ebe1	mov	esi, 7
14589ebe6	jmp	0x14589ec3a
14589ebe8	mov	qword ptr [rbp + 0x3a8], rsi
14589ebef	mov	esi, 3
14589ebf4	jmp	0x14589ec3a
14589ebf6	mov	qword ptr [rbp + 0x3a8], rsi
14589ebfd	mov	esi, 5
14589ec02	jmp	0x14589ec3a
14589ec04	mov	qword ptr [rbp + 0x3a8], rsi
14589ec0b	mov	esi, 1
14589ec10	jmp	0x14589ec3a
14589ec12	mov	qword ptr [rbp + 0x3a8], rsi
14589ec19	mov	esi, 2
14589ec1e	jmp	0x14589ec3a
14589ec20	mov	qword ptr [rbp + 0x3a8], rsi
14589ec27	mov	esi, 8
14589ec2c	jmp	0x14589ec3a
14589ec2e	mov	qword ptr [rbp + 0x3a8], rsi
14589ec35	mov	esi, 9
14589ec3a	mov	rax, qword ptr [rbp + 0x210]
14589ec41	mov	rdi, qword ptr [rbp + 0x218]
14589ec48	mov	rbx, rdi
14589ec4b	shl	rbx, 4
14589ec4f	xor	ecx, ecx
14589ec51	nop	word ptr cs:[rax + rax]
14589ec60	cmp	rbx, rcx
14589ec63	je	0x14589ec85
14589ec65	lea	rdx, [rcx + 0x10]
14589ec69	cmp	byte ptr [rax + rcx], r13b
14589ec6d	mov	rcx, rdx
14589ec70	jne	0x14589ec60
14589ec72	mov	rcx, qword ptr [rax + rdx - 8]
14589ec77	cmp	rsi, rcx
14589ec7a	cmova	rcx, rsi
14589ec7e	mov	qword ptr [rax + rdx - 8], rcx
14589ec83	jmp	0x14589ecb5
14589ec85	cmp	rdi, qword ptr [rbp + 0x208]
14589ec8c	jne	0x14589eca2
14589ec8e	lea	rcx, [rbp + 0x208]
14589ec95	call	0x145bfaef0
14589ec9a	nop
14589ec9b	mov	rax, qword ptr [rbp + 0x210]
14589eca2	mov	byte ptr [rax + rbx], r13b
14589eca6	mov	qword ptr [rax + rbx + 8], rsi
14589ecab	inc	rdi
14589ecae	mov	qword ptr [rbp + 0x218], rdi
14589ecb5	mov	rdx, qword ptr [rbp + 0x1c0]
14589ecbc	test	rdx, rdx
14589ecbf	mov	edi, 0x6f6c6e75
14589ecc4	lea	rbx, [rip + 0x134c8c5]
14589eccb	mov	rsi, qword ptr [rbp + 0x3a8]
14589ecd2	jne	0x14589e56c
14589ecd8	jmp	0x14589e57e
14589ecdd	mov	qword ptr [rbp + 0x240], 0
14589ece8	mov	rax, qword ptr [rbp + 0x378]
14589ecef	mov	qword ptr [rbp + 0x248], rax
14589ecf6	mov	rcx, qword ptr [rbp + 0x370]
14589ecfd	mov	qword ptr [rbp + 0x250], rcx
14589ed04	mov	qword ptr [rbp + 0x258], rax
14589ed0b	mov	qword ptr [rbp + 0x260], 0
14589ed16	mov	qword ptr [rbp + 0x268], rax
14589ed1d	movabs	rax, 0xa0000000a
14589ed27	mov	qword ptr [rbp + 0x270], rax
14589ed2e	mov	byte ptr [rbp + 0x278], 1
14589ed35	mov	word ptr [rbp + 0x280], 0
14589ed3e	mov	dword ptr [rbp + 0x2bc], 0xffffffff
14589ed48	mov	dword ptr [rbp + 0x304], 0xffffffff
14589ed52	lea	rcx, [rbp + 0xc8]
14589ed59	lea	rdx, [rbp + 0x240]
14589ed60	call	0x1459c3640
14589ed65	nop
14589ed66	mov	r14, qword ptr [rbp + 0xd8]
14589ed6d	cmp	r14, 2
14589ed71	jae	0x1458a239e
14589ed77	mov	qword ptr [rbp + 0x1a0], 0
14589ed82	mov	qword ptr [rbp + 0x1a8], 4
14589ed8d	mov	qword ptr [rbp + 0x1b0], 0
14589ed98	mov	qword ptr [rbp + 0x320], 0
14589eda3	mov	rax, qword ptr [rbp + 0x378]
14589edaa	mov	qword ptr [rbp + 0x328], rax
14589edb1	mov	rcx, qword ptr [rbp + 0x370]
14589edb8	mov	qword ptr [rbp + 0x330], rcx
14589edbf	mov	qword ptr [rbp + 0x338], rax
14589edc6	mov	qword ptr [rbp + 0x340], 0
14589edd1	mov	qword ptr [rbp + 0x348], rax
14589edd8	movabs	rax, 0xa0000000a
14589ede2	mov	qword ptr [rbp + 0x350], rax
14589ede9	mov	byte ptr [rbp + 0x358], 1
14589edf0	mov	word ptr [rbp + 0x360], 0
14589edf9	xor	eax, eax
14589edfb	lea	r14, [rbp + 0x240]
14589ee02	lea	r12, [rbp + 0x1c0]
14589ee09	mov	r15d, 0x69757165
14589ee0f	lea	rdi, [rbp - 0x18]
14589ee13	xorps	xmm6, xmm6
14589ee16	test	al, 1
14589ee18	je	0x14589f64f
14589ee1e	mov	qword ptr [rbp + 0x240], 0
14589ee29	mov	rax, qword ptr [rbp + 0x378]
14589ee30	mov	qword ptr [rbp + 0x248], rax
14589ee37	mov	rcx, qword ptr [rbp + 0x370]
14589ee3e	mov	qword ptr [rbp + 0x250], rcx
14589ee45	mov	qword ptr [rbp + 0x258], rax
14589ee4c	mov	qword ptr [rbp + 0x260], 0
14589ee57	mov	qword ptr [rbp + 0x268], rax
14589ee5e	movabs	rax, 0xa0000000a
14589ee68	mov	qword ptr [rbp + 0x270], rax
14589ee6f	mov	byte ptr [rbp + 0x278], 1
14589ee76	mov	word ptr [rbp + 0x280], 0
14589ee7f	lea	rcx, [rbp + 0x98]
14589ee86	lea	rdx, [rbp + 0x240]
14589ee8d	call	0x1459bf610
14589ee92	nop
14589ee93	mov	qword ptr [rbp + 0x158], 0
14589ee9e	mov	qword ptr [rbp + 0x160], 8
14589eea9	mov	qword ptr [rbp + 0x168], 0
14589eeb4	mov	qword ptr [rbp + 0x1c0], 0
14589eebf	mov	rax, qword ptr [rbp + 0x378]
14589eec6	mov	qword ptr [rbp + 0x1c8], rax
14589eecd	lea	rbx, [rbp + 0x1d0]
14589eed4	mov	rcx, qword ptr [rbp + 0x370]
14589eedb	mov	qword ptr [rbp + 0x1d0], rcx
14589eee2	mov	qword ptr [rbp + 0x1d8], rax
14589eee9	mov	qword ptr [rbp + 0x1e0], 0
14589eef4	mov	qword ptr [rbp + 0x1e8], rax
14589eefb	movabs	rax, 0xa0000000a
14589ef05	mov	qword ptr [rbp + 0x1f0], rax
14589ef0c	mov	byte ptr [rbp + 0x1f8], 1
14589ef13	mov	word ptr [rbp + 0x200], 0
14589ef1c	lea	r14, [rbp + 0x348]
14589ef23	xor	eax, eax
14589ef25	lea	r15, [rbp + 0x240]
14589ef2c	lea	r12, [rbp + 0x220]
14589ef33	xorps	xmm6, xmm6
14589ef36	mov	r13b, 0xa
14589ef39	jmp	0x14589ef69
14589ef3b	nop	dword ptr [rax + rax]
14589ef40	mov	rdx, qword ptr [rbp + 0x220]
14589ef47	test	rdx, rdx
14589ef4a	je	0x14589ef62
14589ef4c	shl	rdx, 4
14589ef50	mov	r8d, 8
14589ef56	mov	rcx, qword ptr [rbp + 0x3a8]
14589ef5d	call	0x1400021d0
14589ef62	movzx	eax, byte ptr [rbp + 0x201]
14589ef69	test	al, 1
14589ef6b	jne	0x14589fc7b
14589ef71	mov	rsi, qword ptr [rbp + 0x1d0]
14589ef78	mov	rcx, r15
14589ef7b	mov	rdx, rbx
14589ef7e	call	0x1458aabb0
14589ef83	nop
14589ef84	cmp	dword ptr [rbp + 0x240], 1
14589ef8b	jne	0x14589efb0
14589ef8d	mov	rdx, qword ptr [rbp + 0x250]
14589ef94	mov	rax, qword ptr [rbp + 0x1c0]
14589ef9b	mov	qword ptr [rbp + 0x1c0], rdx
14589efa2	sub	rdx, rax
14589efa5	add	rsi, rax
14589efa8	test	rdx, rdx
14589efab	jne	0x14589eff2
14589efad	jmp	0x14589f020
14589efaf	nop
14589efb0	cmp	byte ptr [rbp + 0x201], 0
14589efb7	jne	0x14589fc7b
14589efbd	mov	byte ptr [rbp + 0x201], 1
14589efc4	mov	rsi, qword ptr [rbp + 0x1c0]
14589efcb	mov	rdx, qword ptr [rbp + 0x1c8]
14589efd2	sub	rdx, rsi
14589efd5	setne	al
14589efd8	or	al, byte ptr [rbp + 0x200]
14589efde	cmp	al, 1
14589efe0	jne	0x14589fc7b
14589efe6	add	rsi, qword ptr [rbp + 0x1d0]
14589efed	test	rdx, rdx
14589eff0	je	0x14589f020
14589eff2	cmp	byte ptr [rsi + rdx - 1], 0xa
14589eff7	jne	0x14589f020
14589eff9	mov	rax, rdx
14589effc	dec	rax
14589efff	je	0x14589f00e
14589f001	cmp	byte ptr [rsi + rdx - 2], 0xd
14589f006	jne	0x14589f012
14589f008	add	rdx, -2
14589f00c	jmp	0x14589f020
14589f00e	xor	edx, edx
14589f010	jmp	0x14589f020
14589f012	mov	rdx, rax
14589f015	nop	word ptr cs:[rax + rax]
14589f020	mov	rcx, rsi
14589f023	call	0x140089200
14589f028	nop
14589f029	mov	qword ptr [rbp + 0x240], 0
14589f034	mov	qword ptr [rbp + 0x248], rdx
14589f03b	mov	qword ptr [rbp + 0x250], rax
14589f042	mov	qword ptr [rbp + 0x258], rdx
14589f049	mov	qword ptr [rbp + 0x260], 0
14589f054	mov	qword ptr [rbp + 0x268], rdx
14589f05b	movabs	rax, 0x7c0000007c
14589f065	mov	qword ptr [rbp + 0x270], rax
14589f06c	mov	byte ptr [rbp + 0x278], 1
14589f073	mov	word ptr [rbp + 0x280], 1
14589f07c	mov	rcx, r12
14589f07f	mov	rdx, r15
14589f082	call	0x1459bd2c0
14589f087	nop
14589f088	mov	rax, qword ptr [rbp + 0x228]
14589f08f	mov	qword ptr [rbp + 0x3a8], rax
14589f096	mov	rdi, qword ptr [rbp + 0x230]
14589f09d	cmp	rdi, 2
14589f0a1	jbe	0x14589ef40
14589f0a7	mov	rax, qword ptr [rbp + 0x3a8]
14589f0ae	cmp	qword ptr [rax + 8], 4
14589f0b3	jne	0x14589ef40
14589f0b9	mov	rax, qword ptr [rbp + 0x3a8]
14589f0c0	mov	rax, qword ptr [rax]
14589f0c3	cmp	dword ptr [rax], 0x63657073
14589f0c9	jne	0x14589ef40
14589f0cf	mov	rax, qword ptr [rbp + 0x3a8]
14589f0d6	mov	r8, qword ptr [rax + 0x18]
14589f0da	test	r8, r8
14589f0dd	je	0x14589f105
14589f0df	mov	rdx, qword ptr [rax + 0x10]
14589f0e3	cmp	r8, 1
14589f0e7	jne	0x14589f10e
14589f0e9	movzx	eax, byte ptr [rdx]
14589f0ec	mov	sil, 1
14589f0ef	mov	cl, 1
14589f0f1	cmp	eax, 0x2b
14589f0f4	je	0x14589f19f
14589f0fa	cmp	eax, 0x2d
14589f0fd	je	0x14589f19f
14589f103	jmp	0x14589f111
14589f105	xor	esi, esi
14589f107	mov	cl, 1
14589f109	jmp	0x14589f19f
14589f10e	movzx	eax, byte ptr [rdx]
14589f111	xor	ecx, ecx
14589f113	cmp	al, 0x2b
14589f115	sete	cl
14589f118	mov	r9, r8
14589f11b	sub	r9, rcx
14589f11e	add	rdx, rcx
14589f121	cmp	r9, 3
14589f125	jae	0x14589f14c
14589f127	test	r9, r9
14589f12a	je	0x14589f19b
14589f12c	movzx	eax, byte ptr [rdx]
14589f12f	add	eax, -0x30
14589f132	mov	sil, 1
14589f135	mov	cl, 1
14589f137	cmp	eax, 9
14589f13a	ja	0x14589f19f
14589f13c	cmp	r9, 1
14589f140	jne	0x14589f33d
14589f146	xor	ecx, ecx
14589f148	mov	esi, eax
14589f14a	jmp	0x14589f19f
14589f14c	neg	rcx
14589f14f	add	r8, rcx
14589f152	neg	r8
14589f155	xor	r9d, r9d
14589f158	xor	esi, esi
14589f15a	nop	word ptr [rax + rax]
14589f160	mov	rax, r8
14589f163	add	rax, r9
14589f166	setne	cl
14589f169	je	0x14589f19f
14589f16b	mov	eax, esi
14589f16d	mul	r13b
14589f170	movzx	r10d, byte ptr [rdx + r9]
14589f175	jo	0x14589f627
14589f17b	mov	esi, eax
14589f17d	movzx	eax, r10b
14589f181	add	eax, -0x30
14589f184	cmp	eax, 0xa
14589f187	jae	0x14589f196
14589f189	inc	r9
14589f18c	add	sil, al
14589f18f	jae	0x14589f160
14589f191	mov	sil, 2
14589f194	jmp	0x14589f19f
14589f196	mov	sil, 1
14589f199	jmp	0x14589f19f
14589f19b	xor	esi, esi
14589f19d	xor	ecx, ecx
14589f19f	mov	rax, qword ptr [rbp + 0x3a8]
14589f1a6	mov	r8, qword ptr [rax + 0x28]
14589f1aa	test	r8, r8
14589f1ad	je	0x14589ef40
14589f1b3	mov	rax, qword ptr [rbp + 0x3a8]
14589f1ba	mov	rdx, qword ptr [rax + 0x20]
14589f1be	cmp	r8, 1
14589f1c2	jne	0x14589f1db
14589f1c4	movzx	eax, byte ptr [rdx]
14589f1c7	cmp	eax, 0x2b
14589f1ca	je	0x14589ef40
14589f1d0	cmp	eax, 0x2d
14589f1d3	je	0x14589ef40
14589f1d9	jmp	0x14589f1de
14589f1db	movzx	eax, byte ptr [rdx]
14589f1de	xor	r9d, r9d
14589f1e1	cmp	al, 0x2b
14589f1e3	sete	r9b
14589f1e7	mov	rax, r8
14589f1ea	sub	rax, r9
14589f1ed	add	rdx, r9
14589f1f0	cmp	rax, 3
14589f1f4	jae	0x14589f250
14589f1f6	test	rax, rax
14589f1f9	je	0x14589f29b
14589f1ff	movzx	r11d, byte ptr [rdx]
14589f203	add	r11d, -0x30
14589f207	cmp	r11d, 9
14589f20b	ja	0x14589ef40
14589f211	cmp	rax, 1
14589f215	je	0x14589f235
14589f217	movzx	eax, byte ptr [rdx + 1]
14589f21b	add	eax, -0x30
14589f21e	cmp	eax, 9
14589f221	ja	0x14589ef40
14589f227	movzx	edx, r11b
14589f22b	add	edx, edx
14589f22d	lea	edx, [rdx + rdx*4]
14589f230	add	al, dl
14589f232	mov	r11d, eax
14589f235	test	cl, cl
14589f237	jne	0x14589ef40
14589f23d	mov	byte ptr [rbp + 0xb0], sil
14589f244	cmp	r11b, 2
14589f248	ja	0x14589ef40
14589f24e	jmp	0x14589f2ad
14589f250	neg	r9
14589f253	add	r8, r9
14589f256	neg	r8
14589f259	xor	r9d, r9d
14589f25c	xor	r11d, r11d
14589f25f	mov	rax, r8
14589f262	add	rax, r9
14589f265	je	0x14589f235
14589f267	mov	eax, r11d
14589f26a	mul	r13b
14589f26d	jo	0x14589ef40
14589f273	mov	r11d, eax
14589f276	movzx	r10d, byte ptr [rdx + r9]
14589f27b	add	r10d, -0x30
14589f27f	add	r11b, r10b
14589f282	setb	al
14589f285	cmp	r10d, 9
14589f289	ja	0x14589ef40
14589f28f	inc	r9
14589f292	test	al, al
14589f294	je	0x14589f25f
14589f296	jmp	0x14589ef40
14589f29b	test	cl, cl
14589f29d	jne	0x14589ef40
14589f2a3	mov	byte ptr [rbp + 0xb0], sil
14589f2aa	xor	r11d, r11d
14589f2ad	mov	rax, qword ptr [rbp + 0xa0]
14589f2b4	mov	rcx, qword ptr [rbp + 0xa8]
14589f2bb	shl	rcx, 5
14589f2bf	xor	edx, edx
14589f2c1	nop	word ptr cs:[rax + rax]
14589f2d0	cmp	rcx, rdx
14589f2d3	je	0x14589f365
14589f2d9	lea	r8, [rdx + 0x20]
14589f2dd	cmp	byte ptr [rax + rdx + 4], sil
14589f2e2	mov	rdx, r8
14589f2e5	jne	0x14589f2d0
14589f2e7	mov	eax, dword ptr [rax + r8 - 0x20]
14589f2ec	mov	dword ptr [rbp + 0x398], 0
14589f2f6	mov	ecx, 0x6e
14589f2fb	nop	dword ptr [rax + rax]
14589f300	lea	edx, [rcx - 0x1e]
14589f303	sub	eax, edx
14589f305	jb	0x14589f36f
14589f307	lea	edx, [rcx - 0xf]
14589f30a	sub	eax, edx
14589f30c	jb	0x14589f610
14589f312	sub	eax, ecx
14589f314	jb	0x14589f61b
14589f31a	mov	edx, dword ptr [rbp + 0x398]
14589f320	add	edx, 3
14589f323	add	ecx, 0x2d
14589f326	mov	dword ptr [rbp + 0x398], edx
14589f32c	cmp	edx, 0x33
14589f32f	jne	0x14589f300
14589f331	mov	dword ptr [rbp + 0x398], 0x33
14589f33b	jmp	0x14589f36f
14589f33d	movzx	edx, byte ptr [rdx + 1]
14589f341	add	edx, -0x30
14589f344	mov	sil, 1
14589f347	mov	cl, 1
14589f349	cmp	edx, 9
14589f34c	ja	0x14589f19f
14589f352	movzx	eax, al
14589f355	add	eax, eax
14589f357	lea	eax, [rax + rax*4]
14589f35a	add	dl, al
14589f35c	xor	ecx, ecx
14589f35e	mov	esi, edx
14589f360	jmp	0x14589f19f
14589f365	mov	dword ptr [rbp + 0x398], 0
14589f36f	mov	qword ptr [rbp + 0x320], 0
14589f37a	mov	qword ptr [rbp + 0x328], 8
14589f385	lea	rax, [rbp + 0x330]
14589f38c	movups	xmmword ptr [rax], xmm6
14589f38f	mov	qword ptr [rbp + 0x340], 8
14589f39a	movups	xmmword ptr [r14], xmm6
14589f39e	mov	qword ptr [rbp + 0x358], 8
14589f3a9	mov	qword ptr [rbp + 0x360], 0
14589f3b4	mov	rax, qword ptr [rbp + 0x3a8]
14589f3bb	lea	rbx, [rax + 0x30]
14589f3bf	shl	rdi, 4
14589f3c3	add	rdi, rax
14589f3c6	mov	r14d, 3
14589f3cc	xor	r12d, r12d
14589f3cf	mov	dword ptr [rbp + 0x388], r11d
14589f3d6	jmp	0x14589f3fe
14589f3d8	nop	dword ptr [rax + rax]
14589f3e0	add	rbx, 0x10
14589f3e4	inc	r12
14589f3e7	mov	rax, qword ptr [rbp + 0x250]
14589f3ee	mov	qword ptr [r13 + 0x10], rax
14589f3f2	movups	xmm0, xmmword ptr [rbp + 0x240]
14589f3f9	movups	xmmword ptr [r13], xmm0
14589f3fe	sub	r14, 1
14589f402	jb	0x14589f500
14589f408	cmp	rbx, rdi
14589f40b	je	0x14589f500
14589f411	mov	rax, qword ptr [rbx]
14589f414	mov	rcx, qword ptr [rbx + 8]
14589f418	mov	byte ptr [rbp + 0x120], sil
14589f41f	lea	rdx, [rbp + 0x120]
14589f426	mov	qword ptr [rbp + 0x240], rdx
14589f42d	mov	qword ptr [rbp + 0x248], 0
14589f438	mov	qword ptr [rbp + 0x250], rcx
14589f43f	mov	qword ptr [rbp + 0x258], rax
14589f446	mov	qword ptr [rbp + 0x260], rcx
14589f44d	mov	qword ptr [rbp + 0x268], 0
14589f458	mov	qword ptr [rbp + 0x270], rcx
14589f45f	movabs	rax, 0x2c0000002c
14589f469	mov	qword ptr [rbp + 0x278], rax
14589f470	mov	byte ptr [rbp + 0x280], 1
14589f477	mov	word ptr [rbp + 0x288], 1
14589f480	mov	byte ptr [rbp + 0x3a6], 1
14589f487	lea	r13, [rbp + 0xe0]
14589f48e	mov	rcx, r13
14589f491	lea	r15, [rbp + 0x240]
14589f498	mov	rdx, r15
14589f49b	call	0x1459bde30
14589f4a0	nop
14589f4a1	mov	byte ptr [rbp + 0x3a6], 1
14589f4a8	mov	rcx, r15
14589f4ab	mov	rdx, r13
14589f4ae	mov	r8d, esi
14589f4b1	mov	r9d, dword ptr [rbp + 0x398]
14589f4b8	call	0x1459106e0
14589f4bd	nop
14589f4be	cmp	r12, 2
14589f4c2	ja	0x1458a27e7
14589f4c8	lea	rax, [r12 + r12*2]
14589f4cc	lea	r13, [rax*8 + 0x320]
14589f4d4	add	r13, rbp
14589f4d7	mov	rdx, qword ptr [rbp + rax*8 + 0x320]
14589f4df	test	rdx, rdx
14589f4e2	je	0x14589f3e0
14589f4e8	mov	rcx, qword ptr [r13 + 8]
14589f4ec	shl	rdx, 4
14589f4f0	mov	r8d, 8
14589f4f6	call	0x1400021d0
14589f4fb	jmp	0x14589f3e0
14589f500	mov	byte ptr [rbp + 0x3a6], 1
14589f507	lea	rcx, [rbp + 0x158]
14589f50e	lea	rdx, [rbp + 0xb0]
14589f515	call	0x1459b5df0
14589f51a	nop
14589f51b	mov	rax, qword ptr [rbp + 0x360]
14589f522	lea	rcx, [rbp + 0x248]
14589f529	mov	qword ptr [rcx + 0x40], rax
14589f52d	movups	xmm0, xmmword ptr [rbp + 0x320]
14589f534	movups	xmm1, xmmword ptr [rbp + 0x330]
14589f53b	movups	xmm2, xmmword ptr [rbp + 0x340]
14589f542	movups	xmm3, xmmword ptr [rbp + 0x350]
14589f549	movups	xmmword ptr [rcx + 0x30], xmm3
14589f54d	movups	xmmword ptr [rcx + 0x20], xmm2
14589f551	movups	xmmword ptr [rcx + 0x10], xmm1
14589f555	movups	xmmword ptr [rcx], xmm0
14589f558	mov	byte ptr [rbp + 0x240], sil
14589f55f	mov	eax, dword ptr [rbp + 0x388]
14589f565	mov	byte ptr [rbp + 0x241], al
14589f56b	mov	rsi, qword ptr [rbp + 0x168]
14589f572	cmp	rsi, qword ptr [rbp + 0x158]
14589f579	jne	0x14589f588
14589f57b	lea	rcx, [rbp + 0x158]
14589f582	call	0x145c26910
14589f587	nop
14589f588	mov	rax, qword ptr [rbp + 0x160]
14589f58f	lea	rcx, [rsi + rsi*4]
14589f593	shl	rcx, 4
14589f597	movups	xmm0, xmmword ptr [rbp + 0x280]
14589f59e	movups	xmmword ptr [rax + rcx + 0x40], xmm0
14589f5a3	movups	xmm0, xmmword ptr [rbp + 0x240]
14589f5aa	movups	xmm1, xmmword ptr [rbp + 0x250]
14589f5b1	movups	xmm2, xmmword ptr [rbp + 0x260]
14589f5b8	movups	xmm3, xmmword ptr [rbp + 0x270]
14589f5bf	movups	xmmword ptr [rax + rcx + 0x30], xmm3
14589f5c4	movups	xmmword ptr [rax + rcx + 0x20], xmm2
14589f5c9	movups	xmmword ptr [rax + rcx + 0x10], xmm1
14589f5ce	movups	xmmword ptr [rax + rcx], xmm0
14589f5d2	inc	rsi
14589f5d5	mov	qword ptr [rbp + 0x168], rsi
14589f5dc	mov	rdx, qword ptr [rbp + 0x220]
14589f5e3	test	rdx, rdx
14589f5e6	lea	rbx, [rbp + 0x1d0]
14589f5ed	lea	r14, [rbp + 0x348]
14589f5f4	lea	r15, [rbp + 0x240]
14589f5fb	lea	r12, [rbp + 0x220]
14589f602	mov	r13b, 0xa
14589f605	jne	0x14589ef4c
14589f60b	jmp	0x14589ef62
14589f610	inc	dword ptr [rbp + 0x398]
14589f616	jmp	0x14589f36f
14589f61b	add	dword ptr [rbp + 0x398], 2
14589f622	jmp	0x14589f36f
14589f627	add	r10b, 0xd0
14589f62b	cmp	r10b, 0xa
14589f62f	mov	esi, 0
14589f634	adc	sil, 1
14589f638	mov	cl, 1
14589f63a	jmp	0x14589f19f
14589f63f	nop
14589f640	movzx	eax, byte ptr [rbp + 0x361]
14589f647	test	al, 1
14589f649	jne	0x14589ee1e
14589f64f	mov	rsi, qword ptr [rbp + 0x330]
14589f656	mov	rcx, r14
14589f659	lea	rdx, [rbp + 0x330]
14589f660	call	0x1458aabb0
14589f665	nop
14589f666	cmp	dword ptr [rbp + 0x240], 1
14589f66d	jne	0x14589f6a0
14589f66f	mov	rdx, qword ptr [rbp + 0x250]
14589f676	mov	rax, qword ptr [rbp + 0x320]
14589f67d	mov	qword ptr [rbp + 0x320], rdx
14589f684	sub	rdx, rax
14589f687	add	rsi, rax
14589f68a	test	rdx, rdx
14589f68d	jne	0x14589f6e2
14589f68f	jmp	0x14589f710
14589f691	nop	word ptr cs:[rax + rax]
14589f6a0	cmp	byte ptr [rbp + 0x361], 0
14589f6a7	jne	0x14589ee1e
14589f6ad	mov	byte ptr [rbp + 0x361], 1
14589f6b4	mov	rsi, qword ptr [rbp + 0x320]
14589f6bb	mov	rdx, qword ptr [rbp + 0x328]
14589f6c2	sub	rdx, rsi
14589f6c5	setne	al
14589f6c8	or	al, byte ptr [rbp + 0x360]
14589f6ce	cmp	al, 1
14589f6d0	jne	0x14589ee1e
14589f6d6	add	rsi, qword ptr [rbp + 0x330]
14589f6dd	test	rdx, rdx
14589f6e0	je	0x14589f710
14589f6e2	cmp	byte ptr [rsi + rdx - 1], 0xa
14589f6e7	jne	0x14589f710
14589f6e9	mov	rax, rdx
14589f6ec	dec	rax
14589f6ef	je	0x14589f6fe
14589f6f1	cmp	byte ptr [rsi + rdx - 2], 0xd
14589f6f6	jne	0x14589f702
14589f6f8	add	rdx, -2
14589f6fc	jmp	0x14589f710
14589f6fe	xor	edx, edx
14589f700	jmp	0x14589f710
14589f702	mov	rdx, rax
14589f705	nop	word ptr cs:[rax + rax]
14589f710	mov	rcx, rsi
14589f713	call	0x140089200
14589f718	nop
14589f719	mov	qword ptr [rbp + 0x240], 0
14589f724	mov	qword ptr [rbp + 0x248], rdx
14589f72b	mov	qword ptr [rbp + 0x250], rax
14589f732	mov	qword ptr [rbp + 0x258], rdx
14589f739	mov	qword ptr [rbp + 0x260], 0
14589f744	mov	qword ptr [rbp + 0x268], rdx
14589f74b	movabs	rax, 0x7c0000007c
14589f755	mov	qword ptr [rbp + 0x270], rax
14589f75c	mov	byte ptr [rbp + 0x278], 1
14589f763	mov	word ptr [rbp + 0x280], 1
14589f76c	mov	rcx, r12
14589f76f	mov	rdx, r14
14589f772	call	0x1459bd2c0
14589f777	nop
14589f778	mov	r11, qword ptr [rbp + 0x1c8]
14589f77f	cmp	qword ptr [rbp + 0x1d0], 3
14589f787	jne	0x14589f880
14589f78d	mov	r13, qword ptr [r11 + 8]
14589f791	cmp	r13, 5
14589f795	jne	0x14589f7b0
14589f797	mov	rbx, qword ptr [r11]
14589f79a	mov	eax, dword ptr [rbx]
14589f79c	xor	eax, r15d
14589f79f	movzx	ecx, byte ptr [rbx + 4]
14589f7a3	xor	ecx, 0x70
14589f7a6	or	ecx, eax
14589f7a8	jne	0x14589f880
14589f7ae	jmp	0x14589f7c9
14589f7b0	cmp	r13, 4
14589f7b4	jne	0x14589f880
14589f7ba	mov	rbx, qword ptr [r11]
14589f7bd	cmp	dword ptr [rbx], 0x6b6f6f6c
14589f7c3	jne	0x14589f880
14589f7c9	mov	rdx, qword ptr [r11 + 0x18]
14589f7cd	test	rdx, rdx
14589f7d0	je	0x14589f880
14589f7d6	mov	rcx, qword ptr [r11 + 0x10]
14589f7da	cmp	rdx, 1
14589f7de	jne	0x14589f7fa
14589f7e0	movzx	r8d, byte ptr [rcx]
14589f7e4	cmp	r8d, 0x2b
14589f7e8	je	0x14589f880
14589f7ee	cmp	r8d, 0x2d
14589f7f2	je	0x14589f880
14589f7f8	jmp	0x14589f7fe
14589f7fa	movzx	r8d, byte ptr [rcx]
14589f7fe	xor	eax, eax
14589f800	cmp	r8b, 0x2b
14589f804	sete	al
14589f807	mov	r8, rdx
14589f80a	sub	r8, rax
14589f80d	add	rcx, rax
14589f810	cmp	r8, 3
14589f814	jae	0x14589f83f
14589f816	test	r8, r8
14589f819	je	0x14589f8b6
14589f81f	movzx	eax, byte ptr [rcx]
14589f822	add	eax, -0x30
14589f825	cmp	eax, 9
14589f828	ja	0x14589f880
14589f82a	cmp	r8, 1
14589f82e	jne	0x14589fc56
14589f834	mov	dword ptr [rbp + 0x398], eax
14589f83a	jmp	0x14589f8c0
14589f83f	neg	rax
14589f842	add	rdx, rax
14589f845	neg	rdx
14589f848	xor	r8d, r8d
14589f84b	xor	eax, eax
14589f84d	mov	r9, rdx
14589f850	add	r9, r8
14589f853	je	0x14589f834
14589f855	mov	r9b, 0xa
14589f858	mul	r9b
14589f85b	jo	0x14589f880
14589f85d	movzx	r10d, byte ptr [rcx + r8]
14589f862	add	r10d, -0x30
14589f866	add	al, r10b
14589f869	setb	r9b
14589f86d	cmp	r10d, 9
14589f871	ja	0x14589f880
14589f873	inc	r8
14589f876	test	r9b, r9b
14589f879	je	0x14589f84d
14589f87b	nop	dword ptr [rax + rax]
14589f880	mov	rdx, qword ptr [rbp + 0x1c0]
14589f887	test	rdx, rdx
14589f88a	je	0x14589f640
14589f890	shl	rdx, 4
14589f894	mov	r8d, 8
14589f89a	mov	rcx, r11
14589f89d	call	0x1400021d0
14589f8a2	movzx	eax, byte ptr [rbp + 0x361]
14589f8a9	test	al, 1
14589f8ab	je	0x14589f64f
14589f8b1	jmp	0x14589ee1e
14589f8b6	mov	dword ptr [rbp + 0x398], 0
14589f8c0	mov	rax, qword ptr [r11 + 0x20]
14589f8c4	mov	qword ptr [rbp + 0x380], r11
14589f8cb	mov	rcx, qword ptr [r11 + 0x28]
14589f8cf	mov	qword ptr [rbp + 0x240], 0
14589f8da	mov	qword ptr [rbp + 0x248], rcx
14589f8e1	mov	qword ptr [rbp + 0x250], rax
14589f8e8	mov	qword ptr [rbp + 0x258], rcx
14589f8ef	mov	qword ptr [rbp + 0x260], 0
14589f8fa	mov	qword ptr [rbp + 0x268], rcx
14589f901	movabs	rax, 0x2c0000002c
14589f90b	mov	qword ptr [rbp + 0x270], rax
14589f912	mov	byte ptr [rbp + 0x278], 1
14589f919	mov	word ptr [rbp + 0x280], 1
14589f922	mov	rcx, rdi
14589f925	mov	rdx, r14
14589f928	call	0x1459c01c0
14589f92d	nop
14589f92e	mov	rax, qword ptr [rbp - 0x18]
14589f932	mov	qword ptr [rbp + 0x388], rax
14589f939	mov	rax, qword ptr [rbp - 0x10]
14589f93d	mov	qword ptr [rbp + 0x3a8], rax
14589f944	mov	rdi, qword ptr [rbp - 8]
14589f948	mov	rax, qword ptr [rbp + 0x1a8]
14589f94f	mov	rsi, qword ptr [rbp + 0x1b0]
14589f956	imul	r15, rsi, 0xe8
14589f95d	test	rsi, rsi
14589f960	mov	ecx, dword ptr [rbp + 0x398]
14589f966	je	0x14589f98d
14589f968	xor	r8d, r8d
14589f96b	xor	edx, edx
14589f96d	nop	dword ptr [rax]
14589f970	cmp	byte ptr [rax + r8 + 0xe4], cl
14589f978	je	0x14589faf7
14589f97e	inc	rdx
14589f981	add	r8, 0xe8
14589f988	cmp	r15, r8
14589f98b	jne	0x14589f970
14589f98d	lea	rdx, [rbp + 0x244]
14589f994	movups	xmmword ptr [rdx + 0x3c], xmm6
14589f998	movups	xmmword ptr [rdx + 0x30], xmm6
14589f99c	movups	xmmword ptr [rdx + 0x20], xmm6
14589f9a0	movups	xmmword ptr [rdx + 0x10], xmm6
14589f9a4	movups	xmmword ptr [rdx], xmm6
14589f9a7	cmp	rsi, qword ptr [rbp + 0x1a0]
14589f9ae	jne	0x14589f9d1
14589f9b0	mov	byte ptr [rbp + 0x397], 1
14589f9b7	lea	rcx, [rbp + 0x1a0]
14589f9be	call	0x145d7e320
14589f9c3	nop
14589f9c4	mov	rax, qword ptr [rbp + 0x1a8]
14589f9cb	mov	ecx, dword ptr [rbp + 0x398]
14589f9d1	mov	dword ptr [rax + r15], 0
14589f9d9	mov	dword ptr [rax + r15 + 8], 0
14589f9e2	mov	dword ptr [rax + r15 + 0x10], 0
14589f9eb	mov	dword ptr [rax + r15 + 0x18], 0
14589f9f4	mov	dword ptr [rax + r15 + 0x20], 0
14589f9fd	mov	dword ptr [rax + r15 + 0x28], 0
14589fa06	mov	dword ptr [rax + r15 + 0x30], 0
14589fa0f	mov	dword ptr [rax + r15 + 0x38], 0
14589fa18	mov	dword ptr [rax + r15 + 0x40], 0
14589fa21	mov	dword ptr [rax + r15 + 0x48], 0
14589fa2a	mov	dword ptr [rax + r15 + 0x50], 0
14589fa33	mov	dword ptr [rax + r15 + 0x58], 0
14589fa3c	mov	dword ptr [rax + r15 + 0x60], 0
14589fa45	mov	dword ptr [rax + r15 + 0x68], 0
14589fa4e	mov	dword ptr [rax + r15 + 0x70], 0
14589fa57	mov	dword ptr [rax + r15 + 0x78], 0
14589fa60	mov	dword ptr [rax + r15 + 0x80], 0
14589fa6c	mov	dword ptr [rax + r15 + 0x88], 0
14589fa78	mov	dword ptr [rax + r15 + 0x90], 0
14589fa84	movups	xmm0, xmmword ptr [rbp + 0x280]
14589fa8b	movups	xmmword ptr [rax + r15 + 0xd4], xmm0
14589fa94	movups	xmm0, xmmword ptr [rbp + 0x240]
14589fa9b	movups	xmm1, xmmword ptr [rbp + 0x250]
14589faa2	movups	xmm2, xmmword ptr [rbp + 0x260]
14589faa9	movups	xmm3, xmmword ptr [rbp + 0x270]
14589fab0	movups	xmmword ptr [rax + r15 + 0xc4], xmm3
14589fab9	movups	xmmword ptr [rax + r15 + 0xb4], xmm2
14589fac2	movups	xmmword ptr [rax + r15 + 0xa4], xmm1
14589facb	movups	xmmword ptr [rax + r15 + 0x94], xmm0
14589fad4	mov	byte ptr [rax + r15 + 0xe4], cl
14589fadc	lea	rax, [rsi + 1]
14589fae0	mov	qword ptr [rbp + 0x1b0], rax
14589fae7	test	rdi, rdi
14589faea	mov	r15d, 0x69757165
14589faf0	jne	0x14589fb09
14589faf2	jmp	0x14589fc14
14589faf7	mov	rsi, rdx
14589fafa	test	rdi, rdi
14589fafd	mov	r15d, 0x69757165
14589fb03	je	0x14589fc14
14589fb09	shl	rdi, 4
14589fb0d	mov	rax, qword ptr [rbp + 0x3a8]
14589fb14	add	rdi, rax
14589fb17	cmp	r13, 5
14589fb1b	jne	0x14589fbd0
14589fb21	mov	rax, qword ptr [rbp + 0x3a8]
14589fb28	nop	dword ptr [rax + rax]
14589fb30	mov	rcx, qword ptr [rax]
14589fb33	mov	r8d, dword ptr [rax + 8]
14589fb37	mov	edx, dword ptr [rbx]
14589fb39	xor	edx, r15d
14589fb3c	movzx	r9d, byte ptr [rbx + 4]
14589fb41	xor	r9d, 0x70
14589fb45	or	r9d, edx
14589fb48	mov	rdx, qword ptr [rbp + 0x1b0]
14589fb4f	je	0x14589fb90
14589fb51	cmp	rsi, rdx
14589fb54	jae	0x1458a2788
14589fb5a	cmp	rcx, 0x12
14589fb5e	ja	0x1458a279d
14589fb64	imul	rdx, rsi, 0xe8
14589fb6b	add	rdx, qword ptr [rbp + 0x1a8]
14589fb72	mov	dword ptr [rdx + rcx*8], 1
14589fb79	mov	dword ptr [rdx + rcx*8 + 4], r8d
14589fb7e	add	rax, 0x10
14589fb82	cmp	rax, rdi
14589fb85	jne	0x14589fb30
14589fb87	jmp	0x14589fc14
14589fb8c	nop	dword ptr [rax]
14589fb90	cmp	rsi, rdx
14589fb93	jae	0x1458a2801
14589fb99	cmp	rcx, 0x12
14589fb9d	ja	0x1458a2816
14589fba3	imul	rdx, rsi, 0xe8
14589fbaa	add	rdx, qword ptr [rbp + 0x1a8]
14589fbb1	mov	dword ptr [rdx + rcx*4 + 0x98], r8d
14589fbb9	add	rax, 0x10
14589fbbd	cmp	rax, rdi
14589fbc0	jne	0x14589fb30
14589fbc6	jmp	0x14589fc14
14589fbc8	nop	dword ptr [rax + rax]
14589fbd0	mov	rdx, qword ptr [rbp + 0x1b0]
14589fbd7	cmp	rsi, rdx
14589fbda	jae	0x1458a2788
14589fbe0	mov	rcx, qword ptr [rax]
14589fbe3	cmp	rcx, 0x13
14589fbe7	jae	0x1458a279d
14589fbed	mov	edx, dword ptr [rax + 8]
14589fbf0	imul	r8, rsi, 0xe8
14589fbf7	add	r8, qword ptr [rbp + 0x1a8]
14589fbfe	mov	dword ptr [r8 + rcx*8], 1
14589fc06	mov	dword ptr [r8 + rcx*8 + 4], edx
14589fc0b	add	rax, 0x10
14589fc0f	cmp	rax, rdi
14589fc12	jne	0x14589fbd0
14589fc14	mov	rdx, qword ptr [rbp + 0x388]
14589fc1b	test	rdx, rdx
14589fc1e	je	0x14589fc36
14589fc20	shl	rdx, 4
14589fc24	mov	r8d, 8
14589fc2a	mov	rcx, qword ptr [rbp + 0x3a8]
14589fc31	call	0x1400021d0
14589fc36	mov	rdx, qword ptr [rbp + 0x1c0]
14589fc3d	test	rdx, rdx
14589fc40	lea	rdi, [rbp - 0x18]
14589fc44	mov	r11, qword ptr [rbp + 0x380]
14589fc4b	jne	0x14589f890
14589fc51	jmp	0x14589f640
14589fc56	movzx	ecx, byte ptr [rcx + 1]
14589fc5a	add	ecx, -0x30
14589fc5d	cmp	ecx, 9
14589fc60	ja	0x14589f880
14589fc66	movzx	eax, al
14589fc69	add	eax, eax
14589fc6b	lea	eax, [rax + rax*4]
14589fc6e	add	cl, al
14589fc70	mov	dword ptr [rbp + 0x398], ecx
14589fc76	jmp	0x14589f8c0
14589fc7b	mov	qword ptr [rbp + 0x188], 0
14589fc86	mov	qword ptr [rbp + 0x190], 8
14589fc91	mov	qword ptr [rbp + 0x198], 0
14589fc9c	mov	qword ptr [rbp + 0x240], 0
14589fca7	mov	rax, qword ptr [rbp + 0x378]
14589fcae	mov	qword ptr [rbp + 0x248], rax
14589fcb5	mov	rcx, qword ptr [rbp + 0x370]
14589fcbc	mov	qword ptr [rbp + 0x250], rcx
14589fcc3	mov	qword ptr [rbp + 0x258], rax
14589fcca	mov	qword ptr [rbp + 0x260], 0
14589fcd5	mov	qword ptr [rbp + 0x268], rax
14589fcdc	movabs	rax, 0xa0000000a
14589fce6	mov	qword ptr [rbp + 0x270], rax
14589fced	mov	byte ptr [rbp + 0x278], 1
14589fcf4	mov	word ptr [rbp + 0x280], 0
14589fcfd	xor	eax, eax
14589fcff	jmp	0x14589fd17
14589fd01	nop	word ptr cs:[rax + rax]
14589fd10	movzx	eax, byte ptr [rbp + 0x281]
14589fd17	test	al, 1
14589fd19	jne	0x1458a016c
14589fd1f	mov	rsi, qword ptr [rbp + 0x250]
14589fd26	lea	rcx, [rbp + 0x320]
14589fd2d	lea	rdx, [rbp + 0x250]
14589fd34	call	0x1458aabb0
14589fd39	nop
14589fd3a	cmp	dword ptr [rbp + 0x320], 1
14589fd41	jne	0x14589fd70
14589fd43	mov	rdx, qword ptr [rbp + 0x330]
14589fd4a	mov	rax, qword ptr [rbp + 0x240]
14589fd51	mov	qword ptr [rbp + 0x240], rdx
14589fd58	sub	rdx, rax
14589fd5b	add	rsi, rax
14589fd5e	test	rdx, rdx
14589fd61	jne	0x14589fdb2
14589fd63	jmp	0x14589fde0
14589fd65	nop	word ptr cs:[rax + rax]
14589fd70	cmp	byte ptr [rbp + 0x281], 0
14589fd77	jne	0x1458a016c
14589fd7d	mov	byte ptr [rbp + 0x281], 1
14589fd84	mov	rsi, qword ptr [rbp + 0x240]
14589fd8b	mov	rdx, qword ptr [rbp + 0x248]
14589fd92	sub	rdx, rsi
14589fd95	setne	al
14589fd98	or	al, byte ptr [rbp + 0x280]
14589fd9e	cmp	al, 1
14589fda0	jne	0x1458a016c
14589fda6	add	rsi, qword ptr [rbp + 0x250]
14589fdad	test	rdx, rdx
14589fdb0	je	0x14589fde0
14589fdb2	cmp	byte ptr [rsi + rdx - 1], 0xa
14589fdb7	jne	0x14589fde0
14589fdb9	mov	rax, rdx
14589fdbc	dec	rax
14589fdbf	je	0x14589fdce
14589fdc1	cmp	byte ptr [rsi + rdx - 2], 0xd
14589fdc6	jne	0x14589fdd2
14589fdc8	add	rdx, -2
14589fdcc	jmp	0x14589fde0
14589fdce	xor	edx, edx
14589fdd0	jmp	0x14589fde0
14589fdd2	mov	rdx, rax
14589fdd5	nop	word ptr cs:[rax + rax]
14589fde0	mov	rcx, rsi
14589fde3	call	0x140089200
14589fde8	nop
14589fde9	mov	r15, rdx
14589fdec	cmp	rdx, 5
14589fdf0	jb	0x14589fd10
14589fdf6	mov	ecx, dword ptr [rax]
14589fdf8	mov	edx, 0x6e656573
14589fdfd	xor	ecx, edx
14589fdff	movzx	edx, byte ptr [rax + 4]
14589fe03	xor	edx, 0x7c
14589fe06	or	edx, ecx
14589fe08	jne	0x14589fd10
14589fe0e	add	r15, -5
14589fe12	lea	rdi, [rax + 5]
14589fe16	add	rax, 6
14589fe1a	mov	qword ptr [rbp + 0x388], rax
14589fe21	mov	qword ptr [rbp + 0x3a8], 0
14589fe2c	xor	r12d, r12d
14589fe2f	xor	ebx, ebx
14589fe31	nop	word ptr cs:[rax + rax]
14589fe40	mov	qword ptr [rbp + 0x398], rbx
14589fe47	test	byte ptr [rbp + 0x3a8], 1
14589fe4e	jne	0x14589fd10
14589fe54	mov	al, 1
14589fe56	mov	qword ptr [rbp + 0x3a8], rax
14589fe5d	cmp	r15, r12
14589fe60	jae	0x14589fe7c
14589fe62	jmp	0x14589ff19
14589fe67	nop	word ptr [rax + rax]
14589fe70	mov	r12, rbx
14589fe73	cmp	r15, rbx
14589fe76	jb	0x14589ff16
14589fe7c	mov	r8, r15
14589fe7f	sub	r8, r12
14589fe82	lea	rdx, [rdi + r12]
14589fe86	cmp	r8, 0x10
14589fe8a	jae	0x14589fec0
14589fe8c	xor	r13d, r13d
14589fe8f	test	r8, r8
14589fe92	je	0x14589feb2
14589fe94	nop	word ptr cs:[rax + rax]
14589fea0	cmp	byte ptr [rdx + r13], 0x2c
14589fea5	je	0x14589fed3
14589fea7	inc	r13
14589feaa	cmp	r8, r13
14589fead	jne	0x14589fea0
14589feaf	mov	r13, r8
14589feb2	xor	eax, eax
14589feb4	cmp	rax, 1
14589feb8	je	0x14589fee0
14589feba	jmp	0x14589ff11
14589febc	nop	dword ptr [rax]
14589fec0	mov	cl, 0x2c
14589fec2	call	0x145bd5860
14589fec7	nop
14589fec8	mov	r13, rdx
14589fecb	cmp	rax, 1
14589fecf	je	0x14589fee0
14589fed1	jmp	0x14589ff11
14589fed3	mov	eax, 1
14589fed8	cmp	rax, 1
14589fedc	jne	0x14589ff11
14589fede	nop
14589fee0	lea	rbx, [r12 + r13]
14589fee4	inc	rbx
14589fee7	add	r13, r12
14589feea	cmp	r13, r15
14589feed	jae	0x14589fe70
14589feef	cmp	byte ptr [rdi + r13], 0x2c
14589fef4	jne	0x14589fe70
14589fefa	mov	qword ptr [rbp + 0x3a8], 0
14589ff05	mov	r12, rbx
14589ff08	mov	rax, qword ptr [rbp + 0x398]
14589ff0f	jmp	0x14589ff26
14589ff11	mov	r12, r15
14589ff14	jmp	0x14589ff19
14589ff16	mov	r12, rbx
14589ff19	mov	rax, qword ptr [rbp + 0x398]
14589ff20	mov	rbx, rax
14589ff23	mov	r13, r15
14589ff26	sub	r13, rax
14589ff29	lea	rsi, [rdi + rax]
14589ff2d	xor	r14d, r14d
14589ff30	jmp	0x14589ff4c
14589ff32	nop	word ptr cs:[rax + rax]
14589ff40	mov	r14, rcx
14589ff43	cmp	r13, rcx
14589ff46	jb	0x14589fe40
14589ff4c	mov	r8, r13
14589ff4f	sub	r8, r14
14589ff52	lea	rax, [rsi + r14]
14589ff56	cmp	r8, 0x10
14589ff5a	jae	0x14589ff90
14589ff5c	xor	edx, edx
14589ff5e	test	r8, r8
14589ff61	je	0x14589ff81
14589ff63	nop	word ptr cs:[rax + rax]
14589ff70	cmp	byte ptr [rax + rdx], 0x3d
14589ff74	je	0x14589ffbe
14589ff76	inc	rdx
14589ff79	cmp	r8, rdx
14589ff7c	jne	0x14589ff70
14589ff7e	mov	rdx, r8
14589ff81	xor	eax, eax
14589ff83	cmp	rax, 1
14589ff87	je	0x14589ffa5
14589ff89	jmp	0x14589fe40
14589ff8e	nop
14589ff90	mov	cl, 0x3d
14589ff92	mov	rdx, rax
14589ff95	call	0x145bd5860
14589ff9a	nop
14589ff9b	cmp	rax, 1
14589ff9f	jne	0x14589fe40
14589ffa5	lea	rcx, [rdx + r14]
14589ffa9	inc	rcx
14589ffac	lea	r11, [rdx + r14]
14589ffb0	cmp	r11, r13
14589ffb3	jae	0x14589ff40
14589ffb5	cmp	byte ptr [rsi + r11], 0x3d
14589ffba	jne	0x14589ff40
14589ffbc	jmp	0x14589ffce
14589ffbe	mov	eax, 1
14589ffc3	cmp	rax, 1
14589ffc7	je	0x14589ffa5
14589ffc9	jmp	0x14589fe40
14589ffce	mov	r8, r13
14589ffd1	sub	r8, rcx
14589ffd4	je	0x14589fe40
14589ffda	add	rcx, rsi
14589ffdd	cmp	r8, 1
14589ffe1	jne	0x14589fffa
14589ffe3	movzx	eax, byte ptr [rcx]
14589ffe6	cmp	eax, 0x2b
14589ffe9	je	0x14589fe40
14589ffef	cmp	eax, 0x2d
14589fff2	je	0x14589fe40
14589fff8	jmp	0x14589fffd
14589fffa	movzx	eax, byte ptr [rcx]
14589fffd	xor	r9d, r9d
1458a0000	cmp	al, 0x2b
1458a0002	sete	r9b
1458a0006	sub	r8, r9
1458a0009	cmp	r8, 3
1458a000d	jae	0x1458a004f
1458a000f	test	r8, r8
1458a0012	je	0x1458a00a7
1458a0018	movzx	eax, byte ptr [rcx + r9]
1458a001d	add	eax, -0x30
1458a0020	cmp	eax, 9
1458a0023	ja	0x14589fe40
1458a0029	cmp	r8, 1
1458a002d	je	0x1458a00a9
1458a002f	movzx	ecx, byte ptr [rcx + r9 + 1]
1458a0035	add	ecx, -0x30
1458a0038	cmp	ecx, 9
1458a003b	ja	0x14589fe40
1458a0041	movzx	eax, al
1458a0044	add	eax, eax
1458a0046	lea	eax, [rax + rax*4]
1458a0049	add	cl, al
1458a004b	mov	eax, ecx
1458a004d	jmp	0x1458a00a9
1458a004f	mov	r10, qword ptr [rbp + 0x398]
1458a0056	add	r10, r9
1458a0059	neg	r9
1458a005c	lea	rcx, [r9 + r13]
1458a0060	dec	rcx
1458a0063	add	rdx, r14
1458a0066	add	r10, qword ptr [rbp + 0x388]
1458a006d	xor	eax, eax
1458a006f	cmp	rcx, rdx
1458a0072	je	0x1458a00a9
1458a0074	mov	r8b, 0xa
1458a0077	mul	r8b
1458a007a	jo	0x14589fe40
1458a0080	movzx	r9d, byte ptr [r10 + rdx]
1458a0085	add	r9d, -0x30
1458a0089	add	al, r9b
1458a008c	setb	r8b
1458a0090	cmp	r9d, 9
1458a0094	ja	0x14589fe40
1458a009a	inc	rdx
1458a009d	test	r8b, r8b
1458a00a0	je	0x1458a006f
1458a00a2	jmp	0x14589fe40
1458a00a7	xor	eax, eax
1458a00a9	test	r11, r11
1458a00ac	je	0x14589fe40
1458a00b2	js	0x1458a0e53
1458a00b8	mov	dword ptr [rbp + 0x398], eax
1458a00be	mov	r14, r11
1458a00c1	call	0x140002200
1458a00c6	mov	r13d, 1
1458a00cc	mov	edx, 1
1458a00d1	mov	rcx, r14
1458a00d4	call	0x1400021c0
1458a00d9	test	rax, rax
1458a00dc	je	0x1458a282d
1458a00e2	mov	qword ptr [rbp + 0x380], rax
1458a00e9	mov	rcx, rax
1458a00ec	mov	rdx, rsi
1458a00ef	mov	qword ptr [rbp + 0x318], r14
1458a00f6	mov	r8, r14
1458a00f9	call	0x145bfa0e7
1458a00fe	movzx	esi, byte ptr [rbp + 0x398]
1458a0105	cmp	sil, 4
1458a0109	mov	eax, 4
1458a010e	cmovae	esi, eax
1458a0111	mov	r14, qword ptr [rbp + 0x198]
1458a0118	cmp	r14, qword ptr [rbp + 0x188]
1458a011f	jne	0x1458a012e
1458a0121	lea	rcx, [rbp + 0x188]
1458a0128	call	0x145bfae10
1458a012d	nop
1458a012e	mov	rax, qword ptr [rbp + 0x190]
1458a0135	mov	rcx, r14
1458a0138	shl	rcx, 5
1458a013c	mov	r8, qword ptr [rbp + 0x318]
1458a0143	mov	qword ptr [rax + rcx], r8
1458a0147	mov	rdx, qword ptr [rbp + 0x380]
1458a014e	mov	qword ptr [rax + rcx + 8], rdx
1458a0153	mov	qword ptr [rax + rcx + 0x10], r8
1458a0158	mov	byte ptr [rax + rcx + 0x18], sil
1458a015d	inc	r14
1458a0160	mov	qword ptr [rbp + 0x198], r14
1458a0167	jmp	0x14589fe40
1458a016c	mov	rsi, qword ptr [rbp + 0x198]
1458a0173	cmp	rsi, 2
1458a0177	jae	0x1458a2435
1458a017d	lea	rcx, [rbp + 0x188]
1458a0184	call	0x1459b5800
1458a0189	nop
1458a018a	mov	qword ptr [rbp + 0x240], 0
1458a0195	mov	rax, qword ptr [rbp + 0x378]
1458a019c	mov	qword ptr [rbp + 0x248], rax
1458a01a3	mov	rcx, qword ptr [rbp + 0x370]
1458a01aa	mov	qword ptr [rbp + 0x250], rcx
1458a01b1	mov	qword ptr [rbp + 0x258], rax
1458a01b8	mov	qword ptr [rbp + 0x260], 0
1458a01c3	mov	qword ptr [rbp + 0x268], rax
1458a01ca	movabs	rax, 0xa0000000a
1458a01d4	mov	qword ptr [rbp + 0x270], rax
1458a01db	mov	byte ptr [rbp + 0x278], 1
1458a01e2	mov	word ptr [rbp + 0x280], 0
1458a01eb	mov	dword ptr [rbp + 0x2bc], 0xffffffff
1458a01f5	mov	dword ptr [rbp + 0x304], 0xffffffff
1458a01ff	lea	rcx, [rbp + 0x40]
1458a0203	lea	rdx, [rbp + 0x240]
1458a020a	call	0x1459b9850
1458a020f	nop
1458a0210	mov	rdx, qword ptr [rbp + 0x50]
1458a0214	cmp	rdx, 2
1458a0218	jae	0x1458a2469
1458a021e	lea	rcx, [rbp + 0x40]
1458a0222	call	0x1459b4d20
1458a0227	nop
1458a0228	mov	qword ptr [rbp + 0x240], 0
1458a0233	mov	rax, qword ptr [rbp + 0x378]
1458a023a	mov	qword ptr [rbp + 0x248], rax
1458a0241	mov	rcx, qword ptr [rbp + 0x370]
1458a0248	mov	qword ptr [rbp + 0x250], rcx
1458a024f	mov	qword ptr [rbp + 0x258], rax
1458a0256	mov	qword ptr [rbp + 0x260], 0
1458a0261	mov	qword ptr [rbp + 0x268], rax
1458a0268	movabs	rax, 0xa0000000a
1458a0272	mov	qword ptr [rbp + 0x270], rax
1458a0279	mov	byte ptr [rbp + 0x278], 1
1458a0280	mov	word ptr [rbp + 0x280], 0
1458a0289	mov	dword ptr [rbp + 0x2bc], 0xffffffff
1458a0293	mov	dword ptr [rbp + 0x304], 0xffffffff
1458a029d	lea	rcx, [rbp + 0x28]
1458a02a1	lea	rdx, [rbp + 0x240]
1458a02a8	call	0x1459bdb90
1458a02ad	nop
1458a02ae	mov	rsi, qword ptr [rbp + 0x38]
1458a02b2	cmp	rsi, 2
1458a02b6	jae	0x1458a248e
1458a02bc	lea	rcx, [rbp + 0x28]
1458a02c0	call	0x1459b5940
1458a02c5	nop
1458a02c6	xorps	xmm0, xmm0
1458a02c9	movaps	xmmword ptr [rbp - 0x30], xmm0
1458a02cd	movaps	xmmword ptr [rbp - 0x40], xmm0
1458a02d1	movaps	xmmword ptr [rbp - 0x50], xmm0
1458a02d5	mov	qword ptr [rbp - 0x20], 0
1458a02dd	mov	qword ptr [rbp + 0x240], 0
1458a02e8	mov	rax, qword ptr [rbp + 0x378]
1458a02ef	mov	qword ptr [rbp + 0x248], rax
1458a02f6	mov	rcx, qword ptr [rbp + 0x370]
1458a02fd	mov	qword ptr [rbp + 0x250], rcx
1458a0304	mov	qword ptr [rbp + 0x258], rax
1458a030b	mov	qword ptr [rbp + 0x260], 0
1458a0316	mov	qword ptr [rbp + 0x268], rax
1458a031d	movabs	rax, 0xa0000000a
1458a0327	mov	qword ptr [rbp + 0x270], rax
1458a032e	mov	byte ptr [rbp + 0x278], 1
1458a0335	mov	word ptr [rbp + 0x280], 0
1458a033e	xor	eax, eax
1458a0340	jmp	0x1458a0357
1458a0342	nop	word ptr cs:[rax + rax]
1458a0350	movzx	eax, byte ptr [rbp + 0x281]
1458a0357	test	al, 1
1458a0359	jne	0x1458a081a
1458a035f	mov	rsi, qword ptr [rbp + 0x250]
1458a0366	lea	rcx, [rbp + 0x320]
1458a036d	lea	rdx, [rbp + 0x250]
1458a0374	call	0x1458aabb0
1458a0379	nop
1458a037a	cmp	dword ptr [rbp + 0x320], 1
1458a0381	jne	0x1458a03b0
1458a0383	mov	rdx, qword ptr [rbp + 0x330]
1458a038a	mov	rax, qword ptr [rbp + 0x240]
1458a0391	mov	qword ptr [rbp + 0x240], rdx
1458a0398	sub	rdx, rax
1458a039b	add	rsi, rax
1458a039e	test	rdx, rdx
1458a03a1	jne	0x1458a03f2
1458a03a3	jmp	0x1458a0420
1458a03a5	nop	word ptr cs:[rax + rax]
1458a03b0	cmp	byte ptr [rbp + 0x281], 0
1458a03b7	jne	0x1458a081a
1458a03bd	mov	byte ptr [rbp + 0x281], 1
1458a03c4	mov	rsi, qword ptr [rbp + 0x240]
1458a03cb	mov	rdx, qword ptr [rbp + 0x248]
1458a03d2	sub	rdx, rsi
1458a03d5	setne	al
1458a03d8	or	al, byte ptr [rbp + 0x280]
1458a03de	cmp	al, 1
1458a03e0	jne	0x1458a081a
1458a03e6	add	rsi, qword ptr [rbp + 0x250]
1458a03ed	test	rdx, rdx
1458a03f0	je	0x1458a0420
1458a03f2	cmp	byte ptr [rsi + rdx - 1], 0xa
1458a03f7	jne	0x1458a0420
1458a03f9	mov	rax, rdx
1458a03fc	dec	rax
1458a03ff	je	0x1458a040e
1458a0401	cmp	byte ptr [rsi + rdx - 2], 0xd
1458a0406	jne	0x1458a0412
1458a0408	add	rdx, -2
1458a040c	jmp	0x1458a0420
1458a040e	xor	edx, edx
1458a0410	jmp	0x1458a0420
1458a0412	mov	rdx, rax
1458a0415	nop	word ptr cs:[rax + rax]
1458a0420	mov	rcx, rsi
1458a0423	call	0x140089200
1458a0428	nop
1458a0429	mov	r14, rdx
1458a042c	cmp	rdx, 5
1458a0430	jb	0x1458a0350
1458a0436	mov	ecx, dword ptr [rax]
1458a0438	mov	edx, 0x74617473
1458a043d	xor	ecx, edx
1458a043f	movzx	edx, byte ptr [rax + 4]
1458a0443	xor	edx, 0x7c
1458a0446	or	edx, ecx
1458a0448	jne	0x1458a0350
1458a044e	add	r14, -5
1458a0452	lea	rdi, [rax + 5]
1458a0456	add	rax, 6
1458a045a	mov	qword ptr [rbp + 0x388], rax
1458a0461	mov	qword ptr [rbp + 0x398], 0
1458a046c	xor	r12d, r12d
1458a046f	mov	dword ptr [rbp + 0x3a8], 0
1458a0479	nop	dword ptr [rax]
1458a0480	mov	r13, qword ptr [rbp + 0x398]
1458a0487	test	byte ptr [rbp + 0x3a8], 1
1458a048e	jne	0x1458a0350
1458a0494	mov	al, 1
1458a0496	mov	dword ptr [rbp + 0x3a8], eax
1458a049c	cmp	r14, r12
1458a049f	jae	0x1458a04bc
1458a04a1	mov	qword ptr [rbp + 0x398], r13
1458a04a8	jmp	0x1458a0565
1458a04ad	nop	dword ptr [rax]
1458a04b0	mov	r12, rax
1458a04b3	cmp	r14, rax
1458a04b6	jb	0x1458a055b
1458a04bc	mov	r8, r14
1458a04bf	sub	r8, r12
1458a04c2	lea	rdx, [rdi + r12]
1458a04c6	cmp	r8, 0x10
1458a04ca	jae	0x1458a0500
1458a04cc	xor	esi, esi
1458a04ce	test	r8, r8
1458a04d1	je	0x1458a04f1
1458a04d3	nop	word ptr cs:[rax + rax]
1458a04e0	cmp	byte ptr [rdx + rsi], 0x2c
1458a04e4	je	0x1458a0513
1458a04e6	inc	rsi
1458a04e9	cmp	r8, rsi
1458a04ec	jne	0x1458a04e0
1458a04ee	mov	rsi, r8
1458a04f1	xor	eax, eax
1458a04f3	cmp	rax, 1
1458a04f7	je	0x1458a0520
1458a04f9	jmp	0x1458a054f
1458a04fb	nop	dword ptr [rax + rax]
1458a0500	mov	cl, 0x2c
1458a0502	call	0x145bd5860
1458a0507	nop
1458a0508	mov	rsi, rdx
1458a050b	cmp	rax, 1
1458a050f	je	0x1458a0520
1458a0511	jmp	0x1458a054f
1458a0513	mov	eax, 1
1458a0518	cmp	rax, 1
1458a051c	jne	0x1458a054f
1458a051e	nop
1458a0520	lea	rax, [rsi + r12]
1458a0524	inc	rax
1458a0527	add	rsi, r12
1458a052a	cmp	rsi, r14
1458a052d	jae	0x1458a04b0
1458a052f	cmp	byte ptr [rdi + rsi], 0x2c
1458a0533	jne	0x1458a04b0
1458a0539	mov	dword ptr [rbp + 0x3a8], 0
1458a0543	mov	qword ptr [rbp + 0x398], rax
1458a054a	mov	r12, rax
1458a054d	jmp	0x1458a0568
1458a054f	mov	qword ptr [rbp + 0x398], r13
1458a0556	mov	r12, r14
1458a0559	jmp	0x1458a0565
1458a055b	mov	qword ptr [rbp + 0x398], r13
1458a0562	mov	r12, rax
1458a0565	mov	rsi, r14
1458a0568	sub	rsi, r13
1458a056b	lea	rbx, [rdi + r13]
1458a056f	xor	r15d, r15d
1458a0572	jmp	0x1458a058c
1458a0574	nop	word ptr cs:[rax + rax]
1458a0580	mov	r15, rax
1458a0583	cmp	rsi, rax
1458a0586	jb	0x1458a0480
1458a058c	mov	r8, rsi
1458a058f	sub	r8, r15
1458a0592	lea	rax, [rbx + r15]
1458a0596	cmp	r8, 0x10
1458a059a	jae	0x1458a05d0
1458a059c	xor	edx, edx
1458a059e	test	r8, r8
1458a05a1	je	0x1458a05c1
1458a05a3	nop	word ptr cs:[rax + rax]
1458a05b0	cmp	byte ptr [rax + rdx], 0x3d
1458a05b4	je	0x1458a05fd
1458a05b6	inc	rdx
1458a05b9	cmp	r8, rdx
1458a05bc	jne	0x1458a05b0
1458a05be	mov	rdx, r8
1458a05c1	xor	eax, eax
1458a05c3	cmp	rax, 1
1458a05c7	je	0x1458a05e5
1458a05c9	jmp	0x1458a0480
1458a05ce	nop
1458a05d0	mov	cl, 0x3d
1458a05d2	mov	rdx, rax
1458a05d5	call	0x145bd5860
1458a05da	nop
1458a05db	cmp	rax, 1
1458a05df	jne	0x1458a0480
1458a05e5	lea	rax, [rdx + r15]
1458a05e9	inc	rax
1458a05ec	lea	rcx, [rdx + r15]
1458a05f0	cmp	rcx, rsi
1458a05f3	jae	0x1458a0580
1458a05f5	cmp	byte ptr [rbx + rcx], 0x3d
1458a05f9	jne	0x1458a0580
1458a05fb	jmp	0x1458a060d
1458a05fd	mov	eax, 1
1458a0602	cmp	rax, 1
1458a0606	je	0x1458a05e5
1458a0608	jmp	0x1458a0480
1458a060d	xor	r8d, r8d
1458a0610	lea	r9, [rcx - 4]
1458a0614	cmp	r9, 5
1458a0618	ja	0x1458a06e0
1458a061e	lea	r10, [rip + 0x134b637]
1458a0625	movsxd	r9, dword ptr [r10 + r9*4]
1458a0629	add	r9, r10
1458a062c	jmp	r9
1458a062f	cmp	dword ptr [rbx], 0x646c6f67
1458a0635	je	0x1458a06f5
1458a063b	cmp	dword ptr [rbx], 0x736e7572
1458a0641	je	0x1458a0705
1458a0647	cmp	dword ptr [rbx], 0x736e6977
1458a064d	jne	0x1458a06dd
1458a0653	mov	r8d, 5
1458a0659	jmp	0x1458a070b
1458a065e	mov	r8d, dword ptr [rbx]
1458a0661	mov	r9d, 0x73736f62
1458a0667	xor	r8d, r9d
1458a066a	movzx	r9d, word ptr [rbx + 4]
1458a066f	xor	r9d, 0x7365
1458a0676	or	r9d, r8d
1458a0679	je	0x1458a06ed
1458a067b	mov	r8d, dword ptr [rbx]
1458a067e	mov	r9d, 0x68636163
1458a0684	xor	r8d, r9d
1458a0687	movzx	r9d, word ptr [rbx + 4]
1458a068c	xor	r9d, 0x7365
1458a0693	or	r9d, r8d
1458a0696	jne	0x1458a06dd
1458a0698	mov	r8d, 6
1458a069e	jmp	0x1458a070b
1458a06a0	mov	r8d, dword ptr [rbx]
1458a06a3	mov	r9d, 0x6c6c696b
1458a06a9	xor	r8d, r9d
1458a06ac	movzx	r9d, byte ptr [rbx + 4]
1458a06b1	xor	r9d, 0x73
1458a06b5	or	r9d, r8d
1458a06b8	jne	0x1458a06dd
1458a06ba	xor	r8d, r8d
1458a06bd	jmp	0x1458a070b
1458a06bf	mov	r8, qword ptr [rbx]
1458a06c2	movabs	r9, 0x6e61696472617567
1458a06cc	xor	r8, r9
1458a06cf	movzx	r9d, byte ptr [rbx + 8]
1458a06d4	xor	r9, 0x73
1458a06d8	or	r9, r8
1458a06db	je	0x1458a06fd
1458a06dd	xor	r8d, r8d
1458a06e0	mov	r9, rsi
1458a06e3	sub	r9, rax
1458a06e6	jne	0x1458a0721
1458a06e8	jmp	0x1458a0480
1458a06ed	mov	r8d, 3
1458a06f3	jmp	0x1458a070b
1458a06f5	mov	r8d, 1
1458a06fb	jmp	0x1458a070b
1458a06fd	mov	r8d, 2
1458a0703	jmp	0x1458a070b
1458a0705	mov	r8d, 4
1458a070b	lea	r9, [rip + 0x134b056]
1458a0712	add	r8, r9
1458a0715	mov	r9, rsi
1458a0718	sub	r9, rax
1458a071b	je	0x1458a0480
1458a0721	cmp	r9, 1
1458a0725	jne	0x1458a0742
1458a0727	movzx	r10d, byte ptr [rbx + rax]
1458a072c	cmp	r10d, 0x2b
1458a0730	je	0x1458a0480
1458a0736	cmp	r10d, 0x2d
1458a073a	je	0x1458a0480
1458a0740	jmp	0x1458a0747
1458a0742	movzx	r10d, byte ptr [rbx + rax]
1458a0747	xor	eax, eax
1458a0749	cmp	r10b, 0x2b
1458a074d	sete	al
1458a0750	mov	r10, rax
1458a0753	neg	r10
1458a0756	sub	r9, rax
1458a0759	cmp	r9, 0x11
1458a075d	jae	0x1458a07a9
1458a075f	test	r9, r9
1458a0762	je	0x1458a07f5
1458a0768	add	r13, rax
1458a076b	add	r13, qword ptr [rbp + 0x388]
1458a0772	add	rdx, r15
1458a0775	lea	rcx, [rsi + r10]
1458a0779	dec	rcx
1458a077c	xor	eax, eax
1458a077e	nop
1458a0780	movzx	r9d, byte ptr [r13 + rdx]
1458a0786	add	r9d, -0x30
1458a078a	cmp	r9d, 9
1458a078e	ja	0x1458a0480
1458a0794	lea	rax, [rax + rax*4]
1458a0798	mov	r9d, r9d
1458a079b	lea	rax, [r9 + rax*2]
1458a079f	inc	rdx
1458a07a2	cmp	rcx, rdx
1458a07a5	jne	0x1458a0780
1458a07a7	jmp	0x1458a07f7
1458a07a9	lea	r9, [rsi + r10]
1458a07ad	dec	r9
1458a07b0	add	r13, rax
1458a07b3	add	r13, qword ptr [rbp + 0x388]
1458a07ba	xor	eax, eax
1458a07bc	cmp	r9, rcx
1458a07bf	je	0x1458a07f7
1458a07c1	mov	edx, 0xa
1458a07c6	mul	rdx
1458a07c9	jo	0x1458a0480
1458a07cf	movzx	r10d, byte ptr [r13 + rcx]
1458a07d5	add	r10d, -0x30
1458a07d9	add	rax, r10
1458a07dc	setb	dl
1458a07df	cmp	r10d, 9
1458a07e3	ja	0x1458a0480
1458a07e9	inc	rcx
1458a07ec	test	dl, dl
1458a07ee	je	0x1458a07bc
1458a07f0	jmp	0x1458a0480
1458a07f5	xor	eax, eax
1458a07f7	test	r8, r8
1458a07fa	je	0x1458a0480
1458a0800	movzx	ecx, byte ptr [r8]
1458a0804	mov	rdx, qword ptr [rbp + rcx*8 - 0x50]
1458a0809	cmp	rax, rdx
1458a080c	cmova	rdx, rax
1458a0810	mov	qword ptr [rbp + rcx*8 - 0x50], rdx
1458a0815	jmp	0x1458a0480
1458a081a	mov	qword ptr [rbp + 0x140], 0
1458a0825	mov	qword ptr [rbp + 0x148], 8
1458a0830	mov	qword ptr [rbp + 0x150], 0
1458a083b	mov	qword ptr [rbp + 0x320], 0
1458a0846	mov	rax, qword ptr [rbp + 0x378]
1458a084d	mov	qword ptr [rbp + 0x328], rax
1458a0854	lea	rsi, [rbp + 0x330]
1458a085b	mov	rcx, qword ptr [rbp + 0x370]
1458a0862	mov	qword ptr [rbp + 0x330], rcx
1458a0869	mov	qword ptr [rbp + 0x338], rax
1458a0870	mov	qword ptr [rbp + 0x340], 0
1458a087b	mov	qword ptr [rbp + 0x348], rax
1458a0882	movabs	rax, 0xa0000000a
1458a088c	mov	qword ptr [rbp + 0x350], rax
1458a0893	mov	byte ptr [rbp + 0x358], 1
1458a089a	mov	word ptr [rbp + 0x360], 0
1458a08a3	xor	eax, eax
1458a08a5	lea	r14, [rbp + 0x240]
1458a08ac	lea	r15, [rbp + 0x1c0]
1458a08b3	lea	r12, [rbp + 0x140]
1458a08ba	mov	bl, 0xa
1458a08bc	test	al, 1
1458a08be	je	0x1458a0b7f
1458a08c4	mov	rcx, qword ptr [rbp + 0x148]
1458a08cb	mov	rsi, qword ptr [rbp + 0x150]
1458a08d2	cmp	rsi, 2
1458a08d6	jae	0x1458a24bf
1458a08dc	shl	rsi, 4
1458a08e0	add	rsi, rcx
1458a08e3	mov	edi, 0xc
1458a08e8	cmp	rcx, rsi
1458a08eb	jne	0x1458a0ae6
1458a08f1	mov	qword ptr [rbp + 0x240], 0
1458a08fc	mov	rax, qword ptr [rbp + 0x378]
1458a0903	mov	qword ptr [rbp + 0x248], rax
1458a090a	mov	rcx, qword ptr [rbp + 0x370]
1458a0911	mov	qword ptr [rbp + 0x250], rcx
1458a0918	mov	qword ptr [rbp + 0x258], rax
1458a091f	mov	qword ptr [rbp + 0x260], 0
1458a092a	mov	qword ptr [rbp + 0x268], rax
1458a0931	movabs	rax, 0xa0000000a
1458a093b	mov	qword ptr [rbp + 0x270], rax
1458a0942	mov	byte ptr [rbp + 0x278], 1
1458a0949	mov	word ptr [rbp + 0x280], 0
1458a0952	mov	dword ptr [rbp + 0x2bc], 0xffffffff
1458a095c	mov	dword ptr [rbp + 0x304], 0xffffffff
1458a0966	lea	rcx, [rbp + 0xb0]
1458a096d	lea	rdx, [rbp + 0x240]
1458a0974	call	0x1459bd8f0
1458a0979	nop
1458a097a	mov	rsi, qword ptr [rbp + 0xc0]
1458a0981	cmp	rsi, 2
1458a0985	jae	0x1458a257e
1458a098b	lea	rcx, [rbp + 0xb0]
1458a0992	call	0x1459b5940
1458a0997	nop
1458a0998	mov	qword ptr [rbp + 0x240], 0
1458a09a3	mov	rax, qword ptr [rbp + 0x378]
1458a09aa	mov	qword ptr [rbp + 0x248], rax
1458a09b1	mov	rcx, qword ptr [rbp + 0x370]
1458a09b8	mov	qword ptr [rbp + 0x250], rcx
1458a09bf	mov	qword ptr [rbp + 0x258], rax
1458a09c6	mov	qword ptr [rbp + 0x260], 0
1458a09d1	mov	qword ptr [rbp + 0x268], rax
1458a09d8	movabs	rax, 0xa0000000a
1458a09e2	mov	qword ptr [rbp + 0x270], rax
1458a09e9	mov	byte ptr [rbp + 0x278], 1
1458a09f0	mov	word ptr [rbp + 0x280], 0
1458a09f9	mov	dword ptr [rbp + 0x2bc], 0xffffffff
1458a0a03	mov	dword ptr [rbp + 0x304], 0xffffffff
1458a0a0d	lea	rcx, [rbp + 0x120]
1458a0a14	lea	rdx, [rbp + 0x240]
1458a0a1b	call	0x1459c34a0
1458a0a20	nop
1458a0a21	mov	r14, qword ptr [rbp + 0x130]
1458a0a28	cmp	r14, 2
1458a0a2c	jae	0x1458a25b2
1458a0a32	mov	qword ptr [rbp + 0x240], 0
1458a0a3d	mov	rax, qword ptr [rbp + 0x378]
1458a0a44	mov	qword ptr [rbp + 0x248], rax
1458a0a4b	lea	rsi, [rbp + 0x250]
1458a0a52	mov	rcx, qword ptr [rbp + 0x370]
1458a0a59	mov	qword ptr [rbp + 0x250], rcx
1458a0a60	mov	qword ptr [rbp + 0x258], rax
1458a0a67	mov	qword ptr [rbp + 0x260], 0
1458a0a72	mov	qword ptr [rbp + 0x268], rax
1458a0a79	movabs	rax, 0xa0000000a
1458a0a83	mov	qword ptr [rbp + 0x270], rax
1458a0a8a	mov	byte ptr [rbp + 0x278], 1
1458a0a91	mov	word ptr [rbp + 0x280], 0
1458a0a9a	xor	r13d, r13d
1458a0a9d	lea	r14, [rbp + 0x320]
1458a0aa4	mov	edi, 0x65736572
1458a0aa9	mov	ebx, 0x7c737465
1458a0aae	mov	r12d, 0xa
1458a0ab4	xor	eax, eax
1458a0ab6	jmp	0x1458a0e87
1458a0abb	nop	dword ptr [rax + rax]
1458a0ac0	mov	rax, qword ptr [rbp + 0x210]
1458a0ac7	mov	byte ptr [rax + r13], r12b
1458a0acb	mov	qword ptr [rax + r13 + 8], r15
1458a0ad0	inc	r14
1458a0ad3	mov	qword ptr [rbp + 0x218], r14
1458a0ada	mov	rcx, rbx
1458a0add	cmp	rcx, rsi
1458a0ae0	je	0x1458a08f1
1458a0ae6	lea	rbx, [rcx + 0x10]
1458a0aea	movzx	r12d, byte ptr [rcx]
1458a0aee	mov	r15, qword ptr [rcx + 8]
1458a0af2	add	r15, 2
1458a0af6	cmp	r15, 0xc
1458a0afa	cmovae	r15, rdi
1458a0afe	mov	rax, qword ptr [rbp + 0x210]
1458a0b05	mov	r14, qword ptr [rbp + 0x218]
1458a0b0c	mov	r13, r14
1458a0b0f	shl	r13, 4
1458a0b13	xor	ecx, ecx
1458a0b15	nop	word ptr cs:[rax + rax]
1458a0b20	cmp	r13, rcx
1458a0b23	je	0x1458a0b50
1458a0b25	lea	rdx, [rcx + 0x10]
1458a0b29	cmp	byte ptr [rax + rcx], r12b
1458a0b2d	mov	rcx, rdx
1458a0b30	jne	0x1458a0b20
1458a0b32	mov	rcx, qword ptr [rax + rdx - 8]
1458a0b37	cmp	r15, rcx
1458a0b3a	cmova	rcx, r15
1458a0b3e	mov	qword ptr [rax + rdx - 8], rcx
1458a0b43	mov	rcx, rbx
1458a0b46	cmp	rcx, rsi
1458a0b49	jne	0x1458a0ae6
1458a0b4b	jmp	0x1458a08f1
1458a0b50	cmp	r14, qword ptr [rbp + 0x208]
1458a0b57	jne	0x1458a0ac7
1458a0b5d	lea	rcx, [rbp + 0x208]
1458a0b64	call	0x145bfaef0
1458a0b69	nop
1458a0b6a	jmp	0x1458a0ac0
1458a0b6f	nop
1458a0b70	movzx	eax, byte ptr [rbp + 0x361]
1458a0b77	test	al, 1
1458a0b79	jne	0x1458a08c4
1458a0b7f	mov	r13, qword ptr [rbp + 0x330]
1458a0b86	mov	rcx, r14
1458a0b89	mov	rdx, rsi
1458a0b8c	call	0x1458aabb0
1458a0b91	nop
1458a0b92	cmp	dword ptr [rbp + 0x240], 1
1458a0b99	jne	0x1458a0bc0
1458a0b9b	mov	rdx, qword ptr [rbp + 0x250]
1458a0ba2	mov	rax, qword ptr [rbp + 0x320]
1458a0ba9	mov	qword ptr [rbp + 0x320], rdx
1458a0bb0	sub	rdx, rax
1458a0bb3	add	r13, rax
1458a0bb6	test	rdx, rdx
1458a0bb9	jne	0x1458a0c02
1458a0bbb	jmp	0x1458a0c30
1458a0bbd	nop	dword ptr [rax]
1458a0bc0	cmp	byte ptr [rbp + 0x361], 0
1458a0bc7	jne	0x1458a08c4
1458a0bcd	mov	byte ptr [rbp + 0x361], 1
1458a0bd4	mov	r13, qword ptr [rbp + 0x320]
1458a0bdb	mov	rdx, qword ptr [rbp + 0x328]
1458a0be2	sub	rdx, r13
1458a0be5	setne	al
1458a0be8	or	al, byte ptr [rbp + 0x360]
1458a0bee	cmp	al, 1
1458a0bf0	jne	0x1458a08c4
1458a0bf6	add	r13, qword ptr [rbp + 0x330]
1458a0bfd	test	rdx, rdx
1458a0c00	je	0x1458a0c30
1458a0c02	cmp	byte ptr [r13 + rdx - 1], 0xa
1458a0c08	jne	0x1458a0c30
1458a0c0a	mov	rax, rdx
1458a0c0d	dec	rax
1458a0c10	je	0x1458a0c20
1458a0c12	cmp	byte ptr [r13 + rdx - 2], 0xd
1458a0c18	jne	0x1458a0c24
1458a0c1a	add	rdx, -2
1458a0c1e	jmp	0x1458a0c30
1458a0c20	xor	edx, edx
1458a0c22	jmp	0x1458a0c30
1458a0c24	mov	rdx, rax
1458a0c27	nop	word ptr [rax + rax]
1458a0c30	mov	rcx, r13
1458a0c33	call	0x140089200
1458a0c38	nop
1458a0c39	mov	qword ptr [rbp + 0x240], 0
1458a0c44	mov	qword ptr [rbp + 0x248], rdx
1458a0c4b	mov	qword ptr [rbp + 0x250], rax
1458a0c52	mov	qword ptr [rbp + 0x258], rdx
1458a0c59	mov	qword ptr [rbp + 0x260], 0
1458a0c64	mov	qword ptr [rbp + 0x268], rdx
1458a0c6b	movabs	rax, 0x7c0000007c
1458a0c75	mov	qword ptr [rbp + 0x270], rax
1458a0c7c	mov	byte ptr [rbp + 0x278], 1
1458a0c83	mov	word ptr [rbp + 0x280], 1
1458a0c8c	mov	rcx, r15
1458a0c8f	mov	rdx, r14
1458a0c92	call	0x1459bd2c0
1458a0c97	nop
1458a0c98	mov	rcx, qword ptr [rbp + 0x1c8]
1458a0c9f	cmp	qword ptr [rbp + 0x1d0], 3
1458a0ca7	jne	0x1458a0cc0
1458a0ca9	cmp	qword ptr [rcx + 8], 4
1458a0cae	jne	0x1458a0cc0
1458a0cb0	mov	rax, qword ptr [rcx]
1458a0cb3	cmp	dword ptr [rax], 0x74616562
1458a0cb9	je	0x1458a0cf3
1458a0cbb	nop	dword ptr [rax + rax]
1458a0cc0	mov	rdx, qword ptr [rbp + 0x1c0]
1458a0cc7	test	rdx, rdx
1458a0cca	je	0x1458a0b70
1458a0cd0	shl	rdx, 4
1458a0cd4	mov	r8d, 8
1458a0cda	call	0x1400021d0
1458a0cdf	movzx	eax, byte ptr [rbp + 0x361]
1458a0ce6	test	al, 1
1458a0ce8	je	0x1458a0b7f
1458a0cee	jmp	0x1458a08c4
1458a0cf3	mov	rdx, qword ptr [rcx + 0x18]
1458a0cf7	test	rdx, rdx
1458a0cfa	je	0x1458a0cc0
1458a0cfc	mov	r11, qword ptr [rcx + 0x10]
1458a0d00	cmp	rdx, 1
1458a0d04	jne	0x1458a0d18
1458a0d06	movzx	r8d, byte ptr [r11]
1458a0d0a	cmp	r8d, 0x2b
1458a0d0e	je	0x1458a0cc0
1458a0d10	cmp	r8d, 0x2d
1458a0d14	je	0x1458a0cc0
1458a0d16	jmp	0x1458a0d1c
1458a0d18	movzx	r8d, byte ptr [r11]
1458a0d1c	xor	eax, eax
1458a0d1e	cmp	r8b, 0x2b
1458a0d22	sete	al
1458a0d25	mov	r8, rdx
1458a0d28	sub	r8, rax
1458a0d2b	add	r11, rax
1458a0d2e	cmp	r8, 3
1458a0d32	jae	0x1458a0d6e
1458a0d34	test	r8, r8
1458a0d37	je	0x1458a0db3
1458a0d39	movzx	eax, byte ptr [r11]
1458a0d3d	add	eax, -0x30
1458a0d40	cmp	eax, 9
1458a0d43	ja	0x1458a0cc0
1458a0d49	cmp	r8, 1
1458a0d4d	je	0x1458a0db5
1458a0d4f	movzx	edx, byte ptr [r11 + 1]
1458a0d54	add	edx, -0x30
1458a0d57	cmp	edx, 9
1458a0d5a	ja	0x1458a0cc0
1458a0d60	movzx	eax, al
1458a0d63	add	eax, eax
1458a0d65	lea	eax, [rax + rax*4]
1458a0d68	add	dl, al
1458a0d6a	mov	eax, edx
1458a0d6c	jmp	0x1458a0db5
1458a0d6e	neg	rax
1458a0d71	add	rdx, rax
1458a0d74	neg	rdx
1458a0d77	xor	r8d, r8d
1458a0d7a	xor	eax, eax
1458a0d7c	mov	r9, rdx
1458a0d7f	add	r9, r8
1458a0d82	je	0x1458a0db5
1458a0d84	mul	bl
1458a0d86	jo	0x1458a0cc0
1458a0d8c	movzx	r10d, byte ptr [r11 + r8]
1458a0d91	add	r10d, -0x30
1458a0d95	add	al, r10b
1458a0d98	setb	r9b
1458a0d9c	cmp	r10d, 9
1458a0da0	ja	0x1458a0cc0
1458a0da6	inc	r8
1458a0da9	test	r9b, r9b
1458a0dac	je	0x1458a0d7c
1458a0dae	jmp	0x1458a0cc0
1458a0db3	xor	eax, eax
1458a0db5	mov	byte ptr [rbp + 0xe0], al
1458a0dbb	mov	rax, qword ptr [rcx + 0x20]
1458a0dbf	mov	qword ptr [rbp + 0x3a8], rcx
1458a0dc6	mov	rcx, qword ptr [rcx + 0x28]
1458a0dca	mov	qword ptr [rbp + 0x248], 0
1458a0dd5	mov	qword ptr [rbp + 0x250], rcx
1458a0ddc	mov	qword ptr [rbp + 0x258], rax
1458a0de3	mov	qword ptr [rbp + 0x260], rcx
1458a0dea	mov	qword ptr [rbp + 0x268], 0
1458a0df5	mov	qword ptr [rbp + 0x270], rcx
1458a0dfc	movabs	rax, 0x2c0000002c
1458a0e06	mov	qword ptr [rbp + 0x278], rax
1458a0e0d	mov	byte ptr [rbp + 0x280], 1
1458a0e14	mov	word ptr [rbp + 0x288], 1
1458a0e1d	lea	rax, [rbp + 0xe0]
1458a0e24	mov	qword ptr [rbp + 0x240], rax
1458a0e2b	mov	rcx, r12
1458a0e2e	mov	rdx, r14
1458a0e31	call	0x1459b6310
1458a0e36	nop
1458a0e37	mov	rdx, qword ptr [rbp + 0x1c0]
1458a0e3e	test	rdx, rdx
1458a0e41	mov	rcx, qword ptr [rbp + 0x3a8]
1458a0e48	jne	0x1458a0cd0
1458a0e4e	jmp	0x1458a0b70
1458a0e53	xor	r13d, r13d
1458a0e56	mov	rcx, r13
1458a0e59	mov	rdx, qword ptr [rbp + 0x380]
1458a0e60	call	0x145d992bb
1458a0e65	nop
1458a0e66	jmp	0x1458a2924
1458a0e6b	shl	rax, 0x20
1458a0e6f	test	al, 1
1458a0e71	je	0x1458a103e
1458a0e77	nop	word ptr [rax + rax]
1458a0e80	movzx	eax, byte ptr [rbp + 0x281]
1458a0e87	test	al, 1
1458a0e89	jne	0x1458a1045
1458a0e8f	mov	r15, qword ptr [rbp + 0x250]
1458a0e96	mov	rcx, r14
1458a0e99	mov	rdx, rsi
1458a0e9c	call	0x1458aabb0
1458a0ea1	nop
1458a0ea2	cmp	dword ptr [rbp + 0x320], 1
1458a0ea9	jne	0x1458a0ed0
1458a0eab	mov	rdx, qword ptr [rbp + 0x330]
1458a0eb2	mov	rax, qword ptr [rbp + 0x240]
1458a0eb9	mov	qword ptr [rbp + 0x240], rdx
1458a0ec0	sub	rdx, rax
1458a0ec3	add	r15, rax
1458a0ec6	test	rdx, rdx
1458a0ec9	jne	0x1458a0f12
1458a0ecb	jmp	0x1458a0f40
1458a0ecd	nop	dword ptr [rax]
1458a0ed0	cmp	byte ptr [rbp + 0x281], 0
1458a0ed7	jne	0x1458a1045
1458a0edd	mov	byte ptr [rbp + 0x281], 1
1458a0ee4	mov	r15, qword ptr [rbp + 0x240]
1458a0eeb	mov	rdx, qword ptr [rbp + 0x248]
1458a0ef2	sub	rdx, r15
1458a0ef5	setne	al
1458a0ef8	or	al, byte ptr [rbp + 0x280]
1458a0efe	cmp	al, 1
1458a0f00	jne	0x1458a1045
1458a0f06	add	r15, qword ptr [rbp + 0x250]
1458a0f0d	test	rdx, rdx
1458a0f10	je	0x1458a0f40
1458a0f12	cmp	byte ptr [r15 + rdx - 1], 0xa
1458a0f18	jne	0x1458a0f40
1458a0f1a	mov	rax, rdx
1458a0f1d	dec	rax
1458a0f20	je	0x1458a0f30
1458a0f22	cmp	byte ptr [r15 + rdx - 2], 0xd
1458a0f28	jne	0x1458a0f34
1458a0f2a	add	rdx, -2
1458a0f2e	jmp	0x1458a0f40
1458a0f30	xor	edx, edx
1458a0f32	jmp	0x1458a0f40
1458a0f34	mov	rdx, rax
1458a0f37	nop	word ptr [rax + rax]
1458a0f40	mov	rcx, r15
1458a0f43	call	0x140089200
1458a0f48	nop
1458a0f49	cmp	rdx, 7
1458a0f4d	jb	0x1458a0e80
1458a0f53	mov	ecx, dword ptr [rax]
1458a0f55	xor	ecx, edi
1458a0f57	mov	r8d, dword ptr [rax + 3]
1458a0f5b	xor	r8d, ebx
1458a0f5e	or	r8d, ecx
1458a0f61	jne	0x1458a0e80
1458a0f67	mov	rcx, rdx
1458a0f6a	sub	rcx, 7
1458a0f6e	je	0x1458a0e80
1458a0f74	lea	r8, [rax + 7]
1458a0f78	cmp	rdx, 8
1458a0f7c	jne	0x1458a0f96
1458a0f7e	movzx	eax, byte ptr [r8]
1458a0f82	cmp	eax, 0x2b
1458a0f85	je	0x1458a0e80
1458a0f8b	cmp	eax, 0x2d
1458a0f8e	je	0x1458a0e80
1458a0f94	jmp	0x1458a0f9a
1458a0f96	movzx	eax, byte ptr [r8]
1458a0f9a	xor	edx, edx
1458a0f9c	cmp	al, 0x2b
1458a0f9e	sete	dl
1458a0fa1	sub	rcx, rdx
1458a0fa4	add	r8, rdx
1458a0fa7	xor	eax, eax
1458a0fa9	cmp	rcx, 9
1458a0fad	jae	0x1458a0fe7
1458a0faf	test	rcx, rcx
1458a0fb2	je	0x1458a0e6b
1458a0fb8	xor	edx, edx
1458a0fba	nop	word ptr [rax + rax]
1458a0fc0	movzx	r9d, byte ptr [r8 + rdx]
1458a0fc5	add	r9d, -0x30
1458a0fc9	cmp	r9d, 9
1458a0fcd	ja	0x1458a0e80
1458a0fd3	lea	eax, [rax + rax*4]
1458a0fd6	lea	eax, [r9 + rax*2]
1458a0fda	inc	rdx
1458a0fdd	cmp	rcx, rdx
1458a0fe0	jne	0x1458a0fc0
1458a0fe2	jmp	0x1458a0e6b
1458a0fe7	xor	r9d, r9d
1458a0fea	cmp	rcx, r9
1458a0fed	je	0x1458a0e6b
1458a0ff3	mul	r12d
1458a0ff6	jo	0x1458a101d
1458a0ff8	movzx	r10d, byte ptr [r8 + r9]
1458a0ffd	add	r10d, -0x30
1458a1001	add	eax, r10d
1458a1004	setb	dl
1458a1007	cmp	r10d, 9
1458a100b	ja	0x1458a0e80
1458a1011	inc	r9
1458a1014	test	dl, dl
1458a1016	je	0x1458a0fea
1458a1018	jmp	0x1458a0e80
1458a101d	movzx	ecx, byte ptr [r8 + r9]
1458a1022	add	cl, 0xd0
1458a1025	xor	eax, eax
1458a1027	cmp	cl, 0xa
1458a102a	setb	al
1458a102d	shl	eax, 8
1458a1030	add	rax, 0x101
1458a1036	test	al, 1
1458a1038	jne	0x1458a0e80
1458a103e	shr	rax, 0x20
1458a1042	mov	r13d, eax
1458a1045	mov	qword ptr [rbp + 0x320], 0
1458a1050	mov	rax, qword ptr [rbp + 0x378]
1458a1057	mov	qword ptr [rbp + 0x328], rax
1458a105e	lea	rsi, [rbp + 0x330]
1458a1065	mov	rcx, qword ptr [rbp + 0x370]
1458a106c	mov	qword ptr [rbp + 0x330], rcx
1458a1073	mov	qword ptr [rbp + 0x338], rax
1458a107a	mov	qword ptr [rbp + 0x340], 0
1458a1085	mov	qword ptr [rbp + 0x348], rax
1458a108c	movabs	rax, 0xa0000000a
1458a1096	mov	qword ptr [rbp + 0x350], rax
1458a109d	mov	byte ptr [rbp + 0x358], 1
1458a10a4	mov	word ptr [rbp + 0x360], 0
1458a10ad	xor	eax, eax
1458a10af	lea	r14, [rbp + 0x240]
1458a10b6	mov	edi, 0x73746570
1458a10bb	mov	qword ptr [rbp + 0x3a8], r13
1458a10c2	jmp	0x1458a10d7
1458a10c4	nop	word ptr cs:[rax + rax]
1458a10d0	movzx	eax, byte ptr [rbp + 0x361]
1458a10d7	test	al, 1
1458a10d9	jne	0x1458a1251
1458a10df	mov	r15, qword ptr [rbp + 0x330]
1458a10e6	mov	rcx, r14
1458a10e9	mov	rdx, rsi
1458a10ec	call	0x1458aabb0
1458a10f1	nop
1458a10f2	cmp	dword ptr [rbp + 0x240], 1
1458a10f9	jne	0x1458a1120
1458a10fb	mov	rdx, qword ptr [rbp + 0x250]
1458a1102	mov	rax, qword ptr [rbp + 0x320]
1458a1109	mov	qword ptr [rbp + 0x320], rdx
1458a1110	sub	rdx, rax
1458a1113	add	r15, rax
1458a1116	test	rdx, rdx
1458a1119	jne	0x1458a1162
1458a111b	jmp	0x1458a1190
1458a111d	nop	dword ptr [rax]
1458a1120	cmp	byte ptr [rbp + 0x361], 0
1458a1127	jne	0x1458a1251
1458a112d	mov	byte ptr [rbp + 0x361], 1
1458a1134	mov	r15, qword ptr [rbp + 0x320]
1458a113b	mov	rdx, qword ptr [rbp + 0x328]
1458a1142	sub	rdx, r15
1458a1145	setne	al
1458a1148	or	al, byte ptr [rbp + 0x360]
1458a114e	cmp	al, 1
1458a1150	jne	0x1458a1251
1458a1156	add	r15, qword ptr [rbp + 0x330]
1458a115d	test	rdx, rdx
1458a1160	je	0x1458a1190
1458a1162	cmp	byte ptr [r15 + rdx - 1], 0xa
1458a1168	jne	0x1458a1190
1458a116a	mov	rax, rdx
1458a116d	dec	rax
1458a1170	je	0x1458a1180
1458a1172	cmp	byte ptr [r15 + rdx - 2], 0xd
1458a1178	jne	0x1458a1184
1458a117a	add	rdx, -2
1458a117e	jmp	0x1458a1190
1458a1180	xor	edx, edx
1458a1182	jmp	0x1458a1190
1458a1184	mov	rdx, rax
1458a1187	nop	word ptr [rax + rax]
1458a1190	mov	rcx, r15
1458a1193	call	0x140089200
1458a1198	nop
1458a1199	cmp	rdx, 5
1458a119d	jb	0x1458a10d0
1458a11a3	mov	ecx, dword ptr [rax]
1458a11a5	xor	ecx, edi
1458a11a7	movzx	r8d, byte ptr [rax + 4]
1458a11ac	xor	r8d, 0x7c
1458a11b0	or	r8d, ecx
1458a11b3	jne	0x1458a10d0
1458a11b9	add	rax, 5
1458a11bd	add	rdx, -5
1458a11c1	mov	qword ptr [rbp + 0x240], 2
1458a11cc	mov	qword ptr [rbp + 0x248], 0
1458a11d7	mov	qword ptr [rbp + 0x250], rdx
1458a11de	mov	qword ptr [rbp + 0x258], rax
1458a11e5	mov	qword ptr [rbp + 0x260], rdx
1458a11ec	mov	qword ptr [rbp + 0x268], 0
1458a11f7	mov	qword ptr [rbp + 0x270], rdx
1458a11fe	movabs	rax, 0x2c0000002c
1458a1208	mov	qword ptr [rbp + 0x278], rax
1458a120f	mov	byte ptr [rbp + 0x280], 1
1458a1216	mov	word ptr [rbp + 0x288], 1
1458a121f	lea	rcx, [rbp + 0x1c0]
1458a1226	lea	rdx, [rbp + 0x240]
1458a122d	call	0x1459b95e0
1458a1232	nop
1458a1233	movups	xmm0, xmmword ptr [rbp + 0x1c0]
1458a123a	movaps	xmmword ptr [rbp + 0x220], xmm0
1458a1241	mov	rax, qword ptr [rbp + 0x1d0]
1458a1248	mov	qword ptr [rbp + 0x230], rax
1458a124f	jmp	0x1458a1272
1458a1251	mov	qword ptr [rbp + 0x220], 0
1458a125c	mov	qword ptr [rbp + 0x228], 8
1458a1267	mov	qword ptr [rbp + 0x230], 0
1458a1272	mov	qword ptr [rbp + 0xe0], 0
1458a127d	mov	qword ptr [rbp + 0xe8], 1
1458a1288	mov	qword ptr [rbp + 0xf0], 0
1458a1293	xor	ebx, ebx
1458a1295	lea	r14, [rbp + 0x1c0]
1458a129c	lea	r15, [rbp + 0x240]
1458a12a3	xor	r13d, r13d
1458a12a6	xor	esi, esi
1458a12a8	test	sil, 1
1458a12ac	je	0x1458a149d
1458a12b2	mov	rax, qword ptr [rbp + 0x10]
1458a12b6	mov	rcx, qword ptr [rbp + 0x18]
1458a12ba	mov	qword ptr [rcx + 0x10], rax
1458a12be	movups	xmm0, xmmword ptr [rbp]
1458a12c2	movups	xmmword ptr [rcx], xmm0
1458a12c5	movups	xmm0, xmmword ptr [rbp + 0x58]
1458a12c9	movups	xmm1, xmmword ptr [rbp + 0x68]
1458a12cd	movups	xmm2, xmmword ptr [rbp + 0x78]
1458a12d1	movups	xmm3, xmmword ptr [rbp + 0x88]
1458a12d8	movups	xmmword ptr [rcx + 0x180], xmm3
1458a12df	movups	xmmword ptr [rcx + 0x170], xmm2
1458a12e6	movups	xmmword ptr [rcx + 0x160], xmm1
1458a12ed	movups	xmmword ptr [rcx + 0x150], xmm0
1458a12f4	mov	rax, qword ptr [rbp + 0x218]
1458a12fb	mov	qword ptr [rcx + 0x28], rax
1458a12ff	movups	xmm0, xmmword ptr [rbp + 0x208]
1458a1306	movups	xmmword ptr [rcx + 0x18], xmm0
1458a130a	mov	rax, qword ptr [rbp + 0xd8]
1458a1311	mov	qword ptr [rcx + 0x40], rax
1458a1315	movups	xmm0, xmmword ptr [rbp + 0xc8]
1458a131c	movups	xmmword ptr [rcx + 0x30], xmm0
1458a1320	movups	xmm0, xmmword ptr [rbp + 0x1a0]
1458a1327	movups	xmmword ptr [rcx + 0x48], xmm0
1458a132b	mov	rax, qword ptr [rbp + 0x1b0]
1458a1332	mov	qword ptr [rcx + 0x58], rax
1458a1336	movups	xmm0, xmmword ptr [rbp + 0x98]
1458a133d	movups	xmmword ptr [rcx + 0x60], xmm0
1458a1341	mov	rax, qword ptr [rbp + 0xa8]
1458a1348	mov	qword ptr [rcx + 0x70], rax
1458a134c	movups	xmm0, xmmword ptr [rbp + 0x158]
1458a1353	movups	xmmword ptr [rcx + 0x78], xmm0
1458a1357	mov	rax, qword ptr [rbp + 0x168]
1458a135e	mov	qword ptr [rcx + 0x88], rax
1458a1365	movups	xmm0, xmmword ptr [rbp + 0x188]
1458a136c	movups	xmmword ptr [rcx + 0x90], xmm0
1458a1373	mov	rax, qword ptr [rbp + 0x198]
1458a137a	mov	qword ptr [rcx + 0xa0], rax
1458a1381	movups	xmm0, xmmword ptr [rbp + 0x40]
1458a1385	movups	xmmword ptr [rcx + 0xa8], xmm0
1458a138c	mov	rax, qword ptr [rbp + 0x50]
1458a1390	mov	qword ptr [rcx + 0xb8], rax
1458a1397	mov	rax, qword ptr [rbp + 0x38]
1458a139b	mov	qword ptr [rcx + 0xd0], rax
1458a13a2	movups	xmm0, xmmword ptr [rbp + 0x28]
1458a13a6	movups	xmmword ptr [rcx + 0xc0], xmm0
1458a13ad	mov	rax, qword ptr [rbp + 0x150]
1458a13b4	mov	qword ptr [rcx + 0xe8], rax
1458a13bb	movups	xmm0, xmmword ptr [rbp + 0x140]
1458a13c2	movups	xmmword ptr [rcx + 0xd8], xmm0
1458a13c9	movups	xmm0, xmmword ptr [rbp + 0xb0]
1458a13d0	movups	xmmword ptr [rcx + 0xf0], xmm0
1458a13d7	mov	rax, qword ptr [rbp + 0xc0]
1458a13de	mov	qword ptr [rcx + 0x100], rax
1458a13e5	movups	xmm0, xmmword ptr [rbp + 0x120]
1458a13ec	movups	xmmword ptr [rcx + 0x108], xmm0
1458a13f3	mov	rax, qword ptr [rbp + 0x130]
1458a13fa	mov	qword ptr [rcx + 0x118], rax
1458a1401	movaps	xmm0, xmmword ptr [rbp + 0x220]
1458a1408	movups	xmmword ptr [rcx + 0x120], xmm0
1458a140f	mov	rax, qword ptr [rbp + 0x230]
1458a1416	mov	qword ptr [rcx + 0x130], rax
1458a141d	mov	rax, qword ptr [rbp + 0xf0]
1458a1424	mov	qword ptr [rcx + 0x148], rax
1458a142b	movups	xmm0, xmmword ptr [rbp + 0xe0]
1458a1432	movups	xmmword ptr [rcx + 0x138], xmm0
1458a1439	movaps	xmm0, xmmword ptr [rbp - 0x50]
1458a143d	movaps	xmm1, xmmword ptr [rbp - 0x40]
1458a1441	movaps	xmm2, xmmword ptr [rbp - 0x30]
1458a1445	movups	xmmword ptr [rcx + 0x190], xmm0
1458a144c	movups	xmmword ptr [rcx + 0x1a0], xmm1
1458a1453	movups	xmmword ptr [rcx + 0x1b0], xmm2
1458a145a	mov	rax, qword ptr [rbp - 0x20]
1458a145e	mov	qword ptr [rcx + 0x1c0], rax
1458a1465	mov	rax, qword ptr [rbp + 0x3a8]
1458a146c	mov	dword ptr [rcx + 0x1c8], eax
1458a1472	mov	rax, rcx
1458a1475	movaps	xmm6, xmmword ptr [rbp + 0x3c0]
1458a147c	add	rsp, 0x458
1458a1483	pop	rbx
1458a1484	pop	rdi
1458a1485	pop	rsi
1458a1486	pop	r12
1458a1488	pop	r13
1458a148a	pop	r14
1458a148c	pop	r15
1458a148e	pop	rbp
1458a148f	ret
1458a1490	mov	rbx, rdi
1458a1493	test	sil, 1
1458a1497	jne	0x1458a12b2
1458a149d	cmp	qword ptr [rbp + 0x378], r13
1458a14a4	jae	0x1458a14c0
1458a14a6	mov	rdi, r13
1458a14a9	mov	r8, qword ptr [rbp + 0x378]
1458a14b0	jmp	0x1458a156a
1458a14b5	nop	word ptr cs:[rax + rax]
1458a14c0	mov	r8, qword ptr [rbp + 0x378]
1458a14c7	jmp	0x1458a14e3
1458a14c9	nop	dword ptr [rax]
1458a14d0	mov	r13, rdi
1458a14d3	mov	r8, qword ptr [rbp + 0x378]
1458a14da	cmp	rdi, r8
1458a14dd	ja	0x1458a156a
1458a14e3	sub	r8, r13
1458a14e6	mov	rax, qword ptr [rbp + 0x370]
1458a14ed	lea	rsi, [rax + r13]
1458a14f1	cmp	r8, 0x10
1458a14f5	jae	0x1458a1520
1458a14f7	xor	edx, edx
1458a14f9	test	r8, r8
1458a14fc	je	0x1458a1511
1458a14fe	nop
1458a1500	cmp	byte ptr [rsi + rdx], 0xa
1458a1504	je	0x1458a154c
1458a1506	inc	rdx
1458a1509	cmp	r8, rdx
1458a150c	jne	0x1458a1500
1458a150e	mov	rdx, r8
1458a1511	xor	eax, eax
1458a1513	cmp	rax, 1
1458a1517	je	0x1458a1531
1458a1519	jmp	0x1458a1560
1458a151b	nop	dword ptr [rax + rax]
1458a1520	mov	cl, 0xa
1458a1522	mov	rdx, rsi
1458a1525	call	0x145bd5860
1458a152a	nop
1458a152b	cmp	rax, 1
1458a152f	jne	0x1458a1560
1458a1531	lea	rdi, [rdx + r13]
1458a1535	inc	rdi
1458a1538	add	r13, rdx
1458a153b	cmp	r13, qword ptr [rbp + 0x378]
1458a1542	jae	0x1458a14d0
1458a1544	cmp	byte ptr [rsi + rdx], 0xa
1458a1548	jne	0x1458a14d0
1458a154a	jmp	0x1458a15b7
1458a154c	mov	eax, 1
1458a1551	cmp	rax, 1
1458a1555	je	0x1458a1531
1458a1557	nop	word ptr [rax + rax]
1458a1560	mov	r8, qword ptr [rbp + 0x378]
1458a1567	mov	rdi, r8
1458a156a	mov	r13, rdi
1458a156d	mov	sil, 1
1458a1570	mov	rdi, rbx
1458a1573	mov	rax, r8
1458a1576	cmp	r8, rbx
1458a1579	je	0x1458a12b2
1458a157f	mov	r8, qword ptr [rbp + 0x370]
1458a1586	lea	rcx, [r8 + rbx]
1458a158a	mov	rdx, rax
1458a158d	sub	rdx, rbx
1458a1590	je	0x1458a15d0
1458a1592	cmp	byte ptr [r8 + rax - 1], 0xa
1458a1598	jne	0x1458a15d0
1458a159a	mov	r8, rdx
1458a159d	dec	r8
1458a15a0	je	0x1458a15c1
1458a15a2	mov	r9, qword ptr [rbp + 0x370]
1458a15a9	cmp	byte ptr [r9 + rax - 2], 0xd
1458a15af	jne	0x1458a15c5
1458a15b1	add	rdx, -2
1458a15b5	jmp	0x1458a15d0
1458a15b7	xor	esi, esi
1458a15b9	mov	r13, rdi
1458a15bc	mov	rax, rdi
1458a15bf	jmp	0x1458a157f
1458a15c1	xor	edx, edx
1458a15c3	jmp	0x1458a15d0
1458a15c5	mov	rdx, r8
1458a15c8	nop	dword ptr [rax + rax]
1458a15d0	call	0x140089200
1458a15d5	nop
1458a15d6	mov	qword ptr [rbp + 0x240], 0
1458a15e1	mov	qword ptr [rbp + 0x248], rdx
1458a15e8	mov	qword ptr [rbp + 0x250], rax
1458a15ef	mov	qword ptr [rbp + 0x258], rdx
1458a15f6	mov	qword ptr [rbp + 0x260], 0
1458a1601	mov	qword ptr [rbp + 0x268], rdx
1458a1608	movabs	rax, 0x7c0000007c
1458a1612	mov	qword ptr [rbp + 0x270], rax
1458a1619	mov	byte ptr [rbp + 0x278], 1
1458a1620	mov	word ptr [rbp + 0x280], 1
1458a1629	mov	rcx, r14
1458a162c	mov	rdx, r15
1458a162f	call	0x1459bd2c0
1458a1634	nop
1458a1635	mov	rbx, qword ptr [rbp + 0x1c8]
1458a163c	cmp	qword ptr [rbp + 0x1d0], 5
1458a1644	jne	0x1458a1660
1458a1646	cmp	qword ptr [rbx + 8], 4
1458a164b	jne	0x1458a1660
1458a164d	mov	rax, qword ptr [rbx]
1458a1650	cmp	dword ptr [rax], 0x6f726568
1458a1656	je	0x1458a1687
1458a1658	nop	dword ptr [rax + rax]
1458a1660	mov	rdx, qword ptr [rbp + 0x1c0]
1458a1667	test	rdx, rdx
1458a166a	je	0x1458a1490
1458a1670	shl	rdx, 4
1458a1674	mov	r8d, 8
1458a167a	mov	rcx, rbx
1458a167d	call	0x1400021d0
1458a1682	jmp	0x1458a1490
1458a1687	mov	rdx, qword ptr [rbx + 0x18]
1458a168b	test	rdx, rdx
1458a168e	je	0x1458a1660
1458a1690	mov	rcx, qword ptr [rbx + 0x10]
1458a1694	cmp	rdx, 1
1458a1698	jne	0x1458a16a9
1458a169a	movzx	eax, byte ptr [rcx]
1458a169d	cmp	eax, 0x2b
1458a16a0	je	0x1458a1660
1458a16a2	cmp	eax, 0x2d
1458a16a5	je	0x1458a1660
1458a16a7	jmp	0x1458a16ac
1458a16a9	movzx	eax, byte ptr [rcx]
1458a16ac	xor	r8d, r8d
1458a16af	cmp	al, 0x2b
1458a16b1	sete	r8b
1458a16b5	mov	rax, rdx
1458a16b8	sub	rax, r8
1458a16bb	add	rcx, r8
1458a16be	cmp	rax, 3
1458a16c2	jae	0x1458a1701
1458a16c4	test	rax, rax
1458a16c7	je	0x1458a174f
1458a16cd	movzx	r12d, byte ptr [rcx]
1458a16d1	add	r12d, -0x30
1458a16d5	cmp	r12d, 9
1458a16d9	ja	0x1458a1660
1458a16db	cmp	rax, 1
1458a16df	je	0x1458a1752
1458a16e1	movzx	eax, byte ptr [rcx + 1]
1458a16e5	add	eax, -0x30
1458a16e8	cmp	eax, 9
1458a16eb	ja	0x1458a1660
1458a16f1	movzx	ecx, r12b
1458a16f5	add	ecx, ecx
1458a16f7	lea	ecx, [rcx + rcx*4]
1458a16fa	add	al, cl
1458a16fc	mov	r12d, eax
1458a16ff	jmp	0x1458a1752
1458a1701	neg	r8
1458a1704	add	rdx, r8
1458a1707	neg	rdx
1458a170a	xor	r8d, r8d
1458a170d	xor	r12d, r12d
1458a1710	mov	rax, rdx
1458a1713	add	rax, r8
1458a1716	je	0x1458a1752
1458a1718	mov	eax, r12d
1458a171b	mov	r9b, 0xa
1458a171e	mul	r9b
1458a1721	jo	0x1458a1660
1458a1727	mov	r12d, eax
1458a172a	movzx	r9d, byte ptr [rcx + r8]
1458a172f	add	r9d, -0x30
1458a1733	add	r12b, r9b
1458a1736	setb	al
1458a1739	cmp	r9d, 9
1458a173d	ja	0x1458a1660
1458a1743	inc	r8
1458a1746	test	al, al
1458a1748	je	0x1458a1710
1458a174a	jmp	0x1458a1660
1458a174f	xor	r12d, r12d
1458a1752	mov	rdx, qword ptr [rbx + 0x28]
1458a1756	test	rdx, rdx
1458a1759	je	0x1458a1660
1458a175f	mov	rcx, qword ptr [rbx + 0x20]
1458a1763	cmp	rdx, 1
1458a1767	jne	0x1458a1783
1458a1769	movzx	r8d, byte ptr [rcx]
1458a176d	cmp	r8d, 0x2b
1458a1771	je	0x1458a1660
1458a1777	cmp	r8d, 0x2d
1458a177b	je	0x1458a1660
1458a1781	jmp	0x1458a1787
1458a1783	movzx	r8d, byte ptr [rcx]
1458a1787	xor	eax, eax
1458a1789	cmp	r8b, 0x2b
1458a178d	sete	al
1458a1790	mov	r8, rdx
1458a1793	sub	r8, rax
1458a1796	add	rcx, rax
1458a1799	cmp	r8, 3
1458a179d	jae	0x1458a17d7
1458a179f	test	r8, r8
1458a17a2	je	0x1458a1820
1458a17a4	movzx	eax, byte ptr [rcx]
1458a17a7	add	eax, -0x30
1458a17aa	cmp	eax, 9
1458a17ad	ja	0x1458a1660
1458a17b3	cmp	r8, 1
1458a17b7	je	0x1458a1822
1458a17b9	movzx	ecx, byte ptr [rcx + 1]
1458a17bd	add	ecx, -0x30
1458a17c0	cmp	ecx, 9
1458a17c3	ja	0x1458a1660
1458a17c9	movzx	eax, al
1458a17cc	add	eax, eax
1458a17ce	lea	eax, [rax + rax*4]
1458a17d1	add	cl, al
1458a17d3	mov	eax, ecx
1458a17d5	jmp	0x1458a1822
1458a17d7	neg	rax
1458a17da	add	rdx, rax
1458a17dd	neg	rdx
1458a17e0	xor	r8d, r8d
1458a17e3	xor	eax, eax
1458a17e5	mov	r9, rdx
1458a17e8	add	r9, r8
1458a17eb	je	0x1458a1822
1458a17ed	mov	r9b, 0xa
1458a17f0	mul	r9b
1458a17f3	jo	0x1458a1660
1458a17f9	movzx	r10d, byte ptr [rcx + r8]
1458a17fe	add	r10d, -0x30
1458a1802	add	al, r10b
1458a1805	setb	r9b
1458a1809	cmp	r10d, 9
1458a180d	ja	0x1458a1660
1458a1813	inc	r8
1458a1816	test	r9b, r9b
1458a1819	je	0x1458a17e5
1458a181b	jmp	0x1458a1660
1458a1820	xor	eax, eax
1458a1822	lea	ecx, [r12 - 1]
1458a1827	cmp	cl, 0xa
1458a182a	ja	0x1458a1660
1458a1830	movzx	edx, cl
1458a1833	mov	ecx, 0x5df
1458a1838	bt	ecx, edx
1458a183b	jae	0x1458a1660
1458a1841	shl	edx, 3
1458a1844	lea	rcx, [rip + 0x134a245]
1458a184b	mov	rcx, qword ptr [rdx + rcx]
1458a184f	lea	r8, [rip + 0x134a292]
1458a1856	mov	rdx, qword ptr [rdx + r8]
1458a185a	xor	r8d, r8d
1458a185d	cmp	byte ptr [rcx + r8], al
1458a1861	je	0x1458a1870
1458a1863	inc	r8
1458a1866	cmp	rdx, r8
1458a1869	jne	0x1458a185d
1458a186b	jmp	0x1458a1660
1458a1870	mov	rdx, qword ptr [rbx + 0x38]
1458a1874	test	rdx, rdx
1458a1877	je	0x1458a1660
1458a187d	mov	rcx, qword ptr [rbx + 0x30]
1458a1881	cmp	rdx, 1
1458a1885	jne	0x1458a18a1
1458a1887	movzx	r8d, byte ptr [rcx]
1458a188b	cmp	r8d, 0x2b
1458a188f	je	0x1458a1660
1458a1895	cmp	r8d, 0x2d
1458a1899	je	0x1458a1660
1458a189f	jmp	0x1458a18a5
1458a18a1	movzx	r8d, byte ptr [rcx]
1458a18a5	xor	r9d, r9d
1458a18a8	cmp	r8b, 0x2b
1458a18ac	sete	r9b
1458a18b0	mov	r8, rdx
1458a18b3	sub	r8, r9
1458a18b6	add	rcx, r9
1458a18b9	cmp	r8, 3
1458a18bd	mov	dword ptr [rbp + 0x398], eax
1458a18c3	jae	0x1458a18fd
1458a18c5	test	r8, r8
1458a18c8	je	0x1458a1946
1458a18ca	movzx	eax, byte ptr [rcx]
1458a18cd	add	eax, -0x30
1458a18d0	cmp	eax, 9
1458a18d3	ja	0x1458a1660
1458a18d9	cmp	r8, 1
1458a18dd	je	0x1458a1948
1458a18df	movzx	ecx, byte ptr [rcx + 1]
1458a18e3	add	ecx, -0x30
1458a18e6	cmp	ecx, 9
1458a18e9	ja	0x1458a1660
1458a18ef	movzx	eax, al
1458a18f2	add	eax, eax
1458a18f4	lea	eax, [rax + rax*4]
1458a18f7	add	cl, al
1458a18f9	mov	eax, ecx
1458a18fb	jmp	0x1458a1948
1458a18fd	neg	r9
1458a1900	add	rdx, r9
1458a1903	neg	rdx
1458a1906	xor	r8d, r8d
1458a1909	xor	eax, eax
1458a190b	mov	r9, rdx
1458a190e	add	r9, r8
1458a1911	je	0x1458a1948
1458a1913	mov	r9b, 0xa
1458a1916	mul	r9b
1458a1919	jo	0x1458a1660
1458a191f	movzx	r10d, byte ptr [rcx + r8]
1458a1924	add	r10d, -0x30
1458a1928	add	al, r10b
1458a192b	setb	r9b
1458a192f	cmp	r10d, 9
1458a1933	ja	0x1458a1660
1458a1939	inc	r8
1458a193c	test	r9b, r9b
1458a193f	je	0x1458a190b
1458a1941	jmp	0x1458a1660
1458a1946	xor	eax, eax
1458a1948	mov	dword ptr [rbp + 0x318], eax
1458a194e	test	al, al
1458a1950	setne	byte ptr [rbp + 0x380]
1458a1957	mov	rax, qword ptr [rbx + 0x40]
1458a195b	mov	qword ptr [rbp + 0x388], rbx
1458a1962	mov	rcx, qword ptr [rbx + 0x48]
1458a1966	mov	qword ptr [rbp + 0x240], 0
1458a1971	mov	qword ptr [rbp + 0x248], rcx
1458a1978	mov	qword ptr [rbp + 0x250], rax
1458a197f	mov	qword ptr [rbp + 0x258], rcx
1458a1986	mov	qword ptr [rbp + 0x260], 0
1458a1991	mov	qword ptr [rbp + 0x268], rcx
1458a1998	movabs	rax, 0x2c0000002c
1458a19a2	mov	qword ptr [rbp + 0x270], rax
1458a19a9	mov	byte ptr [rbp + 0x278], 1
1458a19b0	mov	word ptr [rbp + 0x280], 1
1458a19b9	lea	rcx, [rbp + 0x320]
1458a19c0	mov	rdx, r15
1458a19c3	call	0x1459c2230
1458a19c8	nop
1458a19c9	cmp	qword ptr [rbp + 0x330], 5
1458a19d1	jne	0x1458a1a21
1458a19d3	mov	rdx, qword ptr [rbp + 0x320]
1458a19da	mov	rcx, qword ptr [rbp + 0x328]
1458a19e1	mov	eax, dword ptr [rcx]
1458a19e3	movzx	r8d, byte ptr [rcx + 4]
1458a19e8	shl	r8, 0x20
1458a19ec	or	r8, rax
1458a19ef	movabs	rax, 0xffffff0000000000
1458a19f9	mov	r9, qword ptr [rbp + 0x238]
1458a1a00	and	r9, rax
1458a1a03	mov	rax, r9
1458a1a06	or	rax, r8
1458a1a09	test	rdx, rdx
1458a1a0c	je	0x1458a1a63
1458a1a0e	mov	r8d, 1
1458a1a14	mov	rbx, rax
1458a1a17	call	0x1400021d0
1458a1a1c	mov	rax, rbx
1458a1a1f	jmp	0x1458a1a63
1458a1a21	mov	rdx, qword ptr [rbp + 0x320]
1458a1a28	mov	rax, qword ptr [rbp + 0x328]
1458a1a2f	cmp	rdx, -1
1458a1a33	je	0x1458a1a63
1458a1a35	mov	qword ptr [rbp + 0x238], rax
1458a1a3c	test	rdx, rdx
1458a1a3f	mov	rbx, qword ptr [rbp + 0x388]
1458a1a46	je	0x1458a1660
1458a1a4c	mov	r8d, 1
1458a1a52	mov	rcx, qword ptr [rbp + 0x238]
1458a1a59	call	0x1400021d0
1458a1a5e	jmp	0x1458a1660
1458a1a63	mov	edx, dword ptr [rbp + 0x398]
1458a1a69	movzx	r8d, byte ptr [rbp + 0x380]
1458a1a71	mov	qword ptr [rbp + 0x238], rax
1458a1a78	mov	rcx, rax
1458a1a7b	call	0x1459a2280
1458a1a80	mov	qword ptr [rbp + 0x380], rax
1458a1a87	xor	ebx, ebx
1458a1a89	cmp	byte ptr [rbp + 0x318], 0
1458a1a90	setne	r8b
1458a1a94	mov	rdx, qword ptr [rbp + 0x1c0]
1458a1a9b	test	rdx, rdx
1458a1a9e	je	0x1458a1ac5
1458a1aa0	shl	rdx, 4
1458a1aa4	mov	byte ptr [rbp + 0x318], r8b
1458a1aab	mov	r8d, 8
1458a1ab1	mov	rcx, qword ptr [rbp + 0x388]
1458a1ab8	call	0x1400021d0
1458a1abd	movzx	r8d, byte ptr [rbp + 0x318]
1458a1ac5	movzx	eax, r12b
1458a1ac9	movzx	ecx, byte ptr [rbp + 0x398]
1458a1ad0	shl	ecx, 8
1458a1ad3	or	rcx, rax
1458a1ad6	mov	bl, r8b
1458a1ad9	shl	ebx, 0x10
1458a1adc	or	rbx, rcx
1458a1adf	mov	r12, qword ptr [rbp + 0x380]
1458a1ae6	shl	r12, 0x18
1458a1aea	or	r12, rbx
1458a1aed	mov	qword ptr [rbp + 0x240], r12
1458a1af4	lea	rcx, [rbp + 0xe0]
1458a1afb	mov	rdx, r15
1458a1afe	call	0x1459b4f30
1458a1b03	mov	rbx, qword ptr [rbp + 0xf0]
1458a1b0a	cmp	rbx, qword ptr [rbp + 0xe0]
1458a1b11	jne	0x1458a1b20
1458a1b13	lea	rcx, [rbp + 0xe0]
1458a1b1a	call	0x145d7e390
1458a1b1f	nop
1458a1b20	mov	rax, qword ptr [rbp + 0xe8]
1458a1b27	mov	qword ptr [rax + rbx*8], r12
1458a1b2b	inc	rbx
1458a1b2e	mov	qword ptr [rbp + 0xf0], rbx
1458a1b35	mov	rbx, rdi
1458a1b38	test	sil, 1
1458a1b3c	je	0x1458a149d
1458a1b42	jmp	0x1458a12b2
1458a1b47	cmp	rdi, -1
1458a1b4b	jne	0x1458a2649
1458a1b51	nop	word ptr cs:[rax + rax]
1458a1b60	movzx	eax, byte ptr [rbp + 0x361]
1458a1b67	mov	rdi, 0xffffffffffffffff
1458a1b6e	test	al, 1
1458a1b70	jne	0x14589e492
1458a1b76	mov	rsi, qword ptr [rbp + 0x330]
1458a1b7d	mov	rcx, r14
1458a1b80	mov	rdx, r15
1458a1b83	call	0x1458aabb0
1458a1b88	nop
1458a1b89	cmp	dword ptr [rbp + 0x240], 1
1458a1b90	jne	0x1458a1bc0
1458a1b92	mov	rdx, qword ptr [rbp + 0x250]
1458a1b99	mov	rax, qword ptr [rbp + 0x320]
1458a1ba0	mov	qword ptr [rbp + 0x320], rdx
1458a1ba7	sub	rdx, rax
1458a1baa	add	rsi, rax
1458a1bad	test	rdx, rdx
1458a1bb0	jne	0x1458a1c02
1458a1bb2	jmp	0x1458a1c30
1458a1bb4	nop	word ptr cs:[rax + rax]
1458a1bc0	cmp	byte ptr [rbp + 0x361], 0
1458a1bc7	jne	0x14589e492
1458a1bcd	mov	byte ptr [rbp + 0x361], 1
1458a1bd4	mov	rsi, qword ptr [rbp + 0x320]
1458a1bdb	mov	rdx, qword ptr [rbp + 0x328]
1458a1be2	sub	rdx, rsi
1458a1be5	setne	al
1458a1be8	or	al, byte ptr [rbp + 0x360]
1458a1bee	cmp	al, 1
1458a1bf0	jne	0x14589e492
1458a1bf6	add	rsi, qword ptr [rbp + 0x330]
1458a1bfd	test	rdx, rdx
1458a1c00	je	0x1458a1c30
1458a1c02	cmp	byte ptr [rsi + rdx - 1], 0xa
1458a1c07	jne	0x1458a1c30
1458a1c09	mov	rax, rdx
1458a1c0c	dec	rax
1458a1c0f	je	0x1458a1c1e
1458a1c11	cmp	byte ptr [rsi + rdx - 2], 0xd
1458a1c16	jne	0x1458a1c22
1458a1c18	add	rdx, -2
1458a1c1c	jmp	0x1458a1c30
1458a1c1e	xor	edx, edx
1458a1c20	jmp	0x1458a1c30
1458a1c22	mov	rdx, rax
1458a1c25	nop	word ptr cs:[rax + rax]
1458a1c30	mov	rcx, rsi
1458a1c33	call	0x140089200
1458a1c38	nop
1458a1c39	mov	qword ptr [rbp + 0x240], 0
1458a1c44	mov	qword ptr [rbp + 0x248], rdx
1458a1c4b	mov	qword ptr [rbp + 0x250], rax
1458a1c52	mov	qword ptr [rbp + 0x258], rdx
1458a1c59	mov	qword ptr [rbp + 0x260], 0
1458a1c64	mov	qword ptr [rbp + 0x268], rdx
1458a1c6b	movabs	rax, 0x7c0000007c
1458a1c75	mov	qword ptr [rbp + 0x270], rax
1458a1c7c	mov	byte ptr [rbp + 0x278], 1
1458a1c83	mov	word ptr [rbp + 0x280], 1
1458a1c8c	mov	rcx, r12
1458a1c8f	mov	rdx, r14
1458a1c92	call	0x1459bd2c0
1458a1c97	nop
1458a1c98	mov	rdi, qword ptr [rbp + 0x230]
1458a1c9f	lea	rax, [rdi - 6]
1458a1ca3	cmp	rax, 3
1458a1ca7	jae	0x1458a1e50
1458a1cad	mov	r11, qword ptr [rbp + 0x228]
1458a1cb4	cmp	qword ptr [r11 + 8], 4
1458a1cb9	jne	0x1458a1e50
1458a1cbf	mov	rax, qword ptr [r11]
1458a1cc2	cmp	dword ptr [rax], 0x6b636970
1458a1cc8	jne	0x1458a1e50
1458a1cce	cmp	rdi, 6
1458a1cd2	jbe	0x1458a1d74
1458a1cd8	mov	rax, qword ptr [r11 + 0x60]
1458a1cdc	mov	qword ptr [rbp + 0x3a8], r11
1458a1ce3	mov	rcx, qword ptr [r11 + 0x68]
1458a1ce7	mov	qword ptr [rbp + 0x240], 0
1458a1cf2	mov	qword ptr [rbp + 0x248], rcx
1458a1cf9	mov	qword ptr [rbp + 0x250], rax
1458a1d00	mov	qword ptr [rbp + 0x258], rcx
1458a1d07	mov	qword ptr [rbp + 0x260], 0
1458a1d12	mov	qword ptr [rbp + 0x268], rcx
1458a1d19	movabs	rax, 0x2c0000002c
1458a1d23	mov	qword ptr [rbp + 0x270], rax
1458a1d2a	mov	byte ptr [rbp + 0x278], 1
1458a1d31	mov	word ptr [rbp + 0x280], 1
1458a1d3a	lea	rcx, [rbp + 0x1c0]
1458a1d41	mov	rdx, r14
1458a1d44	call	0x1459c2230
1458a1d49	nop
1458a1d4a	mov	rdx, qword ptr [rbp + 0x1c0]
1458a1d51	mov	rcx, qword ptr [rbp + 0x1c8]
1458a1d58	mov	rsi, qword ptr [rbp + 0x1d0]
1458a1d5f	mov	r11, qword ptr [rbp + 0x3a8]
1458a1d66	mov	r10, qword ptr [r11 + 0x18]
1458a1d6a	test	r10, r10
1458a1d6d	jne	0x1458a1d8a
1458a1d6f	jmp	0x1458a1e38
1458a1d74	mov	ecx, 1
1458a1d79	xor	edx, edx
1458a1d7b	xor	esi, esi
1458a1d7d	mov	r10, qword ptr [r11 + 0x18]
1458a1d81	test	r10, r10
1458a1d84	je	0x1458a1e38
1458a1d8a	mov	rbx, qword ptr [r11 + 0x10]
1458a1d8e	cmp	r10, 1
1458a1d92	jne	0x1458a1dab
1458a1d94	movzx	eax, byte ptr [rbx]
1458a1d97	cmp	eax, 0x2b
1458a1d9a	je	0x1458a1e38
1458a1da0	cmp	eax, 0x2d
1458a1da3	je	0x1458a1e38
1458a1da9	jmp	0x1458a1dae
1458a1dab	movzx	eax, byte ptr [rbx]
1458a1dae	xor	r8d, r8d
1458a1db1	cmp	al, 0x2b
1458a1db3	sete	r8b
1458a1db7	mov	rax, r10
1458a1dba	sub	rax, r8
1458a1dbd	add	rbx, r8
1458a1dc0	cmp	rax, 3
1458a1dc4	jae	0x1458a1df3
1458a1dc6	test	rax, rax
1458a1dc9	je	0x1458a1e91
1458a1dcf	movzx	r13d, byte ptr [rbx]
1458a1dd3	add	r13d, -0x30
1458a1dd7	cmp	r13d, 9
1458a1ddb	ja	0x1458a1e38
1458a1ddd	cmp	rax, 1
1458a1de1	jne	0x1458a1f2b
1458a1de7	mov	qword ptr [rbp + 0x398], rcx
1458a1dee	jmp	0x1458a1e9b
1458a1df3	neg	r8
1458a1df6	add	r10, r8
1458a1df9	neg	r10
1458a1dfc	xor	r8d, r8d
1458a1dff	xor	r13d, r13d
1458a1e02	mov	rax, r10
1458a1e05	add	rax, r8
1458a1e08	je	0x1458a1f9e
1458a1e0e	mov	eax, r13d
1458a1e11	mov	r9b, 0xa
1458a1e14	mul	r9b
1458a1e17	jo	0x1458a1e38
1458a1e19	mov	r13d, eax
1458a1e1c	movzx	r9d, byte ptr [rbx + r8]
1458a1e21	add	r9d, -0x30
1458a1e25	add	r13b, r9b
1458a1e28	setb	al
1458a1e2b	cmp	r9d, 9
1458a1e2f	ja	0x1458a1e38
1458a1e31	inc	r8
1458a1e34	test	al, al
1458a1e36	je	0x1458a1e02
1458a1e38	test	rdx, rdx
1458a1e3b	je	0x1458a1e50
1458a1e3d	mov	r8d, 1
1458a1e43	call	0x1400021d0
1458a1e48	nop	dword ptr [rax + rax]
1458a1e50	mov	rdx, qword ptr [rbp + 0x220]
1458a1e57	test	rdx, rdx
1458a1e5a	je	0x1458a1b60
1458a1e60	mov	rcx, qword ptr [rbp + 0x228]
1458a1e67	shl	rdx, 4
1458a1e6b	mov	r8d, 8
1458a1e71	call	0x1400021d0
1458a1e76	movzx	eax, byte ptr [rbp + 0x361]
1458a1e7d	mov	rdi, 0xffffffffffffffff
1458a1e84	test	al, 1
1458a1e86	je	0x1458a1b76
1458a1e8c	jmp	0x14589e492
1458a1e91	mov	qword ptr [rbp + 0x398], rcx
1458a1e98	xor	r13d, r13d
1458a1e9b	mov	rbx, qword ptr [r11 + 0x28]
1458a1e9f	test	rbx, rbx
1458a1ea2	je	0x1458a2077
1458a1ea8	mov	rcx, qword ptr [r11 + 0x20]
1458a1eac	cmp	rbx, 1
1458a1eb0	jne	0x1458a1ecc
1458a1eb2	movzx	r8d, byte ptr [rcx]
1458a1eb6	cmp	r8d, 0x2b
1458a1eba	je	0x1458a2077
1458a1ec0	cmp	r8d, 0x2d
1458a1ec4	je	0x1458a2077
1458a1eca	jmp	0x1458a1ed0
1458a1ecc	movzx	r8d, byte ptr [rcx]
1458a1ed0	xor	eax, eax
1458a1ed2	cmp	r8b, 0x2b
1458a1ed6	sete	al
1458a1ed9	mov	r8, rbx
1458a1edc	sub	r8, rax
1458a1edf	add	rcx, rax
1458a1ee2	cmp	r8, 3
1458a1ee6	jae	0x1458a1f55
1458a1ee8	test	r8, r8
1458a1eeb	je	0x1458a1fb4
1458a1ef1	movzx	eax, byte ptr [rcx]
1458a1ef4	add	eax, -0x30
1458a1ef7	cmp	eax, 9
1458a1efa	ja	0x1458a2077
1458a1f00	cmp	r8, 1
1458a1f04	je	0x1458a1fb6
1458a1f0a	movzx	ecx, byte ptr [rcx + 1]
1458a1f0e	add	ecx, -0x30
1458a1f11	cmp	ecx, 9
1458a1f14	ja	0x1458a2077
1458a1f1a	movzx	eax, al
1458a1f1d	add	eax, eax
1458a1f1f	lea	eax, [rax + rax*4]
1458a1f22	add	cl, al
1458a1f24	mov	eax, ecx
1458a1f26	jmp	0x1458a1fb6
1458a1f2b	movzx	eax, byte ptr [rbx + 1]
1458a1f2f	add	eax, -0x30
1458a1f32	cmp	eax, 9
1458a1f35	ja	0x1458a1e38
1458a1f3b	mov	qword ptr [rbp + 0x398], rcx
1458a1f42	movzx	ecx, r13b
1458a1f46	add	ecx, ecx
1458a1f48	lea	ecx, [rcx + rcx*4]
1458a1f4b	add	al, cl
1458a1f4d	mov	r13d, eax
1458a1f50	jmp	0x1458a1e9b
1458a1f55	neg	rax
1458a1f58	add	rbx, rax
1458a1f5b	neg	rbx
1458a1f5e	xor	r8d, r8d
1458a1f61	xor	eax, eax
1458a1f63	mov	r9, rbx
1458a1f66	add	r9, r8
1458a1f69	je	0x1458a1fb6
1458a1f6b	mov	r9b, 0xa
1458a1f6e	mul	r9b
1458a1f71	jo	0x1458a2077
1458a1f77	movzx	r10d, byte ptr [rcx + r8]
1458a1f7c	add	r10d, -0x30
1458a1f80	add	al, r10b
1458a1f83	setb	r9b
1458a1f87	cmp	r10d, 9
1458a1f8b	ja	0x1458a2077
1458a1f91	inc	r8
1458a1f94	test	r9b, r9b
1458a1f97	je	0x1458a1f63
1458a1f99	jmp	0x1458a2077
1458a1f9e	mov	qword ptr [rbp + 0x398], rcx
1458a1fa5	cmp	rdi, 2
1458a1fa9	jne	0x1458a1e9b
1458a1faf	jmp	0x1458a28d8
1458a1fb4	xor	eax, eax
1458a1fb6	mov	rbx, qword ptr [r11 + 0x38]
1458a1fba	test	rbx, rbx
1458a1fbd	je	0x1458a2077
1458a1fc3	mov	rcx, qword ptr [r11 + 0x30]
1458a1fc7	cmp	rbx, 1
1458a1fcb	jne	0x1458a1fe7
1458a1fcd	movzx	r8d, byte ptr [rcx]
1458a1fd1	cmp	r8d, 0x2b
1458a1fd5	je	0x1458a2077
1458a1fdb	cmp	r8d, 0x2d
1458a1fdf	je	0x1458a2077
1458a1fe5	jmp	0x1458a1feb
1458a1fe7	movzx	r8d, byte ptr [rcx]
1458a1feb	xor	r9d, r9d
1458a1fee	cmp	r8b, 0x2b
1458a1ff2	sete	r9b
1458a1ff6	mov	r8, rbx
1458a1ff9	sub	r8, r9
1458a1ffc	add	rcx, r9
1458a1fff	cmp	r8, 3
1458a2003	mov	dword ptr [rbp + 0x388], eax
1458a2009	jae	0x1458a203b
1458a200b	test	r8, r8
1458a200e	je	0x1458a208c
1458a2010	movzx	eax, byte ptr [rcx]
1458a2013	add	eax, -0x30
1458a2016	cmp	eax, 9
1458a2019	ja	0x1458a2077
1458a201b	cmp	r8, 1
1458a201f	je	0x1458a208e
1458a2021	movzx	ecx, byte ptr [rcx + 1]
1458a2025	add	ecx, -0x30
1458a2028	cmp	ecx, 0xa
1458a202b	jae	0x1458a2077
1458a202d	movzx	eax, al
1458a2030	add	eax, eax
1458a2032	lea	eax, [rax + rax*4]
1458a2035	add	cl, al
1458a2037	mov	eax, ecx
1458a2039	jmp	0x1458a208e
1458a203b	neg	r9
1458a203e	add	rbx, r9
1458a2041	neg	rbx
1458a2044	xor	r8d, r8d
1458a2047	xor	eax, eax
1458a2049	mov	r9, rbx
1458a204c	add	r9, r8
1458a204f	je	0x1458a208e
1458a2051	mov	r9b, 0xa
1458a2054	mul	r9b
1458a2057	jo	0x1458a2077
1458a2059	movzx	r10d, byte ptr [rcx + r8]
1458a205e	add	r10d, -0x30
1458a2062	add	al, r10b
1458a2065	setb	r9b
1458a2069	cmp	r10d, 9
1458a206d	ja	0x1458a2077
1458a206f	inc	r8
1458a2072	test	r9b, r9b
1458a2075	je	0x1458a2049
1458a2077	test	rdx, rdx
1458a207a	mov	rcx, qword ptr [rbp + 0x398]
1458a2081	jne	0x1458a1e3d
1458a2087	jmp	0x1458a1e50
1458a208c	xor	eax, eax
1458a208e	mov	dword ptr [rbp + 0x318], eax
1458a2094	mov	qword ptr [rbp + 0x238], rdx
1458a209b	cmp	rdi, 4
1458a209f	mov	qword ptr [rbp + 0x3a8], r11
1458a20a6	je	0x1458a2906
1458a20ac	mov	rax, qword ptr [r11 + 0x40]
1458a20b0	mov	qword ptr [rbp + 0x1b8], rax
1458a20b7	mov	rbx, qword ptr [r11 + 0x48]
1458a20bb	mov	qword ptr [rsp + 0x20], 1
1458a20c4	mov	r9d, 1
1458a20ca	lea	rcx, [rbp + 0x58]
1458a20ce	mov	rdx, rbx
1458a20d1	xor	r8d, r8d
1458a20d4	call	0x1400539a0
1458a20d9	mov	rax, qword ptr [rbp + 0x60]
1458a20dd	mov	qword ptr [rbp + 0x170], rax
1458a20e4	cmp	byte ptr [rbp + 0x58], 0
1458a20e8	jne	0x1458a27b4
1458a20ee	mov	rax, qword ptr [rbp + 0x68]
1458a20f2	test	rbx, rbx
1458a20f5	mov	qword ptr [rbp + 0x380], rax
1458a20fc	je	0x1458a2114
1458a20fe	mov	rcx, qword ptr [rbp + 0x380]
1458a2105	mov	rdx, qword ptr [rbp + 0x1b8]
1458a210c	mov	r8, rbx
1458a210f	call	0x145bfa0e7
1458a2114	mov	qword ptr [rbp + 0x20], rbx
1458a2118	mov	rax, qword ptr [rbp + 0x3a8]
1458a211f	mov	rcx, qword ptr [rax + 0x50]
1458a2123	mov	qword ptr [rbp + 0x180], rcx
1458a212a	mov	rbx, qword ptr [rax + 0x58]
1458a212e	mov	qword ptr [rsp + 0x20], 1
1458a2137	mov	r9d, 1
1458a213d	lea	rcx, [rbp + 0x58]
1458a2141	mov	rdx, rbx
1458a2144	xor	r8d, r8d
1458a2147	call	0x1400539a0
1458a214c	movzx	eax, byte ptr [rbp + 0x58]
1458a2150	mov	rcx, qword ptr [rbp + 0x60]
1458a2154	mov	qword ptr [rbp + 0x178], rcx
1458a215b	mov	byte ptr [rbp + 0x36f], al
1458a2161	test	al, al
1458a2163	jne	0x1458a27d1
1458a2169	mov	r10, qword ptr [rbp + 0x68]
1458a216d	test	rbx, rbx
1458a2170	mov	r9, rbx
1458a2173	mov	qword ptr [rbp + 0x1b8], rbx
1458a217a	je	0x1458a219b
1458a217c	mov	rcx, r10
1458a217f	mov	rdx, qword ptr [rbp + 0x180]
1458a2186	mov	r8, r9
1458a2189	mov	rbx, r10
1458a218c	call	0x145bfa0e7
1458a2191	mov	r10, rbx
1458a2194	mov	r9, qword ptr [rbp + 0x1b8]
1458a219b	cmp	rsi, 5
1458a219f	jne	0x1458a21f9
1458a21a1	mov	rcx, qword ptr [rbp + 0x398]
1458a21a8	mov	eax, dword ptr [rcx]
1458a21aa	movzx	edx, byte ptr [rcx + 4]
1458a21ae	shl	rdx, 0x20
1458a21b2	or	rdx, rax
1458a21b5	movabs	rax, 0xffffff0000000000
1458a21bf	mov	rsi, qword ptr [rbp + 0x138]
1458a21c6	and	rsi, rax
1458a21c9	or	rsi, rdx
1458a21cc	mov	rdx, qword ptr [rbp + 0x238]
1458a21d3	test	rdx, rdx
1458a21d6	je	0x1458a2212
1458a21d8	mov	r8d, 1
1458a21de	mov	rbx, r10
1458a21e1	call	0x1400021d0
1458a21e6	mov	r10, rbx
1458a21e9	mov	r9, qword ptr [rbp + 0x1b8]
1458a21f0	mov	qword ptr [rbp + 0x138], rsi
1458a21f7	jmp	0x1458a225d
1458a21f9	mov	rax, qword ptr [rbp + 0x238]
1458a2200	test	rax, rax
1458a2203	je	0x1458a221b
1458a2205	mov	rsi, qword ptr [rbp + 0x398]
1458a220c	cmp	rax, -1
1458a2210	jne	0x1458a222b
1458a2212	mov	qword ptr [rbp + 0x138], rsi
1458a2219	jmp	0x1458a225d
1458a221b	mov	rax, qword ptr [rbp + 0x398]
1458a2222	mov	qword ptr [rbp + 0x138], rax
1458a2229	jmp	0x1458a225b
1458a222b	mov	r8d, 1
1458a2231	mov	rsi, qword ptr [rbp + 0x398]
1458a2238	mov	rcx, rsi
1458a223b	mov	rdx, qword ptr [rbp + 0x238]
1458a2242	mov	rbx, r10
1458a2245	call	0x1400021d0
1458a224a	mov	r10, rbx
1458a224d	mov	r9, qword ptr [rbp + 0x1b8]
1458a2254	mov	qword ptr [rbp + 0x138], rsi
1458a225b	xor	esi, esi
1458a225d	mov	ecx, dword ptr [rbp + 0x388]
1458a2263	mov	edx, dword ptr [rbp + 0x318]
1458a2269	mov	r8, qword ptr [rbp + 0x380]
1458a2270	movabs	rax, 0x64006400640064
1458a227a	cmp	rdi, 8
1458a227e	mov	rbx, qword ptr [rbp + 0x20]
1458a2282	jb	0x1458a22c0
1458a2284	mov	qword ptr [rbp + 0x180], r10
1458a228b	mov	rdi, r9
1458a228e	mov	rax, qword ptr [rbp + 0x3a8]
1458a2295	mov	rcx, qword ptr [rax + 0x70]
1458a2299	mov	rdx, qword ptr [rax + 0x78]
1458a229d	call	0x14590e190
1458a22a2	nop
1458a22a3	mov	ecx, dword ptr [rbp + 0x388]
1458a22a9	mov	edx, dword ptr [rbp + 0x318]
1458a22af	mov	r8, qword ptr [rbp + 0x380]
1458a22b6	mov	r9, rdi
1458a22b9	mov	r10, qword ptr [rbp + 0x180]
1458a22c0	mov	byte ptr [rbp + 0x278], r13b
1458a22c7	mov	byte ptr [rbp + 0x279], cl
1458a22cd	mov	byte ptr [rbp + 0x27a], dl
1458a22d3	mov	rcx, qword ptr [rbp + 0x178]
1458a22da	mov	qword ptr [rbp + 0x240], rcx
1458a22e1	mov	qword ptr [rbp + 0x248], r10
1458a22e8	mov	qword ptr [rbp + 0x250], r9
1458a22ef	mov	rcx, qword ptr [rbp + 0x170]
1458a22f6	mov	qword ptr [rbp + 0x258], rcx
1458a22fd	mov	qword ptr [rbp + 0x260], r8
1458a2304	mov	qword ptr [rbp + 0x268], rbx
1458a230b	mov	dword ptr [rbp + 0x27b], esi
1458a2311	shr	rsi, 0x20
1458a2315	mov	byte ptr [rbp + 0x27f], sil
1458a231c	mov	qword ptr [rbp + 0x270], rax
1458a2323	mov	byte ptr [rbp + 0x3a7], 0
1458a232a	lea	rcx, [rbp + 0x1c0]
1458a2331	mov	rdx, r14
1458a2334	call	0x1458a7fc0
1458a2339	nop
1458a233a	mov	rdi, qword ptr [rbp + 0x1c0]
1458a2341	lea	rax, [rbp + 0x1c8]
1458a2348	movups	xmm0, xmmword ptr [rax]
1458a234b	movups	xmm1, xmmword ptr [rax + 0x10]
1458a234f	movups	xmm2, xmmword ptr [rax + 0x20]
1458a2353	movaps	xmmword ptr [rbp + 0xe0], xmm0
1458a235a	movaps	xmmword ptr [rbp + 0xf0], xmm1
1458a2361	movaps	xmmword ptr [rbp + 0x100], xmm2
1458a2368	mov	rax, qword ptr [rax + 0x30]
1458a236c	mov	qword ptr [rbp + 0x110], rax
1458a2373	mov	rdx, qword ptr [rbp + 0x220]
1458a237a	test	rdx, rdx
1458a237d	je	0x1458a1b47
1458a2383	shl	rdx, 4
1458a2387	mov	r8d, 8
1458a238d	mov	rcx, qword ptr [rbp + 0x3a8]
1458a2394	call	0x1400021d0
1458a2399	jmp	0x1458a1b47
1458a239e	mov	rsi, qword ptr [rbp + 0xd0]
1458a23a5	cmp	r14, 0x15
1458a23a9	jae	0x1458a2839
1458a23af	lea	rax, [rsi + r14*4]
1458a23b3	lea	rcx, [rsi + 4]
1458a23b7	mov	edx, 4
1458a23bc	jmp	0x1458a23d1
1458a23be	mov	r9, rsi
1458a23c1	mov	dword ptr [r9], r8d
1458a23c4	add	rcx, 4
1458a23c8	add	rdx, 4
1458a23cc	cmp	rcx, rax
1458a23cf	je	0x1458a23fd
1458a23d1	mov	r10d, dword ptr [rcx - 4]
1458a23d5	mov	r8d, dword ptr [rcx]
1458a23d8	cmp	r8d, r10d
1458a23db	jae	0x1458a23c4
1458a23dd	mov	r9, rdx
1458a23e0	mov	dword ptr [rsi + r9], r10d
1458a23e4	cmp	r9, 4
1458a23e8	je	0x1458a23be
1458a23ea	mov	r10d, dword ptr [rsi + r9 - 8]
1458a23ef	add	r9, -4
1458a23f3	cmp	r8d, r10d
1458a23f6	jb	0x1458a23e0
1458a23f8	add	r9, rsi
1458a23fb	jmp	0x1458a23c1
1458a23fd	mov	r14, qword ptr [rbp + 0xd8]
1458a2404	cmp	r14, 2
1458a2408	jb	0x14589ed77
1458a240e	mov	rsi, qword ptr [rbp + 0xd0]
1458a2415	lea	rax, [r14 - 1]
1458a2419	xor	edx, edx
1458a241b	mov	ecx, dword ptr [rsi + rdx*4 + 4]
1458a241f	cmp	ecx, dword ptr [rsi + rdx*4]
1458a2422	je	0x1458a2680
1458a2428	inc	rdx
1458a242b	cmp	rax, rdx
1458a242e	jne	0x1458a241b
1458a2430	jmp	0x14589ed77
1458a2435	mov	r14, qword ptr [rbp + 0x190]
1458a243c	cmp	rsi, 0x15
1458a2440	jae	0x1458a2851
1458a2446	shl	rsi, 5
1458a244a	mov	edi, 0x20
1458a244f	lea	rdx, [r14 + rdi]
1458a2453	mov	rcx, r14
1458a2456	call	0x1459a98d0
1458a245b	add	rdi, 0x20
1458a245f	cmp	rsi, rdi
1458a2462	jne	0x1458a244f
1458a2464	jmp	0x1458a017d
1458a2469	mov	rcx, qword ptr [rbp + 0x48]
1458a246d	cmp	rdx, 0x15
1458a2471	jae	0x1458a2869
1458a2477	lea	r9, [rbp + 0x3b7]
1458a247e	mov	r8d, 1
1458a2484	call	0x1400f2c00
1458a2489	jmp	0x1458a021e
1458a248e	mov	r14, qword ptr [rbp + 0x30]
1458a2492	cmp	rsi, 0x15
1458a2496	jae	0x1458a287b
1458a249c	shl	rsi, 5
1458a24a0	mov	edi, 0x20
1458a24a5	lea	rdx, [r14 + rdi]
1458a24a9	mov	rcx, r14
1458a24ac	call	0x1459a99e0
1458a24b1	add	rdi, 0x20
1458a24b5	cmp	rsi, rdi
1458a24b8	jne	0x1458a24a5
1458a24ba	jmp	0x1458a02bc
1458a24bf	cmp	rsi, 0x15
1458a24c3	jae	0x1458a2893
1458a24c9	lea	r9, [rbp + 0x3b7]
1458a24d0	mov	r8d, 1
1458a24d6	mov	rdx, rsi
1458a24d9	call	0x1459af240
1458a24de	mov	rcx, qword ptr [rbp + 0x148]
1458a24e5	mov	rsi, qword ptr [rbp + 0x150]
1458a24ec	cmp	rsi, 2
1458a24f0	jb	0x1458a08dc
1458a24f6	mov	eax, 1
1458a24fb	mov	edx, 0x20
1458a2500	jmp	0x1458a2512
1458a2502	inc	rax
1458a2505	add	rdx, 0x10
1458a2509	cmp	rsi, rax
1458a250c	je	0x1458a08dc
1458a2512	movzx	r8d, byte ptr [rcx + rdx - 0x10]
1458a2518	cmp	r8b, byte ptr [rcx + rdx - 0x20]
1458a251d	jne	0x1458a2502
1458a251f	mov	r8, qword ptr [rcx + rdx - 0x18]
1458a2524	cmp	qword ptr [rcx + rdx - 8], r8
1458a2529	jne	0x1458a2502
1458a252b	lea	r8, [rax + 1]
1458a252f	cmp	r8, rsi
1458a2532	jae	0x1458a2779
1458a2538	shl	rsi, 4
1458a253c	jmp	0x1458a255d
1458a253e	lea	r9, [rcx + rdx]
1458a2542	add	r8, rcx
1458a2545	movups	xmm0, xmmword ptr [r9]
1458a2549	movups	xmmword ptr [r8], xmm0
1458a254d	inc	rax
1458a2550	add	rdx, 0x10
1458a2554	cmp	rsi, rdx
1458a2557	je	0x1458a2772
1458a255d	mov	r8, rax
1458a2560	shl	r8, 4
1458a2564	movzx	r9d, byte ptr [rcx + rdx]
1458a2569	cmp	r9b, byte ptr [rcx + r8 - 0x10]
1458a256e	jne	0x1458a253e
1458a2570	mov	r9, qword ptr [rcx + r8 - 8]
1458a2575	cmp	qword ptr [rcx + rdx + 8], r9
1458a257a	je	0x1458a2550
1458a257c	jmp	0x1458a253e
1458a257e	mov	r14, qword ptr [rbp + 0xb8]
1458a2585	cmp	rsi, 0x15
1458a2589	jae	0x1458a28a8
1458a258f	shl	rsi, 5
1458a2593	mov	edi, 0x20
1458a2598	lea	rdx, [r14 + rdi]
1458a259c	mov	rcx, r14
1458a259f	call	0x1459a98d0
1458a25a4	add	rdi, 0x20
1458a25a8	cmp	rsi, rdi
1458a25ab	jne	0x1458a2598
1458a25ad	jmp	0x1458a098b
1458a25b2	mov	rsi, qword ptr [rbp + 0x128]
1458a25b9	cmp	r14, 0x15
1458a25bd	jae	0x1458a28c0
1458a25c3	lea	rax, [rsi + r14*4]
1458a25c7	lea	rcx, [rsi + 4]
1458a25cb	mov	edx, 4
1458a25d0	jmp	0x1458a25e5
1458a25d2	mov	r9, rsi
1458a25d5	mov	dword ptr [r9], r8d
1458a25d8	add	rcx, 4
1458a25dc	add	rdx, 4
1458a25e0	cmp	rcx, rax
1458a25e3	je	0x1458a2611
1458a25e5	mov	r10d, dword ptr [rcx - 4]
1458a25e9	mov	r8d, dword ptr [rcx]
1458a25ec	cmp	r8d, r10d
1458a25ef	jae	0x1458a25d8
1458a25f1	mov	r9, rdx
1458a25f4	mov	dword ptr [rsi + r9], r10d
1458a25f8	cmp	r9, 4
1458a25fc	je	0x1458a25d2
1458a25fe	mov	r10d, dword ptr [rsi + r9 - 8]
1458a2603	add	r9, -4
1458a2607	cmp	r8d, r10d
1458a260a	jb	0x1458a25f4
1458a260c	add	r9, rsi
1458a260f	jmp	0x1458a25d5
1458a2611	mov	r14, qword ptr [rbp + 0x130]
1458a2618	cmp	r14, 2
1458a261c	jb	0x1458a0a32
1458a2622	mov	rsi, qword ptr [rbp + 0x128]
1458a2629	lea	rax, [r14 - 1]
1458a262d	xor	edx, edx
1458a262f	mov	ecx, dword ptr [rsi + rdx*4 + 4]
1458a2633	cmp	ecx, dword ptr [rsi + rdx*4]
1458a2636	je	0x1458a26f9
1458a263c	inc	rdx
1458a263f	cmp	rax, rdx
1458a2642	jne	0x1458a262f
1458a2644	jmp	0x1458a0a32
1458a2649	mov	rax, qword ptr [rbp + 0x110]
1458a2650	mov	qword ptr [rbp + 0x90], rax
1458a2657	movaps	xmm0, xmmword ptr [rbp + 0xe0]
1458a265e	movaps	xmm1, xmmword ptr [rbp + 0xf0]
1458a2665	movaps	xmm2, xmmword ptr [rbp + 0x100]
1458a266c	movups	xmmword ptr [rbp + 0x80], xmm2
1458a2673	movups	xmmword ptr [rbp + 0x70], xmm1
1458a2677	movups	xmmword ptr [rbp + 0x60], xmm0
1458a267b	jmp	0x14589e492
1458a2680	lea	rcx, [rdx + 2]
1458a2684	lea	rax, [rdx + 1]
1458a2688	cmp	rcx, r14
1458a268b	jae	0x1458a26b7
1458a268d	mov	r9d, r14d
1458a2690	sub	r9d, edx
1458a2693	lea	r8, [r14 - 3]
1458a2697	test	r9b, 1
1458a269b	je	0x1458a26b2
1458a269d	mov	ecx, dword ptr [rsi + rdx*4 + 8]
1458a26a1	cmp	ecx, dword ptr [rsi + rdx*4]
1458a26a4	je	0x1458a26ae
1458a26a6	mov	dword ptr [rsi + rdx*4 + 4], ecx
1458a26aa	lea	rax, [rdx + 2]
1458a26ae	lea	rcx, [rdx + 3]
1458a26b2	cmp	r8, rdx
1458a26b5	jne	0x1458a26cc
1458a26b7	mov	qword ptr [rbp + 0xd8], rax
1458a26be	jmp	0x14589ed77
1458a26c3	add	rcx, 2
1458a26c7	cmp	r14, rcx
1458a26ca	je	0x1458a26b7
1458a26cc	mov	edx, dword ptr [rsi + rcx*4]
1458a26cf	cmp	edx, dword ptr [rsi + rax*4 - 4]
1458a26d3	jne	0x1458a26e1
1458a26d5	mov	edx, dword ptr [rsi + rcx*4 + 4]
1458a26d9	cmp	edx, dword ptr [rsi + rax*4 - 4]
1458a26dd	je	0x1458a26c3
1458a26df	jmp	0x1458a26f1
1458a26e1	mov	dword ptr [rsi + rax*4], edx
1458a26e4	inc	rax
1458a26e7	mov	edx, dword ptr [rsi + rcx*4 + 4]
1458a26eb	cmp	edx, dword ptr [rsi + rax*4 - 4]
1458a26ef	je	0x1458a26c3
1458a26f1	mov	dword ptr [rsi + rax*4], edx
1458a26f4	inc	rax
1458a26f7	jmp	0x1458a26c3
1458a26f9	lea	rcx, [rdx + 2]
1458a26fd	lea	rax, [rdx + 1]
1458a2701	cmp	rcx, r14
1458a2704	jae	0x1458a2730
1458a2706	mov	r9d, r14d
1458a2709	sub	r9d, edx
1458a270c	lea	r8, [r14 - 3]
1458a2710	test	r9b, 1
1458a2714	je	0x1458a272b
1458a2716	mov	ecx, dword ptr [rsi + rdx*4 + 8]
1458a271a	cmp	ecx, dword ptr [rsi + rdx*4]
1458a271d	je	0x1458a2727
1458a271f	mov	dword ptr [rsi + rdx*4 + 4], ecx
1458a2723	lea	rax, [rdx + 2]
1458a2727	lea	rcx, [rdx + 3]
1458a272b	cmp	r8, rdx
1458a272e	jne	0x1458a2745
1458a2730	mov	qword ptr [rbp + 0x130], rax
1458a2737	jmp	0x1458a0a32
1458a273c	add	rcx, 2
1458a2740	cmp	r14, rcx
1458a2743	je	0x1458a2730
1458a2745	mov	edx, dword ptr [rsi + rcx*4]
1458a2748	cmp	edx, dword ptr [rsi + rax*4 - 4]
1458a274c	jne	0x1458a275a
1458a274e	mov	edx, dword ptr [rsi + rcx*4 + 4]
1458a2752	cmp	edx, dword ptr [rsi + rax*4 - 4]
1458a2756	je	0x1458a273c
1458a2758	jmp	0x1458a276a
1458a275a	mov	dword ptr [rsi + rax*4], edx
1458a275d	inc	rax
1458a2760	mov	edx, dword ptr [rsi + rcx*4 + 4]
1458a2764	cmp	edx, dword ptr [rsi + rax*4 - 4]
1458a2768	je	0x1458a273c
1458a276a	mov	dword ptr [rsi + rax*4], edx
1458a276d	inc	rax
1458a2770	jmp	0x1458a273c
1458a2772	mov	rcx, qword ptr [rbp + 0x148]
1458a2779	mov	qword ptr [rbp + 0x150], rax
1458a2780	mov	rsi, rax
1458a2783	jmp	0x1458a08dc
1458a2788	lea	r8, [rip + 0x1349009]
1458a278f	mov	rcx, rsi
1458a2792	call	0x145d99653
1458a2797	nop
1458a2798	jmp	0x1458a2924
1458a279d	lea	r8, [rip + 0x134900c]
1458a27a4	mov	edx, 0x13
1458a27a9	call	0x145d99653
1458a27ae	nop
1458a27af	jmp	0x1458a2924
1458a27b4	mov	rdx, qword ptr [rbp + 0x68]
1458a27b8	mov	byte ptr [rbp + 0x3a7], 1
1458a27bf	mov	rcx, qword ptr [rbp + 0x170]
1458a27c6	call	0x145d992bb
1458a27cb	nop
1458a27cc	jmp	0x1458a2924
1458a27d1	mov	rdx, qword ptr [rbp + 0x68]
1458a27d5	mov	rcx, qword ptr [rbp + 0x178]
1458a27dc	call	0x145d992bb
1458a27e1	nop
1458a27e2	jmp	0x1458a2924
1458a27e7	lea	r8, [rip + 0x1348f82]
1458a27ee	mov	edx, 3
1458a27f3	mov	rcx, r12
1458a27f6	call	0x145d99653
1458a27fb	nop
1458a27fc	jmp	0x1458a2924
1458a2801	lea	r8, [rip + 0x1348fc0]
1458a2808	mov	rcx, rsi
1458a280b	call	0x145d99653
1458a2810	nop
1458a2811	jmp	0x1458a2924
1458a2816	lea	r8, [rip + 0x1348fc3]
1458a281d	mov	edx, 0x13
1458a2822	call	0x145d99653
1458a2827	nop
1458a2828	jmp	0x1458a2924
1458a282d	mov	qword ptr [rbp + 0x380], r14
1458a2834	jmp	0x1458a0e56
1458a2839	lea	r8, [rbp + 0x3b7]
1458a2840	mov	rcx, rsi
1458a2843	mov	rdx, r14
1458a2846	call	0x145b199b0
1458a284b	nop
1458a284c	jmp	0x1458a2415
1458a2851	lea	r8, [rbp + 0x3b7]
1458a2858	mov	rcx, r14
1458a285b	mov	rdx, rsi
1458a285e	call	0x1459de1d0
1458a2863	nop
1458a2864	jmp	0x1458a017d
1458a2869	lea	r8, [rbp + 0x3b7]
1458a2870	call	0x145ae0500
1458a2875	nop
1458a2876	jmp	0x1458a021e
1458a287b	lea	r8, [rbp + 0x3b7]
1458a2882	mov	rcx, r14
1458a2885	mov	rdx, rsi
1458a2888	call	0x1459de370
1458a288d	nop
1458a288e	jmp	0x1458a02bc
1458a2893	lea	r8, [rbp + 0x3b7]
1458a289a	mov	rdx, rsi
1458a289d	call	0x1459a91e0
1458a28a2	nop
1458a28a3	jmp	0x1458a24de
1458a28a8	lea	r8, [rbp + 0x3b7]
1458a28af	mov	rcx, r14
1458a28b2	mov	rdx, rsi
1458a28b5	call	0x1459de1d0
1458a28ba	nop
1458a28bb	jmp	0x1458a098b
1458a28c0	lea	r8, [rbp + 0x3b7]
1458a28c7	mov	rcx, rsi
1458a28ca	mov	rdx, r14
1458a28cd	call	0x145b199b0
1458a28d2	nop
1458a28d3	jmp	0x1458a2629
1458a28d8	mov	qword ptr [rbp + 0x238], rdx
1458a28df	mov	qword ptr [rbp + 0x3a8], r11
1458a28e6	mov	byte ptr [rbp + 0x3a7], 1
1458a28ed	lea	r8, [rip + 0x1349054]
1458a28f4	mov	ecx, 2
1458a28f9	mov	edx, 2
1458a28fe	call	0x145d99653
1458a2903	nop
1458a2904	jmp	0x1458a2924
1458a2906	mov	byte ptr [rbp + 0x3a7], 1
1458a290d	lea	r8, [rip + 0x134904c]
1458a2914	mov	ecx, 4
1458a2919	mov	edx, 4
1458a291e	call	0x145d99653
1458a2923	nop
1458a2924	ud2
