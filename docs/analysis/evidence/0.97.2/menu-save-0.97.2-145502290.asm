
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145502290:     	pushq	%rbp
145502291:     	pushq	%r15
145502293:     	pushq	%r14
145502295:     	pushq	%rsi
145502296:     	pushq	%rdi
145502297:     	pushq	%rbx
145502298:     	subq	$0xd8, %rsp
14550229f:     	leaq	0x80(%rsp), %rbp
1455022a7:     	movq	$-0x2, 0x50(%rbp)
1455022af:     	movq	%rcx, %rsi
1455022b2:     	movq	%rdx, %rcx
1455022b5:     	movq	%r8, %rdx
1455022b8:     	callq	0x1400e9d30 <.text+0xe8d30>
1455022bd:     	cmpq	$0x5, %rdx
1455022c1:     	jb	0x1455022d8 <.text+0x55012d8>
1455022c3:     	movl	$0x31455352, %ecx       # imm = 0x31455352
1455022c8:     	xorl	(%rax), %ecx
1455022ca:     	movzbl	0x4(%rax), %r8d
1455022cf:     	xorl	$0x3a, %r8d
1455022d3:     	orl	%ecx, %r8d
1455022d6:     	je	0x1455022f2 <.text+0x55012f2>
1455022d8:     	movq	$-0x1, (%rsi)
1455022df:     	movq	%rsi, %rax
1455022e2:     	addq	$0xd8, %rsp
1455022e9:     	popq	%rbx
1455022ea:     	popq	%rdi
1455022eb:     	popq	%rsi
1455022ec:     	popq	%r14
1455022ee:     	popq	%r15
1455022f0:     	popq	%rbp
1455022f1:     	retq
1455022f2:     	leaq	-0x2(%rdx), %r15
1455022f6:     	shrq	$0x2, %r15
1455022fa:     	leaq	(%r15,%r15,2), %r14
1455022fe:     	movq	%r15, 0x40(%rbp)
145502302:     	je	0x145502330 <.text+0x5501330>
145502304:     	movq	%rdx, %rdi
145502307:     	movq	%rax, %rbx
14550230a:     	callq	0x140002200 <.text+0x1200>
14550230f:     	movl	$0x1, %edx
145502314:     	movq	%r14, %rcx
145502317:     	callq	0x1400021f0 <.text+0x11f0>
14550231c:     	testq	%rax, %rax
14550231f:     	je	0x14550257b <.text+0x550157b>
145502325:     	movq	%rax, %r8
145502328:     	movq	%rbx, %rax
14550232b:     	movq	%rdi, %rdx
14550232e:     	jmp	0x145502336 <.text+0x5501336>
145502330:     	movl	$0x1, %r8d
145502336:     	addq	$-0x5, %rdx
14550233a:     	addq	$0x5, %rax
14550233e:     	movl	%edx, %ecx
145502340:     	andl	$0x3, %ecx
145502343:     	movq	%r14, 0x38(%rsp)
145502348:     	movq	%r14, 0x28(%rbp)
14550234c:     	movq	%r14, 0x28(%rsp)
145502351:     	movq	%r8, 0x38(%rbp)
145502355:     	movq	%r8, 0x20(%rsp)
14550235a:     	movq	%rcx, 0x30(%rsp)
14550235f:     	leaq	0x14ab833(%rip), %r8    # 0x1469adb99
145502366:     	leaq	-0x8(%rbp), %rcx
14550236a:     	movq	%rdx, %r9
14550236d:     	movq	%r8, %rdx
145502370:     	movq	%rax, %r8
145502373:     	callq	0x145547090 <.text+0x5546090>
145502378:     	nop
145502379:     	cmpl	$0x2, -0x8(%rbp)
14550237d:     	jne	0x1455023ae <.text+0x55013ae>
14550237f:     	cmpb	$-0x1, (%rbp)
145502383:     	movq	0x40(%rbp), %rax
145502387:     	leaq	(%rax,%rax,2), %rdx
14550238b:     	je	0x14550254b <.text+0x550154b>
145502391:     	testq	%rax, %rax
145502394:     	movq	0x38(%rbp), %rcx
145502398:     	je	0x1455022d8 <.text+0x55012d8>
14550239e:     	movl	$0x1, %r8d
1455023a4:     	callq	0x1400021d0 <.text+0x11d0>
1455023a9:     	jmp	0x1455022d8 <.text+0x55012d8>
1455023ae:     	movq	0x8(%rbp), %r14
1455023b2:     	movq	0x40(%rbp), %rbx
1455023b6:     	leaq	(%rbx,%rbx,2), %rdx
1455023ba:     	cmpq	%rdx, %r14
1455023bd:     	cmovaeq	%rdx, %r14
1455023c1:     	cmpq	$0x24, %r14
1455023c5:     	jae	0x1455023e0 <.text+0x55013e0>
1455023c7:     	movq	$-0x1, (%rsi)
1455023ce:     	movq	0x38(%rbp), %rcx
1455023d2:     	testq	%rbx, %rbx
1455023d5:     	jne	0x14550253b <.text+0x550153b>
1455023db:     	jmp	0x1455022df <.text+0x55012df>
1455023e0:     	movq	0x38(%rbp), %rcx
1455023e4:     	leaq	0x10(%rcx), %rdi
1455023e8:     	addq	$-0x24, %r14
1455023ec:     	leaq	0x14ab8e9(%rip), %rax   # 0x1469adcdc
1455023f3:     	movq	%rax, -0x8(%rbp)
1455023f7:     	movq	$0x3, (%rbp)
1455023ff:     	movq	%rcx, 0x8(%rbp)
145502403:     	movq	$0x10, 0x10(%rbp)
14550240b:     	movq	%rdi, 0x18(%rbp)
14550240f:     	movq	%r14, 0x20(%rbp)
145502413:     	leaq	-0x34(%rbp), %rcx
145502417:     	leaq	-0x8(%rbp), %rdx
14550241b:     	callq	0x145501bc0 <.text+0x5500bc0>
145502420:     	nop
145502421:     	movdqu	-0x34(%rbp), %xmm0
145502426:     	movdqu	(%rdi,%r14), %xmm1
14550242c:     	pcmpeqb	%xmm0, %xmm1
145502430:     	movd	-0x24(%rbp), %xmm0
145502435:     	movd	0x10(%rdi,%r14), %xmm2
14550243c:     	pcmpeqb	%xmm0, %xmm2
145502440:     	pand	%xmm1, %xmm2
145502444:     	pmovmskb	%xmm2, %eax
145502448:     	cmpl	$0xffff, %eax           # imm = 0xFFFF
14550244d:     	je	0x14550246c <.text+0x550146c>
14550244f:     	movq	$-0x1, (%rsi)
145502456:     	leaq	(%rbx,%rbx,2), %rdx
14550245a:     	movq	0x38(%rbp), %rcx
14550245e:     	testq	%rbx, %rbx
145502461:     	jne	0x14550253b <.text+0x550153b>
145502467:     	jmp	0x1455022df <.text+0x55012df>
14550246c:     	testq	%r14, %r14
14550246f:     	movq	0x38(%rbp), %rbx
145502473:     	je	0x1455024a3 <.text+0x55014a3>
145502475:     	callq	0x140002200 <.text+0x1200>
14550247a:     	movl	$0x1, %edx
14550247f:     	movq	%r14, %rcx
145502482:     	callq	0x1400021c0 <.text+0x11c0>
145502487:     	testq	%rax, %rax
14550248a:     	je	0x14550258a <.text+0x550158a>
145502490:     	movq	%rax, %r15
145502493:     	movq	%rax, %rcx
145502496:     	movq	%rdi, %rdx
145502499:     	movq	%r14, %r8
14550249c:     	callq	0x145756ddd <.text+0x5755ddd>
1455024a1:     	jmp	0x1455024a9 <.text+0x55014a9>
1455024a3:     	movl	$0x1, %r15d
1455024a9:     	movq	%r15, 0x30(%rbp)
1455024ad:     	movb	$0x1, 0x4f(%rbp)
1455024b1:     	movq	%rbx, %rcx
1455024b4:     	movq	%r15, %rdx
1455024b7:     	movq	%r14, %r8
1455024ba:     	movq	%r14, 0x40(%rbp)
1455024be:     	callq	0x145501940 <.text+0x5500940>
1455024c3:     	nop
1455024c4:     	leaq	-0x20(%rbp), %rcx
1455024c8:     	movq	0x30(%rbp), %rdx
1455024cc:     	movq	0x40(%rbp), %r8
1455024d0:     	callq	0x145714ba0 <.text+0x5713ba0>
1455024d5:     	nop
1455024d6:     	cmpb	$0x0, -0x20(%rbp)
1455024da:     	je	0x14550250c <.text+0x550150c>
1455024dc:     	movdqu	-0x18(%rbp), %xmm0
1455024e1:     	movdqu	%xmm0, 0x10(%rbp)
1455024e6:     	movq	0x40(%rbp), %rax
1455024ea:     	movq	%rax, -0x8(%rbp)
1455024ee:     	movq	0x30(%rbp), %rcx
1455024f2:     	movq	%rcx, (%rbp)
1455024f6:     	movq	%rax, 0x8(%rbp)
1455024fa:     	movq	$-0x1, (%rsi)
145502501:     	leaq	-0x8(%rbp), %rcx
145502505:     	callq	0x1409a2d20 <.text+0x9a1d20>
14550250a:     	jmp	0x145502533 <.text+0x5501533>
14550250c:     	movq	0x40(%rbp), %rax
145502510:     	movq	%rax, (%rbp)
145502514:     	movq	0x30(%rbp), %rcx
145502518:     	movq	%rcx, 0x8(%rbp)
14550251c:     	movq	%rax, 0x10(%rbp)
145502520:     	movq	%rax, 0x10(%rsi)
145502524:     	movq	(%rbp), %rax
145502528:     	movq	%rax, (%rsi)
14550252b:     	movq	0x8(%rbp), %rax
14550252f:     	movq	%rax, 0x8(%rsi)
145502533:     	movq	0x28(%rbp), %rdx
145502537:     	movq	0x38(%rbp), %rcx
14550253b:     	movl	$0x1, %r8d
145502541:     	callq	0x1400021d0 <.text+0x11d0>
145502546:     	jmp	0x1455022df <.text+0x55012df>
14550254b:     	leaq	0x14ab036(%rip), %rax   # 0x1469ad588
145502552:     	movq	%rax, -0x20(%rbp)
145502556:     	leaq	-0x550049d(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14550255d:     	movq	%rax, -0x18(%rbp)
145502561:     	leaq	0x14ab030(%rip), %rcx   # 0x1469ad598
145502568:     	leaq	0x14ab0c1(%rip), %r8    # 0x1469ad630
14550256f:     	leaq	-0x20(%rbp), %rdx
145502573:     	callq	0x1458e7790 <.text+0x58e6790>
145502578:     	nop
145502579:     	jmp	0x145502598 <.text+0x5501598>
14550257b:     	movl	$0x1, %ecx
145502580:     	movq	%r14, %rdx
145502583:     	callq	0x1458e721b <.text+0x58e621b>
145502588:     	ud2
14550258a:     	movl	$0x1, %ecx
14550258f:     	movq	%r14, %rdx
145502592:     	callq	0x1458e721b <.text+0x58e621b>
145502597:     	nop
145502598:     	ud2
