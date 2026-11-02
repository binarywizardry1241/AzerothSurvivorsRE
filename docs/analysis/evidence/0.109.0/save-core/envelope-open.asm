1458f6950	push	rbp
1458f6951	push	r14
1458f6953	push	rsi
1458f6954	push	rdi
1458f6955	push	rbx
1458f6956	sub	rsp, 0xb0
1458f695d	lea	rbp, [rsp + 0x80]
1458f6965	mov	qword ptr [rbp + 0x28], 0xfffffffffffffffe
1458f696d	mov	rsi, rcx
1458f6970	mov	rcx, rdx
1458f6973	mov	rdx, r8
1458f6976	call	0x140089200
1458f697b	cmp	rdx, 5
1458f697f	jb	0x1458f6996
1458f6981	mov	r9, rdx
1458f6984	mov	ecx, 0x31455352
1458f6989	xor	ecx, dword ptr [rax]
1458f698b	movzx	edx, byte ptr [rax + 4]
1458f698f	xor	edx, 0x3a
1458f6992	or	edx, ecx
1458f6994	je	0x1458f69ae
1458f6996	mov	qword ptr [rsi], 0xffffffffffffffff
1458f699d	mov	rax, rsi
1458f69a0	add	rsp, 0xb0
1458f69a7	pop	rbx
1458f69a8	pop	rdi
1458f69a9	pop	rsi
1458f69aa	pop	r14
1458f69ac	pop	rbp
1458f69ad	ret
1458f69ae	add	r9, -5
1458f69b2	add	rax, 5
1458f69b6	lea	rdx, [rip + 0x15dc88a]
1458f69bd	lea	rcx, [rbp - 0x30]
1458f69c1	mov	r8, rax
1458f69c4	call	0x1458e7920
1458f69c9	mov	rdx, qword ptr [rbp - 0x30]
1458f69cd	cmp	rdx, -1
1458f69d1	je	0x1458f6996
1458f69d3	mov	rcx, qword ptr [rbp - 0x28]
1458f69d7	mov	rbx, qword ptr [rbp - 0x20]
1458f69db	cmp	rbx, 0x24
1458f69df	jae	0x1458f69f3
1458f69e1	mov	qword ptr [rsi], 0xffffffffffffffff
1458f69e8	test	rdx, rdx
1458f69eb	jne	0x1458f6b45
1458f69f1	jmp	0x1458f699d
1458f69f3	mov	qword ptr [rbp + 8], rdx
1458f69f7	lea	rdi, [rcx + 0x10]
1458f69fb	add	rbx, -0x24
1458f69ff	lea	rax, [rip + 0x15dc984]
1458f6a06	mov	qword ptr [rbp - 0x30], rax
1458f6a0a	mov	qword ptr [rbp - 0x28], 3
1458f6a12	mov	qword ptr [rbp], rcx
1458f6a16	mov	qword ptr [rbp - 0x20], rcx
1458f6a1a	mov	qword ptr [rbp - 0x18], 0x10
1458f6a22	mov	qword ptr [rbp - 0x10], rdi
1458f6a26	mov	qword ptr [rbp - 8], rbx
1458f6a2a	lea	rcx, [rbp - 0x44]
1458f6a2e	lea	rdx, [rbp - 0x30]
1458f6a32	call	0x1458f6280
1458f6a37	nop
1458f6a38	movdqu	xmm0, xmmword ptr [rbp - 0x44]
1458f6a3d	movdqu	xmm1, xmmword ptr [rdi + rbx]
1458f6a42	pcmpeqb	xmm1, xmm0
1458f6a46	movd	xmm0, dword ptr [rbp - 0x34]
1458f6a4b	movd	xmm2, dword ptr [rdi + rbx + 0x10]
1458f6a51	pcmpeqb	xmm2, xmm0
1458f6a55	pand	xmm2, xmm1
1458f6a59	pmovmskb	eax, xmm2
1458f6a5d	cmp	eax, 0xffff
1458f6a62	je	0x1458f6a70
1458f6a64	mov	qword ptr [rsi], 0xffffffffffffffff
1458f6a6b	jmp	0x1458f6b34
1458f6a70	test	rbx, rbx
1458f6a73	je	0x1458f6aa3
1458f6a75	call	0x140002200
1458f6a7a	mov	edx, 1
1458f6a7f	mov	rcx, rbx
1458f6a82	call	0x1400021c0
1458f6a87	test	rax, rax
1458f6a8a	je	0x1458f6b55
1458f6a90	mov	r14, rax
1458f6a93	mov	rcx, rax
1458f6a96	mov	rdx, rdi
1458f6a99	mov	r8, rbx
1458f6a9c	call	0x145bfa0e7
1458f6aa1	jmp	0x1458f6aa9
1458f6aa3	mov	r14d, 1
1458f6aa9	mov	qword ptr [rbp + 0x10], r14
1458f6aad	mov	byte ptr [rbp + 0x27], 1
1458f6ab1	mov	rcx, qword ptr [rbp]
1458f6ab5	mov	rdx, r14
1458f6ab8	mov	r8, rbx
1458f6abb	mov	qword ptr [rbp + 0x18], rbx
1458f6abf	call	0x1458f6000
1458f6ac4	nop
1458f6ac5	lea	rcx, [rbp - 0x60]
1458f6ac9	mov	rdx, qword ptr [rbp + 0x10]
1458f6acd	mov	r8, qword ptr [rbp + 0x18]
1458f6ad1	call	0x145bd5650
1458f6ad6	nop
1458f6ad7	cmp	byte ptr [rbp - 0x60], 0
1458f6adb	je	0x1458f6b0d
1458f6add	movdqu	xmm0, xmmword ptr [rbp - 0x58]
1458f6ae2	movdqu	xmmword ptr [rbp - 0x18], xmm0
1458f6ae7	mov	rax, qword ptr [rbp + 0x18]
1458f6aeb	mov	qword ptr [rbp - 0x30], rax
1458f6aef	mov	rcx, qword ptr [rbp + 0x10]
1458f6af3	mov	qword ptr [rbp - 0x28], rcx
1458f6af7	mov	qword ptr [rbp - 0x20], rax
1458f6afb	mov	qword ptr [rsi], 0xffffffffffffffff
1458f6b02	lea	rcx, [rbp - 0x30]
1458f6b06	call	0x140cb2820
1458f6b0b	jmp	0x1458f6b34
1458f6b0d	mov	rax, qword ptr [rbp + 0x18]
1458f6b11	mov	qword ptr [rbp - 0x28], rax
1458f6b15	mov	rcx, qword ptr [rbp + 0x10]
1458f6b19	mov	qword ptr [rbp - 0x20], rcx
1458f6b1d	mov	qword ptr [rbp - 0x18], rax
1458f6b21	mov	qword ptr [rsi + 0x10], rax
1458f6b25	mov	rax, qword ptr [rbp - 0x28]
1458f6b29	mov	qword ptr [rsi], rax
1458f6b2c	mov	rax, qword ptr [rbp - 0x20]
1458f6b30	mov	qword ptr [rsi + 8], rax
1458f6b34	mov	rdx, qword ptr [rbp + 8]
1458f6b38	mov	rcx, qword ptr [rbp]
1458f6b3c	test	rdx, rdx
1458f6b3f	je	0x1458f699d
1458f6b45	mov	r8d, 1
1458f6b4b	call	0x1400021d0
1458f6b50	jmp	0x1458f699d
1458f6b55	mov	ecx, 1
1458f6b5a	mov	rdx, rbx
1458f6b5d	call	0x145d992bb
1458f6b62	nop
1458f6b63	ud2
