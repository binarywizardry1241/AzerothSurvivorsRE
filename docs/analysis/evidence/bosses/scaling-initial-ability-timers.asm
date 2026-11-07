
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bf3e0:     	movq	0x18(%r13), %rdi
1454bf3e4:     	testq	%rdi, %rdi
1454bf3e7:     	je	0x1454bf538 <.text+0x54be538>
1454bf3ed:     	movq	0x10(%r13), %r15
1454bf3f1:     	leaq	(,%rdi,4), %r14
1454bf3f9:     	callq	0x140002200 <.text+0x1200>
1454bf3fe:     	movl	$0x4, %edx
1454bf403:     	movq	%r14, %rcx
1454bf406:     	callq	0x1400021c0 <.text+0x11c0>
1454bf40b:     	testq	%rax, %rax
1454bf40e:     	je	0x1454bfedd <.text+0x54beedd>
1454bf414:     	cmpq	$0xc, %rdi
1454bf418:     	jbe	0x1454bf446 <.text+0x54be446>
1454bf41a:     	leaq	(%rax,%rdi,4), %rcx
1454bf41e:     	leaq	0x18(%r15), %rdx
1454bf422:     	leaq	(%rdi,%rdi,8), %r8
1454bf426:     	leaq	(%r8,%r8,2), %r8
1454bf42a:     	addq	%r15, %r8
1454bf42d:     	addq	%rdi, %r8
1454bf430:     	cmpq	%r8, %rax
1454bf433:     	setb	%r8b
1454bf437:     	cmpq	%rcx, %rdx
1454bf43a:     	setb	%cl
1454bf43d:     	testb	%cl, %r8b
1454bf440:     	je	0x1454bf55f <.text+0x54be55f>
1454bf446:     	xorl	%ecx, %ecx
1454bf448:     	jmp	0x1454bf5f3 <.text+0x54be5f3>
1454bf44d:     	cmpq	$-0x1, 0x68(%rbx)
1454bf452:     	je	0x1454bf542 <.text+0x54be542>
1454bf458:     	leaq	0x68(%rbx), %rdx
1454bf45c:     	leaq	-0x38(%rbp), %rcx
1454bf460:     	movaps	%xmm6, %xmm2
1454bf463:     	movaps	%xmm8, %xmm3
1454bf467:     	callq	0x145467bf0 <.text+0x5466bf0>
1454bf46c:     	nop
1454bf46d:     	cmpl	$0x1, -0x38(%rbp)
1454bf471:     	jne	0x1454bf542 <.text+0x54be542>
1454bf477:     	movd	-0x2c(%rbp), %xmm7
1454bf47c:     	movq	0x160(%rbp), %rdx
1454bf483:     	testq	%rdx, %rdx
1454bf486:     	jne	0x1454bf2a7 <.text+0x54be2a7>
1454bf48c:     	jmp	0x1454bf2bd <.text+0x54be2bd>
1454bf491:     	cmpl	$0xb, %ebx
1454bf494:     	je	0x1454bf49f <.text+0x54be49f>
1454bf496:     	cmpl	$0x7, %ebx
1454bf499:     	jne	0x1454bfdff <.text+0x54bedff>
1454bf49f:     	leaq	0x8(%r14), %rbx
1454bf4a3:     	decq	%r12
1454bf4a6:     	movabsq	$0x1fffffffffffffff, %r15 # imm = 0x1FFFFFFFFFFFFFFF
1454bf4b0:     	andq	%r12, %r15
1454bf4b3:     	jmp	0x1454bf4cd <.text+0x54be4cd>
1454bf4b5:     	nopw	%cs:(%rax,%rax)
1454bf4c0:     	addq	$0x8, %rbx
1454bf4c4:     	decq	%r15
1454bf4c7:     	je	0x1454bf26d <.text+0x54be26d>
1454bf4cd:     	movq	0x148(%rbp), %rax
1454bf4d4:     	movss	(%r14), %xmm0
1454bf4d9:     	movss	0x4(%r14), %xmm1
1454bf4df:     	subss	(%rax), %xmm0
1454bf4e3:     	subss	0x4(%rax), %xmm1
1454bf4e8:     	callq	0x145756e67 <.text+0x5755e67>
1454bf4ed:     	movaps	%xmm0, %xmm6
1454bf4f0:     	movq	0x148(%rbp), %rax
1454bf4f7:     	movss	(%rbx), %xmm0
1454bf4fb:     	movss	0x4(%rbx), %xmm1
1454bf500:     	subss	(%rax), %xmm0
1454bf504:     	subss	0x4(%rax), %xmm1
1454bf509:     	callq	0x145756e67 <.text+0x5755e67>
1454bf50e:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1454bf511:     	movaps	%xmm6, %xmm0
1454bf514:     	psrad	$0x1f, %xmm0
1454bf519:     	psrld	$0x1, %xmm0
1454bf51e:     	pxor	%xmm6, %xmm0
1454bf522:     	pshufd	$0x55, %xmm0, %xmm1     # xmm1 = xmm0[1,1,1,1]
1454bf527:     	pcmpgtd	%xmm1, %xmm0
1454bf52b:     	movd	%xmm0, %eax
1454bf52f:     	testb	$0x1, %al
1454bf531:     	jne	0x1454bf4c0 <.text+0x54be4c0>
1454bf533:     	movq	%rbx, %r14
1454bf536:     	jmp	0x1454bf4c0 <.text+0x54be4c0>
1454bf538:     	movl	$0x4, %eax
1454bf53d:     	jmp	0x1454bf6b7 <.text+0x54be6b7>
1454bf542:     	movd	0x90(%rbx), %xmm7
1454bf54a:     	movq	0x160(%rbp), %rdx
1454bf551:     	testq	%rdx, %rdx
1454bf554:     	jne	0x1454bf2a7 <.text+0x54be2a7>
1454bf55a:     	jmp	0x1454bf2bd <.text+0x54be2bd>
1454bf55f:     	movl	%edi, %ecx
1454bf561:     	andl	$0x7, %ecx
1454bf564:     	movl	$0x8, %edx
1454bf569:     	cmovneq	%rcx, %rdx
1454bf56d:     	movq	%rdi, %rcx
1454bf570:     	subq	%rdx, %rcx
1454bf573:     	leaq	0xdc(%r15), %rdx
1454bf57a:     	xorl	%r8d, %r8d
1454bf57d:     	movaps	0x14eafbc(%rip), %xmm0  # 0x1469aa540
1454bf584:     	nopw	%cs:(%rax,%rax)
1454bf590:     	movss	-0xc4(%rdx), %xmm1
1454bf598:     	movss	-0xa8(%rdx), %xmm2
1454bf5a0:     	unpcklps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
1454bf5a3:     	movss	-0x8c(%rdx), %xmm2
1454bf5ab:     	movss	-0x70(%rdx), %xmm3
1454bf5b0:     	unpcklps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
1454bf5b3:     	movlhps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0]
1454bf5b6:     	movss	(%rdx), %xmm2
1454bf5ba:     	movss	-0x1c(%rdx), %xmm3
1454bf5bf:     	unpcklps	%xmm2, %xmm3            # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
1454bf5c2:     	movss	-0x38(%rdx), %xmm2
1454bf5c7:     	movss	-0x54(%rdx), %xmm4
1454bf5cc:     	unpcklps	%xmm2, %xmm4            # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
1454bf5cf:     	movlhps	%xmm3, %xmm4            # xmm4 = xmm4[0],xmm3[0]
1454bf5d2:     	mulps	%xmm0, %xmm1
1454bf5d5:     	mulps	%xmm0, %xmm4
1454bf5d8:     	movups	%xmm1, (%rax,%r8,4)
1454bf5dd:     	movups	%xmm4, 0x10(%rax,%r8,4)
1454bf5e3:     	addq	$0x8, %r8
1454bf5e7:     	addq	$0xe0, %rdx
1454bf5ee:     	cmpq	%r8, %rcx
1454bf5f1:     	jne	0x1454bf590 <.text+0x54be590>
1454bf5f3:     	movl	%edi, %r10d
1454bf5f6:     	subl	%ecx, %r10d
1454bf5f9:     	movq	%rcx, %rdx
1454bf5fc:     	andl	$0x3, %r10d
1454bf600:     	je	0x1454bf64b <.text+0x54be64b>
1454bf602:     	leaq	(%rcx,%rcx,8), %rdx
1454bf606:     	leaq	(%rdx,%rdx,2), %rdx
1454bf60a:     	addq	%rcx, %rdx
1454bf60d:     	leaq	(%r15,%rdx), %r8
1454bf611:     	addq	$0x18, %r8
1454bf615:     	leaq	(,%r10,8), %r9
1454bf61d:     	subq	%r10, %r9
1454bf620:     	xorl	%r10d, %r10d
1454bf623:     	movss	0x42bef9(%rip), %xmm0   # 0x1458eb524
1454bf62b:     	movq	%rcx, %rdx
1454bf62e:     	nop
1454bf630:     	movss	(%r8,%r10,4), %xmm1
1454bf636:     	mulss	%xmm0, %xmm1
1454bf63a:     	movss	%xmm1, (%rax,%rdx,4)
1454bf63f:     	incq	%rdx
1454bf642:     	addq	$0x7, %r10
1454bf646:     	cmpq	%r10, %r9
1454bf649:     	jne	0x1454bf630 <.text+0x54be630>
1454bf64b:     	subq	%rdi, %rcx
1454bf64e:     	cmpq	$-0x4, %rcx
1454bf652:     	ja	0x1454bf6b7 <.text+0x54be6b7>
1454bf654:     	leaq	(%rdx,%rdx,8), %rcx
1454bf658:     	leaq	(%rcx,%rcx,2), %rcx
1454bf65c:     	addq	%rdx, %rcx
1454bf65f:     	addq	%r15, %rcx
1454bf662:     	addq	$0x6c, %rcx
1454bf666:     	movss	0x42beb6(%rip), %xmm0   # 0x1458eb524
1454bf66e:     	nop
1454bf670:     	movss	-0x54(%rcx), %xmm1
1454bf675:     	mulss	%xmm0, %xmm1
1454bf679:     	movss	%xmm1, (%rax,%rdx,4)
1454bf67e:     	movss	-0x38(%rcx), %xmm1
1454bf683:     	mulss	%xmm0, %xmm1
1454bf687:     	movss	%xmm1, 0x4(%rax,%rdx,4)
1454bf68d:     	movss	-0x1c(%rcx), %xmm1
1454bf692:     	mulss	%xmm0, %xmm1
1454bf696:     	movss	%xmm1, 0x8(%rax,%rdx,4)
1454bf69c:     	movss	(%rcx), %xmm1
1454bf6a0:     	mulss	%xmm0, %xmm1
1454bf6a4:     	movss	%xmm1, 0xc(%rax,%rdx,4)
1454bf6aa:     	addq	$0x4, %rdx
1454bf6ae:     	addq	$0x70, %rcx
1454bf6b2:     	cmpq	%rdx, %rdi
1454bf6b5:     	jne	0x1454bf670 <.text+0x54be670>
