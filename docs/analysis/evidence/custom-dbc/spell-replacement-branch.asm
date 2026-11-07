AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458ba744:     	leaq	(%rax,%r15,8), %rax
1458ba748:     	movups	-0x40(%rax), %xmm0
1458ba74c:     	movups	-0x30(%rax), %xmm1
1458ba750:     	movups	-0x20(%rax), %xmm2
1458ba754:     	movups	-0x10(%rax), %xmm3
1458ba758:     	movups	%xmm3, 0x30(%rsi)
1458ba75c:     	movups	%xmm2, 0x20(%rsi)
1458ba760:     	movups	%xmm1, 0x10(%rsi)
1458ba764:     	movups	%xmm0, (%rsi)
1458ba767:     	movq	-0x8(%rbp), %rcx
1458ba76b:     	movups	(%rcx), %xmm0
1458ba76e:     	movups	0x10(%rcx), %xmm1
1458ba772:     	movups	0x20(%rcx), %xmm2
1458ba776:     	movups	0x30(%rcx), %xmm3
1458ba77a:     	movups	%xmm0, -0x40(%rax)
1458ba77e:     	movups	%xmm1, -0x30(%rax)
1458ba782:     	movups	%xmm2, -0x20(%rax)
1458ba786:     	movups	%xmm3, -0x10(%rax)
1458ba78a:     	jmp	0x1458ba834 <.text+0x58b9834>
