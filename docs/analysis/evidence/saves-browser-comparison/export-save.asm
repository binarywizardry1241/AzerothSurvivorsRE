
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543a660:     	pushq	%rbp
14543a661:     	pushq	%rsi
14543a662:     	pushq	%rdi
14543a663:     	subq	$0x220, %rsp            # imm = 0x220
14543a66a:     	leaq	0x80(%rsp), %rbp
14543a672:     	movq	$-0x2, 0x198(%rbp)
14543a67d:     	movq	%rcx, %rsi
14543a680:     	leaq	-0x58(%rbp), %rdi
14543a684:     	movq	%rdi, %rcx
14543a687:     	callq	0x14542f910 <.text+0x542e910>
14543a68c:     	nop
14543a68d:     	leaq	0x178(%rbp), %rcx
14543a694:     	movq	%rdi, %rdx
14543a697:     	callq	0x145436620 <.text+0x5435620>
14543a69c:     	nop
14543a69d:     	movq	0x180(%rbp), %rdx
14543a6a4:     	movq	0x188(%rbp), %r8
14543a6ab:     	movq	%rsi, %rcx
14543a6ae:     	movq	%rdx, 0x190(%rbp)
14543a6b5:     	callq	0x145515c90 <.text+0x5514c90>
14543a6ba:     	nop
14543a6bb:     	movq	0x178(%rbp), %rdx
14543a6c2:     	testq	%rdx, %rdx
14543a6c5:     	je	0x14543a6d9 <.text+0x54396d9>
14543a6c7:     	movl	$0x1, %r8d
14543a6cd:     	movq	0x190(%rbp), %rcx
14543a6d4:     	callq	0x1400021d0 <.text+0x11d0>
14543a6d9:     	leaq	-0x58(%rbp), %rcx
14543a6dd:     	callq	0x1400a96c0 <.text+0xa86c0>
14543a6e2:     	movq	%rsi, %rax
14543a6e5:     	addq	$0x220, %rsp            # imm = 0x220
14543a6ec:     	popq	%rdi
14543a6ed:     	popq	%rsi
14543a6ee:     	popq	%rbp
14543a6ef:     	retq
