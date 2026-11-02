1458a7fc0	push	rbp
1458a7fc1	push	r15
1458a7fc3	push	r14
1458a7fc5	push	r13
1458a7fc7	push	r12
1458a7fc9	push	rsi
1458a7fca	push	rdi
1458a7fcb	push	rbx
1458a7fcc	sub	rsp, 0x58
1458a7fd0	lea	rbp, [rsp + 0x50]
1458a7fd5	mov	qword ptr [rbp], 0xfffffffffffffffe
1458a7fdd	mov	rdi, rdx
1458a7fe0	mov	rsi, rcx
1458a7fe3	movzx	eax, byte ptr [rdx + 0x38]
1458a7fe7	add	al, 0xfe
1458a7fe9	cmp	al, 0xa
1458a7feb	jae	0x1458a7ffd
1458a7fed	movzx	eax, al
1458a7ff0	lea	rcx, [rip + 0x1343b49]
1458a7ff7	mov	rax, qword ptr [rcx + rax*8]
1458a7ffb	jmp	0x1458a8004
1458a7ffd	lea	rax, [rip + 0x13386e4]
1458a8004	movzx	eax, byte ptr [rax + 0x8c]
1458a800b	mov	byte ptr [rdi + 0x38], al
1458a800e	dec	al
1458a8010	cmp	al, 0xb
1458a8012	jae	0x1458a8032
1458a8014	movzx	eax, al
1458a8017	shl	eax, 3
1458a801a	lea	rcx, [rip + 0x1343b6f]
1458a8021	mov	rcx, qword ptr [rax + rcx]
1458a8025	lea	rdx, [rip + 0x1343bbc]
1458a802c	mov	rax, qword ptr [rax + rdx]
1458a8030	jmp	0x1458a803e
1458a8032	lea	rax, [rip + 0x1343628]
1458a8039	mov	ecx, 1
1458a803e	movzx	ebx, byte ptr [rdi + 0x39]
1458a8042	xor	edx, edx
1458a8044	nop	word ptr cs:[rax + rax]
1458a8050	cmp	byte ptr [rax + rdx], bl
1458a8053	je	0x1458a8063
1458a8055	inc	rdx
1458a8058	cmp	rcx, rdx
1458a805b	jne	0x1458a8050
1458a805d	movzx	ebx, byte ptr [rax]
1458a8060	mov	byte ptr [rdi + 0x39], bl
1458a8063	cmp	byte ptr [rdi + 0x3a], 0
1458a8067	setne	byte ptr [rdi + 0x3a]
1458a806b	setne	byte ptr [rbp - 1]
1458a806f	mov	r15, qword ptr [rdi + 0x20]
1458a8073	mov	rdx, qword ptr [rdi + 0x28]
1458a8077	mov	rcx, r15
1458a807a	call	0x14588d0d0
1458a807f	imul	rax, rax, 0xf0
1458a8086	lea	rcx, [rip + 0x1336303]
1458a808d	mov	r13, qword ptr [rax + rcx + 8]
1458a8092	mov	r14, qword ptr [rax + rcx + 0x10]
1458a8097	call	0x140002200
1458a809c	mov	edx, 1
1458a80a1	mov	rcx, r14
1458a80a4	call	0x1400021c0
1458a80a9	test	rax, rax
1458a80ac	mov	qword ptr [rbp - 0x10], rdi
1458a80b0	je	0x1458a8345
1458a80b6	mov	r12, rax
1458a80b9	mov	rcx, rax
1458a80bc	mov	rdx, r13
1458a80bf	mov	r8, r14
1458a80c2	call	0x145bfa0e7
1458a80c7	mov	rdx, qword ptr [rdi + 0x18]
1458a80cb	test	rdx, rdx
1458a80ce	je	0x1458a80de
1458a80d0	mov	r8d, 1
1458a80d6	mov	rcx, r15
1458a80d9	call	0x1400021d0
1458a80de	mov	qword ptr [rdi + 0x18], r14
1458a80e2	mov	qword ptr [rdi + 0x20], r12
1458a80e6	mov	qword ptr [rdi + 0x28], r14
1458a80ea	mov	r14, qword ptr [rdi + 8]
1458a80ee	mov	r15, qword ptr [rdi + 0x10]
1458a80f2	mov	rcx, r14
1458a80f5	mov	rdx, r15
1458a80f8	call	0x1458a8710
1458a80fd	nop
1458a80fe	cmp	al, 0xff
1458a8100	je	0x1458a82fe
1458a8106	call	0x140002200
1458a810b	mov	r12d, 4
1458a8111	mov	ecx, 4
1458a8116	mov	edx, 1
1458a811b	call	0x1400021c0
1458a8120	test	rax, rax
1458a8123	je	0x1458a8355
1458a8129	mov	r15, rax
1458a812c	mov	dword ptr [rax], 0x6f726548
1458a8132	mov	r13d, 4
1458a8138	mov	rax, qword ptr [rbp - 0x10]
1458a813c	mov	rdx, qword ptr [rax]
1458a813f	test	rdx, rdx
1458a8142	je	0x1458a8152
1458a8144	mov	r8d, 1
1458a814a	mov	rcx, r14
1458a814d	call	0x1400021d0
1458a8152	mov	rcx, qword ptr [rbp - 0x10]
1458a8156	mov	qword ptr [rcx], r13
1458a8159	mov	qword ptr [rcx + 8], r15
1458a815d	mov	qword ptr [rcx + 0x10], r12
1458a8161	mov	eax, dword ptr [rcx + 0x3b]
1458a8164	movzx	ecx, byte ptr [rcx + 0x3f]
1458a8168	shl	rcx, 0x20
1458a816c	or	rcx, rax
1458a816f	mov	edx, ebx
1458a8171	movzx	r8d, byte ptr [rbp - 1]
1458a8176	call	0x1459a2280
1458a817b	nop
1458a817c	mov	rdi, qword ptr [rbp - 0x10]
1458a8180	mov	dword ptr [rdi + 0x3b], eax
1458a8183	shr	rax, 0x20
1458a8187	mov	byte ptr [rdi + 0x3f], al
1458a818a	mov	rax, qword ptr [rdi + 0x30]
1458a818e	mov	rdx, rax
1458a8191	shr	rdx, 0x20
1458a8195	movzx	ecx, dx
1458a8198	cmp	ecx, 0x12c
1458a819e	mov	r8d, 0x12c
1458a81a4	cmovb	r8d, edx
1458a81a8	add	r8d, -0x64
1458a81ac	xor	ecx, ecx
1458a81ae	cmp	dx, 0x64
1458a81b2	cmovb	r8d, ecx
1458a81b6	movzx	edx, r8w
1458a81ba	imul	edx, edx, 0xcccd
1458a81c0	shr	edx, 0x12
1458a81c3	and	edx, 0xfffffffe
1458a81c6	lea	edx, [rdx + rdx*4]
1458a81c9	add	edx, 0x64
1458a81cc	mov	r8d, eax
1458a81cf	shr	r8d, 0x10
1458a81d3	mov	r10d, r8d
1458a81d6	cmp	r8d, 0x1f4
1458a81dd	mov	r9d, 0x1f4
1458a81e3	cmovae	r8d, r9d
1458a81e7	add	r8d, -0x64
1458a81eb	cmp	r10w, 0x64
1458a81f0	cmovb	r8d, ecx
1458a81f4	movzx	r10d, r8w
1458a81f8	imul	r10d, r10d, 0x47af
1458a81ff	shr	r10d, 0x10
1458a8203	sub	r8d, r10d
1458a8206	movzx	r8d, r8w
1458a820a	shr	r8d, 1
1458a820d	add	r8d, r10d
1458a8210	shr	r8d, 4
1458a8214	lea	r8d, [r8 + r8*4]
1458a8218	lea	r8d, [r8 + r8*4]
1458a821c	shl	r8d, 0x10
1458a8220	movzx	r10d, ax
1458a8224	cmp	r10d, 0x1f4
1458a822b	cmovb	r9d, eax
1458a822f	add	r9d, -0x64
1458a8233	cmp	ax, 0x64
1458a8237	cmovb	r9d, ecx
1458a823b	movzx	r10d, r9w
1458a823f	imul	r10d, r10d, 0x47af
1458a8246	shr	r10d, 0x10
1458a824a	sub	r9d, r10d
1458a824d	movzx	r9d, r9w
1458a8251	shr	r9d, 1
1458a8254	add	r9d, r10d
1458a8257	shr	r9d, 4
1458a825b	lea	r9d, [r9 + r9*4]
1458a825f	lea	r9d, [r9 + r9*4]
1458a8263	add	r9d, 0x64
1458a8267	mov	r10, rax
1458a826a	shr	r10, 0x30
1458a826e	shr	rax, 0x32
1458a8272	cmp	r10d, 0x96
1458a8279	mov	r11d, 0x96
1458a827f	cmovb	r11d, r10d
1458a8283	add	r11d, -0x64
1458a8287	cmp	eax, 0x19
1458a828a	cmovb	r11d, ecx
1458a828e	movzx	eax, r11w
1458a8292	imul	eax, eax, 0xcccd
1458a8298	shr	eax, 0x12
1458a829b	lea	eax, [rax + rax*4]
1458a829e	add	eax, 0x64
1458a82a1	shl	rax, 0x30
1458a82a5	movzx	ecx, dx
1458a82a8	shl	rcx, 0x20
1458a82ac	or	rcx, rax
1458a82af	add	r8d, 0x640000
1458a82b6	or	r8, rcx
1458a82b9	movzx	eax, r9w
1458a82bd	or	rax, r8
1458a82c0	mov	qword ptr [rdi + 0x30], rax
1458a82c4	movups	xmm0, xmmword ptr [rdi]
1458a82c7	movups	xmm1, xmmword ptr [rdi + 0x10]
1458a82cb	movups	xmm2, xmmword ptr [rdi + 0x20]
1458a82cf	movups	xmmword ptr [rsi + 0x20], xmm2
1458a82d3	movups	xmmword ptr [rsi + 0x10], xmm1
1458a82d7	movups	xmmword ptr [rsi], xmm0
1458a82da	mov	rax, qword ptr [rdi + 0x30]
1458a82de	mov	qword ptr [rsi + 0x30], rax
1458a82e2	mov	rax, qword ptr [rdi + 0x38]
1458a82e6	mov	qword ptr [rsi + 0x38], rax
1458a82ea	mov	rax, rsi
1458a82ed	add	rsp, 0x58
1458a82f1	pop	rbx
1458a82f2	pop	rdi
1458a82f3	pop	rsi
1458a82f4	pop	r12
1458a82f6	pop	r13
1458a82f8	pop	r14
1458a82fa	pop	r15
1458a82fc	pop	rbp
1458a82fd	ret
1458a82fe	mov	rcx, r14
1458a8301	mov	rdx, r15
1458a8304	call	0x140089200
1458a8309	nop
1458a830a	mov	r8, rdx
1458a830d	lea	rcx, [rbp - 0x28]
1458a8311	mov	rdx, rax
1458a8314	call	0x1458a8fa0
1458a8319	nop
1458a831a	mov	r13, qword ptr [rbp - 0x28]
1458a831e	cmp	r13, -1
1458a8322	je	0x1458a8106
1458a8328	mov	r15, qword ptr [rbp - 0x20]
1458a832c	mov	r12, qword ptr [rbp - 0x18]
1458a8330	mov	rax, qword ptr [rbp - 0x10]
1458a8334	mov	rdx, qword ptr [rax]
1458a8337	test	rdx, rdx
1458a833a	jne	0x1458a8144
1458a8340	jmp	0x1458a8152
1458a8345	mov	ecx, 1
1458a834a	mov	rdx, r14
1458a834d	call	0x145d992bb
1458a8352	nop
1458a8353	jmp	0x1458a8365
1458a8355	mov	ecx, 1
1458a835a	mov	edx, 4
1458a835f	call	0x145d992bb
1458a8364	nop
1458a8365	ud2
