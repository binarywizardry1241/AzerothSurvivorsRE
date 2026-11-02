
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402a0860:     	pushq	%rbp
1402a0861:     	pushq	%r14
1402a0863:     	pushq	%rsi
1402a0864:     	pushq	%rdi
1402a0865:     	pushq	%rbx
1402a0866:     	subq	$0xe0, %rsp
1402a086d:     	leaq	0x80(%rsp), %rbp
1402a0875:     	movaps	%xmm6, 0x50(%rbp)
1402a0879:     	movq	$-0x2, 0x48(%rbp)
1402a0881:     	movq	%rcx, %rax
1402a0884:     	addq	$0x40, %rcx
1402a0888:     	leaq	0x5a8(%rax), %rdx
1402a088f:     	movq	%rcx, 0x30(%rbp)
1402a0893:     	movq	%rdx, 0x38(%rbp)
1402a0897:     	movq	$0x0, 0x18(%rbp)
1402a089f:     	movq	$0x8, 0x20(%rbp)
1402a08a7:     	movq	$0x0, 0x28(%rbp)
1402a08af:     	cmpq	$0x0, 0x70(%rax)
1402a08b4:     	je	0x1402a0959 <.text+0x29f959>
1402a08ba:     	movabsq	$-0x7af4e1b2bab22f7d, %r9 # imm = 0x850B1E4D454DD083
1402a08c4:     	movq	0x58(%rax), %r8
1402a08c8:     	movq	0x60(%rax), %r10
1402a08cc:     	xorl	%r11d, %r11d
1402a08cf:     	movdqa	0x5b157d9(%rip), %xmm0  # 0x145db60b0
1402a08d7:     	pcmpeqd	%xmm1, %xmm1
1402a08db:     	movdqa	0x5b1ecfd(%rip), %xmm2  # 0x145dbf5e0
