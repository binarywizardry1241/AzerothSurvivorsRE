
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145515b10:     	pushq	%rbp
145515b11:     	pushq	%r15
145515b13:     	pushq	%r14
145515b15:     	pushq	%r13
145515b17:     	pushq	%r12
145515b19:     	pushq	%rsi
145515b1a:     	pushq	%rdi
145515b1b:     	pushq	%rbx
145515b1c:     	subq	$0x188, %rsp            # imm = 0x188
145515b23:     	leaq	0x80(%rsp), %rbp
145515b2b:     	movaps	%xmm7, 0xf0(%rbp)
145515b32:     	movaps	%xmm6, 0xe0(%rbp)
145515b39:     	movq	$-0x2, 0xd8(%rbp)
145515b44:     	movq	(%rdx), %rax
145515b47:     	movq	%rax, 0xb8(%rbp)
145515b4e:     	movq	0x8(%rdx), %rdi
145515b52:     	movq	(%rcx), %r13
145515b55:     	movq	0x8(%rcx), %rax
145515b59:     	cmpq	%rax, %r13
145515b5c:     	je	0x145515fc5 <.text+0x5514fc5>
145515b62:     	movq	0x18(%rcx), %r8
145515b66:     	movq	%r8, 0xc8(%rbp)
145515b6d:     	movq	0x20(%rcx), %rsi
145515b71:     	movq	0x28(%rcx), %r8
145515b75:     	movq	%r8, 0xb0(%rbp)
145515b7c:     	movq	0x30(%rcx), %r8
145515b80:     	movq	%r8, 0xa0(%rbp)
145515b87:     	movq	0x10(%rdx), %rdx
145515b8b:     	movq	%rdx, -0x38(%rbp)
145515b8f:     	movq	0x10(%rcx), %r15
145515b93:     	subq	%r13, %rax
145515b96:     	shrq	$0x3, %rax
145515b9a:     	movabsq	$-0x3333333333333333, %rcx # imm = 0xCCCCCCCCCCCCCCCD
145515ba4:     	imulq	%rax, %rcx
145515ba8:     	movq	%rcx, -0x30(%rbp)
145515bac:     	xorl	%ebx, %ebx
145515bae:     	xorps	%xmm6, %xmm6
145515bb1:     	movaps	0x3d55e8(%rip), %xmm7   # 0x1458eb1a0
145515bb8:     	movq	%r13, -0x28(%rbp)
145515bbc:     	jmp	0x145515be9 <.text+0x5514be9>
145515bbe:     	nop
145515bc0:     	leaq	(%rdi,%rdi,2), %rax
145515bc4:     	movq	0x30(%rbp), %rcx
145515bc8:     	movq	-0x38(%rbp), %rdx
145515bcc:     	movq	%rcx, 0x10(%rdx,%rax,8)
145515bd1:     	movups	0x20(%rbp), %xmm0
145515bd5:     	movups	%xmm0, (%rdx,%rax,8)
145515bd9:     	incq	%rdi
145515bdc:     	incq	%rbx
145515bdf:     	cmpq	-0x30(%rbp), %rbx
145515be3:     	je	0x145515fc5 <.text+0x5514fc5>
145515be9:     	leaq	(%rbx,%rbx,4), %rax
145515bed:     	leaq	(,%rax,8), %r8
145515bf5:     	addq	%r13, %r8
145515bf8:     	cmpl	$0x1, (%r13,%rax,8)
145515bfe:     	movq	%rdi, 0x98(%rbp)
145515c05:     	movq	%r8, -0x48(%rbp)
145515c09:     	jne	0x145515ca0 <.text+0x5514ca0>
145515c0f:     	movq	0xc8(%rbp), %rax
145515c16:     	movq	0x4d0(%rax), %rdx
145515c1d:     	testq	%rdx, %rdx
145515c20:     	je	0x145515ca0 <.text+0x5514ca0>
145515c22:     	movq	0x8(%r8), %rax
145515c26:     	movq	0xc8(%rbp), %rcx
145515c2d:     	movq	0x4c8(%rcx), %rcx
145515c34:     	imulq	$0x160, %rdx, %rdx      # imm = 0x160
145515c3b:     	jmp	0x145515c50 <.text+0x5514c50>
145515c3d:     	nopl	(%rax)
145515c40:     	addq	$0x160, %rcx            # imm = 0x160
145515c47:     	addq	$-0x160, %rdx           # imm = 0xFEA0
145515c4e:     	je	0x145515ca0 <.text+0x5514ca0>
145515c50:     	cmpq	%rax, 0x88(%rcx)
145515c57:     	jne	0x145515c40 <.text+0x5514c40>
145515c59:     	cmpl	$0x1, 0x68(%rcx)
145515c5d:     	je	0x145515c40 <.text+0x5514c40>
145515c5f:     	cmpq	$-0x1, 0x40(%rcx)
145515c64:     	je	0x145515f5c <.text+0x5514f5c>
145515c6a:     	movzbl	0x60(%rcx), %r8d
145515c6f:     	movl	$0x6, %edx
145515c74:     	subq	%r8, %rdx
145515c77:     	testq	%r8, %r8
145515c7a:     	leaq	0x17d3884(%rip), %r8    # 0x146ce9505
145515c81:     	leaq	0x17d3883(%rip), %r9    # 0x146ce950b
145515c88:     	cmovneq	%r9, %r8
145515c8c:     	jmp	0x145515f68 <.text+0x5514f68>
145515c91:     	nopw	%cs:(%rax,%rax)
145515ca0:     	movss	0x24(%r8), %xmm0
145515ca6:     	movq	0xc8(%rbp), %rax
145515cad:     	subss	0x8e4(%rax), %xmm0
145515cb5:     	maxss	%xmm6, %xmm0
145515cb9:     	leaq	0x17d3840(%rip), %rax   # 0x146ce9500
145515cc0:     	movq	%rax, -0x8(%rbp)
145515cc4:     	movq	$0x5, (%rbp)
145515ccc:     	movl	$0x0, 0xd4(%rbp)
145515cd6:     	movss	%xmm0, 0xd0(%rbp)
145515cde:     	movq	0x10(%r8), %rcx
145515ce2:     	cmpq	0xb0(%rbp), %rcx
145515ce9:     	jae	0x145515ff1 <.text+0x5514ff1>
145515cef:     	leaq	(%rcx,%rcx,4), %r14
145515cf3:     	shlq	$0x4, %r14
145515cf7:     	leaq	(%rsi,%r14), %rax
145515cfb:     	addq	$0x20, %rax
145515cff:     	movq	%rax, 0x8(%rbp)
145515d03:     	leaq	0x208336(%rip), %rax    # 0x14571e040 <.text+0x571d040>
145515d0a:     	movq	%rax, 0x10(%rbp)
145515d0e:     	leaq	0x38(%rbp), %rcx
145515d12:     	leaq	0x11f8c4d(%rip), %rdx   # 0x14670e966
145515d19:     	leaq	0x8(%rbp), %r8
145515d1d:     	callq	0x14570bf80 <.text+0x570af80>
145515d22:     	nop
145515d23:     	movq	%rbx, -0x40(%rbp)
145515d27:     	movq	%r15, %rbx
145515d2a:     	movq	%rsi, %r15
145515d2d:     	addq	%rsi, %r14
145515d30:     	movq	0x40(%rbp), %rcx
145515d34:     	movq	0x48(%rbp), %rdx
145515d38:     	movq	0x10(%r14), %rdi
145515d3c:     	movq	0x18(%r14), %r14
145515d40:     	movq	%rcx, 0xa8(%rbp)
145515d47:     	callq	0x145452400 <.text+0x5451400>
145515d4c:     	nop
145515d4d:     	movq	%rax, %r13
145515d50:     	movq	%rdx, %r12
145515d53:     	movq	0x38(%rbp), %rdx
145515d57:     	testq	%rdx, %rdx
145515d5a:     	je	0x145515d6e <.text+0x5514d6e>
145515d5c:     	movl	$0x1, %r8d
145515d62:     	movq	0xa8(%rbp), %rcx
145515d69:     	callq	0x1400021d0 <.text+0x11d0>
145515d6e:     	testq	%r13, %r13
145515d71:     	cmoveq	%r14, %r12
145515d75:     	cmovneq	%r13, %rdi
145515d79:     	movq	%r15, %rsi
145515d7c:     	movq	%rbx, %r15
145515d7f:     	movq	-0x40(%rbp), %rbx
145515d83:     	incq	%r15
145515d86:     	movq	%r15, -0x50(%rbp)
145515d8a:     	movq	$0x0, 0x38(%rbp)
145515d92:     	movq	$0x1, 0x40(%rbp)
145515d9a:     	movq	$0x0, 0x48(%rbp)
145515da2:     	testq	%r12, %r12
145515da5:     	leaq	0x38(%rbp), %r14
145515da9:     	jne	0x145515f91 <.text+0x5514f91>
145515daf:     	addq	%rdi, %r12
145515db2:     	movq	%rdi, %rcx
145515db5:     	movq	%r12, %rdx
145515db8:     	movq	%r14, %r8
145515dbb:     	callq	0x14551d550 <.text+0x551c550>
145515dc0:     	nop
145515dc1:     	movq	%rsi, %r13
145515dc4:     	movq	0x48(%rbp), %rax
145515dc8:     	movq	%rax, -0x10(%rbp)
145515dcc:     	movups	0x38(%rbp), %xmm0
145515dd0:     	movaps	%xmm0, -0x20(%rbp)
145515dd4:     	movq	-0x48(%rbp), %rcx
145515dd8:     	movl	0x20(%rcx), %eax
145515ddb:     	movl	%eax, 0x28(%rbp)
145515dde:     	movq	0x18(%rcx), %rax
145515de2:     	movq	%rax, 0x20(%rbp)
145515de6:     	movq	0xa0(%rbp), %rax
145515ded:     	cmpl	$0x1, (%rax)
145515df0:     	movaps	%xmm7, %xmm0
145515df3:     	jne	0x145515e1c <.text+0x5514e1c>
145515df5:     	movq	0xa0(%rbp), %rax
145515dfc:     	movups	0x4(%rax), %xmm1
145515e00:     	movaps	%xmm1, %xmm0
145515e03:     	shufps	$0xe2, %xmm1, %xmm0     # xmm0 = xmm0[2,0],xmm1[2,3]
145515e07:     	shufps	$0xe7, %xmm1, %xmm1     # xmm1 = xmm1[3,1,2,3]
145515e0b:     	movaps	%xmm0, %xmm2
145515e0e:     	subps	%xmm1, %xmm2
145515e11:     	movsd	0x20(%rbp), %xmm1
145515e16:     	subps	%xmm1, %xmm0
145515e19:     	divps	%xmm2, %xmm0
145515e1c:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145515e20:     	movss	%xmm1, 0xc4(%rbp)
145515e28:     	movss	%xmm0, 0xc0(%rbp)
145515e30:     	leaq	0x20(%rbp), %r12
145515e34:     	movq	%r12, 0x38(%rbp)
145515e38:     	leaq	0x2074a1(%rip), %rsi    # 0x14571d2e0 <.text+0x571c2e0>
145515e3f:     	movq	%rsi, 0x40(%rbp)
145515e43:     	leaq	0x24(%rbp), %rax
145515e47:     	movq	%rax, 0x48(%rbp)
145515e4b:     	movq	%rsi, 0x50(%rbp)
145515e4f:     	leaq	0x28(%rbp), %rax
145515e53:     	movq	%rax, 0x58(%rbp)
145515e57:     	movq	%rsi, 0x60(%rbp)
145515e5b:     	leaq	0xc4(%rbp), %rax
145515e62:     	movq	%rax, 0x68(%rbp)
145515e66:     	movq	%rsi, 0x70(%rbp)
145515e6a:     	leaq	0xc0(%rbp), %rax
145515e71:     	movq	%rax, 0x78(%rbp)
145515e75:     	movq	%rsi, 0x80(%rbp)
145515e7c:     	leaq	0x8(%rbp), %rdi
145515e80:     	movq	%rdi, %rcx
145515e83:     	leaq	0x14747a9(%rip), %rdx   # 0x14698a633
145515e8a:     	movq	%r14, %r8
145515e8d:     	callq	0x14570bf80 <.text+0x570af80>
145515e92:     	nop
145515e93:     	leaq	-0x50(%rbp), %rax
145515e97:     	movq	%rax, 0x38(%rbp)
145515e9b:     	leaq	0x20908e(%rip), %rax    # 0x14571ef30 <.text+0x571df30>
145515ea2:     	movq	%rax, 0x40(%rbp)
145515ea6:     	leaq	-0x8(%rbp), %rax
145515eaa:     	movq	%rax, 0x48(%rbp)
145515eae:     	leaq	-0x5513df5(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145515eb5:     	movq	%rax, 0x50(%rbp)
145515eb9:     	leaq	-0x20(%rbp), %rax
145515ebd:     	movq	%rax, 0x58(%rbp)
145515ec1:     	leaq	-0x5513de8(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
145515ec8:     	movq	%rcx, 0x60(%rbp)
145515ecc:     	leaq	0xd4(%rbp), %rax
145515ed3:     	movq	%rax, 0x68(%rbp)
145515ed7:     	leaq	0x208162(%rip), %rax    # 0x14571e040 <.text+0x571d040>
145515ede:     	movq	%rax, 0x70(%rbp)
145515ee2:     	leaq	0xd0(%rbp), %rax
145515ee9:     	movq	%rax, 0x78(%rbp)
145515eed:     	movq	%rsi, 0x80(%rbp)
145515ef4:     	movq	%rdi, 0x88(%rbp)
145515efb:     	movq	%rcx, 0x90(%rbp)
145515f02:     	movq	%r12, %rcx
145515f05:     	leaq	0x17d3604(%rip), %rdx   # 0x146ce9510
145515f0c:     	movq	%r14, %r8
145515f0f:     	callq	0x14570bf80 <.text+0x570af80>
145515f14:     	nop
145515f15:     	movq	0x8(%rbp), %rdx
145515f19:     	testq	%rdx, %rdx
145515f1c:     	movq	%r13, %rsi
145515f1f:     	je	0x145515f30 <.text+0x5514f30>
145515f21:     	movq	0x10(%rbp), %rcx
145515f25:     	movl	$0x1, %r8d
145515f2b:     	callq	0x1400021d0 <.text+0x11d0>
145515f30:     	movq	-0x20(%rbp), %rdx
145515f34:     	testq	%rdx, %rdx
145515f37:     	movq	0x98(%rbp), %rdi
145515f3e:     	movq	-0x28(%rbp), %r13
145515f42:     	je	0x145515bc0 <.text+0x5514bc0>
145515f48:     	movq	-0x18(%rbp), %rcx
145515f4c:     	movl	$0x1, %r8d
145515f52:     	callq	0x1400021d0 <.text+0x11d0>
145515f57:     	jmp	0x145515bc0 <.text+0x5514bc0>
145515f5c:     	movl	$0x6, %edx
145515f61:     	leaq	0x17d359d(%rip), %r8    # 0x146ce9505
145515f68:     	movq	%r8, -0x8(%rbp)
145515f6c:     	movq	%rdx, (%rbp)
145515f70:     	movl	%eax, 0xd4(%rbp)
145515f76:     	movl	$0xbf800000, 0xd0(%rbp) # imm = 0xBF800000
145515f80:     	callq	0x14540d290 <.text+0x540c290>
145515f85:     	nop
145515f86:     	movq	%rax, %rdi
145515f89:     	movq	%rdx, %r12
145515f8c:     	jmp	0x145515d83 <.text+0x5514d83>
145515f91:     	movq	%r12, %r8
145515f94:     	shrq	$0x2, %r8
145515f98:     	movl	%r12d, %eax
145515f9b:     	andl	$0x3, %eax
145515f9e:     	cmpq	$0x1, %rax
145515fa2:     	sbbq	$-0x1, %r8
145515fa6:     	movq	$0x1, 0x20(%rsp)
145515faf:     	movl	$0x1, %r9d
145515fb5:     	movq	%r14, %rcx
145515fb8:     	xorl	%edx, %edx
145515fba:     	callq	0x145757d40 <.text+0x5756d40>
145515fbf:     	nop
145515fc0:     	jmp	0x145515daf <.text+0x5514daf>
145515fc5:     	movq	0xb8(%rbp), %rax
145515fcc:     	movq	%rdi, (%rax)
145515fcf:     	movaps	0xe0(%rbp), %xmm6
145515fd6:     	movaps	0xf0(%rbp), %xmm7
145515fdd:     	addq	$0x188, %rsp            # imm = 0x188
145515fe4:     	popq	%rbx
145515fe5:     	popq	%rdi
145515fe6:     	popq	%rsi
145515fe7:     	popq	%r12
145515fe9:     	popq	%r13
145515feb:     	popq	%r14
145515fed:     	popq	%r15
145515fef:     	popq	%rbp
145515ff0:     	retq
145515ff1:     	leaq	0x17d2cd0(%rip), %r8    # 0x146ce8cc8
145515ff8:     	movq	0xb0(%rbp), %rdx
145515fff:     	callq	0x1458e75b3 <.text+0x58e65b3>
145516004:     	nop
145516005:     	ud2
