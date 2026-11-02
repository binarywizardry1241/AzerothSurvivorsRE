
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c4d50:     	movaps	(%rbp), %xmm0
1454c4d54:     	movaps	%xmm0, -0x40(%rbp)
1454c4d58:     	movq	0x10(%rbp), %rax
1454c4d5c:     	movq	%rax, -0x30(%rbp)
1454c4d60:     	movlps	%xmm9, 0x60(%rbp)
1454c4d65:     	movss	%xmm10, 0x68(%rbp)
1454c4d6b:     	movq	%rdi, -0x10(%rbp)
1454c4d6f:     	movq	0x298(%rsi), %rax
1454c4d76:     	imulq	$0x58, 0x2a0(%rsi), %rcx
1454c4d7e:     	xorl	%edx, %edx
1454c4d80:     	cmpq	%rdx, %rcx
1454c4d83:     	je	0x1454c5fc8 <.text+0x54c4fc8>
1454c4d89:     	movq	(%rax,%rdx), %r8
1454c4d8d:     	addq	$0x58, %rdx
1454c4d91:     	cmpb	$0xb, 0x75(%r8)
1454c4d96:     	jne	0x1454c4d80 <.text+0x54c3d80>
1454c4d98:     	movzbl	0x111(%rsi), %r15d
1454c4da0:     	testl	%r15d, %r15d
1454c4da3:     	sete	%r13b
1454c4da7:     	cmpq	$0x0, 0x40(%rsi)
1454c4dac:     	sete	%al
1454c4daf:     	cmpl	$0x0, 0x104(%rsi)
1454c4db6:     	sete	%cl
1454c4db9:     	andb	%al, %cl
1454c4dbb:     	movzbl	0x7ec(%rsi), %eax
1454c4dc2:     	xorb	$0x1, %al
1454c4dc4:     	andb	%cl, %al
1454c4dc6:     	xorps	%xmm0, %xmm0
1454c4dc9:     	ucomiss	%xmm11, %xmm0
1454c4dcd:     	jb	0x1454c4ded <.text+0x54c3ded>
1454c4dcf:     	movl	%r15d, %ecx
1454c4dd2:     	leaq	0x14e7fbb(%rip), %rdx   # 0x1469acd94
1454c4dd9:     	movslq	(%rdx,%rcx,4), %rcx
1454c4ddd:     	addq	%rdx, %rcx
1454c4de0:     	movl	%eax, %edx
1454c4de2:     	jmpq	*%rcx
1454c4de4:     	movzbl	0x30(%rsi), %edx
1454c4de8:     	xorb	$0x1, %dl
1454c4deb:     	jmp	0x1454c4def <.text+0x54c3def>
1454c4ded:     	xorl	%edx, %edx
1454c4def:     	movl	%edx, 0x150(%rbp)
1454c4df5:     	andb	%al, %r13b
1454c4df8:     	leaq	0x798(%rsi), %r14
1454c4dff:     	movq	0x7a0(%rsi), %rdx
1454c4e06:     	movq	0x7a8(%rsi), %rcx
1454c4e0d:     	movabsq	$0xffffffffffffff8, %r8 # imm = 0xFFFFFFFFFFFFFF8
1454c4e17:     	andq	%rcx, %r8
1454c4e1a:     	xorl	%r9d, %r9d
1454c4e1d:     	nopl	(%rax)
1454c4e20:     	cmpq	%r9, %r8
1454c4e23:     	je	0x1454c4e62 <.text+0x54c3e62>
1454c4e25:     	cmpq	%rdi, (%rdx,%r9,8)
1454c4e29:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e2b:     	cmpq	%rdi, 0x8(%rdx,%r9,8)
1454c4e30:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e32:     	cmpq	%rdi, 0x10(%rdx,%r9,8)
1454c4e37:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e39:     	cmpq	%rdi, 0x18(%rdx,%r9,8)
1454c4e3e:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e40:     	cmpq	%rdi, 0x20(%rdx,%r9,8)
1454c4e45:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e47:     	cmpq	%rdi, 0x28(%rdx,%r9,8)
1454c4e4c:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e4e:     	cmpq	%rdi, 0x30(%rdx,%r9,8)
1454c4e53:     	je	0x1454c4e78 <.text+0x54c3e78>
1454c4e55:     	cmpq	%rdi, 0x38(%rdx,%r9,8)
1454c4e5a:     	leaq	0x8(%r9), %r9
1454c4e5e:     	jne	0x1454c4e20 <.text+0x54c3e20>
1454c4e60:     	jmp	0x1454c4e78 <.text+0x54c3e78>
1454c4e62:     	shll	$0x3, %ecx
1454c4e65:     	andl	$0x38, %ecx
1454c4e68:     	je	0x1454c4fd6 <.text+0x54c3fd6>
1454c4e6e:     	cmpq	%rdi, (%rdx,%r8,8)
1454c4e72:     	jne	0x1454c4fcd <.text+0x54c3fcd>
1454c4e78:     	cmpb	$0x2, %r15b
1454c4e7c:     	setb	%cl
1454c4e7f:     	andb	%al, %cl
1454c4e81:     	cmpb	$0x1, %cl
1454c4e84:     	jne	0x1454c4fb3 <.text+0x54c3fb3>
1454c4e8a:     	movq	$-0x160, %rax           # imm = 0xFEA0
1454c4e91:     	addq	0x4c8(%rsi), %rax
1454c4e98:     	imulq	$0x160, 0x4d0(%rsi), %rcx # imm = 0x160
1454c4ea3:     	nopw	%cs:(%rax,%rax)
1454c4eb0:     	movb	$0x1, %r12b
1454c4eb3:     	testq	%rcx, %rcx
1454c4eb6:     	je	0x1454c4fd9 <.text+0x54c3fd9>
1454c4ebc:     	leaq	0x160(%rax), %rdx
1454c4ec3:     	addq	$-0x160, %rcx           # imm = 0xFEA0
1454c4eca:     	cmpq	%rdi, 0x1e8(%rax)
1454c4ed1:     	movq	%rdx, %rax
1454c4ed4:     	jne	0x1454c4eb0 <.text+0x54c3eb0>
1454c4ed6:     	movss	0x8e4(%rsi), %xmm2
1454c4ede:     	movss	0xf4(%rdx), %xmm7
1454c4ee6:     	leaq	0xf4(%rbp), %rcx
1454c4eed:     	callq	0x14540d200 <.text+0x540c200>
1454c4ef2:     	movl	0xfc(%rbp), %eax
1454c4ef8:     	movl	%eax, 0x160(%rbp)
1454c4efe:     	movq	0xf4(%rbp), %rax
1454c4f05:     	movq	%rax, 0x158(%rbp)
1454c4f0c:     	movq	%rdi, 0xf0(%rbp)
1454c4f13:     	leaq	0xf0(%rbp), %rdx
1454c4f1a:     	movq	%r14, %rcx
1454c4f1d:     	callq	0x145524410 <.text+0x5523410>
1454c4f22:     	movss	0x8e4(%rsi), %xmm0
1454c4f2a:     	movq	0x4c8(%rsi), %rax
1454c4f31:     	imulq	$0x160, 0x4d0(%rsi), %rdx # imm = 0x160
1454c4f3c:     	xorl	%ecx, %ecx
1454c4f3e:     	movq	%rax, %r8
1454c4f41:     	cmpq	%rcx, %rdx
1454c4f44:     	je	0x1454c5687 <.text+0x54c4687>
1454c4f4a:     	addq	$0x160, %rcx            # imm = 0x160
1454c4f51:     	cmpq	%rdi, 0x88(%r8)
1454c4f58:     	leaq	0x160(%r8), %r8
1454c4f5f:     	jne	0x1454c4f41 <.text+0x54c3f41>
1454c4f61:     	movl	$0x0, -0x20(%rax,%rcx)
1454c4f69:     	movss	%xmm0, -0x34(%rax,%rcx)
1454c4f6f:     	movl	-0xf8(%rax,%rcx), %r8d
1454c4f77:     	movq	-0xd0(%rax,%rcx), %rdx
1454c4f7f:     	testq	%rdx, %rdx
1454c4f82:     	je	0x1454c5666 <.text+0x54c4666>
1454c4f88:     	testl	%r8d, %r8d
1454c4f8b:     	jne	0x1454c5687 <.text+0x54c4687>
1454c4f91:     	movss	-0x58(%rax,%rcx), %xmm3
1454c4f97:     	movl	0x24(%rdx), %r8d
1454c4f9b:     	movb	$0x1, 0x176(%rbp)
1454c4fa2:     	movq	%rsi, %rcx
1454c4fa5:     	movq	%rdi, %rdx
1454c4fa8:     	callq	0x1454d5440 <.text+0x54d4440>
1454c4fad:     	nop
1454c4fae:     	jmp	0x1454c566b <.text+0x54c466b>
1454c4fb3:     	movb	$0x1, %r12b
1454c4fb6:     	xorps	%xmm0, %xmm0
1454c4fb9:     	ucomiss	%xmm11, %xmm0
1454c4fbd:     	jb	0x1454c4fd9 <.text+0x54c3fd9>
1454c4fbf:     	leaq	-0x10(%rbp), %rdx
1454c4fc3:     	movq	%r14, %rcx
1454c4fc6:     	callq	0x145524410 <.text+0x5523410>
1454c4fcb:     	jmp	0x1454c4fd9 <.text+0x54c3fd9>
1454c4fcd:     	cmpl	$0x8, %ecx
1454c4fd0:     	jne	0x1454c5119 <.text+0x54c4119>
1454c4fd6:     	xorl	%r12d, %r12d
