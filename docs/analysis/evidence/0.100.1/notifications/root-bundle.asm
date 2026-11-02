
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14034e3e0:     	pushq	%rbp
14034e3e1:     	pushq	%r15
14034e3e3:     	pushq	%r14
14034e3e5:     	pushq	%rsi
14034e3e6:     	pushq	%rdi
14034e3e7:     	pushq	%rbx
14034e3e8:     	subq	$0xa8, %rsp
14034e3ef:     	leaq	0x80(%rsp), %rbp
14034e3f7:     	movq	$-0x2, 0x20(%rbp)
14034e3ff:     	movq	%rcx, %rsi
14034e402:     	movq	0x18(%rcx), %rax
14034e406:     	movq	0x20(%rcx), %rcx
14034e40a:     	movabsq	$0x73c36e0974929e9, %r9 # imm = 0x73C36E0974929E9
14034e414:     	xorl	%r10d, %r10d
14034e417:     	movdqa	0x55b8d41(%rip), %xmm0  # 0x145907160
14034e41f:     	pcmpeqd	%xmm1, %xmm1
14034e423:     	movdqa	0x560e8f5(%rip), %xmm2  # 0x14595cd20
14034e42b:     	andq	%rcx, %r9
14034e42e:     	movdqu	(%rax,%r9), %xmm3
14034e434:     	movdqa	%xmm3, %xmm4
14034e438:     	pcmpeqb	%xmm0, %xmm4
14034e43c:     	pmovmskb	%xmm4, %r11d
14034e441:     	testl	%r11d, %r11d
14034e444:     	je	0x14034e480 <.text+0x34d480>
14034e446:     	tzcntl	%r11d, %edi
14034e44b:     	addq	%r9, %rdi
14034e44e:     	andq	%rcx, %rdi
14034e451:     	negq	%rdi
14034e454:     	leaq	(%rdi,%rdi,2), %rdi
14034e458:     	movdqu	-0x18(%rax,%rdi,8), %xmm4
14034e45e:     	pcmpeqb	%xmm2, %xmm4
14034e462:     	pmovmskb	%xmm4, %ebx
14034e466:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
14034e46c:     	je	0x14034e49b <.text+0x34d49b>
14034e46e:     	leal	-0x1(%r11), %edi
14034e472:     	andw	%r11w, %di
14034e476:     	movl	%edi, %r11d
14034e479:     	jne	0x14034e446 <.text+0x34d446>
14034e47b:     	nopl	(%rax,%rax)
14034e480:     	pcmpeqb	%xmm1, %xmm3
14034e484:     	pmovmskb	%xmm3, %r11d
14034e489:     	testl	%r11d, %r11d
14034e48c:     	jne	0x14034e4a8 <.text+0x34d4a8>
14034e48e:     	addq	%r10, %r9
14034e491:     	addq	$0x10, %r9
14034e495:     	addq	$0x10, %r10
14034e499:     	jmp	0x14034e42b <.text+0x34d42b>
14034e49b:     	leaq	(%rax,%rdi,8), %rax
14034e49f:     	movq	-0x8(%rax), %rdi
14034e4a3:     	jmp	0x14034e5cb <.text+0x34d5cb>
14034e4a8:     	leaq	-0x28(%rbp), %rdi
14034e4ac:     	movq	%rdi, %rcx
14034e4af:     	movq	%rdx, %rbx
14034e4b2:     	movq	%r8, %r14
14034e4b5:     	callq	0x1400a0600 <.text+0x9f600>
14034e4ba:     	leaq	-0x40(%rbp), %r15
14034e4be:     	movq	%r15, %rcx
14034e4c1:     	movq	%rdi, %rdx
14034e4c4:     	callq	0x1401a2240 <.text+0x1a1240>
14034e4c9:     	movq	0x10(%rsi), %rdi
14034e4cd:     	movq	0x18(%rbx), %rax
14034e4d1:     	movq	%rdi, 0x30(%rsp)
14034e4d6:     	movq	%r15, 0x28(%rsp)
14034e4db:     	movq	%rax, 0x20(%rsp)
14034e4e0:     	leaq	0x56154d9(%rip), %rdx   # 0x1459639c0
14034e4e7:     	leaq	-0x28(%rbp), %rcx
14034e4eb:     	movl	$0x7d, %r8d
14034e4f1:     	movq	%r14, %r9
14034e4f4:     	callq	0x144e6b4c0 <.text+0x4e6a4c0>
14034e4f9:     	cmpq	(%rsi), %rdi
14034e4fc:     	jne	0x14034e507 <.text+0x34d507>
14034e4fe:     	movq	%rsi, %rcx
14034e501:     	callq	0x145774780 <.text+0x5773780>
14034e506:     	nop
14034e507:     	movq	0x8(%rsi), %rax
14034e50b:     	leaq	(%rdi,%rdi,4), %rcx
14034e50f:     	movq	-0x8(%rbp), %rdx
14034e513:     	movq	%rdx, 0x20(%rax,%rcx,8)
14034e518:     	movups	-0x28(%rbp), %xmm0
14034e51c:     	movdqu	-0x18(%rbp), %xmm1
14034e521:     	movdqu	%xmm1, 0x10(%rax,%rcx,8)
14034e527:     	movups	%xmm0, (%rax,%rcx,8)
14034e52b:     	leaq	0x1(%rdi), %rax
14034e52f:     	movq	%rax, 0x10(%rsi)
14034e533:     	movq	0x18(%rsi), %rbx
14034e537:     	movq	0x20(%rsi), %r14
14034e53b:     	movabsq	$0x73c36e0974929e9, %r15 # imm = 0x73C36E0974929E9
14034e545:     	movq	%r14, %rcx
14034e548:     	andq	%r15, %rcx
14034e54b:     	movdqu	(%rbx,%rcx), %xmm0
14034e550:     	pmovmskb	%xmm0, %eax
14034e554:     	testl	%eax, %eax
14034e556:     	je	0x14034e5de <.text+0x34d5de>
14034e55c:     	tzcntl	%eax, %eax
14034e560:     	addq	%rcx, %rax
14034e563:     	andq	%r14, %rax
14034e566:     	movzbl	(%rbx,%rax), %ecx
14034e56a:     	testb	%cl, %cl
14034e56c:     	jns	0x14034e600 <.text+0x34d600>
14034e572:     	movq	0x28(%rsi), %rdx
14034e576:     	testq	%rdx, %rdx
14034e579:     	setne	%r8b
14034e57d:     	andb	$0x1, %cl
14034e580:     	sete	%r9b
14034e584:     	orb	%r8b, %r9b
14034e587:     	je	0x14034e615 <.text+0x34d615>
14034e58d:     	movzbl	%cl, %ecx
14034e590:     	subq	%rcx, %rdx
14034e593:     	movq	%rdx, 0x28(%rsi)
14034e597:     	leaq	-0x10(%rax), %rcx
14034e59b:     	andq	%r14, %rcx
14034e59e:     	movb	$0x3, (%rbx,%rax)
14034e5a2:     	movb	$0x3, 0x10(%rbx,%rcx)
14034e5a7:     	incq	0x30(%rsi)
14034e5ab:     	negq	%rax
14034e5ae:     	leaq	(%rax,%rax,2), %rax
14034e5b2:     	movabsq	$0x304b9df0c877275, %rcx # imm = 0x304B9DF0C877275
14034e5bc:     	movq	%rcx, -0x18(%rbx,%rax,8)
14034e5c1:     	movq	%r15, -0x10(%rbx,%rax,8)
14034e5c6:     	movq	%rdi, -0x8(%rbx,%rax,8)
14034e5cb:     	movq	%rdi, %rax
14034e5ce:     	addq	$0xa8, %rsp
14034e5d5:     	popq	%rbx
14034e5d6:     	popq	%rdi
14034e5d7:     	popq	%rsi
14034e5d8:     	popq	%r14
14034e5da:     	popq	%r15
14034e5dc:     	popq	%rbp
14034e5dd:     	retq
14034e5de:     	movl	$0x10, %edx
14034e5e3:     	addq	%rdx, %rcx
14034e5e6:     	andq	%r14, %rcx
14034e5e9:     	movdqu	(%rbx,%rcx), %xmm0
14034e5ee:     	pmovmskb	%xmm0, %eax
14034e5f2:     	addq	$0x10, %rdx
14034e5f6:     	testl	%eax, %eax
14034e5f8:     	jne	0x14034e55c <.text+0x34d55c>
14034e5fe:     	jmp	0x14034e5e3 <.text+0x34d5e3>
14034e600:     	movdqa	(%rbx), %xmm0
14034e604:     	pmovmskb	%xmm0, %eax
14034e608:     	tzcntl	%eax, %eax
14034e60c:     	movzbl	(%rbx,%rax), %ecx
14034e610:     	jmp	0x14034e572 <.text+0x34d572>
14034e615:     	leaq	0x18(%rsi), %rcx
14034e619:     	leaq	0x38(%rsi), %r8
14034e61d:     	movl	$0x1, %edx
14034e622:     	movb	$0x1, %r9b
14034e625:     	callq	0x1458c1ee0 <.text+0x58c0ee0>
14034e62a:     	movq	0x18(%rsi), %rbx
14034e62e:     	movq	0x20(%rsi), %r14
14034e632:     	movabsq	$0x73c36e0974929e9, %r8 # imm = 0x73C36E0974929E9
14034e63c:     	movq	%rbx, %rcx
14034e63f:     	movq	%r14, %rdx
14034e642:     	callq	0x14000efd0 <.text+0xdfd0>
14034e647:     	movzbl	(%rbx,%rax), %ecx
14034e64b:     	movq	0x28(%rsi), %rdx
14034e64f:     	andb	$0x1, %cl
14034e652:     	jmp	0x14034e58d <.text+0x34d58d>
