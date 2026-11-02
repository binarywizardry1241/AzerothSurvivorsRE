
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455131e0:     	pushq	%r15
1455131e2:     	pushq	%r14
1455131e4:     	pushq	%r13
1455131e6:     	pushq	%r12
1455131e8:     	pushq	%rsi
1455131e9:     	pushq	%rdi
1455131ea:     	pushq	%rbp
1455131eb:     	pushq	%rbx
1455131ec:     	subq	$0xb8, %rsp
1455131f3:     	cmpb	$0x0, 0x41(%rcx)
1455131f7:     	je	0x145513219 <.text+0x5512219>
1455131f9:     	xorl	%eax, %eax
1455131fb:     	movq	%rcx, 0x30(%rsp)
145513200:     	movq	0x30(%rsp), %rdx
145513205:     	addq	$0xb8, %rsp
14551320c:     	popq	%rbx
14551320d:     	popq	%rbp
14551320e:     	popq	%rdi
14551320f:     	popq	%rsi
145513210:     	popq	%r12
145513212:     	popq	%r13
145513214:     	popq	%r14
145513216:     	popq	%r15
145513218:     	retq
145513219:     	movq	%r8, %rsi
14551321c:     	movq	%rcx, %rbp
14551321f:     	leaq	0x10(%rcx), %rax
145513223:     	movq	%rax, 0x40(%rsp)
145513228:     	movq	%rcx, 0x38(%rsp)
14551322d:     	jmp	0x145513236 <.text+0x5512236>
14551322f:     	nop
145513230:     	cmpb	$0x1, 0x41(%rbp)
145513234:     	je	0x1455131f9 <.text+0x55121f9>
145513236:     	movq	0x40(%rsp), %rdx
14551323b:     	movq	(%rdx), %r15
14551323e:     	leaq	0x48(%rsp), %rcx
145513243:     	callq	0x145522ea0 <.text+0x5521ea0>
145513248:     	cmpl	$0x1, 0x48(%rsp)
14551324d:     	jne	0x145513270 <.text+0x5512270>
14551324f:     	movq	0x58(%rsp), %rax
145513254:     	movq	(%rbp), %rcx
145513258:     	movq	%rax, (%rbp)
14551325c:     	subq	%rcx, %rax
14551325f:     	addq	%rcx, %r15
145513262:     	testq	%rax, %rax
145513265:     	jne	0x1455132a1 <.text+0x55122a1>
145513267:     	jmp	0x1455132c0 <.text+0x55122c0>
145513269:     	nopl	(%rax)
145513270:     	cmpb	$0x0, 0x41(%rbp)
145513274:     	jne	0x1455131f9 <.text+0x55121f9>
145513276:     	movb	$0x1, 0x41(%rbp)
14551327a:     	movq	(%rbp), %r15
14551327e:     	movq	0x8(%rbp), %rax
145513282:     	subq	%r15, %rax
145513285:     	setne	%cl
145513288:     	orb	0x40(%rbp), %cl
14551328b:     	cmpb	$0x1, %cl
14551328e:     	jne	0x1455131f9 <.text+0x55121f9>
145513294:     	movq	0x40(%rsp), %rcx
145513299:     	addq	(%rcx), %r15
14551329c:     	testq	%rax, %rax
14551329f:     	je	0x1455132c0 <.text+0x55122c0>
1455132a1:     	cmpb	$0xa, -0x1(%r15,%rax)
1455132a7:     	movq	%rax, %rdx
1455132aa:     	jne	0x1455132c3 <.text+0x55122c3>
1455132ac:     	movq	%rax, %rdx
1455132af:     	decq	%rdx
1455132b2:     	je	0x1455132c3 <.text+0x55122c3>
1455132b4:     	cmpb	$0xd, -0x2(%r15,%rax)
1455132ba:     	jne	0x1455132c3 <.text+0x55122c3>
1455132bc:     	addq	$-0x2, %rax
1455132c0:     	movq	%rax, %rdx
1455132c3:     	movq	%r15, %rcx
1455132c6:     	callq	0x1400e9d30 <.text+0xe8d30>
1455132cb:     	cmpq	$0x6, %rdx
1455132cf:     	jb	0x145513230 <.text+0x5512230>
1455132d5:     	movq	%rax, %r15
1455132d8:     	movl	(%rax), %eax
1455132da:     	movl	$0x6d657469, %ecx       # imm = 0x6D657469
1455132df:     	xorl	%ecx, %eax
1455132e1:     	movzwl	0x4(%r15), %ecx
1455132e6:     	xorl	$0x7c73, %ecx           # imm = 0x7C73
1455132ec:     	orl	%eax, %ecx
1455132ee:     	jne	0x145513230 <.text+0x5512230>
1455132f4:     	movq	%rdx, %r13
1455132f7:     	addq	$0x6, %r15
1455132fb:     	addq	$-0x6, %r13
1455132ff:     	movq	$0x0, (%rsi)
145513306:     	movq	%r13, 0x8(%rsi)
14551330a:     	movq	%r15, 0x10(%rsi)
14551330e:     	movq	%r13, 0x18(%rsi)
145513312:     	movq	$0x0, 0x20(%rsi)
14551331a:     	movq	%r13, 0x28(%rsi)
14551331e:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
145513328:     	movq	%rax, 0x30(%rsi)
14551332c:     	movb	$0x1, 0x38(%rsi)
145513330:     	movw	$0x1, 0x40(%rsi)
145513336:     	xorl	%r12d, %r12d
145513339:     	xorl	%ebx, %ebx
14551333b:     	jmp	0x145513359 <.text+0x5512359>
14551333d:     	testb	%r14b, %r14b
145513340:     	movq	0x38(%rsp), %rbp
145513345:     	jne	0x1455135b4 <.text+0x55125b4>
14551334b:     	nopl	(%rax,%rax)
145513350:     	testb	%dil, %dil
145513353:     	jne	0x145513230 <.text+0x5512230>
145513359:     	movq	%r12, %r14
14551335c:     	cmpq	%rbx, %r13
14551335f:     	jae	0x14551337c <.text+0x551237c>
145513361:     	movq	%rbx, %r12
145513364:     	jmp	0x145513427 <.text+0x5512427>
145513369:     	nopl	(%rax)
145513370:     	movq	%r12, %rbx
145513373:     	cmpq	%r12, %r13
145513376:     	jb	0x145513427 <.text+0x5512427>
14551337c:     	movq	%r13, %r8
14551337f:     	subq	%rbx, %r8
145513382:     	leaq	(%r15,%rbx), %rax
145513386:     	cmpq	$0x10, %r8
14551338a:     	jae	0x1455133c0 <.text+0x55123c0>
14551338c:     	xorl	%edx, %edx
14551338e:     	testq	%r8, %r8
145513391:     	je	0x1455133b1 <.text+0x55123b1>
145513393:     	nopw	%cs:(%rax,%rax)
1455133a0:     	cmpb	$0x2c, (%rax,%rdx)
1455133a4:     	je	0x1455133d2 <.text+0x55123d2>
1455133a6:     	incq	%rdx
1455133a9:     	cmpq	%rdx, %r8
1455133ac:     	jne	0x1455133a0 <.text+0x55123a0>
1455133ae:     	movq	%r8, %rdx
1455133b1:     	xorl	%eax, %eax
1455133b3:     	cmpq	$0x1, %rax
1455133b7:     	je	0x1455133e0 <.text+0x55123e0>
1455133b9:     	jmp	0x145513420 <.text+0x5512420>
1455133bb:     	nopl	(%rax,%rax)
1455133c0:     	movb	$0x2c, %cl
1455133c2:     	movq	%rax, %rdx
1455133c5:     	callq	0x145714db0 <.text+0x5713db0>
1455133ca:     	cmpq	$0x1, %rax
1455133ce:     	je	0x1455133e0 <.text+0x55123e0>
1455133d0:     	jmp	0x145513420 <.text+0x5512420>
1455133d2:     	movl	$0x1, %eax
1455133d7:     	cmpq	$0x1, %rax
1455133db:     	jne	0x145513420 <.text+0x5512420>
1455133dd:     	nopl	(%rax)
1455133e0:     	leaq	(%rdx,%rbx), %r12
1455133e4:     	incq	%r12
1455133e7:     	movq	%r12, 0x20(%rsi)
1455133eb:     	addq	%rbx, %rdx
1455133ee:     	cmpq	%r13, %rdx
1455133f1:     	jae	0x145513370 <.text+0x5512370>
1455133f7:     	cmpb	$0x2c, (%r15,%rdx)
1455133fc:     	jne	0x145513370 <.text+0x5512370>
145513402:     	movq	%r12, (%rsi)
145513405:     	xorl	%edi, %edi
145513407:     	movq	%r12, %rbx
14551340a:     	subq	%r14, %rdx
14551340d:     	jne	0x145513440 <.text+0x5512440>
14551340f:     	jmp	0x145513350 <.text+0x5512350>
145513414:     	nopw	%cs:(%rax,%rax)
145513420:     	movq	%r13, 0x20(%rsi)
145513424:     	movq	%r13, %r12
145513427:     	movq	%r12, %rbx
14551342a:     	movb	$0x1, 0x41(%rsi)
14551342e:     	movb	$0x1, %dil
145513431:     	movq	%r14, %r12
145513434:     	movq	%r13, %rdx
145513437:     	subq	%r14, %rdx
14551343a:     	je	0x145513350 <.text+0x5512350>
145513440:     	addq	%r15, %r14
145513443:     	cmpq	$0x1, %rdx
145513447:     	jne	0x145513470 <.text+0x5512470>
145513449:     	movzbl	(%r14), %eax
14551344d:     	cmpl	$0x2b, %eax
145513450:     	je	0x145513350 <.text+0x5512350>
145513456:     	cmpl	$0x2d, %eax
145513459:     	je	0x145513350 <.text+0x5512350>
14551345f:     	jmp	0x145513474 <.text+0x5512474>
145513461:     	nopw	%cs:(%rax,%rax)
145513470:     	movzbl	(%r14), %eax
145513474:     	xorl	%ecx, %ecx
145513476:     	cmpb	$0x2b, %al
145513478:     	sete	%cl
14551347b:     	subq	%rcx, %rdx
14551347e:     	addq	%rcx, %r14
145513481:     	xorl	%eax, %eax
145513483:     	cmpq	$0x9, %rdx
145513487:     	jae	0x145513550 <.text+0x5512550>
14551348d:     	testq	%rdx, %rdx
145513490:     	je	0x1455134c2 <.text+0x55124c2>
145513492:     	xorl	%ecx, %ecx
145513494:     	nopw	%cs:(%rax,%rax)
1455134a0:     	movzbl	(%r14,%rcx), %r8d
1455134a5:     	addl	$-0x30, %r8d
1455134a9:     	cmpl	$0x9, %r8d
1455134ad:     	ja	0x145513350 <.text+0x5512350>
1455134b3:     	leal	(%rax,%rax,4), %eax
1455134b6:     	leal	(%r8,%rax,2), %eax
1455134ba:     	incq	%rcx
1455134bd:     	cmpq	%rcx, %rdx
1455134c0:     	jne	0x1455134a0 <.text+0x55124a0>
1455134c2:     	shlq	$0x20, %rax
1455134c6:     	testb	$0x1, %al
1455134c8:     	jne	0x145513350 <.text+0x5512350>
1455134ce:     	shrq	$0x20, %rax
1455134d2:     	leaq	0x48(%rsp), %rcx
1455134d7:     	movq	%rax, 0x30(%rsp)
1455134dc:     	movl	%eax, %edx
1455134de:     	callq	0x14545a320 <.text+0x5459320>
1455134e3:     	movq	0x48(%rsp), %rdx
1455134e8:     	cmpq	$-0x1, %rdx
1455134ec:     	je	0x145513350 <.text+0x5512350>
1455134f2:     	movq	0x60(%rsp), %rbp
1455134f7:     	movq	0x68(%rsp), %rcx
1455134fc:     	movzbl	0xb1(%rsp), %r14d
145513505:     	testq	%rdx, %rdx
145513508:     	je	0x14551352b <.text+0x551252b>
14551350a:     	movb	%r14b, 0x2f(%rsp)
14551350f:     	movq	%rcx, %r14
145513512:     	movq	0x50(%rsp), %rcx
145513517:     	movl	$0x1, %r8d
14551351d:     	callq	0x1400021d0 <.text+0x11d0>
145513522:     	movq	%r14, %rcx
145513525:     	movzbl	0x2f(%rsp), %r14d
14551352b:     	testq	%rbp, %rbp
14551352e:     	je	0x14551333d <.text+0x551233d>
145513534:     	shlq	$0x3, %rbp
145513538:     	movl	$0x4, %r8d
14551353e:     	movq	%rbp, %rdx
145513541:     	callq	0x1400021d0 <.text+0x11d0>
145513546:     	jmp	0x14551333d <.text+0x551233d>
14551354b:     	nopl	(%rax,%rax)
145513550:     	xorl	%ecx, %ecx
145513552:     	cmpq	%rcx, %rdx
145513555:     	je	0x1455134c2 <.text+0x55124c2>
14551355b:     	movq	%rdx, %r8
14551355e:     	movl	$0xa, %edx
145513563:     	mull	%edx
145513565:     	jo	0x14551358e <.text+0x551258e>
145513567:     	movzbl	(%r14,%rcx), %edx
14551356c:     	addl	$-0x30, %edx
14551356f:     	addl	%edx, %eax
145513571:     	setb	%r9b
145513575:     	cmpl	$0x9, %edx
145513578:     	ja	0x145513350 <.text+0x5512350>
14551357e:     	movq	%r8, %rdx
145513581:     	incq	%rcx
145513584:     	testb	%r9b, %r9b
145513587:     	je	0x145513552 <.text+0x5512552>
145513589:     	jmp	0x145513350 <.text+0x5512350>
14551358e:     	movzbl	(%r14,%rcx), %ecx
145513593:     	addb	$-0x30, %cl
145513596:     	xorl	%eax, %eax
145513598:     	cmpb	$0xa, %cl
14551359b:     	setb	%al
14551359e:     	shll	$0x8, %eax
1455135a1:     	addq	$0x101, %rax            # imm = 0x101
1455135a7:     	testb	$0x1, %al
1455135a9:     	jne	0x145513350 <.text+0x5512350>
1455135af:     	jmp	0x1455134ce <.text+0x55124ce>
1455135b4:     	movl	$0x1, %eax
1455135b9:     	jmp	0x145513200 <.text+0x5512200>
