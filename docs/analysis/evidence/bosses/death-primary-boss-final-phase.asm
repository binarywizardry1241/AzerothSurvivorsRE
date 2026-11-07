
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c4ab3:     	movb	$0x0, 0x177(%rbp)
1454c4aba:     	movq	%rsi, %rcx
1454c4abd:     	callq	0x1454d2380 <.text+0x54d1380>
1454c4ac2:     	nop
1454c4ac3:     	movq	0x150(%rbp), %rax
1454c4aca:     	cmpb	$0x1, 0x54(%rax)
1454c4ace:     	jne	0x1454c4d46 <.text+0x54c3d46>
1454c4ad4:     	cmpb	$0x0, 0x858(%rsi)
1454c4adb:     	jne	0x1454c4d46 <.text+0x54c3d46>
1454c4ae1:     	movl	$0x1, 0x858(%rsi)
1454c4aeb:     	movss	%xmm8, 0x85c(%rsi)
1454c4af4:     	jmp	0x1454c4d46 <.text+0x54c3d46>
