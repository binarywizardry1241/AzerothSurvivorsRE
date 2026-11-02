14002d667	mov	rax, qword ptr [rbp + 0xc8]
14002d66e	cmp	qword ptr [rax], -1
14002d672	mov	rdx, qword ptr [rbp + 0xe8]
14002d679	je	0x14002d120
14002d67f	mov	rax, qword ptr [r15 + 8]
14002d683	mov	rcx, qword ptr [rbp + 0xf8]
14002d68a	cmp	rax, qword ptr [rcx + 0x138]
14002d691	jae	0x14002d120
14002d697	mov	qword ptr [rbp + 0xf0], rbx
14002d69e	mov	qword ptr [rbp + 0xd0], r8
14002d6a5	mov	rcx, qword ptr [rbp + 0xf8]
14002d6ac	mov	rbx, qword ptr [rcx + 0x130]
14002d6b3	imul	r15, rax, 0x38
14002d6b7	lea	rdx, [rbx + r15]
14002d6bb	lea	rcx, [rbp - 0x48]
14002d6bf	call	0x145bcd2f0
14002d6c4	mov	rdx, qword ptr [rbx + r15 + 0x20]
14002d6c9	mov	r8, qword ptr [rbx + r15 + 0x28]
14002d6ce	lea	rcx, [rbp - 0x18]
14002d6d2	call	0x145bbd290
14002d6d7	nop
14002d6d8	cmp	qword ptr [rbp - 0x18], -1
14002d6dd	je	0x14002ded1
14002d6e3	mov	rax, qword ptr [rbp - 8]
14002d6e7	lea	rcx, [rbp + 0x90]
14002d6ee	mov	qword ptr [rcx + 0x18], rax
14002d6f2	movups	xmm0, xmmword ptr [rbp - 0x18]
14002d6f6	movups	xmmword ptr [rcx + 8], xmm0
14002d6fa	mov	rax, qword ptr [rbp - 0x38]
14002d6fe	mov	qword ptr [rbp + 0x90], rax
14002d705	movups	xmm0, xmmword ptr [rbp - 0x48]
14002d709	movaps	xmmword ptr [rbp], xmm0
14002d70d	movaps	xmm0, xmmword ptr [rbp + 0xa0]
14002d714	movaps	xmmword ptr [rbp + 0x20], xmm0
14002d718	mov	rax, qword ptr [rbp + 0x90]
14002d71f	mov	qword ptr [rbp + 0x10], rax
14002d723	mov	rax, qword ptr [rbp + 0x98]
14002d72a	mov	qword ptr [rbp + 0x18], rax
14002d72e	mov	rbx, qword ptr [rbp + 0xe0]
14002d735	mov	ecx, dword ptr [rbp + 0x104]
14002d73b	mov	dword ptr [rbx], ecx
14002d73d	mov	r15, qword ptr [rbp + 0x58]
14002d741	mov	rcx, r15
14002d744	call	0x140007bc0
14002d749	movdqa	xmm0, xmmword ptr [rbp]
14002d74e	movdqa	xmm1, xmmword ptr [rbp + 0x10]
14002d753	movdqa	xmm2, xmmword ptr [rbp + 0x20]
14002d758	movdqu	xmmword ptr [r15 + 0x20], xmm2
14002d75e	movdqu	xmmword ptr [r15 + 0x10], xmm1
14002d764	movdqu	xmmword ptr [r15], xmm0
14002d769	mov	eax, dword ptr [rbp + 0x104]
14002d76f	mov	dword ptr [rbx], eax
14002d771	mov	rax, qword ptr [rbp + 0xf8]
14002d778	inc	dword ptr [rax + 0x1b8]
14002d77e	jmp	0x14002e151
