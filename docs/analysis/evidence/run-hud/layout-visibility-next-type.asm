
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14027fa40:     	pushq	%rbp
14027fa41:     	pushq	%r14
14027fa43:     	pushq	%rsi
14027fa44:     	pushq	%rdi
14027fa45:     	pushq	%rbx
14027fa46:     	subq	$0xc0, %rsp
14027fa4d:     	leaq	0x80(%rsp), %rbp
14027fa55:     	movaps	%xmm6, 0x30(%rbp)
14027fa59:     	movq	$-0x2, 0x28(%rbp)
14027fa61:     	movq	%rdx, %rdi
14027fa64:     	movq	%rcx, %rsi
14027fa67:     	movq	0x18(%rdx), %rcx
14027fa6b:     	cmpq	$0x0, 0x30(%rcx)
14027fa70:     	je	0x14027fb1b <.text+0x27eb1b>
14027fa76:     	movabsq	$-0x7af4e1b2bab22f7d, %rdx # imm = 0x850B1E4D454DD083
14027fa80:     	movq	0x18(%rcx), %rax
14027fa84:     	movq	0x20(%rcx), %r8
14027fa88:     	xorl	%r9d, %r9d
14027fa8b:     	movdqa	0x5b3661d(%rip), %xmm0  # 0x145db60b0
14027fa93:     	pcmpeqd	%xmm1, %xmm1
14027fa97:     	movdqa	0x5b3fb41(%rip), %xmm2  # 0x145dbf5e0
