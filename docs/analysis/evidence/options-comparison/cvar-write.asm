Disassembly of section .text:

0000000140001000 <.text>:
14063d3f0:     	pushq	%rbp
14063d3f1:     	pushq	%r15
14063d3f3:     	pushq	%r14
14063d3f5:     	pushq	%r12
14063d3f7:     	pushq	%rsi
14063d3f8:     	pushq	%rdi
14063d3f9:     	pushq	%rbx
14063d3fa:     	subq	$0xb0, %rsp
14063d401:     	leaq	0x80(%rsp), %rbp
14063d409:     	movq	$-0x2, 0x28(%rbp)
14063d411:     	cmpq	$0x0, 0x90(%rcx)
14063d419:     	je	0x14063d629 <.text+0x63c629>
14063d41f:     	movq	%rcx, %rsi
14063d422:     	movq	0x90(%rbp), %rax
14063d429:     	movq	0x78(%rcx), %rcx
14063d42d:     	movq	0x80(%rsi), %r10
14063d434:     	movabsq	$-0x15a5c2f0575a2ed3, %r11 # imm = 0xEA5A3D0FA8A5D12D
14063d43e:     	xorl	%edi, %edi
14063d440:     	movdqa	0x5736988(%rip), %xmm0  # 0x145d73dd0
14063d448:     	pcmpeqd	%xmm1, %xmm1
14063d44c:     	movdqa	0x581e40c(%rip), %xmm2  # 0x145e5b860
14063d454:     	andq	%r10, %r11
14063d457:     	movdqu	(%rcx,%r11), %xmm3
14063d45d:     	movdqa	%xmm3, %xmm4
14063d461:     	pcmpeqb	%xmm0, %xmm4
14063d465:     	pmovmskb	%xmm4, %ebx
14063d469:     	testl	%ebx, %ebx
14063d46b:     	je	0x14063d4b0 <.text+0x63c4b0>
14063d46d:     	tzcntl	%ebx, %r14d
14063d472:     	addq	%r11, %r14
14063d475:     	andq	%r10, %r14
14063d478:     	negq	%r14
14063d47b:     	leaq	(%r14,%r14,2), %r14
14063d47f:     	movdqu	-0x18(%rcx,%r14,8), %xmm4
14063d486:     	pcmpeqb	%xmm2, %xmm4
14063d48a:     	pmovmskb	%xmm4, %r15d
14063d48f:     	cmpl	$0xffff, %r15d          # imm = 0xFFFF
14063d496:     	je	0x14063d4cd <.text+0x63c4cd>
14063d498:     	leal	-0x1(%rbx), %r14d
14063d49c:     	andw	%bx, %r14w
14063d4a0:     	movl	%r14d, %ebx
14063d4a3:     	jne	0x14063d46d <.text+0x63c46d>
14063d4a5:     	nopw	%cs:(%rax,%rax)
14063d4b0:     	pcmpeqb	%xmm1, %xmm3
14063d4b4:     	pmovmskb	%xmm3, %ebx
14063d4b8:     	testl	%ebx, %ebx
14063d4ba:     	jne	0x14063d629 <.text+0x63c629>
14063d4c0:     	addq	%rdi, %r11
14063d4c3:     	addq	$0x10, %r11
14063d4c7:     	addq	$0x10, %rdi
14063d4cb:     	jmp	0x14063d454 <.text+0x63c454>
14063d4cd:     	leaq	(%rcx,%r14,8), %rcx
14063d4d1:     	movq	-0x8(%rcx), %rcx
14063d4d5:     	cmpq	0x218(%rsi), %rcx
14063d4dc:     	jae	0x14063d629 <.text+0x63c629>
14063d4e2:     	movq	0x210(%rsi), %r10
14063d4e9:     	movq	(%r10,%rcx,8), %rcx
14063d4ed:     	testq	%rcx, %rcx
14063d4f0:     	je	0x14063d629 <.text+0x63c629>
14063d4f6:     	movq	0x1e0(%rsi), %rbx
14063d4fd:     	notq	%rcx
14063d500:     	imulq	$0x38, %rcx, %rcx
14063d504:     	cmpb	$0x1, 0x30(%rbx,%rcx)
14063d509:     	jne	0x14063d629 <.text+0x63c629>
14063d50f:     	addq	%rcx, %rbx
14063d512:     	movq	0x10(%rbx), %rdi
14063d516:     	movl	0x5b0(%rsi), %r14d
14063d51d:     	movl	%r14d, 0x2c(%rbx)
14063d521:     	movq	%rax, 0x20(%rsp)
14063d526:     	movb	$0x0, 0x28(%rsp)
14063d52b:     	movq	%rdi, %rcx
14063d52e:     	callq	0x140d95c70 <.text+0xd94c70>
14063d533:     	movl	%r14d, 0x2c(%rbx)
14063d537:     	movq	%rdi, %rcx
14063d53a:     	callq	0x140d93850 <.text+0xd92850>
14063d53f:     	cmpq	$0x0, 0x28(%rdi)
14063d544:     	je	0x14063d570 <.text+0x63c570>
14063d546:     	movl	%r14d, 0x2c(%rbx)
14063d54a:     	movq	0x18(%rdi), %rdx
14063d54e:     	movq	0x20(%rdi), %rax
14063d552:     	movq	0x28(%rdi), %rcx
14063d556:     	movq	$0x0, 0x18(%rdi)
14063d55e:     	movq	$0x8, 0x20(%rdi)
14063d566:     	movq	$0x0, 0x28(%rdi)
14063d56e:     	jmp	0x14063d579 <.text+0x63c579>
14063d570:     	movl	$0x8, %eax
14063d575:     	xorl	%ecx, %ecx
14063d577:     	xorl	%edx, %edx
14063d579:     	leaq	(%rcx,%rcx,8), %r8
14063d57d:     	leaq	(%rax,%r8,8), %r14
14063d581:     	movq	%rax, (%rbp)
14063d585:     	movq	%rax, 0x8(%rbp)
14063d589:     	movq	%rdx, 0x10(%rbp)
14063d58d:     	movq	%r14, 0x18(%rbp)
14063d591:     	testq	%rcx, %rcx
14063d594:     	je	0x14063d620 <.text+0x63c620>
14063d59a:     	leaq	-0x40(%rbp), %r15
14063d59e:     	addq	$0x48, %rax
14063d5a2:     	leaq	0x5824137(%rip), %rdi   # 0x145e616e0
14063d5a9:     	leaq	-0x48(%rbp), %rbx
14063d5ad:     	nopl	(%rax)
14063d5b0:     	movq	%rax, %rcx
14063d5b3:     	movq	-0x48(%rax), %rax
14063d5b7:     	cmpq	$-0x1, %rax
14063d5bb:     	je	0x14063d61c <.text+0x63c61c>
14063d5bd:     	movq	%rcx, 0x20(%rbp)
14063d5c1:     	leaq	-0x48(%rcx), %r12
14063d5c5:     	movq	%rax, -0x48(%rbp)
14063d5c9:     	movdqu	0x8(%r12), %xmm0
14063d5d0:     	movdqu	0x18(%r12), %xmm1
14063d5d7:     	movdqu	0x28(%r12), %xmm2
14063d5de:     	movdqu	0x38(%r12), %xmm3
14063d5e5:     	movdqu	%xmm3, 0x30(%r15)
14063d5eb:     	movdqu	%xmm2, 0x20(%r15)
14063d5f1:     	movdqu	%xmm1, 0x10(%r15)
14063d5f7:     	movdqu	%xmm0, (%r15)
14063d5fc:     	movq	%rsi, %rcx
14063d5ff:     	movq	%rbx, %rdx
14063d602:     	movq	%rdi, %r8
14063d605:     	callq	0x140c7c140 <.text+0xc7b140>
14063d60a:     	nop
14063d60b:     	movq	0x20(%rbp), %rcx
14063d60f:     	leaq	0x48(%rcx), %rax
14063d613:     	addq	$0x48, %r12
14063d617:     	cmpq	%r14, %r12
14063d61a:     	jne	0x14063d5b0 <.text+0x63c5b0>
14063d61c:     	movq	%rcx, 0x8(%rbp)
14063d620:     	movq	%rbp, %rcx
14063d623:     	callq	0x140f55860 <.text+0xf54860>
14063d628:     	nop
14063d629:     	addq	$0xb0, %rsp
14063d630:     	popq	%rbx
14063d631:     	popq	%rdi
14063d632:     	popq	%rsi
14063d633:     	popq	%r12
14063d635:     	popq	%r14
14063d637:     	popq	%r15
14063d639:     	popq	%rbp
14063d63a:     	retq
