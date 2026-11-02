
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145943bb0:     	pushq	%rbp
145943bb1:     	pushq	%r15
145943bb3:     	pushq	%r14
145943bb5:     	pushq	%r13
145943bb7:     	pushq	%r12
145943bb9:     	pushq	%rsi
145943bba:     	pushq	%rdi
145943bbb:     	pushq	%rbx
145943bbc:     	subq	$0x128, %rsp            # imm = 0x128
145943bc3:     	leaq	0x80(%rsp), %rbp
145943bcb:     	movaps	%xmm11, 0x90(%rbp)
145943bd3:     	movaps	%xmm10, 0x80(%rbp)
145943bdb:     	movaps	%xmm9, 0x70(%rbp)
145943be0:     	movaps	%xmm8, 0x60(%rbp)
145943be5:     	movaps	%xmm7, 0x50(%rbp)
145943be9:     	movaps	%xmm6, 0x40(%rbp)
145943bed:     	movq	$-0x2, 0x38(%rbp)
145943bf5:     	movq	%rcx, %rsi
145943bf8:     	movsd	0x4c8(%rcx), %xmm6
145943c00:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
145943c04:     	movl	0x4d0(%rcx), %eax
145943c0a:     	movl	%eax, 0x2c(%rbp)
145943c0d:     	movss	0x9ec(%rcx), %xmm8
145943c16:     	movq	$0x0, 0x10(%rbp)
145943c1e:     	movq	$0x8, 0x18(%rbp)
145943c26:     	movq	$0x0, 0x20(%rbp)
145943c2e:     	movq	0x5c0(%rcx), %rbx
145943c35:     	movq	0x5c8(%rcx), %rax
145943c3c:     	leaq	(%rax,%rax,8), %rax
145943c40:     	leaq	(%rbx,%rax,8), %rax
145943c44:     	xorl	%r14d, %r14d
145943c47:     	movss	0x42d024(%rip), %xmm9   # 0x145d70c74
145943c50:     	movss	0x4297cb(%rip), %xmm10  # 0x145d6d424
145943c59:     	leaq	0x10(%rbp), %rdi
145943c5d:     	movq	%rax, (%rbp)
145943c61:     	nopw	%cs:(%rax,%rax)
145943c70:     	addq	$0x48, %rbx
145943c74:     	leaq	-0x48(%rbx), %rcx
145943c78:     	cmpq	%rax, %rcx
145943c7b:     	je	0x145943d2b <.text+0x5942d2b>
145943c81:     	cmpl	$0x0, 0x20(%rcx)
145943c85:     	jne	0x145943c70 <.text+0x5942c70>
145943c87:     	cmpl	$0x0, -0x30(%rbx)
145943c8b:     	jne	0x145943c70 <.text+0x5942c70>
145943c8d:     	movq	%rcx, 0x8(%rbp)
145943c91:     	movss	-0x14(%rbx), %xmm0
145943c96:     	movss	-0x10(%rbx), %xmm1
145943c9b:     	subss	%xmm6, %xmm0
145943c9f:     	subss	%xmm7, %xmm1
145943ca3:     	mulss	%xmm0, %xmm0
145943ca7:     	mulss	%xmm1, %xmm1
145943cab:     	addss	%xmm0, %xmm1
145943caf:     	xorps	%xmm11, %xmm11
145943cb3:     	sqrtss	%xmm1, %xmm11
145943cb8:     	divss	%xmm9, %xmm11
145943cbd:     	maxss	%xmm10, %xmm11
145943cc2:     	movaps	%xmm8, %xmm0
145943cc6:     	addss	%xmm11, %xmm0
145943ccb:     	movl	$0x1, -0x30(%rbx)
145943cd2:     	movss	%xmm0, -0x2c(%rbx)
145943cd7:     	movq	-0x20(%rbx), %r15
145943cdb:     	movq	-0x14(%rbx), %rax
145943cdf:     	movl	-0xc(%rbx), %ecx
145943ce2:     	movl	%ecx, -0x20(%rbp)
145943ce5:     	movq	%rax, -0x28(%rbp)
145943ce9:     	cmpq	0x10(%rbp), %r14
145943ced:     	jne	0x145943cf8 <.text+0x5942cf8>
145943cef:     	movq	%rdi, %rcx
145943cf2:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
145943cf7:     	nop
145943cf8:     	movq	0x18(%rbp), %rax
145943cfc:     	leaq	(%r14,%r14,2), %rcx
145943d00:     	movq	%r15, (%rax,%rcx,8)
145943d04:     	movq	-0x28(%rbp), %rdx
145943d08:     	movq	%rdx, 0x8(%rax,%rcx,8)
145943d0d:     	movl	-0x20(%rbp), %edx
145943d10:     	movl	%edx, 0x10(%rax,%rcx,8)
145943d14:     	movss	%xmm11, 0x14(%rax,%rcx,8)
145943d1b:     	incq	%r14
145943d1e:     	movq	%r14, 0x20(%rbp)
145943d22:     	movq	(%rbp), %rax
145943d26:     	jmp	0x145943c70 <.text+0x5942c70>
145943d2b:     	movq	%rcx, 0x8(%rbp)
145943d2f:     	movq	0x10(%rbp), %rax
145943d33:     	movq	%rax, 0x30(%rbp)
145943d37:     	movq	0x18(%rbp), %rdi
145943d3b:     	leaq	(%r14,%r14,2), %rax
145943d3f:     	leaq	(%rdi,%rax,8), %r13
145943d43:     	movss	0x47b859(%rip), %xmm7   # 0x145dbf5a4
145943d4b:     	xorps	%xmm8, %xmm8
145943d4f:     	movss	0x429b1c(%rip), %xmm9   # 0x145d6d874
145943d58:     	leaq	-0x28(%rbp), %rbx
145943d5c:     	leaq	-0x38(%rbp), %r14
145943d60:     	leaq	-0x48(%rbp), %r15
145943d64:     	movq	%rdi, -0x8(%rbp)
145943d68:     	jmp	0x145943d9d <.text+0x5942d9d>
145943d6a:     	nopw	(%rax,%rax)
145943d70:     	addq	$0x18, %rdi
145943d74:     	movq	0x5d8(%rsi), %rax
145943d7b:     	movq	%r12, %rcx
145943d7e:     	shlq	$0x5, %rcx
145943d82:     	movups	-0x28(%rbp), %xmm0
145943d86:     	movups	-0x18(%rbp), %xmm1
145943d8a:     	movups	%xmm1, 0x10(%rax,%rcx)
145943d8f:     	movups	%xmm0, (%rax,%rcx)
145943d93:     	incq	%r12
145943d96:     	movq	%r12, 0x5e0(%rsi)
145943d9d:     	cmpq	%r13, %rdi
145943da0:     	je	0x145943e38 <.text+0x5942e38>
145943da6:     	movq	(%rdi), %rdx
145943da9:     	movl	0x10(%rdi), %eax
145943dac:     	movl	%eax, -0x30(%rbp)
145943daf:     	movq	0x8(%rdi), %rax
145943db3:     	movq	%rax, -0x38(%rbp)
145943db7:     	movss	0x14(%rdi), %xmm0
145943dbc:     	movl	0xa10(%rsi), %eax
145943dc2:     	incl	%eax
145943dc4:     	mulss	%xmm7, %xmm0
145943dc8:     	cvttss2si	%xmm0, %rcx
145943dcd:     	ucomiss	%xmm8, %xmm0
145943dd1:     	movl	$0x0, %r8d
145943dd7:     	cmovbl	%r8d, %ecx
145943ddb:     	movl	%eax, 0xa10(%rsi)
145943de1:     	ucomiss	%xmm9, %xmm0
145943de5:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
145943deb:     	ja	0x145943df0 <.text+0x5942df0>
145943ded:     	movl	%ecx, %r8d
145943df0:     	movlps	%xmm6, -0x48(%rbp)
145943df4:     	movl	0x2c(%rbp), %ecx
145943df7:     	movl	%ecx, -0x40(%rbp)
145943dfa:     	movl	%r8d, 0x28(%rsp)
145943dff:     	movl	%eax, 0x20(%rsp)
145943e03:     	movq	%rbx, %rcx
145943e06:     	movq	%r14, %r8
145943e09:     	movq	%r15, %r9
145943e0c:     	callq	0x1458aa9e0 <.text+0x58a99e0>
145943e11:     	nop
145943e12:     	movq	0x5e0(%rsi), %r12
145943e19:     	cmpq	0x5d0(%rsi), %r12
145943e20:     	jne	0x145943d70 <.text+0x5942d70>
145943e26:     	leaq	0x5d0(%rsi), %rcx
145943e2d:     	callq	0x145bcb530 <.text+0x5bca530>
145943e32:     	nop
145943e33:     	jmp	0x145943d70 <.text+0x5942d70>
145943e38:     	movq	0x30(%rbp), %rax
145943e3c:     	testq	%rax, %rax
145943e3f:     	je	0x145943e58 <.text+0x5942e58>
145943e41:     	shlq	$0x3, %rax
145943e45:     	leaq	(%rax,%rax,2), %rdx
145943e49:     	movl	$0x8, %r8d
145943e4f:     	movq	-0x8(%rbp), %rcx
145943e53:     	callq	0x1400021d0 <.text+0x11d0>
145943e58:     	movaps	0x40(%rbp), %xmm6
145943e5c:     	movaps	0x50(%rbp), %xmm7
145943e60:     	movaps	0x60(%rbp), %xmm8
145943e65:     	movaps	0x70(%rbp), %xmm9
145943e6a:     	movaps	0x80(%rbp), %xmm10
145943e72:     	movaps	0x90(%rbp), %xmm11
145943e7a:     	addq	$0x128, %rsp            # imm = 0x128
145943e81:     	popq	%rbx
145943e82:     	popq	%rdi
145943e83:     	popq	%rsi
145943e84:     	popq	%r12
145943e86:     	popq	%r13
145943e88:     	popq	%r14
145943e8a:     	popq	%r15
145943e8c:     	popq	%rbp
145943e8d:     	retq
