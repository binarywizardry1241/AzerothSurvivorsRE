
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145935728:     	movl	0x704(%rdi), %eax
14593572e:     	cmpl	$0x2, %eax
145935731:     	sete	%cl
145935734:     	orb	%cl, %al
145935736:     	testb	$0x1, %al
145935738:     	jne	0x145935754 <.text+0x5934754>
14593573a:     	movss	0x9ec(%rdi), %xmm0
145935742:     	movl	$0x1, 0x704(%rdi)
14593574c:     	movss	%xmm0, 0x708(%rdi)
