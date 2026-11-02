
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b964b:     	leaq	-0x58(%rbp), %rax
1459b964f:     	movups	%xmm6, (%rax)
1459b9652:     	movq	$0x0, 0x10(%rax)
1459b965a:     	addq	%r13, %rbx
1459b965d:     	movq	%rbx, -0x60(%rbp)
1459b9661:     	movl	$0x1, -0x40(%rbp)
1459b9668:     	movsd	%xmm7, -0x3c(%rbp)
1459b966d:     	movq	$0x3f800000, -0x34(%rbp) # imm = 0x3F800000
1459b9675:     	movups	%xmm8, -0x2c(%rbp)
1459b967a:     	movsd	%xmm9, -0x1c(%rbp)
1459b9680:     	movl	$0x0, -0x14(%rbp)
1459b9687:     	movups	%xmm10, -0x10(%rbp)
1459b968c:     	movsd	%xmm9, (%rbp)
1459b9692:     	leaq	-0x1c(%rbp), %rcx
1459b9696:     	movq	0x28(%rbp), %rdx
1459b969a:     	movq	%rbx, %r8
1459b969d:     	callq	0x1458e3a30 <.text+0x58e2a30>
1459b96a2:     	nop
