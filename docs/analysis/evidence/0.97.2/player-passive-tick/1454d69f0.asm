
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d69f0:     	pushq	%rbp
1454d69f1:     	pushq	%r15
1454d69f3:     	pushq	%r14
1454d69f5:     	pushq	%rsi
1454d69f6:     	pushq	%rdi
1454d69f7:     	pushq	%rbx
1454d69f8:     	subq	$0x158, %rsp            # imm = 0x158
1454d69ff:     	leaq	0x80(%rsp), %rbp
1454d6a07:     	movaps	%xmm9, 0xc0(%rbp)
1454d6a0f:     	movaps	%xmm8, 0xb0(%rbp)
1454d6a17:     	movaps	%xmm7, 0xa0(%rbp)
1454d6a1e:     	movaps	%xmm6, 0x90(%rbp)
1454d6a25:     	movq	$-0x2, 0x88(%rbp)
1454d6a30:     	movss	0x414af4(%rip), %xmm0   # 0x1458eb52c
1454d6a38:     	ucomiss	0x7c4(%rcx), %xmm0
1454d6a3f:     	ja	0x1454d6e81 <.text+0x54d5e81>
1454d6a45:     	movq	%rcx, %rsi
1454d6a48:     	movss	0x8e4(%rcx), %xmm0
1454d6a50:     	movq	0x730(%rcx), %rcx
1454d6a57:     	movss	0x514871(%rip), %xmm1   # 0x1459eb2d0
1454d6a5f:     	testq	%rcx, %rcx
1454d6a62:     	je	0x1454d6abf <.text+0x54d5abf>
1454d6a64:     	movq	0x728(%rsi), %rax
1454d6a6b:     	shlq	$0x3, %rcx
1454d6a6f:     	leaq	(%rcx,%rcx,2), %rdx
1454d6a73:     	xorl	%ecx, %ecx
1454d6a75:     	movabsq	$0x676172646f6f6c62, %r8 # imm = 0x676172646F6F6C62
1454d6a7f:     	jmp	0x1454d6a99 <.text+0x54d5a99>
1454d6a81:     	nopw	%cs:(%rax,%rax)
1454d6a90:     	addq	$0x18, %rcx
1454d6a94:     	cmpq	%rcx, %rdx
1454d6a97:     	je	0x1454d6abf <.text+0x54d5abf>
1454d6a99:     	cmpq	$0x9, 0x8(%rax,%rcx)
1454d6a9f:     	jne	0x1454d6a90 <.text+0x54d5a90>
1454d6aa1:     	movq	(%rax,%rcx), %r9
1454d6aa5:     	movq	(%r9), %r10
1454d6aa8:     	xorq	%r8, %r10
1454d6aab:     	movzbl	0x8(%r9), %r9d
1454d6ab0:     	xorq	$0x65, %r9
1454d6ab4:     	orq	%r10, %r9
1454d6ab7:     	jne	0x1454d6a90 <.text+0x54d5a90>
1454d6ab9:     	movss	0x10(%rax,%rcx), %xmm1
1454d6abf:     	ucomiss	%xmm1, %xmm0
1454d6ac2:     	jb	0x1454d6e81 <.text+0x54d5e81>
1454d6ac8:     	movq	0x2a0(%rsi), %rcx
1454d6acf:     	testq	%rcx, %rcx
1454d6ad2:     	je	0x1454d6e81 <.text+0x54d5e81>
1454d6ad8:     	movq	0x298(%rsi), %rax
1454d6adf:     	imulq	$0x58, %rcx, %rdx
1454d6ae3:     	xorl	%ecx, %ecx
1454d6ae5:     	movabsq	$0x676172646f6f6c62, %r8 # imm = 0x676172646F6F6C62
1454d6aef:     	jmp	0x1454d6b0d <.text+0x54d5b0d>
1454d6af1:     	nopw	%cs:(%rax,%rax)
1454d6b00:     	addq	$0x58, %rcx
1454d6b04:     	cmpq	%rcx, %rdx
1454d6b07:     	je	0x1454d6e81 <.text+0x54d5e81>
1454d6b0d:     	movq	(%rax,%rcx), %rdi
1454d6b11:     	cmpq	$0x9, 0x8(%rdi)
1454d6b16:     	jne	0x1454d6b00 <.text+0x54d5b00>
1454d6b18:     	movq	(%rdi), %r9
1454d6b1b:     	movq	(%r9), %r10
1454d6b1e:     	xorq	%r8, %r10
1454d6b21:     	movzbl	0x8(%r9), %r9d
1454d6b26:     	xorq	$0x65, %r9
1454d6b2a:     	orq	%r10, %r9
1454d6b2d:     	jne	0x1454d6b00 <.text+0x54d5b00>
1454d6b2f:     	movl	0x8(%rax,%rcx), %edx
1454d6b33:     	movss	0x14(%rax,%rcx), %xmm0
1454d6b39:     	movl	0x18(%rax,%rcx), %r8d
1454d6b3e:     	movl	0x34(%rax,%rcx), %r9d
1454d6b43:     	movl	%r9d, 0x4(%rbp)
1454d6b47:     	movups	0x24(%rax,%rcx), %xmm1
1454d6b4c:     	movups	%xmm1, -0xc(%rbp)
1454d6b50:     	movups	0x38(%rax,%rcx), %xmm1
1454d6b55:     	movups	0x44(%rax,%rcx), %xmm2
1454d6b5a:     	movups	%xmm1, 0x8(%rbp)
1454d6b5e:     	movups	%xmm2, 0x14(%rbp)
1454d6b62:     	movq	%rdi, -0x30(%rbp)
1454d6b66:     	movl	%edx, -0x28(%rbp)
1454d6b69:     	movss	0x10(%rax,%rcx), %xmm7
1454d6b6f:     	movsd	0xc(%rax,%rcx), %xmm1
1454d6b75:     	movsd	%xmm1, -0x24(%rbp)
1454d6b7a:     	movss	%xmm0, -0x1c(%rbp)
1454d6b7f:     	movl	%r8d, -0x18(%rbp)
1454d6b83:     	movsd	0x1c(%rax,%rcx), %xmm0
1454d6b89:     	movsd	%xmm0, -0x14(%rbp)
1454d6b8e:     	movss	0x458(%rsi), %xmm8
1454d6b97:     	movss	0x45c(%rsi), %xmm6
1454d6b9f:     	movss	0x480(%rsi), %xmm1
1454d6ba7:     	movl	0x3f0(%rsi), %eax
1454d6bad:     	movl	%eax, 0x40(%rbp)
1454d6bb0:     	movq	0x3e8(%rsi), %rax
1454d6bb7:     	movq	%rax, 0x38(%rbp)
1454d6bbb:     	mulss	0x14(%rbp), %xmm0
1454d6bc0:     	mulss	0x50(%rdi), %xmm0
1454d6bc5:     	mulss	%xmm1, %xmm0
1454d6bc9:     	movss	0x725843(%rip), %xmm1   # 0x145bfc414
1454d6bd1:     	ucomiss	%xmm0, %xmm1
1454d6bd4:     	jae	0x1454d6bfe <.text+0x54d5bfe>
1454d6bd6:     	addss	0x14b7ff2(%rip), %xmm0  # 0x14698ebd0
1454d6bde:     	movss	0x4221f9(%rip), %xmm9   # 0x1458f8de0
1454d6be7:     	divss	%xmm9, %xmm0
1454d6bec:     	callq	0x145756f57 <.text+0x5755f57>
1454d6bf1:     	mulss	%xmm9, %xmm0
1454d6bf6:     	addss	0x725816(%rip), %xmm0   # 0x145bfc414
1454d6bfe:     	movq	$0x0, 0x28(%rsp)
1454d6c07:     	movq	$0x8, 0x20(%rsp)
1454d6c10:     	leaq	0x58(%rbp), %rcx
1454d6c14:     	leaq	0x38(%rbp), %r8
1454d6c18:     	movq	%rsi, %rdx
1454d6c1b:     	movaps	%xmm0, %xmm3
1454d6c1e:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454d6c23:     	movq	0x68(%rbp), %rbx
1454d6c27:     	testq	%rbx, %rbx
1454d6c2a:     	je	0x1454d6d04 <.text+0x54d5d04>
1454d6c30:     	movl	$0x0, 0x7c4(%rsi)
1454d6c3a:     	movb	$0x1, 0x87(%rbp)
1454d6c41:     	leaq	-0x30(%rbp), %rdx
1454d6c45:     	movq	%rsi, %rcx
1454d6c48:     	callq	0x1454d49e0 <.text+0x54d39e0>
1454d6c4d:     	nop
1454d6c4e:     	movq	0x3d0(%rsi), %rdx
1454d6c55:     	movq	0x60(%rbp), %r9
1454d6c59:     	movl	$0x2, -0x40(%rbp)
1454d6c60:     	movl	$0x0, 0x2c(%rbp)
1454d6c67:     	movb	$0x1, 0x87(%rbp)
1454d6c6e:     	leaq	0x2c(%rbp), %rax
1454d6c72:     	movq	%rax, 0x30(%rsp)
1454d6c77:     	leaq	-0x40(%rbp), %rax
1454d6c7b:     	movq	%rax, 0x28(%rsp)
1454d6c80:     	movq	%rbx, 0x20(%rsp)
1454d6c85:     	leaq	0x38(%rbp), %rcx
1454d6c89:     	movl	$0x147e, %r8d           # imm = 0x147E
1454d6c8f:     	movq	%r9, 0x78(%rbp)
1454d6c93:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454d6c98:     	nop
1454d6c99:     	movq	0x548(%rsi), %r14
1454d6ca0:     	cmpq	0x538(%rsi), %r14
1454d6ca7:     	jne	0x1454d6cb6 <.text+0x54d5cb6>
1454d6ca9:     	leaq	0x538(%rsi), %rcx
1454d6cb0:     	callq	0x1457580b0 <.text+0x57570b0>
1454d6cb5:     	nop
1454d6cb6:     	movq	0x540(%rsi), %rax
1454d6cbd:     	movq	%r14, %rcx
1454d6cc0:     	shlq	$0x5, %rcx
1454d6cc4:     	movups	0x38(%rbp), %xmm0
1454d6cc8:     	movups	0x48(%rbp), %xmm1
1454d6ccc:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d6cd1:     	movups	%xmm0, (%rax,%rcx)
1454d6cd5:     	incq	%r14
1454d6cd8:     	movq	%r14, 0x548(%rsi)
1454d6cdf:     	movss	0x44(%rdi), %xmm1
1454d6ce4:     	movss	0x8(%rbp), %xmm0
1454d6ce9:     	movzbl	0x75(%rdi), %eax
1454d6ced:     	addb	$-0x2, %al
1454d6cef:     	cmpb	$0x6, %al
1454d6cf1:     	ja	0x1454d6d1e <.text+0x54d5d1e>
1454d6cf3:     	movzbl	%al, %eax
1454d6cf6:     	leaq	0x14d5d9f(%rip), %rcx   # 0x1469aca9c
1454d6cfd:     	movss	(%rcx,%rax,4), %xmm2
1454d6d02:     	jmp	0x1454d6d26 <.text+0x54d5d26>
1454d6d04:     	movq	0x58(%rbp), %rdx
1454d6d08:     	testq	%rdx, %rdx
1454d6d0b:     	je	0x1454d6e81 <.text+0x54d5e81>
1454d6d11:     	movq	0x60(%rbp), %rax
1454d6d15:     	movq	%rax, 0x78(%rbp)
1454d6d19:     	jmp	0x1454d6e6e <.text+0x54d5e6e>
1454d6d1e:     	movss	0x41475a(%rip), %xmm2   # 0x1458eb480
1454d6d26:     	mulss	0x1c(%rbp), %xmm8
1454d6d2c:     	xorps	%xmm3, %xmm3
1454d6d2f:     	cmpltss	%xmm1, %xmm3
1454d6d34:     	andps	%xmm8, %xmm3
1454d6d38:     	mulss	0x422000(%rip), %xmm1   # 0x1458f8d40
1454d6d40:     	mulss	%xmm1, %xmm7
1454d6d44:     	mulss	%xmm7, %xmm0
1454d6d48:     	mulss	%xmm2, %xmm0
1454d6d4c:     	addss	%xmm3, %xmm0
1454d6d50:     	mulss	%xmm0, %xmm6
1454d6d54:     	movq	0x58(%rbp), %rax
1454d6d58:     	movq	%rax, 0x70(%rbp)
1454d6d5c:     	shlq	$0x3, %rbx
1454d6d60:     	movzbl	0x111(%rsi), %r14d
1454d6d68:     	movups	0x20(%rsi), %xmm7
1454d6d6c:     	movups	0x40(%rsi), %xmm8
1454d6d71:     	xorl	%r15d, %r15d
1454d6d74:     	movss	0x514643(%rip), %xmm9   # 0x1459eb3c0
1454d6d7d:     	nopl	(%rax)
1454d6d80:     	movq	0x78(%rbp), %rax
1454d6d84:     	movq	(%rax,%r15), %rdx
1454d6d88:     	movq	0x880(%rsi), %rax
1454d6d8f:     	movq	0x898(%rsi), %rcx
1454d6d96:     	leaq	(%rcx,%rax), %r8
1454d6d9a:     	rolq	$0x17, %r8
1454d6d9e:     	addq	%rax, %r8
1454d6da1:     	movq	0x888(%rsi), %r9
1454d6da8:     	movq	%r9, %r10
1454d6dab:     	shlq	$0x11, %r10
1454d6daf:     	movq	0x890(%rsi), %r11
1454d6db6:     	xorq	%rax, %r11
1454d6db9:     	xorq	%r9, %rcx
1454d6dbc:     	xorq	%r11, %r9
1454d6dbf:     	movq	%r9, 0x888(%rsi)
1454d6dc6:     	xorq	%rcx, %rax
1454d6dc9:     	movq	%rax, 0x880(%rsi)
1454d6dd0:     	xorq	%r10, %r11
1454d6dd3:     	movq	%r11, 0x890(%rsi)
1454d6dda:     	rolq	$0x2d, %rcx
1454d6dde:     	movq	%rcx, 0x898(%rsi)
1454d6de5:     	shrq	$0x28, %r8
1454d6de9:     	xorps	%xmm0, %xmm0
1454d6dec:     	cvtsi2ss	%r8d, %xmm0
1454d6df1:     	mulss	%xmm9, %xmm0
1454d6df6:     	movss	0x464(%rsi), %xmm1
1454d6dfe:     	movss	0x468(%rsi), %xmm2
1454d6e06:     	mulss	%xmm6, %xmm2
1454d6e0a:     	movl	0x40(%rdi), %r9d
1454d6e0e:     	movzbl	0x74(%rdi), %eax
1454d6e12:     	movb	$0x3, 0x111(%rsi)
1454d6e19:     	movq	$0x0, 0x20(%rsi)
1454d6e21:     	movq	$0x0, 0x40(%rsi)
1454d6e29:     	ucomiss	%xmm0, %xmm1
1454d6e2c:     	ja	0x1454d6e31 <.text+0x54d5e31>
1454d6e2e:     	movaps	%xmm6, %xmm2
1454d6e31:     	seta	0x28(%rsp)
1454d6e36:     	movb	%al, 0x20(%rsp)
1454d6e3a:     	movb	$0x0, 0x30(%rsp)
1454d6e3f:     	movq	%rsi, %rcx
1454d6e42:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454d6e47:     	nop
1454d6e48:     	movb	%r14b, 0x111(%rsi)
1454d6e4f:     	movups	%xmm7, 0x20(%rsi)
1454d6e53:     	movups	%xmm8, 0x40(%rsi)
1454d6e58:     	addq	$0x8, %r15
1454d6e5c:     	cmpq	%r15, %rbx
1454d6e5f:     	jne	0x1454d6d80 <.text+0x54d5d80>
1454d6e65:     	movq	0x70(%rbp), %rdx
1454d6e69:     	testq	%rdx, %rdx
1454d6e6c:     	je	0x1454d6e81 <.text+0x54d5e81>
1454d6e6e:     	shlq	$0x3, %rdx
1454d6e72:     	movl	$0x8, %r8d
1454d6e78:     	movq	0x78(%rbp), %rcx
1454d6e7c:     	callq	0x1400021d0 <.text+0x11d0>
1454d6e81:     	movaps	0x90(%rbp), %xmm6
1454d6e88:     	movaps	0xa0(%rbp), %xmm7
1454d6e8f:     	movaps	0xb0(%rbp), %xmm8
1454d6e97:     	movaps	0xc0(%rbp), %xmm9
1454d6e9f:     	addq	$0x158, %rsp            # imm = 0x158
1454d6ea6:     	popq	%rbx
1454d6ea7:     	popq	%rdi
1454d6ea8:     	popq	%rsi
1454d6ea9:     	popq	%r14
1454d6eab:     	popq	%r15
1454d6ead:     	popq	%rbp
1454d6eae:     	retq
