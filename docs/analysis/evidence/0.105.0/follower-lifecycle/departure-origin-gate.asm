
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145904df5:     	cmpq	0x7b0(%r13), %r15
145904dfc:     	jae	0x145904d60 <.text+0x5903d60>
145904e02:     	movq	0x7a8(%r13), %rax
145904e09:     	movq	%r15, %rcx
145904e0c:     	shlq	$0x6, %rcx
145904e10:     	cmpb	$0x22, (%rax,%rcx)
145904e14:     	jne	0x145904d60 <.text+0x5903d60>
145904e1a:     	cmpq	0x78(%r13), %r15
145904e1e:     	jae	0x145904d60 <.text+0x5903d60>
