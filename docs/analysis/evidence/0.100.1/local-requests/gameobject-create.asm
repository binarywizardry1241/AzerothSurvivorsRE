
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e4a00:     	pushq	%rbp
1454e4a01:     	pushq	%r15
1454e4a03:     	pushq	%r14
1454e4a05:     	pushq	%r13
1454e4a07:     	pushq	%r12
1454e4a09:     	pushq	%rsi
1454e4a0a:     	pushq	%rdi
1454e4a0b:     	pushq	%rbx
1454e4a0c:     	subq	$0xf8, %rsp
1454e4a13:     	leaq	0x80(%rsp), %rbp
1454e4a1b:     	movaps	%xmm7, 0x60(%rbp)
1454e4a1f:     	movaps	%xmm6, 0x50(%rbp)
1454e4a23:     	movq	$-0x2, 0x48(%rbp)
1454e4a2b:     	movl	%r9d, -0xc(%rbp)
1454e4a2f:     	movq	%r8, %rdi
1454e4a32:     	movq	%rcx, %rsi
1454e4a35:     	movl	0xe0(%rbp), %r12d
1454e4a3c:     	movl	(%rdx), %ebx
1454e4a3e:     	movl	0x4(%rdx), %r13d
1454e4a42:     	movd	0x8(%rdx), %xmm6
1454e4a47:     	movl	0x954(%rcx), %eax
1454e4a4d:     	incl	%eax
1454e4a4f:     	movl	%eax, 0x954(%rcx)
1454e4a55:     	movq	0x8a0(%rcx), %r8
1454e4a5c:     	movq	0x8a8(%rcx), %rcx
1454e4a63:     	movq	0x8b8(%rsi), %r9
1454e4a6a:     	movq	0x8b0(%rsi), %rdx
1454e4a71:     	movss	0x422a93(%rip), %xmm0   # 0x14590750c
1454e4a79:     	movss	0x424b63(%rip), %xmm1   # 0x1459095e4
1454e4a81:     	nopw	%cs:(%rax,%rax)
1454e4a90:     	leaq	(%r8,%r9), %r10
1454e4a94:     	rolq	$0x17, %r10
1454e4a98:     	addq	%r8, %r10
1454e4a9b:     	movq	%rcx, %r11
1454e4a9e:     	shlq	$0x11, %r11
1454e4aa2:     	xorq	%r8, %rdx
1454e4aa5:     	xorq	%rcx, %r9
1454e4aa8:     	xorq	%rdx, %rcx
1454e4aab:     	xorq	%r9, %r8
1454e4aae:     	rolq	$0x2d, %r9
1454e4ab2:     	xorq	%r11, %rdx
1454e4ab5:     	shrq	$0x29, %r10
1454e4ab9:     	orl	$0x3f800000, %r10d      # imm = 0x3F800000
1454e4ac0:     	movd	%r10d, %xmm7
1454e4ac5:     	addss	%xmm0, %xmm7
1454e4ac9:     	mulss	%xmm1, %xmm7
1454e4acd:     	ucomiss	%xmm7, %xmm1
1454e4ad0:     	jbe	0x1454e4a90 <.text+0x54e3a90>
1454e4ad2:     	movl	%ebx, %r10d
1454e4ad5:     	andl	$0xffffff, %r10d        # imm = 0xFFFFFF
1454e4adc:     	shlq	$0x18, %r10
1454e4ae0:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454e4ae5:     	orq	%r10, %rax
1454e4ae8:     	movabsq	$-0xef0000000000000, %r14 # imm = 0xF110000000000000
1454e4af2:     	orq	%rax, %r14
1454e4af5:     	movq	%r8, 0x8a0(%rsi)
1454e4afc:     	movq	%r9, 0x8b8(%rsi)
1454e4b03:     	movq	%rcx, 0x8a8(%rsi)
1454e4b0a:     	movq	%rdx, 0x8b0(%rsi)
1454e4b11:     	movq	$0x0, -0x8(%rbp)
1454e4b19:     	movq	$0x0, 0x8(%rbp)
1454e4b21:     	leaq	-0x8(%rbp), %r15
1454e4b25:     	movq	%r15, %rcx
1454e4b28:     	xorl	%edx, %edx
1454e4b2a:     	movq	%r14, %r8
1454e4b2d:     	callq	0x145513710 <.text+0x5512710>
1454e4b32:     	nop
1454e4b33:     	movq	-0x8(%rbp), %rax
1454e4b37:     	testq	%rax, %rax
1454e4b3a:     	je	0x1454e4bab <.text+0x54e3bab>
1454e4b3c:     	movq	(%rbp), %rcx
1454e4b40:     	movw	$0x2, %dx
1454e4b44:     	movzwl	0x36(%rax), %r9d
1454e4b49:     	movl	%r9d, %r10d
1454e4b4c:     	addl	%r10d, %r10d
1454e4b4f:     	movq	$-0x1, %r8
1454e4b56:     	nopw	%cs:(%rax,%rax)
1454e4b60:     	testq	%r10, %r10
1454e4b63:     	je	0x1454e4b90 <.text+0x54e3b90>
1454e4b65:     	cmpw	0x3a(%rax,%r8,2), %dx
1454e4b6b:     	seta	%r11b
1454e4b6f:     	sbbb	$0x0, %r11b
1454e4b73:     	incq	%r8
1454e4b76:     	addq	$-0x2, %r10
1454e4b7a:     	cmpb	$0x1, %r11b
1454e4b7e:     	je	0x1454e4b60 <.text+0x54e3b60>
1454e4b80:     	movzbl	%r11b, %r9d
1454e4b84:     	testl	%r9d, %r9d
1454e4b87:     	je	0x1454e4ba0 <.text+0x54e3ba0>
1454e4b89:     	jmp	0x1454e4b93 <.text+0x54e3b93>
1454e4b8b:     	nopl	(%rax,%rax)
1454e4b90:     	movq	%r9, %r8
1454e4b93:     	subq	$0x1, %rcx
1454e4b97:     	jb	0x1454e4bad <.text+0x54e3bad>
1454e4b99:     	movq	0x50(%rax,%r8,8), %rax
1454e4b9e:     	jmp	0x1454e4b44 <.text+0x54e3b44>
1454e4ba0:     	movl	$0x21, 0x8(%rax,%r8,4)
1454e4ba9:     	jmp	0x1454e4bdd <.text+0x54e3bdd>
1454e4bab:     	xorl	%eax, %eax
1454e4bad:     	movq	%r15, 0x10(%rbp)
1454e4bb1:     	movq	%rax, 0x18(%rbp)
1454e4bb5:     	movq	$0x0, 0x20(%rbp)
1454e4bbd:     	movq	%r8, 0x28(%rbp)
1454e4bc1:     	movq	$0x2, 0x30(%rbp)
1454e4bc9:     	leaq	-0x30(%rbp), %rcx
1454e4bcd:     	leaq	0x10(%rbp), %rdx
1454e4bd1:     	movl	$0x21, %r8d
1454e4bd7:     	callq	0x14552a730 <.text+0x5529730>
1454e4bdc:     	nop
1454e4bdd:     	movq	-0x8(%rbp), %rax
1454e4be1:     	testq	%rax, %rax
1454e4be4:     	je	0x1454e4c47 <.text+0x54e3c47>
1454e4be6:     	movq	(%rbp), %rcx
1454e4bea:     	movw	$0x3, %dx
1454e4bee:     	movzwl	0x36(%rax), %r9d
1454e4bf3:     	movl	%r9d, %r10d
1454e4bf6:     	addl	%r10d, %r10d
1454e4bf9:     	movq	$-0x1, %r8
1454e4c00:     	testq	%r10, %r10
1454e4c03:     	je	0x1454e4c30 <.text+0x54e3c30>
1454e4c05:     	cmpw	0x3a(%rax,%r8,2), %dx
1454e4c0b:     	seta	%r11b
1454e4c0f:     	sbbb	$0x0, %r11b
1454e4c13:     	incq	%r8
1454e4c16:     	addq	$-0x2, %r10
1454e4c1a:     	cmpb	$0x1, %r11b
1454e4c1e:     	je	0x1454e4c00 <.text+0x54e3c00>
1454e4c20:     	movzbl	%r11b, %r9d
1454e4c24:     	testl	%r9d, %r9d
1454e4c27:     	je	0x1454e4c40 <.text+0x54e3c40>
1454e4c29:     	jmp	0x1454e4c33 <.text+0x54e3c33>
1454e4c2b:     	nopl	(%rax,%rax)
1454e4c30:     	movq	%r9, %r8
1454e4c33:     	subq	$0x1, %rcx
1454e4c37:     	jb	0x1454e4c49 <.text+0x54e3c49>
1454e4c39:     	movq	0x50(%rax,%r8,8), %rax
1454e4c3e:     	jmp	0x1454e4bee <.text+0x54e3bee>
1454e4c40:     	movl	%ebx, 0x8(%rax,%r8,4)
1454e4c45:     	jmp	0x1454e4c76 <.text+0x54e3c76>
1454e4c47:     	xorl	%eax, %eax
1454e4c49:     	movq	%r15, 0x10(%rbp)
1454e4c4d:     	movq	%rax, 0x18(%rbp)
1454e4c51:     	movq	$0x0, 0x20(%rbp)
1454e4c59:     	movq	%r8, 0x28(%rbp)
1454e4c5d:     	movq	$0x3, 0x30(%rbp)
1454e4c65:     	leaq	-0x30(%rbp), %rcx
1454e4c69:     	leaq	0x10(%rbp), %rdx
1454e4c6d:     	movl	%ebx, %r8d
1454e4c70:     	callq	0x14552a730 <.text+0x5529730>
1454e4c75:     	nop
1454e4c76:     	movq	-0x8(%rbp), %rax
1454e4c7a:     	testq	%rax, %rax
1454e4c7d:     	je	0x1454e4ce9 <.text+0x54e3ce9>
1454e4c7f:     	movq	(%rbp), %rcx
1454e4c83:     	movw	$0x4, %dx
1454e4c87:     	movzwl	0x36(%rax), %r8d
1454e4c8c:     	movl	%r8d, %r10d
1454e4c8f:     	addl	%r10d, %r10d
1454e4c92:     	movq	$-0x1, %r9
1454e4c99:     	nopl	(%rax)
1454e4ca0:     	testq	%r10, %r10
1454e4ca3:     	je	0x1454e4cd0 <.text+0x54e3cd0>
1454e4ca5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454e4cab:     	seta	%r11b
1454e4caf:     	sbbb	$0x0, %r11b
1454e4cb3:     	incq	%r9
1454e4cb6:     	addq	$-0x2, %r10
1454e4cba:     	cmpb	$0x1, %r11b
1454e4cbe:     	je	0x1454e4ca0 <.text+0x54e3ca0>
1454e4cc0:     	movzbl	%r11b, %r8d
1454e4cc4:     	testl	%r8d, %r8d
1454e4cc7:     	je	0x1454e4ce0 <.text+0x54e3ce0>
1454e4cc9:     	jmp	0x1454e4cd3 <.text+0x54e3cd3>
1454e4ccb:     	nopl	(%rax,%rax)
1454e4cd0:     	movq	%r8, %r9
1454e4cd3:     	subq	$0x1, %rcx
1454e4cd7:     	jb	0x1454e4ceb <.text+0x54e3ceb>
1454e4cd9:     	movq	0x50(%rax,%r9,8), %rax
1454e4cde:     	jmp	0x1454e4c87 <.text+0x54e3c87>
1454e4ce0:     	movd	%xmm6, 0x8(%rax,%r9,4)
1454e4ce7:     	jmp	0x1454e4d1a <.text+0x54e3d1a>
1454e4ce9:     	xorl	%eax, %eax
1454e4ceb:     	movd	%xmm6, %r8d
1454e4cf0:     	movq	%r15, 0x10(%rbp)
1454e4cf4:     	movq	%rax, 0x18(%rbp)
1454e4cf8:     	movq	$0x0, 0x20(%rbp)
1454e4d00:     	movq	%r9, 0x28(%rbp)
1454e4d04:     	movq	$0x4, 0x30(%rbp)
1454e4d0c:     	leaq	-0x30(%rbp), %rcx
1454e4d10:     	leaq	0x10(%rbp), %rdx
1454e4d14:     	callq	0x14552a730 <.text+0x5529730>
1454e4d19:     	nop
1454e4d1a:     	movq	-0x8(%rbp), %rax
1454e4d1e:     	testq	%rax, %rax
1454e4d21:     	je	0x1454e4d87 <.text+0x54e3d87>
1454e4d23:     	movq	(%rbp), %rcx
1454e4d27:     	movw	$0x8, %dx
1454e4d2b:     	movzwl	0x36(%rax), %r9d
1454e4d30:     	movl	%r9d, %r10d
1454e4d33:     	addl	%r10d, %r10d
1454e4d36:     	movq	$-0x1, %r8
1454e4d3d:     	nopl	(%rax)
1454e4d40:     	testq	%r10, %r10
1454e4d43:     	je	0x1454e4d70 <.text+0x54e3d70>
1454e4d45:     	cmpw	0x3a(%rax,%r8,2), %dx
1454e4d4b:     	seta	%r11b
1454e4d4f:     	sbbb	$0x0, %r11b
1454e4d53:     	incq	%r8
1454e4d56:     	addq	$-0x2, %r10
1454e4d5a:     	cmpb	$0x1, %r11b
1454e4d5e:     	je	0x1454e4d40 <.text+0x54e3d40>
1454e4d60:     	movzbl	%r11b, %r9d
1454e4d64:     	testl	%r9d, %r9d
1454e4d67:     	je	0x1454e4d80 <.text+0x54e3d80>
1454e4d69:     	jmp	0x1454e4d73 <.text+0x54e3d73>
1454e4d6b:     	nopl	(%rax,%rax)
1454e4d70:     	movq	%r9, %r8
1454e4d73:     	subq	$0x1, %rcx
1454e4d77:     	jb	0x1454e4d89 <.text+0x54e3d89>
1454e4d79:     	movq	0x50(%rax,%r8,8), %rax
1454e4d7e:     	jmp	0x1454e4d2b <.text+0x54e3d2b>
1454e4d80:     	movl	%r13d, 0x8(%rax,%r8,4)
1454e4d85:     	jmp	0x1454e4db6 <.text+0x54e3db6>
1454e4d87:     	xorl	%eax, %eax
1454e4d89:     	movq	%r15, 0x10(%rbp)
1454e4d8d:     	movq	%rax, 0x18(%rbp)
1454e4d91:     	movq	$0x0, 0x20(%rbp)
1454e4d99:     	movq	%r8, 0x28(%rbp)
1454e4d9d:     	movq	$0x8, 0x30(%rbp)
1454e4da5:     	leaq	-0x30(%rbp), %rcx
1454e4da9:     	leaq	0x10(%rbp), %rdx
1454e4dad:     	movl	%r13d, %r8d
1454e4db0:     	callq	0x14552a730 <.text+0x5529730>
1454e4db5:     	nop
1454e4db6:     	movq	-0x8(%rbp), %rax
1454e4dba:     	testq	%rax, %rax
1454e4dbd:     	je	0x1454e4e27 <.text+0x54e3e27>
1454e4dbf:     	movq	(%rbp), %rcx
1454e4dc3:     	movw	$0x9, %dx
1454e4dc7:     	movzwl	0x36(%rax), %r9d
1454e4dcc:     	movl	%r9d, %r10d
1454e4dcf:     	addl	%r10d, %r10d
1454e4dd2:     	movq	$-0x1, %r8
1454e4dd9:     	nopl	(%rax)
1454e4de0:     	testq	%r10, %r10
1454e4de3:     	je	0x1454e4e10 <.text+0x54e3e10>
1454e4de5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454e4deb:     	seta	%r11b
1454e4def:     	sbbb	$0x0, %r11b
1454e4df3:     	incq	%r8
1454e4df6:     	addq	$-0x2, %r10
1454e4dfa:     	cmpb	$0x1, %r11b
1454e4dfe:     	je	0x1454e4de0 <.text+0x54e3de0>
1454e4e00:     	movzbl	%r11b, %r9d
1454e4e04:     	testl	%r9d, %r9d
1454e4e07:     	je	0x1454e4e20 <.text+0x54e3e20>
1454e4e09:     	jmp	0x1454e4e13 <.text+0x54e3e13>
1454e4e0b:     	nopl	(%rax,%rax)
1454e4e10:     	movq	%r9, %r8
1454e4e13:     	subq	$0x1, %rcx
1454e4e17:     	jb	0x1454e4e29 <.text+0x54e3e29>
1454e4e19:     	movq	0x50(%rax,%r8,8), %rax
1454e4e1e:     	jmp	0x1454e4dc7 <.text+0x54e3dc7>
1454e4e20:     	movl	%r12d, 0x8(%rax,%r8,4)
1454e4e25:     	jmp	0x1454e4e56 <.text+0x54e3e56>
1454e4e27:     	xorl	%eax, %eax
1454e4e29:     	movq	%r15, 0x10(%rbp)
1454e4e2d:     	movq	%rax, 0x18(%rbp)
1454e4e31:     	movq	$0x0, 0x20(%rbp)
1454e4e39:     	movq	%r8, 0x28(%rbp)
1454e4e3d:     	movq	$0x9, 0x30(%rbp)
1454e4e45:     	leaq	-0x30(%rbp), %rcx
1454e4e49:     	leaq	0x10(%rbp), %rdx
1454e4e4d:     	movl	%r12d, %r8d
1454e4e50:     	callq	0x14552a730 <.text+0x5529730>
1454e4e55:     	nop
1454e4e56:     	xorps	%xmm0, %xmm0
1454e4e59:     	addss	%xmm0, %xmm7
1454e4e5d:     	movss	0x422633(%rip), %xmm6   # 0x145907498
1454e4e65:     	mulss	%xmm7, %xmm6
1454e4e69:     	movaps	%xmm6, %xmm0
1454e4e6c:     	callq	0x145773235 <.text+0x5772235>
1454e4e71:     	movq	-0x8(%rbp), %rax
1454e4e75:     	testq	%rax, %rax
1454e4e78:     	je	0x1454e4ee9 <.text+0x54e3ee9>
1454e4e7a:     	movq	(%rbp), %rcx
1454e4e7e:     	movw	$0xc, %dx
1454e4e82:     	movzwl	0x36(%rax), %r8d
1454e4e87:     	movl	%r8d, %r10d
1454e4e8a:     	addl	%r10d, %r10d
1454e4e8d:     	movq	$-0x1, %r9
1454e4e94:     	nopw	%cs:(%rax,%rax)
1454e4ea0:     	testq	%r10, %r10
1454e4ea3:     	je	0x1454e4ed0 <.text+0x54e3ed0>
1454e4ea5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454e4eab:     	seta	%r11b
1454e4eaf:     	sbbb	$0x0, %r11b
1454e4eb3:     	incq	%r9
1454e4eb6:     	addq	$-0x2, %r10
1454e4eba:     	cmpb	$0x1, %r11b
1454e4ebe:     	je	0x1454e4ea0 <.text+0x54e3ea0>
1454e4ec0:     	movzbl	%r11b, %r8d
1454e4ec4:     	testl	%r8d, %r8d
1454e4ec7:     	je	0x1454e4ee0 <.text+0x54e3ee0>
1454e4ec9:     	jmp	0x1454e4ed3 <.text+0x54e3ed3>
1454e4ecb:     	nopl	(%rax,%rax)
1454e4ed0:     	movq	%r8, %r9
1454e4ed3:     	subq	$0x1, %rcx
1454e4ed7:     	jb	0x1454e4eeb <.text+0x54e3eeb>
1454e4ed9:     	movq	0x50(%rax,%r9,8), %rax
1454e4ede:     	jmp	0x1454e4e82 <.text+0x54e3e82>
1454e4ee0:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454e4ee7:     	jmp	0x1454e4f1a <.text+0x54e3f1a>
1454e4ee9:     	xorl	%eax, %eax
1454e4eeb:     	movd	%xmm0, %r8d
1454e4ef0:     	movq	%r15, 0x10(%rbp)
1454e4ef4:     	movq	%rax, 0x18(%rbp)
1454e4ef8:     	movq	$0x0, 0x20(%rbp)
1454e4f00:     	movq	%r9, 0x28(%rbp)
1454e4f04:     	movq	$0xc, 0x30(%rbp)
1454e4f0c:     	leaq	-0x30(%rbp), %rcx
1454e4f10:     	leaq	0x10(%rbp), %rdx
1454e4f14:     	callq	0x14552a730 <.text+0x5529730>
1454e4f19:     	nop
1454e4f1a:     	movaps	%xmm6, %xmm0
1454e4f1d:     	callq	0x145773247 <.text+0x5772247>
1454e4f22:     	movq	-0x8(%rbp), %rax
1454e4f26:     	testq	%rax, %rax
1454e4f29:     	je	0x1454e4f99 <.text+0x54e3f99>
1454e4f2b:     	movq	(%rbp), %rcx
1454e4f2f:     	movw	$0xd, %dx
1454e4f33:     	movzwl	0x36(%rax), %r8d
1454e4f38:     	movl	%r8d, %r10d
1454e4f3b:     	addl	%r10d, %r10d
1454e4f3e:     	movq	$-0x1, %r9
1454e4f45:     	nopw	%cs:(%rax,%rax)
1454e4f50:     	testq	%r10, %r10
1454e4f53:     	je	0x1454e4f80 <.text+0x54e3f80>
1454e4f55:     	cmpw	0x3a(%rax,%r9,2), %dx
1454e4f5b:     	seta	%r11b
1454e4f5f:     	sbbb	$0x0, %r11b
1454e4f63:     	incq	%r9
1454e4f66:     	addq	$-0x2, %r10
1454e4f6a:     	cmpb	$0x1, %r11b
1454e4f6e:     	je	0x1454e4f50 <.text+0x54e3f50>
1454e4f70:     	movzbl	%r11b, %r8d
1454e4f74:     	testl	%r8d, %r8d
1454e4f77:     	je	0x1454e4f90 <.text+0x54e3f90>
1454e4f79:     	jmp	0x1454e4f83 <.text+0x54e3f83>
1454e4f7b:     	nopl	(%rax,%rax)
1454e4f80:     	movq	%r8, %r9
1454e4f83:     	subq	$0x1, %rcx
1454e4f87:     	jb	0x1454e4f9b <.text+0x54e3f9b>
1454e4f89:     	movq	0x50(%rax,%r9,8), %rax
1454e4f8e:     	jmp	0x1454e4f33 <.text+0x54e3f33>
1454e4f90:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454e4f97:     	jmp	0x1454e4fca <.text+0x54e3fca>
1454e4f99:     	xorl	%eax, %eax
1454e4f9b:     	movd	%xmm0, %r8d
1454e4fa0:     	movq	%r15, 0x10(%rbp)
1454e4fa4:     	movq	%rax, 0x18(%rbp)
1454e4fa8:     	movq	$0x0, 0x20(%rbp)
1454e4fb0:     	movq	%r9, 0x28(%rbp)
1454e4fb4:     	movq	$0xd, 0x30(%rbp)
1454e4fbc:     	leaq	-0x30(%rbp), %rcx
1454e4fc0:     	leaq	0x10(%rbp), %rdx
1454e4fc4:     	callq	0x14552a730 <.text+0x5529730>
1454e4fc9:     	nop
1454e4fca:     	movq	-0x8(%rbp), %rax
1454e4fce:     	testq	%rax, %rax
1454e4fd1:     	je	0x1454e503b <.text+0x54e403b>
1454e4fd3:     	movq	(%rbp), %rcx
1454e4fd7:     	movw	$0xe, %dx
1454e4fdb:     	movzwl	0x36(%rax), %r9d
1454e4fe0:     	movl	%r9d, %r10d
1454e4fe3:     	addl	%r10d, %r10d
1454e4fe6:     	movq	$-0x1, %r8
1454e4fed:     	nopl	(%rax)
1454e4ff0:     	testq	%r10, %r10
1454e4ff3:     	je	0x1454e5020 <.text+0x54e4020>
1454e4ff5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454e4ffb:     	seta	%r11b
1454e4fff:     	sbbb	$0x0, %r11b
1454e5003:     	incq	%r8
1454e5006:     	addq	$-0x2, %r10
1454e500a:     	cmpb	$0x1, %r11b
1454e500e:     	je	0x1454e4ff0 <.text+0x54e3ff0>
1454e5010:     	movzbl	%r11b, %r9d
1454e5014:     	testl	%r9d, %r9d
1454e5017:     	je	0x1454e5030 <.text+0x54e4030>
1454e5019:     	jmp	0x1454e5023 <.text+0x54e4023>
1454e501b:     	nopl	(%rax,%rax)
1454e5020:     	movq	%r9, %r8
1454e5023:     	subq	$0x1, %rcx
1454e5027:     	jb	0x1454e503d <.text+0x54e403d>
1454e5029:     	movq	0x50(%rax,%r8,8), %rax
1454e502e:     	jmp	0x1454e4fdb <.text+0x54e3fdb>
1454e5030:     	movl	$0x1, 0x8(%rax,%r8,4)
1454e5039:     	jmp	0x1454e506d <.text+0x54e406d>
1454e503b:     	xorl	%eax, %eax
1454e503d:     	movq	%r15, 0x10(%rbp)
1454e5041:     	movq	%rax, 0x18(%rbp)
1454e5045:     	movq	$0x0, 0x20(%rbp)
1454e504d:     	movq	%r8, 0x28(%rbp)
1454e5051:     	movq	$0xe, 0x30(%rbp)
1454e5059:     	leaq	-0x30(%rbp), %rcx
1454e505d:     	leaq	0x10(%rbp), %rdx
1454e5061:     	movl	$0x1, %r8d
1454e5067:     	callq	0x14552a730 <.text+0x5529730>
1454e506c:     	nop
1454e506d:     	movd	(%rdi), %xmm0
1454e5071:     	movq	-0x8(%rbp), %rax
1454e5075:     	testq	%rax, %rax
1454e5078:     	je	0x1454e50e9 <.text+0x54e40e9>
1454e507a:     	movq	(%rbp), %rcx
1454e507e:     	movw	$0xf, %dx
1454e5082:     	movzwl	0x36(%rax), %r8d
1454e5087:     	movl	%r8d, %r10d
1454e508a:     	addl	%r10d, %r10d
1454e508d:     	movq	$-0x1, %r9
1454e5094:     	nopw	%cs:(%rax,%rax)
1454e50a0:     	testq	%r10, %r10
1454e50a3:     	je	0x1454e50d0 <.text+0x54e40d0>
1454e50a5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454e50ab:     	seta	%r11b
1454e50af:     	sbbb	$0x0, %r11b
1454e50b3:     	incq	%r9
1454e50b6:     	addq	$-0x2, %r10
1454e50ba:     	cmpb	$0x1, %r11b
1454e50be:     	je	0x1454e50a0 <.text+0x54e40a0>
1454e50c0:     	movzbl	%r11b, %r8d
1454e50c4:     	testl	%r8d, %r8d
1454e50c7:     	je	0x1454e50e0 <.text+0x54e40e0>
1454e50c9:     	jmp	0x1454e50d3 <.text+0x54e40d3>
1454e50cb:     	nopl	(%rax,%rax)
1454e50d0:     	movq	%r8, %r9
1454e50d3:     	subq	$0x1, %rcx
1454e50d7:     	jb	0x1454e50eb <.text+0x54e40eb>
1454e50d9:     	movq	0x50(%rax,%r9,8), %rax
1454e50de:     	jmp	0x1454e5082 <.text+0x54e4082>
1454e50e0:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454e50e7:     	jmp	0x1454e511a <.text+0x54e411a>
1454e50e9:     	xorl	%eax, %eax
1454e50eb:     	movd	%xmm0, %r8d
1454e50f0:     	movq	%r15, 0x10(%rbp)
1454e50f4:     	movq	%rax, 0x18(%rbp)
1454e50f8:     	movq	$0x0, 0x20(%rbp)
1454e5100:     	movq	%r9, 0x28(%rbp)
1454e5104:     	movq	$0xf, 0x30(%rbp)
1454e510c:     	leaq	-0x30(%rbp), %rcx
1454e5110:     	leaq	0x10(%rbp), %rdx
1454e5114:     	callq	0x14552a730 <.text+0x5529730>
1454e5119:     	nop
1454e511a:     	movd	0x4(%rdi), %xmm0
1454e511f:     	movq	-0x8(%rbp), %rax
1454e5123:     	testq	%rax, %rax
1454e5126:     	je	0x1454e5199 <.text+0x54e4199>
1454e5128:     	movq	(%rbp), %rcx
1454e512c:     	movw	$0x10, %dx
1454e5130:     	movzwl	0x36(%rax), %r8d
1454e5135:     	movl	%r8d, %r10d
1454e5138:     	addl	%r10d, %r10d
1454e513b:     	movq	$-0x1, %r9
1454e5142:     	nopw	%cs:(%rax,%rax)
1454e5150:     	testq	%r10, %r10
1454e5153:     	je	0x1454e5180 <.text+0x54e4180>
1454e5155:     	cmpw	0x3a(%rax,%r9,2), %dx
1454e515b:     	seta	%r11b
1454e515f:     	sbbb	$0x0, %r11b
1454e5163:     	incq	%r9
1454e5166:     	addq	$-0x2, %r10
1454e516a:     	cmpb	$0x1, %r11b
1454e516e:     	je	0x1454e5150 <.text+0x54e4150>
1454e5170:     	movzbl	%r11b, %r8d
1454e5174:     	testl	%r8d, %r8d
1454e5177:     	je	0x1454e5190 <.text+0x54e4190>
1454e5179:     	jmp	0x1454e5183 <.text+0x54e4183>
1454e517b:     	nopl	(%rax,%rax)
1454e5180:     	movq	%r8, %r9
1454e5183:     	subq	$0x1, %rcx
1454e5187:     	jb	0x1454e519b <.text+0x54e419b>
1454e5189:     	movq	0x50(%rax,%r9,8), %rax
1454e518e:     	jmp	0x1454e5130 <.text+0x54e4130>
1454e5190:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454e5197:     	jmp	0x1454e51ca <.text+0x54e41ca>
1454e5199:     	xorl	%eax, %eax
1454e519b:     	movd	%xmm0, %r8d
1454e51a0:     	movq	%r15, 0x10(%rbp)
1454e51a4:     	movq	%rax, 0x18(%rbp)
1454e51a8:     	movq	$0x0, 0x20(%rbp)
1454e51b0:     	movq	%r9, 0x28(%rbp)
1454e51b4:     	movq	$0x10, 0x30(%rbp)
1454e51bc:     	leaq	-0x30(%rbp), %rcx
1454e51c0:     	leaq	0x10(%rbp), %rdx
1454e51c4:     	callq	0x14552a730 <.text+0x5529730>
1454e51c9:     	nop
1454e51ca:     	movd	0x8(%rdi), %xmm0
1454e51cf:     	movq	-0x8(%rbp), %rax
1454e51d3:     	testq	%rax, %rax
1454e51d6:     	je	0x1454e5249 <.text+0x54e4249>
1454e51d8:     	movq	(%rbp), %rcx
1454e51dc:     	movw	$0x11, %dx
1454e51e0:     	movzwl	0x36(%rax), %r8d
1454e51e5:     	movl	%r8d, %r10d
1454e51e8:     	addl	%r10d, %r10d
1454e51eb:     	movq	$-0x1, %r9
1454e51f2:     	nopw	%cs:(%rax,%rax)
1454e5200:     	testq	%r10, %r10
1454e5203:     	je	0x1454e5230 <.text+0x54e4230>
1454e5205:     	cmpw	0x3a(%rax,%r9,2), %dx
1454e520b:     	seta	%r11b
1454e520f:     	sbbb	$0x0, %r11b
1454e5213:     	incq	%r9
1454e5216:     	addq	$-0x2, %r10
1454e521a:     	cmpb	$0x1, %r11b
1454e521e:     	je	0x1454e5200 <.text+0x54e4200>
1454e5220:     	movzbl	%r11b, %r8d
1454e5224:     	testl	%r8d, %r8d
1454e5227:     	je	0x1454e5240 <.text+0x54e4240>
1454e5229:     	jmp	0x1454e5233 <.text+0x54e4233>
1454e522b:     	nopl	(%rax,%rax)
1454e5230:     	movq	%r8, %r9
1454e5233:     	subq	$0x1, %rcx
1454e5237:     	jb	0x1454e524b <.text+0x54e424b>
1454e5239:     	movq	0x50(%rax,%r9,8), %rax
1454e523e:     	jmp	0x1454e51e0 <.text+0x54e41e0>
1454e5240:     	movd	%xmm0, 0x8(%rax,%r9,4)
1454e5247:     	jmp	0x1454e527a <.text+0x54e427a>
1454e5249:     	xorl	%eax, %eax
1454e524b:     	movd	%xmm0, %r8d
1454e5250:     	movq	%r15, 0x10(%rbp)
1454e5254:     	movq	%rax, 0x18(%rbp)
1454e5258:     	movq	$0x0, 0x20(%rbp)
1454e5260:     	movq	%r9, 0x28(%rbp)
1454e5264:     	movq	$0x11, 0x30(%rbp)
1454e526c:     	leaq	-0x30(%rbp), %rcx
1454e5270:     	leaq	0x10(%rbp), %rdx
1454e5274:     	callq	0x14552a730 <.text+0x5529730>
1454e5279:     	nop
1454e527a:     	movq	-0x8(%rbp), %rax
1454e527e:     	testq	%rax, %rax
1454e5281:     	je	0x1454e52e9 <.text+0x54e42e9>
1454e5283:     	movq	(%rbp), %rcx
1454e5287:     	movw	$0x12, %dx
1454e528b:     	movzwl	0x36(%rax), %r8d
1454e5290:     	movl	%r8d, %r10d
1454e5293:     	addl	%r10d, %r10d
1454e5296:     	movq	$-0x1, %r9
1454e529d:     	nopl	(%rax)
1454e52a0:     	testq	%r10, %r10
1454e52a3:     	je	0x1454e52d0 <.text+0x54e42d0>
1454e52a5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454e52ab:     	seta	%r11b
1454e52af:     	sbbb	$0x0, %r11b
1454e52b3:     	incq	%r9
1454e52b6:     	addq	$-0x2, %r10
1454e52ba:     	cmpb	$0x1, %r11b
1454e52be:     	je	0x1454e52a0 <.text+0x54e42a0>
1454e52c0:     	movzbl	%r11b, %r8d
1454e52c4:     	testl	%r8d, %r8d
1454e52c7:     	je	0x1454e52e0 <.text+0x54e42e0>
1454e52c9:     	jmp	0x1454e52d3 <.text+0x54e42d3>
1454e52cb:     	nopl	(%rax,%rax)
1454e52d0:     	movq	%r8, %r9
1454e52d3:     	subq	$0x1, %rcx
1454e52d7:     	jb	0x1454e52eb <.text+0x54e42eb>
1454e52d9:     	movq	0x50(%rax,%r9,8), %rax
1454e52de:     	jmp	0x1454e528b <.text+0x54e428b>
1454e52e0:     	movss	%xmm7, 0x8(%rax,%r9,4)
1454e52e7:     	jmp	0x1454e531a <.text+0x54e431a>
1454e52e9:     	xorl	%eax, %eax
1454e52eb:     	movd	%xmm7, %r8d
1454e52f0:     	movq	%r15, 0x10(%rbp)
1454e52f4:     	movq	%rax, 0x18(%rbp)
1454e52f8:     	movq	$0x0, 0x20(%rbp)
1454e5300:     	movq	%r9, 0x28(%rbp)
1454e5304:     	movq	$0x12, 0x30(%rbp)
1454e530c:     	leaq	-0x30(%rbp), %rcx
1454e5310:     	leaq	0x10(%rbp), %rdx
1454e5314:     	callq	0x14552a730 <.text+0x5529730>
1454e5319:     	nop
1454e531a:     	movq	-0x8(%rbp), %rax
1454e531e:     	testq	%rax, %rax
1454e5321:     	je	0x1454e538b <.text+0x54e438b>
1454e5323:     	movq	(%rbp), %rcx
1454e5327:     	movw	$0x14, %dx
1454e532b:     	movzwl	0x36(%rax), %r9d
1454e5330:     	movl	%r9d, %r10d
1454e5333:     	addl	%r10d, %r10d
1454e5336:     	movq	$-0x1, %r8
1454e533d:     	nopl	(%rax)
1454e5340:     	testq	%r10, %r10
1454e5343:     	je	0x1454e5370 <.text+0x54e4370>
1454e5345:     	cmpw	0x3a(%rax,%r8,2), %dx
1454e534b:     	seta	%r11b
1454e534f:     	sbbb	$0x0, %r11b
1454e5353:     	incq	%r8
1454e5356:     	addq	$-0x2, %r10
1454e535a:     	cmpb	$0x1, %r11b
1454e535e:     	je	0x1454e5340 <.text+0x54e4340>
1454e5360:     	movzbl	%r11b, %r9d
1454e5364:     	testl	%r9d, %r9d
1454e5367:     	je	0x1454e5380 <.text+0x54e4380>
1454e5369:     	jmp	0x1454e5373 <.text+0x54e4373>
1454e536b:     	nopl	(%rax,%rax)
1454e5370:     	movq	%r9, %r8
1454e5373:     	subq	$0x1, %rcx
1454e5377:     	jb	0x1454e538d <.text+0x54e438d>
1454e5379:     	movq	0x50(%rax,%r8,8), %rax
1454e537e:     	jmp	0x1454e532b <.text+0x54e432b>
1454e5380:     	movl	$0x23, 0x8(%rax,%r8,4)
1454e5389:     	jmp	0x1454e53bd <.text+0x54e43bd>
1454e538b:     	xorl	%eax, %eax
1454e538d:     	movq	%r15, 0x10(%rbp)
1454e5391:     	movq	%rax, 0x18(%rbp)
1454e5395:     	movq	$0x0, 0x20(%rbp)
1454e539d:     	movq	%r8, 0x28(%rbp)
1454e53a1:     	movq	$0x14, 0x30(%rbp)
1454e53a9:     	leaq	-0x30(%rbp), %rcx
1454e53ad:     	leaq	0x10(%rbp), %rdx
1454e53b1:     	movl	$0x23, %r8d
1454e53b7:     	callq	0x14552a730 <.text+0x5529730>
1454e53bc:     	nop
1454e53bd:     	movq	-0x8(%rbp), %rax
1454e53c1:     	testq	%rax, %rax
1454e53c4:     	je	0x1454e542a <.text+0x54e442a>
1454e53c6:     	movq	(%rbp), %rcx
1454e53ca:     	movw	$0x15, %dx
1454e53ce:     	movzwl	0x36(%rax), %r9d
1454e53d3:     	movl	%r9d, %r10d
1454e53d6:     	addl	%r10d, %r10d
1454e53d9:     	movq	$-0x1, %r8
1454e53e0:     	testq	%r10, %r10
1454e53e3:     	je	0x1454e5410 <.text+0x54e4410>
1454e53e5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454e53eb:     	seta	%r11b
1454e53ef:     	sbbb	$0x0, %r11b
1454e53f3:     	incq	%r8
1454e53f6:     	addq	$-0x2, %r10
1454e53fa:     	cmpb	$0x1, %r11b
1454e53fe:     	je	0x1454e53e0 <.text+0x54e43e0>
1454e5400:     	movzbl	%r11b, %r9d
1454e5404:     	testl	%r9d, %r9d
1454e5407:     	je	0x1454e5420 <.text+0x54e4420>
1454e5409:     	jmp	0x1454e5413 <.text+0x54e4413>
1454e540b:     	nopl	(%rax,%rax)
1454e5410:     	movq	%r9, %r8
1454e5413:     	subq	$0x1, %rcx
1454e5417:     	jb	0x1454e542c <.text+0x54e442c>
1454e5419:     	movq	0x50(%rax,%r8,8), %rax
1454e541e:     	jmp	0x1454e53ce <.text+0x54e43ce>
1454e5420:     	movl	-0xc(%rbp), %ecx
1454e5423:     	movl	%ecx, 0x8(%rax,%r8,4)
1454e5428:     	jmp	0x1454e545a <.text+0x54e445a>
1454e542a:     	xorl	%eax, %eax
1454e542c:     	movq	%r15, 0x10(%rbp)
1454e5430:     	movq	%rax, 0x18(%rbp)
1454e5434:     	movq	$0x0, 0x20(%rbp)
1454e543c:     	movq	%r8, 0x28(%rbp)
1454e5440:     	movq	$0x15, 0x30(%rbp)
1454e5448:     	leaq	-0x30(%rbp), %rcx
1454e544c:     	leaq	0x10(%rbp), %rdx
1454e5450:     	movl	-0xc(%rbp), %r8d
1454e5454:     	callq	0x14552a730 <.text+0x5529730>
1454e5459:     	nop
1454e545a:     	movl	$0x0, -0x38(%rbp)
1454e5461:     	movq	$0x0, -0x50(%rbp)
1454e5469:     	movq	$0x1, -0x48(%rbp)
1454e5471:     	movq	$0x0, -0x40(%rbp)
1454e5479:     	movb	$0x1, 0x47(%rbp)
1454e547d:     	movq	%r15, 0x28(%rsp)
1454e5482:     	movss	%xmm7, 0x20(%rsp)
1454e5488:     	leaq	-0x50(%rbp), %rcx
1454e548c:     	movq	%r14, %rdx
1454e548f:     	movb	$0x5, %r8b
1454e5492:     	movq	%rdi, %r9
1454e5495:     	callq	0x145512c90 <.text+0x5511c90>
1454e549a:     	nop
1454e549b:     	movdqu	-0x50(%rbp), %xmm0
1454e54a0:     	movups	-0x40(%rbp), %xmm1
1454e54a4:     	movaps	%xmm1, 0x20(%rbp)
1454e54a8:     	movdqa	%xmm0, 0x10(%rbp)
1454e54ad:     	movb	$0x0, 0x47(%rbp)
1454e54b1:     	leaq	-0x30(%rbp), %rcx
1454e54b5:     	leaq	0x10(%rbp), %rdx
1454e54b9:     	callq	0x145512ef0 <.text+0x5511ef0>
1454e54be:     	nop
1454e54bf:     	movq	0x560(%rsi), %rdi
1454e54c6:     	cmpq	0x550(%rsi), %rdi
1454e54cd:     	jne	0x1454e54dc <.text+0x54e44dc>
1454e54cf:     	leaq	0x550(%rsi), %rcx
1454e54d6:     	callq	0x145774710 <.text+0x5773710>
1454e54db:     	nop
1454e54dc:     	movq	0x558(%rsi), %rax
1454e54e3:     	movq	%rdi, %rcx
1454e54e6:     	shlq	$0x5, %rcx
1454e54ea:     	movups	-0x30(%rbp), %xmm0
1454e54ee:     	movups	-0x20(%rbp), %xmm1
1454e54f2:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e54f7:     	movups	%xmm0, (%rax,%rcx)
1454e54fb:     	incq	%rdi
1454e54fe:     	movq	%rdi, 0x560(%rsi)
1454e5505:     	leaq	-0x8(%rbp), %rcx
1454e5509:     	callq	0x14550cd20 <.text+0x550bd20>
1454e550e:     	movq	%r14, %rax
1454e5511:     	movaps	0x50(%rbp), %xmm6
1454e5515:     	movaps	0x60(%rbp), %xmm7
1454e5519:     	addq	$0xf8, %rsp
1454e5520:     	popq	%rbx
1454e5521:     	popq	%rdi
1454e5522:     	popq	%rsi
1454e5523:     	popq	%r12
1454e5525:     	popq	%r13
1454e5527:     	popq	%r14
1454e5529:     	popq	%r15
1454e552b:     	popq	%rbp
1454e552c:     	retq
