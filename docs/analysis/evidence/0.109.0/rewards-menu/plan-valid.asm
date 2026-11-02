1458d7780	push	rbp
1458d7781	push	r15
1458d7783	push	r14
1458d7785	push	r13
1458d7787	push	r12
1458d7789	push	rsi
1458d778a	push	rdi
1458d778b	push	rbx
1458d778c	sub	rsp, 0x118
1458d7793	lea	rbp, [rsp + 0x80]
1458d779b	mov	qword ptr [rbp + 0x90], 0xfffffffffffffffe
1458d77a6	mov	r14, rdx
1458d77a9	mov	r15, rcx
1458d77ac	add	rdx, 0xf0
1458d77b3	lea	rcx, [rbp + 0x20]
1458d77b7	call	0x1459cbdd0
1458d77bc	mov	rdx, qword ptr [r14 + 0x118]
1458d77c3	lea	r12, [rdx*4]
1458d77cb	mov	rax, rdx
1458d77ce	shr	rax, 0x3e
1458d77d2	setne	al
1458d77d5	movabs	rcx, 0x7ffffffffffffffc
1458d77df	cmp	r12, rcx
1458d77e2	seta	cl
1458d77e5	or	cl, al
1458d77e7	je	0x1458d77f9
1458d77e9	xor	edi, edi
1458d77eb	mov	rcx, rdi
1458d77ee	mov	rdx, r12
1458d77f1	call	0x145d992bb
1458d77f6	nop
1458d77f7	ud2
1458d77f9	mov	qword ptr [rbp + 0x78], rdx
1458d77fd	mov	rsi, qword ptr [r14 + 0x110]
1458d7804	test	r12, r12
1458d7807	je	0x1458d7abd
1458d780d	call	0x140002200
1458d7812	mov	edi, 4
1458d7817	mov	edx, 4
1458d781c	mov	rcx, r12
1458d781f	call	0x1400021c0
1458d7824	test	rax, rax
1458d7827	je	0x1458d77eb
1458d7829	mov	rbx, rax
1458d782c	mov	rax, qword ptr [rbp + 0x78]
1458d7830	mov	rdi, rax
1458d7833	test	rax, rax
1458d7836	je	0x1458d7846
1458d7838	mov	rcx, rbx
1458d783b	mov	rdx, rsi
1458d783e	mov	r8, r12
1458d7841	call	0x145bfa0e7
1458d7846	mov	qword ptr [rbp + 0x48], r14
1458d784a	mov	rax, qword ptr [rbp + 0x30]
1458d784e	mov	qword ptr [rbp], rax
1458d7852	movdqu	xmm0, xmmword ptr [rbp + 0x20]
1458d7857	movdqa	xmmword ptr [rbp - 0x10], xmm0
1458d785c	mov	qword ptr [rbp - 0x40], rdi
1458d7860	mov	qword ptr [rbp + 8], rdi
1458d7864	mov	qword ptr [rbp + 0x38], rbx
1458d7868	mov	qword ptr [rbp + 0x10], rbx
1458d786c	mov	rax, qword ptr [rbp + 0x78]
1458d7870	mov	qword ptr [rbp + 0x18], rax
1458d7874	mov	r13, qword ptr [r15 + 8]
1458d7878	mov	qword ptr [rbp + 0x70], r15
1458d787c	mov	rax, qword ptr [r15 + 0x10]
1458d7880	mov	r14, rax
1458d7883	shl	r14, 5
1458d7887	mov	qword ptr [rbp - 0x28], rax
1458d788b	test	rax, rax
1458d788e	mov	qword ptr [rbp + 0x40], r12
1458d7892	je	0x1458d7ad6
1458d7898	lea	rax, [r14 + r13]
1458d789c	mov	qword ptr [rbp - 0x38], rax
1458d78a0	mov	r12, qword ptr [rbp - 8]
1458d78a4	mov	r15, qword ptr [rbp]
1458d78a8	mov	rax, r15
1458d78ab	shl	rax, 5
1458d78af	mov	qword ptr [rbp + 0x50], rax
1458d78b3	mov	rax, qword ptr [rbp + 0x48]
1458d78b7	mov	rcx, qword ptr [rax + 0xb0]
1458d78be	mov	qword ptr [rbp + 0x58], rcx
1458d78c2	mov	rax, qword ptr [rax + 0xb8]
1458d78c9	mov	qword ptr [rbp - 0x30], rax
1458d78cd	mov	rbx, r13
1458d78d0	mov	qword ptr [rbp + 0x88], r12
1458d78d7	mov	qword ptr [rbp + 0x60], r14
1458d78db	jmp	0x1458d78ee
1458d78dd	nop	dword ptr [rax]
1458d78e0	add	rbx, 0x20
1458d78e4	cmp	rbx, qword ptr [rbp - 0x38]
1458d78e8	je	0x1458d7b16
1458d78ee	mov	rsi, qword ptr [rbx + 8]
1458d78f2	mov	rdi, qword ptr [rbx + 0x10]
1458d78f6	mov	rcx, rsi
1458d78f9	mov	rdx, rdi
1458d78fc	call	0x1458e54e0
1458d7901	test	rax, rax
1458d7904	je	0x1458d7b0e
1458d790a	movzx	r14d, byte ptr [rbx + 0x18]
1458d790f	mov	qword ptr [rbp + 0x68], rax
1458d7913	cmp	r14b, byte ptr [rax + 0x38]
1458d7917	ja	0x1458d7b0e
1458d791d	test	r15, r15
1458d7920	mov	qword ptr [rbp + 0x80], rbx
1458d7927	je	0x1458d7980
1458d7929	xor	ebx, ebx
1458d792b	jmp	0x1458d793a
1458d792d	nop	dword ptr [rax]
1458d7930	add	rbx, 0x20
1458d7934	cmp	qword ptr [rbp + 0x50], rbx
1458d7938	je	0x1458d7960
1458d793a	cmp	qword ptr [r12 + rbx + 0x10], rdi
1458d793f	jne	0x1458d7930
1458d7941	mov	rcx, qword ptr [r12 + rbx + 8]
1458d7946	mov	rdx, rsi
1458d7949	mov	r8, rdi
1458d794c	call	0x145bfa0e1
1458d7951	test	eax, eax
1458d7953	jne	0x1458d7930
1458d7955	movzx	eax, byte ptr [r12 + rbx + 0x18]
1458d795b	jmp	0x1458d7962
1458d795d	nop	dword ptr [rax]
1458d7960	xor	eax, eax
1458d7962	mov	rbx, qword ptr [rbp + 0x80]
1458d7969	cmp	r14b, al
1458d796c	mov	rax, qword ptr [rbp + 0x68]
1458d7970	ja	0x1458d798f
1458d7972	jmp	0x1458d7a5c
1458d7977	nop	word ptr [rax + rax]
1458d7980	xor	eax, eax
1458d7982	cmp	r14b, al
1458d7985	mov	rax, qword ptr [rbp + 0x68]
1458d7989	jbe	0x1458d7a5c
1458d798f	mov	rdx, qword ptr [rax + 0x50]
1458d7993	mov	rdi, qword ptr [rax + 0x58]
1458d7997	xor	r12d, r12d
1458d799a	mov	rbx, qword ptr [rbp - 0x30]
1458d799e	cmp	rbx, 1
1458d79a2	mov	qword ptr [rbp - 0x20], r13
1458d79a6	mov	qword ptr [rbp - 0x18], r15
1458d79aa	je	0x1458d7a0d
1458d79ac	test	rbx, rbx
1458d79af	mov	r8, qword ptr [rbp + 0x58]
1458d79b3	je	0x1458d7c9b
1458d79b9	xor	r12d, r12d
1458d79bc	nop	dword ptr [rax]
1458d79c0	mov	r14, r12
1458d79c3	mov	r13, rbx
1458d79c6	shr	r13, 1
1458d79c9	add	r12, r13
1458d79cc	lea	rax, [r12 + r12*2]
1458d79d0	mov	rcx, qword ptr [r8 + rax*8 + 8]
1458d79d5	mov	r8, qword ptr [r8 + rax*8 + 0x10]
1458d79da	mov	rsi, r8
1458d79dd	sub	rsi, rdi
1458d79e0	cmovae	r8, rdi
1458d79e4	mov	r15, rdx
1458d79e7	call	0x145bfa0e1
1458d79ec	mov	rdx, r15
1458d79ef	cdqe
1458d79f1	test	eax, eax
1458d79f3	cmovne	rsi, rax
1458d79f7	test	rsi, rsi
1458d79fa	mov	r8, qword ptr [rbp + 0x58]
1458d79fe	cmovg	r12, r14
1458d7a02	sub	rbx, r13
1458d7a05	cmp	rbx, 1
1458d7a09	ja	0x1458d79c0
1458d7a0b	jmp	0x1458d7a11
1458d7a0d	mov	r8, qword ptr [rbp + 0x58]
1458d7a11	lea	rax, [r12 + r12*2]
1458d7a15	mov	rcx, qword ptr [r8 + rax*8 + 8]
1458d7a1a	mov	rax, qword ptr [r8 + rax*8 + 0x10]
1458d7a1f	mov	rsi, rax
1458d7a22	sub	rsi, rdi
1458d7a25	cmovb	rdi, rax
1458d7a29	mov	r8, rdi
1458d7a2c	call	0x145bfa0e1
1458d7a31	cdqe
1458d7a33	test	eax, eax
1458d7a35	cmovne	rsi, rax
1458d7a39	test	rsi, rsi
1458d7a3c	mov	r12, qword ptr [rbp + 0x88]
1458d7a43	mov	r13, qword ptr [rbp - 0x20]
1458d7a47	mov	rbx, qword ptr [rbp + 0x80]
1458d7a4e	mov	rax, qword ptr [rbp + 0x68]
1458d7a52	mov	r15, qword ptr [rbp - 0x18]
1458d7a56	jne	0x1458d7b0e
1458d7a5c	mov	rsi, qword ptr [rax + 0x60]
1458d7a60	test	rsi, rsi
1458d7a63	mov	r14, qword ptr [rbp + 0x60]
1458d7a67	je	0x1458d78e0
1458d7a6d	mov	rdi, qword ptr [rax + 0x68]
1458d7a71	xor	ebx, ebx
1458d7a73	jmp	0x1458d7a8d
1458d7a75	nop	word ptr cs:[rax + rax]
1458d7a80	add	rbx, 0x20
1458d7a84	cmp	r14, rbx
1458d7a87	je	0x1458d7b0e
1458d7a8d	cmp	qword ptr [r13 + rbx + 0x10], rdi
1458d7a92	jne	0x1458d7a80
1458d7a94	mov	rcx, qword ptr [r13 + rbx + 8]
1458d7a99	mov	rdx, rsi
1458d7a9c	mov	r8, rdi
1458d7a9f	call	0x145bfa0e1
1458d7aa4	test	eax, eax
1458d7aa6	jne	0x1458d7a80
1458d7aa8	cmp	byte ptr [r13 + rbx + 0x18], 0
1458d7aae	mov	rbx, qword ptr [rbp + 0x80]
1458d7ab5	jne	0x1458d78e0
1458d7abb	jmp	0x1458d7b0e
1458d7abd	mov	ebx, 4
1458d7ac2	xor	edi, edi
1458d7ac4	mov	rax, qword ptr [rbp + 0x78]
1458d7ac8	test	rax, rax
1458d7acb	jne	0x1458d7838
1458d7ad1	jmp	0x1458d7846
1458d7ad6	mov	rdi, qword ptr [rbp - 8]
1458d7ada	mov	r15, qword ptr [rbp]
1458d7ade	mov	rax, r15
1458d7ae1	shl	rax, 5
1458d7ae5	mov	rcx, rdi
1458d7ae8	nop	dword ptr [rax + rax]
1458d7af0	test	rax, rax
1458d7af3	je	0x1458d7b9a
1458d7af9	add	rax, -0x20
1458d7afd	cmp	byte ptr [rcx + 0x18], 0
1458d7b01	lea	rcx, [rcx + 0x20]
1458d7b05	je	0x1458d7af0
1458d7b07	mov	qword ptr [rbp + 0x88], rdi
1458d7b0e	xor	r12d, r12d
1458d7b11	jmp	0x1458d7c9b
1458d7b16	add	qword ptr [rbp + 0x50], r12
1458d7b1a	mov	r14, r12
1458d7b1d	jmp	0x1458d7b34
1458d7b1f	mov	rcx, r12
1458d7b22	xor	eax, eax
1458d7b24	xor	r12d, r12d
1458d7b27	cmp	al, byte ptr [r14 + 0x18]
1458d7b2b	mov	r14, rcx
1458d7b2e	jb	0x1458d7c9b
1458d7b34	cmp	r14, qword ptr [rbp + 0x50]
1458d7b38	je	0x1458d7b8f
1458d7b3a	lea	r12, [r14 + 0x20]
1458d7b3e	mov	rsi, qword ptr [r14 + 8]
1458d7b42	mov	rdi, qword ptr [r14 + 0x10]
1458d7b46	xor	ebx, ebx
1458d7b48	jmp	0x1458d7b5a
1458d7b4a	nop	word ptr [rax + rax]
1458d7b50	add	rbx, 0x20
1458d7b54	cmp	qword ptr [rbp + 0x60], rbx
1458d7b58	je	0x1458d7b1f
1458d7b5a	cmp	qword ptr [r13 + rbx + 0x10], rdi
1458d7b5f	jne	0x1458d7b50
1458d7b61	mov	rcx, qword ptr [r13 + rbx + 8]
1458d7b66	mov	rdx, rsi
1458d7b69	mov	r8, rdi
1458d7b6c	call	0x145bfa0e1
1458d7b71	test	eax, eax
1458d7b73	jne	0x1458d7b50
1458d7b75	mov	rcx, r12
1458d7b78	movzx	eax, byte ptr [r13 + rbx + 0x18]
1458d7b7e	xor	r12d, r12d
1458d7b81	cmp	al, byte ptr [r14 + 0x18]
1458d7b85	mov	r14, rcx
1458d7b88	jae	0x1458d7b34
1458d7b8a	jmp	0x1458d7c9b
1458d7b8f	mov	rdi, qword ptr [rbp + 0x88]
1458d7b96	mov	r14, qword ptr [rbp + 0x60]
1458d7b9a	lea	rax, [rip + 0x1317617]
1458d7ba1	mov	qword ptr [rbp + 0x20], rax
1458d7ba5	lea	rax, [rip + 0x1317654]
1458d7bac	mov	qword ptr [rbp + 0x28], rax
1458d7bb0	mov	rax, qword ptr [rbp + 0x70]
1458d7bb4	mov	qword ptr [rbp + 0x30], rax
1458d7bb8	lea	rcx, [rbp - 0x58]
1458d7bbc	lea	rdx, [rbp + 0x20]
1458d7bc0	call	0x1459bae00
1458d7bc5	nop
1458d7bc6	cmp	qword ptr [rbp - 0x28], 0
1458d7bcb	je	0x1458d7c6a
1458d7bd1	xor	esi, esi
1458d7bd3	movabs	rcx, 0x6f696e61706d6f63
1458d7bdd	xor	eax, eax
1458d7bdf	jmp	0x1458d7bf9
1458d7be1	nop	word ptr cs:[rax + rax]
1458d7bf0	add	rax, 0x20
1458d7bf4	cmp	r14, rax
1458d7bf7	je	0x1458d7c25
1458d7bf9	cmp	qword ptr [r13 + rax + 0x10], 9
1458d7bff	jne	0x1458d7bf0
1458d7c01	mov	rdx, qword ptr [r13 + rax + 8]
1458d7c06	mov	r8, qword ptr [rdx]
1458d7c09	xor	r8, rcx
1458d7c0c	movzx	edx, byte ptr [rdx + 8]
1458d7c10	xor	rdx, 0x6e
1458d7c14	or	rdx, r8
1458d7c17	jne	0x1458d7bf0
1458d7c19	xor	esi, esi
1458d7c1b	cmp	byte ptr [r13 + rax + 0x18], 0
1458d7c21	setne	sil
1458d7c25	xor	eax, eax
1458d7c27	mov	edx, 0x6f636573
1458d7c2c	xor	ecx, ecx
1458d7c2e	jmp	0x1458d7c39
1458d7c30	add	rcx, 0x20
1458d7c34	cmp	r14, rcx
1458d7c37	je	0x1458d7c6e
1458d7c39	cmp	qword ptr [r13 + rcx + 0x10], 6
1458d7c3f	jne	0x1458d7c30
1458d7c41	mov	r8, qword ptr [r13 + rcx + 8]
1458d7c46	mov	r9d, dword ptr [r8]
1458d7c49	xor	r9d, edx
1458d7c4c	movzx	r8d, word ptr [r8 + 4]
1458d7c51	xor	r8d, 0x646e
1458d7c58	or	r8d, r9d
1458d7c5b	jne	0x1458d7c30
1458d7c5d	xor	eax, eax
1458d7c5f	cmp	byte ptr [r13 + rcx + 0x18], 0
1458d7c65	setne	al
1458d7c68	jmp	0x1458d7c6e
1458d7c6a	xor	esi, esi
1458d7c6c	xor	eax, eax
1458d7c6e	mov	qword ptr [rbp + 0x88], rdi
1458d7c75	add	rsi, rax
1458d7c78	mov	rdi, qword ptr [rbp - 0x48]
1458d7c7c	mov	rdx, qword ptr [rbp - 0x58]
1458d7c80	test	rdx, rdx
1458d7c83	je	0x1458d7c94
1458d7c85	mov	rcx, qword ptr [rbp - 0x50]
1458d7c89	mov	r8d, 1
1458d7c8f	call	0x1400021d0
1458d7c94	cmp	rdi, rsi
1458d7c97	setbe	r12b
1458d7c9b	mov	rcx, qword ptr [rbp + 0x70]
1458d7c9f	mov	rax, qword ptr [rcx + 0x20]
1458d7ca3	mov	r8, qword ptr [rcx + 0x28]
1458d7ca7	lea	rdx, [r8*4]
1458d7caf	xor	r9d, r9d
1458d7cb2	mov	r10d, 0xfffea06f
1458d7cb8	lea	r11, [rip + 0x1319329]
1458d7cbf	mov	rdi, qword ptr [rbp + 0x78]
1458d7cc3	nop	word ptr cs:[rax + rax]
1458d7cd0	cmp	rdx, r9
1458d7cd3	je	0x1458d7d46
1458d7cd5	mov	ecx, dword ptr [rax + r9]
1458d7cd9	add	ecx, r10d
1458d7cdc	mov	esi, 0xfffc3f
1458d7ce1	shr	esi, cl
1458d7ce3	xor	r13d, r13d
1458d7ce6	cmp	ecx, 0x17
1458d7ce9	ja	0x1458d7d05
1458d7ceb	test	sil, 1
1458d7cef	je	0x1458d7d05
1458d7cf1	mov	ecx, ecx
1458d7cf3	mov	rcx, qword ptr [r11 + rcx*8]
1458d7cf7	add	r9, 4
1458d7cfb	cmp	qword ptr [rcx + 0x20], 0
1458d7d00	je	0x1458d7cd0
1458d7d02	xor	r13d, r13d
1458d7d05	mov	rdi, qword ptr [rbp + 0x88]
1458d7d0c	test	r15, r15
1458d7d0f	je	0x1458d7f99
1458d7d15	lea	rsi, [rdi + 8]
1458d7d19	jmp	0x1458d7d2d
1458d7d1b	nop	dword ptr [rax + rax]
1458d7d20	add	rsi, 0x20
1458d7d24	dec	r15
1458d7d27	je	0x1458d7f99
1458d7d2d	mov	rdx, qword ptr [rsi - 8]
1458d7d31	test	rdx, rdx
1458d7d34	je	0x1458d7d20
1458d7d36	mov	rcx, qword ptr [rsi]
1458d7d39	mov	r8d, 1
1458d7d3f	call	0x1400021d0
1458d7d44	jmp	0x1458d7d20
1458d7d46	test	rdi, rdi
1458d7d49	je	0x1458d7dfd
1458d7d4f	mov	r9, qword ptr [rbp + 0x38]
1458d7d53	add	qword ptr [rbp + 0x40], r9
1458d7d57	mov	ecx, r8d
1458d7d5a	and	ecx, 0xf
1458d7d5d	movabs	rdx, 0x1ffffffffffffff0
1458d7d67	and	rdx, r8
1458d7d6a	lea	r8, [rax + rdx*4]
1458d7d6e	shl	ecx, 2
1458d7d71	mov	r10d, dword ptr [r9]
1458d7d74	add	r9, 4
1458d7d78	movd	xmm0, r10d
1458d7d7d	pshufd	xmm0, xmm0, 0
1458d7d82	xor	r11d, r11d
1458d7d85	nop	word ptr cs:[rax + rax]
1458d7d90	cmp	rdx, r11
1458d7d93	je	0x1458d7dda
1458d7d95	movdqu	xmm1, xmmword ptr [rax + r11*4]
1458d7d9b	movdqu	xmm2, xmmword ptr [rax + r11*4 + 0x10]
1458d7da2	movdqu	xmm3, xmmword ptr [rax + r11*4 + 0x20]
1458d7da9	movdqu	xmm4, xmmword ptr [rax + r11*4 + 0x30]
1458d7db0	pcmpeqd	xmm2, xmm0
1458d7db4	pcmpeqd	xmm1, xmm0
1458d7db8	packssdw	xmm1, xmm2
1458d7dbc	pcmpeqd	xmm3, xmm0
1458d7dc0	pcmpeqd	xmm4, xmm0
1458d7dc4	packssdw	xmm3, xmm4
1458d7dc8	packsswb	xmm1, xmm3
1458d7dcc	pmovmskb	esi, xmm1
1458d7dd0	add	r11, 0x10
1458d7dd4	test	esi, esi
1458d7dd6	je	0x1458d7d90
1458d7dd8	jmp	0x1458d7df3
1458d7dda	xor	r11d, r11d
1458d7ddd	nop	dword ptr [rax]
1458d7de0	cmp	rcx, r11
1458d7de3	je	0x1458d7d02
1458d7de9	cmp	dword ptr [r8 + r11], r10d
1458d7ded	lea	r11, [r11 + 4]
1458d7df1	jne	0x1458d7de0
1458d7df3	cmp	r9, qword ptr [rbp + 0x40]
1458d7df7	jne	0x1458d7d71
1458d7dfd	test	r12b, r12b
1458d7e00	je	0x1458d7d02
1458d7e06	mov	rcx, qword ptr [rbp + 0x70]
1458d7e0a	call	0x1458d7590
1458d7e0f	mov	edi, eax
1458d7e11	mov	rax, qword ptr [rip + 0x27b52b8]
1458d7e18	cmp	rax, 0xd
1458d7e1c	mov	ecx, 0xd
1458d7e21	cmovb	rcx, rax
1458d7e25	shl	ecx, 5
1458d7e28	lea	rax, [rip + 0x27b25b9]
1458d7e2f	lea	rsi, [rax + rcx]
1458d7e33	mov	eax, dword ptr [rcx + rax + 0x18]
1458d7e37	test	eax, eax
1458d7e39	jne	0x1458d7fe7
1458d7e3f	mov	dword ptr [rbp + 0x70], edi
1458d7e42	mov	rax, qword ptr [rsi + 0x10]
1458d7e46	mov	qword ptr [rbp + 0x78], rax
1458d7e4a	test	rax, rax
1458d7e4d	je	0x1458d7f7f
1458d7e53	mov	rax, qword ptr [rsi + 8]
1458d7e57	mov	qword ptr [rbp + 0x68], rax
1458d7e5b	mov	rax, qword ptr [rbp + 0x48]
1458d7e5f	mov	rdi, qword ptr [rax + 0xb0]
1458d7e66	mov	r14, qword ptr [rax + 0xb8]
1458d7e6d	xor	ecx, ecx
1458d7e6f	xor	edx, edx
1458d7e71	mov	qword ptr [rbp + 0x88], r14
1458d7e78	jmp	0x1458d7e9e
1458d7e7a	nop	word ptr [rax + rax]
1458d7e80	mov	rcx, qword ptr [rbp + 0x58]
1458d7e84	mov	r14, qword ptr [rbp + 0x88]
1458d7e8b	mov	rdx, qword ptr [rbp + 0x60]
1458d7e8f	add	ecx, eax
1458d7e91	inc	rdx
1458d7e94	cmp	rdx, qword ptr [rbp + 0x78]
1458d7e98	je	0x1458d7f81
1458d7e9e	mov	eax, 0
1458d7ea3	test	r14, r14
1458d7ea6	je	0x1458d7e8f
1458d7ea8	mov	qword ptr [rbp + 0x60], rdx
1458d7eac	imul	r8, rdx, 0x70
1458d7eb0	mov	rax, qword ptr [rbp + 0x68]
1458d7eb4	mov	rdx, qword ptr [rax + r8 + 8]
1458d7eb9	mov	r15, qword ptr [rax + r8 + 0x10]
1458d7ebe	cmp	r14, 1
1458d7ec2	mov	qword ptr [rbp + 0x58], rcx
1458d7ec6	mov	qword ptr [rbp + 0x80], r8
1458d7ecd	jne	0x1458d7ee0
1458d7ecf	xor	r12d, r12d
1458d7ed2	jmp	0x1458d7f39
1458d7ed4	nop	word ptr cs:[rax + rax]
1458d7ee0	xor	r12d, r12d
1458d7ee3	nop	word ptr cs:[rax + rax]
1458d7ef0	mov	qword ptr [rbp + 0x50], r12
1458d7ef4	mov	rbx, r14
1458d7ef7	shr	rbx, 1
1458d7efa	add	r12, rbx
1458d7efd	lea	rax, [r12 + r12*2]
1458d7f01	mov	rcx, qword ptr [rdi + rax*8 + 8]
1458d7f06	mov	r8, qword ptr [rdi + rax*8 + 0x10]
1458d7f0b	mov	rsi, r8
1458d7f0e	sub	rsi, r15
1458d7f11	cmovae	r8, r15
1458d7f15	mov	r13, rdx
1458d7f18	call	0x145bfa0e1
1458d7f1d	mov	rdx, r13
1458d7f20	cdqe
1458d7f22	test	eax, eax
1458d7f24	cmovne	rsi, rax
1458d7f28	test	rsi, rsi
1458d7f2b	cmovg	r12, qword ptr [rbp + 0x50]
1458d7f30	sub	r14, rbx
1458d7f33	cmp	r14, 1
1458d7f37	ja	0x1458d7ef0
1458d7f39	lea	rax, [r12 + r12*2]
1458d7f3d	mov	rcx, qword ptr [rdi + rax*8 + 8]
1458d7f42	mov	rax, qword ptr [rdi + rax*8 + 0x10]
1458d7f47	mov	rsi, rax
1458d7f4a	sub	rsi, r15
1458d7f4d	cmovb	r15, rax
1458d7f51	mov	r8, r15
1458d7f54	call	0x145bfa0e1
1458d7f59	cdqe
1458d7f5b	test	eax, eax
1458d7f5d	cmovne	rsi, rax
1458d7f61	xor	eax, eax
1458d7f63	test	rsi, rsi
1458d7f66	jne	0x1458d7e80
1458d7f6c	mov	rax, qword ptr [rbp + 0x80]
1458d7f73	add	rax, qword ptr [rbp + 0x68]
1458d7f77	mov	eax, dword ptr [rax + 0x68]
1458d7f7a	jmp	0x1458d7e80
1458d7f7f	xor	ecx, ecx
1458d7f81	cmp	dword ptr [rbp + 0x70], ecx
1458d7f84	setbe	r13b
1458d7f88	mov	rdi, qword ptr [rbp - 8]
1458d7f8c	mov	r15, qword ptr [rbp]
1458d7f90	test	r15, r15
1458d7f93	jne	0x1458d7d15
1458d7f99	mov	rdx, qword ptr [rbp - 0x10]
1458d7f9d	test	rdx, rdx
1458d7fa0	je	0x1458d7fb4
1458d7fa2	shl	rdx, 5
1458d7fa6	mov	r8d, 8
1458d7fac	mov	rcx, rdi
1458d7faf	call	0x1400021d0
1458d7fb4	mov	rdx, qword ptr [rbp - 0x40]
1458d7fb8	test	rdx, rdx
1458d7fbb	mov	rcx, qword ptr [rbp + 0x38]
1458d7fbf	je	0x1458d7fd0
1458d7fc1	shl	rdx, 2
1458d7fc5	mov	r8d, 4
1458d7fcb	call	0x1400021d0
1458d7fd0	mov	eax, r13d
1458d7fd3	add	rsp, 0x118
1458d7fda	pop	rbx
1458d7fdb	pop	rdi
1458d7fdc	pop	rsi
1458d7fdd	pop	r12
1458d7fdf	pop	r13
1458d7fe1	pop	r14
1458d7fe3	pop	r15
1458d7fe5	pop	rbp
1458d7fe6	ret
1458d7fe7	mov	rcx, rsi
1458d7fea	call	0x145d7e194
1458d7fef	nop
1458d7ff0	jmp	0x1458d7e3f
