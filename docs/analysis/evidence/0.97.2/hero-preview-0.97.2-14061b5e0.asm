
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14061b5e0:     	pushq	%rbp
14061b5e1:     	pushq	%r15
14061b5e3:     	pushq	%r14
14061b5e5:     	pushq	%r13
14061b5e7:     	pushq	%r12
14061b5e9:     	pushq	%rsi
14061b5ea:     	pushq	%rdi
14061b5eb:     	pushq	%rbx
14061b5ec:     	subq	$0xd8, %rsp
14061b5f3:     	leaq	0x80(%rsp), %rbp
14061b5fb:     	movq	$-0x2, 0x50(%rbp)
14061b603:     	movq	(%rcx), %r14
14061b606:     	movq	0x8(%rcx), %r15
14061b60a:     	movq	(%rdx), %rax
14061b60d:     	movq	0x8(%rdx), %r8
14061b611:     	cmpq	%r15, %r14
14061b614:     	je	0x14061b745 <.text+0x61a745>
14061b61a:     	movq	%rax, 0x38(%rbp)
14061b61e:     	movq	0x10(%rcx), %rax
14061b622:     	movq	%rax, 0x10(%rbp)
14061b626:     	movq	0x18(%rcx), %rdi
14061b62a:     	movq	0x10(%rdx), %rax
14061b62e:     	subq	%r14, %r15
14061b631:     	shrq	$0x3, %r15
14061b635:     	leaq	-0x44(%rbp), %r12
14061b639:     	leaq	-0x8(%rbp), %r13
14061b63d:     	movq	%r8, 0x40(%rbp)
14061b641:     	imulq	$0x70, %r8, %rcx
14061b645:     	leaq	(%rcx,%rax), %rbx
14061b649:     	addq	$0x6c, %rbx
14061b64d:     	xorl	%ecx, %ecx
14061b64f:     	nop
14061b650:     	movq	(%r14,%rcx,8), %rsi
14061b654:     	movzbl	(%rsi), %edx
14061b657:     	cmpb	$0x1, %dl
14061b65a:     	movq	%rcx, 0x30(%rbp)
14061b65e:     	movb	%dl, 0x4f(%rbp)
14061b661:     	jne	0x14061b680 <.text+0x61a680>
14061b663:     	movups	0x1(%rsi), %xmm0
14061b667:     	leaq	0x20(%rbp), %rax
14061b66b:     	movups	%xmm0, -0x7(%rax)
14061b66f:     	movb	$0x1, %al
14061b671:     	jmp	0x14061b698 <.text+0x61a698>
14061b673:     	nopw	%cs:(%rax,%rax)
14061b680:     	movq	0x8(%rsi), %rax
14061b684:     	lock
14061b685:     	incq	(%rax)
14061b688:     	jle	0x14061b75c <.text+0x61a75c>
14061b68e:     	movq	0x8(%rsi), %rax
14061b692:     	movq	%rax, 0x20(%rbp)
14061b696:     	xorl	%eax, %eax
14061b698:     	movb	%al, 0x18(%rbp)
14061b69b:     	leaq	0x18(%rsi), %r8
14061b69f:     	leaq	-0x38(%rbp), %rcx
14061b6a3:     	movq	0x10(%rbp), %rdx
14061b6a7:     	movq	%rdi, %r9
14061b6aa:     	callq	0x14079da50 <.text+0x79ca50>
14061b6af:     	nop
14061b6b0:     	movzwl	0x3c(%rsi), %eax
14061b6b4:     	movl	0x38(%rsi), %ecx
14061b6b7:     	movl	%ecx, 0x8(%r12)
14061b6bc:     	movq	0x30(%rsi), %rcx
14061b6c0:     	movq	%rcx, (%r12)
14061b6c4:     	movq	0x28(%rbp), %rcx
14061b6c8:     	movq	%rcx, -0x10(%rbp)
14061b6cc:     	movups	0x18(%rbp), %xmm0
14061b6d0:     	movaps	%xmm0, -0x20(%rbp)
14061b6d4:     	movq	-0x28(%rbp), %rcx
14061b6d8:     	movq	%rcx, 0x10(%r13)
14061b6dc:     	movups	-0x38(%rbp), %xmm0
14061b6e0:     	movups	%xmm0, (%r13)
14061b6e5:     	movaps	-0x20(%rbp), %xmm0
14061b6e9:     	movq	-0x10(%rbp), %rcx
14061b6ed:     	movq	-0x8(%rbp), %rdx
14061b6f1:     	movaps	(%rbp), %xmm1
14061b6f5:     	movups	%xmm1, -0x4c(%rbx)
14061b6f9:     	movq	%rcx, -0x5c(%rbx)
14061b6fd:     	movq	%rdx, -0x54(%rbx)
14061b701:     	movups	%xmm0, -0x6c(%rbx)
14061b705:     	movb	$0x2, -0x3c(%rbx)
14061b709:     	movb	$0x2, -0x24(%rbx)
14061b70d:     	movups	-0x5b(%rbp), %xmm0
14061b711:     	movups	-0x4b(%rbp), %xmm1
14061b715:     	movups	%xmm0, -0x23(%rbx)
14061b719:     	movups	%xmm1, -0x13(%rbx)
14061b71d:     	movl	-0x3c(%rbp), %ecx
14061b720:     	movl	%ecx, -0x4(%rbx)
14061b723:     	movw	%ax, (%rbx)
14061b726:     	movq	0x30(%rbp), %rcx
14061b72a:     	incq	%rcx
14061b72d:     	addq	$0x70, %rbx
14061b731:     	cmpq	%rcx, %r15
14061b734:     	jne	0x14061b650 <.text+0x61a650>
14061b73a:     	movq	0x40(%rbp), %r8
14061b73e:     	addq	%rcx, %r8
14061b741:     	movq	0x38(%rbp), %rax
14061b745:     	movq	%r8, (%rax)
14061b748:     	addq	$0xd8, %rsp
14061b74f:     	popq	%rbx
14061b750:     	popq	%rdi
14061b751:     	popq	%rsi
14061b752:     	popq	%r12
14061b754:     	popq	%r13
14061b756:     	popq	%r14
14061b758:     	popq	%r15
14061b75a:     	popq	%rbp
14061b75b:     	retq
14061b75c:     	ud2
