Disassembly of section .text:

0000000140001000 <.text>:
14091a860:     	pushq	%r15
14091a862:     	pushq	%r14
14091a864:     	pushq	%r12
14091a866:     	pushq	%rsi
14091a867:     	pushq	%rdi
14091a868:     	pushq	%rbx
14091a869:     	subq	$0x38, %rsp
14091a86d:     	movq	%rcx, %rsi
14091a870:     	cmpb	$0x0, 0x61(%rdx)
14091a874:     	je	0x14091a88b <.text+0x91988b>
14091a876:     	movq	$-0x1, (%rsi)
14091a87d:     	addq	$0x38, %rsp
14091a881:     	popq	%rbx
14091a882:     	popq	%rdi
14091a883:     	popq	%rsi
14091a884:     	popq	%r12
14091a886:     	popq	%r14
14091a888:     	popq	%r15
14091a88a:     	retq
14091a88b:     	movq	%rdx, %rbx
14091a88e:     	leaq	0x30(%rdx), %r14
14091a892:     	movq	0x30(%rdx), %rdi
14091a896:     	leaq	0x20(%rsp), %rcx
14091a89b:     	movq	%r14, %rdx
14091a89e:     	callq	0x140929380 <.text+0x928380>
14091a8a3:     	cmpl	$0x1, 0x20(%rsp)
14091a8a8:     	jne	0x14091a8e1 <.text+0x9198e1>
14091a8aa:     	movq	0x30(%rsp), %rax
14091a8af:     	movq	0x20(%rbx), %rcx
14091a8b3:     	movq	%rax, 0x20(%rbx)
14091a8b7:     	subq	%rcx, %rax
14091a8ba:     	addq	%rcx, %rdi
14091a8bd:     	testq	%rax, %rax
14091a8c0:     	je	0x14091a90d <.text+0x91990d>
14091a8c2:     	cmpb	$0xa, -0x1(%rdi,%rax)
14091a8c7:     	movq	%rax, %r14
14091a8ca:     	jne	0x14091a910 <.text+0x919910>
14091a8cc:     	movq	%rax, %r14
14091a8cf:     	decq	%r14
14091a8d2:     	je	0x14091a910 <.text+0x919910>
14091a8d4:     	cmpb	$0xd, -0x2(%rdi,%rax)
14091a8d9:     	jne	0x14091a910 <.text+0x919910>
14091a8db:     	addq	$-0x2, %rax
14091a8df:     	jmp	0x14091a90d <.text+0x91990d>
14091a8e1:     	cmpb	$0x0, 0x61(%rbx)
14091a8e5:     	jne	0x14091a876 <.text+0x919876>
14091a8e7:     	movb	$0x1, 0x61(%rbx)
14091a8eb:     	movq	0x20(%rbx), %rdi
14091a8ef:     	movq	0x28(%rbx), %rax
14091a8f3:     	subq	%rdi, %rax
14091a8f6:     	setne	%cl
14091a8f9:     	orb	0x60(%rbx), %cl
14091a8fc:     	cmpb	$0x1, %cl
14091a8ff:     	jne	0x14091a876 <.text+0x919876>
14091a905:     	addq	(%r14), %rdi
14091a908:     	testq	%rax, %rax
14091a90b:     	jne	0x14091a8c2 <.text+0x9198c2>
14091a90d:     	movq	%rax, %r14
14091a910:     	movq	0x8(%rbx), %r12
14091a914:     	movq	%r14, %r15
14091a917:     	subq	%r12, %r15
14091a91a:     	jb	0x14091a92e <.text+0x91992e>
14091a91c:     	movq	(%rbx), %rcx
14091a91f:     	movq	%rdi, %rdx
14091a922:     	movq	%r12, %r8
14091a925:     	callq	0x145bc9787 <.text+0x5bc8787>
14091a92a:     	testl	%eax, %eax
14091a92c:     	je	0x14091a975 <.text+0x919975>
14091a92e:     	testq	%r14, %r14
14091a931:     	jns	0x14091a943 <.text+0x919943>
14091a933:     	xorl	%r15d, %r15d
14091a936:     	movq	%r15, %rcx
14091a939:     	movq	%r14, %rdx
14091a93c:     	callq	0x145d6944b <.text+0x5d6844b>
14091a941:     	ud2
14091a943:     	je	0x14091a9b7 <.text+0x9199b7>
14091a945:     	callq	0x140002200 <.text+0x1200>
14091a94a:     	movl	$0x1, %r15d
14091a950:     	movl	$0x1, %edx
14091a955:     	movq	%r14, %rcx
14091a958:     	callq	0x1400021c0 <.text+0x11c0>
14091a95d:     	testq	%rax, %rax
14091a960:     	je	0x14091a936 <.text+0x919936>
14091a962:     	movq	%rax, %rbx
14091a965:     	movq	%rax, %rcx
14091a968:     	movq	%rdi, %rdx
14091a96b:     	movq	%r14, %r8
14091a96e:     	callq	0x145bc977b <.text+0x5bc877b>
14091a973:     	jmp	0x14091a9bc <.text+0x9199bc>
14091a975:     	movq	%rdi, %rcx
14091a978:     	addq	%r12, %rcx
14091a97b:     	movq	%r15, %rdx
14091a97e:     	callq	0x1411422d0 <.text+0x11412d0>
14091a983:     	testq	%rdx, %rdx
14091a986:     	je	0x14091a92e <.text+0x91992e>
14091a988:     	cmpb	$0x3d, (%rax)
14091a98b:     	jne	0x14091a92e <.text+0x91992e>
14091a98d:     	decq	%rdx
14091a990:     	incq	%rax
14091a993:     	movq	%rax, %rcx
14091a996:     	callq	0x14006f550 <.text+0x6e550>
14091a99b:     	testq	%rax, %rax
14091a99e:     	je	0x14091a92e <.text+0x91992e>
14091a9a0:     	movq	0x10(%rbx), %rax
14091a9a4:     	movb	$0x1, (%rax)
14091a9a7:     	movq	0x18(%rbx), %rdx
14091a9ab:     	leaq	0x20(%rsp), %rcx
14091a9b0:     	callq	0x145b9c990 <.text+0x5b9b990>
14091a9b5:     	jmp	0x14091a9cb <.text+0x9199cb>
14091a9b7:     	movl	$0x1, %ebx
14091a9bc:     	movq	%r14, 0x20(%rsp)
14091a9c1:     	movq	%rbx, 0x28(%rsp)
14091a9c6:     	movq	%r14, 0x30(%rsp)
14091a9cb:     	movq	0x30(%rsp), %rax
14091a9d0:     	movq	%rax, 0x10(%rsi)
14091a9d4:     	movq	0x20(%rsp), %rax
14091a9d9:     	movq	%rax, (%rsi)
14091a9dc:     	movq	0x28(%rsp), %rax
14091a9e1:     	movq	%rax, 0x8(%rsi)
14091a9e5:     	jmp	0x14091a87d <.text+0x91987d>
