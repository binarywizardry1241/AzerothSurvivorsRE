1459c3150	push	rbp
1459c3151	push	r15
1459c3153	push	r14
1459c3155	push	r13
1459c3157	push	r12
1459c3159	push	rsi
1459c315a	push	rdi
1459c315b	push	rbx
1459c315c	sub	rsp, 0x48
1459c3160	lea	rbp, [rsp + 0x40]
1459c3165	mov	qword ptr [rbp], 0xfffffffffffffffe
1459c316d	mov	rsi, rcx
1459c3170	mov	r12, qword ptr [rdx]
1459c3173	mov	r13, qword ptr [rdx + 8]
1459c3177	cmp	r12, r13
1459c317a	je	0x1459c31ae
1459c317c	mov	rbx, rdx
1459c317f	mov	rdi, qword ptr [rdx + 0x10]
1459c3183	add	r12, 0x40
1459c3187	nop	word ptr [rax + rax]
1459c3190	lea	rdx, [r12 - 0x40]
1459c3195	mov	qword ptr [rbx], r12
1459c3198	mov	rcx, rdi
1459c319b	call	0x1458e4e20
1459c31a0	test	al, al
1459c31a2	jne	0x1459c31ca
1459c31a4	cmp	r12, r13
1459c31a7	lea	r12, [r12 + 0x40]
1459c31ac	jne	0x1459c3190
1459c31ae	mov	qword ptr [rsi], 0
1459c31b5	mov	qword ptr [rsi + 8], 4
1459c31bd	mov	qword ptr [rsi + 0x10], 0
1459c31c5	jmp	0x1459c3295
1459c31ca	mov	ebx, dword ptr [r12 - 0x10]
1459c31cf	call	0x140002200
1459c31d4	mov	ecx, 0x10
1459c31d9	mov	edx, 4
1459c31de	call	0x1400021c0
1459c31e3	test	rax, rax
1459c31e6	je	0x1459c32a9
1459c31ec	mov	r15, rax
1459c31ef	mov	dword ptr [rax], ebx
1459c31f1	mov	qword ptr [rbp - 0x18], 4
1459c31f9	mov	qword ptr [rbp - 0x10], rax
1459c31fd	mov	qword ptr [rbp - 8], 1
1459c3205	cmp	r12, r13
1459c3208	je	0x1459c327e
1459c320a	mov	ebx, 1
1459c320f	mov	r14, r12
1459c3212	nop	word ptr cs:[rax + rax]
1459c3220	mov	rcx, rdi
1459c3223	mov	rdx, r14
1459c3226	call	0x1458e4e20
1459c322b	nop
1459c322c	lea	r12, [r14 + 0x40]
1459c3230	test	al, al
1459c3232	jne	0x1459c323e
1459c3234	mov	r14, r12
1459c3237	cmp	r12, r13
1459c323a	jne	0x1459c3220
1459c323c	jmp	0x1459c327e
1459c323e	mov	r14d, dword ptr [r14 + 0x30]
1459c3242	cmp	rbx, qword ptr [rbp - 0x18]
1459c3246	jne	0x1459c326e
1459c3248	mov	qword ptr [rsp + 0x20], 4
1459c3251	mov	r8d, 1
1459c3257	mov	r9d, 4
1459c325d	lea	rcx, [rbp - 0x18]
1459c3261	mov	rdx, rbx
1459c3264	call	0x145bfa970
1459c3269	nop
1459c326a	mov	r15, qword ptr [rbp - 0x10]
1459c326e	mov	dword ptr [r15 + rbx*4], r14d
1459c3272	inc	rbx
1459c3275	mov	qword ptr [rbp - 8], rbx
1459c3279	cmp	r12, r13
1459c327c	jne	0x1459c320f
1459c327e	mov	rax, qword ptr [rbp - 8]
1459c3282	mov	qword ptr [rsi + 0x10], rax
1459c3286	mov	rax, qword ptr [rbp - 0x18]
1459c328a	mov	qword ptr [rsi], rax
1459c328d	mov	rax, qword ptr [rbp - 0x10]
1459c3291	mov	qword ptr [rsi + 8], rax
1459c3295	mov	rax, rsi
1459c3298	add	rsp, 0x48
1459c329c	pop	rbx
1459c329d	pop	rdi
1459c329e	pop	rsi
1459c329f	pop	r12
1459c32a1	pop	r13
1459c32a3	pop	r14
1459c32a5	pop	r15
1459c32a7	pop	rbp
1459c32a8	ret
1459c32a9	mov	ecx, 4
1459c32ae	mov	edx, 0x10
1459c32b3	call	0x145d992bb
1459c32b8	ud2
