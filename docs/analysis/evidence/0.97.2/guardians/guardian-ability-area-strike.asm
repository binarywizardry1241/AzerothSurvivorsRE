
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ccf2a:     	movd	%r14d, %xmm9
1454ccf2f:     	subps	%xmm1, %xmm6
1454ccf32:     	mulps	%xmm6, %xmm6
1454ccf35:     	movshdup	%xmm6, %xmm0            # xmm0 = xmm6[1,1,3,3]
1454ccf39:     	addss	%xmm6, %xmm0
1454ccf3d:     	xorps	%xmm6, %xmm6
1454ccf40:     	sqrtss	%xmm0, %xmm6
1454ccf44:     	ucomiss	%xmm6, %xmm9
1454ccf48:     	setb	%bl
1454ccf4b:     	jae	0x1454cd09d <.text+0x54cc09d>
1454ccf51:     	movl	$0x8, %r9d
1454ccf57:     	xorl	%ecx, %ecx
1454ccf59:     	jmp	0x1454cd0d3 <.text+0x54cc0d3>
