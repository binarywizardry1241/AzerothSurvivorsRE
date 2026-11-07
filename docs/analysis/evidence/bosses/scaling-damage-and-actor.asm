
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bf6b7:     	movq	%rdi, -0x20(%rbp)
1454bf6bb:     	movq	%rax, -0x18(%rbp)
1454bf6bf:     	mulss	0x944(%rsi), %xmm10
1454bf6c8:     	movq	%rdi, -0x10(%rbp)
1454bf6cc:     	sqrtss	%xmm10, %xmm10
1454bf6d1:     	mulss	0x48(%r13), %xmm10
1454bf6d7:     	movss	0x14eae71(%rip), %xmm0  # 0x1469aa550
1454bf6df:     	movaps	%xmm6, %xmm1
1454bf6e2:     	callq	0x145756e73 <.text+0x5755e73>
1454bf6e7:     	mulss	%xmm10, %xmm0
1454bf6ec:     	xorps	%xmm1, %xmm1
1454bf6ef:     	punpcklwd	%xmm1, %xmm8    # xmm8 = xmm8[0],xmm1[0],xmm8[1],xmm1[1],xmm8[2],xmm1[2],xmm8[3],xmm1[3]
1454bf6f4:     	movss	0x43d53c(%rip), %xmm2   # 0x1458fcc38
1454bf6fc:     	movaps	%xmm9, %xmm5
1454bf700:     	mulss	%xmm2, %xmm5
1454bf704:     	addss	0x754e08(%rip), %xmm5   # 0x145c14514
1454bf70c:     	cvtdq2ps	%xmm8, %xmm6
1454bf710:     	minss	0x44b7e8(%rip), %xmm5   # 0x14590af00
1454bf718:     	movss	0x8e4(%rsi), %xmm3
1454bf720:     	movss	0x42bd58(%rip), %xmm4   # 0x1458eb480
1454bf728:     	addss	%xmm3, %xmm4
1454bf72c:     	addss	%xmm3, %xmm2
1454bf730:     	movss	0x4c(%r13), %xmm8
1454bf736:     	unpcklps	%xmm8, %xmm0            # xmm0 = xmm0[0],xmm8[0],xmm0[1],xmm8[1]
1454bf73a:     	movups	%xmm1, 0xa8(%rbp)
1454bf741:     	movups	%xmm1, 0x98(%rbp)
1454bf748:     	movups	%xmm1, 0x88(%rbp)
1454bf74f:     	movups	%xmm1, 0x78(%rbp)
1454bf753:     	movq	%rbx, 0x50(%rbp)
1454bf757:     	movq	$0x0, 0x58(%rbp)
1454bf75f:     	movq	%r13, -0x8(%rbp)
1454bf763:     	movb	$0x0, (%rbp)
1454bf767:     	movss	%xmm7, 0xb8(%rbp)
1454bf76f:     	divps	0x116876a(%rip), %xmm6  # 0x146627ee0
1454bf776:     	movss	%xmm7, 0xbc(%rbp)
1454bf77e:     	mulps	%xmm0, %xmm6
1454bf781:     	movlps	%xmm6, 0xc0(%rbp)
1454bf788:     	movl	$0x40000000, 0xc8(%rbp) # imm = 0x40000000
1454bf792:     	movss	%xmm5, 0xcc(%rbp)
1454bf79a:     	movss	%xmm9, 0xd0(%rbp)
1454bf7a3:     	movq	0x150(%rbp), %rax
1454bf7aa:     	movq	%rax, 0xd4(%rbp)
1454bf7b1:     	movl	0x158(%rbp), %eax
1454bf7b7:     	movl	%eax, 0xdc(%rbp)
1454bf7bd:     	movl	0x158(%rbp), %eax
1454bf7c3:     	movl	%eax, 0xe8(%rbp)
1454bf7c9:     	movq	0x150(%rbp), %rax
1454bf7d0:     	movq	%rax, 0xe0(%rbp)
1454bf7d7:     	movss	%xmm3, 0xec(%rbp)
1454bf7df:     	movl	$0x0, 0xf0(%rbp)
1454bf7e9:     	movss	%xmm4, 0xf4(%rbp)
1454bf7f1:     	movl	$0x40000000, 0xf8(%rbp) # imm = 0x40000000
1454bf7fb:     	movups	%xmm1, 0x60(%rbp)
1454bf7ff:     	movq	$0x0, 0x70(%rbp)
1454bf807:     	movups	%xmm1, 0xfc(%rbp)
1454bf80e:     	movss	%xmm2, 0x10c(%rbp)
1454bf816:     	movss	%xmm3, 0x110(%rbp)
1454bf81e:     	movq	$0x0, 0x114(%rbp)
1454bf829:     	movq	$0x0, -0x38(%rbp)
1454bf831:     	movq	$0x8, -0x30(%rbp)
1454bf839:     	movq	$0x0, -0x28(%rbp)
1454bf841:     	movl	$0x0, 0x11c(%rbp)
1454bf84b:     	movl	$0x0, 0x30(%rbp)
1454bf852:     	movl	$0x0, 0x38(%rbp)
1454bf859:     	movb	$0x1, 0x120(%rbp)
1454bf860:     	movq	$-0x1, 0x8(%rbp)
1454bf868:     	movl	$0x0, 0x40(%rbp)
1454bf86f:     	movq	0x4d0(%rsi), %rdi
1454bf876:     	cmpq	0x4c0(%rsi), %rdi
1454bf87d:     	jne	0x1454bf88c <.text+0x54be88c>
1454bf87f:     	leaq	0x4c0(%rsi), %rcx
1454bf886:     	callq	0x14580b6b0 <.text+0x580a6b0>
1454bf88b:     	nop
1454bf88c:     	leaq	0x30(%r13), %r14
1454bf890:     	imulq	$0x160, %rdi, %rcx      # imm = 0x160
1454bf897:     	addq	0x4c8(%rsi), %rcx
1454bf89e:     	leaq	-0x38(%rbp), %rdx
1454bf8a2:     	movl	$0x160, %r8d            # imm = 0x160
1454bf8a8:     	callq	0x145756ddd <.text+0x5755ddd>
1454bf8ad:     	incq	%rdi
1454bf8b0:     	movq	%rdi, 0x4d0(%rsi)
