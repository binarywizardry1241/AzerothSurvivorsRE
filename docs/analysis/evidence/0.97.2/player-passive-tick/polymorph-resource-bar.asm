
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a3265:     	movq	0x7a8(%r13), %rax
1454a326c:     	testq	%rax, %rax
1454a326f:     	je	0x1454a3491 <.text+0x54a2491>
1454a3275:     	movq	0x7a0(%r13), %rcx
1454a327c:     	leaq	(%rcx,%rax,8), %rax
1454a3280:     	leaq	0x4c0(%r13), %rdx
1454a3287:     	movq	%rcx, 0xa0(%rbp)
1454a328e:     	movq	%rax, 0xa8(%rbp)
1454a3295:     	movq	%rdx, 0xb0(%rbp)
1454a329c:     	leaq	0x10(%rbp), %rax
1454a32a0:     	movq	%rax, 0xb8(%rbp)
1454a32a7:     	leaq	0x230(%rbp), %rcx
1454a32ae:     	leaq	0xa0(%rbp), %rdx
1454a32b5:     	callq	0x145532400 <.text+0x5531400>
1454a32ba:     	movq	0x230(%rbp), %rax
1454a32c1:     	movq	%rax, 0x340(%rbp)
1454a32c8:     	movq	0x238(%rbp), %rax
1454a32cf:     	movq	%rax, 0x358(%rbp)
1454a32d6:     	movq	0x240(%rbp), %rax
1454a32dd:     	testq	%rax, %rax
1454a32e0:     	je	0x1454a346f <.text+0x54a246f>
1454a32e6:     	movq	0x358(%rbp), %r14
1454a32ed:     	leaq	(%r14,%rax,8), %rbx
1454a32f1:     	jmp	0x1454a3319 <.text+0x54a2319>
1454a32f3:     	movq	%r13, %rcx
1454a32f6:     	movq	%rdi, %rdx
1454a32f9:     	movl	$0x76, %r8d
1454a32ff:     	xorl	%r9d, %r9d
1454a3302:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454a3307:     	nop
1454a3308:     	nopl	(%rax,%rax)
1454a3310:     	cmpq	%rbx, %r14
1454a3313:     	je	0x1454a346f <.text+0x54a246f>
1454a3319:     	movq	(%r14), %rdi
1454a331c:     	movq	0x7a8(%r13), %rax
1454a3323:     	testq	%rax, %rax
1454a3326:     	je	0x1454a3352 <.text+0x54a2352>
1454a3328:     	movq	0x7a0(%r13), %rcx
1454a332f:     	xorl	%r8d, %r8d
1454a3332:     	nopw	%cs:(%rax,%rax)
1454a3340:     	cmpq	%rdi, (%rcx,%r8,8)
1454a3344:     	je	0x1454a33f1 <.text+0x54a23f1>
1454a334a:     	incq	%r8
1454a334d:     	cmpq	%r8, %rax
1454a3350:     	jne	0x1454a3340 <.text+0x54a2340>
1454a3352:     	addq	$0x8, %r14
1454a3356:     	movss	0x8e4(%r13), %xmm0
1454a335f:     	movq	0x4c8(%r13), %rax
1454a3366:     	imulq	$0x160, 0x4d0(%r13), %rdx # imm = 0x160
1454a3371:     	xorl	%ecx, %ecx
1454a3373:     	movq	%rax, %r8
1454a3376:     	nopw	%cs:(%rax,%rax)
1454a3380:     	cmpq	%rcx, %rdx
1454a3383:     	je	0x1454a3310 <.text+0x54a2310>
1454a3385:     	addq	$0x160, %rcx            # imm = 0x160
1454a338c:     	cmpq	%rdi, 0x88(%r8)
1454a3393:     	leaq	0x160(%r8), %r8
1454a339a:     	jne	0x1454a3380 <.text+0x54a2380>
1454a339c:     	movl	$0x0, -0x20(%rax,%rcx)
1454a33a4:     	movss	%xmm0, -0x34(%rax,%rcx)
1454a33aa:     	movl	-0xf8(%rax,%rcx), %r8d
1454a33b2:     	movq	-0xd0(%rax,%rcx), %rdx
1454a33ba:     	testq	%rdx, %rdx
1454a33bd:     	je	0x1454a33e3 <.text+0x54a23e3>
1454a33bf:     	testl	%r8d, %r8d
1454a33c2:     	jne	0x1454a3310 <.text+0x54a2310>
1454a33c8:     	movss	-0x58(%rax,%rcx), %xmm3
1454a33ce:     	movl	0x24(%rdx), %r8d
1454a33d2:     	movq	%r13, %rcx
1454a33d5:     	movq	%rdi, %rdx
1454a33d8:     	callq	0x1454d5440 <.text+0x54d4440>
1454a33dd:     	nop
1454a33de:     	jmp	0x1454a32f3 <.text+0x54a22f3>
1454a33e3:     	testl	%r8d, %r8d
1454a33e6:     	jne	0x1454a3310 <.text+0x54a2310>
1454a33ec:     	jmp	0x1454a32f3 <.text+0x54a22f3>
1454a33f1:     	leaq	0x1(%r8), %rdx
1454a33f5:     	cmpq	%rax, %rdx
1454a33f8:     	jae	0x1454a342c <.text+0x54a242c>
1454a33fa:     	leal	(%rax,%r8), %r10d
1454a33fe:     	movq	%r8, %r9
1454a3401:     	testb	$0x1, %r10b
1454a3405:     	jne	0x1454a3420 <.text+0x54a2420>
1454a3407:     	movq	0x8(%rcx,%r8,8), %rdx
1454a340c:     	movq	%r8, %r9
1454a340f:     	cmpq	%rdi, %rdx
1454a3412:     	je	0x1454a341c <.text+0x54a241c>
1454a3414:     	movq	%rdx, (%rcx,%r8,8)
1454a3418:     	leaq	0x1(%r8), %r9
1454a341c:     	leaq	0x2(%r8), %rdx
1454a3420:     	leaq	-0x2(%rax), %r10
1454a3424:     	cmpq	%r8, %r10
1454a3427:     	movq	%r9, %r8
1454a342a:     	jne	0x1454a344c <.text+0x54a244c>
1454a342c:     	movq	%r8, 0x7a8(%r13)
1454a3433:     	jmp	0x1454a3352 <.text+0x54a2352>
1454a3438:     	nopl	(%rax,%rax)
1454a3440:     	addq	$0x2, %rdx
1454a3444:     	movq	%r9, %r8
1454a3447:     	cmpq	%rdx, %rax
1454a344a:     	je	0x1454a342c <.text+0x54a242c>
1454a344c:     	movq	(%rcx,%rdx,8), %r8
1454a3450:     	cmpq	%rdi, %r8
1454a3453:     	je	0x1454a345c <.text+0x54a245c>
1454a3455:     	movq	%r8, (%rcx,%r9,8)
1454a3459:     	incq	%r9
1454a345c:     	movq	0x8(%rcx,%rdx,8), %r8
1454a3461:     	cmpq	%rdi, %r8
1454a3464:     	je	0x1454a3440 <.text+0x54a2440>
1454a3466:     	movq	%r8, (%rcx,%r9,8)
1454a346a:     	incq	%r9
1454a346d:     	jmp	0x1454a3440 <.text+0x54a2440>
1454a346f:     	movq	0x340(%rbp), %rdx
1454a3476:     	testq	%rdx, %rdx
1454a3479:     	je	0x1454a3491 <.text+0x54a2491>
1454a347b:     	shlq	$0x3, %rdx
1454a347f:     	movl	$0x8, %r8d
1454a3485:     	movq	0x358(%rbp), %rcx
1454a348c:     	callq	0x1400021d0 <.text+0x11d0>
1454a3491:     	movss	0x8e4(%r13), %xmm8
1454a349a:     	movq	0x290(%rbp), %rax
1454a34a1:     	movups	0x3c(%rax), %xmm0
1454a34a5:     	movups	%xmm0, 0x26c(%rbp)
1454a34ac:     	movups	(%rax), %xmm0
1454a34af:     	movups	0x10(%rax), %xmm1
1454a34b3:     	movups	0x20(%rax), %xmm2
1454a34b7:     	movups	0x30(%rax), %xmm3
1454a34bb:     	movaps	%xmm3, 0x260(%rbp)
1454a34c2:     	movaps	%xmm2, 0x250(%rbp)
1454a34c9:     	movaps	%xmm1, 0x240(%rbp)
1454a34d0:     	movaps	%xmm0, 0x230(%rbp)
1454a34d7:     	movq	0x2a0(%r13), %rcx
1454a34de:     	testq	%rcx, %rcx
1454a34e1:     	je	0x1454a3884 <.text+0x54a2884>
1454a34e7:     	movq	0x298(%r13), %rax
1454a34ee:     	imulq	$0x58, %rcx, %rcx
1454a34f2:     	xorl	%edx, %edx
1454a34f4:     	jmp	0x1454a3509 <.text+0x54a2509>
1454a34f6:     	nopw	%cs:(%rax,%rax)
1454a3500:     	addq	$0x58, %rdx
1454a3504:     	cmpq	%rdx, %rcx
1454a3507:     	je	0x1454a3566 <.text+0x54a2566>
1454a3509:     	movq	(%rax,%rdx), %r8
1454a350d:     	cmpq	$0x9, 0x8(%r8)
1454a3512:     	jne	0x1454a3500 <.text+0x54a2500>
1454a3514:     	movq	(%r8), %r8
1454a3517:     	movq	(%r8), %r9
1454a351a:     	xorq	%r12, %r9
1454a351d:     	movzbl	0x8(%r8), %r8d
1454a3522:     	xorq	$0x65, %r8
1454a3526:     	orq	%r9, %r8
1454a3529:     	jne	0x1454a3500 <.text+0x54a2500>
1454a352b:     	movss	0x7c4(%r13), %xmm0
1454a3534:     	mulss	0x4558a4(%rip), %xmm0   # 0x1458f8de0
1454a353c:     	cvttss2si	%xmm0, %rax
1454a3541:     	xorl	%ecx, %ecx
1454a3543:     	xorps	%xmm1, %xmm1
1454a3546:     	ucomiss	%xmm1, %xmm0
1454a3549:     	cmovael	%eax, %ecx
1454a354c:     	ucomiss	0x447fc9(%rip), %xmm0   # 0x1458eb51c
1454a3553:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454a3559:     	cmovbel	%ecx, %r8d
1454a355d:     	movw	$0x18, %ax
1454a3561:     	jmp	0x1454a3792 <.text+0x54a2792>
1454a3566:     	xorl	%edx, %edx
1454a3568:     	movabsq	$0x7461665f6c616573, %r8 # imm = 0x7461665F6C616573
1454a3572:     	jmp	0x1454a3589 <.text+0x54a2589>
1454a3574:     	nopw	%cs:(%rax,%rax)
1454a3580:     	addq	$0x58, %rdx
1454a3584:     	cmpq	%rdx, %rcx
1454a3587:     	je	0x1454a35c2 <.text+0x54a25c2>
1454a3589:     	movq	(%rax,%rdx), %r9
1454a358d:     	cmpq	$0x9, 0x8(%r9)
1454a3592:     	jne	0x1454a3580 <.text+0x54a2580>
1454a3594:     	movq	(%r9), %r9
1454a3597:     	movq	(%r9), %r10
1454a359a:     	xorq	%r8, %r10
1454a359d:     	movzbl	0x8(%r9), %r9d
1454a35a2:     	xorq	$0x65, %r9
1454a35a6:     	orq	%r10, %r9
1454a35a9:     	jne	0x1454a3580 <.text+0x54a2580>
1454a35ab:     	movl	0x7d0(%r13), %eax
1454a35b2:     	shll	$0x2, %eax
1454a35b5:     	leal	(%rax,%rax,4), %r8d
1454a35b9:     	movw	$0x1a, %ax
1454a35bd:     	jmp	0x1454a3792 <.text+0x54a2792>
1454a35c2:     	xorl	%edx, %edx
1454a35c4:     	movabsq	$0x7269665f6c756f73, %r8 # imm = 0x7269665F6C756F73
1454a35ce:     	jmp	0x1454a35d9 <.text+0x54a25d9>
1454a35d0:     	addq	$0x58, %rdx
1454a35d4:     	cmpq	%rdx, %rcx
1454a35d7:     	je	0x1454a360e <.text+0x54a260e>
1454a35d9:     	movq	(%rax,%rdx), %r9
1454a35dd:     	cmpq	$0x9, 0x8(%r9)
1454a35e2:     	jne	0x1454a35d0 <.text+0x54a25d0>
1454a35e4:     	movq	(%r9), %r9
1454a35e7:     	movq	(%r9), %r10
1454a35ea:     	xorq	%r8, %r10
1454a35ed:     	movzbl	0x8(%r9), %r9d
1454a35f2:     	xorq	$0x65, %r9
1454a35f6:     	orq	%r10, %r9
1454a35f9:     	jne	0x1454a35d0 <.text+0x54a25d0>
1454a35fb:     	movl	0x7d8(%r13), %eax
1454a3602:     	shll	$0x2, %eax
1454a3605:     	leal	(%rax,%rax,4), %r8d
1454a3609:     	jmp	0x1454a378e <.text+0x54a278e>
1454a360e:     	xorl	%edx, %edx
1454a3610:     	movabsq	$0x6c6577746867696c, %r9 # imm = 0x6C6577746867696C
1454a361a:     	jmp	0x1454a362d <.text+0x54a262d>
1454a361c:     	nopl	(%rax)
1454a3620:     	addq	$0x58, %rdx
1454a3624:     	cmpq	%rdx, %rcx
1454a3627:     	je	0x1454a3884 <.text+0x54a2884>
1454a362d:     	movq	(%rax,%rdx), %r8
1454a3631:     	cmpq	$0x9, 0x8(%r8)
1454a3636:     	jne	0x1454a3620 <.text+0x54a2620>
1454a3638:     	movq	(%r8), %rdi
1454a363b:     	movq	(%rdi), %r10
1454a363e:     	xorq	%r9, %r10
1454a3641:     	movzbl	0x8(%rdi), %r11d
1454a3646:     	xorq	$0x6c, %r11
1454a364a:     	orq	%r10, %r11
1454a364d:     	jne	0x1454a3620 <.text+0x54a2620>
1454a364f:     	movl	0x8(%rax,%rdx), %ecx
1454a3653:     	movss	0x14(%rax,%rdx), %xmm0
1454a3659:     	movl	0x18(%rax,%rdx), %r9d
1454a365e:     	movl	0x34(%rax,%rdx), %r10d
1454a3663:     	movl	%r10d, 0xd4(%rbp)
1454a366a:     	movups	0x24(%rax,%rdx), %xmm1
1454a366f:     	movups	%xmm1, 0xc4(%rbp)
1454a3676:     	movups	0x38(%rax,%rdx), %xmm1
1454a367b:     	movups	0x44(%rax,%rdx), %xmm2
1454a3680:     	movups	%xmm1, 0xd8(%rbp)
1454a3687:     	movups	%xmm2, 0xe4(%rbp)
1454a368e:     	movq	%r8, 0xa0(%rbp)
1454a3695:     	movl	%ecx, 0xa8(%rbp)
1454a369b:     	movsd	0xc(%rax,%rdx), %xmm1
1454a36a1:     	movsd	%xmm1, 0xac(%rbp)
1454a36a9:     	movss	%xmm0, 0xb4(%rbp)
1454a36b1:     	movl	%r9d, 0xb8(%rbp)
1454a36b8:     	movsd	0x1c(%rax,%rdx), %xmm0
1454a36be:     	movsd	%xmm0, 0xbc(%rbp)
1454a36c6:     	movq	0x790(%r13), %rax
1454a36cd:     	testq	%rax, %rax
1454a36d0:     	je	0x1454a36fc <.text+0x54a26fc>
1454a36d2:     	movq	0x788(%r13), %rcx
1454a36d9:     	shlq	$0x5, %rax
1454a36dd:     	movss	-0xc(%rcx,%rax), %xmm1
1454a36e3:     	movss	-0x4(%rcx,%rax), %xmm0
1454a36e9:     	subss	%xmm8, %xmm1
1454a36ee:     	maxss	0x452f2a(%rip), %xmm0   # 0x1458f6620
1454a36f6:     	divss	%xmm0, %xmm1
1454a36fa:     	jmp	0x1454a3752 <.text+0x54a2752>
1454a36fc:     	leaq	0x720(%r13), %rbx
1454a3703:     	leaq	0xa0(%rbp), %rcx
1454a370a:     	leaq	0x230(%rbp), %rdx
1454a3711:     	callq	0x14541b9d0 <.text+0x541a9d0>
1454a3716:     	movaps	%xmm0, %xmm7
1454a3719:     	testb	$0x1, %al
1454a371b:     	jne	0x1454a3725 <.text+0x54a2725>
1454a371d:     	movss	0x45587b(%rip), %xmm7   # 0x1458f8fa0
1454a3725:     	movl	$0x9, %r8d
1454a372b:     	movq	%rbx, %rcx
1454a372e:     	movq	%rdi, %rdx
1454a3731:     	callq	0x145413960 <.text+0x5412960>
1454a3736:     	subss	%xmm8, %xmm0
1454a373b:     	xorps	%xmm1, %xmm1
1454a373e:     	maxss	%xmm1, %xmm0
1454a3742:     	divss	%xmm7, %xmm0
1454a3746:     	movss	0x447d32(%rip), %xmm1   # 0x1458eb480
1454a374e:     	subss	%xmm0, %xmm1
1454a3752:     	xorps	%xmm0, %xmm0
1454a3755:     	maxss	%xmm1, %xmm0
1454a3759:     	movss	0x447d1f(%rip), %xmm1   # 0x1458eb480
1454a3761:     	minss	%xmm0, %xmm1
1454a3765:     	mulss	0x447dbf(%rip), %xmm1   # 0x1458eb52c
1454a376d:     	xorps	%xmm0, %xmm0
1454a3770:     	cvttss2si	%xmm1, %rax
1454a3775:     	xorl	%ecx, %ecx
1454a3777:     	ucomiss	%xmm0, %xmm1
1454a377a:     	cmovael	%eax, %ecx
1454a377d:     	ucomiss	0x447d98(%rip), %xmm1   # 0x1458eb51c
1454a3784:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454a378a:     	cmovbel	%ecx, %r8d
1454a378e:     	movw	$0x17, %ax
1454a3792:     	cmpl	$0x1, 0x7b8(%r13)
1454a379a:     	jne	0x1454a37b3 <.text+0x54a27b3>
1454a379c:     	cmpw	%ax, 0x7bc(%r13)
1454a37a4:     	jne	0x1454a37b3 <.text+0x54a27b3>
1454a37a6:     	cmpl	%r8d, 0x7c0(%r13)
1454a37ad:     	je	0x1454a3884 <.text+0x54a2884>
1454a37b3:     	movl	$0x1, 0x7b8(%r13)
1454a37be:     	movw	%ax, 0x7bc(%r13)
1454a37c6:     	movl	%r8d, 0x7c0(%r13)
1454a37cd:     	movq	0x8b8(%r13), %rcx
1454a37d4:     	testq	%rcx, %rcx
1454a37d7:     	je	0x1454a383e <.text+0x54a283e>
1454a37d9:     	movq	0x8c0(%r13), %r9
1454a37e0:     	movzwl	0x36(%rcx), %r10d
1454a37e5:     	movl	%r10d, %r11d
1454a37e8:     	addl	%r11d, %r11d
1454a37eb:     	movq	$-0x1, %rdx
1454a37f2:     	nopw	%cs:(%rax,%rax)
1454a3800:     	testq	%r11, %r11
1454a3803:     	je	0x1454a3827 <.text+0x54a2827>
1454a3805:     	cmpw	0x3a(%rcx,%rdx,2), %ax
1454a380a:     	seta	%bl
1454a380d:     	sbbb	$0x0, %bl
1454a3810:     	incq	%rdx
1454a3813:     	addq	$-0x2, %r11
1454a3817:     	cmpb	$0x1, %bl
1454a381a:     	je	0x1454a3800 <.text+0x54a2800>
1454a381c:     	movzbl	%bl, %r10d
1454a3820:     	testl	%r10d, %r10d
1454a3823:     	jne	0x1454a382a <.text+0x54a282a>
1454a3825:     	jmp	0x1454a3837 <.text+0x54a2837>
1454a3827:     	movq	%r10, %rdx
1454a382a:     	subq	$0x1, %r9
1454a382e:     	jb	0x1454a3840 <.text+0x54a2840>
1454a3830:     	movq	0x50(%rcx,%rdx,8), %rcx
1454a3835:     	jmp	0x1454a37e0 <.text+0x54a27e0>
1454a3837:     	movl	%r8d, 0x8(%rcx,%rdx,4)
1454a383c:     	jmp	0x1454a3884 <.text+0x54a2884>
1454a383e:     	xorl	%ecx, %ecx
1454a3840:     	leaq	0x8b8(%r13), %r9
1454a3847:     	movzwl	%ax, %eax
1454a384a:     	movq	%r9, 0xa0(%rbp)
1454a3851:     	movq	%rcx, 0xa8(%rbp)
1454a3858:     	movq	$0x0, 0xb0(%rbp)
1454a3863:     	movq	%rdx, 0xb8(%rbp)
1454a386a:     	movq	%rax, 0xc0(%rbp)
1454a3871:     	leaq	0x2d8(%rbp), %rcx
1454a3878:     	leaq	0xa0(%rbp), %rdx
1454a387f:     	callq	0x145427a50 <.text+0x5426a50>
