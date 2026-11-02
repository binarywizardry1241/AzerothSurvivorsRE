1400a2190	push	rbp
1400a2191	push	r15
1400a2193	push	r14
1400a2195	push	r13
1400a2197	push	r12
1400a2199	push	rsi
1400a219a	push	rdi
1400a219b	push	rbx
1400a219c	sub	rsp, 0x58
1400a21a0	lea	rbp, [rsp + 0x50]
1400a21a5	mov	qword ptr [rbp], 0xfffffffffffffffe
1400a21ad	mov	rsi, rcx
1400a21b0	mov	r15, qword ptr [rdx]
1400a21b3	mov	r14, qword ptr [rdx + 8]
1400a21b7	cmp	r15, r14
1400a21ba	je	0x1400a242e
1400a21c0	mov	r12, qword ptr [rdx + 0x10]
1400a21c4	cmp	byte ptr [r12], 1
1400a21c9	jne	0x1400a242e
1400a21cf	mov	r13, qword ptr [rdx + 0x18]
1400a21d3	mov	rax, qword ptr [r13]
1400a21d7	cmp	byte ptr [rax], 1
1400a21da	jne	0x1400a2231
1400a21dc	add	r15, 0x50
1400a21e0	movabs	rax, 0x7b18000000000000
1400a21ea	jmp	0x1400a2208
1400a21ec	nop	dword ptr [rax]
1400a21f0	cmp	byte ptr [r15 - 3], 1
1400a21f5	jne	0x1400a2291
1400a21fb	cmp	r15, r14
1400a21fe	lea	r15, [r15 + 0x50]
1400a2202	je	0x1400a242e
1400a2208	mov	ecx, dword ptr [r15 - 0x10]
1400a220c	cmp	ecx, 0x73
1400a220f	je	0x1400a21f0
1400a2211	mov	r8, qword ptr [r13 + 8]
1400a2215	cmp	byte ptr [r8], 1
1400a2219	jne	0x1400a21fb
1400a221b	test	byte ptr [r15 - 4], 1
1400a2220	jne	0x1400a21fb
1400a2222	cmp	ecx, 0x3e
1400a2225	ja	0x1400a21f0
1400a2227	mov	ecx, ecx
1400a2229	bt	rax, rcx
1400a222d	jb	0x1400a21fb
1400a222f	jmp	0x1400a21f0
1400a2231	mov	rax, qword ptr [r13 + 8]
1400a2235	cmp	byte ptr [rax], 1
1400a2238	jne	0x1400a242e
1400a223e	add	r15, 0x50
1400a2242	movabs	rax, 0x7b18000000000000
1400a224c	jmp	0x1400a226d
1400a224e	cmp	byte ptr [r15 - 3], 1
1400a2253	jne	0x1400a2291
1400a2255	nop	word ptr cs:[rax + rax]
1400a2260	cmp	r15, r14
1400a2263	lea	r15, [r15 + 0x50]
1400a2267	je	0x1400a242e
1400a226d	mov	ecx, dword ptr [r15 - 0x10]
1400a2271	cmp	ecx, 0x73
1400a2274	sete	r8b
1400a2278	or	r8b, byte ptr [r15 - 4]
1400a227c	test	r8b, 1
1400a2280	jne	0x1400a2260
1400a2282	cmp	ecx, 0x3e
1400a2285	ja	0x1400a224e
1400a2287	mov	ecx, ecx
1400a2289	bt	rax, rcx
1400a228d	jb	0x1400a2260
1400a228f	jmp	0x1400a224e
1400a2291	lea	rax, [r15 - 0x50]
1400a2295	mov	qword ptr [rdx], r15
1400a2298	mov	edi, dword ptr [rax + 0x40]
1400a229b	cmp	edi, -1
1400a229e	je	0x1400a242e
1400a22a4	mov	rbx, qword ptr [rax + 0x44]
1400a22a8	call	0x140002200
1400a22ad	mov	ecx, 0x30
1400a22b2	mov	edx, 4
1400a22b7	call	0x1400021c0
1400a22bc	test	rax, rax
1400a22bf	je	0x1400a2459
1400a22c5	mov	dword ptr [rax], edi
1400a22c7	mov	qword ptr [rax + 4], rbx
1400a22cb	mov	qword ptr [rbp - 0x18], 4
1400a22d3	mov	qword ptr [rbp - 0x10], rax
1400a22d7	mov	qword ptr [rbp - 8], 1
1400a22df	cmp	r15, r14
1400a22e2	je	0x1400a2415
1400a22e8	mov	edx, 1
1400a22ed	movabs	rbx, 0x7b18000000000000
1400a22f7	lea	rcx, [rbp - 0x18]
1400a22fb	cmp	byte ptr [r12], 1
1400a2300	jne	0x1400a2415
1400a2306	mov	r8, qword ptr [r13]
1400a230a	cmp	byte ptr [r8], 1
1400a230e	jne	0x1400a2358
1400a2310	add	r15, 0x50
1400a2314	jmp	0x1400a232e
1400a2316	cmp	byte ptr [r15 - 3], 1
1400a231b	jne	0x1400a23b2
1400a2321	cmp	r15, r14
1400a2324	lea	r15, [r15 + 0x50]
1400a2328	je	0x1400a2415
1400a232e	mov	edi, dword ptr [r15 - 0x10]
1400a2332	cmp	edi, 0x73
1400a2335	je	0x1400a2316
1400a2337	mov	r8, qword ptr [r13 + 8]
1400a233b	cmp	byte ptr [r8], 1
1400a233f	jne	0x1400a2321
1400a2341	test	byte ptr [r15 - 4], 1
1400a2346	jne	0x1400a2321
1400a2348	cmp	edi, 0x3e
1400a234b	ja	0x1400a2316
1400a234d	mov	r8d, edi
1400a2350	bt	rbx, r8
1400a2354	jb	0x1400a2321
1400a2356	jmp	0x1400a2316
1400a2358	mov	r8, qword ptr [r13 + 8]
1400a235c	cmp	byte ptr [r8], 1
1400a2360	jne	0x1400a2415
1400a2366	add	r15, 0x50
1400a236a	jmp	0x1400a238d
1400a236c	cmp	byte ptr [r15 - 3], 1
1400a2371	jne	0x1400a23b2
1400a2373	nop	word ptr cs:[rax + rax]
1400a2380	cmp	r15, r14
1400a2383	lea	r15, [r15 + 0x50]
1400a2387	je	0x1400a2415
1400a238d	mov	edi, dword ptr [r15 - 0x10]
1400a2391	cmp	edi, 0x73
1400a2394	sete	r8b
1400a2398	or	r8b, byte ptr [r15 - 4]
1400a239c	test	r8b, 1
1400a23a0	jne	0x1400a2380
1400a23a2	cmp	edi, 0x3e
1400a23a5	ja	0x1400a236c
1400a23a7	mov	r8d, edi
1400a23aa	bt	rbx, r8
1400a23ae	jb	0x1400a2380
1400a23b0	jmp	0x1400a236c
1400a23b2	lea	r8, [r15 - 0x50]
1400a23b6	cmp	edi, -1
1400a23b9	je	0x1400a2415
1400a23bb	mov	r8, qword ptr [r8 + 0x44]
1400a23bf	mov	qword ptr [rbp - 0x28], r8
1400a23c3	cmp	rdx, qword ptr [rbp - 0x18]
1400a23c7	jne	0x1400a23f4
1400a23c9	mov	qword ptr [rsp + 0x20], 0xc
1400a23d2	mov	r8d, 1
1400a23d8	mov	r9d, 4
1400a23de	mov	qword ptr [rbp - 0x20], rdx
1400a23e2	call	0x145bfa970
1400a23e7	nop
1400a23e8	mov	rax, qword ptr [rbp - 0x10]
1400a23ec	mov	rdx, qword ptr [rbp - 0x20]
1400a23f0	lea	rcx, [rbp - 0x18]
1400a23f4	lea	r8, [rdx + rdx*2]
1400a23f8	mov	dword ptr [rax + r8*4], edi
1400a23fc	mov	r9, qword ptr [rbp - 0x28]
1400a2400	mov	qword ptr [rax + r8*4 + 4], r9
1400a2405	inc	rdx
1400a2408	mov	qword ptr [rbp - 8], rdx
1400a240c	cmp	r15, r14
1400a240f	jne	0x1400a22fb
1400a2415	mov	rax, qword ptr [rbp - 8]
1400a2419	mov	qword ptr [rsi + 0x10], rax
1400a241d	mov	rax, qword ptr [rbp - 0x18]
1400a2421	mov	qword ptr [rsi], rax
1400a2424	mov	rax, qword ptr [rbp - 0x10]
1400a2428	mov	qword ptr [rsi + 8], rax
1400a242c	jmp	0x1400a2445
1400a242e	mov	qword ptr [rsi], 0
1400a2435	mov	qword ptr [rsi + 8], 4
1400a243d	mov	qword ptr [rsi + 0x10], 0
1400a2445	mov	rax, rsi
1400a2448	add	rsp, 0x58
1400a244c	pop	rbx
1400a244d	pop	rdi
1400a244e	pop	rsi
1400a244f	pop	r12
1400a2451	pop	r13
1400a2453	pop	r14
1400a2455	pop	r15
1400a2457	pop	rbp
1400a2458	ret
1400a2459	mov	ecx, 4
1400a245e	mov	edx, 0x30
1400a2463	call	0x145d992bb
1400a2468	ud2
