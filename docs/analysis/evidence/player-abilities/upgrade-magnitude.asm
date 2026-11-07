
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f94c0:     	subq	$0x28, %rsp
1454f94c4:     	movzbl	%dl, %eax
1454f94c7:     	leaq	0x14b3cf2(%rip), %rdx   # 0x1469ad1c0
1454f94ce:     	movslq	(%rdx,%rax,4), %r9
1454f94d2:     	addq	%rdx, %r9
1454f94d5:     	jmpq	*%r9
1454f94d8:     	cmpq	$0x5, %r8
1454f94dc:     	jae	0x1454f969f <.text+0x54f869f>
1454f94e2:     	movl	0x24(%rcx,%rax,4), %eax
1454f94e6:     	cvtsi2ss	%rax, %xmm1
1454f94eb:     	leaq	0x14b3be2(%rip), %rax   # 0x1469ad0d4
1454f94f2:     	mulss	0x3f1f8e(%rip), %xmm1   # 0x1458eb488
1454f94fa:     	movss	(%rax,%r8,4), %xmm0
1454f9500:     	addss	0x3f1f78(%rip), %xmm1   # 0x1458eb480
1454f9508:     	divss	%xmm1, %xmm0
1454f950c:     	addq	$0x28, %rsp
1454f9510:     	retq
1454f9511:     	cmpq	$0x5, %r8
1454f9515:     	jae	0x1454f968d <.text+0x54f868d>
1454f951b:     	leaq	0x14b3c6e(%rip), %rax   # 0x1469ad190
1454f9522:     	movss	0x403382(%rip), %xmm0   # 0x1458fc8ac
1454f952a:     	subss	0x20(%rcx), %xmm0
1454f952f:     	divss	0x3ff8ad(%rip), %xmm0   # 0x1458f8de4
1454f9537:     	jmp	0x1454f961e <.text+0x54f861e>
1454f953c:     	movq	(%rcx), %r9
1454f953f:     	movl	$0xc, %eax
1454f9544:     	cmpb	$0xb, 0x75(%r9)
1454f9549:     	jne	0x1454f9652 <.text+0x54f8652>
1454f954f:     	movq	(%r9), %rdx
1454f9552:     	movq	0x8(%r9), %rax
1454f9556:     	cmpq	$0xb, %rax
1454f955a:     	je	0x1454f9630 <.text+0x54f8630>
1454f9560:     	cmpq	$0x9, %rax
1454f9564:     	jne	0x1454f9650 <.text+0x54f8650>
1454f956a:     	movabsq	$0x7461665f6c616573, %r9 # imm = 0x7461665F6C616573
1454f9574:     	xorq	(%rdx), %r9
1454f9577:     	movzbl	0x8(%rdx), %r10d
1454f957c:     	xorq	$0x65, %r10
1454f9580:     	movl	$0x2, %eax
1454f9585:     	orq	%r9, %r10
1454f9588:     	je	0x1454f9652 <.text+0x54f8652>
1454f958e:     	movabsq	$0x7269665f6c756f73, %r9 # imm = 0x7269665F6C756F73
1454f9598:     	xorq	(%rdx), %r9
1454f959b:     	movzbl	0x8(%rdx), %r10d
1454f95a0:     	xorq	$0x65, %r10
1454f95a4:     	orq	%r9, %r10
1454f95a7:     	je	0x1454f9652 <.text+0x54f8652>
1454f95ad:     	movabsq	$0x6c6577746867696c, %r9 # imm = 0x6C6577746867696C
1454f95b7:     	xorq	(%rdx), %r9
1454f95ba:     	movzbl	0x8(%rdx), %edx
1454f95be:     	xorq	$0x6c, %rdx
1454f95c2:     	orq	%r9, %rdx
1454f95c5:     	jne	0x1454f9650 <.text+0x54f8650>
1454f95cb:     	jmp	0x1454f9652 <.text+0x54f8652>
1454f95d0:     	cmpq	$0x5, %r8
1454f95d4:     	jae	0x1454f9696 <.text+0x54f8696>
1454f95da:     	leaq	0x14b3b7f(%rip), %rax   # 0x1469ad160
1454f95e1:     	movss	0x3ff7fb(%rip), %xmm0   # 0x1458f8de4
1454f95e9:     	subss	0x1c(%rcx), %xmm0
1454f95ee:     	mulss	0x3f3a1a(%rip), %xmm0   # 0x1458ed010
1454f95f6:     	jmp	0x1454f961e <.text+0x54f861e>
1454f95f8:     	cmpq	$0x5, %r8
1454f95fc:     	jae	0x1454f96a8 <.text+0x54f86a8>
1454f9602:     	leaq	0x14b3af7(%rip), %rax   # 0x1469ad100
1454f9609:     	movss	0x14(%rcx), %xmm0
1454f960e:     	addss	0x14b3a82(%rip), %xmm0  # 0x1469ad098
1454f9616:     	divss	0x3fd00a(%rip), %xmm0   # 0x1458f6628
1454f961e:     	xorps	%xmm1, %xmm1
1454f9621:     	maxss	%xmm1, %xmm0
1454f9625:     	mulss	(%rax,%r8,4), %xmm0
1454f962b:     	addq	$0x28, %rsp
1454f962f:     	retq
1454f9630:     	movabsq	$0x665f656972656166, %rax # imm = 0x665F656972656166
1454f963a:     	xorq	(%rdx), %rax
1454f963d:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
1454f9647:     	xorq	0x3(%rdx), %r9
1454f964b:     	orq	%rax, %r9
1454f964e:     	je	0x1454f9679 <.text+0x54f8679>
1454f9650:     	xorl	%eax, %eax
1454f9652:     	cmpq	$0x4, %r8
1454f9656:     	ja	0x1454f9684 <.text+0x54f8684>
1454f9658:     	xorl	%edx, %edx
1454f965a:     	subl	0x18(%rcx), %eax
1454f965d:     	leaq	0x14b3acc(%rip), %rcx   # 0x1469ad130
1454f9664:     	cmovbl	%edx, %eax
1454f9667:     	movl	(%rcx,%r8,4), %ecx
1454f966b:     	cmpl	%ecx, %eax
1454f966d:     	cmovael	%ecx, %eax
1454f9670:     	cvtsi2ss	%eax, %xmm0
1454f9674:     	addq	$0x28, %rsp
1454f9678:     	retq
1454f9679:     	movl	$0x2, %eax
1454f967e:     	cmpq	$0x4, %r8
1454f9682:     	jbe	0x1454f9658 <.text+0x54f8658>
1454f9684:     	leaq	0x14b3abd(%rip), %rax   # 0x1469ad148
1454f968b:     	jmp	0x1454f96af <.text+0x54f86af>
1454f968d:     	leaq	0x14b3b14(%rip), %rax   # 0x1469ad1a8
1454f9694:     	jmp	0x1454f96af <.text+0x54f86af>
1454f9696:     	leaq	0x14b3adb(%rip), %rax   # 0x1469ad178
1454f969d:     	jmp	0x1454f96af <.text+0x54f86af>
1454f969f:     	leaq	0x14b3a42(%rip), %rax   # 0x1469ad0e8
1454f96a6:     	jmp	0x1454f96af <.text+0x54f86af>
1454f96a8:     	leaq	0x14b3a69(%rip), %rax   # 0x1469ad118
1454f96af:     	movl	$0x5, %edx
1454f96b4:     	movq	%r8, %rcx
1454f96b7:     	movq	%rax, %r8
1454f96ba:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454f96bf:     	ud2
