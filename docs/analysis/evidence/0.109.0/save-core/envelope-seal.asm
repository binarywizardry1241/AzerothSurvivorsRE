1458f6c40	push	rbp
1458f6c41	push	r15
1458f6c43	push	r14
1458f6c45	push	r13
1458f6c47	push	r12
1458f6c49	push	rsi
1458f6c4a	push	rdi
1458f6c4b	push	rbx
1458f6c4c	sub	rsp, 0xd8
1458f6c53	lea	rbp, [rsp + 0x80]
1458f6c5b	mov	qword ptr [rbp + 0x50], 0xfffffffffffffffe
1458f6c63	mov	qword ptr [rbp + 0x18], r8
1458f6c67	mov	qword ptr [rbp - 0x28], rdx
1458f6c6b	mov	rsi, rcx
1458f6c6e	call	0x145a5f770
1458f6c73	mov	r14, rax
1458f6c76	mov	qword ptr [rbp - 0x18], rax
1458f6c7a	lea	rbx, [rax + 0x10]
1458f6c7e	mov	rcx, qword ptr [rax + 0x110]
1458f6c85	cmp	rcx, 0x40
1458f6c89	mov	qword ptr [rbp - 0x20], rsi
1458f6c8d	jb	0x1458f6cd4
1458f6c8f	add	rax, 0x120
1458f6c95	mov	rcx, qword ptr [r14 + 0x158]
1458f6c9c	test	rcx, rcx
1458f6c9f	jle	0x1458f6d39
1458f6ca5	cmp	qword ptr [r14 + 0x160], 0
1458f6cad	js	0x1458f6d39
1458f6cb3	add	rcx, -0x100
1458f6cba	mov	qword ptr [r14 + 0x158], rcx
1458f6cc1	mov	rcx, rax
1458f6cc4	mov	edx, 6
1458f6cc9	mov	r8, rbx
1458f6ccc	call	0x145a5fb10
1458f6cd1	nop
1458f6cd2	jmp	0x1458f6d48
1458f6cd4	movzx	edx, byte ptr [r14 + rcx*4 + 0x10]
1458f6cda	mov	byte ptr [rbp + 0x30], dl
1458f6cdd	lea	rdx, [rcx + 1]
1458f6ce1	mov	qword ptr [r14 + 0x110], rdx
1458f6ce8	cmp	rcx, 0x3f
1458f6cec	jne	0x1458f6f04
1458f6cf2	add	rax, 0x120
1458f6cf8	mov	rcx, qword ptr [r14 + 0x158]
1458f6cff	test	rcx, rcx
1458f6d02	jle	0x1458f70ed
1458f6d08	cmp	qword ptr [r14 + 0x160], 0
1458f6d10	js	0x1458f70ed
1458f6d16	add	rcx, -0x100
1458f6d1d	mov	qword ptr [r14 + 0x158], rcx
1458f6d24	mov	rcx, rax
1458f6d27	mov	edx, 6
1458f6d2c	mov	r8, rbx
1458f6d2f	call	0x145a5fb10
1458f6d34	nop
1458f6d35	xor	edi, edi
1458f6d37	jmp	0x1458f6d53
1458f6d39	mov	rcx, rax
1458f6d3c	mov	rdx, rbx
1458f6d3f	xor	r8d, r8d
1458f6d42	call	0x145a5f630
1458f6d47	nop
1458f6d48	movzx	eax, byte ptr [rbx]
1458f6d4b	mov	byte ptr [rbp + 0x30], al
1458f6d4e	mov	edi, 1
1458f6d53	movzx	eax, byte ptr [rbx + rdi*4]
1458f6d57	mov	byte ptr [rbp + 0x20], al
1458f6d5a	movzx	eax, byte ptr [rbx + rdi*4 + 4]
1458f6d5f	mov	byte ptr [rbp + 0x28], al
1458f6d62	lea	rax, [rbx + rdi*4]
1458f6d66	add	rax, 8
1458f6d6a	add	rdi, 3
1458f6d6e	movzx	eax, byte ptr [rax]
1458f6d71	mov	byte ptr [rbp + 0x48], al
1458f6d74	mov	qword ptr [r14 + 0x110], rdi
1458f6d7b	movzx	edx, byte ptr [r14 + rdi*4 + 0x10]
1458f6d81	lea	rax, [rdi + 1]
1458f6d85	mov	qword ptr [r14 + 0x110], rax
1458f6d8c	add	rdi, 2
1458f6d90	movzx	r8d, byte ptr [r14 + rax*4 + 0x10]
1458f6d96	mov	qword ptr [r14 + 0x110], rdi
1458f6d9d	movzx	r9d, byte ptr [r14 + rdi*4 + 0x10]
1458f6da3	lea	rax, [rdi + 1]
1458f6da7	mov	qword ptr [r14 + 0x110], rax
1458f6dae	add	rdi, 2
1458f6db2	movzx	r10d, byte ptr [r14 + rax*4 + 0x10]
1458f6db8	mov	qword ptr [r14 + 0x110], rdi
1458f6dbf	movzx	r11d, byte ptr [r14 + rdi*4 + 0x10]
1458f6dc5	lea	rax, [rdi + 1]
1458f6dc9	mov	qword ptr [r14 + 0x110], rax
1458f6dd0	add	rdi, 2
1458f6dd4	movzx	eax, byte ptr [r14 + rax*4 + 0x10]
1458f6dda	mov	byte ptr [rbp + 0x49], al
1458f6ddd	mov	qword ptr [r14 + 0x110], rdi
1458f6de4	movzx	eax, byte ptr [r14 + rdi*4 + 0x10]
1458f6dea	mov	byte ptr [rbp + 0x4a], al
1458f6ded	lea	rax, [rdi + 1]
1458f6df1	mov	qword ptr [r14 + 0x110], rax
1458f6df8	add	rdi, 2
1458f6dfc	movzx	r13d, byte ptr [r14 + rax*4 + 0x10]
1458f6e02	mov	qword ptr [r14 + 0x110], rdi
1458f6e09	movzx	esi, byte ptr [r14 + rdi*4 + 0x10]
1458f6e0f	lea	rax, [rdi + 1]
1458f6e13	mov	qword ptr [r14 + 0x110], rax
1458f6e1a	add	rdi, 2
1458f6e1e	mov	r15d, dword ptr [r14 + rax*4 + 0x10]
1458f6e23	mov	qword ptr [r14 + 0x110], rdi
1458f6e2a	lea	rbx, [rbx + rdi*4]
1458f6e2e	inc	rdi
1458f6e31	mov	r12d, dword ptr [rbx]
1458f6e34	mov	qword ptr [r14 + 0x110], rdi
1458f6e3b	movzx	eax, byte ptr [r14 + rdi*4 + 0x10]
1458f6e41	inc	rdi
1458f6e44	mov	qword ptr [r14 + 0x110], rdi
1458f6e4b	movzx	ecx, byte ptr [rbp + 0x30]
1458f6e4f	mov	byte ptr [rbp + 0x38], cl
1458f6e52	movzx	ecx, byte ptr [rbp + 0x20]
1458f6e56	mov	byte ptr [rbp + 0x39], cl
1458f6e59	movzx	ecx, byte ptr [rbp + 0x28]
1458f6e5d	mov	byte ptr [rbp + 0x3a], cl
1458f6e60	movzx	ecx, byte ptr [rbp + 0x48]
1458f6e64	mov	byte ptr [rbp + 0x3b], cl
1458f6e67	mov	byte ptr [rbp + 0x3c], dl
1458f6e6a	mov	byte ptr [rbp + 0x3d], r8b
1458f6e6e	mov	byte ptr [rbp + 0x3e], r9b
1458f6e72	mov	byte ptr [rbp + 0x3f], r10b
1458f6e76	mov	byte ptr [rbp + 0x40], r11b
1458f6e7a	movzx	ecx, byte ptr [rbp + 0x49]
1458f6e7e	mov	byte ptr [rbp + 0x41], cl
1458f6e81	movzx	ecx, byte ptr [rbp + 0x4a]
1458f6e85	mov	byte ptr [rbp + 0x42], cl
1458f6e88	mov	byte ptr [rbp + 0x43], r13b
1458f6e8c	mov	byte ptr [rbp + 0x44], sil
1458f6e90	mov	byte ptr [rbp + 0x45], r15b
1458f6e94	mov	byte ptr [rbp + 0x46], r12b
1458f6e98	mov	byte ptr [rbp + 0x47], al
1458f6e9b	mov	rax, qword ptr [rbp - 0x18]
1458f6e9f	dec	qword ptr [rax]
1458f6ea2	je	0x1458f6ebc
1458f6ea4	mov	rsi, qword ptr [rbp + 0x18]
1458f6ea8	test	rsi, rsi
1458f6eab	jns	0x1458f6ece
1458f6ead	xor	ebx, ebx
1458f6eaf	mov	rcx, rbx
1458f6eb2	mov	rdx, rsi
1458f6eb5	call	0x145d992bb
1458f6eba	ud2
1458f6ebc	lea	rcx, [rbp - 0x18]
1458f6ec0	call	0x145a5f750
1458f6ec5	mov	rsi, qword ptr [rbp + 0x18]
1458f6ec9	test	rsi, rsi
1458f6ecc	js	0x1458f6ead
1458f6ece	je	0x1458f6f6a
1458f6ed4	call	0x140002200
1458f6ed9	mov	ebx, 1
1458f6ede	mov	edx, 1
1458f6ee3	mov	rcx, rsi
1458f6ee6	call	0x1400021c0
1458f6eeb	test	rax, rax
1458f6eee	je	0x1458f6eaf
1458f6ef0	mov	r14, rax
1458f6ef3	mov	rcx, rax
1458f6ef6	mov	rdx, qword ptr [rbp - 0x28]
1458f6efa	mov	r8, rsi
1458f6efd	call	0x145bfa0e7
1458f6f02	jmp	0x1458f6f70
1458f6f04	movzx	edx, byte ptr [r14 + rcx*4 + 0x14]
1458f6f0a	mov	byte ptr [rbp + 0x20], dl
1458f6f0d	lea	rdx, [rcx + 2]
1458f6f11	mov	qword ptr [r14 + 0x110], rdx
1458f6f18	cmp	rcx, 0x3e
1458f6f1c	jb	0x1458f7103
1458f6f22	add	rax, 0x120
1458f6f28	mov	rcx, qword ptr [r14 + 0x158]
1458f6f2f	test	rcx, rcx
1458f6f32	jle	0x1458f7165
1458f6f38	cmp	qword ptr [r14 + 0x160], 0
1458f6f40	js	0x1458f7165
1458f6f46	add	rcx, -0x100
1458f6f4d	mov	qword ptr [r14 + 0x158], rcx
1458f6f54	mov	rcx, rax
1458f6f57	mov	edx, 6
1458f6f5c	mov	r8, rbx
1458f6f5f	call	0x145a5fb10
1458f6f64	nop
1458f6f65	jmp	0x1458f7174
1458f6f6a	mov	r14d, 1
1458f6f70	lea	rdi, [rbp + 0x38]
1458f6f74	mov	rcx, rdi
1458f6f77	mov	qword ptr [rbp + 0x30], r14
1458f6f7b	mov	rdx, r14
1458f6f7e	mov	r8, rsi
1458f6f81	call	0x1458f6000
1458f6f86	nop
1458f6f87	lea	rax, [rip + 0x15dc3fc]
1458f6f8e	mov	qword ptr [rbp - 0x18], rax
1458f6f92	mov	qword ptr [rbp - 0x10], 3
1458f6f9a	mov	qword ptr [rbp - 8], rdi
1458f6f9e	mov	qword ptr [rbp], 0x10
1458f6fa6	mov	rax, qword ptr [rbp + 0x30]
1458f6faa	mov	qword ptr [rbp + 8], rax
1458f6fae	mov	rax, qword ptr [rbp + 0x18]
1458f6fb2	mov	qword ptr [rbp + 0x10], rax
1458f6fb6	lea	rcx, [rbp - 0x54]
1458f6fba	lea	rdx, [rbp - 0x18]
1458f6fbe	call	0x1458f6280
1458f6fc3	nop
1458f6fc4	mov	rsi, qword ptr [rbp + 0x18]
1458f6fc8	mov	rbx, rsi
1458f6fcb	add	rbx, 0x24
1458f6fcf	jns	0x1458f6fe1
1458f6fd1	xor	edi, edi
1458f6fd3	mov	rcx, rdi
1458f6fd6	mov	rdx, rbx
1458f6fd9	call	0x145d992bb
1458f6fde	nop
1458f6fdf	ud2
1458f6fe1	call	0x140002200
1458f6fe6	mov	edi, 1
1458f6feb	mov	edx, 1
1458f6ff0	mov	rcx, rbx
1458f6ff3	call	0x1400021c0
1458f6ff8	test	rax, rax
1458f6ffb	je	0x1458f6fd3
1458f6ffd	mov	r14, rax
1458f7000	movups	xmm0, xmmword ptr [rbp + 0x38]
1458f7004	movups	xmmword ptr [rax], xmm0
1458f7007	test	rsi, rsi
1458f700a	je	0x1458f701f
1458f700c	mov	rcx, r14
1458f700f	add	rcx, 0x10
1458f7013	mov	rdx, qword ptr [rbp + 0x30]
1458f7017	mov	r8, rsi
1458f701a	call	0x145bfa0e7
1458f701f	mov	eax, dword ptr [rbp - 0x44]
1458f7022	mov	dword ptr [r14 + rsi + 0x20], eax
1458f7027	movups	xmm0, xmmword ptr [rbp - 0x54]
1458f702b	movups	xmmword ptr [r14 + rsi + 0x10], xmm0
1458f7031	lea	rdx, [rip + 0x15dc20f]
1458f7038	lea	rdi, [rbp - 0x40]
1458f703c	mov	rcx, rdi
1458f703f	mov	qword ptr [rbp + 0x20], r14
1458f7043	mov	r8, r14
1458f7046	mov	r9, rbx
1458f7049	mov	qword ptr [rbp + 0x28], rbx
1458f704d	call	0x1458e7ae0
1458f7052	nop
1458f7053	mov	r8d, 1
1458f7059	mov	rcx, qword ptr [rbp + 0x20]
1458f705d	mov	rdx, qword ptr [rbp + 0x28]
1458f7061	call	0x1400021d0
1458f7066	lea	rax, [rip + 0x15dc323]
1458f706d	mov	qword ptr [rbp - 0x18], rax
1458f7071	lea	rax, [rip - 0x58f4fb8]
1458f7078	mov	qword ptr [rbp - 0x10], rax
1458f707c	mov	qword ptr [rbp - 8], rdi
1458f7080	lea	rax, [rip - 0x58f4fa7]
1458f7087	mov	qword ptr [rbp], rax
1458f708b	lea	rdx, [rip + 0x15dc30e]
1458f7092	lea	r8, [rbp - 0x18]
1458f7096	mov	rdi, qword ptr [rbp - 0x20]
1458f709a	mov	rcx, rdi
1458f709d	call	0x145bcce30
1458f70a2	nop
1458f70a3	mov	rdx, qword ptr [rbp - 0x40]
1458f70a7	test	rdx, rdx
1458f70aa	mov	rsi, qword ptr [rbp + 0x18]
1458f70ae	je	0x1458f70bf
1458f70b0	mov	rcx, qword ptr [rbp - 0x38]
1458f70b4	mov	r8d, 1
1458f70ba	call	0x1400021d0
1458f70bf	test	rsi, rsi
1458f70c2	mov	rcx, qword ptr [rbp + 0x30]
1458f70c6	je	0x1458f70d6
1458f70c8	mov	r8d, 1
1458f70ce	mov	rdx, rsi
1458f70d1	call	0x1400021d0
1458f70d6	mov	rax, rdi
1458f70d9	add	rsp, 0xd8
1458f70e0	pop	rbx
1458f70e1	pop	rdi
1458f70e2	pop	rsi
1458f70e3	pop	r12
1458f70e5	pop	r13
1458f70e7	pop	r14
1458f70e9	pop	r15
1458f70eb	pop	rbp
1458f70ec	ret
1458f70ed	xor	edi, edi
1458f70ef	mov	rcx, rax
1458f70f2	mov	rdx, rbx
1458f70f5	xor	r8d, r8d
1458f70f8	call	0x145a5f630
1458f70fd	nop
1458f70fe	jmp	0x1458f6d53
1458f7103	movzx	r8d, byte ptr [r14 + rcx*4 + 0x18]
1458f7109	mov	byte ptr [rbp + 0x28], r8b
1458f710d	lea	r8, [rcx + 3]
1458f7111	mov	qword ptr [r14 + 0x110], r8
1458f7118	cmp	rcx, 0x3d
1458f711c	jne	0x1458f718b
1458f711e	add	rax, 0x120
1458f7124	mov	rcx, qword ptr [r14 + 0x158]
1458f712b	test	rcx, rcx
1458f712e	jle	0x1458f71e3
1458f7134	cmp	qword ptr [r14 + 0x160], 0
1458f713c	js	0x1458f71e3
1458f7142	add	rcx, -0x100
1458f7149	mov	qword ptr [r14 + 0x158], rcx
1458f7150	mov	rcx, rax
1458f7153	mov	edx, 6
1458f7158	mov	r8, rbx
1458f715b	call	0x145a5fb10
1458f7160	nop
1458f7161	xor	edi, edi
1458f7163	jmp	0x1458f717f
1458f7165	mov	rcx, rax
1458f7168	mov	rdx, rbx
1458f716b	xor	r8d, r8d
1458f716e	call	0x145a5f630
1458f7173	nop
1458f7174	movzx	eax, byte ptr [rbx]
1458f7177	mov	byte ptr [rbp + 0x28], al
1458f717a	mov	edi, 1
1458f717f	lea	rax, [rbx + rdi*4]
1458f7183	inc	rdi
1458f7186	jmp	0x1458f6d6e
1458f718b	movzx	r8d, byte ptr [r14 + rcx*4 + 0x1c]
1458f7191	mov	byte ptr [rbp + 0x48], r8b
1458f7195	lea	r8, [rcx + 4]
1458f7199	mov	qword ptr [r14 + 0x110], r8
1458f71a0	cmp	rdx, 0x3e
1458f71a4	jne	0x1458f71f6
1458f71a6	add	rax, 0x120
1458f71ac	mov	rcx, qword ptr [r14 + 0x158]
1458f71b3	test	rcx, rcx
1458f71b6	jle	0x1458f7229
1458f71b8	cmp	qword ptr [r14 + 0x160], 0
1458f71c0	js	0x1458f7229
1458f71c2	add	rcx, -0x100
1458f71c9	mov	qword ptr [r14 + 0x158], rcx
1458f71d0	mov	rcx, rax
1458f71d3	mov	edx, 6
1458f71d8	mov	r8, rbx
1458f71db	call	0x145a5fb10
1458f71e0	nop
1458f71e1	jmp	0x1458f7238
1458f71e3	xor	edi, edi
1458f71e5	mov	rcx, rax
1458f71e8	mov	rdx, rbx
1458f71eb	xor	r8d, r8d
1458f71ee	call	0x145a5f630
1458f71f3	nop
1458f71f4	jmp	0x1458f717f
1458f71f6	movzx	edx, byte ptr [r14 + rcx*4 + 0x20]
1458f71fc	mov	byte ptr [rbp + 0x4f], dl
1458f71ff	lea	rdx, [rcx + 5]
1458f7203	mov	qword ptr [r14 + 0x110], rdx
1458f720a	cmp	rcx, 0x3b
1458f720e	jb	0x1458f7249
1458f7210	add	rax, 0x120
1458f7216	mov	rcx, rax
1458f7219	mov	rdx, rbx
1458f721c	call	0x145914d30
1458f7221	nop
1458f7222	mov	dl, byte ptr [rbp + 0x4f]
1458f7225	xor	eax, eax
1458f7227	jmp	0x1458f7240
1458f7229	mov	rcx, rax
1458f722c	mov	rdx, rbx
1458f722f	xor	r8d, r8d
1458f7232	call	0x145a5f630
1458f7237	nop
1458f7238	movzx	edx, byte ptr [rbx]
1458f723b	mov	eax, 1
1458f7240	lea	rdi, [rax + 1]
1458f7244	jmp	0x1458f6d90
1458f7249	movzx	edx, byte ptr [r14 + rcx*4 + 0x24]
1458f724f	mov	byte ptr [rbp + 0x4e], dl
1458f7252	lea	rdx, [rcx + 6]
1458f7256	mov	qword ptr [r14 + 0x110], rdx
1458f725d	cmp	r8, 0x3e
1458f7261	jne	0x1458f7288
1458f7263	add	rax, 0x120
1458f7269	mov	rcx, rax
1458f726c	mov	rdx, rbx
1458f726f	call	0x145914d30
1458f7274	nop
1458f7275	mov	dl, byte ptr [rbp + 0x4f]
1458f7278	movzx	r8d, byte ptr [rbp + 0x4e]
1458f727d	movzx	r9d, byte ptr [rbx]
1458f7281	mov	eax, 1
1458f7286	jmp	0x1458f72c1
1458f7288	movzx	r9d, byte ptr [r14 + rcx*4 + 0x28]
1458f728e	lea	r8, [rcx + 7]
1458f7292	mov	qword ptr [r14 + 0x110], r8
1458f7299	cmp	rcx, 0x39
1458f729d	jb	0x1458f72ca
1458f729f	add	rax, 0x120
1458f72a5	mov	rcx, rax
1458f72a8	mov	rdx, rbx
1458f72ab	mov	sil, r9b
1458f72ae	call	0x145914d30
1458f72b3	nop
1458f72b4	mov	dl, byte ptr [rbp + 0x4f]
1458f72b7	movzx	r8d, byte ptr [rbp + 0x4e]
1458f72bc	mov	r9d, esi
1458f72bf	xor	eax, eax
1458f72c1	lea	rdi, [rax + 1]
1458f72c5	jmp	0x1458f6db2
1458f72ca	movzx	r10d, byte ptr [r14 + rcx*4 + 0x2c]
1458f72d0	lea	r8, [rcx + 8]
1458f72d4	mov	qword ptr [r14 + 0x110], r8
1458f72db	cmp	rdx, 0x3e
1458f72df	jne	0x1458f7312
1458f72e1	add	rax, 0x120
1458f72e7	mov	rcx, rax
1458f72ea	mov	rdx, rbx
1458f72ed	mov	sil, r9b
1458f72f0	mov	dil, r10b
1458f72f3	call	0x145914d30
1458f72f8	nop
1458f72f9	mov	dl, byte ptr [rbp + 0x4f]
1458f72fc	movzx	r8d, byte ptr [rbp + 0x4e]
1458f7301	mov	r10d, edi
1458f7304	mov	r9d, esi
1458f7307	movzx	r11d, byte ptr [rbx]
1458f730b	mov	eax, 1
1458f7310	jmp	0x1458f7357
1458f7312	movzx	r11d, byte ptr [r14 + rcx*4 + 0x30]
1458f7318	lea	rdx, [rcx + 9]
1458f731c	mov	qword ptr [r14 + 0x110], rdx
1458f7323	cmp	rcx, 0x37
1458f7327	jb	0x1458f7360
1458f7329	add	rax, 0x120
1458f732f	mov	rcx, rax
1458f7332	mov	rdx, rbx
1458f7335	mov	sil, r9b
1458f7338	mov	dil, r10b
1458f733b	mov	r15b, r11b
1458f733e	call	0x145914d30
1458f7343	nop
1458f7344	mov	dl, byte ptr [rbp + 0x4f]
1458f7347	movzx	r8d, byte ptr [rbp + 0x4e]
1458f734c	mov	r11d, r15d
1458f734f	mov	r10d, edi
1458f7352	mov	r9d, esi
1458f7355	xor	eax, eax
1458f7357	lea	rdi, [rax + 1]
1458f735b	jmp	0x1458f6dd4
1458f7360	movzx	edx, byte ptr [r14 + rcx*4 + 0x34]
1458f7366	mov	byte ptr [rbp + 0x49], dl
1458f7369	lea	rdx, [rcx + 0xa]
1458f736d	mov	qword ptr [r14 + 0x110], rdx
1458f7374	cmp	r8, 0x3e
1458f7378	jne	0x1458f73b3
1458f737a	add	rax, 0x120
1458f7380	mov	rcx, rax
1458f7383	mov	rdx, rbx
1458f7386	mov	sil, r9b
1458f7389	mov	dil, r10b
1458f738c	mov	r15b, r11b
1458f738f	call	0x145914d30
1458f7394	nop
1458f7395	mov	dl, byte ptr [rbp + 0x4f]
1458f7398	movzx	r8d, byte ptr [rbp + 0x4e]
1458f739d	mov	r11d, r15d
1458f73a0	mov	r10d, edi
1458f73a3	mov	r9d, esi
1458f73a6	movzx	eax, byte ptr [rbx]
1458f73a9	mov	byte ptr [rbp + 0x4a], al
1458f73ac	mov	eax, 1
1458f73b1	jmp	0x1458f73fc
1458f73b3	movzx	r8d, byte ptr [r14 + rcx*4 + 0x38]
1458f73b9	mov	byte ptr [rbp + 0x4a], r8b
1458f73bd	lea	r8, [rcx + 0xb]
1458f73c1	mov	qword ptr [r14 + 0x110], r8
1458f73c8	cmp	rcx, 0x35
1458f73cc	jb	0x1458f7405
1458f73ce	add	rax, 0x120
1458f73d4	mov	rcx, rax
1458f73d7	mov	rdx, rbx
1458f73da	mov	sil, r9b
1458f73dd	mov	dil, r10b
1458f73e0	mov	r15b, r11b
1458f73e3	call	0x145914d30
1458f73e8	nop
1458f73e9	mov	dl, byte ptr [rbp + 0x4f]
1458f73ec	movzx	r8d, byte ptr [rbp + 0x4e]
1458f73f1	mov	r11d, r15d
1458f73f4	mov	r10d, edi
1458f73f7	mov	r9d, esi
1458f73fa	xor	eax, eax
1458f73fc	lea	rdi, [rax + 1]
1458f7400	jmp	0x1458f6dfc
1458f7405	movzx	r13d, byte ptr [r14 + rcx*4 + 0x3c]
1458f740b	lea	r8, [rcx + 0xc]
1458f740f	mov	qword ptr [r14 + 0x110], r8
1458f7416	cmp	rdx, 0x3e
1458f741a	jne	0x1458f7452
1458f741c	add	rax, 0x120
1458f7422	mov	rcx, rax
1458f7425	mov	rdx, rbx
1458f7428	mov	sil, r9b
1458f742b	mov	dil, r10b
1458f742e	mov	r15b, r11b
1458f7431	call	0x145914d30
1458f7436	nop
1458f7437	mov	dl, byte ptr [rbp + 0x4f]
1458f743a	movzx	r8d, byte ptr [rbp + 0x4e]
1458f743f	mov	r11d, r15d
1458f7442	mov	r10d, edi
1458f7445	mov	r9d, esi
1458f7448	movzx	esi, byte ptr [rbx]
1458f744b	mov	eax, 1
1458f7450	jmp	0x1458f74a0
1458f7452	mov	byte ptr [rbp + 0x4d], r11b
1458f7456	mov	byte ptr [rbp + 0x4c], r10b
1458f745a	mov	byte ptr [rbp + 0x4b], r9b
1458f745e	movzx	esi, byte ptr [r14 + rcx*4 + 0x40]
1458f7464	lea	rdx, [rcx + 0xd]
1458f7468	mov	qword ptr [r14 + 0x110], rdx
1458f746f	cmp	rcx, 0x33
1458f7473	jb	0x1458f74a9
1458f7475	add	rax, 0x120
1458f747b	mov	rcx, rax
1458f747e	mov	rdx, rbx
1458f7481	call	0x145914d30
1458f7486	nop
1458f7487	mov	dl, byte ptr [rbp + 0x4f]
1458f748a	movzx	r8d, byte ptr [rbp + 0x4e]
1458f748f	movzx	r9d, byte ptr [rbp + 0x4b]
1458f7494	movzx	r10d, byte ptr [rbp + 0x4c]
1458f7499	movzx	r11d, byte ptr [rbp + 0x4d]
1458f749e	xor	eax, eax
1458f74a0	lea	rdi, [rax + 1]
1458f74a4	jmp	0x1458f6e1e
1458f74a9	mov	r15d, dword ptr [r14 + rcx*4 + 0x44]
1458f74ae	lea	rdx, [rcx + 0xe]
1458f74b2	mov	qword ptr [r14 + 0x110], rdx
1458f74b9	cmp	r8, 0x3e
1458f74bd	jne	0x1458f74f2
1458f74bf	add	rax, 0x120
1458f74c5	mov	edi, 1
1458f74ca	mov	rcx, rax
1458f74cd	mov	rdx, rbx
1458f74d0	call	0x145914d30
1458f74d5	nop
1458f74d6	mov	dl, byte ptr [rbp + 0x4f]
1458f74d9	movzx	r8d, byte ptr [rbp + 0x4e]
1458f74de	movzx	r9d, byte ptr [rbp + 0x4b]
1458f74e3	movzx	r10d, byte ptr [rbp + 0x4c]
1458f74e8	movzx	r11d, byte ptr [rbp + 0x4d]
1458f74ed	jmp	0x1458f6e31
1458f74f2	mov	r12d, dword ptr [r14 + rcx*4 + 0x48]
1458f74f7	lea	rdi, [rcx + 0xf]
1458f74fb	mov	qword ptr [r14 + 0x110], rdi
1458f7502	cmp	rcx, 0x31
1458f7506	jb	0x1458f7538
1458f7508	add	rax, 0x120
1458f750e	mov	rcx, rax
1458f7511	mov	rdx, rbx
1458f7514	call	0x145914d30
1458f7519	nop
1458f751a	mov	dl, byte ptr [rbp + 0x4f]
1458f751d	movzx	r8d, byte ptr [rbp + 0x4e]
1458f7522	movzx	r9d, byte ptr [rbp + 0x4b]
1458f7527	movzx	r10d, byte ptr [rbp + 0x4c]
1458f752c	movzx	r11d, byte ptr [rbp + 0x4d]
1458f7531	xor	edi, edi
1458f7533	jmp	0x1458f6e3b
1458f7538	movzx	edx, byte ptr [rbp + 0x4f]
1458f753c	movzx	r8d, byte ptr [rbp + 0x4e]
1458f7541	movzx	r9d, byte ptr [rbp + 0x4b]
1458f7546	movzx	r10d, byte ptr [rbp + 0x4c]
1458f754b	movzx	r11d, byte ptr [rbp + 0x4d]
1458f7550	jmp	0x1458f6e3b
