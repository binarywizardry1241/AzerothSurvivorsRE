1458ef860	push	rbp
1458ef861	push	r15
1458ef863	push	r14
1458ef865	push	r13
1458ef867	push	r12
1458ef869	push	rsi
1458ef86a	push	rdi
1458ef86b	push	rbx
1458ef86c	sub	rsp, 0xf28
1458ef873	lea	rbp, [rsp + 0x80]
1458ef87b	mov	qword ptr [rbp + 0xea0], 0xfffffffffffffffe
1458ef886	mov	rsi, r8
1458ef889	mov	rdi, rdx
1458ef88c	mov	rbx, rcx
1458ef88f	lea	rcx, [rbp - 0x58]
1458ef893	call	0x1458ef170
1458ef898	mov	rax, qword ptr [rbp - 0x58]
1458ef89c	cmp	rax, -1
1458ef8a0	je	0x1458efd38
1458ef8a6	mov	qword ptr [rbp + 0xe98], rax
1458ef8ad	mov	rdx, qword ptr [rbp - 0x50]
1458ef8b1	mov	r8, qword ptr [rbp - 0x48]
1458ef8b5	mov	qword ptr [rsp + 0x20], 5
1458ef8be	lea	r9, [rip + 0x12fc104]
1458ef8c5	lea	rcx, [rbp + 0xbb8]
1458ef8cc	mov	qword ptr [rbp + 0xe80], rdx
1458ef8d3	call	0x145ba6d40
1458ef8d8	nop
1458ef8d9	mov	rax, qword ptr [rbp + 0xbb8]
1458ef8e0	mov	rcx, qword ptr [rbp + 0xbc0]
1458ef8e7	mov	qword ptr [rbp + 0xe88], rcx
1458ef8ee	mov	r14, qword ptr [rbp + 0xbc8]
1458ef8f5	mov	rdx, qword ptr [rbp + 0xe98]
1458ef8fc	test	rdx, rdx
1458ef8ff	je	0x1458ef919
1458ef901	mov	r8d, 1
1458ef907	mov	rcx, qword ptr [rbp + 0xe80]
1458ef90e	mov	r15, rax
1458ef911	call	0x1400021d0
1458ef916	mov	rax, r15
1458ef919	cmp	rax, -1
1458ef91d	je	0x1458efd38
1458ef923	mov	qword ptr [rbp + 0xe98], rax
1458ef92a	movabs	rcx, 0xc22e450672894ab7
1458ef934	mov	rax, rsi
1458ef937	mul	rcx
1458ef93a	mov	r8, rdx
1458ef93d	shr	r8, 0x10
1458ef941	imul	rax, r8, 0x15180
1458ef948	sub	rsi, rax
1458ef94b	lea	rax, [r8 + 0xafa6c]
1458ef952	movabs	rcx, 0x396b06bcc8f87
1458ef95c	mul	rcx
1458ef95f	mov	rcx, rdx
1458ef962	shr	rcx, 3
1458ef966	imul	rax, rcx, -0x23ab1
1458ef96d	add	r8, rax
1458ef970	add	r8, 0xafa6c
1458ef977	movabs	r10, 0xd31cc193fd31cc19
1458ef981	mov	rax, r8
1458ef984	imul	r10
1458ef987	mov	r9, rdx
1458ef98a	shr	r9, 0x3f
1458ef98e	sar	rdx, 8
1458ef992	add	r9, rdx
1458ef995	add	r9, r8
1458ef998	movabs	rdx, 0xe5ac81fa000e5ac9
1458ef9a2	mov	rax, r8
1458ef9a5	imul	rdx
1458ef9a8	lea	r15, [rdx + r8]
1458ef9ac	mov	rax, r15
1458ef9af	shr	rax, 0x3f
1458ef9b3	sar	r15, 0xf
1458ef9b7	add	r15, rax
1458ef9ba	movabs	rdx, 0x1a537e05fff1a537
1458ef9c4	mov	rax, r8
1458ef9c7	imul	rdx
1458ef9ca	add	r15, r9
1458ef9cd	sub	rdx, r8
1458ef9d0	mov	r11, rdx
1458ef9d3	shr	r11, 0x3f
1458ef9d7	sar	rdx, 0x11
1458ef9db	add	r11, rdx
1458ef9de	add	r11, r15
1458ef9e1	movabs	rdx, 0x2ce33e6c02ce33e7
1458ef9eb	mov	rax, r11
1458ef9ee	imul	rdx
1458ef9f1	mov	r9, rdx
1458ef9f4	mov	rax, rdx
1458ef9f7	shr	rax, 0x3f
1458ef9fb	sar	r9, 6
1458ef9ff	add	r9, rax
1458efa02	mov	rax, r11
1458efa05	imul	r10
1458efa08	mov	r10, rdx
1458efa0b	imul	r15, r9, -0x16d
1458efa12	mov	rax, rdx
1458efa15	shr	rax, 0x3f
1458efa19	sar	r10, 8
1458efa1d	add	r10, rax
1458efa20	movabs	rdx, 0x1cba6563d8d5e3c7
1458efa2a	mov	rax, r11
1458efa2d	imul	rdx
1458efa30	mov	rax, rdx
1458efa33	shr	rax, 0x3f
1458efa37	sar	rdx, 0xc
1458efa3b	add	rdx, rax
1458efa3e	add	r10, r8
1458efa41	add	r10, rdx
1458efa44	add	r10, r15
1458efa47	lea	rax, [r10 + r10*4]
1458efa4b	add	rax, 2
1458efa4f	movabs	rdx, 0x358ae0358ae0358b
1458efa59	imul	rdx
1458efa5c	mov	r8, rdx
1458efa5f	mov	r11, rdx
1458efa62	shr	r11, 0x3f
1458efa66	sar	r8, 5
1458efa6a	lea	rax, [r8 + r11]
1458efa6e	imul	rax, rax, 0x99
1458efa75	add	rax, 2
1458efa79	movabs	rdx, 0x9999999999999999
1458efa83	imul	rdx
1458efa86	mov	rax, rdx
1458efa89	shr	rax, 0x3f
1458efa8d	sar	rdx, 1
1458efa90	add	rdx, rax
1458efa93	lea	rax, [r10 + rdx]
1458efa97	inc	rax
1458efa9a	mov	qword ptr [rbp + 0xe70], rax
1458efaa1	cmp	r10, 0x132
1458efaa8	lea	rax, [r8 + r11 + 3]
1458efaad	lea	rdx, [r8 + r11 - 9]
1458efab2	cmovl	rdx, rax
1458efab6	mov	qword ptr [rbp + 0xe68], rdx
1458efabd	imul	rax, rcx, 0x190
1458efac4	add	rax, r9
1458efac7	xor	ecx, ecx
1458efac9	cmp	rdx, 3
1458efacd	setl	cl
1458efad0	add	rcx, rax
1458efad3	mov	qword ptr [rbp + 0xe60], rcx
1458efada	imul	rax, rsi, 0x123457
1458efae1	shr	rax, 0x20
1458efae5	mov	qword ptr [rbp + 0xe58], rax
1458efaec	imul	rax, rsi, 0x4444445
1458efaf3	shr	rax, 0x20
1458efaf7	imul	ecx, eax, 0x889
1458efafd	shr	ecx, 0x11
1458efb00	imul	ecx, ecx, 0x3c
1458efb03	imul	edx, eax, 0x3c
1458efb06	sub	eax, ecx
1458efb08	movzx	eax, ax
1458efb0b	mov	qword ptr [rbp + 0xe50], rax
1458efb12	sub	esi, edx
1458efb14	mov	qword ptr [rbp + 0xe78], rsi
1458efb1b	lea	rax, [rbp + 0xe60]
1458efb22	mov	qword ptr [rbp - 0x58], rax
1458efb26	lea	rax, [rip + 0x2efd73]
1458efb2d	mov	qword ptr [rbp - 0x50], rax
1458efb31	lea	rcx, [rbp + 0xe68]
1458efb38	mov	qword ptr [rbp - 0x48], rcx
1458efb3c	mov	qword ptr [rbp - 0x40], rax
1458efb40	lea	rcx, [rbp + 0xe70]
1458efb47	mov	qword ptr [rbp - 0x38], rcx
1458efb4b	mov	qword ptr [rbp - 0x30], rax
1458efb4f	lea	rax, [rbp + 0xe58]
1458efb56	mov	qword ptr [rbp - 0x28], rax
1458efb5a	lea	rax, [rip + 0x2efc6f]
1458efb61	mov	qword ptr [rbp - 0x20], rax
1458efb65	lea	rcx, [rbp + 0xe50]
1458efb6c	mov	qword ptr [rbp - 0x18], rcx
1458efb70	mov	qword ptr [rbp - 0x10], rax
1458efb74	lea	r13, [rbp + 0xe78]
1458efb7b	mov	qword ptr [rbp - 8], r13
1458efb7f	mov	qword ptr [rbp], rax
1458efb83	lea	rdx, [rip + 0x12fbe44]
1458efb8a	lea	r15, [rbp + 0xbb8]
1458efb91	lea	r8, [rbp - 0x58]
1458efb95	mov	rcx, r15
1458efb98	call	0x145bcce30
1458efb9d	nop
1458efb9e	lea	rax, [rip + 0x15e2e2b]
1458efba5	mov	qword ptr [rbp - 0x58], rax
1458efba9	lea	rax, [rip - 0x58edaf0]
1458efbb0	mov	qword ptr [rbp - 0x50], rax
1458efbb4	mov	qword ptr [rbp - 0x48], r15
1458efbb8	lea	rax, [rip - 0x58edadf]
1458efbbf	mov	qword ptr [rbp - 0x40], rax
1458efbc3	lea	rdx, [rip + 0x15e2e16]
1458efbca	lea	rcx, [rbp + 0xe18]
1458efbd1	lea	r8, [rbp - 0x58]
1458efbd5	call	0x145bcce30
1458efbda	nop
1458efbdb	mov	rdx, qword ptr [rbp + 0xbb8]
1458efbe2	test	rdx, rdx
1458efbe5	je	0x1458efbf9
1458efbe7	mov	rcx, qword ptr [rbp + 0xbc0]
1458efbee	mov	r8d, 1
1458efbf4	call	0x1400021d0
1458efbf9	mov	r9, qword ptr [rbp + 0xe20]
1458efc00	mov	rax, qword ptr [rbp + 0xe28]
1458efc07	mov	qword ptr [rsp + 0x20], rax
1458efc0c	lea	rcx, [rbp + 0xe30]
1458efc13	mov	rdx, qword ptr [rbp + 0xe88]
1458efc1a	mov	r8, r14
1458efc1d	mov	qword ptr [rbp + 0xe80], r9
1458efc24	call	0x145ba6d40
1458efc29	nop
1458efc2a	mov	rdx, qword ptr [rbp + 0xe18]
1458efc31	test	rdx, rdx
1458efc34	je	0x1458efc48
1458efc36	mov	r8d, 1
1458efc3c	mov	rcx, qword ptr [rbp + 0xe80]
1458efc43	call	0x1400021d0
1458efc48	mov	byte ptr [rbp - 0x58], 1
1458efc4c	lea	rcx, [rbp - 0x58]
1458efc50	mov	rdx, qword ptr [rbp + 0xe88]
1458efc57	mov	r8, r14
1458efc5a	call	0x145bae140
1458efc5f	nop
1458efc60	mov	rsi, qword ptr [rbp + 0xe38]
1458efc67	mov	r12, qword ptr [rbp + 0xe40]
1458efc6e	test	rax, rax
1458efc71	jne	0x1458efc8e
1458efc73	mov	rcx, rsi
1458efc76	mov	rdx, r12
1458efc79	mov	r8, rbx
1458efc7c	mov	r9, rdi
1458efc7f	call	0x145bbd750
1458efc84	nop
1458efc85	test	rax, rax
1458efc88	je	0x1458efd4e
1458efc8e	mov	qword ptr [rbp + 0xe78], rax
1458efc95	mov	qword ptr [rbp + 0xbb8], rsi
1458efc9c	mov	qword ptr [rbp + 0xbc0], r12
1458efca3	mov	qword ptr [rbp - 0x58], r15
1458efca7	lea	rax, [rip + 0x2d0032]
1458efcae	mov	qword ptr [rbp - 0x50], rax
1458efcb2	mov	qword ptr [rbp - 0x48], r13
1458efcb6	lea	rax, [rip + 0x2ede33]
1458efcbd	mov	qword ptr [rbp - 0x40], rax
1458efcc1	lea	rcx, [rip + 0x15e2d20]
1458efcc8	lea	rdx, [rbp - 0x58]
1458efccc	call	0x145bb6590
1458efcd1	nop
1458efcd2	mov	rax, qword ptr [rbp + 0xe78]
1458efcd9	mov	ecx, eax
1458efcdb	and	ecx, 3
1458efcde	lea	edx, [rcx - 2]
1458efce1	cmp	edx, 2
1458efce4	jb	0x1458efd00
1458efce6	test	rcx, rcx
1458efce9	je	0x1458efd00
1458efceb	dec	rax
1458efcee	lea	rcx, [rbp - 0x50]
1458efcf2	mov	qword ptr [rbp - 0x50], rax
1458efcf6	mov	byte ptr [rbp - 0x58], 3
1458efcfa	call	0x145bdf7c0
1458efcff	nop
1458efd00	mov	rdx, qword ptr [rbp + 0xe30]
1458efd07	test	rdx, rdx
1458efd0a	je	0x1458efd1a
1458efd0c	mov	r8d, 1
1458efd12	mov	rcx, rsi
1458efd15	call	0x1400021d0
1458efd1a	mov	rdx, qword ptr [rbp + 0xe98]
1458efd21	test	rdx, rdx
1458efd24	je	0x1458efd38
1458efd26	mov	r8d, 1
1458efd2c	mov	rcx, qword ptr [rbp + 0xe88]
1458efd33	call	0x1400021d0
1458efd38	xor	eax, eax
1458efd3a	add	rsp, 0xf28
1458efd41	pop	rbx
1458efd42	pop	rdi
1458efd43	pop	rsi
1458efd44	pop	r12
1458efd46	pop	r13
1458efd48	pop	r14
1458efd4a	pop	r15
1458efd4c	pop	rbp
1458efd4d	ret
1458efd4e	lea	rcx, [rbp - 0x58]
1458efd52	mov	rdx, qword ptr [rbp + 0xe88]
1458efd59	mov	r8, r14
1458efd5c	call	0x145bb6d30
1458efd61	nop
1458efd62	mov	rdi, qword ptr [rbp - 0x58]
1458efd66	mov	rbx, qword ptr [rbp - 0x50]
1458efd6a	cmp	rdi, 2
1458efd6e	jne	0x1458efd99
1458efd70	mov	eax, ebx
1458efd72	and	eax, 3
1458efd75	lea	ecx, [rax - 2]
1458efd78	cmp	ecx, 2
1458efd7b	jb	0x1458efd97
1458efd7d	test	rax, rax
1458efd80	je	0x1458efd97
1458efd82	dec	rbx
1458efd85	lea	rcx, [rbp - 0x50]
1458efd89	mov	qword ptr [rbp - 0x50], rbx
1458efd8d	mov	byte ptr [rbp - 0x58], 3
1458efd91	call	0x145bdf7c0
1458efd96	nop
1458efd97	jmp	0x1458efdaf
1458efd99	lea	rdx, [rbp - 0x48]
1458efd9d	lea	rcx, [rbp + 0xbb8]
1458efda4	mov	r8d, 0x260
1458efdaa	call	0x145bfa0e7
1458efdaf	lea	rcx, [rbp + 0x958]
1458efdb6	lea	rdx, [rbp + 0xbb8]
1458efdbd	mov	r8d, 0x260
1458efdc3	call	0x145bfa0e7
1458efdc8	mov	qword ptr [rbp - 0x58], 0
1458efdd0	mov	qword ptr [rbp + 0x208], 0
1458efddb	mov	qword ptr [rbp + 0x468], 2
1458efde6	mov	qword ptr [rbp + 0x6d8], 2
1458efdf1	mov	qword ptr [rbp + 0x948], rdi
1458efdf8	mov	qword ptr [rbp + 0x950], rbx
1458efdff	lea	rcx, [rbp + 0xbb8]
1458efe06	lea	rdx, [rbp - 0x58]
1458efe0a	call	0x1459bc030
1458efe0f	nop
1458efe10	mov	rdi, qword ptr [rbp + 0xbc0]
1458efe17	mov	rbx, qword ptr [rbp + 0xbc8]
1458efe1e	cmp	rbx, 2
1458efe22	jae	0x1458eff45
1458efe28	mov	r15, rbx
1458efe2b	shl	r15, 5
1458efe2f	add	r15, rdi
1458efe32	mov	ecx, 5
1458efe37	lea	r14, [rbp - 0x50]
1458efe3b	xor	r12d, r12d
1458efe3e	jmp	0x1458efe42
1458efe40	xor	ecx, ecx
1458efe42	test	r12b, 1
1458efe46	je	0x1458efe94
1458efe48	cmp	rdi, r15
1458efe4b	je	0x1458efeac
1458efe4d	mov	rcx, qword ptr [r15 - 0x18]
1458efe51	mov	rdx, qword ptr [r15 - 0x10]
1458efe55	call	0x145bb67a0
1458efe5a	nop
1458efe5b	add	r15, -0x20
1458efe5f	mov	r12b, 1
1458efe62	mov	ecx, 0
1458efe67	test	rax, rax
1458efe6a	je	0x1458efe42
1458efe6c	mov	ecx, eax
1458efe6e	and	ecx, 3
1458efe71	lea	edx, [rcx - 2]
1458efe74	cmp	edx, 2
1458efe77	jb	0x1458efe40
1458efe79	test	rcx, rcx
1458efe7c	je	0x1458efe40
1458efe7e	dec	rax
1458efe81	mov	qword ptr [rbp - 0x50], rax
1458efe85	mov	byte ptr [rbp - 0x58], 3
1458efe89	mov	rcx, r14
1458efe8c	call	0x145bdf7c0
1458efe91	nop
1458efe92	jmp	0x1458efe40
1458efe94	mov	rax, r15
1458efe97	sub	rax, rdi
1458efe9a	shr	rax, 5
1458efe9e	cmp	rcx, rax
1458efea1	jae	0x1458efeac
1458efea3	shl	rcx, 5
1458efea7	sub	r15, rcx
1458efeaa	jmp	0x1458efe4d
1458efeac	test	rbx, rbx
1458efeaf	je	0x1458efee2
1458efeb1	lea	r14, [rdi + 8]
1458efeb5	jmp	0x1458efec9
1458efeb7	nop	word ptr [rax + rax]
1458efec0	add	r14, 0x20
1458efec4	dec	rbx
1458efec7	je	0x1458efee2
1458efec9	mov	rdx, qword ptr [r14 - 8]
1458efecd	test	rdx, rdx
1458efed0	je	0x1458efec0
1458efed2	mov	rcx, qword ptr [r14]
1458efed5	mov	r8d, 1
1458efedb	call	0x1400021d0
1458efee0	jmp	0x1458efec0
1458efee2	mov	rdx, qword ptr [rbp + 0xbb8]
1458efee9	test	rdx, rdx
1458efeec	je	0x1458eff00
1458efeee	shl	rdx, 5
1458efef2	mov	r8d, 8
1458efef8	mov	rcx, rdi
1458efefb	call	0x1400021d0
1458eff00	mov	rdx, qword ptr [rbp + 0xe30]
1458eff07	test	rdx, rdx
1458eff0a	je	0x1458eff1a
1458eff0c	mov	r8d, 1
1458eff12	mov	rcx, rsi
1458eff15	call	0x1400021d0
1458eff1a	mov	al, 1
1458eff1c	mov	rdx, qword ptr [rbp + 0xe98]
1458eff23	test	rdx, rdx
1458eff26	je	0x1458efd3a
1458eff2c	mov	r8d, 1
1458eff32	mov	rcx, qword ptr [rbp + 0xe88]
1458eff39	call	0x1400021d0
1458eff3e	mov	al, 1
1458eff40	jmp	0x1458efd3a
1458eff45	cmp	rbx, 0x15
1458eff49	jae	0x1458eff73
1458eff4b	mov	r15, rbx
1458eff4e	shl	r15, 5
1458eff52	add	r15, rdi
1458eff55	lea	r14, [rdi + 0x20]
1458eff59	mov	rcx, rdi
1458eff5c	mov	rdx, r14
1458eff5f	call	0x1459a9520
1458eff64	nop
1458eff65	add	r14, 0x20
1458eff69	cmp	r14, r15
1458eff6c	jne	0x1458eff59
1458eff6e	jmp	0x1458efe28
1458eff73	lea	r8, [rbp + 0xe97]
1458eff7a	mov	rcx, rdi
1458eff7d	mov	rdx, rbx
1458eff80	call	0x1459dd810
1458eff85	nop
1458eff86	jmp	0x1458efe28
