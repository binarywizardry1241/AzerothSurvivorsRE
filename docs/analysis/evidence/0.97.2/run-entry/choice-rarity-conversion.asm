
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455452d0:     	pushq	%rbp
1455452d1:     	pushq	%r15
1455452d3:     	pushq	%r14
1455452d5:     	pushq	%r13
1455452d7:     	pushq	%r12
1455452d9:     	pushq	%rsi
1455452da:     	pushq	%rdi
1455452db:     	pushq	%rbx
1455452dc:     	subq	$0x218, %rsp            # imm = 0x218
1455452e3:     	leaq	0x80(%rsp), %rbp
1455452eb:     	movaps	%xmm15, 0x180(%rbp)
1455452f3:     	movaps	%xmm14, 0x170(%rbp)
1455452fb:     	movaps	%xmm13, 0x160(%rbp)
145545303:     	movaps	%xmm12, 0x150(%rbp)
14554530b:     	movaps	%xmm11, 0x140(%rbp)
145545313:     	movaps	%xmm10, 0x130(%rbp)
14554531b:     	movaps	%xmm9, 0x120(%rbp)
145545323:     	movaps	%xmm8, 0x110(%rbp)
14554532b:     	movaps	%xmm7, 0x100(%rbp)
145545332:     	movaps	%xmm6, 0xf0(%rbp)
145545339:     	movq	$-0x2, 0xe8(%rbp)
145545344:     	movq	0x8(%rcx), %rax
145545348:     	movq	0x18(%rcx), %r8
14554534c:     	movq	%r8, 0x88(%rbp)
145545353:     	movq	0x10(%rdx), %r8
145545357:     	movq	%r8, 0x90(%rbp)
14554535e:     	movq	%rdx, 0xd8(%rbp)
145545365:     	movq	0x18(%rdx), %rsi
145545369:     	leaq	0x458(%rsi), %rdi
145545370:     	movss	0x3c5acc(%rip), %xmm7   # 0x14590ae44
145545378:     	movss	0x3a60ff(%rip), %xmm8   # 0x1458eb480
145545381:     	movss	0x482612(%rip), %xmm9   # 0x1459c799c
14554538a:     	movss	0x3b3a4d(%rip), %xmm10  # 0x1458f8de0
145545393:     	movss	0x3a615c(%rip), %xmm11  # 0x1458eb4f8
14554539c:     	movss	0x3ebb5b(%rip), %xmm12  # 0x145930f00
1455453a5:     	leaq	0xc8(%rbp), %r13
1455453ac:     	movq	%rcx, 0xd0(%rbp)
1455453b3:     	cmpq	0x88(%rbp), %rax
1455453ba:     	je	0x1455456ec <.text+0x55446ec>
1455453c0:     	movups	(%rax), %xmm0
1455453c3:     	movups	0x10(%rax), %xmm1
1455453c7:     	movaps	%xmm1, -0x50(%rbp)
1455453cb:     	movaps	%xmm0, -0x60(%rbp)
1455453cf:     	leaq	0x20(%rax), %rdx
1455453d3:     	movq	%rdx, 0x80(%rbp)
1455453da:     	movq	%rdx, 0x8(%rcx)
1455453de:     	movups	(%rax), %xmm0
1455453e1:     	movups	0x10(%rax), %xmm1
1455453e5:     	movaps	%xmm1, 0x70(%rbp)
1455453e9:     	movaps	%xmm0, 0x60(%rbp)
1455453ed:     	movl	0x3f8(%rsi), %eax
1455453f3:     	xorps	%xmm0, %xmm0
1455453f6:     	cvtsi2ss	%rax, %xmm0
1455453fb:     	mulss	0x409f0d(%rip), %xmm0   # 0x14594f310
145545403:     	minss	%xmm7, %xmm0
145545407:     	movss	0x484(%rsi), %xmm14
145545410:     	addss	%xmm8, %xmm14
145545415:     	addss	%xmm0, %xmm14
14554541a:     	movaps	%xmm14, %xmm6
14554541e:     	mulss	%xmm9, %xmm6
145545423:     	movaps	%xmm14, %xmm15
145545427:     	mulss	%xmm14, %xmm15
14554542c:     	movaps	%xmm15, %xmm13
145545430:     	mulss	%xmm10, %xmm13
145545435:     	mulss	%xmm15, %xmm14
14554543a:     	mulss	%xmm15, %xmm15
14554543f:     	mulss	%xmm11, %xmm14
145545444:     	movaps	%xmm6, %xmm2
145545447:     	addss	%xmm12, %xmm2
14554544c:     	addss	%xmm13, %xmm2
145545451:     	addss	%xmm14, %xmm2
145545456:     	addss	%xmm15, %xmm2
14554545b:     	movb	$0x1, 0xe7(%rbp)
145545462:     	xorps	%xmm1, %xmm1
145545465:     	leaq	0x880(%rsi), %rcx
14554546c:     	callq	0x1454f97c0 <.text+0x54f87c0>
145545471:     	nop
145545472:     	ucomiss	%xmm0, %xmm12
145545476:     	jbe	0x145545490 <.text+0x5544490>
145545478:     	xorl	%eax, %eax
14554547a:     	cmpq	$0x0, 0x60(%rbp)
14554547f:     	jns	0x1455454e7 <.text+0x55444e7>
145545481:     	movq	%rax, %r12
145545484:     	jmp	0x14554566d <.text+0x554466d>
145545489:     	nopl	(%rax)
145545490:     	addss	0x482a00(%rip), %xmm0   # 0x1459c7e98
145545498:     	movl	$0x1, %eax
14554549d:     	ucomiss	%xmm0, %xmm6
1455454a0:     	ja	0x1455454e0 <.text+0x55444e0>
1455454a2:     	subss	%xmm6, %xmm0
1455454a6:     	movl	$0x2, %eax
1455454ab:     	ucomiss	%xmm0, %xmm13
1455454af:     	ja	0x1455454e0 <.text+0x55444e0>
1455454b1:     	subss	%xmm13, %xmm0
1455454b6:     	movl	$0x3, %eax
1455454bb:     	ucomiss	%xmm0, %xmm14
1455454bf:     	ja	0x1455454e0 <.text+0x55444e0>
1455454c1:     	subss	%xmm14, %xmm0
1455454c6:     	ucomiss	%xmm0, %xmm15
1455454ca:     	jbe	0x145545478 <.text+0x5544478>
1455454cc:     	movl	$0x4, %eax
1455454d1:     	nopw	%cs:(%rax,%rax)
1455454e0:     	cmpq	$0x0, 0x60(%rbp)
1455454e5:     	js	0x145545481 <.text+0x5544481>
1455454e7:     	movq	0x78(%rbp), %r15
1455454eb:     	imulq	$0x58, %r15, %rbx
1455454ef:     	movq	%rax, 0x98(%rbp)
1455454f6:     	jmp	0x14554550e <.text+0x554450e>
1455454f8:     	nopl	(%rax,%rax)
145545500:     	leaq	0x1(%r12), %rax
145545505:     	testq	%r14, %r14
145545508:     	jne	0x14554566d <.text+0x554466d>
14554550e:     	cmpq	$0x3, %rax
145545512:     	ja	0x1455455c0 <.text+0x55445c0>
145545518:     	movq	%rax, %r12
14554551b:     	movq	%rax, 0xc8(%rbp)
145545522:     	movq	0x2a0(%rsi), %rdx
145545529:     	cmpq	%rdx, %r15
14554552c:     	jae	0x14554577a <.text+0x554477a>
145545532:     	movq	0x298(%rsi), %rax
145545539:     	movq	(%rax,%rbx), %rcx
14554553d:     	addq	%rbx, %rax
145545540:     	movq	0x30(%rcx), %rdx
145545544:     	movq	0x38(%rcx), %r8
145545548:     	addq	%rdx, %r8
14554554b:     	movq	%rdx, -0x40(%rbp)
14554554f:     	movq	%r8, -0x38(%rbp)
145545553:     	movq	%rcx, -0x30(%rbp)
145545557:     	movq	%rax, -0x28(%rbp)
14554555b:     	movq	%rdi, -0x20(%rbp)
14554555f:     	movq	%rax, -0x18(%rbp)
145545563:     	movq	%rdi, -0x10(%rbp)
145545567:     	movq	%r13, -0x8(%rbp)
14554556b:     	movq	%rax, (%rbp)
14554556f:     	movq	%r13, 0x8(%rbp)
145545573:     	movb	$0x1, 0xe7(%rbp)
14554557a:     	leaq	0xa0(%rbp), %rcx
145545581:     	leaq	-0x40(%rbp), %rdx
145545585:     	callq	0x1455292b0 <.text+0x55282b0>
14554558a:     	nop
14554558b:     	movq	0xa0(%rbp), %rdx
145545592:     	movq	0xb0(%rbp), %r14
145545599:     	testq	%rdx, %rdx
14554559c:     	je	0x145545500 <.text+0x5544500>
1455455a2:     	movq	0xa8(%rbp), %rcx
1455455a9:     	movl	$0x1, %r8d
1455455af:     	callq	0x1400021d0 <.text+0x11d0>
1455455b4:     	jmp	0x145545500 <.text+0x5544500>
1455455b9:     	nopl	(%rax)
1455455c0:     	movq	$0x4, 0xc8(%rbp)
1455455cb:     	movq	0x2a0(%rsi), %rdx
1455455d2:     	cmpq	%rdx, %r15
1455455d5:     	jae	0x145545793 <.text+0x5544793>
1455455db:     	movq	0x298(%rsi), %rax
1455455e2:     	leaq	(%rax,%rbx), %rcx
1455455e6:     	movq	(%rax,%rbx), %rax
1455455ea:     	movq	0x30(%rax), %rdx
1455455ee:     	movq	0x38(%rax), %r8
1455455f2:     	addq	%rdx, %r8
1455455f5:     	movq	%rdx, -0x40(%rbp)
1455455f9:     	movq	%r8, -0x38(%rbp)
1455455fd:     	movq	%rax, -0x30(%rbp)
145545601:     	movq	%rcx, -0x28(%rbp)
145545605:     	movq	%rdi, -0x20(%rbp)
145545609:     	movq	%rcx, -0x18(%rbp)
14554560d:     	movq	%rdi, -0x10(%rbp)
145545611:     	movq	%r13, -0x8(%rbp)
145545615:     	movq	%rcx, (%rbp)
145545619:     	movq	%r13, 0x8(%rbp)
14554561d:     	movb	$0x1, 0xe7(%rbp)
145545624:     	leaq	0xa0(%rbp), %rcx
14554562b:     	leaq	-0x40(%rbp), %rdx
14554562f:     	callq	0x1455292b0 <.text+0x55282b0>
145545634:     	nop
145545635:     	movq	0xa0(%rbp), %rdx
14554563c:     	movq	0xb0(%rbp), %rbx
145545643:     	testq	%rdx, %rdx
145545646:     	je	0x14554565a <.text+0x554465a>
145545648:     	movq	0xa8(%rbp), %rcx
14554564f:     	movl	$0x1, %r8d
145545655:     	callq	0x1400021d0 <.text+0x11d0>
14554565a:     	testq	%rbx, %rbx
14554565d:     	movl	$0x4, %eax
145545662:     	movq	0x98(%rbp), %r12
145545669:     	cmovneq	%rax, %r12
14554566d:     	movaps	-0x60(%rbp), %xmm0
145545671:     	movaps	-0x50(%rbp), %xmm1
145545675:     	movaps	%xmm1, 0xb0(%rbp)
14554567c:     	movaps	%xmm0, 0xa0(%rbp)
145545683:     	movb	$0x0, 0xe7(%rbp)
14554568a:     	leaq	-0x40(%rbp), %rcx
14554568e:     	movq	%rsi, %rdx
145545691:     	leaq	0xa0(%rbp), %r8
145545698:     	movq	%r12, %r9
14554569b:     	callq	0x1454ded40 <.text+0x54ddd40>
1455456a0:     	nop
1455456a1:     	movq	0xd8(%rbp), %r14
1455456a8:     	movq	0x8(%r14), %rbx
1455456ac:     	leaq	(%rbx,%rbx,4), %rcx
1455456b0:     	shlq	$0x5, %rcx
1455456b4:     	addq	0x90(%rbp), %rcx
1455456bb:     	movl	$0xa0, %r8d
1455456c1:     	leaq	-0x40(%rbp), %rdx
1455456c5:     	callq	0x145756ddd <.text+0x5755ddd>
1455456ca:     	incq	%rbx
1455456cd:     	movq	%rbx, 0x8(%r14)
1455456d1:     	movq	0x80(%rbp), %rax
1455456d8:     	movq	0xd0(%rbp), %rcx
1455456df:     	cmpq	0x88(%rbp), %rax
1455456e6:     	jne	0x1455453c0 <.text+0x55443c0>
1455456ec:     	movq	0x10(%rcx), %rdx
1455456f0:     	testq	%rdx, %rdx
1455456f3:     	je	0x145545707 <.text+0x5544707>
1455456f5:     	movq	(%rcx), %rcx
1455456f8:     	shlq	$0x5, %rdx
1455456fc:     	movl	$0x8, %r8d
145545702:     	callq	0x1400021d0 <.text+0x11d0>
145545707:     	movq	0xd8(%rbp), %rcx
14554570e:     	movq	(%rcx), %rax
145545711:     	movq	0x8(%rcx), %rcx
145545715:     	movq	%rcx, (%rax)
145545718:     	movaps	0xf0(%rbp), %xmm6
14554571f:     	movaps	0x100(%rbp), %xmm7
145545726:     	movaps	0x110(%rbp), %xmm8
14554572e:     	movaps	0x120(%rbp), %xmm9
145545736:     	movaps	0x130(%rbp), %xmm10
14554573e:     	movaps	0x140(%rbp), %xmm11
145545746:     	movaps	0x150(%rbp), %xmm12
14554574e:     	movaps	0x160(%rbp), %xmm13
145545756:     	movaps	0x170(%rbp), %xmm14
14554575e:     	movaps	0x180(%rbp), %xmm15
145545766:     	addq	$0x218, %rsp            # imm = 0x218
14554576d:     	popq	%rbx
14554576e:     	popq	%rdi
14554576f:     	popq	%rsi
145545770:     	popq	%r12
145545772:     	popq	%r13
145545774:     	popq	%r14
145545776:     	popq	%r15
145545778:     	popq	%rbp
145545779:     	retq
14554577a:     	movb	$0x1, 0xe7(%rbp)
145545781:     	leaq	0x1466b90(%rip), %r8    # 0x1469ac318
145545788:     	movq	%r15, %rcx
14554578b:     	callq	0x1458e75b3 <.text+0x58e65b3>
145545790:     	nop
145545791:     	jmp	0x1455457aa <.text+0x55447aa>
145545793:     	movb	$0x1, 0xe7(%rbp)
14554579a:     	leaq	0x1466b77(%rip), %r8    # 0x1469ac318
1455457a1:     	movq	%r15, %rcx
1455457a4:     	callq	0x1458e75b3 <.text+0x58e65b3>
1455457a9:     	nop
1455457aa:     	ud2
