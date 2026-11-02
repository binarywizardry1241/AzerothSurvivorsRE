
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005c0c2:     	movl	(%rax), %ecx
14005c0c4:     	movl	$0x73756170, %edx       # imm = 0x73756170
14005c0c9:     	xorl	%edx, %ecx
14005c0cb:     	movzwl	0x4(%rax), %edx
14005c0cf:     	xorl	$0x6465, %edx           # imm = 0x6465
14005c0d5:     	orl	%ecx, %edx
14005c0d7:     	je	0x14005cf53 <.text+0x5bf53>
