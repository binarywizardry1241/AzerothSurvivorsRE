
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145682320:     	pushq	%rbp
145682321:     	pushq	%r15
145682323:     	pushq	%r14
145682325:     	pushq	%r13
145682327:     	pushq	%r12
145682329:     	pushq	%rsi
14568232a:     	pushq	%rdi
14568232b:     	pushq	%rbx
14568232c:     	subq	$0x358, %rsp            # imm = 0x358
145682333:     	leaq	0x80(%rsp), %rbp
14568233b:     	movdqa	%xmm7, 0x2c0(%rbp)
145682343:     	movdqa	%xmm6, 0x2b0(%rbp)
14568234b:     	movq	$-0x2, 0x2a8(%rbp)
145682356:     	movq	%r9, %rbx
145682359:     	movq	%rdx, %rdi
14568235c:     	movq	%rcx, %r12
14568235f:     	testq	%r9, %r9
145682362:     	je	0x1456823a0 <.text+0x56813a0>
145682364:     	movq	%r8, %r15
145682367:     	callq	0x140002200 <.text+0x1200>
14568236c:     	movl	$0x1, %edx
145682371:     	movq	%rbx, %rcx
145682374:     	callq	0x1400021c0 <.text+0x11c0>
145682379:     	testq	%rax, %rax
14568237c:     	je	0x1456824a3 <.text+0x56814a3>
145682382:     	movq	%rax, %r14
145682385:     	movq	%rax, %rcx
145682388:     	movq	%r15, %rdx
14568238b:     	movq	%rbx, %r8
14568238e:     	callq	0x1457731ed <.text+0x57721ed>
145682393:     	cmpq	$0x8, %rbx
145682397:     	jae	0x1456823ab <.text+0x56813ab>
145682399:     	xorl	%eax, %eax
14568239b:     	jmp	0x1456824b2 <.text+0x56814b2>
1456823a0:     	movl	$0x1, %r14d
1456823a6:     	jmp	0x1456824d1 <.text+0x56814d1>
1456823ab:     	cmpq	$0x20, %rbx
1456823af:     	jae	0x1456823b8 <.text+0x56813b8>
1456823b1:     	xorl	%eax, %eax
1456823b3:     	jmp	0x145682449 <.text+0x5681449>
1456823b8:     	movq	%rbx, %rax
1456823bb:     	andq	$-0x20, %rax
1456823bf:     	xorl	%ecx, %ecx
1456823c1:     	movdqa	0x287a67(%rip), %xmm0   # 0x145909e30
1456823c9:     	movdqa	0x287a6f(%rip), %xmm1   # 0x145909e40
1456823d1:     	movdqa	0x287a77(%rip), %xmm2   # 0x145909e50
1456823d9:     	nopl	(%rax)
1456823e0:     	movdqu	(%r14,%rcx), %xmm3
1456823e6:     	movdqu	0x10(%r14,%rcx), %xmm4
1456823ed:     	movdqa	%xmm3, %xmm5
1456823f1:     	paddb	%xmm0, %xmm5
1456823f5:     	movdqa	%xmm4, %xmm6
1456823f9:     	paddb	%xmm0, %xmm6
1456823fd:     	movdqa	%xmm5, %xmm7
145682401:     	pminub	%xmm1, %xmm7
145682405:     	pcmpeqb	%xmm5, %xmm7
145682409:     	pand	%xmm2, %xmm7
14568240d:     	movdqa	%xmm6, %xmm5
145682411:     	pminub	%xmm1, %xmm5
145682415:     	pcmpeqb	%xmm6, %xmm5
145682419:     	pand	%xmm2, %xmm5
14568241d:     	por	%xmm3, %xmm7
145682421:     	por	%xmm4, %xmm5
145682425:     	movdqu	%xmm7, (%r14,%rcx)
14568242b:     	movdqu	%xmm5, 0x10(%r14,%rcx)
145682432:     	addq	$0x20, %rcx
145682436:     	cmpq	%rcx, %rax
145682439:     	jne	0x1456823e0 <.text+0x56813e0>
14568243b:     	cmpq	%rax, %rbx
14568243e:     	je	0x1456824d1 <.text+0x56814d1>
145682444:     	testb	$0x18, %bl
145682447:     	je	0x1456824b2 <.text+0x56814b2>
145682449:     	movq	%rax, %rcx
14568244c:     	movq	%rbx, %rax
14568244f:     	andq	$-0x8, %rax
145682453:     	movdqa	0x287a05(%rip), %xmm0   # 0x145909e60
14568245b:     	movdqa	0x287a0d(%rip), %xmm1   # 0x145909e70
145682463:     	movdqa	0x287a15(%rip), %xmm2   # 0x145909e80
14568246b:     	nopl	(%rax,%rax)
145682470:     	movq	(%r14,%rcx), %xmm3
145682476:     	movdqa	%xmm3, %xmm4
14568247a:     	paddb	%xmm0, %xmm4
14568247e:     	movdqa	%xmm4, %xmm5
145682482:     	pmaxub	%xmm1, %xmm5
145682486:     	pcmpeqb	%xmm4, %xmm5
14568248a:     	pandn	%xmm2, %xmm5
14568248e:     	por	%xmm3, %xmm5
145682492:     	movq	%xmm5, (%r14,%rcx)
145682498:     	addq	$0x8, %rcx
14568249c:     	cmpq	%rcx, %rax
14568249f:     	jne	0x145682470 <.text+0x5681470>
1456824a1:     	jmp	0x1456824cc <.text+0x56814cc>
1456824a3:     	movl	$0x1, %ecx
1456824a8:     	movq	%rbx, %rdx
1456824ab:     	callq	0x14590379b <.text+0x590279b>
1456824b0:     	ud2
1456824b2:     	movzbl	(%r14,%rax), %ecx
1456824b7:     	leal	-0x41(%rcx), %edx
1456824ba:     	cmpb	$0x1a, %dl
1456824bd:     	setb	%dl
1456824c0:     	shlb	$0x5, %dl
1456824c3:     	orb	%cl, %dl
1456824c5:     	movb	%dl, (%r14,%rax)
1456824c9:     	incq	%rax
1456824cc:     	cmpq	%rax, %rbx
1456824cf:     	jne	0x1456824b2 <.text+0x56814b2>
1456824d1:     	movq	%rbx, 0x260(%rbp)
1456824d8:     	movq	%r14, 0x268(%rbp)
1456824df:     	movq	%rbx, 0x270(%rbp)
1456824e6:     	leaq	0x288(%rbp), %rcx
1456824ed:     	movq	%rdi, %rdx
1456824f0:     	movq	%r14, %r8
1456824f3:     	movq	%rbx, %r9
1456824f6:     	callq	0x145688fb0 <.text+0x5687fb0>
1456824fb:     	nop
1456824fc:     	movq	0x288(%rbp), %rax
145682503:     	movq	0x290(%rbp), %rsi
14568250a:     	cmpq	$-0x1, %rax
14568250e:     	je	0x1456825c8 <.text+0x56815c8>
145682514:     	movq	%rax, 0x280(%rbp)
14568251b:     	movq	0x298(%rbp), %rax
145682522:     	movq	%rsi, 0x240(%rbp)
145682529:     	movq	%rsi, 0x288(%rbp)
145682530:     	movq	%rax, 0x290(%rbp)
145682537:     	movq	$0x0, 0x298(%rbp)
145682542:     	leaq	-0x50(%rbp), %rcx
145682546:     	leaq	0x288(%rbp), %rdx
14568254d:     	callq	0x1456da030 <.text+0x56d9030>
145682552:     	nop
145682553:     	movq	-0x50(%rbp), %rbx
145682557:     	movq	-0x48(%rbp), %rsi
14568255b:     	cmpq	$-0x2, %rbx
14568255f:     	jne	0x14568265b <.text+0x568165b>
145682565:     	movq	-0x40(%rbp), %rax
145682569:     	movq	%rsi, 0x248(%rbp)
145682570:     	movq	%rax, 0x250(%rbp)
145682577:     	leaq	0x260(%rbp), %rax
14568257e:     	movq	%rax, 0x200(%rbp)
145682585:     	leaq	-0x56804ac(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
14568258c:     	movq	%rax, 0x208(%rbp)
145682593:     	leaq	0x248(%rbp), %rax
14568259a:     	movq	%rax, 0x210(%rbp)
1456825a1:     	leaq	0x592b8(%rip), %rax     # 0x1456db860 <.text+0x56da860>
1456825a8:     	movq	%rax, 0x218(%rbp)
1456825af:     	leaq	0x16cf8a7(%rip), %rcx   # 0x146d51e5d
1456825b6:     	leaq	0x200(%rbp), %rdx
1456825bd:     	callq	0x145900810 <.text+0x58ff810>
1456825c2:     	nop
1456825c3:     	jmp	0x1456826bc <.text+0x56816bc>
1456825c8:     	movq	%rsi, 0x248(%rbp)
1456825cf:     	leaq	0x260(%rbp), %rax
1456825d6:     	movq	%rax, -0x50(%rbp)
1456825da:     	leaq	-0x5680501(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1456825e1:     	movq	%rax, -0x48(%rbp)
1456825e5:     	movb	$0x1, 0x2a7(%rbp)
1456825ec:     	leaq	0x16ca281(%rip), %rdx   # 0x146d4c874
1456825f3:     	leaq	0x200(%rbp), %rcx
1456825fa:     	leaq	-0x50(%rbp), %r8
1456825fe:     	callq	0x145728390 <.text+0x5727390>
145682603:     	nop
145682604:     	movq	0x210(%rbp), %rax
14568260b:     	movq	%rax, 0xe0(%rbp)
145682612:     	movdqu	0x200(%rbp), %xmm0
14568261a:     	movdqa	%xmm0, 0xd0(%rbp)
145682622:     	movq	%rsi, 0xe8(%rbp)
145682629:     	movq	$-0x1, -0x50(%rbp)
145682631:     	movb	$0x0, 0x2a7(%rbp)
145682638:     	leaq	0xd0(%rbp), %rcx
14568263f:     	leaq	-0x50(%rbp), %rdx
145682643:     	callq	0x1458ffed0 <.text+0x58feed0>
145682648:     	nop
145682649:     	movq	%rax, 0x8(%r12)
14568264e:     	movq	$-0x1, (%r12)
145682656:     	jmp	0x1456826e7 <.text+0x56816e7>
14568265b:     	leaq	-0x40(%rbp), %rdx
14568265f:     	leaq	0xe0(%rbp), %rcx
145682666:     	movl	$0x108, %r8d            # imm = 0x108
14568266c:     	callq	0x1457731ed <.text+0x57721ed>
145682671:     	movq	%rbx, 0xd0(%rbp)
145682678:     	movq	%rsi, 0xd8(%rbp)
14568267f:     	cmpq	$-0x1, %rbx
145682683:     	je	0x14568272a <.text+0x568172a>
145682689:     	leaq	0xd0(%rbp), %rcx
145682690:     	callq	0x1455e6a60 <.text+0x55e5a60>
145682695:     	leaq	0x260(%rbp), %rax
14568269c:     	movq	%rax, -0x50(%rbp)
1456826a0:     	leaq	-0x56805c7(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1456826a7:     	movq	%rax, -0x48(%rbp)
1456826ab:     	leaq	0x16cfcdd(%rip), %rcx   # 0x146d5238f
1456826b2:     	leaq	-0x50(%rbp), %rdx
1456826b6:     	callq	0x145900810 <.text+0x58ff810>
1456826bb:     	nop
1456826bc:     	movq	%rax, 0x8(%r12)
1456826c1:     	movq	$-0x1, (%r12)
1456826c9:     	movq	0x280(%rbp), %rdx
1456826d0:     	testq	%rdx, %rdx
1456826d3:     	movq	0x240(%rbp), %rcx
1456826da:     	je	0x1456826e7 <.text+0x56816e7>
1456826dc:     	movl	$0x1, %r8d
1456826e2:     	callq	0x1400021d0 <.text+0x11d0>
1456826e7:     	movq	0x260(%rbp), %rdx
1456826ee:     	testq	%rdx, %rdx
1456826f1:     	je	0x145682705 <.text+0x5681705>
1456826f3:     	movq	0x268(%rbp), %rcx
1456826fa:     	movl	$0x1, %r8d
145682700:     	callq	0x1400021d0 <.text+0x11d0>
145682705:     	movq	%r12, %rax
145682708:     	movaps	0x2b0(%rbp), %xmm6
14568270f:     	movaps	0x2c0(%rbp), %xmm7
145682716:     	addq	$0x358, %rsp            # imm = 0x358
14568271d:     	popq	%rbx
14568271e:     	popq	%rdi
14568271f:     	popq	%rsi
145682720:     	popq	%r12
145682722:     	popq	%r13
145682724:     	popq	%r14
145682726:     	popq	%r15
145682728:     	popq	%rbp
145682729:     	retq
14568272a:     	leaq	0xd8(%rbp), %rax
145682731:     	movq	0x60(%rax), %rcx
145682735:     	movq	%rcx, 0x10(%rbp)
145682739:     	movups	0x50(%rax), %xmm0
14568273d:     	movaps	%xmm0, (%rbp)
145682741:     	movups	0x40(%rax), %xmm0
145682745:     	movaps	%xmm0, -0x10(%rbp)
145682749:     	movdqu	(%rax), %xmm0
14568274d:     	movdqu	0x10(%rax), %xmm1
145682752:     	movdqu	0x20(%rax), %xmm2
145682757:     	movdqu	0x30(%rax), %xmm3
14568275c:     	movdqa	%xmm3, -0x20(%rbp)
145682761:     	movdqa	%xmm2, -0x30(%rbp)
145682766:     	movdqa	%xmm1, -0x40(%rbp)
14568276b:     	movdqa	%xmm0, -0x50(%rbp)
145682770:     	movq	0x268(%rbp), %rax
145682777:     	movq	0x270(%rbp), %rcx
14568277e:     	cmpq	$0x4, %rcx
145682782:     	movq	%r12, 0x1f8(%rbp)
145682789:     	jb	0x1456827ad <.text+0x56817ad>
14568278b:     	movl	-0x4(%rax,%rcx), %edx
14568278f:     	bswapl	%edx
145682791:     	movl	$0x2e776d6f, %r8d       # imm = 0x2E776D6F
145682797:     	cmpl	%edx, %r8d
14568279a:     	seta	%dl
14568279d:     	sbbb	$0x0, %dl
1456827a0:     	movsbl	%dl, %edx
1456827a3:     	leaq	-0x4(%rcx), %r8
1456827a7:     	testl	%edx, %edx
1456827a9:     	cmoveq	%r8, %rcx
1456827ad:     	movq	%rax, 0x1e8(%rbp)
1456827b4:     	movq	%rcx, 0x1f0(%rbp)
1456827bb:     	movq	$0x0, 0x248(%rbp)
1456827c6:     	movq	$0x4, 0x250(%rbp)
1456827d1:     	movq	$0x0, 0x258(%rbp)
1456827dc:     	movq	$0x0, 0x288(%rbp)
1456827e7:     	movq	$0x4, 0x290(%rbp)
1456827f2:     	movq	$0x0, 0x298(%rbp)
1456827fd:     	movl	0x10(%rbp), %r14d
145682801:     	leaq	0xb7c48(%rip), %rbx     # 0x14573a450 <.text+0x5739450>
145682808:     	leaq	0x16cfb70(%rip), %r15   # 0x146d5237f
14568280f:     	leaq	0x200(%rbp), %r12
145682816:     	leaq	0xd0(%rbp), %r13
14568281d:     	xorl	%esi, %esi
14568281f:     	jmp	0x145682832 <.text+0x5681832>
145682821:     	nopw	%cs:(%rax,%rax)
145682830:     	incl	%esi
145682832:     	cmpl	%r14d, %esi
145682835:     	jae	0x145682954 <.text+0x5681954>
14568283b:     	movl	%esi, 0x234(%rbp)
145682841:     	leaq	0x1e8(%rbp), %rax
145682848:     	movq	%rax, 0xd0(%rbp)
14568284f:     	leaq	-0x5680796(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145682856:     	movq	%rax, 0xd8(%rbp)
14568285d:     	leaq	0x234(%rbp), %rax
145682864:     	movq	%rax, 0xe0(%rbp)
14568286b:     	movq	%rbx, 0xe8(%rbp)
145682872:     	movq	%r12, %rcx
145682875:     	movq	%r15, %rdx
145682878:     	movq	%r13, %r8
14568287b:     	callq	0x145728390 <.text+0x5727390>
145682880:     	nop
145682881:     	movq	0x200(%rbp), %rax
145682888:     	movq	%rax, 0x278(%rbp)
14568288f:     	movq	0x208(%rbp), %r8
145682896:     	movq	0x210(%rbp), %r9
14568289d:     	movq	%r13, %rcx
1456828a0:     	movq	%rdi, %rdx
1456828a3:     	movq	%r8, 0x220(%rbp)
1456828aa:     	callq	0x145688fb0 <.text+0x5687fb0>
1456828af:     	nop
1456828b0:     	movq	0xd0(%rbp), %rax
1456828b7:     	cmpq	$-0x1, %rax
1456828bb:     	je	0x145682920 <.text+0x5681920>
1456828bd:     	movq	%rax, 0x238(%rbp)
1456828c4:     	movq	0xd8(%rbp), %rcx
1456828cb:     	movq	0xe0(%rbp), %rdx
1456828d2:     	leaq	0x288(%rbp), %rax
1456828d9:     	movq	%rax, 0x28(%rsp)
1456828de:     	leaq	0x248(%rbp), %rax
1456828e5:     	movq	%rax, 0x20(%rsp)
1456828ea:     	movq	%rcx, 0x228(%rbp)
1456828f1:     	movb	$0x4, %r8b
1456828f4:     	xorl	%r9d, %r9d
1456828f7:     	callq	0x145683190 <.text+0x5682190>
1456828fc:     	nop
1456828fd:     	movq	0x238(%rbp), %rdx
145682904:     	testq	%rdx, %rdx
145682907:     	je	0x14568292d <.text+0x568192d>
145682909:     	movl	$0x1, %r8d
14568290f:     	movq	0x228(%rbp), %rcx
145682916:     	callq	0x1400021d0 <.text+0x11d0>
14568291b:     	jmp	0x14568292d <.text+0x568192d>
14568291d:     	nopl	(%rax)
145682920:     	leaq	0xd8(%rbp), %rcx
145682927:     	callq	0x1456f8fa0 <.text+0x56f7fa0>
14568292c:     	nop
14568292d:     	movq	0x278(%rbp), %rdx
145682934:     	testq	%rdx, %rdx
145682937:     	je	0x145682830 <.text+0x5681830>
14568293d:     	movl	$0x1, %r8d
145682943:     	movq	0x220(%rbp), %rcx
14568294a:     	callq	0x1400021d0 <.text+0x11d0>
14568294f:     	jmp	0x145682830 <.text+0x5681830>
145682954:     	movq	0x258(%rbp), %rax
14568295b:     	movq	%rax, 0xe0(%rbp)
145682962:     	movups	0x248(%rbp), %xmm0
145682969:     	movaps	%xmm0, 0xd0(%rbp)
145682970:     	movq	0x298(%rbp), %rax
145682977:     	movq	%rax, 0xf8(%rbp)
14568297e:     	movups	0x288(%rbp), %xmm1
145682985:     	movups	%xmm1, 0xe8(%rbp)
14568298c:     	movq	0x1f8(%rbp), %r12
145682993:     	movups	%xmm0, (%r12)
145682998:     	movq	0xf0(%rbp), %rax
14568299f:     	movq	%rax, 0x20(%r12)
1456829a4:     	movq	0xf8(%rbp), %rax
1456829ab:     	movq	%rax, 0x28(%r12)
1456829b0:     	movq	0xe0(%rbp), %rax
1456829b7:     	movq	%rax, 0x10(%r12)
1456829bc:     	movq	0xe8(%rbp), %rax
1456829c3:     	movq	%rax, 0x18(%r12)
1456829c8:     	leaq	-0x50(%rbp), %rcx
1456829cc:     	callq	0x14566ed70 <.text+0x566dd70>
1456829d1:     	movq	0x280(%rbp), %rdx
1456829d8:     	testq	%rdx, %rdx
1456829db:     	je	0x1456826e7 <.text+0x56816e7>
1456829e1:     	movl	$0x1, %r8d
1456829e7:     	movq	0x240(%rbp), %rcx
1456829ee:     	jmp	0x1456826e2 <.text+0x56816e2>
