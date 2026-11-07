
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145559c90:     	pushq	%rbp
145559c91:     	pushq	%r15
145559c93:     	pushq	%r14
145559c95:     	pushq	%r13
145559c97:     	pushq	%r12
145559c99:     	pushq	%rsi
145559c9a:     	pushq	%rdi
145559c9b:     	pushq	%rbx
145559c9c:     	subq	$0x118, %rsp            # imm = 0x118
145559ca3:     	leaq	0x80(%rsp), %rbp
145559cab:     	movaps	%xmm10, 0x80(%rbp)
145559cb3:     	movaps	%xmm9, 0x70(%rbp)
145559cb8:     	movaps	%xmm8, 0x60(%rbp)
145559cbd:     	movaps	%xmm7, 0x50(%rbp)
145559cc1:     	movaps	%xmm6, 0x40(%rbp)
145559cc5:     	movq	$-0x2, 0x38(%rbp)
145559ccd:     	movq	0x8(%rcx), %r12
145559cd1:     	movq	%rcx, 0x28(%rbp)
145559cd5:     	movq	0x18(%rcx), %rax
145559cd9:     	movq	%rax, 0x20(%rbp)
145559cdd:     	movq	0x10(%rdx), %rsi
145559ce1:     	movl	$0x6d8, %edi            # imm = 0x6D8
145559ce6:     	movq	%rdx, 0x30(%rbp)
145559cea:     	addq	0x18(%rdx), %rdi
145559cee:     	leaq	0x11dce53(%rip), %r13   # 0x146736b48
145559cf5:     	xorps	%xmm6, %xmm6
145559cf8:     	movsd	0x3be9d0(%rip), %xmm7   # 0x1459186d0
145559d00:     	movsd	0x3ad847(%rip), %xmm8   # 0x145907550
145559d09:     	movaps	0x3be9cf(%rip), %xmm9   # 0x1459186e0
145559d11:     	cmpq	0x20(%rbp), %r12
145559d15:     	je	0x145559e20 <.text+0x5558e20>
145559d1b:     	nopl	(%rax,%rax)
145559d20:     	movq	(%r12), %r14
145559d24:     	movq	0x8(%r12), %r15
145559d29:     	movss	0x10(%r12), %xmm10
145559d30:     	addq	$0x18, %r12
145559d34:     	movq	%r14, -0x48(%rbp)
145559d38:     	movq	%r15, -0x40(%rbp)
145559d3c:     	xorl	%ebx, %ebx
145559d3e:     	jmp	0x145559d51 <.text+0x5558d51>
145559d40:     	addq	$0x78, %rbx
145559d44:     	cmpq	$0x3480, %rbx           # imm = 0x3480
145559d4b:     	je	0x145559e7f <.text+0x5558e7f>
145559d51:     	cmpq	%r15, 0x8(%rbx,%r13)
145559d56:     	jne	0x145559d40 <.text+0x5558d40>
145559d58:     	movq	(%rbx,%r13), %rcx
145559d5c:     	movq	%r14, %rdx
145559d5f:     	movq	%r15, %r8
145559d62:     	callq	0x1457731e7 <.text+0x57721e7>
145559d67:     	testl	%eax, %eax
145559d69:     	jne	0x145559d40 <.text+0x5558d40>
145559d6b:     	leaq	-0x14(%rbp), %rax
145559d6f:     	movups	%xmm6, (%rax)
145559d72:     	movl	$0x0, 0x10(%rax)
145559d79:     	addq	%r13, %rbx
145559d7c:     	movq	%rbx, -0x38(%rbp)
145559d80:     	movl	$0x1, -0x30(%rbp)
145559d87:     	movsd	%xmm7, -0x2c(%rbp)
145559d8c:     	movq	$0x3f800000, -0x24(%rbp) # imm = 0x3F800000
145559d94:     	movsd	%xmm8, -0x1c(%rbp)
145559d9a:     	movsd	%xmm8, (%rbp)
145559da0:     	movl	$0x0, 0x8(%rbp)
145559da7:     	movups	%xmm9, 0xc(%rbp)
145559dac:     	leaq	(%rbp), %rcx
145559db0:     	movq	%rdi, %rdx
145559db3:     	movq	%rbx, %r8
145559db6:     	callq	0x145451c30 <.text+0x5450c30>
145559dbb:     	nop
145559dbc:     	movl	$0x3fc00000, -0x2c(%rbp) # imm = 0x3FC00000
145559dc3:     	movq	0x30(%rbp), %r8
145559dc7:     	movq	0x8(%r8), %rax
145559dcb:     	leaq	(%rax,%rax,2), %rcx
145559dcf:     	shlq	$0x5, %rcx
145559dd3:     	movq	0x18(%rbp), %rdx
145559dd7:     	movq	%rdx, 0x50(%rsi,%rcx)
145559ddc:     	movups	-0x28(%rbp), %xmm0
145559de0:     	movups	-0x18(%rbp), %xmm1
145559de4:     	movups	-0x8(%rbp), %xmm2
145559de8:     	movups	0x8(%rbp), %xmm3
145559dec:     	movups	%xmm3, 0x40(%rsi,%rcx)
145559df1:     	movups	%xmm2, 0x30(%rsi,%rcx)
145559df6:     	movups	%xmm1, 0x20(%rsi,%rcx)
145559dfb:     	movups	%xmm0, 0x10(%rsi,%rcx)
145559e00:     	movups	-0x38(%rbp), %xmm0
145559e04:     	movups	%xmm0, (%rsi,%rcx)
145559e08:     	movss	%xmm10, 0x58(%rsi,%rcx)
145559e0f:     	incq	%rax
145559e12:     	movq	%rax, 0x8(%r8)
145559e16:     	cmpq	0x20(%rbp), %r12
145559e1a:     	jne	0x145559d20 <.text+0x5558d20>
145559e20:     	movq	0x28(%rbp), %rcx
145559e24:     	movq	0x10(%rcx), %rax
145559e28:     	testq	%rax, %rax
145559e2b:     	je	0x145559e43 <.text+0x5558e43>
145559e2d:     	movq	(%rcx), %rcx
145559e30:     	shlq	$0x3, %rax
145559e34:     	leaq	(%rax,%rax,2), %rdx
145559e38:     	movl	$0x8, %r8d
145559e3e:     	callq	0x1400021d0 <.text+0x11d0>
145559e43:     	movq	0x30(%rbp), %rcx
145559e47:     	movq	(%rcx), %rax
145559e4a:     	movq	0x8(%rcx), %rcx
145559e4e:     	movq	%rcx, (%rax)
145559e51:     	movaps	0x40(%rbp), %xmm6
145559e55:     	movaps	0x50(%rbp), %xmm7
145559e59:     	movaps	0x60(%rbp), %xmm8
145559e5e:     	movaps	0x70(%rbp), %xmm9
145559e63:     	movaps	0x80(%rbp), %xmm10
145559e6b:     	addq	$0x118, %rsp            # imm = 0x118
145559e72:     	popq	%rbx
145559e73:     	popq	%rdi
145559e74:     	popq	%rsi
145559e75:     	popq	%r12
145559e77:     	popq	%r13
145559e79:     	popq	%r14
145559e7b:     	popq	%r15
145559e7d:     	popq	%rbp
145559e7e:     	retq
145559e7f:     	leaq	-0x48(%rbp), %rax
145559e83:     	movq	%rax, -0x58(%rbp)
145559e87:     	leaq	-0x5557dce(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145559e8e:     	movq	%rax, -0x50(%rbp)
145559e92:     	leaq	0x11dbebf(%rip), %rcx   # 0x146735d58
145559e99:     	leaq	0x11dbec8(%rip), %r8    # 0x146735d68
145559ea0:     	leaq	-0x58(%rbp), %rdx
145559ea4:     	callq	0x145903d10 <.text+0x5902d10>
145559ea9:     	nop
145559eaa:     	ud2
