
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544f710:     	pushq	%rbp
14544f711:     	pushq	%r15
14544f713:     	pushq	%r14
14544f715:     	pushq	%r13
14544f717:     	pushq	%r12
14544f719:     	pushq	%rsi
14544f71a:     	pushq	%rdi
14544f71b:     	pushq	%rbx
14544f71c:     	subq	$0xd38, %rsp            # imm = 0xD38
14544f723:     	leaq	0x80(%rsp), %rbp
14544f72b:     	movaps	%xmm6, 0xca0(%rbp)
14544f732:     	movq	$-0x2, 0xc98(%rbp)
14544f73d:     	movq	%rcx, %rdi
14544f740:     	cmpq	$-0x1, 0xdf8(%rdx)
14544f748:     	je	0x14544f7c2 <.text+0x544e7c2>
14544f74a:     	movq	%rdx, %rbx
14544f74d:     	addq	$0xdf8, %rdx            # imm = 0xDF8
14544f754:     	movq	0xf00(%rbx), %rax
14544f75b:     	movq	%rax, 0xc88(%rbp)
14544f762:     	movzbl	0xf64(%rbx), %r14d
14544f76a:     	movzbl	0xf65(%rbx), %r15d
14544f772:     	movzbl	0xf66(%rbx), %r13d
14544f77a:     	leaq	-0x40(%rbp), %rcx
14544f77e:     	callq	0x145728850 <.text+0x5727850>
14544f783:     	movq	0xe20(%rbx), %rsi
14544f78a:     	movq	%rsi, %r12
14544f78d:     	shlq	$0x4, %r12
14544f791:     	movq	%rsi, %rax
14544f794:     	shrq	$0x3c, %rax
14544f798:     	setne	%al
14544f79b:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
14544f7a5:     	cmpq	%rcx, %r12
14544f7a8:     	seta	%cl
14544f7ab:     	orb	%al, %cl
14544f7ad:     	je	0x14544f7ce <.text+0x544e7ce>
14544f7af:     	xorl	%ebx, %ebx
14544f7b1:     	movq	%rbx, %rcx
14544f7b4:     	movq	%r12, %rdx
14544f7b7:     	callq	0x14590379b <.text+0x590279b>
14544f7bc:     	nop
14544f7bd:     	jmp	0x14544ffe8 <.text+0x544efe8>
14544f7c2:     	movq	$0x2, (%rdi)
14544f7c9:     	jmp	0x14544ff51 <.text+0x544ef51>
14544f7ce:     	movb	%r13b, 0xc96(%rbp)
14544f7d5:     	movb	%r15b, 0xc78(%rbp)
14544f7dc:     	movb	%r14b, 0xc95(%rbp)
14544f7e3:     	movq	%rdi, 0xc70(%rbp)
14544f7ea:     	movq	0xef0(%rbx), %rdi
14544f7f1:     	movq	0xef8(%rbx), %r14
14544f7f8:     	movq	%rbx, 0xc80(%rbp)
14544f7ff:     	movq	0xe18(%rbx), %r13
14544f806:     	testq	%r12, %r12
14544f809:     	je	0x14544fa42 <.text+0x544ea42>
14544f80f:     	callq	0x140002200 <.text+0x1200>
14544f814:     	movl	$0x8, %ebx
14544f819:     	movl	$0x8, %edx
14544f81e:     	movq	%r12, %rcx
14544f821:     	callq	0x1400021c0 <.text+0x11c0>
14544f826:     	testq	%rax, %rax
14544f829:     	je	0x14544f7b1 <.text+0x544e7b1>
14544f82b:     	movq	%rax, %r15
14544f82e:     	movq	%rsi, %rbx
14544f831:     	testq	%rsi, %rsi
14544f834:     	je	0x14544f844 <.text+0x544e844>
14544f836:     	movq	%r15, %rcx
14544f839:     	movq	%r13, %rdx
14544f83c:     	movq	%r12, %r8
14544f83f:     	callq	0x1457731ed <.text+0x57721ed>
14544f844:     	movq	0xc80(%rbp), %r13
14544f84b:     	leaq	0xe28(%r13), %rdx
14544f852:     	movq	0xf10(%r13), %r12
14544f859:     	movups	0xec0(%r13), %xmm0
14544f861:     	movups	0xed0(%r13), %xmm1
14544f869:     	movups	0xee0(%r13), %xmm2
14544f871:     	movups	%xmm2, 0xa68(%rbp)
14544f878:     	movups	%xmm1, 0xa58(%rbp)
14544f87f:     	movups	%xmm0, 0xa48(%rbp)
14544f886:     	movzbl	0xf6b(%r13), %eax
14544f88e:     	movb	%al, 0xaf3(%rbp)
14544f894:     	movl	0xf67(%r13), %eax
14544f89b:     	movl	%eax, 0xaef(%rbp)
14544f8a1:     	movups	-0x40(%rbp), %xmm0
14544f8a5:     	movaps	%xmm0, 0x980(%rbp)
14544f8ac:     	movq	-0x30(%rbp), %rax
14544f8b0:     	movq	%rax, 0x990(%rbp)
14544f8b7:     	movups	0xf18(%r13), %xmm0
14544f8bf:     	movups	0xf28(%r13), %xmm1
14544f8c7:     	movups	0xf38(%r13), %xmm2
14544f8cf:     	movups	0xf48(%r13), %xmm3
14544f8d7:     	movaps	%xmm0, 0xaa0(%rbp)
14544f8de:     	movaps	%xmm1, 0xab0(%rbp)
14544f8e5:     	movaps	%xmm2, 0xac0(%rbp)
14544f8ec:     	movaps	%xmm3, 0xad0(%rbp)
14544f8f3:     	movups	0xf54(%r13), %xmm0
14544f8fb:     	movups	%xmm0, 0xadc(%rbp)
14544f902:     	leaq	0x9b0(%rbp), %rcx
14544f909:     	movl	$0x98, %r8d
14544f90f:     	callq	0x1457731ed <.text+0x57721ed>
14544f914:     	movq	%rbx, 0x998(%rbp)
14544f91b:     	movq	%r15, 0x9a0(%rbp)
14544f922:     	movq	%rsi, 0x9a8(%rbp)
14544f929:     	movq	%rdi, 0xa78(%rbp)
14544f930:     	movq	%r14, 0xa80(%rbp)
14544f937:     	movq	0xc88(%rbp), %rax
14544f93e:     	movq	%rax, 0xa88(%rbp)
14544f945:     	movq	%r12, 0xa98(%rbp)
14544f94c:     	movzbl	0xc95(%rbp), %r15d
14544f954:     	movb	%r15b, 0xaec(%rbp)
14544f95b:     	movzbl	0xc78(%rbp), %eax
14544f962:     	movb	%al, 0xaed(%rbp)
14544f968:     	movzbl	0xc96(%rbp), %eax
14544f96f:     	movb	%al, 0xaee(%rbp)
14544f975:     	movabsq	$0x5851f42d4c957f2d, %rax # imm = 0x5851F42D4C957F2D
14544f97f:     	imulq	0xff8(%r13), %rax
14544f987:     	movabsq	$0x14057b7ef767814f, %rcx # imm = 0x14057B7EF767814F
14544f991:     	addq	%rax, %rcx
14544f994:     	movq	%rcx, 0xff8(%r13)
14544f99b:     	movq	%rcx, 0xa90(%rbp)
14544f9a2:     	movq	%rdi, %rcx
14544f9a5:     	movq	%r14, %rdx
14544f9a8:     	callq	0x145420480 <.text+0x541f480>
14544f9ad:     	imulq	$0xf0, %rax, %rax
14544f9b4:     	leaq	0x12e3b5d(%rip), %rbx   # 0x146733518
14544f9bb:     	addq	%rax, %rbx
14544f9be:     	leaq	0xfe0(%r13), %rdi
14544f9c5:     	movq	0xfe0(%r13), %rax
14544f9cc:     	testq	%rax, %rax
14544f9cf:     	je	0x14544fa58 <.text+0x544ea58>
14544f9d5:     	movl	0xfd0(%r13), %ecx
14544f9dc:     	movl	0xc0(%rbx), %esi
14544f9e2:     	cmpl	%esi, %ecx
14544f9e4:     	jne	0x14544fa77 <.text+0x544ea77>
14544f9ea:     	movss	0xfd4(%r13), %xmm0
14544f9f3:     	ucomiss	0xc8(%rbx), %xmm0
14544f9fa:     	jne	0x14544fa75 <.text+0x544ea75>
14544f9fc:     	jp	0x14544fa75 <.text+0x544ea75>
14544f9fe:     	movss	0xfd8(%r13), %xmm0
14544fa07:     	ucomiss	0xcc(%rbx), %xmm0
14544fa0e:     	jne	0x14544fac1 <.text+0x544eac1>
14544fa14:     	jp	0x14544fac1 <.text+0x544eac1>
14544fa1a:     	movss	0xfdc(%r13), %xmm0
14544fa23:     	ucomiss	0xd0(%rbx), %xmm0
14544fa2a:     	movl	%ecx, %esi
14544fa2c:     	jne	0x14544fa77 <.text+0x544ea77>
14544fa2e:     	jp	0x14544fa77 <.text+0x544ea77>
14544fa30:     	lock
14544fa31:     	incq	(%rax)
14544fa34:     	jle	0x14544ffe8 <.text+0x544efe8>
14544fa3a:     	movq	(%rdi), %rdi
14544fa3d:     	jmp	0x14544fc46 <.text+0x544ec46>
14544fa42:     	movl	$0x8, %r15d
14544fa48:     	xorl	%ebx, %ebx
14544fa4a:     	testq	%rsi, %rsi
14544fa4d:     	jne	0x14544f836 <.text+0x544e836>
14544fa53:     	jmp	0x14544f844 <.text+0x544e844>
14544fa58:     	movl	0xc0(%rbx), %esi
14544fa5e:     	leaq	0x12eeb06(%rip), %rdx   # 0x14673e56b
14544fa65:     	movl	$0x9, %r8d
14544fa6b:     	cmpl	$0xbc, %esi
14544fa71:     	jle	0x14544fa8c <.text+0x544ea8c>
14544fa73:     	jmp	0x14544fad8 <.text+0x544ead8>
14544fa75:     	movl	%ecx, %esi
14544fa77:     	leaq	0x12eeaed(%rip), %rdx   # 0x14673e56b
14544fa7e:     	movl	$0x9, %r8d
14544fa84:     	cmpl	$0xbc, %esi
14544fa8a:     	jg	0x14544fad8 <.text+0x544ead8>
14544fa8c:     	testl	%esi, %esi
14544fa8e:     	je	0x14544faa3 <.text+0x544eaa3>
14544fa90:     	cmpl	$0x1, %esi
14544fa93:     	je	0x14544fab2 <.text+0x544eab2>
14544fa95:     	cmpl	$0x1e, %esi
14544fa98:     	jne	0x14544fb15 <.text+0x544eb15>
14544fa9a:     	leaq	0x12eeac1(%rip), %rdx   # 0x14673e562
14544faa1:     	jmp	0x14544fb15 <.text+0x544eb15>
14544faa3:     	leaq	0x12eea88(%rip), %rdx   # 0x14673e532
14544faaa:     	movl	$0x7, %r8d
14544fab0:     	jmp	0x14544fb15 <.text+0x544eb15>
14544fab2:     	leaq	0x12eea80(%rip), %rdx   # 0x14673e539
14544fab9:     	movl	$0x8, %r8d
14544fabf:     	jmp	0x14544fb15 <.text+0x544eb15>
14544fac1:     	movl	%ecx, %esi
14544fac3:     	leaq	0x12eeaa1(%rip), %rdx   # 0x14673e56b
14544faca:     	movl	$0x9, %r8d
14544fad0:     	cmpl	$0xbc, %esi
14544fad6:     	jle	0x14544fa8c <.text+0x544ea8c>
14544fad8:     	cmpl	$0xbd, %esi
14544fade:     	je	0x14544faff <.text+0x544eaff>
14544fae0:     	cmpl	$0x211, %esi            # imm = 0x211
14544fae6:     	je	0x14544fb0e <.text+0x544eb0e>
14544fae8:     	cmpl	$0x215, %esi            # imm = 0x215
14544faee:     	jne	0x14544fb15 <.text+0x544eb15>
14544faf0:     	leaq	0x12eea5c(%rip), %rdx   # 0x14673e553
14544faf7:     	movl	$0xf, %r8d
14544fafd:     	jmp	0x14544fb15 <.text+0x544eb15>
14544faff:     	leaq	0x12eea3b(%rip), %rdx   # 0x14673e541
14544fb06:     	movl	$0x12, %r8d
14544fb0c:     	jmp	0x14544fb15 <.text+0x544eb15>
14544fb0e:     	leaq	0x12eea5f(%rip), %rdx   # 0x14673e574
14544fb15:     	movl	0xd0(%rbx), %eax
14544fb1b:     	movl	%eax, 0xb00(%rbp)
14544fb21:     	movq	0xc8(%rbx), %rax
14544fb28:     	movss	0xd8(%rbx), %xmm0
14544fb30:     	addss	0x4c5da0(%rip), %xmm0   # 0x1459158d8
14544fb38:     	movq	%rax, 0xaf8(%rbp)
14544fb3f:     	movq	0x60(%rbx), %rax
14544fb43:     	cmpb	$0x0, 0xec(%rbx)
14544fb4a:     	je	0x14544fb52 <.text+0x544eb52>
14544fb4c:     	movq	0x58(%rbx), %r9
14544fb50:     	jmp	0x14544fb55 <.text+0x544eb55>
14544fb52:     	xorl	%r9d, %r9d
14544fb55:     	leaq	-0x30(%rbp), %rcx
14544fb59:     	movb	$0x1, 0xc97(%rbp)
14544fb60:     	movq	%rax, 0x30(%rsp)
14544fb65:     	movq	%r9, 0x28(%rsp)
14544fb6a:     	movss	%xmm0, 0x20(%rsp)
14544fb70:     	leaq	0xaf8(%rbp), %r9
14544fb77:     	callq	0x145526fa0 <.text+0x5525fa0>
14544fb7c:     	nop
14544fb7d:     	movq	$0x1, -0x40(%rbp)
14544fb85:     	movq	$0x1, -0x38(%rbp)
14544fb8d:     	callq	0x140002200 <.text+0x1200>
14544fb92:     	movl	$0xc0, %ecx
14544fb97:     	movl	$0x8, %edx
14544fb9c:     	callq	0x1400021c0 <.text+0x11c0>
14544fba1:     	testq	%rax, %rax
14544fba4:     	je	0x14544ffd8 <.text+0x544efd8>
14544fbaa:     	movq	%rax, %r14
14544fbad:     	movl	%esi, 0xc88(%rbp)
14544fbb3:     	leaq	-0x40(%rbp), %rdx
14544fbb7:     	movl	$0xc0, %r8d
14544fbbd:     	movq	%rax, %rcx
14544fbc0:     	callq	0x1457731ed <.text+0x57721ed>
14544fbc5:     	movq	%r14, 0xaf8(%rbp)
14544fbcc:     	movq	%r14, 0xc78(%rbp)
14544fbd3:     	lock
14544fbd4:     	incq	(%r14)
14544fbd7:     	jle	0x14544ffe8 <.text+0x544efe8>
14544fbdd:     	addq	$0xc8, %rbx
14544fbe4:     	movl	0x8(%rbx), %eax
14544fbe7:     	movl	%eax, -0x38(%rbp)
14544fbea:     	movq	(%rbx), %rax
14544fbed:     	movq	%rax, -0x40(%rbp)
14544fbf1:     	movq	(%rdi), %rax
14544fbf4:     	testq	%rax, %rax
14544fbf7:     	je	0x14544fc08 <.text+0x544ec08>
14544fbf9:     	lock
14544fbfa:     	decq	(%rax)
14544fbfd:     	jne	0x14544fc08 <.text+0x544ec08>
14544fbff:     	movq	%rdi, %rcx
14544fc02:     	callq	0x145427f80 <.text+0x5426f80>
14544fc07:     	nop
14544fc08:     	movq	0xc80(%rbp), %r13
14544fc0f:     	movl	0xc88(%rbp), %eax
14544fc15:     	movl	%eax, 0xfd0(%r13)
14544fc1c:     	movq	-0x40(%rbp), %rax
14544fc20:     	movq	%rax, 0xfd4(%r13)
14544fc27:     	movl	-0x38(%rbp), %eax
14544fc2a:     	movl	%eax, 0xfdc(%r13)
14544fc31:     	movq	0xc78(%rbp), %rax
14544fc38:     	movq	%rax, 0xfe0(%r13)
14544fc3f:     	movq	0xaf8(%rbp), %rdi
14544fc46:     	leaq	0xaf8(%rbp), %rbx
14544fc4d:     	leaq	0x980(%rbp), %rdx
14544fc54:     	movl	$0x178, %r8d            # imm = 0x178
14544fc5a:     	movq	%rbx, %rcx
14544fc5d:     	callq	0x1457731ed <.text+0x57721ed>
14544fc62:     	movb	$0x0, 0xc97(%rbp)
14544fc69:     	leaq	-0x40(%rbp), %rcx
14544fc6d:     	movq	%rbx, %rdx
14544fc70:     	movq	%rdi, %r8
14544fc73:     	callq	0x1454ad570 <.text+0x54ac570>
14544fc78:     	nop
14544fc79:     	movq	0xf70(%r13), %rcx
14544fc80:     	movq	0xf78(%r13), %rax
14544fc87:     	callq	*0x40(%rax)
14544fc8a:     	nop
14544fc8b:     	movq	0xc70(%rbp), %rsi
14544fc92:     	movb	%al, 0x968(%rbp)
14544fc98:     	movzbl	0x1043(%r13), %eax
14544fca0:     	movb	%al, 0x96d(%rbp)
14544fca6:     	movzbl	0x1044(%r13), %eax
14544fcae:     	movb	%al, 0x96e(%rbp)
14544fcb4:     	leaq	0x12ee8c2(%rip), %rdx   # 0x14673e57d
14544fcbb:     	leaq	0xaf8(%rbp), %rdi
14544fcc2:     	movl	$0x13, %r8d
14544fcc8:     	movq	%rdi, %rcx
14544fccb:     	callq	0x145718ed0 <.text+0x5717ed0>
14544fcd0:     	nop
14544fcd1:     	movq	0xaf8(%rbp), %rdx
14544fcd8:     	cmpq	$-0x2, %rdx
14544fcdc:     	jne	0x14544fcfe <.text+0x544ecfe>
14544fcde:     	cmpq	$0x1, 0xb10(%rbp)
14544fce6:     	jne	0x14544ff6c <.text+0x544ef6c>
14544fcec:     	movq	0xb08(%rbp), %rax
14544fcf3:     	cmpb	$0x31, (%rax)
14544fcf6:     	sete	%al
14544fcf9:     	jmp	0x14544ff6e <.text+0x544ef6e>
14544fcfe:     	movb	$0x0, 0x971(%rbp)
14544fd05:     	cmpq	$-0x1, %rdx
14544fd09:     	je	0x14544fd20 <.text+0x544ed20>
14544fd0b:     	testq	%rdx, %rdx
14544fd0e:     	je	0x14544fd20 <.text+0x544ed20>
14544fd10:     	movq	0x8(%rdi), %rcx
14544fd14:     	movl	$0x1, %r8d
14544fd1a:     	callq	0x1400021d0 <.text+0x11d0>
14544fd1f:     	nop
14544fd20:     	leaq	0x12ee869(%rip), %rdx   # 0x14673e590
14544fd27:     	leaq	0xaf8(%rbp), %rdi
14544fd2e:     	movl	$0x12, %r8d
14544fd34:     	movq	%rdi, %rcx
14544fd37:     	callq	0x145718ed0 <.text+0x5717ed0>
14544fd3c:     	nop
14544fd3d:     	movq	0xaf8(%rbp), %rdx
14544fd44:     	cmpq	$-0x2, %rdx
14544fd48:     	jne	0x14544fd6a <.text+0x544ed6a>
14544fd4a:     	cmpq	$0x1, 0xb10(%rbp)
14544fd52:     	jne	0x14544ff90 <.text+0x544ef90>
14544fd58:     	movq	0xb08(%rbp), %rax
14544fd5f:     	cmpb	$0x31, (%rax)
14544fd62:     	sete	%al
14544fd65:     	jmp	0x14544ff92 <.text+0x544ef92>
14544fd6a:     	movb	$0x0, 0x972(%rbp)
14544fd71:     	cmpq	$-0x1, %rdx
14544fd75:     	je	0x14544fd8c <.text+0x544ed8c>
14544fd77:     	testq	%rdx, %rdx
14544fd7a:     	je	0x14544fd8c <.text+0x544ed8c>
14544fd7c:     	movq	0x8(%rdi), %rcx
14544fd80:     	movl	$0x1, %r8d
14544fd86:     	callq	0x1400021d0 <.text+0x11d0>
14544fd8b:     	nop
14544fd8c:     	leaq	0x12ee80f(%rip), %rdx   # 0x14673e5a2
14544fd93:     	leaq	0xaf8(%rbp), %rdi
14544fd9a:     	movl	$0x14, %r8d
14544fda0:     	movq	%rdi, %rcx
14544fda3:     	callq	0x145718ed0 <.text+0x5717ed0>
14544fda8:     	nop
14544fda9:     	movq	0xaf8(%rbp), %rdx
14544fdb0:     	cmpq	$-0x2, %rdx
14544fdb4:     	jne	0x14544fdd6 <.text+0x544edd6>
14544fdb6:     	cmpq	$0x1, 0xb10(%rbp)
14544fdbe:     	jne	0x14544ffb4 <.text+0x544efb4>
14544fdc4:     	movq	0xb08(%rbp), %rax
14544fdcb:     	cmpb	$0x31, (%rax)
14544fdce:     	sete	%al
14544fdd1:     	jmp	0x14544ffb6 <.text+0x544efb6>
14544fdd6:     	movb	$0x0, 0x973(%rbp)
14544fddd:     	cmpq	$-0x1, %rdx
14544fde1:     	je	0x14544fdf8 <.text+0x544edf8>
14544fde3:     	testq	%rdx, %rdx
14544fde6:     	je	0x14544fdf8 <.text+0x544edf8>
14544fde8:     	movq	0x8(%rdi), %rcx
14544fdec:     	movl	$0x1, %r8d
14544fdf2:     	callq	0x1400021d0 <.text+0x11d0>
14544fdf7:     	nop
14544fdf8:     	leaq	0x12ee7b7(%rip), %rdx   # 0x14673e5b6
14544fdff:     	leaq	0xaf8(%rbp), %rcx
14544fe06:     	movl	$0xe, %r8d
14544fe0c:     	callq	0x145718ed0 <.text+0x5717ed0>
14544fe11:     	nop
14544fe12:     	movq	0xaf8(%rbp), %rdx
14544fe19:     	cmpq	$-0x2, %rdx
14544fe1d:     	je	0x14544fe42 <.text+0x544ee42>
14544fe1f:     	cmpq	$-0x1, %rdx
14544fe23:     	je	0x14544fea9 <.text+0x544eea9>
14544fe29:     	testq	%rdx, %rdx
14544fe2c:     	je	0x14544fea9 <.text+0x544eea9>
14544fe2e:     	movq	0xb00(%rbp), %rcx
14544fe35:     	movl	$0x1, %r8d
14544fe3b:     	callq	0x1400021d0 <.text+0x11d0>
14544fe40:     	jmp	0x14544fea9 <.text+0x544eea9>
14544fe42:     	movq	0xb00(%rbp), %rax
14544fe49:     	cmpq	$-0x1, %rax
14544fe4d:     	je	0x14544fea9 <.text+0x544eea9>
14544fe4f:     	movq	%rax, 0xc88(%rbp)
14544fe56:     	movq	0xb08(%rbp), %rcx
14544fe5d:     	movq	0xb10(%rbp), %rdx
14544fe64:     	movq	%rcx, 0xc80(%rbp)
14544fe6b:     	callq	0x1457373e0 <.text+0x57363e0>
14544fe70:     	nop
14544fe71:     	movq	%rax, %rdi
14544fe74:     	movq	0xc88(%rbp), %rdx
14544fe7b:     	testq	%rdx, %rdx
14544fe7e:     	je	0x14544fe92 <.text+0x544ee92>
14544fe80:     	movl	$0x1, %r8d
14544fe86:     	movq	0xc80(%rbp), %rcx
14544fe8d:     	callq	0x1400021d0 <.text+0x11d0>
14544fe92:     	movq	%rdi, %rax
14544fe95:     	shrq	$0x20, %rax
14544fe99:     	movd	%eax, %xmm0
14544fe9d:     	notb	%dil
14544fea0:     	movzbl	%dil, %eax
14544fea4:     	andl	$0x1, %eax
14544fea7:     	jmp	0x14544feab <.text+0x544eeab>
14544fea9:     	xorl	%eax, %eax
14544feab:     	movl	%eax, 0x850(%rbp)
14544feb1:     	movd	%xmm0, 0x854(%rbp)
14544feb9:     	orb	%al, 0x974(%rbp)
14544febf:     	movzbl	0x972(%rbp), %eax
14544fec6:     	orb	%al, 0x971(%rbp)
14544fecc:     	movb	$0x0, 0x1042(%r13)
14544fed4:     	xorps	%xmm6, %xmm6
14544fed7:     	movups	%xmm6, 0xf88(%r13)
14544fedf:     	movups	%xmm6, 0xf98(%r13)
14544fee7:     	movups	%xmm6, 0xfa8(%r13)
14544feef:     	movq	$0x0, 0xfb8(%r13)
14544fefa:     	pxor	%xmm0, %xmm0
14544fefe:     	cmpq	$0xffffff, 0xf80(%r13)  # imm = 0xFFFFFF
14544ff09:     	je	0x14544ff1b <.text+0x544ef1b>
14544ff0b:     	leaq	0xa18(%r13), %rcx
14544ff12:     	movl	%r15d, %edx
14544ff15:     	callq	0x14547f960 <.text+0x547e960>
14544ff1a:     	nop
14544ff1b:     	movd	%xmm0, 0x1000(%r13)
14544ff24:     	movb	$-0x1, 0x1045(%r13)
14544ff2c:     	movups	%xmm6, 0x1004(%r13)
14544ff34:     	movl	$0x0, 0x1014(%r13)
14544ff3f:     	leaq	-0x40(%rbp), %rdx
14544ff43:     	movl	$0x9c0, %r8d            # imm = 0x9C0
14544ff49:     	movq	%rsi, %rcx
14544ff4c:     	callq	0x1457731ed <.text+0x57721ed>
14544ff51:     	movaps	0xca0(%rbp), %xmm6
14544ff58:     	addq	$0xd38, %rsp            # imm = 0xD38
14544ff5f:     	popq	%rbx
14544ff60:     	popq	%rdi
14544ff61:     	popq	%rsi
14544ff62:     	popq	%r12
14544ff64:     	popq	%r13
14544ff66:     	popq	%r14
14544ff68:     	popq	%r15
14544ff6a:     	popq	%rbp
14544ff6b:     	retq
14544ff6c:     	xorl	%eax, %eax
14544ff6e:     	movb	%al, 0x971(%rbp)
14544ff74:     	leaq	0xb00(%rbp), %rdi
14544ff7b:     	movq	0xb00(%rbp), %rdx
14544ff82:     	testq	%rdx, %rdx
14544ff85:     	jne	0x14544fd10 <.text+0x544ed10>
14544ff8b:     	jmp	0x14544fd20 <.text+0x544ed20>
14544ff90:     	xorl	%eax, %eax
14544ff92:     	movb	%al, 0x972(%rbp)
14544ff98:     	leaq	0xb00(%rbp), %rdi
14544ff9f:     	movq	0xb00(%rbp), %rdx
14544ffa6:     	testq	%rdx, %rdx
14544ffa9:     	jne	0x14544fd7c <.text+0x544ed7c>
14544ffaf:     	jmp	0x14544fd8c <.text+0x544ed8c>
14544ffb4:     	xorl	%eax, %eax
14544ffb6:     	movb	%al, 0x973(%rbp)
14544ffbc:     	leaq	0xb00(%rbp), %rdi
14544ffc3:     	movq	0xb00(%rbp), %rdx
14544ffca:     	testq	%rdx, %rdx
14544ffcd:     	jne	0x14544fde8 <.text+0x544ede8>
14544ffd3:     	jmp	0x14544fdf8 <.text+0x544edf8>
14544ffd8:     	movl	$0x8, %ecx
14544ffdd:     	movl	$0xc0, %edx
14544ffe2:     	callq	0x145903781 <.text+0x5902781>
14544ffe7:     	nop
14544ffe8:     	ud2
