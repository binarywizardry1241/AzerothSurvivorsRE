
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14016e4c7:     	movq	0x2b8(%rbp), %rax
14016e4ce:     	movzbl	0x32(%rax), %r12d
14016e4d3:     	xorl	%eax, %eax
14016e4d5:     	cmpl	$0x1, %r12d
14016e4d9:     	setne	%al
14016e4dc:     	incq	%rax
14016e4df:     	xorl	%r13d, %r13d
14016e4e2:     	testl	%r12d, %r12d
14016e4e5:     	cmovneq	%rax, %r13
14016e4e9:     	movb	%r12b, 0x306(%rbp)
14016e4f0:     	cmpl	$0x2, %r12d
14016e4f4:     	je	0x14016e50a <.text+0x16d50a>
14016e4f6:     	cmpl	$0x1, %r12d
14016e4fa:     	jne	0x14016e528 <.text+0x16d528>
14016e4fc:     	leaq	0x5c4842d(%rip), %rcx   # 0x145db6930
14016e503:     	movl	$0x7, %edx
14016e508:     	jmp	0x14016e534 <.text+0x16d534>
14016e50a:     	leaq	0x5c48426(%rip), %rcx   # 0x145db6937
14016e511:     	movl	$0x5, %edx
14016e516:     	movq	%rdi, %r8
14016e519:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14016e51e:     	movq	%rax, %r14
14016e521:     	testq	%rax, %rax
14016e524:     	jne	0x14016e54b <.text+0x16d54b>
14016e526:     	jmp	0x14016e544 <.text+0x16d544>
14016e528:     	leaq	0x5c4818e(%rip), %rcx   # 0x145db66bd
14016e52f:     	movl	$0x5, %edx
14016e534:     	movq	%r14, %r8
14016e537:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14016e53c:     	movq	%rax, %r14
14016e53f:     	testq	%rax, %rax
14016e542:     	jne	0x14016e54b <.text+0x16d54b>
14016e544:     	movq	0x7e6bd45(%rip), %r14   # 0x147fda290
14016e54b:     	cmpb	$0x4, (%r14)
14016e54f:     	jne	0x14016e56e <.text+0x16d56e>
14016e551:     	movq	0x10(%r14), %rdx
14016e555:     	movq	0x18(%r14), %r8
14016e559:     	shlq	$0x5, %r8
14016e55d:     	addq	%rdx, %r8
14016e560:     	leaq	0x198(%rbp), %rcx
14016e567:     	callq	0x140264110 <.text+0x263110>
14016e56c:     	jmp	0x14016e58f <.text+0x16d58f>
14016e56e:     	movq	$0x0, 0x198(%rbp)
14016e579:     	movq	$0x8, 0x1a0(%rbp)
14016e584:     	movq	$0x0, 0x1a8(%rbp)
14016e58f:     	movq	%r14, 0x178(%rbp)
14016e596:     	movsd	0x130(%rbp,%r13,8), %xmm0
14016e5a0:     	movsd	%xmm0, 0x220(%rbp)
14016e5a8:     	cmpb	$0x2, %r12b
14016e5ac:     	jne	0x14016e5fa <.text+0x16d5fa>
14016e5ae:     	leaq	0x5c48387(%rip), %rcx   # 0x145db693c
14016e5b5:     	movl	$0x4, %edx
14016e5ba:     	movq	%rdi, %r8
14016e5bd:     	callq	0x142ad39e0 <.text+0x2ad29e0>
14016e5c2:     	nop
14016e5c3:     	testq	%rax, %rax
14016e5c6:     	jne	0x14016e5cf <.text+0x16d5cf>
14016e5c8:     	movq	0x7e6bcc1(%rip), %rax   # 0x147fda290
14016e5cf:     	xorpd	%xmm0, %xmm0
14016e5d3:     	cmpb	$0x2, (%rax)
14016e5d6:     	jne	0x14016e603 <.text+0x16d603>
14016e5d8:     	movq	0x8(%rax), %rcx
14016e5dc:     	cmpq	$0x2, %rcx
14016e5e0:     	je	0x14016eaff <.text+0x16daff>
14016e5e6:     	cmpl	$0x1, %ecx
14016e5e9:     	jne	0x14016eb09 <.text+0x16db09>
14016e5ef:     	xorps	%xmm0, %xmm0
14016e5f2:     	cvtsi2sdq	0x10(%rax), %xmm0
14016e5f8:     	jmp	0x14016e603 <.text+0x16d603>
14016e5fa:     	movapd	%xmm7, %xmm0
14016e5fe:     	subsd	0x30(%rsi), %xmm0
14016e603:     	maxsd	0x5c2f7a5(%rip), %xmm0  # 0x145d9ddb0
14016e60b:     	movsd	%xmm0, 0x218(%rbp)
14016e613:     	movq	0x8(%r15), %rax
14016e617:     	movq	0x10(%r15), %rcx
14016e61b:     	movsd	0x220(%rbp), %xmm0
14016e623:     	leaq	(%rax,%r13,8), %rdx
14016e627:     	addq	$0x8, %rdx
14016e62b:     	shlq	$0x5, %rcx
14016e62f:     	xorl	%r8d, %r8d
14016e632:     	xorpd	%xmm6, %xmm6
14016e636:     	nopw	%cs:(%rax,%rax)
14016e640:     	cmpq	%r8, %rcx
14016e643:     	je	0x14016e672 <.text+0x16d672>
14016e645:     	movsd	(%rdx,%r8), %xmm1
14016e64b:     	addq	$0x20, %r8
14016e64f:     	ucomisd	%xmm1, %xmm0
14016e653:     	jb	0x14016e640 <.text+0x16d640>
14016e655:     	subsd	-0x20(%rax,%r8), %xmm7
14016e65c:     	ucomisd	0x5c2f74c(%rip), %xmm7  # 0x145d9ddb0
14016e664:     	jb	0x14016e672 <.text+0x16d672>
14016e666:     	subsd	%xmm1, %xmm0
14016e66a:     	divsd	%xmm7, %xmm0
14016e66e:     	movapd	%xmm0, %xmm6
