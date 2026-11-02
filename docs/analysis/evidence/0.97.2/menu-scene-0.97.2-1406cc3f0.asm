
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1406cc3f0:     	pushq	%rsi
1406cc3f1:     	pushq	%rdi
1406cc3f2:     	subq	$0x28, %rsp
1406cc3f6:     	movl	0x72d314c(%rip), %eax   # 0x14799f548
1406cc3fc:     	testl	%eax, %eax
1406cc3fe:     	jne	0x1406cc475 <.text+0x6cb475>
1406cc400:     	movb	$0x1, %dl
1406cc402:     	xorl	%eax, %eax
1406cc404:     	lock
1406cc405:     	cmpxchgb	%dl, 0x72d310c(%rip)    # 0x14799f518
1406cc40c:     	jne	0x1406cc49c <.text+0x6cb49c>
1406cc412:     	movq	0x731a98f(%rip), %rsi   # 0x1479e6da8
1406cc419:     	movq	(%rsi), %rax
1406cc41c:     	shlq	%rax
1406cc41f:     	testq	%rax, %rax
1406cc422:     	jne	0x1406cc4b6 <.text+0x6cb4b6>
1406cc428:     	movzbl	0x72d30ea(%rip), %eax   # 0x14799f519
1406cc42f:     	movq	0x20(%rcx), %rax
1406cc433:     	movq	%rax, 0x72d3102(%rip)   # 0x14799f53c
1406cc43a:     	movups	(%rcx), %xmm0
1406cc43d:     	movups	0x10(%rcx), %xmm1
1406cc441:     	movups	%xmm1, 0x72d30e4(%rip)  # 0x14799f52c
1406cc448:     	movups	%xmm0, 0x72d30cd(%rip)  # 0x14799f51c
1406cc44f:     	movq	(%rsi), %rax
1406cc452:     	shlq	%rax
1406cc455:     	testq	%rax, %rax
1406cc458:     	jne	0x1406cc504 <.text+0x6cb504>
1406cc45e:     	xorl	%eax, %eax
1406cc460:     	xchgb	%al, 0x72d30b2(%rip)    # 0x14799f518
1406cc466:     	cmpb	$0x2, %al
1406cc468:     	je	0x1406cc4f2 <.text+0x6cb4f2>
1406cc46e:     	addq	$0x28, %rsp
1406cc472:     	popq	%rdi
1406cc473:     	popq	%rsi
1406cc474:     	retq
1406cc475:     	leaq	0x72d309c(%rip), %rax   # 0x14799f518
1406cc47c:     	movq	%rcx, %rsi
1406cc47f:     	movq	%rax, %rcx
1406cc482:     	callq	0x145762bb1 <.text+0x5761bb1>
1406cc487:     	movq	%rsi, %rcx
1406cc48a:     	movb	$0x1, %dl
1406cc48c:     	xorl	%eax, %eax
1406cc48e:     	lock
1406cc48f:     	cmpxchgb	%dl, 0x72d3082(%rip)    # 0x14799f518
1406cc496:     	je	0x1406cc412 <.text+0x6cb412>
1406cc49c:     	leaq	0x72d3075(%rip), %rax   # 0x14799f518
1406cc4a3:     	movq	%rcx, %rsi
1406cc4a6:     	movq	%rax, %rcx
1406cc4a9:     	callq	0x1458e58c0 <.text+0x58e48c0>
1406cc4ae:     	movq	%rsi, %rcx
1406cc4b1:     	jmp	0x1406cc412 <.text+0x6cb412>
1406cc4b6:     	movq	%rcx, %rdi
1406cc4b9:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc4be:     	movzbl	0x72d3054(%rip), %ecx   # 0x14799f519
1406cc4c5:     	movq	0x20(%rdi), %rcx
1406cc4c9:     	movq	%rcx, 0x72d306c(%rip)   # 0x14799f53c
1406cc4d0:     	movups	(%rdi), %xmm0
1406cc4d3:     	movups	0x10(%rdi), %xmm1
1406cc4d7:     	movups	%xmm1, 0x72d304e(%rip)  # 0x14799f52c
1406cc4de:     	movups	%xmm0, 0x72d3037(%rip)  # 0x14799f51c
1406cc4e5:     	testb	%al, %al
1406cc4e7:     	jne	0x1406cc44f <.text+0x6cb44f>
1406cc4ed:     	jmp	0x1406cc45e <.text+0x6cb45e>
1406cc4f2:     	leaq	0x72d301f(%rip), %rcx   # 0x14799f518
1406cc4f9:     	addq	$0x28, %rsp
1406cc4fd:     	popq	%rdi
1406cc4fe:     	popq	%rsi
1406cc4ff:     	jmp	0x1458e5980 <.text+0x58e4980>
1406cc504:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc509:     	testb	%al, %al
1406cc50b:     	jne	0x1406cc45e <.text+0x6cb45e>
1406cc511:     	movb	$0x1, 0x72d3001(%rip)   # 0x14799f519
1406cc518:     	jmp	0x1406cc45e <.text+0x6cb45e>
