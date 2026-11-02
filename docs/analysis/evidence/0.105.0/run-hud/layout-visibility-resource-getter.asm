
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140029800:     	pushq	%rbp
140029801:     	pushq	%r14
140029803:     	pushq	%rsi
140029804:     	pushq	%rdi
140029805:     	pushq	%rbx
140029806:     	subq	$0xc0, %rsp
14002980d:     	leaq	0x80(%rsp), %rbp
140029815:     	movq	$-0x2, 0x38(%rbp)
14002981d:     	movq	%rcx, %rax
140029820:     	addq	$0x40, %rcx
140029824:     	leaq	0x5a8(%rax), %rdx
14002982b:     	movq	%rcx, 0x28(%rbp)
14002982f:     	movq	%rdx, 0x30(%rbp)
140029833:     	movq	$0x0, 0x10(%rbp)
14002983b:     	movq	$0x8, 0x18(%rbp)
140029843:     	movq	$0x0, 0x20(%rbp)
14002984b:     	cmpq	$0x0, 0x90(%rax)
140029853:     	je	0x1400298f9 <.text+0x288f9>
140029859:     	movabsq	$0x4878caffe80135d0, %r9 # imm = 0x4878CAFFE80135D0
140029863:     	movq	0x78(%rax), %r8
140029867:     	movq	0x80(%rax), %r10
14002986e:     	xorl	%r11d, %r11d
140029871:     	movdqa	0x5d44117(%rip), %xmm0  # 0x145d6d990
140029879:     	pcmpeqd	%xmm1, %xmm1
14002987d:     	movdqa	0x5d4411b(%rip), %xmm2  # 0x145d6d9a0
