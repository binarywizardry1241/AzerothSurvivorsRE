
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c2a20:     	pushq	%r15
1454c2a22:     	pushq	%r14
1454c2a24:     	pushq	%r12
1454c2a26:     	pushq	%rsi
1454c2a27:     	pushq	%rdi
1454c2a28:     	pushq	%rbp
1454c2a29:     	pushq	%rbx
1454c2a2a:     	subq	$0xd0, %rsp
1454c2a31:     	movaps	%xmm15, 0xc0(%rsp)
1454c2a3a:     	movaps	%xmm14, 0xb0(%rsp)
1454c2a43:     	movaps	%xmm13, 0xa0(%rsp)
1454c2a4c:     	movaps	%xmm12, 0x90(%rsp)
1454c2a55:     	movaps	%xmm11, 0x80(%rsp)
1454c2a5e:     	movaps	%xmm10, 0x70(%rsp)
1454c2a64:     	movaps	%xmm9, 0x60(%rsp)
1454c2a6a:     	movaps	%xmm8, 0x50(%rsp)
1454c2a70:     	movaps	%xmm7, 0x40(%rsp)
1454c2a75:     	movaps	%xmm6, 0x30(%rsp)
1454c2a7a:     	movaps	%xmm3, %xmm7
1454c2a7d:     	movaps	%xmm2, %xmm8
1454c2a81:     	movq	%rdx, %rdi
1454c2a84:     	movq	%rcx, %rsi
1454c2a87:     	movq	0x210(%rdx), %rcx
1454c2a8e:     	movq	0x218(%rdx), %rdx
1454c2a95:     	callq	0x14540e820 <.text+0x540d820>
1454c2a9a:     	imulq	$0xf0, %rax, %rax
1454c2aa1:     	leaq	0x1253990(%rip), %r14   # 0x146716438
1454c2aa8:     	addq	%rax, %r14
1454c2aab:     	leaq	0x880(%rdi), %rbx
1454c2ab2:     	xorl	%r15d, %r15d
1454c2ab5:     	movss	0x428a3e(%rip), %xmm12  # 0x1458eb4fc
1454c2abe:     	movss	0x42a54d(%rip), %xmm13  # 0x1458ed014
1454c2ac7:     	xorps	%xmm14, %xmm14
1454c2acb:     	movss	0x428710(%rip), %xmm15  # 0x1458eb1e4
1454c2ad4:     	movq	$-0x1, %r12
1454c2adb:     	xorl	%ebp, %ebp
1454c2add:     	jmp	0x1454c2aeb <.text+0x54c1aeb>
1454c2adf:     	nop
1454c2ae0:     	incl	%ebp
1454c2ae2:     	cmpl	$0xc, %ebp
1454c2ae5:     	je	0x1454c2d14 <.text+0x54c1d14>
1454c2aeb:     	movsd	0x3e8(%rdi), %xmm6
1454c2af3:     	movq	0x880(%rdi), %r8
1454c2afa:     	movq	0x898(%rdi), %rdx
1454c2b01:     	movq	0x888(%rdi), %rcx
1454c2b08:     	movq	0x890(%rdi), %rax
1454c2b0f:     	nop
1454c2b10:     	leaq	(%r8,%rdx), %r9
1454c2b14:     	rolq	$0x17, %r9
1454c2b18:     	addq	%r8, %r9
1454c2b1b:     	movq	%rcx, %r10
1454c2b1e:     	shlq	$0x11, %r10
1454c2b22:     	xorq	%r8, %rax
1454c2b25:     	xorq	%rcx, %rdx
1454c2b28:     	xorq	%rax, %rcx
1454c2b2b:     	xorq	%rdx, %r8
1454c2b2e:     	rolq	$0x2d, %rdx
1454c2b32:     	xorq	%r10, %rax
1454c2b35:     	shrq	$0x29, %r9
1454c2b39:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454c2b40:     	movd	%r9d, %xmm9
1454c2b45:     	addss	%xmm12, %xmm9
1454c2b4a:     	mulss	%xmm13, %xmm9
1454c2b4f:     	ucomiss	%xmm9, %xmm13
1454c2b53:     	jbe	0x1454c2b10 <.text+0x54c1b10>
1454c2b55:     	addss	%xmm14, %xmm9
1454c2b5a:     	movq	%r8, 0x880(%rdi)
1454c2b61:     	movq	%rdx, 0x898(%rdi)
1454c2b68:     	movq	%rcx, 0x888(%rdi)
1454c2b6f:     	movq	%rax, 0x890(%rdi)
1454c2b76:     	movq	%rbx, %rcx
1454c2b79:     	movaps	%xmm8, %xmm1
1454c2b7d:     	movaps	%xmm7, %xmm2
1454c2b80:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454c2b85:     	movaps	%xmm0, %xmm10
1454c2b89:     	movaps	%xmm9, %xmm0
1454c2b8d:     	callq	0x145756e31 <.text+0x5755e31>
1454c2b92:     	movaps	%xmm0, %xmm11
1454c2b96:     	movaps	%xmm9, %xmm0
1454c2b9a:     	callq	0x145756e2b <.text+0x5755e2b>
1454c2b9f:     	unpcklps	%xmm0, %xmm11           # xmm11 = xmm11[0],xmm0[0],xmm11[1],xmm0[1]
1454c2ba3:     	movsldup	%xmm10, %xmm0           # xmm0 = xmm10[0,0,2,2]
1454c2ba8:     	mulps	%xmm11, %xmm0
1454c2bac:     	addps	%xmm0, %xmm6
1454c2baf:     	movsd	0xc8(%r14), %xmm0
1454c2bb8:     	movaps	%xmm6, %xmm1
1454c2bbb:     	subps	%xmm0, %xmm1
1454c2bbe:     	movaps	%xmm1, %xmm2
1454c2bc1:     	mulps	%xmm1, %xmm2
1454c2bc4:     	movshdup	%xmm2, %xmm3            # xmm3 = xmm2[1,1,3,3]
1454c2bc8:     	addss	%xmm2, %xmm3
1454c2bcc:     	sqrtss	%xmm3, %xmm3
1454c2bd0:     	movss	0xd8(%r14), %xmm2
1454c2bd9:     	ucomiss	%xmm2, %xmm3
1454c2bdc:     	jbe	0x1454c2bf2 <.text+0x54c1bf2>
1454c2bde:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
1454c2be2:     	divps	%xmm3, %xmm1
1454c2be5:     	movsldup	%xmm2, %xmm2            # xmm2 = xmm2[0,0,2,2]
1454c2be9:     	mulps	%xmm1, %xmm2
1454c2bec:     	addps	%xmm2, %xmm0
1454c2bef:     	movaps	%xmm0, %xmm6
1454c2bf2:     	movq	0x878(%rdi), %rcx
1454c2bf9:     	cmpq	$-0x1, 0x40(%rcx)
1454c2bfe:     	je	0x1454c2cd0 <.text+0x54c1cd0>
1454c2c04:     	movsd	0x60(%rcx), %xmm1
1454c2c09:     	movaps	%xmm6, %xmm0
1454c2c0c:     	subps	%xmm1, %xmm0
1454c2c0f:     	movaps	%xmm0, %xmm1
1454c2c12:     	xorps	%xmm2, %xmm2
1454c2c15:     	cmpltps	%xmm2, %xmm1
1454c2c19:     	unpcklps	%xmm1, %xmm1            # xmm1 = xmm1[0,0,1,1]
1454c2c1c:     	movmskpd	%xmm1, %eax
1454c2c20:     	testl	%eax, %eax
1454c2c22:     	jne	0x1454c2cd0 <.text+0x54c1cd0>
1454c2c28:     	movaps	%xmm0, %xmm1
1454c2c2b:     	movss	0x4285ad(%rip), %xmm2   # 0x1458eb1e0
1454c2c33:     	subss	%xmm2, %xmm1
1454c2c37:     	cvttss2si	%xmm1, %rax
1454c2c3c:     	cvttss2si	%xmm0, %r8
1454c2c41:     	movq	%r8, %rdx
1454c2c44:     	sarq	$0x3f, %rdx
1454c2c48:     	andq	%rax, %rdx
1454c2c4b:     	orq	%r8, %rdx
1454c2c4e:     	ucomiss	%xmm14, %xmm0
1454c2c52:     	cmovbq	%r15, %rdx
1454c2c56:     	ucomiss	%xmm15, %xmm0
1454c2c5a:     	cmovaq	%r12, %rdx
1454c2c5e:     	movshdup	%xmm0, %xmm0            # xmm0 = xmm0[1,1,3,3]
1454c2c62:     	movaps	%xmm0, %xmm1
1454c2c65:     	subss	%xmm2, %xmm1
1454c2c69:     	cvttss2si	%xmm1, %rax
1454c2c6e:     	cvttss2si	%xmm0, %r9
1454c2c73:     	movq	%r9, %r8
1454c2c76:     	sarq	$0x3f, %r8
1454c2c7a:     	andq	%rax, %r8
1454c2c7d:     	orq	%r9, %r8
1454c2c80:     	ucomiss	%xmm14, %xmm0
1454c2c84:     	cmovbq	%r15, %r8
1454c2c88:     	ucomiss	%xmm15, %xmm0
1454c2c8c:     	cmovaq	%r12, %r8
1454c2c90:     	movq	0x58(%rcx), %rax
1454c2c94:     	cmpq	%rax, %rdx
1454c2c97:     	setae	%r9b
1454c2c9b:     	cmpq	%rax, %r8
1454c2c9e:     	setae	%r10b
1454c2ca2:     	orb	%r9b, %r10b
1454c2ca5:     	jne	0x1454c2cd0 <.text+0x54c1cd0>
1454c2ca7:     	imulq	%r8, %rax
1454c2cab:     	addq	%rdx, %rax
1454c2cae:     	movq	0x50(%rcx), %rdx
1454c2cb2:     	cmpq	%rdx, %rax
1454c2cb5:     	jae	0x1454c2e93 <.text+0x54c1e93>
1454c2cbb:     	movq	0x48(%rcx), %rdx
1454c2cbf:     	cmpb	$0x0, (%rdx,%rax)
1454c2cc3:     	jne	0x1454c2ae0 <.text+0x54c1ae0>
1454c2cc9:     	nopl	(%rax)
1454c2cd0:     	addq	$0x10, %rcx
1454c2cd4:     	movshdup	%xmm6, %xmm2            # xmm2 = xmm6[1,1,3,3]
1454c2cd8:     	movaps	%xmm6, %xmm1
1454c2cdb:     	callq	0x1454627f0 <.text+0x54617f0>
1454c2ce0:     	testb	$0x1, %al
1454c2ce2:     	je	0x1454c2ae0 <.text+0x54c1ae0>
1454c2ce8:     	movss	0x3f0(%rdi), %xmm1
1454c2cf0:     	movaps	%xmm0, %xmm2
1454c2cf3:     	subss	%xmm1, %xmm2
1454c2cf7:     	andps	0x448232(%rip), %xmm2   # 0x14590af30
1454c2cfe:     	movss	0x504c96(%rip), %xmm1   # 0x1459c799c
1454c2d06:     	ucomiss	%xmm2, %xmm1
1454c2d09:     	jbe	0x1454c2ae0 <.text+0x54c1ae0>
1454c2d0f:     	jmp	0x1454c2e30 <.text+0x54c1e30>
1454c2d14:     	movsd	0x3e8(%rdi), %xmm6
1454c2d1c:     	movq	0x880(%rdi), %r8
1454c2d23:     	movq	0x898(%rdi), %rdx
1454c2d2a:     	movq	0x888(%rdi), %rcx
1454c2d31:     	movq	0x890(%rdi), %rax
1454c2d38:     	nopl	(%rax,%rax)
1454c2d40:     	leaq	(%r8,%rdx), %r9
1454c2d44:     	rolq	$0x17, %r9
1454c2d48:     	addq	%r8, %r9
1454c2d4b:     	movq	%rcx, %r10
1454c2d4e:     	shlq	$0x11, %r10
1454c2d52:     	xorq	%r8, %rax
1454c2d55:     	xorq	%rcx, %rdx
1454c2d58:     	xorq	%rax, %rcx
1454c2d5b:     	xorq	%rdx, %r8
1454c2d5e:     	rolq	$0x2d, %rdx
1454c2d62:     	xorq	%r10, %rax
1454c2d65:     	shrq	$0x29, %r9
1454c2d69:     	orl	$0x3f800000, %r9d       # imm = 0x3F800000
1454c2d70:     	movd	%r9d, %xmm9
1454c2d75:     	addss	%xmm12, %xmm9
1454c2d7a:     	mulss	%xmm13, %xmm9
1454c2d7f:     	ucomiss	%xmm9, %xmm13
1454c2d83:     	jbe	0x1454c2d40 <.text+0x54c1d40>
1454c2d85:     	xorps	%xmm0, %xmm0
1454c2d88:     	addss	%xmm0, %xmm9
1454c2d8d:     	movq	%r8, 0x880(%rdi)
1454c2d94:     	movq	%rdx, 0x898(%rdi)
1454c2d9b:     	movq	%rcx, 0x888(%rdi)
1454c2da2:     	movq	%rax, 0x890(%rdi)
1454c2da9:     	movq	%rbx, %rcx
1454c2dac:     	movaps	%xmm8, %xmm1
1454c2db0:     	movaps	%xmm7, %xmm2
1454c2db3:     	callq	0x1454f97c0 <.text+0x54f87c0>
1454c2db8:     	movaps	%xmm0, %xmm7
1454c2dbb:     	movaps	%xmm9, %xmm0
1454c2dbf:     	callq	0x145756e31 <.text+0x5755e31>
1454c2dc4:     	movaps	%xmm0, %xmm8
1454c2dc8:     	movaps	%xmm9, %xmm0
1454c2dcc:     	callq	0x145756e2b <.text+0x5755e2b>
1454c2dd1:     	unpcklps	%xmm0, %xmm8            # xmm8 = xmm8[0],xmm0[0],xmm8[1],xmm0[1]
1454c2dd5:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
1454c2dd9:     	mulps	%xmm8, %xmm0
1454c2ddd:     	addps	%xmm0, %xmm6
1454c2de0:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
1454c2de4:     	movq	0x878(%rdi), %rdi
1454c2deb:     	leaq	0x10(%rdi), %rcx
1454c2def:     	movaps	%xmm6, %xmm1
1454c2df2:     	movaps	%xmm7, %xmm2
1454c2df5:     	callq	0x1454627f0 <.text+0x54617f0>
1454c2dfa:     	testb	$0x1, %al
1454c2dfc:     	jne	0x1454c2e30 <.text+0x54c1e30>
1454c2dfe:     	cmpq	$-0x1, 0x68(%rdi)
1454c2e03:     	je	0x1454c2e28 <.text+0x54c1e28>
1454c2e05:     	leaq	0x68(%rdi), %rdx
1454c2e09:     	leaq	0x20(%rsp), %rcx
1454c2e0e:     	movaps	%xmm6, %xmm2
1454c2e11:     	movaps	%xmm7, %xmm3
1454c2e14:     	callq	0x145467bf0 <.text+0x5466bf0>
1454c2e19:     	cmpl	$0x1, 0x20(%rsp)
1454c2e1e:     	jne	0x1454c2e28 <.text+0x54c1e28>
1454c2e20:     	movss	0x2c(%rsp), %xmm0
1454c2e26:     	jmp	0x1454c2e30 <.text+0x54c1e30>
1454c2e28:     	movss	0x90(%rdi), %xmm0
1454c2e30:     	movlps	%xmm6, (%rsi)
1454c2e33:     	movss	%xmm0, 0x8(%rsi)
1454c2e38:     	movaps	0x30(%rsp), %xmm6
1454c2e3d:     	movaps	0x40(%rsp), %xmm7
1454c2e42:     	movaps	0x50(%rsp), %xmm8
1454c2e48:     	movaps	0x60(%rsp), %xmm9
1454c2e4e:     	movaps	0x70(%rsp), %xmm10
1454c2e54:     	movaps	0x80(%rsp), %xmm11
1454c2e5d:     	movaps	0x90(%rsp), %xmm12
1454c2e66:     	movaps	0xa0(%rsp), %xmm13
1454c2e6f:     	movaps	0xb0(%rsp), %xmm14
1454c2e78:     	movaps	0xc0(%rsp), %xmm15
1454c2e81:     	addq	$0xd0, %rsp
1454c2e88:     	popq	%rbx
1454c2e89:     	popq	%rbp
1454c2e8a:     	popq	%rdi
1454c2e8b:     	popq	%rsi
1454c2e8c:     	popq	%r12
1454c2e8e:     	popq	%r14
1454c2e90:     	popq	%r15
1454c2e92:     	retq
1454c2e93:     	leaq	0x14c8e5e(%rip), %r8    # 0x14698bcf8
1454c2e9a:     	movq	%rax, %rcx
1454c2e9d:     	callq	0x1458e75b3 <.text+0x58e65b3>
1454c2ea2:     	ud2
