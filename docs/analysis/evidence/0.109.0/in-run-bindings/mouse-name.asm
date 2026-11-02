140722b60	push	rbp
140722b61	push	rsi
140722b62	push	rbx
140722b63	sub	rsp, 0xa0
140722b6a	lea	rbp, [rsp + 0x80]
140722b72	mov	qword ptr [rbp + 0x18], 0xfffffffffffffffe
140722b7a	mov	rsi, rcx
140722b7d	movzx	ecx, dx
140722b80	lea	eax, [rcx - 2]
140722b83	cmp	eax, 3
140722b86	ja	0x140722bc1
140722b88	lea	rcx, [rip + 0x579b511]
140722b8f	movsxd	rax, dword ptr [rcx + rax*4]
140722b93	add	rax, rcx
140722b96	jmp	rax
140722b98	call	0x140002200
140722b9d	mov	ecx, 7
140722ba2	mov	edx, 1
140722ba7	call	0x1400021c0
140722bac	test	rax, rax
140722baf	je	0x140722ec7
140722bb5	mov	dword ptr [rax + 3], 0x334e4f54
140722bbc	jmp	0x140722cb3
140722bc1	cmp	ecx, 0xffff
140722bc7	jne	0x140722c83
140722bcd	mov	ebx, r9d
140722bd0	call	0x140002200
140722bd5	test	bl, bl
140722bd7	je	0x140722e23
140722bdd	mov	ecx, 0xc
140722be2	mov	edx, 1
140722be7	call	0x1400021c0
140722bec	test	rax, rax
140722bef	je	0x140722ed8
140722bf5	movabs	rcx, 0x4548574553554f4d
140722bff	mov	qword ptr [rax], rcx
140722c02	mov	dword ptr [rax + 8], 0x50554c45
140722c09	mov	qword ptr [rbp - 0x20], 0xc
140722c11	mov	qword ptr [rbp - 0x18], rax
140722c15	mov	qword ptr [rbp - 0x10], 0xc
140722c1d	jmp	0x140722ccd
140722c22	call	0x140002200
140722c27	mov	ecx, 7
140722c2c	mov	edx, 1
140722c31	call	0x1400021c0
140722c36	test	rax, rax
140722c39	je	0x140722ec7
140722c3f	mov	dword ptr [rax + 3], 0x344e4f54
140722c46	jmp	0x140722cb3
140722c48	lea	eax, [r8 - 5]
140722c4c	cmp	ax, 0xf
140722c50	jae	0x140722c83
140722c52	inc	r8d
140722c55	mov	word ptr [rbp - 0x40], r8w
140722c5a	lea	rax, [rbp - 0x40]
140722c5e	mov	qword ptr [rbp - 8], rax
140722c62	lea	rax, [rip + 0x54bafb7]
140722c69	mov	qword ptr [rbp], rax
140722c6d	lea	rdx, [rip + 0x57856fc]
140722c74	lea	rcx, [rbp - 0x20]
140722c78	lea	r8, [rbp - 8]
140722c7c	call	0x145bcce30
140722c81	jmp	0x140722ccd
140722c83	mov	qword ptr [rsi], 0xffffffffffffffff
140722c8a	jmp	0x140722e15
140722c8f	call	0x140002200
140722c94	mov	ecx, 7
140722c99	mov	edx, 1
140722c9e	call	0x1400021c0
140722ca3	test	rax, rax
140722ca6	je	0x140722ec7
140722cac	mov	dword ptr [rax + 3], 0x354e4f54
140722cb3	mov	dword ptr [rax], 0x54545542
140722cb9	mov	qword ptr [rbp - 0x20], 7
140722cc1	mov	qword ptr [rbp - 0x18], rax
140722cc5	mov	qword ptr [rbp - 0x10], 7
140722ccd	movzx	eax, byte ptr [rbp + 0x60]
140722cd1	mov	qword ptr [rbp - 8], 0
140722cd9	mov	qword ptr [rbp], 1
140722ce1	mov	qword ptr [rbp + 8], 0
140722ce9	test	al, al
140722ceb	je	0x140722d33
140722ced	mov	qword ptr [rsp + 0x20], 1
140722cf6	lea	rcx, [rbp - 8]
140722cfa	mov	r8d, 4
140722d00	mov	r9d, 1
140722d06	xor	edx, edx
140722d08	call	0x145bfa970
140722d0d	nop
140722d0e	mov	rax, qword ptr [rbp]
140722d12	mov	rdx, qword ptr [rbp + 8]
140722d16	mov	dword ptr [rax + rdx], 0x2d544c41
140722d1d	add	rdx, 4
140722d21	mov	qword ptr [rbp + 8], rdx
140722d25	cmp	byte ptr [rbp + 0x68], 0
140722d29	jne	0x140722d40
140722d2b	cmp	byte ptr [rbp + 0x70], 0
140722d2f	jne	0x140722d6b
140722d31	jmp	0x140722d92
140722d33	mov	eax, 1
140722d38	xor	edx, edx
140722d3a	cmp	byte ptr [rbp + 0x68], 0
140722d3e	je	0x140722d2b
140722d40	mov	rcx, qword ptr [rbp - 8]
140722d44	sub	rcx, rdx
140722d47	cmp	rcx, 4
140722d4b	jbe	0x140722e6f
140722d51	mov	byte ptr [rax + rdx + 4], 0x2d
140722d56	mov	dword ptr [rax + rdx], 0x4c525443
140722d5d	add	rdx, 5
140722d61	mov	qword ptr [rbp + 8], rdx
140722d65	cmp	byte ptr [rbp + 0x70], 0
140722d69	je	0x140722d92
140722d6b	mov	rcx, qword ptr [rbp - 8]
140722d6f	sub	rcx, rdx
140722d72	cmp	rcx, 5
140722d76	jbe	0x140722e9b
140722d7c	mov	word ptr [rax + rdx + 4], 0x2d54
140722d83	mov	dword ptr [rax + rdx], 0x46494853
140722d8a	add	rdx, 6
140722d8e	mov	qword ptr [rbp + 8], rdx
140722d92	mov	rax, qword ptr [rbp + 8]
140722d96	mov	qword ptr [rbp - 0x30], rax
140722d9a	movups	xmm0, xmmword ptr [rbp - 8]
140722d9e	movaps	xmmword ptr [rbp - 0x40], xmm0
140722da2	lea	rax, [rbp - 0x40]
140722da6	mov	qword ptr [rbp - 8], rax
140722daa	lea	rax, [rip - 0x720cd1]
140722db1	mov	qword ptr [rbp], rax
140722db5	lea	rcx, [rbp - 0x20]
140722db9	mov	qword ptr [rbp + 8], rcx
140722dbd	mov	qword ptr [rbp + 0x10], rax
140722dc1	lea	rdx, [rip + 0x57855b1]
140722dc8	lea	rcx, [rbp - 0x58]
140722dcc	lea	r8, [rbp - 8]
140722dd0	call	0x145bcce30
140722dd5	nop
140722dd6	mov	rdx, qword ptr [rbp - 0x40]
140722dda	test	rdx, rdx
140722ddd	je	0x140722dee
140722ddf	mov	rcx, qword ptr [rbp - 0x38]
140722de3	mov	r8d, 1
140722de9	call	0x1400021d0
140722dee	mov	rax, qword ptr [rbp - 0x48]
140722df2	mov	qword ptr [rsi + 0x10], rax
140722df6	movups	xmm0, xmmword ptr [rbp - 0x58]
140722dfa	movups	xmmword ptr [rsi], xmm0
140722dfd	mov	rdx, qword ptr [rbp - 0x20]
140722e01	test	rdx, rdx
140722e04	je	0x140722e15
140722e06	mov	rcx, qword ptr [rbp - 0x18]
140722e0a	mov	r8d, 1
140722e10	call	0x1400021d0
140722e15	mov	rax, rsi
140722e18	add	rsp, 0xa0
140722e1f	pop	rbx
140722e20	pop	rsi
140722e21	pop	rbp
140722e22	ret
140722e23	mov	ecx, 0xe
140722e28	mov	edx, 1
140722e2d	call	0x1400021c0
140722e32	test	rax, rax
140722e35	je	0x140722ee9
140722e3b	movabs	rcx, 0x4e574f444c454548
140722e45	mov	qword ptr [rax + 6], rcx
140722e49	movabs	rcx, 0x4548574553554f4d
140722e53	mov	qword ptr [rax], rcx
140722e56	mov	qword ptr [rbp - 0x20], 0xe
140722e5e	mov	qword ptr [rbp - 0x18], rax
140722e62	mov	qword ptr [rbp - 0x10], 0xe
140722e6a	jmp	0x140722ccd
140722e6f	mov	qword ptr [rsp + 0x20], 1
140722e78	lea	rcx, [rbp - 8]
140722e7c	mov	r8d, 5
140722e82	mov	r9d, 1
140722e88	call	0x145bfa970
140722e8d	nop
140722e8e	mov	rax, qword ptr [rbp]
140722e92	mov	rdx, qword ptr [rbp + 8]
140722e96	jmp	0x140722d51
140722e9b	mov	qword ptr [rsp + 0x20], 1
140722ea4	lea	rcx, [rbp - 8]
140722ea8	mov	r8d, 6
140722eae	mov	r9d, 1
140722eb4	call	0x145bfa970
140722eb9	nop
140722eba	mov	rax, qword ptr [rbp]
140722ebe	mov	rdx, qword ptr [rbp + 8]
140722ec2	jmp	0x140722d7c
140722ec7	mov	ecx, 1
140722ecc	mov	edx, 7
140722ed1	call	0x145d992bb
140722ed6	ud2
140722ed8	mov	ecx, 1
140722edd	mov	edx, 0xc
140722ee2	call	0x145d992bb
140722ee7	ud2
140722ee9	mov	ecx, 1
140722eee	mov	edx, 0xe
140722ef3	call	0x145d992bb
140722ef8	ud2
