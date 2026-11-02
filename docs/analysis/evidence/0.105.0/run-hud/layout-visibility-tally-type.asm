
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14028ed30:     	pushq	%rbp
14028ed31:     	pushq	%r15
14028ed33:     	pushq	%r14
14028ed35:     	pushq	%r13
14028ed37:     	pushq	%r12
14028ed39:     	pushq	%rsi
14028ed3a:     	pushq	%rdi
14028ed3b:     	pushq	%rbx
14028ed3c:     	subq	$0xd8, %rsp
14028ed43:     	leaq	0x80(%rsp), %rbp
14028ed4b:     	movaps	%xmm6, 0x40(%rbp)
14028ed4f:     	movq	$-0x2, 0x38(%rbp)
14028ed57:     	movq	%rdx, %r15
14028ed5a:     	movq	0x18(%rdx), %r14
14028ed5e:     	cmpq	$0x0, 0x30(%r14)
14028ed63:     	movq	%rcx, -0x58(%rbp)
14028ed67:     	je	0x14028ee0b <.text+0x28de0b>
14028ed6d:     	movabsq	$-0x2062cb3285e56b13, %rdx # imm = 0xDF9D34CD7A1A94ED
14028ed77:     	movq	0x18(%r14), %rax
14028ed7b:     	movq	0x20(%r14), %r8
14028ed7f:     	xorl	%r9d, %r9d
14028ed82:     	movdqa	0x5b1a406(%rip), %xmm0  # 0x145da9190
14028ed8a:     	pcmpeqd	%xmm1, %xmm1
14028ed8e:     	movdqa	0x5b3098a(%rip), %xmm2  # 0x145dbf720
