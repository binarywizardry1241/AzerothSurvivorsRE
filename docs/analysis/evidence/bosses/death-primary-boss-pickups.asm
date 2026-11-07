
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c46d9:     	movl	0x668(%rsi), %eax
1454c46df:     	leal	(%rax,%rax,4), %eax
1454c46e2:     	leal	0x3c(,%rax,4), %r8d
1454c46ea:     	movb	$0x0, 0x177(%rbp)
1454c46f1:     	leaq	0x158(%rbp), %r9
1454c46f8:     	movq	%rsi, %rcx
1454c46fb:     	xorl	%edx, %edx
1454c46fd:     	callq	0x1454c8110 <.text+0x54c7110>
1454c4702:     	nop
1454c4703:     	movl	0x668(%rsi), %eax
1454c4709:     	leal	(%rax,%rax,4), %eax
1454c470c:     	leal	0x28(,%rax,4), %r8d
1454c4714:     	movsd	0x158(%rbp), %xmm12
1454c471d:     	movss	0x160(%rbp), %xmm7
1454c4725:     	movsd	0x14e5e63(%rip), %xmm0  # 0x1469aa590
1454c472d:     	addps	%xmm12, %xmm0
1454c4731:     	movlps	%xmm0, 0xf0(%rbp)
1454c4738:     	movss	%xmm7, 0xf8(%rbp)
1454c4740:     	movb	$0x0, 0x177(%rbp)
1454c4747:     	leaq	0xf0(%rbp), %r9
1454c474e:     	movq	%rsi, %rcx
1454c4751:     	movl	$0x1, %edx
1454c4756:     	callq	0x1454c8110 <.text+0x54c7110>
1454c475b:     	nop
1454c475c:     	cmpq	$0x0, 0x688(%rsi)
1454c4764:     	je	0x1454c47cb <.text+0x54c37cb>
1454c4766:     	movq	0x680(%rsi), %rax
1454c476d:     	movss	(%rax), %xmm0
1454c4771:     	ucomiss	0x8e4(%rsi), %xmm0
1454c4778:     	ja	0x1454c47cb <.text+0x54c37cb>
1454c477a:     	leaq	0x678(%rsi), %rcx
1454c4781:     	movb	$0x0, 0x177(%rbp)
1454c4788:     	leaq	0x14e6e81(%rip), %r8    # 0x1469ab610
1454c478f:     	xorl	%edx, %edx
1454c4791:     	callq	0x1455259a0 <.text+0x55249a0>
1454c4796:     	nop
1454c4797:     	addps	0x14e5dc1(%rip), %xmm12 # 0x1469aa560
1454c479f:     	movlps	%xmm12, 0xf0(%rbp)
1454c47a7:     	movss	%xmm7, 0xf8(%rbp)
1454c47af:     	movb	$0x0, 0x177(%rbp)
1454c47b6:     	leaq	0xf0(%rbp), %r9
1454c47bd:     	movq	%rsi, %rcx
1454c47c0:     	movl	$0x6, %edx
1454c47c5:     	callq	0x1454c8110 <.text+0x54c7110>
1454c47ca:     	nop
