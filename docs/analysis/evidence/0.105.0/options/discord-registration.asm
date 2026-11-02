Disassembly of section .text:

0000000140001000 <.text>:
1400f7ac0:     	pushq	%rbp
1400f7ac1:     	pushq	%r15
1400f7ac3:     	pushq	%r14
1400f7ac5:     	pushq	%r13
1400f7ac7:     	pushq	%r12
1400f7ac9:     	pushq	%rsi
1400f7aca:     	pushq	%rdi
1400f7acb:     	pushq	%rbx
1400f7acc:     	subq	$0x138, %rsp            # imm = 0x138
1400f7ad3:     	leaq	0x80(%rsp), %rbp
1400f7adb:     	movq	$-0x2, 0xb0(%rbp)
1400f7ae6:     	movq	%r8, %r13
1400f7ae9:     	movq	%rdx, %rsi
1400f7aec:     	cmpb	$0x0, 0x44(%r8)
1400f7af1:     	movb	$0x1, 0x44(%r8)
1400f7af6:     	jne	0x1400f7b1d <.text+0xf6b1d>
1400f7af8:     	movq	$0x1, 0x20(%rsp)
1400f7b01:     	leaq	0x5ca7b5e(%rip), %rdx   # 0x145d9f666
1400f7b08:     	leaq	0x5ca7b66(%rip), %r9    # 0x145d9f675
1400f7b0f:     	movl	$0xf, %r8d
1400f7b15:     	movq	%rsi, %rcx
1400f7b18:     	callq	0x14063a3d0 <.text+0x6393d0>
