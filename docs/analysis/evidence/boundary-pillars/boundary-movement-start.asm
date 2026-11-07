
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458f9498:     	cmpb	$0x0, 0xa73(%rsi)
1458f949f:     	jne	0x1458f94c1 <.text+0x58f84c1>
1458f94a1:     	subps	%xmm11, %xmm0
1458f94a5:     	mulps	%xmm0, %xmm0
1458f94a8:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1458f94ac:     	addss	%xmm0, %xmm1
1458f94b0:     	ucomiss	0x7a47b9(%rip), %xmm1   # 0x14609dc70
1458f94b7:     	jbe	0x1458f94c1 <.text+0x58f84c1>
1458f94b9:     	movq	%rsi, %rcx
1458f94bc:     	callq	0x145917cc0 <.text+0x5916cc0>
