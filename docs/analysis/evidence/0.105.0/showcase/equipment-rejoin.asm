
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145935cf4:     	movb	$0x0, 0x187(%rbp)
145935cfb:     	movq	%rdi, %rcx
145935cfe:     	callq	0x145943bb0 <.text+0x5942bb0>
145935d03:     	nop
145935d04:     	cmpb	$0x1, 0x54(%r12)
145935d0a:     	movq	0x170(%rbp), %rsi
145935d11:     	jne	0x145935f9e <.text+0x5934f9e>
145935d17:     	cmpb	$0x0, 0x928(%rdi)
145935d1e:     	jne	0x145935f9e <.text+0x5934f9e>
145935d24:     	movl	$0x1, 0x928(%rdi)
145935d2e:     	movss	%xmm8, 0x92c(%rdi)
