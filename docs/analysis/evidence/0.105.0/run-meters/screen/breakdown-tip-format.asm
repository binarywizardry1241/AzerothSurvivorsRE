
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401d6085:     	movq	%rsi, 0xe0(%rsp)
1401d608d:     	movq	0xd8(%rsp), %rax
1401d6095:     	movq	(%rax), %rbp
1401d6098:     	movsd	0x18(%rsi), %xmm0
1401d609d:     	mulsd	%xmm8, %xmm0
1401d60a2:     	movsd	%xmm0, 0xe8(%rsp)
1401d60ab:     	leaq	0xe0(%rsp), %rax
1401d60b3:     	movq	%rax, 0x40(%rsp)
1401d60b8:     	leaq	-0x14149f(%rip), %rax   # 0x140094c20 <.text+0x93c20>
1401d60bf:     	movq	%rax, 0x48(%rsp)
1401d60c4:     	movq	%rbx, 0x50(%rsp)
1401d60c9:     	leaq	0x59d7a40(%rip), %rax   # 0x145badb10 <.text+0x5bacb10>
1401d60d0:     	movq	%rax, 0x58(%rsp)
1401d60d5:     	leaq	0x28(%rsp), %rcx
1401d60da:     	leaq	0x5be52e3(%rip), %rdx   # 0x145dbb3c4
1401d60e1:     	movq	%r12, %r8
1401d60e4:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
