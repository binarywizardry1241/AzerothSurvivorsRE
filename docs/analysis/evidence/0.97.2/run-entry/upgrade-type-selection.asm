
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454df562:     	movq	%r13, 0x1f8(%rbp)
1454df569:     	movq	0x18(%r8), %rcx
1454df56d:     	movq	0x2a0(%r14), %rdx
1454df574:     	cmpq	%rdx, %rcx
1454df577:     	jae	0x1454e09b1 <.text+0x54df9b1>
1454df57d:     	leaq	0x458(%r14), %rax
1454df584:     	movq	0x298(%r14), %r8
1454df58b:     	movq	%rcx, 0x220(%rbp)
1454df592:     	imulq	$0x58, %rcx, %rdx
1454df596:     	leaq	(%r8,%rdx), %rdi
1454df59a:     	movq	%rbx, 0xe0(%rbp)
1454df5a1:     	movq	(%r8,%rdx), %rcx
1454df5a5:     	movq	0x30(%rcx), %rdx
1454df5a9:     	movq	0x38(%rcx), %r8
1454df5ad:     	addq	%rdx, %r8
1454df5b0:     	movq	%rdx, 0x168(%rbp)
1454df5b7:     	movq	%r8, 0x170(%rbp)
1454df5be:     	movq	%rcx, 0x178(%rbp)
1454df5c5:     	movq	%rdi, 0x180(%rbp)
1454df5cc:     	movq	%rax, 0x188(%rbp)
1454df5d3:     	movq	%rdi, 0x190(%rbp)
1454df5da:     	movq	%rax, 0x198(%rbp)
1454df5e1:     	leaq	0xe0(%rbp), %rax
1454df5e8:     	movq	%rax, 0x1a0(%rbp)
1454df5ef:     	movq	%rdi, 0x1a8(%rbp)
1454df5f6:     	movq	%rax, 0x1b0(%rbp)
1454df5fd:     	movb	$0x1, 0x247(%rbp)
1454df604:     	leaq	0x138(%rbp), %rcx
1454df60b:     	leaq	0x168(%rbp), %rdx
1454df612:     	callq	0x1455292b0 <.text+0x55282b0>
1454df617:     	nop
1454df618:     	movq	0x140(%rbp), %rcx
1454df61f:     	movq	0x148(%rbp), %rsi
1454df626:     	addq	$0x880, %r14            # imm = 0x880
1454df62d:     	movq	%rcx, 0x200(%rbp)
1454df634:     	movq	%rsi, %rdx
1454df637:     	movq	%r14, %r8
1454df63a:     	callq	0x14540ca10 <.text+0x540ba10>
1454df63f:     	nop
1454df640:     	cmpq	$0x4, 0x158(%rbp)
1454df648:     	movl	$0x1, %eax
1454df64d:     	sbbq	$-0x1, %rax
1454df651:     	cmpq	%rsi, %rax
1454df654:     	ja	0x1454df660 <.text+0x54de660>
1454df656:     	movq	%rax, 0x148(%rbp)
1454df65d:     	movq	%rax, %rsi
1454df660:     	movq	0x200(%rbp), %rax
1454df667:     	addq	%rax, %rsi
1454df66a:     	movq	%rax, 0x168(%rbp)
1454df671:     	movq	%rsi, 0x170(%rbp)
