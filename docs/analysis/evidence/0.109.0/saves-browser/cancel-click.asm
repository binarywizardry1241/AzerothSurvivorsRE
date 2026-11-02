14002dd08	mov	rax, qword ptr [rbp + 0xe0]
14002dd0f	mov	ecx, dword ptr [rbp + 0x104]
14002dd15	mov	dword ptr [rax], ecx
14002dd17	mov	rax, qword ptr [rbp + 0x58]
14002dd1b	mov	rdx, qword ptr [rax]
14002dd1e	cmp	rdx, -1
14002dd22	mov	r15, qword ptr [rbp + 0xf8]
14002dd29	je	0x14002dd81
14002dd2b	test	rdx, rdx
14002dd2e	mov	qword ptr [rbp + 0xf0], rbx
14002dd35	je	0x14002dd56
14002dd37	mov	rax, qword ptr [rbp + 0x50]
14002dd3b	mov	rcx, qword ptr [rax]
14002dd3e	mov	rbx, r8
14002dd41	mov	r8d, 1
14002dd47	call	0x1400021d0
14002dd4c	mov	r8, rbx
14002dd4f	mov	rbx, qword ptr [rbp + 0xf0]
14002dd56	mov	rax, qword ptr [rbp + 0x48]
14002dd5a	mov	rdx, qword ptr [rax]
14002dd5d	test	rdx, rdx
14002dd60	je	0x14002dd81
14002dd62	mov	rcx, qword ptr [r15 + 0x1a8]
14002dd69	mov	rbx, r8
14002dd6c	mov	r8d, 1
14002dd72	call	0x1400021d0
14002dd77	mov	r8, rbx
14002dd7a	mov	rbx, qword ptr [rbp + 0xf0]
14002dd81	mov	qword ptr [r15 + 0x188], 0xffffffffffffffff
14002dd8c	mov	rax, qword ptr [rbp + 0xe0]
14002dd93	mov	ecx, dword ptr [rbp + 0x104]
14002dd99	mov	dword ptr [rax], ecx
14002dd9b	inc	dword ptr [r15 + 0x1b8]
14002dda2	mov	rdx, qword ptr [rbp + 0xe8]
14002dda9	jmp	0x14002d120
