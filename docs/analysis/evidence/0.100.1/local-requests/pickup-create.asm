
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454da2c0:     	pushq	%rbp
1454da2c1:     	pushq	%r15
1454da2c3:     	pushq	%r14
1454da2c5:     	pushq	%r13
1454da2c7:     	pushq	%r12
1454da2c9:     	pushq	%rsi
1454da2ca:     	pushq	%rdi
1454da2cb:     	pushq	%rbx
1454da2cc:     	subq	$0x168, %rsp            # imm = 0x168
1454da2d3:     	leaq	0x80(%rsp), %rbp
1454da2db:     	movdqa	%xmm9, 0xd0(%rbp)
1454da2e4:     	movaps	%xmm8, 0xc0(%rbp)
1454da2ec:     	movaps	%xmm7, 0xb0(%rbp)
1454da2f3:     	movaps	%xmm6, 0xa0(%rbp)
1454da2fa:     	movq	$-0x2, 0x98(%rbp)
1454da305:     	movq	%r9, %r14
1454da308:     	movl	%r8d, %r12d
1454da30b:     	movl	%edx, %r15d
1454da30e:     	movq	%rcx, %rdi
1454da311:     	movq	0x228(%rcx), %rcx
1454da318:     	movq	0x230(%rdi), %rdx
1454da31f:     	callq	0x145420480 <.text+0x541f480>
1454da324:     	imulq	$0xf0, %rax, %rsi
1454da32b:     	leaq	0x12591e6(%rip), %rbx   # 0x146733518
1454da332:     	movsd	(%r14), %xmm6
1454da337:     	movsd	0xc8(%rsi,%rbx), %xmm7
1454da340:     	movaps	%xmm6, %xmm8
1454da344:     	subps	%xmm7, %xmm8
1454da348:     	movshdup	%xmm8, %xmm1            # xmm1 = xmm8[1,1,3,3]
1454da34d:     	movaps	%xmm8, %xmm0
1454da351:     	callq	0x145773277 <.text+0x5772277>
1454da356:     	movss	0xd8(%rsi,%rbx), %xmm1
1454da35f:     	addss	0x4710dd(%rip), %xmm1   # 0x14594b444
1454da367:     	maxss	0x42d121(%rip), %xmm1   # 0x145907490
1454da36f:     	ucomiss	%xmm0, %xmm1
1454da372:     	jae	0x1454da3c5 <.text+0x54d93c5>
1454da374:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
1454da378:     	divps	%xmm0, %xmm8
1454da37c:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
1454da380:     	mulps	%xmm8, %xmm0
1454da384:     	addps	%xmm0, %xmm7
1454da387:     	movshdup	%xmm7, %xmm6            # xmm6 = xmm7[1,1,3,3]
1454da38b:     	movq	0x898(%rdi), %r14
1454da392:     	leaq	0x10(%r14), %rcx
1454da396:     	movaps	%xmm7, %xmm1
1454da399:     	movaps	%xmm6, %xmm2
1454da39c:     	callq	0x14552a140 <.text+0x5529140>
1454da3a1:     	testb	$0x1, %al
1454da3a3:     	jne	0x1454da3c2 <.text+0x54d93c2>
1454da3a5:     	cmpq	$-0x1, 0x68(%r14)
1454da3aa:     	je	0x1454da3c2 <.text+0x54d93c2>
1454da3ac:     	addq	$0x68, %r14
1454da3b0:     	leaq	0x60(%rbp), %rcx
1454da3b4:     	movq	%r14, %rdx
1454da3b7:     	movaps	%xmm7, %xmm2
1454da3ba:     	movaps	%xmm6, %xmm3
1454da3bd:     	callq	0x14552d220 <.text+0x552c220>
1454da3c2:     	movaps	%xmm7, %xmm6
1454da3c5:     	movl	$0x5, %r14d
1454da3cb:     	movl	%r15d, %eax
1454da3ce:     	leaq	0x151e46b(%rip), %rcx   # 0x1469f8840
1454da3d5:     	movslq	(%rcx,%rax,4), %rax
1454da3d9:     	addq	%rcx, %rax
1454da3dc:     	jmpq	*%rax
1454da3de:     	movq	0x548(%rdi), %rax
1454da3e5:     	testq	%rax, %rax
1454da3e8:     	je	0x1454da699 <.text+0x54d9699>
1454da3ee:     	movq	0x540(%rdi), %rcx
1454da3f5:     	xorl	%edx, %edx
1454da3f7:     	cmpq	$0x1, %rax
1454da3fb:     	jne	0x1454da5c5 <.text+0x54d95c5>
1454da401:     	xorl	%r9d, %r9d
1454da404:     	xorl	%r8d, %r8d
1454da407:     	jmp	0x1454da619 <.text+0x54d9619>
1454da40c:     	movl	%r15d, %r13d
1454da40f:     	movq	0x548(%rdi), %rax
1454da416:     	movl	$0x3, %r14d
1454da41c:     	movl	$0x232d, 0x5c(%rbp)     # imm = 0x232D
1454da423:     	movabsq	$0x3f80000000000103, %r15 # imm = 0x3F80000000000103
1454da42d:     	testq	%rax, %rax
1454da430:     	je	0x1454db15d <.text+0x54da15d>
1454da436:     	movq	0x540(%rdi), %rcx
1454da43d:     	cmpq	$0x4, %rax
1454da441:     	jae	0x1454da44d <.text+0x54d944d>
1454da443:     	xorl	%edx, %edx
1454da445:     	xorl	%r8d, %r8d
1454da448:     	jmp	0x1454da4e1 <.text+0x54d94e1>
1454da44d:     	movq	%rax, %rdx
1454da450:     	andq	$-0x4, %rdx
1454da454:     	leaq	0xf8(%rcx), %r8
1454da45b:     	xorps	%xmm0, %xmm0
1454da45e:     	movdqa	0x151b93a(%rip), %xmm1  # 0x1469f5da0
1454da466:     	movdqa	0x43b492(%rip), %xmm2   # 0x145915900
1454da46e:     	movq	%rdx, %r9
1454da471:     	xorps	%xmm3, %xmm3
1454da474:     	nopw	%cs:(%rax,%rax)
1454da480:     	movd	-0x90(%r8), %xmm4
1454da489:     	movd	-0xd8(%r8), %xmm5
1454da492:     	punpcklqdq	%xmm4, %xmm5    # xmm5 = xmm5[0],xmm4[0]
1454da496:     	movd	(%r8), %xmm4
1454da49b:     	movd	-0x48(%r8), %xmm7
1454da4a1:     	punpcklqdq	%xmm4, %xmm7    # xmm7 = xmm7[0],xmm4[0]
1454da4a5:     	pcmpeqd	%xmm1, %xmm5
1454da4a9:     	pand	%xmm2, %xmm5
1454da4ad:     	paddq	%xmm5, %xmm3
1454da4b1:     	pcmpeqd	%xmm1, %xmm7
1454da4b5:     	pand	%xmm2, %xmm7
1454da4b9:     	paddq	%xmm7, %xmm0
1454da4bd:     	addq	$0x120, %r8             # imm = 0x120
1454da4c4:     	addq	$-0x4, %r9
1454da4c8:     	jne	0x1454da480 <.text+0x54d9480>
1454da4ca:     	paddq	%xmm3, %xmm0
1454da4ce:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
1454da4d3:     	paddq	%xmm0, %xmm1
1454da4d7:     	movq	%xmm1, %r8
1454da4dc:     	cmpq	%rdx, %rax
1454da4df:     	je	0x1454da516 <.text+0x54d9516>
1454da4e1:     	movq	%rax, %r9
1454da4e4:     	subq	%rdx, %r9
1454da4e7:     	leaq	(%rdx,%rdx,8), %rdx
1454da4eb:     	leaq	(%rcx,%rdx,8), %rdx
1454da4ef:     	addq	$0x20, %rdx
1454da4f3:     	nopw	%cs:(%rax,%rax)
1454da500:     	xorl	%r10d, %r10d
1454da503:     	cmpl	$0x2, (%rdx)
1454da506:     	sete	%r10b
1454da50a:     	addq	%r10, %r8
1454da50d:     	addq	$0x48, %rdx
1454da511:     	decq	%r9
1454da514:     	jne	0x1454da500 <.text+0x54d9500>
1454da516:     	cmpq	$0x5, %r8
1454da51a:     	jb	0x1454db15d <.text+0x54da15d>
1454da520:     	shlq	$0x3, %rax
1454da524:     	leaq	(%rax,%rax,8), %rax
1454da528:     	xorl	%r9d, %r9d
1454da52b:     	xorl	%r8d, %r8d
1454da52e:     	nop
1454da530:     	cmpq	%r8, %rax
1454da533:     	je	0x1454db15d <.text+0x54da15d>
1454da539:     	leaq	0x48(%r8), %rdx
1454da53d:     	decq	%r9
1454da540:     	cmpl	$0x2, 0x20(%rcx,%r8)
1454da546:     	movq	%rdx, %r8
1454da549:     	jne	0x1454da530 <.text+0x54d9530>
1454da54b:     	movq	%r9, %r8
1454da54e:     	notq	%r8
1454da551:     	subq	%rdx, %rax
1454da554:     	je	0x1454db152 <.text+0x54da152>
1454da55a:     	leaq	(%rcx,%rdx), %r10
1454da55e:     	addq	%rdx, %rcx
1454da561:     	addq	$-0x48, %rcx
1454da565:     	movabsq	$-0x1c71c71c71c71c71, %rdx # imm = 0xE38E38E38E38E38F
1454da56f:     	mulq	%rdx
1454da572:     	shrq	$0x6, %rdx
1454da576:     	negq	%r9
1454da579:     	xorl	%eax, %eax
1454da57b:     	jmp	0x1454da590 <.text+0x54d9590>
1454da57d:     	nopl	(%rax)
1454da580:     	incq	%rax
1454da583:     	addq	$0x48, %r10
1454da587:     	cmpq	%rax, %rdx
1454da58a:     	je	0x1454db152 <.text+0x54da152>
1454da590:     	cmpl	$0x2, 0x20(%r10)
1454da595:     	jne	0x1454da580 <.text+0x54d9580>
1454da597:     	movl	0x40(%rcx), %r11d
1454da59b:     	movl	0x40(%r10), %esi
1454da59f:     	movl	%r11d, %ebx
1454da5a2:     	sarl	$0x1f, %ebx
1454da5a5:     	shrl	%ebx
1454da5a7:     	xorl	%r11d, %ebx
1454da5aa:     	movl	%esi, %r11d
1454da5ad:     	sarl	$0x1f, %r11d
1454da5b1:     	shrl	%r11d
1454da5b4:     	xorl	%esi, %r11d
1454da5b7:     	cmpl	%r11d, %ebx
1454da5ba:     	jle	0x1454da580 <.text+0x54d9580>
1454da5bc:     	leaq	(%r9,%rax), %r8
1454da5c0:     	movq	%r10, %rcx
1454da5c3:     	jmp	0x1454da580 <.text+0x54d9580>
1454da5c5:     	movq	%rax, %r10
1454da5c8:     	andq	$-0x2, %r10
1454da5cc:     	leaq	0x68(%rcx), %r11
1454da5d0:     	xorl	%r9d, %r9d
1454da5d3:     	xorl	%r8d, %r8d
1454da5d6:     	nopw	%cs:(%rax,%rax)
1454da5e0:     	movl	-0x50(%r11), %esi
1454da5e4:     	xorl	$0x1, %esi
1454da5e7:     	cmpl	$0x0, -0x48(%r11)
1454da5ec:     	cmovnel	%edx, %esi
1454da5ef:     	addq	%r8, %rsi
1454da5f2:     	movl	-0x8(%r11), %r8d
1454da5f6:     	xorl	$0x1, %r8d
1454da5fa:     	cmpl	$0x0, (%r11)
1454da5fe:     	cmovnel	%edx, %r8d
1454da602:     	addq	%rsi, %r8
1454da605:     	addq	$0x2, %r9
1454da609:     	addq	$0x90, %r11
1454da610:     	cmpq	%r9, %r10
1454da613:     	jne	0x1454da5e0 <.text+0x54d95e0>
1454da615:     	testb	$0x1, %al
1454da617:     	je	0x1454da633 <.text+0x54d9633>
1454da619:     	leaq	(%r9,%r9,8), %r9
1454da61d:     	movl	0x18(%rcx,%r9,8), %r10d
1454da622:     	xorl	$0x1, %r10d
1454da626:     	cmpl	$0x0, 0x20(%rcx,%r9,8)
1454da62c:     	cmovel	%r10d, %edx
1454da630:     	addq	%rdx, %r8
1454da633:     	cmpq	$0x2d, %r8
1454da637:     	jb	0x1454da699 <.text+0x54d9699>
1454da639:     	shlq	$0x3, %rax
1454da63d:     	leaq	(%rax,%rax,8), %rax
1454da641:     	xorl	%edx, %edx
1454da643:     	jmp	0x1454da659 <.text+0x54d9659>
1454da645:     	nopw	%cs:(%rax,%rax)
1454da650:     	addq	$0x48, %rdx
1454da654:     	cmpq	%rdx, %rax
1454da657:     	je	0x1454da699 <.text+0x54d9699>
1454da659:     	cmpl	$0x0, 0x20(%rcx,%rdx)
1454da65e:     	jne	0x1454da650 <.text+0x54d9650>
1454da660:     	cmpl	$0x1, 0x18(%rcx,%rdx)
1454da665:     	je	0x1454da650 <.text+0x54d9650>
1454da667:     	leaq	-0x48(%rax), %r9
1454da66b:     	leaq	(%rcx,%rdx), %r8
1454da66f:     	cmpq	%rdx, %r9
1454da672:     	je	0x1454db3f9 <.text+0x54da3f9>
1454da678:     	subq	%rdx, %rax
1454da67b:     	addq	$-0x48, %rax
1454da67f:     	addq	%rdx, %rcx
1454da682:     	addq	$0x48, %rcx
1454da686:     	movabsq	$-0x1c71c71c71c71c71, %rdx # imm = 0xE38E38E38E38E38F
1454da690:     	mulq	%rdx
1454da693:     	shrq	$0x6, %rdx
1454da697:     	jmp	0x1454da700 <.text+0x54d9700>
1454da699:     	movl	0x954(%rdi), %ebx
1454da69f:     	incl	%ebx
1454da6a1:     	movl	%ebx, 0x954(%rdi)
1454da6a7:     	andl	$0xffffff, %ebx         # imm = 0xFFFFFF
1454da6ad:     	movabsq	$-0xecfffdcd7000000, %rax # imm = 0xF130002329000000
1454da6b7:     	xorl	%ecx, %ecx
1454da6b9:     	cmpl	$0x4, %r12d
1454da6bd:     	setae	%dl
1454da6c0:     	cmpl	$0x14, %r12d
1454da6c4:     	movl	$0x40cb, %r8d           # imm = 0x40CB
1454da6ca:     	movl	$0x721, %r14d           # imm = 0x721
1454da6d0:     	cmovael	%r8d, %r14d
1454da6d4:     	jae	0x1454da758 <.text+0x54d9758>
1454da6da:     	movb	%dl, %cl
1454da6dc:     	leaq	0x151b82d(%rip), %rdx   # 0x1469f5f10
1454da6e3:     	movd	(%rdx,%rcx,4), %xmm9
1454da6e9:     	jmp	0x1454da761 <.text+0x54d9761>
1454da6eb:     	nopl	(%rax,%rax)
1454da6f0:     	movq	%rax, %r8
1454da6f3:     	addq	$0x48, %rcx
1454da6f7:     	decq	%rdx
1454da6fa:     	je	0x1454db3f2 <.text+0x54da3f2>
1454da700:     	cmpl	$0x0, 0x20(%rcx)
1454da704:     	jne	0x1454da6f3 <.text+0x54d96f3>
1454da706:     	cmpb	$0x0, 0x18(%rcx)
1454da70a:     	jne	0x1454da6f3 <.text+0x54d96f3>
1454da70c:     	movsd	0x34(%r8), %xmm0
1454da712:     	subps	%xmm6, %xmm0
1454da715:     	mulps	%xmm0, %xmm0
1454da718:     	movsd	0x34(%rcx), %xmm1
1454da71d:     	subps	%xmm6, %xmm1
1454da720:     	mulps	%xmm1, %xmm1
1454da723:     	haddps	%xmm1, %xmm0
1454da727:     	shufps	$0xe8, %xmm0, %xmm0     # xmm0 = xmm0[0,2,2,3]
1454da72b:     	movaps	%xmm0, %xmm1
1454da72e:     	psrad	$0x1f, %xmm1
1454da733:     	psrld	$0x1, %xmm1
1454da738:     	pxor	%xmm0, %xmm1
1454da73c:     	pshufd	$0x55, %xmm1, %xmm0     # xmm0 = xmm1[1,1,1,1]
1454da741:     	pcmpgtd	%xmm0, %xmm1
1454da745:     	movd	%xmm1, %r9d
1454da74a:     	movq	%rcx, %rax
1454da74d:     	testb	$0x1, %r9b
1454da751:     	jne	0x1454da6f0 <.text+0x54d96f0>
1454da753:     	movq	%r8, %rax
1454da756:     	jmp	0x1454da6f0 <.text+0x54d96f0>
1454da758:     	movd	0x42cdc3(%rip), %xmm9   # 0x145907524
1454da761:     	orq	%rax, %rbx
1454da764:     	movq	0x898(%rdi), %rsi
1454da76b:     	leaq	0x10(%rsi), %rcx
1454da76f:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454da774:     	movaps	%xmm6, %xmm1
1454da777:     	movaps	%xmm8, %xmm2
1454da77b:     	callq	0x14552a140 <.text+0x5529140>
1454da780:     	testb	$0x1, %al
1454da782:     	je	0x1454da789 <.text+0x54d9789>
1454da784:     	movaps	%xmm0, %xmm7
1454da787:     	jmp	0x1454da7b9 <.text+0x54d97b9>
1454da789:     	cmpq	$-0x1, 0x68(%rsi)
1454da78e:     	je	0x1454da7b1 <.text+0x54d97b1>
1454da790:     	leaq	0x68(%rsi), %rdx
1454da794:     	leaq	0x60(%rbp), %rcx
1454da798:     	movaps	%xmm6, %xmm2
1454da79b:     	movaps	%xmm8, %xmm3
1454da79f:     	callq	0x14552d220 <.text+0x552c220>
1454da7a4:     	cmpl	$0x1, 0x60(%rbp)
1454da7a8:     	jne	0x1454da7b1 <.text+0x54d97b1>
1454da7aa:     	movss	0x6c(%rbp), %xmm7
1454da7af:     	jmp	0x1454da7b9 <.text+0x54d97b9>
1454da7b1:     	movss	0xb8(%rsi), %xmm7
1454da7b9:     	movq	$0x0, 0x40(%rbp)
1454da7c1:     	movq	$0x0, 0x50(%rbp)
1454da7c9:     	leaq	0x40(%rbp), %r15
1454da7cd:     	movq	%r15, %rcx
1454da7d0:     	xorl	%edx, %edx
1454da7d2:     	movq	%rbx, %r8
1454da7d5:     	callq	0x145513710 <.text+0x5512710>
1454da7da:     	nop
1454da7db:     	movq	0x40(%rbp), %rax
1454da7df:     	testq	%rax, %rax
1454da7e2:     	je	0x1454da846 <.text+0x54d9846>
1454da7e4:     	movq	0x48(%rbp), %rcx
1454da7e8:     	movw	$0x2, %dx
1454da7ec:     	movzwl	0x36(%rax), %r9d
1454da7f1:     	movl	%r9d, %r10d
1454da7f4:     	addl	%r10d, %r10d
1454da7f7:     	movq	$-0x1, %r8
1454da7fe:     	nop
1454da800:     	testq	%r10, %r10
1454da803:     	je	0x1454da82b <.text+0x54d982b>
1454da805:     	cmpw	0x3a(%rax,%r8,2), %dx
1454da80b:     	seta	%r11b
1454da80f:     	sbbb	$0x0, %r11b
1454da813:     	incq	%r8
1454da816:     	addq	$-0x2, %r10
1454da81a:     	cmpb	$0x1, %r11b
1454da81e:     	je	0x1454da800 <.text+0x54d9800>
1454da820:     	movzbl	%r11b, %r9d
1454da824:     	testl	%r9d, %r9d
1454da827:     	jne	0x1454da82e <.text+0x54d982e>
1454da829:     	jmp	0x1454da83b <.text+0x54d983b>
1454da82b:     	movq	%r9, %r8
1454da82e:     	subq	$0x1, %rcx
1454da832:     	jb	0x1454da848 <.text+0x54d9848>
1454da834:     	movq	0x50(%rax,%r8,8), %rax
1454da839:     	jmp	0x1454da7ec <.text+0x54d97ec>
1454da83b:     	movl	$0x9, 0x8(%rax,%r8,4)
1454da844:     	jmp	0x1454da87b <.text+0x54d987b>
1454da846:     	xorl	%eax, %eax
1454da848:     	movq	%r15, 0x60(%rbp)
1454da84c:     	movq	%rax, 0x68(%rbp)
1454da850:     	movq	$0x0, 0x70(%rbp)
1454da858:     	movq	%r8, 0x78(%rbp)
1454da85c:     	movq	$0x2, 0x80(%rbp)
1454da867:     	leaq	0x20(%rbp), %rcx
1454da86b:     	leaq	0x60(%rbp), %rdx
1454da86f:     	movl	$0x9, %r8d
1454da875:     	callq	0x14552a730 <.text+0x5529730>
1454da87a:     	nop
1454da87b:     	movq	0x40(%rbp), %rax
1454da87f:     	testq	%rax, %rax
1454da882:     	je	0x1454da8e6 <.text+0x54d98e6>
1454da884:     	movq	0x48(%rbp), %rcx
1454da888:     	movw	$0x3, %dx
1454da88c:     	movzwl	0x36(%rax), %r9d
1454da891:     	movl	%r9d, %r10d
1454da894:     	addl	%r10d, %r10d
1454da897:     	movq	$-0x1, %r8
1454da89e:     	nop
1454da8a0:     	testq	%r10, %r10
1454da8a3:     	je	0x1454da8cb <.text+0x54d98cb>
1454da8a5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454da8ab:     	seta	%r11b
1454da8af:     	sbbb	$0x0, %r11b
1454da8b3:     	incq	%r8
1454da8b6:     	addq	$-0x2, %r10
1454da8ba:     	cmpb	$0x1, %r11b
1454da8be:     	je	0x1454da8a0 <.text+0x54d98a0>
1454da8c0:     	movzbl	%r11b, %r9d
1454da8c4:     	testl	%r9d, %r9d
1454da8c7:     	jne	0x1454da8ce <.text+0x54d98ce>
1454da8c9:     	jmp	0x1454da8db <.text+0x54d98db>
1454da8cb:     	movq	%r9, %r8
1454da8ce:     	subq	$0x1, %rcx
1454da8d2:     	jb	0x1454da8e8 <.text+0x54d98e8>
1454da8d4:     	movq	0x50(%rax,%r8,8), %rax
1454da8d9:     	jmp	0x1454da88c <.text+0x54d988c>
1454da8db:     	movl	$0x2329, 0x8(%rax,%r8,4) # imm = 0x2329
1454da8e4:     	jmp	0x1454da91b <.text+0x54d991b>
1454da8e6:     	xorl	%eax, %eax
1454da8e8:     	movq	%r15, 0x60(%rbp)
1454da8ec:     	movq	%rax, 0x68(%rbp)
1454da8f0:     	movq	$0x0, 0x70(%rbp)
1454da8f8:     	movq	%r8, 0x78(%rbp)
1454da8fc:     	movq	$0x3, 0x80(%rbp)
1454da907:     	leaq	0x20(%rbp), %rcx
1454da90b:     	leaq	0x60(%rbp), %rdx
1454da90f:     	movl	$0x2329, %r8d           # imm = 0x2329
1454da915:     	callq	0x14552a730 <.text+0x5529730>
1454da91a:     	nop
1454da91b:     	movq	0x40(%rbp), %rax
1454da91f:     	testq	%rax, %rax
1454da922:     	je	0x1454da984 <.text+0x54d9984>
1454da924:     	movq	0x48(%rbp), %rcx
1454da928:     	movw	$0x4, %dx
1454da92c:     	movzwl	0x36(%rax), %r8d
1454da931:     	movl	%r8d, %r10d
1454da934:     	addl	%r10d, %r10d
1454da937:     	movq	$-0x1, %r9
1454da93e:     	nop
1454da940:     	testq	%r10, %r10
1454da943:     	je	0x1454da96b <.text+0x54d996b>
1454da945:     	cmpw	0x3a(%rax,%r9,2), %dx
1454da94b:     	seta	%r11b
1454da94f:     	sbbb	$0x0, %r11b
1454da953:     	incq	%r9
1454da956:     	addq	$-0x2, %r10
1454da95a:     	cmpb	$0x1, %r11b
1454da95e:     	je	0x1454da940 <.text+0x54d9940>
1454da960:     	movzbl	%r11b, %r8d
1454da964:     	testl	%r8d, %r8d
1454da967:     	jne	0x1454da96e <.text+0x54d996e>
1454da969:     	jmp	0x1454da97b <.text+0x54d997b>
1454da96b:     	movq	%r8, %r9
1454da96e:     	subq	$0x1, %rcx
1454da972:     	jb	0x1454da986 <.text+0x54d9986>
1454da974:     	movq	0x50(%rax,%r9,8), %rax
1454da979:     	jmp	0x1454da92c <.text+0x54d992c>
1454da97b:     	movd	%xmm9, 0x8(%rax,%r9,4)
1454da982:     	jmp	0x1454da9b8 <.text+0x54d99b8>
1454da984:     	xorl	%eax, %eax
1454da986:     	movd	%xmm9, %r8d
1454da98b:     	movq	%r15, 0x60(%rbp)
1454da98f:     	movq	%rax, 0x68(%rbp)
1454da993:     	movq	$0x0, 0x70(%rbp)
1454da99b:     	movq	%r9, 0x78(%rbp)
1454da99f:     	movq	$0x4, 0x80(%rbp)
1454da9aa:     	leaq	0x20(%rbp), %rcx
1454da9ae:     	leaq	0x60(%rbp), %rdx
1454da9b2:     	callq	0x14552a730 <.text+0x5529730>
1454da9b7:     	nop
1454da9b8:     	movq	0x40(%rbp), %rax
1454da9bc:     	testq	%rax, %rax
1454da9bf:     	je	0x1454daa26 <.text+0x54d9a26>
1454da9c1:     	movq	0x48(%rbp), %rcx
1454da9c5:     	movw	$0x16, %dx
1454da9c9:     	movzwl	0x36(%rax), %r9d
1454da9ce:     	movl	%r9d, %r10d
1454da9d1:     	addl	%r10d, %r10d
1454da9d4:     	movq	$-0x1, %r8
1454da9db:     	nopl	(%rax,%rax)
1454da9e0:     	testq	%r10, %r10
1454da9e3:     	je	0x1454daa0b <.text+0x54d9a0b>
1454da9e5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454da9eb:     	seta	%r11b
1454da9ef:     	sbbb	$0x0, %r11b
1454da9f3:     	incq	%r8
1454da9f6:     	addq	$-0x2, %r10
1454da9fa:     	cmpb	$0x1, %r11b
1454da9fe:     	je	0x1454da9e0 <.text+0x54d99e0>
1454daa00:     	movzbl	%r11b, %r9d
1454daa04:     	testl	%r9d, %r9d
1454daa07:     	jne	0x1454daa0e <.text+0x54d9a0e>
1454daa09:     	jmp	0x1454daa1b <.text+0x54d9a1b>
1454daa0b:     	movq	%r9, %r8
1454daa0e:     	subq	$0x1, %rcx
1454daa12:     	jb	0x1454daa28 <.text+0x54d9a28>
1454daa14:     	movq	0x50(%rax,%r8,8), %rax
1454daa19:     	jmp	0x1454da9c9 <.text+0x54d99c9>
1454daa1b:     	movl	$0x1, 0x8(%rax,%r8,4)
1454daa24:     	jmp	0x1454daa5b <.text+0x54d9a5b>
1454daa26:     	xorl	%eax, %eax
1454daa28:     	movq	%r15, 0x60(%rbp)
1454daa2c:     	movq	%rax, 0x68(%rbp)
1454daa30:     	movq	$0x0, 0x70(%rbp)
1454daa38:     	movq	%r8, 0x78(%rbp)
1454daa3c:     	movq	$0x16, 0x80(%rbp)
1454daa47:     	leaq	0x20(%rbp), %rcx
1454daa4b:     	leaq	0x60(%rbp), %rdx
1454daa4f:     	movl	$0x1, %r8d
1454daa55:     	callq	0x14552a730 <.text+0x5529730>
1454daa5a:     	nop
1454daa5b:     	movq	0x40(%rbp), %rax
1454daa5f:     	testq	%rax, %rax
1454daa62:     	je	0x1454daac6 <.text+0x54d9ac6>
1454daa64:     	movq	0x48(%rbp), %rcx
1454daa68:     	movw	$0x1c, %dx
1454daa6c:     	movzwl	0x36(%rax), %r9d
1454daa71:     	movl	%r9d, %r10d
1454daa74:     	addl	%r10d, %r10d
1454daa77:     	movq	$-0x1, %r8
1454daa7e:     	nop
1454daa80:     	testq	%r10, %r10
1454daa83:     	je	0x1454daaab <.text+0x54d9aab>
1454daa85:     	cmpw	0x3a(%rax,%r8,2), %dx
1454daa8b:     	seta	%r11b
1454daa8f:     	sbbb	$0x0, %r11b
1454daa93:     	incq	%r8
1454daa96:     	addq	$-0x2, %r10
1454daa9a:     	cmpb	$0x1, %r11b
1454daa9e:     	je	0x1454daa80 <.text+0x54d9a80>
1454daaa0:     	movzbl	%r11b, %r9d
1454daaa4:     	testl	%r9d, %r9d
1454daaa7:     	jne	0x1454daaae <.text+0x54d9aae>
1454daaa9:     	jmp	0x1454daabb <.text+0x54d9abb>
1454daaab:     	movq	%r9, %r8
1454daaae:     	subq	$0x1, %rcx
1454daab2:     	jb	0x1454daac8 <.text+0x54d9ac8>
1454daab4:     	movq	0x50(%rax,%r8,8), %rax
1454daab9:     	jmp	0x1454daa6c <.text+0x54d9a6c>
1454daabb:     	movl	$0x1, 0x8(%rax,%r8,4)
1454daac4:     	jmp	0x1454daafb <.text+0x54d9afb>
1454daac6:     	xorl	%eax, %eax
1454daac8:     	movq	%r15, 0x60(%rbp)
1454daacc:     	movq	%rax, 0x68(%rbp)
1454daad0:     	movq	$0x0, 0x70(%rbp)
1454daad8:     	movq	%r8, 0x78(%rbp)
1454daadc:     	movq	$0x1c, 0x80(%rbp)
1454daae7:     	leaq	0x20(%rbp), %rcx
1454daaeb:     	leaq	0x60(%rbp), %rdx
1454daaef:     	movl	$0x1, %r8d
1454daaf5:     	callq	0x14552a730 <.text+0x5529730>
1454daafa:     	nop
1454daafb:     	movq	0x40(%rbp), %rax
1454daaff:     	testq	%rax, %rax
1454dab02:     	je	0x1454dab66 <.text+0x54d9b66>
1454dab04:     	movq	0x48(%rbp), %rcx
1454dab08:     	movw	$0x22, %dx
1454dab0c:     	movzwl	0x36(%rax), %r9d
1454dab11:     	movl	%r9d, %r10d
1454dab14:     	addl	%r10d, %r10d
1454dab17:     	movq	$-0x1, %r8
1454dab1e:     	nop
1454dab20:     	testq	%r10, %r10
1454dab23:     	je	0x1454dab4b <.text+0x54d9b4b>
1454dab25:     	cmpw	0x3a(%rax,%r8,2), %dx
1454dab2b:     	seta	%r11b
1454dab2f:     	sbbb	$0x0, %r11b
1454dab33:     	incq	%r8
1454dab36:     	addq	$-0x2, %r10
1454dab3a:     	cmpb	$0x1, %r11b
1454dab3e:     	je	0x1454dab20 <.text+0x54d9b20>
1454dab40:     	movzbl	%r11b, %r9d
1454dab44:     	testl	%r9d, %r9d
1454dab47:     	jne	0x1454dab4e <.text+0x54d9b4e>
1454dab49:     	jmp	0x1454dab5b <.text+0x54d9b5b>
1454dab4b:     	movq	%r9, %r8
1454dab4e:     	subq	$0x1, %rcx
1454dab52:     	jb	0x1454dab68 <.text+0x54d9b68>
1454dab54:     	movq	0x50(%rax,%r8,8), %rax
1454dab59:     	jmp	0x1454dab0c <.text+0x54d9b0c>
1454dab5b:     	movl	$0x1, 0x8(%rax,%r8,4)
1454dab64:     	jmp	0x1454dab9b <.text+0x54d9b9b>
1454dab66:     	xorl	%eax, %eax
1454dab68:     	movq	%r15, 0x60(%rbp)
1454dab6c:     	movq	%rax, 0x68(%rbp)
1454dab70:     	movq	$0x0, 0x70(%rbp)
1454dab78:     	movq	%r8, 0x78(%rbp)
1454dab7c:     	movq	$0x22, 0x80(%rbp)
1454dab87:     	leaq	0x20(%rbp), %rcx
1454dab8b:     	leaq	0x60(%rbp), %rdx
1454dab8f:     	movl	$0x1, %r8d
1454dab95:     	callq	0x14552a730 <.text+0x5529730>
1454dab9a:     	nop
1454dab9b:     	movq	0x40(%rbp), %rax
1454dab9f:     	testq	%rax, %rax
1454daba2:     	je	0x1454dac06 <.text+0x54d9c06>
1454daba4:     	movq	0x48(%rbp), %rcx
1454daba8:     	movw	$0x23, %dx
1454dabac:     	movzwl	0x36(%rax), %r9d
1454dabb1:     	movl	%r9d, %r10d
1454dabb4:     	addl	%r10d, %r10d
1454dabb7:     	movq	$-0x1, %r8
1454dabbe:     	nop
1454dabc0:     	testq	%r10, %r10
1454dabc3:     	je	0x1454dabeb <.text+0x54d9beb>
1454dabc5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454dabcb:     	seta	%r11b
1454dabcf:     	sbbb	$0x0, %r11b
1454dabd3:     	incq	%r8
1454dabd6:     	addq	$-0x2, %r10
1454dabda:     	cmpb	$0x1, %r11b
1454dabde:     	je	0x1454dabc0 <.text+0x54d9bc0>
1454dabe0:     	movzbl	%r11b, %r9d
1454dabe4:     	testl	%r9d, %r9d
1454dabe7:     	jne	0x1454dabee <.text+0x54d9bee>
1454dabe9:     	jmp	0x1454dabfb <.text+0x54d9bfb>
1454dabeb:     	movq	%r9, %r8
1454dabee:     	subq	$0x1, %rcx
1454dabf2:     	jb	0x1454dac08 <.text+0x54d9c08>
1454dabf4:     	movq	0x50(%rax,%r8,8), %rax
1454dabf9:     	jmp	0x1454dabac <.text+0x54d9bac>
1454dabfb:     	movl	$0x23, 0x8(%rax,%r8,4)
1454dac04:     	jmp	0x1454dac3b <.text+0x54d9c3b>
1454dac06:     	xorl	%eax, %eax
1454dac08:     	movq	%r15, 0x60(%rbp)
1454dac0c:     	movq	%rax, 0x68(%rbp)
1454dac10:     	movq	$0x0, 0x70(%rbp)
1454dac18:     	movq	%r8, 0x78(%rbp)
1454dac1c:     	movq	$0x23, 0x80(%rbp)
1454dac27:     	leaq	0x20(%rbp), %rcx
1454dac2b:     	leaq	0x60(%rbp), %rdx
1454dac2f:     	movl	$0x23, %r8d
1454dac35:     	callq	0x14552a730 <.text+0x5529730>
1454dac3a:     	nop
1454dac3b:     	movq	0x40(%rbp), %rax
1454dac3f:     	testq	%rax, %rax
1454dac42:     	je	0x1454daca6 <.text+0x54d9ca6>
1454dac44:     	movq	0x48(%rbp), %rcx
1454dac48:     	movw	$0x2e, %dx
1454dac4c:     	movzwl	0x36(%rax), %r9d
1454dac51:     	movl	%r9d, %r10d
1454dac54:     	addl	%r10d, %r10d
1454dac57:     	movq	$-0x1, %r8
1454dac5e:     	nop
1454dac60:     	testq	%r10, %r10
1454dac63:     	je	0x1454dac8b <.text+0x54d9c8b>
1454dac65:     	cmpw	0x3a(%rax,%r8,2), %dx
1454dac6b:     	seta	%r11b
1454dac6f:     	sbbb	$0x0, %r11b
1454dac73:     	incq	%r8
1454dac76:     	addq	$-0x2, %r10
1454dac7a:     	cmpb	$0x1, %r11b
1454dac7e:     	je	0x1454dac60 <.text+0x54d9c60>
1454dac80:     	movzbl	%r11b, %r9d
1454dac84:     	testl	%r9d, %r9d
1454dac87:     	jne	0x1454dac8e <.text+0x54d9c8e>
1454dac89:     	jmp	0x1454dac9b <.text+0x54d9c9b>
1454dac8b:     	movq	%r9, %r8
1454dac8e:     	subq	$0x1, %rcx
1454dac92:     	jb	0x1454daca8 <.text+0x54d9ca8>
1454dac94:     	movq	0x50(%rax,%r8,8), %rax
1454dac99:     	jmp	0x1454dac4c <.text+0x54d9c4c>
1454dac9b:     	movl	$0x2000002, 0x8(%rax,%r8,4) # imm = 0x2000002
1454daca4:     	jmp	0x1454dacdb <.text+0x54d9cdb>
1454daca6:     	xorl	%eax, %eax
1454daca8:     	movq	%r15, 0x60(%rbp)
1454dacac:     	movq	%rax, 0x68(%rbp)
1454dacb0:     	movq	$0x0, 0x70(%rbp)
1454dacb8:     	movq	%r8, 0x78(%rbp)
1454dacbc:     	movq	$0x2e, 0x80(%rbp)
1454dacc7:     	leaq	0x20(%rbp), %rcx
1454daccb:     	leaq	0x60(%rbp), %rdx
1454daccf:     	movl	$0x2000002, %r8d        # imm = 0x2000002
1454dacd5:     	callq	0x14552a730 <.text+0x5529730>
1454dacda:     	nop
1454dacdb:     	movq	0x40(%rbp), %rax
1454dacdf:     	testq	%rax, %rax
1454dace2:     	je	0x1454dad49 <.text+0x54d9d49>
1454dace4:     	movq	0x48(%rbp), %rcx
1454dace8:     	movl	$0x81, %edx
1454daced:     	movzwl	0x36(%rax), %r9d
1454dacf2:     	movl	%r9d, %r10d
1454dacf5:     	addl	%r10d, %r10d
1454dacf8:     	movq	$-0x1, %r8
1454dacff:     	nop
1454dad00:     	testq	%r10, %r10
1454dad03:     	je	0x1454dad2e <.text+0x54d9d2e>
1454dad05:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454dad0b:     	cmpl	%r11d, %edx
1454dad0e:     	seta	%r11b
1454dad12:     	sbbb	$0x0, %r11b
1454dad16:     	incq	%r8
1454dad19:     	addq	$-0x2, %r10
1454dad1d:     	cmpb	$0x1, %r11b
1454dad21:     	je	0x1454dad00 <.text+0x54d9d00>
1454dad23:     	movzbl	%r11b, %r9d
1454dad27:     	testl	%r9d, %r9d
1454dad2a:     	jne	0x1454dad31 <.text+0x54d9d31>
1454dad2c:     	jmp	0x1454dad3e <.text+0x54d9d3e>
1454dad2e:     	movq	%r9, %r8
1454dad31:     	subq	$0x1, %rcx
1454dad35:     	jb	0x1454dad4b <.text+0x54d9d4b>
1454dad37:     	movq	0x50(%rax,%r8,8), %rax
1454dad3c:     	jmp	0x1454daced <.text+0x54d9ced>
1454dad3e:     	movl	$0x3dcccccd, 0x8(%rax,%r8,4) # imm = 0x3DCCCCCD
1454dad47:     	jmp	0x1454dad7e <.text+0x54d9d7e>
1454dad49:     	xorl	%eax, %eax
1454dad4b:     	movq	%r15, 0x60(%rbp)
1454dad4f:     	movq	%rax, 0x68(%rbp)
1454dad53:     	movq	$0x0, 0x70(%rbp)
1454dad5b:     	movq	%r8, 0x78(%rbp)
1454dad5f:     	movq	$0x81, 0x80(%rbp)
1454dad6a:     	leaq	0x20(%rbp), %rcx
1454dad6e:     	leaq	0x60(%rbp), %rdx
1454dad72:     	movl	$0x3dcccccd, %r8d       # imm = 0x3DCCCCCD
1454dad78:     	callq	0x14552a730 <.text+0x5529730>
1454dad7d:     	nop
1454dad7e:     	movq	0x40(%rbp), %rax
1454dad82:     	testq	%rax, %rax
1454dad85:     	je	0x1454dadf9 <.text+0x54d9df9>
1454dad87:     	movq	0x48(%rbp), %rcx
1454dad8b:     	movl	$0x82, %edx
1454dad90:     	movzwl	0x36(%rax), %r9d
1454dad95:     	movl	%r9d, %r10d
1454dad98:     	addl	%r10d, %r10d
1454dad9b:     	movq	$-0x1, %r8
1454dada2:     	nopw	%cs:(%rax,%rax)
1454dadb0:     	testq	%r10, %r10
1454dadb3:     	je	0x1454dadde <.text+0x54d9dde>
1454dadb5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454dadbb:     	cmpl	%r11d, %edx
1454dadbe:     	seta	%r11b
1454dadc2:     	sbbb	$0x0, %r11b
1454dadc6:     	incq	%r8
1454dadc9:     	addq	$-0x2, %r10
1454dadcd:     	cmpb	$0x1, %r11b
1454dadd1:     	je	0x1454dadb0 <.text+0x54d9db0>
1454dadd3:     	movzbl	%r11b, %r9d
1454dadd7:     	testl	%r9d, %r9d
1454dadda:     	jne	0x1454dade1 <.text+0x54d9de1>
1454daddc:     	jmp	0x1454dadee <.text+0x54d9dee>
1454dadde:     	movq	%r9, %r8
1454dade1:     	subq	$0x1, %rcx
1454dade5:     	jb	0x1454dadfb <.text+0x54d9dfb>
1454dade7:     	movq	0x50(%rax,%r8,8), %rax
1454dadec:     	jmp	0x1454dad90 <.text+0x54d9d90>
1454dadee:     	movl	$0x3dcccccd, 0x8(%rax,%r8,4) # imm = 0x3DCCCCCD
1454dadf7:     	jmp	0x1454dae2e <.text+0x54d9e2e>
1454dadf9:     	xorl	%eax, %eax
1454dadfb:     	movq	%r15, 0x60(%rbp)
1454dadff:     	movq	%rax, 0x68(%rbp)
1454dae03:     	movq	$0x0, 0x70(%rbp)
1454dae0b:     	movq	%r8, 0x78(%rbp)
1454dae0f:     	movq	$0x82, 0x80(%rbp)
1454dae1a:     	leaq	0x20(%rbp), %rcx
1454dae1e:     	leaq	0x60(%rbp), %rdx
1454dae22:     	movl	$0x3dcccccd, %r8d       # imm = 0x3DCCCCCD
1454dae28:     	callq	0x14552a730 <.text+0x5529730>
1454dae2d:     	nop
1454dae2e:     	movq	0x40(%rbp), %rax
1454dae32:     	testq	%rax, %rax
1454dae35:     	je	0x1454daea5 <.text+0x54d9ea5>
1454dae37:     	movq	0x48(%rbp), %rcx
1454dae3b:     	movl	$0x83, %edx
1454dae40:     	movzwl	0x36(%rax), %r9d
1454dae45:     	movl	%r9d, %r10d
1454dae48:     	addl	%r10d, %r10d
1454dae4b:     	movq	$-0x1, %r8
1454dae52:     	nopw	%cs:(%rax,%rax)
1454dae60:     	testq	%r10, %r10
1454dae63:     	je	0x1454dae8e <.text+0x54d9e8e>
1454dae65:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454dae6b:     	cmpl	%r11d, %edx
1454dae6e:     	seta	%r11b
1454dae72:     	sbbb	$0x0, %r11b
1454dae76:     	incq	%r8
1454dae79:     	addq	$-0x2, %r10
1454dae7d:     	cmpb	$0x1, %r11b
1454dae81:     	je	0x1454dae60 <.text+0x54d9e60>
1454dae83:     	movzbl	%r11b, %r9d
1454dae87:     	testl	%r9d, %r9d
1454dae8a:     	jne	0x1454dae91 <.text+0x54d9e91>
1454dae8c:     	jmp	0x1454dae9e <.text+0x54d9e9e>
1454dae8e:     	movq	%r9, %r8
1454dae91:     	subq	$0x1, %rcx
1454dae95:     	jb	0x1454daea7 <.text+0x54d9ea7>
1454dae97:     	movq	0x50(%rax,%r8,8), %rax
1454dae9c:     	jmp	0x1454dae40 <.text+0x54d9e40>
1454dae9e:     	movl	%r14d, 0x8(%rax,%r8,4)
1454daea3:     	jmp	0x1454daed7 <.text+0x54d9ed7>
1454daea5:     	xorl	%eax, %eax
1454daea7:     	movq	%r15, 0x60(%rbp)
1454daeab:     	movq	%rax, 0x68(%rbp)
1454daeaf:     	movq	$0x0, 0x70(%rbp)
1454daeb7:     	movq	%r8, 0x78(%rbp)
1454daebb:     	movq	$0x83, 0x80(%rbp)
1454daec6:     	leaq	0x20(%rbp), %rcx
1454daeca:     	leaq	0x60(%rbp), %rdx
1454daece:     	movl	%r14d, %r8d
1454daed1:     	callq	0x14552a730 <.text+0x5529730>
1454daed6:     	nop
1454daed7:     	movq	0x40(%rbp), %rax
1454daedb:     	testq	%rax, %rax
1454daede:     	je	0x1454daf45 <.text+0x54d9f45>
1454daee0:     	movq	0x48(%rbp), %rcx
1454daee4:     	movl	$0x84, %edx
1454daee9:     	movzwl	0x36(%rax), %r9d
1454daeee:     	movl	%r9d, %r10d
1454daef1:     	addl	%r10d, %r10d
1454daef4:     	movq	$-0x1, %r8
1454daefb:     	nopl	(%rax,%rax)
1454daf00:     	testq	%r10, %r10
1454daf03:     	je	0x1454daf2e <.text+0x54d9f2e>
1454daf05:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454daf0b:     	cmpl	%r11d, %edx
1454daf0e:     	seta	%r11b
1454daf12:     	sbbb	$0x0, %r11b
1454daf16:     	incq	%r8
1454daf19:     	addq	$-0x2, %r10
1454daf1d:     	cmpb	$0x1, %r11b
1454daf21:     	je	0x1454daf00 <.text+0x54d9f00>
1454daf23:     	movzbl	%r11b, %r9d
1454daf27:     	testl	%r9d, %r9d
1454daf2a:     	jne	0x1454daf31 <.text+0x54d9f31>
1454daf2c:     	jmp	0x1454daf3e <.text+0x54d9f3e>
1454daf2e:     	movq	%r9, %r8
1454daf31:     	subq	$0x1, %rcx
1454daf35:     	jb	0x1454daf47 <.text+0x54d9f47>
1454daf37:     	movq	0x50(%rax,%r8,8), %rax
1454daf3c:     	jmp	0x1454daee9 <.text+0x54d9ee9>
1454daf3e:     	movl	%r14d, 0x8(%rax,%r8,4)
1454daf43:     	jmp	0x1454daf77 <.text+0x54d9f77>
1454daf45:     	xorl	%eax, %eax
1454daf47:     	movq	%r15, 0x60(%rbp)
1454daf4b:     	movq	%rax, 0x68(%rbp)
1454daf4f:     	movq	$0x0, 0x70(%rbp)
1454daf57:     	movq	%r8, 0x78(%rbp)
1454daf5b:     	movq	$0x84, 0x80(%rbp)
1454daf66:     	leaq	0x20(%rbp), %rcx
1454daf6a:     	leaq	0x60(%rbp), %rdx
1454daf6e:     	movl	%r14d, %r8d
1454daf71:     	callq	0x14552a730 <.text+0x5529730>
1454daf76:     	nop
1454daf77:     	movl	$0x0, (%rbp)
1454daf7e:     	movq	$0x0, -0x18(%rbp)
1454daf86:     	movq	$0x1, -0x10(%rbp)
1454daf8e:     	movq	$0x0, -0x8(%rbp)
1454daf96:     	movlps	%xmm6, 0x60(%rbp)
1454daf9a:     	movss	%xmm7, 0x68(%rbp)
1454daf9f:     	movb	$0x1, 0x97(%rbp)
1454dafa6:     	movq	%r15, 0x38(%rsp)
1454dafab:     	leaq	0x151ba56(%rip), %rax   # 0x1469f6a08
1454dafb2:     	movq	%rax, 0x30(%rsp)
1454dafb7:     	leaq	0x60(%rbp), %rax
1454dafbb:     	movq	%rax, 0x20(%rsp)
1454dafc0:     	movl	$0x0, 0x28(%rsp)
1454dafc8:     	leaq	-0x18(%rbp), %rcx
1454dafcc:     	movq	%rbx, %rdx
1454dafcf:     	movb	$0x3, %r8b
1454dafd2:     	xorl	%r9d, %r9d
1454dafd5:     	callq	0x145512720 <.text+0x5511720>
1454dafda:     	nop
1454dafdb:     	movups	-0x18(%rbp), %xmm0
1454dafdf:     	movups	-0x8(%rbp), %xmm1
1454dafe3:     	movaps	%xmm1, 0x70(%rbp)
1454dafe7:     	movaps	%xmm0, 0x60(%rbp)
1454dafeb:     	movb	$0x0, 0x97(%rbp)
1454daff2:     	leaq	0x20(%rbp), %rcx
1454daff6:     	leaq	0x60(%rbp), %rdx
1454daffa:     	callq	0x145512ef0 <.text+0x5511ef0>
1454dafff:     	nop
1454db000:     	movq	0x560(%rdi), %rsi
1454db007:     	cmpq	0x550(%rdi), %rsi
1454db00e:     	jne	0x1454db01d <.text+0x54da01d>
1454db010:     	leaq	0x550(%rdi), %rcx
1454db017:     	callq	0x145774710 <.text+0x5773710>
1454db01c:     	nop
1454db01d:     	movq	0x558(%rdi), %rax
1454db024:     	movq	%rsi, %rcx
1454db027:     	shlq	$0x5, %rcx
1454db02b:     	movups	0x20(%rbp), %xmm0
1454db02f:     	movups	0x30(%rbp), %xmm1
1454db033:     	movups	%xmm1, 0x10(%rax,%rcx)
1454db038:     	movups	%xmm0, (%rax,%rcx)
1454db03c:     	incq	%rsi
1454db03f:     	movq	%rsi, 0x560(%rdi)
1454db046:     	movss	0x934(%rdi), %xmm8
1454db04f:     	movq	0x548(%rdi), %rsi
1454db056:     	cmpq	0x538(%rdi), %rsi
1454db05d:     	jne	0x1454db073 <.text+0x54da073>
1454db05f:     	leaq	0x538(%rdi), %rcx
1454db066:     	movb	$0x0, 0x97(%rbp)
1454db06d:     	callq	0x145774630 <.text+0x5773630>
1454db072:     	nop
1454db073:     	movq	0x540(%rdi), %rax
1454db07a:     	leaq	(%rsi,%rsi,8), %rcx
1454db07e:     	movq	$0x0, (%rax,%rcx,8)
1454db086:     	movq	$0x8, 0x8(%rax,%rcx,8)
1454db08f:     	movq	$0x0, 0x10(%rax,%rcx,8)
1454db098:     	movl	$0x0, 0x18(%rax,%rcx,8)
1454db0a0:     	movl	$0x0, 0x20(%rax,%rcx,8)
1454db0a8:     	movl	%r12d, 0x24(%rax,%rcx,8)
1454db0ad:     	movq	%rbx, 0x28(%rax,%rcx,8)
1454db0b2:     	movl	$0x2329, 0x30(%rax,%rcx,8) # imm = 0x2329
1454db0ba:     	movlps	%xmm6, 0x34(%rax,%rcx,8)
1454db0bf:     	movss	%xmm7, 0x3c(%rax,%rcx,8)
1454db0c5:     	movss	%xmm8, 0x40(%rax,%rcx,8)
1454db0cc:     	incq	%rsi
1454db0cf:     	movq	%rsi, 0x548(%rdi)
1454db0d6:     	leaq	0x40(%rbp), %rcx
1454db0da:     	callq	0x14550cd20 <.text+0x550bd20>
1454db0df:     	jmp	0x1454db3c0 <.text+0x54da3c0>
1454db0e4:     	movl	%r15d, %r13d
1454db0e7:     	movl	$0x2330, 0x5c(%rbp)     # imm = 0x2330
1454db0ee:     	movabsq	$0x3f80000000001767, %r15 # imm = 0x3F80000000001767
1454db0f8:     	jmp	0x1454db15d <.text+0x54da15d>
1454db0fa:     	movl	%r15d, %r13d
1454db0fd:     	movl	$0x232e, 0x5c(%rbp)     # imm = 0x232E
1454db104:     	movabsq	$0x3f8000000000172b, %r15 # imm = 0x3F8000000000172B
1454db10e:     	jmp	0x1454db15d <.text+0x54da15d>
1454db110:     	movl	%r15d, %r13d
1454db113:     	movl	$0x232c, 0x5c(%rbp)     # imm = 0x232C
1454db11a:     	movabsq	$0x3f19999a00000a36, %r15 # imm = 0x3F19999A00000A36
1454db124:     	jmp	0x1454db15d <.text+0x54da15d>
1454db126:     	movl	%r15d, %r13d
1454db129:     	movl	$0x232f, 0x5c(%rbp)     # imm = 0x232F
1454db130:     	movabsq	$0x3f8000000000176b, %r15 # imm = 0x3F8000000000176B
1454db13a:     	jmp	0x1454db15d <.text+0x54da15d>
1454db13c:     	movl	%r15d, %r13d
1454db13f:     	movl	$0x2331, 0x5c(%rbp)     # imm = 0x2331
1454db146:     	movabsq	$0x3fa6666600000156, %r15 # imm = 0x3FA6666600000156
1454db150:     	jmp	0x1454db15d <.text+0x54da15d>
1454db152:     	movq	%rdi, %rcx
1454db155:     	movq	%r8, %rdx
1454db158:     	callq	0x1454e3210 <.text+0x54e2210>
1454db15d:     	movq	0x898(%rdi), %rsi
1454db164:     	leaq	0x10(%rsi), %rcx
1454db168:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454db16d:     	movaps	%xmm6, %xmm1
1454db170:     	movaps	%xmm8, %xmm2
1454db174:     	callq	0x14552a140 <.text+0x5529140>
1454db179:     	testb	$0x1, %al
1454db17b:     	je	0x1454db182 <.text+0x54da182>
1454db17d:     	movaps	%xmm0, %xmm7
1454db180:     	jmp	0x1454db1b2 <.text+0x54da1b2>
1454db182:     	cmpq	$-0x1, 0x68(%rsi)
1454db187:     	je	0x1454db1aa <.text+0x54da1aa>
1454db189:     	leaq	0x68(%rsi), %rdx
1454db18d:     	leaq	0x60(%rbp), %rcx
1454db191:     	movaps	%xmm6, %xmm2
1454db194:     	movaps	%xmm8, %xmm3
1454db198:     	callq	0x14552d220 <.text+0x552c220>
1454db19d:     	cmpl	$0x1, 0x60(%rbp)
1454db1a1:     	jne	0x1454db1aa <.text+0x54da1aa>
1454db1a3:     	movss	0x6c(%rbp), %xmm7
1454db1a8:     	jmp	0x1454db1b2 <.text+0x54da1b2>
1454db1aa:     	movss	0xb8(%rsi), %xmm7
1454db1b2:     	movl	0x5c(%rbp), %eax
1454db1b5:     	movl	%eax, 0x20(%rbp)
1454db1b8:     	movq	%r15, 0x24(%rbp)
1454db1bc:     	movlps	%xmm6, 0x60(%rbp)
1454db1c0:     	movss	%xmm7, 0x68(%rbp)
1454db1c5:     	movl	$0x0, 0x20(%rsp)
1454db1cd:     	leaq	0x20(%rbp), %rdx
1454db1d1:     	leaq	0x60(%rbp), %r8
1454db1d5:     	movq	%rdi, %rcx
1454db1d8:     	movl	%r14d, %r9d
1454db1db:     	callq	0x1454e4a00 <.text+0x54e3a00>
1454db1e0:     	movq	%rax, %r14
1454db1e3:     	movq	$0x0, 0x20(%rbp)
1454db1eb:     	movq	$0x8, 0x28(%rbp)
1454db1f3:     	movq	$0x0, 0x30(%rbp)
1454db1fb:     	cmpl	$0x6, %r13d
1454db1ff:     	jne	0x1454db2f5 <.text+0x54da2f5>
1454db205:     	movq	%r14, -0x38(%rbp)
1454db209:     	movl	%r13d, 0xc(%rbp)
1454db20d:     	movl	%r12d, 0x8(%rbp)
1454db211:     	movabsq	$0xcc700002332, %rax    # imm = 0xCC700002332
1454db21b:     	movq	%rax, -0x30(%rbp)
1454db21f:     	movl	$0x3f800000, -0x28(%rbp) # imm = 0x3F800000
1454db226:     	movabsq	$0x8b800002333, %rax    # imm = 0x8B800002333
1454db230:     	movq	%rax, -0x24(%rbp)
1454db234:     	movl	$0x3fcccccd, -0x1c(%rbp) # imm = 0x3FCCCCCD
1454db23b:     	movq	$0x2, 0x68(%rbp)
1454db243:     	leaq	0x70(%rbp), %rbx
1454db247:     	movq	-0x30(%rbp), %rax
1454db24b:     	movq	%rax, 0x70(%rbp)
1454db24f:     	movl	-0x28(%rbp), %eax
1454db252:     	movl	%eax, 0x78(%rbp)
1454db255:     	movl	-0x24(%rbp), %eax
1454db258:     	movl	%eax, 0x7c(%rbp)
1454db25b:     	movq	-0x20(%rbp), %rax
1454db25f:     	movq	%rax, 0x80(%rbp)
1454db266:     	xorl	%esi, %esi
1454db268:     	leaq	-0x18(%rbp), %r15
1454db26c:     	leaq	0x20(%rbp), %r12
1454db270:     	xorl	%eax, %eax
1454db272:     	jmp	0x1454db292 <.text+0x54da292>
1454db274:     	nopw	%cs:(%rax,%rax)
1454db280:     	movq	0x28(%rbp), %rax
1454db284:     	movq	%r13, (%rax,%rsi,8)
1454db288:     	incq	%rsi
1454db28b:     	movq	%rsi, 0x30(%rbp)
1454db28f:     	movq	%r14, %rax
1454db292:     	cmpq	$0x2, %rax
1454db296:     	je	0x1454db323 <.text+0x54da323>
1454db29c:     	leaq	0x1(%rax), %r14
1454db2a0:     	movq	%r14, 0x60(%rbp)
1454db2a4:     	leaq	(%rax,%rax,2), %rax
1454db2a8:     	leaq	(%rbx,%rax,4), %rdx
1454db2ac:     	movlps	%xmm6, -0x18(%rbp)
1454db2b0:     	movss	%xmm7, -0x10(%rbp)
1454db2b5:     	movb	$0x1, 0x96(%rbp)
1454db2bc:     	movl	$0x10, 0x20(%rsp)
1454db2c4:     	movq	%rdi, %rcx
1454db2c7:     	movq	%r15, %r8
1454db2ca:     	movl	$0x5, %r9d
1454db2d0:     	callq	0x1454e4a00 <.text+0x54e3a00>
1454db2d5:     	nop
1454db2d6:     	movq	%rax, %r13
1454db2d9:     	movq	0x30(%rbp), %rsi
1454db2dd:     	cmpq	0x20(%rbp), %rsi
1454db2e1:     	jne	0x1454db280 <.text+0x54da280>
1454db2e3:     	movb	$0x1, 0x96(%rbp)
1454db2ea:     	movq	%r12, %rcx
1454db2ed:     	callq	0x145774550 <.text+0x5773550>
1454db2f2:     	nop
1454db2f3:     	jmp	0x1454db280 <.text+0x54da280>
1454db2f5:     	movl	$0x8, %eax
1454db2fa:     	movq	%rax, 0x10(%rbp)
1454db2fe:     	xorl	%esi, %esi
1454db300:     	movq	$0x0, 0x18(%rbp)
1454db308:     	movss	0x934(%rdi), %xmm8
1454db311:     	movq	0x548(%rdi), %rbx
1454db318:     	cmpq	0x538(%rdi), %rbx
1454db31f:     	je	0x1454db358 <.text+0x54da358>
1454db321:     	jmp	0x1454db365 <.text+0x54da365>
1454db323:     	movq	0x20(%rbp), %rax
1454db327:     	movq	%rax, 0x18(%rbp)
1454db32b:     	movq	0x28(%rbp), %rax
1454db32f:     	movq	%rax, 0x10(%rbp)
1454db333:     	movl	0x8(%rbp), %r12d
1454db337:     	movl	0xc(%rbp), %r13d
1454db33b:     	movq	-0x38(%rbp), %r14
1454db33f:     	movss	0x934(%rdi), %xmm8
1454db348:     	movq	0x548(%rdi), %rbx
1454db34f:     	cmpq	0x538(%rdi), %rbx
1454db356:     	jne	0x1454db365 <.text+0x54da365>
1454db358:     	leaq	0x538(%rdi), %rcx
1454db35f:     	callq	0x145774630 <.text+0x5773630>
1454db364:     	nop
1454db365:     	movq	0x540(%rdi), %rax
1454db36c:     	leaq	(%rbx,%rbx,8), %rcx
1454db370:     	movq	0x18(%rbp), %rdx
1454db374:     	movq	%rdx, (%rax,%rcx,8)
1454db378:     	movq	0x10(%rbp), %rdx
1454db37c:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454db381:     	movq	%rsi, 0x10(%rax,%rcx,8)
1454db386:     	movl	$0x0, 0x18(%rax,%rcx,8)
1454db38e:     	movl	%r13d, 0x20(%rax,%rcx,8)
1454db393:     	movl	%r12d, 0x24(%rax,%rcx,8)
1454db398:     	movq	%r14, 0x28(%rax,%rcx,8)
1454db39d:     	movl	0x5c(%rbp), %edx
1454db3a0:     	movl	%edx, 0x30(%rax,%rcx,8)
1454db3a4:     	movlps	%xmm6, 0x34(%rax,%rcx,8)
1454db3a9:     	movss	%xmm7, 0x3c(%rax,%rcx,8)
1454db3af:     	movss	%xmm8, 0x40(%rax,%rcx,8)
1454db3b6:     	incq	%rbx
1454db3b9:     	movq	%rbx, 0x548(%rdi)
1454db3c0:     	movaps	0xa0(%rbp), %xmm6
1454db3c7:     	movaps	0xb0(%rbp), %xmm7
1454db3ce:     	movaps	0xc0(%rbp), %xmm8
1454db3d6:     	movaps	0xd0(%rbp), %xmm9
1454db3de:     	addq	$0x168, %rsp            # imm = 0x168
1454db3e5:     	popq	%rbx
1454db3e6:     	popq	%rdi
1454db3e7:     	popq	%rsi
1454db3e8:     	popq	%r12
1454db3ea:     	popq	%r13
1454db3ec:     	popq	%r14
1454db3ee:     	popq	%r15
1454db3f0:     	popq	%rbp
1454db3f1:     	retq
1454db3f2:     	cmpl	$0x0, 0x20(%r8)
1454db3f7:     	jne	0x1454db3c0 <.text+0x54da3c0>
1454db3f9:     	addl	%r12d, 0x24(%r8)
1454db3fd:     	jmp	0x1454db3c0 <.text+0x54da3c0>
