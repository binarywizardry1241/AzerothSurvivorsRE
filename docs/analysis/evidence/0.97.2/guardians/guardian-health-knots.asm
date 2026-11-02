
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552b760:     	pushq	%rbp
14552b761:     	pushq	%r15
14552b763:     	pushq	%r14
14552b765:     	pushq	%rsi
14552b766:     	pushq	%rdi
14552b767:     	pushq	%rbx
14552b768:     	subq	$0x68, %rsp
14552b76c:     	leaq	0x60(%rsp), %rbp
14552b771:     	movaps	%xmm6, -0x10(%rbp)
14552b775:     	movq	$-0x2, -0x18(%rbp)
14552b77d:     	movq	%rcx, %rsi
14552b780:     	cmpq	%r8, %rdx
14552b783:     	je	0x14552b79f <.text+0x552a79f>
14552b785:     	movq	%r8, %rdi
14552b788:     	movq	%rdx, %rbx
14552b78b:     	addq	$0x58, %rbx
14552b78f:     	nop
14552b790:     	cmpb	$0x1, -0x4(%rbx)
14552b794:     	jne	0x14552b7bb <.text+0x552a7bb>
14552b796:     	cmpq	%rdi, %rbx
14552b799:     	leaq	0x58(%rbx), %rbx
14552b79d:     	jne	0x14552b790 <.text+0x552a790>
14552b79f:     	movq	$0x0, (%rsi)
14552b7a6:     	movq	$0x4, 0x8(%rsi)
14552b7ae:     	movq	$0x0, 0x10(%rsi)
14552b7b6:     	jmp	0x14552b879 <.text+0x552a879>
14552b7bb:     	movsd	-0x18(%rbx), %xmm6
14552b7c0:     	callq	0x140002200 <.text+0x1200>
14552b7c5:     	movl	$0x20, %ecx
14552b7ca:     	movl	$0x4, %edx
14552b7cf:     	callq	0x1400021c0 <.text+0x11c0>
14552b7d4:     	testq	%rax, %rax
14552b7d7:     	je	0x14552b88d <.text+0x552a88d>
14552b7dd:     	movlps	%xmm6, (%rax)
14552b7e0:     	movq	$0x4, -0x30(%rbp)
14552b7e8:     	movq	%rax, -0x28(%rbp)
14552b7ec:     	movq	$0x1, -0x20(%rbp)
14552b7f4:     	cmpq	%rdi, %rbx
14552b7f7:     	je	0x14552b862 <.text+0x552a862>
14552b7f9:     	movl	$0x1, %r14d
14552b7ff:     	leaq	-0x30(%rbp), %r15
14552b803:     	addq	$0x58, %rbx
14552b807:     	nopw	(%rax,%rax)
14552b810:     	cmpb	$0x1, -0x4(%rbx)
14552b814:     	jne	0x14552b821 <.text+0x552a821>
14552b816:     	cmpq	%rdi, %rbx
14552b819:     	leaq	0x58(%rbx), %rbx
14552b81d:     	jne	0x14552b810 <.text+0x552a810>
14552b81f:     	jmp	0x14552b862 <.text+0x552a862>
14552b821:     	movsd	-0x18(%rbx), %xmm6
14552b826:     	cmpq	-0x30(%rbp), %r14
14552b82a:     	jne	0x14552b851 <.text+0x552a851>
14552b82c:     	movq	$0x8, 0x20(%rsp)
14552b835:     	movl	$0x1, %r8d
14552b83b:     	movl	$0x4, %r9d
14552b841:     	movq	%r15, %rcx
14552b844:     	movq	%r14, %rdx
14552b847:     	callq	0x145757d40 <.text+0x5756d40>
14552b84c:     	nop
14552b84d:     	movq	-0x28(%rbp), %rax
14552b851:     	movlps	%xmm6, (%rax,%r14,8)
14552b856:     	incq	%r14
14552b859:     	movq	%r14, -0x20(%rbp)
14552b85d:     	cmpq	%rdi, %rbx
14552b860:     	jne	0x14552b803 <.text+0x552a803>
14552b862:     	movq	-0x20(%rbp), %rax
14552b866:     	movq	%rax, 0x10(%rsi)
14552b86a:     	movq	-0x30(%rbp), %rax
14552b86e:     	movq	%rax, (%rsi)
14552b871:     	movq	-0x28(%rbp), %rax
14552b875:     	movq	%rax, 0x8(%rsi)
14552b879:     	movq	%rsi, %rax
14552b87c:     	movaps	-0x10(%rbp), %xmm6
14552b880:     	addq	$0x68, %rsp
14552b884:     	popq	%rbx
14552b885:     	popq	%rdi
14552b886:     	popq	%rsi
14552b887:     	popq	%r14
14552b889:     	popq	%r15
14552b88b:     	popq	%rbp
14552b88c:     	retq
