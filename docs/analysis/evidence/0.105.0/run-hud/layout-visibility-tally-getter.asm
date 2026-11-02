
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402a1de0:     	pushq	%rbp
1402a1de1:     	pushq	%r14
1402a1de3:     	pushq	%rsi
1402a1de4:     	pushq	%rdi
1402a1de5:     	pushq	%rbx
1402a1de6:     	subq	$0xe0, %rsp
1402a1ded:     	leaq	0x80(%rsp), %rbp
1402a1df5:     	movaps	%xmm6, 0x50(%rbp)
1402a1df9:     	movq	$-0x2, 0x48(%rbp)
1402a1e01:     	movq	%rcx, %rax
1402a1e04:     	addq	$0x40, %rcx
1402a1e08:     	leaq	0x5a8(%rax), %rdx
1402a1e0f:     	movq	%rcx, 0x30(%rbp)
1402a1e13:     	movq	%rdx, 0x38(%rbp)
1402a1e17:     	movq	$0x0, 0x18(%rbp)
1402a1e1f:     	movq	$0x8, 0x20(%rbp)
1402a1e27:     	movq	$0x0, 0x28(%rbp)
1402a1e2f:     	cmpq	$0x0, 0x70(%rax)
1402a1e34:     	je	0x1402a1ed9 <.text+0x2a0ed9>
1402a1e3a:     	movabsq	$-0x2062cb3285e56b13, %r9 # imm = 0xDF9D34CD7A1A94ED
1402a1e44:     	movq	0x58(%rax), %r8
1402a1e48:     	movq	0x60(%rax), %r10
1402a1e4c:     	xorl	%r11d, %r11d
1402a1e4f:     	movdqa	0x5b07339(%rip), %xmm0  # 0x145da9190
1402a1e57:     	pcmpeqd	%xmm1, %xmm1
1402a1e5b:     	movdqa	0x5b1d8bd(%rip), %xmm2  # 0x145dbf720
