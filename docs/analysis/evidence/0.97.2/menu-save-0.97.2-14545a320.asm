
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545a320:     	pushq	%rbp
14545a321:     	pushq	%r15
14545a323:     	pushq	%r14
14545a325:     	pushq	%r13
14545a327:     	pushq	%r12
14545a329:     	pushq	%rsi
14545a32a:     	pushq	%rdi
14545a32b:     	pushq	%rbx
14545a32c:     	subq	$0x188, %rsp            # imm = 0x188
14545a333:     	leaq	0x80(%rsp), %rbp
14545a33b:     	movq	$-0x2, 0x100(%rbp)
14545a346:     	movq	%rcx, %rsi
14545a349:     	leal	-0x15f91(%rdx), %ecx
14545a34f:     	cmpl	$0x18, %ecx
14545a352:     	setb	%al
14545a355:     	movl	$0xfffc3f, %r8d         # imm = 0xFFFC3F
14545a35b:     	shrl	%cl, %r8d
14545a35e:     	andb	%al, %r8b
14545a361:     	cmpb	$0x1, %r8b
14545a365:     	jne	0x14545a40a <.text+0x545940a>
14545a36b:     	movl	%ecx, %eax
14545a36d:     	leaq	0x1530ce4(%rip), %rcx   # 0x14698b058
14545a374:     	movq	(%rcx,%rax,8), %r13
14545a378:     	leaq	0x30(%r13), %rax
14545a37c:     	movl	0x30(%r13), %r12d
14545a380:     	movq	%rax, 0xb8(%rbp)
14545a387:     	leaq	0x2c3cb2(%rip), %rax    # 0x14571e040 <.text+0x571d040>
14545a38e:     	movq	%rax, 0xc0(%rbp)
14545a395:     	leaq	0x152bd6d(%rip), %rdx   # 0x146986109
14545a39c:     	leaq	0x10(%rbp), %rcx
14545a3a0:     	leaq	0xb8(%rbp), %r8
14545a3a7:     	callq	0x14570bf80 <.text+0x570af80>
14545a3ac:     	movq	0x18(%rbp), %rcx
14545a3b0:     	movq	0x20(%rbp), %rdx
14545a3b4:     	movq	(%r13), %rbx
14545a3b8:     	movq	0x8(%r13), %r15
14545a3bc:     	movq	%rcx, 0xf0(%rbp)
14545a3c3:     	callq	0x145452400 <.text+0x5451400>
14545a3c8:     	nop
14545a3c9:     	movq	%rax, %r14
14545a3cc:     	movq	%rdx, %rdi
14545a3cf:     	movq	0x10(%rbp), %rdx
14545a3d3:     	testq	%rdx, %rdx
14545a3d6:     	je	0x14545a3ea <.text+0x54593ea>
14545a3d8:     	movl	$0x1, %r8d
14545a3de:     	movq	0xf0(%rbp), %rcx
14545a3e5:     	callq	0x1400021d0 <.text+0x11d0>
14545a3ea:     	testq	%r14, %r14
14545a3ed:     	cmovneq	%r14, %rbx
14545a3f1:     	cmoveq	%r15, %rdi
14545a3f5:     	testq	%rdi, %rdi
14545a3f8:     	jns	0x14545a435 <.text+0x5459435>
14545a3fa:     	xorl	%r15d, %r15d
14545a3fd:     	movq	%r15, %rcx
14545a400:     	movq	%rdi, %rdx
14545a403:     	callq	0x1458e721b <.text+0x58e621b>
14545a408:     	ud2
14545a40a:     	leal	-0x1(%rdx), %eax
14545a40d:     	cmpl	$0x1869f, %eax          # imm = 0x1869F
14545a412:     	jae	0x14545a421 <.text+0x5459421>
14545a414:     	movq	%rsi, %rcx
14545a417:     	callq	0x1454598d0 <.text+0x54588d0>
14545a41c:     	jmp	0x14545a5c0 <.text+0x54595c0>
14545a421:     	cmpl	$0x186a0, %edx          # imm = 0x186A0
14545a427:     	jae	0x14545a46e <.text+0x545946e>
14545a429:     	movq	$-0x1, (%rsi)
14545a430:     	jmp	0x14545a5c0 <.text+0x54595c0>
14545a435:     	je	0x14545a559 <.text+0x5459559>
14545a43b:     	callq	0x140002200 <.text+0x1200>
14545a440:     	movl	$0x1, %r15d
14545a446:     	movl	$0x1, %edx
14545a44b:     	movq	%rdi, %rcx
14545a44e:     	callq	0x1400021c0 <.text+0x11c0>
14545a453:     	testq	%rax, %rax
14545a456:     	je	0x14545a3fd <.text+0x54593fd>
14545a458:     	movq	%rax, %r14
14545a45b:     	movq	%rax, %rcx
14545a45e:     	movq	%rbx, %rdx
14545a461:     	movq	%rdi, %r8
14545a464:     	callq	0x145756ddd <.text+0x5755ddd>
14545a469:     	jmp	0x14545a55f <.text+0x545955f>
14545a46e:     	leal	-0x186a0(%rdx), %eax
14545a474:     	imulq	$0x51eb851f, %rax, %r12 # imm = 0x51EB851F
14545a47b:     	shrq	$0x25, %r12
14545a47f:     	imulq	$0x1999999a, %r12, %rcx # imm = 0x1999999A
14545a486:     	shrq	$0x20, %rcx
14545a48a:     	addl	%ecx, %ecx
14545a48c:     	leal	(%rcx,%rcx,4), %ecx
14545a48f:     	subl	%ecx, %r12d
14545a492:     	movq	%r12, -0x40(%rbp)
14545a496:     	imull	$0xcccccccd, %eax, %ecx # imm = 0xCCCCCCCD
14545a49c:     	rorl	%ecx
14545a49e:     	cmpl	$0x19999999, %ecx       # imm = 0x19999999
14545a4a4:     	ja	0x14545a429 <.text+0x5459429>
14545a4a6:     	cmpl	$0x2edf, %eax           # imm = 0x2EDF
14545a4ab:     	ja	0x14545a429 <.text+0x5459429>
14545a4b1:     	movl	$0xcccccccd, %r15d      # imm = 0xCCCCCCCD
14545a4b7:     	imulq	%rax, %r15
14545a4bb:     	shrq	$0x23, %r15
14545a4bf:     	imulq	$0x1999999a, %r15, %rcx # imm = 0x1999999A
14545a4c6:     	shrq	$0x20, %rcx
14545a4ca:     	addl	%ecx, %ecx
14545a4cc:     	leal	(%rcx,%rcx,4), %ecx
14545a4cf:     	subl	%ecx, %r15d
14545a4d2:     	cmpl	$0x7, %r15d
14545a4d6:     	jae	0x14545a429 <.text+0x5459429>
14545a4dc:     	imulq	$0x10624dd3, %rax, %rdi # imm = 0x10624DD3
14545a4e3:     	shrq	$0x26, %rdi
14545a4e7:     	leal	-0x1(%rdi), %eax
14545a4ea:     	cmpb	$0xa, %al
14545a4ec:     	ja	0x14545a429 <.text+0x5459429>
14545a4f2:     	movzbl	%al, %eax
14545a4f5:     	movl	$0x5df, %ecx            # imm = 0x5DF
14545a4fa:     	btl	%eax, %ecx
14545a4fd:     	jae	0x14545a429 <.text+0x5459429>
14545a503:     	leaq	0x1530e9e(%rip), %rcx   # 0x14698b3a8
14545a50a:     	movq	(%rcx,%rax,8), %rbx
14545a50e:     	cmpl	$0x6, %r15d
14545a512:     	movl	$0x5, %eax
14545a517:     	cmovnel	%r15d, %eax
14545a51b:     	movq	%rax, 0xd0(%rbp)
14545a522:     	cmpl	$0x5, %eax
14545a525:     	jne	0x14545a5d7 <.text+0x54595d7>
14545a52b:     	movq	%rdx, %r14
14545a52e:     	movl	%edi, %ecx
14545a530:     	callq	0x14545b700 <.text+0x545a700>
14545a535:     	testq	%rax, %rax
14545a538:     	je	0x14545a429 <.text+0x5459429>
14545a53e:     	movq	%rax, %r13
14545a541:     	xorl	%eax, %eax
14545a543:     	cmpl	$0x6, %r15d
14545a547:     	sete	%al
14545a54a:     	movq	%rax, 0xf0(%rbp)
14545a551:     	movq	%r14, %rdx
14545a554:     	jmp	0x14545a5da <.text+0x54595da>
14545a559:     	movl	$0x1, %r14d
14545a55f:     	movl	0x34(%r13), %eax
14545a563:     	cmpq	$0x1, 0x20(%r13)
14545a568:     	movl	$0x2, %ecx
14545a56d:     	sbbq	$0x0, %rcx
14545a571:     	movq	%rdi, (%rsi)
14545a574:     	movq	%r14, 0x8(%rsi)
14545a578:     	movq	%rdi, 0x10(%rsi)
14545a57c:     	movq	$0x0, 0x18(%rsi)
14545a584:     	movq	$0x4, 0x20(%rsi)
14545a58c:     	movq	$0x0, 0x28(%rsi)
14545a594:     	movq	%rcx, 0x30(%rsi)
14545a598:     	movq	$0x0, 0x38(%rsi)
14545a5a0:     	movq	$0x0, 0x48(%rsi)
14545a5a8:     	movl	%r12d, 0x50(%rsi)
14545a5ac:     	movl	%eax, 0x54(%rsi)
14545a5af:     	movaps	0x152b1da(%rip), %xmm0  # 0x146985790
14545a5b6:     	movups	%xmm0, 0x58(%rsi)
14545a5ba:     	movw	$0x12, 0x68(%rsi)
14545a5c0:     	movq	%rsi, %rax
14545a5c3:     	addq	$0x188, %rsp            # imm = 0x188
14545a5ca:     	popq	%rbx
14545a5cb:     	popq	%rdi
14545a5cc:     	popq	%rsi
14545a5cd:     	popq	%r12
14545a5cf:     	popq	%r13
14545a5d1:     	popq	%r14
14545a5d3:     	popq	%r15
14545a5d5:     	popq	%rbp
14545a5d6:     	retq
14545a5d7:     	xorl	%r13d, %r13d
14545a5da:     	movq	$0x0, -0x30(%rbp)
14545a5e2:     	movq	$0x4, -0x28(%rbp)
14545a5ea:     	movq	$0x0, -0x20(%rbp)
14545a5f2:     	cmpl	$0x8, %r12d
14545a5f6:     	jae	0x14545a9c0 <.text+0x54599c0>
14545a5fc:     	movq	%rdx, -0x38(%rbp)
14545a600:     	movzbl	0x128(%rbx), %eax
14545a607:     	decb	%al
14545a609:     	movzbl	%al, %eax
14545a60c:     	shll	$0x3, %eax
14545a60f:     	leaq	0x1530b02(%rip), %rcx   # 0x14698b118
14545a616:     	movq	(%rax,%rcx), %rcx
14545a61a:     	leaq	0x1530b17(%rip), %rdx   # 0x14698b138
14545a621:     	movq	(%rax,%rdx), %rax
14545a625:     	movq	%rcx, 0x98(%rbp)
14545a62c:     	movq	%rax, 0xa0(%rbp)
14545a633:     	leaq	0x98(%rbp), %rax
14545a63a:     	movq	%rax, 0x10(%rbp)
14545a63e:     	leaq	-0x5458585(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14545a645:     	movq	%rax, 0x18(%rbp)
14545a649:     	leaq	-0x40(%rbp), %rax
14545a64d:     	movq	%rax, 0x20(%rbp)
14545a651:     	leaq	0x2c48d8(%rip), %rax    # 0x14571ef30 <.text+0x571df30>
14545a658:     	movq	%rax, 0x28(%rbp)
14545a65c:     	movb	$0x1, 0xff(%rbp)
14545a663:     	movb	$0x1, 0xfe(%rbp)
14545a66a:     	leaq	0x152d1e5(%rip), %rdx   # 0x146987856
14545a671:     	leaq	0xb8(%rbp), %rcx
14545a678:     	leaq	0x10(%rbp), %r8
14545a67c:     	callq	0x14570bf80 <.text+0x570af80>
14545a681:     	nop
14545a682:     	movq	%r13, -0x8(%rbp)
14545a686:     	movq	%rbx, 0xe0(%rbp)
14545a68d:     	movzbl	0x128(%rbx), %eax
14545a694:     	decb	%al
14545a696:     	movzbl	%al, %eax
14545a699:     	shll	$0x3, %eax
14545a69c:     	leaq	0x1530ab5(%rip), %rcx   # 0x14698b158
14545a6a3:     	movq	(%rax,%rcx), %rcx
14545a6a7:     	movq	%rcx, 0xe8(%rbp)
14545a6ae:     	leaq	0x1530ac3(%rip), %rdx   # 0x14698b178
14545a6b5:     	movq	(%rax,%rdx), %rcx
14545a6b9:     	movq	%rcx, 0xd8(%rbp)
14545a6c0:     	leaq	0x1530ad1(%rip), %r8    # 0x14698b198
14545a6c7:     	movq	(%rax,%r8), %rcx
14545a6cb:     	movq	%rcx, (%rbp)
14545a6cf:     	leaq	0x1530ae2(%rip), %r9    # 0x14698b1b8
14545a6d6:     	movq	(%rax,%r9), %rcx
14545a6da:     	movq	%rcx, 0x8(%rbp)
14545a6de:     	leaq	0x1530af3(%rip), %r10   # 0x14698b1d8
14545a6e5:     	movq	(%rax,%r10), %rcx
14545a6e9:     	movq	%rcx, -0x18(%rbp)
14545a6ed:     	leaq	0x1530b04(%rip), %r11   # 0x14698b1f8
14545a6f4:     	movq	(%rax,%r11), %rcx
14545a6f8:     	movq	%rcx, -0x10(%rbp)
14545a6fc:     	leaq	0x1530b15(%rip), %r14   # 0x14698b218
14545a703:     	movq	(%rax,%r14), %r14
14545a707:     	leaq	0x1530b2a(%rip), %r15   # 0x14698b238
14545a70e:     	movq	(%rax,%r15), %r15
14545a712:     	leaq	0x1530b3f(%rip), %r13   # 0x14698b258
14545a719:     	movq	(%rax,%r13), %r13
14545a71d:     	leaq	0x1530b54(%rip), %rbx   # 0x14698b278
14545a724:     	movq	(%rax,%rbx), %rbx
14545a728:     	leaq	0x1530b69(%rip), %rcx   # 0x14698b298
14545a72f:     	movq	(%rax,%rcx), %rcx
14545a733:     	leaq	0x1530b7e(%rip), %rdx   # 0x14698b2b8
14545a73a:     	movq	(%rax,%rdx), %rdx
14545a73e:     	leaq	0x1530b93(%rip), %r8    # 0x14698b2d8
14545a745:     	movq	(%rax,%r8), %r8
14545a749:     	leaq	0x1530ba8(%rip), %r9    # 0x14698b2f8
14545a750:     	movq	(%rax,%r9), %r9
14545a754:     	leaq	0x1530bbd(%rip), %r10   # 0x14698b318
14545a75b:     	movq	(%rax,%r10), %r10
14545a75f:     	leaq	0x1530bd2(%rip), %r11   # 0x14698b338
14545a766:     	movq	(%rax,%r11), %rax
14545a76a:     	movq	0xe8(%rbp), %r11
14545a771:     	movq	%r11, 0x10(%rbp)
14545a775:     	movq	0xd8(%rbp), %r11
14545a77c:     	movq	%r11, 0x18(%rbp)
14545a780:     	movq	(%rbp), %r11
14545a784:     	movq	%r11, 0x20(%rbp)
14545a788:     	movq	0x8(%rbp), %r11
14545a78c:     	movq	%r11, 0x28(%rbp)
14545a790:     	movq	-0x18(%rbp), %r11
14545a794:     	movq	%r11, 0x30(%rbp)
14545a798:     	movq	-0x10(%rbp), %r11
14545a79c:     	movq	%r11, 0x38(%rbp)
14545a7a0:     	movq	%r14, 0x40(%rbp)
14545a7a4:     	movq	%r15, 0x48(%rbp)
14545a7a8:     	movq	%r13, 0x50(%rbp)
14545a7ac:     	movq	%rbx, 0x58(%rbp)
14545a7b0:     	movq	%rcx, 0x60(%rbp)
14545a7b4:     	movq	%rdx, 0x68(%rbp)
14545a7b8:     	movq	0xb8(%rbp), %rcx
14545a7bf:     	movq	%rcx, 0xe8(%rbp)
14545a7c6:     	movq	%r8, 0x70(%rbp)
14545a7ca:     	movq	0xc0(%rbp), %rcx
14545a7d1:     	movq	%r9, 0x78(%rbp)
14545a7d5:     	movq	0xc8(%rbp), %rdx
14545a7dc:     	movq	%r10, 0x80(%rbp)
14545a7e3:     	movq	%rax, 0x88(%rbp)
14545a7ea:     	movq	%r12, %rax
14545a7ed:     	shlq	$0x4, %rax
14545a7f1:     	movq	0x10(%rbp,%rax), %r15
14545a7f6:     	movq	0x18(%rbp,%rax), %r14
14545a7fb:     	movq	%rcx, 0xd8(%rbp)
14545a802:     	callq	0x145452400 <.text+0x5451400>
14545a807:     	nop
14545a808:     	testq	%rax, %rax
14545a80b:     	cmovneq	%rax, %r15
14545a80f:     	cmoveq	%r14, %rdx
14545a813:     	movq	%r15, -0x50(%rbp)
14545a817:     	movq	%rdx, -0x48(%rbp)
14545a81b:     	movq	0xe8(%rbp), %rdx
14545a822:     	testq	%rdx, %rdx
14545a825:     	movq	-0x8(%rbp), %rbx
14545a829:     	je	0x14545a83d <.text+0x545983d>
14545a82b:     	movl	$0x1, %r8d
14545a831:     	movq	0xd8(%rbp), %rcx
14545a838:     	callq	0x1400021d0 <.text+0x11d0>
14545a83d:     	testq	%rbx, %rbx
14545a840:     	movq	0xe0(%rbp), %r14
14545a847:     	je	0x14545ab10 <.text+0x5459b10>
14545a84d:     	movq	0xf0(%rbp), %r15
14545a854:     	shlq	$0x4, %r15
14545a858:     	addq	%rbx, %r15
14545a85b:     	movq	%r15, 0xb8(%rbp)
14545a862:     	leaq	-0x54587a9(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14545a869:     	movq	%rax, 0xc0(%rbp)
14545a870:     	movb	$0x1, 0xff(%rbp)
14545a877:     	movb	$0x1, 0xfe(%rbp)
14545a87e:     	leaq	0x152cfa6(%rip), %rdx   # 0x14698782b
14545a885:     	leaq	0x10(%rbp), %rcx
14545a889:     	leaq	0xb8(%rbp), %r8
14545a890:     	callq	0x14570bf80 <.text+0x570af80>
14545a895:     	nop
14545a896:     	movq	0x10(%rbp), %rax
14545a89a:     	movq	%rax, 0xe8(%rbp)
14545a8a1:     	movq	0x18(%rbp), %rcx
14545a8a5:     	movq	0x20(%rbp), %rdx
14545a8a9:     	movq	(%r15), %r14
14545a8ac:     	movq	0x8(%r15), %r15
14545a8b0:     	movq	%rcx, 0xd8(%rbp)
14545a8b7:     	callq	0x145452400 <.text+0x5451400>
14545a8bc:     	nop
14545a8bd:     	testq	%rax, %rax
14545a8c0:     	cmovneq	%rax, %r14
14545a8c4:     	cmoveq	%r15, %rdx
14545a8c8:     	movq	%r14, 0x98(%rbp)
14545a8cf:     	movq	%rdx, 0xa0(%rbp)
14545a8d6:     	movq	0xe8(%rbp), %rdx
14545a8dd:     	testq	%rdx, %rdx
14545a8e0:     	je	0x14545a8f4 <.text+0x54598f4>
14545a8e2:     	movl	$0x1, %r8d
14545a8e8:     	movq	0xd8(%rbp), %rcx
14545a8ef:     	callq	0x1400021d0 <.text+0x11d0>
14545a8f4:     	leaq	0x152f42d(%rip), %rax   # 0x146989d28
14545a8fb:     	movq	%rax, 0x10(%rbp)
14545a8ff:     	movq	$0x4, 0x18(%rbp)
14545a907:     	leaq	-0x50(%rbp), %rax
14545a90b:     	movq	%rax, 0x20(%rbp)
14545a90f:     	leaq	0x152f3f2(%rip), %rax   # 0x146989d08
14545a916:     	movq	%rax, 0x28(%rbp)
14545a91a:     	leaq	0x152f40b(%rip), %rcx   # 0x146989d2c
14545a921:     	movq	%rcx, 0x30(%rbp)
14545a925:     	movq	$0x3, 0x38(%rbp)
14545a92d:     	leaq	0x98(%rbp), %rcx
14545a934:     	movq	%rcx, 0x40(%rbp)
14545a938:     	movq	%rax, 0x48(%rbp)
14545a93c:     	movb	$0x1, 0xff(%rbp)
14545a943:     	movb	$0x1, 0xfe(%rbp)
14545a94a:     	movq	$0x2, 0x20(%rsp)
14545a953:     	leaq	0x152f3d5(%rip), %rdx   # 0x146989d2f
14545a95a:     	leaq	0xb8(%rbp), %rcx
14545a961:     	leaq	0x10(%rbp), %r9
14545a965:     	movl	$0x10, %r8d
14545a96b:     	callq	0x1454523b0 <.text+0x54513b0>
14545a970:     	nop
14545a971:     	movq	0xe0(%rbp), %r14
14545a978:     	movq	0xf0(%rbp), %rax
14545a97f:     	shlq	$0x5, %rax
14545a983:     	addq	%rax, %rbx
14545a986:     	movl	0x30(%rbx,%r12,4), %r8d
14545a98b:     	testl	%r8d, %r8d
14545a98e:     	jne	0x14545a998 <.text+0x5459998>
14545a990:     	movl	0xe8(%r14,%r12,4), %r8d
14545a998:     	movq	0xb8(%rbp), %rax
14545a99f:     	movq	%rax, 0xf0(%rbp)
14545a9a6:     	movq	0xc0(%rbp), %rdx
14545a9ad:     	movq	0xc8(%rbp), %rax
14545a9b4:     	movq	%rax, 0xd8(%rbp)
14545a9bb:     	jmp	0x14545ada1 <.text+0x5459da1>
14545a9c0:     	leaq	-0x8(%r12), %rax
14545a9c5:     	cmpq	0x80(%rbx), %rax
14545a9cc:     	jae	0x14545a429 <.text+0x5459429>
14545a9d2:     	leaq	(%rax,%rax,8), %r15
14545a9d6:     	shlq	$0x4, %r15
14545a9da:     	addq	0x78(%rbx), %r15
14545a9de:     	testq	%r13, %r13
14545a9e1:     	je	0x14545ab3d <.text+0x5459b3d>
14545a9e7:     	cmpq	0x28(%r13), %rax
14545a9eb:     	jae	0x14545a429 <.text+0x5459429>
14545a9f1:     	movq	%rdx, -0x38(%rbp)
14545a9f5:     	leaq	(%rax,%rax,2), %rax
14545a9f9:     	shlq	$0x4, %rax
14545a9fd:     	addq	0x20(%r13), %rax
14545aa01:     	movq	0xf0(%rbp), %rcx
14545aa08:     	leaq	(%rcx,%rcx,2), %rcx
14545aa0c:     	movl	(%rax,%rcx,8), %edx
14545aa0f:     	movl	%edx, 0xe8(%rbp)
14545aa15:     	movups	0x8(%rax,%rcx,8), %xmm0
14545aa1a:     	movups	%xmm0, 0x98(%rbp)
14545aa21:     	leaq	0x98(%rbp), %rax
14545aa28:     	movq	%rax, 0xb8(%rbp)
14545aa2f:     	leaq	-0x5458976(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14545aa36:     	movq	%rax, 0xc0(%rbp)
14545aa3d:     	movb	$0x1, 0xff(%rbp)
14545aa44:     	movb	$0x1, 0xfe(%rbp)
14545aa4b:     	leaq	0x152cdcb(%rip), %rdx   # 0x14698781d
14545aa52:     	leaq	0x10(%rbp), %rcx
14545aa56:     	leaq	0xb8(%rbp), %r8
14545aa5d:     	callq	0x14570bf80 <.text+0x570af80>
14545aa62:     	nop
14545aa63:     	movq	0x10(%rbp), %rax
14545aa67:     	movq	%rax, 0xe0(%rbp)
14545aa6e:     	movq	0x18(%rbp), %rcx
14545aa72:     	movq	0x20(%rbp), %rdx
14545aa76:     	movq	0x98(%rbp), %r14
14545aa7d:     	movq	0xa0(%rbp), %rbx
14545aa84:     	movq	%rcx, 0xd8(%rbp)
14545aa8b:     	callq	0x145452400 <.text+0x5451400>
14545aa90:     	nop
14545aa91:     	testq	%rax, %rax
14545aa94:     	cmovneq	%rax, %r14
14545aa98:     	cmoveq	%rbx, %rdx
14545aa9c:     	movq	%rdx, %rbx
14545aa9f:     	movq	$0x1, 0x20(%rsp)
14545aaa8:     	leaq	0x10(%rbp), %rcx
14545aaac:     	movl	$0x1, %r9d
14545aab2:     	xorl	%r8d, %r8d
14545aab5:     	callq	0x14003bf90 <.text+0x3af90>
14545aaba:     	movq	0x18(%rbp), %rax
14545aabe:     	movq	%rax, 0xf0(%rbp)
14545aac5:     	cmpl	$0x1, 0x10(%rbp)
14545aac9:     	je	0x14545b2e5 <.text+0x545a2e5>
14545aacf:     	movq	0x20(%rbp), %r13
14545aad3:     	testq	%rbx, %rbx
14545aad6:     	je	0x14545aae6 <.text+0x5459ae6>
14545aad8:     	movq	%r13, %rcx
14545aadb:     	movq	%r14, %rdx
14545aade:     	movq	%rbx, %r8
14545aae1:     	callq	0x145756ddd <.text+0x5755ddd>
14545aae6:     	movq	0xe0(%rbp), %rdx
14545aaed:     	testq	%rdx, %rdx
14545aaf0:     	je	0x14545ab04 <.text+0x5459b04>
14545aaf2:     	movl	$0x1, %r8d
14545aaf8:     	movq	0xd8(%rbp), %rcx
14545aaff:     	callq	0x1400021d0 <.text+0x11d0>
14545ab04:     	movq	0xd0(%rbp), %rcx
14545ab0b:     	jmp	0x14545afdb <.text+0x5459fdb>
14545ab10:     	movq	0xd0(%rbp), %rcx
14545ab17:     	cmpq	$0x5, %rcx
14545ab1b:     	jae	0x14545b2f8 <.text+0x545a2f8>
14545ab21:     	leaq	(%rcx,%rcx,2), %rax
14545ab25:     	leal	-0x2(%rdi), %ecx
14545ab28:     	cmpb	$0x9, %cl
14545ab2b:     	ja	0x14545ab60 <.text+0x5459b60>
14545ab2d:     	movzbl	%cl, %ecx
14545ab30:     	leaq	0x1530821(%rip), %rdx   # 0x14698b358
14545ab37:     	movq	(%rdx,%rcx,8), %rcx
14545ab3b:     	jmp	0x14545ab67 <.text+0x5459b67>
14545ab3d:     	leal	-0x2(%rdi), %ecx
14545ab40:     	cmpb	$0x9, %cl
14545ab43:     	movq	%rdx, -0x38(%rbp)
14545ab47:     	ja	0x14545ae95 <.text+0x5459e95>
14545ab4d:     	movzbl	%cl, %ecx
14545ab50:     	leaq	0x1530801(%rip), %rdx   # 0x14698b358
14545ab57:     	movq	(%rdx,%rcx,8), %rcx
14545ab5b:     	jmp	0x14545ae9c <.text+0x5459e9c>
14545ab60:     	leaq	0x12bdc01(%rip), %rcx   # 0x146718768
14545ab67:     	movq	(%r14,%rax,8), %rbx
14545ab6b:     	movq	0x8(%r14,%rax,8), %r15
14545ab70:     	movb	0x10(%r14,%rax,8), %r13b
14545ab75:     	addq	$0x10, %rcx
14545ab79:     	movq	%rcx, 0x10(%rbp)
14545ab7d:     	leaq	-0x5458ac4(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14545ab84:     	movq	%rax, 0x18(%rbp)
14545ab88:     	leaq	0xd0(%rbp), %rax
14545ab8f:     	movq	%rax, 0x20(%rbp)
14545ab93:     	leaq	0x2c4396(%rip), %rax    # 0x14571ef30 <.text+0x571df30>
14545ab9a:     	movq	%rax, 0x28(%rbp)
14545ab9e:     	movb	$0x1, 0xff(%rbp)
14545aba5:     	movb	$0x1, 0xfe(%rbp)
14545abac:     	leaq	0x152cc60(%rip), %rdx   # 0x146987813
14545abb3:     	leaq	0xb8(%rbp), %rcx
14545abba:     	leaq	0x10(%rbp), %r8
14545abbe:     	callq	0x14570bf80 <.text+0x570af80>
14545abc3:     	nop
14545abc4:     	movq	0xb8(%rbp), %rax
14545abcb:     	movq	%rax, 0xf0(%rbp)
14545abd2:     	movq	0xc0(%rbp), %rcx
14545abd9:     	movq	0xc8(%rbp), %rdx
14545abe0:     	movq	%rcx, 0xe8(%rbp)
14545abe7:     	callq	0x145452400 <.text+0x5451400>
14545abec:     	nop
14545abed:     	testq	%rax, %rax
14545abf0:     	cmovneq	%rax, %rbx
14545abf4:     	cmoveq	%r15, %rdx
14545abf8:     	movq	%rbx, 0x98(%rbp)
14545abff:     	movq	%rdx, 0xa0(%rbp)
14545ac06:     	movq	0xf0(%rbp), %rdx
14545ac0d:     	testq	%rdx, %rdx
14545ac10:     	je	0x14545ac24 <.text+0x5459c24>
14545ac12:     	movl	$0x1, %r8d
14545ac18:     	movq	0xe8(%rbp), %rcx
14545ac1f:     	callq	0x1400021d0 <.text+0x11d0>
14545ac24:     	leaq	0x152f0fd(%rip), %rax   # 0x146989d28
14545ac2b:     	testb	%r13b, %r13b
14545ac2e:     	je	0x14545aca8 <.text+0x5459ca8>
14545ac30:     	movq	%rax, 0x10(%rbp)
14545ac34:     	movq	$0x4, 0x18(%rbp)
14545ac3c:     	leaq	-0x50(%rbp), %rax
14545ac40:     	movq	%rax, 0x20(%rbp)
14545ac44:     	leaq	0x152f0bd(%rip), %rax   # 0x146989d08
14545ac4b:     	movq	%rax, 0x28(%rbp)
14545ac4f:     	leaq	0x152f0d6(%rip), %rcx   # 0x146989d2c
14545ac56:     	movq	%rcx, 0x30(%rbp)
14545ac5a:     	movq	$0x3, 0x38(%rbp)
14545ac62:     	leaq	0x98(%rbp), %rcx
14545ac69:     	movq	%rcx, 0x40(%rbp)
14545ac6d:     	movq	%rax, 0x48(%rbp)
14545ac71:     	movb	$0x1, 0xff(%rbp)
14545ac78:     	movb	$0x1, 0xfe(%rbp)
14545ac7f:     	movq	$0x2, 0x20(%rsp)
14545ac88:     	leaq	0x152f0c9(%rip), %rdx   # 0x146989d58
14545ac8f:     	leaq	0xb8(%rbp), %rcx
14545ac96:     	leaq	0x10(%rbp), %r9
14545ac9a:     	movl	$0xc, %r8d
14545aca0:     	callq	0x1454523b0 <.text+0x54513b0>
14545aca5:     	nop
14545aca6:     	jmp	0x14545ad1e <.text+0x5459d1e>
14545aca8:     	movq	%rax, 0x10(%rbp)
14545acac:     	movq	$0x4, 0x18(%rbp)
14545acb4:     	leaq	-0x50(%rbp), %rax
14545acb8:     	movq	%rax, 0x20(%rbp)
14545acbc:     	leaq	0x152f045(%rip), %rax   # 0x146989d08
14545acc3:     	movq	%rax, 0x28(%rbp)
14545acc7:     	leaq	0x152f05e(%rip), %rcx   # 0x146989d2c
14545acce:     	movq	%rcx, 0x30(%rbp)
14545acd2:     	movq	$0x3, 0x38(%rbp)
14545acda:     	leaq	0x98(%rbp), %rcx
14545ace1:     	movq	%rcx, 0x40(%rbp)
14545ace5:     	movq	%rax, 0x48(%rbp)
14545ace9:     	movb	$0x1, 0xff(%rbp)
14545acf0:     	movb	$0x1, 0xfe(%rbp)
14545acf7:     	movq	$0x2, 0x20(%rsp)
14545ad00:     	leaq	0x152f028(%rip), %rdx   # 0x146989d2f
14545ad07:     	leaq	0xb8(%rbp), %rcx
14545ad0e:     	leaq	0x10(%rbp), %r9
14545ad12:     	movl	$0x10, %r8d
14545ad18:     	callq	0x1454523b0 <.text+0x54513b0>
14545ad1d:     	nop
14545ad1e:     	movq	0xb8(%rbp), %rcx
14545ad25:     	movq	0xc0(%rbp), %r8
14545ad2c:     	movq	0xc8(%rbp), %rax
14545ad33:     	movq	%rax, 0xd8(%rbp)
14545ad3a:     	leaq	0xd0(%rbp), %rax
14545ad41:     	movq	%rax, 0x10(%rbp)
14545ad45:     	movq	$0x0, 0x18(%rbp)
14545ad4d:     	movq	$0x5, 0x20(%rbp)
14545ad55:     	leaq	0x28(%rbp), %rdx
14545ad59:     	movq	%r14, 0x28(%rbp)
14545ad5d:     	leaq	-0x40(%rbp), %rax
14545ad61:     	movq	%rax, 0x30(%rbp)
14545ad65:     	movq	%r8, %rbx
14545ad68:     	movq	%r8, 0xb0(%rbp)
14545ad6f:     	movq	%rcx, 0xf0(%rbp)
14545ad76:     	movq	%rcx, 0xa8(%rbp)
14545ad7d:     	movb	$0x0, 0xff(%rbp)
14545ad84:     	movb	$0x1, 0xfe(%rbp)
14545ad8b:     	leaq	0x10(%rbp), %rcx
14545ad8f:     	callq	0x145516740 <.text+0x5515740>
14545ad94:     	nop
14545ad95:     	xorl	%r8d, %r8d
14545ad98:     	testb	$0x1, %al
14545ad9a:     	cmovnel	%edx, %r8d
14545ad9e:     	movq	%rbx, %rdx
14545ada1:     	movzbl	0x128(%r14), %ebx
14545ada9:     	cmpl	$0x2, %r12d
14545adad:     	movl	%r8d, 0xe8(%rbp)
14545adb4:     	jne	0x14545ae48 <.text+0x5459e48>
14545adba:     	cmpb	$0x1, %bl
14545adbd:     	jne	0x14545ae48 <.text+0x5459e48>
14545adc3:     	leaq	0x152efba(%rip), %rax   # 0x146989d84
14545adca:     	movzbl	(%r12,%rax), %eax
14545adcf:     	movb	%al, (%rbp)
14545add2:     	movl	$0x2, %eax
14545add7:     	leaq	0x152efce(%rip), %rcx   # 0x146989dac
14545adde:     	movl	$0x14, 0x8(%rbp)
14545ade5:     	leaq	(%rcx,%rax,8), %rax
14545ade9:     	movq	%rcx, 0x10(%rbp)
14545aded:     	movq	%rax, 0x18(%rbp)
14545adf1:     	leaq	0xd0(%rbp), %rax
14545adf8:     	movq	%rax, 0x20(%rbp)
14545adfc:     	movq	%rdx, 0xe0(%rbp)
14545ae03:     	movq	%rdx, 0xb0(%rbp)
14545ae0a:     	movq	0xf0(%rbp), %rax
14545ae11:     	movq	%rax, 0xa8(%rbp)
14545ae18:     	movb	$0x0, 0xff(%rbp)
14545ae1f:     	movb	$0x1, 0xfe(%rbp)
14545ae26:     	leaq	-0x30(%rbp), %rcx
14545ae2a:     	leaq	0x10(%rbp), %rdx
14545ae2e:     	callq	0x1455244c0 <.text+0x55234c0>
14545ae33:     	nop
14545ae34:     	movzbl	%bl, %eax
14545ae37:     	movl	%eax, -0x18(%rbp)
14545ae3a:     	xorl	%ebx, %ebx
14545ae3c:     	movl	$0x4, -0x10(%rbp)
14545ae43:     	jmp	0x14545b076 <.text+0x545a076>
14545ae48:     	leaq	0x152ef15(%rip), %rax   # 0x146989d64
14545ae4f:     	movl	(%rax,%r12,4), %r10d
14545ae53:     	leaq	0x152ef2a(%rip), %rax   # 0x146989d84
14545ae5a:     	movzbl	(%r12,%rax), %r9d
14545ae5f:     	cmpl	$0x6, %r12d
14545ae63:     	movb	%r9b, (%rbp)
14545ae67:     	movl	%r10d, 0x8(%rbp)
14545ae6b:     	ja	0x14545b28e <.text+0x545a28e>
14545ae71:     	movl	%r12d, %eax
14545ae74:     	leaq	0x1530b6d(%rip), %rcx   # 0x14698b9e8
14545ae7b:     	movslq	(%rcx,%rax,4), %rax
14545ae7f:     	addq	%rcx, %rax
14545ae82:     	jmpq	*%rax
14545ae84:     	movl	$0x2, %eax
14545ae89:     	leaq	0x152eefc(%rip), %rcx   # 0x146989d8c
14545ae90:     	jmp	0x14545ade5 <.text+0x5459de5>
14545ae95:     	leaq	0x12bd8cc(%rip), %rcx   # 0x146718768
14545ae9c:     	addq	$0x10, %rcx
14545aea0:     	movq	%rax, 0x98(%rbp)
14545aea7:     	movq	%rcx, 0x10(%rbp)
14545aeab:     	leaq	-0x5458df2(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14545aeb2:     	movq	%rax, 0x18(%rbp)
14545aeb6:     	leaq	0x98(%rbp), %rax
14545aebd:     	movq	%rax, 0x20(%rbp)
14545aec1:     	leaq	0x2c4068(%rip), %rax    # 0x14571ef30 <.text+0x571df30>
14545aec8:     	movq	%rax, 0x28(%rbp)
14545aecc:     	leaq	0xd0(%rbp), %rcx
14545aed3:     	movq	%rcx, 0x30(%rbp)
14545aed7:     	movq	%rax, 0x38(%rbp)
14545aedb:     	movb	$0x1, 0xff(%rbp)
14545aee2:     	movb	$0x1, 0xfe(%rbp)
14545aee9:     	leaq	0x152c913(%rip), %rdx   # 0x146987803
14545aef0:     	leaq	0xb8(%rbp), %rcx
14545aef7:     	leaq	0x10(%rbp), %r8
14545aefb:     	callq	0x14570bf80 <.text+0x570af80>
14545af00:     	nop
14545af01:     	movq	0xb8(%rbp), %rax
14545af08:     	movq	%rax, 0xe0(%rbp)
14545af0f:     	movq	0xc0(%rbp), %rax
14545af16:     	movq	0xd0(%rbp), %rcx
14545af1d:     	cmpq	$0x4, %rcx
14545af21:     	movq	%rax, 0xe8(%rbp)
14545af28:     	ja	0x14545b31a <.text+0x545a31a>
14545af2e:     	movq	0xc8(%rbp), %rdx
14545af35:     	shlq	$0x4, %rcx
14545af39:     	movq	0x8(%r15,%rcx), %r14
14545af3e:     	movq	0x10(%r15,%rcx), %rbx
14545af43:     	movq	%rax, %rcx
14545af46:     	callq	0x145452400 <.text+0x5451400>
14545af4b:     	nop
14545af4c:     	testq	%rax, %rax
14545af4f:     	cmovneq	%rax, %r14
14545af53:     	cmoveq	%rbx, %rdx
14545af57:     	movq	%rdx, %rbx
14545af5a:     	movq	$0x1, 0x20(%rsp)
14545af63:     	leaq	0x10(%rbp), %rcx
14545af67:     	movl	$0x1, %r9d
14545af6d:     	xorl	%r8d, %r8d
14545af70:     	callq	0x14003bf90 <.text+0x3af90>
14545af75:     	movq	0x18(%rbp), %rax
14545af79:     	movq	%rax, 0xf0(%rbp)
14545af80:     	cmpl	$0x1, 0x10(%rbp)
14545af84:     	je	0x14545b2d2 <.text+0x545a2d2>
14545af8a:     	movq	0x20(%rbp), %r13
14545af8e:     	testq	%rbx, %rbx
14545af91:     	je	0x14545afa1 <.text+0x5459fa1>
14545af93:     	movq	%r13, %rcx
14545af96:     	movq	%r14, %rdx
14545af99:     	movq	%rbx, %r8
14545af9c:     	callq	0x145756ddd <.text+0x5755ddd>
14545afa1:     	movq	0xe0(%rbp), %rdx
14545afa8:     	testq	%rdx, %rdx
14545afab:     	je	0x14545afbf <.text+0x5459fbf>
14545afad:     	movl	$0x1, %r8d
14545afb3:     	movq	0xe8(%rbp), %rcx
14545afba:     	callq	0x1400021d0 <.text+0x11d0>
14545afbf:     	movq	0xd0(%rbp), %rcx
14545afc6:     	cmpq	$0x4, %rcx
14545afca:     	ja	0x14545b32e <.text+0x545a32e>
14545afd0:     	movl	0x78(%r15,%rcx,4), %eax
14545afd5:     	movl	%eax, 0xe8(%rbp)
14545afdb:     	cmpl	$0x1, (%r15)
14545afdf:     	movq	%rbx, 0xd8(%rbp)
14545afe6:     	jne	0x14545aff9 <.text+0x5459ff9>
14545afe8:     	cmpq	$0x4, %rcx
14545afec:     	jne	0x14545aff9 <.text+0x5459ff9>
14545afee:     	leaq	0x4(%r15), %rax
14545aff2:     	movl	$0x1, %ebx
14545aff7:     	jmp	0x14545b001 <.text+0x545a001>
14545aff9:     	leaq	0x6c(%r15), %rax
14545affd:     	movl	0x74(%r15), %ebx
14545b001:     	movl	0x68(%r15), %ecx
14545b005:     	movl	%ecx, -0x10(%rbp)
14545b008:     	movl	(%rax), %eax
14545b00a:     	movl	%eax, -0x18(%rbp)
14545b00d:     	movl	0x70(%r15), %eax
14545b011:     	movl	%eax, 0x8(%rbp)
14545b014:     	movzbl	0x8c(%r15), %eax
14545b01c:     	movb	%al, (%rbp)
14545b01f:     	movq	0x58(%r15), %rax
14545b023:     	movq	0x60(%r15), %rcx
14545b027:     	leaq	(%rax,%rcx,8), %rcx
14545b02b:     	movq	%rax, 0x10(%rbp)
14545b02f:     	movq	%rcx, 0x18(%rbp)
14545b033:     	leaq	0xd0(%rbp), %rax
14545b03a:     	movq	%rax, 0x20(%rbp)
14545b03e:     	movq	%r13, 0xe0(%rbp)
14545b045:     	movq	%r13, 0xb0(%rbp)
14545b04c:     	movq	0xf0(%rbp), %rax
14545b053:     	movq	%rax, 0xa8(%rbp)
14545b05a:     	movb	$0x0, 0xff(%rbp)
14545b061:     	movb	$0x1, 0xfe(%rbp)
14545b068:     	leaq	-0x30(%rbp), %rcx
14545b06c:     	leaq	0x10(%rbp), %rdx
14545b070:     	callq	0x145524540 <.text+0x5523540>
14545b075:     	nop
14545b076:     	cmpq	$0x0, 0xd0(%rbp)
14545b07e:     	je	0x14545b1b9 <.text+0x545a1b9>
14545b084:     	movl	%ebx, -0x8(%rbp)
14545b087:     	leal	(%rdi,%rdi,2), %r14d
14545b08b:     	addl	%r12d, %r14d
14545b08e:     	andl	$0x7, %r14d
14545b092:     	movl	%r14d, %eax
14545b095:     	shll	$0x4, %eax
14545b098:     	leaq	0x152ed65(%rip), %rcx   # 0x146989e04
14545b09f:     	leaq	(%rcx,%rax), %rdx
14545b0a3:     	addq	%rcx, %rax
14545b0a6:     	addq	$0x10, %rax
14545b0aa:     	movq	%rdx, 0x10(%rbp)
14545b0ae:     	movq	%rax, 0x18(%rbp)
14545b0b2:     	leaq	0xd0(%rbp), %rax
14545b0b9:     	movq	%rax, 0x20(%rbp)
14545b0bd:     	movq	0xe0(%rbp), %rax
14545b0c4:     	movq	%rax, 0xb0(%rbp)
14545b0cb:     	movq	0xf0(%rbp), %rax
14545b0d2:     	movq	%rax, 0xa8(%rbp)
14545b0d9:     	movb	$0x0, 0xff(%rbp)
14545b0e0:     	movb	$0x1, 0xfe(%rbp)
14545b0e7:     	leaq	-0x30(%rbp), %rcx
14545b0eb:     	leaq	0x10(%rbp), %rdx
14545b0ef:     	callq	0x1455245c0 <.text+0x55235c0>
14545b0f4:     	nop
14545b0f5:     	movq	0xd0(%rbp), %r8
14545b0fc:     	movq	0xe0(%rbp), %rax
14545b103:     	movq	%rax, 0xb0(%rbp)
14545b10a:     	movq	0xf0(%rbp), %rax
14545b111:     	movq	%rax, 0xa8(%rbp)
14545b118:     	movb	$0x0, 0xff(%rbp)
14545b11f:     	movb	$0x1, 0xfe(%rbp)
14545b126:     	movl	%edi, %ecx
14545b128:     	movq	%r14, %rdx
14545b12b:     	callq	0x145458610 <.text+0x5457610>
14545b130:     	nop
14545b131:     	movq	%rax, %r15
14545b134:     	movq	%rdx, %r14
14545b137:     	movq	0xd0(%rbp), %r13
14545b13e:     	cmpq	$0x4, %r13
14545b142:     	jne	0x14545b1b4 <.text+0x545a1b4>
14545b144:     	cmpl	$0x8, %r12d
14545b148:     	movabsq	$0x10000000b, %rax      # imm = 0x10000000B
14545b152:     	movabsq	$0x3d2c08310000000c, %r13 # imm = 0x3D2C08310000000C
14545b15c:     	cmovaeq	%rax, %r13
14545b160:     	movq	-0x20(%rbp), %rbx
14545b164:     	cmpq	-0x30(%rbp), %rbx
14545b168:     	jne	0x14545b19e <.text+0x545a19e>
14545b16a:     	movq	0xe0(%rbp), %rax
14545b171:     	movq	%rax, 0xb0(%rbp)
14545b178:     	movq	0xf0(%rbp), %rax
14545b17f:     	movq	%rax, 0xa8(%rbp)
14545b186:     	movb	$0x0, 0xff(%rbp)
14545b18d:     	movb	$0x1, 0xfe(%rbp)
14545b194:     	leaq	-0x30(%rbp), %rcx
14545b198:     	callq	0x145763de0 <.text+0x5762de0>
14545b19d:     	nop
14545b19e:     	movq	-0x28(%rbp), %rax
14545b1a2:     	movq	%r13, (%rax,%rbx,8)
14545b1a6:     	incq	%rbx
14545b1a9:     	movq	%rbx, -0x20(%rbp)
14545b1ad:     	movq	0xd0(%rbp), %r13
14545b1b4:     	movl	-0x8(%rbp), %ebx
14545b1b7:     	jmp	0x14545b1bf <.text+0x545a1bf>
14545b1b9:     	xorl	%r13d, %r13d
14545b1bc:     	xorl	%r15d, %r15d
14545b1bf:     	movq	-0x20(%rbp), %rax
14545b1c3:     	movq	%rax, 0x20(%rbp)
14545b1c7:     	movups	-0x30(%rbp), %xmm0
14545b1cb:     	movaps	%xmm0, 0x10(%rbp)
14545b1cf:     	leaq	0xb8(%rbp), %rcx
14545b1d6:     	leaq	0x10(%rbp), %rdx
14545b1da:     	callq	0x145455b90 <.text+0x5454b90>
14545b1df:     	nop
14545b1e0:     	movq	0xd8(%rbp), %rcx
14545b1e7:     	movq	0xc8(%rbp), %rax
14545b1ee:     	movq	%rax, 0x28(%rsi)
14545b1f2:     	movups	0xb8(%rbp), %xmm0
14545b1f9:     	movups	%xmm0, 0x18(%rsi)
14545b1fd:     	movq	0xf0(%rbp), %rax
14545b204:     	movq	%rax, (%rsi)
14545b207:     	movq	0xe0(%rbp), %rax
14545b20e:     	movq	%rax, 0x8(%rsi)
14545b212:     	movq	%rcx, 0x10(%rsi)
14545b216:     	movq	%r13, 0x30(%rsi)
14545b21a:     	movq	%r15, 0x38(%rsi)
14545b21e:     	movq	%r14, 0x40(%rsi)
14545b222:     	movq	%r12, 0x48(%rsi)
14545b226:     	movq	-0x38(%rbp), %rax
14545b22a:     	movl	%eax, 0x50(%rsi)
14545b22d:     	movl	0xe8(%rbp), %eax
14545b233:     	movl	%eax, 0x54(%rsi)
14545b236:     	movl	-0x10(%rbp), %eax
14545b239:     	movl	%eax, 0x58(%rsi)
14545b23c:     	movl	-0x18(%rbp), %eax
14545b23f:     	movl	%eax, 0x5c(%rsi)
14545b242:     	movl	0x8(%rbp), %eax
14545b245:     	movl	%eax, 0x60(%rsi)
14545b248:     	movl	%ebx, 0x64(%rsi)
14545b24b:     	movzbl	(%rbp), %eax
14545b24f:     	movb	%al, 0x68(%rsi)
14545b252:     	movb	%dil, 0x69(%rsi)
14545b256:     	jmp	0x14545a5c0 <.text+0x54595c0>
14545b25b:     	movl	$0x2, %eax
14545b260:     	leaq	0x152eb65(%rip), %rcx   # 0x146989dcc
14545b267:     	jmp	0x14545ade5 <.text+0x5459de5>
14545b26c:     	movl	$0x2, %eax
14545b271:     	leaq	0x152eb34(%rip), %rcx   # 0x146989dac
14545b278:     	jmp	0x14545ade5 <.text+0x5459de5>
14545b27d:     	movl	$0x2, %eax
14545b282:     	leaq	0x152eb33(%rip), %rcx   # 0x146989dbc
14545b289:     	jmp	0x14545ade5 <.text+0x5459de5>
14545b28e:     	movl	$0x3, %eax
14545b293:     	leaq	0x152eb52(%rip), %rcx   # 0x146989dec
14545b29a:     	jmp	0x14545ade5 <.text+0x5459de5>
14545b29f:     	movl	$0x2, %eax
14545b2a4:     	leaq	0x152eaf1(%rip), %rcx   # 0x146989d9c
14545b2ab:     	jmp	0x14545ade5 <.text+0x5459de5>
14545b2b0:     	movl	$0x1, %eax
14545b2b5:     	leaq	0x152eb20(%rip), %rcx   # 0x146989ddc
14545b2bc:     	jmp	0x14545ade5 <.text+0x5459de5>
14545b2c1:     	movl	$0x1, %eax
14545b2c6:     	leaq	0x152eb17(%rip), %rcx   # 0x146989de4
14545b2cd:     	jmp	0x14545ade5 <.text+0x5459de5>
14545b2d2:     	movq	0x20(%rbp), %rdx
14545b2d6:     	movq	0xf0(%rbp), %rcx
14545b2dd:     	callq	0x1458e721b <.text+0x58e621b>
14545b2e2:     	nop
14545b2e3:     	jmp	0x14545b363 <.text+0x545a363>
14545b2e5:     	movq	0x20(%rbp), %rdx
14545b2e9:     	movq	0xf0(%rbp), %rcx
14545b2f0:     	callq	0x1458e721b <.text+0x58e621b>
14545b2f5:     	nop
14545b2f6:     	jmp	0x14545b363 <.text+0x545a363>
14545b2f8:     	movb	$0x1, 0xff(%rbp)
14545b2ff:     	movb	$0x1, 0xfe(%rbp)
14545b306:     	leaq	0x152ea33(%rip), %r8    # 0x146989d40
14545b30d:     	movl	$0x5, %edx
14545b312:     	callq	0x1458e75b3 <.text+0x58e65b3>
14545b317:     	nop
14545b318:     	jmp	0x14545b363 <.text+0x545a363>
14545b31a:     	leaq	0x152e9b7(%rip), %r8    # 0x146989cd8
14545b321:     	movl	$0x5, %edx
14545b326:     	callq	0x1458e75b3 <.text+0x58e65b3>
14545b32b:     	nop
14545b32c:     	jmp	0x14545b363 <.text+0x545a363>
14545b32e:     	movq	%r13, 0xb0(%rbp)
14545b335:     	movq	0xf0(%rbp), %rax
14545b33c:     	movq	%rax, 0xa8(%rbp)
14545b343:     	movb	$0x0, 0xff(%rbp)
14545b34a:     	movb	$0x1, 0xfe(%rbp)
14545b351:     	leaq	0x152e998(%rip), %r8    # 0x146989cf0
14545b358:     	movl	$0x5, %edx
14545b35d:     	callq	0x1458e75b3 <.text+0x58e65b3>
14545b362:     	nop
14545b363:     	ud2
