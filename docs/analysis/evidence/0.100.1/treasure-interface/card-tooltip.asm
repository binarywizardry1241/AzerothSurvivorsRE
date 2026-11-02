
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401f3210:     	pushq	%rbp
1401f3211:     	pushq	%r15
1401f3213:     	pushq	%r14
1401f3215:     	pushq	%r13
1401f3217:     	pushq	%r12
1401f3219:     	pushq	%rsi
1401f321a:     	pushq	%rdi
1401f321b:     	pushq	%rbx
1401f321c:     	subq	$0x358, %rsp            # imm = 0x358
1401f3223:     	leaq	0x80(%rsp), %rbp
1401f322b:     	movaps	%xmm6, 0x2c0(%rbp)
1401f3232:     	movq	$-0x2, 0x2b8(%rbp)
1401f323d:     	movq	%r8, %rbx
1401f3240:     	movq	%rdx, %rsi
1401f3243:     	movq	%rcx, %rdi
1401f3246:     	leaq	0x230(%rbp), %rcx
1401f324d:     	movq	%r8, %rdx
1401f3250:     	callq	0x145728850 <.text+0x5727850>
1401f3255:     	cmpq	$-0x1, 0x48(%rbx)
1401f325a:     	je	0x1401f3282 <.text+0x1f2282>
1401f325c:     	leaq	0x48(%rbx), %rdx
1401f3260:     	movb	$0x1, 0x2b6(%rbp)
1401f3267:     	leaq	0x10(%rbp), %rcx
1401f326b:     	callq	0x145728850 <.text+0x5727850>
1401f3270:     	nop
1401f3271:     	movq	0x10(%rbp), %rax
1401f3275:     	movups	0x18(%rbp), %xmm0
1401f3279:     	movaps	%xmm0, 0x290(%rbp)
1401f3280:     	jmp	0x1401f3289 <.text+0x1f2289>
1401f3282:     	movq	$-0x1, %rax
1401f3289:     	movq	%rdi, 0x28(%rbp)
1401f328d:     	movl	$0x41800000, 0x30(%rbp) # imm = 0x41800000
1401f3294:     	movups	0x230(%rbp), %xmm0
1401f329b:     	movaps	%xmm0, 0x10(%rbp)
1401f329f:     	movq	0x240(%rbp), %rcx
1401f32a6:     	movq	%rcx, 0x20(%rbp)
1401f32aa:     	leaq	0x38(%rbp), %r14
1401f32ae:     	movq	%rax, 0x38(%rbp)
1401f32b2:     	movaps	0x290(%rbp), %xmm0
1401f32b9:     	movaps	%xmm0, 0x40(%rbp)
1401f32bd:     	movb	$0x0, 0x2b6(%rbp)
1401f32c4:     	movq	%r14, 0x20(%rsp)
1401f32c9:     	movss	0x574c73f(%rip), %xmm2  # 0x14593fa10
1401f32d1:     	leaq	0x10(%rbp), %r9
1401f32d5:     	movq	%rsi, %rcx
1401f32d8:     	movq	%rdi, %rdx
1401f32db:     	callq	0x1401f10b0 <.text+0x1f00b0>
1401f32e0:     	nop
1401f32e1:     	cmpq	$-0x1, 0x60(%rbx)
1401f32e6:     	je	0x1401f333d <.text+0x1f233d>
1401f32e8:     	leaq	0x60(%rbx), %rdx
1401f32ec:     	leaq	0x230(%rbp), %rcx
1401f32f3:     	callq	0x145728850 <.text+0x5727850>
1401f32f8:     	movq	0x230(%rbp), %rax
1401f32ff:     	movups	0x238(%rbp), %xmm0
1401f3306:     	movups	%xmm0, 0x18(%rbp)
1401f330a:     	movq	%rdi, 0x28(%rbp)
1401f330e:     	movl	$0x41500000, 0x30(%rbp) # imm = 0x41500000
1401f3315:     	movq	%rax, 0x10(%rbp)
1401f3319:     	movq	$-0x1, 0x38(%rbp)
1401f3321:     	movq	%r14, 0x20(%rsp)
1401f3326:     	movss	0x5757ea2(%rip), %xmm2  # 0x14594b1d0
1401f332e:     	leaq	0x10(%rbp), %r9
1401f3332:     	movq	%rsi, %rcx
1401f3335:     	movq	%rdi, %rdx
1401f3338:     	callq	0x1401f10b0 <.text+0x1f00b0>
1401f333d:     	movq	0x78(%rbx), %rax
1401f3341:     	movq	0x90(%rbx), %r15
1401f3348:     	movq	%rax, %rcx
1401f334b:     	andq	%r15, %rcx
1401f334e:     	cmpq	$-0x1, %rcx
1401f3352:     	je	0x1401f3409 <.text+0x1f2409>
1401f3358:     	cmpq	$-0x1, %rax
1401f335c:     	je	0x1401f339d <.text+0x1f239d>
1401f335e:     	leaq	0x78(%rbx), %rdx
1401f3362:     	leaq	0x230(%rbp), %rcx
1401f3369:     	callq	0x145728850 <.text+0x5727850>
1401f336e:     	cmpq	$-0x1, %r15
1401f3372:     	je	0x1401f33ae <.text+0x1f23ae>
1401f3374:     	leaq	0x90(%rbx), %rdx
1401f337b:     	movb	$0x1, 0x2b5(%rbp)
1401f3382:     	leaq	0x10(%rbp), %rcx
1401f3386:     	callq	0x145728850 <.text+0x5727850>
1401f338b:     	nop
1401f338c:     	movq	0x10(%rbp), %rax
1401f3390:     	movups	0x18(%rbp), %xmm0
1401f3394:     	movaps	%xmm0, 0x290(%rbp)
1401f339b:     	jmp	0x1401f33b5 <.text+0x1f23b5>
1401f339d:     	movq	$-0x1, 0x230(%rbp)
1401f33a8:     	cmpq	$-0x1, %r15
1401f33ac:     	jne	0x1401f3374 <.text+0x1f2374>
1401f33ae:     	movq	$-0x1, %rax
1401f33b5:     	movq	%rdi, 0x28(%rbp)
1401f33b9:     	movl	$0x41500000, 0x30(%rbp) # imm = 0x41500000
1401f33c0:     	movups	0x230(%rbp), %xmm0
1401f33c7:     	movaps	%xmm0, 0x10(%rbp)
1401f33cb:     	movq	0x240(%rbp), %rcx
1401f33d2:     	movq	%rcx, 0x20(%rbp)
1401f33d6:     	movq	%rax, 0x38(%rbp)
1401f33da:     	movaps	0x290(%rbp), %xmm0
1401f33e1:     	movaps	%xmm0, 0x40(%rbp)
1401f33e5:     	movb	$0x0, 0x2b5(%rbp)
1401f33ec:     	movq	%r14, 0x20(%rsp)
1401f33f1:     	movss	0x5757dd7(%rip), %xmm2  # 0x14594b1d0
1401f33f9:     	leaq	0x10(%rbp), %r9
1401f33fd:     	movq	%rsi, %rcx
1401f3400:     	movq	%rdi, %rdx
1401f3403:     	callq	0x1401f10b0 <.text+0x1f00b0>
1401f3408:     	nop
1401f3409:     	movq	0x28(%rbx), %r12
1401f340d:     	testq	%r12, %r12
1401f3410:     	je	0x1401f3cb9 <.text+0x1f2cb9>
1401f3416:     	movq	0x20(%rbx), %rbx
1401f341a:     	movl	$0x41500000, 0x274(%rbp) # imm = 0x41500000
1401f3424:     	movq	$0x0, 0x290(%rbp)
1401f342f:     	movq	$0x8, 0x298(%rbp)
1401f343a:     	movq	$0x0, 0x2a0(%rbp)
1401f3445:     	movups	0x57592a8(%rip), %xmm6  # 0x14594c6f4
1401f344c:     	movaps	%xmm6, 0x260(%rbp)
1401f3453:     	testq	%r12, %r12
1401f3456:     	je	0x1401f39a7 <.text+0x1f29a7>
1401f345c:     	xorl	%r14d, %r14d
1401f345f:     	jmp	0x1401f347c <.text+0x1f247c>
1401f3461:     	nopw	%cs:(%rax,%rax)
1401f3470:     	movq	%rax, %r14
1401f3473:     	cmpq	%r12, %rax
1401f3476:     	ja	0x1401f3530 <.text+0x1f2530>
1401f347c:     	movq	%r12, %r8
1401f347f:     	subq	%r14, %r8
1401f3482:     	leaq	(%rbx,%r14), %rdx
1401f3486:     	cmpq	$0x10, %r8
1401f348a:     	jae	0x1401f34c0 <.text+0x1f24c0>
1401f348c:     	xorl	%r13d, %r13d
1401f348f:     	testq	%r8, %r8
1401f3492:     	je	0x1401f34b2 <.text+0x1f24b2>
1401f3494:     	nopw	%cs:(%rax,%rax)
1401f34a0:     	cmpb	$0x7c, (%rdx,%r13)
1401f34a5:     	je	0x1401f34da <.text+0x1f24da>
1401f34a7:     	incq	%r13
1401f34aa:     	cmpq	%r13, %r8
1401f34ad:     	jne	0x1401f34a0 <.text+0x1f24a0>
1401f34af:     	movq	%r8, %r13
1401f34b2:     	xorl	%eax, %eax
1401f34b4:     	cmpq	$0x1, %rax
1401f34b8:     	je	0x1401f34f0 <.text+0x1f24f0>
1401f34ba:     	jmp	0x1401f3530 <.text+0x1f2530>
1401f34bc:     	nopl	(%rax)
1401f34c0:     	movb	$0x1, 0x2b7(%rbp)
1401f34c7:     	movb	$0x7c, %cl
1401f34c9:     	callq	0x1457311c0 <.text+0x57301c0>
1401f34ce:     	nop
1401f34cf:     	movq	%rdx, %r13
1401f34d2:     	cmpq	$0x1, %rax
1401f34d6:     	je	0x1401f34f0 <.text+0x1f24f0>
1401f34d8:     	jmp	0x1401f3530 <.text+0x1f2530>
1401f34da:     	movl	$0x1, %eax
1401f34df:     	cmpq	$0x1, %rax
1401f34e3:     	jne	0x1401f3530 <.text+0x1f2530>
1401f34e5:     	nopw	%cs:(%rax,%rax)
1401f34f0:     	leaq	(%r14,%r13), %rax
1401f34f4:     	incq	%rax
1401f34f7:     	addq	%r14, %r13
1401f34fa:     	cmpq	%r12, %r13
1401f34fd:     	jae	0x1401f3470 <.text+0x1f2470>
1401f3503:     	movzbl	(%rbx,%r13), %ecx
1401f3508:     	cmpq	%r12, %rax
1401f350b:     	ja	0x1401f3519 <.text+0x1f2519>
1401f350d:     	movq	%rax, %r14
1401f3510:     	cmpb	$0x7c, %cl
1401f3513:     	jne	0x1401f347c <.text+0x1f247c>
1401f3519:     	cmpb	$0x7c, %cl
1401f351c:     	je	0x1401f3533 <.text+0x1f2533>
1401f351e:     	movaps	0x260(%rbp), %xmm0
1401f3525:     	movaps	%xmm0, 0x10(%rbp)
1401f3529:     	jmp	0x1401f3586 <.text+0x1f2586>
1401f352b:     	nopl	(%rax,%rax)
1401f3530:     	movq	%r12, %r13
1401f3533:     	testq	%r13, %r13
1401f3536:     	je	0x1401f3570 <.text+0x1f2570>
1401f3538:     	movaps	0x260(%rbp), %xmm0
1401f353f:     	movaps	%xmm0, 0x10(%rbp)
1401f3543:     	cmpq	%r12, %r13
1401f3546:     	jae	0x1401f3580 <.text+0x1f2580>
1401f3548:     	movb	$0x1, %r15b
1401f354b:     	cmpb	$-0x41, (%rbx,%r13)
1401f3550:     	jle	0x1401f3d04 <.text+0x1f2d04>
1401f3556:     	testq	%r13, %r13
1401f3559:     	js	0x1401f3988 <.text+0x1f2988>
1401f355f:     	jmp	0x1401f3595 <.text+0x1f2595>
1401f3561:     	nopw	%cs:(%rax,%rax)
1401f3570:     	xorl	%r8d, %r8d
1401f3573:     	jmp	0x1401f3660 <.text+0x1f2660>
1401f3578:     	nopl	(%rax,%rax)
1401f3580:     	jne	0x1401f3d04 <.text+0x1f2d04>
1401f3586:     	xorl	%r15d, %r15d
1401f3589:     	movq	%r12, %r13
1401f358c:     	testq	%r13, %r13
1401f358f:     	js	0x1401f3988 <.text+0x1f2988>
1401f3595:     	callq	0x140002200 <.text+0x1200>
1401f359a:     	movl	$0x1, %r14d
1401f35a0:     	movl	$0x1, %edx
1401f35a5:     	movq	%r13, %rcx
1401f35a8:     	callq	0x1400021c0 <.text+0x11c0>
1401f35ad:     	testq	%rax, %rax
1401f35b0:     	je	0x1401f3d52 <.text+0x1f2d52>
1401f35b6:     	movq	%rax, 0x280(%rbp)
1401f35bd:     	movq	%rax, %rcx
1401f35c0:     	movq	%rbx, %rdx
1401f35c3:     	movq	%r13, 0x288(%rbp)
1401f35ca:     	movq	%r13, %r8
1401f35cd:     	callq	0x1457731ed <.text+0x57721ed>
1401f35d2:     	movaps	0x10(%rbp), %xmm0
1401f35d6:     	movaps	%xmm0, 0x230(%rbp)
1401f35dd:     	movq	0x2a0(%rbp), %r14
1401f35e4:     	cmpq	0x290(%rbp), %r14
1401f35eb:     	jne	0x1401f35fa <.text+0x1f25fa>
1401f35ed:     	leaq	0x290(%rbp), %rcx
1401f35f4:     	callq	0x1457747f0 <.text+0x57737f0>
1401f35f9:     	nop
1401f35fa:     	movq	0x298(%rbp), %rax
1401f3601:     	leaq	(%r14,%r14,2), %rcx
1401f3605:     	shlq	$0x4, %rcx
1401f3609:     	movl	$0x0, (%rax,%rcx)
1401f3610:     	movaps	0x230(%rbp), %xmm0
1401f3617:     	movups	%xmm0, 0x4(%rax,%rcx)
1401f361c:     	movq	0x288(%rbp), %r8
1401f3623:     	movq	%r8, 0x18(%rax,%rcx)
1401f3628:     	movq	0x280(%rbp), %rdx
1401f362f:     	movq	%rdx, 0x20(%rax,%rcx)
1401f3634:     	movq	%r8, 0x28(%rax,%rcx)
1401f3639:     	incq	%r14
1401f363c:     	movq	%r14, 0x2a0(%rbp)
1401f3643:     	testb	%r15b, %r15b
1401f3646:     	je	0x1401f3654 <.text+0x1f2654>
1401f3648:     	cmpb	$-0x41, (%rbx,%r8)
1401f364d:     	jg	0x1401f3660 <.text+0x1f2660>
1401f364f:     	jmp	0x1401f3d2e <.text+0x1f2d2e>
1401f3654:     	cmpq	%r12, %r8
1401f3657:     	jne	0x1401f3d2e <.text+0x1f2d2e>
1401f365d:     	movq	%r12, %r8
1401f3660:     	movq	%r12, %r13
1401f3663:     	subq	%r8, %r13
1401f3666:     	addq	%r8, %rbx
1401f3669:     	cmpq	$0x2, %r13
1401f366d:     	jb	0x1401f3685 <.text+0x1f2685>
1401f366f:     	cmpw	$0x727c, (%rbx)         # imm = 0x727C
1401f3674:     	je	0x1401f3740 <.text+0x1f2740>
1401f367a:     	cmpw	$0x637c, (%rbx)         # imm = 0x637C
1401f367f:     	je	0x1401f3757 <.text+0x1f2757>
1401f3685:     	cmpq	%r8, %r12
1401f3688:     	movl	$0x0, %r12d
1401f368e:     	je	0x1401f3453 <.text+0x1f2453>
1401f3694:     	callq	0x140002200 <.text+0x1200>
1401f3699:     	movl	$0x1, %ecx
1401f369e:     	movl	$0x1, %edx
1401f36a3:     	callq	0x1400021c0 <.text+0x11c0>
1401f36a8:     	testq	%rax, %rax
1401f36ab:     	je	0x1401f3d5e <.text+0x1f2d5e>
1401f36b1:     	movq	%rax, 0x288(%rbp)
1401f36b8:     	movb	$0x7c, (%rax)
1401f36bb:     	movq	0x2a0(%rbp), %r14
1401f36c2:     	cmpq	0x290(%rbp), %r14
1401f36c9:     	jne	0x1401f36d8 <.text+0x1f26d8>
1401f36cb:     	leaq	0x290(%rbp), %rcx
1401f36d2:     	callq	0x1457747f0 <.text+0x57737f0>
1401f36d7:     	nop
1401f36d8:     	movq	0x298(%rbp), %rax
1401f36df:     	leaq	(%r14,%r14,2), %rcx
1401f36e3:     	shlq	$0x4, %rcx
1401f36e7:     	movl	$0x0, (%rax,%rcx)
1401f36ee:     	movaps	0x260(%rbp), %xmm0
1401f36f5:     	movups	%xmm0, 0x4(%rax,%rcx)
1401f36fa:     	movq	$0x1, 0x18(%rax,%rcx)
1401f3703:     	movq	0x288(%rbp), %rdx
1401f370a:     	movq	%rdx, 0x20(%rax,%rcx)
1401f370f:     	movq	$0x1, 0x28(%rax,%rcx)
1401f3718:     	incq	%r14
1401f371b:     	movq	%r14, 0x2a0(%rbp)
1401f3722:     	cmpq	$0x2, %r13
1401f3726:     	jb	0x1401f3732 <.text+0x1f2732>
1401f3728:     	cmpb	$-0x40, 0x1(%rbx)
1401f372c:     	jl	0x1401f3d77 <.text+0x1f2d77>
1401f3732:     	decq	%r13
1401f3735:     	incq	%rbx
1401f3738:     	movq	%r13, %r12
1401f373b:     	jmp	0x1401f3453 <.text+0x1f2453>
1401f3740:     	addq	$-0x2, %r13
1401f3744:     	addq	$0x2, %rbx
1401f3748:     	movaps	%xmm6, 0x260(%rbp)
1401f374f:     	movq	%r13, %r12
1401f3752:     	jmp	0x1401f3453 <.text+0x1f2453>
1401f3757:     	leaq	-0x2(%r13), %r15
1401f375b:     	cmpq	$0x8, %r15
1401f375f:     	jbe	0x1401f376d <.text+0x1f276d>
1401f3761:     	cmpb	$-0x40, 0xa(%rbx)
1401f3765:     	jl	0x1401f3685 <.text+0x1f2685>
1401f376b:     	jmp	0x1401f3773 <.text+0x1f2773>
1401f376d:     	jne	0x1401f3685 <.text+0x1f2685>
1401f3773:     	leaq	0x2(%rbx), %r14
1401f3777:     	xorl	%eax, %eax
1401f3779:     	nopl	(%rax)
1401f3780:     	cmpq	$0x8, %rax
1401f3784:     	je	0x1401f3854 <.text+0x1f2854>
1401f378a:     	movzbl	(%r14,%rax), %r10d
1401f378f:     	movzbl	%r10b, %ecx
1401f3793:     	testb	%cl, %cl
1401f3795:     	js	0x1401f37b0 <.text+0x1f27b0>
1401f3797:     	incq	%rax
1401f379a:     	leal	-0x3a(%rcx), %edx
1401f379d:     	cmpl	$-0xb, %edx
1401f37a0:     	jbe	0x1401f3840 <.text+0x1f2840>
1401f37a6:     	jmp	0x1401f3780 <.text+0x1f2780>
1401f37a8:     	nopl	(%rax,%rax)
1401f37b0:     	movl	%ecx, %edx
1401f37b2:     	andl	$0x1f, %edx
1401f37b5:     	movzbl	0x1(%r14,%rax), %r9d
1401f37bb:     	andl	$0x3f, %r9d
1401f37bf:     	cmpb	$-0x21, %cl
1401f37c2:     	jbe	0x1401f3807 <.text+0x1f2807>
1401f37c4:     	movzbl	0x2(%r14,%rax), %ecx
1401f37ca:     	shll	$0x6, %r9d
1401f37ce:     	andl	$0x3f, %ecx
1401f37d1:     	orl	%r9d, %ecx
1401f37d4:     	cmpb	$-0x10, %r10b
1401f37d8:     	jb	0x1401f3820 <.text+0x1f2820>
1401f37da:     	movzbl	0x3(%r14,%rax), %r9d
1401f37e0:     	addq	$0x4, %rax
1401f37e4:     	andl	$0x7, %edx
1401f37e7:     	shll	$0x12, %edx
1401f37ea:     	shll	$0x6, %ecx
1401f37ed:     	andl	$0x3f, %r9d
1401f37f1:     	orl	%ecx, %r9d
1401f37f4:     	orl	%edx, %r9d
1401f37f7:     	movl	%r9d, %ecx
1401f37fa:     	leal	-0x3a(%rcx), %edx
1401f37fd:     	cmpl	$-0xb, %edx
1401f3800:     	jbe	0x1401f3840 <.text+0x1f2840>
1401f3802:     	jmp	0x1401f3780 <.text+0x1f2780>
1401f3807:     	addq	$0x2, %rax
1401f380b:     	shll	$0x6, %edx
1401f380e:     	orl	%r9d, %edx
1401f3811:     	movl	%edx, %ecx
1401f3813:     	leal	-0x3a(%rcx), %edx
1401f3816:     	cmpl	$-0xb, %edx
1401f3819:     	jbe	0x1401f3840 <.text+0x1f2840>
1401f381b:     	jmp	0x1401f3780 <.text+0x1f2780>
1401f3820:     	addq	$0x3, %rax
1401f3824:     	shll	$0xc, %edx
1401f3827:     	orl	%edx, %ecx
1401f3829:     	leal	-0x3a(%rcx), %edx
1401f382c:     	cmpl	$-0xb, %edx
1401f382f:     	ja	0x1401f3780 <.text+0x1f2780>
1401f3835:     	nopw	%cs:(%rax,%rax)
1401f3840:     	andl	$-0x21, %ecx
1401f3843:     	addl	$-0x47, %ecx
1401f3846:     	cmpl	$-0x6, %ecx
1401f3849:     	jae	0x1401f3780 <.text+0x1f2780>
1401f384f:     	jmp	0x1401f3685 <.text+0x1f2685>
1401f3854:     	cmpq	$0x8, %r15
1401f3858:     	jb	0x1401f3cd4 <.text+0x1f2cd4>
1401f385e:     	cmpb	$-0x40, 0x4(%rbx)
1401f3862:     	jl	0x1401f3cd4 <.text+0x1f2cd4>
1401f3868:     	cmpq	$0x8, %r15
1401f386c:     	je	0x1401f3878 <.text+0x1f2878>
1401f386e:     	cmpb	$-0x41, 0xa(%rbx)
1401f3872:     	jle	0x1401f3cd4 <.text+0x1f2cd4>
1401f3878:     	leaq	0x4(%rbx), %rax
1401f387c:     	addq	$0xa, %rbx
1401f3880:     	xorl	%r9d, %r9d
1401f3883:     	jmp	0x1401f38a5 <.text+0x1f28a5>
1401f3885:     	nopw	%cs:(%rax,%rax)
1401f3890:     	leaq	0x1(%rdx), %r9
1401f3894:     	subq	%rbx, %r9
1401f3897:     	addq	$0x6, %r9
1401f389b:     	cmpl	$0x23, %r8d
1401f389f:     	jne	0x1401f3936 <.text+0x1f2936>
1401f38a5:     	movq	%r9, %rcx
1401f38a8:     	leaq	(%rax,%r9), %rdx
1401f38ac:     	cmpq	$0x6, %r9
1401f38b0:     	je	0x1401f3936 <.text+0x1f2936>
1401f38b6:     	movzbl	(%rdx), %r9d
1401f38ba:     	movzbl	%r9b, %r8d
1401f38be:     	testb	%r8b, %r8b
1401f38c1:     	jns	0x1401f3890 <.text+0x1f2890>
1401f38c3:     	movl	%r8d, %r10d
1401f38c6:     	andl	$0x1f, %r10d
1401f38ca:     	movzbl	0x1(%rdx), %r11d
1401f38cf:     	andl	$0x3f, %r11d
1401f38d3:     	cmpb	$-0x21, %r8b
1401f38d7:     	jbe	0x1401f3913 <.text+0x1f2913>
1401f38d9:     	movzbl	0x2(%rdx), %r8d
1401f38de:     	shll	$0x6, %r11d
1401f38e2:     	andl	$0x3f, %r8d
1401f38e6:     	orl	%r11d, %r8d
1401f38e9:     	cmpb	$-0x10, %r9b
1401f38ed:     	jb	0x1401f3926 <.text+0x1f2926>
1401f38ef:     	leaq	0x4(%rdx), %r9
1401f38f3:     	movzbl	0x3(%rdx), %r11d
1401f38f8:     	andl	$0x7, %r10d
1401f38fc:     	shll	$0x12, %r10d
1401f3900:     	shll	$0x6, %r8d
1401f3904:     	andl	$0x3f, %r11d
1401f3908:     	orl	%r8d, %r11d
1401f390b:     	orl	%r10d, %r11d
1401f390e:     	movl	%r11d, %r8d
1401f3911:     	jmp	0x1401f3894 <.text+0x1f2894>
1401f3913:     	leaq	0x2(%rdx), %r9
1401f3917:     	shll	$0x6, %r10d
1401f391b:     	orl	%r11d, %r10d
1401f391e:     	movl	%r10d, %r8d
1401f3921:     	jmp	0x1401f3894 <.text+0x1f2894>
1401f3926:     	leaq	0x3(%rdx), %r9
1401f392a:     	shll	$0xc, %r10d
1401f392e:     	orl	%r10d, %r8d
1401f3931:     	jmp	0x1401f3894 <.text+0x1f2894>
1401f3936:     	movl	$0x6, %r8d
1401f393c:     	subq	%rcx, %r8
1401f393f:     	movb	$0x1, 0x2b7(%rbp)
1401f3946:     	leaq	0x10(%rbp), %rcx
1401f394a:     	callq	0x140195aa0 <.text+0x194aa0>
1401f394f:     	nop
1401f3950:     	cmpl	$0x1, 0x10(%rbp)
1401f3954:     	jne	0x1401f395f <.text+0x1f295f>
1401f3956:     	movups	0x574968f(%rip), %xmm0  # 0x14593cfec
1401f395d:     	jmp	0x1401f3966 <.text+0x1f2966>
1401f395f:     	leaq	0x14(%rbp), %rax
1401f3963:     	movups	(%rax), %xmm0
1401f3966:     	movaps	%xmm0, 0x260(%rbp)
1401f396d:     	cmpq	$0x8, %r15
1401f3971:     	je	0x1401f397c <.text+0x1f297c>
1401f3973:     	cmpb	$-0x40, (%rbx)
1401f3976:     	jl	0x1401f3da1 <.text+0x1f2da1>
1401f397c:     	addq	$-0xa, %r13
1401f3980:     	movq	%r13, %r12
1401f3983:     	jmp	0x1401f3453 <.text+0x1f2453>
1401f3988:     	xorl	%r14d, %r14d
1401f398b:     	movb	$0x1, 0x2b7(%rbp)
1401f3992:     	movq	%r14, %rcx
1401f3995:     	movq	0x280(%rbp), %rdx
1401f399c:     	callq	0x14590379b <.text+0x590279b>
1401f39a1:     	nop
1401f39a2:     	jmp	0x1401f3dc9 <.text+0x1f2dc9>
1401f39a7:     	cmpb	$0x1, (%rsi)
1401f39aa:     	jne	0x1401f39cb <.text+0x1f29cb>
1401f39ac:     	movl	0x1(%rsi), %eax
1401f39af:     	movl	0x4(%rsi), %ecx
1401f39b2:     	movl	%ecx, 0x27b(%rbp)
1401f39b8:     	movl	%eax, 0x278(%rbp)
1401f39be:     	movq	0x8(%rsi), %rcx
1401f39c2:     	movzbl	0x10(%rsi), %edx
1401f39c6:     	movb	$0x1, %r8b
1401f39c9:     	jmp	0x1401f39dc <.text+0x1f29dc>
1401f39cb:     	movq	0x8(%rsi), %rcx
1401f39cf:     	lock
1401f39d0:     	incq	(%rcx)
1401f39d3:     	jle	0x1401f3dc9 <.text+0x1f2dc9>
1401f39d9:     	xorl	%r8d, %r8d
1401f39dc:     	movups	0x5758d0d(%rip), %xmm0  # 0x14594c6f0
1401f39e3:     	movups	%xmm0, 0x21c(%rbp)
1401f39ea:     	movl	$0x3f800000, 0x22c(%rbp) # imm = 0x3F800000
1401f39f4:     	movups	0x57585a5(%rip), %xmm0  # 0x14594bfa0
1401f39fb:     	movaps	%xmm0, -0x50(%rbp)
1401f39ff:     	movq	$0x0, -0x40(%rbp)
1401f3a07:     	movups	0x57585aa(%rip), %xmm0  # 0x14594bfb8
1401f3a0e:     	movups	%xmm0, -0x38(%rbp)
1401f3a12:     	movq	$0x0, -0x28(%rbp)
1401f3a1a:     	movups	0x57585af(%rip), %xmm0  # 0x14594bfd0
1401f3a21:     	movaps	%xmm0, -0x20(%rbp)
1401f3a25:     	movq	$0x0, -0x10(%rbp)
1401f3a2d:     	movups	0x57585b4(%rip), %xmm0  # 0x14594bfe8
1401f3a34:     	movups	%xmm0, -0x8(%rbp)
1401f3a38:     	movq	$0x0, 0x8(%rbp)
1401f3a40:     	movq	(%rdi), %rax
1401f3a43:     	addq	$0x8, %rdi
1401f3a47:     	movq	$0x0, 0x18(%rbp)
1401f3a4f:     	movq	$0x1, 0x20(%rbp)
1401f3a57:     	xorps	%xmm0, %xmm0
1401f3a5a:     	movups	%xmm0, 0x28(%rbp)
1401f3a5e:     	movq	$0x4, 0x38(%rbp)
1401f3a66:     	movq	$0x0, 0x40(%rbp)
1401f3a6e:     	movb	%r8b, 0x48(%rbp)
1401f3a72:     	movl	0x278(%rbp), %r8d
1401f3a79:     	movl	0x27b(%rbp), %r9d
1401f3a80:     	movl	%r8d, 0x49(%rbp)
1401f3a84:     	movl	%r9d, 0x4c(%rbp)
1401f3a88:     	movq	%rcx, 0x50(%rbp)
1401f3a8c:     	movq	%rdx, 0x58(%rbp)
1401f3a90:     	movl	$0x41500000, 0x60(%rbp) # imm = 0x41500000
1401f3a97:     	movw	$0x190, 0x64(%rbp)      # imm = 0x190
1401f3a9d:     	movb	$0x1, 0x66(%rbp)
1401f3aa1:     	movups	0x21b(%rbp), %xmm1
1401f3aa8:     	movups	%xmm1, 0x67(%rbp)
1401f3aac:     	movq	0x228(%rbp), %rcx
1401f3ab3:     	movq	%rcx, 0x74(%rbp)
1401f3ab7:     	movl	0x57256c3(%rip), %ecx   # 0x145919180
1401f3abd:     	movl	%ecx, 0x8c(%rbp)
1401f3ac3:     	movups	0x57256a6(%rip), %xmm1  # 0x145919170
1401f3aca:     	movups	%xmm1, 0x7c(%rbp)
1401f3ace:     	movsd	0x5721cfa(%rip), %xmm1  # 0x1459157d0
1401f3ad6:     	movsd	%xmm1, 0x90(%rbp)
1401f3ade:     	movaps	(%rbp), %xmm1
1401f3ae2:     	movups	%xmm1, 0xe8(%rbp)
1401f3ae9:     	movaps	-0x10(%rbp), %xmm1
1401f3aed:     	movups	%xmm1, 0xd8(%rbp)
1401f3af4:     	movaps	-0x50(%rbp), %xmm1
1401f3af8:     	movaps	-0x40(%rbp), %xmm2
1401f3afc:     	movaps	-0x30(%rbp), %xmm3
1401f3b00:     	movaps	-0x20(%rbp), %xmm4
1401f3b04:     	movups	%xmm4, 0xc8(%rbp)
1401f3b0b:     	movups	%xmm3, 0xb8(%rbp)
1401f3b12:     	movups	%xmm2, 0xa8(%rbp)
1401f3b19:     	movups	%xmm1, 0x98(%rbp)
1401f3b20:     	movups	%xmm0, 0x108(%rbp)
1401f3b27:     	movups	%xmm0, 0xf8(%rbp)
1401f3b2e:     	movq	$0x0, 0x118(%rbp)
1401f3b39:     	movabsq	$0x42c8000000000002, %rcx # imm = 0x42C8000000000002
1401f3b43:     	movq	%rcx, 0x120(%rbp)
1401f3b4a:     	movups	%xmm0, 0x138(%rbp)
1401f3b51:     	movups	%xmm0, 0x128(%rbp)
1401f3b58:     	movq	$0x0, 0x148(%rbp)
1401f3b63:     	movups	0x57584fe(%rip), %xmm0  # 0x14594c068
1401f3b6a:     	movups	%xmm0, 0x160(%rbp)
1401f3b71:     	movups	0x57584e0(%rip), %xmm0  # 0x14594c058
1401f3b78:     	movups	%xmm0, 0x150(%rbp)
1401f3b7f:     	movups	0x5758502(%rip), %xmm0  # 0x14594c088
1401f3b86:     	movups	%xmm0, 0x180(%rbp)
1401f3b8d:     	movups	0x57584e4(%rip), %xmm0  # 0x14594c078
1401f3b94:     	movups	%xmm0, 0x170(%rbp)
1401f3b9b:     	movups	0x5758506(%rip), %xmm0  # 0x14594c0a8
1401f3ba2:     	movups	%xmm0, 0x1a0(%rbp)
1401f3ba9:     	movups	0x57584e8(%rip), %xmm0  # 0x14594c098
1401f3bb0:     	movups	%xmm0, 0x190(%rbp)
1401f3bb7:     	movups	0x575850a(%rip), %xmm0  # 0x14594c0c8
1401f3bbe:     	movups	%xmm0, 0x1c0(%rbp)
1401f3bc5:     	movups	0x57584ec(%rip), %xmm0  # 0x14594c0b8
1401f3bcc:     	movups	%xmm0, 0x1b0(%rbp)
1401f3bd3:     	movaps	0x57138e6(%rip), %xmm0  # 0x1459074c0
1401f3bda:     	movups	%xmm0, 0x1d0(%rbp)
1401f3be1:     	movl	$0x1, 0x1e0(%rbp)
1401f3beb:     	movq	$0x0, 0x1e4(%rbp)
1401f3bf6:     	movb	$0x1, 0x1ec(%rbp)
1401f3bfd:     	movq	$0x0, 0x1f0(%rbp)
1401f3c08:     	movl	$0x3f800000, 0x1f8(%rbp) # imm = 0x3F800000
1401f3c12:     	movw	$0x0, 0x1fc(%rbp)
1401f3c1b:     	movw	$0x0, 0x202(%rbp)
1401f3c24:     	movl	$0x10000, 0x1fe(%rbp)   # imm = 0x10000
1401f3c2e:     	movw	$0x0, 0x208(%rbp)
1401f3c37:     	movl	$0x10000, 0x204(%rbp)   # imm = 0x10000
1401f3c41:     	movl	$0x0, 0x212(%rbp)
1401f3c4b:     	movq	$0x0, 0x20a(%rbp)
1401f3c56:     	movq	%rax, 0x10(%rbp)
1401f3c5a:     	movb	$0x1, 0x2b7(%rbp)
1401f3c61:     	leaq	0x5757f80(%rip), %r9    # 0x14594bbe8
1401f3c68:     	leaq	0x230(%rbp), %rcx
1401f3c6f:     	leaq	0x10(%rbp), %r8
1401f3c73:     	movq	%rdi, %rdx
1401f3c76:     	callq	0x1400ebe50 <.text+0xeae50>
1401f3c7b:     	nop
1401f3c7c:     	movq	0x2a0(%rbp), %rax
1401f3c83:     	movq	%rax, 0x20(%rbp)
1401f3c87:     	movups	0x290(%rbp), %xmm0
1401f3c8e:     	movaps	%xmm0, 0x10(%rbp)
1401f3c92:     	movq	%rsi, 0x28(%rbp)
1401f3c96:     	leaq	0x274(%rbp), %rax
1401f3c9d:     	movq	%rax, 0x30(%rbp)
1401f3ca1:     	movb	$0x0, 0x2b7(%rbp)
1401f3ca8:     	leaq	0x230(%rbp), %rcx
1401f3caf:     	leaq	0x10(%rbp), %rdx
1401f3cb3:     	callq	0x140110890 <.text+0x10f890>
1401f3cb8:     	nop
1401f3cb9:     	movaps	0x2c0(%rbp), %xmm6
1401f3cc0:     	addq	$0x358, %rsp            # imm = 0x358
1401f3cc7:     	popq	%rbx
1401f3cc8:     	popq	%rdi
1401f3cc9:     	popq	%rsi
1401f3cca:     	popq	%r12
1401f3ccc:     	popq	%r13
1401f3cce:     	popq	%r14
1401f3cd0:     	popq	%r15
1401f3cd2:     	popq	%rbp
1401f3cd3:     	retq
1401f3cd4:     	movb	$0x1, 0x2b7(%rbp)
1401f3cdb:     	leaq	0x5758dfe(%rip), %rax   # 0x14594cae0
1401f3ce2:     	movq	%rax, 0x20(%rsp)
1401f3ce7:     	movl	$0x2, %r8d
1401f3ced:     	movl	$0x8, %r9d
1401f3cf3:     	movq	%r14, %rcx
1401f3cf6:     	movq	%r15, %rdx
1401f3cf9:     	callq	0x1459039b0 <.text+0x59029b0>
1401f3cfe:     	nop
1401f3cff:     	jmp	0x1401f3dc9 <.text+0x1f2dc9>
1401f3d04:     	movb	$0x1, 0x2b7(%rbp)
1401f3d0b:     	leaq	0x5758d9e(%rip), %rax   # 0x14594cab0
1401f3d12:     	movq	%rax, 0x20(%rsp)
1401f3d17:     	movq	%rbx, %rcx
1401f3d1a:     	movq	%r12, %rdx
1401f3d1d:     	xorl	%r8d, %r8d
1401f3d20:     	movq	%r13, %r9
1401f3d23:     	callq	0x1459039b0 <.text+0x59029b0>
1401f3d28:     	nop
1401f3d29:     	jmp	0x1401f3dc9 <.text+0x1f2dc9>
1401f3d2e:     	movb	$0x1, 0x2b7(%rbp)
1401f3d35:     	leaq	0x5758d8c(%rip), %rax   # 0x14594cac8
1401f3d3c:     	movq	%rax, 0x20(%rsp)
1401f3d41:     	movq	%rbx, %rcx
1401f3d44:     	movq	%r12, %rdx
1401f3d47:     	movq	%r12, %r9
1401f3d4a:     	callq	0x1459039b0 <.text+0x59029b0>
1401f3d4f:     	nop
1401f3d50:     	jmp	0x1401f3dc9 <.text+0x1f2dc9>
1401f3d52:     	movq	%r13, 0x280(%rbp)
1401f3d59:     	jmp	0x1401f398b <.text+0x1f298b>
1401f3d5e:     	movb	$0x1, 0x2b7(%rbp)
1401f3d65:     	movl	$0x1, %ecx
1401f3d6a:     	movl	$0x1, %edx
1401f3d6f:     	callq	0x14590379b <.text+0x590279b>
1401f3d74:     	nop
1401f3d75:     	jmp	0x1401f3dc9 <.text+0x1f2dc9>
1401f3d77:     	movb	$0x1, 0x2b7(%rbp)
1401f3d7e:     	leaq	0x5758d8b(%rip), %rax   # 0x14594cb10
1401f3d85:     	movq	%rax, 0x20(%rsp)
1401f3d8a:     	movl	$0x1, %r8d
1401f3d90:     	movq	%rbx, %rcx
1401f3d93:     	movq	%r13, %rdx
1401f3d96:     	movq	%r13, %r9
1401f3d99:     	callq	0x1459039b0 <.text+0x59029b0>
1401f3d9e:     	nop
1401f3d9f:     	jmp	0x1401f3dc9 <.text+0x1f2dc9>
1401f3da1:     	movb	$0x1, 0x2b7(%rbp)
1401f3da8:     	leaq	0x5758d49(%rip), %rax   # 0x14594caf8
1401f3daf:     	movq	%rax, 0x20(%rsp)
1401f3db4:     	movl	$0x8, %r8d
1401f3dba:     	movq	%r14, %rcx
1401f3dbd:     	movq	%r15, %rdx
1401f3dc0:     	movq	%r15, %r9
1401f3dc3:     	callq	0x1459039b0 <.text+0x59029b0>
1401f3dc8:     	nop
1401f3dc9:     	ud2
