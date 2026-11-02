
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594e4f0:     	pushq	%rbp
14594e4f1:     	pushq	%r15
14594e4f3:     	pushq	%r14
14594e4f5:     	pushq	%r13
14594e4f7:     	pushq	%r12
14594e4f9:     	pushq	%rsi
14594e4fa:     	pushq	%rdi
14594e4fb:     	pushq	%rbx
14594e4fc:     	subq	$0x128, %rsp            # imm = 0x128
14594e503:     	leaq	0x80(%rsp), %rbp
14594e50b:     	movaps	%xmm9, 0x90(%rbp)
14594e513:     	movaps	%xmm8, 0x80(%rbp)
14594e51b:     	movaps	%xmm7, 0x70(%rbp)
14594e51f:     	movaps	%xmm6, 0x60(%rbp)
14594e523:     	movq	$-0x2, 0x58(%rbp)
14594e52b:     	movaps	%xmm3, %xmm6
14594e52e:     	movl	%r8d, %edi
14594e531:     	movq	%rcx, %rsi
14594e534:     	movss	0x9ec(%rcx), %xmm7
14594e53c:     	movzbl	0x39(%rdx), %ebx
14594e540:     	cmpb	$0x6, %bl
14594e543:     	jne	0x14594e5a9 <.text+0x594d5a9>
14594e545:     	movq	%rdx, %r14
14594e548:     	movss	0x4a0(%rsi), %xmm0
14594e550:     	mulss	0x41f068(%rip), %xmm0   # 0x145d6d5c0
14594e558:     	movss	0x718330(%rip), %xmm1   # 0x146066890
14594e560:     	ucomiss	%xmm0, %xmm1
14594e563:     	jae	0x14594e58d <.text+0x594d58d>
14594e565:     	addss	0x1529efb(%rip), %xmm0  # 0x146e78468
14594e56d:     	movss	0x41f0da(%rip), %xmm8   # 0x145d6d650
14594e576:     	divss	%xmm8, %xmm0
14594e57b:     	callq	0x145bc98dd <.text+0x5bc88dd>
14594e580:     	mulss	%xmm8, %xmm0
14594e585:     	addss	0x718303(%rip), %xmm0   # 0x146066890
14594e58d:     	leaq	-0x40(%rbp), %rcx
14594e591:     	movss	0x422697(%rip), %xmm2   # 0x145d70c30
14594e599:     	movq	%rsi, %rdx
14594e59c:     	movaps	%xmm0, %xmm3
14594e59f:     	callq	0x145927830 <.text+0x5926830>
14594e5a4:     	movq	%r14, %rdx
14594e5a7:     	jmp	0x14594e5b0 <.text+0x594d5b0>
14594e5a9:     	movl	$0x0, -0x40(%rbp)
14594e5b0:     	movss	0x118(%rbp), %xmm8
14594e5b9:     	movq	0x110(%rbp), %rax
14594e5c0:     	movq	0x958(%rsi), %r9
14594e5c7:     	movq	0x960(%rsi), %rcx
14594e5ce:     	movq	0x970(%rsi), %r10
14594e5d5:     	movq	0x968(%rsi), %r8
14594e5dc:     	movss	0x425730(%rip), %xmm0   # 0x145d73d14
14594e5e4:     	movss	0x425a5c(%rip), %xmm1   # 0x145d74048
14594e5ec:     	nopl	(%rax)
14594e5f0:     	leaq	(%r9,%r10), %r11
14594e5f4:     	rolq	$0x17, %r11
14594e5f8:     	addq	%r9, %r11
14594e5fb:     	movq	%rcx, %r14
14594e5fe:     	shlq	$0x11, %r14
14594e602:     	xorq	%r9, %r8
14594e605:     	xorq	%rcx, %r10
14594e608:     	xorq	%r8, %rcx
14594e60b:     	xorq	%r10, %r9
14594e60e:     	rolq	$0x2d, %r10
14594e612:     	xorq	%r14, %r8
14594e615:     	shrq	$0x29, %r11
14594e619:     	orl	$0x3f800000, %r11d      # imm = 0x3F800000
14594e620:     	movd	%r11d, %xmm2
14594e625:     	addss	%xmm0, %xmm2
14594e629:     	mulss	%xmm1, %xmm2
14594e62d:     	ucomiss	%xmm2, %xmm1
14594e630:     	jbe	0x14594e5f0 <.text+0x594d5f0>
14594e632:     	xorps	%xmm0, %xmm0
14594e635:     	addss	%xmm0, %xmm2
14594e639:     	movq	%r9, 0x958(%rsi)
14594e640:     	movq	%r10, 0x970(%rsi)
14594e647:     	movq	%rcx, 0x960(%rsi)
14594e64e:     	movq	%r8, 0x968(%rsi)
14594e655:     	cmpl	$0x1, %edi
14594e658:     	jne	0x14594e66e <.text+0x594d66e>
14594e65a:     	addss	%xmm7, %xmm6
14594e65e:     	movss	%xmm6, 0x18(%rbp)
14594e663:     	movq	%rax, 0x20(%rbp)
14594e667:     	movl	$0x1, %eax
14594e66c:     	jmp	0x14594e670 <.text+0x594d670>
14594e66e:     	xorl	%eax, %eax
14594e670:     	movq	%rax, 0x10(%rbp)
14594e674:     	leaq	-0x40(%rbp), %rax
14594e678:     	movq	%rax, 0x20(%rsp)
14594e67d:     	leaq	0x10(%rbp), %r9
14594e681:     	movq	%rsi, %rcx
14594e684:     	callq	0x145928bd0 <.text+0x5927bd0>
14594e689:     	movq	0xd8(%rsi), %rcx
14594e690:     	testq	%rcx, %rcx
14594e693:     	je	0x14594e6b9 <.text+0x594d6b9>
14594e695:     	movq	0xd0(%rsi), %rdx
14594e69c:     	imulq	$0x78, %rcx, %rcx
14594e6a0:     	movss	%xmm8, -0xc(%rdx,%rcx)
14594e6a7:     	movss	0x41ecbd(%rip), %xmm0   # 0x145d6d36c
14594e6af:     	addss	%xmm7, %xmm0
14594e6b3:     	movss	%xmm0, -0x4(%rdx,%rcx)
14594e6b9:     	cmpb	$0x6, %bl
14594e6bc:     	jne	0x14594e756 <.text+0x594d756>
14594e6c2:     	movq	0xd8(%rsi), %rdx
14594e6c9:     	testq	%rdx, %rdx
14594e6cc:     	je	0x14594e7e4 <.text+0x594d7e4>
14594e6d2:     	movq	0xd0(%rsi), %rcx
14594e6d9:     	imulq	$0x78, %rdx, %rdx
14594e6dd:     	leaq	(%rcx,%rdx), %r8
14594e6e1:     	addq	$-0x78, %r8
14594e6e5:     	testq	%r8, %r8
14594e6e8:     	je	0x14594e7e4 <.text+0x594d7e4>
14594e6ee:     	addq	%rdx, %rcx
14594e6f1:     	movss	-0x1c(%rcx), %xmm1
14594e6f6:     	xorps	%xmm0, %xmm0
14594e6f9:     	ucomiss	%xmm1, %xmm0
14594e6fc:     	jae	0x14594e7f6 <.text+0x594d7f6>
14594e702:     	subss	-0x20(%rcx), %xmm7
14594e707:     	divss	%xmm1, %xmm7
14594e70b:     	maxss	%xmm7, %xmm0
14594e70f:     	movss	0x41ec55(%rip), %xmm1   # 0x145d6d36c
14594e717:     	minss	%xmm0, %xmm1
14594e71b:     	movss	-0x30(%rcx), %xmm0
14594e720:     	movss	-0x24(%rcx), %xmm2
14594e725:     	subss	%xmm0, %xmm2
14594e729:     	mulss	%xmm1, %xmm2
14594e72d:     	addss	%xmm0, %xmm2
14594e731:     	movsd	-0x38(%rcx), %xmm0
14594e736:     	movsd	-0x2c(%rcx), %xmm3
14594e73b:     	subps	%xmm0, %xmm3
14594e73e:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
14594e742:     	mulps	%xmm3, %xmm1
14594e745:     	addps	%xmm0, %xmm1
14594e748:     	movlps	%xmm1, 0x48(%rbp)
14594e74c:     	movss	%xmm2, 0x50(%rbp)
14594e751:     	jmp	0x14594e804 <.text+0x594d804>
14594e756:     	movq	%rax, 0x48(%rbp)
14594e75a:     	movl	$0x2, -0x10(%rbp)
14594e761:     	movl	$0x0, -0x1c(%rbp)
14594e768:     	leaq	-0x1c(%rbp), %rcx
14594e76c:     	movq	%rcx, 0x30(%rsp)
14594e771:     	leaq	-0x10(%rbp), %rcx
14594e775:     	movq	%rcx, 0x28(%rsp)
14594e77a:     	movq	$0x1, 0x20(%rsp)
14594e783:     	leaq	0x10(%rbp), %rcx
14594e787:     	leaq	0x48(%rbp), %r9
14594e78b:     	movq	%rax, %rdx
14594e78e:     	movl	$0x1e3d, %r8d           # imm = 0x1E3D
14594e794:     	callq	0x1458b5100 <.text+0x58b4100>
14594e799:     	movq	0x5e0(%rsi), %rdi
14594e7a0:     	cmpq	0x5d0(%rsi), %rdi
14594e7a7:     	jne	0x14594e7b6 <.text+0x594d7b6>
14594e7a9:     	leaq	0x5d0(%rsi), %rcx
14594e7b0:     	callq	0x145bcb530 <.text+0x5bca530>
14594e7b5:     	nop
14594e7b6:     	movq	0x5d8(%rsi), %rax
14594e7bd:     	movq	%rdi, %rcx
14594e7c0:     	shlq	$0x5, %rcx
14594e7c4:     	movups	0x10(%rbp), %xmm0
14594e7c8:     	movups	0x20(%rbp), %xmm1
14594e7cc:     	movups	%xmm1, 0x10(%rax,%rcx)
14594e7d1:     	movups	%xmm0, (%rax,%rcx)
14594e7d5:     	incq	%rdi
14594e7d8:     	movq	%rdi, 0x5e0(%rsi)
14594e7df:     	jmp	0x14594eb46 <.text+0x594db46>
14594e7e4:     	movl	0x4d0(%rsi), %ecx
14594e7ea:     	movl	%ecx, 0x50(%rbp)
14594e7ed:     	movq	0x4c8(%rsi), %rcx
14594e7f4:     	jmp	0x14594e800 <.text+0x594d800>
14594e7f6:     	movl	-0x24(%rcx), %edx
14594e7f9:     	movl	%edx, 0x50(%rbp)
14594e7fc:     	movq	-0x2c(%rcx), %rcx
14594e800:     	movq	%rcx, 0x48(%rbp)
14594e804:     	movl	0x50(%rbp), %ecx
14594e807:     	movl	%ecx, -0x4(%rbp)
14594e80a:     	movq	0x48(%rbp), %rcx
14594e80e:     	movq	%rcx, -0xc(%rbp)
14594e812:     	movl	$0x1, -0x10(%rbp)
14594e819:     	movl	$0x0, -0x1c(%rbp)
14594e820:     	leaq	-0x1c(%rbp), %rcx
14594e824:     	movq	%rcx, 0x30(%rsp)
14594e829:     	leaq	-0x10(%rbp), %rcx
14594e82d:     	movq	%rcx, 0x28(%rsp)
14594e832:     	movq	$0x0, 0x20(%rsp)
14594e83b:     	leaq	0x10(%rbp), %rcx
14594e83f:     	movl	$0x8, %r9d
14594e845:     	movq	%rax, %rdx
14594e848:     	movl	$0x462, %r8d            # imm = 0x462
14594e84e:     	callq	0x1458b5100 <.text+0x58b4100>
14594e853:     	movq	0x5e0(%rsi), %rdi
14594e85a:     	cmpq	0x5d0(%rsi), %rdi
14594e861:     	jne	0x14594e870 <.text+0x594d870>
14594e863:     	leaq	0x5d0(%rsi), %rcx
14594e86a:     	callq	0x145bcb530 <.text+0x5bca530>
14594e86f:     	nop
14594e870:     	movq	0x5d8(%rsi), %rax
14594e877:     	movq	%rdi, %rcx
14594e87a:     	shlq	$0x5, %rcx
14594e87e:     	movups	0x10(%rbp), %xmm0
14594e882:     	movups	0x20(%rbp), %xmm1
14594e886:     	movups	%xmm1, 0x10(%rax,%rcx)
14594e88b:     	movups	%xmm0, (%rax,%rcx)
14594e88f:     	incq	%rdi
14594e892:     	movq	%rdi, 0x5e0(%rsi)
14594e899:     	movq	0xd8(%rsi), %rcx
14594e8a0:     	subq	$0x1, %rcx
14594e8a4:     	jb	0x14594eb72 <.text+0x594db72>
14594e8aa:     	movq	0xd0(%rsi), %rax
14594e8b1:     	movl	0x4d8(%rsi), %edx
14594e8b7:     	xorps	%xmm6, %xmm6
14594e8ba:     	cvtsi2ss	%rdx, %xmm6
14594e8bf:     	movq	%rcx, %rdi
14594e8c2:     	imulq	$0x78, %rcx, %rcx
14594e8c6:     	movq	0x18(%rax,%rcx), %rax
14594e8cb:     	addss	0x425441(%rip), %xmm6   # 0x145d73d14
14594e8d3:     	mulss	0x467619(%rip), %xmm6   # 0x145db5ef4
14594e8db:     	addss	0x41ea89(%rip), %xmm6   # 0x145d6d36c
14594e8e3:     	movq	%rax, -0x30(%rbp)
14594e8e7:     	mulss	0x2c(%rax), %xmm6
14594e8ec:     	mulss	0x47c(%rsi), %xmm6
14594e8f4:     	movss	0x4a0(%rsi), %xmm0
14594e8fc:     	mulss	0x41ecbc(%rip), %xmm0   # 0x145d6d5c0
14594e904:     	movss	0x717f84(%rip), %xmm1   # 0x146066890
14594e90c:     	ucomiss	%xmm0, %xmm1
14594e90f:     	jae	0x14594e936 <.text+0x594d936>
14594e911:     	addss	0x1529b4f(%rip), %xmm0  # 0x146e78468
14594e919:     	movss	0x41ed2f(%rip), %xmm7   # 0x145d6d650
14594e921:     	divss	%xmm7, %xmm0
14594e925:     	callq	0x145bc98dd <.text+0x5bc88dd>
14594e92a:     	mulss	%xmm7, %xmm0
14594e92e:     	addss	0x717f5a(%rip), %xmm0   # 0x146066890
14594e936:     	movq	$0x0, 0x28(%rsp)
14594e93f:     	movq	$0x8, 0x20(%rsp)
14594e948:     	leaq	0x10(%rbp), %rcx
14594e94c:     	leaq	0x48(%rbp), %r8
14594e950:     	movq	%rsi, %rdx
14594e953:     	movaps	%xmm0, %xmm3
14594e956:     	callq	0x145925c80 <.text+0x5924c80>
14594e95b:     	movq	0x10(%rbp), %rax
14594e95f:     	movq	%rax, 0x8(%rbp)
14594e963:     	movq	0x18(%rbp), %rax
14594e967:     	movq	%rax, (%rbp)
14594e96b:     	movq	0x20(%rbp), %rax
14594e96f:     	testq	%rax, %rax
14594e972:     	je	0x14594eb2a <.text+0x594db2a>
14594e978:     	movq	%rdi, %rdx
14594e97b:     	mulss	0x4222b9(%rip), %xmm6   # 0x145d70c3c
14594e983:     	movq	(%rbp), %rbx
14594e987:     	leaq	(%rbx,%rax,8), %rax
14594e98b:     	movq	%rax, -0x28(%rbp)
14594e98f:     	leaq	0x140(%rsi), %r13
14594e996:     	movss	0x41ea8e(%rip), %xmm7   # 0x145d6d42c
14594e99e:     	movss	0x44c4f5(%rip), %xmm8   # 0x145d9ae9c
14594e9a7:     	movss	0x41eda4(%rip), %xmm9   # 0x145d6d754
14594e9b0:     	jmp	0x14594e9f4 <.text+0x594d9f4>
14594e9b2:     	nopw	%cs:(%rax,%rax)
14594e9c0:     	movss	%xmm0, 0x14(%rbp)
14594e9c5:     	movl	$0x3, 0x10(%rbp)
14594e9cc:     	movl	$0x462, 0x20(%rsp)      # imm = 0x462
14594e9d4:     	xorps	%xmm3, %xmm3
14594e9d7:     	movq	%rsi, %rcx
14594e9da:     	movq	%r14, %rdx
14594e9dd:     	leaq	0x10(%rbp), %r8
14594e9e1:     	callq	0x1459251b0 <.text+0x59241b0>
14594e9e6:     	nop
14594e9e7:     	cmpq	-0x28(%rbp), %rbx
14594e9eb:     	movq	%r15, %rdx
14594e9ee:     	je	0x14594eb2a <.text+0x594db2a>
14594e9f4:     	movq	(%rbx), %r14
14594e9f7:     	movq	%rsi, %rcx
14594e9fa:     	movq	%rdx, %r15
14594e9fd:     	movaps	%xmm6, %xmm2
14594ea00:     	movq	%r14, %r9
14594ea03:     	callq	0x145950e90 <.text+0x594fe90>
14594ea08:     	nop
14594ea09:     	movb	0x195(%rsi), %dil
14594ea10:     	movb	$0x2, 0x195(%rsi)
14594ea17:     	movq	0x170(%rsi), %r12
14594ea1e:     	movq	-0x30(%rbp), %rcx
14594ea22:     	movq	%rcx, 0x170(%rsi)
14594ea29:     	movups	(%r13), %xmm1
14594ea2e:     	movups	0x10(%r13), %xmm2
14594ea33:     	movups	0x20(%r13), %xmm3
14594ea38:     	movaps	%xmm3, 0x30(%rbp)
14594ea3c:     	movaps	%xmm2, 0x20(%rbp)
14594ea40:     	movaps	%xmm1, 0x10(%rbp)
14594ea44:     	leaq	0x152bf85(%rip), %rdx   # 0x146e7a9d0
14594ea4b:     	movq	%rdx, 0x140(%rsi)
14594ea52:     	movq	$0x7, 0x148(%rsi)
14594ea5d:     	movq	$0x0, 0x150(%rsi)
14594ea68:     	movb	$0x0, 0x168(%rsi)
14594ea6f:     	movzbl	0x38(%rcx), %ecx
14594ea73:     	andb	$0x1, %al
14594ea75:     	movb	%al, 0x28(%rsp)
14594ea79:     	movb	%cl, 0x20(%rsp)
14594ea7d:     	movb	$0x0, 0x30(%rsp)
14594ea82:     	movq	%rsi, %rcx
14594ea85:     	movq	%r14, %rdx
14594ea88:     	movaps	%xmm0, %xmm2
14594ea8b:     	movl	$0x462, %r9d            # imm = 0x462
14594ea91:     	callq	0x145933ec0 <.text+0x5932ec0>
14594ea96:     	nop
14594ea97:     	addq	$0x8, %rbx
14594ea9b:     	movaps	0x10(%rbp), %xmm0
14594ea9f:     	movaps	0x20(%rbp), %xmm1
14594eaa3:     	movaps	0x30(%rbp), %xmm2
14594eaa7:     	movups	%xmm2, 0x20(%r13)
14594eaac:     	movups	%xmm1, 0x10(%r13)
14594eab1:     	movups	%xmm0, (%r13)
14594eab6:     	movq	%r12, 0x170(%rsi)
14594eabd:     	movb	%dil, 0x195(%rsi)
14594eac4:     	movq	0x560(%rsi), %rax
14594eacb:     	imulq	$0x160, 0x568(%rsi), %rdx # imm = 0x160
14594ead6:     	xorl	%ecx, %ecx
14594ead8:     	movq	%rax, %r8
14594eadb:     	nopl	(%rax,%rax)
14594eae0:     	cmpq	%rcx, %rdx
14594eae3:     	je	0x14594e9e7 <.text+0x594d9e7>
14594eae9:     	addq	$0x160, %rcx            # imm = 0x160
14594eaf0:     	cmpq	%r14, 0x88(%r8)
14594eaf7:     	leaq	0x160(%r8), %r8
14594eafe:     	jne	0x14594eae0 <.text+0x594dae0>
14594eb00:     	cmpq	$-0x1, -0x148(%rax,%rcx)
14594eb09:     	movaps	%xmm7, %xmm0
14594eb0c:     	jne	0x14594e9c0 <.text+0x594d9c0>
14594eb12:     	cmpb	$0x0, -0x4(%rax,%rcx)
14594eb17:     	movaps	%xmm8, %xmm0
14594eb1b:     	je	0x14594e9c0 <.text+0x594d9c0>
14594eb21:     	movaps	%xmm9, %xmm0
14594eb25:     	jmp	0x14594e9c0 <.text+0x594d9c0>
14594eb2a:     	movq	0x8(%rbp), %rdx
14594eb2e:     	testq	%rdx, %rdx
14594eb31:     	je	0x14594eb46 <.text+0x594db46>
14594eb33:     	shlq	$0x3, %rdx
14594eb37:     	movl	$0x8, %r8d
14594eb3d:     	movq	(%rbp), %rcx
14594eb41:     	callq	0x1400021d0 <.text+0x11d0>
14594eb46:     	movaps	0x60(%rbp), %xmm6
14594eb4a:     	movaps	0x70(%rbp), %xmm7
14594eb4e:     	movaps	0x80(%rbp), %xmm8
14594eb56:     	movaps	0x90(%rbp), %xmm9
14594eb5e:     	addq	$0x128, %rsp            # imm = 0x128
14594eb65:     	popq	%rbx
14594eb66:     	popq	%rdi
14594eb67:     	popq	%rsi
14594eb68:     	popq	%r12
14594eb6a:     	popq	%r13
14594eb6c:     	popq	%r14
14594eb6e:     	popq	%r15
14594eb70:     	popq	%rbp
14594eb71:     	retq
14594eb72:     	leaq	0x152be3f(%rip), %r8    # 0x146e7a9b8
14594eb79:     	xorl	%edx, %edx
14594eb7b:     	callq	0x145d697e3 <.text+0x5d687e3>
14594eb80:     	ud2
