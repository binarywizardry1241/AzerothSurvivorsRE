
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b4970:     	movq	(%rsi), %rax
1459b4973:     	cmpl	$0xa, 0x68(%rax)
1459b4977:     	jne	0x1459b4c07 <.text+0x59b3c07>
1459b497d:     	movl	$0x11, %edx
1459b4982:     	leaq	0x1801432(%rip), %rcx   # 0x1471b5dbb
1459b4989:     	callq	0x1458da590 <.text+0x58d9590>
1459b498e:     	nop
1459b498f:     	movq	%rax, %r12
1459b4992:     	movq	%rdx, %rdi
1459b4995:     	movq	(%rsi), %rax
1459b4998:     	movss	0x58(%rax), %xmm0
1459b499d:     	mulss	%xmm6, %xmm0
1459b49a1:     	movss	%xmm0, -0x38(%rbp)
