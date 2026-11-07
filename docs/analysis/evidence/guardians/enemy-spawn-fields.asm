
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c24f8:     	movss	0x28(%r15), %xmm0
1454c24fe:     	movl	0x24(%r15), %r9d
1454c2502:     	movzbl	0x4c(%r15), %eax
1454c2507:     	leaq	0x138(%rbp), %rcx
1454c250e:     	movq	%rcx, 0x38(%rsp)
1454c2513:     	movb	%al, 0x30(%rsp)
1454c2517:     	movss	%xmm0, 0x20(%rsp)
1454c251d:     	movss	%xmm12, 0x28(%rsp)
1454c2524:     	movq	%rsi, %rcx
1454c2527:     	movq	%rbx, %rdx
1454c252a:     	callq	0x1454c0820 <.text+0x54bf820>
1454c252f:     	movss	0x8e4(%rsi), %xmm6
1454c2537:     	movss	0x28(%r15), %xmm8
1454c253d:     	movss	0x38(%r15), %xmm9
1454c2543:     	movss	0x43a8a0(%rip), %xmm10  # 0x1458fcdec
1454c254c:     	mulss	%xmm8, %xmm10
1454c2551:     	addss	0x54f17e(%rip), %xmm10  # 0x145a116d8
1454c255a:     	movss	0x428f26(%rip), %xmm7   # 0x1458eb488
1454c2562:     	mulss	%xmm9, %xmm7
1454c2567:     	movzwl	0x144(%rbp), %eax
1454c256e:     	xorps	%xmm14, %xmm14
1454c2572:     	cvtsi2ss	%eax, %xmm14
1454c2577:     	divss	0x428fac(%rip), %xmm14  # 0x1458eb52c
1454c2580:     	mulss	0x56800f(%rip), %xmm14  # 0x145a2a598
1454c2589:     	movzbl	0x4c(%r15), %r14d
1454c258e:     	mulss	0x3c(%r15), %xmm14
