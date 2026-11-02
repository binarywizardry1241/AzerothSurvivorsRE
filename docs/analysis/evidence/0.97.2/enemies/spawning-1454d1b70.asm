
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d1b70:     	pushq	%r14
1454d1b72:     	pushq	%rsi
1454d1b73:     	pushq	%rdi
1454d1b74:     	pushq	%rbx
1454d1b75:     	subq	$0x98, %rsp
1454d1b7c:     	movaps	%xmm12, 0x80(%rsp)
1454d1b85:     	movaps	%xmm11, 0x70(%rsp)
1454d1b8b:     	movaps	%xmm10, 0x60(%rsp)
1454d1b91:     	movaps	%xmm9, 0x50(%rsp)
1454d1b97:     	movaps	%xmm8, 0x40(%rsp)
1454d1b9d:     	movaps	%xmm7, 0x30(%rsp)
1454d1ba2:     	movaps	%xmm6, 0x20(%rsp)
1454d1ba7:     	movaps	%xmm3, %xmm6
1454d1baa:     	movaps	%xmm2, %xmm7
1454d1bad:     	movq	%rdx, %rdi
1454d1bb0:     	movq	%rcx, %rsi
1454d1bb3:     	movq	0x210(%rdx), %rcx
1454d1bba:     	movq	0x218(%rdx), %rdx
1454d1bc1:     	callq	0x14540e820 <.text+0x540d820>
1454d1bc6:     	imulq	$0xf0, %rax, %rbx
1454d1bcd:     	leaq	0x1244864(%rip), %r14   # 0x146716438
1454d1bd4:     	movss	0x3e8(%rdi), %xmm10
1454d1bdd:     	movss	0x3ec(%rdi), %xmm9
1454d1be6:     	movaps	%xmm7, %xmm0
1454d1be9:     	subss	0xc8(%rbx,%r14), %xmm0
1454d1bf3:     	movss	0x3f0(%rdi), %xmm11
1454d1bfc:     	movaps	%xmm6, %xmm1
1454d1bff:     	subss	0xcc(%rbx,%r14), %xmm1
1454d1c09:     	callq	0x145756e67 <.text+0x5755e67>
1454d1c0e:     	movaps	%xmm0, %xmm8
1454d1c12:     	movss	0xd8(%rbx,%r14), %xmm12
1454d1c1c:     	movss	0x42736c(%rip), %xmm0   # 0x1458f8f90
1454d1c24:     	addss	%xmm12, %xmm0
1454d1c29:     	ucomiss	%xmm0, %xmm8
1454d1c2d:     	ja	0x1454d1c6e <.text+0x54d0c6e>
1454d1c2f:     	movq	0x878(%rdi), %rbx
1454d1c36:     	leaq	0x10(%rbx), %rcx
1454d1c3a:     	movaps	%xmm7, %xmm1
1454d1c3d:     	movaps	%xmm6, %xmm2
1454d1c40:     	callq	0x1454627f0 <.text+0x54617f0>
1454d1c45:     	testb	$0x1, %al
1454d1c47:     	je	0x1454d1c6e <.text+0x54d0c6e>
1454d1c49:     	xorl	%eax, %eax
1454d1c4b:     	ucomiss	%xmm12, %xmm8
1454d1c4f:     	seta	%al
1454d1c52:     	movaps	%xmm0, %xmm1
1454d1c55:     	subss	%xmm11, %xmm1
1454d1c5a:     	andps	0x4392cf(%rip), %xmm1   # 0x14590af30
1454d1c61:     	leaq	0x14d87a0(%rip), %rcx   # 0x1469aa408
1454d1c68:     	ucomiss	(%rcx,%rax,4), %xmm1
1454d1c6c:     	jbe	0x1454d1caa <.text+0x54d0caa>
1454d1c6e:     	xorl	%eax, %eax
1454d1c70:     	movl	%eax, (%rsi)
1454d1c72:     	movaps	0x20(%rsp), %xmm6
1454d1c77:     	movaps	0x30(%rsp), %xmm7
1454d1c7c:     	movaps	0x40(%rsp), %xmm8
1454d1c82:     	movaps	0x50(%rsp), %xmm9
1454d1c88:     	movaps	0x60(%rsp), %xmm10
1454d1c8e:     	movaps	0x70(%rsp), %xmm11
1454d1c94:     	movaps	0x80(%rsp), %xmm12
1454d1c9d:     	addq	$0x98, %rsp
1454d1ca4:     	popq	%rbx
1454d1ca5:     	popq	%rdi
1454d1ca6:     	popq	%rsi
1454d1ca7:     	popq	%r14
1454d1ca9:     	retq
1454d1caa:     	cmpq	$-0x1, 0x40(%rbx)
1454d1caf:     	je	0x1454d1e0c <.text+0x54d0e0c>
1454d1cb5:     	movaps	%xmm7, %xmm2
1454d1cb8:     	subss	0x60(%rbx), %xmm2
1454d1cbd:     	xorps	%xmm3, %xmm3
1454d1cc0:     	ucomiss	%xmm2, %xmm3
1454d1cc3:     	ja	0x1454d1d89 <.text+0x54d0d89>
1454d1cc9:     	movaps	%xmm6, %xmm1
1454d1ccc:     	subss	0x64(%rbx), %xmm1
1454d1cd1:     	ucomiss	%xmm1, %xmm3
1454d1cd4:     	ja	0x1454d1d89 <.text+0x54d0d89>
1454d1cda:     	movss	0x4194fe(%rip), %xmm3   # 0x1458eb1e0
1454d1ce2:     	movaps	%xmm2, %xmm4
1454d1ce5:     	subss	%xmm3, %xmm4
1454d1ce9:     	cvttss2si	%xmm4, %rcx
1454d1cee:     	cvttss2si	%xmm2, %rdx
1454d1cf3:     	movq	%rdx, %rax
1454d1cf6:     	sarq	$0x3f, %rax
1454d1cfa:     	andq	%rcx, %rax
1454d1cfd:     	orq	%rdx, %rax
1454d1d00:     	xorl	%ecx, %ecx
1454d1d02:     	xorps	%xmm4, %xmm4
1454d1d05:     	ucomiss	%xmm4, %xmm2
1454d1d08:     	cmovbq	%rcx, %rax
1454d1d0c:     	movss	0x4194d0(%rip), %xmm5   # 0x1458eb1e4
1454d1d14:     	ucomiss	%xmm5, %xmm2
1454d1d17:     	movq	$-0x1, %r8
1454d1d1e:     	cmovaq	%r8, %rax
1454d1d22:     	movaps	%xmm1, %xmm2
1454d1d25:     	subss	%xmm3, %xmm2
1454d1d29:     	cvttss2si	%xmm2, %r9
1454d1d2e:     	cvttss2si	%xmm1, %r10
1454d1d33:     	movq	%r10, %rdx
1454d1d36:     	sarq	$0x3f, %rdx
1454d1d3a:     	andq	%r9, %rdx
1454d1d3d:     	orq	%r10, %rdx
1454d1d40:     	ucomiss	%xmm4, %xmm1
1454d1d43:     	cmovbq	%rcx, %rdx
1454d1d47:     	ucomiss	%xmm5, %xmm1
1454d1d4a:     	cmovaq	%r8, %rdx
1454d1d4e:     	movq	0x58(%rbx), %rcx
1454d1d52:     	cmpq	%rcx, %rax
1454d1d55:     	setae	%r8b
1454d1d59:     	cmpq	%rcx, %rdx
1454d1d5c:     	setae	%r9b
1454d1d60:     	orb	%r8b, %r9b
1454d1d63:     	jne	0x1454d1d89 <.text+0x54d0d89>
1454d1d65:     	imulq	%rdx, %rcx
1454d1d69:     	addq	%rax, %rcx
1454d1d6c:     	movq	0x50(%rbx), %rdx
1454d1d70:     	cmpq	%rdx, %rcx
1454d1d73:     	jae	0x1454d1e25 <.text+0x54d0e25>
1454d1d79:     	movq	0x48(%rbx), %rdx
1454d1d7d:     	xorl	%eax, %eax
1454d1d7f:     	cmpb	$0x0, (%rdx,%rcx)
1454d1d83:     	jne	0x1454d1c70 <.text+0x54d0c70>
1454d1d89:     	movq	0x8a0(%rdi), %rdi
1454d1d90:     	testq	%rdi, %rdi
1454d1d93:     	je	0x1454d1e0c <.text+0x54d0e0c>
1454d1d95:     	cmpq	$0x191, 0x30(%rdi)      # imm = 0x191
1454d1d9d:     	jb	0x1454d1e0c <.text+0x54d0e0c>
1454d1d9f:     	movaps	%xmm0, %xmm11
1454d1da3:     	addq	$0x40, %rbx
1454d1da7:     	addq	$0x10, %rdi
1454d1dab:     	movaps	%xmm7, %xmm0
1454d1dae:     	subss	%xmm10, %xmm0
1454d1db3:     	movaps	%xmm6, %xmm1
1454d1db6:     	subss	%xmm9, %xmm1
1454d1dbb:     	callq	0x145756e67 <.text+0x5755e67>
1454d1dc0:     	movaps	%xmm0, %xmm8
1454d1dc4:     	movq	%rdi, %rcx
1454d1dc7:     	movq	%rbx, %rdx
1454d1dca:     	movaps	%xmm7, %xmm2
1454d1dcd:     	movaps	%xmm6, %xmm3
1454d1dd0:     	callq	0x145464dc0 <.text+0x5463dc0>
1454d1dd5:     	testb	$0x1, %al
1454d1dd7:     	je	0x1454d1c6e <.text+0x54d0c6e>
1454d1ddd:     	movl	%edx, %eax
1454d1ddf:     	xorps	%xmm0, %xmm0
1454d1de2:     	cvtsi2ss	%rax, %xmm0
1454d1de7:     	mulss	0x42ae48(%rip), %xmm8   # 0x1458fcc38
1454d1df0:     	addss	0x419707(%rip), %xmm8   # 0x1458eb500
1454d1df9:     	ucomiss	%xmm8, %xmm0
1454d1dfd:     	movl	$0x0, %eax
1454d1e02:     	movaps	%xmm11, %xmm0
1454d1e06:     	ja	0x1454d1c70 <.text+0x54d0c70>
1454d1e0c:     	movss	%xmm7, 0x4(%rsi)
1454d1e11:     	movss	%xmm6, 0x8(%rsi)
1454d1e16:     	movss	%xmm0, 0xc(%rsi)
1454d1e1b:     	movl	$0x1, %eax
1454d1e20:     	jmp	0x1454d1c70 <.text+0x54d0c70>
1454d1e25:     	leaq	0x14b9ecc(%rip), %r8    # 0x14698bcf8
1454d1e2c:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454d1e31:     	ud2
