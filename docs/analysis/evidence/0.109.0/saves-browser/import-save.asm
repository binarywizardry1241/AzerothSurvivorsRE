1458a84b0	push	rbp
1458a84b1	push	rsi
1458a84b2	push	rdi
1458a84b3	push	rbx
1458a84b4	sub	rsp, 0x238
1458a84bb	lea	rbp, [rsp + 0x80]
1458a84c3	mov	qword ptr [rbp + 0x1b0], 0xfffffffffffffffe
1458a84ce	mov	rdi, r8
1458a84d1	mov	rbx, rdx
1458a84d4	mov	rsi, rcx
1458a84d7	mov	rcx, rdx
1458a84da	mov	rdx, r8
1458a84dd	call	0x14115ace0
1458a84e2	cmp	rdx, 5
1458a84e6	jb	0x1458a8501
1458a84e8	mov	ecx, dword ptr [rip + 0x162ad54]
1458a84ee	xor	ecx, dword ptr [rax]
1458a84f0	movzx	edx, byte ptr [rip + 0x162ad4f]
1458a84f7	xor	dl, byte ptr [rax + 4]
1458a84fa	movzx	eax, dl
1458a84fd	or	eax, ecx
1458a84ff	je	0x1458a852a
1458a8501	lea	rax, [rip + 0x134348c]
1458a8508	mov	qword ptr [rsi + 8], rax
1458a850c	mov	qword ptr [rsi + 0x10], 0xf
1458a8514	mov	qword ptr [rsi], 0xffffffffffffffff
1458a851b	mov	rax, rsi
1458a851e	add	rsp, 0x238
1458a8525	pop	rbx
1458a8526	pop	rdi
1458a8527	pop	rsi
1458a8528	pop	rbp
1458a8529	ret
1458a852a	lea	rcx, [rbp - 0x58]
1458a852e	mov	rdx, rbx
1458a8531	mov	r8, rdi
1458a8534	call	0x1458f6950
1458a8539	mov	rax, qword ptr [rbp - 0x58]
1458a853d	cmp	rax, -1
1458a8541	je	0x1458a861b
1458a8547	mov	qword ptr [rbp + 0x1a0], rax
1458a854e	mov	rdx, qword ptr [rbp - 0x50]
1458a8552	mov	r8, qword ptr [rbp - 0x48]
1458a8556	lea	rcx, [rbp - 0x58]
1458a855a	mov	qword ptr [rbp + 0x190], rdx
1458a8561	call	0x14589e380
1458a8566	nop
1458a8567	mov	dword ptr [rbp + 0x170], 0
1458a8571	lea	rcx, [rbp + 0x178]
1458a8578	call	0x1458ef570
1458a857d	nop
1458a857e	mov	rax, qword ptr [rbp + 0x178]
1458a8585	cmp	rax, -1
1458a8589	je	0x1458a85d8
1458a858b	mov	qword ptr [rbp + 0x1a8], rax
1458a8592	mov	r8, qword ptr [rbp + 0x180]
1458a8599	mov	r9, qword ptr [rbp + 0x188]
1458a85a0	lea	rcx, [rip + 0x1343408]
1458a85a7	mov	edx, 0x18
1458a85ac	mov	qword ptr [rbp + 0x198], r8
1458a85b3	call	0x1458eef30
1458a85b8	nop
1458a85b9	mov	rdx, qword ptr [rbp + 0x1a8]
1458a85c0	test	rdx, rdx
1458a85c3	je	0x1458a85d8
1458a85c5	mov	r8d, 1
1458a85cb	mov	rcx, qword ptr [rbp + 0x198]
1458a85d2	call	0x1400021d0
1458a85d7	nop
1458a85d8	lea	rcx, [rbp - 0x58]
1458a85dc	call	0x1458a33c0
1458a85e1	nop
1458a85e2	lea	rdx, [rbp - 0x58]
1458a85e6	mov	r8d, 0x1d0
1458a85ec	mov	rcx, rsi
1458a85ef	call	0x145bfa0e7
1458a85f4	mov	rdx, qword ptr [rbp + 0x1a0]
1458a85fb	test	rdx, rdx
1458a85fe	je	0x1458a851b
1458a8604	mov	r8d, 1
1458a860a	mov	rcx, qword ptr [rbp + 0x190]
1458a8611	call	0x1400021d0
1458a8616	jmp	0x1458a851b
1458a861b	lea	rax, [rip + 0x1343381]
1458a8622	mov	qword ptr [rsi + 8], rax
1458a8626	mov	qword ptr [rsi + 0x10], 0xc
1458a862e	jmp	0x1458a8514
