
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1406cc600:     	pushq	%rsi
1406cc601:     	pushq	%rbx
1406cc602:     	subq	$0x28, %rsp
1406cc606:     	movl	0x72d2f3c(%rip), %eax   # 0x14799f548
1406cc60c:     	testl	%eax, %eax
1406cc60e:     	jne	0x1406cc666 <.text+0x6cb666>
1406cc610:     	movb	$0x1, %cl
1406cc612:     	xorl	%eax, %eax
1406cc614:     	lock
1406cc615:     	cmpxchgb	%cl, 0x72d2efc(%rip)    # 0x14799f518
1406cc61c:     	jne	0x1406cc680 <.text+0x6cb680>
1406cc61e:     	movq	0x731a783(%rip), %rsi   # 0x1479e6da8
1406cc625:     	movq	(%rsi), %rax
1406cc628:     	shlq	%rax
1406cc62b:     	testq	%rax, %rax
1406cc62e:     	jne	0x1406cc68e <.text+0x6cb68e>
1406cc630:     	movzbl	0x72d2ee2(%rip), %eax   # 0x14799f519
1406cc637:     	movzbl	0x72d2f07(%rip), %eax   # 0x14799f545
1406cc63e:     	movzbl	0x72d2f01(%rip), %ebx   # 0x14799f546
1406cc645:     	movq	(%rsi), %rcx
1406cc648:     	shlq	%rcx
1406cc64b:     	testq	%rcx, %rcx
1406cc64e:     	jne	0x1406cc6c2 <.text+0x6cb6c2>
1406cc650:     	xorl	%ecx, %ecx
1406cc652:     	xchgb	%cl, 0x72d2ec0(%rip)    # 0x14799f518
1406cc658:     	cmpb	$0x2, %cl
1406cc65b:     	je	0x1406cc6b0 <.text+0x6cb6b0>
1406cc65d:     	andb	%bl, %al
1406cc65f:     	addq	$0x28, %rsp
1406cc663:     	popq	%rbx
1406cc664:     	popq	%rsi
1406cc665:     	retq
1406cc666:     	leaq	0x72d2eab(%rip), %rcx   # 0x14799f518
1406cc66d:     	callq	0x145762bb1 <.text+0x5761bb1>
1406cc672:     	movb	$0x1, %cl
1406cc674:     	xorl	%eax, %eax
1406cc676:     	lock
1406cc677:     	cmpxchgb	%cl, 0x72d2e9a(%rip)    # 0x14799f518
1406cc67e:     	je	0x1406cc61e <.text+0x6cb61e>
1406cc680:     	leaq	0x72d2e91(%rip), %rcx   # 0x14799f518
1406cc687:     	callq	0x1458e58c0 <.text+0x58e48c0>
1406cc68c:     	jmp	0x1406cc61e <.text+0x6cb61e>
1406cc68e:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc693:     	movl	%eax, %ecx
1406cc695:     	movzbl	0x72d2e7d(%rip), %eax   # 0x14799f519
1406cc69c:     	movzbl	0x72d2ea2(%rip), %eax   # 0x14799f545
1406cc6a3:     	movzbl	0x72d2e9c(%rip), %ebx   # 0x14799f546
1406cc6aa:     	testb	%cl, %cl
1406cc6ac:     	jne	0x1406cc645 <.text+0x6cb645>
1406cc6ae:     	jmp	0x1406cc650 <.text+0x6cb650>
1406cc6b0:     	leaq	0x72d2e61(%rip), %rcx   # 0x14799f518
1406cc6b7:     	movl	%eax, %esi
1406cc6b9:     	callq	0x1458e5980 <.text+0x58e4980>
1406cc6be:     	movl	%esi, %eax
1406cc6c0:     	jmp	0x1406cc65d <.text+0x6cb65d>
1406cc6c2:     	movl	%eax, %esi
1406cc6c4:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc6c9:     	testb	%al, %al
1406cc6cb:     	jne	0x1406cc6d4 <.text+0x6cb6d4>
1406cc6cd:     	movb	$0x1, 0x72d2e45(%rip)   # 0x14799f519
1406cc6d4:     	movl	%esi, %eax
1406cc6d6:     	jmp	0x1406cc650 <.text+0x6cb650>
