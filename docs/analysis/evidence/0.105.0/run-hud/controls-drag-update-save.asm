Disassembly of section .text:

0000000140001000 <.text>:
140275650:     	pushq	%rbp
140275651:     	pushq	%r15
140275653:     	pushq	%r14
140275655:     	pushq	%r13
140275657:     	pushq	%r12
140275659:     	pushq	%rsi
14027565a:     	pushq	%rdi
14027565b:     	pushq	%rbx
14027565c:     	subq	$0x158, %rsp            # imm = 0x158
140275663:     	leaq	0x80(%rsp), %rbp
14027566b:     	movaps	%xmm9, 0xc0(%rbp)
140275673:     	movaps	%xmm8, 0xb0(%rbp)
14027567b:     	movaps	%xmm7, 0xa0(%rbp)
140275682:     	movaps	%xmm6, 0x90(%rbp)
140275689:     	movq	$-0x2, 0x88(%rbp)
140275694:     	movq	(%rdx), %rdi
140275697:     	movzbl	0x20(%rdi), %ebx
14027569b:     	cmpb	$0x2, %bl
14027569e:     	je	0x140275a8d <.text+0x274a8d>
1402756a4:     	movq	0x140(%rbp), %rax
1402756ab:     	movq	0x10(%rdx), %r14
1402756af:     	movl	0x1c(%rdx), %r15d
1402756b3:     	movq	(%r8), %rcx
1402756b6:     	movq	(%r9), %rsi
1402756b9:     	movups	(%rax), %xmm8
1402756bd:     	movsd	0x10(%rax), %xmm9
1402756c3:     	movsd	0x18(%rdi), %xmm7
1402756c8:     	movsd	0x24(%rdi), %xmm6
1402756cd:     	cmpq	$0x0, 0x18(%rcx)
1402756d2:     	je	0x140275753 <.text+0x274753>
1402756d4:     	movq	(%rcx), %rax
1402756d7:     	movq	0x8(%rcx), %rcx
1402756db:     	movabsq	$0x5317300c6b349d75, %rdx # imm = 0x5317300C6B349D75
1402756e5:     	xorl	%r8d, %r8d
1402756e8:     	movdqa	0x5af85d0(%rip), %xmm0  # 0x145d6dcc0
1402756f0:     	pcmpeqd	%xmm1, %xmm1
1402756f4:     	andq	%rcx, %rdx
1402756f7:     	movdqu	(%rax,%rdx), %xmm2
1402756fc:     	movdqa	%xmm2, %xmm3
140275700:     	pcmpeqb	%xmm0, %xmm3
140275704:     	pmovmskb	%xmm3, %r9d
140275709:     	testl	%r9d, %r9d
14027570c:     	je	0x140275738 <.text+0x274738>
14027570e:     	tzcntl	%r9d, %r10d
140275713:     	addq	%rdx, %r10
140275716:     	andq	%rcx, %r10
140275719:     	shlq	$0x2, %r10
14027571d:     	movq	%rax, %r11
140275720:     	subq	%r10, %r11
140275723:     	cmpw	$0x0, -0x4(%r11)
140275729:     	je	0x140275794 <.text+0x274794>
14027572b:     	leal	-0x1(%r9), %r10d
14027572f:     	andw	%r9w, %r10w
140275733:     	movl	%r10d, %r9d
140275736:     	jne	0x14027570e <.text+0x27470e>
140275738:     	pcmpeqb	%xmm1, %xmm2
14027573c:     	pmovmskb	%xmm2, %r9d
140275741:     	testl	%r9d, %r9d
140275744:     	jne	0x140275753 <.text+0x274753>
140275746:     	addq	%r8, %rdx
140275749:     	addq	$0x10, %rdx
14027574d:     	addq	$0x10, %r8
140275751:     	jmp	0x1402756f4 <.text+0x2746f4>
140275753:     	movq	%rbp, %rcx
140275756:     	movq	%rsi, %rdx
140275759:     	callq	0x143608050 <.text+0x3607050>
14027575e:     	cmpq	$0x0, 0x20(%rbp)
140275763:     	je	0x1402758d6 <.text+0x2748d6>
140275769:     	cmpw	$0x0, 0x18(%rbp)
14027576e:     	jne	0x140275794 <.text+0x274794>
140275770:     	movq	0x8(%rbp), %rax
140275774:     	nopw	%cs:(%rax,%rax)
140275780:     	movdqa	(%rax), %xmm0
140275784:     	addq	$0x10, %rax
140275788:     	pmovmskb	%xmm0, %ecx
14027578c:     	cmpl	$0xffff, %ecx           # imm = 0xFFFF
140275792:     	je	0x140275780 <.text+0x274780>
140275794:     	movaps	%xmm8, (%rbp)
140275799:     	movlps	%xmm9, 0x10(%rbp)
14027579e:     	leaq	-0x30(%rbp), %rcx
1402757a2:     	movq	%rbp, %rdx
1402757a5:     	callq	0x1400118b0 <.text+0x108b0>
1402757aa:     	cmpb	$0x1, -0x30(%rbp)
1402757ae:     	je	0x140275a8d <.text+0x274a8d>
1402757b4:     	movq	-0x28(%rbp), %rax
1402757b8:     	cmpl	$0x1, (%rax)
1402757bb:     	jne	0x14027582c <.text+0x27482c>
1402757bd:     	movupd	0x8(%rax), %xmm0
1402757c2:     	pxor	%xmm2, %xmm2
1402757c6:     	ucomisd	%xmm2, %xmm0
1402757ca:     	jb	0x14027582c <.text+0x27482c>
1402757cc:     	movsd	0x10(%rax), %xmm1
1402757d1:     	ucomisd	%xmm2, %xmm1
1402757d5:     	jb	0x14027582c <.text+0x27482c>
1402757d7:     	movl	0xc0(%rax), %ecx
1402757dd:     	xorps	%xmm2, %xmm2
1402757e0:     	cvtsi2sd	%rcx, %xmm2
1402757e5:     	ucomisd	%xmm0, %xmm2
1402757e9:     	jbe	0x14027582c <.text+0x27482c>
1402757eb:     	movl	0xc4(%rax), %ecx
1402757f1:     	xorps	%xmm2, %xmm2
1402757f4:     	cvtsi2sd	%rcx, %xmm2
1402757f9:     	ucomisd	%xmm1, %xmm2
1402757fd:     	jbe	0x14027582c <.text+0x27482c>
1402757ff:     	cvtpd2ps	%xmm0, %xmm0
140275803:     	leaq	0xc8(%rax), %rcx
14027580a:     	leaq	0xbc(%rax), %rdx
140275811:     	cmpb	$0x0, 0xb8(%rax)
140275818:     	cmovneq	%rdx, %rcx
14027581c:     	movss	(%rcx), %xmm1
140275820:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
140275824:     	divps	%xmm1, %xmm0
140275827:     	jmp	0x1402758b3 <.text+0x2748b3>
14027582c:     	movq	%rbp, %rcx
14027582f:     	movq	%rsi, %rdx
140275832:     	callq	0x143608050 <.text+0x3607050>
140275837:     	movq	0x20(%rbp), %rax
14027583b:     	testq	%rax, %rax
14027583e:     	je	0x140275a8d <.text+0x274a8d>
140275844:     	movzwl	0x18(%rbp), %edx
140275848:     	movq	(%rbp), %rcx
14027584c:     	testw	%dx, %dx
14027584f:     	jne	0x140275884 <.text+0x274884>
140275851:     	movq	0x8(%rbp), %r8
140275855:     	nopw	%cs:(%rax,%rax)
140275860:     	movdqa	(%r8), %xmm0
140275865:     	addq	$-0x880, %rcx           # imm = 0xF780
14027586c:     	addq	$0x10, %r8
140275870:     	pmovmskb	%xmm0, %edx
140275874:     	xorl	$0xffff, %edx           # imm = 0xFFFF
14027587a:     	je	0x140275860 <.text+0x274860>
14027587c:     	movq	%r8, 0x8(%rbp)
140275880:     	movq	%rcx, (%rbp)
140275884:     	leal	-0x1(%rdx), %r8d
140275888:     	tzcntl	%edx, %r9d
14027588d:     	andl	%edx, %r8d
140275890:     	movw	%r8w, 0x18(%rbp)
140275895:     	movq	%r9, %rdx
140275898:     	negq	%rdx
14027589b:     	shll	$0x3, %r9d
14027589f:     	shlq	$0x7, %rdx
1402758a3:     	subq	%r9, %rdx
1402758a6:     	decq	%rax
1402758a9:     	movq	%rax, 0x20(%rbp)
1402758ad:     	movsd	-0x8(%rcx,%rdx), %xmm0
1402758b3:     	addps	%xmm0, %xmm6
1402758b6:     	subps	%xmm7, %xmm6
1402758b9:     	movl	%r15d, (%r14)
1402758bc:     	leaq	0xc(%rdi), %rax
1402758c0:     	testb	$0x1, %bl
1402758c3:     	cmoveq	%rdi, %rax
1402758c7:     	movl	$0x1, (%rax)
1402758cd:     	movlps	%xmm6, 0x4(%rax)
1402758d1:     	jmp	0x140275a8d <.text+0x274a8d>
1402758d6:     	movl	%r15d, (%r14)
1402758d9:     	movb	$0x2, 0x20(%rdi)
1402758dd:     	movq	$0x0, 0x60(%rbp)
1402758e5:     	movq	$0x1, 0x68(%rbp)
1402758ed:     	movq	$0x0, 0x70(%rbp)
1402758f5:     	movl	0x8(%rdi), %eax
1402758f8:     	movl	%eax, 0x28(%rbp)
1402758fb:     	movq	(%rdi), %rax
1402758fe:     	movq	%rax, 0x20(%rbp)
140275902:     	movq	0xc(%rdi), %rax
140275906:     	movq	%rax, 0x40(%rbp)
14027590a:     	movl	0x14(%rdi), %eax
14027590d:     	movl	%eax, 0x48(%rbp)
140275910:     	leaq	0x10(%rbp), %r13
140275914:     	leaq	0x5b4a858(%rip), %rax   # 0x145dc0173
14027591b:     	movq	%rax, 0x10(%rbp)
14027591f:     	movq	$0x5, 0x18(%rbp)
140275927:     	leaq	0x5b4a84a(%rip), %rax   # 0x145dc0178
14027592e:     	movq	%rax, 0x30(%rbp)
140275932:     	movq	$0x5, 0x38(%rbp)
14027593a:     	movl	$0x1, %ebx
14027593f:     	xorl	%esi, %esi
140275941:     	leaq	0x5937938(%rip), %r15   # 0x145bad280 <.text+0x5bac280>
140275948:     	leaq	-0x30(%rbp), %r14
14027594c:     	xorl	%edi, %edi
14027594e:     	jmp	0x140275953 <.text+0x274953>
140275950:     	incq	%rdi
140275953:     	cmpq	$0x2, %rdi
140275957:     	je	0x140275a5a <.text+0x274a5a>
14027595d:     	movq	%rdi, %rcx
140275960:     	shlq	$0x5, %rcx
140275964:     	movl	0x10(%r13,%rcx), %eax
140275969:     	cmpl	$0x2, %eax
14027596c:     	je	0x140275a5a <.text+0x274a5a>
140275972:     	leaq	(%rcx,%r13), %rdx
140275976:     	movq	0x14(%r13,%rcx), %xmm0
14027597d:     	movdqu	(%rdx), %xmm1
140275981:     	movdqu	%xmm1, -0x58(%rbp)
140275986:     	testb	$0x1, %al
140275988:     	je	0x140275950 <.text+0x274950>
14027598a:     	movq	%xmm0, 0x58(%rbp)
14027598f:     	leaq	-0x58(%rbp), %rax
140275993:     	movq	%rax, -0x30(%rbp)
140275997:     	leaq	-0x2738de(%rip), %rax   # 0x1400020c0 <.text+0x10c0>
14027599e:     	movq	%rax, -0x28(%rbp)
1402759a2:     	leaq	0x58(%rbp), %rax
1402759a6:     	movq	%rax, -0x20(%rbp)
1402759aa:     	movq	%r15, -0x18(%rbp)
1402759ae:     	leaq	0x5c(%rbp), %rax
1402759b2:     	movq	%rax, -0x10(%rbp)
1402759b6:     	movq	%r15, -0x8(%rbp)
1402759ba:     	leaq	-0x48(%rbp), %rcx
1402759be:     	leaq	0x5b4a7b8(%rip), %rdx   # 0x145dc017d
1402759c5:     	movq	%r14, %r8
1402759c8:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1402759cd:     	nop
1402759ce:     	movq	-0x48(%rbp), %rax
1402759d2:     	movq	%rax, 0x80(%rbp)
1402759d9:     	movq	-0x40(%rbp), %rax
1402759dd:     	movq	%rax, 0x78(%rbp)
1402759e1:     	movq	-0x38(%rbp), %r12
1402759e5:     	movq	0x60(%rbp), %rax
1402759e9:     	subq	%rsi, %rax
1402759ec:     	cmpq	%rax, %r12
1402759ef:     	ja	0x140275a31 <.text+0x274a31>
1402759f1:     	testq	%r12, %r12
1402759f4:     	je	0x140275a06 <.text+0x274a06>
1402759f6:     	leaq	(%rbx,%rsi), %rcx
1402759fa:     	movq	0x78(%rbp), %rdx
1402759fe:     	movq	%r12, %r8
140275a01:     	callq	0x145bc977b <.text+0x5bc877b>
140275a06:     	addq	%r12, %rsi
140275a09:     	movq	%rsi, 0x70(%rbp)
140275a0d:     	movq	0x80(%rbp), %rdx
140275a14:     	testq	%rdx, %rdx
140275a17:     	je	0x140275950 <.text+0x274950>
140275a1d:     	movl	$0x1, %r8d
140275a23:     	movq	0x78(%rbp), %rcx
140275a27:     	callq	0x1400021d0 <.text+0x11d0>
140275a2c:     	jmp	0x140275950 <.text+0x274950>
140275a31:     	movq	$0x1, 0x20(%rsp)
140275a3a:     	movl	$0x1, %r9d
140275a40:     	leaq	0x60(%rbp), %rcx
140275a44:     	movq	%rsi, %rdx
140275a47:     	movq	%r12, %r8
140275a4a:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
140275a4f:     	nop
140275a50:     	movq	0x68(%rbp), %rbx
140275a54:     	movq	0x70(%rbp), %rsi
140275a58:     	jmp	0x1402759f6 <.text+0x2749f6>
140275a5a:     	movq	0x68(%rbp), %rdi
140275a5e:     	leaq	0x5b4a70b(%rip), %rcx   # 0x145dc0170
140275a65:     	movl	$0x3, %edx
140275a6a:     	movq	%rdi, %r8
140275a6d:     	movq	%rsi, %r9
140275a70:     	callq	0x1458dc8c0 <.text+0x58db8c0>
140275a75:     	nop
140275a76:     	movq	0x60(%rbp), %rdx
140275a7a:     	testq	%rdx, %rdx
140275a7d:     	je	0x140275a8d <.text+0x274a8d>
140275a7f:     	movl	$0x1, %r8d
140275a85:     	movq	%rdi, %rcx
140275a88:     	callq	0x1400021d0 <.text+0x11d0>
140275a8d:     	movaps	0x90(%rbp), %xmm6
140275a94:     	movaps	0xa0(%rbp), %xmm7
140275a9b:     	movaps	0xb0(%rbp), %xmm8
140275aa3:     	movaps	0xc0(%rbp), %xmm9
140275aab:     	addq	$0x158, %rsp            # imm = 0x158
140275ab2:     	popq	%rbx
140275ab3:     	popq	%rdi
140275ab4:     	popq	%rsi
140275ab5:     	popq	%r12
140275ab7:     	popq	%r13
140275ab9:     	popq	%r14
140275abb:     	popq	%r15
140275abd:     	popq	%rbp
140275abe:     	retq
