
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145558cc0:     	pushq	%r15
145558cc2:     	pushq	%r14
145558cc4:     	pushq	%r13
145558cc6:     	pushq	%r12
145558cc8:     	pushq	%rsi
145558cc9:     	pushq	%rdi
145558cca:     	pushq	%rbp
145558ccb:     	pushq	%rbx
145558ccc:     	movq	%rcx, %rax
145558ccf:     	movq	(%rdx), %rcx
145558cd2:     	movq	0x10(%rdx), %r8
145558cd6:     	movq	0x30(%rdx), %r9
145558cda:     	movq	%rcx, %r10
145558cdd:     	testq	%r9, %r9
145558ce0:     	je	0x145558e08 <.text+0x5557e08>
145558ce6:     	movq	0x8(%rdx), %r11
145558cea:     	movq	0x18(%rdx), %rsi
145558cee:     	movq	%rcx, %r10
145558cf1:     	cmpq	%rsi, %r11
145558cf4:     	je	0x145558e08 <.text+0x5557e08>
145558cfa:     	movq	0x20(%rdx), %rdi
145558cfe:     	movq	0x28(%rdx), %rdx
145558d02:     	movq	%rcx, %r10
145558d05:     	jmp	0x145558d29 <.text+0x5557d29>
145558d07:     	nopw	(%rax,%rax)
145558d10:     	movq	%rbx, (%r10)
145558d13:     	addq	$0x8, %r10
145558d17:     	decq	%r9
145558d1a:     	je	0x145558e08 <.text+0x5557e08>
145558d20:     	cmpq	%rsi, %r11
145558d23:     	je	0x145558e08 <.text+0x5557e08>
145558d29:     	movq	(%r11), %rbx
145558d2c:     	addq	$0x8, %r11
145558d30:     	movq	0x8(%rdi), %r14
145558d34:     	imulq	$0x160, 0x10(%rdi), %r12 # imm = 0x160
145558d3c:     	xorl	%r15d, %r15d
145558d3f:     	movq	%r14, %r13
145558d42:     	nopw	%cs:(%rax,%rax)
145558d50:     	cmpq	%r15, %r12
145558d53:     	je	0x145558d20 <.text+0x5557d20>
145558d55:     	addq	$0x160, %r15            # imm = 0x160
145558d5c:     	cmpq	%rbx, 0x88(%r13)
145558d63:     	leaq	0x160(%r13), %r13
145558d6a:     	jne	0x145558d50 <.text+0x5557d50>
145558d6c:     	movq	-0x150(%r14,%r15), %r12
145558d74:     	testq	%r12, %r12
145558d77:     	je	0x145558d10 <.text+0x5557d10>
145558d79:     	movl	0x10(%rdx), %ebp
145558d7c:     	movq	-0x158(%r14,%r15), %r14
145558d84:     	shlq	$0x4, %r12
145558d88:     	leaq	(%r12,%r12,2), %r15
145558d8c:     	cmpq	$0x0, (%rdx)
145558d90:     	je	0x145558dcf <.text+0x5557dcf>
145558d92:     	movq	0x8(%rdx), %r12
145558d96:     	xorl	%r13d, %r13d
145558d99:     	jmp	0x145558dad <.text+0x5557dad>
145558d9b:     	nopl	(%rax,%rax)
145558da0:     	addq	$0x30, %r13
145558da4:     	cmpq	%r13, %r15
145558da7:     	je	0x145558d10 <.text+0x5557d10>
145558dad:     	cmpl	%ebp, 0x10(%r14,%r13)
145558db2:     	jne	0x145558da0 <.text+0x5557da0>
145558db4:     	cmpl	$0x1, (%r14,%r13)
145558db9:     	jne	0x145558da0 <.text+0x5557da0>
145558dbb:     	cmpq	%r12, 0x8(%r14,%r13)
145558dc0:     	jne	0x145558da0 <.text+0x5557da0>
145558dc2:     	cmpl	$0x0, 0x20(%r14,%r13)
145558dc8:     	je	0x145558da0 <.text+0x5557da0>
145558dca:     	jmp	0x145558d20 <.text+0x5557d20>
145558dcf:     	xorl	%r12d, %r12d
145558dd2:     	jmp	0x145558ded <.text+0x5557ded>
145558dd4:     	nopw	%cs:(%rax,%rax)
145558de0:     	addq	$0x30, %r12
145558de4:     	cmpq	%r12, %r15
145558de7:     	je	0x145558d10 <.text+0x5557d10>
145558ded:     	cmpl	%ebp, 0x10(%r14,%r12)
145558df2:     	jne	0x145558de0 <.text+0x5557de0>
145558df4:     	cmpb	$0x0, (%r14,%r12)
145558df9:     	jne	0x145558de0 <.text+0x5557de0>
145558dfb:     	cmpl	$0x0, 0x20(%r14,%r12)
145558e01:     	je	0x145558de0 <.text+0x5557de0>
145558e03:     	jmp	0x145558d20 <.text+0x5557d20>
145558e08:     	subq	%rcx, %r10
145558e0b:     	shrq	$0x3, %r10
145558e0f:     	movq	%r8, (%rax)
145558e12:     	movq	%rcx, 0x8(%rax)
145558e16:     	movq	%r10, 0x10(%rax)
145558e1a:     	popq	%rbx
145558e1b:     	popq	%rbp
145558e1c:     	popq	%rdi
145558e1d:     	popq	%rsi
145558e1e:     	popq	%r12
145558e20:     	popq	%r13
145558e22:     	popq	%r14
145558e24:     	popq	%r15
145558e26:     	retq
