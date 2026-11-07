140027ba0	push	rbp
140027ba1	push	r15
140027ba3	push	r14
140027ba5	push	r13
140027ba7	push	r12
140027ba9	push	rsi
140027baa	push	rdi
140027bab	push	rbx
140027bac	sub	rsp, 0xf18
140027bb3	lea	rbp, [rsp + 0x80]
140027bbb	movdqa	xmmword ptr [rbp + 0xe80], xmm13
140027bc4	movdqa	xmmword ptr [rbp + 0xe70], xmm12
140027bcd	movdqa	xmmword ptr [rbp + 0xe60], xmm11
140027bd6	movdqa	xmmword ptr [rbp + 0xe50], xmm10
140027bdf	movdqa	xmmword ptr [rbp + 0xe40], xmm9
140027be8	movdqa	xmmword ptr [rbp + 0xe30], xmm8
140027bf1	movdqa	xmmword ptr [rbp + 0xe20], xmm7
140027bf9	movdqa	xmmword ptr [rbp + 0xe10], xmm6
140027c01	mov	qword ptr [rbp + 0xe08], 0xfffffffffffffffe
140027c0c	cmp	qword ptr [rdx + 0x90], 0
140027c14	je	0x140027dae
140027c1a	mov	r15, rdx
140027c1d	mov	rax, qword ptr [rdx + 0x78]
140027c21	mov	rcx, qword ptr [rdx + 0x80]
140027c28	movabs	rdx, 0x7c00e6ba9569de82
140027c32	xor	r8d, r8d
140027c35	movdqa	xmm6, xmmword ptr [rip + 0x5d759b3]
140027c3d	pcmpeqd	xmm0, xmm0
140027c41	movdqa	xmm7, xmmword ptr [rip + 0x5d759b7]
140027c49	and	rdx, rcx
140027c4c	movdqu	xmm1, xmmword ptr [rax + rdx]
140027c51	movdqa	xmm2, xmm1
140027c55	pcmpeqb	xmm2, xmm6
140027c59	pmovmskb	r9d, xmm2
140027c5e	test	r9d, r9d
140027c61	je	0x140027ca0
140027c63	tzcnt	r10d, r9d
140027c68	add	r10, rdx
140027c6b	and	r10, rcx
140027c6e	neg	r10
140027c71	lea	r10, [r10 + r10*2]
140027c75	movdqu	xmm2, xmmword ptr [rax + r10*8 - 0x18]
140027c7c	pcmpeqb	xmm2, xmm7
140027c80	pmovmskb	r11d, xmm2
140027c85	cmp	r11d, 0xffff
140027c8c	je	0x140027cbf
140027c8e	lea	r10d, [r9 - 1]
140027c92	and	r10w, r9w
140027c96	mov	r9d, r10d
140027c99	jne	0x140027c63
140027c9b	nop	dword ptr [rax + rax]
140027ca0	pcmpeqb	xmm1, xmm0
140027ca4	pmovmskb	r9d, xmm1
140027ca9	test	r9d, r9d
140027cac	jne	0x140027dae
140027cb2	add	rdx, r8
140027cb5	add	rdx, 0x10
140027cb9	add	r8, 0x10
140027cbd	jmp	0x140027c49
140027cbf	lea	rdx, [rax + r10*8]
140027cc3	mov	rdx, qword ptr [rdx - 8]
140027cc7	mov	r8, qword ptr [r15 + 0x218]
140027cce	cmp	rdx, r8
140027cd1	jae	0x140027dae
140027cd7	mov	r9, qword ptr [r15 + 0x210]
140027cde	mov	r10, qword ptr [r9 + rdx*8]
140027ce2	test	r10, r10
140027ce5	je	0x140027dae
140027ceb	mov	rdx, qword ptr [r15 + 0x1e0]
140027cf2	not	r10
140027cf5	imul	r10, r10, 0x38
140027cf9	cmp	byte ptr [rdx + r10 + 0x30], 0
140027cff	je	0x140027dae
140027d05	add	r10, rdx
140027d08	mov	r10, qword ptr [r10 + 0x10]
140027d0c	cmp	byte ptr [r10 + 0x1c0], 1
140027d14	jne	0x140029ed3
140027d1a	cmp	qword ptr [r10 + 0xb0], -1
140027d22	je	0x140027d2f
140027d24	cmp	qword ptr [r10 + 0x40], 0
140027d29	je	0x140029ed3
140027d2f	lea	r14, [r15 + 0x1d8]
140027d36	movabs	r10, 0x7c00e6ba9569de82
140027d40	xor	r11d, r11d
140027d43	pcmpeqd	xmm0, xmm0
140027d47	and	r10, rcx
140027d4a	movdqu	xmm1, xmmword ptr [rax + r10]
140027d50	movdqa	xmm2, xmm1
140027d54	pcmpeqb	xmm2, xmm6
140027d58	pmovmskb	esi, xmm2
140027d5c	test	esi, esi
140027d5e	je	0x140027d91
140027d60	tzcnt	edi, esi
140027d64	add	rdi, r10
140027d67	and	rdi, rcx
140027d6a	neg	rdi
140027d6d	lea	rdi, [rdi + rdi*2]
140027d71	movdqu	xmm2, xmmword ptr [rax + rdi*8 - 0x18]
140027d77	pcmpeqb	xmm2, xmm7
140027d7b	pmovmskb	ebx, xmm2
140027d7f	cmp	ebx, 0xffff
140027d85	je	0x140027de6
140027d87	lea	edi, [rsi - 1]
140027d8a	and	di, si
140027d8d	mov	esi, edi
140027d8f	jne	0x140027d60
140027d91	pcmpeqb	xmm1, xmm0
140027d95	pmovmskb	esi, xmm1
140027d99	test	esi, esi
140027d9b	jne	0x140027fa6
140027da1	add	r10, r11
140027da4	add	r10, 0x10
140027da8	add	r11, 0x10
140027dac	jmp	0x140027d47
140027dae	lea	rax, [rbp + 0xe06]
140027db5	mov	qword ptr [rbp + 0x190], rax
140027dbc	lea	rax, [rip + 0x4fd553d]
140027dc3	mov	qword ptr [rbp + 0x198], rax
140027dca	lea	rcx, [rip + 0x5d75f27]
140027dd1	lea	r8, [rip + 0x5d7d8a8]
140027dd8	lea	rdx, [rbp + 0x190]
140027ddf	call	0x145d99830
140027de4	ud2
140027de6	lea	rax, [rax + rdi*8]
140027dea	mov	rax, qword ptr [rax - 8]
140027dee	cmp	rax, r8
140027df1	jae	0x140027fa6
140027df7	mov	rax, qword ptr [r9 + rax*8]
140027dfb	test	rax, rax
140027dfe	je	0x140027fa6
140027e04	not	rax
140027e07	imul	rax, rax, 0x38
140027e0b	cmp	byte ptr [rdx + rax + 0x30], 0
140027e10	je	0x140027fa6
140027e16	add	rdx, rax
140027e19	mov	rax, qword ptr [rdx + 0x10]
140027e1d	mov	ecx, dword ptr [r15 + 0x5b0]
140027e24	mov	dword ptr [rdx + 0x2c], ecx
140027e27	mov	rcx, qword ptr [rax + 0x40]
140027e2b	mov	qword ptr [rbp + 0xc30], rcx
140027e32	movdqu	xmm0, xmmword ptr [rax + 0x30]
140027e37	movdqa	xmmword ptr [rbp + 0xc20], xmm0
140027e3f	mov	qword ptr [rax + 0x30], 0
140027e47	mov	qword ptr [rax + 0x38], 8
140027e4f	mov	qword ptr [rax + 0x40], 0
140027e57	cmp	qword ptr [r15 + 0x90], 0
140027e5f	je	0x140027fde
140027e65	mov	rax, qword ptr [r15 + 0x78]
140027e69	mov	rcx, qword ptr [r15 + 0x80]
140027e70	movabs	rdx, 0x7c00e6ba9569de82
140027e7a	xor	r8d, r8d
140027e7d	pcmpeqd	xmm0, xmm0
140027e81	and	rdx, rcx
140027e84	movdqu	xmm1, xmmword ptr [rax + rdx]
140027e89	movdqa	xmm2, xmm1
140027e8d	pcmpeqb	xmm2, xmm6
140027e91	pmovmskb	r9d, xmm2
140027e96	test	r9d, r9d
140027e99	je	0x140027ed3
140027e9b	tzcnt	r10d, r9d
140027ea0	add	r10, rdx
140027ea3	and	r10, rcx
140027ea6	neg	r10
140027ea9	lea	r10, [r10 + r10*2]
140027ead	movdqu	xmm2, xmmword ptr [rax + r10*8 - 0x18]
140027eb4	pcmpeqb	xmm2, xmm7
140027eb8	pmovmskb	r11d, xmm2
140027ebd	cmp	r11d, 0xffff
140027ec4	je	0x140027ef2
140027ec6	lea	r10d, [r9 - 1]
140027eca	and	r10w, r9w
140027ece	mov	r9d, r10d
140027ed1	jne	0x140027e9b
140027ed3	pcmpeqb	xmm1, xmm0
140027ed7	pmovmskb	r9d, xmm1
140027edc	test	r9d, r9d
140027edf	jne	0x140027fde
140027ee5	add	rdx, r8
140027ee8	add	rdx, 0x10
140027eec	add	r8, 0x10
140027ef0	jmp	0x140027e81
140027ef2	lea	rax, [rax + r10*8]
140027ef6	mov	rax, qword ptr [rax - 8]
140027efa	cmp	rax, qword ptr [r15 + 0x218]
140027f01	jae	0x140027fde
140027f07	mov	rcx, qword ptr [r15 + 0x210]
140027f0e	mov	rcx, qword ptr [rcx + rax*8]
140027f12	test	rcx, rcx
140027f15	je	0x140027fde
140027f1b	mov	rax, qword ptr [r15 + 0x1e0]
140027f22	not	rcx
140027f25	imul	rcx, rcx, 0x38
140027f29	cmp	byte ptr [rax + rcx + 0x30], 0
140027f2e	je	0x140027fde
140027f34	mov	qword ptr [rbp + 0xc10], r14
140027f3b	add	rax, rcx
140027f3e	mov	rsi, qword ptr [rax + 0x10]
140027f42	mov	ecx, dword ptr [r15 + 0x5b0]
140027f49	mov	dword ptr [rax + 0x2c], ecx
140027f4c	lea	rdx, [rsi + 0xb0]
140027f53	lea	rcx, [rbp + 0xb20]
140027f5a	mov	r8d, 0xd8
140027f60	call	0x145bfa0e7
140027f65	mov	qword ptr [rsi + 0xb0], 0xffffffffffffffff
140027f70	mov	rsi, qword ptr [rbp + 0xb20]
140027f77	lea	r12, [rip + 0x5d79892]
140027f7e	cmp	rsi, -1
140027f82	je	0x140028021
140027f88	lea	rdx, [rbp + 0xb28]
140027f8f	lea	rcx, [rbp + 0x190]
140027f96	mov	r8d, 0xd0
140027f9c	call	0x145bfa0e7
140027fa1	jmp	0x140028377
140027fa6	lea	rax, [rbp + 0xe06]
140027fad	mov	qword ptr [rbp + 0x190], rax
140027fb4	lea	rax, [rip + 0x4fd5345]
140027fbb	mov	qword ptr [rbp + 0x198], rax
140027fc2	lea	rcx, [rip + 0x5d75d2f]
140027fc9	lea	r8, [rip + 0x5d7d6c8]
140027fd0	lea	rdx, [rbp + 0x190]
140027fd7	call	0x145d99830
140027fdc	ud2
140027fde	lea	rax, [rbp + 0xe06]
140027fe5	mov	qword ptr [rbp + 0x190], rax
140027fec	lea	rax, [rip + 0x4fd530d]
140027ff3	mov	qword ptr [rbp + 0x198], rax
140027ffa	mov	byte ptr [rbp + 0xdf4], 1
140028001	lea	rcx, [rip + 0x5d75cf0]
140028008	lea	r8, [rip + 0x5d7d6a1]
14002800f	lea	rdx, [rbp + 0x190]
140028016	call	0x145d99830
14002801b	nop
14002801c	jmp	0x14002a0a6
140028021	mov	qword ptr [rbp + 0xd80], 0
14002802c	mov	qword ptr [rbp + 0xd88], 8
140028037	mov	qword ptr [rbp + 0xd90], 0
140028042	mov	qword ptr [rbp + 0xc70], r12
140028049	lea	rax, [rip + 0x5d7d580]
140028050	mov	qword ptr [rbp + 0xc78], rax
140028057	mov	qword ptr [rbp + 0xc80], r15
14002805e	call	0x140002200
140028063	mov	ecx, 0x9c0
140028068	mov	edx, 8
14002806d	call	0x1400021c0
140028072	test	rax, rax
140028075	je	0x14002a096
14002807b	mov	qword ptr [rbp + 0x8c0], 0x68
140028086	mov	qword ptr [rbp + 0x8c8], rax
14002808d	lea	rcx, [rbp + 0x8d0]
140028094	mov	qword ptr [rbp + 0x8d0], 0
14002809f	mov	qword ptr [rbp + 0x1a0], rax
1400280a6	mov	qword ptr [rbp + 0x190], rcx
1400280ad	mov	qword ptr [rbp + 0x198], 0
1400280b8	lea	rcx, [rbp + 0xc70]
1400280bf	lea	rdx, [rbp + 0x190]
1400280c6	call	0x14012b0e0
1400280cb	nop
1400280cc	movdqu	xmm0, xmmword ptr [rbp + 0x8c0]
1400280d4	movdqa	xmmword ptr [rbp + 0xdb0], xmm0
1400280dc	mov	rax, qword ptr [rbp + 0x8d0]
1400280e3	mov	qword ptr [rbp + 0xdc0], rax
1400280ea	lea	rcx, [rbp + 0x190]
1400280f1	mov	rdx, r15
1400280f4	call	0x140722fc0
1400280f9	nop
1400280fa	mov	rax, qword ptr [rbp + 0x190]
140028101	mov	rcx, qword ptr [rbp + 0x198]
140028108	mov	rdx, qword ptr [rbp + 0x1a0]
14002810f	lea	rdx, [rdx + rdx*2]
140028113	shl	rdx, 4
140028117	add	rdx, rcx
14002811a	mov	qword ptr [rbp + 0x190], rcx
140028121	mov	qword ptr [rbp + 0x198], rcx
140028128	mov	qword ptr [rbp + 0x1a0], rax
14002812f	mov	qword ptr [rbp + 0x1a8], rdx
140028136	lea	rcx, [rbp + 0xc70]
14002813d	lea	rdx, [rbp + 0x190]
140028144	call	0x140046f50
140028149	nop
14002814a	lea	rcx, [rbp + 0x8c0]
140028151	call	0x140724af0
140028156	nop
140028157	call	0x145ba3770
14002815c	nop
14002815d	mov	rdi, rax
140028160	cmp	byte ptr [rax + 0x10], 1
140028164	jne	0x140029fd9
14002816a	mov	rcx, qword ptr [rdi]
14002816d	mov	rax, qword ptr [rdi + 8]
140028171	mov	qword ptr [rbp + 0xdf8], rax
140028178	mov	qword ptr [rbp + 0xdd8], rcx
14002817f	lea	rax, [rcx + 1]
140028183	mov	qword ptr [rdi], rax
140028186	mov	rax, qword ptr [rbp + 0xd90]
14002818d	mov	qword ptr [rbp + 0x1a0], rax
140028194	movups	xmm0, xmmword ptr [rbp + 0xd80]
14002819b	movaps	xmmword ptr [rbp + 0x190], xmm0
1400281a2	movaps	xmm0, xmmword ptr [rbp + 0xdb0]
1400281a9	movups	xmmword ptr [rbp + 0x1a8], xmm0
1400281b0	mov	rax, qword ptr [rbp + 0xdc0]
1400281b7	mov	qword ptr [rbp + 0x1b8], rax
1400281be	movups	xmm0, xmmword ptr [rbp + 0xc70]
1400281c5	movaps	xmmword ptr [rbp + 0x1c0], xmm0
1400281cc	mov	rax, qword ptr [rbp + 0xc80]
1400281d3	mov	qword ptr [rbp + 0x1d0], rax
1400281da	movups	xmm0, xmmword ptr [rbp + 0x8c0]
1400281e1	movups	xmmword ptr [rbp + 0x1d8], xmm0
1400281e8	mov	rax, qword ptr [rbp + 0x8d0]
1400281ef	mov	qword ptr [rbp + 0x1e8], rax
1400281f6	mov	rax, qword ptr [rbp + 0x1e0]
1400281fd	mov	qword ptr [rbp + 0x910], rax
140028204	mov	rax, qword ptr [rbp + 0x1e8]
14002820b	mov	qword ptr [rbp + 0x918], rax
140028212	mov	rax, qword ptr [rbp + 0x1d0]
140028219	mov	qword ptr [rbp + 0x900], rax
140028220	mov	rax, qword ptr [rbp + 0x1d8]
140028227	mov	qword ptr [rbp + 0x908], rax
14002822e	movaps	xmm0, xmmword ptr [rbp + 0x1b0]
140028235	movaps	xmmword ptr [rbp + 0x8e0], xmm0
14002823c	movaps	xmm0, xmmword ptr [rbp + 0x190]
140028243	movaps	xmm1, xmmword ptr [rbp + 0x1a0]
14002824a	movaps	xmm2, xmmword ptr [rbp + 0x1c0]
140028251	movaps	xmmword ptr [rbp + 0x8f0], xmm2
140028258	movaps	xmmword ptr [rbp + 0x8d0], xmm1
14002825f	movaps	xmmword ptr [rbp + 0x8c0], xmm0
140028266	lea	rcx, [rbp + 0xb20]
14002826d	call	0x140007c10
140028272	nop
140028273	movaps	xmm0, xmmword ptr [rbp + 0x910]
14002827a	movaps	xmmword ptr [rbp + 0xb70], xmm0
140028281	movaps	xmm0, xmmword ptr [rbp + 0x900]
140028288	movaps	xmmword ptr [rbp + 0xb60], xmm0
14002828f	movaps	xmm0, xmmword ptr [rbp + 0x8c0]
140028296	movdqa	xmm1, xmmword ptr [rbp + 0x8d0]
14002829e	movdqa	xmm2, xmmword ptr [rbp + 0x8e0]
1400282a6	movaps	xmm3, xmmword ptr [rbp + 0x8f0]
1400282ad	movaps	xmmword ptr [rbp + 0xb50], xmm3
1400282b4	movdqa	xmmword ptr [rbp + 0xb40], xmm2
1400282bc	movdqa	xmmword ptr [rbp + 0xb30], xmm1
1400282c4	movaps	xmmword ptr [rbp + 0xb20], xmm0
1400282cb	mov	qword ptr [rbp + 0xb80], 0
1400282d6	mov	qword ptr [rbp + 0xb88], 8
1400282e1	xorps	xmm0, xmm0
1400282e4	movaps	xmmword ptr [rbp + 0xb90], xmm0
1400282eb	mov	qword ptr [rbp + 0xba0], 8
1400282f6	movups	xmmword ptr [rbp + 0xba8], xmm0
1400282fd	mov	qword ptr [rbp + 0xbb8], 8
140028308	mov	qword ptr [rbp + 0xbc0], 0
140028313	movups	xmm0, xmmword ptr [rip + 0x5d75f76]
14002831a	movups	xmmword ptr [rbp + 0xbd8], xmm0
140028321	movdqu	xmm0, xmmword ptr [rip + 0x5d75f57]
140028329	movdqu	xmmword ptr [rbp + 0xbc8], xmm0
140028331	mov	rax, qword ptr [rbp + 0xdd8]
140028338	mov	qword ptr [rbp + 0xbe8], rax
14002833f	mov	rax, qword ptr [rbp + 0xdf8]
140028346	mov	qword ptr [rbp + 0xbf0], rax
14002834d	mov	rsi, qword ptr [rbp + 0xb20]
140028354	lea	rdx, [rbp + 0xb28]
14002835b	lea	rcx, [rbp + 0x190]
140028362	mov	r8d, 0xd0
140028368	call	0x145bfa0e7
14002836d	cmp	rsi, -1
140028371	je	0x140029fb9
140028377	mov	qword ptr [rbp + 0xc70], rsi
14002837e	lea	rcx, [rbp + 0xc78]
140028385	lea	rdx, [rbp + 0x190]
14002838c	mov	r8d, 0xd0
140028392	call	0x145bfa0e7
140028397	mov	rax, qword ptr [rbp + 0xc20]
14002839e	mov	qword ptr [rbp + 0xd70], rax
1400283a5	imul	rdx, qword ptr [rbp + 0xc30], 0x38
1400283ad	mov	rax, qword ptr [rbp + 0xc28]
1400283b4	lea	rcx, [rax + rdx]
1400283b8	mov	qword ptr [rbp + 0xd58], rcx
1400283bf	lea	rcx, [r15 + 0x40]
1400283c3	mov	qword ptr [rbp + 0xc60], rcx
1400283ca	lea	rcx, [r15 + 0x5a8]
1400283d1	mov	qword ptr [rbp + 0xc18], rcx
1400283d8	lea	rcx, [rax + 0x38]
1400283dc	add	rdx, -0x38
1400283e0	movd	xmm8, dword ptr [rip + 0x5d74eb7]
1400283e9	pcmpeqd	xmm9, xmm9
1400283ee	movdqa	xmm10, xmmword ptr [rip + 0x5d75359]
1400283f7	movdqa	xmm11, xmmword ptr [rip + 0x5d75360]
140028400	movdqa	xmm12, xmmword ptr [rip + 0x5d75367]
140028409	movdqa	xmm13, xmmword ptr [rip + 0x5d7536e]
140028412	mov	qword ptr [rbp + 0xd60], rax
140028419	mov	qword ptr [rbp + 0xdd8], rax
140028420	mov	qword ptr [rbp + 0xdd0], r15
140028427	jmp	0x140028456
140028429	mov	r15, qword ptr [rbp + 0xdd0]
140028430	lea	r12, [rip + 0x5d793d9]
140028437	nop	word ptr [rax + rax]
140028440	mov	rcx, qword ptr [rbp + 0xd98]
140028447	add	rcx, 0x38
14002844b	mov	rdx, qword ptr [rbp + 0xc50]
140028452	add	rdx, -0x38
140028456	mov	rax, qword ptr [rbp + 0xdd8]
14002845d	cmp	rax, qword ptr [rbp + 0xd58]
140028464	je	0x1400296e6
14002846a	lea	r8, [rax + 0x38]
14002846e	mov	qword ptr [rbp + 0xdd8], r8
140028475	mov	r13, qword ptr [rax]
140028478	cmp	r13, -1
14002847c	je	0x1400296f2
140028482	mov	qword ptr [rbp + 0xc50], rdx
140028489	mov	qword ptr [rbp + 0xd98], rcx
140028490	mov	ecx, dword ptr [rax + 8]
140028493	mov	qword ptr [rbp + 0xdf8], rcx
14002849a	mov	r8d, ecx
14002849d	shr	r8d, 0x10
1400284a1	movzx	r12d, byte ptr [rax + 0xc]
1400284a6	movzx	ecx, byte ptr [rax + 0xd]
1400284aa	movzx	ebx, byte ptr [rax + 0xe]
1400284ae	movzx	esi, byte ptr [rax + 0xf]
1400284b2	mov	r10, qword ptr [rax + 0x10]
1400284b6	mov	r9, r10
1400284b9	shr	r9, 0x20
1400284bd	mov	rdx, r10
1400284c0	shr	rdx, 0x28
1400284c4	mov	rdi, r10
1400284c7	shr	rdi, 0x30
1400284cb	mov	r14, qword ptr [rax + 0x18]
1400284cf	mov	qword ptr [rbp + 0xda0], r14
1400284d6	mov	r11, qword ptr [rax + 0x20]
1400284da	mov	qword ptr [rbp + 0xd78], r11
1400284e1	mov	r11, qword ptr [rax + 0x28]
1400284e5	mov	qword ptr [rbp + 0xd68], r11
1400284ec	mov	rax, qword ptr [rax + 0x30]
1400284f0	mov	qword ptr [rbp + 0xc58], rax
1400284f7	mov	r14, r13
1400284fa	movabs	r15, 0x8000000000000000
140028504	xor	r14, r15
140028507	test	r13, r13
14002850a	mov	r15d, 2
140028510	cmovns	r14, r15
140028514	lea	r15, [rip + 0x5d805a5]
14002851b	mov	rax, r13
14002851e	movsxd	r13, dword ptr [r15 + r14*4]
140028522	add	r13, r15
140028525	mov	byte ptr [rbp + 0xda8], r12b
14002852c	movzx	r12d, r12b
140028530	movzx	r15d, cl
140028534	movzx	r14d, bl
140028538	movzx	r11d, sil
14002853c	mov	qword ptr [rbp + 0xde8], r11
140028543	jmp	r13
140028546	shl	r12, 0x20
14002854a	shl	r15, 0x28
14002854e	or	r15, r12
140028551	shl	r14, 0x30
140028555	or	r14, r15
140028558	mov	rax, qword ptr [rbp + 0xde8]
14002855f	shl	rax, 0x38
140028563	or	rax, r14
140028566	add	rax, qword ptr [rbp + 0xdf8]
14002856d	mov	qword ptr [rbp + 0xde8], rax
140028574	mov	r15, qword ptr [rbp + 0xdd0]
14002857b	mov	rcx, r15
14002857e	mov	rdx, qword ptr [rbp + 0xd78]
140028585	mov	qword ptr [rbp + 0xdf8], r10
14002858c	mov	r8, r10
14002858f	mov	r9, qword ptr [rbp + 0xda0]
140028596	call	0x14001d920
14002859b	nop
14002859c	mov	rdx, qword ptr [rbp + 0xde8]
1400285a3	test	rdx, rdx
1400285a6	lea	r12, [rip + 0x5d79263]
1400285ad	jne	0x1400289cc
1400285b3	jmp	0x140028440
1400285b8	mov	byte ptr [rsp + 0x30], sil
1400285bd	mov	byte ptr [rsp + 0x28], bl
1400285c1	mov	byte ptr [rsp + 0x20], cl
1400285c5	lea	rsi, [rbp + 0x190]
1400285cc	mov	rcx, rsi
1400285cf	mov	rdx, qword ptr [rbp + 0xdf8]
1400285d6	movzx	r9d, byte ptr [rbp + 0xda8]
1400285de	call	0x140722b60
1400285e3	nop
1400285e4	mov	r15, qword ptr [rbp + 0xdd0]
1400285eb	lea	r12, [rip + 0x5d7921e]
1400285f2	mov	rcx, r15
1400285f5	lea	rdx, [rbp + 0xc70]
1400285fc	mov	r8, rsi
1400285ff	call	0x14001eb10
140028604	nop
140028605	jmp	0x140028440
14002860a	mov	qword ptr [rbp + 0xda8], rax
140028611	shl	r12, 0x20
140028615	shl	r15, 0x28
140028619	or	r15, r12
14002861c	shl	r14, 0x30
140028620	or	r14, r15
140028623	mov	rdx, qword ptr [rbp + 0xde8]
14002862a	shl	rdx, 0x38
14002862e	or	rdx, r14
140028631	add	rdx, qword ptr [rbp + 0xdf8]
140028638	mov	rax, qword ptr [rbp + 0xda0]
14002863f	mov	qword ptr [rbp + 0x190], rax
140028646	mov	rax, qword ptr [rbp + 0xd78]
14002864d	mov	qword ptr [rbp + 0x198], rax
140028654	mov	rax, qword ptr [rbp + 0xd68]
14002865b	mov	qword ptr [rbp + 0x1a0], rax
140028662	lea	rcx, [rbp + 0x190]
140028669	mov	qword ptr [rsp + 0x20], rcx
14002866e	lea	rcx, [rbp + 0xcb8]
140028675	mov	qword ptr [rbp + 0xde8], rdx
14002867c	mov	r8, r10
14002867f	mov	r9, qword ptr [rbp + 0xc58]
140028686	call	0x14001bec0
14002868b	nop
14002868c	mov	r15, qword ptr [rbp + 0xdd0]
140028693	mov	rdx, qword ptr [rbp + 0xcc0]
14002869a	mov	r8, qword ptr [rbp + 0xcc8]
1400286a1	mov	rcx, r15
1400286a4	call	0x14001b9a0
1400286a9	nop
1400286aa	mov	rdx, qword ptr [rbp + 0xda8]
1400286b1	test	rdx, rdx
1400286b4	lea	r12, [rip + 0x5d79155]
1400286bb	je	0x140028440
1400286c1	mov	r8d, 1
1400286c7	mov	rcx, qword ptr [rbp + 0xde8]
1400286ce	jmp	0x1400289d9
1400286d3	mov	rax, qword ptr [rbp + 0xdf8]
1400286da	mov	word ptr [rbp + 0x8c0], ax
1400286e1	mov	word ptr [rbp + 0x8c2], r8w
1400286e9	movzx	eax, byte ptr [rbp + 0xda8]
1400286f0	mov	byte ptr [rbp + 0x8c4], al
1400286f6	mov	byte ptr [rbp + 0x8c5], cl
1400286fc	mov	byte ptr [rbp + 0x8c6], bl
140028702	mov	byte ptr [rbp + 0x8c7], sil
140028709	mov	dword ptr [rbp + 0x8c8], r10d
140028710	and	dil, 1
140028714	mov	byte ptr [rsp + 0x28], dil
140028719	and	dl, 1
14002871c	mov	byte ptr [rsp + 0x20], dl
140028720	and	r9b, 1
140028724	lea	rsi, [rbp + 0x190]
14002872b	mov	rcx, rsi
14002872e	mov	r15, qword ptr [rbp + 0xdd0]
140028735	mov	rdx, r15
140028738	lea	r8, [rbp + 0x8c0]
14002873f	call	0x140728300
140028744	nop
140028745	lea	r12, [rip + 0x5d790c4]
14002874c	mov	rcx, r15
14002874f	lea	rdx, [rbp + 0xc70]
140028756	mov	r8, rsi
140028759	call	0x14001eb10
14002875e	nop
14002875f	jmp	0x140028440
140028764	lea	rcx, [rbp + 0xd80]
14002876b	call	0x1458a83b0
140028770	nop
140028771	mov	r15, qword ptr [rbp + 0xdd0]
140028778	lea	r12, [rip + 0x5d79091]
14002877f	lea	rbx, [rbp + 0x190]
140028786	mov	byte ptr [rbp + 0xdf7], 1
14002878d	mov	rcx, rbx
140028790	call	0x1458a8bd0
140028795	nop
140028796	mov	rax, qword ptr [rbp + 0x190]
14002879d	cmp	rax, -1
1400287a1	je	0x140028ff0
1400287a7	mov	qword ptr [rbp + 0xde8], rax
1400287ae	mov	rax, qword ptr [rbp + 0x198]
1400287b5	mov	qword ptr [rbp + 0xdf8], rax
1400287bc	mov	rdi, qword ptr [rbp + 0x1a0]
1400287c3	mov	byte ptr [rbp + 0xdf6], 1
1400287ca	call	0x14523b3d0
1400287cf	nop
1400287d0	mov	byte ptr [rbp + 0xdf6], 1
1400287d7	mov	rcx, rbx
1400287da	mov	rdx, rax
1400287dd	call	0x1458a8d00
1400287e2	nop
1400287e3	mov	qword ptr [rbp + 0xdb0], rbx
1400287ea	lea	rax, [rip - 0x26711]
1400287f1	mov	qword ptr [rbp + 0xdb8], rax
1400287f8	lea	rcx, [rbp + 0x8c0]
1400287ff	lea	rdx, [rip + 0x5d7d042]
140028806	lea	r8, [rbp + 0xdb0]
14002880d	call	0x145bcce30
140028812	nop
140028813	mov	rdx, qword ptr [rbp + 0x190]
14002881a	test	rdx, rdx
14002881d	mov	rsi, qword ptr [rbp + 0xdf8]
140028824	je	0x140028838
140028826	mov	rcx, qword ptr [rbp + 0x198]
14002882d	mov	r8d, 1
140028833	call	0x1400021d0
140028838	movdqu	xmm0, xmmword ptr [rbp + 0x8c0]
140028840	movdqa	xmmword ptr [rbp + 0xdb0], xmm0
140028848	mov	rax, qword ptr [rbp + 0x8d0]
14002884f	mov	qword ptr [rbp + 0xdc0], rax
140028856	mov	r9, qword ptr [rbp + 0xdb8]
14002885d	mov	byte ptr [rbp + 0xde6], 1
140028864	mov	qword ptr [rsp + 0x20], rax
140028869	lea	rcx, [rbp + 0x8c0]
140028870	mov	rdx, rsi
140028873	mov	r8, rdi
140028876	call	0x145ba6d40
14002887b	nop
14002887c	mov	byte ptr [rbp + 0x190], 1
140028883	mov	byte ptr [rbp + 0xde5], 1
14002888a	mov	rcx, rbx
14002888d	mov	rdx, rsi
140028890	mov	r8, rdi
140028893	call	0x145bae140
140028898	nop
140028899	test	rax, rax
14002889c	je	0x140029055
1400288a2	mov	rdx, qword ptr [rbp + 0xd80]
1400288a9	test	rdx, rdx
1400288ac	je	0x140029093
1400288b2	mov	rcx, qword ptr [rbp + 0xd88]
1400288b9	mov	r8d, 1
1400288bf	mov	rsi, rax
1400288c2	call	0x1400021d0
1400288c7	mov	rax, rsi
1400288ca	jmp	0x140029093
1400288cf	mov	r14, qword ptr [rbp + 0xdf8]
1400288d6	cmp	r14b, 6
1400288da	jne	0x140028b3c
1400288e0	lea	rcx, [rbp + 0x190]
1400288e7	call	0x140724f80
1400288ec	nop
1400288ed	mov	r15, qword ptr [rbp + 0xdd0]
1400288f4	lea	r12, [rip + 0x5d78f15]
1400288fb	mov	rsi, qword ptr [rbp + 0xcc8]
140028902	test	rsi, rsi
140028905	je	0x140028dc8
14002890b	mov	rdi, qword ptr [rbp + 0xcc0]
140028912	add	rdi, 0x20
140028916	jmp	0x14002892d
140028918	nop	dword ptr [rax + rax]
140028920	add	rdi, 0x30
140028924	dec	rsi
140028927	je	0x140028dc8
14002892d	mov	rdx, qword ptr [rdi - 0x20]
140028931	test	rdx, rdx
140028934	je	0x140028945
140028936	mov	rcx, qword ptr [rdi - 0x18]
14002893a	mov	r8d, 1
140028940	call	0x1400021d0
140028945	mov	rdx, qword ptr [rdi - 8]
140028949	test	rdx, rdx
14002894c	je	0x140028920
14002894e	mov	rcx, qword ptr [rdi]
140028951	mov	r8d, 1
140028957	call	0x1400021d0
14002895c	jmp	0x140028920
14002895e	shl	r12, 0x20
140028962	shl	r15, 0x28
140028966	or	r15, r12
140028969	shl	r14, 0x30
14002896d	or	r14, r15
140028970	mov	rax, qword ptr [rbp + 0xde8]
140028977	shl	rax, 0x38
14002897b	or	rax, r14
14002897e	add	rax, qword ptr [rbp + 0xdf8]
140028985	mov	qword ptr [rbp + 0xde8], rax
14002898c	mov	r8, qword ptr [rbp + 0xd78]
140028993	and	r8b, 1
140028997	mov	qword ptr [rbp + 0xdf8], r10
14002899e	mov	rcx, r10
1400289a1	mov	rdx, qword ptr [rbp + 0xda0]
1400289a8	call	0x140725d40
1400289ad	nop
1400289ae	mov	rdx, qword ptr [rbp + 0xde8]
1400289b5	test	rdx, rdx
1400289b8	mov	r15, qword ptr [rbp + 0xdd0]
1400289bf	lea	r12, [rip + 0x5d78e4a]
1400289c6	je	0x140028440
1400289cc	mov	r8d, 1
1400289d2	mov	rcx, qword ptr [rbp + 0xdf8]
1400289d9	call	0x1400021d0
1400289de	jmp	0x140028440
1400289e3	mov	r14, r10
1400289e6	shr	r14, 0x38
1400289ea	mov	rax, qword ptr [rbp + 0xdf8]
1400289f1	mov	word ptr [rbp + 0xdb0], ax
1400289f8	mov	word ptr [rbp + 0xdb2], r8w
140028a00	movzx	eax, byte ptr [rbp + 0xda8]
140028a07	mov	byte ptr [rbp + 0xdb4], al
140028a0d	mov	byte ptr [rbp + 0xdb5], cl
140028a13	mov	byte ptr [rbp + 0xdb6], bl
140028a19	mov	byte ptr [rbp + 0xdb7], sil
140028a20	mov	dword ptr [rbp + 0xdb8], r10d
140028a27	mov	byte ptr [rbp + 0xdbc], r9b
140028a2e	mov	byte ptr [rbp + 0xdbd], dl
140028a34	mov	byte ptr [rbp + 0xdbe], dil
140028a3b	mov	byte ptr [rbp + 0xdbf], r14b
140028a42	mov	rax, qword ptr [rbp + 0xda0]
140028a49	mov	qword ptr [rbp + 0xdc0], rax
140028a50	lea	rcx, [rbp - 0x40]
140028a54	mov	rdx, qword ptr [rbp + 0xd68]
140028a5b	mov	r8, qword ptr [rbp + 0xc58]
140028a62	call	0x1458a84b0
140028a67	nop
140028a68	mov	r15, qword ptr [rbp + 0xdd0]
140028a6f	lea	rbx, [rbp + 0x190]
140028a76	cmp	qword ptr [rbp - 0x40], -1
140028a7b	je	0x140028f79
140028a81	mov	r8d, 0x1d0
140028a87	lea	rcx, [rbp + 0x8c0]
140028a8e	lea	rdx, [rbp - 0x40]
140028a92	call	0x145bfa0e7
140028a97	cmp	qword ptr [r15 + 0x90], 0
140028a9f	lea	r12, [rip + 0x5d78d6a]
140028aa6	je	0x140029928
140028aac	mov	rax, qword ptr [r15 + 0x78]
140028ab0	mov	rcx, qword ptr [r15 + 0x80]
140028ab7	xor	edx, edx
140028ab9	movabs	r8, 0x443db8921fdb017b
140028ac3	and	r8, rcx
140028ac6	movdqu	xmm0, xmmword ptr [rax + r8]
140028acc	movdqa	xmm1, xmm0
140028ad0	pcmpeqb	xmm1, xmm10
140028ad5	pmovmskb	r9d, xmm1
140028ada	test	r9d, r9d
140028add	je	0x140028b1c
140028adf	tzcnt	r10d, r9d
140028ae4	add	r10, r8
140028ae7	and	r10, rcx
140028aea	neg	r10
140028aed	lea	r10, [r10 + r10*2]
140028af1	movdqu	xmm1, xmmword ptr [rax + r10*8 - 0x18]
140028af8	pcmpeqb	xmm1, xmm11
140028afd	pmovmskb	r11d, xmm1
140028b02	cmp	r11d, 0xffff
140028b09	je	0x140028e28
140028b0f	lea	r10d, [r9 - 1]
140028b13	and	r10w, r9w
140028b17	mov	r9d, r10d
140028b1a	jne	0x140028adf
140028b1c	pcmpeqb	xmm0, xmm9
140028b21	pmovmskb	r9d, xmm0
140028b26	test	r9d, r9d
140028b29	jne	0x140029928
140028b2f	add	r8, rdx
140028b32	add	r8, 0x10
140028b36	add	rdx, 0x10
140028b3a	jmp	0x140028ac3
140028b3c	xor	esi, esi
140028b3e	xor	r13d, r13d
140028b41	mov	r15, qword ptr [rbp + 0xdd0]
140028b48	lea	r12, [rip + 0x5d78cc1]
140028b4f	lea	rbx, [rbp + 0x190]
140028b56	nop	word ptr cs:[rax + rax]
140028b60	cmp	r13, 0x3dc0
140028b67	je	0x140028440
140028b6d	mov	rax, r13
140028b70	mov	rdi, rsi
140028b73	add	r13, 0x98
140028b7a	inc	rsi
140028b7d	cmp	byte ptr [rax + r12 + 0x91], r14b
140028b85	jne	0x140028b60
140028b87	mov	rcx, qword ptr [rax + r12 + 0x18]
140028b8c	lea	rdx, [rip + 0x5d7ff51]
140028b93	movsxd	rcx, dword ptr [rdx + rcx*4]
140028b97	add	rcx, rdx
140028b9a	jmp	rcx
140028b9c	mov	r8, qword ptr [rax + r12 + 0x20]
140028ba1	mov	r9, qword ptr [rax + r12 + 0x28]
140028ba6	mov	rcx, rbx
140028ba9	mov	rdx, r15
140028bac	call	0x140723a60
140028bb1	nop
140028bb2	cmp	qword ptr [rbp + 0x190], -1
140028bba	je	0x140028d5c
140028bc0	mov	rax, qword ptr [rbp + 0x1a0]
140028bc7	mov	qword ptr [rbp + 0x8d0], rax
140028bce	movups	xmm0, xmmword ptr [rbp + 0x190]
140028bd5	movaps	xmmword ptr [rbp + 0x8c0], xmm0
140028bdc	jmp	0x140028d80
140028be1	call	0x140002200
140028be6	mov	ecx, 1
140028beb	mov	edx, 1
140028bf0	call	0x1400021c0
140028bf5	test	rax, rax
140028bf8	je	0x14002a084
140028bfe	mov	byte ptr [rax], 0x30
140028c01	mov	qword ptr [rbp + 0x8c0], 1
140028c0c	mov	qword ptr [rbp + 0x8c8], rax
140028c13	mov	qword ptr [rbp + 0x8d0], 1
140028c1e	jmp	0x140028d80
140028c23	mov	r9d, 5
140028c29	mov	rcx, rbx
140028c2c	mov	rdx, r15
140028c2f	lea	r8, [rip + 0x5d764ee]
140028c36	call	0x140723a60
140028c3b	nop
140028c3c	mov	rax, qword ptr [rbp + 0x190]
140028c43	cmp	rax, -1
140028c47	je	0x140028d38
140028c4d	mov	qword ptr [rbp + 0xde8], rax
140028c54	mov	rcx, qword ptr [rbp + 0x198]
140028c5b	mov	rdx, qword ptr [rbp + 0x1a0]
140028c62	mov	qword ptr [rbp + 0xda0], rcx
140028c69	call	0x145bdb8d0
140028c6e	nop
140028c6f	mov	r14, rax
140028c72	mov	rdx, qword ptr [rbp + 0xde8]
140028c79	test	rdx, rdx
140028c7c	je	0x140028c90
140028c7e	mov	r8d, 1
140028c84	mov	rcx, qword ptr [rbp + 0xda0]
140028c8b	call	0x1400021d0
140028c90	movdqa	xmm0, xmm8
140028c95	test	r14b, 1
140028c99	jne	0x140028d3d
140028c9f	shr	r14, 0x20
140028ca3	movd	xmm0, r14d
140028ca8	jmp	0x140028d3d
140028cad	mov	rcx, r12
140028cb0	mov	r12, qword ptr [rax + r12 + 0x30]
140028cb5	mov	r14, qword ptr [rax + rcx + 0x38]
140028cba	mov	qword ptr [rsp + 0x20], 1
140028cc3	mov	r9d, 1
140028cc9	mov	rcx, rbx
140028ccc	mov	rdx, r14
140028ccf	xor	r8d, r8d
140028cd2	call	0x1400539a0
140028cd7	mov	r15, qword ptr [rbp + 0x198]
140028cde	cmp	byte ptr [rbp + 0x190], 0
140028ce5	jne	0x140029fa4
140028ceb	mov	rbx, qword ptr [rbp + 0x1a0]
140028cf2	test	r14, r14
140028cf5	je	0x140028d05
140028cf7	mov	rcx, rbx
140028cfa	mov	rdx, r12
140028cfd	mov	r8, r14
140028d00	call	0x145bfa0e7
140028d05	mov	qword ptr [rbp + 0x8c0], r15
140028d0c	mov	qword ptr [rbp + 0x8c8], rbx
140028d13	mov	qword ptr [rbp + 0x8d0], r14
140028d1a	mov	r15, qword ptr [rbp + 0xdd0]
140028d21	lea	r12, [rip + 0x5d78ae8]
140028d28	lea	rbx, [rbp + 0x190]
140028d2f	mov	r14, qword ptr [rbp + 0xdf8]
140028d36	jmp	0x140028d80
140028d38	movdqa	xmm0, xmm8
140028d3d	movdqa	xmm1, xmm8
140028d42	subss	xmm1, xmm0
140028d46	lea	rcx, [rbp + 0x8c0]
140028d4d	call	0x14001c700
140028d52	nop
140028d53	mov	r14, qword ptr [rbp + 0xdf8]
140028d5a	jmp	0x140028d80
140028d5c	mov	qword ptr [rbp + 0x8c0], 0
140028d67	mov	qword ptr [rbp + 0x8c8], 1
140028d72	mov	qword ptr [rbp + 0x8d0], 0
140028d7d	nop	dword ptr [rax]
140028d80	mov	r8, qword ptr [rbp + 0x8c8]
140028d87	mov	r9, qword ptr [rbp + 0x8d0]
140028d8e	mov	rcx, r15
140028d91	mov	rdx, rdi
140028d94	mov	qword ptr [rbp + 0xde8], r8
140028d9b	call	0x14001d920
140028da0	nop
140028da1	mov	rdx, qword ptr [rbp + 0x8c0]
140028da8	test	rdx, rdx
140028dab	je	0x140028b60
140028db1	mov	r8d, 1
140028db7	mov	rcx, qword ptr [rbp + 0xde8]
140028dbe	call	0x1400021d0
140028dc3	jmp	0x140028b60
140028dc8	mov	rax, qword ptr [rbp + 0xcb8]
140028dcf	test	rax, rax
140028dd2	je	0x140028dee
140028dd4	mov	rcx, qword ptr [rbp + 0xcc0]
140028ddb	shl	rax, 4
140028ddf	lea	rdx, [rax + rax*2]
140028de3	mov	r8d, 8
140028de9	call	0x1400021d0
140028dee	mov	rax, qword ptr [rbp + 0x1a0]
140028df5	lea	rcx, [rbp + 0xcb8]
140028dfc	mov	qword ptr [rcx + 0x10], rax
140028e00	movdqu	xmm0, xmmword ptr [rbp + 0x190]
140028e08	movdqu	xmmword ptr [rcx], xmm0
140028e0c	mov	rdx, qword ptr [rbp + 0xcc0]
140028e13	mov	r8, qword ptr [rbp + 0xcc8]
140028e1a	mov	rcx, r15
140028e1d	call	0x14001b9a0
140028e22	nop
140028e23	jmp	0x140028440
140028e28	lea	rax, [rax + r10*8]
140028e2c	mov	rax, qword ptr [rax - 8]
140028e30	cmp	rax, qword ptr [r15 + 0x218]
140028e37	jae	0x140029928
140028e3d	mov	rcx, qword ptr [r15 + 0x210]
140028e44	mov	rcx, qword ptr [rcx + rax*8]
140028e48	test	rcx, rcx
140028e4b	je	0x140029928
140028e51	mov	rax, qword ptr [r15 + 0x1e0]
140028e58	not	rcx
140028e5b	imul	rcx, rcx, 0x38
140028e5f	cmp	byte ptr [rax + rcx + 0x30], 0
140028e64	je	0x140029928
140028e6a	add	rax, rcx
140028e6d	mov	rcx, qword ptr [rax + 0x10]
140028e71	mov	dword ptr [rbp + 0x190], 0x10
140028e7b	mov	byte ptr [rbp + 0xe05], 1
140028e82	mov	rdx, rbx
140028e85	call	0x1401838a0
140028e8a	nop
140028e8b	mov	rax, qword ptr [rbp + 0xc60]
140028e92	mov	qword ptr [rbp + 0x1a8], rax
140028e99	mov	rax, qword ptr [rbp + 0xc18]
140028ea0	mov	qword ptr [rbp + 0x1b0], rax
140028ea7	mov	qword ptr [rbp + 0x190], 0
140028eb2	mov	qword ptr [rbp + 0x198], 8
140028ebd	mov	qword ptr [rbp + 0x1a0], 0
140028ec8	mov	rcx, rbx
140028ecb	lea	rdx, [rip + 0x5d74f76]
140028ed2	call	0x140005a70
140028ed7	nop
140028ed8	mov	rdi, rax
140028edb	mov	rdx, qword ptr [rbp + 0x190]
140028ee2	test	rdx, rdx
140028ee5	je	0x140028efd
140028ee7	mov	rcx, qword ptr [rbp + 0x198]
140028eee	shl	rdx, 3
140028ef2	mov	r8d, 8
140028ef8	call	0x1400021d0
140028efd	mov	r8d, 0x1d0
140028f03	mov	rcx, rbx
140028f06	lea	rdx, [rbp - 0x40]
140028f0a	call	0x145bfa0e7
140028f0f	mov	esi, dword ptr [r15 + 0x5b0]
140028f16	mov	byte ptr [rbp + 0xdf5], 0
140028f1d	mov	rcx, r15
140028f20	call	0x144e65ff0
140028f25	nop
140028f26	mov	qword ptr [rbp + 0xd80], rdi
140028f2d	mov	byte ptr [rbp + 0xdf5], 0
140028f34	mov	rcx, qword ptr [rbp + 0xc10]
140028f3b	mov	rdx, rdi
140028f3e	mov	r8, qword ptr [rbp + 0xc60]
140028f45	lea	r9, [rbp + 0xd80]
140028f4c	call	0x1400e99b0
140028f51	nop
140028f52	mov	rdi, rax
140028f55	cmp	byte ptr [rax + 0x30], 1
140028f59	jne	0x140029139
140028f5f	mov	byte ptr [rbp + 0xdf5], 0
140028f66	mov	rcx, rdi
140028f69	xor	edx, edx
140028f6b	mov	r8, rbx
140028f6e	call	0x144e7e940
140028f73	nop
140028f74	jmp	0x140029150
140028f79	mov	rcx, qword ptr [rbp - 0x38]
140028f7d	mov	rdx, qword ptr [rbp - 0x30]
140028f81	call	0x1458ec450
140028f86	nop
140028f87	mov	qword ptr [rbp + 0x8c0], rax
140028f8e	mov	qword ptr [rbp + 0x8c8], rdx
140028f95	lea	rax, [rbp + 0xdb0]
140028f9c	mov	qword ptr [rbp + 0x190], rax
140028fa3	lea	rax, [rip - 0x26eca]
140028faa	mov	qword ptr [rbp + 0x198], rax
140028fb1	lea	rax, [rbp + 0x8c0]
140028fb8	mov	qword ptr [rbp + 0x1a0], rax
140028fbf	lea	rax, [rip - 0x26f06]
140028fc6	mov	qword ptr [rbp + 0x1a8], rax
140028fcd	lea	rcx, [rbp + 0xbf8]
140028fd4	lea	rdx, [rip + 0x5d7c779]
140028fdb	mov	r8, rbx
140028fde	call	0x145bcce30
140028fe3	nop
140028fe4	lea	r12, [rip + 0x5d78825]
140028feb	jmp	0x140029312
140028ff0	mov	byte ptr [rbp + 0xdf7], 1
140028ff7	mov	edx, 0x18
140028ffc	lea	rcx, [rip + 0x5d7c883]
140029003	call	0x1458ec450
140029008	nop
140029009	mov	rdi, rdx
14002900c	test	rdx, rdx
14002900f	js	0x1400299b5
140029015	test	rdi, rdi
140029018	je	0x140029537
14002901e	mov	r14, rax
140029021	call	0x140002200
140029026	mov	edx, 1
14002902b	mov	rcx, rdi
14002902e	call	0x1400021c0
140029033	test	rax, rax
140029036	je	0x14002a0a8
14002903c	mov	rcx, rax
14002903f	mov	rdx, r14
140029042	mov	rsi, rax
140029045	mov	r8, rdi
140029048	call	0x145bfa0e7
14002904d	mov	rax, rsi
140029050	jmp	0x14002953c
140029055	mov	rax, qword ptr [rbp + 0xd90]
14002905c	mov	qword ptr [rbp + 0x1a0], rax
140029063	movdqu	xmm0, xmmword ptr [rbp + 0xd80]
14002906b	movdqa	xmmword ptr [rbp + 0x190], xmm0
140029073	mov	byte ptr [rbp + 0xde5], 0
14002907a	lea	rcx, [rbp + 0x8c0]
140029081	mov	rdx, rbx
140029084	call	0x14008ddc0
140029089	nop
14002908a	test	rax, rax
14002908d	je	0x140029482
140029093	mov	qword ptr [rbp + 0xd50], rax
14002909a	lea	rax, [rip + 0x5d7c78f]
1400290a1	mov	qword ptr [rbp + 0x190], rax
1400290a8	mov	qword ptr [rbp + 0x198], 5
1400290b3	lea	rax, [rbp + 0xd50]
1400290ba	mov	qword ptr [rbp + 0x1a0], rax
1400290c1	lea	rax, [rip + 0x5d7c748]
1400290c8	mov	qword ptr [rbp + 0x1a8], rax
1400290cf	mov	qword ptr [rsp + 0x20], 1
1400290d8	mov	r8d, 0x15
1400290de	lea	rcx, [rbp + 0xc38]
1400290e5	lea	rdx, [rip + 0x5d7c785]
1400290ec	mov	r9, rbx
1400290ef	call	0x1458ec4b0
1400290f4	nop
1400290f5	mov	rax, qword ptr [rbp + 0xd50]
1400290fc	mov	ecx, eax
1400290fe	and	ecx, 3
140029101	lea	edx, [rcx - 2]
140029104	cmp	edx, 2
140029107	jb	0x1400294dd
14002910d	test	rcx, rcx
140029110	je	0x1400294dd
140029116	dec	rax
140029119	mov	qword ptr [rbp + 0x198], rax
140029120	mov	byte ptr [rbp + 0x190], 3
140029127	lea	rcx, [rbp + 0x198]
14002912e	call	0x145bdf7c0
140029133	nop
140029134	jmp	0x1400294dd
140029139	mov	r8, qword ptr [rdi + 8]
14002913d	mov	rcx, qword ptr [rdi + 0x10]
140029141	mov	rdx, rbx
140029144	call	0x145bfa0ed
140029149	mov	dword ptr [rdi + 0x28], esi
14002914c	mov	byte ptr [rdi + 0x30], 1
140029150	mov	dword ptr [rdi + 0x2c], esi
140029153	mov	byte ptr [rbp + 0xe05], 0
14002915a	mov	rcx, rbx
14002915d	call	0x140062330
140029162	nop
140029163	cmp	qword ptr [r15 + 0x90], 0
14002916b	je	0x140029f68
140029171	mov	rax, qword ptr [r15 + 0x78]
140029175	mov	rcx, qword ptr [r15 + 0x80]
14002917c	xor	edx, edx
14002917e	movabs	r8, 0x397c766565084ed2
140029188	and	r8, rcx
14002918b	movdqu	xmm0, xmmword ptr [rax + r8]
140029191	movdqa	xmm1, xmm0
140029195	pcmpeqb	xmm1, xmm12
14002919a	pmovmskb	r9d, xmm1
14002919f	test	r9d, r9d
1400291a2	je	0x1400291dd
1400291a4	tzcnt	r10d, r9d
1400291a9	add	r10, r8
1400291ac	and	r10, rcx
1400291af	neg	r10
1400291b2	lea	r10, [r10 + r10*2]
1400291b6	movdqu	xmm1, xmmword ptr [rax + r10*8 - 0x18]
1400291bd	pcmpeqb	xmm1, xmm13
1400291c2	pmovmskb	r11d, xmm1
1400291c7	cmp	r11d, 0xffff
1400291ce	je	0x1400291fd
1400291d0	lea	r10d, [r9 - 1]
1400291d4	and	r10w, r9w
1400291d8	mov	r9d, r10d
1400291db	jne	0x1400291a4
1400291dd	pcmpeqb	xmm0, xmm9
1400291e2	pmovmskb	r9d, xmm0
1400291e7	test	r9d, r9d
1400291ea	jne	0x140029f68
1400291f0	add	r8, rdx
1400291f3	add	r8, 0x10
1400291f7	add	rdx, 0x10
1400291fb	jmp	0x140029188
1400291fd	lea	rax, [rax + r10*8]
140029201	mov	rax, qword ptr [rax - 8]
140029205	cmp	rax, qword ptr [r15 + 0x218]
14002920c	jae	0x140029f68
140029212	mov	rcx, qword ptr [r15 + 0x210]
140029219	mov	rcx, qword ptr [rcx + rax*8]
14002921d	test	rcx, rcx
140029220	je	0x140029f68
140029226	mov	rax, qword ptr [r15 + 0x1e0]
14002922d	not	rcx
140029230	imul	rcx, rcx, 0x38
140029234	cmp	byte ptr [rax + rcx + 0x30], 0
140029239	je	0x140029f68
14002923f	add	rax, rcx
140029242	mov	rsi, qword ptr [rax + 0x10]
140029246	mov	ecx, dword ptr [r15 + 0x5b0]
14002924d	mov	dword ptr [rax + 0x2c], ecx
140029250	mov	rdx, qword ptr [rsi]
140029253	test	rdx, rdx
140029256	je	0x140029267
140029258	mov	rcx, qword ptr [rsi + 8]
14002925c	mov	r8d, 1
140029262	call	0x1400021d0
140029267	mov	rdx, qword ptr [rsi + 0x18]
14002926b	test	rdx, rdx
14002926e	je	0x14002927f
140029270	mov	rcx, qword ptr [rsi + 0x20]
140029274	mov	r8d, 1
14002927a	call	0x1400021d0
14002927f	movdqu	xmm0, xmmword ptr [rbp + 0x190]
140029287	movdqu	xmm1, xmmword ptr [rbp + 0x1a0]
14002928f	movdqu	xmm2, xmmword ptr [rbp + 0x1b0]
140029297	movups	xmm3, xmmword ptr [rbp + 0x1c0]
14002929e	movups	xmmword ptr [rsi + 0x30], xmm3
1400292a2	movdqu	xmmword ptr [rsi + 0x20], xmm2
1400292a7	movdqu	xmmword ptr [rsi + 0x10], xmm1
1400292ac	movdqu	xmmword ptr [rsi], xmm0
1400292b0	lea	rax, [rip + 0x5d7c489]
1400292b7	mov	qword ptr [rbp + 0x190], rax
1400292be	mov	qword ptr [rbp + 0x198], 4
1400292c9	lea	rax, [rbp + 0xdb0]
1400292d0	mov	qword ptr [rbp + 0x1a0], rax
1400292d7	lea	rax, [rip + 0x5d75e8a]
1400292de	mov	qword ptr [rbp + 0x1a8], rax
1400292e5	mov	byte ptr [rbp + 0xe05], 0
1400292ec	mov	qword ptr [rsp + 0x20], 1
1400292f5	mov	r8d, 0x10
1400292fb	lea	rcx, [rbp + 0xbf8]
140029302	lea	rdx, [rip + 0x5d7c43b]
140029309	mov	r9, rbx
14002930c	call	0x1458ec4b0
140029311	nop
140029312	mov	r14, qword ptr [rbp + 0xbf8]
140029319	mov	r13, qword ptr [rbp + 0xc00]
140029320	cmp	qword ptr [r15 + 0x90], 0
140029328	je	0x14002996b
14002932e	mov	rsi, qword ptr [rbp + 0xc08]
140029335	mov	rax, qword ptr [r15 + 0x78]
140029339	mov	rcx, qword ptr [r15 + 0x80]
140029340	xor	edx, edx
140029342	movabs	r8, 0x7c00e6ba9569de82
14002934c	and	r8, rcx
14002934f	movdqu	xmm0, xmmword ptr [rax + r8]
140029355	movdqa	xmm1, xmm0
140029359	pcmpeqb	xmm1, xmm6
14002935d	pmovmskb	r9d, xmm1
140029362	test	r9d, r9d
140029365	je	0x14002939f
140029367	tzcnt	r10d, r9d
14002936c	add	r10, r8
14002936f	and	r10, rcx
140029372	neg	r10
140029375	lea	r10, [r10 + r10*2]
140029379	movdqu	xmm1, xmmword ptr [rax + r10*8 - 0x18]
140029380	pcmpeqb	xmm1, xmm7
140029384	pmovmskb	r11d, xmm1
140029389	cmp	r11d, 0xffff
140029390	je	0x1400293bf
140029392	lea	r10d, [r9 - 1]
140029396	and	r10w, r9w
14002939a	mov	r9d, r10d
14002939d	jne	0x140029367
14002939f	pcmpeqb	xmm0, xmm9
1400293a4	pmovmskb	r9d, xmm0
1400293a9	test	r9d, r9d
1400293ac	jne	0x14002996b
1400293b2	add	r8, rdx
1400293b5	add	r8, 0x10
1400293b9	add	rdx, 0x10
1400293bd	jmp	0x14002934c
1400293bf	lea	rax, [rax + r10*8]
1400293c3	mov	rax, qword ptr [rax - 8]
1400293c7	cmp	rax, qword ptr [r15 + 0x218]
1400293ce	jae	0x14002996b
1400293d4	mov	rcx, qword ptr [r15 + 0x210]
1400293db	mov	rcx, qword ptr [rcx + rax*8]
1400293df	test	rcx, rcx
1400293e2	je	0x14002996b
1400293e8	mov	rax, qword ptr [r15 + 0x1e0]
1400293ef	not	rcx
1400293f2	imul	rcx, rcx, 0x38
1400293f6	cmp	byte ptr [rax + rcx + 0x30], 0
1400293fb	je	0x14002996b
140029401	add	rax, rcx
140029404	mov	rdi, qword ptr [rax + 0x10]
140029408	mov	ecx, dword ptr [r15 + 0x5b0]
14002940f	mov	dword ptr [rax + 0x2c], ecx
140029412	mov	rdx, qword ptr [rdi + 0x78]
140029416	test	rdx, rdx
140029419	mov	rbx, qword ptr [rbp + 0xd68]
140029420	je	0x140029434
140029422	mov	rcx, qword ptr [rdi + 0x80]
140029429	mov	r8d, 1
14002942f	call	0x1400021d0
140029434	mov	qword ptr [rdi + 0x78], r14
140029438	mov	qword ptr [rdi + 0x80], r13
14002943f	mov	qword ptr [rdi + 0x88], rsi
140029446	mov	rdx, qword ptr [rbp + 0xd78]
14002944d	test	rdx, rdx
140029450	je	0x140029460
140029452	mov	r8d, 1
140029458	mov	rcx, rbx
14002945b	call	0x1400021d0
140029460	mov	rdx, qword ptr [rbp + 0xdb0]
140029467	test	rdx, rdx
14002946a	je	0x140028440
140029470	mov	rcx, qword ptr [rbp + 0xdb8]
140029477	mov	r8d, 1
14002947d	jmp	0x1400289d9
140029482	lea	rax, [rip + 0x5d7c2b7]
140029489	mov	qword ptr [rbp + 0x190], rax
140029490	mov	qword ptr [rbp + 0x198], 4
14002949b	lea	rax, [rbp + 0xdb0]
1400294a2	mov	qword ptr [rbp + 0x1a0], rax
1400294a9	lea	rax, [rip + 0x5d75cb8]
1400294b0	mov	qword ptr [rbp + 0x1a8], rax
1400294b7	mov	qword ptr [rsp + 0x20], 1
1400294c0	mov	r8d, 0x10
1400294c6	lea	rcx, [rbp + 0xc38]
1400294cd	lea	rdx, [rip + 0x5d7c38d]
1400294d4	mov	r9, rbx
1400294d7	call	0x1458ec4b0
1400294dc	nop
1400294dd	mov	rdx, qword ptr [rbp + 0x8c0]
1400294e4	test	rdx, rdx
1400294e7	mov	rsi, qword ptr [rbp + 0xdf8]
1400294ee	je	0x140029502
1400294f0	mov	rcx, qword ptr [rbp + 0x8c8]
1400294f7	mov	r8d, 1
1400294fd	call	0x1400021d0
140029502	mov	rdx, qword ptr [rbp + 0xdb0]
140029509	test	rdx, rdx
14002950c	je	0x140029520
14002950e	mov	rcx, qword ptr [rbp + 0xdb8]
140029515	mov	r8d, 1
14002951b	call	0x1400021d0
140029520	mov	rdx, qword ptr [rbp + 0xde8]
140029527	test	rdx, rdx
14002952a	je	0x140029576
14002952c	mov	r8d, 1
140029532	mov	rcx, rsi
140029535	jmp	0x140029571
140029537	mov	eax, 1
14002953c	mov	qword ptr [rbp + 0xc38], rdi
140029543	mov	qword ptr [rbp + 0xc68], rax
14002954a	mov	qword ptr [rbp + 0xc40], rax
140029551	mov	qword ptr [rbp + 0xc48], rdi
140029558	mov	rdx, qword ptr [rbp + 0xd80]
14002955f	test	rdx, rdx
140029562	je	0x140029576
140029564	mov	rcx, qword ptr [rbp + 0xd88]
14002956b	mov	r8d, 1
140029571	call	0x1400021d0
140029576	mov	rbx, qword ptr [rbp + 0xc38]
14002957d	mov	r14, qword ptr [rbp + 0xc40]
140029584	cmp	qword ptr [r15 + 0x90], 0
14002958c	je	0x14002969c
140029592	mov	rsi, qword ptr [rbp + 0xc48]
140029599	mov	rax, qword ptr [r15 + 0x78]
14002959d	mov	rcx, qword ptr [r15 + 0x80]
1400295a4	xor	edx, edx
1400295a6	movabs	r8, 0x7c00e6ba9569de82
1400295b0	and	r8, rcx
1400295b3	movdqu	xmm0, xmmword ptr [rax + r8]
1400295b9	movdqa	xmm1, xmm0
1400295bd	pcmpeqb	xmm1, xmm6
1400295c1	pmovmskb	r9d, xmm1
1400295c6	test	r9d, r9d
1400295c9	je	0x140029603
1400295cb	tzcnt	r10d, r9d
1400295d0	add	r10, r8
1400295d3	and	r10, rcx
1400295d6	neg	r10
1400295d9	lea	r10, [r10 + r10*2]
1400295dd	movdqu	xmm1, xmmword ptr [rax + r10*8 - 0x18]
1400295e4	pcmpeqb	xmm1, xmm7
1400295e8	pmovmskb	r11d, xmm1
1400295ed	cmp	r11d, 0xffff
1400295f4	je	0x140029623
1400295f6	lea	r10d, [r9 - 1]
1400295fa	and	r10w, r9w
1400295fe	mov	r9d, r10d
140029601	jne	0x1400295cb
140029603	pcmpeqb	xmm0, xmm9
140029608	pmovmskb	r9d, xmm0
14002960d	test	r9d, r9d
140029610	jne	0x14002969c
140029616	add	r8, rdx
140029619	add	r8, 0x10
14002961d	add	rdx, 0x10
140029621	jmp	0x1400295b0
140029623	lea	rax, [rax + r10*8]
140029627	mov	rax, qword ptr [rax - 8]
14002962b	cmp	rax, qword ptr [r15 + 0x218]
140029632	jae	0x14002969c
140029634	mov	rcx, qword ptr [r15 + 0x210]
14002963b	mov	rcx, qword ptr [rcx + rax*8]
14002963f	test	rcx, rcx
140029642	je	0x14002969c
140029644	mov	rax, qword ptr [r15 + 0x1e0]
14002964b	not	rcx
14002964e	imul	rcx, rcx, 0x38
140029652	cmp	byte ptr [rax + rcx + 0x30], 0
140029657	je	0x14002969c
140029659	add	rax, rcx
14002965c	mov	rdi, qword ptr [rax + 0x10]
140029660	mov	ecx, dword ptr [r15 + 0x5b0]
140029667	mov	dword ptr [rax + 0x2c], ecx
14002966a	mov	rdx, qword ptr [rdi + 0x78]
14002966e	test	rdx, rdx
140029671	je	0x140029685
140029673	mov	rcx, qword ptr [rdi + 0x80]
14002967a	mov	r8d, 1
140029680	call	0x1400021d0
140029685	mov	qword ptr [rdi + 0x78], rbx
140029689	mov	qword ptr [rdi + 0x80], r14
140029690	mov	qword ptr [rdi + 0x88], rsi
140029697	jmp	0x140028440
14002969c	mov	qword ptr [rbp + 0xdd8], r14
1400296a3	mov	qword ptr [rbp + 0xdf8], rbx
1400296aa	lea	rax, [rbp + 0xe06]
1400296b1	mov	qword ptr [rbp + 0x190], rax
1400296b8	lea	rax, [rip + 0x4fd3c41]
1400296bf	mov	qword ptr [rbp + 0x198], rax
1400296c6	lea	rcx, [rip + 0x5d7462b]
1400296cd	lea	r8, [rip + 0x5d7c024]
1400296d4	lea	rdx, [rbp + 0x190]
1400296db	call	0x145d99830
1400296e0	nop
1400296e1	jmp	0x14002a0a6
1400296e6	mov	rax, qword ptr [rbp + 0xd58]
1400296ed	mov	rcx, rax
1400296f0	jmp	0x140029700
1400296f2	mov	rax, qword ptr [rbp + 0xd58]
1400296f9	mov	rcx, qword ptr [rbp + 0xdd8]
140029700	sub	rax, rcx
140029703	shr	rax, 3
140029707	movabs	rdx, 0x6db6db6db6db6db7
140029711	imul	rdx, rax
140029715	mov	qword ptr [rbp + 0xd98], rdx
14002971c	mov	qword ptr [rbp + 0xdf8], 0
140029727	mov	qword ptr [rbp + 0xdd8], rcx
14002972e	nop
140029730	mov	rax, qword ptr [rbp + 0xdf8]
140029737	cmp	qword ptr [rbp + 0xd98], rax
14002973e	je	0x140029759
140029740	inc	rax
140029743	mov	qword ptr [rbp + 0xdf8], rax
14002974a	lea	rsi, [rcx + 0x38]
14002974e	call	0x140044ab0
140029753	nop
140029754	mov	rcx, rsi
140029757	jmp	0x140029730
140029759	mov	rax, qword ptr [rbp + 0xd70]
140029760	test	rax, rax
140029763	je	0x14002977b
140029765	imul	rdx, rax, 0x38
140029769	mov	r8d, 8
14002976f	mov	rcx, qword ptr [rbp + 0xd60]
140029776	call	0x1400021d0
14002977b	mov	byte ptr [rbp + 0xe07], 1
140029782	lea	rcx, [rbp + 0x190]
140029789	call	0x140722200
14002978e	nop
14002978f	mov	rcx, qword ptr [rbp + 0xcd8]
140029796	mov	rax, qword ptr [rbp + 0xce0]
14002979d	mov	qword ptr [rbp + 0xdd8], rax
1400297a4	mov	qword ptr [rbp + 0xdf8], 0
1400297af	mov	qword ptr [rbp + 0xd98], rcx
1400297b6	nop	word ptr cs:[rax + rax]
1400297c0	mov	rax, qword ptr [rbp + 0xdf8]
1400297c7	cmp	qword ptr [rbp + 0xdd8], rax
1400297ce	je	0x1400297e9
1400297d0	inc	rax
1400297d3	mov	qword ptr [rbp + 0xdf8], rax
1400297da	lea	rsi, [rcx + 0x68]
1400297de	call	0x14008c0d0
1400297e3	nop
1400297e4	mov	rcx, rsi
1400297e7	jmp	0x1400297c0
1400297e9	mov	rax, qword ptr [rbp + 0xcd0]
1400297f0	test	rax, rax
1400297f3	je	0x14002980b
1400297f5	mov	rcx, qword ptr [rbp + 0xcd8]
1400297fc	imul	rdx, rax, 0x68
140029800	mov	r8d, 8
140029806	call	0x1400021d0
14002980b	mov	rax, qword ptr [rbp + 0x1a0]
140029812	lea	rcx, [rbp + 0xcd0]
140029819	mov	qword ptr [rcx + 0x10], rax
14002981d	movdqu	xmm0, xmmword ptr [rbp + 0x190]
140029825	movdqu	xmmword ptr [rcx], xmm0
140029829	mov	byte ptr [rbp + 0xe07], 1
140029830	lea	rcx, [rbp + 0xdb0]
140029837	call	0x1458a8bd0
14002983c	nop
14002983d	mov	rax, qword ptr [rbp + 0xdb0]
140029844	cmp	rax, -1
140029848	je	0x140029902
14002984e	mov	qword ptr [rbp + 0xdf8], rax
140029855	mov	rdx, qword ptr [rbp + 0xdb8]
14002985c	mov	r8, qword ptr [rbp + 0xdc0]
140029863	lea	rcx, [rbp + 0x190]
14002986a	mov	qword ptr [rbp + 0xdd8], rdx
140029871	call	0x145bb6d30
140029876	nop
140029877	mov	rdi, qword ptr [rbp + 0x190]
14002987e	mov	rsi, qword ptr [rbp + 0x198]
140029885	cmp	rdi, 2
140029889	je	0x1400298a4
14002988b	lea	rdx, [rbp + 0x1a0]
140029892	lea	rcx, [rbp + 0x8c0]
140029899	mov	r8d, 0x260
14002989f	call	0x145bfa0e7
1400298a4	mov	rdx, qword ptr [rbp + 0xdf8]
1400298ab	test	rdx, rdx
1400298ae	je	0x1400298c2
1400298b0	mov	r8d, 1
1400298b6	mov	rcx, qword ptr [rbp + 0xdd8]
1400298bd	call	0x1400021d0
1400298c2	cmp	edi, 2
1400298c5	jne	0x1400299d0
1400298cb	mov	eax, esi
1400298cd	and	eax, 3
1400298d0	lea	ecx, [rax - 2]
1400298d3	cmp	ecx, 2
1400298d6	jb	0x140029902
1400298d8	test	rax, rax
1400298db	je	0x140029902
1400298dd	dec	rsi
1400298e0	lea	rcx, [rbp + 0x198]
1400298e7	mov	qword ptr [rbp + 0x198], rsi
1400298ee	mov	byte ptr [rbp + 0x190], 3
1400298f5	mov	byte ptr [rbp + 0xe07], 1
1400298fc	call	0x145bdf7c0
140029901	nop
140029902	mov	qword ptr [rbp + 0xdb0], 0
14002990d	mov	qword ptr [rbp + 0xdb8], 8
140029918	mov	qword ptr [rbp + 0xdc0], 0
140029923	jmp	0x140029a94
140029928	lea	rax, [rbp + 0xe06]
14002992f	mov	qword ptr [rbp + 0x190], rax
140029936	lea	rax, [rip + 0x4fd39c3]
14002993d	mov	qword ptr [rbp + 0x198], rax
140029944	mov	byte ptr [rbp + 0xe05], 1
14002994b	lea	rcx, [rip + 0x5d743a6]
140029952	lea	r8, [rip + 0x5d7bdb7]
140029959	lea	rdx, [rbp + 0x190]
140029960	call	0x145d99830
140029965	nop
140029966	jmp	0x14002a0a6
14002996b	mov	qword ptr [rbp + 0xdd8], r13
140029972	mov	qword ptr [rbp + 0xdf8], r14
140029979	lea	rax, [rbp + 0xe06]
140029980	mov	qword ptr [rbp + 0x190], rax
140029987	lea	rax, [rip + 0x4fd3972]
14002998e	mov	qword ptr [rbp + 0x198], rax
140029995	lea	rcx, [rip + 0x5d7435c]
14002999c	lea	r8, [rip + 0x5d7bdbd]
1400299a3	lea	rdx, [rbp + 0x190]
1400299aa	call	0x145d99830
1400299af	nop
1400299b0	jmp	0x14002a0a6
1400299b5	xor	ecx, ecx
1400299b7	mov	byte ptr [rbp + 0xdf7], 1
1400299be	mov	rdx, qword ptr [rbp + 0xc68]
1400299c5	call	0x145d992bb
1400299ca	nop
1400299cb	jmp	0x14002a0a6
1400299d0	mov	qword ptr [rbp + 0x658], rsi
1400299d7	lea	rcx, [rbp + 0x660]
1400299de	lea	rdx, [rbp + 0x8c0]
1400299e5	mov	r8d, 0x260
1400299eb	call	0x145bfa0e7
1400299f0	mov	qword ptr [rbp + 0x190], 0
1400299fb	mov	qword ptr [rbp + 0x3f0], 0
140029a06	mov	qword ptr [rbp + 0x650], rdi
140029a0d	mov	byte ptr [rbp + 0xe07], 1
140029a14	lea	rcx, [rbp + 0x8c0]
140029a1b	lea	rdx, [rbp + 0x190]
140029a22	call	0x1400a3810
140029a27	nop
140029a28	mov	rdi, qword ptr [rbp + 0x8c8]
140029a2f	mov	rbx, qword ptr [rbp + 0x8d0]
140029a36	lea	rax, [rbp + 0xe06]
140029a3d	mov	qword ptr [rbp + 0x190], rax
140029a44	cmp	rbx, 2
140029a48	jae	0x14002a044
140029a4e	mov	rax, qword ptr [rbp + 0x8c0]
140029a55	lea	rcx, [rbx + rbx*8]
140029a59	lea	rcx, [rdi + rcx*8]
140029a5d	mov	qword ptr [rbp + 0x190], rdi
140029a64	mov	qword ptr [rbp + 0x198], rdi
140029a6b	mov	qword ptr [rbp + 0x1a0], rax
140029a72	mov	qword ptr [rbp + 0x1a8], rcx
140029a79	mov	byte ptr [rbp + 0xde7], 0
140029a80	lea	rcx, [rbp + 0xdb0]
140029a87	lea	rdx, [rbp + 0x190]
140029a8e	call	0x1400472b0
140029a93	nop
140029a94	mov	rsi, qword ptr [rbp + 0xcf8]
140029a9b	test	rsi, rsi
140029a9e	je	0x140029aea
140029aa0	mov	rdi, qword ptr [rbp + 0xcf0]
140029aa7	add	rdi, 0x20
140029aab	jmp	0x140029ab9
140029aad	nop	dword ptr [rax]
140029ab0	add	rdi, 0x38
140029ab4	dec	rsi
140029ab7	je	0x140029aea
140029ab9	mov	rdx, qword ptr [rdi - 0x20]
140029abd	test	rdx, rdx
140029ac0	je	0x140029ad1
140029ac2	mov	rcx, qword ptr [rdi - 0x18]
140029ac6	mov	r8d, 1
140029acc	call	0x1400021d0
140029ad1	mov	rdx, qword ptr [rdi - 8]
140029ad5	test	rdx, rdx
140029ad8	je	0x140029ab0
140029ada	mov	rcx, qword ptr [rdi]
140029add	mov	r8d, 1
140029ae3	call	0x1400021d0
140029ae8	jmp	0x140029ab0
140029aea	lea	rsi, [rbp + 0xce8]
140029af1	mov	rax, qword ptr [rbp + 0xce8]
140029af8	test	rax, rax
140029afb	je	0x140029b13
140029afd	mov	rcx, qword ptr [rbp + 0xcf0]
140029b04	imul	rdx, rax, 0x38
140029b08	mov	r8d, 8
140029b0e	call	0x1400021d0
140029b13	mov	rax, qword ptr [rbp + 0xdc0]
140029b1a	mov	qword ptr [rsi + 0x10], rax
140029b1e	movdqu	xmm0, xmmword ptr [rbp + 0xdb0]
140029b26	movdqu	xmmword ptr [rsi], xmm0
140029b2a	mov	rsi, qword ptr [rbp + 0xd10]
140029b31	test	rsi, rsi
140029b34	je	0x140029b8a
140029b36	mov	rdi, qword ptr [rbp + 0xd08]
140029b3d	add	rdi, 0x20
140029b41	jmp	0x140029b59
140029b43	nop	word ptr cs:[rax + rax]
140029b50	add	rdi, 0x30
140029b54	dec	rsi
140029b57	je	0x140029b8a
140029b59	mov	rdx, qword ptr [rdi - 0x20]
140029b5d	test	rdx, rdx
140029b60	je	0x140029b71
140029b62	mov	rcx, qword ptr [rdi - 0x18]
140029b66	mov	r8d, 1
140029b6c	call	0x1400021d0
140029b71	mov	rdx, qword ptr [rdi - 8]
140029b75	test	rdx, rdx
140029b78	je	0x140029b50
140029b7a	mov	rcx, qword ptr [rdi]
140029b7d	mov	r8d, 1
140029b83	call	0x1400021d0
140029b88	jmp	0x140029b50
140029b8a	mov	rax, qword ptr [rbp + 0xd00]
140029b91	test	rax, rax
140029b94	je	0x140029bb0
140029b96	mov	rcx, qword ptr [rbp + 0xd08]
140029b9d	shl	rax, 4
140029ba1	lea	rdx, [rax + rax*2]
140029ba5	mov	r8d, 8
140029bab	call	0x1400021d0
140029bb0	mov	qword ptr [rbp + 0xd00], 0
140029bbb	mov	qword ptr [rbp + 0xd08], 8
140029bc6	mov	qword ptr [rbp + 0xd10], 0
140029bd1	mov	qword ptr [rbp + 0x190], r12
140029bd8	lea	rax, [rip + 0x5d7b9f1]
140029bdf	mov	qword ptr [rbp + 0x198], rax
140029be6	mov	qword ptr [rbp + 0x1a0], r15
140029bed	mov	byte ptr [rbp + 0xe07], 1
140029bf4	lea	rcx, [rbp + 0x8c0]
140029bfb	lea	rdx, [rbp + 0x190]
140029c02	call	0x1400a84a0
140029c07	nop
140029c08	mov	rsi, qword ptr [rbp + 0xc80]
140029c0f	test	rsi, rsi
140029c12	je	0x140029c52
140029c14	mov	rdi, qword ptr [rbp + 0xc78]
140029c1b	add	rdi, 8
140029c1f	jmp	0x140029c39
140029c21	nop	word ptr cs:[rax + rax]
140029c30	add	rdi, 0x18
140029c34	dec	rsi
140029c37	je	0x140029c52
140029c39	mov	rdx, qword ptr [rdi - 8]
140029c3d	test	rdx, rdx
140029c40	je	0x140029c30
140029c42	mov	rcx, qword ptr [rdi]
140029c45	mov	r8d, 1
140029c4b	call	0x1400021d0
140029c50	jmp	0x140029c30
140029c52	mov	rax, qword ptr [rbp + 0xc70]
140029c59	test	rax, rax
140029c5c	je	0x140029c78
140029c5e	mov	rcx, qword ptr [rbp + 0xc78]
140029c65	shl	rax, 3
140029c69	lea	rdx, [rax + rax*2]
140029c6d	mov	r8d, 8
140029c73	call	0x1400021d0
140029c78	mov	rax, qword ptr [rbp + 0x8d0]
140029c7f	mov	qword ptr [rbp + 0xc80], rax
140029c86	movdqu	xmm0, xmmword ptr [rbp + 0x8c0]
140029c8e	movdqa	xmmword ptr [rbp + 0xc70], xmm0
140029c96	mov	rsi, qword ptr [rbp + 0xcc0]
140029c9d	mov	rdi, qword ptr [rbp + 0xcc8]
140029ca4	mov	byte ptr [rbp + 0xe07], 1
140029cab	call	0x145ba3770
140029cb0	nop
140029cb1	cmp	byte ptr [rax + 0x10], 1
140029cb5	jne	0x140029fff
140029cbb	mov	rcx, qword ptr [rax]
140029cbe	mov	rdx, qword ptr [rax + 8]
140029cc2	lea	r8, [rcx + 1]
140029cc6	mov	qword ptr [rax], r8
140029cc9	movups	xmm0, xmmword ptr [rip + 0x5d745c0]
140029cd0	movaps	xmmword ptr [rbp + 0x1a0], xmm0
140029cd7	movdqu	xmm0, xmmword ptr [rip + 0x5d745a1]
140029cdf	movdqa	xmmword ptr [rbp + 0x190], xmm0
140029ce7	mov	qword ptr [rbp + 0x1b0], rcx
140029cee	mov	qword ptr [rbp + 0x1b8], rdx
140029cf5	test	rdi, rdi
140029cf8	jne	0x14002a025
140029cfe	lea	rax, [rdi + rdi*2]
140029d02	shl	rax, 4
140029d06	add	rax, rsi
140029d09	mov	qword ptr [rbp + 0x8c0], rsi
140029d10	mov	qword ptr [rbp + 0x8c8], rax
140029d17	mov	qword ptr [rbp + 0x8d0], r15
140029d1e	lea	rcx, [rbp + 0x8c0]
140029d25	lea	rdx, [rbp + 0x190]
140029d2c	call	0x14012b4b0
140029d31	nop
140029d32	movaps	xmm0, xmmword ptr [rbp + 0x190]
140029d39	movaps	xmm1, xmmword ptr [rbp + 0x1a0]
140029d40	movaps	xmm2, xmmword ptr [rbp + 0x1b0]
140029d47	movaps	xmmword ptr [rbp + 0x8c0], xmm0
140029d4e	movaps	xmmword ptr [rbp + 0x8d0], xmm1
140029d55	movaps	xmmword ptr [rbp + 0x8e0], xmm2
140029d5c	lea	rcx, [rbp + 0xd18]
140029d63	call	0x1400dd700
140029d68	nop
140029d69	movdqa	xmm0, xmmword ptr [rbp + 0x8c0]
140029d71	movdqa	xmm1, xmmword ptr [rbp + 0x8d0]
140029d79	movdqa	xmm2, xmmword ptr [rbp + 0x8e0]
140029d81	lea	rax, [rbp + 0xd18]
140029d88	movdqu	xmmword ptr [rax + 0x20], xmm2
140029d8d	movdqu	xmmword ptr [rax + 0x10], xmm1
140029d92	movdqu	xmmword ptr [rax], xmm0
140029d96	cmp	qword ptr [r15 + 0x90], 0
140029d9e	je	0x140029f25
140029da4	mov	rax, qword ptr [r15 + 0x78]
140029da8	mov	rcx, qword ptr [r15 + 0x80]
140029daf	movabs	rdx, 0x7c00e6ba9569de82
140029db9	xor	r8d, r8d
140029dbc	pcmpeqd	xmm0, xmm0
140029dc0	and	rdx, rcx
140029dc3	movdqu	xmm1, xmmword ptr [rax + rdx]
140029dc8	movdqa	xmm2, xmm1
140029dcc	pcmpeqb	xmm2, xmm6
140029dd0	pmovmskb	r9d, xmm2
140029dd5	test	r9d, r9d
140029dd8	je	0x140029e12
140029dda	tzcnt	r10d, r9d
140029ddf	add	r10, rdx
140029de2	and	r10, rcx
140029de5	neg	r10
140029de8	lea	r10, [r10 + r10*2]
140029dec	movdqu	xmm2, xmmword ptr [rax + r10*8 - 0x18]
140029df3	pcmpeqb	xmm2, xmm7
140029df7	pmovmskb	r11d, xmm2
140029dfc	cmp	r11d, 0xffff
140029e03	je	0x140029e31
140029e05	lea	r10d, [r9 - 1]
140029e09	and	r10w, r9w
140029e0d	mov	r9d, r10d
140029e10	jne	0x140029dda
140029e12	pcmpeqb	xmm1, xmm0
140029e16	pmovmskb	r9d, xmm1
140029e1b	test	r9d, r9d
140029e1e	jne	0x140029f25
140029e24	add	rdx, r8
140029e27	add	rdx, 0x10
140029e2b	add	r8, 0x10
140029e2f	jmp	0x140029dc0
140029e31	lea	rax, [rax + r10*8]
140029e35	mov	rax, qword ptr [rax - 8]
140029e39	cmp	rax, qword ptr [r15 + 0x218]
140029e40	jae	0x140029f25
140029e46	mov	rcx, qword ptr [r15 + 0x210]
140029e4d	mov	rax, qword ptr [rcx + rax*8]
140029e51	test	rax, rax
140029e54	je	0x140029f25
140029e5a	mov	rsi, qword ptr [r15 + 0x1e0]
140029e61	not	rax
140029e64	imul	rax, rax, 0x38
140029e68	cmp	byte ptr [rsi + rax + 0x30], 0
140029e6d	je	0x140029f25
140029e73	add	rsi, rax
140029e76	mov	rdi, qword ptr [rsi + 0x10]
140029e7a	mov	ebx, dword ptr [r15 + 0x5b0]
140029e81	lea	rcx, [rbp + 0x190]
140029e88	lea	rdx, [rbp + 0xc70]
140029e8f	mov	r8d, 0xd8
140029e95	call	0x145bfa0e7
140029e9a	mov	dword ptr [rsi + 0x2c], ebx
140029e9d	lea	rcx, [rdi + 0xb0]
140029ea4	mov	qword ptr [rbp + 0xdf8], rcx
140029eab	call	0x140007c10
140029eb0	nop
140029eb1	lea	rdx, [rbp + 0x190]
140029eb8	mov	r8d, 0xd8
140029ebe	lea	rcx, [rdi + 0xb0]
140029ec5	call	0x145bfa0e7
140029eca	mov	dword ptr [rsi + 0x2c], ebx
140029ecd	inc	dword ptr [rdi + 0x1b8]
140029ed3	movaps	xmm6, xmmword ptr [rbp + 0xe10]
140029eda	movaps	xmm7, xmmword ptr [rbp + 0xe20]
140029ee1	movaps	xmm8, xmmword ptr [rbp + 0xe30]
140029ee9	movaps	xmm9, xmmword ptr [rbp + 0xe40]
140029ef1	movaps	xmm10, xmmword ptr [rbp + 0xe50]
140029ef9	movaps	xmm11, xmmword ptr [rbp + 0xe60]
140029f01	movaps	xmm12, xmmword ptr [rbp + 0xe70]
140029f09	movaps	xmm13, xmmword ptr [rbp + 0xe80]
140029f11	add	rsp, 0xf18
140029f18	pop	rbx
140029f19	pop	rdi
140029f1a	pop	rsi
140029f1b	pop	r12
140029f1d	pop	r13
140029f1f	pop	r14
140029f21	pop	r15
140029f23	pop	rbp
140029f24	ret
140029f25	lea	rax, [rbp + 0xe06]
140029f2c	mov	qword ptr [rbp + 0x190], rax
140029f33	lea	rax, [rip + 0x4fd33c6]
140029f3a	mov	qword ptr [rbp + 0x198], rax
140029f41	mov	byte ptr [rbp + 0xe07], 1
140029f48	lea	rcx, [rip + 0x5d73da9]
140029f4f	lea	r8, [rip + 0x5d7b78a]
140029f56	lea	rdx, [rbp + 0x190]
140029f5d	call	0x145d99830
140029f62	nop
140029f63	jmp	0x14002a0a6
140029f68	lea	rax, [rbp + 0xe06]
140029f6f	mov	qword ptr [rbp + 0xd80], rax
140029f76	lea	rax, [rip + 0x4fd3383]
140029f7d	mov	qword ptr [rbp + 0xd88], rax
140029f84	lea	rcx, [rip + 0x5d73d6d]
140029f8b	lea	r8, [rip + 0x5d7b796]
140029f92	lea	rdx, [rbp + 0xd80]
140029f99	call	0x145d99830
140029f9e	nop
140029f9f	jmp	0x14002a0a6
140029fa4	mov	rdx, qword ptr [rbp + 0x1a0]
140029fab	mov	rcx, r15
140029fae	call	0x145d992bb
140029fb3	nop
140029fb4	jmp	0x14002a0a6
140029fb9	mov	byte ptr [rbp + 0xe04], 0
140029fc0	mov	byte ptr [rbp + 0xe03], 1
140029fc7	lea	rcx, [rip + 0x5d7b6fa]
140029fce	call	0x145d995b0
140029fd3	nop
140029fd4	jmp	0x14002a0a6
140029fd9	call	0x145bb7390
140029fde	mov	qword ptr [rbp + 0xdf8], rdx
140029fe5	mov	rcx, rax
140029fe8	mov	qword ptr [rdi], rax
140029feb	mov	rax, qword ptr [rbp + 0xdf8]
140029ff2	mov	qword ptr [rdi + 8], rax
140029ff6	mov	byte ptr [rdi + 0x10], 1
140029ffa	jmp	0x140028178
140029fff	mov	byte ptr [rbp + 0xe07], 1
14002a006	mov	rbx, rax
14002a009	call	0x145bb7390
14002a00e	nop
14002a00f	mov	rcx, rax
14002a012	mov	rax, rbx
14002a015	mov	qword ptr [rbx], rcx
14002a018	mov	qword ptr [rbx + 8], rdx
14002a01c	mov	byte ptr [rbx + 0x10], 1
14002a020	jmp	0x140029cc2
14002a025	lea	r8, [rbp + 0x1b0]
14002a02c	lea	rcx, [rbp + 0x190]
14002a033	mov	rdx, rdi
14002a036	mov	r9b, 1
14002a039	call	0x145d809f0
14002a03e	nop
14002a03f	jmp	0x140029cfe
14002a044	cmp	rbx, 0x15
14002a048	jae	0x14002a0b9
14002a04a	lea	rax, [rbx*8]
14002a052	lea	rsi, [rax + rax*8]
14002a056	mov	r14d, 0x48
14002a05c	mov	r15, qword ptr [rbp + 0xdd0]
14002a063	lea	r12, [rip + 0x5d777a6]
14002a06a	lea	rdx, [rdi + r14]
14002a06e	mov	rcx, rdi
14002a071	call	0x1400f13b0
14002a076	add	r14, 0x48
14002a07a	cmp	rsi, r14
14002a07d	jne	0x14002a06a
14002a07f	jmp	0x140029a4e
14002a084	mov	ecx, 1
14002a089	mov	edx, 1
14002a08e	call	0x145d992bb
14002a093	nop
14002a094	jmp	0x14002a0a6
14002a096	mov	ecx, 8
14002a09b	mov	edx, 0x9c0
14002a0a0	call	0x145d992bb
14002a0a5	nop
14002a0a6	ud2
14002a0a8	mov	qword ptr [rbp + 0xc68], rdi
14002a0af	mov	ecx, 1
14002a0b4	jmp	0x1400299b7
14002a0b9	mov	byte ptr [rbp + 0xde7], 1
14002a0c0	lea	r8, [rbp + 0x190]
14002a0c7	mov	rcx, rdi
14002a0ca	mov	rdx, rbx
14002a0cd	call	0x1400909c0
14002a0d2	nop
14002a0d3	mov	r15, qword ptr [rbp + 0xdd0]
14002a0da	lea	r12, [rip + 0x5d7772f]
14002a0e1	jmp	0x140029a4e
