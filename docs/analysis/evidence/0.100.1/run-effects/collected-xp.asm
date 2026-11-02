
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b7716:     	movl	%r14d, %eax
1454b7719:     	xorps	%xmm0, %xmm0
1454b771c:     	cvtsi2ss	%rax, %xmm0
1454b7721:     	movq	0x368(%rbp), %rsi
1454b7728:     	mulss	0x48c(%rsi), %xmm0
1454b7730:     	callq	0x14577322f <.text+0x577222f>
1454b7735:     	maxss	0x44fd53(%rip), %xmm0   # 0x145907490
1454b773d:     	cvttss2si	%xmm0, %rdx
1454b7742:     	ucomiss	%xmm7, %xmm0
1454b7745:     	movl	$0x0, %eax
1454b774a:     	cmovbl	%eax, %edx
1454b774d:     	ucomiss	%xmm13, %xmm0
1454b7751:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454b7756:     	cmoval	%eax, %edx
1454b7759:     	movq	%rsi, %rcx
1454b775c:     	callq	0x1454c69e0 <.text+0x54c59e0>
