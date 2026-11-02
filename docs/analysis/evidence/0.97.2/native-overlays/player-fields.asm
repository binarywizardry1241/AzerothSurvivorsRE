
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145491140:     	pushq	%rbp
145491141:     	pushq	%r15
145491143:     	pushq	%r14
145491145:     	pushq	%r13
145491147:     	pushq	%r12
145491149:     	pushq	%rsi
14549114a:     	pushq	%rdi
14549114b:     	pushq	%rbx
14549114c:     	subq	$0xc8, %rsp
145491153:     	leaq	0x80(%rsp), %rbp
14549115b:     	movq	$-0x2, 0x40(%rbp)
145491163:     	movq	%rdx, %rdi
145491166:     	movq	%rcx, -0x58(%rbp)
14549116a:     	movzbl	0x284(%rdx), %eax
145491171:     	addb	$-0x2, %al
145491173:     	cmpb	$0x9, %al
145491175:     	ja	0x145491187 <.text+0x5490187>
145491177:     	movzbl	%al, %eax
14549117a:     	leaq	0x151b8a7(%rip), %rcx   # 0x1469aca28
145491181:     	movq	(%rcx,%rax,8), %r12
145491185:     	jmp	0x14549118e <.text+0x549018e>
145491187:     	leaq	0x12875da(%rip), %r12   # 0x146718768
14549118e:     	movq	$0x0, 0x28(%rbp)
145491196:     	movq	$0x0, 0x38(%rbp)
14549119e:     	movq	0x3d0(%rdi), %r8
1454911a5:     	leaq	0x28(%rbp), %rbx
1454911a9:     	movq	%rbx, %rcx
1454911ac:     	xorl	%edx, %edx
1454911ae:     	callq	0x1455002f0 <.text+0x54ff2f0>
1454911b3:     	nop
1454911b4:     	movq	0x28(%rbp), %rax
1454911b8:     	testq	%rax, %rax
1454911bb:     	je	0x14549122b <.text+0x549022b>
1454911bd:     	movq	0x30(%rbp), %rcx
1454911c1:     	movw	$0x2, %dx
1454911c5:     	movzwl	0x36(%rax), %r9d
1454911ca:     	movl	%r9d, %r10d
1454911cd:     	addl	%r10d, %r10d
1454911d0:     	movq	$-0x1, %r8
1454911d7:     	nopw	(%rax,%rax)
1454911e0:     	testq	%r10, %r10
1454911e3:     	je	0x145491210 <.text+0x5490210>
1454911e5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454911eb:     	seta	%r11b
1454911ef:     	sbbb	$0x0, %r11b
1454911f3:     	incq	%r8
1454911f6:     	addq	$-0x2, %r10
1454911fa:     	cmpb	$0x1, %r11b
1454911fe:     	je	0x1454911e0 <.text+0x54901e0>
145491200:     	movzbl	%r11b, %r9d
145491204:     	testl	%r9d, %r9d
145491207:     	je	0x145491220 <.text+0x5490220>
145491209:     	jmp	0x145491213 <.text+0x5490213>
14549120b:     	nopl	(%rax,%rax)
145491210:     	movq	%r9, %r8
145491213:     	subq	$0x1, %rcx
145491217:     	jb	0x14549122d <.text+0x549022d>
145491219:     	movq	0x50(%rax,%r8,8), %rax
14549121e:     	jmp	0x1454911c5 <.text+0x54901c5>
145491220:     	movl	$0x19, 0x8(%rax,%r8,4)
145491229:     	jmp	0x14549125d <.text+0x549025d>
14549122b:     	xorl	%eax, %eax
14549122d:     	movq	%rbx, -0x28(%rbp)
145491231:     	movq	%rax, -0x20(%rbp)
145491235:     	movq	$0x0, -0x18(%rbp)
14549123d:     	movq	%r8, -0x10(%rbp)
145491241:     	movq	$0x2, -0x8(%rbp)
145491249:     	leaq	-0x48(%rbp), %rcx
14549124d:     	leaq	-0x28(%rbp), %rdx
145491251:     	movl	$0x19, %r8d
145491257:     	callq	0x145427a50 <.text+0x5426a50>
14549125c:     	nop
14549125d:     	movq	0x28(%rbp), %rax
145491261:     	testq	%rax, %rax
145491264:     	je	0x1454912cb <.text+0x54902cb>
145491266:     	movq	0x30(%rbp), %rcx
14549126a:     	movw	$0x4, %dx
14549126e:     	movzwl	0x36(%rax), %r9d
145491273:     	movl	%r9d, %r10d
145491276:     	addl	%r10d, %r10d
145491279:     	movq	$-0x1, %r8
145491280:     	testq	%r10, %r10
145491283:     	je	0x1454912b0 <.text+0x54902b0>
145491285:     	cmpw	0x3a(%rax,%r8,2), %dx
14549128b:     	seta	%r11b
14549128f:     	sbbb	$0x0, %r11b
145491293:     	incq	%r8
145491296:     	addq	$-0x2, %r10
14549129a:     	cmpb	$0x1, %r11b
14549129e:     	je	0x145491280 <.text+0x5490280>
1454912a0:     	movzbl	%r11b, %r9d
1454912a4:     	testl	%r9d, %r9d
1454912a7:     	je	0x1454912c0 <.text+0x54902c0>
1454912a9:     	jmp	0x1454912b3 <.text+0x54902b3>
1454912ab:     	nopl	(%rax,%rax)
1454912b0:     	movq	%r9, %r8
1454912b3:     	subq	$0x1, %rcx
1454912b7:     	jb	0x1454912cd <.text+0x54902cd>
1454912b9:     	movq	0x50(%rax,%r8,8), %rax
1454912be:     	jmp	0x14549126e <.text+0x549026e>
1454912c0:     	movl	$0x3f800000, 0x8(%rax,%r8,4) # imm = 0x3F800000
1454912c9:     	jmp	0x1454912fd <.text+0x54902fd>
1454912cb:     	xorl	%eax, %eax
1454912cd:     	movq	%rbx, -0x28(%rbp)
1454912d1:     	movq	%rax, -0x20(%rbp)
1454912d5:     	movq	$0x0, -0x18(%rbp)
1454912dd:     	movq	%r8, -0x10(%rbp)
1454912e1:     	movq	$0x4, -0x8(%rbp)
1454912e9:     	leaq	-0x48(%rbp), %rcx
1454912ed:     	leaq	-0x28(%rbp), %rdx
1454912f1:     	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1454912f7:     	callq	0x145427a50 <.text+0x5426a50>
1454912fc:     	nop
1454912fd:     	movss	0x400(%rdi), %xmm0
145491305:     	callq	0x145756e6d <.text+0x5755e6d>
14549130a:     	cvttss2si	%xmm0, %rax
14549130f:     	xorl	%ecx, %ecx
145491311:     	xorps	%xmm1, %xmm1
145491314:     	ucomiss	%xmm1, %xmm0
145491317:     	cmovbl	%ecx, %eax
14549131a:     	ucomiss	0x45a1fb(%rip), %xmm0   # 0x1458eb51c
145491321:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
145491327:     	cmovbel	%eax, %r8d
14549132b:     	movq	0x28(%rbp), %rax
14549132f:     	testq	%rax, %rax
145491332:     	je	0x145491397 <.text+0x5490397>
145491334:     	movq	0x30(%rbp), %rcx
145491338:     	movw	$0x16, %dx
14549133c:     	movzwl	0x36(%rax), %r10d
145491341:     	movl	%r10d, %r11d
145491344:     	addl	%r11d, %r11d
145491347:     	movq	$-0x1, %r9
14549134e:     	nop
145491350:     	testq	%r11, %r11
145491353:     	je	0x145491380 <.text+0x5490380>
145491355:     	cmpw	0x3a(%rax,%r9,2), %dx
14549135b:     	seta	%sil
14549135f:     	sbbb	$0x0, %sil
145491363:     	incq	%r9
145491366:     	addq	$-0x2, %r11
14549136a:     	cmpb	$0x1, %sil
14549136e:     	je	0x145491350 <.text+0x5490350>
145491370:     	movzbl	%sil, %r10d
145491374:     	testl	%r10d, %r10d
145491377:     	je	0x145491390 <.text+0x5490390>
145491379:     	jmp	0x145491383 <.text+0x5490383>
14549137b:     	nopl	(%rax,%rax)
145491380:     	movq	%r10, %r9
145491383:     	subq	$0x1, %rcx
145491387:     	jb	0x145491399 <.text+0x5490399>
145491389:     	movq	0x50(%rax,%r9,8), %rax
14549138e:     	jmp	0x14549133c <.text+0x549033c>
145491390:     	movl	%r8d, 0x8(%rax,%r9,4)
145491395:     	jmp	0x1454913c3 <.text+0x54903c3>
145491397:     	xorl	%eax, %eax
145491399:     	movq	%rbx, -0x28(%rbp)
14549139d:     	movq	%rax, -0x20(%rbp)
1454913a1:     	movq	$0x0, -0x18(%rbp)
1454913a9:     	movq	%r9, -0x10(%rbp)
1454913ad:     	movq	$0x16, -0x8(%rbp)
1454913b5:     	leaq	-0x48(%rbp), %rcx
1454913b9:     	leaq	-0x28(%rbp), %rdx
1454913bd:     	callq	0x145427a50 <.text+0x5426a50>
1454913c2:     	nop
1454913c3:     	movss	0x458(%rdi), %xmm0
1454913cb:     	callq	0x145756e6d <.text+0x5755e6d>
1454913d0:     	cvttss2si	%xmm0, %rax
1454913d5:     	xorl	%ecx, %ecx
1454913d7:     	xorps	%xmm1, %xmm1
1454913da:     	ucomiss	%xmm1, %xmm0
1454913dd:     	cmovbl	%ecx, %eax
1454913e0:     	ucomiss	0x45a135(%rip), %xmm0   # 0x1458eb51c
1454913e7:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454913ed:     	cmovbel	%eax, %r8d
1454913f1:     	movq	0x28(%rbp), %rax
1454913f5:     	testq	%rax, %rax
1454913f8:     	je	0x145491467 <.text+0x5490467>
1454913fa:     	movq	0x30(%rbp), %rcx
1454913fe:     	movw	$0x1c, %dx
145491402:     	movzwl	0x36(%rax), %r10d
145491407:     	movl	%r10d, %r11d
14549140a:     	addl	%r11d, %r11d
14549140d:     	movq	$-0x1, %r9
145491414:     	nopw	%cs:(%rax,%rax)
145491420:     	testq	%r11, %r11
145491423:     	je	0x145491450 <.text+0x5490450>
145491425:     	cmpw	0x3a(%rax,%r9,2), %dx
14549142b:     	seta	%sil
14549142f:     	sbbb	$0x0, %sil
145491433:     	incq	%r9
145491436:     	addq	$-0x2, %r11
14549143a:     	cmpb	$0x1, %sil
14549143e:     	je	0x145491420 <.text+0x5490420>
145491440:     	movzbl	%sil, %r10d
145491444:     	testl	%r10d, %r10d
145491447:     	je	0x145491460 <.text+0x5490460>
145491449:     	jmp	0x145491453 <.text+0x5490453>
14549144b:     	nopl	(%rax,%rax)
145491450:     	movq	%r10, %r9
145491453:     	subq	$0x1, %rcx
145491457:     	jb	0x145491469 <.text+0x5490469>
145491459:     	movq	0x50(%rax,%r9,8), %rax
14549145e:     	jmp	0x145491402 <.text+0x5490402>
145491460:     	movl	%r8d, 0x8(%rax,%r9,4)
145491465:     	jmp	0x145491493 <.text+0x5490493>
145491467:     	xorl	%eax, %eax
145491469:     	movq	%rbx, -0x28(%rbp)
14549146d:     	movq	%rax, -0x20(%rbp)
145491471:     	movq	$0x0, -0x18(%rbp)
145491479:     	movq	%r9, -0x10(%rbp)
14549147d:     	movq	$0x1c, -0x8(%rbp)
145491485:     	leaq	-0x48(%rbp), %rcx
145491489:     	leaq	-0x28(%rbp), %rdx
14549148d:     	callq	0x145427a50 <.text+0x5426a50>
145491492:     	nop
145491493:     	movq	0x28(%rbp), %rax
145491497:     	testq	%rax, %rax
14549149a:     	je	0x14549150b <.text+0x549050b>
14549149c:     	movq	0x30(%rbp), %rcx
1454914a0:     	movw	$0x17, %dx
1454914a4:     	movzwl	0x36(%rax), %r9d
1454914a9:     	movl	%r9d, %r10d
1454914ac:     	addl	%r10d, %r10d
1454914af:     	movq	$-0x1, %r8
1454914b6:     	nopw	%cs:(%rax,%rax)
1454914c0:     	testq	%r10, %r10
1454914c3:     	je	0x1454914f0 <.text+0x54904f0>
1454914c5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454914cb:     	seta	%r11b
1454914cf:     	sbbb	$0x0, %r11b
1454914d3:     	incq	%r8
1454914d6:     	addq	$-0x2, %r10
1454914da:     	cmpb	$0x1, %r11b
1454914de:     	je	0x1454914c0 <.text+0x54904c0>
1454914e0:     	movzbl	%r11b, %r9d
1454914e4:     	testl	%r9d, %r9d
1454914e7:     	je	0x145491500 <.text+0x5490500>
1454914e9:     	jmp	0x1454914f3 <.text+0x54904f3>
1454914eb:     	nopl	(%rax,%rax)
1454914f0:     	movq	%r9, %r8
1454914f3:     	subq	$0x1, %rcx
1454914f7:     	jb	0x14549150d <.text+0x549050d>
1454914f9:     	movq	0x50(%rax,%r8,8), %rax
1454914fe:     	jmp	0x1454914a4 <.text+0x54904a4>
145491500:     	movl	$0x64, 0x8(%rax,%r8,4)
145491509:     	jmp	0x14549153d <.text+0x549053d>
14549150b:     	xorl	%eax, %eax
14549150d:     	movq	%rbx, -0x28(%rbp)
145491511:     	movq	%rax, -0x20(%rbp)
145491515:     	movq	$0x0, -0x18(%rbp)
14549151d:     	movq	%r8, -0x10(%rbp)
145491521:     	movq	$0x17, -0x8(%rbp)
145491529:     	leaq	-0x48(%rbp), %rcx
14549152d:     	leaq	-0x28(%rbp), %rdx
145491531:     	movl	$0x64, %r8d
145491537:     	callq	0x145427a50 <.text+0x5426a50>
14549153c:     	nop
14549153d:     	movq	0x28(%rbp), %rax
145491541:     	testq	%rax, %rax
145491544:     	je	0x1454915ab <.text+0x54905ab>
145491546:     	movq	0x30(%rbp), %rcx
14549154a:     	movw	$0x18, %dx
14549154e:     	movzwl	0x36(%rax), %r9d
145491553:     	movl	%r9d, %r10d
145491556:     	addl	%r10d, %r10d
145491559:     	movq	$-0x1, %r8
145491560:     	testq	%r10, %r10
145491563:     	je	0x145491590 <.text+0x5490590>
145491565:     	cmpw	0x3a(%rax,%r8,2), %dx
14549156b:     	seta	%r11b
14549156f:     	sbbb	$0x0, %r11b
145491573:     	incq	%r8
145491576:     	addq	$-0x2, %r10
14549157a:     	cmpb	$0x1, %r11b
14549157e:     	je	0x145491560 <.text+0x5490560>
145491580:     	movzbl	%r11b, %r9d
145491584:     	testl	%r9d, %r9d
145491587:     	je	0x1454915a0 <.text+0x54905a0>
145491589:     	jmp	0x145491593 <.text+0x5490593>
14549158b:     	nopl	(%rax,%rax)
145491590:     	movq	%r9, %r8
145491593:     	subq	$0x1, %rcx
145491597:     	jb	0x1454915ad <.text+0x54905ad>
145491599:     	movq	0x50(%rax,%r8,8), %rax
14549159e:     	jmp	0x14549154e <.text+0x549054e>
1454915a0:     	movl	$0x0, 0x8(%rax,%r8,4)
1454915a9:     	jmp	0x1454915da <.text+0x54905da>
1454915ab:     	xorl	%eax, %eax
1454915ad:     	movq	%rbx, -0x28(%rbp)
1454915b1:     	movq	%rax, -0x20(%rbp)
1454915b5:     	movq	$0x0, -0x18(%rbp)
1454915bd:     	movq	%r8, -0x10(%rbp)
1454915c1:     	movq	$0x18, -0x8(%rbp)
1454915c9:     	leaq	-0x48(%rbp), %rcx
1454915cd:     	leaq	-0x28(%rbp), %rdx
1454915d1:     	xorl	%r8d, %r8d
1454915d4:     	callq	0x145427a50 <.text+0x5426a50>
1454915d9:     	nop
1454915da:     	movq	0x28(%rbp), %rax
1454915de:     	testq	%rax, %rax
1454915e1:     	je	0x14549164b <.text+0x549064b>
1454915e3:     	movq	0x30(%rbp), %rcx
1454915e7:     	movw	$0x1a, %dx
1454915eb:     	movzwl	0x36(%rax), %r9d
1454915f0:     	movl	%r9d, %r10d
1454915f3:     	addl	%r10d, %r10d
1454915f6:     	movq	$-0x1, %r8
1454915fd:     	nopl	(%rax)
145491600:     	testq	%r10, %r10
145491603:     	je	0x145491630 <.text+0x5490630>
145491605:     	cmpw	0x3a(%rax,%r8,2), %dx
14549160b:     	seta	%r11b
14549160f:     	sbbb	$0x0, %r11b
145491613:     	incq	%r8
145491616:     	addq	$-0x2, %r10
14549161a:     	cmpb	$0x1, %r11b
14549161e:     	je	0x145491600 <.text+0x5490600>
145491620:     	movzbl	%r11b, %r9d
145491624:     	testl	%r9d, %r9d
145491627:     	je	0x145491640 <.text+0x5490640>
145491629:     	jmp	0x145491633 <.text+0x5490633>
14549162b:     	nopl	(%rax,%rax)
145491630:     	movq	%r9, %r8
145491633:     	subq	$0x1, %rcx
145491637:     	jb	0x14549164d <.text+0x549064d>
145491639:     	movq	0x50(%rax,%r8,8), %rax
14549163e:     	jmp	0x1454915eb <.text+0x54905eb>
145491640:     	movl	$0x64, 0x8(%rax,%r8,4)
145491649:     	jmp	0x14549167d <.text+0x549067d>
14549164b:     	xorl	%eax, %eax
14549164d:     	movq	%rbx, -0x28(%rbp)
145491651:     	movq	%rax, -0x20(%rbp)
145491655:     	movq	$0x0, -0x18(%rbp)
14549165d:     	movq	%r8, -0x10(%rbp)
145491661:     	movq	$0x1a, -0x8(%rbp)
145491669:     	leaq	-0x48(%rbp), %rcx
14549166d:     	leaq	-0x28(%rbp), %rdx
145491671:     	movl	$0x64, %r8d
145491677:     	callq	0x145427a50 <.text+0x5426a50>
14549167c:     	nop
14549167d:     	movq	0x28(%rbp), %rax
145491681:     	testq	%rax, %rax
145491684:     	je	0x1454916eb <.text+0x54906eb>
145491686:     	movq	0x30(%rbp), %rcx
14549168a:     	movw	$0x1d, %dx
14549168e:     	movzwl	0x36(%rax), %r9d
145491693:     	movl	%r9d, %r10d
145491696:     	addl	%r10d, %r10d
145491699:     	movq	$-0x1, %r8
1454916a0:     	testq	%r10, %r10
1454916a3:     	je	0x1454916d0 <.text+0x54906d0>
1454916a5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454916ab:     	seta	%r11b
1454916af:     	sbbb	$0x0, %r11b
1454916b3:     	incq	%r8
1454916b6:     	addq	$-0x2, %r10
1454916ba:     	cmpb	$0x1, %r11b
1454916be:     	je	0x1454916a0 <.text+0x54906a0>
1454916c0:     	movzbl	%r11b, %r9d
1454916c4:     	testl	%r9d, %r9d
1454916c7:     	je	0x1454916e0 <.text+0x54906e0>
1454916c9:     	jmp	0x1454916d3 <.text+0x54906d3>
1454916cb:     	nopl	(%rax,%rax)
1454916d0:     	movq	%r9, %r8
1454916d3:     	subq	$0x1, %rcx
1454916d7:     	jb	0x1454916ed <.text+0x54906ed>
1454916d9:     	movq	0x50(%rax,%r8,8), %rax
1454916de:     	jmp	0x14549168e <.text+0x549068e>
1454916e0:     	movl	$0x64, 0x8(%rax,%r8,4)
1454916e9:     	jmp	0x14549171d <.text+0x549071d>
1454916eb:     	xorl	%eax, %eax
1454916ed:     	movq	%rbx, -0x28(%rbp)
1454916f1:     	movq	%rax, -0x20(%rbp)
1454916f5:     	movq	$0x0, -0x18(%rbp)
1454916fd:     	movq	%r8, -0x10(%rbp)
145491701:     	movq	$0x1d, -0x8(%rbp)
145491709:     	leaq	-0x48(%rbp), %rcx
14549170d:     	leaq	-0x28(%rbp), %rdx
145491711:     	movl	$0x64, %r8d
145491717:     	callq	0x145427a50 <.text+0x5426a50>
14549171c:     	nop
14549171d:     	movq	0x28(%rbp), %rax
145491721:     	testq	%rax, %rax
145491724:     	je	0x14549178b <.text+0x549078b>
145491726:     	movq	0x30(%rbp), %rcx
14549172a:     	movw	$0x1e, %dx
14549172e:     	movzwl	0x36(%rax), %r9d
145491733:     	movl	%r9d, %r10d
145491736:     	addl	%r10d, %r10d
145491739:     	movq	$-0x1, %r8
145491740:     	testq	%r10, %r10
145491743:     	je	0x145491770 <.text+0x5490770>
145491745:     	cmpw	0x3a(%rax,%r8,2), %dx
14549174b:     	seta	%r11b
14549174f:     	sbbb	$0x0, %r11b
145491753:     	incq	%r8
145491756:     	addq	$-0x2, %r10
14549175a:     	cmpb	$0x1, %r11b
14549175e:     	je	0x145491740 <.text+0x5490740>
145491760:     	movzbl	%r11b, %r9d
145491764:     	testl	%r9d, %r9d
145491767:     	je	0x145491780 <.text+0x5490780>
145491769:     	jmp	0x145491773 <.text+0x5490773>
14549176b:     	nopl	(%rax,%rax)
145491770:     	movq	%r9, %r8
145491773:     	subq	$0x1, %rcx
145491777:     	jb	0x14549178d <.text+0x549078d>
145491779:     	movq	0x50(%rax,%r8,8), %rax
14549177e:     	jmp	0x14549172e <.text+0x549072e>
145491780:     	movl	$0x3e8, 0x8(%rax,%r8,4) # imm = 0x3E8
145491789:     	jmp	0x1454917bd <.text+0x54907bd>
14549178b:     	xorl	%eax, %eax
14549178d:     	movq	%rbx, -0x28(%rbp)
145491791:     	movq	%rax, -0x20(%rbp)
145491795:     	movq	$0x0, -0x18(%rbp)
14549179d:     	movq	%r8, -0x10(%rbp)
1454917a1:     	movq	$0x1e, -0x8(%rbp)
1454917a9:     	leaq	-0x48(%rbp), %rcx
1454917ad:     	leaq	-0x28(%rbp), %rdx
1454917b1:     	movl	$0x3e8, %r8d            # imm = 0x3E8
1454917b7:     	callq	0x145427a50 <.text+0x5426a50>
1454917bc:     	nop
1454917bd:     	movq	0x28(%rbp), %rax
1454917c1:     	testq	%rax, %rax
1454917c4:     	je	0x14549182b <.text+0x549082b>
1454917c6:     	movq	0x30(%rbp), %rcx
1454917ca:     	movw	$0x20, %dx
1454917ce:     	movzwl	0x36(%rax), %r9d
1454917d3:     	movl	%r9d, %r10d
1454917d6:     	addl	%r10d, %r10d
1454917d9:     	movq	$-0x1, %r8
1454917e0:     	testq	%r10, %r10
1454917e3:     	je	0x145491810 <.text+0x5490810>
1454917e5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454917eb:     	seta	%r11b
1454917ef:     	sbbb	$0x0, %r11b
1454917f3:     	incq	%r8
1454917f6:     	addq	$-0x2, %r10
1454917fa:     	cmpb	$0x1, %r11b
1454917fe:     	je	0x1454917e0 <.text+0x54907e0>
145491800:     	movzbl	%r11b, %r9d
145491804:     	testl	%r9d, %r9d
145491807:     	je	0x145491820 <.text+0x5490820>
145491809:     	jmp	0x145491813 <.text+0x5490813>
14549180b:     	nopl	(%rax,%rax)
145491810:     	movq	%r9, %r8
145491813:     	subq	$0x1, %rcx
145491817:     	jb	0x14549182d <.text+0x549082d>
145491819:     	movq	0x50(%rax,%r8,8), %rax
14549181e:     	jmp	0x1454917ce <.text+0x54907ce>
145491820:     	movl	$0x64, 0x8(%rax,%r8,4)
145491829:     	jmp	0x14549185d <.text+0x549085d>
14549182b:     	xorl	%eax, %eax
14549182d:     	movq	%rbx, -0x28(%rbp)
145491831:     	movq	%rax, -0x20(%rbp)
145491835:     	movq	$0x0, -0x18(%rbp)
14549183d:     	movq	%r8, -0x10(%rbp)
145491841:     	movq	$0x20, -0x8(%rbp)
145491849:     	leaq	-0x48(%rbp), %rcx
14549184d:     	leaq	-0x28(%rbp), %rdx
145491851:     	movl	$0x64, %r8d
145491857:     	callq	0x145427a50 <.text+0x5426a50>
14549185c:     	nop
14549185d:     	movl	0x3f8(%rdi), %r14d
145491864:     	movq	0x28(%rbp), %rax
145491868:     	testq	%rax, %rax
14549186b:     	je	0x1454918d7 <.text+0x54908d7>
14549186d:     	movq	0x30(%rbp), %rcx
145491871:     	movw	$0x22, %dx
145491875:     	movzwl	0x36(%rax), %r9d
14549187a:     	movl	%r9d, %r10d
14549187d:     	addl	%r10d, %r10d
145491880:     	movq	$-0x1, %r8
145491887:     	nopw	(%rax,%rax)
145491890:     	testq	%r10, %r10
145491893:     	je	0x1454918c0 <.text+0x54908c0>
145491895:     	cmpw	0x3a(%rax,%r8,2), %dx
14549189b:     	seta	%r11b
14549189f:     	sbbb	$0x0, %r11b
1454918a3:     	incq	%r8
1454918a6:     	addq	$-0x2, %r10
1454918aa:     	cmpb	$0x1, %r11b
1454918ae:     	je	0x145491890 <.text+0x5490890>
1454918b0:     	movzbl	%r11b, %r9d
1454918b4:     	testl	%r9d, %r9d
1454918b7:     	je	0x1454918d0 <.text+0x54908d0>
1454918b9:     	jmp	0x1454918c3 <.text+0x54908c3>
1454918bb:     	nopl	(%rax,%rax)
1454918c0:     	movq	%r9, %r8
1454918c3:     	subq	$0x1, %rcx
1454918c7:     	jb	0x1454918d9 <.text+0x54908d9>
1454918c9:     	movq	0x50(%rax,%r8,8), %rax
1454918ce:     	jmp	0x145491875 <.text+0x5490875>
1454918d0:     	movl	%r14d, 0x8(%rax,%r8,4)
1454918d5:     	jmp	0x145491906 <.text+0x5490906>
1454918d7:     	xorl	%eax, %eax
1454918d9:     	movq	%rbx, -0x28(%rbp)
1454918dd:     	movq	%rax, -0x20(%rbp)
1454918e1:     	movq	$0x0, -0x18(%rbp)
1454918e9:     	movq	%r8, -0x10(%rbp)
1454918ed:     	movq	$0x22, -0x8(%rbp)
1454918f5:     	leaq	-0x48(%rbp), %rcx
1454918f9:     	leaq	-0x28(%rbp), %rdx
1454918fd:     	movl	%r14d, %r8d
145491900:     	callq	0x145427a50 <.text+0x5426a50>
145491905:     	nop
145491906:     	movzbl	0x285(%rdi), %r15d
14549190e:     	leal	-0x2(%r15), %r13d
145491912:     	movl	$0x1, %r8d
145491918:     	cmpb	$0x6, %r13b
14549191c:     	ja	0x14549192d <.text+0x549092d>
14549191e:     	movzbl	%r13b, %eax
145491922:     	leaq	0x151b18f(%rip), %rcx   # 0x1469acab8
145491929:     	movl	(%rcx,%rax,4), %r8d
14549192d:     	movq	0x28(%rbp), %rax
145491931:     	testq	%rax, %rax
145491934:     	je	0x145491997 <.text+0x5490997>
145491936:     	movq	0x30(%rbp), %rcx
14549193a:     	movw	$0x23, %dx
14549193e:     	movzwl	0x36(%rax), %r10d
145491943:     	movl	%r10d, %r11d
145491946:     	addl	%r11d, %r11d
145491949:     	movq	$-0x1, %r9
145491950:     	testq	%r11, %r11
145491953:     	je	0x145491980 <.text+0x5490980>
145491955:     	cmpw	0x3a(%rax,%r9,2), %dx
14549195b:     	seta	%sil
14549195f:     	sbbb	$0x0, %sil
145491963:     	incq	%r9
145491966:     	addq	$-0x2, %r11
14549196a:     	cmpb	$0x1, %sil
14549196e:     	je	0x145491950 <.text+0x5490950>
145491970:     	movzbl	%sil, %r10d
145491974:     	testl	%r10d, %r10d
145491977:     	je	0x145491990 <.text+0x5490990>
145491979:     	jmp	0x145491983 <.text+0x5490983>
14549197b:     	nopl	(%rax,%rax)
145491980:     	movq	%r10, %r9
145491983:     	subq	$0x1, %rcx
145491987:     	jb	0x145491999 <.text+0x5490999>
145491989:     	movq	0x50(%rax,%r9,8), %rax
14549198e:     	jmp	0x14549193e <.text+0x549093e>
145491990:     	movl	%r8d, 0x8(%rax,%r9,4)
145491995:     	jmp	0x1454919c3 <.text+0x54909c3>
145491997:     	xorl	%eax, %eax
145491999:     	movq	%rbx, -0x28(%rbp)
14549199d:     	movq	%rax, -0x20(%rbp)
1454919a1:     	movq	$0x0, -0x18(%rbp)
1454919a9:     	movq	%r9, -0x10(%rbp)
1454919ad:     	movq	$0x23, -0x8(%rbp)
1454919b5:     	leaq	-0x48(%rbp), %rcx
1454919b9:     	leaq	-0x28(%rbp), %rdx
1454919bd:     	callq	0x145427a50 <.text+0x5426a50>
1454919c2:     	nop
1454919c3:     	movzbl	%r15b, %eax
1454919c7:     	movzbl	0x8c(%r12), %ecx
1454919d0:     	shll	$0x8, %ecx
1454919d3:     	orl	%eax, %ecx
1454919d5:     	movzbl	0x286(%rdi), %esi
1454919dc:     	movzbl	%sil, %edx
1454919e0:     	movl	%edx, %eax
1454919e2:     	shll	$0x10, %eax
1454919e5:     	orl	%ecx, %eax
1454919e7:     	movzbl	0x8d(%r12), %r8d
1454919f0:     	shll	$0x18, %r8d
1454919f4:     	orl	%eax, %r8d
1454919f7:     	movq	0x28(%rbp), %rax
1454919fb:     	testq	%rax, %rax
1454919fe:     	movl	%edx, -0x4c(%rbp)
145491a01:     	je	0x145491a67 <.text+0x5490a67>
145491a03:     	movq	0x30(%rbp), %rcx
145491a07:     	movw	$0x24, %dx
145491a0b:     	movzwl	0x36(%rax), %r10d
145491a10:     	movl	%r10d, %r11d
145491a13:     	addl	%r11d, %r11d
145491a16:     	movq	$-0x1, %r9
145491a1d:     	nopl	(%rax)
145491a20:     	testq	%r11, %r11
145491a23:     	je	0x145491a50 <.text+0x5490a50>
145491a25:     	cmpw	0x3a(%rax,%r9,2), %dx
145491a2b:     	seta	%r12b
145491a2f:     	sbbb	$0x0, %r12b
145491a33:     	incq	%r9
145491a36:     	addq	$-0x2, %r11
145491a3a:     	cmpb	$0x1, %r12b
145491a3e:     	je	0x145491a20 <.text+0x5490a20>
145491a40:     	movzbl	%r12b, %r10d
145491a44:     	testl	%r10d, %r10d
145491a47:     	je	0x145491a60 <.text+0x5490a60>
145491a49:     	jmp	0x145491a53 <.text+0x5490a53>
145491a4b:     	nopl	(%rax,%rax)
145491a50:     	movq	%r10, %r9
145491a53:     	subq	$0x1, %rcx
145491a57:     	jb	0x145491a69 <.text+0x5490a69>
145491a59:     	movq	0x50(%rax,%r9,8), %rax
145491a5e:     	jmp	0x145491a0b <.text+0x5490a0b>
145491a60:     	movl	%r8d, 0x8(%rax,%r9,4)
145491a65:     	jmp	0x145491a93 <.text+0x5490a93>
145491a67:     	xorl	%eax, %eax
145491a69:     	movq	%rbx, -0x28(%rbp)
145491a6d:     	movq	%rax, -0x20(%rbp)
145491a71:     	movq	$0x0, -0x18(%rbp)
145491a79:     	movq	%r9, -0x10(%rbp)
145491a7d:     	movq	$0x24, -0x8(%rbp)
145491a85:     	leaq	-0x48(%rbp), %rcx
145491a89:     	leaq	-0x28(%rbp), %rdx
145491a8d:     	callq	0x145427a50 <.text+0x5426a50>
145491a92:     	nop
145491a93:     	movq	0x28(%rbp), %rax
145491a97:     	testq	%rax, %rax
145491a9a:     	je	0x145491b0b <.text+0x5490b0b>
145491a9c:     	movq	0x30(%rbp), %rcx
145491aa0:     	movw	$0x2e, %dx
145491aa4:     	movzwl	0x36(%rax), %r9d
145491aa9:     	movl	%r9d, %r10d
145491aac:     	addl	%r10d, %r10d
145491aaf:     	movq	$-0x1, %r8
145491ab6:     	nopw	%cs:(%rax,%rax)
145491ac0:     	testq	%r10, %r10
145491ac3:     	je	0x145491af0 <.text+0x5490af0>
145491ac5:     	cmpw	0x3a(%rax,%r8,2), %dx
145491acb:     	seta	%r11b
145491acf:     	sbbb	$0x0, %r11b
145491ad3:     	incq	%r8
145491ad6:     	addq	$-0x2, %r10
145491ada:     	cmpb	$0x1, %r11b
145491ade:     	je	0x145491ac0 <.text+0x5490ac0>
145491ae0:     	movzbl	%r11b, %r9d
145491ae4:     	testl	%r9d, %r9d
145491ae7:     	je	0x145491b00 <.text+0x5490b00>
145491ae9:     	jmp	0x145491af3 <.text+0x5490af3>
145491aeb:     	nopl	(%rax,%rax)
145491af0:     	movq	%r9, %r8
145491af3:     	subq	$0x1, %rcx
145491af7:     	jb	0x145491b0d <.text+0x5490b0d>
145491af9:     	movq	0x50(%rax,%r8,8), %rax
145491afe:     	jmp	0x145491aa4 <.text+0x5490aa4>
145491b00:     	movl	$0x8, 0x8(%rax,%r8,4)
145491b09:     	jmp	0x145491b3d <.text+0x5490b3d>
145491b0b:     	xorl	%eax, %eax
145491b0d:     	movq	%rbx, -0x28(%rbp)
145491b11:     	movq	%rax, -0x20(%rbp)
145491b15:     	movq	$0x0, -0x18(%rbp)
145491b1d:     	movq	%r8, -0x10(%rbp)
145491b21:     	movq	$0x2e, -0x8(%rbp)
145491b29:     	leaq	-0x48(%rbp), %rcx
145491b2d:     	leaq	-0x28(%rbp), %rdx
145491b31:     	movl	$0x8, %r8d
145491b37:     	callq	0x145427a50 <.text+0x5426a50>
145491b3c:     	nop
145491b3d:     	movq	0x28(%rbp), %rax
145491b41:     	testq	%rax, %rax
145491b44:     	je	0x145491bab <.text+0x5490bab>
145491b46:     	movq	0x30(%rbp), %rcx
145491b4a:     	movw	$0x7e, %dx
145491b4e:     	movzwl	0x36(%rax), %r9d
145491b53:     	movl	%r9d, %r10d
145491b56:     	addl	%r10d, %r10d
145491b59:     	movq	$-0x1, %r8
145491b60:     	testq	%r10, %r10
145491b63:     	je	0x145491b90 <.text+0x5490b90>
145491b65:     	cmpw	0x3a(%rax,%r8,2), %dx
145491b6b:     	seta	%r11b
145491b6f:     	sbbb	$0x0, %r11b
145491b73:     	incq	%r8
145491b76:     	addq	$-0x2, %r10
145491b7a:     	cmpb	$0x1, %r11b
145491b7e:     	je	0x145491b60 <.text+0x5490b60>
145491b80:     	movzbl	%r11b, %r9d
145491b84:     	testl	%r9d, %r9d
145491b87:     	je	0x145491ba0 <.text+0x5490ba0>
145491b89:     	jmp	0x145491b93 <.text+0x5490b93>
145491b8b:     	nopl	(%rax,%rax)
145491b90:     	movq	%r9, %r8
145491b93:     	subq	$0x1, %rcx
145491b97:     	jb	0x145491bad <.text+0x5490bad>
145491b99:     	movq	0x50(%rax,%r8,8), %rax
145491b9e:     	jmp	0x145491b4e <.text+0x5490b4e>
145491ba0:     	movl	$0x7d0, 0x8(%rax,%r8,4) # imm = 0x7D0
145491ba9:     	jmp	0x145491bdd <.text+0x5490bdd>
145491bab:     	xorl	%eax, %eax
145491bad:     	movq	%rbx, -0x28(%rbp)
145491bb1:     	movq	%rax, -0x20(%rbp)
145491bb5:     	movq	$0x0, -0x18(%rbp)
145491bbd:     	movq	%r8, -0x10(%rbp)
145491bc1:     	movq	$0x7e, -0x8(%rbp)
145491bc9:     	leaq	-0x48(%rbp), %rcx
145491bcd:     	leaq	-0x28(%rbp), %rdx
145491bd1:     	movl	$0x7d0, %r8d            # imm = 0x7D0
145491bd7:     	callq	0x145427a50 <.text+0x5426a50>
145491bdc:     	nop
145491bdd:     	movq	0x28(%rbp), %rax
145491be1:     	testq	%rax, %rax
145491be4:     	je	0x145491c4b <.text+0x5490c4b>
145491be6:     	movq	0x30(%rbp), %rcx
145491bea:     	movw	$0x7f, %dx
145491bee:     	movzwl	0x36(%rax), %r9d
145491bf3:     	movl	%r9d, %r10d
145491bf6:     	addl	%r10d, %r10d
145491bf9:     	movq	$-0x1, %r8
145491c00:     	testq	%r10, %r10
145491c03:     	je	0x145491c30 <.text+0x5490c30>
145491c05:     	cmpw	0x3a(%rax,%r8,2), %dx
145491c0b:     	seta	%r11b
145491c0f:     	sbbb	$0x0, %r11b
145491c13:     	incq	%r8
145491c16:     	addq	$-0x2, %r10
145491c1a:     	cmpb	$0x1, %r11b
145491c1e:     	je	0x145491c00 <.text+0x5490c00>
145491c20:     	movzbl	%r11b, %r9d
145491c24:     	testl	%r9d, %r9d
145491c27:     	je	0x145491c40 <.text+0x5490c40>
145491c29:     	jmp	0x145491c33 <.text+0x5490c33>
145491c2b:     	nopl	(%rax,%rax)
145491c30:     	movq	%r9, %r8
145491c33:     	subq	$0x1, %rcx
145491c37:     	jb	0x145491c4d <.text+0x5490c4d>
145491c39:     	movq	0x50(%rax,%r8,8), %rax
145491c3e:     	jmp	0x145491bee <.text+0x5490bee>
145491c40:     	movl	$0x7d0, 0x8(%rax,%r8,4) # imm = 0x7D0
145491c49:     	jmp	0x145491c7d <.text+0x5490c7d>
145491c4b:     	xorl	%eax, %eax
145491c4d:     	movq	%rbx, -0x28(%rbp)
145491c51:     	movq	%rax, -0x20(%rbp)
145491c55:     	movq	$0x0, -0x18(%rbp)
145491c5d:     	movq	%r8, -0x10(%rbp)
145491c61:     	movq	$0x7f, -0x8(%rbp)
145491c69:     	leaq	-0x48(%rbp), %rcx
145491c6d:     	leaq	-0x28(%rbp), %rdx
145491c71:     	movl	$0x7d0, %r8d            # imm = 0x7D0
145491c77:     	callq	0x145427a50 <.text+0x5426a50>
145491c7c:     	nop
145491c7d:     	movq	0x28(%rbp), %rax
145491c81:     	testq	%rax, %rax
145491c84:     	je	0x145491cfb <.text+0x5490cfb>
145491c86:     	movq	0x30(%rbp), %rcx
145491c8a:     	movl	$0x81, %edx
145491c8f:     	movzwl	0x36(%rax), %r9d
145491c94:     	movl	%r9d, %r10d
145491c97:     	addl	%r10d, %r10d
145491c9a:     	movq	$-0x1, %r8
145491ca1:     	nopw	%cs:(%rax,%rax)
145491cb0:     	testq	%r10, %r10
145491cb3:     	je	0x145491ce0 <.text+0x5490ce0>
145491cb5:     	movzwl	0x3a(%rax,%r8,2), %r11d
145491cbb:     	cmpl	%r11d, %edx
145491cbe:     	seta	%r11b
145491cc2:     	sbbb	$0x0, %r11b
145491cc6:     	incq	%r8
145491cc9:     	addq	$-0x2, %r10
145491ccd:     	cmpb	$0x1, %r11b
145491cd1:     	je	0x145491cb0 <.text+0x5490cb0>
145491cd3:     	movzbl	%r11b, %r9d
145491cd7:     	testl	%r9d, %r9d
145491cda:     	je	0x145491cf0 <.text+0x5490cf0>
145491cdc:     	jmp	0x145491ce3 <.text+0x5490ce3>
145491cde:     	nop
145491ce0:     	movq	%r9, %r8
145491ce3:     	subq	$0x1, %rcx
145491ce7:     	jb	0x145491cfd <.text+0x5490cfd>
145491ce9:     	movq	0x50(%rax,%r8,8), %rax
145491cee:     	jmp	0x145491c8f <.text+0x5490c8f>
145491cf0:     	movl	$0x3ec72b02, 0x8(%rax,%r8,4) # imm = 0x3EC72B02
145491cf9:     	jmp	0x145491d2d <.text+0x5490d2d>
145491cfb:     	xorl	%eax, %eax
145491cfd:     	movq	%rbx, -0x28(%rbp)
145491d01:     	movq	%rax, -0x20(%rbp)
145491d05:     	movq	$0x0, -0x18(%rbp)
145491d0d:     	movq	%r8, -0x10(%rbp)
145491d11:     	movq	$0x81, -0x8(%rbp)
145491d19:     	leaq	-0x48(%rbp), %rcx
145491d1d:     	leaq	-0x28(%rbp), %rdx
145491d21:     	movl	$0x3ec72b02, %r8d       # imm = 0x3EC72B02
145491d27:     	callq	0x145427a50 <.text+0x5426a50>
145491d2c:     	nop
145491d2d:     	movq	0x28(%rbp), %rax
145491d31:     	testq	%rax, %rax
145491d34:     	je	0x145491dab <.text+0x5490dab>
145491d36:     	movq	0x30(%rbp), %rcx
145491d3a:     	movl	$0x82, %edx
145491d3f:     	movzwl	0x36(%rax), %r9d
145491d44:     	movl	%r9d, %r10d
145491d47:     	addl	%r10d, %r10d
145491d4a:     	movq	$-0x1, %r8
145491d51:     	nopw	%cs:(%rax,%rax)
145491d60:     	testq	%r10, %r10
145491d63:     	je	0x145491d90 <.text+0x5490d90>
145491d65:     	movzwl	0x3a(%rax,%r8,2), %r11d
145491d6b:     	cmpl	%r11d, %edx
145491d6e:     	seta	%r11b
145491d72:     	sbbb	$0x0, %r11b
145491d76:     	incq	%r8
145491d79:     	addq	$-0x2, %r10
145491d7d:     	cmpb	$0x1, %r11b
145491d81:     	je	0x145491d60 <.text+0x5490d60>
145491d83:     	movzbl	%r11b, %r9d
145491d87:     	testl	%r9d, %r9d
145491d8a:     	je	0x145491da0 <.text+0x5490da0>
145491d8c:     	jmp	0x145491d93 <.text+0x5490d93>
145491d8e:     	nop
145491d90:     	movq	%r9, %r8
145491d93:     	subq	$0x1, %rcx
145491d97:     	jb	0x145491dad <.text+0x5490dad>
145491d99:     	movq	0x50(%rax,%r8,8), %rax
145491d9e:     	jmp	0x145491d3f <.text+0x5490d3f>
145491da0:     	movl	$0x3fc00000, 0x8(%rax,%r8,4) # imm = 0x3FC00000
145491da9:     	jmp	0x145491ddd <.text+0x5490ddd>
145491dab:     	xorl	%eax, %eax
145491dad:     	movq	%rbx, -0x28(%rbp)
145491db1:     	movq	%rax, -0x20(%rbp)
145491db5:     	movq	$0x0, -0x18(%rbp)
145491dbd:     	movq	%r8, -0x10(%rbp)
145491dc1:     	movq	$0x82, -0x8(%rbp)
145491dc9:     	leaq	-0x48(%rbp), %rcx
145491dcd:     	leaq	-0x28(%rbp), %rdx
145491dd1:     	movl	$0x3fc00000, %r8d       # imm = 0x3FC00000
145491dd7:     	callq	0x145427a50 <.text+0x5426a50>
145491ddc:     	nop
145491ddd:     	movq	0x700(%rdi), %rax
145491de4:     	testq	%rax, %rax
145491de7:     	je	0x145491e49 <.text+0x5490e49>
145491de9:     	movq	0x6f8(%rdi), %rcx
145491df0:     	shlq	$0x6, %rax
145491df4:     	xorl	%edx, %edx
145491df6:     	jmp	0x145491e09 <.text+0x5490e09>
145491df8:     	nopl	(%rax,%rax)
145491e00:     	addq	$0x40, %rdx
145491e04:     	cmpq	%rdx, %rax
145491e07:     	je	0x145491e49 <.text+0x5490e49>
145491e09:     	cmpb	$0x19, (%rcx,%rdx)
145491e0d:     	jne	0x145491e00 <.text+0x5490e00>
145491e0f:     	movl	0x4(%rcx,%rdx), %r8d
145491e14:     	cmpl	$0x25a2, %r8d           # imm = 0x25A2
145491e1b:     	je	0x145492aca <.text+0x5491aca>
145491e21:     	cmpl	$0x300, %r8d            # imm = 0x300
145491e28:     	jne	0x145491e00 <.text+0x5490e00>
145491e2a:     	cmpb	$0x6, %r15b
145491e2e:     	movl	$0x217b, %eax           # imm = 0x217B
145491e33:     	movl	$0x37c, %r8d            # imm = 0x37C
145491e39:     	cmovel	%eax, %r8d
145491e3d:     	movl	$0x1, %eax
145491e42:     	cmpl	$0x1, %eax
145491e45:     	jne	0x145491e50 <.text+0x5490e50>
145491e47:     	jmp	0x145491e86 <.text+0x5490e86>
145491e49:     	xorl	%eax, %eax
145491e4b:     	cmpl	$0x1, %eax
145491e4e:     	je	0x145491e86 <.text+0x5490e86>
145491e50:     	cmpb	$0x6, %r13b
145491e54:     	ja	0x145491e74 <.text+0x5490e74>
145491e56:     	movzbl	%r13b, %eax
145491e5a:     	shll	$0x2, %eax
145491e5d:     	leaq	0x151aaf0(%rip), %rcx   # 0x1469ac954
145491e64:     	movl	(%rax,%rcx), %r8d
145491e68:     	leaq	0x151ab01(%rip), %rcx   # 0x1469ac970
145491e6f:     	movl	(%rax,%rcx), %eax
145491e72:     	jmp	0x145491e7f <.text+0x5490e7f>
145491e74:     	movl	$0x31, %eax
145491e79:     	movl	$0x32, %r8d
145491e7f:     	testb	%sil, %sil
145491e82:     	cmovel	%eax, %r8d
145491e86:     	movq	0x28(%rbp), %rax
145491e8a:     	testq	%rax, %rax
145491e8d:     	je	0x145491ef7 <.text+0x5490ef7>
145491e8f:     	movq	0x30(%rbp), %rcx
145491e93:     	movl	$0x83, %edx
145491e98:     	movzwl	0x36(%rax), %r10d
145491e9d:     	movl	%r10d, %r11d
145491ea0:     	addl	%r11d, %r11d
145491ea3:     	movq	$-0x1, %r9
145491eaa:     	nopw	(%rax,%rax)
145491eb0:     	testq	%r11, %r11
145491eb3:     	je	0x145491ee0 <.text+0x5490ee0>
145491eb5:     	movzwl	0x3a(%rax,%r9,2), %r15d
145491ebb:     	cmpl	%r15d, %edx
145491ebe:     	seta	%r15b
145491ec2:     	sbbb	$0x0, %r15b
145491ec6:     	incq	%r9
145491ec9:     	addq	$-0x2, %r11
145491ecd:     	cmpb	$0x1, %r15b
145491ed1:     	je	0x145491eb0 <.text+0x5490eb0>
145491ed3:     	movzbl	%r15b, %r10d
145491ed7:     	testl	%r10d, %r10d
145491eda:     	je	0x145491ef0 <.text+0x5490ef0>
145491edc:     	jmp	0x145491ee3 <.text+0x5490ee3>
145491ede:     	nop
145491ee0:     	movq	%r10, %r9
145491ee3:     	subq	$0x1, %rcx
145491ee7:     	jb	0x145491ef9 <.text+0x5490ef9>
145491ee9:     	movq	0x50(%rax,%r9,8), %rax
145491eee:     	jmp	0x145491e98 <.text+0x5490e98>
145491ef0:     	movl	%r8d, 0x8(%rax,%r9,4)
145491ef5:     	jmp	0x145491f23 <.text+0x5490f23>
145491ef7:     	xorl	%eax, %eax
145491ef9:     	movq	%rbx, -0x28(%rbp)
145491efd:     	movq	%rax, -0x20(%rbp)
145491f01:     	movq	$0x0, -0x18(%rbp)
145491f09:     	movq	%r9, -0x10(%rbp)
145491f0d:     	movq	$0x83, -0x8(%rbp)
145491f15:     	leaq	-0x48(%rbp), %rcx
145491f19:     	leaq	-0x28(%rbp), %rdx
145491f1d:     	callq	0x145427a50 <.text+0x5426a50>
145491f22:     	nop
145491f23:     	cmpb	$0x6, %r13b
145491f27:     	ja	0x145491f47 <.text+0x5490f47>
145491f29:     	movzbl	%r13b, %eax
145491f2d:     	shll	$0x2, %eax
145491f30:     	leaq	0x151aa1d(%rip), %rcx   # 0x1469ac954
145491f37:     	movl	(%rax,%rcx), %r8d
145491f3b:     	leaq	0x151aa2e(%rip), %rcx   # 0x1469ac970
145491f42:     	movl	(%rax,%rcx), %eax
145491f45:     	jmp	0x145491f52 <.text+0x5490f52>
145491f47:     	movl	$0x31, %eax
145491f4c:     	movl	$0x32, %r8d
145491f52:     	testb	%sil, %sil
145491f55:     	cmovel	%eax, %r8d
145491f59:     	movq	0x28(%rbp), %rax
145491f5d:     	testq	%rax, %rax
145491f60:     	je	0x145491fc7 <.text+0x5490fc7>
145491f62:     	movq	0x30(%rbp), %rcx
145491f66:     	movl	$0x84, %edx
145491f6b:     	movzwl	0x36(%rax), %r10d
145491f70:     	movl	%r10d, %r11d
145491f73:     	addl	%r11d, %r11d
145491f76:     	movq	$-0x1, %r9
145491f7d:     	nopl	(%rax)
145491f80:     	testq	%r11, %r11
145491f83:     	je	0x145491fb0 <.text+0x5490fb0>
145491f85:     	movzwl	0x3a(%rax,%r9,2), %esi
145491f8b:     	cmpl	%esi, %edx
145491f8d:     	seta	%sil
145491f91:     	sbbb	$0x0, %sil
145491f95:     	incq	%r9
145491f98:     	addq	$-0x2, %r11
145491f9c:     	cmpb	$0x1, %sil
145491fa0:     	je	0x145491f80 <.text+0x5490f80>
145491fa2:     	movzbl	%sil, %r10d
145491fa6:     	testl	%r10d, %r10d
145491fa9:     	je	0x145491fc0 <.text+0x5490fc0>
145491fab:     	jmp	0x145491fb3 <.text+0x5490fb3>
145491fad:     	nopl	(%rax)
145491fb0:     	movq	%r10, %r9
145491fb3:     	subq	$0x1, %rcx
145491fb7:     	jb	0x145491fc9 <.text+0x5490fc9>
145491fb9:     	movq	0x50(%rax,%r9,8), %rax
145491fbe:     	jmp	0x145491f6b <.text+0x5490f6b>
145491fc0:     	movl	%r8d, 0x8(%rax,%r9,4)
145491fc5:     	jmp	0x145491ff3 <.text+0x5490ff3>
145491fc7:     	xorl	%eax, %eax
145491fc9:     	movq	%rbx, -0x28(%rbp)
145491fcd:     	movq	%rax, -0x20(%rbp)
145491fd1:     	movq	$0x0, -0x18(%rbp)
145491fd9:     	movq	%r9, -0x10(%rbp)
145491fdd:     	movq	$0x84, -0x8(%rbp)
145491fe5:     	leaq	-0x48(%rbp), %rcx
145491fe9:     	leaq	-0x28(%rbp), %rdx
145491fed:     	callq	0x145427a50 <.text+0x5426a50>
145491ff2:     	nop
145491ff3:     	movq	0x28(%rbp), %rax
145491ff7:     	testq	%rax, %rax
145491ffa:     	je	0x14549206b <.text+0x549106b>
145491ffc:     	movq	0x30(%rbp), %rcx
145492000:     	movl	$0x86, %edx
145492005:     	movzwl	0x36(%rax), %r9d
14549200a:     	movl	%r9d, %r10d
14549200d:     	addl	%r10d, %r10d
145492010:     	movq	$-0x1, %r8
145492017:     	nopw	(%rax,%rax)
145492020:     	testq	%r10, %r10
145492023:     	je	0x145492050 <.text+0x5491050>
145492025:     	movzwl	0x3a(%rax,%r8,2), %r11d
14549202b:     	cmpl	%r11d, %edx
14549202e:     	seta	%r11b
145492032:     	sbbb	$0x0, %r11b
145492036:     	incq	%r8
145492039:     	addq	$-0x2, %r10
14549203d:     	cmpb	$0x1, %r11b
145492041:     	je	0x145492020 <.text+0x5491020>
145492043:     	movzbl	%r11b, %r9d
145492047:     	testl	%r9d, %r9d
14549204a:     	je	0x145492060 <.text+0x5491060>
14549204c:     	jmp	0x145492053 <.text+0x5491053>
14549204e:     	nop
145492050:     	movq	%r9, %r8
145492053:     	subq	$0x1, %rcx
145492057:     	jb	0x14549206d <.text+0x549106d>
145492059:     	movq	0x50(%rax,%r8,8), %rax
14549205e:     	jmp	0x145492005 <.text+0x5491005>
145492060:     	movl	$0x41200000, 0x8(%rax,%r8,4) # imm = 0x41200000
145492069:     	jmp	0x14549209d <.text+0x549109d>
14549206b:     	xorl	%eax, %eax
14549206d:     	movq	%rbx, -0x28(%rbp)
145492071:     	movq	%rax, -0x20(%rbp)
145492075:     	movq	$0x0, -0x18(%rbp)
14549207d:     	movq	%r8, -0x10(%rbp)
145492081:     	movq	$0x86, -0x8(%rbp)
145492089:     	leaq	-0x48(%rbp), %rcx
14549208d:     	leaq	-0x28(%rbp), %rdx
145492091:     	movl	$0x41200000, %r8d       # imm = 0x41200000
145492097:     	callq	0x145427a50 <.text+0x5426a50>
14549209c:     	nop
14549209d:     	movq	0x28(%rbp), %rax
1454920a1:     	testq	%rax, %rax
1454920a4:     	je	0x14549211b <.text+0x549111b>
1454920a6:     	movq	0x30(%rbp), %rcx
1454920aa:     	movl	$0x87, %edx
1454920af:     	movzwl	0x36(%rax), %r9d
1454920b4:     	movl	%r9d, %r10d
1454920b7:     	addl	%r10d, %r10d
1454920ba:     	movq	$-0x1, %r8
1454920c1:     	nopw	%cs:(%rax,%rax)
1454920d0:     	testq	%r10, %r10
1454920d3:     	je	0x145492100 <.text+0x5491100>
1454920d5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454920db:     	cmpl	%r11d, %edx
1454920de:     	seta	%r11b
1454920e2:     	sbbb	$0x0, %r11b
1454920e6:     	incq	%r8
1454920e9:     	addq	$-0x2, %r10
1454920ed:     	cmpb	$0x1, %r11b
1454920f1:     	je	0x1454920d0 <.text+0x54910d0>
1454920f3:     	movzbl	%r11b, %r9d
1454920f7:     	testl	%r9d, %r9d
1454920fa:     	je	0x145492110 <.text+0x5491110>
1454920fc:     	jmp	0x145492103 <.text+0x5491103>
1454920fe:     	nop
145492100:     	movq	%r9, %r8
145492103:     	subq	$0x1, %rcx
145492107:     	jb	0x14549211d <.text+0x549111d>
145492109:     	movq	0x50(%rax,%r8,8), %rax
14549210e:     	jmp	0x1454920af <.text+0x54910af>
145492110:     	movl	$0x41a00000, 0x8(%rax,%r8,4) # imm = 0x41A00000
145492119:     	jmp	0x14549214d <.text+0x549114d>
14549211b:     	xorl	%eax, %eax
14549211d:     	movq	%rbx, -0x28(%rbp)
145492121:     	movq	%rax, -0x20(%rbp)
145492125:     	movq	$0x0, -0x18(%rbp)
14549212d:     	movq	%r8, -0x10(%rbp)
145492131:     	movq	$0x87, -0x8(%rbp)
145492139:     	leaq	-0x48(%rbp), %rcx
14549213d:     	leaq	-0x28(%rbp), %rdx
145492141:     	movl	$0x41a00000, %r8d       # imm = 0x41A00000
145492147:     	callq	0x145427a50 <.text+0x5426a50>
14549214c:     	nop
14549214d:     	movq	0x28(%rbp), %rax
145492151:     	testq	%rax, %rax
145492154:     	je	0x1454921cb <.text+0x54911cb>
145492156:     	movq	0x30(%rbp), %rcx
14549215a:     	movl	$0x91, %edx
14549215f:     	movzwl	0x36(%rax), %r9d
145492164:     	movl	%r9d, %r10d
145492167:     	addl	%r10d, %r10d
14549216a:     	movq	$-0x1, %r8
145492171:     	nopw	%cs:(%rax,%rax)
145492180:     	testq	%r10, %r10
145492183:     	je	0x1454921b0 <.text+0x54911b0>
145492185:     	movzwl	0x3a(%rax,%r8,2), %r11d
14549218b:     	cmpl	%r11d, %edx
14549218e:     	seta	%r11b
145492192:     	sbbb	$0x0, %r11b
145492196:     	incq	%r8
145492199:     	addq	$-0x2, %r10
14549219d:     	cmpb	$0x1, %r11b
1454921a1:     	je	0x145492180 <.text+0x5491180>
1454921a3:     	movzbl	%r11b, %r9d
1454921a7:     	testl	%r9d, %r9d
1454921aa:     	je	0x1454921c0 <.text+0x54911c0>
1454921ac:     	jmp	0x1454921b3 <.text+0x54911b3>
1454921ae:     	nop
1454921b0:     	movq	%r9, %r8
1454921b3:     	subq	$0x1, %rcx
1454921b7:     	jb	0x1454921cd <.text+0x54911cd>
1454921b9:     	movq	0x50(%rax,%r8,8), %rax
1454921be:     	jmp	0x14549215f <.text+0x549115f>
1454921c0:     	movl	$0x3f800000, 0x8(%rax,%r8,4) # imm = 0x3F800000
1454921c9:     	jmp	0x1454921fd <.text+0x54911fd>
1454921cb:     	xorl	%eax, %eax
1454921cd:     	movq	%rbx, -0x28(%rbp)
1454921d1:     	movq	%rax, -0x20(%rbp)
1454921d5:     	movq	$0x0, -0x18(%rbp)
1454921dd:     	movq	%r8, -0x10(%rbp)
1454921e1:     	movq	$0x91, -0x8(%rbp)
1454921e9:     	leaq	-0x48(%rbp), %rcx
1454921ed:     	leaq	-0x28(%rbp), %rdx
1454921f1:     	movl	$0x3f800000, %r8d       # imm = 0x3F800000
1454921f7:     	callq	0x145427a50 <.text+0x5426a50>
1454921fc:     	nop
1454921fd:     	movq	0x28(%rbp), %rax
145492201:     	testq	%rax, %rax
145492204:     	je	0x14549227b <.text+0x549127b>
145492206:     	movq	0x30(%rbp), %rcx
14549220a:     	movl	$0xa4, %edx
14549220f:     	movzwl	0x36(%rax), %r9d
145492214:     	movl	%r9d, %r10d
145492217:     	addl	%r10d, %r10d
14549221a:     	movq	$-0x1, %r8
145492221:     	nopw	%cs:(%rax,%rax)
145492230:     	testq	%r10, %r10
145492233:     	je	0x145492260 <.text+0x5491260>
145492235:     	movzwl	0x3a(%rax,%r8,2), %r11d
14549223b:     	cmpl	%r11d, %edx
14549223e:     	seta	%r11b
145492242:     	sbbb	$0x0, %r11b
145492246:     	incq	%r8
145492249:     	addq	$-0x2, %r10
14549224d:     	cmpb	$0x1, %r11b
145492251:     	je	0x145492230 <.text+0x5491230>
145492253:     	movzbl	%r11b, %r9d
145492257:     	testl	%r9d, %r9d
14549225a:     	je	0x145492270 <.text+0x5491270>
14549225c:     	jmp	0x145492263 <.text+0x5491263>
14549225e:     	nop
145492260:     	movq	%r9, %r8
145492263:     	subq	$0x1, %rcx
145492267:     	jb	0x14549227d <.text+0x549127d>
145492269:     	movq	0x50(%rax,%r8,8), %rax
14549226e:     	jmp	0x14549220f <.text+0x549120f>
145492270:     	movl	$0x2800, 0x8(%rax,%r8,4) # imm = 0x2800
145492279:     	jmp	0x1454922ad <.text+0x54912ad>
14549227b:     	xorl	%eax, %eax
14549227d:     	movq	%rbx, -0x28(%rbp)
145492281:     	movq	%rax, -0x20(%rbp)
145492285:     	movq	$0x0, -0x18(%rbp)
14549228d:     	movq	%r8, -0x10(%rbp)
145492291:     	movq	$0xa4, -0x8(%rbp)
145492299:     	leaq	-0x48(%rbp), %rcx
14549229d:     	leaq	-0x28(%rbp), %rdx
1454922a1:     	movl	$0x2800, %r8d           # imm = 0x2800
1454922a7:     	callq	0x145427a50 <.text+0x5426a50>
1454922ac:     	nop
1454922ad:     	movl	0x287(%rdi), %r8d
1454922b4:     	movq	0x28(%rbp), %rax
1454922b8:     	testq	%rax, %rax
1454922bb:     	je	0x145492327 <.text+0x5491327>
1454922bd:     	movq	0x30(%rbp), %rcx
1454922c1:     	movl	$0xc1, %edx
1454922c6:     	movzwl	0x36(%rax), %r10d
1454922cb:     	movl	%r10d, %r11d
1454922ce:     	addl	%r11d, %r11d
1454922d1:     	movq	$-0x1, %r9
1454922d8:     	nopl	(%rax,%rax)
1454922e0:     	testq	%r11, %r11
1454922e3:     	je	0x145492310 <.text+0x5491310>
1454922e5:     	movzwl	0x3a(%rax,%r9,2), %esi
1454922eb:     	cmpl	%esi, %edx
1454922ed:     	seta	%sil
1454922f1:     	sbbb	$0x0, %sil
1454922f5:     	incq	%r9
1454922f8:     	addq	$-0x2, %r11
1454922fc:     	cmpb	$0x1, %sil
145492300:     	je	0x1454922e0 <.text+0x54912e0>
145492302:     	movzbl	%sil, %r10d
145492306:     	testl	%r10d, %r10d
145492309:     	je	0x145492320 <.text+0x5491320>
14549230b:     	jmp	0x145492313 <.text+0x5491313>
14549230d:     	nopl	(%rax)
145492310:     	movq	%r10, %r9
145492313:     	subq	$0x1, %rcx
145492317:     	jb	0x145492329 <.text+0x5491329>
145492319:     	movq	0x50(%rax,%r9,8), %rax
14549231e:     	jmp	0x1454922c6 <.text+0x54912c6>
145492320:     	movl	%r8d, 0x8(%rax,%r9,4)
145492325:     	jmp	0x145492353 <.text+0x5491353>
145492327:     	xorl	%eax, %eax
145492329:     	movq	%rbx, -0x28(%rbp)
14549232d:     	movq	%rax, -0x20(%rbp)
145492331:     	movq	$0x0, -0x18(%rbp)
145492339:     	movq	%r9, -0x10(%rbp)
14549233d:     	movq	$0xc1, -0x8(%rbp)
145492345:     	leaq	-0x48(%rbp), %rcx
145492349:     	leaq	-0x28(%rbp), %rdx
14549234d:     	callq	0x145427a50 <.text+0x5426a50>
145492352:     	nop
145492353:     	movzbl	0x28b(%rdi), %r8d
14549235b:     	orl	$0x2000000, %r8d        # imm = 0x2000000
145492362:     	movq	0x28(%rbp), %rax
145492366:     	testq	%rax, %rax
145492369:     	je	0x1454923d7 <.text+0x54913d7>
14549236b:     	movq	0x30(%rbp), %rcx
14549236f:     	movl	$0xc2, %edx
145492374:     	movzwl	0x36(%rax), %r10d
145492379:     	movl	%r10d, %r11d
14549237c:     	addl	%r11d, %r11d
14549237f:     	movq	$-0x1, %r9
145492386:     	nopw	%cs:(%rax,%rax)
145492390:     	testq	%r11, %r11
145492393:     	je	0x1454923c0 <.text+0x54913c0>
145492395:     	movzwl	0x3a(%rax,%r9,2), %esi
14549239b:     	cmpl	%esi, %edx
14549239d:     	seta	%sil
1454923a1:     	sbbb	$0x0, %sil
1454923a5:     	incq	%r9
1454923a8:     	addq	$-0x2, %r11
1454923ac:     	cmpb	$0x1, %sil
1454923b0:     	je	0x145492390 <.text+0x5491390>
1454923b2:     	movzbl	%sil, %r10d
1454923b6:     	testl	%r10d, %r10d
1454923b9:     	je	0x1454923d0 <.text+0x54913d0>
1454923bb:     	jmp	0x1454923c3 <.text+0x54913c3>
1454923bd:     	nopl	(%rax)
1454923c0:     	movq	%r10, %r9
1454923c3:     	subq	$0x1, %rcx
1454923c7:     	jb	0x1454923d9 <.text+0x54913d9>
1454923c9:     	movq	0x50(%rax,%r9,8), %rax
1454923ce:     	jmp	0x145492374 <.text+0x5491374>
1454923d0:     	movl	%r8d, 0x8(%rax,%r9,4)
1454923d5:     	jmp	0x145492403 <.text+0x5491403>
1454923d7:     	xorl	%eax, %eax
1454923d9:     	movq	%rbx, -0x28(%rbp)
1454923dd:     	movq	%rax, -0x20(%rbp)
1454923e1:     	movq	$0x0, -0x18(%rbp)
1454923e9:     	movq	%r9, -0x10(%rbp)
1454923ed:     	movq	$0xc2, -0x8(%rbp)
1454923f5:     	leaq	-0x48(%rbp), %rcx
1454923f9:     	leaq	-0x28(%rbp), %rdx
1454923fd:     	callq	0x145427a50 <.text+0x5426a50>
145492402:     	nop
145492403:     	movq	0x28(%rbp), %rax
145492407:     	testq	%rax, %rax
14549240a:     	je	0x14549247a <.text+0x549147a>
14549240c:     	movq	0x30(%rbp), %rcx
145492410:     	movl	$0xc3, %edx
145492415:     	movzwl	0x36(%rax), %r9d
14549241a:     	movl	%r9d, %r10d
14549241d:     	addl	%r10d, %r10d
145492420:     	movq	$-0x1, %r8
145492427:     	nopw	(%rax,%rax)
145492430:     	testq	%r10, %r10
145492433:     	je	0x145492460 <.text+0x5491460>
145492435:     	movzwl	0x3a(%rax,%r8,2), %r11d
14549243b:     	cmpl	%r11d, %edx
14549243e:     	seta	%r11b
145492442:     	sbbb	$0x0, %r11b
145492446:     	incq	%r8
145492449:     	addq	$-0x2, %r10
14549244d:     	cmpb	$0x1, %r11b
145492451:     	je	0x145492430 <.text+0x5491430>
145492453:     	movzbl	%r11b, %r9d
145492457:     	testl	%r9d, %r9d
14549245a:     	je	0x145492470 <.text+0x5491470>
14549245c:     	jmp	0x145492463 <.text+0x5491463>
14549245e:     	nop
145492460:     	movq	%r9, %r8
145492463:     	subq	$0x1, %rcx
145492467:     	jb	0x14549247c <.text+0x549147c>
145492469:     	movq	0x50(%rax,%r8,8), %rax
14549246e:     	jmp	0x145492415 <.text+0x5491415>
145492470:     	movl	-0x4c(%rbp), %ecx
145492473:     	movl	%ecx, 0x8(%rax,%r8,4)
145492478:     	jmp	0x1454924aa <.text+0x54914aa>
14549247a:     	xorl	%eax, %eax
14549247c:     	movq	%rbx, -0x28(%rbp)
145492480:     	movq	%rax, -0x20(%rbp)
145492484:     	movq	$0x0, -0x18(%rbp)
14549248c:     	movq	%r8, -0x10(%rbp)
145492490:     	movq	$0xc3, -0x8(%rbp)
145492498:     	leaq	-0x48(%rbp), %rcx
14549249c:     	leaq	-0x28(%rbp), %rdx
1454924a0:     	movl	-0x4c(%rbp), %r8d
1454924a4:     	callq	0x145427a50 <.text+0x5426a50>
1454924a9:     	nop
1454924aa:     	movl	0x3fc(%rdi), %r8d
1454924b1:     	movq	0x28(%rbp), %rax
1454924b5:     	testq	%rax, %rax
1454924b8:     	je	0x145492527 <.text+0x5491527>
1454924ba:     	movq	0x30(%rbp), %rcx
1454924be:     	movl	$0x2cc, %edx            # imm = 0x2CC
1454924c3:     	movzwl	0x36(%rax), %r10d
1454924c8:     	movl	%r10d, %r11d
1454924cb:     	addl	%r11d, %r11d
1454924ce:     	movq	$-0x1, %r9
1454924d5:     	nopw	%cs:(%rax,%rax)
1454924e0:     	testq	%r11, %r11
1454924e3:     	je	0x145492510 <.text+0x5491510>
1454924e5:     	movzwl	0x3a(%rax,%r9,2), %esi
1454924eb:     	cmpl	%esi, %edx
1454924ed:     	seta	%sil
1454924f1:     	sbbb	$0x0, %sil
1454924f5:     	incq	%r9
1454924f8:     	addq	$-0x2, %r11
1454924fc:     	cmpb	$0x1, %sil
145492500:     	je	0x1454924e0 <.text+0x54914e0>
145492502:     	movzbl	%sil, %r10d
145492506:     	testl	%r10d, %r10d
145492509:     	je	0x145492520 <.text+0x5491520>
14549250b:     	jmp	0x145492513 <.text+0x5491513>
14549250d:     	nopl	(%rax)
145492510:     	movq	%r10, %r9
145492513:     	subq	$0x1, %rcx
145492517:     	jb	0x145492529 <.text+0x5491529>
145492519:     	movq	0x50(%rax,%r9,8), %rax
14549251e:     	jmp	0x1454924c3 <.text+0x54914c3>
145492520:     	movl	%r8d, 0x8(%rax,%r9,4)
145492525:     	jmp	0x145492553 <.text+0x5491553>
145492527:     	xorl	%eax, %eax
145492529:     	movq	%rbx, -0x28(%rbp)
14549252d:     	movq	%rax, -0x20(%rbp)
145492531:     	movq	$0x0, -0x18(%rbp)
145492539:     	movq	%r9, -0x10(%rbp)
14549253d:     	movq	$0x2cc, -0x8(%rbp)      # imm = 0x2CC
145492545:     	leaq	-0x48(%rbp), %rcx
145492549:     	leaq	-0x28(%rbp), %rdx
14549254d:     	callq	0x145427a50 <.text+0x5426a50>
145492552:     	nop
145492553:     	cmpl	$0x1, %r14d
145492557:     	adcl	$-0x1, %r14d
14549255b:     	cvtsi2ss	%r14, %xmm1
145492560:     	movss	0x458f90(%rip), %xmm2   # 0x1458eb4f8
145492568:     	mulss	%xmm1, %xmm2
14549256c:     	addss	0x466870(%rip), %xmm2   # 0x1458f8de4
145492574:     	movss	0x458f8c(%rip), %xmm0   # 0x1458eb508
14549257c:     	mulss	%xmm1, %xmm0
145492580:     	mulss	%xmm1, %xmm0
145492584:     	addss	%xmm2, %xmm0
145492588:     	callq	0x145756e1f <.text+0x5755e1f>
14549258d:     	cvttss2si	%xmm0, %rax
145492592:     	xorl	%ecx, %ecx
145492594:     	xorps	%xmm1, %xmm1
145492597:     	ucomiss	%xmm1, %xmm0
14549259a:     	cmovbl	%ecx, %eax
14549259d:     	ucomiss	0x458f78(%rip), %xmm0   # 0x1458eb51c
1454925a4:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454925aa:     	cmovbel	%eax, %r8d
1454925ae:     	movq	0x28(%rbp), %rax
1454925b2:     	testq	%rax, %rax
1454925b5:     	je	0x145492627 <.text+0x5491627>
1454925b7:     	movq	0x30(%rbp), %rcx
1454925bb:     	movl	$0x2cd, %edx            # imm = 0x2CD
1454925c0:     	movzwl	0x36(%rax), %r10d
1454925c5:     	movl	%r10d, %r11d
1454925c8:     	addl	%r11d, %r11d
1454925cb:     	movq	$-0x1, %r9
1454925d2:     	nopw	%cs:(%rax,%rax)
1454925e0:     	testq	%r11, %r11
1454925e3:     	je	0x145492610 <.text+0x5491610>
1454925e5:     	movzwl	0x3a(%rax,%r9,2), %esi
1454925eb:     	cmpl	%esi, %edx
1454925ed:     	seta	%sil
1454925f1:     	sbbb	$0x0, %sil
1454925f5:     	incq	%r9
1454925f8:     	addq	$-0x2, %r11
1454925fc:     	cmpb	$0x1, %sil
145492600:     	je	0x1454925e0 <.text+0x54915e0>
145492602:     	movzbl	%sil, %r10d
145492606:     	testl	%r10d, %r10d
145492609:     	je	0x145492620 <.text+0x5491620>
14549260b:     	jmp	0x145492613 <.text+0x5491613>
14549260d:     	nopl	(%rax)
145492610:     	movq	%r10, %r9
145492613:     	subq	$0x1, %rcx
145492617:     	jb	0x145492629 <.text+0x5491629>
145492619:     	movq	0x50(%rax,%r9,8), %rax
14549261e:     	jmp	0x1454925c0 <.text+0x54915c0>
145492620:     	movl	%r8d, 0x8(%rax,%r9,4)
145492625:     	jmp	0x145492653 <.text+0x5491653>
145492627:     	xorl	%eax, %eax
145492629:     	movq	%rbx, -0x28(%rbp)
14549262d:     	movq	%rax, -0x20(%rbp)
145492631:     	movq	$0x0, -0x18(%rbp)
145492639:     	movq	%r9, -0x10(%rbp)
14549263d:     	movq	$0x2cd, -0x8(%rbp)      # imm = 0x2CD
145492645:     	leaq	-0x48(%rbp), %rcx
145492649:     	leaq	-0x28(%rbp), %rdx
14549264d:     	callq	0x145427a50 <.text+0x5426a50>
145492652:     	nop
145492653:     	movss	0x464(%rdi), %xmm0
14549265b:     	mulss	0x458ec9(%rip), %xmm0   # 0x1458eb52c
145492663:     	movq	0x28(%rbp), %rax
145492667:     	testq	%rax, %rax
14549266a:     	je	0x1454926d9 <.text+0x54916d9>
14549266c:     	movq	0x30(%rbp), %rcx
145492670:     	movl	$0x455, %edx            # imm = 0x455
145492675:     	movzwl	0x36(%rax), %r8d
14549267a:     	movl	%r8d, %r10d
14549267d:     	addl	%r10d, %r10d
145492680:     	movq	$-0x1, %r9
145492687:     	nopw	(%rax,%rax)
145492690:     	testq	%r10, %r10
145492693:     	je	0x1454926c0 <.text+0x54916c0>
145492695:     	movzwl	0x3a(%rax,%r9,2), %r11d
14549269b:     	cmpl	%r11d, %edx
14549269e:     	seta	%r11b
1454926a2:     	sbbb	$0x0, %r11b
1454926a6:     	incq	%r9
1454926a9:     	addq	$-0x2, %r10
1454926ad:     	cmpb	$0x1, %r11b
1454926b1:     	je	0x145492690 <.text+0x5491690>
1454926b3:     	movzbl	%r11b, %r8d
1454926b7:     	testl	%r8d, %r8d
1454926ba:     	je	0x1454926d0 <.text+0x54916d0>
1454926bc:     	jmp	0x1454926c3 <.text+0x54916c3>
1454926be:     	nop
1454926c0:     	movq	%r8, %r9
1454926c3:     	subq	$0x1, %rcx
1454926c7:     	jb	0x1454926db <.text+0x54916db>
1454926c9:     	movq	0x50(%rax,%r9,8), %rax
1454926ce:     	jmp	0x145492675 <.text+0x5491675>
1454926d0:     	movss	%xmm0, 0x8(%rax,%r9,4)
1454926d7:     	jmp	0x14549270a <.text+0x549170a>
1454926d9:     	xorl	%eax, %eax
1454926db:     	movd	%xmm0, %r8d
1454926e0:     	movq	%rbx, -0x28(%rbp)
1454926e4:     	movq	%rax, -0x20(%rbp)
1454926e8:     	movq	$0x0, -0x18(%rbp)
1454926f0:     	movq	%r9, -0x10(%rbp)
1454926f4:     	movq	$0x455, -0x8(%rbp)      # imm = 0x455
1454926fc:     	leaq	-0x48(%rbp), %rcx
145492700:     	leaq	-0x28(%rbp), %rdx
145492704:     	callq	0x145427a50 <.text+0x5426a50>
145492709:     	nop
14549270a:     	imull	$0x2710, 0x408(%rdi), %r8d # imm = 0x2710
145492715:     	movq	0x28(%rbp), %rax
145492719:     	testq	%rax, %rax
14549271c:     	je	0x145492787 <.text+0x5491787>
14549271e:     	movq	0x30(%rbp), %rcx
145492722:     	movl	$0x498, %edx            # imm = 0x498
145492727:     	movzwl	0x36(%rax), %r10d
14549272c:     	movl	%r10d, %r11d
14549272f:     	addl	%r11d, %r11d
145492732:     	movq	$-0x1, %r9
145492739:     	nopl	(%rax)
145492740:     	testq	%r11, %r11
145492743:     	je	0x145492770 <.text+0x5491770>
145492745:     	movzwl	0x3a(%rax,%r9,2), %esi
14549274b:     	cmpl	%esi, %edx
14549274d:     	seta	%sil
145492751:     	sbbb	$0x0, %sil
145492755:     	incq	%r9
145492758:     	addq	$-0x2, %r11
14549275c:     	cmpb	$0x1, %sil
145492760:     	je	0x145492740 <.text+0x5491740>
145492762:     	movzbl	%sil, %r10d
145492766:     	testl	%r10d, %r10d
145492769:     	je	0x145492780 <.text+0x5491780>
14549276b:     	jmp	0x145492773 <.text+0x5491773>
14549276d:     	nopl	(%rax)
145492770:     	movq	%r10, %r9
145492773:     	subq	$0x1, %rcx
145492777:     	jb	0x145492789 <.text+0x5491789>
145492779:     	movq	0x50(%rax,%r9,8), %rax
14549277e:     	jmp	0x145492727 <.text+0x5491727>
145492780:     	movl	%r8d, 0x8(%rax,%r9,4)
145492785:     	jmp	0x1454927b3 <.text+0x54917b3>
145492787:     	xorl	%eax, %eax
145492789:     	movq	%rbx, -0x28(%rbp)
14549278d:     	movq	%rax, -0x20(%rbp)
145492791:     	movq	$0x0, -0x18(%rbp)
145492799:     	movq	%r9, -0x10(%rbp)
14549279d:     	movq	$0x498, -0x8(%rbp)      # imm = 0x498
1454927a5:     	leaq	-0x48(%rbp), %rcx
1454927a9:     	leaq	-0x28(%rbp), %rdx
1454927ad:     	callq	0x145427a50 <.text+0x5426a50>
1454927b2:     	nop
1454927b3:     	movq	0x28(%rbp), %rax
1454927b7:     	testq	%rax, %rax
1454927ba:     	je	0x14549282b <.text+0x549182b>
1454927bc:     	movq	0x30(%rbp), %rcx
1454927c0:     	movl	$0x4ed, %edx            # imm = 0x4ED
1454927c5:     	movzwl	0x36(%rax), %r9d
1454927ca:     	movl	%r9d, %r10d
1454927cd:     	addl	%r10d, %r10d
1454927d0:     	movq	$-0x1, %r8
1454927d7:     	nopw	(%rax,%rax)
1454927e0:     	testq	%r10, %r10
1454927e3:     	je	0x145492810 <.text+0x5491810>
1454927e5:     	movzwl	0x3a(%rax,%r8,2), %r11d
1454927eb:     	cmpl	%r11d, %edx
1454927ee:     	seta	%r11b
1454927f2:     	sbbb	$0x0, %r11b
1454927f6:     	incq	%r8
1454927f9:     	addq	$-0x2, %r10
1454927fd:     	cmpb	$0x1, %r11b
145492801:     	je	0x1454927e0 <.text+0x54917e0>
145492803:     	movzbl	%r11b, %r9d
145492807:     	testl	%r9d, %r9d
14549280a:     	je	0x145492820 <.text+0x5491820>
14549280c:     	jmp	0x145492813 <.text+0x5491813>
14549280e:     	nop
145492810:     	movq	%r9, %r8
145492813:     	subq	$0x1, %rcx
145492817:     	jb	0x14549282d <.text+0x549182d>
145492819:     	movq	0x50(%rax,%r8,8), %rax
14549281e:     	jmp	0x1454927c5 <.text+0x54917c5>
145492820:     	movl	$0xffffffff, 0x8(%rax,%r8,4) # imm = 0xFFFFFFFF
145492829:     	jmp	0x14549285d <.text+0x549185d>
14549282b:     	xorl	%eax, %eax
14549282d:     	movq	%rbx, -0x28(%rbp)
145492831:     	movq	%rax, -0x20(%rbp)
145492835:     	movq	$0x0, -0x18(%rbp)
14549283d:     	movq	%r8, -0x10(%rbp)
145492841:     	movq	$0x4ed, -0x8(%rbp)      # imm = 0x4ED
145492849:     	leaq	-0x48(%rbp), %rcx
14549284d:     	leaq	-0x28(%rbp), %rdx
145492851:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
145492857:     	callq	0x145427a50 <.text+0x5426a50>
14549285c:     	nop
14549285d:     	xorl	%esi, %esi
14549285f:     	leaq	-0x48(%rbp), %r14
145492863:     	leaq	-0x28(%rbp), %r15
145492867:     	jmp	0x145492878 <.text+0x5491878>
145492869:     	nopl	(%rax)
145492870:     	movl	$0x32, 0x8(%rcx,%rdx,4)
145492878:     	cmpq	$0x5, %rsi
14549287c:     	jae	0x145492924 <.text+0x5491924>
145492882:     	movl	%esi, %eax
145492884:     	incq	%rsi
145492887:     	addl	$0x96, %eax
14549288c:     	movq	0x28(%rbp), %rcx
145492890:     	testq	%rcx, %rcx
145492893:     	je	0x1454928f0 <.text+0x54918f0>
145492895:     	movq	0x30(%rbp), %r8
145492899:     	movzwl	0x36(%rcx), %r9d
14549289e:     	movl	%r9d, %r10d
1454928a1:     	addl	%r10d, %r10d
1454928a4:     	movq	$-0x1, %rdx
1454928ab:     	nopl	(%rax,%rax)
1454928b0:     	testq	%r10, %r10
1454928b3:     	je	0x1454928e0 <.text+0x54918e0>
1454928b5:     	cmpw	0x3a(%rcx,%rdx,2), %ax
1454928ba:     	seta	%r11b
1454928be:     	sbbb	$0x0, %r11b
1454928c2:     	incq	%rdx
1454928c5:     	addq	$-0x2, %r10
1454928c9:     	cmpb	$0x1, %r11b
1454928cd:     	je	0x1454928b0 <.text+0x54918b0>
1454928cf:     	movzbl	%r11b, %r9d
1454928d3:     	testl	%r9d, %r9d
1454928d6:     	je	0x145492870 <.text+0x5491870>
1454928d8:     	subq	$0x1, %r8
1454928dc:     	jae	0x1454928e9 <.text+0x54918e9>
1454928de:     	jmp	0x1454928f2 <.text+0x54918f2>
1454928e0:     	movq	%r9, %rdx
1454928e3:     	subq	$0x1, %r8
1454928e7:     	jb	0x1454928f2 <.text+0x54918f2>
1454928e9:     	movq	0x50(%rcx,%rdx,8), %rcx
1454928ee:     	jmp	0x145492899 <.text+0x5491899>
1454928f0:     	xorl	%ecx, %ecx
1454928f2:     	movzwl	%ax, %eax
1454928f5:     	movq	%rbx, -0x28(%rbp)
1454928f9:     	movq	%rcx, -0x20(%rbp)
1454928fd:     	movq	$0x0, -0x18(%rbp)
145492905:     	movq	%rdx, -0x10(%rbp)
145492909:     	movq	%rax, -0x8(%rbp)
14549290d:     	movq	%r14, %rcx
145492910:     	movq	%r15, %rdx
145492913:     	movl	$0x32, %r8d
145492919:     	callq	0x145427a50 <.text+0x5426a50>
14549291e:     	nop
14549291f:     	jmp	0x145492878 <.text+0x5491878>
145492924:     	movl	$0x40c, %esi            # imm = 0x40C
145492929:     	xorl	%r12d, %r12d
14549292c:     	leaq	-0x48(%rbp), %r14
145492930:     	leaq	-0x28(%rbp), %r15
145492934:     	jmp	0x145492945 <.text+0x5491945>
145492936:     	nopw	%cs:(%rax,%rax)
145492940:     	movl	%r8d, 0x8(%rcx,%rdx,4)
145492945:     	cmpq	$0x458, %rsi            # imm = 0x458
14549294c:     	je	0x1454929fe <.text+0x54919fe>
145492952:     	movl	%r12d, %eax
145492955:     	leal	0x1(%rax), %r12d
145492959:     	movl	(%rdi,%rsi), %r8d
14549295d:     	addq	$0x4, %rsi
145492961:     	shll	$0x2, %eax
145492964:     	leal	(%rax,%rax,2), %eax
145492967:     	addl	$0x104, %eax            # imm = 0x104
14549296c:     	movq	0x28(%rbp), %rcx
145492970:     	testq	%rcx, %rcx
145492973:     	je	0x1454929d0 <.text+0x54919d0>
145492975:     	movq	0x30(%rbp), %r9
145492979:     	movzwl	0x36(%rcx), %r10d
14549297e:     	movl	%r10d, %r11d
145492981:     	addl	%r11d, %r11d
145492984:     	movq	$-0x1, %rdx
14549298b:     	nopl	(%rax,%rax)
145492990:     	testq	%r11, %r11
145492993:     	je	0x1454929c0 <.text+0x54919c0>
145492995:     	cmpw	0x3a(%rcx,%rdx,2), %ax
14549299a:     	seta	%r13b
14549299e:     	sbbb	$0x0, %r13b
1454929a2:     	incq	%rdx
1454929a5:     	addq	$-0x2, %r11
1454929a9:     	cmpb	$0x1, %r13b
1454929ad:     	je	0x145492990 <.text+0x5491990>
1454929af:     	movzbl	%r13b, %r10d
1454929b3:     	testl	%r10d, %r10d
1454929b6:     	je	0x145492940 <.text+0x5491940>
1454929b8:     	subq	$0x1, %r9
1454929bc:     	jae	0x1454929c9 <.text+0x54919c9>
1454929be:     	jmp	0x1454929d2 <.text+0x54919d2>
1454929c0:     	movq	%r10, %rdx
1454929c3:     	subq	$0x1, %r9
1454929c7:     	jb	0x1454929d2 <.text+0x54919d2>
1454929c9:     	movq	0x50(%rcx,%rdx,8), %rcx
1454929ce:     	jmp	0x145492979 <.text+0x5491979>
1454929d0:     	xorl	%ecx, %ecx
1454929d2:     	movzwl	%ax, %eax
1454929d5:     	movq	%rbx, -0x28(%rbp)
1454929d9:     	movq	%rcx, -0x20(%rbp)
1454929dd:     	movq	$0x0, -0x18(%rbp)
1454929e5:     	movq	%rdx, -0x10(%rbp)
1454929e9:     	movq	%rax, -0x8(%rbp)
1454929ed:     	movq	%r14, %rcx
1454929f0:     	movq	%r15, %rdx
1454929f3:     	callq	0x145427a50 <.text+0x5426a50>
1454929f8:     	nop
1454929f9:     	jmp	0x145492945 <.text+0x5491945>
1454929fe:     	leaq	-0x28(%rbp), %rcx
145492a02:     	movq	%rdi, %rdx
145492a05:     	callq	0x1454b7280 <.text+0x54b6280>
145492a0a:     	nop
145492a0b:     	xorl	%eax, %eax
145492a0d:     	movabsq	$0x4000000000000000, %rsi # imm = 0x4000000000000000
145492a17:     	leaq	0x28(%rbp), %rbx
145492a1b:     	xorl	%r14d, %r14d
145492a1e:     	nop
145492a20:     	cmpq	$0x4c, %rax
145492a24:     	je	0x145492a5a <.text+0x5491a5a>
145492a26:     	movq	%r14, %r8
145492a29:     	leaq	0x4(%rax), %r15
145492a2d:     	incq	%r14
145492a30:     	cmpl	$0x0, -0x28(%rbp,%rax)
145492a35:     	movq	%r15, %rax
145492a38:     	je	0x145492a20 <.text+0x5491a20>
145492a3a:     	leal	0x1e6(,%r8,2), %edx
145492a42:     	addq	$0x100, %r8             # imm = 0x100
145492a49:     	orq	%rsi, %r8
145492a4c:     	movq	%rbx, %rcx
145492a4f:     	callq	0x1455002f0 <.text+0x54ff2f0>
145492a54:     	nop
145492a55:     	movq	%r15, %rax
145492a58:     	jmp	0x145492a20 <.text+0x5491a20>
145492a5a:     	movq	0x2c8(%rdi), %rbx
145492a61:     	movq	0x2d0(%rdi), %rax
145492a68:     	leaq	(%rax,%rax,8), %rax
145492a6c:     	leaq	(%rbx,%rax,8), %r14
145492a70:     	leaq	0x28(%rbp), %rdi
145492a74:     	cmpq	%r14, %rbx
145492a77:     	je	0x145492aa3 <.text+0x5491aa3>
145492a79:     	nopl	(%rax)
145492a80:     	movl	0x30(%rbx), %eax
145492a83:     	movl	0x38(%rbx), %r8d
145492a87:     	leal	0x1e6(,%rax,2), %edx
145492a8e:     	orq	%rsi, %r8
145492a91:     	movq	%rdi, %rcx
145492a94:     	callq	0x1455002f0 <.text+0x54ff2f0>
145492a99:     	nop
145492a9a:     	addq	$0x48, %rbx
145492a9e:     	cmpq	%r14, %rbx
145492aa1:     	jne	0x145492a80 <.text+0x5491a80>
145492aa3:     	movq	0x38(%rbp), %rax
145492aa7:     	movq	-0x58(%rbp), %rcx
145492aab:     	movq	%rax, 0x10(%rcx)
145492aaf:     	movups	0x28(%rbp), %xmm0
145492ab3:     	movups	%xmm0, (%rcx)
145492ab6:     	addq	$0xc8, %rsp
145492abd:     	popq	%rbx
145492abe:     	popq	%rdi
145492abf:     	popq	%rsi
145492ac0:     	popq	%r12
145492ac2:     	popq	%r13
145492ac4:     	popq	%r14
145492ac6:     	popq	%r15
145492ac8:     	popq	%rbp
145492ac9:     	retq
145492aca:     	xorl	%eax, %eax
145492acc:     	cmpb	$0x6, %r15b
145492ad0:     	sete	%al
145492ad3:     	leal	0x8e9(,%rax,8), %r8d
145492adb:     	movl	$0x1, %eax
145492ae0:     	cmpl	$0x1, %eax
145492ae3:     	jne	0x145491e50 <.text+0x5490e50>
145492ae9:     	jmp	0x145491e86 <.text+0x5490e86>
