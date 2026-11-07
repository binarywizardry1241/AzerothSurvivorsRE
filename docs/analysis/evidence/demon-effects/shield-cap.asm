
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145904b3a:     	movq	0x378(%rbp), %r13
145904b41:     	movss	0x478(%r13), %xmm0
145904b4a:     	mulss	0x46f1f2(%rip), %xmm0   # 0x145d73d44
145904b52:     	movss	0x190(%r13), %xmm1
145904b5b:     	ucomiss	%xmm0, %xmm1
145904b5e:     	jbe	0x145904b8a <.text+0x5903b8a>
145904b60:     	subss	%xmm0, %xmm1
145904b64:     	movss	%xmm0, 0x190(%r13)
145904b6d:     	movss	0x4e4(%r13), %xmm0
145904b76:     	subss	%xmm1, %xmm0
145904b7a:     	xorps	%xmm1, %xmm1
145904b7d:     	maxss	%xmm1, %xmm0
145904b81:     	movss	%xmm0, 0x4e4(%r13)
