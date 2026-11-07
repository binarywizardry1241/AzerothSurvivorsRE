14006b080	push	rbp
14006b081	push	r15
14006b083	push	r14
14006b085	push	r13
14006b087	push	r12
14006b089	push	rsi
14006b08a	push	rdi
14006b08b	push	rbx
14006b08c	sub	rsp, 0x88
14006b093	lea	rbp, [rsp + 0x80]
14006b09b	mov	qword ptr [rbp], 0xfffffffffffffffe
14006b0a3	mov	edi, edx
14006b0a5	mov	rsi, rcx
14006b0a8	mov	qword ptr [rbp - 0x40], 0
14006b0b0	mov	qword ptr [rbp - 0x38], 1
14006b0b8	mov	qword ptr [rbp - 0x30], 0
14006b0c0	mov	qword ptr [rbp - 0x48], 0x60000020
14006b0c8	lea	rax, [rbp - 0x40]
14006b0cc	mov	qword ptr [rbp - 0x58], rax
14006b0d0	lea	rax, [rip + 0x5d65739]
14006b0d7	mov	qword ptr [rbp - 0x50], rax
14006b0db	lea	rdx, [rbp - 0x58]
14006b0df	mov	rcx, r8
14006b0e2	call	0x142aeb950
14006b0e7	nop
14006b0e8	test	al, al
14006b0ea	jne	0x14006b1ba
14006b0f0	mov	r15, qword ptr [rbp - 0x40]
14006b0f4	mov	r12, qword ptr [rbp - 0x38]
14006b0f8	mov	rbx, qword ptr [rbp - 0x30]
14006b0fc	mov	r13, rbx
14006b0ff	add	r13, 8
14006b103	mov	qword ptr [rbp - 0x28], r15
14006b107	mov	qword ptr [rbp - 0x20], r12
14006b10b	jns	0x14006b121
14006b10d	xor	r14d, r14d
14006b110	mov	rcx, r14
14006b113	mov	rdx, r13
14006b116	call	0x145d992bb
14006b11b	nop
14006b11c	jmp	0x14006b1e3
14006b121	call	0x140002200
14006b126	mov	r14d, 1
14006b12c	mov	edx, 1
14006b131	mov	rcx, r13
14006b134	call	0x1400021c0
14006b139	test	rax, rax
14006b13c	je	0x14006b110
14006b13e	mov	dword ptr [rax], edi
14006b140	mov	dword ptr [rax + 4], ebx
14006b143	test	rbx, rbx
14006b146	mov	qword ptr [rbp - 0x10], rax
14006b14a	je	0x14006b162
14006b14c	mov	rcx, rax
14006b14f	add	rcx, 8
14006b153	mov	rdx, r12
14006b156	mov	r8, rbx
14006b159	call	0x145bfa0e7
14006b15e	mov	rax, qword ptr [rbp - 0x10]
14006b162	mov	rcx, rsi
14006b165	mov	rdx, rax
14006b168	mov	r8, r13
14006b16b	mov	qword ptr [rbp - 0x18], r13
14006b16f	call	0x1400b2680
14006b174	nop
14006b175	mov	rsi, rax
14006b178	mov	r8d, 1
14006b17e	mov	rcx, qword ptr [rbp - 0x10]
14006b182	mov	rdx, qword ptr [rbp - 0x18]
14006b186	call	0x1400021d0
14006b18b	mov	rdx, qword ptr [rbp - 0x28]
14006b18f	test	rdx, rdx
14006b192	je	0x14006b1a3
14006b194	mov	r8d, 1
14006b19a	mov	rcx, qword ptr [rbp - 0x20]
14006b19e	call	0x1400021d0
14006b1a3	mov	rax, rsi
14006b1a6	add	rsp, 0x88
14006b1ad	pop	rbx
14006b1ae	pop	rdi
14006b1af	pop	rsi
14006b1b0	pop	r12
14006b1b2	pop	r13
14006b1b4	pop	r14
14006b1b6	pop	r15
14006b1b8	pop	rbp
14006b1b9	ret
14006b1ba	lea	rax, [rip + 0x5d65707]
14006b1c1	mov	qword ptr [rsp + 0x20], rax
14006b1c6	lea	rcx, [rip + 0x5d65673]
14006b1cd	lea	r9, [rip + 0x5d63394]
14006b1d4	lea	r8, [rbp - 1]
14006b1d8	mov	edx, 0x37
14006b1dd	call	0x145d995d0
14006b1e2	nop
14006b1e3	ud2
