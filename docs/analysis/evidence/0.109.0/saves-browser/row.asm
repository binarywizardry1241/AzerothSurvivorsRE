140259810	push	rbp
140259811	push	r15
140259813	push	r14
140259815	push	r13
140259817	push	r12
140259819	push	rsi
14025981a	push	rdi
14025981b	push	rbx
14025981c	sub	rsp, 0x458
140259823	lea	rbp, [rsp + 0x80]
14025982b	mov	qword ptr [rbp + 0x3d0], 0xfffffffffffffffe
140259836	mov	rdi, rdx
140259839	mov	rsi, rcx
14025983c	mov	r14, qword ptr [rcx]
14025983f	mov	rax, qword ptr [rcx + 0x28]
140259843	mov	qword ptr [rbp + 0x378], r14
14025984a	movups	xmm0, xmmword ptr [rcx + 8]
14025984e	movups	xmmword ptr [rbp + 0x380], xmm0
140259855	movups	xmm0, xmmword ptr [rcx + 0x18]
140259859	movups	xmmword ptr [rbp + 0x390], xmm0
140259860	mov	qword ptr [rbp + 0x3a0], rax
140259867	mov	word ptr [rbp + 0x2d4], 0
140259870	mov	byte ptr [rbp + 0x2c4], 1
140259877	xorps	xmm0, xmm0
14025987a	movaps	xmmword ptr [rbp + 0x1d0], xmm0
140259881	movaps	xmmword ptr [rbp + 0x1e0], xmm0
140259888	movaps	xmmword ptr [rbp + 0x1f0], xmm0
14025988f	movaps	xmmword ptr [rbp + 0x200], xmm0
140259896	movaps	xmmword ptr [rbp + 0x210], xmm0
14025989d	mov	qword ptr [rbp + 0x220], 0
1402598a8	mov	dword ptr [rbp + 0x2e8], 0
1402598b2	mov	word ptr [rbp + 0x2ec], 0
1402598bb	movups	xmm0, xmmword ptr [rip + 0x5b920f6]
1402598c2	movups	xmmword ptr [rbp + 0x228], xmm0
1402598c9	movups	xmm0, xmmword ptr [rip + 0x5b920f8]
1402598d0	movups	xmmword ptr [rbp + 0x238], xmm0
1402598d7	movups	xmm0, xmmword ptr [rip + 0x5b920fa]
1402598de	movups	xmmword ptr [rbp + 0x248], xmm0
1402598e5	movups	xmm0, xmmword ptr [rip + 0x5b920fc]
1402598ec	movups	xmmword ptr [rbp + 0x258], xmm0
1402598f3	movups	xmm0, xmmword ptr [rip + 0x5b9210e]
1402598fa	movups	xmmword ptr [rbp + 0x278], xmm0
140259901	movups	xmm0, xmmword ptr [rip + 0x5b920f0]
140259908	movups	xmmword ptr [rbp + 0x268], xmm0
14025990f	movups	xmm0, xmmword ptr [rip + 0x5b92112]
140259916	movups	xmmword ptr [rbp + 0x298], xmm0
14025991d	movups	xmm0, xmmword ptr [rip + 0x5b920f4]
140259924	movups	xmmword ptr [rbp + 0x288], xmm0
14025992b	mov	byte ptr [rbp + 0x2e6], 0
140259932	mov	dword ptr [rbp + 0x2e2], 0
14025993c	movsd	xmm0, qword ptr [rip + 0x5b43afc]
140259944	movsd	qword ptr [rbp + 0x2c8], xmm0
14025994c	mov	dword ptr [rbp + 0x2d0], 0x3f800000
140259956	movaps	xmm0, xmmword ptr [rip + 0x5b43913]
14025995d	movups	xmmword ptr [rbp + 0x2a8], xmm0
140259964	mov	dword ptr [rbp + 0x2b8], 1
14025996e	mov	qword ptr [rbp + 0x2bc], 0
140259979	mov	byte ptr [rbp + 0x2e7], 0
140259980	movups	xmm0, xmmword ptr [rip + 0x5b91f79]
140259987	movaps	xmmword ptr [rbp + 0x170], xmm0
14025998e	mov	qword ptr [rbp + 0x180], 0
140259999	movups	xmm0, xmmword ptr [rip + 0x5b91f78]
1402599a0	movups	xmmword ptr [rbp + 0x188], xmm0
1402599a7	mov	qword ptr [rbp + 0x198], 0
1402599b2	movups	xmm0, xmmword ptr [rip + 0x5b91f77]
1402599b9	movaps	xmmword ptr [rbp + 0x1a0], xmm0
1402599c0	mov	qword ptr [rbp + 0x1b0], 0
1402599cb	movups	xmm0, xmmword ptr [rip + 0x5b91f76]
1402599d2	movups	xmmword ptr [rbp + 0x1b8], xmm0
1402599d9	mov	qword ptr [rbp + 0x1c8], 0
1402599e4	mov	word ptr [rbp + 0x2da], 0
1402599ed	mov	dword ptr [rbp + 0x2d6], 0x10000
1402599f7	mov	word ptr [rbp + 0x2e0], 0
140259a00	mov	dword ptr [rbp + 0x2dc], 0x10000
140259a0a	mov	rbx, qword ptr [rdx]
140259a0d	mov	rdx, qword ptr [rdx + 8]
140259a11	lea	rcx, [rbp + 0x140]
140259a18	call	0x145bcd2f0
140259a1d	nop
140259a1e	cmp	byte ptr [rbx], 1
140259a21	mov	qword ptr [rbp + 0x3c0], rdi
140259a28	jne	0x140259a49
140259a2a	mov	eax, dword ptr [rbx + 1]
140259a2d	mov	ecx, dword ptr [rbx + 4]
140259a30	mov	dword ptr [rbp + 0x3cb], ecx
140259a36	mov	dword ptr [rbp + 0x3c8], eax
140259a3c	mov	r13, qword ptr [rbx + 8]
140259a40	movzx	edi, byte ptr [rbx + 0x10]
140259a44	mov	r12b, 1
140259a47	jmp	0x140259a5b
140259a49	mov	r13, qword ptr [rbx + 8]
140259a4d	lock inc	qword ptr [r13]
140259a52	jle	0x140259bf7
140259a58	xor	r12d, r12d
140259a5b	mov	rax, qword ptr [rbp + 0x150]
140259a62	mov	qword ptr [rbp + 0x138], rax
140259a69	movups	xmm0, xmmword ptr [rbp + 0x140]
140259a70	movups	xmmword ptr [rbp + 0x128], xmm0
140259a77	movups	xmm0, xmmword ptr [rip + 0x5b92356]
140259a7e	movups	xmmword ptr [rbp + 0x3ac], xmm0
140259a85	mov	dword ptr [rbp + 0x3bc], 0x3f800000
140259a8f	lea	r15, [rbp - 0x58]
140259a93	lea	rdx, [rbp + 0x170]
140259a9a	mov	r8d, 0x180
140259aa0	mov	rcx, r15
140259aa3	call	0x145bfa0e7
140259aa8	lea	rcx, [rbp + 0x178]
140259aaf	mov	r8d, 0x198
140259ab5	mov	rdx, r15
140259ab8	call	0x145bfa0e7
140259abd	mov	qword ptr [rbp + 0x310], 0
140259ac8	mov	qword ptr [rbp + 0x318], 4
140259ad3	mov	qword ptr [rbp + 0x320], 0
140259ade	mov	byte ptr [rbp + 0x328], r12b
140259ae5	mov	eax, dword ptr [rbp + 0x3c8]
140259aeb	mov	ecx, dword ptr [rbp + 0x3cb]
140259af1	mov	dword ptr [rbp + 0x329], eax
140259af7	mov	dword ptr [rbp + 0x32c], ecx
140259afd	mov	qword ptr [rbp + 0x330], r13
140259b04	mov	qword ptr [rbp + 0x338], rdi
140259b0b	mov	dword ptr [rbp + 0x340], 0x41800000
140259b15	mov	word ptr [rbp + 0x344], 0x190
140259b1e	mov	byte ptr [rbp + 0x346], 1
140259b25	movups	xmm0, xmmword ptr [rbp + 0x3ab]
140259b2c	movups	xmmword ptr [rbp + 0x347], xmm0
140259b33	mov	rax, qword ptr [rbp + 0x3b8]
140259b3a	mov	qword ptr [rbp + 0x354], rax
140259b41	movups	xmm0, xmmword ptr [rip + 0x5b7bf48]
140259b48	movups	xmmword ptr [rbp + 0x35c], xmm0
140259b4f	mov	eax, dword ptr [rip + 0x5b7bf4b]
140259b55	mov	dword ptr [rbp + 0x36c], eax
140259b5b	movsd	xmm0, qword ptr [rip + 0x5b4393d]
140259b63	movsd	qword ptr [rbp + 0x370], xmm0
140259b6b	mov	qword ptr [rbp + 0x170], r14
140259b72	lea	rcx, [rbp + 0x140]
140259b79	lea	r15, [rbp + 0x170]
140259b80	lea	rdx, [rbp + 0x380]
140259b87	mov	r8, r15
140259b8a	call	0x1401e2c10
140259b8f	lea	rcx, [rip + 0x5b94d36]
140259b96	mov	edx, 0xe
140259b9b	call	0x1458ec450
140259ba0	mov	r9, rdx
140259ba3	mov	rcx, qword ptr [rbp + 0x3c0]
140259baa	mov	rcx, qword ptr [rcx + 0x10]
140259bae	mov	rcx, qword ptr [rcx]
140259bb1	mov	qword ptr [rbp + 0x178], rcx
140259bb8	movabs	rcx, 0x800000000000000b
140259bc2	mov	qword ptr [rbp + 0x170], rcx
140259bc9	mov	qword ptr [rsp + 0x20], r15
140259bce	lea	rcx, [rbp + 0x378]
140259bd5	mov	rdx, rbx
140259bd8	mov	r8, rax
140259bdb	call	0x14001dfe0
140259be0	mov	rax, rsi
140259be3	add	rsp, 0x458
140259bea	pop	rbx
140259beb	pop	rdi
140259bec	pop	rsi
140259bed	pop	r12
140259bef	pop	r13
140259bf1	pop	r14
140259bf3	pop	r15
140259bf5	pop	rbp
140259bf6	ret
140259bf7	ud2
