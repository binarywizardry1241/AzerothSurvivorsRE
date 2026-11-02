
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453f3380:     	pushq	%rbp
1453f3381:     	pushq	%r15
1453f3383:     	pushq	%r14
1453f3385:     	pushq	%r13
1453f3387:     	pushq	%r12
1453f3389:     	pushq	%rsi
1453f338a:     	pushq	%rdi
1453f338b:     	pushq	%rbx
1453f338c:     	movl	$0x1d48, %eax           # imm = 0x1D48
1453f3391:     	callq	0x145713e90 <.text+0x5712e90>
1453f3396:     	subq	%rax, %rsp
1453f3399:     	leaq	0x80(%rsp), %rbp
1453f33a1:     	movq	$-0x2, 0x1cc0(%rbp)
1453f33ac:     	movq	%rdx, %r9
1453f33af:     	movl	(%rdx), %eax
1453f33b1:     	subl	$0x2, %eax
1453f33b4:     	movl	$0xa, %edx
1453f33b9:     	cmovael	%eax, %edx
1453f33bc:     	movq	%rcx, %rsi
1453f33bf:     	leaq	0x12e87ca(%rip), %rax   # 0x1466dbb90
1453f33c6:     	movslq	(%rax,%rdx,4), %rcx
1453f33ca:     	addq	%rax, %rcx
1453f33cd:     	jmpq	*%rcx
1453f33cf:     	cmpl	$0x2, 0x10(%rsi)
1453f33d3:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f33d9:     	addq	$0x10, %rsi
1453f33dd:     	movq	0x8(%r9), %rdx
1453f33e1:     	movq	%rsi, %rcx
1453f33e4:     	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f33eb:     	popq	%rbx
1453f33ec:     	popq	%rdi
1453f33ed:     	popq	%rsi
1453f33ee:     	popq	%r12
1453f33f0:     	popq	%r13
1453f33f2:     	popq	%r14
1453f33f4:     	popq	%r15
1453f33f6:     	popq	%rbp
1453f33f7:     	jmp	0x1454b8e90 <.text+0x54b7e90>
1453f33fc:     	movzbl	0x4(%r9), %eax
1453f3401:     	movb	%al, 0xfa3(%rsi)
1453f3407:     	cmpl	$0x2, 0x10(%rsi)
1453f340b:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f3411:     	movb	%al, 0x954(%rsi)
1453f3417:     	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f341c:     	movl	0xb58(%rsi), %ebx
1453f3422:     	cmpl	$0x1, %ebx
1453f3425:     	ja	0x1453f4a0a <.text+0x53f3a0a>
1453f342b:     	movq	0xa90(%rsi), %r14
1453f3432:     	testq	%r14, %r14
1453f3435:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f343b:     	leaq	0x9a8(%rsi), %rdi
1453f3442:     	movq	0xa88(%rsi), %r15
1453f3449:     	movq	$0x0, 0xa90(%rsi)
1453f3454:     	shlq	$0x5, %r14
1453f3458:     	xorl	%r12d, %r12d
1453f345b:     	jmp	0x1453f346d <.text+0x53f246d>
1453f345d:     	nopl	(%rax)
1453f3460:     	addq	$0x20, %r12
1453f3464:     	cmpq	%r12, %r14
1453f3467:     	je	0x1453f4313 <.text+0x53f3313>
1453f346d:     	movq	(%r15,%r12), %rdx
1453f3471:     	testq	%rdx, %rdx
1453f3474:     	je	0x1453f3460 <.text+0x53f2460>
1453f3476:     	movq	0x8(%r15,%r12), %rcx
1453f347b:     	movl	$0x1, %r8d
1453f3481:     	callq	0x1400021d0 <.text+0x11d0>
1453f3486:     	jmp	0x1453f3460 <.text+0x53f2460>
1453f3488:     	movzbl	0x20(%r9), %edx
1453f348d:     	addq	$0x8, %r9
1453f3491:     	addq	$0x9a8, %rsi            # imm = 0x9A8
1453f3498:     	movq	%rsi, %rcx
1453f349b:     	movq	%r9, %r8
1453f349e:     	callq	0x1454025d0 <.text+0x54015d0>
1453f34a3:     	movq	%rsi, %rcx
1453f34a6:     	jmp	0x1453f431e <.text+0x53f331e>
1453f34ab:     	movq	%rsi, %rcx
1453f34ae:     	callq	0x1453f0160 <.text+0x53ef160>
1453f34b3:     	movq	0x10(%rsi), %rax
1453f34b7:     	movq	$0x2, 0x10(%rsi)
1453f34bf:     	cmpq	$0x2, %rax
1453f34c3:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f34c9:     	leaq	0x18(%rsi), %rdx
1453f34cd:     	movq	%rax, -0x50(%rbp)
1453f34d1:     	leaq	-0x48(%rbp), %rcx
1453f34d5:     	movl	$0x948, %r8d            # imm = 0x948
1453f34db:     	callq	0x1457149fd <.text+0x57139fd>
1453f34e0:     	movq	0x9a0(%rsi), %rcx
1453f34e7:     	testq	%rcx, %rcx
1453f34ea:     	je	0x1453f4a00 <.text+0x53f3a00>
1453f34f0:     	leaq	0x10(%rsi), %r12
1453f34f4:     	movq	0x998(%rsi), %rax
1453f34fb:     	imulq	$0xb0, %rcx, %rcx
1453f3502:     	xorl	%ebx, %ebx
1453f3504:     	xorl	%edx, %edx
1453f3506:     	nopw	%cs:(%rax,%rax)
1453f3510:     	cmpb	$0x0, 0xa8(%rax,%rdx)
1453f3518:     	jne	0x1453f4351 <.text+0x53f3351>
1453f351e:     	incq	%rbx
1453f3521:     	addq	$0xb0, %rdx
1453f3528:     	cmpq	%rdx, %rcx
1453f352b:     	jne	0x1453f3510 <.text+0x53f2510>
1453f352d:     	jmp	0x1453f4a00 <.text+0x53f3a00>
1453f3532:     	leaq	0x900(%rbp), %rbx
1453f3539:     	movq	%rbx, %rcx
1453f353c:     	callq	0x1453f9d00 <.text+0x53f8d00>
1453f3541:     	leaq	0x9a8(%rsi), %rdi
1453f3548:     	movq	%rdi, %rcx
1453f354b:     	callq	0x1400308a0 <.text+0x2f8a0>
1453f3550:     	movl	$0x1b8, %r8d            # imm = 0x1B8
1453f3556:     	movq	%rdi, %rcx
1453f3559:     	movq	%rbx, %rdx
1453f355c:     	callq	0x1457149fd <.text+0x57139fd>
1453f3561:     	leaq	0x900(%rbp), %rcx
1453f3568:     	movq	%rdi, %rdx
1453f356b:     	xorl	%r8d, %r8d
1453f356e:     	callq	0x1454350e0 <.text+0x54340e0>
1453f3573:     	cmpq	$0x0, 0x910(%rbp)
1453f357b:     	je	0x1453f4172 <.text+0x53f3172>
1453f3581:     	movq	0x900(%rbp), %rdx
1453f3588:     	testq	%rdx, %rdx
1453f358b:     	je	0x1453f35a3 <.text+0x53f25a3>
1453f358d:     	movq	0x908(%rbp), %rcx
1453f3594:     	shlq	$0x3, %rdx
1453f3598:     	movl	$0x8, %r8d
1453f359e:     	callq	0x1400021d0 <.text+0x11d0>
1453f35a3:     	movq	%rdi, %rcx
1453f35a6:     	callq	0x1453fe8c0 <.text+0x53fd8c0>
1453f35ab:     	jmp	0x1453f4194 <.text+0x53f3194>
1453f35b0:     	movups	0x8(%r9), %xmm0
1453f35b5:     	movups	0x18(%r9), %xmm1
1453f35ba:     	movups	0x28(%r9), %xmm2
1453f35bf:     	movups	0x38(%r9), %xmm3
1453f35c4:     	movaps	%xmm3, -0x20(%rbp)
1453f35c8:     	movaps	%xmm2, -0x30(%rbp)
1453f35cc:     	movaps	%xmm1, -0x40(%rbp)
1453f35d0:     	movaps	%xmm0, -0x50(%rbp)
1453f35d4:     	leaq	0x9a8(%rsi), %rdi
1453f35db:     	leaq	0x900(%rbp), %rbx
1453f35e2:     	leaq	-0x50(%rbp), %rdx
1453f35e6:     	movq	%rbx, %rcx
1453f35e9:     	callq	0x1454027e0 <.text+0x54017e0>
1453f35ee:     	leaq	0x1250(%rbp), %rcx
1453f35f5:     	movq	%rdi, %rdx
1453f35f8:     	movq	%rbx, %r8
1453f35fb:     	callq	0x1453f9130 <.text+0x53f8130>
1453f3600:     	movq	0xb60(%rsi), %rdx
1453f3607:     	testq	%rdx, %rdx
1453f360a:     	je	0x1453f361e <.text+0x53f261e>
1453f360c:     	movq	0xb68(%rsi), %rcx
1453f3613:     	movl	$0x1, %r8d
1453f3619:     	callq	0x1400021d0 <.text+0x11d0>
1453f361e:     	leaq	0xb60(%rsi), %r14
1453f3625:     	leaq	0xb78(%rsi), %rbx
1453f362c:     	movq	0xb78(%rsi), %rdx
1453f3633:     	testq	%rdx, %rdx
1453f3636:     	je	0x1453f364a <.text+0x53f264a>
1453f3638:     	movq	0xb80(%rsi), %rcx
1453f363f:     	movl	$0x1, %r8d
1453f3645:     	callq	0x1400021d0 <.text+0x11d0>
1453f364a:     	movups	0x1250(%rbp), %xmm0
1453f3651:     	movups	0x1260(%rbp), %xmm1
1453f3658:     	movups	0x1270(%rbp), %xmm2
1453f365f:     	movups	0x1280(%rbp), %xmm3
1453f3666:     	movups	%xmm3, 0x30(%r14)
1453f366b:     	movups	%xmm2, 0x20(%r14)
1453f3670:     	movups	%xmm1, 0x10(%r14)
1453f3675:     	movups	%xmm0, (%r14)
1453f3679:     	movb	0xb98(%rsi), %r15b
1453f3680:     	movb	0xb99(%rsi), %r12b
1453f3687:     	movb	0xb9a(%rsi), %r13b
1453f368e:     	leaq	0x1250(%rbp), %rcx
1453f3695:     	movq	%r14, %rdx
1453f3698:     	callq	0x1456ca060 <.text+0x56c9060>
1453f369d:     	nop
1453f369e:     	leaq	0x900(%rbp), %rcx
1453f36a5:     	movq	%rbx, %rdx
1453f36a8:     	callq	0x1456ca060 <.text+0x56c9060>
1453f36ad:     	nop
1453f36ae:     	movzbl	0xb9f(%rsi), %eax
1453f36b5:     	movb	%al, 0x1c8c(%rbp)
1453f36bb:     	movl	0xb9b(%rsi), %eax
1453f36c1:     	movl	%eax, 0x1c88(%rbp)
1453f36c7:     	movq	0xb90(%rsi), %rbx
1453f36ce:     	movq	0x1260(%rbp), %rax
1453f36d5:     	movq	%rax, 0x1c10(%rbp)
1453f36dc:     	movups	0x1250(%rbp), %xmm0
1453f36e3:     	movaps	%xmm0, 0x1c00(%rbp)
1453f36ea:     	movq	0x910(%rbp), %rax
1453f36f1:     	movq	%rax, 0x1c28(%rbp)
1453f36f8:     	movups	0x900(%rbp), %xmm0
1453f36ff:     	movups	%xmm0, 0x1c18(%rbp)
1453f3706:     	leaq	0xae0(%rsi), %r14
1453f370d:     	movq	0xae0(%rsi), %rdx
1453f3714:     	cmpq	$-0x1, %rdx
1453f3718:     	je	0x1453f374f <.text+0x53f274f>
1453f371a:     	testq	%rdx, %rdx
1453f371d:     	je	0x1453f3731 <.text+0x53f2731>
1453f371f:     	movq	0xae8(%rsi), %rcx
1453f3726:     	movl	$0x1, %r8d
1453f372c:     	callq	0x1400021d0 <.text+0x11d0>
1453f3731:     	movq	0xaf8(%rsi), %rdx
1453f3738:     	testq	%rdx, %rdx
1453f373b:     	je	0x1453f374f <.text+0x53f274f>
1453f373d:     	movq	0xb00(%rsi), %rcx
1453f3744:     	movl	$0x1, %r8d
1453f374a:     	callq	0x1400021d0 <.text+0x11d0>
1453f374f:     	movaps	0x1c00(%rbp), %xmm0
1453f3756:     	movq	0x1c10(%rbp), %rax
1453f375d:     	movq	0x1c18(%rbp), %rcx
1453f3764:     	movq	0x1c20(%rbp), %rdx
1453f376b:     	movq	%rdx, 0x20(%r14)
1453f376f:     	movq	0x1c28(%rbp), %rdx
1453f3776:     	movq	%rdx, 0x28(%r14)
1453f377a:     	movq	%rax, 0x10(%r14)
1453f377e:     	movq	%rcx, 0x18(%r14)
1453f3782:     	movups	%xmm0, (%r14)
1453f3786:     	movq	%rbx, 0xb10(%rsi)
1453f378d:     	movb	%r15b, 0xb18(%rsi)
1453f3794:     	movb	%r12b, 0xb19(%rsi)
1453f379b:     	movb	%r13b, 0xb1a(%rsi)
1453f37a2:     	movl	0x1c88(%rbp), %eax
1453f37a8:     	movl	%eax, 0xb1b(%rsi)
1453f37ae:     	movzbl	0x1c8c(%rbp), %eax
1453f37b5:     	movb	%al, 0xb1f(%rsi)
1453f37bb:     	movq	0xb98(%rsi), %rbx
1453f37c2:     	movq	0xad0(%rsi), %rax
1453f37c9:     	movq	0xad8(%rsi), %r14
1453f37d0:     	leaq	(,%r14,8), %rcx
1453f37d8:     	xorl	%edx, %edx
1453f37da:     	nopw	(%rax,%rax)
1453f37e0:     	cmpq	%rdx, %rcx
1453f37e3:     	je	0x1453f3fb4 <.text+0x53f2fb4>
1453f37e9:     	leaq	0x8(%rdx), %r8
1453f37ed:     	cmpb	%bl, (%rax,%rdx)
1453f37f0:     	movq	%r8, %rdx
1453f37f3:     	jne	0x1453f37e0 <.text+0x53f27e0>
1453f37f5:     	movq	%rbx, -0x8(%rax,%r8)
1453f37fa:     	jmp	0x1453f3fde <.text+0x53f2fde>
1453f37ff:     	cmpl	$0x2, 0x10(%rsi)
1453f3803:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f3809:     	addq	$0x10, %rsi
1453f380d:     	movq	0x8(%r9), %rdx
1453f3811:     	movq	%rsi, %rcx
1453f3814:     	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f381b:     	popq	%rbx
1453f381c:     	popq	%rdi
1453f381d:     	popq	%rsi
1453f381e:     	popq	%r12
1453f3820:     	popq	%r13
1453f3822:     	popq	%r14
1453f3824:     	popq	%r15
1453f3826:     	popq	%rbp
1453f3827:     	jmp	0x1454b8d40 <.text+0x54b7d40>
1453f382c:     	movq	0x8(%r9), %r14
1453f3830:     	movq	0x10(%r9), %rdi
1453f3834:     	movq	%r9, 0x1ca8(%rbp)
1453f383b:     	movq	0x18(%r9), %r15
1453f383f:     	leaq	(%r15,%r15,2), %rax
1453f3843:     	leaq	(%rdi,%rax,8), %rax
1453f3847:     	leaq	0x9a8(%rsi), %rbx
1453f384e:     	movq	%rdi, 0x900(%rbp)
1453f3855:     	movq	%rax, 0x908(%rbp)
1453f385c:     	movq	$0x2, 0x910(%rbp)
1453f3867:     	movq	%rbx, 0x918(%rbp)
1453f386e:     	leaq	0x1250(%rbp), %rcx
1453f3875:     	leaq	0x900(%rbp), %rdx
1453f387c:     	callq	0x1454e84d0 <.text+0x54e74d0>
1453f3881:     	nop
1453f3882:     	movq	%r14, 0x1cb0(%rbp)
1453f3889:     	leaq	0xab0(%rsi), %r12
1453f3890:     	movq	0xac0(%rsi), %r13
1453f3897:     	testq	%r13, %r13
1453f389a:     	je	0x1453f3e5f <.text+0x53f2e5f>
1453f38a0:     	movq	0xab8(%rsi), %r14
1453f38a7:     	addq	$0x8, %r14
1453f38ab:     	jmp	0x1453f38bd <.text+0x53f28bd>
1453f38ad:     	nopl	(%rax)
1453f38b0:     	addq	$0x18, %r14
1453f38b4:     	decq	%r13
1453f38b7:     	je	0x1453f3e5f <.text+0x53f2e5f>
1453f38bd:     	movq	-0x8(%r14), %rdx
1453f38c1:     	testq	%rdx, %rdx
1453f38c4:     	je	0x1453f38b0 <.text+0x53f28b0>
1453f38c6:     	movq	(%r14), %rcx
1453f38c9:     	movl	$0x1, %r8d
1453f38cf:     	callq	0x1400021d0 <.text+0x11d0>
1453f38d4:     	jmp	0x1453f38b0 <.text+0x53f28b0>
1453f38d6:     	cmpl	$0x2, 0x10(%rsi)
1453f38da:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f38e0:     	cmpb	$0x2, 0x95e(%rsi)
1453f38e7:     	jne	0x1453f4a0a <.text+0x53f3a0a>
1453f38ed:     	cmpb	$0x0, 0x21e(%rsi)
1453f38f4:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f38fa:     	movzbl	0x95c(%rsi), %ebx
1453f3901:     	cmpb	$-0x1, %bl
1453f3904:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f390a:     	movl	0x930(%rsi), %eax
1453f3910:     	shrl	$0x2, %eax
1453f3913:     	cmpl	$0xb, %eax
1453f3916:     	movl	$0xa, %ecx
1453f391b:     	cmovael	%eax, %ecx
1453f391e:     	cvtsi2ss	%ecx, %xmm0
1453f3922:     	leaq	0x10(%rsi), %rdi
1453f3926:     	mulss	0x498(%rsi), %xmm0
1453f392e:     	callq	0x145714a5d <.text+0x5713a5d>
1453f3933:     	cvttss2si	%xmm0, %rax
1453f3938:     	xorl	%ecx, %ecx
1453f393a:     	xorps	%xmm1, %xmm1
1453f393d:     	ucomiss	%xmm1, %xmm0
1453f3940:     	cmovael	%eax, %ecx
1453f3943:     	ucomiss	0x4b7afa(%rip), %xmm0   # 0x1458ab444
1453f394a:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1453f394f:     	cmovbel	%ecx, %eax
1453f3952:     	movl	0x418(%rsi), %ecx
1453f3958:     	addl	%eax, %ecx
1453f395a:     	movl	%ecx, 0x418(%rsi)
1453f3960:     	addl	%eax, 0x67c(%rsi)
1453f3966:     	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
1453f396d:     	addq	$0x8b8, %rsi            # imm = 0x8B8
1453f3974:     	movq	%rsi, %rcx
1453f3977:     	movw	$0x498, %dx             # imm = 0x498
1453f397b:     	callq	0x1454cc180 <.text+0x54cb180>
1453f3980:     	movq	%rdi, %rcx
1453f3983:     	movl	%ebx, %edx
1453f3985:     	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f398c:     	popq	%rbx
1453f398d:     	popq	%rdi
1453f398e:     	popq	%rsi
1453f398f:     	popq	%r12
1453f3991:     	popq	%r13
1453f3993:     	popq	%r14
1453f3995:     	popq	%r15
1453f3997:     	popq	%rbp
1453f3998:     	jmp	0x1454b0880 <.text+0x54af880>
1453f399d:     	movq	%rsi, %rcx
1453f39a0:     	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f39a7:     	popq	%rbx
1453f39a8:     	popq	%rdi
1453f39a9:     	popq	%rsi
1453f39aa:     	popq	%r12
1453f39ac:     	popq	%r13
1453f39ae:     	popq	%r14
1453f39b0:     	popq	%r15
1453f39b2:     	popq	%rbp
1453f39b3:     	jmp	0x1453efe40 <.text+0x53eee40>
1453f39b8:     	cmpl	$0x2, 0x10(%rsi)
1453f39bc:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f39c2:     	addq	$0x10, %rsi
1453f39c6:     	movq	%rsi, %rcx
1453f39c9:     	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f39d0:     	popq	%rbx
1453f39d1:     	popq	%rdi
1453f39d2:     	popq	%rsi
1453f39d3:     	popq	%r12
1453f39d5:     	popq	%r13
1453f39d7:     	popq	%r14
1453f39d9:     	popq	%r15
1453f39db:     	popq	%rbp
1453f39dc:     	jmp	0x1454bc740 <.text+0x54bb740>
1453f39e1:     	cmpl	$0x2, 0x10(%rsi)
1453f39e5:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f39eb:     	addq	$0x10, %rsi
1453f39ef:     	cmpb	$0x0, 0x4(%r9)
1453f39f4:     	je	0x1453f4336 <.text+0x53f3336>
1453f39fa:     	movq	%rsi, %rcx
1453f39fd:     	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f3a04:     	popq	%rbx
1453f3a05:     	popq	%rdi
1453f3a06:     	popq	%rsi
1453f3a07:     	popq	%r12
1453f3a09:     	popq	%r13
1453f3a0b:     	popq	%r14
1453f3a0d:     	popq	%r15
1453f3a0f:     	popq	%rbp
1453f3a10:     	jmp	0x145487100 <.text+0x5486100>
1453f3a15:     	movups	0x8(%r9), %xmm0
1453f3a1a:     	movups	0x18(%r9), %xmm1
1453f3a1f:     	movups	0x28(%r9), %xmm2
1453f3a24:     	movaps	%xmm2, 0x920(%rbp)
1453f3a2b:     	movaps	%xmm1, 0x910(%rbp)
1453f3a32:     	movaps	%xmm0, 0x900(%rbp)
1453f3a39:     	addq	$0x9a8, %rsi            # imm = 0x9A8
1453f3a40:     	leaq	0x900(%rbp), %rcx
1453f3a47:     	movq	%rsi, %rdx
1453f3a4a:     	callq	0x145431530 <.text+0x5430530>
1453f3a4f:     	testb	%al, %al
1453f3a51:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f3a57:     	movq	%rsi, %rcx
1453f3a5a:     	callq	0x1453fe8c0 <.text+0x53fd8c0>
1453f3a5f:     	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f3a64:     	cmpl	$0x2, 0x10(%rsi)
1453f3a68:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f3a6e:     	leaq	0x10(%rsi), %rcx
1453f3a72:     	callq	0x145463aa0 <.text+0x5462aa0>
1453f3a77:     	movq	$0x0, 0x20(%rsi)
1453f3a7f:     	callq	0x140002200 <.text+0x1200>
1453f3a84:     	movl	$0x20, %ecx
1453f3a89:     	movl	$0x1, %edx
1453f3a8e:     	callq	0x1400021c0 <.text+0x11c0>
1453f3a93:     	movq	%rax, 0x1cb0(%rbp)
1453f3a9a:     	testq	%rax, %rax
1453f3a9d:     	je	0x1453f4a6d <.text+0x53f3a6d>
1453f3aa3:     	movq	0x558(%rsi), %rdi
1453f3aaa:     	cmpq	0x548(%rsi), %rdi
1453f3ab1:     	jne	0x1453f3ac0 <.text+0x53f2ac0>
1453f3ab3:     	leaq	0x548(%rsi), %rcx
1453f3aba:     	callq	0x145717d60 <.text+0x5716d60>
1453f3abf:     	nop
1453f3ac0:     	movq	0x550(%rsi), %rax
1453f3ac7:     	movq	%rdi, %rcx
1453f3aca:     	shlq	$0x5, %rcx
1453f3ace:     	movq	$0x20, (%rax,%rcx)
1453f3ad6:     	movq	0x1cb0(%rbp), %rdx
1453f3add:     	movq	%rdx, 0x8(%rax,%rcx)
1453f3ae2:     	movq	$0x0, 0x10(%rax,%rcx)
1453f3aeb:     	movw	$0x17e, 0x18(%rax,%rcx) # imm = 0x17E
1453f3af2:     	incq	%rdi
1453f3af5:     	movq	%rdi, 0x558(%rsi)
1453f3afc:     	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f3b01:     	leaq	0x900(%rbp), %rcx
1453f3b08:     	movl	$0xe8, %r8d
1453f3b0e:     	movq	%r9, %rdx
1453f3b11:     	callq	0x1457149fd <.text+0x57139fd>
1453f3b16:     	movzbl	0xb99(%rsi), %ebx
1453f3b1d:     	leaq	0x9a8(%rsi), %rdi
1453f3b24:     	leaq	0x1c88(%rbp), %rcx
1453f3b2b:     	movq	%rdi, %rdx
1453f3b2e:     	callq	0x1453fa8b0 <.text+0x53f98b0>
1453f3b33:     	movq	0x1c90(%rbp), %rdx
1453f3b3a:     	movq	0x1c98(%rbp), %rax
1453f3b41:     	movzbl	0x9e4(%rbp), %ecx
1453f3b48:     	movb	%cl, 0x1c68(%rbp)
1453f3b4e:     	leaq	0x1c68(%rbp), %rcx
1453f3b55:     	movq	%rcx, -0x50(%rbp)
1453f3b59:     	movq	%rdx, 0x1cb0(%rbp)
1453f3b60:     	movq	%rdx, -0x48(%rbp)
1453f3b64:     	movq	%rax, -0x40(%rbp)
1453f3b68:     	xorl	%r14d, %r14d
1453f3b6b:     	leaq	0x1250(%rbp), %r15
1453f3b72:     	leaq	-0x50(%rbp), %r12
1453f3b76:     	jmp	0x1453f3b8d <.text+0x53f2b8d>
1453f3b78:     	nopl	(%rax,%rax)
1453f3b80:     	incq	%r14
1453f3b83:     	cmpq	$0x13, %r14
1453f3b87:     	je	0x1453f3f14 <.text+0x53f2f14>
1453f3b8d:     	movl	0x998(%rbp,%r14,4), %edx
1453f3b95:     	testl	%edx, %edx
1453f3b97:     	je	0x1453f3bb5 <.text+0x53f2bb5>
1453f3b99:     	movq	%r12, %rcx
1453f3b9c:     	movq	%r14, %r8
1453f3b9f:     	callq	0x1453f8d20 <.text+0x53f7d20>
1453f3ba4:     	nop
1453f3ba5:     	testb	%al, %al
1453f3ba7:     	jne	0x1453f3bb5 <.text+0x53f2bb5>
1453f3ba9:     	movl	$0x0, 0x998(%rbp,%r14,4)
1453f3bb5:     	cmpl	$0x1, 0x900(%rbp,%r14,8)
1453f3bbe:     	jne	0x1453f3b80 <.text+0x53f2b80>
1453f3bc0:     	movl	0x904(%rbp,%r14,8), %r13d
1453f3bc8:     	movzbl	0x1c68(%rbp), %r8d
1453f3bd0:     	movq	%r15, %rcx
1453f3bd3:     	movl	%ebx, %edx
1453f3bd5:     	callq	0x1453df460 <.text+0x53de460>
1453f3bda:     	nop
1453f3bdb:     	testl	%r13d, %r13d
1453f3bde:     	je	0x1453f3b80 <.text+0x53f2b80>
1453f3be0:     	cmpl	%r13d, 0x1250(%rbp,%r14,4)
1453f3be8:     	je	0x1453f3b80 <.text+0x53f2b80>
1453f3bea:     	movq	%r12, %rcx
1453f3bed:     	movl	%r13d, %edx
1453f3bf0:     	movq	%r14, %r8
1453f3bf3:     	callq	0x1453f8d20 <.text+0x53f7d20>
1453f3bf8:     	nop
1453f3bf9:     	testb	%al, %al
1453f3bfb:     	jne	0x1453f3b80 <.text+0x53f2b80>
1453f3bfd:     	movl	$0x0, 0x900(%rbp,%r14,8)
1453f3c09:     	jmp	0x1453f3b80 <.text+0x53f2b80>
1453f3c0e:     	movups	0x8(%r9), %xmm0
1453f3c13:     	movups	0x18(%r9), %xmm1
1453f3c18:     	movups	0x28(%r9), %xmm2
1453f3c1d:     	movups	0x38(%r9), %xmm3
1453f3c22:     	movaps	%xmm3, -0x20(%rbp)
1453f3c26:     	movaps	%xmm2, -0x30(%rbp)
1453f3c2a:     	movaps	%xmm1, -0x40(%rbp)
1453f3c2e:     	movaps	%xmm0, -0x50(%rbp)
1453f3c32:     	leaq	0x9a8(%rsi), %rdi
1453f3c39:     	leaq	0x900(%rbp), %rbx
1453f3c40:     	leaq	-0x50(%rbp), %rdx
1453f3c44:     	movq	%rbx, %rcx
1453f3c47:     	callq	0x1454027e0 <.text+0x54017e0>
1453f3c4c:     	leaq	0x1250(%rbp), %rcx
1453f3c53:     	movq	%rdi, %rdx
1453f3c56:     	movq	%rbx, %r8
1453f3c59:     	callq	0x1453f9130 <.text+0x53f8130>
1453f3c5e:     	movq	0xb60(%rsi), %rdx
1453f3c65:     	testq	%rdx, %rdx
1453f3c68:     	je	0x1453f3c7c <.text+0x53f2c7c>
1453f3c6a:     	movq	0xb68(%rsi), %rcx
1453f3c71:     	movl	$0x1, %r8d
1453f3c77:     	callq	0x1400021d0 <.text+0x11d0>
1453f3c7c:     	leaq	0xb60(%rsi), %r14
1453f3c83:     	leaq	0xb78(%rsi), %rbx
1453f3c8a:     	movq	0xb78(%rsi), %rdx
1453f3c91:     	testq	%rdx, %rdx
1453f3c94:     	je	0x1453f3ca8 <.text+0x53f2ca8>
1453f3c96:     	movq	0xb80(%rsi), %rcx
1453f3c9d:     	movl	$0x1, %r8d
1453f3ca3:     	callq	0x1400021d0 <.text+0x11d0>
1453f3ca8:     	movups	0x1250(%rbp), %xmm0
1453f3caf:     	movups	0x1260(%rbp), %xmm1
1453f3cb6:     	movups	0x1270(%rbp), %xmm2
1453f3cbd:     	movups	0x1280(%rbp), %xmm3
1453f3cc4:     	movups	%xmm3, 0x30(%r14)
1453f3cc9:     	movups	%xmm2, 0x20(%r14)
1453f3cce:     	movups	%xmm1, 0x10(%r14)
1453f3cd3:     	movups	%xmm0, (%r14)
1453f3cd7:     	movb	0xb98(%rsi), %r15b
1453f3cde:     	movb	0xb99(%rsi), %r12b
1453f3ce5:     	movb	0xb9a(%rsi), %r13b
1453f3cec:     	leaq	0x1250(%rbp), %rcx
1453f3cf3:     	movq	%r14, %rdx
1453f3cf6:     	callq	0x1456ca060 <.text+0x56c9060>
1453f3cfb:     	nop
1453f3cfc:     	leaq	0x900(%rbp), %rcx
1453f3d03:     	movq	%rbx, %rdx
1453f3d06:     	callq	0x1456ca060 <.text+0x56c9060>
1453f3d0b:     	nop
1453f3d0c:     	movzbl	0xb9f(%rsi), %eax
1453f3d13:     	movb	%al, 0x1c8c(%rbp)
1453f3d19:     	movl	0xb9b(%rsi), %eax
1453f3d1f:     	movl	%eax, 0x1c88(%rbp)
1453f3d25:     	movq	0xb90(%rsi), %rbx
1453f3d2c:     	movq	0x1260(%rbp), %rax
1453f3d33:     	movq	%rax, 0x1be0(%rbp)
1453f3d3a:     	movups	0x1250(%rbp), %xmm0
1453f3d41:     	movaps	%xmm0, 0x1bd0(%rbp)
1453f3d48:     	movq	0x910(%rbp), %rax
1453f3d4f:     	movq	%rax, 0x1bf8(%rbp)
1453f3d56:     	movups	0x900(%rbp), %xmm0
1453f3d5d:     	movups	%xmm0, 0x1be8(%rbp)
1453f3d64:     	leaq	0xae0(%rsi), %r14
1453f3d6b:     	movq	0xae0(%rsi), %rdx
1453f3d72:     	cmpq	$-0x1, %rdx
1453f3d76:     	je	0x1453f3dad <.text+0x53f2dad>
1453f3d78:     	testq	%rdx, %rdx
1453f3d7b:     	je	0x1453f3d8f <.text+0x53f2d8f>
1453f3d7d:     	movq	0xae8(%rsi), %rcx
1453f3d84:     	movl	$0x1, %r8d
1453f3d8a:     	callq	0x1400021d0 <.text+0x11d0>
1453f3d8f:     	movq	0xaf8(%rsi), %rdx
1453f3d96:     	testq	%rdx, %rdx
1453f3d99:     	je	0x1453f3dad <.text+0x53f2dad>
1453f3d9b:     	movq	0xb00(%rsi), %rcx
1453f3da2:     	movl	$0x1, %r8d
1453f3da8:     	callq	0x1400021d0 <.text+0x11d0>
1453f3dad:     	movaps	0x1bd0(%rbp), %xmm0
1453f3db4:     	movq	0x1be0(%rbp), %rax
1453f3dbb:     	movq	0x1be8(%rbp), %rcx
1453f3dc2:     	movq	0x1bf0(%rbp), %rdx
1453f3dc9:     	movq	%rdx, 0x20(%r14)
1453f3dcd:     	movq	0x1bf8(%rbp), %rdx
1453f3dd4:     	movq	%rdx, 0x28(%r14)
1453f3dd8:     	movq	%rax, 0x10(%r14)
1453f3ddc:     	movq	%rcx, 0x18(%r14)
1453f3de0:     	movups	%xmm0, (%r14)
1453f3de4:     	movq	%rbx, 0xb10(%rsi)
1453f3deb:     	movb	%r15b, 0xb18(%rsi)
1453f3df2:     	movb	%r12b, 0xb19(%rsi)
1453f3df9:     	movb	%r13b, 0xb1a(%rsi)
1453f3e00:     	movl	0x1c88(%rbp), %eax
1453f3e06:     	movl	%eax, 0xb1b(%rsi)
1453f3e0c:     	movzbl	0x1c8c(%rbp), %eax
1453f3e13:     	movb	%al, 0xb1f(%rsi)
1453f3e19:     	movq	0xb98(%rsi), %rbx
1453f3e20:     	movq	0xad0(%rsi), %rax
1453f3e27:     	movq	0xad8(%rsi), %r14
1453f3e2e:     	leaq	(,%r14,8), %rcx
1453f3e36:     	xorl	%edx, %edx
1453f3e38:     	nopl	(%rax,%rax)
1453f3e40:     	cmpq	%rdx, %rcx
1453f3e43:     	je	0x1453f3feb <.text+0x53f2feb>
1453f3e49:     	leaq	0x8(%rdx), %r8
1453f3e4d:     	cmpb	%bl, (%rax,%rdx)
1453f3e50:     	movq	%r8, %rdx
1453f3e53:     	jne	0x1453f3e40 <.text+0x53f2e40>
1453f3e55:     	movq	%rbx, -0x8(%rax,%r8)
1453f3e5a:     	jmp	0x1453f4015 <.text+0x53f3015>
1453f3e5f:     	movq	(%r12), %rax
1453f3e63:     	testq	%rax, %rax
1453f3e66:     	je	0x1453f3e82 <.text+0x53f2e82>
1453f3e68:     	movq	0xab8(%rsi), %rcx
1453f3e6f:     	shlq	$0x3, %rax
1453f3e73:     	leaq	(%rax,%rax,2), %rdx
1453f3e77:     	movl	$0x8, %r8d
1453f3e7d:     	callq	0x1400021d0 <.text+0x11d0>
1453f3e82:     	movq	0x1260(%rbp), %rax
1453f3e89:     	movq	%rax, 0x10(%r12)
1453f3e8e:     	movups	0x1250(%rbp), %xmm0
1453f3e95:     	movups	%xmm0, (%r12)
1453f3e9a:     	movq	%rbx, %rcx
1453f3e9d:     	callq	0x1453fe8c0 <.text+0x53fd8c0>
1453f3ea2:     	nop
1453f3ea3:     	movq	0x1cb0(%rbp), %rbx
1453f3eaa:     	testq	%r15, %r15
1453f3ead:     	je	0x1453f3ee2 <.text+0x53f2ee2>
1453f3eaf:     	leaq	0x8(%rdi), %rsi
1453f3eb3:     	jmp	0x1453f3ec9 <.text+0x53f2ec9>
1453f3eb5:     	nopw	%cs:(%rax,%rax)
1453f3ec0:     	addq	$0x18, %rsi
1453f3ec4:     	decq	%r15
1453f3ec7:     	je	0x1453f3ee2 <.text+0x53f2ee2>
1453f3ec9:     	movq	-0x8(%rsi), %rdx
1453f3ecd:     	testq	%rdx, %rdx
1453f3ed0:     	je	0x1453f3ec0 <.text+0x53f2ec0>
1453f3ed2:     	movq	(%rsi), %rcx
1453f3ed5:     	movl	$0x1, %r8d
1453f3edb:     	callq	0x1400021d0 <.text+0x11d0>
1453f3ee0:     	jmp	0x1453f3ec0 <.text+0x53f2ec0>
1453f3ee2:     	testq	%rbx, %rbx
1453f3ee5:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f3eeb:     	shlq	$0x3, %rbx
1453f3eef:     	leaq	(%rbx,%rbx,2), %rdx
1453f3ef3:     	movl	$0x8, %r8d
1453f3ef9:     	movq	%rdi, %rcx
1453f3efc:     	addq	$0x1d48, %rsp           # imm = 0x1D48
1453f3f03:     	popq	%rbx
1453f3f04:     	popq	%rdi
1453f3f05:     	popq	%rsi
1453f3f06:     	popq	%r12
1453f3f08:     	popq	%r13
1453f3f0a:     	popq	%r14
1453f3f0c:     	popq	%r15
1453f3f0e:     	popq	%rbp
1453f3f0f:     	jmp	0x1400021d0 <.text+0x11d0>
1453f3f14:     	movq	%rdi, %r14
1453f3f17:     	movzbl	0x9e4(%rbp), %ebx
1453f3f1e:     	movq	0x1c88(%rbp), %rdx
1453f3f25:     	testq	%rdx, %rdx
1453f3f28:     	je	0x1453f3f40 <.text+0x53f2f40>
1453f3f2a:     	shlq	$0x2, %rdx
1453f3f2e:     	movl	$0x4, %r8d
1453f3f34:     	movq	0x1cb0(%rbp), %rcx
1453f3f3b:     	callq	0x1400021d0 <.text+0x11d0>
1453f3f40:     	leaq	0x9e5(%rbp), %rcx
1453f3f47:     	movq	0x9f8(%rsi), %r15
1453f3f4e:     	movq	0xa00(%rsi), %r12
1453f3f55:     	imulq	$0xe8, %r12, %r13
1453f3f5c:     	xorl	%eax, %eax
1453f3f5e:     	nop
1453f3f60:     	cmpq	%rax, %r13
1453f3f63:     	je	0x1453f4106 <.text+0x53f3106>
1453f3f69:     	leaq	0xe8(%rax), %rdi
1453f3f70:     	cmpb	%bl, 0xe4(%r15,%rax)
1453f3f78:     	movq	%rdi, %rax
1453f3f7b:     	jne	0x1453f3f60 <.text+0x53f2f60>
1453f3f7d:     	movq	%rcx, %rsi
1453f3f80:     	leaq	(%r15,%rdi), %rcx
1453f3f84:     	addq	$-0xe8, %rcx
1453f3f8b:     	leaq	0x900(%rbp), %rdx
1453f3f92:     	movl	$0xe4, %r8d
1453f3f98:     	callq	0x1457149fd <.text+0x57139fd>
1453f3f9d:     	movzwl	(%rsi), %eax
1453f3fa0:     	movw	%ax, -0x3(%r15,%rdi)
1453f3fa6:     	movzbl	0x2(%rsi), %eax
1453f3faa:     	movb	%al, -0x1(%r15,%rdi)
1453f3faf:     	jmp	0x1453f4165 <.text+0x53f3165>
1453f3fb4:     	cmpq	0xac8(%rsi), %r14
1453f3fbb:     	jne	0x1453f3fd0 <.text+0x53f2fd0>
1453f3fbd:     	leaq	0xac8(%rsi), %rcx
1453f3fc4:     	callq	0x14588a110 <.text+0x5889110>
1453f3fc9:     	movq	0xad0(%rsi), %rax
1453f3fd0:     	movq	%rbx, (%rax,%r14,8)
1453f3fd4:     	incq	%r14
1453f3fd7:     	movq	%r14, 0xad8(%rsi)
1453f3fde:     	movq	%rdi, %rcx
1453f3fe1:     	callq	0x1453fe8c0 <.text+0x53fd8c0>
1453f3fe6:     	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f3feb:     	cmpq	0xac8(%rsi), %r14
1453f3ff2:     	jne	0x1453f4007 <.text+0x53f3007>
1453f3ff4:     	leaq	0xac8(%rsi), %rcx
1453f3ffb:     	callq	0x14588a110 <.text+0x5889110>
1453f4000:     	movq	0xad0(%rsi), %rax
1453f4007:     	movq	%rbx, (%rax,%r14,8)
1453f400b:     	incq	%r14
1453f400e:     	movq	%r14, 0xad8(%rsi)
1453f4015:     	movq	%rdi, %rcx
1453f4018:     	callq	0x1453fe8c0 <.text+0x53fd8c0>
1453f401d:     	movq	0xed0(%rsi), %rdi
1453f4024:     	movq	0xed8(%rsi), %rsi
1453f402b:     	callq	0x140002200 <.text+0x1200>
1453f4030:     	movl	$0x1, %ecx
1453f4035:     	movl	$0x1, %edx
1453f403a:     	callq	0x1400021c0 <.text+0x11c0>
1453f403f:     	testq	%rax, %rax
1453f4042:     	je	0x1453f4a5c <.text+0x53f3a5c>
1453f4048:     	movb	$0x7b, (%rax)
1453f404b:     	movq	$0x1, 0x900(%rbp)
1453f4056:     	movq	%rax, 0x908(%rbp)
1453f405d:     	movq	$0x1, 0x910(%rbp)
1453f4068:     	movb	$0x1, 0x918(%rbp)
1453f406f:     	leaq	0x12e6a2e(%rip), %rax   # 0x1466daaa4
1453f4076:     	movq	%rax, 0x20(%rsp)
1453f407b:     	movq	$0x6, 0x28(%rsp)
1453f4084:     	leaq	0x12e6560(%rip), %r8    # 0x1466da5eb
1453f408b:     	leaq	0x1250(%rbp), %rcx
1453f4092:     	leaq	0x900(%rbp), %rdx
1453f4099:     	movl	$0x4, %r9d
1453f409f:     	callq	0x145426da0 <.text+0x5425da0>
1453f40a4:     	movq	0x1250(%rbp), %rax
1453f40ab:     	movq	0x1260(%rbp), %r8
1453f40b2:     	movq	%rax, 0x1cb0(%rbp)
1453f40b9:     	cmpq	%r8, %rax
1453f40bc:     	je	0x1453f4a1e <.text+0x53f3a1e>
1453f40c2:     	movq	0x1258(%rbp), %rdx
1453f40c9:     	movb	$0x7d, (%rdx,%r8)
1453f40ce:     	incq	%r8
1453f40d1:     	movq	%rdi, %rcx
1453f40d4:     	movq	%rdx, 0x1ca8(%rbp)
1453f40db:     	callq	*0x18(%rsi)
1453f40de:     	nop
1453f40df:     	movq	0x1cb0(%rbp), %rdx
1453f40e6:     	testq	%rdx, %rdx
1453f40e9:     	je	0x1453f4a0a <.text+0x53f3a0a>
1453f40ef:     	movl	$0x1, %r8d
1453f40f5:     	movq	0x1ca8(%rbp), %rcx
1453f40fc:     	callq	0x1400021d0 <.text+0x11d0>
1453f4101:     	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f4106:     	movq	%rcx, %rdi
1453f4109:     	cmpq	0x9f0(%rsi), %r12
1453f4110:     	jne	0x1453f4125 <.text+0x53f3125>
1453f4112:     	leaq	0x9f0(%rsi), %rcx
1453f4119:     	callq	0x14588a0a0 <.text+0x58890a0>
1453f411e:     	movq	0x9f8(%rsi), %r15
1453f4125:     	leaq	(%r15,%r13), %rcx
1453f4129:     	leaq	0x900(%rbp), %rdx
1453f4130:     	movl	$0xe4, %r8d
1453f4136:     	callq	0x1457149fd <.text+0x57139fd>
1453f413b:     	movb	%bl, 0xe4(%r15,%r13)
1453f4143:     	movzwl	(%rdi), %eax
1453f4146:     	movw	%ax, 0xe5(%r15,%r13)
1453f414f:     	movzbl	0x2(%rdi), %eax
1453f4153:     	movb	%al, 0xe7(%r15,%r13)
1453f415b:     	incq	%r12
1453f415e:     	movq	%r12, 0xa00(%rsi)
1453f4165:     	movq	%r14, %rcx
1453f4168:     	callq	0x1453fe8c0 <.text+0x53fd8c0>
1453f416d:     	jmp	0x1453f4a0a <.text+0x53f3a0a>
1453f4172:     	movq	0x900(%rbp), %rdx
1453f4179:     	testq	%rdx, %rdx
1453f417c:     	je	0x1453f4194 <.text+0x53f3194>
1453f417e:     	movq	0x908(%rbp), %rcx
1453f4185:     	shlq	$0x3, %rdx
1453f4189:     	movl	$0x8, %r8d
1453f418f:     	callq	0x1400021d0 <.text+0x11d0>
1453f4194:     	cmpq	$-0x1, 0xae0(%rsi)
1453f419c:     	je	0x1453f42f9 <.text+0x53f32f9>
1453f41a2:     	leaq	0xae0(%rsi), %rdx
1453f41a9:     	movb	0xb18(%rsi), %bl
1453f41af:     	movb	0xb19(%rsi), %dil
1453f41b6:     	movb	0xb1a(%rsi), %r14b
1453f41bd:     	leaq	-0x50(%rbp), %rcx
1453f41c1:     	callq	0x1456ca060 <.text+0x56c9060>
1453f41c6:     	leaq	0xaf8(%rsi), %rdx
1453f41cd:     	leaq	0x1250(%rbp), %rcx
1453f41d4:     	callq	0x1456ca060 <.text+0x56c9060>
1453f41d9:     	nop
1453f41da:     	movzbl	0xb1f(%rsi), %eax
1453f41e1:     	movb	%al, 0x93f(%rbp)
1453f41e7:     	movl	0xb1b(%rsi), %eax
1453f41ed:     	movl	%eax, 0x93b(%rbp)
1453f41f3:     	movq	0xb10(%rsi), %rax
1453f41fa:     	movq	-0x40(%rbp), %rcx
1453f41fe:     	movq	%rcx, 0x1bb0(%rbp)
1453f4205:     	movups	-0x50(%rbp), %xmm0
1453f4209:     	movaps	%xmm0, 0x1ba0(%rbp)
1453f4210:     	movq	0x1260(%rbp), %rcx
1453f4217:     	movq	%rcx, 0x1bc8(%rbp)
1453f421e:     	movups	0x1250(%rbp), %xmm1
1453f4225:     	movups	%xmm1, 0x1bb8(%rbp)
1453f422c:     	movaps	%xmm0, 0x900(%rbp)
