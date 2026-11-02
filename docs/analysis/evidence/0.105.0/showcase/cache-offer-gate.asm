
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14590c812:     	cmpb	$0x1, 0xa73(%rdx)
14590c819:     	jne	0x14590c690 <.text+0x590b690>
14590c81f:     	movq	0x378(%rbp), %rax
14590c826:     	cmpl	$0x0, 0x9f8(%rax)
14590c82d:     	je	0x14590c690 <.text+0x590b690>
14590c833:     	movq	0x378(%rbp), %rax
14590c83a:     	cmpb	$0x0, 0xa6c(%rax)
14590c841:     	jne	0x14590c690 <.text+0x590b690>
14590c847:     	movq	0x378(%rbp), %rcx
14590c84e:     	movb	$0x1, %dl
14590c850:     	movb	$0x1, %r8b
14590c853:     	callq	0x145951c10 <.text+0x5950c10>
14590c858:     	nop
