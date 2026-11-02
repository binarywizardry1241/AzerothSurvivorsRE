Disassembly of section .text:

0000000140001000 <.text>:
140dcea63:     	leaq	0x51ecdee(%rip), %r14   # 0x145fbb858
140dcea6a:     	leaq	0x51f1707(%rip), %rcx   # 0x145fc0178
140dcea71:     	leaq	0x51efeb0(%rip), %rdx   # 0x145fbe928
140dcea78:     	xorl	%ebx, %ebx
140dcea7a:     	testq	%r14, %r14
140dcea7d:     	je	0x140dceaa0 <.text+0xdcdaa0>
140dcea7f:     	cmpq	%rdx, %r14
140dcea82:     	je	0x140dceaa0 <.text+0xdcdaa0>
140dcea84:     	leaq	0x58(%r14), %rax
140dcea88:     	movq	%rax, 0x160(%rbp)
140dcea8f:     	cmpl	$0x2, (%r14)
140dcea93:     	je	0x140dceac6 <.text+0xdcdac6>
140dcea95:     	jmp	0x140dceb10 <.text+0xdcdb10>
140dcea97:     	nopw	(%rax,%rax)
140dceaa0:     	cmpq	$0x53e0, %rbx           # imm = 0x53E0
140dceaa7:     	je	0x140dcecea <.text+0xdcdcea>
140dceaad:     	leaq	(%rcx,%rbx), %r14
140dceab1:     	addq	$0x58, %rbx
140dceab5:     	movq	$0x0, 0x160(%rbp)
140dceac0:     	cmpl	$0x2, (%r14)
140dceac4:     	jne	0x140dceb10 <.text+0xdcdb10>
140dceac6:     	movq	0x8(%r14), %rax
140dceaca:     	movq	0x10(%r14), %rdx
140dceace:     	leaq	-0x8(%rax), %rcx
140dcead2:     	shlq	$0x3, %rdx
140dcead6:     	leaq	(%rdx,%rdx,2), %rdx
140dceada:     	negq	%rdx
140dceadd:     	xorl	%r8d, %r8d
140dceae0:     	cmpq	%r8, %rdx
140dceae3:     	je	0x140dceb10 <.text+0xdcdb10>
140dceae5:     	addq	$-0x18, %r8
140dceae9:     	cmpq	%r13, 0x8(%rcx)
140dceaed:     	leaq	0x18(%rcx), %rcx
140dceaf1:     	jne	0x140dceae0 <.text+0xdcdae0>
140dceaf3:     	subq	%r8, %rax
140dceaf6:     	leaq	-0x10(%rax), %rcx
140dceafa:     	addq	$-0x8, %rax
140dceafe:     	movq	0x30(%r14), %rdi
140dceb02:     	testq	%rdi, %rdi
140dceb05:     	js	0x140dcecc9 <.text+0xdcdcc9>
140dceb0b:     	jmp	0x140dceb25 <.text+0xdcdb25>
140dceb0d:     	nopl	(%rax)
140dceb10:     	leaq	0x38(%r14), %rcx
140dceb14:     	leaq	0x40(%r14), %rax
140dceb18:     	movq	0x30(%r14), %rdi
140dceb1c:     	testq	%rdi, %rdi
140dceb1f:     	js	0x140dcecc9 <.text+0xdcdcc9>
140dceb25:     	movq	%r15, 0x158(%rbp)
140dceb2c:     	movq	(%rax), %r12
140dceb2f:     	movq	(%rcx), %r15
