
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401f9880:     	pushq	%rbp
1401f9881:     	pushq	%r15
1401f9883:     	pushq	%r14
1401f9885:     	pushq	%r12
1401f9887:     	pushq	%rsi
1401f9888:     	pushq	%rdi
1401f9889:     	pushq	%rbx
1401f988a:     	subq	$0x550, %rsp            # imm = 0x550
1401f9891:     	leaq	0x80(%rsp), %rbp
1401f9899:     	movaps	%xmm8, 0x4c0(%rbp)
1401f98a1:     	movaps	%xmm7, 0x4b0(%rbp)
1401f98a8:     	movaps	%xmm6, 0x4a0(%rbp)
1401f98af:     	movq	$-0x2, 0x498(%rbp)
1401f98ba:     	movq	%r9, %rsi
1401f98bd:     	movq	%r8, %rdi
1401f98c0:     	movq	%rdx, %rbx
1401f98c3:     	movq	%rcx, %r14
1401f98c6:     	movq	0x48(%r9), %rax
1401f98ca:     	leaq	-0x1(%rax), %rcx
1401f98ce:     	cmpq	$0x4, %rcx
1401f98d2:     	ja	0x1401f98fe <.text+0x1f88fe>
1401f98d4:     	leaq	0x5754b1d(%rip), %rcx   # 0x14594e3f8
1401f98db:     	movss	-0x4(%rcx,%rax,4), %xmm6
1401f98e1:     	leaq	0x5754b24(%rip), %rcx   # 0x14594e40c
1401f98e8:     	movss	-0x4(%rcx,%rax,4), %xmm7
1401f98ee:     	leaq	0x5754b2b(%rip), %rcx   # 0x14594e420
1401f98f5:     	movss	-0x4(%rcx,%rax,4), %xmm8
1401f98fc:     	jmp	0x1401f990d <.text+0x1f890d>
1401f98fe:     	movss	0x574602a(%rip), %xmm6  # 0x14593f930
1401f9906:     	movaps	%xmm6, %xmm7
1401f9909:     	movaps	%xmm6, %xmm8
1401f990d:     	movw	$0x0, 0x344(%rbp)
1401f9916:     	movb	$0x1, 0x334(%rbp)
1401f991d:     	movaps	0x5751a1c(%rip), %xmm0  # 0x14594b340
1401f9924:     	movups	%xmm0, 0x248(%rbp)
1401f992b:     	movaps	0x5746c5e(%rip), %xmm0  # 0x145940590
1401f9932:     	movups	%xmm0, 0x258(%rbp)
1401f9939:     	movq	$0x0, 0x240(%rbp)
1401f9944:     	xorps	%xmm0, %xmm0
1401f9947:     	movups	%xmm0, 0x268(%rbp)
1401f994e:     	movups	%xmm0, 0x278(%rbp)
1401f9955:     	movups	%xmm0, 0x288(%rbp)
1401f995c:     	movl	$0x5, 0x35a(%rbp)
1401f9966:     	movaps	0x571bf93(%rip), %xmm0  # 0x145915900
1401f996d:     	movups	%xmm0, 0x298(%rbp)
1401f9974:     	movaps	0x571bf65(%rip), %xmm0  # 0x1459158e0
1401f997b:     	movups	%xmm0, 0x2a8(%rbp)
1401f9982:     	movaps	0x571eea7(%rip), %xmm0  # 0x145918830
1401f9989:     	movups	%xmm0, 0x2b8(%rbp)
1401f9990:     	movaps	0x570d949(%rip), %xmm0  # 0x1459072e0
1401f9997:     	movups	%xmm0, 0x2c8(%rbp)
1401f999e:     	movaps	0x570d94b(%rip), %xmm0  # 0x1459072f0
1401f99a5:     	movups	%xmm0, 0x2d8(%rbp)
1401f99ac:     	movups	%xmm0, 0x2e8(%rbp)
1401f99b3:     	movaps	0x570d946(%rip), %xmm0  # 0x145907300
1401f99ba:     	movups	%xmm0, 0x2f8(%rbp)
1401f99c1:     	movups	%xmm0, 0x308(%rbp)
1401f99c8:     	movq	$0x0, 0x338(%rbp)
1401f99d3:     	movl	$0x3f800000, 0x340(%rbp) # imm = 0x3F800000
1401f99dd:     	movaps	0x571ee6c(%rip), %xmm0  # 0x145918850
1401f99e4:     	movups	%xmm0, 0x318(%rbp)
1401f99eb:     	movl	$0x1, 0x328(%rbp)
1401f99f5:     	movq	$0x0, 0x32c(%rbp)
1401f9a00:     	movabsq	$0x100000100, %rax      # imm = 0x100000100
1401f9a0a:     	movq	%rax, 0x352(%rbp)
1401f9a11:     	movups	0x5752588(%rip), %xmm0  # 0x14594bfa0
1401f9a18:     	movaps	%xmm0, 0x1e0(%rbp)
1401f9a1f:     	movq	$0x0, 0x1f0(%rbp)
1401f9a2a:     	movups	0x5752587(%rip), %xmm0  # 0x14594bfb8
1401f9a31:     	movups	%xmm0, 0x1f8(%rbp)
1401f9a38:     	movq	$0x0, 0x208(%rbp)
1401f9a43:     	movups	0x5752586(%rip), %xmm0  # 0x14594bfd0
1401f9a4a:     	movaps	%xmm0, 0x210(%rbp)
1401f9a51:     	movq	$0x0, 0x220(%rbp)
1401f9a5c:     	movups	0x5752585(%rip), %xmm0  # 0x14594bfe8
1401f9a63:     	movups	%xmm0, 0x228(%rbp)
1401f9a6a:     	movq	$0x0, 0x238(%rbp)
1401f9a75:     	movw	$0x0, 0x34a(%rbp)
1401f9a7e:     	movl	$0x10000, 0x346(%rbp)   # imm = 0x10000
1401f9a88:     	movw	$0x0, 0x350(%rbp)
1401f9a91:     	movl	$0x10000, 0x34c(%rbp)   # imm = 0x10000
1401f9a9b:     	movups	0x575309e(%rip), %xmm0  # 0x14594cb40
1401f9aa2:     	movaps	%xmm0, 0x3f0(%rbp)
1401f9aa9:     	movl	$0x3f59999a, 0x400(%rbp) # imm = 0x3F59999A
1401f9ab3:     	leaq	0x410(%rbp), %rcx
1401f9aba:     	leaq	0x3f0(%rbp), %rdx
1401f9ac1:     	callq	0x144c8c290 <.text+0x4c8b290>
1401f9ac6:     	nop
1401f9ac7:     	movaps	0x410(%rbp), %xmm0
1401f9ace:     	movups	%xmm0, -0x24(%rbp)
1401f9ad2:     	movl	$0x1, -0x28(%rbp)
1401f9ad9:     	movl	$0x41400000, 0x48(%rsp) # imm = 0x41400000
1401f9ae1:     	movl	$0x1, 0x40(%rsp)
1401f9ae9:     	movl	$0x0, 0x38(%rsp)
1401f9af1:     	movl	$0x1, 0x30(%rsp)
1401f9af9:     	movl	$0x40400000, 0x28(%rsp) # imm = 0x40400000
1401f9b01:     	movl	$0x1, 0x20(%rsp)
1401f9b09:     	leaq	0x410(%rbp), %rcx
1401f9b10:     	leaq	-0x28(%rbp), %rdx
1401f9b14:     	xorps	%xmm3, %xmm3
1401f9b17:     	movl	$0x1, %r8d
1401f9b1d:     	callq	0x14265f6a0 <.text+0x265e6a0>
1401f9b22:     	nop
1401f9b23:     	movl	$0x0, 0x428(%rbp)
1401f9b2d:     	movss	%xmm6, 0x42c(%rbp)
1401f9b35:     	movss	%xmm7, 0x430(%rbp)
1401f9b3d:     	movss	%xmm8, 0x434(%rbp)
1401f9b46:     	movq	$0x3f4ccccd, 0x438(%rbp) # imm = 0x3F4CCCCD
1401f9b51:     	movss	%xmm6, 0x440(%rbp)
1401f9b59:     	movss	%xmm7, 0x444(%rbp)
1401f9b61:     	movss	%xmm8, 0x448(%rbp)
1401f9b6a:     	movq	$0x3f4ccccd, 0x44c(%rbp) # imm = 0x3F4CCCCD
1401f9b75:     	movss	%xmm6, 0x454(%rbp)
1401f9b7d:     	movss	%xmm7, 0x458(%rbp)
1401f9b85:     	movss	%xmm8, 0x45c(%rbp)
1401f9b8e:     	movq	$0x3f4ccccd, 0x460(%rbp) # imm = 0x3F4CCCCD
1401f9b99:     	movss	%xmm6, 0x468(%rbp)
1401f9ba1:     	movss	%xmm7, 0x46c(%rbp)
1401f9ba9:     	movss	%xmm8, 0x470(%rbp)
1401f9bb2:     	movq	$0x3f4ccccd, 0x474(%rbp) # imm = 0x3F4CCCCD
1401f9bbd:     	movaps	0x57460ec(%rip), %xmm0  # 0x14593fcb0
1401f9bc4:     	movups	%xmm0, 0x47c(%rbp)
1401f9bcb:     	movl	$0x17a2, 0x48c(%rbp)    # imm = 0x17A2
1401f9bd5:     	movw	$0x1, 0x490(%rbp)
1401f9bde:     	movb	$0x0, 0x492(%rbp)
1401f9be5:     	leaq	-0x28(%rbp), %r15
1401f9be9:     	leaq	0x1e0(%rbp), %rdx
1401f9bf0:     	movl	$0x180, %r8d            # imm = 0x180
1401f9bf6:     	movq	%r15, %rcx
1401f9bf9:     	callq	0x1457731ed <.text+0x57721ed>
1401f9bfe:     	leaq	0x158(%rbp), %rcx
1401f9c05:     	leaq	0x410(%rbp), %rdx
1401f9c0c:     	movl	$0x88, %r8d
1401f9c12:     	callq	0x1457731ed <.text+0x57721ed>
1401f9c17:     	movq	(%r14), %r12
1401f9c1a:     	addq	$0x8, %r14
1401f9c1e:     	leaq	0x1e8(%rbp), %rcx
1401f9c25:     	movl	$0x208, %r8d            # imm = 0x208
1401f9c2b:     	movq	%r15, %rdx
1401f9c2e:     	callq	0x1457731ed <.text+0x57721ed>
1401f9c33:     	movq	%r12, 0x1e0(%rbp)
1401f9c3a:     	leaq	0x5751fa7(%rip), %r9    # 0x14594bbe8
1401f9c41:     	leaq	0x410(%rbp), %r15
1401f9c48:     	leaq	0x1e0(%rbp), %r8
1401f9c4f:     	movq	%r15, %rcx
1401f9c52:     	movq	%r14, %rdx
1401f9c55:     	callq	0x1400dff80 <.text+0xdef80>
1401f9c5a:     	movq	%rbx, 0x1e0(%rbp)
1401f9c61:     	movq	%rdi, 0x1e8(%rbp)
1401f9c68:     	movq	%rsi, 0x1f0(%rbp)
1401f9c6f:     	leaq	0x1e0(%rbp), %rdx
1401f9c76:     	movq	%r15, %rcx
1401f9c79:     	callq	0x140113b60 <.text+0x112b60>
1401f9c7e:     	movaps	0x4a0(%rbp), %xmm6
1401f9c85:     	movaps	0x4b0(%rbp), %xmm7
1401f9c8c:     	movaps	0x4c0(%rbp), %xmm8
1401f9c94:     	addq	$0x550, %rsp            # imm = 0x550
1401f9c9b:     	popq	%rbx
1401f9c9c:     	popq	%rdi
1401f9c9d:     	popq	%rsi
1401f9c9e:     	popq	%r12
1401f9ca0:     	popq	%r14
1401f9ca2:     	popq	%r15
1401f9ca4:     	popq	%rbp
1401f9ca5:     	retq
