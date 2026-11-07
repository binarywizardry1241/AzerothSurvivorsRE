1458d8080	push	rbp
1458d8081	push	r15
1458d8083	push	r14
1458d8085	push	r13
1458d8087	push	r12
1458d8089	push	rsi
1458d808a	push	rdi
1458d808b	push	rbx
1458d808c	sub	rsp, 0x58
1458d8090	lea	rbp, [rsp + 0x50]
1458d8095	mov	qword ptr [rbp], 0xfffffffffffffffe
1458d809d	mov	rsi, rdx
1458d80a0	mov	qword ptr [rbp - 0x10], rcx
1458d80a4	mov	rdi, qword ptr [rcx + 0x28]
1458d80a8	cmp	rdi, 2
1458d80ac	jae	0x1458d8223
1458d80b2	mov	rcx, qword ptr [rbp - 0x10]
1458d80b6	mov	rdx, rsi
1458d80b9	call	0x1458d7780
1458d80be	nop
1458d80bf	mov	ebx, eax
1458d80c1	mov	r15, qword ptr [rbp - 0x10]
1458d80c5	lea	r14, [r15 + 0x18]
1458d80c9	test	al, al
1458d80cb	je	0x1458d8123
1458d80cd	mov	rax, qword ptr [r15 + 0x10]
1458d80d1	mov	qword ptr [rbp - 0x20], rax
1458d80d5	movups	xmm0, xmmword ptr [r15]
1458d80d9	movaps	xmmword ptr [rbp - 0x30], xmm0
1458d80dd	lea	r15, [rsi + 0xf0]
1458d80e4	mov	rdi, qword ptr [rsi + 0xf8]
1458d80eb	mov	r12, qword ptr [rsi + 0x100]
1458d80f2	test	r12, r12
1458d80f5	je	0x1458d8166
1458d80f7	lea	r13, [rdi + 8]
1458d80fb	jmp	0x1458d8109
1458d80fd	nop	dword ptr [rax]
1458d8100	add	r13, 0x20
1458d8104	dec	r12
1458d8107	je	0x1458d8166
1458d8109	mov	rdx, qword ptr [r13 - 8]
1458d810d	test	rdx, rdx
1458d8110	je	0x1458d8100
1458d8112	mov	rcx, qword ptr [r13]
1458d8116	mov	r8d, 1
1458d811c	call	0x1400021d0
1458d8121	jmp	0x1458d8100
1458d8123	mov	rsi, qword ptr [r15 + 0x10]
1458d8127	test	rsi, rsi
1458d812a	je	0x1458d81da
1458d8130	mov	rdi, qword ptr [r15 + 8]
1458d8134	add	rdi, 8
1458d8138	jmp	0x1458d814d
1458d813a	nop	word ptr [rax + rax]
1458d8140	add	rdi, 0x20
1458d8144	dec	rsi
1458d8147	je	0x1458d81da
1458d814d	mov	rdx, qword ptr [rdi - 8]
1458d8151	test	rdx, rdx
1458d8154	je	0x1458d8140
1458d8156	mov	rcx, qword ptr [rdi]
1458d8159	mov	r8d, 1
1458d815f	call	0x1400021d0
1458d8164	jmp	0x1458d8140
1458d8166	mov	rdx, qword ptr [r15]
1458d8169	test	rdx, rdx
1458d816c	je	0x1458d8180
1458d816e	shl	rdx, 5
1458d8172	mov	r8d, 8
1458d8178	mov	rcx, rdi
1458d817b	call	0x1400021d0
1458d8180	mov	rax, qword ptr [rbp - 0x20]
1458d8184	mov	qword ptr [r15 + 0x10], rax
1458d8188	movaps	xmm0, xmmword ptr [rbp - 0x30]
1458d818c	movups	xmmword ptr [r15], xmm0
1458d8190	mov	rax, qword ptr [r14 + 0x10]
1458d8194	mov	qword ptr [rbp - 0x20], rax
1458d8198	movups	xmm0, xmmword ptr [r14]
1458d819c	movaps	xmmword ptr [rbp - 0x30], xmm0
1458d81a0	lea	rdi, [rsi + 0x108]
1458d81a7	mov	rdx, qword ptr [rsi + 0x108]
1458d81ae	test	rdx, rdx
1458d81b1	je	0x1458d81c9
1458d81b3	mov	rcx, qword ptr [rsi + 0x110]
1458d81ba	shl	rdx, 2
1458d81be	mov	r8d, 4
1458d81c4	call	0x1400021d0
1458d81c9	mov	rax, qword ptr [rbp - 0x20]
1458d81cd	mov	qword ptr [rdi + 0x10], rax
1458d81d1	movaps	xmm0, xmmword ptr [rbp - 0x30]
1458d81d5	movups	xmmword ptr [rdi], xmm0
1458d81d8	jmp	0x1458d8210
1458d81da	mov	rdx, qword ptr [r15]
1458d81dd	test	rdx, rdx
1458d81e0	je	0x1458d81f5
1458d81e2	mov	rcx, qword ptr [r15 + 8]
1458d81e6	shl	rdx, 5
1458d81ea	mov	r8d, 8
1458d81f0	call	0x1400021d0
1458d81f5	mov	rdx, qword ptr [r14]
1458d81f8	test	rdx, rdx
1458d81fb	je	0x1458d8210
1458d81fd	mov	rcx, qword ptr [r15 + 0x20]
1458d8201	shl	rdx, 2
1458d8205	mov	r8d, 4
1458d820b	call	0x1400021d0
1458d8210	mov	eax, ebx
1458d8212	add	rsp, 0x58
1458d8216	pop	rbx
1458d8217	pop	rdi
1458d8218	pop	rsi
1458d8219	pop	r12
1458d821b	pop	r13
1458d821d	pop	r14
1458d821f	pop	r15
1458d8221	pop	rbp
1458d8222	ret
1458d8223	mov	rbx, qword ptr [rbp - 0x10]
1458d8227	mov	rcx, qword ptr [rbx + 0x20]
1458d822b	cmp	rdi, 0x15
1458d822f	jae	0x1458d833e
1458d8235	lea	rax, [rcx + rdi*4]
1458d8239	lea	rdx, [rcx + 4]
1458d823d	mov	r8d, 4
1458d8243	jmp	0x1458d8258
1458d8245	mov	r10, rcx
1458d8248	mov	dword ptr [r10], r9d
1458d824b	add	rdx, 4
1458d824f	add	r8, 4
1458d8253	cmp	rdx, rax
1458d8256	je	0x1458d8284
1458d8258	mov	r11d, dword ptr [rdx - 4]
1458d825c	mov	r9d, dword ptr [rdx]
1458d825f	cmp	r9d, r11d
1458d8262	jae	0x1458d824b
1458d8264	mov	r10, r8
1458d8267	mov	dword ptr [rcx + r10], r11d
1458d826b	cmp	r10, 4
1458d826f	je	0x1458d8245
1458d8271	mov	r11d, dword ptr [rcx + r10 - 8]
1458d8276	add	r10, -4
1458d827a	cmp	r9d, r11d
1458d827d	jb	0x1458d8267
1458d827f	add	r10, rcx
1458d8282	jmp	0x1458d8248
1458d8284	mov	rdi, qword ptr [rbx + 0x28]
1458d8288	cmp	rdi, 2
1458d828c	jb	0x1458d80b2
1458d8292	mov	rax, qword ptr [rbp - 0x10]
1458d8296	mov	rax, qword ptr [rax + 0x20]
1458d829a	lea	rcx, [rdi - 1]
1458d829e	xor	r8d, r8d
1458d82a1	mov	r11, qword ptr [rbp - 0x10]
1458d82a5	mov	edx, dword ptr [rax + r8*4 + 4]
1458d82aa	cmp	edx, dword ptr [rax + r8*4]
1458d82ae	je	0x1458d82bd
1458d82b0	inc	r8
1458d82b3	cmp	rcx, r8
1458d82b6	jne	0x1458d82a5
1458d82b8	jmp	0x1458d80b2
1458d82bd	lea	rdx, [r8 + 2]
1458d82c1	lea	rcx, [r8 + 1]
1458d82c5	cmp	rdx, rdi
1458d82c8	jae	0x1458d82f7
1458d82ca	mov	r10d, edi
1458d82cd	sub	r10d, r8d
1458d82d0	lea	r9, [rdi - 3]
1458d82d4	test	r10b, 1
1458d82d8	je	0x1458d82f2
1458d82da	mov	edx, dword ptr [rax + r8*4 + 8]
1458d82df	cmp	edx, dword ptr [rax + r8*4]
1458d82e3	je	0x1458d82ee
1458d82e5	mov	dword ptr [rax + r8*4 + 4], edx
1458d82ea	lea	rcx, [r8 + 2]
1458d82ee	lea	rdx, [r8 + 3]
1458d82f2	cmp	r9, r8
1458d82f5	jne	0x1458d8309
1458d82f7	mov	qword ptr [r11 + 0x28], rcx
1458d82fb	jmp	0x1458d80b2
1458d8300	add	rdx, 2
1458d8304	cmp	rdi, rdx
1458d8307	je	0x1458d82f7
1458d8309	mov	r8d, dword ptr [rax + rdx*4]
1458d830d	cmp	r8d, dword ptr [rax + rcx*4 - 4]
1458d8312	jne	0x1458d8322
1458d8314	mov	r8d, dword ptr [rax + rdx*4 + 4]
1458d8319	cmp	r8d, dword ptr [rax + rcx*4 - 4]
1458d831e	je	0x1458d8300
1458d8320	jmp	0x1458d8335
1458d8322	mov	dword ptr [rax + rcx*4], r8d
1458d8326	inc	rcx
1458d8329	mov	r8d, dword ptr [rax + rdx*4 + 4]
1458d832e	cmp	r8d, dword ptr [rax + rcx*4 - 4]
1458d8333	je	0x1458d8300
1458d8335	mov	dword ptr [rax + rcx*4], r8d
1458d8339	inc	rcx
1458d833c	jmp	0x1458d8300
1458d833e	lea	r8, [rbp - 1]
1458d8342	mov	rdx, rdi
1458d8345	call	0x145b199b0
1458d834a	nop
1458d834b	jmp	0x1458d8292
