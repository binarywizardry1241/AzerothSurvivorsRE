
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402a38d0:     	pushq	%rbp
1402a38d1:     	pushq	%r14
1402a38d3:     	pushq	%rsi
1402a38d4:     	pushq	%rdi
1402a38d5:     	pushq	%rbx
1402a38d6:     	subq	$0xe0, %rsp
1402a38dd:     	leaq	0x80(%rsp), %rbp
1402a38e5:     	movaps	%xmm6, 0x50(%rbp)
1402a38e9:     	movq	$-0x2, 0x48(%rbp)
1402a38f1:     	movq	%rcx, %rax
1402a38f4:     	addq	$0x40, %rcx
1402a38f8:     	leaq	0x5a8(%rax), %rdx
1402a38ff:     	movq	%rcx, 0x30(%rbp)
1402a3903:     	movq	%rdx, 0x38(%rbp)
1402a3907:     	movq	$0x0, 0x18(%rbp)
1402a390f:     	movq	$0x8, 0x20(%rbp)
1402a3917:     	movq	$0x0, 0x28(%rbp)
1402a391f:     	cmpq	$0x0, 0x70(%rax)
1402a3924:     	je	0x1402a39c9 <.text+0x2a29c9>
1402a392a:     	movabsq	$-0x27d229146f1c10a1, %r9 # imm = 0xD82DD6EB90E3EF5F
1402a3934:     	movq	0x58(%rax), %r8
1402a3938:     	movq	0x60(%rax), %r10
1402a393c:     	xorl	%r11d, %r11d
1402a393f:     	movdqa	0x5ad0569(%rip), %xmm0  # 0x145d73eb0
1402a3947:     	pcmpeqd	%xmm1, %xmm1
1402a394b:     	movdqa	0x5b1bcbd(%rip), %xmm2  # 0x145dbf610
