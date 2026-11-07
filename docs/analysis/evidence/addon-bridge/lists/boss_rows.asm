
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b14e0:     	pushq	%rbp
1459b14e1:     	pushq	%r15
1459b14e3:     	pushq	%r14
1459b14e5:     	pushq	%r13
1459b14e7:     	pushq	%r12
1459b14e9:     	pushq	%rsi
1459b14ea:     	pushq	%rdi
1459b14eb:     	pushq	%rbx
1459b14ec:     	subq	$0x138, %rsp            # imm = 0x138
1459b14f3:     	leaq	0x80(%rsp), %rbp
1459b14fb:     	movaps	%xmm6, 0xa0(%rbp)
1459b1502:     	movq	$-0x2, 0x98(%rbp)
1459b150d:     	movq	(%rdx), %rax
1459b1510:     	movq	%rax, 0x58(%rbp)
1459b1514:     	movq	0x8(%rdx), %r11
1459b1518:     	movq	(%rcx), %r8
1459b151b:     	movq	0x8(%rcx), %rax
1459b151f:     	movq	%r8, 0x50(%rbp)
1459b1523:     	cmpq	%rax, %r8
1459b1526:     	je	0x1459b182b <.text+0x59b082b>
1459b152c:     	movq	0x18(%rcx), %r8
1459b1530:     	movq	%r8, 0x80(%rbp)
1459b1537:     	movq	0x10(%rdx), %rdx
1459b153b:     	movq	%rdx, -0x18(%rbp)
1459b153f:     	movq	0x10(%rcx), %r15
1459b1543:     	subq	0x50(%rbp), %rax
1459b1547:     	shrq	$0x3, %rax
1459b154b:     	movabsq	$0x2e8ba2e8ba2e8ba3, %rcx # imm = 0x2E8BA2E8BA2E8BA3
1459b1555:     	imulq	%rax, %rcx
1459b1559:     	movq	%rcx, -0x10(%rbp)
1459b155d:     	xorl	%eax, %eax
1459b155f:     	movss	0x40e019(%rip), %xmm6   # 0x145dbf580
1459b1567:     	leaq	-0x8(%rbp), %r13
1459b156b:     	leaq	0x60(%rbp), %r14
1459b156f:     	jmp	0x1459b15b1 <.text+0x59b05b1>
1459b1571:     	nopw	%cs:(%rax,%rax)
1459b1580:     	movq	0x48(%rbp), %r11
1459b1584:     	leaq	(%r11,%r11,2), %rax
1459b1588:     	movq	-0x40(%rbp), %rcx
1459b158c:     	movq	-0x18(%rbp), %rdx
1459b1590:     	movq	%rcx, 0x10(%rdx,%rax,8)
1459b1595:     	movups	-0x50(%rbp), %xmm0
1459b1599:     	movups	%xmm0, (%rdx,%rax,8)
1459b159d:     	incq	%r11
1459b15a0:     	movq	-0x20(%rbp), %rax
1459b15a4:     	incq	%rax
1459b15a7:     	cmpq	-0x10(%rbp), %rax
1459b15ab:     	je	0x1459b182b <.text+0x59b082b>
1459b15b1:     	movq	%rax, -0x20(%rbp)
1459b15b5:     	imulq	$0x58, %rax, %rdi
1459b15b9:     	addq	0x50(%rbp), %rdi
1459b15bd:     	movl	$0x3, %eax
1459b15c2:     	leaq	0x18045dd(%rip), %rcx   # 0x1471b5ba6
1459b15c9:     	movq	0x80(%rbp), %rdx
1459b15d0:     	cmpq	0x988(%rdx), %r15
1459b15d7:     	jae	0x1459b1667 <.text+0x59b0667>
1459b15dd:     	movq	0x80(%rbp), %rax
1459b15e4:     	movq	0x568(%rax), %rdx
1459b15eb:     	movl	$0x4, %eax
1459b15f0:     	testq	%rdx, %rdx
1459b15f3:     	je	0x1459b1660 <.text+0x59b0660>
1459b15f5:     	movq	0x80(%rbp), %rcx
1459b15fc:     	movq	0x560(%rcx), %rcx
1459b1603:     	imulq	$0x160, %rdx, %rdx      # imm = 0x160
1459b160a:     	movl	0x30(%rdi), %r8d
1459b160e:     	xorl	%r9d, %r9d
1459b1611:     	jmp	0x1459b162c <.text+0x59b062c>
1459b1613:     	nopw	%cs:(%rax,%rax)
1459b1620:     	addq	$0x160, %r9             # imm = 0x160
1459b1627:     	cmpq	%r9, %rdx
1459b162a:     	je	0x1459b1660 <.text+0x59b0660>
1459b162c:     	cmpb	$0x0, 0x68(%rcx,%r9)
1459b1632:     	jne	0x1459b1620 <.text+0x59b0620>
1459b1634:     	cmpq	$-0x1, 0x18(%rcx,%r9)
1459b163a:     	je	0x1459b1620 <.text+0x59b0620>
1459b163c:     	movq	0x30(%rcx,%r9), %r10
1459b1641:     	cmpl	%r8d, 0x30(%r10)
1459b1645:     	jne	0x1459b1620 <.text+0x59b0620>
1459b1647:     	movl	$0x2, %eax
1459b164c:     	leaq	0x1804551(%rip), %rcx   # 0x1471b5ba4
1459b1653:     	jmp	0x1459b1667 <.text+0x59b0667>
1459b1655:     	nopw	%cs:(%rax,%rax)
1459b1660:     	leaq	0x1804539(%rip), %rcx   # 0x1471b5ba0
1459b1667:     	movq	%r11, 0x48(%rbp)
1459b166b:     	movq	%rcx, -0x38(%rbp)
1459b166f:     	movq	%rax, -0x30(%rbp)
1459b1673:     	incq	%r15
1459b1676:     	movq	%r15, -0x28(%rbp)
1459b167a:     	movss	0x40(%rdi), %xmm0
1459b167f:     	mulss	%xmm6, %xmm0
1459b1683:     	movss	%xmm0, 0x7c(%rbp)
1459b1688:     	leaq	0x30(%rdi), %rax
1459b168c:     	movq	%rax, 0x60(%rbp)
1459b1690:     	leaq	0x1fc8e9(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
1459b1697:     	movq	%rax, 0x68(%rbp)
1459b169b:     	movq	%r13, %rsi
1459b169e:     	movq	%r13, %rcx
1459b16a1:     	leaq	0x11ef6c1(%rip), %rdx   # 0x146ba0d69
1459b16a8:     	movq	%r14, %rbx
1459b16ab:     	movq	%r14, %r8
1459b16ae:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459b16b3:     	nop
1459b16b4:     	movq	(%rbp), %rcx
1459b16b8:     	movq	0x8(%rbp), %rdx
1459b16bc:     	movq	(%rdi), %r12
1459b16bf:     	movq	0x8(%rdi), %r14
1459b16c3:     	movq	%rcx, 0x88(%rbp)
1459b16ca:     	callq	0x1458da590 <.text+0x58d9590>
1459b16cf:     	nop
1459b16d0:     	movq	%rax, %r13
1459b16d3:     	movq	-0x8(%rbp), %rax
1459b16d7:     	testq	%rax, %rax
1459b16da:     	je	0x1459b1705 <.text+0x59b0705>
1459b16dc:     	movl	$0x1, %r8d
1459b16e2:     	movq	0x88(%rbp), %rcx
1459b16e9:     	movq	%r15, 0x88(%rbp)
1459b16f0:     	movq	%rdx, %r15
1459b16f3:     	movq	%rax, %rdx
1459b16f6:     	callq	0x1400021d0 <.text+0x11d0>
1459b16fb:     	movq	%r15, %rdx
1459b16fe:     	movq	0x88(%rbp), %r15
1459b1705:     	testq	%r13, %r13
1459b1708:     	cmovneq	%r13, %r12
1459b170c:     	cmoveq	%r14, %rdx
1459b1710:     	movq	$0x0, -0x8(%rbp)
1459b1718:     	movq	$0x1, (%rbp)
1459b1720:     	movq	$0x0, 0x8(%rbp)
1459b1728:     	testq	%rdx, %rdx
1459b172b:     	movq	%rsi, %r13
1459b172e:     	jne	0x1459b17f3 <.text+0x59b07f3>
1459b1734:     	addq	%r12, %rdx
1459b1737:     	movq	%r12, %rcx
1459b173a:     	movq	%r13, %r8
1459b173d:     	callq	0x1459b9b70 <.text+0x59b8b70>
1459b1742:     	nop
1459b1743:     	movq	0x8(%rbp), %rax
1459b1747:     	movq	%rax, 0x70(%rbp)
1459b174b:     	movups	-0x8(%rbp), %xmm0
1459b174f:     	movaps	%xmm0, 0x60(%rbp)
1459b1753:     	movzbl	0x54(%rdi), %eax
1459b1757:     	movb	%al, 0x97(%rbp)
1459b175d:     	leaq	-0x28(%rbp), %rax
1459b1761:     	movq	%rax, -0x8(%rbp)
1459b1765:     	leaq	0x1fd704(%rip), %rax    # 0x145baee70 <.text+0x5bade70>
1459b176c:     	movq	%rax, (%rbp)
1459b1770:     	leaq	0x7c(%rbp), %rax
1459b1774:     	movq	%rax, 0x8(%rbp)
1459b1778:     	leaq	0x1fbb01(%rip), %rax    # 0x145bad280 <.text+0x5bac280>
1459b177f:     	movq	%rax, 0x10(%rbp)
1459b1783:     	movq	%rbx, %r14
1459b1786:     	movq	%rbx, 0x18(%rbp)
1459b178a:     	leaq	-0x59af6b1(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1459b1791:     	movq	%rax, 0x20(%rbp)
1459b1795:     	leaq	0x97(%rbp), %rax
1459b179c:     	movq	%rax, 0x28(%rbp)
1459b17a0:     	leaq	0x1f9109(%rip), %rax    # 0x145baa8b0 <.text+0x5ba98b0>
1459b17a7:     	movq	%rax, 0x30(%rbp)
1459b17ab:     	leaq	-0x38(%rbp), %rax
1459b17af:     	movq	%rax, 0x38(%rbp)
1459b17b3:     	leaq	-0x59af6fa(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1459b17ba:     	movq	%rax, 0x40(%rbp)
1459b17be:     	leaq	-0x50(%rbp), %rcx
1459b17c2:     	leaq	0x18043e0(%rip), %rdx   # 0x1471b5ba9
1459b17c9:     	movq	%r13, %r8
1459b17cc:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459b17d1:     	nop
1459b17d2:     	movq	0x60(%rbp), %rdx
1459b17d6:     	testq	%rdx, %rdx
1459b17d9:     	je	0x1459b1580 <.text+0x59b0580>
1459b17df:     	movq	0x68(%rbp), %rcx
1459b17e3:     	movl	$0x1, %r8d
1459b17e9:     	callq	0x1400021d0 <.text+0x11d0>
1459b17ee:     	jmp	0x1459b1580 <.text+0x59b0580>
1459b17f3:     	movq	%rdx, %r8
1459b17f6:     	shrq	$0x2, %r8
1459b17fa:     	movl	%edx, %eax
1459b17fc:     	andl	$0x3, %eax
1459b17ff:     	cmpq	$0x1, %rax
1459b1803:     	sbbq	$-0x1, %r8
1459b1807:     	movq	$0x1, 0x20(%rsp)
1459b1810:     	movl	$0x1, %r9d
1459b1816:     	movq	%r13, %rcx
1459b1819:     	movq	%rdx, %r14
1459b181c:     	xorl	%edx, %edx
1459b181e:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459b1823:     	movq	%r14, %rdx
1459b1826:     	jmp	0x1459b1734 <.text+0x59b0734>
1459b182b:     	movq	0x58(%rbp), %rax
1459b182f:     	movq	%r11, (%rax)
1459b1832:     	movaps	0xa0(%rbp), %xmm6
1459b1839:     	addq	$0x138, %rsp            # imm = 0x138
1459b1840:     	popq	%rbx
1459b1841:     	popq	%rdi
1459b1842:     	popq	%rsi
1459b1843:     	popq	%r12
1459b1845:     	popq	%r13
1459b1847:     	popq	%r14
1459b1849:     	popq	%r15
1459b184b:     	popq	%rbp
1459b184c:     	retq
