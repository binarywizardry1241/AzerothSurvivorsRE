14002d902	mov	qword ptr [rbp + 0xf0], rbx
14002d909	mov	qword ptr [rbp + 0xd0], r8
14002d910	mov	rax, qword ptr [rbp + 0xf8]
14002d917	cmp	qword ptr [rax + 0x90], -1
14002d91f	je	0x14002d964
14002d921	mov	rax, qword ptr [rbp + 0xf8]
14002d928	mov	r8, qword ptr [rax + 0xa0]
14002d92f	cmp	r8, qword ptr [r15 + 0x10]
14002d933	jne	0x14002d964
14002d935	mov	rdx, qword ptr [r15 + 8]
14002d939	mov	rax, qword ptr [rbp + 0x70]
14002d93d	mov	rcx, qword ptr [rax]
14002d940	call	0x145bfa0e1
14002d945	test	eax, eax
14002d947	jne	0x14002d964
14002d949	mov	rax, qword ptr [rbp + 0xf8]
14002d950	mov	rax, qword ptr [rax + 0xa8]
14002d957	mov	rbx, 0xffffffffffffffff
14002d95e	cmp	rax, qword ptr [r15 + 0x18]
14002d962	je	0x14002d992
14002d964	lea	rcx, [rbp + 0x80]
14002d96b	mov	rdx, r15
14002d96e	call	0x145bcd2f0
14002d973	mov	rax, qword ptr [r15 + 0x18]
14002d977	mov	qword ptr [rbp - 0x58], rax
14002d97b	mov	rbx, qword ptr [rbp + 0x80]
14002d982	lea	rax, [rbp + 0x88]
14002d989	movdqu	xmm0, xmmword ptr [rax]
14002d98d	movdqa	xmmword ptr [rbp], xmm0
14002d992	mov	rax, qword ptr [rbp + 0xe0]
14002d999	mov	ecx, dword ptr [rbp + 0x104]
14002d99f	mov	dword ptr [rax], ecx
14002d9a1	mov	r15, qword ptr [rbp + 0xf8]
14002d9a8	mov	rdx, qword ptr [r15 + 0x90]
14002d9af	cmp	rdx, -1
14002d9b3	je	0x14002d9cc
14002d9b5	test	rdx, rdx
14002d9b8	je	0x14002d9cc
14002d9ba	mov	rax, qword ptr [rbp + 0x70]
14002d9be	mov	rcx, qword ptr [rax]
14002d9c1	mov	r8d, 1
14002d9c7	call	0x1400021d0
14002d9cc	mov	qword ptr [r15 + 0x90], rbx
14002d9d3	movdqa	xmm0, xmmword ptr [rbp]
14002d9d8	mov	rax, qword ptr [rbp + 0x70]
14002d9dc	movdqu	xmmword ptr [rax], xmm0
14002d9e0	mov	rax, qword ptr [rbp - 0x58]
14002d9e4	mov	qword ptr [r15 + 0xa8], rax
