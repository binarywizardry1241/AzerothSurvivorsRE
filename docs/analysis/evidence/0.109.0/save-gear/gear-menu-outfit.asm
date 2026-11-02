1401612f0	push	r15
1401612f2	push	r14
1401612f4	push	r13
1401612f6	push	r12
1401612f8	push	rsi
1401612f9	push	rdi
1401612fa	push	rbp
1401612fb	push	rbx
1401612fc	sub	rsp, 0x268
140161303	movaps	xmmword ptr [rsp + 0x250], xmm9
14016130c	movaps	xmmword ptr [rsp + 0x240], xmm8
140161315	movaps	xmmword ptr [rsp + 0x230], xmm7
14016131d	movaps	xmmword ptr [rsp + 0x220], xmm6
140161325	mov	rax, qword ptr [rsp + 0x2d8]
14016132d	mov	rsi, qword ptr [r8]
140161330	mov	rax, qword ptr [rax]
140161333	mov	qword ptr [rsp + 0x40], rax
140161338	cmp	byte ptr [rsi + 0xd], 1
14016133c	jne	0x1401615a1
140161342	mov	rbx, qword ptr [rsp + 0x2e8]
14016134a	mov	r15, qword ptr [rsp + 0x2e0]
140161352	mov	rax, qword ptr [rsp + 0x2d0]
14016135a	mov	rdi, qword ptr [rdx]
14016135d	mov	r14, qword ptr [r9]
140161360	mov	r11, qword ptr [r9 + 0x10]
140161364	mov	r10d, dword ptr [r9 + 0x18]
140161368	mov	r9d, dword ptr [r9 + 0x1c]
14016136c	mov	rdx, qword ptr [rax]
14016136f	mov	r8, qword ptr [rax + 0x10]
140161373	mov	ecx, dword ptr [rax + 0x18]
140161376	mov	dword ptr [rsp + 0x34], ecx
14016137a	mov	eax, dword ptr [rax + 0x1c]
14016137d	mov	rcx, qword ptr [r15]
140161380	mov	qword ptr [rsp + 0x48], rcx
140161385	mov	r13, qword ptr [r15 + 8]
140161389	mov	rcx, qword ptr [rbx]
14016138c	mov	qword ptr [rsp + 0x38], rcx
140161391	mov	rbp, qword ptr [rbx + 8]
140161395	movzx	ebx, byte ptr [rsi]
140161398	movzx	esi, byte ptr [rdi + 0x72]
14016139c	cmp	sil, 1
1401613a0	jne	0x14016159d
1401613a6	cmp	byte ptr [rdi + 0x76], 0
1401613aa	setne	dil
1401613ae	or	dil, bl
1401613b1	test	dil, 1
1401613b5	jne	0x1401615a1
1401613bb	mov	rcx, qword ptr [rsp + 0x2f0]
1401613c3	cmp	dword ptr [rcx], 0
1401613c6	je	0x140161402
1401613c8	mov	ecx, r9d
1401613cb	sub	ecx, dword ptr [r11]
1401613ce	sub	r9d, r10d
1401613d1	cmp	r9d, 0xc233b000
1401613d8	mov	r10d, 0xc233b000
1401613de	cmovae	r9d, r10d
1401613e2	cmp	ecx, r9d
1401613e5	jb	0x140161402
1401613e7	mov	ecx, eax
1401613e9	sub	ecx, dword ptr [r8]
1401613ec	sub	eax, dword ptr [rsp + 0x34]
1401613f0	cmp	eax, 0xc233b000
1401613f5	cmovb	r10d, eax
1401613f9	cmp	ecx, r10d
1401613fc	jae	0x1401614fe
140161402	mov	byte ptr [rsp + 0x34], sil
140161407	movzx	r8d, byte ptr [r14 + 0x38]
14016140c	movzx	r9d, byte ptr [r14 + 0x39]
140161411	lea	rdi, [rsp + 0xa0]
140161419	mov	rcx, rdi
14016141c	call	0x1458a3e40
140161421	movzx	r8d, byte ptr [r14 + 0x38]
140161426	movzx	edx, byte ptr [r14 + 0x39]
14016142b	lea	r9, [rsp + 0x138]
140161433	mov	qword ptr [rsp + 0x20], rdi
140161438	lea	rcx, [rsp + 0x54]
14016143d	call	0x1459a4710
140161442	mov	eax, dword ptr [rsp + 0x94]
140161449	or	eax, dword ptr [rsp + 0x90]
140161450	je	0x14016145d
140161452	mov	dword ptr [rsp + 0x98], 0
14016145d	mov	eax, dword ptr [r14 + 0x3b]
140161461	movzx	ecx, byte ptr [r14 + 0x3f]
140161466	shl	rcx, 0x20
14016146a	or	rcx, rax
14016146d	movzx	edx, byte ptr [r14 + 0x39]
140161472	movzx	r8d, byte ptr [r14 + 0x3a]
140161477	call	0x1459a2280
14016147c	mov	rbx, rax
14016147f	mov	r15d, ebx
140161482	shr	r15d, 0x10
140161486	mov	r12d, ebx
140161489	shr	r12d, 0x18
14016148d	mov	rsi, rax
140161490	shr	rsi, 0x20
140161494	movzx	r14d, word ptr [r14 + 0x39]
140161499	lea	rcx, [rsp + 0x188]
1401614a1	lea	rdx, [rsp + 0x54]
1401614a6	call	0x1401a5d80
1401614ab	mov	rdi, qword ptr [rsp + 0x2f0]
1401614b3	mov	dword ptr [rdi], 1
1401614b9	lea	rcx, [rdi + 4]
1401614bd	mov	r8d, 0x98
1401614c3	lea	rdx, [rsp + 0x188]
1401614cb	call	0x145bfa0e7
1401614d0	mov	word ptr [rdi + 0x9c], r14w
1401614d8	mov	byte ptr [rdi + 0x9e], bl
1401614de	mov	byte ptr [rdi + 0x9f], bh
1401614e4	mov	byte ptr [rdi + 0xa0], r15b
1401614eb	mov	byte ptr [rdi + 0xa1], r12b
1401614f2	mov	byte ptr [rdi + 0xa2], sil
1401614f9	movzx	esi, byte ptr [rsp + 0x34]
1401614fe	test	sil, sil
140161501	je	0x140161659
140161507	mov	r11, qword ptr [rsp + 0x48]
14016150c	mov	rdx, qword ptr [r11 + 0xf8]
140161513	mov	r8, qword ptr [r11 + 0x100]
14016151a	cmp	byte ptr [r11 + 0x108], 0
140161522	je	0x14016173d
140161528	shl	r8, 2
14016152c	xor	eax, eax
14016152e	xor	ecx, ecx
140161530	cmp	r8, rcx
140161533	je	0x1401617d2
140161539	mov	r10d, dword ptr [rdx + rcx]
14016153d	mov	r9, qword ptr [r13 + 0x1a8]
140161544	lea	r10, [r10 + r10*8]
140161548	add	rcx, 4
14016154c	cmp	qword ptr [r9 + r10*8 + 0x10], 0
140161552	je	0x140161530
140161554	lea	rcx, [r9 + r10*8]
140161558	mov	rax, qword ptr [r11 + 0x110]
14016155f	mov	rdx, qword ptr [r11 + 0x118]
140161566	mov	r8, qword ptr [rcx + 0x40]
14016156a	cmp	rax, r8
14016156d	jae	0x140161870
140161573	mov	r9, qword ptr [rcx + 0x38]
140161577	mov	rax, qword ptr [r9 + rax*8]
14016157b	test	rax, rax
14016157e	je	0x140161870
140161584	mov	r9, qword ptr [rcx + 0x18]
140161588	not	rax
14016158b	lea	rax, [rax + rax*2]
14016158f	shl	rax, 4
140161593	mov	rax, qword ptr [r9 + rax + 0x10]
140161598	jmp	0x140161872
14016159d	test	bl, bl
14016159f	je	0x1401615fb
1401615a1	mov	dword ptr [rsp + 0xa0], 0
1401615ac	mov	rcx, qword ptr [rsp + 0x2f0]
1401615b4	mov	esi, dword ptr [rcx]
1401615b6	lea	rdx, [rsp + 0xa0]
1401615be	mov	r8d, 0xa4
1401615c4	call	0x145bfa0e7
1401615c9	cmp	esi, 1
1401615cc	jne	0x140161ba6
1401615d2	mov	rax, qword ptr [rsp + 0x40]
1401615d7	movss	xmm1, dword ptr [rax]
1401615db	mov	dword ptr [rsp + 0x20], 0
1401615e3	lea	rcx, [rsp + 0xa0]
1401615eb	movss	xmm2, dword ptr [rip + 0x5c3bcad]
1401615f3	xor	r9d, r9d
1401615f6	jmp	0x140161ba1
1401615fb	mov	rcx, qword ptr [rsp + 0x38]
140161600	mov	rdi, qword ptr [rcx + 0xf8]
140161607	mov	rbx, qword ptr [rcx + 0x100]
14016160e	cmp	byte ptr [rcx + 0x108], 0
140161615	je	0x140161702
14016161b	shl	rbx, 2
14016161f	xor	r15d, r15d
140161622	nop	word ptr cs:[rax + rax]
140161630	cmp	rbx, r15
140161633	je	0x1401615a1
140161639	mov	ecx, dword ptr [rdi + r15]
14016163d	mov	r12, qword ptr [rbp + 0x1a8]
140161644	lea	rcx, [rcx + rcx*8]
140161648	add	r15, 4
14016164c	cmp	qword ptr [r12 + rcx*8 + 0x10], 0
140161652	je	0x140161630
140161654	jmp	0x1401613bb
140161659	mov	rax, qword ptr [rsp + 0x38]
14016165e	mov	rdx, qword ptr [rax + 0xf8]
140161665	mov	r8, qword ptr [rax + 0x100]
14016166c	cmp	byte ptr [rax + 0x108], 0
140161673	je	0x1401617d7
140161679	shl	r8, 2
14016167d	xor	eax, eax
14016167f	xor	ecx, ecx
140161681	nop	word ptr cs:[rax + rax]
140161690	cmp	r8, rcx
140161693	je	0x14016186b
140161699	mov	r10d, dword ptr [rdx + rcx]
14016169d	mov	r9, qword ptr [rbp + 0x1a8]
1401616a4	lea	r10, [r10 + r10*8]
1401616a8	add	rcx, 4
1401616ac	cmp	qword ptr [r9 + r10*8 + 0x10], 0
1401616b2	je	0x140161690
1401616b4	lea	rcx, [r9 + r10*8]
1401616b8	mov	rdx, qword ptr [rsp + 0x38]
1401616bd	mov	rax, qword ptr [rdx + 0x110]
1401616c4	mov	rdx, qword ptr [rdx + 0x118]
1401616cb	mov	r8, qword ptr [rcx + 0x40]
1401616cf	cmp	rax, r8
1401616d2	jae	0x1401618a5
1401616d8	mov	r9, qword ptr [rcx + 0x38]
1401616dc	mov	rax, qword ptr [r9 + rax*8]
1401616e0	test	rax, rax
1401616e3	je	0x1401618a5
1401616e9	mov	r9, qword ptr [rcx + 0x18]
1401616ed	not	rax
1401616f0	lea	rax, [rax + rax*2]
1401616f4	shl	rax, 4
1401616f8	mov	rax, qword ptr [r9 + rax + 0x10]
1401616fd	jmp	0x1401618a7
140161702	shl	rbx, 2
140161706	xor	r15d, r15d
140161709	nop	dword ptr [rax]
140161710	cmp	rbx, r15
140161713	je	0x1401615a1
140161719	mov	r12d, dword ptr [rdi + r15]
14016171d	mov	rcx, qword ptr [rbp + 0x108]
140161724	lea	r12, [r12 + r12*4]
140161728	shl	r12, 5
14016172c	add	r15, 4
140161730	cmp	qword ptr [rcx + r12 + 0x58], 0
140161736	je	0x140161710
140161738	jmp	0x1401613bb
14016173d	shl	r8, 2
140161741	xor	eax, eax
140161743	xor	r9d, r9d
140161746	nop	word ptr cs:[rax + rax]
140161750	cmp	r8, r9
140161753	je	0x1401617d2
140161755	mov	r10d, dword ptr [rdx + r9]
140161759	mov	rcx, qword ptr [r13 + 0x108]
140161760	lea	r10, [r10 + r10*4]
140161764	shl	r10, 5
140161768	add	r9, 4
14016176c	cmp	qword ptr [rcx + r10 + 0x58], 0
140161772	je	0x140161750
140161774	add	rcx, r10
140161777	mov	eax, dword ptr [rcx + 0x94]
14016177d	mov	r9, qword ptr [r13 + 0x1a8]
140161784	lea	r10, [rax + rax*8]
140161788	lea	rdx, [r9 + r10*8]
14016178c	mov	rax, qword ptr [r11 + 0x110]
140161793	mov	r8, qword ptr [r11 + 0x118]
14016179a	mov	r9, qword ptr [r9 + r10*8 + 0x40]
14016179f	cmp	rax, r9
1401617a2	jae	0x1401618d6
1401617a8	mov	r10, qword ptr [rdx + 0x38]
1401617ac	mov	rax, qword ptr [r10 + rax*8]
1401617b0	test	rax, rax
1401617b3	je	0x1401618d6
1401617b9	mov	r10, qword ptr [rdx + 0x18]
1401617bd	not	rax
1401617c0	lea	rax, [rax + rax*2]
1401617c4	shl	rax, 4
1401617c8	mov	rax, qword ptr [r10 + rax + 0x10]
1401617cd	jmp	0x1401618d8
1401617d2	jmp	0x140161959
1401617d7	shl	r8, 2
1401617db	xor	eax, eax
1401617dd	xor	r9d, r9d
1401617e0	cmp	r8, r9
1401617e3	je	0x14016186b
1401617e9	mov	r10d, dword ptr [rdx + r9]
1401617ed	mov	rcx, qword ptr [rbp + 0x108]
1401617f4	lea	r10, [r10 + r10*4]
1401617f8	shl	r10, 5
1401617fc	add	r9, 4
140161800	cmp	qword ptr [rcx + r10 + 0x58], 0
140161806	je	0x1401617e0
140161808	add	rcx, r10
14016180b	mov	eax, dword ptr [rcx + 0x94]
140161811	mov	r9, qword ptr [rbp + 0x1a8]
140161818	lea	r10, [rax + rax*8]
14016181c	lea	rdx, [r9 + r10*8]
140161820	mov	r8, qword ptr [rsp + 0x38]
140161825	mov	rax, qword ptr [r8 + 0x110]
14016182c	mov	r8, qword ptr [r8 + 0x118]
140161833	mov	r9, qword ptr [r9 + r10*8 + 0x40]
140161838	cmp	rax, r9
14016183b	jae	0x140161900
140161841	mov	r10, qword ptr [rdx + 0x38]
140161845	mov	rax, qword ptr [r10 + rax*8]
140161849	test	rax, rax
14016184c	je	0x140161900
140161852	mov	r10, qword ptr [rdx + 0x18]
140161856	not	rax
140161859	lea	rax, [rax + rax*2]
14016185d	shl	rax, 4
140161861	mov	rax, qword ptr [r10 + rax + 0x10]
140161866	jmp	0x140161902
14016186b	jmp	0x140161a80
140161870	xor	eax, eax
140161872	cmp	rdx, r8
140161875	jae	0x140161935
14016187b	mov	r8, qword ptr [rcx + 0x38]
14016187f	mov	rdx, qword ptr [r8 + rdx*8]
140161883	test	rdx, rdx
140161886	je	0x140161935
14016188c	mov	rcx, qword ptr [rcx + 0x18]
140161890	not	rdx
140161893	lea	rdx, [rdx + rdx*2]
140161897	shl	rdx, 4
14016189b	mov	rcx, qword ptr [rcx + rdx + 0x10]
1401618a0	jmp	0x140161959
1401618a5	xor	eax, eax
1401618a7	cmp	rdx, r8
1401618aa	jae	0x140161939
1401618b0	mov	r8, qword ptr [rcx + 0x38]
1401618b4	mov	rdx, qword ptr [r8 + rdx*8]
1401618b8	test	rdx, rdx
1401618bb	je	0x140161939
1401618bd	mov	rcx, qword ptr [rcx + 0x18]
1401618c1	not	rdx
1401618c4	lea	rdx, [rdx + rdx*2]
1401618c8	shl	rdx, 4
1401618cc	mov	rcx, qword ptr [rcx + rdx + 0x10]
1401618d1	jmp	0x140161a80
1401618d6	xor	eax, eax
1401618d8	cmp	r8, r9
1401618db	jae	0x140161940
1401618dd	mov	r9, qword ptr [rdx + 0x38]
1401618e1	mov	r8, qword ptr [r9 + r8*8]
1401618e5	test	r8, r8
1401618e8	je	0x140161940
1401618ea	mov	rdx, qword ptr [rdx + 0x18]
1401618ee	not	r8
1401618f1	lea	r8, [r8 + r8*2]
1401618f5	shl	r8, 4
1401618f9	mov	rdx, qword ptr [rdx + r8 + 0x10]
1401618fe	jmp	0x140161942
140161900	xor	eax, eax
140161902	cmp	r8, r9
140161905	jae	0x140161a67
14016190b	mov	r9, qword ptr [rdx + 0x38]
14016190f	mov	r8, qword ptr [r9 + r8*8]
140161913	test	r8, r8
140161916	je	0x140161a67
14016191c	mov	rdx, qword ptr [rdx + 0x18]
140161920	not	r8
140161923	lea	r8, [r8 + r8*2]
140161927	shl	r8, 4
14016192b	mov	rdx, qword ptr [rdx + r8 + 0x10]
140161930	jmp	0x140161a69
140161935	xor	ecx, ecx
140161937	jmp	0x140161959
140161939	xor	ecx, ecx
14016193b	jmp	0x140161a80
140161940	xor	edx, edx
140161942	mov	rcx, qword ptr [rcx + 0x50]
140161946	mov	ecx, dword ptr [rcx + 8]
140161949	not	ecx
14016194b	imul	r8, rcx, 0x68
14016194f	add	rax, r8
140161952	shl	rcx, 5
140161956	add	rcx, rdx
140161959	test	rax, rax
14016195c	je	0x140161a2f
140161962	movaps	xmm1, xmmword ptr [rcx]
140161965	movaps	xmm0, xmm1
140161968	shufps	xmm0, xmm1, 0xeb
14016196c	mulps	xmm0, xmm1
14016196f	movshdup	xmm2, xmm0
140161973	subss	xmm0, xmm2
140161977	movaps	xmm2, xmmword ptr [rip + 0x5c6b722]
14016197e	movaps	xmm3, xmm0
140161981	andps	xmm3, xmm2
140161984	orps	xmm3, xmmword ptr [rip + 0x5c3b905]
14016198b	cmpunordss	xmm0, xmm0
140161990	movss	xmm4, dword ptr [rip + 0x5c71438]
140161998	andps	xmm4, xmm0
14016199b	andnps	xmm0, xmm3
14016199e	orps	xmm4, xmm0
1401619a1	movaps	xmm0, xmm1
1401619a4	mulps	xmm0, xmm1
1401619a7	movshdup	xmm3, xmm0
1401619ab	addss	xmm3, xmm0
1401619af	sqrtss	xmm6, xmm3
1401619b3	mulss	xmm6, xmm4
1401619b7	shufps	xmm1, xmm1, 0xff
1401619bb	movaps	xmm3, xmm0
1401619be	shufps	xmm3, xmm0, 0xff
1401619c2	movhlps	xmm0, xmm0
1401619c5	addss	xmm0, xmm3
1401619c9	sqrtss	xmm7, xmm0
1401619cd	movss	xmm0, dword ptr [rcx + 8]
1401619d2	xorps	xmm0, xmm2
1401619d5	mulss	xmm6, dword ptr [rax + 0x30]
1401619da	mulss	xmm7, dword ptr [rax + 0x34]
1401619df	call	0x145bfa123
1401619e4	movaps	xmm0, xmm6
1401619e7	call	0x145bfa10b
1401619ec	movaps	xmm6, xmm0
1401619ef	movaps	xmm0, xmm7
1401619f2	call	0x145bfa10b
1401619f7	cvttss2si	r9, xmm6
1401619fc	xor	ecx, ecx
1401619fe	xorps	xmm1, xmm1
140161a01	ucomiss	xmm6, xmm1
140161a04	cmovb	r9d, ecx
140161a08	movss	xmm2, dword ptr [rip + 0x5c71430]
140161a10	ucomiss	xmm6, xmm2
140161a13	mov	edx, 0xffffffff
140161a18	cmova	r9d, edx
140161a1c	cvttss2si	rax, xmm0
140161a21	ucomiss	xmm0, xmm1
140161a24	cmovb	eax, ecx
140161a27	ucomiss	xmm0, xmm2
140161a2a	cmova	eax, edx
140161a2d	jmp	0x140161a34
140161a2f	xor	r9d, r9d
140161a32	xor	eax, eax
140161a34	cmp	r9d, eax
140161a37	mov	ecx, eax
140161a39	cmovb	ecx, r9d
140161a3d	test	ecx, ecx
140161a3f	je	0x140161ba6
140161a45	mov	rcx, qword ptr [rsp + 0x40]
140161a4a	movss	xmm1, dword ptr [rcx]
140161a4e	mov	dword ptr [rsp + 0x20], eax
140161a52	movss	xmm2, dword ptr [rip + 0x5c80a4a]
140161a5a	mov	rcx, qword ptr [rsp + 0x2f0]
140161a62	jmp	0x140161ba1
140161a67	xor	edx, edx
140161a69	mov	rcx, qword ptr [rcx + 0x50]
140161a6d	mov	ecx, dword ptr [rcx + 8]
140161a70	not	ecx
140161a72	imul	r8, rcx, 0x68
140161a76	add	rax, r8
140161a79	shl	rcx, 5
140161a7d	add	rcx, rdx
140161a80	test	rax, rax
140161a83	je	0x140161b70
140161a89	movss	xmm6, dword ptr [rax + 0x30]
140161a8e	movss	xmm9, dword ptr [rax + 0x34]
140161a94	movaps	xmm1, xmmword ptr [rcx]
140161a97	movaps	xmm0, xmm1
140161a9a	shufps	xmm0, xmm1, 0xeb
140161a9e	mulps	xmm0, xmm1
140161aa1	movshdup	xmm2, xmm0
140161aa5	subss	xmm0, xmm2
140161aa9	movaps	xmm2, xmmword ptr [rip + 0x5c6b5f0]
140161ab0	movaps	xmm3, xmm0
140161ab3	andps	xmm3, xmm2
140161ab6	orps	xmm3, xmmword ptr [rip + 0x5c3b7d3]
140161abd	cmpunordss	xmm0, xmm0
140161ac2	movss	xmm4, dword ptr [rip + 0x5c71306]
140161aca	andps	xmm4, xmm0
140161acd	andnps	xmm0, xmm3
140161ad0	orps	xmm4, xmm0
140161ad3	movaps	xmm0, xmm1
140161ad6	mulps	xmm0, xmm1
140161ad9	movshdup	xmm3, xmm0
140161add	addss	xmm3, xmm0
140161ae1	sqrtss	xmm7, xmm3
140161ae5	mulss	xmm7, xmm4
140161ae9	shufps	xmm1, xmm1, 0xff
140161aed	movaps	xmm3, xmm0
140161af0	shufps	xmm3, xmm0, 0xff
140161af4	movhlps	xmm0, xmm0
140161af7	addss	xmm0, xmm3
140161afb	sqrtss	xmm8, xmm0
140161b00	movss	xmm0, dword ptr [rcx + 8]
140161b05	xorps	xmm0, xmm2
140161b08	call	0x145bfa123
140161b0d	mulss	xmm7, xmm6
140161b11	mulss	xmm8, xmm9
140161b16	movaps	xmm0, xmm7
140161b19	call	0x145bfa10b
140161b1e	movaps	xmm7, xmm0
140161b21	movaps	xmm0, xmm8
140161b25	call	0x145bfa10b
140161b2a	cvttss2si	r9, xmm7
140161b2f	xor	ecx, ecx
140161b31	xorps	xmm1, xmm1
140161b34	ucomiss	xmm7, xmm1
140161b37	cmovb	r9d, ecx
140161b3b	movss	xmm2, dword ptr [rip + 0x5c712fd]
140161b43	ucomiss	xmm7, xmm2
140161b46	mov	edx, 0xffffffff
140161b4b	cmova	r9d, edx
140161b4f	cvttss2si	rax, xmm0
140161b54	ucomiss	xmm0, xmm1
140161b57	cmovb	eax, ecx
140161b5a	ucomiss	xmm0, xmm2
140161b5d	cmova	eax, edx
140161b60	maxss	xmm9, dword ptr [rip + 0x5c3b737]
140161b69	divss	xmm6, xmm9
140161b6e	jmp	0x140161b7d
140161b70	xor	eax, eax
140161b72	movss	xmm6, dword ptr [rip + 0x5c3b726]
140161b7a	xor	r9d, r9d
140161b7d	cmp	r9d, eax
140161b80	mov	ecx, eax
140161b82	cmovb	ecx, r9d
140161b86	test	ecx, ecx
140161b88	je	0x140161ba6
140161b8a	mov	dword ptr [rsp + 0x20], eax
140161b8e	movss	xmm1, dword ptr [rip + 0x5c712a2]
140161b96	mov	rcx, qword ptr [rsp + 0x2f0]
140161b9e	movaps	xmm2, xmm6
140161ba1	call	0x14058d2a0
140161ba6	movaps	xmm6, xmmword ptr [rsp + 0x220]
140161bae	movaps	xmm7, xmmword ptr [rsp + 0x230]
140161bb6	movaps	xmm8, xmmword ptr [rsp + 0x240]
140161bbf	movaps	xmm9, xmmword ptr [rsp + 0x250]
140161bc8	add	rsp, 0x268
140161bcf	pop	rbx
140161bd0	pop	rbp
140161bd1	pop	rdi
140161bd2	pop	rsi
140161bd3	pop	r12
140161bd5	pop	r13
140161bd7	pop	r14
140161bd9	pop	r15
140161bdb	ret
