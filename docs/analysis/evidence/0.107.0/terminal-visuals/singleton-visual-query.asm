
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403d2cf0:     	pushq	%rbp
1403d2cf1:     	pushq	%r15
1403d2cf3:     	pushq	%r14
1403d2cf5:     	pushq	%r13
1403d2cf7:     	pushq	%r12
1403d2cf9:     	pushq	%rsi
1403d2cfa:     	pushq	%rdi
1403d2cfb:     	pushq	%rbx
1403d2cfc:     	subq	$0x308, %rsp            # imm = 0x308
1403d2d03:     	leaq	0x80(%rsp), %rbp
1403d2d0b:     	movq	$-0x2, 0x280(%rbp)
1403d2d16:     	movq	%rdx, %rdi
1403d2d19:     	movq	%rcx, %rsi
1403d2d1c:     	movq	%rdx, %rcx
1403d2d1f:     	callq	0x140329580 <.text+0x328580>
1403d2d24:     	movq	%rax, %rbx
1403d2d27:     	movq	%rdi, %rcx
1403d2d2a:     	callq	0x14031df50 <.text+0x31cf50>
1403d2d2f:     	movq	%rax, %r14
1403d2d32:     	movq	%rdi, %rcx
1403d2d35:     	callq	0x1403215a0 <.text+0x3205a0>
1403d2d3a:     	movq	%rax, %r15
1403d2d3d:     	movq	%rdi, %rcx
1403d2d40:     	callq	0x14031ea30 <.text+0x31da30>
1403d2d45:     	movq	%rax, %r12
1403d2d48:     	movq	%rdi, %rcx
1403d2d4b:     	callq	0x140321ba0 <.text+0x320ba0>
1403d2d50:     	movq	%rax, %r13
1403d2d53:     	movq	%rdi, %rcx
1403d2d56:     	callq	0x14031ce70 <.text+0x31be70>
1403d2d5b:     	movq	%rbx, 0x248(%rbp)
1403d2d62:     	movq	%r14, 0x250(%rbp)
1403d2d69:     	movq	%r15, 0x258(%rbp)
1403d2d70:     	movq	%r12, 0x260(%rbp)
1403d2d77:     	movq	%r13, 0x268(%rbp)
1403d2d7e:     	movq	%rax, 0x270(%rbp)
1403d2d85:     	leaq	0x58(%rbp), %rbx
1403d2d89:     	movq	%rbx, %rcx
1403d2d8c:     	callq	0x144e7aad0 <.text+0x4e79ad0>
1403d2d91:     	movb	$0x1, 0x27f(%rbp)
1403d2d98:     	leaq	0x248(%rbp), %rcx
1403d2d9f:     	movq	%rbx, %rdx
1403d2da2:     	callq	0x140115780 <.text+0x114780>
1403d2da7:     	nop
1403d2da8:     	movb	$0x1, 0x27f(%rbp)
1403d2daf:     	leaq	-0x58(%rbp), %rcx
1403d2db3:     	callq	0x144e7aad0 <.text+0x4e79ad0>
1403d2db8:     	nop
1403d2db9:     	leaq	0x58(%rbp), %rcx
1403d2dbd:     	leaq	-0x58(%rbp), %rdx
1403d2dc1:     	callq	0x144e74520 <.text+0x4e73520>
1403d2dc6:     	nop
1403d2dc7:     	movb	$0x1, %bl
1403d2dc9:     	cmpq	$0x0, 0x90(%rdi)
1403d2dd1:     	je	0x1403d2ed4 <.text+0x3d1ed4>
1403d2dd7:     	movq	0x78(%rdi), %rax
1403d2ddb:     	movq	0x80(%rdi), %rcx
1403d2de2:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
1403d2dec:     	xorl	%r8d, %r8d
1403d2def:     	movdqa	0x5a22849(%rip), %xmm0  # 0x145df5640
1403d2df7:     	pcmpeqd	%xmm1, %xmm1
1403d2dfb:     	movdqa	0x5a2d9fd(%rip), %xmm2  # 0x145e00800
1403d2e03:     	andq	%rcx, %rdx
1403d2e06:     	movdqu	(%rax,%rdx), %xmm3
1403d2e0b:     	movdqa	%xmm3, %xmm4
1403d2e0f:     	pcmpeqb	%xmm0, %xmm4
1403d2e13:     	pmovmskb	%xmm4, %r9d
1403d2e18:     	testl	%r9d, %r9d
1403d2e1b:     	je	0x1403d2e60 <.text+0x3d1e60>
1403d2e1d:     	tzcntl	%r9d, %r10d
1403d2e22:     	addq	%rdx, %r10
1403d2e25:     	andq	%rcx, %r10
1403d2e28:     	negq	%r10
1403d2e2b:     	leaq	(%r10,%r10,2), %r10
1403d2e2f:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1403d2e36:     	pcmpeqb	%xmm2, %xmm4
1403d2e3a:     	pmovmskb	%xmm4, %r11d
1403d2e3f:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1403d2e46:     	je	0x1403d2e7b <.text+0x3d1e7b>
1403d2e48:     	leal	-0x1(%r9), %r10d
1403d2e4c:     	andw	%r9w, %r10w
1403d2e50:     	movl	%r10d, %r9d
1403d2e53:     	jne	0x1403d2e1d <.text+0x3d1e1d>
1403d2e55:     	nopw	%cs:(%rax,%rax)
1403d2e60:     	pcmpeqb	%xmm1, %xmm3
1403d2e64:     	pmovmskb	%xmm3, %r9d
1403d2e69:     	testl	%r9d, %r9d
1403d2e6c:     	jne	0x1403d2ed4 <.text+0x3d1ed4>
1403d2e6e:     	addq	%r8, %rdx
1403d2e71:     	addq	$0x10, %rdx
1403d2e75:     	addq	$0x10, %r8
1403d2e79:     	jmp	0x1403d2e03 <.text+0x3d1e03>
1403d2e7b:     	leaq	(%rax,%r10,8), %rax
1403d2e7f:     	movq	-0x8(%rax), %rax
1403d2e83:     	cmpq	0x218(%rdi), %rax
1403d2e8a:     	jae	0x1403d2ed4 <.text+0x3d1ed4>
1403d2e8c:     	movq	0x210(%rdi), %rcx
1403d2e93:     	movq	(%rcx,%rax,8), %rcx
1403d2e97:     	testq	%rcx, %rcx
1403d2e9a:     	je	0x1403d2ed4 <.text+0x3d1ed4>
1403d2e9c:     	movq	0x1e0(%rdi), %rax
1403d2ea3:     	notq	%rcx
1403d2ea6:     	imulq	$0x38, %rcx, %rcx
1403d2eaa:     	cmpb	$0x1, 0x30(%rax,%rcx)
1403d2eaf:     	jne	0x1403d2ed4 <.text+0x3d1ed4>
1403d2eb1:     	addq	%rcx, %rax
1403d2eb4:     	movq	0x10(%rax), %rbx
1403d2eb8:     	leaq	0x58(%rbp), %rdx
1403d2ebc:     	movq	%rbx, %rcx
1403d2ebf:     	callq	0x144e03180 <.text+0x4e02180>
1403d2ec4:     	nop
1403d2ec5:     	leaq	0x40(%rdi), %rdx
1403d2ec9:     	movq	%rbx, %rcx
1403d2ecc:     	callq	0x144e032e0 <.text+0x4e022e0>
1403d2ed1:     	nop
1403d2ed2:     	movl	%eax, %ebx
1403d2ed4:     	movq	0x5a0(%rdi), %r14
1403d2edb:     	leaq	0x148(%rbp), %rcx
1403d2ee2:     	leaq	0x58(%rbp), %rdx
1403d2ee6:     	movl	$0xb0, %r8d
1403d2eec:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1403d2ef1:     	movq	%r14, 0x108(%rbp)
1403d2ef8:     	movl	$0x0, 0x110(%rbp)
1403d2f02:     	movq	$0x10, 0x118(%rbp)
1403d2f0d:     	pxor	%xmm0, %xmm0
1403d2f11:     	movdqu	%xmm0, 0x120(%rbp)
1403d2f19:     	movq	$0x10, 0x130(%rbp)
1403d2f24:     	movdqu	%xmm0, 0x138(%rbp)
1403d2f2c:     	movq	$0x0, 0x1f8(%rbp)
1403d2f37:     	movq	$0x4, 0x200(%rbp)
1403d2f42:     	movq	$0x0, 0x208(%rbp)
1403d2f4d:     	movb	%bl, 0x210(%rbp)
1403d2f53:     	movdqu	0x248(%rbp), %xmm0
1403d2f5b:     	movdqu	0x258(%rbp), %xmm1
1403d2f63:     	movdqu	0x268(%rbp), %xmm2
1403d2f6b:     	movdqu	%xmm0, 0x218(%rbp)
1403d2f73:     	movdqu	%xmm1, 0x228(%rbp)
1403d2f7b:     	movdqu	%xmm2, 0x238(%rbp)
1403d2f83:     	movb	$0x0, 0x27f(%rbp)
1403d2f8a:     	leaq	-0x58(%rbp), %rcx
1403d2f8e:     	callq	0x1403b24f0 <.text+0x3b14f0>
1403d2f93:     	nop
1403d2f94:     	leaq	0x108(%rbp), %rcx
1403d2f9b:     	movq	%rdi, %rdx
1403d2f9e:     	callq	0x1403d28d0 <.text+0x3d18d0>
1403d2fa3:     	nop
1403d2fa4:     	leaq	0x108(%rbp), %rdx
1403d2fab:     	movl	$0x140, %r8d            # imm = 0x140
1403d2fb1:     	movq	%rsi, %rcx
1403d2fb4:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1403d2fb9:     	movq	%rsi, %rax
1403d2fbc:     	addq	$0x308, %rsp            # imm = 0x308
1403d2fc3:     	popq	%rbx
1403d2fc4:     	popq	%rdi
1403d2fc5:     	popq	%rsi
1403d2fc6:     	popq	%r12
1403d2fc8:     	popq	%r13
1403d2fca:     	popq	%r14
1403d2fcc:     	popq	%r15
1403d2fce:     	popq	%rbp
1403d2fcf:     	retq
