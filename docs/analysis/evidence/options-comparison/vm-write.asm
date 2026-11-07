Disassembly of section .text:

0000000140001000 <.text>:
14063a4e0:     	pushq	%rbp
14063a4e1:     	pushq	%r15
14063a4e3:     	pushq	%r14
14063a4e5:     	pushq	%r12
14063a4e7:     	pushq	%rsi
14063a4e8:     	pushq	%rdi
14063a4e9:     	pushq	%rbx
14063a4ea:     	subq	$0x180, %rsp            # imm = 0x180
14063a4f1:     	leaq	0x80(%rsp), %rbp
14063a4f9:     	movq	$-0x2, 0xf8(%rbp)
14063a504:     	movq	0x160(%rbp), %rax
14063a50b:     	movq	%rdx, -0x8(%rbp)
14063a50f:     	movq	%r8, (%rbp)
14063a513:     	movq	%r9, -0x18(%rbp)
14063a517:     	movq	%rax, -0x10(%rbp)
14063a51b:     	cmpq	$0x0, 0x90(%rcx)
14063a523:     	je	0x14063a845 <.text+0x639845>
14063a529:     	movq	0x78(%rcx), %rax
14063a52d:     	movq	0x80(%rcx), %rdx
14063a534:     	movabsq	$-0x1e9eb2a39ad5d22, %r8 # imm = 0xFE1614D5C652A2DE
14063a53e:     	xorl	%r9d, %r9d
14063a541:     	movdqa	0x5760a97(%rip), %xmm0  # 0x145d9afe0
14063a549:     	pcmpeqd	%xmm1, %xmm1
14063a54d:     	movdqa	0x58210cb(%rip), %xmm2  # 0x145e5b620
14063a555:     	andq	%rdx, %r8
14063a558:     	movdqu	(%rax,%r8), %xmm3
14063a55e:     	movdqa	%xmm3, %xmm4
14063a562:     	pcmpeqb	%xmm0, %xmm4
14063a566:     	pmovmskb	%xmm4, %r10d
14063a56b:     	testl	%r10d, %r10d
14063a56e:     	je	0x14063a5b0 <.text+0x6395b0>
14063a570:     	tzcntl	%r10d, %r11d
14063a575:     	addq	%r8, %r11
14063a578:     	andq	%rdx, %r11
14063a57b:     	negq	%r11
14063a57e:     	leaq	(%r11,%r11,2), %r11
14063a582:     	movdqu	-0x18(%rax,%r11,8), %xmm4
14063a589:     	pcmpeqb	%xmm2, %xmm4
14063a58d:     	pmovmskb	%xmm4, %esi
14063a591:     	cmpl	$0xffff, %esi           # imm = 0xFFFF
14063a597:     	je	0x14063a5cf <.text+0x6395cf>
14063a599:     	leal	-0x1(%r10), %r11d
14063a59d:     	andw	%r10w, %r11w
14063a5a1:     	movl	%r11d, %r10d
14063a5a4:     	jne	0x14063a570 <.text+0x639570>
14063a5a6:     	nopw	%cs:(%rax,%rax)
14063a5b0:     	pcmpeqb	%xmm1, %xmm3
14063a5b4:     	pmovmskb	%xmm3, %r10d
14063a5b9:     	testl	%r10d, %r10d
14063a5bc:     	jne	0x14063a845 <.text+0x639845>
14063a5c2:     	addq	%r9, %r8
14063a5c5:     	addq	$0x10, %r8
14063a5c9:     	addq	$0x10, %r9
14063a5cd:     	jmp	0x14063a555 <.text+0x639555>
14063a5cf:     	leaq	(%rax,%r11,8), %rax
14063a5d3:     	movq	-0x8(%rax), %rax
14063a5d7:     	cmpq	0x260(%rcx), %rax
14063a5de:     	jae	0x14063a845 <.text+0x639845>
14063a5e4:     	movq	0x258(%rcx), %rdx
14063a5eb:     	movq	(%rdx,%rax,8), %rax
14063a5ef:     	testq	%rax, %rax
14063a5f2:     	je	0x14063a845 <.text+0x639845>
14063a5f8:     	movq	0x228(%rcx), %rsi
14063a5ff:     	notq	%rax
14063a602:     	imulq	$0x38, %rax, %rax
14063a606:     	cmpb	$0x1, 0x30(%rsi,%rax)
14063a60b:     	jne	0x14063a845 <.text+0x639845>
14063a611:     	addq	%rax, %rsi
14063a614:     	movq	%rsi, %rcx
14063a617:     	callq	0x140635350 <.text+0x634350>
14063a61c:     	movq	0x10(%rsi), %rdi
14063a620:     	leaq	-0x8(%rbp), %rbx
14063a624:     	movq	%rbx, 0x40(%rbp)
14063a628:     	leaq	-0x63856f(%rip), %r14   # 0x1400020c0 <.text+0x10c0>
14063a62f:     	movq	%r14, 0x48(%rbp)
14063a633:     	leaq	-0x18(%rbp), %rax
14063a637:     	movq	%rax, 0x50(%rbp)
14063a63b:     	movq	%r14, 0x58(%rbp)
14063a63f:     	leaq	0x5826fc1(%rip), %rdx   # 0x145e61607
14063a646:     	leaq	0x8(%rbp), %rcx
14063a64a:     	leaq	0x40(%rbp), %r8
14063a64e:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14063a653:     	movq	0x10(%rbp), %rcx
14063a657:     	movq	0x18(%rbp), %rax
14063a65b:     	movq	%rcx, 0xf0(%rbp)
14063a662:     	movq	%rcx, 0xc0(%rbp)
14063a669:     	movq	%rax, 0xc8(%rbp)
14063a670:     	leaq	0xd0(%rbp), %rcx
14063a677:     	leaq	0xc0(%rbp), %rsi
14063a67e:     	movq	%rsi, %rdx
14063a681:     	callq	0x14580e2d0 <.text+0x580d2d0>
14063a686:     	nop
14063a687:     	leaq	0x5826ee5(%rip), %rax   # 0x145e61573
14063a68e:     	movq	%rax, 0x20(%rbp)
14063a692:     	movq	$0x23, 0x28(%rbp)
14063a69a:     	movl	$0x3bd, 0xb0(%rbp)      # imm = 0x3BD
14063a6a4:     	leaq	0x20(%rbp), %r12
14063a6a8:     	movq	%r12, 0x40(%rbp)
14063a6ac:     	movq	%r14, 0x48(%rbp)
14063a6b0:     	leaq	0xb0(%rbp), %r15
14063a6b7:     	movq	%r15, 0x50(%rbp)
14063a6bb:     	leaq	0x55738be(%rip), %rax   # 0x145badf80 <.text+0x5bacf80>
14063a6c2:     	movq	%rax, 0x58(%rbp)
14063a6c6:     	leaq	0x5947a13(%rip), %rdx   # 0x145f820e0
14063a6cd:     	leaq	-0x60(%rbp), %rcx
14063a6d1:     	leaq	0x40(%rbp), %r8
14063a6d5:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14063a6da:     	nop
14063a6db:     	movups	-0x60(%rbp), %xmm0
14063a6df:     	movups	%xmm0, 0x58(%rbp)
14063a6e3:     	movq	-0x50(%rbp), %rax
14063a6e7:     	movq	%rax, 0x68(%rbp)
14063a6eb:     	movq	%rdi, 0x70(%rbp)
14063a6ef:     	movdqu	0xd0(%rbp), %xmm0
14063a6f7:     	movdqa	%xmm0, 0x40(%rbp)
14063a6fc:     	movq	0xe0(%rbp), %rax
14063a703:     	movq	%rax, 0x50(%rbp)
14063a707:     	movq	$0x0, 0x78(%rbp)
14063a70f:     	leaq	-0x60(%rbp), %rcx
14063a713:     	leaq	0x40(%rbp), %rdi
14063a717:     	movq	%rdi, %rdx
14063a71a:     	callq	0x140d6d220 <.text+0xd6c220>
14063a71f:     	nop
14063a720:     	cmpb	$-0x1, -0x60(%rbp)
14063a724:     	je	0x14063a829 <.text+0x639829>
14063a72a:     	movq	-0x20(%rbp), %rax
14063a72e:     	movq	%rax, 0x80(%rbp)
14063a735:     	movdqu	-0x60(%rbp), %xmm0
14063a73a:     	movdqu	-0x50(%rbp), %xmm1
14063a73f:     	movdqu	-0x40(%rbp), %xmm2
14063a744:     	movdqu	-0x30(%rbp), %xmm3
14063a749:     	movdqa	%xmm3, 0x70(%rbp)
14063a74e:     	movdqa	%xmm2, 0x60(%rbp)
14063a753:     	movdqa	%xmm1, 0x50(%rbp)
14063a758:     	movdqa	%xmm0, 0x40(%rbp)
14063a75d:     	movq	0x79bc844(%rip), %rax   # 0x147ff6fa8
14063a764:     	movq	(%rax), %rax
14063a767:     	cmpq	$0x3, %rax
14063a76b:     	ja	0x14063a81f <.text+0x63981f>
14063a771:     	movzbl	0x7981150(%rip), %edx   # 0x147fbb8c8
14063a778:     	movzbl	%dl, %eax
14063a77b:     	leal	-0x1(%rax), %ecx
14063a77e:     	cmpl	$0x2, %ecx
14063a781:     	jae	0x14063a81b <.text+0x63981b>
14063a787:     	movq	0x798112a(%rip), %rcx   # 0x147fbb8b8
14063a78e:     	callq	0x144c46ce0 <.text+0x4c45ce0>
14063a793:     	nop
14063a794:     	testb	%al, %al
14063a796:     	je	0x14063a81f <.text+0x63981f>
14063a79c:     	movq	0x7981115(%rip), %rcx   # 0x147fbb8b8
14063a7a3:     	leaq	0x30(%rcx), %rax
14063a7a7:     	movq	%rbx, 0x20(%rbp)
14063a7ab:     	movq	%r14, 0x28(%rbp)
14063a7af:     	movq	%rdi, 0x30(%rbp)
14063a7b3:     	leaq	0x51d85c6(%rip), %rdx   # 0x145812d80 <.text+0x5811d80>
14063a7ba:     	movq	%rdx, 0x38(%rbp)
14063a7be:     	leaq	0x5826e49(%rip), %rdx   # 0x145e6160e
14063a7c5:     	movq	%rdx, 0xc0(%rbp)
14063a7cc:     	movq	%r12, 0xc8(%rbp)
14063a7d3:     	movq	%rsi, 0xb0(%rbp)
14063a7da:     	leaq	0x582175f(%rip), %rdx   # 0x145e5bf40
14063a7e1:     	movq	%rdx, 0xb8(%rbp)
14063a7e8:     	movq	$0x1, 0xd0(%rbp)
14063a7f3:     	movq	%r15, 0xd8(%rbp)
14063a7fa:     	movq	$0x1, 0xe0(%rbp)
14063a805:     	movq	%rax, 0xe8(%rbp)
14063a80c:     	leaq	0xd0(%rbp), %rdx
14063a813:     	callq	0x144c48500 <.text+0x4c47500>
14063a818:     	nop
14063a819:     	jmp	0x14063a81f <.text+0x63981f>
14063a81b:     	testl	%eax, %eax
14063a81d:     	jne	0x14063a857 <.text+0x639857>
14063a81f:     	leaq	0x40(%rbp), %rcx
14063a823:     	callq	0x1405eaeb0 <.text+0x5e9eb0>
14063a828:     	nop
14063a829:     	movq	0x8(%rbp), %rdx
14063a82d:     	testq	%rdx, %rdx
14063a830:     	je	0x14063a845 <.text+0x639845>
14063a832:     	movl	$0x1, %r8d
14063a838:     	movq	0xf0(%rbp), %rcx
14063a83f:     	callq	0x1400021d0 <.text+0x11d0>
14063a844:     	nop
14063a845:     	addq	$0x180, %rsp            # imm = 0x180
14063a84c:     	popq	%rbx
14063a84d:     	popq	%rdi
14063a84e:     	popq	%rsi
14063a84f:     	popq	%r12
14063a851:     	popq	%r14
14063a853:     	popq	%r15
14063a855:     	popq	%rbp
14063a856:     	retq
14063a857:     	leaq	0x798105a(%rip), %rcx   # 0x147fbb8b8
14063a85e:     	callq	0x145d15470 <.text+0x5d14470>
14063a863:     	nop
14063a864:     	movl	%eax, %edx
14063a866:     	testb	%al, %al
14063a868:     	jne	0x14063a787 <.text+0x639787>
14063a86e:     	jmp	0x14063a81f <.text+0x63981f>
