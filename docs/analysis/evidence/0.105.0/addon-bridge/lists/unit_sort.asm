
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14597d600:     	pushq	%r14
14597d602:     	pushq	%rsi
14597d603:     	pushq	%rdi
14597d604:     	pushq	%rbp
14597d605:     	pushq	%rbx
14597d606:     	movq	-0x8(%rdx), %r8
14597d60a:     	movq	(%rdx), %rax
14597d60d:     	cmpq	$-0x1, 0x18(%rax)
14597d612:     	je	0x14597d64e <.text+0x597c64e>
14597d614:     	movq	0x30(%rax), %r10
14597d618:     	movl	$0x1, %r9d
14597d61e:     	cmpb	$0x0, 0x54(%r10)
14597d623:     	je	0x14597d673 <.text+0x597c673>
14597d625:     	leaq	0x1836b89(%rip), %r9    # 0x1471b41b5
14597d62c:     	movl	$0x616e6966, %r10d      # imm = 0x616E6966
14597d632:     	xorl	(%r9), %r10d
14597d635:     	movzbl	0x4(%r9), %r9d
14597d63a:     	xorl	$0x6c, %r9d
14597d63e:     	xorl	%r11d, %r11d
14597d641:     	orl	%r10d, %r9d
14597d644:     	setne	%r11b
14597d648:     	leal	(%r11,%r11,2), %r9d
14597d64c:     	jmp	0x14597d673 <.text+0x597c673>
14597d64e:     	movl	$0x2, %r9d
14597d654:     	cmpq	$-0x1, 0x40(%rax)
14597d659:     	jne	0x14597d673 <.text+0x597c673>
14597d65b:     	movl	$0x3, %r9d
14597d661:     	cmpb	$0x1, 0x15c(%rax)
14597d668:     	jne	0x14597d673 <.text+0x597c673>
14597d66a:     	leaq	0x1836b3f(%rip), %r9    # 0x1471b41b0
14597d671:     	jmp	0x14597d62c <.text+0x597c62c>
14597d673:     	movq	0x88(%rax), %r10
14597d67a:     	cmpq	$-0x1, 0x18(%r8)
14597d67f:     	je	0x14597d6b8 <.text+0x597c6b8>
14597d681:     	movq	0x30(%r8), %rsi
14597d685:     	movl	$0x1, %r11d
14597d68b:     	cmpb	$0x0, 0x54(%rsi)
14597d68f:     	je	0x14597d6de <.text+0x597c6de>
14597d691:     	leaq	0x1836b1d(%rip), %r11   # 0x1471b41b5
14597d698:     	movl	$0x616e6966, %esi       # imm = 0x616E6966
14597d69d:     	xorl	(%r11), %esi
14597d6a0:     	movzbl	0x4(%r11), %r11d
14597d6a5:     	xorl	$0x6c, %r11d
14597d6a9:     	xorl	%edi, %edi
14597d6ab:     	orl	%esi, %r11d
14597d6ae:     	setne	%dil
14597d6b2:     	leal	(%rdi,%rdi,2), %r11d
14597d6b6:     	jmp	0x14597d6de <.text+0x597c6de>
14597d6b8:     	movl	$0x2, %r11d
14597d6be:     	cmpq	$-0x1, 0x40(%r8)
14597d6c3:     	jne	0x14597d6de <.text+0x597c6de>
14597d6c5:     	movl	$0x3, %r11d
14597d6cb:     	cmpb	$0x1, 0x15c(%r8)
14597d6d3:     	jne	0x14597d6de <.text+0x597c6de>
14597d6d5:     	leaq	0x1836ad4(%rip), %r11   # 0x1471b41b0
14597d6dc:     	jmp	0x14597d698 <.text+0x597c698>
14597d6de:     	xorl	%esi, %esi
14597d6e0:     	cmpl	0x88(%r8), %r10d
14597d6e7:     	setb	%sil
14597d6eb:     	xorl	%r10d, %r10d
14597d6ee:     	cmpl	%r11d, %r9d
14597d6f1:     	setb	%r10b
14597d6f5:     	cmovnel	%r10d, %esi
14597d6f9:     	cmpb	$0x1, %sil
14597d6fd:     	jne	0x14597d82e <.text+0x597c82e>
14597d703:     	addq	$-0x8, %rdx
14597d707:     	leaq	0x1836aa2(%rip), %r9    # 0x1471b41b0
14597d70e:     	movl	$0x616e6966, %r10d      # imm = 0x616E6966
14597d714:     	leaq	0x1836a9a(%rip), %r11   # 0x1471b41b5
14597d71b:     	jmp	0x14597d75e <.text+0x597c75e>
14597d71d:     	nopl	(%rax)
14597d720:     	movl	$0x2, %ebx
14597d725:     	cmpq	$-0x1, 0x40(%r8)
14597d72a:     	je	0x14597d813 <.text+0x597c813>
14597d730:     	movq	0x88(%rax), %rdx
14597d737:     	xorl	%ebp, %ebp
14597d739:     	cmpl	0x88(%r8), %edx
14597d740:     	leaq	-0x8(%rsi), %rdx
14597d744:     	setb	%bpl
14597d748:     	xorl	%r14d, %r14d
14597d74b:     	cmpl	%ebx, %edi
14597d74d:     	setb	%r14b
14597d751:     	cmovnel	%r14d, %ebp
14597d755:     	testb	%bpl, %bpl
14597d758:     	je	0x14597d82b <.text+0x597c82b>
14597d75e:     	movq	%rdx, %rsi
14597d761:     	movq	%r8, 0x8(%rdx)
14597d765:     	cmpq	%rcx, %rdx
14597d768:     	je	0x14597d82b <.text+0x597c82b>
14597d76e:     	cmpq	$-0x1, 0x18(%rax)
14597d773:     	je	0x14597d7b0 <.text+0x597c7b0>
14597d775:     	movq	0x30(%rax), %rdx
14597d779:     	movl	$0x1, %edi
14597d77e:     	cmpb	$0x0, 0x54(%rdx)
14597d782:     	movq	%r11, %rdx
14597d785:     	je	0x14597d7d0 <.text+0x597c7d0>
14597d787:     	movl	(%rdx), %r8d
14597d78a:     	xorl	%r10d, %r8d
14597d78d:     	movzbl	0x4(%rdx), %edx
14597d791:     	xorl	$0x6c, %edx
14597d794:     	xorl	%edi, %edi
14597d796:     	orl	%r8d, %edx
14597d799:     	setne	%dil
14597d79d:     	leal	(%rdi,%rdi,2), %edi
14597d7a0:     	jmp	0x14597d7d0 <.text+0x597c7d0>
14597d7a2:     	nopw	%cs:(%rax,%rax)
14597d7b0:     	movl	$0x2, %edi
14597d7b5:     	cmpq	$-0x1, 0x40(%rax)
14597d7ba:     	jne	0x14597d7d0 <.text+0x597c7d0>
14597d7bc:     	movl	$0x3, %edi
14597d7c1:     	cmpb	$0x1, 0x15c(%rax)
14597d7c8:     	movq	%r9, %rdx
14597d7cb:     	je	0x14597d787 <.text+0x597c787>
14597d7cd:     	nopl	(%rax)
14597d7d0:     	movq	-0x8(%rsi), %r8
14597d7d4:     	cmpq	$-0x1, 0x18(%r8)
14597d7d9:     	je	0x14597d720 <.text+0x597c720>
14597d7df:     	movq	0x30(%r8), %rdx
14597d7e3:     	movl	$0x1, %ebx
14597d7e8:     	cmpb	$0x0, 0x54(%rdx)
14597d7ec:     	movq	%r11, %rdx
14597d7ef:     	je	0x14597d730 <.text+0x597c730>
14597d7f5:     	movl	(%rdx), %ebx
14597d7f7:     	xorl	%r10d, %ebx
14597d7fa:     	movzbl	0x4(%rdx), %edx
14597d7fe:     	xorl	$0x6c, %edx
14597d801:     	xorl	%r14d, %r14d
14597d804:     	orl	%ebx, %edx
14597d806:     	setne	%r14b
14597d80a:     	leal	(%r14,%r14,2), %ebx
14597d80e:     	jmp	0x14597d730 <.text+0x597c730>
14597d813:     	movl	$0x3, %ebx
14597d818:     	cmpb	$0x1, 0x15c(%r8)
14597d820:     	movq	%r9, %rdx
14597d823:     	jne	0x14597d730 <.text+0x597c730>
14597d829:     	jmp	0x14597d7f5 <.text+0x597c7f5>
14597d82b:     	movq	%rax, (%rsi)
14597d82e:     	popq	%rbx
14597d82f:     	popq	%rbp
14597d830:     	popq	%rdi
14597d831:     	popq	%rsi
14597d832:     	popq	%r14
14597d834:     	retq
