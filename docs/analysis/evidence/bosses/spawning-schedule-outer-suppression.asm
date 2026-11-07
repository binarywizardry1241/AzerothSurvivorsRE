
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a701a:     	cmpb	$0x0, 0x95b(%r13)
1454a7022:     	jne	0x1454aa103 <.text+0x54a9103>
1454a7028:     	movss	0x8e4(%r13), %xmm0
1454a7031:     	divss	0x489ec7(%rip), %xmm0   # 0x145930f00
1454a7039:     	movss	%xmm0, 0x68(%rbp)
