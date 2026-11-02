140102420	push	r15
140102422	push	r14
140102424	push	rsi
140102425	push	rdi
140102426	push	rbp
140102427	push	rbx
140102428	sub	rsp, 0x3c8
14010242f	movaps	xmmword ptr [rsp + 0x3b0], xmm6
140102437	mov	rsi, r9
14010243a	mov	rbx, r8
14010243d	mov	rdi, rdx
140102440	mov	rdx, rcx
140102443	mov	rax, qword ptr [rsp + 0x428]
14010244b	movzx	ebp, byte ptr [rsp + 0x420]
140102453	test	bpl, bpl
140102456	je	0x140102475
140102458	movups	xmm0, xmmword ptr [rip + 0x5cd3e39]
14010245f	movaps	xmmword ptr [rsp + 0x30], xmm0
140102464	mov	dword ptr [rsp + 0x40], 0x3f800000
14010246c	movaps	xmm0, xmmword ptr [rip + 0x5cd27bd]
140102473	jmp	0x140102490
140102475	movups	xmm0, xmmword ptr [rip + 0x5cd430c]
14010247c	movaps	xmmword ptr [rsp + 0x30], xmm0
140102481	mov	dword ptr [rsp + 0x40], 0x3f800000
140102489	movaps	xmm0, xmmword ptr [rip + 0x5cd2790]
140102490	movaps	xmm1, xmmword ptr [rsp + 0x30]
140102495	movaps	xmmword ptr [rsp + 0xb0], xmm1
14010249d	mov	ecx, dword ptr [rsp + 0x40]
1401024a1	mov	dword ptr [rsp + 0xc0], ecx
1401024a8	movups	xmm6, xmmword ptr [rip + 0x5cd435d]
1401024af	movups	xmmword ptr [rsp + 0xc4], xmm6
1401024b7	mov	dword ptr [rsp + 0xd4], 0x3f800000
1401024c2	movups	xmm1, xmmword ptr [rip + 0x5cd3867]
1401024c9	movaps	xmmword ptr [rsp + 0x320], xmm1
1401024d1	mov	qword ptr [rsp + 0x330], 0
1401024dd	movups	xmm1, xmmword ptr [rip + 0x5cd3864]
1401024e4	movups	xmmword ptr [rsp + 0x338], xmm1
1401024ec	mov	qword ptr [rsp + 0x348], 0
1401024f8	movups	xmm1, xmmword ptr [rip + 0x5cd3861]
1401024ff	movaps	xmmword ptr [rsp + 0x350], xmm1
140102507	mov	qword ptr [rsp + 0x360], 0
140102513	movups	xmm1, xmmword ptr [rip + 0x5cd385e]
14010251a	movups	xmmword ptr [rsp + 0x368], xmm1
140102522	mov	qword ptr [rsp + 0x378], 0
14010252e	mov	ecx, dword ptr [rsp + 0x40]
140102532	mov	dword ptr [rsp + 0xf0], ecx
140102539	movaps	xmm1, xmmword ptr [rsp + 0x30]
14010253e	movups	xmmword ptr [rsp + 0xf4], xmm1
140102546	mov	dword ptr [rsp + 0x104], ecx
14010254d	movups	xmmword ptr [rsp + 0x108], xmm1
140102555	mov	dword ptr [rsp + 0x118], ecx
14010255c	movups	xmmword ptr [rsp + 0x11c], xmm1
140102564	mov	dword ptr [rsp + 0x12c], ecx
14010256b	movups	xmmword ptr [rsp + 0x52], xmm1
140102570	mov	ecx, dword ptr [rsp + 0xf0]
140102577	mov	dword ptr [rsp + 0x62], ecx
14010257b	mov	rcx, qword ptr [rsp + 0xf4]
140102583	mov	qword ptr [rsp + 0x66], rcx
140102588	mov	ecx, dword ptr [rsp + 0xfc]
14010258f	mov	dword ptr [rsp + 0x6e], ecx
140102593	mov	ecx, dword ptr [rsp + 0x100]
14010259a	mov	dword ptr [rsp + 0x72], ecx
14010259e	mov	ecx, dword ptr [rsp + 0x104]
1401025a5	mov	dword ptr [rsp + 0x76], ecx
1401025a9	mov	rcx, qword ptr [rsp + 0x108]
1401025b1	mov	qword ptr [rsp + 0x7a], rcx
1401025b6	movaps	xmm1, xmmword ptr [rsp + 0x110]
1401025be	movups	xmmword ptr [rsp + 0x82], xmm1
1401025c6	movaps	xmm1, xmmword ptr [rsp + 0x120]
1401025ce	movups	xmmword ptr [rsp + 0x92], xmm1
1401025d6	mov	rcx, qword ptr [rdx]
1401025d9	add	rdx, 8
1401025dd	movaps	xmm1, xmmword ptr [rsp + 0x370]
1401025e5	movups	xmmword ptr [rsp + 0x138], xmm1
1401025ed	movaps	xmm1, xmmword ptr [rsp + 0x360]
1401025f5	movups	xmmword ptr [rsp + 0x128], xmm1
1401025fd	movaps	xmm1, xmmword ptr [rsp + 0x320]
140102605	movaps	xmm2, xmmword ptr [rsp + 0x330]
14010260d	movaps	xmm3, xmmword ptr [rsp + 0x340]
140102615	movaps	xmm4, xmmword ptr [rsp + 0x350]
14010261d	movups	xmmword ptr [rsp + 0x118], xmm4
140102625	movups	xmmword ptr [rsp + 0x108], xmm3
14010262d	movups	xmmword ptr [rsp + 0xf8], xmm2
140102635	movups	xmmword ptr [rsp + 0xe8], xmm1
14010263d	xorps	xmm1, xmm1
140102640	movups	xmmword ptr [rsp + 0x148], xmm1
140102648	movups	xmmword ptr [rsp + 0x158], xmm1
140102650	movups	xmmword ptr [rsp + 0x168], xmm1
140102658	movups	xmmword ptr [rsp + 0x178], xmm1
140102660	movups	xmmword ptr [rsp + 0x188], xmm1
140102668	mov	qword ptr [rsp + 0x198], 0
140102674	movups	xmm1, xmmword ptr [rip + 0x5cd377d]
14010267b	movups	xmmword ptr [rsp + 0x1b0], xmm1
140102683	movups	xmm1, xmmword ptr [rip + 0x5cd375e]
14010268a	movups	xmmword ptr [rsp + 0x1a0], xmm1
140102692	movaps	xmm1, xmmword ptr [rip + 0x5c9acc7]
140102699	movups	xmmword ptr [rsp + 0x1c0], xmm1
1401026a1	movaps	xmm1, xmmword ptr [rip + 0x5ccaa58]
1401026a8	movups	xmmword ptr [rsp + 0x1d0], xmm1
1401026b0	movaps	xmm2, xmmword ptr [rip + 0x5c9abf9]
1401026b7	movups	xmmword ptr [rsp + 0x1e0], xmm2
1401026bf	movups	xmmword ptr [rsp + 0x1f0], xmm2
1401026c7	movups	xmmword ptr [rsp + 0x200], xmm1
1401026cf	movups	xmmword ptr [rsp + 0x210], xmm1
1401026d7	movaps	xmm1, xmmword ptr [rip + 0x5c9ab92]
1401026de	movups	xmmword ptr [rsp + 0x220], xmm1
1401026e6	mov	dword ptr [rsp + 0x230], 1
1401026f1	mov	qword ptr [rsp + 0x234], 0
1401026fd	mov	byte ptr [rsp + 0x23c], 1
140102705	mov	qword ptr [rsp + 0x240], 0
140102711	mov	dword ptr [rsp + 0x248], 0x3f800000
14010271c	mov	word ptr [rsp + 0x24c], 0
140102726	mov	dword ptr [rsp + 0x24e], 0x10000
140102731	mov	word ptr [rsp + 0x252], 0
14010273b	mov	word ptr [rsp + 0x258], 0
140102745	mov	dword ptr [rsp + 0x254], 0x10000
140102750	mov	dword ptr [rsp + 0x262], 0
14010275b	mov	qword ptr [rsp + 0x25a], 0
140102767	movzx	r8d, word ptr [rsp + 0xa0]
140102770	mov	word ptr [rsp + 0x2b6], r8w
140102779	movups	xmm1, xmmword ptr [rsp + 0x90]
140102781	movups	xmmword ptr [rsp + 0x2a6], xmm1
140102789	movups	xmm1, xmmword ptr [rsp + 0x50]
14010278e	movups	xmm2, xmmword ptr [rsp + 0x60]
140102793	movups	xmm3, xmmword ptr [rsp + 0x70]
140102798	movups	xmm4, xmmword ptr [rsp + 0x80]
1401027a0	movups	xmmword ptr [rsp + 0x296], xmm4
1401027a8	movups	xmmword ptr [rsp + 0x286], xmm3
1401027b0	movups	xmmword ptr [rsp + 0x276], xmm2
1401027b8	movups	xmmword ptr [rsp + 0x266], xmm1
1401027c0	movups	xmm1, xmmword ptr [rax]
1401027c3	movups	xmm2, xmmword ptr [rax + 0x10]
1401027c7	movups	xmmword ptr [rsp + 0x2b8], xmm1
1401027cf	movups	xmmword ptr [rsp + 0x2c8], xmm2
1401027d7	mov	rax, qword ptr [rsp + 0xd0]
1401027df	mov	qword ptr [rsp + 0x2f8], rax
1401027e7	movaps	xmm1, xmmword ptr [rsp + 0xb0]
1401027ef	movaps	xmm2, xmmword ptr [rsp + 0xc0]
1401027f7	movups	xmmword ptr [rsp + 0x2e8], xmm2
1401027ff	movups	xmmword ptr [rsp + 0x2d8], xmm1
140102807	mov	dword ptr [rsp + 0x300], 0
140102812	mov	byte ptr [rsp + 0x304], 2
14010281a	mov	dword ptr [rsp + 0x308], 0
140102825	movups	xmmword ptr [rsp + 0x30c], xmm0
14010282d	mov	qword ptr [rsp + 0xe0], rcx
140102835	lea	r9, [rip + 0x5cd2bf4]
14010283c	lea	rcx, [rsp + 0x380]
140102844	lea	r8, [rsp + 0xe0]
14010284c	call	0x1401f1900
140102851	test	bpl, bpl
140102854	je	0x1401028b7
140102856	movaps	xmmword ptr [rsp + 0x50], xmm6
14010285b	mov	dword ptr [rsp + 0x60], 0x3f800000
140102863	test	rsi, rsi
140102866	js	0x1401028d0
140102868	je	0x1401028e0
14010286a	call	0x140002200
14010286f	mov	r15d, 1
140102875	mov	edx, 1
14010287a	mov	rcx, rsi
14010287d	call	0x1400021c0
140102882	test	rax, rax
140102885	je	0x1401028d3
140102887	mov	r14, rax
14010288a	mov	rcx, rax
14010288d	mov	rdx, rbx
140102890	mov	r8, rsi
140102893	call	0x145bfa0e7
140102898	cmp	byte ptr [rdi], 1
14010289b	jne	0x1401028eb
14010289d	mov	eax, dword ptr [rdi + 1]
1401028a0	mov	ecx, dword ptr [rdi + 4]
1401028a3	mov	dword ptr [rsp + 0x2b], ecx
1401028a7	mov	dword ptr [rsp + 0x28], eax
1401028ab	mov	rax, qword ptr [rdi + 8]
1401028af	movzx	ecx, byte ptr [rdi + 0x10]
1401028b3	mov	dl, 1
1401028b5	jmp	0x1401028fb
1401028b7	movups	xmm0, xmmword ptr [rip + 0x5cd39da]
1401028be	movaps	xmmword ptr [rsp + 0x50], xmm0
1401028c3	mov	dword ptr [rsp + 0x60], 0x3f800000
1401028cb	test	rsi, rsi
1401028ce	jns	0x140102868
1401028d0	xor	r15d, r15d
1401028d3	mov	rcx, r15
1401028d6	mov	rdx, rsi
1401028d9	call	0x145d992bb
1401028de	ud2
1401028e0	mov	r14d, 1
1401028e6	cmp	byte ptr [rdi], 1
1401028e9	je	0x14010289d
1401028eb	mov	rax, qword ptr [rdi + 8]
1401028ef	lock inc	qword ptr [rax]
1401028f3	jle	0x1401029f3
1401028f9	xor	edx, edx
1401028fb	mov	qword ptr [rsp + 0xe0], rsi
140102903	mov	qword ptr [rsp + 0xe8], r14
14010290b	mov	qword ptr [rsp + 0xf0], rsi
140102913	mov	qword ptr [rsp + 0xf8], 0
14010291f	mov	qword ptr [rsp + 0x100], 4
14010292b	mov	qword ptr [rsp + 0x108], 0
140102937	mov	byte ptr [rsp + 0x110], dl
14010293e	mov	edx, dword ptr [rsp + 0x28]
140102942	mov	r8d, dword ptr [rsp + 0x2b]
140102947	mov	dword ptr [rsp + 0x111], edx
14010294e	mov	dword ptr [rsp + 0x114], r8d
140102956	mov	qword ptr [rsp + 0x118], rax
14010295e	mov	qword ptr [rsp + 0x120], rcx
140102966	mov	dword ptr [rsp + 0x128], 0x41600000
140102971	mov	word ptr [rsp + 0x12c], 0x190
14010297b	mov	byte ptr [rsp + 0x12e], 1
140102983	movaps	xmm0, xmmword ptr [rsp + 0x50]
140102988	movups	xmmword ptr [rsp + 0x130], xmm0
140102990	mov	eax, dword ptr [rsp + 0x60]
140102994	mov	dword ptr [rsp + 0x140], eax
14010299b	movups	xmm0, xmmword ptr [rip + 0x5cd30ee]
1401029a2	movups	xmmword ptr [rsp + 0x144], xmm0
1401029aa	mov	dword ptr [rsp + 0x154], 0x3f59999a
1401029b5	movsd	xmm0, qword ptr [rip + 0x5c9aae3]
1401029bd	movsd	qword ptr [rsp + 0x158], xmm0
1401029c6	lea	rcx, [rsp + 0x380]
1401029ce	lea	rdx, [rsp + 0xe0]
1401029d6	call	0x1401f9650
1401029db	movaps	xmm6, xmmword ptr [rsp + 0x3b0]
1401029e3	add	rsp, 0x3c8
1401029ea	pop	rbx
1401029eb	pop	rbp
1401029ec	pop	rdi
1401029ed	pop	rsi
1401029ee	pop	r14
1401029f0	pop	r15
1401029f2	ret
1401029f3	ud2
