
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403a29f0:     	pushq	%r15
1403a29f2:     	pushq	%r14
1403a29f4:     	pushq	%r13
1403a29f6:     	pushq	%r12
1403a29f8:     	pushq	%rsi
1403a29f9:     	pushq	%rdi
1403a29fa:     	pushq	%rbp
1403a29fb:     	pushq	%rbx
1403a29fc:     	subq	$0x268, %rsp            # imm = 0x268
1403a2a03:     	movaps	%xmm9, 0x250(%rsp)
1403a2a0c:     	movaps	%xmm8, 0x240(%rsp)
1403a2a15:     	movaps	%xmm7, 0x230(%rsp)
1403a2a1d:     	movaps	%xmm6, 0x220(%rsp)
1403a2a25:     	movq	0x2f0(%rsp), %rcx
1403a2a2d:     	movq	0x2d8(%rsp), %rax
1403a2a35:     	movq	(%r8), %rbx
1403a2a38:     	movq	(%rax), %rbp
1403a2a3b:     	cmpb	$0x1, 0xd(%rbx)
1403a2a3f:     	jne	0x1403a2cb2 <.text+0x3a1cb2>
1403a2a45:     	movq	0x2e8(%rsp), %r15
1403a2a4d:     	movq	0x2e0(%rsp), %r12
1403a2a55:     	movq	0x2d0(%rsp), %rax
1403a2a5d:     	movq	(%rdx), %r14
1403a2a60:     	movq	(%r9), %rdi
1403a2a63:     	movq	0x10(%r9), %rsi
1403a2a67:     	movl	0x18(%r9), %r11d
1403a2a6b:     	movl	0x1c(%r9), %r10d
1403a2a6f:     	movq	(%rax), %rdx
1403a2a72:     	movq	0x10(%rax), %r8
1403a2a76:     	movq	%r8, 0x40(%rsp)
1403a2a7b:     	movl	0x18(%rax), %r8d
1403a2a7f:     	movl	%r8d, 0x38(%rsp)
1403a2a84:     	movl	0x1c(%rax), %eax
1403a2a87:     	movq	(%r12), %r8
1403a2a8b:     	movq	%r8, 0x48(%rsp)
1403a2a90:     	movq	0x8(%r12), %r12
1403a2a95:     	movq	(%r15), %r8
1403a2a98:     	movq	%r8, 0x30(%rsp)
1403a2a9d:     	movq	0x8(%r15), %r13
1403a2aa1:     	movzbl	(%rbx), %ebx
1403a2aa4:     	movzbl	0x72(%r14), %r8d
1403a2aa9:     	movb	%r8b, 0x2f(%rsp)
1403a2aae:     	cmpb	$0x1, %r8b
1403a2ab2:     	jne	0x1403a2cae <.text+0x3a1cae>
1403a2ab8:     	cmpb	$0x0, 0x76(%r14)
1403a2abd:     	setne	%r14b
1403a2ac1:     	orb	%bl, %r14b
1403a2ac4:     	testb	$0x1, %r14b
1403a2ac8:     	jne	0x1403a2cb2 <.text+0x3a1cb2>
1403a2ace:     	cmpl	$0x0, (%rcx)
1403a2ad1:     	je	0x1403a2b13 <.text+0x3a1b13>
1403a2ad3:     	movl	%r10d, %r8d
1403a2ad6:     	subl	(%rsi), %r8d
1403a2ad9:     	subl	%r11d, %r10d
1403a2adc:     	cmpl	$0xc233b000, %r10d      # imm = 0xC233B000
1403a2ae3:     	movl	$0xc233b000, %r11d      # imm = 0xC233B000
1403a2ae9:     	cmovael	%r11d, %r10d
1403a2aed:     	cmpl	%r10d, %r8d
1403a2af0:     	jb	0x1403a2b13 <.text+0x3a1b13>
1403a2af2:     	movl	%eax, %r8d
1403a2af5:     	movq	0x40(%rsp), %r9
1403a2afa:     	subl	(%r9), %r8d
1403a2afd:     	subl	0x38(%rsp), %eax
1403a2b01:     	cmpl	$0xc233b000, %eax       # imm = 0xC233B000
1403a2b06:     	cmovbl	%eax, %r11d
1403a2b0a:     	cmpl	%r11d, %r8d
1403a2b0d:     	jae	0x1403a2c0c <.text+0x3a1c0c>
1403a2b13:     	movq	%rbp, 0x38(%rsp)
1403a2b18:     	movzbl	0x38(%rdi), %r8d
1403a2b1d:     	movzbl	0x39(%rdi), %r9d
1403a2b22:     	leaq	0xa0(%rsp), %rsi
1403a2b2a:     	movq	%rsi, %rcx
1403a2b2d:     	callq	0x145423b80 <.text+0x5422b80>
1403a2b32:     	movzbl	0x38(%rdi), %r8d
1403a2b37:     	movzbl	0x39(%rdi), %edx
1403a2b3b:     	leaq	0x138(%rsp), %r9
1403a2b43:     	movq	%rsi, 0x20(%rsp)
1403a2b48:     	leaq	0x54(%rsp), %rcx
1403a2b4d:     	callq	0x145459e90 <.text+0x5458e90>
1403a2b52:     	movl	0x94(%rsp), %eax
1403a2b59:     	orl	0x90(%rsp), %eax
1403a2b60:     	je	0x1403a2b6d <.text+0x3a1b6d>
1403a2b62:     	movl	$0x0, 0x98(%rsp)
1403a2b6d:     	movl	0x3b(%rdi), %eax
1403a2b70:     	movzbl	0x3f(%rdi), %ecx
1403a2b74:     	shlq	$0x20, %rcx
1403a2b78:     	orq	%rax, %rcx
1403a2b7b:     	movzbl	0x39(%rdi), %edx
1403a2b7f:     	movzbl	0x3a(%rdi), %r8d
1403a2b84:     	callq	0x145500d30 <.text+0x54ffd30>
1403a2b89:     	movq	%rax, %rbx
1403a2b8c:     	movl	%ebx, %r14d
1403a2b8f:     	shrl	$0x10, %r14d
1403a2b93:     	movl	%ebx, %r15d
1403a2b96:     	shrl	$0x18, %r15d
1403a2b9a:     	movq	%rax, %rbp
1403a2b9d:     	shrq	$0x20, %rbp
1403a2ba1:     	movzwl	0x39(%rdi), %edi
1403a2ba5:     	leaq	0x188(%rsp), %rcx
1403a2bad:     	leaq	0x54(%rsp), %rdx
1403a2bb2:     	callq	0x1401b0f50 <.text+0x1aff50>
1403a2bb7:     	movq	0x2f0(%rsp), %rsi
1403a2bbf:     	movl	$0x1, (%rsi)
1403a2bc5:     	leaq	0x4(%rsi), %rcx
1403a2bc9:     	movl	$0x98, %r8d
1403a2bcf:     	leaq	0x188(%rsp), %rdx
1403a2bd7:     	callq	0x145756ddd <.text+0x5755ddd>
1403a2bdc:     	movq	%rsi, %rcx
1403a2bdf:     	movw	%di, 0x9c(%rsi)
1403a2be6:     	movb	%bl, 0x9e(%rsi)
1403a2bec:     	movb	%bh, 0x9f(%rsi)
1403a2bf2:     	movb	%r14b, 0xa0(%rsi)
1403a2bf9:     	movb	%r15b, 0xa1(%rsi)
1403a2c00:     	movb	%bpl, 0xa2(%rsi)
1403a2c07:     	movq	0x38(%rsp), %rbp
1403a2c0c:     	cmpb	$0x0, 0x2f(%rsp)
1403a2c11:     	je	0x1403a2d59 <.text+0x3a1d59>
1403a2c17:     	movq	0x48(%rsp), %rsi
1403a2c1c:     	movq	0xf8(%rsi), %r8
1403a2c23:     	movq	0x100(%rsi), %r9
1403a2c2a:     	cmpb	$0x0, 0x108(%rsi)
1403a2c31:     	je	0x1403a2e3d <.text+0x3a1e3d>
1403a2c37:     	shlq	$0x2, %r9
1403a2c3b:     	xorl	%eax, %eax
1403a2c3d:     	xorl	%edx, %edx
1403a2c3f:     	nop
1403a2c40:     	cmpq	%rdx, %r9
1403a2c43:     	je	0x1403a2ed4 <.text+0x3a1ed4>
1403a2c49:     	movl	(%r8,%rdx), %r11d
1403a2c4d:     	movq	0x1a8(%r12), %r10
1403a2c55:     	leaq	(%r11,%r11,8), %r11
1403a2c59:     	addq	$0x4, %rdx
1403a2c5d:     	cmpq	$0x0, 0x10(%r10,%r11,8)
1403a2c63:     	je	0x1403a2c40 <.text+0x3a1c40>
1403a2c65:     	leaq	(%r10,%r11,8), %rdx
1403a2c69:     	movq	0x110(%rsi), %rax
1403a2c70:     	movq	0x118(%rsi), %r8
1403a2c77:     	movq	0x40(%rdx), %r9
1403a2c7b:     	cmpq	%r9, %rax
1403a2c7e:     	jae	0x1403a2f80 <.text+0x3a1f80>
1403a2c84:     	movq	0x38(%rdx), %r10
1403a2c88:     	movq	(%r10,%rax,8), %rax
1403a2c8c:     	testq	%rax, %rax
1403a2c8f:     	je	0x1403a2f80 <.text+0x3a1f80>
1403a2c95:     	movq	0x18(%rdx), %r10
1403a2c99:     	notq	%rax
1403a2c9c:     	leaq	(%rax,%rax,2), %rax
1403a2ca0:     	shlq	$0x4, %rax
1403a2ca4:     	movq	0x10(%r10,%rax), %rax
1403a2ca9:     	jmp	0x1403a2f82 <.text+0x3a1f82>
1403a2cae:     	testb	%bl, %bl
1403a2cb0:     	je	0x1403a2d00 <.text+0x3a1d00>
1403a2cb2:     	movl	$0x0, 0xa0(%rsp)
1403a2cbd:     	movl	(%rcx), %esi
1403a2cbf:     	leaq	0xa0(%rsp), %rdx
1403a2cc7:     	movl	$0xa4, %r8d
1403a2ccd:     	callq	0x145756ddd <.text+0x5755ddd>
1403a2cd2:     	cmpl	$0x1, %esi
1403a2cd5:     	jne	0x1403a3297 <.text+0x3a2297>
1403a2cdb:     	movss	(%rbp), %xmm1
1403a2ce0:     	movl	$0x0, 0x20(%rsp)
1403a2ce8:     	leaq	0xa0(%rsp), %rcx
1403a2cf0:     	movss	0x5548788(%rip), %xmm2  # 0x1458eb480
1403a2cf8:     	xorl	%r9d, %r9d
1403a2cfb:     	jmp	0x1403a3292 <.text+0x3a2292>
1403a2d00:     	movq	0x30(%rsp), %r8
1403a2d05:     	movq	0xf8(%r8), %rbx
1403a2d0c:     	movq	0x100(%r8), %r14
1403a2d13:     	cmpb	$0x0, 0x108(%r8)
1403a2d1b:     	je	0x1403a2e02 <.text+0x3a1e02>
1403a2d21:     	shlq	$0x2, %r14
1403a2d25:     	xorl	%r15d, %r15d
1403a2d28:     	nopl	(%rax,%rax)
1403a2d30:     	cmpq	%r15, %r14
1403a2d33:     	je	0x1403a2cb2 <.text+0x3a1cb2>
1403a2d39:     	movl	(%rbx,%r15), %r8d
1403a2d3d:     	movq	0x1a8(%r13), %r9
1403a2d44:     	leaq	(%r8,%r8,8), %r8
1403a2d48:     	addq	$0x4, %r15
1403a2d4c:     	cmpq	$0x0, 0x10(%r9,%r8,8)
1403a2d52:     	je	0x1403a2d30 <.text+0x3a1d30>
1403a2d54:     	jmp	0x1403a2ace <.text+0x3a1ace>
1403a2d59:     	movq	0x30(%rsp), %rax
1403a2d5e:     	movq	0xf8(%rax), %r8
1403a2d65:     	movq	0x100(%rax), %r9
1403a2d6c:     	cmpb	$0x0, 0x108(%rax)
1403a2d73:     	je	0x1403a2ed9 <.text+0x3a1ed9>
1403a2d79:     	shlq	$0x2, %r9
1403a2d7d:     	xorl	%eax, %eax
1403a2d7f:     	xorl	%edx, %edx
1403a2d81:     	nopw	%cs:(%rax,%rax)
1403a2d90:     	cmpq	%rdx, %r9
1403a2d93:     	je	0x1403a2f7b <.text+0x3a1f7b>
1403a2d99:     	movl	(%r8,%rdx), %r11d
1403a2d9d:     	movq	0x1a8(%r13), %r10
1403a2da4:     	leaq	(%r11,%r11,8), %r11
1403a2da8:     	addq	$0x4, %rdx
1403a2dac:     	cmpq	$0x0, 0x10(%r10,%r11,8)
1403a2db2:     	je	0x1403a2d90 <.text+0x3a1d90>
1403a2db4:     	leaq	(%r10,%r11,8), %rdx
1403a2db8:     	movq	0x30(%rsp), %r8
1403a2dbd:     	movq	0x110(%r8), %rax
1403a2dc4:     	movq	0x118(%r8), %r8
1403a2dcb:     	movq	0x40(%rdx), %r9
1403a2dcf:     	cmpq	%r9, %rax
1403a2dd2:     	jae	0x1403a2fb5 <.text+0x3a1fb5>
1403a2dd8:     	movq	0x38(%rdx), %r10
1403a2ddc:     	movq	(%r10,%rax,8), %rax
1403a2de0:     	testq	%rax, %rax
1403a2de3:     	je	0x1403a2fb5 <.text+0x3a1fb5>
1403a2de9:     	movq	0x18(%rdx), %r10
1403a2ded:     	notq	%rax
1403a2df0:     	leaq	(%rax,%rax,2), %rax
1403a2df4:     	shlq	$0x4, %rax
1403a2df8:     	movq	0x10(%r10,%rax), %rax
1403a2dfd:     	jmp	0x1403a2fb7 <.text+0x3a1fb7>
1403a2e02:     	shlq	$0x2, %r14
1403a2e06:     	xorl	%r15d, %r15d
1403a2e09:     	nopl	(%rax)
1403a2e10:     	cmpq	%r15, %r14
1403a2e13:     	je	0x1403a2cb2 <.text+0x3a1cb2>
1403a2e19:     	movl	(%rbx,%r15), %r8d
1403a2e1d:     	movq	0x108(%r13), %r9
1403a2e24:     	leaq	(%r8,%r8,4), %r8
1403a2e28:     	shlq	$0x5, %r8
1403a2e2c:     	addq	$0x4, %r15
1403a2e30:     	cmpq	$0x0, 0x58(%r9,%r8)
1403a2e36:     	je	0x1403a2e10 <.text+0x3a1e10>
1403a2e38:     	jmp	0x1403a2ace <.text+0x3a1ace>
1403a2e3d:     	shlq	$0x2, %r9
1403a2e41:     	xorl	%eax, %eax
1403a2e43:     	xorl	%r10d, %r10d
1403a2e46:     	nopw	%cs:(%rax,%rax)
1403a2e50:     	cmpq	%r10, %r9
1403a2e53:     	je	0x1403a2ed4 <.text+0x3a1ed4>
1403a2e55:     	movl	(%r8,%r10), %r11d
1403a2e59:     	movq	0x108(%r12), %rdx
1403a2e61:     	leaq	(%r11,%r11,4), %r11
1403a2e65:     	shlq	$0x5, %r11
1403a2e69:     	addq	$0x4, %r10
1403a2e6d:     	cmpq	$0x0, 0x58(%rdx,%r11)
1403a2e73:     	je	0x1403a2e50 <.text+0x3a1e50>
1403a2e75:     	addq	%r11, %rdx
1403a2e78:     	movl	0x94(%rdx), %eax
1403a2e7e:     	movq	0x1a8(%r12), %r10
1403a2e86:     	leaq	(%rax,%rax,8), %r11
1403a2e8a:     	leaq	(%r10,%r11,8), %r8
1403a2e8e:     	movq	0x110(%rsi), %rax
1403a2e95:     	movq	0x118(%rsi), %r9
1403a2e9c:     	movq	0x40(%r10,%r11,8), %r10
1403a2ea1:     	cmpq	%r10, %rax
1403a2ea4:     	jae	0x1403a2fe6 <.text+0x3a1fe6>
1403a2eaa:     	movq	0x38(%r8), %r11
1403a2eae:     	movq	(%r11,%rax,8), %rax
1403a2eb2:     	testq	%rax, %rax
1403a2eb5:     	je	0x1403a2fe6 <.text+0x3a1fe6>
1403a2ebb:     	movq	0x18(%r8), %r11
1403a2ebf:     	notq	%rax
1403a2ec2:     	leaq	(%rax,%rax,2), %rax
1403a2ec6:     	shlq	$0x4, %rax
1403a2eca:     	movq	0x10(%r11,%rax), %rax
1403a2ecf:     	jmp	0x1403a2fe8 <.text+0x3a1fe8>
1403a2ed4:     	jmp	0x1403a306a <.text+0x3a206a>
1403a2ed9:     	shlq	$0x2, %r9
1403a2edd:     	xorl	%eax, %eax
1403a2edf:     	xorl	%r10d, %r10d
1403a2ee2:     	nopw	%cs:(%rax,%rax)
1403a2ef0:     	cmpq	%r10, %r9
1403a2ef3:     	je	0x1403a2f7b <.text+0x3a1f7b>
1403a2ef9:     	movl	(%r8,%r10), %r11d
1403a2efd:     	movq	0x108(%r13), %rdx
1403a2f04:     	leaq	(%r11,%r11,4), %r11
1403a2f08:     	shlq	$0x5, %r11
1403a2f0c:     	addq	$0x4, %r10
1403a2f10:     	cmpq	$0x0, 0x58(%rdx,%r11)
1403a2f16:     	je	0x1403a2ef0 <.text+0x3a1ef0>
1403a2f18:     	addq	%r11, %rdx
1403a2f1b:     	movl	0x94(%rdx), %eax
1403a2f21:     	movq	0x1a8(%r13), %r10
1403a2f28:     	leaq	(%rax,%rax,8), %r11
1403a2f2c:     	leaq	(%r10,%r11,8), %r8
1403a2f30:     	movq	0x30(%rsp), %r9
1403a2f35:     	movq	0x110(%r9), %rax
1403a2f3c:     	movq	0x118(%r9), %r9
1403a2f43:     	movq	0x40(%r10,%r11,8), %r10
1403a2f48:     	cmpq	%r10, %rax
1403a2f4b:     	jae	0x1403a3010 <.text+0x3a2010>
1403a2f51:     	movq	0x38(%r8), %r11
1403a2f55:     	movq	(%r11,%rax,8), %rax
1403a2f59:     	testq	%rax, %rax
1403a2f5c:     	je	0x1403a3010 <.text+0x3a2010>
1403a2f62:     	movq	0x18(%r8), %r11
1403a2f66:     	notq	%rax
1403a2f69:     	leaq	(%rax,%rax,2), %rax
1403a2f6d:     	shlq	$0x4, %rax
1403a2f71:     	movq	0x10(%r11,%rax), %rax
1403a2f76:     	jmp	0x1403a3012 <.text+0x3a2012>
1403a2f7b:     	jmp	0x1403a317d <.text+0x3a217d>
1403a2f80:     	xorl	%eax, %eax
1403a2f82:     	cmpq	%r9, %r8
1403a2f85:     	jae	0x1403a3045 <.text+0x3a2045>
1403a2f8b:     	movq	0x38(%rdx), %r9
1403a2f8f:     	movq	(%r9,%r8,8), %r8
1403a2f93:     	testq	%r8, %r8
1403a2f96:     	je	0x1403a3045 <.text+0x3a2045>
1403a2f9c:     	movq	0x18(%rdx), %rdx
1403a2fa0:     	notq	%r8
1403a2fa3:     	leaq	(%r8,%r8,2), %r8
1403a2fa7:     	shlq	$0x4, %r8
1403a2fab:     	movq	0x10(%rdx,%r8), %rdx
1403a2fb0:     	jmp	0x1403a306a <.text+0x3a206a>
1403a2fb5:     	xorl	%eax, %eax
1403a2fb7:     	cmpq	%r9, %r8
1403a2fba:     	jae	0x1403a3049 <.text+0x3a2049>
1403a2fc0:     	movq	0x38(%rdx), %r9
1403a2fc4:     	movq	(%r9,%r8,8), %r8
1403a2fc8:     	testq	%r8, %r8
1403a2fcb:     	je	0x1403a3049 <.text+0x3a2049>
1403a2fcd:     	movq	0x18(%rdx), %rdx
1403a2fd1:     	notq	%r8
1403a2fd4:     	leaq	(%r8,%r8,2), %r8
1403a2fd8:     	shlq	$0x4, %r8
1403a2fdc:     	movq	0x10(%rdx,%r8), %rdx
1403a2fe1:     	jmp	0x1403a317d <.text+0x3a217d>
1403a2fe6:     	xorl	%eax, %eax
1403a2fe8:     	cmpq	%r10, %r9
1403a2feb:     	jae	0x1403a3050 <.text+0x3a2050>
1403a2fed:     	movq	0x38(%r8), %r10
1403a2ff1:     	movq	(%r10,%r9,8), %r9
1403a2ff5:     	testq	%r9, %r9
1403a2ff8:     	je	0x1403a3050 <.text+0x3a2050>
1403a2ffa:     	movq	0x18(%r8), %r8
1403a2ffe:     	notq	%r9
1403a3001:     	leaq	(%r9,%r9,2), %r9
1403a3005:     	shlq	$0x4, %r9
1403a3009:     	movq	0x10(%r8,%r9), %r8
1403a300e:     	jmp	0x1403a3053 <.text+0x3a2053>
1403a3010:     	xorl	%eax, %eax
1403a3012:     	cmpq	%r10, %r9
1403a3015:     	jae	0x1403a3163 <.text+0x3a2163>
1403a301b:     	movq	0x38(%r8), %r10
1403a301f:     	movq	(%r10,%r9,8), %r9
1403a3023:     	testq	%r9, %r9
1403a3026:     	je	0x1403a3163 <.text+0x3a2163>
1403a302c:     	movq	0x18(%r8), %r8
1403a3030:     	notq	%r9
1403a3033:     	leaq	(%r9,%r9,2), %r9
1403a3037:     	shlq	$0x4, %r9
1403a303b:     	movq	0x10(%r8,%r9), %r8
1403a3040:     	jmp	0x1403a3166 <.text+0x3a2166>
1403a3045:     	xorl	%edx, %edx
1403a3047:     	jmp	0x1403a306a <.text+0x3a206a>
1403a3049:     	xorl	%edx, %edx
1403a304b:     	jmp	0x1403a317d <.text+0x3a217d>
1403a3050:     	xorl	%r8d, %r8d
1403a3053:     	movq	0x50(%rdx), %rdx
1403a3057:     	movl	0x8(%rdx), %edx
1403a305a:     	notl	%edx
1403a305c:     	imulq	$0x68, %rdx, %r9
1403a3060:     	addq	%r9, %rax
1403a3063:     	shlq	$0x5, %rdx
1403a3067:     	addq	%r8, %rdx
1403a306a:     	testq	%rax, %rax
1403a306d:     	je	0x1403a3148 <.text+0x3a2148>
1403a3073:     	movaps	(%rdx), %xmm1
1403a3076:     	movaps	%xmm1, %xmm0
1403a3079:     	shufps	$0xeb, %xmm1, %xmm0     # xmm0 = xmm0[3,2],xmm1[2,3]
1403a307d:     	mulps	%xmm1, %xmm0
1403a3080:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1403a3084:     	subss	%xmm2, %xmm0
1403a3088:     	movaps	0x5555ec1(%rip), %xmm2  # 0x1458f8f50
1403a308f:     	movaps	%xmm0, %xmm3
1403a3092:     	andps	%xmm2, %xmm3
1403a3095:     	orps	0x5590a34(%rip), %xmm3  # 0x145933ad0
1403a309c:     	cmpunordss	%xmm0, %xmm0
1403a30a1:     	movss	0x55483db(%rip), %xmm4  # 0x1458eb484
1403a30a9:     	andps	%xmm0, %xmm4
1403a30ac:     	andnps	%xmm3, %xmm0
1403a30af:     	orps	%xmm0, %xmm4
1403a30b2:     	movaps	%xmm1, %xmm0
1403a30b5:     	mulps	%xmm1, %xmm0
1403a30b8:     	movshdup	%xmm0, %xmm3            # xmm3 = xmm0[1,1,3,3]
1403a30bc:     	addss	%xmm0, %xmm3
1403a30c0:     	sqrtss	%xmm3, %xmm6
1403a30c4:     	mulss	%xmm4, %xmm6
1403a30c8:     	shufps	$0xff, %xmm1, %xmm1     # xmm1 = xmm1[3,3,3,3]
1403a30cc:     	movaps	%xmm0, %xmm3
1403a30cf:     	shufps	$0xff, %xmm0, %xmm3     # xmm3 = xmm3[3,3],xmm0[3,3]
1403a30d3:     	movhlps	%xmm0, %xmm0            # xmm0 = xmm0[1,1]
1403a30d6:     	addss	%xmm3, %xmm0
1403a30da:     	sqrtss	%xmm0, %xmm7
1403a30de:     	movss	0x8(%rdx), %xmm0
1403a30e3:     	xorps	%xmm2, %xmm0
1403a30e6:     	mulss	0x30(%rax), %xmm6
1403a30eb:     	mulss	0x34(%rax), %xmm7
1403a30f0:     	movq	%rcx, %rsi
1403a30f3:     	callq	0x145756e37 <.text+0x5755e37>
1403a30f8:     	movaps	%xmm6, %xmm0
1403a30fb:     	callq	0x145756e1f <.text+0x5755e1f>
1403a3100:     	movaps	%xmm0, %xmm6
1403a3103:     	movaps	%xmm7, %xmm0
1403a3106:     	callq	0x145756e1f <.text+0x5755e1f>
1403a310b:     	movq	%rsi, %rcx
1403a310e:     	cvttss2si	%xmm6, %r9
1403a3113:     	xorl	%edx, %edx
1403a3115:     	xorps	%xmm1, %xmm1
1403a3118:     	ucomiss	%xmm1, %xmm6
1403a311b:     	cmovbl	%edx, %r9d
1403a311f:     	movss	0x55483f5(%rip), %xmm2  # 0x1458eb51c
1403a3127:     	ucomiss	%xmm2, %xmm6
1403a312a:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1403a3130:     	cmoval	%r8d, %r9d
1403a3134:     	cvttss2si	%xmm0, %rax
1403a3139:     	ucomiss	%xmm1, %xmm0
1403a313c:     	cmovbl	%edx, %eax
1403a313f:     	ucomiss	%xmm2, %xmm0
1403a3142:     	cmoval	%r8d, %eax
1403a3146:     	jmp	0x1403a314d <.text+0x3a214d>
1403a3148:     	xorl	%r9d, %r9d
1403a314b:     	xorl	%eax, %eax
1403a314d:     	movss	(%rbp), %xmm1
1403a3152:     	movl	%eax, 0x20(%rsp)
1403a3156:     	movss	0x55ac216(%rip), %xmm2  # 0x14594f374
1403a315e:     	jmp	0x1403a3292 <.text+0x3a2292>
1403a3163:     	xorl	%r8d, %r8d
1403a3166:     	movq	0x50(%rdx), %rdx
1403a316a:     	movl	0x8(%rdx), %edx
1403a316d:     	notl	%edx
1403a316f:     	imulq	$0x68, %rdx, %r9
1403a3173:     	addq	%r9, %rax
1403a3176:     	shlq	$0x5, %rdx
1403a317a:     	addq	%r8, %rdx
1403a317d:     	testq	%rax, %rax
1403a3180:     	je	0x1403a3279 <.text+0x3a2279>
1403a3186:     	movss	0x30(%rax), %xmm9
1403a318c:     	movss	0x34(%rax), %xmm8
1403a3192:     	movaps	(%rdx), %xmm1
1403a3195:     	movaps	%xmm1, %xmm0
1403a3198:     	shufps	$0xeb, %xmm1, %xmm0     # xmm0 = xmm0[3,2],xmm1[2,3]
1403a319c:     	mulps	%xmm1, %xmm0
1403a319f:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
1403a31a3:     	subss	%xmm2, %xmm0
1403a31a7:     	movaps	0x5555da2(%rip), %xmm2  # 0x1458f8f50
1403a31ae:     	movaps	%xmm0, %xmm3
1403a31b1:     	andps	%xmm2, %xmm3
1403a31b4:     	orps	0x5590915(%rip), %xmm3  # 0x145933ad0
1403a31bb:     	cmpunordss	%xmm0, %xmm0
1403a31c0:     	movss	0x55482bc(%rip), %xmm4  # 0x1458eb484
1403a31c8:     	andps	%xmm0, %xmm4
1403a31cb:     	andnps	%xmm3, %xmm0
1403a31ce:     	orps	%xmm0, %xmm4
1403a31d1:     	movaps	%xmm1, %xmm0
1403a31d4:     	mulps	%xmm1, %xmm0
1403a31d7:     	movshdup	%xmm0, %xmm3            # xmm3 = xmm0[1,1,3,3]
1403a31db:     	addss	%xmm0, %xmm3
1403a31df:     	sqrtss	%xmm3, %xmm6
1403a31e3:     	mulss	%xmm4, %xmm6
1403a31e7:     	shufps	$0xff, %xmm1, %xmm1     # xmm1 = xmm1[3,3,3,3]
1403a31eb:     	movaps	%xmm0, %xmm3
1403a31ee:     	shufps	$0xff, %xmm0, %xmm3     # xmm3 = xmm3[3,3],xmm0[3,3]
1403a31f2:     	movhlps	%xmm0, %xmm0            # xmm0 = xmm0[1,1]
1403a31f5:     	addss	%xmm3, %xmm0
1403a31f9:     	sqrtss	%xmm0, %xmm7
1403a31fd:     	movss	0x8(%rdx), %xmm0
1403a3202:     	xorps	%xmm2, %xmm0
1403a3205:     	movq	%rcx, %rsi
1403a3208:     	callq	0x145756e37 <.text+0x5755e37>
1403a320d:     	mulss	%xmm9, %xmm6
1403a3212:     	mulss	%xmm8, %xmm7
1403a3217:     	movaps	%xmm6, %xmm0
1403a321a:     	callq	0x145756e1f <.text+0x5755e1f>
1403a321f:     	movaps	%xmm0, %xmm6
1403a3222:     	movaps	%xmm7, %xmm0
1403a3225:     	callq	0x145756e1f <.text+0x5755e1f>
1403a322a:     	movaps	%xmm9, %xmm2
1403a322e:     	movq	%rsi, %rcx
1403a3231:     	cvttss2si	%xmm6, %r9
1403a3236:     	xorl	%edx, %edx
1403a3238:     	xorps	%xmm1, %xmm1
1403a323b:     	ucomiss	%xmm1, %xmm6
1403a323e:     	cmovbl	%edx, %r9d
1403a3242:     	movss	0x55482d2(%rip), %xmm3  # 0x1458eb51c
1403a324a:     	ucomiss	%xmm3, %xmm6
1403a324d:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1403a3253:     	cmoval	%r8d, %r9d
1403a3257:     	cvttss2si	%xmm0, %rax
1403a325c:     	ucomiss	%xmm1, %xmm0
1403a325f:     	cmovbl	%edx, %eax
1403a3262:     	ucomiss	%xmm3, %xmm0
1403a3265:     	cmoval	%r8d, %eax
1403a3269:     	maxss	0x554820e(%rip), %xmm8  # 0x1458eb480
1403a3272:     	divss	%xmm8, %xmm2
1403a3277:     	jmp	0x1403a3286 <.text+0x3a2286>
1403a3279:     	xorl	%eax, %eax
1403a327b:     	movss	0x55481fd(%rip), %xmm2  # 0x1458eb480
1403a3283:     	xorl	%r9d, %r9d
1403a3286:     	movl	%eax, 0x20(%rsp)
1403a328a:     	movss	0x5548276(%rip), %xmm1  # 0x1458eb508
1403a3292:     	callq	0x1407a1f50 <.text+0x7a0f50>
1403a3297:     	movaps	0x220(%rsp), %xmm6
1403a329f:     	movaps	0x230(%rsp), %xmm7
1403a32a7:     	movaps	0x240(%rsp), %xmm8
1403a32b0:     	movaps	0x250(%rsp), %xmm9
1403a32b9:     	addq	$0x268, %rsp            # imm = 0x268
1403a32c0:     	popq	%rbx
1403a32c1:     	popq	%rbp
1403a32c2:     	popq	%rdi
1403a32c3:     	popq	%rsi
1403a32c4:     	popq	%r12
1403a32c6:     	popq	%r13
1403a32c8:     	popq	%r14
1403a32ca:     	popq	%r15
1403a32cc:     	retq
