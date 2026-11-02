
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14596250c:     	movq	0x208(%rbp), %rcx
145962513:     	movq	0x8(%rcx), %rdx
145962517:     	movzbl	(%rdx), %ecx
14596251a:     	testl	%ecx, %ecx
14596251c:     	je	0x145962ba0 <.text+0x5961ba0>
145962522:     	cmpl	$0x1, %ecx
145962525:     	je	0x145962880 <.text+0x5961880>
14596252b:     	cmpl	$0x10, %ecx
14596252e:     	jne	0x145962c60 <.text+0x5961c60>
145962534:     	cmpq	$0x5, %rax
145962538:     	jb	0x145964a9d <.text+0x5963a9d>
14596253e:     	callq	0x140002200 <.text+0x1200>
145962543:     	movl	$0x5, %ecx
145962548:     	movl	$0x1, %edx
14596254d:     	callq	0x1400021c0 <.text+0x11c0>
145962552:     	testq	%rax, %rax
145962555:     	je	0x145964b50 <.text+0x5963b50>
14596255b:     	movq	0x208(%rbp), %rdx
145962562:     	movq	0x40(%rdx), %rcx
145962566:     	movl	$0x0, (%rax)
14596256c:     	movb	%cl, 0x4(%rax)
14596256f:     	movq	$0x5, 0x210(%rbp)
14596257a:     	movq	%rax, 0x218(%rbp)
145962581:     	movq	$0x5, 0x220(%rbp)
14596258c:     	movq	0x38(%rdx), %rdi
145962590:     	imulq	$0x38, %rcx, %r12
145962594:     	addq	%rdi, %r12
145962597:     	movl	$0x5, %esi
14596259c:     	xorl	%r15d, %r15d
14596259f:     	jmp	0x1459625ce <.text+0x59615ce>
1459625a1:     	nopw	%cs:(%rax,%rax)
1459625b0:     	addq	$0x38, %rdi
1459625b4:     	incb	%r15b
1459625b7:     	movq	0x218(%rbp), %rax
1459625be:     	movb	%r15b, 0x6(%rax,%rsi)
1459625c3:     	addq	$0x7, %rsi
1459625c7:     	movq	%rsi, 0x220(%rbp)
1459625ce:     	cmpq	%r12, %rdi
1459625d1:     	je	0x145962c70 <.text+0x5961c70>
1459625d7:     	movq	0x210(%rbp), %rax
1459625de:     	subq	%rsi, %rax
1459625e1:     	cmpq	$0x3, %rax
1459625e5:     	jbe	0x1459627c3 <.text+0x59617c3>
1459625eb:     	movq	0x218(%rbp), %rax
1459625f2:     	movl	$0x1, (%rax,%rsi)
1459625f9:     	movq	0x220(%rbp), %rsi
145962600:     	leaq	0x4(%rsi), %rax
145962604:     	movq	%rax, 0x220(%rbp)
14596260b:     	cmpq	0x210(%rbp), %rax
145962612:     	jne	0x14596261d <.text+0x596161d>
145962614:     	movq	%r14, %rcx
145962617:     	callq	0x145d69340 <.text+0x5d68340>
14596261c:     	nop
14596261d:     	movq	0x218(%rbp), %rax
145962624:     	movb	$0x0, 0x4(%rax,%rsi)
145962629:     	addq	$0x5, %rsi
14596262d:     	movq	%rsi, 0x220(%rbp)
145962634:     	movq	0x8(%rdi), %r13
145962638:     	movq	0x10(%rdi), %rbx
14596263c:     	movq	0x210(%rbp), %rax
145962643:     	movq	%rax, %rcx
145962646:     	subq	%rsi, %rcx
145962649:     	cmpq	%rcx, %rbx
14596264c:     	ja	0x1459627f0 <.text+0x59617f0>
145962652:     	testq	%rbx, %rbx
145962655:     	je	0x14596267a <.text+0x596167a>
145962657:     	addq	0x218(%rbp), %rsi
14596265e:     	movq	%rsi, %rcx
145962661:     	movq	%r13, %rdx
145962664:     	movq	%rbx, %r8
145962667:     	callq	0x145bc977b <.text+0x5bc877b>
14596266c:     	movq	0x210(%rbp), %rax
145962673:     	movq	0x220(%rbp), %rsi
14596267a:     	addq	%rbx, %rsi
14596267d:     	movq	%rsi, 0x220(%rbp)
145962684:     	cmpq	%rax, %rsi
145962687:     	jne	0x145962692 <.text+0x5961692>
145962689:     	movq	%r14, %rcx
14596268c:     	callq	0x145d69340 <.text+0x5d68340>
145962691:     	nop
145962692:     	movq	0x218(%rbp), %rax
145962699:     	movb	$0x0, (%rax,%rsi)
14596269d:     	incq	%rsi
1459626a0:     	movq	%rsi, 0x220(%rbp)
1459626a7:     	movq	0x20(%rdi), %r13
1459626ab:     	movq	0x28(%rdi), %rbx
1459626af:     	movq	0x210(%rbp), %rax
1459626b6:     	movq	%rax, %rcx
1459626b9:     	subq	%rsi, %rcx
1459626bc:     	cmpq	%rcx, %rbx
1459626bf:     	ja	0x14596281a <.text+0x596181a>
1459626c5:     	testq	%rbx, %rbx
1459626c8:     	je	0x1459626ed <.text+0x59616ed>
1459626ca:     	addq	0x218(%rbp), %rsi
1459626d1:     	movq	%rsi, %rcx
1459626d4:     	movq	%r13, %rdx
1459626d7:     	movq	%rbx, %r8
1459626da:     	callq	0x145bc977b <.text+0x5bc877b>
1459626df:     	movq	0x210(%rbp), %rax
1459626e6:     	movq	0x220(%rbp), %rsi
1459626ed:     	addq	%rbx, %rsi
1459626f0:     	movq	%rsi, 0x220(%rbp)
1459626f7:     	cmpq	%rax, %rsi
1459626fa:     	jne	0x145962705 <.text+0x5961705>
1459626fc:     	movq	%r14, %rcx
1459626ff:     	callq	0x145d69340 <.text+0x5d68340>
145962704:     	nop
145962705:     	movq	0x218(%rbp), %rax
14596270c:     	movb	$0x0, (%rax,%rsi)
145962710:     	incq	%rsi
145962713:     	movq	%rsi, 0x220(%rbp)
14596271a:     	movd	0x30(%rdi), %xmm14
145962720:     	movq	0x210(%rbp), %rax
145962727:     	subq	%rsi, %rax
14596272a:     	cmpq	$0x3, %rax
14596272e:     	jbe	0x145962844 <.text+0x5961844>
145962734:     	movq	0x218(%rbp), %rax
14596273b:     	movd	%xmm14, (%rax,%rsi)
145962741:     	movq	0x220(%rbp), %rsi
145962748:     	leaq	0x4(%rsi), %rax
14596274c:     	movq	%rax, 0x220(%rbp)
145962753:     	movzbl	0x34(%rdi), %ebx
145962757:     	cmpq	0x210(%rbp), %rax
14596275e:     	jne	0x145962769 <.text+0x5961769>
145962760:     	movq	%r14, %rcx
145962763:     	callq	0x145d69340 <.text+0x5d68340>
145962768:     	nop
145962769:     	movq	0x218(%rbp), %rax
145962770:     	movb	%bl, 0x4(%rax,%rsi)
145962774:     	leaq	0x5(%rsi), %rax
145962778:     	movq	%rax, 0x220(%rbp)
14596277f:     	cmpq	0x210(%rbp), %rax
145962786:     	jne	0x145962791 <.text+0x5961791>
145962788:     	movq	%r14, %rcx
14596278b:     	callq	0x145d69340 <.text+0x5d68340>
145962790:     	nop
145962791:     	movq	0x218(%rbp), %rax
145962798:     	movb	$0x1, 0x5(%rax,%rsi)
14596279d:     	leaq	0x6(%rsi), %rax
1459627a1:     	movq	%rax, 0x220(%rbp)
1459627a8:     	cmpq	0x210(%rbp), %rax
1459627af:     	jne	0x1459625b0 <.text+0x59615b0>
1459627b5:     	movq	%r14, %rcx
1459627b8:     	callq	0x145d69340 <.text+0x5d68340>
1459627bd:     	nop
1459627be:     	jmp	0x1459625b0 <.text+0x59615b0>
1459627c3:     	movq	$0x1, 0x20(%rsp)
1459627cc:     	movl	$0x4, %r8d
1459627d2:     	movl	$0x1, %r9d
1459627d8:     	movq	%r14, %rcx
1459627db:     	movq	%rsi, %rdx
1459627de:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459627e3:     	nop
1459627e4:     	movq	0x220(%rbp), %rsi
1459627eb:     	jmp	0x1459625eb <.text+0x59615eb>
1459627f0:     	movq	$0x1, 0x20(%rsp)
1459627f9:     	movl	$0x1, %r9d
1459627ff:     	movq	%r14, %rcx
145962802:     	movq	%rsi, %rdx
145962805:     	movq	%rbx, %r8
145962808:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14596280d:     	nop
14596280e:     	movq	0x220(%rbp), %rsi
145962815:     	jmp	0x145962657 <.text+0x5961657>
14596281a:     	movq	$0x1, 0x20(%rsp)
145962823:     	movl	$0x1, %r9d
145962829:     	movq	%r14, %rcx
14596282c:     	movq	%rsi, %rdx
14596282f:     	movq	%rbx, %r8
145962832:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
145962837:     	nop
145962838:     	movq	0x220(%rbp), %rsi
14596283f:     	jmp	0x1459626ca <.text+0x59616ca>
145962844:     	movq	$0x1, 0x20(%rsp)
14596284d:     	movl	$0x4, %r8d
145962853:     	movl	$0x1, %r9d
145962859:     	movq	%r14, %rcx
14596285c:     	movq	%rsi, %rdx
14596285f:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
145962864:     	nop
145962865:     	movq	0x220(%rbp), %rsi
14596286c:     	jmp	0x145962734 <.text+0x5961734>
