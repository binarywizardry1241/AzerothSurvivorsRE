
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544a260:     	pushq	%rbp
14544a261:     	pushq	%r15
14544a263:     	pushq	%r14
14544a265:     	pushq	%r13
14544a267:     	pushq	%r12
14544a269:     	pushq	%rsi
14544a26a:     	pushq	%rdi
14544a26b:     	pushq	%rbx
14544a26c:     	subq	$0x298, %rsp            # imm = 0x298
14544a273:     	leaq	0x80(%rsp), %rbp
14544a27b:     	movaps	%xmm13, 0x200(%rbp)
14544a283:     	movaps	%xmm12, 0x1f0(%rbp)
14544a28b:     	movaps	%xmm11, 0x1e0(%rbp)
14544a293:     	movaps	%xmm10, 0x1d0(%rbp)
14544a29b:     	movaps	%xmm9, 0x1c0(%rbp)
14544a2a3:     	movaps	%xmm8, 0x1b0(%rbp)
14544a2ab:     	movaps	%xmm7, 0x1a0(%rbp)
14544a2b2:     	movaps	%xmm6, 0x190(%rbp)
14544a2b9:     	movq	$-0x2, 0x188(%rbp)
14544a2c4:     	cmpl	$0x2, 0x10(%rcx)
14544a2c8:     	je	0x14544bb2a <.text+0x544ab2a>
14544a2ce:     	cmpb	$0x0, 0x9c9(%rcx)
14544a2d5:     	je	0x14544bb2a <.text+0x544ab2a>
14544a2db:     	movl	0x420(%rcx), %eax
14544a2e1:     	movl	%eax, 0x160(%rbp)
14544a2e7:     	movss	0x944(%rcx), %xmm8
14544a2f0:     	movl	0x880(%rcx), %r15d
14544a2f7:     	movq	0xf80(%rcx), %rax
14544a2fe:     	movq	%rax, 0x90(%rbp)
14544a305:     	movzbl	0x2ac(%rcx), %eax
14544a30c:     	movq	%rax, 0x168(%rbp)
14544a313:     	movq	0x238(%rcx), %r8
14544a31a:     	movq	0x240(%rcx), %rdx
14544a321:     	movl	0x684(%rcx), %eax
14544a327:     	cvtsi2ss	%rax, %xmm0
14544a32c:     	movzwl	0x258(%rcx), %eax
14544a333:     	xorps	%xmm13, %xmm13
14544a337:     	cvtsi2ss	%eax, %xmm13
14544a33c:     	movss	0x4bd1f7(%rip), %xmm10  # 0x14590753c
14544a345:     	movaps	%xmm13, %xmm1
14544a349:     	divss	%xmm10, %xmm1
14544a34e:     	divss	%xmm1, %xmm0
14544a352:     	cvttss2si	%xmm0, %rdi
14544a357:     	xorl	%r14d, %r14d
14544a35a:     	xorps	%xmm11, %xmm11
14544a35e:     	ucomiss	%xmm11, %xmm0
14544a362:     	cmovbl	%r14d, %edi
14544a366:     	movss	0x4bd1bd(%rip), %xmm12  # 0x14590752c
14544a36f:     	ucomiss	%xmm12, %xmm0
14544a373:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14544a378:     	cmoval	%eax, %edi
14544a37b:     	movq	%rcx, 0xb8(%rbp)
14544a382:     	movl	0x690(%rcx), %esi
14544a388:     	movq	%r8, 0x98(%rbp)
14544a38f:     	movq	%r8, %rcx
14544a392:     	movq	%rdx, 0xa0(%rbp)
14544a399:     	callq	0x145420480 <.text+0x541f480>
14544a39e:     	cvtsi2ss	%rdi, %xmm6
14544a3a3:     	movq	%rax, 0x170(%rbp)
14544a3aa:     	leaq	(,%rsi,8), %rdi
14544a3b2:     	mulss	0x4c8f36(%rip), %xmm6   # 0x1459132f0
14544a3ba:     	movaps	%xmm6, %xmm0
14544a3bd:     	callq	0x14577322f <.text+0x577222f>
14544a3c2:     	cvttss2si	%xmm0, %rbx
14544a3c7:     	movss	0x5e46b0(%rip), %xmm9   # 0x145a2ea80
14544a3d0:     	ucomiss	%xmm9, %xmm0
14544a3d4:     	movabsq	$0x7fffffffffffffff, %r12 # imm = 0x7FFFFFFFFFFFFFFF
14544a3de:     	cmovaq	%r12, %rbx
14544a3e2:     	ucomiss	%xmm0, %xmm0
14544a3e5:     	cmovpq	%r14, %rbx
14544a3e9:     	movaps	%xmm8, %xmm7
14544a3ed:     	divss	0x4cb4af(%rip), %xmm7   # 0x1459158a4
14544a3f5:     	mulss	0x4bd113(%rip), %xmm7   # 0x145907510
14544a3fd:     	movaps	%xmm7, %xmm0
14544a400:     	callq	0x14577322f <.text+0x577222f>
14544a405:     	cvttss2si	%xmm0, %r13
14544a40a:     	ucomiss	%xmm9, %xmm0
14544a40e:     	cmovaq	%r12, %r13
14544a412:     	ucomiss	%xmm0, %xmm0
14544a415:     	cmovpq	%r14, %r13
14544a419:     	leaq	(%rdi,%rdi,4), %rdi
14544a41d:     	testq	%r15, %r15
14544a420:     	movq	$-0xc8, %r12
14544a427:     	cmoveq	%r15, %r12
14544a42b:     	movl	$0xc8, %r14d
14544a431:     	movq	%r15, 0x40(%rbp)
14544a435:     	cmoveq	%r15, %r14
14544a439:     	jne	0x14544a440 <.text+0x5449440>
14544a43b:     	xorps	%xmm1, %xmm1
14544a43e:     	jmp	0x14544a448 <.text+0x5449448>
14544a440:     	movss	0x4cb408(%rip), %xmm1   # 0x145915850
14544a448:     	cvtsi2ss	%rsi, %xmm2
14544a44d:     	addss	%xmm6, %xmm7
14544a451:     	mulss	0x4c8ef7(%rip), %xmm2   # 0x145913350
14544a459:     	addss	%xmm7, %xmm2
14544a45d:     	xorps	%xmm0, %xmm0
14544a460:     	cvtsi2ssl	0x170(%rbp), %xmm0
14544a468:     	mulss	0x12f3a60(%rip), %xmm0  # 0x14673ded0
14544a470:     	divss	0x59a4b4(%rip), %xmm0   # 0x1459e492c
14544a478:     	addss	%xmm1, %xmm2
14544a47c:     	movss	0x4bd00c(%rip), %xmm6   # 0x145907490
14544a484:     	addss	%xmm6, %xmm0
14544a488:     	mulss	%xmm2, %xmm0
14544a48c:     	callq	0x14577322f <.text+0x577222f>
14544a491:     	cvttss2si	%xmm0, %rax
14544a496:     	ucomiss	%xmm11, %xmm0
14544a49a:     	movl	$0x0, %esi
14544a49f:     	cmovbl	%esi, %eax
14544a4a2:     	ucomiss	%xmm12, %xmm0
14544a4a6:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
14544a4ab:     	cmoval	%ecx, %eax
14544a4ae:     	leaq	(%rdi,%r13), %r15
14544a4b2:     	addq	%rbx, %r15
14544a4b5:     	subq	%r15, %r12
14544a4b8:     	addq	%rax, %r12
14544a4bb:     	movq	%r13, -0x18(%rbp)
14544a4bf:     	movq	%rbx, -0x10(%rbp)
14544a4c3:     	movq	%rdi, -0x8(%rbp)
14544a4c7:     	movss	0xc2a951(%rip), %xmm2   # 0x146074e20
14544a4cf:     	addss	%xmm2, %xmm13
14544a4d4:     	divss	%xmm10, %xmm13
14544a4d9:     	movq	0xb8(%rbp), %r13
14544a4e0:     	movzwl	0x25a(%r13), %eax
14544a4e8:     	xorps	%xmm0, %xmm0
14544a4eb:     	cvtsi2ss	%eax, %xmm0
14544a4ef:     	mulss	0x4cb3a8(%rip), %xmm13  # 0x1459158a0
14544a4f8:     	addss	%xmm2, %xmm0
14544a4fc:     	divss	%xmm10, %xmm0
14544a501:     	mulss	0x4f576b(%rip), %xmm0   # 0x14593fc74
14544a509:     	addss	%xmm13, %xmm0
14544a50e:     	movzwl	0x25c(%r13), %eax
14544a516:     	xorps	%xmm1, %xmm1
14544a519:     	cvtsi2ss	%eax, %xmm1
14544a51d:     	addss	%xmm2, %xmm1
14544a521:     	divss	%xmm10, %xmm1
14544a526:     	mulss	0x4bd006(%rip), %xmm1   # 0x145907534
14544a52e:     	addss	%xmm0, %xmm1
14544a532:     	movzwl	0x25e(%r13), %eax
14544a53a:     	xorps	%xmm0, %xmm0
14544a53d:     	cvtsi2ss	%eax, %xmm0
14544a541:     	movq	%r14, (%rbp)
14544a545:     	addss	%xmm2, %xmm0
14544a549:     	addq	%r14, %r15
14544a54c:     	addq	%r12, %r15
14544a54f:     	cvttss2si	%xmm8, %rax
14544a554:     	ucomiss	%xmm11, %xmm8
14544a558:     	cmovbl	%esi, %eax
14544a55b:     	ucomiss	%xmm12, %xmm8
14544a55f:     	divss	%xmm10, %xmm0
14544a564:     	cmoval	%ecx, %eax
14544a567:     	movq	%rax, 0x170(%rbp)
14544a56e:     	addss	%xmm0, %xmm0
14544a572:     	xorps	%xmm2, %xmm2
14544a575:     	cvtsi2ss	%r15, %xmm2
14544a57a:     	addss	%xmm1, %xmm0
14544a57e:     	addss	%xmm6, %xmm0
14544a582:     	minss	0x4c8d6a(%rip), %xmm0   # 0x1459132f4
14544a58a:     	movq	%r12, 0x8(%rbp)
14544a58e:     	addss	0x4bcf76(%rip), %xmm0   # 0x14590750c
14544a596:     	mulss	%xmm2, %xmm0
14544a59a:     	callq	0x14577322f <.text+0x577222f>
14544a59f:     	cvttss2si	%xmm0, %rax
14544a5a4:     	ucomiss	%xmm9, %xmm0
14544a5a8:     	movabsq	$0x7fffffffffffffff, %rdi # imm = 0x7FFFFFFFFFFFFFFF
14544a5b2:     	cmovaq	%rdi, %rax
14544a5b6:     	ucomiss	%xmm0, %xmm0
14544a5b9:     	cmovpq	%rsi, %rax
14544a5bd:     	movq	%rax, 0x10(%rbp)
14544a5c1:     	addq	%r15, %rax
14544a5c4:     	xorps	%xmm0, %xmm0
14544a5c7:     	cvtsi2ss	%rax, %xmm0
14544a5cc:     	mulss	0x1000(%r13), %xmm0
14544a5d5:     	callq	0x14577322f <.text+0x577222f>
14544a5da:     	cvttss2si	%xmm0, %rax
14544a5df:     	ucomiss	%xmm9, %xmm0
14544a5e3:     	cmovaq	%rdi, %rax
14544a5e7:     	ucomiss	%xmm0, %xmm0
14544a5ea:     	cmovpq	%rsi, %rax
14544a5ee:     	movq	%rax, 0x18(%rbp)
14544a5f2:     	leaq	0xf88(%r13), %rdi
14544a5f9:     	movq	$0x0, 0xe0(%rbp)
14544a604:     	movq	$0x7, 0xe8(%rbp)
14544a60f:     	leaq	-0x18(%rbp), %rax
14544a613:     	movq	%rax, 0xd0(%rbp)
14544a61a:     	movq	%rdi, 0xd8(%rbp)
14544a621:     	leaq	0x20(%rbp), %rcx
14544a625:     	leaq	0xd0(%rbp), %rdx
14544a62c:     	callq	0x1455457e0 <.text+0x55447e0>
14544a631:     	movq	0x30(%rbp), %r14
14544a635:     	testq	%r14, %r14
14544a638:     	je	0x14544a654 <.text+0x5449654>
14544a63a:     	movq	0x28(%rbp), %r15
14544a63e:     	cmpq	$0x5, %r14
14544a642:     	movq	0x90(%rbp), %rbx
14544a649:     	jae	0x14544a697 <.text+0x5449697>
14544a64b:     	xorl	%eax, %eax
14544a64d:     	xorl	%ecx, %ecx
14544a64f:     	jmp	0x14544a6ff <.text+0x54496ff>
14544a654:     	movl	$0x0, 0x134(%rbp)
14544a65e:     	movq	0x18(%rbp), %rax
14544a662:     	movq	%rax, 0x30(%rdi)
14544a666:     	movups	-0x18(%rbp), %xmm0
14544a66a:     	movups	-0x8(%rbp), %xmm1
14544a66e:     	movups	0x8(%rbp), %xmm2
14544a672:     	movups	%xmm2, 0x20(%rdi)
14544a676:     	movups	%xmm1, 0x10(%rdi)
14544a67a:     	movups	%xmm0, (%rdi)
14544a67d:     	movq	0x90(%rbp), %rbx
14544a684:     	cmpq	$0xffffff, %rbx         # imm = 0xFFFFFF
14544a68b:     	setne	%r12b
14544a68f:     	movb	$0x1, %r9b
14544a692:     	jmp	0x14544b342 <.text+0x544a342>
14544a697:     	movl	%r14d, %eax
14544a69a:     	andl	$0x3, %eax
14544a69d:     	movl	$0x4, %ecx
14544a6a2:     	cmovneq	%rax, %rcx
14544a6a6:     	movq	%r14, %rax
14544a6a9:     	subq	%rcx, %rax
14544a6ac:     	leaq	0x28(%r15), %rcx
14544a6b0:     	xorps	%xmm0, %xmm0
14544a6b3:     	movq	%rax, %rdx
14544a6b6:     	xorps	%xmm1, %xmm1
14544a6b9:     	nopl	(%rax)
14544a6c0:     	movq	-0x10(%rcx), %xmm2
14544a6c5:     	movdqu	-0x20(%rcx), %xmm3
14544a6ca:     	punpcklqdq	%xmm2, %xmm3    # xmm3 = xmm3[0],xmm2[0]
14544a6ce:     	paddq	%xmm3, %xmm1
14544a6d2:     	movdqu	(%rcx), %xmm2
14544a6d6:     	movq	0x10(%rcx), %xmm3
14544a6db:     	punpcklqdq	%xmm3, %xmm2    # xmm2 = xmm2[0],xmm3[0]
14544a6df:     	paddq	%xmm2, %xmm0
14544a6e3:     	addq	$0x40, %rcx
14544a6e7:     	addq	$-0x4, %rdx
14544a6eb:     	jne	0x14544a6c0 <.text+0x54496c0>
14544a6ed:     	paddq	%xmm1, %xmm0
14544a6f1:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
14544a6f6:     	paddq	%xmm0, %xmm1
14544a6fa:     	movq	%xmm1, %rcx
14544a6ff:     	movq	%rax, %rdx
14544a702:     	shlq	$0x4, %rdx
14544a706:     	addq	%r15, %rdx
14544a709:     	addq	$0x8, %rdx
14544a70d:     	nopl	(%rax)
14544a710:     	addq	(%rdx), %rcx
14544a713:     	incq	%rax
14544a716:     	addq	$0x10, %rdx
14544a71a:     	cmpq	%rax, %r14
14544a71d:     	jne	0x14544a710 <.text+0x5449710>
14544a71f:     	xorl	%r8d, %r8d
14544a722:     	testq	%rcx, %rcx
14544a725:     	cmovgq	%rcx, %r8
14544a729:     	movl	%r8d, 0x134(%rbp)
14544a730:     	movq	0x18(%rbp), %rax
14544a734:     	movq	%rax, 0x30(%rdi)
14544a738:     	movups	-0x18(%rbp), %xmm0
14544a73c:     	movups	-0x8(%rbp), %xmm1
14544a740:     	movups	0x8(%rbp), %xmm2
14544a744:     	movups	%xmm2, 0x20(%rdi)
14544a748:     	movups	%xmm1, 0x10(%rdi)
14544a74c:     	movups	%xmm0, (%rdi)
14544a74f:     	movb	$0x1, %r9b
14544a752:     	cmpq	$0xffffff, %rbx         # imm = 0xFFFFFF
14544a759:     	setne	%r12b
14544a75d:     	je	0x14544b342 <.text+0x544a342>
14544a763:     	testl	%r8d, %r8d
14544a766:     	je	0x14544b342 <.text+0x544a342>
14544a76c:     	leaq	0xa18(%r13), %rbx
14544a773:     	movq	0xa80(%r13), %rax
14544a77a:     	movq	0xa88(%r13), %rcx
14544a781:     	shlq	$0x5, %rcx
14544a785:     	xorl	%r10d, %r10d
14544a788:     	movq	0x168(%rbp), %rdx
14544a78f:     	nop
14544a790:     	cmpq	%r10, %rcx
14544a793:     	je	0x14544a7ae <.text+0x54497ae>
14544a795:     	leaq	0x20(%r10), %r9
14544a799:     	cmpb	%dl, 0x4(%rax,%r10)
14544a79e:     	movq	%r9, %r10
14544a7a1:     	jne	0x14544a790 <.text+0x5449790>
14544a7a3:     	movl	-0x20(%rax,%r9), %eax
14544a7a8:     	movq	%rax, 0x38(%rbp)
14544a7ac:     	jmp	0x14544a7b6 <.text+0x54497b6>
14544a7ae:     	movq	$0x0, 0x38(%rbp)
14544a7b6:     	movb	$0x1, 0x187(%rbp)
14544a7bd:     	movq	%rbx, %rcx
14544a7c0:     	callq	0x14542f260 <.text+0x542e260>
14544a7c5:     	movl	%eax, 0x68(%rbp)
14544a7c8:     	movl	%edx, %esi
14544a7ca:     	movb	$0x1, 0x187(%rbp)
14544a7d1:     	movq	%rbx, %rcx
14544a7d4:     	callq	0x1454356a0 <.text+0x54346a0>
14544a7d9:     	nop
14544a7da:     	movq	0xa80(%r13), %rax
14544a7e1:     	movq	0xa88(%r13), %rcx
14544a7e8:     	shlq	$0x5, %rcx
14544a7ec:     	xorl	%r10d, %r10d
14544a7ef:     	xorl	%edx, %edx
14544a7f1:     	movq	0x168(%rbp), %r9
14544a7f8:     	nopl	(%rax,%rax)
14544a800:     	cmpq	%rdx, %rcx
14544a803:     	je	0x14544a818 <.text+0x5449818>
14544a805:     	leaq	0x20(%rdx), %r8
14544a809:     	cmpb	%r9b, 0x4(%rax,%rdx)
14544a80e:     	movq	%r8, %rdx
14544a811:     	jne	0x14544a800 <.text+0x5449800>
14544a813:     	movl	-0x20(%rax,%r8), %r10d
14544a818:     	movl	$0x6e, %eax
14544a81d:     	movl	%r10d, %edi
14544a820:     	leal	-0x1e(%rax), %r12d
14544a824:     	movl	%edi, %ecx
14544a826:     	subl	%r12d, %ecx
14544a829:     	jb	0x14544a856 <.text+0x5449856>
14544a82b:     	leal	-0xf(%rax), %r12d
14544a82f:     	movl	%ecx, %edx
14544a831:     	subl	%r12d, %edx
14544a834:     	jb	0x14544a84d <.text+0x544984d>
14544a836:     	movl	%edx, %edi
14544a838:     	subl	%eax, %edi
14544a83a:     	jb	0x14544a851 <.text+0x5449851>
14544a83c:     	addl	$0x2d, %eax
14544a83f:     	cmpl	$0x36b, %eax            # imm = 0x36B
14544a844:     	jne	0x14544a820 <.text+0x5449820>
14544a846:     	xorl	%edi, %edi
14544a848:     	xorl	%r12d, %r12d
14544a84b:     	jmp	0x14544a856 <.text+0x5449856>
14544a84d:     	movl	%ecx, %edi
14544a84f:     	jmp	0x14544a856 <.text+0x5449856>
14544a851:     	movl	%edx, %edi
14544a853:     	movl	%eax, %r12d
14544a856:     	movq	0x168(%rbp), %rax
14544a85d:     	addl	$-0x2, %eax
14544a860:     	cmpb	$0x9, %al
14544a862:     	movq	%r10, -0x48(%rbp)
14544a866:     	ja	0x14544a878 <.text+0x5449878>
14544a868:     	movzbl	%al, %eax
14544a86b:     	leaq	0x12f40c6(%rip), %rcx   # 0x14673e938
14544a872:     	movq	(%rcx,%rax,8), %rbx
14544a876:     	jmp	0x14544a87f <.text+0x544987f>
14544a878:     	leaq	0x12eafc9(%rip), %rbx   # 0x146735848
14544a87f:     	leaq	0x10(%rbx), %rax
14544a883:     	movq	%rax, 0x140(%rbp)
14544a88a:     	leaq	-0x54487d1(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14544a891:     	movq	%rax, 0x148(%rbp)
14544a898:     	movb	$0x1, 0x187(%rbp)
14544a89f:     	leaq	0x12e1034(%rip), %rdx   # 0x14672b8da
14544a8a6:     	leaq	0xd0(%rbp), %rcx
14544a8ad:     	leaq	0x140(%rbp), %r8
14544a8b4:     	callq	0x145728390 <.text+0x5727390>
14544a8b9:     	nop
14544a8ba:     	movq	%r15, 0xc0(%rbp)
14544a8c1:     	movl	%esi, 0xb0(%rbp)
14544a8c7:     	movq	0xd8(%rbp), %rcx
14544a8ce:     	movq	0xe0(%rbp), %rdx
14544a8d5:     	movq	0x20(%rbx), %rsi
14544a8d9:     	movq	0x28(%rbx), %r13
14544a8dd:     	movq	%rcx, 0x138(%rbp)
14544a8e4:     	callq	0x145457cb0 <.text+0x5456cb0>
14544a8e9:     	nop
14544a8ea:     	movq	%rax, %r15
14544a8ed:     	movq	%rdx, %rbx
14544a8f0:     	movq	0xd0(%rbp), %rdx
14544a8f7:     	testq	%rdx, %rdx
14544a8fa:     	je	0x14544a90e <.text+0x544990e>
14544a8fc:     	movl	$0x1, %r8d
14544a902:     	movq	0x138(%rbp), %rcx
14544a909:     	callq	0x1400021d0 <.text+0x11d0>
14544a90e:     	testq	%r15, %r15
14544a911:     	cmovneq	%r15, %rsi
14544a915:     	cmoveq	%r13, %rbx
14544a919:     	movq	%rsi, 0x48(%rbp)
14544a91d:     	movq	%rbx, 0x50(%rbp)
14544a921:     	callq	0x140002200 <.text+0x1200>
14544a926:     	movl	$0x1, %eax
14544a92b:     	movq	%rax, 0x138(%rbp)
14544a932:     	movl	$0x1, %ecx
14544a937:     	movl	$0x1, %edx
14544a93c:     	callq	0x1400021c0 <.text+0x11c0>
14544a941:     	testq	%rax, %rax
14544a944:     	je	0x14544bbba <.text+0x544abba>
14544a94a:     	movq	%rax, %r8
14544a94d:     	movb	$0x5b, (%rax)
14544a950:     	movq	0x20(%rbp), %rdx
14544a954:     	shlq	$0x4, %r14
14544a958:     	movq	0xc0(%rbp), %r15
14544a95f:     	addq	%r15, %r14
14544a962:     	leaq	0x89(%rbp), %r10
14544a969:     	movb	$0x1, %r9b
14544a96c:     	leaq	0x70(%rbp), %rsi
14544a970:     	movl	$0x1, %eax
14544a975:     	movq	0xb8(%rbp), %r13
14544a97c:     	cmpq	%r14, %r15
14544a97f:     	movq	%r8, 0xa8(%rbp)
14544a986:     	je	0x14544abfd <.text+0x5449bfd>
14544a98c:     	nopl	(%rax)
14544a990:     	movq	0x8(%r15), %rbx
14544a994:     	testq	%rbx, %rbx
14544a997:     	jg	0x14544a9a7 <.text+0x54499a7>
14544a999:     	addq	$0x10, %r15
14544a99d:     	cmpq	%r14, %r15
14544a9a0:     	jne	0x14544a990 <.text+0x5449990>
14544a9a2:     	jmp	0x14544abfd <.text+0x5449bfd>
14544a9a7:     	movq	%rdx, 0xc8(%rbp)
14544a9ae:     	movq	(%r15), %rsi
14544a9b1:     	movq	%rax, %rcx
14544a9b4:     	movq	0x138(%rbp), %rax
14544a9bb:     	movq	%rax, 0x70(%rbp)
14544a9bf:     	movq	%r8, 0x78(%rbp)
14544a9c3:     	movq	%rcx, 0x80(%rbp)
14544a9ca:     	movb	%r9b, 0x88(%rbp)
14544a9d1:     	movl	0x58(%rbp), %eax
14544a9d4:     	movl	0x5b(%rbp), %ecx
14544a9d7:     	movl	%ecx, 0x3(%r10)
14544a9db:     	movl	%eax, (%r10)
14544a9de:     	callq	0x140002200 <.text+0x1200>
14544a9e3:     	movl	$0x1, %ecx
14544a9e8:     	movl	$0x1, %edx
14544a9ed:     	callq	0x1400021c0 <.text+0x11c0>
14544a9f2:     	testq	%rax, %rax
14544a9f5:     	je	0x14544bbec <.text+0x544abec>
14544a9fb:     	movb	$0x7b, (%rax)
14544a9fe:     	movq	$0x1, 0xd0(%rbp)
14544aa09:     	movq	%rax, 0xd8(%rbp)
14544aa10:     	movq	$0x1, 0xe0(%rbp)
14544aa1b:     	movb	$0x1, 0xe8(%rbp)
14544aa22:     	cmpq	$0x5, %rsi
14544aa26:     	jne	0x14544aa5a <.text+0x5449a5a>
14544aa28:     	movb	$0x1, 0x182(%rbp)
14544aa2f:     	movl	$0xb, %edx
14544aa34:     	leaq	0x12f3acd(%rip), %rcx   # 0x14673e508
14544aa3b:     	callq	0x145457cb0 <.text+0x5456cb0>
14544aa40:     	nop
14544aa41:     	testq	%rax, %rax
14544aa44:     	movl	$0xb, %ecx
14544aa49:     	cmoveq	%rcx, %rdx
14544aa4d:     	leaq	0x12f3ab4(%rip), %rcx   # 0x14673e508
14544aa54:     	cmoveq	%rcx, %rax
14544aa58:     	jmp	0x14544aaca <.text+0x5449aca>
14544aa5a:     	movb	$0x1, 0x182(%rbp)
14544aa61:     	movl	$0x11, %edx
14544aa66:     	leaq	0x12f3aa6(%rip), %rcx   # 0x14673e513
14544aa6d:     	callq	0x145457cb0 <.text+0x5456cb0>
14544aa72:     	nop
14544aa73:     	testq	%rax, %rax
14544aa76:     	movl	$0x11, %ecx
14544aa7b:     	cmoveq	%rcx, %rdx
14544aa7f:     	leaq	0x12f3a8d(%rip), %rcx   # 0x14673e513
14544aa86:     	cmoveq	%rcx, %rax
14544aa8a:     	cmpq	$0x4, %rsi
14544aa8e:     	ja	0x14544aaca <.text+0x5449aca>
14544aa90:     	shlq	$0x4, %rsi
14544aa94:     	leaq	0x12f3a1d(%rip), %rax   # 0x14673e4b8
14544aa9b:     	addq	%rax, %rsi
14544aa9e:     	movq	(%rsi), %rcx
14544aaa1:     	movq	%rcx, -0x40(%rbp)
14544aaa5:     	movq	0x8(%rsi), %rsi
14544aaa9:     	movb	$0x1, 0x182(%rbp)
14544aab0:     	movq	%rsi, %rdx
14544aab3:     	callq	0x145457cb0 <.text+0x5456cb0>
14544aab8:     	movq	%rax, %rcx
14544aabb:     	movq	-0x40(%rbp), %rax
14544aabf:     	testq	%rcx, %rcx
14544aac2:     	cmoveq	%rsi, %rdx
14544aac6:     	cmovneq	%rcx, %rax
14544aaca:     	movb	$0x0, 0x182(%rbp)
14544aad1:     	movq	%rdx, 0x28(%rsp)
14544aad6:     	movq	%rax, 0x20(%rsp)
14544aadb:     	movl	$0x4, %r9d
14544aae1:     	leaq	0x140(%rbp), %rcx
14544aae8:     	leaq	0xd0(%rbp), %rdx
14544aaef:     	leaq	0x12f3575(%rip), %r8    # 0x14673e06b
14544aaf6:     	callq	0x145456ed0 <.text+0x5455ed0>
14544aafb:     	nop
14544aafc:     	cvtsi2sd	%rbx, %xmm0
14544ab01:     	movb	$0x1, 0x183(%rbp)
14544ab08:     	movsd	%xmm0, 0x20(%rsp)
14544ab0e:     	movl	$0x2, %r9d
14544ab14:     	leaq	0xd0(%rbp), %rcx
14544ab1b:     	leaq	0x140(%rbp), %rdx
14544ab22:     	leaq	0x12f37e5(%rip), %r8    # 0x14673e30e
14544ab29:     	callq	0x145453d10 <.text+0x5452d10>
14544ab2e:     	nop
14544ab2f:     	leaq	0x70(%rbp), %rsi
14544ab33:     	movq	0xe0(%rbp), %rbx
14544ab3a:     	cmpq	%rbx, 0xd0(%rbp)
14544ab41:     	je	0x14544abd3 <.text+0x5449bd3>
14544ab47:     	movq	0xd8(%rbp), %rax
14544ab4e:     	movb	$0x7d, (%rax,%rbx)
14544ab52:     	incq	%rbx
14544ab55:     	movq	%rbx, 0x150(%rbp)
14544ab5c:     	movups	0xd0(%rbp), %xmm0
14544ab63:     	movaps	%xmm0, 0x140(%rbp)
14544ab6a:     	movb	$0x0, 0x183(%rbp)
14544ab71:     	leaq	-0x38(%rbp), %rcx
14544ab75:     	movq	%rsi, %rdx
14544ab78:     	leaq	0x140(%rbp), %r8
14544ab7f:     	callq	0x1454569d0 <.text+0x54559d0>
14544ab84:     	nop
14544ab85:     	addq	$0x10, %r15
14544ab89:     	movq	-0x38(%rbp), %rax
14544ab8d:     	movq	%rax, 0x138(%rbp)
14544ab94:     	movq	-0x30(%rbp), %r8
14544ab98:     	movq	-0x28(%rbp), %rdx
14544ab9c:     	movzbl	-0x20(%rbp), %r9d
14544aba1:     	leaq	-0x1f(%rbp), %rcx
14544aba5:     	movl	(%rcx), %eax
14544aba7:     	movl	0x3(%rcx), %ecx
14544abaa:     	movl	%eax, 0x58(%rbp)
14544abad:     	movq	%rdx, %rax
14544abb0:     	movl	%ecx, 0x5b(%rbp)
14544abb3:     	movq	0xc8(%rbp), %rdx
14544abba:     	leaq	0x89(%rbp), %r10
14544abc1:     	cmpq	%r14, %r15
14544abc4:     	movq	%r8, 0xa8(%rbp)
14544abcb:     	jne	0x14544a990 <.text+0x5449990>
14544abd1:     	jmp	0x14544abfd <.text+0x5449bfd>
14544abd3:     	movq	$0x1, 0x20(%rsp)
14544abdc:     	movl	$0x1, %r8d
14544abe2:     	movl	$0x1, %r9d
14544abe8:     	leaq	0xd0(%rbp), %rcx
14544abef:     	movq	%rbx, %rdx
14544abf2:     	callq	0x1457744b0 <.text+0x57734b0>
14544abf7:     	nop
14544abf8:     	jmp	0x14544ab47 <.text+0x5449b47>
14544abfd:     	movl	%r9d, %r15d
14544ac00:     	movq	%rax, 0xc8(%rbp)
14544ac07:     	testq	%rdx, %rdx
14544ac0a:     	je	0x14544ac22 <.text+0x5449c22>
14544ac0c:     	shlq	$0x4, %rdx
14544ac10:     	movl	$0x8, %r8d
14544ac16:     	movq	0xc0(%rbp), %rcx
14544ac1d:     	callq	0x1400021d0 <.text+0x11d0>
14544ac22:     	callq	0x140002200 <.text+0x1200>
14544ac27:     	movl	$0x1, %ecx
14544ac2c:     	movl	$0x1, %edx
14544ac31:     	callq	0x1400021c0 <.text+0x11c0>
14544ac36:     	testq	%rax, %rax
14544ac39:     	movq	0x90(%rbp), %rbx
14544ac40:     	movl	0xb0(%rbp), %r14d
14544ac47:     	je	0x14544bbd3 <.text+0x544abd3>
14544ac4d:     	movb	$0x7b, (%rax)
14544ac50:     	movq	$0x1, 0xd0(%rbp)
14544ac5b:     	movq	%rax, 0xd8(%rbp)
14544ac62:     	movq	$0x1, 0xe0(%rbp)
14544ac6d:     	movb	$0x1, 0xe8(%rbp)
14544ac74:     	movb	$0x1, 0x186(%rbp)
14544ac7b:     	leaq	0x12f3684(%rip), %rax   # 0x14673e306
14544ac82:     	movq	%rax, 0x20(%rsp)
14544ac87:     	movq	$0x8, 0x28(%rsp)
14544ac90:     	leaq	0x12f33cc(%rip), %r8    # 0x14673e063
14544ac97:     	leaq	0x140(%rbp), %rcx
14544ac9e:     	leaq	0xd0(%rbp), %rdx
14544aca5:     	movl	$0x4, %r9d
14544acab:     	callq	0x145456ed0 <.text+0x5455ed0>
14544acb0:     	nop
14544acb1:     	movl	0x134(%rbp), %eax
14544acb7:     	movb	$0x1, 0x186(%rbp)
14544acbe:     	movl	%eax, 0x20(%rsp)
14544acc2:     	leaq	0x12f3645(%rip), %r8    # 0x14673e30e
14544acc9:     	leaq	0xd0(%rbp), %rcx
14544acd0:     	leaq	0x140(%rbp), %rdx
14544acd7:     	movl	$0x2, %r9d
14544acdd:     	callq	0x145454010 <.text+0x5453010>
14544ace2:     	nop
14544ace3:     	movb	$0x1, 0x186(%rbp)
14544acea:     	movq	0x38(%rbp), %rax
14544acee:     	movl	%eax, 0x20(%rsp)
14544acf2:     	leaq	0x12f3617(%rip), %r8    # 0x14673e310
14544acf9:     	leaq	0x140(%rbp), %rcx
14544ad00:     	leaq	0xd0(%rbp), %rdx
14544ad07:     	movl	$0x6, %r9d
14544ad0d:     	callq	0x145454010 <.text+0x5453010>
14544ad12:     	nop
14544ad13:     	movb	$0x1, 0x186(%rbp)
14544ad1a:     	movq	-0x48(%rbp), %rax
14544ad1e:     	movl	%eax, 0x20(%rsp)
14544ad22:     	leaq	0x12f35ed(%rip), %r8    # 0x14673e316
14544ad29:     	leaq	0xd0(%rbp), %rcx
14544ad30:     	leaq	0x140(%rbp), %rdx
14544ad37:     	movl	$0x5, %r9d
14544ad3d:     	callq	0x145454010 <.text+0x5453010>
14544ad42:     	nop
14544ad43:     	movb	$0x1, 0x186(%rbp)
14544ad4a:     	movl	%r14d, 0x20(%rsp)
14544ad4f:     	leaq	0x12f35c5(%rip), %r8    # 0x14673e31b
14544ad56:     	leaq	0x140(%rbp), %rcx
14544ad5d:     	leaq	0xd0(%rbp), %rdx
14544ad64:     	movl	$0x6, %r9d
14544ad6a:     	callq	0x145454010 <.text+0x5453010>
14544ad6f:     	nop
14544ad70:     	subl	0x68(%rbp), %r14d
14544ad74:     	movb	$0x1, 0x186(%rbp)
14544ad7b:     	movl	%r14d, 0x20(%rsp)
14544ad80:     	leaq	0x12f359a(%rip), %r8    # 0x14673e321
14544ad87:     	leaq	0xd0(%rbp), %rcx
14544ad8e:     	leaq	0x140(%rbp), %rdx
14544ad95:     	movl	$0x6, %r9d
14544ad9b:     	callq	0x145454010 <.text+0x5453010>
14544ada0:     	nop
14544ada1:     	movb	$0x1, 0x186(%rbp)
14544ada8:     	movl	%edi, 0x20(%rsp)
14544adac:     	leaq	0x12f3574(%rip), %r8    # 0x14673e327
14544adb3:     	leaq	0x140(%rbp), %rcx
14544adba:     	leaq	0xd0(%rbp), %rdx
14544adc1:     	movl	$0x4, %r9d
14544adc7:     	callq	0x145454010 <.text+0x5453010>
14544adcc:     	nop
14544adcd:     	movb	$0x1, 0x186(%rbp)
14544add4:     	movl	%r12d, 0x20(%rsp)
14544add9:     	leaq	0x12f354b(%rip), %r8    # 0x14673e32b
14544ade0:     	leaq	0xd0(%rbp), %rcx
14544ade7:     	leaq	0x140(%rbp), %rdx
14544adee:     	movl	$0x4, %r9d
14544adf4:     	callq	0x145454010 <.text+0x5453010>
14544adf9:     	nop
14544adfa:     	movups	0x48(%rbp), %xmm0
14544adfe:     	movb	$0x1, 0x186(%rbp)
14544ae05:     	movups	%xmm0, 0x20(%rsp)
14544ae0a:     	leaq	0x12f32f3(%rip), %r12   # 0x14673e104
14544ae11:     	leaq	0x140(%rbp), %rcx
14544ae18:     	leaq	0xd0(%rbp), %rdx
14544ae1f:     	movl	$0x5, %r9d
14544ae25:     	movq	%r12, %r8
14544ae28:     	callq	0x145456ed0 <.text+0x5455ed0>
14544ae2d:     	nop
14544ae2e:     	movq	0x138(%rbp), %rdx
14544ae35:     	movq	%rdx, 0xd0(%rbp)
14544ae3c:     	movq	0xa8(%rbp), %r8
14544ae43:     	movq	%r8, 0xd8(%rbp)
14544ae4a:     	movq	0xc8(%rbp), %r9
14544ae51:     	movq	%r9, 0xe0(%rbp)
14544ae58:     	movb	%r15b, 0xe8(%rbp)
14544ae5f:     	movl	0x58(%rbp), %eax
14544ae62:     	movl	0x5b(%rbp), %ecx
14544ae65:     	movl	%eax, 0xe9(%rbp)
14544ae6b:     	movl	%ecx, 0xec(%rbp)
14544ae71:     	movq	%r8, %rax
14544ae74:     	cmpq	%r9, %rdx
14544ae77:     	je	0x14544af0e <.text+0x5449f0e>
14544ae7d:     	leaq	0x12f348a(%rip), %rdi   # 0x14673e30e
14544ae84:     	movb	$0x5d, (%rax,%r9)
14544ae89:     	incq	%r9
14544ae8c:     	movq	%r9, 0x80(%rbp)
14544ae93:     	movq	0xd0(%rbp), %rax
14544ae9a:     	movq	%rax, 0x70(%rbp)
14544ae9e:     	movq	0xd8(%rbp), %rax
14544aea5:     	movq	%rax, 0x78(%rbp)
14544aea9:     	movb	$0x0, 0x17f(%rbp)
14544aeb0:     	movq	%rsi, 0x20(%rsp)
14544aeb5:     	leaq	0x12f3473(%rip), %r8    # 0x14673e32f
14544aebc:     	leaq	0xd0(%rbp), %rcx
14544aec3:     	leaq	0x140(%rbp), %rdx
14544aeca:     	movl	$0x5, %r9d
14544aed0:     	callq	0x145456d90 <.text+0x5455d90>
14544aed5:     	nop
14544aed6:     	movq	0xd0(%rbp), %rdx
14544aedd:     	movq	0xe0(%rbp), %r15
14544aee4:     	cmpq	%r15, %rdx
14544aee7:     	je	0x14544af4a <.text+0x5449f4a>
14544aee9:     	movq	0xd8(%rbp), %rcx
14544aef0:     	movb	$0x7d, (%rcx,%r15)
14544aef5:     	cmpl	$0x2, 0x10(%r13)
14544aefa:     	jne	0x14544af8d <.text+0x5449f8d>
14544af00:     	testq	%rdx, %rdx
14544af03:     	jne	0x14544b331 <.text+0x544a331>
14544af09:     	jmp	0x14544b33c <.text+0x544a33c>
14544af0e:     	movq	$0x1, 0x20(%rsp)
14544af17:     	leaq	0xd0(%rbp), %rcx
14544af1e:     	movl	$0x1, %r8d
14544af24:     	movl	$0x1, %r9d
14544af2a:     	movq	0x138(%rbp), %rdx
14544af31:     	callq	0x1457744b0 <.text+0x57734b0>
14544af36:     	nop
14544af37:     	movq	0xd8(%rbp), %rax
14544af3e:     	movq	0xc8(%rbp), %r9
14544af45:     	jmp	0x14544ae7d <.text+0x5449e7d>
14544af4a:     	movq	$0x1, 0x20(%rsp)
14544af53:     	leaq	0xd0(%rbp), %rcx
14544af5a:     	movl	$0x1, %r8d
14544af60:     	movl	$0x1, %r9d
14544af66:     	movq	%r15, %rdx
14544af69:     	callq	0x1457744b0 <.text+0x57734b0>
14544af6e:     	nop
14544af6f:     	movq	0xd0(%rbp), %rdx
14544af76:     	movq	0xd8(%rbp), %rcx
14544af7d:     	movb	$0x7d, (%rcx,%r15)
14544af82:     	cmpl	$0x2, 0x10(%r13)
14544af87:     	je	0x14544af00 <.text+0x5449f00>
14544af8d:     	cmpl	$0x1, %r14d
14544af91:     	movq	%rdx, 0xc0(%rbp)
14544af98:     	movq	%rcx, 0xc8(%rbp)
14544af9f:     	jne	0x14544b059 <.text+0x544a059>
14544afa5:     	movb	$0x1, 0x185(%rbp)
14544afac:     	leaq	0x12f3381(%rip), %rbx   # 0x14673e334
14544afb3:     	movl	$0x56, %esi
14544afb8:     	movl	$0x56, %edx
14544afbd:     	movq	%rbx, %rcx
14544afc0:     	callq	0x145457cb0 <.text+0x5456cb0>
14544afc5:     	nop
14544afc6:     	movq	%rdx, %r8
14544afc9:     	testq	%rax, %rax
14544afcc:     	cmovneq	%rax, %rbx
14544afd0:     	cmoveq	%rsi, %r8
14544afd4:     	movq	%r12, 0xd0(%rbp)
14544afdb:     	movq	$0x5, 0xd8(%rbp)
14544afe6:     	leaq	0x48(%rbp), %rax
14544afea:     	movq	%rax, 0xe0(%rbp)
14544aff1:     	leaq	0x12f30e8(%rip), %rax   # 0x14673e0e0
14544aff8:     	movq	%rax, 0xe8(%rbp)
14544afff:     	movq	%rdi, 0xf0(%rbp)
14544b006:     	movq	$0x2, 0xf8(%rbp)
14544b011:     	leaq	0x134(%rbp), %rax
14544b018:     	movq	%rax, 0x100(%rbp)
14544b01f:     	leaq	0x12f336a(%rip), %rax   # 0x14673e390
14544b026:     	movq	%rax, 0x108(%rbp)
14544b02d:     	movb	$0x1, 0x185(%rbp)
14544b034:     	movq	$0x2, 0x20(%rsp)
14544b03d:     	leaq	0x140(%rbp), %rcx
14544b044:     	leaq	0xd0(%rbp), %r9
14544b04b:     	movq	%rbx, %rdx
14544b04e:     	callq	0x145458060 <.text+0x5457060>
14544b053:     	nop
14544b054:     	jmp	0x14544b1f6 <.text+0x544a1f6>
14544b059:     	movl	0xb0(%rbp), %eax
14544b05f:     	cmpl	0x68(%rbp), %eax
14544b062:     	jbe	0x14544b147 <.text+0x544a147>
14544b068:     	movb	$0x1, 0x185(%rbp)
14544b06f:     	leaq	0x12f3364(%rip), %rbx   # 0x14673e3da
14544b076:     	movl	$0x5b, %edx
14544b07b:     	movq	%rbx, %rcx
14544b07e:     	callq	0x145457cb0 <.text+0x5456cb0>
14544b083:     	nop
14544b084:     	movq	%rdx, %r8
14544b087:     	testq	%rax, %rax
14544b08a:     	cmovneq	%rax, %rbx
14544b08e:     	movl	$0x5b, %eax
14544b093:     	cmoveq	%rax, %r8
14544b097:     	movl	%r14d, 0x70(%rbp)
14544b09b:     	movq	%r12, 0xd0(%rbp)
14544b0a2:     	movq	$0x5, 0xd8(%rbp)
14544b0ad:     	leaq	0x48(%rbp), %rax
14544b0b1:     	movq	%rax, 0xe0(%rbp)
14544b0b8:     	leaq	0x12f3021(%rip), %rax   # 0x14673e0e0
14544b0bf:     	movq	%rax, 0xe8(%rbp)
14544b0c6:     	movq	%rdi, 0xf0(%rbp)
14544b0cd:     	movq	$0x2, 0xf8(%rbp)
14544b0d8:     	leaq	0x134(%rbp), %rax
14544b0df:     	movq	%rax, 0x100(%rbp)
14544b0e6:     	leaq	0x12f32a3(%rip), %rax   # 0x14673e390
14544b0ed:     	movq	%rax, 0x108(%rbp)
14544b0f4:     	leaq	0x12f333a(%rip), %rcx   # 0x14673e435
14544b0fb:     	movq	%rcx, 0x110(%rbp)
14544b102:     	movq	$0x1, 0x118(%rbp)
14544b10d:     	movq	%rsi, 0x120(%rbp)
14544b114:     	movq	%rax, 0x128(%rbp)
14544b11b:     	movb	$0x1, 0x185(%rbp)
14544b122:     	movq	$0x3, 0x20(%rsp)
14544b12b:     	leaq	0x140(%rbp), %rcx
14544b132:     	leaq	0xd0(%rbp), %r9
14544b139:     	movq	%rbx, %rdx
14544b13c:     	callq	0x145458060 <.text+0x5457060>
14544b141:     	nop
14544b142:     	jmp	0x14544b1f6 <.text+0x544a1f6>
14544b147:     	movb	$0x1, 0x185(%rbp)
14544b14e:     	leaq	0x12f325b(%rip), %rbx   # 0x14673e3b0
14544b155:     	movl	$0x2a, %esi
14544b15a:     	movl	$0x2a, %edx
14544b15f:     	movq	%rbx, %rcx
14544b162:     	callq	0x145457cb0 <.text+0x5456cb0>
14544b167:     	nop
14544b168:     	movq	%rdx, %r8
14544b16b:     	testq	%rax, %rax
14544b16e:     	cmovneq	%rax, %rbx
14544b172:     	cmoveq	%rsi, %r8
14544b176:     	movq	%r12, 0xd0(%rbp)
14544b17d:     	movq	$0x5, 0xd8(%rbp)
14544b188:     	leaq	0x48(%rbp), %rax
14544b18c:     	movq	%rax, 0xe0(%rbp)
14544b193:     	leaq	0x12f2f46(%rip), %rax   # 0x14673e0e0
14544b19a:     	movq	%rax, 0xe8(%rbp)
14544b1a1:     	movq	%rdi, 0xf0(%rbp)
14544b1a8:     	movq	$0x2, 0xf8(%rbp)
14544b1b3:     	leaq	0x134(%rbp), %rax
14544b1ba:     	movq	%rax, 0x100(%rbp)
14544b1c1:     	leaq	0x12f31c8(%rip), %rax   # 0x14673e390
14544b1c8:     	movq	%rax, 0x108(%rbp)
14544b1cf:     	movb	$0x1, 0x185(%rbp)
14544b1d6:     	movq	$0x2, 0x20(%rsp)
14544b1df:     	leaq	0x140(%rbp), %rcx
14544b1e6:     	leaq	0xd0(%rbp), %r9
14544b1ed:     	movq	%rbx, %rdx
14544b1f0:     	callq	0x145458060 <.text+0x5457060>
14544b1f5:     	nop
14544b1f6:     	leaq	0x140(%rbp), %rax
14544b1fd:     	movq	%rax, 0x70(%rbp)
14544b201:     	leaq	-0x5449128(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
14544b208:     	movq	%rax, 0x78(%rbp)
14544b20c:     	movb	$0x1, 0x17e(%rbp)
14544b213:     	leaq	0x12f321c(%rip), %rdx   # 0x14673e436
14544b21a:     	leaq	0xd0(%rbp), %rcx
14544b221:     	leaq	0x70(%rbp), %r8
14544b225:     	callq	0x145728390 <.text+0x5727390>
14544b22a:     	nop
14544b22b:     	movq	0x90(%rbp), %rbx
14544b232:     	movq	0xd0(%rbp), %rax
14544b239:     	movq	%rax, 0xb0(%rbp)
14544b240:     	movq	0xd8(%rbp), %rdx
14544b247:     	movq	0xe0(%rbp), %r8
14544b24e:     	movb	$0x1, 0x181(%rbp)
14544b255:     	leaq	0xd0(%rbp), %rcx
14544b25c:     	movq	%rdx, 0x68(%rbp)
14544b260:     	callq	0x14545dc90 <.text+0x545cc90>
14544b265:     	nop
14544b266:     	movq	0x570(%r13), %rsi
14544b26d:     	cmpq	0x560(%r13), %rsi
14544b274:     	jne	0x14544b283 <.text+0x544a283>
14544b276:     	leaq	0x560(%r13), %rcx
14544b27d:     	callq	0x145774710 <.text+0x5773710>
14544b282:     	nop
14544b283:     	movq	0x568(%r13), %rax
14544b28a:     	movq	%rsi, %rcx
14544b28d:     	shlq	$0x5, %rcx
14544b291:     	movups	0xd0(%rbp), %xmm0
14544b298:     	movups	0xe0(%rbp), %xmm1
14544b29f:     	movups	%xmm1, 0x10(%rax,%rcx)
14544b2a4:     	movups	%xmm0, (%rax,%rcx)
14544b2a8:     	incq	%rsi
14544b2ab:     	movq	%rsi, 0x570(%r13)
14544b2b2:     	movq	0x588(%r13), %rsi
14544b2b9:     	cmpq	0x578(%r13), %rsi
14544b2c0:     	jne	0x14544b2cf <.text+0x544a2cf>
14544b2c2:     	leaq	0x578(%r13), %rcx
14544b2c9:     	callq	0x1457745c0 <.text+0x57735c0>
14544b2ce:     	nop
14544b2cf:     	incq	%r15
14544b2d2:     	movq	0x580(%r13), %rax
14544b2d9:     	leaq	(%rsi,%rsi,2), %rcx
14544b2dd:     	movq	0xc0(%rbp), %rdx
14544b2e4:     	movq	%rdx, (%rax,%rcx,8)
14544b2e8:     	movq	0xc8(%rbp), %rdx
14544b2ef:     	movq	%rdx, 0x8(%rax,%rcx,8)
14544b2f4:     	movq	%r15, 0x10(%rax,%rcx,8)
14544b2f9:     	incq	%rsi
14544b2fc:     	movq	%rsi, 0x588(%r13)
14544b303:     	movq	0xb0(%rbp), %rdx
14544b30a:     	testq	%rdx, %rdx
14544b30d:     	je	0x14544b31e <.text+0x544a31e>
14544b30f:     	movl	$0x1, %r8d
14544b315:     	movq	0x68(%rbp), %rcx
14544b319:     	callq	0x1400021d0 <.text+0x11d0>
14544b31e:     	movq	0x140(%rbp), %rdx
14544b325:     	testq	%rdx, %rdx
14544b328:     	je	0x14544b33c <.text+0x544a33c>
14544b32a:     	movq	0x148(%rbp), %rcx
14544b331:     	movl	$0x1, %r8d
14544b337:     	callq	0x1400021d0 <.text+0x11d0>
14544b33c:     	movb	$0x1, %r12b
14544b33f:     	xorl	%r9d, %r9d
14544b342:     	leaq	0xa18(%r13), %r15
14544b349:     	movq	0xa20(%r13), %rax
14544b350:     	imulq	$0x38, 0xa28(%r13), %rdx
14544b358:     	xorl	%ecx, %ecx
14544b35a:     	movq	%rax, %r8
14544b35d:     	nopl	(%rax)
14544b360:     	cmpq	%rcx, %rdx
14544b363:     	je	0x14544b3a3 <.text+0x544a3a3>
14544b365:     	addq	$0x38, %rcx
14544b369:     	cmpq	%rbx, 0x18(%r8)
14544b36d:     	leaq	0x38(%r8), %r8
14544b371:     	jne	0x14544b360 <.text+0x544a360>
14544b373:     	movl	-0x18(%rax,%rcx), %edx
14544b377:     	movl	0x160(%rbp), %r8d
14544b37e:     	cmpl	%edx, %r8d
14544b381:     	cmoval	%r8d, %edx
14544b385:     	movl	-0x14(%rax,%rcx), %r8d
14544b38a:     	movl	%edx, -0x18(%rax,%rcx)
14544b38e:     	movq	0x170(%rbp), %rdx
14544b395:     	cmpl	%r8d, %edx
14544b398:     	cmoval	%edx, %r8d
14544b39c:     	movl	%r8d, -0x14(%rax,%rcx)
14544b3a1:     	jmp	0x14544b3cf <.text+0x544a3cf>
14544b3a3:     	cmpq	$-0x1, 0xdc0(%r13)
14544b3ab:     	je	0x14544b3cf <.text+0x544a3cf>
14544b3ad:     	cmpq	%rbx, 0xdd8(%r13)
14544b3b4:     	jne	0x14544b3cf <.text+0x544a3cf>
14544b3b6:     	movl	0xde0(%r13), %eax
14544b3bd:     	movl	0x160(%rbp), %ecx
14544b3c3:     	cmpl	%eax, %ecx
14544b3c5:     	cmoval	%ecx, %eax
14544b3c8:     	movl	%eax, 0xde0(%r13)
14544b3cf:     	cmpb	$0x0, 0x1042(%r13)
14544b3d7:     	je	0x14544b3f1 <.text+0x544a3f1>
14544b3d9:     	movb	%r9b, 0x187(%rbp)
14544b3e0:     	movq	%r15, %rcx
14544b3e3:     	movl	%r9d, %esi
14544b3e6:     	callq	0x1454356a0 <.text+0x54346a0>
14544b3eb:     	nop
14544b3ec:     	jmp	0x14544bb09 <.text+0x544ab09>
14544b3f1:     	movl	%r9d, 0x170(%rbp)
14544b3f8:     	movb	$0x1, 0x1042(%r13)
14544b400:     	testb	%r12b, 0x40(%rbp)
14544b404:     	je	0x14544ba78 <.text+0x544aa78>
14544b40a:     	movq	0x98(%rbp), %rcx
14544b411:     	movq	0xa0(%rbp), %rdx
14544b418:     	callq	0x145420480 <.text+0x541f480>
14544b41d:     	cmpq	$0xa, %rax
14544b421:     	ja	0x14544ba78 <.text+0x544aa78>
14544b427:     	leaq	0x1(%rax), %rdx
14544b42b:     	imulq	$0xf0, %rdx, %rcx
14544b432:     	leaq	0x12e80df(%rip), %r14   # 0x146733518
14544b439:     	addq	%rcx, %r14
14544b43c:     	movq	0xa38(%r13), %rcx
14544b443:     	movq	0xa40(%r13), %rdi
14544b44a:     	movq	%rdi, %rsi
14544b44d:     	shlq	$0x4, %rsi
14544b451:     	xorl	%r8d, %r8d
14544b454:     	movq	0x168(%rbp), %r10
14544b45b:     	nopl	(%rax,%rax)
14544b460:     	cmpq	%r8, %rsi
14544b463:     	je	0x14544b493 <.text+0x544a493>
14544b465:     	leaq	0x10(%r8), %r9
14544b469:     	cmpb	%r10b, (%rcx,%r8)
14544b46d:     	movq	%r9, %r8
14544b470:     	jne	0x14544b460 <.text+0x544a460>
14544b472:     	movq	-0x8(%rcx,%r9), %r9
14544b477:     	cmpq	$0xc, %r9
14544b47b:     	movl	$0xc, %r8d
14544b481:     	cmovbq	%r9, %r8
14544b485:     	testq	%r9, %r9
14544b488:     	je	0x14544b493 <.text+0x544a493>
14544b48a:     	cmpq	%rdx, %r8
14544b48d:     	ja	0x14544ba78 <.text+0x544aa78>
14544b493:     	xorl	%edx, %edx
14544b495:     	movq	0x168(%rbp), %r9
14544b49c:     	nopl	(%rax)
14544b4a0:     	cmpq	%rdx, %rsi
14544b4a3:     	je	0x14544b4bd <.text+0x544a4bd>
14544b4a5:     	leaq	0x10(%rdx), %r8
14544b4a9:     	cmpb	%r9b, (%rcx,%rdx)
14544b4ad:     	movq	%r8, %rdx
14544b4b0:     	jne	0x14544b4a0 <.text+0x544a4a0>
14544b4b2:     	addq	$0x2, %rax
14544b4b6:     	movq	%rax, -0x8(%rcx,%r8)
14544b4bb:     	jmp	0x14544b509 <.text+0x544a509>
14544b4bd:     	cmpq	0xa30(%r13), %rdi
14544b4c4:     	jne	0x14544b4ec <.text+0x544a4ec>
14544b4c6:     	movq	%rax, %rbx
14544b4c9:     	leaq	0xa30(%r13), %rcx
14544b4d0:     	movl	0x170(%rbp), %eax
14544b4d6:     	movb	%al, 0x187(%rbp)
14544b4dc:     	callq	0x145774860 <.text+0x5773860>
14544b4e1:     	nop
14544b4e2:     	movq	0xa38(%r13), %rcx
14544b4e9:     	movq	%rbx, %rax
14544b4ec:     	addq	$0x2, %rax
14544b4f0:     	movq	0x168(%rbp), %rdx
14544b4f7:     	movb	%dl, (%rcx,%rsi)
14544b4fa:     	movq	%rax, 0x8(%rcx,%rsi)
14544b4ff:     	incq	%rdi
14544b502:     	movq	%rdi, 0xa40(%r13)
14544b509:     	movl	0x170(%rbp), %eax
14544b50f:     	movb	%al, 0x187(%rbp)
14544b515:     	movq	%r15, %rcx
14544b518:     	callq	0x1454356a0 <.text+0x54346a0>
14544b51d:     	nop
14544b51e:     	movq	0x168(%rbp), %rax
14544b525:     	addb	$-0x2, %al
14544b527:     	cmpb	$0x9, %al
14544b529:     	ja	0x14544b53b <.text+0x544a53b>
14544b52b:     	movzbl	%al, %eax
14544b52e:     	leaq	0x12f3403(%rip), %rcx   # 0x14673e938
14544b535:     	movq	(%rcx,%rax,8), %rsi
14544b539:     	jmp	0x14544b542 <.text+0x544a542>
14544b53b:     	leaq	0x12ea306(%rip), %rsi   # 0x146735848
14544b542:     	movl	0x170(%rbp), %ecx
14544b548:     	leaq	0x10(%rsi), %rax
14544b54c:     	movq	%rax, 0x140(%rbp)
14544b553:     	leaq	-0x544949a(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14544b55a:     	movq	%rax, 0x148(%rbp)
14544b561:     	movb	%cl, 0x187(%rbp)
14544b567:     	leaq	0x12e036c(%rip), %rdx   # 0x14672b8da
14544b56e:     	leaq	0xd0(%rbp), %rcx
14544b575:     	leaq	0x140(%rbp), %r8
14544b57c:     	callq	0x145728390 <.text+0x5727390>
14544b581:     	nop
14544b582:     	movq	%r14, 0x168(%rbp)
14544b589:     	movq	0xd8(%rbp), %rcx
14544b590:     	movq	0xe0(%rbp), %rdx
14544b597:     	movq	0x20(%rsi), %r14
14544b59b:     	movq	0x28(%rsi), %rsi
14544b59f:     	movq	%rcx, 0x160(%rbp)
14544b5a6:     	callq	0x145457cb0 <.text+0x5456cb0>
14544b5ab:     	nop
14544b5ac:     	movq	%rax, %rbx
14544b5af:     	movq	%rdx, %rdi
14544b5b2:     	movq	0xd0(%rbp), %rdx
14544b5b9:     	testq	%rdx, %rdx
14544b5bc:     	je	0x14544b5d0 <.text+0x544a5d0>
14544b5be:     	movl	$0x1, %r8d
14544b5c4:     	movq	0x160(%rbp), %rcx
14544b5cb:     	callq	0x1400021d0 <.text+0x11d0>
14544b5d0:     	testq	%rbx, %rbx
14544b5d3:     	cmovneq	%rbx, %r14
14544b5d7:     	movq	%r14, %rbx
14544b5da:     	cmoveq	%rsi, %rdi
14544b5de:     	movq	%r14, 0x58(%rbp)
14544b5e2:     	movq	%rdi, 0x60(%rbp)
14544b5e6:     	callq	0x140002200 <.text+0x1200>
14544b5eb:     	movl	$0x1, %ecx
14544b5f0:     	movl	$0x1, %edx
14544b5f5:     	callq	0x1400021c0 <.text+0x11c0>
14544b5fa:     	testq	%rax, %rax
14544b5fd:     	je	0x14544bc05 <.text+0x544ac05>
14544b603:     	movb	$0x7b, (%rax)
14544b606:     	movq	$0x1, 0xd0(%rbp)
14544b611:     	movq	%rax, 0xd8(%rbp)
14544b618:     	movq	$0x1, 0xe0(%rbp)
14544b623:     	movb	$0x1, 0xe8(%rbp)
14544b62a:     	movl	0x170(%rbp), %eax
14544b630:     	movb	%al, 0x187(%rbp)
14544b636:     	leaq	0x12f2e09(%rip), %rax   # 0x14673e446
14544b63d:     	movq	%rax, 0x20(%rsp)
14544b642:     	movq	$0x8, 0x28(%rsp)
14544b64b:     	leaq	0x12f2a11(%rip), %r8    # 0x14673e063
14544b652:     	leaq	0x140(%rbp), %rcx
14544b659:     	leaq	0xd0(%rbp), %rdx
14544b660:     	movl	$0x4, %r9d
14544b666:     	callq	0x145456ed0 <.text+0x5455ed0>
14544b66b:     	nop
14544b66c:     	movq	0x168(%rbp), %r14
14544b673:     	movq	%rbx, 0x160(%rbp)
14544b67a:     	leaq	0x8(%r14), %rax
14544b67e:     	movq	%rax, 0xa0(%rbp)
14544b685:     	movq	%rax, 0x70(%rbp)
14544b689:     	leaq	-0x54495d0(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14544b690:     	movq	%rax, 0x78(%rbp)
14544b694:     	movb	$0x1, 0x180(%rbp)
14544b69b:     	leaq	0x12e02ad(%rip), %rdx   # 0x14672b94f
14544b6a2:     	leaq	0xd0(%rbp), %rcx
14544b6a9:     	leaq	0x70(%rbp), %r8
14544b6ad:     	callq	0x145728390 <.text+0x5727390>
14544b6b2:     	nop
14544b6b3:     	movq	0xd8(%rbp), %rcx
14544b6ba:     	movq	0xe0(%rbp), %rdx
14544b6c1:     	movq	0x18(%r14), %rsi
14544b6c5:     	movq	0x20(%r14), %rax
14544b6c9:     	movq	%rax, 0x168(%rbp)
14544b6d0:     	movq	%rcx, 0x98(%rbp)
14544b6d7:     	callq	0x145457cb0 <.text+0x5456cb0>
14544b6dc:     	nop
14544b6dd:     	movq	%rax, %rbx
14544b6e0:     	movq	%rdx, %r14
14544b6e3:     	movq	0xd0(%rbp), %rdx
14544b6ea:     	testq	%rdx, %rdx
14544b6ed:     	je	0x14544b701 <.text+0x544a701>
14544b6ef:     	movl	$0x1, %r8d
14544b6f5:     	movq	0x98(%rbp), %rcx
14544b6fc:     	callq	0x1400021d0 <.text+0x11d0>
14544b701:     	testq	%rbx, %rbx
14544b704:     	cmoveq	%rsi, %rbx
14544b708:     	cmoveq	0x168(%rbp), %r14
14544b710:     	movb	$0x0, 0x180(%rbp)
14544b717:     	movq	%r14, 0x28(%rsp)
14544b71c:     	movq	%rbx, 0x20(%rsp)
14544b721:     	leaq	0x12f2a76(%rip), %r8    # 0x14673e19e
14544b728:     	leaq	0xd0(%rbp), %rcx
14544b72f:     	leaq	0x140(%rbp), %rdx
14544b736:     	movl	$0x2, %r9d
14544b73c:     	callq	0x145456ed0 <.text+0x5455ed0>
14544b741:     	nop
14544b742:     	movq	%rsi, 0x98(%rbp)
14544b749:     	movl	0x170(%rbp), %eax
14544b74f:     	movb	%al, 0x187(%rbp)
14544b755:     	movq	%rdi, 0x28(%rsp)
14544b75a:     	movq	0x160(%rbp), %rax
14544b761:     	movq	%rax, 0x20(%rsp)
14544b766:     	leaq	0x12f2997(%rip), %r8    # 0x14673e104
14544b76d:     	leaq	0x140(%rbp), %rcx
14544b774:     	leaq	0xd0(%rbp), %rdx
14544b77b:     	movl	$0x5, %r9d
14544b781:     	callq	0x145456ed0 <.text+0x5455ed0>
14544b786:     	nop
14544b787:     	movq	0x140(%rbp), %rdx
14544b78e:     	movq	0x150(%rbp), %rsi
14544b795:     	cmpq	%rsi, %rdx
14544b798:     	je	0x14544bb7c <.text+0x544ab7c>
14544b79e:     	movq	0x148(%rbp), %rcx
14544b7a5:     	movb	$0x7d, (%rcx,%rsi)
14544b7a9:     	cmpl	$0x2, 0x10(%r13)
14544b7ae:     	movq	0x90(%rbp), %rbx
14544b7b5:     	jne	0x14544b7d0 <.text+0x544a7d0>
14544b7b7:     	testq	%rdx, %rdx
14544b7ba:     	je	0x14544ba78 <.text+0x544aa78>
14544b7c0:     	movl	$0x1, %r8d
14544b7c6:     	callq	0x1400021d0 <.text+0x11d0>
14544b7cb:     	jmp	0x14544ba78 <.text+0x544aa78>
14544b7d0:     	movq	%rcx, 0xa8(%rbp)
14544b7d7:     	movq	%rdx, 0xb8(%rbp)
14544b7de:     	movb	$0x1, 0x184(%rbp)
14544b7e5:     	leaq	0x12f2c62(%rip), %r14   # 0x14673e44e
14544b7ec:     	movl	$0x24, %edx
14544b7f1:     	movq	%r14, %rcx
14544b7f4:     	callq	0x145457cb0 <.text+0x5456cb0>
14544b7f9:     	movq	%rax, 0x138(%rbp)
14544b800:     	movq	%rdx, 0x160(%rbp)
14544b807:     	movq	0xa0(%rbp), %rax
14544b80e:     	movq	%rax, 0x140(%rbp)
14544b815:     	leaq	-0x544975c(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14544b81c:     	movq	%rax, 0x148(%rbp)
14544b823:     	movb	$0x1, 0x184(%rbp)
14544b82a:     	leaq	0x12e011e(%rip), %rdx   # 0x14672b94f
14544b831:     	leaq	0xd0(%rbp), %rcx
14544b838:     	leaq	0x140(%rbp), %r8
14544b83f:     	callq	0x145728390 <.text+0x5727390>
14544b844:     	nop
14544b845:     	movq	0xd8(%rbp), %rcx
14544b84c:     	movq	0xe0(%rbp), %rdx
14544b853:     	movq	%rcx, 0xa0(%rbp)
14544b85a:     	callq	0x145457cb0 <.text+0x5456cb0>
14544b85f:     	nop
14544b860:     	movq	%rax, %rdi
14544b863:     	movq	%rdx, %rbx
14544b866:     	movq	0xd0(%rbp), %rdx
14544b86d:     	testq	%rdx, %rdx
14544b870:     	je	0x14544b884 <.text+0x544a884>
14544b872:     	movl	$0x1, %r8d
14544b878:     	movq	0xa0(%rbp), %rcx
14544b87f:     	callq	0x1400021d0 <.text+0x11d0>
14544b884:     	movq	0x138(%rbp), %rcx
14544b88b:     	testq	%rcx, %rcx
14544b88e:     	movl	$0x24, %eax
14544b893:     	movq	0x160(%rbp), %r8
14544b89a:     	cmoveq	%rax, %r8
14544b89e:     	cmovneq	%rcx, %r14
14544b8a2:     	testq	%rdi, %rdi
14544b8a5:     	movq	0x98(%rbp), %rax
14544b8ac:     	cmovneq	%rdi, %rax
14544b8b0:     	cmoveq	0x168(%rbp), %rbx
14544b8b8:     	movq	%rax, 0x48(%rbp)
14544b8bc:     	movq	%rbx, 0x50(%rbp)
14544b8c0:     	leaq	0x12f2842(%rip), %rax   # 0x14673e109
14544b8c7:     	movq	%rax, 0xd0(%rbp)
14544b8ce:     	movq	$0x4, 0xd8(%rbp)
14544b8d9:     	leaq	0x48(%rbp), %rax
14544b8dd:     	movq	%rax, 0xe0(%rbp)
14544b8e4:     	leaq	0x12f27f5(%rip), %rax   # 0x14673e0e0
14544b8eb:     	movq	%rax, 0xe8(%rbp)
14544b8f2:     	leaq	0x12f280b(%rip), %rcx   # 0x14673e104
14544b8f9:     	movq	%rcx, 0xf0(%rbp)
14544b900:     	movq	$0x5, 0xf8(%rbp)
14544b90b:     	leaq	0x58(%rbp), %rcx
14544b90f:     	movq	%rcx, 0x100(%rbp)
14544b916:     	movq	%rax, 0x108(%rbp)
14544b91d:     	movb	$0x1, 0x184(%rbp)
14544b924:     	movq	$0x2, 0x20(%rsp)
14544b92d:     	leaq	0x140(%rbp), %rdi
14544b934:     	leaq	0xd0(%rbp), %r9
14544b93b:     	movq	%rdi, %rcx
14544b93e:     	movq	%r14, %rdx
14544b941:     	callq	0x145458060 <.text+0x5457060>
14544b946:     	nop
14544b947:     	movq	%rdi, -0x38(%rbp)
14544b94b:     	leaq	-0x5449872(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
14544b952:     	movq	%rax, -0x30(%rbp)
14544b956:     	leaq	0x12f2b15(%rip), %rdx   # 0x14673e472
14544b95d:     	leaq	0x70(%rbp), %rcx
14544b961:     	leaq	-0x38(%rbp), %r8
14544b965:     	callq	0x145728390 <.text+0x5727390>
14544b96a:     	nop
14544b96b:     	movq	0x90(%rbp), %rbx
14544b972:     	movq	0x140(%rbp), %rdx
14544b979:     	testq	%rdx, %rdx
14544b97c:     	je	0x14544b990 <.text+0x544a990>
14544b97e:     	movq	0x148(%rbp), %rcx
14544b985:     	movl	$0x1, %r8d
14544b98b:     	callq	0x1400021d0 <.text+0x11d0>
14544b990:     	movq	%rsi, %rdi
14544b993:     	movq	0x70(%rbp), %rax
14544b997:     	movq	%rax, 0x168(%rbp)
14544b99e:     	movq	0x78(%rbp), %rdx
14544b9a2:     	movq	0x80(%rbp), %r8
14544b9a9:     	leaq	0xd0(%rbp), %rcx
14544b9b0:     	movq	%rdx, 0x160(%rbp)
14544b9b7:     	callq	0x14545dc90 <.text+0x545cc90>
14544b9bc:     	nop
14544b9bd:     	movq	0x570(%r13), %rsi
14544b9c4:     	cmpq	0x560(%r13), %rsi
14544b9cb:     	jne	0x14544b9da <.text+0x544a9da>
14544b9cd:     	leaq	0x560(%r13), %rcx
14544b9d4:     	callq	0x145774710 <.text+0x5773710>
14544b9d9:     	nop
14544b9da:     	movq	0x568(%r13), %rax
14544b9e1:     	movq	%rsi, %rcx
14544b9e4:     	shlq	$0x5, %rcx
14544b9e8:     	movups	0xd0(%rbp), %xmm0
14544b9ef:     	movups	0xe0(%rbp), %xmm1
14544b9f6:     	movups	%xmm1, 0x10(%rax,%rcx)
14544b9fb:     	movups	%xmm0, (%rax,%rcx)
14544b9ff:     	incq	%rsi
14544ba02:     	movq	%rsi, 0x570(%r13)
14544ba09:     	movq	0x168(%rbp), %rdx
14544ba10:     	testq	%rdx, %rdx
14544ba13:     	je	0x14544ba27 <.text+0x544aa27>
14544ba15:     	movl	$0x1, %r8d
14544ba1b:     	movq	0x160(%rbp), %rcx
14544ba22:     	callq	0x1400021d0 <.text+0x11d0>
14544ba27:     	movq	0x588(%r13), %rsi
14544ba2e:     	cmpq	0x578(%r13), %rsi
14544ba35:     	jne	0x14544ba44 <.text+0x544aa44>
14544ba37:     	leaq	0x578(%r13), %rcx
14544ba3e:     	callq	0x1457745c0 <.text+0x57735c0>
14544ba43:     	nop
14544ba44:     	incq	%rdi
14544ba47:     	movq	0x580(%r13), %rax
14544ba4e:     	leaq	(%rsi,%rsi,2), %rcx
14544ba52:     	movq	0xb8(%rbp), %rdx
14544ba59:     	movq	%rdx, (%rax,%rcx,8)
14544ba5d:     	movq	0xa8(%rbp), %rdx
14544ba64:     	movq	%rdx, 0x8(%rax,%rcx,8)
14544ba69:     	movq	%rdi, 0x10(%rax,%rcx,8)
14544ba6e:     	incq	%rsi
14544ba71:     	movq	%rsi, 0x588(%r13)
14544ba78:     	movq	0xa20(%r13), %rax
14544ba7f:     	imulq	$0x38, 0xa28(%r13), %rdx
14544ba87:     	xorl	%ecx, %ecx
14544ba89:     	movq	%rax, %r8
14544ba8c:     	movl	0x170(%rbp), %r9d
14544ba93:     	nopw	%cs:(%rax,%rax)
14544baa0:     	cmpq	%rcx, %rdx
14544baa3:     	je	0x14544babf <.text+0x544aabf>
14544baa5:     	addq	$0x38, %rcx
14544baa9:     	cmpq	%rbx, 0x18(%r8)
14544baad:     	leaq	0x38(%r8), %r8
14544bab1:     	jne	0x14544baa0 <.text+0x544aaa0>
14544bab3:     	incl	-0x10(%rax,%rcx)
14544bab7:     	movq	0x40(%rbp), %rdx
14544babb:     	addl	%edx, -0xc(%rax,%rcx)
14544babf:     	testb	%r12b, %r12b
14544bac2:     	je	0x14544baf6 <.text+0x544aaf6>
14544bac4:     	movq	0xbc8(%r13), %rax
14544bacb:     	incq	%rax
14544bace:     	movq	$-0x1, %rcx
14544bad5:     	cmoveq	%rcx, %rax
14544bad9:     	movq	%rax, 0xbc8(%r13)
14544bae0:     	movq	0x40(%rbp), %rax
14544bae4:     	addq	0xbd0(%r13), %rax
14544baeb:     	cmovbq	%rcx, %rax
14544baef:     	movq	%rax, 0xbd0(%r13)
14544baf6:     	movb	%r9b, 0x187(%rbp)
14544bafd:     	movq	%r15, %rcx
14544bb00:     	movl	%r9d, %esi
14544bb03:     	callq	0x1454356a0 <.text+0x54346a0>
14544bb08:     	nop
14544bb09:     	testb	%sil, %sil
14544bb0c:     	je	0x14544bb2a <.text+0x544ab2a>
14544bb0e:     	movq	0x20(%rbp), %rdx
14544bb12:     	testq	%rdx, %rdx
14544bb15:     	je	0x14544bb2a <.text+0x544ab2a>
14544bb17:     	movq	0x28(%rbp), %rcx
14544bb1b:     	shlq	$0x4, %rdx
14544bb1f:     	movl	$0x8, %r8d
14544bb25:     	callq	0x1400021d0 <.text+0x11d0>
14544bb2a:     	movaps	0x190(%rbp), %xmm6
14544bb31:     	movaps	0x1a0(%rbp), %xmm7
14544bb38:     	movaps	0x1b0(%rbp), %xmm8
14544bb40:     	movaps	0x1c0(%rbp), %xmm9
14544bb48:     	movaps	0x1d0(%rbp), %xmm10
14544bb50:     	movaps	0x1e0(%rbp), %xmm11
14544bb58:     	movaps	0x1f0(%rbp), %xmm12
14544bb60:     	movaps	0x200(%rbp), %xmm13
14544bb68:     	addq	$0x298, %rsp            # imm = 0x298
14544bb6f:     	popq	%rbx
14544bb70:     	popq	%rdi
14544bb71:     	popq	%rsi
14544bb72:     	popq	%r12
14544bb74:     	popq	%r13
14544bb76:     	popq	%r14
14544bb78:     	popq	%r15
14544bb7a:     	popq	%rbp
14544bb7b:     	retq
14544bb7c:     	movq	$0x1, 0x20(%rsp)
14544bb85:     	leaq	0x140(%rbp), %rcx
14544bb8c:     	movl	$0x1, %r8d
14544bb92:     	movl	$0x1, %r9d
14544bb98:     	movq	%rsi, %rdi
14544bb9b:     	movq	%rsi, %rdx
14544bb9e:     	callq	0x1457744b0 <.text+0x57734b0>
14544bba3:     	nop
14544bba4:     	movq	0x140(%rbp), %rdx
14544bbab:     	movq	0xb8(%rbp), %r13
14544bbb2:     	movq	%rdi, %rsi
14544bbb5:     	jmp	0x14544b79e <.text+0x544a79e>
14544bbba:     	movb	$0x1, 0x187(%rbp)
14544bbc1:     	movl	$0x1, %ecx
14544bbc6:     	movl	$0x1, %edx
14544bbcb:     	callq	0x14590379b <.text+0x590279b>
14544bbd0:     	nop
14544bbd1:     	jmp	0x14544bc21 <.text+0x544ac21>
14544bbd3:     	movb	$0x1, 0x186(%rbp)
14544bbda:     	movl	$0x1, %ecx
14544bbdf:     	movl	$0x1, %edx
14544bbe4:     	callq	0x14590379b <.text+0x590279b>
14544bbe9:     	nop
14544bbea:     	jmp	0x14544bc21 <.text+0x544ac21>
14544bbec:     	movb	$0x1, 0x183(%rbp)
14544bbf3:     	movl	$0x1, %ecx
14544bbf8:     	movl	$0x1, %edx
14544bbfd:     	callq	0x14590379b <.text+0x590279b>
14544bc02:     	nop
14544bc03:     	jmp	0x14544bc21 <.text+0x544ac21>
14544bc05:     	movl	0x170(%rbp), %eax
14544bc0b:     	movb	%al, 0x187(%rbp)
14544bc11:     	movl	$0x1, %ecx
14544bc16:     	movl	$0x1, %edx
14544bc1b:     	callq	0x14590379b <.text+0x590279b>
14544bc20:     	nop
14544bc21:     	ud2
