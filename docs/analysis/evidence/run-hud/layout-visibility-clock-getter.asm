
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402a63d0:     	pushq	%rbp
1402a63d1:     	pushq	%r14
1402a63d3:     	pushq	%rsi
1402a63d4:     	pushq	%rdi
1402a63d5:     	pushq	%rbx
1402a63d6:     	subq	$0xe0, %rsp
1402a63dd:     	leaq	0x80(%rsp), %rbp
1402a63e5:     	movaps	%xmm6, 0x50(%rbp)
1402a63e9:     	movq	$-0x2, 0x48(%rbp)
1402a63f1:     	movq	%rcx, %rax
1402a63f4:     	addq	$0x40, %rcx
1402a63f8:     	leaq	0x5a8(%rax), %rdx
1402a63ff:     	movq	%rcx, 0x30(%rbp)
1402a6403:     	movq	%rdx, 0x38(%rbp)
1402a6407:     	movq	$0x0, 0x18(%rbp)
1402a640f:     	movq	$0x8, 0x20(%rbp)
1402a6417:     	movq	$0x0, 0x28(%rbp)
1402a641f:     	cmpq	$0x0, 0x70(%rax)
1402a6424:     	je	0x1402a64c9 <.text+0x2a54c9>
1402a642a:     	movabsq	$0x4f191e8a8b9a07a0, %r9 # imm = 0x4F191E8A8B9A07A0
1402a6434:     	movq	0x58(%rax), %r8
1402a6438:     	movq	0x60(%rax), %r10
1402a643c:     	xorl	%r11d, %r11d
1402a643f:     	movdqa	0x5b191f9(%rip), %xmm0  # 0x145dbf640
1402a6447:     	pcmpeqd	%xmm1, %xmm1
1402a644b:     	movdqa	0x5b191fd(%rip), %xmm2  # 0x145dbf650
