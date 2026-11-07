
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454139e0:     	pushq	%rbp
1454139e1:     	pushq	%r14
1454139e3:     	pushq	%rsi
1454139e4:     	pushq	%rdi
1454139e5:     	pushq	%rbx
1454139e6:     	subq	$0x80, %rsp
1454139ed:     	leaq	0x80(%rsp), %rbp
1454139f5:     	movq	$-0x2, -0x8(%rbp)
1454139fd:     	movq	%rdx, %rdi
145413a00:     	movl	0x68(%rdx), %eax
145413a03:     	incl	%eax
145413a05:     	movq	0x60(%rdx), %rdx
145413a09:     	cmpq	$0x4, %rdx
145413a0d:     	movl	$0x4, %r8d
145413a13:     	cmovbq	%rdx, %r8
145413a17:     	movl	%r8d, %edx
145413a1a:     	leaq	0x130ca2b(%rip), %r8    # 0x14672044c
145413a21:     	movss	(%r8,%rdx,4), %xmm0
145413a27:     	mulss	0x4e2c55(%rip), %xmm0   # 0x1458f6684
145413a2f:     	addss	0x4d7a49(%rip), %xmm0   # 0x1458eb480
145413a37:     	cmpl	$0x1, %eax
145413a3a:     	adcl	$-0x1, %eax
145413a3d:     	movq	%rcx, %rsi
145413a40:     	cvtsi2ss	%eax, %xmm1
145413a44:     	callq	0x145756e73 <.text+0x5755e73>
145413a49:     	addss	%xmm0, %xmm0
145413a4d:     	movss	0x4e2bd7(%rip), %xmm1   # 0x1458f662c
145413a55:     	subss	%xmm0, %xmm1
145413a59:     	movss	%xmm1, -0x28(%rbp)
145413a5e:     	movq	0x38(%rdi), %rax
145413a62:     	movq	0x40(%rdi), %rcx
145413a66:     	shlq	$0x6, %rcx
145413a6a:     	addq	%rax, %rcx
145413a6d:     	movq	%rax, -0x40(%rbp)
145413a71:     	movq	%rcx, -0x38(%rbp)
145413a75:     	leaq	-0x28(%rbp), %rax
145413a79:     	movq	%rax, -0x30(%rbp)
145413a7d:     	leaq	-0x58(%rbp), %rcx
145413a81:     	leaq	-0x40(%rbp), %rdx
145413a85:     	callq	0x145535e10 <.text+0x5534e10>
145413a8a:     	movq	-0x50(%rbp), %r14
145413a8e:     	movq	-0x48(%rbp), %rbx
145413a92:     	testq	%rbx, %rbx
145413a95:     	movq	%r14, -0x10(%rbp)
145413a99:     	je	0x145413ace <.text+0x5412ace>
145413a9b:     	leaq	(,%rbx,8), %rax
145413aa3:     	leaq	(%rax,%rax,2), %rdi
145413aa7:     	callq	0x140002200 <.text+0x1200>
145413aac:     	movl	$0x8, %edx
145413ab1:     	movq	%rdi, %rcx
145413ab4:     	callq	0x1400021c0 <.text+0x11c0>
145413ab9:     	testq	%rax, %rax
145413abc:     	jne	0x145413ad3 <.text+0x5412ad3>
145413abe:     	movl	$0x8, %ecx
145413ac3:     	movq	%rdi, %rdx
145413ac6:     	callq	0x1458e721b <.text+0x58e621b>
145413acb:     	nop
145413acc:     	ud2
145413ace:     	movl	$0x8, %eax
145413ad3:     	movq	%rbx, %rdx
145413ad6:     	shlq	$0x6, %rdx
145413ada:     	addq	%r14, %rdx
145413add:     	movq	%rbx, -0x28(%rbp)
145413ae1:     	movq	%rax, -0x20(%rbp)
145413ae5:     	leaq	-0x18(%rbp), %rcx
145413ae9:     	movq	$0x0, -0x18(%rbp)
145413af1:     	movq	%rcx, -0x40(%rbp)
145413af5:     	movq	$0x0, -0x38(%rbp)
145413afd:     	movq	%rax, -0x30(%rbp)
145413b01:     	leaq	-0x40(%rbp), %r8
145413b05:     	movq	%r14, %rcx
145413b08:     	callq	0x14551d7a0 <.text+0x551c7a0>
145413b0d:     	nop
145413b0e:     	movq	-0x18(%rbp), %rax
145413b12:     	movq	%rax, 0x10(%rsi)
145413b16:     	movups	-0x28(%rbp), %xmm0
145413b1a:     	movups	%xmm0, (%rsi)
145413b1d:     	movq	-0x58(%rbp), %rdx
145413b21:     	testq	%rdx, %rdx
145413b24:     	je	0x145413b39 <.text+0x5412b39>
145413b26:     	shlq	$0x6, %rdx
145413b2a:     	movl	$0x8, %r8d
145413b30:     	movq	-0x10(%rbp), %rcx
145413b34:     	callq	0x1400021d0 <.text+0x11d0>
145413b39:     	movq	%rsi, %rax
145413b3c:     	addq	$0x80, %rsp
145413b43:     	popq	%rbx
145413b44:     	popq	%rdi
145413b45:     	popq	%rsi
145413b46:     	popq	%r14
145413b48:     	popq	%rbp
145413b49:     	retq
