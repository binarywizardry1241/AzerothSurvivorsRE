
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e91d0:     	pushq	%rbp
1454e91d1:     	pushq	%r15
1454e91d3:     	pushq	%r14
1454e91d5:     	pushq	%r13
1454e91d7:     	pushq	%r12
1454e91d9:     	pushq	%rsi
1454e91da:     	pushq	%rdi
1454e91db:     	pushq	%rbx
1454e91dc:     	subq	$0x178, %rsp            # imm = 0x178
1454e91e3:     	leaq	0x80(%rsp), %rbp
1454e91eb:     	movaps	%xmm11, 0xe0(%rbp)
1454e91f3:     	movaps	%xmm10, 0xd0(%rbp)
1454e91fb:     	movaps	%xmm9, 0xc0(%rbp)
1454e9203:     	movaps	%xmm8, 0xb0(%rbp)
1454e920b:     	movaps	%xmm7, 0xa0(%rbp)
1454e9212:     	movaps	%xmm6, 0x90(%rbp)
1454e9219:     	movq	$-0x2, 0x88(%rbp)
1454e9224:     	cmpl	$0x5, 0x7e8(%rcx)
1454e922b:     	jb	0x1454e970c <.text+0x54e870c>
1454e9231:     	movq	%rcx, %rsi
1454e9234:     	movss	0x934(%rcx), %xmm0
1454e923c:     	movq	0x748(%rcx), %rcx
1454e9243:     	movss	0x51f065(%rip), %xmm1   # 0x145a082b0
1454e924b:     	testq	%rcx, %rcx
1454e924e:     	je	0x1454e929f <.text+0x54e829f>
1454e9250:     	movq	0x740(%rsi), %rax
1454e9257:     	shlq	$0x3, %rcx
1454e925b:     	leaq	(%rcx,%rcx,2), %rdx
1454e925f:     	xorl	%ecx, %ecx
1454e9261:     	movabsq	$0x7461665f6c616573, %r8 # imm = 0x7461665F6C616573
1454e926b:     	jmp	0x1454e9279 <.text+0x54e8279>
1454e926d:     	nopl	(%rax)
1454e9270:     	addq	$0x18, %rcx
1454e9274:     	cmpq	%rcx, %rdx
1454e9277:     	je	0x1454e929f <.text+0x54e829f>
1454e9279:     	cmpq	$0x9, 0x8(%rax,%rcx)
1454e927f:     	jne	0x1454e9270 <.text+0x54e8270>
1454e9281:     	movq	(%rax,%rcx), %r9
1454e9285:     	movq	(%r9), %r10
1454e9288:     	xorq	%r8, %r10
1454e928b:     	movzbl	0x8(%r9), %r9d
1454e9290:     	xorq	$0x65, %r9
1454e9294:     	orq	%r10, %r9
1454e9297:     	jne	0x1454e9270 <.text+0x54e8270>
1454e9299:     	movss	0x10(%rax,%rcx), %xmm1
1454e929f:     	ucomiss	%xmm1, %xmm0
1454e92a2:     	jb	0x1454e970c <.text+0x54e870c>
1454e92a8:     	movq	0x2b8(%rsi), %rcx
1454e92af:     	testq	%rcx, %rcx
1454e92b2:     	je	0x1454e970c <.text+0x54e870c>
1454e92b8:     	movq	0x2b0(%rsi), %rax
1454e92bf:     	imulq	$0x58, %rcx, %rdx
1454e92c3:     	xorl	%ecx, %ecx
1454e92c5:     	movabsq	$0x7461665f6c616573, %r8 # imm = 0x7461665F6C616573
1454e92cf:     	jmp	0x1454e92ed <.text+0x54e82ed>
1454e92d1:     	nopw	%cs:(%rax,%rax)
1454e92e0:     	addq	$0x58, %rcx
1454e92e4:     	cmpq	%rcx, %rdx
1454e92e7:     	je	0x1454e970c <.text+0x54e870c>
1454e92ed:     	movq	(%rax,%rcx), %r14
1454e92f1:     	cmpq	$0x9, 0x8(%r14)
1454e92f6:     	jne	0x1454e92e0 <.text+0x54e82e0>
1454e92f8:     	movq	(%r14), %r9
1454e92fb:     	movq	(%r9), %r10
1454e92fe:     	xorq	%r8, %r10
1454e9301:     	movzbl	0x8(%r9), %r9d
1454e9306:     	xorq	$0x65, %r9
1454e930a:     	orq	%r10, %r9
1454e930d:     	jne	0x1454e92e0 <.text+0x54e82e0>
1454e930f:     	movl	0x8(%rax,%rcx), %edx
1454e9313:     	movss	0x14(%rax,%rcx), %xmm0
1454e9319:     	movl	0x18(%rax,%rcx), %r15d
1454e931e:     	movl	0x34(%rax,%rcx), %r8d
1454e9323:     	movl	%r8d, -0xc(%rbp)
1454e9327:     	movups	0x24(%rax,%rcx), %xmm1
1454e932c:     	movups	%xmm1, -0x1c(%rbp)
1454e9330:     	movups	0x38(%rax,%rcx), %xmm1
1454e9335:     	movups	0x44(%rax,%rcx), %xmm2
1454e933a:     	movups	%xmm1, -0x8(%rbp)
1454e933e:     	movups	%xmm2, 0x4(%rbp)
1454e9342:     	movq	%r14, -0x40(%rbp)
1454e9346:     	movl	%edx, -0x38(%rbp)
1454e9349:     	movss	0x10(%rax,%rcx), %xmm7
1454e934f:     	movsd	0xc(%rax,%rcx), %xmm1
1454e9355:     	movsd	%xmm1, -0x34(%rbp)
1454e935a:     	movss	%xmm0, -0x2c(%rbp)
1454e935f:     	movl	%r15d, -0x28(%rbp)
1454e9363:     	movsd	0x1c(%rax,%rcx), %xmm0
1454e9369:     	movsd	%xmm0, -0x24(%rbp)
1454e936e:     	movss	0x470(%rsi), %xmm8
1454e9377:     	movss	0x474(%rsi), %xmm6
1454e937f:     	movl	0x4a4(%rsi), %r13d
1454e9386:     	movl	0x408(%rsi), %eax
1454e938c:     	movl	%eax, 0x48(%rbp)
1454e938f:     	movq	0x400(%rsi), %rax
1454e9396:     	movq	%rax, 0x40(%rbp)
1454e939a:     	movss	0x4c(%r14), %xmm3
1454e93a0:     	movq	$0x0, 0x28(%rsp)
1454e93a9:     	movq	$0x8, 0x20(%rsp)
1454e93b2:     	leaq	0x18(%rbp), %rcx
1454e93b6:     	leaq	0x40(%rbp), %rbx
1454e93ba:     	movq	%rsi, %rdx
1454e93bd:     	movq	%rbx, %r8
1454e93c0:     	callq	0x145500300 <.text+0x54ff300>
1454e93c5:     	movq	0x28(%rbp), %rdi
1454e93c9:     	testq	%rdi, %rdi
1454e93cc:     	je	0x1454e9519 <.text+0x54e8519>
1454e93d2:     	movq	0x20(%rbp), %rax
1454e93d6:     	movq	%rax, 0x78(%rbp)
1454e93da:     	movss	0x934(%rsi), %xmm0
1454e93e2:     	movss	%xmm0, 0x6c(%rbp)
1454e93e7:     	movq	%rsi, 0x40(%rbp)
1454e93eb:     	leaq	0x6c(%rbp), %rax
1454e93ef:     	movq	%rax, 0x48(%rbp)
1454e93f3:     	movq	%rbx, 0x60(%rbp)
1454e93f7:     	leaq	0x60(%rbp), %r12
1454e93fb:     	movq	%r12, 0x30(%rbp)
1454e93ff:     	cmpq	$0x1, %rdi
1454e9403:     	jne	0x1454e974e <.text+0x54e874e>
1454e9409:     	movl	0x54(%r14), %eax
1454e940d:     	addl	%r15d, %r13d
1454e9410:     	addl	%eax, %r13d
1454e9413:     	addl	(%rbp), %r13d
1454e9417:     	testl	%eax, %eax
1454e9419:     	cmovel	%eax, %r13d
1454e941d:     	cmpl	$0x3, %r13d
1454e9421:     	movl	$0x3, %eax
1454e9426:     	cmovbl	%r13d, %eax
1454e942a:     	testl	%r13d, %r13d
1454e942d:     	movl	$0x1, %ebx
1454e9432:     	cmovnel	%eax, %ebx
1454e9435:     	cmpq	%rbx, %rdi
1454e9438:     	cmovaeq	%rbx, %rdi
1454e943c:     	movl	$0x0, 0x7e8(%rsi)
1454e9446:     	movb	$0x1, 0x87(%rbp)
1454e944d:     	leaq	-0x40(%rbp), %rdx
1454e9451:     	movq	%rsi, %rcx
1454e9454:     	callq	0x1454e6b90 <.text+0x54e5b90>
1454e9459:     	nop
1454e945a:     	testl	%ebx, %ebx
1454e945c:     	je	0x1454e9780 <.text+0x54e8780>
1454e9462:     	movq	0x3e8(%rsi), %rdx
1454e9469:     	movq	0x78(%rbp), %r9
1454e946d:     	movq	(%r9), %rax
1454e9470:     	movq	%rax, 0x38(%rbp)
1454e9474:     	movl	$0x0, 0x30(%rbp)
1454e947b:     	movl	$0x0, 0x60(%rbp)
1454e9482:     	movb	$0x1, 0x87(%rbp)
1454e9489:     	movq	%r12, 0x30(%rsp)
1454e948e:     	leaq	0x30(%rbp), %rax
1454e9492:     	movq	%rax, 0x28(%rsp)
1454e9497:     	movq	%rdi, 0x20(%rsp)
1454e949c:     	leaq	0x40(%rbp), %rcx
1454e94a0:     	movl	$0x832, %r8d            # imm = 0x832
1454e94a6:     	callq	0x145466ab0 <.text+0x5465ab0>
1454e94ab:     	nop
1454e94ac:     	movq	0x560(%rsi), %rbx
1454e94b3:     	cmpq	0x550(%rsi), %rbx
1454e94ba:     	jne	0x1454e94c9 <.text+0x54e84c9>
1454e94bc:     	leaq	0x550(%rsi), %rcx
1454e94c3:     	callq	0x145774710 <.text+0x5773710>
1454e94c8:     	nop
1454e94c9:     	movq	0x558(%rsi), %rax
1454e94d0:     	movq	%rbx, %rcx
1454e94d3:     	shlq	$0x5, %rcx
1454e94d7:     	movups	0x40(%rbp), %xmm0
1454e94db:     	movups	0x50(%rbp), %xmm1
1454e94df:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e94e4:     	movups	%xmm0, (%rax,%rcx)
1454e94e8:     	incq	%rbx
1454e94eb:     	movq	%rbx, 0x560(%rsi)
1454e94f2:     	movss	0x44(%r14), %xmm1
1454e94f8:     	movss	-0x8(%rbp), %xmm0
1454e94fd:     	movzbl	0x75(%r14), %eax
1454e9502:     	addb	$-0x2, %al
1454e9504:     	cmpb	$0x6, %al
1454e9506:     	ja	0x1454e9533 <.text+0x54e8533>
1454e9508:     	movzbl	%al, %eax
1454e950b:     	leaq	0x150f022(%rip), %rcx   # 0x1469f8534
1454e9512:     	movss	(%rcx,%rax,4), %xmm2
1454e9517:     	jmp	0x1454e953b <.text+0x54e853b>
1454e9519:     	movq	0x18(%rbp), %rdx
1454e951d:     	testq	%rdx, %rdx
1454e9520:     	je	0x1454e970c <.text+0x54e870c>
1454e9526:     	movq	0x20(%rbp), %rax
1454e952a:     	movq	%rax, 0x78(%rbp)
1454e952e:     	jmp	0x1454e96f9 <.text+0x54e86f9>
1454e9533:     	movss	0x41df55(%rip), %xmm2   # 0x145907490
1454e953b:     	mulss	0xc(%rbp), %xmm8
1454e9541:     	xorps	%xmm3, %xmm3
1454e9544:     	cmpltss	%xmm1, %xmm3
1454e9549:     	andps	%xmm8, %xmm3
1454e954d:     	mulss	0x42f19b(%rip), %xmm1   # 0x1459186f0
1454e9555:     	mulss	%xmm1, %xmm7
1454e9559:     	mulss	%xmm7, %xmm0
1454e955d:     	mulss	%xmm2, %xmm0
1454e9561:     	addss	%xmm3, %xmm0
1454e9565:     	mulss	%xmm0, %xmm6
1454e9569:     	movq	0x18(%rbp), %rax
1454e956d:     	movq	%rax, 0x70(%rbp)
1454e9571:     	movq	0x78(%rbp), %rbx
1454e9575:     	leaq	(%rbx,%rdi,8), %rdi
1454e9579:     	movaps	%xmm6, %xmm7
1454e957c:     	addss	%xmm6, %xmm7
1454e9580:     	movss	0x51ee17(%rip), %xmm8   # 0x145a083a0
1454e9589:     	movss	0x42c33e(%rip), %xmm9   # 0x1459158d0
1454e9592:     	nopw	%cs:(%rax,%rax)
1454e95a0:     	movq	(%rbx), %rdx
1454e95a3:     	addq	$0x8, %rbx
1454e95a7:     	movq	0x4e0(%rsi), %rax
1454e95ae:     	imulq	$0x160, 0x4e8(%rsi), %r8 # imm = 0x160
1454e95b9:     	xorl	%ecx, %ecx
1454e95bb:     	movq	%rax, %r9
1454e95be:     	nop
1454e95c0:     	cmpq	%rcx, %r8
1454e95c3:     	je	0x1454e9600 <.text+0x54e8600>
1454e95c5:     	addq	$0x160, %rcx            # imm = 0x160
1454e95cc:     	cmpq	%rdx, 0x88(%r9)
1454e95d3:     	leaq	0x160(%r9), %r9
1454e95da:     	jne	0x1454e95c0 <.text+0x54e85c0>
1454e95dc:     	movss	-0x70(%rax,%rcx), %xmm0
1454e95e2:     	divss	-0x6c(%rax,%rcx), %xmm0
1454e95e8:     	cmpltss	%xmm9, %xmm0
1454e95ee:     	movaps	%xmm0, %xmm1
1454e95f1:     	andps	%xmm7, %xmm1
1454e95f4:     	andnps	%xmm6, %xmm0
1454e95f7:     	orps	%xmm1, %xmm0
1454e95fa:     	jmp	0x1454e9603 <.text+0x54e8603>
1454e95fc:     	nopl	(%rax)
1454e9600:     	movaps	%xmm6, %xmm0
1454e9603:     	movq	0x8a0(%rsi), %rax
1454e960a:     	movq	0x8b8(%rsi), %rcx
1454e9611:     	leaq	(%rcx,%rax), %r8
1454e9615:     	rolq	$0x17, %r8
1454e9619:     	addq	%rax, %r8
1454e961c:     	movq	0x8a8(%rsi), %r9
1454e9623:     	movq	%r9, %r10
1454e9626:     	shlq	$0x11, %r10
1454e962a:     	movq	0x8b0(%rsi), %r11
1454e9631:     	xorq	%rax, %r11
1454e9634:     	xorq	%r9, %rcx
1454e9637:     	xorq	%r11, %r9
1454e963a:     	movq	%r9, 0x8a8(%rsi)
1454e9641:     	xorq	%rcx, %rax
1454e9644:     	movq	%rax, 0x8a0(%rsi)
1454e964b:     	xorq	%r10, %r11
1454e964e:     	movq	%r11, 0x8b0(%rsi)
1454e9655:     	rolq	$0x2d, %rcx
1454e9659:     	movq	%rcx, 0x8b8(%rsi)
1454e9660:     	shrq	$0x28, %r8
1454e9664:     	xorps	%xmm1, %xmm1
1454e9667:     	cvtsi2ss	%r8d, %xmm1
1454e966c:     	mulss	%xmm8, %xmm1
1454e9671:     	movss	0x47c(%rsi), %xmm3
1454e9679:     	movss	0x480(%rsi), %xmm2
1454e9681:     	mulss	%xmm0, %xmm2
1454e9685:     	movl	0x40(%r14), %r9d
1454e9689:     	movzbl	0x74(%r14), %eax
1454e968e:     	movzbl	0x129(%rsi), %r15d
1454e9696:     	movb	$0x3, 0x129(%rsi)
1454e969d:     	movups	0x20(%rsi), %xmm10
1454e96a2:     	movups	0x40(%rsi), %xmm11
1454e96a7:     	movq	$0x0, 0x20(%rsi)
1454e96af:     	movq	$0x0, 0x40(%rsi)
1454e96b7:     	ucomiss	%xmm1, %xmm3
1454e96ba:     	ja	0x1454e96bf <.text+0x54e86bf>
1454e96bc:     	movaps	%xmm0, %xmm2
1454e96bf:     	seta	0x28(%rsp)
1454e96c4:     	movb	%al, 0x20(%rsp)
1454e96c8:     	movb	$0x0, 0x30(%rsp)
1454e96cd:     	movq	%rsi, %rcx
1454e96d0:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454e96d5:     	nop
1454e96d6:     	movb	%r15b, 0x129(%rsi)
1454e96dd:     	movups	%xmm10, 0x20(%rsi)
1454e96e2:     	movups	%xmm11, 0x40(%rsi)
1454e96e7:     	cmpq	%rdi, %rbx
1454e96ea:     	jne	0x1454e95a0 <.text+0x54e85a0>
1454e96f0:     	movq	0x70(%rbp), %rdx
1454e96f4:     	testq	%rdx, %rdx
1454e96f7:     	je	0x1454e970c <.text+0x54e870c>
1454e96f9:     	shlq	$0x3, %rdx
1454e96fd:     	movl	$0x8, %r8d
1454e9703:     	movq	0x78(%rbp), %rcx
1454e9707:     	callq	0x1400021d0 <.text+0x11d0>
1454e970c:     	movaps	0x90(%rbp), %xmm6
1454e9713:     	movaps	0xa0(%rbp), %xmm7
1454e971a:     	movaps	0xb0(%rbp), %xmm8
1454e9722:     	movaps	0xc0(%rbp), %xmm9
1454e972a:     	movaps	0xd0(%rbp), %xmm10
1454e9732:     	movaps	0xe0(%rbp), %xmm11
1454e973a:     	addq	$0x178, %rsp            # imm = 0x178
1454e9741:     	popq	%rbx
1454e9742:     	popq	%rdi
1454e9743:     	popq	%rsi
1454e9744:     	popq	%r12
1454e9746:     	popq	%r13
1454e9748:     	popq	%r14
1454e974a:     	popq	%r15
1454e974c:     	popq	%rbp
1454e974d:     	retq
1454e974e:     	cmpq	$0x15, %rdi
1454e9752:     	jae	0x1454e979a <.text+0x54e879a>
1454e9754:     	movl	$0x8, %ebx
1454e9759:     	movq	0x78(%rbp), %rcx
1454e975d:     	leaq	(%rcx,%rbx), %rdx
1454e9761:     	leaq	0x60(%rbp), %r8
1454e9765:     	callq	0x1455034b0 <.text+0x55024b0>
1454e976a:     	addq	$0x8, %rbx
1454e976e:     	leaq	(,%rdi,8), %rax
1454e9776:     	cmpq	%rbx, %rax
1454e9779:     	jne	0x1454e9759 <.text+0x54e8759>
1454e977b:     	jmp	0x1454e9409 <.text+0x54e8409>
1454e9780:     	movb	$0x1, 0x87(%rbp)
1454e9787:     	leaq	0x150dc2a(%rip), %r8    # 0x1469f73b8
1454e978e:     	xorl	%ecx, %ecx
1454e9790:     	xorl	%edx, %edx
1454e9792:     	callq	0x145903b33 <.text+0x5902b33>
1454e9797:     	nop
1454e9798:     	ud2
1454e979a:     	movb	$0x1, 0x87(%rbp)
1454e97a1:     	leaq	0x30(%rbp), %r8
1454e97a5:     	movq	0x78(%rbp), %rcx
1454e97a9:     	movq	%rdi, %rdx
1454e97ac:     	callq	0x1454821e0 <.text+0x54811e0>
1454e97b1:     	nop
1454e97b2:     	jmp	0x1454e9409 <.text+0x54e8409>
