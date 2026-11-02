
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403d8300:     	pushq	%rbp
1403d8301:     	pushq	%r15
1403d8303:     	pushq	%r14
1403d8305:     	pushq	%rsi
1403d8306:     	pushq	%rdi
1403d8307:     	pushq	%rbx
1403d8308:     	subq	$0x2d8, %rsp            # imm = 0x2D8
1403d830f:     	leaq	0x80(%rsp), %rbp
1403d8317:     	movq	$-0x2, 0x250(%rbp)
1403d8322:     	movq	%rdx, %rdi
1403d8325:     	movq	%rcx, %rsi
1403d8328:     	movq	%rdx, %rcx
1403d832b:     	callq	0x14031df50 <.text+0x31cf50>
1403d8330:     	movq	%rax, %rbx
1403d8333:     	movq	%rdi, %rcx
1403d8336:     	callq	0x14032f0f0 <.text+0x32e0f0>
1403d833b:     	movq	%rax, %r14
1403d833e:     	movq	%rdi, %rcx
1403d8341:     	callq	0x14032ab00 <.text+0x329b00>
1403d8346:     	movq	%rbx, 0x230(%rbp)
1403d834d:     	movq	%r14, 0x238(%rbp)
1403d8354:     	movq	%rax, 0x240(%rbp)
1403d835b:     	movq	%rdi, %rcx
1403d835e:     	callq	0x14031df50 <.text+0x31cf50>
1403d8363:     	movq	%rax, %rbx
1403d8366:     	leaq	-0x60(%rbp), %r14
1403d836a:     	movq	%r14, %rcx
1403d836d:     	callq	0x144e7aad0 <.text+0x4e79ad0>
1403d8372:     	movb	$0x1, 0x24f(%rbp)
1403d8379:     	leaq	0x230(%rbp), %rcx
1403d8380:     	movq	%r14, %rdx
1403d8383:     	callq	0x1401b38d0 <.text+0x1b28d0>
1403d8388:     	nop
1403d8389:     	movb	$0x1, 0x24f(%rbp)
1403d8390:     	leaq	0x50(%rbp), %rcx
1403d8394:     	callq	0x144e7aad0 <.text+0x4e79ad0>
1403d8399:     	nop
1403d839a:     	movzbl	0xe1(%rbp), %eax
1403d83a1:     	cmpq	0x90(%rbp), %rbx
1403d83a8:     	jae	0x1403d849f <.text+0x3d749f>
1403d83ae:     	movq	0x80(%rbp), %rcx
1403d83b5:     	movq	%rbx, %rdx
1403d83b8:     	shrq	$0x6, %rdx
1403d83bc:     	movq	(%rcx,%rdx,8), %rcx
1403d83c0:     	btq	%rbx, %rcx
1403d83c4:     	sbbb	$0x0, %al
1403d83c6:     	jne	0x1403d84a7 <.text+0x3d74a7>
1403d83cc:     	leaq	0x50(%rbp), %rcx
1403d83d0:     	movq	%rbx, %rdx
1403d83d3:     	callq	0x144e741b0 <.text+0x4e731b0>
1403d83d8:     	nop
1403d83d9:     	leaq	-0x60(%rbp), %rcx
1403d83dd:     	leaq	0x50(%rbp), %rdx
1403d83e1:     	callq	0x144e74520 <.text+0x4e73520>
1403d83e6:     	nop
1403d83e7:     	movb	$0x1, %r14b
1403d83ea:     	cmpq	$0x0, 0x90(%rdi)
1403d83f2:     	je	0x1403d853a <.text+0x3d753a>
1403d83f8:     	movq	0x78(%rdi), %rax
1403d83fc:     	movq	0x80(%rdi), %rcx
1403d8403:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
1403d840d:     	xorl	%r8d, %r8d
1403d8410:     	movdqa	0x5a1d228(%rip), %xmm0  # 0x145df5640
1403d8418:     	pcmpeqd	%xmm1, %xmm1
1403d841c:     	movdqa	0x5a283dc(%rip), %xmm2  # 0x145e00800
1403d8424:     	andq	%rcx, %rdx
1403d8427:     	movdqu	(%rax,%rdx), %xmm3
1403d842c:     	movdqa	%xmm3, %xmm4
1403d8430:     	pcmpeqb	%xmm0, %xmm4
1403d8434:     	pmovmskb	%xmm4, %r9d
1403d8439:     	testl	%r9d, %r9d
1403d843c:     	je	0x1403d8480 <.text+0x3d7480>
1403d843e:     	tzcntl	%r9d, %r10d
1403d8443:     	addq	%rdx, %r10
1403d8446:     	andq	%rcx, %r10
1403d8449:     	negq	%r10
1403d844c:     	leaq	(%r10,%r10,2), %r10
1403d8450:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1403d8457:     	pcmpeqb	%xmm2, %xmm4
1403d845b:     	pmovmskb	%xmm4, %r11d
1403d8460:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1403d8467:     	je	0x1403d84e0 <.text+0x3d74e0>
1403d8469:     	leal	-0x1(%r9), %r10d
1403d846d:     	andw	%r9w, %r10w
1403d8471:     	movl	%r10d, %r9d
1403d8474:     	jne	0x1403d843e <.text+0x3d743e>
1403d8476:     	nopw	%cs:(%rax,%rax)
1403d8480:     	pcmpeqb	%xmm1, %xmm3
1403d8484:     	pmovmskb	%xmm3, %r9d
1403d8489:     	testl	%r9d, %r9d
1403d848c:     	jne	0x1403d853a <.text+0x3d753a>
1403d8492:     	addq	%r8, %rdx
1403d8495:     	addq	$0x10, %rdx
1403d8499:     	addq	$0x10, %r8
1403d849d:     	jmp	0x1403d8424 <.text+0x3d7424>
1403d849f:     	testb	%al, %al
1403d84a1:     	je	0x1403d83cc <.text+0x3d73cc>
1403d84a7:     	leaq	0x24e(%rbp), %rax
1403d84ae:     	movq	%rax, 0x100(%rbp)
1403d84b5:     	leaq	0x4c1ef24(%rip), %rax   # 0x144ff73e0 <.text+0x4ff63e0>
1403d84bc:     	movq	%rax, 0x108(%rbp)
1403d84c3:     	leaq	0x5a28496(%rip), %rcx   # 0x145e00960
1403d84ca:     	leaq	0x5a2856f(%rip), %r8    # 0x145e00a40
1403d84d1:     	leaq	0x100(%rbp), %rdx
1403d84d8:     	callq	0x145d93c80 <.text+0x5d92c80>
1403d84dd:     	nop
1403d84de:     	ud2
1403d84e0:     	leaq	(%rax,%r10,8), %rax
1403d84e4:     	movq	-0x8(%rax), %rax
1403d84e8:     	cmpq	0x218(%rdi), %rax
1403d84ef:     	jae	0x1403d853a <.text+0x3d753a>
1403d84f1:     	movq	0x210(%rdi), %rcx
1403d84f8:     	movq	(%rcx,%rax,8), %rcx
1403d84fc:     	testq	%rcx, %rcx
1403d84ff:     	je	0x1403d853a <.text+0x3d753a>
1403d8501:     	movq	0x1e0(%rdi), %rax
1403d8508:     	notq	%rcx
1403d850b:     	imulq	$0x38, %rcx, %rcx
1403d850f:     	cmpb	$0x1, 0x30(%rax,%rcx)
1403d8514:     	jne	0x1403d853a <.text+0x3d753a>
1403d8516:     	addq	%rcx, %rax
1403d8519:     	movq	0x10(%rax), %r14
1403d851d:     	leaq	-0x60(%rbp), %rdx
1403d8521:     	movq	%r14, %rcx
1403d8524:     	callq	0x144e03180 <.text+0x4e02180>
1403d8529:     	nop
1403d852a:     	leaq	0x40(%rdi), %rdx
1403d852e:     	movq	%r14, %rcx
1403d8531:     	callq	0x144e032e0 <.text+0x4e022e0>
1403d8536:     	nop
1403d8537:     	movl	%eax, %r14d
1403d853a:     	movq	0x5a0(%rdi), %r15
1403d8541:     	leaq	0x140(%rbp), %rcx
1403d8548:     	leaq	-0x60(%rbp), %rdx
1403d854c:     	movl	$0xb0, %r8d
1403d8552:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1403d8557:     	movq	%r15, 0x100(%rbp)
1403d855e:     	movl	$0x0, 0x108(%rbp)
1403d8568:     	movq	$0x10, 0x110(%rbp)
1403d8573:     	pxor	%xmm0, %xmm0
1403d8577:     	movdqu	%xmm0, 0x118(%rbp)
1403d857f:     	movq	$0x10, 0x128(%rbp)
1403d858a:     	movdqu	%xmm0, 0x130(%rbp)
1403d8592:     	movq	$0x0, 0x1f0(%rbp)
1403d859d:     	movq	$0x4, 0x1f8(%rbp)
1403d85a8:     	movq	$0x0, 0x200(%rbp)
1403d85b3:     	movb	%r14b, 0x208(%rbp)
1403d85ba:     	movdqu	0x230(%rbp), %xmm0
1403d85c2:     	movdqu	%xmm0, 0x210(%rbp)
1403d85ca:     	movq	0x240(%rbp), %rax
1403d85d1:     	movq	%rax, 0x220(%rbp)
1403d85d8:     	movq	%rbx, 0x228(%rbp)
1403d85df:     	movb	$0x0, 0x24f(%rbp)
1403d85e6:     	leaq	0x50(%rbp), %rcx
1403d85ea:     	callq	0x1403b24f0 <.text+0x3b14f0>
1403d85ef:     	nop
1403d85f0:     	leaq	0x100(%rbp), %rcx
1403d85f7:     	movq	%rdi, %rdx
1403d85fa:     	callq	0x1403d76f0 <.text+0x3d66f0>
1403d85ff:     	nop
1403d8600:     	leaq	0x100(%rbp), %rdx
1403d8607:     	movl	$0x130, %r8d            # imm = 0x130
1403d860d:     	movq	%rsi, %rcx
1403d8610:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1403d8615:     	movq	%rsi, %rax
1403d8618:     	addq	$0x2d8, %rsp            # imm = 0x2D8
1403d861f:     	popq	%rbx
1403d8620:     	popq	%rdi
1403d8621:     	popq	%rsi
1403d8622:     	popq	%r14
1403d8624:     	popq	%r15
1403d8626:     	popq	%rbp
1403d8627:     	retq
