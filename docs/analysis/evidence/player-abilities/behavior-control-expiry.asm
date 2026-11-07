
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c9fe0: f3 0f 10 87 44 01 00 00     	movss	0x144(%rdi), %xmm0
1454c9fe8: 0f 2e c6                    	ucomiss	%xmm6, %xmm0
1454c9feb: 4c 8b a5 a0 02 00 00        	movq	0x2a0(%rbp), %r12
1454c9ff2: 0f 87 54 fa ff ff           	ja	0x1454c9a4c <.text+0x54c8a4c>
1454c9ff8: 41 0f 2e c0                 	ucomiss	%xmm8, %xmm0
1454c9ffc: 0f 86 a5 02 00 00           	jbe	0x1454ca2a7 <.text+0x54c92a7>
1454ca002: 0f 2e f0                    	ucomiss	%xmm0, %xmm6
1454ca005: 0f 82 9c 02 00 00           	jb	0x1454ca2a7 <.text+0x54c92a7>
1454ca00b: c7 87 44 01 00 00 00 00 00 00       	movl	$0x0, 0x144(%rdi)
1454ca015: f3 0f 10 45 28              	movss	0x28(%rbp), %xmm0
1454ca01a: f3 0f 11 87 4c 01 00 00     	movss	%xmm0, 0x14c(%rdi)
1454ca022: 0f 10 87 b0 00 00 00        	movups	0xb0(%rdi), %xmm0
