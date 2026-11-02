
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454da624:     	movb	%r8b, 0x136(%rbp)
1454da62b:     	movq	%rcx, %rsi
1454da62e:     	movb	%dl, 0x137(%rbp)
1454da634:     	movzbl	%dl, %ecx
1454da637:     	testb	%cl, %cl
1454da639:     	movq	%rsi, 0x140(%rbp)
1454da640:     	movq	%rcx, -0x50(%rbp)
1454da644:     	je	0x1454da654 <.text+0x54d9654>
1454da646:     	cmpl	$0x1, %ecx
1454da649:     	jne	0x1454da671 <.text+0x54d9671>
1454da64b:     	leaq	-0x10(%rbp), %rcx
1454da64f:     	xorps	%xmm2, %xmm2
1454da652:     	jmp	0x1454da67d <.text+0x54d967d>
1454da654:     	movzbl	0x284(%rsi), %eax
1454da65b:     	addb	$-0x2, %al
1454da65d:     	cmpb	$0x9, %al
1454da65f:     	ja	0x1454da68a <.text+0x54d968a>
1454da661:     	movzbl	%al, %eax
1454da664:     	leaq	0x14d23bd(%rip), %rcx   # 0x1469aca28
1454da66b:     	movq	(%rcx,%rax,8), %rdi
1454da66f:     	jmp	0x1454da691 <.text+0x54d9691>
1454da671:     	leaq	-0x10(%rbp), %rcx
1454da675:     	movss	0x412993(%rip), %xmm2   # 0x1458ed010
1454da67d:     	movq	%rsi, %rdx
1454da680:     	callq	0x1454e1d00 <.text+0x54e0d00>
1454da685:     	jmp	0x1454db131 <.text+0x54da131>
