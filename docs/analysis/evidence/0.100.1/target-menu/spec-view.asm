
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14542e5c0:     	pushq	%r15
14542e5c2:     	pushq	%r14
14542e5c4:     	pushq	%r12
14542e5c6:     	pushq	%rsi
14542e5c7:     	pushq	%rdi
14542e5c8:     	pushq	%rbp
14542e5c9:     	pushq	%rbx
14542e5ca:     	subq	$0x40, %rsp
14542e5ce:     	movq	0x80(%rdx), %rax
14542e5d5:     	movq	0x88(%rdx), %r10
14542e5dc:     	shlq	$0x4, %r10
14542e5e0:     	leaq	(%r10,%r10,4), %r10
14542e5e4:     	xorl	%r11d, %r11d
14542e5e7:     	xorl	%esi, %esi
14542e5e9:     	nopl	(%rax)
14542e5f0:     	cmpq	%rsi, %r10
14542e5f3:     	je	0x14542e608 <.text+0x542d608>
14542e5f5:     	leaq	0x50(%rsi), %rdi
14542e5f9:     	cmpb	%r8b, (%rax,%rsi)
14542e5fd:     	movq	%rdi, %rsi
14542e600:     	jne	0x14542e5f0 <.text+0x542d5f0>
14542e602:     	movzbl	-0x4f(%rax,%rdi), %r11d
14542e608:     	cmpq	%r11, %r9
14542e60b:     	jne	0x14542e678 <.text+0x542d678>
14542e60d:     	movq	0x68(%rdx), %rax
14542e611:     	movq	0x70(%rdx), %r9
14542e615:     	shlq	$0x5, %r9
14542e619:     	xorl	%edx, %edx
14542e61b:     	movq	%rax, %r10
14542e61e:     	nop
14542e620:     	cmpq	%rdx, %r9
14542e623:     	je	0x14542e761 <.text+0x542d761>
14542e629:     	addq	$0x20, %rdx
14542e62d:     	cmpb	%r8b, 0x4(%r10)
14542e631:     	leaq	0x20(%r10), %r10
14542e635:     	jne	0x14542e620 <.text+0x542d620>
14542e637:     	movq	-0x8(%rax,%rdx), %r15
14542e63c:     	movq	%r15, %rsi
14542e63f:     	shlq	$0x4, %rsi
14542e643:     	movq	%r15, %r8
14542e646:     	shrq	$0x3c, %r8
14542e64a:     	setne	%r8b
14542e64e:     	movabsq	$0x7ffffffffffffff8, %r9 # imm = 0x7FFFFFFFFFFFFFF8
14542e658:     	cmpq	%r9, %rsi
14542e65b:     	seta	%r9b
14542e65f:     	orb	%r8b, %r9b
14542e662:     	je	0x14542e78a <.text+0x542d78a>
14542e668:     	xorl	%r14d, %r14d
14542e66b:     	movq	%r14, %rcx
14542e66e:     	movq	%rsi, %rdx
14542e671:     	callq	0x14590379b <.text+0x590279b>
14542e676:     	ud2
14542e678:     	movq	0x68(%rdx), %r11
14542e67c:     	movq	0x70(%rdx), %rsi
14542e680:     	shlq	$0x5, %rsi
14542e684:     	xorl	%edx, %edx
14542e686:     	xorl	%edi, %edi
14542e688:     	nopl	(%rax,%rax)
14542e690:     	cmpq	%rdi, %rsi
14542e693:     	je	0x14542e6a8 <.text+0x542d6a8>
14542e695:     	leaq	0x20(%rdi), %rbx
14542e699:     	cmpb	%r8b, 0x4(%r11,%rdi)
14542e69e:     	movq	%rbx, %rdi
14542e6a1:     	jne	0x14542e690 <.text+0x542d690>
14542e6a3:     	movl	-0x20(%r11,%rbx), %edx
14542e6a8:     	movl	$0x6e, %r11d
14542e6ae:     	movl	$0x2, %esi
14542e6b3:     	nopw	%cs:(%rax,%rax)
14542e6c0:     	leal	-0x1e(%r11), %edi
14542e6c4:     	subl	%edi, %edx
14542e6c6:     	jb	0x14542e6ec <.text+0x542d6ec>
14542e6c8:     	leal	-0xf(%r11), %edi
14542e6cc:     	subl	%edi, %edx
14542e6ce:     	jb	0x14542e6f1 <.text+0x542d6f1>
14542e6d0:     	subl	%r11d, %edx
14542e6d3:     	jb	0x14542e6f3 <.text+0x542d6f3>
14542e6d5:     	addl	$0x2d, %r11d
14542e6d9:     	addl	$0x3, %esi
14542e6dc:     	cmpl	$0x36b, %r11d           # imm = 0x36B
14542e6e3:     	jne	0x14542e6c0 <.text+0x542d6c0>
14542e6e5:     	movl	$0x33, %esi
14542e6ea:     	jmp	0x14542e6f3 <.text+0x542d6f3>
14542e6ec:     	addl	$-0x2, %esi
14542e6ef:     	jmp	0x14542e6f3 <.text+0x542d6f3>
14542e6f1:     	decl	%esi
14542e6f3:     	xorl	%r11d, %r11d
14542e6f6:     	nopw	%cs:(%rax,%rax)
14542e700:     	cmpq	%r11, %r10
14542e703:     	je	0x14542e761 <.text+0x542d761>
14542e705:     	leaq	0x50(%r11), %rdx
14542e709:     	cmpb	%r8b, (%rax,%r11)
14542e70d:     	movq	%rdx, %r11
14542e710:     	jne	0x14542e700 <.text+0x542d700>
14542e712:     	cmpq	$0x3, %r9
14542e716:     	jae	0x14542e761 <.text+0x542d761>
14542e718:     	leaq	(%r9,%r9,2), %r9
14542e71c:     	leaq	(%rax,%r9,8), %rax
14542e720:     	movq	-0x38(%rdx,%rax), %r15
14542e725:     	movq	%r15, %rdi
14542e728:     	shlq	$0x4, %rdi
14542e72c:     	movq	%r15, %r9
14542e72f:     	shrq	$0x3c, %r9
14542e733:     	setne	%r9b
14542e737:     	movabsq	$0x7ffffffffffffff8, %r10 # imm = 0x7FFFFFFFFFFFFFF8
14542e741:     	cmpq	%r10, %rdi
14542e744:     	seta	%r10b
14542e748:     	orb	%r9b, %r10b
14542e74b:     	je	0x14542e7eb <.text+0x542d7eb>
14542e751:     	xorl	%r14d, %r14d
14542e754:     	movq	%r14, %rcx
14542e757:     	movq	%rdi, %rdx
14542e75a:     	callq	0x14590379b <.text+0x590279b>
14542e75f:     	ud2
14542e761:     	movq	$0x0, (%rcx)
14542e768:     	movq	$0x8, 0x8(%rcx)
14542e770:     	movq	$0x0, 0x10(%rcx)
14542e778:     	movq	%rcx, %rax
14542e77b:     	addq	$0x40, %rsp
14542e77f:     	popq	%rbx
14542e780:     	popq	%rbp
14542e781:     	popq	%rdi
14542e782:     	popq	%rsi
14542e783:     	popq	%r12
14542e785:     	popq	%r14
14542e787:     	popq	%r15
14542e789:     	retq
14542e78a:     	movq	-0x10(%rax,%rdx), %rdi
14542e78f:     	testq	%rsi, %rsi
14542e792:     	je	0x14542e827 <.text+0x542d827>
14542e798:     	movq	%rcx, %r12
14542e79b:     	callq	0x140002200 <.text+0x1200>
14542e7a0:     	movl	$0x8, %r14d
14542e7a6:     	movl	$0x8, %edx
14542e7ab:     	movq	%rsi, %rcx
14542e7ae:     	callq	0x1400021c0 <.text+0x11c0>
14542e7b3:     	testq	%rax, %rax
14542e7b6:     	je	0x14542e66b <.text+0x542d66b>
14542e7bc:     	movq	%rax, %rbx
14542e7bf:     	movq	%r15, %r14
14542e7c2:     	movq	%r12, %rcx
14542e7c5:     	testq	%r15, %r15
14542e7c8:     	je	0x14542e7de <.text+0x542d7de>
14542e7ca:     	movq	%rcx, %r12
14542e7cd:     	movq	%rbx, %rcx
14542e7d0:     	movq	%rdi, %rdx
14542e7d3:     	movq	%rsi, %r8
14542e7d6:     	callq	0x1457731ed <.text+0x57721ed>
14542e7db:     	movq	%r12, %rcx
14542e7de:     	movq	%r14, (%rcx)
14542e7e1:     	movq	%rbx, 0x8(%rcx)
14542e7e5:     	movq	%r15, 0x10(%rcx)
14542e7e9:     	jmp	0x14542e778 <.text+0x542d778>
14542e7eb:     	movq	-0x40(%rdx,%rax), %rbx
14542e7f0:     	testq	%rdi, %rdi
14542e7f3:     	je	0x14542e836 <.text+0x542d836>
14542e7f5:     	movl	%r8d, %ebp
14542e7f8:     	movq	%rcx, %r12
14542e7fb:     	callq	0x140002200 <.text+0x1200>
14542e800:     	movl	$0x8, %r14d
14542e806:     	movl	$0x8, %edx
14542e80b:     	movq	%rdi, %rcx
14542e80e:     	callq	0x1400021c0 <.text+0x11c0>
14542e813:     	testq	%rax, %rax
14542e816:     	je	0x14542e754 <.text+0x542d754>
14542e81c:     	movq	%r15, %rdx
14542e81f:     	movq	%r12, %rcx
14542e822:     	movl	%ebp, %r8d
14542e825:     	jmp	0x14542e83d <.text+0x542d83d>
14542e827:     	movl	$0x8, %ebx
14542e82c:     	xorl	%r14d, %r14d
14542e82f:     	testq	%r15, %r15
14542e832:     	jne	0x14542e7ca <.text+0x542d7ca>
14542e834:     	jmp	0x14542e7de <.text+0x542d7de>
14542e836:     	movl	$0x8, %eax
14542e83b:     	xorl	%edx, %edx
14542e83d:     	movq	%rdx, 0x28(%rsp)
14542e842:     	movq	%rax, 0x30(%rsp)
14542e847:     	movq	$0x0, 0x38(%rsp)
14542e850:     	testq	%r15, %r15
14542e853:     	je	0x14542e874 <.text+0x542d874>
14542e855:     	movq	%rcx, %r14
14542e858:     	movq	%rax, %rcx
14542e85b:     	movq	%rbx, %rdx
14542e85e:     	movl	%r8d, %ebx
14542e861:     	movq	%rdi, %r8
14542e864:     	callq	0x1457731ed <.text+0x57721ed>
14542e869:     	movl	%ebx, %r8d
14542e86c:     	movq	%r14, %rcx
14542e86f:     	movq	%r15, 0x38(%rsp)
14542e874:     	leaq	0x28(%rsp), %rdx
14542e879:     	movq	%rcx, %rdi
14542e87c:     	movl	%esi, %r9d
14542e87f:     	callq	0x145483fc0 <.text+0x5482fc0>
14542e884:     	movq	%rdi, %rcx
14542e887:     	jmp	0x14542e778 <.text+0x542d778>
