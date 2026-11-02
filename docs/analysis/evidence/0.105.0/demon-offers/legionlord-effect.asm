
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14587c8c7:     	cmpq	0x30(%rbp), %rbx
14587c8cb:     	jne	0x14587c8d7 <.text+0x587b8d7>
14587c8cd:     	leaq	0x30(%rbp), %rcx
14587c8d1:     	callq	0x145bfb270 <.text+0x5bfa270>
14587c8d6:     	nop
14587c8d7:     	movq	0x38(%rbp), %rax
14587c8db:     	movl	%ebx, %ecx
14587c8dd:     	shll	$0x6, %ecx
14587c8e0:     	movb	$0x24, (%rax,%rcx)
14587c8e4:     	movb	$0x1, 0x8(%rax,%rcx)
14587c8e9:     	movq	%r14, 0x10(%rax,%rcx)
14587c8ee:     	movq	%r15, 0x18(%rax,%rcx)
14587c8f3:     	movl	$0x3f800000, 0x20(%rax,%rcx) # imm = 0x3F800000
14587c8fb:     	movb	$0x6, 0x24(%rax,%rcx)
14587c900:     	incq	%rbx
14587c903:     	movq	%rbx, 0x40(%rbp)
