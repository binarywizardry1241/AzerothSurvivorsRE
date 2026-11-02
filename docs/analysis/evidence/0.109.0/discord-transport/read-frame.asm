14006af20	push	rbp
14006af21	push	r14
14006af23	push	rsi
14006af24	push	rdi
14006af25	push	rbx
14006af26	sub	rsp, 0x40
14006af2a	lea	rbp, [rsp + 0x40]
14006af2f	mov	qword ptr [rbp - 8], 0xfffffffffffffffe
14006af37	mov	rdi, rdx
14006af3a	mov	rsi, rcx
14006af3d	mov	qword ptr [rbp - 0x20], 0
14006af45	lea	rdx, [rbp - 0x20]
14006af49	mov	r8d, 8
14006af4f	mov	rcx, rdi
14006af52	call	0x1400b2670
14006af57	test	rax, rax
14006af5a	jne	0x14006af73
14006af5c	mov	r14d, dword ptr [rbp - 0x1c]
14006af60	cmp	r14, 0x100000
14006af67	jbe	0x14006af89
14006af69	movabs	rax, 0x1500000003
14006af73	mov	qword ptr [rsi], rax
14006af76	mov	qword ptr [rsi + 8], 0xffffffffffffffff
14006af7e	add	rsp, 0x40
14006af82	pop	rbx
14006af83	pop	rdi
14006af84	pop	rsi
14006af85	pop	r14
14006af87	pop	rbp
14006af88	ret
14006af89	mov	ebx, dword ptr [rbp - 0x20]
14006af8c	test	r14, r14
14006af8f	je	0x14006afb7
14006af91	call	0x140002200
14006af96	mov	edx, 1
14006af9b	mov	rcx, r14
14006af9e	call	0x1400021f0
14006afa3	test	rax, rax
14006afa6	jne	0x14006afbc
14006afa8	mov	ecx, 1
14006afad	mov	rdx, r14
14006afb0	call	0x145d992bb
14006afb5	ud2
14006afb7	mov	eax, 1
14006afbc	mov	rcx, rdi
14006afbf	mov	qword ptr [rbp - 0x10], rax
14006afc3	mov	rdx, rax
14006afc6	mov	qword ptr [rbp - 0x18], r14
14006afca	mov	r8, r14
14006afcd	call	0x1400b2670
14006afd2	nop
14006afd3	test	rax, rax
14006afd6	mov	rdx, qword ptr [rbp - 0x18]
14006afda	je	0x14006affd
14006afdc	mov	qword ptr [rsi], rax
14006afdf	mov	qword ptr [rsi + 8], 0xffffffffffffffff
14006afe7	test	rdx, rdx
14006afea	je	0x14006af7e
14006afec	mov	r8d, 1
14006aff2	mov	rcx, qword ptr [rbp - 0x10]
14006aff6	call	0x1400021d0
14006affb	jmp	0x14006af7e
14006affd	cmp	ebx, 2
14006b000	jne	0x14006b021
14006b002	movabs	rax, 0x600000003
14006b00c	mov	qword ptr [rsi], rax
14006b00f	mov	qword ptr [rsi + 8], 0xffffffffffffffff
14006b017	test	rdx, rdx
14006b01a	jne	0x14006afec
14006b01c	jmp	0x14006af7e
14006b021	mov	dword ptr [rsi], ebx
14006b023	mov	qword ptr [rsi + 8], rdx
14006b027	mov	rax, qword ptr [rbp - 0x10]
14006b02b	mov	qword ptr [rsi + 0x10], rax
14006b02f	mov	qword ptr [rsi + 0x18], rdx
14006b033	jmp	0x14006af7e
