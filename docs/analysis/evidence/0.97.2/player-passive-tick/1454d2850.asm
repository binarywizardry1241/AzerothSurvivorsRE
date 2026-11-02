
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d2850:     	pushq	%rbp
1454d2851:     	pushq	%r15
1454d2853:     	pushq	%r14
1454d2855:     	pushq	%r13
1454d2857:     	pushq	%r12
1454d2859:     	pushq	%rsi
1454d285a:     	pushq	%rdi
1454d285b:     	pushq	%rbx
1454d285c:     	subq	$0xf8, %rsp
1454d2863:     	leaq	0x80(%rsp), %rbp
1454d286b:     	movaps	%xmm7, 0x60(%rbp)
1454d286f:     	movaps	%xmm6, 0x50(%rbp)
1454d2873:     	movq	$-0x2, 0x48(%rbp)
1454d287b:     	movl	%r9d, -0xc(%rbp)
1454d287f:     	movq	%r8, %rdi
1454d2882:     	movq	%rcx, %rsi
1454d2885:     	movl	0xe0(%rbp), %r12d
1454d288c:     	movl	(%rdx), %ebx
1454d288e:     	movl	0x4(%rdx), %r13d
1454d2892:     	movd	0x8(%rdx), %xmm6
1454d2897:     	movl	0x904(%rcx), %eax
1454d289d:     	incl	%eax
1454d289f:     	movl	%eax, 0x904(%rcx)
1454d28a5:     	movq	0x880(%rcx), %r8
1454d28ac:     	movq	0x888(%rcx), %rcx
1454d28b3:     	movq	0x898(%rsi), %r9
1454d28ba:     	movq	0x890(%rsi), %rdx
1454d28c1:     	movss	0x418c33(%rip), %xmm0   # 0x1458eb4fc
1454d28c9:     	movss	0x41a743(%rip), %xmm1   # 0x1458ed014
1454d28d1:     	nopw	%cs:(%rax,%rax)
1454d28e0:     	leaq	(%r8,%r9), %r10
1454d28e4:     	rolq	$0x17, %r10
1454d28e8:     	addq	%r8, %r10
1454d28eb:     	movq	%rcx, %r11
1454d28ee:     	shlq	$0x11, %r11
1454d28f2:     	xorq	%r8, %rdx
1454d28f5:     	xorq	%rcx, %r9
1454d28f8:     	xorq	%rdx, %rcx
1454d28fb:     	xorq	%r9, %r8
1454d28fe:     	rolq	$0x2d, %r9
1454d2902:     	xorq	%r11, %rdx
1454d2905:     	shrq	$0x29, %r10
1454d2909:     	orl	$0x3f800000, %r10d      # imm = 0x3F800000
1454d2910:     	movd	%r10d, %xmm7
1454d2915:     	addss	%xmm0, %xmm7
1454d2919:     	mulss	%xmm1, %xmm7
1454d291d:     	ucomiss	%xmm7, %xmm1
1454d2920:     	jbe	0x1454d28e0 <.text+0x54d18e0>
1454d2922:     	movl	%ebx, %r10d
1454d2925:     	andl	$0xffffff, %r10d        # imm = 0xFFFFFF
1454d292c:     	shlq	$0x18, %r10
1454d2930:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454d2935:     	orq	%r10, %rax
1454d2938:     	movabsq	$-0xef0000000000000, %r14 # imm = 0xF110000000000000
1454d2942:     	orq	%rax, %r14
1454d2945:     	movq	%r8, 0x880(%rsi)
1454d294c:     	movq	%r9, 0x898(%rsi)
1454d2953:     	movq	%rcx, 0x888(%rsi)
1454d295a:     	movq	%rdx, 0x890(%rsi)
1454d2961:     	movq	$0x0, -0x8(%rbp)
1454d2969:     	movq	$0x0, 0x8(%rbp)
1454d2971:     	leaq	-0x8(%rbp), %r15
1454d2975:     	movq	%r15, %rcx
1454d2978:     	xorl	%edx, %edx
1454d297a:     	movq	%r14, %r8
1454d297d:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454d2982:     	nop
1454d2983:     	movq	-0x8(%rbp), %rax
1454d2987:     	testq	%rax, %rax
1454d298a:     	je	0x1454d29fb <.text+0x54d19fb>
1454d298c:     	movq	(%rbp), %rcx
1454d2990:     	movw	$0x2, %dx
1454d2994:     	movzwl	0x36(%rax), %r9d
1454d2999:     	movl	%r9d, %r10d
1454d299c:     	addl	%r10d, %r10d
1454d299f:     	movq	$-0x1, %r8
1454d29a6:     	nopw	%cs:(%rax,%rax)
1454d29b0:     	testq	%r10, %r10
1454d29b3:     	je	0x1454d29e0 <.text+0x54d19e0>
1454d29b5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d29bb:     	seta	%r11b
1454d29bf:     	sbbb	$0x0, %r11b
1454d29c3:     	incq	%r8
1454d29c6:     	addq	$-0x2, %r10
1454d29ca:     	cmpb	$0x1, %r11b
1454d29ce:     	je	0x1454d29b0 <.text+0x54d19b0>
1454d29d0:     	movzbl	%r11b, %r9d
1454d29d4:     	testl	%r9d, %r9d
1454d29d7:     	je	0x1454d29f0 <.text+0x54d19f0>
1454d29d9:     	jmp	0x1454d29e3 <.text+0x54d19e3>
1454d29db:     	nopl	(%rax,%rax)
1454d29e0:     	movq	%r9, %r8
1454d29e3:     	subq	$0x1, %rcx
1454d29e7:     	jb	0x1454d29fd <.text+0x54d19fd>
1454d29e9:     	movq	0x50(%rax,%r8,8), %rax
1454d29ee:     	jmp	0x1454d2994 <.text+0x54d1994>
1454d29f0:     	movl	$0x21, 0x8(%rax,%r8,4)
1454d29f9:     	jmp	0x1454d2a2d <.text+0x54d1a2d>
1454d29fb:     	xorl	%eax, %eax
1454d29fd:     	movq	%r15, 0x10(%rbp)
1454d2a01:     	movq	%rax, 0x18(%rbp)
1454d2a05:     	movq	$0x0, 0x20(%rbp)
1454d2a0d:     	movq	%r8, 0x28(%rbp)
1454d2a11:     	movq	$0x2, 0x30(%rbp)
1454d2a19:     	leaq	-0x30(%rbp), %rcx
1454d2a1d:     	leaq	0x10(%rbp), %rdx
1454d2a21:     	movl	$0x21, %r8d
1454d2a27:     	callq	0x145427a50 <.text+0x5426a50>
1454d2a2c:     	nop
1454d2a2d:     	movq	-0x8(%rbp), %rax
1454d2a31:     	testq	%rax, %rax
1454d2a34:     	je	0x1454d2a97 <.text+0x54d1a97>
1454d2a36:     	movq	(%rbp), %rcx
1454d2a3a:     	movw	$0x3, %dx
1454d2a3e:     	movzwl	0x36(%rax), %r9d
1454d2a43:     	movl	%r9d, %r10d
1454d2a46:     	addl	%r10d, %r10d
1454d2a49:     	movq	$-0x1, %r8
1454d2a50:     	testq	%r10, %r10
1454d2a53:     	je	0x1454d2a80 <.text+0x54d1a80>
1454d2a55:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2a5b:     	seta	%r11b
1454d2a5f:     	sbbb	$0x0, %r11b
1454d2a63:     	incq	%r8
1454d2a66:     	addq	$-0x2, %r10
1454d2a6a:     	cmpb	$0x1, %r11b
1454d2a6e:     	je	0x1454d2a50 <.text+0x54d1a50>
1454d2a70:     	movzbl	%r11b, %r9d
1454d2a74:     	testl	%r9d, %r9d
1454d2a77:     	je	0x1454d2a90 <.text+0x54d1a90>
1454d2a79:     	jmp	0x1454d2a83 <.text+0x54d1a83>
1454d2a7b:     	nopl	(%rax,%rax)
1454d2a80:     	movq	%r9, %r8
1454d2a83:     	subq	$0x1, %rcx
1454d2a87:     	jb	0x1454d2a99 <.text+0x54d1a99>
1454d2a89:     	movq	0x50(%rax,%r8,8), %rax
1454d2a8e:     	jmp	0x1454d2a3e <.text+0x54d1a3e>
1454d2a90:     	movl	%ebx, 0x8(%rax,%r8,4)
1454d2a95:     	jmp	0x1454d2ac6 <.text+0x54d1ac6>
1454d2a97:     	xorl	%eax, %eax
1454d2a99:     	movq	%r15, 0x10(%rbp)
1454d2a9d:     	movq	%rax, 0x18(%rbp)
1454d2aa1:     	movq	$0x0, 0x20(%rbp)
1454d2aa9:     	movq	%r8, 0x28(%rbp)
1454d2aad:     	movq	$0x3, 0x30(%rbp)
1454d2ab5:     	leaq	-0x30(%rbp), %rcx
1454d2ab9:     	leaq	0x10(%rbp), %rdx
1454d2abd:     	movl	%ebx, %r8d
1454d2ac0:     	callq	0x145427a50 <.text+0x5426a50>
1454d2ac5:     	nop
1454d2ac6:     	movq	-0x8(%rbp), %rax
1454d2aca:     	testq	%rax, %rax
1454d2acd:     	je	0x1454d2b39 <.text+0x54d1b39>
1454d2acf:     	movq	(%rbp), %rcx
1454d2ad3:     	movw	$0x4, %dx
1454d2ad7:     	movzwl	0x36(%rax), %r8d
1454d2adc:     	movl	%r8d, %r10d
1454d2adf:     	addl	%r10d, %r10d
1454d2ae2:     	movq	$-0x1, %r9
1454d2ae9:     	nopl	(%rax)
1454d2af0:     	testq	%r10, %r10
1454d2af3:     	je	0x1454d2b20 <.text+0x54d1b20>
1454d2af5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d2afb:     	seta	%r11b
1454d2aff:     	sbbb	$0x0, %r11b
1454d2b03:     	incq	%r9
1454d2b06:     	addq	$-0x2, %r10
1454d2b0a:     	cmpb	$0x1, %r11b
1454d2b0e:     	je	0x1454d2af0 <.text+0x54d1af0>
1454d2b10:     	movzbl	%r11b, %r8d
1454d2b14:     	testl	%r8d, %r8d
1454d2b17:     	je	0x1454d2b30 <.text+0x54d1b30>
1454d2b19:     	jmp	0x1454d2b23 <.text+0x54d1b23>
1454d2b1b:     	nopl	(%rax,%rax)
1454d2b20:     	movq	%r8, %r9
1454d2b23:     	subq	$0x1, %rcx
1454d2b27:     	jb	0x1454d2b3b <.text+0x54d1b3b>
1454d2b29:     	movq	0x50(%rax,%r9,8), %rax
1454d2b2e:     	jmp	0x1454d2ad7 <.text+0x54d1ad7>
1454d2b30:     	movd	%xmm6, 0x8(%rax,%r9,4)
1454d2b37:     	jmp	0x1454d2b6a <.text+0x54d1b6a>
1454d2b39:     	xorl	%eax, %eax
1454d2b3b:     	movd	%xmm6, %r8d
1454d2b40:     	movq	%r15, 0x10(%rbp)
1454d2b44:     	movq	%rax, 0x18(%rbp)
1454d2b48:     	movq	$0x0, 0x20(%rbp)
1454d2b50:     	movq	%r9, 0x28(%rbp)
1454d2b54:     	movq	$0x4, 0x30(%rbp)
1454d2b5c:     	leaq	-0x30(%rbp), %rcx
1454d2b60:     	leaq	0x10(%rbp), %rdx
1454d2b64:     	callq	0x145427a50 <.text+0x5426a50>
1454d2b69:     	nop
1454d2b6a:     	movq	-0x8(%rbp), %rax
1454d2b6e:     	testq	%rax, %rax
1454d2b71:     	je	0x1454d2bd7 <.text+0x54d1bd7>
1454d2b73:     	movq	(%rbp), %rcx
1454d2b77:     	movw	$0x8, %dx
1454d2b7b:     	movzwl	0x36(%rax), %r9d
1454d2b80:     	movl	%r9d, %r10d
1454d2b83:     	addl	%r10d, %r10d
1454d2b86:     	movq	$-0x1, %r8
1454d2b8d:     	nopl	(%rax)
1454d2b90:     	testq	%r10, %r10
1454d2b93:     	je	0x1454d2bc0 <.text+0x54d1bc0>
1454d2b95:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2b9b:     	seta	%r11b
1454d2b9f:     	sbbb	$0x0, %r11b
1454d2ba3:     	incq	%r8
1454d2ba6:     	addq	$-0x2, %r10
1454d2baa:     	cmpb	$0x1, %r11b
1454d2bae:     	je	0x1454d2b90 <.text+0x54d1b90>
1454d2bb0:     	movzbl	%r11b, %r9d
1454d2bb4:     	testl	%r9d, %r9d
1454d2bb7:     	je	0x1454d2bd0 <.text+0x54d1bd0>
1454d2bb9:     	jmp	0x1454d2bc3 <.text+0x54d1bc3>
1454d2bbb:     	nopl	(%rax,%rax)
1454d2bc0:     	movq	%r9, %r8
1454d2bc3:     	subq	$0x1, %rcx
1454d2bc7:     	jb	0x1454d2bd9 <.text+0x54d1bd9>
1454d2bc9:     	movq	0x50(%rax,%r8,8), %rax
1454d2bce:     	jmp	0x1454d2b7b <.text+0x54d1b7b>
1454d2bd0:     	movl	%r13d, 0x8(%rax,%r8,4)
1454d2bd5:     	jmp	0x1454d2c06 <.text+0x54d1c06>
1454d2bd7:     	xorl	%eax, %eax
1454d2bd9:     	movq	%r15, 0x10(%rbp)
1454d2bdd:     	movq	%rax, 0x18(%rbp)
1454d2be1:     	movq	$0x0, 0x20(%rbp)
1454d2be9:     	movq	%r8, 0x28(%rbp)
1454d2bed:     	movq	$0x8, 0x30(%rbp)
1454d2bf5:     	leaq	-0x30(%rbp), %rcx
1454d2bf9:     	leaq	0x10(%rbp), %rdx
1454d2bfd:     	movl	%r13d, %r8d
1454d2c00:     	callq	0x145427a50 <.text+0x5426a50>
1454d2c05:     	nop
1454d2c06:     	movq	-0x8(%rbp), %rax
1454d2c0a:     	testq	%rax, %rax
1454d2c0d:     	je	0x1454d2c77 <.text+0x54d1c77>
1454d2c0f:     	movq	(%rbp), %rcx
1454d2c13:     	movw	$0x9, %dx
1454d2c17:     	movzwl	0x36(%rax), %r9d
1454d2c1c:     	movl	%r9d, %r10d
1454d2c1f:     	addl	%r10d, %r10d
1454d2c22:     	movq	$-0x1, %r8
1454d2c29:     	nopl	(%rax)
1454d2c30:     	testq	%r10, %r10
1454d2c33:     	je	0x1454d2c60 <.text+0x54d1c60>
1454d2c35:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2c3b:     	seta	%r11b
1454d2c3f:     	sbbb	$0x0, %r11b
1454d2c43:     	incq	%r8
1454d2c46:     	addq	$-0x2, %r10
1454d2c4a:     	cmpb	$0x1, %r11b
1454d2c4e:     	je	0x1454d2c30 <.text+0x54d1c30>
1454d2c50:     	movzbl	%r11b, %r9d
1454d2c54:     	testl	%r9d, %r9d
1454d2c57:     	je	0x1454d2c70 <.text+0x54d1c70>
1454d2c59:     	jmp	0x1454d2c63 <.text+0x54d1c63>
1454d2c5b:     	nopl	(%rax,%rax)
1454d2c60:     	movq	%r9, %r8
1454d2c63:     	subq	$0x1, %rcx
1454d2c67:     	jb	0x1454d2c79 <.text+0x54d1c79>
1454d2c69:     	movq	0x50(%rax,%r8,8), %rax
1454d2c6e:     	jmp	0x1454d2c17 <.text+0x54d1c17>
1454d2c70:     	movl	%r12d, 0x8(%rax,%r8,4)
1454d2c75:     	jmp	0x1454d2ca6 <.text+0x54d1ca6>
1454d2c77:     	xorl	%eax, %eax
1454d2c79:     	movq	%r15, 0x10(%rbp)
1454d2c7d:     	movq	%rax, 0x18(%rbp)
1454d2c81:     	movq	$0x0, 0x20(%rbp)
1454d2c89:     	movq	%r8, 0x28(%rbp)
1454d2c8d:     	movq	$0x9, 0x30(%rbp)
1454d2c95:     	leaq	-0x30(%rbp), %rcx
1454d2c99:     	leaq	0x10(%rbp), %rdx
1454d2c9d:     	movl	%r12d, %r8d
1454d2ca0:     	callq	0x145427a50 <.text+0x5426a50>
1454d2ca5:     	nop
1454d2ca6:     	xorps	%xmm0, %xmm0
1454d2ca9:     	addss	%xmm0, %xmm7
1454d2cad:     	movss	0x4187d3(%rip), %xmm6   # 0x1458eb488
1454d2cb5:     	mulss	%xmm7, %xmm6
1454d2cb9:     	movaps	%xmm6, %xmm0
1454d2cbc:     	callq	0x145756e2b <.text+0x5755e2b>
1454d2cc1:     	movq	-0x8(%rbp), %rax
1454d2cc5:     	testq	%rax, %rax
1454d2cc8:     	je	0x1454d2d39 <.text+0x54d1d39>
1454d2cca:     	movq	(%rbp), %rcx
1454d2cce:     	movw	$0xc, %dx
1454d2cd2:     	movzwl	0x36(%rax), %r8d
1454d2cd7:     	movl	%r8d, %r10d
1454d2cda:     	addl	%r10d, %r10d
1454d2cdd:     	movq	$-0x1, %r9
1454d2ce4:     	nopw	%cs:(%rax,%rax)
1454d2cf0:     	testq	%r10, %r10
1454d2cf3:     	je	0x1454d2d20 <.text+0x54d1d20>
1454d2cf5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d2cfb:     	seta	%r11b
1454d2cff:     	sbbb	$0x0, %r11b
1454d2d03:     	incq	%r9
1454d2d06:     	addq	$-0x2, %r10
1454d2d0a:     	cmpb	$0x1, %r11b
1454d2d0e:     	je	0x1454d2cf0 <.text+0x54d1cf0>
1454d2d10:     	movzbl	%r11b, %r8d
1454d2d14:     	testl	%r8d, %r8d
1454d2d17:     	je	0x1454d2d30 <.text+0x54d1d30>
1454d2d19:     	jmp	0x1454d2d23 <.text+0x54d1d23>
1454d2d1b:     	nopl	(%rax,%rax)
1454d2d20:     	movq	%r8, %r9
1454d2d23:     	subq	$0x1, %rcx
1454d2d27:     	jb	0x1454d2d3b <.text+0x54d1d3b>
1454d2d29:     	movq	0x50(%rax,%r9,8), %rax
1454d2d2e:     	jmp	0x1454d2cd2 <.text+0x54d1cd2>
1454d2d30:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454d2d37:     	jmp	0x1454d2d6a <.text+0x54d1d6a>
1454d2d39:     	xorl	%eax, %eax
1454d2d3b:     	movd	%xmm0, %r8d
1454d2d40:     	movq	%r15, 0x10(%rbp)
1454d2d44:     	movq	%rax, 0x18(%rbp)
1454d2d48:     	movq	$0x0, 0x20(%rbp)
1454d2d50:     	movq	%r9, 0x28(%rbp)
1454d2d54:     	movq	$0xc, 0x30(%rbp)
1454d2d5c:     	leaq	-0x30(%rbp), %rcx
1454d2d60:     	leaq	0x10(%rbp), %rdx
1454d2d64:     	callq	0x145427a50 <.text+0x5426a50>
1454d2d69:     	nop
1454d2d6a:     	movaps	%xmm6, %xmm0
1454d2d6d:     	callq	0x145756e31 <.text+0x5755e31>
1454d2d72:     	movq	-0x8(%rbp), %rax
1454d2d76:     	testq	%rax, %rax
1454d2d79:     	je	0x1454d2de9 <.text+0x54d1de9>
1454d2d7b:     	movq	(%rbp), %rcx
1454d2d7f:     	movw	$0xd, %dx
1454d2d83:     	movzwl	0x36(%rax), %r8d
1454d2d88:     	movl	%r8d, %r10d
1454d2d8b:     	addl	%r10d, %r10d
1454d2d8e:     	movq	$-0x1, %r9
1454d2d95:     	nopw	%cs:(%rax,%rax)
1454d2da0:     	testq	%r10, %r10
1454d2da3:     	je	0x1454d2dd0 <.text+0x54d1dd0>
1454d2da5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d2dab:     	seta	%r11b
1454d2daf:     	sbbb	$0x0, %r11b
1454d2db3:     	incq	%r9
1454d2db6:     	addq	$-0x2, %r10
1454d2dba:     	cmpb	$0x1, %r11b
1454d2dbe:     	je	0x1454d2da0 <.text+0x54d1da0>
1454d2dc0:     	movzbl	%r11b, %r8d
1454d2dc4:     	testl	%r8d, %r8d
1454d2dc7:     	je	0x1454d2de0 <.text+0x54d1de0>
1454d2dc9:     	jmp	0x1454d2dd3 <.text+0x54d1dd3>
1454d2dcb:     	nopl	(%rax,%rax)
1454d2dd0:     	movq	%r8, %r9
1454d2dd3:     	subq	$0x1, %rcx
1454d2dd7:     	jb	0x1454d2deb <.text+0x54d1deb>
1454d2dd9:     	movq	0x50(%rax,%r9,8), %rax
1454d2dde:     	jmp	0x1454d2d83 <.text+0x54d1d83>
1454d2de0:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454d2de7:     	jmp	0x1454d2e1a <.text+0x54d1e1a>
1454d2de9:     	xorl	%eax, %eax
1454d2deb:     	movd	%xmm0, %r8d
1454d2df0:     	movq	%r15, 0x10(%rbp)
1454d2df4:     	movq	%rax, 0x18(%rbp)
1454d2df8:     	movq	$0x0, 0x20(%rbp)
1454d2e00:     	movq	%r9, 0x28(%rbp)
1454d2e04:     	movq	$0xd, 0x30(%rbp)
1454d2e0c:     	leaq	-0x30(%rbp), %rcx
1454d2e10:     	leaq	0x10(%rbp), %rdx
1454d2e14:     	callq	0x145427a50 <.text+0x5426a50>
1454d2e19:     	nop
1454d2e1a:     	movq	-0x8(%rbp), %rax
1454d2e1e:     	testq	%rax, %rax
1454d2e21:     	je	0x1454d2e8b <.text+0x54d1e8b>
1454d2e23:     	movq	(%rbp), %rcx
1454d2e27:     	movw	$0xe, %dx
1454d2e2b:     	movzwl	0x36(%rax), %r9d
1454d2e30:     	movl	%r9d, %r10d
1454d2e33:     	addl	%r10d, %r10d
1454d2e36:     	movq	$-0x1, %r8
1454d2e3d:     	nopl	(%rax)
1454d2e40:     	testq	%r10, %r10
1454d2e43:     	je	0x1454d2e70 <.text+0x54d1e70>
1454d2e45:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d2e4b:     	seta	%r11b
1454d2e4f:     	sbbb	$0x0, %r11b
1454d2e53:     	incq	%r8
1454d2e56:     	addq	$-0x2, %r10
1454d2e5a:     	cmpb	$0x1, %r11b
1454d2e5e:     	je	0x1454d2e40 <.text+0x54d1e40>
1454d2e60:     	movzbl	%r11b, %r9d
1454d2e64:     	testl	%r9d, %r9d
1454d2e67:     	je	0x1454d2e80 <.text+0x54d1e80>
1454d2e69:     	jmp	0x1454d2e73 <.text+0x54d1e73>
1454d2e6b:     	nopl	(%rax,%rax)
1454d2e70:     	movq	%r9, %r8
1454d2e73:     	subq	$0x1, %rcx
1454d2e77:     	jb	0x1454d2e8d <.text+0x54d1e8d>
1454d2e79:     	movq	0x50(%rax,%r8,8), %rax
1454d2e7e:     	jmp	0x1454d2e2b <.text+0x54d1e2b>
1454d2e80:     	movl	$0x1, 0x8(%rax,%r8,4)
1454d2e89:     	jmp	0x1454d2ebd <.text+0x54d1ebd>
1454d2e8b:     	xorl	%eax, %eax
1454d2e8d:     	movq	%r15, 0x10(%rbp)
1454d2e91:     	movq	%rax, 0x18(%rbp)
1454d2e95:     	movq	$0x0, 0x20(%rbp)
1454d2e9d:     	movq	%r8, 0x28(%rbp)
1454d2ea1:     	movq	$0xe, 0x30(%rbp)
1454d2ea9:     	leaq	-0x30(%rbp), %rcx
1454d2ead:     	leaq	0x10(%rbp), %rdx
1454d2eb1:     	movl	$0x1, %r8d
1454d2eb7:     	callq	0x145427a50 <.text+0x5426a50>
1454d2ebc:     	nop
1454d2ebd:     	movd	(%rdi), %xmm0
1454d2ec1:     	movq	-0x8(%rbp), %rax
1454d2ec5:     	testq	%rax, %rax
1454d2ec8:     	je	0x1454d2f39 <.text+0x54d1f39>
1454d2eca:     	movq	(%rbp), %rcx
1454d2ece:     	movw	$0xf, %dx
1454d2ed2:     	movzwl	0x36(%rax), %r8d
1454d2ed7:     	movl	%r8d, %r10d
1454d2eda:     	addl	%r10d, %r10d
1454d2edd:     	movq	$-0x1, %r9
1454d2ee4:     	nopw	%cs:(%rax,%rax)
1454d2ef0:     	testq	%r10, %r10
1454d2ef3:     	je	0x1454d2f20 <.text+0x54d1f20>
1454d2ef5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d2efb:     	seta	%r11b
1454d2eff:     	sbbb	$0x0, %r11b
1454d2f03:     	incq	%r9
1454d2f06:     	addq	$-0x2, %r10
1454d2f0a:     	cmpb	$0x1, %r11b
1454d2f0e:     	je	0x1454d2ef0 <.text+0x54d1ef0>
1454d2f10:     	movzbl	%r11b, %r8d
1454d2f14:     	testl	%r8d, %r8d
1454d2f17:     	je	0x1454d2f30 <.text+0x54d1f30>
1454d2f19:     	jmp	0x1454d2f23 <.text+0x54d1f23>
1454d2f1b:     	nopl	(%rax,%rax)
1454d2f20:     	movq	%r8, %r9
1454d2f23:     	subq	$0x1, %rcx
1454d2f27:     	jb	0x1454d2f3b <.text+0x54d1f3b>
1454d2f29:     	movq	0x50(%rax,%r9,8), %rax
1454d2f2e:     	jmp	0x1454d2ed2 <.text+0x54d1ed2>
1454d2f30:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454d2f37:     	jmp	0x1454d2f6a <.text+0x54d1f6a>
1454d2f39:     	xorl	%eax, %eax
1454d2f3b:     	movd	%xmm0, %r8d
1454d2f40:     	movq	%r15, 0x10(%rbp)
1454d2f44:     	movq	%rax, 0x18(%rbp)
1454d2f48:     	movq	$0x0, 0x20(%rbp)
1454d2f50:     	movq	%r9, 0x28(%rbp)
1454d2f54:     	movq	$0xf, 0x30(%rbp)
1454d2f5c:     	leaq	-0x30(%rbp), %rcx
1454d2f60:     	leaq	0x10(%rbp), %rdx
1454d2f64:     	callq	0x145427a50 <.text+0x5426a50>
1454d2f69:     	nop
1454d2f6a:     	movd	0x4(%rdi), %xmm0
1454d2f6f:     	movq	-0x8(%rbp), %rax
1454d2f73:     	testq	%rax, %rax
1454d2f76:     	je	0x1454d2fe9 <.text+0x54d1fe9>
1454d2f78:     	movq	(%rbp), %rcx
1454d2f7c:     	movw	$0x10, %dx
1454d2f80:     	movzwl	0x36(%rax), %r8d
1454d2f85:     	movl	%r8d, %r10d
1454d2f88:     	addl	%r10d, %r10d
1454d2f8b:     	movq	$-0x1, %r9
1454d2f92:     	nopw	%cs:(%rax,%rax)
1454d2fa0:     	testq	%r10, %r10
1454d2fa3:     	je	0x1454d2fd0 <.text+0x54d1fd0>
1454d2fa5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d2fab:     	seta	%r11b
1454d2faf:     	sbbb	$0x0, %r11b
1454d2fb3:     	incq	%r9
1454d2fb6:     	addq	$-0x2, %r10
1454d2fba:     	cmpb	$0x1, %r11b
1454d2fbe:     	je	0x1454d2fa0 <.text+0x54d1fa0>
1454d2fc0:     	movzbl	%r11b, %r8d
1454d2fc4:     	testl	%r8d, %r8d
1454d2fc7:     	je	0x1454d2fe0 <.text+0x54d1fe0>
1454d2fc9:     	jmp	0x1454d2fd3 <.text+0x54d1fd3>
1454d2fcb:     	nopl	(%rax,%rax)
1454d2fd0:     	movq	%r8, %r9
1454d2fd3:     	subq	$0x1, %rcx
1454d2fd7:     	jb	0x1454d2feb <.text+0x54d1feb>
1454d2fd9:     	movq	0x50(%rax,%r9,8), %rax
1454d2fde:     	jmp	0x1454d2f80 <.text+0x54d1f80>
1454d2fe0:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454d2fe7:     	jmp	0x1454d301a <.text+0x54d201a>
1454d2fe9:     	xorl	%eax, %eax
1454d2feb:     	movd	%xmm0, %r8d
1454d2ff0:     	movq	%r15, 0x10(%rbp)
1454d2ff4:     	movq	%rax, 0x18(%rbp)
1454d2ff8:     	movq	$0x0, 0x20(%rbp)
1454d3000:     	movq	%r9, 0x28(%rbp)
1454d3004:     	movq	$0x10, 0x30(%rbp)
1454d300c:     	leaq	-0x30(%rbp), %rcx
1454d3010:     	leaq	0x10(%rbp), %rdx
1454d3014:     	callq	0x145427a50 <.text+0x5426a50>
1454d3019:     	nop
1454d301a:     	movd	0x8(%rdi), %xmm0
1454d301f:     	movq	-0x8(%rbp), %rax
1454d3023:     	testq	%rax, %rax
1454d3026:     	je	0x1454d3099 <.text+0x54d2099>
1454d3028:     	movq	(%rbp), %rcx
1454d302c:     	movw	$0x11, %dx
1454d3030:     	movzwl	0x36(%rax), %r8d
1454d3035:     	movl	%r8d, %r10d
1454d3038:     	addl	%r10d, %r10d
1454d303b:     	movq	$-0x1, %r9
1454d3042:     	nopw	%cs:(%rax,%rax)
1454d3050:     	testq	%r10, %r10
1454d3053:     	je	0x1454d3080 <.text+0x54d2080>
1454d3055:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d305b:     	seta	%r11b
1454d305f:     	sbbb	$0x0, %r11b
1454d3063:     	incq	%r9
1454d3066:     	addq	$-0x2, %r10
1454d306a:     	cmpb	$0x1, %r11b
1454d306e:     	je	0x1454d3050 <.text+0x54d2050>
1454d3070:     	movzbl	%r11b, %r8d
1454d3074:     	testl	%r8d, %r8d
1454d3077:     	je	0x1454d3090 <.text+0x54d2090>
1454d3079:     	jmp	0x1454d3083 <.text+0x54d2083>
1454d307b:     	nopl	(%rax,%rax)
1454d3080:     	movq	%r8, %r9
1454d3083:     	subq	$0x1, %rcx
1454d3087:     	jb	0x1454d309b <.text+0x54d209b>
1454d3089:     	movq	0x50(%rax,%r9,8), %rax
1454d308e:     	jmp	0x1454d3030 <.text+0x54d2030>
1454d3090:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454d3097:     	jmp	0x1454d30ca <.text+0x54d20ca>
1454d3099:     	xorl	%eax, %eax
1454d309b:     	movd	%xmm0, %r8d
1454d30a0:     	movq	%r15, 0x10(%rbp)
1454d30a4:     	movq	%rax, 0x18(%rbp)
1454d30a8:     	movq	$0x0, 0x20(%rbp)
1454d30b0:     	movq	%r9, 0x28(%rbp)
1454d30b4:     	movq	$0x11, 0x30(%rbp)
1454d30bc:     	leaq	-0x30(%rbp), %rcx
1454d30c0:     	leaq	0x10(%rbp), %rdx
1454d30c4:     	callq	0x145427a50 <.text+0x5426a50>
1454d30c9:     	nop
1454d30ca:     	movq	-0x8(%rbp), %rax
1454d30ce:     	testq	%rax, %rax
1454d30d1:     	je	0x1454d3139 <.text+0x54d2139>
1454d30d3:     	movq	(%rbp), %rcx
1454d30d7:     	movw	$0x12, %dx
1454d30db:     	movzwl	0x36(%rax), %r8d
1454d30e0:     	movl	%r8d, %r10d
1454d30e3:     	addl	%r10d, %r10d
1454d30e6:     	movq	$-0x1, %r9
1454d30ed:     	nopl	(%rax)
1454d30f0:     	testq	%r10, %r10
1454d30f3:     	je	0x1454d3120 <.text+0x54d2120>
1454d30f5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454d30fb:     	seta	%r11b
1454d30ff:     	sbbb	$0x0, %r11b
1454d3103:     	incq	%r9
1454d3106:     	addq	$-0x2, %r10
1454d310a:     	cmpb	$0x1, %r11b
1454d310e:     	je	0x1454d30f0 <.text+0x54d20f0>
1454d3110:     	movzbl	%r11b, %r8d
1454d3114:     	testl	%r8d, %r8d
1454d3117:     	je	0x1454d3130 <.text+0x54d2130>
1454d3119:     	jmp	0x1454d3123 <.text+0x54d2123>
1454d311b:     	nopl	(%rax,%rax)
1454d3120:     	movq	%r8, %r9
1454d3123:     	subq	$0x1, %rcx
1454d3127:     	jb	0x1454d313b <.text+0x54d213b>
1454d3129:     	movq	0x50(%rax,%r9,8), %rax
1454d312e:     	jmp	0x1454d30db <.text+0x54d20db>
1454d3130:     	movss	%xmm7, 0x8(%rax,%r9,4)
1454d3137:     	jmp	0x1454d316a <.text+0x54d216a>
1454d3139:     	xorl	%eax, %eax
1454d313b:     	movd	%xmm7, %r8d
1454d3140:     	movq	%r15, 0x10(%rbp)
1454d3144:     	movq	%rax, 0x18(%rbp)
1454d3148:     	movq	$0x0, 0x20(%rbp)
1454d3150:     	movq	%r9, 0x28(%rbp)
1454d3154:     	movq	$0x12, 0x30(%rbp)
1454d315c:     	leaq	-0x30(%rbp), %rcx
1454d3160:     	leaq	0x10(%rbp), %rdx
1454d3164:     	callq	0x145427a50 <.text+0x5426a50>
1454d3169:     	nop
1454d316a:     	movq	-0x8(%rbp), %rax
1454d316e:     	testq	%rax, %rax
1454d3171:     	je	0x1454d31db <.text+0x54d21db>
1454d3173:     	movq	(%rbp), %rcx
1454d3177:     	movw	$0x14, %dx
1454d317b:     	movzwl	0x36(%rax), %r9d
1454d3180:     	movl	%r9d, %r10d
1454d3183:     	addl	%r10d, %r10d
1454d3186:     	movq	$-0x1, %r8
1454d318d:     	nopl	(%rax)
1454d3190:     	testq	%r10, %r10
1454d3193:     	je	0x1454d31c0 <.text+0x54d21c0>
1454d3195:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d319b:     	seta	%r11b
1454d319f:     	sbbb	$0x0, %r11b
1454d31a3:     	incq	%r8
1454d31a6:     	addq	$-0x2, %r10
1454d31aa:     	cmpb	$0x1, %r11b
1454d31ae:     	je	0x1454d3190 <.text+0x54d2190>
1454d31b0:     	movzbl	%r11b, %r9d
1454d31b4:     	testl	%r9d, %r9d
1454d31b7:     	je	0x1454d31d0 <.text+0x54d21d0>
1454d31b9:     	jmp	0x1454d31c3 <.text+0x54d21c3>
1454d31bb:     	nopl	(%rax,%rax)
1454d31c0:     	movq	%r9, %r8
1454d31c3:     	subq	$0x1, %rcx
1454d31c7:     	jb	0x1454d31dd <.text+0x54d21dd>
1454d31c9:     	movq	0x50(%rax,%r8,8), %rax
1454d31ce:     	jmp	0x1454d317b <.text+0x54d217b>
1454d31d0:     	movl	$0x23, 0x8(%rax,%r8,4)
1454d31d9:     	jmp	0x1454d320d <.text+0x54d220d>
1454d31db:     	xorl	%eax, %eax
1454d31dd:     	movq	%r15, 0x10(%rbp)
1454d31e1:     	movq	%rax, 0x18(%rbp)
1454d31e5:     	movq	$0x0, 0x20(%rbp)
1454d31ed:     	movq	%r8, 0x28(%rbp)
1454d31f1:     	movq	$0x14, 0x30(%rbp)
1454d31f9:     	leaq	-0x30(%rbp), %rcx
1454d31fd:     	leaq	0x10(%rbp), %rdx
1454d3201:     	movl	$0x23, %r8d
1454d3207:     	callq	0x145427a50 <.text+0x5426a50>
1454d320c:     	nop
1454d320d:     	movq	-0x8(%rbp), %rax
1454d3211:     	testq	%rax, %rax
1454d3214:     	je	0x1454d327a <.text+0x54d227a>
1454d3216:     	movq	(%rbp), %rcx
1454d321a:     	movw	$0x15, %dx
1454d321e:     	movzwl	0x36(%rax), %r9d
1454d3223:     	movl	%r9d, %r10d
1454d3226:     	addl	%r10d, %r10d
1454d3229:     	movq	$-0x1, %r8
1454d3230:     	testq	%r10, %r10
1454d3233:     	je	0x1454d3260 <.text+0x54d2260>
1454d3235:     	cmpw	0x3a(%rax,%r8,2), %dx
1454d323b:     	seta	%r11b
1454d323f:     	sbbb	$0x0, %r11b
1454d3243:     	incq	%r8
1454d3246:     	addq	$-0x2, %r10
1454d324a:     	cmpb	$0x1, %r11b
1454d324e:     	je	0x1454d3230 <.text+0x54d2230>
1454d3250:     	movzbl	%r11b, %r9d
1454d3254:     	testl	%r9d, %r9d
1454d3257:     	je	0x1454d3270 <.text+0x54d2270>
1454d3259:     	jmp	0x1454d3263 <.text+0x54d2263>
1454d325b:     	nopl	(%rax,%rax)
1454d3260:     	movq	%r9, %r8
1454d3263:     	subq	$0x1, %rcx
1454d3267:     	jb	0x1454d327c <.text+0x54d227c>
1454d3269:     	movq	0x50(%rax,%r8,8), %rax
1454d326e:     	jmp	0x1454d321e <.text+0x54d221e>
1454d3270:     	movl	-0xc(%rbp), %ecx
1454d3273:     	movl	%ecx, 0x8(%rax,%r8,4)
1454d3278:     	jmp	0x1454d32aa <.text+0x54d22aa>
1454d327a:     	xorl	%eax, %eax
1454d327c:     	movq	%r15, 0x10(%rbp)
1454d3280:     	movq	%rax, 0x18(%rbp)
1454d3284:     	movq	$0x0, 0x20(%rbp)
1454d328c:     	movq	%r8, 0x28(%rbp)
1454d3290:     	movq	$0x15, 0x30(%rbp)
1454d3298:     	leaq	-0x30(%rbp), %rcx
1454d329c:     	leaq	0x10(%rbp), %rdx
1454d32a0:     	movl	-0xc(%rbp), %r8d
1454d32a4:     	callq	0x145427a50 <.text+0x5426a50>
1454d32a9:     	nop
1454d32aa:     	movl	$0x0, -0x38(%rbp)
1454d32b1:     	movq	$0x0, -0x50(%rbp)
1454d32b9:     	movq	$0x1, -0x48(%rbp)
1454d32c1:     	movq	$0x0, -0x40(%rbp)
1454d32c9:     	movb	$0x1, 0x47(%rbp)
1454d32cd:     	movq	%r15, 0x28(%rsp)
1454d32d2:     	movss	%xmm7, 0x20(%rsp)
1454d32d8:     	leaq	-0x50(%rbp), %rcx
1454d32dc:     	movq	%r14, %rdx
1454d32df:     	movb	$0x5, %r8b
1454d32e2:     	movq	%rdi, %r9
1454d32e5:     	callq	0x1454ff870 <.text+0x54fe870>
1454d32ea:     	nop
1454d32eb:     	movdqu	-0x50(%rbp), %xmm0
1454d32f0:     	movups	-0x40(%rbp), %xmm1
1454d32f4:     	movaps	%xmm1, 0x20(%rbp)
1454d32f8:     	movdqa	%xmm0, 0x10(%rbp)
1454d32fd:     	movb	$0x0, 0x47(%rbp)
1454d3301:     	leaq	-0x30(%rbp), %rcx
1454d3305:     	leaq	0x10(%rbp), %rdx
1454d3309:     	callq	0x1454ffad0 <.text+0x54fead0>
1454d330e:     	nop
1454d330f:     	movq	0x548(%rsi), %rdi
1454d3316:     	cmpq	0x538(%rsi), %rdi
1454d331d:     	jne	0x1454d332c <.text+0x54d232c>
1454d331f:     	leaq	0x538(%rsi), %rcx
1454d3326:     	callq	0x1457580b0 <.text+0x57570b0>
1454d332b:     	nop
1454d332c:     	movq	0x540(%rsi), %rax
1454d3333:     	movq	%rdi, %rcx
1454d3336:     	shlq	$0x5, %rcx
1454d333a:     	movups	-0x30(%rbp), %xmm0
1454d333e:     	movups	-0x20(%rbp), %xmm1
1454d3342:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d3347:     	movups	%xmm0, (%rax,%rcx)
1454d334b:     	incq	%rdi
1454d334e:     	movq	%rdi, 0x548(%rsi)
1454d3355:     	leaq	-0x8(%rbp), %rcx
1454d3359:     	callq	0x1455127d0 <.text+0x55117d0>
1454d335e:     	movq	%r14, %rax
1454d3361:     	movaps	0x50(%rbp), %xmm6
1454d3365:     	movaps	0x60(%rbp), %xmm7
1454d3369:     	addq	$0xf8, %rsp
1454d3370:     	popq	%rbx
1454d3371:     	popq	%rdi
1454d3372:     	popq	%rsi
1454d3373:     	popq	%r12
1454d3375:     	popq	%r13
1454d3377:     	popq	%r14
1454d3379:     	popq	%r15
1454d337b:     	popq	%rbp
1454d337c:     	retq
