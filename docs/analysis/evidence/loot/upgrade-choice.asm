
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454da5f0:     	pushq	%rbp
1454da5f1:     	pushq	%r15
1454da5f3:     	pushq	%r14
1454da5f5:     	pushq	%r13
1454da5f7:     	pushq	%r12
1454da5f9:     	pushq	%rsi
1454da5fa:     	pushq	%rdi
1454da5fb:     	pushq	%rbx
1454da5fc:     	subq	$0x218, %rsp            # imm = 0x218
1454da603:     	leaq	0x80(%rsp), %rbp
1454da60b:     	movaps	%xmm7, 0x180(%rbp)
1454da612:     	movaps	%xmm6, 0x170(%rbp)
1454da619:     	movq	$-0x2, 0x168(%rbp)
1454da624:     	movb	%r8b, 0x136(%rbp)
1454da62b:     	movq	%rcx, %rsi
1454da62e:     	movb	%dl, 0x137(%rbp)
1454da634:     	movzbl	%dl, %ecx
1454da637:     	testb	%cl, %cl
1454da639:     	movq	%rsi, 0x140(%rbp)
1454da640:     	movq	%rcx, -0x50(%rbp)
1454da644:     	je	0x1454da654 <.text+0x54d9654>
1454da646:     	cmpl	$0x1, %ecx
1454da649:     	jne	0x1454da671 <.text+0x54d9671>
1454da64b:     	leaq	-0x10(%rbp), %rcx
1454da64f:     	xorps	%xmm2, %xmm2
1454da652:     	jmp	0x1454da67d <.text+0x54d967d>
1454da654:     	movzbl	0x284(%rsi), %eax
1454da65b:     	addb	$-0x2, %al
1454da65d:     	cmpb	$0x9, %al
1454da65f:     	ja	0x1454da68a <.text+0x54d968a>
1454da661:     	movzbl	%al, %eax
1454da664:     	leaq	0x14d23bd(%rip), %rcx   # 0x1469aca28
1454da66b:     	movq	(%rcx,%rax,8), %rdi
1454da66f:     	jmp	0x1454da691 <.text+0x54d9691>
1454da671:     	leaq	-0x10(%rbp), %rcx
1454da675:     	movss	0x412993(%rip), %xmm2   # 0x1458ed010
1454da67d:     	movq	%rsi, %rdx
1454da680:     	callq	0x1454e1d00 <.text+0x54e0d00>
1454da685:     	jmp	0x1454db131 <.text+0x54da131>
1454da68a:     	leaq	0x123e0d7(%rip), %rdi   # 0x146718768
1454da691:     	movq	$0x0, 0xe0(%rbp)
1454da69c:     	movq	$0x8, 0xe8(%rbp)
1454da6a7:     	movq	$0x0, 0xf0(%rbp)
1454da6b2:     	movq	0x140(%rbp), %rax
1454da6b9:     	movq	0x298(%rax), %r12
1454da6c0:     	movq	0x2a0(%rax), %rsi
1454da6c7:     	movq	%rsi, %r13
1454da6ca:     	shlq	$0x4, %r13
1454da6ce:     	testq	%rsi, %rsi
1454da6d1:     	movq	%rsi, 0xb8(%rbp)
1454da6d8:     	movq	%r13, 0xf8(%rbp)
1454da6df:     	je	0x1454da70d <.text+0x54d970d>
1454da6e1:     	callq	0x140002200 <.text+0x1200>
1454da6e6:     	movl	$0x8, %edx
1454da6eb:     	movq	%r13, %rcx
1454da6ee:     	callq	0x1400021c0 <.text+0x11c0>
1454da6f3:     	testq	%rax, %rax
1454da6f6:     	je	0x1454db4e6 <.text+0x54da4e6>
1454da6fc:     	cmpq	$0x1, %rsi
1454da700:     	movq	%rax, 0x158(%rbp)
1454da707:     	jne	0x1454da71b <.text+0x54d971b>
1454da709:     	xorl	%eax, %eax
1454da70b:     	jmp	0x1454da761 <.text+0x54d9761>
1454da70d:     	movl	$0x8, %eax
1454da712:     	movq	%rax, 0x158(%rbp)
1454da719:     	jmp	0x1454da785 <.text+0x54d9785>
1454da71b:     	movq	%rsi, %rcx
1454da71e:     	andq	$-0x2, %rcx
1454da722:     	movq	%rax, %rdx
1454da725:     	addq	$0x18, %rdx
1454da729:     	xorl	%eax, %eax
1454da72b:     	movq	%r12, %r8
1454da72e:     	nop
1454da730:     	movq	(%r8), %r9
1454da733:     	movups	(%r9), %xmm0
1454da737:     	movups	%xmm0, -0x18(%rdx)
1454da73b:     	movq	0x58(%r8), %r9
1454da73f:     	movups	(%r9), %xmm0
1454da743:     	movups	%xmm0, -0x8(%rdx)
1454da747:     	addq	$0x2, %rax
1454da74b:     	addq	$0xb0, %r8
1454da752:     	addq	$0x20, %rdx
1454da756:     	cmpq	%rax, %rcx
1454da759:     	jne	0x1454da730 <.text+0x54d9730>
1454da75b:     	testb	$0x1, %sil
1454da75f:     	je	0x1454da77b <.text+0x54d977b>
1454da761:     	imulq	$0x58, %rax, %rcx
1454da765:     	movq	(%r12,%rcx), %rcx
1454da769:     	movups	(%rcx), %xmm0
1454da76c:     	shlq	$0x4, %rax
1454da770:     	movq	0x158(%rbp), %rcx
1454da777:     	movups	%xmm0, (%rcx,%rax)
1454da77b:     	cmpq	$0x5, %rsi
1454da77f:     	ja	0x1454daa19 <.text+0x54d9a19>
1454da785:     	movq	0x38(%rdi), %r14
1454da789:     	testq	%r14, %r14
1454da78c:     	je	0x1454daa19 <.text+0x54d9a19>
1454da792:     	movq	0x30(%rdi), %rbx
1454da796:     	shlq	$0x4, %r14
1454da79a:     	addq	%rbx, %r14
1454da79d:     	xorl	%eax, %eax
1454da79f:     	cmpq	$0x3, %rsi
1454da7a3:     	setb	%al
1454da7a6:     	leaq	0x14cfe63(%rip), %rcx   # 0x1469aa610
1454da7ad:     	movss	(%rcx,%rax,4), %xmm6
1454da7b2:     	movl	$0x8, %eax
1454da7b7:     	movq	%rax, 0x138(%rbp)
1454da7be:     	movq	$0x0, 0x148(%rbp)
1454da7c9:     	movq	0x140(%rbp), %rdi
1454da7d0:     	movq	0x158(%rbp), %rax
1454da7d7:     	jmp	0x1454da831 <.text+0x54d9831>
1454da7d9:     	nopl	(%rax)
1454da7e0:     	leaq	(%rsi,%rsi,4), %rax
1454da7e4:     	movq	0x10(%rbp), %rcx
1454da7e8:     	movq	0x138(%rbp), %rdx
1454da7ef:     	movq	%rcx, 0x20(%rdx,%rax,8)
1454da7f4:     	movups	-0x10(%rbp), %xmm0
1454da7f8:     	movups	(%rbp), %xmm1
1454da7fc:     	movups	%xmm1, 0x10(%rdx,%rax,8)
1454da801:     	movups	%xmm0, (%rdx,%rax,8)
1454da805:     	incq	%rsi
1454da808:     	movq	%rsi, 0x148(%rbp)
1454da80f:     	movq	%rsi, 0xf0(%rbp)
1454da816:     	movq	0xf8(%rbp), %r13
1454da81d:     	movq	0x158(%rbp), %rax
1454da824:     	addq	$0x10, %rbx
1454da828:     	cmpq	%r14, %rbx
1454da82b:     	je	0x1454daa25 <.text+0x54d9a25>
1454da831:     	movq	%r14, %r12
1454da834:     	movq	(%rbx), %r14
1454da837:     	movq	0x8(%rbx), %r15
1454da83b:     	cmpq	$0x0, 0xb8(%rbp)
1454da843:     	je	0x1454da880 <.text+0x54d9880>
1454da845:     	xorl	%esi, %esi
1454da847:     	jmp	0x1454da859 <.text+0x54d9859>
1454da849:     	nopl	(%rax)
1454da850:     	addq	$0x10, %rsi
1454da854:     	cmpq	%rsi, %r13
1454da857:     	je	0x1454da880 <.text+0x54d9880>
1454da859:     	cmpq	%r15, 0x8(%rax,%rsi)
1454da85e:     	jne	0x1454da850 <.text+0x54d9850>
1454da860:     	movq	(%rax,%rsi), %rcx
1454da864:     	movq	%r14, %rdx
1454da867:     	movq	%r15, %r8
1454da86a:     	callq	0x145756dd7 <.text+0x5755dd7>
1454da86f:     	testl	%eax, %eax
1454da871:     	movq	0x158(%rbp), %rax
1454da878:     	jne	0x1454da850 <.text+0x54d9850>
1454da87a:     	movq	%r12, %r14
1454da87d:     	jmp	0x1454da824 <.text+0x54d9824>
1454da87f:     	nop
1454da880:     	cmpq	$0xd, %r15
1454da884:     	jne	0x1454da8e0 <.text+0x54d98e0>
1454da886:     	movq	(%r14), %rax
1454da889:     	movabsq	$0x5f666f5f6c6c6163, %rcx # imm = 0x5F666F5F6C6C6163
1454da893:     	xorq	%rcx, %rax
1454da896:     	movq	0x5(%r14), %rcx
1454da89a:     	movabsq	$0x656d616c665f666f, %rdx # imm = 0x656D616C665F666F
1454da8a4:     	xorq	%rdx, %rcx
1454da8a7:     	orq	%rax, %rcx
1454da8aa:     	jne	0x1454da8e0 <.text+0x54d98e0>
1454da8ac:     	movq	0x298(%rdi), %rax
1454da8b3:     	imulq	$0x58, 0x2a0(%rdi), %rcx
1454da8bb:     	xorl	%edx, %edx
1454da8bd:     	nopl	(%rax)
1454da8c0:     	cmpq	%rdx, %rcx
1454da8c3:     	je	0x1454da9a2 <.text+0x54d99a2>
1454da8c9:     	movq	(%rax,%rdx), %r8
1454da8cd:     	addq	$0x58, %rdx
1454da8d1:     	cmpb	$0xa, 0x75(%r8)
1454da8d6:     	jne	0x1454da8c0 <.text+0x54d98c0>
1454da8d8:     	nopl	(%rax,%rax)
1454da8e0:     	movq	0x800(%rdi), %r13
1454da8e7:     	testq	%r13, %r13
1454da8ea:     	je	0x1454da940 <.text+0x54d9940>
1454da8ec:     	movq	0x140(%rbp), %rax
1454da8f3:     	movq	0x7f8(%rax), %rsi
1454da8fa:     	shlq	$0x4, %r13
1454da8fe:     	xorl	%edi, %edi
1454da900:     	jmp	0x1454da919 <.text+0x54d9919>
1454da902:     	nopw	%cs:(%rax,%rax)
1454da910:     	addq	$0x10, %rdi
1454da914:     	cmpq	%rdi, %r13
1454da917:     	je	0x1454da940 <.text+0x54d9940>
1454da919:     	cmpq	%r15, 0x8(%rsi,%rdi)
1454da91e:     	jne	0x1454da910 <.text+0x54d9910>
1454da920:     	movq	(%rsi,%rdi), %rcx
1454da924:     	movq	%r14, %rdx
1454da927:     	movq	%r15, %r8
1454da92a:     	callq	0x145756dd7 <.text+0x5755dd7>
1454da92f:     	testl	%eax, %eax
1454da931:     	jne	0x1454da910 <.text+0x54d9910>
1454da933:     	jmp	0x1454da994 <.text+0x54d9994>
1454da935:     	nopw	%cs:(%rax,%rax)
1454da940:     	movq	0x140(%rbp), %rax
1454da947:     	movq	0x818(%rax), %rax
1454da94e:     	testq	%rax, %rax
1454da951:     	je	0x1454da9c0 <.text+0x54d99c0>
1454da953:     	movq	0x140(%rbp), %rcx
1454da95a:     	movq	0x810(%rcx), %r13
1454da961:     	shlq	$0x3, %rax
1454da965:     	leaq	(%rax,%rax,2), %rsi
1454da969:     	xorl	%edi, %edi
1454da96b:     	jmp	0x1454da979 <.text+0x54d9979>
1454da96d:     	nopl	(%rax)
1454da970:     	addq	$0x18, %rdi
1454da974:     	cmpq	%rdi, %rsi
1454da977:     	je	0x1454da9c0 <.text+0x54d99c0>
1454da979:     	cmpq	%r15, 0x10(%r13,%rdi)
1454da97e:     	jne	0x1454da970 <.text+0x54d9970>
1454da980:     	movq	0x8(%r13,%rdi), %rcx
1454da985:     	movq	%r14, %rdx
1454da988:     	movq	%r15, %r8
1454da98b:     	callq	0x145756dd7 <.text+0x5755dd7>
1454da990:     	testl	%eax, %eax
1454da992:     	jne	0x1454da970 <.text+0x54d9970>
1454da994:     	movq	0x140(%rbp), %rdi
1454da99b:     	movq	0xf8(%rbp), %r13
1454da9a2:     	movq	0x158(%rbp), %rax
1454da9a9:     	movq	%r12, %r14
1454da9ac:     	jmp	0x1454da824 <.text+0x54d9824>
1454da9b1:     	nopw	%cs:(%rax,%rax)
1454da9c0:     	movss	%xmm6, -0x10(%rbp)
1454da9c5:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
1454da9cf:     	movq	%rax, -0x8(%rbp)
1454da9d3:     	movq	%r14, (%rbp)
1454da9d7:     	movq	%r15, 0x8(%rbp)
1454da9db:     	movq	0x148(%rbp), %rsi
1454da9e2:     	cmpq	0xe0(%rbp), %rsi
1454da9e9:     	movq	0x140(%rbp), %rdi
1454da9f0:     	movq	%r12, %r14
1454da9f3:     	jne	0x1454da7e0 <.text+0x54d97e0>
1454da9f9:     	leaq	0xe0(%rbp), %rcx
1454daa00:     	callq	0x145758120 <.text+0x5757120>
1454daa05:     	nop
1454daa06:     	movq	0xe8(%rbp), %rax
1454daa0d:     	movq	%rax, 0x138(%rbp)
1454daa14:     	jmp	0x1454da7e0 <.text+0x54d97e0>
1454daa19:     	movq	%rsi, %rax
1454daa1c:     	movq	0x140(%rbp), %rdi
1454daa23:     	jmp	0x1454daa33 <.text+0x54d9a33>
1454daa25:     	movq	0x298(%rdi), %r12
1454daa2c:     	movq	0x2a0(%rdi), %rax
1454daa33:     	imulq	$0x58, %rax, %rax
1454daa37:     	addq	%r12, %rax
1454daa3a:     	movq	%rax, 0x138(%rbp)
1454daa41:     	leaq	0x458(%rdi), %rax
1454daa48:     	movq	%rax, 0x128(%rbp)
1454daa4f:     	xorl	%r13d, %r13d
1454daa52:     	leaq	0x100(%rbp), %rbx
1454daa59:     	leaq	0xc0(%rbp), %r15
1454daa60:     	jmp	0x1454daaa9 <.text+0x54d9aa9>
1454daa62:     	nopw	%cs:(%rax,%rax)
1454daa70:     	movq	0xe8(%rbp), %rax
1454daa77:     	leaq	(%rsi,%rsi,4), %rcx
1454daa7b:     	movq	0x10(%rbp), %rdx
1454daa7f:     	movq	%rdx, 0x20(%rax,%rcx,8)
1454daa84:     	movups	-0x10(%rbp), %xmm0
1454daa88:     	movups	(%rbp), %xmm1
1454daa8c:     	movups	%xmm1, 0x10(%rax,%rcx,8)
1454daa91:     	movups	%xmm0, (%rax,%rcx,8)
1454daa95:     	incq	%rsi
1454daa98:     	movq	%rsi, 0xf0(%rbp)
1454daa9f:     	movq	%r14, %r12
1454daaa2:     	movq	0x148(%rbp), %r13
1454daaa9:     	cmpq	0x138(%rbp), %r12
1454daab0:     	je	0x1454dad49 <.text+0x54d9d49>
1454daab6:     	movq	$0x4, 0x100(%rbp)
1454daac1:     	movq	0x2a0(%rdi), %rdx
1454daac8:     	cmpq	%rdx, %r13
1454daacb:     	jae	0x1454db48b <.text+0x54da48b>
1454daad1:     	movq	0x298(%rdi), %rax
1454daad8:     	imulq	$0x58, %r13, %rcx
1454daadc:     	leaq	(%rax,%rcx), %rdx
1454daae0:     	movq	(%rax,%rcx), %rax
1454daae4:     	movq	0x30(%rax), %rcx
1454daae8:     	movq	0x38(%rax), %r8
1454daaec:     	addq	%rcx, %r8
1454daaef:     	movq	%rcx, -0x10(%rbp)
1454daaf3:     	movq	%r8, -0x8(%rbp)
1454daaf7:     	movq	%rax, (%rbp)
1454daafb:     	movq	%rdx, 0x8(%rbp)
1454daaff:     	movq	0x128(%rbp), %rax
1454dab06:     	movq	%rax, 0x10(%rbp)
1454dab0a:     	movq	%rdx, 0x18(%rbp)
1454dab0e:     	movq	%rax, 0x20(%rbp)
1454dab12:     	movq	%rbx, 0x28(%rbp)
1454dab16:     	movq	%rdx, 0x30(%rbp)
1454dab1a:     	movq	%rbx, 0x38(%rbp)
1454dab1e:     	movq	0x158(%rbp), %rax
1454dab25:     	movq	%rax, 0x120(%rbp)
1454dab2c:     	movb	$0x1, 0x167(%rbp)
1454dab33:     	movq	%r15, %rcx
1454dab36:     	leaq	-0x10(%rbp), %rdx
1454dab3a:     	callq	0x1455292b0 <.text+0x55282b0>
1454dab3f:     	nop
1454dab40:     	leaq	0x58(%r12), %r14
1454dab45:     	leaq	0x1(%r13), %rsi
1454dab49:     	cmpq	$0x0, 0xd0(%rbp)
1454dab51:     	je	0x1454dad20 <.text+0x54d9d20>
1454dab57:     	movq	%r14, 0xb0(%rbp)
1454dab5e:     	movq	%rsi, 0x148(%rbp)
1454dab65:     	movq	0xc0(%rbp), %rdx
1454dab6c:     	testq	%rdx, %rdx
1454dab6f:     	je	0x1454dab83 <.text+0x54d9b83>
1454dab71:     	movq	0xc8(%rbp), %rcx
1454dab78:     	movl	$0x1, %r8d
1454dab7e:     	callq	0x1400021d0 <.text+0x11d0>
1454dab83:     	movq	0x810(%rdi), %r14
1454dab8a:     	movq	0x818(%rdi), %rsi
1454dab91:     	movq	(%r12), %rax
1454dab95:     	movups	(%rax), %xmm0
1454dab98:     	movups	%xmm0, 0x100(%rbp)
1454dab9f:     	movq	%rbx, 0xc0(%rbp)
1454daba6:     	leaq	-0x54d8aed(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454dabad:     	movq	%rax, 0xc8(%rbp)
1454dabb4:     	movq	0x158(%rbp), %rax
1454dabbb:     	movq	%rax, 0x120(%rbp)
1454dabc2:     	movb	$0x1, 0x167(%rbp)
1454dabc9:     	leaq	-0x10(%rbp), %rcx
1454dabcd:     	leaq	0x1242404(%rip), %rdx   # 0x14671cfd8
1454dabd4:     	movq	%r15, %r8
1454dabd7:     	callq	0x14570bf80 <.text+0x570af80>
1454dabdc:     	nop
1454dabdd:     	testq	%rsi, %rsi
1454dabe0:     	je	0x1454dac70 <.text+0x54d9c70>
1454dabe6:     	shlq	$0x3, %rsi
1454dabea:     	leaq	(%rsi,%rsi,2), %rdi
1454dabee:     	movq	-0x8(%rbp), %rbx
1454dabf2:     	movq	(%rbp), %rsi
1454dabf6:     	xorl	%r15d, %r15d
1454dabf9:     	jmp	0x1454dac09 <.text+0x54d9c09>
1454dabfb:     	nopl	(%rax,%rax)
1454dac00:     	addq	$0x18, %r15
1454dac04:     	cmpq	%r15, %rdi
1454dac07:     	je	0x1454dac70 <.text+0x54d9c70>
1454dac09:     	cmpq	%rsi, 0x10(%r14,%r15)
1454dac0e:     	jne	0x1454dac00 <.text+0x54d9c00>
1454dac10:     	movq	0x8(%r14,%r15), %rcx
1454dac15:     	movq	%rbx, %rdx
1454dac18:     	movq	%rsi, %r8
1454dac1b:     	callq	0x145756dd7 <.text+0x5755dd7>
1454dac20:     	testl	%eax, %eax
1454dac22:     	jne	0x1454dac00 <.text+0x54d9c00>
1454dac24:     	movq	-0x10(%rbp), %rdx
1454dac28:     	testq	%rdx, %rdx
1454dac2b:     	movq	0x140(%rbp), %rdi
1454dac32:     	leaq	0xc0(%rbp), %r15
1454dac39:     	je	0x1454dac49 <.text+0x54d9c49>
1454dac3b:     	movl	$0x1, %r8d
1454dac41:     	movq	%rbx, %rcx
1454dac44:     	callq	0x1400021d0 <.text+0x11d0>
1454dac49:     	movq	0xb0(%rbp), %r12
1454dac50:     	movq	0x148(%rbp), %r13
1454dac57:     	leaq	0x100(%rbp), %rbx
1454dac5e:     	jmp	0x1454daaa9 <.text+0x54d9aa9>
1454dac63:     	nopw	%cs:(%rax,%rax)
1454dac70:     	movq	-0x10(%rbp), %rdx
1454dac74:     	testq	%rdx, %rdx
1454dac77:     	je	0x1454dac88 <.text+0x54d9c88>
1454dac79:     	movq	-0x8(%rbp), %rcx
1454dac7d:     	movl	$0x1, %r8d
1454dac83:     	callq	0x1400021d0 <.text+0x11d0>
1454dac88:     	callq	0x140002200 <.text+0x1200>
1454dac8d:     	movl	$0x1, %ecx
1454dac92:     	movl	$0x1, %edx
1454dac97:     	callq	0x1400021c0 <.text+0x11c0>
1454dac9c:     	testq	%rax, %rax
1454dac9f:     	leaq	0x58(%r12), %r14
1454daca4:     	je	0x1454db461 <.text+0x54da461>
1454dacaa:     	movq	(%r12), %rcx
1454dacae:     	cmpq	$0x0, 0x38(%rcx)
1454dacb3:     	movq	0x140(%rbp), %rdi
1454dacba:     	leaq	0x100(%rbp), %rbx
1454dacc1:     	leaq	0xc0(%rbp), %r15
1454dacc8:     	je	0x1454db4b2 <.text+0x54da4b2>
1454dacce:     	movq	0x30(%rcx), %rcx
1454dacd2:     	movzbl	(%rcx), %ecx
1454dacd5:     	movb	%cl, (%rax)
1454dacd7:     	movl	$0x3fa66666, -0x10(%rbp) # imm = 0x3FA66666
1454dacde:     	movq	$0x1, -0x8(%rbp)
1454dace6:     	movq	%rax, (%rbp)
1454dacea:     	movq	$0x1, 0x8(%rbp)
1454dacf2:     	movq	%r13, 0x10(%rbp)
1454dacf6:     	movq	0xf0(%rbp), %rsi
1454dacfd:     	cmpq	0xe0(%rbp), %rsi
1454dad04:     	jne	0x1454daa70 <.text+0x54d9a70>
1454dad0a:     	leaq	0xe0(%rbp), %rcx
1454dad11:     	callq	0x145758120 <.text+0x5757120>
1454dad16:     	nop
1454dad17:     	jmp	0x1454daa70 <.text+0x54d9a70>
1454dad1c:     	nopl	(%rax)
1454dad20:     	movq	0xc0(%rbp), %rdx
1454dad27:     	testq	%rdx, %rdx
1454dad2a:     	je	0x1454dad3e <.text+0x54d9d3e>
1454dad2c:     	movq	0xc8(%rbp), %rcx
1454dad33:     	movl	$0x1, %r8d
1454dad39:     	callq	0x1400021d0 <.text+0x11d0>
1454dad3e:     	movq	%r14, %r12
1454dad41:     	movq	%rsi, %r13
1454dad44:     	jmp	0x1454daaa9 <.text+0x54d9aa9>
1454dad49:     	movzbl	0x20f(%rdi), %eax
1454dad50:     	notb	%al
1454dad52:     	orb	0x95c(%rdi), %al
1454dad58:     	movzbl	%al, %eax
1454dad5b:     	andl	$0x1, %eax
1454dad5e:     	movl	$0x4, %ecx
1454dad63:     	subq	%rax, %rcx
1454dad66:     	movq	%rcx, 0x148(%rbp)
1454dad6d:     	movq	0xf0(%rbp), %rcx
1454dad74:     	movq	%rcx, -0x20(%rbp)
1454dad78:     	movups	0xe0(%rbp), %xmm0
1454dad7f:     	movaps	%xmm0, -0x30(%rbp)
1454dad83:     	movq	$0x0, 0x98(%rbp)
1454dad8e:     	movq	$0x8, 0xa0(%rbp)
1454dad99:     	movq	$0x0, 0xa8(%rbp)
1454dada4:     	leaq	0x880(%rdi), %rax
1454dadab:     	movq	%rax, -0x58(%rbp)
1454dadaf:     	movq	-0x28(%rbp), %rax
1454dadb3:     	movq	%rax, 0x128(%rbp)
1454dadba:     	leaq	(,%rcx,8), %rax
1454dadc2:     	leaq	(%rax,%rax,4), %r12
1454dadc6:     	movl	$0x8, %edi
1454dadcb:     	xorl	%r13d, %r13d
1454dadce:     	movss	0x41b8a6(%rip), %xmm6   # 0x1458f667c
1454dadd6:     	movss	0x51cfb2(%rip), %xmm7   # 0x1459f7d90
1454dadde:     	movl	%ecx, %r14d
1454dade1:     	movq	%rcx, 0xb0(%rbp)
1454dade8:     	movq	%rcx, %rbx
1454dadeb:     	xorl	%r15d, %r15d
1454dadee:     	jmp	0x1454dae32 <.text+0x54d9e32>
1454dadf0:     	movq	0xa0(%rbp), %rdi
1454dadf7:     	movq	%r15, %rax
1454dadfa:     	shlq	$0x5, %rax
1454dadfe:     	movq	%rbx, (%rdi,%rax)
1454dae02:     	movaps	0x100(%rbp), %xmm0
1454dae09:     	movups	%xmm0, 0x8(%rdi,%rax)
1454dae0e:     	movq	0x110(%rbp), %rcx
1454dae15:     	movq	%rcx, 0x18(%rdi,%rax)
1454dae1a:     	incq	%r15
1454dae1d:     	movq	%r15, 0xa8(%rbp)
1454dae24:     	incq	%r13
1454dae27:     	addb	$0x3, %r14b
1454dae2b:     	addq	$-0x28, %r12
1454dae2f:     	movq	%rsi, %rbx
1454dae32:     	cmpq	0x148(%rbp), %r15
1454dae39:     	movq	%rbx, 0x138(%rbp)
1454dae40:     	jae	0x1454dafcb <.text+0x54d9fcb>
1454dae46:     	testq	%rbx, %rbx
1454dae49:     	je	0x1454dafcb <.text+0x54d9fcb>
1454dae4f:     	movq	%r13, %rax
1454dae52:     	subq	0xb0(%rbp), %rax
1454dae59:     	cmpq	$-0x4, %rax
1454dae5d:     	jbe	0x1454dae70 <.text+0x54d9e70>
1454dae5f:     	xorl	%eax, %eax
1454dae61:     	movaps	%xmm6, %xmm2
1454dae64:     	movq	0x128(%rbp), %rdi
1454dae6b:     	jmp	0x1454daeb8 <.text+0x54d9eb8>
1454dae6d:     	nopl	(%rax)
1454dae70:     	movq	%rbx, %rcx
1454dae73:     	movabsq	$0x3fffffffffffffc, %rax # imm = 0x3FFFFFFFFFFFFFC
1454dae7d:     	andq	%rax, %rcx
1454dae80:     	movq	0x128(%rbp), %rdi
1454dae87:     	movq	%rdi, %rdx
1454dae8a:     	xorl	%eax, %eax
1454dae8c:     	movaps	%xmm6, %xmm2
1454dae8f:     	nop
1454dae90:     	addss	(%rdx), %xmm2
1454dae94:     	addss	0x28(%rdx), %xmm2
1454dae99:     	addss	0x50(%rdx), %xmm2
1454dae9e:     	addss	0x78(%rdx), %xmm2
1454daea3:     	addq	$0x4, %rax
1454daea7:     	addq	$0xa0, %rdx
1454daeae:     	cmpq	%rax, %rcx
1454daeb1:     	jne	0x1454dae90 <.text+0x54d9e90>
1454daeb3:     	testb	$0x3, %bl
1454daeb6:     	je	0x1454daede <.text+0x54d9ede>
1454daeb8:     	movzbl	%r14b, %ecx
1454daebc:     	andl	$0x3, %ecx
1454daebf:     	shll	$0x3, %ecx
1454daec2:     	leaq	(%rcx,%rcx,4), %rcx
1454daec6:     	leaq	(%rax,%rax,4), %rax
1454daeca:     	leaq	(%rdi,%rax,8), %rax
1454daece:     	xorl	%edx, %edx
1454daed0:     	addss	(%rax,%rdx), %xmm2
1454daed5:     	addq	$0x28, %rdx
1454daed9:     	cmpq	%rdx, %rcx
1454daedc:     	jne	0x1454daed0 <.text+0x54d9ed0>
1454daede:     	maxss	%xmm7, %xmm2
1454daee2:     	xorps	%xmm1, %xmm1
1454daee5:     	movq	-0x58(%rbp), %rcx
1454daee9:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454daeee:     	nop
1454daeef:     	leaq	-0x1(%rbx), %rsi
1454daef3:     	xorl	%eax, %eax
1454daef5:     	xorl	%r15d, %r15d
1454daef8:     	nopl	(%rax,%rax)
1454daf00:     	movss	(%rdi,%rax), %xmm1
1454daf05:     	ucomiss	%xmm0, %xmm1
1454daf08:     	ja	0x1454daf1d <.text+0x54d9f1d>
1454daf0a:     	incq	%r15
1454daf0d:     	subss	%xmm1, %xmm0
1454daf11:     	addq	$0x28, %rax
1454daf15:     	cmpq	%rax, %r12
1454daf18:     	jne	0x1454daf00 <.text+0x54d9f00>
1454daf1a:     	movq	%rsi, %r15
1454daf1d:     	cmpq	%rbx, %r15
1454daf20:     	jae	0x1454db504 <.text+0x54da504>
1454daf26:     	movq	%rbx, %r8
1454daf29:     	leaq	(%r15,%r15,4), %rax
1454daf2d:     	leaq	(%rdi,%rax,8), %rcx
1454daf31:     	movq	0x8(%rdi,%rax,8), %rbx
1454daf36:     	movq	0x20(%rdi,%rax,8), %rdx
1454daf3b:     	movq	%rdx, 0xd0(%rbp)
1454daf42:     	movups	0x10(%rdi,%rax,8), %xmm0
1454daf47:     	movaps	%xmm0, 0xc0(%rbp)
1454daf4e:     	leaq	(%rdi,%rax,8), %rdx
1454daf52:     	addq	$0x28, %rdx
1454daf56:     	movq	%r15, %rax
1454daf59:     	notq	%rax
1454daf5c:     	addq	%rax, %r8
1454daf5f:     	shlq	$0x3, %r8
1454daf63:     	leaq	(%r8,%r8,4), %r8
1454daf67:     	callq	0x145756dd1 <.text+0x5755dd1>
1454daf6c:     	movq	%rsi, -0x20(%rbp)
1454daf70:     	cmpq	$-0x1, %rbx
1454daf74:     	je	0x1454db4fd <.text+0x54da4fd>
1454daf7a:     	movq	0xd0(%rbp), %rax
1454daf81:     	movq	%rax, 0x110(%rbp)
1454daf88:     	movaps	0xc0(%rbp), %xmm0
1454daf8f:     	movaps	%xmm0, 0x100(%rbp)
1454daf96:     	movq	%rbx, -0x10(%rbp)
1454daf9a:     	leaq	-0x8(%rbp), %rcx
1454daf9e:     	movq	%rax, 0x10(%rcx)
1454dafa2:     	movups	%xmm0, (%rcx)
1454dafa5:     	movq	0xa8(%rbp), %r15
1454dafac:     	cmpq	0x98(%rbp), %r15
1454dafb3:     	jne	0x1454dadf0 <.text+0x54d9df0>
1454dafb9:     	leaq	0x98(%rbp), %rcx
1454dafc0:     	callq	0x1457580b0 <.text+0x57570b0>
1454dafc5:     	nop
1454dafc6:     	jmp	0x1454dadf0 <.text+0x54d9df0>
1454dafcb:     	movq	0x98(%rbp), %rsi
1454dafd2:     	movq	0x128(%rbp), %rax
1454dafd9:     	leaq	0x8(%rax), %rcx
1454dafdd:     	movq	$0x0, 0x148(%rbp)
1454dafe8:     	nopl	(%rax,%rax)
1454daff0:     	movq	0x148(%rbp), %rax
1454daff7:     	cmpq	%rax, 0x138(%rbp)
1454daffe:     	je	0x1454db019 <.text+0x54da019>
1454db000:     	incq	%rax
1454db003:     	movq	%rax, 0x148(%rbp)
1454db00a:     	leaq	0x28(%rcx), %rbx
1454db00e:     	callq	0x145486b10 <.text+0x5485b10>
1454db013:     	nop
1454db014:     	movq	%rbx, %rcx
1454db017:     	jmp	0x1454daff0 <.text+0x54d9ff0>
1454db019:     	movq	-0x30(%rbp), %rax
1454db01d:     	testq	%rax, %rax
1454db020:     	je	0x1454db03c <.text+0x54da03c>
1454db022:     	shlq	$0x3, %rax
1454db026:     	leaq	(%rax,%rax,4), %rdx
1454db02a:     	movl	$0x8, %r8d
1454db030:     	movq	0x128(%rbp), %rcx
1454db037:     	callq	0x1400021d0 <.text+0x11d0>
1454db03c:     	shlq	$0x5, %r15
1454db040:     	addq	%rdi, %r15
1454db043:     	movq	%rdi, -0x10(%rbp)
1454db047:     	movq	%rdi, -0x8(%rbp)
1454db04b:     	movq	%rsi, (%rbp)
1454db04f:     	movq	%r15, 0x8(%rbp)
1454db053:     	movq	0x140(%rbp), %rsi
1454db05a:     	movq	%rsi, 0x10(%rbp)
1454db05e:     	movq	0x158(%rbp), %rax
1454db065:     	movq	%rax, 0x120(%rbp)
1454db06c:     	movb	$0x0, 0x167(%rbp)
1454db073:     	leaq	0x100(%rbp), %rcx
1454db07a:     	leaq	-0x10(%rbp), %rdx
1454db07e:     	callq	0x145536160 <.text+0x5535160>
1454db083:     	nop
1454db084:     	cmpq	$0x0, 0x110(%rbp)
1454db08c:     	jne	0x1454db0f8 <.text+0x54da0f8>
1454db08e:     	movl	$0x19, 0xc8(%rbp)
1454db098:     	movabsq	$-0x7ffffffffffffffc, %rax # imm = 0x8000000000000004
1454db0a2:     	movq	%rax, 0xc0(%rbp)
1454db0a9:     	leaq	-0x10(%rbp), %rcx
1454db0ad:     	leaq	0xc0(%rbp), %r8
1454db0b4:     	movq	%rsi, %rdx
1454db0b7:     	xorl	%r9d, %r9d
1454db0ba:     	callq	0x1454ded40 <.text+0x54ddd40>
1454db0bf:     	nop
1454db0c0:     	cmpq	$0x0, 0x100(%rbp)
1454db0c8:     	jne	0x1454db0d7 <.text+0x54da0d7>
1454db0ca:     	leaq	0x100(%rbp), %rcx
1454db0d1:     	callq	0x1457a4a40 <.text+0x57a3a40>
1454db0d6:     	nop
1454db0d7:     	movq	0x108(%rbp), %rcx
1454db0de:     	leaq	-0x10(%rbp), %rdx
1454db0e2:     	movl	$0xa0, %r8d
1454db0e8:     	callq	0x145756ddd <.text+0x5755ddd>
1454db0ed:     	movq	$0x1, 0x110(%rbp)
1454db0f8:     	movq	0x110(%rbp), %rax
1454db0ff:     	movq	%rax, (%rbp)
1454db103:     	movups	0x100(%rbp), %xmm0
1454db10a:     	movaps	%xmm0, -0x10(%rbp)
1454db10e:     	cmpq	$0x0, 0xb8(%rbp)
1454db116:     	movq	0xf8(%rbp), %rdx
1454db11d:     	je	0x1454db131 <.text+0x54da131>
1454db11f:     	movl	$0x8, %r8d
1454db125:     	movq	0x158(%rbp), %rcx
1454db12c:     	callq	0x1400021d0 <.text+0x11d0>
1454db131:     	leaq	0x568(%rsi), %rax
1454db138:     	movq	%rax, 0x138(%rbp)
1454db13f:     	movq	0x570(%rsi), %rcx
1454db146:     	movq	0x578(%rsi), %rax
1454db14d:     	movq	%rax, 0x148(%rbp)
1454db154:     	movq	$0x0, 0x158(%rbp)
1454db15f:     	movq	%rcx, 0x128(%rbp)
1454db166:     	nopw	%cs:(%rax,%rax)
1454db170:     	movq	0x158(%rbp), %rax
1454db177:     	cmpq	%rax, 0x148(%rbp)
1454db17e:     	je	0x1454db19c <.text+0x54da19c>
1454db180:     	incq	%rax
1454db183:     	movq	%rax, 0x158(%rbp)
1454db18a:     	leaq	0xa0(%rcx), %rsi
1454db191:     	callq	0x145486bd0 <.text+0x5485bd0>
1454db196:     	nop
1454db197:     	movq	%rsi, %rcx
1454db19a:     	jmp	0x1454db170 <.text+0x54da170>
1454db19c:     	movq	0x138(%rbp), %rsi
1454db1a3:     	movq	(%rsi), %rax
1454db1a6:     	testq	%rax, %rax
1454db1a9:     	movq	0x140(%rbp), %rdi
1454db1b0:     	je	0x1454db1cc <.text+0x54da1cc>
1454db1b2:     	movq	0x570(%rdi), %rcx
1454db1b9:     	shlq	$0x5, %rax
1454db1bd:     	leaq	(%rax,%rax,4), %rdx
1454db1c1:     	movl	$0x8, %r8d
1454db1c7:     	callq	0x1400021d0 <.text+0x11d0>
1454db1cc:     	movq	(%rbp), %rax
1454db1d0:     	movq	%rax, 0x10(%rsi)
1454db1d4:     	movaps	-0x10(%rbp), %xmm0
1454db1d8:     	movups	%xmm0, (%rsi)
1454db1db:     	movq	0x578(%rdi), %rax
1454db1e2:     	testq	%rax, %rax
1454db1e5:     	je	0x1454db390 <.text+0x54da390>
1454db1eb:     	movq	0x570(%rdi), %rbx
1454db1f2:     	shlq	$0x5, %rax
1454db1f6:     	leaq	(%rax,%rax,4), %r13
1454db1fa:     	leaq	0x5b0(%rdi), %rax
1454db201:     	movq	%rax, 0x138(%rbp)
1454db208:     	movabsq	$-0x8000000000000000, %rdx # imm = 0x8000000000000000
1454db212:     	movl	$0x1, %r14d
1454db218:     	xorl	%r15d, %r15d
1454db21b:     	jmp	0x1454db27d <.text+0x54da27d>
1454db21d:     	nopl	(%rax)
1454db220:     	movq	0x140(%rbp), %rdx
1454db227:     	movq	0x5b8(%rdx), %rax
1454db22e:     	movq	%rsi, %rcx
1454db231:     	shlq	$0x5, %rcx
1454db235:     	movq	0x158(%rbp), %r8
1454db23c:     	movq	%r8, (%rax,%rcx)
1454db240:     	movq	0x148(%rbp), %r8
1454db247:     	movq	%r8, 0x8(%rax,%rcx)
1454db24c:     	movq	%r12, 0x10(%rax,%rcx)
1454db251:     	movb	%dil, 0x18(%rax,%rcx)
1454db256:     	movq	%rdx, %rdi
1454db259:     	incq	%rsi
1454db25c:     	movq	%rsi, 0x5c0(%rdx)
1454db263:     	movabsq	$-0x8000000000000000, %rdx # imm = 0x8000000000000000
1454db26d:     	addq	$0xa0, %r15
1454db274:     	cmpq	%r15, %r13
1454db277:     	je	0x1454db390 <.text+0x54da390>
1454db27d:     	movq	0x78(%rbx,%r15), %rcx
1454db282:     	movq	%rcx, %rax
1454db285:     	xorq	%rdx, %rax
1454db288:     	testq	%rcx, %rcx
1454db28b:     	cmovnsq	%r14, %rax
1454db28f:     	cmpq	$0x2, %rax
1454db293:     	je	0x1454db2d0 <.text+0x54da2d0>
1454db295:     	cmpq	$0x3, %rax
1454db299:     	jne	0x1454db26d <.text+0x54da26d>
1454db29b:     	movq	0x80(%rbx,%r15), %rdx
1454db2a3:     	leaq	-0x48(%rbp), %rcx
1454db2a7:     	callq	0x14570c440 <.text+0x570b440>
1454db2ac:     	movq	-0x48(%rbp), %rax
1454db2b0:     	movq	%rax, 0x158(%rbp)
1454db2b7:     	movq	-0x40(%rbp), %rax
1454db2bb:     	movq	%rax, 0x148(%rbp)
1454db2c2:     	movq	-0x38(%rbp), %r12
1454db2c6:     	jmp	0x1454db34a <.text+0x54da34a>
1454db2cb:     	nopl	(%rax,%rax)
1454db2d0:     	movq	0x80(%rbx,%r15), %rax
1454db2d8:     	movq	0x8(%rax), %r12
1454db2dc:     	testq	%r12, %r12
1454db2df:     	js	0x1454db380 <.text+0x54da380>
1454db2e5:     	je	0x1454db31f <.text+0x54da31f>
1454db2e7:     	movq	(%rax), %rsi
1454db2ea:     	callq	0x140002200 <.text+0x1200>
1454db2ef:     	movl	$0x1, %edx
1454db2f4:     	movq	%r12, %rcx
1454db2f7:     	callq	0x1400021c0 <.text+0x11c0>
1454db2fc:     	testq	%rax, %rax
1454db2ff:     	je	0x1454db4cc <.text+0x54da4cc>
1454db305:     	movq	%rax, %rdi
1454db308:     	movq	%rax, %rcx
1454db30b:     	movq	%rsi, %rdx
1454db30e:     	movq	%r12, %r8
1454db311:     	callq	0x145756ddd <.text+0x5755ddd>
1454db316:     	movq	%rdi, 0x128(%rbp)
1454db31d:     	jmp	0x1454db330 <.text+0x54da330>
1454db31f:     	movl	$0x1, %edi
1454db324:     	movl	$0x1, %eax
1454db329:     	movq	%rax, 0x128(%rbp)
1454db330:     	movq	%r12, -0x48(%rbp)
1454db334:     	movq	%rdi, 0x148(%rbp)
1454db33b:     	movq	%rdi, -0x40(%rbp)
1454db33f:     	movq	%r12, -0x38(%rbp)
1454db343:     	movq	%r12, 0x158(%rbp)
1454db34a:     	movzbl	0x98(%rbx,%r15), %edi
1454db353:     	movq	0x140(%rbp), %rax
1454db35a:     	movq	0x5c0(%rax), %rsi
1454db361:     	cmpq	0x5b0(%rax), %rsi
1454db368:     	jne	0x1454db220 <.text+0x54da220>
1454db36e:     	movq	0x138(%rbp), %rcx
1454db375:     	callq	0x1457580b0 <.text+0x57570b0>
1454db37a:     	nop
1454db37b:     	jmp	0x1454db220 <.text+0x54da220>
1454db380:     	xorl	%ecx, %ecx
1454db382:     	movq	0x128(%rbp), %rdx
1454db389:     	callq	0x1458e721b <.text+0x58e621b>
1454db38e:     	ud2
1454db390:     	movzbl	0x137(%rbp), %eax
1454db397:     	movb	%al, 0x95d(%rdi)
1454db39d:     	cmpb	$0x0, 0x136(%rbp)
1454db3a4:     	je	0x1454db3b5 <.text+0x54da3b5>
1454db3a6:     	movb	$0x2, 0x95f(%rdi)
1454db3ad:     	movq	%rdi, %rcx
1454db3b0:     	callq	0x14548e7e0 <.text+0x548d7e0>
1454db3b5:     	leaq	0x14d16bc(%rip), %rax   # 0x1469aca78
1454db3bc:     	movq	-0x50(%rbp), %rcx
1454db3c0:     	movq	(%rax,%rcx,8), %r9
1454db3c4:     	leaq	0x14d16c5(%rip), %rax   # 0x1469aca90
1454db3cb:     	movslq	(%rax,%rcx,4), %r8
1454db3cf:     	addq	%rax, %r8
1454db3d2:     	leaq	-0x10(%rbp), %rcx
1454db3d6:     	movq	%rdi, %rdx
1454db3d9:     	callq	0x1454dc9c0 <.text+0x54db9c0>
1454db3de:     	movq	0x560(%rdi), %rsi
1454db3e5:     	cmpq	0x550(%rdi), %rsi
1454db3ec:     	jne	0x1454db411 <.text+0x54da411>
1454db3ee:     	leaq	0x550(%rdi), %rcx
1454db3f5:     	movq	-0x10(%rbp), %rax
1454db3f9:     	movq	%rax, 0x158(%rbp)
1454db400:     	movq	-0x8(%rbp), %rax
1454db404:     	movq	%rax, 0x148(%rbp)
1454db40b:     	callq	0x145757f60 <.text+0x5756f60>
1454db410:     	nop
1454db411:     	movq	0x558(%rdi), %rax
1454db418:     	leaq	(%rsi,%rsi,2), %rcx
1454db41c:     	movq	(%rbp), %rdx
1454db420:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454db425:     	movups	-0x10(%rbp), %xmm0
1454db429:     	movups	%xmm0, (%rax,%rcx,8)
1454db42d:     	incq	%rsi
1454db430:     	movq	%rsi, 0x560(%rdi)
1454db437:     	movq	%rdi, %rcx
1454db43a:     	callq	0x1454dc2a0 <.text+0x54db2a0>
1454db43f:     	movaps	0x170(%rbp), %xmm6
1454db446:     	movaps	0x180(%rbp), %xmm7
1454db44d:     	addq	$0x218, %rsp            # imm = 0x218
1454db454:     	popq	%rbx
1454db455:     	popq	%rdi
1454db456:     	popq	%rsi
1454db457:     	popq	%r12
1454db459:     	popq	%r13
1454db45b:     	popq	%r14
1454db45d:     	popq	%r15
1454db45f:     	popq	%rbp
1454db460:     	retq
1454db461:     	movq	0x158(%rbp), %rax
1454db468:     	movq	%rax, 0x120(%rbp)
1454db46f:     	movb	$0x1, 0x167(%rbp)
1454db476:     	movl	$0x1, %ecx
1454db47b:     	movl	$0x1, %edx
1454db480:     	callq	0x1458e7201 <.text+0x58e6201>
1454db485:     	nop
1454db486:     	jmp	0x1454db51b <.text+0x54da51b>
1454db48b:     	movq	0x158(%rbp), %rax
1454db492:     	movq	%rax, 0x120(%rbp)
1454db499:     	movb	$0x1, 0x167(%rbp)
1454db4a0:     	leaq	0x14d0e71(%rip), %r8    # 0x1469ac318
1454db4a7:     	movq	%r13, %rcx
1454db4aa:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454db4af:     	nop
1454db4b0:     	jmp	0x1454db51b <.text+0x54da51b>
1454db4b2:     	movq	%rax, 0x148(%rbp)
1454db4b9:     	leaq	0x14d1000(%rip), %r8    # 0x1469ac4c0
1454db4c0:     	xorl	%ecx, %ecx
1454db4c2:     	xorl	%edx, %edx
1454db4c4:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454db4c9:     	nop
1454db4ca:     	jmp	0x1454db51b <.text+0x54da51b>
1454db4cc:     	movq	%r12, 0x128(%rbp)
1454db4d3:     	movl	$0x1, %ecx
1454db4d8:     	movq	0x128(%rbp), %rdx
1454db4df:     	callq	0x1458e721b <.text+0x58e621b>
1454db4e4:     	ud2
1454db4e6:     	movb	$0x1, 0x157(%rbp)
1454db4ed:     	movl	$0x8, %ecx
1454db4f2:     	movq	%r13, %rdx
1454db4f5:     	callq	0x1458e721b <.text+0x58e621b>
1454db4fa:     	nop
1454db4fb:     	jmp	0x1454db51b <.text+0x54da51b>
1454db4fd:     	movq	%rsi, 0x138(%rbp)
1454db504:     	leaq	0x14cf165(%rip), %r8    # 0x1469aa670
1454db50b:     	movq	%r15, %rcx
1454db50e:     	movq	0x138(%rbp), %rdx
1454db515:     	callq	0x1458e72eb <.text+0x58e62eb>
1454db51a:     	nop
1454db51b:     	ud2
