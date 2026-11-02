
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b45c0:     	pushq	%rbp
1459b45c1:     	pushq	%r15
1459b45c3:     	pushq	%r14
1459b45c5:     	pushq	%r13
1459b45c7:     	pushq	%r12
1459b45c9:     	pushq	%rsi
1459b45ca:     	pushq	%rdi
1459b45cb:     	pushq	%rbx
1459b45cc:     	subq	$0x298, %rsp            # imm = 0x298
1459b45d3:     	leaq	0x80(%rsp), %rbp
1459b45db:     	movdqa	%xmm7, 0x200(%rbp)
1459b45e3:     	movaps	%xmm6, 0x1f0(%rbp)
1459b45ea:     	movq	$-0x2, 0x1e8(%rbp)
1459b45f5:     	movq	%rdx, %r8
1459b45f8:     	movq	(%rcx), %rsi
1459b45fb:     	movq	0x8(%rcx), %rax
1459b45ff:     	movq	(%rdx), %rdx
1459b4602:     	movq	0x8(%r8), %r9
1459b4606:     	cmpq	%rax, %rsi
1459b4609:     	je	0x1459b47b1 <.text+0x59b37b1>
1459b460f:     	movq	%rdx, 0x1d8(%rbp)
1459b4616:     	movq	0x10(%rcx), %r10
1459b461a:     	subq	%rsi, %rax
1459b461d:     	shrq	$0x3, %rax
1459b4621:     	movabsq	$0x2492492492492493, %rdx # imm = 0x2492492492492493
1459b462b:     	mulq	%rdx
1459b462e:     	movq	%r10, 0x1b0(%rbp)
1459b4635:     	leaq	0xc8(%r10), %rax
1459b463c:     	movq	%rax, 0x1b8(%rbp)
1459b4643:     	movl	$0xad0, %eax            # imm = 0xAD0
1459b4648:     	addq	0x18(%rcx), %rax
1459b464c:     	movq	%rax, 0x1c0(%rbp)
1459b4653:     	movq	%r9, 0x1e0(%rbp)
1459b465a:     	imulq	$0xd0, %r9, %r15
1459b4661:     	addq	0x10(%r8), %r15
1459b4665:     	negq	%rdx
1459b4668:     	movq	%rdx, 0x1c8(%rbp)
1459b466f:     	addq	$0x33, %rsi
1459b4673:     	xorl	%eax, %eax
1459b4675:     	nopw	%cs:(%rax,%rax)
1459b4680:     	movq	%rax, 0x1d0(%rbp)
1459b4687:     	movq	-0x2b(%rsi), %r12
1459b468b:     	movups	-0x23(%rsi), %xmm6
1459b468f:     	movb	-0x3(%rsi), %r14b
1459b4693:     	movb	-0x2(%rsi), %dil
1459b4697:     	movb	-0x1(%rsi), %r13b
1459b469b:     	movzbl	0x4(%rsi), %eax
1459b469f:     	leaq	0x1a7(%rbp), %rcx
1459b46a6:     	movb	%al, 0x4(%rcx)
1459b46a9:     	movl	(%rsi), %eax
1459b46ab:     	movl	%eax, (%rcx)
1459b46ad:     	movl	-0x13(%rsi), %eax
1459b46b0:     	cmpl	$0x3c, %eax
1459b46b3:     	movl	$0x3c, %ebx
1459b46b8:     	cmovbl	%eax, %ebx
1459b46bb:     	testl	%eax, %eax
1459b46bd:     	movl	$0x1, %eax
1459b46c2:     	cmovel	%eax, %ebx
1459b46c5:     	movq	0x1b0(%rbp), %rax
1459b46cc:     	movq	0xc0(%rax), %xmm7
1459b46d4:     	movq	0x1b8(%rbp), %rdx
1459b46db:     	movl	0x8(%rdx), %eax
1459b46de:     	movl	%eax, -0x7(%rcx)
1459b46e1:     	movq	(%rdx), %rax
1459b46e4:     	movq	%rax, -0xf(%rcx)
1459b46e8:     	leaq	-0x54(%rbp), %rcx
1459b46ec:     	movq	0x1c0(%rbp), %rdx
1459b46f3:     	movl	%edi, %r8d
1459b46f6:     	movl	%r14d, %r9d
1459b46f9:     	callq	0x14588c920 <.text+0x588b920>
1459b46fe:     	nop
1459b46ff:     	leaq	-0x54(%rbp), %rax
1459b4703:     	movq	%rax, 0x20(%rsp)
1459b4708:     	leaq	0x94(%rbp), %rcx
1459b470f:     	movl	%r14d, %edx
1459b4712:     	movl	%edi, %r8d
1459b4715:     	leaq	0x44(%rbp), %r9
1459b4719:     	callq	0x1458bd260 <.text+0x58bc260>
1459b471e:     	nop
1459b471f:     	leaq	0xf8(%rbp), %rcx
1459b4726:     	leaq	0x94(%rbp), %rdx
1459b472d:     	callq	0x140070120 <.text+0x6f120>
1459b4732:     	nop
1459b4733:     	movq	%r12, 0xe0(%rbp)
1459b473a:     	movups	%xmm6, 0xe8(%rbp)
1459b4741:     	movb	%r14b, 0x1a4(%rbp)
1459b4748:     	movb	%dil, 0x1a5(%rbp)
1459b474f:     	movb	%r13b, 0x1a6(%rbp)
1459b4756:     	movb	%bl, 0x1ac(%rbp)
1459b475c:     	pshufd	$0xe1, %xmm7, %xmm0     # xmm0 = xmm7[1,0,2,3]
1459b4761:     	movq	%xmm0, 0x190(%rbp)
1459b4769:     	movl	$0xd0, %r8d
1459b476f:     	movq	%r15, %rcx
1459b4772:     	leaq	0xe0(%rbp), %rdx
1459b4779:     	callq	0x145bc977b <.text+0x5bc877b>
1459b477e:     	movq	0x1d0(%rbp), %rax
1459b4785:     	decq	%rax
1459b4788:     	addq	$0xd0, %r15
1459b478f:     	addq	$0x38, %rsi
1459b4793:     	cmpq	%rax, 0x1c8(%rbp)
1459b479a:     	jne	0x1459b4680 <.text+0x59b3680>
1459b47a0:     	movq	0x1e0(%rbp), %r9
1459b47a7:     	subq	%rax, %r9
1459b47aa:     	movq	0x1d8(%rbp), %rdx
1459b47b1:     	movq	%r9, (%rdx)
1459b47b4:     	movaps	0x1f0(%rbp), %xmm6
1459b47bb:     	movaps	0x200(%rbp), %xmm7
1459b47c2:     	addq	$0x298, %rsp            # imm = 0x298
1459b47c9:     	popq	%rbx
1459b47ca:     	popq	%rdi
1459b47cb:     	popq	%rsi
1459b47cc:     	popq	%r12
1459b47ce:     	popq	%r13
1459b47d0:     	popq	%r14
1459b47d2:     	popq	%r15
1459b47d4:     	popq	%rbp
1459b47d5:     	retq
