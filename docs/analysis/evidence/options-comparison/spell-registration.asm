Disassembly of section .text:

0000000140001000 <.text>:
14003de60:     	pushq	%rbp
14003de61:     	pushq	%rsi
14003de62:     	subq	$0x58, %rsp
14003de66:     	leaq	0x50(%rsp), %rbp
14003de6b:     	movq	$-0x2, (%rbp)
14003de73:     	cmpb	$0x0, (%r8)
14003de77:     	movb	$0x1, (%r8)
14003de7b:     	jne	0x14003deab <.text+0x3ceab>
14003de7d:     	movq	$0x1, 0x20(%rsp)
14003de86:     	leaq	0x5d333e3(%rip), %rax   # 0x145d71270
14003de8d:     	leaq	0x5d3305d(%rip), %r9    # 0x145d70ef1
14003de94:     	movl	$0xe, %r8d
14003de9a:     	movq	%rdx, %rcx
14003de9d:     	movq	%rdx, %rsi
14003dea0:     	movq	%rax, %rdx
14003dea3:     	callq	0x14063a3d0 <.text+0x6393d0>
14003dea8:     	movq	%rsi, %rdx
