145a5dfc0	push	r15
145a5dfc2	push	r14
145a5dfc4	push	r13
145a5dfc6	push	r12
145a5dfc8	push	rsi
145a5dfc9	push	rdi
145a5dfca	push	rbp
145a5dfcb	push	rbx
145a5dfcc	sub	rsp, 0xc8
145a5dfd3	mov	r9, r8
145a5dfd6	mov	qword ptr [rsp + 0x90], rcx
145a5dfde	movzx	eax, byte ptr [rip + 0x262c8cb]
145a5dfe5	cmp	al, 1
145a5dfe7	je	0x145a5f322
145a5dfed	movzx	eax, al
145a5dff0	cmp	eax, 0xff
145a5dff5	je	0x145a5f309
145a5dffb	mov	rax, qword ptr [rsp + 0x90]
145a5e003	mov	esi, dword ptr [rax]
145a5e005	mov	r10d, dword ptr [rax + 4]
145a5e009	mov	edi, dword ptr [rax + 8]
145a5e00c	mov	r11d, dword ptr [rax + 0xc]
145a5e010	mov	eax, dword ptr [rax + 0x10]
145a5e013	test	r9, r9
145a5e016	je	0x145a5f2d9
145a5e01c	shl	r9, 6
145a5e020	add	r9, rdx
145a5e023	mov	qword ptr [rsp + 0xa8], r9
145a5e02b	nop	dword ptr [rax + rax]
145a5e030	mov	qword ptr [rsp + 0xb8], rdi
145a5e038	mov	dword ptr [rsp + 0x9c], esi
145a5e03f	mov	dword ptr [rsp + 0xa4], r11d
145a5e047	mov	qword ptr [rsp + 0xc0], r10
145a5e04f	mov	r8d, eax
145a5e052	mov	dword ptr [rsp + 0xa0], eax
145a5e059	mov	r12d, dword ptr [rdx]
145a5e05c	mov	eax, dword ptr [rdx + 4]
145a5e05f	bswap	r12d
145a5e062	bswap	eax
145a5e064	mov	ebp, eax
145a5e066	mov	dword ptr [rsp + 0x58], eax
145a5e06a	mov	eax, dword ptr [rdx + 8]
145a5e06d	bswap	eax
145a5e06f	mov	r13, rax
145a5e072	mov	ecx, dword ptr [rdx + 0xc]
145a5e075	bswap	ecx
145a5e077	mov	rax, rcx
145a5e07a	mov	qword ptr [rsp + 0x40], rcx
145a5e07f	mov	ecx, dword ptr [rdx + 0x10]
145a5e082	mov	rbx, rdx
145a5e085	bswap	ecx
145a5e087	mov	r14d, ecx
145a5e08a	mov	dword ptr [rsp + 0x28], ecx
145a5e08e	mov	ecx, esi
145a5e090	rol	ecx, 5
145a5e093	mov	edx, r11d
145a5e096	xor	edx, edi
145a5e098	and	edx, r10d
145a5e09b	xor	edx, r11d
145a5e09e	add	ecx, r8d
145a5e0a1	add	ecx, edx
145a5e0a3	lea	r8d, [r12 + rcx]
145a5e0a7	add	r8d, 0x5a827999
145a5e0ae	mov	edx, r10d
145a5e0b1	rol	edx, 0x1e
145a5e0b4	mov	ecx, r8d
145a5e0b7	rol	ecx, 5
145a5e0ba	mov	r9d, edx
145a5e0bd	xor	r9d, edi
145a5e0c0	and	r9d, esi
145a5e0c3	xor	r9d, edi
145a5e0c6	add	r9d, r11d
145a5e0c9	add	r9d, ebp
145a5e0cc	mov	r11d, esi
145a5e0cf	rol	r11d, 0x1e
145a5e0d3	add	ecx, r9d
145a5e0d6	add	ecx, 0x5a827999
145a5e0dc	mov	r9d, ecx
145a5e0df	rol	r9d, 5
145a5e0e3	mov	r10d, edx
145a5e0e6	xor	r10d, r11d
145a5e0e9	and	r10d, r8d
145a5e0ec	xor	r10d, edx
145a5e0ef	add	r10d, edi
145a5e0f2	add	r10d, r13d
145a5e0f5	rol	r8d, 0x1e
145a5e0f9	add	r9d, r10d
145a5e0fc	add	r9d, 0x5a827999
145a5e103	mov	r10d, r8d
145a5e106	xor	r10d, r11d
145a5e109	and	r10d, ecx
145a5e10c	xor	r10d, r11d
145a5e10f	add	edx, eax
145a5e111	rol	ecx, 0x1e
145a5e114	add	edx, r10d
145a5e117	mov	r10d, r9d
145a5e11a	mov	esi, ecx
145a5e11c	xor	esi, r8d
145a5e11f	and	esi, r9d
145a5e122	rol	r9d, 5
145a5e126	add	r9d, edx
145a5e129	add	r9d, 0x5a827999
145a5e130	mov	eax, dword ptr [rbx + 0x14]
145a5e133	rol	r10d, 0x1e
145a5e137	bswap	eax
145a5e139	mov	dword ptr [rsp + 0x24], eax
145a5e13d	xor	esi, r8d
145a5e140	add	r11d, r14d
145a5e143	add	r11d, esi
145a5e146	mov	edx, r9d
145a5e149	rol	edx, 5
145a5e14c	add	edx, r11d
145a5e14f	add	edx, 0x5a827999
145a5e155	mov	r11d, edx
145a5e158	rol	r11d, 5
145a5e15c	mov	esi, r10d
145a5e15f	xor	esi, ecx
145a5e161	and	esi, r9d
145a5e164	xor	esi, ecx
145a5e166	add	r8d, eax
145a5e169	add	r8d, esi
145a5e16c	add	r8d, r11d
145a5e16f	add	r8d, 0x5a827999
145a5e176	mov	eax, dword ptr [rbx + 0x18]
145a5e179	bswap	eax
145a5e17b	mov	qword ptr [rsp + 0x38], rax
145a5e180	rol	r9d, 0x1e
145a5e184	mov	r11d, r9d
145a5e187	xor	r11d, r10d
145a5e18a	and	r11d, edx
145a5e18d	xor	r11d, r10d
145a5e190	add	ecx, eax
145a5e192	add	ecx, r11d
145a5e195	mov	r11d, r8d
145a5e198	rol	r11d, 5
145a5e19c	add	r11d, ecx
145a5e19f	add	r11d, 0x5a827999
145a5e1a6	mov	eax, dword ptr [rbx + 0x1c]
145a5e1a9	bswap	eax
145a5e1ab	mov	qword ptr [rsp + 0x50], rax
145a5e1b0	rol	edx, 0x1e
145a5e1b3	lea	ecx, [rax + r10]
145a5e1b7	mov	r10d, r11d
145a5e1ba	rol	r10d, 5
145a5e1be	mov	esi, edx
145a5e1c0	xor	esi, r9d
145a5e1c3	and	esi, r8d
145a5e1c6	xor	esi, r9d
145a5e1c9	add	esi, ecx
145a5e1cb	lea	ecx, [r10 + rsi]
145a5e1cf	add	ecx, 0x5a827999
145a5e1d5	rol	r8d, 0x1e
145a5e1d9	mov	r10d, r8d
145a5e1dc	xor	r10d, edx
145a5e1df	and	r10d, r11d
145a5e1e2	mov	edi, dword ptr [rbx + 0x20]
145a5e1e5	bswap	edi
145a5e1e7	xor	r10d, edx
145a5e1ea	add	r9d, edi
145a5e1ed	mov	qword ptr [rsp + 0x60], rdi
145a5e1f2	add	r9d, r10d
145a5e1f5	mov	r10d, ecx
145a5e1f8	rol	r10d, 5
145a5e1fc	add	r9d, r10d
145a5e1ff	add	r9d, 0x5a827999
145a5e206	mov	esi, r11d
145a5e209	rol	esi, 0x1e
145a5e20c	mov	r10d, dword ptr [rbx + 0x24]
145a5e210	bswap	r10d
145a5e213	mov	eax, r10d
145a5e216	mov	dword ptr [rsp + 0x20], r10d
145a5e21b	mov	r10d, esi
145a5e21e	xor	r10d, r8d
145a5e221	and	r10d, ecx
145a5e224	xor	r10d, r8d
145a5e227	add	edx, eax
145a5e229	add	edx, r10d
145a5e22c	mov	r10d, r9d
145a5e22f	rol	r10d, 5
145a5e233	add	r10d, edx
145a5e236	add	r10d, 0x5a827999
145a5e23d	mov	ebp, dword ptr [rbx + 0x28]
145a5e240	bswap	ebp
145a5e242	lea	edx, [r8 + rbp]
145a5e246	mov	qword ptr [rsp + 0x30], rbp
145a5e24b	rol	ecx, 0x1e
145a5e24e	mov	r8d, ecx
145a5e251	xor	r8d, esi
145a5e254	and	r8d, r9d
145a5e257	xor	r8d, esi
145a5e25a	add	r8d, edx
145a5e25d	mov	edx, r10d
145a5e260	rol	edx, 5
145a5e263	lea	r11d, [rdx + r8]
145a5e267	add	r11d, 0x5a827999
145a5e26e	mov	eax, dword ptr [rbx + 0x2c]
145a5e271	bswap	eax
145a5e273	mov	qword ptr [rsp + 0x68], rax
145a5e278	lea	edx, [rax + rsi]
145a5e27b	rol	r9d, 0x1e
145a5e27f	mov	r8d, r9d
145a5e282	xor	r8d, ecx
145a5e285	and	r8d, r10d
145a5e288	xor	r8d, ecx
145a5e28b	add	r8d, edx
145a5e28e	mov	edx, r11d
145a5e291	rol	edx, 5
145a5e294	rol	r10d, 0x1e
145a5e298	add	edx, r8d
145a5e29b	add	edx, 0x5a827999
145a5e2a1	mov	r8d, r10d
145a5e2a4	xor	r8d, r9d
145a5e2a7	and	r8d, r11d
145a5e2aa	mov	eax, dword ptr [rbx + 0x30]
145a5e2ad	bswap	eax
145a5e2af	mov	qword ptr [rsp + 0x88], rax
145a5e2b7	xor	r8d, r9d
145a5e2ba	add	ecx, eax
145a5e2bc	add	ecx, r8d
145a5e2bf	mov	r8d, edx
145a5e2c2	rol	r8d, 5
145a5e2c6	add	r8d, ecx
145a5e2c9	add	r8d, 0x5a827999
145a5e2d0	mov	ecx, r11d
145a5e2d3	mov	r11d, dword ptr [rbx + 0x34]
145a5e2d7	bswap	r11d
145a5e2da	mov	rsi, r11
145a5e2dd	rol	ecx, 0x1e
145a5e2e0	mov	r11d, ecx
145a5e2e3	xor	r11d, r10d
145a5e2e6	and	r11d, edx
145a5e2e9	xor	r11d, r10d
145a5e2ec	add	r9d, esi
145a5e2ef	mov	r14, rsi
145a5e2f2	mov	qword ptr [rsp + 0x78], rsi
145a5e2f7	add	r9d, r11d
145a5e2fa	mov	r11d, r8d
145a5e2fd	rol	r11d, 5
145a5e301	add	r9d, r11d
145a5e304	add	r9d, 0x5a827999
145a5e30b	mov	r15d, dword ptr [rbx + 0x38]
145a5e30f	mov	qword ptr [rsp + 0xb0], rbx
145a5e317	bswap	r15d
145a5e31a	rol	edx, 0x1e
145a5e31d	add	r10d, r15d
145a5e320	mov	r11d, r9d
145a5e323	rol	r11d, 5
145a5e327	mov	esi, edx
145a5e329	xor	esi, ecx
145a5e32b	and	esi, r8d
145a5e32e	xor	esi, ecx
145a5e330	add	esi, r10d
145a5e333	lea	r10d, [r11 + rsi]
145a5e337	add	r10d, 0x5a827999
145a5e33e	mov	eax, dword ptr [rbx + 0x3c]
145a5e341	bswap	eax
145a5e343	add	ecx, eax
145a5e345	mov	qword ptr [rsp + 0x48], rax
145a5e34a	rol	r8d, 0x1e
145a5e34e	mov	r11d, r8d
145a5e351	xor	r11d, edx
145a5e354	and	r11d, r9d
145a5e357	xor	r11d, edx
145a5e35a	add	r11d, ecx
145a5e35d	mov	ecx, r10d
145a5e360	rol	ecx, 5
145a5e363	add	ecx, r11d
145a5e366	add	ecx, 0x5a827999
145a5e36c	mov	r11, r13
145a5e36f	xor	r12d, r11d
145a5e372	mov	esi, edi
145a5e374	xor	esi, r14d
145a5e377	xor	esi, r12d
145a5e37a	mov	r14d, esi
145a5e37d	mov	rbx, qword ptr [rsp + 0x40]
145a5e382	mov	esi, dword ptr [rsp + 0x58]
145a5e386	xor	esi, ebx
145a5e388	mov	edi, dword ptr [rsp + 0x20]
145a5e38c	mov	r13d, edi
145a5e38f	mov	rdi, r15
145a5e392	mov	qword ptr [rsp + 0x70], r15
145a5e397	xor	r13d, edi
145a5e39a	xor	r13d, esi
145a5e39d	mov	esi, dword ptr [rsp + 0x28]
145a5e3a1	xor	r11d, esi
145a5e3a4	xor	ebp, eax
145a5e3a6	xor	ebp, r11d
145a5e3a9	rol	r9d, 0x1e
145a5e3ad	mov	eax, r9d
145a5e3b0	xor	eax, r8d
145a5e3b3	and	eax, r10d
145a5e3b6	rol	r14d, 1
145a5e3b9	mov	r11d, ecx
145a5e3bc	rol	r11d, 5
145a5e3c0	xor	eax, r8d
145a5e3c3	add	edx, r14d
145a5e3c6	mov	dword ptr [rsp + 0x2c], r14d
145a5e3cb	add	edx, eax
145a5e3cd	lea	eax, [r11 + rdx]
145a5e3d1	add	eax, 0x5a827999
145a5e3d6	rol	r13d, 1
145a5e3d9	rol	r10d, 0x1e
145a5e3dd	mov	edx, r10d
145a5e3e0	xor	edx, r9d
145a5e3e3	and	edx, ecx
145a5e3e5	xor	edx, r9d
145a5e3e8	add	r8d, r13d
145a5e3eb	add	r8d, edx
145a5e3ee	mov	edx, eax
145a5e3f0	rol	edx, 5
145a5e3f3	add	r8d, edx
145a5e3f6	add	r8d, 0x5a827999
145a5e3fd	rol	ebp, 1
145a5e3ff	lea	edx, [r9 + rbp]
145a5e403	mov	r15, rbp
145a5e406	rol	ecx, 0x1e
145a5e409	mov	r9d, ecx
145a5e40c	xor	r9d, r10d
145a5e40f	and	r9d, eax
145a5e412	xor	r9d, r10d
145a5e415	add	r9d, edx
145a5e418	mov	edx, r8d
145a5e41b	rol	edx, 5
145a5e41e	add	edx, r9d
145a5e421	add	edx, 0x5a827999
145a5e427	mov	rbp, rbx
145a5e42a	mov	ebx, dword ptr [rsp + 0x24]
145a5e42e	xor	ebp, ebx
145a5e430	xor	ebp, dword ptr [rsp + 0x68]
145a5e434	xor	ebp, r14d
145a5e437	rol	ebp, 1
145a5e439	add	r10d, ebp
145a5e43c	mov	qword ptr [rsp + 0x40], rbp
145a5e441	rol	eax, 0x1e
145a5e444	mov	r9d, eax
145a5e447	xor	r9d, ecx
145a5e44a	and	r9d, r8d
145a5e44d	xor	r9d, ecx
145a5e450	add	r9d, r10d
145a5e453	rol	r8d, 0x1e
145a5e457	mov	r10, qword ptr [rsp + 0x38]
145a5e45c	xor	esi, r10d
145a5e45f	mov	r14, qword ptr [rsp + 0x60]
145a5e464	xor	r10d, r14d
145a5e467	xor	r10d, edi
145a5e46a	xor	r10d, ebp
145a5e46d	rol	r10d, 1
145a5e470	mov	rdi, r10
145a5e473	mov	qword ptr [rsp + 0x38], r10
145a5e478	mov	r10d, edx
145a5e47b	rol	r10d, 0x1e
145a5e47f	mov	r11d, r10d
145a5e482	xor	r11d, r8d
145a5e485	add	edi, r8d
145a5e488	xor	r8d, eax
145a5e48b	xor	r8d, edx
145a5e48e	rol	edx, 5
145a5e491	add	edx, r9d
145a5e494	add	edx, 0x5a827999
145a5e49a	mov	rbp, qword ptr [rsp + 0x88]
145a5e4a2	xor	esi, ebp
145a5e4a4	xor	esi, r13d
145a5e4a7	rol	esi, 1
145a5e4a9	mov	r9d, edx
145a5e4ac	rol	r9d, 5
145a5e4b0	add	ecx, esi
145a5e4b2	mov	dword ptr [rsp + 0x28], esi
145a5e4b6	add	ecx, r8d
145a5e4b9	add	ecx, r9d
145a5e4bc	add	ecx, 0x6ed9eba1
145a5e4c2	mov	r8d, ebx
145a5e4c5	mov	r9, qword ptr [rsp + 0x50]
145a5e4ca	xor	r8d, r9d
145a5e4cd	mov	rbx, qword ptr [rsp + 0x78]
145a5e4d2	xor	r8d, ebx
145a5e4d5	mov	qword ptr [rsp + 0x58], r15
145a5e4da	xor	r8d, r15d
145a5e4dd	rol	r8d, 1
145a5e4e0	xor	r11d, edx
145a5e4e3	add	eax, r8d
145a5e4e6	mov	r12d, r8d
145a5e4e9	add	eax, r11d
145a5e4ec	mov	r8, r9
145a5e4ef	xor	r8d, dword ptr [rsp + 0x20]
145a5e4f4	xor	r8d, dword ptr [rsp + 0x48]
145a5e4f9	xor	r8d, esi
145a5e4fc	rol	r8d, 1
145a5e4ff	mov	r11, r8
145a5e502	mov	r8d, ecx
145a5e505	rol	r8d, 5
145a5e509	rol	edx, 0x1e
145a5e50c	add	eax, r8d
145a5e50f	add	eax, 0x6ed9eba1
145a5e514	mov	r8d, eax
145a5e517	rol	r8d, 5
145a5e51b	lea	r9d, [r11 + r10]
145a5e51f	mov	qword ptr [rsp + 0x50], r11
145a5e524	xor	r10d, edx
145a5e527	xor	r10d, ecx
145a5e52a	add	r10d, edi
145a5e52d	add	r8d, r10d
145a5e530	add	r8d, 0x6ed9eba1
145a5e537	rol	ecx, 0x1e
145a5e53a	mov	r10d, ecx
145a5e53d	xor	r10d, edx
145a5e540	xor	r10d, eax
145a5e543	add	r10d, r9d
145a5e546	rol	eax, 0x1e
145a5e549	mov	r9, qword ptr [rsp + 0x30]
145a5e54e	xor	r14d, r9d
145a5e551	xor	r9d, ebp
145a5e554	xor	r9d, r15d
145a5e557	xor	r9d, r11d
145a5e55a	rol	r9d, 1
145a5e55d	mov	rsi, r9
145a5e560	mov	qword ptr [rsp + 0x30], r9
145a5e565	mov	r9d, r8d
145a5e568	rol	r9d, 0x1e
145a5e56c	mov	r11d, r9d
145a5e56f	xor	r11d, eax
145a5e572	lea	ebp, [rsi + rax]
145a5e575	xor	eax, ecx
145a5e577	xor	eax, r8d
145a5e57a	rol	r8d, 5
145a5e57e	add	r8d, r10d
145a5e581	add	r8d, 0x6ed9eba1
145a5e588	mov	rdi, r14
145a5e58b	mov	r14d, dword ptr [rsp + 0x2c]
145a5e590	xor	edi, r14d
145a5e593	xor	edi, r12d
145a5e596	mov	r15d, r12d
145a5e599	mov	dword ptr [rsp + 0x24], r12d
145a5e59e	rol	edi, 1
145a5e5a0	mov	r10d, r8d
145a5e5a3	rol	r10d, 5
145a5e5a7	add	edx, edi
145a5e5a9	mov	rsi, rdi
145a5e5ac	mov	qword ptr [rsp + 0x60], rdi
145a5e5b1	add	edx, eax
145a5e5b3	lea	eax, [r10 + rdx]
145a5e5b7	add	eax, 0x6ed9eba1
145a5e5bc	mov	r12d, dword ptr [rsp + 0x20]
145a5e5c1	mov	r10, qword ptr [rsp + 0x68]
145a5e5c6	xor	r12d, r10d
145a5e5c9	xor	r12d, r13d
145a5e5cc	mov	rdi, qword ptr [rsp + 0x38]
145a5e5d1	xor	r12d, edi
145a5e5d4	rol	r12d, 1
145a5e5d7	xor	r11d, r8d
145a5e5da	add	ecx, r12d
145a5e5dd	mov	dword ptr [rsp + 0x20], r12d
145a5e5e2	add	ecx, r11d
145a5e5e5	mov	rdx, r10
145a5e5e8	xor	edx, ebx
145a5e5ea	xor	edx, dword ptr [rsp + 0x40]
145a5e5ee	xor	edx, esi
145a5e5f0	rol	edx, 1
145a5e5f2	mov	r10, rdx
145a5e5f5	mov	edx, eax
145a5e5f7	rol	edx, 5
145a5e5fa	rol	r8d, 0x1e
145a5e5fe	add	ecx, edx
145a5e600	add	ecx, 0x6ed9eba1
145a5e606	mov	edx, ecx
145a5e608	rol	edx, 5
145a5e60b	lea	r11d, [r10 + r9]
145a5e60f	mov	rsi, r10
145a5e612	mov	qword ptr [rsp + 0x68], r10
145a5e617	xor	r9d, r8d
145a5e61a	xor	r9d, eax
145a5e61d	add	r9d, ebp
145a5e620	add	edx, r9d
145a5e623	add	edx, 0x6ed9eba1
145a5e629	rol	eax, 0x1e
145a5e62c	mov	r10d, eax
145a5e62f	xor	r10d, r8d
145a5e632	xor	r10d, ecx
145a5e635	add	r10d, r11d
145a5e638	rol	ecx, 0x1e
145a5e63b	mov	r9, qword ptr [rsp + 0x70]
145a5e640	mov	rbx, qword ptr [rsp + 0x88]
145a5e648	xor	ebx, r9d
145a5e64b	xor	r9d, r14d
145a5e64e	xor	r9d, edi
145a5e651	xor	r9d, esi
145a5e654	rol	r9d, 1
145a5e657	mov	rsi, r9
145a5e65a	mov	qword ptr [rsp + 0x70], r9
145a5e65f	mov	r9d, edx
145a5e662	rol	r9d, 0x1e
145a5e666	mov	r11d, r9d
145a5e669	xor	r11d, ecx
145a5e66c	lea	ebp, [rsi + rcx]
145a5e66f	xor	ecx, eax
145a5e671	xor	ecx, edx
145a5e673	rol	edx, 5
145a5e676	add	edx, r10d
145a5e679	add	edx, 0x6ed9eba1
145a5e67f	mov	edi, dword ptr [rsp + 0x28]
145a5e683	mov	rsi, rbx
145a5e686	xor	esi, edi
145a5e688	xor	esi, r12d
145a5e68b	rol	esi, 1
145a5e68d	mov	r10d, edx
145a5e690	rol	r10d, 5
145a5e694	add	r8d, esi
145a5e697	mov	r12, rsi
145a5e69a	mov	qword ptr [rsp + 0x88], rsi
145a5e6a2	add	r8d, ecx
145a5e6a5	lea	ecx, [r10 + r8]
145a5e6a9	add	ecx, 0x6ed9eba1
145a5e6af	mov	rbx, qword ptr [rsp + 0x78]
145a5e6b4	mov	r8, qword ptr [rsp + 0x48]
145a5e6b9	xor	ebx, r8d
145a5e6bc	xor	ebx, r15d
145a5e6bf	mov	rsi, qword ptr [rsp + 0x30]
145a5e6c4	xor	ebx, esi
145a5e6c6	rol	ebx, 1
145a5e6c8	xor	r11d, edx
145a5e6cb	add	eax, ebx
145a5e6cd	mov	qword ptr [rsp + 0x78], rbx
145a5e6d2	add	eax, r11d
145a5e6d5	mov	r11, r8
145a5e6d8	xor	r11d, r13d
145a5e6db	xor	r11d, dword ptr [rsp + 0x50]
145a5e6e0	xor	r11d, r12d
145a5e6e3	rol	r11d, 1
145a5e6e6	mov	r8d, ecx
145a5e6e9	rol	r8d, 5
145a5e6ed	rol	edx, 0x1e
145a5e6f0	add	eax, r8d
145a5e6f3	add	eax, 0x6ed9eba1
145a5e6f8	lea	r12d, [r11 + r9]
145a5e6fc	mov	qword ptr [rsp + 0x48], r11
145a5e701	xor	r9d, edx
145a5e704	xor	r9d, ecx
145a5e707	add	r9d, ebp
145a5e70a	mov	r8d, eax
145a5e70d	rol	r8d, 5
145a5e711	add	r8d, r9d
145a5e714	add	r8d, 0x6ed9eba1
145a5e71b	rol	ecx, 0x1e
145a5e71e	mov	r10d, ecx
145a5e721	xor	r10d, edx
145a5e724	xor	r10d, eax
145a5e727	rol	eax, 0x1e
145a5e72a	add	r10d, r12d
145a5e72d	mov	r12, qword ptr [rsp + 0x58]
145a5e732	xor	r14d, r12d
145a5e735	xor	r12d, edi
145a5e738	xor	r12d, esi
145a5e73b	xor	r12d, r11d
145a5e73e	rol	r12d, 1
145a5e741	mov	qword ptr [rsp + 0x58], r12
145a5e746	mov	r9d, r8d
145a5e749	rol	r9d, 0x1e
145a5e74d	mov	ebp, r9d
145a5e750	xor	ebp, eax
145a5e752	lea	r11d, [r12 + rax]
145a5e756	mov	dword ptr [rsp + 0x98], r11d
145a5e75e	xor	eax, ecx
145a5e760	xor	eax, r8d
145a5e763	rol	r8d, 5
145a5e767	add	r8d, r10d
145a5e76a	add	r8d, 0x6ed9eba1
145a5e771	mov	r15, qword ptr [rsp + 0x60]
145a5e776	xor	r14d, r15d
145a5e779	xor	r14d, ebx
145a5e77c	rol	r14d, 1
145a5e77f	add	edx, r14d
145a5e782	mov	r10d, r14d
145a5e785	mov	dword ptr [rsp + 0x2c], r14d
145a5e78a	add	edx, eax
145a5e78c	mov	eax, r8d
145a5e78f	rol	eax, 5
145a5e792	lea	r11d, [rax + rdx]
145a5e796	add	r11d, 0x6ed9eba1
145a5e79d	mov	rdx, qword ptr [rsp + 0x40]
145a5e7a2	xor	r13d, edx
145a5e7a5	mov	r14d, dword ptr [rsp + 0x20]
145a5e7aa	xor	r13d, r14d
145a5e7ad	mov	rsi, qword ptr [rsp + 0x70]
145a5e7b2	xor	r13d, esi
145a5e7b5	rol	r13d, 1
145a5e7b8	xor	ebp, r8d
145a5e7bb	add	ecx, r13d
145a5e7be	add	ecx, ebp
145a5e7c0	mov	eax, r11d
145a5e7c3	rol	eax, 5
145a5e7c6	add	ecx, eax
145a5e7c8	add	ecx, 0x6ed9eba1
145a5e7ce	mov	rax, rdx
145a5e7d1	mov	r12d, dword ptr [rsp + 0x24]
145a5e7d6	xor	eax, r12d
145a5e7d9	xor	eax, dword ptr [rsp + 0x68]
145a5e7dd	xor	eax, r10d
145a5e7e0	rol	eax, 1
145a5e7e2	rol	r8d, 0x1e
145a5e7e6	mov	edx, ecx
145a5e7e8	rol	edx, 5
145a5e7eb	lea	r10d, [rax + r9]
145a5e7ef	mov	dword ptr [rsp + 0x84], r10d
145a5e7f7	mov	rbx, rax
145a5e7fa	mov	qword ptr [rsp + 0x40], rax
145a5e7ff	xor	r9d, r8d
145a5e802	xor	r9d, r11d
145a5e805	rol	r11d, 0x1e
145a5e809	add	r9d, dword ptr [rsp + 0x98]
145a5e811	mov	r10d, r11d
145a5e814	xor	r10d, r8d
145a5e817	xor	r10d, ecx
145a5e81a	rol	ecx, 0x1e
145a5e81d	mov	rax, qword ptr [rsp + 0x38]
145a5e822	xor	edi, eax
145a5e824	xor	eax, r15d
145a5e827	xor	eax, esi
145a5e829	xor	eax, ebx
145a5e82b	rol	eax, 1
145a5e82d	mov	rsi, rax
145a5e830	mov	qword ptr [rsp + 0x38], rax
145a5e835	add	edx, r9d
145a5e838	add	edx, 0x6ed9eba1
145a5e83e	mov	r9d, edx
145a5e841	rol	r9d, 0x1e
145a5e845	mov	eax, r9d
145a5e848	xor	eax, ecx
145a5e84a	lea	ebp, [rsi + rcx]
145a5e84d	xor	ecx, r11d
145a5e850	xor	ecx, edx
145a5e852	rol	edx, 5
145a5e855	add	r10d, dword ptr [rsp + 0x84]
145a5e85d	add	edx, r10d
145a5e860	add	edx, 0x6ed9eba1
145a5e866	mov	r10d, edi
145a5e869	mov	rdi, qword ptr [rsp + 0x88]
145a5e871	xor	r10d, edi
145a5e874	xor	r10d, r13d
145a5e877	rol	r10d, 1
145a5e87a	add	r8d, r10d
145a5e87d	mov	dword ptr [rsp + 0x28], r10d
145a5e882	add	r8d, ecx
145a5e885	mov	ecx, edx
145a5e887	rol	ecx, 5
145a5e88a	add	ecx, r8d
145a5e88d	add	ecx, 0x6ed9eba1
145a5e893	mov	r8, qword ptr [rsp + 0x50]
145a5e898	xor	r12d, r8d
145a5e89b	xor	r8d, r14d
145a5e89e	mov	rbx, qword ptr [rsp + 0x78]
145a5e8a3	xor	r12d, ebx
145a5e8a6	xor	r8d, dword ptr [rsp + 0x48]
145a5e8ab	mov	r14, qword ptr [rsp + 0x58]
145a5e8b0	xor	r12d, r14d
145a5e8b3	rol	r12d, 1
145a5e8b6	mov	esi, r12d
145a5e8b9	xor	r8d, r10d
145a5e8bc	rol	r8d, 1
145a5e8bf	mov	r12, r8
145a5e8c2	xor	eax, edx
145a5e8c4	add	r11d, esi
145a5e8c7	mov	dword ptr [rsp + 0x24], esi
145a5e8cb	add	r11d, eax
145a5e8ce	mov	eax, ecx
145a5e8d0	rol	eax, 5
145a5e8d3	lea	r8d, [rax + r11]
145a5e8d7	add	r8d, 0x6ed9eba1
145a5e8de	rol	edx, 0x1e
145a5e8e1	lea	eax, [r12 + r9]
145a5e8e5	mov	qword ptr [rsp + 0x50], r12
145a5e8ea	xor	r9d, edx
145a5e8ed	xor	r9d, ecx
145a5e8f0	add	r9d, ebp
145a5e8f3	mov	r10d, r8d
145a5e8f6	rol	r10d, 5
145a5e8fa	rol	ecx, 0x1e
145a5e8fd	add	r9d, r10d
145a5e900	add	r9d, 0x6ed9eba1
145a5e907	mov	r10d, ecx
145a5e90a	xor	r10d, edx
145a5e90d	xor	r10d, r8d
145a5e910	add	r10d, eax
145a5e913	mov	eax, r9d
145a5e916	rol	eax, 5
145a5e919	add	eax, r10d
145a5e91c	add	eax, 0x6ed9eba1
145a5e921	rol	r8d, 0x1e
145a5e925	mov	r10d, r8d
145a5e928	xor	r10d, ecx
145a5e92b	and	r10d, r9d
145a5e92e	mov	r11d, r8d
145a5e931	and	r11d, ecx
145a5e934	xor	r11d, r10d
145a5e937	mov	rbp, qword ptr [rsp + 0x30]
145a5e93c	xor	r15d, ebp
145a5e93f	xor	r15d, dword ptr [rsp + 0x2c]
145a5e944	xor	r15d, esi
145a5e947	rol	r15d, 1
145a5e94a	add	edx, r15d
145a5e94d	mov	qword ptr [rsp + 0x60], r15
145a5e952	add	edx, r11d
145a5e955	mov	r10d, eax
145a5e958	rol	r10d, 5
145a5e95c	add	edx, r10d
145a5e95f	add	edx, 0x8f1bbcdc
145a5e965	xor	ebp, edi
145a5e967	xor	ebp, r14d
145a5e96a	xor	ebp, r12d
145a5e96d	rol	ebp, 1
145a5e96f	mov	qword ptr [rsp + 0x30], rbp
145a5e974	rol	r9d, 0x1e
145a5e978	mov	r11d, r9d
145a5e97b	xor	r11d, r8d
145a5e97e	and	r11d, eax
145a5e981	lea	r10d, [r8 + rbp]
145a5e985	and	r8d, r9d
145a5e988	xor	r8d, r11d
145a5e98b	mov	ebp, dword ptr [rsp + 0x20]
145a5e98f	mov	rsi, qword ptr [rsp + 0x68]
145a5e994	xor	ebp, esi
145a5e996	xor	ebp, r13d
145a5e999	mov	r14, qword ptr [rsp + 0x38]
145a5e99e	xor	ebp, r14d
145a5e9a1	rol	ebp, 1
145a5e9a3	add	ecx, ebp
145a5e9a5	mov	dword ptr [rsp + 0x20], ebp
145a5e9a9	add	ecx, r8d
145a5e9ac	mov	r8d, edx
145a5e9af	rol	r8d, 5
145a5e9b3	add	r8d, ecx
145a5e9b6	add	r8d, 0x8f1bbcdc
145a5e9bd	mov	rcx, rsi
145a5e9c0	xor	ecx, ebx
145a5e9c2	xor	ecx, dword ptr [rsp + 0x40]
145a5e9c6	xor	ecx, r15d
145a5e9c9	rol	ecx, 1
145a5e9cb	mov	rsi, rcx
145a5e9ce	rol	eax, 0x1e
145a5e9d1	mov	ecx, eax
145a5e9d3	xor	ecx, r9d
145a5e9d6	and	ecx, edx
145a5e9d8	lea	r11d, [rsi + r9]
145a5e9dc	mov	qword ptr [rsp + 0x68], rsi
145a5e9e1	and	r9d, eax
145a5e9e4	xor	r9d, ecx
145a5e9e7	add	r9d, r10d
145a5e9ea	mov	ecx, r8d
145a5e9ed	rol	ecx, 5
145a5e9f0	rol	edx, 0x1e
145a5e9f3	add	r9d, ecx
145a5e9f6	add	r9d, 0x8f1bbcdc
145a5e9fd	mov	ecx, edx
145a5e9ff	xor	ecx, eax
145a5ea01	and	ecx, r8d
145a5ea04	mov	r10d, edx
145a5ea07	and	r10d, eax
145a5ea0a	xor	r10d, ecx
145a5ea0d	add	r10d, r11d
145a5ea10	mov	ecx, r9d
145a5ea13	rol	ecx, 5
145a5ea16	add	ecx, r10d
145a5ea19	add	ecx, 0x8f1bbcdc
145a5ea1f	rol	r8d, 0x1e
145a5ea23	mov	r10d, r8d
145a5ea26	xor	r10d, edx
145a5ea29	and	r10d, r9d
145a5ea2c	mov	r12, qword ptr [rsp + 0x70]
145a5ea31	mov	r15, rdi
145a5ea34	xor	r15d, r12d
145a5ea37	xor	r15d, dword ptr [rsp + 0x28]
145a5ea3c	xor	r15d, ebp
145a5ea3f	rol	r15d, 1
145a5ea42	mov	r11d, r8d
145a5ea45	and	r11d, edx
145a5ea48	xor	r11d, r10d
145a5ea4b	add	eax, r15d
145a5ea4e	add	eax, r11d
145a5ea51	mov	r10d, ecx
145a5ea54	rol	r10d, 5
145a5ea58	add	eax, r10d
145a5ea5b	add	eax, 0x8f1bbcdc
145a5ea60	mov	r10, r12
145a5ea63	mov	edi, dword ptr [rsp + 0x2c]
145a5ea67	xor	r10d, edi
145a5ea6a	xor	r10d, r14d
145a5ea6d	xor	r10d, esi
145a5ea70	rol	r10d, 1
145a5ea73	mov	qword ptr [rsp + 0x70], r10
145a5ea78	rol	r9d, 0x1e
145a5ea7c	mov	r11d, r9d
145a5ea7f	xor	r11d, r8d
145a5ea82	and	r11d, ecx
145a5ea85	add	r10d, r8d
145a5ea88	and	r8d, r9d
145a5ea8b	xor	r8d, r11d
145a5ea8e	mov	r11, qword ptr [rsp + 0x48]
145a5ea93	xor	ebx, r11d
145a5ea96	xor	r11d, r13d
145a5ea99	mov	r14d, dword ptr [rsp + 0x24]
145a5ea9e	xor	ebx, r14d
145a5eaa1	xor	r11d, dword ptr [rsp + 0x50]
145a5eaa6	mov	rbp, qword ptr [rsp + 0x30]
145a5eaab	xor	ebx, ebp
145a5eaad	rol	ebx, 1
145a5eaaf	xor	r11d, r15d
145a5eab2	rol	r11d, 1
145a5eab5	mov	qword ptr [rsp + 0x48], r11
145a5eaba	add	edx, ebx
145a5eabc	mov	qword ptr [rsp + 0x78], rbx
145a5eac1	add	edx, r8d
145a5eac4	mov	r8d, eax
145a5eac7	rol	r8d, 5
145a5eacb	add	edx, r8d
145a5eace	add	edx, 0x8f1bbcdc
145a5ead4	rol	ecx, 0x1e
145a5ead7	mov	r8d, ecx
145a5eada	xor	r8d, r9d
145a5eadd	and	r8d, eax
145a5eae0	add	r11d, r9d
145a5eae3	and	r9d, ecx
145a5eae6	xor	r9d, r8d
145a5eae9	mov	r8d, edx
145a5eaec	rol	r8d, 5
145a5eaf0	add	r9d, r10d
145a5eaf3	add	r9d, r8d
145a5eaf6	add	r9d, 0x8f1bbcdc
145a5eafd	rol	eax, 0x1e
145a5eb00	mov	r8d, eax
145a5eb03	xor	r8d, ecx
145a5eb06	and	r8d, edx
145a5eb09	mov	r10d, eax
145a5eb0c	and	r10d, ecx
145a5eb0f	xor	r10d, r8d
145a5eb12	add	r10d, r11d
145a5eb15	mov	r8d, r9d
145a5eb18	rol	r8d, 5
145a5eb1c	rol	edx, 0x1e
145a5eb1f	add	r8d, r10d
145a5eb22	add	r8d, 0x8f1bbcdc
145a5eb29	mov	r10d, edx
145a5eb2c	xor	r10d, eax
145a5eb2f	and	r10d, r9d
145a5eb32	mov	r11d, edx
145a5eb35	and	r11d, eax
145a5eb38	xor	r11d, r10d
145a5eb3b	mov	r12, qword ptr [rsp + 0x58]
145a5eb40	mov	esi, edi
145a5eb42	xor	esi, r12d
145a5eb45	xor	esi, dword ptr [rsp + 0x60]
145a5eb49	xor	esi, ebx
145a5eb4b	rol	esi, 1
145a5eb4d	mov	r10d, r8d
145a5eb50	rol	r10d, 5
145a5eb54	add	ecx, esi
145a5eb56	mov	ebx, esi
145a5eb58	mov	dword ptr [rsp + 0x2c], esi
145a5eb5c	add	ecx, r11d
145a5eb5f	lea	esi, [r10 + rcx]
145a5eb63	add	esi, 0x8f1bbcdc
145a5eb69	mov	r10, qword ptr [rsp + 0x40]
145a5eb6e	xor	r13d, r10d
145a5eb71	xor	r12d, dword ptr [rsp + 0x28]
145a5eb76	xor	r13d, dword ptr [rsp + 0x20]
145a5eb7b	xor	r13d, dword ptr [rsp + 0x70]
145a5eb80	rol	r13d, 1
145a5eb83	xor	r12d, ebp
145a5eb86	xor	r12d, dword ptr [rsp + 0x48]
145a5eb8b	rol	r12d, 1
145a5eb8e	mov	qword ptr [rsp + 0x58], r12
145a5eb93	rol	r9d, 0x1e
145a5eb97	mov	r11d, r9d
145a5eb9a	xor	r11d, edx
145a5eb9d	and	r11d, r8d
145a5eba0	lea	edi, [r12 + rdx]
145a5eba4	and	edx, r9d
145a5eba7	xor	edx, r11d
145a5ebaa	add	eax, r13d
145a5ebad	add	eax, edx
145a5ebaf	mov	edx, esi
145a5ebb1	rol	edx, 5
145a5ebb4	lea	ecx, [rdx + rax]
145a5ebb7	add	ecx, 0x8f1bbcdc
145a5ebbd	mov	ebp, r14d
145a5ebc0	xor	r10d, r14d
145a5ebc3	xor	r10d, dword ptr [rsp + 0x68]
145a5ebc8	xor	r10d, ebx
145a5ebcb	rol	r10d, 1
145a5ebce	rol	r8d, 0x1e
145a5ebd2	mov	edx, r8d
145a5ebd5	xor	edx, r9d
145a5ebd8	and	edx, esi
145a5ebda	lea	r11d, [r10 + r9]
145a5ebde	mov	r12, r10
145a5ebe1	mov	qword ptr [rsp + 0x40], r10
145a5ebe6	and	r9d, r8d
145a5ebe9	xor	r9d, edx
145a5ebec	add	r9d, edi
145a5ebef	mov	edx, ecx
145a5ebf1	rol	edx, 5
145a5ebf4	add	edx, r9d
145a5ebf7	add	edx, 0x8f1bbcdc
145a5ebfd	rol	esi, 0x1e
145a5ec00	mov	r9d, esi
145a5ec03	xor	r9d, r8d
145a5ec06	and	r9d, ecx
145a5ec09	mov	r10d, esi
145a5ec0c	and	r10d, r8d
145a5ec0f	xor	r10d, r9d
145a5ec12	mov	r9d, edx
145a5ec15	rol	r9d, 5
145a5ec19	add	r10d, r11d
145a5ec1c	lea	ebx, [r9 + r10]
145a5ec20	add	ebx, 0x8f1bbcdc
145a5ec26	rol	ecx, 0x1e
145a5ec29	mov	r10d, ecx
145a5ec2c	xor	r10d, esi
145a5ec2f	and	r10d, edx
145a5ec32	mov	r11d, ecx
145a5ec35	and	r11d, esi
145a5ec38	xor	r11d, r10d
145a5ec3b	mov	r9, qword ptr [rsp + 0x38]
145a5ec40	mov	eax, dword ptr [rsp + 0x28]
145a5ec44	xor	eax, r9d
145a5ec47	mov	rdi, qword ptr [rsp + 0x60]
145a5ec4c	xor	r9d, edi
145a5ec4f	xor	eax, r15d
145a5ec52	xor	eax, r13d
145a5ec55	rol	eax, 1
145a5ec57	xor	r9d, dword ptr [rsp + 0x70]
145a5ec5c	xor	r9d, r12d
145a5ec5f	rol	r9d, 1
145a5ec62	mov	qword ptr [rsp + 0x38], r9
145a5ec67	rol	edx, 0x1e
145a5ec6a	add	r8d, eax
145a5ec6d	mov	r14d, eax
145a5ec70	mov	dword ptr [rsp + 0x28], eax
145a5ec74	add	r8d, r11d
145a5ec77	mov	r10d, ebx
145a5ec7a	rol	r10d, 5
145a5ec7e	add	r8d, r10d
145a5ec81	add	r8d, 0x8f1bbcdc
145a5ec88	mov	r11d, edx
145a5ec8b	xor	r11d, ecx
145a5ec8e	and	r11d, ebx
145a5ec91	lea	r10d, [r9 + rcx]
145a5ec95	and	ecx, edx
145a5ec97	xor	ecx, r11d
145a5ec9a	mov	r11d, ebp
145a5ec9d	mov	rax, qword ptr [rsp + 0x50]
145a5eca2	xor	r11d, eax
145a5eca5	xor	r11d, dword ptr [rsp + 0x78]
145a5ecaa	mov	rbp, qword ptr [rsp + 0x58]
145a5ecaf	xor	r11d, ebp
145a5ecb2	rol	r11d, 1
145a5ecb5	add	esi, r11d
145a5ecb8	mov	r9d, r11d
145a5ecbb	mov	dword ptr [rsp + 0x24], r11d
145a5ecc0	add	esi, ecx
145a5ecc2	xor	eax, dword ptr [rsp + 0x20]
145a5ecc6	xor	eax, dword ptr [rsp + 0x48]
145a5ecca	xor	eax, r14d
145a5eccd	rol	eax, 1
145a5eccf	mov	r12, rax
145a5ecd2	mov	eax, r8d
145a5ecd5	rol	eax, 5
145a5ecd8	rol	ebx, 0x1e
145a5ecdb	add	eax, esi
145a5ecdd	add	eax, 0x8f1bbcdc
145a5ece2	mov	ecx, ebx
145a5ece4	xor	ecx, edx
145a5ece6	and	ecx, r8d
145a5ece9	lea	r11d, [r12 + rdx]
145a5eced	mov	rsi, r12
145a5ecf0	mov	qword ptr [rsp + 0x50], r12
145a5ecf5	and	edx, ebx
145a5ecf7	xor	edx, ecx
145a5ecf9	add	edx, r10d
145a5ecfc	mov	ecx, eax
145a5ecfe	rol	ecx, 5
145a5ed01	lea	r10d, [rcx + rdx]
145a5ed05	add	r10d, 0x8f1bbcdc
145a5ed0c	rol	r8d, 0x1e
145a5ed10	mov	ecx, r8d
145a5ed13	xor	ecx, ebx
145a5ed15	and	ecx, eax
145a5ed17	mov	edx, r8d
145a5ed1a	and	edx, ebx
145a5ed1c	xor	edx, ecx
145a5ed1e	add	edx, r11d
145a5ed21	mov	ecx, r10d
145a5ed24	rol	ecx, 5
145a5ed27	add	edx, ecx
145a5ed29	add	edx, 0x8f1bbcdc
145a5ed2f	rol	eax, 0x1e
145a5ed32	mov	ecx, eax
145a5ed34	xor	ecx, r8d
145a5ed37	and	ecx, r10d
145a5ed3a	mov	r11d, eax
145a5ed3d	and	r11d, r8d
145a5ed40	xor	r11d, ecx
145a5ed43	mov	r12, qword ptr [rsp + 0x30]
145a5ed48	xor	edi, r12d
145a5ed4b	mov	r14d, dword ptr [rsp + 0x2c]
145a5ed50	xor	edi, r14d
145a5ed53	xor	edi, r9d
145a5ed56	rol	edi, 1
145a5ed58	add	ebx, edi
145a5ed5a	mov	qword ptr [rsp + 0x60], rdi
145a5ed5f	add	ebx, r11d
145a5ed62	mov	ecx, edx
145a5ed64	rol	ecx, 5
145a5ed67	add	ecx, ebx
145a5ed69	add	ecx, 0x8f1bbcdc
145a5ed6f	mov	r9d, r10d
145a5ed72	xor	r12d, r15d
145a5ed75	xor	r12d, ebp
145a5ed78	xor	r12d, esi
145a5ed7b	rol	r12d, 1
145a5ed7e	mov	qword ptr [rsp + 0x30], r12
145a5ed83	rol	r9d, 0x1e
145a5ed87	mov	r11d, r9d
145a5ed8a	xor	r11d, eax
145a5ed8d	and	r11d, edx
145a5ed90	lea	r10d, [r12 + rax]
145a5ed94	and	eax, r9d
145a5ed97	xor	eax, r11d
145a5ed9a	mov	r11d, dword ptr [rsp + 0x20]
145a5ed9f	mov	r12, qword ptr [rsp + 0x68]
145a5eda4	xor	r11d, r12d
145a5eda7	xor	r11d, r13d
145a5edaa	mov	qword ptr [rsp + 0x88], r13
145a5edb2	mov	rbx, qword ptr [rsp + 0x38]
145a5edb7	xor	r11d, ebx
145a5edba	rol	r11d, 1
145a5edbd	mov	dword ptr [rsp + 0x20], r11d
145a5edc2	add	r8d, r11d
145a5edc5	add	r8d, eax
145a5edc8	mov	eax, ecx
145a5edca	rol	eax, 5
145a5edcd	add	eax, r8d
145a5edd0	add	eax, 0x8f1bbcdc
145a5edd5	xor	r12d, dword ptr [rsp + 0x78]
145a5edda	xor	r12d, dword ptr [rsp + 0x40]
145a5eddf	xor	r12d, edi
145a5ede2	rol	r12d, 1
145a5ede5	rol	edx, 0x1e
145a5ede8	mov	r8d, edx
145a5edeb	xor	r8d, r9d
145a5edee	and	r8d, ecx
145a5edf1	lea	r11d, [r12 + r9]
145a5edf5	mov	qword ptr [rsp + 0x68], r12
145a5edfa	and	r9d, edx
145a5edfd	xor	r9d, r8d
145a5ee00	add	r9d, r10d
145a5ee03	mov	r8d, eax
145a5ee06	rol	r8d, 5
145a5ee0a	rol	ecx, 0x1e
145a5ee0d	add	r8d, r9d
145a5ee10	add	r8d, 0x8f1bbcdc
145a5ee17	mov	r9d, ecx
145a5ee1a	xor	r9d, edx
145a5ee1d	and	r9d, eax
145a5ee20	mov	r10d, ecx
145a5ee23	and	r10d, edx
145a5ee26	xor	r10d, r9d
145a5ee29	add	r10d, r11d
145a5ee2c	rol	eax, 0x1e
145a5ee2f	mov	rsi, qword ptr [rsp + 0x70]
145a5ee34	xor	r15d, esi
145a5ee37	xor	esi, r14d
145a5ee3a	xor	esi, ebx
145a5ee3c	xor	esi, r12d
145a5ee3f	rol	esi, 1
145a5ee41	mov	qword ptr [rsp + 0x70], rsi
145a5ee46	mov	r9d, r8d
145a5ee49	rol	r9d, 0x1e
145a5ee4d	mov	r11d, r9d
145a5ee50	xor	r11d, eax
145a5ee53	add	esi, eax
145a5ee55	mov	dword ptr [rsp + 0x84], esi
145a5ee5c	xor	eax, ecx
145a5ee5e	xor	eax, r8d
145a5ee61	rol	r8d, 5
145a5ee65	add	r8d, r10d
145a5ee68	add	r8d, 0x8f1bbcdc
145a5ee6f	mov	ebp, dword ptr [rsp + 0x28]
145a5ee73	xor	r15d, ebp
145a5ee76	xor	r15d, dword ptr [rsp + 0x20]
145a5ee7b	rol	r15d, 1
145a5ee7e	mov	r10d, r8d
145a5ee81	rol	r10d, 5
145a5ee85	add	edx, r15d
145a5ee88	add	edx, eax
145a5ee8a	lea	eax, [r10 + rdx]
145a5ee8e	add	eax, 0xca62c1d6
145a5ee93	mov	r14, qword ptr [rsp + 0x48]
145a5ee98	mov	r12, qword ptr [rsp + 0x78]
145a5ee9d	xor	r12d, r14d
145a5eea0	xor	r12d, dword ptr [rsp + 0x24]
145a5eea5	mov	rdi, qword ptr [rsp + 0x30]
145a5eeaa	xor	r12d, edi
145a5eead	rol	r12d, 1
145a5eeb0	xor	r11d, r8d
145a5eeb3	add	ecx, r12d
145a5eeb6	add	ecx, r11d
145a5eeb9	xor	r14d, r13d
145a5eebc	xor	r14d, dword ptr [rsp + 0x50]
145a5eec1	xor	r14d, r15d
145a5eec4	rol	r14d, 1
145a5eec7	mov	edx, eax
145a5eec9	rol	edx, 5
145a5eecc	rol	r8d, 0x1e
145a5eed0	add	ecx, edx
145a5eed2	add	ecx, 0xca62c1d6
145a5eed8	mov	edx, ecx
145a5eeda	rol	edx, 5
145a5eedd	lea	r11d, [r14 + r9]
145a5eee1	mov	qword ptr [rsp + 0x48], r14
145a5eee6	xor	r9d, r8d
145a5eee9	xor	r9d, eax
145a5eeec	add	r9d, dword ptr [rsp + 0x84]
145a5eef4	add	edx, r9d
145a5eef7	add	edx, 0xca62c1d6
145a5eefd	rol	eax, 0x1e
145a5ef00	mov	r10d, eax
145a5ef03	xor	r10d, r8d
145a5ef06	xor	r10d, ecx
145a5ef09	add	r10d, r11d
145a5ef0c	rol	ecx, 0x1e
145a5ef0f	mov	rsi, qword ptr [rsp + 0x58]
145a5ef14	mov	r13d, dword ptr [rsp + 0x2c]
145a5ef19	xor	r13d, esi
145a5ef1c	xor	esi, ebp
145a5ef1e	xor	esi, edi
145a5ef20	xor	esi, r14d
145a5ef23	rol	esi, 1
145a5ef25	mov	qword ptr [rsp + 0x58], rsi
145a5ef2a	mov	r9d, edx
145a5ef2d	rol	r9d, 0x1e
145a5ef31	mov	r11d, r9d
145a5ef34	xor	r11d, ecx
145a5ef37	lea	r14d, [rsi + rcx]
145a5ef3b	xor	ecx, eax
145a5ef3d	xor	ecx, edx
145a5ef3f	rol	edx, 5
145a5ef42	add	edx, r10d
145a5ef45	add	edx, 0xca62c1d6
145a5ef4b	mov	rdi, qword ptr [rsp + 0x60]
145a5ef50	xor	r13d, edi
145a5ef53	xor	r13d, r12d
145a5ef56	rol	r13d, 1
145a5ef59	mov	r10d, edx
145a5ef5c	rol	r10d, 5
145a5ef60	add	r8d, r13d
145a5ef63	add	r8d, ecx
145a5ef66	lea	ecx, [r10 + r8]
145a5ef6a	add	ecx, 0xca62c1d6
145a5ef70	mov	r8, qword ptr [rsp + 0x40]
145a5ef75	mov	rbx, qword ptr [rsp + 0x88]
145a5ef7d	xor	ebx, r8d
145a5ef80	xor	ebx, dword ptr [rsp + 0x20]
145a5ef84	mov	rsi, qword ptr [rsp + 0x70]
145a5ef89	xor	ebx, esi
145a5ef8b	rol	ebx, 1
145a5ef8d	xor	r11d, edx
145a5ef90	add	eax, ebx
145a5ef92	add	eax, r11d
145a5ef95	mov	r11, r8
145a5ef98	xor	r11d, dword ptr [rsp + 0x24]
145a5ef9d	xor	r11d, dword ptr [rsp + 0x68]
145a5efa2	xor	r11d, r13d
145a5efa5	rol	r11d, 1
145a5efa8	mov	r8d, ecx
145a5efab	rol	r8d, 5
145a5efaf	rol	edx, 0x1e
145a5efb2	add	eax, r8d
145a5efb5	add	eax, 0xca62c1d6
145a5efba	lea	ebp, [r11 + r9]
145a5efbe	mov	qword ptr [rsp + 0x40], r11
145a5efc3	xor	r9d, edx
145a5efc6	xor	r9d, ecx
145a5efc9	add	r9d, r14d
145a5efcc	mov	r8d, eax
145a5efcf	rol	r8d, 5
145a5efd3	add	r8d, r9d
145a5efd6	add	r8d, 0xca62c1d6
145a5efdd	rol	ecx, 0x1e
145a5efe0	mov	r10d, ecx
145a5efe3	xor	r10d, edx
145a5efe6	xor	r10d, eax
145a5efe9	rol	eax, 0x1e
145a5efec	add	r10d, ebp
145a5efef	mov	r9, qword ptr [rsp + 0x38]
145a5eff4	mov	ebp, dword ptr [rsp + 0x28]
145a5eff8	xor	ebp, r9d
145a5effb	xor	r9d, edi
145a5effe	xor	r9d, esi
145a5f001	xor	r9d, r11d
145a5f004	rol	r9d, 1
145a5f007	mov	rsi, r9
145a5f00a	mov	qword ptr [rsp + 0x38], r9
145a5f00f	mov	r9d, r8d
145a5f012	rol	r9d, 0x1e
145a5f016	mov	r11d, r9d
145a5f019	xor	r11d, eax
145a5f01c	add	esi, eax
145a5f01e	mov	dword ptr [rsp + 0x2c], esi
145a5f022	xor	eax, ecx
145a5f024	xor	eax, r8d
145a5f027	rol	r8d, 5
145a5f02b	lea	edi, [r8 + r10]
145a5f02f	add	edi, 0xca62c1d6
145a5f035	mov	r8d, ebp
145a5f038	xor	r8d, r15d
145a5f03b	xor	r8d, ebx
145a5f03e	rol	r8d, 1
145a5f041	add	edx, r8d
145a5f044	mov	dword ptr [rsp + 0x28], r8d
145a5f049	add	edx, eax
145a5f04b	mov	eax, edi
145a5f04d	rol	eax, 5
145a5f050	add	edx, eax
145a5f052	add	edx, 0xca62c1d6
145a5f058	mov	esi, dword ptr [rsp + 0x24]
145a5f05c	mov	r10, qword ptr [rsp + 0x50]
145a5f061	xor	esi, r10d
145a5f064	xor	esi, r12d
145a5f067	mov	rbp, qword ptr [rsp + 0x58]
145a5f06c	xor	esi, ebp
145a5f06e	rol	esi, 1
145a5f070	mov	dword ptr [rsp + 0x24], esi
145a5f074	xor	r11d, edi
145a5f077	add	ecx, esi
145a5f079	add	ecx, r11d
145a5f07c	mov	eax, edx
145a5f07e	rol	eax, 5
145a5f081	add	ecx, eax
145a5f083	add	ecx, 0xca62c1d6
145a5f089	mov	rax, r10
145a5f08c	mov	r14d, dword ptr [rsp + 0x20]
145a5f091	xor	eax, r14d
145a5f094	xor	eax, dword ptr [rsp + 0x48]
145a5f098	xor	eax, r8d
145a5f09b	rol	eax, 1
145a5f09d	rol	edi, 0x1e
145a5f0a0	mov	r10d, ecx
145a5f0a3	rol	r10d, 5
145a5f0a7	lea	r8d, [rax + r9]
145a5f0ab	mov	dword ptr [rsp + 0x78], r8d
145a5f0b0	mov	r11, rax
145a5f0b3	mov	qword ptr [rsp + 0x50], rax
145a5f0b8	xor	r9d, edi
145a5f0bb	xor	r9d, edx
145a5f0be	rol	edx, 0x1e
145a5f0c1	add	r9d, dword ptr [rsp + 0x2c]
145a5f0c6	mov	eax, edx
145a5f0c8	xor	eax, edi
145a5f0ca	xor	eax, ecx
145a5f0cc	rol	ecx, 0x1e
145a5f0cf	mov	rsi, qword ptr [rsp + 0x30]
145a5f0d4	mov	r8, qword ptr [rsp + 0x60]
145a5f0d9	xor	r8d, esi
145a5f0dc	xor	esi, r15d
145a5f0df	xor	esi, ebp
145a5f0e1	xor	esi, r11d
145a5f0e4	rol	esi, 1
145a5f0e6	mov	qword ptr [rsp + 0x30], rsi
145a5f0eb	add	r9d, r10d
145a5f0ee	add	r9d, 0xca62c1d6
145a5f0f5	mov	r10d, r9d
145a5f0f8	rol	r10d, 0x1e
145a5f0fc	mov	r11d, r10d
145a5f0ff	xor	r11d, ecx
145a5f102	add	esi, ecx
145a5f104	mov	dword ptr [rsp + 0x60], esi
145a5f108	xor	ecx, edx
145a5f10a	xor	ecx, r9d
145a5f10d	rol	r9d, 5
145a5f111	add	eax, dword ptr [rsp + 0x78]
145a5f115	add	r9d, eax
145a5f118	add	r9d, 0xca62c1d6
145a5f11f	mov	esi, r14d
145a5f122	mov	r14, qword ptr [rsp + 0x68]
145a5f127	xor	esi, r14d
145a5f12a	xor	r14d, r12d
145a5f12d	mov	rax, r8
145a5f130	xor	eax, r13d
145a5f133	xor	eax, dword ptr [rsp + 0x24]
145a5f137	rol	eax, 1
145a5f139	xor	r14d, dword ptr [rsp + 0x40]
145a5f13e	xor	r14d, eax
145a5f141	add	eax, edi
145a5f143	add	eax, ecx
145a5f145	mov	rcx, rax
145a5f148	mov	eax, r9d
145a5f14b	rol	eax, 5
145a5f14e	lea	edi, [rax + rcx]
145a5f151	add	edi, 0xca62c1d6
145a5f157	xor	esi, ebx
145a5f159	mov	rbp, qword ptr [rsp + 0x38]
145a5f15e	xor	esi, ebp
145a5f160	rol	esi, 1
145a5f162	rol	r14d, 1
145a5f165	xor	r11d, r9d
145a5f168	add	edx, esi
145a5f16a	add	edx, r11d
145a5f16d	mov	eax, edi
145a5f16f	rol	eax, 5
145a5f172	lea	r8d, [rax + rdx]
145a5f176	add	r8d, 0xca62c1d6
145a5f17d	rol	r9d, 0x1e
145a5f181	lea	eax, [r14 + r10]
145a5f185	xor	r10d, r9d
145a5f188	xor	r10d, edi
145a5f18b	add	r10d, dword ptr [rsp + 0x60]
145a5f190	mov	ecx, r8d
145a5f193	rol	ecx, 5
145a5f196	rol	edi, 0x1e
145a5f199	add	ecx, r10d
145a5f19c	add	ecx, 0xca62c1d6
145a5f1a2	mov	edx, ecx
145a5f1a4	rol	edx, 5
145a5f1a7	mov	r10d, edi
145a5f1aa	xor	r10d, r9d
145a5f1ad	xor	r10d, r8d
145a5f1b0	add	r10d, eax
145a5f1b3	lea	eax, [rdx + r10]
145a5f1b7	add	eax, 0xca62c1d6
145a5f1bc	mov	rdx, qword ptr [rsp + 0x70]
145a5f1c1	xor	r15d, edx
145a5f1c4	xor	r13d, edx
145a5f1c7	mov	rdx, qword ptr [rsp + 0x48]
145a5f1cc	xor	r12d, edx
145a5f1cf	xor	ebx, edx
145a5f1d1	xor	r15d, dword ptr [rsp + 0x28]
145a5f1d6	xor	r12d, dword ptr [rsp + 0x24]
145a5f1db	xor	r13d, ebp
145a5f1de	xor	ebx, dword ptr [rsp + 0x50]
145a5f1e2	xor	r15d, esi
145a5f1e5	xor	r12d, dword ptr [rsp + 0x30]
145a5f1ea	rol	r8d, 0x1e
145a5f1ee	rol	r15d, 1
145a5f1f1	xor	r13d, r14d
145a5f1f4	rol	r12d, 1
145a5f1f7	xor	ebx, r15d
145a5f1fa	add	r15d, r9d
145a5f1fd	mov	edx, r8d
145a5f200	xor	edx, edi
145a5f202	xor	edx, ecx
145a5f204	add	r15d, edx
145a5f207	mov	edx, eax
145a5f209	rol	edx, 5
145a5f20c	lea	r9d, [rdx + r15]
145a5f210	add	r9d, 0xca62c1d6
145a5f217	rol	r13d, 1
145a5f21a	add	r13d, r8d
145a5f21d	rol	ecx, 0x1e
145a5f220	add	r12d, edi
145a5f223	mov	edx, r9d
145a5f226	rol	edx, 5
145a5f229	xor	r8d, ecx
145a5f22c	xor	r8d, eax
145a5f22f	add	r12d, r8d
145a5f232	lea	r8d, [rdx + r12]
145a5f236	add	r8d, 0xca62c1d6
145a5f23d	rol	eax, 0x1e
145a5f240	mov	r10d, r8d
145a5f243	rol	r10d, 5
145a5f247	mov	edx, eax
145a5f249	xor	edx, ecx
145a5f24b	xor	edx, r9d
145a5f24e	add	edx, r13d
145a5f251	mov	r11d, edx
145a5f254	add	edx, r10d
145a5f257	add	r10d, r11d
145a5f25a	add	r10d, 0xca62c1d6
145a5f261	mov	r11d, dword ptr [rsp + 0xa4]
145a5f269	rol	ebx, 1
145a5f26b	add	ebx, dword ptr [rsp + 0x9c]
145a5f272	add	ebx, ecx
145a5f274	rol	r9d, 0x1e
145a5f278	add	r11d, r9d
145a5f27b	xor	r9d, eax
145a5f27e	xor	r9d, r8d
145a5f281	add	ebx, r9d
145a5f284	rol	r10d, 5
145a5f288	lea	esi, [r10 + rbx]
145a5f28c	add	esi, 0xca62c1d6
145a5f292	mov	r10, qword ptr [rsp + 0xc0]
145a5f29a	add	r10d, edx
145a5f29d	add	r10d, 0xca62c1d6
145a5f2a4	rol	r8d, 0x1e
145a5f2a8	add	r8d, dword ptr [rsp + 0xb8]
145a5f2b0	add	eax, dword ptr [rsp + 0xa0]
145a5f2b7	mov	rcx, qword ptr [rsp + 0xb0]
145a5f2bf	add	rcx, 0x40
145a5f2c3	mov	edi, r8d
145a5f2c6	mov	rdx, rcx
145a5f2c9	cmp	rcx, qword ptr [rsp + 0xa8]
145a5f2d1	jne	0x145a5e030
145a5f2d7	jmp	0x145a5f2dc
145a5f2d9	mov	r8d, edi
145a5f2dc	mov	rcx, qword ptr [rsp + 0x90]
145a5f2e4	mov	dword ptr [rcx], esi
145a5f2e6	mov	dword ptr [rcx + 4], r10d
145a5f2ea	mov	dword ptr [rcx + 8], r8d
145a5f2ee	mov	dword ptr [rcx + 0xc], r11d
145a5f2f2	mov	dword ptr [rcx + 0x10], eax
145a5f2f5	add	rsp, 0xc8
145a5f2fc	pop	rbx
145a5f2fd	pop	rbp
145a5f2fe	pop	rdi
145a5f2ff	pop	rsi
145a5f300	pop	r12
145a5f302	pop	r13
145a5f304	pop	r14
145a5f306	pop	r15
145a5f308	ret
145a5f309	mov	rdi, r9
145a5f30c	mov	rsi, rdx
145a5f30f	call	0x145d80100
145a5f314	mov	rdx, rsi
145a5f317	mov	r9, rdi
145a5f31a	test	al, al
145a5f31c	je	0x145a5dffb
145a5f322	mov	rcx, qword ptr [rsp + 0x90]
145a5f32a	mov	r8, r9
145a5f32d	add	rsp, 0xc8
145a5f334	pop	rbx
145a5f335	pop	rbp
145a5f336	pop	rdi
145a5f337	pop	rsi
145a5f338	pop	r12
145a5f33a	pop	r13
145a5f33c	pop	r14
145a5f33e	pop	r15
145a5f340	jmp	0x145a5f350
