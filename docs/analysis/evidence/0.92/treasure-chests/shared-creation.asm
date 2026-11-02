
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14549d330:     	pushq	%rbp
14549d331:     	pushq	%r15
14549d333:     	pushq	%r14
14549d335:     	pushq	%r13
14549d337:     	pushq	%r12
14549d339:     	pushq	%rsi
14549d33a:     	pushq	%rdi
14549d33b:     	pushq	%rbx
14549d33c:     	subq	$0x158, %rsp            # imm = 0x158
14549d343:     	leaq	0x80(%rsp), %rbp
14549d34b:     	movaps	%xmm8, 0xc0(%rbp)
14549d353:     	movaps	%xmm7, 0xb0(%rbp)
14549d35a:     	movaps	%xmm6, 0xa0(%rbp)
14549d361:     	movq	$-0x2, 0x98(%rbp)
14549d36c:     	movq	%r9, %r14
14549d36f:     	movl	%r8d, %r12d
14549d372:     	movl	%edx, %r15d
14549d375:     	movq	%rcx, %rdi
14549d378:     	movq	0x210(%rcx), %rcx
14549d37f:     	movq	0x218(%rdi), %rdx
14549d386:     	callq	0x1453e23e0 <.text+0x53e13e0>
14549d38b:     	imulq	$0xb8, %rax, %rsi
14549d392:     	leaq	0x123566f(%rip), %rbx   # 0x1466d2a08
14549d399:     	movsd	(%r14), %xmm6
14549d39e:     	movsd	0x98(%rsi,%rbx), %xmm7
14549d3a7:     	movaps	%xmm6, %xmm8
14549d3ab:     	subps	%xmm7, %xmm8
14549d3af:     	movshdup	%xmm8, %xmm1            # xmm1 = xmm8[1,1,3,3]
14549d3b4:     	movaps	%xmm8, %xmm0
14549d3b8:     	callq	0x145714a7b <.text+0x5713a7b>
14549d3bd:     	movss	0xa8(%rsi,%rbx), %xmm1
14549d3c6:     	addss	0x41c84a(%rip), %xmm1   # 0x1458b9c18
14549d3ce:     	maxss	0x40b04a(%rip), %xmm1   # 0x1458a8420
14549d3d6:     	ucomiss	%xmm0, %xmm1
14549d3d9:     	jae	0x14549d408 <.text+0x549c408>
14549d3db:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
14549d3df:     	divps	%xmm0, %xmm8
14549d3e3:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
14549d3e7:     	mulps	%xmm8, %xmm0
14549d3eb:     	addps	%xmm0, %xmm7
14549d3ee:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
14549d3f2:     	movq	0x868(%rdi), %rcx
14549d3f9:     	addq	$0x10, %rcx
14549d3fd:     	movaps	%xmm7, %xmm1
14549d400:     	callq	0x1453f66f0 <.text+0x53f56f0>
14549d405:     	movaps	%xmm7, %xmm6
14549d408:     	movl	$0x5, %r14d
14549d40e:     	movl	%r15d, %eax
14549d411:     	leaq	0x1613f8c(%rip), %rcx   # 0x146ab13a4
14549d418:     	movslq	(%rcx,%rax,4), %rax
14549d41c:     	addq	%rcx, %rax
14549d41f:     	jmpq	*%rax
14549d421:     	movq	0x530(%rdi), %rax
14549d428:     	testq	%rax, %rax
14549d42b:     	je	0x14549d6d9 <.text+0x549c6d9>
14549d431:     	movq	0x528(%rdi), %rcx
14549d438:     	xorl	%edx, %edx
14549d43a:     	cmpq	$0x1, %rax
14549d43e:     	jne	0x14549d605 <.text+0x549c605>
14549d444:     	xorl	%r9d, %r9d
14549d447:     	xorl	%r8d, %r8d
14549d44a:     	jmp	0x14549d659 <.text+0x549c659>
14549d44f:     	movl	%r15d, %r13d
14549d452:     	movq	0x530(%rdi), %rax
14549d459:     	movl	$0x3, %r14d
14549d45f:     	movl	$0x232d, 0x5c(%rbp)     # imm = 0x232D
14549d466:     	movabsq	$0x3f80000000000103, %r15 # imm = 0x3F80000000000103
14549d470:     	testq	%rax, %rax
14549d473:     	je	0x14549e16d <.text+0x549d16d>
14549d479:     	movq	0x528(%rdi), %rcx
14549d480:     	cmpq	$0x4, %rax
14549d484:     	jae	0x14549d490 <.text+0x549c490>
14549d486:     	xorl	%edx, %edx
14549d488:     	xorl	%r8d, %r8d
14549d48b:     	jmp	0x14549d521 <.text+0x549c521>
14549d490:     	movq	%rax, %rdx
14549d493:     	andq	$-0x4, %rdx
14549d497:     	leaq	0xf8(%rcx), %r8
14549d49e:     	xorps	%xmm0, %xmm0
14549d4a1:     	movdqa	0x1611657(%rip), %xmm1  # 0x146aaeb00
14549d4a9:     	movdqa	0x40ad6f(%rip), %xmm2   # 0x1458a8220
14549d4b1:     	movq	%rdx, %r9
14549d4b4:     	pxor	%xmm3, %xmm3
14549d4b8:     	nopl	(%rax,%rax)
14549d4c0:     	movd	-0x90(%r8), %xmm4
14549d4c9:     	movd	-0xd8(%r8), %xmm5
14549d4d2:     	punpcklqdq	%xmm4, %xmm5    # xmm5 = xmm5[0],xmm4[0]
14549d4d6:     	movd	(%r8), %xmm4
14549d4db:     	movd	-0x48(%r8), %xmm7
14549d4e1:     	punpcklqdq	%xmm4, %xmm7    # xmm7 = xmm7[0],xmm4[0]
14549d4e5:     	pcmpeqd	%xmm1, %xmm5
14549d4e9:     	pand	%xmm2, %xmm5
14549d4ed:     	paddq	%xmm5, %xmm3
14549d4f1:     	pcmpeqd	%xmm1, %xmm7
14549d4f5:     	pand	%xmm2, %xmm7
14549d4f9:     	paddq	%xmm7, %xmm0
14549d4fd:     	addq	$0x120, %r8             # imm = 0x120
14549d504:     	addq	$-0x4, %r9
14549d508:     	jne	0x14549d4c0 <.text+0x549c4c0>
14549d50a:     	paddq	%xmm3, %xmm0
14549d50e:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
14549d513:     	paddq	%xmm0, %xmm1
14549d517:     	movq	%xmm1, %r8
14549d51c:     	cmpq	%rdx, %rax
14549d51f:     	je	0x14549d556 <.text+0x549c556>
14549d521:     	movq	%rax, %r9
14549d524:     	subq	%rdx, %r9
14549d527:     	leaq	(%rdx,%rdx,8), %rdx
14549d52b:     	leaq	(%rcx,%rdx,8), %rdx
14549d52f:     	addq	$0x20, %rdx
14549d533:     	nopw	%cs:(%rax,%rax)
14549d540:     	xorl	%r10d, %r10d
14549d543:     	cmpl	$0x2, (%rdx)
14549d546:     	sete	%r10b
14549d54a:     	addq	%r10, %r8
14549d54d:     	addq	$0x48, %rdx
14549d551:     	decq	%r9
14549d554:     	jne	0x14549d540 <.text+0x549c540>
14549d556:     	cmpq	$0x5, %r8
14549d55a:     	jb	0x14549e16d <.text+0x549d16d>
14549d560:     	shlq	$0x3, %rax
14549d564:     	leaq	(%rax,%rax,8), %rax
14549d568:     	xorl	%r9d, %r9d
14549d56b:     	xorl	%r8d, %r8d
14549d56e:     	nop
14549d570:     	cmpq	%r8, %rax
14549d573:     	je	0x14549e16d <.text+0x549d16d>
14549d579:     	leaq	0x48(%r8), %rdx
14549d57d:     	decq	%r9
14549d580:     	cmpl	$0x2, 0x20(%rcx,%r8)
14549d586:     	movq	%rdx, %r8
14549d589:     	jne	0x14549d570 <.text+0x549c570>
14549d58b:     	movq	%r9, %r8
14549d58e:     	notq	%r8
14549d591:     	subq	%rdx, %rax
14549d594:     	je	0x14549e162 <.text+0x549d162>
14549d59a:     	leaq	(%rcx,%rdx), %r10
14549d59e:     	addq	%rdx, %rcx
14549d5a1:     	addq	$-0x48, %rcx
14549d5a5:     	movabsq	$-0x1c71c71c71c71c71, %rdx # imm = 0xE38E38E38E38E38F
14549d5af:     	mulq	%rdx
14549d5b2:     	shrq	$0x6, %rdx
14549d5b6:     	negq	%r9
14549d5b9:     	xorl	%eax, %eax
14549d5bb:     	jmp	0x14549d5d0 <.text+0x549c5d0>
14549d5bd:     	nopl	(%rax)
14549d5c0:     	incq	%rax
14549d5c3:     	addq	$0x48, %r10
14549d5c7:     	cmpq	%rax, %rdx
14549d5ca:     	je	0x14549e162 <.text+0x549d162>
14549d5d0:     	cmpl	$0x2, 0x20(%r10)
14549d5d5:     	jne	0x14549d5c0 <.text+0x549c5c0>
14549d5d7:     	movl	0x40(%rcx), %r11d
14549d5db:     	movl	0x40(%r10), %esi
14549d5df:     	movl	%r11d, %ebx
14549d5e2:     	sarl	$0x1f, %ebx
14549d5e5:     	shrl	%ebx
14549d5e7:     	xorl	%r11d, %ebx
14549d5ea:     	movl	%esi, %r11d
14549d5ed:     	sarl	$0x1f, %r11d
14549d5f1:     	shrl	%r11d
14549d5f4:     	xorl	%esi, %r11d
14549d5f7:     	cmpl	%r11d, %ebx
14549d5fa:     	jle	0x14549d5c0 <.text+0x549c5c0>
14549d5fc:     	leaq	(%r9,%rax), %r8
14549d600:     	movq	%r10, %rcx
14549d603:     	jmp	0x14549d5c0 <.text+0x549c5c0>
14549d605:     	movq	%rax, %r10
14549d608:     	andq	$-0x2, %r10
14549d60c:     	leaq	0x68(%rcx), %r11
14549d610:     	xorl	%r9d, %r9d
14549d613:     	xorl	%r8d, %r8d
14549d616:     	nopw	%cs:(%rax,%rax)
14549d620:     	movl	-0x50(%r11), %esi
14549d624:     	xorl	$0x1, %esi
14549d627:     	cmpl	$0x0, -0x48(%r11)
14549d62c:     	cmovnel	%edx, %esi
14549d62f:     	addq	%r8, %rsi
14549d632:     	movl	-0x8(%r11), %r8d
14549d636:     	xorl	$0x1, %r8d
14549d63a:     	cmpl	$0x0, (%r11)
14549d63e:     	cmovnel	%edx, %r8d
14549d642:     	addq	%rsi, %r8
14549d645:     	addq	$0x2, %r9
14549d649:     	addq	$0x90, %r11
14549d650:     	cmpq	%r9, %r10
14549d653:     	jne	0x14549d620 <.text+0x549c620>
14549d655:     	testb	$0x1, %al
14549d657:     	je	0x14549d673 <.text+0x549c673>
14549d659:     	leaq	(%r9,%r9,8), %r9
14549d65d:     	movl	0x18(%rcx,%r9,8), %r10d
14549d662:     	xorl	$0x1, %r10d
14549d666:     	cmpl	$0x0, 0x20(%rcx,%r9,8)
14549d66c:     	cmovel	%r10d, %edx
14549d670:     	addq	%rdx, %r8
14549d673:     	cmpq	$0x2d, %r8
14549d677:     	jb	0x14549d6d9 <.text+0x549c6d9>
14549d679:     	shlq	$0x3, %rax
14549d67d:     	leaq	(%rax,%rax,8), %rax
14549d681:     	xorl	%edx, %edx
14549d683:     	jmp	0x14549d699 <.text+0x549c699>
14549d685:     	nopw	%cs:(%rax,%rax)
14549d690:     	addq	$0x48, %rdx
14549d694:     	cmpq	%rdx, %rax
14549d697:     	je	0x14549d6d9 <.text+0x549c6d9>
14549d699:     	cmpl	$0x0, 0x20(%rcx,%rdx)
14549d69e:     	jne	0x14549d690 <.text+0x549c690>
14549d6a0:     	cmpl	$0x1, 0x18(%rcx,%rdx)
14549d6a5:     	je	0x14549d690 <.text+0x549c690>
14549d6a7:     	leaq	-0x48(%rax), %r9
14549d6ab:     	leaq	(%rcx,%rdx), %r8
14549d6af:     	cmpq	%rdx, %r9
14549d6b2:     	je	0x14549e3d1 <.text+0x549d3d1>
14549d6b8:     	subq	%rdx, %rax
14549d6bb:     	addq	$-0x48, %rax
14549d6bf:     	addq	%rdx, %rcx
14549d6c2:     	addq	$0x48, %rcx
14549d6c6:     	movabsq	$-0x1c71c71c71c71c71, %rdx # imm = 0xE38E38E38E38E38F
14549d6d0:     	mulq	%rdx
14549d6d3:     	shrq	$0x6, %rdx
14549d6d7:     	jmp	0x14549d740 <.text+0x549c740>
14549d6d9:     	movl	0x8f4(%rdi), %ebx
14549d6df:     	incl	%ebx
14549d6e1:     	movl	%ebx, 0x8f4(%rdi)
14549d6e7:     	andl	$0xffffff, %ebx         # imm = 0xFFFFFF
14549d6ed:     	movabsq	$-0xecfffdcd7000000, %rax # imm = 0xF130002329000000
14549d6f7:     	xorl	%ecx, %ecx
14549d6f9:     	cmpl	$0x4, %r12d
14549d6fd:     	setae	%dl
14549d700:     	cmpl	$0x14, %r12d
14549d704:     	movl	$0x40cb, %r8d           # imm = 0x40CB
14549d70a:     	movl	$0x721, %r14d           # imm = 0x721
14549d710:     	cmovael	%r8d, %r14d
14549d714:     	jae	0x14549d798 <.text+0x549c798>
14549d71a:     	movb	%dl, %cl
14549d71c:     	leaq	0x161155d(%rip), %rdx   # 0x146aaec80
14549d723:     	movd	(%rdx,%rcx,4), %xmm8
14549d729:     	jmp	0x14549d7a1 <.text+0x549c7a1>
14549d72b:     	nopl	(%rax,%rax)
14549d730:     	movq	%rax, %r8
14549d733:     	addq	$0x48, %rcx
14549d737:     	decq	%rdx
14549d73a:     	je	0x14549e3ca <.text+0x549d3ca>
14549d740:     	cmpl	$0x0, 0x20(%rcx)
14549d744:     	jne	0x14549d733 <.text+0x549c733>
14549d746:     	cmpb	$0x0, 0x18(%rcx)
14549d74a:     	jne	0x14549d733 <.text+0x549c733>
14549d74c:     	movsd	0x34(%r8), %xmm0
14549d752:     	subps	%xmm6, %xmm0
14549d755:     	mulps	%xmm0, %xmm0
14549d758:     	movsd	0x34(%rcx), %xmm1
14549d75d:     	subps	%xmm6, %xmm1
14549d760:     	mulps	%xmm1, %xmm1
14549d763:     	haddps	%xmm1, %xmm0
14549d767:     	shufps	$0xe8, %xmm0, %xmm0     # xmm0 = xmm0[0,2,2,3]
14549d76b:     	movaps	%xmm0, %xmm1
14549d76e:     	psrad	$0x1f, %xmm1
14549d773:     	psrld	$0x1, %xmm1
14549d778:     	pxor	%xmm0, %xmm1
14549d77c:     	pshufd	$0x55, %xmm1, %xmm0     # xmm0 = xmm1[1,1,1,1]
14549d781:     	pcmpgtd	%xmm0, %xmm1
14549d785:     	movd	%xmm1, %r9d
14549d78a:     	movq	%rcx, %rax
14549d78d:     	testb	$0x1, %r9b
14549d791:     	jne	0x14549d730 <.text+0x549c730>
14549d793:     	movq	%r8, %rax
14549d796:     	jmp	0x14549d730 <.text+0x549c730>
14549d798:     	movd	0x40ae17(%rip), %xmm8   # 0x1458a85b8
14549d7a1:     	orq	%rax, %rbx
14549d7a4:     	movq	0x868(%rdi), %rsi
14549d7ab:     	leaq	0x10(%rsi), %rcx
14549d7af:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
14549d7b3:     	movaps	%xmm6, %xmm1
14549d7b6:     	callq	0x1453f66f0 <.text+0x53f56f0>
14549d7bb:     	movaps	%xmm0, %xmm7
14549d7be:     	testb	$0x1, %al
14549d7c0:     	jne	0x14549d7c7 <.text+0x549c7c7>
14549d7c2:     	movss	0x68(%rsi), %xmm7
14549d7c7:     	movq	$0x0, 0x40(%rbp)
14549d7cf:     	movq	$0x0, 0x50(%rbp)
14549d7d7:     	leaq	0x40(%rbp), %r15
14549d7db:     	movq	%r15, %rcx
14549d7de:     	xorl	%edx, %edx
14549d7e0:     	movq	%rbx, %r8
14549d7e3:     	callq	0x145455740 <.text+0x5454740>
14549d7e8:     	nop
14549d7e9:     	movq	0x40(%rbp), %rax
14549d7ed:     	testq	%rax, %rax
14549d7f0:     	je	0x14549d856 <.text+0x549c856>
14549d7f2:     	movq	0x48(%rbp), %rcx
14549d7f6:     	movw	$0x2, %dx
14549d7fa:     	movzwl	0x36(%rax), %r9d
14549d7ff:     	movl	%r9d, %r10d
14549d802:     	addl	%r10d, %r10d
14549d805:     	movq	$-0x1, %r8
14549d80c:     	nopl	(%rax)
14549d810:     	testq	%r10, %r10
14549d813:     	je	0x14549d83b <.text+0x549c83b>
14549d815:     	cmpw	0x3a(%rax,%r8,2), %dx
14549d81b:     	seta	%r11b
14549d81f:     	sbbb	$0x0, %r11b
14549d823:     	incq	%r8
14549d826:     	addq	$-0x2, %r10
14549d82a:     	cmpb	$0x1, %r11b
14549d82e:     	je	0x14549d810 <.text+0x549c810>
14549d830:     	movzbl	%r11b, %r9d
14549d834:     	testl	%r9d, %r9d
14549d837:     	je	0x14549d84b <.text+0x549c84b>
14549d839:     	jmp	0x14549d83e <.text+0x549c83e>
14549d83b:     	movq	%r9, %r8
14549d83e:     	subq	$0x1, %rcx
14549d842:     	jb	0x14549d858 <.text+0x549c858>
14549d844:     	movq	0x50(%rax,%r8,8), %rax
14549d849:     	jmp	0x14549d7fa <.text+0x549c7fa>
14549d84b:     	movl	$0x9, 0x8(%rax,%r8,4)
14549d854:     	jmp	0x14549d88b <.text+0x549c88b>
14549d856:     	xorl	%eax, %eax
14549d858:     	movq	%r15, 0x60(%rbp)
14549d85c:     	movq	%rax, 0x68(%rbp)
14549d860:     	movq	$0x0, 0x70(%rbp)
14549d868:     	movq	%r8, 0x78(%rbp)
14549d86c:     	movq	$0x2, 0x80(%rbp)
14549d877:     	leaq	0x20(%rbp), %rcx
14549d87b:     	leaq	0x60(%rbp), %rdx
14549d87f:     	movl	$0x9, %r8d
14549d885:     	callq	0x145408070 <.text+0x5407070>
14549d88a:     	nop
14549d88b:     	movq	0x40(%rbp), %rax
14549d88f:     	testq	%rax, %rax
14549d892:     	je	0x14549d8f6 <.text+0x549c8f6>
14549d894:     	movq	0x48(%rbp), %rcx
14549d898:     	movw	$0x3, %dx
14549d89c:     	movzwl	0x36(%rax), %r9d
14549d8a1:     	movl	%r9d, %r10d
14549d8a4:     	addl	%r10d, %r10d
14549d8a7:     	movq	$-0x1, %r8
14549d8ae:     	nop
14549d8b0:     	testq	%r10, %r10
14549d8b3:     	je	0x14549d8db <.text+0x549c8db>
14549d8b5:     	cmpw	0x3a(%rax,%r8,2), %dx
14549d8bb:     	seta	%r11b
14549d8bf:     	sbbb	$0x0, %r11b
14549d8c3:     	incq	%r8
14549d8c6:     	addq	$-0x2, %r10
14549d8ca:     	cmpb	$0x1, %r11b
14549d8ce:     	je	0x14549d8b0 <.text+0x549c8b0>
14549d8d0:     	movzbl	%r11b, %r9d
14549d8d4:     	testl	%r9d, %r9d
14549d8d7:     	je	0x14549d8eb <.text+0x549c8eb>
14549d8d9:     	jmp	0x14549d8de <.text+0x549c8de>
14549d8db:     	movq	%r9, %r8
14549d8de:     	subq	$0x1, %rcx
14549d8e2:     	jb	0x14549d8f8 <.text+0x549c8f8>
14549d8e4:     	movq	0x50(%rax,%r8,8), %rax
14549d8e9:     	jmp	0x14549d89c <.text+0x549c89c>
14549d8eb:     	movl	$0x2329, 0x8(%rax,%r8,4) # imm = 0x2329
14549d8f4:     	jmp	0x14549d92b <.text+0x549c92b>
14549d8f6:     	xorl	%eax, %eax
14549d8f8:     	movq	%r15, 0x60(%rbp)
14549d8fc:     	movq	%rax, 0x68(%rbp)
14549d900:     	movq	$0x0, 0x70(%rbp)
14549d908:     	movq	%r8, 0x78(%rbp)
14549d90c:     	movq	$0x3, 0x80(%rbp)
14549d917:     	leaq	0x20(%rbp), %rcx
14549d91b:     	leaq	0x60(%rbp), %rdx
14549d91f:     	movl	$0x2329, %r8d           # imm = 0x2329
14549d925:     	callq	0x145408070 <.text+0x5407070>
14549d92a:     	nop
14549d92b:     	movq	0x40(%rbp), %rax
14549d92f:     	testq	%rax, %rax
14549d932:     	je	0x14549d994 <.text+0x549c994>
14549d934:     	movq	0x48(%rbp), %rcx
14549d938:     	movw	$0x4, %dx
14549d93c:     	movzwl	0x36(%rax), %r8d
14549d941:     	movl	%r8d, %r10d
14549d944:     	addl	%r10d, %r10d
14549d947:     	movq	$-0x1, %r9
14549d94e:     	nop
14549d950:     	testq	%r10, %r10
14549d953:     	je	0x14549d97b <.text+0x549c97b>
14549d955:     	cmpw	0x3a(%rax,%r9,2), %dx
14549d95b:     	seta	%r11b
14549d95f:     	sbbb	$0x0, %r11b
14549d963:     	incq	%r9
14549d966:     	addq	$-0x2, %r10
14549d96a:     	cmpb	$0x1, %r11b
14549d96e:     	je	0x14549d950 <.text+0x549c950>
14549d970:     	movzbl	%r11b, %r8d
14549d974:     	testl	%r8d, %r8d
14549d977:     	je	0x14549d98b <.text+0x549c98b>
14549d979:     	jmp	0x14549d97e <.text+0x549c97e>
14549d97b:     	movq	%r8, %r9
14549d97e:     	subq	$0x1, %rcx
14549d982:     	jb	0x14549d996 <.text+0x549c996>
14549d984:     	movq	0x50(%rax,%r9,8), %rax
14549d989:     	jmp	0x14549d93c <.text+0x549c93c>
14549d98b:     	movd	%xmm8, 0x8(%rax,%r9,4)
14549d992:     	jmp	0x14549d9c8 <.text+0x549c9c8>
14549d994:     	xorl	%eax, %eax
14549d996:     	movd	%xmm8, %r8d
14549d99b:     	movq	%r15, 0x60(%rbp)
14549d99f:     	movq	%rax, 0x68(%rbp)
14549d9a3:     	movq	$0x0, 0x70(%rbp)
14549d9ab:     	movq	%r9, 0x78(%rbp)
14549d9af:     	movq	$0x4, 0x80(%rbp)
14549d9ba:     	leaq	0x20(%rbp), %rcx
14549d9be:     	leaq	0x60(%rbp), %rdx
14549d9c2:     	callq	0x145408070 <.text+0x5407070>
14549d9c7:     	nop
14549d9c8:     	movq	0x40(%rbp), %rax
14549d9cc:     	testq	%rax, %rax
14549d9cf:     	je	0x14549da36 <.text+0x549ca36>
14549d9d1:     	movq	0x48(%rbp), %rcx
14549d9d5:     	movw	$0x16, %dx
14549d9d9:     	movzwl	0x36(%rax), %r9d
14549d9de:     	movl	%r9d, %r10d
14549d9e1:     	addl	%r10d, %r10d
14549d9e4:     	movq	$-0x1, %r8
14549d9eb:     	nopl	(%rax,%rax)
14549d9f0:     	testq	%r10, %r10
14549d9f3:     	je	0x14549da1b <.text+0x549ca1b>
14549d9f5:     	cmpw	0x3a(%rax,%r8,2), %dx
14549d9fb:     	seta	%r11b
14549d9ff:     	sbbb	$0x0, %r11b
14549da03:     	incq	%r8
14549da06:     	addq	$-0x2, %r10
14549da0a:     	cmpb	$0x1, %r11b
14549da0e:     	je	0x14549d9f0 <.text+0x549c9f0>
14549da10:     	movzbl	%r11b, %r9d
14549da14:     	testl	%r9d, %r9d
14549da17:     	je	0x14549da2b <.text+0x549ca2b>
14549da19:     	jmp	0x14549da1e <.text+0x549ca1e>
14549da1b:     	movq	%r9, %r8
14549da1e:     	subq	$0x1, %rcx
14549da22:     	jb	0x14549da38 <.text+0x549ca38>
14549da24:     	movq	0x50(%rax,%r8,8), %rax
14549da29:     	jmp	0x14549d9d9 <.text+0x549c9d9>
14549da2b:     	movl	$0x1, 0x8(%rax,%r8,4)
14549da34:     	jmp	0x14549da6b <.text+0x549ca6b>
14549da36:     	xorl	%eax, %eax
14549da38:     	movq	%r15, 0x60(%rbp)
14549da3c:     	movq	%rax, 0x68(%rbp)
14549da40:     	movq	$0x0, 0x70(%rbp)
14549da48:     	movq	%r8, 0x78(%rbp)
14549da4c:     	movq	$0x16, 0x80(%rbp)
14549da57:     	leaq	0x20(%rbp), %rcx
14549da5b:     	leaq	0x60(%rbp), %rdx
14549da5f:     	movl	$0x1, %r8d
14549da65:     	callq	0x145408070 <.text+0x5407070>
14549da6a:     	nop
14549da6b:     	movq	0x40(%rbp), %rax
14549da6f:     	testq	%rax, %rax
14549da72:     	je	0x14549dad6 <.text+0x549cad6>
14549da74:     	movq	0x48(%rbp), %rcx
14549da78:     	movw	$0x1c, %dx
14549da7c:     	movzwl	0x36(%rax), %r9d
14549da81:     	movl	%r9d, %r10d
14549da84:     	addl	%r10d, %r10d
14549da87:     	movq	$-0x1, %r8
14549da8e:     	nop
14549da90:     	testq	%r10, %r10
14549da93:     	je	0x14549dabb <.text+0x549cabb>
14549da95:     	cmpw	0x3a(%rax,%r8,2), %dx
14549da9b:     	seta	%r11b
14549da9f:     	sbbb	$0x0, %r11b
14549daa3:     	incq	%r8
14549daa6:     	addq	$-0x2, %r10
14549daaa:     	cmpb	$0x1, %r11b
14549daae:     	je	0x14549da90 <.text+0x549ca90>
14549dab0:     	movzbl	%r11b, %r9d
14549dab4:     	testl	%r9d, %r9d
14549dab7:     	je	0x14549dacb <.text+0x549cacb>
14549dab9:     	jmp	0x14549dabe <.text+0x549cabe>
14549dabb:     	movq	%r9, %r8
14549dabe:     	subq	$0x1, %rcx
14549dac2:     	jb	0x14549dad8 <.text+0x549cad8>
14549dac4:     	movq	0x50(%rax,%r8,8), %rax
14549dac9:     	jmp	0x14549da7c <.text+0x549ca7c>
14549dacb:     	movl	$0x1, 0x8(%rax,%r8,4)
14549dad4:     	jmp	0x14549db0b <.text+0x549cb0b>
14549dad6:     	xorl	%eax, %eax
14549dad8:     	movq	%r15, 0x60(%rbp)
14549dadc:     	movq	%rax, 0x68(%rbp)
14549dae0:     	movq	$0x0, 0x70(%rbp)
14549dae8:     	movq	%r8, 0x78(%rbp)
14549daec:     	movq	$0x1c, 0x80(%rbp)
14549daf7:     	leaq	0x20(%rbp), %rcx
14549dafb:     	leaq	0x60(%rbp), %rdx
14549daff:     	movl	$0x1, %r8d
14549db05:     	callq	0x145408070 <.text+0x5407070>
14549db0a:     	nop
14549db0b:     	movq	0x40(%rbp), %rax
14549db0f:     	testq	%rax, %rax
14549db12:     	je	0x14549db76 <.text+0x549cb76>
14549db14:     	movq	0x48(%rbp), %rcx
14549db18:     	movw	$0x22, %dx
14549db1c:     	movzwl	0x36(%rax), %r9d
14549db21:     	movl	%r9d, %r10d
14549db24:     	addl	%r10d, %r10d
14549db27:     	movq	$-0x1, %r8
14549db2e:     	nop
14549db30:     	testq	%r10, %r10
14549db33:     	je	0x14549db5b <.text+0x549cb5b>
14549db35:     	cmpw	0x3a(%rax,%r8,2), %dx
14549db3b:     	seta	%r11b
14549db3f:     	sbbb	$0x0, %r11b
14549db43:     	incq	%r8
14549db46:     	addq	$-0x2, %r10
14549db4a:     	cmpb	$0x1, %r11b
14549db4e:     	je	0x14549db30 <.text+0x549cb30>
14549db50:     	movzbl	%r11b, %r9d
14549db54:     	testl	%r9d, %r9d
14549db57:     	je	0x14549db6b <.text+0x549cb6b>
14549db59:     	jmp	0x14549db5e <.text+0x549cb5e>
14549db5b:     	movq	%r9, %r8
14549db5e:     	subq	$0x1, %rcx
14549db62:     	jb	0x14549db78 <.text+0x549cb78>
14549db64:     	movq	0x50(%rax,%r8,8), %rax
14549db69:     	jmp	0x14549db1c <.text+0x549cb1c>
14549db6b:     	movl	$0x1, 0x8(%rax,%r8,4)
14549db74:     	jmp	0x14549dbab <.text+0x549cbab>
14549db76:     	xorl	%eax, %eax
14549db78:     	movq	%r15, 0x60(%rbp)
14549db7c:     	movq	%rax, 0x68(%rbp)
14549db80:     	movq	$0x0, 0x70(%rbp)
14549db88:     	movq	%r8, 0x78(%rbp)
14549db8c:     	movq	$0x22, 0x80(%rbp)
14549db97:     	leaq	0x20(%rbp), %rcx
14549db9b:     	leaq	0x60(%rbp), %rdx
14549db9f:     	movl	$0x1, %r8d
14549dba5:     	callq	0x145408070 <.text+0x5407070>
14549dbaa:     	nop
14549dbab:     	movq	0x40(%rbp), %rax
14549dbaf:     	testq	%rax, %rax
14549dbb2:     	je	0x14549dc16 <.text+0x549cc16>
14549dbb4:     	movq	0x48(%rbp), %rcx
14549dbb8:     	movw	$0x23, %dx
14549dbbc:     	movzwl	0x36(%rax), %r9d
14549dbc1:     	movl	%r9d, %r10d
14549dbc4:     	addl	%r10d, %r10d
14549dbc7:     	movq	$-0x1, %r8
14549dbce:     	nop
14549dbd0:     	testq	%r10, %r10
14549dbd3:     	je	0x14549dbfb <.text+0x549cbfb>
14549dbd5:     	cmpw	0x3a(%rax,%r8,2), %dx
14549dbdb:     	seta	%r11b
14549dbdf:     	sbbb	$0x0, %r11b
14549dbe3:     	incq	%r8
14549dbe6:     	addq	$-0x2, %r10
14549dbea:     	cmpb	$0x1, %r11b
14549dbee:     	je	0x14549dbd0 <.text+0x549cbd0>
14549dbf0:     	movzbl	%r11b, %r9d
14549dbf4:     	testl	%r9d, %r9d
14549dbf7:     	je	0x14549dc0b <.text+0x549cc0b>
14549dbf9:     	jmp	0x14549dbfe <.text+0x549cbfe>
14549dbfb:     	movq	%r9, %r8
14549dbfe:     	subq	$0x1, %rcx
14549dc02:     	jb	0x14549dc18 <.text+0x549cc18>
14549dc04:     	movq	0x50(%rax,%r8,8), %rax
14549dc09:     	jmp	0x14549dbbc <.text+0x549cbbc>
14549dc0b:     	movl	$0x23, 0x8(%rax,%r8,4)
14549dc14:     	jmp	0x14549dc4b <.text+0x549cc4b>
14549dc16:     	xorl	%eax, %eax
14549dc18:     	movq	%r15, 0x60(%rbp)
14549dc1c:     	movq	%rax, 0x68(%rbp)
14549dc20:     	movq	$0x0, 0x70(%rbp)
14549dc28:     	movq	%r8, 0x78(%rbp)
14549dc2c:     	movq	$0x23, 0x80(%rbp)
14549dc37:     	leaq	0x20(%rbp), %rcx
14549dc3b:     	leaq	0x60(%rbp), %rdx
14549dc3f:     	movl	$0x23, %r8d
14549dc45:     	callq	0x145408070 <.text+0x5407070>
14549dc4a:     	nop
14549dc4b:     	movq	0x40(%rbp), %rax
14549dc4f:     	testq	%rax, %rax
14549dc52:     	je	0x14549dcb6 <.text+0x549ccb6>
14549dc54:     	movq	0x48(%rbp), %rcx
14549dc58:     	movw	$0x2e, %dx
14549dc5c:     	movzwl	0x36(%rax), %r9d
14549dc61:     	movl	%r9d, %r10d
14549dc64:     	addl	%r10d, %r10d
14549dc67:     	movq	$-0x1, %r8
14549dc6e:     	nop
14549dc70:     	testq	%r10, %r10
14549dc73:     	je	0x14549dc9b <.text+0x549cc9b>
14549dc75:     	cmpw	0x3a(%rax,%r8,2), %dx
14549dc7b:     	seta	%r11b
14549dc7f:     	sbbb	$0x0, %r11b
14549dc83:     	incq	%r8
14549dc86:     	addq	$-0x2, %r10
14549dc8a:     	cmpb	$0x1, %r11b
14549dc8e:     	je	0x14549dc70 <.text+0x549cc70>
14549dc90:     	movzbl	%r11b, %r9d
14549dc94:     	testl	%r9d, %r9d
14549dc97:     	je	0x14549dcab <.text+0x549ccab>
14549dc99:     	jmp	0x14549dc9e <.text+0x549cc9e>
14549dc9b:     	movq	%r9, %r8
14549dc9e:     	subq	$0x1, %rcx
14549dca2:     	jb	0x14549dcb8 <.text+0x549ccb8>
14549dca4:     	movq	0x50(%rax,%r8,8), %rax
14549dca9:     	jmp	0x14549dc5c <.text+0x549cc5c>
14549dcab:     	movl	$0x2000002, 0x8(%rax,%r8,4) # imm = 0x2000002
14549dcb4:     	jmp	0x14549dceb <.text+0x549cceb>
14549dcb6:     	xorl	%eax, %eax
14549dcb8:     	movq	%r15, 0x60(%rbp)
14549dcbc:     	movq	%rax, 0x68(%rbp)
14549dcc0:     	movq	$0x0, 0x70(%rbp)
14549dcc8:     	movq	%r8, 0x78(%rbp)
14549dccc:     	movq	$0x2e, 0x80(%rbp)
14549dcd7:     	leaq	0x20(%rbp), %rcx
14549dcdb:     	leaq	0x60(%rbp), %rdx
14549dcdf:     	movl	$0x2000002, %r8d        # imm = 0x2000002
14549dce5:     	callq	0x145408070 <.text+0x5407070>
14549dcea:     	nop
14549dceb:     	movq	0x40(%rbp), %rax
14549dcef:     	testq	%rax, %rax
14549dcf2:     	je	0x14549dd59 <.text+0x549cd59>
14549dcf4:     	movq	0x48(%rbp), %rcx
14549dcf8:     	movl	$0x81, %edx
14549dcfd:     	movzwl	0x36(%rax), %r9d
14549dd02:     	movl	%r9d, %r10d
14549dd05:     	addl	%r10d, %r10d
14549dd08:     	movq	$-0x1, %r8
14549dd0f:     	nop
14549dd10:     	testq	%r10, %r10
14549dd13:     	je	0x14549dd3e <.text+0x549cd3e>
14549dd15:     	movzwl	0x3a(%rax,%r8,2), %r11d
14549dd1b:     	cmpl	%r11d, %edx
14549dd1e:     	seta	%r11b
14549dd22:     	sbbb	$0x0, %r11b
14549dd26:     	incq	%r8
14549dd29:     	addq	$-0x2, %r10
14549dd2d:     	cmpb	$0x1, %r11b
14549dd31:     	je	0x14549dd10 <.text+0x549cd10>
14549dd33:     	movzbl	%r11b, %r9d
14549dd37:     	testl	%r9d, %r9d
14549dd3a:     	je	0x14549dd4e <.text+0x549cd4e>
14549dd3c:     	jmp	0x14549dd41 <.text+0x549cd41>
14549dd3e:     	movq	%r9, %r8
14549dd41:     	subq	$0x1, %rcx
14549dd45:     	jb	0x14549dd5b <.text+0x549cd5b>
14549dd47:     	movq	0x50(%rax,%r8,8), %rax
14549dd4c:     	jmp	0x14549dcfd <.text+0x549ccfd>
14549dd4e:     	movl	$0x3dcccccd, 0x8(%rax,%r8,4) # imm = 0x3DCCCCCD
14549dd57:     	jmp	0x14549dd8e <.text+0x549cd8e>
14549dd59:     	xorl	%eax, %eax
14549dd5b:     	movq	%r15, 0x60(%rbp)
14549dd5f:     	movq	%rax, 0x68(%rbp)
14549dd63:     	movq	$0x0, 0x70(%rbp)
14549dd6b:     	movq	%r8, 0x78(%rbp)
14549dd6f:     	movq	$0x81, 0x80(%rbp)
14549dd7a:     	leaq	0x20(%rbp), %rcx
14549dd7e:     	leaq	0x60(%rbp), %rdx
14549dd82:     	movl	$0x3dcccccd, %r8d       # imm = 0x3DCCCCCD
14549dd88:     	callq	0x145408070 <.text+0x5407070>
14549dd8d:     	nop
14549dd8e:     	movq	0x40(%rbp), %rax
14549dd92:     	testq	%rax, %rax
14549dd95:     	je	0x14549de09 <.text+0x549ce09>
14549dd97:     	movq	0x48(%rbp), %rcx
14549dd9b:     	movl	$0x82, %edx
14549dda0:     	movzwl	0x36(%rax), %r9d
14549dda5:     	movl	%r9d, %r10d
14549dda8:     	addl	%r10d, %r10d
14549ddab:     	movq	$-0x1, %r8
14549ddb2:     	nopw	%cs:(%rax,%rax)
14549ddc0:     	testq	%r10, %r10
14549ddc3:     	je	0x14549ddee <.text+0x549cdee>
14549ddc5:     	movzwl	0x3a(%rax,%r8,2), %r11d
14549ddcb:     	cmpl	%r11d, %edx
14549ddce:     	seta	%r11b
14549ddd2:     	sbbb	$0x0, %r11b
14549ddd6:     	incq	%r8
14549ddd9:     	addq	$-0x2, %r10
14549dddd:     	cmpb	$0x1, %r11b
14549dde1:     	je	0x14549ddc0 <.text+0x549cdc0>
14549dde3:     	movzbl	%r11b, %r9d
14549dde7:     	testl	%r9d, %r9d
14549ddea:     	je	0x14549ddfe <.text+0x549cdfe>
14549ddec:     	jmp	0x14549ddf1 <.text+0x549cdf1>
14549ddee:     	movq	%r9, %r8
14549ddf1:     	subq	$0x1, %rcx
14549ddf5:     	jb	0x14549de0b <.text+0x549ce0b>
14549ddf7:     	movq	0x50(%rax,%r8,8), %rax
14549ddfc:     	jmp	0x14549dda0 <.text+0x549cda0>
14549ddfe:     	movl	$0x3dcccccd, 0x8(%rax,%r8,4) # imm = 0x3DCCCCCD
14549de07:     	jmp	0x14549de3e <.text+0x549ce3e>
14549de09:     	xorl	%eax, %eax
14549de0b:     	movq	%r15, 0x60(%rbp)
14549de0f:     	movq	%rax, 0x68(%rbp)
14549de13:     	movq	$0x0, 0x70(%rbp)
14549de1b:     	movq	%r8, 0x78(%rbp)
14549de1f:     	movq	$0x82, 0x80(%rbp)
14549de2a:     	leaq	0x20(%rbp), %rcx
14549de2e:     	leaq	0x60(%rbp), %rdx
14549de32:     	movl	$0x3dcccccd, %r8d       # imm = 0x3DCCCCCD
14549de38:     	callq	0x145408070 <.text+0x5407070>
14549de3d:     	nop
14549de3e:     	movq	0x40(%rbp), %rax
14549de42:     	testq	%rax, %rax
14549de45:     	je	0x14549deb5 <.text+0x549ceb5>
14549de47:     	movq	0x48(%rbp), %rcx
14549de4b:     	movl	$0x83, %edx
14549de50:     	movzwl	0x36(%rax), %r9d
14549de55:     	movl	%r9d, %r10d
14549de58:     	addl	%r10d, %r10d
14549de5b:     	movq	$-0x1, %r8
14549de62:     	nopw	%cs:(%rax,%rax)
14549de70:     	testq	%r10, %r10
14549de73:     	je	0x14549de9e <.text+0x549ce9e>
14549de75:     	movzwl	0x3a(%rax,%r8,2), %r11d
14549de7b:     	cmpl	%r11d, %edx
14549de7e:     	seta	%r11b
14549de82:     	sbbb	$0x0, %r11b
14549de86:     	incq	%r8
14549de89:     	addq	$-0x2, %r10
14549de8d:     	cmpb	$0x1, %r11b
14549de91:     	je	0x14549de70 <.text+0x549ce70>
14549de93:     	movzbl	%r11b, %r9d
14549de97:     	testl	%r9d, %r9d
14549de9a:     	je	0x14549deae <.text+0x549ceae>
14549de9c:     	jmp	0x14549dea1 <.text+0x549cea1>
14549de9e:     	movq	%r9, %r8
14549dea1:     	subq	$0x1, %rcx
14549dea5:     	jb	0x14549deb7 <.text+0x549ceb7>
14549dea7:     	movq	0x50(%rax,%r8,8), %rax
14549deac:     	jmp	0x14549de50 <.text+0x549ce50>
14549deae:     	movl	%r14d, 0x8(%rax,%r8,4)
14549deb3:     	jmp	0x14549dee7 <.text+0x549cee7>
14549deb5:     	xorl	%eax, %eax
14549deb7:     	movq	%r15, 0x60(%rbp)
14549debb:     	movq	%rax, 0x68(%rbp)
14549debf:     	movq	$0x0, 0x70(%rbp)
14549dec7:     	movq	%r8, 0x78(%rbp)
14549decb:     	movq	$0x83, 0x80(%rbp)
14549ded6:     	leaq	0x20(%rbp), %rcx
14549deda:     	leaq	0x60(%rbp), %rdx
14549dede:     	movl	%r14d, %r8d
14549dee1:     	callq	0x145408070 <.text+0x5407070>
14549dee6:     	nop
14549dee7:     	movq	0x40(%rbp), %rax
14549deeb:     	testq	%rax, %rax
14549deee:     	je	0x14549df55 <.text+0x549cf55>
14549def0:     	movq	0x48(%rbp), %rcx
14549def4:     	movl	$0x84, %edx
14549def9:     	movzwl	0x36(%rax), %r9d
14549defe:     	movl	%r9d, %r10d
14549df01:     	addl	%r10d, %r10d
14549df04:     	movq	$-0x1, %r8
14549df0b:     	nopl	(%rax,%rax)
14549df10:     	testq	%r10, %r10
14549df13:     	je	0x14549df3e <.text+0x549cf3e>
14549df15:     	movzwl	0x3a(%rax,%r8,2), %r11d
14549df1b:     	cmpl	%r11d, %edx
14549df1e:     	seta	%r11b
14549df22:     	sbbb	$0x0, %r11b
14549df26:     	incq	%r8
14549df29:     	addq	$-0x2, %r10
14549df2d:     	cmpb	$0x1, %r11b
14549df31:     	je	0x14549df10 <.text+0x549cf10>
14549df33:     	movzbl	%r11b, %r9d
14549df37:     	testl	%r9d, %r9d
14549df3a:     	je	0x14549df4e <.text+0x549cf4e>
14549df3c:     	jmp	0x14549df41 <.text+0x549cf41>
14549df3e:     	movq	%r9, %r8
14549df41:     	subq	$0x1, %rcx
14549df45:     	jb	0x14549df57 <.text+0x549cf57>
14549df47:     	movq	0x50(%rax,%r8,8), %rax
14549df4c:     	jmp	0x14549def9 <.text+0x549cef9>
14549df4e:     	movl	%r14d, 0x8(%rax,%r8,4)
14549df53:     	jmp	0x14549df87 <.text+0x549cf87>
14549df55:     	xorl	%eax, %eax
14549df57:     	movq	%r15, 0x60(%rbp)
14549df5b:     	movq	%rax, 0x68(%rbp)
14549df5f:     	movq	$0x0, 0x70(%rbp)
14549df67:     	movq	%r8, 0x78(%rbp)
14549df6b:     	movq	$0x84, 0x80(%rbp)
14549df76:     	leaq	0x20(%rbp), %rcx
14549df7a:     	leaq	0x60(%rbp), %rdx
14549df7e:     	movl	%r14d, %r8d
14549df81:     	callq	0x145408070 <.text+0x5407070>
14549df86:     	nop
14549df87:     	movl	$0x0, (%rbp)
14549df8e:     	movq	$0x0, -0x18(%rbp)
14549df96:     	movq	$0x1, -0x10(%rbp)
14549df9e:     	movq	$0x0, -0x8(%rbp)
14549dfa6:     	movlps	%xmm6, 0x60(%rbp)
14549dfaa:     	movss	%xmm7, 0x68(%rbp)
14549dfaf:     	movb	$0x1, 0x97(%rbp)
14549dfb6:     	movq	%r15, 0x38(%rsp)
14549dfbb:     	leaq	0x1611612(%rip), %rax   # 0x146aaf5d4
14549dfc2:     	movq	%rax, 0x30(%rsp)
14549dfc7:     	leaq	0x60(%rbp), %rax
14549dfcb:     	movq	%rax, 0x20(%rsp)
14549dfd0:     	movl	$0x0, 0x28(%rsp)
14549dfd8:     	leaq	-0x18(%rbp), %rcx
14549dfdc:     	movq	%rbx, %rdx
14549dfdf:     	movb	$0x3, %r8b
14549dfe2:     	xorl	%r9d, %r9d
14549dfe5:     	callq	0x145454750 <.text+0x5453750>
14549dfea:     	nop
14549dfeb:     	movups	-0x18(%rbp), %xmm0
14549dfef:     	movups	-0x8(%rbp), %xmm1
14549dff3:     	movaps	%xmm1, 0x70(%rbp)
14549dff7:     	movaps	%xmm0, 0x60(%rbp)
14549dffb:     	movb	$0x0, 0x97(%rbp)
14549e002:     	leaq	0x20(%rbp), %rcx
14549e006:     	leaq	0x60(%rbp), %rdx
14549e00a:     	callq	0x145454f20 <.text+0x5453f20>
14549e00f:     	nop
14549e010:     	movq	0x548(%rdi), %rsi
14549e017:     	cmpq	0x538(%rdi), %rsi
14549e01e:     	jne	0x14549e02d <.text+0x549d02d>
14549e020:     	leaq	0x538(%rdi), %rcx
14549e027:     	callq	0x145717d60 <.text+0x5716d60>
14549e02c:     	nop
14549e02d:     	movq	0x540(%rdi), %rax
14549e034:     	movq	%rsi, %rcx
14549e037:     	shlq	$0x5, %rcx
14549e03b:     	movups	0x20(%rbp), %xmm0
14549e03f:     	movups	0x30(%rbp), %xmm1
14549e043:     	movups	%xmm1, 0x10(%rax,%rcx)
14549e048:     	movups	%xmm0, (%rax,%rcx)
14549e04c:     	incq	%rsi
14549e04f:     	movq	%rsi, 0x548(%rdi)
14549e056:     	movd	0x8d4(%rdi), %xmm8
14549e05f:     	movq	0x530(%rdi), %rsi
14549e066:     	cmpq	0x520(%rdi), %rsi
14549e06d:     	jne	0x14549e083 <.text+0x549d083>
14549e06f:     	leaq	0x520(%rdi), %rcx
14549e076:     	movb	$0x0, 0x97(%rbp)
14549e07d:     	callq	0x145717c80 <.text+0x5716c80>
14549e082:     	nop
14549e083:     	movq	0x528(%rdi), %rax
14549e08a:     	leaq	(%rsi,%rsi,8), %rcx
14549e08e:     	movq	$0x0, (%rax,%rcx,8)
14549e096:     	movq	$0x8, 0x8(%rax,%rcx,8)
14549e09f:     	movq	$0x0, 0x10(%rax,%rcx,8)
14549e0a8:     	movl	$0x0, 0x18(%rax,%rcx,8)
14549e0b0:     	movl	$0x0, 0x20(%rax,%rcx,8)
14549e0b8:     	movl	%r12d, 0x24(%rax,%rcx,8)
14549e0bd:     	movq	%rbx, 0x28(%rax,%rcx,8)
14549e0c2:     	movl	$0x2329, 0x30(%rax,%rcx,8) # imm = 0x2329
14549e0ca:     	movlps	%xmm6, 0x34(%rax,%rcx,8)
14549e0cf:     	movss	%xmm7, 0x3c(%rax,%rcx,8)
14549e0d5:     	movd	%xmm8, 0x40(%rax,%rcx,8)
14549e0dc:     	incq	%rsi
14549e0df:     	movq	%rsi, 0x530(%rdi)
14549e0e6:     	leaq	0x40(%rbp), %rcx
14549e0ea:     	callq	0x1454cc970 <.text+0x54cb970>
14549e0ef:     	jmp	0x14549e3a0 <.text+0x549d3a0>
14549e0f4:     	movl	%r15d, %r13d
14549e0f7:     	movl	$0x2330, 0x5c(%rbp)     # imm = 0x2330
14549e0fe:     	movabsq	$0x3f80000000001767, %r15 # imm = 0x3F80000000001767
14549e108:     	jmp	0x14549e16d <.text+0x549d16d>
14549e10a:     	movl	%r15d, %r13d
14549e10d:     	movl	$0x232e, 0x5c(%rbp)     # imm = 0x232E
14549e114:     	movabsq	$0x3f8000000000172b, %r15 # imm = 0x3F8000000000172B
14549e11e:     	jmp	0x14549e16d <.text+0x549d16d>
14549e120:     	movl	%r15d, %r13d
14549e123:     	movl	$0x232c, 0x5c(%rbp)     # imm = 0x232C
14549e12a:     	movabsq	$0x3f19999a00000a36, %r15 # imm = 0x3F19999A00000A36
14549e134:     	jmp	0x14549e16d <.text+0x549d16d>
14549e136:     	movl	%r15d, %r13d
14549e139:     	movl	$0x232f, 0x5c(%rbp)     # imm = 0x232F
14549e140:     	movabsq	$0x3f8000000000176b, %r15 # imm = 0x3F8000000000176B
14549e14a:     	jmp	0x14549e16d <.text+0x549d16d>
14549e14c:     	movl	%r15d, %r13d
14549e14f:     	movl	$0x2331, 0x5c(%rbp)     # imm = 0x2331
14549e156:     	movabsq	$0x3fa6666600000156, %r15 # imm = 0x3FA6666600000156
14549e160:     	jmp	0x14549e16d <.text+0x549d16d>
14549e162:     	movq	%rdi, %rcx
14549e165:     	movq	%r8, %rdx
14549e168:     	callq	0x1454a5d50 <.text+0x54a4d50>
14549e16d:     	movq	0x868(%rdi), %rsi
14549e174:     	leaq	0x10(%rsi), %rcx
14549e178:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
14549e17c:     	movaps	%xmm6, %xmm1
14549e17f:     	callq	0x1453f66f0 <.text+0x53f56f0>
14549e184:     	movaps	%xmm0, %xmm7
14549e187:     	testb	$0x1, %al
14549e189:     	jne	0x14549e190 <.text+0x549d190>
14549e18b:     	movss	0x68(%rsi), %xmm7
14549e190:     	movl	0x5c(%rbp), %eax
14549e193:     	movl	%eax, 0x20(%rbp)
14549e196:     	movq	%r15, 0x24(%rbp)
14549e19a:     	movlps	%xmm6, 0x60(%rbp)
14549e19e:     	movss	%xmm7, 0x68(%rbp)
14549e1a3:     	movl	$0x0, 0x20(%rsp)
14549e1ab:     	leaq	0x20(%rbp), %rdx
14549e1af:     	leaq	0x60(%rbp), %r8
14549e1b3:     	movq	%rdi, %rcx
14549e1b6:     	movl	%r14d, %r9d
14549e1b9:     	callq	0x1454a7540 <.text+0x54a6540>
14549e1be:     	movq	%rax, %r14
14549e1c1:     	movq	$0x0, 0x20(%rbp)
14549e1c9:     	movq	$0x8, 0x28(%rbp)
14549e1d1:     	movq	$0x0, 0x30(%rbp)
14549e1d9:     	cmpl	$0x6, %r13d
14549e1dd:     	jne	0x14549e2d5 <.text+0x549d2d5>
14549e1e3:     	movq	%r14, -0x38(%rbp)
14549e1e7:     	movl	%r13d, 0xc(%rbp)
14549e1eb:     	movl	%r12d, 0x8(%rbp)
14549e1ef:     	movabsq	$0xcc700002332, %rax    # imm = 0xCC700002332
14549e1f9:     	movq	%rax, -0x30(%rbp)
14549e1fd:     	movl	$0x3f800000, -0x28(%rbp) # imm = 0x3F800000
14549e204:     	movabsq	$0x8b800002333, %rax    # imm = 0x8B800002333
14549e20e:     	movq	%rax, -0x24(%rbp)
14549e212:     	movl	$0x3fcccccd, -0x1c(%rbp) # imm = 0x3FCCCCCD
14549e219:     	movq	$0x2, 0x68(%rbp)
14549e221:     	leaq	0x70(%rbp), %rbx
14549e225:     	movq	-0x30(%rbp), %rax
14549e229:     	movq	%rax, 0x70(%rbp)
14549e22d:     	movl	-0x28(%rbp), %eax
14549e230:     	movl	%eax, 0x78(%rbp)
14549e233:     	movl	-0x24(%rbp), %eax
14549e236:     	movl	%eax, 0x7c(%rbp)
14549e239:     	movq	-0x20(%rbp), %rax
14549e23d:     	movq	%rax, 0x80(%rbp)
14549e244:     	xorl	%esi, %esi
14549e246:     	leaq	-0x18(%rbp), %r15
14549e24a:     	leaq	0x20(%rbp), %r12
14549e24e:     	xorl	%eax, %eax
14549e250:     	jmp	0x14549e272 <.text+0x549d272>
14549e252:     	nopw	%cs:(%rax,%rax)
14549e260:     	movq	0x28(%rbp), %rax
14549e264:     	movq	%r13, (%rax,%rsi,8)
14549e268:     	incq	%rsi
14549e26b:     	movq	%rsi, 0x30(%rbp)
14549e26f:     	movq	%r14, %rax
14549e272:     	cmpq	$0x2, %rax
14549e276:     	je	0x14549e303 <.text+0x549d303>
14549e27c:     	leaq	0x1(%rax), %r14
14549e280:     	movq	%r14, 0x60(%rbp)
14549e284:     	leaq	(%rax,%rax,2), %rax
14549e288:     	leaq	(%rbx,%rax,4), %rdx
14549e28c:     	movlps	%xmm6, -0x18(%rbp)
14549e290:     	movss	%xmm7, -0x10(%rbp)
14549e295:     	movb	$0x1, 0x96(%rbp)
14549e29c:     	movl	$0x10, 0x20(%rsp)
14549e2a4:     	movq	%rdi, %rcx
14549e2a7:     	movq	%r15, %r8
14549e2aa:     	movl	$0x5, %r9d
14549e2b0:     	callq	0x1454a7540 <.text+0x54a6540>
14549e2b5:     	nop
14549e2b6:     	movq	%rax, %r13
14549e2b9:     	movq	0x30(%rbp), %rsi
14549e2bd:     	cmpq	0x20(%rbp), %rsi
14549e2c1:     	jne	0x14549e260 <.text+0x549d260>
14549e2c3:     	movb	$0x1, 0x96(%rbp)
14549e2ca:     	movq	%r12, %rcx
14549e2cd:     	callq	0x145717ba0 <.text+0x5716ba0>
14549e2d2:     	nop
14549e2d3:     	jmp	0x14549e260 <.text+0x549d260>
14549e2d5:     	movl	$0x8, %eax
14549e2da:     	movq	%rax, 0x10(%rbp)
14549e2de:     	xorl	%esi, %esi
14549e2e0:     	movq	$0x0, 0x18(%rbp)
14549e2e8:     	movss	0x8d4(%rdi), %xmm8
14549e2f1:     	movq	0x530(%rdi), %rbx
14549e2f8:     	cmpq	0x520(%rdi), %rbx
14549e2ff:     	je	0x14549e338 <.text+0x549d338>
14549e301:     	jmp	0x14549e345 <.text+0x549d345>
14549e303:     	movq	0x20(%rbp), %rax
14549e307:     	movq	%rax, 0x18(%rbp)
14549e30b:     	movq	0x28(%rbp), %rax
14549e30f:     	movq	%rax, 0x10(%rbp)
14549e313:     	movl	0x8(%rbp), %r12d
14549e317:     	movl	0xc(%rbp), %r13d
14549e31b:     	movq	-0x38(%rbp), %r14
14549e31f:     	movss	0x8d4(%rdi), %xmm8
14549e328:     	movq	0x530(%rdi), %rbx
14549e32f:     	cmpq	0x520(%rdi), %rbx
14549e336:     	jne	0x14549e345 <.text+0x549d345>
14549e338:     	leaq	0x520(%rdi), %rcx
14549e33f:     	callq	0x145717c80 <.text+0x5716c80>
14549e344:     	nop
14549e345:     	movq	0x528(%rdi), %rax
14549e34c:     	leaq	(%rbx,%rbx,8), %rcx
14549e350:     	movq	0x18(%rbp), %rdx
14549e354:     	movq	%rdx, (%rax,%rcx,8)
14549e358:     	movq	0x10(%rbp), %rdx
14549e35c:     	movq	%rdx, 0x8(%rax,%rcx,8)
14549e361:     	movq	%rsi, 0x10(%rax,%rcx,8)
14549e366:     	movl	$0x0, 0x18(%rax,%rcx,8)
14549e36e:     	movl	%r13d, 0x20(%rax,%rcx,8)
14549e373:     	movl	%r12d, 0x24(%rax,%rcx,8)
14549e378:     	movq	%r14, 0x28(%rax,%rcx,8)
14549e37d:     	movl	0x5c(%rbp), %edx
14549e380:     	movl	%edx, 0x30(%rax,%rcx,8)
14549e384:     	movlps	%xmm6, 0x34(%rax,%rcx,8)
14549e389:     	movss	%xmm7, 0x3c(%rax,%rcx,8)
14549e38f:     	movss	%xmm8, 0x40(%rax,%rcx,8)
14549e396:     	incq	%rbx
14549e399:     	movq	%rbx, 0x530(%rdi)
14549e3a0:     	movaps	0xa0(%rbp), %xmm6
14549e3a7:     	movaps	0xb0(%rbp), %xmm7
14549e3ae:     	movaps	0xc0(%rbp), %xmm8
14549e3b6:     	addq	$0x158, %rsp            # imm = 0x158
14549e3bd:     	popq	%rbx
14549e3be:     	popq	%rdi
14549e3bf:     	popq	%rsi
14549e3c0:     	popq	%r12
14549e3c2:     	popq	%r13
14549e3c4:     	popq	%r14
14549e3c6:     	popq	%r15
14549e3c8:     	popq	%rbp
14549e3c9:     	retq
14549e3ca:     	cmpl	$0x0, 0x20(%r8)
14549e3cf:     	jne	0x14549e3a0 <.text+0x549d3a0>
14549e3d1:     	addl	%r12d, 0x24(%r8)
14549e3d5:     	jmp	0x14549e3a0 <.text+0x549d3a0>
