
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145531cb0:     	pushq	%rbp
145531cb1:     	pushq	%r15
145531cb3:     	pushq	%r14
145531cb5:     	pushq	%r13
145531cb7:     	pushq	%r12
145531cb9:     	pushq	%rsi
145531cba:     	pushq	%rdi
145531cbb:     	pushq	%rbx
145531cbc:     	subq	$0x88, %rsp
145531cc3:     	leaq	0x80(%rsp), %rbp
145531ccb:     	movaps	%xmm8, -0x10(%rbp)
145531cd0:     	movaps	%xmm7, -0x20(%rbp)
145531cd4:     	movaps	%xmm6, -0x30(%rbp)
145531cd8:     	movq	$-0x2, -0x38(%rbp)
145531ce0:     	movq	%rcx, %rax
145531ce3:     	movq	0x20(%rdx), %rbx
145531ce7:     	testq	%rbx, %rbx
145531cea:     	je	0x145531de6 <.text+0x5530de6>
145531cf0:     	decq	%rbx
145531cf3:     	movq	%rbx, 0x20(%rdx)
145531cf7:     	movq	(%rdx), %r15
145531cfa:     	movq	0x8(%rdx), %r14
145531cfe:     	cmpq	%r14, %r15
145531d01:     	je	0x145531de6 <.text+0x5530de6>
145531d07:     	movq	0x10(%rdx), %r12
145531d0b:     	movq	0x18(%rdx), %r13
145531d0f:     	addq	$0x160, %r15            # imm = 0x160
145531d16:     	xorps	%xmm0, %xmm0
145531d19:     	movss	0x3b975f(%rip), %xmm6   # 0x1458eb480
145531d21:     	movss	0x11dc87b(%rip), %xmm7  # 0x14670e5a4
145531d29:     	jmp	0x145531d9a <.text+0x5530d9a>
145531d2b:     	movss	(%r12), %xmm2
145531d31:     	subss	-0x3c(%r15), %xmm2
145531d37:     	divss	%xmm1, %xmm2
145531d3b:     	xorps	%xmm1, %xmm1
145531d3e:     	maxss	%xmm2, %xmm1
145531d42:     	movaps	%xmm6, %xmm2
145531d45:     	minss	%xmm1, %xmm2
145531d49:     	movsd	-0x54(%r15), %xmm3
145531d4f:     	movsd	-0x48(%r15), %xmm4
145531d55:     	subps	%xmm3, %xmm4
145531d58:     	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
145531d5c:     	mulps	%xmm4, %xmm1
145531d5f:     	addps	%xmm3, %xmm1
145531d62:     	movsd	(%r13), %xmm2
145531d68:     	subps	%xmm2, %xmm1
145531d6b:     	mulps	%xmm1, %xmm1
145531d6e:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
145531d72:     	addss	%xmm1, %xmm2
145531d76:     	ucomiss	%xmm7, %xmm2
145531d79:     	ja	0x145531e1e <.text+0x5530e1e>
145531d7f:     	nop
145531d80:     	leaq	-0x160(%r15), %rcx
145531d87:     	addq	$0x160, %r15            # imm = 0x160
145531d8e:     	addq	$0x160, %rcx            # imm = 0x160
145531d95:     	cmpq	%r14, %rcx
145531d98:     	je	0x145531de6 <.text+0x5530de6>
145531d9a:     	cmpb	$0x0, -0xf8(%r15)
145531da2:     	jne	0x145531d80 <.text+0x5530d80>
145531da4:     	cmpq	$0x0, -0xd0(%r15)
145531dac:     	je	0x145531d80 <.text+0x5530d80>
145531dae:     	cmpq	$-0x1, -0x148(%r15)
145531db6:     	jne	0x145531d80 <.text+0x5530d80>
145531db8:     	cmpq	$-0x1, -0x120(%r15)
145531dc0:     	jne	0x145531d80 <.text+0x5530d80>
145531dc2:     	cmpb	$0x0, -0xe8(%r15)
145531dca:     	jne	0x145531d80 <.text+0x5530d80>
145531dcc:     	movss	-0x38(%r15), %xmm1
145531dd2:     	ucomiss	%xmm1, %xmm0
145531dd5:     	jb	0x145531d2b <.text+0x5530d2b>
145531ddb:     	movsd	-0x48(%r15), %xmm1
145531de1:     	jmp	0x145531d62 <.text+0x5530d62>
145531de6:     	movq	$0x0, (%rax)
145531ded:     	movq	$0x8, 0x8(%rax)
145531df5:     	movq	$0x0, 0x10(%rax)
145531dfd:     	movaps	-0x30(%rbp), %xmm6
145531e01:     	movaps	-0x20(%rbp), %xmm7
145531e05:     	movaps	-0x10(%rbp), %xmm8
145531e0a:     	addq	$0x88, %rsp
145531e11:     	popq	%rbx
145531e12:     	popq	%rdi
145531e13:     	popq	%rsi
145531e14:     	popq	%r12
145531e16:     	popq	%r13
145531e18:     	popq	%r14
145531e1a:     	popq	%r15
145531e1c:     	popq	%rbp
145531e1d:     	retq
145531e1e:     	movq	%rax, %rdi
145531e21:     	movq	%r15, (%rdx)
145531e24:     	movq	-0xd8(%r15), %rsi
145531e2b:     	callq	0x140002200 <.text+0x1200>
145531e30:     	movl	$0x20, %ecx
145531e35:     	movl	$0x8, %edx
145531e3a:     	callq	0x1400021c0 <.text+0x11c0>
145531e3f:     	testq	%rax, %rax
145531e42:     	je	0x145531fa7 <.text+0x5530fa7>
145531e48:     	movq	%rax, %rcx
145531e4b:     	movq	%rsi, (%rax)
145531e4e:     	movq	$0x4, -0x50(%rbp)
145531e56:     	movq	%rax, -0x48(%rbp)
145531e5a:     	movq	$0x1, -0x40(%rbp)
145531e62:     	testq	%rbx, %rbx
145531e65:     	movq	%rdi, %rax
145531e68:     	je	0x145531f8b <.text+0x5530f8b>
145531e6e:     	movl	$0x1, %esi
145531e73:     	xorps	%xmm8, %xmm8
145531e77:     	cmpq	%r14, %r15
145531e7a:     	je	0x145531f8b <.text+0x5530f8b>
145531e80:     	decq	%rbx
145531e83:     	addq	$0x160, %r15            # imm = 0x160
145531e8a:     	jmp	0x145531ebf <.text+0x5530ebf>
145531e8c:     	movsd	-0x48(%r15), %xmm0
145531e92:     	movsd	(%r13), %xmm1
145531e98:     	subps	%xmm1, %xmm0
145531e9b:     	mulps	%xmm0, %xmm0
145531e9e:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145531ea2:     	addss	%xmm0, %xmm1
145531ea6:     	ucomiss	%xmm7, %xmm1
145531ea9:     	ja	0x145531f39 <.text+0x5530f39>
145531eaf:     	cmpq	%r14, %r15
145531eb2:     	leaq	0x160(%r15), %r15
145531eb9:     	je	0x145531f8b <.text+0x5530f8b>
145531ebf:     	cmpb	$0x0, -0xf8(%r15)
145531ec7:     	jne	0x145531eaf <.text+0x5530eaf>
145531ec9:     	cmpq	$0x0, -0xd0(%r15)
145531ed1:     	je	0x145531eaf <.text+0x5530eaf>
145531ed3:     	cmpq	$-0x1, -0x148(%r15)
145531edb:     	jne	0x145531eaf <.text+0x5530eaf>
145531edd:     	cmpq	$-0x1, -0x120(%r15)
145531ee5:     	jne	0x145531eaf <.text+0x5530eaf>
145531ee7:     	cmpb	$0x0, -0xe8(%r15)
145531eef:     	jne	0x145531eaf <.text+0x5530eaf>
145531ef1:     	movss	-0x38(%r15), %xmm0
145531ef7:     	ucomiss	%xmm0, %xmm8
145531efb:     	jae	0x145531e8c <.text+0x5530e8c>
145531efd:     	movss	(%r12), %xmm1
145531f03:     	subss	-0x3c(%r15), %xmm1
145531f09:     	divss	%xmm0, %xmm1
145531f0d:     	xorps	%xmm0, %xmm0
145531f10:     	maxss	%xmm1, %xmm0
145531f14:     	movaps	%xmm6, %xmm1
145531f17:     	minss	%xmm0, %xmm1
145531f1b:     	movsd	-0x54(%r15), %xmm2
145531f21:     	movsd	-0x48(%r15), %xmm3
145531f27:     	subps	%xmm2, %xmm3
145531f2a:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
145531f2e:     	mulps	%xmm3, %xmm0
145531f31:     	addps	%xmm2, %xmm0
145531f34:     	jmp	0x145531e92 <.text+0x5530e92>
145531f39:     	movq	-0xd8(%r15), %rax
145531f40:     	movq	%rax, -0x58(%rbp)
145531f44:     	cmpq	-0x50(%rbp), %rsi
145531f48:     	jne	0x145531f70 <.text+0x5530f70>
145531f4a:     	movq	$0x8, 0x20(%rsp)
145531f53:     	movl	$0x1, %r8d
145531f59:     	movl	$0x8, %r9d
145531f5f:     	leaq	-0x50(%rbp), %rcx
145531f63:     	movq	%rsi, %rdx
145531f66:     	callq	0x145757d40 <.text+0x5756d40>
145531f6b:     	nop
145531f6c:     	movq	-0x48(%rbp), %rcx
145531f70:     	movq	-0x58(%rbp), %rax
145531f74:     	movq	%rax, (%rcx,%rsi,8)
145531f78:     	incq	%rsi
145531f7b:     	movq	%rsi, -0x40(%rbp)
145531f7f:     	testq	%rbx, %rbx
145531f82:     	movq	%rdi, %rax
145531f85:     	jne	0x145531e77 <.text+0x5530e77>
145531f8b:     	movq	-0x40(%rbp), %rcx
145531f8f:     	movq	%rcx, 0x10(%rax)
145531f93:     	movq	-0x50(%rbp), %rcx
145531f97:     	movq	%rcx, (%rax)
145531f9a:     	movq	-0x48(%rbp), %rcx
145531f9e:     	movq	%rcx, 0x8(%rax)
145531fa2:     	jmp	0x145531dfd <.text+0x5530dfd>
145531fa7:     	movl	$0x8, %ecx
145531fac:     	movl	$0x20, %edx
145531fb1:     	callq	0x1458e721b <.text+0x58e621b>
145531fb6:     	ud2
