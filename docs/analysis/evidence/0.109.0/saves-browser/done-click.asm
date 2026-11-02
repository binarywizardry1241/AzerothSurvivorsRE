14002daa0	mov	qword ptr [rbp + 0xf0], rbx
14002daa7	mov	rax, qword ptr [rbp + 0xe0]
14002daae	mov	ecx, dword ptr [rbp + 0x104]
14002dab4	mov	dword ptr [rax], ecx
14002dab6	mov	r15, qword ptr [rbp + 0xf8]
14002dabd	mov	byte ptr [r15 + 0x1c0], 0
14002dac5	mov	rdx, qword ptr [r15 + 0x90]
14002dacc	cmp	rdx, -1
14002dad0	je	0x14002daef
14002dad2	test	rdx, rdx
14002dad5	je	0x14002daef
14002dad7	mov	rax, qword ptr [rbp + 0x70]
14002dadb	mov	rcx, qword ptr [rax]
14002dade	mov	rbx, r8
14002dae1	mov	r8d, 1
14002dae7	call	0x1400021d0
14002daec	mov	r8, rbx
14002daef	mov	rbx, r8
14002daf2	mov	qword ptr [r15 + 0x90], 0xffffffffffffffff
14002dafd	mov	qword ptr [r15 + 0x28], 0
14002db05	mov	rdx, qword ptr [r15 + 0x188]
14002db0c	cmp	rdx, -1
14002db10	je	0x14002db47
14002db12	test	rdx, rdx
14002db15	je	0x14002db29
14002db17	mov	rax, qword ptr [rbp + 0x50]
14002db1b	mov	rcx, qword ptr [rax]
14002db1e	mov	r8d, 1
14002db24	call	0x1400021d0
14002db29	mov	rax, qword ptr [rbp + 0x48]
14002db2d	mov	rdx, qword ptr [rax]
14002db30	test	rdx, rdx
14002db33	je	0x14002db47
14002db35	mov	rcx, qword ptr [r15 + 0x1a8]
14002db3c	mov	r8d, 1
14002db42	call	0x1400021d0
14002db47	mov	qword ptr [r15 + 0x188], 0xffffffffffffffff
14002db52	mov	qword ptr [r15 + 0x88], 0
14002db5d	mov	rcx, qword ptr [rbp + 0xc8]
14002db64	call	0x140007c10
14002db69	nop
14002db6a	mov	qword ptr [r15 + 0xb0], 0xffffffffffffffff
14002db75	mov	qword ptr [r15], 0
14002db7c	jmp	0x14002de93
