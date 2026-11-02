140102a00	push	r15
140102a02	push	r14
140102a04	push	rsi
140102a05	push	rdi
140102a06	push	rbx
140102a07	sub	rsp, 0x3d0
140102a0e	movaps	xmmword ptr [rsp + 0x3c0], xmm6
140102a16	mov	edi, r9d
140102a19	mov	ebx, r8d
140102a1c	mov	rsi, rdx
140102a1f	mov	rdx, rcx
140102a22	test	r9b, r9b
140102a25	je	0x140102a44
140102a27	movups	xmm0, xmmword ptr [rip + 0x5cd386a]
140102a2e	movaps	xmmword ptr [rsp + 0x20], xmm0
140102a33	mov	dword ptr [rsp + 0x30], 0x3f800000
140102a3b	movaps	xmm0, xmmword ptr [rip + 0x5cd21ee]
140102a42	jmp	0x140102a5f
140102a44	movups	xmm0, xmmword ptr [rip + 0x5cd3d3d]
140102a4b	movaps	xmmword ptr [rsp + 0x20], xmm0
140102a50	mov	dword ptr [rsp + 0x30], 0x3f800000
140102a58	movaps	xmm0, xmmword ptr [rip + 0x5cd21c1]
140102a5f	mov	eax, dword ptr [rsp + 0x30]
140102a63	mov	dword ptr [rsp + 0xb0], eax
140102a6a	movaps	xmm1, xmmword ptr [rsp + 0x20]
140102a6f	movaps	xmmword ptr [rsp + 0xa0], xmm1
140102a77	movups	xmm6, xmmword ptr [rip + 0x5cd3d8e]
140102a7e	movups	xmmword ptr [rsp + 0xb4], xmm6
140102a86	mov	dword ptr [rsp + 0xc4], 0x3f800000
140102a91	movups	xmm1, xmmword ptr [rip + 0x5cd3298]
140102a98	movaps	xmmword ptr [rsp + 0x360], xmm1
140102aa0	mov	qword ptr [rsp + 0x370], 0
140102aac	movups	xmm1, xmmword ptr [rip + 0x5cd3295]
140102ab3	movups	xmmword ptr [rsp + 0x378], xmm1
140102abb	mov	qword ptr [rsp + 0x388], 0
140102ac7	movups	xmm1, xmmword ptr [rip + 0x5cd3292]
140102ace	movaps	xmmword ptr [rsp + 0x390], xmm1
140102ad6	mov	qword ptr [rsp + 0x3a0], 0
140102ae2	movups	xmm1, xmmword ptr [rip + 0x5cd328f]
140102ae9	movups	xmmword ptr [rsp + 0x3a8], xmm1
140102af1	mov	qword ptr [rsp + 0x3b8], 0
140102afd	mov	eax, dword ptr [rsp + 0x30]
140102b01	mov	dword ptr [rsp + 0x130], eax
140102b08	movaps	xmm1, xmmword ptr [rsp + 0x20]
140102b0d	movaps	xmmword ptr [rsp + 0x120], xmm1
140102b15	movaps	xmm1, xmmword ptr [rsp + 0x20]
140102b1a	movups	xmmword ptr [rsp + 0x134], xmm1
140102b22	mov	eax, dword ptr [rsp + 0x30]
140102b26	mov	dword ptr [rsp + 0x144], eax
140102b2d	movaps	xmm1, xmmword ptr [rsp + 0x20]
140102b32	movups	xmmword ptr [rsp + 0x148], xmm1
140102b3a	mov	eax, dword ptr [rsp + 0x30]
140102b3e	mov	dword ptr [rsp + 0x158], eax
140102b45	movaps	xmm1, xmmword ptr [rsp + 0x20]
140102b4a	movups	xmmword ptr [rsp + 0x15c], xmm1
140102b52	mov	eax, dword ptr [rsp + 0x30]
140102b56	mov	dword ptr [rsp + 0x16c], eax
140102b5d	mov	rax, qword ptr [rsp + 0xc0]
140102b65	mov	qword ptr [rsp + 0x116], rax
140102b6d	movaps	xmm1, xmmword ptr [rsp + 0xa0]
140102b75	movaps	xmm2, xmmword ptr [rsp + 0xb0]
140102b7d	movups	xmmword ptr [rsp + 0x106], xmm2
140102b85	movups	xmmword ptr [rsp + 0xf6], xmm1
140102b8d	mov	rax, qword ptr [rsp + 0x160]
140102b95	mov	qword ptr [rsp + 0x82], rax
140102b9d	mov	eax, dword ptr [rsp + 0x168]
140102ba4	mov	dword ptr [rsp + 0x8a], eax
140102bab	mov	eax, dword ptr [rsp + 0x16c]
140102bb2	mov	dword ptr [rsp + 0x8e], eax
140102bb9	movaps	xmm1, xmmword ptr [rsp + 0x120]
140102bc1	movaps	xmm2, xmmword ptr [rsp + 0x130]
140102bc9	movaps	xmm3, xmmword ptr [rsp + 0x140]
140102bd1	movaps	xmm4, xmmword ptr [rsp + 0x150]
140102bd9	movups	xmmword ptr [rsp + 0x72], xmm4
140102bde	movups	xmmword ptr [rsp + 0x62], xmm3
140102be3	movups	xmmword ptr [rsp + 0x52], xmm2
140102be8	movups	xmmword ptr [rsp + 0x42], xmm1
140102bed	mov	rax, qword ptr [rdx]
140102bf0	add	rdx, 8
140102bf4	movaps	xmm1, xmmword ptr [rsp + 0x3b0]
140102bfc	movups	xmmword ptr [rsp + 0x178], xmm1
140102c04	movaps	xmm1, xmmword ptr [rsp + 0x3a0]
140102c0c	movups	xmmword ptr [rsp + 0x168], xmm1
140102c14	movaps	xmm1, xmmword ptr [rsp + 0x360]
140102c1c	movaps	xmm2, xmmword ptr [rsp + 0x370]
140102c24	movaps	xmm3, xmmword ptr [rsp + 0x380]
140102c2c	movaps	xmm4, xmmword ptr [rsp + 0x390]
140102c34	movups	xmmword ptr [rsp + 0x158], xmm4
140102c3c	movups	xmmword ptr [rsp + 0x148], xmm3
140102c44	movups	xmmword ptr [rsp + 0x138], xmm2
140102c4c	movups	xmmword ptr [rsp + 0x128], xmm1
140102c54	xorps	xmm1, xmm1
140102c57	movups	xmmword ptr [rsp + 0x188], xmm1
140102c5f	movups	xmmword ptr [rsp + 0x198], xmm1
140102c67	movups	xmmword ptr [rsp + 0x1a8], xmm1
140102c6f	movups	xmmword ptr [rsp + 0x1b8], xmm1
140102c77	movups	xmmword ptr [rsp + 0x1c8], xmm1
140102c7f	mov	qword ptr [rsp + 0x1d8], 0
140102c8b	movups	xmm1, xmmword ptr [rip + 0x5cd3166]
140102c92	movups	xmmword ptr [rsp + 0x1f0], xmm1
140102c9a	movups	xmm1, xmmword ptr [rip + 0x5cd3147]
140102ca1	movups	xmmword ptr [rsp + 0x1e0], xmm1
140102ca9	movaps	xmm1, xmmword ptr [rip + 0x5c9a760]
140102cb0	movups	xmmword ptr [rsp + 0x200], xmm1
140102cb8	movaps	xmm1, xmmword ptr [rip + 0x5c9a641]
140102cbf	movups	xmmword ptr [rsp + 0x210], xmm1
140102cc7	movaps	xmm1, xmmword ptr [rip + 0x5c9a5e2]
140102cce	movups	xmmword ptr [rsp + 0x220], xmm1
140102cd6	movups	xmmword ptr [rsp + 0x230], xmm1
140102cde	movaps	xmm1, xmmword ptr [rip + 0x5cca41b]
140102ce5	movups	xmmword ptr [rsp + 0x240], xmm1
140102ced	movups	xmmword ptr [rsp + 0x250], xmm1
140102cf5	movaps	xmm1, xmmword ptr [rip + 0x5c9a574]
140102cfc	movups	xmmword ptr [rsp + 0x260], xmm1
140102d04	mov	dword ptr [rsp + 0x270], 1
140102d0f	mov	qword ptr [rsp + 0x274], 0
140102d1b	mov	byte ptr [rsp + 0x27c], 1
140102d23	mov	qword ptr [rsp + 0x280], 0
140102d2f	mov	dword ptr [rsp + 0x288], 0x3f800000
140102d3a	mov	word ptr [rsp + 0x28c], 0
140102d44	mov	dword ptr [rsp + 0x28e], 0x10000
140102d4f	mov	word ptr [rsp + 0x292], 0
140102d59	mov	word ptr [rsp + 0x298], 0
140102d63	mov	dword ptr [rsp + 0x294], 0x10000
140102d6e	mov	dword ptr [rsp + 0x2a2], 0
140102d79	mov	qword ptr [rsp + 0x29a], 0
140102d85	movzx	ecx, word ptr [rsp + 0x90]
140102d8d	mov	word ptr [rsp + 0x2f6], cx
140102d95	movups	xmm1, xmmword ptr [rsp + 0x80]
140102d9d	movups	xmmword ptr [rsp + 0x2e6], xmm1
140102da5	movups	xmm1, xmmword ptr [rsp + 0x40]
140102daa	movups	xmm2, xmmword ptr [rsp + 0x50]
140102daf	movups	xmm3, xmmword ptr [rsp + 0x60]
140102db4	movups	xmm4, xmmword ptr [rsp + 0x70]
140102db9	movups	xmmword ptr [rsp + 0x2d6], xmm4
140102dc1	movups	xmmword ptr [rsp + 0x2c6], xmm3
140102dc9	movups	xmmword ptr [rsp + 0x2b6], xmm2
140102dd1	movups	xmmword ptr [rsp + 0x2a6], xmm1
140102dd9	mov	byte ptr [rsp + 0x2f8], 6
140102de1	mov	byte ptr [rsp + 0x2f9], bl
140102de8	mov	rcx, qword ptr [rsp + 0x116]
140102df0	mov	qword ptr [rsp + 0x338], rcx
140102df8	movups	xmm1, xmmword ptr [rsp + 0xd8]
140102e00	movups	xmm2, xmmword ptr [rsp + 0xe8]
140102e08	movups	xmm3, xmmword ptr [rsp + 0xf8]
140102e10	movups	xmm4, xmmword ptr [rsp + 0x108]
140102e18	movups	xmmword ptr [rsp + 0x32a], xmm4
140102e20	movups	xmmword ptr [rsp + 0x31a], xmm3
140102e28	movups	xmmword ptr [rsp + 0x30a], xmm2
140102e30	movups	xmmword ptr [rsp + 0x2fa], xmm1
140102e38	mov	dword ptr [rsp + 0x340], 0
140102e43	mov	byte ptr [rsp + 0x344], 2
140102e4b	mov	dword ptr [rsp + 0x348], 0
140102e56	movups	xmmword ptr [rsp + 0x34c], xmm0
140102e5e	mov	qword ptr [rsp + 0x120], rax
140102e66	lea	r9, [rip + 0x5cd25c3]
140102e6d	lea	rcx, [rsp + 0xa0]
140102e75	lea	r8, [rsp + 0x120]
140102e7d	call	0x1401f1900
140102e82	test	dil, dil
140102e85	je	0x140102e8e
140102e87	movaps	xmmword ptr [rsp + 0x40], xmm6
140102e8c	jmp	0x140102e9a
140102e8e	movups	xmm0, xmmword ptr [rip + 0x5cd3403]
140102e95	movaps	xmmword ptr [rsp + 0x40], xmm0
140102e9a	mov	dword ptr [rsp + 0x50], 0x3f800000
140102ea2	mov	ecx, ebx
140102ea4	call	0x1458da3d0
140102ea9	mov	rdi, rdx
140102eac	test	rdx, rdx
140102eaf	jns	0x140102ec1
140102eb1	xor	r15d, r15d
140102eb4	mov	rcx, r15
140102eb7	mov	rdx, rdi
140102eba	call	0x145d992bb
140102ebf	ud2
140102ec1	je	0x140102f19
140102ec3	mov	r14, rax
140102ec6	call	0x140002200
140102ecb	mov	r15d, 1
140102ed1	mov	edx, 1
140102ed6	mov	rcx, rdi
140102ed9	call	0x1400021c0
140102ede	test	rax, rax
140102ee1	je	0x140102eb4
140102ee3	mov	rbx, rax
140102ee6	mov	rcx, rax
140102ee9	mov	rdx, r14
140102eec	mov	r8, rdi
140102eef	call	0x145bfa0e7
140102ef4	cmp	byte ptr [rsi], 1
140102ef7	jne	0x140102f23
140102ef9	mov	eax, dword ptr [rsi + 1]
140102efc	mov	ecx, dword ptr [rsi + 4]
140102eff	mov	dword ptr [rsp + 0xdb], ecx
140102f06	mov	dword ptr [rsp + 0xd8], eax
140102f0d	mov	rax, qword ptr [rsi + 8]
140102f11	movzx	ecx, byte ptr [rsi + 0x10]
140102f15	mov	dl, 1
140102f17	jmp	0x140102f33
140102f19	mov	ebx, 1
140102f1e	cmp	byte ptr [rsi], 1
140102f21	je	0x140102ef9
140102f23	mov	rax, qword ptr [rsi + 8]
140102f27	lock inc	qword ptr [rax]
140102f2b	jle	0x140103030
140102f31	xor	edx, edx
140102f33	mov	qword ptr [rsp + 0x120], rdi
140102f3b	mov	qword ptr [rsp + 0x128], rbx
140102f43	mov	qword ptr [rsp + 0x130], rdi
140102f4b	mov	qword ptr [rsp + 0x138], 0
140102f57	mov	qword ptr [rsp + 0x140], 4
140102f63	mov	qword ptr [rsp + 0x148], 0
140102f6f	mov	byte ptr [rsp + 0x150], dl
140102f76	mov	edx, dword ptr [rsp + 0xd8]
140102f7d	mov	r8d, dword ptr [rsp + 0xdb]
140102f85	mov	dword ptr [rsp + 0x151], edx
140102f8c	mov	dword ptr [rsp + 0x154], r8d
140102f94	mov	qword ptr [rsp + 0x158], rax
140102f9c	mov	qword ptr [rsp + 0x160], rcx
140102fa4	mov	dword ptr [rsp + 0x168], 0x41800000
140102faf	mov	word ptr [rsp + 0x16c], 0x190
140102fb9	mov	byte ptr [rsp + 0x16e], 1
140102fc1	movaps	xmm0, xmmword ptr [rsp + 0x40]
140102fc6	movups	xmmword ptr [rsp + 0x170], xmm0
140102fce	mov	eax, dword ptr [rsp + 0x50]
140102fd2	mov	dword ptr [rsp + 0x180], eax
140102fd9	movups	xmm0, xmmword ptr [rip + 0x5cd2ab0]
140102fe0	movups	xmmword ptr [rsp + 0x184], xmm0
140102fe8	mov	dword ptr [rsp + 0x194], 0x3f59999a
140102ff3	movsd	xmm0, qword ptr [rip + 0x5c9a4a5]
140102ffb	movsd	qword ptr [rsp + 0x198], xmm0
140103004	lea	rcx, [rsp + 0xa0]
14010300c	lea	rdx, [rsp + 0x120]
140103014	call	0x1401f9650
140103019	movaps	xmm6, xmmword ptr [rsp + 0x3c0]
140103021	add	rsp, 0x3d0
140103028	pop	rbx
140103029	pop	rdi
14010302a	pop	rsi
14010302b	pop	r14
14010302d	pop	r15
14010302f	ret
140103030	ud2
