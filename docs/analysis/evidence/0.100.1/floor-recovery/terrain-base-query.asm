
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455264f0:     	pushq	%r15
1455264f2:     	pushq	%r14
1455264f4:     	pushq	%r13
1455264f6:     	pushq	%r12
1455264f8:     	pushq	%rsi
1455264f9:     	pushq	%rdi
1455264fa:     	pushq	%rbp
1455264fb:     	pushq	%rbx
1455264fc:     	subq	$0x78, %rsp
145526500:     	movaps	%xmm9, 0x60(%rsp)
145526506:     	movaps	%xmm8, 0x50(%rsp)
14552650c:     	movaps	%xmm7, 0x40(%rsp)
145526511:     	movaps	%xmm6, 0x30(%rsp)
145526516:     	movq	0x10(%rcx), %rbx
14552651a:     	movq	0x28(%rcx), %rax
14552651e:     	cmpq	%rbx, %rax
145526521:     	cmovbq	%rax, %rbx
145526525:     	xorl	%esi, %esi
145526527:     	testq	%rbx, %rbx
14552652a:     	je	0x1455266b9 <.text+0x55256b9>
145526530:     	movaps	%xmm2, %xmm6
145526533:     	movaps	%xmm1, %xmm7
145526536:     	movq	0x8(%rcx), %r14
14552653a:     	movq	0x20(%rcx), %r15
14552653e:     	movaps	%xmm1, %xmm8
145526542:     	unpcklps	%xmm2, %xmm8            # xmm8 = xmm8[0],xmm2[0],xmm8[1],xmm2[1]
145526546:     	xorps	%xmm9, %xmm9
14552654a:     	addps	%xmm8, %xmm9
14552654e:     	leaq	0xc(%r15), %r12
145526552:     	leaq	0x10(%r14), %r13
145526556:     	leaq	0x20(%rsp), %rdi
14552655b:     	movq	%rbx, %rbp
14552655e:     	jmp	0x14552656d <.text+0x552556d>
145526560:     	addq	$0x10, %r12
145526564:     	addq	$0x48, %r13
145526568:     	decq	%rbp
14552656b:     	je	0x1455265bb <.text+0x55255bb>
14552656d:     	ucomiss	-0xc(%r12), %xmm7
145526573:     	jb	0x145526560 <.text+0x5525560>
145526575:     	ucomiss	-0x8(%r12), %xmm6
14552657b:     	jb	0x145526560 <.text+0x5525560>
14552657d:     	movss	-0x4(%r12), %xmm0
145526584:     	ucomiss	%xmm7, %xmm0
145526587:     	jb	0x145526560 <.text+0x5525560>
145526589:     	movss	(%r12), %xmm0
14552658f:     	ucomiss	%xmm6, %xmm0
145526592:     	jb	0x145526560 <.text+0x5525560>
145526594:     	movq	-0x8(%r13), %rcx
145526598:     	movq	(%r13), %rdx
14552659c:     	movlps	%xmm9, 0x20(%rsp)
1455265a2:     	movl	$0x0, 0x28(%rsp)
1455265aa:     	movq	%rdi, %r8
1455265ad:     	callq	0x14568f2e0 <.text+0x568e2e0>
1455265b2:     	testb	$0x1, %al
1455265b4:     	je	0x145526560 <.text+0x5525560>
1455265b6:     	jmp	0x1455266b2 <.text+0x55256b2>
1455265bb:     	movaps	0x180e1fe(%rip), %xmm6  # 0x146d347c0
1455265c2:     	addps	%xmm8, %xmm6
1455265c6:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
1455265ca:     	leaq	0xc(%r15), %r12
1455265ce:     	leaq	0x10(%r14), %r13
1455265d2:     	leaq	0x20(%rsp), %rdi
1455265d7:     	movq	%rbx, %rbp
1455265da:     	jmp	0x1455265ed <.text+0x55255ed>
1455265dc:     	nopl	(%rax)
1455265e0:     	addq	$0x10, %r12
1455265e4:     	addq	$0x48, %r13
1455265e8:     	decq	%rbp
1455265eb:     	je	0x145526637 <.text+0x5525637>
1455265ed:     	ucomiss	-0xc(%r12), %xmm6
1455265f3:     	jb	0x1455265e0 <.text+0x55255e0>
1455265f5:     	ucomiss	-0x8(%r12), %xmm7
1455265fb:     	jb	0x1455265e0 <.text+0x55255e0>
1455265fd:     	movss	-0x4(%r12), %xmm0
145526604:     	ucomiss	%xmm6, %xmm0
145526607:     	jb	0x1455265e0 <.text+0x55255e0>
145526609:     	movss	(%r12), %xmm0
14552660f:     	ucomiss	%xmm7, %xmm0
145526612:     	jb	0x1455265e0 <.text+0x55255e0>
145526614:     	movq	-0x8(%r13), %rcx
145526618:     	movq	(%r13), %rdx
14552661c:     	movlps	%xmm6, 0x20(%rsp)
145526621:     	movl	$0x0, 0x28(%rsp)
145526629:     	movq	%rdi, %r8
14552662c:     	callq	0x14568f2e0 <.text+0x568e2e0>
145526631:     	testb	$0x1, %al
145526633:     	je	0x1455265e0 <.text+0x55255e0>
145526635:     	jmp	0x1455266b2 <.text+0x55256b2>
145526637:     	addps	0x180e191(%rip), %xmm8  # 0x146d347d0
14552663f:     	movshdup	%xmm8, %xmm6            # xmm6 = xmm8[1,1,3,3]
145526644:     	addq	$0xc, %r15
145526648:     	addq	$0x10, %r14
14552664c:     	leaq	0x20(%rsp), %rdi
145526651:     	jmp	0x14552666d <.text+0x552566d>
145526653:     	nopw	%cs:(%rax,%rax)
145526660:     	addq	$0x10, %r15
145526664:     	addq	$0x48, %r14
145526668:     	decq	%rbx
14552666b:     	je	0x1455266b9 <.text+0x55256b9>
14552666d:     	ucomiss	-0xc(%r15), %xmm8
145526672:     	jb	0x145526660 <.text+0x5525660>
145526674:     	ucomiss	-0x8(%r15), %xmm6
145526679:     	jb	0x145526660 <.text+0x5525660>
14552667b:     	movss	-0x4(%r15), %xmm0
145526681:     	ucomiss	%xmm8, %xmm0
145526685:     	jb	0x145526660 <.text+0x5525660>
145526687:     	movss	(%r15), %xmm0
14552668c:     	ucomiss	%xmm6, %xmm0
14552668f:     	jb	0x145526660 <.text+0x5525660>
145526691:     	movq	-0x8(%r14), %rcx
145526695:     	movq	(%r14), %rdx
145526698:     	movlps	%xmm8, 0x20(%rsp)
14552669e:     	movl	$0x0, 0x28(%rsp)
1455266a6:     	movq	%rdi, %r8
1455266a9:     	callq	0x14568f2e0 <.text+0x568e2e0>
1455266ae:     	testb	$0x1, %al
1455266b0:     	je	0x145526660 <.text+0x5525660>
1455266b2:     	movl	$0x1, %esi
1455266b7:     	jmp	0x1455266b9 <.text+0x55256b9>
1455266b9:     	movl	%esi, %eax
1455266bb:     	movaps	0x30(%rsp), %xmm6
1455266c0:     	movaps	0x40(%rsp), %xmm7
1455266c5:     	movaps	0x50(%rsp), %xmm8
1455266cb:     	movaps	0x60(%rsp), %xmm9
1455266d1:     	addq	$0x78, %rsp
1455266d5:     	popq	%rbx
1455266d6:     	popq	%rbp
1455266d7:     	popq	%rdi
1455266d8:     	popq	%rsi
1455266d9:     	popq	%r12
1455266db:     	popq	%r13
1455266dd:     	popq	%r14
1455266df:     	popq	%r15
1455266e1:     	retq
