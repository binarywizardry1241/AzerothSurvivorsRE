14018e450	push	rbp
14018e451	push	r15
14018e453	push	r14
14018e455	push	r13
14018e457	push	r12
14018e459	push	rsi
14018e45a	push	rdi
14018e45b	push	rbx
14018e45c	sub	rsp, 0x128
14018e463	lea	rbp, [rsp + 0x80]
14018e46b	movdqa	xmmword ptr [rbp + 0x90], xmm9
14018e474	movdqa	xmmword ptr [rbp + 0x80], xmm8
14018e47d	movdqa	xmmword ptr [rbp + 0x70], xmm7
14018e482	movdqa	xmmword ptr [rbp + 0x60], xmm6
14018e487	mov	qword ptr [rbp + 0x58], 0xfffffffffffffffe
14018e48f	cmp	qword ptr [rdx + 0x90], 0
14018e497	je	0x14018e727
14018e49d	mov	rax, qword ptr [rdx + 0x78]
14018e4a1	mov	rcx, qword ptr [rdx + 0x80]
14018e4a8	movabs	r9, 0x6014d8313cc56d15
14018e4b2	xor	r10d, r10d
14018e4b5	movdqa	xmm6, xmmword ptr [rip + 0x5c0f573]
14018e4bd	pcmpeqd	xmm0, xmm0
14018e4c1	movdqa	xmm7, xmmword ptr [rip + 0x5c0f577]
14018e4c9	and	r9, rcx
14018e4cc	movdqu	xmm1, xmmword ptr [rax + r9]
14018e4d2	movdqa	xmm2, xmm1
14018e4d6	pcmpeqb	xmm2, xmm6
14018e4da	pmovmskb	r11d, xmm2
14018e4df	test	r11d, r11d
14018e4e2	je	0x14018e520
14018e4e4	tzcnt	esi, r11d
14018e4e9	add	rsi, r9
14018e4ec	and	rsi, rcx
14018e4ef	neg	rsi
14018e4f2	lea	rsi, [rsi + rsi*2]
14018e4f6	movdqu	xmm2, xmmword ptr [rax + rsi*8 - 0x18]
14018e4fc	pcmpeqb	xmm2, xmm7
14018e500	pmovmskb	edi, xmm2
14018e504	cmp	edi, 0xffff
14018e50a	je	0x14018e53f
14018e50c	lea	esi, [r11 - 1]
14018e510	and	si, r11w
14018e514	mov	r11d, esi
14018e517	jne	0x14018e4e4
14018e519	nop	dword ptr [rax]
14018e520	pcmpeqb	xmm1, xmm0
14018e524	pmovmskb	r11d, xmm1
14018e529	test	r11d, r11d
14018e52c	jne	0x14018e727
14018e532	add	r9, r10
14018e535	add	r9, 0x10
14018e539	add	r10, 0x10
14018e53d	jmp	0x14018e4c9
14018e53f	lea	rax, [rax + rsi*8]
14018e543	mov	rax, qword ptr [rax - 8]
14018e547	cmp	rax, qword ptr [rdx + 0x218]
14018e54e	jae	0x14018e727
14018e554	mov	rcx, qword ptr [rdx + 0x210]
14018e55b	mov	rcx, qword ptr [rcx + rax*8]
14018e55f	test	rcx, rcx
14018e562	je	0x14018e727
14018e568	mov	rax, qword ptr [rdx + 0x1e0]
14018e56f	not	rcx
14018e572	imul	rcx, rcx, 0x38
14018e576	cmp	byte ptr [rax + rcx + 0x30], 0
14018e57b	je	0x14018e727
14018e581	add	rax, rcx
14018e584	mov	rcx, qword ptr [rax + 0x10]
14018e588	mov	r9d, dword ptr [rdx + 0x5b0]
14018e58f	mov	dword ptr [rax + 0x2c], r9d
14018e593	mov	byte ptr [rcx], 0
14018e596	cmp	qword ptr [rdx + 0x90], 0
14018e59e	je	0x14018e753
14018e5a4	mov	rax, qword ptr [rdx + 0x78]
14018e5a8	mov	rcx, qword ptr [rdx + 0x80]
14018e5af	movabs	r9, 0x44863156102a335b
14018e5b9	xor	r10d, r10d
14018e5bc	movdqa	xmm0, xmmword ptr [rip + 0x5c0f18c]
14018e5c4	pcmpeqd	xmm1, xmm1
14018e5c8	movdqa	xmm2, xmmword ptr [rip + 0x5c3eb60]
14018e5d0	and	r9, rcx
14018e5d3	movdqu	xmm3, xmmword ptr [rax + r9]
14018e5d9	movdqa	xmm4, xmm3
14018e5dd	pcmpeqb	xmm4, xmm0
14018e5e1	pmovmskb	r11d, xmm4
14018e5e6	test	r11d, r11d
14018e5e9	je	0x14018e620
14018e5eb	tzcnt	esi, r11d
14018e5f0	add	rsi, r9
14018e5f3	and	rsi, rcx
14018e5f6	neg	rsi
14018e5f9	lea	rsi, [rsi + rsi*2]
14018e5fd	movdqu	xmm4, xmmword ptr [rax + rsi*8 - 0x18]
14018e603	pcmpeqb	xmm4, xmm2
14018e607	pmovmskb	edi, xmm4
14018e60b	cmp	edi, 0xffff
14018e611	je	0x14018e63f
14018e613	lea	esi, [r11 - 1]
14018e617	and	si, r11w
14018e61b	mov	r11d, esi
14018e61e	jne	0x14018e5eb
14018e620	pcmpeqb	xmm3, xmm1
14018e624	pmovmskb	r11d, xmm3
14018e629	test	r11d, r11d
14018e62c	jne	0x14018e753
14018e632	add	r9, r10
14018e635	add	r9, 0x10
14018e639	add	r10, 0x10
14018e63d	jmp	0x14018e5d0
14018e63f	lea	r9, [rax + rsi*8]
14018e643	mov	r9, qword ptr [r9 - 8]
14018e647	mov	r10, qword ptr [rdx + 0x218]
14018e64e	cmp	r9, r10
14018e651	jae	0x14018e753
14018e657	mov	r11, qword ptr [rdx + 0x210]
14018e65e	mov	rsi, qword ptr [r11 + r9*8]
14018e662	test	rsi, rsi
14018e665	je	0x14018e753
14018e66b	mov	r9, qword ptr [rdx + 0x1e0]
14018e672	not	rsi
14018e675	imul	rsi, rsi, 0x38
14018e679	cmp	byte ptr [r9 + rsi + 0x30], 0
14018e67f	je	0x14018e753
14018e685	add	rsi, r9
14018e688	mov	rsi, qword ptr [rsi + 0x10]
14018e68c	cmp	byte ptr [rsi + 0xd], 0
14018e690	jne	0x14018e7c4
14018e696	movabs	rsi, 0x20c5b97f928e3b62
14018e6a0	xor	edi, edi
14018e6a2	movdqa	xmm0, xmmword ptr [rip + 0x5c0eed6]
14018e6aa	pcmpeqd	xmm1, xmm1
14018e6ae	movdqa	xmm2, xmmword ptr [rip + 0x5c0eeda]
14018e6b6	and	rsi, rcx
14018e6b9	movdqu	xmm3, xmmword ptr [rax + rsi]
14018e6be	movdqa	xmm4, xmm3
14018e6c2	pcmpeqb	xmm4, xmm0
14018e6c6	pmovmskb	ebx, xmm4
14018e6ca	test	ebx, ebx
14018e6cc	je	0x14018e70a
14018e6ce	tzcnt	r14d, ebx
14018e6d3	add	r14, rsi
14018e6d6	and	r14, rcx
14018e6d9	neg	r14
14018e6dc	lea	r14, [r14 + r14*2]
14018e6e0	movdqu	xmm4, xmmword ptr [rax + r14*8 - 0x18]
14018e6e7	pcmpeqb	xmm4, xmm2
14018e6eb	pmovmskb	r15d, xmm4
14018e6f0	cmp	r15d, 0xffff
14018e6f7	je	0x14018e77f
14018e6fd	lea	r14d, [rbx - 1]
14018e701	and	r14w, bx
14018e705	mov	ebx, r14d
14018e708	jne	0x14018e6ce
14018e70a	pcmpeqb	xmm3, xmm1
14018e70e	pmovmskb	ebx, xmm3
14018e712	test	ebx, ebx
14018e714	jne	0x14018eba8
14018e71a	add	rsi, rdi
14018e71d	add	rsi, 0x10
14018e721	add	rdi, 0x10
14018e725	jmp	0x14018e6b6
14018e727	lea	rax, [rbp + 0x57]
14018e72b	mov	qword ptr [rbp - 0x18], rax
14018e72f	lea	rax, [rip + 0x4e6ebca]
14018e736	mov	qword ptr [rbp - 0x10], rax
14018e73a	lea	rcx, [rip + 0x5c566bf]
14018e741	lea	r8, [rip + 0x5c56f38]
14018e748	lea	rdx, [rbp - 0x18]
14018e74c	call	0x145d99830
14018e751	ud2
14018e753	lea	rax, [rbp + 0x57]
14018e757	mov	qword ptr [rbp - 0x18], rax
14018e75b	lea	rax, [rip + 0x4e6eb9e]
14018e762	mov	qword ptr [rbp - 0x10], rax
14018e766	lea	rcx, [rip + 0x5c56693]
14018e76d	lea	r8, [rip + 0x5c56f24]
14018e774	lea	rdx, [rbp - 0x18]
14018e778	call	0x145d99830
14018e77d	ud2
14018e77f	lea	rax, [rax + r14*8]
14018e783	mov	rax, qword ptr [rax - 8]
14018e787	cmp	rax, r10
14018e78a	jae	0x14018eba8
14018e790	mov	rax, qword ptr [r11 + rax*8]
14018e794	test	rax, rax
14018e797	je	0x14018eba8
14018e79d	not	rax
14018e7a0	imul	rax, rax, 0x38
14018e7a4	cmp	byte ptr [r9 + rax + 0x30], 0
14018e7aa	je	0x14018eba8
14018e7b0	add	r9, rax
14018e7b3	mov	rax, qword ptr [r9 + 0x10]
14018e7b7	cmp	byte ptr [rax + 0xe8], 0
14018e7be	je	0x14018ebd4
14018e7c4	mov	rcx, rdx
14018e7c7	mov	rsi, rdx
14018e7ca	mov	rdi, r8
14018e7cd	call	0x140725c40
14018e7d2	mov	rdx, rsi
14018e7d5	cmp	qword ptr [rsi + 0x90], 0
14018e7dd	je	0x14018e8e0
14018e7e3	mov	r8, rdi
14018e7e6	mov	esi, eax
14018e7e8	xor	sil, 1
14018e7ec	mov	rax, qword ptr [rdx + 0x78]
14018e7f0	mov	rcx, qword ptr [rdx + 0x80]
14018e7f7	movabs	r9, 0x7c00e6ba9569de82
14018e801	xor	r10d, r10d
14018e804	movdqa	xmm8, xmmword ptr [rip + 0x5c0ede3]
14018e80d	pcmpeqd	xmm0, xmm0
14018e811	movdqa	xmm9, xmmword ptr [rip + 0x5c0ede6]
14018e81a	and	r9, rcx
14018e81d	movdqu	xmm1, xmmword ptr [rax + r9]
14018e823	movdqa	xmm2, xmm1
14018e827	pcmpeqb	xmm2, xmm8
14018e82c	pmovmskb	r11d, xmm2
14018e831	test	r11d, r11d
14018e834	je	0x14018e86c
14018e836	tzcnt	edi, r11d
14018e83b	add	rdi, r9
14018e83e	and	rdi, rcx
14018e841	neg	rdi
14018e844	lea	rdi, [rdi + rdi*2]
14018e848	movdqu	xmm2, xmmword ptr [rax + rdi*8 - 0x18]
14018e84e	pcmpeqb	xmm2, xmm9
14018e853	pmovmskb	ebx, xmm2
14018e857	cmp	ebx, 0xffff
14018e85d	je	0x14018e887
14018e85f	lea	edi, [r11 - 1]
14018e863	and	di, r11w
14018e867	mov	r11d, edi
14018e86a	jne	0x14018e836
14018e86c	pcmpeqb	xmm1, xmm0
14018e870	pmovmskb	r11d, xmm1
14018e875	test	r11d, r11d
14018e878	jne	0x14018e8e0
14018e87a	add	r9, r10
14018e87d	add	r9, 0x10
14018e881	add	r10, 0x10
14018e885	jmp	0x14018e81a
14018e887	lea	r9, [rax + rdi*8]
14018e88b	mov	r11, qword ptr [r9 - 8]
14018e88f	mov	r9, qword ptr [rdx + 0x218]
14018e896	cmp	r11, r9
14018e899	jae	0x14018e8e0
14018e89b	mov	r10, qword ptr [rdx + 0x210]
14018e8a2	mov	r11, qword ptr [r10 + r11*8]
14018e8a6	test	r11, r11
14018e8a9	je	0x14018e8e0
14018e8ab	mov	rdi, qword ptr [rdx + 0x1e0]
14018e8b2	not	r11
14018e8b5	imul	r11, r11, 0x38
14018e8b9	cmp	byte ptr [rdi + r11 + 0x30], 0
14018e8bf	je	0x14018e8e0
14018e8c1	add	r11, rdi
14018e8c4	mov	r11, qword ptr [r11 + 0x10]
14018e8c8	cmp	byte ptr [r11 + 0x1c0], 1
14018e8d0	jne	0x14018e90c
14018e8d2	cmp	qword ptr [r11 + 0x90], -1
14018e8da	setne	r11b
14018e8de	jmp	0x14018e90f
14018e8e0	lea	rax, [rbp + 0x57]
14018e8e4	mov	qword ptr [rbp - 0x18], rax
14018e8e8	lea	rax, [rip + 0x4e6ea11]
14018e8ef	mov	qword ptr [rbp - 0x10], rax
14018e8f3	lea	rcx, [rip + 0x5c56506]
14018e8fa	lea	r8, [rip + 0x5c56dc7]
14018e901	lea	rdx, [rbp - 0x18]
14018e905	call	0x145d99830
14018e90a	ud2
14018e90c	xor	r11d, r11d
14018e90f	mov	byte ptr [rbp + 0x53], r11b
14018e913	movabs	r11, 0x2a25d76ea6ce1d0d
14018e91d	xor	ebx, ebx
14018e91f	movdqa	xmm0, xmmword ptr [rip + 0x5c3e6a9]
14018e927	pcmpeqd	xmm1, xmm1
14018e92b	movdqa	xmm2, xmmword ptr [rip + 0x5c563ed]
14018e933	and	r11, rcx
14018e936	movdqu	xmm3, xmmword ptr [rax + r11]
14018e93c	movdqa	xmm4, xmm3
14018e940	pcmpeqb	xmm4, xmm0
14018e944	pmovmskb	r14d, xmm4
14018e949	test	r14d, r14d
14018e94c	je	0x14018e986
14018e94e	tzcnt	r15d, r14d
14018e953	add	r15, r11
14018e956	and	r15, rcx
14018e959	neg	r15
14018e95c	lea	r15, [r15 + r15*2]
14018e960	movdqu	xmm4, xmmword ptr [rax + r15*8 - 0x18]
14018e967	pcmpeqb	xmm4, xmm2
14018e96b	pmovmskb	r12d, xmm4
14018e970	cmp	r12d, 0xffff
14018e977	je	0x14018e9a5
14018e979	lea	r15d, [r14 - 1]
14018e97d	and	r15w, r14w
14018e981	mov	r14d, r15d
14018e984	jne	0x14018e94e
14018e986	pcmpeqb	xmm3, xmm1
14018e98a	pmovmskb	r14d, xmm3
14018e98f	test	r14d, r14d
14018e992	jne	0x14018eb7c
14018e998	add	r11, rbx
14018e99b	add	r11, 0x10
14018e99f	add	rbx, 0x10
14018e9a3	jmp	0x14018e933
14018e9a5	lea	rax, [rax + r15*8]
14018e9a9	mov	rax, qword ptr [rax - 8]
14018e9ad	cmp	rax, r9
14018e9b0	jae	0x14018eb7c
14018e9b6	mov	rax, qword ptr [r10 + rax*8]
14018e9ba	test	rax, rax
14018e9bd	je	0x14018eb7c
14018e9c3	not	rax
14018e9c6	imul	rax, rax, 0x38
14018e9ca	cmp	byte ptr [rdi + rax + 0x30], 0
14018e9cf	je	0x14018eb7c
14018e9d5	add	rdi, rax
14018e9d8	mov	r14, qword ptr [rdi + 0x10]
14018e9dc	mov	qword ptr [rbp + 0x40], rdx
14018e9e0	mov	r15d, dword ptr [rdx + 0x5b0]
14018e9e7	mov	rcx, qword ptr [r8]
14018e9ea	xor	ebx, ebx
14018e9ec	mov	rdx, rcx
14018e9ef	sub	rdx, qword ptr [r14 + 0x18]
14018e9f3	cmovb	rdx, rbx
14018e9f7	sub	rcx, qword ptr [r14 + 0x38]
14018e9fb	cmovb	rcx, rbx
14018e9ff	imul	rax, rdx, 0x58
14018ea03	add	rax, qword ptr [r14 + 8]
14018ea07	mov	r9, qword ptr [r14 + 0x10]
14018ea0b	sub	r9, rdx
14018ea0e	cmovb	r9, rbx
14018ea12	mov	edx, 8
14018ea17	cmovb	rax, rdx
14018ea1b	imul	r10, rcx, 0x58
14018ea1f	add	r10, qword ptr [r14 + 0x28]
14018ea23	mov	r11, qword ptr [r14 + 0x30]
14018ea27	sub	r11, rcx
14018ea2a	cmovb	r10, rdx
14018ea2e	cmovb	r11, rbx
14018ea32	lea	rcx, [r11 + r9]
14018ea36	mov	rdx, qword ptr [r14 + 0x40]
14018ea3a	sub	rdx, rcx
14018ea3d	mov	qword ptr [r8], rdx
14018ea40	imul	rdx, r9, 0x58
14018ea44	add	rdx, rax
14018ea47	imul	r9, r11, 0x58
14018ea4b	add	r9, r10
14018ea4e	mov	qword ptr [rbp + 0x38], r8
14018ea52	mov	qword ptr [rbp - 0x18], r8
14018ea56	mov	qword ptr [rbp - 0x10], rax
14018ea5a	mov	qword ptr [rbp - 8], rdx
14018ea5e	mov	qword ptr [rbp], r10
14018ea62	mov	qword ptr [rbp + 8], r9
14018ea66	mov	qword ptr [rbp + 0x10], rcx
14018ea6a	lea	rcx, [rbp - 0x38]
14018ea6e	lea	rdx, [rbp - 0x18]
14018ea72	call	0x1400a1d90
14018ea77	mov	r11, qword ptr [rbp - 0x30]
14018ea7b	mov	r13, qword ptr [rbp - 0x28]
14018ea7f	test	sil, sil
14018ea82	je	0x14018eabc
14018ea84	mov	rax, r13
14018ea87	shl	rax, 4
14018ea8b	lea	rdx, [rax + rax*4]
14018ea8f	mov	rcx, r11
14018ea92	nop	word ptr cs:[rax + rax]
14018eaa0	mov	rax, rdx
14018eaa3	test	rdx, rdx
14018eaa6	je	0x14018eab6
14018eaa8	cmp	dword ptr [rcx + 0x40], 0x73
14018eaac	lea	rcx, [rcx + 0x50]
14018eab0	lea	rdx, [rax - 0x50]
14018eab4	jne	0x14018eaa0
14018eab6	test	rax, rax
14018eab9	setne	bl
14018eabc	mov	byte ptr [rbp + 0x52], bl
14018eabf	lea	rax, [rbp + 0x52]
14018eac3	mov	qword ptr [rbp - 0x60], rax
14018eac7	lea	rax, [rbp + 0x53]
14018eacb	mov	qword ptr [rbp - 0x58], rax
14018eacf	test	r13, r13
14018ead2	je	0x14018ec53
14018ead8	mov	rcx, r13
14018eadb	shl	rcx, 4
14018eadf	lea	rcx, [rcx + rcx*4]
14018eae3	test	byte ptr [rbp + 0x53], 1
14018eae7	je	0x14018ebdb
14018eaed	movabs	rdx, 0x7b18000000000000
14018eaf7	xor	r8d, r8d
14018eafa	test	bl, bl
14018eafc	jne	0x14018eb4d
14018eafe	jmp	0x14018eb0d
14018eb00	add	r8, 0x50
14018eb04	cmp	rcx, r8
14018eb07	je	0x14018ec53
14018eb0d	test	byte ptr [r11 + r8 + 0x4c], 1
14018eb13	jne	0x14018eb00
14018eb15	mov	r9d, dword ptr [r11 + r8 + 0x40]
14018eb1a	cmp	r9d, 0x73
14018eb1e	je	0x14018eb00
14018eb20	cmp	r9d, 0x3e
14018eb24	ja	0x14018ec05
14018eb2a	mov	r9d, r9d
14018eb2d	bt	rdx, r9
14018eb31	jb	0x14018eb00
14018eb33	jmp	0x14018ec05
14018eb38	nop	dword ptr [rax + rax]
14018eb40	add	r8, 0x50
14018eb44	cmp	rcx, r8
14018eb47	je	0x14018ec53
14018eb4d	mov	r9d, dword ptr [r11 + r8 + 0x40]
14018eb52	cmp	r9d, 0x73
14018eb56	je	0x14018ec05
14018eb5c	test	byte ptr [r11 + r8 + 0x4c], 1
14018eb62	jne	0x14018eb40
14018eb64	cmp	r9d, 0x3e
14018eb68	ja	0x14018ec05
14018eb6e	mov	r9d, r9d
14018eb71	bt	rdx, r9
14018eb75	jb	0x14018eb40
14018eb77	jmp	0x14018ec05
14018eb7c	lea	rax, [rbp + 0x57]
14018eb80	mov	qword ptr [rbp - 0x18], rax
14018eb84	lea	rax, [rip + 0x4e6e775]
14018eb8b	mov	qword ptr [rbp - 0x10], rax
14018eb8f	lea	rcx, [rip + 0x5c5626a]
14018eb96	lea	r8, [rip + 0x5c56b43]
14018eb9d	lea	rdx, [rbp - 0x18]
14018eba1	call	0x145d99830
14018eba6	ud2
14018eba8	lea	rax, [rbp + 0x57]
14018ebac	mov	qword ptr [rbp - 0x18], rax
14018ebb0	lea	rax, [rip + 0x4e6e749]
14018ebb7	mov	qword ptr [rbp - 0x10], rax
14018ebbb	lea	rcx, [rip + 0x5c5623e]
14018ebc2	lea	r8, [rip + 0x5c56ae7]
14018ebc9	lea	rdx, [rbp - 0x18]
14018ebcd	call	0x145d99830
14018ebd2	ud2
14018ebd4	xor	esi, esi
14018ebd6	jmp	0x14018e7ec
14018ebdb	test	bl, bl
14018ebdd	je	0x14018ebe6
14018ebdf	cmp	dword ptr [r11 + 0x40], 0x73
14018ebe4	je	0x14018ec0d
14018ebe6	test	bl, bl
14018ebe8	je	0x14018ec53
14018ebea	lea	rdx, [rcx - 0x50]
14018ebee	xor	r8d, r8d
14018ebf1	cmp	rdx, r8
14018ebf4	je	0x14018ec53
14018ebf6	cmp	dword ptr [r11 + r8 + 0x90], 0x73
14018ebff	lea	r8, [r8 + 0x50]
14018ec03	jne	0x14018ebf1
14018ec05	test	bl, bl
14018ec07	je	0x14018ecad
14018ec0d	mov	r8, rcx
14018ec10	mov	r9, r11
14018ec13	nop	word ptr cs:[rax + rax]
14018ec20	mov	rdx, r8
14018ec23	test	r8, r8
14018ec26	je	0x14018ec48
14018ec28	mov	r10, r9
14018ec2b	add	r9, 0x50
14018ec2f	lea	r8, [rdx - 0x50]
14018ec33	cmp	dword ptr [r10 + 0x40], 0x73
14018ec38	jne	0x14018ec20
14018ec3a	cmp	byte ptr [r10 + 0x4c], 0
14018ec3f	jne	0x14018ec20
14018ec41	cmp	byte ptr [r10 + 0x4d], 0
14018ec46	jne	0x14018ec20
14018ec48	test	rdx, rdx
14018ec4b	setne	dl
14018ec4e	mov	dword ptr [rbp + 0x48], edx
14018ec51	jmp	0x14018ecb4
14018ec53	mov	qword ptr [rbp + 0x40], r11
14018ec57	lea	rcx, [rbp - 0x38]
14018ec5b	call	0x1400b1880
14018ec60	nop
14018ec61	mov	rax, qword ptr [rbp - 0x38]
14018ec65	test	rax, rax
14018ec68	je	0x14018ec81
14018ec6a	shl	rax, 4
14018ec6e	lea	rdx, [rax + rax*4]
14018ec72	mov	r8d, 8
14018ec78	mov	rcx, qword ptr [rbp + 0x40]
14018ec7c	call	0x1400021d0
14018ec81	movaps	xmm6, xmmword ptr [rbp + 0x60]
14018ec85	movaps	xmm7, xmmword ptr [rbp + 0x70]
14018ec89	movaps	xmm8, xmmword ptr [rbp + 0x80]
14018ec91	movaps	xmm9, xmmword ptr [rbp + 0x90]
14018ec99	add	rsp, 0x128
14018eca0	pop	rbx
14018eca1	pop	rdi
14018eca2	pop	rsi
14018eca3	pop	r12
14018eca5	pop	r13
14018eca7	pop	r14
14018eca9	pop	r15
14018ecab	pop	rbp
14018ecac	ret
14018ecad	mov	dword ptr [rbp + 0x48], 0
14018ecb4	add	rcx, r11
14018ecb7	mov	r12, r11
14018ecba	mov	qword ptr [rbp - 0x18], r11
14018ecbe	mov	qword ptr [rbp - 0x10], rcx
14018ecc2	mov	qword ptr [rbp - 8], rax
14018ecc6	lea	rbx, [rbp - 0x60]
14018ecca	mov	qword ptr [rbp], rbx
14018ecce	mov	byte ptr [rbp + 0x54], 1
14018ecd2	lea	rcx, [rbp - 0x50]
14018ecd6	lea	rdx, [rbp - 0x18]
14018ecda	call	0x1400a2190
14018ecdf	nop
14018ece0	mov	dword ptr [rdi + 0x2c], r15d
14018ece4	mov	rax, qword ptr [r14 + 0x40]
14018ece8	mov	qword ptr [r14 + 0x18], rax
14018ecec	lea	rsi, [r14 + 0x20]
14018ecf0	mov	qword ptr [r14 + 0x38], rax
14018ecf4	mov	rax, qword ptr [r14 + 8]
14018ecf8	mov	rcx, qword ptr [r14 + 0x10]
14018ecfc	mov	qword ptr [r14 + 0x10], 0
14018ed04	imul	rdx, rcx, 0x58
14018ed08	add	rdx, rax
14018ed0b	mov	r8, qword ptr [r14 + 0x30]
14018ed0f	mov	qword ptr [r14 + 0x30], 0
14018ed17	mov	r9, qword ptr [r14 + 0x28]
14018ed1b	imul	r10, r8, 0x58
14018ed1f	add	r10, r9
14018ed22	mov	qword ptr [rbp - 0x18], rax
14018ed26	mov	qword ptr [rbp - 0x10], rdx
14018ed2a	mov	qword ptr [rbp - 8], r14
14018ed2e	mov	qword ptr [rbp], rcx
14018ed32	mov	qword ptr [rbp + 8], 0
14018ed3a	mov	qword ptr [rbp + 0x10], r9
14018ed3e	mov	qword ptr [rbp + 0x18], r10
14018ed42	mov	qword ptr [rbp + 0x20], rsi
14018ed46	mov	qword ptr [rbp + 0x28], r8
14018ed4a	mov	qword ptr [rbp + 0x30], 0
14018ed52	mov	byte ptr [rbp + 0x56], 1
14018ed56	mov	byte ptr [rbp + 0x55], 1
14018ed5a	lea	rcx, [rbp - 0x18]
14018ed5e	call	0x14004d850
14018ed63	nop
14018ed64	mov	dword ptr [rdi + 0x2c], r15d
14018ed68	mov	rax, qword ptr [rbp - 0x38]
14018ed6c	lea	rcx, [r13*4]
14018ed74	add	rcx, r13
14018ed77	shl	rcx, 4
14018ed7b	add	rcx, r12
14018ed7e	mov	rdx, qword ptr [r14 + 0x40]
14018ed82	mov	qword ptr [rbp - 0x20], rdx
14018ed86	mov	qword ptr [rbp - 0x18], r12
14018ed8a	mov	qword ptr [rbp - 0x10], r12
14018ed8e	mov	qword ptr [rbp - 8], rax
14018ed92	mov	qword ptr [rbp], rcx
14018ed96	mov	qword ptr [rbp + 8], rbx
14018ed9a	lea	rax, [rbp - 0x20]
14018ed9e	mov	qword ptr [rbp + 0x10], rax
14018eda2	mov	byte ptr [rbp + 0x56], 1
14018eda6	mov	byte ptr [rbp + 0x55], 0
14018edaa	lea	rdx, [rbp - 0x18]
14018edae	mov	rcx, rsi
14018edb1	call	0x140098870
14018edb6	nop
14018edb7	mov	rax, qword ptr [rbp - 0x20]
14018edbb	mov	qword ptr [r14 + 0x40], rax
14018edbf	mov	rcx, qword ptr [rbp + 0x38]
14018edc3	mov	qword ptr [rcx], rax
14018edc6	mov	rbx, qword ptr [rbp + 0x40]
14018edca	cmp	qword ptr [rbx + 0x90], 0
14018edd2	je	0x14018f042
14018edd8	mov	rax, qword ptr [rbx + 0x78]
14018eddc	mov	rcx, qword ptr [rbx + 0x80]
14018ede3	movabs	rdx, 0x6014d8313cc56d15
14018eded	xor	r8d, r8d
14018edf0	pcmpeqd	xmm0, xmm0
14018edf4	and	rdx, rcx
14018edf7	movdqu	xmm1, xmmword ptr [rax + rdx]
14018edfc	movdqa	xmm2, xmm1
14018ee00	pcmpeqb	xmm2, xmm6
14018ee04	pmovmskb	r9d, xmm2
14018ee09	test	r9d, r9d
14018ee0c	je	0x14018ee46
14018ee0e	tzcnt	r10d, r9d
14018ee13	add	r10, rdx
14018ee16	and	r10, rcx
14018ee19	neg	r10
14018ee1c	lea	r10, [r10 + r10*2]
14018ee20	movdqu	xmm2, xmmword ptr [rax + r10*8 - 0x18]
14018ee27	pcmpeqb	xmm2, xmm7
14018ee2b	pmovmskb	r11d, xmm2
14018ee30	cmp	r11d, 0xffff
14018ee37	je	0x14018ee65
14018ee39	lea	r10d, [r9 - 1]
14018ee3d	and	r10w, r9w
14018ee41	mov	r9d, r10d
14018ee44	jne	0x14018ee0e
14018ee46	pcmpeqb	xmm1, xmm0
14018ee4a	pmovmskb	r9d, xmm1
14018ee4f	test	r9d, r9d
14018ee52	jne	0x14018f042
14018ee58	add	rdx, r8
14018ee5b	add	rdx, 0x10
14018ee5f	add	r8, 0x10
14018ee63	jmp	0x14018edf4
14018ee65	lea	rax, [rax + r10*8]
14018ee69	mov	rax, qword ptr [rax - 8]
14018ee6d	cmp	rax, qword ptr [rbx + 0x218]
14018ee74	jae	0x14018f042
14018ee7a	mov	rcx, qword ptr [rbx + 0x210]
14018ee81	mov	rcx, qword ptr [rcx + rax*8]
14018ee85	test	rcx, rcx
14018ee88	je	0x14018f042
14018ee8e	mov	rax, qword ptr [rbx + 0x1e0]
14018ee95	not	rcx
14018ee98	imul	rcx, rcx, 0x38
14018ee9c	cmp	byte ptr [rax + rcx + 0x30], 0
14018eea1	je	0x14018f042
14018eea7	add	rax, rcx
14018eeaa	mov	rcx, qword ptr [rax + 0x10]
14018eeae	mov	edx, dword ptr [rbx + 0x5b0]
14018eeb4	mov	dword ptr [rax + 0x2c], edx
14018eeb7	mov	eax, dword ptr [rbp + 0x48]
14018eeba	mov	byte ptr [rcx], al
14018eebc	cmp	qword ptr [rbx + 0x90], 0
14018eec4	je	0x14018f077
14018eeca	mov	rax, qword ptr [rbx + 0x78]
14018eece	mov	rcx, qword ptr [rbx + 0x80]
14018eed5	movabs	rdx, 0x7c00e6ba9569de82
14018eedf	xor	r8d, r8d
14018eee2	pcmpeqd	xmm0, xmm0
14018eee6	and	rdx, rcx
14018eee9	movdqu	xmm1, xmmword ptr [rax + rdx]
14018eeee	movdqa	xmm2, xmm1
14018eef2	pcmpeqb	xmm2, xmm8
14018eef7	pmovmskb	r9d, xmm2
14018eefc	test	r9d, r9d
14018eeff	je	0x14018ef3a
14018ef01	tzcnt	r10d, r9d
14018ef06	add	r10, rdx
14018ef09	and	r10, rcx
14018ef0c	neg	r10
14018ef0f	lea	r10, [r10 + r10*2]
14018ef13	movdqu	xmm2, xmmword ptr [rax + r10*8 - 0x18]
14018ef1a	pcmpeqb	xmm2, xmm9
14018ef1f	pmovmskb	r11d, xmm2
14018ef24	cmp	r11d, 0xffff
14018ef2b	je	0x14018ef59
14018ef2d	lea	r10d, [r9 - 1]
14018ef31	and	r10w, r9w
14018ef35	mov	r9d, r10d
14018ef38	jne	0x14018ef01
14018ef3a	pcmpeqb	xmm1, xmm0
14018ef3e	pmovmskb	r9d, xmm1
14018ef43	test	r9d, r9d
14018ef46	jne	0x14018f077
14018ef4c	add	rdx, r8
14018ef4f	add	rdx, 0x10
14018ef53	add	r8, 0x10
14018ef57	jmp	0x14018eee6
14018ef59	lea	rax, [rax + r10*8]
14018ef5d	mov	rax, qword ptr [rax - 8]
14018ef61	cmp	rax, qword ptr [rbx + 0x218]
14018ef68	jae	0x14018f077
14018ef6e	mov	rcx, qword ptr [rbx + 0x210]
14018ef75	mov	rax, qword ptr [rcx + rax*8]
14018ef79	test	rax, rax
14018ef7c	je	0x14018f077
14018ef82	mov	rdi, qword ptr [rbx + 0x1e0]
14018ef89	not	rax
14018ef8c	imul	rax, rax, 0x38
14018ef90	cmp	byte ptr [rdi + rax + 0x30], 0
14018ef95	je	0x14018f077
14018ef9b	add	rdi, rax
14018ef9e	mov	r14, qword ptr [rdi + 0x10]
14018efa2	mov	eax, dword ptr [rbx + 0x5b0]
14018efa8	mov	dword ptr [rbp + 0x40], eax
14018efab	mov	rax, qword ptr [rbp - 0x50]
14018efaf	mov	qword ptr [rbp + 0x48], rax
14018efb3	mov	rax, qword ptr [rbp - 0x48]
14018efb7	mov	qword ptr [rbp + 0x38], rax
14018efbb	mov	rax, qword ptr [rbp - 0x40]
14018efbf	test	rax, rax
14018efc2	je	0x14018f01e
14018efc4	lea	rax, [rax + rax*2]
14018efc8	mov	r12, qword ptr [rbp + 0x38]
14018efcc	lea	r15, [r12 + rax*4]
14018efd0	jmp	0x14018eff3
14018efd2	mov	rax, qword ptr [r14 + 0x20]
14018efd6	lea	rcx, [rsi + rsi*2]
14018efda	mov	dword ptr [rax + rcx*4], r13d
14018efde	mov	qword ptr [rax + rcx*4 + 4], rbx
14018efe3	inc	rsi
14018efe6	mov	qword ptr [r14 + 0x28], rsi
14018efea	add	r12, 0xc
14018efee	cmp	r12, r15
14018eff1	je	0x14018f01e
14018eff3	mov	r13d, dword ptr [r12]
14018eff7	cmp	r13d, -1
14018effb	je	0x14018f01e
14018effd	mov	rbx, qword ptr [r12 + 4]
14018f002	mov	eax, dword ptr [rbp + 0x40]
14018f005	mov	dword ptr [rdi + 0x2c], eax
14018f008	mov	rsi, qword ptr [r14 + 0x28]
14018f00c	cmp	rsi, qword ptr [r14 + 0x18]
14018f010	jne	0x14018efd2
14018f012	lea	rcx, [r14 + 0x18]
14018f016	call	0x145c263d0
14018f01b	nop
14018f01c	jmp	0x14018efd2
14018f01e	mov	rax, qword ptr [rbp + 0x48]
14018f022	test	rax, rax
14018f025	je	0x14018ec81
14018f02b	shl	rax, 2
14018f02f	lea	rdx, [rax + rax*2]
14018f033	mov	r8d, 4
14018f039	mov	rcx, qword ptr [rbp + 0x38]
14018f03d	jmp	0x14018ec7c
14018f042	lea	rax, [rbp + 0x57]
14018f046	mov	qword ptr [rbp - 0x18], rax
14018f04a	lea	rax, [rip + 0x4e6e2af]
14018f051	mov	qword ptr [rbp - 0x10], rax
14018f055	mov	byte ptr [rbp + 0x56], 1
14018f059	mov	byte ptr [rbp + 0x55], 0
14018f05d	lea	rcx, [rip + 0x5c55d9c]
14018f064	lea	r8, [rip + 0x5c5668d]
14018f06b	lea	rdx, [rbp - 0x18]
14018f06f	call	0x145d99830
14018f074	nop
14018f075	jmp	0x14018f0aa
14018f077	lea	rax, [rbp + 0x57]
14018f07b	mov	qword ptr [rbp - 0x18], rax
14018f07f	lea	rax, [rip + 0x4e6e27a]
14018f086	mov	qword ptr [rbp - 0x10], rax
14018f08a	mov	byte ptr [rbp + 0x56], 1
14018f08e	mov	byte ptr [rbp + 0x55], 0
14018f092	lea	rcx, [rip + 0x5c55d67]
14018f099	lea	r8, [rip + 0x5c56670]
14018f0a0	lea	rdx, [rbp - 0x18]
14018f0a4	call	0x145d99830
14018f0a9	nop
14018f0aa	ud2
