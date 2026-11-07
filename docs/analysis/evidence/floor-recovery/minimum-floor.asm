
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552b4e0:     	pushq	%r15
14552b4e2:     	pushq	%r14
14552b4e4:     	pushq	%r13
14552b4e6:     	pushq	%r12
14552b4e8:     	pushq	%rsi
14552b4e9:     	pushq	%rdi
14552b4ea:     	pushq	%rbp
14552b4eb:     	pushq	%rbx
14552b4ec:     	subq	$0x38, %rsp
14552b4f0:     	movaps	%xmm6, 0x20(%rsp)
14552b4f5:     	movaps	%xmm2, %xmm0
14552b4f8:     	movaps	%xmm1, %xmm6
14552b4fb:     	movq	%rcx, %rsi
14552b4fe:     	subss	0x24(%rcx), %xmm0
14552b503:     	addss	%xmm0, %xmm0
14552b507:     	callq	0x145773265 <.text+0x5772265>
14552b50c:     	cvttss2si	%xmm0, %edi
14552b510:     	ucomiss	0x4b9cc9(%rip), %xmm0   # 0x1459e51e0
14552b517:     	movl	$0x7fffffff, %ebp       # imm = 0x7FFFFFFF
14552b51c:     	cmoval	%ebp, %edi
14552b51f:     	xorl	%eax, %eax
14552b521:     	ucomiss	%xmm0, %xmm0
14552b524:     	cmovpl	%eax, %edi
14552b527:     	movl	0x18(%rsi), %r14d
14552b52b:     	leal	-0x2(%rdi), %ebx
14552b52e:     	testl	%ebx, %ebx
14552b530:     	cmovlel	%eax, %ebx
14552b533:     	addl	$0x2, %edi
14552b536:     	leal	-0x1(%r14), %r15d
14552b53a:     	cmpl	%edi, %r15d
14552b53d:     	cmovll	%r15d, %edi
14552b541:     	cmpl	%edi, %ebx
14552b543:     	jle	0x14552b55b <.text+0x552a55b>
14552b545:     	movaps	0x20(%rsp), %xmm6
14552b54a:     	addq	$0x38, %rsp
14552b54e:     	popq	%rbx
14552b54f:     	popq	%rbp
14552b550:     	popq	%rdi
14552b551:     	popq	%rsi
14552b552:     	popq	%r12
14552b554:     	popq	%r13
14552b556:     	popq	%r14
14552b558:     	popq	%r15
14552b55a:     	retq
14552b55b:     	subss	0x20(%rsi), %xmm6
14552b560:     	addss	%xmm6, %xmm6
14552b564:     	movaps	%xmm6, %xmm0
14552b567:     	callq	0x145773265 <.text+0x5772265>
14552b56c:     	cvttss2si	%xmm0, %r8d
14552b571:     	ucomiss	0x4b9c68(%rip), %xmm0   # 0x1459e51e0
14552b578:     	cmoval	%ebp, %r8d
14552b57c:     	xorl	%eax, %eax
14552b57e:     	ucomiss	%xmm0, %xmm0
14552b581:     	cmovpl	%eax, %r8d
14552b585:     	leal	-0x2(%r8), %r9d
14552b589:     	testl	%r9d, %r9d
14552b58c:     	cmovlel	%eax, %r9d
14552b590:     	addl	$0x2, %r8d
14552b594:     	cmpl	%r8d, %r15d
14552b597:     	cmovll	%r15d, %r8d
14552b59b:     	cmpl	%r8d, %r9d
14552b59e:     	jle	0x14552b5ca <.text+0x552a5ca>
14552b5a0:     	xorl	%eax, %eax
14552b5a2:     	nopw	%cs:(%rax,%rax)
14552b5b0:     	xorl	%ecx, %ecx
14552b5b2:     	cmpl	%edi, %ebx
14552b5b4:     	setl	%dl
14552b5b7:     	jge	0x14552b652 <.text+0x552a652>
14552b5bd:     	movb	%dl, %cl
14552b5bf:     	addl	%ecx, %ebx
14552b5c1:     	cmpl	%edi, %ebx
14552b5c3:     	jle	0x14552b5b0 <.text+0x552a5b0>
14552b5c5:     	jmp	0x14552b545 <.text+0x552a545>
14552b5ca:     	movq	0x8(%rsi), %r10
14552b5ce:     	movq	0x10(%rsi), %rdx
14552b5d2:     	movl	$0x1, %r11d
14552b5d8:     	nopl	(%rax,%rax)
14552b5e0:     	movl	%ebx, %esi
14552b5e2:     	xorl	%ebx, %ebx
14552b5e4:     	cmpl	%edi, %esi
14552b5e6:     	setl	%bl
14552b5e9:     	addl	%esi, %ebx
14552b5eb:     	movl	%esi, %r15d
14552b5ee:     	imull	%r14d, %r15d
14552b5f2:     	movl	%r9d, %r12d
14552b5f5:     	nopw	%cs:(%rax,%rax)
14552b600:     	xorl	%ebp, %ebp
14552b602:     	cmpl	%r8d, %r12d
14552b605:     	setl	%r13b
14552b609:     	leal	(%r12,%r15), %ecx
14552b60d:     	movslq	%ecx, %rcx
14552b610:     	cmpq	%rcx, %rdx
14552b613:     	jbe	0x14552b657 <.text+0x552a657>
14552b615:     	movss	(%r10,%rcx,4), %xmm1
14552b61b:     	ucomiss	%xmm1, %xmm1
14552b61e:     	jp	0x14552b631 <.text+0x552a631>
14552b620:     	ucomiss	%xmm1, %xmm0
14552b623:     	setbe	%cl
14552b626:     	testb	%cl, %al
14552b628:     	jne	0x14552b62d <.text+0x552a62d>
14552b62a:     	movaps	%xmm1, %xmm0
14552b62d:     	cmovel	%r11d, %eax
14552b631:     	cmpl	%r8d, %r12d
14552b634:     	jge	0x14552b641 <.text+0x552a641>
14552b636:     	movb	%r13b, %bpl
14552b639:     	addl	%ebp, %r12d
14552b63c:     	cmpl	%r8d, %r12d
14552b63f:     	jle	0x14552b600 <.text+0x552a600>
14552b641:     	cmpl	%edi, %esi
14552b643:     	jge	0x14552b545 <.text+0x552a545>
14552b649:     	cmpl	%edi, %ebx
14552b64b:     	jle	0x14552b5e0 <.text+0x552a5e0>
14552b64d:     	jmp	0x14552b545 <.text+0x552a545>
14552b652:     	jmp	0x14552b545 <.text+0x552a545>
14552b657:     	leaq	0x18098ea(%rip), %r8    # 0x146d34f48
14552b65e:     	callq	0x145903b33 <.text+0x5902b33>
14552b663:     	ud2
