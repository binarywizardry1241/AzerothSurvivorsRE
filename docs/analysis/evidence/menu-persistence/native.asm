; export-clock
145002900	sub	rsp, 0x48
145002904	call	0x145cc1fd0
145002909	mov	dword ptr [rsp + 0x28], eax
14500290d	mov	dword ptr [rsp + 0x2c], edx
145002911	lea	rcx, [rsp + 0x30]
145002916	lea	rdx, [rsp + 0x28]
14500291b	mov	r8d, 0xd53e8000
145002921	mov	r9d, 0x19db1de
145002927	call	0x145cc1f80
14500292c	cmp	byte ptr [rsp + 0x30], 0
145002931	jne	0x14500293d
145002933	mov	rax, qword ptr [rsp + 0x38]
145002938	add	rsp, 0x48
14500293c	ret
14500293d	xor	eax, eax
14500293f	add	rsp, 0x48
145002943	ret
; export-account
145836bb0	push	rbp
145836bb1	push	rsi
145836bb2	push	rdi
145836bb3	sub	rsp, 0x220
145836bba	lea	rbp, [rsp + 0x80]
145836bc2	mov	qword ptr [rbp + 0x198], 0xfffffffffffffffe
145836bcd	mov	rsi, rcx
145836bd0	lea	rdi, [rbp - 0x58]
145836bd4	mov	rcx, rdi
145836bd7	call	0x14582beb0
145836bdc	nop
145836bdd	lea	rcx, [rbp + 0x178]
145836be4	mov	rdx, rdi
145836be7	call	0x145832a60
145836bec	nop
145836bed	mov	rdx, qword ptr [rbp + 0x180]
145836bf4	mov	r8, qword ptr [rbp + 0x188]
145836bfb	mov	rcx, rsi
145836bfe	mov	qword ptr [rbp + 0x190], rdx
145836c05	call	0x1458d32a0
145836c0a	nop
145836c0b	mov	rdx, qword ptr [rbp + 0x178]
145836c12	test	rdx, rdx
145836c15	je	0x145836c29
145836c17	mov	r8d, 1
145836c1d	mov	rcx, qword ptr [rbp + 0x190]
145836c24	call	0x1400021d0
145836c29	lea	rcx, [rbp - 0x58]
145836c2d	call	0x140093cb0
145836c32	mov	rax, rsi
145836c35	add	rsp, 0x220
145836c3c	pop	rdi
145836c3d	pop	rsi
145836c3e	pop	rbp
145836c3f	ret
; ordinary-write
145831e10	push	rbp
145831e11	push	r15
145831e13	push	r14
145831e15	push	rsi
145831e16	push	rdi
145831e17	push	rbx
145831e18	sub	rsp, 0x258
145831e1f	lea	rbp, [rsp + 0x80]
145831e27	mov	qword ptr [rbp + 0x1d0], 0xfffffffffffffffe
145831e32	mov	rdi, rcx
145831e35	lea	rcx, [rbp + 0x188]
145831e3c	mov	rdx, rdi
145831e3f	call	0x145832a60
145831e44	mov	rdx, qword ptr [rbp + 0x190]
145831e4b	mov	rbx, qword ptr [rbp + 0x198]
145831e52	lea	rcx, [rbp + 0x170]
145831e59	mov	qword ptr [rbp + 0x1b0], rdx
145831e60	mov	r8, rbx
145831e63	call	0x1458d32a0
145831e68	nop
145831e69	mov	rdx, qword ptr [rbp + 0x178]
145831e70	mov	rsi, qword ptr [rbp + 0x180]
145831e77	lea	rcx, [rbp - 0x60]
145831e7b	mov	qword ptr [rbp + 0x1b8], rdx
145831e82	mov	r8, rsi
145831e85	call	0x1458d2fb0
145831e8a	nop
145831e8b	mov	r14, qword ptr [rbp - 0x60]
145831e8f	cmp	r14, -1
145831e93	je	0x145831ed0
145831e95	cmp	qword ptr [rbp - 0x50], rbx
145831e99	jne	0x145831eb9
145831e9b	mov	r15, qword ptr [rbp - 0x58]
145831e9f	mov	rcx, r15
145831ea2	mov	rdx, qword ptr [rbp + 0x1b0]
145831ea9	mov	r8, rbx
145831eac	call	0x145d14601
145831eb1	test	eax, eax
145831eb3	je	0x1458323f4
145831eb9	test	r14, r14
145831ebc	je	0x145831ed0
145831ebe	mov	rcx, qword ptr [rbp - 0x58]
145831ec2	mov	r8d, 1
145831ec8	mov	rdx, r14
145831ecb	call	0x1400021d0
145831ed0	lea	rax, [rip + 0x1499c39]
145831ed7	mov	qword ptr [rbp + 0x1a0], rax
145831ede	mov	qword ptr [rbp + 0x1a8], 0x33
145831ee9	lea	rax, [rbp + 0x1a0]
145831ef0	mov	qword ptr [rbp - 0x60], rax
145831ef4	lea	rax, [rip - 0x582fe3b]
145831efb	mov	qword ptr [rbp - 0x58], rax
145831eff	lea	rcx, [rip + 0x14984dc]
145831f06	lea	rdx, [rbp - 0x60]
145831f0a	call	0x145cd0810
145831f0f	nop
145831f10	mov	rcx, qword ptr [rbp + 0x1b0]
145831f17	mov	rdx, rbx
145831f1a	call	0x14580aee0
145831f1f	nop
145831f20	xorps	xmm0, xmm0
145831f23	movups	xmmword ptr [rbp + 0x150], xmm0
145831f2a	movups	xmmword ptr [rbp + 0x140], xmm0
145831f31	movups	xmmword ptr [rbp + 0x130], xmm0
145831f38	mov	qword ptr [rbp + 0x160], 0
145831f43	mov	qword ptr [rbp - 0x60], 0
145831f4b	mov	qword ptr [rbp - 0x58], 8
145831f53	movups	xmmword ptr [rbp - 0x50], xmm0
145831f57	mov	qword ptr [rbp + 0xf0], 0xffffffffffffffff
145831f62	mov	qword ptr [rbp - 0x40], 8
145831f6a	movups	xmmword ptr [rbp - 0x38], xmm0
145831f6e	mov	qword ptr [rbp - 0x28], 4
145831f76	movups	xmmword ptr [rbp - 0x20], xmm0
145831f7a	mov	qword ptr [rbp - 0x10], 4
145831f82	movups	xmmword ptr [rbp - 8], xmm0
145831f86	mov	qword ptr [rbp + 8], 8
145831f8e	movups	xmmword ptr [rbp + 0x10], xmm0
145831f92	mov	qword ptr [rbp + 0x20], 8
145831f9a	movups	xmmword ptr [rbp + 0x28], xmm0
145831f9e	mov	qword ptr [rbp + 0x38], 8
145831fa6	movups	xmmword ptr [rbp + 0x40], xmm0
145831faa	mov	qword ptr [rbp + 0x50], 8
145831fb2	movups	xmmword ptr [rbp + 0x58], xmm0
145831fb6	mov	qword ptr [rbp + 0x68], 8
145831fbe	movups	xmmword ptr [rbp + 0x70], xmm0
145831fc2	mov	qword ptr [rbp + 0x80], 8
145831fcd	movups	xmmword ptr [rbp + 0x88], xmm0
145831fd4	mov	qword ptr [rbp + 0x98], 8
145831fdf	movups	xmmword ptr [rbp + 0xa0], xmm0
145831fe6	mov	qword ptr [rbp + 0xb0], 4
145831ff1	mov	dword ptr [rbp + 0x168], 0
145831ffb	movups	xmmword ptr [rbp + 0xb8], xmm0
145832002	mov	qword ptr [rbp + 0xc8], 8
14583200d	movups	xmmword ptr [rbp + 0xd0], xmm0
145832014	mov	qword ptr [rbp + 0xe0], 1
14583201f	mov	qword ptr [rbp + 0xe8], 0
14583202a	cmp	dword ptr [rdi + 0x1c8], 0
145832031	jne	0x1458321ff
145832037	cmp	qword ptr [rdi + 0x10], 0
14583203c	jne	0x1458321ff
145832042	cmp	qword ptr [rdi + 0x150], -1
14583204a	jne	0x1458321ff
145832050	cmp	qword ptr [rdi + 0x28], 0
145832055	jne	0x1458321ff
14583205b	cmp	qword ptr [rdi + 0x40], 0
145832060	jne	0x1458321ff
145832066	cmp	qword ptr [rdi + 0x58], 0
14583206b	jne	0x1458321ff
145832071	mov	rcx, qword ptr [rdi + 0x50]
145832075	mov	edx, 4
14583207a	xor	r8d, r8d
14583207d	call	0x145839210
145832082	test	al, al
145832084	je	0x1458321ff
14583208a	cmp	qword ptr [rdi + 0x70], 0
14583208f	jne	0x1458321ff
145832095	mov	rcx, qword ptr [rdi + 0x68]
145832099	mov	edx, 8
14583209e	xor	r8d, r8d
1458320a1	call	0x14586c2f0
1458320a6	test	al, al
1458320a8	je	0x1458321ff
1458320ae	cmp	qword ptr [rdi + 0x88], 0
1458320b6	jne	0x1458321ff
1458320bc	mov	rcx, qword ptr [rdi + 0x80]
1458320c3	mov	edx, 8
1458320c8	xor	r8d, r8d
1458320cb	call	0x14586c040
1458320d0	nop
1458320d1	cmp	qword ptr [rdi + 0xa0], 0
1458320d9	sete	cl
1458320dc	and	al, cl
1458320de	cmp	al, 1
1458320e0	jne	0x1458321ff
1458320e6	mov	rcx, qword ptr [rdi + 0x98]
1458320ed	mov	edx, 8
1458320f2	xor	r8d, r8d
1458320f5	call	0x14584d310
1458320fa	test	al, al
1458320fc	je	0x1458321ff
145832102	cmp	qword ptr [rdi + 0xb8], 0
14583210a	jne	0x1458321ff
145832110	mov	rcx, qword ptr [rdi + 0xb0]
145832117	mov	edx, 8
14583211c	xor	r8d, r8d
14583211f	call	0x140c912e0
145832124	test	al, al
145832126	je	0x1458321ff
14583212c	cmp	qword ptr [rdi + 0xd0], 0
145832134	jne	0x1458321ff
14583213a	mov	rcx, qword ptr [rdi + 0xc8]
145832141	mov	edx, 8
145832146	xor	r8d, r8d
145832149	call	0x14584d390
14583214e	test	al, al
145832150	je	0x1458321ff
145832156	lea	rdx, [rbp + 0x130]
14583215d	lea	rcx, [rdi + 0x190]
145832164	mov	r8d, 0x38
14583216a	call	0x145d14601
14583216f	test	eax, eax
145832171	jne	0x1458321ff
145832177	cmp	qword ptr [rdi + 0xe8], 0
14583217f	jne	0x1458321ff
145832181	cmp	qword ptr [rdi + 0x100], 0
145832189	jne	0x1458321ff
14583218b	mov	rcx, qword ptr [rdi + 0xf8]
145832192	mov	edx, 8
145832197	xor	r8d, r8d
14583219a	call	0x14584d310
14583219f	test	al, al
1458321a1	je	0x1458321ff
1458321a3	cmp	qword ptr [rdi + 0x118], 0
1458321ab	jne	0x1458321ff
1458321ad	cmp	qword ptr [rdi + 0x130], 0
1458321b5	jne	0x1458321ff
1458321b7	mov	rcx, qword ptr [rdi + 0x128]
1458321be	mov	edx, 8
1458321c3	xor	r8d, r8d
1458321c6	call	0x140c912e0
1458321cb	test	al, al
1458321cd	je	0x1458321ff
1458321cf	cmp	qword ptr [rdi + 0x148], 0
1458321d7	jne	0x1458321ff
1458321d9	mov	rcx, qword ptr [rdi + 0x140]
1458321e0	mov	edx, 1
1458321e5	xor	r8d, r8d
1458321e8	call	0x145839640
1458321ed	test	al, al
1458321ef	je	0x1458321ff
1458321f1	lea	rcx, [rbp - 0x60]
1458321f5	call	0x140093cb0
1458321fa	jmp	0x1458324ad
1458321ff	lea	rcx, [rbp - 0x60]
145832203	call	0x140093cb0
145832208	nop
145832209	call	0x145cc1fd0
14583220e	nop
14583220f	mov	dword ptr [rbp + 0x1a0], eax
145832215	mov	dword ptr [rbp + 0x1a4], edx
14583221b	lea	rcx, [rbp - 0x60]
14583221f	lea	rdx, [rbp + 0x1a0]
145832226	mov	r8d, 0xd53e8000
14583222c	mov	r9d, 0x19db1de
145832232	call	0x145cc1f80
145832237	nop
145832238	cmp	byte ptr [rbp - 0x60], 0
14583223c	jne	0x145832244
14583223e	mov	rdi, qword ptr [rbp - 0x58]
145832242	jmp	0x145832246
145832244	xor	edi, edi
145832246	lea	rdx, [rip + 0x1499c0e]
14583224d	lea	rcx, [rbp - 0x60]
145832251	mov	r8d, 0x14
145832257	call	0x14580ba30
14583225c	nop
14583225d	mov	rax, qword ptr [rbp - 0x60]
145832261	cmp	rax, -1
145832265	je	0x145832377
14583226b	mov	qword ptr [rbp + 0x1c8], rax
145832272	mov	rcx, qword ptr [rbp - 0x58]
145832276	mov	rdx, qword ptr [rbp - 0x50]
14583227a	mov	qword ptr [rbp + 0x1c0], rcx
145832281	call	0x1401edaa0
145832286	nop
145832287	mov	rcx, rdx
14583228a	test	rdx, rdx
14583228d	je	0x145832358
145832293	cmp	rcx, 1
145832297	jne	0x1458322b0
145832299	movzx	edx, byte ptr [rax]
14583229c	cmp	edx, 0x2b
14583229f	je	0x145832358
1458322a5	cmp	edx, 0x2d
1458322a8	je	0x145832358
1458322ae	jmp	0x1458322b3
1458322b0	movzx	edx, byte ptr [rax]
1458322b3	xor	r8d, r8d
1458322b6	cmp	dl, 0x2b
1458322b9	sete	r8b
1458322bd	mov	rdx, r8
1458322c0	neg	rdx
1458322c3	mov	r9, rcx
1458322c6	sub	r9, r8
1458322c9	add	r8, rax
1458322cc	cmp	r9, 0x11
1458322d0	jae	0x14583231a
1458322d2	test	r9, r9
1458322d5	je	0x14583246c
1458322db	add	rcx, rdx
1458322de	neg	rcx
1458322e1	xor	eax, eax
1458322e3	xor	edx, edx
1458322e5	nop	word ptr cs:[rax + rax]
1458322f0	movzx	r9d, byte ptr [r8 + rdx]
1458322f5	add	r9d, -0x30
1458322f9	cmp	r9d, 9
1458322fd	ja	0x145832358
1458322ff	lea	rax, [rax + rax*4]
145832303	mov	r9d, r9d
145832306	lea	rax, [r9 + rax*2]
14583230a	inc	rdx
14583230d	mov	r9, rcx
145832310	add	r9, rdx
145832313	jne	0x1458322f0
145832315	jmp	0x14583246e
14583231a	add	rcx, rdx
14583231d	neg	rcx
145832320	xor	eax, eax
145832322	mov	r9d, 0xa
145832328	xor	r10d, r10d
14583232b	mov	rdx, rcx
14583232e	add	rdx, r10
145832331	je	0x14583246e
145832337	mul	r9
14583233a	jo	0x145832358
14583233c	movzx	r11d, byte ptr [r8 + r10]
145832341	add	r11d, -0x30
145832345	add	rax, r11
145832348	setb	dl
14583234b	cmp	r11d, 9
14583234f	ja	0x145832358
145832351	inc	r10
145832354	test	dl, dl
145832356	je	0x14583232b
145832358	mov	rdx, qword ptr [rbp + 0x1c8]
14583235f	test	rdx, rdx
145832362	je	0x145832377
145832364	mov	r8d, 1
14583236a	mov	rcx, qword ptr [rbp + 0x1c0]
145832371	call	0x1400021d0
145832376	nop
145832377	mov	rcx, qword ptr [rbp + 0x1b8]
14583237e	mov	rdx, rsi
145832381	mov	r8, rdi
145832384	call	0x14580b0d0
145832389	nop
14583238a	test	al, al
14583238c	je	0x1458324ad
145832392	lea	rdx, [rbp - 0x60]
145832396	mov	r8d, 0x14
14583239c	mov	rcx, rdi
14583239f	call	0x145cee4c0
1458323a4	nop
1458323a5	mov	rbx, rdx
1458323a8	test	rdx, rdx
1458323ab	jns	0x1458323bd
1458323ad	xor	edi, edi
1458323af	mov	rcx, rdi
1458323b2	mov	rdx, rbx
1458323b5	call	0x145eb6fcb
1458323ba	nop
1458323bb	ud2
1458323bd	test	rbx, rbx
1458323c0	je	0x145832420
1458323c2	mov	rsi, rax
1458323c5	call	0x140002200
1458323ca	mov	edi, 1
1458323cf	mov	edx, 1
1458323d4	mov	rcx, rbx
1458323d7	call	0x1400021c0
1458323dc	test	rax, rax
1458323df	je	0x1458323af
1458323e1	mov	r14, rax
1458323e4	mov	rcx, rax
1458323e7	mov	rdx, rsi
1458323ea	mov	r8, rbx
1458323ed	call	0x145d145fb
1458323f2	jmp	0x145832426
1458323f4	test	r14, r14
1458323f7	je	0x14583240b
1458323f9	mov	r8d, 1
1458323ff	mov	rcx, r15
145832402	mov	rdx, r14
145832405	call	0x1400021d0
14583240a	nop
14583240b	mov	rcx, qword ptr [rbp + 0x1b8]
145832412	mov	rdx, rsi
145832415	call	0x14580aee0
14583241a	nop
14583241b	jmp	0x145831f20
145832420	mov	r14d, 1
145832426	lea	rcx, [rip + 0x1499a2e]
14583242d	mov	edx, 0x14
145832432	mov	qword ptr [rbp + 0x1c0], r14
145832439	mov	r8, r14
14583243c	mov	r9, rbx
14583243f	mov	qword ptr [rbp + 0x1c8], rbx
145832446	call	0x14580a7a0
14583244b	nop
14583244c	mov	rdx, qword ptr [rbp + 0x1c8]
145832453	test	rdx, rdx
145832456	je	0x1458324ad
145832458	mov	r8d, 1
14583245e	mov	rcx, qword ptr [rbp + 0x1c0]
145832465	call	0x1400021d0
14583246a	jmp	0x1458324ad
14583246c	xor	eax, eax
14583246e	mov	rdx, qword ptr [rbp + 0x1c8]
145832475	test	rdx, rdx
145832478	je	0x145832492
14583247a	mov	r8d, 1
145832480	mov	rcx, qword ptr [rbp + 0x1c0]
145832487	mov	rbx, rax
14583248a	call	0x1400021d0
14583248f	mov	rax, rbx
145832492	mov	rcx, rdi
145832495	sub	rcx, rax
145832498	setae	al
14583249b	cmp	rcx, 0xe10
1458324a2	setb	cl
1458324a5	test	al, cl
1458324a7	je	0x145832377
1458324ad	mov	rdx, qword ptr [rbp + 0x170]
1458324b4	test	rdx, rdx
1458324b7	je	0x1458324cb
1458324b9	mov	r8d, 1
1458324bf	mov	rcx, qword ptr [rbp + 0x1b8]
1458324c6	call	0x1400021d0
1458324cb	mov	rdx, qword ptr [rbp + 0x188]
1458324d2	test	rdx, rdx
1458324d5	je	0x1458324ea
1458324d7	mov	r8d, 1
1458324dd	mov	rcx, qword ptr [rbp + 0x1b0]
1458324e4	call	0x1400021d0
1458324e9	nop
1458324ea	add	rsp, 0x258
1458324f1	pop	rbx
1458324f2	pop	rdi
1458324f3	pop	rsi
1458324f4	pop	r14
1458324f6	pop	r15
1458324f8	pop	rbp
1458324f9	ret
; utc-calendar
145837500	push	rsi
145837501	push	rdi
145837502	push	rbx
145837503	sub	rsp, 0xb0
14583750a	mov	r8, rdx
14583750d	mov	rsi, rcx
145837510	movabs	rcx, 0xc22e450672894ab7
14583751a	mov	rax, rdx
14583751d	mul	rcx
145837520	mov	r9, rdx
145837523	shr	r9, 0x10
145837527	imul	rax, r9, 0x15180
14583752e	sub	r8, rax
145837531	lea	rax, [r9 + 0xafa6c]
145837538	movabs	rcx, 0x396b06bcc8f87
145837542	mul	rcx
145837545	mov	rcx, rdx
145837548	shr	rcx, 3
14583754c	imul	rax, rcx, -0x23ab1
145837553	add	r9, rax
145837556	add	r9, 0xafa6c
14583755d	movabs	r11, 0xd31cc193fd31cc19
145837567	mov	rax, r9
14583756a	imul	r11
14583756d	mov	r10, rdx
145837570	shr	r10, 0x3f
145837574	sar	rdx, 8
145837578	add	r10, rdx
14583757b	add	r10, r9
14583757e	movabs	rdx, 0xe5ac81fa000e5ac9
145837588	mov	rax, r9
14583758b	imul	rdx
14583758e	lea	rbx, [rdx + r9]
145837592	mov	rax, rbx
145837595	shr	rax, 0x3f
145837599	sar	rbx, 0xf
14583759d	add	rbx, rax
1458375a0	movabs	rdx, 0x1a537e05fff1a537
1458375aa	mov	rax, r9
1458375ad	imul	rdx
1458375b0	add	rbx, r10
1458375b3	sub	rdx, r9
1458375b6	mov	rdi, rdx
1458375b9	shr	rdi, 0x3f
1458375bd	sar	rdx, 0x11
1458375c1	add	rdi, rdx
1458375c4	add	rdi, rbx
1458375c7	movabs	rdx, 0x2ce33e6c02ce33e7
1458375d1	mov	rax, rdi
1458375d4	imul	rdx
1458375d7	mov	r10, rdx
1458375da	mov	rax, rdx
1458375dd	shr	rax, 0x3f
1458375e1	sar	r10, 6
1458375e5	add	r10, rax
1458375e8	mov	rax, rdi
1458375eb	imul	r11
1458375ee	mov	r11, rdx
1458375f1	imul	rbx, r10, -0x16d
1458375f8	mov	rax, rdx
1458375fb	shr	rax, 0x3f
1458375ff	sar	r11, 8
145837603	add	r11, rax
145837606	movabs	rdx, 0x1cba6563d8d5e3c7
145837610	mov	rax, rdi
145837613	imul	rdx
145837616	mov	rax, rdx
145837619	shr	rax, 0x3f
14583761d	sar	rdx, 0xc
145837621	add	rdx, rax
145837624	add	r11, r9
145837627	add	r11, rdx
14583762a	add	r11, rbx
14583762d	lea	rax, [r11 + r11*4]
145837631	add	rax, 2
145837635	movabs	rdx, 0x358ae0358ae0358b
14583763f	imul	rdx
145837642	mov	r9, rdx
145837645	mov	rdi, rdx
145837648	shr	rdi, 0x3f
14583764c	sar	r9, 5
145837650	lea	rax, [r9 + rdi]
145837654	imul	rax, rax, 0x99
14583765b	add	rax, 2
14583765f	movabs	rdx, 0x9999999999999999
145837669	imul	rdx
14583766c	mov	rax, rdx
14583766f	shr	rax, 0x3f
145837673	sar	rdx, 1
145837676	add	rdx, rax
145837679	lea	rax, [r11 + rdx]
14583767d	inc	rax
145837680	mov	qword ptr [rsp + 0x20], rax
145837685	cmp	r11, 0x132
14583768c	lea	rax, [r9 + rdi + 3]
145837691	lea	rdx, [r9 + rdi - 9]
145837696	cmovl	rdx, rax
14583769a	mov	qword ptr [rsp + 0x28], rdx
14583769f	imul	rax, rcx, 0x190
1458376a6	add	rax, r10
1458376a9	xor	ecx, ecx
1458376ab	cmp	rdx, 3
1458376af	setl	cl
1458376b2	add	rcx, rax
1458376b5	mov	qword ptr [rsp + 0x30], rcx
1458376ba	imul	rax, r8, 0x123457
1458376c1	shr	rax, 0x20
1458376c5	mov	qword ptr [rsp + 0x38], rax
1458376ca	imul	rax, r8, 0x4444445
1458376d1	shr	rax, 0x20
1458376d5	imul	ecx, eax, 0x889
1458376db	shr	ecx, 0x11
1458376de	imul	ecx, ecx, 0x3c
1458376e1	imul	edx, eax, 0x3c
1458376e4	sub	eax, ecx
1458376e6	movzx	eax, ax
1458376e9	mov	qword ptr [rsp + 0x40], rax
1458376ee	sub	r8d, edx
1458376f1	mov	qword ptr [rsp + 0x48], r8
1458376f6	lea	rax, [rsp + 0x30]
1458376fb	mov	qword ptr [rsp + 0x50], rax
145837700	lea	rax, [rip + 0x4c26b9]
145837707	mov	qword ptr [rsp + 0x58], rax
14583770c	lea	rcx, [rsp + 0x28]
145837711	mov	qword ptr [rsp + 0x60], rcx
145837716	mov	qword ptr [rsp + 0x68], rax
14583771b	lea	rcx, [rsp + 0x20]
145837720	mov	qword ptr [rsp + 0x70], rcx
145837725	mov	qword ptr [rsp + 0x78], rax
14583772a	lea	rax, [rsp + 0x38]
14583772f	mov	qword ptr [rsp + 0x80], rax
145837737	lea	rax, [rip + 0x4c25b2]
14583773e	mov	qword ptr [rsp + 0x88], rax
145837746	lea	rcx, [rsp + 0x40]
14583774b	mov	qword ptr [rsp + 0x90], rcx
145837753	mov	qword ptr [rsp + 0x98], rax
14583775b	lea	rcx, [rsp + 0x48]
145837760	mov	qword ptr [rsp + 0xa0], rcx
145837768	mov	qword ptr [rsp + 0xa8], rax
145837770	lea	rdx, [rip + 0x14946af]
145837777	lea	r8, [rsp + 0x50]
14583777c	mov	rcx, rsi
14583777f	call	0x145ce7350
145837784	mov	rax, rsi
145837787	add	rsp, 0xb0
14583778e	pop	rbx
14583778f	pop	rdi
145837790	pop	rsi
145837791	ret
; export-input
1400ab984	lea	rcx, [rbp - 0x40]
1400ab988	call	0x145836bb0
1400ab98d	nop
1400ab98e	mov	r12, qword ptr [rbp + 0xf90]
1400ab995	lea	r14, [rip + 0x5e3dc64]
1400ab99c	lea	rdi, [rbp + 0x360]
1400ab9a3	mov	byte ptr [rbp + 0xfb7], 1
1400ab9aa	mov	rcx, rdi
1400ab9ad	call	0x1458373d0
1400ab9b2	nop
1400ab9b3	mov	rax, qword ptr [rbp + 0x360]
1400ab9ba	cmp	rax, -1
1400ab9be	je	0x1400ac211
1400ab9c4	mov	qword ptr [rbp + 0xfa8], rax
1400ab9cb	mov	rax, qword ptr [rbp + 0x368]
1400ab9d2	mov	qword ptr [rbp + 0xfb8], rax
1400ab9d9	mov	rbx, qword ptr [rbp + 0x370]
1400ab9e0	mov	byte ptr [rbp + 0xfb6], 1
1400ab9e7	call	0x145002900
1400ab9ec	nop
1400ab9ed	mov	byte ptr [rbp + 0xfb6], 1
1400ab9f4	mov	rcx, rdi
1400ab9f7	mov	rdx, rax
1400ab9fa	call	0x145837500
1400ab9ff	nop
; import-account
145836cb0	push	rbp
145836cb1	push	rsi
145836cb2	push	rdi
145836cb3	push	rbx
145836cb4	sub	rsp, 0x238
145836cbb	lea	rbp, [rsp + 0x80]
145836cc3	mov	qword ptr [rbp + 0x1b0], 0xfffffffffffffffe
145836cce	mov	rdi, r8
145836cd1	mov	rbx, rdx
145836cd4	mov	rsi, rcx
145836cd7	mov	rcx, rdx
145836cda	mov	rdx, r8
145836cdd	call	0x140bc6760
145836ce2	cmp	rdx, 5
145836ce6	jb	0x145836d01
145836ce8	mov	ecx, dword ptr [rip + 0x1803864]
145836cee	xor	ecx, dword ptr [rax]
145836cf0	movzx	edx, byte ptr [rip + 0x180385f]
145836cf7	xor	dl, byte ptr [rax + 4]
145836cfa	movzx	eax, dl
145836cfd	or	eax, ecx
145836cff	je	0x145836d2a
145836d01	lea	rax, [rip + 0x14950e4]
145836d08	mov	qword ptr [rsi + 8], rax
145836d0c	mov	qword ptr [rsi + 0x10], 0xf
145836d14	mov	qword ptr [rsi], 0xffffffffffffffff
145836d1b	mov	rax, rsi
145836d1e	add	rsp, 0x238
145836d25	pop	rbx
145836d26	pop	rdi
145836d27	pop	rsi
145836d28	pop	rbp
145836d29	ret
145836d2a	lea	rcx, [rbp - 0x58]
145836d2e	mov	rdx, rbx
145836d31	mov	r8, rdi
145836d34	call	0x1458d2fb0
145836d39	mov	rax, qword ptr [rbp - 0x58]
145836d3d	cmp	rax, -1
145836d41	je	0x145836e1b
145836d47	mov	qword ptr [rbp + 0x1a0], rax
145836d4e	mov	rdx, qword ptr [rbp - 0x50]
145836d52	mov	r8, qword ptr [rbp - 0x48]
145836d56	lea	rcx, [rbp - 0x58]
145836d5a	mov	qword ptr [rbp + 0x190], rdx
145836d61	call	0x14582cde0
145836d66	nop
145836d67	mov	dword ptr [rbp + 0x170], 0
145836d71	lea	rcx, [rbp + 0x178]
145836d78	call	0x14580ade0
145836d7d	nop
145836d7e	mov	rax, qword ptr [rbp + 0x178]
145836d85	cmp	rax, -1
145836d89	je	0x145836dd8
145836d8b	mov	qword ptr [rbp + 0x1a8], rax
145836d92	mov	r8, qword ptr [rbp + 0x180]
145836d99	mov	r9, qword ptr [rbp + 0x188]
145836da0	lea	rcx, [rip + 0x1495060]
145836da7	mov	edx, 0x18
145836dac	mov	qword ptr [rbp + 0x198], r8
145836db3	call	0x14580a7a0
145836db8	nop
145836db9	mov	rdx, qword ptr [rbp + 0x1a8]
145836dc0	test	rdx, rdx
145836dc3	je	0x145836dd8
145836dc5	mov	r8d, 1
145836dcb	mov	rcx, qword ptr [rbp + 0x198]
145836dd2	call	0x1400021d0
145836dd7	nop
145836dd8	lea	rcx, [rbp - 0x58]
145836ddc	call	0x145831e10
145836de1	nop
145836de2	lea	rdx, [rbp - 0x58]
145836de6	mov	r8d, 0x1d0
145836dec	mov	rcx, rsi
145836def	call	0x145d145fb
145836df4	mov	rdx, qword ptr [rbp + 0x1a0]
145836dfb	test	rdx, rdx
145836dfe	je	0x145836d1b
145836e04	mov	r8d, 1
145836e0a	mov	rcx, qword ptr [rbp + 0x190]
145836e11	call	0x1400021d0
145836e16	jmp	0x145836d1b
145836e1b	lea	rax, [rip + 0x1494fd9]
145836e22	mov	qword ptr [rsi + 8], rax
145836e26	mov	qword ptr [rsi + 0x10], 0xc
145836e2e	jmp	0x145836d14
; parse
145829cf0	push	rsi
145829cf1	sub	rsp, 0x80
145829cf8	mov	qword ptr [rsp + 0x38], 0
145829d01	mov	qword ptr [rsp + 0x40], rdx
145829d06	mov	qword ptr [rsp + 0x48], rcx
145829d0b	mov	qword ptr [rsp + 0x50], rdx
145829d10	mov	qword ptr [rsp + 0x58], 0
145829d19	mov	qword ptr [rsp + 0x60], rdx
145829d1e	movabs	rax, 0x2c0000002c
145829d28	mov	qword ptr [rsp + 0x68], rax
145829d2d	mov	byte ptr [rsp + 0x70], 1
145829d32	mov	word ptr [rsp + 0x78], 1
145829d39	lea	rcx, [rsp + 0x20]
145829d3e	lea	rdx, [rsp + 0x38]
145829d43	call	0x1459ce220
145829d48	cmp	qword ptr [rsp + 0x30], 4
145829d4e	jne	0x145829d72
145829d50	mov	rdx, qword ptr [rsp + 0x20]
145829d55	mov	rcx, qword ptr [rsp + 0x28]
145829d5a	mov	rsi, qword ptr [rcx]
145829d5d	test	rdx, rdx
145829d60	je	0x145829da2
145829d62	add	rdx, rdx
145829d65	mov	r8d, 2
145829d6b	call	0x1400021d0
145829d70	jmp	0x145829da2
145829d72	mov	rdx, qword ptr [rsp + 0x20]
145829d77	mov	rsi, qword ptr [rsp + 0x28]
145829d7c	cmp	rdx, -1
145829d80	je	0x145829da2
145829d82	test	rdx, rdx
145829d85	je	0x145829d98
145829d87	add	rdx, rdx
145829d8a	mov	r8d, 2
145829d90	mov	rcx, rsi
145829d93	call	0x1400021d0
145829d98	movabs	rsi, 0x64006400640064
145829da2	mov	rcx, rsi
145829da5	shr	rcx, 0x30
145829da9	mov	rdx, rsi
145829dac	shr	rdx, 0x20
145829db0	mov	r8d, esi
145829db3	shr	r8d, 0x10
145829db7	movd	xmm0, r8d
145829dbc	pinsrw	xmm0, edx, 1
145829dc1	pxor	xmm0, xmmword ptr [rip + 0x7435e7]
145829dc9	movdqa	xmm1, xmmword ptr [rip + 0x14a140f]
145829dd1	pcmpgtw	xmm1, xmm0
145829dd5	xor	eax, eax
145829dd7	cmp	si, 0x64
145829ddb	setb	al
145829dde	mov	r9, rsi
145829de1	shr	r9, 0x32
145829de5	movd	xmm2, ecx
145829de9	pinsrw	xmm2, edx, 1
145829dee	pinsrw	xmm2, r8d, 2
145829df4	pinsrw	xmm2, esi, 3
145829df9	xor	ecx, ecx
145829dfb	movdqa	xmm0, xmm2
145829dff	psubusw	xmm0, xmmword ptr [rip + 0x14a13e9]
145829e07	cmp	r9d, 0x19
145829e0b	psubw	xmm2, xmm0
145829e0f	paddw	xmm2, xmmword ptr [rip + 0x14a13e9]
145829e17	setb	cl
145829e1a	pextrw	edx, xmm1, 1
145829e1f	movd	xmm0, ecx
145829e23	pinsrw	xmm0, edx, 1
145829e28	pextrw	ecx, xmm1, 0
145829e2d	pinsrw	xmm0, ecx, 2
145829e32	pinsrw	xmm0, eax, 3
145829e37	psllw	xmm0, 0xf
145829e3c	psraw	xmm0, 0xf
145829e41	pandn	xmm0, xmm2
145829e45	pextrw	eax, xmm0, 1
145829e4a	imul	ecx, eax, 0xcccd
145829e50	shr	ecx, 0x12
145829e53	and	ecx, 0xfffffffe
145829e56	lea	ecx, [rcx + rcx*4]
145829e59	sub	eax, ecx
145829e5b	movd	ecx, xmm0
145829e5f	movzx	edx, cx
145829e62	imul	edx, edx, 0xcccd
145829e68	shr	edx, 0x12
145829e6b	lea	edx, [rdx + rdx*4]
145829e6e	sub	ecx, edx
145829e70	movd	xmm1, ecx
145829e74	pinsrw	xmm1, eax, 1
145829e79	pextrw	eax, xmm0, 2
145829e7e	imul	ecx, eax, 0x47af
145829e84	shr	ecx, 0x10
145829e87	mov	edx, eax
145829e89	sub	edx, ecx
145829e8b	movzx	edx, dx
145829e8e	shr	edx, 1
145829e90	add	edx, ecx
145829e92	shr	edx, 4
145829e95	lea	ecx, [rdx + rdx*4]
145829e98	lea	ecx, [rcx + rcx*4]
145829e9b	sub	eax, ecx
145829e9d	pinsrw	xmm1, eax, 2
145829ea2	pextrw	eax, xmm0, 3
145829ea7	imul	ecx, eax, 0x47af
145829ead	shr	ecx, 0x10
145829eb0	mov	edx, eax
145829eb2	sub	edx, ecx
145829eb4	movzx	edx, dx
145829eb7	shr	edx, 1
145829eb9	add	edx, ecx
145829ebb	shr	edx, 4
145829ebe	lea	ecx, [rdx + rdx*4]
145829ec1	lea	ecx, [rcx + rcx*4]
145829ec4	sub	eax, ecx
145829ec6	pinsrw	xmm1, eax, 3
145829ecb	psubw	xmm0, xmm1
145829ecf	paddw	xmm0, xmmword ptr [rip + 0x14a1339]
145829ed7	pxor	xmm1, xmm1
145829edb	movdqa	xmm2, xmm0
145829edf	punpcklwd	xmm2, xmm1
145829ee3	movdqa	xmm3, xmm2
145829ee7	punpckhdq	xmm3, xmm1
145829eeb	punpckldq	xmm1, xmm2
145829eef	psllq	xmm0, 0x30
145829ef4	shufps	xmm0, xmm1, 0xe4
145829ef8	movdqa	xmm1, xmm3
145829efc	psllq	xmm1, 0x10
145829f01	shufps	xmm1, xmm3, 0xe4
145829f05	orps	xmm1, xmm0
145829f08	pshufd	xmm0, xmm1, 0xee
145829f0d	por	xmm0, xmm1
145829f11	movq	rax, xmm0
145829f16	add	rsp, 0x80
145829f1d	pop	rsi
145829f1e	ret
; csv
1459ce220	push	rbp
1459ce221	push	r15
1459ce223	push	r14
1459ce225	push	r13
1459ce227	push	r12
1459ce229	push	rsi
1459ce22a	push	rdi
1459ce22b	push	rbx
1459ce22c	sub	rsp, 0xc8
1459ce233	lea	rbp, [rsp + 0x80]
1459ce23b	mov	qword ptr [rbp + 0x40], 0xfffffffffffffffe
1459ce243	mov	rbx, rdx
1459ce246	mov	qword ptr [rbp + 8], rcx
1459ce24a	lea	rdi, [rdx + 0x10]
1459ce24e	lea	r14, [rbp - 0x40]
1459ce252	mov	si, 0xa
1459ce256	jmp	0x1459ce270
1459ce258	nop	dword ptr [rax + rax]
1459ce260	mov	r12d, 1
1459ce266	test	r12b, 1
1459ce26a	je	0x1459ce455
1459ce270	cmp	byte ptr [rbx + 0x41], 0
1459ce274	jne	0x1459ce435
1459ce27a	mov	r15, qword ptr [rdi]
1459ce27d	mov	rcx, r14
1459ce280	mov	rdx, rdi
1459ce283	call	0x1459d1fe0
1459ce288	cmp	dword ptr [rbp - 0x40], 1
1459ce28c	jne	0x1459ce2b0
1459ce28e	mov	rcx, qword ptr [rbp - 0x38]
1459ce292	mov	rax, qword ptr [rbp - 0x30]
1459ce296	mov	rdx, qword ptr [rbx]
1459ce299	sub	rcx, rdx
1459ce29c	add	r15, rdx
1459ce29f	mov	qword ptr [rbx], rax
1459ce2a2	test	rcx, rcx
1459ce2a5	jne	0x1459ce2de
1459ce2a7	jmp	0x1459ce260
1459ce2a9	nop	dword ptr [rax]
1459ce2b0	cmp	byte ptr [rbx + 0x41], 0
1459ce2b4	jne	0x1459ce435
1459ce2ba	mov	byte ptr [rbx + 0x41], 1
1459ce2be	mov	r15, qword ptr [rbx]
1459ce2c1	mov	rcx, qword ptr [rbx + 8]
1459ce2c5	sub	rcx, r15
1459ce2c8	setne	al
1459ce2cb	or	al, byte ptr [rbx + 0x40]
1459ce2ce	cmp	al, 1
1459ce2d0	jne	0x1459ce435
1459ce2d6	add	r15, qword ptr [rdi]
1459ce2d9	test	rcx, rcx
1459ce2dc	je	0x1459ce260
1459ce2de	cmp	rcx, 1
1459ce2e2	jne	0x1459ce310
1459ce2e4	movzx	edx, byte ptr [r15]
1459ce2e8	mov	r12d, 0x101
1459ce2ee	cmp	edx, 0x2b
1459ce2f1	je	0x1459ce266
1459ce2f7	cmp	edx, 0x2d
1459ce2fa	je	0x1459ce266
1459ce300	jmp	0x1459ce314
1459ce302	nop	word ptr cs:[rax + rax]
1459ce310	movzx	edx, byte ptr [r15]
1459ce314	xor	eax, eax
1459ce316	cmp	dl, 0x2b
1459ce319	sete	al
1459ce31c	mov	rdx, rcx
1459ce31f	sub	rdx, rax
1459ce322	add	r15, rax
1459ce325	cmp	rdx, 5
1459ce329	jae	0x1459ce3c0
1459ce32f	test	rdx, rdx
1459ce332	je	0x1459ce40b
1459ce338	movzx	eax, byte ptr [r15]
1459ce33c	add	eax, -0x30
1459ce33f	mov	r12d, 0x101
1459ce345	cmp	eax, 9
1459ce348	ja	0x1459ce266
1459ce34e	cmp	rdx, 1
1459ce352	je	0x1459ce40d
1459ce358	movzx	ecx, byte ptr [r15 + 1]
1459ce35d	add	ecx, -0x30
1459ce360	cmp	ecx, 9
1459ce363	ja	0x1459ce266
1459ce369	cwde
1459ce36a	add	eax, eax
1459ce36c	lea	eax, [rax + rax*4]
1459ce36f	add	eax, ecx
1459ce371	cmp	rdx, 2
1459ce375	je	0x1459ce40d
1459ce37b	movzx	ecx, byte ptr [r15 + 2]
1459ce380	add	ecx, -0x30
1459ce383	cmp	ecx, 9
1459ce386	ja	0x1459ce266
1459ce38c	add	eax, eax
1459ce38e	lea	eax, [rax + rax*4]
1459ce391	add	eax, ecx
1459ce393	cmp	rdx, 3
1459ce397	je	0x1459ce40d
1459ce399	movzx	ecx, byte ptr [r15 + 3]
1459ce39e	add	ecx, -0x30
1459ce3a1	cmp	ecx, 9
1459ce3a4	ja	0x1459ce266
1459ce3aa	add	eax, eax
1459ce3ac	lea	eax, [rax + rax*4]
1459ce3af	add	eax, ecx
1459ce3b1	jmp	0x1459ce40d
1459ce3b3	nop	word ptr cs:[rax + rax]
1459ce3c0	neg	rax
1459ce3c3	add	rcx, rax
1459ce3c6	neg	rcx
1459ce3c9	xor	r8d, r8d
1459ce3cc	xor	eax, eax
1459ce3ce	nop
1459ce3d0	mov	rdx, rcx
1459ce3d3	add	rdx, r8
1459ce3d6	je	0x1459ce40d
1459ce3d8	mul	si
1459ce3db	movzx	edx, byte ptr [r15 + r8]
1459ce3e0	jo	0x1459ce418
1459ce3e2	movzx	edx, dl
1459ce3e5	add	edx, -0x30
1459ce3e8	cmp	edx, 0xa
1459ce3eb	jae	0x1459ce400
1459ce3ed	inc	r8
1459ce3f0	add	ax, dx
1459ce3f3	jae	0x1459ce3d0
1459ce3f5	mov	r12d, 0x201
1459ce3fb	jmp	0x1459ce266
1459ce400	mov	r12d, 0x101
1459ce406	jmp	0x1459ce266
1459ce40b	xor	eax, eax
1459ce40d	shl	eax, 0x10
1459ce410	mov	r12d, eax
1459ce413	jmp	0x1459ce266
1459ce418	add	dl, 0xd0
1459ce41b	xor	r12d, r12d
1459ce41e	cmp	dl, 0xa
1459ce421	setb	r12b
1459ce425	shl	r12d, 8
1459ce429	add	r12d, 0x101
1459ce430	jmp	0x1459ce266
1459ce435	mov	rax, qword ptr [rbp + 8]
1459ce439	mov	qword ptr [rax], 0
1459ce440	mov	qword ptr [rax + 8], 2
1459ce448	mov	qword ptr [rax + 0x10], 0
1459ce450	jmp	0x1459ce856
1459ce455	call	0x140002200
1459ce45a	mov	ecx, 8
1459ce45f	mov	edx, 2
1459ce464	call	0x1400021c0
1459ce469	test	rax, rax
1459ce46c	je	0x1459ce86a
1459ce472	shr	r12d, 0x10
1459ce476	mov	word ptr [rax], r12w
1459ce47a	mov	qword ptr [rbp + 0x18], 4
1459ce482	mov	qword ptr [rbp + 0x10], rax
1459ce486	mov	qword ptr [rbp + 0x20], rax
1459ce48a	mov	qword ptr [rbp + 0x28], 1
1459ce492	movups	xmm0, xmmword ptr [rbx]
1459ce495	movups	xmm1, xmmword ptr [rbx + 0x10]
1459ce499	movups	xmm2, xmmword ptr [rbx + 0x20]
1459ce49d	movups	xmm3, xmmword ptr [rbx + 0x30]
1459ce4a1	movaps	xmmword ptr [rbp - 0x30], xmm1
1459ce4a5	movaps	xmmword ptr [rbp - 0x20], xmm2
1459ce4a9	movaps	xmmword ptr [rbp - 0x10], xmm3
1459ce4ad	movaps	xmmword ptr [rbp - 0x40], xmm0
1459ce4b1	mov	rcx, qword ptr [rbx + 0x40]
1459ce4b5	mov	qword ptr [rbp - 0x50], rcx
1459ce4b9	mov	qword ptr [rbp], rcx
1459ce4bd	mov	r15, qword ptr [rbp - 0x30]
1459ce4c1	mov	rdi, qword ptr [rbp - 0x28]
1459ce4c5	mov	rsi, qword ptr [rbp - 0x18]
1459ce4c9	movzx	eax, byte ptr [rbp - 8]
1459ce4cd	mov	byte ptr [rbp + 0x3f], al
1459ce4d0	movzx	ebx, al
1459ce4d3	mov	eax, 1
1459ce4d8	mov	qword ptr [rbp + 0x30], rax
1459ce4dc	mov	rax, qword ptr [rbp - 0x38]
1459ce4e0	mov	qword ptr [rbp - 0x48], rax
1459ce4e4	movzx	ecx, byte ptr [rbp + 1]
1459ce4e8	jmp	0x1459ce500
1459ce4ea	nop	word ptr [rax + rax]
1459ce4f0	mov	r12d, 1
1459ce4f6	test	r12b, 1
1459ce4fa	je	0x1459ce7f1
1459ce500	test	cl, 1
1459ce503	jne	0x1459ce843
1459ce509	cmp	rsi, rdi
1459ce50c	seta	al
1459ce50f	mov	r12, qword ptr [rbp - 0x20]
1459ce513	cmp	rsi, r12
1459ce516	setb	cl
1459ce519	or	cl, al
1459ce51b	jne	0x1459ce64b
1459ce521	movzx	r13d, byte ptr [rbp + rbx - 0x11]
1459ce527	cmp	byte ptr [rbp + 0x3f], 5
1459ce52b	jb	0x1459ce5b9
1459ce531	mov	r8, rsi
1459ce534	sub	r8, r12
1459ce537	lea	rax, [r15 + r12]
1459ce53b	cmp	r8, 0xf
1459ce53f	ja	0x1459ce565
1459ce541	xor	edx, edx
1459ce543	test	r8, r8
1459ce546	je	0x1459ce561
1459ce548	nop	dword ptr [rax + rax]
1459ce550	cmp	byte ptr [rax + rdx], r13b
1459ce554	je	0x1459ce573
1459ce556	inc	rdx
1459ce559	cmp	r8, rdx
1459ce55c	jne	0x1459ce550
1459ce55e	mov	rdx, r8
1459ce561	xor	eax, eax
1459ce563	jmp	0x1459ce578
1459ce565	mov	ecx, r13d
1459ce568	mov	rdx, rax
1459ce56b	call	0x145cefd80
1459ce570	nop
1459ce571	jmp	0x1459ce578
1459ce573	mov	eax, 1
1459ce578	cmp	rax, 1
1459ce57c	jne	0x1459ce647
1459ce582	add	r12, rdx
1459ce585	inc	r12
1459ce588	mov	qword ptr [rbp - 0x20], r12
1459ce58c	cmp	r12, rbx
1459ce58f	setb	al
1459ce592	cmp	r12, rdi
1459ce595	seta	cl
1459ce598	or	cl, al
1459ce59a	je	0x1459ce87b
1459ce5a0	cmp	rsi, r12
1459ce5a3	jae	0x1459ce531
1459ce5a5	jmp	0x1459ce64b
1459ce5aa	nop	word ptr [rax + rax]
1459ce5b0	cmp	rsi, r12
1459ce5b3	jb	0x1459ce64b
1459ce5b9	mov	r8, rsi
1459ce5bc	sub	r8, r12
1459ce5bf	lea	rax, [r15 + r12]
1459ce5c3	cmp	r8, 0x10
1459ce5c7	jae	0x1459ce5f0
1459ce5c9	xor	edx, edx
1459ce5cb	test	r8, r8
1459ce5ce	je	0x1459ce5e1
1459ce5d0	cmp	byte ptr [rax + rdx], r13b
1459ce5d4	je	0x1459ce63c
1459ce5d6	inc	rdx
1459ce5d9	cmp	r8, rdx
1459ce5dc	jne	0x1459ce5d0
1459ce5de	mov	rdx, r8
1459ce5e1	xor	eax, eax
1459ce5e3	cmp	rax, 1
1459ce5e7	je	0x1459ce602
1459ce5e9	jmp	0x1459ce647
1459ce5eb	nop	dword ptr [rax + rax]
1459ce5f0	mov	ecx, r13d
1459ce5f3	mov	rdx, rax
1459ce5f6	call	0x145cefd80
1459ce5fb	nop
1459ce5fc	cmp	rax, 1
1459ce600	jne	0x1459ce647
1459ce602	add	r12, rdx
1459ce605	inc	r12
1459ce608	mov	qword ptr [rbp - 0x20], r12
1459ce60c	mov	r14, r12
1459ce60f	sub	r14, rbx
1459ce612	setb	al
1459ce615	cmp	r12, rdi
1459ce618	seta	cl
1459ce61b	or	cl, al
1459ce61d	jne	0x1459ce5b0
1459ce61f	lea	rcx, [r15 + r14]
1459ce623	lea	rdx, [rbp - 0x10]
1459ce627	mov	r8, rbx
1459ce62a	call	0x145d14601
1459ce62f	test	eax, eax
1459ce631	jne	0x1459ce5b0
1459ce637	jmp	0x1459ce7ac
1459ce63c	mov	eax, 1
1459ce641	cmp	rax, 1
1459ce645	je	0x1459ce602
1459ce647	mov	qword ptr [rbp - 0x20], rsi
1459ce64b	mov	byte ptr [rbp + 1], 1
1459ce64f	mov	r8, qword ptr [rbp - 0x40]
1459ce653	mov	r14, qword ptr [rbp - 0x48]
1459ce657	sub	r14, r8
1459ce65a	setne	al
1459ce65d	or	al, byte ptr [rbp - 0x50]
1459ce660	test	al, 1
1459ce662	je	0x1459ce843
1459ce668	mov	cl, 1
1459ce66a	test	r14, r14
1459ce66d	je	0x1459ce4f0
1459ce673	add	r8, r15
1459ce676	cmp	r14, 1
1459ce67a	jne	0x1459ce6a0
1459ce67c	movzx	edx, byte ptr [r8]
1459ce680	mov	r12d, 0x101
1459ce686	cmp	edx, 0x2b
1459ce689	je	0x1459ce4f6
1459ce68f	cmp	edx, 0x2d
1459ce692	je	0x1459ce4f6
1459ce698	jmp	0x1459ce6a4
1459ce69a	nop	word ptr [rax + rax]
1459ce6a0	movzx	edx, byte ptr [r8]
1459ce6a4	xor	eax, eax
1459ce6a6	cmp	dl, 0x2b
1459ce6a9	sete	al
1459ce6ac	mov	rdx, r14
1459ce6af	sub	rdx, rax
1459ce6b2	add	r8, rax
1459ce6b5	cmp	rdx, 5
1459ce6b9	jae	0x1459ce750
1459ce6bf	test	rdx, rdx
1459ce6c2	je	0x1459ce7c7
1459ce6c8	movzx	eax, byte ptr [r8]
1459ce6cc	add	eax, -0x30
1459ce6cf	mov	r12d, 0x101
1459ce6d5	cmp	eax, 9
1459ce6d8	ja	0x1459ce4f6
1459ce6de	cmp	rdx, 1
1459ce6e2	je	0x1459ce7c9
1459ce6e8	movzx	r9d, byte ptr [r8 + 1]
1459ce6ed	add	r9d, -0x30
1459ce6f1	cmp	r9d, 9
1459ce6f5	ja	0x1459ce4f6
1459ce6fb	cwde
1459ce6fc	add	eax, eax
1459ce6fe	lea	eax, [rax + rax*4]
1459ce701	add	eax, r9d
1459ce704	cmp	rdx, 2
1459ce708	je	0x1459ce7c9
1459ce70e	movzx	r9d, byte ptr [r8 + 2]
1459ce713	add	r9d, -0x30
1459ce717	cmp	r9d, 9
1459ce71b	ja	0x1459ce4f6
1459ce721	add	eax, eax
1459ce723	lea	eax, [rax + rax*4]
1459ce726	add	eax, r9d
1459ce729	cmp	rdx, 3
1459ce72d	je	0x1459ce7c9
1459ce733	movzx	edx, byte ptr [r8 + 3]
1459ce738	add	edx, -0x30
1459ce73b	cmp	edx, 9
1459ce73e	ja	0x1459ce4f6
1459ce744	add	eax, eax
1459ce746	lea	eax, [rax + rax*4]
1459ce749	add	eax, edx
1459ce74b	jmp	0x1459ce7c9
1459ce750	neg	rax
1459ce753	add	r14, rax
1459ce756	neg	r14
1459ce759	xor	r9d, r9d
1459ce75c	xor	eax, eax
1459ce75e	mov	r10w, 0xa
1459ce763	nop	word ptr cs:[rax + rax]
1459ce770	mov	rdx, r14
1459ce773	add	rdx, r9
1459ce776	je	0x1459ce7c9
1459ce778	mul	r10w
1459ce77c	movzx	edx, byte ptr [r8 + r9]
1459ce781	jo	0x1459ce7d4
1459ce783	movzx	edx, dl
1459ce786	add	edx, -0x30
1459ce789	cmp	edx, 0xa
1459ce78c	jae	0x1459ce7a1
1459ce78e	inc	r9
1459ce791	add	ax, dx
1459ce794	jae	0x1459ce770
1459ce796	mov	r12d, 0x201
1459ce79c	jmp	0x1459ce4f6
1459ce7a1	mov	r12d, 0x101
1459ce7a7	jmp	0x1459ce4f6
1459ce7ac	mov	r8, qword ptr [rbp - 0x40]
1459ce7b0	sub	r14, r8
1459ce7b3	mov	qword ptr [rbp - 0x40], r12
1459ce7b7	xor	ecx, ecx
1459ce7b9	test	r14, r14
1459ce7bc	jne	0x1459ce673
1459ce7c2	jmp	0x1459ce4f0
1459ce7c7	xor	eax, eax
1459ce7c9	shl	eax, 0x10
1459ce7cc	mov	r12d, eax
1459ce7cf	jmp	0x1459ce4f6
1459ce7d4	add	dl, 0xd0
1459ce7d7	xor	r12d, r12d
1459ce7da	cmp	dl, 0xa
1459ce7dd	setb	r12b
1459ce7e1	shl	r12d, 8
1459ce7e5	add	r12d, 0x101
1459ce7ec	jmp	0x1459ce4f6
1459ce7f1	mov	rdx, qword ptr [rbp + 0x30]
1459ce7f5	cmp	rdx, qword ptr [rbp + 0x18]
1459ce7f9	mov	rax, qword ptr [rbp + 0x10]
1459ce7fd	jne	0x1459ce826
1459ce7ff	mov	qword ptr [rsp + 0x20], 2
1459ce808	mov	r8d, 1
1459ce80e	mov	r9d, 2
1459ce814	lea	rcx, [rbp + 0x18]
1459ce818	call	0x145d14a10
1459ce81d	nop
1459ce81e	mov	rax, qword ptr [rbp + 0x20]
1459ce822	mov	rdx, qword ptr [rbp + 0x30]
1459ce826	shr	r12d, 0x10
1459ce82a	mov	qword ptr [rbp + 0x10], rax
1459ce82e	mov	word ptr [rax + rdx*2], r12w
1459ce833	inc	rdx
1459ce836	mov	qword ptr [rbp + 0x30], rdx
1459ce83a	mov	qword ptr [rbp + 0x28], rdx
1459ce83e	jmp	0x1459ce4e4
1459ce843	mov	rcx, qword ptr [rbp + 0x28]
1459ce847	mov	rax, qword ptr [rbp + 8]
1459ce84b	mov	qword ptr [rax + 0x10], rcx
1459ce84f	movups	xmm0, xmmword ptr [rbp + 0x18]
1459ce853	movups	xmmword ptr [rax], xmm0
1459ce856	add	rsp, 0xc8
1459ce85d	pop	rbx
1459ce85e	pop	rdi
1459ce85f	pop	rsi
1459ce860	pop	r12
1459ce862	pop	r13
1459ce864	pop	r14
1459ce866	pop	r15
1459ce868	pop	rbp
1459ce869	ret
1459ce86a	mov	ecx, 2
1459ce86f	mov	edx, 8
1459ce874	call	0x145eb6fcb
1459ce879	ud2
1459ce87b	lea	r9, [rip + 0x196b73e]
1459ce882	mov	r8d, 4
1459ce888	xor	ecx, ecx
1459ce88a	mov	rdx, rbx
1459ce88d	call	0x145eb7570
1459ce892	nop
1459ce893	ud2
; split
1459d1fe0	push	r15
1459d1fe2	push	r14
1459d1fe4	push	r13
1459d1fe6	push	r12
1459d1fe8	push	rsi
1459d1fe9	push	rdi
1459d1fea	push	rbp
1459d1feb	push	rbx
1459d1fec	sub	rsp, 0x28
1459d1ff0	mov	rdi, rdx
1459d1ff3	mov	r12, qword ptr [rdx + 8]
1459d1ff7	mov	r15, qword ptr [rdx + 0x18]
1459d1ffb	cmp	r15, r12
1459d1ffe	seta	al
1459d2001	mov	r14, qword ptr [rdx + 0x10]
1459d2005	cmp	r15, r14
1459d2008	setb	dl
1459d200b	or	dl, al
1459d200d	jne	0x1459d216b
1459d2013	mov	rsi, qword ptr [rdi]
1459d2016	movzx	ebx, byte ptr [rdi + 0x28]
1459d201a	movzx	ebp, byte ptr [rdi + rbx + 0x1f]
1459d201f	cmp	rbx, 5
1459d2023	mov	qword ptr [rsp + 0x20], rcx
1459d2028	jb	0x1459d20b9
1459d202e	mov	r8, r15
1459d2031	sub	r8, r14
1459d2034	lea	rax, [rsi + r14]
1459d2038	cmp	r8, 0xf
1459d203c	ja	0x1459d205a
1459d203e	xor	edx, edx
1459d2040	test	r8, r8
1459d2043	je	0x1459d2066
1459d2045	cmp	byte ptr [rax + rdx], bpl
1459d2049	je	0x1459d206a
1459d204b	inc	rdx
1459d204e	cmp	r8, rdx
1459d2051	jne	0x1459d2045
1459d2053	mov	rdx, r8
1459d2056	xor	eax, eax
1459d2058	jmp	0x1459d206f
1459d205a	mov	ecx, ebp
1459d205c	mov	rdx, rax
1459d205f	call	0x145cefd80
1459d2064	jmp	0x1459d206f
1459d2066	xor	eax, eax
1459d2068	jmp	0x1459d206f
1459d206a	mov	eax, 1
1459d206f	cmp	rax, 1
1459d2073	jne	0x1459d2159
1459d2079	add	r14, rdx
1459d207c	inc	r14
1459d207f	mov	qword ptr [rdi + 0x10], r14
1459d2083	cmp	r14, rbx
1459d2086	setb	al
1459d2089	cmp	r14, r12
1459d208c	seta	cl
1459d208f	or	cl, al
1459d2091	je	0x1459d2181
1459d2097	cmp	r15, r14
1459d209a	mov	rcx, qword ptr [rsp + 0x20]
1459d209f	mov	eax, 0
1459d20a4	jae	0x1459d202e
1459d20a6	jmp	0x1459d216d
1459d20ab	nop	dword ptr [rax + rax]
1459d20b0	cmp	r15, r14
1459d20b3	jb	0x1459d2166
1459d20b9	mov	r8, r15
1459d20bc	sub	r8, r14
1459d20bf	lea	rax, [rsi + r14]
1459d20c3	cmp	r8, 0x10
1459d20c7	jae	0x1459d20f0
1459d20c9	xor	edx, edx
1459d20cb	test	r8, r8
1459d20ce	je	0x1459d20e1
1459d20d0	cmp	byte ptr [rax + rdx], bpl
1459d20d4	je	0x1459d2102
1459d20d6	inc	rdx
1459d20d9	cmp	r8, rdx
1459d20dc	jne	0x1459d20d0
1459d20de	mov	rdx, r8
1459d20e1	xor	eax, eax
1459d20e3	cmp	rax, 1
1459d20e7	je	0x1459d2110
1459d20e9	jmp	0x1459d2159
1459d20eb	nop	dword ptr [rax + rax]
1459d20f0	mov	ecx, ebp
1459d20f2	mov	rdx, rax
1459d20f5	call	0x145cefd80
1459d20fa	cmp	rax, 1
1459d20fe	je	0x1459d2110
1459d2100	jmp	0x1459d2159
1459d2102	mov	eax, 1
1459d2107	cmp	rax, 1
1459d210b	jne	0x1459d2159
1459d210d	nop	dword ptr [rax]
1459d2110	add	r14, rdx
1459d2113	inc	r14
1459d2116	mov	qword ptr [rdi + 0x10], r14
1459d211a	mov	r13, r14
1459d211d	sub	r13, rbx
1459d2120	setb	al
1459d2123	cmp	r14, r12
1459d2126	seta	cl
1459d2129	or	cl, al
1459d212b	jne	0x1459d20b0
1459d212d	lea	rcx, [rsi + r13]
1459d2131	lea	rdx, [rdi + 0x20]
1459d2135	mov	r8, rbx
1459d2138	call	0x145d14601
1459d213d	test	eax, eax
1459d213f	jne	0x1459d20b0
1459d2145	mov	rcx, qword ptr [rsp + 0x20]
1459d214a	mov	qword ptr [rcx + 8], r13
1459d214e	mov	qword ptr [rcx + 0x10], r14
1459d2152	mov	eax, 1
1459d2157	jmp	0x1459d216d
1459d2159	mov	qword ptr [rdi + 0x10], r15
1459d215d	xor	eax, eax
1459d215f	mov	rcx, qword ptr [rsp + 0x20]
1459d2164	jmp	0x1459d216d
1459d2166	mov	rcx, qword ptr [rsp + 0x20]
1459d216b	xor	eax, eax
1459d216d	mov	qword ptr [rcx], rax
1459d2170	add	rsp, 0x28
1459d2174	pop	rbx
1459d2175	pop	rbp
1459d2176	pop	rdi
1459d2177	pop	rsi
1459d2178	pop	r12
1459d217a	pop	r13
1459d217c	pop	r14
1459d217e	pop	r15
1459d2180	ret
1459d2181	lea	r9, [rip + 0x1967e38]
1459d2188	mov	r8d, 4
1459d218e	xor	ecx, ecx
1459d2190	mov	rdx, rbx
1459d2193	call	0x145eb7570
1459d2198	ud2
; memchr
145cefd80	push	r14
145cefd82	push	rsi
145cefd83	push	rdi
145cefd84	push	rbx
145cefd85	mov	r9, rdx
145cefd88	add	rdx, 7
145cefd8c	and	rdx, 0xfffffffffffffff8
145cefd90	sub	rdx, r9
145cefd93	jne	0x145cefd9d
145cefd95	lea	rax, [r8 - 0x10]
145cefd99	xor	edx, edx
145cefd9b	jmp	0x145cefdcb
145cefd9d	cmp	r8, rdx
145cefda0	cmovb	rdx, r8
145cefda4	test	r8, r8
145cefda7	je	0x145cefdc2
145cefda9	xor	r10d, r10d
145cefdac	nop	dword ptr [rax]
145cefdb0	cmp	byte ptr [r9 + r10], cl
145cefdb4	je	0x145cefe57
145cefdba	inc	r10
145cefdbd	cmp	rdx, r10
145cefdc0	jne	0x145cefdb0
145cefdc2	lea	rax, [r8 - 0x10]
145cefdc6	cmp	rdx, rax
145cefdc9	ja	0x145cefe35
145cefdcb	movzx	r11d, cl
145cefdcf	movabs	r10, 0x101010101010101
145cefdd9	imul	r10, r11
145cefddd	movabs	r11, 0x101010101010100
145cefde7	movabs	rsi, 0x8080808080808080
145cefdf1	nop	word ptr cs:[rax + rax]
145cefe00	mov	rdi, qword ptr [r9 + rdx]
145cefe04	xor	rdi, r10
145cefe07	mov	rbx, r11
145cefe0a	sub	rbx, rdi
145cefe0d	or	rbx, rdi
145cefe10	mov	rdi, qword ptr [r9 + rdx + 8]
145cefe15	xor	rdi, r10
145cefe18	mov	r14, r11
145cefe1b	sub	r14, rdi
145cefe1e	or	r14, rdi
145cefe21	and	r14, rbx
145cefe24	not	r14
145cefe27	test	r14, rsi
145cefe2a	jne	0x145cefe35
145cefe2c	add	rdx, 0x10
145cefe30	cmp	rdx, rax
145cefe33	jbe	0x145cefe00
145cefe35	xor	eax, eax
145cefe37	cmp	r8, rdx
145cefe3a	je	0x145cefe4e
145cefe3c	nop	dword ptr [rax]
145cefe40	cmp	byte ptr [r9 + rdx], cl
145cefe44	je	0x145cefe50
145cefe46	inc	rdx
145cefe49	cmp	r8, rdx
145cefe4c	jne	0x145cefe40
145cefe4e	jmp	0x145cefe5f
145cefe50	mov	eax, 1
145cefe55	jmp	0x145cefe5f
145cefe57	mov	eax, 1
145cefe5c	mov	rdx, r10
145cefe5f	pop	rbx
145cefe60	pop	rdi
145cefe61	pop	rsi
145cefe62	pop	r14
145cefe64	ret
; difficulty
145829f20	movd	xmm0, dword ptr [rcx]
145829f24	pxor	xmm1, xmm1
145829f28	punpcklwd	xmm0, xmm1
145829f2c	cvtdq2ps	xmm0, xmm0
145829f2f	movaps	xmm2, xmmword ptr [rip + 0x14a12ea]
145829f36	addps	xmm0, xmm2
145829f39	movaps	xmm3, xmmword ptr [rip + 0x139f4c0]
145829f40	divps	xmm0, xmm3
145829f43	mulps	xmm0, xmmword ptr [rip + 0x14a12e6]
145829f4a	movd	xmm4, dword ptr [rcx + 4]
145829f4f	punpcklwd	xmm4, xmm1
145829f53	cvtdq2ps	xmm1, xmm4
145829f56	addps	xmm1, xmm2
145829f59	divps	xmm1, xmm3
145829f5c	mulps	xmm1, xmmword ptr [rip + 0x14a12dd]
145829f63	movshdup	xmm2, xmm0
145829f67	addss	xmm2, xmm0
145829f6b	addss	xmm2, xmm1
145829f6f	movshdup	xmm0, xmm1
145829f73	addss	xmm0, xmm2
145829f77	addss	xmm0, dword ptr [rip + 0x6b5f31]
145829f7f	ret
; adjust
145829f80	sub	rsp, 0x28
145829f84	cmp	rdx, 3
145829f88	ja	0x145829fe0
145829f8a	lea	rax, [rdx + rdx*2]
145829f8e	shl	rax, 4
145829f92	lea	r9, [rip + 0x14a18b7]
145829f99	movzx	r10d, word ptr [rax + r9 + 0x26]
145829f9f	test	r8d, r8d
145829fa2	sets	r8b
145829fa6	setg	r11b
145829faa	sub	r11b, r8b
145829fad	movsx	r8d, r11b
145829fb1	movzx	eax, word ptr [rax + r9 + 0x28]
145829fb7	imul	eax, r8d
145829fbb	movzx	r8d, word ptr [rcx + rdx*2]
145829fc0	add	r8d, eax
145829fc3	cmp	r8d, r10d
145829fc6	cmovb	r10d, r8d
145829fca	cmp	r8d, 0x64
145829fce	mov	eax, 0x64
145829fd3	cmovge	eax, r10d
145829fd7	mov	word ptr [rcx + rdx*2], ax
145829fdb	add	rsp, 0x28
145829fdf	ret
145829fe0	lea	r8, [rip + 0x14a1951]
145829fe7	mov	rcx, rdx
145829fea	mov	edx, 4
145829fef	call	0x145eb7363
145829ff4	ud2
; reward
14582a000	movd	xmm0, dword ptr [rcx]
14582a004	pxor	xmm1, xmm1
14582a008	punpcklwd	xmm0, xmm1
14582a00c	cvtdq2ps	xmm0, xmm0
14582a00f	movaps	xmm2, xmmword ptr [rip + 0x14a120a]
14582a016	addps	xmm0, xmm2
14582a019	movaps	xmm3, xmmword ptr [rip + 0x139f3e0]
14582a020	divps	xmm0, xmm3
14582a023	mulps	xmm0, xmmword ptr [rip + 0x14a1206]
14582a02a	movd	xmm4, dword ptr [rcx + 4]
14582a02f	punpcklwd	xmm4, xmm1
14582a033	cvtdq2ps	xmm1, xmm4
14582a036	addps	xmm1, xmm2
14582a039	divps	xmm1, xmm3
14582a03c	mulps	xmm1, xmmword ptr [rip + 0x14a11fd]
14582a043	movshdup	xmm2, xmm0
14582a047	addss	xmm2, xmm0
14582a04b	addss	xmm2, xmm1
14582a04f	movshdup	xmm0, xmm1
14582a053	addss	xmm0, xmm2
14582a057	addss	xmm0, dword ptr [rip + 0x6b5e51]
14582a05f	minss	xmm0, dword ptr [rip + 0x6b6249]
14582a067	ret
