
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f9bf0:     	pushq	%rbp
1454f9bf1:     	pushq	%r15
1454f9bf3:     	pushq	%r14
1454f9bf5:     	pushq	%r13
1454f9bf7:     	pushq	%r12
1454f9bf9:     	pushq	%rsi
1454f9bfa:     	pushq	%rdi
1454f9bfb:     	pushq	%rbx
1454f9bfc:     	subq	$0x258, %rsp            # imm = 0x258
1454f9c03:     	leaq	0x80(%rsp), %rbp
1454f9c0b:     	movaps	%xmm15, 0x1c0(%rbp)
1454f9c13:     	movaps	%xmm14, 0x1b0(%rbp)
1454f9c1b:     	movaps	%xmm13, 0x1a0(%rbp)
1454f9c23:     	movaps	%xmm12, 0x190(%rbp)
1454f9c2b:     	movaps	%xmm11, 0x180(%rbp)
1454f9c33:     	movaps	%xmm10, 0x170(%rbp)
1454f9c3b:     	movaps	%xmm9, 0x160(%rbp)
1454f9c43:     	movaps	%xmm8, 0x150(%rbp)
1454f9c4b:     	movaps	%xmm7, 0x140(%rbp)
1454f9c52:     	movaps	%xmm6, 0x130(%rbp)
1454f9c59:     	movq	$-0x2, 0x128(%rbp)
1454f9c64:     	movq	%rdx, %rbx
1454f9c67:     	movq	%rcx, %rdi
1454f9c6a:     	movq	(%rdx), %rsi
1454f9c6d:     	movq	0xe8(%rcx), %rax
1454f9c74:     	movq	0xf0(%rcx), %r12
1454f9c7b:     	movl	0x40(%rsi), %r14d
1454f9c7f:     	movabsq	$0x1ffffffffffffff0, %r15 # imm = 0x1FFFFFFFFFFFFFF0
1454f9c89:     	movq	%r12, %r8
1454f9c8c:     	andq	%r15, %r8
1454f9c8f:     	leaq	(%rax,%r8,4), %rcx
1454f9c93:     	movl	%r12d, %edx
1454f9c96:     	andl	$0xf, %edx
1454f9c99:     	movd	%r14d, %xmm0
1454f9c9e:     	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
1454f9ca3:     	xorl	%r9d, %r9d
1454f9ca6:     	nopw	%cs:(%rax,%rax)
1454f9cb0:     	cmpq	%r9, %r8
1454f9cb3:     	je	0x1454f9cfc <.text+0x54f8cfc>
1454f9cb5:     	movdqu	(%rax,%r9,4), %xmm1
1454f9cbb:     	movdqu	0x10(%rax,%r9,4), %xmm2
1454f9cc2:     	movdqu	0x20(%rax,%r9,4), %xmm3
1454f9cc9:     	movdqu	0x30(%rax,%r9,4), %xmm4
1454f9cd0:     	pcmpeqd	%xmm0, %xmm2
1454f9cd4:     	pcmpeqd	%xmm0, %xmm1
1454f9cd8:     	packssdw	%xmm2, %xmm1
1454f9cdc:     	pcmpeqd	%xmm0, %xmm3
1454f9ce0:     	pcmpeqd	%xmm0, %xmm4
1454f9ce4:     	packssdw	%xmm4, %xmm3
1454f9ce8:     	packsswb	%xmm3, %xmm1
1454f9cec:     	pmovmskb	%xmm1, %r10d
1454f9cf1:     	addq	$0x10, %r9
1454f9cf5:     	testl	%r10d, %r10d
1454f9cf8:     	je	0x1454f9cb0 <.text+0x54f8cb0>
1454f9cfa:     	jmp	0x1454f9d4f <.text+0x54f8d4f>
1454f9cfc:     	shll	$0x2, %edx
1454f9cff:     	xorl	%r8d, %r8d
1454f9d02:     	nopw	%cs:(%rax,%rax)
1454f9d10:     	cmpq	%r8, %rdx
1454f9d13:     	je	0x1454f9d21 <.text+0x54f8d21>
1454f9d15:     	cmpl	%r14d, (%rcx,%r8)
1454f9d19:     	leaq	0x4(%r8), %r8
1454f9d1d:     	jne	0x1454f9d10 <.text+0x54f8d10>
1454f9d1f:     	jmp	0x1454f9d4f <.text+0x54f8d4f>
1454f9d21:     	cmpq	0xe0(%rdi), %r12
1454f9d28:     	jne	0x1454f9d3d <.text+0x54f8d3d>
1454f9d2a:     	leaq	0xe0(%rdi), %rcx
1454f9d31:     	callq	0x145777a50 <.text+0x5776a50>
1454f9d36:     	movq	0xe8(%rdi), %rax
1454f9d3d:     	movl	%r14d, (%rax,%r12,4)
1454f9d41:     	incq	%r12
1454f9d44:     	movq	%r12, 0xf0(%rdi)
1454f9d4b:     	movl	0x40(%rsi), %r14d
1454f9d4f:     	movq	0x100(%rdi), %rax
1454f9d56:     	movq	0x108(%rdi), %r12
1454f9d5d:     	andq	%r12, %r15
1454f9d60:     	leaq	(%rax,%r15,4), %rcx
1454f9d64:     	movl	%r12d, %edx
1454f9d67:     	andl	$0xf, %edx
1454f9d6a:     	movd	%r14d, %xmm0
1454f9d6f:     	pshufd	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0]
1454f9d74:     	xorl	%r8d, %r8d
1454f9d77:     	nopw	(%rax,%rax)
1454f9d80:     	cmpq	%r8, %r15
1454f9d83:     	je	0x1454f9dcc <.text+0x54f8dcc>
1454f9d85:     	movdqu	(%rax,%r8,4), %xmm1
1454f9d8b:     	movdqu	0x10(%rax,%r8,4), %xmm2
1454f9d92:     	movdqu	0x20(%rax,%r8,4), %xmm3
1454f9d99:     	movdqu	0x30(%rax,%r8,4), %xmm4
1454f9da0:     	pcmpeqd	%xmm0, %xmm2
1454f9da4:     	pcmpeqd	%xmm0, %xmm1
1454f9da8:     	packssdw	%xmm2, %xmm1
1454f9dac:     	pcmpeqd	%xmm0, %xmm3
1454f9db0:     	pcmpeqd	%xmm0, %xmm4
1454f9db4:     	packssdw	%xmm4, %xmm3
1454f9db8:     	packsswb	%xmm3, %xmm1
1454f9dbc:     	pmovmskb	%xmm1, %r9d
1454f9dc1:     	addq	$0x10, %r8
1454f9dc5:     	testl	%r9d, %r9d
1454f9dc8:     	je	0x1454f9d80 <.text+0x54f8d80>
1454f9dca:     	jmp	0x1454f9e1b <.text+0x54f8e1b>
1454f9dcc:     	shll	$0x2, %edx
1454f9dcf:     	xorl	%r8d, %r8d
1454f9dd2:     	nopw	%cs:(%rax,%rax)
1454f9de0:     	cmpq	%r8, %rdx
1454f9de3:     	je	0x1454f9df1 <.text+0x54f8df1>
1454f9de5:     	cmpl	%r14d, (%rcx,%r8)
1454f9de9:     	leaq	0x4(%r8), %r8
1454f9ded:     	jne	0x1454f9de0 <.text+0x54f8de0>
1454f9def:     	jmp	0x1454f9e1b <.text+0x54f8e1b>
1454f9df1:     	cmpq	0xf8(%rdi), %r12
1454f9df8:     	jne	0x1454f9e0d <.text+0x54f8e0d>
1454f9dfa:     	leaq	0xf8(%rdi), %rcx
1454f9e01:     	callq	0x145777a50 <.text+0x5776a50>
1454f9e06:     	movq	0x100(%rdi), %rax
1454f9e0d:     	movl	%r14d, (%rax,%r12,4)
1454f9e11:     	incq	%r12
1454f9e14:     	movq	%r12, 0x108(%rdi)
1454f9e1b:     	movss	0x470(%rdi), %xmm0
