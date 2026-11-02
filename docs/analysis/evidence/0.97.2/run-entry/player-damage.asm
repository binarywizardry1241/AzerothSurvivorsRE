
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14548f420:     	pushq	%rbp
14548f421:     	pushq	%r15
14548f423:     	pushq	%r14
14548f425:     	pushq	%r13
14548f427:     	pushq	%r12
14548f429:     	pushq	%rsi
14548f42a:     	pushq	%rdi
14548f42b:     	pushq	%rbx
14548f42c:     	subq	$0x188, %rsp            # imm = 0x188
14548f433:     	leaq	0x80(%rsp), %rbp
14548f43b:     	movaps	%xmm10, 0xf0(%rbp)
14548f443:     	movapd	%xmm9, 0xe0(%rbp)
14548f44c:     	movaps	%xmm8, 0xd0(%rbp)
14548f454:     	movaps	%xmm7, 0xc0(%rbp)
14548f45b:     	movaps	%xmm6, 0xb0(%rbp)
14548f462:     	movq	$-0x2, 0xa8(%rbp)
14548f46d:     	cmpb	$0x1, 0x95f(%rcx)
14548f474:     	jne	0x14548ffd6 <.text+0x548efd6>
14548f47a:     	movq	%rcx, %r12
14548f47d:     	cmpb	$0x0, 0x958(%rcx)
14548f484:     	jne	0x14548ffd6 <.text+0x548efd6>
14548f48a:     	movq	%r8, %r13
14548f48d:     	movaps	%xmm1, %xmm6
14548f490:     	movss	0x8e4(%r12), %xmm8
14548f49a:     	movss	%xmm8, -0x1c(%rbp)
14548f4a0:     	leaq	0x2f0(%r12), %r15
14548f4a8:     	movq	0x2f8(%r12), %rax
14548f4b0:     	movq	0x300(%r12), %rcx
14548f4b8:     	leaq	(,%rcx,8), %rdx
14548f4c0:     	leaq	(%rdx,%rdx,2), %rdx
14548f4c4:     	movq	%rax, %r8
14548f4c7:     	nopw	(%rax,%rax)
14548f4d0:     	testq	%rdx, %rdx
14548f4d3:     	je	0x14548f4f7 <.text+0x548e4f7>
14548f4d5:     	movq	%r8, %r10
14548f4d8:     	addq	$0x18, %r8
14548f4dc:     	movss	0x10(%r10), %xmm0
14548f4e2:     	addq	$-0x18, %rdx
14548f4e6:     	ucomiss	%xmm8, %xmm0
14548f4ea:     	jbe	0x14548f4d0 <.text+0x548e4d0>
14548f4ec:     	cmpl	$0xb, (%r10)
14548f4f0:     	jne	0x14548f4d0 <.text+0x548e4d0>
14548f4f2:     	jmp	0x14548ffd6 <.text+0x548efd6>
14548f4f7:     	movss	0x45bf81(%rip), %xmm7   # 0x1458eb480
14548f4ff:     	subss	0x478(%r12), %xmm7
14548f509:     	mulss	%xmm6, %xmm7
14548f50d:     	movss	0x404(%r12), %xmm9
14548f517:     	xorps	%xmm0, %xmm0
14548f51a:     	ucomiss	%xmm0, %xmm9
14548f51e:     	jbe	0x14548f735 <.text+0x548e735>
14548f524:     	movaps	%xmm7, %xmm1
14548f527:     	minss	%xmm9, %xmm1
14548f52c:     	movaps	%xmm1, %xmm10
14548f530:     	cmpunordss	%xmm1, %xmm10
14548f536:     	movaps	%xmm10, %xmm2
14548f53a:     	andnps	%xmm1, %xmm2
14548f53d:     	andps	%xmm7, %xmm10
14548f541:     	orps	%xmm2, %xmm10
14548f545:     	movaps	%xmm9, %xmm1
14548f549:     	subss	%xmm10, %xmm1
14548f54e:     	movss	%xmm1, 0x404(%r12)
14548f558:     	movl	0x3d8(%r12), %edx
14548f560:     	movss	0x3dc(%r12), %xmm2
14548f56a:     	testl	%edx, %edx
14548f56c:     	setne	%r11b
14548f570:     	xorl	%r10d, %r10d
14548f573:     	ucomiss	%xmm2, %xmm10
14548f577:     	setae	%r8b
14548f57b:     	cmovbl	%edx, %r10d
14548f57f:     	xorps	%xmm3, %xmm3
14548f582:     	andb	%r11b, %r8b
14548f585:     	jne	0x14548f58f <.text+0x548e58f>
14548f587:     	subss	%xmm10, %xmm2
14548f58c:     	movaps	%xmm2, %xmm3
14548f58f:     	subss	%xmm10, %xmm7
14548f594:     	movl	%r10d, 0x3d8(%r12)
14548f59c:     	movss	%xmm3, 0x3dc(%r12)
14548f5a6:     	ucomiss	%xmm1, %xmm0
14548f5a9:     	jae	0x14548f5eb <.text+0x548e5eb>
14548f5ab:     	testb	%r8b, %r8b
14548f5ae:     	je	0x14548f6ec <.text+0x548e6ec>
14548f5b4:     	movl	%r9d, %r14d
14548f5b7:     	testq	%rcx, %rcx
14548f5ba:     	je	0x14548f629 <.text+0x548e629>
14548f5bc:     	movq	%rcx, %r8
14548f5bf:     	negq	%r8
14548f5c2:     	xorl	%r9d, %r9d
14548f5c5:     	movq	%rax, %r10
14548f5c8:     	nopl	(%rax,%rax)
14548f5d0:     	cmpl	%edx, 0xc(%r10)
14548f5d4:     	je	0x1454907c3 <.text+0x548f7c3>
14548f5da:     	incq	%r9
14548f5dd:     	addq	$0x18, %r10
14548f5e1:     	movq	%r8, %r11
14548f5e4:     	addq	%r9, %r11
14548f5e7:     	jne	0x14548f5d0 <.text+0x548e5d0>
14548f5e9:     	jmp	0x14548f629 <.text+0x548e629>
14548f5eb:     	movl	%r9d, %r14d
14548f5ee:     	movq	$0x0, 0x3d8(%r12)
14548f5fa:     	testq	%rcx, %rcx
14548f5fd:     	je	0x14548f629 <.text+0x548e629>
14548f5ff:     	movq	%rcx, %r8
14548f602:     	negq	%r8
14548f605:     	xorl	%edx, %edx
14548f607:     	movq	%rax, %r9
14548f60a:     	nopw	(%rax,%rax)
14548f610:     	cmpl	$0x7, (%r9)
14548f614:     	je	0x145490774 <.text+0x548f774>
14548f61a:     	incq	%rdx
14548f61d:     	addq	$0x18, %r9
14548f621:     	movq	%r8, %r10
14548f624:     	addq	%rdx, %r10
14548f627:     	jne	0x14548f610 <.text+0x548e610>
14548f629:     	movq	%r12, %rcx
14548f62c:     	callq	0x14548d2b0 <.text+0x548c2b0>
14548f631:     	movss	0xf8(%r12), %xmm1
14548f63b:     	addss	%xmm10, %xmm1
14548f640:     	movss	0xfc(%r12), %xmm0
14548f64a:     	movaps	%xmm0, %xmm2
14548f64d:     	maxss	%xmm9, %xmm2
14548f652:     	movaps	%xmm2, %xmm3
14548f655:     	cmpunordss	%xmm2, %xmm3
14548f65a:     	movaps	%xmm3, %xmm4
14548f65d:     	andnps	%xmm2, %xmm4
14548f660:     	andps	%xmm0, %xmm3
14548f663:     	orps	%xmm4, %xmm3
14548f666:     	movq	$0x0, 0xf8(%r12)
14548f672:     	movaps	%xmm1, %xmm2
14548f675:     	minss	%xmm3, %xmm2
14548f679:     	movaps	%xmm2, %xmm0
14548f67c:     	cmpunordss	%xmm2, %xmm0
14548f681:     	movaps	%xmm0, %xmm3
14548f684:     	andnps	%xmm2, %xmm3
14548f687:     	andps	%xmm1, %xmm0
14548f68a:     	orps	%xmm3, %xmm0
14548f68d:     	xorps	%xmm1, %xmm1
14548f690:     	ucomiss	%xmm0, %xmm1
14548f693:     	jae	0x14548f6e7 <.text+0x548e6e7>
14548f695:     	cmpq	$0x0, 0x700(%r12)
14548f69e:     	je	0x14548f6e7 <.text+0x548e6e7>
14548f6a0:     	movl	0x3f0(%r12), %eax
14548f6a8:     	movl	%eax, 0x4c(%rbp)
14548f6ab:     	movq	0x3e8(%r12), %rax
14548f6b3:     	movq	%rax, 0x44(%rbp)
14548f6b7:     	movl	$0x0, 0x40(%rbp)
14548f6be:     	movq	$0x0, 0x38(%rbp)
14548f6c6:     	movss	%xmm0, 0x50(%rbp)
14548f6cb:     	movl	$0x600, 0x54(%rbp)      # imm = 0x600
14548f6d2:     	movw	$0x0, 0x58(%rbp)
14548f6d8:     	leaq	0x38(%rbp), %rdx
14548f6dc:     	movq	%r12, %rcx
14548f6df:     	xorl	%r8d, %r8d
14548f6e2:     	callq	0x1454b9930 <.text+0x54b8930>
14548f6e7:     	movl	%r14d, %r9d
14548f6ea:     	jmp	0x14548f735 <.text+0x548e735>
14548f6ec:     	movss	0xf8(%r12), %xmm0
14548f6f6:     	addss	%xmm10, %xmm0
14548f6fb:     	movss	%xmm0, 0xf8(%r12)
14548f705:     	movss	0xfc(%r12), %xmm0
14548f70f:     	movaps	%xmm0, %xmm1
14548f712:     	maxss	%xmm9, %xmm1
14548f717:     	movaps	%xmm1, %xmm2
14548f71a:     	cmpunordss	%xmm1, %xmm2
14548f71f:     	movaps	%xmm2, %xmm3
14548f722:     	andnps	%xmm1, %xmm3
14548f725:     	andps	%xmm0, %xmm2
14548f728:     	orps	%xmm3, %xmm2
14548f72b:     	movss	%xmm2, 0xfc(%r12)
14548f735:     	movss	0x400(%r12), %xmm0
14548f73f:     	subss	%xmm7, %xmm0
14548f743:     	movss	%xmm0, 0x400(%r12)
14548f74d:     	movss	%xmm8, 0x4bc(%r12)
14548f757:     	xorps	%xmm9, %xmm9
14548f75b:     	cvtss2sd	%xmm7, %xmm9
14548f760:     	movsd	0x618(%r12), %xmm0
14548f76a:     	addsd	%xmm9, %xmm0
14548f76f:     	movsd	%xmm0, 0x618(%r12)
14548f779:     	imulq	$0x160, 0x4d0(%r12), %rdx # imm = 0x160
14548f785:     	movq	0x4c8(%r12), %rax
14548f78d:     	xorl	%ecx, %ecx
14548f78f:     	leaq	0x151b796(%rip), %r14   # 0x1469aaf2c
14548f796:     	movq	%rax, %r8
14548f799:     	nopl	(%rax)
14548f7a0:     	cmpq	%rcx, %rdx
14548f7a3:     	je	0x14548f7e3 <.text+0x548e7e3>
14548f7a5:     	addq	$0x160, %rcx            # imm = 0x160
14548f7ac:     	cmpq	%r13, 0x88(%r8)
14548f7b3:     	leaq	0x160(%r8), %r8
14548f7ba:     	jne	0x14548f7a0 <.text+0x548e7a0>
14548f7bc:     	cmpq	$-0x1, -0x148(%rax,%rcx)
14548f7c5:     	je	0x14548f7ea <.text+0x548e7ea>
14548f7c7:     	leaq	0x151b76c(%rip), %rax   # 0x1469aaf3a
14548f7ce:     	leaq	0x151b75b(%rip), %r14   # 0x1469aaf30
14548f7d5:     	testb	%r9b, %r9b
14548f7d8:     	cmovneq	%rax, %r14
14548f7dc:     	movl	$0xa, %edi
14548f7e1:     	jmp	0x14548f81c <.text+0x548e81c>
14548f7e3:     	movl	$0x4, %edi
14548f7e8:     	jmp	0x14548f81c <.text+0x548e81c>
14548f7ea:     	movzbl	-0x8(%rax,%rcx), %eax
14548f7ef:     	leaq	0x151b757(%rip), %rcx   # 0x1469aaf4d
14548f7f6:     	leaq	0x151b747(%rip), %rdx   # 0x1469aaf44
14548f7fd:     	testb	%r9b, %r9b
14548f800:     	cmovneq	%rcx, %rdx
14548f804:     	leaq	0x151b13b(%rip), %r14   # 0x1469aa946
14548f80b:     	testl	%eax, %eax
14548f80d:     	cmoveq	%rdx, %r14
14548f811:     	xorl	$0x1, %eax
14548f814:     	leaq	0x5(,%rax,4), %rdi
14548f81c:     	leaq	0x620(%r12), %rax
14548f824:     	movq	0x620(%r12), %rcx
14548f82c:     	testq	%rcx, %rcx
14548f82f:     	movb	%r9b, 0x9f(%rbp)
14548f836:     	je	0x14548f929 <.text+0x548e929>
14548f83c:     	movq	%rax, 0x90(%rbp)
14548f843:     	movq	%r13, -0x28(%rbp)
14548f847:     	movq	%r15, -0x30(%rbp)
14548f84b:     	movq	%r12, -0x38(%rbp)
14548f84f:     	movq	0x628(%r12), %r13
14548f857:     	movzwl	0x112(%rcx), %ebx
14548f85e:     	movq	%rbx, -0x40(%rbp)
14548f862:     	shll	$0x4, %ebx
14548f865:     	movq	$-0x1, %r15
14548f86c:     	movq	%rcx, 0xa0(%rbp)
14548f873:     	nopw	%cs:(%rax,%rax)
14548f880:     	testq	%rbx, %rbx
14548f883:     	je	0x14548f8cc <.text+0x548e8cc>
14548f885:     	leaq	0x10(%rcx), %rsi
14548f889:     	movq	(%rcx), %rdx
14548f88c:     	movq	0x8(%rcx), %r8
14548f890:     	movq	%rdi, %r12
14548f893:     	subq	%r8, %r12
14548f896:     	cmovbq	%rdi, %r8
14548f89a:     	movq	%r14, %rcx
14548f89d:     	callq	0x145756dd7 <.text+0x5755dd7>
14548f8a2:     	cltq
14548f8a4:     	testl	%eax, %eax
14548f8a6:     	cmovneq	%rax, %r12
14548f8aa:     	testq	%r12, %r12
14548f8ad:     	sets	%cl
14548f8b0:     	setg	%al
14548f8b3:     	subb	%cl, %al
14548f8b5:     	incq	%r15
14548f8b8:     	addq	$-0x10, %rbx
14548f8bc:     	movq	%rsi, %rcx
14548f8bf:     	cmpb	$0x1, %al
14548f8c1:     	je	0x14548f880 <.text+0x548e880>
14548f8c3:     	movzbl	%al, %eax
14548f8c6:     	testl	%eax, %eax
14548f8c8:     	je	0x14548f8f5 <.text+0x548e8f5>
14548f8ca:     	jmp	0x14548f8d0 <.text+0x548e8d0>
14548f8cc:     	movq	-0x40(%rbp), %r15
14548f8d0:     	movq	0x90(%rbp), %rax
14548f8d7:     	movq	0xa0(%rbp), %rcx
14548f8de:     	subq	$0x1, %r13
14548f8e2:     	jb	0x1454905d0 <.text+0x548f5d0>
14548f8e8:     	movq	0x118(%rcx,%r15,8), %rcx
14548f8f0:     	jmp	0x14548f857 <.text+0x548e857>
14548f8f5:     	movq	0xa0(%rbp), %rax
14548f8fc:     	movq	%rax, 0x40(%rbp)
14548f900:     	movq	%r13, 0x48(%rbp)
14548f904:     	movq	%r15, 0x50(%rbp)
14548f908:     	movq	0x90(%rbp), %rax
14548f90f:     	movq	%rax, 0x58(%rbp)
14548f913:     	movq	$0x0, 0x38(%rbp)
14548f91b:     	movq	-0x38(%rbp), %r12
14548f91f:     	movq	-0x30(%rbp), %r15
14548f923:     	movq	-0x28(%rbp), %r13
14548f927:     	jmp	0x14548f93d <.text+0x548e93d>
14548f929:     	movq	%r14, 0x38(%rbp)
14548f92d:     	movq	%rdi, 0x40(%rbp)
14548f931:     	movq	%rax, 0x48(%rbp)
14548f935:     	movq	$0x0, 0x50(%rbp)
14548f93d:     	leaq	0x38(%rbp), %rcx
14548f941:     	xorps	%xmm1, %xmm1
14548f944:     	callq	0x1454276d0 <.text+0x54266d0>
14548f949:     	addsd	(%rax), %xmm9
14548f94e:     	movsd	%xmm9, (%rax)
14548f953:     	movq	0x300(%r12), %rcx
14548f95b:     	testq	%rcx, %rcx
14548f95e:     	movzbl	0x9f(%rbp), %edx
14548f965:     	je	0x14548fa50 <.text+0x548ea50>
14548f96b:     	movq	0x2f8(%r12), %rax
14548f973:     	cmpq	$0x1, %rcx
14548f977:     	jne	0x14548f986 <.text+0x548e986>
14548f979:     	movss	0x466cfb(%rip), %xmm2   # 0x1458f667c
14548f981:     	xorl	%r8d, %r8d
14548f984:     	jmp	0x14548f9e5 <.text+0x548e9e5>
14548f986:     	movq	%rcx, %r9
14548f989:     	andq	$-0x2, %r9
14548f98d:     	movss	0x466ce7(%rip), %xmm2   # 0x1458f667c
14548f995:     	xorl	%r8d, %r8d
14548f998:     	movq	%rax, %r10
14548f99b:     	jmp	0x14548f9ad <.text+0x548e9ad>
14548f99d:     	nopl	(%rax)
14548f9a0:     	addq	$0x2, %r8
14548f9a4:     	addq	$0x30, %r10
14548f9a8:     	cmpq	%r8, %r9
14548f9ab:     	je	0x14548f9e0 <.text+0x548e9e0>
14548f9ad:     	movss	0x10(%r10), %xmm0
14548f9b3:     	ucomiss	%xmm8, %xmm0
14548f9b7:     	jbe	0x14548f9c5 <.text+0x548e9c5>
14548f9b9:     	cmpl	$0xc, (%r10)
14548f9bd:     	jne	0x14548f9c5 <.text+0x548e9c5>
14548f9bf:     	addss	0x4(%r10), %xmm2
14548f9c5:     	movss	0x28(%r10), %xmm0
14548f9cb:     	ucomiss	%xmm8, %xmm0
14548f9cf:     	jbe	0x14548f9a0 <.text+0x548e9a0>
14548f9d1:     	cmpl	$0xc, 0x18(%r10)
14548f9d6:     	jne	0x14548f9a0 <.text+0x548e9a0>
14548f9d8:     	addss	0x1c(%r10), %xmm2
14548f9de:     	jmp	0x14548f9a0 <.text+0x548e9a0>
14548f9e0:     	testb	$0x1, %cl
14548f9e3:     	je	0x14548fa06 <.text+0x548ea06>
14548f9e5:     	leaq	(%r8,%r8,2), %r8
14548f9e9:     	movss	0x10(%rax,%r8,8), %xmm0
14548f9f0:     	ucomiss	%xmm8, %xmm0
14548f9f4:     	jbe	0x14548fa06 <.text+0x548ea06>
14548f9f6:     	leaq	(%rax,%r8,8), %r8
14548f9fa:     	cmpl	$0xc, (%r8)
14548f9fe:     	jne	0x14548fa06 <.text+0x548ea06>
14548fa00:     	addss	0x4(%r8), %xmm2
14548fa06:     	xorpd	%xmm0, %xmm0
14548fa0a:     	ucomiss	%xmm0, %xmm2
14548fa0d:     	jbe	0x14548fa50 <.text+0x548ea50>
14548fa0f:     	testq	%r13, %r13
14548fa12:     	sete	%r8b
14548fa16:     	xorb	$0x1, %dl
14548fa19:     	orb	%r8b, %dl
14548fa1c:     	jne	0x14548fbca <.text+0x548ebca>
14548fa22:     	shlq	$0x3, %rcx
14548fa26:     	leaq	(%rcx,%rcx,2), %rcx
14548fa2a:     	xorl	%edx, %edx
14548fa2c:     	nopl	(%rax)
14548fa30:     	cmpq	%rdx, %rcx
14548fa33:     	je	0x14549057c <.text+0x548f57c>
14548fa39:     	leaq	0x18(%rdx), %r8
14548fa3d:     	cmpl	$0xc, (%rax,%rdx)
14548fa41:     	movq	%r8, %rdx
14548fa44:     	jne	0x14548fa30 <.text+0x548ea30>
14548fa46:     	movl	-0xc(%rax,%r8), %r9d
14548fa4b:     	jmp	0x145490582 <.text+0x548f582>
14548fa50:     	testq	%r13, %r13
14548fa53:     	je	0x14548fbca <.text+0x548ebca>
14548fa59:     	testb	%dl, %dl
14548fa5b:     	je	0x14548fbca <.text+0x548ebca>
14548fa61:     	cmpb	$0x1, 0x95f(%r12)
14548fa6a:     	jne	0x14548fbca <.text+0x548ebca>
14548fa70:     	movq	0x6d0(%r12), %rdx
14548fa78:     	testq	%rdx, %rdx
14548fa7b:     	je	0x14548fb44 <.text+0x548eb44>
14548fa81:     	movq	0x6c8(%r12), %rax
14548fa89:     	cmpq	$0x1, %rdx
14548fa8d:     	jne	0x14548fa9b <.text+0x548ea9b>
14548fa8f:     	movss	0x466be5(%rip), %xmm0   # 0x1458f667c
14548fa97:     	xorl	%ecx, %ecx
14548fa99:     	jmp	0x14548faea <.text+0x548eaea>
14548fa9b:     	movq	%rdx, %r8
14548fa9e:     	andq	$-0x2, %r8
14548faa2:     	movss	0x466bd2(%rip), %xmm0   # 0x1458f667c
14548faaa:     	xorl	%ecx, %ecx
14548faac:     	jmp	0x14548fab9 <.text+0x548eab9>
14548faae:     	nop
14548fab0:     	addq	$0x2, %rcx
14548fab4:     	cmpq	%rcx, %r8
14548fab7:     	je	0x14548fae5 <.text+0x548eae5>
14548fab9:     	cmpb	$0x16, (%rax,%rcx,8)
14548fabd:     	je	0x14548fad0 <.text+0x548ead0>
14548fabf:     	cmpb	$0x16, 0x8(%rax,%rcx,8)
14548fac4:     	jne	0x14548fab0 <.text+0x548eab0>
14548fac6:     	jmp	0x14548fadd <.text+0x548eadd>
14548fac8:     	nopl	(%rax,%rax)
14548fad0:     	addss	0x4(%rax,%rcx,8), %xmm0
14548fad6:     	cmpb	$0x16, 0x8(%rax,%rcx,8)
14548fadb:     	jne	0x14548fab0 <.text+0x548eab0>
14548fadd:     	addss	0xc(%rax,%rcx,8), %xmm0
14548fae3:     	jmp	0x14548fab0 <.text+0x548eab0>
14548fae5:     	testb	$0x1, %dl
14548fae8:     	je	0x14548faf6 <.text+0x548eaf6>
14548faea:     	cmpb	$0x16, (%rax,%rcx,8)
14548faee:     	jne	0x14548faf6 <.text+0x548eaf6>
14548faf0:     	addss	0x4(%rax,%rcx,8), %xmm0
14548faf6:     	xorps	%xmm1, %xmm1
14548faf9:     	ucomiss	%xmm1, %xmm6
14548fafc:     	jbe	0x14548fb44 <.text+0x548eb44>
14548fafe:     	ucomiss	%xmm1, %xmm0
14548fb01:     	jbe	0x14548fb44 <.text+0x548eb44>
14548fb03:     	mulss	%xmm0, %xmm6
14548fb07:     	movzbl	0x111(%r12), %ebx
14548fb10:     	movb	$0x3, 0x111(%r12)
14548fb19:     	movb	$0x0, 0x30(%rsp)
14548fb1e:     	movb	$0x0, 0x28(%rsp)
14548fb23:     	movb	$0x3, 0x20(%rsp)
14548fb28:     	movq	%r12, %rcx
14548fb2b:     	movq	%r13, %rdx
14548fb2e:     	movaps	%xmm6, %xmm2
14548fb31:     	movl	$0x1d3, %r9d            # imm = 0x1D3
14548fb37:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
14548fb3c:     	movb	%bl, 0x111(%r12)
14548fb44:     	movl	0x3f0(%r12), %eax
14548fb4c:     	movl	%eax, 0x4c(%rbp)
14548fb4f:     	movq	0x3e8(%r12), %rax
14548fb57:     	movq	%rax, 0x44(%rbp)
14548fb5b:     	movl	$0x0, 0x18(%rbp)
14548fb62:     	movq	%r13, 0x10(%rbp)
14548fb66:     	movq	0x3e8(%r12), %rax
14548fb6e:     	movq	%rax, 0x1c(%rbp)
14548fb72:     	movl	0x3f0(%r12), %eax
14548fb7a:     	movl	%eax, 0x24(%rbp)
14548fb7d:     	movss	%xmm7, 0x28(%rbp)
14548fb82:     	movl	$0x400, 0x2c(%rbp)      # imm = 0x400
14548fb89:     	movw	$0x0, 0x30(%rbp)
14548fb8f:     	leaq	0x10(%rbp), %rdx
14548fb93:     	movq	%r12, %rcx
14548fb96:     	xorl	%r8d, %r8d
14548fb99:     	callq	0x1454b9930 <.text+0x54b8930>
14548fb9e:     	movl	$0x0, 0x40(%rbp)
14548fba5:     	movq	%r13, 0x38(%rbp)
14548fba9:     	movss	%xmm7, 0x50(%rbp)
14548fbae:     	movl	$0x500, 0x54(%rbp)      # imm = 0x500
14548fbb5:     	movw	$0x0, 0x58(%rbp)
14548fbbb:     	leaq	0x38(%rbp), %rdx
14548fbbf:     	movq	%r12, %rcx
14548fbc2:     	xorl	%r8d, %r8d
14548fbc5:     	callq	0x1454b9930 <.text+0x54b8930>
14548fbca:     	movss	0x400(%r12), %xmm6
14548fbd4:     	cmpb	$0x0, 0x95a(%r12)
14548fbdd:     	je	0x14548fbf1 <.text+0x548ebf1>
14548fbdf:     	maxss	0x45b899(%rip), %xmm6   # 0x1458eb480
14548fbe7:     	movss	%xmm6, 0x400(%r12)
14548fbf1:     	xorps	%xmm7, %xmm7
14548fbf4:     	ucomiss	%xmm6, %xmm7
14548fbf7:     	jae	0x14548fd49 <.text+0x548ed49>
14548fbfd:     	movss	0x400(%r12), %xmm0
14548fc07:     	movss	0x458(%r12), %xmm6
14548fc11:     	maxss	%xmm7, %xmm0
14548fc15:     	callq	0x145756e6d <.text+0x5755e6d>
14548fc1a:     	cvttss2si	%xmm0, %rbx
14548fc1f:     	xorl	%esi, %esi
14548fc21:     	ucomiss	%xmm7, %xmm0
14548fc24:     	cmovbl	%esi, %ebx
14548fc27:     	movss	0x45b8ec(%rip), %xmm8   # 0x1458eb51c
14548fc30:     	ucomiss	%xmm8, %xmm0
14548fc34:     	movl	$0xffffffff, %r14d      # imm = 0xFFFFFFFF
14548fc3a:     	cmoval	%r14d, %ebx
14548fc3e:     	movaps	%xmm6, %xmm0
14548fc41:     	callq	0x145756e6d <.text+0x5755e6d>
14548fc46:     	cvttss2si	%xmm0, %rdi
14548fc4b:     	ucomiss	%xmm7, %xmm0
14548fc4e:     	cmovbl	%esi, %edi
14548fc51:     	ucomiss	%xmm8, %xmm0
14548fc55:     	cmoval	%r14d, %edi
14548fc59:     	leaq	0x8b8(%r12), %r14
14548fc61:     	movq	0x8b8(%r12), %rax
14548fc69:     	testq	%rax, %rax
14548fc6c:     	je	0x14548ff6e <.text+0x548ef6e>
14548fc72:     	movq	0x8c0(%r12), %rcx
14548fc7a:     	movw	$0x16, %dx
14548fc7e:     	movzwl	0x36(%rax), %r9d
14548fc83:     	movl	%r9d, %r10d
14548fc86:     	addl	%r10d, %r10d
14548fc89:     	movq	$-0x1, %r8
14548fc90:     	testq	%r10, %r10
14548fc93:     	je	0x14548fcbb <.text+0x548ecbb>
14548fc95:     	cmpw	0x3a(%rax,%r8,2), %dx
14548fc9b:     	seta	%r11b
14548fc9f:     	sbbb	$0x0, %r11b
14548fca3:     	incq	%r8
14548fca6:     	addq	$-0x2, %r10
14548fcaa:     	cmpb	$0x1, %r11b
14548fcae:     	je	0x14548fc90 <.text+0x548ec90>
14548fcb0:     	movzbl	%r11b, %r9d
14548fcb4:     	testl	%r9d, %r9d
14548fcb7:     	je	0x14548fccf <.text+0x548eccf>
14548fcb9:     	jmp	0x14548fcbe <.text+0x548ecbe>
14548fcbb:     	movq	%r9, %r8
14548fcbe:     	subq	$0x1, %rcx
14548fcc2:     	jb	0x14548ff70 <.text+0x548ef70>
14548fcc8:     	movq	0x50(%rax,%r8,8), %rax
14548fccd:     	jmp	0x14548fc7e <.text+0x548ec7e>
14548fccf:     	movl	%ebx, 0x8(%rax,%r8,4)
14548fcd4:     	movq	(%r14), %rax
14548fcd7:     	testq	%rax, %rax
14548fcda:     	je	0x14548ffa8 <.text+0x548efa8>
14548fce0:     	movq	0x8c0(%r12), %rcx
14548fce8:     	movw	$0x1c, %dx
14548fcec:     	movzwl	0x36(%rax), %r9d
14548fcf1:     	movl	%r9d, %r10d
14548fcf4:     	addl	%r10d, %r10d
14548fcf7:     	movq	$-0x1, %r8
14548fcfe:     	nop
14548fd00:     	testq	%r10, %r10
14548fd03:     	je	0x14548fd2b <.text+0x548ed2b>
14548fd05:     	cmpw	0x3a(%rax,%r8,2), %dx
14548fd0b:     	seta	%r11b
14548fd0f:     	sbbb	$0x0, %r11b
14548fd13:     	incq	%r8
14548fd16:     	addq	$-0x2, %r10
14548fd1a:     	cmpb	$0x1, %r11b
14548fd1e:     	je	0x14548fd00 <.text+0x548ed00>
14548fd20:     	movzbl	%r11b, %r9d
14548fd24:     	testl	%r9d, %r9d
14548fd27:     	je	0x14548fd3f <.text+0x548ed3f>
14548fd29:     	jmp	0x14548fd2e <.text+0x548ed2e>
14548fd2b:     	movq	%r9, %r8
14548fd2e:     	subq	$0x1, %rcx
14548fd32:     	jb	0x14548ffaa <.text+0x548efaa>
14548fd38:     	movq	0x50(%rax,%r8,8), %rax
14548fd3d:     	jmp	0x14548fcec <.text+0x548ecec>
14548fd3f:     	movl	%edi, 0x8(%rax,%r8,4)
14548fd44:     	jmp	0x14548ffd6 <.text+0x548efd6>
14548fd49:     	movq	0x378(%r12), %rax
14548fd51:     	cmpl	$0xb, 0x68(%rax)
14548fd55:     	jne	0x14549001a <.text+0x548f01a>
14548fd5b:     	movss	0x384(%r12), %xmm0
14548fd65:     	xorps	%xmm1, %xmm1
14548fd68:     	ucomiss	%xmm1, %xmm0
14548fd6b:     	ja	0x14549001a <.text+0x548f01a>
14548fd71:     	movl	0x380(%r12), %ecx
14548fd79:     	movl	0x390(%r12), %edx
14548fd81:     	movl	0x3ac(%r12), %r8d
14548fd89:     	movl	%r8d, 0x6c(%rbp)
14548fd8d:     	movups	0x39c(%r12), %xmm1
14548fd96:     	movups	%xmm1, 0x5c(%rbp)
14548fd9a:     	movups	0x3b0(%r12), %xmm1
14548fda3:     	movups	0x3bc(%r12), %xmm2
14548fdac:     	movups	%xmm2, 0x7c(%rbp)
14548fdb0:     	movups	%xmm1, 0x70(%rbp)
14548fdb4:     	movq	%rax, 0x38(%rbp)
14548fdb8:     	movl	%ecx, 0x40(%rbp)
14548fdbb:     	movss	%xmm0, 0x44(%rbp)
14548fdc0:     	movsd	0x388(%r12), %xmm0
14548fdca:     	movsd	%xmm0, 0x48(%rbp)
14548fdcf:     	movl	%edx, 0x50(%rbp)
14548fdd2:     	movsd	0x394(%r12), %xmm0
14548fddc:     	movsd	%xmm0, 0x54(%rbp)
14548fde1:     	movl	$0x3f800000, 0x400(%r12) # imm = 0x3F800000
14548fded:     	leaq	0x38(%rbp), %rdx
14548fdf1:     	movq	%r12, %rcx
14548fdf4:     	callq	0x1454e7a20 <.text+0x54e6a20>
14548fdf9:     	testb	%al, %al
14548fdfb:     	je	0x145490010 <.text+0x548f010>
14548fe01:     	movq	0x378(%r12), %rax
14548fe09:     	movss	0x48(%rax), %xmm0
14548fe0e:     	mulss	0x468f2a(%rip), %xmm0   # 0x1458f8d40
14548fe16:     	mulss	0x38c(%r12), %xmm0
14548fe20:     	mulss	0x3b4(%r12), %xmm0
14548fe2a:     	mulss	0x460(%r12), %xmm0
14548fe34:     	maxss	0x45d1d4(%rip), %xmm0   # 0x1458ed010
14548fe3c:     	movss	%xmm0, 0x384(%r12)
14548fe46:     	mulss	0x4a10c2(%rip), %xmm0   # 0x145930f10
14548fe4e:     	cvttss2si	%xmm0, %rcx
14548fe53:     	xorl	%edx, %edx
14548fe55:     	xorps	%xmm1, %xmm1
14548fe58:     	ucomiss	%xmm1, %xmm0
14548fe5b:     	cmovael	%ecx, %edx
14548fe5e:     	movl	0x40(%rax), %ebx
14548fe61:     	ucomiss	0x45b6b4(%rip), %xmm0   # 0x1458eb51c
14548fe68:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14548fe6d:     	cmovbel	%edx, %eax
14548fe70:     	leaq	0x538(%r12), %rdi
14548fe78:     	movq	0x3d0(%r12), %rdx
14548fe80:     	movl	%ebx, (%rbp)
14548fe83:     	movl	%eax, 0x4(%rbp)
14548fe86:     	leaq	0x10(%rbp), %rcx
14548fe8a:     	movq	%rbp, %r8
14548fe8d:     	movl	$0x1, %r9d
14548fe93:     	callq	0x145442f60 <.text+0x5441f60>
14548fe98:     	movq	0x548(%r12), %rsi
14548fea0:     	cmpq	0x538(%r12), %rsi
14548fea8:     	jne	0x14548feb3 <.text+0x548eeb3>
14548feaa:     	movq	%rdi, %rcx
14548fead:     	callq	0x1457580b0 <.text+0x57570b0>
14548feb2:     	nop
14548feb3:     	movq	0x540(%r12), %rax
14548febb:     	movq	%rsi, %rcx
14548febe:     	shlq	$0x5, %rcx
14548fec2:     	movups	0x10(%rbp), %xmm0
14548fec6:     	movups	0x20(%rbp), %xmm1
14548feca:     	movups	%xmm1, 0x10(%rax,%rcx)
14548fecf:     	movups	%xmm0, (%rax,%rcx)
14548fed3:     	incq	%rsi
14548fed6:     	movq	%rsi, 0x548(%r12)
14548fede:     	movq	0x3d0(%r12), %rsi
14548fee6:     	callq	0x140002200 <.text+0x1200>
14548feeb:     	movl	$0x20, %ecx
14548fef0:     	movl	$0x1, %edx
14548fef5:     	callq	0x1400021c0 <.text+0x11c0>
14548fefa:     	testq	%rax, %rax
14548fefd:     	je	0x145490909 <.text+0x548f909>
14548ff03:     	movl	%ebx, (%rax)
14548ff05:     	movq	%rax, 0xa0(%rbp)
14548ff0c:     	movq	%rsi, 0x4(%rax)
14548ff10:     	movq	0x548(%r12), %rsi
14548ff18:     	cmpq	0x538(%r12), %rsi
14548ff20:     	jne	0x14548ff2b <.text+0x548ef2b>
14548ff22:     	movq	%rdi, %rcx
14548ff25:     	callq	0x1457580b0 <.text+0x57570b0>
14548ff2a:     	nop
14548ff2b:     	movq	0x540(%r12), %rax
14548ff33:     	movq	%rsi, %rcx
14548ff36:     	shlq	$0x5, %rcx
14548ff3a:     	movq	$0x20, (%rax,%rcx)
14548ff42:     	movq	0xa0(%rbp), %rdx
14548ff49:     	movq	%rdx, 0x8(%rax,%rcx)
14548ff4e:     	movq	$0xc, 0x10(%rax,%rcx)
14548ff57:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
14548ff5e:     	incq	%rsi
14548ff61:     	movq	%rsi, 0x548(%r12)
14548ff69:     	jmp	0x14548fbfd <.text+0x548ebfd>
14548ff6e:     	xorl	%eax, %eax
14548ff70:     	movq	%r14, 0x38(%rbp)
14548ff74:     	movq	%rax, 0x40(%rbp)
14548ff78:     	movq	$0x0, 0x48(%rbp)
14548ff80:     	movq	%r8, 0x50(%rbp)
14548ff84:     	movq	$0x16, 0x58(%rbp)
14548ff8c:     	leaq	0x10(%rbp), %rcx
14548ff90:     	leaq	0x38(%rbp), %rdx
14548ff94:     	movl	%ebx, %r8d
14548ff97:     	callq	0x145427a50 <.text+0x5426a50>
14548ff9c:     	movq	(%r14), %rax
14548ff9f:     	testq	%rax, %rax
14548ffa2:     	jne	0x14548fce0 <.text+0x548ece0>
14548ffa8:     	xorl	%eax, %eax
14548ffaa:     	movq	%r14, 0x38(%rbp)
14548ffae:     	movq	%rax, 0x40(%rbp)
14548ffb2:     	movq	$0x0, 0x48(%rbp)
14548ffba:     	movq	%r8, 0x50(%rbp)
14548ffbe:     	movq	$0x1c, 0x58(%rbp)
14548ffc6:     	leaq	0x10(%rbp), %rcx
14548ffca:     	leaq	0x38(%rbp), %rdx
14548ffce:     	movl	%edi, %r8d
14548ffd1:     	callq	0x145427a50 <.text+0x5426a50>
14548ffd6:     	movaps	0xb0(%rbp), %xmm6
14548ffdd:     	movaps	0xc0(%rbp), %xmm7
14548ffe4:     	movaps	0xd0(%rbp), %xmm8
14548ffec:     	movaps	0xe0(%rbp), %xmm9
14548fff4:     	movaps	0xf0(%rbp), %xmm10
14548fffc:     	addq	$0x188, %rsp            # imm = 0x188
145490003:     	popq	%rbx
145490004:     	popq	%rdi
145490005:     	popq	%rsi
145490006:     	popq	%r12
145490008:     	popq	%r13
14549000a:     	popq	%r14
14549000c:     	popq	%r15
14549000e:     	popq	%rbp
14549000f:     	retq
145490010:     	movss	%xmm6, 0x400(%r12)
14549001a:     	movss	0x8e4(%r12), %xmm6
145490024:     	movq	0x700(%r12), %rcx
14549002c:     	testq	%rcx, %rcx
14549002f:     	je	0x145490253 <.text+0x548f253>
145490035:     	movq	0x6f8(%r12), %rax
14549003d:     	cmpb	$0x13, (%rax)
145490040:     	jne	0x14549022c <.text+0x548f22c>
145490046:     	movss	0x100(%r12), %xmm0
145490050:     	ucomiss	%xmm6, %xmm0
145490053:     	ja	0x145490253 <.text+0x548f253>
145490059:     	movss	0xc(%rax), %xmm8
14549005f:     	movss	0x8(%rax), %xmm0
145490064:     	movss	0x4(%rax), %xmm1
145490069:     	addss	%xmm6, %xmm1
14549006d:     	movss	%xmm1, 0x100(%r12)
145490077:     	mulss	0x458(%r12), %xmm0
145490081:     	movss	%xmm0, 0x400(%r12)
14549008b:     	leaq	0x118(%r12), %rdx
145490093:     	leaq	0x10(%rbp), %rcx
145490097:     	callq	0x14570c440 <.text+0x570b440>
14549009c:     	leaq	0x538(%r12), %rbx
1454900a4:     	xorps	%xmm0, %xmm0
1454900a7:     	ucomiss	%xmm0, %xmm8
1454900ab:     	jbe	0x1454905f1 <.text+0x548f5f1>
1454900b1:     	movq	0x3d0(%r12), %rdx
1454900b9:     	movq	%rdx, -0x8(%rbp)
1454900bd:     	movl	$0x2, (%rbp)
1454900c4:     	movl	$0x0, -0x18(%rbp)
1454900cb:     	leaq	-0x18(%rbp), %rax
1454900cf:     	movq	%rax, 0x30(%rsp)
1454900d4:     	movq	%rbp, %rax
1454900d7:     	movq	%rax, 0x28(%rsp)
1454900dc:     	movq	$0x1, 0x20(%rsp)
1454900e5:     	leaq	0x38(%rbp), %rcx
1454900e9:     	leaq	-0x8(%rbp), %r9
1454900ed:     	movl	$0x740, %r8d            # imm = 0x740
1454900f3:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454900f8:     	nop
1454900f9:     	movq	0x548(%r12), %rsi
145490101:     	cmpq	0x538(%r12), %rsi
145490109:     	jne	0x145490114 <.text+0x548f114>
14549010b:     	movq	%rbx, %rcx
14549010e:     	callq	0x1457580b0 <.text+0x57570b0>
145490113:     	nop
145490114:     	movq	0x540(%r12), %rax
14549011c:     	movq	%rsi, %rcx
14549011f:     	shlq	$0x5, %rcx
145490123:     	movups	0x38(%rbp), %xmm0
145490127:     	movups	0x48(%rbp), %xmm1
14549012b:     	movups	%xmm1, 0x10(%rax,%rcx)
145490130:     	movups	%xmm0, (%rax,%rcx)
145490134:     	incq	%rsi
145490137:     	movq	%rsi, 0x548(%r12)
14549013f:     	movq	0x300(%r12), %rsi
145490147:     	cmpq	0x2f0(%r12), %rsi
14549014f:     	jne	0x14549015a <.text+0x548f15a>
145490151:     	movq	%r15, %rcx
145490154:     	callq	0x145763c20 <.text+0x5762c20>
145490159:     	nop
14549015a:     	addss	%xmm8, %xmm6
14549015f:     	movq	0x2f8(%r12), %rax
145490167:     	leaq	(%rsi,%rsi,2), %rcx
14549016b:     	movl	$0xb, (%rax,%rcx,8)
145490172:     	movl	$0x740, 0xc(%rax,%rcx,8) # imm = 0x740
14549017a:     	movss	%xmm6, 0x10(%rax,%rcx,8)
145490180:     	movl	$0x0, 0x14(%rax,%rcx,8)
145490188:     	incq	%rsi
14549018b:     	movq	%rsi, 0x300(%r12)
145490193:     	movq	%r12, %rcx
145490196:     	callq	0x14548d2b0 <.text+0x548c2b0>
14549019b:     	nop
14549019c:     	movq	0x18(%rbp), %rdi
1454901a0:     	movq	0x20(%rbp), %r14
1454901a4:     	leaq	0x151b198(%rip), %r15   # 0x1469ab343
1454901ab:     	movl	$0x10, %esi
1454901b0:     	movl	$0x10, %edx
1454901b5:     	movq	%r15, %rcx
1454901b8:     	callq	0x145452400 <.text+0x5451400>
1454901bd:     	nop
1454901be:     	testq	%rax, %rax
1454901c1:     	cmovneq	%rax, %r15
1454901c5:     	cmoveq	%rsi, %rdx
1454901c9:     	movq	%rdx, 0x20(%rsp)
1454901ce:     	leaq	0x38(%rbp), %rcx
1454901d2:     	movq	%rdi, %rdx
1454901d5:     	movq	%r14, %r8
1454901d8:     	movq	%r15, %r9
1454901db:     	callq	0x14543f640 <.text+0x543e640>
1454901e0:     	nop
1454901e1:     	movq	0x548(%r12), %rsi
1454901e9:     	cmpq	0x538(%r12), %rsi
1454901f1:     	jne	0x1454901fc <.text+0x548f1fc>
1454901f3:     	movq	%rbx, %rcx
1454901f6:     	callq	0x1457580b0 <.text+0x57570b0>
1454901fb:     	nop
1454901fc:     	movq	0x540(%r12), %rax
145490204:     	movq	%rsi, %rcx
145490207:     	shlq	$0x5, %rcx
14549020b:     	movups	0x38(%rbp), %xmm0
14549020f:     	movups	0x48(%rbp), %xmm1
145490213:     	movups	%xmm1, 0x10(%rax,%rcx)
145490218:     	movups	%xmm0, (%rax,%rcx)
14549021c:     	incq	%rsi
14549021f:     	movq	%rsi, 0x548(%r12)
145490227:     	jmp	0x145490754 <.text+0x548f754>
14549022c:     	cmpq	$0x1, %rcx
145490230:     	je	0x145490253 <.text+0x548f253>
145490232:     	shlq	$0x6, %rcx
145490236:     	addq	$0x40, %rax
14549023a:     	addq	$-0x40, %rcx
14549023e:     	nop
145490240:     	cmpb	$0x13, (%rax)
145490243:     	je	0x145490046 <.text+0x548f046>
145490249:     	addq	$0x40, %rax
14549024d:     	addq	$-0x40, %rcx
145490251:     	jne	0x145490240 <.text+0x548f240>
145490253:     	movl	0x4a8(%r12), %eax
14549025b:     	testl	%eax, %eax
14549025d:     	je	0x1454904cd <.text+0x548f4cd>
145490263:     	decl	%eax
145490265:     	movl	%eax, 0x4a8(%r12)
14549026d:     	movss	0x458(%r12), %xmm0
145490277:     	mulss	0x45b209(%rip), %xmm0   # 0x1458eb488
14549027f:     	movss	%xmm0, 0x400(%r12)
145490289:     	leaq	0x538(%r12), %rdi
145490291:     	movq	0x3d0(%r12), %rdx
145490299:     	movq	%rdx, -0x18(%rbp)
14549029d:     	movl	$0x2, 0x10(%rbp)
1454902a4:     	movl	$0x0, (%rbp)
1454902ab:     	movq	%rbp, %r15
1454902ae:     	movq	%r15, 0x30(%rsp)
1454902b3:     	leaq	0x10(%rbp), %rax
1454902b7:     	movq	%rax, 0x28(%rsp)
1454902bc:     	movq	$0x1, 0x20(%rsp)
1454902c5:     	leaq	0x38(%rbp), %rcx
1454902c9:     	leaq	-0x18(%rbp), %r9
1454902cd:     	movl	$0x52b1, %r8d           # imm = 0x52B1
1454902d3:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454902d8:     	movq	0x548(%r12), %rsi
1454902e0:     	cmpq	0x538(%r12), %rsi
1454902e8:     	jne	0x1454902f3 <.text+0x548f2f3>
1454902ea:     	movq	%rdi, %rcx
1454902ed:     	callq	0x1457580b0 <.text+0x57570b0>
1454902f2:     	nop
1454902f3:     	movq	0x540(%r12), %rax
1454902fb:     	movq	%rsi, %rcx
1454902fe:     	shlq	$0x5, %rcx
145490302:     	movups	0x38(%rbp), %xmm0
145490306:     	movups	0x48(%rbp), %xmm1
14549030a:     	movups	%xmm1, 0x10(%rax,%rcx)
14549030f:     	movups	%xmm0, (%rax,%rcx)
145490313:     	incq	%rsi
145490316:     	movq	%rsi, 0x548(%r12)
14549031e:     	leaq	0x118(%r12), %rdx
145490326:     	leaq	0x10(%rbp), %rcx
14549032a:     	callq	0x14570c440 <.text+0x570b440>
14549032f:     	movq	0x18(%rbp), %rax
145490333:     	movq	%rax, 0xa0(%rbp)
14549033a:     	movq	0x20(%rbp), %rbx
14549033e:     	leaq	0x151ac11(%rip), %r14   # 0x1469aaf56
145490345:     	movl	$0x28, %esi
14549034a:     	movl	$0x28, %edx
14549034f:     	movq	%r14, %rcx
145490352:     	callq	0x145452400 <.text+0x5451400>
145490357:     	nop
145490358:     	testq	%rax, %rax
14549035b:     	cmovneq	%rax, %r14
14549035f:     	cmoveq	%rsi, %rdx
145490363:     	movq	%rdx, 0x20(%rsp)
145490368:     	leaq	0x38(%rbp), %rcx
14549036c:     	movq	0xa0(%rbp), %rdx
145490373:     	movq	%rbx, %r8
145490376:     	movq	%r14, %r9
145490379:     	callq	0x14543f640 <.text+0x543e640>
14549037e:     	nop
14549037f:     	movq	0x548(%r12), %rsi
145490387:     	cmpq	0x538(%r12), %rsi
14549038f:     	jne	0x14549039a <.text+0x548f39a>
145490391:     	movq	%rdi, %rcx
145490394:     	callq	0x1457580b0 <.text+0x57570b0>
145490399:     	nop
14549039a:     	movq	0x540(%r12), %rax
1454903a2:     	movq	%rsi, %rcx
1454903a5:     	shlq	$0x5, %rcx
1454903a9:     	movups	0x38(%rbp), %xmm0
1454903ad:     	movups	0x48(%rbp), %xmm1
1454903b1:     	movups	%xmm1, 0x10(%rax,%rcx)
1454903b6:     	movups	%xmm0, (%rax,%rcx)
1454903ba:     	incq	%rsi
1454903bd:     	movq	%rsi, 0x548(%r12)
1454903c5:     	movq	0x10(%rbp), %rdx
1454903c9:     	testq	%rdx, %rdx
1454903cc:     	movq	0xa0(%rbp), %rcx
1454903d3:     	je	0x1454903e0 <.text+0x548f3e0>
1454903d5:     	movl	$0x1, %r8d
1454903db:     	callq	0x1400021d0 <.text+0x11d0>
1454903e0:     	movl	0x3f0(%r12), %eax
1454903e8:     	movl	%eax, 0x8(%rbp)
1454903eb:     	movq	0x3e8(%r12), %rax
1454903f3:     	movq	%rax, (%rbp)
1454903f7:     	movq	0x4c8(%r12), %rax
1454903ff:     	imulq	$0x160, 0x4d0(%r12), %rcx # imm = 0x160
14549040b:     	addq	%rax, %rcx
14549040e:     	movq	%rax, 0x38(%rbp)
145490412:     	movq	%rcx, 0x40(%rbp)
145490416:     	leaq	-0x1c(%rbp), %rax
14549041a:     	movq	%rax, 0x48(%rbp)
14549041e:     	movq	%r15, 0x50(%rbp)
145490422:     	leaq	0x10(%rbp), %rcx
145490426:     	leaq	0x38(%rbp), %rdx
14549042a:     	callq	0x145531620 <.text+0x5530620>
14549042f:     	movq	0x10(%rbp), %rax
145490433:     	movq	%rax, 0x90(%rbp)
14549043a:     	movq	0x18(%rbp), %rax
14549043e:     	movq	%rax, 0xa0(%rbp)
145490445:     	movq	0x20(%rbp), %rsi
145490449:     	shlq	$0x3, %rsi
14549044d:     	xorl	%edi, %edi
14549044f:     	movss	0x4a0a69(%rip), %xmm6   # 0x145930ec0
145490457:     	nopw	(%rax,%rax)
145490460:     	cmpq	%rdi, %rsi
145490463:     	je	0x1454904a2 <.text+0x548f4a2>
145490465:     	movq	0xa0(%rbp), %rax
14549046c:     	movq	(%rax,%rdi), %rdx
145490470:     	movss	0x45c(%r12), %xmm2
14549047a:     	mulss	%xmm6, %xmm2
14549047e:     	addq	$0x8, %rdi
145490482:     	movb	$0x0, 0x30(%rsp)
145490487:     	movb	$0x0, 0x28(%rsp)
14549048c:     	movb	$0x1, 0x20(%rsp)
145490491:     	movq	%r12, %rcx
145490494:     	movl	$0x3b85, %r9d           # imm = 0x3B85
14549049a:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
14549049f:     	nop
1454904a0:     	jmp	0x145490460 <.text+0x548f460>
1454904a2:     	movq	0x90(%rbp), %rdx
1454904a9:     	testq	%rdx, %rdx
1454904ac:     	je	0x14548fbfd <.text+0x548ebfd>
1454904b2:     	shlq	$0x3, %rdx
1454904b6:     	movl	$0x8, %r8d
1454904bc:     	movq	0xa0(%rbp), %rcx
1454904c3:     	callq	0x1400021d0 <.text+0x11d0>
1454904c8:     	jmp	0x14548fbfd <.text+0x548ebfd>
1454904cd:     	movl	$0x0, 0x400(%r12)
1454904d9:     	movb	$0x4, 0x95f(%r12)
1454904e2:     	movl	$0x1, 0x860(%r12)
1454904ee:     	movss	%xmm6, 0x864(%r12)
1454904f8:     	movq	%r12, %rcx
1454904fb:     	callq	0x145492fd0 <.text+0x5491fd0>
145490500:     	leaq	0x151ab11(%rip), %r8    # 0x1469ab018
145490507:     	leaq	0x38(%rbp), %rcx
14549050b:     	movl	$0x6, %r9d
145490511:     	movq	%r12, %rdx
145490514:     	callq	0x1454b6620 <.text+0x54b5620>
145490519:     	movq	0x560(%r12), %rsi
145490521:     	cmpq	0x550(%r12), %rsi
145490529:     	jne	0x14549054f <.text+0x548f54f>
14549052b:     	leaq	0x550(%r12), %rcx
145490533:     	movq	0x38(%rbp), %rax
145490537:     	movq	%rax, 0xa0(%rbp)
14549053e:     	movq	0x40(%rbp), %rax
145490542:     	movq	%rax, 0x90(%rbp)
145490549:     	callq	0x145757f60 <.text+0x5756f60>
14549054e:     	nop
14549054f:     	movq	0x558(%r12), %rax
145490557:     	leaq	(%rsi,%rsi,2), %rcx
14549055b:     	movq	0x48(%rbp), %rdx
14549055f:     	movq	%rdx, 0x10(%rax,%rcx,8)
145490564:     	movups	0x38(%rbp), %xmm0
145490568:     	movups	%xmm0, (%rax,%rcx,8)
14549056c:     	incq	%rsi
14549056f:     	movq	%rsi, 0x560(%r12)
145490577:     	jmp	0x14548fbfd <.text+0x548ebfd>
14549057c:     	movl	$0x1d3, %r9d            # imm = 0x1D3
145490582:     	movss	0x498(%r12), %xmm0
14549058c:     	addss	0x45aeec(%rip), %xmm0   # 0x1458eb480
145490594:     	mulss	%xmm0, %xmm2
145490598:     	mulss	0x45c(%r12), %xmm2
1454905a2:     	movb	$0x0, 0x30(%rsp)
1454905a7:     	movb	$0x0, 0x28(%rsp)
1454905ac:     	movb	$0x3, 0x20(%rsp)
1454905b1:     	movq	%r12, %rcx
1454905b4:     	movq	%r13, %rdx
1454905b7:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454905bc:     	cmpb	$0x1, 0x95f(%r12)
1454905c5:     	je	0x14548fa70 <.text+0x548ea70>
1454905cb:     	jmp	0x14548fbca <.text+0x548ebca>
1454905d0:     	movq	%rcx, 0x50(%rbp)
1454905d4:     	movq	$0x0, 0x58(%rbp)
1454905dc:     	movq	%r15, 0x60(%rbp)
1454905e0:     	movq	%r14, 0x38(%rbp)
1454905e4:     	movq	%rdi, 0x40(%rbp)
1454905e8:     	movq	%rax, 0x48(%rbp)
1454905ec:     	jmp	0x14548f91b <.text+0x548e91b>
1454905f1:     	movq	0x3d0(%r12), %rdx
1454905f9:     	movq	%rdx, -0x8(%rbp)
1454905fd:     	movl	$0x2, (%rbp)
145490604:     	movl	$0x0, -0x18(%rbp)
14549060b:     	leaq	-0x18(%rbp), %rax
14549060f:     	movq	%rax, 0x30(%rsp)
145490614:     	movq	%rbp, %rax
145490617:     	movq	%rax, 0x28(%rsp)
14549061c:     	movq	$0x1, 0x20(%rsp)
145490625:     	leaq	0x38(%rbp), %rcx
145490629:     	leaq	-0x8(%rbp), %r9
14549062d:     	movl	$0x5072, %r8d           # imm = 0x5072
145490633:     	callq	0x14544b1a0 <.text+0x544a1a0>
145490638:     	nop
145490639:     	movq	0x548(%r12), %rsi
145490641:     	cmpq	0x538(%r12), %rsi
145490649:     	jne	0x145490654 <.text+0x548f654>
14549064b:     	movq	%rbx, %rcx
14549064e:     	callq	0x1457580b0 <.text+0x57570b0>
145490653:     	nop
145490654:     	movq	0x540(%r12), %rax
14549065c:     	movq	%rsi, %rcx
14549065f:     	shlq	$0x5, %rcx
145490663:     	movups	0x38(%rbp), %xmm0
145490667:     	movups	0x48(%rbp), %xmm1
14549066b:     	movups	%xmm1, 0x10(%rax,%rcx)
145490670:     	movups	%xmm0, (%rax,%rcx)
145490674:     	incq	%rsi
145490677:     	movq	%rsi, 0x548(%r12)
14549067f:     	movq	0x18(%rbp), %rdi
145490683:     	movq	0x20(%rbp), %r14
145490687:     	leaq	0x151aca2(%rip), %r15   # 0x1469ab330
14549068e:     	movl	$0x13, %esi
145490693:     	movl	$0x13, %edx
145490698:     	movq	%r15, %rcx
14549069b:     	callq	0x145452400 <.text+0x5451400>
1454906a0:     	nop
1454906a1:     	testq	%rax, %rax
1454906a4:     	cmovneq	%rax, %r15
1454906a8:     	cmoveq	%rsi, %rdx
1454906ac:     	movq	%rdx, 0x20(%rsp)
1454906b1:     	leaq	0x38(%rbp), %rcx
1454906b5:     	movq	%rdi, %rdx
1454906b8:     	movq	%r14, %r8
1454906bb:     	movq	%r15, %r9
1454906be:     	callq	0x14543f640 <.text+0x543e640>
1454906c3:     	nop
1454906c4:     	movq	0x548(%r12), %rsi
1454906cc:     	cmpq	0x538(%r12), %rsi
1454906d4:     	jne	0x1454906df <.text+0x548f6df>
1454906d6:     	movq	%rbx, %rcx
1454906d9:     	callq	0x1457580b0 <.text+0x57570b0>
1454906de:     	nop
1454906df:     	movq	0x540(%r12), %rax
1454906e7:     	movq	%rsi, %rcx
1454906ea:     	shlq	$0x5, %rcx
1454906ee:     	movups	0x38(%rbp), %xmm0
1454906f2:     	movups	0x48(%rbp), %xmm1
1454906f6:     	movups	%xmm1, 0x10(%rax,%rcx)
1454906fb:     	movups	%xmm0, (%rax,%rcx)
1454906ff:     	incq	%rsi
145490702:     	movq	%rsi, 0x548(%r12)
14549070a:     	movl	0x3f0(%r12), %eax
145490712:     	movl	%eax, 0x4c(%rbp)
145490715:     	movq	0x3e8(%r12), %rax
14549071d:     	movq	%rax, 0x44(%rbp)
145490721:     	movl	$0x0, 0x40(%rbp)
145490728:     	movw	$0x700, 0x54(%rbp)      # imm = 0x700
14549072e:     	movq	$0x0, 0x38(%rbp)
145490736:     	movl	$0x0, 0x50(%rbp)
14549073d:     	movl	$0x0, 0x56(%rbp)
145490744:     	leaq	0x38(%rbp), %rdx
145490748:     	movq	%r12, %rcx
14549074b:     	xorl	%r8d, %r8d
14549074e:     	callq	0x1454b9930 <.text+0x54b8930>
145490753:     	nop
145490754:     	movq	0x10(%rbp), %rdx
145490758:     	testq	%rdx, %rdx
14549075b:     	je	0x14548fbfd <.text+0x548ebfd>
145490761:     	movl	$0x1, %r8d
145490767:     	movq	%rdi, %rcx
14549076a:     	callq	0x1400021d0 <.text+0x11d0>
14549076f:     	jmp	0x14548fbfd <.text+0x548ebfd>
145490774:     	leaq	0x1(%rdx), %r11
145490778:     	cmpq	%rcx, %r11
14549077b:     	jae	0x145490814 <.text+0x548f814>
145490781:     	movq	%rdx, %r8
145490784:     	subq	%rcx, %r8
145490787:     	leaq	0x2(%r8), %r10
14549078b:     	testb	$0x1, %r8b
14549078f:     	jne	0x14549081c <.text+0x548f81c>
145490795:     	cmpl	$0x7, 0x18(%r9)
14549079a:     	movq	%rdx, %r8
14549079d:     	je	0x1454907b7 <.text+0x548f7b7>
14549079f:     	leaq	0x18(%r9), %r8
1454907a3:     	movq	0x10(%r8), %r11
1454907a7:     	movq	%r11, 0x10(%r9)
1454907ab:     	movups	(%r8), %xmm0
1454907af:     	movups	%xmm0, (%r9)
1454907b3:     	leaq	0x1(%rdx), %r8
1454907b7:     	addq	$0x2, %rdx
1454907bb:     	movq	%rdx, %r11
1454907be:     	movq	%r8, %rdx
1454907c1:     	jmp	0x14549081c <.text+0x548f81c>
1454907c3:     	leaq	0x1(%r9), %rsi
1454907c7:     	cmpq	%rcx, %rsi
1454907ca:     	jae	0x14549088f <.text+0x548f88f>
1454907d0:     	movq	%r9, %r8
1454907d3:     	subq	%rcx, %r8
1454907d6:     	leaq	0x2(%r8), %r11
1454907da:     	testb	$0x1, %r8b
1454907de:     	jne	0x145490894 <.text+0x548f894>
1454907e4:     	movq	%r9, %r8
1454907e7:     	cmpl	%edx, 0x24(%r10)
1454907eb:     	je	0x145490805 <.text+0x548f805>
1454907ed:     	leaq	0x18(%r10), %r8
1454907f1:     	movq	0x10(%r8), %rsi
1454907f5:     	movq	%rsi, 0x10(%r10)
1454907f9:     	movups	(%r8), %xmm0
1454907fd:     	movups	%xmm0, (%r10)
145490801:     	leaq	0x1(%r9), %r8
145490805:     	addq	$0x2, %r9
145490809:     	movq	%r9, %rsi
14549080c:     	movq	%r8, %r9
14549080f:     	jmp	0x145490894 <.text+0x548f894>
145490814:     	movq	%rdx, %r8
145490817:     	jmp	0x1454908fc <.text+0x548f8fc>
14549081c:     	testq	%r10, %r10
14549081f:     	je	0x1454908fc <.text+0x548f8fc>
145490825:     	leaq	(%r11,%r11,2), %r8
145490829:     	leaq	(%rax,%r8,8), %r9
14549082d:     	subq	%r11, %rcx
145490830:     	movq	%rdx, %r8
145490833:     	jmp	0x145490843 <.text+0x548f843>
145490835:     	addq	$0x30, %r9
145490839:     	addq	$-0x2, %rcx
14549083d:     	je	0x1454908fc <.text+0x548f8fc>
145490843:     	cmpl	$0x7, (%r9)
145490847:     	jne	0x145490852 <.text+0x548f852>
145490849:     	cmpl	$0x7, 0x18(%r9)
14549084e:     	je	0x145490835 <.text+0x548f835>
145490850:     	jmp	0x145490871 <.text+0x548f871>
145490852:     	leaq	(%r8,%r8,2), %rdx
145490856:     	movq	0x10(%r9), %r10
14549085a:     	movq	%r10, 0x10(%rax,%rdx,8)
14549085f:     	movups	(%r9), %xmm0
145490863:     	movups	%xmm0, (%rax,%rdx,8)
145490867:     	incq	%r8
14549086a:     	cmpl	$0x7, 0x18(%r9)
14549086f:     	je	0x145490835 <.text+0x548f835>
145490871:     	leaq	0x18(%r9), %rdx
145490875:     	leaq	(%r8,%r8,2), %r10
145490879:     	movq	0x10(%rdx), %r11
14549087d:     	movq	%r11, 0x10(%rax,%r10,8)
145490882:     	movups	(%rdx), %xmm0
145490885:     	movups	%xmm0, (%rax,%r10,8)
14549088a:     	incq	%r8
14549088d:     	jmp	0x145490835 <.text+0x548f835>
14549088f:     	movq	%r9, %r8
145490892:     	jmp	0x1454908fc <.text+0x548f8fc>
145490894:     	testq	%r11, %r11
145490897:     	je	0x1454908fc <.text+0x548f8fc>
145490899:     	leaq	(%rsi,%rsi,2), %r8
14549089d:     	leaq	(%rax,%r8,8), %r10
1454908a1:     	subq	%rsi, %rcx
1454908a4:     	movq	%r9, %r8
1454908a7:     	jmp	0x1454908b3 <.text+0x548f8b3>
1454908a9:     	addq	$0x30, %r10
1454908ad:     	addq	$-0x2, %rcx
1454908b1:     	je	0x1454908fc <.text+0x548f8fc>
1454908b3:     	cmpl	%edx, 0xc(%r10)
1454908b7:     	jne	0x1454908c1 <.text+0x548f8c1>
1454908b9:     	cmpl	%edx, 0x24(%r10)
1454908bd:     	je	0x1454908a9 <.text+0x548f8a9>
1454908bf:     	jmp	0x1454908e0 <.text+0x548f8e0>
1454908c1:     	leaq	(%r8,%r8,2), %r9
1454908c5:     	movq	0x10(%r10), %r11
1454908c9:     	movq	%r11, 0x10(%rax,%r9,8)
1454908ce:     	movups	(%r10), %xmm0
1454908d2:     	movups	%xmm0, (%rax,%r9,8)
1454908d7:     	incq	%r8
1454908da:     	cmpl	%edx, 0x24(%r10)
1454908de:     	je	0x1454908a9 <.text+0x548f8a9>
1454908e0:     	leaq	(%r8,%r8,2), %r9
1454908e4:     	movq	0x28(%r10), %r11
1454908e8:     	movq	%r11, 0x10(%rax,%r9,8)
1454908ed:     	movups	0x18(%r10), %xmm0
1454908f2:     	movups	%xmm0, (%rax,%r9,8)
1454908f7:     	incq	%r8
1454908fa:     	jmp	0x1454908a9 <.text+0x548f8a9>
1454908fc:     	movq	%r8, 0x300(%r12)
145490904:     	jmp	0x14548f629 <.text+0x548e629>
145490909:     	movl	$0x1, %ecx
14549090e:     	movl	$0x20, %edx
145490913:     	callq	0x1458e721b <.text+0x58e621b>
145490918:     	ud2
