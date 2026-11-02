1459a4710	push	r14
1459a4712	push	rsi
1459a4713	push	rdi
1459a4714	push	rbp
1459a4715	push	rbx
1459a4716	sub	rsp, 0x90
1459a471d	mov	rdi, r9
1459a4720	mov	ebx, edx
1459a4722	mov	rsi, rcx
1459a4725	mov	r14, qword ptr [rsp + 0xe0]
1459a472d	call	0x1459a3e80
1459a4732	add	bl, 0xfe
1459a4735	cmp	bl, 7
1459a4738	setb	al
1459a473b	mov	dl, 0x59
1459a473d	mov	ecx, ebx
1459a473f	shr	dl, cl
1459a4741	and	dl, al
1459a4743	cmp	dl, 1
1459a4746	jne	0x1459a4859
1459a474c	xor	eax, eax
1459a474e	mov	ecx, 0xcccccccd
1459a4753	jmp	0x1459a4770
1459a4755	nop	word ptr cs:[rax + rax]
1459a4760	mov	dword ptr [rsi + rax*4], edx
1459a4763	inc	rax
1459a4766	cmp	rax, 0x13
1459a476a	je	0x1459a4a2f
1459a4770	mov	edx, dword ptr [rdi + rax*4]
1459a4773	test	edx, edx
1459a4775	je	0x1459a47db
1459a4777	cmp	edx, 0x186a0
1459a477d	jb	0x1459a47d8
1459a477f	lea	r8d, [rdx - 0x186a0]
1459a4786	cmp	r8d, 0x2edf
1459a478d	ja	0x1459a47d8
1459a478f	mov	r9, r8
1459a4792	imul	r9, rcx
1459a4796	shr	r9, 0x23
1459a479a	add	r9d, r9d
1459a479d	lea	r9d, [r9 + r9*4]
1459a47a1	mov	r10d, r8d
1459a47a4	sub	r10d, r9d
1459a47a7	jne	0x1459a47d8
1459a47a9	imul	r8d, r8d, 0xcccd
1459a47b0	shr	r8d, 0x13
1459a47b4	imul	r8d, r8d, 0xffffcccd
1459a47bb	dec	r8d
1459a47be	ror	r8w, 1
1459a47c2	movzx	r8d, r8w
1459a47c6	lea	r9d, [rdx + 0xa]
1459a47ca	cmp	r8d, 0x199a
1459a47d1	cmovae	r9d, edx
1459a47d5	mov	edx, r9d
1459a47d8	mov	dword ptr [rsi + rax*4], edx
1459a47db	cmp	dword ptr [r14 + rax*8], 1
1459a47e0	jne	0x1459a4763
1459a47e2	mov	edx, dword ptr [r14 + rax*8 + 4]
1459a47e7	cmp	edx, 0x186a0
1459a47ed	jb	0x1459a4760
1459a47f3	lea	r8d, [rdx - 0x186a0]
1459a47fa	cmp	r8d, 0x2edf
1459a4801	ja	0x1459a4760
1459a4807	mov	r9, r8
1459a480a	imul	r9, rcx
1459a480e	shr	r9, 0x23
1459a4812	add	r9d, r9d
1459a4815	lea	r9d, [r9 + r9*4]
1459a4819	mov	r10d, r8d
1459a481c	sub	r10d, r9d
1459a481f	jne	0x1459a4760
1459a4825	imul	r8d, r8d, 0xcccd
1459a482c	shr	r8d, 0x13
1459a4830	imul	r8d, r8d, 0xffffcccd
1459a4837	dec	r8d
1459a483a	ror	r8w, 1
1459a483e	movzx	r8d, r8w
1459a4842	lea	r9d, [rdx + 0xa]
1459a4846	cmp	r8d, 0x199a
1459a484d	cmovae	r9d, edx
1459a4851	mov	edx, r9d
1459a4854	jmp	0x1459a4760
1459a4859	mov	eax, dword ptr [rdi]
1459a485b	test	eax, eax
1459a485d	je	0x1459a4861
1459a485f	mov	dword ptr [rsi], eax
1459a4861	cmp	dword ptr [r14], 1
1459a4865	jne	0x1459a486d
1459a4867	mov	eax, dword ptr [r14 + 4]
1459a486b	mov	dword ptr [rsi], eax
1459a486d	mov	eax, dword ptr [rdi + 4]
1459a4870	test	eax, eax
1459a4872	je	0x1459a4877
1459a4874	mov	dword ptr [rsi + 4], eax
1459a4877	cmp	dword ptr [r14 + 8], 1
1459a487c	jne	0x1459a4885
1459a487e	mov	eax, dword ptr [r14 + 0xc]
1459a4882	mov	dword ptr [rsi + 4], eax
1459a4885	mov	eax, dword ptr [rdi + 8]
1459a4888	test	eax, eax
1459a488a	je	0x1459a488f
1459a488c	mov	dword ptr [rsi + 8], eax
1459a488f	cmp	dword ptr [r14 + 0x10], 1
1459a4894	jne	0x1459a489d
1459a4896	mov	eax, dword ptr [r14 + 0x14]
1459a489a	mov	dword ptr [rsi + 8], eax
1459a489d	mov	eax, dword ptr [rdi + 0xc]
1459a48a0	test	eax, eax
1459a48a2	je	0x1459a48a7
1459a48a4	mov	dword ptr [rsi + 0xc], eax
1459a48a7	cmp	dword ptr [r14 + 0x18], 1
1459a48ac	jne	0x1459a48b5
1459a48ae	mov	eax, dword ptr [r14 + 0x1c]
1459a48b2	mov	dword ptr [rsi + 0xc], eax
1459a48b5	mov	eax, dword ptr [rdi + 0x10]
1459a48b8	test	eax, eax
1459a48ba	je	0x1459a48bf
1459a48bc	mov	dword ptr [rsi + 0x10], eax
1459a48bf	cmp	dword ptr [r14 + 0x20], 1
1459a48c4	jne	0x1459a48cd
1459a48c6	mov	eax, dword ptr [r14 + 0x24]
1459a48ca	mov	dword ptr [rsi + 0x10], eax
1459a48cd	mov	eax, dword ptr [rdi + 0x14]
1459a48d0	test	eax, eax
1459a48d2	je	0x1459a48d7
1459a48d4	mov	dword ptr [rsi + 0x14], eax
1459a48d7	cmp	dword ptr [r14 + 0x28], 1
1459a48dc	jne	0x1459a48e5
1459a48de	mov	eax, dword ptr [r14 + 0x2c]
1459a48e2	mov	dword ptr [rsi + 0x14], eax
1459a48e5	mov	eax, dword ptr [rdi + 0x18]
1459a48e8	test	eax, eax
1459a48ea	je	0x1459a48ef
1459a48ec	mov	dword ptr [rsi + 0x18], eax
1459a48ef	cmp	dword ptr [r14 + 0x30], 1
1459a48f4	jne	0x1459a48fd
1459a48f6	mov	eax, dword ptr [r14 + 0x34]
1459a48fa	mov	dword ptr [rsi + 0x18], eax
1459a48fd	mov	eax, dword ptr [rdi + 0x1c]
1459a4900	test	eax, eax
1459a4902	je	0x1459a4907
1459a4904	mov	dword ptr [rsi + 0x1c], eax
1459a4907	cmp	dword ptr [r14 + 0x38], 1
1459a490c	jne	0x1459a4915
1459a490e	mov	eax, dword ptr [r14 + 0x3c]
1459a4912	mov	dword ptr [rsi + 0x1c], eax
1459a4915	mov	eax, dword ptr [rdi + 0x20]
1459a4918	test	eax, eax
1459a491a	je	0x1459a491f
1459a491c	mov	dword ptr [rsi + 0x20], eax
1459a491f	cmp	dword ptr [r14 + 0x40], 1
1459a4924	jne	0x1459a492d
1459a4926	mov	eax, dword ptr [r14 + 0x44]
1459a492a	mov	dword ptr [rsi + 0x20], eax
1459a492d	mov	eax, dword ptr [rdi + 0x24]
1459a4930	test	eax, eax
1459a4932	je	0x1459a4937
1459a4934	mov	dword ptr [rsi + 0x24], eax
1459a4937	cmp	dword ptr [r14 + 0x48], 1
1459a493c	jne	0x1459a4945
1459a493e	mov	eax, dword ptr [r14 + 0x4c]
1459a4942	mov	dword ptr [rsi + 0x24], eax
1459a4945	mov	eax, dword ptr [rdi + 0x28]
1459a4948	test	eax, eax
1459a494a	je	0x1459a494f
1459a494c	mov	dword ptr [rsi + 0x28], eax
1459a494f	cmp	dword ptr [r14 + 0x50], 1
1459a4954	jne	0x1459a495d
1459a4956	mov	eax, dword ptr [r14 + 0x54]
1459a495a	mov	dword ptr [rsi + 0x28], eax
1459a495d	mov	eax, dword ptr [rdi + 0x2c]
1459a4960	test	eax, eax
1459a4962	je	0x1459a4967
1459a4964	mov	dword ptr [rsi + 0x2c], eax
1459a4967	cmp	dword ptr [r14 + 0x58], 1
1459a496c	jne	0x1459a4975
1459a496e	mov	eax, dword ptr [r14 + 0x5c]
1459a4972	mov	dword ptr [rsi + 0x2c], eax
1459a4975	mov	eax, dword ptr [rdi + 0x30]
1459a4978	test	eax, eax
1459a497a	je	0x1459a497f
1459a497c	mov	dword ptr [rsi + 0x30], eax
1459a497f	cmp	dword ptr [r14 + 0x60], 1
1459a4984	jne	0x1459a498d
1459a4986	mov	eax, dword ptr [r14 + 0x64]
1459a498a	mov	dword ptr [rsi + 0x30], eax
1459a498d	mov	eax, dword ptr [rdi + 0x34]
1459a4990	test	eax, eax
1459a4992	je	0x1459a4997
1459a4994	mov	dword ptr [rsi + 0x34], eax
1459a4997	cmp	dword ptr [r14 + 0x68], 1
1459a499c	jne	0x1459a49a5
1459a499e	mov	eax, dword ptr [r14 + 0x6c]
1459a49a2	mov	dword ptr [rsi + 0x34], eax
1459a49a5	mov	eax, dword ptr [rdi + 0x38]
1459a49a8	test	eax, eax
1459a49aa	je	0x1459a49af
1459a49ac	mov	dword ptr [rsi + 0x38], eax
1459a49af	cmp	dword ptr [r14 + 0x70], 1
1459a49b4	jne	0x1459a49bd
1459a49b6	mov	eax, dword ptr [r14 + 0x74]
1459a49ba	mov	dword ptr [rsi + 0x38], eax
1459a49bd	mov	eax, dword ptr [rdi + 0x3c]
1459a49c0	test	eax, eax
1459a49c2	je	0x1459a49c7
1459a49c4	mov	dword ptr [rsi + 0x3c], eax
1459a49c7	cmp	dword ptr [r14 + 0x78], 1
1459a49cc	jne	0x1459a49d5
1459a49ce	mov	eax, dword ptr [r14 + 0x7c]
1459a49d2	mov	dword ptr [rsi + 0x3c], eax
1459a49d5	mov	eax, dword ptr [rdi + 0x40]
1459a49d8	test	eax, eax
1459a49da	je	0x1459a49df
1459a49dc	mov	dword ptr [rsi + 0x40], eax
1459a49df	cmp	dword ptr [r14 + 0x80], 1
1459a49e7	jne	0x1459a49f3
1459a49e9	mov	eax, dword ptr [r14 + 0x84]
1459a49f0	mov	dword ptr [rsi + 0x40], eax
1459a49f3	mov	eax, dword ptr [rdi + 0x44]
1459a49f6	test	eax, eax
1459a49f8	je	0x1459a49fd
1459a49fa	mov	dword ptr [rsi + 0x44], eax
1459a49fd	cmp	dword ptr [r14 + 0x88], 1
1459a4a05	jne	0x1459a4a11
1459a4a07	mov	eax, dword ptr [r14 + 0x8c]
1459a4a0e	mov	dword ptr [rsi + 0x44], eax
1459a4a11	mov	eax, dword ptr [rdi + 0x48]
1459a4a14	test	eax, eax
1459a4a16	je	0x1459a4a1b
1459a4a18	mov	dword ptr [rsi + 0x48], eax
1459a4a1b	cmp	dword ptr [r14 + 0x90], 1
1459a4a23	jne	0x1459a4a2f
1459a4a25	mov	eax, dword ptr [r14 + 0x94]
1459a4a2c	mov	dword ptr [rsi + 0x48], eax
1459a4a2f	mov	edx, dword ptr [rsi + 0x3c]
1459a4a32	lea	rcx, [rsp + 0x20]
1459a4a37	call	0x1459a4ba0
1459a4a3c	mov	rdx, qword ptr [rsp + 0x20]
1459a4a41	cmp	rdx, -1
1459a4a45	je	0x1459a4a93
1459a4a47	mov	rdi, qword ptr [rsp + 0x38]
1459a4a4c	mov	rbx, qword ptr [rsp + 0x40]
1459a4a51	mov	ebp, dword ptr [rsp + 0x80]
1459a4a58	test	rdx, rdx
1459a4a5b	je	0x1459a4a6d
1459a4a5d	mov	rcx, qword ptr [rsp + 0x28]
1459a4a62	mov	r8d, 1
1459a4a68	call	0x1400021d0
1459a4a6d	test	rdi, rdi
1459a4a70	je	0x1459a4a87
1459a4a72	shl	rdi, 3
1459a4a76	mov	r8d, 4
1459a4a7c	mov	rcx, rbx
1459a4a7f	mov	rdx, rdi
1459a4a82	call	0x1400021d0
1459a4a87	cmp	ebp, 0x11
1459a4a8a	jne	0x1459a4a93
1459a4a8c	mov	dword ptr [rsi + 0x40], 0
1459a4a93	mov	rax, rsi
1459a4a96	add	rsp, 0x90
1459a4a9d	pop	rbx
1459a4a9e	pop	rbp
1459a4a9f	pop	rdi
1459a4aa0	pop	rsi
1459a4aa1	pop	r14
1459a4aa3	ret
