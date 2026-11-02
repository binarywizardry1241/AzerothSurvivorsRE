
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592e820:     	pushq	%r15
14592e822:     	pushq	%r14
14592e824:     	pushq	%r13
14592e826:     	pushq	%r12
14592e828:     	pushq	%rsi
14592e829:     	pushq	%rdi
14592e82a:     	pushq	%rbp
14592e82b:     	pushq	%rbx
14592e82c:     	subq	$0x58, %rsp
14592e830:     	movl	%r8d, %edi
14592e833:     	movq	%rdx, %rsi
14592e836:     	movzbl	0xc0(%rsp), %eax
14592e83e:     	movzbl	(%rdx), %r15d
14592e842:     	cmpq	$0x6, %r15
14592e846:     	ja	0x14592e88e <.text+0x592d88e>
14592e848:     	leaq	0x154ce69(%rip), %rdx   # 0x146e7b6b8
14592e84f:     	movslq	(%rdx,%r15,4), %r8
14592e853:     	addq	%rdx, %r8
14592e856:     	jmpq	*%r8
14592e859:     	movb	$0x1, %al
14592e85b:     	jmp	0x14592e975 <.text+0x592d975>
14592e860:     	testb	%al, %al
14592e862:     	sete	%cl
14592e865:     	testl	%edi, %edi
14592e867:     	sete	%al
14592e86a:     	andb	%cl, %al
14592e86c:     	jmp	0x14592e975 <.text+0x592d975>
14592e871:     	cmpb	0x1(%rsi), %r9b
14592e875:     	sete	%cl
14592e878:     	cmpb	$0x2, %al
14592e87a:     	setne	%al
14592e87d:     	andb	%cl, %al
14592e87f:     	jmp	0x14592e975 <.text+0x592d975>
14592e884:     	cmpb	$0x2, %al
14592e886:     	sete	%al
14592e889:     	jmp	0x14592e975 <.text+0x592d975>
14592e88e:     	cmpb	$0x2, %al
14592e890:     	je	0x14592e973 <.text+0x592d973>
14592e896:     	testl	%edi, %edi
14592e898:     	je	0x14592e973 <.text+0x592d973>
14592e89e:     	movzbl	0x304(%rcx), %eax
14592e8a5:     	addb	$-0x2, %al
14592e8a7:     	cmpb	$0x9, %al
14592e8a9:     	ja	0x14592e8bb <.text+0x592d8bb>
14592e8ab:     	movzbl	%al, %eax
14592e8ae:     	leaq	0x154c8db(%rip), %rdx   # 0x146e7b190
14592e8b5:     	movq	(%rdx,%rax,8), %rdx
14592e8b9:     	jmp	0x14592e8c2 <.text+0x592d8c2>
14592e8bb:     	leaq	0x127cee6(%rip), %rdx   # 0x146bab7a8
14592e8c2:     	movq	0x30(%rdx), %rax
14592e8c6:     	movq	0x38(%rdx), %rdx
14592e8ca:     	shlq	$0x4, %rdx
14592e8ce:     	addq	%rax, %rdx
14592e8d1:     	movq	%rdx, 0x30(%rsp)
14592e8d6:     	movq	0xb8(%rcx), %rdx
14592e8dd:     	movq	%rdx, 0x28(%rsp)
14592e8e2:     	movq	0xc0(%rcx), %rcx
14592e8e9:     	movq	%rcx, 0x20(%rsp)
14592e8ee:     	leaq	0x127e1e3(%rip), %r12   # 0x146bacad8
14592e8f5:     	nopw	%cs:(%rax,%rax)
14592e900:     	cmpq	0x30(%rsp), %rax
14592e905:     	je	0x14592e986 <.text+0x592d986>
14592e907:     	leaq	0x10(%rax), %r13
14592e90b:     	movq	(%rax), %rbx
14592e90e:     	movq	0x8(%rax), %r14
14592e912:     	movq	%rbx, 0x38(%rsp)
14592e917:     	movq	%r14, 0x40(%rsp)
14592e91c:     	xorl	%ebp, %ebp
14592e91e:     	jmp	0x14592e931 <.text+0x592d931>
14592e920:     	addq	$0x78, %rbp
14592e924:     	cmpq	$0x34f8, %rbp           # imm = 0x34F8
14592e92b:     	je	0x14592ea45 <.text+0x592da45>
14592e931:     	cmpq	%r14, 0x8(%rbp,%r12)
14592e936:     	jne	0x14592e920 <.text+0x592d920>
14592e938:     	movq	(%rbp,%r12), %rcx
14592e93d:     	movq	%rbx, %rdx
14592e940:     	movq	%r14, %r8
14592e943:     	callq	0x145bc9787 <.text+0x5bc8787>
14592e948:     	testl	%eax, %eax
14592e94a:     	jne	0x14592e920 <.text+0x592d920>
14592e94c:     	cmpl	%edi, 0x40(%rbp,%r12)
14592e951:     	je	0x14592e95d <.text+0x592d95d>
14592e953:     	movq	%r13, %rax
14592e956:     	cmpl	%edi, 0x64(%rbp,%r12)
14592e95b:     	jne	0x14592e900 <.text+0x592d900>
14592e95d:     	addq	%rbp, %r12
14592e960:     	movl	%r15d, %eax
14592e963:     	leaq	0x154cd6a(%rip), %rcx   # 0x146e7b6d4
14592e96a:     	movslq	(%rcx,%rax,4), %rax
14592e96e:     	addq	%rcx, %rax
14592e971:     	jmpq	*%rax
14592e973:     	xorl	%eax, %eax
14592e975:     	addq	$0x58, %rsp
14592e979:     	popq	%rbx
14592e97a:     	popq	%rbp
14592e97b:     	popq	%rdi
14592e97c:     	popq	%rsi
14592e97d:     	popq	%r12
14592e97f:     	popq	%r13
14592e981:     	popq	%r14
14592e983:     	popq	%r15
14592e985:     	retq
14592e986:     	imulq	$0x70, 0x20(%rsp), %rax
14592e98c:     	xorl	%ecx, %ecx
14592e98e:     	movq	0x28(%rsp), %rdx
14592e993:     	nopw	%cs:(%rax,%rax)
14592e9a0:     	cmpq	%rcx, %rax
14592e9a3:     	je	0x14592e973 <.text+0x592d973>
14592e9a5:     	movq	(%rdx,%rcx), %r12
14592e9a9:     	cmpl	%edi, 0x40(%r12)
14592e9ae:     	je	0x14592e960 <.text+0x592d960>
14592e9b0:     	addq	$0x70, %rcx
14592e9b4:     	cmpl	%edi, 0x64(%r12)
14592e9b9:     	jne	0x14592e9a0 <.text+0x592d9a0>
14592e9bb:     	jmp	0x14592e960 <.text+0x592d960>
14592e9bd:     	movzbl	0x75(%r12), %eax
14592e9c3:     	cmpb	0x1(%rsi), %al
14592e9c6:     	jmp	0x14592e886 <.text+0x592d886>
14592e9cb:     	movq	0x10(%rsi), %rbx
14592e9cf:     	testq	%rbx, %rbx
14592e9d2:     	je	0x14592e973 <.text+0x592d973>
14592e9d4:     	movq	0x8(%rsi), %r14
14592e9d8:     	shlq	$0x4, %rbx
14592e9dc:     	movq	(%r12), %rsi
14592e9e0:     	movq	0x8(%r12), %rdi
14592e9e5:     	xorl	%r15d, %r15d
14592e9e8:     	jmp	0x14592e9f5 <.text+0x592d9f5>
14592e9ea:     	addq	$0x10, %r15
14592e9ee:     	xorl	%eax, %eax
14592e9f0:     	cmpq	%r15, %rbx
14592e9f3:     	je	0x14592e975 <.text+0x592d975>
14592e9f5:     	cmpq	%rdi, 0x8(%r14,%r15)
14592e9fa:     	jne	0x14592e9ea <.text+0x592d9ea>
14592e9fc:     	movq	(%r14,%r15), %rcx
14592ea00:     	movq	%rsi, %rdx
14592ea03:     	movq	%rdi, %r8
14592ea06:     	callq	0x145bc9787 <.text+0x5bc8787>
14592ea0b:     	testl	%eax, %eax
14592ea0d:     	jne	0x14592e9ea <.text+0x592d9ea>
14592ea0f:     	jmp	0x14592e859 <.text+0x592d859>
14592ea14:     	movzbl	0x74(%r12), %eax
14592ea1a:     	cmpb	0x1(%rsi), %al
14592ea1d:     	jmp	0x14592e886 <.text+0x592d886>
14592ea22:     	movq	0x10(%rsi), %r8
14592ea26:     	cmpq	%r8, 0x8(%r12)
14592ea2b:     	jne	0x14592e973 <.text+0x592d973>
14592ea31:     	movq	(%r12), %rcx
14592ea35:     	movq	0x8(%rsi), %rdx
14592ea39:     	callq	0x145bc9787 <.text+0x5bc8787>
14592ea3e:     	testl	%eax, %eax
14592ea40:     	jmp	0x14592e886 <.text+0x592d886>
14592ea45:     	leaq	0x38(%rsp), %rax
14592ea4a:     	movq	%rax, 0x48(%rsp)
14592ea4f:     	leaq	-0x592c996(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14592ea56:     	movq	%rax, 0x50(%rsp)
14592ea5b:     	leaq	0x127d256(%rip), %rcx   # 0x146babcb8
14592ea62:     	leaq	0x127d25f(%rip), %r8    # 0x146babcc8
14592ea69:     	leaq	0x48(%rsp), %rdx
14592ea6e:     	callq	0x145d699c0 <.text+0x5d689c0>
14592ea73:     	ud2
