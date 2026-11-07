
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145523330:     	pushq	%r15
145523332:     	pushq	%r14
145523334:     	pushq	%r13
145523336:     	pushq	%r12
145523338:     	pushq	%rsi
145523339:     	pushq	%rdi
14552333a:     	pushq	%rbp
14552333b:     	pushq	%rbx
14552333c:     	subq	$0x58, %rsp
145523340:     	movq	%rcx, 0x38(%rsp)
145523345:     	movq	0x10(%rcx), %rax
145523349:     	movq	%rax, 0x28(%rsp)
14552334e:     	testq	%rax, %rax
145523351:     	je	0x1455234d4 <.text+0x55224d4>
145523357:     	movq	0x38(%rsp), %rax
14552335c:     	movq	0x8(%rax), %rbp
145523360:     	movq	(%rdx), %rcx
145523363:     	movq	0x8(%rdx), %rax
145523367:     	movq	%rax, 0x30(%rsp)
14552336c:     	movq	0x8(%r8), %rsi
145523370:     	movq	0x10(%r8), %r8
145523374:     	leaq	(,%r8,8), %rax
14552337c:     	movq	0x10(%rdx), %rdx
145523380:     	movq	%rdx, 0x20(%rsp)
145523385:     	leaq	(%rax,%rax,2), %rdi
145523389:     	movq	%rcx, 0x50(%rsp)
14552338e:     	cmpq	$-0x1, %rcx
145523392:     	movq	%r8, 0x48(%rsp)
145523397:     	je	0x145523466 <.text+0x5522466>
14552339d:     	xorl	%r13d, %r13d
1455233a0:     	testq	%r8, %r8
1455233a3:     	jne	0x1455233be <.text+0x55223be>
1455233a5:     	movq	%rbp, %r14
1455233a8:     	jmp	0x145523442 <.text+0x5522442>
1455233ad:     	nopl	(%rax)
1455233b0:     	incq	%r13
1455233b3:     	cmpq	0x28(%rsp), %r13
1455233b8:     	je	0x1455234d4 <.text+0x55224d4>
1455233be:     	imulq	$0x70, %r13, %rax
1455233c2:     	leaq	(%rax,%rbp), %r14
1455233c6:     	movq	0x8(%rbp,%rax), %r15
1455233cb:     	movq	0x10(%rbp,%rax), %r12
1455233d0:     	cmpq	0x20(%rsp), %r12
1455233d5:     	jne	0x1455233f1 <.text+0x55223f1>
1455233d7:     	movq	%r15, %rcx
1455233da:     	movq	0x30(%rsp), %rdx
1455233df:     	movq	0x20(%rsp), %r8
1455233e4:     	callq	0x145756dd7 <.text+0x5755dd7>
1455233e9:     	testl	%eax, %eax
1455233eb:     	je	0x1455234b4 <.text+0x55224b4>
1455233f1:     	xorl	%ebx, %ebx
1455233f3:     	jmp	0x145523409 <.text+0x5522409>
1455233f5:     	nopw	%cs:(%rax,%rax)
145523400:     	addq	$0x18, %rbx
145523404:     	cmpq	%rbx, %rdi
145523407:     	je	0x1455233b0 <.text+0x55223b0>
145523409:     	cmpq	%r12, 0x10(%rsi,%rbx)
14552340e:     	jne	0x145523400 <.text+0x5522400>
145523410:     	movq	0x8(%rsi,%rbx), %rcx
145523415:     	movq	%r15, %rdx
145523418:     	movq	%r12, %r8
14552341b:     	callq	0x145756dd7 <.text+0x5755dd7>
145523420:     	testl	%eax, %eax
145523422:     	jne	0x145523400 <.text+0x5522400>
145523424:     	jmp	0x1455234b4 <.text+0x55224b4>
145523429:     	nopl	(%rax)
145523430:     	incq	%r13
145523433:     	addq	$0x70, %r14
145523437:     	cmpq	%r13, 0x28(%rsp)
14552343c:     	je	0x1455234d4 <.text+0x55224d4>
145523442:     	movq	0x20(%rsp), %rax
145523447:     	cmpq	%rax, 0x10(%r14)
14552344b:     	jne	0x145523430 <.text+0x5522430>
14552344d:     	movq	0x8(%r14), %rcx
145523451:     	movq	0x30(%rsp), %rdx
145523456:     	movq	0x20(%rsp), %r8
14552345b:     	callq	0x145756dd7 <.text+0x5755dd7>
145523460:     	testl	%eax, %eax
145523462:     	jne	0x145523430 <.text+0x5522430>
145523464:     	jmp	0x1455234b4 <.text+0x55224b4>
145523466:     	testq	%r8, %r8
145523469:     	je	0x1455234d4 <.text+0x55224d4>
14552346b:     	xorl	%r13d, %r13d
14552346e:     	jmp	0x14552347a <.text+0x552247a>
145523470:     	incq	%r13
145523473:     	cmpq	0x28(%rsp), %r13
145523478:     	je	0x1455234d4 <.text+0x55224d4>
14552347a:     	imulq	$0x70, %r13, %rax
14552347e:     	leaq	(%rax,%rbp), %r14
145523482:     	movq	0x8(%rbp,%rax), %r15
145523487:     	movq	0x10(%rbp,%rax), %r12
14552348c:     	xorl	%ebx, %ebx
14552348e:     	jmp	0x145523499 <.text+0x5522499>
145523490:     	addq	$0x18, %rbx
145523494:     	cmpq	%rbx, %rdi
145523497:     	je	0x145523470 <.text+0x5522470>
145523499:     	cmpq	%r12, 0x10(%rsi,%rbx)
14552349e:     	jne	0x145523490 <.text+0x5522490>
1455234a0:     	movq	0x8(%rsi,%rbx), %rcx
1455234a5:     	movq	%r15, %rdx
1455234a8:     	movq	%r12, %r8
1455234ab:     	callq	0x145756dd7 <.text+0x5755dd7>
1455234b0:     	testl	%eax, %eax
1455234b2:     	jne	0x145523490 <.text+0x5522490>
1455234b4:     	movq	%r14, %rcx
1455234b7:     	callq	0x140272770 <.text+0x271770>
1455234bc:     	leaq	0x1(%r13), %rbx
1455234c0:     	cmpq	0x28(%rsp), %rbx
1455234c5:     	jb	0x145523556 <.text+0x5522556>
1455234cb:     	movq	0x38(%rsp), %rax
1455234d0:     	movq	%r13, 0x10(%rax)
1455234d4:     	addq	$0x58, %rsp
1455234d8:     	popq	%rbx
1455234d9:     	popq	%rbp
1455234da:     	popq	%rdi
1455234db:     	popq	%rsi
1455234dc:     	popq	%r12
1455234de:     	popq	%r13
1455234e0:     	popq	%r14
1455234e2:     	popq	%r15
1455234e4:     	retq
1455234e5:     	nopw	%cs:(%rax,%rax)
1455234f0:     	imulq	$0x70, %r13, %rax
1455234f4:     	movups	0x60(%r12), %xmm0
1455234fa:     	movups	%xmm0, 0x60(%rbp,%rax)
1455234ff:     	movups	0x50(%r12), %xmm0
145523505:     	movups	%xmm0, 0x50(%rbp,%rax)
14552350a:     	movups	0x40(%r12), %xmm0
145523510:     	movups	%xmm0, 0x40(%rbp,%rax)
145523515:     	movups	(%r12), %xmm0
14552351a:     	movups	0x10(%r12), %xmm1
145523520:     	movups	0x20(%r12), %xmm2
145523526:     	movups	0x30(%r12), %xmm3
14552352c:     	movups	%xmm3, 0x30(%rbp,%rax)
145523531:     	movups	%xmm2, 0x20(%rbp,%rax)
145523536:     	movups	%xmm1, 0x10(%rbp,%rax)
14552353b:     	movups	%xmm0, (%rbp,%rax)
145523540:     	incq	%r13
145523543:     	movq	0x40(%rsp), %rbx
145523548:     	incq	%rbx
14552354b:     	cmpq	0x28(%rsp), %rbx
145523550:     	je	0x1455234cb <.text+0x55224cb>
145523556:     	imulq	$0x70, %rbx, %r12
14552355a:     	addq	%rbp, %r12
14552355d:     	cmpq	$-0x1, 0x50(%rsp)
145523563:     	je	0x14552358c <.text+0x552258c>
145523565:     	movq	0x20(%rsp), %rax
14552356a:     	cmpq	%rax, 0x10(%r12)
14552356f:     	jne	0x14552358c <.text+0x552258c>
145523571:     	movq	0x8(%r12), %r14
145523576:     	movq	%r14, %rcx
145523579:     	movq	0x30(%rsp), %rdx
14552357e:     	movq	0x20(%rsp), %r8
145523583:     	callq	0x145756dd7 <.text+0x5755dd7>
145523588:     	testl	%eax, %eax
14552358a:     	je	0x1455235dd <.text+0x55225dd>
14552358c:     	movq	%rbx, 0x40(%rsp)
145523591:     	cmpq	$0x0, 0x48(%rsp)
145523597:     	je	0x1455234f0 <.text+0x55224f0>
14552359d:     	movq	0x8(%r12), %r14
1455235a2:     	movq	0x10(%r12), %r15
1455235a7:     	xorl	%ebx, %ebx
1455235a9:     	jmp	0x1455235bd <.text+0x55225bd>
1455235ab:     	nopl	(%rax,%rax)
1455235b0:     	addq	$0x18, %rbx
1455235b4:     	cmpq	%rbx, %rdi
1455235b7:     	je	0x1455234f0 <.text+0x55224f0>
1455235bd:     	cmpq	%r15, 0x10(%rsi,%rbx)
1455235c2:     	jne	0x1455235b0 <.text+0x55225b0>
1455235c4:     	movq	0x8(%rsi,%rbx), %rcx
1455235c9:     	movq	%r14, %rdx
1455235cc:     	movq	%r15, %r8
1455235cf:     	callq	0x145756dd7 <.text+0x5755dd7>
1455235d4:     	testl	%eax, %eax
1455235d6:     	jne	0x1455235b0 <.text+0x55225b0>
1455235d8:     	movq	0x40(%rsp), %rbx
1455235dd:     	movq	(%r12), %rdx
1455235e1:     	testq	%rdx, %rdx
1455235e4:     	je	0x1455235f4 <.text+0x55225f4>
1455235e6:     	movl	$0x1, %r8d
1455235ec:     	movq	%r14, %rcx
1455235ef:     	callq	0x1400021d0 <.text+0x11d0>
1455235f4:     	movq	0x18(%r12), %rdx
1455235f9:     	testq	%rdx, %rdx
1455235fc:     	je	0x14552360e <.text+0x552260e>
1455235fe:     	movq	0x20(%r12), %rcx
145523603:     	movl	$0x1, %r8d
145523609:     	callq	0x1400021d0 <.text+0x11d0>
14552360e:     	movq	0x30(%r12), %rdx
145523613:     	testq	%rdx, %rdx
145523616:     	je	0x145523548 <.text+0x5522548>
14552361c:     	movq	0x38(%r12), %rcx
145523621:     	shlq	$0x6, %rdx
145523625:     	movl	$0x8, %r8d
14552362b:     	callq	0x1400021d0 <.text+0x11d0>
145523630:     	jmp	0x145523548 <.text+0x5522548>
