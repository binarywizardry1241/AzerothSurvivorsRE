
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14059b119:     	movzbl	0x7a69a78(%rip), %ecx   # 0x148004b98
14059b120:     	testb	%cl, %cl
14059b122:     	je	0x14059b130 <.text+0x59a130>
14059b124:     	movq	0x40(%rax), %rcx
14059b128:     	movq	%rcx, (%r14)
14059b12b:     	movq	%rcx, %rdx
14059b12e:     	jmp	0x14059b137 <.text+0x59a137>
14059b130:     	movq	(%r14), %rdx
14059b133:     	movq	0x40(%rax), %rcx
