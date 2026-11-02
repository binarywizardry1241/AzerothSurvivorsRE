
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e3550:     	pushq	%rbp
1454e3551:     	pushq	%r15
1454e3553:     	pushq	%r14
1454e3555:     	pushq	%r13
1454e3557:     	pushq	%r12
1454e3559:     	pushq	%rsi
1454e355a:     	pushq	%rdi
1454e355b:     	pushq	%rbx
1454e355c:     	subq	$0xb8, %rsp
1454e3563:     	leaq	0x80(%rsp), %rbp
1454e356b:     	movq	$-0x2, 0x30(%rbp)
1454e3573:     	movq	0x4e8(%rcx), %rax
1454e357a:     	testq	%rax, %rax
1454e357d:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e3583:     	movq	0x4e0(%rcx), %rsi
1454e358a:     	imulq	$0x160, %rax, %rax      # imm = 0x160
1454e3591:     	jmp	0x1454e35b3 <.text+0x54e25b3>
1454e3593:     	nopw	%cs:(%rax,%rax)
1454e35a0:     	addq	$0x160, %rsi            # imm = 0x160
1454e35a7:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454e35ad:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e35b3:     	cmpq	%rdx, 0x88(%rsi)
1454e35ba:     	jne	0x1454e35a0 <.text+0x54e25a0>
1454e35bc:     	cmpl	$0x1, 0x68(%rsi)
1454e35c0:     	je	0x1454e35a0 <.text+0x54e25a0>
1454e35c2:     	movl	0xb0(%rsi), %r15d
1454e35c9:     	testb	%r9b, %r9b
1454e35cc:     	je	0x1454e375b <.text+0x54e275b>
1454e35d2:     	movdqu	0xb4(%rsi), %xmm1
1454e35da:     	movdqu	0xc4(%rsi), %xmm0
1454e35e2:     	movd	%r8d, %xmm2
1454e35e7:     	pshufd	$0x0, %xmm2, %xmm2      # xmm2 = xmm2[0,0,0,0]
1454e35ec:     	movdqa	%xmm0, %xmm3
1454e35f0:     	pcmpeqd	%xmm2, %xmm3
1454e35f4:     	pcmpeqd	%xmm1, %xmm2
1454e35f8:     	packssdw	%xmm3, %xmm2
1454e35fc:     	pmovmskb	%xmm2, %eax
1454e3600:     	testl	%eax, %eax
1454e3602:     	jne	0x1454e3c16 <.text+0x54e2c16>
1454e3608:     	movl	0xd4(%rsi), %eax
1454e360e:     	cmpl	%r8d, %eax
1454e3611:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e3617:     	movl	0xd8(%rsi), %r9d
1454e361e:     	cmpl	%r8d, %r9d
1454e3621:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e3627:     	movl	0xdc(%rsi), %r10d
1454e362e:     	cmpl	%r8d, %r10d
1454e3631:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e3637:     	movl	0xe0(%rsi), %r11d
1454e363e:     	cmpl	%r8d, %r11d
1454e3641:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e3647:     	movl	0xe4(%rsi), %edi
1454e364d:     	cmpl	%r8d, %edi
1454e3650:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e3656:     	movl	0xe8(%rsi), %ebx
1454e365c:     	cmpl	%r8d, %ebx
1454e365f:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e3665:     	movl	0xec(%rsi), %r14d
1454e366c:     	cmpl	%r8d, %r14d
1454e366f:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e3675:     	cmpl	%r8d, %r15d
1454e3678:     	je	0x1454e3c16 <.text+0x54e2c16>
1454e367e:     	testl	%r15d, %r15d
1454e3681:     	je	0x1454e3874 <.text+0x54e2874>
1454e3687:     	movd	%xmm1, %r15d
1454e368c:     	testl	%r15d, %r15d
1454e368f:     	je	0x1454e3878 <.text+0x54e2878>
1454e3695:     	pshufd	$0x55, %xmm1, %xmm2     # xmm2 = xmm1[1,1,1,1]
1454e369a:     	movd	%xmm2, %r15d
1454e369f:     	testl	%r15d, %r15d
1454e36a2:     	je	0x1454e387f <.text+0x54e287f>
1454e36a8:     	pshufd	$0xee, %xmm1, %xmm2     # xmm2 = xmm1[2,3,2,3]
1454e36ad:     	movd	%xmm2, %r15d
1454e36b2:     	testl	%r15d, %r15d
1454e36b5:     	je	0x1454e3886 <.text+0x54e2886>
1454e36bb:     	pshufd	$0xff, %xmm1, %xmm1     # xmm1 = xmm1[3,3,3,3]
1454e36c0:     	movd	%xmm1, %r15d
1454e36c5:     	testl	%r15d, %r15d
1454e36c8:     	je	0x1454e388d <.text+0x54e288d>
1454e36ce:     	movd	%xmm0, %r15d
1454e36d3:     	testl	%r15d, %r15d
1454e36d6:     	je	0x1454e3894 <.text+0x54e2894>
1454e36dc:     	pshufd	$0x55, %xmm0, %xmm1     # xmm1 = xmm0[1,1,1,1]
1454e36e1:     	movd	%xmm1, %r15d
1454e36e6:     	testl	%r15d, %r15d
1454e36e9:     	je	0x1454e389b <.text+0x54e289b>
1454e36ef:     	pshufd	$0xee, %xmm0, %xmm1     # xmm1 = xmm0[2,3,2,3]
1454e36f4:     	movd	%xmm1, %r15d
1454e36f9:     	testl	%r15d, %r15d
1454e36fc:     	je	0x1454e38a2 <.text+0x54e28a2>
1454e3702:     	pshufd	$0xff, %xmm0, %xmm0     # xmm0 = xmm0[3,3,3,3]
1454e3707:     	movd	%xmm0, %r15d
1454e370c:     	testl	%r15d, %r15d
1454e370f:     	je	0x1454e38a9 <.text+0x54e28a9>
1454e3715:     	testl	%eax, %eax
1454e3717:     	je	0x1454e38b0 <.text+0x54e28b0>
1454e371d:     	testl	%r9d, %r9d
1454e3720:     	je	0x1454e38b7 <.text+0x54e28b7>
1454e3726:     	testl	%r10d, %r10d
1454e3729:     	je	0x1454e38be <.text+0x54e28be>
1454e372f:     	testl	%r11d, %r11d
1454e3732:     	je	0x1454e38c5 <.text+0x54e28c5>
1454e3738:     	testl	%edi, %edi
1454e373a:     	je	0x1454e38cc <.text+0x54e28cc>
1454e3740:     	testl	%ebx, %ebx
1454e3742:     	je	0x1454e38d3 <.text+0x54e28d3>
1454e3748:     	testl	%r14d, %r14d
1454e374b:     	jne	0x1454e3c16 <.text+0x54e2c16>
1454e3751:     	movl	$0xf, %edi
1454e3756:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e375b:     	xorl	%eax, %eax
1454e375d:     	cmpl	%r8d, %r15d
1454e3760:     	jne	0x1454e3769 <.text+0x54e2769>
1454e3762:     	xorl	%edi, %edi
1454e3764:     	jmp	0x1454e38db <.text+0x54e28db>
1454e3769:     	movl	$0x1, %edi
1454e376e:     	cmpl	%r8d, 0xb4(%rsi)
1454e3775:     	je	0x1454e38db <.text+0x54e28db>
1454e377b:     	movl	$0x2, %edi
1454e3780:     	cmpl	%r8d, 0xb8(%rsi)
1454e3787:     	je	0x1454e38db <.text+0x54e28db>
1454e378d:     	movl	$0x3, %edi
1454e3792:     	cmpl	%r8d, 0xbc(%rsi)
1454e3799:     	je	0x1454e38db <.text+0x54e28db>
1454e379f:     	movl	$0x4, %edi
1454e37a4:     	cmpl	%r8d, 0xc0(%rsi)
1454e37ab:     	je	0x1454e38db <.text+0x54e28db>
1454e37b1:     	movl	$0x5, %edi
1454e37b6:     	cmpl	%r8d, 0xc4(%rsi)
1454e37bd:     	je	0x1454e38db <.text+0x54e28db>
1454e37c3:     	movl	$0x6, %edi
1454e37c8:     	cmpl	%r8d, 0xc8(%rsi)
1454e37cf:     	je	0x1454e38db <.text+0x54e28db>
1454e37d5:     	movl	$0x7, %edi
1454e37da:     	cmpl	%r8d, 0xcc(%rsi)
1454e37e1:     	je	0x1454e38db <.text+0x54e28db>
1454e37e7:     	movl	$0x8, %edi
1454e37ec:     	cmpl	%r8d, 0xd0(%rsi)
1454e37f3:     	je	0x1454e38db <.text+0x54e28db>
1454e37f9:     	movl	$0x9, %edi
1454e37fe:     	cmpl	%r8d, 0xd4(%rsi)
1454e3805:     	je	0x1454e38db <.text+0x54e28db>
1454e380b:     	movl	$0xa, %edi
1454e3810:     	cmpl	%r8d, 0xd8(%rsi)
1454e3817:     	je	0x1454e38db <.text+0x54e28db>
1454e381d:     	movl	$0xb, %edi
1454e3822:     	cmpl	%r8d, 0xdc(%rsi)
1454e3829:     	je	0x1454e38db <.text+0x54e28db>
1454e382f:     	movl	$0xc, %edi
1454e3834:     	cmpl	%r8d, 0xe0(%rsi)
1454e383b:     	je	0x1454e38db <.text+0x54e28db>
1454e3841:     	movl	$0xd, %edi
1454e3846:     	cmpl	%r8d, 0xe4(%rsi)
1454e384d:     	je	0x1454e38db <.text+0x54e28db>
1454e3853:     	movl	$0xe, %edi
1454e3858:     	cmpl	%r8d, 0xe8(%rsi)
1454e385f:     	je	0x1454e38db <.text+0x54e28db>
1454e3861:     	movl	$0xf, %edi
1454e3866:     	cmpl	%r8d, 0xec(%rsi)
1454e386d:     	je	0x1454e38db <.text+0x54e28db>
1454e386f:     	jmp	0x1454e3c16 <.text+0x54e2c16>
1454e3874:     	xorl	%edi, %edi
1454e3876:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e3878:     	movl	$0x1, %edi
1454e387d:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e387f:     	movl	$0x2, %edi
1454e3884:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e3886:     	movl	$0x3, %edi
1454e388b:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e388d:     	movl	$0x4, %edi
1454e3892:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e3894:     	movl	$0x5, %edi
1454e3899:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e389b:     	movl	$0x6, %edi
1454e38a0:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e38a2:     	movl	$0x7, %edi
1454e38a7:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e38a9:     	movl	$0x8, %edi
1454e38ae:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e38b0:     	movl	$0x9, %edi
1454e38b5:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e38b7:     	movl	$0xa, %edi
1454e38bc:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e38be:     	movl	$0xb, %edi
1454e38c3:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e38c5:     	movl	$0xc, %edi
1454e38ca:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e38cc:     	movl	$0xd, %edi
1454e38d1:     	jmp	0x1454e38d8 <.text+0x54e28d8>
1454e38d3:     	movl	$0xe, %edi
1454e38d8:     	movl	%r8d, %eax
1454e38db:     	movq	%rdx, -0x40(%rbp)
1454e38df:     	movq	%rcx, %r14
1454e38e2:     	movl	%eax, 0xb0(%rsi,%rdi,4)
1454e38e9:     	movq	$0x0, -0x18(%rbp)
1454e38f1:     	movq	$0x0, -0x8(%rbp)
1454e38f9:     	leaq	0x4f(%rdi), %rcx
1454e38fd:     	leaq	-0x18(%rbp), %rdx
1454e3901:     	movq	%rdx, (%rbp)
1454e3905:     	pxor	%xmm0, %xmm0
1454e3909:     	movdqu	%xmm0, 0x8(%rbp)
1454e390e:     	movq	%rcx, 0x20(%rbp)
1454e3912:     	leaq	-0x60(%rbp), %rcx
1454e3916:     	movq	%rbp, %rdx
1454e3919:     	movl	%eax, %r8d
1454e391c:     	callq	0x14552a730 <.text+0x5529730>
1454e3921:     	nop
1454e3922:     	movl	%edi, %eax
1454e3924:     	shrl	$0x3, %eax
1454e3927:     	movl	%eax, %r8d
1454e392a:     	shll	$0x5, %r8d
1454e392e:     	xorl	%edx, %edx
1454e3930:     	cmpl	$0x0, 0xc8(%rsi,%r8)
1454e3939:     	setne	%dl
1454e393c:     	shll	$0x19, %edx
1454e393f:     	xorl	%ecx, %ecx
1454e3941:     	cmpl	$0x0, 0xc4(%rsi,%r8)
1454e394a:     	setne	%cl
1454e394d:     	shll	$0x15, %ecx
1454e3950:     	xorl	%r9d, %r9d
1454e3953:     	cmpl	$0x0, 0xc0(%rsi,%r8)
1454e395c:     	setne	%r9b
1454e3960:     	shll	$0x11, %r9d
1454e3964:     	xorl	%r10d, %r10d
1454e3967:     	cmpl	$0x0, 0xbc(%rsi,%r8)
1454e3970:     	setne	%r10b
1454e3974:     	shll	$0xd, %r10d
1454e3978:     	xorl	%r11d, %r11d
1454e397b:     	cmpl	$0x0, 0xb8(%rsi,%r8)
1454e3984:     	leal	(,%rdi,4), %r13d
1454e398c:     	setne	%r11b
1454e3990:     	shll	$0x9, %r11d
1454e3994:     	xorl	%r12d, %r12d
1454e3997:     	cmpl	$0x0, 0xb4(%rsi,%r8)
1454e39a0:     	setne	%r12b
1454e39a4:     	shll	$0x5, %r12d
1454e39a8:     	xorl	%ebx, %ebx
1454e39aa:     	cmpl	$0x0, 0xb0(%rsi,%r8)
1454e39b3:     	setne	%bl
1454e39b6:     	orl	$0x1c, %r13d
1454e39ba:     	xorl	%r15d, %r15d
1454e39bd:     	cmpl	$0x0, 0xb0(%rsi,%r13)
1454e39c6:     	setne	%r15b
1454e39ca:     	shll	$0x1d, %r15d
1454e39ce:     	orl	%edx, %ecx
1454e39d0:     	orl	%r9d, %ecx
1454e39d3:     	orl	%r10d, %ecx
1454e39d6:     	orl	%r11d, %ecx
1454e39d9:     	orl	%r12d, %ecx
1454e39dc:     	leal	(%rcx,%rbx,2), %r8d
1454e39e0:     	orl	%r15d, %r8d
1454e39e3:     	addl	$0x63, %eax
1454e39e6:     	movq	-0x18(%rbp), %rcx
1454e39ea:     	testq	%rcx, %rcx
1454e39ed:     	je	0x1454e3a51 <.text+0x54e2a51>
1454e39ef:     	movq	-0x10(%rbp), %r9
1454e39f3:     	movzwl	0x36(%rcx), %r10d
1454e39f8:     	movl	%r10d, %r11d
1454e39fb:     	addl	%r11d, %r11d
1454e39fe:     	movq	$-0x1, %rdx
1454e3a05:     	nopw	%cs:(%rax,%rax)
1454e3a10:     	testq	%r11, %r11
1454e3a13:     	je	0x1454e3a3a <.text+0x54e2a3a>
1454e3a15:     	cmpw	0x3a(%rcx,%rdx,2), %ax
1454e3a1a:     	seta	%r12b
1454e3a1e:     	sbbb	$0x0, %r12b
1454e3a22:     	incq	%rdx
1454e3a25:     	addq	$-0x2, %r11
1454e3a29:     	cmpb	$0x1, %r12b
1454e3a2d:     	je	0x1454e3a10 <.text+0x54e2a10>
1454e3a2f:     	movzbl	%r12b, %r10d
1454e3a33:     	testl	%r10d, %r10d
1454e3a36:     	je	0x1454e3a4a <.text+0x54e2a4a>
1454e3a38:     	jmp	0x1454e3a3d <.text+0x54e2a3d>
1454e3a3a:     	movq	%r10, %rdx
1454e3a3d:     	subq	$0x1, %r9
1454e3a41:     	jb	0x1454e3a53 <.text+0x54e2a53>
1454e3a43:     	movq	0x50(%rcx,%rdx,8), %rcx
1454e3a48:     	jmp	0x1454e39f3 <.text+0x54e29f3>
1454e3a4a:     	movl	%r8d, 0x8(%rcx,%rdx,4)
1454e3a4f:     	jmp	0x1454e3a7f <.text+0x54e2a7f>
1454e3a51:     	xorl	%ecx, %ecx
1454e3a53:     	movzwl	%ax, %eax
1454e3a56:     	leaq	-0x18(%rbp), %r9
1454e3a5a:     	movq	%r9, (%rbp)
1454e3a5e:     	movq	%rcx, 0x8(%rbp)
1454e3a62:     	movq	$0x0, 0x10(%rbp)
1454e3a6a:     	movq	%rdx, 0x18(%rbp)
1454e3a6e:     	movq	%rax, 0x20(%rbp)
1454e3a72:     	leaq	-0x60(%rbp), %rcx
1454e3a76:     	movq	%rbp, %rdx
1454e3a79:     	callq	0x14552a730 <.text+0x5529730>
1454e3a7e:     	nop
1454e3a7f:     	shrl	$0x2, %edi
1454e3a82:     	movq	%rsi, %rcx
1454e3a85:     	movq	%rdi, %rdx
1454e3a88:     	callq	0x1454506a0 <.text+0x544f6a0>
1454e3a8d:     	nop
1454e3a8e:     	addl	$0x79, %edi
1454e3a91:     	movq	-0x18(%rbp), %rcx
1454e3a95:     	testq	%rcx, %rcx
1454e3a98:     	je	0x1454e3af0 <.text+0x54e2af0>
1454e3a9a:     	movq	-0x10(%rbp), %r8
1454e3a9e:     	movzwl	0x36(%rcx), %r9d
1454e3aa3:     	movl	%r9d, %r10d
1454e3aa6:     	addl	%r10d, %r10d
1454e3aa9:     	movq	$-0x1, %rdx
1454e3ab0:     	testq	%r10, %r10
1454e3ab3:     	je	0x1454e3ada <.text+0x54e2ada>
1454e3ab5:     	cmpw	0x3a(%rcx,%rdx,2), %di
1454e3aba:     	seta	%r11b
1454e3abe:     	sbbb	$0x0, %r11b
1454e3ac2:     	incq	%rdx
1454e3ac5:     	addq	$-0x2, %r10
1454e3ac9:     	cmpb	$0x1, %r11b
1454e3acd:     	je	0x1454e3ab0 <.text+0x54e2ab0>
1454e3acf:     	movzbl	%r11b, %r9d
1454e3ad3:     	testl	%r9d, %r9d
1454e3ad6:     	je	0x1454e3aea <.text+0x54e2aea>
1454e3ad8:     	jmp	0x1454e3add <.text+0x54e2add>
1454e3ada:     	movq	%r9, %rdx
1454e3add:     	subq	$0x1, %r8
1454e3ae1:     	jb	0x1454e3af2 <.text+0x54e2af2>
1454e3ae3:     	movq	0x50(%rcx,%rdx,8), %rcx
1454e3ae8:     	jmp	0x1454e3a9e <.text+0x54e2a9e>
1454e3aea:     	movl	%eax, 0x8(%rcx,%rdx,4)
1454e3aee:     	jmp	0x1454e3b22 <.text+0x54e2b22>
1454e3af0:     	xorl	%ecx, %ecx
1454e3af2:     	movzwl	%di, %r8d
1454e3af6:     	leaq	-0x18(%rbp), %r9
1454e3afa:     	movq	%r9, (%rbp)
1454e3afe:     	movq	%rcx, 0x8(%rbp)
1454e3b02:     	movq	$0x0, 0x10(%rbp)
1454e3b0a:     	movq	%rdx, 0x18(%rbp)
1454e3b0e:     	movq	%r8, 0x20(%rbp)
1454e3b12:     	leaq	-0x60(%rbp), %rcx
1454e3b16:     	movq	%rbp, %rdx
1454e3b19:     	movl	%eax, %r8d
1454e3b1c:     	callq	0x14552a730 <.text+0x5529730>
1454e3b21:     	nop
1454e3b22:     	movl	$0x0, -0x20(%rbp)
1454e3b29:     	movq	$0x0, -0x38(%rbp)
1454e3b31:     	movq	$0x1, -0x30(%rbp)
1454e3b39:     	movq	$0x0, -0x28(%rbp)
1454e3b41:     	cmpq	$0x0, -0x8(%rbp)
1454e3b46:     	je	0x1454e3b8c <.text+0x54e2b8c>
1454e3b48:     	movb	$0x1, 0x2f(%rbp)
1454e3b4c:     	leaq	-0x38(%rbp), %rcx
1454e3b50:     	callq	0x145903690 <.text+0x5902690>
1454e3b55:     	nop
1454e3b56:     	movq	-0x30(%rbp), %rax
1454e3b5a:     	movb	$0x0, (%rax)
1454e3b5d:     	movq	$0x1, -0x28(%rbp)
1454e3b65:     	movb	$0x1, 0x2f(%rbp)
1454e3b69:     	leaq	-0x38(%rbp), %rdx
1454e3b6d:     	movq	-0x40(%rbp), %rcx
1454e3b71:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454e3b76:     	nop
1454e3b77:     	movb	$0x1, 0x2f(%rbp)
1454e3b7b:     	leaq	-0x18(%rbp), %rcx
1454e3b7f:     	leaq	-0x38(%rbp), %rdx
1454e3b83:     	callq	0x145513880 <.text+0x5512880>
1454e3b88:     	nop
1454e3b89:     	incl	-0x20(%rbp)
1454e3b8c:     	movq	-0x38(%rbp), %rax
1454e3b90:     	movq	-0x30(%rbp), %rcx
1454e3b94:     	movq	-0x28(%rbp), %rdx
1454e3b98:     	movq	%rdx, 0x10(%rbp)
1454e3b9c:     	movl	-0x20(%rbp), %edx
1454e3b9f:     	movl	%edx, 0x18(%rbp)
1454e3ba2:     	movl	-0x1c(%rbp), %edx
1454e3ba5:     	movl	%edx, 0x1c(%rbp)
1454e3ba8:     	movq	%rax, (%rbp)
1454e3bac:     	movq	%rcx, 0x8(%rbp)
1454e3bb0:     	movb	$0x0, 0x2f(%rbp)
1454e3bb4:     	leaq	-0x60(%rbp), %rcx
1454e3bb8:     	movq	%rbp, %rdx
1454e3bbb:     	callq	0x145512ef0 <.text+0x5511ef0>
1454e3bc0:     	nop
1454e3bc1:     	movq	%r14, %rax
1454e3bc4:     	movq	0x560(%r14), %rsi
1454e3bcb:     	cmpq	0x550(%r14), %rsi
1454e3bd2:     	jne	0x1454e3be3 <.text+0x54e2be3>
1454e3bd4:     	leaq	0x550(%rax), %rcx
1454e3bdb:     	callq	0x145774710 <.text+0x5773710>
1454e3be0:     	movq	%r14, %rax
1454e3be3:     	movq	0x558(%rax), %rcx
1454e3bea:     	movq	%rsi, %rdx
1454e3bed:     	shlq	$0x5, %rdx
1454e3bf1:     	movups	-0x60(%rbp), %xmm0
1454e3bf5:     	movups	-0x50(%rbp), %xmm1
1454e3bf9:     	movups	%xmm1, 0x10(%rcx,%rdx)
1454e3bfe:     	movups	%xmm0, (%rcx,%rdx)
1454e3c02:     	incq	%rsi
1454e3c05:     	movq	%rsi, 0x560(%rax)
1454e3c0c:     	leaq	-0x18(%rbp), %rcx
1454e3c10:     	callq	0x14550cd20 <.text+0x550bd20>
1454e3c15:     	nop
1454e3c16:     	addq	$0xb8, %rsp
1454e3c1d:     	popq	%rbx
1454e3c1e:     	popq	%rdi
1454e3c1f:     	popq	%rsi
1454e3c20:     	popq	%r12
1454e3c22:     	popq	%r13
1454e3c24:     	popq	%r14
1454e3c26:     	popq	%r15
1454e3c28:     	popq	%rbp
1454e3c29:     	retq
