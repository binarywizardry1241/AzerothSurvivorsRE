1458a3e40	push	rbp
1458a3e41	push	r15
1458a3e43	push	r14
1458a3e45	push	r13
1458a3e47	push	r12
1458a3e49	push	rsi
1458a3e4a	push	rdi
1458a3e4b	push	rbx
1458a3e4c	sub	rsp, 0x1b8
1458a3e53	lea	rbp, [rsp + 0x80]
1458a3e5b	mov	qword ptr [rbp + 0x130], 0xfffffffffffffffe
1458a3e66	mov	ebx, r9d
1458a3e69	mov	r14, rdx
1458a3e6c	mov	rsi, rcx
1458a3e6f	mov	rax, qword ptr [rdx + 0x50]
1458a3e73	imul	rcx, qword ptr [rdx + 0x58], 0xe8
1458a3e7b	xor	edx, edx
1458a3e7d	nop	dword ptr [rax]
1458a3e80	cmp	rcx, rdx
1458a3e83	je	0x1458a3eb8
1458a3e85	lea	r9, [rdx + 0xe8]
1458a3e8c	cmp	byte ptr [rax + rdx + 0xe4], r8b
1458a3e94	mov	rdx, r9
1458a3e97	jne	0x1458a3e80
1458a3e99	lea	rdx, [rax + r9]
1458a3e9d	add	rdx, -0xe8
1458a3ea4	lea	rcx, [rbp - 8]
1458a3ea8	mov	r8d, 0xe8
1458a3eae	call	0x145bfa0e7
1458a3eb3	jmp	0x1458a3f70
1458a3eb8	xorps	xmm0, xmm0
1458a3ebb	movups	xmmword ptr [rbp + 0xcc], xmm0
1458a3ec2	movups	xmmword ptr [rbp + 0xc0], xmm0
1458a3ec9	movups	xmmword ptr [rbp + 0xb0], xmm0
1458a3ed0	movups	xmmword ptr [rbp + 0xa0], xmm0
1458a3ed7	movups	xmmword ptr [rbp + 0x90], xmm0
1458a3ede	mov	byte ptr [rbp + 0xdc], r8b
1458a3ee5	mov	dword ptr [rbp - 8], 0
1458a3eec	mov	dword ptr [rbp], 0
1458a3ef3	mov	dword ptr [rbp + 8], 0
1458a3efa	mov	dword ptr [rbp + 0x10], 0
1458a3f01	mov	dword ptr [rbp + 0x18], 0
1458a3f08	mov	dword ptr [rbp + 0x20], 0
1458a3f0f	mov	dword ptr [rbp + 0x28], 0
1458a3f16	mov	dword ptr [rbp + 0x30], 0
1458a3f1d	mov	dword ptr [rbp + 0x38], 0
1458a3f24	mov	dword ptr [rbp + 0x40], 0
1458a3f2b	mov	dword ptr [rbp + 0x48], 0
1458a3f32	mov	dword ptr [rbp + 0x50], 0
1458a3f39	mov	dword ptr [rbp + 0x58], 0
1458a3f40	mov	dword ptr [rbp + 0x60], 0
1458a3f47	mov	dword ptr [rbp + 0x68], 0
1458a3f4e	mov	dword ptr [rbp + 0x70], 0
1458a3f55	mov	dword ptr [rbp + 0x78], 0
1458a3f5c	mov	dword ptr [rbp + 0x80], 0
1458a3f66	mov	dword ptr [rbp + 0x88], 0
1458a3f70	mov	rdi, qword ptr [r14 + 0x40]
1458a3f74	lea	r15, [rdi*4]
1458a3f7c	mov	rax, rdi
1458a3f7f	shr	rax, 0x3e
1458a3f83	setne	al
1458a3f86	movabs	rcx, 0x7ffffffffffffffc
1458a3f90	cmp	r15, rcx
1458a3f93	seta	cl
1458a3f96	or	cl, al
1458a3f98	je	0x1458a3faa
1458a3f9a	xor	r13d, r13d
1458a3f9d	mov	rcx, r13
1458a3fa0	mov	rdx, r15
1458a3fa3	call	0x145d992bb
1458a3fa8	ud2
1458a3faa	mov	qword ptr [rbp + 0xe0], rsi
1458a3fb1	mov	r12, qword ptr [r14 + 0x38]
1458a3fb5	test	r15, r15
1458a3fb8	je	0x1458a3fdf
1458a3fba	call	0x140002200
1458a3fbf	mov	r13d, 4
1458a3fc5	mov	edx, 4
1458a3fca	mov	rcx, r15
1458a3fcd	call	0x1400021c0
1458a3fd2	test	rax, rax
1458a3fd5	je	0x1458a3f9d
1458a3fd7	mov	rsi, rax
1458a3fda	mov	r13, rdi
1458a3fdd	jmp	0x1458a3fe7
1458a3fdf	mov	esi, 4
1458a3fe4	xor	r13d, r13d
1458a3fe7	mov	qword ptr [rbp + 0x108], r13
1458a3fee	mov	qword ptr [rbp + 0x110], rsi
1458a3ff5	mov	qword ptr [rbp + 0x118], 0
1458a4000	test	rdi, rdi
1458a4003	je	0x1458a401a
1458a4005	mov	rcx, rsi
1458a4008	mov	rdx, r12
1458a400b	mov	r8, r15
1458a400e	call	0x145bfa0e7
1458a4013	mov	qword ptr [rbp + 0x118], rdi
1458a401a	lea	rax, [rip + 0x134c32f]
1458a4021	mov	qword ptr [rbp - 0x58], rax
1458a4025	lea	rax, [rip + 0x134c824]
1458a402c	mov	qword ptr [rbp - 0x50], rax
1458a4030	mov	qword ptr [rbp - 0x48], r14
1458a4034	mov	qword ptr [rbp + 0x100], r13
1458a403b	lea	rcx, [rbp + 0xe8]
1458a4042	lea	rdx, [rbp - 0x58]
1458a4046	call	0x1459c3150
1458a404b	nop
1458a404c	mov	r15, qword ptr [rbp + 0xe8]
1458a4053	mov	r12, qword ptr [rbp + 0xf0]
1458a405a	mov	r14, qword ptr [rbp + 0xf8]
1458a4061	sub	r13, rdi
1458a4064	cmp	r14, r13
1458a4067	ja	0x1458a41c2
1458a406d	test	r14, r14
1458a4070	je	0x1458a4086
1458a4072	lea	r8, [r14*4]
1458a407a	lea	rcx, [rsi + rdi*4]
1458a407e	mov	rdx, r12
1458a4081	call	0x145bfa0e7
1458a4086	add	rdi, r14
1458a4089	test	r15, r15
1458a408c	je	0x1458a40a3
1458a408e	shl	r15, 2
1458a4092	mov	r8d, 4
1458a4098	mov	rcx, r12
1458a409b	mov	rdx, r15
1458a409e	call	0x1400021d0
1458a40a3	mov	rax, qword ptr [rbp + 0x108]
1458a40aa	mov	qword ptr [rbp + 0x128], rax
1458a40b1	movzx	eax, byte ptr [rbp + 0xdc]
1458a40b8	mov	byte ptr [rbp + 0x108], al
1458a40be	lea	rax, [rbp + 0x108]
1458a40c5	mov	qword ptr [rbp + 0xe8], rax
1458a40cc	mov	qword ptr [rbp + 0x120], rsi
1458a40d3	mov	qword ptr [rbp + 0xf0], rsi
1458a40da	mov	qword ptr [rbp + 0xf8], rdi
1458a40e1	xor	edi, edi
1458a40e3	lea	r14, [rbp - 0x58]
1458a40e7	lea	r15, [rbp + 0xe8]
1458a40ee	mov	rsi, qword ptr [rbp + 0xe0]
1458a40f5	jmp	0x1458a4109
1458a40f7	nop	word ptr [rax + rax]
1458a4100	inc	rdi
1458a4103	cmp	rdi, 0x13
1458a4107	je	0x1458a4177
1458a4109	mov	edx, dword ptr [rbp + rdi*4 + 0x90]
1458a4110	test	edx, edx
1458a4112	je	0x1458a412f
1458a4114	mov	rcx, r15
1458a4117	mov	r8, rdi
1458a411a	call	0x14589bc20
1458a411f	nop
1458a4120	test	al, al
1458a4122	jne	0x1458a412f
1458a4124	mov	dword ptr [rbp + rdi*4 + 0x90], 0
1458a412f	cmp	dword ptr [rbp + rdi*8 - 8], 1
1458a4134	jne	0x1458a4100
1458a4136	mov	r12d, dword ptr [rbp + rdi*8 - 4]
1458a413b	movzx	r8d, byte ptr [rbp + 0x108]
1458a4143	mov	rcx, r14
1458a4146	mov	edx, ebx
1458a4148	call	0x1459a3e80
1458a414d	nop
1458a414e	test	r12d, r12d
1458a4151	je	0x1458a4100
1458a4153	cmp	dword ptr [rbp + rdi*4 - 0x58], r12d
1458a4158	je	0x1458a4100
1458a415a	mov	rcx, r15
1458a415d	mov	edx, r12d
1458a4160	mov	r8, rdi
1458a4163	call	0x14589bc20
1458a4168	nop
1458a4169	test	al, al
1458a416b	jne	0x1458a4100
1458a416d	mov	dword ptr [rbp + rdi*8 - 8], 0
1458a4175	jmp	0x1458a4100
1458a4177	lea	rdx, [rbp - 8]
1458a417b	mov	r8d, 0xe8
1458a4181	mov	rcx, rsi
1458a4184	call	0x145bfa0e7
1458a4189	mov	rdx, qword ptr [rbp + 0x128]
1458a4190	test	rdx, rdx
1458a4193	je	0x1458a41ab
1458a4195	shl	rdx, 2
1458a4199	mov	r8d, 4
1458a419f	mov	rcx, qword ptr [rbp + 0x120]
1458a41a6	call	0x1400021d0
1458a41ab	mov	rax, rsi
1458a41ae	add	rsp, 0x1b8
1458a41b5	pop	rbx
1458a41b6	pop	rdi
1458a41b7	pop	rsi
1458a41b8	pop	r12
1458a41ba	pop	r13
1458a41bc	pop	r14
1458a41be	pop	r15
1458a41c0	pop	rbp
1458a41c1	ret
1458a41c2	mov	qword ptr [rbp + 0x120], r12
1458a41c9	mov	qword ptr [rbp + 0x128], r15
1458a41d0	mov	qword ptr [rsp + 0x20], 4
1458a41d9	lea	rcx, [rbp + 0x108]
1458a41e0	mov	r9d, 4
1458a41e6	mov	rdx, rdi
1458a41e9	mov	r8, r14
1458a41ec	call	0x145bfa970
1458a41f1	nop
1458a41f2	mov	rsi, qword ptr [rbp + 0x110]
1458a41f9	mov	rdi, qword ptr [rbp + 0x118]
1458a4200	mov	r15, qword ptr [rbp + 0x128]
1458a4207	mov	r12, qword ptr [rbp + 0x120]
1458a420e	jmp	0x1458a4072
