Disassembly of section .text:

0000000140001000 <.text>:
140094870:     	pushq	%r14
140094872:     	pushq	%rsi
140094873:     	pushq	%rdi
140094874:     	pushq	%rbp
140094875:     	pushq	%rbx
140094876:     	subq	$0x70, %rsp
14009487a:     	movq	%rdx, %rsi
14009487d:     	cmpb	$0x0, (%r8)
140094881:     	movb	$0x1, (%r8)
140094885:     	jne	0x1400948ac <.text+0x938ac>
140094887:     	movq	$0x1, 0x20(%rsp)
140094890:     	leaq	0x5d03099(%rip), %rdx   # 0x145d97930
140094897:     	leaq	0x5d04c13(%rip), %r9    # 0x145d994b1
14009489e:     	movl	$0x9, %r8d
1400948a4:     	movq	%rsi, %rcx
1400948a7:     	callq	0x14063a3d0 <.text+0x6393d0>
