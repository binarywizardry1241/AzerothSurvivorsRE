
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e0e94:     	movzbl	-0x2f(%rbp), %eax
1458e0e98:     	cmpb	$0x1, %al
1458e0e9a:     	adcb	$-0x1, %al
1458e0e9c:     	movzbl	%al, %eax
1458e0e9f:     	xorps	%xmm11, %xmm11
1458e0ea3:     	cvtsi2ss	%eax, %xmm11
1458e0ea8:     	mulss	%xmm9, %xmm11
1458e0ead:     	addss	%xmm10, %xmm11
1458e0eb2:     	jmp	0x1458e0e2d <.text+0x58dfe2d>
