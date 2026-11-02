
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c5a66:     	testq	%rdi, %rdi
1454c5a69:     	je	0x1454c5e6f <.text+0x54c4e6f>
1454c5a6f:     	cmpq	0x7b0(%rsi), %rdi
1454c5a76:     	jne	0x1454c5e6f <.text+0x54c4e6f>
1454c5a7c:     	movl	0x68(%rbp), %eax
1454c5a7f:     	movl	%eax, 0x160(%rbp)
1454c5a85:     	movq	0x60(%rbp), %rax
1454c5a89:     	movq	%rax, 0x158(%rbp)
1454c5a90:     	movq	$0x0, 0x7b0(%rsi)
1454c5a9b:     	movss	0x8e4(%rsi), %xmm7
1454c5aa3:     	movss	0x4259d5(%rip), %xmm0   # 0x1458eb480
1454c5aab:     	addss	%xmm7, %xmm0
1454c5aaf:     	movss	%xmm0, 0x7e8(%rsi)
1454c5ab7:     	movq	0x2a0(%rsi), %rcx
1454c5abe:     	testq	%rcx, %rcx
1454c5ac1:     	je	0x1454c5e6f <.text+0x54c4e6f>
1454c5ac7:     	movq	0x298(%rsi), %rax
1454c5ace:     	imulq	$0x58, %rcx, %r8
1454c5ad2:     	xorl	%ecx, %ecx
1454c5ad4:     	movabsq	$0x5f737265746e7568, %r9 # imm = 0x5F737265746E7568
1454c5ade:     	jmp	0x1454c5aed <.text+0x54c4aed>
1454c5ae0:     	addq	$0x58, %rcx
1454c5ae4:     	cmpq	%rcx, %r8
1454c5ae7:     	je	0x1454c5e6f <.text+0x54c4e6f>
1454c5aed:     	movq	(%rax,%rcx), %r14
1454c5af1:     	cmpq	$0xc, 0x8(%r14)
1454c5af6:     	jne	0x1454c5ae0 <.text+0x54c4ae0>
1454c5af8:     	movq	(%r14), %rdx
1454c5afb:     	movq	(%rdx), %r10
1454c5afe:     	xorq	%r9, %r10
1454c5b01:     	movl	0x8(%rdx), %r11d
1454c5b05:     	xorq	$0x6b72616d, %r11       # imm = 0x6B72616D
1454c5b0c:     	orq	%r10, %r11
1454c5b0f:     	jne	0x1454c5ae0 <.text+0x54c4ae0>
1454c5b11:     	movl	0x8(%rax,%rcx), %r8d
1454c5b16:     	movss	0x14(%rax,%rcx), %xmm0
1454c5b1c:     	movl	0x18(%rax,%rcx), %r9d
1454c5b21:     	movl	0x34(%rax,%rcx), %r10d
1454c5b26:     	movl	%r10d, 0x124(%rbp)
1454c5b2d:     	movups	0x24(%rax,%rcx), %xmm1
1454c5b32:     	movups	%xmm1, 0x114(%rbp)
1454c5b39:     	movups	0x38(%rax,%rcx), %xmm1
1454c5b3e:     	movups	0x44(%rax,%rcx), %xmm2
1454c5b43:     	movups	%xmm1, 0x128(%rbp)
1454c5b4a:     	movups	%xmm2, 0x134(%rbp)
1454c5b51:     	movq	%r14, 0xf0(%rbp)
1454c5b58:     	movl	%r8d, 0xf8(%rbp)
1454c5b5f:     	movss	0x10(%rax,%rcx), %xmm8
1454c5b66:     	movsd	0xc(%rax,%rcx), %xmm1
1454c5b6c:     	movsd	%xmm1, 0xfc(%rbp)
1454c5b74:     	movss	%xmm0, 0x104(%rbp)
1454c5b7c:     	movl	%r9d, 0x108(%rbp)
1454c5b83:     	movsd	0x1c(%rax,%rcx), %xmm0
1454c5b89:     	movsd	%xmm0, 0x10c(%rbp)
1454c5b91:     	leaq	0x720(%rsi), %rcx
1454c5b98:     	movl	$0xc, %r8d
1454c5b9e:     	callq	0x145413960 <.text+0x5412960>
1454c5ba3:     	ucomiss	%xmm0, %xmm7
1454c5ba6:     	jb	0x1454c5e6f <.text+0x54c4e6f>
1454c5bac:     	movb	$0x1, 0x176(%rbp)
1454c5bb3:     	leaq	0xf0(%rbp), %rdx
1454c5bba:     	movq	%rsi, %rcx
1454c5bbd:     	callq	0x1454d49e0 <.text+0x54d39e0>
1454c5bc2:     	nop
1454c5bc3:     	leaq	0x458(%rsi), %rdx
1454c5bca:     	movss	0x458(%rsi), %xmm11
1454c5bd3:     	movss	0x45c(%rsi), %xmm7
1454c5bdb:     	leaq	0xf0(%rbp), %rcx
1454c5be2:     	callq	0x1454f96d0 <.text+0x54f86d0>
1454c5be7:     	movq	%rdi, 0xb8(%rbp)
1454c5bee:     	movb	$0x1, 0x176(%rbp)
1454c5bf5:     	leaq	0xb8(%rbp), %rax
1454c5bfc:     	movq	%rax, 0x20(%rsp)
1454c5c01:     	movq	$0x1, 0x28(%rsp)
1454c5c0a:     	leaq	0x88(%rbp), %rcx
1454c5c11:     	leaq	0x158(%rbp), %r8
1454c5c18:     	movq	%rsi, %rdx
1454c5c1b:     	movaps	%xmm0, %xmm3
1454c5c1e:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454c5c23:     	nop
1454c5c24:     	movq	0x90(%rbp), %r9
1454c5c2b:     	movq	0x98(%rbp), %r15
1454c5c32:     	movl	$0x2, 0x48(%rbp)
1454c5c39:     	movl	$0x0, (%rbp)
1454c5c40:     	movb	$0x1, 0x174(%rbp)
1454c5c47:     	movq	%rbp, %rax
1454c5c4a:     	movq	%rax, 0x30(%rsp)
1454c5c4f:     	leaq	0x48(%rbp), %rax
1454c5c53:     	movq	%rax, 0x28(%rsp)
1454c5c58:     	movq	%r15, 0x20(%rsp)
1454c5c5d:     	leaq	0xb8(%rbp), %rcx
1454c5c64:     	movq	%rdi, %rdx
1454c5c67:     	movl	$0x5a9, %r8d            # imm = 0x5A9
1454c5c6d:     	movq	%r9, 0x150(%rbp)
1454c5c74:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454c5c79:     	nop
1454c5c7a:     	movq	0x548(%rsi), %r12
1454c5c81:     	cmpq	0x538(%rsi), %r12
1454c5c88:     	jne	0x1454c5c97 <.text+0x54c4c97>
1454c5c8a:     	leaq	0x538(%rsi), %rcx
1454c5c91:     	callq	0x1457580b0 <.text+0x57570b0>
1454c5c96:     	nop
1454c5c97:     	movq	0x540(%rsi), %rax
1454c5c9e:     	movq	%r12, %rcx
1454c5ca1:     	shlq	$0x5, %rcx
1454c5ca5:     	movups	0xb8(%rbp), %xmm0
1454c5cac:     	movups	0xc8(%rbp), %xmm1
1454c5cb3:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c5cb8:     	movups	%xmm0, (%rax,%rcx)
1454c5cbc:     	incq	%r12
1454c5cbf:     	movq	%r12, 0x548(%rsi)
1454c5cc6:     	movzbl	0x75(%r14), %eax
1454c5ccb:     	addb	$-0x2, %al
1454c5ccd:     	cmpb	$0x6, %al
1454c5ccf:     	ja	0x1454c5ce2 <.text+0x54c4ce2>
1454c5cd1:     	movzbl	%al, %eax
1454c5cd4:     	leaq	0x14e6dc1(%rip), %rcx   # 0x1469aca9c
1454c5cdb:     	movss	(%rcx,%rax,4), %xmm0
1454c5ce0:     	jmp	0x1454c5cea <.text+0x54c4cea>
1454c5ce2:     	movss	0x425796(%rip), %xmm0   # 0x1458eb480
1454c5cea:     	movq	0x88(%rbp), %rax
1454c5cf1:     	movq	%rax, 0x168(%rbp)
1454c5cf8:     	testq	%r15, %r15
1454c5cfb:     	je	0x1454c5e4d <.text+0x54c4e4d>
1454c5d01:     	movss	0x44(%r14), %xmm1
1454c5d07:     	mulss	0x13c(%rbp), %xmm11
1454c5d10:     	xorps	%xmm2, %xmm2
1454c5d13:     	cmpltss	%xmm1, %xmm2
1454c5d18:     	andps	%xmm11, %xmm2
1454c5d1c:     	mulss	0x43301c(%rip), %xmm1   # 0x1458f8d40
1454c5d24:     	mulss	%xmm1, %xmm8
1454c5d29:     	mulss	0x128(%rbp), %xmm8
1454c5d32:     	mulss	%xmm0, %xmm8
1454c5d37:     	addss	%xmm2, %xmm8
1454c5d3c:     	mulss	%xmm8, %xmm7
1454c5d41:     	shlq	$0x3, %r15
1454c5d45:     	movzbl	0x111(%rsi), %r12d
1454c5d4d:     	movups	0x20(%rsi), %xmm8
1454c5d52:     	movups	0x40(%rsi), %xmm11
1454c5d57:     	xorl	%r13d, %r13d
1454c5d5a:     	movss	0x52565d(%rip), %xmm12  # 0x1459eb3c0
1454c5d63:     	movq	0x150(%rbp), %rax
1454c5d6a:     	movq	(%rax,%r13), %rdx
1454c5d6e:     	movq	0x880(%rsi), %rax
1454c5d75:     	movq	0x898(%rsi), %rcx
1454c5d7c:     	leaq	(%rcx,%rax), %r8
1454c5d80:     	rolq	$0x17, %r8
1454c5d84:     	addq	%rax, %r8
1454c5d87:     	movq	0x888(%rsi), %r9
1454c5d8e:     	movq	%r9, %r10
1454c5d91:     	shlq	$0x11, %r10
1454c5d95:     	movq	0x890(%rsi), %r11
1454c5d9c:     	xorq	%rax, %r11
1454c5d9f:     	xorq	%r9, %rcx
1454c5da2:     	xorq	%r11, %r9
1454c5da5:     	movq	%r9, 0x888(%rsi)
1454c5dac:     	xorq	%rcx, %rax
1454c5daf:     	movq	%rax, 0x880(%rsi)
1454c5db6:     	xorq	%r10, %r11
1454c5db9:     	movq	%r11, 0x890(%rsi)
1454c5dc0:     	rolq	$0x2d, %rcx
1454c5dc4:     	movq	%rcx, 0x898(%rsi)
1454c5dcb:     	shrq	$0x28, %r8
1454c5dcf:     	xorps	%xmm0, %xmm0
1454c5dd2:     	cvtsi2ss	%r8d, %xmm0
1454c5dd7:     	mulss	%xmm12, %xmm0
1454c5ddc:     	movss	0x464(%rsi), %xmm1
1454c5de4:     	movss	0x468(%rsi), %xmm2
1454c5dec:     	mulss	%xmm7, %xmm2
1454c5df0:     	movl	0x40(%r14), %r9d
1454c5df4:     	movzbl	0x74(%r14), %eax
1454c5df9:     	movb	$0x3, 0x111(%rsi)
1454c5e00:     	movq	$0x0, 0x20(%rsi)
1454c5e08:     	movq	$0x0, 0x40(%rsi)
1454c5e10:     	ucomiss	%xmm0, %xmm1
1454c5e13:     	ja	0x1454c5e18 <.text+0x54c4e18>
1454c5e15:     	movaps	%xmm7, %xmm2
1454c5e18:     	seta	0x28(%rsp)
1454c5e1d:     	movb	%al, 0x20(%rsp)
1454c5e21:     	movb	$0x0, 0x30(%rsp)
1454c5e26:     	movq	%rsi, %rcx
1454c5e29:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454c5e2e:     	nop
1454c5e2f:     	movb	%r12b, 0x111(%rsi)
1454c5e36:     	movups	%xmm8, 0x20(%rsi)
1454c5e3b:     	movups	%xmm11, 0x40(%rsi)
1454c5e40:     	addq	$0x8, %r13
1454c5e44:     	cmpq	%r13, %r15
1454c5e47:     	jne	0x1454c5d63 <.text+0x54c4d63>
1454c5e4d:     	movq	0x168(%rbp), %rdx
1454c5e54:     	testq	%rdx, %rdx
1454c5e57:     	je	0x1454c5e6f <.text+0x54c4e6f>
1454c5e59:     	shlq	$0x3, %rdx
1454c5e5d:     	movl	$0x8, %r8d
1454c5e63:     	movq	0x150(%rbp), %rcx
1454c5e6a:     	callq	0x1400021d0 <.text+0x11d0>
