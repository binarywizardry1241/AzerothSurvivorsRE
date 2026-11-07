
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14006f550:     	pushq	%rsi
14006f551:     	pushq	%rdi
14006f552:     	pushq	%rbp
14006f553:     	pushq	%rbx
14006f554:     	movq	%rcx, %rax
14006f557:     	leaq	(%rcx,%rdx), %r8
14006f55b:     	testq	%rdx, %rdx
14006f55e:     	je	0x14006f6a2 <.text+0x6e6a2>
14006f564:     	movq	0x7f95515(%rip), %r10   # 0x148004a80
14006f56b:     	xorl	%edx, %edx
14006f56d:     	movq	%rax, %r9
14006f570:     	jmp	0x14006f599 <.text+0x6e599>
14006f572:     	movzbl	%r11b, %r11d
14006f576:     	movzbl	(%r10,%r11), %r11d
14006f57b:     	shrb	%r11b
14006f57e:     	testb	$0x1, %r11b
14006f582:     	je	0x14006f6a9 <.text+0x6e6a9>
14006f588:     	nopl	(%rax,%rax)
14006f590:     	cmpq	%r8, %r9
14006f593:     	je	0x14006f699 <.text+0x6e699>
14006f599:     	movq	%r9, %rsi
14006f59c:     	movq	%rdx, %rcx
14006f59f:     	movzbl	(%r9), %r9d
14006f5a3:     	movzbl	%r9b, %r11d
14006f5a7:     	testb	%r11b, %r11b
14006f5aa:     	js	0x14006f5c0 <.text+0x6e5c0>
14006f5ac:     	leaq	0x1(%rsi), %r9
14006f5b0:     	jmp	0x14006f620 <.text+0x6e620>
14006f5b2:     	nopw	%cs:(%rax,%rax)
14006f5c0:     	movl	%r11d, %edx
14006f5c3:     	andl	$0x1f, %edx
14006f5c6:     	movzbl	0x1(%rsi), %edi
14006f5ca:     	andl	$0x3f, %edi
14006f5cd:     	cmpb	$-0x21, %r11b
14006f5d1:     	jbe	0x14006f607 <.text+0x6e607>
14006f5d3:     	movzbl	0x2(%rsi), %r11d
14006f5d8:     	shll	$0x6, %edi
14006f5db:     	andl	$0x3f, %r11d
14006f5df:     	orl	%edi, %r11d
14006f5e2:     	cmpb	$-0x10, %r9b
14006f5e6:     	jb	0x14006f615 <.text+0x6e615>
14006f5e8:     	leaq	0x4(%rsi), %r9
14006f5ec:     	movzbl	0x3(%rsi), %edi
14006f5f0:     	andl	$0x7, %edx
14006f5f3:     	shll	$0x12, %edx
14006f5f6:     	shll	$0x6, %r11d
14006f5fa:     	andl	$0x3f, %edi
14006f5fd:     	orl	%r11d, %edi
14006f600:     	orl	%edx, %edi
14006f602:     	movl	%edi, %r11d
14006f605:     	jmp	0x14006f620 <.text+0x6e620>
14006f607:     	leaq	0x2(%rsi), %r9
14006f60b:     	shll	$0x6, %edx
14006f60e:     	orl	%edi, %edx
14006f610:     	movl	%edx, %r11d
14006f613:     	jmp	0x14006f620 <.text+0x6e620>
14006f615:     	leaq	0x3(%rsi), %r9
14006f619:     	shll	$0xc, %edx
14006f61c:     	orl	%edx, %r11d
14006f61f:     	nop
14006f620:     	movq	%r9, %rdx
14006f623:     	subq	%rsi, %rdx
14006f626:     	addq	%rcx, %rdx
14006f629:     	leal	-0x9(%r11), %esi
14006f62d:     	cmpl	$0x5, %esi
14006f630:     	jb	0x14006f590 <.text+0x6e590>
14006f636:     	cmpl	$0x20, %r11d
14006f63a:     	je	0x14006f590 <.text+0x6e590>
14006f640:     	cmpl	$0x85, %r11d
14006f647:     	jb	0x14006f6a9 <.text+0x6e6a9>
14006f649:     	movl	%r11d, %esi
14006f64c:     	shrl	$0x8, %esi
14006f64f:     	cmpl	$0x1f, %esi
14006f652:     	jg	0x14006f66d <.text+0x6e66d>
14006f654:     	testl	%esi, %esi
14006f656:     	je	0x14006f68b <.text+0x6e68b>
14006f658:     	cmpl	$0x16, %esi
14006f65b:     	jne	0x14006f6a9 <.text+0x6e6a9>
14006f65d:     	cmpl	$0x1680, %r11d          # imm = 0x1680
14006f664:     	sete	%r11b
14006f668:     	jmp	0x14006f57e <.text+0x6e57e>
14006f66d:     	cmpl	$0x20, %esi
14006f670:     	je	0x14006f572 <.text+0x6e572>
14006f676:     	cmpl	$0x30, %esi
14006f679:     	jne	0x14006f6a9 <.text+0x6e6a9>
14006f67b:     	cmpl	$0x3000, %r11d          # imm = 0x3000
14006f682:     	sete	%r11b
14006f686:     	jmp	0x14006f57e <.text+0x6e57e>
14006f68b:     	movzbl	%r11b, %r11d
14006f68f:     	movzbl	(%r10,%r11), %r11d
14006f694:     	jmp	0x14006f57e <.text+0x6e57e>
14006f699:     	xorl	%ecx, %ecx
14006f69b:     	xorl	%edx, %edx
14006f69d:     	jmp	0x14006f7be <.text+0x6e7be>
14006f6a2:     	xorl	%edx, %edx
14006f6a4:     	movq	%rax, %r9
14006f6a7:     	xorl	%ecx, %ecx
14006f6a9:     	cmpq	%r8, %r9
14006f6ac:     	je	0x14006f7be <.text+0x6e7be>
14006f6b2:     	movq	0x7f953c7(%rip), %r10   # 0x148004a80
14006f6b9:     	jmp	0x14006f6d9 <.text+0x6e6d9>
14006f6bb:     	movzbl	%sil, %esi
14006f6bf:     	movzbl	(%r10,%rsi), %ebx
14006f6c4:     	shrb	%bl
14006f6c6:     	testb	$0x1, %bl
14006f6c9:     	je	0x14006f7b8 <.text+0x6e7b8>
14006f6cf:     	nop
14006f6d0:     	cmpq	%r8, %r9
14006f6d3:     	je	0x14006f7be <.text+0x6e7be>
14006f6d9:     	movq	%r8, %r11
14006f6dc:     	movsbl	-0x1(%r8), %esi
14006f6e1:     	testl	%esi, %esi
14006f6e3:     	js	0x14006f700 <.text+0x6e700>
14006f6e5:     	leaq	-0x1(%r11), %r8
14006f6e9:     	leal	-0x9(%rsi), %edi
14006f6ec:     	cmpl	$0x5, %edi
14006f6ef:     	jb	0x14006f6d0 <.text+0x6e6d0>
14006f6f1:     	jmp	0x14006f75c <.text+0x6e75c>
14006f6f3:     	nopw	%cs:(%rax,%rax)
14006f700:     	movzbl	-0x2(%r11), %edi
14006f705:     	cmpb	$-0x40, %dil
14006f709:     	jge	0x14006f72b <.text+0x6e72b>
14006f70b:     	movzbl	-0x3(%r11), %ebx
14006f710:     	cmpb	$-0x40, %bl
14006f713:     	jge	0x14006f734 <.text+0x6e734>
14006f715:     	leaq	-0x4(%r11), %r8
14006f719:     	movzbl	-0x4(%r11), %ebp
14006f71e:     	andl	$0x7, %ebp
14006f721:     	shll	$0x6, %ebp
14006f724:     	andl	$0x3f, %ebx
14006f727:     	orl	%ebp, %ebx
14006f729:     	jmp	0x14006f73b <.text+0x6e73b>
14006f72b:     	leaq	-0x2(%r11), %r8
14006f72f:     	andl	$0x1f, %edi
14006f732:     	jmp	0x14006f743 <.text+0x6e743>
14006f734:     	leaq	-0x3(%r11), %r8
14006f738:     	andl	$0xf, %ebx
14006f73b:     	shll	$0x6, %ebx
14006f73e:     	andl	$0x3f, %edi
14006f741:     	orl	%ebx, %edi
14006f743:     	shll	$0x6, %edi
14006f746:     	andb	$0x3f, %sil
14006f74a:     	movzbl	%sil, %esi
14006f74e:     	orl	%edi, %esi
14006f750:     	leal	-0x9(%rsi), %edi
14006f753:     	cmpl	$0x5, %edi
14006f756:     	jb	0x14006f6d0 <.text+0x6e6d0>
14006f75c:     	cmpl	$0x20, %esi
14006f75f:     	je	0x14006f6d0 <.text+0x6e6d0>
14006f765:     	cmpl	$0x85, %esi
14006f76b:     	jb	0x14006f7b8 <.text+0x6e7b8>
14006f76d:     	movl	%esi, %edi
14006f76f:     	shrl	$0x8, %edi
14006f772:     	cmpl	$0x1f, %edi
14006f775:     	jg	0x14006f78e <.text+0x6e78e>
14006f777:     	testl	%edi, %edi
14006f779:     	je	0x14006f7aa <.text+0x6e7aa>
14006f77b:     	cmpl	$0x16, %edi
14006f77e:     	jne	0x14006f7b8 <.text+0x6e7b8>
14006f780:     	cmpl	$0x1680, %esi           # imm = 0x1680
14006f786:     	sete	%bl
14006f789:     	jmp	0x14006f6c6 <.text+0x6e6c6>
14006f78e:     	cmpl	$0x20, %edi
14006f791:     	je	0x14006f6bb <.text+0x6e6bb>
14006f797:     	cmpl	$0x30, %edi
14006f79a:     	jne	0x14006f7b8 <.text+0x6e7b8>
14006f79c:     	cmpl	$0x3000, %esi           # imm = 0x3000
14006f7a2:     	sete	%bl
14006f7a5:     	jmp	0x14006f6c6 <.text+0x6e6c6>
14006f7aa:     	movzbl	%sil, %esi
14006f7ae:     	movzbl	(%r10,%rsi), %ebx
14006f7b3:     	jmp	0x14006f6c6 <.text+0x6e6c6>
14006f7b8:     	subq	%r9, %rdx
14006f7bb:     	addq	%r11, %rdx
14006f7be:     	subq	%rcx, %rdx
14006f7c1:     	addq	%rcx, %rax
14006f7c4:     	popq	%rbx
14006f7c5:     	popq	%rbp
14006f7c6:     	popq	%rdi
14006f7c7:     	popq	%rsi
14006f7c8:     	retq
