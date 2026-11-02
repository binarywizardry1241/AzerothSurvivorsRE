
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140062560:     	pushq	%rbp
140062561:     	pushq	%r14
140062563:     	pushq	%rsi
140062564:     	pushq	%rdi
140062565:     	pushq	%rbx
140062566:     	subq	$0x130, %rsp            # imm = 0x130
14006256d:     	leaq	0x80(%rsp), %rbp
140062575:     	movq	$-0x2, 0xa8(%rbp)
140062580:     	movq	%r8, %rdi
140062583:     	movq	%rdx, %rsi
140062586:     	movzbl	(%r8), %r14d
14006258a:     	cmpb	$0x2, %r14b
14006258e:     	jne	0x1400625d9 <.text+0x615d9>
140062590:     	movq	$0x1, 0x20(%rsp)
140062599:     	leaq	0x58b16f8(%rip), %rdx   # 0x145913c98
1400625a0:     	leaq	0x58b1685(%rip), %rbx   # 0x145913c2c
1400625a7:     	movl	$0xb, %r8d
1400625ad:     	movq	%rsi, %rcx
1400625b0:     	movq	%rbx, %r9
1400625b3:     	callq	0x14064b4e0 <.text+0x64a4e0>
1400625b8:     	movq	$0x1, 0x20(%rsp)
1400625c1:     	leaq	0x58b16db(%rip), %rdx   # 0x145913ca3
1400625c8:     	movl	$0xb, %r8d
1400625ce:     	movq	%rsi, %rcx
1400625d1:     	movq	%rbx, %r9
1400625d4:     	callq	0x14064b4e0 <.text+0x64a4e0>
1400625d9:     	leaq	0x58b16b8(%rip), %r8    # 0x145913c98
1400625e0:     	leaq	-0x58(%rbp), %rcx
1400625e4:     	movl	$0xb, %r9d
1400625ea:     	movq	%rsi, %rdx
1400625ed:     	callq	0x14064e700 <.text+0x64d700>
1400625f2:     	movq	-0x58(%rbp), %rax
1400625f6:     	cmpq	$-0x1, %rax
1400625fa:     	je	0x140062632 <.text+0x61632>
1400625fc:     	movq	%rax, 0x98(%rbp)
140062603:     	movq	-0x50(%rbp), %rcx
140062607:     	movq	-0x48(%rbp), %rdx
14006260b:     	movq	%rcx, 0x90(%rbp)
140062612:     	callq	0x1400a4890 <.text+0xa3890>
140062617:     	nop
140062618:     	cmpq	$0x1, %rdx
14006261c:     	jne	0x140062636 <.text+0x61636>
14006261e:     	cmpb	$0x31, (%rax)
140062621:     	sete	%bl
140062624:     	movq	0x98(%rbp), %rdx
14006262b:     	testq	%rdx, %rdx
14006262e:     	jne	0x140062644 <.text+0x61644>
140062630:     	jmp	0x140062656 <.text+0x61656>
140062632:     	xorl	%ebx, %ebx
140062634:     	jmp	0x140062656 <.text+0x61656>
140062636:     	xorl	%ebx, %ebx
140062638:     	movq	0x98(%rbp), %rdx
14006263f:     	testq	%rdx, %rdx
140062642:     	je	0x140062656 <.text+0x61656>
140062644:     	movl	$0x1, %r8d
14006264a:     	movq	0x90(%rbp), %rcx
140062651:     	callq	0x1400021d0 <.text+0x11d0>
140062656:     	cmpb	$0x2, %r14b
14006265a:     	je	0x140062669 <.text+0x61669>
14006265c:     	xorb	%bl, %r14b
14006265f:     	testb	$0x1, %r14b
140062663:     	je	0x140062772 <.text+0x61772>
140062669:     	movb	%bl, (%rdi)
14006266b:     	cmpq	$0x0, 0x90(%rsi)
140062673:     	je	0x1400628dd <.text+0x618dd>
140062679:     	movq	0x78(%rsi), %rax
14006267d:     	movq	0x80(%rsi), %rcx
140062684:     	movabsq	$0x4a721453ca25c1be, %rdx # imm = 0x4A721453CA25C1BE
14006268e:     	xorl	%r8d, %r8d
140062691:     	movdqa	0x58b0aa7(%rip), %xmm0  # 0x145913140
140062699:     	pcmpeqd	%xmm1, %xmm1
14006269d:     	movdqa	0x58b0aab(%rip), %xmm2  # 0x145913150
1400626a5:     	andq	%rcx, %rdx
1400626a8:     	movdqu	(%rax,%rdx), %xmm3
1400626ad:     	movdqa	%xmm3, %xmm4
1400626b1:     	pcmpeqb	%xmm0, %xmm4
1400626b5:     	pmovmskb	%xmm4, %r9d
1400626ba:     	testl	%r9d, %r9d
1400626bd:     	je	0x1400626f7 <.text+0x616f7>
1400626bf:     	tzcntl	%r9d, %r10d
1400626c4:     	addq	%rdx, %r10
1400626c7:     	andq	%rcx, %r10
1400626ca:     	negq	%r10
1400626cd:     	leaq	(%r10,%r10,2), %r10
1400626d1:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1400626d8:     	pcmpeqb	%xmm2, %xmm4
1400626dc:     	pmovmskb	%xmm4, %r11d
1400626e1:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1400626e8:     	je	0x140062716 <.text+0x61716>
1400626ea:     	leal	-0x1(%r9), %r10d
1400626ee:     	andw	%r9w, %r10w
1400626f2:     	movl	%r10d, %r9d
1400626f5:     	jne	0x1400626bf <.text+0x616bf>
1400626f7:     	pcmpeqb	%xmm1, %xmm3
1400626fb:     	pmovmskb	%xmm3, %r9d
140062700:     	testl	%r9d, %r9d
140062703:     	jne	0x1400628dd <.text+0x618dd>
140062709:     	addq	%r8, %rdx
14006270c:     	addq	$0x10, %rdx
140062710:     	addq	$0x10, %r8
140062714:     	jmp	0x1400626a5 <.text+0x616a5>
140062716:     	leaq	(%rax,%r10,8), %rax
14006271a:     	movq	-0x8(%rax), %rax
14006271e:     	cmpq	0x218(%rsi), %rax
140062725:     	jae	0x1400628dd <.text+0x618dd>
14006272b:     	movq	0x210(%rsi), %rcx
140062732:     	movq	(%rcx,%rax,8), %rcx
140062736:     	testq	%rcx, %rcx
140062739:     	je	0x1400628dd <.text+0x618dd>
14006273f:     	movq	0x1e0(%rsi), %rax
140062746:     	notq	%rcx
140062749:     	imulq	$0x38, %rcx, %rcx
14006274d:     	cmpb	$0x0, 0x30(%rax,%rcx)
140062752:     	je	0x1400628dd <.text+0x618dd>
140062758:     	addq	%rcx, %rax
14006275b:     	movq	0x10(%rax), %rcx
14006275f:     	movb	%bl, -0x54(%rbp)
140062762:     	movl	$0x15, -0x58(%rbp)
140062769:     	leaq	-0x58(%rbp), %rdx
14006276d:     	callq	0x140044cc0 <.text+0x43cc0>
140062772:     	leaq	0x58b152a(%rip), %r8    # 0x145913ca3
140062779:     	leaq	-0x58(%rbp), %rcx
14006277d:     	movl	$0xb, %r9d
140062783:     	movq	%rsi, %rdx
140062786:     	callq	0x14064e700 <.text+0x64d700>
14006278b:     	movq	-0x58(%rbp), %rax
14006278f:     	cmpq	$-0x1, %rax
140062793:     	je	0x14006295a <.text+0x6195a>
140062799:     	movq	%rax, 0x98(%rbp)
1400627a0:     	movq	-0x50(%rbp), %rcx
1400627a4:     	movq	-0x48(%rbp), %rdx
1400627a8:     	movq	%rcx, 0x90(%rbp)
1400627af:     	callq	0x1400a4890 <.text+0xa3890>
1400627b4:     	nop
1400627b5:     	cmpq	$0x1, %rdx
1400627b9:     	jne	0x1400628b9 <.text+0x618b9>
1400627bf:     	movzbl	(%rax), %ebx
1400627c2:     	movq	0x98(%rbp), %rdx
1400627c9:     	testq	%rdx, %rdx
1400627cc:     	je	0x1400627e0 <.text+0x617e0>
1400627ce:     	movl	$0x1, %r8d
1400627d4:     	movq	0x90(%rbp), %rcx
1400627db:     	callq	0x1400021d0 <.text+0x11d0>
1400627e0:     	cmpb	$0x31, %bl
1400627e3:     	jne	0x14006295a <.text+0x6195a>
1400627e9:     	movq	$0x1, 0x20(%rsp)
1400627f2:     	leaq	0x58b14aa(%rip), %rdx   # 0x145913ca3
1400627f9:     	leaq	0x58b142c(%rip), %r9    # 0x145913c2c
140062800:     	movl	$0xb, %r8d
140062806:     	movq	%rsi, %rcx
140062809:     	callq	0x14064edd0 <.text+0x64ddd0>
14006280e:     	cmpq	$0x0, 0x90(%rsi)
140062816:     	je	0x140062968 <.text+0x61968>
14006281c:     	movq	0x78(%rsi), %rax
140062820:     	movq	0x80(%rsi), %rcx
140062827:     	movabsq	$0x4a721453ca25c1be, %rdx # imm = 0x4A721453CA25C1BE
140062831:     	xorl	%r8d, %r8d
140062834:     	movdqa	0x58b0904(%rip), %xmm0  # 0x145913140
14006283c:     	pcmpeqd	%xmm1, %xmm1
140062840:     	movdqa	0x58b0908(%rip), %xmm2  # 0x145913150
140062848:     	andq	%rcx, %rdx
14006284b:     	movdqu	(%rax,%rdx), %xmm3
140062850:     	movdqa	%xmm3, %xmm4
140062854:     	pcmpeqb	%xmm0, %xmm4
140062858:     	pmovmskb	%xmm4, %r9d
14006285d:     	testl	%r9d, %r9d
140062860:     	je	0x14006289a <.text+0x6189a>
140062862:     	tzcntl	%r9d, %r10d
140062867:     	addq	%rdx, %r10
14006286a:     	andq	%rcx, %r10
14006286d:     	negq	%r10
140062870:     	leaq	(%r10,%r10,2), %r10
140062874:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14006287b:     	pcmpeqb	%xmm2, %xmm4
14006287f:     	pmovmskb	%xmm4, %r11d
140062884:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14006288b:     	je	0x14006290c <.text+0x6190c>
14006288d:     	leal	-0x1(%r9), %r10d
140062891:     	andw	%r9w, %r10w
140062895:     	movl	%r10d, %r9d
140062898:     	jne	0x140062862 <.text+0x61862>
14006289a:     	pcmpeqb	%xmm1, %xmm3
14006289e:     	pmovmskb	%xmm3, %r9d
1400628a3:     	testl	%r9d, %r9d
1400628a6:     	jne	0x140062968 <.text+0x61968>
1400628ac:     	addq	%r8, %rdx
1400628af:     	addq	$0x10, %rdx
1400628b3:     	addq	$0x10, %r8
1400628b7:     	jmp	0x140062848 <.text+0x61848>
1400628b9:     	movq	0x98(%rbp), %rdx
1400628c0:     	testq	%rdx, %rdx
1400628c3:     	je	0x14006295a <.text+0x6195a>
1400628c9:     	movl	$0x1, %r8d
1400628cf:     	movq	0x90(%rbp), %rcx
1400628d6:     	callq	0x1400021d0 <.text+0x11d0>
1400628db:     	jmp	0x14006295a <.text+0x6195a>
1400628dd:     	leaq	0xa7(%rbp), %rax
1400628e4:     	movq	%rax, -0x58(%rbp)
1400628e8:     	leaq	0x4fa8f51(%rip), %rax   # 0x14500b840 <.text+0x500a840>
1400628ef:     	movq	%rax, -0x50(%rbp)
1400628f3:     	leaq	0x58b0b2e(%rip), %rcx   # 0x145913428
1400628fa:     	leaq	0x58b13af(%rip), %r8    # 0x145913cb0
140062901:     	leaq	-0x58(%rbp), %rdx
140062905:     	callq	0x145903d10 <.text+0x5902d10>
14006290a:     	ud2
14006290c:     	leaq	(%rax,%r10,8), %rax
140062910:     	movq	-0x8(%rax), %rax
140062914:     	cmpq	0x218(%rsi), %rax
14006291b:     	jae	0x140062968 <.text+0x61968>
14006291d:     	movq	0x210(%rsi), %rcx
140062924:     	movq	(%rcx,%rax,8), %rcx
140062928:     	testq	%rcx, %rcx
14006292b:     	je	0x140062968 <.text+0x61968>
14006292d:     	movq	0x1e0(%rsi), %rax
140062934:     	notq	%rcx
140062937:     	imulq	$0x38, %rcx, %rcx
14006293b:     	cmpb	$0x0, 0x30(%rax,%rcx)
140062940:     	je	0x140062968 <.text+0x61968>
140062942:     	addq	%rcx, %rax
140062945:     	movq	0x10(%rax), %rcx
140062949:     	movl	$0x16, -0x58(%rbp)
140062950:     	leaq	-0x58(%rbp), %rdx
140062954:     	callq	0x140044cc0 <.text+0x43cc0>
140062959:     	nop
14006295a:     	addq	$0x130, %rsp            # imm = 0x130
140062961:     	popq	%rbx
140062962:     	popq	%rdi
140062963:     	popq	%rsi
140062964:     	popq	%r14
140062966:     	popq	%rbp
140062967:     	retq
140062968:     	leaq	0xa7(%rbp), %rax
14006296f:     	movq	%rax, -0x58(%rbp)
140062973:     	leaq	0x4fa8ec6(%rip), %rax   # 0x14500b840 <.text+0x500a840>
14006297a:     	movq	%rax, -0x50(%rbp)
14006297e:     	leaq	0x58b0aa3(%rip), %rcx   # 0x145913428
140062985:     	leaq	0x58b133c(%rip), %r8    # 0x145913cc8
14006298c:     	leaq	-0x58(%rbp), %rdx
140062990:     	callq	0x145903d10 <.text+0x5902d10>
140062995:     	ud2
