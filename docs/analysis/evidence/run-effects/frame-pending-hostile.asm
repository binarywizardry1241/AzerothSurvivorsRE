1454b5774:     	leaq	(%rdi,%rdi,4), %rsi
1454b5778:     	shlq	$0x4, %rsi
1454b577c:     	movq	0x340(%rbp), %r13
1454b5783:     	addq	%r13, %rsi
1454b5786:     	leaq	0xb8(%rbp), %r12
1454b578d:     	xorps	%xmm8, %xmm8
1454b5791:     	jmp	0x1454b57cc <.text+0x54b47cc>
1454b5793:     	nopw	%cs:(%rax,%rax)
1454b57a0:     	movss	0xf4(%rbp), %xmm1
1454b57a8:     	movq	0xd8(%rbp), %r8
1454b57af:     	movq	0x368(%rbp), %rcx
1454b57b6:     	xorl	%r9d, %r9d
1454b57b9:     	callq	0x1454a0910 <.text+0x549f910>
1454b57be:     	nop
1454b57bf:     	addq	$0x50, %r13
1454b57c3:     	cmpq	%rsi, %r13
1454b57c6:     	je	0x1454b5a7a <.text+0x54b4a7a>
