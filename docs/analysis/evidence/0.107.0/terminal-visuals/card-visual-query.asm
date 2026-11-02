
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403d33d0:     	pushq	%rbp
1403d33d1:     	pushq	%r15
1403d33d3:     	pushq	%r14
1403d33d5:     	pushq	%r12
1403d33d7:     	pushq	%rsi
1403d33d8:     	pushq	%rdi
1403d33d9:     	pushq	%rbx
1403d33da:     	subq	$0x2f0, %rsp            # imm = 0x2F0
1403d33e1:     	leaq	0x80(%rsp), %rbp
1403d33e9:     	movq	$-0x2, 0x268(%rbp)
1403d33f4:     	movq	%rdx, %rdi
1403d33f7:     	movq	%rcx, %rsi
1403d33fa:     	movq	%rdx, %rcx
1403d33fd:     	callq	0x140332160 <.text+0x331160>
1403d3402:     	movq	%rax, %rbx
1403d3405:     	movq	%rdi, %rcx
1403d3408:     	callq	0x14031df50 <.text+0x31cf50>
1403d340d:     	movq	%rax, %r14
1403d3410:     	movq	%rdi, %rcx
1403d3413:     	callq	0x14031ce70 <.text+0x31be70>
1403d3418:     	movq	%rax, %r15
1403d341b:     	movq	%rdi, %rcx
1403d341e:     	callq	0x140321ba0 <.text+0x320ba0>
1403d3423:     	movq	%rax, %r12
1403d3426:     	movq	%rdi, %rcx
1403d3429:     	callq	0x14031ea30 <.text+0x31da30>
1403d342e:     	movq	%rbx, 0x238(%rbp)
1403d3435:     	movq	%r14, 0x240(%rbp)
1403d343c:     	movq	%r15, 0x248(%rbp)
1403d3443:     	movq	%r12, 0x250(%rbp)
1403d344a:     	movq	%rax, 0x258(%rbp)
1403d3451:     	leaq	0x50(%rbp), %rbx
1403d3455:     	movq	%rbx, %rcx
1403d3458:     	callq	0x144e7aad0 <.text+0x4e79ad0>
1403d345d:     	movb	$0x1, 0x267(%rbp)
1403d3464:     	leaq	0x238(%rbp), %rcx
1403d346b:     	movq	%rbx, %rdx
1403d346e:     	callq	0x1401bc780 <.text+0x1bb780>
1403d3473:     	nop
1403d3474:     	movb	$0x1, 0x267(%rbp)
1403d347b:     	leaq	-0x60(%rbp), %rcx
1403d347f:     	callq	0x144e7aad0 <.text+0x4e79ad0>
1403d3484:     	nop
1403d3485:     	leaq	0x50(%rbp), %rcx
1403d3489:     	leaq	-0x60(%rbp), %rdx
1403d348d:     	callq	0x144e74520 <.text+0x4e73520>
1403d3492:     	nop
1403d3493:     	movb	$0x1, %bl
1403d3495:     	cmpq	$0x0, 0x90(%rdi)
1403d349d:     	je	0x1403d35a4 <.text+0x3d25a4>
1403d34a3:     	movq	0x78(%rdi), %rax
1403d34a7:     	movq	0x80(%rdi), %rcx
1403d34ae:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
1403d34b8:     	xorl	%r8d, %r8d
1403d34bb:     	movdqa	0x5a2217d(%rip), %xmm0  # 0x145df5640
1403d34c3:     	pcmpeqd	%xmm1, %xmm1
1403d34c7:     	movdqa	0x5a2d331(%rip), %xmm2  # 0x145e00800
1403d34cf:     	andq	%rcx, %rdx
1403d34d2:     	movdqu	(%rax,%rdx), %xmm3
1403d34d7:     	movdqa	%xmm3, %xmm4
1403d34db:     	pcmpeqb	%xmm0, %xmm4
1403d34df:     	pmovmskb	%xmm4, %r9d
1403d34e4:     	testl	%r9d, %r9d
1403d34e7:     	je	0x1403d3530 <.text+0x3d2530>
1403d34e9:     	tzcntl	%r9d, %r10d
1403d34ee:     	addq	%rdx, %r10
1403d34f1:     	andq	%rcx, %r10
1403d34f4:     	negq	%r10
1403d34f7:     	leaq	(%r10,%r10,2), %r10
1403d34fb:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1403d3502:     	pcmpeqb	%xmm2, %xmm4
1403d3506:     	pmovmskb	%xmm4, %r11d
1403d350b:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1403d3512:     	je	0x1403d354b <.text+0x3d254b>
1403d3514:     	leal	-0x1(%r9), %r10d
1403d3518:     	andw	%r9w, %r10w
1403d351c:     	movl	%r10d, %r9d
1403d351f:     	jne	0x1403d34e9 <.text+0x3d24e9>
1403d3521:     	nopw	%cs:(%rax,%rax)
1403d3530:     	pcmpeqb	%xmm1, %xmm3
1403d3534:     	pmovmskb	%xmm3, %r9d
1403d3539:     	testl	%r9d, %r9d
1403d353c:     	jne	0x1403d35a4 <.text+0x3d25a4>
1403d353e:     	addq	%r8, %rdx
1403d3541:     	addq	$0x10, %rdx
1403d3545:     	addq	$0x10, %r8
1403d3549:     	jmp	0x1403d34cf <.text+0x3d24cf>
1403d354b:     	leaq	(%rax,%r10,8), %rax
1403d354f:     	movq	-0x8(%rax), %rax
1403d3553:     	cmpq	0x218(%rdi), %rax
1403d355a:     	jae	0x1403d35a4 <.text+0x3d25a4>
1403d355c:     	movq	0x210(%rdi), %rcx
1403d3563:     	movq	(%rcx,%rax,8), %rcx
1403d3567:     	testq	%rcx, %rcx
1403d356a:     	je	0x1403d35a4 <.text+0x3d25a4>
1403d356c:     	movq	0x1e0(%rdi), %rax
1403d3573:     	notq	%rcx
1403d3576:     	imulq	$0x38, %rcx, %rcx
1403d357a:     	cmpb	$0x1, 0x30(%rax,%rcx)
1403d357f:     	jne	0x1403d35a4 <.text+0x3d25a4>
1403d3581:     	addq	%rcx, %rax
1403d3584:     	movq	0x10(%rax), %rbx
1403d3588:     	leaq	0x50(%rbp), %rdx
1403d358c:     	movq	%rbx, %rcx
1403d358f:     	callq	0x144e03180 <.text+0x4e02180>
1403d3594:     	nop
1403d3595:     	leaq	0x40(%rdi), %rdx
1403d3599:     	movq	%rbx, %rcx
1403d359c:     	callq	0x144e032e0 <.text+0x4e022e0>
1403d35a1:     	nop
1403d35a2:     	movl	%eax, %ebx
1403d35a4:     	movq	0x5a0(%rdi), %r14
1403d35ab:     	leaq	0x140(%rbp), %rcx
1403d35b2:     	leaq	0x50(%rbp), %rdx
1403d35b6:     	movl	$0xb0, %r8d
1403d35bc:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1403d35c1:     	movq	%r14, 0x100(%rbp)
1403d35c8:     	movl	$0x0, 0x108(%rbp)
1403d35d2:     	movq	$0x10, 0x110(%rbp)
1403d35dd:     	pxor	%xmm0, %xmm0
1403d35e1:     	movdqu	%xmm0, 0x118(%rbp)
1403d35e9:     	movq	$0x10, 0x128(%rbp)
1403d35f4:     	movdqu	%xmm0, 0x130(%rbp)
1403d35fc:     	movq	$0x0, 0x1f0(%rbp)
1403d3607:     	movq	$0x4, 0x1f8(%rbp)
1403d3612:     	movq	$0x0, 0x200(%rbp)
1403d361d:     	movb	%bl, 0x208(%rbp)
1403d3623:     	movdqu	0x238(%rbp), %xmm0
1403d362b:     	movdqu	0x248(%rbp), %xmm1
1403d3633:     	movdqu	%xmm0, 0x210(%rbp)
1403d363b:     	movdqu	%xmm1, 0x220(%rbp)
1403d3643:     	movq	0x258(%rbp), %rax
1403d364a:     	movq	%rax, 0x230(%rbp)
1403d3651:     	movb	$0x0, 0x267(%rbp)
1403d3658:     	leaq	-0x60(%rbp), %rcx
1403d365c:     	callq	0x1403b24f0 <.text+0x3b14f0>
1403d3661:     	nop
1403d3662:     	leaq	0x100(%rbp), %rcx
1403d3669:     	movq	%rdi, %rdx
1403d366c:     	callq	0x1403cb110 <.text+0x3ca110>
1403d3671:     	nop
1403d3672:     	leaq	0x100(%rbp), %rdx
1403d3679:     	movl	$0x138, %r8d            # imm = 0x138
1403d367f:     	movq	%rsi, %rcx
1403d3682:     	callq	0x145bf1d41 <.text+0x5bf0d41>
1403d3687:     	movq	%rsi, %rax
1403d368a:     	addq	$0x2f0, %rsp            # imm = 0x2F0
1403d3691:     	popq	%rbx
1403d3692:     	popq	%rdi
1403d3693:     	popq	%rsi
1403d3694:     	popq	%r12
1403d3696:     	popq	%r14
1403d3698:     	popq	%r15
1403d369a:     	popq	%rbp
1403d369b:     	retq
