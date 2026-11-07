
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402803e0:     	pushq	%rbp
1402803e1:     	pushq	%r14
1402803e3:     	pushq	%rsi
1402803e4:     	pushq	%rdi
1402803e5:     	pushq	%rbx
1402803e6:     	subq	$0xc0, %rsp
1402803ed:     	leaq	0x80(%rsp), %rbp
1402803f5:     	movaps	%xmm6, 0x30(%rbp)
1402803f9:     	movq	$-0x2, 0x28(%rbp)
140280401:     	movq	%rdx, %rdi
140280404:     	movq	%rcx, %rsi
140280407:     	movq	0x18(%rdx), %rcx
14028040b:     	cmpq	$0x0, 0x30(%rcx)
140280410:     	je	0x1402804bb <.text+0x27f4bb>
140280416:     	movabsq	$-0x27d229146f1c10a1, %rdx # imm = 0xD82DD6EB90E3EF5F
140280420:     	movq	0x18(%rcx), %rax
140280424:     	movq	0x20(%rcx), %r8
140280428:     	xorl	%r9d, %r9d
14028042b:     	movdqa	0x5af3a7d(%rip), %xmm0  # 0x145d73eb0
140280433:     	pcmpeqd	%xmm1, %xmm1
140280437:     	movdqa	0x5b3f1d1(%rip), %xmm2  # 0x145dbf610
