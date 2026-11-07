
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454440d0:     	pushq	%rbp
1454440d1:     	pushq	%r15
1454440d3:     	pushq	%r14
1454440d5:     	pushq	%r13
1454440d7:     	pushq	%r12
1454440d9:     	pushq	%rsi
1454440da:     	pushq	%rdi
1454440db:     	pushq	%rbx
1454440dc:     	movl	$0x2448, %eax           # imm = 0x2448
1454440e1:     	callq	0x145772680 <.text+0x5771680>
1454440e6:     	subq	%rax, %rsp
1454440e9:     	leaq	0x80(%rsp), %rbp
1454440f1:     	movaps	%xmm7, 0x23b0(%rbp)
1454440f8:     	movaps	%xmm6, 0x23a0(%rbp)
1454440ff:     	movq	$-0x2, 0x2398(%rbp)
14544410a:     	movq	%r9, %rbx
14544410d:     	movq	%rdx, %rdi
145444110:     	movq	%rcx, %rsi
145444113:     	movq	0x2430(%rbp), %r12
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
1454446d3:     	movl	$0x1, %r11d
1454446d9:     	xorl	%eax, %eax
1454446db:     	testq	%r12, %r12
1454446de:     	je	0x1454452ff <.text+0x54442ff>
1454446e4:     	movzbl	(%rbx), %ecx
1454446e7:     	cmpq	$0x1, %r12
1454446eb:     	je	0x145445301 <.text+0x5444301>
1454446f1:     	movzbl	0x1(%rbx), %r8d
1454446f6:     	shll	$0x8, %r8d
1454446fa:     	cmpq	$0x3, %r12
1454446fe:     	jae	0x1454459fa <.text+0x54449fa>
145444704:     	xorl	%edx, %edx
145444706:     	jmp	0x145445306 <.text+0x5444306>
14544470b:     	movq	0xa10(%rsi), %rdx
145444712:     	cmpq	%rdx, %rdi
145444715:     	jae	0x14544874e <.text+0x544774e>
14544471b:     	movq	0xa08(%rsi), %rcx
145444722:     	movq	%rdi, %r14
145444725:     	imulq	$0xb0, %rdi, %rdx
14544472c:     	leaq	(%rcx,%rdx), %rax
145444730:     	addq	$0x98, %rax
145444736:     	addq	%rcx, %rdx
145444739:     	addq	$0xa0, %rdx
145444740:     	movq	%rsi, %rdi
145444743:     	movq	(%rax), %rcx
145444746:     	movq	(%rdx), %rdx
145444749:     	callq	0x145420480 <.text+0x541f480>
14544474e:     	imulq	$0xf0, %rax, %rax
145444755:     	leaq	0x12eedbc(%rip), %rsi   # 0x146733518
14544475c:     	addq	%rax, %rsi
14544475f:     	leaq	0x2060(%rbp), %rcx
145444766:     	movq	%rdi, %rdx
145444769:     	callq	0x14544d300 <.text+0x544c300>
14544476e:     	movq	0x2068(%rbp), %rbx
145444775:     	movq	0x2070(%rbp), %r15
14544477c:     	imulq	$0x38, %r15, %rax
145444780:     	addq	%rbx, %rax
145444783:     	movq	%rbx, 0x1600(%rbp)
14544478a:     	movq	%rax, 0x1608(%rbp)
145444791:     	movq	%rsi, 0x1610(%rbp)
145444798:     	movq	%rdi, 0x1618(%rbp)
14544479f:     	leaq	0x1a0(%rbp), %rcx
1454447a6:     	leaq	0x1600(%rbp), %rdx
1454447ad:     	callq	0x145544ca0 <.text+0x5543ca0>
1454447b2:     	nop
1454447b3:     	movq	%rdi, %rsi
1454447b6:     	callq	0x140002200 <.text+0x1200>
1454447bb:     	movl	$0x20, %ecx
1454447c0:     	movl	$0x1, %edx
1454447c5:     	callq	0x1400021c0 <.text+0x11c0>
1454447ca:     	testq	%rax, %rax
1454447cd:     	je	0x145448713 <.text+0x5447713>
1454447d3:     	movq	%r14, %rdi
1454447d6:     	pcmpeqd	%xmm0, %xmm0
1454447da:     	movdqu	%xmm0, 0x10(%rax)
1454447df:     	movdqu	%xmm0, (%rax)
1454447e3:     	movq	$0x20, 0x1600(%rbp)
1454447ee:     	movq	%rax, 0x1608(%rbp)
1454447f5:     	movq	$0x20, 0x1610(%rbp)
145444800:     	movw	$0xfd, 0x1618(%rbp)
145444809:     	movq	0xa08(%rsi), %rcx
145444810:     	movq	0xa10(%rsi), %rdx
145444817:     	leaq	0x1600(%rbp), %r9
14544481e:     	movq	%r14, %r8
145444821:     	callq	0x14543f3c0 <.text+0x543e3c0>
145444826:     	nop
145444827:     	movq	0x1a8(%rbp), %r14
14544482e:     	movq	0x1b0(%rbp), %r8
145444835:     	leaq	0x1600(%rbp), %rcx
14544483c:     	movq	%r14, %rdx
14544483f:     	callq	0x145467890 <.text+0x5466890>
145444844:     	nop
145444845:     	movq	0xa08(%rsi), %rcx
14544484c:     	movq	0xa10(%rsi), %rdx
145444853:     	leaq	0x1600(%rbp), %r9
14544485a:     	movq	%rdi, %r8
14544485d:     	callq	0x14543f3c0 <.text+0x543e3c0>
145444862:     	nop
145444863:     	movq	0xf70(%rsi), %rdi
14544486a:     	movq	0xf78(%rsi), %rsi
145444871:     	callq	0x140002200 <.text+0x1200>
145444876:     	movl	$0x1, %ecx
14544487b:     	movl	$0x1, %edx
145444880:     	callq	0x1400021c0 <.text+0x11c0>
145444885:     	testq	%rax, %rax
145444888:     	je	0x145448728 <.text+0x5447728>
14544488e:     	movb	$0x7b, (%rax)
145444891:     	movq	$0x1, 0x1600(%rbp)
14544489c:     	movq	%rax, 0x1608(%rbp)
1454448a3:     	movq	$0x1, 0x1610(%rbp)
1454448ae:     	movb	$0x1, 0x1618(%rbp)
1454448b5:     	leaq	0x12f9a0c(%rip), %rax   # 0x14673e2c8
1454448bc:     	movq	%rax, 0x20(%rsp)
1454448c1:     	movq	$0x6, 0x28(%rsp)
1454448ca:     	leaq	0x12f9792(%rip), %r8    # 0x14673e063
1454448d1:     	leaq	0xb60(%rbp), %rcx
1454448d8:     	leaq	0x1600(%rbp), %rdx
1454448df:     	movl	$0x4, %r9d
1454448e5:     	callq	0x145456ed0 <.text+0x5455ed0>
1454448ea:     	nop
1454448eb:     	movq	0xb60(%rbp), %rax
1454448f2:     	movq	0xb70(%rbp), %r8
1454448f9:     	movq	%rax, 0x2380(%rbp)
145444900:     	cmpq	%r8, %rax
145444903:     	je	0x145447db3 <.text+0x5446db3>
145444909:     	movq	0xb68(%rbp), %rdx
145444910:     	movb	$0x7d, (%rdx,%r8)
145444915:     	incq	%r8
145444918:     	movq	%rdi, %rcx
14544491b:     	movq	%rdx, 0x2388(%rbp)
145444922:     	callq	*0x18(%rsi)
145444925:     	nop
145444926:     	movq	0x2380(%rbp), %rdx
14544492d:     	testq	%rdx, %rdx
145444930:     	je	0x145444944 <.text+0x5443944>
145444932:     	movl	$0x1, %r8d
145444938:     	movq	0x2388(%rbp), %rcx
14544493f:     	callq	0x1400021d0 <.text+0x11d0>
145444944:     	movq	0x1a0(%rbp), %rax
14544494b:     	testq	%rax, %rax
14544494e:     	je	0x145444965 <.text+0x5443965>
145444950:     	imulq	$0xd0, %rax, %rdx
145444957:     	movl	$0x8, %r8d
14544495d:     	movq	%r14, %rcx
145444960:     	callq	0x1400021d0 <.text+0x11d0>
145444965:     	testq	%r15, %r15
145444968:     	je	0x145444992 <.text+0x5443992>
14544496a:     	leaq	0x8(%rbx), %rsi
14544496e:     	jmp	0x145444979 <.text+0x5443979>
145444970:     	addq	$0x38, %rsi
145444974:     	decq	%r15
145444977:     	je	0x145444992 <.text+0x5443992>
145444979:     	movq	-0x8(%rsi), %rdx
14544497d:     	testq	%rdx, %rdx
145444980:     	je	0x145444970 <.text+0x5443970>
145444982:     	movq	(%rsi), %rcx
145444985:     	movl	$0x1, %r8d
14544498b:     	callq	0x1400021d0 <.text+0x11d0>
145444990:     	jmp	0x145444970 <.text+0x5443970>
145444992:     	movq	0x2060(%rbp), %rax
145444999:     	testq	%rax, %rax
14544499c:     	je	0x145447a82 <.text+0x5446a82>
1454449a2:     	imulq	$0x38, %rax, %rdx
1454449a6:     	movl	$0x8, %r8d
1454449ac:     	movq	%rbx, %rcx
1454449af:     	callq	0x1400021d0 <.text+0x11d0>
1454449b4:     	jmp	0x145447a82 <.text+0x5446a82>
1454449b9:     	xorl	%ecx, %ecx
1454449bb:     	xorl	%edx, %edx
1454449bd:     	jmp	0x145444b3a <.text+0x5443b3a>
1454449c2:     	xorl	%ecx, %ecx
1454449c4:     	xorl	%edx, %edx
1454449c6:     	jmp	0x145444bd9 <.text+0x5443bd9>
1454449cb:     	movl	$0x0, 0x2388(%rbp)
1454449d5:     	xorl	%r13d, %r13d
1454449d8:     	movl	$0x0, 0x2360(%rbp)
1454449e2:     	jmp	0x145444d23 <.text+0x5443d23>
1454449e7:     	xorl	%eax, %eax
1454449e9:     	xorl	%r8d, %r8d
1454449ec:     	xorl	%edx, %edx
1454449ee:     	jmp	0x145444e14 <.text+0x5443e14>
1454449f3:     	xorl	%eax, %eax
1454449f5:     	xorl	%r8d, %r8d
1454449f8:     	xorl	%ecx, %ecx
1454449fa:     	jmp	0x145444ef7 <.text+0x5443ef7>
1454449ff:     	xorl	%ecx, %ecx
145444a01:     	xorl	%edx, %edx
145444a03:     	jmp	0x145444f96 <.text+0x5443f96>
145444a08:     	xorl	%eax, %eax
145444a0a:     	xorl	%edx, %edx
145444a0c:     	xorl	%ecx, %ecx
145444a0e:     	jmp	0x14544511e <.text+0x544411e>
145444a13:     	xorl	%ecx, %ecx
145444a15:     	xorl	%edx, %edx
145444a17:     	jmp	0x1454451b0 <.text+0x54441b0>
145444a1c:     	xorl	%r14d, %r14d
145444a1f:     	xorl	%r15d, %r15d
145444a22:     	jmp	0x145445241 <.text+0x5444241>
145444a27:     	xorl	%eax, %eax
145444a29:     	xorl	%ecx, %ecx
145444a2b:     	jmp	0x1454452ba <.text+0x54442ba>
145444a30:     	leaq	0xb60(%rbp), %rcx
145444a37:     	movq	%rbx, %rdx
145444a3a:     	movq	%r14, %r8
145444a3d:     	callq	0x145725d90 <.text+0x5724d90>
145444a42:     	movq	0xb68(%rbp), %rax
145444a49:     	movq	%rax, 0x2388(%rbp)
145444a50:     	movq	0xb70(%rbp), %r15
145444a57:     	movq	$0x1, 0x20(%rsp)
145444a60:     	leaq	0x1600(%rbp), %rcx
145444a67:     	movl	$0x1, %r9d
145444a6d:     	movq	%r15, %rdx
145444a70:     	xorl	%r8d, %r8d
145444a73:     	callq	0x140188f20 <.text+0x187f20>
145444a78:     	movq	0x1608(%rbp), %rax
145444a7f:     	movq	%rax, 0x2350(%rbp)
145444a86:     	cmpb	$0x0, 0x1600(%rbp)
145444a8d:     	jne	0x145447df1 <.text+0x5446df1>
145444a93:     	movq	0x1610(%rbp), %rdi
145444a9a:     	testq	%r15, %r15
145444a9d:     	je	0x145444ab1 <.text+0x5443ab1>
145444a9f:     	movq	%rdi, %rcx
145444aa2:     	movq	0x2388(%rbp), %rdx
145444aa9:     	movq	%r15, %r8
145444aac:     	callq	0x1457731ed <.text+0x57721ed>
145444ab1:     	movq	%rdi, 0x2370(%rbp)
145444ab8:     	movq	0xb60(%rbp), %rdx
145444abf:     	testq	%rdx, %rdx
145444ac2:     	jle	0x145444ad6 <.text+0x5443ad6>
145444ac4:     	movl	$0x1, %r8d
145444aca:     	movq	0x2388(%rbp), %rcx
145444ad1:     	callq	0x1400021d0 <.text+0x11d0>
145444ad6:     	movq	%r14, %rax
145444ad9:     	notq	%rax
145444adc:     	addq	%r12, %rax
145444adf:     	movb	$0x30, %dil
145444ae2:     	cmpq	$0x8, %rax
145444ae6:     	jb	0x145447a01 <.text+0x5446a01>
145444aec:     	movq	0x2370(%rbp), %rcx
145444af3:     	movq	%r15, %rdx
145444af6:     	callq	0x1400a4890 <.text+0xa3890>
145444afb:     	nop
145444afc:     	cmpq	$0x20, %rdx
145444b00:     	jae	0x145446511 <.text+0x5445511>
145444b06:     	movq	%rax, %rcx
145444b09:     	callq	0x145730ef0 <.text+0x572fef0>
145444b0e:     	nop
145444b0f:     	jmp	0x14544651a <.text+0x544551a>
145444b14:     	movzbl	0x1(%rbx), %edx
145444b18:     	shll	$0x8, %edx
145444b1b:     	cmpq	$0x3, %r12
145444b1f:     	jb	0x145444b3a <.text+0x5443b3a>
145444b21:     	movzbl	0x2(%rbx), %eax
145444b25:     	shll	$0x10, %eax
145444b28:     	cmpq	$0x3, %r12
145444b2c:     	je	0x145444b3a <.text+0x5443b3a>
145444b2e:     	movzbl	0x3(%rbx), %r8d
145444b33:     	shll	$0x18, %r8d
145444b37:     	orl	%r8d, %eax
145444b3a:     	orl	%edx, %eax
145444b3c:     	movzbl	%cl, %ebx
145444b3f:     	orl	%eax, %ebx
145444b41:     	leal	-0x232d(%rbx), %eax
145444b47:     	cmpl	$0x9, %eax
145444b4a:     	jae	0x145444b66 <.text+0x5443b66>
145444b4c:     	movl	%eax, %eax
145444b4e:     	leaq	0x12f9d5f(%rip), %rcx   # 0x14673e8b4
145444b55:     	movl	(%rcx,%rax,4), %r14d
145444b59:     	leaq	0x12f9d78(%rip), %rcx   # 0x14673e8d8
145444b60:     	movl	(%rcx,%rax,4), %r15d
145444b64:     	jmp	0x145444b72 <.text+0x5443b72>
145444b66:     	movl	$0xa36, %r15d           # imm = 0xA36
145444b6c:     	movl	$0x5, %r14d
145444b72:     	movl	%ebx, %ecx
145444b74:     	callq	0x145420890 <.text+0x541f890>
145444b79:     	movq	%rdx, 0x28(%rsp)
145444b7e:     	movq	%rax, 0x20(%rsp)
145444b83:     	leaq	0x1600(%rbp), %r12
145444b8a:     	movq	%r12, %rcx
145444b8d:     	movl	%ebx, %edx
145444b8f:     	movl	%r14d, %r8d
145444b92:     	movl	%r15d, %r9d
145444b95:     	callq	0x145465300 <.text+0x5464300>
145444b9a:     	movq	0xa08(%rsi), %rcx
145444ba1:     	movq	0xa10(%rsi), %rdx
145444ba8:     	movq	%rdi, %r8
145444bab:     	movq	%r12, %r9
145444bae:     	jmp	0x145447a7d <.text+0x5446a7d>
145444bb3:     	movzbl	0x1(%rbx), %edx
145444bb7:     	shll	$0x8, %edx
145444bba:     	cmpq	$0x3, %r12
145444bbe:     	jb	0x145444bd9 <.text+0x5443bd9>
145444bc0:     	movzbl	0x2(%rbx), %eax
145444bc4:     	shll	$0x10, %eax
145444bc7:     	cmpq	$0x3, %r12
145444bcb:     	je	0x145444bd9 <.text+0x5443bd9>
145444bcd:     	movzbl	0x3(%rbx), %r8d
145444bd2:     	shll	$0x18, %r8d
145444bd6:     	orl	%r8d, %eax
145444bd9:     	orl	%edx, %eax
145444bdb:     	movzbl	%cl, %ebx
145444bde:     	orl	%eax, %ebx
145444be0:     	cmpl	$0x2329, %ebx           # imm = 0x2329
145444be6:     	movq	%rdi, 0x2380(%rbp)
145444bed:     	je	0x145444c40 <.text+0x5443c40>
145444bef:     	cmpl	$0x251c, %ebx           # imm = 0x251C
145444bf5:     	jne	0x145444c9a <.text+0x5443c9a>
145444bfb:     	leaq	0x12f9c18(%rip), %r14   # 0x14673e81a
145444c02:     	movq	%rsi, %rdi
145444c05:     	movl	$0x5, %esi
145444c0a:     	movl	$0x5, %edx
145444c0f:     	movq	%r14, %rcx
145444c12:     	callq	0x145457cb0 <.text+0x5456cb0>
145444c17:     	movq	%rax, %r8
145444c1a:     	movq	%rdx, %r12
145444c1d:     	testq	%rax, %rax
145444c20:     	cmoveq	%rsi, %r12
145444c24:     	movq	%rdi, %rsi
145444c27:     	cmoveq	%r14, %r8
145444c2b:     	movl	$0x1, %eax
145444c30:     	movl	$0xb, %ecx
145444c35:     	xorl	%r10d, %r10d
145444c38:     	movl	$0x11ed, %r9d           # imm = 0x11ED
145444c3e:     	jmp	0x145444c83 <.text+0x5443c83>
145444c40:     	leaq	0x12f9bd8(%rip), %r14   # 0x14673e81f
145444c47:     	movq	%rsi, %rdi
145444c4a:     	movl	$0xa, %esi
145444c4f:     	movl	$0xa, %edx
145444c54:     	movq	%r14, %rcx
145444c57:     	callq	0x145457cb0 <.text+0x5456cb0>
145444c5c:     	movq	%rax, %r8
145444c5f:     	movq	%rdx, %r12
145444c62:     	testq	%rax, %rax
145444c65:     	cmoveq	%rsi, %r12
145444c69:     	movq	%rdi, %rsi
145444c6c:     	cmoveq	%r14, %r8
145444c70:     	movl	$0x1, %eax
145444c75:     	movl	$0xa, %ecx
145444c7a:     	xorl	%r10d, %r10d
145444c7d:     	movl	$0x721, %r9d            # imm = 0x721
145444c83:     	xorl	%edx, %edx
145444c85:     	testq	%r8, %r8
145444c88:     	jne	0x145444cc6 <.text+0x5443cc6>
145444c8a:     	leaq	0x1fc0(%rbp), %rcx
145444c91:     	movl	%ebx, %edx
145444c93:     	callq	0x1454602f0 <.text+0x545f2f0>
145444c98:     	jmp	0x145444cef <.text+0x5443cef>
145444c9a:     	movl	%ebx, %ecx
145444c9c:     	callq	0x145514ee0 <.text+0x5513ee0>
145444ca1:     	testq	%rax, %rax
145444ca4:     	je	0x145445a20 <.text+0x5444a20>
145444caa:     	movl	0x50(%rax), %r9d
145444cae:     	xorl	%r12d, %r12d
145444cb1:     	movl	$0x8, %ecx
145444cb6:     	movl	$0x1, %r8d
145444cbc:     	movl	$0x1, %eax
145444cc1:     	xorl	%edx, %edx
145444cc3:     	xorl	%r10d, %r10d
145444cc6:     	movl	%r9d, 0x40(%rsp)
145444ccb:     	movl	%r10d, 0x38(%rsp)
145444cd0:     	movl	%ecx, 0x30(%rsp)
145444cd4:     	movq	%rdx, 0x28(%rsp)
145444cd9:     	movq	%rax, 0x20(%rsp)
145444cde:     	leaq	0x1fc0(%rbp), %rcx
145444ce5:     	movl	%ebx, %edx
145444ce7:     	movq	%r12, %r9
145444cea:     	callq	0x145464710 <.text+0x5463710>
145444cef:     	movq	0xa08(%rsi), %rcx
145444cf6:     	movq	0xa10(%rsi), %rdx
145444cfd:     	leaq	0x1fc0(%rbp), %r9
145444d04:     	jmp	0x145444ed7 <.text+0x5443ed7>
145444d09:     	movzbl	0x1(%rbx), %ecx
145444d0d:     	shll	$0x8, %ecx
145444d10:     	xorl	%r13d, %r13d
145444d13:     	cmpq	$0x3, %r12
145444d17:     	movl	%ecx, 0x2388(%rbp)
145444d1d:     	jae	0x1454456b2 <.text+0x54446b2>
145444d23:     	movl	$0x0, 0x2370(%rbp)
145444d2d:     	xorl	%edi, %edi
145444d2f:     	xorl	%r15d, %r15d
145444d32:     	leaq	0x1600(%rbp), %rcx
145444d39:     	movq	%rsi, %rdx
145444d3c:     	callq	0x14544d300 <.text+0x544c300>
145444d41:     	movq	0x1600(%rbp), %rcx
145444d48:     	movq	0x1608(%rbp), %rbx
145444d4f:     	movq	0x1610(%rbp), %rax
145444d56:     	imulq	$0x38, %rax, %r14
145444d5a:     	leaq	(%rbx,%r14), %r12
145444d5e:     	movq	%rbx, 0xb60(%rbp)
145444d65:     	movq	%rcx, 0xb70(%rbp)
145444d6c:     	movq	%rbx, 0xb68(%rbp)
145444d73:     	movq	%r12, 0xb78(%rbp)
145444d7a:     	testq	%rax, %rax
145444d7d:     	je	0x145444def <.text+0x5443def>
145444d7f:     	movq	%rcx, 0x2350(%rbp)
145444d86:     	movzbl	0x2370(%rbp), %eax
145444d8d:     	movzbl	0x2360(%rbp), %ecx
145444d94:     	orl	0x2388(%rbp), %r13d
145444d9b:     	orl	%ecx, %r13d
145444d9e:     	orl	%r15d, %edi
145444da1:     	orl	%eax, %edi
145444da3:     	shlq	$0x20, %rdi
145444da7:     	orq	%r13, %rdi
145444daa:     	xorl	%r15d, %r15d
145444dad:     	jmp	0x145444dc3 <.text+0x5443dc3>
145444daf:     	nop
145444db0:     	cmpq	$-0x1, %rdx
145444db4:     	jne	0x1454453f2 <.text+0x54443f2>
145444dba:     	addq	$0x38, %r15
145444dbe:     	cmpq	%r15, %r14
145444dc1:     	je	0x145444de8 <.text+0x5443de8>
145444dc3:     	movq	(%rbx,%r15), %rdx
145444dc7:     	movq	0x8(%rbx,%r15), %r13
145444dcc:     	cmpq	%rdi, 0x18(%rbx,%r15)
145444dd1:     	je	0x145444db0 <.text+0x5443db0>
145444dd3:     	testq	%rdx, %rdx
145444dd6:     	je	0x145444dba <.text+0x5443dba>
145444dd8:     	movl	$0x1, %r8d
145444dde:     	movq	%r13, %rcx
145444de1:     	callq	0x1400021d0 <.text+0x11d0>
145444de6:     	jmp	0x145444dba <.text+0x5443dba>
145444de8:     	movq	%r12, 0xb68(%rbp)
145444def:     	leaq	0xb60(%rbp), %rcx
145444df6:     	callq	0x14555aa40 <.text+0x5559a40>
145444dfb:     	jmp	0x145447a82 <.text+0x5446a82>
145444e00:     	movzbl	0x1(%rbx), %eax
145444e04:     	shll	$0x8, %eax
145444e07:     	xorl	%r8d, %r8d
145444e0a:     	cmpq	$0x3, %r12
145444e0e:     	jae	0x1454456d5 <.text+0x54446d5>
145444e14:     	xorl	%r9d, %r9d
145444e17:     	xorl	%r14d, %r14d
145444e1a:     	xorl	%r10d, %r10d
145444e1d:     	leaq	0xa18(%rsi), %rcx
145444e24:     	movq	0xa28(%rsi), %r13
145444e2b:     	testq	%r13, %r13
145444e2e:     	je	0x145444e77 <.text+0x5443e77>
145444e30:     	movzbl	%r9b, %r9d
145444e34:     	movzbl	%dl, %edx
145444e37:     	orl	%eax, %r8d
145444e3a:     	orl	%edx, %r8d
145444e3d:     	orl	%r10d, %r14d
145444e40:     	orl	%r9d, %r14d
145444e43:     	shlq	$0x20, %r14
145444e47:     	orq	%r8, %r14
145444e4a:     	movq	0xa20(%rsi), %rbx
145444e51:     	leaq	-0x1(%r13), %r15
145444e55:     	leaq	0x38(%rbx), %r12
145444e59:     	xorl	%edi, %edi
145444e5b:     	nopl	(%rax,%rax)
145444e60:     	cmpq	%r14, -0x20(%r12)
145444e65:     	je	0x145447aa4 <.text+0x5446aa4>
145444e6b:     	incq	%rdi
145444e6e:     	addq	$0x38, %r12
145444e72:     	cmpq	%rdi, %r13
145444e75:     	jne	0x145444e60 <.text+0x5443e60>
145444e77:     	callq	0x1454356a0 <.text+0x54346a0>
145444e7c:     	callq	0x140002200 <.text+0x1200>
145444e81:     	movl	$0x20, %ecx
145444e86:     	movl	$0x1, %edx
145444e8b:     	callq	0x1400021c0 <.text+0x11c0>
145444e90:     	testq	%rax, %rax
145444e93:     	je	0x1454482f0 <.text+0x54472f0>
145444e99:     	movb	$0x39, (%rax)
145444e9c:     	movq	$0x20, 0x1600(%rbp)
145444ea7:     	movq	%rax, 0x1608(%rbp)
145444eae:     	movq	$0x1, 0x1610(%rbp)
145444eb9:     	movw	$0x3c, 0x1618(%rbp)
145444ec2:     	movq	0xa08(%rsi), %rcx
145444ec9:     	movq	0xa10(%rsi), %rdx
145444ed0:     	leaq	0x1600(%rbp), %r9
145444ed7:     	movq	0x2380(%rbp), %r8
145444ede:     	jmp	0x145447a7d <.text+0x5446a7d>
145444ee3:     	movzbl	0x1(%rbx), %eax
145444ee7:     	shll	$0x8, %eax
145444eea:     	xorl	%r8d, %r8d
145444eed:     	cmpq	$0x3, %r12
145444ef1:     	jae	0x1454456f1 <.text+0x54446f1>
145444ef7:     	xorl	%edx, %edx
145444ef9:     	xorl	%r9d, %r9d
145444efc:     	xorl	%r10d, %r10d
145444eff:     	cmpq	$-0x1, 0xdf8(%rsi)
145444f07:     	je	0x145447a82 <.text+0x5446a82>
145444f0d:     	movq	%rsi, %r11
145444f10:     	movzbl	%dl, %edx
145444f13:     	orl	%r10d, %r9d
145444f16:     	orl	%edx, %r9d
145444f19:     	shlq	$0x20, %r9
145444f1d:     	orl	%eax, %r8d
145444f20:     	movzbl	%cl, %edx
145444f23:     	orl	%r8d, %edx
145444f26:     	orq	%r9, %rdx
145444f29:     	movq	0xe00(%r11), %r8
145444f30:     	movq	0xe08(%r11), %r9
145444f37:     	movzbl	0xf65(%r11), %eax
145444f3f:     	movzbl	0xf66(%r11), %ecx
145444f47:     	movzbl	0xf64(%r11), %r10d
145444f4f:     	movb	%r10b, 0x30(%rsp)
145444f54:     	movb	%cl, 0x28(%rsp)
145444f58:     	movb	%al, 0x20(%rsp)
145444f5c:     	leaq	0x1600(%rbp), %rbx
145444f63:     	movq	%rbx, %rcx
145444f66:     	callq	0x145463d10 <.text+0x5462d10>
145444f6b:     	jmp	0x145444347 <.text+0x5443347>
145444f70:     	movzbl	0x1(%rbx), %edx
145444f74:     	shll	$0x8, %edx
145444f77:     	cmpq	$0x3, %r12
145444f7b:     	jb	0x145444f96 <.text+0x5443f96>
145444f7d:     	movzbl	0x2(%rbx), %eax
145444f81:     	shll	$0x10, %eax
145444f84:     	cmpq	$0x3, %r12
145444f88:     	je	0x145444f96 <.text+0x5443f96>
145444f8a:     	movzbl	0x3(%rbx), %r8d
145444f8f:     	shll	$0x18, %r8d
145444f93:     	orl	%r8d, %eax
145444f96:     	orl	%edx, %eax
145444f98:     	movzbl	%cl, %r13d
145444f9c:     	orl	%eax, %r13d
145444f9f:     	leaq	0x1600(%rbp), %rcx
145444fa6:     	movl	%r13d, %edx
145444fa9:     	callq	0x14546f110 <.text+0x546e110>
145444fae:     	cmpq	$-0x1, 0x1600(%rbp)
145444fb6:     	je	0x1454450e6 <.text+0x54440e6>
145444fbc:     	movq	0x1600(%rbp), %rbx
145444fc3:     	movq	0x1608(%rbp), %rax
145444fca:     	movq	%rax, 0x2350(%rbp)
145444fd1:     	movq	0x1610(%rbp), %rax
145444fd8:     	movq	%rax, 0x2358(%rbp)
145444fdf:     	movq	0x1618(%rbp), %r12
145444fe6:     	movq	0x1620(%rbp), %r14
145444fed:     	movq	0x1628(%rbp), %rcx
145444ff4:     	movq	0x1630(%rbp), %r15
145444ffb:     	movl	0x1650(%rbp), %edi
145445001:     	movl	0x1654(%rbp), %eax
145445007:     	movl	%eax, 0x2320(%rbp)
14544500d:     	movl	0x1658(%rbp), %eax
145445013:     	movl	%eax, 0x2388(%rbp)
145445019:     	movl	0x165c(%rbp), %eax
14544501f:     	movl	%eax, 0x2360(%rbp)
145445025:     	movsd	0x1660(%rbp), %xmm6
14544502d:     	movq	%rcx, 0x2370(%rbp)
145445034:     	leaq	(%r14,%rcx,8), %r8
145445038:     	leaq	0x1a0(%rbp), %rcx
14544503f:     	movq	%r14, %rdx
145445042:     	callq	0x1455356b0 <.text+0x55346b0>
145445047:     	nop
145445048:     	movl	$0x4, %eax
14544504d:     	cmpq	$0x4, %r15
145445051:     	movq	%rbx, 0x2230(%rbp)
145445058:     	je	0x14544554b <.text+0x544454b>
14544505e:     	cmpq	$0x5, %r15
145445062:     	je	0x145445068 <.text+0x5444068>
145445064:     	leal	0x1(%r15), %eax
145445068:     	movl	%eax, 0x2328(%rbp)
14544506e:     	xorl	%ebx, %ebx
145445070:     	movl	$0x0, %eax
145445075:     	cmpl	$0x4, 0x2388(%rbp)
14544507c:     	jne	0x145445755 <.text+0x5444755>
145445082:     	decl	%edi
145445084:     	cmpl	$0x1869f, %edi          # imm = 0x1869F
14544508a:     	jb	0x145445755 <.text+0x5444755>
145445090:     	movaps	0x12f8e29(%rip), %xmm0  # 0x14673dec0
145445097:     	movaps	%xmm0, 0xb60(%rbp)
14544509e:     	movl	$0x42200000, 0xb70(%rbp) # imm = 0x42200000
1454450a8:     	movl	0x2360(%rbp), %ecx
1454450ae:     	cmpl	$0x4, %ecx
1454450b1:     	movl	$0x4, %eax
1454450b6:     	cmovbl	%ecx, %eax
1454450b9:     	cmpl	$0x6, %ecx
1454450bc:     	jne	0x14544570e <.text+0x544470e>
1454450c2:     	cmpq	$0x6, %r15
1454450c6:     	jae	0x1454487a6 <.text+0x54477a6>
1454450cc:     	leaq	0x158d7b9(%rip), %rax   # 0x1469d288c
1454450d3:     	movss	(%rax,%r15,4), %xmm0
1454450d9:     	mulss	0x59f9a3(%rip), %xmm0   # 0x1459e4a84
1454450e1:     	jmp	0x145445736 <.text+0x5444736>
1454450e6:     	cmpl	$0x2, 0x10(%rsi)
1454450ea:     	movq	0x2380(%rbp), %rdi
1454450f1:     	jne	0x1454455fd <.text+0x54445fd>
1454450f7:     	leaq	0x2040(%rbp), %rcx
1454450fe:     	movl	%r13d, %edx
145445101:     	callq	0x14545e2e0 <.text+0x545d2e0>
145445106:     	jmp	0x1454459a2 <.text+0x54449a2>
14544510b:     	movzbl	0x1(%rbx), %eax
14544510f:     	shll	$0x8, %eax
145445112:     	xorl	%edx, %edx
145445114:     	cmpq	$0x3, %r12
145445118:     	jae	0x1454459bf <.text+0x54449bf>
14544511e:     	xorl	%r8d, %r8d
145445121:     	xorl	%r9d, %r9d
145445124:     	xorl	%r10d, %r10d
145445127:     	orl	%r10d, %r9d
14544512a:     	orl	%edx, %eax
14544512c:     	movzbl	%r8b, %edx
145445130:     	orl	%r9d, %edx
145445133:     	movzbl	%cl, %ecx
145445136:     	orl	%eax, %ecx
145445138:     	shlq	$0x20, %rdx
14544513c:     	orq	%rcx, %rdx
14544513f:     	movq	%rdx, 0xfc8(%rsi)
145445146:     	cmpq	0xf80(%rsi), %rdx
14544514d:     	jne	0x145447a82 <.text+0x5446a82>
145445153:     	movq	%rsi, %rcx
145445156:     	cmpl	$0x2, 0x10(%rsi)
14544515a:     	je	0x145447a82 <.text+0x5446a82>
145445160:     	addq	$0x10, %rcx
145445164:     	movaps	0x23a0(%rbp), %xmm6
14544516b:     	movaps	0x23b0(%rbp), %xmm7
145445172:     	addq	$0x2448, %rsp           # imm = 0x2448
145445179:     	popq	%rbx
14544517a:     	popq	%rdi
14544517b:     	popq	%rsi
14544517c:     	popq	%r12
14544517e:     	popq	%r13
145445180:     	popq	%r14
145445182:     	popq	%r15
145445184:     	popq	%rbp
145445185:     	jmp	0x1454f9bd0 <.text+0x54f8bd0>
14544518a:     	movzbl	0x1(%rbx), %edx
14544518e:     	shll	$0x8, %edx
145445191:     	cmpq	$0x3, %r12
145445195:     	jb	0x1454451b0 <.text+0x54441b0>
145445197:     	movzbl	0x2(%rbx), %eax
14544519b:     	shll	$0x10, %eax
14544519e:     	cmpq	$0x3, %r12
1454451a2:     	je	0x1454451b0 <.text+0x54441b0>
1454451a4:     	movzbl	0x3(%rbx), %r8d
1454451a9:     	shll	$0x18, %r8d
1454451ad:     	orl	%r8d, %eax
1454451b0:     	orl	%edx, %eax
1454451b2:     	movzbl	%cl, %edx
1454451b5:     	orl	%eax, %edx
1454451b7:     	leaq	0x1600(%rbp), %rbx
1454451be:     	movq	%rbx, %rcx
1454451c1:     	movb	$0x17, %r8b
1454451c4:     	callq	0x14545a870 <.text+0x5459870>
1454451c9:     	movq	0xa08(%rsi), %rcx
1454451d0:     	movq	0xa10(%rsi), %rdx
1454451d7:     	movq	%rdi, %r8
1454451da:     	movq	%rbx, %r9
1454451dd:     	callq	0x14543f3c0 <.text+0x543e3c0>
1454451e2:     	cmpl	$0x2, 0x10(%rsi)
1454451e6:     	je	0x145447a82 <.text+0x5446a82>
1454451ec:     	movq	%rsi, %rcx
1454451ef:     	movzbl	0x9c9(%rsi), %eax
1454451f6:     	addq	$0x10, %rcx
1454451fa:     	leal	-0x4(%rax), %edx
1454451fd:     	cmpl	$0x2, %edx
145445200:     	jae	0x1454453cb <.text+0x54443cb>
145445206:     	callq	0x1454f0640 <.text+0x54ef640>
14544520b:     	jmp	0x145447a82 <.text+0x5446a82>
145445210:     	xorl	%eax, %eax
145445212:     	xorl	%r8d, %r8d
145445215:     	xorl	%edi, %edi
145445217:     	jmp	0x145445372 <.text+0x5444372>
14544521c:     	movzbl	0x1(%rbx), %r15d
145445221:     	shll	$0x8, %r15d
145445225:     	cmpq	$0x3, %r12
145445229:     	jb	0x145445241 <.text+0x5444241>
14544522b:     	movzbl	0x2(%rbx), %edi
14544522f:     	shll	$0x10, %edi
145445232:     	cmpq	$0x3, %r12
145445236:     	je	0x145445241 <.text+0x5444241>
145445238:     	movzbl	0x3(%rbx), %eax
14544523c:     	shll	$0x18, %eax
14544523f:     	orl	%eax, %edi
145445241:     	callq	0x140002200 <.text+0x1200>
145445246:     	movl	$0x20, %ecx
14544524b:     	movl	$0x1, %edx
145445250:     	callq	0x1400021c0 <.text+0x11c0>
145445255:     	testq	%rax, %rax
145445258:     	je	0x1454482f0 <.text+0x54472f0>
14544525e:     	movzbl	%r14b, %ecx
145445262:     	orl	%r15d, %edi
145445265:     	orl	%ecx, %edi
145445267:     	movl	%edi, (%rax)
145445269:     	movq	$0x20, 0x1600(%rbp)
145445274:     	movq	%rax, 0x1608(%rbp)
14544527b:     	movq	$0x4, 0x1610(%rbp)
145445286:     	movw	$0x1dd, 0x1618(%rbp)    # imm = 0x1DD
14544528f:     	jmp	0x145447a65 <.text+0x5446a65>
145445294:     	movzbl	0x1(%rbx), %ecx
145445298:     	shll	$0x8, %ecx
14544529b:     	cmpq	$0x3, %r12
14544529f:     	jb	0x1454452ba <.text+0x54442ba>
1454452a1:     	movzbl	0x2(%rbx), %edx
1454452a5:     	shll	$0x10, %edx
1454452a8:     	cmpq	$0x3, %r12
1454452ac:     	je	0x1454452ba <.text+0x54442ba>
1454452ae:     	movzbl	0x3(%rbx), %r8d
1454452b3:     	shll	$0x18, %r8d
1454452b7:     	orl	%r8d, %edx
1454452ba:     	cmpl	$0x2, 0x10(%rsi)
1454452be:     	je	0x145447a82 <.text+0x5446a82>
1454452c4:     	movq	%rsi, %r8
1454452c7:     	movzbl	%al, %eax
1454452ca:     	orl	%ecx, %edx
1454452cc:     	orl	%eax, %edx
1454452ce:     	cmpl	%edx, 0x860(%rsi)
1454452d4:     	jne	0x145447a82 <.text+0x5446a82>
1454452da:     	movq	%r8, %rsi
1454452dd:     	movq	0x870(%r8), %r8
1454452e4:     	movq	0x878(%rsi), %r9
1454452eb:     	leaq	0x1600(%rbp), %rbx
1454452f2:     	movq	%rbx, %rcx
1454452f5:     	callq	0x14545e340 <.text+0x545d340>
1454452fa:     	jmp	0x145444347 <.text+0x5443347>
1454452ff:     	xorl	%ecx, %ecx
145445301:     	xorl	%edx, %edx
145445303:     	xorl	%r8d, %r8d
145445306:     	movl	$0x1, %ebx
14544530b:     	movq	%r12, %r9
14544530e:     	subq	$0x4, %r9
145445312:     	cmovbq	%rax, %r9
145445316:     	addq	$0x4, %rbx
14544531a:     	cmpq	$0x1, %r9
14544531e:     	cmoveq	%r9, %rbx
145445322:     	cmpq	$0x4, %r9
145445326:     	cmovbq	%r11, %rbx
14544532a:     	cmpq	$0x5, %r12
14544532e:     	cmovbq	%r11, %rbx
145445332:     	movq	%r12, %r9
145445335:     	subq	$0x8, %r9
145445339:     	cmovbq	%rax, %r9
14544533d:     	ja	0x145445349 <.text+0x5444349>
14544533f:     	xorl	%r10d, %r10d
145445342:     	xorl	%edi, %edi
145445344:     	jmp	0x14544558d <.text+0x544458d>
145445349:     	movzbl	(%rbx), %r10d
14544534d:     	cmpq	$0x1, %r9
145445351:     	jne	0x14544555d <.text+0x544455d>
145445357:     	xorl	%edi, %edi
145445359:     	jmp	0x14544558d <.text+0x544458d>
14544535e:     	movzbl	0x1(%rbx), %eax
145445362:     	shll	$0x8, %eax
145445365:     	xorl	%r8d, %r8d
145445368:     	cmpq	$0x3, %r12
14544536c:     	jae	0x1454459dd <.text+0x54449dd>
145445372:     	xorl	%edx, %edx
145445374:     	xorl	%r9d, %r9d
145445377:     	xorl	%r10d, %r10d
14544537a:     	cmpl	$0x2, 0x10(%rsi)
14544537e:     	je	0x145447a82 <.text+0x5446a82>
145445384:     	movq	%rsi, %rcx
145445387:     	addq	$0x10, %rcx
14544538b:     	movzbl	%dl, %edx
14544538e:     	orl	%r10d, %r9d
145445391:     	orl	%edx, %r9d
145445394:     	shlq	$0x20, %r9
145445398:     	orl	%eax, %r8d
14544539b:     	movzbl	%dil, %edx
14544539f:     	orl	%r8d, %edx
1454453a2:     	orq	%r9, %rdx
1454453a5:     	movaps	0x23a0(%rbp), %xmm6
1454453ac:     	movaps	0x23b0(%rbp), %xmm7
1454453b3:     	addq	$0x2448, %rsp           # imm = 0x2448
1454453ba:     	popq	%rbx
1454453bb:     	popq	%rdi
1454453bc:     	popq	%rsi
1454453bd:     	popq	%r12
1454453bf:     	popq	%r13
1454453c1:     	popq	%r14
1454453c3:     	popq	%r15
1454453c5:     	popq	%rbp
1454453c6:     	jmp	0x1454d2760 <.text+0x54d1760>
1454453cb:     	cmpl	$0x2, %eax
1454453ce:     	jne	0x145447a82 <.text+0x5446a82>
1454453d4:     	callq	0x1454ee470 <.text+0x54ed470>
1454453d9:     	jmp	0x145447a82 <.text+0x5446a82>
1454453de:     	movzbl	(%rbx), %eax
1454453e1:     	cmpq	$0x1, %rdx
1454453e5:     	jne	0x145445a55 <.text+0x5444a55>
1454453eb:     	xorl	%ecx, %ecx
1454453ed:     	jmp	0x145445a7e <.text+0x5444a7e>
1454453f2:     	movq	%rsi, 0x2368(%rbp)
1454453f9:     	movq	0x30(%rbx,%r15), %rax
1454453fe:     	movq	%rax, 0x1620(%rbp)
145445405:     	movdqu	0x10(%rbx,%r15), %xmm0
14544540c:     	movups	0x20(%rbx,%r15), %xmm1
145445412:     	movaps	%xmm1, 0x1610(%rbp)
145445419:     	movdqa	%xmm0, 0x1600(%rbp)
145445421:     	movq	%r13, 0x2200(%rbp)
145445428:     	movdqu	%xmm0, 0x2208(%rbp)
145445430:     	movups	%xmm1, 0x2218(%rbp)
145445437:     	movq	%rax, 0x2228(%rbp)
14544543e:     	movq	%rdx, %r12
145445441:     	movq	%rdx, 0x21f8(%rbp)
145445448:     	leaq	-0x38(%r14), %rax
14544544c:     	cmpq	%r15, %rax
14544544f:     	movq	0x2380(%rbp), %rdi
145445456:     	je	0x1454454a2 <.text+0x54444a2>
145445458:     	subq	%r15, %r14
14544545b:     	addq	$-0x38, %r14
14544545f:     	leaq	(%rbx,%r15), %rsi
145445463:     	addq	$0x40, %rsi
145445467:     	shrq	$0x3, %r14
14544546b:     	movabsq	$0x2492492492492493, %rcx # imm = 0x2492492492492493
145445475:     	movq	%r14, %rax
145445478:     	mulq	%rcx
14544547b:     	movq	%rdx, %r14
14544547e:     	jmp	0x145445489 <.text+0x5444489>
145445480:     	addq	$0x38, %rsi
145445484:     	decq	%r14
145445487:     	je	0x1454454a2 <.text+0x54444a2>
145445489:     	movq	-0x8(%rsi), %rdx
14544548d:     	testq	%rdx, %rdx
145445490:     	je	0x145445480 <.text+0x5444480>
145445492:     	movq	(%rsi), %rcx
145445495:     	movl	$0x1, %r8d
14544549b:     	callq	0x1400021d0 <.text+0x11d0>
1454454a0:     	jmp	0x145445480 <.text+0x5444480>
1454454a2:     	movq	0x2350(%rbp), %rax
1454454a9:     	testq	%rax, %rax
1454454ac:     	je	0x1454454c0 <.text+0x54444c0>
1454454ae:     	imulq	$0x38, %rax, %rdx
1454454b2:     	movl	$0x8, %r8d
1454454b8:     	movq	%rbx, %rcx
1454454bb:     	callq	0x1400021d0 <.text+0x11d0>
1454454c0:     	movq	0x2368(%rbp), %rsi
1454454c7:     	movq	0xa10(%rsi), %rdx
1454454ce:     	cmpq	%rdx, %rdi
1454454d1:     	movq	%r12, 0x2360(%rbp)
1454454d8:     	movq	%r13, 0x2320(%rbp)
1454454df:     	jae	0x14544875f <.text+0x544775f>
1454454e5:     	movq	0xa08(%rsi), %rcx
1454454ec:     	imulq	$0xb0, %rdi, %rax
1454454f3:     	movb	$0x1, 0xa8(%rcx,%rax)
1454454fb:     	movq	0x2210(%rbp), %r14
145445502:     	movq	%r14, 0xf80(%rsi)
145445509:     	cmpb	$0x0, 0x1041(%rsi)
145445510:     	je	0x145445ac5 <.text+0x5444ac5>
145445516:     	movq	0xc08(%rsi), %rcx
14544551d:     	movq	0xc10(%rsi), %rdx
145445524:     	callq	0x145420480 <.text+0x541f480>
145445529:     	imulq	$0xf0, %rax, %rax
145445530:     	leaq	0x12edfe1(%rip), %rdx   # 0x146733518
145445537:     	leaq	(%rax,%rdx), %rcx
14544553b:     	addq	$0x8, %rcx
14544553f:     	addq	%rdx, %rax
145445542:     	addq	$0x10, %rax
145445546:     	jmp	0x145445af0 <.text+0x5444af0>
14544554b:     	cmpl	$0x2, 0x2388(%rbp)
145445552:     	je	0x145445064 <.text+0x5444064>
145445558:     	jmp	0x145445068 <.text+0x5444068>
14544555d:     	movzbl	0x1(%rbx), %edi
145445561:     	shll	$0x8, %edi
145445564:     	cmpq	$0x3, %r9
145445568:     	jb	0x14544558d <.text+0x544458d>
14544556a:     	movzbl	0x2(%rbx), %eax
14544556e:     	shll	$0x10, %eax
145445571:     	cmpq	$0x3, %r9
145445575:     	je	0x14544558d <.text+0x544458d>
145445577:     	movzbl	0x3(%rbx), %r9d
14544557c:     	shll	$0x18, %r9d
145445580:     	orl	%eax, %r9d
145445583:     	addq	$0x4, %rbx
145445587:     	movl	%r9d, %eax
14544558a:     	movq	%rbx, %r11
14544558d:     	xorl	%r9d, %r9d
145445590:     	movq	%r12, %rbx
145445593:     	subq	$0xc, %rbx
145445597:     	movl	$0x0, %esi
14544559c:     	cmovaeq	%rbx, %rsi
1454455a0:     	movzbl	%r10b, %ebx
1454455a4:     	orl	%edi, %eax
1454455a6:     	movl	$0x1, %edi
1454455ab:     	movl	$0x0, %r14d
1454455b1:     	movl	$0x0, %r10d
1454455b7:     	movl	$0x0, %r13d
1454455bd:     	movl	$0x1, %r15d
1454455c3:     	cmpq	$0xd, %r12
1454455c7:     	jb	0x145446394 <.text+0x5445394>
1454455cd:     	movzbl	(%r11), %r14d
1454455d1:     	cmpq	$0x1, %rsi
1454455d5:     	jne	0x1454455e2 <.text+0x54445e2>
1454455d7:     	xorl	%r10d, %r10d
1454455da:     	xorl	%r13d, %r13d
1454455dd:     	jmp	0x145446394 <.text+0x5445394>
1454455e2:     	movzbl	0x1(%r11), %r13d
1454455e7:     	shll	$0x8, %r13d
1454455eb:     	cmpq	$0x3, %rsi
1454455ef:     	jae	0x145446373 <.text+0x5445373>
1454455f5:     	xorl	%r10d, %r10d
1454455f8:     	jmp	0x145446394 <.text+0x5445394>
1454455fd:     	movq	0x2f0(%rsi), %rax
145445604:     	movq	0x2f8(%rsi), %rcx
14544560b:     	shlq	$0x3, %rcx
14544560f:     	leaq	(%rcx,%rcx,8), %rdx
145445613:     	xorl	%ecx, %ecx
145445615:     	movq	%rax, %r8
145445618:     	cmpq	%rcx, %rdx
14544561b:     	je	0x1454450f7 <.text+0x54440f7>
145445621:     	addq	$0x48, %rcx
145445625:     	cmpl	%r13d, 0x38(%r8)
145445629:     	leaq	0x48(%r8), %r8
14544562d:     	jne	0x145445618 <.text+0x5444618>
14544562f:     	movl	-0x4(%rax,%rcx), %edx
145445633:     	movups	-0x40(%rax,%rcx), %xmm0
145445638:     	movups	-0x28(%rax,%rcx), %xmm1
14544563d:     	movl	%r13d, 0xb90(%rbp)
145445644:     	movq	$0x4, 0xb94(%rbp)
14544564f:     	movups	%xmm0, 0xb60(%rbp)
145445656:     	movq	-0xc(%rax,%rcx), %rax
14544565b:     	movl	%edx, 0xb9c(%rbp)
145445661:     	movq	%rax, 0xba0(%rbp)
145445668:     	movq	$0x0, 0xba8(%rbp)
145445673:     	movl	$0x0, 0xbb0(%rbp)
14544567d:     	movups	%xmm1, 0xb70(%rbp)
145445684:     	movq	$0x1, 0xb80(%rbp)
14544568f:     	movq	$0x0, 0xb88(%rbp)
14544569a:     	leaq	0x2040(%rbp), %rcx
1454456a1:     	leaq	0xb60(%rbp), %rdx
1454456a8:     	callq	0x145460510 <.text+0x545f510>
1454456ad:     	jmp	0x1454459a2 <.text+0x54449a2>
1454456b2:     	movzbl	0x2(%rbx), %eax
1454456b6:     	shll	$0x10, %eax
1454456b9:     	cmpq	$0x3, %r12
1454456bd:     	jne	0x14544662a <.text+0x544562a>
1454456c3:     	movl	$0x0, 0x2370(%rbp)
1454456cd:     	movl	%eax, %r13d
1454456d0:     	jmp	0x145444d2d <.text+0x5443d2d>
1454456d5:     	movzbl	0x2(%rbx), %ecx
1454456d9:     	shll	$0x10, %ecx
1454456dc:     	xorl	%r9d, %r9d
1454456df:     	cmpq	$0x3, %r12
1454456e3:     	jne	0x145446651 <.text+0x5445651>
1454456e9:     	movl	%ecx, %r8d
1454456ec:     	jmp	0x145444e17 <.text+0x5443e17>
1454456f1:     	movzbl	0x2(%rbx), %r9d
1454456f6:     	shll	$0x10, %r9d
1454456fa:     	xorl	%edx, %edx
1454456fc:     	cmpq	$0x3, %r12
145445700:     	jne	0x145446672 <.text+0x5445672>
145445706:     	movl	%r9d, %r8d
145445709:     	jmp	0x145444ef9 <.text+0x5443ef9>
14544570e:     	cmpq	$0x6, %r15
145445712:     	jae	0x1454487bd <.text+0x54477bd>
145445718:     	movss	0xb60(%rbp,%rax,4), %xmm0
145445721:     	leaq	0x158d164(%rip), %rax   # 0x1469d288c
145445728:     	mulss	(%rax,%r15,4), %xmm0
14544572e:     	mulss	0x4c1dd2(%rip), %xmm0   # 0x145907508
145445736:     	cvttss2si	%xmm0, %rax
14544573b:     	xorl	%ecx, %ecx
14544573d:     	xorps	%xmm1, %xmm1
145445740:     	ucomiss	%xmm1, %xmm0
145445743:     	cmovael	%eax, %ecx
145445746:     	ucomiss	0x4c1ddf(%rip), %xmm0   # 0x14590752c
14544574d:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
145445752:     	cmovbel	%ecx, %eax
145445755:     	movl	%eax, 0x2318(%rbp)
14544575b:     	movq	%r12, 0x2238(%rbp)
145445762:     	movq	0x2370(%rbp), %r15
145445769:     	testq	%r15, %r15
14544576c:     	je	0x14544584c <.text+0x544484c>
145445772:     	xorl	%eax, %eax
145445774:     	cmpq	$0x1, %r15
145445778:     	jne	0x145445784 <.text+0x5444784>
14544577a:     	xorl	%r12d, %r12d
14544577d:     	xorl	%ebx, %ebx
14544577f:     	jmp	0x14544581a <.text+0x544481a>
145445784:     	movq	%rsi, 0x2368(%rbp)
14544578b:     	andq	$-0x2, %r15
14544578f:     	xorl	%edi, %edi
145445791:     	movss	0x59fa47(%rip), %xmm7   # 0x1459e51e0
145445799:     	xorl	%r12d, %r12d
14544579c:     	xorl	%ebx, %ebx
14544579e:     	jmp	0x1454457b3 <.text+0x54447b3>
1454457a0:     	ucomiss	%xmm0, %xmm0
1454457a3:     	cmovpl	%edi, %eax
1454457a6:     	addl	%esi, %ebx
1454457a8:     	addl	%eax, %ebx
1454457aa:     	addq	$0x2, %r12
1454457ae:     	cmpq	%r12, %r15
1454457b1:     	je	0x145445805 <.text+0x5444805>
1454457b3:     	cmpl	$0x2, (%r14,%r12,8)
1454457b8:     	movl	$0x0, %esi
1454457bd:     	jne	0x1454457df <.text+0x54447df>
1454457bf:     	movss	0x4(%r14,%r12,8), %xmm0
1454457c6:     	callq	0x14577322f <.text+0x577222f>
1454457cb:     	ucomiss	%xmm7, %xmm0
1454457ce:     	movl	$0x7fffffff, %esi       # imm = 0x7FFFFFFF
1454457d3:     	ja	0x1454457d9 <.text+0x54447d9>
1454457d5:     	cvttss2si	%xmm0, %esi
1454457d9:     	ucomiss	%xmm0, %xmm0
1454457dc:     	cmovpl	%edi, %esi
1454457df:     	xorl	%eax, %eax
1454457e1:     	cmpl	$0x2, 0x8(%r14,%r12,8)
1454457e7:     	jne	0x1454457a6 <.text+0x54447a6>
1454457e9:     	movss	0xc(%r14,%r12,8), %xmm0
1454457f0:     	callq	0x14577322f <.text+0x577222f>
1454457f5:     	ucomiss	%xmm7, %xmm0
1454457f8:     	movl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
1454457fd:     	ja	0x1454457a0 <.text+0x54447a0>
1454457ff:     	cvttss2si	%xmm0, %eax
145445803:     	jmp	0x1454457a0 <.text+0x54447a0>
145445805:     	testb	$0x1, 0x2370(%rbp)
14544580c:     	movq	0x2368(%rbp), %rsi
145445813:     	movl	$0x0, %eax
145445818:     	je	0x14544584c <.text+0x544484c>
14544581a:     	cmpl	$0x2, (%r14,%r12,8)
14544581f:     	jne	0x145445848 <.text+0x5444848>
145445821:     	movss	0x4(%r14,%r12,8), %xmm0
145445828:     	callq	0x14577322f <.text+0x577222f>
14544582d:     	cvttss2si	%xmm0, %eax
145445831:     	ucomiss	0x59f9a8(%rip), %xmm0   # 0x1459e51e0
145445838:     	movl	$0x7fffffff, %ecx       # imm = 0x7FFFFFFF
14544583d:     	cmovbel	%eax, %ecx
145445840:     	xorl	%eax, %eax
145445842:     	ucomiss	%xmm0, %xmm0
145445845:     	cmovnpl	%ecx, %eax
145445848:     	addl	%ebx, %eax
14544584a:     	movl	%eax, %ebx
14544584c:     	movq	%rsi, %r12
14544584f:     	movq	0x1a8(%rbp), %r15
145445856:     	movq	0x1b0(%rbp), %rdi
14544585d:     	movl	%r13d, 0xb90(%rbp)
145445864:     	movl	0x2388(%rbp), %eax
14544586a:     	movl	%eax, 0xb94(%rbp)
145445870:     	movl	0x2360(%rbp), %eax
145445876:     	movl	%eax, 0xb98(%rbp)
14544587c:     	movq	0x2350(%rbp), %r13
145445883:     	movq	%r13, 0xb60(%rbp)
14544588a:     	movq	0x2358(%rbp), %rax
145445891:     	movq	%rax, 0xb68(%rbp)
145445898:     	movl	0x2320(%rbp), %eax
14544589e:     	movl	%eax, 0xb9c(%rbp)
1454458a4:     	movl	0x2328(%rbp), %eax
1454458aa:     	movl	%eax, 0xba0(%rbp)
1454458b0:     	movlps	%xmm6, 0xba4(%rbp)
1454458b7:     	movl	0x2318(%rbp), %eax
1454458bd:     	movl	%eax, 0xbac(%rbp)
1454458c3:     	movl	%ebx, 0xbb0(%rbp)
1454458c9:     	movq	%r15, 0xb70(%rbp)
1454458d0:     	movq	%rdi, 0xb78(%rbp)
1454458d7:     	movq	$0x1, 0xb80(%rbp)
1454458e2:     	movq	$0x0, 0xb88(%rbp)
1454458ed:     	leaq	0x2040(%rbp), %rcx
1454458f4:     	leaq	0xb60(%rbp), %rdx
1454458fb:     	callq	0x145460510 <.text+0x545f510>
145445900:     	nop
145445901:     	testq	%rdi, %rdi
145445904:     	movq	0x2230(%rbp), %rbx
14544590b:     	je	0x145445942 <.text+0x5444942>
14544590d:     	leaq	0x8(%r15), %rsi
145445911:     	jmp	0x145445929 <.text+0x5444929>
145445913:     	nopw	%cs:(%rax,%rax)
145445920:     	addq	$0x18, %rsi
145445924:     	decq	%rdi
145445927:     	je	0x145445942 <.text+0x5444942>
145445929:     	movq	-0x8(%rsi), %rdx
14544592d:     	testq	%rdx, %rdx
145445930:     	je	0x145445920 <.text+0x5444920>
145445932:     	movq	(%rsi), %rcx
145445935:     	movl	$0x1, %r8d
14544593b:     	callq	0x1400021d0 <.text+0x11d0>
145445940:     	jmp	0x145445920 <.text+0x5444920>
145445942:     	movq	0x1a0(%rbp), %rax
145445949:     	testq	%rax, %rax
14544594c:     	je	0x145445964 <.text+0x5444964>
14544594e:     	shlq	$0x3, %rax
145445952:     	leaq	(%rax,%rax,2), %rdx
145445956:     	movl	$0x8, %r8d
14544595c:     	movq	%r15, %rcx
14544595f:     	callq	0x1400021d0 <.text+0x11d0>
145445964:     	testq	%rbx, %rbx
145445967:     	movq	%r12, %rsi
14544596a:     	movq	0x2380(%rbp), %rdi
145445971:     	je	0x145445984 <.text+0x5444984>
145445973:     	movl	$0x1, %r8d
145445979:     	movq	%r13, %rcx
14544597c:     	movq	%rbx, %rdx
14544597f:     	callq	0x1400021d0 <.text+0x11d0>
145445984:     	movq	0x2238(%rbp), %rdx
14544598b:     	testq	%rdx, %rdx
14544598e:     	je	0x1454459a2 <.text+0x54449a2>
145445990:     	shlq	$0x3, %rdx
145445994:     	movl	$0x4, %r8d
14544599a:     	movq	%r14, %rcx
14544599d:     	callq	0x1400021d0 <.text+0x11d0>
1454459a2:     	movq	0xa08(%rsi), %rcx
1454459a9:     	movq	0xa10(%rsi), %rdx
1454459b0:     	leaq	0x2040(%rbp), %r9
1454459b7:     	movq	%rdi, %r8
1454459ba:     	jmp	0x145447a7d <.text+0x5446a7d>
1454459bf:     	movzbl	0x2(%rbx), %r9d
1454459c4:     	shll	$0x10, %r9d
1454459c8:     	xorl	%r8d, %r8d
1454459cb:     	cmpq	$0x3, %r12
1454459cf:     	jne	0x145446692 <.text+0x5445692>
1454459d5:     	movl	%r9d, %edx
1454459d8:     	jmp	0x145445121 <.text+0x5444121>
1454459dd:     	movzbl	0x2(%rbx), %r9d
1454459e2:     	shll	$0x10, %r9d
1454459e6:     	xorl	%edx, %edx
1454459e8:     	cmpq	$0x3, %r12
1454459ec:     	jne	0x1454466b1 <.text+0x54456b1>
1454459f2:     	movl	%r9d, %r8d
1454459f5:     	jmp	0x145445374 <.text+0x5444374>
1454459fa:     	movzbl	0x2(%rbx), %edx
1454459fe:     	shll	$0x10, %edx
145445a01:     	cmpq	$0x3, %r12
145445a05:     	je	0x145445306 <.text+0x5444306>
145445a0b:     	movzbl	0x3(%rbx), %r9d
145445a10:     	shll	$0x18, %r9d
145445a14:     	orl	%r9d, %edx
145445a17:     	addq	$0x4, %rbx
145445a1b:     	jmp	0x14544530b <.text+0x544430b>
145445a20:     	leal	-0x258(%rbx), %eax
145445a26:     	cmpl	$0x5d, %eax
145445a29:     	ja	0x1454469c1 <.text+0x54459c1>
145445a2f:     	leaq	0x12edae2(%rip), %r15   # 0x146733518
145445a36:     	leaq	0x12f914f(%rip), %rcx   # 0x14673eb8c
145445a3d:     	movslq	(%rcx,%rax,4), %rax
145445a41:     	addq	%rcx, %rax
145445a44:     	jmpq	*%rax
145445a46:     	movq	%rsi, %rdi
145445a49:     	leaq	0x12e60e0(%rip), %r14   # 0x14672bb30
145445a50:     	jmp	0x145447c19 <.text+0x5446c19>
145445a55:     	movzbl	0x1(%rbx), %ecx
145445a59:     	shll	$0x8, %ecx
145445a5c:     	cmpq	$0x3, %rdx
145445a60:     	jb	0x145445a7e <.text+0x5444a7e>
145445a62:     	movzbl	0x2(%rbx), %r8d
145445a67:     	shll	$0x10, %r8d
145445a6b:     	cmpq	$0x3, %rdx
145445a6f:     	je	0x145445a7e <.text+0x5444a7e>
145445a71:     	movzbl	0x3(%rbx), %edx
145445a75:     	shll	$0x18, %edx
145445a78:     	orl	%r8d, %edx
145445a7b:     	movl	%edx, %r8d
145445a7e:     	cmpl	$0x2, 0x10(%rsi)
145445a82:     	je	0x145447a82 <.text+0x5446a82>
145445a88:     	movq	%rsi, %rdi
145445a8b:     	leaq	0x10(%rsi), %rdx
145445a8f:     	movzbl	%al, %eax
145445a92:     	orl	%ecx, %r8d
145445a95:     	orl	%eax, %r8d
145445a98:     	leaq	0xb8(%rbp), %rcx
145445a9f:     	callq	0x1454f0480 <.text+0x54ef480>
145445aa4:     	cmpl	$-0x1, 0xb8(%rbp)
145445aab:     	je	0x145447a82 <.text+0x5446a82>
145445ab1:     	leaq	0xb8(%rbp), %rdx
145445ab8:     	movq	%rdi, %rcx
145445abb:     	callq	0x14544d470 <.text+0x544c470>
145445ac0:     	jmp	0x145447a82 <.text+0x5446a82>
145445ac5:     	movq	0xa10(%rsi), %rdx
145445acc:     	cmpq	%rdx, %rdi
145445acf:     	jae	0x1454487d4 <.text+0x54477d4>
145445ad5:     	movq	0xa08(%rsi), %rdx
145445adc:     	leaq	(%rdx,%rax), %rcx
145445ae0:     	addq	$0x98, %rcx
145445ae7:     	addq	%rdx, %rax
145445aea:     	addq	$0xa0, %rax
145445af0:     	movq	(%rcx), %r15
145445af3:     	movq	(%rax), %r9
145445af6:     	cmpq	$0xffffff, %r14         # imm = 0xFFFFFF
145445afd:     	movq	%r9, 0x2388(%rbp)
145445b04:     	jne	0x145445b12 <.text+0x5444b12>
145445b06:     	movzbl	0x2229(%rbp), %ebx
145445b0d:     	jmp	0x145445bac <.text+0x5444bac>
145445b12:     	leaq	0xa18(%rsi), %rcx
145445b19:     	movb	0x2229(%rbp), %bl
145445b1f:     	movl	%ebx, %edx
145445b21:     	movq	%r15, %r8
145445b24:     	callq	0x14542e8d0 <.text+0x542d8d0>
145445b29:     	nop
145445b2a:     	testb	%al, %al
145445b2c:     	jne	0x145445bac <.text+0x5444bac>
145445b2e:     	movq	0xa38(%rsi), %rcx
145445b35:     	movq	0xa40(%rsi), %rdx
145445b3c:     	shlq	$0x4, %rdx
145445b40:     	xorl	%eax, %eax
145445b42:     	xorl	%r8d, %r8d
145445b45:     	cmpq	%r8, %rdx
145445b48:     	je	0x145445b73 <.text+0x5444b73>
145445b4a:     	leaq	0x10(%r8), %r9
145445b4e:     	cmpb	%bl, (%rcx,%r8)
145445b52:     	movq	%r9, %r8
145445b55:     	jne	0x145445b45 <.text+0x5444b45>
145445b57:     	movq	-0x8(%rcx,%r9), %rcx
145445b5c:     	cmpq	$0xc, %rcx
145445b60:     	movl	$0xc, %eax
145445b65:     	cmovbq	%rcx, %rax
145445b69:     	decq	%rax
145445b6c:     	testq	%rcx, %rcx
145445b6f:     	cmoveq	%rcx, %rax
145445b73:     	imulq	$0xf0, %rax, %rax
145445b7a:     	leaq	0x12ed997(%rip), %rcx   # 0x146733518
145445b81:     	movq	0x8(%rax,%rcx), %r15
145445b86:     	movq	0x10(%rax,%rcx), %rax
145445b8b:     	movq	%rax, 0x2388(%rbp)
145445b92:     	movq	%rsi, %rcx
145445b95:     	movq	%rdi, %rdx
145445b98:     	callq	0x145450230 <.text+0x544f230>
145445b9d:     	nop
145445b9e:     	movq	%rax, 0xfe8(%rsi)
145445ba5:     	movq	%rdx, 0xff0(%rsi)
145445bac:     	movabsq	$0x5851f42d4c957f2d, %rax # imm = 0x5851F42D4C957F2D
145445bb6:     	imulq	0xff8(%rsi), %rax
145445bbe:     	movabsq	$0x14057b7ef767814f, %rcx # imm = 0x14057B7EF767814F
145445bc8:     	addq	%rax, %rcx
145445bcb:     	movq	%rcx, 0xff8(%rsi)
145445bd2:     	leaq	0xa18(%rsi), %r13
145445bd9:     	movb	0x2228(%rbp), %r12b
145445be0:     	leaq	-0x30(%rbp), %rcx
145445be4:     	movq	%r13, %rdx
145445be7:     	movl	%ebx, %r8d
145445bea:     	movl	%r12d, %r9d
145445bed:     	callq	0x145436120 <.text+0x5435120>
145445bf2:     	nop
145445bf3:     	cmpq	$0xffffff, %r14         # imm = 0xFFFFFF
145445bfa:     	jne	0x145445c1f <.text+0x5444c1f>
145445bfc:     	movq	$0x0, 0x22c8(%rbp)
145445c07:     	movq	$0x8, 0x22d0(%rbp)
145445c12:     	movq	$0x0, 0x22d8(%rbp)
145445c1d:     	jmp	0x145445c32 <.text+0x5444c32>
145445c1f:     	leaq	0x22c8(%rbp), %rcx
145445c26:     	movq	%r13, %rdx
145445c29:     	movl	%ebx, %r8d
145445c2c:     	callq	0x1454303e0 <.text+0x542f3e0>
145445c31:     	nop
145445c32:     	movq	%r15, 0x2370(%rbp)
145445c39:     	movzbl	0x222a(%rbp), %eax
145445c40:     	movb	%al, 0x2350(%rbp)
145445c46:     	movb	$0x1, 0x2394(%rbp)
145445c4d:     	leaq	0x1a0(%rbp), %rcx
145445c54:     	leaq	0x21f8(%rbp), %rdx
145445c5b:     	callq	0x145728850 <.text+0x5727850>
145445c60:     	nop
145445c61:     	movq	0xff8(%rsi), %r15
145445c68:     	movq	0xc18(%rsi), %rax
145445c6f:     	movq	%rax, 0x2358(%rbp)
145445c76:     	cmpq	$0xffffff, %r14         # imm = 0xFFFFFF
145445c7d:     	jne	0x145445c9b <.text+0x5444c9b>
145445c7f:     	movb	$-0x1, 0xb68(%rbp)
145445c86:     	movb	$-0x1, 0xb78(%rbp)
145445c8d:     	pxor	%xmm0, %xmm0
145445c91:     	movdqu	%xmm0, 0xb80(%rbp)
145445c99:     	jmp	0x145445cc7 <.text+0x5444cc7>
145445c9b:     	movq	0x22c8(%rbp), %rax
145445ca2:     	movq	%rax, 0x2328(%rbp)
145445ca9:     	movq	0x22d0(%rbp), %rax
145445cb0:     	movq	%rax, 0x2318(%rbp)
145445cb7:     	leaq	0xb60(%rbp), %rcx
145445cbe:     	movq	%r13, %rdx
145445cc1:     	callq	0x14547ede0 <.text+0x547dde0>
145445cc6:     	nop
145445cc7:     	leaq	0x222b(%rbp), %rax
145445cce:     	leaq	0x68(%rbp), %rdi
145445cd2:     	movzbl	0x4(%rax), %ecx
145445cd6:     	movb	%cl, 0x2064(%rbp)
145445cdc:     	movl	(%rax), %eax
145445cde:     	movl	%eax, 0x2060(%rbp)
145445ce4:     	movups	0x1a0(%rbp), %xmm0
145445ceb:     	movaps	%xmm0, 0x1600(%rbp)
145445cf2:     	movq	0x1b0(%rbp), %rax
145445cf9:     	movq	%rax, 0x1610(%rbp)
145445d00:     	leaq	0x1630(%rbp), %rcx
145445d07:     	leaq	-0x30(%rbp), %rdx
145445d0b:     	movl	$0x98, %r8d
145445d11:     	callq	0x1457731ed <.text+0x57721ed>
145445d16:     	movups	0x22c8(%rbp), %xmm0
145445d1d:     	movups	%xmm0, 0x1618(%rbp)
145445d24:     	movq	0x22d8(%rbp), %rax
145445d2b:     	movq	%rax, 0x1628(%rbp)
145445d32:     	movups	0xb60(%rbp), %xmm0
145445d39:     	movups	0xb70(%rbp), %xmm1
145445d40:     	movups	0xb80(%rbp), %xmm2
145445d47:     	movups	%xmm0, 0x16c8(%rbp)
145445d4e:     	movups	%xmm1, 0x16d8(%rbp)
145445d55:     	movups	%xmm2, 0x16e8(%rbp)
145445d5c:     	leaq	0xb60(%rbp), %rcx
145445d63:     	leaq	0x1600(%rbp), %rdx
145445d6a:     	movl	$0xf8, %r8d
145445d70:     	callq	0x1457731ed <.text+0x57721ed>
145445d75:     	leaq	0xdf8(%rsi), %r13
145445d7c:     	movq	0xdf8(%rsi), %rdx
145445d83:     	cmpq	$-0x1, %rdx
145445d87:     	je	0x145445dc2 <.text+0x5444dc2>
145445d89:     	testq	%rdx, %rdx
145445d8c:     	je	0x145445da0 <.text+0x5444da0>
145445d8e:     	movq	0xe00(%rsi), %rcx
145445d95:     	movl	$0x1, %r8d
145445d9b:     	callq	0x1400021d0 <.text+0x11d0>
145445da0:     	movq	0xe10(%rsi), %rdx
145445da7:     	testq	%rdx, %rdx
145445daa:     	je	0x145445dc2 <.text+0x5444dc2>
145445dac:     	movq	0xe18(%rsi), %rcx
145445db3:     	shlq	$0x4, %rdx
145445db7:     	movl	$0x8, %r8d
145445dbd:     	callq	0x1400021d0 <.text+0x11d0>
145445dc2:     	leaq	0xb60(%rbp), %rdx
145445dc9:     	movl	$0xf8, %r8d
145445dcf:     	movq	%r13, %rcx
145445dd2:     	callq	0x1457731ed <.text+0x57721ed>
145445dd7:     	movq	0x2370(%rbp), %rax
145445dde:     	movq	%rax, 0xef0(%rsi)
145445de5:     	movq	0x2388(%rbp), %rax
145445dec:     	movq	%rax, 0xef8(%rsi)
145445df3:     	movq	%r14, 0xf00(%rsi)
145445dfa:     	movq	%r15, 0xf08(%rsi)
145445e01:     	movq	0x2358(%rbp), %rax
145445e08:     	movq	%rax, 0xf10(%rsi)
145445e0f:     	movups	(%rdi), %xmm0
145445e12:     	movups	0x10(%rdi), %xmm1
145445e16:     	movdqu	0x20(%rdi), %xmm2
145445e1b:     	movups	0x30(%rdi), %xmm3
145445e1f:     	movups	%xmm0, 0xf18(%rsi)
145445e26:     	movups	%xmm1, 0xf28(%rsi)
145445e2d:     	movdqu	%xmm2, 0xf38(%rsi)
145445e35:     	movups	%xmm3, 0xf48(%rsi)
145445e3c:     	movdqu	0x3c(%rdi), %xmm0
145445e41:     	movdqu	%xmm0, 0xf54(%rsi)
145445e49:     	movb	%bl, 0xf64(%rsi)
145445e4f:     	movb	%r12b, 0xf65(%rsi)
145445e56:     	movzbl	0x2350(%rbp), %eax
145445e5d:     	movb	%al, 0xf66(%rsi)
145445e63:     	movzbl	0x2064(%rbp), %eax
145445e6a:     	movb	%al, 0xf6b(%rsi)
145445e70:     	movl	0x2060(%rbp), %eax
145445e76:     	movl	%eax, 0xf67(%rsi)
145445e7c:     	movb	$0x0, 0x2394(%rbp)
145445e83:     	leaq	0x1600(%rbp), %rcx
145445e8a:     	movq	%rsi, %rdx
145445e8d:     	callq	0x14544f710 <.text+0x544e710>
145445e92:     	nop
145445e93:     	cmpl	$0x2, 0x1600(%rbp)
145445e9a:     	jne	0x145445eaf <.text+0x5444eaf>
145445e9c:     	movq	0x2360(%rbp), %rsi
145445ea3:     	movq	0x2320(%rbp), %rdi
145445eaa:     	jmp	0x1454479d3 <.text+0x54469d3>
145445eaf:     	leaq	0x1a0(%rbp), %rcx
145445eb6:     	leaq	0x1600(%rbp), %rdx
145445ebd:     	movl	$0x9c0, %r8d            # imm = 0x9C0
145445ec3:     	callq	0x1457731ed <.text+0x57721ed>
145445ec8:     	movq	$0x0, 0xc68(%rsi)
145445ed3:     	movq	0xc70(%rsi), %rdx
145445eda:     	testq	%rdx, %rdx
145445edd:     	je	0x145445ef1 <.text+0x5444ef1>
145445edf:     	movq	0xc78(%rsi), %rcx
145445ee6:     	movl	$0x1, %r8d
145445eec:     	callq	0x1400021d0 <.text+0x11d0>
145445ef1:     	movq	0xc88(%rsi), %rdx
145445ef8:     	testq	%rdx, %rdx
145445efb:     	je	0x145445f0f <.text+0x5444f0f>
145445efd:     	movq	0xc90(%rsi), %rcx
145445f04:     	movl	$0x1, %r8d
145445f0a:     	callq	0x1400021d0 <.text+0x11d0>
145445f0f:     	movq	0xca0(%rsi), %rdx
145445f16:     	testq	%rdx, %rdx
145445f19:     	je	0x145445f2d <.text+0x5444f2d>
145445f1b:     	movq	0xca8(%rsi), %rcx
145445f22:     	movl	$0x1, %r8d
145445f28:     	callq	0x1400021d0 <.text+0x11d0>
145445f2d:     	movq	0xcb8(%rsi), %rdx
145445f34:     	testq	%rdx, %rdx
145445f37:     	je	0x145445f4b <.text+0x5444f4b>
145445f39:     	movq	0xcc0(%rsi), %rcx
145445f40:     	movl	$0x1, %r8d
145445f46:     	callq	0x1400021d0 <.text+0x11d0>
145445f4b:     	movq	0xcd0(%rsi), %rdx
145445f52:     	testq	%rdx, %rdx
145445f55:     	je	0x145445f69 <.text+0x5444f69>
145445f57:     	movq	0xcd8(%rsi), %rcx
145445f5e:     	movl	$0x1, %r8d
145445f64:     	callq	0x1400021d0 <.text+0x11d0>
145445f69:     	movq	0xce8(%rsi), %rdx
145445f70:     	testq	%rdx, %rdx
145445f73:     	je	0x145445f87 <.text+0x5444f87>
145445f75:     	movq	0xcf0(%rsi), %rcx
145445f7c:     	movl	$0x1, %r8d
145445f82:     	callq	0x1400021d0 <.text+0x11d0>
145445f87:     	movq	0xd00(%rsi), %rdx
145445f8e:     	testq	%rdx, %rdx
145445f91:     	je	0x145445fa5 <.text+0x5444fa5>
145445f93:     	movq	0xd08(%rsi), %rcx
145445f9a:     	movl	$0x1, %r8d
145445fa0:     	callq	0x1400021d0 <.text+0x11d0>
145445fa5:     	movq	0xd18(%rsi), %rdx
145445fac:     	testq	%rdx, %rdx
145445faf:     	je	0x145445fc3 <.text+0x5444fc3>
145445fb1:     	movq	0xd20(%rsi), %rcx
145445fb8:     	movl	$0x1, %r8d
145445fbe:     	callq	0x1400021d0 <.text+0x11d0>
145445fc3:     	movq	0xd30(%rsi), %rdx
145445fca:     	testq	%rdx, %rdx
145445fcd:     	je	0x145445fe1 <.text+0x5444fe1>
145445fcf:     	movq	0xd38(%rsi), %rcx
145445fd6:     	movl	$0x1, %r8d
145445fdc:     	callq	0x1400021d0 <.text+0x11d0>
145445fe1:     	movq	0xd48(%rsi), %rdx
145445fe8:     	testq	%rdx, %rdx
145445feb:     	je	0x145445fff <.text+0x5444fff>
145445fed:     	movq	0xd50(%rsi), %rcx
145445ff4:     	movl	$0x1, %r8d
145445ffa:     	callq	0x1400021d0 <.text+0x11d0>
145445fff:     	movq	0xd60(%rsi), %rdx
145446006:     	testq	%rdx, %rdx
145446009:     	je	0x14544601d <.text+0x544501d>
14544600b:     	movq	0xd68(%rsi), %rcx
145446012:     	movl	$0x1, %r8d
145446018:     	callq	0x1400021d0 <.text+0x11d0>
14544601d:     	movq	0xd78(%rsi), %rdx
145446024:     	testq	%rdx, %rdx
145446027:     	je	0x14544603b <.text+0x544503b>
145446029:     	movq	0xd80(%rsi), %rcx
145446030:     	movl	$0x1, %r8d
145446036:     	callq	0x1400021d0 <.text+0x11d0>
14544603b:     	movq	0xd90(%rsi), %rdx
145446042:     	testq	%rdx, %rdx
145446045:     	je	0x145446059 <.text+0x5445059>
145446047:     	movq	0xd98(%rsi), %rcx
14544604e:     	movl	$0x1, %r8d
145446054:     	callq	0x1400021d0 <.text+0x11d0>
145446059:     	movq	0xda8(%rsi), %rdx
145446060:     	testq	%rdx, %rdx
145446063:     	je	0x145446077 <.text+0x5445077>
145446065:     	movq	0xdb0(%rsi), %rcx
14544606c:     	movl	$0x1, %r8d
145446072:     	callq	0x1400021d0 <.text+0x11d0>
145446077:     	movq	$0x0, 0xc70(%rsi)
145446082:     	movq	$0x1, 0xc78(%rsi)
14544608d:     	pxor	%xmm0, %xmm0
145446091:     	movdqu	%xmm0, 0xc80(%rsi)
145446099:     	movq	$0x1, 0xc90(%rsi)
1454460a4:     	movdqu	%xmm0, 0xc98(%rsi)
1454460ac:     	movq	$0x1, 0xca8(%rsi)
1454460b7:     	movdqu	%xmm0, 0xcb0(%rsi)
1454460bf:     	movq	$0x1, 0xcc0(%rsi)
1454460ca:     	movdqu	%xmm0, 0xcc8(%rsi)
1454460d2:     	movq	$0x1, 0xcd8(%rsi)
1454460dd:     	movdqu	%xmm0, 0xce0(%rsi)
1454460e5:     	movq	$0x1, 0xcf0(%rsi)
1454460f0:     	movdqu	%xmm0, 0xcf8(%rsi)
1454460f8:     	movq	$0x1, 0xd08(%rsi)
145446103:     	movdqu	%xmm0, 0xd10(%rsi)
14544610b:     	movq	$0x1, 0xd20(%rsi)
145446116:     	movdqu	%xmm0, 0xd28(%rsi)
14544611e:     	movq	$0x1, 0xd38(%rsi)
145446129:     	movdqu	%xmm0, 0xd40(%rsi)
145446131:     	movq	$0x1, 0xd50(%rsi)
14544613c:     	movdqu	%xmm0, 0xd58(%rsi)
145446144:     	movq	$0x1, 0xd68(%rsi)
14544614f:     	movdqu	%xmm0, 0xd70(%rsi)
145446157:     	movq	$0x1, 0xd80(%rsi)
145446162:     	movdqu	%xmm0, 0xd88(%rsi)
14544616a:     	movq	$0x1, 0xd98(%rsi)
145446175:     	movdqu	%xmm0, 0xda0(%rsi)
14544617d:     	movq	$0x1, 0xdb0(%rsi)
145446188:     	movq	$0x0, 0xdb8(%rsi)
145446193:     	movq	$0x0, 0xfc8(%rsi)
14544619e:     	leaq	0x2d0(%rbp), %rdx
1454461a5:     	movq	0x3d8(%rbp), %rsi
1454461ac:     	movb	0x43c(%rbp), %dil
1454461b3:     	movb	0x43d(%rbp), %r15b
1454461ba:     	movb	0x43e(%rbp), %r12b
1454461c1:     	movb	$0x1, 0x237f(%rbp)
1454461c8:     	leaq	0xb60(%rbp), %rcx
1454461cf:     	callq	0x145728850 <.text+0x5727850>
1454461d4:     	nop
1454461d5:     	movq	0x3c8(%rbp), %rbx
1454461dc:     	movq	0x3d0(%rbp), %r14
1454461e3:     	movq	0x3e0(%rbp), %r13
1454461ea:     	leaq	0x2e8(%rbp), %rdx
1454461f1:     	leaq	0x1600(%rbp), %rcx
1454461f8:     	callq	0x1403d6110 <.text+0x3d5110>
1454461fd:     	nop
1454461fe:     	leaq	0x300(%rbp), %rdx
145446205:     	movq	0x1610(%rbp), %rax
14544620c:     	movq	%rax, 0x2088(%rbp)
145446213:     	movups	0x1600(%rbp), %xmm0
14544621a:     	movups	%xmm0, 0x2078(%rbp)
145446221:     	movq	0x3e8(%rbp), %rax
145446228:     	movq	%rax, 0x2388(%rbp)
14544622f:     	movups	0x398(%rbp), %xmm0
145446236:     	movups	0x3a8(%rbp), %xmm1
14544623d:     	movups	0x3b8(%rbp), %xmm2
145446244:     	movups	%xmm0, 0x2128(%rbp)
14544624b:     	movups	%xmm1, 0x2138(%rbp)
145446252:     	movups	%xmm2, 0x2148(%rbp)
145446259:     	movq	%rsi, 0x2168(%rbp)
145446260:     	movb	%dil, 0x21cc(%rbp)
145446267:     	movb	%r15b, 0x21cd(%rbp)
14544626e:     	movb	%r12b, 0x21ce(%rbp)
145446275:     	movl	0x43f(%rbp), %eax
14544627b:     	movl	%eax, 0x21cf(%rbp)
145446281:     	movzbl	0x443(%rbp), %eax
145446288:     	movb	%al, 0x21d3(%rbp)
14544628e:     	movq	0xb70(%rbp), %rax
145446295:     	movq	%rax, 0x2070(%rbp)
14544629c:     	movups	0xb60(%rbp), %xmm0
1454462a3:     	movaps	%xmm0, 0x2060(%rbp)
1454462aa:     	movq	%rbx, 0x2158(%rbp)
1454462b1:     	movq	%r14, 0x2160(%rbp)
1454462b8:     	movq	%r13, 0x2170(%rbp)
1454462bf:     	movups	0x42c(%rbp), %xmm0
1454462c6:     	movups	%xmm0, 0x21bc(%rbp)
1454462cd:     	movdqu	0x3f0(%rbp), %xmm0
1454462d5:     	movups	0x400(%rbp), %xmm1
1454462dc:     	movdqu	0x410(%rbp), %xmm2
1454462e4:     	movups	0x420(%rbp), %xmm3
1454462eb:     	movaps	%xmm3, 0x21b0(%rbp)
1454462f2:     	movdqa	%xmm2, 0x21a0(%rbp)
1454462fa:     	movaps	%xmm1, 0x2190(%rbp)
145446301:     	movdqa	%xmm0, 0x2180(%rbp)
145446309:     	leaq	0x2090(%rbp), %rcx
145446310:     	movl	$0x98, %r8d
145446316:     	callq	0x1457731ed <.text+0x57721ed>
14544631b:     	movq	0x2388(%rbp), %rax
145446322:     	movq	%rax, 0x2178(%rbp)
145446329:     	movq	%rbx, %rcx
14544632c:     	movq	%r14, %rdx
14544632f:     	callq	0x145420480 <.text+0x541f480>
145446334:     	movq	%rax, %rbx
145446337:     	movq	0x5a0(%rbp), %rax
14544633e:     	movq	%rax, 0x2268(%rbp)
145446345:     	movl	0x5a8(%rbp), %eax
14544634b:     	movl	%eax, 0x2270(%rbp)
145446351:     	addb	$-0x2, %dil
145446355:     	cmpb	$0x9, %dil
145446359:     	ja	0x1454466ec <.text+0x54456ec>
14544635f:     	movzbl	%dil, %eax
145446363:     	leaq	0x12f85ce(%rip), %rcx   # 0x14673e938
14544636a:     	movq	(%rcx,%rax,8), %rax
14544636e:     	jmp	0x1454466f3 <.text+0x54456f3>
145446373:     	movzbl	0x2(%r11), %r10d
145446378:     	shll	$0x10, %r10d
14544637c:     	cmpq	$0x3, %rsi
145446380:     	je	0x145446394 <.text+0x5445394>
145446382:     	movzbl	0x3(%r11), %esi
145446387:     	shll	$0x18, %esi
14544638a:     	orl	%esi, %r10d
14544638d:     	addq	$0x4, %r11
145446391:     	movq	%r11, %r15
145446394:     	orl	%ebx, %eax
145446396:     	movq	%r12, %rsi
145446399:     	subq	$0x10, %rsi
14544639d:     	movl	$0x0, %r11d
1454463a3:     	cmovaeq	%rsi, %r11
1454463a7:     	movzbl	%r14b, %esi
1454463ab:     	orl	%r13d, %r10d
1454463ae:     	orl	%esi, %r10d
1454463b1:     	cmpq	$0x11, %r12
1454463b5:     	jae	0x1454463be <.text+0x54453be>
1454463b7:     	xorl	%ebx, %ebx
1454463b9:     	xorl	%r14d, %r14d
1454463bc:     	jmp	0x145446401 <.text+0x5445401>
1454463be:     	movzbl	(%r15), %ebx
1454463c2:     	cmpq	$0x1, %r11
1454463c6:     	jne	0x1454463cd <.text+0x54453cd>
1454463c8:     	xorl	%r14d, %r14d
1454463cb:     	jmp	0x145446401 <.text+0x5445401>
1454463cd:     	movzbl	0x1(%r15), %r14d
1454463d2:     	shll	$0x8, %r14d
1454463d6:     	cmpq	$0x3, %r11
1454463da:     	jb	0x145446401 <.text+0x5445401>
1454463dc:     	movzbl	0x2(%r15), %r9d
1454463e1:     	shll	$0x10, %r9d
1454463e5:     	cmpq	$0x3, %r11
1454463e9:     	je	0x145446401 <.text+0x5445401>
1454463eb:     	movzbl	0x3(%r15), %r11d
1454463f0:     	shll	$0x18, %r11d
1454463f4:     	orl	%r9d, %r11d
1454463f7:     	addq	$0x4, %r15
1454463fb:     	movl	%r11d, %r9d
1454463fe:     	movq	%r15, %rdi
145446401:     	xorl	%r11d, %r11d
145446404:     	movq	%r12, %r15
145446407:     	subq	$0x14, %r15
14544640b:     	movl	$0x0, %esi
145446410:     	cmovaeq	%r15, %rsi
145446414:     	movzbl	%bl, %ebx
145446417:     	orl	%r14d, %r9d
14544641a:     	orl	%ebx, %r9d
14544641d:     	cmpq	$0x15, %r12
145446421:     	jae	0x14544642a <.text+0x544542a>
145446423:     	xorl	%ebx, %ebx
145446425:     	xorl	%r14d, %r14d
145446428:     	jmp	0x145446463 <.text+0x5445463>
14544642a:     	movzbl	(%rdi), %ebx
14544642d:     	cmpq	$0x1, %rsi
145446431:     	jne	0x145446438 <.text+0x5445438>
145446433:     	xorl	%r14d, %r14d
145446436:     	jmp	0x145446463 <.text+0x5445463>
145446438:     	movzbl	0x1(%rdi), %r14d
14544643d:     	shll	$0x8, %r14d
145446441:     	cmpq	$0x3, %rsi
145446445:     	jb	0x145446463 <.text+0x5445463>
145446447:     	movzbl	0x2(%rdi), %r11d
14544644c:     	shll	$0x10, %r11d
145446450:     	cmpq	$0x3, %rsi
145446454:     	je	0x145446463 <.text+0x5445463>
145446456:     	movzbl	0x3(%rdi), %esi
14544645a:     	shll	$0x18, %esi
14544645d:     	orl	%r11d, %esi
145446460:     	movl	%esi, %r11d
145446463:     	movl	%eax, %esi
145446465:     	andl	$0x7fffffff, %esi       # imm = 0x7FFFFFFF
14544646b:     	cmpl	$0x7f800000, %esi       # imm = 0x7F800000
145446471:     	setge	%sil
145446475:     	movl	%r10d, %edi
145446478:     	andl	$0x7fffffff, %edi       # imm = 0x7FFFFFFF
14544647e:     	cmpl	$0x7f800000, %edi       # imm = 0x7F800000
145446484:     	setge	%dil
145446488:     	movl	%r9d, %r15d
14544648b:     	andl	$0x7fffffff, %r15d      # imm = 0x7FFFFFFF
145446492:     	cmpl	$0x7f7fffff, %r15d      # imm = 0x7F7FFFFF
145446499:     	jg	0x145447a82 <.text+0x5446a82>
14544649f:     	testb	%dil, %dil
1454464a2:     	jne	0x145447a82 <.text+0x5446a82>
1454464a8:     	testb	%sil, %sil
1454464ab:     	jne	0x145447a82 <.text+0x5446a82>
1454464b1:     	movq	0x2368(%rbp), %rsi
1454464b8:     	movq	0x10(%rsi), %rsi
1454464bc:     	cmpl	$0x2, %esi
1454464bf:     	je	0x145447a82 <.text+0x5446a82>
1454464c5:     	movzbl	%cl, %ecx
1454464c8:     	orl	%r8d, %edx
1454464cb:     	orl	%ecx, %edx
1454464cd:     	movzbl	%bl, %ecx
1454464d0:     	orl	%r14d, %r11d
1454464d3:     	orl	%ecx, %r11d
1454464d6:     	movd	%r11d, %xmm2
1454464db:     	movq	0x2368(%rbp), %rcx
1454464e2:     	movl	%edx, 0x9a0(%rcx)
1454464e8:     	addq	$0x10, %rcx
1454464ec:     	movl	%eax, 0x1600(%rbp)
1454464f2:     	movl	%r10d, 0x1604(%rbp)
1454464f9:     	movl	%r9d, 0x1608(%rbp)
145446500:     	leaq	0x1600(%rbp), %rdx
145446507:     	callq	0x1454a5cb0 <.text+0x54a4cb0>
14544650c:     	jmp	0x145447a82 <.text+0x5446a82>
145446511:     	movq	%rax, %rcx
145446514:     	callq	0x1457308d0 <.text+0x572f8d0>
145446519:     	nop
14544651a:     	movq	%rax, %r12
14544651d:     	leaq	0x1600(%rbp), %rcx
145446524:     	movq	0x2370(%rbp), %rdx
14544652b:     	movq	%r15, %r8
14544652e:     	callq	0x14543aaa0 <.text+0x5439aa0>
145446533:     	nop
145446534:     	movq	0x1600(%rbp), %rax
14544653b:     	cmpq	$-0x1, %rax
14544653f:     	je	0x1454466d1 <.text+0x54456d1>
145446545:     	movq	%rax, 0x2358(%rbp)
14544654c:     	movq	0x1608(%rbp), %rax
145446553:     	movq	%rax, 0x2388(%rbp)
14544655a:     	movq	0x1610(%rbp), %r15
145446561:     	movb	$0x1, 0x2395(%rbp)
145446568:     	leaq	0x1600(%rbp), %rcx
14544656f:     	movq	%rsi, %rdx
145446572:     	callq	0x14544d300 <.text+0x544c300>
145446577:     	nop
145446578:     	movq	%rsi, 0x2368(%rbp)
14544657f:     	movq	0x1608(%rbp), %rax
145446586:     	movq	%rax, 0x2360(%rbp)
14544658d:     	movq	0x1610(%rbp), %rax
145446594:     	testq	%rax, %rax
145446597:     	je	0x1454473b4 <.text+0x54463b4>
14544659d:     	imulq	$0x38, %rax, %rdi
1454465a1:     	cmpq	$0xf, %r15
1454465a5:     	jbe	0x145447349 <.text+0x5446349>
1454465ab:     	xorl	%esi, %esi
1454465ad:     	jmp	0x1454465bc <.text+0x54455bc>
1454465af:     	addq	$0x38, %rsi
1454465b3:     	cmpq	%rsi, %rdi
1454465b6:     	je	0x1454473b4 <.text+0x54463b4>
1454465bc:     	movq	0x2360(%rbp), %rax
1454465c3:     	cmpq	%r15, 0x10(%rax,%rsi)
1454465c8:     	jne	0x1454465af <.text+0x54455af>
1454465ca:     	movq	0x2360(%rbp), %rax
1454465d1:     	movq	0x8(%rax,%rsi), %rcx
1454465d6:     	movq	%r15, %rdx
1454465d9:     	movq	0x2388(%rbp), %r8
1454465e0:     	movq	%r15, %r9
1454465e3:     	callq	0x1400a4c70 <.text+0xa3c70>
1454465e8:     	testb	%al, %al
1454465ea:     	je	0x1454465af <.text+0x54455af>
1454465ec:     	leaq	0x1600(%rbp), %rcx
1454465f3:     	callq	0x145546f70 <.text+0x5545f70>
1454465f8:     	nop
1454465f9:     	movq	0x1600(%rbp), %rax
145446600:     	testq	%rax, %rax
145446603:     	movq	0x2368(%rbp), %rsi
14544660a:     	je	0x145446622 <.text+0x5445622>
14544660c:     	imulq	$0x38, %rax, %rdx
145446610:     	movl	$0x8, %r8d
145446616:     	movq	0x2360(%rbp), %rcx
14544661d:     	callq	0x1400021d0 <.text+0x11d0>
145446622:     	movb	$0x31, %dil
145446625:     	jmp	0x1454473f7 <.text+0x54463f7>
14544662a:     	movzbl	0x3(%rbx), %r13d
14544662f:     	shll	$0x18, %r13d
145446633:     	orl	%eax, %r13d
145446636:     	xorl	%edi, %edi
145446638:     	cmpq	$0x5, %r12
14544663c:     	jae	0x1454469f3 <.text+0x54459f3>
145446642:     	movl	$0x0, 0x2370(%rbp)
14544664c:     	jmp	0x145444d2f <.text+0x5443d2f>
145446651:     	movzbl	0x3(%rbx), %r8d
145446656:     	shll	$0x18, %r8d
14544665a:     	orl	%ecx, %r8d
14544665d:     	xorl	%r14d, %r14d
145446660:     	cmpq	$0x5, %r12
145446664:     	jae	0x145446a3e <.text+0x5445a3e>
14544666a:     	xorl	%r9d, %r9d
14544666d:     	jmp	0x145444e1a <.text+0x5443e1a>
145446672:     	movzbl	0x3(%rbx), %r8d
145446677:     	shll	$0x18, %r8d
14544667b:     	orl	%r9d, %r8d
14544667e:     	xorl	%r9d, %r9d
145446681:     	cmpq	$0x5, %r12
145446685:     	jae	0x145446a87 <.text+0x5445a87>
14544668b:     	xorl	%edx, %edx
14544668d:     	jmp	0x145444efc <.text+0x5443efc>
145446692:     	movzbl	0x3(%rbx), %edx
145446696:     	shll	$0x18, %edx
145446699:     	orl	%r9d, %edx
14544669c:     	xorl	%r9d, %r9d
14544669f:     	cmpq	$0x5, %r12
1454466a3:     	jae	0x145446ad1 <.text+0x5445ad1>
1454466a9:     	xorl	%r8d, %r8d
1454466ac:     	jmp	0x145445124 <.text+0x5444124>
1454466b1:     	movzbl	0x3(%rbx), %r8d
1454466b6:     	shll	$0x18, %r8d
1454466ba:     	orl	%r9d, %r8d
1454466bd:     	xorl	%r9d, %r9d
1454466c0:     	cmpq	$0x5, %r12
1454466c4:     	jae	0x1454472ff <.text+0x54462ff>
1454466ca:     	xorl	%edx, %edx
1454466cc:     	jmp	0x145445377 <.text+0x5444377>
1454466d1:     	testq	%r12, %r12
1454466d4:     	je	0x1454479f2 <.text+0x54469f2>
1454466da:     	cmpq	$0x1, %r12
1454466de:     	jne	0x1454479f7 <.text+0x54469f7>
1454466e4:     	movb	$0x46, %dil
1454466e7:     	jmp	0x145447a01 <.text+0x5446a01>
1454466ec:     	leaq	0x12ef155(%rip), %rax   # 0x146735848
1454466f3:     	movq	0x30(%rax), %rdx
1454466f7:     	movq	0x38(%rax), %r8
1454466fb:     	shlq	$0x4, %r8
1454466ff:     	addq	%rdx, %r8
145446702:     	movb	$0x1, 0x237e(%rbp)
145446709:     	leaq	0x2300(%rbp), %rcx
145446710:     	callq	0x1455463a0 <.text+0x55453a0>
145446715:     	nop
145446716:     	movq	0x530(%rbp), %rax
14544671d:     	movl	0x40(%rax), %edi
145446720:     	movq	0x2310(%rbp), %rsi
145446727:     	cmpq	0x2300(%rbp), %rsi
14544672e:     	jne	0x145446744 <.text+0x5445744>
145446730:     	movb	$0x1, 0x2396(%rbp)
145446737:     	leaq	0x2300(%rbp), %rcx
14544673e:     	callq	0x145777a50 <.text+0x5776a50>
145446743:     	nop
145446744:     	imulq	$0xf0, %rbx, %r12
14544674b:     	leaq	0x12ecdc6(%rip), %rax   # 0x146733518
145446752:     	addq	%rax, %r12
145446755:     	movq	0x2308(%rbp), %rax
14544675c:     	movl	%edi, (%rax,%rsi,4)
14544675f:     	incq	%rsi
145446762:     	movq	%rsi, 0x2310(%rbp)
145446769:     	movl	0xc0(%r12), %r13d
145446771:     	movss	0xd4(%r12), %xmm3
14544677b:     	movb	$0x1, 0x2396(%rbp)
145446782:     	leaq	0x2298(%rbp), %rcx
145446789:     	leaq	0x2268(%rbp), %r8
145446790:     	movl	%r13d, %edx
145446793:     	callq	0x1454601b0 <.text+0x545f1b0>
145446798:     	nop
145446799:     	leaq	0x2278(%rbp), %rcx
1454467a0:     	callq	0x1458e9c50 <.text+0x58e8c50>
1454467a5:     	nop
1454467a6:     	leaq	0x22e0(%rbp), %rcx
1454467ad:     	callq	0x14545dfe0 <.text+0x545cfe0>
1454467b2:     	nop
1454467b3:     	movl	0xc4(%r12), %ebx
1454467bb:     	leaq	0x2330(%rbp), %rcx
1454467c2:     	leaq	0x2268(%rbp), %rdx
1454467c9:     	movl	%r13d, %r8d
1454467cc:     	movl	%ebx, %r9d
1454467cf:     	callq	0x14545f4f0 <.text+0x545e4f0>
1454467d4:     	nop
1454467d5:     	movq	0x2308(%rbp), %rdx
1454467dc:     	movq	0x2310(%rbp), %r8
1454467e3:     	leaq	0x1fe0(%rbp), %rcx
1454467ea:     	callq	0x14545d470 <.text+0x545c470>
1454467ef:     	nop
1454467f0:     	movq	0x2368(%rbp), %rsi
1454467f7:     	movq	0x2380(%rbp), %rdi
1454467fe:     	leaq	0xb60(%rbp), %rcx
145446805:     	callq	0x145460350 <.text+0x545f350>
14544680a:     	nop
14544680b:     	movl	%ebx, 0x2388(%rbp)
145446811:     	movl	0xdc(%r12), %edx
145446819:     	leaq	0x1600(%rbp), %rcx
145446820:     	xorl	%r8d, %r8d
145446823:     	callq	0x145460130 <.text+0x545f130>
145446828:     	nop
145446829:     	movups	0x2298(%rbp), %xmm0
145446830:     	movups	0x22a8(%rbp), %xmm1
145446837:     	movaps	%xmm1, 0x1530(%rbp)
14544683e:     	movaps	%xmm0, 0x1520(%rbp)
145446845:     	movups	0x2278(%rbp), %xmm0
14544684c:     	movups	0x2288(%rbp), %xmm1
145446853:     	movaps	%xmm0, 0x1540(%rbp)
14544685a:     	movaps	%xmm1, 0x1550(%rbp)
145446861:     	movups	0x22e0(%rbp), %xmm0
145446868:     	movups	0x22f0(%rbp), %xmm1
14544686f:     	movaps	%xmm0, 0x1560(%rbp)
145446876:     	movaps	%xmm1, 0x1570(%rbp)
14544687d:     	movups	0x2330(%rbp), %xmm0
145446884:     	movups	0x2340(%rbp), %xmm1
14544688b:     	movaps	%xmm0, 0x1580(%rbp)
145446892:     	movaps	%xmm1, 0x1590(%rbp)
145446899:     	movups	0x1fe0(%rbp), %xmm0
1454468a0:     	movups	0x1ff0(%rbp), %xmm1
1454468a7:     	movaps	%xmm1, 0x15b0(%rbp)
1454468ae:     	movaps	%xmm0, 0x15a0(%rbp)
1454468b5:     	movups	0xb60(%rbp), %xmm0
1454468bc:     	movups	0xb70(%rbp), %xmm1
1454468c3:     	movaps	%xmm1, 0x15d0(%rbp)
1454468ca:     	movaps	%xmm0, 0x15c0(%rbp)
1454468d1:     	movdqu	0x1600(%rbp), %xmm0
1454468d9:     	movups	0x1610(%rbp), %xmm1
1454468e0:     	movdqa	%xmm0, 0x15e0(%rbp)
1454468e8:     	movaps	%xmm1, 0x15f0(%rbp)
1454468ef:     	leaq	0x1610(%rbp), %r14
1454468f6:     	leaq	0x1520(%rbp), %rdx
1454468fd:     	movl	$0xe0, %r8d
145446903:     	movq	%r14, %rcx
145446906:     	callq	0x1457731ed <.text+0x57721ed>
14544690b:     	movq	$0x7, 0x1608(%rbp)
145446916:     	leaq	0xb68(%rbp), %rbx
14544691d:     	movq	$0x1, 0x1600(%rbp)
145446928:     	movq	0x1610(%rbp), %rax
14544692f:     	cmpq	$-0x1, %rax
145446933:     	je	0x1454469b1 <.text+0x54459b1>
145446935:     	leaq	0xb60(%rbp), %r15
14544693c:     	movq	%r14, %rcx
14544693f:     	movq	%rax, 0xb60(%rbp)
145446946:     	movq	0x18(%rcx), %rax
14544694a:     	movq	%rax, 0x10(%rbx)
14544694e:     	movdqu	0x8(%rcx), %xmm0
145446953:     	movdqu	%xmm0, (%rbx)
145446957:     	movq	0xa08(%rsi), %rcx
14544695e:     	movq	0xa10(%rsi), %rdx
145446965:     	movq	%rdi, %r8
145446968:     	movq	%r15, %r9
14544696b:     	callq	0x14543f3c0 <.text+0x543e3c0>
145446970:     	nop
145446971:     	movq	0x1600(%rbp), %rax
145446978:     	movq	0x1608(%rbp), %r8
14544697f:     	cmpq	%rax, %r8
145446982:     	je	0x145446b1c <.text+0x5445b1c>
145446988:     	leaq	0x1(%rax), %rdx
14544698c:     	movq	%rdx, 0x1600(%rbp)
145446993:     	shlq	$0x5, %rax
145446997:     	leaq	0x1610(%rbp), %r14
14544699e:     	leaq	(%r14,%rax), %rcx
1454469a2:     	movq	(%r14,%rax), %rax
1454469a6:     	cmpq	$-0x1, %rax
1454469aa:     	jne	0x14544693f <.text+0x544593f>
1454469ac:     	jmp	0x145446b26 <.text+0x5445b26>
1454469b1:     	movl	$0x7, %r8d
1454469b7:     	movl	$0x1, %edx
1454469bc:     	jmp	0x145446b26 <.text+0x5445b26>
1454469c1:     	leal	-0x2526(%rbx), %eax
1454469c7:     	cmpl	$0x7, %eax
1454469ca:     	ja	0x145447c47 <.text+0x5446c47>
1454469d0:     	leaq	0x12f832d(%rip), %rcx   # 0x14673ed04
1454469d7:     	movslq	(%rcx,%rax,4), %rax
1454469db:     	addq	%rcx, %rax
1454469de:     	movq	%rsi, 0x2368(%rbp)
1454469e5:     	jmpq	*%rax
1454469e7:     	leaq	0x15ab4d2(%rip), %rdi   # 0x1469f1ec0
1454469ee:     	jmp	0x145447cb9 <.text+0x5446cb9>
1454469f3:     	leaq	-0x4(%r12), %rax
1454469f8:     	movzbl	0x4(%rbx), %ecx
1454469fc:     	cmpq	$0x1, %rax
145446a00:     	movl	%ecx, 0x2370(%rbp)
145446a06:     	je	0x145444d2f <.text+0x5443d2f>
145446a0c:     	movzbl	0x5(%rbx), %r15d
145446a11:     	shll	$0x8, %r15d
145446a15:     	cmpq	$0x7, %r12
145446a19:     	jb	0x145444d32 <.text+0x5443d32>
145446a1f:     	movzbl	0x6(%rbx), %edi
145446a23:     	shll	$0x10, %edi
145446a26:     	cmpq	$0x3, %rax
145446a2a:     	je	0x145444d32 <.text+0x5443d32>
145446a30:     	movzbl	0x7(%rbx), %eax
145446a34:     	shll	$0x18, %eax
145446a37:     	orl	%eax, %edi
145446a39:     	jmp	0x145444d32 <.text+0x5443d32>
145446a3e:     	leaq	-0x4(%r12), %rcx
145446a43:     	movzbl	0x4(%rbx), %r9d
145446a48:     	cmpq	$0x1, %rcx
145446a4c:     	je	0x145444e1a <.text+0x5443e1a>
145446a52:     	movzbl	0x5(%rbx), %r10d
145446a57:     	shll	$0x8, %r10d
145446a5b:     	cmpq	$0x7, %r12
145446a5f:     	jb	0x145444e1d <.text+0x5443e1d>
145446a65:     	movzbl	0x6(%rbx), %r14d
145446a6a:     	shll	$0x10, %r14d
145446a6e:     	cmpq	$0x3, %rcx
145446a72:     	je	0x145444e1d <.text+0x5443e1d>
145446a78:     	movzbl	0x7(%rbx), %ecx
145446a7c:     	shll	$0x18, %ecx
145446a7f:     	orl	%ecx, %r14d
145446a82:     	jmp	0x145444e1d <.text+0x5443e1d>
145446a87:     	leaq	-0x4(%r12), %r11
145446a8c:     	movzbl	0x4(%rbx), %edx
145446a90:     	cmpq	$0x1, %r11
145446a94:     	je	0x145444efc <.text+0x5443efc>
145446a9a:     	movzbl	0x5(%rbx), %r10d
145446a9f:     	shll	$0x8, %r10d
145446aa3:     	cmpq	$0x7, %r12
145446aa7:     	jb	0x145444eff <.text+0x5443eff>
145446aad:     	movzbl	0x6(%rbx), %r9d
145446ab2:     	shll	$0x10, %r9d
145446ab6:     	cmpq	$0x3, %r11
145446aba:     	je	0x145444eff <.text+0x5443eff>
145446ac0:     	movzbl	0x7(%rbx), %r11d
145446ac5:     	shll	$0x18, %r11d
145446ac9:     	orl	%r11d, %r9d
145446acc:     	jmp	0x145444eff <.text+0x5443eff>
145446ad1:     	leaq	-0x4(%r12), %r11
145446ad6:     	movzbl	0x4(%rbx), %r8d
145446adb:     	cmpq	$0x1, %r11
145446adf:     	je	0x145445124 <.text+0x5444124>
145446ae5:     	movzbl	0x5(%rbx), %r10d
145446aea:     	shll	$0x8, %r10d
145446aee:     	cmpq	$0x7, %r12
145446af2:     	jb	0x145445127 <.text+0x5444127>
145446af8:     	movzbl	0x6(%rbx), %r9d
145446afd:     	shll	$0x10, %r9d
145446b01:     	cmpq	$0x3, %r11
145446b05:     	je	0x145445127 <.text+0x5444127>
145446b0b:     	movzbl	0x7(%rbx), %r11d
145446b10:     	shll	$0x18, %r11d
145446b14:     	orl	%r11d, %r9d
145446b17:     	jmp	0x145445127 <.text+0x5444127>
145446b1c:     	movq	%r8, %rdx
145446b1f:     	leaq	0x1610(%rbp), %r14
145446b26:     	movb	$0x1, 0x2396(%rbp)
145446b2d:     	movq	%r14, %rcx
145446b30:     	callq	0x143ef1f00 <.text+0x3ef0f00>
145446b35:     	nop
145446b36:     	movb	$0x1, 0x2396(%rbp)
145446b3d:     	leaq	0xb60(%rbp), %rcx
145446b44:     	leaq	0x1a0(%rbp), %rdx
145446b4b:     	callq	0x14549ff20 <.text+0x549ef20>
145446b50:     	nop
145446b51:     	cmpq	$-0x1, 0xb60(%rbp)
145446b59:     	je	0x145446ba9 <.text+0x5445ba9>
145446b5b:     	movdqu	0xb60(%rbp), %xmm0
145446b63:     	movups	0xb70(%rbp), %xmm1
145446b6a:     	movaps	%xmm1, 0x1610(%rbp)
145446b71:     	movdqa	%xmm0, 0x1600(%rbp)
145446b79:     	movq	0x2368(%rbp), %rax
145446b80:     	movq	0xa08(%rax), %rcx
145446b87:     	movq	0xa10(%rax), %rdx
145446b8e:     	movb	$0x1, 0x2396(%rbp)
145446b95:     	leaq	0x1600(%rbp), %r9
145446b9c:     	movq	0x2380(%rbp), %r8
145446ba3:     	callq	0x14543f3c0 <.text+0x543e3c0>
145446ba8:     	nop
145446ba9:     	movb	$0x1, 0x2396(%rbp)
145446bb0:     	leaq	0x2330(%rbp), %rcx
145446bb7:     	leaq	0x1a0(%rbp), %rdx
145446bbe:     	callq	0x1454a24f0 <.text+0x54a14f0>
145446bc3:     	nop
145446bc4:     	leaq	0xb60(%rbp), %rcx
145446bcb:     	movl	%r13d, %edx
145446bce:     	movl	0x2388(%rbp), %r8d
145446bd5:     	callq	0x14545fdf0 <.text+0x545edf0>
145446bda:     	nop
145446bdb:     	movl	0xb8(%r12), %edx
145446be3:     	movd	0xbc(%r12), %xmm2
145446bed:     	leaq	0x1600(%rbp), %rcx
145446bf4:     	callq	0x1454668e0 <.text+0x54658e0>
145446bf9:     	nop
145446bfa:     	movdqu	0x2330(%rbp), %xmm0
145446c02:     	movups	0x2340(%rbp), %xmm1
145446c09:     	movaps	%xmm1, 0x1ff0(%rbp)
145446c10:     	movdqa	%xmm0, 0x1fe0(%rbp)
145446c18:     	movdqu	0xb60(%rbp), %xmm2
145446c20:     	movups	0xb70(%rbp), %xmm3
145446c27:     	movdqa	%xmm2, 0x2000(%rbp)
145446c2f:     	movaps	%xmm3, 0x2010(%rbp)
145446c36:     	movups	0x1600(%rbp), %xmm4
145446c3d:     	movups	0x1610(%rbp), %xmm5
145446c44:     	movaps	%xmm4, 0x2020(%rbp)
145446c4b:     	movaps	%xmm5, 0x2030(%rbp)
145446c52:     	leaq	0x1610(%rbp), %rcx
145446c59:     	movdqu	%xmm0, 0x1610(%rbp)
145446c61:     	movups	%xmm5, 0x1660(%rbp)
145446c68:     	movups	%xmm4, 0x1650(%rbp)
145446c6f:     	movups	%xmm3, 0x1640(%rbp)
145446c76:     	movdqu	%xmm2, 0x1630(%rbp)
145446c7e:     	movups	%xmm1, 0x1620(%rbp)
145446c85:     	movq	$0x3, 0x1608(%rbp)
145446c90:     	movq	$0x1, 0x1600(%rbp)
145446c9b:     	movq	0x1610(%rbp), %rax
145446ca2:     	cmpq	$-0x1, %rax
145446ca6:     	movq	0x2368(%rbp), %rsi
145446cad:     	movq	0x2380(%rbp), %rdi
145446cb4:     	je	0x145446d2c <.text+0x5445d2c>
145446cb6:     	leaq	0xb60(%rbp), %r14
145446cbd:     	movq	%rcx, %r9
145446cc0:     	movq	%rax, 0xb60(%rbp)
145446cc7:     	movq	0x18(%r9), %rax
145446ccb:     	movq	%rax, 0x10(%rbx)
145446ccf:     	movdqu	0x8(%r9), %xmm0
145446cd5:     	movdqu	%xmm0, (%rbx)
145446cd9:     	movq	0xa08(%rsi), %rcx
145446ce0:     	movq	0xa10(%rsi), %rdx
145446ce7:     	movq	%rdi, %r8
145446cea:     	movq	%r14, %r9
145446ced:     	callq	0x14543f3c0 <.text+0x543e3c0>
145446cf2:     	nop
145446cf3:     	movq	0x1600(%rbp), %rax
145446cfa:     	movq	0x1608(%rbp), %r8
145446d01:     	cmpq	%rax, %r8
145446d04:     	je	0x145446d39 <.text+0x5445d39>
145446d06:     	leaq	0x1(%rax), %rdx
145446d0a:     	movq	%rdx, 0x1600(%rbp)
145446d11:     	shlq	$0x5, %rax
145446d15:     	leaq	0x1610(%rbp), %rcx
145446d1c:     	leaq	(%rcx,%rax), %r9
145446d20:     	movq	(%rcx,%rax), %rax
145446d24:     	cmpq	$-0x1, %rax
145446d28:     	jne	0x145446cc0 <.text+0x5445cc0>
145446d2a:     	jmp	0x145446d43 <.text+0x5445d43>
145446d2c:     	movl	$0x3, %r8d
145446d32:     	movl	$0x1, %edx
145446d37:     	jmp	0x145446d43 <.text+0x5445d43>
145446d39:     	movq	%r8, %rdx
145446d3c:     	leaq	0x1610(%rbp), %rcx
145446d43:     	movb	$0x1, 0x2396(%rbp)
145446d4a:     	callq	0x143ef1f00 <.text+0x3ef0f00>
145446d4f:     	nop
145446d50:     	movq	0x2168(%rbp), %rdx
145446d57:     	movq	0x2068(%rbp), %r8
145446d5e:     	movq	0x2070(%rbp), %r9
145446d65:     	movzbl	0x21cd(%rbp), %eax
145446d6c:     	movzbl	0x21ce(%rbp), %ecx
145446d73:     	movzbl	0x21cc(%rbp), %r10d
145446d7b:     	movb	$0x1, 0x2396(%rbp)
145446d82:     	movb	%r10b, 0x30(%rsp)
145446d87:     	movb	%cl, 0x28(%rsp)
145446d8b:     	movb	%al, 0x20(%rsp)
145446d8f:     	leaq	0x1600(%rbp), %rcx
145446d96:     	callq	0x145463d10 <.text+0x5462d10>
145446d9b:     	nop
145446d9c:     	movq	0x2368(%rbp), %rax
145446da3:     	movq	0xa08(%rax), %rcx
145446daa:     	movq	0xa10(%rax), %rdx
145446db1:     	movb	$0x1, 0x2396(%rbp)
145446db8:     	leaq	0x1600(%rbp), %r9
145446dbf:     	movq	0x2380(%rbp), %r8
145446dc6:     	callq	0x14543f3c0 <.text+0x543e3c0>
145446dcb:     	nop
145446dcc:     	movq	%r12, 0x2350(%rbp)
145446dd3:     	leaq	0xb60(%rbp), %rdi
145446dda:     	leaq	0x1a0(%rbp), %rdx
145446de1:     	movl	$0x9c0, %r8d            # imm = 0x9C0
145446de7:     	movq	%rdi, %rcx
145446dea:     	callq	0x1457731ed <.text+0x57721ed>
145446def:     	movb	$0x1, 0x2397(%rbp)
145446df6:     	movq	%rdi, %rcx
145446df9:     	callq	0x1454f5f00 <.text+0x54f4f00>
145446dfe:     	nop
145446dff:     	movzbl	0x21cd(%rbp), %eax
145446e06:     	addb	$-0x2, %al
145446e08:     	cmpb	$0x6, %al
145446e0a:     	ja	0x145446e1c <.text+0x5445e1c>
145446e0c:     	movzbl	%al, %eax
145446e0f:     	leaq	0x12f7aea(%rip), %rcx   # 0x14673e900
145446e16:     	movq	(%rcx,%rax,8), %rax
145446e1a:     	jmp	0x145446e23 <.text+0x5445e23>
145446e1c:     	leaq	0x12ed8b5(%rip), %rax   # 0x1467346d8
145446e23:     	movq	%rax, 0x2370(%rbp)
145446e2a:     	movb	$0x1, 0x2397(%rbp)
145446e31:     	leaq	0x12f7248(%rip), %r13   # 0x14673e080
145446e38:     	movl	$0x37, %esi
145446e3d:     	movl	$0x37, %edx
145446e42:     	movq	%r13, %rcx
145446e45:     	callq	0x145457cb0 <.text+0x5456cb0>
145446e4a:     	nop
145446e4b:     	movq	%rdx, %r12
145446e4e:     	testq	%rax, %rax
145446e51:     	cmovneq	%rax, %r13
145446e55:     	cmoveq	%rsi, %r12
145446e59:     	movb	$0x1, 0x2397(%rbp)
145446e60:     	movq	0x2370(%rbp), %rcx
145446e67:     	callq	0x14541f980 <.text+0x541e980>
145446e6c:     	nop
145446e6d:     	movq	%rax, 0x22b8(%rbp)
145446e74:     	movq	%rdx, 0x22c0(%rbp)
145446e7b:     	movzbl	0x21cc(%rbp), %eax
145446e82:     	addb	$-0x2, %al
145446e84:     	cmpb	$0x9, %al
145446e86:     	ja	0x145446e98 <.text+0x5445e98>
145446e88:     	movzbl	%al, %eax
145446e8b:     	leaq	0x12f7aa6(%rip), %rcx   # 0x14673e938
145446e92:     	movq	(%rcx,%rax,8), %rcx
145446e96:     	jmp	0x145446e9f <.text+0x5445e9f>
145446e98:     	leaq	0x12ee9a9(%rip), %rcx   # 0x146735848
145446e9f:     	movb	$0x1, 0x2397(%rbp)
145446ea6:     	callq	0x14541f7c0 <.text+0x541e7c0>
145446eab:     	nop
145446eac:     	movq	%rax, 0x2298(%rbp)
145446eb3:     	movq	%rdx, 0x22a0(%rbp)
145446eba:     	movb	$0x1, 0x2397(%rbp)
145446ec1:     	movq	0x2350(%rbp), %rcx
145446ec8:     	callq	0x1454202c0 <.text+0x541f2c0>
145446ecd:     	nop
145446ece:     	movq	%rax, 0x2278(%rbp)
145446ed5:     	movq	%rdx, 0x2280(%rbp)
145446edc:     	leaq	0x12f71f5(%rip), %rax   # 0x14673e0d8
145446ee3:     	movq	%rax, 0x1600(%rbp)
145446eea:     	movq	$0x4, 0x1608(%rbp)
145446ef5:     	leaq	0x2060(%rbp), %rax
145446efc:     	movq	%rax, 0x1610(%rbp)
145446f03:     	leaq	0x12f71ae(%rip), %rax   # 0x14673e0b8
145446f0a:     	movq	%rax, 0x1618(%rbp)
145446f11:     	leaq	0x12f71e8(%rip), %rax   # 0x14673e100
145446f18:     	movq	%rax, 0x1620(%rbp)
145446f1f:     	movq	$0x4, 0x1628(%rbp)
145446f2a:     	leaq	0x22b8(%rbp), %rax
145446f31:     	movq	%rax, 0x1630(%rbp)
145446f38:     	leaq	0x12f71a1(%rip), %rcx   # 0x14673e0e0
145446f3f:     	movq	%rcx, 0x1638(%rbp)
145446f46:     	leaq	0x12f71b7(%rip), %rax   # 0x14673e104
145446f4d:     	movq	%rax, 0x1640(%rbp)
145446f54:     	movq	$0x5, 0x1648(%rbp)
145446f5f:     	leaq	0x2298(%rbp), %rax
145446f66:     	movq	%rax, 0x1650(%rbp)
145446f6d:     	movq	%rcx, 0x1658(%rbp)
145446f74:     	leaq	0x12f718e(%rip), %rax   # 0x14673e109
145446f7b:     	movq	%rax, 0x1660(%rbp)
145446f82:     	movq	$0x4, 0x1668(%rbp)
145446f8d:     	leaq	0x2278(%rbp), %rax
145446f94:     	movq	%rax, 0x1670(%rbp)
145446f9b:     	movq	%rcx, 0x1678(%rbp)
145446fa2:     	movb	$0x1, 0x2397(%rbp)
145446fa9:     	movq	$0x4, 0x20(%rsp)
145446fb2:     	leaq	0x22e0(%rbp), %rcx
145446fb9:     	leaq	0x1600(%rbp), %r9
145446fc0:     	movq	%r13, %rdx
145446fc3:     	movq	%r12, %r8
145446fc6:     	callq	0x145458060 <.text+0x5457060>
145446fcb:     	nop
145446fcc:     	movq	0x22e8(%rbp), %rdx
145446fd3:     	movq	0x22f0(%rbp), %r8
145446fda:     	leaq	0x2330(%rbp), %rcx
145446fe1:     	movq	%rdx, 0x2380(%rbp)
145446fe8:     	callq	0x14545dc90 <.text+0x545cc90>
145446fed:     	nop
145446fee:     	movq	0x10c0(%rbp), %rsi
145446ff5:     	cmpq	0x10b0(%rbp), %rsi
145446ffc:     	jne	0x14544700b <.text+0x544600b>
145446ffe:     	leaq	0x10b0(%rbp), %rcx
145447005:     	callq	0x145774710 <.text+0x5773710>
14544700a:     	nop
14544700b:     	movq	0x10b8(%rbp), %rax
145447012:     	movq	%rsi, %rcx
145447015:     	shlq	$0x5, %rcx
145447019:     	movdqu	0x2330(%rbp), %xmm0
145447021:     	movups	0x2340(%rbp), %xmm1
145447028:     	movups	%xmm1, 0x10(%rax,%rcx)
14544702d:     	movdqu	%xmm0, (%rax,%rcx)
145447032:     	incq	%rsi
145447035:     	movq	%rsi, 0x10c0(%rbp)
14544703c:     	movq	0x22e0(%rbp), %rdx
145447043:     	testq	%rdx, %rdx
145447046:     	je	0x14544705a <.text+0x544605a>
145447048:     	movl	$0x1, %r8d
14544704e:     	movq	0x2380(%rbp), %rcx
145447055:     	callq	0x1400021d0 <.text+0x11d0>
14544705a:     	movb	$0x1, 0x2397(%rbp)
145447061:     	leaq	0x1600(%rbp), %rcx
145447068:     	movq	0x2370(%rbp), %rdx
14544706f:     	callq	0x14541fcb0 <.text+0x541ecb0>
145447074:     	nop
145447075:     	movq	0x1600(%rbp), %rax
14544707c:     	movq	%rax, 0x2358(%rbp)
145447083:     	movq	0x1608(%rbp), %r14
14544708a:     	movq	0x1610(%rbp), %rbx
145447091:     	shlq	$0x4, %rbx
145447095:     	addq	%r14, %rbx
145447098:     	leaq	-0x5444fdf(%rip), %r12  # 0x1400020c0 <.text+0x10c0>
14544709f:     	leaq	0x12f7102(%rip), %r13   # 0x14673e1a8
1454470a6:     	leaq	0x1600(%rbp), %rdi
1454470ad:     	leaq	0x2330(%rbp), %r15
1454470b4:     	movq	%r14, 0x2328(%rbp)
1454470bb:     	jmp	0x1454470c1 <.text+0x54460c1>
1454470bd:     	addq	$0x10, %r14
1454470c1:     	cmpq	%rbx, %r14
1454470c4:     	je	0x14544719c <.text+0x544619c>
1454470ca:     	movdqu	(%r14), %xmm0
1454470cf:     	movdqu	%xmm0, 0x22e0(%rbp)
1454470d7:     	leaq	0x22e0(%rbp), %rax
1454470de:     	movq	%rax, 0x2330(%rbp)
1454470e5:     	movq	%r12, 0x2338(%rbp)
1454470ec:     	movq	%rdi, %rcx
1454470ef:     	movq	%r13, %rdx
1454470f2:     	movq	%r15, %r8
1454470f5:     	callq	0x145728390 <.text+0x5727390>
1454470fa:     	nop
1454470fb:     	movq	0x1600(%rbp), %rax
145447102:     	movq	%rax, 0x2380(%rbp)
145447109:     	movq	0x1608(%rbp), %rdx
145447110:     	movq	0x1610(%rbp), %r8
145447117:     	movq	%rdi, %rcx
14544711a:     	movq	%rdx, 0x2388(%rbp)
145447121:     	callq	0x14545dc90 <.text+0x545cc90>
145447126:     	nop
145447127:     	movq	0x10c0(%rbp), %rsi
14544712e:     	cmpq	0x10b0(%rbp), %rsi
145447135:     	jne	0x145447144 <.text+0x5446144>
145447137:     	leaq	0x10b0(%rbp), %rcx
14544713e:     	callq	0x145774710 <.text+0x5773710>
145447143:     	nop
145447144:     	movq	0x10b8(%rbp), %rax
14544714b:     	movq	%rsi, %rcx
14544714e:     	shlq	$0x5, %rcx
145447152:     	movdqu	0x1600(%rbp), %xmm0
14544715a:     	movups	0x1610(%rbp), %xmm1
145447161:     	movups	%xmm1, 0x10(%rax,%rcx)
145447166:     	movdqu	%xmm0, (%rax,%rcx)
14544716b:     	incq	%rsi
14544716e:     	movq	%rsi, 0x10c0(%rbp)
145447175:     	movq	0x2380(%rbp), %rdx
14544717c:     	testq	%rdx, %rdx
14544717f:     	je	0x1454470bd <.text+0x54460bd>
145447185:     	movl	$0x1, %r8d
14544718b:     	movq	0x2388(%rbp), %rcx
145447192:     	callq	0x1400021d0 <.text+0x11d0>
145447197:     	jmp	0x1454470bd <.text+0x54460bd>
14544719c:     	movq	0x2358(%rbp), %rdx
1454471a3:     	testq	%rdx, %rdx
1454471a6:     	movq	0x2368(%rbp), %rsi
1454471ad:     	je	0x1454471c5 <.text+0x54461c5>
1454471af:     	shlq	$0x4, %rdx
1454471b3:     	movl	$0x8, %r8d
1454471b9:     	movq	0x2328(%rbp), %rcx
1454471c0:     	callq	0x1400021d0 <.text+0x11d0>
1454471c5:     	movq	0xfe8(%rsi), %r15
1454471cc:     	movq	0xff0(%rsi), %rbx
1454471d3:     	movq	$0x0, 0xfe8(%rsi)
1454471de:     	testq	%r15, %r15
1454471e1:     	je	0x1454476e3 <.text+0x54466e3>
1454471e7:     	movq	%r15, %rcx
1454471ea:     	movq	%rbx, %rdx
1454471ed:     	callq	0x145420480 <.text+0x541f480>
1454471f2:     	movq	%rax, %rdi
1454471f5:     	cmpq	$0x1, %rax
1454471f9:     	adcq	$-0x1, %rdi
1454471fd:     	movb	$0x1, 0x2397(%rbp)
145447204:     	leaq	0x12f6f25(%rip), %r14   # 0x14673e130
14544720b:     	movl	$0x43, %esi
145447210:     	movl	$0x43, %edx
145447215:     	movq	%r14, %rcx
145447218:     	callq	0x145457cb0 <.text+0x5456cb0>
14544721d:     	nop
14544721e:     	movq	%rdx, %r13
145447221:     	testq	%rax, %rax
145447224:     	cmovneq	%rax, %r14
145447228:     	cmoveq	%rsi, %r13
14544722c:     	movq	%r15, %rcx
14544722f:     	movq	%rbx, %rdx
145447232:     	callq	0x145420480 <.text+0x541f480>
145447237:     	imulq	$0xf0, %rax, %rcx
14544723e:     	leaq	0x12ec2d3(%rip), %rax   # 0x146733518
145447245:     	addq	%rax, %rcx
145447248:     	movb	$0x1, 0x2397(%rbp)
14544724f:     	callq	0x1454202c0 <.text+0x541f2c0>
145447254:     	nop
145447255:     	movq	%rax, 0x21e8(%rbp)
14544725c:     	movq	%rdx, 0x21f0(%rbp)
145447263:     	movzbl	0x21cc(%rbp), %eax
14544726a:     	addb	$-0x2, %al
14544726c:     	cmpb	$0x9, %al
14544726e:     	ja	0x145447280 <.text+0x5446280>
145447270:     	movzbl	%al, %eax
145447273:     	leaq	0x12f76be(%rip), %rcx   # 0x14673e938
14544727a:     	movq	(%rcx,%rax,8), %rcx
14544727e:     	jmp	0x145447287 <.text+0x5446287>
145447280:     	leaq	0x12ee5c1(%rip), %rcx   # 0x146735848
145447287:     	movb	$0x1, 0x2397(%rbp)
14544728e:     	callq	0x14541f7c0 <.text+0x541e7c0>
145447293:     	nop
145447294:     	imulq	$0xf0, %rdi, %rcx
14544729b:     	leaq	0x12ec276(%rip), %r8    # 0x146733518
1454472a2:     	addq	%rcx, %r8
1454472a5:     	movq	%rax, 0x21d8(%rbp)
1454472ac:     	movq	%rdx, 0x21e0(%rbp)
1454472b3:     	movl	$0x160, %ebx            # imm = 0x160
1454472b8:     	movq	%r8, %rsi
1454472bb:     	addq	0x88(%r8), %rbx
1454472c2:     	movb	$0x1, 0x2397(%rbp)
1454472c9:     	leaq	0x12f6ea3(%rip), %rdi   # 0x14673e173
1454472d0:     	movl	$0xe, %edx
1454472d5:     	movq	%rdi, %rcx
1454472d8:     	callq	0x145457cb0 <.text+0x5456cb0>
1454472dd:     	nop
1454472de:     	testq	%rbx, %rbx
1454472e1:     	je	0x1454474ca <.text+0x54464ca>
1454472e7:     	movb	$0x1, 0x2397(%rbp)
1454472ee:     	movq	%rbx, %rcx
1454472f1:     	callq	0x145420100 <.text+0x541f100>
1454472f6:     	nop
1454472f7:     	movq	%rax, %rdi
1454472fa:     	jmp	0x1454474da <.text+0x54464da>
1454472ff:     	leaq	-0x4(%r12), %r11
145447304:     	movzbl	0x4(%rbx), %edx
145447308:     	cmpq	$0x1, %r11
14544730c:     	je	0x145445377 <.text+0x5444377>
145447312:     	movzbl	0x5(%rbx), %r10d
145447317:     	shll	$0x8, %r10d
14544731b:     	cmpq	$0x7, %r12
14544731f:     	jb	0x14544537a <.text+0x544437a>
145447325:     	movzbl	0x6(%rbx), %r9d
14544732a:     	shll	$0x10, %r9d
14544732e:     	cmpq	$0x3, %r11
145447332:     	je	0x14544537a <.text+0x544437a>
145447338:     	movzbl	0x7(%rbx), %r11d
14544733d:     	shll	$0x18, %r11d
145447341:     	orl	%r11d, %r9d
145447344:     	jmp	0x14544537a <.text+0x544437a>
145447349:     	movq	0x2360(%rbp), %rax
145447350:     	addq	%rax, %rdi
145447353:     	jmp	0x14544735e <.text+0x544635e>
145447355:     	addq	$0x38, %rax
145447359:     	cmpq	%rdi, %rax
14544735c:     	je	0x1454473b4 <.text+0x54463b4>
14544735e:     	cmpq	%r15, 0x10(%rax)
145447362:     	jne	0x145447355 <.text+0x5446355>
145447364:     	movq	0x8(%rax), %rcx
145447368:     	xorl	%edx, %edx
14544736a:     	cmpq	%rdx, %r15
14544736d:     	je	0x1454465ec <.text+0x54455ec>
145447373:     	movzbl	(%rcx,%rdx), %r8d
145447378:     	leal	-0x41(%r8), %r9d
14544737c:     	cmpb	$0x1a, %r9b
145447380:     	setb	%r9b
145447384:     	shlb	$0x5, %r9b
145447388:     	orb	%r8b, %r9b
14544738b:     	movq	0x2388(%rbp), %r8
145447392:     	movzbl	(%r8,%rdx), %r8d
145447397:     	leal	-0x41(%r8), %r10d
14544739b:     	cmpb	$0x1a, %r10b
14544739f:     	setb	%r10b
1454473a3:     	shlb	$0x5, %r10b
1454473a7:     	orb	%r8b, %r10b
1454473aa:     	incq	%rdx
1454473ad:     	cmpb	%r10b, %r9b
1454473b0:     	je	0x14544736a <.text+0x544636a>
1454473b2:     	jmp	0x145447355 <.text+0x5446355>
1454473b4:     	leaq	0x1600(%rbp), %rcx
1454473bb:     	callq	0x145546f70 <.text+0x5545f70>
1454473c0:     	nop
1454473c1:     	movq	0x1600(%rbp), %rax
1454473c8:     	testq	%rax, %rax
1454473cb:     	movq	0x2368(%rbp), %rsi
1454473d2:     	je	0x1454473ea <.text+0x54463ea>
1454473d4:     	imulq	$0x38, %rax, %rdx
1454473d8:     	movl	$0x8, %r8d
1454473de:     	movq	0x2360(%rbp), %rcx
1454473e5:     	callq	0x1400021d0 <.text+0x11d0>
1454473ea:     	movb	$0x34, %dil
1454473ed:     	cmpq	$0x9, 0xa28(%rsi)
1454473f5:     	jbe	0x14544741e <.text+0x544641e>
1454473f7:     	movq	0x2358(%rbp), %rdx
1454473fe:     	testq	%rdx, %rdx
145447401:     	je	0x145447a01 <.text+0x5446a01>
145447407:     	movl	$0x1, %r8d
14544740d:     	movq	0x2388(%rbp), %rcx
145447414:     	callq	0x1400021d0 <.text+0x11d0>
145447419:     	jmp	0x145447a01 <.text+0x5446a01>
14544741e:     	leaq	0xa18(%rsi), %rcx
145447425:     	movb	$0x1, 0x2395(%rbp)
14544742c:     	movq	%rcx, %r12
14544742f:     	callq	0x145439d50 <.text+0x5438d50>
145447434:     	nop
145447435:     	movq	%rax, %rdi
145447438:     	movsd	0x1(%rbx,%r14), %xmm6
14544743f:     	movq	%rsi, %rax
145447442:     	movq	0xa28(%rsi), %rsi
145447449:     	cmpq	0xa18(%rax), %rsi
145447450:     	movq	%r12, %rbx
145447453:     	jne	0x14544745e <.text+0x544645e>
145447455:     	movq	%rbx, %rcx
145447458:     	callq	0x1457746a0 <.text+0x57736a0>
14544745d:     	nop
14544745e:     	movq	0x2368(%rbp), %r12
145447465:     	movq	0xa20(%r12), %rax
14544746d:     	imulq	$0x38, %rsi, %rcx
145447471:     	movq	0x2358(%rbp), %rdx
145447478:     	movq	%rdx, (%rax,%rcx)
14544747c:     	movq	0x2388(%rbp), %rdx
145447483:     	movq	%rdx, 0x8(%rax,%rcx)
145447488:     	movq	%r15, 0x10(%rax,%rcx)
14544748d:     	movq	%rdi, 0x18(%rax,%rcx)
145447492:     	movss	0x4f8966(%rip), %xmm0   # 0x14593fe00
14544749a:     	movups	%xmm0, 0x20(%rax,%rcx)
14544749f:     	movlps	%xmm6, 0x30(%rax,%rcx)
1454474a4:     	incq	%rsi
1454474a7:     	movq	%rsi, 0xa28(%r12)
1454474af:     	movq	%r12, %rsi
1454474b2:     	movb	$0x0, 0x2395(%rbp)
1454474b9:     	movb	$0x2e, %dil
1454474bc:     	movq	%rbx, %rcx
1454474bf:     	callq	0x1454356a0 <.text+0x54346a0>
1454474c4:     	nop
1454474c5:     	jmp	0x145447a01 <.text+0x5446a01>
1454474ca:     	testq	%rax, %rax
1454474cd:     	movl	$0xe, %ecx
1454474d2:     	cmoveq	%rcx, %rdx
1454474d6:     	cmovneq	%rax, %rdi
1454474da:     	movq	%rdi, 0x22b8(%rbp)
1454474e1:     	movq	%rdx, 0x22c0(%rbp)
1454474e8:     	movb	$0x1, 0x2397(%rbp)
1454474ef:     	movq	%rsi, %rcx
1454474f2:     	callq	0x1454202c0 <.text+0x541f2c0>
1454474f7:     	nop
1454474f8:     	movq	%rax, 0x2298(%rbp)
1454474ff:     	movq	%rdx, 0x22a0(%rbp)
145447506:     	leaq	0x12f6bfc(%rip), %rax   # 0x14673e109
14544750d:     	movq	%rax, 0x1600(%rbp)
145447514:     	movq	$0x4, 0x1608(%rbp)
14544751f:     	leaq	0x21e8(%rbp), %rax
145447526:     	movq	%rax, 0x1610(%rbp)
14544752d:     	leaq	0x12f6bac(%rip), %rcx   # 0x14673e0e0
145447534:     	movq	%rcx, 0x1618(%rbp)
14544753b:     	leaq	0x12f6bc2(%rip), %rax   # 0x14673e104
145447542:     	movq	%rax, 0x1620(%rbp)
145447549:     	movq	$0x5, 0x1628(%rbp)
145447554:     	leaq	0x21d8(%rbp), %rax
14544755b:     	movq	%rax, 0x1630(%rbp)
145447562:     	movq	%rcx, 0x1638(%rbp)
145447569:     	leaq	0x12f6c11(%rip), %rax   # 0x14673e181
145447570:     	movq	%rax, 0x1640(%rbp)
145447577:     	movq	$0x4, 0x1648(%rbp)
145447582:     	leaq	0x22b8(%rbp), %rax
145447589:     	movq	%rax, 0x1650(%rbp)
145447590:     	movq	%rcx, 0x1658(%rbp)
145447597:     	leaq	0x12f6be7(%rip), %rax   # 0x14673e185
14544759e:     	movq	%rax, 0x1660(%rbp)
1454475a5:     	movq	$0x4, 0x1668(%rbp)
1454475b0:     	leaq	0x2298(%rbp), %rax
1454475b7:     	movq	%rax, 0x1670(%rbp)
1454475be:     	movq	%rcx, 0x1678(%rbp)
1454475c5:     	movb	$0x1, 0x2397(%rbp)
1454475cc:     	movq	$0x4, 0x20(%rsp)
1454475d5:     	leaq	0x2330(%rbp), %rdi
1454475dc:     	leaq	0x1600(%rbp), %r9
1454475e3:     	movq	%rdi, %rcx
1454475e6:     	movq	%r14, %rdx
1454475e9:     	movq	%r13, %r8
1454475ec:     	callq	0x145458060 <.text+0x5457060>
1454475f1:     	nop
1454475f2:     	movq	%rdi, 0x2278(%rbp)
1454475f9:     	leaq	-0x5445520(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
145447600:     	movq	%rax, 0x2280(%rbp)
145447607:     	leaq	0x12f6b7b(%rip), %rdx   # 0x14673e189
14544760e:     	leaq	0x22e0(%rbp), %rcx
145447615:     	leaq	0x2278(%rbp), %r8
14544761c:     	callq	0x145728390 <.text+0x5727390>
145447621:     	nop
145447622:     	movq	0x2330(%rbp), %rdx
145447629:     	testq	%rdx, %rdx
14544762c:     	je	0x145447640 <.text+0x5446640>
14544762e:     	movq	0x2338(%rbp), %rcx
145447635:     	movl	$0x1, %r8d
14544763b:     	callq	0x1400021d0 <.text+0x11d0>
145447640:     	movq	0x22e0(%rbp), %rax
145447647:     	movq	%rax, 0x2380(%rbp)
14544764e:     	movq	0x22e8(%rbp), %rdx
145447655:     	movq	0x22f0(%rbp), %r8
14544765c:     	leaq	0x1600(%rbp), %rcx
145447663:     	movq	%rdx, 0x2388(%rbp)
14544766a:     	callq	0x14545dc90 <.text+0x545cc90>
14544766f:     	nop
145447670:     	movq	0x10c0(%rbp), %rsi
145447677:     	cmpq	0x10b0(%rbp), %rsi
14544767e:     	jne	0x14544768d <.text+0x544668d>
145447680:     	leaq	0x10b0(%rbp), %rcx
145447687:     	callq	0x145774710 <.text+0x5773710>
14544768c:     	nop
14544768d:     	movq	0x10b8(%rbp), %rax
145447694:     	movq	%rsi, %rcx
145447697:     	shlq	$0x5, %rcx
14544769b:     	movdqu	0x1600(%rbp), %xmm0
1454476a3:     	movups	0x1610(%rbp), %xmm1
1454476aa:     	movups	%xmm1, 0x10(%rax,%rcx)
1454476af:     	movdqu	%xmm0, (%rax,%rcx)
1454476b4:     	incq	%rsi
1454476b7:     	movq	%rsi, 0x10c0(%rbp)
1454476be:     	movq	0x2380(%rbp), %rdx
1454476c5:     	testq	%rdx, %rdx
1454476c8:     	movq	0x2368(%rbp), %rsi
1454476cf:     	je	0x1454476e3 <.text+0x54466e3>
1454476d1:     	movl	$0x1, %r8d
1454476d7:     	movq	0x2388(%rbp), %rcx
1454476de:     	callq	0x1400021d0 <.text+0x11d0>
1454476e3:     	leaq	0x1600(%rbp), %rcx
1454476ea:     	leaq	0xb60(%rbp), %rdx
1454476f1:     	movl	$0x9c0, %r8d            # imm = 0x9C0
1454476f7:     	callq	0x1457731ed <.text+0x57721ed>
1454476fc:     	leaq	0x10(%rsi), %rax
145447700:     	movq	%rax, 0x2380(%rbp)
145447707:     	cmpl	$0x2, 0x10(%rsi)
14544770b:     	je	0x14544771a <.text+0x544671a>
14544770d:     	movq	0x2380(%rbp), %rcx
145447714:     	callq	0x14543d7e0 <.text+0x543c7e0>
145447719:     	nop
14544771a:     	leaq	0x1600(%rbp), %rdx
145447721:     	movl	$0x9c0, %r8d            # imm = 0x9C0
145447727:     	movq	0x2380(%rbp), %rcx
14544772e:     	callq	0x1457731ed <.text+0x57721ed>
145447733:     	movb	$0x0, 0x2397(%rbp)
14544773a:     	leaq	0x1600(%rbp), %rcx
145447741:     	callq	0x145456970 <.text+0x5455970>
145447746:     	nop
145447747:     	movb	$0x0, 0x2397(%rbp)
14544774e:     	leaq	0x12f6a44(%rip), %rax   # 0x14673e199
145447755:     	movq	%rax, 0x20(%rsp)
14544775a:     	movq	$0x5, 0x28(%rsp)
145447763:     	leaq	0x12f68f9(%rip), %r8    # 0x14673e063
14544776a:     	leaq	0x2330(%rbp), %rcx
145447771:     	leaq	0x1600(%rbp), %rdx
145447778:     	movl	$0x4, %r9d
14544777e:     	callq	0x145456ed0 <.text+0x5455ed0>
145447783:     	nop
145447784:     	movzbl	0x21cc(%rbp), %eax
14544778b:     	addb	$-0x2, %al
14544778d:     	cmpb	$0xa, %al
14544778f:     	jae	0x1454477a1 <.text+0x54467a1>
145447791:     	movzbl	%al, %eax
145447794:     	leaq	0x12f719d(%rip), %rcx   # 0x14673e938
14544779b:     	movq	(%rcx,%rax,8), %rcx
14544779f:     	jmp	0x1454477a8 <.text+0x54467a8>
1454477a1:     	leaq	0x12ee0a0(%rip), %rcx   # 0x146735848
1454477a8:     	movb	$0x1, 0x237d(%rbp)
1454477af:     	callq	0x14541f7c0 <.text+0x541e7c0>
1454477b4:     	nop
1454477b5:     	movb	$0x0, 0x237d(%rbp)
1454477bc:     	movq	%rdx, 0x28(%rsp)
1454477c1:     	movq	%rax, 0x20(%rsp)
1454477c6:     	leaq	0x12f6937(%rip), %r8    # 0x14673e104
1454477cd:     	leaq	0x1600(%rbp), %rcx
1454477d4:     	leaq	0x2330(%rbp), %rdx
1454477db:     	movl	$0x5, %r9d
1454477e1:     	callq	0x145456ed0 <.text+0x5455ed0>
1454477e6:     	nop
1454477e7:     	movb	$0x1, 0x237c(%rbp)
1454477ee:     	movq	0x2370(%rbp), %rcx
1454477f5:     	callq	0x14541f980 <.text+0x541e980>
1454477fa:     	nop
1454477fb:     	movb	$0x0, 0x237c(%rbp)
145447802:     	movq	%rdx, 0x28(%rsp)
145447807:     	movq	%rax, 0x20(%rsp)
14544780c:     	leaq	0x12f68ed(%rip), %r8    # 0x14673e100
145447813:     	leaq	0x2330(%rbp), %rcx
14544781a:     	leaq	0x1600(%rbp), %rdx
145447821:     	movl	$0x4, %r9d
145447827:     	callq	0x145456ed0 <.text+0x5455ed0>
14544782c:     	nop
14544782d:     	movdqu	0x2068(%rbp), %xmm0
145447835:     	movb	$0x0, 0x2397(%rbp)
14544783c:     	movdqu	%xmm0, 0x20(%rsp)
145447842:     	leaq	0x12f688f(%rip), %r8    # 0x14673e0d8
145447849:     	leaq	0x1600(%rbp), %rcx
145447850:     	leaq	0x2330(%rbp), %rdx
145447857:     	movl	$0x4, %r9d
14544785d:     	callq	0x145456ed0 <.text+0x5455ed0>
145447862:     	nop
145447863:     	movb	$0x1, 0x237b(%rbp)
14544786a:     	movq	0x2350(%rbp), %rsi
145447871:     	movq	%rsi, %rcx
145447874:     	callq	0x1454202c0 <.text+0x541f2c0>
145447879:     	nop
14544787a:     	movb	$0x0, 0x237b(%rbp)
145447881:     	movq	%rdx, 0x28(%rsp)
145447886:     	movq	%rax, 0x20(%rsp)
14544788b:     	leaq	0x12f690c(%rip), %r8    # 0x14673e19e
145447892:     	leaq	0x2330(%rbp), %rcx
145447899:     	leaq	0x1600(%rbp), %rdx
1454478a0:     	movl	$0x2, %r9d
1454478a6:     	callq	0x145456ed0 <.text+0x5455ed0>
1454478ab:     	nop
1454478ac:     	movb	$0x1, 0x237a(%rbp)
1454478b3:     	movq	%rsi, %rcx
1454478b6:     	callq	0x1454201e0 <.text+0x541f1e0>
1454478bb:     	nop
1454478bc:     	movb	$0x0, 0x237a(%rbp)
1454478c3:     	movq	%rdx, 0x28(%rsp)
1454478c8:     	movq	%rax, 0x20(%rsp)
1454478cd:     	leaq	0x12f68cc(%rip), %r8    # 0x14673e1a0
1454478d4:     	leaq	0x1600(%rbp), %rcx
1454478db:     	leaq	0x2330(%rbp), %rdx
1454478e2:     	movl	$0x8, %r9d
1454478e8:     	callq	0x145456ed0 <.text+0x5455ed0>
1454478ed:     	nop
1454478ee:     	movb	$0x0, 0x2397(%rbp)
1454478f5:     	leaq	0x2330(%rbp), %rcx
1454478fc:     	leaq	0x1600(%rbp), %rdx
145447903:     	callq	0x145456b70 <.text+0x5455b70>
145447908:     	nop
145447909:     	movq	0x2330(%rbp), %rax
145447910:     	movq	%rax, 0x2380(%rbp)
145447917:     	movq	0x2338(%rbp), %rdx
14544791e:     	movq	0x2340(%rbp), %r8
145447925:     	movq	0x2368(%rbp), %rax
14544792c:     	movq	0xf70(%rax), %rcx
145447933:     	movq	0xf78(%rax), %rax
14544793a:     	movq	%rdx, 0x2388(%rbp)
145447941:     	callq	*0x18(%rax)
145447944:     	nop
145447945:     	movq	0x2380(%rbp), %rdx
14544794c:     	testq	%rdx, %rdx
14544794f:     	je	0x145447963 <.text+0x5446963>
145447951:     	movl	$0x1, %r8d
145447957:     	movq	0x2388(%rbp), %rcx
14544795e:     	callq	0x1400021d0 <.text+0x11d0>
145447963:     	movq	0x2300(%rbp), %rdx
14544796a:     	testq	%rdx, %rdx
14544796d:     	movq	0x2360(%rbp), %rsi
145447974:     	movq	0x2320(%rbp), %rdi
14544797b:     	je	0x145447993 <.text+0x5446993>
14544797d:     	movq	0x2308(%rbp), %rcx
145447984:     	shlq	$0x2, %rdx
145447988:     	movl	$0x4, %r8d
14544798e:     	callq	0x1400021d0 <.text+0x11d0>
145447993:     	movq	0x2060(%rbp), %rdx
14544799a:     	testq	%rdx, %rdx
14544799d:     	je	0x1454479b1 <.text+0x54469b1>
14544799f:     	movq	0x2068(%rbp), %rcx
1454479a6:     	movl	$0x1, %r8d
1454479ac:     	callq	0x1400021d0 <.text+0x11d0>
1454479b1:     	movq	0x2078(%rbp), %rdx
1454479b8:     	testq	%rdx, %rdx
1454479bb:     	je	0x1454479d3 <.text+0x54469d3>
1454479bd:     	movq	0x2080(%rbp), %rcx
1454479c4:     	shlq	$0x4, %rdx
1454479c8:     	movl	$0x8, %r8d
1454479ce:     	callq	0x1400021d0 <.text+0x11d0>
1454479d3:     	testq	%rsi, %rsi
1454479d6:     	je	0x145447a82 <.text+0x5446a82>
1454479dc:     	movl	$0x1, %r8d
1454479e2:     	movq	%rdi, %rcx
1454479e5:     	movq	%rsi, %rdx
1454479e8:     	callq	0x1400021d0 <.text+0x11d0>
1454479ed:     	jmp	0x145447a82 <.text+0x5446a82>
1454479f2:     	movb	$0x45, %dil
1454479f5:     	jmp	0x145447a01 <.text+0x5446a01>
1454479f7:     	xorl	%edi, %edi
1454479f9:     	cmpq	$0xd, %r12
1454479fd:     	adcb	$0x47, %dil
145447a01:     	movq	0x2350(%rbp), %rdx
145447a08:     	testq	%rdx, %rdx
145447a0b:     	je	0x145447a1f <.text+0x5446a1f>
145447a0d:     	movl	$0x1, %r8d
145447a13:     	movq	0x2370(%rbp), %rcx
145447a1a:     	callq	0x1400021d0 <.text+0x11d0>
145447a1f:     	callq	0x140002200 <.text+0x1200>
145447a24:     	movl	$0x20, %ecx
145447a29:     	movl	$0x1, %edx
145447a2e:     	callq	0x1400021c0 <.text+0x11c0>
145447a33:     	testq	%rax, %rax
145447a36:     	je	0x1454482f0 <.text+0x54472f0>
145447a3c:     	movb	%dil, (%rax)
145447a3f:     	movq	$0x20, 0x1600(%rbp)
145447a4a:     	movq	%rax, 0x1608(%rbp)
145447a51:     	movq	$0x1, 0x1610(%rbp)
145447a5c:     	movw	$0x3a, 0x1618(%rbp)
145447a65:     	movq	0xa08(%rsi), %rcx
145447a6c:     	movq	0xa10(%rsi), %rdx
145447a73:     	leaq	0x1600(%rbp), %r9
145447a7a:     	movq	%r13, %r8
145447a7d:     	callq	0x14543f3c0 <.text+0x543e3c0>
145447a82:     	movaps	0x23a0(%rbp), %xmm6
145447a89:     	movaps	0x23b0(%rbp), %xmm7
145447a90:     	addq	$0x2448, %rsp           # imm = 0x2448
145447a97:     	popq	%rbx
145447a98:     	popq	%rdi
145447a99:     	popq	%rsi
145447a9a:     	popq	%r12
145447a9c:     	popq	%r13
145447a9e:     	popq	%r14
145447aa0:     	popq	%r15
145447aa2:     	popq	%rbp
145447aa3:     	retq
145447aa4:     	movq	-0x38(%r12), %rdx
145447aa9:     	testq	%rdx, %rdx
145447aac:     	je	0x145447ac5 <.text+0x5446ac5>
145447aae:     	movq	-0x30(%r12), %rcx
145447ab3:     	movl	$0x1, %r8d
145447ab9:     	callq	0x1400021d0 <.text+0x11d0>
145447abe:     	leaq	0xa18(%rsi), %rcx
145447ac5:     	leaq	0x1(%rdi), %rax
145447ac9:     	cmpq	%r13, %rax
145447acc:     	jae	0x145447b37 <.text+0x5446b37>
145447ace:     	subq	%rdi, %r15
145447ad1:     	jmp	0x145447b0e <.text+0x5446b0e>
145447ad3:     	imulq	$0x38, %rdi, %rax
145447ad7:     	movq	0x30(%r12), %rdx
145447adc:     	movq	%rdx, 0x30(%rbx,%rax)
145447ae1:     	movups	(%r12), %xmm0
145447ae6:     	movups	0x10(%r12), %xmm1
145447aec:     	movdqu	0x20(%r12), %xmm2
145447af3:     	movdqu	%xmm2, 0x20(%rbx,%rax)
145447af9:     	movups	%xmm1, 0x10(%rbx,%rax)
145447afe:     	movups	%xmm0, (%rbx,%rax)
145447b02:     	incq	%rdi
145447b05:     	addq	$0x38, %r12
145447b09:     	decq	%r15
145447b0c:     	je	0x145447b37 <.text+0x5446b37>
145447b0e:     	cmpq	%r14, 0x18(%r12)
145447b13:     	jne	0x145447ad3 <.text+0x5446ad3>
145447b15:     	movq	(%r12), %rdx
145447b19:     	testq	%rdx, %rdx
145447b1c:     	je	0x145447b05 <.text+0x5446b05>
145447b1e:     	movq	0x8(%r12), %rcx
145447b23:     	movl	$0x1, %r8d
145447b29:     	callq	0x1400021d0 <.text+0x11d0>
145447b2e:     	leaq	0xa18(%rsi), %rcx
145447b35:     	jmp	0x145447b05 <.text+0x5446b05>
145447b37:     	movq	%rdi, 0xa28(%rsi)
145447b3e:     	jmp	0x145444e77 <.text+0x5443e77>
145447b43:     	leaq	0x12e4676(%rip), %r14   # 0x14672c1c0
145447b4a:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447b4c:     	movq	%rsi, %rdi
145447b4f:     	leaq	0x12e425a(%rip), %r14   # 0x14672bdb0
145447b56:     	jmp	0x145447c19 <.text+0x5446c19>
145447b5b:     	movq	%rsi, %rdi
145447b5e:     	leaq	0x12e42eb(%rip), %r14   # 0x14672be50
145447b65:     	jmp	0x145447c19 <.text+0x5446c19>
145447b6a:     	movq	%rsi, %rdi
145447b6d:     	leaq	0x12e41ec(%rip), %r14   # 0x14672bd60
145447b74:     	jmp	0x145447c19 <.text+0x5446c19>
145447b79:     	movq	%rsi, %rdi
145447b7c:     	leaq	0x12e431d(%rip), %r14   # 0x14672bea0
145447b83:     	jmp	0x145447c19 <.text+0x5446c19>
145447b88:     	leaq	0x12e4689(%rip), %r14   # 0x14672c218
145447b8f:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447b91:     	movq	%rsi, %rdi
145447b94:     	leaq	0x12e40d5(%rip), %r14   # 0x14672bc70
145447b9b:     	jmp	0x145447c19 <.text+0x5446c19>
145447b9d:     	movq	%rsi, %rdi
145447ba0:     	leaq	0x12e4029(%rip), %r14   # 0x14672bbd0
145447ba7:     	jmp	0x145447c19 <.text+0x5446c19>
145447ba9:     	movq	%rsi, %rdi
145447bac:     	leaq	0x12e3fcd(%rip), %r14   # 0x14672bb80
145447bb3:     	jmp	0x145447c19 <.text+0x5446c19>
145447bb5:     	leaq	0x12e45ac(%rip), %r14   # 0x14672c168
145447bbc:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447bbe:     	leaq	0x12e46ab(%rip), %r14   # 0x14672c270
145447bc5:     	movq	%r14, %rcx
145447bc8:     	callq	0x145420100 <.text+0x541f100>
145447bcd:     	movq	%rax, %r8
145447bd0:     	movq	%rdx, %r12
145447bd3:     	movl	0x34(%r14), %r9d
145447bd7:     	movl	0x3c(%r14), %ecx
145447bdb:     	movl	$0x1, %eax
145447be0:     	movl	$0x3, %r10d
145447be6:     	jmp	0x145444c83 <.text+0x5443c83>
145447beb:     	movq	%rsi, %rdi
145447bee:     	leaq	0x12e402b(%rip), %r14   # 0x14672bc20
145447bf5:     	jmp	0x145447c19 <.text+0x5446c19>
145447bf7:     	movq	%rsi, %rdi
145447bfa:     	leaq	0x12e40bf(%rip), %r14   # 0x14672bcc0
145447c01:     	jmp	0x145447c19 <.text+0x5446c19>
145447c03:     	movq	%rsi, %rdi
145447c06:     	leaq	0x12e4103(%rip), %r14   # 0x14672bd10
145447c0d:     	jmp	0x145447c19 <.text+0x5446c19>
145447c0f:     	movq	%rsi, %rdi
145447c12:     	leaq	0x12e41e7(%rip), %r14   # 0x14672be00
145447c19:     	movq	%r14, %rcx
145447c1c:     	callq	0x145420020 <.text+0x541f020>
145447c21:     	movq	%rax, %r13
145447c24:     	movq	%rdx, %r12
145447c27:     	movq	%r15, %rcx
145447c2a:     	callq	0x1454201e0 <.text+0x541f1e0>
145447c2f:     	movq	%r13, %r8
145447c32:     	movl	0x24(%r14), %r9d
145447c36:     	movl	0x2c(%r14), %ecx
145447c3a:     	movzbl	0x4c(%r14), %r10d
145447c3f:     	movq	%rdi, %rsi
145447c42:     	jmp	0x145444c85 <.text+0x5443c85>
145447c47:     	cmpl	$0x4af, %ebx            # imm = 0x4AF
145447c4d:     	jg	0x145447d1b <.text+0x5446d1b>
145447c53:     	leal	-0x2b6(%rbx), %eax
145447c59:     	cmpl	$0x64, %eax
145447c5c:     	ja	0x145447d4c <.text+0x5446d4c>
145447c62:     	leaq	0x12eb99f(%rip), %r15   # 0x146733608
145447c69:     	leaq	0x12f7230(%rip), %rcx   # 0x14673eea0
145447c70:     	movslq	(%rcx,%rax,4), %rax
145447c74:     	addq	%rcx, %rax
145447c77:     	jmpq	*%rax
145447c79:     	leaq	0x12e4648(%rip), %r14   # 0x14672c2c8
145447c80:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447c85:     	leaq	0x159294c(%rip), %rdi   # 0x1469da5d8
145447c8c:     	jmp	0x145447cb9 <.text+0x5446cb9>
145447c8e:     	leaq	0x15aa2a3(%rip), %rdi   # 0x1469f1f38
145447c95:     	jmp	0x145447cb9 <.text+0x5446cb9>
145447c97:     	leaq	0x15aa1ea(%rip), %rdi   # 0x1469f1e88
145447c9e:     	jmp	0x145447cb9 <.text+0x5446cb9>
145447ca0:     	leaq	0x15aa2c9(%rip), %rdi   # 0x1469f1f70
145447ca7:     	jmp	0x145447cb9 <.text+0x5446cb9>
145447ca9:     	leaq	0x15aa250(%rip), %rdi   # 0x1469f1f00
145447cb0:     	jmp	0x145447cb9 <.text+0x5446cb9>
145447cb2:     	leaq	0x15aa197(%rip), %rdi   # 0x1469f1e50
145447cb9:     	movq	(%rdi), %r14
145447cbc:     	movq	0x8(%rdi), %r15
145447cc0:     	movq	%r14, %rcx
145447cc3:     	movq	%r15, %rdx
145447cc6:     	callq	0x145457cb0 <.text+0x5456cb0>
145447ccb:     	movq	%rax, %r13
145447cce:     	movq	%rdx, %r12
145447cd1:     	testq	%rax, %rax
145447cd4:     	cmoveq	%r15, %r12
145447cd8:     	cmoveq	%r14, %r13
145447cdc:     	leaq	0x12f6b46(%rip), %r14   # 0x14673e829
145447ce3:     	movl	$0x9, %esi
145447ce8:     	movl	$0x9, %edx
145447ced:     	movq	%r14, %rcx
145447cf0:     	callq	0x145457cb0 <.text+0x5456cb0>
145447cf5:     	movq	%r13, %r8
145447cf8:     	testq	%rax, %rax
145447cfb:     	cmoveq	%r14, %rax
145447cff:     	cmoveq	%rsi, %rdx
145447d03:     	movl	0x14(%rdi), %r9d
145447d07:     	movl	$0x1, %ecx
145447d0c:     	xorl	%r10d, %r10d
145447d0f:     	movq	0x2368(%rbp), %rsi
145447d16:     	jmp	0x145444c85 <.text+0x5443c85>
145447d1b:     	leal	-0x4b0(%rbx), %eax
145447d21:     	cmpl	$0x5e, %eax
145447d24:     	ja	0x145447d7e <.text+0x5446d7e>
145447d26:     	leaq	0x12f7307(%rip), %rcx   # 0x14673f034
145447d2d:     	movslq	(%rcx,%rax,4), %rax
145447d31:     	addq	%rcx, %rax
145447d34:     	jmpq	*%rax
145447d36:     	movq	%rsi, %rdi
145447d39:     	leaq	0x12e5b78(%rip), %r14   # 0x14672d8b8
145447d40:     	leaq	0x12ebaa1(%rip), %r15   # 0x1467337e8
145447d47:     	jmp	0x145447c19 <.text+0x5446c19>
145447d4c:     	leal	-0x64(%rbx), %eax
145447d4f:     	cmpl	$0x5e, %eax
145447d52:     	ja	0x145448227 <.text+0x5447227>
145447d58:     	leaq	0x12f6fc5(%rip), %rcx   # 0x14673ed24
145447d5f:     	movslq	(%rcx,%rax,4), %rax
145447d63:     	addq	%rcx, %rax
145447d66:     	jmpq	*%rax
145447d68:     	movq	%rsi, %rdi
145447d6b:     	leaq	0x12e51ae(%rip), %r14   # 0x14672cf20
145447d72:     	leaq	0x12eb97f(%rip), %r15   # 0x1467336f8
145447d79:     	jmp	0x145447c19 <.text+0x5446c19>
145447d7e:     	leal	-0x5dc(%rbx), %eax
145447d84:     	cmpl	$0xb, %eax
145447d87:     	ja	0x145448227 <.text+0x5447227>
145447d8d:     	movq	%rsi, %rdi
145447d90:     	leaq	0x12f7419(%rip), %rcx   # 0x14673f1b0
145447d97:     	movslq	(%rcx,%rax,4), %rax
145447d9b:     	addq	%rcx, %rax
145447d9e:     	jmpq	*%rax
145447da0:     	leaq	0x12e6509(%rip), %r14   # 0x14672e2b0
145447da7:     	leaq	0x12ebb2a(%rip), %r15   # 0x1467338d8
145447dae:     	jmp	0x145447c19 <.text+0x5446c19>
145447db3:     	movq	$0x1, 0x20(%rsp)
145447dbc:     	leaq	0xb60(%rbp), %rcx
145447dc3:     	movq	%r8, %rdx
145447dc6:     	movl	$0x1, %r8d
145447dcc:     	movl	$0x1, %r9d
145447dd2:     	movq	%rdx, %r12
145447dd5:     	callq	0x1457744b0 <.text+0x57734b0>
145447dda:     	nop
145447ddb:     	movq	0xb60(%rbp), %rax
145447de2:     	movq	%rax, 0x2380(%rbp)
145447de9:     	movq	%r12, %r8
145447dec:     	jmp	0x145444909 <.text+0x5443909>
145447df1:     	movq	0x1610(%rbp), %rdx
145447df8:     	movq	0x2350(%rbp), %rcx
145447dff:     	callq	0x14590379b <.text+0x590279b>
145447e04:     	nop
145447e05:     	jmp	0x1454487e4 <.text+0x54477e4>
145447e0a:     	movq	%rsi, %rdi
145447e0d:     	leaq	0x12e5b94(%rip), %r14   # 0x14672d9a8
145447e14:     	leaq	0x12eb9cd(%rip), %r15   # 0x1467337e8
145447e1b:     	jmp	0x145447c19 <.text+0x5446c19>
145447e20:     	movq	%rsi, %rdi
145447e23:     	leaq	0x12e5bce(%rip), %r14   # 0x14672d9f8
145447e2a:     	leaq	0x12eb9b7(%rip), %r15   # 0x1467337e8
145447e31:     	jmp	0x145447c19 <.text+0x5446c19>
145447e36:     	movq	%rsi, %rdi
145447e39:     	leaq	0x12e5c08(%rip), %r14   # 0x14672da48
145447e40:     	leaq	0x12eb9a1(%rip), %r15   # 0x1467337e8
145447e47:     	jmp	0x145447c19 <.text+0x5446c19>
145447e4c:     	movq	%rsi, %rdi
145447e4f:     	leaq	0x12e5dd2(%rip), %r14   # 0x14672dc28
145447e56:     	leaq	0x12eb98b(%rip), %r15   # 0x1467337e8
145447e5d:     	jmp	0x145447c19 <.text+0x5446c19>
145447e62:     	movq	%rsi, %rdi
145447e65:     	leaq	0x12e5c2c(%rip), %r14   # 0x14672da98
145447e6c:     	leaq	0x12eb975(%rip), %r15   # 0x1467337e8
145447e73:     	jmp	0x145447c19 <.text+0x5446c19>
145447e78:     	movq	%rsi, %rdi
145447e7b:     	leaq	0x12e5a86(%rip), %r14   # 0x14672d908
145447e82:     	leaq	0x12eb95f(%rip), %r15   # 0x1467337e8
145447e89:     	jmp	0x145447c19 <.text+0x5446c19>
145447e8e:     	leaq	0x12e6173(%rip), %r14   # 0x14672e008
145447e95:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447e9a:     	movq	%rsi, %rdi
145447e9d:     	leaq	0x12e5ab4(%rip), %r14   # 0x14672d958
145447ea4:     	leaq	0x12eb93d(%rip), %r15   # 0x1467337e8
145447eab:     	jmp	0x145447c19 <.text+0x5446c19>
145447eb0:     	movq	%rsi, %rdi
145447eb3:     	leaq	0x12e5d1e(%rip), %r14   # 0x14672dbd8
145447eba:     	leaq	0x12eb927(%rip), %r15   # 0x1467337e8
145447ec1:     	jmp	0x145447c19 <.text+0x5446c19>
145447ec6:     	movq	%rsi, %rdi
145447ec9:     	leaq	0x12e5c18(%rip), %r14   # 0x14672dae8
145447ed0:     	leaq	0x12eb911(%rip), %r15   # 0x1467337e8
145447ed7:     	jmp	0x145447c19 <.text+0x5446c19>
145447edc:     	movq	%rsi, %rdi
145447edf:     	leaq	0x12e5c52(%rip), %r14   # 0x14672db38
145447ee6:     	leaq	0x12eb8fb(%rip), %r15   # 0x1467337e8
145447eed:     	jmp	0x145447c19 <.text+0x5446c19>
145447ef2:     	movq	%rsi, %rdi
145447ef5:     	leaq	0x12e5c8c(%rip), %r14   # 0x14672db88
145447efc:     	leaq	0x12eb8e5(%rip), %r15   # 0x1467337e8
145447f03:     	jmp	0x145447c19 <.text+0x5446c19>
145447f08:     	leaq	0x12e6049(%rip), %r14   # 0x14672df58
145447f0f:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447f14:     	leaq	0x12e6145(%rip), %r14   # 0x14672e060
145447f1b:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447f20:     	leaq	0x12e6191(%rip), %r14   # 0x14672e0b8
145447f27:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447f2c:     	leaq	0x12e607d(%rip), %r14   # 0x14672dfb0
145447f33:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447f38:     	leaq	0x12e4c21(%rip), %r14   # 0x14672cb60
145447f3f:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447f44:     	movq	%rsi, %rdi
145447f47:     	leaq	0x12e47f2(%rip), %r14   # 0x14672c740
145447f4e:     	jmp	0x145447c19 <.text+0x5446c19>
145447f53:     	movq	%rsi, %rdi
145447f56:     	leaq	0x12e4603(%rip), %r14   # 0x14672c560
145447f5d:     	jmp	0x145447c19 <.text+0x5446c19>
145447f62:     	movq	%rsi, %rdi
145447f65:     	leaq	0x12e48c4(%rip), %r14   # 0x14672c830
145447f6c:     	jmp	0x145447c19 <.text+0x5446c19>
145447f71:     	leaq	0x12e4b90(%rip), %r14   # 0x14672cb08
145447f78:     	jmp	0x145447bc5 <.text+0x5446bc5>
145447f7d:     	movq	%rsi, %rdi
145447f80:     	leaq	0x12e4629(%rip), %r14   # 0x14672c5b0
145447f87:     	jmp	0x145447c19 <.text+0x5446c19>
145447f8c:     	movq	%rsi, %rdi
145447f8f:     	leaq	0x12e475a(%rip), %r14   # 0x14672c6f0
145447f96:     	jmp	0x145447c19 <.text+0x5446c19>
145447f9b:     	movq	%rsi, %rdi
145447f9e:     	leaq	0x12e47eb(%rip), %r14   # 0x14672c790
145447fa5:     	jmp	0x145447c19 <.text+0x5446c19>
145447faa:     	movq	%rsi, %rdi
145447fad:     	leaq	0x12e469c(%rip), %r14   # 0x14672c650
145447fb4:     	jmp	0x145447c19 <.text+0x5446c19>
145447fb9:     	movq	%rsi, %rdi
145447fbc:     	leaq	0x12e44fd(%rip), %r14   # 0x14672c4c0
145447fc3:     	jmp	0x145447c19 <.text+0x5446c19>
145447fc8:     	movq	%rsi, %rdi
145447fcb:     	leaq	0x12e480e(%rip), %r14   # 0x14672c7e0
145447fd2:     	jmp	0x145447c19 <.text+0x5446c19>
145447fd7:     	movq	%rsi, %rdi
145447fda:     	leaq	0x12e452f(%rip), %r14   # 0x14672c510
145447fe1:     	jmp	0x145447c19 <.text+0x5446c19>
145447fe6:     	movq	%rsi, %rdi
145447fe9:     	leaq	0x12e4610(%rip), %r14   # 0x14672c600
145447ff0:     	jmp	0x145447c19 <.text+0x5446c19>
145447ff5:     	leaq	0x12e4c6c(%rip), %r14   # 0x14672cc68
145447ffc:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448001:     	movq	%rsi, %rdi
145448004:     	leaq	0x12e4695(%rip), %r14   # 0x14672c6a0
14544800b:     	jmp	0x145447c19 <.text+0x5446c19>
145448010:     	leaq	0x12e4bf9(%rip), %r14   # 0x14672cc10
145448017:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544801c:     	leaq	0x12e4b95(%rip), %r14   # 0x14672cbb8
145448023:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448028:     	movq	%rsi, %rdi
14544802b:     	leaq	0x12e4fde(%rip), %r14   # 0x14672d010
145448032:     	leaq	0x12eb6bf(%rip), %r15   # 0x1467336f8
145448039:     	jmp	0x145447c19 <.text+0x5446c19>
14544803e:     	movq	%rsi, %rdi
145448041:     	leaq	0x12e5068(%rip), %r14   # 0x14672d0b0
145448048:     	leaq	0x12eb6a9(%rip), %r15   # 0x1467336f8
14544804f:     	jmp	0x145447c19 <.text+0x5446c19>
145448054:     	movq	%rsi, %rdi
145448057:     	leaq	0x12e50a2(%rip), %r14   # 0x14672d100
14544805e:     	leaq	0x12eb693(%rip), %r15   # 0x1467336f8
145448065:     	jmp	0x145447c19 <.text+0x5446c19>
14544806a:     	movq	%rsi, %rdi
14544806d:     	leaq	0x12e521c(%rip), %r14   # 0x14672d290
145448074:     	leaq	0x12eb67d(%rip), %r15   # 0x1467336f8
14544807b:     	jmp	0x145447c19 <.text+0x5446c19>
145448080:     	movq	%rsi, %rdi
145448083:     	leaq	0x12e5166(%rip), %r14   # 0x14672d1f0
14544808a:     	leaq	0x12eb667(%rip), %r15   # 0x1467336f8
145448091:     	jmp	0x145447c19 <.text+0x5446c19>
145448096:     	movq	%rsi, %rdi
145448099:     	leaq	0x12e4ed0(%rip), %r14   # 0x14672cf70
1454480a0:     	leaq	0x12eb651(%rip), %r15   # 0x1467336f8
1454480a7:     	jmp	0x145447c19 <.text+0x5446c19>
1454480ac:     	leaq	0x12e5595(%rip), %r14   # 0x14672d648
1454480b3:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454480b8:     	movq	%rsi, %rdi
1454480bb:     	leaq	0x12e4f9e(%rip), %r14   # 0x14672d060
1454480c2:     	leaq	0x12eb62f(%rip), %r15   # 0x1467336f8
1454480c9:     	jmp	0x145447c19 <.text+0x5446c19>
1454480ce:     	movq	%rsi, %rdi
1454480d1:     	leaq	0x12e50c8(%rip), %r14   # 0x14672d1a0
1454480d8:     	leaq	0x12eb619(%rip), %r15   # 0x1467336f8
1454480df:     	jmp	0x145447c19 <.text+0x5446c19>
1454480e4:     	movq	%rsi, %rdi
1454480e7:     	leaq	0x12e5152(%rip), %r14   # 0x14672d240
1454480ee:     	leaq	0x12eb603(%rip), %r15   # 0x1467336f8
1454480f5:     	jmp	0x145447c19 <.text+0x5446c19>
1454480fa:     	movq	%rsi, %rdi
1454480fd:     	leaq	0x12e4ebc(%rip), %r14   # 0x14672cfc0
145448104:     	leaq	0x12eb5ed(%rip), %r15   # 0x1467336f8
14544810b:     	jmp	0x145447c19 <.text+0x5446c19>
145448110:     	movq	%rsi, %rdi
145448113:     	leaq	0x12e5036(%rip), %r14   # 0x14672d150
14544811a:     	leaq	0x12eb5d7(%rip), %r15   # 0x1467336f8
145448121:     	jmp	0x145447c19 <.text+0x5446c19>
145448126:     	leaq	0x12e546b(%rip), %r14   # 0x14672d598
14544812d:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448132:     	leaq	0x12e55bf(%rip), %r14   # 0x14672d6f8
145448139:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544813e:     	leaq	0x12e555b(%rip), %r14   # 0x14672d6a0
145448145:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544814a:     	leaq	0x12e549f(%rip), %r14   # 0x14672d5f0
145448151:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448156:     	leaq	0x12e64c3(%rip), %r14   # 0x14672e620
14544815d:     	leaq	0x12eb774(%rip), %r15   # 0x1467338d8
145448164:     	jmp	0x145447c19 <.text+0x5446c19>
145448169:     	leaq	0x12e6280(%rip), %r14   # 0x14672e3f0
145448170:     	leaq	0x12eb761(%rip), %r15   # 0x1467338d8
145448177:     	jmp	0x145447c19 <.text+0x5446c19>
14544817c:     	leaq	0x12e63fd(%rip), %r14   # 0x14672e580
145448183:     	leaq	0x12eb74e(%rip), %r15   # 0x1467338d8
14544818a:     	jmp	0x145447c19 <.text+0x5446c19>
14544818f:     	leaq	0x12e61ba(%rip), %r14   # 0x14672e350
145448196:     	leaq	0x12eb73b(%rip), %r15   # 0x1467338d8
14544819d:     	jmp	0x145447c19 <.text+0x5446c19>
1454481a2:     	leaq	0x12e61f7(%rip), %r14   # 0x14672e3a0
1454481a9:     	leaq	0x12eb728(%rip), %r15   # 0x1467338d8
1454481b0:     	jmp	0x145447c19 <.text+0x5446c19>
1454481b5:     	leaq	0x12e6324(%rip), %r14   # 0x14672e4e0
1454481bc:     	leaq	0x12eb715(%rip), %r15   # 0x1467338d8
1454481c3:     	jmp	0x145447c19 <.text+0x5446c19>
1454481c8:     	leaq	0x12e6131(%rip), %r14   # 0x14672e300
1454481cf:     	leaq	0x12eb702(%rip), %r15   # 0x1467338d8
1454481d6:     	jmp	0x145447c19 <.text+0x5446c19>
1454481db:     	leaq	0x12e625e(%rip), %r14   # 0x14672e440
1454481e2:     	leaq	0x12eb6ef(%rip), %r15   # 0x1467338d8
1454481e9:     	jmp	0x145447c19 <.text+0x5446c19>
1454481ee:     	leaq	0x12e629b(%rip), %r14   # 0x14672e490
1454481f5:     	leaq	0x12eb6dc(%rip), %r15   # 0x1467338d8
1454481fc:     	jmp	0x145447c19 <.text+0x5446c19>
145448201:     	leaq	0x12e63c8(%rip), %r14   # 0x14672e5d0
145448208:     	leaq	0x12eb6c9(%rip), %r15   # 0x1467338d8
14544820f:     	jmp	0x145447c19 <.text+0x5446c19>
145448214:     	leaq	0x12e6315(%rip), %r14   # 0x14672e530
14544821b:     	leaq	0x12eb6b6(%rip), %r15   # 0x1467338d8
145448222:     	jmp	0x145447c19 <.text+0x5446c19>
145448227:     	movq	%rsi, %rdi
14544822a:     	cmpl	$0x513, %ebx            # imm = 0x513
145448230:     	jg	0x145448262 <.text+0x5447262>
145448232:     	leal	-0x320(%rbx), %eax
145448238:     	cmpl	$0xc2, %eax
14544823d:     	ja	0x145448290 <.text+0x5447290>
14544823f:     	leaq	0x12eb782(%rip), %r15   # 0x1467339c8
145448246:     	leaq	0x12f6fbb(%rip), %rcx   # 0x14673f208
14544824d:     	movslq	(%rcx,%rax,4), %rax
145448251:     	addq	%rcx, %rax
145448254:     	jmpq	*%rax
145448256:     	leaq	0x12e6a73(%rip), %r14   # 0x14672ecd0
14544825d:     	jmp	0x145447c19 <.text+0x5446c19>
145448262:     	leal	-0x514(%rbx), %eax
145448268:     	cmpl	$0x5e, %eax
14544826b:     	ja	0x1454482c2 <.text+0x54472c2>
14544826d:     	leaq	0x12f72a0(%rip), %rcx   # 0x14673f514
145448274:     	movslq	(%rcx,%rax,4), %rax
145448278:     	addq	%rcx, %rax
14544827b:     	jmpq	*%rax
14544827d:     	leaq	0x12e7ebc(%rip), %r14   # 0x146730140
145448284:     	leaq	0x12eb91d(%rip), %r15   # 0x146733ba8
14544828b:     	jmp	0x145447c19 <.text+0x5446c19>
145448290:     	leal	-0x12c(%rbx), %eax
145448296:     	cmpl	$0x9, %eax
145448299:     	ja	0x1454486a0 <.text+0x54476a0>
14544829f:     	leaq	0x12f6f3a(%rip), %rcx   # 0x14673f1e0
1454482a6:     	movslq	(%rcx,%rax,4), %rax
1454482aa:     	addq	%rcx, %rax
1454482ad:     	jmpq	*%rax
1454482af:     	leaq	0x12e88aa(%rip), %r14   # 0x146730b60
1454482b6:     	leaq	0x12eb9db(%rip), %r15   # 0x146733c98
1454482bd:     	jmp	0x145447c19 <.text+0x5446c19>
1454482c2:     	leal	-0x636(%rbx), %eax
1454482c8:     	cmpl	$0x4, %eax
1454482cb:     	ja	0x1454486a0 <.text+0x54476a0>
1454482d1:     	leaq	0x12f73b8(%rip), %rcx   # 0x14673f690
1454482d8:     	movslq	(%rcx,%rax,4), %rax
1454482dc:     	addq	%rcx, %rax
1454482df:     	jmpq	*%rax
1454482e1:     	leaq	0x12e6678(%rip), %r14   # 0x14672e960
1454482e8:     	movq	%rdi, %rsi
1454482eb:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454482f0:     	movl	$0x1, %ecx
1454482f5:     	movl	$0x20, %edx
1454482fa:     	callq	0x14590379b <.text+0x590279b>
1454482ff:     	ud2
145448301:     	leaq	0x12e7f28(%rip), %r14   # 0x146730230
145448308:     	leaq	0x12eb899(%rip), %r15   # 0x146733ba8
14544830f:     	jmp	0x145447c19 <.text+0x5446c19>
145448314:     	leaq	0x12e7f65(%rip), %r14   # 0x146730280
14544831b:     	leaq	0x12eb886(%rip), %r15   # 0x146733ba8
145448322:     	jmp	0x145447c19 <.text+0x5446c19>
145448327:     	leaq	0x12e7fa2(%rip), %r14   # 0x1467302d0
14544832e:     	leaq	0x12eb873(%rip), %r15   # 0x146733ba8
145448335:     	jmp	0x145447c19 <.text+0x5446c19>
14544833a:     	leaq	0x12e7fdf(%rip), %r14   # 0x146730320
145448341:     	leaq	0x12eb860(%rip), %r15   # 0x146733ba8
145448348:     	jmp	0x145447c19 <.text+0x5446c19>
14544834d:     	leaq	0x12e815c(%rip), %r14   # 0x1467304b0
145448354:     	leaq	0x12eb84d(%rip), %r15   # 0x146733ba8
14544835b:     	jmp	0x145447c19 <.text+0x5446c19>
145448360:     	leaq	0x12e7e29(%rip), %r14   # 0x146730190
145448367:     	leaq	0x12eb83a(%rip), %r15   # 0x146733ba8
14544836e:     	jmp	0x145447c19 <.text+0x5446c19>
145448373:     	leaq	0x12e7e66(%rip), %r14   # 0x1467301e0
14544837a:     	leaq	0x12eb827(%rip), %r15   # 0x146733ba8
145448381:     	jmp	0x145447c19 <.text+0x5446c19>
145448386:     	leaq	0x12e80d3(%rip), %r14   # 0x146730460
14544838d:     	leaq	0x12eb814(%rip), %r15   # 0x146733ba8
145448394:     	jmp	0x145447c19 <.text+0x5446c19>
145448399:     	leaq	0x12e84f0(%rip), %r14   # 0x146730890
1454483a0:     	movq	%rdi, %rsi
1454483a3:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454483a8:     	leaq	0x12e7fc1(%rip), %r14   # 0x146730370
1454483af:     	leaq	0x12eb7f2(%rip), %r15   # 0x146733ba8
1454483b6:     	jmp	0x145447c19 <.text+0x5446c19>
1454483bb:     	leaq	0x12e7ffe(%rip), %r14   # 0x1467303c0
1454483c2:     	leaq	0x12eb7df(%rip), %r15   # 0x146733ba8
1454483c9:     	jmp	0x145447c19 <.text+0x5446c19>
1454483ce:     	leaq	0x12e803b(%rip), %r14   # 0x146730410
1454483d5:     	leaq	0x12eb7cc(%rip), %r15   # 0x146733ba8
1454483dc:     	jmp	0x145447c19 <.text+0x5446c19>
1454483e1:     	leaq	0x12e83f8(%rip), %r14   # 0x1467307e0
1454483e8:     	movq	%rdi, %rsi
1454483eb:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454483f0:     	leaq	0x12e8441(%rip), %r14   # 0x146730838
1454483f7:     	movq	%rdi, %rsi
1454483fa:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454483ff:     	leaq	0x12e84e2(%rip), %r14   # 0x1467308e8
145448406:     	movq	%rdi, %rsi
145448409:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544840e:     	leaq	0x12e852b(%rip), %r14   # 0x146730940
145448415:     	movq	%rdi, %rsi
145448418:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544841d:     	leaq	0x12e79ac(%rip), %r14   # 0x14672fdd0
145448424:     	movq	%rdi, %rsi
145448427:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544842c:     	leaq	0x12e752d(%rip), %r14   # 0x14672f960
145448433:     	leaq	0x12eb67e(%rip), %r15   # 0x146733ab8
14544843a:     	jmp	0x145447c19 <.text+0x5446c19>
14544843f:     	leaq	0x12e79e2(%rip), %r14   # 0x14672fe28
145448446:     	movq	%rdi, %rsi
145448449:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544844e:     	leaq	0x12e75ab(%rip), %r14   # 0x14672fa00
145448455:     	leaq	0x12eb65c(%rip), %r15   # 0x146733ab8
14544845c:     	jmp	0x145447c19 <.text+0x5446c19>
145448461:     	leaq	0x12e6b88(%rip), %r14   # 0x14672eff0
145448468:     	jmp	0x145447c19 <.text+0x5446c19>
14544846d:     	leaq	0x12e721c(%rip), %r14   # 0x14672f690
145448474:     	leaq	0x12eb63d(%rip), %r15   # 0x146733ab8
14544847b:     	jmp	0x145447c19 <.text+0x5446c19>
145448480:     	leaq	0x12e7529(%rip), %r14   # 0x14672f9b0
145448487:     	leaq	0x12eb62a(%rip), %r15   # 0x146733ab8
14544848e:     	jmp	0x145447c19 <.text+0x5446c19>
145448493:     	leaq	0x12e6fa6(%rip), %r14   # 0x14672f440
14544849a:     	movq	%rdi, %rsi
14544849d:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454484a2:     	leaq	0x12e7377(%rip), %r14   # 0x14672f820
1454484a9:     	leaq	0x12eb608(%rip), %r15   # 0x146733ab8
1454484b0:     	jmp	0x145447c19 <.text+0x5446c19>
1454484b5:     	leaq	0x12e6864(%rip), %r14   # 0x14672ed20
1454484bc:     	jmp	0x145447c19 <.text+0x5446c19>
1454484c1:     	leaq	0x12e68a8(%rip), %r14   # 0x14672ed70
1454484c8:     	jmp	0x145447c19 <.text+0x5446c19>
1454484cd:     	leaq	0x12e68ec(%rip), %r14   # 0x14672edc0
1454484d4:     	jmp	0x145447c19 <.text+0x5446c19>
1454484d9:     	leaq	0x12e6980(%rip), %r14   # 0x14672ee60
1454484e0:     	jmp	0x145447c19 <.text+0x5446c19>
1454484e5:     	leaq	0x12e69c4(%rip), %r14   # 0x14672eeb0
1454484ec:     	jmp	0x145447c19 <.text+0x5446c19>
1454484f1:     	leaq	0x12e6a08(%rip), %r14   # 0x14672ef00
1454484f8:     	jmp	0x145447c19 <.text+0x5446c19>
1454484fd:     	leaq	0x12e6a4c(%rip), %r14   # 0x14672ef50
145448504:     	jmp	0x145447c19 <.text+0x5446c19>
145448509:     	leaq	0x12e6a90(%rip), %r14   # 0x14672efa0
145448510:     	jmp	0x145447c19 <.text+0x5446c19>
145448515:     	leaq	0x12e6e74(%rip), %r14   # 0x14672f390
14544851c:     	movq	%rdi, %rsi
14544851f:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448524:     	leaq	0x12e72a5(%rip), %r14   # 0x14672f7d0
14544852b:     	leaq	0x12eb586(%rip), %r15   # 0x146733ab8
145448532:     	jmp	0x145447c19 <.text+0x5446c19>
145448537:     	leaq	0x12e68d2(%rip), %r14   # 0x14672ee10
14544853e:     	jmp	0x145447c19 <.text+0x5446c19>
145448543:     	leaq	0x12e6af6(%rip), %r14   # 0x14672f040
14544854a:     	jmp	0x145447c19 <.text+0x5446c19>
14544854f:     	leaq	0x12e6de2(%rip), %r14   # 0x14672f338
145448556:     	movq	%rdi, %rsi
145448559:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544855e:     	leaq	0x12e6e83(%rip), %r14   # 0x14672f3e8
145448565:     	movq	%rdi, %rsi
145448568:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544856d:     	leaq	0x12e790c(%rip), %r14   # 0x14672fe80
145448574:     	movq	%rdi, %rsi
145448577:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544857c:     	leaq	0x12e7955(%rip), %r14   # 0x14672fed8
145448583:     	movq	%rdi, %rsi
145448586:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544858b:     	leaq	0x12e714e(%rip), %r14   # 0x14672f6e0
145448592:     	leaq	0x12eb51f(%rip), %r15   # 0x146733ab8
145448599:     	jmp	0x145447c19 <.text+0x5446c19>
14544859e:     	leaq	0x12e72cb(%rip), %r14   # 0x14672f870
1454485a5:     	leaq	0x12eb50c(%rip), %r15   # 0x146733ab8
1454485ac:     	jmp	0x145447c19 <.text+0x5446c19>
1454485b1:     	leaq	0x12e7358(%rip), %r14   # 0x14672f910
1454485b8:     	leaq	0x12eb4f9(%rip), %r15   # 0x146733ab8
1454485bf:     	jmp	0x145447c19 <.text+0x5446c19>
1454485c4:     	leaq	0x12e6ecd(%rip), %r14   # 0x14672f498
1454485cb:     	movq	%rdi, %rsi
1454485ce:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454485d3:     	leaq	0x12e72e6(%rip), %r14   # 0x14672f8c0
1454485da:     	leaq	0x12eb4d7(%rip), %r15   # 0x146733ab8
1454485e1:     	jmp	0x145447c19 <.text+0x5446c19>
1454485e6:     	leaq	0x12e7193(%rip), %r14   # 0x14672f780
1454485ed:     	leaq	0x12eb4c4(%rip), %r15   # 0x146733ab8
1454485f4:     	jmp	0x145447c19 <.text+0x5446c19>
1454485f9:     	leaq	0x12e7130(%rip), %r14   # 0x14672f730
145448600:     	leaq	0x12eb4b1(%rip), %r15   # 0x146733ab8
145448607:     	jmp	0x145447c19 <.text+0x5446c19>
14544860c:     	leaq	0x12e7765(%rip), %r14   # 0x14672fd78
145448613:     	movq	%rdi, %rsi
145448616:     	jmp	0x145447bc5 <.text+0x5446bc5>
14544861b:     	leaq	0x12e876e(%rip), %r14   # 0x146730d90
145448622:     	leaq	0x12eb66f(%rip), %r15   # 0x146733c98
145448629:     	jmp	0x145447c19 <.text+0x5446c19>
14544862e:     	leaq	0x12e866b(%rip), %r14   # 0x146730ca0
145448635:     	leaq	0x12eb65c(%rip), %r15   # 0x146733c98
14544863c:     	jmp	0x145447c19 <.text+0x5446c19>
145448641:     	leaq	0x12e86a8(%rip), %r14   # 0x146730cf0
145448648:     	leaq	0x12eb649(%rip), %r15   # 0x146733c98
14544864f:     	jmp	0x145447c19 <.text+0x5446c19>
145448654:     	leaq	0x12e86e5(%rip), %r14   # 0x146730d40
14544865b:     	leaq	0x12eb636(%rip), %r15   # 0x146733c98
145448662:     	jmp	0x145447c19 <.text+0x5446c19>
145448667:     	leaq	0x12e8592(%rip), %r14   # 0x146730c00
14544866e:     	leaq	0x12eb623(%rip), %r15   # 0x146733c98
145448675:     	jmp	0x145447c19 <.text+0x5446c19>
14544867a:     	leaq	0x12e852f(%rip), %r14   # 0x146730bb0
145448681:     	leaq	0x12eb610(%rip), %r15   # 0x146733c98
145448688:     	jmp	0x145447c19 <.text+0x5446c19>
14544868d:     	leaq	0x12e85bc(%rip), %r14   # 0x146730c50
145448694:     	leaq	0x12eb5fd(%rip), %r15   # 0x146733c98
14544869b:     	jmp	0x145447c19 <.text+0x5446c19>
1454486a0:     	leal	-0x3e8(%rbx), %eax
1454486a6:     	cmpl	$0x1ee, %eax            # imm = 0x1EE
1454486ab:     	ja	0x145448771 <.text+0x5447771>
1454486b1:     	leaq	0x12f7150(%rip), %rcx   # 0x14673f808
1454486b8:     	movslq	(%rcx,%rax,4), %rax
1454486bc:     	addq	%rcx, %rax
1454486bf:     	movq	%rdi, %rsi
1454486c2:     	jmpq	*%rax
1454486c4:     	leaq	0x12e8e45(%rip), %r14   # 0x146731510
1454486cb:     	leaq	0x12eb6b6(%rip), %r15   # 0x146733d88
1454486d2:     	jmp	0x145447c19 <.text+0x5446c19>
1454486d7:     	leaq	0x12e63e2(%rip), %r14   # 0x14672eac0
1454486de:     	movq	%rdi, %rsi
1454486e1:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454486e6:     	leaq	0x12e62cb(%rip), %r14   # 0x14672e9b8
1454486ed:     	movq	%rdi, %rsi
1454486f0:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454486f5:     	leaq	0x12e6314(%rip), %r14   # 0x14672ea10
1454486fc:     	movq	%rdi, %rsi
1454486ff:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448704:     	leaq	0x12e635d(%rip), %r14   # 0x14672ea68
14544870b:     	movq	%rdi, %rsi
14544870e:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448713:     	movl	$0x1, %ecx
145448718:     	movl	$0x20, %edx
14544871d:     	callq	0x14590379b <.text+0x590279b>
145448722:     	nop
145448723:     	jmp	0x1454487e4 <.text+0x54477e4>
145448728:     	movl	$0x1, %ecx
14544872d:     	movl	$0x1, %edx
145448732:     	callq	0x14590379b <.text+0x590279b>
145448737:     	nop
145448738:     	jmp	0x1454487e4 <.text+0x54477e4>
14544873d:     	leaq	0x12f5b6c(%rip), %r8    # 0x14673e2b0
145448744:     	movq	%rdi, %rcx
145448747:     	callq	0x145903b33 <.text+0x5902b33>
14544874c:     	ud2
14544874e:     	leaq	0x12f5e73(%rip), %r8    # 0x14673e5c8
145448755:     	movq	%rdi, %rcx
145448758:     	callq	0x145903b33 <.text+0x5902b33>
14544875d:     	ud2
14544875f:     	leaq	0x12f5b6a(%rip), %r8    # 0x14673e2d0
145448766:     	movq	%rdi, %rcx
145448769:     	callq	0x145903b33 <.text+0x5902b33>
14544876e:     	nop
14544876f:     	jmp	0x1454487e4 <.text+0x54477e4>
145448771:     	leal	-0x132(%rbx), %eax
145448777:     	cmpl	$0x58, %eax
14544877a:     	movq	%rdi, %rsi
14544877d:     	ja	0x145444c8a <.text+0x5443c8a>
145448783:     	leaq	0x12eb50e(%rip), %r15   # 0x146733c98
14544878a:     	leaq	0x12f6f13(%rip), %rcx   # 0x14673f6a4
145448791:     	movslq	(%rcx,%rax,4), %rax
145448795:     	addq	%rcx, %rax
145448798:     	jmpq	*%rax
14544879a:     	leaq	0x12e868f(%rip), %r14   # 0x146730e30
1454487a1:     	jmp	0x145447c19 <.text+0x5446c19>
1454487a6:     	leaq	0x158a0fb(%rip), %r8    # 0x1469d28a8
1454487ad:     	movl	$0x6, %edx
1454487b2:     	movq	%r15, %rcx
1454487b5:     	callq	0x145903b33 <.text+0x5902b33>
1454487ba:     	nop
1454487bb:     	jmp	0x1454487e4 <.text+0x54477e4>
1454487bd:     	leaq	0x158a0fc(%rip), %r8    # 0x1469d28c0
1454487c4:     	movl	$0x6, %edx
1454487c9:     	movq	%r15, %rcx
1454487cc:     	callq	0x145903b33 <.text+0x5902b33>
1454487d1:     	nop
1454487d2:     	jmp	0x1454487e4 <.text+0x54477e4>
1454487d4:     	leaq	0x12f5ded(%rip), %r8    # 0x14673e5c8
1454487db:     	movq	%rdi, %rcx
1454487de:     	callq	0x145903b33 <.text+0x5902b33>
1454487e3:     	nop
1454487e4:     	ud2
1454487e6:     	leaq	0x12e8d73(%rip), %r14   # 0x146731560
1454487ed:     	leaq	0x12eb594(%rip), %r15   # 0x146733d88
1454487f4:     	jmp	0x145447c19 <.text+0x5446c19>
1454487f9:     	leaq	0x12e8db0(%rip), %r14   # 0x1467315b0
145448800:     	leaq	0x12eb581(%rip), %r15   # 0x146733d88
145448807:     	jmp	0x145447c19 <.text+0x5446c19>
14544880c:     	leaq	0x12e8ded(%rip), %r14   # 0x146731600
145448813:     	leaq	0x12eb56e(%rip), %r15   # 0x146733d88
14544881a:     	jmp	0x145447c19 <.text+0x5446c19>
14544881f:     	leaq	0x12e8e2a(%rip), %r14   # 0x146731650
145448826:     	leaq	0x12eb55b(%rip), %r15   # 0x146733d88
14544882d:     	jmp	0x145447c19 <.text+0x5446c19>
145448832:     	leaq	0x12e8e67(%rip), %r14   # 0x1467316a0
145448839:     	leaq	0x12eb548(%rip), %r15   # 0x146733d88
145448840:     	jmp	0x145447c19 <.text+0x5446c19>
145448845:     	leaq	0x12e8ea4(%rip), %r14   # 0x1467316f0
14544884c:     	leaq	0x12eb535(%rip), %r15   # 0x146733d88
145448853:     	jmp	0x145447c19 <.text+0x5446c19>
145448858:     	leaq	0x12e8ee1(%rip), %r14   # 0x146731740
14544885f:     	leaq	0x12eb522(%rip), %r15   # 0x146733d88
145448866:     	jmp	0x145447c19 <.text+0x5446c19>
14544886b:     	leaq	0x12e8f1e(%rip), %r14   # 0x146731790
145448872:     	leaq	0x12eb50f(%rip), %r15   # 0x146733d88
145448879:     	jmp	0x145447c19 <.text+0x5446c19>
14544887e:     	leaq	0x12e8f5b(%rip), %r14   # 0x1467317e0
145448885:     	leaq	0x12eb4fc(%rip), %r15   # 0x146733d88
14544888c:     	jmp	0x145447c19 <.text+0x5446c19>
145448891:     	leaq	0x12e8f98(%rip), %r14   # 0x146731830
145448898:     	leaq	0x12eb4e9(%rip), %r15   # 0x146733d88
14544889f:     	jmp	0x145447c19 <.text+0x5446c19>
1454488a4:     	leaq	0x12e8fd5(%rip), %r14   # 0x146731880
1454488ab:     	leaq	0x12eb4d6(%rip), %r15   # 0x146733d88
1454488b2:     	jmp	0x145447c19 <.text+0x5446c19>
1454488b7:     	leaq	0x12e93c2(%rip), %r14   # 0x146731c80
1454488be:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454488c3:     	leaq	0x12e940e(%rip), %r14   # 0x146731cd8
1454488ca:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454488cf:     	leaq	0x12e945a(%rip), %r14   # 0x146731d30
1454488d6:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454488db:     	leaq	0x12e94a6(%rip), %r14   # 0x146731d88
1454488e2:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454488e7:     	leaq	0x12e94f2(%rip), %r14   # 0x146731de0
1454488ee:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454488f3:     	leaq	0x12e96de(%rip), %r14   # 0x146731fd8
1454488fa:     	leaq	0x12eb577(%rip), %r15   # 0x146733e78
145448901:     	jmp	0x145447c19 <.text+0x5446c19>
145448906:     	leaq	0x12e971b(%rip), %r14   # 0x146732028
14544890d:     	leaq	0x12eb564(%rip), %r15   # 0x146733e78
145448914:     	jmp	0x145447c19 <.text+0x5446c19>
145448919:     	leaq	0x12e9758(%rip), %r14   # 0x146732078
145448920:     	leaq	0x12eb551(%rip), %r15   # 0x146733e78
145448927:     	jmp	0x145447c19 <.text+0x5446c19>
14544892c:     	leaq	0x12e9795(%rip), %r14   # 0x1467320c8
145448933:     	leaq	0x12eb53e(%rip), %r15   # 0x146733e78
14544893a:     	jmp	0x145447c19 <.text+0x5446c19>
14544893f:     	leaq	0x12e97d2(%rip), %r14   # 0x146732118
145448946:     	leaq	0x12eb52b(%rip), %r15   # 0x146733e78
14544894d:     	jmp	0x145447c19 <.text+0x5446c19>
145448952:     	leaq	0x12e980f(%rip), %r14   # 0x146732168
145448959:     	leaq	0x12eb518(%rip), %r15   # 0x146733e78
145448960:     	jmp	0x145447c19 <.text+0x5446c19>
145448965:     	leaq	0x12e984c(%rip), %r14   # 0x1467321b8
14544896c:     	leaq	0x12eb505(%rip), %r15   # 0x146733e78
145448973:     	jmp	0x145447c19 <.text+0x5446c19>
145448978:     	leaq	0x12e9889(%rip), %r14   # 0x146732208
14544897f:     	leaq	0x12eb4f2(%rip), %r15   # 0x146733e78
145448986:     	jmp	0x145447c19 <.text+0x5446c19>
14544898b:     	leaq	0x12e98c6(%rip), %r14   # 0x146732258
145448992:     	leaq	0x12eb4df(%rip), %r15   # 0x146733e78
145448999:     	jmp	0x145447c19 <.text+0x5446c19>
14544899e:     	leaq	0x12e9903(%rip), %r14   # 0x1467322a8
1454489a5:     	leaq	0x12eb4cc(%rip), %r15   # 0x146733e78
1454489ac:     	jmp	0x145447c19 <.text+0x5446c19>
1454489b1:     	leaq	0x12e9940(%rip), %r14   # 0x1467322f8
1454489b8:     	leaq	0x12eb4b9(%rip), %r15   # 0x146733e78
1454489bf:     	jmp	0x145447c19 <.text+0x5446c19>
1454489c4:     	leaq	0x12e997d(%rip), %r14   # 0x146732348
1454489cb:     	leaq	0x12eb4a6(%rip), %r15   # 0x146733e78
1454489d2:     	jmp	0x145447c19 <.text+0x5446c19>
1454489d7:     	leaq	0x12e9c9a(%rip), %r14   # 0x146732678
1454489de:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454489e3:     	leaq	0x12e9ce6(%rip), %r14   # 0x1467326d0
1454489ea:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454489ef:     	leaq	0x12e9d32(%rip), %r14   # 0x146732728
1454489f6:     	jmp	0x145447bc5 <.text+0x5446bc5>
1454489fb:     	leaq	0x12e9d7e(%rip), %r14   # 0x146732780
145448a02:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448a07:     	leaq	0x12e9dca(%rip), %r14   # 0x1467327d8
145448a0e:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448a13:     	leaq	0x12ea06e(%rip), %r14   # 0x146732a88
145448a1a:     	leaq	0x12eb547(%rip), %r15   # 0x146733f68
145448a21:     	jmp	0x145447c19 <.text+0x5446c19>
145448a26:     	leaq	0x12ea0ab(%rip), %r14   # 0x146732ad8
145448a2d:     	leaq	0x12eb534(%rip), %r15   # 0x146733f68
145448a34:     	jmp	0x145447c19 <.text+0x5446c19>
145448a39:     	leaq	0x12ea0e8(%rip), %r14   # 0x146732b28
145448a40:     	leaq	0x12eb521(%rip), %r15   # 0x146733f68
145448a47:     	jmp	0x145447c19 <.text+0x5446c19>
145448a4c:     	leaq	0x12ea125(%rip), %r14   # 0x146732b78
145448a53:     	leaq	0x12eb50e(%rip), %r15   # 0x146733f68
145448a5a:     	jmp	0x145447c19 <.text+0x5446c19>
145448a5f:     	leaq	0x12ea162(%rip), %r14   # 0x146732bc8
145448a66:     	leaq	0x12eb4fb(%rip), %r15   # 0x146733f68
145448a6d:     	jmp	0x145447c19 <.text+0x5446c19>
145448a72:     	leaq	0x12ea19f(%rip), %r14   # 0x146732c18
145448a79:     	leaq	0x12eb4e8(%rip), %r15   # 0x146733f68
145448a80:     	jmp	0x145447c19 <.text+0x5446c19>
145448a85:     	leaq	0x12ea1dc(%rip), %r14   # 0x146732c68
145448a8c:     	leaq	0x12eb4d5(%rip), %r15   # 0x146733f68
145448a93:     	jmp	0x145447c19 <.text+0x5446c19>
145448a98:     	leaq	0x12ea219(%rip), %r14   # 0x146732cb8
145448a9f:     	leaq	0x12eb4c2(%rip), %r15   # 0x146733f68
145448aa6:     	jmp	0x145447c19 <.text+0x5446c19>
145448aab:     	leaq	0x12ea256(%rip), %r14   # 0x146732d08
145448ab2:     	leaq	0x12eb4af(%rip), %r15   # 0x146733f68
145448ab9:     	jmp	0x145447c19 <.text+0x5446c19>
145448abe:     	leaq	0x12ea293(%rip), %r14   # 0x146732d58
145448ac5:     	leaq	0x12eb49c(%rip), %r15   # 0x146733f68
145448acc:     	jmp	0x145447c19 <.text+0x5446c19>
145448ad1:     	leaq	0x12ea2d0(%rip), %r14   # 0x146732da8
145448ad8:     	leaq	0x12eb489(%rip), %r15   # 0x146733f68
145448adf:     	jmp	0x145447c19 <.text+0x5446c19>
145448ae4:     	leaq	0x12ea30d(%rip), %r14   # 0x146732df8
145448aeb:     	leaq	0x12eb476(%rip), %r15   # 0x146733f68
145448af2:     	jmp	0x145447c19 <.text+0x5446c19>
145448af7:     	leaq	0x12ea34a(%rip), %r14   # 0x146732e48
145448afe:     	leaq	0x12eb463(%rip), %r15   # 0x146733f68
145448b05:     	jmp	0x145447c19 <.text+0x5446c19>
145448b0a:     	leaq	0x12ea387(%rip), %r14   # 0x146732e98
145448b11:     	leaq	0x12eb450(%rip), %r15   # 0x146733f68
145448b18:     	jmp	0x145447c19 <.text+0x5446c19>
145448b1d:     	leaq	0x12ea3c4(%rip), %r14   # 0x146732ee8
145448b24:     	leaq	0x12eb43d(%rip), %r15   # 0x146733f68
145448b2b:     	jmp	0x145447c19 <.text+0x5446c19>
145448b30:     	leaq	0x12ea401(%rip), %r14   # 0x146732f38
145448b37:     	leaq	0x12eb42a(%rip), %r15   # 0x146733f68
145448b3e:     	jmp	0x145447c19 <.text+0x5446c19>
145448b43:     	leaq	0x12ea736(%rip), %r14   # 0x146733280
145448b4a:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448b4f:     	leaq	0x12ea782(%rip), %r14   # 0x1467332d8
145448b56:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448b5b:     	leaq	0x12ea7ce(%rip), %r14   # 0x146733330
145448b62:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448b67:     	leaq	0x12ea81a(%rip), %r14   # 0x146733388
145448b6e:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448b73:     	leaq	0x12ea866(%rip), %r14   # 0x1467333e0
145448b7a:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448b7f:     	leaq	0x12e82fa(%rip), %r14   # 0x146730e80
145448b86:     	jmp	0x145447c19 <.text+0x5446c19>
145448b8b:     	leaq	0x12e824e(%rip), %r14   # 0x146730de0
145448b92:     	jmp	0x145447c19 <.text+0x5446c19>
145448b97:     	leaq	0x12e8332(%rip), %r14   # 0x146730ed0
145448b9e:     	jmp	0x145447c19 <.text+0x5446c19>
145448ba3:     	leaq	0x12e862e(%rip), %r14   # 0x1467311d8
145448baa:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448baf:     	leaq	0x12e867a(%rip), %r14   # 0x146731230
145448bb6:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448bbb:     	leaq	0x12e86c6(%rip), %r14   # 0x146731288
145448bc2:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448bc7:     	leaq	0x12e876a(%rip), %r14   # 0x146731338
145448bce:     	jmp	0x145447bc5 <.text+0x5446bc5>
145448bd3:     	leaq	0x12e8706(%rip), %r14   # 0x1467312e0
145448bda:     	jmp	0x145447bc5 <.text+0x5446bc5>
