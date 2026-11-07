
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140204480:     	pushq	%rbp
140204481:     	pushq	%rsi
140204482:     	pushq	%rdi
140204483:     	pushq	%rbx
140204484:     	subq	$0xc8, %rsp
14020448b:     	leaq	0x80(%rsp), %rbp
140204493:     	movaps	%xmm6, 0x30(%rbp)
140204497:     	movq	$-0x2, 0x28(%rbp)
14020449f:     	movq	%rcx, %rsi
1402044a2:     	movq	0x18(%rcx), %rcx
1402044a6:     	cmpq	$0x0, 0x30(%rcx)
1402044ab:     	je	0x14020454b <.text+0x20354b>
1402044b1:     	movabsq	$0x2fd898c0d3361751, %rdx # imm = 0x2FD898C0D3361751
1402044bb:     	movq	0x18(%rcx), %rax
1402044bf:     	movq	0x20(%rcx), %r8
1402044c3:     	xorl	%r9d, %r9d
1402044c6:     	movdqa	0x570eeb2(%rip), %xmm0  # 0x145913380
1402044ce:     	pcmpeqd	%xmm1, %xmm1
1402044d2:     	movdqa	0x5746b56(%rip), %xmm2  # 0x14594b030
1402044da:     	andq	%r8, %rdx
1402044dd:     	movdqu	(%rax,%rdx), %xmm3
1402044e2:     	movdqa	%xmm3, %xmm4
1402044e6:     	pcmpeqb	%xmm0, %xmm4
1402044ea:     	pmovmskb	%xmm4, %r10d
1402044ef:     	testl	%r10d, %r10d
1402044f2:     	je	0x140204530 <.text+0x203530>
1402044f4:     	tzcntl	%r10d, %r11d
1402044f9:     	addq	%rdx, %r11
1402044fc:     	andq	%r8, %r11
1402044ff:     	negq	%r11
140204502:     	leaq	(%r11,%r11,2), %r11
140204506:     	movdqu	-0x18(%rax,%r11,8), %xmm4
14020450d:     	pcmpeqb	%xmm2, %xmm4
140204511:     	pmovmskb	%xmm4, %edi
140204515:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
14020451b:     	je	0x140204602 <.text+0x203602>
140204521:     	leal	-0x1(%r10), %r11d
140204525:     	andw	%r10w, %r11w
140204529:     	movl	%r11d, %r10d
14020452c:     	jne	0x1402044f4 <.text+0x2034f4>
14020452e:     	nop
140204530:     	pcmpeqb	%xmm1, %xmm3
140204534:     	pmovmskb	%xmm3, %r10d
140204539:     	testl	%r10d, %r10d
14020453c:     	jne	0x14020454b <.text+0x20354b>
14020453e:     	addq	%r9, %rdx
140204541:     	addq	$0x10, %rdx
140204545:     	addq	$0x10, %r9
140204549:     	jmp	0x1402044da <.text+0x2034da>
14020454b:     	movzbl	0x60(%rcx), %eax
14020454f:     	movq	0x80(%rcx), %rax
140204556:     	movq	0x88(%rcx), %rdx
14020455d:     	movabsq	$0x2fd898c0d3361751, %r8 # imm = 0x2FD898C0D3361751
140204567:     	xorl	%r9d, %r9d
14020456a:     	movdqa	0x570ee0e(%rip), %xmm0  # 0x145913380
140204572:     	pcmpeqd	%xmm1, %xmm1
140204576:     	movdqa	0x5746ab2(%rip), %xmm2  # 0x14594b030
14020457e:     	andq	%rdx, %r8
140204581:     	movdqu	(%rax,%r8), %xmm3
140204587:     	movdqa	%xmm3, %xmm4
14020458b:     	pcmpeqb	%xmm0, %xmm4
14020458f:     	pmovmskb	%xmm4, %edi
140204593:     	testl	%edi, %edi
140204595:     	je	0x1402045e0 <.text+0x2035e0>
140204597:     	tzcntl	%edi, %r11d
14020459c:     	addq	%r8, %r11
14020459f:     	andq	%rdx, %r11
1402045a2:     	movq	%r11, %rbx
1402045a5:     	shlq	$0x7, %rbx
1402045a9:     	movq	%rax, %r10
1402045ac:     	subq	%rbx, %r10
1402045af:     	movdqu	-0x80(%r10), %xmm4
1402045b5:     	pcmpeqb	%xmm2, %xmm4
1402045b9:     	pmovmskb	%xmm4, %ebx
1402045bd:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
1402045c3:     	je	0x14020461f <.text+0x20361f>
1402045c5:     	leal	-0x1(%rdi), %r10d
1402045c9:     	andw	%di, %r10w
1402045cd:     	movl	%r10d, %edi
1402045d0:     	jne	0x140204597 <.text+0x203597>
1402045d2:     	nopw	%cs:(%rax,%rax)
1402045e0:     	pcmpeqb	%xmm1, %xmm3
1402045e4:     	pmovmskb	%xmm3, %r10d
1402045e9:     	testl	%r10d, %r10d
1402045ec:     	jne	0x140204691 <.text+0x203691>
1402045f2:     	addq	%r9, %r8
1402045f5:     	addq	$0x10, %r8
1402045f9:     	addq	$0x10, %r9
1402045fd:     	jmp	0x14020457e <.text+0x20357e>
140204602:     	leaq	(%rax,%r11,8), %rax
140204606:     	movq	-0x8(%rax), %rdi
14020460a:     	movq	0x8(%rsi), %rdx
14020460e:     	movq	0x10(%rsi), %r8
140204612:     	movq	%rdi, %r9
140204615:     	callq	0x144ea41f0 <.text+0x4ea31f0>
14020461a:     	jmp	0x140204863 <.text+0x203863>
14020461f:     	leaq	-0x10(%r11), %r8
140204623:     	andq	%rdx, %r8
140204626:     	movdqu	(%rax,%r8), %xmm0
14020462c:     	pcmpeqd	%xmm1, %xmm1
140204630:     	pcmpeqb	%xmm1, %xmm0
140204634:     	pmovmskb	%xmm0, %edx
140204638:     	movdqu	(%rax,%r11), %xmm0
14020463e:     	pcmpeqb	%xmm1, %xmm0
140204642:     	pmovmskb	%xmm0, %r9d
140204647:     	movw	$0x1f, %di
14020464b:     	bsrw	%dx, %di
14020464f:     	xorl	$0xf, %edi
140204652:     	orl	$0x10000, %r9d          # imm = 0x10000
140204659:     	tzcntl	%r9d, %r9d
14020465e:     	addl	%edi, %r9d
140204661:     	movb	$-0x80, %dl
140204663:     	cmpw	$0xf, %r9w
140204668:     	ja	0x140204673 <.text+0x203673>
14020466a:     	incq	0x90(%rcx)
140204671:     	movb	$-0x1, %dl
140204673:     	movb	%dl, (%rax,%r11)
140204677:     	movb	%dl, 0x10(%rax,%r8)
14020467c:     	decq	0x98(%rcx)
140204683:     	movq	-0x70(%r10), %rax
140204687:     	cmpq	$0x2, %rax
14020468b:     	jne	0x14020480a <.text+0x20380a>
140204691:     	movq	0x20(%rsi), %rax
140204695:     	movq	(%rax), %rdi
140204698:     	leaq	0x1(%rdi), %rdx
14020469c:     	movq	%rdx, (%rax)
14020469f:     	movw	$0x100, (%rbp)          # imm = 0x100
1402046a5:     	movq	$0x1, -0x50(%rbp)
1402046ad:     	movups	0x574cffc(%rip), %xmm0  # 0x1459516b0
1402046b4:     	movups	%xmm0, -0x48(%rbp)
1402046b8:     	movq	$0x1, -0x28(%rbp)
1402046c0:     	movq	$0x1, -0x20(%rbp)
1402046c8:     	movq	$0x0, -0x8(%rbp)
1402046d0:     	movb	$0x1, 0x2(%rbp)
1402046d4:     	movq	$0x2, -0x38(%rbp)
1402046dc:     	leaq	-0x15c93(%rip), %rax    # 0x1401eea50 <.text+0x1eda50>
1402046e3:     	movq	%rax, -0x30(%rbp)
1402046e7:     	movb	$0x2, -0x18(%rbp)
1402046eb:     	leaq	-0x50(%rbp), %r8
1402046ef:     	movq	%rcx, %rbx
1402046f2:     	movq	%rdi, %rdx
1402046f5:     	callq	0x140044810 <.text+0x43810>
1402046fa:     	addq	$0x18, %rbx
1402046fe:     	leaq	0x5747323(%rip), %rdx   # 0x14594ba28
140204705:     	movq	%rbx, %rcx
140204708:     	movq	%rdi, %r8
14020470b:     	callq	0x14000ecd0 <.text+0xdcd0>
140204710:     	movq	0x10(%rsi), %rbx
140204714:     	cmpq	(%rsi), %rbx
140204717:     	jne	0x140204721 <.text+0x203721>
140204719:     	movq	%rsi, %rcx
14020471c:     	callq	0x145774550 <.text+0x5773550>
140204721:     	movq	0x8(%rsi), %rax
140204725:     	movq	%rdi, (%rax,%rbx,8)
140204729:     	incq	%rbx
14020472c:     	movq	%rbx, 0x10(%rsi)
140204730:     	movq	$0x0, -0x50(%rbp)
140204738:     	movq	$0x8, -0x48(%rbp)
140204740:     	movq	$0x0, -0x40(%rbp)
140204748:     	movups	0x5747c41(%rip), %xmm0  # 0x14594c390
14020474f:     	movups	%xmm0, -0x38(%rbp)
140204753:     	movups	0x5747c46(%rip), %xmm1  # 0x14594c3a0
14020475a:     	movups	%xmm1, -0x28(%rbp)
14020475e:     	movq	$0x0, -0x18(%rbp)
140204766:     	movq	$0x8, -0x10(%rbp)
14020476e:     	movq	$0x0, -0x8(%rbp)
140204776:     	movups	%xmm0, (%rbp)
14020477a:     	movups	%xmm1, 0x10(%rbp)
14020477e:     	movq	0x18(%rsi), %rcx
140204782:     	movb	$0x1, 0x27(%rbp)
140204786:     	leaq	-0x50(%rbp), %r8
14020478a:     	movq	%rdi, %rdx
14020478d:     	callq	0x144e52cb0 <.text+0x4e51cb0>
140204792:     	nop
140204793:     	movq	0x10(%rsi), %rax
140204797:     	testq	%rax, %rax
14020479a:     	je	0x1402047a3 <.text+0x2037a3>
14020479c:     	decq	%rax
14020479f:     	movq	%rax, 0x10(%rsi)
1402047a3:     	movq	0x18(%rsi), %rax
1402047a7:     	movq	0x8(%rax), %rax
1402047ab:     	imulq	$0x130, %rdi, %rcx      # imm = 0x130
1402047b2:     	addq	%rax, %rcx
1402047b5:     	addq	$0x58, %rcx
1402047b9:     	movq	%rcx, -0x58(%rbp)
1402047bd:     	callq	0x1400091b0 <.text+0x81b0>
1402047c2:     	nop
1402047c3:     	movdqu	-0x50(%rbp), %xmm0
1402047c8:     	movdqu	-0x40(%rbp), %xmm1
1402047cd:     	movdqu	-0x30(%rbp), %xmm2
1402047d2:     	movdqu	-0x20(%rbp), %xmm3
1402047d7:     	movdqu	-0x10(%rbp), %xmm4
1402047dc:     	movups	(%rbp), %xmm5
1402047e0:     	movups	0x10(%rbp), %xmm6
1402047e4:     	movq	-0x58(%rbp), %rax
1402047e8:     	movups	%xmm6, 0x60(%rax)
1402047ec:     	movups	%xmm5, 0x50(%rax)
1402047f0:     	movdqu	%xmm4, 0x40(%rax)
1402047f5:     	movdqu	%xmm3, 0x30(%rax)
1402047fa:     	movdqu	%xmm2, 0x20(%rax)
1402047ff:     	movdqu	%xmm1, 0x10(%rax)
140204804:     	movdqu	%xmm0, (%rax)
140204808:     	jmp	0x140204863 <.text+0x203863>
14020480a:     	movq	-0x8(%r10), %rcx
14020480e:     	movq	%rcx, 0x18(%rbp)
140204812:     	movups	-0x18(%r10), %xmm0
140204817:     	movups	%xmm0, 0x8(%rbp)
14020481b:     	movups	-0x28(%r10), %xmm0
140204820:     	movups	%xmm0, -0x8(%rbp)
140204824:     	movdqu	-0x68(%r10), %xmm0
14020482a:     	movdqu	-0x58(%r10), %xmm1
140204830:     	movdqu	-0x48(%r10), %xmm2
140204836:     	movdqu	-0x38(%r10), %xmm3
14020483c:     	movdqu	%xmm3, -0x18(%rbp)
140204841:     	movdqu	%xmm2, -0x28(%rbp)
140204846:     	movdqu	%xmm1, -0x38(%rbp)
14020484b:     	movdqu	%xmm0, -0x48(%rbp)
140204850:     	movq	%rax, -0x50(%rbp)
140204854:     	leaq	-0x50(%rbp), %rcx
140204858:     	movq	%rsi, %rdx
14020485b:     	callq	0x144e17460 <.text+0x4e16460>
140204860:     	movq	%rax, %rdi
140204863:     	movl	$0x1, %eax
140204868:     	movq	%rdi, %rdx
14020486b:     	movaps	0x30(%rbp), %xmm6
14020486f:     	addq	$0xc8, %rsp
140204876:     	popq	%rbx
140204877:     	popq	%rdi
140204878:     	popq	%rsi
140204879:     	popq	%rbp
14020487a:     	retq
