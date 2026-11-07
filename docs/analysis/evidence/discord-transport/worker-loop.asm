140067fc0	push	rbp
140067fc1	push	r15
140067fc3	push	r14
140067fc5	push	r13
140067fc7	push	r12
140067fc9	push	rsi
140067fca	push	rdi
140067fcb	push	rbx
140067fcc	sub	rsp, 0x2d8
140067fd3	lea	rbp, [rsp + 0x80]
140067fdb	movaps	xmmword ptr [rbp + 0x240], xmm6
140067fe2	mov	qword ptr [rbp + 0x238], 0xfffffffffffffffe
140067fed	mov	qword ptr [rbp + 0xb0], rcx
140067ff4	mov	qword ptr [rbp + 0xb8], rdx
140067ffb	mov	byte ptr [rbp + 0x150], 0xff
140068002	mov	byte ptr [rbp + 0xc0], 0xff
140068009	mov	qword ptr [rbp + 0x228], 0
140068014	call	0x145ba4280
140068019	mov	qword ptr [rbp + 0x88], rax
140068020	mov	dword ptr [rbp + 0x134], edx
140068026	mov	dword ptr [rbp + 0x130], 0xffffffff
140068030	xorps	xmm6, xmm6
140068033	lea	r12, [rbp + 0x190]
14006803a	lea	r13, [rbp + 0x90]
140068041	mov	r14d, 0x278
140068047	xor	edi, edi
140068049	mov	qword ptr [rbp + 0x30], 0
140068051	jmp	0x140068069
140068053	nop	word ptr cs:[rax + rax]
140068060	mov	byte ptr [rbp + 0xc0], 0xff
140068067	xor	edi, edi
140068069	mov	qword ptr [rbp + 0x228], rdi
140068070	call	0x145ba4280
140068075	nop
140068076	mov	qword ptr [rbp + 0x1e0], rax
14006807d	mov	dword ptr [rbp + 0x1e8], edx
140068083	mov	qword ptr [rbp + 0x228], rdi
14006808a	mov	edx, 1
14006808f	lea	rcx, [rbp + 0x1e0]
140068096	xor	r8d, r8d
140068099	call	0x145ba4020
14006809e	nop
14006809f	mov	r9d, edx
1400680a2	cmp	edx, -1
1400680a5	je	0x1400680e0
1400680a7	mov	rcx, qword ptr [rbp + 0xb0]
1400680ae	mov	rdx, qword ptr [rbp + 0xb8]
1400680b5	test	rcx, rcx
1400680b8	je	0x140068120
1400680ba	cmp	ecx, 1
1400680bd	jne	0x140068140
1400680c3	mov	qword ptr [rbp + 0x228], rdi
1400680ca	lea	rcx, [rbp + 0x40]
1400680ce	mov	r8, rax
1400680d1	call	0x1401b8210
1400680d6	nop
1400680d7	jmp	0x140068154
1400680d9	nop	dword ptr [rax]
1400680e0	mov	rax, qword ptr [rbp + 0xb0]
1400680e7	mov	rdx, qword ptr [rbp + 0xb8]
1400680ee	cmp	rax, 2
1400680f2	je	0x14006830f
1400680f8	cmp	eax, 1
1400680fb	jne	0x140068327
140068101	mov	qword ptr [rbp + 0x228], rdi
140068108	mov	rcx, r12
14006810b	mov	r9d, 0xffffffff
140068111	call	0x1401b8210
140068116	nop
140068117	jmp	0x14006833d
14006811c	nop	dword ptr [rax]
140068120	mov	qword ptr [rbp + 0x228], rdi
140068127	lea	rcx, [rbp + 0x40]
14006812b	mov	r8, rax
14006812e	call	0x1400561c0
140068133	nop
140068134	jmp	0x140068154
140068136	nop	word ptr cs:[rax + rax]
140068140	mov	qword ptr [rbp + 0x228], rdi
140068147	lea	rcx, [rbp + 0x40]
14006814b	mov	r8, rax
14006814e	call	0x1401b8f30
140068153	nop
140068154	movzx	eax, byte ptr [rbp + 0x40]
140068158	cmp	al, 0xfe
14006815a	mov	qword ptr [rbp + 0x218], rdi
140068161	jne	0x140068390
140068167	cmp	byte ptr [rbp + 0x41], 0
14006816b	jne	0x140069e15
140068171	nop	word ptr cs:[rax + rax]
140068180	mov	rax, qword ptr [rbp + 0xb0]
140068187	mov	rsi, qword ptr [rbp + 0xb8]
14006818e	cmp	rax, 2
140068192	je	0x140068414
140068198	cmp	eax, 1
14006819b	jne	0x140068210
14006819d	movaps	xmmword ptr [rbp + 0x1a0], xmm6
1400681a4	movaps	xmmword ptr [rbp + 0x190], xmm6
1400681ab	mov	qword ptr [rbp + 0x1b0], 0
1400681b6	mov	qword ptr [rbp + 0x228], rdi
1400681bd	mov	rcx, rsi
1400681c0	mov	rdx, r12
1400681c3	call	0x1401b7920
1400681c8	nop
1400681c9	test	al, al
1400681cb	je	0x1400682e0
1400681d1	mov	rdx, qword ptr [rbp + 0x1a0]
1400681d8	mov	r8, qword ptr [rbp + 0x1a8]
1400681df	mov	qword ptr [rbp + 0x228], rdi
1400681e6	lea	rcx, [rbp + 0x1e0]
1400681ed	call	0x1401b8050
1400681f2	nop
1400681f3	cmp	byte ptr [rbp + 0x1e0], 0xfe
1400681fa	jne	0x1400682ee
140068200	mov	word ptr [rbp + 0x90], 0x1fe
140068209	jmp	0x140068427
14006820e	nop
140068210	movaps	xmmword ptr [rbp + 0x1a0], xmm6
140068217	movaps	xmmword ptr [rbp + 0x190], xmm6
14006821e	mov	qword ptr [rbp + 0x1b0], 0
140068229	mov	qword ptr [rbp + 0x228], rdi
140068230	mov	rcx, rsi
140068233	mov	rdx, r12
140068236	call	0x140055e60
14006823b	nop
14006823c	test	al, al
14006823e	je	0x1400682e0
140068244	mov	rax, qword ptr [rbp + 0x190]
14006824b	test	rax, rax
14006824e	je	0x1400682ce
140068250	mov	rcx, qword ptr [rbp + 0x198]
140068257	movups	xmm0, xmmword ptr [rax]
14006825a	movups	xmm1, xmmword ptr [rax + 0x10]
14006825e	movaps	xmmword ptr [rbp + 0x1f0], xmm1
140068265	movaps	xmmword ptr [rbp + 0x1e0], xmm0
14006826c	mov	qword ptr [rax + 0x20], rcx
140068270	movaps	xmm0, xmmword ptr [rbp + 0x1e0]
140068277	movaps	xmm1, xmmword ptr [rbp + 0x1f0]
14006827e	movaps	xmmword ptr [rbp + 0x100], xmm1
140068285	movaps	xmmword ptr [rbp + 0xf0], xmm0
14006828c	add	rsi, 0x100
140068293	mov	rcx, rsi
140068296	call	0x140050770
14006829b	nop
14006829c	movzx	eax, byte ptr [rbp + 0xf0]
1400682a3	lea	rcx, [rbp + 0xf1]
1400682aa	movups	xmm0, xmmword ptr [rcx]
1400682ad	movups	xmm1, xmmword ptr [rcx + 0xf]
1400682b1	movaps	xmmword ptr [rbp + 0x110], xmm0
1400682b8	movups	xmmword ptr [rbp + 0x11f], xmm1
1400682bf	cmp	al, 0xfe
1400682c1	mov	rdi, qword ptr [rbp + 0x218]
1400682c8	jne	0x1400683b0
1400682ce	mov	byte ptr [rbp + 0x91], 1
1400682d5	mov	al, 0xfe
1400682d7	jmp	0x1400683cc
1400682dc	nop	dword ptr [rax]
1400682e0	mov	word ptr [rbp + 0x90], 0xfe
1400682e9	jmp	0x140068427
1400682ee	movups	xmm0, xmmword ptr [rbp + 0x1e0]
1400682f5	movups	xmm1, xmmword ptr [rbp + 0x1f0]
1400682fc	movaps	xmmword ptr [rbp + 0xa0], xmm1
140068303	movaps	xmmword ptr [rbp + 0x90], xmm0
14006830a	jmp	0x140068427
14006830f	mov	qword ptr [rbp + 0x228], rdi
140068316	mov	rcx, r12
140068319	mov	r9d, 0xffffffff
14006831f	call	0x1401b8f30
140068324	nop
140068325	jmp	0x14006833d
140068327	mov	qword ptr [rbp + 0x228], rdi
14006832e	mov	rcx, r12
140068331	mov	r9d, 0xffffffff
140068337	call	0x1400561c0
14006833c	nop
14006833d	movzx	eax, byte ptr [rbp + 0x190]
140068344	cmp	al, 0xfe
140068346	jne	0x140068360
140068348	mov	byte ptr [rbp + 0x41], 1
14006834c	mov	byte ptr [rbp + 0x40], al
14006834f	cmp	al, 0xfe
140068351	mov	qword ptr [rbp + 0x218], rdi
140068358	je	0x140068167
14006835e	jmp	0x140068390
140068360	lea	rcx, [rbp + 0x1a0]
140068367	movups	xmm0, xmmword ptr [rcx - 0xf]
14006836b	movups	xmm1, xmmword ptr [rcx]
14006836e	lea	rcx, [rbp + 0x41]
140068372	movups	xmmword ptr [rcx + 0xf], xmm1
140068376	movups	xmmword ptr [rcx], xmm0
140068379	mov	byte ptr [rbp + 0x40], al
14006837c	cmp	al, 0xfe
14006837e	mov	qword ptr [rbp + 0x218], rdi
140068385	je	0x140068167
14006838b	nop	dword ptr [rax + rax]
140068390	cmp	byte ptr [rbp + 0x150], 0xff
140068397	lea	rax, [rbp + 0x40]
14006839b	je	0x1400683e0
14006839d	lea	rcx, [rbp + 0x150]
1400683a4	call	0x14005e410
1400683a9	nop
1400683aa	lea	rax, [rbp + 0x40]
1400683ae	jmp	0x1400683e0
1400683b0	movups	xmm0, xmmword ptr [rbp + 0x11f]
1400683b7	lea	rcx, [rbp + 0x91]
1400683be	movups	xmmword ptr [rcx + 0xf], xmm0
1400683c2	movaps	xmm0, xmmword ptr [rbp + 0x110]
1400683c9	movups	xmmword ptr [rcx], xmm0
1400683cc	mov	byte ptr [rbp + 0x90], al
1400683d2	jmp	0x140068427
1400683d4	nop	word ptr cs:[rax + rax]
1400683e0	movups	xmm0, xmmword ptr [rax]
1400683e3	movups	xmm1, xmmword ptr [rax + 0x10]
1400683e7	movaps	xmmword ptr [rbp + 0x160], xmm1
1400683ee	movaps	xmmword ptr [rbp + 0x150], xmm0
1400683f5	mov	rdi, qword ptr [rbp + 0x218]
1400683fc	mov	rax, qword ptr [rbp + 0xb0]
140068403	mov	rsi, qword ptr [rbp + 0xb8]
14006840a	cmp	rax, 2
14006840e	jne	0x140068198
140068414	mov	qword ptr [rbp + 0x228], rdi
14006841b	mov	rcx, r13
14006841e	mov	rdx, rsi
140068421	call	0x1401ba060
140068426	nop
140068427	cmp	byte ptr [rbp + 0x90], 0xfe
14006842e	movzx	ecx, byte ptr [rbp + 0x150]
140068435	jne	0x140068480
140068437	cmp	cl, 0xff
14006843a	jne	0x140068677
140068440	test	rdi, rdi
140068443	je	0x140068461
140068445	mov	rcx, qword ptr [rdi]
140068448	call	qword ptr [rip + 0x5d32472]
14006844e	mov	edx, 8
140068453	mov	r8d, 8
140068459	mov	rcx, rdi
14006845c	call	0x1400021d0
140068461	cmp	byte ptr [rbp + 0xc0], 0xff
140068468	je	0x140068060
14006846e	lea	rcx, [rbp + 0xc0]
140068475	call	0x14005e410
14006847a	nop
14006847b	jmp	0x140068060
140068480	mov	rax, r13
140068483	cmp	cl, 0xff
140068486	je	0x1400683e0
14006848c	movzx	ecx, cl
14006848f	mov	rax, r13
140068492	cmp	ecx, 3
140068495	jb	0x1400683e0
14006849b	je	0x1400684fd
14006849d	cmp	ecx, 4
1400684a0	jne	0x140068522
1400684a6	mov	rcx, qword ptr [rbp + 0x160]
1400684ad	mov	rax, qword ptr [rbp + 0x168]
1400684b4	mov	qword ptr [rbp + 0x1d8], rax
1400684bb	mov	qword ptr [rbp + 0xe8], rcx
1400684c2	mov	qword ptr [rbp + 0x210], 0
1400684cd	nop	dword ptr [rax]
1400684d0	mov	rax, qword ptr [rbp + 0x210]
1400684d7	cmp	qword ptr [rbp + 0x1d8], rax
1400684de	je	0x140068646
1400684e4	inc	rax
1400684e7	mov	qword ptr [rbp + 0x210], rax
1400684ee	lea	rsi, [rcx + 0x20]
1400684f2	call	0x14008bc40
1400684f7	nop
1400684f8	mov	rcx, rsi
1400684fb	jmp	0x1400684d0
1400684fd	mov	rdx, qword ptr [rbp + 0x158]
140068504	mov	rax, r13
140068507	test	rdx, rdx
14006850a	je	0x1400683e0
140068510	mov	rcx, qword ptr [rbp + 0x160]
140068517	mov	r8d, 1
14006851d	jmp	0x14006866a
140068522	mov	rbx, qword ptr [rbp + 0x158]
140068529	test	rbx, rbx
14006852c	lea	rdi, [rbp + 0x1a0]
140068533	je	0x1400691ec
140068539	mov	rax, qword ptr [rbp + 0x160]
140068540	mov	rcx, qword ptr [rbp + 0x168]
140068547	mov	qword ptr [rbp + 0x198], 0
140068552	mov	qword ptr [rbp + 0x1a0], rbx
140068559	mov	qword ptr [rbp + 0x1a8], rax
140068560	mov	qword ptr [rbp + 0x1b8], 0
14006856b	mov	qword ptr [rbp + 0x1c0], rbx
140068572	mov	qword ptr [rbp + 0x1c8], rax
140068579	mov	qword ptr [rbp + 0x1b0], 1
140068584	mov	qword ptr [rbp + 0x1d0], rcx
14006858b	test	rcx, rcx
14006858e	je	0x1400686c0
140068594	dec	rcx
140068597	mov	qword ptr [rbp + 0x1d0], rcx
14006859e	test	rax, rax
1400685a1	je	0x14006861e
1400685a3	mov	rcx, rax
1400685a6	and	rcx, 7
1400685aa	je	0x14006888e
1400685b0	xor	edx, edx
1400685b2	nop	word ptr cs:[rax + rax]
1400685c0	mov	rbx, qword ptr [rbx + 0x278]
1400685c7	inc	rdx
1400685ca	cmp	rcx, rdx
1400685cd	jne	0x1400685c0
1400685cf	mov	rcx, rax
1400685d2	sub	rcx, rdx
1400685d5	cmp	rax, 8
1400685d9	jb	0x14006861e
1400685db	nop	dword ptr [rax + rax]
1400685e0	mov	rax, qword ptr [rbx + 0x278]
1400685e7	mov	rax, qword ptr [rax + 0x278]
1400685ee	mov	rax, qword ptr [rax + 0x278]
1400685f5	mov	rax, qword ptr [rax + 0x278]
1400685fc	mov	rax, qword ptr [rax + 0x278]
140068603	mov	rax, qword ptr [rax + 0x278]
14006860a	mov	rax, qword ptr [rax + 0x278]
140068611	mov	rbx, qword ptr [rax + 0x278]
140068618	add	rcx, -8
14006861c	jne	0x1400685e0
14006861e	mov	qword ptr [rbp + 0x190], 1
140068629	cmp	word ptr [rbx + 0x272], 0
140068631	je	0x1400687a4
140068637	xor	r15d, r15d
14006863a	mov	rsi, rbx
14006863d	lea	rcx, [r15 + 1]
140068641	jmp	0x140068dde
140068646	mov	rdx, qword ptr [rbp + 0x158]
14006864d	mov	rax, r13
140068650	test	rdx, rdx
140068653	je	0x1400683e0
140068659	mov	rcx, qword ptr [rbp + 0x160]
140068660	shl	rdx, 5
140068664	mov	r8d, 8
14006866a	call	0x1400021d0
14006866f	mov	rax, r13
140068672	jmp	0x1400683e0
140068677	lea	rax, [rbp + 0x150]
14006867e	mov	qword ptr [rbp - 0x50], rax
140068682	test	rdi, rdi
140068685	je	0x140068862
14006868b	cmp	byte ptr [rbp + 0xc0], 0xff
140068692	je	0x14006938d
140068698	mov	qword ptr [rbp + 0x228], rdi
14006869f	lea	rcx, [rbp + 0xc0]
1400686a6	lea	rdx, [rbp + 0x150]
1400686ad	call	0x14007de60
1400686b2	nop
1400686b3	test	al, al
1400686b5	jne	0x140068069
1400686bb	jmp	0x14006938d
1400686c0	mov	qword ptr [rbp + 0x190], 0
1400686cb	test	rax, rax
1400686ce	je	0x14006873e
1400686d0	mov	rcx, rax
1400686d3	and	rcx, 7
1400686d7	je	0x140068d35
1400686dd	xor	edx, edx
1400686df	nop
1400686e0	mov	rbx, qword ptr [rbx + 0x278]
1400686e7	inc	rdx
1400686ea	cmp	rcx, rdx
1400686ed	jne	0x1400686e0
1400686ef	mov	rcx, rax
1400686f2	sub	rcx, rdx
1400686f5	cmp	rax, 8
1400686f9	jb	0x14006873e
1400686fb	nop	dword ptr [rax + rax]
140068700	mov	rax, qword ptr [rbx + 0x278]
140068707	mov	rax, qword ptr [rax + 0x278]
14006870e	mov	rax, qword ptr [rax + 0x278]
140068715	mov	rax, qword ptr [rax + 0x278]
14006871c	mov	rax, qword ptr [rax + 0x278]
140068723	mov	rax, qword ptr [rax + 0x278]
14006872a	mov	rax, qword ptr [rax + 0x278]
140068731	mov	rbx, qword ptr [rax + 0x278]
140068738	add	rcx, -8
14006873c	jne	0x140068700
14006873e	mov	rax, qword ptr [rbx + 0x160]
140068745	mov	edx, 0x278
14006874a	test	rax, rax
14006874d	je	0x140068796
14006874f	xor	esi, esi
140068751	nop	word ptr cs:[rax + rax]
140068760	mov	rcx, rbx
140068763	mov	rbx, rax
140068766	sub	rsi, 1
14006876a	mov	edx, 0x2d8
14006876f	cmovb	rdx, r14
140068773	mov	r8d, 8
140068779	call	0x1400021d0
14006877e	mov	rax, qword ptr [rbx + 0x160]
140068785	test	rax, rax
140068788	jne	0x140068760
14006878a	test	rsi, rsi
14006878d	mov	edx, 0x2d8
140068792	cmove	rdx, r14
140068796	mov	r8d, 8
14006879c	mov	rcx, rbx
14006879f	jmp	0x1400691e7
1400687a4	xor	r13d, r13d
1400687a7	nop	word ptr [rax + rax]
1400687b0	mov	rdi, r13
1400687b3	mov	rsi, qword ptr [rbx + 0x160]
1400687ba	test	rsi, rsi
1400687bd	je	0x140069f32
1400687c3	movzx	r15d, word ptr [rbx + 0x270]
1400687cb	mov	r13, rdi
1400687ce	sub	r13, 1
1400687d2	mov	edx, 0x2d8
1400687d7	cmovb	rdx, r14
1400687db	mov	r8d, 8
1400687e1	mov	rcx, rbx
1400687e4	call	0x1400021d0
1400687e9	mov	rbx, rsi
1400687ec	cmp	r15w, word ptr [rsi + 0x272]
1400687f4	jae	0x1400687b0
1400687f6	test	r13, r13
1400687f9	je	0x140068d47
1400687ff	mov	rcx, r13
140068802	neg	rcx
140068805	mov	rdx, r13
140068808	not	rdx
14006880b	lea	rax, [rsi + r15*8]
14006880f	add	rax, 0x280
140068815	test	cl, 7
140068818	je	0x140068d5d
14006881e	mov	cl, 1
140068820	sub	cl, dil
140068823	movzx	r8d, cl
140068827	and	r8d, 7
14006882b	neg	r8
14006882e	xor	ecx, ecx
140068830	mov	rbx, qword ptr [rax]
140068833	lea	rax, [rbx + 0x278]
14006883a	dec	rcx
14006883d	cmp	r8, rcx
140068840	jne	0x140068830
140068842	sub	rcx, r13
140068845	lea	rdi, [rbp + 0x1a0]
14006884c	cmp	rdx, 7
140068850	lea	r13, [rbp + 0x90]
140068857	jb	0x140068d71
14006885d	jmp	0x140068d80
140068862	mov	qword ptr [rbp + 0x228], 0
14006886d	call	0x145ba4280
140068872	nop
140068873	mov	rcx, qword ptr [rbp + 0x88]
14006887a	cmp	rax, rcx
14006887d	jne	0x1400688a0
14006887f	cmp	edx, dword ptr [rbp + 0x134]
140068885	jae	0x1400688ac
140068887	xor	edi, edi
140068889	jmp	0x140068069
14006888e	mov	rcx, rax
140068891	cmp	rax, 8
140068895	jae	0x1400685e0
14006889b	jmp	0x14006861e
1400688a0	cmp	rax, rcx
1400688a3	jae	0x1400688ac
1400688a5	xor	edi, edi
1400688a7	jmp	0x140068069
1400688ac	mov	qword ptr [rbp + 0x228], 0
1400688b7	mov	rcx, r12
1400688ba	xor	edx, edx
1400688bc	mov	r8d, 0xa
1400688c2	call	0x1400a91d0
1400688c7	nop
1400688c8	mov	rax, qword ptr [rbp + 0x190]
1400688cf	mov	rcx, qword ptr [rbp + 0x198]
1400688d6	mov	r15, qword ptr [rbp + 0x1a0]
1400688dd	shl	r15, 5
1400688e1	lea	rdx, [rcx + r15]
1400688e5	mov	qword ptr [rbp - 0x10], rcx
1400688e9	mov	qword ptr [rbp - 0x38], rax
1400688ed	mov	qword ptr [rbp], rax
1400688f1	mov	qword ptr [rbp + 0x28], rdx
1400688f5	mov	qword ptr [rbp + 8], rdx
1400688f9	add	r15, -0x20
1400688fd	lea	r13, [rcx + 0x28]
140068901	mov	qword ptr [rbp - 0x30], rcx
140068905	mov	rax, rcx
140068908	lea	rdi, [rbp + 0x1a0]
14006890f	jmp	0x14006892b
140068911	nop	word ptr cs:[rax + rax]
140068920	add	r15, -0x20
140068924	add	r13, 0x20
140068928	mov	rax, rsi
14006892b	cmp	rax, qword ptr [rbp + 0x28]
14006892f	je	0x1400690e8
140068935	lea	rsi, [rax + 0x20]
140068939	mov	qword ptr [rbp - 8], rsi
14006893d	mov	rcx, qword ptr [rax]
140068940	cmp	rcx, -1
140068944	je	0x1400690ef
14006894a	mov	qword ptr [rbp + 0x1d8], rcx
140068951	mov	rdx, qword ptr [rax + 8]
140068955	mov	rbx, qword ptr [rax + 0x10]
140068959	mov	dword ptr [rbp + 0x190], 0
140068963	mov	qword ptr [rbp + 0x198], 0
14006896e	mov	dword ptr [rbp + 0x1a0], 7
140068978	mov	qword ptr [rdi + 9], 0
140068980	mov	qword ptr [rdi + 4], 0
140068988	mov	word ptr [rbp + 0x1a8], 0x101
140068991	mov	rcx, r12
140068994	mov	qword ptr [rbp + 0xe8], rdx
14006899b	mov	r8, rbx
14006899e	call	0x145bb24a0
1400689a3	mov	qword ptr [rbp + 0x210], rdx
1400689aa	cmp	rax, 1
1400689ae	jne	0x140068a00
1400689b0	mov	rax, qword ptr [rbp + 0x210]
1400689b7	and	eax, 3
1400689ba	lea	ecx, [rax - 2]
1400689bd	cmp	ecx, 2
1400689c0	jb	0x140068d0e
1400689c6	test	rax, rax
1400689c9	je	0x140068d0e
1400689cf	mov	rax, qword ptr [rbp + 0x210]
1400689d6	dec	rax
1400689d9	mov	qword ptr [rbp + 0x1e8], rax
1400689e0	mov	byte ptr [rbp + 0x1e0], 3
1400689e7	lea	rcx, [rbp + 0x1e8]
1400689ee	call	0x145bdf7c0
1400689f3	nop
1400689f4	jmp	0x140068d0e
1400689f9	nop	dword ptr [rax]
140068a00	call	0x140002200
140068a05	mov	ecx, 8
140068a0a	mov	edx, 8
140068a0f	call	0x1400021c0
140068a14	test	rax, rax
140068a17	je	0x140069e9d
140068a1d	mov	qword ptr [rbp + 0x218], rax
140068a24	mov	rcx, qword ptr [rbp + 0x210]
140068a2b	mov	qword ptr [rax], rcx
140068a2e	mov	qword ptr [rbp + 0x138], 0
140068a39	mov	qword ptr [rbp + 0x148], 0
140068a44	call	0x140002200
140068a49	mov	ecx, 1
140068a4e	mov	edx, 1
140068a53	call	0x1400021c0
140068a58	test	rax, rax
140068a5b	je	0x140069f8e
140068a61	mov	byte ptr [rax], 0x76
140068a64	mov	qword ptr [rbp + 0x178], 1
140068a6f	mov	qword ptr [rbp + 0x180], rax
140068a76	mov	qword ptr [rbp + 0x188], 1
140068a81	mov	byte ptr [rbp + 0x1e0], 2
140068a88	mov	qword ptr [rbp + 0x1e8], 0
140068a93	mov	qword ptr [rbp + 0x1f0], 1
140068a9e	lea	rdi, [rbp + 0xf0]
140068aa5	mov	rcx, rdi
140068aa8	lea	rdx, [rbp + 0x138]
140068aaf	lea	r8, [rbp + 0x178]
140068ab6	lea	r9, [rbp + 0x1e0]
140068abd	call	0x140062cb0
140068ac2	nop
140068ac3	cmp	byte ptr [rbp + 0xf0], 0xff
140068aca	je	0x140068ad5
140068acc	mov	rcx, rdi
140068acf	call	0x14005e410
140068ad4	nop
140068ad5	call	0x140002200
140068ada	mov	ecx, 9
140068adf	mov	edx, 1
140068ae4	call	0x1400021c0
140068ae9	test	rax, rax
140068aec	je	0x140069f79
140068af2	mov	rcx, rax
140068af5	movabs	rax, 0x695f746e65696c63
140068aff	mov	qword ptr [rcx], rax
140068b02	mov	byte ptr [rcx + 8], 0x64
140068b06	mov	qword ptr [rbp + 0x178], 9
140068b11	mov	qword ptr [rbp - 0x48], rcx
140068b15	mov	qword ptr [rbp + 0x180], rcx
140068b1c	mov	qword ptr [rbp + 0x188], 9
140068b27	call	0x140002200
140068b2c	mov	ecx, 0x13
140068b31	mov	edx, 1
140068b36	call	0x1400021c0
140068b3b	mov	qword ptr [rbp + 0x210], rax
140068b42	test	rax, rax
140068b45	je	0x140069f64
140068b4b	movups	xmm0, xmmword ptr [rip + 0x5d669b1]
140068b52	mov	rax, qword ptr [rbp + 0x210]
140068b59	movups	xmmword ptr [rax], xmm0
140068b5c	mov	dword ptr [rax + 0xf], 0x34363532
140068b63	mov	byte ptr [rbp + 0x1e0], 3
140068b6a	mov	qword ptr [rbp + 0x1e8], 0x13
140068b75	mov	qword ptr [rbp + 0x1f0], rax
140068b7c	mov	qword ptr [rbp + 0x1f8], 0x13
140068b87	mov	rcx, rdi
140068b8a	lea	rdx, [rbp + 0x138]
140068b91	lea	r8, [rbp + 0x178]
140068b98	lea	r9, [rbp + 0x1e0]
140068b9f	call	0x140062cb0
140068ba4	nop
140068ba5	cmp	byte ptr [rbp + 0xf0], 0xff
140068bac	je	0x140068bb7
140068bae	mov	rcx, rdi
140068bb1	call	0x14005e410
140068bb6	nop
140068bb7	mov	rax, qword ptr [rbp + 0x148]
140068bbe	lea	rcx, [rbp + 0x118]
140068bc5	mov	qword ptr [rcx + 0x10], rax
140068bc9	movups	xmm0, xmmword ptr [rbp + 0x138]
140068bd0	movups	xmmword ptr [rcx], xmm0
140068bd3	mov	byte ptr [rbp + 0x110], 5
140068bda	mov	rcx, qword ptr [rbp + 0x218]
140068be1	xor	edx, edx
140068be3	lea	r8, [rbp + 0x110]
140068bea	call	0x14006b080
140068bef	nop
140068bf0	test	rax, rax
140068bf3	je	0x140068c32
140068bf5	mov	ecx, eax
140068bf7	and	ecx, 3
140068bfa	lea	edx, [rcx - 2]
140068bfd	cmp	edx, 2
140068c00	jb	0x140068cd0
140068c06	test	rcx, rcx
140068c09	je	0x140068cd0
140068c0f	dec	rax
140068c12	mov	qword ptr [rbp + 0x198], rax
140068c19	mov	byte ptr [rbp + 0x190], 3
140068c20	lea	rcx, [rbp + 0x198]
140068c27	call	0x145bdf7c0
140068c2c	nop
140068c2d	jmp	0x140068cd0
140068c32	lea	rcx, [rbp + 0x1e0]
140068c39	mov	rdx, qword ptr [rbp + 0x218]
140068c40	call	0x14006af20
140068c45	nop
140068c46	mov	rax, qword ptr [rbp + 0x1e8]
140068c4d	mov	qword ptr [rbp + 0x210], rax
140068c54	cmp	rax, -1
140068c58	je	0x140068c67
140068c5a	cmp	dword ptr [rbp + 0x1e0], 1
140068c61	je	0x1400691f4
140068c67	mov	rdx, qword ptr [rbp + 0x210]
140068c6e	cmp	rdx, -1
140068c72	je	0x140068c8d
140068c74	test	rdx, rdx
140068c77	je	0x140068cd0
140068c79	mov	rcx, qword ptr [rbp + 0x1f0]
140068c80	mov	r8d, 1
140068c86	call	0x1400021d0
140068c8b	jmp	0x140068cd0
140068c8d	mov	rax, qword ptr [rbp + 0x1e0]
140068c94	mov	ecx, eax
140068c96	and	ecx, 3
140068c99	lea	edx, [rcx - 2]
140068c9c	cmp	edx, 2
140068c9f	jb	0x140068cd0
140068ca1	test	rcx, rcx
140068ca4	je	0x140068cd0
140068ca6	dec	rax
140068ca9	mov	qword ptr [rbp + 0x198], rax
140068cb0	mov	byte ptr [rbp + 0x190], 3
140068cb7	lea	rcx, [rbp + 0x198]
140068cbe	call	0x145bdf7c0
140068cc3	nop
140068cc4	nop	word ptr cs:[rax + rax]
140068cd0	mov	byte ptr [rbp + 0x237], 1
140068cd7	lea	rcx, [rbp + 0x110]
140068cde	call	0x14005e410
140068ce3	nop
140068ce4	mov	rdi, qword ptr [rbp + 0x218]
140068ceb	mov	rcx, qword ptr [rdi]
140068cee	call	qword ptr [rip + 0x5d31bcc]
140068cf4	mov	edx, 8
140068cf9	mov	r8d, 8
140068cff	mov	rcx, rdi
140068d02	lea	rdi, [rbp + 0x1a0]
140068d09	call	0x1400021d0
140068d0e	mov	rdx, qword ptr [rbp + 0x1d8]
140068d15	test	rdx, rdx
140068d18	je	0x140068920
140068d1e	mov	r8d, 1
140068d24	mov	rcx, qword ptr [rbp + 0xe8]
140068d2b	call	0x1400021d0
140068d30	jmp	0x140068920
140068d35	mov	rcx, rax
140068d38	cmp	rax, 8
140068d3c	jae	0x140068700
140068d42	jmp	0x14006873e
140068d47	mov	rbx, rsi
140068d4a	lea	rdi, [rbp + 0x1a0]
140068d51	lea	r13, [rbp + 0x90]
140068d58	jmp	0x14006863d
140068d5d	lea	rdi, [rbp + 0x1a0]
140068d64	cmp	rdx, 7
140068d68	lea	r13, [rbp + 0x90]
140068d6f	jae	0x140068d80
140068d71	xor	ecx, ecx
140068d73	jmp	0x140068dde
140068d75	nop	word ptr cs:[rax + rax]
140068d80	mov	rax, qword ptr [rax]
140068d83	mov	rax, qword ptr [rax + 0x278]
140068d8a	mov	rax, qword ptr [rax + 0x278]
140068d91	mov	rax, qword ptr [rax + 0x278]
140068d98	mov	rax, qword ptr [rax + 0x278]
140068d9f	mov	rax, qword ptr [rax + 0x278]
140068da6	mov	rax, qword ptr [rax + 0x278]
140068dad	mov	rbx, qword ptr [rax + 0x278]
140068db4	lea	rax, [rbx + 0x278]
140068dbb	add	rcx, -8
140068dbf	jne	0x140068d80
140068dc1	xor	ecx, ecx
140068dc3	jmp	0x140068dde
140068dc5	nop	word ptr cs:[rax + rax]
140068dd0	lea	rcx, [r15 + 1]
140068dd4	mov	rbx, rsi
140068dd7	lea	r13, [rbp + 0x90]
140068dde	mov	qword ptr [rbp + 0x198], rbx
140068de5	mov	qword ptr [rbp + 0x1a0], 0
140068df0	mov	qword ptr [rbp + 0x1a8], rcx
140068df7	mov	qword ptr [rbp + 0x1e0], r12
140068dfe	lea	rax, [r15 + r15*2]
140068e02	mov	rdx, qword ptr [rsi + rax*8 + 0x168]
140068e0a	test	rdx, rdx
140068e0d	je	0x140068e29
140068e0f	lea	rax, [rsi + rax*8]
140068e13	add	rax, 0x168
140068e19	mov	rcx, qword ptr [rax + 8]
140068e1d	mov	r8d, 1
140068e23	call	0x1400021d0
140068e28	nop
140068e29	shl	r15, 5
140068e2d	add	rsi, r15
140068e30	mov	rcx, rsi
140068e33	call	0x14005e410
140068e38	nop
140068e39	mov	rax, qword ptr [rbp + 0x1d0]
140068e40	test	rax, rax
140068e43	je	0x14006907a
140068e49	dec	rax
140068e4c	mov	qword ptr [rbp + 0x1d0], rax
140068e53	cmp	dword ptr [rbp + 0x190], 1
140068e5a	jne	0x140069ee1
140068e60	mov	rcx, qword ptr [rbp + 0x198]
140068e67	test	rcx, rcx
140068e6a	je	0x140068ea0
140068e6c	mov	rax, qword ptr [rbp + 0x1a0]
140068e73	mov	r15, qword ptr [rbp + 0x1a8]
140068e7a	movzx	edx, word ptr [rcx + 0x272]
140068e81	cmp	r15, rdx
140068e84	jae	0x140068f60
140068e8a	mov	r13, rax
140068e8d	mov	rsi, rcx
140068e90	jmp	0x140068fa3
140068e95	nop	word ptr cs:[rax + rax]
140068ea0	mov	rcx, qword ptr [rbp + 0x1a0]
140068ea7	mov	rax, qword ptr [rbp + 0x1a8]
140068eae	test	rax, rax
140068eb1	je	0x140068f2e
140068eb3	mov	rdx, rax
140068eb6	and	rdx, 7
140068eba	je	0x140069068
140068ec0	xor	r8d, r8d
140068ec3	nop	word ptr cs:[rax + rax]
140068ed0	mov	rcx, qword ptr [rcx + 0x278]
140068ed7	inc	r8
140068eda	cmp	rdx, r8
140068edd	jne	0x140068ed0
140068edf	mov	rdx, rax
140068ee2	sub	rdx, r8
140068ee5	cmp	rax, 8
140068ee9	jb	0x140068f2e
140068eeb	nop	dword ptr [rax + rax]
140068ef0	mov	rax, qword ptr [rcx + 0x278]
140068ef7	mov	rax, qword ptr [rax + 0x278]
140068efe	mov	rax, qword ptr [rax + 0x278]
140068f05	mov	rax, qword ptr [rax + 0x278]
140068f0c	mov	rax, qword ptr [rax + 0x278]
140068f13	mov	rax, qword ptr [rax + 0x278]
140068f1a	mov	rax, qword ptr [rax + 0x278]
140068f21	mov	rcx, qword ptr [rax + 0x278]
140068f28	add	rdx, -8
140068f2c	jne	0x140068ef0
140068f2e	mov	qword ptr [rbp + 0x190], 1
140068f39	mov	qword ptr [rbp + 0x198], rcx
140068f40	movups	xmmword ptr [rdi], xmm6
140068f43	xor	r15d, r15d
140068f46	xor	eax, eax
140068f48	movzx	edx, word ptr [rcx + 0x272]
140068f4f	cmp	r15, rdx
140068f52	jb	0x140068e8a
140068f58	nop	dword ptr [rax + rax]
140068f60	mov	rsi, qword ptr [rcx + 0x160]
140068f67	test	rsi, rsi
140068f6a	je	0x140069eb2
140068f70	lea	r13, [rax + 1]
140068f74	movzx	r15d, word ptr [rcx + 0x270]
140068f7c	test	rax, rax
140068f7f	mov	edx, 0x2d8
140068f84	cmove	rdx, r14
140068f88	mov	r8d, 8
140068f8e	call	0x1400021d0
140068f93	mov	rcx, rsi
140068f96	mov	rax, r13
140068f99	cmp	r15w, word ptr [rsi + 0x272]
140068fa1	jae	0x140068f60
140068fa3	test	r13, r13
140068fa6	je	0x140068dd0
140068fac	lea	rax, [rsi + r15*8]
140068fb0	add	rax, 0x280
140068fb6	mov	rcx, r13
140068fb9	and	rcx, 7
140068fbd	je	0x140069000
140068fbf	xor	r8d, r8d
140068fc2	nop	word ptr cs:[rax + rax]
140068fd0	mov	rbx, qword ptr [rax]
140068fd3	lea	rax, [rbx + 0x278]
140068fda	inc	r8
140068fdd	cmp	rcx, r8
140068fe0	jne	0x140068fd0
140068fe2	mov	rdx, r13
140068fe5	sub	rdx, r8
140068fe8	mov	ecx, 0
140068fed	cmp	r13, 8
140068ff1	lea	r13, [rbp + 0x90]
140068ff8	jb	0x140068dde
140068ffe	jmp	0x140069020
140069000	mov	rdx, r13
140069003	mov	ecx, 0
140069008	cmp	r13, 8
14006900c	lea	r13, [rbp + 0x90]
140069013	jb	0x140068dde
140069019	nop	dword ptr [rax]
140069020	mov	rax, qword ptr [rax]
140069023	mov	rax, qword ptr [rax + 0x278]
14006902a	mov	rax, qword ptr [rax + 0x278]
140069031	mov	rax, qword ptr [rax + 0x278]
140069038	mov	rax, qword ptr [rax + 0x278]
14006903f	mov	rax, qword ptr [rax + 0x278]
140069046	mov	rax, qword ptr [rax + 0x278]
14006904d	mov	rbx, qword ptr [rax + 0x278]
140069054	lea	rax, [rbx + 0x278]
14006905b	add	rdx, -8
14006905f	jne	0x140069020
140069061	xor	ecx, ecx
140069063	jmp	0x140068dde
140069068	mov	rdx, rax
14006906b	cmp	rax, 8
14006906f	jae	0x140068ef0
140069075	jmp	0x140068f2e
14006907a	cmp	qword ptr [rbp + 0x190], 1
140069082	jne	0x1400691ec
140069088	mov	rcx, qword ptr [rbp + 0x198]
14006908f	mov	rax, qword ptr [rbp + 0x1a0]
140069096	test	rcx, rcx
140069099	je	0x1400690a3
14006909b	mov	rbx, rax
14006909e	jmp	0x140069193
1400690a3	mov	rdx, qword ptr [rbp + 0x1a8]
1400690aa	test	rdx, rdx
1400690ad	je	0x14006918e
1400690b3	mov	rcx, rdx
1400690b6	and	rcx, 7
1400690ba	je	0x140069137
1400690bc	xor	r9d, r9d
1400690bf	nop
1400690c0	mov	rax, qword ptr [rax + 0x278]
1400690c7	inc	r9
1400690ca	cmp	rcx, r9
1400690cd	jne	0x1400690c0
1400690cf	mov	r8, rdx
1400690d2	sub	r8, r9
1400690d5	mov	ebx, 0
1400690da	mov	rcx, rax
1400690dd	cmp	rdx, 8
1400690e1	jae	0x140069150
1400690e3	jmp	0x140069193
1400690e8	xor	edi, edi
1400690ea	jmp	0x140069336
1400690ef	xor	edi, edi
1400690f1	cmp	qword ptr [rbp + 0x28], rsi
1400690f5	je	0x140069336
1400690fb	shr	r15, 5
1400690ff	jmp	0x14006911d
140069101	nop	word ptr cs:[rax + rax]
140069110	add	r13, 0x20
140069114	dec	r15
140069117	je	0x140069336
14006911d	mov	rdx, qword ptr [r13 - 8]
140069121	test	rdx, rdx
140069124	je	0x140069110
140069126	mov	rcx, qword ptr [r13]
14006912a	mov	r8d, 1
140069130	call	0x1400021d0
140069135	jmp	0x140069110
140069137	mov	r8, rdx
14006913a	mov	ebx, 0
14006913f	mov	rcx, rax
140069142	cmp	rdx, 8
140069146	jb	0x140069193
140069148	nop	dword ptr [rax + rax]
140069150	mov	rax, qword ptr [rax + 0x278]
140069157	mov	rax, qword ptr [rax + 0x278]
14006915e	mov	rax, qword ptr [rax + 0x278]
140069165	mov	rax, qword ptr [rax + 0x278]
14006916c	mov	rax, qword ptr [rax + 0x278]
140069173	mov	rax, qword ptr [rax + 0x278]
14006917a	mov	rax, qword ptr [rax + 0x278]
140069181	mov	rax, qword ptr [rax + 0x278]
140069188	add	r8, -8
14006918c	jne	0x140069150
14006918e	xor	ebx, ebx
140069190	mov	rcx, rax
140069193	mov	rax, qword ptr [rcx + 0x160]
14006919a	test	rax, rax
14006919d	je	0x1400691cf
14006919f	nop
1400691a0	mov	rsi, rax
1400691a3	test	rbx, rbx
1400691a6	lea	rbx, [rbx + 1]
1400691aa	mov	edx, 0x2d8
1400691af	cmove	rdx, r14
1400691b3	mov	r8d, 8
1400691b9	call	0x1400021d0
1400691be	mov	rax, qword ptr [rsi + 0x160]
1400691c5	mov	rcx, rsi
1400691c8	test	rax, rax
1400691cb	jne	0x1400691a0
1400691cd	jmp	0x1400691d2
1400691cf	mov	rsi, rcx
1400691d2	test	rbx, rbx
1400691d5	mov	edx, 0x2d8
1400691da	cmove	rdx, r14
1400691de	mov	r8d, 8
1400691e4	mov	rcx, rsi
1400691e7	call	0x1400021d0
1400691ec	mov	rax, r13
1400691ef	jmp	0x1400683e0
1400691f4	mov	rax, qword ptr [rip + 0x8013dad]
1400691fb	mov	rax, qword ptr [rax]
1400691fe	cmp	rax, 2
140069202	ja	0x1400692d5
140069208	movzx	edx, byte ptr [rip + 0x7fd7ea1]
14006920f	movzx	eax, dl
140069212	lea	ecx, [rax - 1]
140069215	cmp	ecx, 2
140069218	jae	0x1400692cd
14006921e	mov	rcx, qword ptr [rip + 0x7fd7e7b]
140069225	call	0x144c5d8d0
14006922a	nop
14006922b	test	al, al
14006922d	je	0x1400692d5
140069233	mov	rcx, qword ptr [rip + 0x7fd7e66]
14006923a	lea	rax, [rcx + 0x30]
14006923e	mov	rdx, qword ptr [rbp + 0xe8]
140069245	mov	qword ptr [rbp + 0x178], rdx
14006924c	mov	qword ptr [rbp + 0x180], rbx
140069253	lea	rdx, [rbp + 0x178]
14006925a	mov	qword ptr [rbp + 0xf0], rdx
140069261	lea	rdx, [rip + 0x5b56a78]
140069268	mov	qword ptr [rbp + 0xf8], rdx
14006926f	lea	rdx, [rip + 0x5d662a0]
140069276	mov	qword ptr [rbp + 0x138], rdx
14006927d	mov	qword ptr [rbp + 0x140], rdi
140069284	lea	rdx, [rbp + 0x138]
14006928b	mov	qword ptr [rbp - 0x28], rdx
14006928f	lea	rdx, [rip + 0x5d66122]
140069296	mov	qword ptr [rbp - 0x20], rdx
14006929a	mov	qword ptr [rbp + 0x190], 1
1400692a5	lea	rdx, [rbp - 0x28]
1400692a9	mov	qword ptr [rbp + 0x198], rdx
1400692b0	mov	qword ptr [rbp + 0x1a0], 1
1400692bb	mov	qword ptr [rbp + 0x1a8], rax
1400692c2	mov	rdx, r12
1400692c5	call	0x144c5f0f0
1400692ca	nop
1400692cb	jmp	0x1400692d5
1400692cd	test	eax, eax
1400692cf	jne	0x140069ddd
1400692d5	mov	rdx, qword ptr [rbp + 0x210]
1400692dc	test	rdx, rdx
1400692df	je	0x1400692f3
1400692e1	mov	rcx, qword ptr [rbp + 0x1f0]
1400692e8	mov	r8d, 1
1400692ee	call	0x1400021d0
1400692f3	mov	byte ptr [rbp + 0x237], 0
1400692fa	lea	rcx, [rbp + 0x110]
140069301	call	0x14005e410
140069306	nop
140069307	mov	rdx, qword ptr [rbp + 0x1d8]
14006930e	test	rdx, rdx
140069311	je	0x140069325
140069313	mov	r8d, 1
140069319	mov	rcx, qword ptr [rbp + 0xe8]
140069320	call	0x1400021d0
140069325	mov	rdi, qword ptr [rbp + 0x218]
14006932c	cmp	qword ptr [rbp + 0x28], rsi
140069330	jne	0x1400690fb
140069336	mov	qword ptr [rbp + 0x218], rdi
14006933d	mov	rdx, qword ptr [rbp - 0x38]
140069341	test	rdx, rdx
140069344	lea	r13, [rbp + 0x90]
14006934b	je	0x140069360
14006934d	shl	rdx, 5
140069351	mov	r8d, 8
140069357	mov	rcx, qword ptr [rbp - 0x30]
14006935b	call	0x1400021d0
140069360	cmp	byte ptr [rbp + 0xc0], 0xff
140069367	je	0x140069376
140069369	lea	rcx, [rbp + 0xc0]
140069370	call	0x14005e410
140069375	nop
140069376	mov	byte ptr [rbp + 0xc0], 0xff
14006937d	mov	rdi, qword ptr [rbp + 0x218]
140069384	test	rdi, rdi
140069387	je	0x1400697f6
14006938d	cmp	dword ptr [rbp + 0x130], -1
140069394	je	0x1400693c7
140069396	mov	rax, qword ptr [rbp - 0x40]
14006939a	mov	qword ptr [rbp + 0x190], rax
1400693a1	mov	eax, dword ptr [rbp + 0x130]
1400693a7	mov	dword ptr [rbp + 0x198], eax
1400693ad	mov	qword ptr [rbp + 0x228], rdi
1400693b4	mov	rcx, r12
1400693b7	call	0x145ba43d0
1400693bc	nop
1400693bd	cmp	rax, 4
1400693c1	jb	0x140068069
1400693c7	mov	qword ptr [rbp + 0x228], rdi
1400693ce	call	0x145ba4280
1400693d3	mov	qword ptr [rbp - 0x40], rax
1400693d7	mov	dword ptr [rbp + 0x130], edx
1400693dd	mov	qword ptr [rbp + 0x60], 0
1400693e5	mov	qword ptr [rbp + 0x70], 0
1400693ed	call	0x140002200
1400693f2	mov	ecx, 3
1400693f7	mov	edx, 1
1400693fc	call	0x1400021c0
140069401	test	rax, rax
140069404	mov	qword ptr [rbp + 0x218], rdi
14006940b	je	0x140069fee
140069411	mov	byte ptr [rax + 2], 0x64
140069415	mov	word ptr [rax], 0x6d63
14006941a	mov	qword ptr [rbp + 0x110], 3
140069425	mov	qword ptr [rbp + 0x1d8], rax
14006942c	mov	qword ptr [rbp + 0x118], rax
140069433	mov	qword ptr [rbp + 0x120], 3
14006943e	call	0x140002200
140069443	mov	ecx, 0xc
140069448	mov	edx, 1
14006944d	call	0x1400021c0
140069452	test	rax, rax
140069455	lea	rcx, [rbp + 0xf0]
14006945c	mov	rsi, qword ptr [rbp + 0x38]
140069460	mov	qword ptr [rbp + 0x210], rax
140069467	je	0x14006a000
14006946d	mov	r10, rax
140069470	movabs	rax, 0x495443415f544553
14006947a	mov	qword ptr [r10], rax
14006947d	mov	dword ptr [r10 + 8], 0x59544956
140069485	mov	byte ptr [rbp + 0x1e0], 3
14006948c	mov	qword ptr [rbp + 0x1e8], 0xc
140069497	mov	qword ptr [rbp + 0x1f0], r10
14006949e	mov	qword ptr [rbp + 0x1f8], 0xc
1400694a9	lea	rdx, [rbp + 0x60]
1400694ad	lea	r8, [rbp + 0x110]
1400694b4	lea	r9, [rbp + 0x1e0]
1400694bb	call	0x140062cb0
1400694c0	nop
1400694c1	cmp	byte ptr [rbp + 0xf0], 0xff
1400694c8	je	0x1400694d7
1400694ca	lea	rcx, [rbp + 0xf0]
1400694d1	call	0x14005e410
1400694d6	nop
1400694d7	call	0x140002200
1400694dc	mov	ecx, 4
1400694e1	mov	edx, 1
1400694e6	call	0x1400021c0
1400694eb	test	rax, rax
1400694ee	je	0x14006a012
1400694f4	mov	dword ptr [rax], 0x73677261
1400694fa	mov	qword ptr [rbp - 0x28], 4
140069502	mov	qword ptr [rbp + 0x210], rax
140069509	mov	qword ptr [rbp - 0x20], rax
14006950d	mov	qword ptr [rbp - 0x18], 4
140069515	mov	qword ptr [rbp + 0x138], 0
140069520	mov	qword ptr [rbp + 0x148], 0
14006952b	call	0x140002200
140069530	mov	ecx, 3
140069535	mov	edx, 1
14006953a	call	0x1400021c0
14006953f	test	rax, rax
140069542	je	0x140069fca
140069548	mov	byte ptr [rax + 2], 0x64
14006954c	mov	word ptr [rax], 0x6970
140069551	mov	qword ptr [rbp + 0x178], 3
14006955c	mov	qword ptr [rbp + 0x1d8], rax
140069563	mov	qword ptr [rbp + 0x180], rax
14006956a	mov	qword ptr [rbp + 0x188], 3
140069575	mov	byte ptr [rbp + 0x20f], 1
14006957c	call	0x145bb5680
140069581	nop
140069582	mov	eax, eax
140069584	mov	byte ptr [rbp + 0x1e0], 2
14006958b	mov	qword ptr [rbp + 0x1e8], 0
140069596	mov	qword ptr [rbp + 0x1f0], rax
14006959d	mov	byte ptr [rbp + 0x20f], 0
1400695a4	lea	rcx, [rbp + 0xf0]
1400695ab	lea	rdx, [rbp + 0x138]
1400695b2	lea	r8, [rbp + 0x178]
1400695b9	lea	r9, [rbp + 0x1e0]
1400695c0	call	0x140062cb0
1400695c5	nop
1400695c6	cmp	byte ptr [rbp + 0xf0], 0xff
1400695cd	je	0x1400695dc
1400695cf	lea	rcx, [rbp + 0xf0]
1400695d6	call	0x14005e410
1400695db	nop
1400695dc	call	0x140002200
1400695e1	mov	ecx, 8
1400695e6	mov	edx, 1
1400695eb	call	0x1400021c0
1400695f0	test	rax, rax
1400695f3	je	0x140069fdc
1400695f9	mov	rcx, rax
1400695fc	movabs	rax, 0x7974697669746361
140069606	mov	qword ptr [rcx], rax
140069609	mov	qword ptr [rbp + 0x178], 8
140069614	mov	qword ptr [rbp + 0x1d8], rcx
14006961b	mov	qword ptr [rbp + 0x180], rcx
140069622	mov	qword ptr [rbp + 0x188], 8
14006962d	mov	byte ptr [rbp + 0x236], 1
140069634	lea	rcx, [rbp + 0x1e0]
14006963b	lea	rdx, [rbp - 0x50]
14006963f	call	0x140060380
140069644	nop
140069645	cmp	byte ptr [rbp + 0x1e0], 0xff
14006964c	je	0x140069ef3
140069652	movups	xmm0, xmmword ptr [rbp + 0x1e0]
140069659	movups	xmm1, xmmword ptr [rbp + 0x1f0]
140069660	movaps	xmmword ptr [rbp + 0x100], xmm1
140069667	movaps	xmmword ptr [rbp + 0xf0], xmm0
14006966e	mov	byte ptr [rbp + 0x236], 0
140069675	lea	rcx, [rbp + 0x1e0]
14006967c	lea	rdx, [rbp + 0x138]
140069683	lea	r8, [rbp + 0x178]
14006968a	lea	r9, [rbp + 0xf0]
140069691	call	0x140062cb0
140069696	nop
140069697	cmp	byte ptr [rbp + 0x1e0], 0xff
14006969e	je	0x1400696ad
1400696a0	lea	rcx, [rbp + 0x1e0]
1400696a7	call	0x14005e410
1400696ac	nop
1400696ad	mov	rax, qword ptr [rbp + 0x148]
1400696b4	lea	rcx, [rbp + 0x118]
1400696bb	mov	qword ptr [rcx + 0x10], rax
1400696bf	movups	xmm0, xmmword ptr [rbp + 0x138]
1400696c6	movups	xmmword ptr [rcx], xmm0
1400696c9	mov	byte ptr [rbp + 0x110], 5
1400696d0	mov	byte ptr [rbp + 0x20e], 0
1400696d7	lea	rcx, [rbp + 0x1e0]
1400696de	lea	rdx, [rbp + 0x60]
1400696e2	lea	r8, [rbp - 0x28]
1400696e6	lea	r9, [rbp + 0x110]
1400696ed	call	0x140062cb0
1400696f2	nop
1400696f3	cmp	byte ptr [rbp + 0x1e0], 0xff
1400696fa	je	0x140069709
1400696fc	lea	rcx, [rbp + 0x1e0]
140069703	call	0x14005e410
140069708	nop
140069709	call	0x140002200
14006970e	mov	ecx, 5
140069713	mov	edx, 1
140069718	call	0x1400021c0
14006971d	test	rax, rax
140069720	je	0x140069fb5
140069726	mov	rcx, qword ptr [rbp + 0x30]
14006972a	inc	rcx
14006972d	mov	byte ptr [rax + 4], 0x65
140069731	mov	dword ptr [rax], 0x636e6f6e
140069737	mov	qword ptr [rbp + 0x110], 5
140069742	mov	qword ptr [rbp + 0x210], rax
140069749	mov	qword ptr [rbp + 0x118], rax
140069750	mov	qword ptr [rbp + 0x120], 5
14006975b	mov	r8d, 0x14
140069761	mov	qword ptr [rbp + 0x30], rcx
140069765	lea	rdx, [rbp + 0x1e0]
14006976c	call	0x145bd3fa0
140069771	nop
140069772	test	rdx, rdx
140069775	js	0x140069e8d
14006977b	test	rdx, rdx
14006977e	sete	r15b
140069782	mov	qword ptr [rbp + 0x1d8], rdx
140069789	je	0x140069843
14006978f	mov	rbx, rax
140069792	mov	rsi, rdx
140069795	call	0x140002200
14006979a	mov	edx, 1
14006979f	mov	rcx, rsi
1400697a2	call	0x1400021c0
1400697a7	test	rax, rax
1400697aa	je	0x14006a024
1400697b0	mov	rdi, rax
1400697b3	mov	rcx, rax
1400697b6	mov	rdx, rbx
1400697b9	mov	r8, rsi
1400697bc	call	0x145bfa0e7
1400697c1	call	0x140002200
1400697c6	mov	edx, 1
1400697cb	mov	rcx, rsi
1400697ce	call	0x1400021c0
1400697d3	test	rax, rax
1400697d6	je	0x14006a02e
1400697dc	mov	rbx, rax
1400697df	mov	rcx, rax
1400697e2	mov	rdx, rdi
1400697e5	mov	r8, rsi
1400697e8	call	0x145bfa0e7
1400697ed	mov	qword ptr [rbp + 0x38], rdi
1400697f1	mov	rdx, rsi
1400697f4	jmp	0x140069856
1400697f6	mov	qword ptr [rbp + 0x228], 0
140069801	call	0x145ba4280
140069806	nop
140069807	mov	qword ptr [rbp + 0x228], 0
140069812	lea	rcx, [rip + 0x5d65c7f]
140069819	mov	qword ptr [rsp + 0x20], rcx
14006981e	mov	r8d, 0x14
140069824	mov	rcx, rax
140069827	xor	r9d, r9d
14006982a	call	0x145bc14f0
14006982f	mov	qword ptr [rbp + 0x88], rax
140069836	mov	dword ptr [rbp + 0x134], edx
14006983c	xor	edi, edi
14006983e	jmp	0x140068069
140069843	mov	ebx, 1
140069848	mov	edi, 1
14006984d	mov	eax, 1
140069852	mov	qword ptr [rbp + 0x38], rax
140069856	mov	byte ptr [rbp + 0x1e0], 3
14006985d	mov	qword ptr [rbp + 0x1e8], rdx
140069864	mov	qword ptr [rbp + 0x1f0], rbx
14006986b	mov	qword ptr [rbp + 0x1f8], rdx
140069872	mov	byte ptr [rbp + 0x20d], r15b
140069879	mov	byte ptr [rbp + 0x20c], 0
140069880	mov	qword ptr [rbp + 0x20], rdi
140069884	lea	rcx, [rbp + 0xf0]
14006988b	lea	rdx, [rbp + 0x60]
14006988f	lea	r8, [rbp + 0x110]
140069896	lea	r9, [rbp + 0x1e0]
14006989d	call	0x140062cb0
1400698a2	nop
1400698a3	cmp	byte ptr [rbp + 0xf0], 0xff
1400698aa	je	0x1400698c7
1400698ac	mov	byte ptr [rbp + 0x227], r15b
1400698b3	mov	qword ptr [rbp + 0x80], rdi
1400698ba	lea	rcx, [rbp + 0xf0]
1400698c1	call	0x14005e410
1400698c6	nop
1400698c7	mov	rdx, qword ptr [rbp + 0x1d8]
1400698ce	test	rdx, rdx
1400698d1	je	0x1400698e1
1400698d3	mov	r8d, 1
1400698d9	mov	rcx, rdi
1400698dc	call	0x1400021d0
1400698e1	mov	rax, qword ptr [rbp + 0x70]
1400698e5	lea	rcx, [rbp - 8]
1400698e9	mov	qword ptr [rcx + 0x10], rax
1400698ed	movups	xmm0, xmmword ptr [rbp + 0x60]
1400698f1	movups	xmmword ptr [rcx], xmm0
1400698f4	mov	byte ptr [rbp - 0x10], 5
1400698f8	mov	rcx, qword ptr [rbp + 0x218]
1400698ff	mov	edx, 1
140069904	lea	r8, [rbp - 0x10]
140069908	call	0x14006b080
14006990d	nop
14006990e	lea	rdi, [rbp + 0x1a0]
140069915	test	rax, rax
140069918	je	0x140069996
14006991a	mov	qword ptr [rbp + 0x110], rax
140069921	mov	qword ptr [rbp + 0x118], 0xffffffffffffffff
14006992c	mov	rsi, qword ptr [rbp + 0x218]
140069933	mov	rcx, qword ptr [rsi]
140069936	call	qword ptr [rip + 0x5d30f84]
14006993c	mov	edx, 8
140069941	mov	r8d, 8
140069947	mov	rcx, rsi
14006994a	call	0x1400021d0
14006994f	mov	qword ptr [rbp + 0x78], 0
140069957	call	0x145ba4280
14006995c	nop
14006995d	mov	qword ptr [rbp + 0x78], 0
140069965	lea	rcx, [rip + 0x5d65b14]
14006996c	mov	qword ptr [rsp + 0x20], rcx
140069971	mov	r8d, 0x14
140069977	mov	rcx, rax
14006997a	xor	r9d, r9d
14006997d	call	0x145bc14f0
140069982	mov	qword ptr [rbp + 0x88], rax
140069989	mov	dword ptr [rbp + 0x134], edx
14006998f	xor	edi, edi
140069991	jmp	0x140069d76
140069996	lea	rcx, [rbp + 0x110]
14006999d	mov	rdx, qword ptr [rbp + 0x218]
1400699a4	call	0x14006af20
1400699a9	nop
1400699aa	mov	rax, qword ptr [rbp + 0x118]
1400699b1	cmp	rax, -1
1400699b5	mov	rsi, qword ptr [rbp + 0x218]
1400699bc	je	0x140069933
1400699c2	mov	qword ptr [rbp + 0x210], rax
1400699c9	mov	rcx, qword ptr [rbp + 0x120]
1400699d0	mov	rax, qword ptr [rbp + 0x128]
1400699d7	mov	qword ptr [rbp + 0x1d8], rcx
1400699de	mov	qword ptr [rbp + 0x190], rcx
1400699e5	mov	qword ptr [rbp + 0x198], rax
1400699ec	movups	xmmword ptr [rdi], xmm6
1400699ef	lea	rcx, [rbp + 0x1e0]
1400699f6	mov	rdx, r12
1400699f9	call	0x140179a50
1400699fe	nop
1400699ff	lea	rdi, [rbp + 0xf0]
140069a06	cmp	byte ptr [rbp + 0x1e0], 0xff
140069a0d	je	0x140069a2d
140069a0f	movups	xmm0, xmmword ptr [rbp + 0x1e0]
140069a16	movups	xmm1, xmmword ptr [rbp + 0x1f0]
140069a1d	movaps	xmmword ptr [rbp + 0x100], xmm1
140069a24	movaps	xmmword ptr [rbp + 0xf0], xmm0
140069a2b	jmp	0x140069a41
140069a2d	mov	byte ptr [rbp + 0xf0], 0
140069a34	lea	rcx, [rbp + 0x1e8]
140069a3b	call	0x14005e350
140069a40	nop
140069a41	mov	edx, 3
140069a46	lea	rcx, [rip + 0x5d65a03]
140069a4d	mov	r8, rdi
140069a50	call	0x142aeace0
140069a55	nop
140069a56	test	rax, rax
140069a59	jne	0x140069a62
140069a5b	mov	rax, qword ptr [rip + 0x7ff682e]
140069a62	cmp	byte ptr [rax], 3
140069a65	jne	0x140069ba7
140069a6b	cmp	qword ptr [rax + 0x18], 5
140069a70	jne	0x140069ba7
140069a76	mov	rax, qword ptr [rax + 0x10]
140069a7a	mov	ecx, dword ptr [rax]
140069a7c	mov	edx, 0x4f525245
140069a81	xor	ecx, edx
140069a83	movzx	eax, byte ptr [rax + 4]
140069a87	xor	eax, 0x52
140069a8a	or	eax, ecx
140069a8c	jne	0x140069ba7
140069a92	mov	rax, qword ptr [rip + 0x801350f]
140069a99	mov	rax, qword ptr [rax]
140069a9c	cmp	rax, 3
140069aa0	ja	0x140069ba7
140069aa6	movzx	edx, byte ptr [rip + 0x7fd75eb]
140069aad	movzx	eax, dl
140069ab0	lea	ecx, [rax - 1]
140069ab3	cmp	ecx, 2
140069ab6	jae	0x140069b9f
140069abc	mov	rcx, qword ptr [rip + 0x7fd75c5]
140069ac3	call	0x144c5d8d0
140069ac8	nop
140069ac9	test	al, al
140069acb	je	0x140069ba7
140069ad1	mov	rsi, qword ptr [rip + 0x7fd75b0]
140069ad8	mov	edx, 4
140069add	lea	rcx, [rip + 0x5d6596f]
140069ae4	mov	r8, rdi
140069ae7	call	0x142aeace0
140069aec	nop
140069aed	test	rax, rax
140069af0	jne	0x140069af9
140069af2	mov	rax, qword ptr [rip + 0x7ff6797]
140069af9	add	rsi, 0x30
140069afd	mov	qword ptr [rbp + 0x1e0], rax
140069b04	lea	rax, [rip + 0x2a81e45]
140069b0b	mov	qword ptr [rbp + 0x1e8], rax
140069b12	lea	rax, [rip + 0x5d6593e]
140069b19	mov	qword ptr [rbp + 0x178], rax
140069b20	lea	rax, [rbp + 0x1e0]
140069b27	mov	qword ptr [rbp + 0x180], rax
140069b2e	lea	rax, [rbp + 0x178]
140069b35	mov	qword ptr [rbp + 0x138], rax
140069b3c	lea	rax, [rip + 0x5d65875]
140069b43	mov	qword ptr [rbp + 0x140], rax
140069b4a	mov	qword ptr [rbp + 0x190], 1
140069b55	lea	rax, [rbp + 0x138]
140069b5c	mov	qword ptr [rbp + 0x198], rax
140069b63	mov	qword ptr [rbp + 0x1a0], 1
140069b6e	mov	qword ptr [rbp + 0x1a8], rsi
140069b75	mov	rcx, qword ptr [rip + 0x7fd750c]
140069b7c	mov	rdx, r12
140069b7f	call	0x144c5f0f0
140069b84	nop
140069b85	movzx	ebx, byte ptr [rbp + 0x150]
140069b8c	movzx	eax, bl
140069b8f	lea	rcx, [rip + 0x5d67276]
140069b96	movsxd	rax, dword ptr [rcx + rax*4]
140069b9a	add	rax, rcx
140069b9d	jmp	rax
140069b9f	test	eax, eax
140069ba1	jne	0x140069df9
140069ba7	movzx	ebx, byte ptr [rbp + 0x150]
140069bae	movzx	eax, bl
140069bb1	lea	rcx, [rip + 0x5d67254]
140069bb8	movsxd	rax, dword ptr [rcx + rax*4]
140069bbc	add	rax, rcx
140069bbf	jmp	rax
140069bc1	movzx	eax, byte ptr [rbp + 0x151]
140069bc8	mov	byte ptr [rbp + 0x191], al
140069bce	jmp	0x140069c88
140069bd3	lea	rcx, [rbp + 0x198]
140069bda	lea	rdx, [rbp + 0x158]
140069be1	call	0x1400adb40
140069be6	nop
140069be7	jmp	0x140069c88
140069bec	lea	rax, [rbp + 0x158]
140069bf3	movups	xmm0, xmmword ptr [rax]
140069bf6	lea	rax, [rbp + 0x198]
140069bfd	movups	xmmword ptr [rax], xmm0
140069c00	jmp	0x140069c88
140069c05	lea	rcx, [rbp + 0x198]
140069c0c	lea	rdx, [rbp + 0x158]
140069c13	call	0x145bcd2f0
140069c18	nop
140069c19	jmp	0x140069c88
140069c1b	cmp	qword ptr [rbp + 0x168], 0
140069c23	je	0x140069c4b
140069c25	mov	rdx, qword ptr [rbp + 0x158]
140069c2c	test	rdx, rdx
140069c2f	je	0x140069fa3
140069c35	mov	r8, qword ptr [rbp + 0x160]
140069c3c	lea	rcx, [rbp + 0x178]
140069c43	call	0x14005f980
140069c48	nop
140069c49	jmp	0x140069c61
140069c4b	mov	qword ptr [rbp + 0x178], 0
140069c56	mov	qword ptr [rbp + 0x188], 0
140069c61	mov	rax, qword ptr [rbp + 0x188]
140069c68	lea	rcx, [rbp + 0x198]
140069c6f	mov	qword ptr [rcx + 0x10], rax
140069c73	mov	rax, qword ptr [rbp + 0x178]
140069c7a	mov	qword ptr [rcx], rax
140069c7d	mov	rax, qword ptr [rbp + 0x180]
140069c84	mov	qword ptr [rcx + 8], rax
140069c88	mov	byte ptr [rbp + 0x190], bl
140069c8e	movups	xmm0, xmmword ptr [rbp + 0x1a0]
140069c95	movaps	xmmword ptr [rbp + 0x1f0], xmm0
140069c9c	movzx	eax, byte ptr [rbp + 0x190]
140069ca3	mov	byte ptr [rbp + 0x1e0], al
140069ca9	movzx	eax, byte ptr [rbp + 0x191]
140069cb0	mov	byte ptr [rbp + 0x1e1], al
140069cb6	mov	rax, qword ptr [rbp + 0x192]
140069cbd	mov	qword ptr [rbp + 0x1e2], rax
140069cc4	mov	eax, dword ptr [rbp + 0x19a]
140069cca	mov	dword ptr [rbp + 0x1ea], eax
140069cd0	movzx	eax, word ptr [rbp + 0x19e]
140069cd7	mov	word ptr [rbp + 0x1ee], ax
140069cde	cmp	byte ptr [rbp + 0xc0], 0xff
140069ce5	je	0x140069cf4
140069ce7	lea	rcx, [rbp + 0xc0]
140069cee	call	0x14005e410
140069cf3	nop
140069cf4	movzx	eax, byte ptr [rbp + 0x1e0]
140069cfb	movzx	ecx, byte ptr [rbp + 0x1e1]
140069d02	mov	rdx, qword ptr [rbp + 0x1e2]
140069d09	mov	r8d, dword ptr [rbp + 0x1ea]
140069d10	movzx	r9d, word ptr [rbp + 0x1ee]
140069d18	movaps	xmm0, xmmword ptr [rbp + 0x1f0]
140069d1f	movaps	xmmword ptr [rbp + 0xd0], xmm0
140069d26	mov	byte ptr [rbp + 0xc0], al
140069d2c	mov	byte ptr [rbp + 0xc1], cl
140069d32	mov	qword ptr [rbp + 0xc2], rdx
140069d39	mov	dword ptr [rbp + 0xca], r8d
140069d40	mov	word ptr [rbp + 0xce], r9w
140069d48	mov	rcx, rdi
140069d4b	call	0x14005e410
140069d50	nop
140069d51	mov	rdx, qword ptr [rbp + 0x210]
140069d58	test	rdx, rdx
140069d5b	je	0x140069d6f
140069d5d	mov	r8d, 1
140069d63	mov	rcx, qword ptr [rbp + 0x1d8]
140069d6a	call	0x1400021d0
140069d6f	mov	rdi, qword ptr [rbp + 0x218]
140069d76	mov	qword ptr [rbp + 0x18], rdi
140069d7a	lea	rcx, [rbp - 0x10]
140069d7e	call	0x14005e410
140069d83	nop
140069d84	cmp	qword ptr [rbp + 0x118], -1
140069d8c	jne	0x140068069
140069d92	mov	rax, qword ptr [rbp + 0x110]
140069d99	mov	ecx, eax
140069d9b	and	ecx, 3
140069d9e	lea	edx, [rcx - 2]
140069da1	cmp	edx, 2
140069da4	jb	0x140068069
140069daa	test	rcx, rcx
140069dad	je	0x140068069
140069db3	dec	rax
140069db6	mov	qword ptr [rbp + 0x198], rax
140069dbd	mov	byte ptr [rbp + 0x190], 3
140069dc4	mov	qword ptr [rbp + 0x228], rdi
140069dcb	lea	rcx, [rbp + 0x198]
140069dd2	call	0x145bdf7c0
140069dd7	nop
140069dd8	jmp	0x140068069
140069ddd	lea	rcx, [rip + 0x7fd72bc]
140069de4	call	0x145d45220
140069de9	nop
140069dea	mov	edx, eax
140069dec	test	al, al
140069dee	jne	0x14006921e
140069df4	jmp	0x1400692d5
140069df9	lea	rcx, [rip + 0x7fd7288]
140069e00	call	0x145d45220
140069e05	nop
140069e06	mov	edx, eax
140069e08	test	al, al
140069e0a	jne	0x140069abc
140069e10	jmp	0x140069ba7
140069e15	cmp	byte ptr [rbp + 0xc0], 0xff
140069e1c	je	0x140069e2f
140069e1e	mov	qword ptr [rbp + 0x10], rdi
140069e22	lea	rcx, [rbp + 0xc0]
140069e29	call	0x14005e410
140069e2e	nop
140069e2f	test	rdi, rdi
140069e32	je	0x140069e50
140069e34	mov	rcx, qword ptr [rdi]
140069e37	call	qword ptr [rip + 0x5d30a83]
140069e3d	mov	edx, 8
140069e42	mov	r8d, 8
140069e48	mov	rcx, rdi
140069e4b	call	0x1400021d0
140069e50	cmp	byte ptr [rbp + 0x150], 0xff
140069e57	je	0x140069e66
140069e59	lea	rcx, [rbp + 0x150]
140069e60	call	0x14005e410
140069e65	nop
140069e66	lea	rcx, [rbp + 0xb0]
140069e6d	call	0x14029efa0
140069e72	movaps	xmm6, xmmword ptr [rbp + 0x240]
140069e79	add	rsp, 0x2d8
140069e80	pop	rbx
140069e81	pop	rdi
140069e82	pop	rsi
140069e83	pop	r12
140069e85	pop	r13
140069e87	pop	r14
140069e89	pop	r15
140069e8b	pop	rbp
140069e8c	ret
140069e8d	xor	ecx, ecx
140069e8f	mov	rdx, rsi
140069e92	call	0x145d992bb
140069e97	nop
140069e98	jmp	0x14006a04e
140069e9d	mov	ecx, 8
140069ea2	mov	edx, 8
140069ea7	call	0x145d992a1
140069eac	nop
140069ead	jmp	0x14006a04e
140069eb2	test	rax, rax
140069eb5	mov	eax, 0x278
140069eba	mov	edx, 0x2d8
140069ebf	cmove	rdx, rax
140069ec3	mov	r8d, 8
140069ec9	call	0x1400021d0
140069ece	nop
140069ecf	lea	rcx, [rip + 0x5d64402]
140069ed6	call	0x145d995b0
140069edb	nop
140069edc	jmp	0x14006a04e
140069ee1	lea	rcx, [rip + 0x5d64138]
140069ee8	call	0x145d995b0
140069eed	nop
140069eee	jmp	0x14006a04e
140069ef3	mov	rax, qword ptr [rbp + 0x1e8]
140069efa	mov	qword ptr [rbp + 0xf0], rax
140069f01	lea	rax, [rip + 0x5d65530]
140069f08	mov	qword ptr [rsp + 0x20], rax
140069f0d	lea	rcx, [rip + 0x5d64604]
140069f14	lea	r9, [rip + 0x5d645dd]
140069f1b	lea	r8, [rbp + 0xf0]
140069f22	mov	edx, 0x2b
140069f27	call	0x145d995d0
140069f2c	nop
140069f2d	jmp	0x14006a04e
140069f32	test	rdi, rdi
140069f35	mov	eax, 0x278
140069f3a	mov	edx, 0x2d8
140069f3f	cmove	rdx, rax
140069f43	mov	r8d, 8
140069f49	mov	rcx, rbx
140069f4c	call	0x1400021d0
140069f51	nop
140069f52	lea	rcx, [rip + 0x5d6437f]
140069f59	call	0x145d995b0
140069f5e	nop
140069f5f	jmp	0x14006a04e
140069f64	mov	ecx, 1
140069f69	mov	edx, 0x13
140069f6e	call	0x145d992bb
140069f73	nop
140069f74	jmp	0x14006a04e
140069f79	mov	ecx, 1
140069f7e	mov	edx, 9
140069f83	call	0x145d992bb
140069f88	nop
140069f89	jmp	0x14006a04e
140069f8e	mov	ecx, 1
140069f93	mov	edx, 1
140069f98	call	0x145d992bb
140069f9d	nop
140069f9e	jmp	0x14006a04e
140069fa3	lea	rcx, [rip + 0x5d65d16]
140069faa	call	0x145d995b0
140069faf	nop
140069fb0	jmp	0x14006a04e
140069fb5	mov	ecx, 1
140069fba	mov	edx, 5
140069fbf	call	0x145d992bb
140069fc4	nop
140069fc5	jmp	0x14006a04e
140069fca	mov	ecx, 1
140069fcf	mov	edx, 3
140069fd4	call	0x145d992bb
140069fd9	nop
140069fda	jmp	0x14006a04e
140069fdc	mov	ecx, 1
140069fe1	mov	edx, 8
140069fe6	call	0x145d992bb
140069feb	nop
140069fec	jmp	0x14006a04e
140069fee	mov	ecx, 1
140069ff3	mov	edx, 3
140069ff8	call	0x145d992bb
140069ffd	nop
140069ffe	jmp	0x14006a04e
14006a000	mov	ecx, 1
14006a005	mov	edx, 0xc
14006a00a	call	0x145d992bb
14006a00f	nop
14006a010	jmp	0x14006a04e
14006a012	mov	ecx, 1
14006a017	mov	edx, 4
14006a01c	call	0x145d992bb
14006a021	nop
14006a022	jmp	0x14006a04e
14006a024	mov	ecx, 1
14006a029	jmp	0x140069e8f
14006a02e	mov	byte ptr [rbp + 0x20d], 0
14006a035	mov	byte ptr [rbp + 0x20c], 1
14006a03c	mov	qword ptr [rbp + 0x20], rdi
14006a040	mov	ecx, 1
14006a045	mov	rdx, rsi
14006a048	call	0x145d992bb
14006a04d	nop
14006a04e	ud2
