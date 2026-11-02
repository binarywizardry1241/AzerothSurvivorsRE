
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145890550:     	movq	0x10(%rcx), %rdx
145890554:     	testq	%rdx, %rdx
145890557:     	je	0x14589059d <.text+0x588f59d>
145890559:     	movq	0x8(%rcx), %rcx
14589055d:     	movq	0x18(%rcx), %rax
145890561:     	cmpq	$0x1, %rdx
145890565:     	je	0x145890657 <.text+0x588f657>
14589056b:     	imulq	$0x38, %rdx, %rdx
14589056f:     	addq	$-0x38, %rdx
145890573:     	shrq	$0x3, %rdx
145890577:     	movabsq	$0x6db6db6db6db6db7, %r8 # imm = 0x6DB6DB6DB6DB6DB7
145890581:     	imulq	%rdx, %r8
145890585:     	leaq	-0x1(%r8), %r9
145890589:     	movl	%r8d, %edx
14589058c:     	andl	$0x3, %edx
14589058f:     	cmpq	$0x3, %r9
145890593:     	jae	0x1458905a3 <.text+0x588f5a3>
145890595:     	xorl	%r9d, %r9d
145890598:     	jmp	0x14589062d <.text+0x588f62d>
14589059d:     	movl	$0x1, %eax
1458905a2:     	retq
1458905a3:     	movabsq	$0x7fffffffffffffc, %r9 # imm = 0x7FFFFFFFFFFFFFC
1458905ad:     	andq	%r9, %r8
1458905b0:     	leaq	0xf8(%rcx), %r10
1458905b7:     	xorl	%r9d, %r9d
1458905ba:     	jmp	0x1458905d0 <.text+0x588f5d0>
1458905bc:     	nopl	(%rax)
1458905c0:     	addq	$0x4, %r9
1458905c4:     	addq	$0xe0, %r10
1458905cb:     	cmpq	%r9, %r8
1458905ce:     	je	0x145890628 <.text+0x588f628>
1458905d0:     	movq	-0xa8(%r10), %r11
1458905d7:     	cmpq	%r11, %rax
1458905da:     	jbe	0x145890600 <.text+0x588f600>
1458905dc:     	movq	-0x70(%r10), %r11
1458905e0:     	cmpq	%r11, %rax
1458905e3:     	jbe	0x14589060c <.text+0x588f60c>
1458905e5:     	movq	-0x38(%r10), %r11
1458905e9:     	cmpq	%r11, %rax
1458905ec:     	jbe	0x145890618 <.text+0x588f618>
1458905ee:     	movq	(%r10), %r11
1458905f1:     	cmpq	%r11, %rax
1458905f4:     	ja	0x1458905c0 <.text+0x588f5c0>
1458905f6:     	jmp	0x145890623 <.text+0x588f623>
1458905f8:     	nopl	(%rax,%rax)
145890600:     	movq	%r11, %rax
145890603:     	movq	-0x70(%r10), %r11
145890607:     	cmpq	%r11, %rax
14589060a:     	ja	0x1458905e5 <.text+0x588f5e5>
14589060c:     	movq	%r11, %rax
14589060f:     	movq	-0x38(%r10), %r11
145890613:     	cmpq	%r11, %rax
145890616:     	ja	0x1458905ee <.text+0x588f5ee>
145890618:     	movq	%r11, %rax
14589061b:     	movq	(%r10), %r11
14589061e:     	cmpq	%r11, %rax
145890621:     	ja	0x1458905c0 <.text+0x588f5c0>
145890623:     	movq	%r11, %rax
145890626:     	jmp	0x1458905c0 <.text+0x588f5c0>
145890628:     	testq	%rdx, %rdx
14589062b:     	je	0x145890657 <.text+0x588f657>
14589062d:     	imulq	$0x38, %r9, %r8
145890631:     	addq	%r8, %rcx
145890634:     	addq	$0x50, %rcx
145890638:     	imulq	$0x38, %rdx, %rdx
14589063c:     	xorl	%r8d, %r8d
14589063f:     	nop
145890640:     	movq	%rax, %r9
145890643:     	movq	(%rcx,%r8), %rax
145890647:     	cmpq	%rax, %r9
14589064a:     	cmovaq	%r9, %rax
14589064e:     	addq	$0x38, %r8
145890652:     	cmpq	%r8, %rdx
145890655:     	jne	0x145890640 <.text+0x588f640>
145890657:     	incq	%rax
14589065a:     	retq


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458912a0:     	pushq	%rbp
1458912a1:     	pushq	%r15
1458912a3:     	pushq	%r14
1458912a5:     	pushq	%rsi
1458912a6:     	pushq	%rdi
1458912a7:     	pushq	%rbx
1458912a8:     	subq	$0x88, %rsp
1458912af:     	leaq	0x80(%rsp), %rbp
1458912b7:     	movdqa	%xmm7, -0x10(%rbp)
1458912bc:     	movdqa	%xmm6, -0x20(%rbp)
1458912c1:     	movq	$-0x2, -0x28(%rbp)
1458912c9:     	movq	%rcx, %rsi
1458912cc:     	movq	%rdx, %rcx
1458912cf:     	movq	%r8, %rdx
1458912d2:     	callq	0x14006f550 <.text+0x6e550>
1458912d7:     	movq	%rax, %rdi
1458912da:     	movq	%rdx, %r14
1458912dd:     	movq	%rax, %rcx
1458912e0:     	cmpq	$0x20, %rdx
1458912e4:     	jae	0x1458912fd <.text+0x58902fd>
1458912e6:     	movq	%r14, %rdx
1458912e9:     	callq	0x145ba4c30 <.text+0x5ba3c30>
1458912ee:     	addq	$-0x2, %rax
1458912f2:     	cmpq	$0xa, %rax
1458912f6:     	jbe	0x145891313 <.text+0x5890313>
1458912f8:     	jmp	0x1458913b3 <.text+0x58903b3>
1458912fd:     	movq	%r14, %rdx
145891300:     	callq	0x145ba4610 <.text+0x5ba3610>
145891305:     	addq	$-0x2, %rax
145891309:     	cmpq	$0xa, %rax
14589130d:     	ja	0x1458913b3 <.text+0x58903b3>
145891313:     	movq	%rdi, %rax
145891316:     	addq	%r14, %rax
145891319:     	movq	%rdi, %rcx
14589131c:     	jmp	0x145891332 <.text+0x5890332>
14589131e:     	nop
145891320:     	incq	%rcx
145891323:     	andl	$-0x21, %edx
145891326:     	addl	$-0x5b, %edx
145891329:     	cmpl	$-0x1b, %edx
14589132c:     	jbe	0x1458913b3 <.text+0x58903b3>
145891332:     	cmpq	%rax, %rcx
145891335:     	je	0x1458913d5 <.text+0x58903d5>
14589133b:     	movzbl	(%rcx), %r9d
14589133f:     	movzbl	%r9b, %edx
145891343:     	testb	%dl, %dl
145891345:     	jns	0x145891320 <.text+0x5890320>
145891347:     	movl	%edx, %r8d
14589134a:     	andl	$0x1f, %r8d
14589134e:     	movzbl	0x1(%rcx), %r10d
145891353:     	andl	$0x3f, %r10d
145891357:     	cmpb	$-0x21, %dl
14589135a:     	jbe	0x145891393 <.text+0x5890393>
14589135c:     	movzbl	0x2(%rcx), %edx
145891360:     	shll	$0x6, %r10d
145891364:     	andl	$0x3f, %edx
145891367:     	orl	%r10d, %edx
14589136a:     	cmpb	$-0x10, %r9b
14589136e:     	jb	0x1458913a3 <.text+0x58903a3>
145891370:     	movzbl	0x3(%rcx), %r9d
145891375:     	addq	$0x4, %rcx
145891379:     	andl	$0x7, %r8d
14589137d:     	shll	$0x12, %r8d
145891381:     	shll	$0x6, %edx
145891384:     	andl	$0x3f, %r9d
145891388:     	orl	%edx, %r9d
14589138b:     	orl	%r8d, %r9d
14589138e:     	movl	%r9d, %edx
145891391:     	jmp	0x145891323 <.text+0x5890323>
145891393:     	addq	$0x2, %rcx
145891397:     	shll	$0x6, %r8d
14589139b:     	orl	%r10d, %r8d
14589139e:     	movl	%r8d, %edx
1458913a1:     	jmp	0x145891323 <.text+0x5890323>
1458913a3:     	addq	$0x3, %rcx
1458913a7:     	shll	$0xc, %r8d
1458913ab:     	orl	%r8d, %edx
1458913ae:     	jmp	0x145891323 <.text+0x5890323>
1458913b3:     	movq	$-0x1, (%rsi)
1458913ba:     	movq	%rsi, %rax
1458913bd:     	movaps	-0x20(%rbp), %xmm6
1458913c1:     	movaps	-0x10(%rbp), %xmm7
1458913c5:     	addq	$0x88, %rsp
1458913cc:     	popq	%rbx
1458913cd:     	popq	%rdi
1458913ce:     	popq	%rsi
1458913cf:     	popq	%r14
1458913d1:     	popq	%r15
1458913d3:     	popq	%rbp
1458913d4:     	retq
1458913d5:     	testq	%r14, %r14
1458913d8:     	jns	0x1458913e9 <.text+0x58903e9>
1458913da:     	xorl	%ebx, %ebx
1458913dc:     	movq	%rbx, %rcx
1458913df:     	movq	%r14, %rdx
1458913e2:     	callq	0x145d6944b <.text+0x5d6844b>
1458913e7:     	ud2
1458913e9:     	je	0x145891533 <.text+0x5890533>
1458913ef:     	callq	0x140002200 <.text+0x1200>
1458913f4:     	movl	$0x1, %ebx
1458913f9:     	movl	$0x1, %edx
1458913fe:     	movq	%r14, %rcx
145891401:     	callq	0x1400021c0 <.text+0x11c0>
145891406:     	testq	%rax, %rax
145891409:     	je	0x1458913dc <.text+0x58903dc>
14589140b:     	movq	%rax, %r15
14589140e:     	movq	%rax, %rcx
145891411:     	movq	%rdi, %rdx
145891414:     	movq	%r14, %r8
145891417:     	callq	0x145bc977b <.text+0x5bc877b>
14589141c:     	cmpq	$0x8, %r14
145891420:     	jae	0x145891429 <.text+0x5890429>
145891422:     	xorl	%eax, %eax
145891424:     	jmp	0x145891541 <.text+0x5890541>
145891429:     	cmpq	$0x20, %r14
14589142d:     	jae	0x145891436 <.text+0x5890436>
14589142f:     	xorl	%eax, %eax
145891431:     	jmp	0x1458914ca <.text+0x58904ca>
145891436:     	movabsq	$0x7fffffffffffffe0, %rax # imm = 0x7FFFFFFFFFFFFFE0
145891440:     	andq	%r14, %rax
145891443:     	xorl	%ecx, %ecx
145891445:     	movdqa	0x4dbd13(%rip), %xmm0   # 0x145d6d160
14589144d:     	movdqa	0x4dbd1b(%rip), %xmm1   # 0x145d6d170
145891455:     	movdqa	0x4dbd23(%rip), %xmm2   # 0x145d6d180
14589145d:     	nopl	(%rax)
145891460:     	movdqu	(%r15,%rcx), %xmm3
145891466:     	movdqu	0x10(%r15,%rcx), %xmm4
14589146d:     	movdqa	%xmm3, %xmm5
145891471:     	paddb	%xmm0, %xmm5
145891475:     	movdqa	%xmm4, %xmm6
145891479:     	paddb	%xmm0, %xmm6
14589147d:     	movdqa	%xmm5, %xmm7
145891481:     	pminub	%xmm1, %xmm7
145891485:     	pcmpeqb	%xmm5, %xmm7
145891489:     	pand	%xmm2, %xmm7
14589148d:     	movdqa	%xmm6, %xmm5
145891491:     	pminub	%xmm1, %xmm5
145891495:     	pcmpeqb	%xmm6, %xmm5
145891499:     	pand	%xmm2, %xmm5
14589149d:     	por	%xmm3, %xmm7
1458914a1:     	por	%xmm4, %xmm5
1458914a5:     	movdqu	%xmm7, (%r15,%rcx)
1458914ab:     	movdqu	%xmm5, 0x10(%r15,%rcx)
1458914b2:     	addq	$0x20, %rcx
1458914b6:     	cmpq	%rcx, %rax
1458914b9:     	jne	0x145891460 <.text+0x5890460>
1458914bb:     	cmpq	%rax, %r14
1458914be:     	je	0x145891560 <.text+0x5890560>
1458914c4:     	testb	$0x18, %r14b
1458914c8:     	je	0x145891541 <.text+0x5890541>
1458914ca:     	movq	%rax, %rcx
1458914cd:     	movabsq	$0x7ffffffffffffff8, %rax # imm = 0x7FFFFFFFFFFFFFF8
1458914d7:     	andq	%r14, %rax
1458914da:     	movdqa	0x4dbcfe(%rip), %xmm0   # 0x145d6d1e0
1458914e2:     	movdqa	0x4dbd06(%rip), %xmm1   # 0x145d6d1f0
1458914ea:     	movdqa	0x4dbd0e(%rip), %xmm2   # 0x145d6d200
1458914f2:     	nopw	%cs:(%rax,%rax)
145891500:     	movq	(%r15,%rcx), %xmm3
145891506:     	movdqa	%xmm3, %xmm4
14589150a:     	paddb	%xmm0, %xmm4
14589150e:     	movdqa	%xmm4, %xmm5
145891512:     	pmaxub	%xmm1, %xmm5
145891516:     	pcmpeqb	%xmm4, %xmm5
14589151a:     	pandn	%xmm2, %xmm5
14589151e:     	por	%xmm3, %xmm5
145891522:     	movq	%xmm5, (%r15,%rcx)
145891528:     	addq	$0x8, %rcx
14589152c:     	cmpq	%rcx, %rax
14589152f:     	jne	0x145891500 <.text+0x5890500>
145891531:     	jmp	0x14589155b <.text+0x589055b>
145891533:     	movq	%r14, -0x30(%rbp)
145891537:     	movl	$0x1, %ecx
14589153c:     	jmp	0x145891651 <.text+0x5890651>
145891541:     	movzbl	(%r15,%rax), %ecx
145891546:     	leal	-0x41(%rcx), %edx
145891549:     	cmpb	$0x1a, %dl
14589154c:     	setb	%dl
14589154f:     	shlb	$0x5, %dl
145891552:     	orb	%cl, %dl
145891554:     	movb	%dl, (%r15,%rax)
145891558:     	incq	%rax
14589155b:     	cmpq	%rax, %r14
14589155e:     	jne	0x145891541 <.text+0x5890541>
145891560:     	cmpq	$0x1, %r14
145891564:     	je	0x145891571 <.text+0x5890571>
145891566:     	cmpb	$-0x40, 0x1(%r15)
14589156b:     	jl	0x14589164a <.text+0x589064a>
145891571:     	callq	0x140002200 <.text+0x1200>
145891576:     	movl	$0x1, %ebx
14589157b:     	movl	$0x1, %ecx
145891580:     	movl	$0x1, %edx
145891585:     	callq	0x1400021c0 <.text+0x11c0>
14589158a:     	testq	%rax, %rax
14589158d:     	je	0x14589169a <.text+0x589069a>
145891593:     	movzbl	(%r15), %ecx
145891597:     	leal	-0x61(%rcx), %edx
14589159a:     	cmpb	$0x1a, %dl
14589159d:     	setb	%dl
1458915a0:     	shlb	$0x5, %dl
1458915a3:     	xorb	%cl, %dl
1458915a5:     	movb	%dl, (%rax)
1458915a7:     	movq	$0x1, -0x58(%rbp)
1458915af:     	movq	%rax, -0x50(%rbp)
1458915b3:     	movq	$0x1, -0x48(%rbp)
1458915bb:     	cmpq	$0x1, %r14
1458915bf:     	je	0x14589161d <.text+0x589061d>
1458915c1:     	movq	%r15, -0x38(%rbp)
1458915c5:     	cmpb	$-0x40, 0x1(%r15)
1458915ca:     	movq	%r14, -0x30(%rbp)
1458915ce:     	jl	0x145891676 <.text+0x5890676>
1458915d4:     	leaq	-0x1(%r14), %rdi
1458915d8:     	movq	$0x1, 0x20(%rsp)
1458915e1:     	leaq	-0x58(%rbp), %rcx
1458915e5:     	movl	$0x1, %edx
1458915ea:     	movl	$0x1, %r9d
1458915f0:     	movq	%rdi, %r8
1458915f3:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1458915f8:     	nop
1458915f9:     	movq	-0x38(%rbp), %r15
1458915fd:     	movq	%r15, %rdx
145891600:     	incq	%rdx
145891603:     	movq	-0x48(%rbp), %rbx
145891607:     	movq	-0x50(%rbp), %rcx
14589160b:     	addq	%rbx, %rcx
14589160e:     	movq	%rdi, %r8
145891611:     	callq	0x145bc977b <.text+0x5bc877b>
145891616:     	addq	%rdi, %rbx
145891619:     	movq	-0x30(%rbp), %r14
14589161d:     	movq	%rbx, -0x48(%rbp)
145891621:     	movq	%rbx, 0x10(%rsi)
145891625:     	movq	-0x58(%rbp), %rax
145891629:     	movq	%rax, (%rsi)
14589162c:     	movq	-0x50(%rbp), %rax
145891630:     	movq	%rax, 0x8(%rsi)
145891634:     	movl	$0x1, %r8d
14589163a:     	movq	%r15, %rcx
14589163d:     	movq	%r14, %rdx
145891640:     	callq	0x1400021d0 <.text+0x11d0>
145891645:     	jmp	0x1458913ba <.text+0x58903ba>
14589164a:     	movq	%r15, %rcx
14589164d:     	movq	%r14, -0x30(%rbp)
145891651:     	movq	%rcx, -0x40(%rbp)
145891655:     	leaq	0x1325764(%rip), %rax   # 0x146bb6dc0
14589165c:     	movq	%rax, 0x20(%rsp)
145891661:     	movl	$0x1, %r9d
145891667:     	movq	-0x30(%rbp), %rdx
14589166b:     	xorl	%r8d, %r8d
14589166e:     	callq	0x145d69660 <.text+0x5d68660>
145891673:     	nop
145891674:     	jmp	0x1458916b2 <.text+0x58906b2>
145891676:     	leaq	0x132575b(%rip), %rax   # 0x146bb6dd8
14589167d:     	movq	%rax, 0x20(%rsp)
145891682:     	movl	$0x1, %r8d
145891688:     	movq	-0x38(%rbp), %rcx
14589168c:     	movq	%r14, %rdx
14589168f:     	movq	%r14, %r9
145891692:     	callq	0x145d69660 <.text+0x5d68660>
145891697:     	nop
145891698:     	jmp	0x1458916b2 <.text+0x58906b2>
14589169a:     	movq	%r14, -0x30(%rbp)
14589169e:     	movq	%r15, -0x40(%rbp)
1458916a2:     	movl	$0x1, %ecx
1458916a7:     	movl	$0x1, %edx
1458916ac:     	callq	0x145d6944b <.text+0x5d6844b>
1458916b1:     	nop
1458916b2:     	ud2


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589d88d:     	testq	%r12, %r12
14589d890:     	je	0x14589ee20 <.text+0x589de20>
14589d896:     	cmpq	$0x1, %r12
14589d89a:     	jne	0x14589ee25 <.text+0x589de25>
14589d8a0:     	movb	$0x46, %dil
14589d8a3:     	jmp	0x14589ee2f <.text+0x589de2f>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589ee20:     	movb	$0x45, %dil
14589ee23:     	jmp	0x14589ee2f <.text+0x589de2f>
14589ee25:     	xorl	%edi, %edi
14589ee27:     	cmpq	$0xd, %r12
14589ee2b:     	adcb	$0x47, %dil


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589d6cf:     	movq	%rax, %rcx
14589d6d2:     	callq	0x145ba4610 <.text+0x5ba3610>
14589d6d7:     	nop
14589d6d8:     	movq	%rax, %r12
14589d6db:     	leaq	0x1690(%rbp), %rcx
14589d6e2:     	movq	0x24e0(%rbp), %rdx
14589d6e9:     	movq	%r15, %r8
14589d6ec:     	callq	0x1458912a0 <.text+0x58902a0>
14589d6f1:     	nop
14589d6f2:     	movq	0x1690(%rbp), %rax
14589d6f9:     	cmpq	$-0x1, %rax
14589d6fd:     	je	0x14589d88d <.text+0x589c88d>
14589d703:     	movq	%rax, 0x24b8(%rbp)
14589d70a:     	movq	0x1698(%rbp), %rax
14589d711:     	movq	%rax, 0x24f8(%rbp)
14589d718:     	movq	0x16a0(%rbp), %r15
14589d71f:     	movb	$0x1, 0x2505(%rbp)
14589d726:     	leaq	0x1690(%rbp), %rcx
14589d72d:     	movq	%rsi, %rdx
14589d730:     	callq	0x1458a4730 <.text+0x58a3730>
14589d735:     	nop
14589d736:     	movq	%rsi, 0x24c0(%rbp)
14589d73d:     	movq	0x1698(%rbp), %rax
14589d744:     	movq	%rax, 0x24d0(%rbp)
14589d74b:     	movq	0x16a0(%rbp), %rax
14589d752:     	testq	%rax, %rax
14589d755:     	je	0x14589e757 <.text+0x589d757>
14589d75b:     	imulq	$0x38, %rax, %rdi
14589d75f:     	cmpq	$0xf, %r15
14589d763:     	jbe	0x14589e6ec <.text+0x589d6ec>
14589d769:     	xorl	%esi, %esi
14589d76b:     	jmp	0x14589d77a <.text+0x589c77a>
14589d76d:     	addq	$0x38, %rsi
14589d771:     	cmpq	%rsi, %rdi
14589d774:     	je	0x14589e757 <.text+0x589d757>
14589d77a:     	movq	0x24d0(%rbp), %rax
14589d781:     	cmpq	%r15, 0x10(%rax,%rsi)
14589d786:     	jne	0x14589d76d <.text+0x589c76d>
14589d788:     	movq	0x24d0(%rbp), %rax
14589d78f:     	movq	0x8(%rax,%rsi), %rcx
14589d794:     	movq	%r15, %rdx
14589d797:     	movq	0x24f8(%rbp), %r8
14589d79e:     	movq	%r15, %r9
14589d7a1:     	callq	0x140002210 <.text+0x1210>
14589d7a6:     	testb	%al, %al
14589d7a8:     	je	0x14589d76d <.text+0x589c76d>
14589d7aa:     	leaq	0x1690(%rbp), %rcx
14589d7b1:     	callq	0x1459ab340 <.text+0x59aa340>
14589d7b6:     	nop
14589d7b7:     	movq	0x1690(%rbp), %rax
14589d7be:     	testq	%rax, %rax
14589d7c1:     	movq	0x24c0(%rbp), %rsi
14589d7c8:     	je	0x14589d7e0 <.text+0x589c7e0>
14589d7ca:     	imulq	$0x38, %rax, %rdx
14589d7ce:     	movl	$0x8, %r8d
14589d7d4:     	movq	0x24d0(%rbp), %rcx
14589d7db:     	callq	0x1400021d0 <.text+0x11d0>
14589d7e0:     	movb	$0x31, %dil
14589d7e3:     	jmp	0x14589e79a <.text+0x589d79a>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589e6ec:     	movq	0x24d0(%rbp), %rax
14589e6f3:     	addq	%rax, %rdi
14589e6f6:     	jmp	0x14589e701 <.text+0x589d701>
14589e6f8:     	addq	$0x38, %rax
14589e6fc:     	cmpq	%rdi, %rax
14589e6ff:     	je	0x14589e757 <.text+0x589d757>
14589e701:     	cmpq	%r15, 0x10(%rax)
14589e705:     	jne	0x14589e6f8 <.text+0x589d6f8>
14589e707:     	movq	0x8(%rax), %rcx
14589e70b:     	xorl	%edx, %edx
14589e70d:     	cmpq	%rdx, %r15
14589e710:     	je	0x14589d7aa <.text+0x589c7aa>
14589e716:     	movzbl	(%rcx,%rdx), %r8d
14589e71b:     	leal	-0x41(%r8), %r9d
14589e71f:     	cmpb	$0x1a, %r9b
14589e723:     	setb	%r9b
14589e727:     	shlb	$0x5, %r9b
14589e72b:     	orb	%r8b, %r9b
14589e72e:     	movq	0x24f8(%rbp), %r8
14589e735:     	movzbl	(%r8,%rdx), %r8d
14589e73a:     	leal	-0x41(%r8), %r10d
14589e73e:     	cmpb	$0x1a, %r10b
14589e742:     	setb	%r10b
14589e746:     	shlb	$0x5, %r10b
14589e74a:     	orb	%r8b, %r10b
14589e74d:     	incq	%rdx
14589e750:     	cmpb	%r10b, %r9b
14589e753:     	je	0x14589e70d <.text+0x589d70d>
14589e755:     	jmp	0x14589e6f8 <.text+0x589d6f8>
14589e757:     	leaq	0x1690(%rbp), %rcx
14589e75e:     	callq	0x1459ab340 <.text+0x59aa340>
14589e763:     	nop
14589e764:     	movq	0x1690(%rbp), %rax
14589e76b:     	testq	%rax, %rax
14589e76e:     	movq	0x24c0(%rbp), %rsi
14589e775:     	je	0x14589e78d <.text+0x589d78d>
14589e777:     	imulq	$0x38, %rax, %rdx
14589e77b:     	movl	$0x8, %r8d
14589e781:     	movq	0x24d0(%rbp), %rcx
14589e788:     	callq	0x1400021d0 <.text+0x11d0>
14589e78d:     	movb	$0x34, %dil
14589e790:     	cmpq	$0x9, 0xae0(%rsi)
14589e798:     	jbe	0x14589e7c1 <.text+0x589d7c1>
14589e79a:     	movq	0x24b8(%rbp), %rdx
14589e7a1:     	testq	%rdx, %rdx
14589e7a4:     	je	0x14589ee2f <.text+0x589de2f>
14589e7aa:     	movl	$0x1, %r8d
14589e7b0:     	movq	0x24f8(%rbp), %rcx
14589e7b7:     	callq	0x1400021d0 <.text+0x11d0>
14589e7bc:     	jmp	0x14589ee2f <.text+0x589de2f>
14589e7c1:     	leaq	0xad0(%rsi), %rcx
14589e7c8:     	movb	$0x1, 0x2505(%rbp)
14589e7cf:     	movq	%rcx, %r12
14589e7d2:     	callq	0x145890550 <.text+0x588f550>
14589e7d7:     	nop
14589e7d8:     	movq	%rax, %rdi
14589e7db:     	movsd	0x1(%rbx,%r14), %xmm6
14589e7e2:     	movq	%rsi, %rax
14589e7e5:     	movq	0xae0(%rsi), %rsi
14589e7ec:     	cmpq	0xad0(%rax), %rsi
14589e7f3:     	movq	%r12, %rbx
14589e7f6:     	jne	0x14589e801 <.text+0x589d801>
14589e7f8:     	movq	%rbx, %rcx
14589e7fb:     	callq	0x145bcb4c0 <.text+0x5bca4c0>
14589e800:     	nop
14589e801:     	movq	0x24c0(%rbp), %r12
14589e808:     	movq	0xad8(%r12), %rax
14589e810:     	imulq	$0x38, %rsi, %rcx
14589e814:     	movq	0x24b8(%rbp), %rdx
14589e81b:     	movq	%rdx, (%rax,%rcx)
14589e81f:     	movq	0x24f8(%rbp), %rdx
14589e826:     	movq	%rdx, 0x8(%rax,%rcx)
14589e82b:     	movq	%r15, 0x10(%rax,%rcx)
14589e830:     	movq	%rdi, 0x18(%rax,%rcx)
14589e835:     	movss	0x519843(%rip), %xmm0   # 0x145db8080
14589e83d:     	movups	%xmm0, 0x20(%rax,%rcx)
14589e842:     	movlps	%xmm6, 0x30(%rax,%rcx)
14589e847:     	incq	%rsi
14589e84a:     	movq	%rsi, 0xae0(%r12)
14589e852:     	movq	%r12, %rsi
14589e855:     	movb	$0x0, 0x2505(%rbp)
14589e85c:     	movb	$0x2e, %dil
14589e85f:     	movq	%rbx, %rcx
14589e862:     	callq	0x14588bea0 <.text+0x588aea0>
14589e867:     	nop


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589c0ed:     	leaq	0xad0(%rsi), %rcx
14589c0f4:     	movq	0xae0(%rsi), %r13
14589c0fb:     	testq	%r13, %r13
14589c0fe:     	je	0x14589c147 <.text+0x589b147>
14589c100:     	movzbl	%r9b, %r9d
14589c104:     	movzbl	%dl, %edx
14589c107:     	orl	%eax, %r8d
14589c10a:     	orl	%edx, %r8d
14589c10d:     	orl	%r10d, %r14d
14589c110:     	orl	%r9d, %r14d
14589c113:     	shlq	$0x20, %r14
14589c117:     	orq	%r8, %r14
14589c11a:     	movq	0xad8(%rsi), %rbx
14589c121:     	leaq	-0x1(%r13), %r15
14589c125:     	leaq	0x38(%rbx), %r12
14589c129:     	xorl	%edi, %edi
14589c12b:     	nopl	(%rax,%rax)
14589c130:     	cmpq	%r14, -0x20(%r12)
14589c135:     	je	0x14589eed2 <.text+0x589ded2>
14589c13b:     	incq	%rdi
14589c13e:     	addq	$0x38, %r12
14589c142:     	cmpq	%rdi, %r13
14589c145:     	jne	0x14589c130 <.text+0x589b130>
14589c147:     	callq	0x14588bea0 <.text+0x588aea0>
14589c14c:     	callq	0x140002200 <.text+0x1200>
14589c151:     	movl	$0x20, %ecx
14589c156:     	movl	$0x1, %edx
14589c15b:     	callq	0x1400021c0 <.text+0x11c0>
14589c160:     	testq	%rax, %rax
14589c163:     	je	0x14589f6bc <.text+0x589e6bc>
14589c169:     	movb	$0x39, (%rax)
14589c16c:     	movq	$0x20, 0x1690(%rbp)
14589c177:     	movq	%rax, 0x1698(%rbp)
14589c17e:     	movq	$0x1, 0x16a0(%rbp)
14589c189:     	movw	$0x3c, 0x16a8(%rbp)
14589c192:     	movq	0xac0(%rsi), %rcx
14589c199:     	movq	0xac8(%rsi), %rdx
14589c1a0:     	leaq	0x1690(%rbp), %r9
14589c1a7:     	movq	0x24f0(%rbp), %r8
14589c1ae:     	jmp	0x14589eeab <.text+0x589deab>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589eed2:     	movq	-0x38(%r12), %rdx
14589eed7:     	testq	%rdx, %rdx
14589eeda:     	je	0x14589eef3 <.text+0x589def3>
14589eedc:     	movq	-0x30(%r12), %rcx
14589eee1:     	movl	$0x1, %r8d
14589eee7:     	callq	0x1400021d0 <.text+0x11d0>
14589eeec:     	leaq	0xad0(%rsi), %rcx
14589eef3:     	leaq	0x1(%rdi), %rax
14589eef7:     	cmpq	%r13, %rax
14589eefa:     	jae	0x14589ef65 <.text+0x589df65>
14589eefc:     	subq	%rdi, %r15
14589eeff:     	jmp	0x14589ef3c <.text+0x589df3c>
14589ef01:     	imulq	$0x38, %rdi, %rax
14589ef05:     	movq	0x30(%r12), %rdx
14589ef0a:     	movq	%rdx, 0x30(%rbx,%rax)
14589ef0f:     	movups	(%r12), %xmm0
14589ef14:     	movups	0x10(%r12), %xmm1
14589ef1a:     	movdqu	0x20(%r12), %xmm2
14589ef21:     	movdqu	%xmm2, 0x20(%rbx,%rax)
14589ef27:     	movups	%xmm1, 0x10(%rbx,%rax)
14589ef2c:     	movups	%xmm0, (%rbx,%rax)
14589ef30:     	incq	%rdi
14589ef33:     	addq	$0x38, %r12
14589ef37:     	decq	%r15
14589ef3a:     	je	0x14589ef65 <.text+0x589df65>
14589ef3c:     	cmpq	%r14, 0x18(%r12)
14589ef41:     	jne	0x14589ef01 <.text+0x589df01>
14589ef43:     	movq	(%r12), %rdx
14589ef47:     	testq	%rdx, %rdx
14589ef4a:     	je	0x14589ef33 <.text+0x589df33>
14589ef4c:     	movq	0x8(%r12), %rcx
14589ef51:     	movl	$0x1, %r8d
14589ef57:     	callq	0x1400021d0 <.text+0x11d0>
14589ef5c:     	leaq	0xad0(%rsi), %rcx
14589ef63:     	jmp	0x14589ef33 <.text+0x589df33>
14589ef65:     	movq	%rdi, 0xae0(%rsi)
14589ef6c:     	jmp	0x14589c147 <.text+0x589b147>


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589c733:     	movq	%rsi, 0x24c0(%rbp)
14589c73a:     	movq	0x30(%rbx,%r15), %rax
14589c73f:     	movq	%rax, 0x16b0(%rbp)
14589c746:     	movdqu	0x10(%rbx,%r15), %xmm0
14589c74d:     	movups	0x20(%rbx,%r15), %xmm1
14589c753:     	movaps	%xmm1, 0x16a0(%rbp)
14589c75a:     	movdqa	%xmm0, 0x1690(%rbp)
14589c762:     	movq	%r13, 0x2370(%rbp)
14589c769:     	movdqu	%xmm0, 0x2378(%rbp)
14589c771:     	movups	%xmm1, 0x2388(%rbp)
14589c778:     	movq	%rax, 0x2398(%rbp)
14589c77f:     	movq	%rdx, %r12
14589c782:     	movq	%rdx, 0x2368(%rbp)
14589c789:     	leaq	-0x38(%r14), %rax
14589c78d:     	cmpq	%r15, %rax
14589c790:     	movq	0x24f0(%rbp), %rdi
14589c797:     	je	0x14589c7e3 <.text+0x589b7e3>
14589c799:     	subq	%r15, %r14
14589c79c:     	addq	$-0x38, %r14
14589c7a0:     	leaq	(%rbx,%r15), %rsi
14589c7a4:     	addq	$0x40, %rsi
14589c7a8:     	shrq	$0x3, %r14
14589c7ac:     	movabsq	$0x2492492492492493, %rcx # imm = 0x2492492492492493
14589c7b6:     	movq	%r14, %rax
14589c7b9:     	mulq	%rcx
14589c7bc:     	movq	%rdx, %r14
14589c7bf:     	jmp	0x14589c7ca <.text+0x589b7ca>
14589c7c1:     	addq	$0x38, %rsi
14589c7c5:     	decq	%r14
14589c7c8:     	je	0x14589c7e3 <.text+0x589b7e3>
14589c7ca:     	movq	-0x8(%rsi), %rdx
14589c7ce:     	testq	%rdx, %rdx
14589c7d1:     	je	0x14589c7c1 <.text+0x589b7c1>
14589c7d3:     	movq	(%rsi), %rcx
14589c7d6:     	movl	$0x1, %r8d
14589c7dc:     	callq	0x1400021d0 <.text+0x11d0>
14589c7e1:     	jmp	0x14589c7c1 <.text+0x589b7c1>
14589c7e3:     	movq	0x24c8(%rbp), %rax
14589c7ea:     	testq	%rax, %rax
14589c7ed:     	je	0x14589c801 <.text+0x589b801>
14589c7ef:     	imulq	$0x38, %rax, %rdx
14589c7f3:     	movl	$0x8, %r8d
14589c7f9:     	movq	%rbx, %rcx
14589c7fc:     	callq	0x1400021d0 <.text+0x11d0>
14589c801:     	movq	0x24c0(%rbp), %rsi
14589c808:     	movq	0xac8(%rsi), %rdx
14589c80f:     	cmpq	%rdx, %rdi
14589c812:     	movq	%r12, 0x24d0(%rbp)
14589c819:     	movq	%r13, 0x2488(%rbp)
14589c820:     	jae	0x14589faef <.text+0x589eaef>
14589c826:     	movq	0xac0(%rsi), %rcx
14589c82d:     	imulq	$0xb0, %rdi, %rax
14589c834:     	movb	$0x1, 0xa8(%rcx,%rax)
14589c83c:     	movq	0x2380(%rbp), %r14
14589c843:     	movq	%r14, 0x1050(%rsi)
14589c84a:     	cmpb	$0x0, 0x1111(%rsi)
14589c851:     	je	0x14589cd72 <.text+0x589bd72>
14589c857:     	movq	0xcc0(%rsi), %rcx
14589c85e:     	movq	0xcc8(%rsi), %rdx
14589c865:     	callq	0x1458753b0 <.text+0x58743b0>
14589c86a:     	imulq	$0xf0, %rax, %rax
14589c871:     	leaq	0x130cbd8(%rip), %rdx   # 0x146ba9450
14589c878:     	leaq	(%rax,%rdx), %rcx
14589c87c:     	addq	$0x8, %rcx
14589c880:     	addq	%rdx, %rax
14589c883:     	addq	$0x10, %rax


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589cd72:     	movq	0xac8(%rsi), %rdx
14589cd79:     	cmpq	%rdx, %rdi
14589cd7c:     	jae	0x14589fb64 <.text+0x589eb64>
14589cd82:     	movq	0xac0(%rsi), %rdx
14589cd89:     	leaq	(%rdx,%rax), %rcx
14589cd8d:     	addq	$0x98, %rcx
14589cd94:     	addq	%rdx, %rax
14589cd97:     	addq	$0xa0, %rax
14589cd9d:     	movq	(%rcx), %r15
14589cda0:     	movq	(%rax), %r9
14589cda3:     	cmpq	$0xffffff, %r14         # imm = 0xFFFFFF
14589cdaa:     	movq	%r9, 0x24f8(%rbp)
14589cdb1:     	jne	0x14589cdbf <.text+0x589bdbf>
14589cdb3:     	movzbl	0x2399(%rbp), %ebx
14589cdba:     	jmp	0x14589ce59 <.text+0x589be59>
14589cdbf:     	leaq	0xad0(%rsi), %rcx
14589cdc6:     	movb	0x2399(%rbp), %bl
14589cdcc:     	movl	%ebx, %edx
14589cdce:     	movq	%r15, %r8
14589cdd1:     	callq	0x145884ff0 <.text+0x5883ff0>
14589cdd6:     	nop
14589cdd7:     	testb	%al, %al
14589cdd9:     	jne	0x14589ce59 <.text+0x589be59>
14589cddb:     	movq	0xaf0(%rsi), %rcx
14589cde2:     	movq	0xaf8(%rsi), %rdx
14589cde9:     	shlq	$0x4, %rdx
14589cded:     	xorl	%eax, %eax
14589cdef:     	xorl	%r8d, %r8d
14589cdf2:     	cmpq	%r8, %rdx
14589cdf5:     	je	0x14589ce20 <.text+0x589be20>
14589cdf7:     	leaq	0x10(%r8), %r9
14589cdfb:     	cmpb	%bl, (%rcx,%r8)
14589cdff:     	movq	%r9, %r8
14589ce02:     	jne	0x14589cdf2 <.text+0x589bdf2>
14589ce04:     	movq	-0x8(%rcx,%r9), %rcx
14589ce09:     	cmpq	$0xc, %rcx
14589ce0d:     	movl	$0xc, %eax
14589ce12:     	cmovbq	%rcx, %rax
14589ce16:     	decq	%rax
14589ce19:     	testq	%rcx, %rcx
14589ce1c:     	cmoveq	%rcx, %rax
14589ce20:     	imulq	$0xf0, %rax, %rax
14589ce27:     	leaq	0x130c622(%rip), %rcx   # 0x146ba9450
14589ce2e:     	movq	0x8(%rax,%rcx), %r15
14589ce33:     	movq	0x10(%rax,%rcx), %rax
14589ce38:     	movq	%rax, 0x24f8(%rbp)
14589ce3f:     	movq	%rsi, %rcx
14589ce42:     	movq	%rdi, %rdx
14589ce45:     	callq	0x1458a7720 <.text+0x58a6720>
14589ce4a:     	nop
14589ce4b:     	movq	%rax, 0x10b8(%rsi)
14589ce52:     	movq	%rdx, 0x10c0(%rsi)


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145ba4c30:     	testq	%rdx, %rdx
145ba4c33:     	je	0x145ba4c45 <.text+0x5ba3c45>
145ba4c35:     	cmpq	$0x4, %rdx
145ba4c39:     	jae	0x145ba4c48 <.text+0x5ba3c48>
145ba4c3b:     	xorl	%r8d, %r8d
145ba4c3e:     	xorl	%eax, %eax
145ba4c40:     	jmp	0x145ba4cd6 <.text+0x5ba3cd6>
145ba4c45:     	xorl	%eax, %eax
145ba4c47:     	retq
145ba4c48:     	movabsq	$0x7ffffffffffffffc, %r8 # imm = 0x7FFFFFFFFFFFFFFC
145ba4c52:     	andq	%rdx, %r8
145ba4c55:     	pxor	%xmm0, %xmm0
145ba4c59:     	xorl	%eax, %eax
145ba4c5b:     	movdqa	0x16452ad(%rip), %xmm1  # 0x1471e9f10
145ba4c63:     	movdqa	0x1c86a5(%rip), %xmm3   # 0x145d6d310
145ba4c6b:     	pxor	%xmm2, %xmm2
145ba4c6f:     	nop
145ba4c70:     	movzwl	(%rcx,%rax), %r9d
145ba4c75:     	movd	%r9d, %xmm4
145ba4c7a:     	movzwl	0x2(%rcx,%rax), %r9d
145ba4c80:     	movd	%r9d, %xmm5
145ba4c85:     	pcmpgtb	%xmm1, %xmm4
145ba4c89:     	punpcklbw	%xmm4, %xmm4    # xmm4 = xmm4[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
145ba4c8d:     	pshuflw	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3,4,5,6,7]
145ba4c92:     	pshufd	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3]
145ba4c97:     	pand	%xmm3, %xmm4
145ba4c9b:     	paddq	%xmm4, %xmm2
145ba4c9f:     	pcmpgtb	%xmm1, %xmm5
145ba4ca3:     	punpcklbw	%xmm5, %xmm5    # xmm5 = xmm5[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
145ba4ca7:     	pshuflw	$0xd4, %xmm5, %xmm4     # xmm4 = xmm5[0,1,1,3,4,5,6,7]
145ba4cac:     	pshufd	$0xd4, %xmm4, %xmm4     # xmm4 = xmm4[0,1,1,3]
145ba4cb1:     	pand	%xmm3, %xmm4
145ba4cb5:     	paddq	%xmm4, %xmm0
145ba4cb9:     	addq	$0x4, %rax
145ba4cbd:     	cmpq	%rax, %r8
145ba4cc0:     	jne	0x145ba4c70 <.text+0x5ba3c70>
145ba4cc2:     	paddq	%xmm2, %xmm0
145ba4cc6:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
145ba4ccb:     	paddq	%xmm0, %xmm1
145ba4ccf:     	movq	%xmm1, %rax
145ba4cd4:     	jmp	0x145ba4ce8 <.text+0x5ba3ce8>
145ba4cd6:     	xorl	%r9d, %r9d
145ba4cd9:     	cmpb	$-0x40, (%rcx,%r8)
145ba4cde:     	setge	%r9b
145ba4ce2:     	addq	%r9, %rax
145ba4ce5:     	incq	%r8
145ba4ce8:     	cmpq	%r8, %rdx
145ba4ceb:     	jne	0x145ba4cd6 <.text+0x5ba3cd6>
145ba4ced:     	retq


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458a4730:     	pushq	%rbp
1458a4731:     	pushq	%rsi
1458a4732:     	pushq	%rdi
1458a4733:     	subq	$0x70, %rsp
1458a4737:     	leaq	0x70(%rsp), %rbp
1458a473c:     	movq	$-0x2, -0x8(%rbp)
1458a4744:     	movq	%rdx, %rsi
1458a4747:     	cmpb	$0x0, 0x1111(%rdx)
1458a474e:     	je	0x1458a4812 <.text+0x58a3812>
1458a4754:     	movq	%rcx, %rdi
1458a4757:     	callq	0x140002200 <.text+0x1200>
1458a475c:     	movl	$0x38, %ecx
1458a4761:     	movl	$0x8, %edx
1458a4766:     	callq	0x1400021c0 <.text+0x11c0>
1458a476b:     	testq	%rax, %rax
1458a476e:     	je	0x1458a485f <.text+0x58a385f>
1458a4774:     	movq	%rax, -0x10(%rbp)
1458a4778:     	leaq	0xca0(%rsi), %rdx
1458a477f:     	leaq	-0x48(%rbp), %rcx
1458a4783:     	callq	0x145b9c990 <.text+0x5b9b990>
1458a4788:     	nop
1458a4789:     	movzbl	0xcd8(%rsi), %eax
1458a4790:     	movzbl	0xcd9(%rsi), %ecx
1458a4797:     	movzbl	0xcda(%rsi), %edx
1458a479e:     	movzbl	0xcdf(%rsi), %r8d
1458a47a6:     	movb	%r8b, -0x11(%rbp)
1458a47aa:     	movl	0xcdb(%rsi), %r8d
1458a47b1:     	movl	%r8d, -0x15(%rbp)
1458a47b5:     	movq	$0xfffffe, -0x30(%rbp)  # imm = 0xFFFFFE
1458a47bd:     	movb	%cl, -0x18(%rbp)
1458a47c0:     	movb	%al, -0x17(%rbp)
1458a47c3:     	movb	%dl, -0x16(%rbp)
1458a47c6:     	movss	0x5138b2(%rip), %xmm0   # 0x145db8080
1458a47ce:     	movups	%xmm0, -0x28(%rbp)
1458a47d2:     	movups	-0x48(%rbp), %xmm0
1458a47d6:     	movq	-0x10(%rbp), %rcx
1458a47da:     	movups	%xmm0, (%rcx)
1458a47dd:     	movq	-0x38(%rbp), %rax
1458a47e1:     	movq	%rax, 0x10(%rcx)
1458a47e5:     	movq	-0x30(%rbp), %rax
1458a47e9:     	movq	%rax, 0x18(%rcx)
1458a47ed:     	movups	-0x28(%rbp), %xmm0
1458a47f1:     	movups	%xmm0, 0x20(%rcx)
1458a47f5:     	movq	-0x18(%rbp), %rax
1458a47f9:     	movq	%rax, 0x30(%rcx)
1458a47fd:     	movq	$0x1, (%rdi)
1458a4804:     	movq	%rcx, 0x8(%rdi)
1458a4808:     	movq	$0x1, 0x10(%rdi)
1458a4810:     	jmp	0x1458a4857 <.text+0x58a3857>
1458a4812:     	leaq	0xe90(%rsi), %rax
1458a4819:     	xorl	%edx, %edx
1458a481b:     	cmpq	$-0x1, 0xe90(%rsi)
1458a4823:     	cmovneq	%rax, %rdx
1458a4827:     	movq	0xad8(%rsi), %rax
1458a482e:     	imulq	$0x38, 0xae0(%rsi), %r8
1458a4836:     	addq	%rax, %r8
1458a4839:     	movq	$0x1, -0x48(%rbp)
1458a4841:     	movq	%rdx, -0x40(%rbp)
1458a4845:     	movq	%rax, -0x38(%rbp)
1458a4849:     	movq	%r8, -0x30(%rbp)
1458a484d:     	leaq	-0x48(%rbp), %rdx
1458a4851:     	callq	0x1459a8ac0 <.text+0x59a7ac0>
1458a4856:     	nop
1458a4857:     	addq	$0x70, %rsp
1458a485b:     	popq	%rdi
1458a485c:     	popq	%rsi
1458a485d:     	popq	%rbp
1458a485e:     	retq
1458a485f:     	movl	$0x8, %ecx
1458a4864:     	movl	$0x38, %edx
1458a4869:     	callq	0x145d69431 <.text+0x5d68431>
1458a486e:     	ud2


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589b3ca:     	movzwl	%r8w, %eax
14589b3ce:     	cmpl	$0x109, %eax            # imm = 0x109
14589b3d3:     	jle	0x14589b41c <.text+0x589a41c>
14589b3d5:     	cmpl	$0x17b, %eax            # imm = 0x17B
14589b3da:     	jg	0x14589b468 <.text+0x589a468>
14589b3e0:     	leal	-0x10a(%rax), %ecx
14589b3e6:     	cmpl	$0x33, %ecx
14589b3e9:     	ja	0x14589b962 <.text+0x589a962>
14589b3ef:     	leaq	0x131c856(%rip), %rdx   # 0x146bb7c4c
14589b3f6:     	movslq	(%rdx,%rcx,4), %rcx
14589b3fa:     	addq	%rdx, %rcx
14589b3fd:     	jmpq	*%rcx
14589b3ff:     	testq	%r12, %r12
14589b402:     	je	0x14589b5a8 <.text+0x589a5a8>
14589b408:     	movzbl	(%rbx), %ecx
14589b40b:     	cmpq	$0x1, %r12
14589b40f:     	jne	0x14589b5ae <.text+0x589a5ae>
14589b415:     	xorl	%edx, %edx
14589b417:     	jmp	0x14589b5b2 <.text+0x589a5b2>
14589b41c:     	leal	-0x36(%rax), %ecx
14589b41f:     	cmpl	$0x2a, %ecx
14589b422:     	ja	0x14589b610 <.text+0x589a610>
14589b428:     	leaq	0x131c771(%rip), %rdx   # 0x146bb7ba0
14589b42f:     	movslq	(%rdx,%rcx,4), %rcx
14589b433:     	addq	%rdx, %rcx
14589b436:     	jmpq	*%rcx


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589cf15:     	movq	0xcd0(%rsi), %rax
14589cf1c:     	movq	%rax, 0x24b8(%rbp)


AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14589d0ae:     	movq	0x24b8(%rbp), %rax
14589d0b5:     	movq	%rax, 0xfe0(%rsi)
