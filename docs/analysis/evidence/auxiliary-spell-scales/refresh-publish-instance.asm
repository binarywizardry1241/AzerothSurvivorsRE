
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145928460:     	movq	0xb8(%rsi), %rax
145928467:     	imulq	$0x70, %r15, %rcx
14592846b:     	movq	0xe8(%rbp), %rdx
145928472:     	movq	%rdx, 0x60(%rax,%rcx)
145928477:     	movups	0xd8(%rbp), %xmm0
14592847e:     	movups	%xmm0, 0x50(%rax,%rcx)
145928483:     	movups	0xc8(%rbp), %xmm0
14592848a:     	movups	%xmm0, 0x40(%rax,%rcx)
14592848f:     	movups	0x88(%rbp), %xmm0
145928496:     	movups	0x98(%rbp), %xmm1
14592849d:     	movups	0xa8(%rbp), %xmm2
1459284a4:     	movups	0xb8(%rbp), %xmm3
1459284ab:     	movups	%xmm3, 0x30(%rax,%rcx)
1459284b0:     	movups	%xmm2, 0x20(%rax,%rcx)
1459284b5:     	movups	%xmm1, 0x10(%rax,%rcx)
1459284ba:     	movups	%xmm0, (%rax,%rcx)
1459284be:     	movss	%xmm11, 0x68(%rax,%rcx)
1459284c5:     	incq	%r15
1459284c8:     	movq	%r15, 0xc0(%rsi)
