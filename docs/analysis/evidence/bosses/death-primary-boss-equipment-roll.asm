
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c4922:     	movl	$0x3, %r14d
1454c4928:     	addq	%rcx, %rax
1454c492b:     	movq	0x8(%rax), %rcx
1454c492f:     	movq	0x10(%rax), %rdx
1454c4933:     	callq	0x14540e820 <.text+0x540d820>
1454c4938:     	movq	%rax, %r15
1454c493b:     	leaq	0x230(%rsi), %rcx
1454c4942:     	movb	$0x0, 0x177(%rbp)
1454c4949:     	callq	0x145451160 <.text+0x5450160>
1454c494e:     	nop
1454c494f:     	movaps	%xmm0, %xmm7
1454c4952:     	movzbl	0x284(%rsi), %edx
1454c4959:     	movb	$0x0, 0x177(%rbp)
1454c4960:     	leaq	0xf0(%rbp), %rcx
1454c4967:     	movq	%r15, %r8
1454c496a:     	movq	%r14, %r9
1454c496d:     	callq	0x1454589f0 <.text+0x54579f0>
1454c4972:     	nop
1454c4973:     	movq	0xf0(%rbp), %rax
1454c497a:     	movq	%rax, 0xe8(%rbp)
1454c4981:     	movq	0xf8(%rbp), %rax
1454c4988:     	movq	%rax, 0x168(%rbp)
1454c498f:     	movq	0x100(%rbp), %rax
1454c4996:     	testq	%rax, %rax
1454c4999:     	je	0x1454c4a91 <.text+0x54c3a91>
1454c499f:     	movq	0x168(%rbp), %r13
1454c49a6:     	leaq	(,%rax,8), %r15
1454c49ae:     	addq	%r13, %r15
1454c49b1:     	movss	0x526a06(%rip), %xmm12  # 0x1459eb3c0
1454c49ba:     	jmp	0x1454c49de <.text+0x54c39de>
1454c49bc:     	movq	0x5a0(%rsi), %rax
1454c49c3:     	movl	%r12d, (%rax,%r14,4)
1454c49c7:     	incq	%r14
1454c49ca:     	movq	%r14, 0x5a8(%rsi)
1454c49d1:     	addq	$0x8, %r13
1454c49d5:     	cmpq	%r15, %r13
1454c49d8:     	je	0x1454c4a91 <.text+0x54c3a91>
1454c49de:     	movl	(%r13), %r12d
1454c49e2:     	movss	0x4(%r13), %xmm0
1454c49e8:     	movq	0x898(%rsi), %rax
1454c49ef:     	movq	0x880(%rsi), %rcx
1454c49f6:     	movq	0x888(%rsi), %rdx
1454c49fd:     	leaq	(%rax,%rcx), %r8
1454c4a01:     	rolq	$0x17, %r8
1454c4a05:     	addq	%rcx, %r8
1454c4a08:     	movq	%rdx, %r9
1454c4a0b:     	shlq	$0x11, %r9
1454c4a0f:     	movq	0x890(%rsi), %r10
1454c4a16:     	xorq	%rcx, %r10
1454c4a19:     	xorq	%rdx, %rax
1454c4a1c:     	xorq	%r10, %rdx
1454c4a1f:     	movq	%rdx, 0x888(%rsi)
1454c4a26:     	xorq	%rax, %rcx
1454c4a29:     	movq	%rcx, 0x880(%rsi)
1454c4a30:     	xorq	%r9, %r10
1454c4a33:     	rolq	$0x2d, %rax
1454c4a37:     	shrq	$0x28, %r8
1454c4a3b:     	xorps	%xmm1, %xmm1
1454c4a3e:     	cvtsi2ss	%r8d, %xmm1
1454c4a43:     	movq	%r10, 0x890(%rsi)
1454c4a4a:     	movq	%rax, 0x898(%rsi)
1454c4a51:     	addss	0x208(%rsi), %xmm0
1454c4a59:     	mulss	%xmm12, %xmm1
1454c4a5e:     	mulss	%xmm7, %xmm0
1454c4a62:     	ucomiss	%xmm1, %xmm0
1454c4a65:     	jbe	0x1454c49d1 <.text+0x54c39d1>
1454c4a6b:     	movq	0x5a8(%rsi), %r14
1454c4a72:     	cmpq	0x598(%rsi), %r14
1454c4a79:     	jne	0x1454c49bc <.text+0x54c39bc>
1454c4a7f:     	leaq	0x598(%rsi), %rcx
1454c4a86:     	callq	0x14575b6b0 <.text+0x575a6b0>
1454c4a8b:     	nop
1454c4a8c:     	jmp	0x1454c49bc <.text+0x54c39bc>
1454c4a91:     	movq	0xe8(%rbp), %rdx
1454c4a98:     	testq	%rdx, %rdx
1454c4a9b:     	je	0x1454c4ab3 <.text+0x54c3ab3>
1454c4a9d:     	shlq	$0x3, %rdx
1454c4aa1:     	movl	$0x4, %r8d
1454c4aa7:     	movq	0x168(%rbp), %rcx
1454c4aae:     	callq	0x1400021d0 <.text+0x11d0>
