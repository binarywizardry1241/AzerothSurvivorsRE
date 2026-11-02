AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14595a52a:     	movq	%rsi, 0x58(%rbp)
14595a52e:     	leaq	0x125b263(%rip), %rax   # 0x146bb5798
14595a535:     	movq	%rax, 0x60(%rbp)
14595a539:     	leaq	0x125b7a8(%rip), %rax   # 0x146bb5ce8
14595a540:     	movq	%rax, 0x68(%rbp)
14595a544:     	leaq	0x58(%rbp), %rax
14595a548:     	movq	%rax, 0x70(%rbp)
14595a54c:     	movq	%r12, %rcx
14595a54f:     	movq	%rbx, %rdx
14595a552:     	callq	0x14599c360 <.text+0x599b360>
14595a557:     	nop
14595a558:     	cmpq	$0x4, 0x58(%rbp)
14595a55d:     	jne	0x14595a638 <.text+0x5959638>
14595a563:     	movq	0x318(%r14), %rdi
14595a56a:     	movq	0x320(%r14), %r12
14595a571:     	movq	0x170(%rbp), %rax
14595a578:     	movq	0x180(%rbp), %rdx
14595a57f:     	subq	%rdx, %rax
14595a582:     	cmpq	%rax, %r12
14595a585:     	ja	0x14595aa62 <.text+0x5959a62>
14595a58b:     	testq	%r12, %r12
14595a58e:     	je	0x14595a62a <.text+0x595962a>
14595a594:     	movq	0x178(%rbp), %rax
14595a59b:     	movq	%rdx, 0x1c0(%rbp)
14595a5a2:     	imulq	$0x70, %rdx, %rsi
14595a5a6:     	addq	%rax, %rsi
14595a5a9:     	negq	%r12
14595a5ac:     	xorl	%eax, %eax
14595a5ae:     	nop
14595a5b0:     	movq	%rax, 0x1d8(%rbp)
14595a5b7:     	movq	(%rdi), %rdx
14595a5ba:     	movq	%rbx, %rcx
14595a5bd:     	callq	0x14587b8e0 <.text+0x587a8e0>
14595a5c2:     	nop
14595a5c3:     	movups	0xc0(%rbp), %xmm0
14595a5ca:     	movups	%xmm0, 0x60(%rsi)
14595a5ce:     	movups	0xb0(%rbp), %xmm0
14595a5d5:     	movups	%xmm0, 0x50(%rsi)
14595a5d9:     	movups	0xa0(%rbp), %xmm0
14595a5e0:     	movups	%xmm0, 0x40(%rsi)
14595a5e4:     	movups	0x60(%rbp), %xmm0
14595a5e8:     	movups	0x70(%rbp), %xmm1
14595a5ec:     	movups	0x80(%rbp), %xmm2
14595a5f3:     	movups	0x90(%rbp), %xmm3
14595a5fa:     	movups	%xmm3, 0x30(%rsi)
14595a5fe:     	movups	%xmm2, 0x20(%rsi)
14595a602:     	movups	%xmm1, 0x10(%rsi)
14595a606:     	movups	%xmm0, (%rsi)
14595a609:     	movq	0x1d8(%rbp), %rax
14595a610:     	decq	%rax
14595a613:     	addq	$0x70, %rsi
14595a617:     	addq	$0x68, %rdi
14595a61b:     	cmpq	%rax, %r12
14595a61e:     	jne	0x14595a5b0 <.text+0x59595b0>
14595a620:     	movq	0x1c0(%rbp), %rdx
14595a627:     	subq	%rax, %rdx
14595a62a:     	movq	%rdx, 0x180(%rbp)
14595a631:     	leaq	0x170(%rbp), %r12
14595a638:     	movq	%r12, %rcx
14595a63b:     	leaq	0x108(%rbp), %rdx
14595a642:     	movq	0x160(%rbp), %r8
14595a649:     	callq	0x145995250 <.text+0x5994250>
14595a64e:     	nop
14595a64f:     	movq	0x180(%rbp), %r12
