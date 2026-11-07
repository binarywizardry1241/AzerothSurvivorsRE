1401900d0	push	r15
1401900d2	push	r14
1401900d4	push	r13
1401900d6	push	r12
1401900d8	push	rsi
1401900d9	push	rdi
1401900da	push	rbp
1401900db	push	rbx
1401900dc	sub	rsp, 0x148
1401900e3	mov	r14, qword ptr [rsp + 0x1e8]
1401900eb	mov	rcx, qword ptr [rsp + 0x1e0]
1401900f3	mov	r11, qword ptr [rsp + 0x1d8]
1401900fb	mov	rsi, qword ptr [rsp + 0x1d0]
140190103	mov	r12, qword ptr [rsp + 0x1c8]
14019010b	mov	r10, qword ptr [rsp + 0x1c0]
140190113	mov	rax, qword ptr [rsp + 0x1b8]
14019011b	mov	rbx, qword ptr [rsp + 0x1b0]
140190123	mov	r13, qword ptr [rdx]
140190126	mov	rdi, qword ptr [rdx + 0x10]
14019012a	mov	r15d, dword ptr [rdx + 0x1c]
14019012e	mov	rbp, qword ptr [r12]
140190132	mov	rdx, qword ptr [r12 + 0x10]
140190137	mov	qword ptr [rsp + 0x30], rdx
14019013c	mov	r12d, dword ptr [r12 + 0x1c]
140190141	mov	rdx, qword ptr [rsi]
140190144	mov	rsi, qword ptr [r11]
140190147	cmp	byte ptr [rbp], 0
14019014b	je	0x140190168
14019014d	cmp	byte ptr [rdx + 0xd], 0
140190151	jne	0x140190168
140190153	cmp	byte ptr [rsi + 0xe8], 0
14019015a	jne	0x140190168
14019015c	mov	r11, qword ptr [rsp + 0x30]
140190161	mov	dword ptr [r11], r12d
140190164	mov	byte ptr [rbp], 0
140190168	mov	qword ptr [rsp + 0x48], rdx
14019016d	mov	qword ptr [rsp + 0x28], rsi
140190172	mov	dword ptr [rsp + 0x20], r12d
140190177	mov	qword ptr [rsp + 0x38], rbp
14019017c	mov	rsi, qword ptr [r8]
14019017f	mov	r12, qword ptr [r8 + 0x10]
140190183	mov	ebp, dword ptr [r8 + 0x1c]
140190187	mov	r11, qword ptr [r9]
14019018a	mov	rdx, qword ptr [r9 + 0x10]
14019018e	mov	qword ptr [rsp + 0x58], rdx
140190193	mov	r9d, dword ptr [r9 + 0x1c]
140190197	mov	r8, qword ptr [rbx]
14019019a	mov	rdx, qword ptr [rbx + 0x10]
14019019e	mov	qword ptr [rsp + 0x40], rdx
1401901a3	mov	edx, dword ptr [rbx + 0x1c]
1401901a6	mov	dword ptr [rsp + 0x24], edx
1401901aa	mov	rdx, qword ptr [rax]
1401901ad	mov	rbx, qword ptr [r10]
1401901b0	mov	rax, qword ptr [r10 + 0x10]
1401901b4	mov	qword ptr [rsp + 0x50], rax
1401901b9	mov	r10d, dword ptr [r10 + 0x1c]
1401901bd	mov	rcx, qword ptr [rcx]
1401901c0	mov	rax, qword ptr [r14]
1401901c3	mov	dword ptr [rdi], r15d
1401901c6	cmp	byte ptr [r13], 0
1401901cb	mov	byte ptr [r13], 0
1401901d0	je	0x14019021f
1401901d2	cmp	byte ptr [rax], 1
1401901d5	jne	0x1401901e2
1401901d7	mov	rax, qword ptr [rsp + 0x48]
1401901dc	cmp	byte ptr [rax + 0xd], 1
1401901e0	jne	0x14019021f
1401901e2	cmp	qword ptr [rsi + 0x90], -1
1401901ea	je	0x140190233
1401901ec	mov	dword ptr [r12], ebp
1401901f0	mov	rdx, qword ptr [rsi + 0x90]
1401901f7	cmp	rdx, -1
1401901fb	je	0x140190214
1401901fd	test	rdx, rdx
140190200	je	0x140190214
140190202	mov	rcx, qword ptr [rsi + 0x98]
140190209	mov	r8d, 1
14019020f	call	0x1400021d0
140190214	mov	qword ptr [rsi + 0x90], 0xffffffffffffffff
14019021f	add	rsp, 0x148
140190226	pop	rbx
140190227	pop	rbp
140190228	pop	rdi
140190229	pop	rsi
14019022a	pop	r12
14019022c	pop	r13
14019022e	pop	r14
140190230	pop	r15
140190232	ret
140190233	cmp	byte ptr [rsi + 0x1c0], 0
14019023a	je	0x14019025b
14019023c	mov	dword ptr [r12], ebp
140190240	mov	rcx, rsi
140190243	add	rsp, 0x148
14019024a	pop	rbx
14019024b	pop	rbp
14019024c	pop	rdi
14019024d	pop	rsi
14019024e	pop	r12
140190250	pop	r13
140190252	pop	r14
140190254	pop	r15
140190256	jmp	0x14000ece0
14019025b	cmp	byte ptr [r11], 0
14019025f	je	0x14019026f
140190261	mov	rax, qword ptr [rsp + 0x58]
140190266	mov	dword ptr [rax], r9d
140190269	mov	byte ptr [r11], 0
14019026d	jmp	0x14019021f
14019026f	mov	rax, r8
140190272	cmp	byte ptr [r8 + 0x77], 0xfe
140190277	jne	0x1401902ac
140190279	cmp	byte ptr [rax + 0x72], 0
14019027d	je	0x1401902c0
14019027f	mov	rcx, qword ptr [rsp + 0x40]
140190284	mov	r8d, dword ptr [rsp + 0x24]
140190289	mov	dword ptr [rcx], r8d
14019028c	mov	rcx, rax
14019028f	mov	r8, rdx
140190292	mov	dl, 0xff
140190294	add	rsp, 0x148
14019029b	pop	rbx
14019029c	pop	rbp
14019029d	pop	rdi
14019029e	pop	rsi
14019029f	pop	r12
1401902a1	pop	r13
1401902a3	pop	r14
1401902a5	pop	r15
1401902a7	jmp	0x14013ead0
1401902ac	mov	rcx, qword ptr [rsp + 0x40]
1401902b1	mov	edx, dword ptr [rsp + 0x24]
1401902b5	mov	dword ptr [rcx], edx
1401902b7	mov	byte ptr [rax + 0x77], 0xfe
1401902bb	jmp	0x14019021f
1401902c0	cmp	byte ptr [rbx], 0
1401902c3	je	0x1401902d5
1401902c5	mov	rax, qword ptr [rsp + 0x50]
1401902ca	mov	dword ptr [rax], r10d
1401902cd	mov	byte ptr [rbx], 0
1401902d0	jmp	0x14019021f
1401902d5	mov	r8, qword ptr [rsp + 0x38]
1401902da	cmp	byte ptr [r8], 0
1401902de	je	0x1401902f4
1401902e0	mov	rax, qword ptr [rsp + 0x30]
1401902e5	mov	ecx, dword ptr [rsp + 0x20]
1401902e9	mov	dword ptr [rax], ecx
1401902eb	mov	byte ptr [r8], 0
1401902ef	jmp	0x14019021f
1401902f4	mov	rax, qword ptr [rsp + 0x48]
1401902f9	cmp	byte ptr [rax + 0xd], 0
1401902fd	mov	r9d, dword ptr [rsp + 0x20]
140190302	je	0x140190319
140190304	movzx	eax, byte ptr [rax]
140190307	mov	rcx, qword ptr [rsp + 0x30]
14019030c	mov	dword ptr [rcx], r9d
14019030f	xor	al, 1
140190311	mov	byte ptr [r8], al
140190314	jmp	0x14019021f
140190319	mov	rax, qword ptr [rsp + 0x28]
14019031e	cmp	byte ptr [rax + 0xea], 0
140190325	je	0x140190343
140190327	mov	byte ptr [rsp + 0x64], 0
14019032c	mov	dword ptr [rsp + 0x60], 7
140190334	lea	rdx, [rsp + 0x60]
140190339	call	0x1401838a0
14019033e	jmp	0x14019021f
140190343	cmp	byte ptr [rax + 0xe8], 0
14019034a	je	0x14019021f
140190350	mov	rax, qword ptr [rsp + 0x28]
140190355	cmp	byte ptr [rax + 0x80], 0xff
14019035c	jne	0x14019021f
140190362	mov	rax, qword ptr [rsp + 0x28]
140190367	cmp	byte ptr [rax + 0xa0], 0xff
14019036e	jne	0x14019021f
140190374	mov	rax, qword ptr [rsp + 0x28]
140190379	cmp	byte ptr [rax + 0xe9], 0
140190380	je	0x140190389
140190382	mov	byte ptr [rsp + 0x64], 1
140190387	jmp	0x14019032c
140190389	mov	rax, qword ptr [rsp + 0x30]
14019038e	mov	ecx, dword ptr [rsp + 0x20]
140190392	mov	dword ptr [rax], ecx
140190394	mov	rax, qword ptr [rsp + 0x38]
140190399	mov	byte ptr [rax], 1
14019039c	jmp	0x14019021f
