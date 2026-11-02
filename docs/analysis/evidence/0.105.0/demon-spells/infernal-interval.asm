
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459049a3:     	movss	0x48(%r14), %xmm0
1459049a9:     	mulss	%xmm9, %xmm0
1459049ae:     	mulss	%xmm0, %xmm8
1459049b3:     	mulss	%xmm8, %xmm13
1459049b8:     	mulss	0x480(%rsi), %xmm13
1459049c1:     	mulss	%xmm13, %xmm15
1459049c6:     	maxss	%xmm10, %xmm15
1459049cb:     	maxss	%xmm11, %xmm0
1459049d0:     	divss	%xmm0, %xmm15
1459049d5:     	maxss	%xmm10, %xmm15
1459049da:     	movq	0xd0(%rsi), %rax
1459049e1:     	addss	%xmm7, %xmm15
1459049e6:     	movss	%xmm15, 0x74(%rax,%r15)
