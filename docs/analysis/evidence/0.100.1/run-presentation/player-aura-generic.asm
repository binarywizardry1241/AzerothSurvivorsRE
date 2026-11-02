
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549b830:     	pushq	%rbp
14549b831:     	pushq	%r15
14549b833:     	pushq	%r14
14549b835:     	pushq	%r13
14549b837:     	pushq	%r12
14549b839:     	pushq	%rsi
14549b83a:     	pushq	%rdi
14549b83b:     	pushq	%rbx
14549b83c:     	subq	$0x48, %rsp
14549b840:     	leaq	0x40(%rsp), %rbp
14549b845:     	movq	$-0x2, (%rbp)
14549b84d:     	movq	%rdx, %rdi
14549b850:     	movq	%rcx, %rsi
14549b853:     	movq	$0x0, -0x18(%rbp)
14549b85b:     	movq	$0x8, -0x10(%rbp)
14549b863:     	movq	$0x0, -0x8(%rbp)
14549b86b:     	movq	%r8, %r13
14549b86e:     	shlq	$0x6, %r13
14549b872:     	leaq	(%rdx,%r13), %rbx
14549b876:     	xorl	%r14d, %r14d
14549b879:     	testq	%r8, %r8
14549b87c:     	je	0x14549b8aa <.text+0x549a8aa>
14549b87e:     	xorl	%eax, %eax
14549b880:     	xorl	%r15d, %r15d
14549b883:     	nopw	%cs:(%rax,%rax)
14549b890:     	movzbl	(%rdi,%rax), %ecx
14549b894:     	addb	$-0x12, %cl
14549b897:     	testb	$-0x3, %cl
14549b89a:     	je	0x14549b8af <.text+0x549a8af>
14549b89c:     	incq	%r15
14549b89f:     	addq	$0x40, %rax
14549b8a3:     	cmpq	%rax, %r13
14549b8a6:     	jne	0x14549b890 <.text+0x549a890>
14549b8a8:     	jmp	0x14549b8d2 <.text+0x549a8d2>
14549b8aa:     	xorl	%r15d, %r15d
14549b8ad:     	jmp	0x14549b927 <.text+0x549a927>
14549b8af:     	leaq	-0x18(%rbp), %rcx
14549b8b3:     	callq	0x145774860 <.text+0x5773860>
14549b8b8:     	nop
14549b8b9:     	movq	-0x10(%rbp), %rax
14549b8bd:     	movq	%r15, (%rax)
14549b8c0:     	movb	$0x0, 0x8(%rax)
14549b8c4:     	movq	$0x1, -0x8(%rbp)
14549b8cc:     	movl	$0x1, %r14d
14549b8d2:     	xorl	%r15d, %r15d
14549b8d5:     	xorl	%eax, %eax
14549b8d7:     	xorl	%r12d, %r12d
14549b8da:     	nopw	(%rax,%rax)
14549b8e0:     	cmpb	$0x13, (%rdi,%rax)
14549b8e4:     	je	0x14549b8f4 <.text+0x549a8f4>
14549b8e6:     	incq	%r12
14549b8e9:     	addq	$0x40, %rax
14549b8ed:     	cmpq	%rax, %r13
14549b8f0:     	jne	0x14549b8e0 <.text+0x549a8e0>
14549b8f2:     	jmp	0x14549b927 <.text+0x549a927>
14549b8f4:     	movb	$0x2, %r13b
14549b8f7:     	cmpq	-0x18(%rbp), %r14
14549b8fb:     	jne	0x14549b907 <.text+0x549a907>
14549b8fd:     	leaq	-0x18(%rbp), %rcx
14549b901:     	callq	0x145774860 <.text+0x5773860>
14549b906:     	nop
14549b907:     	xorl	%r15d, %r15d
14549b90a:     	jmp	0x14549b90c <.text+0x549a90c>
14549b90c:     	movq	-0x10(%rbp), %rax
14549b910:     	movq	%r14, %rcx
14549b913:     	shlq	$0x4, %rcx
14549b917:     	movq	%r12, (%rax,%rcx)
14549b91b:     	movb	%r13b, 0x8(%rax,%rcx)
14549b920:     	incq	%r14
14549b923:     	movq	%r14, -0x8(%rbp)
14549b927:     	xorl	%eax, %eax
14549b929:     	movq	%rdi, %rcx
14549b92c:     	nopl	(%rax)
14549b930:     	cmpq	%rbx, %rcx
14549b933:     	je	0x14549b960 <.text+0x549a960>
14549b935:     	leaq	0x40(%rcx), %rdi
14549b939:     	decq	%rax
14549b93c:     	cmpb	$0xf, (%rcx)
14549b93f:     	movq	%rdi, %rcx
14549b942:     	jne	0x14549b930 <.text+0x549a930>
14549b944:     	subq	%rax, %r15
14549b947:     	leaq	-0x1(%r15), %r12
14549b94b:     	movb	$0x1, %r13b
14549b94e:     	cmpq	-0x18(%rbp), %r14
14549b952:     	jne	0x14549b90c <.text+0x549a90c>
14549b954:     	leaq	-0x18(%rbp), %rcx
14549b958:     	callq	0x145774860 <.text+0x5773860>
14549b95d:     	nop
14549b95e:     	jmp	0x14549b90c <.text+0x549a90c>
14549b960:     	movq	-0x8(%rbp), %rax
14549b964:     	movq	%rax, 0x10(%rsi)
14549b968:     	movups	-0x18(%rbp), %xmm0
14549b96c:     	movups	%xmm0, (%rsi)
14549b96f:     	addq	$0x48, %rsp
14549b973:     	popq	%rbx
14549b974:     	popq	%rdi
14549b975:     	popq	%rsi
14549b976:     	popq	%r12
14549b978:     	popq	%r13
14549b97a:     	popq	%r14
14549b97c:     	popq	%r15
14549b97e:     	popq	%rbp
14549b97f:     	retq
