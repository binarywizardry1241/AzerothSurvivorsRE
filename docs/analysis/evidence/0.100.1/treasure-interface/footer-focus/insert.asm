
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005daa0:     	pushq	%r14
14005daa2:     	pushq	%rsi
14005daa3:     	pushq	%rdi
14005daa4:     	pushq	%rbp
14005daa5:     	pushq	%rbx
14005daa6:     	subq	$0x50, %rsp
14005daaa:     	movq	(%rcx), %r9
14005daad:     	movq	%r9, %rax
14005dab0:     	movl	%r9d, %r8d
14005dab3:     	movl	$0xffffffff, %r10d      # imm = 0xFFFFFFFF
14005dab9:     	xorq	%r8, %r10
14005dabc:     	leaq	(%r10,%r10,2), %rsi
14005dac0:     	shlq	$0x3, %rsi
14005dac4:     	addq	0x8(%rdx), %rsi
14005dac8:     	shrq	$0x20, %rax
14005dacc:     	cmpq	0x10(%rdx), %r10
14005dad0:     	leaq	0x58b60b9(%rip), %r11   # 0x145913b90
14005dad7:     	cmovbq	%rsi, %r11
14005dadb:     	movl	0x10(%r11), %r10d
14005dadf:     	cmpl	%eax, %r10d
14005dae2:     	jne	0x14005db30 <.text+0x5cb30>
14005dae4:     	movl	(%r11), %r8d
14005dae7:     	testl	%r8d, %r8d
14005daea:     	je	0x14005db34 <.text+0x5cb34>
14005daec:     	movzwl	0x8(%rcx), %eax
14005daf0:     	movzbl	0xa(%rcx), %ecx
14005daf4:     	shll	$0x10, %ecx
14005daf7:     	orl	%eax, %ecx
14005daf9:     	movq	0x4(%r11), %rax
14005dafd:     	movl	0xc(%r11), %r10d
14005db01:     	movq	%rdx, 0x20(%rsp)
14005db06:     	movq	%r9, 0x28(%rsp)
14005db0b:     	movl	%r8d, 0x30(%rsp)
14005db10:     	movq	%rax, 0x34(%rsp)
14005db15:     	movl	%r10d, 0x3c(%rsp)
14005db1a:     	leaq	0x20(%rsp), %rdx
14005db1f:     	callq	0x1402129f0 <.text+0x2119f0>
14005db24:     	nop
14005db25:     	addq	$0x50, %rsp
14005db29:     	popq	%rbx
14005db2a:     	popq	%rbp
14005db2b:     	popq	%rdi
14005db2c:     	popq	%rsi
14005db2d:     	popq	%r14
14005db2f:     	retq
14005db30:     	xorl	%eax, %eax
14005db32:     	jmp	0x14005db3a <.text+0x5cb3a>
14005db34:     	xorl	%r8d, %r8d
14005db37:     	movq	%r9, %r10
14005db3a:     	movabsq	$-0x100000000, %rcx     # imm = 0xFFFFFFFF00000000
14005db44:     	andq	%rcx, %r9
14005db47:     	orq	%r8, %r9
14005db4a:     	movq	%r9, 0x40(%rsp)
14005db4f:     	movl	%r10d, 0x48(%rsp)
14005db54:     	movq	0x44(%rsp), %rcx
14005db59:     	leaq	-0x1ae20(%rip), %rsi    # 0x140042d40 <.text+0x41d40>
14005db60:     	cmpq	$0x0, 0x90(%rdx)
14005db68:     	je	0x14005dc3f <.text+0x5cc3f>
14005db6e:     	movq	0x78(%rdx), %r9
14005db72:     	movq	0x80(%rdx), %r10
14005db79:     	movabsq	$0x28fdfadbf3ba56af, %r11 # imm = 0x28FDFADBF3BA56AF
14005db83:     	xorl	%edi, %edi
14005db85:     	movdqa	0x58b5713(%rip), %xmm0  # 0x1459132a0
14005db8d:     	pcmpeqd	%xmm1, %xmm1
14005db91:     	movdqa	0x58b5717(%rip), %xmm2  # 0x1459132b0
14005db99:     	andq	%r10, %r11
14005db9c:     	movdqu	(%r9,%r11), %xmm3
14005dba2:     	movdqa	%xmm3, %xmm4
14005dba6:     	pcmpeqb	%xmm0, %xmm4
14005dbaa:     	pmovmskb	%xmm4, %ebx
14005dbae:     	testl	%ebx, %ebx
14005dbb0:     	je	0x14005dbe5 <.text+0x5cbe5>
14005dbb2:     	tzcntl	%ebx, %r14d
14005dbb7:     	addq	%r11, %r14
14005dbba:     	andq	%r10, %r14
14005dbbd:     	negq	%r14
14005dbc0:     	leaq	(%r14,%r14,2), %r14
14005dbc4:     	movdqu	-0x18(%r9,%r14,8), %xmm4
14005dbcb:     	pcmpeqb	%xmm2, %xmm4
14005dbcf:     	pmovmskb	%xmm4, %ebp
14005dbd3:     	cmpl	$0xffff, %ebp           # imm = 0xFFFF
14005dbd9:     	je	0x14005dbfe <.text+0x5cbfe>
14005dbdb:     	leal	-0x1(%rbx), %ebp
14005dbde:     	andw	%bx, %bp
14005dbe1:     	movl	%ebp, %ebx
14005dbe3:     	jne	0x14005dbb2 <.text+0x5cbb2>
14005dbe5:     	pcmpeqb	%xmm1, %xmm3
14005dbe9:     	pmovmskb	%xmm3, %ebx
14005dbed:     	testl	%ebx, %ebx
14005dbef:     	jne	0x14005dc3f <.text+0x5cc3f>
14005dbf1:     	addq	%rdi, %r11
14005dbf4:     	addq	$0x10, %r11
14005dbf8:     	addq	$0x10, %rdi
14005dbfc:     	jmp	0x14005db99 <.text+0x5cb99>
14005dbfe:     	leaq	(%r9,%r14,8), %r9
14005dc02:     	movq	-0x8(%r9), %r9
14005dc06:     	cmpq	0x218(%rdx), %r9
14005dc0d:     	jae	0x14005dc3f <.text+0x5cc3f>
14005dc0f:     	movq	0x210(%rdx), %r10
14005dc16:     	movq	(%r10,%r9,8), %r9
14005dc1a:     	testq	%r9, %r9
14005dc1d:     	je	0x14005dc3f <.text+0x5cc3f>
14005dc1f:     	movq	0x1e0(%rdx), %rdx
14005dc26:     	notq	%r9
14005dc29:     	imulq	$0x38, %r9, %r9
14005dc2d:     	cmpb	$0x1, 0x30(%rdx,%r9)
14005dc33:     	jne	0x14005dc3f <.text+0x5cc3f>
14005dc35:     	addq	%r9, %rdx
14005dc38:     	movq	0x10(%rdx), %rdx
14005dc3c:     	movq	(%rdx), %rsi
14005dc3f:     	movq	$0x0, 0x20(%rsp)
14005dc48:     	movl	%r8d, 0x28(%rsp)
14005dc4d:     	movq	%rcx, 0x2c(%rsp)
14005dc52:     	movl	%eax, 0x34(%rsp)
14005dc56:     	leaq	0x20(%rsp), %rcx
14005dc5b:     	callq	0x145776a10 <.text+0x5775a10>
14005dc60:     	movl	$0x2, %edx
14005dc65:     	movq	%rax, %rcx
14005dc68:     	callq	*%rsi
14005dc6a:     	jmp	0x14005db25 <.text+0x5cb25>
