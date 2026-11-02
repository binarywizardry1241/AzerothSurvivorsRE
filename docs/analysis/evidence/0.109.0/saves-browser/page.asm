1400184d0	push	rbp
1400184d1	push	r15
1400184d3	push	r14
1400184d5	push	r13
1400184d7	push	r12
1400184d9	push	rsi
1400184da	push	rdi
1400184db	push	rbx
1400184dc	sub	rsp, 0x528
1400184e3	lea	rbp, [rsp + 0x80]
1400184eb	movaps	xmmword ptr [rbp + 0x490], xmm15
1400184f3	movaps	xmmword ptr [rbp + 0x480], xmm14
1400184fb	movaps	xmmword ptr [rbp + 0x470], xmm13
140018503	movaps	xmmword ptr [rbp + 0x460], xmm12
14001850b	movaps	xmmword ptr [rbp + 0x450], xmm11
140018513	movaps	xmmword ptr [rbp + 0x440], xmm10
14001851b	movaps	xmmword ptr [rbp + 0x430], xmm9
140018523	movaps	xmmword ptr [rbp + 0x420], xmm8
14001852b	movaps	xmmword ptr [rbp + 0x410], xmm7
140018532	movaps	xmmword ptr [rbp + 0x400], xmm6
140018539	mov	qword ptr [rbp + 0x3f8], 0xfffffffffffffffe
140018544	mov	rbx, r9
140018547	mov	r15, r8
14001854a	mov	rdi, rdx
14001854d	mov	rsi, rcx
140018550	lea	rcx, [rip + 0x5d86bd2]
140018557	mov	edx, 0x13
14001855c	call	0x1458ec450
140018561	mov	r12, rdx
140018564	test	rdx, rdx
140018567	jns	0x140018579
140018569	xor	r13d, r13d
14001856c	mov	rcx, r13
14001856f	mov	rdx, r12
140018572	call	0x145d992bb
140018577	ud2
140018579	mov	qword ptr [rbp - 0x50], rbx
14001857d	je	0x1400185d5
14001857f	mov	rbx, rax
140018582	call	0x140002200
140018587	mov	r13d, 1
14001858d	mov	edx, 1
140018592	mov	rcx, r12
140018595	call	0x1400021c0
14001859a	test	rax, rax
14001859d	je	0x14001856c
14001859f	mov	r14, rax
1400185a2	mov	rcx, rax
1400185a5	mov	rdx, rbx
1400185a8	mov	r8, r12
1400185ab	call	0x145bfa0e7
1400185b0	movzx	eax, byte ptr [rdi]
1400185b3	mov	byte ptr [rbp + 0x3e0], al
1400185b9	cmp	al, 1
1400185bb	jne	0x1400185e8
1400185bd	mov	eax, dword ptr [rdi + 1]
1400185c0	mov	ecx, dword ptr [rdi + 4]
1400185c3	mov	dword ptr [rbp - 0x3d], ecx
1400185c6	mov	dword ptr [rbp - 0x40], eax
1400185c9	mov	rax, qword ptr [rdi + 8]
1400185cd	movzx	edx, byte ptr [rdi + 0x10]
1400185d1	mov	cl, 1
1400185d3	jmp	0x1400185f8
1400185d5	mov	r14d, 1
1400185db	movzx	eax, byte ptr [rdi]
1400185de	mov	byte ptr [rbp + 0x3e0], al
1400185e4	cmp	al, 1
1400185e6	je	0x1400185bd
1400185e8	mov	rax, qword ptr [rdi + 8]
1400185ec	lock inc	qword ptr [rax]
1400185f0	jle	0x140019961
1400185f6	xor	ecx, ecx
1400185f8	mov	r8d, dword ptr [rbp - 0x40]
1400185fc	mov	r9d, dword ptr [rbp - 0x3d]
140018600	mov	dword ptr [rbp + 0x184], r9d
140018607	mov	dword ptr [rbp + 0x181], r8d
14001860e	movups	xmm0, xmmword ptr [rip + 0x5d86b27]
140018615	movups	xmmword ptr [rbp + 0x3a9], xmm0
14001861c	mov	dword ptr [rbp + 0x3b9], 0x3f800000
140018626	mov	r8, qword ptr [rsi]
140018629	lea	rbx, [rsi + 8]
14001862d	mov	qword ptr [rbp + 0x150], r12
140018634	mov	qword ptr [rbp + 0x158], r14
14001863b	mov	qword ptr [rbp + 0x160], r12
140018642	mov	qword ptr [rbp + 0x168], 0
14001864d	mov	qword ptr [rbp + 0x170], 4
140018658	mov	qword ptr [rbp + 0x178], 0
140018663	mov	byte ptr [rbp + 0x180], cl
140018669	mov	qword ptr [rbp + 0x188], rax
140018670	mov	qword ptr [rbp + 0x190], rdx
140018677	mov	dword ptr [rbp + 0x198], 0x41700000
140018681	mov	word ptr [rbp + 0x19c], 0x190
14001868a	mov	byte ptr [rbp + 0x19e], 1
140018691	movups	xmm0, xmmword ptr [rbp + 0x3a8]
140018698	movups	xmmword ptr [rbp + 0x19f], xmm0
14001869f	mov	rax, qword ptr [rbp + 0x3b5]
1400186a6	mov	qword ptr [rbp + 0x1ac], rax
1400186ad	movups	xmm9, xmmword ptr [rip + 0x5dbd3db]
1400186b5	movups	xmmword ptr [rbp + 0x1b4], xmm9
1400186bd	mov	eax, dword ptr [rip + 0x5dbd3dd]
1400186c3	mov	dword ptr [rbp + 0x1c4], eax
1400186c9	movsd	xmm0, qword ptr [rip + 0x5d84dcf]
1400186d1	movsd	qword ptr [rbp + 0x1c8], xmm0
1400186d9	mov	qword ptr [rbp + 0x148], r8
1400186e0	lea	r14, [rip + 0x5dbcd49]
1400186e7	lea	r13, [rbp - 0x40]
1400186eb	lea	r8, [rbp + 0x148]
1400186f2	mov	rcx, r13
1400186f5	mov	rdx, rbx
1400186f8	mov	r9, r14
1400186fb	call	0x1401f2bf0
140018700	xorps	xmm0, xmm0
140018703	movups	xmmword ptr [rbp + 0x1c8], xmm0
14001870a	movups	xmmword ptr [rbp + 0x1b8], xmm0
140018711	movups	xmmword ptr [rbp + 0x1e0], xmm0
140018718	movups	xmmword ptr [rbp + 0x1f8], xmm0
14001871f	movups	xmm0, xmmword ptr [rip + 0x5d866aa]
140018726	movaps	xmmword ptr [rbp - 0x40], xmm0
14001872a	mov	qword ptr [rbp - 0x30], 0
140018732	movups	xmm0, xmmword ptr [rip + 0x5d866af]
140018739	movups	xmmword ptr [rbp - 0x28], xmm0
14001873d	mov	qword ptr [rbp - 0x18], 0
140018745	movups	xmm10, xmmword ptr [rip + 0x5d866b3]
14001874d	movaps	xmmword ptr [rbp - 0x10], xmm10
140018752	mov	qword ptr [rbp], 0
14001875a	movups	xmm11, xmmword ptr [rip + 0x5d866b6]
140018762	movups	xmmword ptr [rbp + 8], xmm11
140018767	mov	qword ptr [rbp + 0x18], 0
14001876f	mov	rax, qword ptr [rsi]
140018772	mov	rcx, qword ptr [rbp + 0x10]
140018776	mov	qword ptr [rbp + 0x1a0], rcx
14001877d	mov	rcx, qword ptr [rbp + 0x18]
140018781	mov	qword ptr [rbp + 0x1a8], rcx
140018788	mov	rcx, qword ptr [rbp]
14001878c	mov	qword ptr [rbp + 0x190], rcx
140018793	mov	rcx, qword ptr [rbp + 8]
140018797	mov	qword ptr [rbp + 0x198], rcx
14001879e	movaps	xmm0, xmmword ptr [rbp - 0x40]
1400187a2	movaps	xmm1, xmmword ptr [rbp - 0x30]
1400187a6	movaps	xmm2, xmmword ptr [rbp - 0x20]
1400187aa	movaps	xmm3, xmmword ptr [rbp - 0x10]
1400187ae	movups	xmmword ptr [rbp + 0x180], xmm3
1400187b5	movups	xmmword ptr [rbp + 0x170], xmm2
1400187bc	movups	xmmword ptr [rbp + 0x160], xmm1
1400187c3	movups	xmmword ptr [rbp + 0x150], xmm0
1400187ca	mov	qword ptr [rbp + 0x1b0], 0
1400187d5	movabs	rcx, 0x42c8000000000002
1400187df	mov	qword ptr [rbp + 0x1d8], rcx
1400187e6	movabs	rcx, 0x4240000000000001
1400187f0	mov	qword ptr [rbp + 0x1f0], rcx
1400187f7	movups	xmm0, xmmword ptr [rip + 0x5d8668a]
1400187fe	movups	xmmword ptr [rbp + 0x208], xmm0
140018805	movups	xmm0, xmmword ptr [rip + 0x5d8668c]
14001880c	movups	xmmword ptr [rbp + 0x218], xmm0
140018813	movups	xmm14, xmmword ptr [rip + 0x5d8669d]
14001881b	movups	xmmword ptr [rbp + 0x238], xmm14
140018823	movups	xmm15, xmmword ptr [rip + 0x5d8667d]
14001882b	movups	xmmword ptr [rbp + 0x228], xmm15
140018833	movups	xmm6, xmmword ptr [rip + 0x5d8669e]
14001883a	movups	xmmword ptr [rbp + 0x258], xmm6
140018841	movups	xmm7, xmmword ptr [rip + 0x5d86680]
140018848	movups	xmmword ptr [rbp + 0x248], xmm7
14001884f	movups	xmm12, xmmword ptr [rip + 0x5d866a1]
140018857	movups	xmmword ptr [rbp + 0x278], xmm12
14001885f	movups	xmm13, xmmword ptr [rip + 0x5d86681]
140018867	movups	xmmword ptr [rbp + 0x268], xmm13
14001886f	movaps	xmm8, xmmword ptr [rip + 0x5d849f9]
140018877	movups	xmmword ptr [rbp + 0x288], xmm8
14001887f	mov	dword ptr [rbp + 0x298], 1
140018889	movss	xmm0, dword ptr [rip + 0x5d84c8f]
140018891	movlps	qword ptr [rbp + 0x29c], xmm0
140018898	mov	byte ptr [rbp + 0x2a4], 1
14001889f	mov	qword ptr [rbp + 0x2ae], 0
1400188aa	mov	qword ptr [rbp + 0x2a8], 0
1400188b5	mov	word ptr [rbp + 0x2ba], 0
1400188be	mov	dword ptr [rbp + 0x2b6], 0x10000
1400188c8	mov	word ptr [rbp + 0x2c0], 0
1400188d1	mov	dword ptr [rbp + 0x2bc], 0x10000
1400188db	mov	qword ptr [rbp + 0x2c2], 0
1400188e6	mov	dword ptr [rbp + 0x2ca], 5
1400188f0	mov	qword ptr [rbp + 0x148], rax
1400188f7	lea	r12, [rbp + 0x3a8]
1400188fe	lea	r8, [rbp + 0x148]
140018905	mov	rcx, r12
140018908	mov	qword ptr [rbp + 0x3a0], rbx
14001890f	mov	rdx, rbx
140018912	mov	r9, r14
140018915	call	0x1401de510
14001891a	mov	rax, qword ptr [rbp + 0x3a8]
140018921	mov	rcx, qword ptr [rbp + 0x3d0]
140018928	mov	qword ptr [rbp + 0x148], rax
14001892f	movups	xmm0, xmmword ptr [rbp + 0x3b0]
140018936	movups	xmmword ptr [rbp + 0x150], xmm0
14001893d	movups	xmm0, xmmword ptr [rbp + 0x3c0]
140018944	movups	xmmword ptr [rbp + 0x160], xmm0
14001894b	mov	qword ptr [rbp + 0x170], rcx
140018952	lea	rcx, [rip + 0x5dd5f47]
140018959	mov	edx, 0x13
14001895e	call	0x1458ec450
140018963	mov	r9, rdx
140018966	movabs	rcx, 0x8000000000000009
140018970	mov	qword ptr [rbp - 0x40], rcx
140018974	mov	qword ptr [rsp + 0x20], r13
140018979	lea	r14, [rbp + 0x148]
140018980	mov	rcx, r14
140018983	mov	rdx, rdi
140018986	mov	r8, rax
140018989	call	0x14001dfe0
14001898e	lea	rcx, [rip + 0x5dd5f1e]
140018995	mov	edx, 0x19
14001899a	call	0x1458ec450
14001899f	mov	r9, rdx
1400189a2	movabs	rcx, 0x800000000000000d
1400189ac	mov	qword ptr [rbp - 0x40], rcx
1400189b0	mov	qword ptr [rsp + 0x20], r13
1400189b5	mov	rcx, r14
1400189b8	mov	rdx, rdi
1400189bb	mov	r8, rax
1400189be	call	0x14001dfe0
1400189c3	cmp	qword ptr [r15 + 0x88], 0
1400189cb	je	0x140018b13
1400189d1	lea	rdx, [r15 + 0x78]
1400189d5	lea	rcx, [rbp - 0x40]
1400189d9	call	0x145bcd2f0
1400189de	cmp	byte ptr [rbp + 0x3e0], 0
1400189e5	je	0x140018a05
1400189e7	mov	eax, dword ptr [rdi + 1]
1400189ea	mov	ecx, dword ptr [rdi + 4]
1400189ed	mov	dword ptr [rbp + 0x383], ecx
1400189f3	mov	dword ptr [rbp + 0x380], eax
1400189f9	mov	rax, qword ptr [rdi + 8]
1400189fd	movzx	edx, byte ptr [rdi + 0x10]
140018a01	mov	cl, 1
140018a03	jmp	0x140018a15
140018a05	mov	rax, qword ptr [rdi + 8]
140018a09	lock inc	qword ptr [rax]
140018a0d	jle	0x140019961
140018a13	xor	ecx, ecx
140018a15	mov	r8, qword ptr [rbp - 0x30]
140018a19	mov	qword ptr [rbp + 0x160], r8
140018a20	movups	xmm0, xmmword ptr [rbp - 0x40]
140018a24	movups	xmmword ptr [rbp + 0x150], xmm0
140018a2b	mov	r8d, dword ptr [rbp + 0x380]
140018a32	mov	r9d, dword ptr [rbp + 0x383]
140018a39	mov	dword ptr [rbp + 0x181], r8d
140018a40	mov	dword ptr [rbp + 0x184], r9d
140018a47	movups	xmm0, xmmword ptr [rip + 0x5d86516]
140018a4e	movups	xmmword ptr [rbp + 0x3a9], xmm0
140018a55	mov	dword ptr [rbp + 0x3b9], 0x3f800000
140018a5f	mov	r8, qword ptr [rsi]
140018a62	mov	qword ptr [rbp + 0x168], 0
140018a6d	mov	qword ptr [rbp + 0x170], 4
140018a78	mov	qword ptr [rbp + 0x178], 0
140018a83	mov	byte ptr [rbp + 0x180], cl
140018a89	mov	qword ptr [rbp + 0x188], rax
140018a90	mov	qword ptr [rbp + 0x190], rdx
140018a97	mov	dword ptr [rbp + 0x198], 0x41700000
140018aa1	mov	word ptr [rbp + 0x19c], 0x190
140018aaa	mov	byte ptr [rbp + 0x19e], 1
140018ab1	movups	xmm0, xmmword ptr [rbp + 0x3a8]
140018ab8	movups	xmmword ptr [rbp + 0x19f], xmm0
140018abf	mov	rax, qword ptr [rbp + 0x3b5]
140018ac6	mov	qword ptr [rbp + 0x1ac], rax
140018acd	movups	xmmword ptr [rbp + 0x1b4], xmm9
140018ad5	mov	eax, dword ptr [rip + 0x5dbcfc5]
140018adb	mov	dword ptr [rbp + 0x1c4], eax
140018ae1	movsd	xmm0, qword ptr [rip + 0x5d849b7]
140018ae9	movsd	qword ptr [rbp + 0x1c8], xmm0
140018af1	mov	qword ptr [rbp + 0x148], r8
140018af8	lea	r9, [rip + 0x5dbc931]
140018aff	lea	rcx, [rbp - 0x40]
140018b03	lea	r8, [rbp + 0x148]
140018b0a	lea	rdx, [rsi + 8]
140018b0e	call	0x1401f2bf0
140018b13	cmp	qword ptr [r15 + 0x188], -1
140018b1b	je	0x140018d13
140018b21	xorps	xmm0, xmm0
140018b24	movups	xmmword ptr [rbp + 0x1c8], xmm0
140018b2b	movups	xmmword ptr [rbp + 0x1b8], xmm0
140018b32	movups	xmmword ptr [rbp + 0x1e0], xmm0
140018b39	movups	xmmword ptr [rbp + 0x1f8], xmm0
140018b40	movups	xmm0, xmmword ptr [rip + 0x5d86289]
140018b47	movaps	xmmword ptr [rbp - 0x40], xmm0
140018b4b	mov	qword ptr [rbp - 0x30], 0
140018b53	movups	xmm0, xmmword ptr [rip + 0x5d8628e]
140018b5a	movups	xmmword ptr [rbp - 0x28], xmm0
140018b5e	mov	qword ptr [rbp - 0x18], 0
140018b66	movaps	xmmword ptr [rbp - 0x10], xmm10
140018b6b	mov	qword ptr [rbp], 0
140018b73	movups	xmmword ptr [rbp + 8], xmm11
140018b78	mov	qword ptr [rbp + 0x18], 0
140018b80	movaps	xmm0, xmmword ptr [rbp - 0x10]
140018b84	movups	xmmword ptr [rbp + 0x180], xmm0
140018b8b	movaps	xmm0, xmmword ptr [rbp - 0x20]
140018b8f	movups	xmmword ptr [rbp + 0x170], xmm0
140018b96	movaps	xmm0, xmmword ptr [rbp - 0x30]
140018b9a	movups	xmmword ptr [rbp + 0x160], xmm0
140018ba1	movaps	xmm0, xmmword ptr [rbp - 0x40]
140018ba5	movups	xmmword ptr [rbp + 0x150], xmm0
140018bac	add	r15, 0x188
140018bb3	mov	qword ptr [rbp + 0x380], r15
140018bba	mov	rax, qword ptr [rsi]
140018bbd	mov	rcx, qword ptr [rbp + 0x10]
140018bc1	mov	qword ptr [rbp + 0x1a0], rcx
140018bc8	mov	rcx, qword ptr [rbp + 0x18]
140018bcc	mov	qword ptr [rbp + 0x1a8], rcx
140018bd3	mov	rcx, qword ptr [rbp]
140018bd7	mov	qword ptr [rbp + 0x190], rcx
140018bde	mov	rcx, qword ptr [rbp + 8]
140018be2	mov	qword ptr [rbp + 0x198], rcx
140018be9	mov	qword ptr [rbp + 0x1b0], 0
140018bf4	movabs	rcx, 0x42c8000000000002
140018bfe	mov	qword ptr [rbp + 0x1d8], rcx
140018c05	movabs	rcx, 0x4240000000000001
140018c0f	mov	qword ptr [rbp + 0x1f0], rcx
140018c16	movups	xmm0, xmmword ptr [rip + 0x5d8626b]
140018c1d	movups	xmmword ptr [rbp + 0x208], xmm0
140018c24	movups	xmm0, xmmword ptr [rip + 0x5d8626d]
140018c2b	movups	xmmword ptr [rbp + 0x218], xmm0
140018c32	movups	xmmword ptr [rbp + 0x238], xmm14
140018c3a	movups	xmmword ptr [rbp + 0x228], xmm15
140018c42	movups	xmmword ptr [rbp + 0x258], xmm6
140018c49	movups	xmmword ptr [rbp + 0x248], xmm7
140018c50	movups	xmmword ptr [rbp + 0x278], xmm12
140018c58	movups	xmmword ptr [rbp + 0x268], xmm13
140018c60	movups	xmmword ptr [rbp + 0x288], xmm8
140018c68	mov	dword ptr [rbp + 0x298], 1
140018c72	movss	xmm0, dword ptr [rip + 0x5d848a6]
140018c7a	movlps	qword ptr [rbp + 0x29c], xmm0
140018c81	mov	byte ptr [rbp + 0x2a4], 1
140018c88	mov	qword ptr [rbp + 0x2ae], 0
140018c93	mov	qword ptr [rbp + 0x2a8], 0
140018c9e	mov	word ptr [rbp + 0x2ba], 0
140018ca7	mov	dword ptr [rbp + 0x2b6], 0x10000
140018cb1	mov	word ptr [rbp + 0x2c0], 0
140018cba	mov	dword ptr [rbp + 0x2bc], 0x10000
140018cc4	mov	qword ptr [rbp + 0x2c2], 0
140018ccf	mov	dword ptr [rbp + 0x2ca], 5
140018cd9	mov	qword ptr [rbp + 0x148], rax
140018ce0	lea	r9, [rip + 0x5dbc749]
140018ce7	lea	r14, [rbp + 0x3a8]
140018cee	lea	r8, [rbp + 0x148]
140018cf5	mov	rcx, r14
140018cf8	lea	rdx, [rsi + 8]
140018cfc	call	0x1401de510
140018d01	lea	r8, [rbp + 0x380]
140018d08	mov	rcx, r14
140018d0b	mov	rdx, rdi
140018d0e	call	0x140259c40
140018d13	lea	rcx, [rbp + 0x148]
140018d1a	call	0x1458a8bd0
140018d1f	mov	rax, qword ptr [rbp + 0x148]
140018d26	cmp	rax, -1
140018d2a	je	0x140018de7
140018d30	mov	qword ptr [rbp + 0x3f0], rax
140018d37	mov	rcx, qword ptr [rbp + 0x150]
140018d3e	mov	rax, qword ptr [rbp + 0x158]
140018d45	mov	qword ptr [rbp + 0x3e8], rcx
140018d4c	mov	qword ptr [rbp + 0x368], rcx
140018d53	mov	qword ptr [rbp + 0x370], rax
140018d5a	mov	qword ptr [rbp + 0x3a8], 0
140018d65	mov	qword ptr [rbp + 0x3b0], 1
140018d70	mov	qword ptr [rbp + 0x3b8], 0
140018d7b	mov	qword ptr [rbp - 0x30], 0x60000020
140018d83	mov	qword ptr [rbp - 0x40], r12
140018d87	lea	rax, [rip + 0x5d8f4fa]
140018d8e	mov	qword ptr [rbp - 0x38], rax
140018d92	lea	rcx, [rbp + 0x368]
140018d99	lea	rdx, [rbp - 0x40]
140018d9d	call	0x145bbfce0
140018da2	nop
140018da3	test	al, al
140018da5	jne	0x140019935
140018dab	mov	rax, qword ptr [rbp + 0x3b8]
140018db2	mov	qword ptr [rbp + 0x390], rax
140018db9	movups	xmm0, xmmword ptr [rbp + 0x3a8]
140018dc0	movaps	xmmword ptr [rbp + 0x380], xmm0
140018dc7	mov	rdx, qword ptr [rbp + 0x3f0]
140018dce	test	rdx, rdx
140018dd1	je	0x140018e08
140018dd3	mov	r8d, 1
140018dd9	mov	rcx, qword ptr [rbp + 0x3e8]
140018de0	call	0x1400021d0
140018de5	jmp	0x140018e08
140018de7	mov	qword ptr [rbp + 0x380], 0
140018df2	mov	qword ptr [rbp + 0x388], 1
140018dfd	mov	qword ptr [rbp + 0x390], 0
140018e08	mov	word ptr [rbp + 0x124], 0
140018e11	mov	byte ptr [rbp + 0x114], 1
140018e18	xorps	xmm0, xmm0
140018e1b	movaps	xmmword ptr [rbp + 0x20], xmm0
140018e1f	movaps	xmmword ptr [rbp + 0x30], xmm0
140018e23	movaps	xmmword ptr [rbp + 0x40], xmm0
140018e27	movaps	xmmword ptr [rbp + 0x50], xmm0
140018e2b	movaps	xmmword ptr [rbp + 0x60], xmm0
140018e2f	mov	qword ptr [rbp + 0x70], 0
140018e37	mov	dword ptr [rbp + 0x138], 0
140018e41	mov	word ptr [rbp + 0x13c], 0
140018e4a	movaps	xmm0, xmmword ptr [rip + 0x5d8460f]
140018e51	movups	xmmword ptr [rbp + 0x78], xmm0
140018e55	movaps	xmm0, xmmword ptr [rip + 0x5d846d4]
140018e5c	movups	xmmword ptr [rbp + 0x88], xmm0
140018e63	movups	xmmword ptr [rbp + 0x98], xmm15
140018e6b	movups	xmmword ptr [rbp + 0xa8], xmm14
140018e73	movups	xmmword ptr [rbp + 0xc8], xmm6
140018e7a	movups	xmmword ptr [rbp + 0xb8], xmm7
140018e81	movups	xmmword ptr [rbp + 0xe8], xmm12
140018e89	movups	xmmword ptr [rbp + 0xd8], xmm13
140018e91	mov	byte ptr [rbp + 0x136], 0
140018e98	mov	dword ptr [rbp + 0x132], 0
140018ea2	mov	qword ptr [rbp + 0x118], 0
140018ead	mov	dword ptr [rbp + 0x120], 0x3f800000
140018eb7	movups	xmmword ptr [rbp + 0xf8], xmm8
140018ebf	mov	dword ptr [rbp + 0x108], 1
140018ec9	mov	qword ptr [rbp + 0x10c], 0
140018ed4	mov	byte ptr [rbp + 0x137], 0
140018edb	movups	xmm0, xmmword ptr [rip + 0x5d85eee]
140018ee2	movaps	xmmword ptr [rbp - 0x40], xmm0
140018ee6	mov	qword ptr [rbp - 0x30], 0
140018eee	movups	xmm0, xmmword ptr [rip + 0x5d85ef3]
140018ef5	movups	xmmword ptr [rbp - 0x28], xmm0
140018ef9	mov	qword ptr [rbp - 0x18], 0
140018f01	movaps	xmmword ptr [rbp - 0x10], xmm10
140018f06	mov	qword ptr [rbp], 0
140018f0e	movups	xmmword ptr [rbp + 8], xmm11
140018f13	mov	qword ptr [rbp + 0x18], 0
140018f1b	mov	word ptr [rbp + 0x12a], 0
140018f24	mov	dword ptr [rbp + 0x126], 0x10000
140018f2e	mov	word ptr [rbp + 0x130], 0
140018f37	mov	dword ptr [rbp + 0x12c], 0x10000
140018f41	lea	rcx, [rip + 0x5d86208]
140018f48	mov	edx, 0x12
140018f4d	call	0x1458ec450
140018f52	nop
140018f53	mov	r12, rdx
140018f56	test	rdx, rdx
140018f59	jns	0x140018f6f
140018f5b	xor	r13d, r13d
140018f5e	mov	rcx, r13
140018f61	mov	rdx, r12
140018f64	call	0x145d992bb
140018f69	nop
140018f6a	jmp	0x140019961
140018f6f	test	r12, r12
140018f72	je	0x140018fdb
140018f74	mov	r15, rax
140018f77	call	0x140002200
140018f7c	mov	r13d, 1
140018f82	mov	edx, 1
140018f87	mov	rcx, r12
140018f8a	call	0x1400021c0
140018f8f	test	rax, rax
140018f92	je	0x140018f5e
140018f94	mov	r14, rax
140018f97	mov	rcx, rax
140018f9a	mov	rdx, r15
140018f9d	mov	r8, r12
140018fa0	call	0x145bfa0e7
140018fa5	mov	qword ptr [rbp + 0x3f0], rsi
140018fac	cmp	byte ptr [rbp + 0x3e0], 0
140018fb3	mov	qword ptr [rbp + 0x3e8], rdi
140018fba	je	0x140018ff8
140018fbc	mov	eax, dword ptr [rdi + 1]
140018fbf	mov	ecx, dword ptr [rdi + 4]
140018fc2	mov	dword ptr [rbp + 0x36b], ecx
140018fc8	mov	dword ptr [rbp + 0x368], eax
140018fce	mov	rsi, qword ptr [rdi + 8]
140018fd2	movzx	ebx, byte ptr [rdi + 0x10]
140018fd6	mov	dil, 1
140018fd9	jmp	0x140019008
140018fdb	mov	r14d, 1
140018fe1	mov	qword ptr [rbp + 0x3f0], rsi
140018fe8	cmp	byte ptr [rbp + 0x3e0], 0
140018fef	mov	qword ptr [rbp + 0x3e8], rdi
140018ff6	jne	0x140018fbc
140018ff8	mov	rsi, qword ptr [rdi + 8]
140018ffc	lock inc	qword ptr [rsi]
140019000	jle	0x140019961
140019006	xor	edi, edi
140019008	mov	eax, dword ptr [rbp + 0x368]
14001900e	mov	ecx, dword ptr [rbp + 0x36b]
140019014	mov	dword ptr [rbp + 0x304], ecx
14001901a	mov	dword ptr [rbp + 0x301], eax
140019020	movups	xmm0, xmmword ptr [rip + 0x5d85f3d]
140019027	movups	xmmword ptr [rbp + 0x3a9], xmm0
14001902e	mov	dword ptr [rbp + 0x3b9], 0x3f800000
140019038	lea	r15, [rbp + 0x150]
14001903f	lea	rdx, [rbp - 0x40]
140019043	mov	r8d, 0x180
140019049	mov	rcx, r15
14001904c	call	0x145bfa0e7
140019051	movups	xmm0, xmmword ptr [rbp + 0x3a8]
140019058	movups	xmmword ptr [rbp + 0x31f], xmm0
14001905f	mov	rax, qword ptr [rbp + 0x3b5]
140019066	mov	qword ptr [rbp + 0x32c], rax
14001906d	mov	rax, qword ptr [rbp + 0x3f0]
140019074	mov	rax, qword ptr [rax]
140019077	mov	qword ptr [rbp + 0x2d0], r12
14001907e	mov	qword ptr [rbp + 0x2d8], r14
140019085	mov	qword ptr [rbp + 0x2e0], r12
14001908c	mov	qword ptr [rbp + 0x2e8], 0
140019097	mov	qword ptr [rbp + 0x2f0], 4
1400190a2	mov	qword ptr [rbp + 0x2f8], 0
1400190ad	mov	byte ptr [rbp + 0x300], dil
1400190b4	mov	qword ptr [rbp + 0x308], rsi
1400190bb	mov	qword ptr [rbp + 0x310], rbx
1400190c2	mov	dword ptr [rbp + 0x318], 0x41880000
1400190cc	mov	word ptr [rbp + 0x31c], 0x190
1400190d5	mov	byte ptr [rbp + 0x31e], 1
1400190dc	movups	xmmword ptr [rbp + 0x334], xmm9
1400190e4	mov	ecx, dword ptr [rip + 0x5dbc9b6]
1400190ea	mov	dword ptr [rbp + 0x344], ecx
1400190f0	movsd	xmm0, qword ptr [rip + 0x5d843a8]
1400190f8	movsd	qword ptr [rbp + 0x348], xmm0
140019100	mov	qword ptr [rbp + 0x148], rax
140019107	lea	r9, [rip + 0x5dbc322]
14001910e	lea	rcx, [rbp - 0x40]
140019112	lea	r8, [rbp + 0x148]
140019119	mov	rdx, qword ptr [rbp + 0x3a0]
140019120	call	0x1401e2c10
140019125	nop
140019126	lea	rax, [rip + 0x5d8605b]
14001912d	mov	qword ptr [rbp + 0x3a8], rax
140019134	mov	qword ptr [rbp + 0x3b0], 4
14001913f	lea	rax, [rbp + 0x380]
140019146	mov	qword ptr [rbp + 0x3b8], rax
14001914d	lea	rax, [rip + 0x5d86014]
140019154	mov	qword ptr [rbp + 0x3c0], rax
14001915b	mov	qword ptr [rsp + 0x20], 1
140019164	lea	rdx, [rip + 0x5d86021]
14001916b	lea	rcx, [rbp - 0x40]
14001916f	lea	r9, [rbp + 0x3a8]
140019176	mov	r8d, 0x15
14001917c	call	0x1458ec4b0
140019181	nop
140019182	cmp	byte ptr [rbp + 0x3e0], 0
140019189	je	0x1400191b7
14001918b	mov	rdx, qword ptr [rbp + 0x3e8]
140019192	mov	eax, dword ptr [rdx + 1]
140019195	mov	ecx, dword ptr [rdx + 4]
140019198	mov	dword ptr [rbp + 0x363], ecx
14001919e	mov	dword ptr [rbp + 0x360], eax
1400191a4	mov	rax, qword ptr [rdx + 8]
1400191a8	movzx	edx, byte ptr [rdx + 0x10]
1400191ac	mov	cl, 1
1400191ae	mov	r10, qword ptr [rbp + 0x3f0]
1400191b5	jmp	0x1400191d5
1400191b7	mov	rax, qword ptr [rbp + 0x3e8]
1400191be	mov	rax, qword ptr [rax + 8]
1400191c2	lock inc	qword ptr [rax]
1400191c6	mov	r10, qword ptr [rbp + 0x3f0]
1400191cd	jle	0x140019961
1400191d3	xor	ecx, ecx
1400191d5	mov	r8, qword ptr [rbp - 0x30]
1400191d9	mov	qword ptr [rbp + 0x160], r8
1400191e0	movups	xmm0, xmmword ptr [rbp - 0x40]
1400191e4	movups	xmmword ptr [rbp + 0x150], xmm0
1400191eb	mov	r8d, dword ptr [rbp + 0x360]
1400191f2	mov	r9d, dword ptr [rbp + 0x363]
1400191f9	mov	dword ptr [rbp + 0x181], r8d
140019200	mov	dword ptr [rbp + 0x184], r9d
140019207	movups	xmm0, xmmword ptr [rip + 0x5d85eda]
14001920e	movups	xmmword ptr [rbp + 0x369], xmm0
140019215	mov	dword ptr [rbp + 0x379], 0x3f800000
14001921f	mov	r8, qword ptr [r10]
140019222	mov	qword ptr [rbp + 0x168], 0
14001922d	mov	qword ptr [rbp + 0x170], 4
140019238	mov	qword ptr [rbp + 0x178], 0
140019243	mov	byte ptr [rbp + 0x180], cl
140019249	mov	qword ptr [rbp + 0x188], rax
140019250	mov	qword ptr [rbp + 0x190], rdx
140019257	mov	dword ptr [rbp + 0x198], 0x41600000
140019261	mov	word ptr [rbp + 0x19c], 0x190
14001926a	mov	byte ptr [rbp + 0x19e], 1
140019271	movups	xmm0, xmmword ptr [rbp + 0x368]
140019278	movups	xmmword ptr [rbp + 0x19f], xmm0
14001927f	mov	rax, qword ptr [rbp + 0x375]
140019286	mov	qword ptr [rbp + 0x1ac], rax
14001928d	movups	xmmword ptr [rbp + 0x1b4], xmm9
140019295	mov	eax, dword ptr [rip + 0x5dbc805]
14001929b	mov	dword ptr [rbp + 0x1c4], eax
1400192a1	movsd	xmm0, qword ptr [rip + 0x5d841f7]
1400192a9	movsd	qword ptr [rbp + 0x1c8], xmm0
1400192b1	mov	qword ptr [rbp + 0x148], r8
1400192b8	lea	r9, [rip + 0x5dbc171]
1400192bf	lea	rcx, [rbp - 0x40]
1400192c3	lea	r8, [rbp + 0x148]
1400192ca	mov	rdx, qword ptr [rbp + 0x3a0]
1400192d1	call	0x1401f2bf0
1400192d6	nop
1400192d7	lea	rcx, [rip + 0x5d85ec3]
1400192de	mov	edx, 0x15
1400192e3	call	0x1458ec450
1400192e8	nop
1400192e9	mov	r12, rdx
1400192ec	test	rdx, rdx
1400192ef	jns	0x140019305
1400192f1	xor	r13d, r13d
1400192f4	mov	rcx, r13
1400192f7	mov	rdx, r12
1400192fa	call	0x145d992bb
1400192ff	nop
140019300	jmp	0x140019961
140019305	test	r12, r12
140019308	je	0x140019372
14001930a	mov	qword ptr [rbp - 0x48], rax
14001930e	call	0x140002200
140019313	mov	r13d, 1
140019319	mov	edx, 1
14001931e	mov	rcx, r12
140019321	call	0x1400021c0
140019326	test	rax, rax
140019329	mov	rsi, qword ptr [rbp + 0x3f0]
140019330	mov	rdi, qword ptr [rbp + 0x3e8]
140019337	je	0x1400192f4
140019339	mov	r14, rax
14001933c	mov	rcx, rax
14001933f	mov	rdx, qword ptr [rbp - 0x48]
140019343	mov	r8, r12
140019346	call	0x145bfa0e7
14001934b	cmp	byte ptr [rbp + 0x3e0], 0
140019352	je	0x14001938f
140019354	mov	eax, dword ptr [rdi + 1]
140019357	mov	ecx, dword ptr [rdi + 4]
14001935a	mov	dword ptr [rbp + 0x35b], ecx
140019360	mov	dword ptr [rbp + 0x358], eax
140019366	mov	rax, qword ptr [rdi + 8]
14001936a	movzx	ecx, byte ptr [rdi + 0x10]
14001936e	mov	dl, 1
140019370	jmp	0x14001939f
140019372	mov	r14d, 1
140019378	mov	rsi, qword ptr [rbp + 0x3f0]
14001937f	mov	rdi, qword ptr [rbp + 0x3e8]
140019386	cmp	byte ptr [rbp + 0x3e0], 0
14001938d	jne	0x140019354
14001938f	mov	rax, qword ptr [rdi + 8]
140019393	lock inc	qword ptr [rax]
140019397	jle	0x140019961
14001939d	xor	edx, edx
14001939f	movups	xmm0, xmmword ptr [rip + 0x5d85d42]
1400193a6	movups	xmmword ptr [rbp + 0x3a9], xmm0
1400193ad	mov	dword ptr [rbp + 0x3b9], 0x3f800000
1400193b7	mov	r8, qword ptr [rsi]
1400193ba	mov	qword ptr [rbp + 0x150], r12
1400193c1	mov	qword ptr [rbp + 0x158], r14
1400193c8	mov	qword ptr [rbp + 0x160], r12
1400193cf	mov	qword ptr [rbp + 0x168], 0
1400193da	mov	qword ptr [rbp + 0x170], 4
1400193e5	mov	qword ptr [rbp + 0x178], 0
1400193f0	mov	byte ptr [rbp + 0x180], dl
1400193f6	mov	edx, dword ptr [rbp + 0x358]
1400193fc	mov	r9d, dword ptr [rbp + 0x35b]
140019403	mov	dword ptr [rbp + 0x181], edx
140019409	mov	dword ptr [rbp + 0x184], r9d
140019410	mov	qword ptr [rbp + 0x188], rax
140019417	mov	qword ptr [rbp + 0x190], rcx
14001941e	mov	dword ptr [rbp + 0x198], 0x41600000
140019428	mov	word ptr [rbp + 0x19c], 0x190
140019431	mov	byte ptr [rbp + 0x19e], 1
140019438	movups	xmm0, xmmword ptr [rbp + 0x3a8]
14001943f	movups	xmmword ptr [rbp + 0x19f], xmm0
140019446	mov	rax, qword ptr [rbp + 0x3b5]
14001944d	mov	qword ptr [rbp + 0x1ac], rax
140019454	mov	eax, dword ptr [rip + 0x5dbc646]
14001945a	mov	dword ptr [rbp + 0x1c4], eax
140019460	movups	xmmword ptr [rbp + 0x1b4], xmm9
140019468	movsd	xmm0, qword ptr [rip + 0x5d84030]
140019470	movsd	qword ptr [rbp + 0x1c8], xmm0
140019478	mov	qword ptr [rbp + 0x148], r8
14001947f	lea	r9, [rip + 0x5dbbfaa]
140019486	lea	rcx, [rbp - 0x40]
14001948a	lea	r8, [rbp + 0x148]
140019491	mov	rdx, qword ptr [rbp + 0x3a0]
140019498	call	0x1401f2bf0
14001949d	nop
14001949e	mov	rcx, qword ptr [rbp - 0x50]
1400194a2	mov	rax, qword ptr [rcx + 0x88]
1400194a9	test	rax, rax
1400194ac	je	0x1400196f7
1400194b2	mov	rbx, qword ptr [rcx + 0x80]
1400194b9	imul	rax, rax, 0x38
1400194bd	add	rax, rbx
1400194c0	mov	qword ptr [rbp + 0x3e0], rax
1400194c7	lea	rdi, [rbp - 0x28]
1400194cb	lea	r14, [rbp + 0x1b8]
1400194d2	xor	r12d, r12d
1400194d5	xorps	xmm9, xmm9
1400194d9	lea	r13, [rbp + 0x3a8]
1400194e0	lea	rsi, [rbp + 0x148]
1400194e7	cmp	rbx, qword ptr [rbp + 0x3e0]
1400194ee	je	0x1400198b5
1400194f4	nop	word ptr cs:[rax + rax]
140019500	movups	xmmword ptr [r14 + 0x10], xmm9
140019505	movups	xmmword ptr [r14], xmm9
140019509	movups	xmmword ptr [r14 + 0x28], xmm9
14001950e	movups	xmmword ptr [r14 + 0x40], xmm9
140019513	movups	xmm0, xmmword ptr [rip + 0x5d858b6]
14001951a	movaps	xmmword ptr [rbp - 0x40], xmm0
14001951e	mov	qword ptr [rbp - 0x30], 0
140019526	movups	xmm0, xmmword ptr [rip + 0x5d858bb]
14001952d	movups	xmmword ptr [rdi], xmm0
140019530	mov	qword ptr [rdi + 0x10], 0
140019538	movups	xmmword ptr [rdi + 0x18], xmm10
14001953d	mov	qword ptr [rdi + 0x28], 0
140019545	movups	xmmword ptr [rdi + 0x30], xmm11
14001954a	mov	qword ptr [rdi + 0x40], 0
140019552	movaps	xmm0, xmmword ptr [rbp + 0x10]
140019556	movups	xmmword ptr [r15 + 0x50], xmm0
14001955b	movaps	xmm0, xmmword ptr [rbp]
14001955f	movups	xmmword ptr [r15 + 0x40], xmm0
140019564	movaps	xmm0, xmmword ptr [rbp - 0x10]
140019568	movups	xmmword ptr [r15 + 0x30], xmm0
14001956d	movaps	xmm0, xmmword ptr [rbp - 0x20]
140019571	movups	xmmword ptr [r15 + 0x20], xmm0
140019576	movaps	xmm0, xmmword ptr [rbp - 0x40]
14001957a	movups	xmmword ptr [r15], xmm0
14001957e	mov	qword ptr [rbp + 0x368], r12
140019585	mov	rax, qword ptr [rbp + 0x3f0]
14001958c	mov	rax, qword ptr [rax]
14001958f	mov	rcx, qword ptr [rbp - 0x30]
140019593	mov	rdx, qword ptr [rbp - 0x28]
140019597	mov	qword ptr [r15 + 0x10], rcx
14001959b	mov	qword ptr [r15 + 0x18], rdx
14001959f	mov	qword ptr [rbp + 0x1b0], 0
1400195aa	movabs	rcx, 0x42c8000000000002
1400195b4	mov	qword ptr [rbp + 0x1d8], rcx
1400195bb	movabs	rcx, 0x4240000000000001
1400195c5	mov	qword ptr [rbp + 0x1f0], rcx
1400195cc	movups	xmm0, xmmword ptr [rip + 0x5d858c5]
1400195d3	movups	xmmword ptr [r14 + 0x60], xmm0
1400195d8	movups	xmm0, xmmword ptr [rip + 0x5d858a9]
1400195df	movups	xmmword ptr [r14 + 0x50], xmm0
1400195e4	movups	xmmword ptr [r14 + 0x80], xmm14
1400195ec	movups	xmmword ptr [r14 + 0x70], xmm15
1400195f1	movups	xmmword ptr [r14 + 0xa0], xmm6
1400195f9	movups	xmmword ptr [r14 + 0x90], xmm7
140019601	movups	xmmword ptr [r14 + 0xb0], xmm13
140019609	movups	xmmword ptr [r14 + 0xc0], xmm12
140019611	movups	xmmword ptr [rbp + 0x288], xmm8
140019619	mov	dword ptr [rbp + 0x298], 1
140019623	movss	xmm0, dword ptr [rip + 0x5d83ef5]
14001962b	movlps	qword ptr [rbp + 0x29c], xmm0
140019632	mov	byte ptr [rbp + 0x2a4], 1
140019639	mov	qword ptr [r14 + 0xf6], 0
140019644	mov	qword ptr [r14 + 0xf0], 0
14001964f	mov	word ptr [r14 + 0x102], 0
140019659	mov	dword ptr [r14 + 0xfe], 0x10000
140019664	mov	word ptr [r14 + 0x108], 0
14001966e	mov	dword ptr [r14 + 0x104], 0x10000
140019679	mov	qword ptr [rbp + 0x2c2], 0
140019684	mov	dword ptr [rbp + 0x2ca], 5
14001968e	mov	qword ptr [rbp + 0x148], rax
140019695	mov	rcx, r13
140019698	mov	rdx, qword ptr [rbp + 0x3a0]
14001969f	mov	r8, rsi
1400196a2	lea	r9, [rip + 0x5dbbd87]
1400196a9	call	0x1401de510
1400196ae	nop
1400196af	mov	rax, qword ptr [rbp + 0x3e8]
1400196b6	mov	qword ptr [rbp + 0x148], rax
1400196bd	mov	qword ptr [rbp + 0x150], rbx
1400196c4	lea	rax, [rbp + 0x368]
1400196cb	mov	qword ptr [rbp + 0x158], rax
1400196d2	mov	rcx, r13
1400196d5	mov	rdx, rsi
1400196d8	call	0x140259810
1400196dd	nop
1400196de	add	rbx, 0x38
1400196e2	inc	r12
1400196e5	cmp	rbx, qword ptr [rbp + 0x3e0]
1400196ec	jne	0x140019500
1400196f2	jmp	0x1400198b5
1400196f7	lea	rcx, [rip + 0x5d85ab8]
1400196fe	mov	edx, 0x15
140019703	call	0x1458ec450
140019708	nop
140019709	mov	r14, rdx
14001970c	test	rdx, rdx
14001970f	jns	0x140019725
140019711	xor	r13d, r13d
140019714	mov	rcx, r13
140019717	mov	rdx, r14
14001971a	call	0x145d992bb
14001971f	nop
140019720	jmp	0x140019961
140019725	test	r14, r14
140019728	je	0x14001976b
14001972a	mov	r12, rax
14001972d	call	0x140002200
140019732	mov	r13d, 1
140019738	mov	edx, 1
14001973d	mov	rcx, r14
140019740	call	0x1400021c0
140019745	test	rax, rax
140019748	mov	rsi, qword ptr [rbp + 0x3f0]
14001974f	mov	rdi, qword ptr [rbp + 0x3e8]
140019756	je	0x140019714
140019758	mov	r15, rax
14001975b	mov	rcx, rax
14001975e	mov	rdx, r12
140019761	mov	r8, r14
140019764	call	0x145bfa0e7
140019769	jmp	0x14001977f
14001976b	mov	r15d, 1
140019771	mov	rsi, qword ptr [rbp + 0x3f0]
140019778	mov	rdi, qword ptr [rbp + 0x3e8]
14001977f	cmp	byte ptr [rbp + 0x3e0], 0
140019786	je	0x1400197a6
140019788	mov	eax, dword ptr [rdi + 1]
14001978b	mov	ecx, dword ptr [rdi + 4]
14001978e	mov	dword ptr [rbp + 0x353], ecx
140019794	mov	dword ptr [rbp + 0x350], eax
14001979a	mov	rax, qword ptr [rdi + 8]
14001979e	movzx	ecx, byte ptr [rdi + 0x10]
1400197a2	mov	dl, 1
1400197a4	jmp	0x1400197b6
1400197a6	mov	rax, qword ptr [rdi + 8]
1400197aa	lock inc	qword ptr [rax]
1400197ae	jle	0x140019961
1400197b4	xor	edx, edx
1400197b6	movups	xmm0, xmmword ptr [rip + 0x5d8592b]
1400197bd	movups	xmmword ptr [rbp + 0x3a9], xmm0
1400197c4	mov	dword ptr [rbp + 0x3b9], 0x3f800000
1400197ce	mov	r8, qword ptr [rsi]
1400197d1	mov	qword ptr [rbp + 0x150], r14
1400197d8	mov	qword ptr [rbp + 0x158], r15
1400197df	mov	qword ptr [rbp + 0x160], r14
1400197e6	mov	qword ptr [rbp + 0x168], 0
1400197f1	mov	qword ptr [rbp + 0x170], 4
1400197fc	mov	qword ptr [rbp + 0x178], 0
140019807	mov	byte ptr [rbp + 0x180], dl
14001980d	mov	edx, dword ptr [rbp + 0x350]
140019813	mov	r9d, dword ptr [rbp + 0x353]
14001981a	mov	dword ptr [rbp + 0x181], edx
140019820	mov	dword ptr [rbp + 0x184], r9d
140019827	mov	qword ptr [rbp + 0x188], rax
14001982e	mov	qword ptr [rbp + 0x190], rcx
140019835	mov	dword ptr [rbp + 0x198], 0x41700000
14001983f	mov	word ptr [rbp + 0x19c], 0x190
140019848	mov	byte ptr [rbp + 0x19e], 1
14001984f	movups	xmm0, xmmword ptr [rbp + 0x3a8]
140019856	movups	xmmword ptr [rbp + 0x19f], xmm0
14001985d	mov	rax, qword ptr [rbp + 0x3b5]
140019864	mov	qword ptr [rbp + 0x1ac], rax
14001986b	mov	eax, dword ptr [rip + 0x5dbc22f]
140019871	mov	dword ptr [rbp + 0x1c4], eax
140019877	movups	xmmword ptr [rbp + 0x1b4], xmm9
14001987f	movsd	xmm0, qword ptr [rip + 0x5d83c19]
140019887	movsd	qword ptr [rbp + 0x1c8], xmm0
14001988f	mov	qword ptr [rbp + 0x148], r8
140019896	lea	r9, [rip + 0x5dbbb93]
14001989d	lea	rcx, [rbp - 0x40]
1400198a1	lea	r8, [rbp + 0x148]
1400198a8	mov	rdx, qword ptr [rbp + 0x3a0]
1400198af	call	0x1401f2bf0
1400198b4	nop
1400198b5	mov	rdx, qword ptr [rbp + 0x380]
1400198bc	test	rdx, rdx
1400198bf	je	0x1400198d3
1400198c1	mov	rcx, qword ptr [rbp + 0x388]
1400198c8	mov	r8d, 1
1400198ce	call	0x1400021d0
1400198d3	movaps	xmm6, xmmword ptr [rbp + 0x400]
1400198da	movaps	xmm7, xmmword ptr [rbp + 0x410]
1400198e1	movaps	xmm8, xmmword ptr [rbp + 0x420]
1400198e9	movaps	xmm9, xmmword ptr [rbp + 0x430]
1400198f1	movaps	xmm10, xmmword ptr [rbp + 0x440]
1400198f9	movaps	xmm11, xmmword ptr [rbp + 0x450]
140019901	movaps	xmm12, xmmword ptr [rbp + 0x460]
140019909	movaps	xmm13, xmmword ptr [rbp + 0x470]
140019911	movaps	xmm14, xmmword ptr [rbp + 0x480]
140019919	movaps	xmm15, xmmword ptr [rbp + 0x490]
140019921	add	rsp, 0x528
140019928	pop	rbx
140019929	pop	rdi
14001992a	pop	rsi
14001992b	pop	r12
14001992d	pop	r13
14001992f	pop	r14
140019931	pop	r15
140019933	pop	rbp
140019934	ret
140019935	lea	rax, [rip + 0x5d8ea04]
14001993c	mov	qword ptr [rsp + 0x20], rax
140019941	lea	rcx, [rip + 0x5d8e970]
140019948	lea	r9, [rip + 0x5d852f9]
14001994f	lea	r8, [rbp + 0x3df]
140019956	mov	edx, 0x37
14001995b	call	0x145d995d0
140019960	nop
140019961	ud2
