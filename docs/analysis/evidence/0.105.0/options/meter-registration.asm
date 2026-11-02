Disassembly of section .text:

0000000140001000 <.text>:
14016d5c0:     	pushq	%rbp
14016d5c1:     	pushq	%r15
14016d5c3:     	pushq	%r14
14016d5c5:     	pushq	%rsi
14016d5c6:     	pushq	%rdi
14016d5c7:     	pushq	%rbx
14016d5c8:     	subq	$0x68, %rsp
14016d5cc:     	leaq	0x60(%rsp), %rbp
14016d5d1:     	movq	$-0x2, (%rbp)
14016d5d9:     	movq	%rdx, %rsi
14016d5dc:     	cmpb	$0x0, (%r8)
14016d5e0:     	movb	$0x1, (%r8)
14016d5e4:     	jne	0x14016d60b <.text+0x16c60b>
14016d5e6:     	movq	$0x1, 0x20(%rsp)
14016d5ef:     	leaq	0x5c492e6(%rip), %rdx   # 0x145db68dc
14016d5f6:     	leaq	0x5c492e9(%rip), %r9    # 0x145db68e6
14016d5fd:     	movl	$0xa, %r8d
14016d603:     	movq	%rsi, %rcx
14016d606:     	callq	0x14063a3d0 <.text+0x6393d0>
