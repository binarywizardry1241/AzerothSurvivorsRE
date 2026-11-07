
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455181d0:     	pushq	%rbp
1455181d1:     	pushq	%r15
1455181d3:     	pushq	%r14
1455181d5:     	pushq	%r13
1455181d7:     	pushq	%r12
1455181d9:     	pushq	%rsi
1455181da:     	pushq	%rdi
1455181db:     	pushq	%rbx
1455181dc:     	subq	$0x368, %rsp            # imm = 0x368
1455181e3:     	leaq	0x80(%rsp), %rbp
1455181eb:     	movaps	%xmm15, 0x2d0(%rbp)
1455181f3:     	movaps	%xmm14, 0x2c0(%rbp)
1455181fb:     	movaps	%xmm13, 0x2b0(%rbp)
145518203:     	movaps	%xmm12, 0x2a0(%rbp)
14551820b:     	movaps	%xmm11, 0x290(%rbp)
145518213:     	movaps	%xmm10, 0x280(%rbp)
14551821b:     	movaps	%xmm9, 0x270(%rbp)
145518223:     	movaps	%xmm8, 0x260(%rbp)
14551822b:     	movaps	%xmm7, 0x250(%rbp)
145518232:     	movaps	%xmm6, 0x240(%rbp)
145518239:     	movq	$-0x2, 0x238(%rbp)
145518244:     	movq	%rdx, %rsi
145518247:     	movq	%rcx, 0x1f8(%rbp)
14551824e:     	movq	$0x0, 0x180(%rbp)
145518259:     	cmpq	$0x4, %r8
14551825d:     	movq	%r8, 0x228(%rbp)
145518264:     	jae	0x1455182c3 <.text+0x55172c3>
145518266:     	leaq	0x180(%rbp), %rax
14551826d:     	movq	%rax, 0x128(%rbp)
145518274:     	leaq	0x2230c5(%rip), %rax    # 0x14573b340 <.text+0x573a340>
14551827b:     	movq	%rax, 0x130(%rbp)
145518282:     	leaq	0x14e10bf(%rip), %rdx   # 0x1469f9348
145518289:     	leaq	0x200(%rbp), %rcx
145518290:     	leaq	0x128(%rbp), %r8
145518297:     	callq	0x145728390 <.text+0x5727390>
14551829c:     	movq	0x200(%rbp), %rdx
1455182a3:     	cmpq	$-0x1, %rdx
1455182a7:     	jne	0x145518337 <.text+0x5517337>
1455182ad:     	movl	0x208(%rbp), %eax
1455182b3:     	movq	0x228(%rbp), %r8
1455182ba:     	cmpl	$0x74727565, %eax       # imm = 0x74727565
1455182bf:     	jne	0x1455182ce <.text+0x55172ce>
1455182c1:     	jmp	0x1455182d9 <.text+0x55172d9>
1455182c3:     	movl	(%rsi), %eax
1455182c5:     	bswapl	%eax
1455182c7:     	cmpl	$0x74727565, %eax       # imm = 0x74727565
1455182cc:     	je	0x1455182d9 <.text+0x55172d9>
1455182ce:     	cmpl	$0x10000, %eax          # imm = 0x10000
1455182d3:     	jne	0x145518397 <.text+0x5517397>
1455182d9:     	movl	%eax, 0xb8(%rbp)
1455182df:     	movq	$0x4, 0x180(%rbp)
1455182ea:     	leaq	0x22304f(%rip), %rdi    # 0x14573b340 <.text+0x573a340>
1455182f1:     	cmpq	$0x6, %r8
1455182f5:     	jae	0x14551834a <.text+0x551734a>
1455182f7:     	leaq	0x180(%rbp), %rax
1455182fe:     	movq	%rax, 0x128(%rbp)
145518305:     	movq	%rdi, 0x130(%rbp)
14551830c:     	leaq	0x14e1035(%rip), %rdx   # 0x1469f9348
145518313:     	leaq	0x200(%rbp), %rcx
14551831a:     	leaq	0x128(%rbp), %r8
145518321:     	callq	0x145728390 <.text+0x5727390>
145518326:     	movq	0x200(%rbp), %rdx
14551832d:     	cmpq	$-0x1, %rdx
145518331:     	je	0x1455183d9 <.text+0x55173d9>
145518337:     	movq	0x208(%rbp), %r13
14551833e:     	movq	0x210(%rbp), %rsi
145518345:     	jmp	0x145518705 <.text+0x5517705>
14551834a:     	movzwl	0x4(%rsi), %eax
14551834e:     	rolw	$0x8, %ax
145518352:     	movq	%rsi, 0x1e0(%rbp)
145518359:     	movzwl	%ax, %r12d
14551835d:     	testw	%r12w, %r12w
145518361:     	je	0x1455183fc <.text+0x55173fc>
145518367:     	leal	(,%r12,8), %eax
14551836f:     	leaq	(%rax,%rax,2), %rsi
145518373:     	callq	0x140002200 <.text+0x1200>
145518378:     	movl	$0x8, %edx
14551837d:     	movq	%rsi, %rcx
145518380:     	callq	0x1400021c0 <.text+0x11c0>
145518385:     	testq	%rax, %rax
145518388:     	je	0x145518d2c <.text+0x5517d2c>
14551838e:     	movq	0x228(%rbp), %r8
145518395:     	jmp	0x145518401 <.text+0x5517401>
145518397:     	callq	0x140002200 <.text+0x1200>
14551839c:     	movl	$0x13, %ecx
1455183a1:     	movl	$0x1, %edx
1455183a6:     	callq	0x1400021c0 <.text+0x11c0>
1455183ab:     	testq	%rax, %rax
1455183ae:     	je	0x145518d1b <.text+0x5517d1b>
1455183b4:     	movq	%rax, %r13
1455183b7:     	movdqu	0x14e1113(%rip), %xmm0  # 0x1469f94d2
1455183bf:     	movdqu	%xmm0, (%rax)
1455183c3:     	movl	$0x746e6f66, 0xf(%rax)  # imm = 0x746E6F66
1455183ca:     	movl	$0x13, %esi
1455183cf:     	movl	$0x13, %edx
1455183d4:     	jmp	0x145518705 <.text+0x5517705>
1455183d9:     	movzwl	0x208(%rbp), %eax
1455183e0:     	movq	0x228(%rbp), %r8
1455183e7:     	movq	%rsi, 0x1e0(%rbp)
1455183ee:     	movzwl	%ax, %r12d
1455183f2:     	testw	%r12w, %r12w
1455183f6:     	jne	0x145518367 <.text+0x5517367>
1455183fc:     	movl	$0x8, %eax
145518401:     	movq	%r12, 0x128(%rbp)
145518408:     	movq	%rax, 0x130(%rbp)
14551840f:     	xorl	%r13d, %r13d
145518412:     	xorl	%r14d, %r14d
145518415:     	jmp	0x145518453 <.text+0x5517453>
145518417:     	nopw	(%rax,%rax)
145518420:     	incq	%r14
145518423:     	addq	0x1e0(%rbp), %rsi
14551842a:     	movq	0x130(%rbp), %rax
145518431:     	leaq	(,%r13,2), %rcx
145518439:     	addq	%r13, %rcx
14551843c:     	movl	%ebx, (%rax,%rcx,8)
14551843f:     	movq	%rsi, 0x8(%rax,%rcx,8)
145518444:     	movq	%r15, 0x10(%rax,%rcx,8)
145518449:     	incq	%r13
14551844c:     	movq	0x228(%rbp), %r8
145518453:     	movq	%r13, 0x138(%rbp)
14551845a:     	cmpq	%r12, %r14
14551845d:     	jae	0x145518595 <.text+0x5517595>
145518463:     	movq	%r14, %r13
145518466:     	shlq	$0x4, %r13
14551846a:     	leaq	0x10(%r13), %rax
14551846e:     	cmpq	%r8, %rax
145518471:     	movq	0x1e0(%rbp), %rcx
145518478:     	ja	0x14551860c <.text+0x551760c>
14551847e:     	movl	0xc(%rcx,%r13), %ebx
145518483:     	leaq	0x14(%r13), %rax
145518487:     	movq	%rax, 0x40(%rbp)
14551848b:     	leaq	0x18(%r13), %r15
14551848f:     	cmpq	%r8, %r15
145518492:     	jbe	0x145518500 <.text+0x5517500>
145518494:     	leaq	0x40(%rbp), %rax
145518498:     	movq	%rax, 0x180(%rbp)
14551849f:     	movq	%rdi, 0x188(%rbp)
1455184a6:     	leaq	0x200(%rbp), %rcx
1455184ad:     	leaq	0x14e0e94(%rip), %rdx   # 0x1469f9348
1455184b4:     	leaq	0x180(%rbp), %r8
1455184bb:     	callq	0x145728390 <.text+0x5727390>
1455184c0:     	nop
1455184c1:     	movq	0x200(%rbp), %rdx
1455184c8:     	movl	0x208(%rbp), %esi
1455184ce:     	cmpq	$-0x1, %rdx
1455184d2:     	jne	0x1455186b4 <.text+0x55176b4>
1455184d8:     	movq	0x228(%rbp), %r8
1455184df:     	movq	%r15, 0x40(%rbp)
1455184e3:     	addq	$0x1c, %r13
1455184e7:     	cmpq	%r8, %r13
1455184ea:     	ja	0x145518512 <.text+0x5517512>
1455184ec:     	movq	0x1e0(%rbp), %rax
1455184f3:     	movl	(%rax,%r15), %eax
1455184f7:     	bswapl	%eax
1455184f9:     	jmp	0x14551855d <.text+0x551755d>
1455184fb:     	nopl	(%rax,%rax)
145518500:     	movl	(%rcx,%rax), %esi
145518503:     	bswapl	%esi
145518505:     	movq	%r15, 0x40(%rbp)
145518509:     	addq	$0x1c, %r13
14551850d:     	cmpq	%r8, %r13
145518510:     	jbe	0x1455184ec <.text+0x55174ec>
145518512:     	leaq	0x40(%rbp), %rax
145518516:     	movq	%rax, 0x180(%rbp)
14551851d:     	movq	%rdi, 0x188(%rbp)
145518524:     	leaq	0x200(%rbp), %rcx
14551852b:     	leaq	0x14e0e16(%rip), %rdx   # 0x1469f9348
145518532:     	leaq	0x180(%rbp), %r8
145518539:     	callq	0x145728390 <.text+0x5727390>
14551853e:     	nop
14551853f:     	movq	0x200(%rbp), %rdx
145518546:     	movl	0x208(%rbp), %eax
14551854c:     	cmpq	$-0x1, %rdx
145518550:     	jne	0x1455186c4 <.text+0x55176c4>
145518556:     	movq	0x228(%rbp), %r8
14551855d:     	movl	%esi, %esi
14551855f:     	movl	%eax, %r15d
145518562:     	leaq	(%r15,%rsi), %rax
145518566:     	cmpq	%r8, %rax
145518569:     	ja	0x145518665 <.text+0x5517665>
14551856f:     	movq	0x138(%rbp), %r13
145518576:     	cmpq	0x128(%rbp), %r13
14551857d:     	jne	0x145518420 <.text+0x5517420>
145518583:     	leaq	0x128(%rbp), %rcx
14551858a:     	callq	0x1457745c0 <.text+0x57735c0>
14551858f:     	nop
145518590:     	jmp	0x145518420 <.text+0x5517420>
145518595:     	movq	0x128(%rbp), %rax
14551859c:     	movq	0x130(%rbp), %rdx
1455185a3:     	cmpq	$-0x1, %rax
1455185a7:     	je	0x145518781 <.text+0x5517781>
1455185ad:     	movq	%rax, 0x178(%rbp)
1455185b4:     	leaq	0x14e1960(%rip), %r9    # 0x1469f9f1b
1455185bb:     	leaq	0x200(%rbp), %rcx
1455185c2:     	movq	%rdx, 0x170(%rbp)
1455185c9:     	movq	%r13, %r12
1455185cc:     	movq	%r13, %r8
1455185cf:     	callq	0x14550da00 <.text+0x550ca00>
1455185d4:     	nop
1455185d5:     	movq	0x200(%rbp), %rax
1455185dc:     	movq	0x208(%rbp), %r15
1455185e3:     	movq	0x210(%rbp), %r14
1455185ea:     	cmpq	$-0x1, %rax
1455185ee:     	je	0x14551878c <.text+0x551778c>
1455185f4:     	movq	0x1f8(%rbp), %rcx
1455185fb:     	movq	%rax, 0x8(%rcx)
1455185ff:     	movq	%r15, 0x10(%rcx)
145518603:     	movq	%r14, 0x18(%rcx)
145518607:     	jmp	0x14551881f <.text+0x551781f>
14551860c:     	callq	0x140002200 <.text+0x1200>
145518611:     	movl	$0x15, %esi
145518616:     	movl	$0x15, %ecx
14551861b:     	movl	$0x1, %edx
145518620:     	callq	0x1400021c0 <.text+0x11c0>
145518625:     	testq	%rax, %rax
145518628:     	je	0x145519ff1 <.text+0x5518ff1>
14551862e:     	movq	%rax, %r13
145518631:     	movdqu	0x14e0e84(%rip), %xmm0  # 0x1469f94bd
145518639:     	movdqu	%xmm0, (%rax)
14551863d:     	movabsq	$0x79726f7463657269, %rax # imm = 0x79726F7463657269
145518647:     	movq	%rax, 0xd(%r13)
14551864b:     	movl	$0x15, %edx
145518650:     	movq	0x128(%rbp), %rax
145518657:     	testq	%rax, %rax
14551865a:     	jne	0x1455186e5 <.text+0x55176e5>
145518660:     	jmp	0x145518705 <.text+0x5517705>
145518665:     	callq	0x140002200 <.text+0x1200>
14551866a:     	movl	$0x1d, %esi
14551866f:     	movl	$0x1d, %ecx
145518674:     	movl	$0x1, %edx
145518679:     	callq	0x1400021c0 <.text+0x11c0>
14551867e:     	testq	%rax, %rax
145518681:     	je	0x14551a006 <.text+0x5519006>
145518687:     	movq	%rax, %r13
14551868a:     	movups	0x14e0e1c(%rip), %xmm0  # 0x1469f94ad
145518691:     	movups	%xmm0, 0xd(%rax)
145518695:     	movdqu	0x14e0e03(%rip), %xmm0  # 0x1469f94a0
14551869d:     	movdqu	%xmm0, (%rax)
1455186a1:     	movl	$0x1d, %edx
1455186a6:     	movq	0x128(%rbp), %rax
1455186ad:     	testq	%rax, %rax
1455186b0:     	jne	0x1455186e5 <.text+0x55176e5>
1455186b2:     	jmp	0x145518705 <.text+0x5517705>
1455186b4:     	movl	0x20c(%rbp), %r13d
1455186bb:     	shlq	$0x20, %r13
1455186bf:     	orq	%rsi, %r13
1455186c2:     	jmp	0x1455186d2 <.text+0x55176d2>
1455186c4:     	movl	0x20c(%rbp), %r13d
1455186cb:     	shlq	$0x20, %r13
1455186cf:     	orq	%rax, %r13
1455186d2:     	movq	0x210(%rbp), %rsi
1455186d9:     	movq	0x128(%rbp), %rax
1455186e0:     	testq	%rax, %rax
1455186e3:     	je	0x145518705 <.text+0x5517705>
1455186e5:     	movq	0x130(%rbp), %rcx
1455186ec:     	shlq	$0x3, %rax
1455186f0:     	movq	%rdx, %rdi
1455186f3:     	leaq	(%rax,%rax,2), %rdx
1455186f7:     	movl	$0x8, %r8d
1455186fd:     	callq	0x1400021d0 <.text+0x11d0>
145518702:     	movq	%rdi, %rdx
145518705:     	movq	0x1f8(%rbp), %rax
14551870c:     	movq	%rdx, 0x8(%rax)
145518710:     	movq	%r13, 0x10(%rax)
145518714:     	movq	%rsi, 0x18(%rax)
145518718:     	movq	$0x1, (%rax)
14551871f:     	movaps	0x240(%rbp), %xmm6
145518726:     	movaps	0x250(%rbp), %xmm7
14551872d:     	movaps	0x260(%rbp), %xmm8
145518735:     	movaps	0x270(%rbp), %xmm9
14551873d:     	movaps	0x280(%rbp), %xmm10
145518745:     	movaps	0x290(%rbp), %xmm11
14551874d:     	movaps	0x2a0(%rbp), %xmm12
145518755:     	movaps	0x2b0(%rbp), %xmm13
14551875d:     	movaps	0x2c0(%rbp), %xmm14
145518765:     	movaps	0x2d0(%rbp), %xmm15
14551876d:     	addq	$0x368, %rsp            # imm = 0x368
145518774:     	popq	%rbx
145518775:     	popq	%rdi
145518776:     	popq	%rsi
145518777:     	popq	%r12
145518779:     	popq	%r13
14551877b:     	popq	%r14
14551877d:     	popq	%r15
14551877f:     	popq	%rbp
145518780:     	retq
145518781:     	movl	0xb8(%rbp), %esi
145518787:     	jmp	0x145518705 <.text+0x5517705>
14551878c:     	leaq	0x14e188d(%rip), %r9    # 0x1469fa020
145518793:     	leaq	0x200(%rbp), %rcx
14551879a:     	movq	0x170(%rbp), %rdx
1455187a1:     	movq	%r12, %r8
1455187a4:     	callq	0x14550da00 <.text+0x550ca00>
1455187a9:     	nop
1455187aa:     	movq	0x200(%rbp), %rax
1455187b1:     	movq	0x208(%rbp), %r8
1455187b8:     	movq	0x210(%rbp), %rdx
1455187bf:     	cmpq	$-0x1, %rax
1455187c3:     	jne	0x14551880c <.text+0x551780c>
1455187c5:     	movq	%r8, 0x168(%rbp)
1455187cc:     	movq	%rdx, 0x1c8(%rbp)
1455187d3:     	leaq	0x14e184a(%rip), %r9    # 0x1469fa024
1455187da:     	leaq	0x200(%rbp), %rcx
1455187e1:     	movq	0x170(%rbp), %rdx
1455187e8:     	movq	%r12, %r8
1455187eb:     	callq	0x14550da00 <.text+0x550ca00>
1455187f0:     	nop
1455187f1:     	movq	0x200(%rbp), %rax
1455187f8:     	movq	0x208(%rbp), %r8
1455187ff:     	movq	0x210(%rbp), %rdx
145518806:     	cmpq	$-0x1, %rax
14551880a:     	je	0x145518862 <.text+0x5517862>
14551880c:     	movq	0x1f8(%rbp), %rcx
145518813:     	movq	%rax, 0x8(%rcx)
145518817:     	movq	%r8, 0x10(%rcx)
14551881b:     	movq	%rdx, 0x18(%rcx)
14551881f:     	movq	$0x1, (%rcx)
145518826:     	movq	0x178(%rbp), %rcx
14551882d:     	testq	%rcx, %rcx
145518830:     	movq	0x1f8(%rbp), %rax
145518837:     	je	0x14551871f <.text+0x551771f>
14551883d:     	shlq	$0x3, %rcx
145518841:     	leaq	(%rcx,%rcx,2), %rdx
145518845:     	movl	$0x8, %r8d
14551884b:     	movq	0x170(%rbp), %rcx
145518852:     	movq	%rax, %rsi
145518855:     	callq	0x1400021d0 <.text+0x11d0>
14551885a:     	movq	%rsi, %rax
14551885d:     	jmp	0x14551871f <.text+0x551771f>
145518862:     	movq	%r8, 0x58(%rbp)
145518866:     	movq	%rdx, 0x148(%rbp)
14551886d:     	leaq	0x14e17b4(%rip), %r9    # 0x1469fa028
145518874:     	leaq	0x200(%rbp), %rcx
14551887b:     	movq	0x170(%rbp), %rdx
145518882:     	movq	%r12, %r8
145518885:     	callq	0x14550da00 <.text+0x550ca00>
14551888a:     	nop
14551888b:     	movq	0x200(%rbp), %rax
145518892:     	movq	0x208(%rbp), %rsi
145518899:     	movq	0x210(%rbp), %rdi
1455188a0:     	cmpq	$-0x1, %rax
1455188a4:     	je	0x1455188be <.text+0x55178be>
1455188a6:     	movq	0x1f8(%rbp), %rcx
1455188ad:     	movq	%rax, 0x8(%rcx)
1455188b1:     	movq	%rsi, 0x10(%rcx)
1455188b5:     	movq	%rdi, 0x18(%rcx)
1455188b9:     	jmp	0x14551881f <.text+0x551781f>
1455188be:     	leaq	0x14e1767(%rip), %r9    # 0x1469fa02c
1455188c5:     	leaq	0x200(%rbp), %rcx
1455188cc:     	movq	0x170(%rbp), %rdx
1455188d3:     	movq	%r12, %r8
1455188d6:     	callq	0x14550da00 <.text+0x550ca00>
1455188db:     	nop
1455188dc:     	movq	0x200(%rbp), %rax
1455188e3:     	movq	0x208(%rbp), %r13
1455188ea:     	movq	0x210(%rbp), %rdx
1455188f1:     	cmpq	$-0x1, %rax
1455188f5:     	je	0x14551890b <.text+0x551790b>
1455188f7:     	movq	0x1f8(%rbp), %rcx
1455188fe:     	movq	%rax, 0x8(%rcx)
145518902:     	movq	%r13, 0x10(%rcx)
145518906:     	jmp	0x14551881b <.text+0x551781b>
14551890b:     	movq	%rdx, 0x1f0(%rbp)
145518912:     	leaq	0x14e1717(%rip), %r9    # 0x1469fa030
145518919:     	leaq	0x200(%rbp), %rcx
145518920:     	movq	0x170(%rbp), %rdx
145518927:     	movq	%r12, %r8
14551892a:     	callq	0x14550da00 <.text+0x550ca00>
14551892f:     	nop
145518930:     	movq	0x200(%rbp), %rax
145518937:     	movq	0x208(%rbp), %rbx
14551893e:     	movq	0x210(%rbp), %rdx
145518945:     	cmpq	$-0x1, %rax
145518949:     	je	0x14551895f <.text+0x551795f>
14551894b:     	movq	0x1f8(%rbp), %rcx
145518952:     	movq	%rax, 0x8(%rcx)
145518956:     	movq	%rbx, 0x10(%rcx)
14551895a:     	jmp	0x14551881b <.text+0x551781b>
14551895f:     	movq	%rdx, 0x1d0(%rbp)
145518966:     	leaq	0x200(%rbp), %rcx
14551896d:     	movl	$0x12, %r9d
145518973:     	movq	%r15, %rdx
145518976:     	movq	%r14, %r8
145518979:     	callq	0x145518150 <.text+0x5517150>
14551897e:     	nop
14551897f:     	movq	0x200(%rbp), %rax
145518986:     	movzwl	0x208(%rbp), %r9d
14551898e:     	cmpq	$-0x1, %rax
145518992:     	je	0x1455189c6 <.text+0x55179c6>
145518994:     	movq	0x20a(%rbp), %rcx
14551899b:     	movq	0x210(%rbp), %rdx
1455189a2:     	movq	0x1f8(%rbp), %r8
1455189a9:     	movq	%rdx, 0x18(%r8)
1455189ad:     	movq	%rcx, 0x12(%r8)
1455189b1:     	movq	%rax, 0x8(%r8)
1455189b5:     	movw	%r9w, 0x10(%r8)
1455189ba:     	movq	$0x1, (%r8)
1455189c1:     	jmp	0x145518826 <.text+0x5517826>
1455189c6:     	movw	%r9w, 0x1d8(%rbp)
1455189ce:     	leaq	0x200(%rbp), %rcx
1455189d5:     	movl	$0x32, %r9d
1455189db:     	movq	%r15, %rdx
1455189de:     	movq	%r14, %r8
1455189e1:     	callq	0x145518150 <.text+0x5517150>
1455189e6:     	nop
1455189e7:     	movq	0x200(%rbp), %rcx
1455189ee:     	movzwl	0x208(%rbp), %eax
1455189f5:     	cmpq	$-0x1, %rcx
1455189f9:     	je	0x145518a2d <.text+0x5517a2d>
1455189fb:     	movq	0x20a(%rbp), %rdx
145518a02:     	movq	0x210(%rbp), %r8
145518a09:     	movq	0x1f8(%rbp), %r9
145518a10:     	movq	%r8, 0x18(%r9)
145518a14:     	movq	%rdx, 0x12(%r9)
145518a18:     	movq	%rcx, 0x8(%r9)
145518a1c:     	movw	%ax, 0x10(%r9)
145518a21:     	movq	$0x1, (%r9)
145518a28:     	jmp	0x145518826 <.text+0x5517826>
145518a2d:     	testw	%ax, %ax
145518a30:     	setne	0x1c7(%rbp)
145518a37:     	leaq	0x200(%rbp), %rcx
145518a3e:     	movl	$0x4, %r9d
145518a44:     	movq	0x168(%rbp), %rdx
145518a4b:     	movq	0x1c8(%rbp), %r8
145518a52:     	callq	0x145518150 <.text+0x5517150>
145518a57:     	nop
145518a58:     	movq	0x200(%rbp), %rax
145518a5f:     	movzwl	0x208(%rbp), %ecx
145518a66:     	movw	%cx, 0x1e8(%rbp)
145518a6d:     	cmpq	$-0x1, %rax
145518a71:     	je	0x145518aac <.text+0x5517aac>
145518a73:     	movq	0x20a(%rbp), %rcx
145518a7a:     	movq	0x210(%rbp), %rdx
145518a81:     	movq	0x1f8(%rbp), %r8
145518a88:     	movq	%rdx, 0x18(%r8)
145518a8c:     	movq	%rcx, 0x12(%r8)
145518a90:     	movq	%rax, 0x8(%r8)
145518a94:     	movzwl	0x1e8(%rbp), %eax
145518a9b:     	movw	%ax, 0x10(%r8)
145518aa0:     	movq	$0x1, (%r8)
145518aa7:     	jmp	0x145518826 <.text+0x5517826>
145518aac:     	leaq	0x200(%rbp), %rcx
145518ab3:     	movl	$0x22, %r9d
145518ab9:     	movq	0x58(%rbp), %rdx
145518abd:     	movq	0x148(%rbp), %r8
145518ac4:     	callq	0x145518150 <.text+0x5517150>
145518ac9:     	nop
145518aca:     	movq	0x200(%rbp), %rcx
145518ad1:     	movzwl	0x208(%rbp), %eax
145518ad8:     	cmpq	$-0x1, %rcx
145518adc:     	jne	0x1455189fb <.text+0x55179fb>
145518ae2:     	movzwl	%ax, %eax
145518ae5:     	movq	%rax, 0x8(%rbp)
145518ae9:     	leaq	0x14e1544(%rip), %r9    # 0x1469fa034
145518af0:     	leaq	0x128(%rbp), %rcx
145518af7:     	movq	0x170(%rbp), %rdx
145518afe:     	movq	%r12, %r8
145518b01:     	callq	0x14550da00 <.text+0x550ca00>
145518b06:     	nop
145518b07:     	movq	0x128(%rbp), %rax
145518b0e:     	movq	0x130(%rbp), %rdx
145518b15:     	movq	0x138(%rbp), %r8
145518b1c:     	cmpq	$-0x1, %rax
145518b20:     	je	0x145518b3a <.text+0x5517b3a>
145518b22:     	movq	0x1f8(%rbp), %rcx
145518b29:     	movq	%rax, 0x8(%rcx)
145518b2d:     	movq	%rdx, 0x10(%rcx)
145518b31:     	movq	%r8, 0x18(%rcx)
145518b35:     	jmp	0x14551881f <.text+0x551781f>
145518b3a:     	leaq	0x200(%rbp), %rcx
145518b41:     	callq	0x14551bd80 <.text+0x551ad80>
145518b46:     	nop
145518b47:     	movl	0x200(%rbp), %eax
145518b4d:     	movups	0x208(%rbp), %xmm0
145518b54:     	movaps	%xmm0, 0x180(%rbp)
145518b5b:     	movq	0x218(%rbp), %rcx
145518b62:     	movq	%rcx, 0x190(%rbp)
145518b69:     	cmpl	$0x1, %eax
145518b6c:     	jne	0x145518b92 <.text+0x5517b92>
145518b6e:     	movq	0x190(%rbp), %rax
145518b75:     	movq	0x1f8(%rbp), %rcx
145518b7c:     	movq	%rax, 0x18(%rcx)
145518b80:     	movdqa	0x180(%rbp), %xmm0
145518b88:     	movdqu	%xmm0, 0x8(%rcx)
145518b8d:     	jmp	0x14551881f <.text+0x551781f>
145518b92:     	movzwl	0x1e8(%rbp), %ecx
145518b99:     	movq	0x190(%rbp), %rax
145518ba0:     	movq	%rax, 0xb0(%rbp)
145518ba7:     	movdqa	0x180(%rbp), %xmm0
145518baf:     	movdqa	%xmm0, 0xa0(%rbp)
145518bb7:     	leaq	0x1c7(%rbp), %rax
145518bbe:     	movq	%rax, -0x10(%rbp)
145518bc2:     	movq	%r13, -0x8(%rbp)
145518bc6:     	movq	0x1f0(%rbp), %rax
145518bcd:     	movq	%rax, (%rbp)
145518bd1:     	movq	$0x0, 0x218(%rbp)
145518bdc:     	movq	%rcx, %r13
145518bdf:     	movq	%rcx, 0x220(%rbp)
145518be6:     	leaq	-0x10(%rbp), %rax
145518bea:     	movq	%rax, 0x200(%rbp)
145518bf1:     	movq	%rbx, 0x208(%rbp)
145518bf8:     	movq	0x1d0(%rbp), %rax
145518bff:     	movq	%rax, 0x210(%rbp)
145518c06:     	leaq	0x128(%rbp), %rcx
145518c0d:     	leaq	0x200(%rbp), %rdx
145518c14:     	callq	0x14550d450 <.text+0x550c450>
145518c19:     	nop
145518c1a:     	movl	0x128(%rbp), %eax
145518c20:     	movups	0x130(%rbp), %xmm0
145518c27:     	movaps	%xmm0, 0x180(%rbp)
145518c2e:     	movq	0x140(%rbp), %rcx
145518c35:     	movq	%rcx, 0x190(%rbp)
145518c3c:     	cmpl	$0x1, %eax
145518c3f:     	jne	0x145518c6c <.text+0x5517c6c>
145518c41:     	movq	0x190(%rbp), %rax
145518c48:     	movq	0x1f8(%rbp), %rcx
145518c4f:     	movq	%rax, 0x18(%rcx)
145518c53:     	movdqa	0x180(%rbp), %xmm0
145518c5b:     	movdqu	%xmm0, 0x8(%rcx)
145518c60:     	movq	$0x1, (%rcx)
145518c67:     	jmp	0x14551a457 <.text+0x5519457>
145518c6c:     	movq	0x190(%rbp), %rax
145518c73:     	movq	%rax, 0xd0(%rbp)
145518c7a:     	movdqa	0x180(%rbp), %xmm0
145518c82:     	movdqa	%xmm0, 0xc0(%rbp)
145518c8a:     	movq	$0x0, 0x218(%rbp)
145518c95:     	movq	%r13, 0x220(%rbp)
145518c9c:     	leaq	0x8(%rbp), %rax
145518ca0:     	movq	%rax, 0x200(%rbp)
145518ca7:     	movq	%rsi, 0x208(%rbp)
145518cae:     	movq	%rdi, 0x210(%rbp)
145518cb5:     	leaq	0x128(%rbp), %rcx
145518cbc:     	leaq	0x200(%rbp), %rdx
145518cc3:     	callq	0x14550d350 <.text+0x550c350>
145518cc8:     	nop
145518cc9:     	movl	0x128(%rbp), %eax
145518ccf:     	movups	0x130(%rbp), %xmm0
145518cd6:     	movaps	%xmm0, 0x180(%rbp)
145518cdd:     	movq	0x140(%rbp), %rcx
145518ce4:     	movq	%rcx, 0x190(%rbp)
145518ceb:     	cmpl	$0x1, %eax
145518cee:     	jne	0x145518d3b <.text+0x5517d3b>
145518cf0:     	movq	0x190(%rbp), %rax
145518cf7:     	movq	0x1f8(%rbp), %rcx
145518cfe:     	movq	%rax, 0x18(%rcx)
145518d02:     	movdqa	0x180(%rbp), %xmm0
145518d0a:     	movdqu	%xmm0, 0x8(%rcx)
145518d0f:     	movq	$0x1, (%rcx)
145518d16:     	jmp	0x14551a44a <.text+0x551944a>
145518d1b:     	movl	$0x1, %ecx
145518d20:     	movl	$0x13, %edx
145518d25:     	callq	0x14590379b <.text+0x590279b>
145518d2a:     	ud2
145518d2c:     	movl	$0x8, %ecx
145518d31:     	movq	%rsi, %rdx
145518d34:     	callq	0x14590379b <.text+0x590279b>
145518d39:     	ud2
145518d3b:     	movzwl	0x1d8(%rbp), %eax
145518d42:     	cvtsi2ss	%eax, %xmm8
145518d47:     	movq	0x190(%rbp), %rax
145518d4e:     	movq	%rax, 0x120(%rbp)
145518d55:     	movdqa	0x180(%rbp), %xmm0
145518d5d:     	movdqa	%xmm0, 0x110(%rbp)
145518d65:     	movss	0x4324b2(%rip), %xmm9   # 0x14594b220
145518d6e:     	mulss	%xmm8, %xmm9
145518d73:     	movss	0x14e0034(%rip), %xmm10 # 0x1469f8db0
145518d7c:     	mulss	%xmm8, %xmm10
145518d81:     	movss	0x435886(%rip), %xmm11  # 0x14594e610
145518d8a:     	mulss	%xmm8, %xmm11
145518d8f:     	mulss	0x3fcb08(%rip), %xmm8   # 0x1459158a0
145518d98:     	movq	$0x0, 0x1d8(%rbp)
145518da3:     	movss	0x3ee6ec(%rip), %xmm12  # 0x145907498
145518dac:     	movss	0x52e42b(%rip), %xmm13  # 0x145a471e0
145518db5:     	movss	0x3ff902(%rip), %xmm14  # 0x1459186c0
145518dbe:     	xorl	%edi, %edi
145518dc0:     	cmpq	$0x290, %rdi            # imm = 0x290
145518dc7:     	je	0x14551952a <.text+0x551852a>
145518dcd:     	leaq	0x14e1264(%rip), %rcx   # 0x1469fa038
145518dd4:     	movl	(%rdi,%rcx), %esi
145518dd7:     	movl	0x4(%rdi,%rcx), %eax
145518ddb:     	movl	%eax, 0x1d0(%rbp)
145518de1:     	movl	%eax, 0x180(%rbp)
145518de7:     	movl	0x8(%rdi,%rcx), %eax
145518deb:     	movl	%eax, 0x128(%rbp)
145518df1:     	movzbl	0xc(%rdi,%rcx), %eax
145518df6:     	movb	%al, 0x1f0(%rbp)
145518dfc:     	leaq	0xa0(%rbp), %rcx
145518e03:     	leaq	0x180(%rbp), %rdx
145518e0a:     	callq	0x145502cb0 <.text+0x5501cb0>
145518e0f:     	nop
145518e10:     	addq	$0x10, %rdi
145518e14:     	testq	%rax, %rax
145518e17:     	jne	0x145518dc0 <.text+0x5517dc0>
145518e19:     	movl	%esi, 0x200(%rbp)
145518e1f:     	leaq	0xa0(%rbp), %rcx
145518e26:     	leaq	0x200(%rbp), %rdx
145518e2d:     	callq	0x145502cb0 <.text+0x5501cb0>
145518e32:     	nop
145518e33:     	movq	%rax, %rsi
145518e36:     	leaq	0xa0(%rbp), %rcx
145518e3d:     	leaq	0x128(%rbp), %rdx
145518e44:     	callq	0x145502cb0 <.text+0x5501cb0>
145518e49:     	nop
145518e4a:     	testq	%rsi, %rsi
145518e4d:     	je	0x145518dc0 <.text+0x5517dc0>
145518e53:     	testq	%rax, %rax
145518e56:     	je	0x145518dc0 <.text+0x5517dc0>
145518e5c:     	movzwl	(%rsi), %r9d
145518e60:     	movw	(%rax), %r13w
145518e64:     	movq	0xc8(%rbp), %rdx
145518e6b:     	movq	0xd0(%rbp), %r8
145518e72:     	leaq	0x36(%rbp), %rcx
145518e76:     	movl	%r9d, %esi
145518e79:     	callq	0x14550d8b0 <.text+0x550c8b0>
145518e7e:     	nop
145518e7f:     	movq	0xc8(%rbp), %rdx
145518e86:     	movq	0xd0(%rbp), %r8
145518e8d:     	leaq	0x2c(%rbp), %rcx
145518e91:     	movl	%r13d, %r9d
145518e94:     	callq	0x14550d8b0 <.text+0x550c8b0>
145518e99:     	nop
145518e9a:     	cmpw	$0x1, 0x36(%rbp)
145518e9f:     	jne	0x145518dc0 <.text+0x5517dc0>
145518ea5:     	cmpb	$0x0, 0x2c(%rbp)
145518ea9:     	je	0x145518dc0 <.text+0x5517dc0>
145518eaf:     	movzbl	0x1f0(%rbp), %eax
145518eb6:     	movq	0x38(%rbp), %rcx
145518eba:     	movq	%rcx, %rdx
145518ebd:     	shrq	$0x20, %rdx
145518ec1:     	movq	%rcx, %r8
145518ec4:     	shrq	$0x30, %r8
145518ec8:     	movq	0x2e(%rbp), %rbx
145518ecc:     	movl	%ebx, %r9d
145518ecf:     	shrl	$0x10, %r9d
145518ed3:     	movq	%r9, 0x80(%rbp)
145518eda:     	movq	%rbx, %r9
145518edd:     	shrq	$0x20, %r9
145518ee1:     	movq	%rcx, 0x1e8(%rbp)
145518ee8:     	movswl	%cx, %ecx
145518eeb:     	cvtsi2ss	%ecx, %xmm7
145518eef:     	movq	%rdx, 0x60(%rbp)
145518ef3:     	movswl	%dx, %ecx
145518ef6:     	cvtsi2ss	%ecx, %xmm0
145518efa:     	movq	%r8, 0x10(%rbp)
145518efe:     	movswl	%r8w, %ecx
145518f02:     	cvtsi2ss	%ecx, %xmm1
145518f06:     	movq	%r9, 0x18(%rbp)
145518f0a:     	movswl	%r9w, %ecx
145518f0e:     	cvtsi2ss	%ecx, %xmm6
145518f12:     	movq	%rbx, %rcx
145518f15:     	pxor	%xmm2, %xmm2
145518f19:     	pinsrw	$0x1, %ebx, %xmm2
145518f1e:     	shrq	$0x30, %rcx
145518f22:     	movq	%rcx, 0x20(%rbp)
145518f26:     	pinsrw	$0x3, %ecx, %xmm2
145518f2b:     	psrad	$0x10, %xmm2
145518f30:     	cvtdq2ps	%xmm2, %xmm15
145518f34:     	movl	%eax, %eax
145518f36:     	leaq	0x181b777(%rip), %rcx   # 0x146d346b4
145518f3d:     	movslq	(%rcx,%rax,4), %rax
145518f41:     	addq	%rcx, %rax
145518f44:     	jmpq	*%rax
145518f46:     	movswl	0x80(%rbp), %eax
145518f4d:     	xorps	%xmm2, %xmm2
145518f50:     	cvtsi2ss	%eax, %xmm2
145518f54:     	addss	%xmm0, %xmm7
145518f58:     	mulss	%xmm12, %xmm7
145518f5d:     	movaps	%xmm15, %xmm0
145518f61:     	addss	%xmm6, %xmm0
145518f65:     	mulss	%xmm12, %xmm0
145518f6a:     	unpcklps	%xmm2, %xmm0            # xmm0 = xmm0[0],xmm2[0],xmm0[1],xmm2[1]
145518f6d:     	addss	%xmm8, %xmm1
145518f72:     	unpcklps	%xmm1, %xmm7            # xmm7 = xmm7[0],xmm1[0],xmm7[1],xmm1[1]
145518f75:     	subps	%xmm0, %xmm7
145518f78:     	jmp	0x145518ff1 <.text+0x5517ff1>
145518f7a:     	subss	%xmm6, %xmm0
145518f7e:     	unpcklps	%xmm11, %xmm0           # xmm0 = xmm0[0],xmm11[0],xmm0[1],xmm11[1]
145518f82:     	movaps	%xmm6, %xmm1
145518f85:     	subss	%xmm15, %xmm1
145518f8a:     	mulss	0x3ee5a6(%rip), %xmm1   # 0x145907538
145518f92:     	movaps	%xmm15, %xmm2
145518f96:     	movss	%xmm1, %xmm2            # xmm2 = xmm1[0],xmm2[1,2,3]
145518f9a:     	subps	%xmm2, %xmm0
145518f9d:     	jmp	0x145518fee <.text+0x5517fee>
145518f9f:     	addss	%xmm0, %xmm7
145518fa3:     	mulss	%xmm12, %xmm7
145518fa8:     	movaps	%xmm15, %xmm0
145518fac:     	addss	%xmm6, %xmm0
145518fb0:     	mulss	%xmm12, %xmm0
145518fb5:     	unpcklps	%xmm9, %xmm7            # xmm7 = xmm7[0],xmm9[0],xmm7[1],xmm9[1]
145518fb9:     	jmp	0x145518fd5 <.text+0x5517fd5>
145518fbb:     	addss	%xmm0, %xmm7
145518fbf:     	mulss	%xmm12, %xmm7
145518fc4:     	unpcklps	%xmm10, %xmm7           # xmm7 = xmm7[0],xmm10[0],xmm7[1],xmm10[1]
145518fc8:     	movaps	%xmm15, %xmm0
145518fcc:     	addss	%xmm6, %xmm0
145518fd0:     	mulss	%xmm12, %xmm0
145518fd5:     	movaps	%xmm15, %xmm1
145518fd9:     	movss	%xmm0, %xmm1            # xmm1 = xmm0[0],xmm1[1,2,3]
145518fdd:     	subps	%xmm1, %xmm7
145518fe0:     	jmp	0x145518ff1 <.text+0x5517ff1>
145518fe2:     	addss	%xmm9, %xmm0
145518fe7:     	unpcklps	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
145518fea:     	subps	%xmm15, %xmm0
145518fee:     	movaps	%xmm0, %xmm7
145518ff1:     	movaps	%xmm7, %xmm0
145518ff4:     	callq	0x14577322f <.text+0x577222f>
145518ff9:     	movaps	%xmm13, %xmm1
145518ffd:     	maxss	%xmm0, %xmm1
145519001:     	movaps	%xmm14, %xmm0
145519005:     	minss	%xmm1, %xmm0
145519009:     	cvttss2si	%xmm0, %ecx
14551900d:     	leal	(%rbx,%rcx), %eax
145519010:     	cwtl
145519011:     	sarl	$0xf, %eax
145519014:     	xorl	$0xffff8000, %eax       # imm = 0xFFFF8000
145519019:     	movq	%rcx, 0x1b8(%rbp)
145519020:     	addw	%cx, %bx
145519023:     	movshdup	%xmm7, %xmm0            # xmm0 = xmm7[1,1,3,3]
145519027:     	cmovol	%eax, %ebx
14551902a:     	callq	0x14577322f <.text+0x577222f>
14551902f:     	movaps	%xmm0, %xmm7
145519032:     	movq	0x1e8(%rbp), %rax
145519039:     	cmpw	%ax, %bx
14551903c:     	cmovll	%ebx, %eax
14551903f:     	movl	%eax, 0xbc(%rbp)
145519045:     	callq	0x140002200 <.text+0x1200>
14551904a:     	movl	$0x20, %ecx
14551904f:     	movl	$0x1, %edx
145519054:     	callq	0x1400021c0 <.text+0x11c0>
145519059:     	testq	%rax, %rax
14551905c:     	je	0x14551abe2 <.text+0x5519be2>
145519062:     	movaps	%xmm13, %xmm0
145519066:     	maxss	%xmm7, %xmm0
14551906a:     	movaps	%xmm14, %xmm1
14551906e:     	minss	%xmm0, %xmm1
145519072:     	cvttss2si	%xmm1, %r8d
145519077:     	movq	0x1e8(%rbp), %r9
14551907e:     	shrl	$0x10, %r9d
145519082:     	movq	0x80(%rbp), %r10
145519089:     	leal	(%r10,%r8), %ecx
14551908d:     	movswl	%cx, %ecx
145519090:     	sarl	$0xf, %ecx
145519093:     	xorl	$0xffff8000, %ecx       # imm = 0xFFFF8000
145519099:     	addw	%r8w, %r10w
14551909d:     	cmovol	%ecx, %r10d
1455190a1:     	movq	0x18(%rbp), %r11
1455190a5:     	movq	0x1b8(%rbp), %rdx
1455190ac:     	leal	(%r11,%rdx), %ecx
1455190b0:     	movswl	%cx, %ecx
1455190b3:     	sarl	$0xf, %ecx
1455190b6:     	xorl	$0xffff8000, %ecx       # imm = 0xFFFF8000
1455190bc:     	addw	%dx, %r11w
1455190c0:     	cmovol	%ecx, %r11d
1455190c4:     	movq	0x20(%rbp), %rdx
1455190c8:     	leal	(%rdx,%r8), %ecx
1455190cc:     	movswl	%cx, %ecx
1455190cf:     	sarl	$0xf, %ecx
1455190d2:     	xorl	$0xffff8000, %ecx       # imm = 0xFFFF8000
1455190d8:     	movq	%r8, 0x80(%rbp)
1455190df:     	addw	%r8w, %dx
1455190e3:     	cmovol	%ecx, %edx
1455190e6:     	movq	0x10(%rbp), %r8
1455190ea:     	cmpw	%r8w, %dx
1455190ee:     	cmovgl	%edx, %r8d
1455190f2:     	movq	0x60(%rbp), %rdx
1455190f6:     	cmpw	%dx, %r11w
1455190fa:     	cmovgl	%r11d, %edx
1455190fe:     	cmpw	%r9w, %r10w
145519102:     	cmovll	%r10d, %r9d
145519106:     	movq	$0x4, 0x208(%rbp)
145519111:     	movl	0xbc(%rbp), %ecx
145519117:     	movw	%cx, 0x210(%rbp)
14551911e:     	movw	%r9w, 0x212(%rbp)
145519126:     	movzwl	%si, %ecx
145519129:     	movq	%rcx, 0x1e8(%rbp)
145519130:     	movzwl	%r13w, %ecx
145519134:     	movq	%rcx, 0x60(%rbp)
145519138:     	movq	$0x20, 0x150(%rbp)
145519143:     	movq	%rax, 0x158(%rbp)
14551914a:     	movw	$0xffff, (%rax)         # imm = 0xFFFF
14551914f:     	movq	$0x2, 0x160(%rbp)
14551915a:     	movw	%dx, 0x214(%rbp)
145519161:     	movw	%r8w, 0x216(%rbp)
145519169:     	movl	$0x2, %edx
14551916e:     	xorl	%ecx, %ecx
145519170:     	cmpq	$0x4, %rcx
145519174:     	je	0x1455191f0 <.text+0x55181f0>
145519176:     	leaq	0x1(%rcx), %r13
14551917a:     	movq	%r13, 0x200(%rbp)
145519181:     	movzwl	0x210(%rbp,%rcx,2), %ebx
145519189:     	movq	0x150(%rbp), %rcx
145519190:     	subq	%rdx, %rcx
145519193:     	cmpq	$0x1, %rcx
145519197:     	jbe	0x1455191b7 <.text+0x55181b7>
145519199:     	rolw	$0x8, %bx
14551919d:     	movw	%bx, (%rax,%rdx)
1455191a1:     	addq	$0x2, %rdx
1455191a5:     	movq	%rdx, 0x160(%rbp)
1455191ac:     	movq	%r13, %rcx
1455191af:     	cmpq	$0x4, %rcx
1455191b3:     	jne	0x145519176 <.text+0x5518176>
1455191b5:     	jmp	0x1455191f0 <.text+0x55181f0>
1455191b7:     	movb	$0x1, 0x236(%rbp)
1455191be:     	movq	$0x1, 0x20(%rsp)
1455191c7:     	movl	$0x2, %r8d
1455191cd:     	movl	$0x1, %r9d
1455191d3:     	leaq	0x150(%rbp), %rcx
1455191da:     	callq	0x1457744b0 <.text+0x57734b0>
1455191df:     	nop
1455191e0:     	movq	0x158(%rbp), %rax
1455191e7:     	movq	0x160(%rbp), %rdx
1455191ee:     	jmp	0x145519199 <.text+0x5518199>
1455191f0:     	movzwl	0x80(%rbp), %eax
1455191f7:     	shlq	$0x20, %rax
1455191fb:     	movq	0x1b8(%rbp), %rcx
145519202:     	shll	$0x10, %ecx
145519205:     	orq	%rax, %rcx
145519208:     	addq	0x60(%rbp), %rcx
14551920c:     	movabsq	$0x7000000000000, %rax  # imm = 0x7000000000000
145519216:     	orq	%rax, %rcx
145519219:     	movq	0x14dfb9f(%rip), %xmm0  # 0x1469f8dc0
145519221:     	pinsrw	$0x0, %esi, %xmm0
145519226:     	movq	$0x2, 0x208(%rbp)
145519231:     	movq	%xmm0, 0x210(%rbp)
145519239:     	movq	%rcx, 0x218(%rbp)
145519240:     	xorl	%eax, %eax
145519242:     	cmpq	$0x2, %rax
145519246:     	je	0x14551941a <.text+0x551841a>
14551924c:     	leaq	0x1(%rax), %rsi
145519250:     	movq	%rsi, 0x200(%rbp)
145519257:     	movq	0x210(%rbp,%rax,8), %rbx
14551925f:     	movq	0x150(%rbp), %rax
145519266:     	movq	%rax, %rcx
145519269:     	subq	%rdx, %rcx
14551926c:     	cmpq	$0x1, %rcx
145519270:     	jbe	0x14551932a <.text+0x551832a>
145519276:     	movq	%rbx, %r8
145519279:     	shrq	$0x30, %r8
14551927d:     	rolw	$0x8, %r8w
145519282:     	movq	0x158(%rbp), %rcx
145519289:     	movw	%r8w, (%rcx,%rdx)
14551928e:     	addq	$0x2, %rdx
145519292:     	movq	%rdx, 0x160(%rbp)
145519299:     	movq	%rax, %r8
14551929c:     	subq	%rdx, %r8
14551929f:     	cmpq	$0x1, %r8
1455192a3:     	jbe	0x145519366 <.text+0x5518366>
1455192a9:     	movl	%ebx, %r8d
1455192ac:     	rolw	$0x8, %r8w
1455192b1:     	movw	%r8w, (%rcx,%rdx)
1455192b6:     	addq	$0x2, %rdx
1455192ba:     	movq	%rdx, 0x160(%rbp)
1455192c1:     	subq	%rdx, %rax
1455192c4:     	cmpq	$0x1, %rax
1455192c8:     	jbe	0x1455193a9 <.text+0x55183a9>
1455192ce:     	movl	%ebx, %eax
1455192d0:     	shrl	$0x10, %eax
1455192d3:     	rolw	$0x8, %ax
1455192d7:     	movw	%ax, (%rcx,%rdx)
1455192db:     	addq	$0x2, %rdx
1455192df:     	movq	%rdx, 0x160(%rbp)
1455192e6:     	movq	0x150(%rbp), %rax
1455192ed:     	subq	%rdx, %rax
1455192f0:     	cmpq	$0x1, %rax
1455192f4:     	jbe	0x1455193e5 <.text+0x55183e5>
1455192fa:     	shrq	$0x20, %rbx
1455192fe:     	rolw	$0x8, %bx
145519302:     	movq	0x158(%rbp), %rax
145519309:     	movw	%bx, (%rax,%rdx)
14551930d:     	addq	$0x2, %rdx
145519311:     	movq	%rdx, 0x160(%rbp)
145519318:     	movq	%rsi, %rax
14551931b:     	cmpq	$0x2, %rax
14551931f:     	jne	0x14551924c <.text+0x551824c>
145519325:     	jmp	0x14551941a <.text+0x551841a>
14551932a:     	movb	$0x1, 0x236(%rbp)
145519331:     	movq	$0x1, 0x20(%rsp)
14551933a:     	movl	$0x2, %r8d
145519340:     	movl	$0x1, %r9d
145519346:     	leaq	0x150(%rbp), %rcx
14551934d:     	callq	0x1457744b0 <.text+0x57734b0>
145519352:     	nop
145519353:     	movq	0x150(%rbp), %rax
14551935a:     	movq	0x160(%rbp), %rdx
145519361:     	jmp	0x145519276 <.text+0x5518276>
145519366:     	movb	$0x1, 0x236(%rbp)
14551936d:     	movq	$0x1, 0x20(%rsp)
145519376:     	movl	$0x2, %r8d
14551937c:     	movl	$0x1, %r9d
145519382:     	leaq	0x150(%rbp), %rcx
145519389:     	callq	0x1457744b0 <.text+0x57734b0>
14551938e:     	nop
14551938f:     	movq	0x160(%rbp), %rdx
145519396:     	movq	0x150(%rbp), %rax
14551939d:     	movq	0x158(%rbp), %rcx
1455193a4:     	jmp	0x1455192a9 <.text+0x55182a9>
1455193a9:     	movb	$0x1, 0x236(%rbp)
1455193b0:     	movq	$0x1, 0x20(%rsp)
1455193b9:     	movl	$0x2, %r8d
1455193bf:     	movl	$0x1, %r9d
1455193c5:     	leaq	0x150(%rbp), %rcx
1455193cc:     	callq	0x1457744b0 <.text+0x57734b0>
1455193d1:     	nop
1455193d2:     	movq	0x158(%rbp), %rcx
1455193d9:     	movq	0x160(%rbp), %rdx
1455193e0:     	jmp	0x1455192ce <.text+0x55182ce>
1455193e5:     	movb	$0x1, 0x236(%rbp)
1455193ec:     	movq	$0x1, 0x20(%rsp)
1455193f5:     	movl	$0x2, %r8d
1455193fb:     	movl	$0x1, %r9d
145519401:     	leaq	0x150(%rbp), %rcx
145519408:     	callq	0x1457744b0 <.text+0x57734b0>
14551940d:     	nop
14551940e:     	movq	0x160(%rbp), %rdx
145519415:     	jmp	0x1455192fa <.text+0x55182fa>
14551941a:     	movq	0xd0(%rbp), %rax
145519421:     	movq	%rax, 0x1b8(%rbp)
145519428:     	cmpq	$0xffff, %rax           # imm = 0xFFFF
14551942e:     	ja	0x14551a9fc <.text+0x55199fc>
145519434:     	movb	$0x0, 0x236(%rbp)
14551943b:     	leaq	0xc0(%rbp), %rcx
145519442:     	leaq	0x150(%rbp), %rdx
145519449:     	callq	0x1406442a0 <.text+0x6432a0>
14551944e:     	nop
14551944f:     	movq	0x120(%rbp), %rsi
145519456:     	cmpq	0x1e8(%rbp), %rsi
14551945d:     	jbe	0x14551abf4 <.text+0x5519bf4>
145519463:     	movq	0x118(%rbp), %r13
14551946a:     	movq	0x1e8(%rbp), %rax
145519471:     	movzwl	(%r13,%rax,4), %ebx
145519477:     	cmpb	$0x4, 0x1f0(%rbp)
14551947e:     	jne	0x1455194b4 <.text+0x55184b4>
145519480:     	subss	%xmm15, %xmm6
145519485:     	addss	%xmm9, %xmm6
14551948a:     	movaps	%xmm6, %xmm0
14551948d:     	callq	0x14577322f <.text+0x577222f>
145519492:     	xorps	%xmm1, %xmm1
145519495:     	maxss	%xmm0, %xmm1
145519499:     	movss	0x4fb2bf(%rip), %xmm0   # 0x145a14760
1455194a1:     	minss	%xmm1, %xmm0
1455194a5:     	cvttss2si	%xmm0, %eax
1455194a9:     	addw	%ax, %bx
1455194ac:     	movl	$0xffff, %eax           # imm = 0xFFFF
1455194b1:     	cmovbl	%eax, %ebx
1455194b4:     	cmpq	0x110(%rbp), %rsi
1455194bb:     	jne	0x1455194d8 <.text+0x55184d8>
1455194bd:     	movb	$0x0, 0x236(%rbp)
1455194c4:     	leaq	0x110(%rbp), %rcx
1455194cb:     	callq	0x1457783e0 <.text+0x57773e0>
1455194d0:     	nop
1455194d1:     	movq	0x118(%rbp), %r13
1455194d8:     	movw	%bx, (%r13,%rsi,4)
1455194de:     	movl	0xbc(%rbp), %eax
1455194e4:     	movw	%ax, 0x2(%r13,%rsi,4)
1455194ea:     	incq	%rsi
1455194ed:     	movq	%rsi, 0x120(%rbp)
1455194f4:     	movb	$0x0, 0x236(%rbp)
1455194fb:     	leaq	0xa0(%rbp), %rcx
145519502:     	movl	0x1d0(%rbp), %edx
145519508:     	movq	0x1b8(%rbp), %r8
14551950f:     	callq	0x14550c470 <.text+0x550b470>
145519514:     	nop
145519515:     	movq	0x1d8(%rbp), %rax
14551951c:     	incl	%eax
14551951e:     	movq	%rax, 0x1d8(%rbp)
145519525:     	jmp	0x145518dc0 <.text+0x5517dc0>
14551952a:     	xorl	%edi, %edi
14551952c:     	cmpq	$0x10, %rdi
145519530:     	je	0x145519a16 <.text+0x5518a16>
145519536:     	leaq	0x14e0da3(%rip), %rcx   # 0x1469fa2e0
14551953d:     	movl	(%rdi,%rcx), %eax
145519540:     	movl	0x4(%rdi,%rcx), %ebx
145519544:     	movl	%eax, %esi
145519546:     	movl	%eax, 0x128(%rbp)
14551954c:     	leaq	0xa0(%rbp), %rcx
145519553:     	leaq	0x128(%rbp), %rdx
14551955a:     	callq	0x145502cb0 <.text+0x5501cb0>
14551955f:     	nop
145519560:     	addq	$0x8, %rdi
145519564:     	testq	%rax, %rax
145519567:     	jne	0x14551952c <.text+0x551852c>
145519569:     	movl	%ebx, 0x200(%rbp)
14551956f:     	leaq	0xa0(%rbp), %rcx
145519576:     	leaq	0x200(%rbp), %rdx
14551957d:     	callq	0x145502cb0 <.text+0x5501cb0>
145519582:     	nop
145519583:     	testq	%rax, %rax
145519586:     	je	0x14551952c <.text+0x551852c>
145519588:     	movzwl	(%rax), %r9d
14551958c:     	movq	0xc8(%rbp), %rdx
145519593:     	movq	0xd0(%rbp), %r8
14551959a:     	leaq	0x200(%rbp), %rcx
1455195a1:     	movw	%r9w, 0x1f0(%rbp)
1455195a9:     	callq	0x14550d8b0 <.text+0x550c8b0>
1455195ae:     	nop
1455195af:     	cmpw	$0x1, 0x200(%rbp)
1455195b7:     	jne	0x14551952c <.text+0x551852c>
1455195bd:     	movq	0x202(%rbp), %rcx
1455195c4:     	movq	%rcx, %rdx
1455195c7:     	shrq	$0x20, %rdx
1455195cb:     	leal	(%rcx,%rdx), %eax
1455195ce:     	cwtl
1455195cf:     	sarl	$0xf, %eax
1455195d2:     	xorl	$0xffff8000, %eax       # imm = 0xFFFF8000
1455195d7:     	movq	%rcx, 0x1d0(%rbp)
1455195de:     	addw	%cx, %dx
1455195e1:     	cmovol	%eax, %edx
1455195e4:     	movq	%rdx, 0x1b8(%rbp)
1455195eb:     	callq	0x140002200 <.text+0x1200>
1455195f0:     	movl	$0x18, %ecx
1455195f5:     	movl	$0x1, %edx
1455195fa:     	callq	0x1400021c0 <.text+0x11c0>
1455195ff:     	testq	%rax, %rax
145519602:     	je	0x14551abb0 <.text+0x5519bb0>
145519608:     	movzwl	0x1f0(%rbp), %ecx
14551960f:     	movq	%rcx, 0x1e8(%rbp)
145519616:     	movq	0x1d0(%rbp), %xmm0
14551961e:     	movq	$0x18, 0x1a0(%rbp)
145519629:     	movq	%rax, 0x1a8(%rbp)
145519630:     	movw	$0xffff, (%rax)         # imm = 0xFFFF
145519635:     	movq	$0x2, 0x1b0(%rbp)
145519640:     	movq	$0x4, 0x208(%rbp)
14551964b:     	movq	%xmm0, 0x210(%rbp)
145519653:     	movl	$0x2, %edx
145519658:     	xorl	%ecx, %ecx
14551965a:     	cmpq	$0x4, %rcx
14551965e:     	je	0x1455196dd <.text+0x55186dd>
145519660:     	leaq	0x1(%rcx), %rbx
145519664:     	movq	%rbx, 0x200(%rbp)
14551966b:     	movzwl	0x210(%rbp,%rcx,2), %r13d
145519674:     	movq	0x1a0(%rbp), %rcx
14551967b:     	subq	%rdx, %rcx
14551967e:     	cmpq	$0x1, %rcx
145519682:     	jbe	0x1455196a4 <.text+0x55186a4>
145519684:     	rolw	$0x8, %r13w
145519689:     	movw	%r13w, (%rax,%rdx)
14551968e:     	addq	$0x2, %rdx
145519692:     	movq	%rdx, 0x1b0(%rbp)
145519699:     	movq	%rbx, %rcx
14551969c:     	cmpq	$0x4, %rcx
1455196a0:     	jne	0x145519660 <.text+0x5518660>
1455196a2:     	jmp	0x1455196dd <.text+0x55186dd>
1455196a4:     	movb	$0x1, 0x237(%rbp)
1455196ab:     	movq	$0x1, 0x20(%rsp)
1455196b4:     	movl	$0x2, %r8d
1455196ba:     	movl	$0x1, %r9d
1455196c0:     	leaq	0x1a0(%rbp), %rcx
1455196c7:     	callq	0x1457744b0 <.text+0x57734b0>
1455196cc:     	nop
1455196cd:     	movq	0x1a8(%rbp), %rax
1455196d4:     	movq	0x1b0(%rbp), %rdx
1455196db:     	jmp	0x145519684 <.text+0x5518684>
1455196dd:     	movq	0x1a0(%rbp), %rax
1455196e4:     	movq	%rax, %rcx
1455196e7:     	subq	%rdx, %rcx
1455196ea:     	cmpq	$0x1, %rcx
1455196ee:     	jbe	0x1455198a0 <.text+0x55188a0>
1455196f4:     	movq	0x1a8(%rbp), %rcx
1455196fb:     	movw	$0x4712, (%rcx,%rdx)    # imm = 0x4712
145519701:     	addq	$0x2, %rdx
145519705:     	movq	%rdx, 0x1b0(%rbp)
14551970c:     	movq	%rax, %r8
14551970f:     	subq	%rdx, %r8
145519712:     	cmpq	$0x1, %r8
145519716:     	jbe	0x1455198dc <.text+0x55188dc>
14551971c:     	movzwl	0x1f0(%rbp), %r8d
145519724:     	rolw	$0x8, %r8w
145519729:     	movw	%r8w, (%rcx,%rdx)
14551972e:     	addq	$0x2, %rdx
145519732:     	movq	%rdx, 0x1b0(%rbp)
145519739:     	subq	%rdx, %rax
14551973c:     	cmpq	$0x1, %rax
145519740:     	jbe	0x14551991f <.text+0x551891f>
145519746:     	movq	0x1b8(%rbp), %rax
14551974d:     	rolw	$0x8, %ax
145519751:     	movw	%ax, (%rcx,%rdx)
145519755:     	addq	$0x2, %rdx
145519759:     	movq	%rdx, 0x1b0(%rbp)
145519760:     	movq	0x1a0(%rbp), %rax
145519767:     	movq	%rax, %rcx
14551976a:     	subq	%rdx, %rcx
14551976d:     	cmpq	$0x1, %rcx
145519771:     	jbe	0x14551995b <.text+0x551895b>
145519777:     	movq	0x1a8(%rbp), %rbx
14551977e:     	movw	$0x0, (%rbx,%rdx)
145519784:     	addq	$0x2, %rdx
145519788:     	movq	%rdx, 0x1b0(%rbp)
14551978f:     	movq	%rax, %rcx
145519792:     	subq	%rdx, %rcx
145519795:     	cmpq	$0x1, %rcx
145519799:     	jbe	0x145519997 <.text+0x5518997>
14551979f:     	movw	$0xc0, (%rbx,%rdx)
1455197a5:     	addq	$0x2, %rdx
1455197a9:     	movq	%rdx, 0x1b0(%rbp)
1455197b0:     	subq	%rdx, %rax
1455197b3:     	cmpq	$0x1, %rax
1455197b7:     	jbe	0x1455199da <.text+0x55189da>
1455197bd:     	movw	$0x40, (%rbx,%rdx)
1455197c3:     	addq	$0x2, %rdx
1455197c7:     	movq	%rdx, 0x1b0(%rbp)
1455197ce:     	movq	0xd0(%rbp), %r13
1455197d5:     	cmpq	$0xffff, %r13           # imm = 0xFFFF
1455197dc:     	ja	0x14551a98f <.text+0x551998f>
1455197e2:     	movb	$0x0, 0x237(%rbp)
1455197e9:     	leaq	0xc0(%rbp), %rcx
1455197f0:     	leaq	0x1a0(%rbp), %rdx
1455197f7:     	callq	0x1406442a0 <.text+0x6432a0>
1455197fc:     	nop
1455197fd:     	movq	0x120(%rbp), %rax
145519804:     	movq	%rax, %rbx
145519807:     	cmpq	0x1e8(%rbp), %rax
14551980e:     	jbe	0x14551abc2 <.text+0x5519bc2>
145519814:     	movq	0x118(%rbp), %rax
14551981b:     	movq	0x1e8(%rbp), %rcx
145519822:     	movzwl	(%rax,%rcx,4), %ecx
145519826:     	movw	%cx, 0x1f0(%rbp)
14551982d:     	cmpq	0x110(%rbp), %rbx
145519834:     	jne	0x145519851 <.text+0x5518851>
145519836:     	movb	$0x0, 0x237(%rbp)
14551983d:     	leaq	0x110(%rbp), %rcx
145519844:     	callq	0x1457783e0 <.text+0x57773e0>
145519849:     	nop
14551984a:     	movq	0x118(%rbp), %rax
145519851:     	movzwl	0x1f0(%rbp), %ecx
145519858:     	movw	%cx, (%rax,%rbx,4)
14551985c:     	movq	0x1d0(%rbp), %rcx
145519863:     	movw	%cx, 0x2(%rax,%rbx,4)
145519868:     	incq	%rbx
14551986b:     	movq	%rbx, 0x120(%rbp)
145519872:     	movb	$0x0, 0x237(%rbp)
145519879:     	leaq	0xa0(%rbp), %rcx
145519880:     	movl	%esi, %edx
145519882:     	movl	%r13d, %r8d
145519885:     	callq	0x14550c470 <.text+0x550b470>
14551988a:     	nop
14551988b:     	movq	0x1d8(%rbp), %rax
145519892:     	incl	%eax
145519894:     	movq	%rax, 0x1d8(%rbp)
14551989b:     	jmp	0x14551952c <.text+0x551852c>
1455198a0:     	movb	$0x1, 0x237(%rbp)
1455198a7:     	movq	$0x1, 0x20(%rsp)
1455198b0:     	movl	$0x2, %r8d
1455198b6:     	movl	$0x1, %r9d
1455198bc:     	leaq	0x1a0(%rbp), %rcx
1455198c3:     	callq	0x1457744b0 <.text+0x57734b0>
1455198c8:     	nop
1455198c9:     	movq	0x1a0(%rbp), %rax
1455198d0:     	movq	0x1b0(%rbp), %rdx
1455198d7:     	jmp	0x1455196f4 <.text+0x55186f4>
1455198dc:     	movb	$0x1, 0x237(%rbp)
1455198e3:     	movq	$0x1, 0x20(%rsp)
1455198ec:     	movl	$0x2, %r8d
1455198f2:     	movl	$0x1, %r9d
1455198f8:     	leaq	0x1a0(%rbp), %rcx
1455198ff:     	callq	0x1457744b0 <.text+0x57734b0>
145519904:     	nop
145519905:     	movq	0x1b0(%rbp), %rdx
14551990c:     	movq	0x1a0(%rbp), %rax
145519913:     	movq	0x1a8(%rbp), %rcx
14551991a:     	jmp	0x14551971c <.text+0x551871c>
14551991f:     	movb	$0x1, 0x237(%rbp)
145519926:     	movq	$0x1, 0x20(%rsp)
14551992f:     	movl	$0x2, %r8d
145519935:     	movl	$0x1, %r9d
14551993b:     	leaq	0x1a0(%rbp), %rcx
145519942:     	callq	0x1457744b0 <.text+0x57734b0>
145519947:     	nop
145519948:     	movq	0x1a8(%rbp), %rcx
14551994f:     	movq	0x1b0(%rbp), %rdx
145519956:     	jmp	0x145519746 <.text+0x5518746>
14551995b:     	movb	$0x1, 0x237(%rbp)
145519962:     	movq	$0x1, 0x20(%rsp)
14551996b:     	movl	$0x2, %r8d
145519971:     	movl	$0x1, %r9d
145519977:     	leaq	0x1a0(%rbp), %rcx
14551997e:     	callq	0x1457744b0 <.text+0x57734b0>
145519983:     	nop
145519984:     	movq	0x1a0(%rbp), %rax
14551998b:     	movq	0x1b0(%rbp), %rdx
145519992:     	jmp	0x145519777 <.text+0x5518777>
145519997:     	movb	$0x1, 0x237(%rbp)
14551999e:     	movq	$0x1, 0x20(%rsp)
1455199a7:     	movl	$0x2, %r8d
1455199ad:     	movl	$0x1, %r9d
1455199b3:     	leaq	0x1a0(%rbp), %rcx
1455199ba:     	callq	0x1457744b0 <.text+0x57734b0>
1455199bf:     	nop
1455199c0:     	movq	0x1b0(%rbp), %rdx
1455199c7:     	movq	0x1a0(%rbp), %rax
1455199ce:     	movq	0x1a8(%rbp), %rbx
1455199d5:     	jmp	0x14551979f <.text+0x551879f>
1455199da:     	movb	$0x1, 0x237(%rbp)
1455199e1:     	movq	$0x1, 0x20(%rsp)
1455199ea:     	movl	$0x2, %r8d
1455199f0:     	movl	$0x1, %r9d
1455199f6:     	leaq	0x1a0(%rbp), %rcx
1455199fd:     	callq	0x1457744b0 <.text+0x57734b0>
145519a02:     	nop
145519a03:     	movq	0x1a8(%rbp), %rbx
145519a0a:     	movq	0x1b0(%rbp), %rdx
145519a11:     	jmp	0x1455197bd <.text+0x55187bd>
145519a16:     	xorl	%ebx, %ebx
145519a18:     	leaq	0x14e08e9(%rip), %rsi   # 0x1469fa308
145519a1f:     	cmpq	$0x30, %rbx
145519a23:     	je	0x145519a95 <.text+0x5518a95>
145519a25:     	movl	(%rbx,%rsi), %edi
145519a28:     	movl	0x4(%rbx,%rsi), %r13d
145519a2d:     	movl	%edi, 0x128(%rbp)
145519a33:     	leaq	0xa0(%rbp), %rcx
145519a3a:     	leaq	0x128(%rbp), %rdx
145519a41:     	callq	0x145502cb0 <.text+0x5501cb0>
145519a46:     	nop
145519a47:     	addq	$0x8, %rbx
145519a4b:     	testq	%rax, %rax
145519a4e:     	jne	0x145519a1f <.text+0x5518a1f>
145519a50:     	movl	%r13d, 0x200(%rbp)
145519a57:     	leaq	0xa0(%rbp), %rcx
145519a5e:     	leaq	0x200(%rbp), %rdx
145519a65:     	callq	0x145502cb0 <.text+0x5501cb0>
145519a6a:     	nop
145519a6b:     	testq	%rax, %rax
145519a6e:     	je	0x145519a1f <.text+0x5518a1f>
145519a70:     	movzwl	(%rax), %r8d
145519a74:     	leaq	0xa0(%rbp), %rcx
145519a7b:     	movl	%edi, %edx
145519a7d:     	callq	0x14550c470 <.text+0x550b470>
145519a82:     	nop
145519a83:     	movq	0x1d8(%rbp), %rax
145519a8a:     	incl	%eax
145519a8c:     	movq	%rax, 0x1d8(%rbp)
145519a93:     	jmp	0x145519a1f <.text+0x5518a1f>
145519a95:     	cmpl	$0x0, 0x1d8(%rbp)
145519a9c:     	je	0x14551a01b <.text+0x551901b>
145519aa2:     	movq	$0x0, 0xf8(%rbp)
145519aad:     	movq	$0x1, 0x100(%rbp)
145519ab8:     	movq	$0x0, 0x108(%rbp)
145519ac3:     	movq	0xd0(%rbp), %rax
145519aca:     	leaq	0x4(,%rax,4), %rdx
145519ad2:     	movq	$0x1, 0x20(%rsp)
145519adb:     	leaq	0x200(%rbp), %rcx
145519ae2:     	movl	$0x1, %r9d
145519ae8:     	xorl	%r8d, %r8d
145519aeb:     	callq	0x140188f20 <.text+0x187f20>
145519af0:     	movq	0x208(%rbp), %rcx
145519af7:     	cmpb	$0x0, 0x200(%rbp)
145519afe:     	jne	0x14551aa79 <.text+0x5519a79>
145519b04:     	movq	0x210(%rbp), %rax
145519b0b:     	movq	%rcx, 0xe0(%rbp)
145519b12:     	movq	%rax, 0x1d0(%rbp)
145519b19:     	movq	%rax, 0xe8(%rbp)
145519b20:     	movq	$0x0, 0xf0(%rbp)
145519b2b:     	movq	0xc8(%rbp), %rbx
145519b32:     	movq	0xd0(%rbp), %rax
145519b39:     	leaq	(%rax,%rax,2), %rax
145519b3d:     	leaq	(%rbx,%rax,8), %rax
145519b41:     	movq	%rax, 0x1f0(%rbp)
145519b48:     	movq	$0x0, 0x1e0(%rbp)
145519b53:     	leaq	0xf8(%rbp), %r13
145519b5a:     	cmpq	0x1f0(%rbp), %rbx
145519b61:     	je	0x145519ca9 <.text+0x5518ca9>
145519b67:     	movq	0x108(%rbp), %rsi
145519b6e:     	movq	0xe0(%rbp), %rax
145519b75:     	subq	0x1e0(%rbp), %rax
145519b7c:     	cmpq	$0x3, %rax
145519b80:     	jbe	0x145519c35 <.text+0x5518c35>
145519b86:     	bswapl	%esi
145519b88:     	movq	0x1e0(%rbp), %rax
145519b8f:     	movq	0x1d0(%rbp), %rcx
145519b96:     	movl	%esi, (%rcx,%rax)
145519b99:     	addq	$0x4, %rax
145519b9d:     	movq	%rax, 0x1e0(%rbp)
145519ba4:     	movq	%rax, 0xf0(%rbp)
145519bab:     	movq	0x8(%rbx), %rax
145519baf:     	movq	%rax, 0x228(%rbp)
145519bb6:     	movq	0x10(%rbx), %rdi
145519bba:     	movq	0xf8(%rbp), %rax
145519bc1:     	movq	0x108(%rbp), %rsi
145519bc8:     	subq	%rsi, %rax
145519bcb:     	cmpq	%rax, %rdi
145519bce:     	ja	0x145519c7f <.text+0x5518c7f>
145519bd4:     	testq	%rdi, %rdi
145519bd7:     	je	0x145519bf9 <.text+0x5518bf9>
145519bd9:     	addq	0x100(%rbp), %rsi
145519be0:     	movq	%rsi, %rcx
145519be3:     	movq	0x228(%rbp), %rdx
145519bea:     	movq	%rdi, %r8
145519bed:     	callq	0x1457731ed <.text+0x57721ed>
145519bf2:     	movq	0x108(%rbp), %rsi
145519bf9:     	addq	$0x18, %rbx
145519bfd:     	addq	%rdi, %rsi
145519c00:     	jmp	0x145519c10 <.text+0x5518c10>
145519c02:     	movq	0x100(%rbp), %rax
145519c09:     	movb	$0x0, (%rax,%rsi)
145519c0d:     	incq	%rsi
145519c10:     	movq	%rsi, 0x108(%rbp)
145519c17:     	testb	$0x3, %sil
145519c1b:     	je	0x145519b5a <.text+0x5518b5a>
145519c21:     	cmpq	0xf8(%rbp), %rsi
145519c28:     	jne	0x145519c02 <.text+0x5518c02>
145519c2a:     	movq	%r13, %rcx
145519c2d:     	callq	0x145903690 <.text+0x5902690>
145519c32:     	nop
145519c33:     	jmp	0x145519c02 <.text+0x5518c02>
145519c35:     	movq	$0x1, 0x20(%rsp)
145519c3e:     	movl	$0x4, %r8d
145519c44:     	movl	$0x1, %r9d
145519c4a:     	leaq	0xe0(%rbp), %rcx
145519c51:     	movq	0x1e0(%rbp), %rdx
145519c58:     	callq	0x1457744b0 <.text+0x57734b0>
145519c5d:     	nop
145519c5e:     	movq	0xe8(%rbp), %rax
145519c65:     	movq	%rax, 0x1d0(%rbp)
145519c6c:     	movq	0xf0(%rbp), %rax
145519c73:     	movq	%rax, 0x1e0(%rbp)
145519c7a:     	jmp	0x145519b86 <.text+0x5518b86>
145519c7f:     	movq	$0x1, 0x20(%rsp)
145519c88:     	movl	$0x1, %r9d
145519c8e:     	movq	%r13, %rcx
145519c91:     	movq	%rsi, %rdx
145519c94:     	movq	%rdi, %r8
145519c97:     	callq	0x1457744b0 <.text+0x57734b0>
145519c9c:     	nop
145519c9d:     	movq	0x108(%rbp), %rsi
145519ca4:     	jmp	0x145519bd9 <.text+0x5518bd9>
145519ca9:     	movq	0x108(%rbp), %rsi
145519cb0:     	movq	0xe0(%rbp), %rax
145519cb7:     	subq	0x1e0(%rbp), %rax
145519cbe:     	cmpq	$0x3, %rax
145519cc2:     	jbe	0x14551aa8b <.text+0x5519a8b>
145519cc8:     	bswapl	%esi
145519cca:     	movq	0xe8(%rbp), %rax
145519cd1:     	movq	0x1e0(%rbp), %rcx
145519cd8:     	movl	%esi, (%rax,%rcx)
145519cdb:     	addq	$0x4, %rcx
145519cdf:     	movq	%rcx, 0xf0(%rbp)
145519ce6:     	movq	0x120(%rbp), %rdx
145519ced:     	shlq	$0x2, %rdx
145519cf1:     	movq	$0x1, 0x20(%rsp)
145519cfa:     	leaq	0x200(%rbp), %rcx
145519d01:     	movl	$0x1, %r9d
145519d07:     	xorl	%r8d, %r8d
145519d0a:     	callq	0x140188f20 <.text+0x187f20>
145519d0f:     	movq	0x208(%rbp), %rcx
145519d16:     	cmpl	$0x1, 0x200(%rbp)
145519d1d:     	je	0x14551aac7 <.text+0x5519ac7>
145519d23:     	movq	0x210(%rbp), %rax
145519d2a:     	movq	%rcx, 0x88(%rbp)
145519d31:     	movq	%rax, 0x1e0(%rbp)
145519d38:     	movq	%rax, 0x90(%rbp)
145519d3f:     	movq	$0x0, 0x98(%rbp)
145519d4a:     	movq	0x118(%rbp), %rdi
145519d51:     	movq	0x120(%rbp), %rax
145519d58:     	leaq	(%rdi,%rax,4), %rbx
145519d5c:     	xorl	%edx, %edx
145519d5e:     	leaq	0x88(%rbp), %rsi
145519d65:     	cmpq	%rbx, %rdi
145519d68:     	je	0x145519e43 <.text+0x5518e43>
145519d6e:     	movzwl	(%rdi), %r13d
145519d72:     	movq	0x88(%rbp), %rax
145519d79:     	subq	%rdx, %rax
145519d7c:     	cmpq	$0x1, %rax
145519d80:     	jbe	0x145519de1 <.text+0x5518de1>
145519d82:     	rolw	$0x8, %r13w
145519d87:     	movq	0x1e0(%rbp), %rax
145519d8e:     	movw	%r13w, (%rax,%rdx)
145519d93:     	addq	$0x2, %rdx
145519d97:     	movq	%rdx, 0x98(%rbp)
145519d9e:     	movzwl	0x2(%rdi), %r13d
145519da3:     	movq	0x88(%rbp), %rax
145519daa:     	subq	%rdx, %rax
145519dad:     	cmpq	$0x1, %rax
145519db1:     	jbe	0x145519e19 <.text+0x5518e19>
145519db3:     	addq	$0x4, %rdi
145519db7:     	rolw	$0x8, %r13w
145519dbc:     	movq	0x90(%rbp), %rax
145519dc3:     	movq	%rax, 0x1e0(%rbp)
145519dca:     	movw	%r13w, (%rax,%rdx)
145519dcf:     	addq	$0x2, %rdx
145519dd3:     	movq	%rdx, 0x98(%rbp)
145519dda:     	cmpq	%rbx, %rdi
145519ddd:     	jne	0x145519d6e <.text+0x5518d6e>
145519ddf:     	jmp	0x145519e43 <.text+0x5518e43>
145519de1:     	movq	$0x1, 0x20(%rsp)
145519dea:     	movl	$0x2, %r8d
145519df0:     	movl	$0x1, %r9d
145519df6:     	movq	%rsi, %rcx
145519df9:     	callq	0x1457744b0 <.text+0x57734b0>
145519dfe:     	nop
145519dff:     	movq	0x90(%rbp), %rax
145519e06:     	movq	%rax, 0x1e0(%rbp)
145519e0d:     	movq	0x98(%rbp), %rdx
145519e14:     	jmp	0x145519d82 <.text+0x5518d82>
145519e19:     	movq	$0x1, 0x20(%rsp)
145519e22:     	movl	$0x2, %r8d
145519e28:     	movl	$0x1, %r9d
145519e2e:     	movq	%rsi, %rcx
145519e31:     	callq	0x1457744b0 <.text+0x57734b0>
145519e36:     	nop
145519e37:     	movq	0x98(%rbp), %rdx
145519e3e:     	jmp	0x145519db3 <.text+0x5518db3>
145519e43:     	movzwl	0xd0(%rbp), %r13d
145519e4b:     	movq	$0x1, 0x20(%rsp)
145519e54:     	leaq	0x200(%rbp), %rcx
145519e5b:     	movl	$0x1, %r9d
145519e61:     	movq	%r14, %rdx
145519e64:     	xorl	%r8d, %r8d
145519e67:     	callq	0x140188f20 <.text+0x187f20>
145519e6c:     	movq	0x208(%rbp), %rax
145519e73:     	movq	%rax, 0x1d8(%rbp)
145519e7a:     	cmpb	$0x0, 0x200(%rbp)
145519e81:     	jne	0x14551aad9 <.text+0x5519ad9>
145519e87:     	movq	0x210(%rbp), %rcx
145519e8e:     	movq	0x1d8(%rbp), %rax
145519e95:     	movq	%rax, -0x28(%rbp)
145519e99:     	movq	%rcx, 0x1d0(%rbp)
145519ea0:     	movq	%rcx, -0x20(%rbp)
145519ea4:     	testq	%r14, %r14
145519ea7:     	je	0x14551ab4b <.text+0x5519b4b>
145519ead:     	movq	0x1d0(%rbp), %rcx
145519eb4:     	movq	%r15, %rdx
145519eb7:     	movq	%r14, %r8
145519eba:     	callq	0x1457731ed <.text+0x57721ed>
145519ebf:     	movq	%r14, -0x18(%rbp)
145519ec3:     	cmpq	$0x33, %r14
145519ec7:     	jbe	0x14551ab4b <.text+0x5519b4b>
145519ecd:     	movq	0x1d0(%rbp), %rax
145519ed4:     	movw	$0x100, 0x32(%rax)      # imm = 0x100
145519eda:     	movl	$0x0, 0x8(%rax)
145519ee1:     	movq	$0x1, 0x20(%rsp)
145519eea:     	leaq	0x200(%rbp), %rcx
145519ef1:     	movl	$0x1, %r9d
145519ef7:     	movq	0x1c8(%rbp), %rdx
145519efe:     	xorl	%r8d, %r8d
145519f01:     	callq	0x140188f20 <.text+0x187f20>
145519f06:     	movq	0x208(%rbp), %rax
145519f0d:     	movq	%rax, 0x1e8(%rbp)
145519f14:     	cmpl	$0x1, 0x200(%rbp)
145519f1b:     	je	0x14551aaf2 <.text+0x5519af2>
145519f21:     	movq	0x210(%rbp), %rcx
145519f28:     	movq	0x1e8(%rbp), %rax
145519f2f:     	movq	%rax, -0x40(%rbp)
145519f33:     	movq	%rcx, 0x1f0(%rbp)
145519f3a:     	movq	%rcx, -0x38(%rbp)
145519f3e:     	cmpq	$0x0, 0x1c8(%rbp)
145519f46:     	je	0x14551ab6a <.text+0x5519b6a>
145519f4c:     	movq	0x1f0(%rbp), %rcx
145519f53:     	movq	0x168(%rbp), %rdx
145519f5a:     	movq	0x1c8(%rbp), %rsi
145519f61:     	movq	%rsi, %r8
145519f64:     	callq	0x1457731ed <.text+0x57721ed>
145519f69:     	movq	%rsi, -0x30(%rbp)
145519f6d:     	cmpq	$0x5, %rsi
145519f71:     	jbe	0x14551ab6a <.text+0x5519b6a>
145519f77:     	rolw	$0x8, %r13w
145519f7c:     	movq	0x1f0(%rbp), %rax
145519f83:     	movw	%r13w, 0x4(%rax)
145519f88:     	cmpq	$0x20, 0x1c8(%rbp)
145519f90:     	jb	0x14551a19e <.text+0x551919e>
145519f96:     	leaq	0x200(%rbp), %rcx
145519f9d:     	movl	$0x6, %r9d
145519fa3:     	movq	0x168(%rbp), %rdx
145519faa:     	movq	0x1c8(%rbp), %r8
145519fb1:     	callq	0x145518150 <.text+0x5517150>
145519fb6:     	nop
145519fb7:     	movq	0x200(%rbp), %rax
145519fbe:     	movzwl	0x208(%rbp), %esi
145519fc5:     	cmpq	$-0x1, %rax
145519fc9:     	je	0x14551a0a1 <.text+0x55190a1>
145519fcf:     	movq	0x20a(%rbp), %rcx
145519fd6:     	movq	0x210(%rbp), %rdx
145519fdd:     	movq	0x1f8(%rbp), %r8
145519fe4:     	movq	%rdx, 0x18(%r8)
145519fe8:     	movq	%rcx, 0x12(%r8)
145519fec:     	jmp	0x14551a0f5 <.text+0x55190f5>
145519ff1:     	movl	$0x1, %ecx
145519ff6:     	movl	$0x15, %edx
145519ffb:     	callq	0x14590379b <.text+0x590279b>
14551a000:     	nop
14551a001:     	jmp	0x14551ac36 <.text+0x5519c36>
14551a006:     	movl	$0x1, %ecx
14551a00b:     	movl	$0x1d, %edx
14551a010:     	callq	0x14590379b <.text+0x590279b>
14551a015:     	nop
14551a016:     	jmp	0x14551ac36 <.text+0x5519c36>
14551a01b:     	movq	$0x1, 0x20(%rsp)
14551a024:     	leaq	0x200(%rbp), %rcx
14551a02b:     	movl	$0x1, %r9d
14551a031:     	movq	0x228(%rbp), %rdx
14551a038:     	xorl	%r8d, %r8d
14551a03b:     	callq	0x140188f20 <.text+0x187f20>
14551a040:     	movq	0x208(%rbp), %rsi
14551a047:     	cmpb	$0x0, 0x200(%rbp)
14551a04e:     	jne	0x14551ab0b <.text+0x5519b0b>
14551a054:     	movq	0x210(%rbp), %rdi
14551a05b:     	cmpq	$0x0, 0x228(%rbp)
14551a063:     	je	0x14551a07b <.text+0x551907b>
14551a065:     	movq	%rdi, %rcx
14551a068:     	movq	0x1e0(%rbp), %rdx
14551a06f:     	movq	0x228(%rbp), %r8
14551a076:     	callq	0x1457731ed <.text+0x57721ed>
14551a07b:     	movq	0x1f8(%rbp), %rax
14551a082:     	movq	%rsi, 0x8(%rax)
14551a086:     	movq	%rdi, 0x10(%rax)
14551a08a:     	movq	0x228(%rbp), %rcx
14551a091:     	movq	%rcx, 0x18(%rax)
14551a095:     	movq	$0x0, (%rax)
14551a09c:     	jmp	0x14551a428 <.text+0x5519428>
14551a0a1:     	leaq	0x200(%rbp), %rcx
14551a0a8:     	movl	$0x8, %r9d
14551a0ae:     	movq	0x168(%rbp), %rdx
14551a0b5:     	movq	0x1c8(%rbp), %r8
14551a0bc:     	callq	0x145518150 <.text+0x5517150>
14551a0c1:     	nop
14551a0c2:     	movq	0x200(%rbp), %rax
14551a0c9:     	movzwl	0x208(%rbp), %edi
14551a0d0:     	cmpq	$-0x1, %rax
14551a0d4:     	je	0x14551a110 <.text+0x5519110>
14551a0d6:     	movq	0x20a(%rbp), %rcx
14551a0dd:     	movq	0x210(%rbp), %rdx
14551a0e4:     	movq	0x1f8(%rbp), %r8
14551a0eb:     	movq	%rdx, 0x18(%r8)
14551a0ef:     	movq	%rcx, 0x12(%r8)
14551a0f3:     	movl	%edi, %esi
14551a0f5:     	movq	0x1f8(%rbp), %rcx
14551a0fc:     	movq	%rax, 0x8(%rcx)
14551a100:     	movw	%si, 0x10(%rcx)
14551a104:     	movq	$0x1, (%rcx)
14551a10b:     	jmp	0x14551a39c <.text+0x551939c>
14551a110:     	testw	%si, %si
14551a113:     	js	0x14551ab39 <.text+0x5519b39>
14551a119:     	addl	%esi, %esi
14551a11b:     	movl	$0xa, %r8d
14551a121:     	movq	0x1f0(%rbp), %rcx
14551a128:     	movq	0x1c8(%rbp), %rdx
14551a12f:     	movl	%esi, %r9d
14551a132:     	callq	0x14550d9a0 <.text+0x550c9a0>
14551a137:     	nop
14551a138:     	testw	%di, %di
14551a13b:     	js	0x14551ab42 <.text+0x5519b42>
14551a141:     	addl	%edi, %edi
14551a143:     	movl	$0xc, %r8d
14551a149:     	movq	0x1f0(%rbp), %rcx
14551a150:     	movq	0x1c8(%rbp), %rdx
14551a157:     	movl	%edi, %r9d
14551a15a:     	callq	0x14550d9a0 <.text+0x550c9a0>
14551a15f:     	nop
14551a160:     	movl	$0x1c, %r8d
14551a166:     	movq	0x1f0(%rbp), %rcx
14551a16d:     	movq	0x1c8(%rbp), %rdx
14551a174:     	movw	$0x2, %r9w
14551a179:     	callq	0x14550d9a0 <.text+0x550c9a0>
14551a17e:     	nop
14551a17f:     	movl	$0x1e, %r8d
14551a185:     	movq	0x1f0(%rbp), %rcx
14551a18c:     	movq	0x1c8(%rbp), %rdx
14551a193:     	movw	$0x1, %r9w
14551a198:     	callq	0x14550d9a0 <.text+0x550c9a0>
14551a19d:     	nop
14551a19e:     	movq	$0x1, 0x20(%rsp)
14551a1a7:     	leaq	0x200(%rbp), %rcx
14551a1ae:     	movl	$0x1, %r9d
14551a1b4:     	movq	0x148(%rbp), %rdx
14551a1bb:     	xorl	%r8d, %r8d
14551a1be:     	callq	0x140188f20 <.text+0x187f20>
14551a1c3:     	movq	0x208(%rbp), %rax
14551a1ca:     	movq	%rax, 0x1b8(%rbp)
14551a1d1:     	cmpb	$0x0, 0x200(%rbp)
14551a1d8:     	jne	0x14551ab20 <.text+0x5519b20>
14551a1de:     	movq	0x210(%rbp), %rcx
14551a1e5:     	movq	0x1b8(%rbp), %rax
14551a1ec:     	movq	%rax, -0x58(%rbp)
14551a1f0:     	movq	%rcx, 0x168(%rbp)
14551a1f7:     	movq	%rcx, -0x50(%rbp)
14551a1fb:     	cmpq	$0x0, 0x148(%rbp)
14551a203:     	je	0x14551ab8d <.text+0x5519b8d>
14551a209:     	movq	0x168(%rbp), %rcx
14551a210:     	movq	0x58(%rbp), %rdx
14551a214:     	movq	0x148(%rbp), %rsi
14551a21b:     	movq	%rsi, %r8
14551a21e:     	callq	0x1457731ed <.text+0x57721ed>
14551a223:     	movq	%rsi, -0x48(%rbp)
14551a227:     	cmpq	$0x23, %rsi
14551a22b:     	jbe	0x14551ab8d <.text+0x5519b8d>
14551a231:     	movq	0x168(%rbp), %rax
14551a238:     	movw	%r13w, 0x22(%rax)
14551a23d:     	leaq	0x14e013c(%rip), %r9    # 0x1469fa380
14551a244:     	leaq	0x200(%rbp), %rcx
14551a24b:     	movq	0x170(%rbp), %rdx
14551a252:     	movq	%r12, %r8
14551a255:     	callq	0x14550da00 <.text+0x550ca00>
14551a25a:     	nop
14551a25b:     	movq	0x200(%rbp), %rdi
14551a262:     	movq	0x208(%rbp), %rsi
14551a269:     	movq	0x210(%rbp), %rbx
14551a270:     	cmpq	$-0x1, %rdi
14551a274:     	jne	0x14551a369 <.text+0x5519369>
14551a27a:     	callq	0x140002200 <.text+0x1200>
14551a27f:     	cmpq	$0x1f, %rbx
14551a283:     	jbe	0x14551a331 <.text+0x5519331>
14551a289:     	movl	$0x20, %ecx
14551a28e:     	movl	$0x1, %edx
14551a293:     	callq	0x1400021c0 <.text+0x11c0>
14551a298:     	movq	%rax, 0x148(%rbp)
14551a29f:     	testq	%rax, %rax
14551a2a2:     	je	0x14551ac14 <.text+0x5519c14>
14551a2a8:     	movq	$0x20, 0x40(%rbp)
14551a2b0:     	movq	0x148(%rbp), %rax
14551a2b7:     	movq	%rax, 0x48(%rbp)
14551a2bb:     	movdqu	(%rsi), %xmm0
14551a2bf:     	movups	0x10(%rsi), %xmm1
14551a2c3:     	movups	%xmm1, 0x10(%rax)
14551a2c7:     	movdqu	%xmm0, (%rax)
14551a2cb:     	movq	$0x20, 0x50(%rbp)
14551a2d3:     	movl	$0x300, (%rax)          # imm = 0x300
14551a2d9:     	movq	$0x0, 0x180(%rbp)
14551a2e4:     	movq	$0x8, 0x188(%rbp)
14551a2ef:     	movq	$0x0, 0x190(%rbp)
14551a2fa:     	leaq	(%r12,%r12,2), %rax
14551a2fe:     	movq	0x170(%rbp), %r14
14551a305:     	leaq	(%r14,%rax,8), %rax
14551a309:     	movq	%rax, 0x1c8(%rbp)
14551a310:     	leaq	0x208(%rbp), %r13
14551a317:     	leaq	0x200(%rbp), %rbx
14551a31e:     	leaq	0x180(%rbp), %r12
14551a325:     	leaq	0x181a39c(%rip), %r15   # 0x146d346c8
14551a32c:     	jmp	0x14551a4b4 <.text+0x55194b4>
14551a331:     	movl	$0xa, %edi
14551a336:     	movl	$0xa, %ecx
14551a33b:     	movl	$0x1, %edx
14551a340:     	callq	0x1400021c0 <.text+0x11c0>
14551a345:     	testq	%rax, %rax
14551a348:     	je	0x14551ac26 <.text+0x5519c26>
14551a34e:     	movq	%rax, %rsi
14551a351:     	movabsq	$0x6f702074726f6873, %rax # imm = 0x6F702074726F6873
14551a35b:     	movq	%rax, (%rsi)
14551a35e:     	movw	$0x7473, 0x8(%rsi)      # imm = 0x7473
14551a364:     	movl	$0xa, %ebx
14551a369:     	movq	0x1f8(%rbp), %rax
14551a370:     	movq	%rdi, 0x8(%rax)
14551a374:     	movq	%rsi, 0x10(%rax)
14551a378:     	movq	%rbx, 0x18(%rax)
14551a37c:     	movq	$0x1, (%rax)
14551a383:     	movl	$0x1, %r8d
14551a389:     	movq	0x168(%rbp), %rcx
14551a390:     	movq	0x1b8(%rbp), %rdx
14551a397:     	callq	0x1400021d0 <.text+0x11d0>
14551a39c:     	movl	$0x1, %r8d
14551a3a2:     	movq	0x1f0(%rbp), %rcx
14551a3a9:     	movq	0x1e8(%rbp), %rdx
14551a3b0:     	callq	0x1400021d0 <.text+0x11d0>
14551a3b5:     	movl	$0x1, %r8d
14551a3bb:     	movq	0x1d0(%rbp), %rcx
14551a3c2:     	movq	0x1d8(%rbp), %rdx
14551a3c9:     	callq	0x1400021d0 <.text+0x11d0>
14551a3ce:     	movq	0x88(%rbp), %rdx
14551a3d5:     	testq	%rdx, %rdx
14551a3d8:     	je	0x14551a3ec <.text+0x55193ec>
14551a3da:     	movl	$0x1, %r8d
14551a3e0:     	movq	0x1e0(%rbp), %rcx
14551a3e7:     	callq	0x1400021d0 <.text+0x11d0>
14551a3ec:     	movq	0xe0(%rbp), %rdx
14551a3f3:     	testq	%rdx, %rdx
14551a3f6:     	je	0x14551a40a <.text+0x551940a>
14551a3f8:     	movq	0xe8(%rbp), %rcx
14551a3ff:     	movl	$0x1, %r8d
14551a405:     	callq	0x1400021d0 <.text+0x11d0>
14551a40a:     	movq	0xf8(%rbp), %rdx
14551a411:     	testq	%rdx, %rdx
14551a414:     	je	0x14551a428 <.text+0x5519428>
14551a416:     	movq	0x100(%rbp), %rcx
14551a41d:     	movl	$0x1, %r8d
14551a423:     	callq	0x1400021d0 <.text+0x11d0>
14551a428:     	movq	0x110(%rbp), %rdx
14551a42f:     	testq	%rdx, %rdx
14551a432:     	je	0x14551a44a <.text+0x551944a>
14551a434:     	movq	0x118(%rbp), %rcx
14551a43b:     	shlq	$0x2, %rdx
14551a43f:     	movl	$0x2, %r8d
14551a445:     	callq	0x1400021d0 <.text+0x11d0>
14551a44a:     	leaq	0xc0(%rbp), %rcx
14551a451:     	callq	0x140001000 <.text>
14551a456:     	nop
14551a457:     	leaq	0xa0(%rbp), %rcx
14551a45e:     	callq	0x14550cd20 <.text+0x550bd20>
14551a463:     	nop
14551a464:     	jmp	0x145518826 <.text+0x5517826>
14551a469:     	movq	0xa0(%rbp), %rdx
14551a470:     	movq	0xa8(%rbp), %r8
14551a477:     	leaq	0x68(%rbp), %rcx
14551a47b:     	callq	0x145516b90 <.text+0x5515b90>
14551a480:     	nop
14551a481:     	movq	0x228(%rbp), %rax
14551a488:     	movl	(%rax), %eax
14551a48a:     	movl	%eax, 0x200(%rbp)
14551a490:     	movq	0x78(%rbp), %rax
14551a494:     	movq	%rax, 0x10(%r13)
14551a498:     	movq	0x68(%rbp), %rax
14551a49c:     	movq	%rax, (%r13)
14551a4a0:     	movq	0x70(%rbp), %rax
14551a4a4:     	movq	%rax, 0x8(%r13)
14551a4a8:     	movq	%r12, %rcx
14551a4ab:     	movq	%rbx, %rdx
14551a4ae:     	callq	0x1455135b0 <.text+0x55125b0>
14551a4b3:     	nop
14551a4b4:     	movq	%r14, 0x228(%rbp)
14551a4bb:     	cmpq	0x1c8(%rbp), %r14
14551a4c2:     	je	0x14551a834 <.text+0x5519834>
14551a4c8:     	movq	0x228(%rbp), %rax
14551a4cf:     	leaq	0x18(%rax), %r14
14551a4d3:     	movzbl	(%rax), %eax
14551a4d6:     	addl	$-0x44, %eax
14551a4d9:     	cmpl	$0x2c, %eax
14551a4dc:     	ja	0x14551a7bd <.text+0x55197bd>
14551a4e2:     	movslq	(%r15,%rax,4), %rax
14551a4e6:     	addq	%r15, %rax
14551a4e9:     	jmpq	*%rax
14551a4eb:     	movq	0x228(%rbp), %rax
14551a4f2:     	cmpb	$0x53, 0x1(%rax)
14551a4f6:     	jne	0x14551a7bd <.text+0x55197bd>
14551a4fc:     	movq	0x228(%rbp), %rax
14551a503:     	cmpb	$0x49, 0x2(%rax)
14551a507:     	jne	0x14551a7bd <.text+0x55197bd>
14551a50d:     	movq	0x228(%rbp), %rax
14551a514:     	cmpb	$0x47, 0x3(%rax)
14551a518:     	je	0x14551a4b4 <.text+0x55194b4>
14551a51a:     	jmp	0x14551a7bd <.text+0x55197bd>
14551a51f:     	movq	0x228(%rbp), %rax
14551a526:     	cmpb	$0x54, 0x1(%rax)
14551a52a:     	jne	0x14551a7bd <.text+0x55197bd>
14551a530:     	movq	0x228(%rbp), %rax
14551a537:     	cmpb	$0x53, 0x2(%rax)
14551a53b:     	jne	0x14551a7bd <.text+0x55197bd>
14551a541:     	movq	0x228(%rbp), %rax
14551a548:     	cmpb	$0x48, 0x3(%rax)
14551a54c:     	je	0x14551a4b4 <.text+0x55194b4>
14551a552:     	jmp	0x14551a7bd <.text+0x55197bd>
14551a557:     	movq	0x228(%rbp), %rax
14551a55e:     	cmpb	$0x44, 0x1(%rax)
14551a562:     	jne	0x14551a7bd <.text+0x55197bd>
14551a568:     	movq	0x228(%rbp), %rax
14551a56f:     	cmpb	$0x4d, 0x2(%rax)
14551a573:     	jne	0x14551a7bd <.text+0x55197bd>
14551a579:     	movq	0x228(%rbp), %rax
14551a580:     	cmpb	$0x58, 0x3(%rax)
14551a584:     	je	0x14551a4b4 <.text+0x55194b4>
14551a58a:     	jmp	0x14551a7bd <.text+0x55197bd>
14551a58f:     	movq	0x228(%rbp), %rax
14551a596:     	cmpb	$0x6d, 0x1(%rax)
14551a59a:     	jne	0x14551a7bd <.text+0x55197bd>
14551a5a0:     	movq	0x228(%rbp), %rax
14551a5a7:     	cmpb	$0x61, 0x2(%rax)
14551a5ab:     	jne	0x14551a7bd <.text+0x55197bd>
14551a5b1:     	movq	0x228(%rbp), %rax
14551a5b8:     	cmpb	$0x70, 0x3(%rax)
14551a5bc:     	je	0x14551a469 <.text+0x5519469>
14551a5c2:     	jmp	0x14551a7bd <.text+0x55197bd>
14551a5c7:     	movq	0x228(%rbp), %rax
14551a5ce:     	cmpb	$0x6c, 0x1(%rax)
14551a5d2:     	jne	0x14551a7bd <.text+0x55197bd>
14551a5d8:     	movq	0x228(%rbp), %rax
14551a5df:     	cmpb	$0x79, 0x2(%rax)
14551a5e3:     	jne	0x14551a7bd <.text+0x55197bd>
14551a5e9:     	movq	0x228(%rbp), %rax
14551a5f0:     	cmpb	$0x66, 0x3(%rax)
14551a5f4:     	jne	0x14551a7bd <.text+0x55197bd>
14551a5fa:     	leaq	0x68(%rbp), %rcx
14551a5fe:     	leaq	0xf8(%rbp), %rdx
14551a605:     	callq	0x1403d6a60 <.text+0x3d5a60>
14551a60a:     	nop
14551a60b:     	jmp	0x14551a481 <.text+0x5519481>
14551a610:     	movq	0x228(%rbp), %rax
14551a617:     	movzbl	0x1(%rax), %eax
14551a61b:     	addl	$-0x64, %eax
14551a61e:     	cmpl	$0x9, %eax
14551a621:     	ja	0x14551a7bd <.text+0x55197bd>
14551a627:     	leaq	0x181a14e(%rip), %rcx   # 0x146d3477c
14551a62e:     	movslq	(%rcx,%rax,4), %rax
14551a632:     	addq	%rcx, %rax
14551a635:     	jmpq	*%rax
14551a637:     	movq	0x228(%rbp), %rax
14551a63e:     	cmpb	$0x6d, 0x2(%rax)
14551a642:     	jne	0x14551a7bd <.text+0x55197bd>
14551a648:     	movq	0x228(%rbp), %rax
14551a64f:     	cmpb	$0x78, 0x3(%rax)
14551a653:     	je	0x14551a4b4 <.text+0x55194b4>
14551a659:     	jmp	0x14551a7bd <.text+0x55197bd>
14551a65e:     	movq	0x228(%rbp), %rax
14551a665:     	cmpb	$0x6f, 0x1(%rax)
14551a669:     	jne	0x14551a7bd <.text+0x55197bd>
14551a66f:     	movq	0x228(%rbp), %rax
14551a676:     	cmpb	$0x63, 0x2(%rax)
14551a67a:     	jne	0x14551a7bd <.text+0x55197bd>
14551a680:     	movq	0x228(%rbp), %rax
14551a687:     	cmpb	$0x61, 0x3(%rax)
14551a68b:     	jne	0x14551a7bd <.text+0x55197bd>
14551a691:     	leaq	0x68(%rbp), %rcx
14551a695:     	leaq	0xe0(%rbp), %rdx
14551a69c:     	callq	0x1403d6a60 <.text+0x3d5a60>
14551a6a1:     	nop
14551a6a2:     	jmp	0x14551a481 <.text+0x5519481>
14551a6a7:     	movq	0x228(%rbp), %rax
14551a6ae:     	cmpb	$0x61, 0x1(%rax)
14551a6b2:     	jne	0x14551a7bd <.text+0x55197bd>
14551a6b8:     	movq	0x228(%rbp), %rax
14551a6bf:     	cmpb	$0x78, 0x2(%rax)
14551a6c3:     	jne	0x14551a7bd <.text+0x55197bd>
14551a6c9:     	movq	0x228(%rbp), %rax
14551a6d0:     	cmpb	$0x70, 0x3(%rax)
14551a6d4:     	jne	0x14551a7bd <.text+0x55197bd>
14551a6da:     	leaq	0x68(%rbp), %rcx
14551a6de:     	leaq	-0x40(%rbp), %rdx
14551a6e2:     	callq	0x1403d6a60 <.text+0x3d5a60>
14551a6e7:     	nop
14551a6e8:     	jmp	0x14551a481 <.text+0x5519481>
14551a6ed:     	movq	0x228(%rbp), %rax
14551a6f4:     	cmpb	$0x6f, 0x1(%rax)
14551a6f8:     	jne	0x14551a7bd <.text+0x55197bd>
14551a6fe:     	movq	0x228(%rbp), %rax
14551a705:     	cmpb	$0x73, 0x2(%rax)
14551a709:     	jne	0x14551a7bd <.text+0x55197bd>
14551a70f:     	movq	0x228(%rbp), %rax
14551a716:     	cmpb	$0x74, 0x3(%rax)
14551a71a:     	jne	0x14551a7bd <.text+0x55197bd>
14551a720:     	leaq	0x68(%rbp), %rcx
14551a724:     	leaq	0x40(%rbp), %rdx
14551a728:     	callq	0x1403d6a60 <.text+0x3d5a60>
14551a72d:     	nop
14551a72e:     	jmp	0x14551a481 <.text+0x5519481>
14551a733:     	movq	0x228(%rbp), %rax
14551a73a:     	cmpb	$0x61, 0x2(%rax)
14551a73e:     	jne	0x14551a7bd <.text+0x55197bd>
14551a740:     	movq	0x228(%rbp), %rax
14551a747:     	cmpb	$0x64, 0x3(%rax)
14551a74b:     	jne	0x14551a7bd <.text+0x55197bd>
14551a74d:     	leaq	0x68(%rbp), %rcx
14551a751:     	leaq	-0x28(%rbp), %rdx
14551a755:     	callq	0x1403d6a60 <.text+0x3d5a60>
14551a75a:     	nop
14551a75b:     	jmp	0x14551a481 <.text+0x5519481>
14551a760:     	movq	0x228(%rbp), %rax
14551a767:     	cmpb	$0x65, 0x2(%rax)
14551a76b:     	jne	0x14551a7bd <.text+0x55197bd>
14551a76d:     	movq	0x228(%rbp), %rax
14551a774:     	cmpb	$0x61, 0x3(%rax)
14551a778:     	jne	0x14551a7bd <.text+0x55197bd>
14551a77a:     	leaq	0x68(%rbp), %rcx
14551a77e:     	leaq	-0x58(%rbp), %rdx
14551a782:     	callq	0x1403d6a60 <.text+0x3d5a60>
14551a787:     	nop
14551a788:     	jmp	0x14551a481 <.text+0x5519481>
14551a78d:     	movq	0x228(%rbp), %rax
14551a794:     	cmpb	$0x74, 0x2(%rax)
14551a798:     	jne	0x14551a7bd <.text+0x55197bd>
14551a79a:     	movq	0x228(%rbp), %rax
14551a7a1:     	cmpb	$0x78, 0x3(%rax)
14551a7a5:     	jne	0x14551a7bd <.text+0x55197bd>
14551a7a7:     	leaq	0x68(%rbp), %rcx
14551a7ab:     	leaq	0x88(%rbp), %rdx
14551a7b2:     	callq	0x1403d6a60 <.text+0x3d5a60>
14551a7b7:     	nop
14551a7b8:     	jmp	0x14551a481 <.text+0x5519481>
14551a7bd:     	movq	0x228(%rbp), %rax
14551a7c4:     	movq	0x8(%rax), %rdi
14551a7c8:     	movq	0x10(%rax), %rsi
14551a7cc:     	movq	$0x1, 0x20(%rsp)
14551a7d5:     	movl	$0x1, %r9d
14551a7db:     	movq	%rbx, %rcx
14551a7de:     	movq	%rsi, %rdx
14551a7e1:     	xorl	%r8d, %r8d
14551a7e4:     	callq	0x140188f20 <.text+0x187f20>
14551a7e9:     	movq	0x208(%rbp), %rcx
14551a7f0:     	cmpb	$0x0, 0x200(%rbp)
14551a7f7:     	jne	0x14551aa67 <.text+0x5519a67>
14551a7fd:     	movq	0x210(%rbp), %rax
14551a804:     	movq	%rcx, 0x68(%rbp)
14551a808:     	movq	%rax, 0x70(%rbp)
14551a80c:     	movq	$0x0, 0x78(%rbp)
14551a814:     	testq	%rsi, %rsi
14551a817:     	je	0x14551a481 <.text+0x5519481>
14551a81d:     	movq	%rax, %rcx
14551a820:     	movq	%rdi, %rdx
14551a823:     	movq	%rsi, %r8
14551a826:     	callq	0x1457731ed <.text+0x57721ed>
14551a82b:     	movq	%rsi, 0x78(%rbp)
14551a82f:     	jmp	0x14551a481 <.text+0x5519481>
14551a834:     	movq	0x190(%rbp), %rax
14551a83b:     	movq	%rax, 0x210(%rbp)
14551a842:     	movdqu	0x180(%rbp), %xmm0
14551a84a:     	movdqa	%xmm0, 0x200(%rbp)
14551a852:     	leaq	0x128(%rbp), %rcx
14551a859:     	leaq	0x200(%rbp), %r8
14551a860:     	movl	0xb8(%rbp), %edx
14551a866:     	callq	0x145517960 <.text+0x5516960>
14551a86b:     	nop
14551a86c:     	movq	0x138(%rbp), %rax
14551a873:     	movq	0x1f8(%rbp), %rcx
14551a87a:     	movq	%rax, 0x18(%rcx)
14551a87e:     	movdqu	0x128(%rbp), %xmm0
14551a886:     	movdqu	%xmm0, 0x8(%rcx)
14551a88b:     	movq	$0x0, (%rcx)
14551a892:     	movl	$0x20, %edx
14551a897:     	movl	$0x1, %r8d
14551a89d:     	movq	0x148(%rbp), %rcx
14551a8a4:     	callq	0x1400021d0 <.text+0x11d0>
14551a8a9:     	movl	$0x1, %r8d
14551a8af:     	movq	0x168(%rbp), %rcx
14551a8b6:     	movq	0x1b8(%rbp), %rdx
14551a8bd:     	callq	0x1400021d0 <.text+0x11d0>
14551a8c2:     	movl	$0x1, %r8d
14551a8c8:     	movq	0x1f0(%rbp), %rcx
14551a8cf:     	movq	0x1e8(%rbp), %rdx
14551a8d6:     	callq	0x1400021d0 <.text+0x11d0>
14551a8db:     	movl	$0x1, %r8d
14551a8e1:     	movq	0x1d0(%rbp), %rcx
14551a8e8:     	movq	0x1d8(%rbp), %rdx
14551a8ef:     	callq	0x1400021d0 <.text+0x11d0>
14551a8f4:     	movq	0x88(%rbp), %rdx
14551a8fb:     	testq	%rdx, %rdx
14551a8fe:     	je	0x14551a912 <.text+0x5519912>
14551a900:     	movl	$0x1, %r8d
14551a906:     	movq	0x1e0(%rbp), %rcx
14551a90d:     	callq	0x1400021d0 <.text+0x11d0>
14551a912:     	movq	0xe0(%rbp), %rdx
14551a919:     	testq	%rdx, %rdx
14551a91c:     	je	0x14551a930 <.text+0x5519930>
14551a91e:     	movq	0xe8(%rbp), %rcx
14551a925:     	movl	$0x1, %r8d
14551a92b:     	callq	0x1400021d0 <.text+0x11d0>
14551a930:     	movq	0xf8(%rbp), %rdx
14551a937:     	testq	%rdx, %rdx
14551a93a:     	je	0x14551a94e <.text+0x551994e>
14551a93c:     	movq	0x100(%rbp), %rcx
14551a943:     	movl	$0x1, %r8d
14551a949:     	callq	0x1400021d0 <.text+0x11d0>
14551a94e:     	movq	0x110(%rbp), %rdx
14551a955:     	testq	%rdx, %rdx
14551a958:     	je	0x14551a970 <.text+0x5519970>
14551a95a:     	movq	0x118(%rbp), %rcx
14551a961:     	shlq	$0x2, %rdx
14551a965:     	movl	$0x2, %r8d
14551a96b:     	callq	0x1400021d0 <.text+0x11d0>
14551a970:     	leaq	0xc0(%rbp), %rcx
14551a977:     	callq	0x140001000 <.text>
14551a97c:     	nop
14551a97d:     	leaq	0xa0(%rbp), %rcx
14551a984:     	callq	0x14550cd20 <.text+0x550bd20>
14551a989:     	nop
14551a98a:     	jmp	0x145518826 <.text+0x5517826>
14551a98f:     	movb	$0x1, 0x237(%rbp)
14551a996:     	leaq	0x200(%rbp), %rcx
14551a99d:     	callq	0x14550d930 <.text+0x550c930>
14551a9a2:     	nop
14551a9a3:     	movq	0x200(%rbp), %rax
14551a9aa:     	movzwl	0x208(%rbp), %ecx
14551a9b1:     	movq	0x210(%rbp), %rdx
14551a9b8:     	movq	0x1f8(%rbp), %r8
14551a9bf:     	movq	%rdx, 0x18(%r8)
14551a9c3:     	movq	0x20a(%rbp), %rdx
14551a9ca:     	movq	%rdx, 0x12(%r8)
14551a9ce:     	movq	%rax, 0x8(%r8)
14551a9d2:     	movw	%cx, 0x10(%r8)
14551a9d7:     	movq	$0x1, (%r8)
14551a9de:     	movq	0x1a0(%rbp), %rdx
14551a9e5:     	testq	%rdx, %rdx
14551a9e8:     	je	0x14551a428 <.text+0x5519428>
14551a9ee:     	movl	$0x1, %r8d
14551a9f4:     	movq	%rbx, %rcx
14551a9f7:     	jmp	0x14551a423 <.text+0x5519423>
14551a9fc:     	movb	$0x1, 0x236(%rbp)
14551aa03:     	leaq	0x200(%rbp), %rcx
14551aa0a:     	callq	0x14550d930 <.text+0x550c930>
14551aa0f:     	nop
14551aa10:     	movq	0x200(%rbp), %rax
14551aa17:     	movzwl	0x208(%rbp), %ecx
14551aa1e:     	movq	0x210(%rbp), %rdx
14551aa25:     	movq	0x1f8(%rbp), %r8
14551aa2c:     	movq	%rdx, 0x18(%r8)
14551aa30:     	movq	0x20a(%rbp), %rdx
14551aa37:     	movq	%rdx, 0x12(%r8)
14551aa3b:     	movq	%rax, 0x8(%r8)
14551aa3f:     	movw	%cx, 0x10(%r8)
14551aa44:     	movq	$0x1, (%r8)
14551aa4b:     	movq	0x150(%rbp), %rdx
14551aa52:     	testq	%rdx, %rdx
14551aa55:     	je	0x14551a428 <.text+0x5519428>
14551aa5b:     	movq	0x158(%rbp), %rcx
14551aa62:     	jmp	0x14551a41d <.text+0x551941d>
14551aa67:     	movq	0x210(%rbp), %rdx
14551aa6e:     	callq	0x14590379b <.text+0x590279b>
14551aa73:     	nop
14551aa74:     	jmp	0x14551ac36 <.text+0x5519c36>
14551aa79:     	movq	0x210(%rbp), %rdx
14551aa80:     	callq	0x14590379b <.text+0x590279b>
14551aa85:     	nop
14551aa86:     	jmp	0x14551ac36 <.text+0x5519c36>
14551aa8b:     	movq	$0x1, 0x20(%rsp)
14551aa94:     	leaq	0xe0(%rbp), %rcx
14551aa9b:     	movl	$0x4, %r8d
14551aaa1:     	movl	$0x1, %r9d
14551aaa7:     	movq	0x1e0(%rbp), %rdx
14551aaae:     	callq	0x1457744b0 <.text+0x57734b0>
14551aab3:     	nop
14551aab4:     	movq	0xf0(%rbp), %rax
14551aabb:     	movq	%rax, 0x1e0(%rbp)
14551aac2:     	jmp	0x145519cc8 <.text+0x5518cc8>
14551aac7:     	movq	0x210(%rbp), %rdx
14551aace:     	callq	0x14590379b <.text+0x590279b>
14551aad3:     	nop
14551aad4:     	jmp	0x14551ac36 <.text+0x5519c36>
14551aad9:     	movq	0x210(%rbp), %rdx
14551aae0:     	movq	0x1d8(%rbp), %rcx
14551aae7:     	callq	0x14590379b <.text+0x590279b>
14551aaec:     	nop
14551aaed:     	jmp	0x14551ac36 <.text+0x5519c36>
14551aaf2:     	movq	0x210(%rbp), %rdx
14551aaf9:     	movq	0x1e8(%rbp), %rcx
14551ab00:     	callq	0x14590379b <.text+0x590279b>
14551ab05:     	nop
14551ab06:     	jmp	0x14551ac36 <.text+0x5519c36>
14551ab0b:     	movq	0x210(%rbp), %rdx
14551ab12:     	movq	%rsi, %rcx
14551ab15:     	callq	0x14590379b <.text+0x590279b>
14551ab1a:     	nop
14551ab1b:     	jmp	0x14551ac36 <.text+0x5519c36>
14551ab20:     	movq	0x210(%rbp), %rdx
14551ab27:     	movq	0x1b8(%rbp), %rcx
14551ab2e:     	callq	0x14590379b <.text+0x590279b>
14551ab33:     	nop
14551ab34:     	jmp	0x14551ac36 <.text+0x5519c36>
14551ab39:     	movw	$0xffff, %si            # imm = 0xFFFF
14551ab3d:     	jmp	0x14551a11b <.text+0x551911b>
14551ab42:     	movw	$0xffff, %di            # imm = 0xFFFF
14551ab46:     	jmp	0x14551a143 <.text+0x5519143>
14551ab4b:     	leaq	0x14df7e6(%rip), %r9    # 0x1469fa338
14551ab52:     	movl	$0x32, %ecx
14551ab57:     	movl	$0x34, %edx
14551ab5c:     	movq	%r14, %r8
14551ab5f:     	callq	0x145903d40 <.text+0x5902d40>
14551ab64:     	nop
14551ab65:     	jmp	0x14551ac36 <.text+0x5519c36>
14551ab6a:     	leaq	0x14df7df(%rip), %r9    # 0x1469fa350
14551ab71:     	movl	$0x4, %ecx
14551ab76:     	movl	$0x6, %edx
14551ab7b:     	movq	0x1c8(%rbp), %r8
14551ab82:     	callq	0x145903d40 <.text+0x5902d40>
14551ab87:     	nop
14551ab88:     	jmp	0x14551ac36 <.text+0x5519c36>
14551ab8d:     	leaq	0x14df7d4(%rip), %r9    # 0x1469fa368
14551ab94:     	movl	$0x22, %ecx
14551ab99:     	movl	$0x24, %edx
14551ab9e:     	movq	0x148(%rbp), %r8
14551aba5:     	callq	0x145903d40 <.text+0x5902d40>
14551abaa:     	nop
14551abab:     	jmp	0x14551ac36 <.text+0x5519c36>
14551abb0:     	movl	$0x1, %ecx
14551abb5:     	movl	$0x18, %edx
14551abba:     	callq	0x14590379b <.text+0x590279b>
14551abbf:     	nop
14551abc0:     	jmp	0x14551ac36 <.text+0x5519c36>
14551abc2:     	movb	$0x0, 0x237(%rbp)
14551abc9:     	leaq	0x14df720(%rip), %r8    # 0x1469fa2f0
14551abd0:     	movq	0x1e8(%rbp), %rcx
14551abd7:     	movq	%rbx, %rdx
14551abda:     	callq	0x145903b33 <.text+0x5902b33>
14551abdf:     	nop
14551abe0:     	jmp	0x14551ac36 <.text+0x5519c36>
14551abe2:     	movl	$0x1, %ecx
14551abe7:     	movl	$0x20, %edx
14551abec:     	callq	0x14590379b <.text+0x590279b>
14551abf1:     	nop
14551abf2:     	jmp	0x14551ac36 <.text+0x5519c36>
14551abf4:     	movb	$0x0, 0x236(%rbp)
14551abfb:     	leaq	0x14df6c6(%rip), %r8    # 0x1469fa2c8
14551ac02:     	movq	0x1e8(%rbp), %rcx
14551ac09:     	movq	%rsi, %rdx
14551ac0c:     	callq	0x145903b33 <.text+0x5902b33>
14551ac11:     	nop
14551ac12:     	jmp	0x14551ac36 <.text+0x5519c36>
14551ac14:     	movl	$0x1, %ecx
14551ac19:     	movl	$0x20, %edx
14551ac1e:     	callq	0x14590379b <.text+0x590279b>
14551ac23:     	nop
14551ac24:     	jmp	0x14551ac36 <.text+0x5519c36>
14551ac26:     	movl	$0x1, %ecx
14551ac2b:     	movl	$0xa, %edx
14551ac30:     	callq	0x14590379b <.text+0x590279b>
14551ac35:     	nop
14551ac36:     	ud2
