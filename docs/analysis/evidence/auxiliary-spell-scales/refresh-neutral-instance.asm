
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592853b:     	leaq	0x90(%rbp), %rax
145928542:     	movups	%xmm6, (%rax)
145928545:     	movq	$0x0, 0x10(%rax)
14592854d:     	addq	%r14, %r15
145928550:     	movq	%r15, 0x88(%rbp)
145928557:     	movl	$0x1, 0xa8(%rbp)
145928561:     	movsd	%xmm7, 0xac(%rbp)
145928569:     	movq	$0x3f800000, 0xb4(%rbp) # imm = 0x3F800000
145928574:     	movups	%xmm8, 0xbc(%rbp)
14592857c:     	movsd	%xmm9, 0xcc(%rbp)
145928585:     	movl	$0x0, 0xd4(%rbp)
14592858f:     	movups	%xmm10, 0xd8(%rbp)
145928597:     	movsd	%xmm9, 0xe8(%rbp)
1459285a0:     	leaq	0xcc(%rbp), %rcx
1459285a7:     	leaq	0x770(%rsi), %rdx
1459285ae:     	movq	%r15, %r8
1459285b1:     	callq	0x1458e3a30 <.text+0x58e2a30>
1459285b6:     	nop
1459285b7:     	movl	$0x3f800000, 0xac(%rbp) # imm = 0x3F800000
