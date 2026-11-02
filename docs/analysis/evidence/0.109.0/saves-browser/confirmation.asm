140259c40	push	rbp
140259c41	push	r15
140259c43	push	r14
140259c45	push	r13
140259c47	push	r12
140259c49	push	rsi
140259c4a	push	rdi
140259c4b	push	rbx
140259c4c	sub	rsp, 0x478
140259c53	lea	rbp, [rsp + 0x80]
140259c5b	mov	qword ptr [rbp + 0x3f0], 0xfffffffffffffffe
140259c66	mov	rdi, rdx
140259c69	mov	rsi, rcx
140259c6c	mov	r15, qword ptr [rcx]
140259c6f	mov	rax, qword ptr [rcx + 0x28]
140259c73	mov	qword ptr [rbp + 0x380], r15
140259c7a	movups	xmm0, xmmword ptr [rcx + 8]
140259c7e	movups	xmmword ptr [rbp + 0x388], xmm0
140259c85	movups	xmm0, xmmword ptr [rcx + 0x18]
140259c89	movups	xmmword ptr [rbp + 0x398], xmm0
140259c90	mov	qword ptr [rbp + 0x3a8], rax
140259c97	mov	word ptr [rbp + 0x2d4], 0
140259ca0	mov	byte ptr [rbp + 0x2c4], 1
140259ca7	xorps	xmm0, xmm0
140259caa	movaps	xmmword ptr [rbp + 0x1d0], xmm0
140259cb1	movaps	xmmword ptr [rbp + 0x1e0], xmm0
140259cb8	movaps	xmmword ptr [rbp + 0x1f0], xmm0
140259cbf	movaps	xmmword ptr [rbp + 0x200], xmm0
140259cc6	movaps	xmmword ptr [rbp + 0x210], xmm0
140259ccd	mov	qword ptr [rbp + 0x220], 0
140259cd8	mov	dword ptr [rbp + 0x2e8], 0
140259ce2	mov	word ptr [rbp + 0x2ec], 0
140259ceb	movups	xmm0, xmmword ptr [rip + 0x5b91cc6]
140259cf2	movups	xmmword ptr [rbp + 0x228], xmm0
140259cf9	movups	xmm0, xmmword ptr [rip + 0x5b91cc8]
140259d00	movups	xmmword ptr [rbp + 0x238], xmm0
140259d07	movups	xmm0, xmmword ptr [rip + 0x5b91cca]
140259d0e	movups	xmmword ptr [rbp + 0x248], xmm0
140259d15	movups	xmm0, xmmword ptr [rip + 0x5b91ccc]
140259d1c	movups	xmmword ptr [rbp + 0x258], xmm0
140259d23	movups	xmm0, xmmword ptr [rip + 0x5b91cde]
140259d2a	movups	xmmword ptr [rbp + 0x278], xmm0
140259d31	movups	xmm0, xmmword ptr [rip + 0x5b91cc0]
140259d38	movups	xmmword ptr [rbp + 0x268], xmm0
140259d3f	movups	xmm0, xmmword ptr [rip + 0x5b91ce2]
140259d46	movups	xmmword ptr [rbp + 0x298], xmm0
140259d4d	movups	xmm0, xmmword ptr [rip + 0x5b91cc4]
140259d54	movups	xmmword ptr [rbp + 0x288], xmm0
140259d5b	mov	byte ptr [rbp + 0x2e6], 0
140259d62	mov	dword ptr [rbp + 0x2e2], 0
140259d6c	mov	qword ptr [rbp + 0x2c8], 0
140259d77	mov	dword ptr [rbp + 0x2d0], 0x3f800000
140259d81	movaps	xmm0, xmmword ptr [rip + 0x5b434e8]
140259d88	movups	xmmword ptr [rbp + 0x2a8], xmm0
140259d8f	mov	dword ptr [rbp + 0x2b8], 1
140259d99	mov	qword ptr [rbp + 0x2bc], 0
140259da4	mov	byte ptr [rbp + 0x2e7], 0
140259dab	movups	xmm0, xmmword ptr [rip + 0x5b91b4e]
140259db2	movaps	xmmword ptr [rbp + 0x170], xmm0
140259db9	mov	qword ptr [rbp + 0x180], 0
140259dc4	movups	xmm0, xmmword ptr [rip + 0x5b91b4d]
140259dcb	movups	xmmword ptr [rbp + 0x188], xmm0
140259dd2	mov	qword ptr [rbp + 0x198], 0
140259ddd	movups	xmm0, xmmword ptr [rip + 0x5b91b4c]
140259de4	movaps	xmmword ptr [rbp + 0x1a0], xmm0
140259deb	mov	qword ptr [rbp + 0x1b0], 0
140259df6	movups	xmm0, xmmword ptr [rip + 0x5b91b4b]
140259dfd	movups	xmmword ptr [rbp + 0x1b8], xmm0
140259e04	mov	qword ptr [rbp + 0x1c8], 0
140259e0f	mov	word ptr [rbp + 0x2da], 0
140259e18	mov	dword ptr [rbp + 0x2d6], 0x10000
140259e22	mov	word ptr [rbp + 0x2e0], 0
140259e2b	mov	dword ptr [rbp + 0x2dc], 0x10000
140259e35	lea	rax, [rip + 0x5b92003]
140259e3c	mov	qword ptr [rbp + 0x3b0], rax
140259e43	mov	qword ptr [rbp + 0x3b8], 4
140259e4e	mov	qword ptr [rbp + 0x3c0], r8
140259e55	lea	rax, [rip + 0x5b94a84]
140259e5c	mov	qword ptr [rbp + 0x3c8], rax
140259e63	mov	qword ptr [rsp + 0x20], 1
140259e6c	lea	rdx, [rip + 0x5b94a8d]
140259e73	lea	rcx, [rbp + 0x140]
140259e7a	lea	r9, [rbp + 0x3b0]
140259e81	mov	r8d, 0x17
140259e87	call	0x1458ec4b0
140259e8c	nop
140259e8d	cmp	byte ptr [rdi], 1
140259e90	jne	0x140259eb1
140259e92	mov	eax, dword ptr [rdi + 1]
140259e95	mov	ecx, dword ptr [rdi + 4]
140259e98	mov	dword ptr [rbp + 0x3eb], ecx
140259e9e	mov	dword ptr [rbp + 0x3e8], eax
140259ea4	mov	r12, qword ptr [rdi + 8]
140259ea8	movzx	r13d, byte ptr [rdi + 0x10]
140259ead	mov	bl, 1
140259eaf	jmp	0x140259ec2
140259eb1	mov	r12, qword ptr [rdi + 8]
140259eb5	lock inc	qword ptr [r12]
140259eba	jle	0x14025a083
140259ec0	xor	ebx, ebx
140259ec2	mov	rax, qword ptr [rbp + 0x150]
140259ec9	mov	qword ptr [rbp + 0x138], rax
140259ed0	movups	xmm0, xmmword ptr [rbp + 0x140]
140259ed7	movups	xmmword ptr [rbp + 0x128], xmm0
140259ede	movups	xmm0, xmmword ptr [rip + 0x5b919f3]
140259ee5	movups	xmmword ptr [rbp + 0x3d4], xmm0
140259eec	mov	dword ptr [rbp + 0x3e4], 0x3f800000
140259ef6	lea	r14, [rbp - 0x58]
140259efa	lea	rdx, [rbp + 0x170]
140259f01	mov	r8d, 0x180
140259f07	mov	rcx, r14
140259f0a	call	0x145bfa0e7
140259f0f	lea	rcx, [rbp + 0x178]
140259f16	mov	r8d, 0x198
140259f1c	mov	rdx, r14
140259f1f	call	0x145bfa0e7
140259f24	mov	qword ptr [rbp + 0x310], 0
140259f2f	mov	qword ptr [rbp + 0x318], 4
140259f3a	mov	qword ptr [rbp + 0x320], 0
140259f45	mov	byte ptr [rbp + 0x328], bl
140259f4b	mov	eax, dword ptr [rbp + 0x3e8]
140259f51	mov	ecx, dword ptr [rbp + 0x3eb]
140259f57	mov	dword ptr [rbp + 0x329], eax
140259f5d	mov	dword ptr [rbp + 0x32c], ecx
140259f63	mov	qword ptr [rbp + 0x330], r12
140259f6a	mov	qword ptr [rbp + 0x338], r13
140259f71	mov	dword ptr [rbp + 0x340], 0x41800000
140259f7b	mov	word ptr [rbp + 0x344], 0x190
140259f84	mov	byte ptr [rbp + 0x346], 1
140259f8b	movups	xmm0, xmmword ptr [rbp + 0x3d3]
140259f92	movups	xmmword ptr [rbp + 0x347], xmm0
140259f99	mov	rax, qword ptr [rbp + 0x3e0]
140259fa0	mov	qword ptr [rbp + 0x354], rax
140259fa7	movups	xmm0, xmmword ptr [rip + 0x5b7bae2]
140259fae	movups	xmmword ptr [rbp + 0x35c], xmm0
140259fb5	mov	eax, dword ptr [rip + 0x5b7bae5]
140259fbb	mov	dword ptr [rbp + 0x36c], eax
140259fc1	movsd	xmm0, qword ptr [rip + 0x5b434d7]
140259fc9	movsd	qword ptr [rbp + 0x370], xmm0
140259fd1	mov	qword ptr [rbp + 0x170], r15
140259fd8	lea	rcx, [rbp + 0x140]
140259fdf	lea	r14, [rbp + 0x170]
140259fe6	lea	rdx, [rbp + 0x388]
140259fed	mov	r8, r14
140259ff0	call	0x1401e2c10
140259ff5	lea	rcx, [rip + 0x5b9491b]
140259ffc	mov	edx, 0xf
14025a001	call	0x1458ec450
14025a006	mov	r9, rdx
14025a009	movabs	rcx, 0x800000000000000e
14025a013	mov	qword ptr [rbp + 0x170], rcx
14025a01a	mov	qword ptr [rsp + 0x20], r14
14025a01f	lea	rbx, [rbp + 0x380]
14025a026	mov	rcx, rbx
14025a029	mov	rdx, rdi
14025a02c	mov	r8, rax
14025a02f	call	0x14001dfe0
14025a034	lea	rcx, [rip + 0x5b948eb]
14025a03b	mov	edx, 0xe
14025a040	call	0x1458ec450
14025a045	mov	r9, rdx
14025a048	movabs	rcx, 0x800000000000000f
14025a052	mov	qword ptr [rbp + 0x170], rcx
14025a059	mov	qword ptr [rsp + 0x20], r14
14025a05e	mov	rcx, rbx
14025a061	mov	rdx, rdi
14025a064	mov	r8, rax
14025a067	call	0x14001dfe0
14025a06c	mov	rax, rsi
14025a06f	add	rsp, 0x478
14025a076	pop	rbx
14025a077	pop	rdi
14025a078	pop	rsi
14025a079	pop	r12
14025a07b	pop	r13
14025a07d	pop	r14
14025a07f	pop	r15
14025a081	pop	rbp
14025a082	ret
14025a083	ud2
