
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459503ae:     	movl	0x54(%r14), %eax
1459503b2:     	addl	0x60(%rbp), %r12d
1459503b6:     	addl	%r11d, %r12d
1459503b9:     	leal	(%r12,%rax), %ecx
1459503bd:     	cmpl	$0x1, %ecx
1459503c0:     	adcl	%eax, %r12d
1459503c3:     	testl	%eax, %eax
1459503c5:     	movl	$0x1, %r13d
1459503cb:     	cmovnel	%r12d, %r13d
