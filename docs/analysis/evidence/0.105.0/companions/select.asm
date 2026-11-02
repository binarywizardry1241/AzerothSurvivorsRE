
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592f7a0:     	pushq	%r15
14592f7a2:     	pushq	%r14
14592f7a4:     	pushq	%r13
14592f7a6:     	pushq	%r12
14592f7a8:     	pushq	%rsi
14592f7a9:     	pushq	%rdi
14592f7aa:     	pushq	%rbp
14592f7ab:     	pushq	%rbx
14592f7ac:     	subq	$0xa8, %rsp
14592f7b3:     	movaps	%xmm8, 0x90(%rsp)
14592f7bc:     	movaps	%xmm7, 0x80(%rsp)
14592f7c4:     	movaps	%xmm6, 0x70(%rsp)
14592f7c9:     	movq	%rdx, %r9
14592f7cc:     	movq	0x900(%rcx), %rdx
14592f7d3:     	cmpq	%rdx, %r9
14592f7d6:     	jae	0x14592fd6b <.text+0x592ed6b>
14592f7dc:     	movq	%rcx, %rsi
14592f7df:     	movq	0x8f8(%rcx), %rax
14592f7e6:     	imulq	$0x70, %r9, %r8
14592f7ea:     	leaq	(%rax,%r8), %rcx
14592f7ee:     	movss	0x5c(%rax,%r8), %xmm1
14592f7f5:     	xorps	%xmm0, %xmm0
14592f7f8:     	ucomiss	%xmm1, %xmm0
14592f7fb:     	jae	0x14592f837 <.text+0x592e837>
14592f7fd:     	movss	0x9ec(%rsi), %xmm2
14592f805:     	subss	0x58(%rcx), %xmm2
14592f80a:     	divss	%xmm1, %xmm2
14592f80e:     	maxss	%xmm2, %xmm0
14592f812:     	movss	0x43db52(%rip), %xmm1   # 0x145d6d36c
14592f81a:     	minss	%xmm0, %xmm1
14592f81e:     	movsd	0x40(%rcx), %xmm0
14592f823:     	movsd	0x4c(%rcx), %xmm2
14592f828:     	subps	%xmm0, %xmm2
14592f82b:     	movsldup	%xmm1, %xmm6            # xmm6 = xmm1[0,0,2,2]
14592f82f:     	mulps	%xmm2, %xmm6
14592f832:     	addps	%xmm0, %xmm6
14592f835:     	jmp	0x14592f83c <.text+0x592e83c>
14592f837:     	movsd	0x4c(%rcx), %xmm6
14592f83c:     	movsd	0x4c8(%rsi), %xmm7
14592f844:     	movss	0x490(%rsi), %xmm8
14592f84d:     	movzbl	0x28c(%rsi), %edi
14592f854:     	movzbl	0x30(%rcx), %ebx
14592f858:     	imulq	$0x70, %rdx, %r8
14592f85c:     	addq	%rax, %r8
14592f85f:     	leaq	0x38(%rsp), %rcx
14592f864:     	movq	%rax, %rdx
14592f867:     	callq	0x1459a3c60 <.text+0x59a2c60>
14592f86c:     	movq	0x5c8(%rsi), %rcx
14592f873:     	testq	%rcx, %rcx
14592f876:     	je	0x14592fa1f <.text+0x592ea1f>
14592f87c:     	xorps	%xmm0, %xmm0
14592f87f:     	cvtsi2ss	%edi, %xmm0
14592f883:     	mulss	0x43ddc5(%rip), %xmm0   # 0x145d6d650
14592f88b:     	addss	0x52c465(%rip), %xmm0   # 0x145e5bcf8
14592f893:     	addss	%xmm8, %xmm0
14592f898:     	movq	0x5c0(%rsi), %rax
14592f89f:     	leaq	(%rcx,%rcx,8), %rcx
14592f8a3:     	leaq	(%rax,%rcx,8), %r14
14592f8a7:     	movq	0x40(%rsp), %rcx
14592f8ac:     	movq	0x48(%rsp), %rdx
14592f8b1:     	movabsq	$0xffffffffffffff8, %r8 # imm = 0xFFFFFFFFFFFFFF8
14592f8bb:     	andq	%rdx, %r8
14592f8be:     	shll	$0x3, %edx
14592f8c1:     	andl	$0x38, %edx
14592f8c4:     	xorl	%edi, %edi
14592f8c6:     	jmp	0x14592f8d9 <.text+0x592e8d9>
14592f8c8:     	nopl	(%rax,%rax)
14592f8d0:     	cmpq	%r14, %rax
14592f8d3:     	je	0x14592fa21 <.text+0x592ea21>
14592f8d9:     	movq	%rax, %r9
14592f8dc:     	addq	$0x48, %rax
14592f8e0:     	cmpb	$0x0, 0x18(%r9)
14592f8e5:     	jne	0x14592f8d0 <.text+0x592e8d0>
14592f8e7:     	movq	0x28(%r9), %rsi
14592f8eb:     	xorl	%r10d, %r10d
14592f8ee:     	nop
14592f8f0:     	cmpq	%r10, %r8
14592f8f3:     	je	0x14592f932 <.text+0x592e932>
14592f8f5:     	cmpq	%rsi, (%rcx,%r10,8)
14592f8f9:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f8fb:     	cmpq	%rsi, 0x8(%rcx,%r10,8)
14592f900:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f902:     	cmpq	%rsi, 0x10(%rcx,%r10,8)
14592f907:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f909:     	cmpq	%rsi, 0x18(%rcx,%r10,8)
14592f90e:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f910:     	cmpq	%rsi, 0x20(%rcx,%r10,8)
14592f915:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f917:     	cmpq	%rsi, 0x28(%rcx,%r10,8)
14592f91c:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f91e:     	cmpq	%rsi, 0x30(%rcx,%r10,8)
14592f923:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f925:     	cmpq	%rsi, 0x38(%rcx,%r10,8)
14592f92a:     	leaq	0x8(%r10), %r10
14592f92e:     	jne	0x14592f8f0 <.text+0x592e8f0>
14592f930:     	jmp	0x14592f8d0 <.text+0x592e8d0>
14592f932:     	testq	%rdx, %rdx
14592f935:     	je	0x14592f942 <.text+0x592e942>
14592f937:     	cmpq	%rsi, (%rcx,%r8,8)
14592f93b:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f93d:     	cmpl	$0x8, %edx
14592f940:     	jne	0x14592f9a6 <.text+0x592e9a6>
14592f942:     	movsd	0x34(%r9), %xmm1
14592f948:     	movaps	%xmm1, %xmm2
14592f94b:     	subps	%xmm7, %xmm2
14592f94e:     	mulps	%xmm2, %xmm2
14592f951:     	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
14592f955:     	addss	%xmm2, %xmm3
14592f959:     	xorps	%xmm2, %xmm2
14592f95c:     	sqrtss	%xmm3, %xmm2
14592f960:     	ucomiss	%xmm2, %xmm0
14592f963:     	jb	0x14592f8d0 <.text+0x592e8d0>
14592f969:     	ucomiss	%xmm8, %xmm2
14592f96d:     	jbe	0x14592f8d0 <.text+0x592e8d0>
14592f973:     	movl	0x20(%r9), %r9d
14592f977:     	testl	%r9d, %r9d
14592f97a:     	je	0x14592fa6f <.text+0x592ea6f>
14592f980:     	cmpl	$0x1, %r9d
14592f984:     	je	0x14592fa83 <.text+0x592ea83>
14592f98a:     	cmpb	$0x3, %bl
14592f98d:     	jne	0x14592f8d0 <.text+0x592e8d0>
14592f993:     	addl	$-0x3, %r9d
14592f997:     	cmpl	$0x3, %r9d
14592f99b:     	jae	0x14592f8d0 <.text+0x592e8d0>
14592f9a1:     	jmp	0x14592fa74 <.text+0x592ea74>
14592f9a6:     	cmpq	%rsi, 0x8(%rcx,%r8,8)
14592f9ab:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f9b1:     	cmpl	$0x10, %edx
14592f9b4:     	je	0x14592f942 <.text+0x592e942>
14592f9b6:     	cmpq	%rsi, 0x10(%rcx,%r8,8)
14592f9bb:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f9c1:     	cmpl	$0x18, %edx
14592f9c4:     	je	0x14592f942 <.text+0x592e942>
14592f9ca:     	cmpq	%rsi, 0x18(%rcx,%r8,8)
14592f9cf:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f9d5:     	cmpl	$0x20, %edx
14592f9d8:     	je	0x14592f942 <.text+0x592e942>
14592f9de:     	cmpq	%rsi, 0x20(%rcx,%r8,8)
14592f9e3:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f9e9:     	cmpl	$0x28, %edx
14592f9ec:     	je	0x14592f942 <.text+0x592e942>
14592f9f2:     	cmpq	%rsi, 0x28(%rcx,%r8,8)
14592f9f7:     	je	0x14592f8d0 <.text+0x592e8d0>
14592f9fd:     	cmpl	$0x30, %edx
14592fa00:     	je	0x14592f942 <.text+0x592e942>
14592fa06:     	cmpq	%rsi, 0x30(%rcx,%r8,8)
14592fa0b:     	je	0x14592f8d0 <.text+0x592e8d0>
14592fa11:     	cmpl	$0x38, %edx
14592fa14:     	je	0x14592f942 <.text+0x592e942>
14592fa1a:     	jmp	0x14592f8d0 <.text+0x592e8d0>
14592fa1f:     	xorl	%edi, %edi
14592fa21:     	movq	0x38(%rsp), %rdx
14592fa26:     	testq	%rdx, %rdx
14592fa29:     	je	0x14592fa3f <.text+0x592ea3f>
14592fa2b:     	movq	0x40(%rsp), %rcx
14592fa30:     	shlq	$0x3, %rdx
14592fa34:     	movl	$0x8, %r8d
14592fa3a:     	callq	0x1400021d0 <.text+0x11d0>
14592fa3f:     	movq	%rdi, %rax
14592fa42:     	movq	%rsi, %rdx
14592fa45:     	movaps	0x70(%rsp), %xmm6
14592fa4a:     	movaps	0x80(%rsp), %xmm7
14592fa52:     	movaps	0x90(%rsp), %xmm8
14592fa5b:     	addq	$0xa8, %rsp
14592fa62:     	popq	%rbx
14592fa63:     	popq	%rbp
14592fa64:     	popq	%rdi
14592fa65:     	popq	%rsi
14592fa66:     	popq	%r12
14592fa68:     	popq	%r13
14592fa6a:     	popq	%r14
14592fa6c:     	popq	%r15
14592fa6e:     	retq
14592fa6f:     	cmpb	$0x2, %bl
14592fa72:     	jne	0x14592fa88 <.text+0x592ea88>
14592fa74:     	xorl	%r9d, %r9d
14592fa77:     	movl	$0x1, %edi
14592fa7c:     	cmpq	%r14, %rax
14592fa7f:     	jne	0x14592fa95 <.text+0x592ea95>
14592fa81:     	jmp	0x14592fa21 <.text+0x592ea21>
14592fa83:     	cmpb	$0x1, %bl
14592fa86:     	je	0x14592fa74 <.text+0x592ea74>
14592fa88:     	movb	$0x1, %r9b
14592fa8b:     	movl	$0x1, %edi
14592fa90:     	cmpq	%r14, %rax
14592fa93:     	je	0x14592fa21 <.text+0x592ea21>
14592fa95:     	movl	%r9d, 0x34(%rsp)
14592fa9a:     	subps	%xmm6, %xmm1
14592fa9d:     	mulps	%xmm1, %xmm1
14592faa0:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14592faa4:     	addss	%xmm1, %xmm2
14592faa8:     	xorps	%xmm1, %xmm1
14592faab:     	sqrtss	%xmm2, %xmm1
14592faaf:     	movss	%xmm1, 0x30(%rsp)
14592fab5:     	subq	%rax, %r14
14592fab8:     	shrq	$0x3, %r14
14592fabc:     	movabsq	$-0x71c71c71c71c71c7, %r11 # imm = 0x8E38E38E38E38E39
14592fac6:     	imulq	%r14, %r11
14592faca:     	leaq	0x55(%rsp), %r15
14592facf:     	xorl	%r12d, %r12d
14592fad2:     	nopw	%cs:(%rax,%rax)
14592fae0:     	movq	%r15, %r9
14592fae3:     	leaq	(%r12,%r12,8), %r14
14592fae7:     	cmpb	$0x0, 0x18(%rax,%r14,8)
14592faed:     	je	0x14592fb30 <.text+0x592eb30>
14592faef:     	movzbl	0x26(%rsp), %ebp
14592faf4:     	movb	%bpl, 0x2a(%rsp)
14592faf9:     	movzwl	0x24(%rsp), %ebp
14592fafe:     	movw	%bp, 0x28(%rsp)
14592fb03:     	movq	%r9, %r15
14592fb06:     	movzbl	0x2a(%rsp), %r10d
14592fb0c:     	movb	%r10b, 0x26(%rsp)
14592fb11:     	movzwl	0x28(%rsp), %r10d
14592fb17:     	movw	%r10w, 0x24(%rsp)
14592fb1d:     	incq	%r12
14592fb20:     	cmpq	%r11, %r12
14592fb23:     	jne	0x14592fae0 <.text+0x592eae0>
14592fb25:     	jmp	0x14592fa21 <.text+0x592ea21>
14592fb2a:     	nopw	(%rax,%rax)
14592fb30:     	leaq	(%rax,%r14,8), %rbp
14592fb34:     	movq	0x28(%rbp), %r13
14592fb38:     	xorl	%r15d, %r15d
14592fb3b:     	nopl	(%rax,%rax)
14592fb40:     	cmpq	%r15, %r8
14592fb43:     	je	0x14592fb89 <.text+0x592eb89>
14592fb45:     	cmpq	%r13, (%rcx,%r15,8)
14592fb49:     	je	0x14592faef <.text+0x592eaef>
14592fb4b:     	cmpq	%r13, 0x8(%rcx,%r15,8)
14592fb50:     	je	0x14592faef <.text+0x592eaef>
14592fb52:     	cmpq	%r13, 0x10(%rcx,%r15,8)
14592fb57:     	je	0x14592faef <.text+0x592eaef>
14592fb59:     	cmpq	%r13, 0x18(%rcx,%r15,8)
14592fb5e:     	je	0x14592faef <.text+0x592eaef>
14592fb60:     	cmpq	%r13, 0x20(%rcx,%r15,8)
14592fb65:     	je	0x14592faef <.text+0x592eaef>
14592fb67:     	cmpq	%r13, 0x28(%rcx,%r15,8)
14592fb6c:     	je	0x14592faef <.text+0x592eaef>
14592fb6e:     	cmpq	%r13, 0x30(%rcx,%r15,8)
14592fb73:     	je	0x14592faef <.text+0x592eaef>
14592fb79:     	cmpq	%r13, 0x38(%rcx,%r15,8)
14592fb7e:     	leaq	0x8(%r15), %r15
14592fb82:     	jne	0x14592fb40 <.text+0x592eb40>
14592fb84:     	jmp	0x14592faef <.text+0x592eaef>
14592fb89:     	testq	%rdx, %rdx
14592fb8c:     	je	0x14592fb9d <.text+0x592eb9d>
14592fb8e:     	cmpq	%r13, (%rcx,%r8,8)
14592fb92:     	je	0x14592faef <.text+0x592eaef>
14592fb98:     	cmpl	$0x8, %edx
14592fb9b:     	jne	0x14592fbf2 <.text+0x592ebf2>
14592fb9d:     	movsd	0x34(%rbp), %xmm1
14592fba2:     	movaps	%xmm1, %xmm2
14592fba5:     	subps	%xmm7, %xmm2
14592fba8:     	mulps	%xmm2, %xmm2
14592fbab:     	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
14592fbaf:     	addss	%xmm2, %xmm3
14592fbb3:     	xorps	%xmm2, %xmm2
14592fbb6:     	sqrtss	%xmm3, %xmm2
14592fbba:     	ucomiss	%xmm2, %xmm0
14592fbbd:     	jb	0x14592faef <.text+0x592eaef>
14592fbc3:     	ucomiss	%xmm8, %xmm2
14592fbc7:     	jbe	0x14592faef <.text+0x592eaef>
14592fbcd:     	movl	0x20(%rbp), %ebp
14592fbd0:     	testl	%ebp, %ebp
14592fbd2:     	je	0x14592fc67 <.text+0x592ec67>
14592fbd8:     	cmpl	$0x1, %ebp
14592fbdb:     	jne	0x14592fc79 <.text+0x592ec79>
14592fbe1:     	cmpb	$0x1, %bl
14592fbe4:     	movq	%r9, %r15
14592fbe7:     	jne	0x14592fc6f <.text+0x592ec6f>
14592fbed:     	jmp	0x14592fc91 <.text+0x592ec91>
14592fbf2:     	cmpq	%r13, 0x8(%rcx,%r8,8)
14592fbf7:     	je	0x14592faef <.text+0x592eaef>
14592fbfd:     	cmpl	$0x10, %edx
14592fc00:     	je	0x14592fb9d <.text+0x592eb9d>
14592fc02:     	cmpq	%r13, 0x10(%rcx,%r8,8)
14592fc07:     	je	0x14592faef <.text+0x592eaef>
14592fc0d:     	cmpl	$0x18, %edx
14592fc10:     	je	0x14592fb9d <.text+0x592eb9d>
14592fc12:     	cmpq	%r13, 0x18(%rcx,%r8,8)
14592fc17:     	je	0x14592faef <.text+0x592eaef>
14592fc1d:     	cmpl	$0x20, %edx
14592fc20:     	je	0x14592fb9d <.text+0x592eb9d>
14592fc26:     	cmpq	%r13, 0x20(%rcx,%r8,8)
14592fc2b:     	je	0x14592faef <.text+0x592eaef>
14592fc31:     	cmpl	$0x28, %edx
14592fc34:     	je	0x14592fb9d <.text+0x592eb9d>
14592fc3a:     	cmpq	%r13, 0x28(%rcx,%r8,8)
14592fc3f:     	je	0x14592faef <.text+0x592eaef>
14592fc45:     	cmpl	$0x30, %edx
14592fc48:     	je	0x14592fb9d <.text+0x592eb9d>
14592fc4e:     	cmpq	%r13, 0x30(%rcx,%r8,8)
14592fc53:     	je	0x14592faef <.text+0x592eaef>
14592fc59:     	cmpl	$0x38, %edx
14592fc5c:     	je	0x14592fb9d <.text+0x592eb9d>
14592fc62:     	jmp	0x14592faef <.text+0x592eaef>
14592fc67:     	cmpb	$0x2, %bl
14592fc6a:     	movq	%r9, %r15
14592fc6d:     	je	0x14592fc91 <.text+0x592ec91>
14592fc6f:     	movb	$0x1, %r10b
14592fc72:     	movl	%r10d, 0x2c(%rsp)
14592fc77:     	jmp	0x14592fc99 <.text+0x592ec99>
14592fc79:     	cmpb	$0x3, %bl
14592fc7c:     	movq	%r9, %r15
14592fc7f:     	jne	0x14592fd4f <.text+0x592ed4f>
14592fc85:     	addl	$-0x3, %ebp
14592fc88:     	cmpl	$0x3, %ebp
14592fc8b:     	jae	0x14592fd4f <.text+0x592ed4f>
14592fc91:     	movl	$0x0, 0x2c(%rsp)
14592fc99:     	subps	%xmm6, %xmm1
14592fc9c:     	mulps	%xmm1, %xmm1
14592fc9f:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14592fca3:     	addss	%xmm1, %xmm2
14592fca7:     	xorps	%xmm1, %xmm1
14592fcaa:     	sqrtss	%xmm2, %xmm1
14592fcae:     	movzbl	0x26(%rsp), %r14d
14592fcb4:     	movb	%r14b, 0x2(%r15)
14592fcb8:     	movzwl	0x24(%rsp), %r14d
14592fcbe:     	movw	%r14w, (%r15)
14592fcc2:     	movl	0x34(%rsp), %ebp
14592fcc6:     	movl	%ebp, %r14d
14592fcc9:     	movd	%xmm1, %r10d
14592fcce:     	subb	0x2c(%rsp), %r14b
14592fcd3:     	jne	0x14592fd05 <.text+0x592ed05>
14592fcd5:     	movl	0x30(%rsp), %r15d
14592fcda:     	movl	%r15d, %r14d
14592fcdd:     	sarl	$0x1f, %r14d
14592fce1:     	shrl	%r14d
14592fce4:     	xorl	%r15d, %r14d
14592fce7:     	movl	%r10d, %r15d
14592fcea:     	sarl	$0x1f, %r15d
14592fcee:     	shrl	%r15d
14592fcf1:     	xorl	%r10d, %r15d
14592fcf4:     	cmpl	%r15d, %r14d
14592fcf7:     	setl	%r15b
14592fcfb:     	setg	%r14b
14592fcff:     	subb	%r15b, %r14b
14592fd02:     	movq	%r9, %r15
14592fd05:     	testb	%r14b, %r14b
14592fd08:     	movl	0x30(%rsp), %r14d
14592fd0d:     	cmovgl	%r10d, %r14d
14592fd11:     	movl	%r14d, 0x30(%rsp)
14592fd16:     	movzbl	%bpl, %r10d
14592fd1a:     	movzbl	0x2c(%rsp), %r9d
14592fd20:     	cmovlel	%r10d, %r9d
14592fd24:     	movl	%r9d, 0x34(%rsp)
14592fd29:     	leaq	0x65(%rsp), %r10
14592fd2e:     	cmovleq	%r15, %r10
14592fd32:     	movzbl	0x2(%r10), %ebp
14592fd37:     	movb	%bpl, 0x2a(%rsp)
14592fd3c:     	movzwl	(%r10), %r10d
14592fd40:     	movw	%r10w, 0x28(%rsp)
14592fd46:     	cmovgq	%r13, %rsi
14592fd4a:     	jmp	0x14592fb06 <.text+0x592eb06>
14592fd4f:     	movzbl	0x26(%rsp), %r10d
14592fd55:     	movb	%r10b, 0x2a(%rsp)
14592fd5a:     	movzwl	0x24(%rsp), %r10d
14592fd60:     	movw	%r10w, 0x28(%rsp)
14592fd66:     	jmp	0x14592fb06 <.text+0x592eb06>
14592fd6b:     	leaq	0x1549cce(%rip), %r8    # 0x146e79a40
14592fd72:     	movq	%r9, %rcx
14592fd75:     	callq	0x145d697e3 <.text+0x5d687e3>
14592fd7a:     	ud2
