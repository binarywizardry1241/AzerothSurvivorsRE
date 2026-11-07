14002d841	mov	rax, qword ptr [rbp + 0xe0]
14002d848	mov	ecx, dword ptr [rbp + 0x104]
14002d84e	mov	dword ptr [rax], ecx
14002d850	mov	rcx, qword ptr [rbp + 0x58]
14002d854	mov	rax, qword ptr [rcx]
14002d857	mov	qword ptr [rcx], 0xffffffffffffffff
14002d85e	cmp	rax, -1
14002d862	mov	rdx, qword ptr [rbp + 0xe8]
14002d869	je	0x14002d120
14002d86f	mov	qword ptr [rbp + 0xf0], rbx
14002d876	mov	rbx, r8
14002d879	mov	rcx, qword ptr [rbp + 0x50]
14002d87d	movups	xmm0, xmmword ptr [rcx]
14002d880	lea	rdx, [rbp + 0x90]
14002d887	movups	xmmword ptr [rdx], xmm0
14002d88a	mov	r8, qword ptr [rbp + 0x48]
14002d88e	mov	rcx, qword ptr [r8 + 0x10]
14002d892	mov	qword ptr [rdx + 0x20], rcx
14002d896	movdqu	xmm0, xmmword ptr [r8]
14002d89b	movdqu	xmmword ptr [rdx + 0x10], xmm0
14002d8a0	mov	rcx, qword ptr [rbp + 0xe0]
14002d8a7	mov	edx, dword ptr [rbp + 0x104]
14002d8ad	mov	dword ptr [rcx], edx
14002d8af	mov	qword ptr [rbp + 0x88], rax
14002d8b6	movabs	rax, 0x8000000000000008
14002d8c0	mov	qword ptr [rbp + 0x80], rax
14002d8c7	mov	rax, qword ptr [rbp + 0xf8]
14002d8ce	mov	r15, qword ptr [rax + 0x40]
14002d8d2	cmp	r15, qword ptr [rax + 0x30]
14002d8d6	jne	0x14002de48
14002d8dc	mov	rcx, qword ptr [rbp + 0x60]
14002d8e0	call	0x145bfada0
14002d8e5	nop
14002d8e6	jmp	0x14002de48
