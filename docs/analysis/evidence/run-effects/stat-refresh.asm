
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a6a40:     	pushq	%rbp
1454a6a41:     	pushq	%r15
1454a6a43:     	pushq	%r14
1454a6a45:     	pushq	%r13
1454a6a47:     	pushq	%r12
1454a6a49:     	pushq	%rsi
1454a6a4a:     	pushq	%rdi
1454a6a4b:     	pushq	%rbx
1454a6a4c:     	subq	$0x1e8, %rsp            # imm = 0x1E8
1454a6a53:     	leaq	0x80(%rsp), %rbp
1454a6a5b:     	movaps	%xmm15, 0x150(%rbp)
1454a6a63:     	movaps	%xmm14, 0x140(%rbp)
1454a6a6b:     	movaps	%xmm13, 0x130(%rbp)
1454a6a73:     	movaps	%xmm12, 0x120(%rbp)
1454a6a7b:     	movaps	%xmm11, 0x110(%rbp)
1454a6a83:     	movaps	%xmm10, 0x100(%rbp)
1454a6a8b:     	movaps	%xmm9, 0xf0(%rbp)
1454a6a93:     	movaps	%xmm8, 0xe0(%rbp)
1454a6a9b:     	movaps	%xmm7, 0xd0(%rbp)
1454a6aa2:     	movaps	%xmm6, 0xc0(%rbp)
1454a6aa9:     	movq	$-0x2, 0xb8(%rbp)
1454a6ab4:     	movq	%rcx, %r12
1454a6ab7:     	movzbl	0x29c(%rcx), %eax
1454a6abe:     	addb	$-0x2, %al
1454a6ac0:     	cmpb	$0x9, %al
1454a6ac2:     	ja	0x1454a6aea <.text+0x54a5aea>
1454a6ac4:     	movzbl	%al, %eax
1454a6ac7:     	leaq	0x15519f2(%rip), %rcx   # 0x1469f84c0
1454a6ace:     	movq	(%rcx,%rax,8), %rsi
1454a6ad2:     	movzbl	0x29d(%r12), %eax
1454a6adb:     	addb	$-0x2, %al
1454a6add:     	cmpb	$0x6, %al
1454a6adf:     	jbe	0x1454a6b00 <.text+0x54a5b00>
1454a6ae1:     	leaq	0x128dbf0(%rip), %rdx   # 0x1467346d8
1454a6ae8:     	jmp	0x1454a6b0e <.text+0x54a5b0e>
1454a6aea:     	leaq	0x128ed57(%rip), %rsi   # 0x146735848
1454a6af1:     	movzbl	0x29d(%r12), %eax
1454a6afa:     	addb	$-0x2, %al
1454a6afc:     	cmpb	$0x6, %al
1454a6afe:     	ja	0x1454a6ae1 <.text+0x54a5ae1>
1454a6b00:     	movzbl	%al, %eax
1454a6b03:     	leaq	0x155197e(%rip), %rcx   # 0x1469f8488
1454a6b0a:     	movq	(%rcx,%rax,8), %rdx
1454a6b0e:     	movq	0x6e8(%r12), %r15
1454a6b16:     	leaq	(,%r15,8), %rdi
1454a6b1e:     	movq	%r15, %rax
1454a6b21:     	shrq	$0x3d, %rax
1454a6b25:     	setne	%al
1454a6b28:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
1454a6b32:     	cmpq	%rcx, %rdi
1454a6b35:     	seta	%cl
1454a6b38:     	orb	%al, %cl
1454a6b3a:     	je	0x1454a6b4c <.text+0x54a5b4c>
1454a6b3c:     	xorl	%r14d, %r14d
1454a6b3f:     	movq	%r14, %rcx
1454a6b42:     	movq	%rdi, %rdx
1454a6b45:     	callq	0x14590379b <.text+0x590279b>
1454a6b4a:     	ud2
1454a6b4c:     	movq	%rdx, 0x90(%rbp)
1454a6b53:     	movq	0x6e0(%r12), %rbx
1454a6b5b:     	testq	%rdi, %rdi
1454a6b5e:     	je	0x1454a6b85 <.text+0x54a5b85>
1454a6b60:     	callq	0x140002200 <.text+0x1200>
1454a6b65:     	movl	$0x4, %r14d
1454a6b6b:     	movl	$0x4, %edx
1454a6b70:     	movq	%rdi, %rcx
1454a6b73:     	callq	0x1400021c0 <.text+0x11c0>
1454a6b78:     	testq	%rax, %rax
1454a6b7b:     	je	0x1454a6b3f <.text+0x54a5b3f>
1454a6b7d:     	movq	%rax, %r13
1454a6b80:     	movq	%r15, %rax
1454a6b83:     	jmp	0x1454a6b8d <.text+0x54a5b8d>
1454a6b85:     	movl	$0x4, %r13d
1454a6b8b:     	xorl	%eax, %eax
1454a6b8d:     	movq	%rsi, 0x40(%rbp)
1454a6b91:     	movq	%rax, 0x68(%rbp)
1454a6b95:     	movq	%r13, 0x70(%rbp)
1454a6b99:     	movq	$0x0, 0x78(%rbp)
1454a6ba1:     	testq	%r15, %r15
1454a6ba4:     	je	0x1454a6bbe <.text+0x54a5bbe>
1454a6ba6:     	movq	%r13, %rcx
1454a6ba9:     	movq	%rax, %rsi
1454a6bac:     	movq	%rbx, %rdx
1454a6baf:     	movq	%rdi, %r8
1454a6bb2:     	callq	0x1457731ed <.text+0x57721ed>
1454a6bb7:     	movq	%rsi, %rax
1454a6bba:     	movq	%r15, 0x78(%rbp)
1454a6bbe:     	movq	0x60(%r12), %rbx
1454a6bc3:     	testq	%rbx, %rbx
1454a6bc6:     	je	0x1454a6c75 <.text+0x54a5c75>
1454a6bcc:     	movss	0x934(%r12), %xmm6
1454a6bd6:     	movq	0x58(%r12), %r14
1454a6bdb:     	shlq	$0x4, %rbx
1454a6bdf:     	addq	%r14, %rbx
1454a6be2:     	movq	%r12, %rax
1454a6be5:     	movq	0x710(%r12), %r12
1454a6bed:     	movq	%rax, 0x50(%rbp)
1454a6bf1:     	movq	0x718(%rax), %rsi
1454a6bf8:     	leaq	0x68(%rbp), %rdi
1454a6bfc:     	jmp	0x1454a6c1f <.text+0x54a5c1f>
1454a6bfe:     	nop
1454a6c00:     	movq	0x70(%rbp), %rax
1454a6c04:     	movb	%r13b, (%rax,%r15,8)
1454a6c08:     	movss	%xmm7, 0x4(%rax,%r15,8)
1454a6c0f:     	incq	%r15
1454a6c12:     	movq	%r15, 0x78(%rbp)
1454a6c16:     	addq	$0x10, %r14
1454a6c1a:     	cmpq	%rbx, %r14
1454a6c1d:     	je	0x1454a6c63 <.text+0x54a5c63>
1454a6c1f:     	ucomiss	0xc(%r14), %xmm6
1454a6c24:     	jae	0x1454a6c16 <.text+0x54a5c16>
1454a6c26:     	movq	(%r14), %rax
1454a6c29:     	cmpq	%rsi, %rax
1454a6c2c:     	jae	0x1454a6c16 <.text+0x54a5c16>
1454a6c2e:     	shlq	$0x6, %rax
1454a6c32:     	cmpb	$0xf, (%r12,%rax)
1454a6c37:     	jne	0x1454a6c16 <.text+0x54a5c16>
1454a6c39:     	addq	%r12, %rax
1454a6c3c:     	movzbl	0x1(%rax), %r13d
1454a6c41:     	movl	0x8(%r14), %ecx
1454a6c45:     	xorps	%xmm7, %xmm7
1454a6c48:     	cvtsi2ss	%rcx, %xmm7
1454a6c4d:     	mulss	0x4(%rax), %xmm7
1454a6c52:     	cmpq	0x68(%rbp), %r15
1454a6c56:     	jne	0x1454a6c00 <.text+0x54a5c00>
1454a6c58:     	movq	%rdi, %rcx
1454a6c5b:     	callq	0x145780180 <.text+0x577f180>
1454a6c60:     	nop
1454a6c61:     	jmp	0x1454a6c00 <.text+0x54a5c00>
1454a6c63:     	movq	0x68(%rbp), %rax
1454a6c67:     	movq	%rax, 0x38(%rbp)
1454a6c6b:     	movq	0x70(%rbp), %r13
1454a6c6f:     	movq	0x50(%rbp), %r12
1454a6c73:     	jmp	0x1454a6c79 <.text+0x54a5c79>
1454a6c75:     	movq	%rax, 0x38(%rbp)
1454a6c79:     	movl	0x410(%r12), %eax
1454a6c81:     	cvtsi2ss	%rax, %xmm4
1454a6c86:     	addss	0x46087e(%rip), %xmm4   # 0x14590750c
1454a6c8e:     	movss	0x498b29(%rip), %xmm13  # 0x14593f7c0
1454a6c97:     	movss	0x46ec75(%rip), %xmm6   # 0x145915914
1454a6c9f:     	mulss	%xmm4, %xmm6
1454a6ca3:     	movss	0x4607e4(%rip), %xmm15  # 0x145907490
1454a6cac:     	addss	%xmm15, %xmm6
1454a6cb1:     	movq	0x40(%rbp), %rsi
1454a6cb5:     	movss	0x84(%rsi), %xmm0
1454a6cbd:     	movaps	%xmm0, 0x50(%rbp)
1454a6cc1:     	movss	0x46c637(%rip), %xmm0   # 0x145913300
1454a6cc9:     	cvttss2si	%xmm4, %rcx
1454a6cce:     	xorl	%eax, %eax
1454a6cd0:     	xorps	%xmm2, %xmm2
1454a6cd3:     	xorps	%xmm1, %xmm1
1454a6cd6:     	movaps	%xmm1, 0x20(%rbp)
1454a6cda:     	ucomiss	%xmm2, %xmm4
1454a6cdd:     	cmovbl	%eax, %ecx
1454a6ce0:     	mulss	%xmm4, %xmm0
1454a6ce4:     	ucomiss	0x460841(%rip), %xmm4   # 0x14590752c
1454a6ceb:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1454a6cf0:     	cmovbel	%ecx, %edx
1454a6cf3:     	addss	0x46c5fd(%rip), %xmm0   # 0x1459132f8
1454a6cfb:     	incl	%edx
1454a6cfd:     	movl	$0x88888889, %r8d       # imm = 0x88888889
1454a6d03:     	imulq	%rdx, %r8
1454a6d07:     	shrq	$0x23, %r8
1454a6d0b:     	cmpl	$0x3, %r8d
1454a6d0f:     	movl	$0x3, %ecx
1454a6d14:     	cmovbl	%r8d, %ecx
1454a6d18:     	movq	0x90(%rbp), %rdx
1454a6d1f:     	movq	0x28(%rdx), %r8
1454a6d23:     	testq	%r8, %r8
1454a6d26:     	je	0x1454a6e08 <.text+0x54a5e08>
1454a6d2c:     	movaps	%xmm15, %xmm8
1454a6d30:     	movq	0x20(%rdx), %rdx
1454a6d34:     	leaq	(%rdx,%r8,8), %r8
1454a6d38:     	movss	0x498a7f(%rip), %xmm14  # 0x14593f7c0
1454a6d41:     	movss	0x46eb57(%rip), %xmm1   # 0x1459158a0
1454a6d49:     	movaps	%xmm2, 0x90(%rbp)
1454a6d50:     	movss	0x460737(%rip), %xmm9   # 0x145907490
1454a6d59:     	leaq	0x1551868(%rip), %r9    # 0x1469f85c8
1454a6d60:     	movaps	%xmm9, %xmm15
1454a6d64:     	movaps	%xmm9, %xmm11
1454a6d68:     	movaps	%xmm9, %xmm3
1454a6d6c:     	xorps	%xmm5, %xmm5
1454a6d6f:     	movaps	%xmm9, %xmm7
1454a6d73:     	xorps	%xmm10, %xmm10
1454a6d77:     	jmp	0x1454a6d8d <.text+0x54a5d8d>
1454a6d79:     	addss	%xmm2, %xmm10
1454a6d7e:     	nop
1454a6d80:     	addq	$0x8, %rdx
1454a6d84:     	cmpq	%r8, %rdx
1454a6d87:     	je	0x1454a6e32 <.text+0x54a5e32>
1454a6d8d:     	movl	(%rdx), %r10d
1454a6d90:     	movss	0x4(%rdx), %xmm2
1454a6d95:     	movslq	(%r9,%r10,4), %r10
1454a6d99:     	addq	%r9, %r10
1454a6d9c:     	jmpq	*%r10
1454a6d9f:     	addss	%xmm2, %xmm15
1454a6da4:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6da6:     	addss	%xmm2, %xmm1
1454a6daa:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6dac:     	addss	%xmm2, %xmm7
1454a6db0:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6db2:     	movaps	0x90(%rbp), %xmm12
1454a6dba:     	addss	%xmm2, %xmm12
1454a6dbf:     	movaps	%xmm12, 0x90(%rbp)
1454a6dc7:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6dc9:     	addss	%xmm2, %xmm11
1454a6dce:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6dd0:     	addss	%xmm9, %xmm2
1454a6dd5:     	mulss	%xmm2, %xmm14
1454a6dda:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6ddc:     	addss	%xmm2, %xmm6
1454a6de0:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6de2:     	movaps	0x50(%rbp), %xmm12
1454a6de7:     	addss	%xmm2, %xmm12
1454a6dec:     	movaps	%xmm12, 0x50(%rbp)
1454a6df1:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6df3:     	addss	%xmm2, %xmm0
1454a6df7:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6df9:     	addss	%xmm2, %xmm5
1454a6dfd:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6dff:     	addss	%xmm2, %xmm3
1454a6e03:     	jmp	0x1454a6d80 <.text+0x54a5d80>
1454a6e08:     	movss	0x46ea90(%rip), %xmm1   # 0x1459158a0
1454a6e10:     	xorps	%xmm10, %xmm10
1454a6e14:     	movaps	%xmm15, %xmm7
1454a6e18:     	xorps	%xmm5, %xmm5
1454a6e1b:     	movaps	%xmm15, %xmm3
1454a6e1f:     	movaps	%xmm13, %xmm14
1454a6e23:     	movaps	%xmm15, %xmm11
1454a6e27:     	movaps	%xmm2, 0x90(%rbp)
1454a6e2e:     	movaps	%xmm15, %xmm8
1454a6e32:     	mulss	%xmm13, %xmm4
1454a6e37:     	movq	0x300(%r12), %rdx
1454a6e3f:     	testq	%rdx, %rdx
1454a6e42:     	movaps	%xmm5, (%rbp)
1454a6e46:     	je	0x1454a6e8e <.text+0x54a5e8e>
1454a6e48:     	movq	0x2f8(%r12), %r8
1454a6e50:     	shlq	$0x3, %rdx
1454a6e54:     	xorl	%eax, %eax
1454a6e56:     	movss	0x460631(%rip), %xmm13  # 0x145907490
1454a6e5f:     	movss	0x46c48d(%rip), %xmm5   # 0x1459132f4
1454a6e67:     	xorps	%xmm2, %xmm2
1454a6e6a:     	movaps	%xmm2, 0x20(%rbp)
1454a6e6e:     	movl	(%r8,%rax), %r10d
1454a6e72:     	leaq	0x155177f(%rip), %r9    # 0x1469f85f8
1454a6e79:     	movslq	(%r9,%r10,4), %r11
1454a6e7d:     	addq	%r9, %r11
1454a6e80:     	movss	%xmm2, 0xac(%rbp)
1454a6e88:     	xorl	%r10d, %r10d
1454a6e8b:     	jmpq	*%r11
1454a6e8e:     	movss	0x46c45e(%rip), %xmm2   # 0x1459132f4
1454a6e96:     	xorps	%xmm9, %xmm9
1454a6e9a:     	movss	%xmm9, 0xac(%rbp)
1454a6ea3:     	movaps	%xmm8, %xmm13
1454a6ea7:     	jmp	0x1454a6ea9 <.text+0x54a5ea9>
1454a6ea9:     	addss	0x80(%rsi), %xmm4
1454a6eb1:     	movq	0x2d0(%r12), %r8
1454a6eb9:     	xorps	%xmm5, %xmm5
1454a6ebc:     	movss	%xmm5, 0xb0(%rbp)
1454a6ec4:     	testq	%r8, %r8
1454a6ec7:     	je	0x1454a6f12 <.text+0x54a5f12>
1454a6ec9:     	movaps	%xmm7, 0x10(%rbp)
1454a6ecd:     	movss	%xmm4, 0xb4(%rbp)
1454a6ed5:     	movq	0x2c8(%r12), %rdx
1454a6edd:     	shlq	$0x3, %r8
1454a6ee1:     	leaq	(%r8,%r8,2), %r8
1454a6ee5:     	xorps	%xmm4, %xmm4
1454a6ee8:     	movaps	%xmm4, 0x40(%rbp)
1454a6eec:     	xorl	%r9d, %r9d
1454a6eef:     	movss	0x10(%rdx,%r9), %xmm7
1454a6ef6:     	movq	(%rdx,%r9), %r11
1454a6efa:     	movzbl	0x44(%r11), %esi
1454a6eff:     	leaq	0x1551726(%rip), %r10   # 0x1469f862c
1454a6f06:     	movslq	(%r10,%rsi,4), %rsi
1454a6f0a:     	addq	%r10, %rsi
1454a6f0d:     	movaps	%xmm2, %xmm5
1454a6f10:     	jmpq	*%rsi
1454a6f12:     	movaps	%xmm5, 0x40(%rbp)
1454a6f16:     	movaps	%xmm5, -0x10(%rbp)
1454a6f1a:     	movaps	%xmm2, %xmm5
1454a6f1d:     	movss	0x46060e(%rip), %xmm9   # 0x145907534
1454a6f26:     	testq	%r15, %r15
1454a6f29:     	jne	0x1454a7102 <.text+0x54a6102>
1454a6f2f:     	movaps	%xmm5, %xmm8
1454a6f33:     	movaps	%xmm3, -0x20(%rbp)
1454a6f37:     	movaps	%xmm1, %xmm3
1454a6f3a:     	movaps	%xmm7, 0x10(%rbp)
1454a6f3e:     	movaps	%xmm13, -0x30(%rbp)
1454a6f43:     	movaps	%xmm10, -0x40(%rbp)
1454a6f48:     	movss	%xmm9, 0xb4(%rbp)
1454a6f51:     	xorps	%xmm1, %xmm1
1454a6f54:     	xorps	%xmm5, %xmm5
1454a6f57:     	movaps	%xmm9, %xmm13
1454a6f5b:     	jmp	0x1454a7142 <.text+0x54a6142>
1454a6f60:     	movl	(%r8,%r10), %r11d
1454a6f64:     	movslq	(%r9,%r11,4), %r11
1454a6f68:     	addq	%r9, %r11
1454a6f6b:     	jmpq	*%r11
1454a6f6e:     	addss	0x4(%r8,%r10), %xmm6
1454a6f75:     	addq	$0x8, %r10
1454a6f79:     	cmpq	%r10, %rdx
1454a6f7c:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a6f7e:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a6f83:     	addss	0x4(%r8,%r10), %xmm11
1454a6f8a:     	addq	$0x8, %r10
1454a6f8e:     	cmpq	%r10, %rdx
1454a6f91:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a6f93:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a6f98:     	addss	0x4(%r8,%r10), %xmm5
1454a6f9f:     	addq	$0x8, %r10
1454a6fa3:     	cmpq	%r10, %rdx
1454a6fa6:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a6fa8:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a6fad:     	movaps	%xmm14, %xmm2
1454a6fb1:     	movss	0x4(%r8,%r10), %xmm14
1454a6fb8:     	addss	0x4604cf(%rip), %xmm14  # 0x145907490
1454a6fc1:     	mulss	%xmm2, %xmm14
1454a6fc6:     	addq	$0x8, %r10
1454a6fca:     	cmpq	%r10, %rdx
1454a6fcd:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a6fcf:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a6fd4:     	addss	0x4(%r8,%r10), %xmm1
1454a6fdb:     	addq	$0x8, %r10
1454a6fdf:     	cmpq	%r10, %rdx
1454a6fe2:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a6fe8:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a6fed:     	movaps	0x20(%rbp), %xmm2
1454a6ff1:     	addss	0x4(%r8,%r10), %xmm2
1454a6ff8:     	movaps	%xmm2, 0x20(%rbp)
1454a6ffc:     	addq	$0x8, %r10
1454a7000:     	cmpq	%r10, %rdx
1454a7003:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a7009:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a700e:     	addss	0x4(%r8,%r10), %xmm13
1454a7015:     	addq	$0x8, %r10
1454a7019:     	cmpq	%r10, %rdx
1454a701c:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a7022:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a7027:     	addl	0x4(%r8,%r10), %eax
1454a702c:     	addq	$0x8, %r10
1454a7030:     	cmpq	%r10, %rdx
1454a7033:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a7039:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a703e:     	addss	0x4(%r8,%r10), %xmm7
1454a7045:     	addq	$0x8, %r10
1454a7049:     	cmpq	%r10, %rdx
1454a704c:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a7052:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a7054:     	movaps	0x90(%rbp), %xmm2
1454a705b:     	addss	0x4(%r8,%r10), %xmm2
1454a7062:     	movaps	%xmm2, 0x90(%rbp)
1454a7069:     	addq	$0x8, %r10
1454a706d:     	cmpq	%r10, %rdx
1454a7070:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a7076:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a7078:     	movss	0xac(%rbp), %xmm2
1454a7080:     	addss	0x4(%r8,%r10), %xmm2
1454a7087:     	movss	%xmm2, 0xac(%rbp)
1454a708f:     	addq	$0x8, %r10
1454a7093:     	cmpq	%r10, %rdx
1454a7096:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a709c:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a709e:     	movaps	0x50(%rbp), %xmm2
1454a70a2:     	addss	0x4(%r8,%r10), %xmm2
1454a70a9:     	movaps	%xmm2, 0x50(%rbp)
1454a70ad:     	addq	$0x8, %r10
1454a70b1:     	cmpq	%r10, %rdx
1454a70b4:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a70ba:     	jmp	0x1454a70d0 <.text+0x54a60d0>
1454a70bc:     	addss	0x4(%r8,%r10), %xmm0
1454a70c3:     	addq	$0x8, %r10
1454a70c7:     	cmpq	%r10, %rdx
1454a70ca:     	jne	0x1454a6f60 <.text+0x54a5f60>
1454a70d0:     	movaps	%xmm5, %xmm2
1454a70d3:     	jmp	0x1454a6ea9 <.text+0x54a5ea9>
1454a70d8:     	minss	0x498b94(%rip), %xmm4   # 0x14593fc74
1454a70e0:     	movaps	%xmm4, -0x10(%rbp)
1454a70e4:     	movss	0xb4(%rbp), %xmm4
1454a70ec:     	movaps	0x10(%rbp), %xmm7
1454a70f0:     	movss	0x46043b(%rip), %xmm9   # 0x145907534
1454a70f9:     	testq	%r15, %r15
1454a70fc:     	je	0x1454a6f2f <.text+0x54a5f2f>
1454a7102:     	shlq	$0x3, %r15
1454a7106:     	movss	0x460426(%rip), %xmm2   # 0x145907534
1454a710e:     	movss	%xmm2, 0xb4(%rbp)
1454a7116:     	xorps	%xmm2, %xmm2
1454a7119:     	movss	%xmm2, 0xb0(%rbp)
1454a7121:     	xorl	%edx, %edx
1454a7123:     	movzbl	(%r13,%rdx), %r9d
1454a7129:     	leaq	0x1551548(%rip), %r8    # 0x1469f8678
1454a7130:     	movslq	(%r8,%r9,4), %r9
1454a7134:     	addq	%r8, %r9
1454a7137:     	xorps	%xmm9, %xmm9
1454a713b:     	xorps	%xmm12, %xmm12
1454a713f:     	jmpq	*%r9
1454a7142:     	movss	0x934(%r12), %xmm10
1454a714c:     	movq	0x310(%r12), %r8
1454a7154:     	movq	0x318(%r12), %rdx
1454a715c:     	leaq	(%rdx,%rdx,2), %rdx
1454a7160:     	leaq	(%r8,%rdx,8), %rdx
1454a7164:     	movss	0x460324(%rip), %xmm2   # 0x145907490
1454a716c:     	addss	0x40(%rbp), %xmm2
1454a7171:     	movss	0x46031e(%rip), %xmm12  # 0x145907498
1454a717a:     	movq	%r8, %r9
1454a717d:     	nopl	(%rax)
1454a7180:     	cmpq	%rdx, %r9
1454a7183:     	je	0x1454a7209 <.text+0x54a6209>
1454a7189:     	leaq	0x18(%r9), %r8
1454a718d:     	ucomiss	0x10(%r9), %xmm10
1454a7192:     	movq	%r8, %r9
1454a7195:     	jae	0x1454a7180 <.text+0x54a6180>
1454a7197:     	movl	-0x18(%r8), %r9d
1454a719b:     	cmpl	$0x8, %r9d
1454a719f:     	je	0x1454a71e2 <.text+0x54a61e2>
1454a71a1:     	cmpl	$0x9, %r9d
1454a71a5:     	jne	0x1454a71c5 <.text+0x54a61c5>
1454a71a7:     	movss	-0x14(%r8), %xmm9
1454a71ad:     	mulss	%xmm2, %xmm9
1454a71b2:     	movaps	0x90(%rbp), %xmm7
1454a71b9:     	addss	%xmm9, %xmm7
1454a71be:     	movaps	%xmm7, 0x90(%rbp)
1454a71c5:     	movl	-0xc(%r8), %r9d
1454a71c9:     	cmpl	$0x5bd1, %r9d           # imm = 0x5BD1
1454a71d0:     	je	0x1454a71ff <.text+0x54a61ff>
1454a71d2:     	cmpl	$0x5b9b, %r9d           # imm = 0x5B9B
1454a71d9:     	jne	0x1454a717a <.text+0x54a617a>
1454a71db:     	addss	%xmm13, %xmm11
1454a71e0:     	jmp	0x1454a717a <.text+0x54a617a>
1454a71e2:     	movss	-0x14(%r8), %xmm9
1454a71e8:     	mulss	%xmm2, %xmm9
1454a71ed:     	addss	%xmm9, %xmm6
1454a71f2:     	movl	-0xc(%r8), %r9d
1454a71f6:     	cmpl	$0x5bd1, %r9d           # imm = 0x5BD1
1454a71fd:     	jne	0x1454a71d2 <.text+0x54a61d2>
1454a71ff:     	addss	%xmm12, %xmm6
1454a7204:     	jmp	0x1454a717a <.text+0x54a617a>
1454a7209:     	addss	0xac(%rbp), %xmm4
1454a7211:     	mulss	%xmm15, %xmm4
1454a7216:     	mulss	%xmm4, %xmm5
1454a721a:     	addss	%xmm5, %xmm0
1454a721e:     	movss	0x460269(%rip), %xmm10  # 0x145907490
1454a7227:     	movaps	0x90(%rbp), %xmm7
1454a722e:     	addss	%xmm10, %xmm7
1454a7233:     	xorl	%edx, %edx
1454a7235:     	ucomiss	%xmm10, %xmm3
1454a7239:     	divss	%xmm7, %xmm10
1454a723e:     	movaps	0x50(%rbp), %xmm12
1454a7243:     	movaps	%xmm12, %xmm13
1454a7247:     	movss	0xb4(%rbp), %xmm7
1454a724f:     	subss	%xmm7, %xmm13
1454a7254:     	movaps	%xmm12, %xmm2
1454a7258:     	minss	%xmm7, %xmm2
1454a725c:     	movaps	%xmm2, %xmm9
1454a7260:     	cmpunordss	%xmm2, %xmm9
1454a7266:     	movaps	%xmm9, %xmm7
1454a726a:     	andnps	%xmm2, %xmm7
1454a726d:     	andps	%xmm12, %xmm9
1454a7271:     	orps	%xmm7, %xmm9
1454a7275:     	movaps	%xmm9, %xmm7
1454a7279:     	mulss	%xmm1, %xmm9
1454a727e:     	xorps	%xmm2, %xmm2
1454a7281:     	maxss	%xmm2, %xmm13
1454a7286:     	divss	0x46e571(%rip), %xmm9   # 0x145915800
1454a728f:     	movss	0xb0(%rbp), %xmm12
1454a7298:     	mulss	%xmm13, %xmm12
1454a729d:     	addss	%xmm12, %xmm9
1454a72a2:     	addss	%xmm6, %xmm9
1454a72a7:     	movaps	%xmm4, %xmm13
1454a72ab:     	subss	0x470(%r12), %xmm13
1454a72b5:     	movaps	%xmm4, %xmm6
1454a72b8:     	movss	%xmm4, 0x470(%r12)
1454a72c2:     	movss	%xmm9, 0x474(%r12)
1454a72cc:     	movss	%xmm10, 0x478(%r12)
1454a72d6:     	movss	0x46022d(%rip), %xmm9   # 0x14590750c
1454a72df:     	addss	%xmm3, %xmm9
1454a72e4:     	addss	%xmm8, %xmm9
1454a72e9:     	movaps	0x5a033f(%rip), %xmm10  # 0x145a47630
1454a72f1:     	unpcklps	%xmm9, %xmm10           # xmm10 = xmm10[0],xmm9[0],xmm10[1],xmm9[1]
1454a72f5:     	seta	%dl
1454a72f8:     	unpcklps	%xmm8, %xmm3            # xmm3 = xmm3[0],xmm8[0],xmm3[1],xmm8[1]
1454a72fc:     	movd	%edx, %xmm9
1454a7301:     	pshufd	$0x0, %xmm9, %xmm9      # xmm9 = xmm9[0,0,0,0]
1454a7307:     	pslld	$0x1f, %xmm9
1454a730d:     	psrad	$0x1f, %xmm9
1454a7313:     	andps	%xmm9, %xmm10
1454a7317:     	andnps	%xmm3, %xmm9
1454a731b:     	orps	%xmm10, %xmm9
1454a731f:     	movlps	%xmm9, 0x47c(%r12)
1454a7328:     	minss	0x587387(%rip), %xmm11  # 0x145a2e6b8
1454a7331:     	movaps	%xmm11, %xmm5
1454a7335:     	movss	%xmm11, 0x484(%r12)
1454a733f:     	movss	%xmm14, 0x488(%r12)
1454a7349:     	movaps	-0x20(%rbp), %xmm1
1454a734d:     	movss	%xmm1, 0x48c(%r12)
1454a7357:     	movss	%xmm7, 0x490(%r12)
1454a7361:     	movss	%xmm0, 0x494(%r12)
1454a736b:     	movaps	-0x30(%rbp), %xmm0
1454a736f:     	movss	%xmm0, 0x498(%r12)
1454a7379:     	movaps	(%rbp), %xmm0
1454a737d:     	movss	%xmm0, 0x49c(%r12)
1454a7387:     	movaps	0x10(%rbp), %xmm0
1454a738b:     	movss	%xmm0, 0x4a0(%r12)
1454a7395:     	movl	%eax, 0x4a4(%r12)
1454a739d:     	movaps	0x20(%rbp), %xmm0
1454a73a1:     	movss	%xmm0, 0x4a8(%r12)
1454a73ab:     	movaps	-0x40(%rbp), %xmm0
1454a73af:     	movss	%xmm0, 0x4ac(%r12)
1454a73b9:     	movaps	0x40(%rbp), %xmm0
1454a73bd:     	movss	%xmm0, 0x4b0(%r12)
1454a73c7:     	movl	%ecx, 0x4b4(%r12)
1454a73cf:     	movaps	-0x10(%rbp), %xmm0
1454a73d3:     	movss	%xmm0, 0x4b8(%r12)
1454a73dd:     	ucomiss	%xmm2, %xmm13
1454a73e1:     	movss	0x418(%r12), %xmm1
1454a73eb:     	jbe	0x1454a73fc <.text+0x54a63fc>
1454a73ed:     	addss	%xmm13, %xmm1
1454a73f2:     	movss	%xmm1, 0x418(%r12)
1454a73fc:     	movq	%r13, 0x90(%rbp)
1454a7403:     	movaps	%xmm1, %xmm2
1454a7406:     	minss	%xmm6, %xmm2
1454a740a:     	movaps	%xmm2, %xmm0
1454a740d:     	cmpunordss	%xmm2, %xmm0
1454a7412:     	movaps	%xmm0, %xmm4
1454a7415:     	andnps	%xmm2, %xmm4
1454a7418:     	andps	%xmm1, %xmm0
1454a741b:     	orps	%xmm4, %xmm0
1454a741e:     	movss	%xmm0, 0x418(%r12)
1454a7428:     	movaps	%xmm5, %xmm3
1454a742b:     	mulss	0x46e441(%rip), %xmm3   # 0x145915874
1454a7433:     	movaps	%xmm3, %xmm1
1454a7436:     	subss	0x4d0(%r12), %xmm1
1454a7440:     	andps	0x46e339(%rip), %xmm1   # 0x145915780
1454a7447:     	ucomiss	0x4a71c2(%rip), %xmm1   # 0x14594e610
1454a744e:     	jbe	0x1454a74e3 <.text+0x54a64e3>
1454a7454:     	movss	%xmm3, 0x4d0(%r12)
1454a745e:     	movl	0x4cc(%r12), %r8d
1454a7466:     	leal	0x1(%r8), %eax
1454a746a:     	movl	%eax, 0x4cc(%r12)
1454a7472:     	movq	0x3e8(%r12), %rdx
1454a747a:     	leaq	0x68(%rbp), %rcx
1454a747e:     	callq	0x14545e050 <.text+0x545d050>
1454a7483:     	nop
1454a7484:     	movq	0x560(%r12), %rsi
1454a748c:     	cmpq	0x550(%r12), %rsi
1454a7494:     	jne	0x1454a74a4 <.text+0x54a64a4>
1454a7496:     	leaq	0x550(%r12), %rcx
1454a749e:     	callq	0x145774710 <.text+0x5773710>
1454a74a3:     	nop
1454a74a4:     	movq	0x558(%r12), %rax
1454a74ac:     	movq	%rsi, %rcx
1454a74af:     	shlq	$0x5, %rcx
1454a74b3:     	movups	0x68(%rbp), %xmm0
1454a74b7:     	movups	0x78(%rbp), %xmm1
1454a74bb:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a74c0:     	movups	%xmm0, (%rax,%rcx)
1454a74c4:     	incq	%rsi
1454a74c7:     	movq	%rsi, 0x560(%r12)
1454a74cf:     	movss	0x418(%r12), %xmm0
1454a74d9:     	movss	0x470(%r12), %xmm6
1454a74e3:     	xorps	%xmm7, %xmm7
1454a74e6:     	maxss	%xmm7, %xmm0
1454a74ea:     	callq	0x14577327d <.text+0x577227d>
1454a74ef:     	cvttss2si	%xmm0, %rax
1454a74f4:     	xorl	%ecx, %ecx
1454a74f6:     	ucomiss	%xmm7, %xmm0
1454a74f9:     	cmovbl	%ecx, %eax
1454a74fc:     	ucomiss	0x460029(%rip), %xmm0   # 0x14590752c
1454a7503:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454a7509:     	cmovbel	%eax, %r8d
1454a750d:     	leaq	0x8d8(%r12), %rdi
1454a7515:     	movq	0x8d8(%r12), %rax
1454a751d:     	testq	%rax, %rax
1454a7520:     	je	0x1454a7587 <.text+0x54a6587>
1454a7522:     	movq	0x8e0(%r12), %rcx
1454a752a:     	movw	$0x16, %dx
1454a752e:     	movzwl	0x36(%rax), %r10d
1454a7533:     	movl	%r10d, %r11d
1454a7536:     	addl	%r11d, %r11d
1454a7539:     	movq	$-0x1, %r9
1454a7540:     	testq	%r11, %r11
1454a7543:     	je	0x1454a7570 <.text+0x54a6570>
1454a7545:     	cmpw	0x3a(%rax,%r9,2), %dx
1454a754b:     	seta	%bl
1454a754e:     	sbbb	$0x0, %bl
1454a7551:     	incq	%r9
1454a7554:     	addq	$-0x2, %r11
1454a7558:     	cmpb	$0x1, %bl
1454a755b:     	je	0x1454a7540 <.text+0x54a6540>
1454a755d:     	movzbl	%bl, %r10d
1454a7561:     	testl	%r10d, %r10d
1454a7564:     	je	0x1454a7580 <.text+0x54a6580>
1454a7566:     	jmp	0x1454a7573 <.text+0x54a6573>
1454a7568:     	nopl	(%rax,%rax)
1454a7570:     	movq	%r10, %r9
1454a7573:     	subq	$0x1, %rcx
1454a7577:     	jb	0x1454a7589 <.text+0x54a6589>
1454a7579:     	movq	0x50(%rax,%r9,8), %rax
1454a757e:     	jmp	0x1454a752e <.text+0x54a652e>
1454a7580:     	movl	%r8d, 0x8(%rax,%r9,4)
1454a7585:     	jmp	0x1454a75b9 <.text+0x54a65b9>
1454a7587:     	xorl	%eax, %eax
1454a7589:     	movq	%rdi, 0x68(%rbp)
1454a758d:     	movq	%rax, 0x70(%rbp)
1454a7591:     	movq	$0x0, 0x78(%rbp)
1454a7599:     	movq	%r9, 0x80(%rbp)
1454a75a0:     	movq	$0x16, 0x88(%rbp)
1454a75ab:     	leaq	-0x60(%rbp), %rcx
1454a75af:     	leaq	0x68(%rbp), %rdx
1454a75b3:     	callq	0x14552a730 <.text+0x5529730>
1454a75b8:     	nop
1454a75b9:     	movaps	%xmm6, %xmm0
1454a75bc:     	callq	0x14577327d <.text+0x577227d>
1454a75c1:     	cvttss2si	%xmm0, %rax
1454a75c6:     	xorl	%ecx, %ecx
1454a75c8:     	xorps	%xmm1, %xmm1
1454a75cb:     	ucomiss	%xmm1, %xmm0
1454a75ce:     	cmovbl	%ecx, %eax
1454a75d1:     	ucomiss	0x45ff54(%rip), %xmm0   # 0x14590752c
1454a75d8:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454a75de:     	cmovbel	%eax, %r8d
1454a75e2:     	movq	(%rdi), %rax
1454a75e5:     	testq	%rax, %rax
1454a75e8:     	je	0x1454a7657 <.text+0x54a6657>
1454a75ea:     	movq	0x8e0(%r12), %rcx
1454a75f2:     	movw	$0x1c, %dx
1454a75f6:     	movzwl	0x36(%rax), %r10d
1454a75fb:     	movl	%r10d, %r11d
1454a75fe:     	addl	%r11d, %r11d
1454a7601:     	movq	$-0x1, %r9
1454a7608:     	nopl	(%rax,%rax)
1454a7610:     	testq	%r11, %r11
1454a7613:     	je	0x1454a7640 <.text+0x54a6640>
1454a7615:     	cmpw	0x3a(%rax,%r9,2), %dx
1454a761b:     	seta	%bl
1454a761e:     	sbbb	$0x0, %bl
1454a7621:     	incq	%r9
1454a7624:     	addq	$-0x2, %r11
1454a7628:     	cmpb	$0x1, %bl
1454a762b:     	je	0x1454a7610 <.text+0x54a6610>
1454a762d:     	movzbl	%bl, %r10d
1454a7631:     	testl	%r10d, %r10d
1454a7634:     	je	0x1454a7650 <.text+0x54a6650>
1454a7636:     	jmp	0x1454a7643 <.text+0x54a6643>
1454a7638:     	nopl	(%rax,%rax)
1454a7640:     	movq	%r10, %r9
1454a7643:     	subq	$0x1, %rcx
1454a7647:     	jb	0x1454a7659 <.text+0x54a6659>
1454a7649:     	movq	0x50(%rax,%r9,8), %rax
1454a764e:     	jmp	0x1454a75f6 <.text+0x54a65f6>
1454a7650:     	movl	%r8d, 0x8(%rax,%r9,4)
1454a7655:     	jmp	0x1454a7689 <.text+0x54a6689>
1454a7657:     	xorl	%eax, %eax
1454a7659:     	movq	%rdi, 0x68(%rbp)
1454a765d:     	movq	%rax, 0x70(%rbp)
1454a7661:     	movq	$0x0, 0x78(%rbp)
1454a7669:     	movq	%r9, 0x80(%rbp)
1454a7670:     	movq	$0x1c, 0x88(%rbp)
1454a767b:     	leaq	-0x60(%rbp), %rcx
1454a767f:     	leaq	0x68(%rbp), %rdx
1454a7683:     	callq	0x14552a730 <.text+0x5529730>
1454a7688:     	nop
1454a7689:     	movss	0x47c(%r12), %xmm0
1454a7693:     	mulss	0x45fea1(%rip), %xmm0   # 0x14590753c
1454a769b:     	movq	0x8d8(%r12), %rax
1454a76a3:     	testq	%rax, %rax
1454a76a6:     	je	0x1454a77a5 <.text+0x54a67a5>
1454a76ac:     	movq	0x8e0(%r12), %rsi
1454a76b4:     	movl	$0x455, %edx            # imm = 0x455
1454a76b9:     	movq	0x90(%rbp), %rcx
1454a76c0:     	movzwl	0x36(%rax), %r8d
1454a76c5:     	movl	%r8d, %r10d
1454a76c8:     	addl	%r10d, %r10d
1454a76cb:     	movq	$-0x1, %r9
1454a76d2:     	nopw	%cs:(%rax,%rax)
1454a76e0:     	testq	%r10, %r10
1454a76e3:     	je	0x1454a7710 <.text+0x54a6710>
1454a76e5:     	movzwl	0x3a(%rax,%r9,2), %r11d
1454a76eb:     	cmpl	%r11d, %edx
1454a76ee:     	seta	%r11b
1454a76f2:     	sbbb	$0x0, %r11b
1454a76f6:     	incq	%r9
1454a76f9:     	addq	$-0x2, %r10
1454a76fd:     	cmpb	$0x1, %r11b
1454a7701:     	je	0x1454a76e0 <.text+0x54a66e0>
1454a7703:     	movzbl	%r11b, %r8d
1454a7707:     	testl	%r8d, %r8d
1454a770a:     	je	0x1454a7724 <.text+0x54a6724>
1454a770c:     	jmp	0x1454a7713 <.text+0x54a6713>
1454a770e:     	nop
1454a7710:     	movq	%r8, %r9
1454a7713:     	subq	$0x1, %rsi
1454a7717:     	jb	0x1454a77a7 <.text+0x54a67a7>
1454a771d:     	movq	0x50(%rax,%r9,8), %rax
1454a7722:     	jmp	0x1454a76c0 <.text+0x54a66c0>
1454a7724:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454a772b:     	movq	0x38(%rbp), %rdx
1454a772f:     	testq	%rdx, %rdx
1454a7732:     	je	0x1454a7743 <.text+0x54a6743>
1454a7734:     	shlq	$0x3, %rdx
1454a7738:     	movl	$0x4, %r8d
1454a773e:     	callq	0x1400021d0 <.text+0x11d0>
1454a7743:     	movaps	0xc0(%rbp), %xmm6
1454a774a:     	movaps	0xd0(%rbp), %xmm7
1454a7751:     	movaps	0xe0(%rbp), %xmm8
1454a7759:     	movaps	0xf0(%rbp), %xmm9
1454a7761:     	movaps	0x100(%rbp), %xmm10
1454a7769:     	movaps	0x110(%rbp), %xmm11
1454a7771:     	movaps	0x120(%rbp), %xmm12
1454a7779:     	movaps	0x130(%rbp), %xmm13
1454a7781:     	movaps	0x140(%rbp), %xmm14
1454a7789:     	movaps	0x150(%rbp), %xmm15
1454a7791:     	addq	$0x1e8, %rsp            # imm = 0x1E8
1454a7798:     	popq	%rbx
1454a7799:     	popq	%rdi
1454a779a:     	popq	%rsi
1454a779b:     	popq	%r12
1454a779d:     	popq	%r13
1454a779f:     	popq	%r14
1454a77a1:     	popq	%r15
1454a77a3:     	popq	%rbp
1454a77a4:     	retq
1454a77a5:     	xorl	%eax, %eax
1454a77a7:     	movd	%xmm0, %r8d
1454a77ac:     	movq	%rdi, 0x68(%rbp)
1454a77b0:     	movq	%rax, 0x70(%rbp)
1454a77b4:     	movq	$0x0, 0x78(%rbp)
1454a77bc:     	movq	%r9, 0x80(%rbp)
1454a77c3:     	movq	$0x455, 0x88(%rbp)      # imm = 0x455
1454a77ce:     	leaq	-0x60(%rbp), %rcx
1454a77d2:     	leaq	0x68(%rbp), %rdx
1454a77d6:     	callq	0x14552a730 <.text+0x5529730>
1454a77db:     	nop
1454a77dc:     	movq	0x90(%rbp), %rcx
1454a77e3:     	movq	0x38(%rbp), %rdx
1454a77e7:     	testq	%rdx, %rdx
1454a77ea:     	jne	0x1454a7734 <.text+0x54a6734>
1454a77f0:     	jmp	0x1454a7743 <.text+0x54a6743>
1454a77f5:     	addss	%xmm7, %xmm6
1454a77f9:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a77fe:     	movaps	0x90(%rbp), %xmm2
1454a7805:     	addss	%xmm7, %xmm2
1454a7809:     	movaps	%xmm2, 0x90(%rbp)
1454a7810:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a7815:     	addss	%xmm7, %xmm15
1454a781a:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a781f:     	addss	%xmm7, %xmm1
1454a7823:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a7828:     	addss	%xmm7, %xmm5
1454a782c:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a7831:     	movaps	%xmm4, -0x10(%rbp)
1454a7835:     	movaps	0x50(%rbp), %xmm12
1454a783a:     	movss	0x40(%r11), %xmm9
1454a7840:     	mulss	0x46bab3(%rip), %xmm9   # 0x1459132fc
1454a7849:     	movaps	%xmm15, %xmm8
1454a784d:     	movaps	%xmm14, %xmm15
1454a7851:     	movaps	%xmm3, %xmm14
1454a7855:     	movaps	%xmm11, %xmm3
1454a7859:     	movaps	%xmm6, %xmm11
1454a785d:     	movaps	%xmm0, %xmm6
1454a7860:     	movaps	%xmm7, %xmm0
1454a7863:     	minss	%xmm9, %xmm0
1454a7868:     	movaps	%xmm10, %xmm2
1454a786c:     	movaps	%xmm0, %xmm10
1454a7870:     	cmpunordss	%xmm0, %xmm10
1454a7876:     	movaps	%xmm10, %xmm9
1454a787a:     	andnps	%xmm0, %xmm9
1454a787e:     	movaps	%xmm6, %xmm0
1454a7881:     	movaps	%xmm11, %xmm6
1454a7885:     	movaps	%xmm3, %xmm11
1454a7889:     	movaps	%xmm14, %xmm3
1454a788d:     	movaps	%xmm15, %xmm14
1454a7891:     	movaps	%xmm8, %xmm15
1454a7895:     	andps	%xmm7, %xmm10
1454a7899:     	orps	%xmm9, %xmm10
1454a789d:     	movaps	%xmm10, %xmm4
1454a78a1:     	movaps	%xmm2, %xmm10
1454a78a5:     	addss	%xmm12, %xmm4
1454a78aa:     	movaps	%xmm4, 0x50(%rbp)
1454a78ae:     	movaps	-0x10(%rbp), %xmm4
1454a78b2:     	mulss	0x45fc4e(%rip), %xmm7   # 0x145907508
1454a78ba:     	addss	%xmm7, %xmm15
1454a78bf:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a78c1:     	addss	%xmm7, %xmm0
1454a78c5:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a78c7:     	addss	%xmm7, %xmm13
1454a78cc:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a78ce:     	movaps	0x20(%rbp), %xmm2
1454a78d2:     	addss	%xmm7, %xmm2
1454a78d6:     	movaps	%xmm2, 0x20(%rbp)
1454a78da:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a78dc:     	addss	%xmm7, %xmm11
1454a78e1:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a78e3:     	addss	0x45fba5(%rip), %xmm7   # 0x145907490
1454a78eb:     	mulss	%xmm7, %xmm14
1454a78f0:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a78f2:     	addss	%xmm7, %xmm3
1454a78f6:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a78f8:     	movaps	0x10(%rbp), %xmm2
1454a78fc:     	addss	%xmm7, %xmm2
1454a7900:     	movaps	%xmm2, 0x10(%rbp)
1454a7904:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a7906:     	movaps	(%rbp), %xmm2
1454a790a:     	addss	%xmm7, %xmm2
1454a790e:     	movaps	%xmm2, (%rbp)
1454a7912:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a7914:     	addss	%xmm7, %xmm10
1454a7919:     	nopl	(%rax)
1454a7920:     	addq	$0x18, %r9
1454a7924:     	cmpq	%r9, %r8
1454a7927:     	je	0x1454a70d8 <.text+0x54a60d8>
1454a792d:     	movss	0x10(%rdx,%r9), %xmm7
1454a7934:     	movq	(%rdx,%r9), %r11
1454a7938:     	movzbl	0x44(%r11), %esi
1454a793d:     	movslq	(%r10,%rsi,4), %rsi
1454a7941:     	addq	%r10, %rsi
1454a7944:     	jmpq	*%rsi
1454a7946:     	movaps	0x40(%rbp), %xmm2
1454a794a:     	addss	%xmm7, %xmm2
1454a794e:     	movaps	%xmm2, 0x40(%rbp)
1454a7952:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a7954:     	addss	%xmm7, %xmm4
1454a7958:     	jmp	0x1454a7920 <.text+0x54a6920>
1454a795a:     	nopw	(%rax,%rax)
1454a7960:     	addq	$0x8, %rdx
1454a7964:     	cmpq	%rdx, %r15
1454a7967:     	je	0x1454a7ab8 <.text+0x54a6ab8>
1454a796d:     	movzbl	(%r13,%rdx), %r9d
1454a7973:     	movslq	(%r8,%r9,4), %r9
1454a7977:     	addq	%r8, %r9
1454a797a:     	jmpq	*%r9
1454a797d:     	addss	0x4(%r13,%rdx), %xmm6
1454a7984:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7986:     	addss	0x4(%r13,%rdx), %xmm9
1454a798d:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a798f:     	movaps	0x40(%rbp), %xmm2
1454a7993:     	addss	0x4(%r13,%rdx), %xmm2
1454a799a:     	movaps	%xmm2, 0x40(%rbp)
1454a799e:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a79a0:     	movaps	(%rbp), %xmm2
1454a79a4:     	addss	0x4(%r13,%rdx), %xmm2
1454a79ab:     	movaps	%xmm2, (%rbp)
1454a79af:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a79b1:     	movaps	0x50(%rbp), %xmm2
1454a79b5:     	addss	0x4(%r13,%rdx), %xmm2
1454a79bc:     	movaps	%xmm2, 0x50(%rbp)
1454a79c0:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a79c2:     	movaps	0x20(%rbp), %xmm2
1454a79c6:     	addss	0x4(%r13,%rdx), %xmm2
1454a79cd:     	movaps	%xmm2, 0x20(%rbp)
1454a79d1:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a79d3:     	addss	0x4(%r13,%rdx), %xmm3
1454a79da:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a79dc:     	addss	0x4(%r13,%rdx), %xmm1
1454a79e3:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a79e8:     	addss	0x4(%r13,%rdx), %xmm12
1454a79ef:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a79f4:     	addss	0x4(%r13,%rdx), %xmm5
1454a79fb:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a00:     	addss	0x4(%r13,%rdx), %xmm13
1454a7a07:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a0c:     	movaps	0x90(%rbp), %xmm2
1454a7a13:     	addss	0x4(%r13,%rdx), %xmm2
1454a7a1a:     	movaps	%xmm2, 0x90(%rbp)
1454a7a21:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a26:     	addss	0x4(%r13,%rdx), %xmm15
1454a7a2d:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a32:     	movss	0xb0(%rbp), %xmm2
1454a7a3a:     	addss	0x4(%r13,%rdx), %xmm2
1454a7a41:     	movss	%xmm2, 0xb0(%rbp)
1454a7a49:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a4e:     	addss	0x4(%r13,%rdx), %xmm0
1454a7a55:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a5a:     	addss	0x4(%r13,%rdx), %xmm10
1454a7a61:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a66:     	addss	0x4(%r13,%rdx), %xmm11
1454a7a6d:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a72:     	movss	0xb4(%rbp), %xmm2
1454a7a7a:     	addss	0x4(%r13,%rdx), %xmm2
1454a7a81:     	movss	%xmm2, 0xb4(%rbp)
1454a7a89:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a8e:     	addss	0x4(%r13,%rdx), %xmm7
1454a7a95:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7a9a:     	movaps	%xmm14, %xmm2
1454a7a9e:     	movss	0x4(%r13,%rdx), %xmm14
1454a7aa5:     	addss	0x45f9e2(%rip), %xmm14  # 0x145907490
1454a7aae:     	mulss	%xmm2, %xmm14
1454a7ab3:     	jmp	0x1454a7960 <.text+0x54a6960>
1454a7ab8:     	movaps	%xmm5, %xmm8
1454a7abc:     	movaps	%xmm12, %xmm5
1454a7ac0:     	movaps	%xmm1, %xmm12
1454a7ac4:     	movaps	%xmm9, %xmm1
1454a7ac8:     	movaps	%xmm3, -0x20(%rbp)
1454a7acc:     	movaps	%xmm12, %xmm3
1454a7ad0:     	movaps	%xmm7, 0x10(%rbp)
1454a7ad4:     	movaps	%xmm13, -0x30(%rbp)
1454a7ad9:     	movaps	%xmm10, -0x40(%rbp)
1454a7ade:     	movss	0x45fa4d(%rip), %xmm13  # 0x145907534
1454a7ae7:     	jmp	0x1454a7142 <.text+0x54a6142>
