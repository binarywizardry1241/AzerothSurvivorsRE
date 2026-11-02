
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145910091:     	cmpl	$0x0, 0x9fc(%r13)
145910099:     	je	0x1459100bc <.text+0x590f0bc>
14591009b:     	cmpb	$0x0, 0xa6c(%r13)
1459100a3:     	jne	0x1459100bc <.text+0x590f0bc>
1459100a5:     	cmpb	$0x1, 0xa73(%r13)
1459100ad:     	jne	0x1459100bc <.text+0x590f0bc>
1459100af:     	movq	%r13, %rcx
1459100b2:     	movb	$0x2, %dl
1459100b4:     	movb	$0x1, %r8b
1459100b7:     	callq	0x145951c10 <.text+0x5950c10>
