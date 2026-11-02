1458f0600	push	rbp
1458f0601	push	r14
1458f0603	push	rsi
1458f0604	push	rdi
1458f0605	push	rbx
1458f0606	sub	rsp, 0x510
1458f060d	lea	rbp, [rsp + 0x80]
1458f0615	mov	qword ptr [rbp + 0x488], 0xfffffffffffffffe
1458f0620	mov	rsi, rcx
1458f0623	mov	r14, qword ptr [r8]
1458f0626	mov	rbx, qword ptr [r8 + 8]
1458f062a	test	r14, r14
1458f062d	je	0x1458f0771
1458f0633	mov	rdi, r8
1458f0636	add	rdi, 0x10
1458f063a	mov	qword ptr [rbp - 0x50], rbx
1458f063e	lea	rcx, [rbp - 0x48]
1458f0642	mov	r8d, 0x248
1458f0648	mov	rdx, rdi
1458f064b	call	0x145bfa0e7
1458f0650	mov	qword ptr [rbp - 0x58], 0
1458f0658	mov	qword ptr [rbp + 0x208], rbx
1458f065f	lea	rcx, [rbp + 0x210]
1458f0666	mov	r8d, 0x248
1458f066c	mov	rdx, rdi
1458f066f	call	0x145bfa0e7
1458f0674	mov	qword ptr [rbp + 0x480], r14
1458f067b	mov	qword ptr [rbp + 0x200], r14
1458f0682	lea	rcx, [rbp + 0x458]
1458f0689	lea	rdx, [rbp + 0x200]
1458f0690	call	0x145bae010
1458f0695	nop
1458f0696	mov	rax, qword ptr [rbp + 0x480]
1458f069d	lock dec	qword ptr [rax]
1458f06a1	jne	0x1458f06b0
1458f06a3	lea	rcx, [rbp + 0x200]
1458f06aa	call	0x144ae0f90
1458f06af	nop
1458f06b0	mov	rax, qword ptr [rbp + 0x458]
1458f06b7	mov	qword ptr [rbp + 0x480], rax
1458f06be	mov	rcx, qword ptr [rbp + 0x460]
1458f06c5	mov	rdx, qword ptr [rbp + 0x468]
1458f06cc	mov	qword ptr [rbp + 0x478], rcx
1458f06d3	call	0x145ba70a0
1458f06d8	nop
1458f06d9	test	rax, rax
1458f06dc	je	0x1458f0732
1458f06de	mov	r8, rdx
1458f06e1	lea	rcx, [rbp + 0x200]
1458f06e8	mov	rdx, rax
1458f06eb	call	0x145bd5650
1458f06f0	nop
1458f06f1	cmp	dword ptr [rbp + 0x200], 1
1458f06f8	je	0x1458f0732
1458f06fa	mov	rax, qword ptr [rbp + 0x210]
1458f0701	cmp	rax, 7
1458f0705	jb	0x1458f0732
1458f0707	mov	rcx, qword ptr [rbp + 0x208]
1458f070e	mov	edx, 0x6b636142
1458f0713	xor	edx, dword ptr [rcx]
1458f0715	mov	r8d, 0x2070756b
1458f071b	xor	r8d, dword ptr [rcx + 3]
1458f071f	or	r8d, edx
1458f0722	jne	0x1458f0732
1458f0724	cmp	dword ptr [rcx + rax - 4], 0x7661732e
1458f072c	je	0x1458f07b8
1458f0732	mov	qword ptr [rsi], 0xffffffffffffffff
1458f0739	mov	rdx, qword ptr [rbp + 0x480]
1458f0740	test	rdx, rdx
1458f0743	je	0x1458f0757
1458f0745	mov	r8d, 1
1458f074b	mov	rcx, qword ptr [rbp + 0x478]
1458f0752	call	0x1400021d0
1458f0757	mov	rax, qword ptr [rbp - 0x58]
1458f075b	test	rax, rax
1458f075e	je	0x1458f07a7
1458f0760	lock dec	qword ptr [rax]
1458f0764	jne	0x1458f07a7
1458f0766	lea	rcx, [rbp - 0x58]
1458f076a	call	0x144ae0f90
1458f076f	jmp	0x1458f07a7
1458f0771	mov	eax, ebx
1458f0773	and	eax, 3
1458f0776	lea	ecx, [rax - 2]
1458f0779	cmp	ecx, 2
1458f077c	jb	0x1458f07a0
1458f077e	test	rax, rax
1458f0781	je	0x1458f07a0
1458f0783	dec	rbx
1458f0786	lea	rcx, [rbp + 0x208]
1458f078d	mov	qword ptr [rbp + 0x208], rbx
1458f0794	mov	byte ptr [rbp + 0x200], 3
1458f079b	call	0x145bdf7c0
1458f07a0	mov	qword ptr [rsi], 0xffffffffffffffff
1458f07a7	mov	rax, rsi
1458f07aa	add	rsp, 0x510
1458f07b1	pop	rbx
1458f07b2	pop	rdi
1458f07b3	pop	rsi
1458f07b4	pop	r14
1458f07b6	pop	rbp
1458f07b7	ret
1458f07b8	movups	xmm0, xmmword ptr [rbp + 0x458]
1458f07bf	movups	xmm1, xmmword ptr [rbp + 0x468]
1458f07c6	movups	xmmword ptr [rsi + 0x10], xmm1
1458f07ca	movups	xmmword ptr [rsi], xmm0
1458f07cd	mov	rax, qword ptr [rbp - 0x58]
1458f07d1	test	rax, rax
1458f07d4	jne	0x1458f0760
1458f07d6	jmp	0x1458f07a7
