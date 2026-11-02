
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a13ac:     	movq	0x368(%rbp), %r13
1454a13b3:     	movq	0x2a0(%r13), %rcx
1454a13ba:     	testq	%rcx, %rcx
1454a13bd:     	je	0x1454a2239 <.text+0x54a1239>
1454a13c3:     	movq	0x298(%r13), %rax
1454a13ca:     	imulq	$0x58, %rcx, %rcx
1454a13ce:     	xorl	%r8d, %r8d
1454a13d1:     	movabsq	$0x5f737265746e7568, %rdx # imm = 0x5F737265746E7568
1454a13db:     	jmp	0x1454a13ed <.text+0x54a03ed>
1454a13dd:     	nopl	(%rax)
1454a13e0:     	addq	$0x58, %r8
1454a13e4:     	cmpq	%r8, %rcx
1454a13e7:     	je	0x1454a16d6 <.text+0x54a06d6>
1454a13ed:     	movq	(%rax,%r8), %r9
1454a13f1:     	cmpq	$0xc, 0x8(%r9)
1454a13f6:     	jne	0x1454a13e0 <.text+0x54a03e0>
1454a13f8:     	movq	(%r9), %r9
1454a13fb:     	movq	(%r9), %r10
1454a13fe:     	xorq	%rdx, %r10
1454a1401:     	movl	0x8(%r9), %r9d
1454a1405:     	xorq	$0x6b72616d, %r9        # imm = 0x6B72616D
1454a140c:     	orq	%r10, %r9
1454a140f:     	jne	0x1454a13e0 <.text+0x54a03e0>
1454a1411:     	xorl	%r8d, %r8d
1454a1414:     	jmp	0x1454a142d <.text+0x54a042d>
1454a1416:     	nopw	%cs:(%rax,%rax)
1454a1420:     	addq	$0x58, %r8
1454a1424:     	cmpq	%r8, %rcx
1454a1427:     	je	0x1454a16d6 <.text+0x54a06d6>
1454a142d:     	movq	(%rax,%r8), %rbx
1454a1431:     	cmpq	$0xc, 0x8(%rbx)
1454a1436:     	jne	0x1454a1420 <.text+0x54a0420>
1454a1438:     	movq	(%rbx), %r9
1454a143b:     	movq	(%r9), %r10
1454a143e:     	xorq	%rdx, %r10
1454a1441:     	movl	0x8(%r9), %r9d
1454a1445:     	xorq	$0x6b72616d, %r9        # imm = 0x6B72616D
1454a144c:     	orq	%r10, %r9
1454a144f:     	jne	0x1454a1420 <.text+0x54a0420>
1454a1451:     	movss	0x10(%rax,%r8), %xmm0
1454a1458:     	mulss	0x38(%rax,%r8), %xmm0
1454a145f:     	movss	0x8e4(%r13), %xmm8
1454a1468:     	xorps	%xmm7, %xmm7
1454a146b:     	sqrtss	%xmm0, %xmm7
1454a146f:     	mulss	0x44a095(%rip), %xmm7   # 0x1458eb50c
1454a1477:     	minss	0x469a7d(%rip), %xmm7   # 0x14590aefc
1454a147f:     	movq	0x7b0(%r13), %r14
1454a1486:     	movss	0x4c(%rbx), %xmm1
1454a148b:     	movl	$0x8, %r8d
1454a1491:     	movq	%r13, %rcx
1454a1494:     	xorl	%r9d, %r9d
1454a1497:     	callq	0x1454d5740 <.text+0x54d4740>
1454a149c:     	movq	%rax, %r15
1454a149f:     	movq	%rdx, %rdi
1454a14a2:     	testq	%r14, %r14
1454a14a5:     	je	0x1454a15ba <.text+0x54a05ba>
1454a14ab:     	movq	%r12, %rsi
1454a14ae:     	movss	0x4c(%rbx), %xmm9
1454a14b4:     	movss	0x8e4(%r13), %xmm2
1454a14bd:     	movq	0x4c8(%r13), %r12
1454a14c4:     	movq	0x4d0(%r13), %r13
1454a14cb:     	leaq	-0x160(%r12), %rcx
1454a14d3:     	imulq	$0x160, %r13, %rax      # imm = 0x160
1454a14da:     	testq	%rax, %rax
1454a14dd:     	je	0x1454a1563 <.text+0x54a0563>
1454a14e3:     	leaq	0x160(%rcx), %rdx
1454a14ea:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454a14f0:     	cmpq	%r14, 0x1e8(%rcx)
1454a14f7:     	movq	%rdx, %rcx
1454a14fa:     	jne	0x1454a14da <.text+0x54a04da>
1454a14fc:     	cmpl	$0x0, 0x68(%rdx)
1454a1500:     	jne	0x1454a1563 <.text+0x54a0563>
1454a1502:     	ucomiss	0x140(%rdx), %xmm2
1454a1509:     	jb	0x1454a1563 <.text+0x54a0563>
1454a150b:     	cmpq	$-0x1, 0x40(%rdx)
1454a1510:     	je	0x1454a1518 <.text+0x54a0518>
1454a1512:     	cmpb	$0x0, 0x60(%rdx)
1454a1516:     	je	0x1454a1563 <.text+0x54a0563>
1454a1518:     	leaq	0xa0(%rbp), %rcx
1454a151f:     	callq	0x14540d200 <.text+0x540c200>
1454a1524:     	movq	0x368(%rbp), %rax
1454a152b:     	movsd	0x3e8(%rax), %xmm0
1454a1533:     	movsd	0xa0(%rbp), %xmm1
1454a153b:     	subps	%xmm1, %xmm0
1454a153e:     	mulps	%xmm0, %xmm0
1454a1541:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a1545:     	addss	%xmm0, %xmm1
1454a1549:     	xorps	%xmm0, %xmm0
1454a154c:     	sqrtss	%xmm1, %xmm0
1454a1550:     	mulss	0x45b6df(%rip), %xmm9   # 0x1458fcc38
1454a1559:     	ucomiss	%xmm0, %xmm9
1454a155d:     	jae	0x1454a215a <.text+0x54a115a>
1454a1563:     	imulq	$0x160, %r13, %rcx      # imm = 0x160
1454a156a:     	xorl	%eax, %eax
1454a156c:     	movq	%r12, %rdx
1454a156f:     	movq	0x368(%rbp), %r13
1454a1576:     	cmpq	%rax, %rcx
1454a1579:     	je	0x1454a159a <.text+0x54a059a>
1454a157b:     	addq	$0x160, %rax            # imm = 0x160
1454a1581:     	cmpq	%r14, 0x88(%rdx)
1454a1588:     	leaq	0x160(%rdx), %rdx
1454a158f:     	jne	0x1454a1576 <.text+0x54a0576>
1454a1591:     	movl	$0x0, -0x24(%r12,%rax)
1454a159a:     	movl	0x40(%rbx), %r8d
1454a159e:     	movq	%r13, %rcx
1454a15a1:     	movq	%r14, %rdx
1454a15a4:     	xorl	%r9d, %r9d
1454a15a7:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454a15ac:     	movq	$0x0, 0x7b0(%r13)
1454a15b7:     	movq	%rsi, %r12
1454a15ba:     	movss	0x7e8(%r13), %xmm0
1454a15c3:     	ucomiss	%xmm8, %xmm0
1454a15c7:     	ja	0x1454a16d6 <.text+0x54a06d6>
1454a15cd:     	testb	$0x1, %r15b
1454a15d1:     	je	0x1454a16d6 <.text+0x54a06d6>
1454a15d7:     	movq	0x4c8(%r13), %rax
1454a15de:     	imulq	$0x160, 0x4d0(%r13), %rdx # imm = 0x160
1454a15e9:     	xorl	%ecx, %ecx
1454a15eb:     	movq	%rax, %r8
1454a15ee:     	cmpq	%rcx, %rdx
1454a15f1:     	je	0x1454a1610 <.text+0x54a0610>
1454a15f3:     	addq	$0x160, %rcx            # imm = 0x160
1454a15fa:     	cmpq	%rdi, 0x88(%r8)
1454a1601:     	leaq	0x160(%r8), %r8
1454a1608:     	jne	0x1454a15ee <.text+0x54a05ee>
1454a160a:     	movss	%xmm7, -0x24(%rax,%rcx)
1454a1610:     	movq	%rdi, 0x7b0(%r13)
1454a1617:     	movq	0x3d0(%r13), %rdx
1454a161e:     	movl	0x40(%rbx), %r8d
1454a1622:     	movq	%rdi, 0x2b0(%rbp)
1454a1629:     	movq	%rdi, 0x238(%rbp)
1454a1630:     	movl	$0x0, 0x230(%rbp)
1454a163a:     	movl	$0x0, 0x2d8(%rbp)
1454a1644:     	leaq	0x2d8(%rbp), %rax
1454a164b:     	movq	%rax, 0x30(%rsp)
1454a1650:     	leaq	0x230(%rbp), %rax
1454a1657:     	movq	%rax, 0x28(%rsp)
1454a165c:     	movq	$0x1, 0x20(%rsp)
1454a1665:     	leaq	0xa0(%rbp), %rcx
1454a166c:     	leaq	0x2b0(%rbp), %r9
1454a1673:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454a1678:     	movq	0x548(%r13), %rsi
1454a167f:     	cmpq	0x538(%r13), %rsi
1454a1686:     	jne	0x1454a1695 <.text+0x54a0695>
1454a1688:     	leaq	0x538(%r13), %rcx
1454a168f:     	callq	0x1457580b0 <.text+0x57570b0>
1454a1694:     	nop
1454a1695:     	movq	0x540(%r13), %rax
1454a169c:     	movq	%rsi, %rcx
1454a169f:     	shlq	$0x5, %rcx
1454a16a3:     	movups	0xa0(%rbp), %xmm0
1454a16aa:     	movups	0xb0(%rbp), %xmm1
1454a16b1:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a16b6:     	movups	%xmm0, (%rax,%rcx)
1454a16ba:     	incq	%rsi
1454a16bd:     	movq	%rsi, 0x548(%r13)
1454a16c4:     	movl	0x40(%rbx), %r8d
1454a16c8:     	movq	%r13, %rcx
1454a16cb:     	movq	%rdi, %rdx
1454a16ce:     	movb	$0x1, %r9b
1454a16d1:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454a16d6:     	movq	0x2a0(%r13), %r8
1454a16dd:     	testq	%r8, %r8
1454a16e0:     	je	0x1454a2239 <.text+0x54a1239>
1454a16e6:     	movq	0x298(%r13), %rax
1454a16ed:     	imulq	$0x58, %r8, %r10
1454a16f1:     	xorl	%r9d, %r9d
