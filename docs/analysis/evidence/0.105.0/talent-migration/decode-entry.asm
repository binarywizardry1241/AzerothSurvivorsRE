
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459a6540:     	pushq	%r15
1459a6542:     	pushq	%r14
1459a6544:     	pushq	%r13
1459a6546:     	pushq	%r12
1459a6548:     	pushq	%rsi
1459a6549:     	pushq	%rdi
1459a654a:     	pushq	%rbp
1459a654b:     	pushq	%rbx
1459a654c:     	subq	$0x78, %rsp
1459a6550:     	cmpb	$0x0, 0x49(%rcx)
1459a6554:     	je	0x1459a655e <.text+0x59a555e>
1459a6556:     	xorl	%r15d, %r15d
1459a6559:     	jmp	0x1459a6787 <.text+0x59a5787>
1459a655e:     	movq	%rcx, %rsi
1459a6561:     	leaq	0x18(%rcx), %rdi
1459a6565:     	leaq	0x48(%rsp), %rbx
1459a656a:     	movabsq	$0x3a0000003a, %rbp     # imm = 0x3A0000003A
1459a6574:     	leaq	0x30(%rsp), %r14
1459a6579:     	jmp	0x1459a65aa <.text+0x59a55aa>
1459a657b:     	xorl	%eax, %eax
1459a657d:     	movzbl	0x72(%r15), %ecx
1459a6582:     	movzbl	%al, %edx
1459a6585:     	cmpb	%dl, %cl
1459a6587:     	cmovbl	%ecx, %edx
1459a658a:     	testb	%dl, %dl
1459a658c:     	jne	0x1459a6787 <.text+0x59a5787>
1459a6592:     	nopw	%cs:(%rax,%rax)
1459a65a0:     	cmpb	$0x1, 0x49(%rsi)
1459a65a4:     	je	0x1459a6784 <.text+0x59a5784>
1459a65aa:     	movq	(%rdi), %r12
1459a65ad:     	movq	%rbx, %rcx
1459a65b0:     	movq	%rdi, %rdx
1459a65b3:     	callq	0x1459a67a0 <.text+0x59a57a0>
1459a65b8:     	cmpl	$0x1, 0x48(%rsp)
1459a65bd:     	jne	0x1459a65e0 <.text+0x59a55e0>
1459a65bf:     	movq	0x50(%rsp), %r13
1459a65c4:     	movq	0x58(%rsp), %rax
1459a65c9:     	movq	0x8(%rsi), %rcx
1459a65cd:     	subq	%rcx, %r13
1459a65d0:     	addq	%rcx, %r12
1459a65d3:     	movq	%rax, 0x8(%rsi)
1459a65d7:     	jmp	0x1459a660a <.text+0x59a560a>
1459a65d9:     	nopl	(%rax)
1459a65e0:     	cmpb	$0x0, 0x49(%rsi)
1459a65e4:     	jne	0x1459a6556 <.text+0x59a5556>
1459a65ea:     	movb	$0x1, 0x49(%rsi)
1459a65ee:     	movq	0x8(%rsi), %r12
1459a65f2:     	movq	0x10(%rsi), %r13
1459a65f6:     	subq	%r12, %r13
1459a65f9:     	setne	%al
1459a65fc:     	orb	0x48(%rsi), %al
1459a65ff:     	cmpb	$0x1, %al
1459a6601:     	jne	0x1459a6556 <.text+0x59a5556>
1459a6607:     	addq	(%rdi), %r12
1459a660a:     	movq	(%rsi), %r15
1459a660d:     	movq	%r12, 0x48(%rsp)
1459a6612:     	movq	%r13, 0x50(%rsp)
1459a6617:     	movq	$0x0, 0x58(%rsp)
1459a6620:     	movq	%r13, 0x60(%rsp)
1459a6625:     	movb	$0x1, 0x70(%rsp)
1459a662a:     	movq	%rbp, 0x68(%rsp)
1459a662f:     	movq	%r14, %rcx
1459a6632:     	movq	%rbx, %rdx
1459a6635:     	callq	0x1459a67a0 <.text+0x59a57a0>
1459a663a:     	cmpl	$0x1, 0x30(%rsp)
1459a663f:     	jne	0x1459a65a0 <.text+0x59a55a0>
1459a6645:     	movq	0x38(%rsp), %rdx
1459a664a:     	movq	0x40(%rsp), %rax
1459a664f:     	movq	%rax, 0x28(%rsp)
1459a6654:     	movq	%rsi, %r14
1459a6657:     	movq	%rdi, %rsi
1459a665a:     	movq	%rbx, %rdi
1459a665d:     	movq	%rbp, %rbx
1459a6660:     	movzbl	(%r15), %ebp
1459a6664:     	movq	%r12, %rcx
1459a6667:     	callq	0x14006f550 <.text+0x6e550>
1459a666c:     	movq	%rdx, %r8
1459a666f:     	movl	%ebp, %ecx
1459a6671:     	movq	%rbx, %rbp
1459a6674:     	movq	%rdi, %rbx
1459a6677:     	movq	%rsi, %rdi
1459a667a:     	movq	%r14, %rsi
1459a667d:     	leaq	0x30(%rsp), %r14
1459a6682:     	movq	%rax, %rdx
1459a6685:     	callq	0x1458e6190 <.text+0x58e5190>
1459a668a:     	testq	%rdx, %rdx
1459a668d:     	je	0x1459a65a0 <.text+0x59a55a0>
1459a6693:     	movq	%rdx, %r15
1459a6696:     	movq	0x28(%rsp), %rax
1459a669b:     	addq	%rax, %r12
1459a669e:     	subq	%rax, %r13
1459a66a1:     	movq	%r12, %rcx
1459a66a4:     	movq	%r13, %rdx
1459a66a7:     	callq	0x14006f550 <.text+0x6e550>
1459a66ac:     	testq	%rdx, %rdx
1459a66af:     	je	0x1459a65a0 <.text+0x59a55a0>
1459a66b5:     	movq	%rax, %rcx
1459a66b8:     	cmpq	$0x1, %rdx
1459a66bc:     	jne	0x1459a66d8 <.text+0x59a56d8>
1459a66be:     	movzbl	(%rcx), %r8d
1459a66c2:     	cmpl	$0x2b, %r8d
1459a66c6:     	je	0x1459a65a0 <.text+0x59a55a0>
1459a66cc:     	cmpl	$0x2d, %r8d
1459a66d0:     	je	0x1459a65a0 <.text+0x59a55a0>
1459a66d6:     	jmp	0x1459a66dc <.text+0x59a56dc>
1459a66d8:     	movzbl	(%rcx), %r8d
1459a66dc:     	xorl	%eax, %eax
1459a66de:     	cmpb	$0x2b, %r8b
1459a66e2:     	sete	%al
1459a66e5:     	movq	%rdx, %r8
1459a66e8:     	subq	%rax, %r8
1459a66eb:     	addq	%rax, %rcx
1459a66ee:     	cmpq	$0x3, %r8
1459a66f2:     	jae	0x1459a6737 <.text+0x59a5737>
1459a66f4:     	testq	%r8, %r8
1459a66f7:     	je	0x1459a657b <.text+0x59a557b>
1459a66fd:     	movzbl	(%rcx), %eax
1459a6700:     	addl	$-0x30, %eax
1459a6703:     	cmpl	$0x9, %eax
1459a6706:     	ja	0x1459a65a0 <.text+0x59a55a0>
1459a670c:     	cmpq	$0x1, %r8
1459a6710:     	je	0x1459a657d <.text+0x59a557d>
1459a6716:     	movzbl	0x1(%rcx), %ecx
1459a671a:     	addl	$-0x30, %ecx
1459a671d:     	cmpl	$0x9, %ecx
1459a6720:     	ja	0x1459a65a0 <.text+0x59a55a0>
1459a6726:     	movzbl	%al, %eax
1459a6729:     	addl	%eax, %eax
1459a672b:     	leal	(%rax,%rax,4), %eax
1459a672e:     	addb	%al, %cl
1459a6730:     	movl	%ecx, %eax
1459a6732:     	jmp	0x1459a657d <.text+0x59a557d>
1459a6737:     	negq	%rax
1459a673a:     	addq	%rax, %rdx
1459a673d:     	negq	%rdx
1459a6740:     	xorl	%r8d, %r8d
1459a6743:     	xorl	%eax, %eax
1459a6745:     	movq	%rdx, %r9
1459a6748:     	addq	%r8, %r9
1459a674b:     	je	0x1459a657d <.text+0x59a557d>
1459a6751:     	movb	$0xa, %r9b
1459a6754:     	mulb	%r9b
1459a6757:     	jo	0x1459a65a0 <.text+0x59a55a0>
1459a675d:     	movzbl	(%rcx,%r8), %r10d
1459a6762:     	addl	$-0x30, %r10d
1459a6766:     	addb	%r10b, %al
1459a6769:     	setb	%r9b
1459a676d:     	cmpl	$0x9, %r10d
1459a6771:     	ja	0x1459a65a0 <.text+0x59a55a0>
1459a6777:     	incq	%r8
1459a677a:     	testb	%r9b, %r9b
1459a677d:     	je	0x1459a6745 <.text+0x59a5745>
1459a677f:     	jmp	0x1459a65a0 <.text+0x59a55a0>
1459a6784:     	xorl	%r15d, %r15d
1459a6787:     	movq	%r15, %rax
1459a678a:     	addq	$0x78, %rsp
1459a678e:     	popq	%rbx
1459a678f:     	popq	%rbp
1459a6790:     	popq	%rdi
1459a6791:     	popq	%rsi
1459a6792:     	popq	%r12
1459a6794:     	popq	%r13
1459a6796:     	popq	%r14
1459a6798:     	popq	%r15
1459a679a:     	retq
