
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14059a644:     	movq	0x218(%rbp), %rax
14059a64b:     	cmpb	$0x0, 0x228(%rbp)
14059a652:     	jne	0x14059a88d <.text+0x59988d>
14059a658:     	jmp	0x14059a685 <.text+0x599685>
14059a65a:     	xorps	%xmm6, %xmm6
14059a65d:     	movq	0x208(%rbp), %rcx
14059a664:     	callq	0x1459cd660 <.text+0x59cc660>
14059a669:     	testb	$0x1, %al
14059a66b:     	jne	0x14059a62e <.text+0x59962e>
14059a66d:     	movaps	%xmm8, %xmm13
14059a671:     	movq	0x218(%rbp), %rax
14059a678:     	cmpb	$0x0, 0x228(%rbp)
14059a67f:     	jne	0x14059a88d <.text+0x59988d>
14059a685:     	cmpl	$0x0, 0x30(%rax)
14059a689:     	je	0x14059a88d <.text+0x59988d>
