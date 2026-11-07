14008e180	4157	push	r15
14008e182	4156	push	r14
14008e184	4155	push	r13
14008e186	4154	push	r12
14008e188	56	push	rsi
14008e189	57	push	rdi
14008e18a	55	push	rbp
14008e18b	53	push	rbx
14008e18c	4881ec48010000	sub	rsp, 0x148
14008e193	4c8bb424e8010000	mov	r14, qword ptr [rsp + 0x1e8]
14008e19b	488b8c24e0010000	mov	rcx, qword ptr [rsp + 0x1e0]
14008e1a3	4c8b9c24d8010000	mov	r11, qword ptr [rsp + 0x1d8]
14008e1ab	488bb424d0010000	mov	rsi, qword ptr [rsp + 0x1d0]
14008e1b3	4c8ba424c8010000	mov	r12, qword ptr [rsp + 0x1c8]
14008e1bb	4c8b9424c0010000	mov	r10, qword ptr [rsp + 0x1c0]
14008e1c3	488b8424b8010000	mov	rax, qword ptr [rsp + 0x1b8]
14008e1cb	488b9c24b0010000	mov	rbx, qword ptr [rsp + 0x1b0]
14008e1d3	4c8b2a	mov	r13, qword ptr [rdx]
14008e1d6	488b7a10	mov	rdi, qword ptr [rdx + 0x10]
14008e1da	448b7a1c	mov	r15d, dword ptr [rdx + 0x1c]
14008e1de	498b2c24	mov	rbp, qword ptr [r12]
14008e1e2	498b542410	mov	rdx, qword ptr [r12 + 0x10]
14008e1e7	4889542430	mov	qword ptr [rsp + 0x30], rdx
14008e1ec	458b64241c	mov	r12d, dword ptr [r12 + 0x1c]
14008e1f1	488b16	mov	rdx, qword ptr [rsi]
14008e1f4	498b33	mov	rsi, qword ptr [r11]
14008e1f7	807d0000	cmp	byte ptr [rbp], 0
14008e1fb	741b	je	0x14008e218
14008e1fd	807a0d00	cmp	byte ptr [rdx + 0xd], 0
14008e201	7515	jne	0x14008e218
14008e203	80bee800000000	cmp	byte ptr [rsi + 0xe8], 0
14008e20a	750c	jne	0x14008e218
14008e20c	4c8b5c2430	mov	r11, qword ptr [rsp + 0x30]
14008e211	458923	mov	dword ptr [r11], r12d
14008e214	c6450000	mov	byte ptr [rbp], 0
14008e218	4889542448	mov	qword ptr [rsp + 0x48], rdx
14008e21d	4889742428	mov	qword ptr [rsp + 0x28], rsi
14008e222	4489642420	mov	dword ptr [rsp + 0x20], r12d
14008e227	48896c2438	mov	qword ptr [rsp + 0x38], rbp
14008e22c	498b30	mov	rsi, qword ptr [r8]
14008e22f	4d8b6010	mov	r12, qword ptr [r8 + 0x10]
14008e233	418b681c	mov	ebp, dword ptr [r8 + 0x1c]
14008e237	4d8b19	mov	r11, qword ptr [r9]
14008e23a	498b5110	mov	rdx, qword ptr [r9 + 0x10]
14008e23e	4889542458	mov	qword ptr [rsp + 0x58], rdx
14008e243	458b491c	mov	r9d, dword ptr [r9 + 0x1c]
14008e247	4c8b03	mov	r8, qword ptr [rbx]
14008e24a	488b5310	mov	rdx, qword ptr [rbx + 0x10]
14008e24e	4889542440	mov	qword ptr [rsp + 0x40], rdx
14008e253	8b531c	mov	edx, dword ptr [rbx + 0x1c]
14008e256	89542424	mov	dword ptr [rsp + 0x24], edx
14008e25a	488b10	mov	rdx, qword ptr [rax]
14008e25d	498b1a	mov	rbx, qword ptr [r10]
14008e260	498b4210	mov	rax, qword ptr [r10 + 0x10]
14008e264	4889442450	mov	qword ptr [rsp + 0x50], rax
14008e269	458b521c	mov	r10d, dword ptr [r10 + 0x1c]
14008e26d	488b09	mov	rcx, qword ptr [rcx]
14008e270	498b06	mov	rax, qword ptr [r14]
14008e273	44893f	mov	dword ptr [rdi], r15d
14008e276	41807d0000	cmp	byte ptr [r13], 0
14008e27b	41c6450000	mov	byte ptr [r13], 0
14008e280	744d	je	0x14008e2cf
14008e282	803801	cmp	byte ptr [rax], 1
14008e285	750b	jne	0x14008e292
14008e287	488b442448	mov	rax, qword ptr [rsp + 0x48]
14008e28c	80780d01	cmp	byte ptr [rax + 0xd], 1
14008e290	753d	jne	0x14008e2cf
14008e292	4883be90000000ff	cmp	qword ptr [rsi + 0x90], -1
14008e29a	7447	je	0x14008e2e3
14008e29c	41892c24	mov	dword ptr [r12], ebp
14008e2a0	488b9690000000	mov	rdx, qword ptr [rsi + 0x90]
14008e2a7	4883faff	cmp	rdx, -1
14008e2ab	7417	je	0x14008e2c4
14008e2ad	4885d2	test	rdx, rdx
14008e2b0	7412	je	0x14008e2c4
14008e2b2	488b8e98000000	mov	rcx, qword ptr [rsi + 0x98]
14008e2b9	41b801000000	mov	r8d, 1
14008e2bf	e80c3ff7ff	call	0x1400021d0
14008e2c4	48c78690000000ffffffff	mov	qword ptr [rsi + 0x90], 0xffffffffffffffff
14008e2cf	4881c448010000	add	rsp, 0x148
14008e2d6	5b	pop	rbx
14008e2d7	5d	pop	rbp
14008e2d8	5f	pop	rdi
14008e2d9	5e	pop	rsi
14008e2da	415c	pop	r12
14008e2dc	415d	pop	r13
14008e2de	415e	pop	r14
14008e2e0	415f	pop	r15
14008e2e2	c3	ret
14008e2e3	80bec001000000	cmp	byte ptr [rsi + 0x1c0], 0
14008e2ea	741f	je	0x14008e30b
14008e2ec	41892c24	mov	dword ptr [r12], ebp
14008e2f0	4889f1	mov	rcx, rsi
14008e2f3	4881c448010000	add	rsp, 0x148
14008e2fa	5b	pop	rbx
14008e2fb	5d	pop	rbp
14008e2fc	5f	pop	rdi
14008e2fd	5e	pop	rsi
14008e2fe	415c	pop	r12
14008e300	415d	pop	r13
14008e302	415e	pop	r14
14008e304	415f	pop	r15
14008e306	e9c576fbff	jmp	0x1400459d0
14008e30b	41803b00	cmp	byte ptr [r11], 0
14008e30f	740e	je	0x14008e31f
14008e311	488b442458	mov	rax, qword ptr [rsp + 0x58]
14008e316	448908	mov	dword ptr [rax], r9d
14008e319	41c60300	mov	byte ptr [r11], 0
14008e31d	ebb0	jmp	0x14008e2cf
14008e31f	4c89c0	mov	rax, r8
14008e322	41807877fe	cmp	byte ptr [r8 + 0x77], 0xfe
14008e327	7533	jne	0x14008e35c
14008e329	80787200	cmp	byte ptr [rax + 0x72], 0
14008e32d	7441	je	0x14008e370
14008e32f	488b4c2440	mov	rcx, qword ptr [rsp + 0x40]
14008e334	448b442424	mov	r8d, dword ptr [rsp + 0x24]
14008e339	448901	mov	dword ptr [rcx], r8d
14008e33c	4889c1	mov	rcx, rax
14008e33f	4989d0	mov	r8, rdx
14008e342	b2ff	mov	dl, 0xff
14008e344	4881c448010000	add	rsp, 0x148
14008e34b	5b	pop	rbx
14008e34c	5d	pop	rbp
14008e34d	5f	pop	rdi
14008e34e	5e	pop	rsi
14008e34f	415c	pop	r12
14008e351	415d	pop	r13
14008e353	415e	pop	r14
14008e355	415f	pop	r15
14008e357	e934720700	jmp	0x140105590
14008e35c	488b4c2440	mov	rcx, qword ptr [rsp + 0x40]
14008e361	8b542424	mov	edx, dword ptr [rsp + 0x24]
14008e365	8911	mov	dword ptr [rcx], edx
14008e367	c64077fe	mov	byte ptr [rax + 0x77], 0xfe
14008e36b	e95fffffff	jmp	0x14008e2cf
14008e370	803b00	cmp	byte ptr [rbx], 0
14008e373	7410	je	0x14008e385
14008e375	488b442450	mov	rax, qword ptr [rsp + 0x50]
14008e37a	448910	mov	dword ptr [rax], r10d
14008e37d	c60300	mov	byte ptr [rbx], 0
14008e380	e94affffff	jmp	0x14008e2cf
14008e385	4c8b442438	mov	r8, qword ptr [rsp + 0x38]
14008e38a	41803800	cmp	byte ptr [r8], 0
14008e38e	7414	je	0x14008e3a4
14008e390	488b442430	mov	rax, qword ptr [rsp + 0x30]
14008e395	8b4c2420	mov	ecx, dword ptr [rsp + 0x20]
14008e399	8908	mov	dword ptr [rax], ecx
14008e39b	41c60000	mov	byte ptr [r8], 0
14008e39f	e92bffffff	jmp	0x14008e2cf
14008e3a4	488b442448	mov	rax, qword ptr [rsp + 0x48]
14008e3a9	80780d00	cmp	byte ptr [rax + 0xd], 0
14008e3ad	448b4c2420	mov	r9d, dword ptr [rsp + 0x20]
14008e3b2	7415	je	0x14008e3c9
14008e3b4	0fb600	movzx	eax, byte ptr [rax]
14008e3b7	488b4c2430	mov	rcx, qword ptr [rsp + 0x30]
14008e3bc	448909	mov	dword ptr [rcx], r9d
14008e3bf	3401	xor	al, 1
14008e3c1	418800	mov	byte ptr [r8], al
14008e3c4	e906ffffff	jmp	0x14008e2cf
14008e3c9	488b442428	mov	rax, qword ptr [rsp + 0x28]
14008e3ce	80b8ea00000000	cmp	byte ptr [rax + 0xea], 0
14008e3d5	741c	je	0x14008e3f3
14008e3d7	c644246400	mov	byte ptr [rsp + 0x64], 0
14008e3dc	c744246007000000	mov	dword ptr [rsp + 0x60], 7
14008e3e4	488d542460	lea	rdx, [rsp + 0x60]
14008e3e9	e8825cffff	call	0x140084070
14008e3ee	e9dcfeffff	jmp	0x14008e2cf
14008e3f3	80b8e800000000	cmp	byte ptr [rax + 0xe8], 0
14008e3fa	0f84cffeffff	je	0x14008e2cf
14008e400	488b442428	mov	rax, qword ptr [rsp + 0x28]
14008e405	80b880000000ff	cmp	byte ptr [rax + 0x80], 0xff
14008e40c	0f85bdfeffff	jne	0x14008e2cf
14008e412	488b442428	mov	rax, qword ptr [rsp + 0x28]
14008e417	80b8a0000000ff	cmp	byte ptr [rax + 0xa0], 0xff
14008e41e	0f85abfeffff	jne	0x14008e2cf
14008e424	488b442428	mov	rax, qword ptr [rsp + 0x28]
14008e429	80b8e900000000	cmp	byte ptr [rax + 0xe9], 0
14008e430	7407	je	0x14008e439
14008e432	c644246401	mov	byte ptr [rsp + 0x64], 1
14008e437	eba3	jmp	0x14008e3dc
14008e439	488b442430	mov	rax, qword ptr [rsp + 0x30]
14008e43e	8b4c2420	mov	ecx, dword ptr [rsp + 0x20]
14008e442	8908	mov	dword ptr [rax], ecx
14008e444	488b442438	mov	rax, qword ptr [rsp + 0x38]
14008e449	c60001	mov	byte ptr [rax], 1
14008e44c	e97efeffff	jmp	0x14008e2cf
