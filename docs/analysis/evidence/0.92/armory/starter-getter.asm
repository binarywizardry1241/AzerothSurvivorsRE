
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453df460:     	pushq	%rbp
1453df461:     	pushq	%r15
1453df463:     	pushq	%r14
1453df465:     	pushq	%r12
1453df467:     	pushq	%rsi
1453df468:     	pushq	%rdi
1453df469:     	pushq	%rbx
1453df46a:     	subq	$0xa0, %rsp
1453df471:     	leaq	0x80(%rsp), %rbp
1453df479:     	movq	$-0x2, 0x18(%rbp)
1453df481:     	movq	%rcx, %rsi
1453df484:     	decb	%r8b
1453df487:     	movzbl	%dl, %eax
1453df48a:     	decl	%eax
1453df48c:     	cmpl	$0x7, %eax
1453df48f:     	ja	0x1453df5f5 <.text+0x53de5f5>
1453df495:     	leaq	0x12faba0(%rip), %rcx   # 0x1466da03c
1453df49c:     	movslq	(%rcx,%rax,4), %rax
1453df4a0:     	addq	%rcx, %rax
1453df4a3:     	jmpq	*%rax
1453df4a5:     	movl	$0x4, %r15d
1453df4ab:     	cmpb	$0xb, %r8b
1453df4af:     	jae	0x1453df628 <.text+0x53de628>
1453df4b5:     	movzbl	%r8b, %eax
1453df4b9:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df4be:     	btl	%eax, %ecx
1453df4c1:     	jb	0x1453df60f <.text+0x53de60f>
1453df4c7:     	jmp	0x1453df628 <.text+0x53de628>
1453df4cc:     	movl	$0x4, %r15d
1453df4d2:     	cmpb	$0xb, %r8b
1453df4d6:     	jae	0x1453df628 <.text+0x53de628>
1453df4dc:     	movzbl	%r8b, %eax
1453df4e0:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df4e5:     	btl	%eax, %ecx
1453df4e8:     	jae	0x1453df628 <.text+0x53de628>
1453df4ee:     	leaq	0x12fa27b(%rip), %rax   # 0x1466d9770
1453df4f5:     	jmp	0x1453df616 <.text+0x53de616>
1453df4fa:     	movl	$0x4, %r15d
1453df500:     	cmpb	$0xb, %r8b
1453df504:     	jae	0x1453df628 <.text+0x53de628>
1453df50a:     	movzbl	%r8b, %eax
1453df50e:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df513:     	btl	%eax, %ecx
1453df516:     	jae	0x1453df628 <.text+0x53de628>
1453df51c:     	leaq	0x12fa19d(%rip), %rax   # 0x1466d96c0
1453df523:     	jmp	0x1453df616 <.text+0x53de616>
1453df528:     	movl	$0x4, %r15d
1453df52e:     	cmpb	$0xb, %r8b
1453df532:     	jae	0x1453df628 <.text+0x53de628>
1453df538:     	movzbl	%r8b, %eax
1453df53c:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df541:     	btl	%eax, %ecx
1453df544:     	jae	0x1453df628 <.text+0x53de628>
1453df54a:     	leaq	0x12fa1c7(%rip), %rax   # 0x1466d9718
1453df551:     	jmp	0x1453df616 <.text+0x53de616>
1453df556:     	movl	$0x4, %r15d
1453df55c:     	cmpb	$0xb, %r8b
1453df560:     	jae	0x1453df628 <.text+0x53de628>
1453df566:     	movzbl	%r8b, %eax
1453df56a:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df56f:     	btl	%eax, %ecx
1453df572:     	jae	0x1453df628 <.text+0x53de628>
1453df578:     	leaq	0x12fa2f9(%rip), %rax   # 0x1466d9878
1453df57f:     	jmp	0x1453df616 <.text+0x53de616>
1453df584:     	movl	$0x4, %r15d
1453df58a:     	cmpb	$0xb, %r8b
1453df58e:     	jae	0x1453df628 <.text+0x53de628>
1453df594:     	movzbl	%r8b, %eax
1453df598:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df59d:     	btl	%eax, %ecx
1453df5a0:     	jae	0x1453df628 <.text+0x53de628>
1453df5a6:     	leaq	0x12fa0bb(%rip), %rax   # 0x1466d9668
1453df5ad:     	jmp	0x1453df616 <.text+0x53de616>
1453df5af:     	movl	$0x4, %r15d
1453df5b5:     	cmpb	$0xb, %r8b
1453df5b9:     	jae	0x1453df628 <.text+0x53de628>
1453df5bb:     	movzbl	%r8b, %eax
1453df5bf:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df5c4:     	btl	%eax, %ecx
1453df5c7:     	jae	0x1453df628 <.text+0x53de628>
1453df5c9:     	leaq	0x12fa1f8(%rip), %rax   # 0x1466d97c8
1453df5d0:     	jmp	0x1453df616 <.text+0x53de616>
1453df5d2:     	movl	$0x4, %r15d
1453df5d8:     	cmpb	$0xb, %r8b
1453df5dc:     	jae	0x1453df628 <.text+0x53de628>
1453df5de:     	movzbl	%r8b, %eax
1453df5e2:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df5e7:     	btl	%eax, %ecx
1453df5ea:     	jae	0x1453df628 <.text+0x53de628>
1453df5ec:     	leaq	0x12fa22d(%rip), %rax   # 0x1466d9820
1453df5f3:     	jmp	0x1453df616 <.text+0x53de616>
1453df5f5:     	movl	$0x4, %r15d
1453df5fb:     	cmpb	$0xb, %r8b
1453df5ff:     	jae	0x1453df628 <.text+0x53de628>
1453df601:     	movzbl	%r8b, %eax
1453df605:     	movl	$0x5df, %ecx            # imm = 0x5DF
1453df60a:     	btl	%eax, %ecx
1453df60d:     	jae	0x1453df628 <.text+0x53de628>
1453df60f:     	leaq	0x12fa2ba(%rip), %rax   # 0x1466d98d0
1453df616:     	movzbl	%r8b, %ecx
1453df61a:     	movq	(%rax,%rcx,8), %rax
1453df61e:     	movq	0x8(%rax), %r15
1453df622:     	movq	0x10(%rax), %rax
1453df626:     	jmp	0x1453df62a <.text+0x53de62a>
1453df628:     	xorl	%eax, %eax
1453df62a:     	xorps	%xmm0, %xmm0
1453df62d:     	movups	%xmm0, 0x3c(%rsi)
1453df631:     	movups	%xmm0, 0x30(%rsi)
1453df635:     	movups	%xmm0, 0x20(%rsi)
1453df639:     	movups	%xmm0, 0x10(%rsi)
1453df63d:     	movups	%xmm0, (%rsi)
1453df640:     	leaq	(%r15,%rax,4), %r12
1453df644:     	leaq	-0x58(%rbp), %rdi
1453df648:     	nopl	(%rax,%rax)
1453df650:     	cmpq	%r12, %r15
1453df653:     	je	0x1453df6bc <.text+0x53de6bc>
1453df655:     	movl	(%r15), %edx
1453df658:     	addq	$0x4, %r15
1453df65c:     	movq	%rdi, %rcx
1453df65f:     	callq	0x1453df730 <.text+0x53de730>
1453df664:     	cmpq	$-0x1, -0x58(%rbp)
1453df669:     	je	0x1453df650 <.text+0x53de650>
1453df66b:     	movzbl	0x10(%rbp), %ecx
1453df66f:     	cmpq	$0x13, %rcx
1453df673:     	jae	0x1453df6d1 <.text+0x53de6d1>
1453df675:     	movq	-0x58(%rbp), %rdx
1453df679:     	movq	-0x50(%rbp), %rax
1453df67d:     	movq	-0x40(%rbp), %rbx
1453df681:     	movq	-0x38(%rbp), %r14
1453df685:     	movl	-0x8(%rbp), %r8d
1453df689:     	movl	%r8d, (%rsi,%rcx,4)
1453df68d:     	testq	%rdx, %rdx
1453df690:     	je	0x1453df6a0 <.text+0x53de6a0>
1453df692:     	movl	$0x1, %r8d
1453df698:     	movq	%rax, %rcx
1453df69b:     	callq	0x1400021d0 <.text+0x11d0>
1453df6a0:     	testq	%rbx, %rbx
1453df6a3:     	je	0x1453df650 <.text+0x53de650>
1453df6a5:     	shlq	$0x3, %rbx
1453df6a9:     	movl	$0x4, %r8d
1453df6af:     	movq	%r14, %rcx
1453df6b2:     	movq	%rbx, %rdx
1453df6b5:     	callq	0x1400021d0 <.text+0x11d0>
1453df6ba:     	jmp	0x1453df650 <.text+0x53de650>
1453df6bc:     	movq	%rsi, %rax
1453df6bf:     	addq	$0xa0, %rsp
1453df6c6:     	popq	%rbx
1453df6c7:     	popq	%rdi
1453df6c8:     	popq	%rsi
1453df6c9:     	popq	%r12
1453df6cb:     	popq	%r14
1453df6cd:     	popq	%r15
1453df6cf:     	popq	%rbp
1453df6d0:     	retq
1453df6d1:     	leaq	0x12eb5d8(%rip), %r8    # 0x1466cacb0
1453df6d8:     	movl	$0x13, %edx
1453df6dd:     	callq	0x1458a3f23 <.text+0x58a2f23>
1453df6e2:     	nop
1453df6e3:     	ud2
1453df6e5:     	nopw	%cs:(%rax,%rax)
1453df6f0:     	movq	%rdx, 0x10(%rsp)
1453df6f5:     	pushq	%rbp
1453df6f6:     	pushq	%r15
1453df6f8:     	pushq	%r14
