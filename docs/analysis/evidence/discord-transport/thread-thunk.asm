14004e850	push	rbp
14004e851	push	rsi
14004e852	push	rdi
14004e853	push	rbx
14004e854	sub	rsp, 0xc8
14004e85b	lea	rbp, [rsp + 0x80]
14004e863	mov	qword ptr [rbp + 0x38], 0xfffffffffffffffe
14004e86b	mov	rsi, qword ptr [rcx]
14004e86e	mov	rdi, qword ptr [rcx + 8]
14004e872	movups	xmm0, xmmword ptr [rcx + 0x10]
14004e876	movups	xmm1, xmmword ptr [rcx + 0x20]
14004e87a	movaps	xmmword ptr [rbp - 0x50], xmm1
14004e87e	movaps	xmmword ptr [rbp - 0x60], xmm0
14004e882	mov	qword ptr [rbp - 0x38], rsi
14004e886	mov	qword ptr [rbp - 0x30], rdi
14004e88a	movups	xmm0, xmmword ptr [rcx + 0x10]
14004e88e	mov	qword ptr [rbp + 0x18], rcx
14004e892	movups	xmm1, xmmword ptr [rcx + 0x20]
14004e896	movups	xmmword ptr [rbp - 0x28], xmm0
14004e89a	movups	xmmword ptr [rbp - 0x18], xmm1
14004e89e	mov	byte ptr [rbp + 0x37], 1
14004e8a2	lea	rcx, [rbp - 0x60]
14004e8a6	call	0x14008ee00
14004e8ab	nop
14004e8ac	mov	byte ptr [rbp + 0x37], 0
14004e8b0	mov	rcx, rsi
14004e8b3	mov	rdx, rdi
14004e8b6	call	0x140090800
14004e8bb	nop
14004e8bc	xor	esi, esi
14004e8be	mov	rax, qword ptr [rbp + 0x18]
14004e8c2	mov	rbx, qword ptr [rax + 0x30]
14004e8c6	add	rax, 0x30
14004e8ca	mov	qword ptr [rbp + 0x18], rax
14004e8ce	cmp	qword ptr [rbx + 0x18], 0
14004e8d3	je	0x14004e92b
14004e8d5	mov	rax, qword ptr [rbx + 0x20]
14004e8d9	mov	qword ptr [rbp + 8], rax
14004e8dd	test	rax, rax
14004e8e0	je	0x14004e92b
14004e8e2	mov	qword ptr [rbp + 0x28], rdi
14004e8e6	mov	qword ptr [rbp + 0x20], rsi
14004e8ea	mov	qword ptr [rbp], rbx
14004e8ee	mov	rax, qword ptr [rbx + 0x28]
14004e8f2	mov	qword ptr [rbp + 0x10], rax
14004e8f6	mov	rax, qword ptr [rax]
14004e8f9	test	rax, rax
14004e8fc	je	0x14004e905
14004e8fe	mov	rcx, qword ptr [rbp + 8]
14004e902	call	rax
14004e904	nop
14004e905	mov	rax, qword ptr [rbp + 0x10]
14004e909	mov	rdx, qword ptr [rax + 8]
14004e90d	test	rdx, rdx
14004e910	mov	rsi, qword ptr [rbp + 0x20]
14004e914	mov	rdi, qword ptr [rbp + 0x28]
14004e918	mov	rbx, qword ptr [rbp]
14004e91c	je	0x14004e92b
14004e91e	mov	r8, qword ptr [rax + 0x10]
14004e922	mov	rcx, qword ptr [rbp + 8]
14004e926	call	0x1400021d0
14004e92b	mov	qword ptr [rbx + 0x18], 1
14004e933	mov	qword ptr [rbx + 0x20], rsi
14004e937	mov	qword ptr [rbx + 0x28], rdi
14004e93b	mov	qword ptr [rbp - 8], rbx
14004e93f	lock dec	qword ptr [rbx]
14004e943	jne	0x14004e953
14004e945	mov	byte ptr [rbp + 0x36], 0
14004e949	lea	rcx, [rbp - 8]
14004e94d	call	0x145bb2690
14004e952	nop
14004e953	add	rsp, 0xc8
14004e95a	pop	rbx
14004e95b	pop	rdi
14004e95c	pop	rsi
14004e95d	pop	rbp
14004e95e	ret
14004e95f	mov	rsi, qword ptr [rbp + 0x20]
14004e963	mov	rdi, qword ptr [rbp + 0x28]
14004e967	jmp	0x14004e8be
