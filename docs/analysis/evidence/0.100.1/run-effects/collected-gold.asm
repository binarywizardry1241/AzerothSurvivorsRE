
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454b7a03:     	movl	%r14d, %eax
1454b7a06:     	xorps	%xmm0, %xmm0
1454b7a09:     	cvtsi2ss	%rax, %xmm0
1454b7a0e:     	movq	0x368(%rbp), %rsi
1454b7a15:     	mulss	0x4a0(%rsi), %xmm0
1454b7a1d:     	callq	0x14577322f <.text+0x577222f>
1454b7a22:     	cvttss2si	%xmm0, %rax
1454b7a27:     	ucomiss	%xmm7, %xmm0
1454b7a2a:     	movl	$0x0, %ecx
1454b7a2f:     	cmovbl	%ecx, %eax
1454b7a32:     	ucomiss	%xmm13, %xmm0
1454b7a36:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454b7a3b:     	cmoval	%ecx, %eax
1454b7a3e:     	movl	0x420(%rsi), %ecx
1454b7a44:     	addl	%eax, %ecx
1454b7a46:     	movl	%ecx, 0x420(%rsi)
1454b7a4c:     	addl	%eax, 0x684(%rsi)
