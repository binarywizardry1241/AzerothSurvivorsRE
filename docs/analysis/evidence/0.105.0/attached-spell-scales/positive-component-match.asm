
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
141415dd0:     	movq	0x110(%rcx), %r9
141415dd7:     	movq	0x88(%rdx), %rax
141415dde:     	cmpq	%rax, %r9
141415de1:     	jae	0x1414160d9 <.text+0x14150d9>
141415de7:     	movq	0x80(%rdx), %r8
141415dee:     	cmpq	$0x0, (%r8,%r9,8)
141415df3:     	je	0x1414160d9 <.text+0x14150d9>
