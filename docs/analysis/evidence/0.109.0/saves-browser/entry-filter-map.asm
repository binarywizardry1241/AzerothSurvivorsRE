1400a5fb0	push	rbp
1400a5fb1	push	r15
1400a5fb3	push	r14
1400a5fb5	push	r13
1400a5fb7	push	r12
1400a5fb9	push	rsi
1400a5fba	push	rdi
1400a5fbb	push	rbx
1400a5fbc	sub	rsp, 0x9d8
1400a5fc3	lea	rbp, [rsp + 0x80]
1400a5fcb	movaps	xmmword ptr [rbp + 0x940], xmm6
1400a5fd2	mov	qword ptr [rbp + 0x938], 0xfffffffffffffffe
1400a5fdd	cmp	dword ptr [rdx + 0x4c0], 2
1400a5fe4	je	0x1400a6212
1400a5fea	mov	r14, rdx
1400a5fed	mov	qword ptr [rbp + 0x918], rcx
1400a5ff4	lea	rax, [rdx + 0x4c0]
1400a5ffb	mov	qword ptr [rbp + 0x920], rax
1400a6002	lea	rax, [rdx + 0x730]
1400a6009	mov	qword ptr [rbp + 0x908], rax
1400a6010	lea	rdi, [rbp + 0x468]
1400a6017	lea	r15, [rbp + 0x6c0]
1400a601e	lea	r13, [rbp + 0x450]
1400a6025	lea	r12, [rbp + 0x908]
1400a602c	lea	rsi, [rbp + 0x6b0]
1400a6033	mov	qword ptr [rbp + 0x930], rdx
1400a603a	jmp	0x1400a6050
1400a603c	nop	dword ptr [rax]
1400a6040	test	r14, r14
1400a6043	jne	0x1400a6234
1400a6049	mov	r14, qword ptr [rbp + 0x930]
1400a6050	mov	rcx, r13
1400a6053	lea	rdx, [r14 + 0x4c0]
1400a605a	call	0x145bc39e0
1400a605f	cmp	dword ptr [rbp + 0x450], 1
1400a6066	jne	0x1400a61b4
1400a606c	mov	rbx, qword ptr [rbp + 0x458]
1400a6073	mov	r14, qword ptr [rbp + 0x460]
1400a607a	test	rbx, rbx
1400a607d	je	0x1400a6120
1400a6083	mov	qword ptr [rbp + 0x200], r14
1400a608a	mov	r8d, 0x248
1400a6090	lea	rcx, [rbp + 0x208]
1400a6097	mov	rdx, rdi
1400a609a	call	0x145bfa0e7
1400a609f	mov	qword ptr [rbp + 0x1f8], 0
1400a60aa	mov	qword ptr [rbp + 0x6b8], r14
1400a60b1	mov	r8d, 0x248
1400a60b7	mov	rcx, r15
1400a60ba	mov	rdx, rdi
1400a60bd	call	0x145bfa0e7
1400a60c2	mov	qword ptr [rbp + 0x928], rbx
1400a60c9	mov	qword ptr [rbp + 0x6b0], rbx
1400a60d0	mov	rcx, r12
1400a60d3	mov	rdx, rsi
1400a60d6	call	0x140025a10
1400a60db	nop
1400a60dc	test	al, al
1400a60de	je	0x1400a6170
1400a60e4	mov	r14, qword ptr [rbp + 0x6b0]
1400a60eb	mov	r8d, 0x250
1400a60f1	lea	rcx, [rbp - 0x58]
1400a60f5	lea	rdx, [rbp + 0x6b8]
1400a60fc	call	0x145bfa0e7
1400a6101	mov	rax, qword ptr [rbp + 0x1f8]
1400a6108	test	rax, rax
1400a610b	jne	0x1400a6199
1400a6111	jmp	0x1400a6040
1400a6116	nop	word ptr cs:[rax + rax]
1400a6120	mov	eax, r14d
1400a6123	and	eax, 3
1400a6126	lea	ecx, [rax - 2]
1400a6129	cmp	ecx, 2
1400a612c	jb	0x1400a6049
1400a6132	test	rax, rax
1400a6135	je	0x1400a6049
1400a613b	dec	r14
1400a613e	mov	qword ptr [rbp + 0x6b8], r14
1400a6145	mov	byte ptr [rbp + 0x6b0], 3
1400a614c	lea	rcx, [rbp + 0x6b8]
1400a6153	call	0x145bdf7c0
1400a6158	mov	r14, qword ptr [rbp + 0x930]
1400a615f	jmp	0x1400a6050
1400a6164	nop	word ptr cs:[rax + rax]
1400a6170	mov	rax, qword ptr [rbp + 0x928]
1400a6177	lock dec	qword ptr [rax]
1400a617b	jne	0x1400a6186
1400a617d	mov	rcx, rsi
1400a6180	call	0x144ae0f90
1400a6185	nop
1400a6186	xor	r14d, r14d
1400a6189	mov	rax, qword ptr [rbp + 0x1f8]
1400a6190	test	rax, rax
1400a6193	je	0x1400a6040
1400a6199	lock dec	qword ptr [rax]
1400a619d	jne	0x1400a6040
1400a61a3	lea	rcx, [rbp + 0x1f8]
1400a61aa	call	0x144ae0f90
1400a61af	jmp	0x1400a6040
1400a61b4	lea	rax, [r14 + 0x4c0]
1400a61bb	mov	rax, qword ptr [rax]
1400a61be	test	rax, rax
1400a61c1	je	0x1400a61dc
1400a61c3	cmp	eax, 2
1400a61c6	mov	rax, qword ptr [rbp + 0x930]
1400a61cd	je	0x1400a61fd
1400a61cf	lea	rcx, [rax + 0x4c8]
1400a61d6	call	0x145bc0980
1400a61db	nop
1400a61dc	mov	rcx, qword ptr [rbp + 0x930]
1400a61e3	mov	rax, qword ptr [rcx + 0x4d0]
1400a61ea	lock dec	qword ptr [rax]
1400a61ee	jne	0x1400a61fd
1400a61f0	add	rcx, 0x4d0
1400a61f7	call	0x144ae0f90
1400a61fc	nop
1400a61fd	mov	rax, qword ptr [rbp + 0x920]
1400a6204	mov	qword ptr [rax], 2
1400a620b	mov	rcx, qword ptr [rbp + 0x918]
1400a6212	mov	qword ptr [rcx], 0xffffffffffffffff
1400a6219	movaps	xmm6, xmmword ptr [rbp + 0x940]
1400a6220	add	rsp, 0x9d8
1400a6227	pop	rbx
1400a6228	pop	rdi
1400a6229	pop	rsi
1400a622a	pop	r12
1400a622c	pop	r13
1400a622e	pop	r14
1400a6230	pop	r15
1400a6232	pop	rbp
1400a6233	ret
1400a6234	lea	rcx, [rbp + 0x6b8]
1400a623b	lea	rdx, [rbp - 0x58]
1400a623f	mov	r8d, 0x250
1400a6245	call	0x145bfa0e7
1400a624a	mov	qword ptr [rbp + 0x6b0], r14
1400a6251	movsd	xmm6, qword ptr [rbp + 0x6cc]
1400a6259	mov	qword ptr [rbp + 0x910], r14
1400a6260	lea	rcx, [rbp - 0x58]
1400a6264	lea	rdx, [rbp + 0x6b0]
1400a626b	call	0x145bae120
1400a6270	nop
1400a6271	mov	rdx, qword ptr [rbp - 0x50]
1400a6275	mov	r8, qword ptr [rbp - 0x48]
1400a6279	lea	rcx, [rbp + 0x450]
1400a6280	mov	qword ptr [rbp + 0x920], rdx
1400a6287	call	0x145bcc070
1400a628c	nop
1400a628d	mov	rax, qword ptr [rbp + 0x450]
1400a6294	mov	r14, qword ptr [rbp + 0x458]
1400a629b	mov	rsi, qword ptr [rbp + 0x460]
1400a62a2	cmp	rax, -1
1400a62a6	je	0x1400a636d
1400a62ac	mov	qword ptr [rbp + 0x930], rax
1400a62b3	mov	qword ptr [rbp + 0x928], r14
1400a62ba	lea	rcx, [rbp + 0x1f8]
1400a62c1	lea	rdx, [rbp + 0x6b0]
1400a62c8	call	0x145bae010
1400a62cd	nop
1400a62ce	movups	xmm0, xmmword ptr [rbp + 0x1f8]
1400a62d5	movups	xmm1, xmmword ptr [rbp + 0x208]
1400a62dc	movups	xmmword ptr [rbp + 0x464], xmm1
1400a62e3	movups	xmmword ptr [rbp + 0x454], xmm0
1400a62ea	mov	rdx, qword ptr [rbp - 0x58]
1400a62ee	test	rdx, rdx
1400a62f1	je	0x1400a6305
1400a62f3	mov	r8d, 1
1400a62f9	mov	rcx, qword ptr [rbp + 0x920]
1400a6300	call	0x1400021d0
1400a6305	mov	rax, qword ptr [rbp + 0x6b0]
1400a630c	lock dec	qword ptr [rax]
1400a6310	mov	rdi, qword ptr [rbp + 0x928]
1400a6317	jne	0x1400a6325
1400a6319	lea	rcx, [rbp + 0x6b0]
1400a6320	call	0x144ae0f90
1400a6325	mov	rcx, qword ptr [rbp + 0x918]
1400a632c	mov	rax, qword ptr [rbp + 0x930]
1400a6333	mov	qword ptr [rcx], rax
1400a6336	mov	qword ptr [rcx + 8], rdi
1400a633a	mov	qword ptr [rcx + 0x10], rsi
1400a633e	mov	dword ptr [rcx + 0x18], 1
1400a6345	movlps	qword ptr [rcx + 0x1c], xmm6
1400a6349	movups	xmm0, xmmword ptr [rbp + 0x450]
1400a6350	movups	xmm1, xmmword ptr [rbp + 0x460]
1400a6357	movups	xmmword ptr [rcx + 0x24], xmm0
1400a635b	movups	xmmword ptr [rcx + 0x34], xmm1
1400a635f	mov	eax, dword ptr [rbp + 0x470]
1400a6365	mov	dword ptr [rcx + 0x44], eax
1400a6368	jmp	0x1400a6219
1400a636d	test	rsi, rsi
1400a6370	jns	0x1400a6382
1400a6372	xor	edi, edi
1400a6374	mov	rcx, rdi
1400a6377	mov	rdx, rsi
1400a637a	call	0x145d992bb
1400a637f	nop
1400a6380	ud2
1400a6382	je	0x1400a63c4
1400a6384	call	0x140002200
1400a6389	mov	edi, 1
1400a638e	mov	edx, 1
1400a6393	mov	rcx, rsi
1400a6396	call	0x1400021c0
1400a639b	test	rax, rax
1400a639e	je	0x1400a6374
1400a63a0	mov	rbx, rax
1400a63a3	mov	rcx, rax
1400a63a6	mov	rdx, r14
1400a63a9	mov	r8, rsi
1400a63ac	call	0x145bfa0e7
1400a63b1	mov	qword ptr [rbp + 0x928], rbx
1400a63b8	mov	qword ptr [rbp + 0x930], rsi
1400a63bf	jmp	0x1400a62ba
1400a63c4	mov	eax, 1
1400a63c9	mov	qword ptr [rbp + 0x928], rax
1400a63d0	xor	esi, esi
1400a63d2	mov	qword ptr [rbp + 0x930], 0
1400a63dd	jmp	0x1400a62ba
