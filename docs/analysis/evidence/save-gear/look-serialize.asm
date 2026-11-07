1459b8000	push	rbp
1459b8001	push	r15
1459b8003	push	r14
1459b8005	push	r13
1459b8007	push	r12
1459b8009	push	rsi
1459b800a	push	rdi
1459b800b	push	rbx
1459b800c	sub	rsp, 0xb8
1459b8013	lea	rbp, [rsp + 0x80]
1459b801b	mov	qword ptr [rbp + 0x30], 0xfffffffffffffffe
1459b8023	mov	rsi, rcx
1459b8026	mov	rax, qword ptr [rdx]
1459b8029	mov	r13, qword ptr [rdx + 8]
1459b802d	cmp	rax, r13
1459b8030	je	0x1459b81d4
1459b8036	mov	rcx, qword ptr [rdx + 0x10]
1459b803a	nop	word ptr [rax + rax]
1459b8040	cmp	byte ptr [rax], 0
1459b8043	jne	0x1459b805a
1459b8045	add	rax, 8
1459b8049	inc	rcx
1459b804c	mov	qword ptr [rdx + 0x10], rcx
1459b8050	cmp	rax, r13
1459b8053	jne	0x1459b8040
1459b8055	jmp	0x1459b81d4
1459b805a	lea	rbx, [rax + 8]
1459b805e	mov	qword ptr [rdx], rbx
1459b8061	mov	eax, dword ptr [rax + 4]
1459b8064	lea	r14, [rcx + 1]
1459b8068	mov	qword ptr [rdx + 0x10], r14
1459b806c	mov	qword ptr [rbp - 0x38], rcx
1459b8070	mov	dword ptr [rbp + 8], eax
1459b8073	lea	rax, [rbp - 0x38]
1459b8077	mov	qword ptr [rbp - 0x20], rax
1459b807b	lea	rax, [rip + 0x22774e]
1459b8082	mov	qword ptr [rbp - 0x18], rax
1459b8086	lea	rax, [rbp + 8]
1459b808a	mov	qword ptr [rbp - 0x10], rax
1459b808e	lea	rax, [rip + 0x22684b]
1459b8095	mov	qword ptr [rbp - 8], rax
1459b8099	lea	rdx, [rip + 0x187eba8]
1459b80a0	lea	rcx, [rbp - 0x58]
1459b80a4	lea	r8, [rbp - 0x20]
1459b80a8	call	0x145bcce30
1459b80ad	mov	rdi, qword ptr [rbp - 0x58]
1459b80b1	cmp	rdi, -1
1459b80b5	je	0x1459b81d4
1459b80bb	mov	r12, qword ptr [rbp - 0x50]
1459b80bf	call	0x140002200
1459b80c4	mov	ecx, 0x60
1459b80c9	mov	edx, 8
1459b80ce	call	0x1400021c0
1459b80d3	test	rax, rax
1459b80d6	je	0x1459b8213
1459b80dc	mov	r15, rax
1459b80df	mov	rax, qword ptr [rbp - 0x48]
1459b80e3	mov	qword ptr [r15 + 0x10], rax
1459b80e7	movups	xmm0, xmmword ptr [rbp - 0x58]
1459b80eb	movups	xmmword ptr [r15], xmm0
1459b80ef	mov	qword ptr [rbp + 8], 4
1459b80f7	mov	qword ptr [rbp + 0x10], r15
1459b80fb	mov	qword ptr [rbp + 0x18], 1
1459b8103	mov	edi, 1
1459b8108	lea	r12, [rip + 0x2267d1]
1459b810f	nop
1459b8110	cmp	rbx, r13
1459b8113	je	0x1459b8202
1459b8119	cmp	byte ptr [rbx], 0
1459b811c	jne	0x1459b8127
1459b811e	add	rbx, 8
1459b8122	inc	r14
1459b8125	jmp	0x1459b8110
1459b8127	mov	eax, dword ptr [rbx + 4]
1459b812a	mov	qword ptr [rbp - 0x40], r14
1459b812e	mov	dword ptr [rbp + 4], eax
1459b8131	lea	rax, [rbp - 0x40]
1459b8135	mov	qword ptr [rbp - 0x20], rax
1459b8139	lea	rax, [rip + 0x227690]
1459b8140	mov	qword ptr [rbp - 0x18], rax
1459b8144	lea	rax, [rbp + 4]
1459b8148	mov	qword ptr [rbp - 0x10], rax
1459b814c	mov	qword ptr [rbp - 8], r12
1459b8150	lea	rcx, [rbp - 0x38]
1459b8154	lea	rdx, [rip + 0x187eaed]
1459b815b	lea	r8, [rbp - 0x20]
1459b815f	call	0x145bcce30
1459b8164	nop
1459b8165	mov	rax, qword ptr [rbp - 0x38]
1459b8169	mov	qword ptr [rbp + 0x28], rax
1459b816d	cmp	rax, -1
1459b8171	je	0x1459b8202
1459b8177	cmp	rdi, qword ptr [rbp + 8]
1459b817b	jne	0x1459b81ab
1459b817d	mov	rax, qword ptr [rbp - 0x30]
1459b8181	mov	qword ptr [rbp + 0x20], rax
1459b8185	mov	qword ptr [rsp + 0x20], 0x18
1459b818e	mov	r8d, 1
1459b8194	mov	r9d, 8
1459b819a	lea	rcx, [rbp + 8]
1459b819e	mov	rdx, rdi
1459b81a1	call	0x145bfa970
1459b81a6	nop
1459b81a7	mov	r15, qword ptr [rbp + 0x10]
1459b81ab	inc	r14
1459b81ae	add	rbx, 8
1459b81b2	lea	rax, [rdi + rdi*2]
1459b81b6	mov	rcx, qword ptr [rbp - 0x28]
1459b81ba	mov	qword ptr [r15 + rax*8 + 0x10], rcx
1459b81bf	movups	xmm0, xmmword ptr [rbp - 0x38]
1459b81c3	movups	xmmword ptr [r15 + rax*8], xmm0
1459b81c8	inc	rdi
1459b81cb	mov	qword ptr [rbp + 0x18], rdi
1459b81cf	jmp	0x1459b8110
1459b81d4	mov	qword ptr [rsi], 0
1459b81db	mov	qword ptr [rsi + 8], 8
1459b81e3	mov	qword ptr [rsi + 0x10], 0
1459b81eb	mov	rax, rsi
1459b81ee	add	rsp, 0xb8
1459b81f5	pop	rbx
1459b81f6	pop	rdi
1459b81f7	pop	rsi
1459b81f8	pop	r12
1459b81fa	pop	r13
1459b81fc	pop	r14
1459b81fe	pop	r15
1459b8200	pop	rbp
1459b8201	ret
1459b8202	mov	rax, qword ptr [rbp + 0x18]
1459b8206	mov	qword ptr [rsi + 0x10], rax
1459b820a	movups	xmm0, xmmword ptr [rbp + 8]
1459b820e	movups	xmmword ptr [rsi], xmm0
1459b8211	jmp	0x1459b81eb
1459b8213	mov	qword ptr [rbp + 0x20], r12
1459b8217	mov	qword ptr [rbp + 0x28], rdi
1459b821b	mov	ecx, 8
1459b8220	mov	edx, 0x60
1459b8225	call	0x145d992bb
1459b822a	nop
1459b822b	ud2
