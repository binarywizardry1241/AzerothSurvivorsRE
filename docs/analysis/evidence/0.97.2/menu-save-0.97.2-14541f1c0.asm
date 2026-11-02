
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14541f1c0:     	pushq	%rbp
14541f1c1:     	pushq	%r15
14541f1c3:     	pushq	%r14
14541f1c5:     	pushq	%r13
14541f1c7:     	pushq	%r12
14541f1c9:     	pushq	%rsi
14541f1ca:     	pushq	%rdi
14541f1cb:     	pushq	%rbx
14541f1cc:     	subq	$0x408, %rsp            # imm = 0x408
14541f1d3:     	leaq	0x80(%rsp), %rbp
14541f1db:     	movaps	%xmm6, 0x370(%rbp)
14541f1e2:     	movq	$-0x2, 0x368(%rbp)
14541f1ed:     	movq	%r8, %rsi
14541f1f0:     	movq	%rdx, %rdi
14541f1f3:     	movq	%rcx, 0x28(%rbp)
14541f1f7:     	movq	$0x0, 0x1f0(%rbp)
14541f202:     	movq	%r8, 0x1f8(%rbp)
14541f209:     	movq	%rdx, 0x200(%rbp)
14541f210:     	movq	%r8, 0x208(%rbp)
14541f217:     	movq	$0x0, 0x210(%rbp)
14541f222:     	movq	%r8, 0x218(%rbp)
14541f229:     	movabsq	$0xa0000000a, %rbx      # imm = 0xA0000000A
14541f233:     	movq	%rbx, 0x220(%rbp)
14541f23a:     	movb	$0x1, 0x228(%rbp)
14541f241:     	movw	$0x0, 0x230(%rbp)
14541f24a:     	leaq	0x10(%rbp), %rcx
14541f24e:     	leaq	0x1f0(%rbp), %r15
14541f255:     	movq	%r15, %rdx
14541f258:     	callq	0x145528ab0 <.text+0x5527ab0>
14541f25d:     	movq	$0x0, 0x2d0(%rbp)
14541f268:     	movq	%rsi, 0x2d8(%rbp)
14541f26f:     	leaq	0x2e0(%rbp), %r12
14541f276:     	movq	%rdi, 0x330(%rbp)
14541f27d:     	movq	%rdi, 0x2e0(%rbp)
14541f284:     	movq	%rsi, 0x2e8(%rbp)
14541f28b:     	movq	$0x0, 0x2f0(%rbp)
14541f296:     	movq	%rsi, 0x338(%rbp)
14541f29d:     	movq	%rsi, 0x2f8(%rbp)
14541f2a4:     	movq	%rbx, 0x300(%rbp)
14541f2ab:     	movb	$0x1, 0x308(%rbp)
14541f2b2:     	movw	$0x0, 0x310(%rbp)
14541f2bb:     	leaq	0x140(%rbp), %r14
14541f2c2:     	xorl	%eax, %eax
14541f2c4:     	movq	$-0x1, %rdi
14541f2cb:     	testb	$0x1, %al
14541f2cd:     	je	0x145422126 <.text+0x5421126>
14541f2d3:     	movq	%rdi, 0x38(%rbp)
14541f2d7:     	movq	$0x0, 0x110(%rbp)
14541f2e2:     	movq	$0x8, 0x118(%rbp)
14541f2ed:     	movq	$0x0, 0x120(%rbp)
14541f2f8:     	movq	$0x0, 0x2d0(%rbp)
14541f303:     	movq	0x338(%rbp), %rax
14541f30a:     	movq	%rax, 0x2d8(%rbp)
14541f311:     	leaq	0x2e0(%rbp), %r15
14541f318:     	movq	0x330(%rbp), %rcx
14541f31f:     	movq	%rcx, 0x2e0(%rbp)
14541f326:     	movq	%rax, 0x2e8(%rbp)
14541f32d:     	movq	$0x0, 0x2f0(%rbp)
14541f338:     	movq	%rax, 0x2f8(%rbp)
14541f33f:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
14541f349:     	movq	%rax, 0x300(%rbp)
14541f350:     	movb	$0x1, 0x308(%rbp)
14541f357:     	movw	$0x0, 0x310(%rbp)
14541f360:     	xorl	%eax, %eax
14541f362:     	leaq	0x1f0(%rbp), %r12
14541f369:     	leaq	0x160(%rbp), %r13
14541f370:     	movl	$0x6f6c6e75, %edi       # imm = 0x6F6C6E75
14541f375:     	leaq	0x130154c(%rip), %rbx   # 0x1467208c8
14541f37c:     	jmp	0x14541f3c2 <.text+0x541e3c2>
14541f37e:     	movq	(%rcx), %rax
14541f381:     	movl	(%rax), %edx
14541f383:     	xorl	%edi, %edx
14541f385:     	movzwl	0x4(%rax), %eax
14541f389:     	xorl	$0x6b63, %eax           # imm = 0x6B63
14541f38e:     	orl	%edx, %eax
14541f390:     	je	0x14541f553 <.text+0x541e553>
14541f396:     	nopw	%cs:(%rax,%rax)
14541f3a0:     	movq	0x160(%rbp), %rdx
14541f3a7:     	testq	%rdx, %rdx
14541f3aa:     	je	0x14541f3bb <.text+0x541e3bb>
14541f3ac:     	shlq	$0x4, %rdx
14541f3b0:     	movl	$0x8, %r8d
14541f3b6:     	callq	0x1400021d0 <.text+0x11d0>
14541f3bb:     	movzbl	0x311(%rbp), %eax
14541f3c2:     	testb	$0x1, %al
14541f3c4:     	jne	0x14541fb1d <.text+0x541eb1d>
14541f3ca:     	movq	0x2e0(%rbp), %rsi
14541f3d1:     	movq	%r12, %rcx
14541f3d4:     	movq	%r15, %rdx
14541f3d7:     	callq	0x145429e80 <.text+0x5428e80>
14541f3dc:     	nop
14541f3dd:     	cmpl	$0x1, 0x1f0(%rbp)
14541f3e4:     	jne	0x14541f410 <.text+0x541e410>
14541f3e6:     	movq	0x200(%rbp), %rdx
14541f3ed:     	movq	0x2d0(%rbp), %rax
14541f3f4:     	movq	%rdx, 0x2d0(%rbp)
14541f3fb:     	subq	%rax, %rdx
14541f3fe:     	addq	%rax, %rsi
14541f401:     	testq	%rdx, %rdx
14541f404:     	jne	0x14541f452 <.text+0x541e452>
14541f406:     	jmp	0x14541f480 <.text+0x541e480>
14541f408:     	nopl	(%rax,%rax)
14541f410:     	cmpb	$0x0, 0x311(%rbp)
14541f417:     	jne	0x14541fb1d <.text+0x541eb1d>
14541f41d:     	movb	$0x1, 0x311(%rbp)
14541f424:     	movq	0x2d0(%rbp), %rsi
14541f42b:     	movq	0x2d8(%rbp), %rdx
14541f432:     	subq	%rsi, %rdx
14541f435:     	setne	%al
14541f438:     	orb	0x310(%rbp), %al
14541f43e:     	cmpb	$0x1, %al
14541f440:     	jne	0x14541fb1d <.text+0x541eb1d>
14541f446:     	addq	0x2e0(%rbp), %rsi
14541f44d:     	testq	%rdx, %rdx
14541f450:     	je	0x14541f480 <.text+0x541e480>
14541f452:     	cmpb	$0xa, -0x1(%rsi,%rdx)
14541f457:     	jne	0x14541f480 <.text+0x541e480>
14541f459:     	movq	%rdx, %rax
14541f45c:     	decq	%rax
14541f45f:     	je	0x14541f46e <.text+0x541e46e>
14541f461:     	cmpb	$0xd, -0x2(%rsi,%rdx)
14541f466:     	jne	0x14541f472 <.text+0x541e472>
14541f468:     	addq	$-0x2, %rdx
14541f46c:     	jmp	0x14541f480 <.text+0x541e480>
14541f46e:     	xorl	%edx, %edx
14541f470:     	jmp	0x14541f480 <.text+0x541e480>
14541f472:     	movq	%rax, %rdx
14541f475:     	nopw	%cs:(%rax,%rax)
14541f480:     	movq	%rsi, %rcx
14541f483:     	callq	0x1400e9d30 <.text+0xe8d30>
14541f488:     	nop
14541f489:     	movq	$0x0, 0x1f0(%rbp)
14541f494:     	movq	%rdx, 0x1f8(%rbp)
14541f49b:     	movq	%rax, 0x200(%rbp)
14541f4a2:     	movq	%rdx, 0x208(%rbp)
14541f4a9:     	movq	$0x0, 0x210(%rbp)
14541f4b4:     	movq	%rdx, 0x218(%rbp)
14541f4bb:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
14541f4c5:     	movq	%rax, 0x220(%rbp)
14541f4cc:     	movb	$0x1, 0x228(%rbp)
14541f4d3:     	movw	$0x1, 0x230(%rbp)
14541f4dc:     	movq	%r13, %rcx
14541f4df:     	movq	%r12, %rdx
14541f4e2:     	callq	0x14552a460 <.text+0x5529460>
14541f4e7:     	nop
14541f4e8:     	movq	0x168(%rbp), %rcx
14541f4ef:     	cmpq	$0x3, 0x170(%rbp)
14541f4f7:     	jne	0x14541f3a0 <.text+0x541e3a0>
14541f4fd:     	movq	0x8(%rcx), %rax
14541f501:     	cmpq	$0x6, %rax
14541f505:     	je	0x14541f37e <.text+0x541e37e>
14541f50b:     	cmpq	$0x4, %rax
14541f50f:     	jne	0x14541f3a0 <.text+0x541e3a0>
14541f515:     	movq	(%rcx), %rax
14541f518:     	cmpl	$0x6e65706f, (%rax)     # imm = 0x6E65706F
14541f51e:     	jne	0x14541f3a0 <.text+0x541e3a0>
14541f524:     	movq	0x18(%rcx), %rdx
14541f528:     	testq	%rdx, %rdx
14541f52b:     	je	0x14541f3a0 <.text+0x541e3a0>
14541f531:     	movq	0x10(%rcx), %r10
14541f535:     	cmpq	$0x1, %rdx
14541f539:     	jne	0x14541f58b <.text+0x541e58b>
14541f53b:     	movzbl	(%r10), %eax
14541f53f:     	cmpl	$0x2b, %eax
14541f542:     	je	0x14541f3a0 <.text+0x541e3a0>
14541f548:     	cmpl	$0x2d, %eax
14541f54b:     	je	0x14541f3a0 <.text+0x541e3a0>
14541f551:     	jmp	0x14541f58f <.text+0x541e58f>
14541f553:     	movq	0x18(%rcx), %r8
14541f557:     	movb	$0x1, %sil
14541f55a:     	testq	%r8, %r8
14541f55d:     	je	0x14541f62b <.text+0x541e62b>
14541f563:     	movq	0x10(%rcx), %rdx
14541f567:     	cmpq	$0x1, %r8
14541f56b:     	jne	0x14541f5f4 <.text+0x541e5f4>
14541f571:     	movzbl	(%rdx), %r9d
14541f575:     	cmpl	$0x2b, %r9d
14541f579:     	je	0x14541f62b <.text+0x541e62b>
14541f57f:     	cmpl	$0x2d, %r9d
14541f583:     	je	0x14541f62b <.text+0x541e62b>
14541f589:     	jmp	0x14541f5f8 <.text+0x541e5f8>
14541f58b:     	movzbl	(%r10), %eax
14541f58f:     	xorl	%r8d, %r8d
14541f592:     	cmpb	$0x2b, %al
14541f594:     	sete	%r8b
14541f598:     	movq	%rdx, %rax
14541f59b:     	subq	%r8, %rax
14541f59e:     	addq	%r8, %r10
14541f5a1:     	cmpq	$0x3, %rax
14541f5a5:     	jae	0x14541f63d <.text+0x541e63d>
14541f5ab:     	testq	%rax, %rax
14541f5ae:     	je	0x14541f7d6 <.text+0x541e7d6>
14541f5b4:     	movzbl	(%r10), %r14d
14541f5b8:     	addl	$-0x30, %r14d
14541f5bc:     	cmpl	$0x9, %r14d
14541f5c0:     	ja	0x14541f3a0 <.text+0x541e3a0>
14541f5c6:     	cmpq	$0x1, %rax
14541f5ca:     	je	0x14541f7d9 <.text+0x541e7d9>
14541f5d0:     	movzbl	0x1(%r10), %eax
14541f5d5:     	addl	$-0x30, %eax
14541f5d8:     	cmpl	$0x9, %eax
14541f5db:     	ja	0x14541f3a0 <.text+0x541e3a0>
14541f5e1:     	movzbl	%r14b, %edx
14541f5e5:     	addl	%edx, %edx
14541f5e7:     	leal	(%rdx,%rdx,4), %edx
14541f5ea:     	addb	%dl, %al
14541f5ec:     	movl	%eax, %r14d
14541f5ef:     	jmp	0x14541f7d9 <.text+0x541e7d9>
14541f5f4:     	movzbl	(%rdx), %r9d
14541f5f8:     	xorl	%eax, %eax
14541f5fa:     	cmpb	$0x2b, %r9b
14541f5fe:     	sete	%al
14541f601:     	movq	%r8, %r9
14541f604:     	subq	%rax, %r9
14541f607:     	addq	%rax, %rdx
14541f60a:     	cmpq	$0x3, %r9
14541f60e:     	jae	0x14541f68f <.text+0x541e68f>
14541f610:     	testq	%r9, %r9
14541f613:     	je	0x14541f7f3 <.text+0x541e7f3>
14541f619:     	movzbl	(%rdx), %r14d
14541f61d:     	addl	$-0x30, %r14d
14541f621:     	cmpl	$0x9, %r14d
14541f625:     	jbe	0x14541f8a5 <.text+0x541e8a5>
14541f62b:     	movq	0x28(%rcx), %r8
14541f62f:     	testq	%r8, %r8
14541f632:     	jne	0x14541f6e9 <.text+0x541e6e9>
14541f638:     	jmp	0x14541f3a0 <.text+0x541e3a0>
14541f63d:     	negq	%r8
14541f640:     	addq	%r8, %rdx
14541f643:     	negq	%rdx
14541f646:     	xorl	%r8d, %r8d
14541f649:     	xorl	%r14d, %r14d
14541f64c:     	movq	%rdx, %rax
14541f64f:     	addq	%r8, %rax
14541f652:     	je	0x14541f7d9 <.text+0x541e7d9>
14541f658:     	movl	%r14d, %eax
14541f65b:     	movb	$0xa, %r9b
14541f65e:     	mulb	%r9b
14541f661:     	jo	0x14541f3a0 <.text+0x541e3a0>
14541f667:     	movl	%eax, %r14d
14541f66a:     	movzbl	(%r10,%r8), %r9d
14541f66f:     	addl	$-0x30, %r9d
14541f673:     	addb	%r9b, %r14b
14541f676:     	setb	%al
14541f679:     	cmpl	$0x9, %r9d
14541f67d:     	ja	0x14541f3a0 <.text+0x541e3a0>
14541f683:     	incq	%r8
14541f686:     	testb	%al, %al
14541f688:     	je	0x14541f64c <.text+0x541e64c>
14541f68a:     	jmp	0x14541f3a0 <.text+0x541e3a0>
14541f68f:     	negq	%rax
14541f692:     	addq	%rax, %r8
14541f695:     	negq	%r8
14541f698:     	xorl	%r9d, %r9d
14541f69b:     	xorl	%r14d, %r14d
14541f69e:     	movq	%r8, %rax
14541f6a1:     	addq	%r9, %rax
14541f6a4:     	setne	%sil
14541f6a8:     	je	0x14541f6dc <.text+0x541e6dc>
14541f6aa:     	movl	%r14d, %eax
14541f6ad:     	movb	$0xa, %r10b
14541f6b0:     	mulb	%r10b
14541f6b3:     	jo	0x14541f62b <.text+0x541e62b>
14541f6b9:     	movl	%eax, %r14d
14541f6bc:     	movzbl	(%rdx,%r9), %r10d
14541f6c1:     	addl	$-0x30, %r10d
14541f6c5:     	addb	%r10b, %r14b
14541f6c8:     	setb	%al
14541f6cb:     	cmpl	$0x9, %r10d
14541f6cf:     	ja	0x14541f62b <.text+0x541e62b>
14541f6d5:     	incq	%r9
14541f6d8:     	testb	%al, %al
14541f6da:     	je	0x14541f69e <.text+0x541e69e>
14541f6dc:     	movq	0x28(%rcx), %r8
14541f6e0:     	testq	%r8, %r8
14541f6e3:     	je	0x14541f3a0 <.text+0x541e3a0>
14541f6e9:     	movq	0x20(%rcx), %r9
14541f6ed:     	cmpq	$0x1, %r8
14541f6f1:     	jne	0x14541f70b <.text+0x541e70b>
14541f6f3:     	movzbl	(%r9), %eax
14541f6f7:     	cmpl	$0x2b, %eax
14541f6fa:     	je	0x14541f3a0 <.text+0x541e3a0>
14541f700:     	cmpl	$0x2d, %eax
14541f703:     	je	0x14541f3a0 <.text+0x541e3a0>
14541f709:     	jmp	0x14541f70f <.text+0x541e70f>
14541f70b:     	movzbl	(%r9), %eax
14541f70f:     	xorl	%r10d, %r10d
14541f712:     	cmpb	$0x2b, %al
14541f714:     	sete	%r10b
14541f718:     	movq	%r8, %rdx
14541f71b:     	subq	%r10, %rdx
14541f71e:     	addq	%r10, %r9
14541f721:     	movq	%r10, %rax
14541f724:     	negq	%rax
14541f727:     	cmpq	$0x11, %rdx
14541f72b:     	jae	0x14541f790 <.text+0x541e790>
14541f72d:     	testq	%rdx, %rdx
14541f730:     	je	0x14541f80a <.text+0x541e80a>
14541f736:     	addq	%rax, %r8
14541f739:     	negq	%r8
14541f73c:     	xorl	%edx, %edx
14541f73e:     	xorl	%eax, %eax
14541f740:     	movzbl	(%r9,%rdx), %r10d
14541f745:     	addl	$-0x30, %r10d
14541f749:     	cmpl	$0x9, %r10d
14541f74d:     	ja	0x14541f3a0 <.text+0x541e3a0>
14541f753:     	leaq	(%rax,%rax,4), %rax
14541f757:     	movl	%r10d, %r10d
14541f75a:     	leaq	(%r10,%rax,2), %rax
14541f75e:     	incq	%rdx
14541f761:     	movq	%r8, %r10
14541f764:     	addq	%rdx, %r10
14541f767:     	jne	0x14541f740 <.text+0x541e740>
14541f769:     	cmpq	$0x9, %rax
14541f76d:     	movl	$0x9, %edx
14541f772:     	cmovbq	%rax, %rdx
14541f776:     	testq	%rax, %rax
14541f779:     	movl	$0x1, %eax
14541f77e:     	cmoveq	%rax, %rdx
14541f782:     	testb	%sil, %sil
14541f785:     	jne	0x14541f3a0 <.text+0x541e3a0>
14541f78b:     	jmp	0x14541f818 <.text+0x541e818>
14541f790:     	addq	%rax, %r8
14541f793:     	negq	%r8
14541f796:     	xorl	%r10d, %r10d
14541f799:     	xorl	%eax, %eax
14541f79b:     	movq	%r8, %rdx
14541f79e:     	addq	%r10, %rdx
14541f7a1:     	je	0x14541f769 <.text+0x541e769>
14541f7a3:     	movl	$0xa, %edx
14541f7a8:     	mulq	%rdx
14541f7ab:     	jo	0x14541f3a0 <.text+0x541e3a0>
14541f7b1:     	movzbl	(%r9,%r10), %r11d
14541f7b6:     	addl	$-0x30, %r11d
14541f7ba:     	addq	%r11, %rax
14541f7bd:     	setb	%dl
14541f7c0:     	cmpl	$0x9, %r11d
14541f7c4:     	ja	0x14541f3a0 <.text+0x541e3a0>
14541f7ca:     	incq	%r10
14541f7cd:     	testb	%dl, %dl
14541f7cf:     	je	0x14541f79b <.text+0x541e79b>
14541f7d1:     	jmp	0x14541f3a0 <.text+0x541e3a0>
14541f7d6:     	xorl	%r14d, %r14d
14541f7d9:     	leaq	0x20(%rcx), %r8
14541f7dd:     	leaq	0x28(%rcx), %rax
14541f7e1:     	movq	(%rax), %rax
14541f7e4:     	leaq	-0x2(%rax), %rdx
14541f7e8:     	cmpq	$0x6, %rdx
14541f7ec:     	jbe	0x14541f83d <.text+0x541e83d>
14541f7ee:     	jmp	0x14541f3a0 <.text+0x541e3a0>
14541f7f3:     	xorl	%esi, %esi
14541f7f5:     	xorl	%r14d, %r14d
14541f7f8:     	movq	0x28(%rcx), %r8
14541f7fc:     	testq	%r8, %r8
14541f7ff:     	jne	0x14541f6e9 <.text+0x541e6e9>
14541f805:     	jmp	0x14541f3a0 <.text+0x541e3a0>
14541f80a:     	movl	$0x1, %edx
14541f80f:     	testb	%sil, %sil
14541f812:     	jne	0x14541f3a0 <.text+0x541e3a0>
14541f818:     	shlq	$0x4, %rdx
14541f81c:     	leaq	(%rdx,%rbx), %r8
14541f820:     	addq	$-0x10, %r8
14541f824:     	leaq	(%rdx,%rbx), %rax
14541f828:     	addq	$-0x8, %rax
14541f82c:     	movq	(%rax), %rax
14541f82f:     	leaq	-0x2(%rax), %rdx
14541f833:     	cmpq	$0x6, %rdx
14541f837:     	ja	0x14541f3a0 <.text+0x541e3a0>
14541f83d:     	movq	(%r8), %r9
14541f840:     	leaq	0x13016e1(%rip), %r8    # 0x146720f28
14541f847:     	movslq	(%r8,%rdx,4), %rdx
14541f84b:     	addq	%r8, %rdx
14541f84e:     	jmpq	*%rdx
14541f850:     	movzwl	0x12f1882(%rip), %edx   # 0x1467110d9
14541f857:     	cmpw	(%r9), %dx
14541f85b:     	je	0x14541fa43 <.text+0x541ea43>
14541f861:     	movzwl	0x12f3690(%rip), %edx   # 0x146712ef8
14541f868:     	cmpw	(%r9), %dx
14541f86c:     	je	0x14541fa6d <.text+0x541ea6d>
14541f872:     	movzwl	0x12f4101(%rip), %edx   # 0x14671397a
14541f879:     	cmpw	(%r9), %dx
14541f87d:     	je	0x14541fa7b <.text+0x541ea7b>
14541f883:     	movzwl	0x12f5585(%rip), %edx   # 0x146714e0f
14541f88a:     	cmpw	(%r9), %dx
14541f88e:     	jne	0x14541fa00 <.text+0x541ea00>
14541f894:     	movq	%rcx, 0x358(%rbp)
14541f89b:     	movl	$0xb, %esi
14541f8a0:     	jmp	0x14541fa87 <.text+0x541ea87>
14541f8a5:     	cmpq	$0x1, %r9
14541f8a9:     	jne	0x14541f8bf <.text+0x541e8bf>
14541f8ab:     	xorl	%esi, %esi
14541f8ad:     	movq	0x28(%rcx), %r8
14541f8b1:     	testq	%r8, %r8
14541f8b4:     	jne	0x14541f6e9 <.text+0x541e6e9>
14541f8ba:     	jmp	0x14541f3a0 <.text+0x541e3a0>
14541f8bf:     	movzbl	0x1(%rdx), %eax
14541f8c3:     	addl	$-0x30, %eax
14541f8c6:     	cmpl	$0x9, %eax
14541f8c9:     	ja	0x14541f6dc <.text+0x541e6dc>
14541f8cf:     	movzbl	%r14b, %edx
14541f8d3:     	addl	%edx, %edx
14541f8d5:     	leal	(%rdx,%rdx,4), %edx
14541f8d8:     	addb	%dl, %al
14541f8da:     	xorl	%esi, %esi
14541f8dc:     	movl	%eax, %r14d
14541f8df:     	jmp	0x14541f6dc <.text+0x541e6dc>
14541f8e4:     	movzwl	0x12f04b3(%rip), %edx   # 0x14670fd9e
14541f8eb:     	xorw	(%r9), %dx
14541f8ef:     	movzbl	0x12f04a9(%rip), %r8d   # 0x14670fda0
14541f8f7:     	xorb	0x2(%r9), %r8b
14541f8fb:     	movzbl	%r8b, %r8d
14541f8ff:     	orw	%dx, %r8w
14541f903:     	je	0x14541fa35 <.text+0x541ea35>
14541f909:     	movzwl	0x12f4a29(%rip), %edx   # 0x146714339
14541f910:     	xorw	(%r9), %dx
14541f914:     	movzbl	0x12f4a1f(%rip), %r8d   # 0x14671433b
14541f91c:     	xorb	0x2(%r9), %r8b
14541f920:     	movzbl	%r8b, %r8d
14541f924:     	orw	%dx, %r8w
14541f928:     	jne	0x14541fa00 <.text+0x541ea00>
14541f92e:     	movq	%rcx, 0x358(%rbp)
14541f935:     	movl	$0xa, %esi
14541f93a:     	jmp	0x14541fa87 <.text+0x541ea87>
14541f93f:     	movl	0x12ef16b(%rip), %edx   # 0x14670eab0
14541f945:     	xorl	(%r9), %edx
14541f948:     	movzwl	0x12ef164(%rip), %r8d   # 0x14670eab4
14541f950:     	xorw	0x4(%r9), %r8w
14541f955:     	movzwl	%r8w, %r8d
14541f959:     	orl	%edx, %r8d
14541f95c:     	je	0x14541fa51 <.text+0x541ea51>
14541f962:     	movl	0x12f0d87(%rip), %edx   # 0x1467106ef
14541f968:     	xorl	(%r9), %edx
14541f96b:     	movzwl	0x12f0d80(%rip), %r8d   # 0x1467106f3
14541f973:     	xorw	0x4(%r9), %r8w
14541f978:     	movzwl	%r8w, %r8d
14541f97c:     	orl	%edx, %r8d
14541f97f:     	jne	0x14541f9a2 <.text+0x541e9a2>
14541f981:     	movq	%rcx, 0x358(%rbp)
14541f988:     	movl	$0x4, %esi
14541f98d:     	jmp	0x14541fa87 <.text+0x541ea87>
14541f992:     	movq	0x12efa82(%rip), %rdx   # 0x14670f41b
14541f999:     	cmpq	(%r9), %rdx
14541f99c:     	je	0x14541fa5f <.text+0x541ea5f>
14541f9a2:     	cmpq	$0x4, %rax
14541f9a6:     	je	0x14541fa0a <.text+0x541ea0a>
14541f9a8:     	cmpq	$0x5, %rax
14541f9ac:     	je	0x14541f9e2 <.text+0x541e9e2>
14541f9ae:     	cmpq	$0x7, %rax
14541f9b2:     	jne	0x14541f3a0 <.text+0x541e3a0>
14541f9b8:     	movl	0x12f215a(%rip), %edx   # 0x146711b18
14541f9be:     	xorl	(%r9), %edx
14541f9c1:     	movl	0x12f2153(%rip), %r8d   # 0x146711b1b
14541f9c8:     	xorl	0x3(%r9), %r8d
14541f9cc:     	orl	%edx, %r8d
14541f9cf:     	jne	0x14541fa00 <.text+0x541ea00>
14541f9d1:     	movq	%rcx, 0x358(%rbp)
14541f9d8:     	movl	$0x6, %esi
14541f9dd:     	jmp	0x14541fa87 <.text+0x541ea87>
14541f9e2:     	movl	0x12f2ad6(%rip), %edx   # 0x1467124be
14541f9e8:     	xorl	(%r9), %edx
14541f9eb:     	movzbl	0x12f2acf(%rip), %r8d   # 0x1467124c2
14541f9f3:     	xorb	0x4(%r9), %r8b
14541f9f7:     	movzbl	%r8b, %r8d
14541f9fb:     	orl	%edx, %r8d
14541f9fe:     	je	0x14541fa27 <.text+0x541ea27>
14541fa00:     	cmpq	$0x4, %rax
14541fa04:     	jne	0x14541f3a0 <.text+0x541e3a0>
14541fa0a:     	movl	0x12f5dda(%rip), %eax   # 0x1467157ea
14541fa10:     	cmpl	(%r9), %eax
14541fa13:     	jne	0x14541f3a0 <.text+0x541e3a0>
14541fa19:     	movq	%rcx, 0x358(%rbp)
14541fa20:     	movl	$0xc, %esi
14541fa25:     	jmp	0x14541fa87 <.text+0x541ea87>
14541fa27:     	movq	%rcx, 0x358(%rbp)
14541fa2e:     	movl	$0x7, %esi
14541fa33:     	jmp	0x14541fa87 <.text+0x541ea87>
14541fa35:     	movq	%rcx, 0x358(%rbp)
14541fa3c:     	movl	$0x3, %esi
14541fa41:     	jmp	0x14541fa87 <.text+0x541ea87>
14541fa43:     	movq	%rcx, 0x358(%rbp)
14541fa4a:     	movl	$0x5, %esi
14541fa4f:     	jmp	0x14541fa87 <.text+0x541ea87>
14541fa51:     	movq	%rcx, 0x358(%rbp)
14541fa58:     	movl	$0x1, %esi
14541fa5d:     	jmp	0x14541fa87 <.text+0x541ea87>
14541fa5f:     	movq	%rcx, 0x358(%rbp)
14541fa66:     	movl	$0x2, %esi
14541fa6b:     	jmp	0x14541fa87 <.text+0x541ea87>
14541fa6d:     	movq	%rcx, 0x358(%rbp)
14541fa74:     	movl	$0x8, %esi
14541fa79:     	jmp	0x14541fa87 <.text+0x541ea87>
14541fa7b:     	movq	%rcx, 0x358(%rbp)
14541fa82:     	movl	$0x9, %esi
14541fa87:     	movq	0x118(%rbp), %rax
14541fa8e:     	movq	0x120(%rbp), %rdi
14541fa95:     	movq	%rdi, %rbx
14541fa98:     	shlq	$0x4, %rbx
14541fa9c:     	xorl	%ecx, %ecx
14541fa9e:     	nop
14541faa0:     	cmpq	%rcx, %rbx
14541faa3:     	je	0x14541fac5 <.text+0x541eac5>
14541faa5:     	leaq	0x10(%rcx), %rdx
14541faa9:     	cmpb	%r14b, (%rax,%rcx)
14541faad:     	movq	%rdx, %rcx
14541fab0:     	jne	0x14541faa0 <.text+0x541eaa0>
14541fab2:     	movq	-0x8(%rax,%rdx), %rcx
14541fab7:     	cmpq	%rcx, %rsi
14541faba:     	cmovaq	%rsi, %rcx
14541fabe:     	movq	%rcx, -0x8(%rax,%rdx)
14541fac3:     	jmp	0x14541faf5 <.text+0x541eaf5>
14541fac5:     	cmpq	0x110(%rbp), %rdi
14541facc:     	jne	0x14541fae2 <.text+0x541eae2>
14541face:     	leaq	0x110(%rbp), %rcx
14541fad5:     	callq	0x145758200 <.text+0x5757200>
14541fada:     	nop
14541fadb:     	movq	0x118(%rbp), %rax
14541fae2:     	movb	%r14b, (%rax,%rbx)
14541fae6:     	movq	%rsi, 0x8(%rax,%rbx)
14541faeb:     	incq	%rdi
14541faee:     	movq	%rdi, 0x120(%rbp)
14541faf5:     	movq	0x160(%rbp), %rdx
14541fafc:     	testq	%rdx, %rdx
14541faff:     	movl	$0x6f6c6e75, %edi       # imm = 0x6F6C6E75
14541fb04:     	leaq	0x1300dbd(%rip), %rbx   # 0x1467208c8
14541fb0b:     	movq	0x358(%rbp), %rcx
14541fb12:     	jne	0x14541f3ac <.text+0x541e3ac>
14541fb18:     	jmp	0x14541f3bb <.text+0x541e3bb>
14541fb1d:     	movq	$0x0, 0x1f0(%rbp)
14541fb28:     	movq	0x338(%rbp), %rax
14541fb2f:     	movq	%rax, 0x1f8(%rbp)
14541fb36:     	movq	0x330(%rbp), %rcx
14541fb3d:     	movq	%rcx, 0x200(%rbp)
14541fb44:     	movq	%rax, 0x208(%rbp)
14541fb4b:     	movq	$0x0, 0x210(%rbp)
14541fb56:     	movq	%rax, 0x218(%rbp)
14541fb5d:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
14541fb67:     	movq	%rax, 0x220(%rbp)
14541fb6e:     	movb	$0x1, 0x228(%rbp)
14541fb75:     	movw	$0x0, 0x230(%rbp)
14541fb7e:     	movl	$0xffffffff, 0x26c(%rbp) # imm = 0xFFFFFFFF
14541fb88:     	movl	$0xffffffff, 0x2b4(%rbp) # imm = 0xFFFFFFFF
14541fb92:     	leaq	0xd8(%rbp), %rcx
14541fb99:     	leaq	0x1f0(%rbp), %rdx
14541fba0:     	callq	0x14552fba0 <.text+0x552eba0>
14541fba5:     	nop
14541fba6:     	movq	0xe8(%rbp), %r14
14541fbad:     	cmpq	$0x2, %r14
14541fbb1:     	jae	0x145422978 <.text+0x5421978>
14541fbb7:     	movq	$0x0, 0x1b8(%rbp)
14541fbc2:     	movq	$0x4, 0x1c0(%rbp)
14541fbcd:     	movq	$0x0, 0x1c8(%rbp)
14541fbd8:     	movq	$0x0, 0x2d0(%rbp)
14541fbe3:     	movq	0x338(%rbp), %rax
14541fbea:     	movq	%rax, 0x2d8(%rbp)
14541fbf1:     	leaq	0x2e0(%rbp), %r14
14541fbf8:     	movq	0x330(%rbp), %rcx
14541fbff:     	movq	%rcx, 0x2e0(%rbp)
14541fc06:     	movq	%rax, 0x2e8(%rbp)
14541fc0d:     	movq	$0x0, 0x2f0(%rbp)
14541fc18:     	movq	%rax, 0x2f8(%rbp)
14541fc1f:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
14541fc29:     	movq	%rax, 0x300(%rbp)
14541fc30:     	movb	$0x1, 0x308(%rbp)
14541fc37:     	movw	$0x0, 0x310(%rbp)
14541fc40:     	xorl	%eax, %eax
14541fc42:     	leaq	0x1f0(%rbp), %r15
14541fc49:     	leaq	0x160(%rbp), %r12
14541fc50:     	xorps	%xmm6, %xmm6
14541fc53:     	testb	$0x1, %al
14541fc55:     	je	0x1454201bf <.text+0x541f1bf>
14541fc5b:     	movq	$0x0, 0x1f0(%rbp)
14541fc66:     	movq	0x338(%rbp), %rax
14541fc6d:     	movq	%rax, 0x1f8(%rbp)
14541fc74:     	movq	0x330(%rbp), %rcx
14541fc7b:     	movq	%rcx, 0x200(%rbp)
14541fc82:     	movq	%rax, 0x208(%rbp)
14541fc89:     	movq	$0x0, 0x210(%rbp)
14541fc94:     	movq	%rax, 0x218(%rbp)
14541fc9b:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
14541fca5:     	movq	%rax, 0x220(%rbp)
14541fcac:     	movb	$0x1, 0x228(%rbp)
14541fcb3:     	movw	$0x0, 0x230(%rbp)
14541fcbc:     	leaq	-0x8(%rbp), %rcx
14541fcc0:     	leaq	0x1f0(%rbp), %rdx
14541fcc7:     	callq	0x14552c420 <.text+0x552b420>
14541fccc:     	nop
14541fccd:     	movq	$0x0, 0x1a0(%rbp)
14541fcd8:     	movq	$0x8, 0x1a8(%rbp)
14541fce3:     	movq	$0x0, 0x1b0(%rbp)
14541fcee:     	movq	$0x0, 0x1f0(%rbp)
14541fcf9:     	movq	0x338(%rbp), %rax
14541fd00:     	movq	%rax, 0x1f8(%rbp)
14541fd07:     	movq	0x330(%rbp), %rcx
14541fd0e:     	movq	%rcx, 0x200(%rbp)
14541fd15:     	movq	%rax, 0x208(%rbp)
14541fd1c:     	movq	$0x0, 0x210(%rbp)
14541fd27:     	movq	%rax, 0x218(%rbp)
14541fd2e:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
14541fd38:     	movq	%rax, 0x220(%rbp)
14541fd3f:     	movb	$0x1, 0x228(%rbp)
14541fd46:     	movw	$0x0, 0x230(%rbp)
14541fd4f:     	xorl	%eax, %eax
14541fd51:     	jmp	0x14541fd67 <.text+0x541ed67>
14541fd53:     	nopw	%cs:(%rax,%rax)
14541fd60:     	movzbl	0x231(%rbp), %eax
14541fd67:     	testb	$0x1, %al
14541fd69:     	jne	0x1454207cc <.text+0x541f7cc>
14541fd6f:     	movq	0x200(%rbp), %rsi
14541fd76:     	leaq	0x2d0(%rbp), %rcx
14541fd7d:     	leaq	0x200(%rbp), %rdx
14541fd84:     	callq	0x145429e80 <.text+0x5428e80>
14541fd89:     	nop
14541fd8a:     	cmpl	$0x1, 0x2d0(%rbp)
14541fd91:     	jne	0x14541fdc0 <.text+0x541edc0>
14541fd93:     	movq	0x2e0(%rbp), %rdx
14541fd9a:     	movq	0x1f0(%rbp), %rax
14541fda1:     	movq	%rdx, 0x1f0(%rbp)
14541fda8:     	subq	%rax, %rdx
14541fdab:     	addq	%rax, %rsi
14541fdae:     	testq	%rdx, %rdx
14541fdb1:     	jne	0x14541fe02 <.text+0x541ee02>
14541fdb3:     	jmp	0x14541fe30 <.text+0x541ee30>
14541fdb5:     	nopw	%cs:(%rax,%rax)
14541fdc0:     	cmpb	$0x0, 0x231(%rbp)
14541fdc7:     	jne	0x1454207cc <.text+0x541f7cc>
14541fdcd:     	movb	$0x1, 0x231(%rbp)
14541fdd4:     	movq	0x1f0(%rbp), %rsi
14541fddb:     	movq	0x1f8(%rbp), %rdx
14541fde2:     	subq	%rsi, %rdx
14541fde5:     	setne	%al
14541fde8:     	orb	0x230(%rbp), %al
14541fdee:     	cmpb	$0x1, %al
14541fdf0:     	jne	0x1454207cc <.text+0x541f7cc>
14541fdf6:     	addq	0x200(%rbp), %rsi
14541fdfd:     	testq	%rdx, %rdx
14541fe00:     	je	0x14541fe30 <.text+0x541ee30>
14541fe02:     	cmpb	$0xa, -0x1(%rsi,%rdx)
14541fe07:     	jne	0x14541fe30 <.text+0x541ee30>
14541fe09:     	movq	%rdx, %rax
14541fe0c:     	decq	%rax
14541fe0f:     	je	0x14541fe1e <.text+0x541ee1e>
14541fe11:     	cmpb	$0xd, -0x2(%rsi,%rdx)
14541fe16:     	jne	0x14541fe22 <.text+0x541ee22>
14541fe18:     	addq	$-0x2, %rdx
14541fe1c:     	jmp	0x14541fe30 <.text+0x541ee30>
14541fe1e:     	xorl	%edx, %edx
14541fe20:     	jmp	0x14541fe30 <.text+0x541ee30>
14541fe22:     	movq	%rax, %rdx
14541fe25:     	nopw	%cs:(%rax,%rax)
14541fe30:     	movq	%rsi, %rcx
14541fe33:     	callq	0x1400e9d30 <.text+0xe8d30>
14541fe38:     	nop
14541fe39:     	movq	%rdx, %r15
14541fe3c:     	cmpq	$0x5, %rdx
14541fe40:     	jb	0x14541fd60 <.text+0x541ed60>
14541fe46:     	movl	(%rax), %ecx
14541fe48:     	movl	$0x6e656573, %edx       # imm = 0x6E656573
14541fe4d:     	xorl	%edx, %ecx
14541fe4f:     	movzbl	0x4(%rax), %edx
14541fe53:     	xorl	$0x7c, %edx
14541fe56:     	orl	%ecx, %edx
14541fe58:     	jne	0x14541fd60 <.text+0x541ed60>
14541fe5e:     	addq	$-0x5, %r15
14541fe62:     	leaq	0x5(%rax), %rdi
14541fe66:     	addq	$0x6, %rax
14541fe6a:     	movq	%rax, 0x340(%rbp)
14541fe71:     	movq	$0x0, 0x358(%rbp)
14541fe7c:     	xorl	%esi, %esi
14541fe7e:     	xorl	%ebx, %ebx
14541fe80:     	movq	%rbx, 0x350(%rbp)
14541fe87:     	testb	$0x1, 0x358(%rbp)
14541fe8e:     	jne	0x14541fd60 <.text+0x541ed60>
14541fe94:     	movb	$0x1, %al
14541fe96:     	movq	%rax, 0x358(%rbp)
14541fe9d:     	cmpq	%rsi, %r15
14541fea0:     	jae	0x14541febc <.text+0x541eebc>
14541fea2:     	jmp	0x14541ff59 <.text+0x541ef59>
14541fea7:     	nopw	(%rax,%rax)
14541feb0:     	movq	%rbx, %rsi
14541feb3:     	cmpq	%rbx, %r15
14541feb6:     	jb	0x14541ff56 <.text+0x541ef56>
14541febc:     	movq	%r15, %r8
14541febf:     	subq	%rsi, %r8
14541fec2:     	leaq	(%rdi,%rsi), %rdx
14541fec6:     	cmpq	$0x10, %r8
14541feca:     	jae	0x14541ff00 <.text+0x541ef00>
14541fecc:     	xorl	%r13d, %r13d
14541fecf:     	testq	%r8, %r8
14541fed2:     	je	0x14541fef2 <.text+0x541eef2>
14541fed4:     	nopw	%cs:(%rax,%rax)
14541fee0:     	cmpb	$0x2c, (%rdx,%r13)
14541fee5:     	je	0x14541ff13 <.text+0x541ef13>
14541fee7:     	incq	%r13
14541feea:     	cmpq	%r13, %r8
14541feed:     	jne	0x14541fee0 <.text+0x541eee0>
14541feef:     	movq	%r8, %r13
14541fef2:     	xorl	%eax, %eax
14541fef4:     	cmpq	$0x1, %rax
14541fef8:     	je	0x14541ff20 <.text+0x541ef20>
14541fefa:     	jmp	0x14541ff51 <.text+0x541ef51>
14541fefc:     	nopl	(%rax)
14541ff00:     	movb	$0x2c, %cl
14541ff02:     	callq	0x145714db0 <.text+0x5713db0>
14541ff07:     	nop
14541ff08:     	movq	%rdx, %r13
14541ff0b:     	cmpq	$0x1, %rax
14541ff0f:     	je	0x14541ff20 <.text+0x541ef20>
14541ff11:     	jmp	0x14541ff51 <.text+0x541ef51>
14541ff13:     	movl	$0x1, %eax
14541ff18:     	cmpq	$0x1, %rax
14541ff1c:     	jne	0x14541ff51 <.text+0x541ef51>
14541ff1e:     	nop
14541ff20:     	leaq	(%rsi,%r13), %rbx
14541ff24:     	incq	%rbx
14541ff27:     	addq	%rsi, %r13
14541ff2a:     	cmpq	%r15, %r13
14541ff2d:     	jae	0x14541feb0 <.text+0x541eeb0>
14541ff2f:     	cmpb	$0x2c, (%rdi,%r13)
14541ff34:     	jne	0x14541feb0 <.text+0x541eeb0>
14541ff3a:     	movq	$0x0, 0x358(%rbp)
14541ff45:     	movq	%rbx, %rsi
14541ff48:     	movq	0x350(%rbp), %rax
14541ff4f:     	jmp	0x14541ff66 <.text+0x541ef66>
14541ff51:     	movq	%r15, %rsi
14541ff54:     	jmp	0x14541ff59 <.text+0x541ef59>
14541ff56:     	movq	%rbx, %rsi
14541ff59:     	movq	0x350(%rbp), %rax
14541ff60:     	movq	%rax, %rbx
14541ff63:     	movq	%r15, %r13
14541ff66:     	subq	%rax, %r13
14541ff69:     	leaq	(%rdi,%rax), %r12
14541ff6d:     	xorl	%r14d, %r14d
14541ff70:     	jmp	0x14541ff8c <.text+0x541ef8c>
14541ff72:     	nopw	%cs:(%rax,%rax)
14541ff80:     	movq	%rcx, %r14
14541ff83:     	cmpq	%rcx, %r13
14541ff86:     	jb	0x14541fe80 <.text+0x541ee80>
14541ff8c:     	movq	%r13, %r8
14541ff8f:     	subq	%r14, %r8
14541ff92:     	leaq	(%r12,%r14), %rax
14541ff96:     	cmpq	$0x10, %r8
14541ff9a:     	jae	0x14541ffd0 <.text+0x541efd0>
14541ff9c:     	xorl	%edx, %edx
14541ff9e:     	testq	%r8, %r8
14541ffa1:     	je	0x14541ffc1 <.text+0x541efc1>
14541ffa3:     	nopw	%cs:(%rax,%rax)
14541ffb0:     	cmpb	$0x3d, (%rax,%rdx)
14541ffb4:     	je	0x14541fffe <.text+0x541effe>
14541ffb6:     	incq	%rdx
14541ffb9:     	cmpq	%rdx, %r8
14541ffbc:     	jne	0x14541ffb0 <.text+0x541efb0>
14541ffbe:     	movq	%r8, %rdx
14541ffc1:     	xorl	%eax, %eax
14541ffc3:     	cmpq	$0x1, %rax
14541ffc7:     	je	0x14541ffe5 <.text+0x541efe5>
14541ffc9:     	jmp	0x14541fe80 <.text+0x541ee80>
14541ffce:     	nop
14541ffd0:     	movb	$0x3d, %cl
14541ffd2:     	movq	%rax, %rdx
14541ffd5:     	callq	0x145714db0 <.text+0x5713db0>
14541ffda:     	nop
14541ffdb:     	cmpq	$0x1, %rax
14541ffdf:     	jne	0x14541fe80 <.text+0x541ee80>
14541ffe5:     	leaq	(%rdx,%r14), %rcx
14541ffe9:     	incq	%rcx
14541ffec:     	leaq	(%rdx,%r14), %r11
14541fff0:     	cmpq	%r13, %r11
14541fff3:     	jae	0x14541ff80 <.text+0x541ef80>
14541fff5:     	cmpb	$0x3d, (%r12,%r11)
14541fffa:     	jne	0x14541ff80 <.text+0x541ef80>
14541fffc:     	jmp	0x14542000e <.text+0x541f00e>
14541fffe:     	movl	$0x1, %eax
145420003:     	cmpq	$0x1, %rax
145420007:     	je	0x14541ffe5 <.text+0x541efe5>
145420009:     	jmp	0x14541fe80 <.text+0x541ee80>
14542000e:     	movq	%r13, %r8
145420011:     	subq	%rcx, %r8
145420014:     	je	0x14541fe80 <.text+0x541ee80>
14542001a:     	addq	%r12, %rcx
14542001d:     	cmpq	$0x1, %r8
145420021:     	jne	0x14542003a <.text+0x541f03a>
145420023:     	movzbl	(%rcx), %eax
145420026:     	cmpl	$0x2b, %eax
145420029:     	je	0x14541fe80 <.text+0x541ee80>
14542002f:     	cmpl	$0x2d, %eax
145420032:     	je	0x14541fe80 <.text+0x541ee80>
145420038:     	jmp	0x14542003d <.text+0x541f03d>
14542003a:     	movzbl	(%rcx), %eax
14542003d:     	xorl	%r9d, %r9d
145420040:     	cmpb	$0x2b, %al
145420042:     	sete	%r9b
145420046:     	subq	%r9, %r8
145420049:     	cmpq	$0x3, %r8
14542004d:     	jae	0x14542008f <.text+0x541f08f>
14542004f:     	testq	%r8, %r8
145420052:     	je	0x1454200e7 <.text+0x541f0e7>
145420058:     	movzbl	(%rcx,%r9), %eax
14542005d:     	addl	$-0x30, %eax
145420060:     	cmpl	$0x9, %eax
145420063:     	ja	0x14541fe80 <.text+0x541ee80>
145420069:     	cmpq	$0x1, %r8
14542006d:     	je	0x1454200e9 <.text+0x541f0e9>
14542006f:     	movzbl	0x1(%rcx,%r9), %ecx
145420075:     	addl	$-0x30, %ecx
145420078:     	cmpl	$0x9, %ecx
14542007b:     	ja	0x14541fe80 <.text+0x541ee80>
145420081:     	movzbl	%al, %eax
145420084:     	addl	%eax, %eax
145420086:     	leal	(%rax,%rax,4), %eax
145420089:     	addb	%al, %cl
14542008b:     	movl	%ecx, %eax
14542008d:     	jmp	0x1454200e9 <.text+0x541f0e9>
14542008f:     	movq	0x350(%rbp), %r10
145420096:     	addq	%r9, %r10
145420099:     	negq	%r9
14542009c:     	leaq	(%r9,%r13), %rcx
1454200a0:     	decq	%rcx
1454200a3:     	addq	%r14, %rdx
1454200a6:     	addq	0x340(%rbp), %r10
1454200ad:     	xorl	%eax, %eax
1454200af:     	cmpq	%rdx, %rcx
1454200b2:     	je	0x1454200e9 <.text+0x541f0e9>
1454200b4:     	movb	$0xa, %r8b
1454200b7:     	mulb	%r8b
1454200ba:     	jo	0x14541fe80 <.text+0x541ee80>
1454200c0:     	movzbl	(%r10,%rdx), %r9d
1454200c5:     	addl	$-0x30, %r9d
1454200c9:     	addb	%r9b, %al
1454200cc:     	setb	%r8b
1454200d0:     	cmpl	$0x9, %r9d
1454200d4:     	ja	0x14541fe80 <.text+0x541ee80>
1454200da:     	incq	%rdx
1454200dd:     	testb	%r8b, %r8b
1454200e0:     	je	0x1454200af <.text+0x541f0af>
1454200e2:     	jmp	0x14541fe80 <.text+0x541ee80>
1454200e7:     	xorl	%eax, %eax
1454200e9:     	testq	%r11, %r11
1454200ec:     	je	0x14541fe80 <.text+0x541ee80>
1454200f2:     	js	0x1454213f3 <.text+0x54203f3>
1454200f8:     	movl	%eax, 0x350(%rbp)
1454200fe:     	movq	%r11, %r14
145420101:     	callq	0x140002200 <.text+0x1200>
145420106:     	movl	$0x1, %r13d
14542010c:     	movl	$0x1, %edx
145420111:     	movq	%r14, %rcx
145420114:     	callq	0x1400021c0 <.text+0x11c0>
145420119:     	testq	%rax, %rax
14542011c:     	je	0x145422ded <.text+0x5421ded>
145420122:     	movq	%rax, 0x328(%rbp)
145420129:     	movq	%rax, %rcx
14542012c:     	movq	%r12, %rdx
14542012f:     	movq	%r14, 0x318(%rbp)
145420136:     	movq	%r14, %r8
145420139:     	callq	0x145756ddd <.text+0x5755ddd>
14542013e:     	movzbl	0x350(%rbp), %r14d
145420146:     	cmpb	$0x4, %r14b
14542014a:     	movl	$0x4, %eax
14542014f:     	cmovael	%eax, %r14d
145420153:     	movq	0x1b0(%rbp), %r12
14542015a:     	cmpq	0x1a0(%rbp), %r12
145420161:     	jne	0x145420170 <.text+0x541f170>
145420163:     	leaq	0x1a0(%rbp), %rcx
14542016a:     	callq	0x1457580b0 <.text+0x57570b0>
14542016f:     	nop
145420170:     	movq	0x1a8(%rbp), %rax
145420177:     	movq	%r12, %rcx
14542017a:     	shlq	$0x5, %rcx
14542017e:     	movq	0x318(%rbp), %r8
145420185:     	movq	%r8, (%rax,%rcx)
145420189:     	movq	0x328(%rbp), %rdx
145420190:     	movq	%rdx, 0x8(%rax,%rcx)
145420195:     	movq	%r8, 0x10(%rax,%rcx)
14542019a:     	movb	%r14b, 0x18(%rax,%rcx)
14542019f:     	incq	%r12
1454201a2:     	movq	%r12, 0x1b0(%rbp)
1454201a9:     	jmp	0x14541fe80 <.text+0x541ee80>
1454201ae:     	nop
1454201b0:     	movzbl	0x311(%rbp), %eax
1454201b7:     	testb	$0x1, %al
1454201b9:     	jne	0x14541fc5b <.text+0x541ec5b>
1454201bf:     	movq	0x2e0(%rbp), %rsi
1454201c6:     	movq	%r15, %rcx
1454201c9:     	movq	%r14, %rdx
1454201cc:     	callq	0x145429e80 <.text+0x5428e80>
1454201d1:     	nop
1454201d2:     	cmpl	$0x1, 0x1f0(%rbp)
1454201d9:     	jne	0x145420200 <.text+0x541f200>
1454201db:     	movq	0x200(%rbp), %rdx
1454201e2:     	movq	0x2d0(%rbp), %rax
1454201e9:     	movq	%rdx, 0x2d0(%rbp)
1454201f0:     	subq	%rax, %rdx
1454201f3:     	addq	%rax, %rsi
1454201f6:     	testq	%rdx, %rdx
1454201f9:     	jne	0x145420242 <.text+0x541f242>
1454201fb:     	jmp	0x145420270 <.text+0x541f270>
1454201fd:     	nopl	(%rax)
145420200:     	cmpb	$0x0, 0x311(%rbp)
145420207:     	jne	0x14541fc5b <.text+0x541ec5b>
14542020d:     	movb	$0x1, 0x311(%rbp)
145420214:     	movq	0x2d0(%rbp), %rsi
14542021b:     	movq	0x2d8(%rbp), %rdx
145420222:     	subq	%rsi, %rdx
145420225:     	setne	%al
145420228:     	orb	0x310(%rbp), %al
14542022e:     	cmpb	$0x1, %al
145420230:     	jne	0x14541fc5b <.text+0x541ec5b>
145420236:     	addq	0x2e0(%rbp), %rsi
14542023d:     	testq	%rdx, %rdx
145420240:     	je	0x145420270 <.text+0x541f270>
145420242:     	cmpb	$0xa, -0x1(%rsi,%rdx)
145420247:     	jne	0x145420270 <.text+0x541f270>
145420249:     	movq	%rdx, %rax
14542024c:     	decq	%rax
14542024f:     	je	0x14542025e <.text+0x541f25e>
145420251:     	cmpb	$0xd, -0x2(%rsi,%rdx)
145420256:     	jne	0x145420262 <.text+0x541f262>
145420258:     	addq	$-0x2, %rdx
14542025c:     	jmp	0x145420270 <.text+0x541f270>
14542025e:     	xorl	%edx, %edx
145420260:     	jmp	0x145420270 <.text+0x541f270>
145420262:     	movq	%rax, %rdx
145420265:     	nopw	%cs:(%rax,%rax)
145420270:     	movq	%rsi, %rcx
145420273:     	callq	0x1400e9d30 <.text+0xe8d30>
145420278:     	nop
145420279:     	movq	$0x0, 0x1f0(%rbp)
145420284:     	movq	%rdx, 0x1f8(%rbp)
14542028b:     	movq	%rax, 0x200(%rbp)
145420292:     	movq	%rdx, 0x208(%rbp)
145420299:     	movq	$0x0, 0x210(%rbp)
1454202a4:     	movq	%rdx, 0x218(%rbp)
1454202ab:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
1454202b5:     	movq	%rax, 0x220(%rbp)
1454202bc:     	movb	$0x1, 0x228(%rbp)
1454202c3:     	movw	$0x1, 0x230(%rbp)
1454202cc:     	movq	%r12, %rcx
1454202cf:     	movq	%r15, %rdx
1454202d2:     	callq	0x14552a460 <.text+0x5529460>
1454202d7:     	nop
1454202d8:     	movq	0x168(%rbp), %r10
1454202df:     	cmpq	$0x3, 0x170(%rbp)
1454202e7:     	jne	0x145420400 <.text+0x541f400>
1454202ed:     	movq	0x8(%r10), %rdi
1454202f1:     	cmpq	$0x5, %rdi
1454202f5:     	jne	0x145420320 <.text+0x541f320>
1454202f7:     	movq	(%r10), %rbx
1454202fa:     	movl	(%rbx), %eax
1454202fc:     	movl	$0x69757165, %ecx       # imm = 0x69757165
145420301:     	xorl	%ecx, %eax
145420303:     	movzbl	0x4(%rbx), %ecx
145420307:     	xorl	$0x70, %ecx
14542030a:     	orl	%eax, %ecx
14542030c:     	jne	0x145420400 <.text+0x541f400>
145420312:     	jmp	0x145420339 <.text+0x541f339>
145420314:     	nopw	%cs:(%rax,%rax)
145420320:     	cmpq	$0x4, %rdi
145420324:     	jne	0x145420400 <.text+0x541f400>
14542032a:     	movq	(%r10), %rbx
14542032d:     	cmpl	$0x6b6f6f6c, (%rbx)     # imm = 0x6B6F6F6C
145420333:     	jne	0x145420400 <.text+0x541f400>
145420339:     	movq	0x18(%r10), %rdx
14542033d:     	testq	%rdx, %rdx
145420340:     	je	0x145420400 <.text+0x541f400>
145420346:     	movq	0x10(%r10), %rcx
14542034a:     	cmpq	$0x1, %rdx
14542034e:     	jne	0x145420367 <.text+0x541f367>
145420350:     	movzbl	(%rcx), %eax
145420353:     	cmpl	$0x2b, %eax
145420356:     	je	0x145420400 <.text+0x541f400>
14542035c:     	cmpl	$0x2d, %eax
14542035f:     	je	0x145420400 <.text+0x541f400>
145420365:     	jmp	0x14542036a <.text+0x541f36a>
145420367:     	movzbl	(%rcx), %eax
14542036a:     	xorl	%r8d, %r8d
14542036d:     	cmpb	$0x2b, %al
14542036f:     	sete	%r8b
145420373:     	movq	%rdx, %rax
145420376:     	subq	%r8, %rax
145420379:     	addq	%r8, %rcx
14542037c:     	cmpq	$0x3, %rax
145420380:     	jae	0x1454203bf <.text+0x541f3bf>
145420382:     	testq	%rax, %rax
145420385:     	je	0x145420436 <.text+0x541f436>
14542038b:     	movzbl	(%rcx), %r13d
14542038f:     	addl	$-0x30, %r13d
145420393:     	cmpl	$0x9, %r13d
145420397:     	ja	0x145420400 <.text+0x541f400>
145420399:     	cmpq	$0x1, %rax
14542039d:     	je	0x145420439 <.text+0x541f439>
1454203a3:     	movzbl	0x1(%rcx), %eax
1454203a7:     	addl	$-0x30, %eax
1454203aa:     	cmpl	$0x9, %eax
1454203ad:     	ja	0x145420400 <.text+0x541f400>
1454203af:     	movzbl	%r13b, %ecx
1454203b3:     	addl	%ecx, %ecx
1454203b5:     	leal	(%rcx,%rcx,4), %ecx
1454203b8:     	addb	%cl, %al
1454203ba:     	movl	%eax, %r13d
1454203bd:     	jmp	0x145420439 <.text+0x541f439>
1454203bf:     	negq	%r8
1454203c2:     	addq	%r8, %rdx
1454203c5:     	negq	%rdx
1454203c8:     	xorl	%r8d, %r8d
1454203cb:     	xorl	%r13d, %r13d
1454203ce:     	movq	%rdx, %rax
1454203d1:     	addq	%r8, %rax
1454203d4:     	je	0x145420439 <.text+0x541f439>
1454203d6:     	movl	%r13d, %eax
1454203d9:     	movb	$0xa, %r9b
1454203dc:     	mulb	%r9b
1454203df:     	jo	0x145420400 <.text+0x541f400>
1454203e1:     	movl	%eax, %r13d
1454203e4:     	movzbl	(%rcx,%r8), %r9d
1454203e9:     	addl	$-0x30, %r9d
1454203ed:     	addb	%r9b, %r13b
1454203f0:     	setb	%al
1454203f3:     	cmpl	$0x9, %r9d
1454203f7:     	ja	0x145420400 <.text+0x541f400>
1454203f9:     	incq	%r8
1454203fc:     	testb	%al, %al
1454203fe:     	je	0x1454203ce <.text+0x541f3ce>
145420400:     	movq	0x160(%rbp), %rdx
145420407:     	testq	%rdx, %rdx
14542040a:     	je	0x1454201b0 <.text+0x541f1b0>
145420410:     	shlq	$0x4, %rdx
145420414:     	movl	$0x8, %r8d
14542041a:     	movq	%r10, %rcx
14542041d:     	callq	0x1400021d0 <.text+0x11d0>
145420422:     	movzbl	0x311(%rbp), %eax
145420429:     	testb	$0x1, %al
14542042b:     	je	0x1454201bf <.text+0x541f1bf>
145420431:     	jmp	0x14541fc5b <.text+0x541ec5b>
145420436:     	xorl	%r13d, %r13d
145420439:     	movq	0x20(%r10), %rax
14542043d:     	movq	%r10, 0x340(%rbp)
145420444:     	movq	0x28(%r10), %rcx
145420448:     	movq	$0x0, 0x1f0(%rbp)
145420453:     	movq	%rcx, 0x1f8(%rbp)
14542045a:     	movq	%rax, 0x200(%rbp)
145420461:     	movq	%rcx, 0x208(%rbp)
145420468:     	movq	$0x0, 0x210(%rbp)
145420473:     	movq	%rcx, 0x218(%rbp)
14542047a:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
145420484:     	movq	%rax, 0x220(%rbp)
14542048b:     	movb	$0x1, 0x228(%rbp)
145420492:     	movw	$0x1, 0x230(%rbp)
14542049b:     	leaq	-0x58(%rbp), %rcx
14542049f:     	movq	%r15, %rdx
1454204a2:     	callq	0x14552cfd0 <.text+0x552bfd0>
1454204a7:     	nop
1454204a8:     	movq	-0x58(%rbp), %rax
1454204ac:     	movq	%rax, 0x358(%rbp)
1454204b3:     	movq	-0x50(%rbp), %rax
1454204b7:     	movq	%rax, 0x350(%rbp)
1454204be:     	movq	-0x48(%rbp), %r12
1454204c2:     	movq	0x1c0(%rbp), %rax
1454204c9:     	movq	0x1c8(%rbp), %rsi
1454204d0:     	imulq	$0xe8, %rsi, %r14
1454204d7:     	testq	%rsi, %rsi
1454204da:     	je	0x1454204fd <.text+0x541f4fd>
1454204dc:     	xorl	%edx, %edx
1454204de:     	xorl	%ecx, %ecx
1454204e0:     	cmpb	%r13b, 0xe4(%rax,%rdx)
1454204e8:     	je	0x145420662 <.text+0x541f662>
1454204ee:     	incq	%rcx
1454204f1:     	addq	$0xe8, %rdx
1454204f8:     	cmpq	%rdx, %r14
1454204fb:     	jne	0x1454204e0 <.text+0x541f4e0>
1454204fd:     	leaq	0x1f4(%rbp), %rcx
145420504:     	movups	%xmm6, 0x3c(%rcx)
145420508:     	movups	%xmm6, 0x30(%rcx)
14542050c:     	movups	%xmm6, 0x20(%rcx)
145420510:     	movups	%xmm6, 0x10(%rcx)
145420514:     	movups	%xmm6, (%rcx)
145420517:     	cmpq	0x1b8(%rbp), %rsi
14542051e:     	jne	0x14542053b <.text+0x541f53b>
145420520:     	movb	$0x1, 0x34f(%rbp)
145420527:     	leaq	0x1b8(%rbp), %rcx
14542052e:     	callq	0x1458cbe10 <.text+0x58cae10>
145420533:     	nop
145420534:     	movq	0x1c0(%rbp), %rax
14542053b:     	movl	$0x0, (%rax,%r14)
145420543:     	movl	$0x0, 0x8(%rax,%r14)
14542054c:     	movl	$0x0, 0x10(%rax,%r14)
145420555:     	movl	$0x0, 0x18(%rax,%r14)
14542055e:     	movl	$0x0, 0x20(%rax,%r14)
145420567:     	movl	$0x0, 0x28(%rax,%r14)
145420570:     	movl	$0x0, 0x30(%rax,%r14)
145420579:     	movl	$0x0, 0x38(%rax,%r14)
145420582:     	movl	$0x0, 0x40(%rax,%r14)
14542058b:     	movl	$0x0, 0x48(%rax,%r14)
145420594:     	movl	$0x0, 0x50(%rax,%r14)
14542059d:     	movl	$0x0, 0x58(%rax,%r14)
1454205a6:     	movl	$0x0, 0x60(%rax,%r14)
1454205af:     	movl	$0x0, 0x68(%rax,%r14)
1454205b8:     	movl	$0x0, 0x70(%rax,%r14)
1454205c1:     	movl	$0x0, 0x78(%rax,%r14)
1454205ca:     	movl	$0x0, 0x80(%rax,%r14)
1454205d6:     	movl	$0x0, 0x88(%rax,%r14)
1454205e2:     	movl	$0x0, 0x90(%rax,%r14)
1454205ee:     	movups	0x230(%rbp), %xmm0
1454205f5:     	movups	%xmm0, 0xd4(%rax,%r14)
1454205fe:     	movups	0x1f0(%rbp), %xmm0
145420605:     	movups	0x200(%rbp), %xmm1
14542060c:     	movups	0x210(%rbp), %xmm2
145420613:     	movups	0x220(%rbp), %xmm3
14542061a:     	movups	%xmm3, 0xc4(%rax,%r14)
145420623:     	movups	%xmm2, 0xb4(%rax,%r14)
14542062c:     	movups	%xmm1, 0xa4(%rax,%r14)
145420635:     	movups	%xmm0, 0x94(%rax,%r14)
14542063e:     	movb	%r13b, 0xe4(%rax,%r14)
145420646:     	leaq	0x1(%rsi), %rax
14542064a:     	movq	%rax, 0x1c8(%rbp)
145420651:     	testq	%r12, %r12
145420654:     	movq	0x350(%rbp), %r10
14542065b:     	jne	0x145420675 <.text+0x541f675>
14542065d:     	jmp	0x145420784 <.text+0x541f784>
145420662:     	movq	%rcx, %rsi
145420665:     	testq	%r12, %r12
145420668:     	movq	0x350(%rbp), %r10
14542066f:     	je	0x145420784 <.text+0x541f784>
145420675:     	shlq	$0x4, %r12
145420679:     	addq	%r10, %r12
14542067c:     	movq	%r10, %rax
14542067f:     	cmpq	$0x5, %rdi
145420683:     	jne	0x145420740 <.text+0x541f740>
145420689:     	movq	%r10, %rax
14542068c:     	nopl	(%rax)
145420690:     	movq	(%rax), %rcx
145420693:     	movl	0x8(%rax), %r8d
145420697:     	movl	(%rbx), %edx
145420699:     	movl	$0x69757165, %r9d       # imm = 0x69757165
14542069f:     	xorl	%r9d, %edx
1454206a2:     	movzbl	0x4(%rbx), %r9d
1454206a7:     	xorl	$0x70, %r9d
1454206ab:     	orl	%edx, %r9d
1454206ae:     	movq	0x1c8(%rbp), %rdx
1454206b5:     	je	0x145420700 <.text+0x541f700>
1454206b7:     	cmpq	%rdx, %rsi
1454206ba:     	jae	0x145422d5c <.text+0x5421d5c>
1454206c0:     	cmpq	$0x12, %rcx
1454206c4:     	ja	0x145422d71 <.text+0x5421d71>
1454206ca:     	imulq	$0xe8, %rsi, %rdx
1454206d1:     	addq	0x1c0(%rbp), %rdx
1454206d8:     	movl	$0x1, (%rdx,%rcx,8)
1454206df:     	movl	%r8d, 0x4(%rdx,%rcx,8)
1454206e4:     	addq	$0x10, %rax
1454206e8:     	cmpq	%r12, %rax
1454206eb:     	jne	0x145420690 <.text+0x541f690>
1454206ed:     	jmp	0x145420784 <.text+0x541f784>
1454206f2:     	nopw	%cs:(%rax,%rax)
145420700:     	cmpq	%rdx, %rsi
145420703:     	jae	0x145422dc1 <.text+0x5421dc1>
145420709:     	cmpq	$0x12, %rcx
14542070d:     	ja	0x145422dd6 <.text+0x5421dd6>
145420713:     	imulq	$0xe8, %rsi, %rdx
14542071a:     	addq	0x1c0(%rbp), %rdx
145420721:     	movl	%r8d, 0x98(%rdx,%rcx,4)
145420729:     	addq	$0x10, %rax
14542072d:     	cmpq	%r12, %rax
145420730:     	jne	0x145420690 <.text+0x541f690>
145420736:     	jmp	0x145420784 <.text+0x541f784>
145420738:     	nopl	(%rax,%rax)
145420740:     	movq	0x1c8(%rbp), %rdx
145420747:     	cmpq	%rdx, %rsi
14542074a:     	jae	0x145422d5c <.text+0x5421d5c>
145420750:     	movq	(%rax), %rcx
145420753:     	cmpq	$0x13, %rcx
145420757:     	jae	0x145422d71 <.text+0x5421d71>
14542075d:     	movl	0x8(%rax), %edx
145420760:     	imulq	$0xe8, %rsi, %r8
145420767:     	addq	0x1c0(%rbp), %r8
14542076e:     	movl	$0x1, (%r8,%rcx,8)
145420776:     	movl	%edx, 0x4(%r8,%rcx,8)
14542077b:     	addq	$0x10, %rax
14542077f:     	cmpq	%r12, %rax
145420782:     	jne	0x145420740 <.text+0x541f740>
145420784:     	movq	0x358(%rbp), %rdx
14542078b:     	testq	%rdx, %rdx
14542078e:     	je	0x1454207a2 <.text+0x541f7a2>
145420790:     	shlq	$0x4, %rdx
145420794:     	movl	$0x8, %r8d
14542079a:     	movq	%r10, %rcx
14542079d:     	callq	0x1400021d0 <.text+0x11d0>
1454207a2:     	movq	0x160(%rbp), %rdx
1454207a9:     	testq	%rdx, %rdx
1454207ac:     	leaq	0x2e0(%rbp), %r14
1454207b3:     	leaq	0x160(%rbp), %r12
1454207ba:     	movq	0x340(%rbp), %r10
1454207c1:     	jne	0x145420410 <.text+0x541f410>
1454207c7:     	jmp	0x1454201b0 <.text+0x541f1b0>
1454207cc:     	movq	0x1b0(%rbp), %rsi
1454207d3:     	cmpq	$0x2, %rsi
1454207d7:     	jae	0x145422a0f <.text+0x5421a0f>
1454207dd:     	leaq	0x1a0(%rbp), %rcx
1454207e4:     	callq	0x145523e10 <.text+0x5522e10>
1454207e9:     	nop
1454207ea:     	movq	$0x0, 0x1f0(%rbp)
1454207f5:     	movq	0x338(%rbp), %rax
1454207fc:     	movq	%rax, 0x1f8(%rbp)
145420803:     	movq	0x330(%rbp), %rcx
14542080a:     	movq	%rcx, 0x200(%rbp)
145420811:     	movq	%rax, 0x208(%rbp)
145420818:     	movq	$0x0, 0x210(%rbp)
145420823:     	movq	%rax, 0x218(%rbp)
14542082a:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145420834:     	movq	%rax, 0x220(%rbp)
14542083b:     	movb	$0x1, 0x228(%rbp)
145420842:     	movw	$0x0, 0x230(%rbp)
14542084b:     	movl	$0xffffffff, 0x26c(%rbp) # imm = 0xFFFFFFFF
145420855:     	movl	$0xffffffff, 0x2b4(%rbp) # imm = 0xFFFFFFFF
14542085f:     	leaq	0xa8(%rbp), %rcx
145420866:     	leaq	0x1f0(%rbp), %rdx
14542086d:     	callq	0x145526fc0 <.text+0x5525fc0>
145420872:     	nop
145420873:     	movq	0xb8(%rbp), %rdx
14542087a:     	cmpq	$0x2, %rdx
14542087e:     	jae	0x145422a43 <.text+0x5421a43>
145420884:     	leaq	0xa8(%rbp), %rcx
14542088b:     	callq	0x145523060 <.text+0x5522060>
145420890:     	nop
145420891:     	movq	$0x0, 0x1f0(%rbp)
14542089c:     	movq	0x338(%rbp), %rax
1454208a3:     	movq	%rax, 0x1f8(%rbp)
1454208aa:     	movq	0x330(%rbp), %rcx
1454208b1:     	movq	%rcx, 0x200(%rbp)
1454208b8:     	movq	%rax, 0x208(%rbp)
1454208bf:     	movq	$0x0, 0x210(%rbp)
1454208ca:     	movq	%rax, 0x218(%rbp)
1454208d1:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1454208db:     	movq	%rax, 0x220(%rbp)
1454208e2:     	movb	$0x1, 0x228(%rbp)
1454208e9:     	movw	$0x0, 0x230(%rbp)
1454208f2:     	movl	$0xffffffff, 0x26c(%rbp) # imm = 0xFFFFFFFF
1454208fc:     	movl	$0xffffffff, 0x2b4(%rbp) # imm = 0xFFFFFFFF
145420906:     	leaq	0x90(%rbp), %rcx
14542090d:     	leaq	0x1f0(%rbp), %rdx
145420914:     	callq	0x14552ad30 <.text+0x5529d30>
145420919:     	nop
14542091a:     	movq	0xa0(%rbp), %rsi
145420921:     	cmpq	$0x2, %rsi
145420925:     	jae	0x145422a6b <.text+0x5421a6b>
14542092b:     	leaq	0x90(%rbp), %rcx
145420932:     	callq	0x145523f50 <.text+0x5522f50>
145420937:     	nop
145420938:     	xorps	%xmm0, %xmm0
14542093b:     	movaps	%xmm0, -0x20(%rbp)
14542093f:     	movaps	%xmm0, -0x30(%rbp)
145420943:     	movaps	%xmm0, -0x40(%rbp)
145420947:     	movq	$0x0, -0x10(%rbp)
14542094f:     	movq	$0x0, 0x1f0(%rbp)
14542095a:     	movq	0x338(%rbp), %rax
145420961:     	movq	%rax, 0x1f8(%rbp)
145420968:     	movq	0x330(%rbp), %rcx
14542096f:     	movq	%rcx, 0x200(%rbp)
145420976:     	movq	%rax, 0x208(%rbp)
14542097d:     	movq	$0x0, 0x210(%rbp)
145420988:     	movq	%rax, 0x218(%rbp)
14542098f:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145420999:     	movq	%rax, 0x220(%rbp)
1454209a0:     	movb	$0x1, 0x228(%rbp)
1454209a7:     	movw	$0x0, 0x230(%rbp)
1454209b0:     	xorl	%eax, %eax
1454209b2:     	jmp	0x1454209c7 <.text+0x541f9c7>
1454209b4:     	nopw	%cs:(%rax,%rax)
1454209c0:     	movzbl	0x231(%rbp), %eax
1454209c7:     	testb	$0x1, %al
1454209c9:     	jne	0x145420e88 <.text+0x541fe88>
1454209cf:     	movq	0x200(%rbp), %rsi
1454209d6:     	leaq	0x2d0(%rbp), %rcx
1454209dd:     	leaq	0x200(%rbp), %rdx
1454209e4:     	callq	0x145429e80 <.text+0x5428e80>
1454209e9:     	nop
1454209ea:     	cmpl	$0x1, 0x2d0(%rbp)
1454209f1:     	jne	0x145420a20 <.text+0x541fa20>
1454209f3:     	movq	0x2e0(%rbp), %rdx
1454209fa:     	movq	0x1f0(%rbp), %rax
145420a01:     	movq	%rdx, 0x1f0(%rbp)
145420a08:     	subq	%rax, %rdx
145420a0b:     	addq	%rax, %rsi
145420a0e:     	testq	%rdx, %rdx
145420a11:     	jne	0x145420a62 <.text+0x541fa62>
145420a13:     	jmp	0x145420a90 <.text+0x541fa90>
145420a15:     	nopw	%cs:(%rax,%rax)
145420a20:     	cmpb	$0x0, 0x231(%rbp)
145420a27:     	jne	0x145420e88 <.text+0x541fe88>
145420a2d:     	movb	$0x1, 0x231(%rbp)
145420a34:     	movq	0x1f0(%rbp), %rsi
145420a3b:     	movq	0x1f8(%rbp), %rdx
145420a42:     	subq	%rsi, %rdx
145420a45:     	setne	%al
145420a48:     	orb	0x230(%rbp), %al
145420a4e:     	cmpb	$0x1, %al
145420a50:     	jne	0x145420e88 <.text+0x541fe88>
145420a56:     	addq	0x200(%rbp), %rsi
145420a5d:     	testq	%rdx, %rdx
145420a60:     	je	0x145420a90 <.text+0x541fa90>
145420a62:     	cmpb	$0xa, -0x1(%rsi,%rdx)
145420a67:     	jne	0x145420a90 <.text+0x541fa90>
145420a69:     	movq	%rdx, %rax
145420a6c:     	decq	%rax
145420a6f:     	je	0x145420a7e <.text+0x541fa7e>
145420a71:     	cmpb	$0xd, -0x2(%rsi,%rdx)
145420a76:     	jne	0x145420a82 <.text+0x541fa82>
145420a78:     	addq	$-0x2, %rdx
145420a7c:     	jmp	0x145420a90 <.text+0x541fa90>
145420a7e:     	xorl	%edx, %edx
145420a80:     	jmp	0x145420a90 <.text+0x541fa90>
145420a82:     	movq	%rax, %rdx
145420a85:     	nopw	%cs:(%rax,%rax)
145420a90:     	movq	%rsi, %rcx
145420a93:     	callq	0x1400e9d30 <.text+0xe8d30>
145420a98:     	nop
145420a99:     	movq	%rdx, %r14
145420a9c:     	cmpq	$0x5, %rdx
145420aa0:     	jb	0x1454209c0 <.text+0x541f9c0>
145420aa6:     	movl	(%rax), %ecx
145420aa8:     	movl	$0x74617473, %edx       # imm = 0x74617473
145420aad:     	xorl	%edx, %ecx
145420aaf:     	movzbl	0x4(%rax), %edx
145420ab3:     	xorl	$0x7c, %edx
145420ab6:     	orl	%ecx, %edx
145420ab8:     	jne	0x1454209c0 <.text+0x541f9c0>
145420abe:     	addq	$-0x5, %r14
145420ac2:     	leaq	0x5(%rax), %rsi
145420ac6:     	addq	$0x6, %rax
145420aca:     	movq	%rax, 0x340(%rbp)
145420ad1:     	movq	$0x0, 0x350(%rbp)
145420adc:     	xorl	%r12d, %r12d
145420adf:     	movl	$0x0, 0x358(%rbp)
145420ae9:     	nopl	(%rax)
145420af0:     	movq	0x350(%rbp), %rdi
145420af7:     	testb	$0x1, 0x358(%rbp)
145420afe:     	jne	0x1454209c0 <.text+0x541f9c0>
145420b04:     	movb	$0x1, %al
145420b06:     	movl	%eax, 0x358(%rbp)
145420b0c:     	cmpq	%r12, %r14
145420b0f:     	jae	0x145420b2c <.text+0x541fb2c>
145420b11:     	movq	%rdi, 0x350(%rbp)
145420b18:     	jmp	0x145420bd6 <.text+0x541fbd6>
145420b1d:     	nopl	(%rax)
145420b20:     	movq	%rax, %r12
145420b23:     	cmpq	%rax, %r14
145420b26:     	jb	0x145420bcc <.text+0x541fbcc>
145420b2c:     	movq	%r14, %r8
145420b2f:     	subq	%r12, %r8
145420b32:     	leaq	(%rsi,%r12), %rdx
145420b36:     	cmpq	$0x10, %r8
145420b3a:     	jae	0x145420b70 <.text+0x541fb70>
145420b3c:     	xorl	%r13d, %r13d
145420b3f:     	testq	%r8, %r8
145420b42:     	je	0x145420b62 <.text+0x541fb62>
145420b44:     	nopw	%cs:(%rax,%rax)
145420b50:     	cmpb	$0x2c, (%rdx,%r13)
145420b55:     	je	0x145420b83 <.text+0x541fb83>
145420b57:     	incq	%r13
145420b5a:     	cmpq	%r13, %r8
145420b5d:     	jne	0x145420b50 <.text+0x541fb50>
145420b5f:     	movq	%r8, %r13
145420b62:     	xorl	%eax, %eax
145420b64:     	cmpq	$0x1, %rax
145420b68:     	je	0x145420b90 <.text+0x541fb90>
145420b6a:     	jmp	0x145420bc0 <.text+0x541fbc0>
145420b6c:     	nopl	(%rax)
145420b70:     	movb	$0x2c, %cl
145420b72:     	callq	0x145714db0 <.text+0x5713db0>
145420b77:     	nop
145420b78:     	movq	%rdx, %r13
145420b7b:     	cmpq	$0x1, %rax
145420b7f:     	je	0x145420b90 <.text+0x541fb90>
145420b81:     	jmp	0x145420bc0 <.text+0x541fbc0>
145420b83:     	movl	$0x1, %eax
145420b88:     	cmpq	$0x1, %rax
145420b8c:     	jne	0x145420bc0 <.text+0x541fbc0>
145420b8e:     	nop
145420b90:     	leaq	(%r12,%r13), %rax
145420b94:     	incq	%rax
145420b97:     	addq	%r12, %r13
145420b9a:     	cmpq	%r14, %r13
145420b9d:     	jae	0x145420b20 <.text+0x541fb20>
145420b9f:     	cmpb	$0x2c, (%rsi,%r13)
145420ba4:     	jne	0x145420b20 <.text+0x541fb20>
145420baa:     	movl	$0x0, 0x358(%rbp)
145420bb4:     	movq	%rax, 0x350(%rbp)
145420bbb:     	movq	%rax, %r12
145420bbe:     	jmp	0x145420bd9 <.text+0x541fbd9>
145420bc0:     	movq	%rdi, 0x350(%rbp)
145420bc7:     	movq	%r14, %r12
145420bca:     	jmp	0x145420bd6 <.text+0x541fbd6>
145420bcc:     	movq	%rdi, 0x350(%rbp)
145420bd3:     	movq	%rax, %r12
145420bd6:     	movq	%r14, %r13
145420bd9:     	subq	%rdi, %r13
145420bdc:     	leaq	(%rsi,%rdi), %rbx
145420be0:     	xorl	%r15d, %r15d
145420be3:     	jmp	0x145420bfc <.text+0x541fbfc>
145420be5:     	nopw	%cs:(%rax,%rax)
145420bf0:     	movq	%rax, %r15
145420bf3:     	cmpq	%rax, %r13
145420bf6:     	jb	0x145420af0 <.text+0x541faf0>
145420bfc:     	movq	%r13, %r8
145420bff:     	subq	%r15, %r8
145420c02:     	leaq	(%rbx,%r15), %rax
145420c06:     	cmpq	$0x10, %r8
145420c0a:     	jae	0x145420c40 <.text+0x541fc40>
145420c0c:     	xorl	%edx, %edx
145420c0e:     	testq	%r8, %r8
145420c11:     	je	0x145420c31 <.text+0x541fc31>
145420c13:     	nopw	%cs:(%rax,%rax)
145420c20:     	cmpb	$0x3d, (%rax,%rdx)
145420c24:     	je	0x145420c6d <.text+0x541fc6d>
145420c26:     	incq	%rdx
145420c29:     	cmpq	%rdx, %r8
145420c2c:     	jne	0x145420c20 <.text+0x541fc20>
145420c2e:     	movq	%r8, %rdx
145420c31:     	xorl	%eax, %eax
145420c33:     	cmpq	$0x1, %rax
145420c37:     	je	0x145420c55 <.text+0x541fc55>
145420c39:     	jmp	0x145420af0 <.text+0x541faf0>
145420c3e:     	nop
145420c40:     	movb	$0x3d, %cl
145420c42:     	movq	%rax, %rdx
145420c45:     	callq	0x145714db0 <.text+0x5713db0>
145420c4a:     	nop
145420c4b:     	cmpq	$0x1, %rax
145420c4f:     	jne	0x145420af0 <.text+0x541faf0>
145420c55:     	leaq	(%rdx,%r15), %rax
145420c59:     	incq	%rax
145420c5c:     	leaq	(%rdx,%r15), %rcx
145420c60:     	cmpq	%r13, %rcx
145420c63:     	jae	0x145420bf0 <.text+0x541fbf0>
145420c65:     	cmpb	$0x3d, (%rbx,%rcx)
145420c69:     	jne	0x145420bf0 <.text+0x541fbf0>
145420c6b:     	jmp	0x145420c7d <.text+0x541fc7d>
145420c6d:     	movl	$0x1, %eax
145420c72:     	cmpq	$0x1, %rax
145420c76:     	je	0x145420c55 <.text+0x541fc55>
145420c78:     	jmp	0x145420af0 <.text+0x541faf0>
145420c7d:     	xorl	%r8d, %r8d
145420c80:     	leaq	-0x4(%rcx), %r9
145420c84:     	cmpq	$0x5, %r9
145420c88:     	ja	0x145420d50 <.text+0x541fd50>
145420c8e:     	leaq	0x13002af(%rip), %r10   # 0x146720f44
145420c95:     	movslq	(%r10,%r9,4), %r9
145420c99:     	addq	%r10, %r9
145420c9c:     	jmpq	*%r9
145420c9f:     	cmpl	$0x646c6f67, (%rbx)     # imm = 0x646C6F67
145420ca5:     	je	0x145420d65 <.text+0x541fd65>
145420cab:     	cmpl	$0x736e7572, (%rbx)     # imm = 0x736E7572
145420cb1:     	je	0x145420d75 <.text+0x541fd75>
145420cb7:     	cmpl	$0x736e6977, (%rbx)     # imm = 0x736E6977
145420cbd:     	jne	0x145420d4d <.text+0x541fd4d>
145420cc3:     	movl	$0x5, %r8d
145420cc9:     	jmp	0x145420d7b <.text+0x541fd7b>
145420cce:     	movl	(%rbx), %r8d
145420cd1:     	movl	$0x73736f62, %r9d       # imm = 0x73736F62
145420cd7:     	xorl	%r9d, %r8d
145420cda:     	movzwl	0x4(%rbx), %r9d
145420cdf:     	xorl	$0x7365, %r9d           # imm = 0x7365
145420ce6:     	orl	%r8d, %r9d
145420ce9:     	je	0x145420d5d <.text+0x541fd5d>
145420ceb:     	movl	(%rbx), %r8d
145420cee:     	movl	$0x68636163, %r9d       # imm = 0x68636163
145420cf4:     	xorl	%r9d, %r8d
145420cf7:     	movzwl	0x4(%rbx), %r9d
145420cfc:     	xorl	$0x7365, %r9d           # imm = 0x7365
145420d03:     	orl	%r8d, %r9d
145420d06:     	jne	0x145420d4d <.text+0x541fd4d>
145420d08:     	movl	$0x6, %r8d
145420d0e:     	jmp	0x145420d7b <.text+0x541fd7b>
145420d10:     	movl	(%rbx), %r8d
145420d13:     	movl	$0x6c6c696b, %r9d       # imm = 0x6C6C696B
145420d19:     	xorl	%r9d, %r8d
145420d1c:     	movzbl	0x4(%rbx), %r9d
145420d21:     	xorl	$0x73, %r9d
145420d25:     	orl	%r8d, %r9d
145420d28:     	jne	0x145420d4d <.text+0x541fd4d>
145420d2a:     	xorl	%r8d, %r8d
145420d2d:     	jmp	0x145420d7b <.text+0x541fd7b>
145420d2f:     	movq	(%rbx), %r8
145420d32:     	movabsq	$0x6e61696472617567, %r9 # imm = 0x6E61696472617567
145420d3c:     	xorq	%r9, %r8
145420d3f:     	movzbl	0x8(%rbx), %r9d
145420d44:     	xorq	$0x73, %r9
145420d48:     	orq	%r8, %r9
145420d4b:     	je	0x145420d6d <.text+0x541fd6d>
145420d4d:     	xorl	%r8d, %r8d
145420d50:     	movq	%r13, %r9
145420d53:     	subq	%rax, %r9
145420d56:     	jne	0x145420d91 <.text+0x541fd91>
145420d58:     	jmp	0x145420af0 <.text+0x541faf0>
145420d5d:     	movl	$0x3, %r8d
145420d63:     	jmp	0x145420d7b <.text+0x541fd7b>
145420d65:     	movl	$0x1, %r8d
145420d6b:     	jmp	0x145420d7b <.text+0x541fd7b>
145420d6d:     	movl	$0x2, %r8d
145420d73:     	jmp	0x145420d7b <.text+0x541fd7b>
145420d75:     	movl	$0x4, %r8d
145420d7b:     	leaq	0x12ffcbe(%rip), %r9    # 0x146720a40
145420d82:     	addq	%r9, %r8
145420d85:     	movq	%r13, %r9
145420d88:     	subq	%rax, %r9
145420d8b:     	je	0x145420af0 <.text+0x541faf0>
145420d91:     	cmpq	$0x1, %r9
145420d95:     	jne	0x145420db2 <.text+0x541fdb2>
145420d97:     	movzbl	(%rbx,%rax), %r10d
145420d9c:     	cmpl	$0x2b, %r10d
145420da0:     	je	0x145420af0 <.text+0x541faf0>
145420da6:     	cmpl	$0x2d, %r10d
145420daa:     	je	0x145420af0 <.text+0x541faf0>
145420db0:     	jmp	0x145420db7 <.text+0x541fdb7>
145420db2:     	movzbl	(%rbx,%rax), %r10d
145420db7:     	xorl	%eax, %eax
145420db9:     	cmpb	$0x2b, %r10b
145420dbd:     	sete	%al
145420dc0:     	movq	%rax, %r10
145420dc3:     	negq	%r10
145420dc6:     	subq	%rax, %r9
145420dc9:     	cmpq	$0x11, %r9
145420dcd:     	jae	0x145420e18 <.text+0x541fe18>
145420dcf:     	testq	%r9, %r9
145420dd2:     	je	0x145420e63 <.text+0x541fe63>
145420dd8:     	addq	%rax, %rdi
145420ddb:     	addq	0x340(%rbp), %rdi
145420de2:     	addq	%r15, %rdx
145420de5:     	leaq	(%r10,%r13), %rcx
145420de9:     	decq	%rcx
145420dec:     	xorl	%eax, %eax
145420dee:     	nop
145420df0:     	movzbl	(%rdi,%rdx), %r9d
145420df5:     	addl	$-0x30, %r9d
145420df9:     	cmpl	$0x9, %r9d
145420dfd:     	ja	0x145420af0 <.text+0x541faf0>
145420e03:     	leaq	(%rax,%rax,4), %rax
145420e07:     	movl	%r9d, %r9d
145420e0a:     	leaq	(%r9,%rax,2), %rax
145420e0e:     	incq	%rdx
145420e11:     	cmpq	%rdx, %rcx
145420e14:     	jne	0x145420df0 <.text+0x541fdf0>
145420e16:     	jmp	0x145420e65 <.text+0x541fe65>
145420e18:     	leaq	(%r10,%r13), %r9
145420e1c:     	decq	%r9
145420e1f:     	addq	%rax, %rdi
145420e22:     	addq	0x340(%rbp), %rdi
145420e29:     	xorl	%eax, %eax
145420e2b:     	cmpq	%rcx, %r9
145420e2e:     	je	0x145420e65 <.text+0x541fe65>
145420e30:     	movl	$0xa, %edx
145420e35:     	mulq	%rdx
145420e38:     	jo	0x145420af0 <.text+0x541faf0>
145420e3e:     	movzbl	(%rdi,%rcx), %r10d
145420e43:     	addl	$-0x30, %r10d
145420e47:     	addq	%r10, %rax
145420e4a:     	setb	%dl
145420e4d:     	cmpl	$0x9, %r10d
145420e51:     	ja	0x145420af0 <.text+0x541faf0>
145420e57:     	incq	%rcx
145420e5a:     	testb	%dl, %dl
145420e5c:     	je	0x145420e2b <.text+0x541fe2b>
145420e5e:     	jmp	0x145420af0 <.text+0x541faf0>
145420e63:     	xorl	%eax, %eax
145420e65:     	testq	%r8, %r8
145420e68:     	je	0x145420af0 <.text+0x541faf0>
145420e6e:     	movzbl	(%r8), %ecx
145420e72:     	movq	-0x40(%rbp,%rcx,8), %rdx
145420e77:     	cmpq	%rdx, %rax
145420e7a:     	cmovaq	%rax, %rdx
145420e7e:     	movq	%rdx, -0x40(%rbp,%rcx,8)
145420e83:     	jmp	0x145420af0 <.text+0x541faf0>
145420e88:     	movq	$0x0, 0xf8(%rbp)
145420e93:     	movq	$0x8, 0x100(%rbp)
145420e9e:     	movq	$0x0, 0x108(%rbp)
145420ea9:     	movq	$0x0, 0x2d0(%rbp)
145420eb4:     	movq	0x338(%rbp), %rax
145420ebb:     	movq	%rax, 0x2d8(%rbp)
145420ec2:     	leaq	0x2e0(%rbp), %r14
145420ec9:     	movq	0x330(%rbp), %rcx
145420ed0:     	movq	%rcx, 0x2e0(%rbp)
145420ed7:     	movq	%rax, 0x2e8(%rbp)
145420ede:     	movq	$0x0, 0x2f0(%rbp)
145420ee9:     	movq	%rax, 0x2f8(%rbp)
145420ef0:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145420efa:     	movq	%rax, 0x300(%rbp)
145420f01:     	movb	$0x1, 0x308(%rbp)
145420f08:     	movw	$0x0, 0x310(%rbp)
145420f11:     	xorl	%eax, %eax
145420f13:     	leaq	0x1f0(%rbp), %r15
145420f1a:     	leaq	0x160(%rbp), %r12
145420f21:     	leaq	0xf8(%rbp), %r13
145420f28:     	movb	$0xa, %bl
145420f2a:     	testb	$0x1, %al
145420f2c:     	je	0x14542111f <.text+0x542011f>
145420f32:     	movq	0x108(%rbp), %rdx
145420f39:     	cmpq	$0x2, %rdx
145420f3d:     	jae	0x145422a9f <.text+0x5421a9f>
145420f43:     	movq	$0x0, 0x1f0(%rbp)
145420f4e:     	movq	0x338(%rbp), %rax
145420f55:     	movq	%rax, 0x1f8(%rbp)
145420f5c:     	movq	0x330(%rbp), %rcx
145420f63:     	movq	%rcx, 0x200(%rbp)
145420f6a:     	movq	%rax, 0x208(%rbp)
145420f71:     	movq	$0x0, 0x210(%rbp)
145420f7c:     	movq	%rax, 0x218(%rbp)
145420f83:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145420f8d:     	movq	%rax, 0x220(%rbp)
145420f94:     	movb	$0x1, 0x228(%rbp)
145420f9b:     	movw	$0x0, 0x230(%rbp)
145420fa4:     	movl	$0xffffffff, 0x26c(%rbp) # imm = 0xFFFFFFFF
145420fae:     	movl	$0xffffffff, 0x2b4(%rbp) # imm = 0xFFFFFFFF
145420fb8:     	leaq	0x78(%rbp), %rcx
145420fbc:     	leaq	0x1f0(%rbp), %rdx
145420fc3:     	callq	0x14552aa90 <.text+0x5529a90>
145420fc8:     	nop
145420fc9:     	movq	0x88(%rbp), %rsi
145420fd0:     	cmpq	$0x2, %rsi
145420fd4:     	jae	0x145422b62 <.text+0x5421b62>
145420fda:     	leaq	0x78(%rbp), %rcx
145420fde:     	callq	0x145523f50 <.text+0x5522f50>
145420fe3:     	nop
145420fe4:     	movq	$0x0, 0x1f0(%rbp)
145420fef:     	movq	0x338(%rbp), %rax
145420ff6:     	movq	%rax, 0x1f8(%rbp)
145420ffd:     	movq	0x330(%rbp), %rcx
145421004:     	movq	%rcx, 0x200(%rbp)
14542100b:     	movq	%rax, 0x208(%rbp)
145421012:     	movq	$0x0, 0x210(%rbp)
14542101d:     	movq	%rax, 0x218(%rbp)
145421024:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
14542102e:     	movq	%rax, 0x220(%rbp)
145421035:     	movb	$0x1, 0x228(%rbp)
14542103c:     	movw	$0x0, 0x230(%rbp)
145421045:     	movl	$0xffffffff, 0x26c(%rbp) # imm = 0xFFFFFFFF
14542104f:     	movl	$0xffffffff, 0x2b4(%rbp) # imm = 0xFFFFFFFF
145421059:     	leaq	0xc0(%rbp), %rcx
145421060:     	leaq	0x1f0(%rbp), %rdx
145421067:     	callq	0x14552fa00 <.text+0x552ea00>
14542106c:     	nop
14542106d:     	movq	0xd0(%rbp), %r14
145421074:     	cmpq	$0x2, %r14
145421078:     	jae	0x145422b96 <.text+0x5421b96>
14542107e:     	movq	$0x0, 0x1f0(%rbp)
145421089:     	movq	0x338(%rbp), %rax
145421090:     	movq	%rax, 0x1f8(%rbp)
145421097:     	leaq	0x200(%rbp), %r14
14542109e:     	movq	0x330(%rbp), %rcx
1454210a5:     	movq	%rcx, 0x200(%rbp)
1454210ac:     	movq	%rax, 0x208(%rbp)
1454210b3:     	movq	$0x0, 0x210(%rbp)
1454210be:     	movq	%rax, 0x218(%rbp)
1454210c5:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
1454210cf:     	movq	%rax, 0x220(%rbp)
1454210d6:     	movb	$0x1, 0x228(%rbp)
1454210dd:     	movw	$0x0, 0x230(%rbp)
1454210e6:     	xorl	%r13d, %r13d
1454210e9:     	leaq	0x2d0(%rbp), %r15
1454210f0:     	movl	$0x65736572, %edi       # imm = 0x65736572
1454210f5:     	movl	$0x7c737465, %ebx       # imm = 0x7C737465
1454210fa:     	movl	$0xa, %r12d
145421100:     	xorl	%eax, %eax
145421102:     	jmp	0x145421427 <.text+0x5420427>
145421107:     	nopw	(%rax,%rax)
145421110:     	movzbl	0x311(%rbp), %eax
145421117:     	testb	$0x1, %al
145421119:     	jne	0x145420f32 <.text+0x541ff32>
14542111f:     	movq	0x2e0(%rbp), %rsi
145421126:     	movq	%r15, %rcx
145421129:     	movq	%r14, %rdx
14542112c:     	callq	0x145429e80 <.text+0x5428e80>
145421131:     	nop
145421132:     	cmpl	$0x1, 0x1f0(%rbp)
145421139:     	jne	0x145421160 <.text+0x5420160>
14542113b:     	movq	0x200(%rbp), %rdx
145421142:     	movq	0x2d0(%rbp), %rax
145421149:     	movq	%rdx, 0x2d0(%rbp)
145421150:     	subq	%rax, %rdx
145421153:     	addq	%rax, %rsi
145421156:     	testq	%rdx, %rdx
145421159:     	jne	0x1454211a2 <.text+0x54201a2>
14542115b:     	jmp	0x1454211d0 <.text+0x54201d0>
14542115d:     	nopl	(%rax)
145421160:     	cmpb	$0x0, 0x311(%rbp)
145421167:     	jne	0x145420f32 <.text+0x541ff32>
14542116d:     	movb	$0x1, 0x311(%rbp)
145421174:     	movq	0x2d0(%rbp), %rsi
14542117b:     	movq	0x2d8(%rbp), %rdx
145421182:     	subq	%rsi, %rdx
145421185:     	setne	%al
145421188:     	orb	0x310(%rbp), %al
14542118e:     	cmpb	$0x1, %al
145421190:     	jne	0x145420f32 <.text+0x541ff32>
145421196:     	addq	0x2e0(%rbp), %rsi
14542119d:     	testq	%rdx, %rdx
1454211a0:     	je	0x1454211d0 <.text+0x54201d0>
1454211a2:     	cmpb	$0xa, -0x1(%rsi,%rdx)
1454211a7:     	jne	0x1454211d0 <.text+0x54201d0>
1454211a9:     	movq	%rdx, %rax
1454211ac:     	decq	%rax
1454211af:     	je	0x1454211be <.text+0x54201be>
1454211b1:     	cmpb	$0xd, -0x2(%rsi,%rdx)
1454211b6:     	jne	0x1454211c2 <.text+0x54201c2>
1454211b8:     	addq	$-0x2, %rdx
1454211bc:     	jmp	0x1454211d0 <.text+0x54201d0>
1454211be:     	xorl	%edx, %edx
1454211c0:     	jmp	0x1454211d0 <.text+0x54201d0>
1454211c2:     	movq	%rax, %rdx
1454211c5:     	nopw	%cs:(%rax,%rax)
1454211d0:     	movq	%rsi, %rcx
1454211d3:     	callq	0x1400e9d30 <.text+0xe8d30>
1454211d8:     	nop
1454211d9:     	movq	$0x0, 0x1f0(%rbp)
1454211e4:     	movq	%rdx, 0x1f8(%rbp)
1454211eb:     	movq	%rax, 0x200(%rbp)
1454211f2:     	movq	%rdx, 0x208(%rbp)
1454211f9:     	movq	$0x0, 0x210(%rbp)
145421204:     	movq	%rdx, 0x218(%rbp)
14542120b:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145421215:     	movq	%rax, 0x220(%rbp)
14542121c:     	movb	$0x1, 0x228(%rbp)
145421223:     	movw	$0x1, 0x230(%rbp)
14542122c:     	movq	%r12, %rcx
14542122f:     	movq	%r15, %rdx
145421232:     	callq	0x14552a460 <.text+0x5529460>
145421237:     	nop
145421238:     	movq	0x168(%rbp), %rcx
14542123f:     	cmpq	$0x3, 0x170(%rbp)
145421247:     	jne	0x145421260 <.text+0x5420260>
145421249:     	cmpq	$0x4, 0x8(%rcx)
14542124e:     	jne	0x145421260 <.text+0x5420260>
145421250:     	movq	(%rcx), %rax
145421253:     	cmpl	$0x74616562, (%rax)     # imm = 0x74616562
145421259:     	je	0x145421293 <.text+0x5420293>
14542125b:     	nopl	(%rax,%rax)
145421260:     	movq	0x160(%rbp), %rdx
145421267:     	testq	%rdx, %rdx
14542126a:     	je	0x145421110 <.text+0x5420110>
145421270:     	shlq	$0x4, %rdx
145421274:     	movl	$0x8, %r8d
14542127a:     	callq	0x1400021d0 <.text+0x11d0>
14542127f:     	movzbl	0x311(%rbp), %eax
145421286:     	testb	$0x1, %al
145421288:     	je	0x14542111f <.text+0x542011f>
14542128e:     	jmp	0x145420f32 <.text+0x541ff32>
145421293:     	movq	0x18(%rcx), %rdx
145421297:     	testq	%rdx, %rdx
14542129a:     	je	0x145421260 <.text+0x5420260>
14542129c:     	movq	0x10(%rcx), %r11
1454212a0:     	cmpq	$0x1, %rdx
1454212a4:     	jne	0x1454212b8 <.text+0x54202b8>
1454212a6:     	movzbl	(%r11), %r8d
1454212aa:     	cmpl	$0x2b, %r8d
1454212ae:     	je	0x145421260 <.text+0x5420260>
1454212b0:     	cmpl	$0x2d, %r8d
1454212b4:     	je	0x145421260 <.text+0x5420260>
1454212b6:     	jmp	0x1454212bc <.text+0x54202bc>
1454212b8:     	movzbl	(%r11), %r8d
1454212bc:     	xorl	%eax, %eax
1454212be:     	cmpb	$0x2b, %r8b
1454212c2:     	sete	%al
1454212c5:     	movq	%rdx, %r8
1454212c8:     	subq	%rax, %r8
1454212cb:     	addq	%rax, %r11
1454212ce:     	cmpq	$0x3, %r8
1454212d2:     	jae	0x14542130e <.text+0x542030e>
1454212d4:     	testq	%r8, %r8
1454212d7:     	je	0x145421353 <.text+0x5420353>
1454212d9:     	movzbl	(%r11), %eax
1454212dd:     	addl	$-0x30, %eax
1454212e0:     	cmpl	$0x9, %eax
1454212e3:     	ja	0x145421260 <.text+0x5420260>
1454212e9:     	cmpq	$0x1, %r8
1454212ed:     	je	0x145421355 <.text+0x5420355>
1454212ef:     	movzbl	0x1(%r11), %edx
1454212f4:     	addl	$-0x30, %edx
1454212f7:     	cmpl	$0x9, %edx
1454212fa:     	ja	0x145421260 <.text+0x5420260>
145421300:     	movzbl	%al, %eax
145421303:     	addl	%eax, %eax
145421305:     	leal	(%rax,%rax,4), %eax
145421308:     	addb	%al, %dl
14542130a:     	movl	%edx, %eax
14542130c:     	jmp	0x145421355 <.text+0x5420355>
14542130e:     	negq	%rax
145421311:     	addq	%rax, %rdx
145421314:     	negq	%rdx
145421317:     	xorl	%r8d, %r8d
14542131a:     	xorl	%eax, %eax
14542131c:     	movq	%rdx, %r9
14542131f:     	addq	%r8, %r9
145421322:     	je	0x145421355 <.text+0x5420355>
145421324:     	mulb	%bl
145421326:     	jo	0x145421260 <.text+0x5420260>
14542132c:     	movzbl	(%r11,%r8), %r10d
145421331:     	addl	$-0x30, %r10d
145421335:     	addb	%r10b, %al
145421338:     	setb	%r9b
14542133c:     	cmpl	$0x9, %r10d
145421340:     	ja	0x145421260 <.text+0x5420260>
145421346:     	incq	%r8
145421349:     	testb	%r9b, %r9b
14542134c:     	je	0x14542131c <.text+0x542031c>
14542134e:     	jmp	0x145421260 <.text+0x5420260>
145421353:     	xorl	%eax, %eax
145421355:     	movb	%al, 0x1d8(%rbp)
14542135b:     	movq	0x20(%rcx), %rax
14542135f:     	movq	%rcx, 0x358(%rbp)
145421366:     	movq	0x28(%rcx), %rcx
14542136a:     	movq	$0x0, 0x1f8(%rbp)
145421375:     	movq	%rcx, 0x200(%rbp)
14542137c:     	movq	%rax, 0x208(%rbp)
145421383:     	movq	%rcx, 0x210(%rbp)
14542138a:     	movq	$0x0, 0x218(%rbp)
145421395:     	movq	%rcx, 0x220(%rbp)
14542139c:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
1454213a6:     	movq	%rax, 0x228(%rbp)
1454213ad:     	movb	$0x1, 0x230(%rbp)
1454213b4:     	movw	$0x1, 0x238(%rbp)
1454213bd:     	leaq	0x1d8(%rbp), %rax
1454213c4:     	movq	%rax, 0x1f0(%rbp)
1454213cb:     	movq	%r13, %rcx
1454213ce:     	movq	%r15, %rdx
1454213d1:     	callq	0x145524640 <.text+0x5523640>
1454213d6:     	nop
1454213d7:     	movq	0x160(%rbp), %rdx
1454213de:     	testq	%rdx, %rdx
1454213e1:     	movq	0x358(%rbp), %rcx
1454213e8:     	jne	0x145421270 <.text+0x5420270>
1454213ee:     	jmp	0x145421110 <.text+0x5420110>
1454213f3:     	xorl	%r13d, %r13d
1454213f6:     	movq	%r13, %rcx
1454213f9:     	movq	0x328(%rbp), %rdx
145421400:     	callq	0x1458e721b <.text+0x58e621b>
145421405:     	nop
145421406:     	jmp	0x145422ee1 <.text+0x5421ee1>
14542140b:     	shlq	$0x20, %rax
14542140f:     	testb	$0x1, %al
145421411:     	je	0x1454215de <.text+0x54205de>
145421417:     	nopw	(%rax,%rax)
145421420:     	movzbl	0x231(%rbp), %eax
145421427:     	testb	$0x1, %al
145421429:     	jne	0x1454215e5 <.text+0x54205e5>
14542142f:     	movq	0x200(%rbp), %rsi
145421436:     	movq	%r15, %rcx
145421439:     	movq	%r14, %rdx
14542143c:     	callq	0x145429e80 <.text+0x5428e80>
145421441:     	nop
145421442:     	cmpl	$0x1, 0x2d0(%rbp)
145421449:     	jne	0x145421470 <.text+0x5420470>
14542144b:     	movq	0x2e0(%rbp), %rdx
145421452:     	movq	0x1f0(%rbp), %rax
145421459:     	movq	%rdx, 0x1f0(%rbp)
145421460:     	subq	%rax, %rdx
145421463:     	addq	%rax, %rsi
145421466:     	testq	%rdx, %rdx
145421469:     	jne	0x1454214b2 <.text+0x54204b2>
14542146b:     	jmp	0x1454214e0 <.text+0x54204e0>
14542146d:     	nopl	(%rax)
145421470:     	cmpb	$0x0, 0x231(%rbp)
145421477:     	jne	0x1454215e5 <.text+0x54205e5>
14542147d:     	movb	$0x1, 0x231(%rbp)
145421484:     	movq	0x1f0(%rbp), %rsi
14542148b:     	movq	0x1f8(%rbp), %rdx
145421492:     	subq	%rsi, %rdx
145421495:     	setne	%al
145421498:     	orb	0x230(%rbp), %al
14542149e:     	cmpb	$0x1, %al
1454214a0:     	jne	0x1454215e5 <.text+0x54205e5>
1454214a6:     	addq	0x200(%rbp), %rsi
1454214ad:     	testq	%rdx, %rdx
1454214b0:     	je	0x1454214e0 <.text+0x54204e0>
1454214b2:     	cmpb	$0xa, -0x1(%rsi,%rdx)
1454214b7:     	jne	0x1454214e0 <.text+0x54204e0>
1454214b9:     	movq	%rdx, %rax
1454214bc:     	decq	%rax
1454214bf:     	je	0x1454214ce <.text+0x54204ce>
1454214c1:     	cmpb	$0xd, -0x2(%rsi,%rdx)
1454214c6:     	jne	0x1454214d2 <.text+0x54204d2>
1454214c8:     	addq	$-0x2, %rdx
1454214cc:     	jmp	0x1454214e0 <.text+0x54204e0>
1454214ce:     	xorl	%edx, %edx
1454214d0:     	jmp	0x1454214e0 <.text+0x54204e0>
1454214d2:     	movq	%rax, %rdx
1454214d5:     	nopw	%cs:(%rax,%rax)
1454214e0:     	movq	%rsi, %rcx
1454214e3:     	callq	0x1400e9d30 <.text+0xe8d30>
1454214e8:     	nop
1454214e9:     	cmpq	$0x7, %rdx
1454214ed:     	jb	0x145421420 <.text+0x5420420>
1454214f3:     	movl	(%rax), %ecx
1454214f5:     	xorl	%edi, %ecx
1454214f7:     	movl	0x3(%rax), %r8d
1454214fb:     	xorl	%ebx, %r8d
1454214fe:     	orl	%ecx, %r8d
145421501:     	jne	0x145421420 <.text+0x5420420>
145421507:     	movq	%rdx, %rcx
14542150a:     	subq	$0x7, %rcx
14542150e:     	je	0x145421420 <.text+0x5420420>
145421514:     	leaq	0x7(%rax), %r8
145421518:     	cmpq	$0x8, %rdx
14542151c:     	jne	0x145421536 <.text+0x5420536>
14542151e:     	movzbl	(%r8), %eax
145421522:     	cmpl	$0x2b, %eax
145421525:     	je	0x145421420 <.text+0x5420420>
14542152b:     	cmpl	$0x2d, %eax
14542152e:     	je	0x145421420 <.text+0x5420420>
145421534:     	jmp	0x14542153a <.text+0x542053a>
145421536:     	movzbl	(%r8), %eax
14542153a:     	xorl	%edx, %edx
14542153c:     	cmpb	$0x2b, %al
14542153e:     	sete	%dl
145421541:     	subq	%rdx, %rcx
145421544:     	addq	%rdx, %r8
145421547:     	xorl	%eax, %eax
145421549:     	cmpq	$0x9, %rcx
14542154d:     	jae	0x145421587 <.text+0x5420587>
14542154f:     	testq	%rcx, %rcx
145421552:     	je	0x14542140b <.text+0x542040b>
145421558:     	xorl	%edx, %edx
14542155a:     	nopw	(%rax,%rax)
145421560:     	movzbl	(%r8,%rdx), %r9d
145421565:     	addl	$-0x30, %r9d
145421569:     	cmpl	$0x9, %r9d
14542156d:     	ja	0x145421420 <.text+0x5420420>
145421573:     	leal	(%rax,%rax,4), %eax
145421576:     	leal	(%r9,%rax,2), %eax
14542157a:     	incq	%rdx
14542157d:     	cmpq	%rdx, %rcx
145421580:     	jne	0x145421560 <.text+0x5420560>
145421582:     	jmp	0x14542140b <.text+0x542040b>
145421587:     	xorl	%r9d, %r9d
14542158a:     	cmpq	%r9, %rcx
14542158d:     	je	0x14542140b <.text+0x542040b>
145421593:     	mull	%r12d
145421596:     	jo	0x1454215bd <.text+0x54205bd>
145421598:     	movzbl	(%r8,%r9), %r10d
14542159d:     	addl	$-0x30, %r10d
1454215a1:     	addl	%r10d, %eax
1454215a4:     	setb	%dl
1454215a7:     	cmpl	$0x9, %r10d
1454215ab:     	ja	0x145421420 <.text+0x5420420>
1454215b1:     	incq	%r9
1454215b4:     	testb	%dl, %dl
1454215b6:     	je	0x14542158a <.text+0x542058a>
1454215b8:     	jmp	0x145421420 <.text+0x5420420>
1454215bd:     	movzbl	(%r8,%r9), %ecx
1454215c2:     	addb	$-0x30, %cl
1454215c5:     	xorl	%eax, %eax
1454215c7:     	cmpb	$0xa, %cl
1454215ca:     	setb	%al
1454215cd:     	shll	$0x8, %eax
1454215d0:     	addq	$0x101, %rax            # imm = 0x101
1454215d6:     	testb	$0x1, %al
1454215d8:     	jne	0x145421420 <.text+0x5420420>
1454215de:     	shrq	$0x20, %rax
1454215e2:     	movl	%eax, %r13d
1454215e5:     	movq	$0x0, 0x2d0(%rbp)
1454215f0:     	movq	0x338(%rbp), %rax
1454215f7:     	movq	%rax, 0x2d8(%rbp)
1454215fe:     	leaq	0x2e0(%rbp), %rsi
145421605:     	movq	0x330(%rbp), %rcx
14542160c:     	movq	%rcx, 0x2e0(%rbp)
145421613:     	movq	%rax, 0x2e8(%rbp)
14542161a:     	movq	$0x0, 0x2f0(%rbp)
145421625:     	movq	%rax, 0x2f8(%rbp)
14542162c:     	movabsq	$0xa0000000a, %rax      # imm = 0xA0000000A
145421636:     	movq	%rax, 0x300(%rbp)
14542163d:     	movb	$0x1, 0x308(%rbp)
145421644:     	movw	$0x0, 0x310(%rbp)
14542164d:     	xorl	%eax, %eax
14542164f:     	leaq	0x1f0(%rbp), %r14
145421656:     	movl	$0x73746570, %edi       # imm = 0x73746570
14542165b:     	movq	%r13, 0x358(%rbp)
145421662:     	jmp	0x145421677 <.text+0x5420677>
145421664:     	nopw	%cs:(%rax,%rax)
145421670:     	movzbl	0x311(%rbp), %eax
145421677:     	testb	$0x1, %al
145421679:     	jne	0x1454217f1 <.text+0x54207f1>
14542167f:     	movq	0x2e0(%rbp), %r15
145421686:     	movq	%r14, %rcx
145421689:     	movq	%rsi, %rdx
14542168c:     	callq	0x145429e80 <.text+0x5428e80>
145421691:     	nop
145421692:     	cmpl	$0x1, 0x1f0(%rbp)
145421699:     	jne	0x1454216c0 <.text+0x54206c0>
14542169b:     	movq	0x200(%rbp), %rdx
1454216a2:     	movq	0x2d0(%rbp), %rax
1454216a9:     	movq	%rdx, 0x2d0(%rbp)
1454216b0:     	subq	%rax, %rdx
1454216b3:     	addq	%rax, %r15
1454216b6:     	testq	%rdx, %rdx
1454216b9:     	jne	0x145421702 <.text+0x5420702>
1454216bb:     	jmp	0x145421730 <.text+0x5420730>
1454216bd:     	nopl	(%rax)
1454216c0:     	cmpb	$0x0, 0x311(%rbp)
1454216c7:     	jne	0x1454217f1 <.text+0x54207f1>
1454216cd:     	movb	$0x1, 0x311(%rbp)
1454216d4:     	movq	0x2d0(%rbp), %r15
1454216db:     	movq	0x2d8(%rbp), %rdx
1454216e2:     	subq	%r15, %rdx
1454216e5:     	setne	%al
1454216e8:     	orb	0x310(%rbp), %al
1454216ee:     	cmpb	$0x1, %al
1454216f0:     	jne	0x1454217f1 <.text+0x54207f1>
1454216f6:     	addq	0x2e0(%rbp), %r15
1454216fd:     	testq	%rdx, %rdx
145421700:     	je	0x145421730 <.text+0x5420730>
145421702:     	cmpb	$0xa, -0x1(%r15,%rdx)
145421708:     	jne	0x145421730 <.text+0x5420730>
14542170a:     	movq	%rdx, %rax
14542170d:     	decq	%rax
145421710:     	je	0x145421720 <.text+0x5420720>
145421712:     	cmpb	$0xd, -0x2(%r15,%rdx)
145421718:     	jne	0x145421724 <.text+0x5420724>
14542171a:     	addq	$-0x2, %rdx
14542171e:     	jmp	0x145421730 <.text+0x5420730>
145421720:     	xorl	%edx, %edx
145421722:     	jmp	0x145421730 <.text+0x5420730>
145421724:     	movq	%rax, %rdx
145421727:     	nopw	(%rax,%rax)
145421730:     	movq	%r15, %rcx
145421733:     	callq	0x1400e9d30 <.text+0xe8d30>
145421738:     	nop
145421739:     	cmpq	$0x5, %rdx
14542173d:     	jb	0x145421670 <.text+0x5420670>
145421743:     	movl	(%rax), %ecx
145421745:     	xorl	%edi, %ecx
145421747:     	movzbl	0x4(%rax), %r8d
14542174c:     	xorl	$0x7c, %r8d
145421750:     	orl	%ecx, %r8d
145421753:     	jne	0x145421670 <.text+0x5420670>
145421759:     	addq	$0x5, %rax
14542175d:     	addq	$-0x5, %rdx
145421761:     	movq	$0x2, 0x1f0(%rbp)
14542176c:     	movq	$0x0, 0x1f8(%rbp)
145421777:     	movq	%rdx, 0x200(%rbp)
14542177e:     	movq	%rax, 0x208(%rbp)
145421785:     	movq	%rdx, 0x210(%rbp)
14542178c:     	movq	$0x0, 0x218(%rbp)
145421797:     	movq	%rdx, 0x220(%rbp)
14542179e:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
1454217a8:     	movq	%rax, 0x228(%rbp)
1454217af:     	movb	$0x1, 0x230(%rbp)
1454217b6:     	movw	$0x1, 0x238(%rbp)
1454217bf:     	leaq	0x160(%rbp), %rcx
1454217c6:     	leaq	0x1f0(%rbp), %rdx
1454217cd:     	callq	0x145526d50 <.text+0x5525d50>
1454217d2:     	nop
1454217d3:     	movups	0x160(%rbp), %xmm0
1454217da:     	movaps	%xmm0, 0x140(%rbp)
1454217e1:     	movq	0x170(%rbp), %rax
1454217e8:     	movq	%rax, 0x150(%rbp)
1454217ef:     	jmp	0x145421812 <.text+0x5420812>
1454217f1:     	movq	$0x0, 0x140(%rbp)
1454217fc:     	movq	$0x8, 0x148(%rbp)
145421807:     	movq	$0x0, 0x150(%rbp)
145421812:     	movq	$0x0, 0x1d8(%rbp)
14542181d:     	movq	$0x1, 0x1e0(%rbp)
145421828:     	movq	$0x0, 0x1e8(%rbp)
145421833:     	xorl	%ebx, %ebx
145421835:     	leaq	0x160(%rbp), %r14
14542183c:     	leaq	0x1f0(%rbp), %r15
145421843:     	xorl	%r13d, %r13d
145421846:     	xorl	%esi, %esi
145421848:     	testb	$0x1, %sil
14542184c:     	je	0x145421a2d <.text+0x5420a2d>
145421852:     	movq	0x20(%rbp), %rax
145421856:     	movq	0x28(%rbp), %rcx
14542185a:     	movq	%rax, 0x10(%rcx)
14542185e:     	movups	0x10(%rbp), %xmm0
145421862:     	movups	%xmm0, (%rcx)
145421865:     	movups	0x38(%rbp), %xmm0
145421869:     	movups	0x48(%rbp), %xmm1
14542186d:     	movups	0x58(%rbp), %xmm2
145421871:     	movups	0x68(%rbp), %xmm3
145421875:     	movups	%xmm3, 0x168(%rcx)
14542187c:     	movups	%xmm2, 0x158(%rcx)
145421883:     	movups	%xmm1, 0x148(%rcx)
14542188a:     	movups	%xmm0, 0x138(%rcx)
145421891:     	movq	0x120(%rbp), %rax
145421898:     	movq	%rax, 0x28(%rcx)
14542189c:     	movups	0x110(%rbp), %xmm0
1454218a3:     	movups	%xmm0, 0x18(%rcx)
1454218a7:     	movq	0xe8(%rbp), %rax
1454218ae:     	movq	%rax, 0x40(%rcx)
1454218b2:     	movups	0xd8(%rbp), %xmm0
1454218b9:     	movups	%xmm0, 0x30(%rcx)
1454218bd:     	movups	0x1b8(%rbp), %xmm0
1454218c4:     	movups	%xmm0, 0x48(%rcx)
1454218c8:     	movq	0x1c8(%rbp), %rax
1454218cf:     	movq	%rax, 0x58(%rcx)
1454218d3:     	movups	-0x8(%rbp), %xmm0
1454218d7:     	movups	%xmm0, 0x60(%rcx)
1454218db:     	movq	0x8(%rbp), %rax
1454218df:     	movq	%rax, 0x70(%rcx)
1454218e3:     	movups	0x1a0(%rbp), %xmm0
1454218ea:     	movups	%xmm0, 0x78(%rcx)
1454218ee:     	movq	0x1b0(%rbp), %rax
1454218f5:     	movq	%rax, 0x88(%rcx)
1454218fc:     	movups	0xa8(%rbp), %xmm0
145421903:     	movups	%xmm0, 0x90(%rcx)
14542190a:     	movq	0xb8(%rbp), %rax
145421911:     	movq	%rax, 0xa0(%rcx)
145421918:     	movups	0x90(%rbp), %xmm0
14542191f:     	movups	%xmm0, 0xa8(%rcx)
145421926:     	movq	0xa0(%rbp), %rax
14542192d:     	movq	%rax, 0xb8(%rcx)
145421934:     	movq	0x108(%rbp), %rax
14542193b:     	movq	%rax, 0xd0(%rcx)
145421942:     	movups	0xf8(%rbp), %xmm0
145421949:     	movups	%xmm0, 0xc0(%rcx)
145421950:     	movq	0x88(%rbp), %rax
145421957:     	movq	%rax, 0xe8(%rcx)
14542195e:     	movups	0x78(%rbp), %xmm0
145421962:     	movups	%xmm0, 0xd8(%rcx)
145421969:     	movups	0xc0(%rbp), %xmm0
145421970:     	movups	%xmm0, 0xf0(%rcx)
145421977:     	movq	0xd0(%rbp), %rax
14542197e:     	movq	%rax, 0x100(%rcx)
145421985:     	movaps	0x140(%rbp), %xmm0
14542198c:     	movups	%xmm0, 0x108(%rcx)
145421993:     	movq	0x150(%rbp), %rax
14542199a:     	movq	%rax, 0x118(%rcx)
1454219a1:     	movups	0x1d8(%rbp), %xmm0
1454219a8:     	movups	%xmm0, 0x120(%rcx)
1454219af:     	movq	0x1e8(%rbp), %rax
1454219b6:     	movq	%rax, 0x130(%rcx)
1454219bd:     	movq	-0x10(%rbp), %rax
1454219c1:     	movq	%rax, 0x1a8(%rcx)
1454219c8:     	movaps	-0x40(%rbp), %xmm0
1454219cc:     	movaps	-0x30(%rbp), %xmm1
1454219d0:     	movaps	-0x20(%rbp), %xmm2
1454219d4:     	movups	%xmm2, 0x198(%rcx)
1454219db:     	movups	%xmm1, 0x188(%rcx)
1454219e2:     	movups	%xmm0, 0x178(%rcx)
1454219e9:     	movq	0x358(%rbp), %rax
1454219f0:     	movl	%eax, 0x1b0(%rcx)
1454219f6:     	movq	%rcx, %rax
1454219f9:     	movaps	0x370(%rbp), %xmm6
145421a00:     	addq	$0x408, %rsp            # imm = 0x408
145421a07:     	popq	%rbx
145421a08:     	popq	%rdi
145421a09:     	popq	%rsi
145421a0a:     	popq	%r12
145421a0c:     	popq	%r13
145421a0e:     	popq	%r14
145421a10:     	popq	%r15
145421a12:     	popq	%rbp
145421a13:     	retq
145421a14:     	nopw	%cs:(%rax,%rax)
145421a20:     	movq	%rdi, %rbx
145421a23:     	testb	$0x1, %sil
145421a27:     	jne	0x145421852 <.text+0x5420852>
145421a2d:     	cmpq	%r13, 0x338(%rbp)
145421a34:     	jae	0x145421a50 <.text+0x5420a50>
145421a36:     	movq	%r13, %rdi
145421a39:     	movq	0x338(%rbp), %r8
145421a40:     	jmp	0x145421afa <.text+0x5420afa>
145421a45:     	nopw	%cs:(%rax,%rax)
145421a50:     	movq	0x338(%rbp), %r8
145421a57:     	jmp	0x145421a73 <.text+0x5420a73>
145421a59:     	nopl	(%rax)
145421a60:     	movq	%rdi, %r13
145421a63:     	movq	0x338(%rbp), %r8
145421a6a:     	cmpq	%r8, %rdi
145421a6d:     	ja	0x145421afa <.text+0x5420afa>
145421a73:     	subq	%r13, %r8
145421a76:     	movq	0x330(%rbp), %rax
145421a7d:     	leaq	(%rax,%r13), %rsi
145421a81:     	cmpq	$0x10, %r8
145421a85:     	jae	0x145421ab0 <.text+0x5420ab0>
145421a87:     	xorl	%edx, %edx
145421a89:     	testq	%r8, %r8
145421a8c:     	je	0x145421aa1 <.text+0x5420aa1>
145421a8e:     	nop
145421a90:     	cmpb	$0xa, (%rsi,%rdx)
145421a94:     	je	0x145421adc <.text+0x5420adc>
145421a96:     	incq	%rdx
145421a99:     	cmpq	%rdx, %r8
145421a9c:     	jne	0x145421a90 <.text+0x5420a90>
145421a9e:     	movq	%r8, %rdx
145421aa1:     	xorl	%eax, %eax
145421aa3:     	cmpq	$0x1, %rax
145421aa7:     	je	0x145421ac1 <.text+0x5420ac1>
145421aa9:     	jmp	0x145421af0 <.text+0x5420af0>
145421aab:     	nopl	(%rax,%rax)
145421ab0:     	movb	$0xa, %cl
145421ab2:     	movq	%rsi, %rdx
145421ab5:     	callq	0x145714db0 <.text+0x5713db0>
145421aba:     	nop
145421abb:     	cmpq	$0x1, %rax
145421abf:     	jne	0x145421af0 <.text+0x5420af0>
145421ac1:     	leaq	(%rdx,%r13), %rdi
145421ac5:     	incq	%rdi
145421ac8:     	addq	%rdx, %r13
145421acb:     	cmpq	0x338(%rbp), %r13
145421ad2:     	jae	0x145421a60 <.text+0x5420a60>
145421ad4:     	cmpb	$0xa, (%rsi,%rdx)
145421ad8:     	jne	0x145421a60 <.text+0x5420a60>
145421ada:     	jmp	0x145421b47 <.text+0x5420b47>
145421adc:     	movl	$0x1, %eax
145421ae1:     	cmpq	$0x1, %rax
145421ae5:     	je	0x145421ac1 <.text+0x5420ac1>
145421ae7:     	nopw	(%rax,%rax)
145421af0:     	movq	0x338(%rbp), %r8
145421af7:     	movq	%r8, %rdi
145421afa:     	movq	%rdi, %r13
145421afd:     	movb	$0x1, %sil
145421b00:     	movq	%rbx, %rdi
145421b03:     	movq	%r8, %rax
145421b06:     	cmpq	%rbx, %r8
145421b09:     	je	0x145421852 <.text+0x5420852>
145421b0f:     	movq	0x330(%rbp), %r8
145421b16:     	leaq	(%r8,%rbx), %rcx
145421b1a:     	movq	%rax, %rdx
145421b1d:     	subq	%rbx, %rdx
145421b20:     	je	0x145421b60 <.text+0x5420b60>
145421b22:     	cmpb	$0xa, -0x1(%r8,%rax)
145421b28:     	jne	0x145421b60 <.text+0x5420b60>
145421b2a:     	movq	%rdx, %r8
145421b2d:     	decq	%r8
145421b30:     	je	0x145421b51 <.text+0x5420b51>
145421b32:     	movq	0x330(%rbp), %r9
145421b39:     	cmpb	$0xd, -0x2(%r9,%rax)
145421b3f:     	jne	0x145421b55 <.text+0x5420b55>
145421b41:     	addq	$-0x2, %rdx
145421b45:     	jmp	0x145421b60 <.text+0x5420b60>
145421b47:     	xorl	%esi, %esi
145421b49:     	movq	%rdi, %r13
145421b4c:     	movq	%rdi, %rax
145421b4f:     	jmp	0x145421b0f <.text+0x5420b0f>
145421b51:     	xorl	%edx, %edx
145421b53:     	jmp	0x145421b60 <.text+0x5420b60>
145421b55:     	movq	%r8, %rdx
145421b58:     	nopl	(%rax,%rax)
145421b60:     	callq	0x1400e9d30 <.text+0xe8d30>
145421b65:     	nop
145421b66:     	movq	$0x0, 0x1f0(%rbp)
145421b71:     	movq	%rdx, 0x1f8(%rbp)
145421b78:     	movq	%rax, 0x200(%rbp)
145421b7f:     	movq	%rdx, 0x208(%rbp)
145421b86:     	movq	$0x0, 0x210(%rbp)
145421b91:     	movq	%rdx, 0x218(%rbp)
145421b98:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145421ba2:     	movq	%rax, 0x220(%rbp)
145421ba9:     	movb	$0x1, 0x228(%rbp)
145421bb0:     	movw	$0x1, 0x230(%rbp)
145421bb9:     	movq	%r14, %rcx
145421bbc:     	movq	%r15, %rdx
145421bbf:     	callq	0x14552a460 <.text+0x5529460>
145421bc4:     	nop
145421bc5:     	movq	0x168(%rbp), %rbx
145421bcc:     	cmpq	$0x5, 0x170(%rbp)
145421bd4:     	jne	0x145421bf0 <.text+0x5420bf0>
145421bd6:     	cmpq	$0x4, 0x8(%rbx)
145421bdb:     	jne	0x145421bf0 <.text+0x5420bf0>
145421bdd:     	movq	(%rbx), %rax
145421be0:     	cmpl	$0x6f726568, (%rax)     # imm = 0x6F726568
145421be6:     	je	0x145421c17 <.text+0x5420c17>
145421be8:     	nopl	(%rax,%rax)
145421bf0:     	movq	0x160(%rbp), %rdx
145421bf7:     	testq	%rdx, %rdx
145421bfa:     	je	0x145421a20 <.text+0x5420a20>
145421c00:     	shlq	$0x4, %rdx
145421c04:     	movl	$0x8, %r8d
145421c0a:     	movq	%rbx, %rcx
145421c0d:     	callq	0x1400021d0 <.text+0x11d0>
145421c12:     	jmp	0x145421a20 <.text+0x5420a20>
145421c17:     	movq	0x18(%rbx), %rdx
145421c1b:     	testq	%rdx, %rdx
145421c1e:     	je	0x145421bf0 <.text+0x5420bf0>
145421c20:     	movq	0x10(%rbx), %rcx
145421c24:     	cmpq	$0x1, %rdx
145421c28:     	jne	0x145421c39 <.text+0x5420c39>
145421c2a:     	movzbl	(%rcx), %eax
145421c2d:     	cmpl	$0x2b, %eax
145421c30:     	je	0x145421bf0 <.text+0x5420bf0>
145421c32:     	cmpl	$0x2d, %eax
145421c35:     	je	0x145421bf0 <.text+0x5420bf0>
145421c37:     	jmp	0x145421c3c <.text+0x5420c3c>
145421c39:     	movzbl	(%rcx), %eax
145421c3c:     	xorl	%r8d, %r8d
145421c3f:     	cmpb	$0x2b, %al
145421c41:     	sete	%r8b
145421c45:     	movq	%rdx, %rax
145421c48:     	subq	%r8, %rax
145421c4b:     	addq	%r8, %rcx
145421c4e:     	cmpq	$0x3, %rax
145421c52:     	jae	0x145421c91 <.text+0x5420c91>
145421c54:     	testq	%rax, %rax
145421c57:     	je	0x145421cdf <.text+0x5420cdf>
145421c5d:     	movzbl	(%rcx), %r12d
145421c61:     	addl	$-0x30, %r12d
145421c65:     	cmpl	$0x9, %r12d
145421c69:     	ja	0x145421bf0 <.text+0x5420bf0>
145421c6b:     	cmpq	$0x1, %rax
145421c6f:     	je	0x145421ce2 <.text+0x5420ce2>
145421c71:     	movzbl	0x1(%rcx), %eax
145421c75:     	addl	$-0x30, %eax
145421c78:     	cmpl	$0x9, %eax
145421c7b:     	ja	0x145421bf0 <.text+0x5420bf0>
145421c81:     	movzbl	%r12b, %ecx
145421c85:     	addl	%ecx, %ecx
145421c87:     	leal	(%rcx,%rcx,4), %ecx
145421c8a:     	addb	%cl, %al
145421c8c:     	movl	%eax, %r12d
145421c8f:     	jmp	0x145421ce2 <.text+0x5420ce2>
145421c91:     	negq	%r8
145421c94:     	addq	%r8, %rdx
145421c97:     	negq	%rdx
145421c9a:     	xorl	%r8d, %r8d
145421c9d:     	xorl	%r12d, %r12d
145421ca0:     	movq	%rdx, %rax
145421ca3:     	addq	%r8, %rax
145421ca6:     	je	0x145421ce2 <.text+0x5420ce2>
145421ca8:     	movl	%r12d, %eax
145421cab:     	movb	$0xa, %r9b
145421cae:     	mulb	%r9b
145421cb1:     	jo	0x145421bf0 <.text+0x5420bf0>
145421cb7:     	movl	%eax, %r12d
145421cba:     	movzbl	(%rcx,%r8), %r9d
145421cbf:     	addl	$-0x30, %r9d
145421cc3:     	addb	%r9b, %r12b
145421cc6:     	setb	%al
145421cc9:     	cmpl	$0x9, %r9d
145421ccd:     	ja	0x145421bf0 <.text+0x5420bf0>
145421cd3:     	incq	%r8
145421cd6:     	testb	%al, %al
145421cd8:     	je	0x145421ca0 <.text+0x5420ca0>
145421cda:     	jmp	0x145421bf0 <.text+0x5420bf0>
145421cdf:     	xorl	%r12d, %r12d
145421ce2:     	movq	0x28(%rbx), %rdx
145421ce6:     	testq	%rdx, %rdx
145421ce9:     	je	0x145421bf0 <.text+0x5420bf0>
145421cef:     	movq	0x20(%rbx), %rcx
145421cf3:     	cmpq	$0x1, %rdx
145421cf7:     	jne	0x145421d10 <.text+0x5420d10>
145421cf9:     	movzbl	(%rcx), %eax
145421cfc:     	cmpl	$0x2b, %eax
145421cff:     	je	0x145421bf0 <.text+0x5420bf0>
145421d05:     	cmpl	$0x2d, %eax
145421d08:     	je	0x145421bf0 <.text+0x5420bf0>
145421d0e:     	jmp	0x145421d13 <.text+0x5420d13>
145421d10:     	movzbl	(%rcx), %eax
145421d13:     	xorl	%r8d, %r8d
145421d16:     	cmpb	$0x2b, %al
145421d18:     	sete	%r8b
145421d1c:     	movq	%rdx, %rax
145421d1f:     	subq	%r8, %rax
145421d22:     	addq	%r8, %rcx
145421d25:     	cmpq	$0x3, %rax
145421d29:     	jae	0x145421d6c <.text+0x5420d6c>
145421d2b:     	testq	%rax, %rax
145421d2e:     	je	0x145421dba <.text+0x5420dba>
145421d34:     	movzbl	(%rcx), %r11d
145421d38:     	addl	$-0x30, %r11d
145421d3c:     	cmpl	$0x9, %r11d
145421d40:     	ja	0x145421bf0 <.text+0x5420bf0>
145421d46:     	cmpq	$0x1, %rax
145421d4a:     	je	0x145421dbd <.text+0x5420dbd>
145421d4c:     	movzbl	0x1(%rcx), %eax
145421d50:     	addl	$-0x30, %eax
145421d53:     	cmpl	$0x9, %eax
145421d56:     	ja	0x145421bf0 <.text+0x5420bf0>
145421d5c:     	movzbl	%r11b, %ecx
145421d60:     	addl	%ecx, %ecx
145421d62:     	leal	(%rcx,%rcx,4), %ecx
145421d65:     	addb	%cl, %al
145421d67:     	movl	%eax, %r11d
145421d6a:     	jmp	0x145421dbd <.text+0x5420dbd>
145421d6c:     	negq	%r8
145421d6f:     	addq	%r8, %rdx
145421d72:     	negq	%rdx
145421d75:     	xorl	%r8d, %r8d
145421d78:     	xorl	%r11d, %r11d
145421d7b:     	movq	%rdx, %rax
145421d7e:     	addq	%r8, %rax
145421d81:     	je	0x145421dbd <.text+0x5420dbd>
145421d83:     	movl	%r11d, %eax
145421d86:     	movb	$0xa, %r9b
145421d89:     	mulb	%r9b
145421d8c:     	jo	0x145421bf0 <.text+0x5420bf0>
145421d92:     	movl	%eax, %r11d
145421d95:     	movzbl	(%rcx,%r8), %r9d
145421d9a:     	addl	$-0x30, %r9d
145421d9e:     	addb	%r9b, %r11b
145421da1:     	setb	%al
145421da4:     	cmpl	$0x9, %r9d
145421da8:     	ja	0x145421bf0 <.text+0x5420bf0>
145421dae:     	incq	%r8
145421db1:     	testb	%al, %al
145421db3:     	je	0x145421d7b <.text+0x5420d7b>
145421db5:     	jmp	0x145421bf0 <.text+0x5420bf0>
145421dba:     	xorl	%r11d, %r11d
145421dbd:     	leal	-0x1(%r12), %eax
145421dc2:     	cmpb	$0xa, %al
145421dc4:     	ja	0x145421bf0 <.text+0x5420bf0>
145421dca:     	movzbl	%al, %ecx
145421dcd:     	movl	$0x5df, %eax            # imm = 0x5DF
145421dd2:     	btl	%ecx, %eax
145421dd5:     	jae	0x145421bf0 <.text+0x5420bf0>
145421ddb:     	shll	$0x3, %ecx
145421dde:     	leaq	0x12fef93(%rip), %rax   # 0x146720d78
145421de5:     	movq	(%rcx,%rax), %rax
145421de9:     	leaq	0x12fefe0(%rip), %rdx   # 0x146720dd0
145421df0:     	movq	(%rcx,%rdx), %rcx
145421df4:     	xorl	%edx, %edx
145421df6:     	cmpb	%r11b, (%rax,%rdx)
145421dfa:     	je	0x145421e09 <.text+0x5420e09>
145421dfc:     	incq	%rdx
145421dff:     	cmpq	%rdx, %rcx
145421e02:     	jne	0x145421df6 <.text+0x5420df6>
145421e04:     	jmp	0x145421bf0 <.text+0x5420bf0>
145421e09:     	movq	0x38(%rbx), %rdx
145421e0d:     	testq	%rdx, %rdx
145421e10:     	je	0x145421bf0 <.text+0x5420bf0>
145421e16:     	movq	0x30(%rbx), %rcx
145421e1a:     	cmpq	$0x1, %rdx
145421e1e:     	jne	0x145421e3a <.text+0x5420e3a>
145421e20:     	movzbl	(%rcx), %r8d
145421e24:     	cmpl	$0x2b, %r8d
145421e28:     	je	0x145421bf0 <.text+0x5420bf0>
145421e2e:     	cmpl	$0x2d, %r8d
145421e32:     	je	0x145421bf0 <.text+0x5420bf0>
145421e38:     	jmp	0x145421e3e <.text+0x5420e3e>
145421e3a:     	movzbl	(%rcx), %r8d
145421e3e:     	xorl	%eax, %eax
145421e40:     	cmpb	$0x2b, %r8b
145421e44:     	sete	%al
145421e47:     	movq	%rdx, %r8
145421e4a:     	subq	%rax, %r8
145421e4d:     	addq	%rax, %rcx
145421e50:     	cmpq	$0x3, %r8
145421e54:     	jae	0x145421e7d <.text+0x5420e7d>
145421e56:     	testq	%r8, %r8
145421e59:     	je	0x145421ec6 <.text+0x5420ec6>
145421e5b:     	movzbl	(%rcx), %eax
145421e5e:     	addl	$-0x30, %eax
145421e61:     	cmpl	$0x9, %eax
145421e64:     	ja	0x145421bf0 <.text+0x5420bf0>
145421e6a:     	cmpq	$0x1, %r8
145421e6e:     	jne	0x1454220d4 <.text+0x54210d4>
145421e74:     	movl	%r11d, 0x350(%rbp)
145421e7b:     	jmp	0x145421ecf <.text+0x5420ecf>
145421e7d:     	negq	%rax
145421e80:     	addq	%rax, %rdx
145421e83:     	negq	%rdx
145421e86:     	xorl	%r8d, %r8d
145421e89:     	xorl	%eax, %eax
145421e8b:     	movq	%rdx, %r9
145421e8e:     	addq	%r8, %r9
145421e91:     	je	0x145421e74 <.text+0x5420e74>
145421e93:     	movb	$0xa, %r9b
145421e96:     	mulb	%r9b
145421e99:     	jo	0x145421bf0 <.text+0x5420bf0>
145421e9f:     	movzbl	(%rcx,%r8), %r10d
145421ea4:     	addl	$-0x30, %r10d
145421ea8:     	addb	%r10b, %al
145421eab:     	setb	%r9b
145421eaf:     	cmpl	$0x9, %r10d
145421eb3:     	ja	0x145421bf0 <.text+0x5420bf0>
145421eb9:     	incq	%r8
145421ebc:     	testb	%r9b, %r9b
145421ebf:     	je	0x145421e8b <.text+0x5420e8b>
145421ec1:     	jmp	0x145421bf0 <.text+0x5420bf0>
145421ec6:     	movl	%r11d, 0x350(%rbp)
145421ecd:     	xorl	%eax, %eax
145421ecf:     	movl	%eax, 0x318(%rbp)
145421ed5:     	testb	%al, %al
145421ed7:     	setne	0x328(%rbp)
145421ede:     	movq	0x40(%rbx), %rax
145421ee2:     	movq	%rbx, 0x340(%rbp)
145421ee9:     	movq	0x48(%rbx), %rcx
145421eed:     	movq	$0x0, 0x1f0(%rbp)
145421ef8:     	movq	%rcx, 0x1f8(%rbp)
145421eff:     	movq	%rax, 0x200(%rbp)
145421f06:     	movq	%rcx, 0x208(%rbp)
145421f0d:     	movq	$0x0, 0x210(%rbp)
145421f18:     	movq	%rcx, 0x218(%rbp)
145421f1f:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
145421f29:     	movq	%rax, 0x220(%rbp)
145421f30:     	movb	$0x1, 0x228(%rbp)
145421f37:     	movw	$0x1, 0x230(%rbp)
145421f40:     	leaq	0x2d0(%rbp), %rcx
145421f47:     	movq	%r15, %rdx
145421f4a:     	callq	0x14552e9a0 <.text+0x552d9a0>
145421f4f:     	nop
145421f50:     	cmpq	$0x5, 0x2e0(%rbp)
145421f58:     	jne	0x145421fa8 <.text+0x5420fa8>
145421f5a:     	movq	0x2d0(%rbp), %rdx
145421f61:     	movq	0x2d8(%rbp), %rcx
145421f68:     	movl	(%rcx), %eax
145421f6a:     	movzbl	0x4(%rcx), %r8d
145421f6f:     	shlq	$0x20, %r8
145421f73:     	orq	%rax, %r8
145421f76:     	movabsq	$-0x10000000000, %rax   # imm = 0xFFFFFF0000000000
145421f80:     	movq	0x2c8(%rbp), %r9
145421f87:     	andq	%rax, %r9
145421f8a:     	movq	%r9, %rax
145421f8d:     	orq	%r8, %rax
145421f90:     	testq	%rdx, %rdx
145421f93:     	je	0x145421fea <.text+0x5420fea>
145421f95:     	movl	$0x1, %r8d
145421f9b:     	movq	%rax, %rbx
145421f9e:     	callq	0x1400021d0 <.text+0x11d0>
145421fa3:     	movq	%rbx, %rax
145421fa6:     	jmp	0x145421fea <.text+0x5420fea>
145421fa8:     	movq	0x2d0(%rbp), %rdx
145421faf:     	movq	0x2d8(%rbp), %rax
145421fb6:     	cmpq	$-0x1, %rdx
145421fba:     	je	0x145421fea <.text+0x5420fea>
145421fbc:     	movq	%rax, 0x2c8(%rbp)
145421fc3:     	testq	%rdx, %rdx
145421fc6:     	movq	0x340(%rbp), %rbx
145421fcd:     	je	0x145421bf0 <.text+0x5420bf0>
145421fd3:     	movl	$0x1, %r8d
145421fd9:     	movq	0x2c8(%rbp), %rcx
145421fe0:     	callq	0x1400021d0 <.text+0x11d0>
145421fe5:     	jmp	0x145421bf0 <.text+0x5420bf0>
145421fea:     	movl	0x350(%rbp), %edx
145421ff0:     	movzbl	0x328(%rbp), %r8d
145421ff8:     	movq	%rax, 0x2c8(%rbp)
145421fff:     	movq	%rax, %rcx
145422002:     	movl	%edx, 0x350(%rbp)
145422008:     	callq	0x145500d30 <.text+0x54ffd30>
14542200d:     	movq	%rax, 0x328(%rbp)
145422014:     	xorl	%ebx, %ebx
145422016:     	cmpb	$0x0, 0x318(%rbp)
14542201d:     	setne	%r8b
145422021:     	movq	0x160(%rbp), %rdx
145422028:     	testq	%rdx, %rdx
14542202b:     	je	0x145422052 <.text+0x5421052>
14542202d:     	shlq	$0x4, %rdx
145422031:     	movb	%r8b, 0x318(%rbp)
145422038:     	movl	$0x8, %r8d
14542203e:     	movq	0x340(%rbp), %rcx
145422045:     	callq	0x1400021d0 <.text+0x11d0>
14542204a:     	movzbl	0x318(%rbp), %r8d
145422052:     	movzbl	%r12b, %eax
145422056:     	movzbl	0x350(%rbp), %ecx
14542205d:     	shll	$0x8, %ecx
145422060:     	orq	%rax, %rcx
145422063:     	movb	%r8b, %bl
145422066:     	shll	$0x10, %ebx
145422069:     	orq	%rcx, %rbx
14542206c:     	movq	0x328(%rbp), %r12
145422073:     	shlq	$0x18, %r12
145422077:     	orq	%rbx, %r12
14542207a:     	movq	%r12, 0x1f0(%rbp)
145422081:     	leaq	0x1d8(%rbp), %rcx
145422088:     	movq	%r15, %rdx
14542208b:     	callq	0x145523270 <.text+0x5522270>
145422090:     	movq	0x1e8(%rbp), %rbx
145422097:     	cmpq	0x1d8(%rbp), %rbx
14542209e:     	jne	0x1454220ad <.text+0x54210ad>
1454220a0:     	leaq	0x1d8(%rbp), %rcx
1454220a7:     	callq	0x1458cbe80 <.text+0x58cae80>
1454220ac:     	nop
1454220ad:     	movq	0x1e0(%rbp), %rax
1454220b4:     	movq	%r12, (%rax,%rbx,8)
1454220b8:     	incq	%rbx
1454220bb:     	movq	%rbx, 0x1e8(%rbp)
1454220c2:     	movq	%rdi, %rbx
1454220c5:     	testb	$0x1, %sil
1454220c9:     	je	0x145421a2d <.text+0x5420a2d>
1454220cf:     	jmp	0x145421852 <.text+0x5420852>
1454220d4:     	movzbl	0x1(%rcx), %ecx
1454220d8:     	addl	$-0x30, %ecx
1454220db:     	cmpl	$0x9, %ecx
1454220de:     	ja	0x145421bf0 <.text+0x5420bf0>
1454220e4:     	movl	%r11d, 0x350(%rbp)
1454220eb:     	movzbl	%al, %eax
1454220ee:     	addl	%eax, %eax
1454220f0:     	leal	(%rax,%rax,4), %eax
1454220f3:     	addb	%al, %cl
1454220f5:     	movl	%ecx, %eax
1454220f7:     	jmp	0x145421ecf <.text+0x5420ecf>
1454220fc:     	cmpq	$-0x1, %rdi
145422100:     	jne	0x145422c2d <.text+0x5421c2d>
145422106:     	nopw	%cs:(%rax,%rax)
145422110:     	movzbl	0x311(%rbp), %eax
145422117:     	movq	$-0x1, %rdi
14542211e:     	testb	$0x1, %al
145422120:     	jne	0x14541f2d3 <.text+0x541e2d3>
145422126:     	movq	0x2e0(%rbp), %rsi
14542212d:     	movq	%r15, %rcx
145422130:     	movq	%r12, %rdx
145422133:     	callq	0x145429e80 <.text+0x5428e80>
145422138:     	nop
145422139:     	cmpl	$0x1, 0x1f0(%rbp)
145422140:     	jne	0x145422170 <.text+0x5421170>
145422142:     	movq	0x200(%rbp), %rdx
145422149:     	movq	0x2d0(%rbp), %rax
145422150:     	movq	%rdx, 0x2d0(%rbp)
145422157:     	subq	%rax, %rdx
14542215a:     	addq	%rax, %rsi
14542215d:     	testq	%rdx, %rdx
145422160:     	jne	0x1454221b2 <.text+0x54211b2>
145422162:     	jmp	0x1454221e0 <.text+0x54211e0>
145422164:     	nopw	%cs:(%rax,%rax)
145422170:     	cmpb	$0x0, 0x311(%rbp)
145422177:     	jne	0x14541f2d3 <.text+0x541e2d3>
14542217d:     	movb	$0x1, 0x311(%rbp)
145422184:     	movq	0x2d0(%rbp), %rsi
14542218b:     	movq	0x2d8(%rbp), %rdx
145422192:     	subq	%rsi, %rdx
145422195:     	setne	%al
145422198:     	orb	0x310(%rbp), %al
14542219e:     	cmpb	$0x1, %al
1454221a0:     	jne	0x14541f2d3 <.text+0x541e2d3>
1454221a6:     	addq	0x2e0(%rbp), %rsi
1454221ad:     	testq	%rdx, %rdx
1454221b0:     	je	0x1454221e0 <.text+0x54211e0>
1454221b2:     	cmpb	$0xa, -0x1(%rsi,%rdx)
1454221b7:     	jne	0x1454221e0 <.text+0x54211e0>
1454221b9:     	movq	%rdx, %rax
1454221bc:     	decq	%rax
1454221bf:     	je	0x1454221ce <.text+0x54211ce>
1454221c1:     	cmpb	$0xd, -0x2(%rsi,%rdx)
1454221c6:     	jne	0x1454221d2 <.text+0x54211d2>
1454221c8:     	addq	$-0x2, %rdx
1454221cc:     	jmp	0x1454221e0 <.text+0x54211e0>
1454221ce:     	xorl	%edx, %edx
1454221d0:     	jmp	0x1454221e0 <.text+0x54211e0>
1454221d2:     	movq	%rax, %rdx
1454221d5:     	nopw	%cs:(%rax,%rax)
1454221e0:     	movq	%rsi, %rcx
1454221e3:     	callq	0x1400e9d30 <.text+0xe8d30>
1454221e8:     	nop
1454221e9:     	movq	$0x0, 0x1f0(%rbp)
1454221f4:     	movq	%rdx, 0x1f8(%rbp)
1454221fb:     	movq	%rax, 0x200(%rbp)
145422202:     	movq	%rdx, 0x208(%rbp)
145422209:     	movq	$0x0, 0x210(%rbp)
145422214:     	movq	%rdx, 0x218(%rbp)
14542221b:     	movabsq	$0x7c0000007c, %rax     # imm = 0x7C0000007C
145422225:     	movq	%rax, 0x220(%rbp)
14542222c:     	movb	$0x1, 0x228(%rbp)
145422233:     	movw	$0x1, 0x230(%rbp)
14542223c:     	movq	%r14, %rcx
14542223f:     	movq	%r15, %rdx
145422242:     	callq	0x14552a460 <.text+0x5529460>
145422247:     	nop
145422248:     	movq	0x150(%rbp), %rdi
14542224f:     	leaq	-0x6(%rdi), %rax
145422253:     	cmpq	$0x3, %rax
145422257:     	jae	0x145422610 <.text+0x5421610>
14542225d:     	movq	0x148(%rbp), %r10
145422264:     	cmpq	$0x4, 0x8(%r10)
145422269:     	jne	0x145422610 <.text+0x5421610>
14542226f:     	movq	(%r10), %rax
145422272:     	cmpl	$0x6b636970, (%rax)     # imm = 0x6B636970
145422278:     	jne	0x145422610 <.text+0x5421610>
14542227e:     	cmpq	$0x6, %rdi
145422282:     	jbe	0x14542231f <.text+0x542131f>
145422288:     	movq	0x60(%r10), %rax
14542228c:     	movq	%r10, 0x350(%rbp)
145422293:     	movq	0x68(%r10), %rcx
145422297:     	movq	$0x0, 0x1f0(%rbp)
1454222a2:     	movq	%rcx, 0x1f8(%rbp)
1454222a9:     	movq	%rax, 0x200(%rbp)
1454222b0:     	movq	%rcx, 0x208(%rbp)
1454222b7:     	movq	$0x0, 0x210(%rbp)
1454222c2:     	movq	%rcx, 0x218(%rbp)
1454222c9:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
1454222d3:     	movq	%rax, 0x220(%rbp)
1454222da:     	movb	$0x1, 0x228(%rbp)
1454222e1:     	movw	$0x1, 0x230(%rbp)
1454222ea:     	leaq	0x38(%rbp), %rcx
1454222ee:     	movq	%r15, %rdx
1454222f1:     	callq	0x14552e9a0 <.text+0x552d9a0>
1454222f6:     	nop
1454222f7:     	movq	0x38(%rbp), %rdx
1454222fb:     	movq	0x40(%rbp), %rax
1454222ff:     	movq	%rax, 0x358(%rbp)
145422306:     	movq	0x48(%rbp), %rsi
14542230a:     	movq	0x350(%rbp), %r10
145422311:     	movq	0x18(%r10), %r11
145422315:     	testq	%r11, %r11
145422318:     	jne	0x14542233c <.text+0x542133c>
14542231a:     	jmp	0x1454225ed <.text+0x54215ed>
14542231f:     	movl	$0x1, %eax
145422324:     	movq	%rax, 0x358(%rbp)
14542232b:     	xorl	%edx, %edx
14542232d:     	xorl	%esi, %esi
14542232f:     	movq	0x18(%r10), %r11
145422333:     	testq	%r11, %r11
145422336:     	je	0x1454225ed <.text+0x54215ed>
14542233c:     	movq	0x10(%r10), %rcx
145422340:     	cmpq	$0x1, %r11
145422344:     	jne	0x14542235d <.text+0x542135d>
145422346:     	movzbl	(%rcx), %eax
145422349:     	cmpl	$0x2b, %eax
14542234c:     	je	0x1454225ed <.text+0x54215ed>
145422352:     	cmpl	$0x2d, %eax
145422355:     	je	0x1454225ed <.text+0x54215ed>
14542235b:     	jmp	0x145422360 <.text+0x5421360>
14542235d:     	movzbl	(%rcx), %eax
145422360:     	xorl	%r8d, %r8d
145422363:     	cmpb	$0x2b, %al
145422365:     	sete	%r8b
145422369:     	movq	%r11, %rax
14542236c:     	subq	%r8, %rax
14542236f:     	addq	%r8, %rcx
145422372:     	cmpq	$0x3, %rax
145422376:     	jae	0x1454223b9 <.text+0x54213b9>
145422378:     	testq	%rax, %rax
14542237b:     	je	0x14542240b <.text+0x542140b>
145422381:     	movzbl	(%rcx), %r13d
145422385:     	addl	$-0x30, %r13d
145422389:     	cmpl	$0x9, %r13d
14542238d:     	ja	0x1454225ed <.text+0x54215ed>
145422393:     	cmpq	$0x1, %rax
145422397:     	je	0x14542240e <.text+0x542140e>
145422399:     	movzbl	0x1(%rcx), %eax
14542239d:     	addl	$-0x30, %eax
1454223a0:     	cmpl	$0x9, %eax
1454223a3:     	ja	0x1454225ed <.text+0x54215ed>
1454223a9:     	movzbl	%r13b, %ecx
1454223ad:     	addl	%ecx, %ecx
1454223af:     	leal	(%rcx,%rcx,4), %ecx
1454223b2:     	addb	%cl, %al
1454223b4:     	movl	%eax, %r13d
1454223b7:     	jmp	0x14542240e <.text+0x542140e>
1454223b9:     	negq	%r8
1454223bc:     	addq	%r8, %r11
1454223bf:     	negq	%r11
1454223c2:     	xorl	%r8d, %r8d
1454223c5:     	xorl	%r13d, %r13d
1454223c8:     	movq	%r11, %rax
1454223cb:     	addq	%r8, %rax
1454223ce:     	je	0x1454224e4 <.text+0x54214e4>
1454223d4:     	movl	%r13d, %eax
1454223d7:     	movb	$0xa, %r9b
1454223da:     	mulb	%r9b
1454223dd:     	jo	0x1454225ed <.text+0x54215ed>
1454223e3:     	movl	%eax, %r13d
1454223e6:     	movzbl	(%rcx,%r8), %r9d
1454223eb:     	addl	$-0x30, %r9d
1454223ef:     	addb	%r9b, %r13b
1454223f2:     	setb	%al
1454223f5:     	cmpl	$0x9, %r9d
1454223f9:     	ja	0x1454225ed <.text+0x54215ed>
1454223ff:     	incq	%r8
145422402:     	testb	%al, %al
145422404:     	je	0x1454223c8 <.text+0x54213c8>
145422406:     	jmp	0x1454225ed <.text+0x54215ed>
14542240b:     	xorl	%r13d, %r13d
14542240e:     	movq	0x28(%r10), %r11
145422412:     	testq	%r11, %r11
145422415:     	je	0x1454225ed <.text+0x54215ed>
14542241b:     	movq	0x20(%r10), %rcx
14542241f:     	cmpq	$0x1, %r11
145422423:     	jne	0x14542243c <.text+0x542143c>
145422425:     	movzbl	(%rcx), %eax
145422428:     	cmpl	$0x2b, %eax
14542242b:     	je	0x1454225ed <.text+0x54215ed>
145422431:     	cmpl	$0x2d, %eax
145422434:     	je	0x1454225ed <.text+0x54215ed>
14542243a:     	jmp	0x14542243f <.text+0x542143f>
14542243c:     	movzbl	(%rcx), %eax
14542243f:     	xorl	%r8d, %r8d
145422442:     	cmpb	$0x2b, %al
145422444:     	sete	%r8b
145422448:     	movq	%r11, %rax
14542244b:     	subq	%r8, %rax
14542244e:     	addq	%r8, %rcx
145422451:     	cmpq	$0x3, %rax
145422455:     	jae	0x145422499 <.text+0x5421499>
145422457:     	testq	%rax, %rax
14542245a:     	je	0x1454224f3 <.text+0x54214f3>
145422460:     	movzbl	(%rcx), %r8d
145422464:     	addl	$-0x30, %r8d
145422468:     	cmpl	$0x9, %r8d
14542246c:     	ja	0x1454225ed <.text+0x54215ed>
145422472:     	movl	%r8d, %ebx
145422475:     	cmpq	$0x1, %rax
145422479:     	je	0x1454224f5 <.text+0x54214f5>
14542247b:     	movzbl	0x1(%rcx), %eax
14542247f:     	addl	$-0x30, %eax
145422482:     	cmpl	$0x9, %eax
145422485:     	ja	0x1454225ed <.text+0x54215ed>
14542248b:     	movzbl	%bl, %ecx
14542248e:     	addl	%ecx, %ecx
145422490:     	leal	(%rcx,%rcx,4), %ecx
145422493:     	addb	%cl, %al
145422495:     	movl	%eax, %ebx
145422497:     	jmp	0x1454224f5 <.text+0x54214f5>
145422499:     	negq	%r8
14542249c:     	addq	%r8, %r11
14542249f:     	negq	%r11
1454224a2:     	xorl	%r8d, %r8d
1454224a5:     	xorl	%ebx, %ebx
1454224a7:     	movq	%r11, %rax
1454224aa:     	addq	%r8, %rax
1454224ad:     	je	0x1454224f5 <.text+0x54214f5>
1454224af:     	movl	%ebx, %eax
1454224b1:     	movb	$0xa, %r9b
1454224b4:     	mulb	%r9b
1454224b7:     	jo	0x1454225ed <.text+0x54215ed>
1454224bd:     	movl	%eax, %ebx
1454224bf:     	movzbl	(%rcx,%r8), %r9d
1454224c4:     	addl	$-0x30, %r9d
1454224c8:     	addb	%r9b, %bl
1454224cb:     	setb	%al
1454224ce:     	cmpl	$0x9, %r9d
1454224d2:     	ja	0x1454225ed <.text+0x54215ed>
1454224d8:     	incq	%r8
1454224db:     	testb	%al, %al
1454224dd:     	je	0x1454224a7 <.text+0x54214a7>
1454224df:     	jmp	0x1454225ed <.text+0x54215ed>
1454224e4:     	cmpq	$0x2, %rdi
1454224e8:     	jne	0x14542240e <.text+0x542140e>
1454224ee:     	jmp	0x145422e95 <.text+0x5421e95>
1454224f3:     	xorl	%ebx, %ebx
1454224f5:     	movq	0x38(%r10), %r11
1454224f9:     	testq	%r11, %r11
1454224fc:     	je	0x1454225ed <.text+0x54215ed>
145422502:     	movq	0x30(%r10), %rcx
145422506:     	cmpq	$0x1, %r11
14542250a:     	jne	0x145422523 <.text+0x5421523>
14542250c:     	movzbl	(%rcx), %eax
14542250f:     	cmpl	$0x2b, %eax
145422512:     	je	0x1454225ed <.text+0x54215ed>
145422518:     	cmpl	$0x2d, %eax
14542251b:     	je	0x1454225ed <.text+0x54215ed>
145422521:     	jmp	0x145422526 <.text+0x5421526>
145422523:     	movzbl	(%rcx), %eax
145422526:     	xorl	%r8d, %r8d
145422529:     	cmpb	$0x2b, %al
14542252b:     	sete	%r8b
14542252f:     	movq	%r11, %rax
145422532:     	subq	%r8, %rax
145422535:     	addq	%r8, %rcx
145422538:     	cmpq	$0x3, %rax
14542253c:     	jae	0x14542258f <.text+0x542158f>
14542253e:     	testq	%rax, %rax
145422541:     	je	0x145422651 <.text+0x5421651>
145422547:     	movzbl	(%rcx), %r8d
14542254b:     	addl	$-0x30, %r8d
14542254f:     	movl	%r8d, 0x340(%rbp)
145422556:     	cmpl	$0x9, %r8d
14542255a:     	ja	0x1454225ed <.text+0x54215ed>
145422560:     	cmpq	$0x1, %rax
145422564:     	je	0x14542265b <.text+0x542165b>
14542256a:     	movzbl	0x1(%rcx), %eax
14542256e:     	addl	$-0x30, %eax
145422571:     	cmpl	$0xa, %eax
145422574:     	jae	0x1454225ed <.text+0x54215ed>
145422576:     	movzbl	0x340(%rbp), %ecx
14542257d:     	addl	%ecx, %ecx
14542257f:     	leal	(%rcx,%rcx,4), %ecx
145422582:     	addb	%cl, %al
145422584:     	movl	%eax, 0x340(%rbp)
14542258a:     	jmp	0x14542265b <.text+0x542165b>
14542258f:     	negq	%r8
145422592:     	addq	%r8, %r11
145422595:     	negq	%r11
145422598:     	xorl	%r8d, %r8d
14542259b:     	movl	$0x0, 0x340(%rbp)
1454225a5:     	movq	%r11, %rax
1454225a8:     	addq	%r8, %rax
1454225ab:     	je	0x14542265b <.text+0x542165b>
1454225b1:     	movl	0x340(%rbp), %eax
1454225b7:     	movb	$0xa, %r9b
1454225ba:     	mulb	%r9b
1454225bd:     	movl	%eax, 0x340(%rbp)
1454225c3:     	jo	0x1454225ed <.text+0x54215ed>
1454225c5:     	movzbl	(%rcx,%r8), %r9d
1454225ca:     	addl	$-0x30, %r9d
1454225ce:     	movl	0x340(%rbp), %eax
1454225d4:     	addb	%r9b, %al
1454225d7:     	movl	%eax, 0x340(%rbp)
1454225dd:     	setb	%al
1454225e0:     	cmpl	$0x9, %r9d
1454225e4:     	ja	0x1454225ed <.text+0x54215ed>
1454225e6:     	incq	%r8
1454225e9:     	testb	%al, %al
1454225eb:     	je	0x1454225a5 <.text+0x54215a5>
1454225ed:     	testq	%rdx, %rdx
1454225f0:     	je	0x145422610 <.text+0x5421610>
1454225f2:     	movl	$0x1, %r8d
1454225f8:     	movq	0x358(%rbp), %rcx
1454225ff:     	callq	0x1400021d0 <.text+0x11d0>
145422604:     	nopw	%cs:(%rax,%rax)
145422610:     	movq	0x140(%rbp), %rdx
145422617:     	testq	%rdx, %rdx
14542261a:     	je	0x145422110 <.text+0x5421110>
145422620:     	movq	0x148(%rbp), %rcx
145422627:     	shlq	$0x4, %rdx
14542262b:     	movl	$0x8, %r8d
145422631:     	callq	0x1400021d0 <.text+0x11d0>
145422636:     	movzbl	0x311(%rbp), %eax
14542263d:     	movq	$-0x1, %rdi
145422644:     	testb	$0x1, %al
145422646:     	je	0x145422126 <.text+0x5421126>
14542264c:     	jmp	0x14541f2d3 <.text+0x541e2d3>
145422651:     	movl	$0x0, 0x340(%rbp)
14542265b:     	movq	%rdx, 0x1d0(%rbp)
145422662:     	cmpq	$0x4, %rdi
145422666:     	movq	%r10, 0x350(%rbp)
14542266d:     	je	0x145422ec3 <.text+0x5421ec3>
145422673:     	movq	0x40(%r10), %rax
145422677:     	movq	%rax, 0x318(%rbp)
14542267e:     	movq	0x48(%r10), %rdx
145422682:     	movq	$0x1, 0x20(%rsp)
14542268b:     	movl	$0x1, %r9d
145422691:     	leaq	0x1d8(%rbp), %rcx
145422698:     	movq	%rdx, 0x328(%rbp)
14542269f:     	xorl	%r8d, %r8d
1454226a2:     	callq	0x14003bf90 <.text+0x3af90>
1454226a7:     	movq	0x1e0(%rbp), %rax
1454226ae:     	movq	%rax, 0x130(%rbp)
1454226b5:     	cmpb	$0x0, 0x1d8(%rbp)
1454226bc:     	jne	0x145422d88 <.text+0x5421d88>
1454226c2:     	movq	0x1e8(%rbp), %rcx
1454226c9:     	movq	0x328(%rbp), %rax
1454226d0:     	testq	%rax, %rax
1454226d3:     	movq	%rcx, 0x2c8(%rbp)
1454226da:     	je	0x1454226f6 <.text+0x54216f6>
1454226dc:     	movq	0x2c8(%rbp), %rcx
1454226e3:     	movq	0x318(%rbp), %rdx
1454226ea:     	movq	0x328(%rbp), %r8
1454226f1:     	callq	0x145756ddd <.text+0x5755ddd>
1454226f6:     	movq	0x350(%rbp), %rax
1454226fd:     	movq	0x50(%rax), %rcx
145422701:     	movq	%rcx, 0x30(%rbp)
145422705:     	movq	0x58(%rax), %rdx
145422709:     	movq	$0x1, 0x20(%rsp)
145422712:     	movl	$0x1, %r9d
145422718:     	leaq	0x1d8(%rbp), %rcx
14542271f:     	movq	%rdx, 0x318(%rbp)
145422726:     	xorl	%r8d, %r8d
145422729:     	callq	0x14003bf90 <.text+0x3af90>
14542272e:     	movzbl	0x1d8(%rbp), %eax
145422735:     	movq	0x1e0(%rbp), %rcx
14542273c:     	movq	%rcx, 0x138(%rbp)
145422743:     	movb	%al, 0x327(%rbp)
145422749:     	testb	%al, %al
14542274b:     	jne	0x145422da8 <.text+0x5421da8>
145422751:     	movq	0x1e8(%rbp), %r9
145422758:     	movq	0x318(%rbp), %r8
14542275f:     	testq	%r8, %r8
145422762:     	movq	%r9, 0x128(%rbp)
145422769:     	je	0x14542278c <.text+0x542178c>
14542276b:     	movq	%r9, %rcx
14542276e:     	movq	0x30(%rbp), %rdx
145422772:     	movq	0x318(%rbp), %r8
145422779:     	callq	0x145756ddd <.text+0x5755ddd>
14542277e:     	movq	0x128(%rbp), %r9
145422785:     	movq	0x318(%rbp), %r8
14542278c:     	cmpq	$0x5, %rsi
145422790:     	jne	0x1454227eb <.text+0x54217eb>
145422792:     	movq	0x358(%rbp), %rcx
145422799:     	movl	(%rcx), %eax
14542279b:     	movzbl	0x4(%rcx), %edx
14542279f:     	shlq	$0x20, %rdx
1454227a3:     	orq	%rax, %rdx
1454227a6:     	movabsq	$-0x10000000000, %rax   # imm = 0xFFFFFF0000000000
1454227b0:     	movq	0xf0(%rbp), %rsi
1454227b7:     	andq	%rax, %rsi
1454227ba:     	orq	%rdx, %rsi
1454227bd:     	movq	0x1d0(%rbp), %rdx
1454227c4:     	testq	%rdx, %rdx
1454227c7:     	je	0x145422807 <.text+0x5421807>
1454227c9:     	movl	$0x1, %r8d
1454227cf:     	callq	0x1400021d0 <.text+0x11d0>
1454227d4:     	movq	0x128(%rbp), %r9
1454227db:     	movq	0x318(%rbp), %r8
1454227e2:     	movq	%rsi, 0xf0(%rbp)
1454227e9:     	jmp	0x14542284f <.text+0x542184f>
1454227eb:     	movq	0x1d0(%rbp), %rax
1454227f2:     	testq	%rax, %rax
1454227f5:     	movq	0x358(%rbp), %rcx
1454227fc:     	je	0x145422810 <.text+0x5421810>
1454227fe:     	movq	%rcx, %rsi
145422801:     	cmpq	$-0x1, %rax
145422805:     	jne	0x145422819 <.text+0x5421819>
145422807:     	movq	%rsi, 0xf0(%rbp)
14542280e:     	jmp	0x14542284f <.text+0x542184f>
145422810:     	movq	%rcx, 0xf0(%rbp)
145422817:     	jmp	0x14542284d <.text+0x542184d>
145422819:     	movl	$0x1, %r8d
14542281f:     	movq	0x1d0(%rbp), %rdx
145422826:     	movq	%rcx, 0x358(%rbp)
14542282d:     	movq	%r9, %rsi
145422830:     	callq	0x1400021d0 <.text+0x11d0>
145422835:     	movq	%rsi, %r9
145422838:     	movq	0x318(%rbp), %r8
14542283f:     	movq	0x358(%rbp), %rax
145422846:     	movq	%rax, 0xf0(%rbp)
14542284d:     	xorl	%esi, %esi
14542284f:     	movq	0x2c8(%rbp), %rdx
145422856:     	movabsq	$0x64006400640064, %rax # imm = 0x64006400640064
145422860:     	cmpq	$0x8, %rdi
145422864:     	movq	0x328(%rbp), %r10
14542286b:     	jb	0x14542289d <.text+0x542189d>
14542286d:     	movq	%r8, %rdi
145422870:     	movq	0x350(%rbp), %rax
145422877:     	movq	0x70(%rax), %rcx
14542287b:     	movq	0x78(%rax), %rdx
14542287f:     	callq	0x145450e50 <.text+0x544fe50>
145422884:     	nop
145422885:     	movq	0x2c8(%rbp), %rdx
14542288c:     	movq	%rdi, %r8
14542288f:     	movq	0x128(%rbp), %r9
145422896:     	movq	0x328(%rbp), %r10
14542289d:     	movb	%r13b, 0x228(%rbp)
1454228a4:     	movb	%bl, 0x229(%rbp)
1454228aa:     	movl	0x340(%rbp), %ecx
1454228b0:     	movb	%cl, 0x22a(%rbp)
1454228b6:     	movq	0x138(%rbp), %rcx
1454228bd:     	movq	%rcx, 0x1f0(%rbp)
1454228c4:     	movq	%r9, 0x1f8(%rbp)
1454228cb:     	movq	%r8, 0x200(%rbp)
1454228d2:     	movq	0x130(%rbp), %rcx
1454228d9:     	movq	%rcx, 0x208(%rbp)
1454228e0:     	movq	%rdx, 0x210(%rbp)
1454228e7:     	movq	%r10, 0x218(%rbp)
1454228ee:     	movl	%esi, 0x22b(%rbp)
1454228f4:     	shrq	$0x20, %rsi
1454228f8:     	movb	%sil, 0x22f(%rbp)
1454228ff:     	movq	%rax, 0x220(%rbp)
145422906:     	movb	$0x0, 0x366(%rbp)
14542290d:     	leaq	0x38(%rbp), %rcx
145422911:     	movq	%r15, %rdx
145422914:     	callq	0x145427b30 <.text+0x5426b30>
145422919:     	nop
14542291a:     	movq	0x38(%rbp), %rdi
14542291e:     	leaq	0x40(%rbp), %rax
145422922:     	movups	(%rax), %xmm0
145422925:     	movups	0x10(%rax), %xmm1
145422929:     	movups	0x20(%rax), %xmm2
14542292d:     	movaps	%xmm0, 0x160(%rbp)
145422934:     	movaps	%xmm1, 0x170(%rbp)
14542293b:     	movaps	%xmm2, 0x180(%rbp)
145422942:     	movq	0x30(%rax), %rax
145422946:     	movq	%rax, 0x190(%rbp)
14542294d:     	movq	0x140(%rbp), %rdx
145422954:     	testq	%rdx, %rdx
145422957:     	je	0x1454220fc <.text+0x54210fc>
14542295d:     	shlq	$0x4, %rdx
145422961:     	movl	$0x8, %r8d
145422967:     	movq	0x350(%rbp), %rcx
14542296e:     	callq	0x1400021d0 <.text+0x11d0>
145422973:     	jmp	0x1454220fc <.text+0x54210fc>
145422978:     	movq	0xe0(%rbp), %rsi
14542297f:     	cmpq	$0x15, %r14
145422983:     	jae	0x145422df9 <.text+0x5421df9>
145422989:     	leaq	(%rsi,%r14,4), %rax
14542298d:     	leaq	0x4(%rsi), %rcx
145422991:     	movl	$0x4, %edx
145422996:     	jmp	0x1454229ab <.text+0x54219ab>
145422998:     	movq	%rsi, %r9
14542299b:     	movl	%r8d, (%r9)
14542299e:     	addq	$0x4, %rcx
1454229a2:     	addq	$0x4, %rdx
1454229a6:     	cmpq	%rax, %rcx
1454229a9:     	je	0x1454229d7 <.text+0x54219d7>
1454229ab:     	movl	-0x4(%rcx), %r10d
1454229af:     	movl	(%rcx), %r8d
1454229b2:     	cmpl	%r10d, %r8d
1454229b5:     	jae	0x14542299e <.text+0x542199e>
1454229b7:     	movq	%rdx, %r9
1454229ba:     	movl	%r10d, (%rsi,%r9)
1454229be:     	cmpq	$0x4, %r9
1454229c2:     	je	0x145422998 <.text+0x5421998>
1454229c4:     	movl	-0x8(%rsi,%r9), %r10d
1454229c9:     	addq	$-0x4, %r9
1454229cd:     	cmpl	%r10d, %r8d
1454229d0:     	jb	0x1454229ba <.text+0x54219ba>
1454229d2:     	addq	%rsi, %r9
1454229d5:     	jmp	0x14542299b <.text+0x542199b>
1454229d7:     	movq	0xe8(%rbp), %r14
1454229de:     	cmpq	$0x2, %r14
1454229e2:     	jb	0x14541fbb7 <.text+0x541ebb7>
1454229e8:     	movq	0xe0(%rbp), %rsi
1454229ef:     	leaq	-0x1(%r14), %rax
1454229f3:     	xorl	%edx, %edx
1454229f5:     	movl	0x4(%rsi,%rdx,4), %ecx
1454229f9:     	cmpl	(%rsi,%rdx,4), %ecx
1454229fc:     	je	0x145422c5e <.text+0x5421c5e>
145422a02:     	incq	%rdx
145422a05:     	cmpq	%rdx, %rax
145422a08:     	jne	0x1454229f5 <.text+0x54219f5>
145422a0a:     	jmp	0x14541fbb7 <.text+0x541ebb7>
145422a0f:     	movq	0x1a8(%rbp), %r14
145422a16:     	cmpq	$0x15, %rsi
145422a1a:     	jae	0x145422e11 <.text+0x5421e11>
145422a20:     	shlq	$0x5, %rsi
145422a24:     	movl	$0x20, %edi
145422a29:     	leaq	(%r14,%rdi), %rdx
145422a2d:     	movq	%r14, %rcx
145422a30:     	callq	0x1454f0e30 <.text+0x54efe30>
145422a35:     	addq	$0x20, %rdi
145422a39:     	cmpq	%rdi, %rsi
145422a3c:     	jne	0x145422a29 <.text+0x5421a29>
145422a3e:     	jmp	0x1454207dd <.text+0x541f7dd>
145422a43:     	movq	0xb0(%rbp), %rcx
145422a4a:     	cmpq	$0x15, %rdx
145422a4e:     	jae	0x145422e29 <.text+0x5421e29>
145422a54:     	leaq	0x367(%rbp), %r9
145422a5b:     	movl	$0x1, %r8d
145422a61:     	callq	0x140034fa0 <.text+0x33fa0>
145422a66:     	jmp	0x145420884 <.text+0x541f884>
145422a6b:     	movq	0x98(%rbp), %r14
145422a72:     	cmpq	$0x15, %rsi
145422a76:     	jae	0x145422e3b <.text+0x5421e3b>
145422a7c:     	shlq	$0x5, %rsi
145422a80:     	movl	$0x20, %edi
145422a85:     	leaq	(%r14,%rdi), %rdx
145422a89:     	movq	%r14, %rcx
145422a8c:     	callq	0x1454f0f40 <.text+0x54eff40>
145422a91:     	addq	$0x20, %rdi
145422a95:     	cmpq	%rdi, %rsi
145422a98:     	jne	0x145422a85 <.text+0x5421a85>
145422a9a:     	jmp	0x14542092b <.text+0x541f92b>
145422a9f:     	movq	0x100(%rbp), %rcx
145422aa6:     	cmpq	$0x15, %rdx
145422aaa:     	jae	0x145422e53 <.text+0x5421e53>
145422ab0:     	leaq	0x367(%rbp), %r9
145422ab7:     	movl	$0x1, %r8d
145422abd:     	callq	0x1454f4f00 <.text+0x54f3f00>
145422ac2:     	movq	0x108(%rbp), %rcx
145422ac9:     	cmpq	$0x2, %rcx
145422acd:     	jb	0x145420f43 <.text+0x541ff43>
145422ad3:     	movl	$0x1, %eax
145422ad8:     	movl	$0x20, %edx
145422add:     	movq	0x100(%rbp), %r8
145422ae4:     	jmp	0x145422af6 <.text+0x5421af6>
145422ae6:     	incq	%rax
145422ae9:     	addq	$0x10, %rdx
145422aed:     	cmpq	%rax, %rcx
145422af0:     	je	0x145420f43 <.text+0x541ff43>
145422af6:     	movzbl	-0x10(%r8,%rdx), %r9d
145422afc:     	cmpb	-0x20(%r8,%rdx), %r9b
145422b01:     	jne	0x145422ae6 <.text+0x5421ae6>
145422b03:     	movq	-0x18(%r8,%rdx), %r9
145422b08:     	cmpq	%r9, -0x8(%r8,%rdx)
145422b0d:     	jne	0x145422ae6 <.text+0x5421ae6>
145422b0f:     	leaq	0x1(%rax), %r9
145422b13:     	cmpq	%rcx, %r9
145422b16:     	jae	0x145422d50 <.text+0x5421d50>
145422b1c:     	shlq	$0x4, %rcx
145422b20:     	jmp	0x145422b41 <.text+0x5421b41>
145422b22:     	leaq	(%r8,%rdx), %r10
145422b26:     	addq	%r8, %r9
145422b29:     	movups	(%r10), %xmm0
145422b2d:     	movups	%xmm0, (%r9)
145422b31:     	incq	%rax
145422b34:     	addq	$0x10, %rdx
145422b38:     	cmpq	%rdx, %rcx
145422b3b:     	je	0x145422d50 <.text+0x5421d50>
145422b41:     	movq	%rax, %r9
145422b44:     	shlq	$0x4, %r9
145422b48:     	movzbl	(%r8,%rdx), %r10d
145422b4d:     	cmpb	-0x10(%r8,%r9), %r10b
145422b52:     	jne	0x145422b22 <.text+0x5421b22>
145422b54:     	movq	-0x8(%r8,%r9), %r10
145422b59:     	cmpq	%r10, 0x8(%r8,%rdx)
145422b5e:     	je	0x145422b34 <.text+0x5421b34>
145422b60:     	jmp	0x145422b22 <.text+0x5421b22>
145422b62:     	movq	0x80(%rbp), %r14
145422b69:     	cmpq	$0x15, %rsi
145422b6d:     	jae	0x145422e65 <.text+0x5421e65>
145422b73:     	shlq	$0x5, %rsi
145422b77:     	movl	$0x20, %edi
145422b7c:     	leaq	(%r14,%rdi), %rdx
145422b80:     	movq	%r14, %rcx
145422b83:     	callq	0x1454f0e30 <.text+0x54efe30>
145422b88:     	addq	$0x20, %rdi
145422b8c:     	cmpq	%rdi, %rsi
145422b8f:     	jne	0x145422b7c <.text+0x5421b7c>
145422b91:     	jmp	0x145420fda <.text+0x541ffda>
145422b96:     	movq	0xc8(%rbp), %rsi
145422b9d:     	cmpq	$0x15, %r14
145422ba1:     	jae	0x145422e7d <.text+0x5421e7d>
145422ba7:     	leaq	(%rsi,%r14,4), %rax
145422bab:     	leaq	0x4(%rsi), %rcx
145422baf:     	movl	$0x4, %edx
145422bb4:     	jmp	0x145422bc9 <.text+0x5421bc9>
145422bb6:     	movq	%rsi, %r9
145422bb9:     	movl	%r8d, (%r9)
145422bbc:     	addq	$0x4, %rcx
145422bc0:     	addq	$0x4, %rdx
145422bc4:     	cmpq	%rax, %rcx
145422bc7:     	je	0x145422bf5 <.text+0x5421bf5>
145422bc9:     	movl	-0x4(%rcx), %r10d
145422bcd:     	movl	(%rcx), %r8d
145422bd0:     	cmpl	%r10d, %r8d
145422bd3:     	jae	0x145422bbc <.text+0x5421bbc>
145422bd5:     	movq	%rdx, %r9
145422bd8:     	movl	%r10d, (%rsi,%r9)
145422bdc:     	cmpq	$0x4, %r9
145422be0:     	je	0x145422bb6 <.text+0x5421bb6>
145422be2:     	movl	-0x8(%rsi,%r9), %r10d
145422be7:     	addq	$-0x4, %r9
145422beb:     	cmpl	%r10d, %r8d
145422bee:     	jb	0x145422bd8 <.text+0x5421bd8>
145422bf0:     	addq	%rsi, %r9
145422bf3:     	jmp	0x145422bb9 <.text+0x5421bb9>
145422bf5:     	movq	0xd0(%rbp), %r14
145422bfc:     	cmpq	$0x2, %r14
145422c00:     	jb	0x14542107e <.text+0x542007e>
145422c06:     	movq	0xc8(%rbp), %rsi
145422c0d:     	leaq	-0x1(%r14), %rax
145422c11:     	xorl	%edx, %edx
145422c13:     	movl	0x4(%rsi,%rdx,4), %ecx
145422c17:     	cmpl	(%rsi,%rdx,4), %ecx
145422c1a:     	je	0x145422cd7 <.text+0x5421cd7>
145422c20:     	incq	%rdx
145422c23:     	cmpq	%rdx, %rax
145422c26:     	jne	0x145422c13 <.text+0x5421c13>
145422c28:     	jmp	0x14542107e <.text+0x542007e>
145422c2d:     	movq	0x190(%rbp), %rax
145422c34:     	movq	%rax, 0x70(%rbp)
145422c38:     	movaps	0x160(%rbp), %xmm0
145422c3f:     	movaps	0x170(%rbp), %xmm1
145422c46:     	movaps	0x180(%rbp), %xmm2
145422c4d:     	movups	%xmm2, 0x60(%rbp)
145422c51:     	movups	%xmm1, 0x50(%rbp)
145422c55:     	movups	%xmm0, 0x40(%rbp)
145422c59:     	jmp	0x14541f2d3 <.text+0x541e2d3>
145422c5e:     	leaq	0x2(%rdx), %rcx
145422c62:     	leaq	0x1(%rdx), %rax
145422c66:     	cmpq	%r14, %rcx
145422c69:     	jae	0x145422c95 <.text+0x5421c95>
145422c6b:     	movl	%r14d, %r9d
145422c6e:     	subl	%edx, %r9d
145422c71:     	leaq	-0x3(%r14), %r8
145422c75:     	testb	$0x1, %r9b
145422c79:     	je	0x145422c90 <.text+0x5421c90>
145422c7b:     	movl	0x8(%rsi,%rdx,4), %ecx
145422c7f:     	cmpl	(%rsi,%rdx,4), %ecx
145422c82:     	je	0x145422c8c <.text+0x5421c8c>
145422c84:     	movl	%ecx, 0x4(%rsi,%rdx,4)
145422c88:     	leaq	0x2(%rdx), %rax
145422c8c:     	leaq	0x3(%rdx), %rcx
145422c90:     	cmpq	%rdx, %r8
145422c93:     	jne	0x145422caa <.text+0x5421caa>
145422c95:     	movq	%rax, 0xe8(%rbp)
145422c9c:     	jmp	0x14541fbb7 <.text+0x541ebb7>
145422ca1:     	addq	$0x2, %rcx
145422ca5:     	cmpq	%rcx, %r14
145422ca8:     	je	0x145422c95 <.text+0x5421c95>
145422caa:     	movl	(%rsi,%rcx,4), %edx
145422cad:     	cmpl	-0x4(%rsi,%rax,4), %edx
145422cb1:     	jne	0x145422cbf <.text+0x5421cbf>
145422cb3:     	movl	0x4(%rsi,%rcx,4), %edx
145422cb7:     	cmpl	-0x4(%rsi,%rax,4), %edx
145422cbb:     	je	0x145422ca1 <.text+0x5421ca1>
145422cbd:     	jmp	0x145422ccf <.text+0x5421ccf>
145422cbf:     	movl	%edx, (%rsi,%rax,4)
145422cc2:     	incq	%rax
145422cc5:     	movl	0x4(%rsi,%rcx,4), %edx
145422cc9:     	cmpl	-0x4(%rsi,%rax,4), %edx
145422ccd:     	je	0x145422ca1 <.text+0x5421ca1>
145422ccf:     	movl	%edx, (%rsi,%rax,4)
145422cd2:     	incq	%rax
145422cd5:     	jmp	0x145422ca1 <.text+0x5421ca1>
145422cd7:     	leaq	0x2(%rdx), %rcx
145422cdb:     	leaq	0x1(%rdx), %rax
145422cdf:     	cmpq	%r14, %rcx
145422ce2:     	jae	0x145422d0e <.text+0x5421d0e>
145422ce4:     	movl	%r14d, %r9d
145422ce7:     	subl	%edx, %r9d
145422cea:     	leaq	-0x3(%r14), %r8
145422cee:     	testb	$0x1, %r9b
145422cf2:     	je	0x145422d09 <.text+0x5421d09>
145422cf4:     	movl	0x8(%rsi,%rdx,4), %ecx
145422cf8:     	cmpl	(%rsi,%rdx,4), %ecx
145422cfb:     	je	0x145422d05 <.text+0x5421d05>
145422cfd:     	movl	%ecx, 0x4(%rsi,%rdx,4)
145422d01:     	leaq	0x2(%rdx), %rax
145422d05:     	leaq	0x3(%rdx), %rcx
145422d09:     	cmpq	%rdx, %r8
145422d0c:     	jne	0x145422d23 <.text+0x5421d23>
145422d0e:     	movq	%rax, 0xd0(%rbp)
145422d15:     	jmp	0x14542107e <.text+0x542007e>
145422d1a:     	addq	$0x2, %rcx
145422d1e:     	cmpq	%rcx, %r14
145422d21:     	je	0x145422d0e <.text+0x5421d0e>
145422d23:     	movl	(%rsi,%rcx,4), %edx
145422d26:     	cmpl	-0x4(%rsi,%rax,4), %edx
145422d2a:     	jne	0x145422d38 <.text+0x5421d38>
145422d2c:     	movl	0x4(%rsi,%rcx,4), %edx
145422d30:     	cmpl	-0x4(%rsi,%rax,4), %edx
145422d34:     	je	0x145422d1a <.text+0x5421d1a>
145422d36:     	jmp	0x145422d48 <.text+0x5421d48>
145422d38:     	movl	%edx, (%rsi,%rax,4)
145422d3b:     	incq	%rax
145422d3e:     	movl	0x4(%rsi,%rcx,4), %edx
145422d42:     	cmpl	-0x4(%rsi,%rax,4), %edx
145422d46:     	je	0x145422d1a <.text+0x5421d1a>
145422d48:     	movl	%edx, (%rsi,%rax,4)
145422d4b:     	incq	%rax
145422d4e:     	jmp	0x145422d1a <.text+0x5421d1a>
145422d50:     	movq	%rax, 0x108(%rbp)
145422d57:     	jmp	0x145420f43 <.text+0x541ff43>
145422d5c:     	leaq	0x12fdced(%rip), %r8    # 0x146720a50
145422d63:     	movq	%rsi, %rcx
145422d66:     	callq	0x1458e75b3 <.text+0x58e65b3>
145422d6b:     	nop
145422d6c:     	jmp	0x145422ee1 <.text+0x5421ee1>
145422d71:     	leaq	0x12fdcf0(%rip), %r8    # 0x146720a68
145422d78:     	movl	$0x13, %edx
145422d7d:     	callq	0x1458e75b3 <.text+0x58e65b3>
145422d82:     	nop
145422d83:     	jmp	0x145422ee1 <.text+0x5421ee1>
145422d88:     	movq	0x1e8(%rbp), %rdx
145422d8f:     	movb	$0x1, 0x366(%rbp)
145422d96:     	movq	0x130(%rbp), %rcx
145422d9d:     	callq	0x1458e721b <.text+0x58e621b>
145422da2:     	nop
145422da3:     	jmp	0x145422ee1 <.text+0x5421ee1>
145422da8:     	movq	0x1e8(%rbp), %rdx
145422daf:     	movq	0x138(%rbp), %rcx
145422db6:     	callq	0x1458e721b <.text+0x58e621b>
145422dbb:     	nop
145422dbc:     	jmp	0x145422ee1 <.text+0x5421ee1>
145422dc1:     	leaq	0x12fdcb8(%rip), %r8    # 0x146720a80
145422dc8:     	movq	%rsi, %rcx
145422dcb:     	callq	0x1458e75b3 <.text+0x58e65b3>
145422dd0:     	nop
145422dd1:     	jmp	0x145422ee1 <.text+0x5421ee1>
145422dd6:     	leaq	0x12fdcbb(%rip), %r8    # 0x146720a98
145422ddd:     	movl	$0x13, %edx
145422de2:     	callq	0x1458e75b3 <.text+0x58e65b3>
145422de7:     	nop
145422de8:     	jmp	0x145422ee1 <.text+0x5421ee1>
145422ded:     	movq	%r14, 0x328(%rbp)
145422df4:     	jmp	0x1454213f6 <.text+0x54203f6>
145422df9:     	leaq	0x367(%rbp), %r8
145422e00:     	movq	%rsi, %rcx
145422e03:     	movq	%r14, %rdx
145422e06:     	callq	0x14505cee0 <.text+0x505bee0>
145422e0b:     	nop
145422e0c:     	jmp	0x1454229ef <.text+0x54219ef>
145422e11:     	leaq	0x367(%rbp), %r8
145422e18:     	movq	%r14, %rcx
145422e1b:     	movq	%rsi, %rdx
145422e1e:     	callq	0x1455391d0 <.text+0x55381d0>
145422e23:     	nop
145422e24:     	jmp	0x1454207dd <.text+0x541f7dd>
145422e29:     	leaq	0x367(%rbp), %r8
145422e30:     	callq	0x14561b460 <.text+0x561a460>
145422e35:     	nop
145422e36:     	jmp	0x145420884 <.text+0x541f884>
145422e3b:     	leaq	0x367(%rbp), %r8
145422e42:     	movq	%r14, %rcx
145422e45:     	movq	%rsi, %rdx
145422e48:     	callq	0x145539370 <.text+0x5538370>
145422e4d:     	nop
145422e4e:     	jmp	0x14542092b <.text+0x541f92b>
145422e53:     	leaq	0x367(%rbp), %r8
145422e5a:     	callq	0x1454f0a20 <.text+0x54efa20>
145422e5f:     	nop
145422e60:     	jmp	0x145422ac2 <.text+0x5421ac2>
145422e65:     	leaq	0x367(%rbp), %r8
145422e6c:     	movq	%r14, %rcx
145422e6f:     	movq	%rsi, %rdx
145422e72:     	callq	0x1455391d0 <.text+0x55381d0>
145422e77:     	nop
145422e78:     	jmp	0x145420fda <.text+0x541ffda>
145422e7d:     	leaq	0x367(%rbp), %r8
145422e84:     	movq	%rsi, %rcx
145422e87:     	movq	%r14, %rdx
145422e8a:     	callq	0x14505cee0 <.text+0x505bee0>
145422e8f:     	nop
145422e90:     	jmp	0x145422c0d <.text+0x5421c0d>
145422e95:     	movq	%rdx, 0x1d0(%rbp)
145422e9c:     	movq	%r10, 0x350(%rbp)
145422ea3:     	movb	$0x1, 0x366(%rbp)
145422eaa:     	leaq	0x12fdd27(%rip), %r8    # 0x146720bd8
145422eb1:     	movl	$0x2, %ecx
145422eb6:     	movl	$0x2, %edx
145422ebb:     	callq	0x1458e75b3 <.text+0x58e65b3>
145422ec0:     	nop
145422ec1:     	jmp	0x145422ee1 <.text+0x5421ee1>
145422ec3:     	movb	$0x1, 0x366(%rbp)
145422eca:     	leaq	0x12fdd1f(%rip), %r8    # 0x146720bf0
145422ed1:     	movl	$0x4, %ecx
145422ed6:     	movl	$0x4, %edx
145422edb:     	callq	0x1458e75b3 <.text+0x58e65b3>
145422ee0:     	nop
145422ee1:     	ud2
