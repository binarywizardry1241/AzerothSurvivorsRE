
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458b93a0:     	pushq	%rbp
1458b93a1:     	pushq	%r15
1458b93a3:     	pushq	%r14
1458b93a5:     	pushq	%rsi
1458b93a6:     	pushq	%rdi
1458b93a7:     	pushq	%rbx
1458b93a8:     	subq	$0xd8, %rsp
1458b93af:     	leaq	0x80(%rsp), %rbp
1458b93b7:     	movaps	%xmm6, 0x40(%rbp)
1458b93bb:     	movq	$-0x2, 0x38(%rbp)
1458b93c3:     	movq	%rcx, %rsi
1458b93c6:     	movq	0x10(%rcx), %rbx
1458b93ca:     	testq	%rbx, %rbx
1458b93cd:     	movq	%rdx, 0x10(%rbp)
1458b93d1:     	je	0x1458b9420 <.text+0x58b8420>
1458b93d3:     	movq	0x18(%rsi), %rax
1458b93d7:     	movq	%rdx, -0x40(%rbp)
1458b93db:     	cmpq	%rax, %rbx
1458b93de:     	je	0x1458b941c <.text+0x58b841c>
1458b93e0:     	subq	%rbx, %rax
1458b93e3:     	shrq	$0x3, %rax
1458b93e7:     	movabsq	$0x4ec4ec4ec4ec4ec5, %r14 # imm = 0x4EC4EC4EC4EC4EC5
1458b93f1:     	imulq	%rax, %r14
1458b93f5:     	xorl	%r15d, %r15d
1458b93f8:     	leaq	-0x40(%rbp), %rdi
1458b93fc:     	nopl	(%rax)
1458b9400:     	imulq	$0x68, %r15, %rdx
1458b9404:     	addq	%rbx, %rdx
1458b9407:     	movb	$0x1, 0x37(%rbp)
1458b940b:     	movq	%rdi, %rcx
1458b940e:     	callq	0x1459bf500 <.text+0x59be500>
1458b9413:     	nop
1458b9414:     	incq	%r15
1458b9417:     	cmpq	%r14, %r15
1458b941a:     	jne	0x1458b9400 <.text+0x58b8400>
1458b941c:     	movq	0x10(%rbp), %rdx
1458b9420:     	cmpb	$0x0, (%rsi)
1458b9423:     	je	0x1458b94dd <.text+0x58b84dd>
1458b9429:     	movq	0x8(%rsi), %rdi
1458b942d:     	movq	(%rdx), %r8
1458b9430:     	movq	0x8(%rdx), %r9
1458b9434:     	testq	%rdi, %rdi
1458b9437:     	je	0x1458b95b0 <.text+0x58b85b0>
1458b943d:     	movq	0x10(%rdx), %rsi
1458b9441:     	movq	0x18(%rdx), %rax
1458b9445:     	movq	(%rdi), %rbx
1458b9448:     	cmpb	$0xb, 0x75(%rbx)
1458b944c:     	movq	%r8, 0x18(%rbp)
1458b9450:     	movq	%r9, 0x20(%rbp)
1458b9454:     	jne	0x1458b94ec <.text+0x58b84ec>
1458b945a:     	movq	(%rbx), %rcx
1458b945d:     	movq	0x8(%rbx), %rdx
1458b9461:     	cmpq	$0xb, %rdx
1458b9465:     	je	0x1458b95c7 <.text+0x58b85c7>
1458b946b:     	cmpq	$0xa, %rdx
1458b946f:     	jne	0x1458b9495 <.text+0x58b8495>
1458b9471:     	movq	(%rcx), %r8
1458b9474:     	xorq	0x12fa223(%rip), %r8    # 0x146bb369e
1458b947b:     	movzwl	0x8(%rcx), %r9d
1458b9480:     	xorw	0x12fa21e(%rip), %r9w   # 0x146bb36a6
1458b9488:     	movzwl	%r9w, %r9d
1458b948c:     	orq	%r8, %r9
1458b948f:     	je	0x1458b95e5 <.text+0x58b85e5>
1458b9495:     	movss	0x48(%rbx), %xmm6
1458b949a:     	mulss	0x4ba89e(%rip), %xmm6   # 0x145d73d40
1458b94a2:     	mulss	0x2c(%rdi), %xmm6
1458b94a7:     	mulss	0x48(%rdi), %xmm6
1458b94ac:     	mulss	0x170(%rax), %xmm6
1458b94b4:     	mulss	0x64(%rdi), %xmm6
1458b94b9:     	maxss	0x4ba883(%rip), %xmm6   # 0x145d73d44
1458b94c1:     	callq	0x145882c60 <.text+0x5881c60>
1458b94c6:     	maxss	%xmm6, %xmm0
1458b94ca:     	movss	0x5c(%rdi), %xmm1
1458b94cf:     	maxss	0x4b775d(%rip), %xmm1   # 0x145d70c34
1458b94d7:     	divss	%xmm1, %xmm0
1458b94db:     	jmp	0x1458b9518 <.text+0x58b8518>
1458b94dd:     	movq	(%rdx), %rax
1458b94e0:     	movq	0x8(%rdx), %rcx
1458b94e4:     	movq	%rcx, (%rax)
1458b94e7:     	jmp	0x1458b95b3 <.text+0x58b85b3>
1458b94ec:     	movss	0x48(%rbx), %xmm0
1458b94f1:     	mulss	0x4ba847(%rip), %xmm0   # 0x145d73d40
1458b94f9:     	mulss	0x2c(%rdi), %xmm0
1458b94fe:     	mulss	0x48(%rdi), %xmm0
1458b9503:     	mulss	0x170(%rax), %xmm0
1458b950b:     	mulss	0x64(%rdi), %xmm0
1458b9510:     	maxss	0x4ba82c(%rip), %xmm0   # 0x145d73d44
1458b9518:     	movss	%xmm0, 0x30(%rbp)
1458b951d:     	movss	0x24(%rdi), %xmm0
1458b9522:     	addq	$0x20, %rdi
1458b9526:     	xorps	%xmm1, %xmm1
1458b9529:     	maxss	%xmm1, %xmm0
1458b952d:     	movss	%xmm0, 0x2c(%rbp)
1458b9532:     	movq	%rbx, -0x40(%rbp)
1458b9536:     	addq	$0x40, %rbx
1458b953a:     	leaq	-0x58b7481(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458b9541:     	movq	%rax, -0x38(%rbp)
1458b9545:     	movq	%rbx, -0x30(%rbp)
1458b9549:     	leaq	0x2f4a30(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
1458b9550:     	movq	%rax, -0x28(%rbp)
1458b9554:     	movq	%rdi, -0x20(%rbp)
1458b9558:     	movq	%rax, -0x18(%rbp)
1458b955c:     	leaq	0x2c(%rbp), %rax
1458b9560:     	movq	%rax, -0x10(%rbp)
1458b9564:     	leaq	0x2f3d15(%rip), %rax    # 0x145bad280 <.text+0x5bac280>
1458b956b:     	movq	%rax, -0x8(%rbp)
1458b956f:     	leaq	0x30(%rbp), %rcx
1458b9573:     	movq	%rcx, (%rbp)
1458b9577:     	movq	%rax, 0x8(%rbp)
1458b957b:     	leaq	0x13001a0(%rip), %rdx   # 0x146bb9722
1458b9582:     	leaq	-0x58(%rbp), %rcx
1458b9586:     	leaq	-0x40(%rbp), %r8
1458b958a:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458b958f:     	nop
1458b9590:     	movq	0x20(%rbp), %r9
1458b9594:     	leaq	(%r9,%r9,2), %rax
1458b9598:     	movq	-0x48(%rbp), %rcx
1458b959c:     	movq	%rcx, 0x10(%rsi,%rax,8)
1458b95a1:     	movups	-0x58(%rbp), %xmm0
1458b95a5:     	movups	%xmm0, (%rsi,%rax,8)
1458b95a9:     	incq	%r9
1458b95ac:     	movq	0x18(%rbp), %r8
1458b95b0:     	movq	%r9, (%r8)
1458b95b3:     	movaps	0x40(%rbp), %xmm6
1458b95b7:     	addq	$0xd8, %rsp
1458b95be:     	popq	%rbx
1458b95bf:     	popq	%rdi
1458b95c0:     	popq	%rsi
1458b95c1:     	popq	%r14
1458b95c3:     	popq	%r15
1458b95c5:     	popq	%rbp
1458b95c6:     	retq
1458b95c7:     	movq	(%rcx), %r8
1458b95ca:     	xorq	0x12fa0d7(%rip), %r8    # 0x146bb36a8
1458b95d1:     	movq	0x3(%rcx), %r9
1458b95d5:     	xorq	0x12fa0cf(%rip), %r9    # 0x146bb36ab
1458b95dc:     	orq	%r8, %r9
1458b95df:     	jne	0x1458b9495 <.text+0x58b8495>
1458b95e5:     	xorps	%xmm0, %xmm0
1458b95e8:     	jmp	0x1458b9518 <.text+0x58b8518>
