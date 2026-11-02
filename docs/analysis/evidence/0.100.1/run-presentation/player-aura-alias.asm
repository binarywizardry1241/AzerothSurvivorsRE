
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145487350:     	addq	$-0x6, %rdx
145487354:     	cmpq	$0xd, %rdx
145487358:     	ja	0x1454875cd <.text+0x54865cd>
14548735e:     	leaq	0x156e6d7(%rip), %rax   # 0x1469f5a3c
145487365:     	movslq	(%rax,%rdx,4), %rdx
145487369:     	addq	%rax, %rdx
14548736c:     	jmpq	*%rdx
14548736e:     	movl	$0x72756c46, %edx       # imm = 0x72756C46
145487373:     	xorl	(%rcx), %edx
145487375:     	movzwl	0x4(%rcx), %ecx
145487379:     	xorl	$0x7972, %ecx           # imm = 0x7972
14548737f:     	xorl	%eax, %eax
145487381:     	orl	%edx, %ecx
145487383:     	setne	%cl
145487386:     	cmpb	$0x1, %r8b
14548738a:     	jne	0x1454875cd <.text+0x54865cd>
145487390:     	movb	%cl, %al
145487392:     	testl	%eax, %eax
145487394:     	jne	0x1454875cd <.text+0x54865cd>
14548739a:     	leaq	0x156d337(%rip), %rax   # 0x1469f46d8
1454873a1:     	addq	$0x14, %rax
1454873a5:     	movl	(%rax), %eax
1454873a7:     	retq
1454873a8:     	movabsq	$0x617453207473614c, %rdx # imm = 0x617453207473614C
1454873b2:     	xorq	(%rcx), %rdx
1454873b5:     	movzwl	0x8(%rcx), %ecx
1454873b9:     	xorq	$0x646e, %rcx           # imm = 0x646E
1454873c0:     	xorl	%eax, %eax
1454873c2:     	orq	%rdx, %rcx
1454873c5:     	setne	%al
1454873c8:     	testb	%r8b, %r8b
1454873cb:     	jne	0x1454875b5 <.text+0x54865b5>
1454873d1:     	testl	%eax, %eax
1454873d3:     	jne	0x1454875b5 <.text+0x54865b5>
1454873d9:     	leaq	0x156d2b0(%rip), %rax   # 0x1469f4690
1454873e0:     	addq	$0x14, %rax
1454873e4:     	movl	(%rax), %eax
1454873e6:     	retq
1454873e7:     	movabsq	$0x6e7261636e696552, %rdx # imm = 0x6E7261636E696552
1454873f1:     	xorq	(%rcx), %rdx
1454873f4:     	movabsq	$0x6e6f6974616e7261, %r9 # imm = 0x6E6F6974616E7261
1454873fe:     	xorq	0x5(%rcx), %r9
145487402:     	xorl	%eax, %eax
145487404:     	orq	%rdx, %r9
145487407:     	setne	%cl
14548740a:     	cmpb	$0x2, %r8b
14548740e:     	jne	0x1454875cd <.text+0x54865cd>
145487414:     	movb	%cl, %al
145487416:     	testl	%eax, %eax
145487418:     	jne	0x1454875cd <.text+0x54865cd>
14548741e:     	leaq	0x156d313(%rip), %rax   # 0x1469f4738
145487425:     	addq	$0x14, %rax
145487429:     	movl	(%rax), %eax
14548742b:     	retq
14548742c:     	movabsq	$0x6569666974726f46, %rdx # imm = 0x6569666974726F46
145487436:     	xorq	(%rcx), %rdx
145487439:     	movzbl	0x8(%rcx), %ecx
14548743d:     	xorq	$0x64, %rcx
145487441:     	xorl	%eax, %eax
145487443:     	orq	%rdx, %rcx
145487446:     	setne	%cl
145487449:     	testb	%r8b, %r8b
14548744c:     	jne	0x1454875cd <.text+0x54865cd>
145487452:     	movb	%cl, %al
145487454:     	testl	%eax, %eax
145487456:     	jne	0x1454875cd <.text+0x54865cd>
14548745c:     	leaq	0x156d1fd(%rip), %rax   # 0x1469f4660
145487463:     	addq	$0x14, %rax
145487467:     	movl	(%rax), %eax
145487469:     	retq
14548746a:     	movabsq	$0x4d20646c65696853, %rdx # imm = 0x4D20646C65696853
145487474:     	xorq	(%rcx), %rdx
145487477:     	movabsq	$0x7972657473614d20, %r9 # imm = 0x7972657473614D20
145487481:     	xorq	0x6(%rcx), %r9
145487485:     	xorl	%eax, %eax
145487487:     	orq	%rdx, %r9
14548748a:     	setne	%cl
14548748d:     	testb	%r8b, %r8b
145487490:     	jne	0x1454875cd <.text+0x54865cd>
145487496:     	movb	%cl, %al
145487498:     	testl	%eax, %eax
14548749a:     	jne	0x1454875cd <.text+0x54865cd>
1454874a0:     	leaq	0x156d1d1(%rip), %rax   # 0x1469f4678
1454874a7:     	addq	$0x14, %rax
1454874ab:     	movl	(%rax), %eax
1454874ad:     	retq
1454874ae:     	movabsq	$0x4420746e65647241, %rdx # imm = 0x4420746E65647241
1454874b8:     	xorq	(%rcx), %rdx
1454874bb:     	movabsq	$0x7265646e65666544, %r9 # imm = 0x7265646E65666544
1454874c5:     	xorq	0x7(%rcx), %r9
1454874c9:     	xorl	%eax, %eax
1454874cb:     	orq	%rdx, %r9
1454874ce:     	setne	%cl
1454874d1:     	testb	%r8b, %r8b
1454874d4:     	jne	0x1454875cd <.text+0x54865cd>
1454874da:     	movb	%cl, %al
1454874dc:     	testl	%eax, %eax
1454874de:     	jne	0x1454875cd <.text+0x54865cd>
1454874e4:     	leaq	0x156d1bd(%rip), %rax   # 0x1469f46a8
1454874eb:     	addq	$0x14, %rax
1454874ef:     	movl	(%rax), %eax
1454874f1:     	retq
1454874f2:     	movabsq	$0x6544207461656843, %rdx # imm = 0x6544207461656843
1454874fc:     	xorq	(%rcx), %rdx
1454874ff:     	movabsq	$0x6874616544207461, %r9 # imm = 0x6874616544207461
145487509:     	xorq	0x3(%rcx), %r9
14548750d:     	xorl	%eax, %eax
14548750f:     	orq	%rdx, %r9
145487512:     	setne	%cl
145487515:     	cmpb	$0x2, %r8b
145487519:     	jne	0x1454875cd <.text+0x54865cd>
14548751f:     	movb	%cl, %al
145487521:     	testl	%eax, %eax
145487523:     	jne	0x1454875cd <.text+0x54865cd>
145487529:     	leaq	0x156d1f0(%rip), %rax   # 0x1469f4720
145487530:     	addq	$0x14, %rax
145487534:     	movl	(%rax), %eax
145487536:     	retq
145487537:     	movabsq	$0x2064657373656c42, %rdx # imm = 0x2064657373656C42
145487541:     	xorq	(%rcx), %rdx
145487544:     	movl	0x8(%rcx), %ecx
145487547:     	xorq	$0x6566694c, %rcx       # imm = 0x6566694C
14548754e:     	xorl	%eax, %eax
145487550:     	orq	%rdx, %rcx
145487553:     	setne	%cl
145487556:     	testb	%r8b, %r8b
145487559:     	jne	0x1454875cd <.text+0x54865cd>
14548755b:     	movb	%cl, %al
14548755d:     	testl	%eax, %eax
14548755f:     	jne	0x1454875cd <.text+0x54865cd>
145487561:     	leaq	0x156d158(%rip), %rax   # 0x1469f46c0
145487568:     	addq	$0x14, %rax
14548756c:     	movl	(%rax), %eax
14548756e:     	retq
14548756f:     	movdqu	(%rcx), %xmm0
145487573:     	movdqu	0x3(%rcx), %xmm1
145487578:     	pcmpeqb	0x1552c60(%rip), %xmm1  # 0x1469da1e0
145487580:     	pcmpeqb	0x1552c68(%rip), %xmm0  # 0x1469da1f0
145487588:     	pand	%xmm1, %xmm0
14548758c:     	pmovmskb	%xmm0, %ecx
145487590:     	xorl	%eax, %eax
145487592:     	cmpl	$0xffff, %ecx           # imm = 0xFFFF
145487598:     	setne	%cl
14548759b:     	cmpb	$0x2, %r8b
14548759f:     	jne	0x1454875cd <.text+0x54865cd>
1454875a1:     	movb	%cl, %al
1454875a3:     	testl	%eax, %eax
1454875a5:     	jne	0x1454875cd <.text+0x54865cd>
1454875a7:     	leaq	0x156d15a(%rip), %rax   # 0x1469f4708
1454875ae:     	addq	$0x14, %rax
1454875b2:     	movl	(%rax), %eax
1454875b4:     	retq
1454875b5:     	cmpb	$0x2, %r8b
1454875b9:     	jne	0x1454875cd <.text+0x54865cd>
1454875bb:     	testl	%eax, %eax
1454875bd:     	jne	0x1454875cd <.text+0x54865cd>
1454875bf:     	leaq	0x156d12a(%rip), %rax   # 0x1469f46f0
1454875c6:     	addq	$0x14, %rax
1454875ca:     	movl	(%rax), %eax
1454875cc:     	retq
1454875cd:     	movzbl	%r8b, %eax
1454875d1:     	leaq	0x156e2f8(%rip), %rcx   # 0x1469f58d0
1454875d8:     	leaq	(%rcx,%rax,4), %rax
1454875dc:     	movl	(%rax), %eax
1454875de:     	retq
