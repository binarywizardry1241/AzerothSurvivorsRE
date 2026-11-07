
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454efa30:     	movq	%rdx, %rdi
1454efa33:     	movq	%rcx, %rsi
1454efa36:     	movq	0x210(%rcx), %rcx
1454efa3d:     	movq	0x218(%rsi), %rdx
1454efa44:     	callq	0x14540e820 <.text+0x540d820>
1454efa49:     	imulq	$0xf0, %rax, %r14
1454efa50:     	leaq	0x12269e1(%rip), %rbx   # 0x146716438
1454efa57:     	movss	0x8e4(%rsi), %xmm6
1454efa5f:     	movaps	%xmm6, %xmm9
1454efa63:     	divss	0x441494(%rip), %xmm9   # 0x145930f00
1454efa6c:     	movss	0x944(%rsi), %xmm10
1454efa75:     	movss	0xe0(%r14,%rbx), %xmm8
1454efa7f:     	movq	0x88(%r14,%rbx), %rdx
1454efa87:     	leaq	0x1b8(%rdx), %r8
1454efa8e:     	leaq	-0x58(%rbp), %rcx
1454efa92:     	callq	0x14552b760 <.text+0x552a760>
