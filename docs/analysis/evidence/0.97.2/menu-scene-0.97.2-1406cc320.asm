
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1406cc320:     	pushq	%rsi
1406cc321:     	pushq	%rbx
1406cc322:     	subq	$0x28, %rsp
1406cc326:     	movl	0x72d321c(%rip), %eax   # 0x14799f548
1406cc32c:     	testl	%eax, %eax
1406cc32e:     	jne	0x1406cc37d <.text+0x6cb37d>
1406cc330:     	movb	$0x1, %cl
1406cc332:     	xorl	%eax, %eax
1406cc334:     	lock
1406cc335:     	cmpxchgb	%cl, 0x72d31dc(%rip)    # 0x14799f518
1406cc33c:     	jne	0x1406cc397 <.text+0x6cb397>
1406cc33e:     	movq	0x731aa63(%rip), %rsi   # 0x1479e6da8
1406cc345:     	movq	(%rsi), %rax
1406cc348:     	shlq	%rax
1406cc34b:     	testq	%rax, %rax
1406cc34e:     	jne	0x1406cc3a5 <.text+0x6cb3a5>
1406cc350:     	movzbl	0x72d31c2(%rip), %eax   # 0x14799f519
1406cc357:     	movzbl	0x72d31e7(%rip), %eax   # 0x14799f545
1406cc35e:     	movq	(%rsi), %rcx
1406cc361:     	shlq	%rcx
1406cc364:     	testq	%rcx, %rcx
1406cc367:     	jne	0x1406cc3d7 <.text+0x6cb3d7>
1406cc369:     	xorl	%ecx, %ecx
1406cc36b:     	xchgb	%cl, 0x72d31a7(%rip)    # 0x14799f518
1406cc371:     	cmpb	$0x2, %cl
1406cc374:     	je	0x1406cc3c0 <.text+0x6cb3c0>
1406cc376:     	addq	$0x28, %rsp
1406cc37a:     	popq	%rbx
1406cc37b:     	popq	%rsi
1406cc37c:     	retq
1406cc37d:     	leaq	0x72d3194(%rip), %rcx   # 0x14799f518
1406cc384:     	callq	0x145762bb1 <.text+0x5761bb1>
1406cc389:     	movb	$0x1, %cl
1406cc38b:     	xorl	%eax, %eax
1406cc38d:     	lock
1406cc38e:     	cmpxchgb	%cl, 0x72d3183(%rip)    # 0x14799f518
1406cc395:     	je	0x1406cc33e <.text+0x6cb33e>
1406cc397:     	leaq	0x72d317a(%rip), %rcx   # 0x14799f518
1406cc39e:     	callq	0x1458e58c0 <.text+0x58e48c0>
1406cc3a3:     	jmp	0x1406cc33e <.text+0x6cb33e>
1406cc3a5:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc3aa:     	movl	%eax, %ecx
1406cc3ac:     	movzbl	0x72d3166(%rip), %eax   # 0x14799f519
1406cc3b3:     	movzbl	0x72d318b(%rip), %eax   # 0x14799f545
1406cc3ba:     	testb	%cl, %cl
1406cc3bc:     	jne	0x1406cc35e <.text+0x6cb35e>
1406cc3be:     	jmp	0x1406cc369 <.text+0x6cb369>
1406cc3c0:     	leaq	0x72d3151(%rip), %rcx   # 0x14799f518
1406cc3c7:     	movl	%eax, %ebx
1406cc3c9:     	callq	0x1458e5980 <.text+0x58e4980>
1406cc3ce:     	movl	%ebx, %eax
1406cc3d0:     	addq	$0x28, %rsp
1406cc3d4:     	popq	%rbx
1406cc3d5:     	popq	%rsi
1406cc3d6:     	retq
1406cc3d7:     	movl	%eax, %ebx
1406cc3d9:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc3de:     	testb	%al, %al
1406cc3e0:     	jne	0x1406cc3e9 <.text+0x6cb3e9>
1406cc3e2:     	movb	$0x1, 0x72d3130(%rip)   # 0x14799f519
1406cc3e9:     	movl	%ebx, %eax
1406cc3eb:     	jmp	0x1406cc369 <.text+0x6cb369>
