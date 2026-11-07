
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145944080:     	pushq	%rbp
145944081:     	pushq	%r15
145944083:     	pushq	%r14
145944085:     	pushq	%r13
145944087:     	pushq	%r12
145944089:     	pushq	%rsi
14594408a:     	pushq	%rdi
14594408b:     	pushq	%rbx
14594408c:     	subq	$0xf8, %rsp
145944093:     	leaq	0x80(%rsp), %rbp
14594409b:     	movaps	%xmm7, 0x60(%rbp)
14594409f:     	movaps	%xmm6, 0x50(%rbp)
1459440a3:     	movq	$-0x2, 0x48(%rbp)
1459440ab:     	movl	%r9d, -0xc(%rbp)
1459440af:     	movq	%r8, %rdi
1459440b2:     	movq	%rcx, %rsi
1459440b5:     	movl	0xe0(%rbp), %r12d
1459440bc:     	movl	(%rdx), %ebx
1459440be:     	movl	0x4(%rdx), %r13d
1459440c2:     	movd	0x8(%rdx), %xmm6
1459440c7:     	movl	0xa0c(%rcx), %eax
1459440cd:     	incl	%eax
1459440cf:     	movl	%eax, 0xa0c(%rcx)
1459440d5:     	movq	0x958(%rcx), %r8
1459440dc:     	movq	0x960(%rcx), %rcx
1459440e3:     	movq	0x970(%rsi), %r9
1459440ea:     	movq	0x968(%rsi), %rdx
1459440f1:     	movss	0x42fc1b(%rip), %xmm0   # 0x145d73d14
1459440f9:     	movss	0x42ff47(%rip), %xmm1   # 0x145d74048
145944101:     	nopw	%cs:(%rax,%rax)
145944110:     	leaq	(%r8,%r9), %r10
145944114:     	rolq	$0x17, %r10
145944118:     	addq	%r8, %r10
14594411b:     	movq	%rcx, %r11
14594411e:     	shlq	$0x11, %r11
145944122:     	xorq	%r8, %rdx
145944125:     	xorq	%rcx, %r9
145944128:     	xorq	%rdx, %rcx
14594412b:     	xorq	%r9, %r8
14594412e:     	rolq	$0x2d, %r9
145944132:     	xorq	%r11, %rdx
145944135:     	shrq	$0x29, %r10
145944139:     	orl	$0x3f800000, %r10d      # imm = 0x3F800000
145944140:     	movd	%r10d, %xmm7
145944145:     	addss	%xmm0, %xmm7
145944149:     	mulss	%xmm1, %xmm7
14594414d:     	ucomiss	%xmm7, %xmm1
145944150:     	jbe	0x145944110 <.text+0x5943110>
145944152:     	movl	%ebx, %r10d
145944155:     	andl	$0xffffff, %r10d        # imm = 0xFFFFFF
14594415c:     	shlq	$0x18, %r10
145944160:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
145944165:     	orq	%r10, %rax
145944168:     	movabsq	$-0xef0000000000000, %r14 # imm = 0xF110000000000000
145944172:     	orq	%rax, %r14
145944175:     	movq	%r8, 0x958(%rsi)
14594417c:     	movq	%r9, 0x970(%rsi)
145944183:     	movq	%rcx, 0x960(%rsi)
14594418a:     	movq	%rdx, 0x968(%rsi)
145944191:     	movq	$0x0, -0x8(%rbp)
145944199:     	movq	$0x0, 0x8(%rbp)
1459441a1:     	leaq	-0x8(%rbp), %r15
1459441a5:     	movq	%r15, %rcx
1459441a8:     	xorl	%edx, %edx
1459441aa:     	movq	%r14, %r8
1459441ad:     	callq	0x1458a8ba0 <.text+0x58a7ba0>
1459441b2:     	nop
1459441b3:     	movq	-0x8(%rbp), %rax
1459441b7:     	testq	%rax, %rax
1459441ba:     	je	0x14594422b <.text+0x594322b>
1459441bc:     	movq	(%rbp), %rcx
1459441c0:     	movw	$0x2, %dx
1459441c4:     	movzwl	0x36(%rax), %r9d
1459441c9:     	movl	%r9d, %r10d
1459441cc:     	addl	%r10d, %r10d
1459441cf:     	movq	$-0x1, %r8
1459441d6:     	nopw	%cs:(%rax,%rax)
1459441e0:     	testq	%r10, %r10
1459441e3:     	je	0x145944210 <.text+0x5943210>
1459441e5:     	cmpw	0x3a(%rax,%r8,2), %dx
1459441eb:     	seta	%r11b
1459441ef:     	sbbb	$0x0, %r11b
1459441f3:     	incq	%r8
1459441f6:     	addq	$-0x2, %r10
1459441fa:     	cmpb	$0x1, %r11b
1459441fe:     	je	0x1459441e0 <.text+0x59431e0>
145944200:     	movzbl	%r11b, %r9d
145944204:     	testl	%r9d, %r9d
145944207:     	je	0x145944220 <.text+0x5943220>
145944209:     	jmp	0x145944213 <.text+0x5943213>
14594420b:     	nopl	(%rax,%rax)
145944210:     	movq	%r9, %r8
145944213:     	subq	$0x1, %rcx
145944217:     	jb	0x14594422d <.text+0x594322d>
145944219:     	movq	0x50(%rax,%r8,8), %rax
14594421e:     	jmp	0x1459441c4 <.text+0x59431c4>
145944220:     	movl	$0x21, 0x8(%rax,%r8,4)
145944229:     	jmp	0x14594425d <.text+0x594325d>
14594422b:     	xorl	%eax, %eax
14594422d:     	movq	%r15, 0x10(%rbp)
145944231:     	movq	%rax, 0x18(%rbp)
145944235:     	movq	$0x0, 0x20(%rbp)
14594423d:     	movq	%r8, 0x28(%rbp)
145944241:     	movq	$0x2, 0x30(%rbp)
145944249:     	leaq	-0x30(%rbp), %rcx
14594424d:     	leaq	0x10(%rbp), %rdx
145944251:     	movl	$0x21, %r8d
145944257:     	callq	0x1458e1710 <.text+0x58e0710>
14594425c:     	nop
14594425d:     	movq	-0x8(%rbp), %rax
145944261:     	testq	%rax, %rax
145944264:     	je	0x1459442c7 <.text+0x59432c7>
145944266:     	movq	(%rbp), %rcx
14594426a:     	movw	$0x3, %dx
14594426e:     	movzwl	0x36(%rax), %r9d
145944273:     	movl	%r9d, %r10d
145944276:     	addl	%r10d, %r10d
145944279:     	movq	$-0x1, %r8
145944280:     	testq	%r10, %r10
145944283:     	je	0x1459442b0 <.text+0x59432b0>
145944285:     	cmpw	0x3a(%rax,%r8,2), %dx
14594428b:     	seta	%r11b
14594428f:     	sbbb	$0x0, %r11b
145944293:     	incq	%r8
145944296:     	addq	$-0x2, %r10
14594429a:     	cmpb	$0x1, %r11b
14594429e:     	je	0x145944280 <.text+0x5943280>
1459442a0:     	movzbl	%r11b, %r9d
1459442a4:     	testl	%r9d, %r9d
1459442a7:     	je	0x1459442c0 <.text+0x59432c0>
1459442a9:     	jmp	0x1459442b3 <.text+0x59432b3>
1459442ab:     	nopl	(%rax,%rax)
1459442b0:     	movq	%r9, %r8
1459442b3:     	subq	$0x1, %rcx
1459442b7:     	jb	0x1459442c9 <.text+0x59432c9>
1459442b9:     	movq	0x50(%rax,%r8,8), %rax
1459442be:     	jmp	0x14594426e <.text+0x594326e>
1459442c0:     	movl	%ebx, 0x8(%rax,%r8,4)
1459442c5:     	jmp	0x1459442f6 <.text+0x59432f6>
1459442c7:     	xorl	%eax, %eax
1459442c9:     	movq	%r15, 0x10(%rbp)
1459442cd:     	movq	%rax, 0x18(%rbp)
1459442d1:     	movq	$0x0, 0x20(%rbp)
1459442d9:     	movq	%r8, 0x28(%rbp)
1459442dd:     	movq	$0x3, 0x30(%rbp)
1459442e5:     	leaq	-0x30(%rbp), %rcx
1459442e9:     	leaq	0x10(%rbp), %rdx
1459442ed:     	movl	%ebx, %r8d
1459442f0:     	callq	0x1458e1710 <.text+0x58e0710>
1459442f5:     	nop
1459442f6:     	movq	-0x8(%rbp), %rax
1459442fa:     	testq	%rax, %rax
1459442fd:     	je	0x145944369 <.text+0x5943369>
1459442ff:     	movq	(%rbp), %rcx
145944303:     	movw	$0x4, %dx
145944307:     	movzwl	0x36(%rax), %r8d
14594430c:     	movl	%r8d, %r10d
14594430f:     	addl	%r10d, %r10d
145944312:     	movq	$-0x1, %r9
145944319:     	nopl	(%rax)
145944320:     	testq	%r10, %r10
145944323:     	je	0x145944350 <.text+0x5943350>
145944325:     	cmpw	0x3a(%rax,%r9,2), %dx
14594432b:     	seta	%r11b
14594432f:     	sbbb	$0x0, %r11b
145944333:     	incq	%r9
145944336:     	addq	$-0x2, %r10
14594433a:     	cmpb	$0x1, %r11b
14594433e:     	je	0x145944320 <.text+0x5943320>
145944340:     	movzbl	%r11b, %r8d
145944344:     	testl	%r8d, %r8d
145944347:     	je	0x145944360 <.text+0x5943360>
145944349:     	jmp	0x145944353 <.text+0x5943353>
14594434b:     	nopl	(%rax,%rax)
145944350:     	movq	%r8, %r9
145944353:     	subq	$0x1, %rcx
145944357:     	jb	0x14594436b <.text+0x594336b>
145944359:     	movq	0x50(%rax,%r9,8), %rax
14594435e:     	jmp	0x145944307 <.text+0x5943307>
145944360:     	movd	%xmm6, 0x8(%rax,%r9,4)
145944367:     	jmp	0x14594439a <.text+0x594339a>
145944369:     	xorl	%eax, %eax
14594436b:     	movd	%xmm6, %r8d
145944370:     	movq	%r15, 0x10(%rbp)
145944374:     	movq	%rax, 0x18(%rbp)
145944378:     	movq	$0x0, 0x20(%rbp)
145944380:     	movq	%r9, 0x28(%rbp)
145944384:     	movq	$0x4, 0x30(%rbp)
14594438c:     	leaq	-0x30(%rbp), %rcx
145944390:     	leaq	0x10(%rbp), %rdx
145944394:     	callq	0x1458e1710 <.text+0x58e0710>
145944399:     	nop
14594439a:     	movq	-0x8(%rbp), %rax
14594439e:     	testq	%rax, %rax
1459443a1:     	je	0x145944407 <.text+0x5943407>
1459443a3:     	movq	(%rbp), %rcx
1459443a7:     	movw	$0x8, %dx
1459443ab:     	movzwl	0x36(%rax), %r9d
1459443b0:     	movl	%r9d, %r10d
1459443b3:     	addl	%r10d, %r10d
1459443b6:     	movq	$-0x1, %r8
1459443bd:     	nopl	(%rax)
1459443c0:     	testq	%r10, %r10
1459443c3:     	je	0x1459443f0 <.text+0x59433f0>
1459443c5:     	cmpw	0x3a(%rax,%r8,2), %dx
1459443cb:     	seta	%r11b
1459443cf:     	sbbb	$0x0, %r11b
1459443d3:     	incq	%r8
1459443d6:     	addq	$-0x2, %r10
1459443da:     	cmpb	$0x1, %r11b
1459443de:     	je	0x1459443c0 <.text+0x59433c0>
1459443e0:     	movzbl	%r11b, %r9d
1459443e4:     	testl	%r9d, %r9d
1459443e7:     	je	0x145944400 <.text+0x5943400>
1459443e9:     	jmp	0x1459443f3 <.text+0x59433f3>
1459443eb:     	nopl	(%rax,%rax)
1459443f0:     	movq	%r9, %r8
1459443f3:     	subq	$0x1, %rcx
1459443f7:     	jb	0x145944409 <.text+0x5943409>
1459443f9:     	movq	0x50(%rax,%r8,8), %rax
1459443fe:     	jmp	0x1459443ab <.text+0x59433ab>
145944400:     	movl	%r13d, 0x8(%rax,%r8,4)
145944405:     	jmp	0x145944436 <.text+0x5943436>
145944407:     	xorl	%eax, %eax
145944409:     	movq	%r15, 0x10(%rbp)
14594440d:     	movq	%rax, 0x18(%rbp)
145944411:     	movq	$0x0, 0x20(%rbp)
145944419:     	movq	%r8, 0x28(%rbp)
14594441d:     	movq	$0x8, 0x30(%rbp)
145944425:     	leaq	-0x30(%rbp), %rcx
145944429:     	leaq	0x10(%rbp), %rdx
14594442d:     	movl	%r13d, %r8d
145944430:     	callq	0x1458e1710 <.text+0x58e0710>
145944435:     	nop
145944436:     	movq	-0x8(%rbp), %rax
14594443a:     	testq	%rax, %rax
14594443d:     	je	0x1459444a7 <.text+0x59434a7>
14594443f:     	movq	(%rbp), %rcx
145944443:     	movw	$0x9, %dx
145944447:     	movzwl	0x36(%rax), %r9d
14594444c:     	movl	%r9d, %r10d
14594444f:     	addl	%r10d, %r10d
145944452:     	movq	$-0x1, %r8
145944459:     	nopl	(%rax)
145944460:     	testq	%r10, %r10
145944463:     	je	0x145944490 <.text+0x5943490>
145944465:     	cmpw	0x3a(%rax,%r8,2), %dx
14594446b:     	seta	%r11b
14594446f:     	sbbb	$0x0, %r11b
145944473:     	incq	%r8
145944476:     	addq	$-0x2, %r10
14594447a:     	cmpb	$0x1, %r11b
14594447e:     	je	0x145944460 <.text+0x5943460>
145944480:     	movzbl	%r11b, %r9d
145944484:     	testl	%r9d, %r9d
145944487:     	je	0x1459444a0 <.text+0x59434a0>
145944489:     	jmp	0x145944493 <.text+0x5943493>
14594448b:     	nopl	(%rax,%rax)
145944490:     	movq	%r9, %r8
145944493:     	subq	$0x1, %rcx
145944497:     	jb	0x1459444a9 <.text+0x59434a9>
145944499:     	movq	0x50(%rax,%r8,8), %rax
14594449e:     	jmp	0x145944447 <.text+0x5943447>
1459444a0:     	movl	%r12d, 0x8(%rax,%r8,4)
1459444a5:     	jmp	0x1459444d6 <.text+0x59434d6>
1459444a7:     	xorl	%eax, %eax
1459444a9:     	movq	%r15, 0x10(%rbp)
1459444ad:     	movq	%rax, 0x18(%rbp)
1459444b1:     	movq	$0x0, 0x20(%rbp)
1459444b9:     	movq	%r8, 0x28(%rbp)
1459444bd:     	movq	$0x9, 0x30(%rbp)
1459444c5:     	leaq	-0x30(%rbp), %rcx
1459444c9:     	leaq	0x10(%rbp), %rdx
1459444cd:     	movl	%r12d, %r8d
1459444d0:     	callq	0x1458e1710 <.text+0x58e0710>
1459444d5:     	nop
1459444d6:     	xorps	%xmm0, %xmm0
1459444d9:     	addss	%xmm0, %xmm7
1459444dd:     	movss	0x42926f(%rip), %xmm6   # 0x145d6d754
1459444e5:     	mulss	%xmm7, %xmm6
1459444e9:     	movaps	%xmm6, %xmm0
1459444ec:     	callq	0x145bc97bd <.text+0x5bc87bd>
1459444f1:     	movq	-0x8(%rbp), %rax
1459444f5:     	testq	%rax, %rax
1459444f8:     	je	0x145944569 <.text+0x5943569>
1459444fa:     	movq	(%rbp), %rcx
1459444fe:     	movw	$0xc, %dx
145944502:     	movzwl	0x36(%rax), %r8d
145944507:     	movl	%r8d, %r10d
14594450a:     	addl	%r10d, %r10d
14594450d:     	movq	$-0x1, %r9
145944514:     	nopw	%cs:(%rax,%rax)
145944520:     	testq	%r10, %r10
145944523:     	je	0x145944550 <.text+0x5943550>
145944525:     	cmpw	0x3a(%rax,%r9,2), %dx
14594452b:     	seta	%r11b
14594452f:     	sbbb	$0x0, %r11b
145944533:     	incq	%r9
145944536:     	addq	$-0x2, %r10
14594453a:     	cmpb	$0x1, %r11b
14594453e:     	je	0x145944520 <.text+0x5943520>
145944540:     	movzbl	%r11b, %r8d
145944544:     	testl	%r8d, %r8d
145944547:     	je	0x145944560 <.text+0x5943560>
145944549:     	jmp	0x145944553 <.text+0x5943553>
14594454b:     	nopl	(%rax,%rax)
145944550:     	movq	%r8, %r9
145944553:     	subq	$0x1, %rcx
145944557:     	jb	0x14594456b <.text+0x594356b>
145944559:     	movq	0x50(%rax,%r9,8), %rax
14594455e:     	jmp	0x145944502 <.text+0x5943502>
145944560:     	movss	%xmm0, 0x8(%rax,%r9,4)
145944567:     	jmp	0x14594459a <.text+0x594359a>
145944569:     	xorl	%eax, %eax
14594456b:     	movd	%xmm0, %r8d
145944570:     	movq	%r15, 0x10(%rbp)
145944574:     	movq	%rax, 0x18(%rbp)
145944578:     	movq	$0x0, 0x20(%rbp)
145944580:     	movq	%r9, 0x28(%rbp)
145944584:     	movq	$0xc, 0x30(%rbp)
14594458c:     	leaq	-0x30(%rbp), %rcx
145944590:     	leaq	0x10(%rbp), %rdx
145944594:     	callq	0x1458e1710 <.text+0x58e0710>
145944599:     	nop
14594459a:     	movaps	%xmm6, %xmm0
14594459d:     	callq	0x145bc97c3 <.text+0x5bc87c3>
1459445a2:     	movq	-0x8(%rbp), %rax
1459445a6:     	testq	%rax, %rax
1459445a9:     	je	0x145944619 <.text+0x5943619>
1459445ab:     	movq	(%rbp), %rcx
1459445af:     	movw	$0xd, %dx
1459445b3:     	movzwl	0x36(%rax), %r8d
1459445b8:     	movl	%r8d, %r10d
1459445bb:     	addl	%r10d, %r10d
1459445be:     	movq	$-0x1, %r9
1459445c5:     	nopw	%cs:(%rax,%rax)
1459445d0:     	testq	%r10, %r10
1459445d3:     	je	0x145944600 <.text+0x5943600>
1459445d5:     	cmpw	0x3a(%rax,%r9,2), %dx
1459445db:     	seta	%r11b
1459445df:     	sbbb	$0x0, %r11b
1459445e3:     	incq	%r9
1459445e6:     	addq	$-0x2, %r10
1459445ea:     	cmpb	$0x1, %r11b
1459445ee:     	je	0x1459445d0 <.text+0x59435d0>
1459445f0:     	movzbl	%r11b, %r8d
1459445f4:     	testl	%r8d, %r8d
1459445f7:     	je	0x145944610 <.text+0x5943610>
1459445f9:     	jmp	0x145944603 <.text+0x5943603>
1459445fb:     	nopl	(%rax,%rax)
145944600:     	movq	%r8, %r9
145944603:     	subq	$0x1, %rcx
145944607:     	jb	0x14594461b <.text+0x594361b>
145944609:     	movq	0x50(%rax,%r9,8), %rax
14594460e:     	jmp	0x1459445b3 <.text+0x59435b3>
145944610:     	movss	%xmm0, 0x8(%rax,%r9,4)
145944617:     	jmp	0x14594464a <.text+0x594364a>
145944619:     	xorl	%eax, %eax
14594461b:     	movd	%xmm0, %r8d
145944620:     	movq	%r15, 0x10(%rbp)
145944624:     	movq	%rax, 0x18(%rbp)
145944628:     	movq	$0x0, 0x20(%rbp)
145944630:     	movq	%r9, 0x28(%rbp)
145944634:     	movq	$0xd, 0x30(%rbp)
14594463c:     	leaq	-0x30(%rbp), %rcx
145944640:     	leaq	0x10(%rbp), %rdx
145944644:     	callq	0x1458e1710 <.text+0x58e0710>
145944649:     	nop
14594464a:     	movq	-0x8(%rbp), %rax
14594464e:     	testq	%rax, %rax
145944651:     	je	0x1459446bb <.text+0x59436bb>
145944653:     	movq	(%rbp), %rcx
145944657:     	movw	$0xe, %dx
14594465b:     	movzwl	0x36(%rax), %r9d
145944660:     	movl	%r9d, %r10d
145944663:     	addl	%r10d, %r10d
145944666:     	movq	$-0x1, %r8
14594466d:     	nopl	(%rax)
145944670:     	testq	%r10, %r10
145944673:     	je	0x1459446a0 <.text+0x59436a0>
145944675:     	cmpw	0x3a(%rax,%r8,2), %dx
14594467b:     	seta	%r11b
14594467f:     	sbbb	$0x0, %r11b
145944683:     	incq	%r8
145944686:     	addq	$-0x2, %r10
14594468a:     	cmpb	$0x1, %r11b
14594468e:     	je	0x145944670 <.text+0x5943670>
145944690:     	movzbl	%r11b, %r9d
145944694:     	testl	%r9d, %r9d
145944697:     	je	0x1459446b0 <.text+0x59436b0>
145944699:     	jmp	0x1459446a3 <.text+0x59436a3>
14594469b:     	nopl	(%rax,%rax)
1459446a0:     	movq	%r9, %r8
1459446a3:     	subq	$0x1, %rcx
1459446a7:     	jb	0x1459446bd <.text+0x59436bd>
1459446a9:     	movq	0x50(%rax,%r8,8), %rax
1459446ae:     	jmp	0x14594465b <.text+0x594365b>
1459446b0:     	movl	$0x1, 0x8(%rax,%r8,4)
1459446b9:     	jmp	0x1459446ed <.text+0x59436ed>
1459446bb:     	xorl	%eax, %eax
1459446bd:     	movq	%r15, 0x10(%rbp)
1459446c1:     	movq	%rax, 0x18(%rbp)
1459446c5:     	movq	$0x0, 0x20(%rbp)
1459446cd:     	movq	%r8, 0x28(%rbp)
1459446d1:     	movq	$0xe, 0x30(%rbp)
1459446d9:     	leaq	-0x30(%rbp), %rcx
1459446dd:     	leaq	0x10(%rbp), %rdx
1459446e1:     	movl	$0x1, %r8d
1459446e7:     	callq	0x1458e1710 <.text+0x58e0710>
1459446ec:     	nop
1459446ed:     	movd	(%rdi), %xmm0
1459446f1:     	movq	-0x8(%rbp), %rax
1459446f5:     	testq	%rax, %rax
1459446f8:     	je	0x145944769 <.text+0x5943769>
1459446fa:     	movq	(%rbp), %rcx
1459446fe:     	movw	$0xf, %dx
145944702:     	movzwl	0x36(%rax), %r8d
145944707:     	movl	%r8d, %r10d
14594470a:     	addl	%r10d, %r10d
14594470d:     	movq	$-0x1, %r9
145944714:     	nopw	%cs:(%rax,%rax)
145944720:     	testq	%r10, %r10
145944723:     	je	0x145944750 <.text+0x5943750>
145944725:     	cmpw	0x3a(%rax,%r9,2), %dx
14594472b:     	seta	%r11b
14594472f:     	sbbb	$0x0, %r11b
145944733:     	incq	%r9
145944736:     	addq	$-0x2, %r10
14594473a:     	cmpb	$0x1, %r11b
14594473e:     	je	0x145944720 <.text+0x5943720>
145944740:     	movzbl	%r11b, %r8d
145944744:     	testl	%r8d, %r8d
145944747:     	je	0x145944760 <.text+0x5943760>
145944749:     	jmp	0x145944753 <.text+0x5943753>
14594474b:     	nopl	(%rax,%rax)
145944750:     	movq	%r8, %r9
145944753:     	subq	$0x1, %rcx
145944757:     	jb	0x14594476b <.text+0x594376b>
145944759:     	movq	0x50(%rax,%r9,8), %rax
14594475e:     	jmp	0x145944702 <.text+0x5943702>
145944760:     	movd	%xmm0, 0x8(%rax,%r9,4)
145944767:     	jmp	0x14594479a <.text+0x594379a>
145944769:     	xorl	%eax, %eax
14594476b:     	movd	%xmm0, %r8d
145944770:     	movq	%r15, 0x10(%rbp)
145944774:     	movq	%rax, 0x18(%rbp)
145944778:     	movq	$0x0, 0x20(%rbp)
145944780:     	movq	%r9, 0x28(%rbp)
145944784:     	movq	$0xf, 0x30(%rbp)
14594478c:     	leaq	-0x30(%rbp), %rcx
145944790:     	leaq	0x10(%rbp), %rdx
145944794:     	callq	0x1458e1710 <.text+0x58e0710>
145944799:     	nop
14594479a:     	movd	0x4(%rdi), %xmm0
14594479f:     	movq	-0x8(%rbp), %rax
1459447a3:     	testq	%rax, %rax
1459447a6:     	je	0x145944819 <.text+0x5943819>
1459447a8:     	movq	(%rbp), %rcx
1459447ac:     	movw	$0x10, %dx
1459447b0:     	movzwl	0x36(%rax), %r8d
1459447b5:     	movl	%r8d, %r10d
1459447b8:     	addl	%r10d, %r10d
1459447bb:     	movq	$-0x1, %r9
1459447c2:     	nopw	%cs:(%rax,%rax)
1459447d0:     	testq	%r10, %r10
1459447d3:     	je	0x145944800 <.text+0x5943800>
1459447d5:     	cmpw	0x3a(%rax,%r9,2), %dx
1459447db:     	seta	%r11b
1459447df:     	sbbb	$0x0, %r11b
1459447e3:     	incq	%r9
1459447e6:     	addq	$-0x2, %r10
1459447ea:     	cmpb	$0x1, %r11b
1459447ee:     	je	0x1459447d0 <.text+0x59437d0>
1459447f0:     	movzbl	%r11b, %r8d
1459447f4:     	testl	%r8d, %r8d
1459447f7:     	je	0x145944810 <.text+0x5943810>
1459447f9:     	jmp	0x145944803 <.text+0x5943803>
1459447fb:     	nopl	(%rax,%rax)
145944800:     	movq	%r8, %r9
145944803:     	subq	$0x1, %rcx
145944807:     	jb	0x14594481b <.text+0x594381b>
145944809:     	movq	0x50(%rax,%r9,8), %rax
14594480e:     	jmp	0x1459447b0 <.text+0x59437b0>
145944810:     	movd	%xmm0, 0x8(%rax,%r9,4)
145944817:     	jmp	0x14594484a <.text+0x594384a>
145944819:     	xorl	%eax, %eax
14594481b:     	movd	%xmm0, %r8d
145944820:     	movq	%r15, 0x10(%rbp)
145944824:     	movq	%rax, 0x18(%rbp)
145944828:     	movq	$0x0, 0x20(%rbp)
145944830:     	movq	%r9, 0x28(%rbp)
145944834:     	movq	$0x10, 0x30(%rbp)
14594483c:     	leaq	-0x30(%rbp), %rcx
145944840:     	leaq	0x10(%rbp), %rdx
145944844:     	callq	0x1458e1710 <.text+0x58e0710>
145944849:     	nop
14594484a:     	movd	0x8(%rdi), %xmm0
14594484f:     	movq	-0x8(%rbp), %rax
145944853:     	testq	%rax, %rax
145944856:     	je	0x1459448c9 <.text+0x59438c9>
145944858:     	movq	(%rbp), %rcx
14594485c:     	movw	$0x11, %dx
145944860:     	movzwl	0x36(%rax), %r8d
145944865:     	movl	%r8d, %r10d
145944868:     	addl	%r10d, %r10d
14594486b:     	movq	$-0x1, %r9
145944872:     	nopw	%cs:(%rax,%rax)
145944880:     	testq	%r10, %r10
145944883:     	je	0x1459448b0 <.text+0x59438b0>
145944885:     	cmpw	0x3a(%rax,%r9,2), %dx
14594488b:     	seta	%r11b
14594488f:     	sbbb	$0x0, %r11b
145944893:     	incq	%r9
145944896:     	addq	$-0x2, %r10
14594489a:     	cmpb	$0x1, %r11b
14594489e:     	je	0x145944880 <.text+0x5943880>
1459448a0:     	movzbl	%r11b, %r8d
1459448a4:     	testl	%r8d, %r8d
1459448a7:     	je	0x1459448c0 <.text+0x59438c0>
1459448a9:     	jmp	0x1459448b3 <.text+0x59438b3>
1459448ab:     	nopl	(%rax,%rax)
1459448b0:     	movq	%r8, %r9
1459448b3:     	subq	$0x1, %rcx
1459448b7:     	jb	0x1459448cb <.text+0x59438cb>
1459448b9:     	movq	0x50(%rax,%r9,8), %rax
1459448be:     	jmp	0x145944860 <.text+0x5943860>
1459448c0:     	movd	%xmm0, 0x8(%rax,%r9,4)
1459448c7:     	jmp	0x1459448fa <.text+0x59438fa>
1459448c9:     	xorl	%eax, %eax
1459448cb:     	movd	%xmm0, %r8d
1459448d0:     	movq	%r15, 0x10(%rbp)
1459448d4:     	movq	%rax, 0x18(%rbp)
1459448d8:     	movq	$0x0, 0x20(%rbp)
1459448e0:     	movq	%r9, 0x28(%rbp)
1459448e4:     	movq	$0x11, 0x30(%rbp)
1459448ec:     	leaq	-0x30(%rbp), %rcx
1459448f0:     	leaq	0x10(%rbp), %rdx
1459448f4:     	callq	0x1458e1710 <.text+0x58e0710>
1459448f9:     	nop
1459448fa:     	movq	-0x8(%rbp), %rax
1459448fe:     	testq	%rax, %rax
145944901:     	je	0x145944969 <.text+0x5943969>
145944903:     	movq	(%rbp), %rcx
145944907:     	movw	$0x12, %dx
14594490b:     	movzwl	0x36(%rax), %r8d
145944910:     	movl	%r8d, %r10d
145944913:     	addl	%r10d, %r10d
145944916:     	movq	$-0x1, %r9
14594491d:     	nopl	(%rax)
145944920:     	testq	%r10, %r10
145944923:     	je	0x145944950 <.text+0x5943950>
145944925:     	cmpw	0x3a(%rax,%r9,2), %dx
14594492b:     	seta	%r11b
14594492f:     	sbbb	$0x0, %r11b
145944933:     	incq	%r9
145944936:     	addq	$-0x2, %r10
14594493a:     	cmpb	$0x1, %r11b
14594493e:     	je	0x145944920 <.text+0x5943920>
145944940:     	movzbl	%r11b, %r8d
145944944:     	testl	%r8d, %r8d
145944947:     	je	0x145944960 <.text+0x5943960>
145944949:     	jmp	0x145944953 <.text+0x5943953>
14594494b:     	nopl	(%rax,%rax)
145944950:     	movq	%r8, %r9
145944953:     	subq	$0x1, %rcx
145944957:     	jb	0x14594496b <.text+0x594396b>
145944959:     	movq	0x50(%rax,%r9,8), %rax
14594495e:     	jmp	0x14594490b <.text+0x594390b>
145944960:     	movss	%xmm7, 0x8(%rax,%r9,4)
145944967:     	jmp	0x14594499a <.text+0x594399a>
145944969:     	xorl	%eax, %eax
14594496b:     	movd	%xmm7, %r8d
145944970:     	movq	%r15, 0x10(%rbp)
145944974:     	movq	%rax, 0x18(%rbp)
145944978:     	movq	$0x0, 0x20(%rbp)
145944980:     	movq	%r9, 0x28(%rbp)
145944984:     	movq	$0x12, 0x30(%rbp)
14594498c:     	leaq	-0x30(%rbp), %rcx
145944990:     	leaq	0x10(%rbp), %rdx
145944994:     	callq	0x1458e1710 <.text+0x58e0710>
145944999:     	nop
14594499a:     	movq	-0x8(%rbp), %rax
14594499e:     	testq	%rax, %rax
1459449a1:     	je	0x145944a0b <.text+0x5943a0b>
1459449a3:     	movq	(%rbp), %rcx
1459449a7:     	movw	$0x14, %dx
1459449ab:     	movzwl	0x36(%rax), %r9d
1459449b0:     	movl	%r9d, %r10d
1459449b3:     	addl	%r10d, %r10d
1459449b6:     	movq	$-0x1, %r8
1459449bd:     	nopl	(%rax)
1459449c0:     	testq	%r10, %r10
1459449c3:     	je	0x1459449f0 <.text+0x59439f0>
1459449c5:     	cmpw	0x3a(%rax,%r8,2), %dx
1459449cb:     	seta	%r11b
1459449cf:     	sbbb	$0x0, %r11b
1459449d3:     	incq	%r8
1459449d6:     	addq	$-0x2, %r10
1459449da:     	cmpb	$0x1, %r11b
1459449de:     	je	0x1459449c0 <.text+0x59439c0>
1459449e0:     	movzbl	%r11b, %r9d
1459449e4:     	testl	%r9d, %r9d
1459449e7:     	je	0x145944a00 <.text+0x5943a00>
1459449e9:     	jmp	0x1459449f3 <.text+0x59439f3>
1459449eb:     	nopl	(%rax,%rax)
1459449f0:     	movq	%r9, %r8
1459449f3:     	subq	$0x1, %rcx
1459449f7:     	jb	0x145944a0d <.text+0x5943a0d>
1459449f9:     	movq	0x50(%rax,%r8,8), %rax
1459449fe:     	jmp	0x1459449ab <.text+0x59439ab>
145944a00:     	movl	$0x23, 0x8(%rax,%r8,4)
145944a09:     	jmp	0x145944a3d <.text+0x5943a3d>
145944a0b:     	xorl	%eax, %eax
145944a0d:     	movq	%r15, 0x10(%rbp)
145944a11:     	movq	%rax, 0x18(%rbp)
145944a15:     	movq	$0x0, 0x20(%rbp)
145944a1d:     	movq	%r8, 0x28(%rbp)
145944a21:     	movq	$0x14, 0x30(%rbp)
145944a29:     	leaq	-0x30(%rbp), %rcx
145944a2d:     	leaq	0x10(%rbp), %rdx
145944a31:     	movl	$0x23, %r8d
145944a37:     	callq	0x1458e1710 <.text+0x58e0710>
145944a3c:     	nop
145944a3d:     	movq	-0x8(%rbp), %rax
145944a41:     	testq	%rax, %rax
145944a44:     	je	0x145944aaa <.text+0x5943aaa>
145944a46:     	movq	(%rbp), %rcx
145944a4a:     	movw	$0x15, %dx
145944a4e:     	movzwl	0x36(%rax), %r9d
145944a53:     	movl	%r9d, %r10d
145944a56:     	addl	%r10d, %r10d
145944a59:     	movq	$-0x1, %r8
145944a60:     	testq	%r10, %r10
145944a63:     	je	0x145944a90 <.text+0x5943a90>
145944a65:     	cmpw	0x3a(%rax,%r8,2), %dx
145944a6b:     	seta	%r11b
145944a6f:     	sbbb	$0x0, %r11b
145944a73:     	incq	%r8
145944a76:     	addq	$-0x2, %r10
145944a7a:     	cmpb	$0x1, %r11b
145944a7e:     	je	0x145944a60 <.text+0x5943a60>
145944a80:     	movzbl	%r11b, %r9d
145944a84:     	testl	%r9d, %r9d
145944a87:     	je	0x145944aa0 <.text+0x5943aa0>
145944a89:     	jmp	0x145944a93 <.text+0x5943a93>
145944a8b:     	nopl	(%rax,%rax)
145944a90:     	movq	%r9, %r8
145944a93:     	subq	$0x1, %rcx
145944a97:     	jb	0x145944aac <.text+0x5943aac>
145944a99:     	movq	0x50(%rax,%r8,8), %rax
145944a9e:     	jmp	0x145944a4e <.text+0x5943a4e>
145944aa0:     	movl	-0xc(%rbp), %ecx
145944aa3:     	movl	%ecx, 0x8(%rax,%r8,4)
145944aa8:     	jmp	0x145944ada <.text+0x5943ada>
145944aaa:     	xorl	%eax, %eax
145944aac:     	movq	%r15, 0x10(%rbp)
145944ab0:     	movq	%rax, 0x18(%rbp)
145944ab4:     	movq	$0x0, 0x20(%rbp)
145944abc:     	movq	%r8, 0x28(%rbp)
145944ac0:     	movq	$0x15, 0x30(%rbp)
145944ac8:     	leaq	-0x30(%rbp), %rcx
145944acc:     	leaq	0x10(%rbp), %rdx
145944ad0:     	movl	-0xc(%rbp), %r8d
145944ad4:     	callq	0x1458e1710 <.text+0x58e0710>
145944ad9:     	nop
145944ada:     	movl	$0x0, -0x38(%rbp)
145944ae1:     	movq	$0x0, -0x50(%rbp)
145944ae9:     	movq	$0x1, -0x48(%rbp)
145944af1:     	movq	$0x0, -0x40(%rbp)
145944af9:     	movb	$0x1, 0x47(%rbp)
145944afd:     	movq	%r15, 0x28(%rsp)
145944b02:     	movss	%xmm7, 0x20(%rsp)
145944b08:     	leaq	-0x50(%rbp), %rcx
145944b0c:     	movq	%r14, %rdx
145944b0f:     	movb	$0x5, %r8b
145944b12:     	movq	%rdi, %r9
145944b15:     	callq	0x1458a8160 <.text+0x58a7160>
145944b1a:     	nop
145944b1b:     	movdqu	-0x50(%rbp), %xmm0
145944b20:     	movups	-0x40(%rbp), %xmm1
145944b24:     	movaps	%xmm1, 0x20(%rbp)
145944b28:     	movdqa	%xmm0, 0x10(%rbp)
145944b2d:     	movb	$0x0, 0x47(%rbp)
145944b31:     	leaq	-0x30(%rbp), %rcx
145944b35:     	leaq	0x10(%rbp), %rdx
145944b39:     	callq	0x1458a83c0 <.text+0x58a73c0>
145944b3e:     	nop
145944b3f:     	movq	0x5e0(%rsi), %rdi
145944b46:     	cmpq	0x5d0(%rsi), %rdi
145944b4d:     	jne	0x145944b5c <.text+0x5943b5c>
145944b4f:     	leaq	0x5d0(%rsi), %rcx
145944b56:     	callq	0x145bcb530 <.text+0x5bca530>
145944b5b:     	nop
145944b5c:     	movq	0x5d8(%rsi), %rax
145944b63:     	movq	%rdi, %rcx
145944b66:     	shlq	$0x5, %rcx
145944b6a:     	movups	-0x30(%rbp), %xmm0
145944b6e:     	movups	-0x20(%rbp), %xmm1
145944b72:     	movups	%xmm1, 0x10(%rax,%rcx)
145944b77:     	movups	%xmm0, (%rax,%rcx)
145944b7b:     	incq	%rdi
145944b7e:     	movq	%rdi, 0x5e0(%rsi)
145944b85:     	leaq	-0x8(%rbp), %rcx
145944b89:     	callq	0x145994a00 <.text+0x5993a00>
145944b8e:     	movq	%r14, %rax
145944b91:     	movaps	0x50(%rbp), %xmm6
145944b95:     	movaps	0x60(%rbp), %xmm7
145944b99:     	addq	$0xf8, %rsp
145944ba0:     	popq	%rbx
145944ba1:     	popq	%rdi
145944ba2:     	popq	%rsi
145944ba3:     	popq	%r12
145944ba5:     	popq	%r13
145944ba7:     	popq	%r14
145944ba9:     	popq	%r15
145944bab:     	popq	%rbp
145944bac:     	retq
