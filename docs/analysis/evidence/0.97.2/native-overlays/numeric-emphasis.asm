
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400c7270:     	pushq	%rbp
1400c7271:     	pushq	%r15
1400c7273:     	pushq	%r14
1400c7275:     	pushq	%r13
1400c7277:     	pushq	%r12
1400c7279:     	pushq	%rsi
1400c727a:     	pushq	%rdi
1400c727b:     	pushq	%rbx
1400c727c:     	subq	$0x478, %rsp            # imm = 0x478
1400c7283:     	leaq	0x80(%rsp), %rbp
1400c728b:     	movq	$-0x2, 0x3f0(%rbp)
1400c7296:     	movq	%r8, %rax
1400c7299:     	movq	%rdx, 0x390(%rbp)
1400c72a0:     	movq	%rcx, 0x398(%rbp)
1400c72a7:     	movq	$0x0, 0x3c0(%rbp)
1400c72b2:     	movq	$0x8, 0x3c8(%rbp)
1400c72bd:     	movq	$0x0, 0x3d0(%rbp)
1400c72c8:     	addq	%r9, %r8
1400c72cb:     	movb	$0x1, 0x3ee(%rbp)
1400c72d2:     	leaq	0x3a0(%rbp), %rcx
1400c72d9:     	movq	%rax, %rdx
1400c72dc:     	callq	0x140106870 <.text+0x105870>
1400c72e1:     	nop
1400c72e2:     	movq	0x3b0(%rbp), %rbx
1400c72e9:     	testq	%rbx, %rbx
1400c72ec:     	je	0x1400c75b3 <.text+0xc65b3>
1400c72f2:     	movq	0x3a8(%rbp), %rdi
1400c72f9:     	xorl	%ecx, %ecx
1400c72fb:     	leaq	0x160(%rbp), %r14
1400c7302:     	jmp	0x1400c7358 <.text+0xc6358>
1400c7304:     	nopw	%cs:(%rax,%rax)
1400c7310:     	xorl	%r15d, %r15d
1400c7313:     	movq	0x3c8(%rbp), %rax
1400c731a:     	movq	%r13, %rcx
1400c731d:     	shlq	$0x5, %rcx
1400c7321:     	movq	0x3e0(%rbp), %rdx
1400c7328:     	movq	%rdx, (%rax,%rcx)
1400c732c:     	movq	0x3d8(%rbp), %rdx
1400c7333:     	movq	%rdx, 0x8(%rax,%rcx)
1400c7338:     	movq	%rsi, 0x10(%rax,%rcx)
1400c733d:     	movb	%r15b, 0x18(%rax,%rcx)
1400c7342:     	incq	%r13
1400c7345:     	movq	%r13, 0x3d0(%rbp)
1400c734c:     	movq	%r12, %rcx
1400c734f:     	cmpq	%rbx, %r12
1400c7352:     	jae	0x1400c75b3 <.text+0xc65b3>
1400c7358:     	leaq	(%rdi,%rcx,4), %r13
1400c735c:     	movl	(%rdi,%rcx,4), %eax
1400c735f:     	cmpl	$0x2b, %eax
1400c7362:     	je	0x1400c7369 <.text+0xc6369>
1400c7364:     	cmpl	$0x2d, %eax
1400c7367:     	jne	0x1400c73a0 <.text+0xc63a0>
1400c7369:     	leaq	0x1(%rcx), %rax
1400c736d:     	movq	%rcx, %r12
1400c7370:     	cmpq	%rbx, %rax
1400c7373:     	jae	0x1400c73c8 <.text+0xc63c8>
1400c7375:     	movl	0x4(%rdi,%rcx,4), %edx
1400c7379:     	addl	$-0x30, %edx
1400c737c:     	movq	%rcx, %r12
1400c737f:     	cmpl	$0x9, %edx
1400c7382:     	ja	0x1400c73c8 <.text+0xc63c8>
1400c7384:     	movq	%rcx, %rdx
1400c7387:     	movq	%rax, %r12
1400c738a:     	cmpq	%rbx, %rax
1400c738d:     	jb	0x1400c740c <.text+0xc640c>
1400c738f:     	jmp	0x1400c74d2 <.text+0xc64d2>
1400c7394:     	nopw	%cs:(%rax,%rax)
1400c73a0:     	addl	$-0x30, %eax
1400c73a3:     	movq	%rcx, %r12
1400c73a6:     	cmpl	$0x9, %eax
1400c73a9:     	ja	0x1400c73c8 <.text+0xc63c8>
1400c73ab:     	leaq	0x1(%rcx), %rax
1400c73af:     	movq	%rcx, %rdx
1400c73b2:     	movq	%rax, %r12
1400c73b5:     	cmpq	%rbx, %rax
1400c73b8:     	jb	0x1400c740c <.text+0xc640c>
1400c73ba:     	jmp	0x1400c74d2 <.text+0xc64d2>
1400c73bf:     	nop
1400c73c0:     	movq	%rax, %r12
1400c73c3:     	cmpq	%rax, %rbx
1400c73c6:     	je	0x1400c7430 <.text+0xc6430>
1400c73c8:     	movl	(%rdi,%r12,4), %edx
1400c73cc:     	leal	-0x30(%rdx), %eax
1400c73cf:     	cmpl	$0xa, %eax
1400c73d2:     	jb	0x1400c7433 <.text+0xc6433>
1400c73d4:     	leaq	0x1(%r12), %rax
1400c73d9:     	cmpl	$0x2d, %edx
1400c73dc:     	je	0x1400c73e3 <.text+0xc63e3>
1400c73de:     	cmpl	$0x2b, %edx
1400c73e1:     	jne	0x1400c73c0 <.text+0xc63c0>
1400c73e3:     	cmpq	%rbx, %rax
1400c73e6:     	jae	0x1400c73c0 <.text+0xc63c0>
1400c73e8:     	movl	(%rdi,%rax,4), %edx
1400c73eb:     	addl	$-0x30, %edx
1400c73ee:     	cmpl	$0xa, %edx
1400c73f1:     	jae	0x1400c73c0 <.text+0xc63c0>
1400c73f3:     	jmp	0x1400c7433 <.text+0xc6433>
1400c73f5:     	nopw	%cs:(%rax,%rax)
1400c7400:     	incq	%r12
1400c7403:     	cmpq	%r12, %rbx
1400c7406:     	je	0x1400c74cb <.text+0xc64cb>
1400c740c:     	movl	(%rdi,%r12,4), %eax
1400c7410:     	leal	-0x30(%rax), %edx
1400c7413:     	cmpl	$0x9, %edx
1400c7416:     	jbe	0x1400c7400 <.text+0xc6400>
1400c7418:     	cmpl	$0x25, %eax
1400c741b:     	je	0x1400c7400 <.text+0xc6400>
1400c741d:     	cmpl	$0x2e, %eax
1400c7420:     	je	0x1400c7400 <.text+0xc6400>
1400c7422:     	leaq	-0x1(%r12), %rdx
1400c7427:     	jmp	0x1400c74d2 <.text+0xc64d2>
1400c742c:     	nopl	(%rax)
1400c7430:     	movq	%rbx, %r12
1400c7433:     	cmpq	%rcx, %r12
1400c7436:     	jb	0x1400c77b1 <.text+0xc67b1>
1400c743c:     	cmpq	%rbx, %r12
1400c743f:     	ja	0x1400c77b1 <.text+0xc67b1>
1400c7445:     	movq	$0x0, 0x160(%rbp)
1400c7450:     	movq	$0x1, 0x168(%rbp)
1400c745b:     	movq	$0x0, 0x170(%rbp)
1400c7466:     	movq	%r12, %r8
1400c7469:     	subq	%rcx, %r8
1400c746c:     	jne	0x1400c7575 <.text+0xc6575>
1400c7472:     	leaq	(%rdi,%r12,4), %rdx
1400c7476:     	movq	%r13, %rcx
1400c7479:     	movq	%r14, %r8
1400c747c:     	callq	0x14008acf0 <.text+0x89cf0>
1400c7481:     	nop
1400c7482:     	movq	0x160(%rbp), %rax
1400c7489:     	movq	%rax, 0x3e0(%rbp)
1400c7490:     	movq	0x168(%rbp), %rax
1400c7497:     	movq	%rax, 0x3d8(%rbp)
1400c749e:     	movq	0x170(%rbp), %rsi
1400c74a5:     	movq	0x3d0(%rbp), %r13
1400c74ac:     	cmpq	0x3c0(%rbp), %r13
1400c74b3:     	jne	0x1400c7310 <.text+0xc6310>
1400c74b9:     	leaq	0x3c0(%rbp), %rcx
1400c74c0:     	callq	0x1457580b0 <.text+0x57570b0>
1400c74c5:     	nop
1400c74c6:     	jmp	0x1400c7310 <.text+0xc6310>
1400c74cb:     	leaq	-0x1(%rbx), %rdx
1400c74cf:     	movq	%rbx, %r12
1400c74d2:     	cmpq	%rbx, %rdx
1400c74d5:     	jae	0x1400c77cd <.text+0xc67cd>
1400c74db:     	movq	%r12, %r8
1400c74de:     	subq	%rcx, %r8
1400c74e1:     	jb	0x1400c77cd <.text+0xc67cd>
1400c74e7:     	shlq	$0x2, %rcx
1400c74eb:     	leaq	(,%r12,4), %rax
1400c74f3:     	movq	$0x0, 0x160(%rbp)
1400c74fe:     	movq	$0x1, 0x168(%rbp)
1400c7509:     	movq	$0x0, 0x170(%rbp)
1400c7514:     	cmpq	%rcx, %rax
1400c7517:     	jne	0x1400c7594 <.text+0xc6594>
1400c7519:     	leaq	(%rdi,%r12,4), %rdx
1400c751d:     	movq	%r13, %rcx
1400c7520:     	movq	%r14, %r8
1400c7523:     	callq	0x14008acf0 <.text+0x89cf0>
1400c7528:     	nop
1400c7529:     	movq	0x160(%rbp), %rax
1400c7530:     	movq	%rax, 0x3e0(%rbp)
1400c7537:     	movq	0x168(%rbp), %rax
1400c753e:     	movq	%rax, 0x3d8(%rbp)
1400c7545:     	movq	0x170(%rbp), %rsi
1400c754c:     	movq	0x3d0(%rbp), %r13
1400c7553:     	movb	$0x1, %r15b
1400c7556:     	cmpq	0x3c0(%rbp), %r13
1400c755d:     	jne	0x1400c7313 <.text+0xc6313>
1400c7563:     	leaq	0x3c0(%rbp), %rcx
1400c756a:     	callq	0x1457580b0 <.text+0x57570b0>
1400c756f:     	nop
1400c7570:     	jmp	0x1400c7313 <.text+0xc6313>
1400c7575:     	movq	$0x1, 0x20(%rsp)
1400c757e:     	movl	$0x1, %r9d
1400c7584:     	movq	%r14, %rcx
1400c7587:     	xorl	%edx, %edx
1400c7589:     	callq	0x145757d40 <.text+0x5756d40>
1400c758e:     	nop
1400c758f:     	jmp	0x1400c7472 <.text+0xc6472>
1400c7594:     	movq	$0x1, 0x20(%rsp)
1400c759d:     	movl	$0x1, %r9d
1400c75a3:     	movq	%r14, %rcx
1400c75a6:     	xorl	%edx, %edx
1400c75a8:     	callq	0x145757d40 <.text+0x5756d40>
1400c75ad:     	nop
1400c75ae:     	jmp	0x1400c7519 <.text+0xc6519>
1400c75b3:     	movq	0x390(%rbp), %r15
1400c75ba:     	cmpb	$0x1, (%r15)
1400c75be:     	jne	0x1400c75e2 <.text+0xc65e2>
1400c75c0:     	movl	0x1(%r15), %eax
1400c75c4:     	movl	0x4(%r15), %ecx
1400c75c8:     	movl	%ecx, 0x3bb(%rbp)
1400c75ce:     	movl	%eax, 0x3b8(%rbp)
1400c75d4:     	movq	0x8(%r15), %rsi
1400c75d8:     	movzbl	0x10(%r15), %edi
1400c75dd:     	movb	$0x1, %r14b
1400c75e0:     	jmp	0x1400c75f3 <.text+0xc65f3>
1400c75e2:     	movq	0x8(%r15), %rsi
1400c75e6:     	lock
1400c75e7:     	incq	(%rsi)
1400c75ea:     	jle	0x1400c77e7 <.text+0xc67e7>
1400c75f0:     	xorl	%r14d, %r14d
1400c75f3:     	movups	0x5836e36(%rip), %xmm0  # 0x1458fe430
1400c75fa:     	movups	%xmm0, 0x37c(%rbp)
1400c7601:     	movl	$0x3f800000, 0x38c(%rbp) # imm = 0x3F800000
1400c760b:     	leaq	-0x50(%rbp), %rcx
1400c760f:     	leaq	0x583649a(%rip), %rdx   # 0x1458fdab0
1400c7616:     	movl	$0x180, %r8d            # imm = 0x180
1400c761c:     	callq	0x145756ddd <.text+0x5755ddd>
1400c7621:     	movq	0x398(%rbp), %r12
1400c7628:     	movq	(%r12), %rbx
1400c762c:     	addq	$0x8, %r12
1400c7630:     	movq	$0x0, 0x168(%rbp)
1400c763b:     	movq	$0x1, 0x170(%rbp)
1400c7646:     	xorps	%xmm0, %xmm0
1400c7649:     	movups	%xmm0, 0x178(%rbp)
1400c7650:     	movq	$0x4, 0x188(%rbp)
1400c765b:     	movq	$0x0, 0x190(%rbp)
1400c7666:     	movb	%r14b, 0x198(%rbp)
1400c766d:     	movl	0x3b8(%rbp), %eax
1400c7673:     	movl	0x3bb(%rbp), %ecx
1400c7679:     	movl	%eax, 0x199(%rbp)
1400c767f:     	movl	%ecx, 0x19c(%rbp)
1400c7685:     	movq	%rsi, 0x1a0(%rbp)
1400c768c:     	movq	%rdi, 0x1a8(%rbp)
1400c7693:     	movl	$0x41700000, 0x1b0(%rbp) # imm = 0x41700000
1400c769d:     	movw	$0x190, 0x1b4(%rbp)     # imm = 0x190
1400c76a6:     	movb	$0x1, 0x1b6(%rbp)
1400c76ad:     	movups	0x37b(%rbp), %xmm0
1400c76b4:     	movups	%xmm0, 0x1b7(%rbp)
1400c76bb:     	movq	0x388(%rbp), %rax
1400c76c2:     	movq	%rax, 0x1c4(%rbp)
1400c76c9:     	movups	0x58361fc(%rip), %xmm0  # 0x1458fd8cc
1400c76d0:     	movups	%xmm0, 0x1cc(%rbp)
1400c76d7:     	movl	$0x3f59999a, 0x1dc(%rbp) # imm = 0x3F59999A
1400c76e1:     	movsd	0x5831827(%rip), %xmm0  # 0x1458f8f10
1400c76e9:     	movsd	%xmm0, 0x1e0(%rbp)
1400c76f1:     	movw	$0x1, 0x1e8(%rbp)
1400c76fa:     	leaq	0x1ea(%rbp), %rcx
1400c7701:     	leaq	-0x56(%rbp), %rdx
1400c7705:     	movl	$0x186, %r8d            # imm = 0x186
1400c770b:     	callq	0x145756ddd <.text+0x5755ddd>
1400c7710:     	movq	%rbx, 0x160(%rbp)
1400c7717:     	movb	$0x1, 0x3ef(%rbp)
1400c771e:     	leaq	0x5835ceb(%rip), %r9    # 0x1458fd410
1400c7725:     	leaq	0x130(%rbp), %rcx
1400c772c:     	leaq	0x160(%rbp), %r8
1400c7733:     	movq	%r12, %rdx
1400c7736:     	callq	0x1401f87d0 <.text+0x1f77d0>
1400c773b:     	nop
1400c773c:     	movq	0x3d0(%rbp), %rax
1400c7743:     	movq	%rax, 0x170(%rbp)
1400c774a:     	movups	0x3c0(%rbp), %xmm0
1400c7751:     	movaps	%xmm0, 0x160(%rbp)
1400c7758:     	movq	%r15, 0x178(%rbp)
1400c775f:     	movb	$0x0, 0x3ef(%rbp)
1400c7766:     	leaq	0x130(%rbp), %rcx
1400c776d:     	leaq	0x160(%rbp), %rdx
1400c7774:     	callq	0x14021e460 <.text+0x21d460>
1400c7779:     	nop
1400c777a:     	movq	0x3a0(%rbp), %rdx
1400c7781:     	testq	%rdx, %rdx
1400c7784:     	je	0x1400c779d <.text+0xc679d>
1400c7786:     	movq	0x3a8(%rbp), %rcx
1400c778d:     	shlq	$0x2, %rdx
1400c7791:     	movl	$0x4, %r8d
1400c7797:     	callq	0x1400021d0 <.text+0x11d0>
1400c779c:     	nop
1400c779d:     	addq	$0x478, %rsp            # imm = 0x478
1400c77a4:     	popq	%rbx
1400c77a5:     	popq	%rdi
1400c77a6:     	popq	%rsi
1400c77a7:     	popq	%r12
1400c77a9:     	popq	%r13
1400c77ab:     	popq	%r14
1400c77ad:     	popq	%r15
1400c77af:     	popq	%rbp
1400c77b0:     	retq
1400c77b1:     	movb	$0x1, 0x3ef(%rbp)
1400c77b8:     	leaq	0x5836c89(%rip), %r9    # 0x1458fe448
1400c77bf:     	movq	%r12, %rdx
1400c77c2:     	movq	%rbx, %r8
1400c77c5:     	callq	0x1458e77c0 <.text+0x58e67c0>
1400c77ca:     	nop
1400c77cb:     	jmp	0x1400c77e7 <.text+0xc67e7>
1400c77cd:     	movb	$0x1, 0x3ef(%rbp)
1400c77d4:     	leaq	0x5836c85(%rip), %r9    # 0x1458fe460
1400c77db:     	movq	%r12, %rdx
1400c77de:     	movq	%rbx, %r8
1400c77e1:     	callq	0x1458e77c0 <.text+0x58e67c0>
1400c77e6:     	nop
1400c77e7:     	ud2
