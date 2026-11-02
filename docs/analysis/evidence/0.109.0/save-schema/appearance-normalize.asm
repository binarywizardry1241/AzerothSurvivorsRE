1459a2280	push	rsi
1459a2281	push	rdi
1459a2282	push	rbx
1459a2283	sub	rsp, 0x20
1459a2287	mov	ebx, r8d
1459a228a	mov	edi, edx
1459a228c	mov	rsi, rcx
1459a228f	call	0x1459a29c0
1459a2294	test	rax, rax
1459a2297	je	0x1459a23c3
1459a229d	mov	rcx, rax
1459a22a0	mov	edx, edi
1459a22a2	mov	r8d, ebx
1459a22a5	call	0x145a7d6b0
1459a22aa	test	al, 1
1459a22ac	je	0x1459a23c3
1459a22b2	mov	ecx, eax
1459a22b4	shr	ecx, 8
1459a22b7	test	cl, cl
1459a22b9	je	0x1459a2359
1459a22bf	dec	cl
1459a22c1	movzx	ecx, cl
1459a22c4	cmp	cl, sil
1459a22c7	cmovae	ecx, esi
1459a22ca	mov	r8d, eax
1459a22cd	shr	r8d, 0x10
1459a22d1	test	r8b, r8b
1459a22d4	je	0x1459a236b
1459a22da	mov	edx, esi
1459a22dc	shr	edx, 8
1459a22df	dec	r8b
1459a22e2	movzx	edx, dl
1459a22e5	movzx	r8d, r8b
1459a22e9	cmp	r8b, dl
1459a22ec	cmovb	edx, r8d
1459a22f0	mov	r9d, eax
1459a22f3	shr	r9d, 0x18
1459a22f7	je	0x1459a2376
1459a22f9	mov	r8d, esi
1459a22fc	shr	r8d, 0x10
1459a2300	dec	r9b
1459a2303	movzx	r8d, r8b
1459a2307	movzx	r9d, r9b
1459a230b	cmp	r9b, r8b
1459a230e	cmovb	r8d, r9d
1459a2312	mov	r10, rax
1459a2315	shr	r10, 0x20
1459a2319	test	r10b, r10b
1459a231c	je	0x1459a2385
1459a231e	mov	r9d, esi
1459a2321	shr	r9d, 0x18
1459a2325	dec	r10b
1459a2328	movzx	r9d, r9b
1459a232c	movzx	r10d, r10b
1459a2330	cmp	r10b, r9b
1459a2333	cmovb	r9d, r10d
1459a2337	shr	rax, 0x28
1459a233b	and	rax, 0xff
1459a2341	je	0x1459a2394
1459a2343	shr	rsi, 0x20
1459a2347	dec	al
1459a2349	movzx	r10d, sil
1459a234d	movzx	eax, al
1459a2350	cmp	al, r10b
1459a2353	cmovb	r10d, eax
1459a2357	jmp	0x1459a2397
1459a2359	xor	ecx, ecx
1459a235b	mov	r8d, eax
1459a235e	shr	r8d, 0x10
1459a2362	test	r8b, r8b
1459a2365	jne	0x1459a22da
1459a236b	xor	edx, edx
1459a236d	mov	r9d, eax
1459a2370	shr	r9d, 0x18
1459a2374	jne	0x1459a22f9
1459a2376	xor	r8d, r8d
1459a2379	mov	r10, rax
1459a237c	shr	r10, 0x20
1459a2380	test	r10b, r10b
1459a2383	jne	0x1459a231e
1459a2385	xor	r9d, r9d
1459a2388	shr	rax, 0x28
1459a238c	and	rax, 0xff
1459a2392	jne	0x1459a2343
1459a2394	xor	r10d, r10d
1459a2397	movzx	eax, r10b
1459a239b	shl	rax, 0x20
1459a239f	movzx	r9d, r9b
1459a23a3	shl	r9d, 0x18
1459a23a7	or	r9, rax
1459a23aa	movzx	eax, r8b
1459a23ae	shl	eax, 0x10
1459a23b1	or	rax, r9
1459a23b4	movzx	edx, dl
1459a23b7	shl	edx, 8
1459a23ba	or	rdx, rax
1459a23bd	movzx	esi, cl
1459a23c0	or	rsi, rdx
1459a23c3	mov	rax, rsi
1459a23c6	add	rsp, 0x20
1459a23ca	pop	rbx
1459a23cb	pop	rdi
1459a23cc	pop	rsi
1459a23cd	ret
