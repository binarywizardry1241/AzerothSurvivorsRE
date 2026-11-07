
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14028e1f0:     	pushq	%rbp
14028e1f1:     	pushq	%r15
14028e1f3:     	pushq	%r14
14028e1f5:     	pushq	%r13
14028e1f7:     	pushq	%r12
14028e1f9:     	pushq	%rsi
14028e1fa:     	pushq	%rdi
14028e1fb:     	pushq	%rbx
14028e1fc:     	subq	$0xc8, %rsp
14028e203:     	leaq	0x80(%rsp), %rbp
14028e20b:     	movaps	%xmm6, 0x30(%rbp)
14028e20f:     	movq	$-0x2, 0x28(%rbp)
14028e217:     	movq	%rdx, %r12
14028e21a:     	movq	%rcx, %rsi
14028e21d:     	movq	0x18(%rdx), %rcx
14028e221:     	cmpq	$0x0, 0x30(%rcx)
14028e226:     	je	0x14028e2cb <.text+0x28d2cb>
14028e22c:     	movabsq	$0x7a03331b1d29fe5d, %rdx # imm = 0x7A03331B1D29FE5D
14028e236:     	movq	0x18(%rcx), %rax
14028e23a:     	movq	0x20(%rcx), %r8
14028e23e:     	xorl	%r9d, %r9d
14028e241:     	movdqa	0x5b27e27(%rip), %xmm0  # 0x145db6070
14028e249:     	pcmpeqd	%xmm1, %xmm1
14028e24d:     	movdqa	0x5b314bb(%rip), %xmm2  # 0x145dbf710
