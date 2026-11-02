
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403d9d40:     	pushq	%rbp
1403d9d41:     	pushq	%r15
1403d9d43:     	pushq	%r14
1403d9d45:     	pushq	%rsi
1403d9d46:     	pushq	%rdi
1403d9d47:     	pushq	%rbx
1403d9d48:     	subq	$0x2e8, %rsp            # imm = 0x2E8
1403d9d4f:     	leaq	0x80(%rsp), %rbp
1403d9d57:     	movq	$-0x2, 0x260(%rbp)
1403d9d62:     	movq	%rdx, %rdi
1403d9d65:     	movq	%rcx, %rsi
1403d9d68:     	movq	%rdx, %rcx
1403d9d6b:     	callq	0x14031df50 <.text+0x31cf50>
1403d9d70:     	movq	%rax, %rbx
1403d9d73:     	movq	%rdi, %rcx
1403d9d76:     	callq	0x1403408a0 <.text+0x33f8a0>
1403d9d7b:     	movq	%rax, %r14
1403d9d7e:     	movq	%rdi, %rcx
1403d9d81:     	callq	0x14031ea30 <.text+0x31da30>
1403d9d86:     	movq	%rax, %r15
1403d9d89:     	movq	%rdi, %rcx
1403d9d8c:     	callq	0x14031ce70 <.text+0x31be70>
1403d9d91:     	movq	%rbx, 0x238(%rbp)
1403d9d98:     	movq	%r14, 0x240(%rbp)
1403d9d9f:     	movq	%r15, 0x248(%rbp)
1403d9da6:     	movq	%rax, 0x250(%rbp)
1403d9dad:     	movq	%rdi, %rcx
1403d9db0:     	callq	0x14031df50 <.text+0x31cf50>
1403d9db5:     	movq	%rax, %rbx
1403d9db8:     	leaq	-0x60(%rbp), %r14
1403d9dbc:     	movq	%r14, %rcx
1403d9dbf:     	callq	0x144e7aad0 <.text+0x4e79ad0>
1403d9dc4:     	movb	$0x1, 0x25f(%rbp)
1403d9dcb:     	leaq	0x238(%rbp), %rcx
1403d9dd2:     	movq	%r14, %rdx
1403d9dd5:     	callq	0x1401bc420 <.text+0x1bb420>
1403d9dda:     	nop
1403d9ddb:     	movb	$0x1, 0x25f(%rbp)
1403d9de2:     	leaq	0x50(%rbp), %rcx
1403d9de6:     	callq	0x144e7aad0 <.text+0x4e79ad0>
1403d9deb:     	nop
1403d9dec:     	movzbl	0xe1(%rbp), %eax
1403d9df3:     	cmpq	0x90(%rbp), %rbx
1403d9dfa:     	jae	0x1403d9eef <.text+0x3d8eef>
1403d9e00:     	movq	0x80(%rbp), %rcx
1403d9e07:     	movq	%rbx, %rdx
1403d9e0a:     	shrq	$0x6, %rdx
1403d9e0e:     	movq	(%rcx,%rdx,8), %rcx
1403d9e12:     	btq	%rbx, %rcx
1403d9e16:     	sbbb	$0x0, %al
1403d9e18:     	jne	0x1403d9ef7 <.text+0x3d8ef7>
1403d9e1e:     	leaq	0x50(%rbp), %rcx
1403d9e22:     	movq	%rbx, %rdx
1403d9e25:     	callq	0x144e741b0 <.text+0x4e731b0>
1403d9e2a:     	nop
1403d9e2b:     	leaq	-0x60(%rbp), %rcx
1403d9e2f:     	leaq	0x50(%rbp), %rdx
1403d9e33:     	callq	0x144e74520 <.text+0x4e73520>
1403d9e38:     	nop
1403d9e39:     	movb	$0x1, %r14b
1403d9e3c:     	cmpq	$0x0, 0x90(%rdi)
1403d9e44:     	je	0x1403d9f8a <.text+0x3d8f8a>
1403d9e4a:     	movq	0x78(%rdi), %rax
1403d9e4e:     	movq	0x80(%rdi), %rcx
1403d9e55:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
1403d9e5f:     	xorl	%r8d, %r8d
1403d9e62:     	movdqa	0x5a1b7d6(%rip), %xmm0  # 0x145df5640
1403d9e6a:     	pcmpeqd	%xmm1, %xmm1
1403d9e6e:     	movdqa	0x5a2698a(%rip), %xmm2  # 0x145e00800
1403d9e76:     	andq	%rcx, %rdx
1403d9e79:     	movdqu	(%rax,%rdx), %xmm3
1403d9e7e:     	movdqa	%xmm3, %xmm4
1403d9e82:     	pcmpeqb	%xmm0, %xmm4
1403d9e86:     	pmovmskb	%xmm4, %r9d
1403d9e8b:     	testl	%r9d, %r9d
1403d9e8e:     	je	0x1403d9ed0 <.text+0x3d8ed0>
1403d9e90:     	tzcntl	%r9d, %r10d
1403d9e95:     	addq	%rdx, %r10
1403d9e98:     	andq	%rcx, %r10
1403d9e9b:     	negq	%r10
1403d9e9e:     	leaq	(%r10,%r10,2), %r10
1403d9ea2:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1403d9ea9:     	pcmpeqb	%xmm2, %xmm4
1403d9ead:     	pmovmskb	%xmm4, %r11d
1403d9eb2:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1403d9eb9:     	je	0x1403d9f30 <.text+0x3d8f30>
1403d9ebb:     	leal	-0x1(%r9), %r10d
1403d9ebf:     	andw	%r9w, %r10w
1403d9ec3:     	movl	%r10d, %r9d
1403d9ec6:     	jne	0x1403d9e90 <.text+0x3d8e90>
1403d9ec8:     	nopl	(%rax,%rax)
1403d9ed0:     	pcmpeqb	%xmm1, %xmm3
1403d9ed4:     	pmovmskb	%xmm3, %r9d
1403d9ed9:     	testl	%r9d, %r9d
1403d9edc:     	jne	0x1403d9f8a <.text+0x3d8f8a>
1403d9ee2:     	addq	%r8, %rdx
1403d9ee5:     	addq	$0x10, %rdx
1403d9ee9:     	addq	$0x10, %r8
1403d9eed:     	jmp	0x1403d9e76 <.text+0x3d8e76>
1403d9eef:     	testb	%al, %al
1403d9ef1:     	je	0x1403d9e1e <.text+0x3d8e1e>
1403d9ef7:     	leaq	0x25e(%rbp), %rax
1403d9efe:     	movq	%rax, 0x100(%rbp)
1403d9f05:     	leaq	0x4c1d4d4(%rip), %rax   # 0x144ff73e0 <.text+0x4ff63e0>
1403d9f0c:     	movq	%rax, 0x108(%rbp)
1403d9f13:     	leaq	0x5a26a46(%rip), %rcx   # 0x145e00960
1403d9f1a:     	leaq	0x5a26b1f(%rip), %r8    # 0x145e00a40
1403d9f21:     	leaq	0x100(%rbp), %rdx
1403d9f28:     	callq	0x145d93c80 <.text+0x5d92c80>
1403d9f2d:     	nop
1403d9f2e:     	ud2
1403d9f30:     	leaq	(%rax,%r10,8), %rax
1403d9f34:     	movq	-0x8(%rax), %rax
1403d9f38:     	cmpq	0x218(%rdi), %rax
1403d9f3f:     	jae	0x1403d9f8a <.text+0x3d8f8a>
1403d9f41:     	movq	0x210(%rdi), %rcx
1403d9f48:     	movq	(%rcx,%rax,8), %rcx
1403d9f4c:     	testq	%rcx, %rcx
1403d9f4f:     	je	0x1403d9f8a <.text+0x3d8f8a>
1403d9f51:     	movq	0x1e0(%rdi), %rax
1403d9f58:     	notq	%rcx
1403d9f5b:     	imulq	$0x38, %rcx, %rcx
1403d9f5f:     	cmpb	$0x1, 0x30(%rax,%rcx)
1403d9f64:     	jne	0x1403d9f8a <.text+0x3d8f8a>
1403d9f66:     	addq	%rcx, %rax
1403d9f69:     	movq	0x10(%rax), %r14
1403d9f6d:     	leaq	-0x60(%rbp), %rdx
1403d9f71:     	movq	%r14, %rcx
1403d9f74:     	callq	0x144e03180 <.text+0x4e02180>
1403d9f79:     	nop
1403d9f7a:     	leaq	0x40(%rdi), %rdx
1403d9f7e:     	movq	%r14, %rcx
1403d9f81:     	callq	0x144e032e0 <.text+0x4e022e0>
1403d9f86:     	nop
1403d9f87:     	movl	%eax, %r14d
1403d9f8a:     	movq	0x5a0(%rdi), %r15
1403d9f91:     	leaq	0x140(%rbp), %rcx
1403d9f98:     	leaq	-0x60(%rbp), %rdx
1403d9f9c:     	movl	$0xb0, %r8d
1403d9fa2:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1403d9fa7:     	movq	%r15, 0x100(%rbp)
1403d9fae:     	movl	$0x0, 0x108(%rbp)
1403d9fb8:     	movq	$0x10, 0x110(%rbp)
1403d9fc3:     	pxor	%xmm0, %xmm0
1403d9fc7:     	movdqu	%xmm0, 0x118(%rbp)
1403d9fcf:     	movq	$0x10, 0x128(%rbp)
1403d9fda:     	movdqu	%xmm0, 0x130(%rbp)
1403d9fe2:     	movq	$0x0, 0x1f0(%rbp)
1403d9fed:     	movq	$0x4, 0x1f8(%rbp)
1403d9ff8:     	movq	$0x0, 0x200(%rbp)
1403da003:     	movb	%r14b, 0x208(%rbp)
1403da00a:     	movdqu	0x238(%rbp), %xmm0
1403da012:     	movdqu	0x248(%rbp), %xmm1
1403da01a:     	movdqu	%xmm0, 0x210(%rbp)
1403da022:     	movdqu	%xmm1, 0x220(%rbp)
1403da02a:     	movq	%rbx, 0x230(%rbp)
1403da031:     	movb	$0x0, 0x25f(%rbp)
1403da038:     	leaq	0x50(%rbp), %rcx
1403da03c:     	callq	0x1403b24f0 <.text+0x3b14f0>
1403da041:     	nop
1403da042:     	leaq	0x100(%rbp), %rcx
1403da049:     	movq	%rdi, %rdx
1403da04c:     	callq	0x1403d9920 <.text+0x3d8920>
1403da051:     	nop
1403da052:     	leaq	0x100(%rbp), %rdx
1403da059:     	movl	$0x138, %r8d            # imm = 0x138
1403da05f:     	movq	%rsi, %rcx
1403da062:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1403da067:     	movq	%rsi, %rax
1403da06a:     	addq	$0x2e8, %rsp            # imm = 0x2E8
1403da071:     	popq	%rbx
1403da072:     	popq	%rdi
1403da073:     	popq	%rsi
1403da074:     	popq	%r14
1403da076:     	popq	%r15
1403da078:     	popq	%rbp
1403da079:     	retq
