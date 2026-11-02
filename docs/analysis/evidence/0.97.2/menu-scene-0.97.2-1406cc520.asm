
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1406cc520:     	pushq	%rsi
1406cc521:     	pushq	%rbx
1406cc522:     	subq	$0x28, %rsp
1406cc526:     	movl	0x72d301c(%rip), %eax   # 0x14799f548
1406cc52c:     	testl	%eax, %eax
1406cc52e:     	jne	0x1406cc589 <.text+0x6cb589>
1406cc530:     	movb	$0x1, %cl
1406cc532:     	xorl	%eax, %eax
1406cc534:     	lock
1406cc535:     	cmpxchgb	%cl, 0x72d2fdc(%rip)    # 0x14799f518
1406cc53c:     	jne	0x1406cc5a3 <.text+0x6cb5a3>
1406cc53e:     	movq	0x731a863(%rip), %rsi   # 0x1479e6da8
1406cc545:     	movq	(%rsi), %rax
1406cc548:     	shlq	%rax
1406cc54b:     	testq	%rax, %rax
1406cc54e:     	jne	0x1406cc5b1 <.text+0x6cb5b1>
1406cc550:     	movzbl	0x72d2fc2(%rip), %eax   # 0x14799f519
1406cc557:     	movzbl	0x72d2fe7(%rip), %eax   # 0x14799f545
1406cc55e:     	movzbl	0x72d2fdf(%rip), %ebx   # 0x14799f544
1406cc565:     	movq	(%rsi), %rcx
1406cc568:     	shlq	%rcx
1406cc56b:     	testq	%rcx, %rcx
1406cc56e:     	jne	0x1406cc5e5 <.text+0x6cb5e5>
1406cc570:     	xorl	%ecx, %ecx
1406cc572:     	xchgb	%cl, 0x72d2fa0(%rip)    # 0x14799f518
1406cc578:     	cmpb	$0x2, %cl
1406cc57b:     	je	0x1406cc5d3 <.text+0x6cb5d3>
1406cc57d:     	xorb	$0x1, %bl
1406cc580:     	andb	%bl, %al
1406cc582:     	addq	$0x28, %rsp
1406cc586:     	popq	%rbx
1406cc587:     	popq	%rsi
1406cc588:     	retq
1406cc589:     	leaq	0x72d2f88(%rip), %rcx   # 0x14799f518
1406cc590:     	callq	0x145762bb1 <.text+0x5761bb1>
1406cc595:     	movb	$0x1, %cl
1406cc597:     	xorl	%eax, %eax
1406cc599:     	lock
1406cc59a:     	cmpxchgb	%cl, 0x72d2f77(%rip)    # 0x14799f518
1406cc5a1:     	je	0x1406cc53e <.text+0x6cb53e>
1406cc5a3:     	leaq	0x72d2f6e(%rip), %rcx   # 0x14799f518
1406cc5aa:     	callq	0x1458e58c0 <.text+0x58e48c0>
1406cc5af:     	jmp	0x1406cc53e <.text+0x6cb53e>
1406cc5b1:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc5b6:     	movl	%eax, %ecx
1406cc5b8:     	movzbl	0x72d2f5a(%rip), %eax   # 0x14799f519
1406cc5bf:     	movzbl	0x72d2f7f(%rip), %eax   # 0x14799f545
1406cc5c6:     	movzbl	0x72d2f77(%rip), %ebx   # 0x14799f544
1406cc5cd:     	testb	%cl, %cl
1406cc5cf:     	jne	0x1406cc565 <.text+0x6cb565>
1406cc5d1:     	jmp	0x1406cc570 <.text+0x6cb570>
1406cc5d3:     	leaq	0x72d2f3e(%rip), %rcx   # 0x14799f518
1406cc5da:     	movl	%eax, %esi
1406cc5dc:     	callq	0x1458e5980 <.text+0x58e4980>
1406cc5e1:     	movl	%esi, %eax
1406cc5e3:     	jmp	0x1406cc57d <.text+0x6cb57d>
1406cc5e5:     	movl	%eax, %esi
1406cc5e7:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc5ec:     	testb	%al, %al
1406cc5ee:     	jne	0x1406cc5f7 <.text+0x6cb5f7>
1406cc5f0:     	movb	$0x1, 0x72d2f22(%rip)   # 0x14799f519
1406cc5f7:     	movl	%esi, %eax
1406cc5f9:     	jmp	0x1406cc570 <.text+0x6cb570>
