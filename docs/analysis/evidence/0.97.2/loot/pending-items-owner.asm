
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d2380:     	pushq	%rbp
1454d2381:     	pushq	%r15
1454d2383:     	pushq	%r14
1454d2385:     	pushq	%r13
1454d2387:     	pushq	%r12
1454d2389:     	pushq	%rsi
1454d238a:     	pushq	%rdi
1454d238b:     	pushq	%rbx
1454d238c:     	subq	$0x128, %rsp            # imm = 0x128
1454d2393:     	leaq	0x80(%rsp), %rbp
1454d239b:     	movaps	%xmm11, 0x90(%rbp)
1454d23a3:     	movaps	%xmm10, 0x80(%rbp)
1454d23ab:     	movaps	%xmm9, 0x70(%rbp)
1454d23b0:     	movaps	%xmm8, 0x60(%rbp)
1454d23b5:     	movaps	%xmm7, 0x50(%rbp)
1454d23b9:     	movaps	%xmm6, 0x40(%rbp)
1454d23bd:     	movq	$-0x2, 0x38(%rbp)
1454d23c5:     	movq	%rcx, %rsi
1454d23c8:     	movsd	0x3e8(%rcx), %xmm6
1454d23d0:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
1454d23d4:     	movl	0x3f0(%rcx), %eax
1454d23da:     	movl	%eax, 0x2c(%rbp)
1454d23dd:     	movss	0x8e4(%rcx), %xmm8
1454d23e6:     	movq	$0x0, 0x10(%rbp)
1454d23ee:     	movq	$0x8, 0x18(%rbp)
1454d23f6:     	movq	$0x0, 0x20(%rbp)
1454d23fe:     	movq	0x528(%rcx), %rbx
1454d2405:     	movq	0x530(%rcx), %rax
1454d240c:     	leaq	(%rax,%rax,8), %rax
1454d2410:     	leaq	(%rbx,%rax,8), %rax
1454d2414:     	xorl	%r14d, %r14d
1454d2417:     	movss	0x424260(%rip), %xmm9   # 0x1458f6680
1454d2420:     	movss	0x4190ff(%rip), %xmm10  # 0x1458eb528
1454d2429:     	leaq	0x10(%rbp), %rdi
1454d242d:     	movq	%rax, (%rbp)
1454d2431:     	nopw	%cs:(%rax,%rax)
1454d2440:     	addq	$0x48, %rbx
1454d2444:     	leaq	-0x48(%rbx), %rcx
1454d2448:     	cmpq	%rax, %rcx
1454d244b:     	je	0x1454d24fb <.text+0x54d14fb>
1454d2451:     	cmpl	$0x0, 0x20(%rcx)
1454d2455:     	jne	0x1454d2440 <.text+0x54d1440>
1454d2457:     	cmpl	$0x0, -0x30(%rbx)
1454d245b:     	jne	0x1454d2440 <.text+0x54d1440>
1454d245d:     	movq	%rcx, 0x8(%rbp)
1454d2461:     	movss	-0x14(%rbx), %xmm0
1454d2466:     	movss	-0x10(%rbx), %xmm1
1454d246b:     	subss	%xmm6, %xmm0
1454d246f:     	subss	%xmm7, %xmm1
1454d2473:     	mulss	%xmm0, %xmm0
1454d2477:     	mulss	%xmm1, %xmm1
1454d247b:     	addss	%xmm0, %xmm1
1454d247f:     	xorps	%xmm11, %xmm11
1454d2483:     	sqrtss	%xmm1, %xmm11
1454d2488:     	divss	%xmm9, %xmm11
1454d248d:     	maxss	%xmm10, %xmm11
1454d2492:     	movaps	%xmm8, %xmm0
1454d2496:     	addss	%xmm11, %xmm0
1454d249b:     	movl	$0x1, -0x30(%rbx)
1454d24a2:     	movss	%xmm0, -0x2c(%rbx)
1454d24a7:     	movq	-0x20(%rbx), %r15
1454d24ab:     	movq	-0x14(%rbx), %rax
1454d24af:     	movl	-0xc(%rbx), %ecx
1454d24b2:     	movl	%ecx, -0x20(%rbp)
1454d24b5:     	movq	%rax, -0x28(%rbp)
1454d24b9:     	cmpq	0x10(%rbp), %r14
1454d24bd:     	jne	0x1454d24c8 <.text+0x54d14c8>
1454d24bf:     	movq	%rdi, %rcx
1454d24c2:     	callq	0x145757f60 <.text+0x5756f60>
1454d24c7:     	nop
1454d24c8:     	movq	0x18(%rbp), %rax
1454d24cc:     	leaq	(%r14,%r14,2), %rcx
1454d24d0:     	movq	%r15, (%rax,%rcx,8)
1454d24d4:     	movq	-0x28(%rbp), %rdx
1454d24d8:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454d24dd:     	movl	-0x20(%rbp), %edx
1454d24e0:     	movl	%edx, 0x10(%rax,%rcx,8)
1454d24e4:     	movss	%xmm11, 0x14(%rax,%rcx,8)
1454d24eb:     	incq	%r14
1454d24ee:     	movq	%r14, 0x20(%rbp)
1454d24f2:     	movq	(%rbp), %rax
1454d24f6:     	jmp	0x1454d2440 <.text+0x54d1440>
1454d24fb:     	movq	%rcx, 0x8(%rbp)
1454d24ff:     	movq	0x10(%rbp), %rax
1454d2503:     	movq	%rax, 0x30(%rbp)
1454d2507:     	movq	0x18(%rbp), %rdi
1454d250b:     	leaq	(%r14,%r14,2), %rax
1454d250f:     	leaq	(%rdi,%rax,8), %r13
1454d2513:     	movss	0x45e9f5(%rip), %xmm7   # 0x145930f10
1454d251b:     	xorps	%xmm8, %xmm8
1454d251f:     	movss	0x418ff4(%rip), %xmm9   # 0x1458eb51c
1454d2528:     	leaq	-0x28(%rbp), %rbx
1454d252c:     	leaq	-0x38(%rbp), %r14
1454d2530:     	leaq	-0x48(%rbp), %r15
1454d2534:     	movq	%rdi, -0x8(%rbp)
1454d2538:     	jmp	0x1454d256d <.text+0x54d156d>
1454d253a:     	nopw	(%rax,%rax)
1454d2540:     	addq	$0x18, %rdi
1454d2544:     	movq	0x540(%rsi), %rax
1454d254b:     	movq	%r12, %rcx
1454d254e:     	shlq	$0x5, %rcx
1454d2552:     	movups	-0x28(%rbp), %xmm0
1454d2556:     	movups	-0x18(%rbp), %xmm1
1454d255a:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d255f:     	movups	%xmm0, (%rax,%rcx)
1454d2563:     	incq	%r12
1454d2566:     	movq	%r12, 0x548(%rsi)
1454d256d:     	cmpq	%r13, %rdi
1454d2570:     	je	0x1454d2608 <.text+0x54d1608>
1454d2576:     	movq	(%rdi), %rdx
1454d2579:     	movl	0x10(%rdi), %eax
1454d257c:     	movl	%eax, -0x30(%rbp)
1454d257f:     	movq	0x8(%rdi), %rax
1454d2583:     	movq	%rax, -0x38(%rbp)
1454d2587:     	movss	0x14(%rdi), %xmm0
1454d258c:     	movl	0x908(%rsi), %eax
1454d2592:     	incl	%eax
1454d2594:     	mulss	%xmm7, %xmm0
1454d2598:     	cvttss2si	%xmm0, %rcx
1454d259d:     	ucomiss	%xmm8, %xmm0
1454d25a1:     	movl	$0x0, %r8d
1454d25a7:     	cmovbl	%r8d, %ecx
1454d25ab:     	movl	%eax, 0x908(%rsi)
1454d25b1:     	ucomiss	%xmm9, %xmm0
1454d25b5:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454d25bb:     	ja	0x1454d25c0 <.text+0x54d15c0>
1454d25bd:     	movl	%ecx, %r8d
1454d25c0:     	movlps	%xmm6, -0x48(%rbp)
1454d25c4:     	movl	0x2c(%rbp), %ecx
1454d25c7:     	movl	%ecx, -0x40(%rbp)
1454d25ca:     	movl	%r8d, 0x28(%rsp)
1454d25cf:     	movl	%eax, 0x20(%rsp)
1454d25d3:     	movq	%rbx, %rcx
1454d25d6:     	movq	%r14, %r8
1454d25d9:     	movq	%r15, %r9
1454d25dc:     	callq	0x145440d40 <.text+0x543fd40>
1454d25e1:     	nop
1454d25e2:     	movq	0x548(%rsi), %r12
1454d25e9:     	cmpq	0x538(%rsi), %r12
1454d25f0:     	jne	0x1454d2540 <.text+0x54d1540>
1454d25f6:     	leaq	0x538(%rsi), %rcx
1454d25fd:     	callq	0x1457580b0 <.text+0x57570b0>
1454d2602:     	nop
1454d2603:     	jmp	0x1454d2540 <.text+0x54d1540>
1454d2608:     	movq	0x30(%rbp), %rax
1454d260c:     	testq	%rax, %rax
1454d260f:     	je	0x1454d2628 <.text+0x54d1628>
1454d2611:     	shlq	$0x3, %rax
1454d2615:     	leaq	(%rax,%rax,2), %rdx
1454d2619:     	movl	$0x8, %r8d
1454d261f:     	movq	-0x8(%rbp), %rcx
1454d2623:     	callq	0x1400021d0 <.text+0x11d0>
1454d2628:     	movaps	0x40(%rbp), %xmm6
1454d262c:     	movaps	0x50(%rbp), %xmm7
1454d2630:     	movaps	0x60(%rbp), %xmm8
1454d2635:     	movaps	0x70(%rbp), %xmm9
1454d263a:     	movaps	0x80(%rbp), %xmm10
1454d2642:     	movaps	0x90(%rbp), %xmm11
1454d264a:     	addq	$0x128, %rsp            # imm = 0x128
1454d2651:     	popq	%rbx
1454d2652:     	popq	%rdi
1454d2653:     	popq	%rsi
1454d2654:     	popq	%r12
1454d2656:     	popq	%r13
1454d2658:     	popq	%r14
1454d265a:     	popq	%r15
1454d265c:     	popq	%rbp
1454d265d:     	retq
