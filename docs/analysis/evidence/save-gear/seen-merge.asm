1459b5800	push	r15
1459b5802	push	r14
1459b5804	push	r13
1459b5806	push	r12
1459b5808	push	rsi
1459b5809	push	rdi
1459b580a	push	rbx
1459b580b	sub	rsp, 0x20
1459b580f	mov	rbx, qword ptr [rcx + 0x10]
1459b5813	cmp	rbx, 2
1459b5817	jb	0x1459b5926
1459b581d	mov	rsi, rcx
1459b5820	mov	r14, qword ptr [rcx + 8]
1459b5824	lea	r15, [r14 + 0x40]
1459b5828	mov	r12d, 1
1459b582e	sub	r12, rbx
1459b5831	mov	r13d, 2
1459b5837	jmp	0x1459b5858
1459b5839	nop	dword ptr [rax]
1459b5840	add	r15, 0x20
1459b5844	lea	rax, [r12 + r13]
1459b5848	inc	rax
1459b584b	inc	r13
1459b584e	cmp	rax, 2
1459b5852	je	0x1459b5926
1459b5858	mov	r8, qword ptr [r15 - 0x30]
1459b585c	cmp	r8, qword ptr [r15 - 0x10]
1459b5860	jne	0x1459b5840
1459b5862	mov	rcx, qword ptr [r15 - 0x38]
1459b5866	mov	rdi, qword ptr [r15 - 0x18]
1459b586a	mov	rdx, rdi
1459b586d	call	0x145bfa0e1
1459b5872	test	eax, eax
1459b5874	jne	0x1459b5840
1459b5876	mov	eax, dword ptr [r15 - 0x28]
1459b587a	mov	ecx, dword ptr [r15 - 8]
1459b587e	cmp	cl, al
1459b5880	cmova	eax, ecx
1459b5883	mov	byte ptr [r15 - 0x28], al
1459b5887	mov	rdx, qword ptr [r15 - 0x20]
1459b588b	test	rdx, rdx
1459b588e	je	0x1459b589e
1459b5890	mov	r8d, 1
1459b5896	mov	rcx, rdi
1459b5899	call	0x1400021d0
1459b589e	lea	r12, [r13 - 1]
1459b58a2	cmp	rbx, r13
1459b58a5	jbe	0x1459b5922
1459b58a7	sub	rbx, r13
1459b58aa	jmp	0x1459b58cf
1459b58ac	nop	dword ptr [rax]
1459b58b0	movups	xmm0, xmmword ptr [r15]
1459b58b4	movups	xmm1, xmmword ptr [r15 + 0x10]
1459b58b9	movups	xmmword ptr [r13 + 0x10], xmm1
1459b58be	movups	xmmword ptr [r13], xmm0
1459b58c3	inc	r12
1459b58c6	add	r15, 0x20
1459b58ca	dec	rbx
1459b58cd	je	0x1459b5922
1459b58cf	mov	rax, r12
1459b58d2	shl	rax, 5
1459b58d6	lea	r13, [r14 + rax]
1459b58da	mov	r8, qword ptr [r14 + rax - 0x10]
1459b58df	cmp	r8, qword ptr [r15 + 0x10]
1459b58e3	jne	0x1459b58b0
1459b58e5	mov	rdi, qword ptr [r15 + 8]
1459b58e9	mov	rcx, qword ptr [r13 - 0x18]
1459b58ed	mov	rdx, rdi
1459b58f0	call	0x145bfa0e1
1459b58f5	test	eax, eax
1459b58f7	jne	0x1459b58b0
1459b58f9	mov	eax, dword ptr [r13 - 8]
1459b58fd	mov	ecx, dword ptr [r15 + 0x18]
1459b5901	cmp	cl, al
1459b5903	cmova	eax, ecx
1459b5906	mov	byte ptr [r13 - 8], al
1459b590a	mov	rdx, qword ptr [r15]
1459b590d	test	rdx, rdx
1459b5910	je	0x1459b58c6
1459b5912	mov	r8d, 1
1459b5918	mov	rcx, rdi
1459b591b	call	0x1400021d0
1459b5920	jmp	0x1459b58c6
1459b5922	mov	qword ptr [rsi + 0x10], r12
1459b5926	add	rsp, 0x20
1459b592a	pop	rbx
1459b592b	pop	rdi
1459b592c	pop	rsi
1459b592d	pop	r12
1459b592f	pop	r13
1459b5931	pop	r14
1459b5933	pop	r15
1459b5935	ret
