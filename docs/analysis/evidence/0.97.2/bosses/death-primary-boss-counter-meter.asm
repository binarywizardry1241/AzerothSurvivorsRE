
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c44dd:     	movl	0x654(%rsi), %eax
1454c44e3:     	cmpl	$0x2, %eax
1454c44e6:     	sete	%dl
1454c44e9:     	orb	%dl, %al
1454c44eb:     	testb	$0x1, %al
1454c44ed:     	jne	0x1454c4509 <.text+0x54c3509>
1454c44ef:     	movss	0x8e4(%rsi), %xmm0
1454c44f7:     	movl	$0x1, 0x654(%rsi)
1454c4501:     	movss	%xmm0, 0x658(%rsi)
1454c4509:     	incl	0x668(%rsi)
