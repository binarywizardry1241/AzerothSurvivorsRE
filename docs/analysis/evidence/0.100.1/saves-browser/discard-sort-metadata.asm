
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14017a6c0:     	pushq	%rbp
14017a6c1:     	pushq	%r15
14017a6c3:     	pushq	%r14
14017a6c5:     	pushq	%r13
14017a6c7:     	pushq	%r12
14017a6c9:     	pushq	%rsi
14017a6ca:     	pushq	%rdi
14017a6cb:     	pushq	%rbx
14017a6cc:     	subq	$0x78, %rsp
14017a6d0:     	leaq	0x70(%rsp), %rbp
14017a6d5:     	movq	$-0x2, (%rbp)
14017a6dd:     	movq	%rdx, %r9
14017a6e0:     	movq	%rcx, %rsi
14017a6e3:     	movq	0x10(%rdx), %r12
14017a6e7:     	movq	(%rdx), %rbx
14017a6ea:     	leaq	(,%r12,8), %rax
14017a6f2:     	leaq	(%rax,%rax,8), %r14
14017a6f6:     	movq	%r14, %rax
14017a6f9:     	shrq	$0x3, %rax
14017a6fd:     	movabsq	$0x2492492492492493, %rcx # imm = 0x2492492492492493
14017a707:     	mulq	%rcx
14017a70a:     	movq	%rdx, -0x10(%rbp)
14017a70e:     	movq	0x8(%r9), %rdi
14017a712:     	movq	0x18(%r9), %rcx
14017a716:     	cmpq	%rcx, %rdi
14017a719:     	je	0x14017a784 <.text+0x179784>
14017a71b:     	leaq	-0x38(%rbp), %rdx
14017a71f:     	movq	%rbx, %rax
14017a722:     	nopw	%cs:(%rax,%rax)
14017a730:     	movups	0x28(%rdi), %xmm0
14017a734:     	movups	0x38(%rdi), %xmm1
14017a738:     	movups	%xmm1, 0x10(%rdx)
14017a73c:     	movups	%xmm0, (%rdx)
14017a73f:     	movq	0x10(%rdi), %r8
14017a743:     	movq	%r8, -0x40(%rbp)
14017a747:     	movups	(%rdi), %xmm0
14017a74a:     	addq	$0x48, %rdi
14017a74e:     	movaps	%xmm0, -0x50(%rbp)
14017a752:     	movq	-0x20(%rbp), %r8
14017a756:     	movq	%r8, 0x30(%rax)
14017a75a:     	movaps	-0x30(%rbp), %xmm1
14017a75e:     	movups	%xmm1, 0x20(%rax)
14017a762:     	movups	%xmm0, (%rax)
14017a765:     	movq	-0x40(%rbp), %r8
14017a769:     	movq	%r8, 0x10(%rax)
14017a76d:     	movq	-0x38(%rbp), %r8
14017a771:     	movq	%r8, 0x18(%rax)
14017a775:     	addq	$0x38, %rax
14017a779:     	cmpq	%rcx, %rdi
14017a77c:     	jne	0x14017a730 <.text+0x179730>
14017a77e:     	movq	%rdi, 0x8(%r9)
14017a782:     	jmp	0x14017a787 <.text+0x179787>
14017a784:     	movq	%rbx, %rax
14017a787:     	subq	%rbx, %rax
14017a78a:     	shrq	$0x3, %rax
14017a78e:     	movabsq	$0x6db6db6db6db6db7, %r13 # imm = 0x6DB6DB6DB6DB6DB7
14017a798:     	imulq	%rax, %r13
14017a79c:     	movq	%rcx, %rax
14017a79f:     	subq	%rdi, %rax
14017a7a2:     	movabsq	$-0x1c71c71c71c71c71, %rdx # imm = 0xE38E38E38E38E38F
14017a7ac:     	mulq	%rdx
14017a7af:     	movq	%rbx, -0x50(%rbp)
14017a7b3:     	movq	%r13, -0x48(%rbp)
14017a7b7:     	movq	%r12, -0x40(%rbp)
14017a7bb:     	movq	$0x0, 0x10(%r9)
14017a7c3:     	movq	$0x8, (%r9)
14017a7ca:     	movq	$0x8, 0x8(%r9)
14017a7d2:     	movq	%r9, -0x8(%rbp)
14017a7d6:     	movq	$0x8, 0x18(%r9)
14017a7de:     	cmpq	%rdi, %rcx
14017a7e1:     	je	0x14017a82a <.text+0x17982a>
14017a7e3:     	movq	%rdx, %r15
14017a7e6:     	shrq	$0x6, %r15
14017a7ea:     	addq	$0x30, %rdi
14017a7ee:     	jmp	0x14017a7f9 <.text+0x1797f9>
14017a7f0:     	addq	$0x48, %rdi
14017a7f4:     	decq	%r15
14017a7f7:     	je	0x14017a82a <.text+0x17982a>
14017a7f9:     	movq	-0x30(%rdi), %rdx
14017a7fd:     	testq	%rdx, %rdx
14017a800:     	je	0x14017a811 <.text+0x179811>
14017a802:     	movq	-0x28(%rdi), %rcx
14017a806:     	movl	$0x1, %r8d
14017a80c:     	callq	0x1400021d0 <.text+0x11d0>
14017a811:     	movq	-0x8(%rdi), %rdx
14017a815:     	testq	%rdx, %rdx
14017a818:     	je	0x14017a7f0 <.text+0x1797f0>
14017a81a:     	movq	(%rdi), %rcx
14017a81d:     	movl	$0x1, %r8d
14017a823:     	callq	0x1400021d0 <.text+0x11d0>
14017a828:     	jmp	0x14017a7f0 <.text+0x1797f0>
14017a82a:     	testq	%r12, %r12
14017a82d:     	setne	%al
14017a830:     	movq	-0x10(%rbp), %rdi
14017a834:     	imulq	$0x38, %rdi, %r15
14017a838:     	cmpq	%r15, %r14
14017a83b:     	setne	%cl
14017a83e:     	testb	%cl, %al
14017a840:     	je	0x14017a881 <.text+0x179881>
14017a842:     	cmpq	$0x37, %r14
14017a846:     	ja	0x14017a865 <.text+0x179865>
14017a848:     	testq	%r14, %r14
14017a84b:     	je	0x14017a85e <.text+0x17985e>
14017a84d:     	movl	$0x8, %r8d
14017a853:     	movq	%rbx, %rcx
14017a856:     	movq	%r14, %rdx
14017a859:     	callq	0x1400021d0 <.text+0x11d0>
14017a85e:     	movl	$0x8, %ebx
14017a863:     	jmp	0x14017a881 <.text+0x179881>
14017a865:     	movl	$0x8, %r8d
14017a86b:     	movq	%rbx, %rcx
14017a86e:     	movq	%r14, %rdx
14017a871:     	movq	%r15, %r9
14017a874:     	callq	0x1400021e0 <.text+0x11e0>
14017a879:     	movq	%rax, %rbx
14017a87c:     	testq	%rax, %rax
14017a87f:     	je	0x14017a8a0 <.text+0x1798a0>
14017a881:     	movq	%rdi, (%rsi)
14017a884:     	movq	%rbx, 0x8(%rsi)
14017a888:     	movq	%r13, 0x10(%rsi)
14017a88c:     	movq	%rsi, %rax
14017a88f:     	addq	$0x78, %rsp
14017a893:     	popq	%rbx
14017a894:     	popq	%rdi
14017a895:     	popq	%rsi
14017a896:     	popq	%r12
14017a898:     	popq	%r13
14017a89a:     	popq	%r14
14017a89c:     	popq	%r15
14017a89e:     	popq	%rbp
14017a89f:     	retq
14017a8a0:     	movl	$0x8, %ecx
14017a8a5:     	movq	%r15, %rdx
14017a8a8:     	callq	0x145903781 <.text+0x5902781>
14017a8ad:     	nop
14017a8ae:     	ud2
