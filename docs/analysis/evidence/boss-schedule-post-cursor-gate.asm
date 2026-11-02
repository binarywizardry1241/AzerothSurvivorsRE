
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547b8a8: 49 8b 84 24 98 08 00 00     	movq	0x898(%r12), %rax
14547b8b0: 48 83 f8 05                 	cmpq	$0x5, %rax
14547b8b4: 0f 82 91 e9 ff ff           	jb	0x14547a24b <.text+0x547924b>
14547b8ba: 41 80 bc 24 35 09 00 00 00  	cmpb	$0x0, 0x935(%r12)
14547b8c3: 0f 84 b9 00 00 00           	je	0x14547b982 <.text+0x547a982>
14547b8c9: 41 0f 2e 84 24 18 09 00 00  	ucomiss	0x918(%r12), %xmm0
14547b8d2: 0f 82 aa 00 00 00           	jb	0x14547b982 <.text+0x547a982>
