
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a5c33:     	movl	%r14d, %eax
1454a5c36:     	xorps	%xmm0, %xmm0
1454a5c39:     	cvtsi2ss	%rax, %xmm0
1454a5c3e:     	movq	0x368(%rbp), %rsi
1454a5c45:     	mulss	0x488(%rsi), %xmm0
1454a5c4d:     	callq	0x145756e1f <.text+0x5755e1f>
1454a5c52:     	cvttss2si	%xmm0, %rax
1454a5c57:     	ucomiss	%xmm7, %xmm0
1454a5c5a:     	movl	$0x0, %ecx
1454a5c5f:     	cmovbl	%ecx, %eax
1454a5c62:     	ucomiss	%xmm13, %xmm0
1454a5c66:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454a5c6b:     	cmoval	%ecx, %eax
1454a5c6e:     	movl	0x408(%rsi), %ecx
1454a5c74:     	addl	%eax, %ecx
1454a5c76:     	movl	%ecx, 0x408(%rsi)
1454a5c7c:     	addl	%eax, 0x66c(%rsi)
