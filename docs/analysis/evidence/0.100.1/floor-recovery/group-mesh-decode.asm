
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145683190:     	pushq	%rbp
145683191:     	pushq	%r15
145683193:     	pushq	%r14
145683195:     	pushq	%r13
145683197:     	pushq	%r12
145683199:     	pushq	%rsi
14568319a:     	pushq	%rdi
14568319b:     	pushq	%rbx
14568319c:     	subq	$0x2f8, %rsp            # imm = 0x2F8
1456831a3:     	leaq	0x80(%rsp), %rbp
1456831ab:     	movaps	%xmm9, 0x260(%rbp)
1456831b3:     	movaps	%xmm8, 0x250(%rbp)
1456831bb:     	movaps	%xmm7, 0x240(%rbp)
1456831c2:     	movdqa	%xmm6, 0x230(%rbp)
1456831ca:     	movq	$-0x2, 0x228(%rbp)
1456831d5:     	movl	%r9d, %edi
1456831d8:     	movb	%r8b, 0x226(%rbp)
1456831df:     	movq	%rcx, 0x1e0(%rbp)
1456831e6:     	movq	%rdx, 0x1e8(%rbp)
1456831ed:     	movq	$0x0, 0x1f0(%rbp)
1456831f8:     	leaq	0xc0(%rbp), %rcx
1456831ff:     	leaq	0x1e0(%rbp), %rdx
145683206:     	callq	0x1456da030 <.text+0x56d9030>
14568320b:     	movq	0xc0(%rbp), %rax
145683212:     	cmpq	$-0x2, %rax
145683216:     	jb	0x145683233 <.text+0x5682233>
145683218:     	cmpq	$-0x1, %rax
14568321c:     	jne	0x145683ac4 <.text+0x5682ac4>
145683222:     	leaq	0xc8(%rbp), %rcx
145683229:     	callq	0x14566ed70 <.text+0x566dd70>
14568322e:     	jmp	0x145683ac4 <.text+0x5682ac4>
145683233:     	leaq	-0x58(%rbp), %rcx
145683237:     	leaq	0xc0(%rbp), %rdx
14568323e:     	movl	$0x118, %r8d            # imm = 0x118
145683244:     	callq	0x1457731ed <.text+0x57721ed>
145683249:     	movq	0x18(%rbp), %rax
14568324d:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
145683257:     	movq	%rax, 0x218(%rbp)
14568325e:     	mulq	%rcx
145683261:     	movq	%rdx, %r14
145683264:     	callq	0x1456ff6a0 <.text+0x56fe6a0>
145683269:     	nop
14568326a:     	movq	%rax, %r15
14568326d:     	cmpb	$0x1, 0x10(%rax)
145683271:     	jne	0x145683af6 <.text+0x5682af6>
145683277:     	movq	(%r15), %rax
14568327a:     	movq	0x8(%r15), %rdx
14568327e:     	leaq	0x1(%rax), %rcx
145683282:     	movq	%rcx, (%r15)
145683285:     	movups	0x16ceb74(%rip), %xmm0  # 0x146d51e00
14568328c:     	movaps	%xmm0, 0xd0(%rbp)
145683293:     	movdqu	0x16ceb55(%rip), %xmm0  # 0x146d51df0
14568329b:     	movdqa	%xmm0, 0xc0(%rbp)
1456832a3:     	movq	%rax, 0xe0(%rbp)
1456832aa:     	movq	%rdx, 0xe8(%rbp)
1456832b1:     	cmpq	$0x3, 0x218(%rbp)
1456832b9:     	jb	0x145683abb <.text+0x5682abb>
1456832bf:     	shrq	%r14
1456832c2:     	movq	0x48(%rbp), %rcx
1456832c6:     	movq	0x40(%rbp), %rax
1456832ca:     	movq	%rax, 0x1d8(%rbp)
1456832d1:     	movq	0x10(%rbp), %rax
1456832d5:     	movq	%rax, 0x1f8(%rbp)
1456832dc:     	movq	-0x50(%rbp), %rax
1456832e0:     	movq	%rax, 0x208(%rbp)
1456832e7:     	movq	-0x48(%rbp), %rax
1456832eb:     	movq	%rax, 0x200(%rbp)
1456832f2:     	xorl	%r15d, %r15d
1456832f5:     	xorb	%dil, 0x226(%rbp)
1456832fc:     	pcmpeqd	%xmm6, %xmm6
145683300:     	movaps	0x283e89(%rip), %xmm7   # 0x145907190
145683307:     	movb	%dil, 0x227(%rbp)
14568330e:     	movq	%rcx, 0x210(%rbp)
145683315:     	jmp	0x14568334c <.text+0x568234c>
145683317:     	movq	0x2e8(%rbp), %rcx
14568331e:     	movq	0x8(%rcx), %rax
145683322:     	movl	%edi, (%rax,%rsi,4)
145683325:     	incq	%rsi
145683328:     	movq	%rsi, 0x10(%rcx)
14568332c:     	movzbl	0x227(%rbp), %edi
145683333:     	movq	0x210(%rbp), %rcx
14568333a:     	nopw	(%rax,%rax)
145683340:     	incq	%r15
145683343:     	cmpq	%r14, %r15
145683346:     	je	0x145683a85 <.text+0x5682a85>
14568334c:     	cmpq	%rcx, %r15
14568334f:     	jae	0x145683340 <.text+0x5682340>
145683351:     	movq	0x1d8(%rbp), %rax
145683358:     	movzbl	(%rax,%r15,2), %eax
14568335d:     	andb	0x226(%rbp), %al
145683363:     	xorb	%dil, %al
145683366:     	jne	0x145683340 <.text+0x5682340>
145683368:     	leaq	(%r15,%r15,2), %rbx
14568336c:     	cmpq	0x218(%rbp), %rbx
145683373:     	jae	0x145683575 <.text+0x5682575>
145683379:     	movq	0x1f8(%rbp), %rax
145683380:     	movzwl	(%rax,%rbx,2), %esi
145683384:     	movzwl	%si, %eax
145683387:     	cmpq	%rax, 0x200(%rbp)
14568338e:     	jbe	0x145683575 <.text+0x5682575>
145683394:     	leaq	(%rax,%rax,2), %rax
145683398:     	movq	0x208(%rbp), %rcx
14568339f:     	leaq	(%rcx,%rax,4), %r12
1456833a3:     	movw	%si, 0x1e0(%rbp)
1456833aa:     	leaq	0xe0(%rbp), %rcx
1456833b1:     	leaq	0x1e0(%rbp), %rdx
1456833b8:     	callq	0x140bcced0 <.text+0xbcbed0>
1456833bd:     	movq	%rax, %r13
1456833c0:     	movq	%rax, %rdi
1456833c3:     	shrq	$0x39, %rdi
1456833c7:     	movq	0xc0(%rbp), %rax
1456833ce:     	movq	0xc8(%rbp), %rcx
1456833d5:     	movd	%edi, %xmm0
1456833d9:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1456833dd:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1456833e2:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
1456833e7:     	xorl	%edx, %edx
1456833e9:     	movq	%r13, %r8
1456833ec:     	andq	%rcx, %r8
1456833ef:     	movdqu	(%rax,%r8), %xmm1
1456833f5:     	movdqa	%xmm1, %xmm2
1456833f9:     	pcmpeqb	%xmm0, %xmm2
1456833fd:     	pmovmskb	%xmm2, %r9d
145683402:     	testl	%r9d, %r9d
145683405:     	je	0x145683434 <.text+0x5682434>
145683407:     	tzcntl	%r9d, %r11d
14568340c:     	addq	%r8, %r11
14568340f:     	andq	%rcx, %r11
145683412:     	shlq	$0x3, %r11
145683416:     	movq	%rax, %r10
145683419:     	subq	%r11, %r10
14568341c:     	cmpw	%si, -0x8(%r10)
145683421:     	je	0x145683531 <.text+0x5682531>
145683427:     	leal	-0x1(%r9), %r10d
14568342b:     	andw	%r9w, %r10w
14568342f:     	movl	%r10d, %r9d
145683432:     	jne	0x145683407 <.text+0x5682407>
145683434:     	pcmpeqb	%xmm6, %xmm1
145683438:     	pmovmskb	%xmm1, %r9d
14568343d:     	testl	%r9d, %r9d
145683440:     	jne	0x14568344f <.text+0x568244f>
145683442:     	addq	%rdx, %r8
145683445:     	addq	$0x10, %r8
145683449:     	addq	$0x10, %rdx
14568344d:     	jmp	0x1456833ec <.text+0x56823ec>
14568344f:     	cmpq	$0x0, 0xd0(%rbp)
145683457:     	je	0x1456839e0 <.text+0x56829e0>
14568345d:     	movsd	(%r12), %xmm8
145683463:     	movss	0x8(%r12), %xmm9
14568346a:     	movq	0x2e0(%rbp), %rax
145683471:     	movq	0x10(%rax), %r12
145683475:     	cmpq	(%rax), %r12
145683478:     	jne	0x145683487 <.text+0x5682487>
14568347a:     	movq	0x2e0(%rbp), %rcx
145683481:     	callq	0x145780030 <.text+0x577f030>
145683486:     	nop
145683487:     	movq	0x2e0(%rbp), %rdx
14568348e:     	movq	0x8(%rdx), %rax
145683492:     	leaq	(%r12,%r12,2), %rcx
145683496:     	movlps	%xmm8, (%rax,%rcx,4)
14568349b:     	movss	%xmm9, 0x8(%rax,%rcx,4)
1456834a2:     	incq	%r12
1456834a5:     	movq	%r12, 0x10(%rdx)
1456834a9:     	movq	0xc0(%rbp), %rax
1456834b0:     	movq	0xc8(%rbp), %rcx
1456834b7:     	andq	%rcx, %r13
1456834ba:     	movdqu	(%rax,%r13), %xmm0
1456834c0:     	pmovmskb	%xmm0, %edx
1456834c4:     	testl	%edx, %edx
1456834c6:     	je	0x145683974 <.text+0x5682974>
1456834cc:     	tzcntl	%edx, %edx
1456834d0:     	addq	%r13, %rdx
1456834d3:     	andq	%rcx, %rdx
1456834d6:     	movzbl	(%rax,%rdx), %r8d
1456834db:     	testb	%r8b, %r8b
1456834de:     	jns	0x145683a43 <.text+0x5682a43>
1456834e4:     	decl	%r12d
1456834e7:     	leaq	-0x10(%rdx), %r9
1456834eb:     	andq	%rcx, %r9
1456834ee:     	movb	%dil, (%rax,%rdx)
1456834f2:     	movb	%dil, 0x10(%rax,%r9)
1456834f7:     	shlq	$0x3, %rdx
1456834fb:     	movq	%rax, %r10
1456834fe:     	subq	%rdx, %r10
145683501:     	andb	$0x1, %r8b
145683505:     	negq	%rdx
145683508:     	movw	%si, -0x8(%rax,%rdx)
14568350d:     	movl	%r12d, -0x4(%r10)
145683511:     	movdqa	0xd0(%rbp), %xmm0
145683519:     	movzbl	%r8b, %eax
14568351d:     	movd	%eax, %xmm1
145683521:     	shufps	$0xe4, %xmm7, %xmm1     # xmm1 = xmm1[0,1],xmm7[2,3]
145683525:     	psubq	%xmm1, %xmm0
145683529:     	movdqa	%xmm0, 0xd0(%rbp)
145683531:     	movl	-0x4(%r10), %edi
145683535:     	movq	0x2e8(%rbp), %rax
14568353c:     	movq	0x10(%rax), %rsi
145683540:     	cmpq	(%rax), %rsi
145683543:     	jne	0x145683552 <.text+0x5682552>
145683545:     	movq	0x2e8(%rbp), %rcx
14568354c:     	callq	0x145777a50 <.text+0x5776a50>
145683551:     	nop
145683552:     	movq	0x2e8(%rbp), %rcx
145683559:     	movq	0x8(%rcx), %rax
14568355d:     	movl	%edi, (%rax,%rsi,4)
145683560:     	incq	%rsi
145683563:     	movq	%rsi, 0x10(%rcx)
145683567:     	movzbl	0x227(%rbp), %edi
14568356e:     	movq	0x210(%rbp), %rcx
145683575:     	leaq	0x1(%rbx), %rax
145683579:     	cmpq	0x218(%rbp), %rax
145683580:     	jae	0x145683783 <.text+0x5682783>
145683586:     	movq	0x1f8(%rbp), %rax
14568358d:     	movzwl	0x2(%rax,%rbx,2), %esi
145683592:     	movzwl	%si, %eax
145683595:     	cmpq	%rax, 0x200(%rbp)
14568359c:     	jbe	0x145683783 <.text+0x5682783>
1456835a2:     	leaq	(%rax,%rax,2), %rax
1456835a6:     	movq	0x208(%rbp), %rcx
1456835ad:     	leaq	(%rcx,%rax,4), %r12
1456835b1:     	movw	%si, 0x1e0(%rbp)
1456835b8:     	leaq	0xe0(%rbp), %rcx
1456835bf:     	leaq	0x1e0(%rbp), %rdx
1456835c6:     	callq	0x140bcced0 <.text+0xbcbed0>
1456835cb:     	movq	%rax, %r13
1456835ce:     	movq	%rax, %rdi
1456835d1:     	shrq	$0x39, %rdi
1456835d5:     	movq	0xc0(%rbp), %rax
1456835dc:     	movq	0xc8(%rbp), %rcx
1456835e3:     	movd	%edi, %xmm0
1456835e7:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1456835eb:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1456835f0:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
1456835f5:     	xorl	%edx, %edx
1456835f7:     	movq	%r13, %r8
1456835fa:     	andq	%rcx, %r8
1456835fd:     	movdqu	(%rax,%r8), %xmm1
145683603:     	movdqa	%xmm1, %xmm2
145683607:     	pcmpeqb	%xmm0, %xmm2
14568360b:     	pmovmskb	%xmm2, %r9d
145683610:     	testl	%r9d, %r9d
145683613:     	je	0x145683642 <.text+0x5682642>
145683615:     	tzcntl	%r9d, %r11d
14568361a:     	addq	%r8, %r11
14568361d:     	andq	%rcx, %r11
145683620:     	shlq	$0x3, %r11
145683624:     	movq	%rax, %r10
145683627:     	subq	%r11, %r10
14568362a:     	cmpw	%si, -0x8(%r10)
14568362f:     	je	0x14568373f <.text+0x568273f>
145683635:     	leal	-0x1(%r9), %r10d
145683639:     	andw	%r9w, %r10w
14568363d:     	movl	%r10d, %r9d
145683640:     	jne	0x145683615 <.text+0x5682615>
145683642:     	pcmpeqb	%xmm6, %xmm1
145683646:     	pmovmskb	%xmm1, %r9d
14568364b:     	testl	%r9d, %r9d
14568364e:     	jne	0x14568365d <.text+0x568265d>
145683650:     	addq	%rdx, %r8
145683653:     	addq	$0x10, %r8
145683657:     	addq	$0x10, %rdx
14568365b:     	jmp	0x1456835fa <.text+0x56825fa>
14568365d:     	cmpq	$0x0, 0xd0(%rbp)
145683665:     	je	0x145683a01 <.text+0x5682a01>
14568366b:     	movsd	(%r12), %xmm8
145683671:     	movss	0x8(%r12), %xmm9
145683678:     	movq	0x2e0(%rbp), %rax
14568367f:     	movq	0x10(%rax), %r12
145683683:     	cmpq	(%rax), %r12
145683686:     	jne	0x145683695 <.text+0x5682695>
145683688:     	movq	0x2e0(%rbp), %rcx
14568368f:     	callq	0x145780030 <.text+0x577f030>
145683694:     	nop
145683695:     	movq	0x2e0(%rbp), %rdx
14568369c:     	movq	0x8(%rdx), %rax
1456836a0:     	leaq	(%r12,%r12,2), %rcx
1456836a4:     	movlps	%xmm8, (%rax,%rcx,4)
1456836a9:     	movss	%xmm9, 0x8(%rax,%rcx,4)
1456836b0:     	incq	%r12
1456836b3:     	movq	%r12, 0x10(%rdx)
1456836b7:     	movq	0xc0(%rbp), %rax
1456836be:     	movq	0xc8(%rbp), %rcx
1456836c5:     	andq	%rcx, %r13
1456836c8:     	movdqu	(%rax,%r13), %xmm0
1456836ce:     	pmovmskb	%xmm0, %edx
1456836d2:     	testl	%edx, %edx
1456836d4:     	je	0x145683998 <.text+0x5682998>
1456836da:     	tzcntl	%edx, %edx
1456836de:     	addq	%r13, %rdx
1456836e1:     	andq	%rcx, %rdx
1456836e4:     	movzbl	(%rax,%rdx), %r8d
1456836e9:     	testb	%r8b, %r8b
1456836ec:     	jns	0x145683a59 <.text+0x5682a59>
1456836f2:     	decl	%r12d
1456836f5:     	leaq	-0x10(%rdx), %r9
1456836f9:     	andq	%rcx, %r9
1456836fc:     	movb	%dil, (%rax,%rdx)
145683700:     	movb	%dil, 0x10(%rax,%r9)
145683705:     	shlq	$0x3, %rdx
145683709:     	movq	%rax, %r10
14568370c:     	subq	%rdx, %r10
14568370f:     	andb	$0x1, %r8b
145683713:     	negq	%rdx
145683716:     	movw	%si, -0x8(%rax,%rdx)
14568371b:     	movl	%r12d, -0x4(%r10)
14568371f:     	movdqa	0xd0(%rbp), %xmm0
145683727:     	movzbl	%r8b, %eax
14568372b:     	movd	%eax, %xmm1
14568372f:     	shufps	$0xe4, %xmm7, %xmm1     # xmm1 = xmm1[0,1],xmm7[2,3]
145683733:     	psubq	%xmm1, %xmm0
145683737:     	movdqa	%xmm0, 0xd0(%rbp)
14568373f:     	movl	-0x4(%r10), %edi
145683743:     	movq	0x2e8(%rbp), %rax
14568374a:     	movq	0x10(%rax), %rsi
14568374e:     	cmpq	(%rax), %rsi
145683751:     	jne	0x145683760 <.text+0x5682760>
145683753:     	movq	0x2e8(%rbp), %rcx
14568375a:     	callq	0x145777a50 <.text+0x5776a50>
14568375f:     	nop
145683760:     	movq	0x2e8(%rbp), %rcx
145683767:     	movq	0x8(%rcx), %rax
14568376b:     	movl	%edi, (%rax,%rsi,4)
14568376e:     	incq	%rsi
145683771:     	movq	%rsi, 0x10(%rcx)
145683775:     	movzbl	0x227(%rbp), %edi
14568377c:     	movq	0x210(%rbp), %rcx
145683783:     	leaq	0x2(%rbx), %rax
145683787:     	cmpq	0x218(%rbp), %rax
14568378e:     	jae	0x145683340 <.text+0x5682340>
145683794:     	movq	0x1f8(%rbp), %rax
14568379b:     	movzwl	0x4(%rax,%rbx,2), %esi
1456837a0:     	movzwl	%si, %eax
1456837a3:     	cmpq	%rax, 0x200(%rbp)
1456837aa:     	jbe	0x145683340 <.text+0x5682340>
1456837b0:     	leaq	(%rax,%rax,2), %rax
1456837b4:     	movq	0x208(%rbp), %rcx
1456837bb:     	leaq	(%rcx,%rax,4), %rbx
1456837bf:     	movw	%si, 0x1e0(%rbp)
1456837c6:     	leaq	0xe0(%rbp), %rcx
1456837cd:     	leaq	0x1e0(%rbp), %rdx
1456837d4:     	callq	0x140bcced0 <.text+0xbcbed0>
1456837d9:     	movq	%rax, %r13
1456837dc:     	movq	%rax, %rdi
1456837df:     	shrq	$0x39, %rdi
1456837e3:     	movq	0xc0(%rbp), %rax
1456837ea:     	movq	0xc8(%rbp), %rcx
1456837f1:     	movd	%edi, %xmm0
1456837f5:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1456837f9:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1456837fe:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
145683803:     	xorl	%edx, %edx
145683805:     	movq	%r13, %r8
145683808:     	andq	%rcx, %r8
14568380b:     	movdqu	(%rax,%r8), %xmm1
145683811:     	movdqa	%xmm1, %xmm2
145683815:     	pcmpeqb	%xmm0, %xmm2
145683819:     	pmovmskb	%xmm2, %r9d
14568381e:     	testl	%r9d, %r9d
145683821:     	je	0x145683850 <.text+0x5682850>
145683823:     	tzcntl	%r9d, %r11d
145683828:     	addq	%r8, %r11
14568382b:     	andq	%rcx, %r11
14568382e:     	shlq	$0x3, %r11
145683832:     	movq	%rax, %r10
145683835:     	subq	%r11, %r10
145683838:     	cmpw	%si, -0x8(%r10)
14568383d:     	je	0x14568394a <.text+0x568294a>
145683843:     	leal	-0x1(%r9), %r10d
145683847:     	andw	%r9w, %r10w
14568384b:     	movl	%r10d, %r9d
14568384e:     	jne	0x145683823 <.text+0x5682823>
145683850:     	pcmpeqb	%xmm6, %xmm1
145683854:     	pmovmskb	%xmm1, %r9d
145683859:     	testl	%r9d, %r9d
14568385c:     	jne	0x14568386b <.text+0x568286b>
14568385e:     	addq	%rdx, %r8
145683861:     	addq	$0x10, %r8
145683865:     	addq	$0x10, %rdx
145683869:     	jmp	0x145683808 <.text+0x5682808>
14568386b:     	cmpq	$0x0, 0xd0(%rbp)
145683873:     	je	0x145683a22 <.text+0x5682a22>
145683879:     	movsd	(%rbx), %xmm8
14568387e:     	movss	0x8(%rbx), %xmm9
145683884:     	movq	0x2e0(%rbp), %rax
14568388b:     	movq	0x10(%rax), %rbx
14568388f:     	cmpq	(%rax), %rbx
145683892:     	jne	0x1456838a1 <.text+0x56828a1>
145683894:     	movq	0x2e0(%rbp), %rcx
14568389b:     	callq	0x145780030 <.text+0x577f030>
1456838a0:     	nop
1456838a1:     	movq	0x2e0(%rbp), %rdx
1456838a8:     	movq	0x8(%rdx), %rax
1456838ac:     	leaq	(%rbx,%rbx,2), %rcx
1456838b0:     	movlps	%xmm8, (%rax,%rcx,4)
1456838b5:     	movss	%xmm9, 0x8(%rax,%rcx,4)
1456838bc:     	incq	%rbx
1456838bf:     	movq	%rbx, 0x10(%rdx)
1456838c3:     	movq	0xc0(%rbp), %rax
1456838ca:     	movq	0xc8(%rbp), %rcx
1456838d1:     	andq	%rcx, %r13
1456838d4:     	movdqu	(%rax,%r13), %xmm0
1456838da:     	pmovmskb	%xmm0, %edx
1456838de:     	testl	%edx, %edx
1456838e0:     	je	0x1456839bc <.text+0x56829bc>
1456838e6:     	tzcntl	%edx, %edx
1456838ea:     	addq	%r13, %rdx
1456838ed:     	andq	%rcx, %rdx
1456838f0:     	movzbl	(%rax,%rdx), %r8d
1456838f5:     	testb	%r8b, %r8b
1456838f8:     	jns	0x145683a6f <.text+0x5682a6f>
1456838fe:     	decl	%ebx
145683900:     	leaq	-0x10(%rdx), %r9
145683904:     	andq	%rcx, %r9
145683907:     	movb	%dil, (%rax,%rdx)
14568390b:     	movb	%dil, 0x10(%rax,%r9)
145683910:     	shlq	$0x3, %rdx
145683914:     	movq	%rax, %r10
145683917:     	subq	%rdx, %r10
14568391a:     	andb	$0x1, %r8b
14568391e:     	negq	%rdx
145683921:     	movw	%si, -0x8(%rax,%rdx)
145683926:     	movl	%ebx, -0x4(%r10)
14568392a:     	movdqa	0xd0(%rbp), %xmm0
145683932:     	movzbl	%r8b, %eax
145683936:     	movd	%eax, %xmm1
14568393a:     	shufps	$0xe4, %xmm7, %xmm1     # xmm1 = xmm1[0,1],xmm7[2,3]
14568393e:     	psubq	%xmm1, %xmm0
145683942:     	movdqa	%xmm0, 0xd0(%rbp)
14568394a:     	movl	-0x4(%r10), %edi
14568394e:     	movq	0x2e8(%rbp), %rax
145683955:     	movq	0x10(%rax), %rsi
145683959:     	cmpq	(%rax), %rsi
14568395c:     	jne	0x145683317 <.text+0x5682317>
145683962:     	movq	0x2e8(%rbp), %rcx
145683969:     	callq	0x145777a50 <.text+0x5776a50>
14568396e:     	nop
14568396f:     	jmp	0x145683317 <.text+0x5682317>
145683974:     	movl	$0x10, %r8d
14568397a:     	addq	%r8, %r13
14568397d:     	andq	%rcx, %r13
145683980:     	movdqu	(%rax,%r13), %xmm0
145683986:     	pmovmskb	%xmm0, %edx
14568398a:     	addq	$0x10, %r8
14568398e:     	testl	%edx, %edx
145683990:     	jne	0x1456834cc <.text+0x56824cc>
145683996:     	jmp	0x14568397a <.text+0x568297a>
145683998:     	movl	$0x10, %r8d
14568399e:     	addq	%r8, %r13
1456839a1:     	andq	%rcx, %r13
1456839a4:     	movdqu	(%rax,%r13), %xmm0
1456839aa:     	pmovmskb	%xmm0, %edx
1456839ae:     	addq	$0x10, %r8
1456839b2:     	testl	%edx, %edx
1456839b4:     	jne	0x1456836da <.text+0x56826da>
1456839ba:     	jmp	0x14568399e <.text+0x568299e>
1456839bc:     	movl	$0x10, %r8d
1456839c2:     	addq	%r8, %r13
1456839c5:     	andq	%rcx, %r13
1456839c8:     	movdqu	(%rax,%r13), %xmm0
1456839ce:     	pmovmskb	%xmm0, %edx
1456839d2:     	addq	$0x10, %r8
1456839d6:     	testl	%edx, %edx
1456839d8:     	jne	0x1456838e6 <.text+0x56828e6>
1456839de:     	jmp	0x1456839c2 <.text+0x56829c2>
1456839e0:     	movl	$0x1, %edx
1456839e5:     	leaq	0xc0(%rbp), %rcx
1456839ec:     	leaq	0xe0(%rbp), %r8
1456839f3:     	movb	$0x1, %r9b
1456839f6:     	callq	0x1458ff4e0 <.text+0x58fe4e0>
1456839fb:     	nop
1456839fc:     	jmp	0x14568345d <.text+0x568245d>
145683a01:     	movl	$0x1, %edx
145683a06:     	leaq	0xc0(%rbp), %rcx
145683a0d:     	leaq	0xe0(%rbp), %r8
145683a14:     	movb	$0x1, %r9b
145683a17:     	callq	0x1458ff4e0 <.text+0x58fe4e0>
145683a1c:     	nop
145683a1d:     	jmp	0x14568366b <.text+0x568266b>
145683a22:     	movl	$0x1, %edx
145683a27:     	leaq	0xc0(%rbp), %rcx
145683a2e:     	leaq	0xe0(%rbp), %r8
145683a35:     	movb	$0x1, %r9b
145683a38:     	callq	0x1458ff4e0 <.text+0x58fe4e0>
145683a3d:     	nop
145683a3e:     	jmp	0x145683879 <.text+0x5682879>
145683a43:     	movdqa	(%rax), %xmm0
145683a47:     	pmovmskb	%xmm0, %edx
145683a4b:     	tzcntl	%edx, %edx
145683a4f:     	movzbl	(%rax,%rdx), %r8d
145683a54:     	jmp	0x1456834e4 <.text+0x56824e4>
145683a59:     	movdqa	(%rax), %xmm0
145683a5d:     	pmovmskb	%xmm0, %edx
145683a61:     	tzcntl	%edx, %edx
145683a65:     	movzbl	(%rax,%rdx), %r8d
145683a6a:     	jmp	0x1456836f2 <.text+0x56826f2>
145683a6f:     	movdqa	(%rax), %xmm0
145683a73:     	pmovmskb	%xmm0, %edx
145683a77:     	tzcntl	%edx, %edx
145683a7b:     	movzbl	(%rax,%rdx), %r8d
145683a80:     	jmp	0x1456838fe <.text+0x56828fe>
145683a85:     	movq	0xc8(%rbp), %rdx
145683a8c:     	testq	%rdx, %rdx
145683a8f:     	je	0x145683abb <.text+0x5682abb>
145683a91:     	leaq	0x17(,%rdx,8), %rax
145683a99:     	andq	$-0x10, %rax
145683a9d:     	addq	%rax, %rdx
145683aa0:     	addq	$0x11, %rdx
145683aa4:     	je	0x145683abb <.text+0x5682abb>
145683aa6:     	movq	0xc0(%rbp), %rcx
145683aad:     	subq	%rax, %rcx
145683ab0:     	movl	$0x10, %r8d
145683ab6:     	callq	0x1400021d0 <.text+0x11d0>
145683abb:     	leaq	-0x58(%rbp), %rcx
145683abf:     	callq	0x1455e6a60 <.text+0x55e5a60>
145683ac4:     	movaps	0x230(%rbp), %xmm6
145683acb:     	movaps	0x240(%rbp), %xmm7
145683ad2:     	movaps	0x250(%rbp), %xmm8
145683ada:     	movaps	0x260(%rbp), %xmm9
145683ae2:     	addq	$0x2f8, %rsp            # imm = 0x2F8
145683ae9:     	popq	%rbx
145683aea:     	popq	%rdi
145683aeb:     	popq	%rsi
145683aec:     	popq	%r12
145683aee:     	popq	%r13
145683af0:     	popq	%r14
145683af2:     	popq	%r15
145683af4:     	popq	%rbp
145683af5:     	retq
145683af6:     	callq	0x145712ca0 <.text+0x5711ca0>
145683afb:     	nop
145683afc:     	movq	%rax, (%r15)
145683aff:     	movq	%rdx, 0x8(%r15)
145683b03:     	movb	$0x1, 0x10(%r15)
145683b08:     	jmp	0x14568327e <.text+0x568227e>
