1458f6000	push	r15
1458f6002	push	r14
1458f6004	push	r13
1458f6006	push	r12
1458f6008	push	rsi
1458f6009	push	rdi
1458f600a	push	rbp
1458f600b	push	rbx
1458f600c	sub	rsp, 0x88
1458f6013	mov	qword ptr [rsp + 0x48], rcx
1458f6018	test	r8, r8
1458f601b	je	0x1458f626b
1458f6021	mov	rsi, r8
1458f6024	mov	rdi, rdx
1458f6027	xor	r12d, r12d
1458f602a	jmp	0x1458f6042
1458f602c	nop	dword ptr [rax]
1458f6030	add	rdi, r13
1458f6033	sub	rsi, r13
1458f6036	inc	r12
1458f6039	test	rsi, rsi
1458f603c	je	0x1458f626b
1458f6042	cmp	rsi, 0x14
1458f6046	mov	r13d, 0x14
1458f604c	cmovb	r13, rsi
1458f6050	mov	qword ptr [rsp + 0x50], r12
1458f6055	lea	rax, [rip + 0x15dd1e4]
1458f605c	mov	qword ptr [rsp + 0x58], rax
1458f6061	mov	qword ptr [rsp + 0x60], 2
1458f606a	mov	rax, qword ptr [rsp + 0x48]
1458f606f	mov	qword ptr [rsp + 0x68], rax
1458f6074	mov	qword ptr [rsp + 0x70], 0x10
1458f607d	lea	rax, [rsp + 0x50]
1458f6082	mov	qword ptr [rsp + 0x78], rax
1458f6087	mov	qword ptr [rsp + 0x80], 8
1458f6093	lea	rcx, [rsp + 0x34]
1458f6098	lea	rdx, [rsp + 0x58]
1458f609d	call	0x1458f6280
1458f60a2	movzx	r14d, byte ptr [rsp + 0x34]
1458f60a8	movzx	ebp, byte ptr [rsp + 0x35]
1458f60ad	movzx	r11d, byte ptr [rsp + 0x36]
1458f60b3	movzx	r10d, byte ptr [rsp + 0x37]
1458f60b9	movzx	r9d, byte ptr [rsp + 0x38]
1458f60bf	movzx	edx, byte ptr [rsp + 0x39]
1458f60c4	movzx	r8d, byte ptr [rsp + 0x3a]
1458f60ca	movzx	ecx, byte ptr [rsp + 0x3b]
1458f60cf	movzx	eax, byte ptr [rsp + 0x3c]
1458f60d4	movzx	ebx, byte ptr [rsp + 0x3d]
1458f60d9	movzx	r15d, byte ptr [rsp + 0x3e]
1458f60df	mov	byte ptr [rsp + 0x33], r15b
1458f60e4	movzx	r15d, byte ptr [rsp + 0x3f]
1458f60ea	mov	byte ptr [rsp + 0x32], r15b
1458f60ef	movzx	r15d, byte ptr [rsp + 0x40]
1458f60f5	mov	byte ptr [rsp + 0x31], r15b
1458f60fa	movzx	r15d, byte ptr [rsp + 0x41]
1458f6100	mov	byte ptr [rsp + 0x30], r15b
1458f6105	movzx	r15d, byte ptr [rsp + 0x42]
1458f610b	mov	byte ptr [rsp + 0x2f], r15b
1458f6110	movzx	r15d, byte ptr [rsp + 0x43]
1458f6116	mov	byte ptr [rsp + 0x2e], r15b
1458f611b	movzx	r15d, byte ptr [rsp + 0x44]
1458f6121	mov	byte ptr [rsp + 0x2d], r15b
1458f6126	xor	byte ptr [rdi], r14b
1458f6129	movzx	r15d, byte ptr [rsp + 0x45]
1458f612f	movzx	r14d, byte ptr [rsp + 0x46]
1458f6135	mov	byte ptr [rsp + 0x2c], r14b
1458f613a	movzx	r14d, byte ptr [rsp + 0x47]
1458f6140	cmp	rsi, 1
1458f6144	je	0x1458f6030
1458f614a	xor	byte ptr [rdi + 1], bpl
1458f614e	cmp	rsi, 2
1458f6152	je	0x1458f6030
1458f6158	xor	byte ptr [rdi + 2], r11b
1458f615c	cmp	rsi, 3
1458f6160	je	0x1458f6030
1458f6166	xor	byte ptr [rdi + 3], r10b
1458f616a	cmp	rsi, 4
1458f616e	je	0x1458f6030
1458f6174	xor	byte ptr [rdi + 4], r9b
1458f6178	cmp	rsi, 5
1458f617c	je	0x1458f6030
1458f6182	xor	byte ptr [rdi + 5], dl
1458f6185	cmp	rsi, 6
1458f6189	je	0x1458f6030
1458f618f	xor	byte ptr [rdi + 6], r8b
1458f6193	cmp	rsi, 7
1458f6197	je	0x1458f6030
1458f619d	xor	byte ptr [rdi + 7], cl
1458f61a0	cmp	rsi, 8
1458f61a4	je	0x1458f6030
1458f61aa	xor	byte ptr [rdi + 8], al
1458f61ad	cmp	rsi, 9
1458f61b1	je	0x1458f6030
1458f61b7	xor	byte ptr [rdi + 9], bl
1458f61ba	cmp	rsi, 0xa
1458f61be	je	0x1458f6030
1458f61c4	movzx	eax, byte ptr [rsp + 0x33]
1458f61c9	xor	byte ptr [rdi + 0xa], al
1458f61cc	cmp	rsi, 0xb
1458f61d0	je	0x1458f6030
1458f61d6	movzx	eax, byte ptr [rsp + 0x32]
1458f61db	xor	byte ptr [rdi + 0xb], al
1458f61de	cmp	rsi, 0xc
1458f61e2	je	0x1458f6030
1458f61e8	movzx	eax, byte ptr [rsp + 0x31]
1458f61ed	xor	byte ptr [rdi + 0xc], al
1458f61f0	cmp	rsi, 0xd
1458f61f4	je	0x1458f6030
1458f61fa	movzx	eax, byte ptr [rsp + 0x30]
1458f61ff	xor	byte ptr [rdi + 0xd], al
1458f6202	cmp	rsi, 0xe
1458f6206	je	0x1458f6030
1458f620c	movzx	eax, byte ptr [rsp + 0x2f]
1458f6211	xor	byte ptr [rdi + 0xe], al
1458f6214	cmp	rsi, 0xf
1458f6218	je	0x1458f6030
1458f621e	movzx	eax, byte ptr [rsp + 0x2e]
1458f6223	xor	byte ptr [rdi + 0xf], al
1458f6226	cmp	rsi, 0x10
1458f622a	je	0x1458f6030
1458f6230	movzx	eax, byte ptr [rsp + 0x2d]
1458f6235	xor	byte ptr [rdi + 0x10], al
1458f6238	cmp	rsi, 0x11
1458f623c	je	0x1458f6030
1458f6242	xor	byte ptr [rdi + 0x11], r15b
1458f6246	cmp	rsi, 0x12
1458f624a	je	0x1458f6030
1458f6250	movzx	eax, byte ptr [rsp + 0x2c]
1458f6255	xor	byte ptr [rdi + 0x12], al
1458f6258	cmp	rsi, 0x13
1458f625c	je	0x1458f6030
1458f6262	xor	byte ptr [rdi + 0x13], r14b
1458f6266	jmp	0x1458f6030
1458f626b	add	rsp, 0x88
1458f6272	pop	rbx
1458f6273	pop	rbp
1458f6274	pop	rdi
1458f6275	pop	rsi
1458f6276	pop	r12
1458f6278	pop	r13
1458f627a	pop	r14
1458f627c	pop	r15
1458f627e	ret
