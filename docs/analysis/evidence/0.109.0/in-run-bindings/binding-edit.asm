14001bec0	push	rbp
14001bec1	push	r15
14001bec3	push	r14
14001bec5	push	rsi
14001bec6	push	rdi
14001bec7	push	rbx
14001bec8	sub	rsp, 0xe8
14001becf	lea	rbp, [rsp + 0x80]
14001bed7	mov	qword ptr [rbp + 0x60], 0xfffffffffffffffe
14001bedf	mov	rdi, r9
14001bee2	mov	rsi, rcx
14001bee5	mov	qword ptr [rbp + 0x28], rdx
14001bee9	mov	qword ptr [rbp + 0x30], r8
14001beed	mov	rax, qword ptr [rcx + 8]
14001bef1	mov	rcx, qword ptr [rcx + 0x10]
14001bef5	lea	rcx, [rcx + rcx*2]
14001bef9	shl	rcx, 4
14001befd	add	rcx, rax
14001bf00	mov	qword ptr [rbp - 8], rax
14001bf04	mov	qword ptr [rbp], rcx
14001bf08	lea	rax, [rbp + 0x28]
14001bf0c	mov	qword ptr [rbp + 8], rax
14001bf10	mov	byte ptr [rbp + 0x5d], 1
14001bf14	lea	rcx, [rbp + 0x40]
14001bf18	lea	rdx, [rbp - 8]
14001bf1c	call	0x1400a17e0
14001bf21	nop
14001bf22	mov	rdx, qword ptr [rbp + 0xc0]
14001bf29	mov	rcx, qword ptr [rdx]
14001bf2c	cmp	rcx, -1
14001bf30	sete	al
14001bf33	je	0x14001bf95
14001bf35	mov	qword ptr [rbp + 0x38], rcx
14001bf39	mov	byte ptr [rbp + 0x5e], al
14001bf3c	mov	byte ptr [rbp + 0x5c], 1
14001bf40	lea	rcx, [rbp + 0x40]
14001bf44	call	0x140089f50
14001bf49	nop
14001bf4a	mov	rbx, qword ptr [rbp + 0x50]
14001bf4e	cmp	rdi, rbx
14001bf51	jae	0x14001c001
14001bf57	mov	rax, qword ptr [rbp + 0x48]
14001bf5b	lea	rcx, [rdi + rdi*2]
14001bf5f	lea	rdi, [rax + rcx*8]
14001bf63	mov	rdx, qword ptr [rax + rcx*8]
14001bf67	test	rdx, rdx
14001bf6a	je	0x14001bf7b
14001bf6c	mov	rcx, qword ptr [rdi + 8]
14001bf70	mov	r8d, 1
14001bf76	call	0x1400021d0
14001bf7b	mov	rcx, qword ptr [rbp + 0xc0]
14001bf82	mov	rax, qword ptr [rcx + 0x10]
14001bf86	mov	qword ptr [rdi + 0x10], rax
14001bf8a	movups	xmm0, xmmword ptr [rcx]
14001bf8d	movups	xmmword ptr [rdi], xmm0
14001bf90	jmp	0x14001c047
14001bf95	mov	rbx, qword ptr [rbp + 0x50]
14001bf99	cmp	rdi, rbx
14001bf9c	jae	0x14001c101
14001bfa2	mov	byte ptr [rbp + 0x5e], al
14001bfa5	mov	rax, qword ptr [rbp + 0x48]
14001bfa9	lea	rdx, [rdi + rdi*2]
14001bfad	lea	rcx, [rax + rdx*8]
14001bfb1	mov	r14, qword ptr [rax + rdx*8]
14001bfb5	mov	r15, qword ptr [rax + rdx*8 + 8]
14001bfba	lea	rdx, [rax + rdx*8]
14001bfbe	add	rdx, 0x18
14001bfc2	mov	rax, rdi
14001bfc5	not	rax
14001bfc8	add	rax, rbx
14001bfcb	shl	rax, 3
14001bfcf	lea	r8, [rax + rax*2]
14001bfd3	call	0x145bfa0ed
14001bfd8	dec	rbx
14001bfdb	mov	qword ptr [rbp + 0x50], rbx
14001bfdf	test	r14, r14
14001bfe2	je	0x14001c047
14001bfe4	cmp	r14, -1
14001bfe8	je	0x14001c177
14001bfee	mov	r8d, 1
14001bff4	mov	rcx, r15
14001bff7	mov	rdx, r14
14001bffa	call	0x1400021d0
14001bfff	jmp	0x14001c047
14001c001	cmp	rbx, qword ptr [rbp + 0x40]
14001c005	jne	0x14001c020
14001c007	mov	rax, qword ptr [rbp + 0xc0]
14001c00e	mov	rax, qword ptr [rax + 8]
14001c012	mov	qword ptr [rbp - 0x10], rax
14001c016	lea	rcx, [rbp + 0x40]
14001c01a	call	0x145c2e8d0
14001c01f	nop
14001c020	mov	rax, qword ptr [rbp + 0x48]
14001c024	lea	rcx, [rbx + rbx*2]
14001c028	mov	r8, qword ptr [rbp + 0xc0]
14001c02f	mov	rdx, qword ptr [r8 + 0x10]
14001c033	mov	qword ptr [rax + rcx*8 + 0x10], rdx
14001c038	movups	xmm0, xmmword ptr [r8]
14001c03c	movups	xmmword ptr [rax + rcx*8], xmm0
14001c040	inc	rbx
14001c043	mov	qword ptr [rbp + 0x50], rbx
14001c047	mov	byte ptr [rbp + 0x5f], 1
14001c04b	lea	rdx, [rbp + 0x28]
14001c04f	lea	r8, [rbp + 0x40]
14001c053	mov	rcx, rsi
14001c056	call	0x14008a060
14001c05b	nop
14001c05c	lea	rdi, [rsi + 0x10]
14001c060	mov	rax, qword ptr [rbp + 0x40]
14001c064	mov	rcx, qword ptr [rbp + 0x48]
14001c068	mov	r8, qword ptr [rbp + 0x50]
14001c06c	lea	rdx, [r8 + r8*2]
14001c070	lea	rdx, [rcx + rdx*8]
14001c074	mov	rbx, qword ptr [rbp + 0x28]
14001c078	mov	r14, qword ptr [rbp + 0x30]
14001c07c	mov	qword ptr [rbp - 8], rcx
14001c080	mov	qword ptr [rbp], rcx
14001c084	mov	qword ptr [rbp + 8], rax
14001c088	mov	qword ptr [rbp + 0x10], rdx
14001c08c	mov	qword ptr [rbp + 0x18], rbx
14001c090	mov	qword ptr [rbp + 0x20], r14
14001c094	mov	rax, qword ptr [rsi]
14001c097	mov	rdx, qword ptr [rsi + 0x10]
14001c09b	sub	rax, rdx
14001c09e	cmp	r8, rax
14001c0a1	ja	0x14001c153
14001c0a7	mov	rax, qword ptr [rsi + 8]
14001c0ab	mov	rcx, qword ptr [rbp - 8]
14001c0af	mov	r8, qword ptr [rbp]
14001c0b3	mov	r9, qword ptr [rbp + 8]
14001c0b7	mov	qword ptr [rbp - 0x20], r9
14001c0bb	mov	r9, qword ptr [rbp + 0x10]
14001c0bf	mov	qword ptr [rbp - 0x18], r9
14001c0c3	mov	qword ptr [rbp - 0x30], rcx
14001c0c7	mov	qword ptr [rbp - 0x28], r8
14001c0cb	mov	qword ptr [rbp - 0x58], rdi
14001c0cf	mov	qword ptr [rbp - 0x50], rdx
14001c0d3	mov	qword ptr [rbp - 0x48], rax
14001c0d7	mov	qword ptr [rbp - 0x40], rbx
14001c0db	mov	qword ptr [rbp - 0x38], r14
14001c0df	mov	byte ptr [rbp + 0x5b], 0
14001c0e3	lea	rcx, [rbp - 0x30]
14001c0e7	lea	rdx, [rbp - 0x58]
14001c0eb	call	0x140049d10
14001c0f0	nop
14001c0f1	add	rsp, 0xe8
14001c0f8	pop	rbx
14001c0f9	pop	rdi
14001c0fa	pop	rsi
14001c0fb	pop	r14
14001c0fd	pop	r15
14001c0ff	pop	rbp
14001c100	ret
14001c101	mov	rsi, qword ptr [rbp + 0x48]
14001c105	test	rbx, rbx
14001c108	je	0x14001c132
14001c10a	lea	rdi, [rsi + 8]
14001c10e	jmp	0x14001c119
14001c110	add	rdi, 0x18
14001c114	dec	rbx
14001c117	je	0x14001c132
14001c119	mov	rdx, qword ptr [rdi - 8]
14001c11d	test	rdx, rdx
14001c120	je	0x14001c110
14001c122	mov	rcx, qword ptr [rdi]
14001c125	mov	r8d, 1
14001c12b	call	0x1400021d0
14001c130	jmp	0x14001c110
14001c132	mov	rax, qword ptr [rbp + 0x40]
14001c136	test	rax, rax
14001c139	je	0x14001c0f1
14001c13b	shl	rax, 3
14001c13f	lea	rdx, [rax + rax*2]
14001c143	mov	r8d, 8
14001c149	mov	rcx, rsi
14001c14c	call	0x1400021d0
14001c151	jmp	0x14001c0f1
14001c153	mov	byte ptr [rbp + 0x5b], 1
14001c157	mov	qword ptr [rsp + 0x20], 0x30
14001c160	mov	r9d, 8
14001c166	mov	rcx, rsi
14001c169	call	0x145bfa970
14001c16e	nop
14001c16f	mov	rdx, qword ptr [rdi]
14001c172	jmp	0x14001c0a7
14001c177	mov	byte ptr [rbp + 0x5f], 1
14001c17b	lea	r8, [rip + 0x5d8944e]
14001c182	mov	rcx, rdi
14001c185	mov	rdx, rbx
14001c188	call	0x145d9938b
14001c18d	nop
14001c18e	ud2
