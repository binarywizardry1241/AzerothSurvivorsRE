
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140255270:     	pushq	%rbp
140255271:     	pushq	%r15
140255273:     	pushq	%r14
140255275:     	pushq	%r13
140255277:     	pushq	%r12
140255279:     	pushq	%rsi
14025527a:     	pushq	%rdi
14025527b:     	pushq	%rbx
14025527c:     	subq	$0x2d8, %rsp            # imm = 0x2D8
140255283:     	leaq	0x80(%rsp), %rbp
14025528b:     	movq	$-0x2, 0x250(%rbp)
140255296:     	movq	(%rdx), %rax
140255299:     	movq	0x8(%rdx), %rcx
14025529d:     	movq	(%rax), %rdx
1402552a0:     	xorl	%r10d, %r10d
1402552a3:     	movq	%rdx, %rbx
1402552a6:     	subq	0x18(%rcx), %rbx
1402552aa:     	cmovbq	%r10, %rbx
1402552ae:     	subq	0x38(%rcx), %rdx
1402552b2:     	cmovbq	%r10, %rdx
1402552b6:     	leaq	(%rbx,%rbx,2), %rsi
1402552ba:     	shlq	$0x3, %rsi
1402552be:     	addq	0x8(%rcx), %rsi
1402552c2:     	movq	0x10(%rcx), %r14
1402552c6:     	movq	0x30(%rcx), %r15
1402552ca:     	leaq	(%rdx,%rdx,2), %r11
1402552ce:     	shlq	$0x3, %r11
1402552d2:     	addq	0x28(%rcx), %r11
1402552d6:     	movq	%r14, %r12
1402552d9:     	subq	%rbx, %r12
1402552dc:     	cmovbq	%r10, %r12
1402552e0:     	movl	$0x8, %edi
1402552e5:     	cmovbq	%rdi, %rsi
1402552e9:     	cmovbq	%r14, %rbx
1402552ed:     	movq	%r15, %r13
1402552f0:     	subq	%rdx, %r13
1402552f3:     	cmovbq	%rdi, %r11
1402552f7:     	cmovbq	%r10, %r13
1402552fb:     	cmovbq	%r15, %rdx
1402552ff:     	movq	0x40(%rcx), %rcx
140255303:     	addq	%rcx, %rdx
140255306:     	subq	%r13, %rcx
140255309:     	subq	%r12, %rcx
14025530c:     	movq	(%r8), %r8
14025530f:     	movq	%r8, 0x220(%rbp)
140255316:     	movq	(%r9), %r8
140255319:     	movq	%r8, 0x230(%rbp)
140255320:     	movq	0x8(%r9), %r8
140255324:     	movq	%r8, 0x218(%rbp)
14025532b:     	movq	0x2c0(%rbp), %r8
140255332:     	movq	(%r8), %r8
140255335:     	movq	0x2c8(%rbp), %r9
14025533c:     	movq	(%r9), %r9
14025533f:     	movq	%r9, 0x228(%rbp)
140255346:     	movq	0x2d0(%rbp), %r9
14025534d:     	movq	(%r9), %rdi
140255350:     	movq	%rdi, 0x208(%rbp)
140255357:     	movq	0x10(%r9), %rdi
14025535b:     	movl	0x1c(%r9), %r9d
14025535f:     	movl	%r9d, 0x204(%rbp)
140255366:     	movq	0x2d8(%rbp), %r9
14025536d:     	movq	(%r9), %r9
140255370:     	movq	%r9, 0x1e8(%rbp)
140255377:     	movq	%rcx, (%rax)
14025537a:     	addq	%rbx, %rdx
14025537d:     	subq	%r15, %rdx
140255380:     	subq	%r14, %rdx
140255383:     	leaq	(%r12,%r12,2), %rcx
140255387:     	leaq	(%rsi,%rcx,8), %r9
14025538b:     	leaq	(,%r13,2), %rcx
140255393:     	addq	%r13, %rcx
140255396:     	leaq	(%r11,%rcx,8), %rbx
14025539a:     	incq	%rdx
14025539d:     	xorl	%r14d, %r14d
1402553a0:     	jmp	0x1402553d1 <.text+0x2543d1>
1402553a2:     	nopw	%cs:(%rax,%rax)
1402553b0:     	leaq	0x18(%rsi), %r15
1402553b4:     	movq	%rdx, (%rax)
1402553b7:     	movzbl	0x14(%rsi), %ecx
1402553bb:     	xorq	$0x1, %rcx
1402553bf:     	cmpw	$0x1, 0x10(%rsi)
1402553c4:     	cmovneq	%r10, %rcx
1402553c8:     	addq	%rcx, %r14
1402553cb:     	incq	%rdx
1402553ce:     	movq	%r15, %rsi
1402553d1:     	testq	%rsi, %rsi
1402553d4:     	je	0x1402553db <.text+0x2543db>
1402553d6:     	cmpq	%r9, %rsi
1402553d9:     	jne	0x1402553b0 <.text+0x2543b0>
1402553db:     	testq	%r11, %r11
1402553de:     	je	0x1402553f1 <.text+0x2543f1>
1402553e0:     	cmpq	%rbx, %r11
1402553e3:     	je	0x1402553f1 <.text+0x2543f1>
1402553e5:     	movq	%r11, %rsi
1402553e8:     	addq	$0x18, %r11
1402553ec:     	xorl	%r15d, %r15d
1402553ef:     	jmp	0x1402553b4 <.text+0x2543b4>
1402553f1:     	testq	%r14, %r14
1402553f4:     	je	0x140255a59 <.text+0x254a59>
1402553fa:     	cmpb	$0x1, 0x72(%r8)
1402553ff:     	jne	0x140255a59 <.text+0x254a59>
140255405:     	movq	%rdi, 0x1f0(%rbp)
14025540c:     	movl	$0x3d, 0x90(%rbp)
140255416:     	movl	$0x3e, 0x9c(%rbp)
140255420:     	leaq	0x90(%rbp), %rdx
140255427:     	movq	0x220(%rbp), %rcx
14025542e:     	callq	0x1400320d0 <.text+0x310d0>
140255433:     	movb	%al, 0x24e(%rbp)
140255439:     	movq	0x228(%rbp), %rax
140255440:     	movzbl	0x38(%rax), %r8d
140255445:     	movzbl	0x39(%rax), %r9d
14025544a:     	leaq	-0x58(%rbp), %rcx
14025544e:     	movq	0x208(%rbp), %rdx
140255455:     	callq	0x145436120 <.text+0x5435120>
14025545a:     	movq	0x230(%rbp), %rcx
140255461:     	movq	0xf8(%rcx), %r15
140255468:     	movq	0x100(%rcx), %rax
14025546f:     	leaq	(%r15,%rax,4), %rbx
140255473:     	movzbl	0x108(%rcx), %r11d
14025547b:     	movl	$0x8, %eax
140255480:     	movq	%rax, 0x1f8(%rbp)
140255487:     	movl	$0x0, 0x248(%rbp)
140255491:     	xorl	%r14d, %r14d
140255494:     	xorl	%r13d, %r13d
140255497:     	movl	$0x0, 0x244(%rbp)
1402554a1:     	movl	$0x0, 0x240(%rbp)
1402554ab:     	xorl	%r8d, %r8d
1402554ae:     	xorl	%r12d, %r12d
1402554b1:     	movq	0x218(%rbp), %rsi
1402554b8:     	movq	%rbx, 0x210(%rbp)
1402554bf:     	movb	%r11b, 0x24f(%rbp)
1402554c6:     	jmp	0x1402554e5 <.text+0x2544e5>
1402554c8:     	nopl	(%rax,%rax)
1402554d0:     	movq	0x220(%rbp), %r14
1402554d7:     	movq	0x228(%rbp), %r13
1402554de:     	movl	0x200(%rbp), %r8d
1402554e5:     	testb	%r11b, %r11b
1402554e8:     	je	0x140255590 <.text+0x254590>
1402554ee:     	cmpl	%r8d, %r12d
1402554f1:     	jne	0x1402556d4 <.text+0x2546d4>
1402554f7:     	nopw	(%rax,%rax)
140255500:     	cmpq	%rbx, %r15
140255503:     	je	0x140255640 <.text+0x254640>
140255509:     	movl	(%r15), %eax
14025550c:     	addq	$0x4, %r15
140255510:     	movq	0x1a8(%rsi), %rcx
140255517:     	leaq	(%rax,%rax,8), %rdx
14025551b:     	movq	0x10(%rcx,%rdx,8), %rax
140255520:     	testq	%rax, %rax
140255523:     	je	0x140255500 <.text+0x254500>
140255525:     	leaq	(%rcx,%rdx,8), %rcx
140255529:     	movq	0x230(%rbp), %rdx
140255530:     	movq	0x110(%rdx), %r8
140255537:     	movq	0x40(%rcx), %rdx
14025553b:     	cmpq	%rdx, %r8
14025553e:     	jae	0x140255653 <.text+0x254653>
140255544:     	movq	0x38(%rcx), %r9
140255548:     	movq	(%r9,%r8,8), %r8
14025554c:     	testq	%r8, %r8
14025554f:     	je	0x140255653 <.text+0x254653>
140255555:     	movq	0x18(%rcx), %r9
140255559:     	notq	%r8
14025555c:     	leaq	(%r8,%r8,2), %r8
140255560:     	shlq	$0x4, %r8
140255564:     	movq	0x10(%r9,%r8), %r14
140255569:     	movq	0x230(%rbp), %r8
140255570:     	movq	0x118(%r8), %r8
140255577:     	cmpq	%rdx, %r8
14025557a:     	jb	0x140255669 <.text+0x254669>
140255580:     	jmp	0x1402556c5 <.text+0x2546c5>
140255585:     	nopw	%cs:(%rax,%rax)
140255590:     	cmpl	%r8d, %r12d
140255593:     	jne	0x1402556f6 <.text+0x2546f6>
140255599:     	nopl	(%rax)
1402555a0:     	cmpq	%rbx, %r15
1402555a3:     	je	0x140255640 <.text+0x254640>
1402555a9:     	movl	(%r15), %eax
1402555ac:     	addq	$0x4, %r15
1402555b0:     	movq	0x108(%rsi), %rcx
1402555b7:     	leaq	(%rax,%rax,4), %rdx
1402555bb:     	shlq	$0x5, %rdx
1402555bf:     	movq	0x58(%rcx,%rdx), %rax
1402555c4:     	testq	%rax, %rax
1402555c7:     	je	0x1402555a0 <.text+0x2545a0>
1402555c9:     	addq	%rdx, %rcx
1402555cc:     	movl	0x94(%rcx), %edx
1402555d2:     	movq	0x1a8(%rsi), %r8
1402555d9:     	leaq	(%rdx,%rdx,8), %r10
1402555dd:     	leaq	(%r8,%r10,8), %rdx
1402555e1:     	movq	0x230(%rbp), %r9
1402555e8:     	movq	0x110(%r9), %r9
1402555ef:     	movq	0x40(%r8,%r10,8), %r8
1402555f4:     	cmpq	%r8, %r9
1402555f7:     	jae	0x14025568c <.text+0x25468c>
1402555fd:     	movq	0x38(%rdx), %r10
140255601:     	movq	(%r10,%r9,8), %r9
140255605:     	testq	%r9, %r9
140255608:     	je	0x14025568c <.text+0x25468c>
14025560e:     	movq	0x18(%rdx), %r10
140255612:     	notq	%r9
140255615:     	leaq	(%r9,%r9,2), %r9
140255619:     	shlq	$0x4, %r9
14025561d:     	movq	0x10(%r10,%r9), %r14
140255622:     	movq	0x230(%rbp), %r9
140255629:     	movq	0x118(%r9), %r9
140255630:     	cmpq	%r8, %r9
140255633:     	jb	0x1402556a2 <.text+0x2546a2>
140255635:     	jmp	0x1402556dc <.text+0x2546dc>
14025563a:     	nopw	(%rax,%rax)
140255640:     	movl	%r8d, %r12d
140255643:     	xorl	%ecx, %ecx
140255645:     	testq	%rcx, %rcx
140255648:     	jne	0x140255728 <.text+0x254728>
14025564e:     	jmp	0x1402559f5 <.text+0x2549f5>
140255653:     	xorl	%r14d, %r14d
140255656:     	movq	0x230(%rbp), %r8
14025565d:     	movq	0x118(%r8), %r8
140255664:     	cmpq	%rdx, %r8
140255667:     	jae	0x1402556c5 <.text+0x2546c5>
140255669:     	movq	0x38(%rcx), %rdx
14025566d:     	movq	(%rdx,%r8,8), %rdx
140255671:     	testq	%rdx, %rdx
140255674:     	je	0x1402556c5 <.text+0x2546c5>
140255676:     	movq	0x18(%rcx), %rcx
14025567a:     	notq	%rdx
14025567d:     	leaq	(%rdx,%rdx,2), %rdx
140255681:     	shlq	$0x4, %rdx
140255685:     	movq	0x10(%rcx,%rdx), %r13
14025568a:     	jmp	0x1402556c8 <.text+0x2546c8>
14025568c:     	xorl	%r14d, %r14d
14025568f:     	movq	0x230(%rbp), %r9
140255696:     	movq	0x118(%r9), %r9
14025569d:     	cmpq	%r8, %r9
1402556a0:     	jae	0x1402556dc <.text+0x2546dc>
1402556a2:     	movq	0x38(%rdx), %r8
1402556a6:     	movq	(%r8,%r9,8), %r8
1402556aa:     	testq	%r8, %r8
1402556ad:     	je	0x1402556dc <.text+0x2546dc>
1402556af:     	movq	0x18(%rdx), %rdx
1402556b3:     	notq	%r8
1402556b6:     	leaq	(%r8,%r8,2), %r8
1402556ba:     	shlq	$0x4, %r8
1402556be:     	movq	0x10(%rdx,%r8), %r13
1402556c3:     	jmp	0x1402556df <.text+0x2546df>
1402556c5:     	xorl	%r13d, %r13d
1402556c8:     	xorl	%r12d, %r12d
1402556cb:     	movl	%eax, 0x244(%rbp)
1402556d1:     	movl	%eax, %r8d
1402556d4:     	movl	%r12d, %eax
1402556d7:     	incl	%r12d
1402556da:     	jmp	0x14025570d <.text+0x25470d>
1402556dc:     	xorl	%r13d, %r13d
1402556df:     	movq	0x50(%rcx), %rcx
1402556e3:     	movq	%rcx, 0x1f8(%rbp)
1402556ea:     	xorl	%r12d, %r12d
1402556ed:     	movl	%eax, 0x244(%rbp)
1402556f3:     	movl	%eax, %r8d
1402556f6:     	movl	%r12d, %eax
1402556f9:     	shlq	$0x4, %rax
1402556fd:     	incl	%r12d
140255700:     	movq	0x1f8(%rbp), %rcx
140255707:     	movl	0x8(%rcx,%rax), %eax
14025570b:     	notl	%eax
14025570d:     	leaq	(%r14,%rax), %rcx
140255711:     	shlq	$0x4, %rax
140255715:     	addq	%r13, %rax
140255718:     	movl	%r12d, 0x240(%rbp)
14025571f:     	testq	%rcx, %rcx
140255722:     	je	0x1402559f5 <.text+0x2549f5>
140255728:     	cmpb	$0x1, (%rcx)
14025572b:     	jne	0x1402554e5 <.text+0x2544e5>
140255731:     	movl	(%rax), %ecx
140255733:     	subl	$0x2, %ecx
140255736:     	movl	$0x8, %edx
14025573b:     	cmovbl	%edx, %ecx
14025573e:     	cmpl	$0x4, %ecx
140255741:     	jne	0x140255815 <.text+0x254815>
140255747:     	movl	%r8d, 0x200(%rbp)
14025574e:     	movq	%r13, 0x228(%rbp)
140255755:     	movq	%r14, 0x220(%rbp)
14025575c:     	movl	0x4(%rax), %r14d
140255760:     	leaq	0x90(%rbp), %rcx
140255767:     	movl	%r14d, %edx
14025576a:     	movl	%r11d, %edi
14025576d:     	callq	0x14546f110 <.text+0x546e110>
140255772:     	movl	%edi, %r11d
140255775:     	movq	0x90(%rbp), %rdi
14025577c:     	cmpq	$-0x1, %rdi
140255780:     	je	0x1402554d0 <.text+0x2544d0>
140255786:     	movq	0x90(%rbp), %rsi
14025578d:     	movq	0x98(%rbp), %rbx
140255794:     	movq	0xa8(%rbp), %r13
14025579b:     	movl	%r14d, %edx
14025579e:     	movq	0xb0(%rbp), %r14
1402557a5:     	movq	0x208(%rbp), %rcx
1402557ac:     	movl	%edx, 0x23c(%rbp)
1402557b2:     	callq	0x14542f520 <.text+0x542e520>
1402557b7:     	nop
1402557b8:     	testb	%al, %al
1402557ba:     	jne	0x140255859 <.text+0x254859>
1402557c0:     	testq	%rsi, %rsi
1402557c3:     	je	0x1402557d6 <.text+0x2547d6>
1402557c5:     	movl	$0x1, %r8d
1402557cb:     	movq	%rbx, %rcx
1402557ce:     	movq	%rsi, %rdx
1402557d1:     	callq	0x1400021d0 <.text+0x11d0>
1402557d6:     	testq	%r13, %r13
1402557d9:     	movq	0x218(%rbp), %rsi
1402557e0:     	movzbl	0x24f(%rbp), %r11d
1402557e8:     	movq	0x210(%rbp), %rbx
1402557ef:     	je	0x1402554d0 <.text+0x2544d0>
1402557f5:     	shlq	$0x3, %r13
1402557f9:     	movl	$0x4, %r8d
1402557ff:     	movq	%r14, %rcx
140255802:     	movq	%r13, %rdx
140255805:     	movl	%r11d, %edi
140255808:     	callq	0x1400021d0 <.text+0x11d0>
14025580d:     	movl	%edi, %r11d
140255810:     	jmp	0x1402554d0 <.text+0x2544d0>
140255815:     	cmpl	$0x5, %ecx
140255818:     	jne	0x140255946 <.text+0x254946>
14025581e:     	movzbl	0x4(%rax), %eax
140255822:     	movzbl	%al, %ecx
140255825:     	cmpb	$0x0, 0x24e(%rbp)
14025582c:     	je	0x14025591a <.text+0x25491a>
140255832:     	cmpb	$0x13, %al
140255834:     	jae	0x140255a80 <.text+0x254a80>
14025583a:     	movl	0x248(%rbp), %eax
140255840:     	orb	-0x58(%rbp,%rcx,8), %al
140255844:     	movl	$0x0, -0x58(%rbp,%rcx,8)
14025584c:     	andb	$0x1, %al
14025584e:     	movl	%eax, 0x248(%rbp)
140255854:     	jmp	0x140255946 <.text+0x254946>
140255859:     	leaq	0x90(%rbp), %rcx
140255860:     	movq	0x68(%rcx), %rax
140255864:     	leaq	0x180(%rbp), %rdx
14025586b:     	movq	%rax, 0x60(%rdx)
14025586f:     	movups	0x58(%rcx), %xmm0
140255873:     	movups	%xmm0, 0x50(%rdx)
140255877:     	movups	0x48(%rcx), %xmm0
14025587b:     	movups	%xmm0, 0x40(%rdx)
14025587f:     	movups	0x8(%rcx), %xmm0
140255883:     	movups	0x18(%rcx), %xmm1
140255887:     	movups	0x28(%rcx), %xmm2
14025588b:     	movups	0x38(%rcx), %xmm3
14025588f:     	movups	%xmm3, 0x30(%rdx)
140255893:     	movups	%xmm2, 0x20(%rdx)
140255897:     	movups	%xmm1, 0x10(%rdx)
14025589b:     	movups	%xmm0, (%rdx)
14025589e:     	movq	%rdi, %rdx
1402558a1:     	movq	%rdi, 0x178(%rbp)
1402558a8:     	movzbl	0x1e0(%rbp), %eax
1402558af:     	movzbl	%al, %ecx
1402558b2:     	cmpb	$0x0, 0x24e(%rbp)
1402558b9:     	je	0x140255959 <.text+0x254959>
1402558bf:     	cmpb	$0x13, %al
1402558c1:     	movq	0x218(%rbp), %rsi
1402558c8:     	movzbl	0x24f(%rbp), %edi
1402558cf:     	movq	0x220(%rbp), %r14
1402558d6:     	movq	0x228(%rbp), %r13
1402558dd:     	jae	0x140255aa7 <.text+0x254aa7>
1402558e3:     	movl	$0x1, %eax
1402558e8:     	cmpb	$0x0, -0x58(%rbp,%rcx,8)
1402558ed:     	movq	0x210(%rbp), %rbx
1402558f4:     	je	0x140255907 <.text+0x254907>
1402558f6:     	xorl	%eax, %eax
1402558f8:     	movl	0x23c(%rbp), %r8d
1402558ff:     	cmpl	%r8d, -0x54(%rbp,%rcx,8)
140255904:     	setne	%al
140255907:     	movl	%eax, -0x58(%rbp,%rcx,8)
14025590b:     	movl	0x23c(%rbp), %eax
140255911:     	movl	%eax, -0x54(%rbp,%rcx,8)
140255915:     	jmp	0x14025599e <.text+0x25499e>
14025591a:     	cmpb	$0x13, %al
14025591c:     	jae	0x140255a6d <.text+0x254a6d>
140255922:     	cmpl	$0x0, 0x40(%rbp,%rcx,4)
140255927:     	movl	$0x0, 0x40(%rbp,%rcx,4)
14025592f:     	movl	0x248(%rbp), %ecx
140255935:     	movzbl	%cl, %ecx
140255938:     	movl	$0x1, %eax
14025593d:     	cmovnel	%eax, %ecx
140255940:     	movl	%ecx, 0x248(%rbp)
140255946:     	movl	0x244(%rbp), %r8d
14025594d:     	movl	0x240(%rbp), %r12d
140255954:     	jmp	0x1402554e5 <.text+0x2544e5>
140255959:     	cmpb	$0x13, %al
14025595b:     	movq	0x218(%rbp), %rsi
140255962:     	movzbl	0x24f(%rbp), %edi
140255969:     	movq	0x220(%rbp), %r14
140255970:     	movq	0x228(%rbp), %r13
140255977:     	jae	0x140255a93 <.text+0x254a93>
14025597d:     	movl	0x23c(%rbp), %eax
140255983:     	cmpl	%eax, 0x40(%rbp,%rcx,4)
140255987:     	movq	0x210(%rbp), %rbx
14025598e:     	jne	0x14025599a <.text+0x25499a>
140255990:     	movl	$0x0, 0x40(%rbp,%rcx,4)
140255998:     	jmp	0x14025599e <.text+0x25499e>
14025599a:     	movl	%eax, 0x40(%rbp,%rcx,4)
14025599e:     	testq	%rdx, %rdx
1402559a1:     	je	0x1402559b5 <.text+0x2549b5>
1402559a3:     	movq	0x180(%rbp), %rcx
1402559aa:     	movl	$0x1, %r8d
1402559b0:     	callq	0x1400021d0 <.text+0x11d0>
1402559b5:     	movq	0x190(%rbp), %rdx
1402559bc:     	testq	%rdx, %rdx
1402559bf:     	je	0x1402559d7 <.text+0x2549d7>
1402559c1:     	movq	0x198(%rbp), %rcx
1402559c8:     	shlq	$0x3, %rdx
1402559cc:     	movl	$0x4, %r8d
1402559d2:     	callq	0x1400021d0 <.text+0x11d0>
1402559d7:     	movb	$0x1, %al
1402559d9:     	movl	%eax, 0x248(%rbp)
1402559df:     	movl	0x244(%rbp), %r8d
1402559e6:     	movl	0x240(%rbp), %r12d
1402559ed:     	movl	%edi, %r11d
1402559f0:     	jmp	0x1402554e5 <.text+0x2544e5>
1402559f5:     	testb	$0x1, 0x248(%rbp)
1402559fc:     	je	0x140255a59 <.text+0x254a59>
1402559fe:     	movq	0x1f0(%rbp), %rax
140255a05:     	movl	0x204(%rbp), %ecx
140255a0b:     	movl	%ecx, (%rax)
140255a0d:     	leaq	0x90(%rbp), %rsi
140255a14:     	leaq	-0x58(%rbp), %rbx
140255a18:     	movl	$0xe8, %r8d
140255a1e:     	movq	%rsi, %rcx
140255a21:     	movq	%rbx, %rdx
140255a24:     	callq	0x1457731ed <.text+0x57721ed>
140255a29:     	movq	0x208(%rbp), %rcx
140255a30:     	movq	%rsi, %rdx
140255a33:     	callq	0x14542e950 <.text+0x542d950>
140255a38:     	movl	$0xe8, %r8d
140255a3e:     	movq	%rsi, %rcx
140255a41:     	movq	%rbx, %rdx
140255a44:     	callq	0x1457731ed <.text+0x57721ed>
140255a49:     	movq	0x1e8(%rbp), %rcx
140255a50:     	movq	%rsi, %rdx
140255a53:     	callq	0x140044cc0 <.text+0x43cc0>
140255a58:     	nop
140255a59:     	addq	$0x2d8, %rsp            # imm = 0x2D8
140255a60:     	popq	%rbx
140255a61:     	popq	%rdi
140255a62:     	popq	%rsi
140255a63:     	popq	%r12
140255a65:     	popq	%r13
140255a67:     	popq	%r14
140255a69:     	popq	%r15
140255a6b:     	popq	%rbp
140255a6c:     	retq
140255a6d:     	leaq	0x56f9e24(%rip), %r8    # 0x14594f898
140255a74:     	movl	$0x13, %edx
140255a79:     	callq	0x145903b33 <.text+0x5902b33>
140255a7e:     	ud2
140255a80:     	leaq	0x56f9e29(%rip), %r8    # 0x14594f8b0
140255a87:     	movl	$0x13, %edx
140255a8c:     	callq	0x145903b33 <.text+0x5902b33>
140255a91:     	ud2
140255a93:     	leaq	0x56f9dce(%rip), %r8    # 0x14594f868
140255a9a:     	movl	$0x13, %edx
140255a9f:     	callq	0x145903b33 <.text+0x5902b33>
140255aa4:     	nop
140255aa5:     	jmp	0x140255ab9 <.text+0x254ab9>
140255aa7:     	leaq	0x56f9dd2(%rip), %r8    # 0x14594f880
140255aae:     	movl	$0x13, %edx
140255ab3:     	callq	0x145903b33 <.text+0x5902b33>
140255ab8:     	nop
140255ab9:     	ud2
