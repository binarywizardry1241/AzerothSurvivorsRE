
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454bfdff:     	movq	0x160(%rbp), %rdx
1454bfe06:     	testq	%rdx, %rdx
1454bfe09:     	je	0x1454bfe21 <.text+0x54bee21>
1454bfe0b:     	movq	0x168(%rbp), %rcx
1454bfe12:     	shlq	$0x3, %rdx
1454bfe16:     	movl	$0x8, %r8d
1454bfe1c:     	callq	0x1400021d0 <.text+0x11d0>
1454bfe21:     	movl	$0x0, 0x20(%rsp)
1454bfe29:     	leaq	0x150(%rbp), %rcx
1454bfe30:     	movss	0x47e45c(%rip), %xmm2   # 0x14593e294
1454bfe38:     	movss	0x473e10(%rip), %xmm3   # 0x145933c50
1454bfe40:     	movq	%rsi, %rdx
1454bfe43:     	callq	0x1454c17b0 <.text+0x54c07b0>
