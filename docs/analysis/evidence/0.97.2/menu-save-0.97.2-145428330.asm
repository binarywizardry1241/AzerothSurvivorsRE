
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145428330:     	pushq	%rbp
145428331:     	pushq	%r15
145428333:     	pushq	%r14
145428335:     	pushq	%rsi
145428336:     	pushq	%rdi
145428337:     	pushq	%rbx
145428338:     	subq	$0x88, %rsp
14542833f:     	leaq	0x80(%rsp), %rbp
145428347:     	movdqa	%xmm7, -0x10(%rbp)
14542834c:     	movdqa	%xmm6, -0x20(%rbp)
145428351:     	movq	$-0x2, -0x28(%rbp)
145428359:     	movq	%rcx, %rsi
14542835c:     	movq	%rdx, %rcx
14542835f:     	movq	%r8, %rdx
145428362:     	callq	0x1400e9d30 <.text+0xe8d30>
145428367:     	movq	%rax, %rdi
14542836a:     	movq	%rdx, %r14
14542836d:     	movq	%rax, %rcx
145428370:     	cmpq	$0x20, %rdx
145428374:     	jae	0x14542838d <.text+0x542738d>
145428376:     	movq	%r14, %rdx
145428379:     	callq	0x145714ae0 <.text+0x5713ae0>
14542837e:     	addq	$-0x2, %rax
145428382:     	cmpq	$0xa, %rax
145428386:     	jbe	0x1454283a3 <.text+0x54273a3>
145428388:     	jmp	0x145428443 <.text+0x5427443>
14542838d:     	movq	%r14, %rdx
145428390:     	callq	0x1457144c0 <.text+0x57134c0>
145428395:     	addq	$-0x2, %rax
145428399:     	cmpq	$0xa, %rax
14542839d:     	ja	0x145428443 <.text+0x5427443>
1454283a3:     	movq	%rdi, %rax
1454283a6:     	addq	%r14, %rax
1454283a9:     	movq	%rdi, %rcx
1454283ac:     	jmp	0x1454283c2 <.text+0x54273c2>
1454283ae:     	nop
1454283b0:     	incq	%rcx
1454283b3:     	andl	$-0x21, %edx
1454283b6:     	addl	$-0x5b, %edx
1454283b9:     	cmpl	$-0x1b, %edx
1454283bc:     	jbe	0x145428443 <.text+0x5427443>
1454283c2:     	cmpq	%rax, %rcx
1454283c5:     	je	0x145428465 <.text+0x5427465>
1454283cb:     	movzbl	(%rcx), %r9d
1454283cf:     	movzbl	%r9b, %edx
1454283d3:     	testb	%dl, %dl
1454283d5:     	jns	0x1454283b0 <.text+0x54273b0>
1454283d7:     	movl	%edx, %r8d
1454283da:     	andl	$0x1f, %r8d
1454283de:     	movzbl	0x1(%rcx), %r10d
1454283e3:     	andl	$0x3f, %r10d
1454283e7:     	cmpb	$-0x21, %dl
1454283ea:     	jbe	0x145428423 <.text+0x5427423>
1454283ec:     	movzbl	0x2(%rcx), %edx
1454283f0:     	shll	$0x6, %r10d
1454283f4:     	andl	$0x3f, %edx
1454283f7:     	orl	%r10d, %edx
1454283fa:     	cmpb	$-0x10, %r9b
1454283fe:     	jb	0x145428433 <.text+0x5427433>
145428400:     	movzbl	0x3(%rcx), %r9d
145428405:     	addq	$0x4, %rcx
145428409:     	andl	$0x7, %r8d
14542840d:     	shll	$0x12, %r8d
145428411:     	shll	$0x6, %edx
145428414:     	andl	$0x3f, %r9d
145428418:     	orl	%edx, %r9d
14542841b:     	orl	%r8d, %r9d
14542841e:     	movl	%r9d, %edx
145428421:     	jmp	0x1454283b3 <.text+0x54273b3>
145428423:     	addq	$0x2, %rcx
145428427:     	shll	$0x6, %r8d
14542842b:     	orl	%r10d, %r8d
14542842e:     	movl	%r8d, %edx
145428431:     	jmp	0x1454283b3 <.text+0x54273b3>
145428433:     	addq	$0x3, %rcx
145428437:     	shll	$0xc, %r8d
14542843b:     	orl	%r8d, %edx
14542843e:     	jmp	0x1454283b3 <.text+0x54273b3>
145428443:     	movq	$-0x1, (%rsi)
14542844a:     	movq	%rsi, %rax
14542844d:     	movaps	-0x20(%rbp), %xmm6
145428451:     	movaps	-0x10(%rbp), %xmm7
145428455:     	addq	$0x88, %rsp
14542845c:     	popq	%rbx
14542845d:     	popq	%rdi
14542845e:     	popq	%rsi
14542845f:     	popq	%r14
145428461:     	popq	%r15
145428463:     	popq	%rbp
145428464:     	retq
145428465:     	testq	%r14, %r14
145428468:     	jns	0x145428479 <.text+0x5427479>
14542846a:     	xorl	%ebx, %ebx
14542846c:     	movq	%rbx, %rcx
14542846f:     	movq	%r14, %rdx
145428472:     	callq	0x1458e721b <.text+0x58e621b>
145428477:     	ud2
145428479:     	je	0x1454285c3 <.text+0x54275c3>
14542847f:     	callq	0x140002200 <.text+0x1200>
145428484:     	movl	$0x1, %ebx
145428489:     	movl	$0x1, %edx
14542848e:     	movq	%r14, %rcx
145428491:     	callq	0x1400021c0 <.text+0x11c0>
145428496:     	testq	%rax, %rax
145428499:     	je	0x14542846c <.text+0x542746c>
14542849b:     	movq	%rax, %r15
14542849e:     	movq	%rax, %rcx
1454284a1:     	movq	%rdi, %rdx
1454284a4:     	movq	%r14, %r8
1454284a7:     	callq	0x145756ddd <.text+0x5755ddd>
1454284ac:     	cmpq	$0x8, %r14
1454284b0:     	jae	0x1454284b9 <.text+0x54274b9>
1454284b2:     	xorl	%eax, %eax
1454284b4:     	jmp	0x1454285d1 <.text+0x54275d1>
1454284b9:     	cmpq	$0x20, %r14
1454284bd:     	jae	0x1454284c6 <.text+0x54274c6>
1454284bf:     	xorl	%eax, %eax
1454284c1:     	jmp	0x14542855a <.text+0x542755a>
1454284c6:     	movabsq	$0x7fffffffffffffe0, %rax # imm = 0x7FFFFFFFFFFFFFE0
1454284d0:     	andq	%r14, %rax
1454284d3:     	xorl	%ecx, %ecx
1454284d5:     	movdqa	0x4c4b53(%rip), %xmm0   # 0x1458ed030
1454284dd:     	movdqa	0x4c311b(%rip), %xmm1   # 0x1458eb600
1454284e5:     	movdqa	0x4c4b53(%rip), %xmm2   # 0x1458ed040
1454284ed:     	nopl	(%rax)
1454284f0:     	movdqu	(%r15,%rcx), %xmm3
1454284f6:     	movdqu	0x10(%r15,%rcx), %xmm4
1454284fd:     	movdqa	%xmm3, %xmm5
145428501:     	paddb	%xmm0, %xmm5
145428505:     	movdqa	%xmm4, %xmm6
145428509:     	paddb	%xmm0, %xmm6
14542850d:     	movdqa	%xmm5, %xmm7
145428511:     	pminub	%xmm1, %xmm7
145428515:     	pcmpeqb	%xmm5, %xmm7
145428519:     	pand	%xmm2, %xmm7
14542851d:     	movdqa	%xmm6, %xmm5
145428521:     	pminub	%xmm1, %xmm5
145428525:     	pcmpeqb	%xmm6, %xmm5
145428529:     	pand	%xmm2, %xmm5
14542852d:     	por	%xmm3, %xmm7
145428531:     	por	%xmm4, %xmm5
145428535:     	movdqu	%xmm7, (%r15,%rcx)
14542853b:     	movdqu	%xmm5, 0x10(%r15,%rcx)
145428542:     	addq	$0x20, %rcx
145428546:     	cmpq	%rcx, %rax
145428549:     	jne	0x1454284f0 <.text+0x54274f0>
14542854b:     	cmpq	%rax, %r14
14542854e:     	je	0x1454285f0 <.text+0x54275f0>
145428554:     	testb	$0x18, %r14b
145428558:     	je	0x1454285d1 <.text+0x54275d1>
14542855a:     	movq	%rax, %rcx
14542855d:     	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
145428567:     	andq	%r14, %rax
14542856a:     	movdqa	0x4c4ade(%rip), %xmm0   # 0x1458ed050
145428572:     	movdqa	0x4c4ae6(%rip), %xmm1   # 0x1458ed060
14542857a:     	movdqa	0x4c4aee(%rip), %xmm2   # 0x1458ed070
145428582:     	nopw	%cs:(%rax,%rax)
145428590:     	movq	(%r15,%rcx), %xmm3
145428596:     	movdqa	%xmm3, %xmm4
14542859a:     	paddb	%xmm0, %xmm4
14542859e:     	movdqa	%xmm4, %xmm5
1454285a2:     	pmaxub	%xmm1, %xmm5
1454285a6:     	pcmpeqb	%xmm4, %xmm5
1454285aa:     	pandn	%xmm2, %xmm5
1454285ae:     	por	%xmm3, %xmm5
1454285b2:     	movq	%xmm5, (%r15,%rcx)
1454285b8:     	addq	$0x8, %rcx
1454285bc:     	cmpq	%rcx, %rax
1454285bf:     	jne	0x145428590 <.text+0x5427590>
1454285c1:     	jmp	0x1454285eb <.text+0x54275eb>
1454285c3:     	movq	%r14, -0x30(%rbp)
1454285c7:     	movl	$0x1, %ecx
1454285cc:     	jmp	0x1454286e1 <.text+0x54276e1>
1454285d1:     	movzbl	(%r15,%rax), %ecx
1454285d6:     	leal	-0x41(%rcx), %edx
1454285d9:     	cmpb	$0x1a, %dl
1454285dc:     	setb	%dl
1454285df:     	shlb	$0x5, %dl
1454285e2:     	orb	%cl, %dl
1454285e4:     	movb	%dl, (%r15,%rax)
1454285e8:     	incq	%rax
1454285eb:     	cmpq	%rax, %r14
1454285ee:     	jne	0x1454285d1 <.text+0x54275d1>
1454285f0:     	cmpq	$0x1, %r14
1454285f4:     	je	0x145428601 <.text+0x5427601>
1454285f6:     	cmpb	$-0x40, 0x1(%r15)
1454285fb:     	jl	0x1454286da <.text+0x54276da>
145428601:     	callq	0x140002200 <.text+0x1200>
145428606:     	movl	$0x1, %ebx
14542860b:     	movl	$0x1, %ecx
145428610:     	movl	$0x1, %edx
145428615:     	callq	0x1400021c0 <.text+0x11c0>
14542861a:     	testq	%rax, %rax
14542861d:     	je	0x14542872a <.text+0x542772a>
145428623:     	movzbl	(%r15), %ecx
145428627:     	leal	-0x61(%rcx), %edx
14542862a:     	cmpb	$0x1a, %dl
14542862d:     	setb	%dl
145428630:     	shlb	$0x5, %dl
145428633:     	xorb	%cl, %dl
145428635:     	movb	%dl, (%rax)
145428637:     	movq	$0x1, -0x58(%rbp)
14542863f:     	movq	%rax, -0x50(%rbp)
145428643:     	movq	$0x1, -0x48(%rbp)
14542864b:     	cmpq	$0x1, %r14
14542864f:     	je	0x1454286ad <.text+0x54276ad>
145428651:     	movq	%r15, -0x38(%rbp)
145428655:     	cmpb	$-0x40, 0x1(%r15)
14542865a:     	movq	%r14, -0x30(%rbp)
14542865e:     	jl	0x145428706 <.text+0x5427706>
145428664:     	leaq	-0x1(%r14), %rdi
145428668:     	movq	$0x1, 0x20(%rsp)
145428671:     	leaq	-0x58(%rbp), %rcx
145428675:     	movl	$0x1, %edx
14542867a:     	movl	$0x1, %r9d
145428680:     	movq	%rdi, %r8
145428683:     	callq	0x145757d40 <.text+0x5756d40>
145428688:     	nop
145428689:     	movq	-0x38(%rbp), %r15
14542868d:     	movq	%r15, %rdx
145428690:     	incq	%rdx
145428693:     	movq	-0x48(%rbp), %rbx
145428697:     	movq	-0x50(%rbp), %rcx
14542869b:     	addq	%rbx, %rcx
14542869e:     	movq	%rdi, %r8
1454286a1:     	callq	0x145756ddd <.text+0x5755ddd>
1454286a6:     	addq	%rdi, %rbx
1454286a9:     	movq	-0x30(%rbp), %r14
1454286ad:     	movq	%rbx, -0x48(%rbp)
1454286b1:     	movq	%rbx, 0x10(%rsi)
1454286b5:     	movq	-0x58(%rbp), %rax
1454286b9:     	movq	%rax, (%rsi)
1454286bc:     	movq	-0x50(%rbp), %rax
1454286c0:     	movq	%rax, 0x8(%rsi)
1454286c4:     	movl	$0x1, %r8d
1454286ca:     	movq	%r15, %rcx
1454286cd:     	movq	%r14, %rdx
1454286d0:     	callq	0x1400021d0 <.text+0x11d0>
1454286d5:     	jmp	0x14542844a <.text+0x542744a>
1454286da:     	movq	%r15, %rcx
1454286dd:     	movq	%r14, -0x30(%rbp)
1454286e1:     	movq	%rcx, -0x40(%rbp)
1454286e5:     	leaq	0x12f8574(%rip), %rax   # 0x146720c60
1454286ec:     	movq	%rax, 0x20(%rsp)
1454286f1:     	movl	$0x1, %r9d
1454286f7:     	movq	-0x30(%rbp), %rdx
1454286fb:     	xorl	%r8d, %r8d
1454286fe:     	callq	0x1458e7430 <.text+0x58e6430>
145428703:     	nop
145428704:     	jmp	0x145428742 <.text+0x5427742>
145428706:     	leaq	0x12f856b(%rip), %rax   # 0x146720c78
14542870d:     	movq	%rax, 0x20(%rsp)
145428712:     	movl	$0x1, %r8d
145428718:     	movq	-0x38(%rbp), %rcx
14542871c:     	movq	%r14, %rdx
14542871f:     	movq	%r14, %r9
145428722:     	callq	0x1458e7430 <.text+0x58e6430>
145428727:     	nop
145428728:     	jmp	0x145428742 <.text+0x5427742>
14542872a:     	movq	%r14, -0x30(%rbp)
14542872e:     	movq	%r15, -0x40(%rbp)
145428732:     	movl	$0x1, %ecx
145428737:     	movl	$0x1, %edx
14542873c:     	callq	0x1458e721b <.text+0x58e621b>
145428741:     	nop
145428742:     	ud2
