
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c16a0:     	pushq	%rsi
1454c16a1:     	pushq	%rdi
1454c16a2:     	pushq	%rbx
1454c16a3:     	subq	$0x30, %rsp
1454c16a7:     	movq	0x688(%rcx), %rdi
1454c16ae:     	testq	%rdi, %rdi
1454c16b1:     	je	0x1454c179e <.text+0x54c079e>
1454c16b7:     	movq	0x680(%rcx), %rax
1454c16be:     	movss	(%rax), %xmm0
1454c16c2:     	ucomiss	0x8e4(%rcx), %xmm0
1454c16c9:     	ja	0x1454c179e <.text+0x54c079e>
1454c16cf:     	movq	0x898(%rcx), %r8
1454c16d6:     	movq	0x880(%rcx), %r9
1454c16dd:     	movq	0x888(%rcx), %r10
1454c16e4:     	leaq	(%r8,%r9), %r11
1454c16e8:     	rolq	$0x17, %r11
1454c16ec:     	addq	%r9, %r11
1454c16ef:     	movq	%r10, %rsi
1454c16f2:     	shlq	$0x11, %rsi
1454c16f6:     	movq	0x890(%rcx), %rbx
1454c16fd:     	xorq	%r9, %rbx
1454c1700:     	xorq	%r10, %r8
1454c1703:     	xorq	%rbx, %r10
1454c1706:     	movq	%r10, 0x888(%rcx)
1454c170d:     	xorq	%r8, %r9
1454c1710:     	movq	%r9, 0x880(%rcx)
1454c1717:     	xorq	%rsi, %rbx
1454c171a:     	movq	%rbx, 0x890(%rcx)
1454c1721:     	shrq	$0x28, %r11
1454c1725:     	xorps	%xmm0, %xmm0
1454c1728:     	cvtsi2ss	%r11d, %xmm0
1454c172d:     	rolq	$0x2d, %r8
1454c1731:     	mulss	0x529c87(%rip), %xmm0   # 0x1459eb3c0
1454c1739:     	movq	%r8, 0x898(%rcx)
1454c1740:     	ucomiss	0x429d41(%rip), %xmm0   # 0x1458eb488
1454c1747:     	jae	0x1454c179e <.text+0x54c079e>
1454c1749:     	leaq	0x8(%rax), %r9
1454c174d:     	leaq	-0x8(,%rdi,8), %r8
1454c1755:     	decq	%rdi
1454c1758:     	movq	%rcx, %rsi
1454c175b:     	movq	%rax, %rcx
1454c175e:     	movq	%rdx, %rbx
1454c1761:     	movq	%r9, %rdx
1454c1764:     	callq	0x145756dd1 <.text+0x5755dd1>
1454c1769:     	movq	%rdi, 0x688(%rsi)
1454c1770:     	movss	0x8(%rbx), %xmm0
1454c1775:     	movsd	(%rbx), %xmm1
1454c1779:     	addps	0x14e8de0(%rip), %xmm1  # 0x1469aa560
1454c1780:     	movlps	%xmm1, 0x20(%rsp)
1454c1785:     	movss	%xmm0, 0x28(%rsp)
1454c178b:     	leaq	0x20(%rsp), %r9
1454c1790:     	movq	%rsi, %rcx
1454c1793:     	movl	$0x6, %edx
1454c1798:     	callq	0x1454c8110 <.text+0x54c7110>
1454c179d:     	nop
1454c179e:     	addq	$0x30, %rsp
1454c17a2:     	popq	%rbx
1454c17a3:     	popq	%rdi
1454c17a4:     	popq	%rsi
1454c17a5:     	retq
