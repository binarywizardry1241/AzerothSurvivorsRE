
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455252d0:     	pushq	%r15
1455252d2:     	pushq	%r14
1455252d4:     	pushq	%r13
1455252d6:     	pushq	%r12
1455252d8:     	pushq	%rsi
1455252d9:     	pushq	%rdi
1455252da:     	pushq	%rbp
1455252db:     	pushq	%rbx
1455252dc:     	subq	$0x98, %rsp
1455252e3:     	xorl	%esi, %esi
1455252e5:     	cmpb	$0x0, 0x41(%rcx)
1455252e9:     	je	0x145525304 <.text+0x5524304>
1455252eb:     	movl	%esi, %eax
1455252ed:     	movl	%r15d, %edx
1455252f0:     	addq	$0x98, %rsp
1455252f7:     	popq	%rbx
1455252f8:     	popq	%rbp
1455252f9:     	popq	%rdi
1455252fa:     	popq	%rsi
1455252fb:     	popq	%r12
1455252fd:     	popq	%r13
1455252ff:     	popq	%r14
145525301:     	popq	%r15
145525303:     	retq
145525304:     	movq	%rcx, %rdi
145525307:     	leaq	0x10(%rcx), %rbx
14552530b:     	leaq	0x28(%rsp), %r14
145525310:     	movl	$0xa, %ebp
145525315:     	jmp	0x145525336 <.text+0x5524336>
145525317:     	testb	%bpl, %bpl
14552531a:     	movl	$0xa, %ebp
14552531f:     	jne	0x1455255d0 <.text+0x55245d0>
145525325:     	nopw	%cs:(%rax,%rax)
145525330:     	cmpb	$0x1, 0x41(%rdi)
145525334:     	je	0x1455252eb <.text+0x55242eb>
145525336:     	movq	(%rbx), %r15
145525339:     	movq	%r14, %rcx
14552533c:     	movq	%rbx, %rdx
14552533f:     	callq	0x1455336a0 <.text+0x55326a0>
145525344:     	cmpl	$0x1, 0x28(%rsp)
145525349:     	jne	0x145525370 <.text+0x5524370>
14552534b:     	movq	0x30(%rsp), %r8
145525350:     	movq	0x38(%rsp), %rax
145525355:     	movq	(%rdi), %rcx
145525358:     	subq	%rcx, %r8
14552535b:     	addq	%rcx, %r15
14552535e:     	movq	%rax, (%rdi)
145525361:     	testq	%r8, %r8
145525364:     	jne	0x14552539e <.text+0x552439e>
145525366:     	jmp	0x145525330 <.text+0x5524330>
145525368:     	nopl	(%rax,%rax)
145525370:     	cmpb	$0x0, 0x41(%rdi)
145525374:     	jne	0x1455252eb <.text+0x55242eb>
14552537a:     	movb	$0x1, 0x41(%rdi)
14552537e:     	movq	(%rdi), %r15
145525381:     	movq	0x8(%rdi), %r8
145525385:     	subq	%r15, %r8
145525388:     	setne	%al
14552538b:     	orb	0x40(%rdi), %al
14552538e:     	cmpb	$0x1, %al
145525390:     	jne	0x1455252eb <.text+0x55242eb>
145525396:     	addq	(%rbx), %r15
145525399:     	testq	%r8, %r8
14552539c:     	je	0x145525330 <.text+0x5524330>
14552539e:     	cmpq	$0x1, %r8
1455253a2:     	jne	0x1455253c0 <.text+0x55243c0>
1455253a4:     	movzbl	(%r15), %ecx
1455253a8:     	cmpl	$0x2b, %ecx
1455253ab:     	je	0x145525330 <.text+0x5524330>
1455253ad:     	cmpl	$0x2d, %ecx
1455253b0:     	je	0x145525330 <.text+0x5524330>
1455253b6:     	jmp	0x1455253c4 <.text+0x55243c4>
1455253b8:     	nopl	(%rax,%rax)
1455253c0:     	movzbl	(%r15), %ecx
1455253c4:     	xorl	%eax, %eax
1455253c6:     	cmpb	$0x2b, %cl
1455253c9:     	sete	%al
1455253cc:     	movq	%r8, %rcx
1455253cf:     	subq	%rax, %rcx
1455253d2:     	addq	%rax, %r15
1455253d5:     	cmpq	$0x9, %rcx
1455253d9:     	jae	0x1455254f0 <.text+0x55244f0>
1455253df:     	testq	%rcx, %rcx
1455253e2:     	je	0x145525532 <.text+0x5524532>
1455253e8:     	movzbl	(%r15), %eax
1455253ec:     	addl	$-0x30, %eax
1455253ef:     	cmpl	$0x9, %eax
1455253f2:     	ja	0x145525330 <.text+0x5524330>
1455253f8:     	cmpq	$0x1, %rcx
1455253fc:     	je	0x145525534 <.text+0x5524534>
145525402:     	movzbl	0x1(%r15), %edx
145525407:     	addl	$-0x30, %edx
14552540a:     	cmpl	$0x9, %edx
14552540d:     	ja	0x145525330 <.text+0x5524330>
145525413:     	leal	(%rax,%rax,4), %eax
145525416:     	leal	(%rdx,%rax,2), %eax
145525419:     	cmpq	$0x2, %rcx
14552541d:     	je	0x145525534 <.text+0x5524534>
145525423:     	movzbl	0x2(%r15), %edx
145525428:     	addl	$-0x30, %edx
14552542b:     	cmpl	$0x9, %edx
14552542e:     	ja	0x145525330 <.text+0x5524330>
145525434:     	leal	(%rax,%rax,4), %eax
145525437:     	leal	(%rdx,%rax,2), %eax
14552543a:     	cmpq	$0x3, %rcx
14552543e:     	je	0x145525534 <.text+0x5524534>
145525444:     	movzbl	0x3(%r15), %edx
145525449:     	addl	$-0x30, %edx
14552544c:     	cmpl	$0x9, %edx
14552544f:     	ja	0x145525330 <.text+0x5524330>
145525455:     	leal	(%rax,%rax,4), %eax
145525458:     	leal	(%rdx,%rax,2), %eax
14552545b:     	cmpq	$0x4, %rcx
14552545f:     	je	0x145525534 <.text+0x5524534>
145525465:     	movzbl	0x4(%r15), %edx
14552546a:     	addl	$-0x30, %edx
14552546d:     	cmpl	$0x9, %edx
145525470:     	ja	0x145525330 <.text+0x5524330>
145525476:     	leal	(%rax,%rax,4), %eax
145525479:     	leal	(%rdx,%rax,2), %eax
14552547c:     	cmpq	$0x5, %rcx
145525480:     	je	0x145525534 <.text+0x5524534>
145525486:     	movzbl	0x5(%r15), %edx
14552548b:     	addl	$-0x30, %edx
14552548e:     	cmpl	$0x9, %edx
145525491:     	ja	0x145525330 <.text+0x5524330>
145525497:     	leal	(%rax,%rax,4), %eax
14552549a:     	leal	(%rdx,%rax,2), %eax
14552549d:     	cmpq	$0x6, %rcx
1455254a1:     	je	0x145525534 <.text+0x5524534>
1455254a7:     	movzbl	0x6(%r15), %edx
1455254ac:     	addl	$-0x30, %edx
1455254af:     	cmpl	$0x9, %edx
1455254b2:     	ja	0x145525330 <.text+0x5524330>
1455254b8:     	leal	(%rax,%rax,4), %eax
1455254bb:     	leal	(%rdx,%rax,2), %eax
1455254be:     	cmpq	$0x7, %rcx
1455254c2:     	je	0x145525534 <.text+0x5524534>
1455254c4:     	movzbl	0x7(%r15), %ecx
1455254c9:     	addl	$-0x30, %ecx
1455254cc:     	cmpl	$0x9, %ecx
1455254cf:     	ja	0x145525330 <.text+0x5524330>
1455254d5:     	leal	(%rax,%rax,4), %eax
1455254d8:     	leal	(%rcx,%rax,2), %eax
1455254db:     	shlq	$0x20, %rax
1455254df:     	testb	$0x1, %al
1455254e1:     	jne	0x145525330 <.text+0x5524330>
1455254e7:     	jmp	0x145525540 <.text+0x5524540>
1455254e9:     	nopl	(%rax)
1455254f0:     	negq	%rax
1455254f3:     	addq	%rax, %r8
1455254f6:     	negq	%r8
1455254f9:     	xorl	%eax, %eax
1455254fb:     	xorl	%ecx, %ecx
1455254fd:     	movq	%r8, %rdx
145525500:     	addq	%rcx, %rdx
145525503:     	je	0x145525534 <.text+0x5524534>
145525505:     	mull	%ebp
145525507:     	jo	0x1455255aa <.text+0x55245aa>
14552550d:     	movzbl	(%r15,%rcx), %r9d
145525512:     	addl	$-0x30, %r9d
145525516:     	addl	%r9d, %eax
145525519:     	setb	%dl
14552551c:     	cmpl	$0x9, %r9d
145525520:     	ja	0x145525330 <.text+0x5524330>
145525526:     	incq	%rcx
145525529:     	testb	%dl, %dl
14552552b:     	je	0x1455254fd <.text+0x55244fd>
14552552d:     	jmp	0x145525330 <.text+0x5524330>
145525532:     	xorl	%eax, %eax
145525534:     	shlq	$0x20, %rax
145525538:     	testb	$0x1, %al
14552553a:     	jne	0x145525330 <.text+0x5524330>
145525540:     	shrq	$0x20, %rax
145525544:     	movq	%r14, %rcx
145525547:     	movq	%rax, %r15
14552554a:     	movl	%eax, %edx
14552554c:     	callq	0x14545a320 <.text+0x5459320>
145525551:     	movq	0x28(%rsp), %rdx
145525556:     	cmpq	$-0x1, %rdx
14552555a:     	je	0x145525330 <.text+0x5524330>
145525560:     	movq	0x40(%rsp), %r12
145525565:     	movq	0x48(%rsp), %r13
14552556a:     	movzbl	0x91(%rsp), %ebp
145525572:     	testq	%rdx, %rdx
145525575:     	je	0x145525587 <.text+0x5524587>
145525577:     	movq	0x30(%rsp), %rcx
14552557c:     	movl	$0x1, %r8d
145525582:     	callq	0x1400021d0 <.text+0x11d0>
145525587:     	testq	%r12, %r12
14552558a:     	je	0x145525317 <.text+0x5524317>
145525590:     	shlq	$0x3, %r12
145525594:     	movl	$0x4, %r8d
14552559a:     	movq	%r13, %rcx
14552559d:     	movq	%r12, %rdx
1455255a0:     	callq	0x1400021d0 <.text+0x11d0>
1455255a5:     	jmp	0x145525317 <.text+0x5524317>
1455255aa:     	movzbl	(%r15,%rcx), %ecx
1455255af:     	addb	$-0x30, %cl
1455255b2:     	xorl	%eax, %eax
1455255b4:     	cmpb	$0xa, %cl
1455255b7:     	setb	%al
1455255ba:     	shll	$0x8, %eax
1455255bd:     	addq	$0x101, %rax            # imm = 0x101
1455255c3:     	testb	$0x1, %al
1455255c5:     	jne	0x145525330 <.text+0x5524330>
1455255cb:     	jmp	0x145525540 <.text+0x5524540>
1455255d0:     	movl	$0x1, %esi
1455255d5:     	jmp	0x1455252eb <.text+0x55242eb>
