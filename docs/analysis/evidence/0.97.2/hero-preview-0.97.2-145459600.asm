
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145459600:     	pushq	%rbp
145459601:     	pushq	%r15
145459603:     	pushq	%r14
145459605:     	pushq	%r12
145459607:     	pushq	%rsi
145459608:     	pushq	%rdi
145459609:     	pushq	%rbx
14545960a:     	subq	$0xa0, %rsp
145459611:     	leaq	0x80(%rsp), %rbp
145459619:     	movq	$-0x2, 0x18(%rbp)
145459621:     	movq	%rcx, %rsi
145459624:     	decb	%r8b
145459627:     	movzbl	%dl, %eax
14545962a:     	decl	%eax
14545962c:     	cmpl	$0x7, %eax
14545962f:     	ja	0x145459795 <.text+0x5458795>
145459635:     	leaq	0x15320c0(%rip), %rcx   # 0x14698b6fc
14545963c:     	movslq	(%rcx,%rax,4), %rax
145459640:     	addq	%rcx, %rax
145459643:     	jmpq	*%rax
145459645:     	movl	$0x4, %r15d
14545964b:     	cmpb	$0xb, %r8b
14545964f:     	jae	0x1454597c8 <.text+0x54587c8>
145459655:     	movzbl	%r8b, %eax
145459659:     	movl	$0x5df, %ecx            # imm = 0x5DF
14545965e:     	btl	%eax, %ecx
145459661:     	jb	0x1454597af <.text+0x54587af>
145459667:     	jmp	0x1454597c8 <.text+0x54587c8>
14545966c:     	movl	$0x4, %r15d
145459672:     	cmpb	$0xb, %r8b
145459676:     	jae	0x1454597c8 <.text+0x54587c8>
14545967c:     	movzbl	%r8b, %eax
145459680:     	movl	$0x5df, %ecx            # imm = 0x5DF
145459685:     	btl	%eax, %ecx
145459688:     	jae	0x1454597c8 <.text+0x54587c8>
14545968e:     	leaq	0x15317f3(%rip), %rax   # 0x14698ae88
145459695:     	jmp	0x1454597b6 <.text+0x54587b6>
14545969a:     	movl	$0x4, %r15d
1454596a0:     	cmpb	$0xb, %r8b
1454596a4:     	jae	0x1454597c8 <.text+0x54587c8>
1454596aa:     	movzbl	%r8b, %eax
1454596ae:     	movl	$0x5df, %ecx            # imm = 0x5DF
1454596b3:     	btl	%eax, %ecx
1454596b6:     	jae	0x1454597c8 <.text+0x54587c8>
1454596bc:     	leaq	0x1531715(%rip), %rax   # 0x14698add8
1454596c3:     	jmp	0x1454597b6 <.text+0x54587b6>
1454596c8:     	movl	$0x4, %r15d
1454596ce:     	cmpb	$0xb, %r8b
1454596d2:     	jae	0x1454597c8 <.text+0x54587c8>
1454596d8:     	movzbl	%r8b, %eax
1454596dc:     	movl	$0x5df, %ecx            # imm = 0x5DF
1454596e1:     	btl	%eax, %ecx
1454596e4:     	jae	0x1454597c8 <.text+0x54587c8>
1454596ea:     	leaq	0x153173f(%rip), %rax   # 0x14698ae30
1454596f1:     	jmp	0x1454597b6 <.text+0x54587b6>
1454596f6:     	movl	$0x4, %r15d
1454596fc:     	cmpb	$0xb, %r8b
145459700:     	jae	0x1454597c8 <.text+0x54587c8>
145459706:     	movzbl	%r8b, %eax
14545970a:     	movl	$0x5df, %ecx            # imm = 0x5DF
14545970f:     	btl	%eax, %ecx
145459712:     	jae	0x1454597c8 <.text+0x54587c8>
145459718:     	leaq	0x1531871(%rip), %rax   # 0x14698af90
14545971f:     	jmp	0x1454597b6 <.text+0x54587b6>
145459724:     	movl	$0x4, %r15d
14545972a:     	cmpb	$0xb, %r8b
14545972e:     	jae	0x1454597c8 <.text+0x54587c8>
145459734:     	movzbl	%r8b, %eax
145459738:     	movl	$0x5df, %ecx            # imm = 0x5DF
14545973d:     	btl	%eax, %ecx
145459740:     	jae	0x1454597c8 <.text+0x54587c8>
145459746:     	leaq	0x1531633(%rip), %rax   # 0x14698ad80
14545974d:     	jmp	0x1454597b6 <.text+0x54587b6>
14545974f:     	movl	$0x4, %r15d
145459755:     	cmpb	$0xb, %r8b
145459759:     	jae	0x1454597c8 <.text+0x54587c8>
14545975b:     	movzbl	%r8b, %eax
14545975f:     	movl	$0x5df, %ecx            # imm = 0x5DF
145459764:     	btl	%eax, %ecx
145459767:     	jae	0x1454597c8 <.text+0x54587c8>
145459769:     	leaq	0x1531770(%rip), %rax   # 0x14698aee0
145459770:     	jmp	0x1454597b6 <.text+0x54587b6>
145459772:     	movl	$0x4, %r15d
145459778:     	cmpb	$0xb, %r8b
14545977c:     	jae	0x1454597c8 <.text+0x54587c8>
14545977e:     	movzbl	%r8b, %eax
145459782:     	movl	$0x5df, %ecx            # imm = 0x5DF
145459787:     	btl	%eax, %ecx
14545978a:     	jae	0x1454597c8 <.text+0x54587c8>
14545978c:     	leaq	0x15317a5(%rip), %rax   # 0x14698af38
145459793:     	jmp	0x1454597b6 <.text+0x54587b6>
145459795:     	movl	$0x4, %r15d
14545979b:     	cmpb	$0xb, %r8b
14545979f:     	jae	0x1454597c8 <.text+0x54587c8>
1454597a1:     	movzbl	%r8b, %eax
1454597a5:     	movl	$0x5df, %ecx            # imm = 0x5DF
1454597aa:     	btl	%eax, %ecx
1454597ad:     	jae	0x1454597c8 <.text+0x54587c8>
1454597af:     	leaq	0x1531832(%rip), %rax   # 0x14698afe8
1454597b6:     	movzbl	%r8b, %ecx
1454597ba:     	movq	(%rax,%rcx,8), %rax
1454597be:     	movq	0x8(%rax), %r15
1454597c2:     	movq	0x10(%rax), %rax
1454597c6:     	jmp	0x1454597ca <.text+0x54587ca>
1454597c8:     	xorl	%eax, %eax
1454597ca:     	xorps	%xmm0, %xmm0
1454597cd:     	movups	%xmm0, 0x3c(%rsi)
1454597d1:     	movups	%xmm0, 0x30(%rsi)
1454597d5:     	movups	%xmm0, 0x20(%rsi)
1454597d9:     	movups	%xmm0, 0x10(%rsi)
1454597dd:     	movups	%xmm0, (%rsi)
1454597e0:     	leaq	(%r15,%rax,4), %r12
1454597e4:     	leaq	-0x58(%rbp), %rdi
1454597e8:     	nopl	(%rax,%rax)
1454597f0:     	cmpq	%r12, %r15
1454597f3:     	je	0x14545985c <.text+0x545885c>
1454597f5:     	movl	(%r15), %edx
1454597f8:     	addq	$0x4, %r15
1454597fc:     	movq	%rdi, %rcx
1454597ff:     	callq	0x1454598d0 <.text+0x54588d0>
145459804:     	cmpq	$-0x1, -0x58(%rbp)
145459809:     	je	0x1454597f0 <.text+0x54587f0>
14545980b:     	movzbl	0x10(%rbp), %ecx
14545980f:     	cmpq	$0x13, %rcx
145459813:     	jae	0x145459871 <.text+0x5458871>
145459815:     	movq	-0x58(%rbp), %rdx
145459819:     	movq	-0x50(%rbp), %rax
14545981d:     	movq	-0x40(%rbp), %rbx
145459821:     	movq	-0x38(%rbp), %r14
145459825:     	movl	-0x8(%rbp), %r8d
145459829:     	movl	%r8d, (%rsi,%rcx,4)
14545982d:     	testq	%rdx, %rdx
145459830:     	je	0x145459840 <.text+0x5458840>
145459832:     	movl	$0x1, %r8d
145459838:     	movq	%rax, %rcx
14545983b:     	callq	0x1400021d0 <.text+0x11d0>
145459840:     	testq	%rbx, %rbx
145459843:     	je	0x1454597f0 <.text+0x54587f0>
145459845:     	shlq	$0x3, %rbx
145459849:     	movl	$0x4, %r8d
14545984f:     	movq	%r14, %rcx
145459852:     	movq	%rbx, %rdx
145459855:     	callq	0x1400021d0 <.text+0x11d0>
14545985a:     	jmp	0x1454597f0 <.text+0x54587f0>
14545985c:     	movq	%rsi, %rax
14545985f:     	addq	$0xa0, %rsp
145459866:     	popq	%rbx
145459867:     	popq	%rdi
145459868:     	popq	%rsi
145459869:     	popq	%r12
14545986b:     	popq	%r14
14545986d:     	popq	%r15
14545986f:     	popq	%rbp
145459870:     	retq
145459871:     	leaq	0x152e0d0(%rip), %r8    # 0x146987948
145459878:     	movl	$0x13, %edx
14545987d:     	callq	0x1458e75b3 <.text+0x58e65b3>
145459882:     	nop
145459883:     	ud2
