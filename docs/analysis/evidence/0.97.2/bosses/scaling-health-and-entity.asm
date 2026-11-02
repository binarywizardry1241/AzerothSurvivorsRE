
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bf2cc:     	movq	0x210(%rsi), %rcx
1454bf2d3:     	movq	0x218(%rsi), %rdx
1454bf2da:     	callq	0x14540e820 <.text+0x540d820>
1454bf2df:     	imulq	$0xf0, %rax, %rax
1454bf2e6:     	addq	%rax, %rdi
1454bf2e9:     	xorps	%xmm6, %xmm6
1454bf2ec:     	cmpl	$0x1, 0x858(%rsi)
1454bf2f3:     	jne	0x1454bf31e <.text+0x54be31e>
1454bf2f5:     	cmpb	$0x0, 0x952(%rsi)
1454bf2fc:     	je	0x1454bf31e <.text+0x54be31e>
1454bf2fe:     	movss	0x8e4(%rsi), %xmm6
1454bf306:     	subss	0x85c(%rsi), %xmm6
1454bf30e:     	divss	0x471bea(%rip), %xmm6   # 0x145930f00
1454bf316:     	pxor	%xmm0, %xmm0
1454bf31a:     	maxss	%xmm0, %xmm6
1454bf31e:     	movzwl	0x232(%rsi), %ebx
1454bf325:     	movd	0x234(%rsi), %xmm8
1454bf32e:     	movss	0x44(%r13), %xmm7
1454bf334:     	mulss	0x14eb1f4(%rip), %xmm7  # 0x1469aa530
1454bf33c:     	movss	0xe0(%rdi), %xmm10
1454bf345:     	mulss	%xmm10, %xmm7
1454bf34a:     	mulss	0x944(%rsi), %xmm7
1454bf352:     	movss	0x14eb1da(%rip), %xmm0  # 0x1469aa534
1454bf35a:     	movaps	%xmm6, %xmm1
1454bf35d:     	callq	0x145756e73 <.text+0x5755e73>
1454bf362:     	mulss	%xmm7, %xmm0
1454bf366:     	xorps	%xmm7, %xmm7
1454bf369:     	cvtsi2ss	%ebx, %xmm7
1454bf36d:     	divss	0x42c1b7(%rip), %xmm7   # 0x1458eb52c
1454bf375:     	mulss	%xmm0, %xmm7
1454bf379:     	movl	0x30(%r13), %r8d
1454bf37d:     	movl	0x904(%rsi), %eax
1454bf383:     	incl	%eax
1454bf385:     	movl	%eax, 0x904(%rsi)
1454bf38b:     	movl	%r8d, %ecx
1454bf38e:     	andl	$0xffffff, %ecx         # imm = 0xFFFFFF
1454bf394:     	shlq	$0x18, %rcx
1454bf398:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454bf39d:     	orq	%rcx, %rax
1454bf3a0:     	movabsq	$-0xed0000000000000, %rbx # imm = 0xF130000000000000
1454bf3aa:     	orq	%rax, %rbx
1454bf3ad:     	movl	0x34(%r13), %r9d
1454bf3b1:     	movss	0x38(%r13), %xmm9
1454bf3b7:     	leaq	0x150(%rbp), %rax
1454bf3be:     	movq	%rax, 0x38(%rsp)
1454bf3c3:     	movss	%xmm7, 0x28(%rsp)
1454bf3c9:     	movss	%xmm9, 0x20(%rsp)
1454bf3d0:     	movb	$0x1, 0x30(%rsp)
1454bf3d5:     	movq	%rsi, %rcx
1454bf3d8:     	movq	%rbx, %rdx
1454bf3db:     	callq	0x1454c0820 <.text+0x54bf820>
