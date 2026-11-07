
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140b5b0dc:     	movsd	0x1c(%rbx), %xmm0
140b5b0e1:     	movsldup	%xmm6, %xmm1            # xmm1 = xmm6[0,0,2,2]
140b5b0e5:     	mulps	%xmm0, %xmm1
140b5b0e8:     	movlps	%xmm1, 0x1c(%rbx)
140b5b0ec:     	mulss	0x24(%rbx), %xmm6
140b5b0f1:     	movss	%xmm6, 0x24(%rbx)
