
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1406cc6e0:     	pushq	%rsi
1406cc6e1:     	subq	$0x20, %rsp
1406cc6e5:     	movl	0x72d2e5d(%rip), %eax   # 0x14799f548
1406cc6eb:     	testl	%eax, %eax
1406cc6ed:     	jne	0x1406cc73a <.text+0x6cb73a>
1406cc6ef:     	movb	$0x1, %cl
1406cc6f1:     	xorl	%eax, %eax
1406cc6f3:     	lock
1406cc6f4:     	cmpxchgb	%cl, 0x72d2e1d(%rip)    # 0x14799f518
1406cc6fb:     	jne	0x1406cc754 <.text+0x6cb754>
1406cc6fd:     	movq	0x731a6a4(%rip), %rsi   # 0x1479e6da8
1406cc704:     	movq	(%rsi), %rax
1406cc707:     	shlq	%rax
1406cc70a:     	testq	%rax, %rax
1406cc70d:     	jne	0x1406cc762 <.text+0x6cb762>
1406cc70f:     	movzbl	0x72d2e03(%rip), %eax   # 0x14799f519
1406cc716:     	movl	0x72d2e00(%rip), %eax   # 0x14799f51c
1406cc71c:     	movq	(%rsi), %rcx
1406cc71f:     	shlq	%rcx
1406cc722:     	testq	%rcx, %rcx
1406cc725:     	jne	0x1406cc792 <.text+0x6cb792>
1406cc727:     	xorl	%ecx, %ecx
1406cc729:     	xchgb	%cl, 0x72d2de9(%rip)    # 0x14799f518
1406cc72f:     	cmpb	$0x2, %cl
1406cc732:     	je	0x1406cc77c <.text+0x6cb77c>
1406cc734:     	addq	$0x20, %rsp
1406cc738:     	popq	%rsi
1406cc739:     	retq
1406cc73a:     	leaq	0x72d2dd7(%rip), %rcx   # 0x14799f518
1406cc741:     	callq	0x145762bb1 <.text+0x5761bb1>
1406cc746:     	movb	$0x1, %cl
1406cc748:     	xorl	%eax, %eax
1406cc74a:     	lock
1406cc74b:     	cmpxchgb	%cl, 0x72d2dc6(%rip)    # 0x14799f518
1406cc752:     	je	0x1406cc6fd <.text+0x6cb6fd>
1406cc754:     	leaq	0x72d2dbd(%rip), %rcx   # 0x14799f518
1406cc75b:     	callq	0x1458e58c0 <.text+0x58e48c0>
1406cc760:     	jmp	0x1406cc6fd <.text+0x6cb6fd>
1406cc762:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc767:     	movl	%eax, %ecx
1406cc769:     	movzbl	0x72d2da9(%rip), %eax   # 0x14799f519
1406cc770:     	movl	0x72d2da6(%rip), %eax   # 0x14799f51c
1406cc776:     	testb	%cl, %cl
1406cc778:     	jne	0x1406cc71c <.text+0x6cb71c>
1406cc77a:     	jmp	0x1406cc727 <.text+0x6cb727>
1406cc77c:     	leaq	0x72d2d95(%rip), %rcx   # 0x14799f518
1406cc783:     	movl	%eax, %esi
1406cc785:     	callq	0x1458e5980 <.text+0x58e4980>
1406cc78a:     	movl	%esi, %eax
1406cc78c:     	addq	$0x20, %rsp
1406cc790:     	popq	%rsi
1406cc791:     	retq
1406cc792:     	movl	%eax, %esi
1406cc794:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc799:     	testb	%al, %al
1406cc79b:     	jne	0x1406cc7a4 <.text+0x6cb7a4>
1406cc79d:     	movb	$0x1, 0x72d2d75(%rip)   # 0x14799f519
1406cc7a4:     	movl	%esi, %eax
1406cc7a6:     	jmp	0x1406cc727 <.text+0x6cb727>
