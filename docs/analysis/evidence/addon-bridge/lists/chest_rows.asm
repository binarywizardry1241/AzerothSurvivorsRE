
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14599a570:     	pushq	%rbp
14599a571:     	pushq	%r15
14599a573:     	pushq	%r14
14599a575:     	pushq	%r13
14599a577:     	pushq	%r12
14599a579:     	pushq	%rsi
14599a57a:     	pushq	%rdi
14599a57b:     	pushq	%rbx
14599a57c:     	subq	$0x108, %rsp            # imm = 0x108
14599a583:     	leaq	0x80(%rsp), %rbp
14599a58b:     	movaps	%xmm6, 0x70(%rbp)
14599a58f:     	movq	$-0x2, 0x68(%rbp)
14599a597:     	movq	%rcx, %rsi
14599a59a:     	movq	(%rdx), %r13
14599a59d:     	movq	0x8(%rdx), %r12
14599a5a1:     	cmpq	%r12, %r13
14599a5a4:     	je	0x14599a8ec <.text+0x59998ec>
14599a5aa:     	addq	$0x48, %r13
14599a5ae:     	nop
14599a5b0:     	cmpl	$0x2, -0x28(%r13)
14599a5b5:     	je	0x14599a5cd <.text+0x59995cd>
14599a5b7:     	leaq	-0x48(%r13), %rax
14599a5bb:     	addq	$0x48, %r13
14599a5bf:     	addq	$0x48, %rax
14599a5c3:     	cmpq	%r12, %rax
14599a5c6:     	jne	0x14599a5b0 <.text+0x59995b0>
14599a5c8:     	jmp	0x14599a8ec <.text+0x59998ec>
14599a5cd:     	movq	%r13, (%rdx)
14599a5d0:     	movq	0x10(%rdx), %rbx
14599a5d4:     	movl	-0x20(%r13), %eax
14599a5d8:     	movl	%eax, 0x64(%rbp)
14599a5db:     	movl	-0xc(%r13), %eax
14599a5df:     	movl	%eax, 0x50(%rbp)
14599a5e2:     	movq	-0x14(%r13), %rax
14599a5e6:     	movq	%rax, 0x48(%rbp)
14599a5ea:     	leaq	0x4c(%rbp), %rcx
14599a5ee:     	cmpl	$0x1, (%rbx)
14599a5f1:     	jne	0x14599a615 <.text+0x5999615>
14599a5f3:     	movups	0x4(%rbx), %xmm1
14599a5f7:     	movaps	%xmm1, %xmm0
14599a5fa:     	shufps	$0xe2, %xmm1, %xmm0     # xmm0 = xmm0[2,0],xmm1[2,3]
14599a5fe:     	shufps	$0xe7, %xmm1, %xmm1     # xmm1 = xmm1[3,1,2,3]
14599a602:     	movaps	%xmm0, %xmm2
14599a605:     	subps	%xmm1, %xmm2
14599a608:     	movsd	0x48(%rbp), %xmm1
14599a60d:     	subps	%xmm1, %xmm0
14599a610:     	divps	%xmm2, %xmm0
14599a613:     	jmp	0x14599a61c <.text+0x599961c>
14599a615:     	movaps	0x41b7b4(%rip), %xmm0   # 0x145db5dd0
14599a61c:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14599a620:     	movss	%xmm1, 0x60(%rbp)
14599a625:     	movss	%xmm0, 0x20(%rbp)
14599a62a:     	leaq	0x50(%rbp), %rdx
14599a62e:     	leaq	0x48(%rbp), %rax
14599a632:     	movq	%rax, -0x50(%rbp)
14599a636:     	leaq	0x212c43(%rip), %r8     # 0x145bad280 <.text+0x5bac280>
14599a63d:     	movq	%r8, -0x48(%rbp)
14599a641:     	movq	%rcx, -0x40(%rbp)
14599a645:     	movq	%r8, -0x38(%rbp)
14599a649:     	movq	%rdx, -0x30(%rbp)
14599a64d:     	movq	%r8, -0x28(%rbp)
14599a651:     	leaq	0x60(%rbp), %rax
14599a655:     	movq	%rax, -0x20(%rbp)
14599a659:     	movq	%r8, -0x18(%rbp)
14599a65d:     	leaq	0x20(%rbp), %rax
14599a661:     	movq	%rax, -0x10(%rbp)
14599a665:     	movq	%r8, -0x8(%rbp)
14599a669:     	leaq	0x1223ec3(%rip), %rdx   # 0x146bbe533
14599a670:     	movq	%rbp, %r14
14599a673:     	leaq	-0x50(%rbp), %r8
14599a677:     	movq	%r14, %rcx
14599a67a:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14599a67f:     	leaq	0x64(%rbp), %rax
14599a683:     	movq	%rax, -0x50(%rbp)
14599a687:     	leaq	0x2138f2(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
14599a68e:     	movq	%rax, -0x48(%rbp)
14599a692:     	movq	%r14, -0x40(%rbp)
14599a696:     	leaq	-0x59985bd(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
14599a69d:     	movq	%rax, -0x38(%rbp)
14599a6a1:     	leaq	0x181a958(%rip), %rdx   # 0x1471b5000
14599a6a8:     	leaq	0x48(%rbp), %rcx
14599a6ac:     	leaq	-0x50(%rbp), %r8
14599a6b0:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14599a6b5:     	nop
14599a6b6:     	movq	(%rbp), %rdx
14599a6ba:     	testq	%rdx, %rdx
14599a6bd:     	je	0x14599a6ce <.text+0x59996ce>
14599a6bf:     	movq	0x8(%rbp), %rcx
14599a6c3:     	movl	$0x1, %r8d
14599a6c9:     	callq	0x1400021d0 <.text+0x11d0>
14599a6ce:     	movq	0x48(%rbp), %rdi
14599a6d2:     	cmpq	$-0x1, %rdi
14599a6d6:     	je	0x14599a8ec <.text+0x59998ec>
14599a6dc:     	movq	%rbx, 0x38(%rbp)
14599a6e0:     	movq	0x50(%rbp), %r14
14599a6e4:     	movq	0x58(%rbp), %rbx
14599a6e8:     	callq	0x140002200 <.text+0x1200>
14599a6ed:     	movl	$0x60, %ecx
14599a6f2:     	movl	$0x8, %edx
14599a6f7:     	callq	0x1400021c0 <.text+0x11c0>
14599a6fc:     	testq	%rax, %rax
14599a6ff:     	je	0x14599a91e <.text+0x599991e>
14599a705:     	movq	%rax, %r15
14599a708:     	movq	%rdi, (%rax)
14599a70b:     	movq	%r14, 0x8(%rax)
14599a70f:     	movq	%rbx, 0x10(%rax)
14599a713:     	movq	$0x4, 0x20(%rbp)
14599a71b:     	movq	%rax, 0x28(%rbp)
14599a71f:     	movq	$0x1, 0x30(%rbp)
14599a727:     	cmpq	%r12, %r13
14599a72a:     	je	0x14599a8d3 <.text+0x59998d3>
14599a730:     	movl	$0x1, %r14d
14599a736:     	movaps	0x41b693(%rip), %xmm6   # 0x145db5dd0
14599a73d:     	leaq	-0x50(%rbp), %rdi
14599a741:     	addq	$0x48, %r13
14599a745:     	nopw	%cs:(%rax,%rax)
14599a750:     	cmpl	$0x2, -0x28(%r13)
14599a755:     	je	0x14599a765 <.text+0x5999765>
14599a757:     	cmpq	%r12, %r13
14599a75a:     	leaq	0x48(%r13), %r13
14599a75e:     	jne	0x14599a750 <.text+0x5999750>
14599a760:     	jmp	0x14599a8d3 <.text+0x59998d3>
14599a765:     	movq	%rdi, %r8
14599a768:     	movl	-0x20(%r13), %eax
14599a76c:     	movl	%eax, 0x1c(%rbp)
14599a76f:     	movl	-0xc(%r13), %eax
14599a773:     	movl	%eax, 0x50(%rbp)
14599a776:     	movq	-0x14(%r13), %rax
14599a77a:     	movq	%rax, 0x48(%rbp)
14599a77e:     	movq	0x38(%rbp), %rax
14599a782:     	cmpl	$0x1, (%rax)
14599a785:     	movaps	%xmm6, %xmm0
14599a788:     	jne	0x14599a7ae <.text+0x59997ae>
14599a78a:     	movq	0x38(%rbp), %rax
14599a78e:     	movups	0x4(%rax), %xmm1
14599a792:     	movaps	%xmm1, %xmm0
14599a795:     	shufps	$0xe2, %xmm1, %xmm0     # xmm0 = xmm0[2,0],xmm1[2,3]
14599a799:     	shufps	$0xe7, %xmm1, %xmm1     # xmm1 = xmm1[3,1,2,3]
14599a79d:     	movaps	%xmm0, %xmm2
14599a7a0:     	subps	%xmm1, %xmm2
14599a7a3:     	movsd	0x48(%rbp), %xmm1
14599a7a8:     	subps	%xmm1, %xmm0
14599a7ab:     	divps	%xmm2, %xmm0
14599a7ae:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14599a7b2:     	movss	%xmm1, 0x64(%rbp)
14599a7b7:     	movss	%xmm0, 0x60(%rbp)
14599a7bc:     	leaq	0x48(%rbp), %rdi
14599a7c0:     	movq	%rdi, -0x50(%rbp)
14599a7c4:     	leaq	0x212ab5(%rip), %rcx    # 0x145bad280 <.text+0x5bac280>
14599a7cb:     	movq	%rcx, -0x48(%rbp)
14599a7cf:     	leaq	0x4c(%rbp), %rax
14599a7d3:     	movq	%rax, -0x40(%rbp)
14599a7d7:     	movq	%rcx, -0x38(%rbp)
14599a7db:     	leaq	0x50(%rbp), %rax
14599a7df:     	movq	%rax, -0x30(%rbp)
14599a7e3:     	movq	%rcx, -0x28(%rbp)
14599a7e7:     	leaq	0x64(%rbp), %rax
14599a7eb:     	movq	%rax, -0x20(%rbp)
14599a7ef:     	movq	%rcx, -0x18(%rbp)
14599a7f3:     	leaq	0x60(%rbp), %rax
14599a7f7:     	movq	%rax, -0x10(%rbp)
14599a7fb:     	movq	%rcx, -0x8(%rbp)
14599a7ff:     	movq	%rbp, %rbx
14599a802:     	movq	%rbx, %rcx
14599a805:     	leaq	0x1223d27(%rip), %rdx   # 0x146bbe533
14599a80c:     	movq	%r8, %rdi
14599a80f:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14599a814:     	nop
14599a815:     	leaq	0x1c(%rbp), %rax
14599a819:     	movq	%rax, -0x50(%rbp)
14599a81d:     	leaq	0x21375c(%rip), %rax    # 0x145badf80 <.text+0x5bacf80>
14599a824:     	movq	%rax, -0x48(%rbp)
14599a828:     	movq	%rbx, -0x40(%rbp)
14599a82c:     	leaq	-0x5998753(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
14599a833:     	movq	%rax, -0x38(%rbp)
14599a837:     	leaq	0x48(%rbp), %rcx
14599a83b:     	leaq	0x181a7be(%rip), %rdx   # 0x1471b5000
14599a842:     	movq	%rdi, %r8
14599a845:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
14599a84a:     	nop
14599a84b:     	movq	(%rbp), %rdx
14599a84f:     	testq	%rdx, %rdx
14599a852:     	je	0x14599a863 <.text+0x5999863>
14599a854:     	movq	0x8(%rbp), %rcx
14599a858:     	movl	$0x1, %r8d
14599a85e:     	callq	0x1400021d0 <.text+0x11d0>
14599a863:     	movq	0x48(%rbp), %rax
14599a867:     	cmpq	$-0x1, %rax
14599a86b:     	je	0x14599a8d3 <.text+0x59998d3>
14599a86d:     	movq	%rax, 0x40(%rbp)
14599a871:     	movq	0x50(%rbp), %rax
14599a875:     	movq	%rax, -0x58(%rbp)
14599a879:     	movq	0x58(%rbp), %rbx
14599a87d:     	cmpq	0x20(%rbp), %r14
14599a881:     	jne	0x14599a8a9 <.text+0x59998a9>
14599a883:     	movq	$0x18, 0x20(%rsp)
14599a88c:     	movl	$0x1, %r8d
14599a892:     	movl	$0x8, %r9d
14599a898:     	leaq	0x20(%rbp), %rcx
14599a89c:     	movq	%r14, %rdx
14599a89f:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599a8a4:     	nop
14599a8a5:     	movq	0x28(%rbp), %r15
14599a8a9:     	leaq	(%r14,%r14,2), %rax
14599a8ad:     	movq	0x40(%rbp), %rcx
14599a8b1:     	movq	%rcx, (%r15,%rax,8)
14599a8b5:     	movq	-0x58(%rbp), %rcx
14599a8b9:     	movq	%rcx, 0x8(%r15,%rax,8)
14599a8be:     	movq	%rbx, 0x10(%r15,%rax,8)
14599a8c3:     	incq	%r14
14599a8c6:     	movq	%r14, 0x30(%rbp)
14599a8ca:     	cmpq	%r12, %r13
14599a8cd:     	jne	0x14599a741 <.text+0x5999741>
14599a8d3:     	movq	0x30(%rbp), %rax
14599a8d7:     	movq	%rax, 0x10(%rsi)
14599a8db:     	movq	0x20(%rbp), %rax
14599a8df:     	movq	%rax, (%rsi)
14599a8e2:     	movq	0x28(%rbp), %rax
14599a8e6:     	movq	%rax, 0x8(%rsi)
14599a8ea:     	jmp	0x14599a903 <.text+0x5999903>
14599a8ec:     	movq	$0x0, (%rsi)
14599a8f3:     	movq	$0x8, 0x8(%rsi)
14599a8fb:     	movq	$0x0, 0x10(%rsi)
14599a903:     	movq	%rsi, %rax
14599a906:     	movaps	0x70(%rbp), %xmm6
14599a90a:     	addq	$0x108, %rsp            # imm = 0x108
14599a911:     	popq	%rbx
14599a912:     	popq	%rdi
14599a913:     	popq	%rsi
14599a914:     	popq	%r12
14599a916:     	popq	%r13
14599a918:     	popq	%r14
14599a91a:     	popq	%r15
14599a91c:     	popq	%rbp
14599a91d:     	retq
14599a91e:     	movq	%r14, 0x40(%rbp)
14599a922:     	movq	%rdi, 0x38(%rbp)
14599a926:     	movl	$0x8, %ecx
14599a92b:     	movl	$0x60, %edx
14599a930:     	callq	0x145d6944b <.text+0x5d6844b>
14599a935:     	nop
14599a936:     	ud2
