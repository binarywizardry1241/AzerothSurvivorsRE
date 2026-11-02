
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544411a:     	movzwl	%r8w, %eax
14544411e:     	cmpl	$0x109, %eax            # imm = 0x109
145444123:     	jle	0x14544416c <.text+0x544316c>
145444125:     	cmpl	$0x17b, %eax            # imm = 0x17B
14544412a:     	jg	0x1454441b8 <.text+0x54431b8>
145444130:     	leal	-0x10a(%rax), %ecx
145444136:     	cmpl	$0x33, %ecx
145444139:     	ja	0x145444697 <.text+0x5443697>
14544413f:     	leaq	0x12fa976(%rip), %rdx   # 0x14673eabc
145444146:     	movslq	(%rdx,%rcx,4), %rcx
14544414a:     	addq	%rdx, %rcx
14544414d:     	jmpq	*%rcx
14544414f:     	testq	%r12, %r12
145444152:     	je	0x1454442f8 <.text+0x54432f8>
145444158:     	movzbl	(%rbx), %ecx
14544415b:     	cmpq	$0x1, %r12
14544415f:     	jne	0x1454442fe <.text+0x54432fe>
145444165:     	xorl	%edx, %edx
145444167:     	jmp	0x145444302 <.text+0x5443302>
14544416c:     	leal	-0x36(%rax), %ecx
14544416f:     	cmpl	$0x2a, %ecx
145444172:     	ja	0x145444360 <.text+0x5443360>
145444178:     	leaq	0x12fa891(%rip), %rdx   # 0x14673ea10
14544417f:     	movslq	(%rdx,%rcx,4), %rcx
145444183:     	addq	%rdx, %rcx
145444186:     	jmpq	*%rcx
145444188:     	movq	%rdi, %r13
14544418b:     	movb	$0x45, %dil
14544418e:     	testq	%r12, %r12
145444191:     	je	0x145447a1f <.text+0x5446a1f>
145444197:     	xorl	%r14d, %r14d
14544419a:     	nopw	(%rax,%rax)
1454441a0:     	cmpb	$0x0, (%rbx,%r14)
1454441a5:     	je	0x145444a30 <.text+0x5443a30>
1454441ab:     	incq	%r14
1454441ae:     	cmpq	%r14, %r12
1454441b1:     	jne	0x1454441a0 <.text+0x54431a0>
1454441b3:     	jmp	0x145447a1f <.text+0x5446a1f>
1454441b8:     	cmpl	$0x1cd, %eax            # imm = 0x1CD
1454441bd:     	jle	0x1454442c3 <.text+0x54432c3>
1454441c3:     	cmpl	$0x1ce, %eax            # imm = 0x1CE
1454441c8:     	je	0x145444589 <.text+0x5443589>
1454441ce:     	cmpl	$0x1dc, %eax            # imm = 0x1DC
1454441d3:     	je	0x145444565 <.text+0x5443565>
1454441d9:     	cmpl	$0x1ed, %eax            # imm = 0x1ED
1454441de:     	jne	0x145444697 <.text+0x5443697>
1454441e4:     	testb	$0x1, 0x1018(%rsi)
1454441eb:     	xorps	%xmm0, %xmm0
1454441ee:     	movaps	%xmm0, 0x2250(%rbp)
1454441f5:     	movaps	%xmm0, 0x2240(%rbp)
1454441fc:     	movq	$0x0, 0x2260(%rbp)
145444207:     	je	0x145444233 <.text+0x5443233>
145444209:     	movq	0x1039(%rsi), %rax
145444210:     	movq	%rax, 0x2260(%rbp)
145444217:     	movups	0x1019(%rsi), %xmm0
14544421e:     	movups	0x1029(%rsi), %xmm1
145444225:     	movaps	%xmm1, 0x2250(%rbp)
14544422c:     	movaps	%xmm0, 0x2240(%rbp)
145444233:     	movq	0xa10(%rsi), %rdx
14544423a:     	cmpq	%rdx, %rdi
14544423d:     	jae	0x14544873d <.text+0x544773d>
145444243:     	movq	0xa08(%rsi), %rax
14544424a:     	imulq	$0xb0, %rdi, %rcx
145444251:     	movb	$0x1, 0x30(%rax,%rcx)
145444256:     	movaps	0x2240(%rbp), %xmm0
14544425d:     	movaps	0x2250(%rbp), %xmm1
145444264:     	movups	%xmm0, 0x31(%rax,%rcx)
145444269:     	movups	%xmm1, 0x41(%rax,%rcx)
14544426e:     	movq	0x2260(%rbp), %rdx
145444275:     	movq	%rdx, 0x51(%rax,%rcx)
14544427a:     	movw	$0x0, 0x59(%rax,%rcx)
145444281:     	movaps	0x2240(%rbp), %xmm0
145444288:     	movaps	0x2250(%rbp), %xmm1
14544428f:     	movups	%xmm0, 0x5b(%rax,%rcx)
145444294:     	movups	%xmm1, 0x6b(%rax,%rcx)
145444299:     	movq	0x2260(%rbp), %rdx
1454442a0:     	movq	%rdx, 0x7b(%rax,%rcx)
1454442a5:     	movw	$0x0, 0x83(%rax,%rcx)
1454442af:     	leaq	0x1600(%rbp), %rbx
1454442b6:     	movq	%rbx, %rcx
1454442b9:     	callq	0x14545f360 <.text+0x545e360>
1454442be:     	jmp	0x145444347 <.text+0x5443347>
1454442c3:     	cmpl	$0x17c, %eax            # imm = 0x17C
1454442c8:     	je	0x145444637 <.text+0x5443637>
1454442ce:     	cmpl	$0x17f, %eax            # imm = 0x17F
1454442d3:     	jne	0x145444697 <.text+0x5443697>
1454442d9:     	xorl	%edx, %edx
1454442db:     	testq	%r12, %r12
1454442de:     	je	0x145444a27 <.text+0x5443a27>
1454442e4:     	movzbl	(%rbx), %eax
1454442e7:     	cmpq	$0x1, %r12
1454442eb:     	jne	0x145445294 <.text+0x5444294>
1454442f1:     	xorl	%ecx, %ecx
1454442f3:     	jmp	0x1454452ba <.text+0x54442ba>
1454442f8:     	xorl	%edx, %edx
1454442fa:     	xorl	%ecx, %ecx
1454442fc:     	jmp	0x145444302 <.text+0x5443302>
1454442fe:     	movzbl	0x1(%rbx), %edx
145444302:     	cmpl	$0x10d, %eax            # imm = 0x10D
145444307:     	movzbl	%cl, %ecx
14544430a:     	movzbl	%dl, %edx
14544430d:     	cmovel	%ecx, %edx
145444310:     	movzbl	%dl, %ecx
145444313:     	movabsq	$0x4000000000000100, %rdx # imm = 0x4000000000000100
14544431d:     	orq	%rcx, %rdx
145444320:     	xorl	%r8d, %r8d
145444323:     	cmpb	$0x13, %cl
145444326:     	cmovbq	%rdx, %r8
14544432a:     	xorl	%ecx, %ecx
14544432c:     	cmpl	$0x111, %eax            # imm = 0x111
145444331:     	sete	%cl
145444334:     	leal	0x15(%rcx,%rcx,2), %edx
145444338:     	leaq	0x1600(%rbp), %rbx
14544433f:     	movq	%rbx, %rcx
145444342:     	callq	0x145465140 <.text+0x5464140>
145444347:     	movq	0xa08(%rsi), %rcx
14544434e:     	movq	0xa10(%rsi), %rdx
145444355:     	movq	%rdi, %r8
145444358:     	movq	%rbx, %r9
14544435b:     	jmp	0x145447a7d <.text+0x5446a7d>
145444360:     	cmpl	$0xb1, %eax
145444365:     	jne	0x145444697 <.text+0x5443697>
14544436b:     	testq	%r12, %r12
14544436e:     	je	0x145445210 <.text+0x5444210>
145444374:     	movzbl	(%rbx), %edi
145444377:     	xorl	%eax, %eax
145444379:     	cmpq	$0x1, %r12
14544437d:     	jne	0x14544535e <.text+0x544435e>
145444383:     	xorl	%r8d, %r8d
145444386:     	jmp	0x145445372 <.text+0x5444372>
14544438b:     	xorl	%eax, %eax
14544438d:     	testq	%r12, %r12
145444390:     	je	0x1454449b9 <.text+0x54439b9>
145444396:     	movzbl	(%rbx), %ecx
145444399:     	cmpq	$0x1, %r12
14544439d:     	jne	0x145444b14 <.text+0x5443b14>
1454443a3:     	xorl	%edx, %edx
1454443a5:     	jmp	0x145444b3a <.text+0x5443b3a>
1454443aa:     	xorl	%eax, %eax
1454443ac:     	testq	%r12, %r12
1454443af:     	je	0x1454449c2 <.text+0x54439c2>
1454443b5:     	movzbl	(%rbx), %ecx
1454443b8:     	cmpq	$0x1, %r12
1454443bc:     	jne	0x145444bb3 <.text+0x5443bb3>
1454443c2:     	xorl	%edx, %edx
1454443c4:     	jmp	0x145444bd9 <.text+0x5443bd9>
1454443c9:     	cmpb	$0x0, 0x1041(%rsi)
1454443d0:     	je	0x14544470b <.text+0x544370b>
1454443d6:     	movq	%rdi, %r14
1454443d9:     	movq	0xc08(%rsi), %rcx
1454443e0:     	movq	0xc10(%rsi), %rdx
1454443e7:     	callq	0x145420480 <.text+0x541f480>
1454443ec:     	imulq	$0xf0, %rax, %rcx
1454443f3:     	leaq	0x12ef11e(%rip), %rdx   # 0x146733518
1454443fa:     	leaq	(%rcx,%rdx), %rax
1454443fe:     	addq	$0x8, %rax
145444402:     	addq	%rcx, %rdx
145444405:     	addq	$0x10, %rdx
145444409:     	jmp	0x145444740 <.text+0x5443740>
14544440e:     	testq	%r12, %r12
145444411:     	movq	%rdi, 0x2380(%rbp)
145444418:     	je	0x1454449cb <.text+0x54439cb>
14544441e:     	movzbl	(%rbx), %edx
145444421:     	cmpq	$0x1, %r12
145444425:     	movl	%edx, 0x2360(%rbp)
14544442b:     	jne	0x145444d09 <.text+0x5443d09>
145444431:     	movl	$0x0, 0x2388(%rbp)
14544443b:     	xorl	%r13d, %r13d
14544443e:     	jmp	0x145444d23 <.text+0x5443d23>
145444443:     	testq	%r12, %r12
145444446:     	movq	%rdi, 0x2380(%rbp)
14544444d:     	je	0x1454449e7 <.text+0x54439e7>
145444453:     	movzbl	(%rbx), %edx
145444456:     	xorl	%eax, %eax
145444458:     	cmpq	$0x1, %r12
14544445c:     	jne	0x145444e00 <.text+0x5443e00>
145444462:     	xorl	%r8d, %r8d
145444465:     	jmp	0x145444e14 <.text+0x5443e14>
14544446a:     	testq	%r12, %r12
14544446d:     	je	0x1454449f3 <.text+0x54439f3>
145444473:     	movzbl	(%rbx), %ecx
145444476:     	xorl	%eax, %eax
145444478:     	cmpq	$0x1, %r12
14544447c:     	jne	0x145444ee3 <.text+0x5443ee3>
145444482:     	xorl	%r8d, %r8d
145444485:     	jmp	0x145444ef7 <.text+0x5443ef7>
14544448a:     	xorl	%eax, %eax
14544448c:     	testq	%r12, %r12
14544448f:     	movq	%rdi, 0x2380(%rbp)
145444496:     	je	0x1454449ff <.text+0x54439ff>
14544449c:     	movzbl	(%rbx), %ecx
14544449f:     	cmpq	$0x1, %r12
1454444a3:     	jne	0x145444f70 <.text+0x5443f70>
1454444a9:     	xorl	%edx, %edx
1454444ab:     	jmp	0x145444f96 <.text+0x5443f96>
1454444b0:     	callq	0x140002200 <.text+0x1200>
1454444b5:     	movl	$0x20, %ecx
1454444ba:     	movl	$0x1, %edx
1454444bf:     	callq	0x1400021c0 <.text+0x11c0>
1454444c4:     	testq	%rax, %rax
1454444c7:     	je	0x1454482f0 <.text+0x54472f0>
1454444cd:     	movl	$0x0, (%rax)
1454444d3:     	movb	$0x1, 0x4(%rax)
1454444d7:     	movq	$0x20, 0x1600(%rbp)
1454444e2:     	movq	%rax, 0x1608(%rbp)
1454444e9:     	movq	$0x5, 0x1610(%rbp)
1454444f4:     	movw	$0x4c, 0x1618(%rbp)
1454444fd:     	movq	0xa08(%rsi), %rcx
145444504:     	movq	0xa10(%rsi), %rdx
14544450b:     	leaq	0x1600(%rbp), %r9
145444512:     	movq	%rdi, %r8
145444515:     	callq	0x14543f3c0 <.text+0x543e3c0>
14544451a:     	movq	%rsi, %rcx
14544451d:     	callq	0x145449f40 <.text+0x5448f40>
145444522:     	jmp	0x145447a82 <.text+0x5446a82>
145444527:     	testq	%r12, %r12
14544452a:     	je	0x145444a08 <.text+0x5443a08>
145444530:     	movzbl	(%rbx), %ecx
145444533:     	xorl	%eax, %eax
145444535:     	cmpq	$0x1, %r12
145444539:     	jne	0x14544510b <.text+0x544410b>
14544453f:     	xorl	%edx, %edx
145444541:     	jmp	0x14544511e <.text+0x544411e>
145444546:     	xorl	%eax, %eax
145444548:     	testq	%r12, %r12
14544454b:     	je	0x145444a13 <.text+0x5443a13>
145444551:     	movzbl	(%rbx), %ecx
145444554:     	cmpq	$0x1, %r12
145444558:     	jne	0x14544518a <.text+0x544418a>
14544455e:     	xorl	%edx, %edx
145444560:     	jmp	0x1454451b0 <.text+0x54441b0>
145444565:     	movq	%rdi, %r13
145444568:     	xorl	%edi, %edi
14544456a:     	testq	%r12, %r12
14544456d:     	je	0x145444a1c <.text+0x5443a1c>
145444573:     	movzbl	(%rbx), %r14d
145444577:     	cmpq	$0x1, %r12
14544457b:     	jne	0x14544521c <.text+0x544421c>
145444581:     	xorl	%r15d, %r15d
145444584:     	jmp	0x145445241 <.text+0x5444241>
145444589:     	movq	%rdi, %r14
14544458c:     	movq	%rsi, %rbx
14544458f:     	callq	0x145703e20 <.text+0x5702e20>
145444594:     	movl	%eax, 0xb60(%rbp)
14544459a:     	movl	%edx, 0xb64(%rbp)
1454445a0:     	leaq	0x1600(%rbp), %rcx
1454445a7:     	leaq	0xb60(%rbp), %rdx
1454445ae:     	movl	$0xd53e8000, %r8d       # imm = 0xD53E8000
1454445b4:     	movl	$0x19db1de, %r9d        # imm = 0x19DB1DE
1454445ba:     	callq	0x145703dd0 <.text+0x5702dd0>
1454445bf:     	movq	0x1600(%rbp), %rdi
1454445c6:     	movq	0x1608(%rbp), %rsi
1454445cd:     	callq	0x140002200 <.text+0x1200>
1454445d2:     	movl	$0x20, %ecx
1454445d7:     	movl	$0x1, %edx
1454445dc:     	callq	0x1400021c0 <.text+0x11c0>
1454445e1:     	testq	%rax, %rax
1454445e4:     	je	0x1454482f0 <.text+0x54472f0>
1454445ea:     	xorl	%ecx, %ecx
1454445ec:     	testq	%rdi, %rdi
1454445ef:     	cmovel	%esi, %ecx
1454445f2:     	movl	%ecx, (%rax)
1454445f4:     	movq	$0x20, 0x1600(%rbp)
1454445ff:     	movq	%rax, 0x1608(%rbp)
145444606:     	movq	$0x4, 0x1610(%rbp)
145444611:     	movw	$0x1cf, 0x1618(%rbp)    # imm = 0x1CF
14544461a:     	movq	0xa08(%rbx), %rcx
145444621:     	movq	0xa10(%rbx), %rdx
145444628:     	leaq	0x1600(%rbp), %r9
14544462f:     	movq	%r14, %r8
145444632:     	jmp	0x145447a7d <.text+0x5446a7d>
145444637:     	xorl	%eax, %eax
145444639:     	movl	$0x0, %r8d
14544463f:     	movl	$0x0, %ecx
145444644:     	cmpq	$0x4, %r12
145444648:     	jb	0x145445a7e <.text+0x5444a7e>
14544464e:     	movabsq	$0x7ffffffffffffffe, %rax # imm = 0x7FFFFFFFFFFFFFFE
145444658:     	andq	%r12, %rax
14544465b:     	addq	$0x8, %rbx
14544465f:     	xorl	%r8d, %r8d
145444662:     	movq	%r12, %rcx
145444665:     	subq	$0x8, %rcx
145444669:     	movl	$0x1, %r9d
14544466f:     	cmovbq	%r9, %rbx
145444673:     	movl	$0x0, %edx
145444678:     	cmovaeq	%rcx, %rdx
14544467c:     	cmpq	$0x4, %rax
145444680:     	cmoveq	%r9, %rbx
145444684:     	cmpq	$0x9, %r12
145444688:     	jae	0x1454453de <.text+0x54443de>
14544468e:     	xorl	%eax, %eax
145444690:     	xorl	%ecx, %ecx
145444692:     	jmp	0x145445a7e <.text+0x5444a7e>
145444697:     	movq	%rsi, 0x2368(%rbp)
14544469e:     	leal	-0xb5(%rax), %ecx
1454446a4:     	cmpw	$0x17, %cx
1454446a8:     	setb	%cl
1454446ab:     	cmpl	$0xc7, %eax
1454446b0:     	setne	%dl
1454446b3:     	testb	%cl, %dl
1454446b5:     	jne	0x1454446d3 <.text+0x54436d3>
1454446b7:     	addl	$0xffffff26, %eax       # imm = 0xFFFFFF26
1454446bc:     	cmpl	$0x14, %eax
1454446bf:     	ja	0x145447a82 <.text+0x5446a82>
1454446c5:     	movl	$0x100003, %ecx         # imm = 0x100003
1454446ca:     	btl	%eax, %ecx
1454446cd:     	jae	0x145447a82 <.text+0x5446a82>
