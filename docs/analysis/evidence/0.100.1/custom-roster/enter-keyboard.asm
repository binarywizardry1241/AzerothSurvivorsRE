
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005f670:     	pushq	%r15
14005f672:     	pushq	%r14
14005f674:     	pushq	%r13
14005f676:     	pushq	%r12
14005f678:     	pushq	%rsi
14005f679:     	pushq	%rdi
14005f67a:     	pushq	%rbp
14005f67b:     	pushq	%rbx
14005f67c:     	subq	$0x68, %rsp
14005f680:     	movaps	%xmm7, 0x50(%rsp)
14005f685:     	movaps	%xmm6, 0x40(%rsp)
14005f68a:     	movq	0xe8(%rsp), %rax
14005f692:     	movq	0xe0(%rsp), %rcx
14005f69a:     	movq	0xd8(%rsp), %r10
14005f6a2:     	movq	0xd0(%rsp), %r11
14005f6aa:     	movq	(%rdx), %rsi
14005f6ad:     	movq	0x10(%rdx), %r15
14005f6b1:     	movl	0x1c(%rdx), %r12d
14005f6b5:     	movq	(%r8), %rbx
14005f6b8:     	movq	0x10(%r8), %rdx
14005f6bc:     	movq	%rdx, 0x30(%rsp)
14005f6c1:     	movl	0x1c(%r8), %edx
14005f6c5:     	movl	%edx, 0x20(%rsp)
14005f6c9:     	movq	(%r9), %r13
14005f6cc:     	movq	(%r11), %r14
14005f6cf:     	movq	(%r10), %rdi
14005f6d2:     	movq	(%rcx), %rbp
14005f6d5:     	movq	(%rax), %rax
14005f6d8:     	movq	%rax, 0x38(%rsp)
14005f6dd:     	cmpb	$0x0, 0x10(%rbx)
14005f6e1:     	jne	0x14005f6f7 <.text+0x5e6f7>
14005f6e3:     	cmpb	$0x0, 0xd(%rbx)
14005f6e7:     	jne	0x14005f724 <.text+0x5e724>
14005f6e9:     	cmpl	$0x1, (%rbx)
14005f6ec:     	je	0x14005f7fe <.text+0x5e7fe>
14005f6f2:     	jmp	0x14005f8db <.text+0x5e8db>
14005f6f7:     	movl	%r12d, (%r15)
14005f6fa:     	movl	$0x3a, 0x24(%rsp)
14005f702:     	leaq	0x24(%rsp), %rdx
14005f707:     	movq	%rsi, %rcx
14005f70a:     	callq	0x140038960 <.text+0x37960>
14005f70f:     	movq	0x30(%rsp), %rax
14005f714:     	movl	0x20(%rsp), %ecx
14005f718:     	movl	%ecx, (%rax)
14005f71a:     	movb	$0x0, 0x10(%rbx)
14005f71e:     	cmpb	$0x0, 0xd(%rbx)
14005f722:     	je	0x14005f6e9 <.text+0x5e6e9>
14005f724:     	movl	$0x3a, 0x24(%rsp)
14005f72c:     	cmpq	$0x0, 0x38(%rsi)
14005f731:     	je	0x14005f7ae <.text+0x5e7ae>
14005f733:     	leaq	0x20(%rsi), %rcx
14005f737:     	movabsq	$-0x55a9d3bfc5f619c, %rdx # imm = 0xFAA562C403A09E64
14005f741:     	leaq	0x24(%rsp), %r8
14005f746:     	callq	0x140031f60 <.text+0x30f60>
14005f74b:     	testq	%rax, %rax
14005f74e:     	jne	0x14005f775 <.text+0x5e775>
14005f750:     	movl	$0x66, 0x24(%rsp)
14005f758:     	movabsq	$0x1f9deda910e0036f, %rdx # imm = 0x1F9DEDA910E0036F
14005f762:     	leaq	0x24(%rsp), %r8
14005f767:     	leaq	0x20(%rsi), %rcx
14005f76b:     	callq	0x140031f60 <.text+0x30f60>
14005f770:     	testq	%rax, %rax
14005f773:     	je	0x14005f7ae <.text+0x5e7ae>
14005f775:     	cmpb	$0x0, 0x72(%r13)
14005f77a:     	jne	0x14005f7ae <.text+0x5e7ae>
14005f77c:     	cmpb	$0x0, (%rbp)
14005f780:     	jne	0x14005f7ae <.text+0x5e7ae>
14005f782:     	cmpb	$0x0, 0x1a8(%r14)
14005f78a:     	jne	0x14005f7ae <.text+0x5e7ae>
14005f78c:     	cmpb	$0x0, (%rdi)
14005f78f:     	jne	0x14005f7ae <.text+0x5e7ae>
14005f791:     	movq	0x30(%rsp), %rax
14005f796:     	movl	0x20(%rsp), %ecx
14005f79a:     	movl	%ecx, (%rax)
14005f79c:     	cmpb	$0x0, (%rbx)
14005f79f:     	jne	0x14005f7ae <.text+0x5e7ae>
14005f7a1:     	movabsq	$-0x407fffffffffffff, %rax # imm = 0xBF80000000000001
14005f7ab:     	movq	%rax, (%rbx)
14005f7ae:     	movl	$0x3a, 0x24(%rsp)
14005f7b6:     	movl	%r12d, (%r15)
14005f7b9:     	leaq	0x24(%rsp), %rdi
14005f7be:     	movq	%rsi, %rcx
14005f7c1:     	movq	%rdi, %rdx
14005f7c4:     	callq	0x1400386d0 <.text+0x376d0>
14005f7c9:     	movl	$0x66, 0x24(%rsp)
14005f7d1:     	movl	%r12d, (%r15)
14005f7d4:     	movq	%rsi, %rcx
14005f7d7:     	movq	%rdi, %rdx
14005f7da:     	callq	0x1400386d0 <.text+0x376d0>
14005f7df:     	movl	$0x73, 0x24(%rsp)
14005f7e7:     	movl	%r12d, (%r15)
14005f7ea:     	movq	%rsi, %rcx
14005f7ed:     	movq	%rdi, %rdx
14005f7f0:     	callq	0x1400386d0 <.text+0x376d0>
14005f7f5:     	cmpl	$0x1, (%rbx)
14005f7f8:     	jne	0x14005f8db <.text+0x5e8db>
14005f7fe:     	movss	0x4(%rbx), %xmm6
14005f803:     	xorps	%xmm0, %xmm0
14005f806:     	ucomiss	%xmm0, %xmm6
14005f809:     	jb	0x14005f8db <.text+0x5e8db>
14005f80f:     	movq	0x38(%rsp), %rax
14005f814:     	movss	0x5c(%rax), %xmm7
14005f819:     	cmpb	$0x0, 0xe(%rbx)
14005f81d:     	je	0x14005f8bd <.text+0x5e8bd>
14005f823:     	cmpb	$0x1, 0xf(%rbx)
14005f827:     	jne	0x14005f8bd <.text+0x5e8bd>
14005f82d:     	movq	0x30(%rsp), %rax
14005f832:     	movl	0x20(%rsp), %ecx
14005f836:     	movl	%ecx, (%rax)
14005f838:     	movb	$0x0, 0xd(%rbx)
14005f83c:     	movaps	%xmm7, %xmm0
14005f83f:     	subss	0x8(%rbx), %xmm0
14005f844:     	ucomiss	0x58a7c4d(%rip), %xmm0  # 0x145907498
14005f84b:     	jbe	0x14005f899 <.text+0x5e899>
14005f84d:     	movq	0x30(%rsp), %rax
14005f852:     	movl	0x20(%rsp), %ecx
14005f856:     	movl	%ecx, (%rax)
14005f858:     	movss	%xmm7, 0x8(%rbx)
14005f85d:     	movl	%r12d, (%r15)
14005f860:     	movl	$0x3a, 0x24(%rsp)
14005f868:     	leaq	0x24(%rsp), %rdx
14005f86d:     	movq	%rsi, %rcx
14005f870:     	callq	0x140038240 <.text+0x37240>
14005f875:     	testb	%al, %al
14005f877:     	jne	0x14005f88a <.text+0x5e88a>
14005f879:     	addq	$0x20, %rsi
14005f87d:     	leaq	0x24(%rsp), %rdx
14005f882:     	movq	%rsi, %rcx
14005f885:     	callq	0x140038240 <.text+0x37240>
14005f88a:     	movq	0x30(%rsp), %rax
14005f88f:     	movl	0x20(%rsp), %ecx
14005f893:     	movl	%ecx, (%rax)
14005f895:     	movb	$0x1, 0x10(%rbx)
14005f899:     	subss	%xmm6, %xmm7
14005f89d:     	ucomiss	0x58b3a1c(%rip), %xmm7  # 0x1459132c0
14005f8a4:     	jbe	0x14005f8db <.text+0x5e8db>
14005f8a6:     	movl	$0x0, (%rbx)
14005f8ac:     	movq	0x30(%rsp), %rax
14005f8b1:     	movl	0x20(%rsp), %ecx
14005f8b5:     	movl	%ecx, (%rax)
14005f8b7:     	movb	$0x1, 0xd(%rbx)
14005f8bb:     	jmp	0x14005f8db <.text+0x5e8db>
14005f8bd:     	subss	%xmm6, %xmm7
14005f8c1:     	ucomiss	0x58b39f8(%rip), %xmm7  # 0x1459132c0
14005f8c8:     	jbe	0x14005f8db <.text+0x5e8db>
14005f8ca:     	movq	0x30(%rsp), %rax
14005f8cf:     	movl	0x20(%rsp), %ecx
14005f8d3:     	movl	%ecx, (%rax)
14005f8d5:     	movl	$0x0, (%rbx)
14005f8db:     	movaps	0x40(%rsp), %xmm6
14005f8e0:     	movaps	0x50(%rsp), %xmm7
14005f8e5:     	addq	$0x68, %rsp
14005f8e9:     	popq	%rbx
14005f8ea:     	popq	%rbp
14005f8eb:     	popq	%rdi
14005f8ec:     	popq	%rsi
14005f8ed:     	popq	%r12
14005f8ef:     	popq	%r13
14005f8f1:     	popq	%r14
14005f8f3:     	popq	%r15
14005f8f5:     	retq
