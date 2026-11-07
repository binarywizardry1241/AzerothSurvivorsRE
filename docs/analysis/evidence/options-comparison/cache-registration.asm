Disassembly of section .text:

0000000140001000 <.text>:
14003cae0:     	pushq	%rbp
14003cae1:     	pushq	%r14
14003cae3:     	pushq	%rsi
14003cae4:     	pushq	%rdi
14003cae5:     	pushq	%rbx
14003cae6:     	subq	$0x130, %rsp            # imm = 0x130
14003caed:     	leaq	0x80(%rsp), %rbp
14003caf5:     	movq	$-0x2, 0xa8(%rbp)
14003cb00:     	movq	%r8, %rdi
14003cb03:     	movq	%rdx, %rsi
14003cb06:     	movzbl	(%r8), %r14d
14003cb0a:     	cmpb	$0x2, %r14b
14003cb0e:     	jne	0x14003cb35 <.text+0x3bb35>
14003cb10:     	movq	$0x1, 0x20(%rsp)
14003cb19:     	leaq	0x5d34690(%rip), %rdx   # 0x145d711b0
14003cb20:     	leaq	0x5d343ca(%rip), %r9    # 0x145d70ef1
14003cb27:     	movl	$0xc, %r8d
14003cb2d:     	movq	%rsi, %rcx
14003cb30:     	callq	0x14063a3d0 <.text+0x6393d0>
