1459b8310	push	rbp
1459b8311	push	r15
1459b8313	push	r14
1459b8315	push	r13
1459b8317	push	r12
1459b8319	push	rsi
1459b831a	push	rdi
1459b831b	push	rbx
1459b831c	sub	rsp, 0xb8
1459b8323	lea	rbp, [rsp + 0x80]
1459b832b	mov	qword ptr [rbp + 0x30], 0xfffffffffffffffe
1459b8333	mov	rsi, rcx
1459b8336	mov	rax, qword ptr [rdx]
1459b8339	mov	r13, qword ptr [rdx + 8]
1459b833d	mov	rbx, qword ptr [rdx + 0x10]
1459b8341	nop	word ptr cs:[rax + rax]
1459b8350	cmp	rax, r13
1459b8353	je	0x1459b84dd
1459b8359	mov	rcx, rbx
1459b835c	lea	r15, [rax + 4]
1459b8360	mov	qword ptr [rdx], r15
1459b8363	mov	r8d, dword ptr [rax]
1459b8366	inc	rbx
1459b8369	mov	qword ptr [rdx + 0x10], rbx
1459b836d	mov	rax, r15
1459b8370	test	r8d, r8d
1459b8373	je	0x1459b8350
1459b8375	mov	qword ptr [rbp - 0x38], rcx
1459b8379	mov	dword ptr [rbp + 8], r8d
1459b837d	lea	rax, [rbp - 0x38]
1459b8381	mov	qword ptr [rbp - 0x20], rax
1459b8385	lea	rax, [rip + 0x227444]
1459b838c	mov	qword ptr [rbp - 0x18], rax
1459b8390	lea	rax, [rbp + 8]
1459b8394	mov	qword ptr [rbp - 0x10], rax
1459b8398	lea	rax, [rip + 0x226541]
1459b839f	mov	qword ptr [rbp - 8], rax
1459b83a3	lea	rdx, [rip + 0x187e89e]
1459b83aa	lea	rcx, [rbp - 0x58]
1459b83ae	lea	r8, [rbp - 0x20]
1459b83b2	call	0x145bcce30
1459b83b7	mov	rdi, qword ptr [rbp - 0x58]
1459b83bb	cmp	rdi, -1
1459b83bf	je	0x1459b84dd
1459b83c5	mov	r12, qword ptr [rbp - 0x50]
1459b83c9	call	0x140002200
1459b83ce	mov	ecx, 0x60
1459b83d3	mov	edx, 8
1459b83d8	call	0x1400021c0
1459b83dd	test	rax, rax
1459b83e0	je	0x1459b851c
1459b83e6	mov	r14, rax
1459b83e9	mov	rax, qword ptr [rbp - 0x48]
1459b83ed	mov	qword ptr [r14 + 0x10], rax
1459b83f1	movups	xmm0, xmmword ptr [rbp - 0x58]
1459b83f5	movups	xmmword ptr [r14], xmm0
1459b83f9	mov	qword ptr [rbp + 8], 4
1459b8401	mov	qword ptr [rbp + 0x10], r14
1459b8405	mov	qword ptr [rbp + 0x18], 1
1459b840d	mov	edi, 1
1459b8412	lea	r12, [rip + 0x2264c7]
1459b8419	xor	eax, eax
1459b841b	nop	dword ptr [rax + rax]
1459b8420	cmp	r15, r13
1459b8423	je	0x1459b84f6
1459b8429	mov	ecx, dword ptr [r15]
1459b842c	add	r15, 4
1459b8430	dec	rax
1459b8433	test	ecx, ecx
1459b8435	je	0x1459b8420
1459b8437	sub	rbx, rax
1459b843a	lea	rax, [rbx - 1]
1459b843e	mov	qword ptr [rbp - 0x40], rax
1459b8442	mov	dword ptr [rbp + 4], ecx
1459b8445	lea	rax, [rbp - 0x40]
1459b8449	mov	qword ptr [rbp - 0x20], rax
1459b844d	lea	rax, [rip + 0x22737c]
1459b8454	mov	qword ptr [rbp - 0x18], rax
1459b8458	lea	rax, [rbp + 4]
1459b845c	mov	qword ptr [rbp - 0x10], rax
1459b8460	mov	qword ptr [rbp - 8], r12
1459b8464	lea	rcx, [rbp - 0x38]
1459b8468	lea	rdx, [rip + 0x187e7d9]
1459b846f	lea	r8, [rbp - 0x20]
1459b8473	call	0x145bcce30
1459b8478	nop
1459b8479	mov	rax, qword ptr [rbp - 0x38]
1459b847d	mov	qword ptr [rbp + 0x28], rax
1459b8481	cmp	rax, -1
1459b8485	je	0x1459b84f6
1459b8487	cmp	rdi, qword ptr [rbp + 8]
1459b848b	jne	0x1459b84bb
1459b848d	mov	rax, qword ptr [rbp - 0x30]
1459b8491	mov	qword ptr [rbp + 0x20], rax
1459b8495	mov	qword ptr [rsp + 0x20], 0x18
1459b849e	mov	r8d, 1
1459b84a4	mov	r9d, 8
1459b84aa	lea	rcx, [rbp + 8]
1459b84ae	mov	rdx, rdi
1459b84b1	call	0x145bfa970
1459b84b6	nop
1459b84b7	mov	r14, qword ptr [rbp + 0x10]
1459b84bb	lea	rax, [rdi + rdi*2]
1459b84bf	mov	rcx, qword ptr [rbp - 0x28]
1459b84c3	mov	qword ptr [r14 + rax*8 + 0x10], rcx
1459b84c8	movups	xmm0, xmmword ptr [rbp - 0x38]
1459b84cc	movups	xmmword ptr [r14 + rax*8], xmm0
1459b84d1	inc	rdi
1459b84d4	mov	qword ptr [rbp + 0x18], rdi
1459b84d8	jmp	0x1459b8419
1459b84dd	mov	qword ptr [rsi], 0
1459b84e4	mov	qword ptr [rsi + 8], 8
1459b84ec	mov	qword ptr [rsi + 0x10], 0
1459b84f4	jmp	0x1459b8505
1459b84f6	mov	rax, qword ptr [rbp + 0x18]
1459b84fa	mov	qword ptr [rsi + 0x10], rax
1459b84fe	movups	xmm0, xmmword ptr [rbp + 8]
1459b8502	movups	xmmword ptr [rsi], xmm0
1459b8505	mov	rax, rsi
1459b8508	add	rsp, 0xb8
1459b850f	pop	rbx
1459b8510	pop	rdi
1459b8511	pop	rsi
1459b8512	pop	r12
1459b8514	pop	r13
1459b8516	pop	r14
1459b8518	pop	r15
1459b851a	pop	rbp
1459b851b	ret
1459b851c	mov	qword ptr [rbp + 0x20], r12
1459b8520	mov	qword ptr [rbp + 0x28], rdi
1459b8524	mov	ecx, 8
1459b8529	mov	edx, 0x60
1459b852e	call	0x145d992bb
1459b8533	nop
1459b8534	ud2
