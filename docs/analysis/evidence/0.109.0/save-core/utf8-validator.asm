145bd5650	push	r15
145bd5652	push	r14
145bd5654	push	rsi
145bd5655	push	rdi
145bd5656	push	rbx
145bd5657	mov	rax, rcx
145bd565a	xor	r9d, r9d
145bd565d	mov	rcx, r8
145bd5660	sub	rcx, 0xf
145bd5664	cmovae	r9, rcx
145bd5668	test	r8, r8
145bd566b	je	0x145bd5827
145bd5671	lea	r10, [rdx + 7]
145bd5675	and	r10, 0xfffffffffffffff8
145bd5679	sub	r10, rdx
145bd567c	xor	ecx, ecx
145bd567e	lea	rsi, [rip + 0x1699010]
145bd5685	movabs	rdi, 0x8080808080808080
145bd568f	jmp	0x145bd56af
145bd5691	nop	word ptr cs:[rax + rax]
145bd56a0	inc	r14
145bd56a3	mov	rcx, r14
145bd56a6	cmp	rcx, r8
145bd56a9	jae	0x145bd5827
145bd56af	movzx	ebx, byte ptr [rdx + rcx]
145bd56b3	test	bl, bl
145bd56b5	js	0x145bd5710
145bd56b7	mov	r11d, r10d
145bd56ba	sub	r11d, ecx
145bd56bd	test	r11b, 7
145bd56c1	je	0x145bd56d4
145bd56c3	inc	rcx
145bd56c6	jmp	0x145bd56a6
145bd56c8	nop	dword ptr [rax + rax]
145bd56d0	add	rcx, 0x10
145bd56d4	cmp	rcx, r9
145bd56d7	jae	0x145bd56e7
145bd56d9	mov	r11, qword ptr [rdx + rcx + 8]
145bd56de	or	r11, qword ptr [rdx + rcx]
145bd56e2	test	r11, rdi
145bd56e5	je	0x145bd56d0
145bd56e7	cmp	rcx, r8
145bd56ea	jae	0x145bd56a6
145bd56ec	nop	dword ptr [rax]
145bd56f0	cmp	byte ptr [rdx + rcx], 0
145bd56f4	js	0x145bd56a6
145bd56f6	inc	rcx
145bd56f9	cmp	r8, rcx
145bd56fc	jne	0x145bd56f0
145bd56fe	jmp	0x145bd5827
145bd5703	nop	word ptr cs:[rax + rax]
145bd5710	movzx	r14d, byte ptr [rbx + rsi]
145bd5715	mov	r11b, 1
145bd5718	cmp	r14d, 4
145bd571c	je	0x145bd577b
145bd571e	cmp	r14d, 3
145bd5722	je	0x145bd574d
145bd5724	cmp	r14d, 2
145bd5728	jne	0x145bd5838
145bd572e	lea	r14, [rcx + 1]
145bd5732	cmp	r14, r8
145bd5735	jae	0x145bd5833
145bd573b	cmp	byte ptr [rdx + r14], 0xbf
145bd5740	mov	bl, 1
145bd5742	jle	0x145bd56a0
145bd5748	jmp	0x145bd583e
145bd574d	lea	r14, [rcx + 1]
145bd5751	cmp	r14, r8
145bd5754	jae	0x145bd5833
145bd575a	movzx	r14d, byte ptr [rdx + r14]
145bd575f	cmp	rbx, 0xe0
145bd5766	je	0x145bd57a9
145bd5768	cmp	ebx, 0xed
145bd576e	jne	0x145bd57c4
145bd5770	cmp	r14b, 0x9f
145bd5774	jle	0x145bd57dc
145bd5776	jmp	0x145bd5838
145bd577b	lea	r14, [rcx + 1]
145bd577f	cmp	r14, r8
145bd5782	jae	0x145bd5833
145bd5788	movzx	r14d, byte ptr [rdx + r14]
145bd578d	cmp	rbx, 0xf0
145bd5794	je	0x145bd57b8
145bd5796	cmp	ebx, 0xf4
145bd579c	jne	0x145bd57f2
145bd579e	cmp	r14b, 0x8f
145bd57a2	jle	0x145bd5800
145bd57a4	jmp	0x145bd5838
145bd57a9	and	r14b, 0xe0
145bd57ad	cmp	r14b, 0xa0
145bd57b1	je	0x145bd57dc
145bd57b3	jmp	0x145bd5838
145bd57b8	add	r14b, 0x70
145bd57bc	cmp	r14b, 0x30
145bd57c0	jb	0x145bd5800
145bd57c2	jmp	0x145bd5838
145bd57c4	lea	r15d, [rbx + 0x1f]
145bd57c8	cmp	r15b, 0xc
145bd57cc	jb	0x145bd57d6
145bd57ce	and	bl, 0xfe
145bd57d1	cmp	bl, 0xee
145bd57d4	jne	0x145bd5838
145bd57d6	cmp	r14b, 0xc0
145bd57da	jge	0x145bd5838
145bd57dc	lea	r14, [rcx + 2]
145bd57e0	cmp	r14, r8
145bd57e3	jae	0x145bd5833
145bd57e5	cmp	byte ptr [rdx + r14], 0xbf
145bd57ea	jle	0x145bd56a0
145bd57f0	jmp	0x145bd583c
145bd57f2	add	bl, 0xf
145bd57f5	cmp	bl, 2
145bd57f8	ja	0x145bd5838
145bd57fa	cmp	r14b, 0xc0
145bd57fe	jge	0x145bd5838
145bd5800	lea	rbx, [rcx + 2]
145bd5804	cmp	rbx, r8
145bd5807	jae	0x145bd5833
145bd5809	cmp	byte ptr [rdx + rbx], 0xbf
145bd580d	jg	0x145bd583c
145bd580f	lea	r14, [rcx + 3]
145bd5813	cmp	r14, r8
145bd5816	jae	0x145bd5833
145bd5818	cmp	byte ptr [rdx + r14], 0xc0
145bd581d	jl	0x145bd56a0
145bd5823	mov	bl, 3
145bd5825	jmp	0x145bd583e
145bd5827	mov	qword ptr [rax + 8], rdx
145bd582b	mov	qword ptr [rax + 0x10], r8
145bd582f	xor	ecx, ecx
145bd5831	jmp	0x145bd584e
145bd5833	xor	r11d, r11d
145bd5836	jmp	0x145bd583e
145bd5838	mov	bl, 1
145bd583a	jmp	0x145bd583e
145bd583c	mov	bl, 2
145bd583e	mov	qword ptr [rax + 8], rcx
145bd5842	mov	byte ptr [rax + 0x10], r11b
145bd5846	mov	byte ptr [rax + 0x11], bl
145bd5849	mov	ecx, 1
145bd584e	mov	qword ptr [rax], rcx
145bd5851	pop	rbx
145bd5852	pop	rdi
145bd5853	pop	rsi
145bd5854	pop	r14
145bd5856	pop	r15
145bd5858	ret
