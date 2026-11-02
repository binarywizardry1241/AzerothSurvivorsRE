
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1406cc240:     	pushq	%rsi
1406cc241:     	pushq	%rbx
1406cc242:     	subq	$0x28, %rsp
1406cc246:     	movl	0x72d32fc(%rip), %eax   # 0x14799f548
1406cc24c:     	testl	%eax, %eax
1406cc24e:     	jne	0x1406cc29b <.text+0x6cb29b>
1406cc250:     	movb	$0x1, %dl
1406cc252:     	xorl	%eax, %eax
1406cc254:     	lock
1406cc255:     	cmpxchgb	%dl, 0x72d32bc(%rip)    # 0x14799f518
1406cc25c:     	jne	0x1406cc2bc <.text+0x6cb2bc>
1406cc25e:     	movq	0x731ab43(%rip), %rsi   # 0x1479e6da8
1406cc265:     	movq	(%rsi), %rax
1406cc268:     	shlq	%rax
1406cc26b:     	testq	%rax, %rax
1406cc26e:     	jne	0x1406cc2d1 <.text+0x6cb2d1>
1406cc270:     	movzbl	0x72d32a2(%rip), %eax   # 0x14799f519
1406cc277:     	movb	%cl, 0x72d32c7(%rip)    # 0x14799f544
1406cc27d:     	movq	(%rsi), %rax
1406cc280:     	shlq	%rax
1406cc283:     	testq	%rax, %rax
1406cc286:     	jne	0x1406cc2fd <.text+0x6cb2fd>
1406cc288:     	xorl	%eax, %eax
1406cc28a:     	xchgb	%al, 0x72d3288(%rip)    # 0x14799f518
1406cc290:     	cmpb	$0x2, %al
1406cc292:     	je	0x1406cc2eb <.text+0x6cb2eb>
1406cc294:     	addq	$0x28, %rsp
1406cc298:     	popq	%rbx
1406cc299:     	popq	%rsi
1406cc29a:     	retq
1406cc29b:     	leaq	0x72d3276(%rip), %rax   # 0x14799f518
1406cc2a2:     	movl	%ecx, %ebx
1406cc2a4:     	movq	%rax, %rcx
1406cc2a7:     	callq	0x145762bb1 <.text+0x5761bb1>
1406cc2ac:     	movl	%ebx, %ecx
1406cc2ae:     	movb	$0x1, %dl
1406cc2b0:     	xorl	%eax, %eax
1406cc2b2:     	lock
1406cc2b3:     	cmpxchgb	%dl, 0x72d325e(%rip)    # 0x14799f518
1406cc2ba:     	je	0x1406cc25e <.text+0x6cb25e>
1406cc2bc:     	leaq	0x72d3255(%rip), %rax   # 0x14799f518
1406cc2c3:     	movl	%ecx, %ebx
1406cc2c5:     	movq	%rax, %rcx
1406cc2c8:     	callq	0x1458e58c0 <.text+0x58e48c0>
1406cc2cd:     	movl	%ebx, %ecx
1406cc2cf:     	jmp	0x1406cc25e <.text+0x6cb25e>
1406cc2d1:     	movl	%ecx, %ebx
1406cc2d3:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc2d8:     	movzbl	0x72d323a(%rip), %ecx   # 0x14799f519
1406cc2df:     	movb	%bl, 0x72d325f(%rip)    # 0x14799f544
1406cc2e5:     	testb	%al, %al
1406cc2e7:     	jne	0x1406cc27d <.text+0x6cb27d>
1406cc2e9:     	jmp	0x1406cc288 <.text+0x6cb288>
1406cc2eb:     	leaq	0x72d3226(%rip), %rcx   # 0x14799f518
1406cc2f2:     	addq	$0x28, %rsp
1406cc2f6:     	popq	%rbx
1406cc2f7:     	popq	%rsi
1406cc2f8:     	jmp	0x1458e5980 <.text+0x58e4980>
1406cc2fd:     	callq	0x1458e6650 <.text+0x58e5650>
1406cc302:     	testb	%al, %al
1406cc304:     	jne	0x1406cc288 <.text+0x6cb288>
1406cc306:     	movb	$0x1, 0x72d320c(%rip)   # 0x14799f519
1406cc30d:     	jmp	0x1406cc288 <.text+0x6cb288>
