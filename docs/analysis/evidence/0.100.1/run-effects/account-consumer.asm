
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543f4f0:     	pushq	%rbp
14543f4f1:     	pushq	%r15
14543f4f3:     	pushq	%r14
14543f4f5:     	pushq	%r13
14543f4f7:     	pushq	%r12
14543f4f9:     	pushq	%rsi
14543f4fa:     	pushq	%rdi
14543f4fb:     	pushq	%rbx
14543f4fc:     	subq	$0x5b8, %rsp            # imm = 0x5B8
14543f503:     	leaq	0x80(%rsp), %rbp
14543f50b:     	movaps	%xmm7, 0x520(%rbp)
14543f512:     	movaps	%xmm6, 0x510(%rbp)
14543f519:     	movq	$-0x2, 0x508(%rbp)
14543f524:     	movapd	%xmm1, %xmm6
14543f528:     	xorps	%xmm7, %xmm7
14543f52b:     	cmpl	$0x1, (%rcx)
14543f52e:     	jne	0x14543f554 <.text+0x543e554>
14543f530:     	movapd	%xmm6, %xmm0
14543f534:     	subsd	0x8(%rcx), %xmm0
14543f539:     	xorpd	%xmm1, %xmm1
14543f53d:     	maxsd	%xmm0, %xmm1
14543f541:     	movsd	0x5a595f(%rip), %xmm0   # 0x1459e4ea8
14543f549:     	minsd	%xmm1, %xmm0
14543f54d:     	xorps	%xmm7, %xmm7
14543f550:     	cvtsd2ss	%xmm0, %xmm7
14543f554:     	movq	$0x1, (%rcx)
14543f55b:     	movsd	%xmm6, 0x8(%rcx)
14543f560:     	movq	0x9d0(%rcx), %r8
14543f567:     	movq	0x9d8(%rcx), %rax
14543f56e:     	movq	0x9e0(%rcx), %rdx
14543f575:     	movq	$0x0, 0x9d0(%rcx)
14543f580:     	movq	$0x8, 0x9d8(%rcx)
14543f58b:     	movq	$0x0, 0x9e0(%rcx)
14543f596:     	leaq	(%rdx,%rdx,2), %rdx
14543f59a:     	leaq	(%rax,%rdx,8), %r15
14543f59e:     	movq	%rax, 0x490(%rbp)
14543f5a5:     	movq	%rax, 0x498(%rbp)
14543f5ac:     	movq	%r8, 0x4a0(%rbp)
14543f5b3:     	movq	%r15, 0x4a8(%rbp)
14543f5ba:     	leaq	0xa00(%rcx), %rdx
14543f5c1:     	movq	%rdx, 0x4b8(%rbp)
14543f5c8:     	movq	%rcx, 0x4f8(%rbp)
14543f5cf:     	addq	$0x9e8, %rcx            # imm = 0x9E8
14543f5d6:     	movq	%rcx, 0x4c8(%rbp)
14543f5dd:     	leaq	0x80(%rbp), %r12
14543f5e4:     	leaq	0x320(%rbp), %rdi
14543f5eb:     	movq	%r15, 0x4d8(%rbp)
14543f5f2:     	cmpq	%r15, %rax
14543f5f5:     	jne	0x14543f799 <.text+0x543e799>
14543f5fb:     	leaq	0x490(%rbp), %rbx
14543f602:     	movq	%rbx, %rcx
14543f605:     	callq	0x14555ac80 <.text+0x5559c80>
14543f60a:     	movq	0x4f8(%rbp), %rax
14543f611:     	imulq	$0xd8, 0x9f8(%rax), %rsi
14543f61c:     	movq	0x9f0(%rax), %rdi
14543f623:     	addq	%rdi, %rsi
14543f626:     	leaq	0x1019(%rax), %r15
14543f62d:     	leaq	0x320(%rbp), %r14
14543f634:     	jmp	0x14543f647 <.text+0x543e647>
14543f636:     	nopw	%cs:(%rax,%rax)
14543f640:     	addq	$0xd8, %rdi
14543f647:     	cmpq	%rsi, %rdi
14543f64a:     	je	0x14543fbfa <.text+0x543ebfa>
14543f650:     	movq	(%rdi), %rdx
14543f653:     	addq	$0x10, %rdx
14543f657:     	movq	%rbx, %rcx
14543f65a:     	callq	0x145577520 <.text+0x5576520>
14543f65f:     	movq	0x4a0(%rbp), %r9
14543f666:     	testq	%r9, %r9
14543f669:     	je	0x14543f730 <.text+0x543e730>
14543f66f:     	leaq	0x10(%rdi), %rdx
14543f673:     	movq	0x498(%rbp), %r8
14543f67a:     	movq	%r14, %rcx
14543f67d:     	movq	%r8, 0x4d8(%rbp)
14543f684:     	callq	0x14550dd60 <.text+0x550cd60>
14543f689:     	nop
14543f68a:     	movq	0x8(%rdi), %rcx
14543f68e:     	addq	$0x10, %rcx
14543f692:     	movq	0x328(%rbp), %rdx
14543f699:     	movq	0x330(%rbp), %r8
14543f6a0:     	movq	%rdx, 0x4e8(%rbp)
14543f6a7:     	callq	0x1455773c0 <.text+0x55763c0>
14543f6ac:     	nop
14543f6ad:     	cmpb	$0x1, 0xa8(%rdi)
14543f6b4:     	jne	0x14543f712 <.text+0x543e712>
14543f6b6:     	movq	0xc9(%rdi), %rax
14543f6bd:     	movq	%rax, 0xa0(%rbp)
14543f6c4:     	movups	0xa9(%rdi), %xmm0
14543f6cb:     	movups	0xb9(%rdi), %xmm1
14543f6d2:     	movaps	%xmm1, 0x90(%rbp)
14543f6d9:     	movaps	%xmm0, 0x80(%rbp)
14543f6e0:     	movq	0x4f8(%rbp), %rax
14543f6e7:     	movb	$0x1, 0x1018(%rax)
14543f6ee:     	movq	0xa0(%rbp), %rax
14543f6f5:     	movq	%rax, 0x20(%r15)
14543f6f9:     	movaps	0x80(%rbp), %xmm0
14543f700:     	movapd	0x90(%rbp), %xmm1
14543f708:     	movupd	%xmm1, 0x10(%r15)
14543f70e:     	movups	%xmm0, (%r15)
14543f712:     	movq	0x320(%rbp), %rdx
14543f719:     	testq	%rdx, %rdx
14543f71c:     	je	0x14543f730 <.text+0x543e730>
14543f71e:     	movl	$0x1, %r8d
14543f724:     	movq	0x4e8(%rbp), %rcx
14543f72b:     	callq	0x1400021d0 <.text+0x11d0>
14543f730:     	movq	0x490(%rbp), %rdx
14543f737:     	testq	%rdx, %rdx
14543f73a:     	je	0x14543f640 <.text+0x543e640>
14543f740:     	movq	0x498(%rbp), %rcx
14543f747:     	movl	$0x1, %r8d
14543f74d:     	callq	0x1400021d0 <.text+0x11d0>
14543f752:     	jmp	0x14543f640 <.text+0x543e640>
14543f757:     	nopw	(%rax,%rax)
14543f760:     	imulq	$0xd8, %rsi, %rcx
14543f767:     	movq	0x4f8(%rbp), %rbx
14543f76e:     	addq	0x9f0(%rbx), %rcx
14543f775:     	movl	$0xd8, %r8d
14543f77b:     	movq	%r12, %rdx
14543f77e:     	callq	0x1457731ed <.text+0x57721ed>
14543f783:     	incq	%rsi
14543f786:     	movq	%rsi, 0x9f8(%rbx)
14543f78d:     	movq	%r14, %rax
14543f790:     	cmpq	%r15, %rax
14543f793:     	je	0x14543f5fb <.text+0x543e5fb>
14543f799:     	leaq	0x18(%rax), %r14
14543f79d:     	movq	%r14, 0x498(%rbp)
14543f7a4:     	movq	0x8(%rax), %rbx
14543f7a8:     	testq	%rbx, %rbx
14543f7ab:     	je	0x14543f5fb <.text+0x543e5fb>
14543f7b1:     	movzwl	(%rax), %ecx
14543f7b4:     	movq	0x10(%rax), %r13
14543f7b8:     	movq	%rbx, 0x3f0(%rbp)
14543f7bf:     	movq	%r13, 0x3f8(%rbp)
14543f7c6:     	movzwl	%cx, %eax
14543f7c9:     	cmpl	$0xe8c, %eax            # imm = 0xE8C
14543f7ce:     	jne	0x14543f860 <.text+0x543e860>
14543f7d4:     	movq	%r14, 0x4e8(%rbp)
14543f7db:     	movq	%rdi, %r14
14543f7de:     	movb	$0x1, 0x507(%rbp)
14543f7e5:     	movq	%r12, %rdi
14543f7e8:     	movq	%r12, %rcx
14543f7eb:     	movq	0x4f8(%rbp), %rdx
14543f7f2:     	callq	0x14544d300 <.text+0x544c300>
14543f7f7:     	nop
14543f7f8:     	movq	0x88(%rbp), %r12
14543f7ff:     	movq	0x90(%rbp), %r15
14543f806:     	cmpq	$0xff, %r15
14543f80d:     	movl	$0xff, %eax
14543f812:     	cmovbq	%r15, %rax
14543f816:     	movb	%al, (%rbp)
14543f819:     	testq	%r15, %r15
14543f81c:     	je	0x14543fa30 <.text+0x543ea30>
14543f822:     	leaq	0x8(%r12), %rsi
14543f827:     	jmp	0x14543f83d <.text+0x543e83d>
14543f829:     	nopl	(%rax)
14543f830:     	addq	$0x38, %rsi
14543f834:     	decq	%r15
14543f837:     	je	0x14543fa30 <.text+0x543ea30>
14543f83d:     	movq	-0x8(%rsi), %rdx
14543f841:     	testq	%rdx, %rdx
14543f844:     	je	0x14543f830 <.text+0x543e830>
14543f846:     	movq	(%rsi), %rcx
14543f849:     	movl	$0x1, %r8d
14543f84f:     	callq	0x1400021d0 <.text+0x11d0>
14543f854:     	jmp	0x14543f830 <.text+0x543e830>
14543f856:     	nopw	%cs:(%rax,%rax)
14543f860:     	subw	$0x1f95, %cx            # imm = 0x1F95
14543f865:     	movl	$0x0, %eax
14543f86a:     	cmovbl	%eax, %ecx
14543f86d:     	cmpw	$0xc, %cx
14543f871:     	cmovael	%eax, %ecx
14543f874:     	movzwl	%cx, %eax
14543f877:     	imulq	$0xf0, %rax, %rax
14543f87e:     	leaq	0x12f3c93(%rip), %rcx   # 0x146733518
14543f885:     	movups	0x8(%rax,%rcx), %xmm0
14543f88a:     	movq	%rbx, 0x3a8(%rbp)
14543f891:     	movq	%r13, 0x3b0(%rbp)
14543f898:     	movq	$0x0, 0x320(%rbp)
14543f8a3:     	movq	$0x0, 0x338(%rbp)
14543f8ae:     	movq	$0x1, 0x340(%rbp)
14543f8b9:     	movq	$0x0, 0x348(%rbp)
14543f8c4:     	movb	$0x0, 0x350(%rbp)
14543f8cb:     	movups	%xmm0, 0x3b8(%rbp)
14543f8d2:     	movb	$0x0, 0x3c8(%rbp)
14543f8d9:     	movq	$0x0, 0x458(%rbp)
14543f8e4:     	movq	$0x1, 0x460(%rbp)
14543f8ef:     	movq	$0x0, 0x468(%rbp)
14543f8fa:     	callq	0x140002200 <.text+0x1200>
14543f8ff:     	movl	$0x20, %ecx
14543f904:     	movl	$0x1, %edx
14543f909:     	callq	0x1400021c0 <.text+0x11c0>
14543f90e:     	testq	%rax, %rax
14543f911:     	je	0x145442455 <.text+0x5441455>
14543f917:     	movl	$0xc0ffee00, (%rax)     # imm = 0xC0FFEE00
14543f91d:     	movq	$0x20, 0x80(%rbp)
14543f928:     	movq	%rax, 0x4e8(%rbp)
14543f92f:     	movq	%rax, 0x88(%rbp)
14543f936:     	movq	$0x4, 0x90(%rbp)
14543f941:     	movw	$0x1ec, 0x98(%rbp)      # imm = 0x1EC
14543f94a:     	movq	%rdi, %rcx
14543f94d:     	movq	%r12, %rdx
14543f950:     	leaq	0x458(%rbp), %r8
14543f957:     	callq	0x1455133c0 <.text+0x55123c0>
14543f95c:     	nop
14543f95d:     	movl	$0x20, %edx
14543f962:     	movl	$0x1, %r8d
14543f968:     	movq	0x4e8(%rbp), %rcx
14543f96f:     	callq	0x1400021d0 <.text+0x11d0>
14543f974:     	movq	0x3b0(%rbp), %rcx
14543f97b:     	addq	$0x10, %rcx
14543f97f:     	movq	0x460(%rbp), %rdx
14543f986:     	movq	0x468(%rbp), %r8
14543f98d:     	movb	$0x1, 0x4e6(%rbp)
14543f994:     	callq	0x1455773c0 <.text+0x55763c0>
14543f999:     	nop
14543f99a:     	movl	$0xb0, %r8d
14543f9a0:     	movq	%r12, %rcx
14543f9a3:     	movq	%rdi, %rdx
14543f9a6:     	callq	0x1457731ed <.text+0x57721ed>
14543f9ab:     	movq	0x4f8(%rbp), %rax
14543f9b2:     	movq	0xa10(%rax), %rsi
14543f9b9:     	cmpq	0xa00(%rax), %rsi
14543f9c0:     	jne	0x14543f9cf <.text+0x543e9cf>
14543f9c2:     	movq	0x4b8(%rbp), %rcx
14543f9c9:     	callq	0x1457a2a80 <.text+0x57a1a80>
14543f9ce:     	nop
14543f9cf:     	imulq	$0xb0, %rsi, %rcx
14543f9d6:     	movq	0x4f8(%rbp), %rbx
14543f9dd:     	addq	0xa08(%rbx), %rcx
14543f9e4:     	movl	$0xb0, %r8d
14543f9ea:     	movq	%r12, %rdx
14543f9ed:     	callq	0x1457731ed <.text+0x57721ed>
14543f9f2:     	incq	%rsi
14543f9f5:     	movq	%rsi, 0xa10(%rbx)
14543f9fc:     	movq	0x458(%rbp), %rdx
14543fa03:     	testq	%rdx, %rdx
14543fa06:     	je	0x14543fa1a <.text+0x543ea1a>
14543fa08:     	movq	0x460(%rbp), %rcx
14543fa0f:     	movl	$0x1, %r8d
14543fa15:     	callq	0x1400021d0 <.text+0x11d0>
14543fa1a:     	movq	%r14, %rax
14543fa1d:     	cmpq	%r15, %rax
14543fa20:     	jne	0x14543f799 <.text+0x543e799>
14543fa26:     	jmp	0x14543f5fb <.text+0x543e5fb>
14543fa2b:     	nopl	(%rax,%rax)
14543fa30:     	movq	0x80(%rbp), %rax
14543fa37:     	testq	%rax, %rax
14543fa3a:     	je	0x14543fa4e <.text+0x543ea4e>
14543fa3c:     	imulq	$0x38, %rax, %rdx
14543fa40:     	movl	$0x8, %r8d
14543fa46:     	movq	%r12, %rcx
14543fa49:     	callq	0x1400021d0 <.text+0x11d0>
14543fa4e:     	leaq	0x12f3ac3(%rip), %rax   # 0x146733518
14543fa55:     	movq	%rax, 0x80(%rbp)
14543fa5c:     	leaq	0x12f45f5(%rip), %rax   # 0x146734058
14543fa63:     	movq	%rax, 0x88(%rbp)
14543fa6a:     	movq	$0x0, 0x90(%rbp)
14543fa75:     	movq	%rbp, %rax
14543fa78:     	movq	%rax, 0x98(%rbp)
14543fa7f:     	callq	0x140002200 <.text+0x1200>
14543fa84:     	movl	$0x2a0, %ecx            # imm = 0x2A0
14543fa89:     	movl	$0x8, %edx
14543fa8e:     	callq	0x1400021c0 <.text+0x11c0>
14543fa93:     	testq	%rax, %rax
14543fa96:     	je	0x14544243c <.text+0x544143c>
14543fa9c:     	movq	$0xc, 0x458(%rbp)
14543faa7:     	movq	%rax, 0x460(%rbp)
14543faae:     	movq	$0x0, 0x468(%rbp)
14543fab9:     	movq	%rax, 0x330(%rbp)
14543fac0:     	leaq	0x468(%rbp), %rax
14543fac7:     	movq	%rax, 0x320(%rbp)
14543face:     	movq	$0x0, 0x328(%rbp)
14543fad9:     	movq	%rdi, %r12
14543fadc:     	movq	%rdi, %rcx
14543fadf:     	movq	%r14, %rdi
14543fae2:     	movq	%r14, %rdx
14543fae5:     	callq	0x14554a120 <.text+0x5549120>
14543faea:     	nop
14543faeb:     	movq	0x4d8(%rbp), %r15
14543faf2:     	movups	0x458(%rbp), %xmm0
14543faf9:     	movaps	%xmm0, 0x320(%rbp)
14543fb00:     	movq	0x468(%rbp), %rax
14543fb07:     	movq	%rax, 0x330(%rbp)
14543fb0e:     	movq	%rbx, 0x458(%rbp)
14543fb15:     	movq	%r13, 0x460(%rbp)
14543fb1c:     	callq	0x140002200 <.text+0x1200>
14543fb21:     	movl	$0x8, %ecx
14543fb26:     	movl	$0x1, %edx
14543fb2b:     	callq	0x1400021c0 <.text+0x11c0>
14543fb30:     	testq	%rax, %rax
14543fb33:     	movq	0x4e8(%rbp), %r14
14543fb3a:     	je	0x14544242a <.text+0x544142a>
14543fb40:     	movabsq	$0x726f766976727573, %rcx # imm = 0x726F766976727573
14543fb4a:     	movq	%rcx, (%rax)
14543fb4d:     	movq	0x330(%rbp), %rcx
14543fb54:     	leaq	0xc0(%rbp), %rdx
14543fb5b:     	movq	%rcx, 0x10(%rdx)
14543fb5f:     	movaps	0x320(%rbp), %xmm0
14543fb66:     	movups	%xmm0, (%rdx)
14543fb69:     	movq	%rbx, 0x80(%rbp)
14543fb70:     	movq	%r13, 0x88(%rbp)
14543fb77:     	movq	$0x0, 0x90(%rbp)
14543fb82:     	movq	$0x1, 0x98(%rbp)
14543fb8d:     	movq	$0x0, 0xa0(%rbp)
14543fb98:     	movq	$0x8, 0xa8(%rbp)
14543fba3:     	movq	%rax, 0xb0(%rbp)
14543fbaa:     	movq	$0x8, 0xb8(%rbp)
14543fbb5:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
14543fbbf:     	movq	%rax, 0xd8(%rbp)
14543fbc6:     	movb	$0x0, 0x128(%rbp)
14543fbcd:     	movq	0x4f8(%rbp), %rax
14543fbd4:     	movq	0x9f8(%rax), %rsi
14543fbdb:     	cmpq	0x9e8(%rax), %rsi
14543fbe2:     	jne	0x14543f760 <.text+0x543e760>
14543fbe8:     	movq	0x4c8(%rbp), %rcx
14543fbef:     	callq	0x1457807a0 <.text+0x577f7a0>
14543fbf4:     	nop
14543fbf5:     	jmp	0x14543f760 <.text+0x543e760>
14543fbfa:     	movq	0x4c8(%rbp), %rcx
14543fc01:     	callq	0x145532260 <.text+0x5531260>
14543fc06:     	movq	0x4f8(%rbp), %rax
14543fc0d:     	addq	$0x10, %rax
14543fc11:     	movq	%rax, 0x488(%rbp)
14543fc18:     	xorl	%r14d, %r14d
14543fc1b:     	xorl	%eax, %eax
14543fc1d:     	notq	%rax
14543fc20:     	movq	%rax, 0x4b8(%rbp)
14543fc27:     	leaq	0x490(%rbp), %r13
14543fc2e:     	leaq	0x80(%rbp), %r12
14543fc35:     	nopw	%cs:(%rax,%rax)
14543fc40:     	movq	0x4f8(%rbp), %rsi
14543fc47:     	cmpq	0xa10(%rsi), %r14
14543fc4e:     	jae	0x14543ff85 <.text+0x543ef85>
14543fc54:     	movq	0xa08(%rsi), %rax
14543fc5b:     	imulq	$0xb0, %r14, %r15
14543fc62:     	movq	0x88(%rax,%r15), %rdx
14543fc6a:     	addq	$0x10, %rdx
14543fc6e:     	movq	%r13, %rcx
14543fc71:     	callq	0x145577520 <.text+0x5576520>
14543fc76:     	movq	0xa10(%rsi), %rdx
14543fc7d:     	cmpq	%rdx, %r14
14543fc80:     	jae	0x145442397 <.text+0x5441397>
14543fc86:     	movq	0xa08(%rsi), %rax
14543fc8d:     	leaq	(%rax,%r15), %rbx
14543fc91:     	movq	0x498(%rbp), %rcx
14543fc98:     	movq	%rcx, 0x4c8(%rbp)
14543fc9f:     	movq	0x4a0(%rbp), %rsi
14543fca6:     	movq	0x18(%rax,%r15), %rcx
14543fcab:     	movq	0x28(%rax,%r15), %rdi
14543fcb0:     	subq	%rdi, %rcx
14543fcb3:     	cmpq	%rcx, %rsi
14543fcb6:     	ja	0x14543ff59 <.text+0x543ef59>
14543fcbc:     	testq	%rsi, %rsi
14543fcbf:     	je	0x14543fcd7 <.text+0x543ecd7>
14543fcc1:     	movq	0x20(%rbx), %rcx
14543fcc5:     	addq	%rdi, %rcx
14543fcc8:     	movq	0x4c8(%rbp), %rdx
14543fccf:     	movq	%rsi, %r8
14543fcd2:     	callq	0x1457731ed <.text+0x57721ed>
14543fcd7:     	addq	%rsi, %rdi
14543fcda:     	movq	%rdi, 0x28(%rbx)
14543fcde:     	nop
14543fce0:     	movq	0x4f8(%rbp), %rax
14543fce7:     	movq	0xa10(%rax), %rdx
14543fcee:     	cmpq	%rdx, %r14
14543fcf1:     	jae	0x145442382 <.text+0x5441382>
14543fcf7:     	movq	0xa08(%rax), %rdx
14543fcfe:     	addq	%r15, %rdx
14543fd01:     	movq	%r12, %rcx
14543fd04:     	callq	0x1455130a0 <.text+0x55120a0>
14543fd09:     	nop
14543fd0a:     	movq	0x88(%rbp), %rax
14543fd11:     	cmpq	$-0x1, %rax
14543fd15:     	je	0x14543fd80 <.text+0x543ed80>
14543fd17:     	movq	%rax, 0x4e8(%rbp)
14543fd1e:     	movl	0x80(%rbp), %r8d
14543fd25:     	movq	0x90(%rbp), %r9
14543fd2c:     	movq	0x98(%rbp), %rax
14543fd33:     	movq	%rax, 0x20(%rsp)
14543fd38:     	movq	0x4f8(%rbp), %rcx
14543fd3f:     	movq	%r14, %rdx
14543fd42:     	movq	%r9, 0x4d8(%rbp)
14543fd49:     	callq	0x1454440d0 <.text+0x54430d0>
14543fd4e:     	nop
14543fd4f:     	movq	0x4e8(%rbp), %rdx
14543fd56:     	testq	%rdx, %rdx
14543fd59:     	je	0x14543fce0 <.text+0x543ece0>
14543fd5b:     	movl	$0x1, %r8d
14543fd61:     	movq	0x4d8(%rbp), %rcx
14543fd68:     	callq	0x1400021d0 <.text+0x11d0>
14543fd6d:     	jmp	0x14543fce0 <.text+0x543ece0>
14543fd72:     	nopw	%cs:(%rax,%rax)
14543fd80:     	movq	0x4f8(%rbp), %rax
14543fd87:     	movq	0xa10(%rax), %rdx
14543fd8e:     	cmpq	%rdx, %r14
14543fd91:     	jae	0x1454423ac <.text+0x54413ac>
14543fd97:     	movq	0xa08(%rax), %rax
14543fd9e:     	movq	0x88(%rax,%r15), %rcx
14543fda6:     	addq	$0x10, %rcx
14543fdaa:     	callq	0x1455776e0 <.text+0x55766e0>
14543fdaf:     	nop
14543fdb0:     	testb	%al, %al
14543fdb2:     	je	0x14543ff26 <.text+0x543ef26>
14543fdb8:     	movq	0x4f8(%rbp), %rdi
14543fdbf:     	movq	0xa10(%rdi), %rsi
14543fdc6:     	cmpq	%rsi, %r14
14543fdc9:     	jae	0x1454423c1 <.text+0x54413c1>
14543fdcf:     	movq	0xa08(%rdi), %r13
14543fdd6:     	leaq	(%r15,%r13), %rax
14543fdda:     	movq	%rax, 0x4e8(%rbp)
14543fde1:     	movq	(%r13,%r15), %rbx
14543fde6:     	leaq	(%r15,%r13), %rdx
14543fdea:     	addq	$0x8, %rdx
14543fdee:     	movl	$0xa8, %r8d
14543fdf4:     	leaq	0x320(%rbp), %rcx
14543fdfb:     	callq	0x1457731ed <.text+0x57721ed>
14543fe00:     	leaq	(%r15,%r13), %rdx
14543fe04:     	addq	$0xb0, %rdx
14543fe0b:     	movq	0x4b8(%rbp), %rax
14543fe12:     	addq	%rsi, %rax
14543fe15:     	imulq	$0xb0, %rax, %r8
14543fe1c:     	movq	0x4e8(%rbp), %rcx
14543fe23:     	callq	0x1457731e1 <.text+0x57721e1>
14543fe28:     	decq	%rsi
14543fe2b:     	movq	%rsi, 0xa10(%rdi)
14543fe32:     	cmpq	$0x2, %rbx
14543fe36:     	je	0x1454423c1 <.text+0x54413c1>
14543fe3c:     	movq	%rbx, 0x80(%rbp)
14543fe43:     	movl	$0xa8, %r8d
14543fe49:     	leaq	0x88(%rbp), %rcx
14543fe50:     	leaq	0x320(%rbp), %rdx
14543fe57:     	callq	0x1457731ed <.text+0x57721ed>
14543fe5c:     	cmpb	$0x0, 0x128(%rbp)
14543fe63:     	leaq	0x490(%rbp), %r13
14543fe6a:     	je	0x14543fef6 <.text+0x543eef6>
14543fe70:     	movq	0x4f8(%rbp), %rcx
14543fe77:     	callq	0x14544a260 <.text+0x5449260>
14543fe7c:     	nop
14543fe7d:     	movq	0x488(%rbp), %rax
14543fe84:     	cmpl	$0x2, (%rax)
14543fe87:     	je	0x14543fe96 <.text+0x543ee96>
14543fe89:     	movq	0x488(%rbp), %rcx
14543fe90:     	callq	0x14543d7e0 <.text+0x543c7e0>
14543fe95:     	nop
14543fe96:     	movq	0x4f8(%rbp), %rsi
14543fe9d:     	movq	$0x2, 0x10(%rsi)
14543fea5:     	movq	0xdf8(%rsi), %rdx
14543feac:     	cmpq	$-0x1, %rdx
14543feb0:     	je	0x14543feeb <.text+0x543eeeb>
14543feb2:     	testq	%rdx, %rdx
14543feb5:     	je	0x14543fec9 <.text+0x543eec9>
14543feb7:     	movq	0xe00(%rsi), %rcx
14543febe:     	movl	$0x1, %r8d
14543fec4:     	callq	0x1400021d0 <.text+0x11d0>
14543fec9:     	movq	0xe10(%rsi), %rdx
14543fed0:     	testq	%rdx, %rdx
14543fed3:     	je	0x14543feeb <.text+0x543eeeb>
14543fed5:     	movq	0xe18(%rsi), %rcx
14543fedc:     	shlq	$0x4, %rdx
14543fee0:     	movl	$0x8, %r8d
14543fee6:     	callq	0x1400021d0 <.text+0x11d0>
14543feeb:     	movq	$-0x1, 0xdf8(%rsi)
14543fef6:     	movq	%r12, %rcx
14543fef9:     	callq	0x14543e4c0 <.text+0x543d4c0>
14543fefe:     	nop
14543feff:     	movq	0x490(%rbp), %rdx
14543ff06:     	testq	%rdx, %rdx
14543ff09:     	je	0x14543fc40 <.text+0x543ec40>
14543ff0f:     	movl	$0x1, %r8d
14543ff15:     	movq	0x4c8(%rbp), %rcx
14543ff1c:     	callq	0x1400021d0 <.text+0x11d0>
14543ff21:     	jmp	0x14543fc40 <.text+0x543ec40>
14543ff26:     	movq	0x490(%rbp), %rdx
14543ff2d:     	testq	%rdx, %rdx
14543ff30:     	je	0x14543ff44 <.text+0x543ef44>
14543ff32:     	movl	$0x1, %r8d
14543ff38:     	movq	0x4c8(%rbp), %rcx
14543ff3f:     	callq	0x1400021d0 <.text+0x11d0>
14543ff44:     	incq	%r14
14543ff47:     	movq	%r14, %rax
14543ff4a:     	notq	%rax
14543ff4d:     	movq	%rax, 0x4b8(%rbp)
14543ff54:     	jmp	0x14543fc40 <.text+0x543ec40>
14543ff59:     	leaq	(%rax,%r15), %rcx
14543ff5d:     	addq	$0x18, %rcx
14543ff61:     	movq	$0x1, 0x20(%rsp)
14543ff6a:     	movl	$0x1, %r9d
14543ff70:     	movq	%rdi, %rdx
14543ff73:     	movq	%rsi, %r8
14543ff76:     	callq	0x1457744b0 <.text+0x57734b0>
14543ff7b:     	nop
14543ff7c:     	movq	0x28(%rbx), %rdi
14543ff80:     	jmp	0x14543fcc1 <.text+0x543ecc1>
14543ff85:     	movq	0xf70(%rsi), %rdx
14543ff8c:     	movq	0xf78(%rsi), %rax
14543ff93:     	leaq	0x80(%rbp), %rcx
14543ff9a:     	callq	*0x28(%rax)
14543ff9d:     	movq	0x80(%rbp), %r13
14543ffa4:     	movq	0x88(%rbp), %r15
14543ffab:     	movq	0x90(%rbp), %rax
14543ffb2:     	imulq	$0xe8, %rax, %rbx
14543ffb9:     	addq	%r15, %rbx
14543ffbc:     	movq	%r15, 0x320(%rbp)
14543ffc3:     	movq	%r15, 0x328(%rbp)
14543ffca:     	movq	%r13, 0x330(%rbp)
14543ffd1:     	movq	%rbx, 0x338(%rbp)
14543ffd8:     	movq	%r15, %rcx
14543ffdb:     	testq	%rax, %rax
14543ffde:     	movq	0x488(%rbp), %r12
14543ffe5:     	je	0x145440066 <.text+0x543f066>
14543ffeb:     	leaq	0x84(%rbp), %rsi
14543fff2:     	leaq	0xe8(%r15), %rcx
14543fff9:     	leaq	0x80(%rbp), %rdi
145440000:     	movl	-0xe8(%rcx), %eax
145440006:     	cmpl	$-0x1, %eax
145440009:     	je	0x14544005f <.text+0x543f05f>
14544000b:     	leaq	-0xe8(%rcx), %r14
145440012:     	movl	%eax, 0x80(%rbp)
145440018:     	leaq	0x4(%r14), %rdx
14544001c:     	movl	$0xe4, %r8d
145440022:     	movq	%rcx, 0x4c8(%rbp)
145440029:     	movq	%rsi, %rcx
14544002c:     	callq	0x1457731ed <.text+0x57721ed>
145440031:     	nop
145440032:     	movq	0x4f8(%rbp), %rcx
145440039:     	movq	%rdi, %rdx
14544003c:     	callq	0x14544d470 <.text+0x544c470>
145440041:     	nop
145440042:     	movq	0x4c8(%rbp), %rcx
145440049:     	addq	$0xe8, %rcx
145440050:     	addq	$0xe8, %r14
145440057:     	cmpq	%rbx, %r14
14544005a:     	jne	0x145440000 <.text+0x543f000>
14544005c:     	movq	%rbx, %rcx
14544005f:     	movq	%rcx, 0x328(%rbp)
145440066:     	movq	%r13, 0x4b8(%rbp)
14544006d:     	movq	%r15, 0x470(%rbp)
145440074:     	subq	%rcx, %rbx
145440077:     	shrq	$0x3, %rbx
14544007b:     	movabsq	$0x34f72c234f72c235, %rax # imm = 0x34F72C234F72C235
145440085:     	imulq	%rbx, %rax
145440089:     	movq	%rax, 0x4d8(%rbp)
145440090:     	movq	$0x0, 0x4e8(%rbp)
14544009b:     	movq	%rcx, 0x4c8(%rbp)
1454400a2:     	nopw	%cs:(%rax,%rax)
1454400b0:     	movq	0x4e8(%rbp), %rax
1454400b7:     	cmpq	%rax, 0x4d8(%rbp)
1454400be:     	je	0x1454400dc <.text+0x543f0dc>
1454400c0:     	incq	%rax
1454400c3:     	movq	%rax, 0x4e8(%rbp)
1454400ca:     	leaq	0xe8(%rcx), %rsi
1454400d1:     	callq	0x1455588f0 <.text+0x55578f0>
1454400d6:     	nop
1454400d7:     	movq	%rsi, %rcx
1454400da:     	jmp	0x1454400b0 <.text+0x543f0b0>
1454400dc:     	movq	0x4b8(%rbp), %rax
1454400e3:     	testq	%rax, %rax
1454400e6:     	je	0x145440101 <.text+0x543f101>
1454400e8:     	imulq	$0xe8, %rax, %rdx
1454400ef:     	movl	$0x8, %r8d
1454400f5:     	movq	0x470(%rbp), %rcx
1454400fc:     	callq	0x1400021d0 <.text+0x11d0>
145440101:     	cmpl	$0x2, (%r12)
145440106:     	je	0x145440e32 <.text+0x543fe32>
14544010c:     	movq	%r12, %rcx
14544010f:     	movaps	%xmm7, %xmm1
145440112:     	callq	0x1454aefa0 <.text+0x54adfa0>
145440117:     	cmpq	$0x2, (%r12)
14544011c:     	je	0x145440e32 <.text+0x543fe32>
145440122:     	movq	0x4f8(%rbp), %rcx
145440129:     	movq	0x5c0(%rcx), %rdx
145440130:     	movq	0x5c8(%rcx), %rax
145440137:     	movq	%rax, 0x4e8(%rbp)
14544013e:     	movq	0x5d0(%rcx), %rax
145440145:     	movq	$0x0, 0x5c0(%rcx)
145440150:     	movq	$0x4, 0x5c8(%rcx)
14544015b:     	movq	$0x0, 0x5d0(%rcx)
145440166:     	cmpq	$-0x1, %rdx
14544016a:     	je	0x145440bd7 <.text+0x543fbd7>
145440170:     	movq	%rdx, 0x4c8(%rbp)
145440177:     	testq	%rax, %rax
14544017a:     	je	0x145440bb5 <.text+0x543fbb5>
145440180:     	movq	0x4f8(%rbp), %rcx
145440187:     	movq	0xf80(%rcx), %rdx
14544018e:     	movq	%rdx, 0x4b8(%rbp)
145440195:     	movzbl	0x2ad(%rcx), %r13d
14544019d:     	movq	0x4e8(%rbp), %rdi
1454401a4:     	leaq	(%rdi,%rax,4), %r12
1454401a8:     	leaq	0xa18(%rcx), %rax
1454401af:     	movq	%rax, 0x440(%rbp)
1454401b6:     	leaq	0x560(%rcx), %rax
1454401bd:     	movq	%rax, 0x448(%rbp)
1454401c4:     	leaq	0xa48(%rcx), %rax
1454401cb:     	movq	%rax, 0x450(%rbp)
1454401d2:     	leaq	0x578(%rcx), %rax
1454401d9:     	movq	%rax, 0x430(%rbp)
1454401e0:     	movq	$0x0, 0x4d8(%rbp)
1454401eb:     	leaq	0x80(%rbp), %r15
1454401f2:     	nopw	%cs:(%rax,%rax)
145440200:     	cmpq	%r12, %rdi
145440203:     	je	0x145440aaa <.text+0x543faaa>
145440209:     	movl	(%rdi), %ebx
14544020b:     	movl	%ebx, %edx
14544020d:     	cmpl	$0x8, %r13d
145440211:     	ja	0x14544022e <.text+0x543f22e>
145440213:     	movl	$0x164, %eax            # imm = 0x164
145440218:     	btl	%r13d, %eax
14544021c:     	movl	%ebx, %edx
14544021e:     	jae	0x14544022e <.text+0x543f22e>
145440220:     	movl	%ebx, %edx
145440222:     	cmpl	$0x186a0, %ebx          # imm = 0x186A0
145440228:     	jae	0x1454402f0 <.text+0x543f2f0>
14544022e:     	movq	%r15, %rcx
145440231:     	callq	0x14546f110 <.text+0x546e110>
145440236:     	nop
145440237:     	addq	$0x4, %rdi
14544023b:     	cmpq	$-0x1, 0x80(%rbp)
145440243:     	je	0x145440200 <.text+0x543f200>
145440245:     	movups	0xe0(%rbp), %xmm0
14544024c:     	movaps	%xmm0, 0x380(%rbp)
145440253:     	movups	0xd0(%rbp), %xmm0
14544025a:     	movaps	%xmm0, 0x370(%rbp)
145440261:     	movups	0xc0(%rbp), %xmm0
145440268:     	movaps	%xmm0, 0x360(%rbp)
14544026f:     	movups	0x80(%rbp), %xmm0
145440276:     	movups	0x90(%rbp), %xmm1
14544027d:     	movups	0xa0(%rbp), %xmm2
145440284:     	movups	0xb0(%rbp), %xmm3
14544028b:     	movaps	%xmm3, 0x350(%rbp)
145440292:     	movaps	%xmm2, 0x340(%rbp)
145440299:     	movaps	%xmm1, 0x330(%rbp)
1454402a0:     	movaps	%xmm0, 0x320(%rbp)
1454402a7:     	cmpq	$0xffffff, 0x4b8(%rbp)  # imm = 0xFFFFFF
1454402b2:     	je	0x145440353 <.text+0x543f353>
1454402b8:     	movq	0x4f8(%rbp), %rcx
1454402bf:     	movq	0xa50(%rcx), %rax
1454402c6:     	movq	0xa58(%rcx), %rsi
1454402cd:     	movq	%rsi, %r14
1454402d0:     	testq	%rsi, %rsi
1454402d3:     	je	0x1454403dc <.text+0x543f3dc>
1454402d9:     	cmpq	$0x1, %rsi
1454402dd:     	jne	0x1454403a8 <.text+0x543f3a8>
1454402e3:     	xorl	%r14d, %r14d
1454402e6:     	jmp	0x1454403cd <.text+0x543f3cd>
1454402eb:     	nopl	(%rax,%rax)
1454402f0:     	leal	-0x186a0(%rbx), %eax
1454402f6:     	movl	%ebx, %edx
1454402f8:     	cmpl	$0x2edf, %eax           # imm = 0x2EDF
1454402fd:     	ja	0x14544022e <.text+0x543f22e>
145440303:     	movq	%rax, %rcx
145440306:     	movl	$0xcccccccd, %edx       # imm = 0xCCCCCCCD
14544030b:     	imulq	%rdx, %rcx
14544030f:     	shrq	$0x23, %rcx
145440313:     	addl	%ecx, %ecx
145440315:     	leal	(%rcx,%rcx,4), %ecx
145440318:     	movl	%eax, %r8d
14544031b:     	movl	%ebx, %edx
14544031d:     	subl	%ecx, %r8d
145440320:     	jne	0x14544022e <.text+0x543f22e>
145440326:     	imull	$0xcccd, %eax, %eax     # imm = 0xCCCD
14544032c:     	shrl	$0x13, %eax
14544032f:     	imull	$0xffffcccd, %eax, %eax # imm = 0xFFFFCCCD
145440335:     	decl	%eax
145440337:     	rorw	%ax
14544033a:     	movzwl	%ax, %eax
14544033d:     	cmpl	$0x199a, %eax           # imm = 0x199A
145440342:     	jb	0x14544034b <.text+0x543f34b>
145440344:     	movl	%ebx, %edx
145440346:     	jmp	0x14544022e <.text+0x543f22e>
14544034b:     	leal	0xa(%rbx), %edx
14544034e:     	jmp	0x14544022e <.text+0x543f22e>
145440353:     	movq	0x4f8(%rbp), %rax
14544035a:     	movq	0xa58(%rax), %rcx
145440361:     	testq	%rcx, %rcx
145440364:     	je	0x145440438 <.text+0x543f438>
14544036a:     	movq	0xa50(%rax), %rax
145440371:     	xorl	%edx, %edx
145440373:     	cmpq	$0x1, %rcx
145440377:     	je	0x14544039c <.text+0x543f39c>
145440379:     	nopl	(%rax)
145440380:     	movq	%rdx, %r8
145440383:     	movq	%rcx, %r9
145440386:     	shrq	%r9
145440389:     	addq	%r9, %rdx
14544038c:     	cmpl	%ebx, (%rax,%rdx,4)
14544038f:     	cmovaq	%r8, %rdx
145440393:     	subq	%r9, %rcx
145440396:     	cmpq	$0x1, %rcx
14544039a:     	ja	0x145440380 <.text+0x543f380>
14544039c:     	cmpl	%ebx, (%rax,%rdx,4)
14544039f:     	setne	%r14b
1454403a3:     	jmp	0x14544043b <.text+0x543f43b>
1454403a8:     	movq	%rsi, %rcx
1454403ab:     	xorl	%r14d, %r14d
1454403ae:     	nop
1454403b0:     	movq	%r14, %rdx
1454403b3:     	movq	%rcx, %r8
1454403b6:     	shrq	%r8
1454403b9:     	addq	%r8, %r14
1454403bc:     	cmpl	%ebx, (%rax,%r14,4)
1454403c0:     	cmovaq	%rdx, %r14
1454403c4:     	subq	%r8, %rcx
1454403c7:     	cmpq	$0x1, %rcx
1454403cb:     	ja	0x1454403b0 <.text+0x543f3b0>
1454403cd:     	cmpl	%ebx, (%rax,%r14,4)
1454403d1:     	jne	0x1454403d8 <.text+0x543f3d8>
1454403d3:     	xorl	%r14d, %r14d
1454403d6:     	jmp	0x14544043b <.text+0x543f43b>
1454403d8:     	adcq	$0x0, %r14
1454403dc:     	movq	0x450(%rbp), %rcx
1454403e3:     	cmpq	(%rcx), %rsi
1454403e6:     	jne	0x145440403 <.text+0x543f403>
1454403e8:     	movq	0x450(%rbp), %rcx
1454403ef:     	callq	0x145777a50 <.text+0x5776a50>
1454403f4:     	nop
1454403f5:     	movq	0x4f8(%rbp), %rax
1454403fc:     	movq	0xa50(%rax), %rax
145440403:     	leaq	(%rax,%r14,4), %rax
145440407:     	movq	%rsi, %r8
14544040a:     	subq	%r14, %r8
14544040d:     	jbe	0x145440425 <.text+0x543f425>
14544040f:     	leaq	0x4(%rax), %rcx
145440413:     	shlq	$0x2, %r8
145440417:     	movq	%rax, %r14
14544041a:     	movq	%rax, %rdx
14544041d:     	callq	0x1457731e1 <.text+0x57721e1>
145440422:     	movq	%r14, %rax
145440425:     	movl	%ebx, (%rax)
145440427:     	incq	%rsi
14544042a:     	movq	0x4f8(%rbp), %rax
145440431:     	movq	%rsi, 0xa58(%rax)
145440438:     	movb	$0x1, %r14b
14544043b:     	cmpq	$0xffffff, 0x4b8(%rbp)  # imm = 0xFFFFFF
145440446:     	setne	%bl
145440449:     	movq	0x488(%rbp), %rax
145440450:     	cmpl	$0x2, (%rax)
145440453:     	je	0x145440b6e <.text+0x543fb6e>
145440459:     	movl	$0x11, %edx
14544045e:     	leaq	0x12fdb9b(%rip), %rcx   # 0x14673e000
145440465:     	callq	0x145457cb0 <.text+0x5456cb0>
14544046a:     	nop
14544046b:     	testq	%rax, %rax
14544046e:     	leaq	0x12fdb8b(%rip), %rcx   # 0x14673e000
145440475:     	cmoveq	%rcx, %rax
145440479:     	movl	$0x11, %ecx
14544047e:     	cmoveq	%rcx, %rdx
145440482:     	movq	%rax, (%rbp)
145440486:     	movq	%rdx, 0x8(%rbp)
14544048a:     	movq	0x350(%rbp), %rcx
145440491:     	cmpq	$0x5, %rcx
145440495:     	leaq	0x320(%rbp), %rax
14544049c:     	je	0x1454404b2 <.text+0x543f4b2>
14544049e:     	cmpq	$0x4, %rcx
1454404a2:     	jne	0x1454404b9 <.text+0x543f4b9>
1454404a4:     	movl	$0x4, %ecx
1454404a9:     	cmpl	$0x2, 0x378(%rbp)
1454404b0:     	je	0x1454404c3 <.text+0x543f4c3>
1454404b2:     	movl	$0x3, %ecx
1454404b7:     	jmp	0x1454404c3 <.text+0x543f4c3>
1454404b9:     	cmpq	$0x5, %rcx
1454404bd:     	ja	0x145442480 <.text+0x5441480>
1454404c3:     	shlq	$0x4, %rcx
1454404c7:     	leaq	0x159245a(%rip), %rdx   # 0x1469d2928
1454404ce:     	addq	%rdx, %rcx
1454404d1:     	movq	%rcx, 0x80(%rbp)
1454404d8:     	leaq	-0x543e41f(%rip), %rcx  # 0x1400020c0 <.text+0x10c0>
1454404df:     	movq	%rcx, 0x88(%rbp)
1454404e6:     	movq	%rax, 0x90(%rbp)
1454404ed:     	leaq	-0x543e414(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454404f4:     	movq	%rax, 0x98(%rbp)
1454404fb:     	leaq	0x458(%rbp), %rcx
145440502:     	leaq	0x159247f(%rip), %rdx   # 0x1469d2988
145440509:     	movq	%r15, %r8
14544050c:     	callq	0x145728390 <.text+0x5727390>
145440511:     	nop
145440512:     	testb	%r14b, %r14b
145440515:     	je	0x145440583 <.text+0x543f583>
145440517:     	movl	$0x17, %edx
14544051c:     	leaq	0x12fdb12(%rip), %rcx   # 0x14673e035
145440523:     	callq	0x145457cb0 <.text+0x5456cb0>
145440528:     	nop
145440529:     	testq	%rax, %rax
14544052c:     	leaq	0x12fdb02(%rip), %rcx   # 0x14673e035
145440533:     	cmoveq	%rcx, %rax
145440537:     	movl	$0x17, %ecx
14544053c:     	cmoveq	%rcx, %rdx
145440540:     	movq	%rax, 0x3f0(%rbp)
145440547:     	movq	%rdx, 0x3f8(%rbp)
14544054e:     	leaq	0x3f0(%rbp), %rax
145440555:     	movq	%rax, 0x490(%rbp)
14544055c:     	leaq	-0x543e4a3(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145440563:     	movq	%rax, 0x498(%rbp)
14544056a:     	movq	%r15, %rcx
14544056d:     	leaq	0x12fdad8(%rip), %rdx   # 0x14673e04c
145440574:     	leaq	0x490(%rbp), %r8
14544057b:     	callq	0x145728390 <.text+0x5727390>
145440580:     	nop
145440581:     	jmp	0x1454405ed <.text+0x543f5ed>
145440583:     	movl	$0x11, %edx
145440588:     	leaq	0x12fda82(%rip), %rcx   # 0x14673e011
14544058f:     	callq	0x145457cb0 <.text+0x5456cb0>
145440594:     	nop
145440595:     	testq	%rax, %rax
145440598:     	leaq	0x12fda72(%rip), %rcx   # 0x14673e011
14544059f:     	cmoveq	%rcx, %rax
1454405a3:     	movl	$0x11, %ecx
1454405a8:     	cmoveq	%rcx, %rdx
1454405ac:     	movq	%rax, 0x3f0(%rbp)
1454405b3:     	movq	%rdx, 0x3f8(%rbp)
1454405ba:     	leaq	0x3f0(%rbp), %rax
1454405c1:     	movq	%rax, 0x490(%rbp)
1454405c8:     	leaq	-0x543e50f(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454405cf:     	movq	%rax, 0x498(%rbp)
1454405d6:     	movq	%r15, %rcx
1454405d9:     	leaq	0x12fda42(%rip), %rdx   # 0x14673e022
1454405e0:     	leaq	0x490(%rbp), %r8
1454405e7:     	callq	0x145728390 <.text+0x5727390>
1454405ec:     	nop
1454405ed:     	movups	0x80(%rbp), %xmm0
1454405f4:     	movaps	%xmm0, 0x490(%rbp)
1454405fb:     	movq	0x90(%rbp), %rax
145440602:     	movq	%rax, 0x4a0(%rbp)
145440609:     	movq	%rbp, %rax
14544060c:     	movq	%rax, 0x80(%rbp)
145440613:     	leaq	-0x543e55a(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14544061a:     	movq	%rax, 0x88(%rbp)
145440621:     	leaq	0x458(%rbp), %rax
145440628:     	movq	%rax, 0x90(%rbp)
14544062f:     	leaq	-0x543e556(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
145440636:     	movq	%rcx, 0x98(%rbp)
14544063d:     	leaq	0x490(%rbp), %rax
145440644:     	movq	%rax, 0xa0(%rbp)
14544064b:     	movq	%rcx, 0xa8(%rbp)
145440652:     	leaq	0x3f0(%rbp), %rcx
145440659:     	leaq	0x12fd9fd(%rip), %rdx   # 0x14673e05d
145440660:     	movq	%r15, %r8
145440663:     	callq	0x145728390 <.text+0x5727390>
145440668:     	nop
145440669:     	movq	0x490(%rbp), %rdx
145440670:     	testq	%rdx, %rdx
145440673:     	je	0x145440687 <.text+0x543f687>
145440675:     	movq	0x498(%rbp), %rcx
14544067c:     	movl	$0x1, %r8d
145440682:     	callq	0x1400021d0 <.text+0x11d0>
145440687:     	movq	0x458(%rbp), %rdx
14544068e:     	testq	%rdx, %rdx
145440691:     	je	0x1454406a5 <.text+0x543f6a5>
145440693:     	movq	0x460(%rbp), %rcx
14544069a:     	movl	$0x1, %r8d
1454406a0:     	callq	0x1400021d0 <.text+0x11d0>
1454406a5:     	movq	0x3f0(%rbp), %rax
1454406ac:     	movq	%rax, 0x480(%rbp)
1454406b3:     	movq	0x3f8(%rbp), %rdx
1454406ba:     	movq	0x400(%rbp), %r8
1454406c1:     	movq	%r15, %rcx
1454406c4:     	movq	%rdx, 0x478(%rbp)
1454406cb:     	callq	0x14545dc90 <.text+0x545cc90>
1454406d0:     	nop
1454406d1:     	movq	0x4f8(%rbp), %rax
1454406d8:     	movq	0x570(%rax), %rsi
1454406df:     	cmpq	0x560(%rax), %rsi
1454406e6:     	jne	0x1454406f5 <.text+0x543f6f5>
1454406e8:     	movq	0x448(%rbp), %rcx
1454406ef:     	callq	0x145774710 <.text+0x5773710>
1454406f4:     	nop
1454406f5:     	movq	0x4f8(%rbp), %rdx
1454406fc:     	movq	0x568(%rdx), %rax
145440703:     	movq	%rsi, %rcx
145440706:     	shlq	$0x5, %rcx
14544070a:     	movups	0x80(%rbp), %xmm0
145440711:     	movups	0x90(%rbp), %xmm1
145440718:     	movups	%xmm1, 0x10(%rax,%rcx)
14544071d:     	movups	%xmm0, (%rax,%rcx)
145440721:     	incq	%rsi
145440724:     	movq	%rsi, 0x570(%rdx)
14544072b:     	movq	0x480(%rbp), %rdx
145440732:     	testq	%rdx, %rdx
145440735:     	je	0x145440749 <.text+0x543f749>
145440737:     	movl	$0x1, %r8d
14544073d:     	movq	0x478(%rbp), %rcx
145440744:     	callq	0x1400021d0 <.text+0x11d0>
145440749:     	callq	0x140002200 <.text+0x1200>
14544074e:     	movl	$0x1, %ecx
145440753:     	movl	$0x1, %edx
145440758:     	callq	0x1400021c0 <.text+0x11c0>
14544075d:     	testq	%rax, %rax
145440760:     	je	0x14544246e <.text+0x544146e>
145440766:     	movb	$0x7b, (%rax)
145440769:     	movq	$0x1, 0x80(%rbp)
145440774:     	movq	%rax, 0x88(%rbp)
14544077b:     	movq	$0x1, 0x90(%rbp)
145440786:     	movb	$0x1, 0x98(%rbp)
14544078d:     	leaq	0x12fd8d3(%rip), %rax   # 0x14673e067
145440794:     	movq	%rax, 0x20(%rsp)
145440799:     	movq	$0x4, 0x28(%rsp)
1454407a2:     	movl	$0x4, %r9d
1454407a8:     	leaq	0x490(%rbp), %rcx
1454407af:     	movq	%r15, %rdx
1454407b2:     	leaq	0x12fd8aa(%rip), %r8    # 0x14673e063
1454407b9:     	callq	0x145456ed0 <.text+0x5455ed0>
1454407be:     	nop
1454407bf:     	movups	0x328(%rbp), %xmm0
1454407c6:     	movups	%xmm0, 0x20(%rsp)
1454407cb:     	movl	$0x4, %r9d
1454407d1:     	movq	%r15, %rcx
1454407d4:     	leaq	0x490(%rbp), %rdx
1454407db:     	leaq	0x12fd889(%rip), %r8    # 0x14673e06b
1454407e2:     	callq	0x145456ed0 <.text+0x5455ed0>
1454407e7:     	nop
1454407e8:     	movl	$0x3, %eax
1454407ed:     	movq	0x350(%rbp), %rcx
1454407f4:     	cmpq	$0x4, %rcx
1454407f8:     	je	0x145440a36 <.text+0x543fa36>
1454407fe:     	cmpq	$0x5, %rcx
145440802:     	je	0x145440806 <.text+0x543f806>
145440804:     	movl	%ecx, %eax
145440806:     	movl	%eax, 0x20(%rsp)
14544080a:     	movl	$0x6, %r9d
145440810:     	leaq	0x490(%rbp), %rcx
145440817:     	movq	%r15, %rdx
14544081a:     	leaq	0x12fd84e(%rip), %r8    # 0x14673e06f
145440821:     	callq	0x145454010 <.text+0x5453010>
145440826:     	nop
145440827:     	movl	0x374(%rbp), %ecx
14544082d:     	movb	$0x1, 0x4c6(%rbp)
145440834:     	callq	0x1454709b0 <.text+0x546f9b0>
145440839:     	nop
14544083a:     	testq	%rax, %rax
14544083d:     	cmoveq	%rax, %rdx
145440841:     	movl	$0x1, %ecx
145440846:     	cmoveq	%rcx, %rax
14544084a:     	movb	$0x0, 0x4c6(%rbp)
145440851:     	movq	%rdx, 0x28(%rsp)
145440856:     	movq	%rax, 0x20(%rsp)
14544085b:     	movl	$0x4, %r9d
145440861:     	movq	%r15, %rcx
145440864:     	leaq	0x490(%rbp), %rdx
14544086b:     	leaq	0x12fd803(%rip), %r8    # 0x14673e075
145440872:     	callq	0x145456ed0 <.text+0x5455ed0>
145440877:     	nop
145440878:     	movzbl	0x388(%rbp), %ecx
14544087f:     	movb	$0x1, 0x4c5(%rbp)
145440886:     	callq	0x145471710 <.text+0x5470710>
14544088b:     	nop
14544088c:     	leaq	0x490(%rbp), %rsi
145440893:     	movb	$0x0, 0x4c5(%rbp)
14544089a:     	movq	%rdx, 0x28(%rsp)
14544089f:     	movq	%rax, 0x20(%rsp)
1454408a4:     	movl	$0x4, %r9d
1454408aa:     	movq	%rsi, %rcx
1454408ad:     	movq	%r15, %rdx
1454408b0:     	leaq	0x12fd7c2(%rip), %r8    # 0x14673e079
1454408b7:     	callq	0x145456ed0 <.text+0x5455ed0>
1454408bc:     	nop
1454408bd:     	movl	$0x3, %r8d
1454408c3:     	movq	%rsi, %rcx
1454408c6:     	leaq	0x12fd7b0(%rip), %rdx   # 0x14673e07d
1454408cd:     	callq	0x145456c20 <.text+0x5455c20>
1454408d2:     	nop
1454408d3:     	movzbl	%r14b, %esi
1454408d7:     	xorq	$0x5, %rsi
1454408db:     	movq	0x490(%rbp), %rax
1454408e2:     	movq	0x4a0(%rbp), %rcx
1454408e9:     	subq	%rcx, %rax
1454408ec:     	cmpq	%rax, %rsi
1454408ef:     	movl	%r14d, 0x470(%rbp)
1454408f6:     	ja	0x145440a48 <.text+0x543fa48>
1454408fc:     	movl	%ebx, %r14d
1454408ff:     	cmpb	$0x0, 0x470(%rbp)
145440906:     	leaq	0x12ff975(%rip), %rdx   # 0x146740282
14544090d:     	leaq	0x12ff973(%rip), %rax   # 0x146740287
145440914:     	cmovneq	%rax, %rdx
145440918:     	addq	0x498(%rbp), %rcx
14544091f:     	movq	%rsi, %r8
145440922:     	callq	0x1457731ed <.text+0x57721ed>
145440927:     	addq	%rsi, 0x4a0(%rbp)
14544092e:     	movups	0x490(%rbp), %xmm0
145440935:     	movaps	%xmm0, 0x80(%rbp)
14544093c:     	movups	0x4a0(%rbp), %xmm0
145440943:     	movaps	%xmm0, 0x90(%rbp)
14544094a:     	movq	0x90(%rbp), %rsi
145440951:     	movq	0x80(%rbp), %rax
145440958:     	movq	%rax, 0x480(%rbp)
14544095f:     	cmpq	%rsi, %rax
145440962:     	je	0x145440a76 <.text+0x543fa76>
145440968:     	movq	0x88(%rbp), %rax
14544096f:     	movq	%rax, 0x478(%rbp)
145440976:     	movb	$0x7d, (%rax,%rsi)
14544097a:     	movq	0x4f8(%rbp), %rax
145440981:     	movq	0x588(%rax), %rbx
145440988:     	cmpq	0x578(%rax), %rbx
14544098f:     	jne	0x14544099e <.text+0x543f99e>
145440991:     	movq	0x430(%rbp), %rcx
145440998:     	callq	0x1457745c0 <.text+0x57735c0>
14544099d:     	nop
14544099e:     	incq	%rsi
1454409a1:     	movq	0x4f8(%rbp), %rdx
1454409a8:     	movq	0x580(%rdx), %rax
1454409af:     	leaq	(%rbx,%rbx,2), %rcx
1454409b3:     	movq	0x480(%rbp), %r8
1454409ba:     	movq	%r8, (%rax,%rcx,8)
1454409be:     	movq	0x478(%rbp), %r8
1454409c5:     	movq	%r8, 0x8(%rax,%rcx,8)
1454409ca:     	movq	%rsi, 0x10(%rax,%rcx,8)
1454409cf:     	incq	%rbx
1454409d2:     	movq	%rbx, 0x588(%rdx)
1454409d9:     	movq	0x320(%rbp), %rdx
1454409e0:     	testq	%rdx, %rdx
1454409e3:     	je	0x1454409f7 <.text+0x543f9f7>
1454409e5:     	movq	0x328(%rbp), %rcx
1454409ec:     	movl	$0x1, %r8d
1454409f2:     	callq	0x1400021d0 <.text+0x11d0>
1454409f7:     	movq	0x338(%rbp), %rdx
1454409fe:     	testq	%rdx, %rdx
145440a01:     	je	0x145440a19 <.text+0x543fa19>
145440a03:     	movq	0x340(%rbp), %rcx
145440a0a:     	shlq	$0x3, %rdx
145440a0e:     	movl	$0x4, %r8d
145440a14:     	callq	0x1400021d0 <.text+0x11d0>
145440a19:     	andb	0x470(%rbp), %r14b
145440a20:     	movq	0x4d8(%rbp), %rax
145440a27:     	orb	%r14b, %al
145440a2a:     	movq	%rax, 0x4d8(%rbp)
145440a31:     	jmp	0x145440200 <.text+0x543f200>
145440a36:     	cmpl	$0x2, 0x378(%rbp)
145440a3d:     	je	0x145440804 <.text+0x543f804>
145440a43:     	jmp	0x145440806 <.text+0x543f806>
145440a48:     	movq	$0x1, 0x20(%rsp)
145440a51:     	movl	$0x1, %r9d
145440a57:     	movq	%rcx, %rdx
145440a5a:     	leaq	0x490(%rbp), %rcx
145440a61:     	movq	%rsi, %r8
145440a64:     	callq	0x1457744b0 <.text+0x57734b0>
145440a69:     	nop
145440a6a:     	movq	0x4a0(%rbp), %rcx
145440a71:     	jmp	0x1454408fc <.text+0x543f8fc>
145440a76:     	movq	$0x1, 0x20(%rsp)
145440a7f:     	movl	$0x1, %r8d
145440a85:     	movl	$0x1, %r9d
145440a8b:     	movq	%r15, %rcx
145440a8e:     	movq	%rsi, %rdx
145440a91:     	callq	0x1457744b0 <.text+0x57734b0>
145440a96:     	nop
145440a97:     	movq	0x80(%rbp), %rax
145440a9e:     	movq	%rax, 0x480(%rbp)
145440aa5:     	jmp	0x145440968 <.text+0x543f968>
145440aaa:     	movq	0x4c8(%rbp), %rdx
145440ab1:     	testq	%rdx, %rdx
145440ab4:     	je	0x145440acc <.text+0x543facc>
145440ab6:     	shlq	$0x2, %rdx
145440aba:     	movl	$0x4, %r8d
145440ac0:     	movq	0x4e8(%rbp), %rcx
145440ac7:     	callq	0x1400021d0 <.text+0x11d0>
145440acc:     	testb	$0x1, 0x4d8(%rbp)
145440ad3:     	movq	0x488(%rbp), %r12
145440ada:     	je	0x145440bd7 <.text+0x543fbd7>
145440ae0:     	callq	0x145703e20 <.text+0x5702e20>
145440ae5:     	movl	%eax, 0x320(%rbp)
145440aeb:     	movl	%edx, 0x324(%rbp)
145440af1:     	leaq	0x80(%rbp), %rcx
145440af8:     	leaq	0x320(%rbp), %rdx
145440aff:     	movl	$0xd53e8000, %r8d       # imm = 0xD53E8000
145440b05:     	movl	$0x19db1de, %r9d        # imm = 0x19DB1DE
145440b0b:     	callq	0x145703dd0 <.text+0x5702dd0>
145440b10:     	cmpb	$0x0, 0x80(%rbp)
145440b17:     	jne	0x145440b22 <.text+0x543fb22>
145440b19:     	movq	0x88(%rbp), %r9
145440b20:     	jmp	0x145440b25 <.text+0x543fb25>
145440b22:     	xorl	%r9d, %r9d
145440b25:     	leaq	0x80(%rbp), %rcx
145440b2c:     	movl	$0x1, %r8d
145440b32:     	movq	0x440(%rbp), %rsi
145440b39:     	movq	%rsi, %rdx
145440b3c:     	callq	0x14552fae0 <.text+0x552eae0>
145440b41:     	movb	$0x1, 0x4c7(%rbp)
145440b48:     	movq	%rsi, %rcx
145440b4b:     	callq	0x1454356a0 <.text+0x54346a0>
145440b50:     	nop
145440b51:     	movb	$0x0, 0x4c7(%rbp)
145440b58:     	leaq	0x80(%rbp), %rdx
145440b5f:     	movq	0x4f8(%rbp), %rcx
145440b66:     	callq	0x14544f390 <.text+0x544e390>
145440b6b:     	nop
145440b6c:     	jmp	0x145440bd7 <.text+0x543fbd7>
145440b6e:     	movq	0x320(%rbp), %rdx
145440b75:     	testq	%rdx, %rdx
145440b78:     	je	0x145440b8c <.text+0x543fb8c>
145440b7a:     	movq	0x328(%rbp), %rcx
145440b81:     	movl	$0x1, %r8d
145440b87:     	callq	0x1400021d0 <.text+0x11d0>
145440b8c:     	movq	0x338(%rbp), %rdx
145440b93:     	testq	%rdx, %rdx
145440b96:     	movq	0x488(%rbp), %r12
145440b9d:     	je	0x145440bb5 <.text+0x543fbb5>
145440b9f:     	movq	0x340(%rbp), %rcx
145440ba6:     	shlq	$0x3, %rdx
145440baa:     	movl	$0x4, %r8d
145440bb0:     	callq	0x1400021d0 <.text+0x11d0>
145440bb5:     	movq	0x4c8(%rbp), %rdx
145440bbc:     	testq	%rdx, %rdx
145440bbf:     	je	0x145440bd7 <.text+0x543fbd7>
145440bc1:     	shlq	$0x2, %rdx
145440bc5:     	movl	$0x4, %r8d
145440bcb:     	movq	0x4e8(%rbp), %rcx
145440bd2:     	callq	0x1400021d0 <.text+0x11d0>
145440bd7:     	cmpq	$0x2, (%r12)
145440bdc:     	je	0x145440e32 <.text+0x543fe32>
145440be2:     	movq	0x4f8(%rbp), %rax
145440be9:     	movq	0x5d8(%rax), %rsi
145440bf0:     	movq	0x5e0(%rax), %rdi
145440bf7:     	movq	0x5e8(%rax), %r14
145440bfe:     	movq	$0x0, 0x5d8(%rax)
145440c09:     	movq	$0x8, 0x5e0(%rax)
145440c14:     	movq	$0x0, 0x5e8(%rax)
145440c1f:     	cmpq	$0xffffff, 0xf80(%rax)  # imm = 0xFFFFFF
145440c2a:     	jne	0x145440c66 <.text+0x543fc66>
145440c2c:     	testq	%r14, %r14
145440c2f:     	je	0x145440d17 <.text+0x543fd17>
145440c35:     	leaq	0x8(%rdi), %rbx
145440c39:     	jmp	0x145440c4d <.text+0x543fc4d>
145440c3b:     	nopl	(%rax,%rax)
145440c40:     	addq	$0x20, %rbx
145440c44:     	decq	%r14
145440c47:     	je	0x145440d17 <.text+0x543fd17>
145440c4d:     	movq	-0x8(%rbx), %rdx
145440c51:     	testq	%rdx, %rdx
145440c54:     	je	0x145440c40 <.text+0x543fc40>
145440c56:     	movq	(%rbx), %rcx
145440c59:     	movl	$0x1, %r8d
145440c5f:     	callq	0x1400021d0 <.text+0x11d0>
145440c64:     	jmp	0x145440c40 <.text+0x543fc40>
145440c66:     	movq	%r14, %r12
145440c69:     	shlq	$0x5, %r12
145440c6d:     	addq	%rdi, %r12
145440c70:     	movq	%rdi, 0x80(%rbp)
145440c77:     	movq	%rsi, 0x90(%rbp)
145440c7e:     	movq	%r12, 0x98(%rbp)
145440c85:     	leaq	0xa18(%rax), %rbx
145440c8c:     	testq	%r14, %r14
145440c8f:     	je	0x145440d3a <.text+0x543fd3a>
145440c95:     	leaq	0x20(%rdi), %r14
145440c99:     	xorl	%r15d, %r15d
145440c9c:     	jmp	0x145440cbb <.text+0x543fcbb>
145440c9e:     	nop
145440ca0:     	orb	%r14b, %r15b
145440ca3:     	movq	0x4d8(%rbp), %r14
145440caa:     	addq	$0x20, %r14
145440cae:     	addq	$0x20, %r13
145440cb2:     	cmpq	%r12, %r13
145440cb5:     	je	0x145440d82 <.text+0x543fd82>
145440cbb:     	movq	-0x20(%r14), %rax
145440cbf:     	cmpq	$-0x1, %rax
145440cc3:     	je	0x145440d40 <.text+0x543fd40>
145440cc5:     	movq	%rax, 0x4e8(%rbp)
145440ccc:     	leaq	-0x20(%r14), %r13
145440cd0:     	movq	%r14, 0x4d8(%rbp)
145440cd7:     	movq	-0x18(%r14), %rdx
145440cdb:     	movq	0x10(%r13), %r8
145440cdf:     	movzbl	0x18(%r13), %r9d
145440ce4:     	movq	%rbx, %rcx
145440ce7:     	movq	%rdx, 0x4c8(%rbp)
145440cee:     	callq	0x14542f570 <.text+0x542e570>
145440cf3:     	nop
145440cf4:     	movl	%eax, %r14d
145440cf7:     	movq	0x4e8(%rbp), %rdx
145440cfe:     	testq	%rdx, %rdx
145440d01:     	je	0x145440ca0 <.text+0x543fca0>
145440d03:     	movl	$0x1, %r8d
145440d09:     	movq	0x4c8(%rbp), %rcx
145440d10:     	callq	0x1400021d0 <.text+0x11d0>
145440d15:     	jmp	0x145440ca0 <.text+0x543fca0>
145440d17:     	testq	%rsi, %rsi
145440d1a:     	je	0x145440e32 <.text+0x543fe32>
145440d20:     	shlq	$0x5, %rsi
145440d24:     	movl	$0x8, %r8d
145440d2a:     	movq	%rdi, %rcx
145440d2d:     	movq	%rsi, %rdx
145440d30:     	callq	0x1400021d0 <.text+0x11d0>
145440d35:     	jmp	0x145440e32 <.text+0x543fe32>
145440d3a:     	xorl	%r15d, %r15d
145440d3d:     	movq	%rdi, %r14
145440d40:     	movq	%r14, 0x88(%rbp)
145440d47:     	subq	%r14, %r12
145440d4a:     	je	0x145440d82 <.text+0x543fd82>
145440d4c:     	shrq	$0x5, %r12
145440d50:     	addq	$0x8, %r14
145440d54:     	jmp	0x145440d69 <.text+0x543fd69>
145440d56:     	nopw	%cs:(%rax,%rax)
145440d60:     	addq	$0x20, %r14
145440d64:     	decq	%r12
145440d67:     	je	0x145440d82 <.text+0x543fd82>
145440d69:     	movq	-0x8(%r14), %rdx
145440d6d:     	testq	%rdx, %rdx
145440d70:     	je	0x145440d60 <.text+0x543fd60>
145440d72:     	movq	(%r14), %rcx
145440d75:     	movl	$0x1, %r8d
145440d7b:     	callq	0x1400021d0 <.text+0x11d0>
145440d80:     	jmp	0x145440d60 <.text+0x543fd60>
145440d82:     	testq	%rsi, %rsi
145440d85:     	je	0x145440d9c <.text+0x543fd9c>
145440d87:     	shlq	$0x5, %rsi
145440d8b:     	movl	$0x8, %r8d
145440d91:     	movq	%rdi, %rcx
145440d94:     	movq	%rsi, %rdx
145440d97:     	callq	0x1400021d0 <.text+0x11d0>
145440d9c:     	testb	$0x1, %r15b
145440da0:     	movq	0x488(%rbp), %r12
145440da7:     	je	0x145440e32 <.text+0x543fe32>
145440dad:     	callq	0x145703e20 <.text+0x5702e20>
145440db2:     	movl	%eax, 0x320(%rbp)
145440db8:     	movl	%edx, 0x324(%rbp)
145440dbe:     	leaq	0x80(%rbp), %rcx
145440dc5:     	leaq	0x320(%rbp), %rdx
145440dcc:     	movl	$0xd53e8000, %r8d       # imm = 0xD53E8000
145440dd2:     	movl	$0x19db1de, %r9d        # imm = 0x19DB1DE
145440dd8:     	callq	0x145703dd0 <.text+0x5702dd0>
145440ddd:     	cmpb	$0x0, 0x80(%rbp)
145440de4:     	jne	0x145440def <.text+0x543fdef>
145440de6:     	movq	0x88(%rbp), %r9
145440ded:     	jmp	0x145440df2 <.text+0x543fdf2>
145440def:     	xorl	%r9d, %r9d
145440df2:     	leaq	0x80(%rbp), %rcx
145440df9:     	movl	$0x1, %r8d
145440dff:     	movq	%rbx, %rdx
145440e02:     	callq	0x14552fae0 <.text+0x552eae0>
145440e07:     	movb	$0x1, 0x4c4(%rbp)
145440e0e:     	movq	%rbx, %rcx
145440e11:     	callq	0x1454356a0 <.text+0x54346a0>
145440e16:     	nop
145440e17:     	movb	$0x0, 0x4c4(%rbp)
145440e1e:     	leaq	0x80(%rbp), %rdx
145440e25:     	movq	0x4f8(%rbp), %rcx
145440e2c:     	callq	0x14544f390 <.text+0x544e390>
145440e31:     	nop
145440e32:     	leaq	0x80(%rbp), %rcx
145440e39:     	movq	0x4f8(%rbp), %rsi
145440e40:     	movq	%rsi, %rdx
145440e43:     	callq	0x1454502d0 <.text+0x544f2d0>
145440e48:     	cmpb	$0x2, 0x92(%rbp)
145440e4f:     	je	0x145440ed6 <.text+0x543fed6>
145440e55:     	movl	0x90(%rbp), %eax
145440e5b:     	movl	%eax, 0x330(%rbp)
145440e61:     	movups	0x80(%rbp), %xmm0
145440e68:     	movaps	%xmm0, 0x320(%rbp)
145440e6f:     	addq	$0xa18, %rsi            # imm = 0xA18
145440e76:     	leaq	-0x18(%rbp), %rcx
145440e7a:     	leaq	0x320(%rbp), %r8
145440e81:     	movq	%rsi, %rdx
145440e84:     	callq	0x14552f770 <.text+0x552e770>
145440e89:     	cmpq	$0x0, -0x8(%rbp)
145440e8e:     	je	0x145440eba <.text+0x543feba>
145440e90:     	movb	$0x1, 0x4c3(%rbp)
145440e97:     	movq	%rsi, %rcx
145440e9a:     	callq	0x1454356a0 <.text+0x54346a0>
145440e9f:     	nop
145440ea0:     	movb	$0x0, 0x4c3(%rbp)
145440ea7:     	leaq	-0x18(%rbp), %rdx
145440eab:     	movq	0x4f8(%rbp), %rcx
145440eb2:     	callq	0x14544f390 <.text+0x544e390>
145440eb7:     	nop
145440eb8:     	jmp	0x145440ed6 <.text+0x543fed6>
145440eba:     	movq	-0x18(%rbp), %rdx
145440ebe:     	testq	%rdx, %rdx
145440ec1:     	je	0x145440ed6 <.text+0x543fed6>
145440ec3:     	movq	-0x10(%rbp), %rcx
145440ec7:     	shlq	$0x3, %rdx
145440ecb:     	movl	$0x8, %r8d
145440ed1:     	callq	0x1400021d0 <.text+0x11d0>
145440ed6:     	cmpl	$0x2, (%r12)
145440edb:     	movq	0x4f8(%rbp), %rsi
145440ee2:     	je	0x145441207 <.text+0x5440207>
145440ee8:     	movzbl	0x9c9(%rsi), %eax
145440eef:     	movl	%eax, %ecx
145440ef1:     	andb	$0x6, %cl
145440ef4:     	cmpb	$0x4, %cl
145440ef7:     	jne	0x145440f05 <.text+0x543ff05>
145440ef9:     	cmpb	%al, 0x1045(%rsi)
145440eff:     	jne	0x1454412e4 <.text+0x54402e4>
145440f05:     	movq	0x570(%rsi), %rax
145440f0c:     	movq	%rax, 0x4a0(%rbp)
145440f13:     	movups	0x560(%rsi), %xmm0
145440f1a:     	movaps	%xmm0, 0x490(%rbp)
145440f21:     	movq	$0x0, 0x560(%rsi)
145440f2c:     	movq	$0x8, 0x568(%rsi)
145440f37:     	movq	$0x0, 0x570(%rsi)
145440f42:     	movq	0x588(%rsi), %rax
145440f49:     	movq	%rax, 0x330(%rbp)
145440f50:     	movups	0x578(%rsi), %xmm0
145440f57:     	movaps	%xmm0, 0x320(%rbp)
145440f5e:     	movq	$0x0, 0x578(%rsi)
145440f69:     	movq	$0x8, 0x580(%rsi)
145440f74:     	movq	$0x0, 0x588(%rsi)
145440f7f:     	movq	$-0xb0, %rax
145440f86:     	addq	0xa08(%rsi), %rax
145440f8d:     	imulq	$0xb0, 0xa10(%rsi), %rcx
145440f98:     	nopl	(%rax,%rax)
145440fa0:     	testq	%rcx, %rcx
145440fa3:     	je	0x145441065 <.text+0x5440065>
145440fa9:     	leaq	0xb0(%rax), %rsi
145440fb0:     	addq	$-0xb0, %rcx
145440fb7:     	cmpb	$0x0, 0x158(%rax)
145440fbe:     	movq	%rsi, %rax
145440fc1:     	je	0x145440fa0 <.text+0x543ffa0>
145440fc3:     	movq	$0x0, 0x80(%rbp)
145440fce:     	movq	$0x1, 0x88(%rbp)
145440fd9:     	movq	$0x0, 0x90(%rbp)
145440fe4:     	movq	0x498(%rbp), %rdi
145440feb:     	movq	0x4a0(%rbp), %r14
145440ff2:     	shlq	$0x5, %r14
145440ff6:     	addq	%rdi, %r14
145440ff9:     	leaq	0x80(%rbp), %rbx
145441000:     	cmpq	%r14, %rdi
145441003:     	je	0x145441028 <.text+0x5440028>
145441005:     	nopw	%cs:(%rax,%rax)
145441010:     	movq	%rsi, %rcx
145441013:     	movq	%rdi, %rdx
145441016:     	movq	%rbx, %r8
145441019:     	callq	0x1455133c0 <.text+0x55123c0>
14544101e:     	nop
14544101f:     	addq	$0x20, %rdi
145441023:     	cmpq	%r14, %rdi
145441026:     	jne	0x145441010 <.text+0x5440010>
145441028:     	movq	0x90(%rsi), %rcx
14544102f:     	addq	$0x10, %rcx
145441033:     	movq	0x88(%rbp), %rdx
14544103a:     	movq	0x90(%rbp), %r8
145441041:     	callq	0x1455773c0 <.text+0x55763c0>
145441046:     	nop
145441047:     	movq	0x80(%rbp), %rdx
14544104e:     	testq	%rdx, %rdx
145441051:     	je	0x145441065 <.text+0x5440065>
145441053:     	movq	0x88(%rbp), %rcx
14544105a:     	movl	$0x1, %r8d
145441060:     	callq	0x1400021d0 <.text+0x11d0>
145441065:     	movq	0x320(%rbp), %rbx
14544106c:     	movq	0x328(%rbp), %rsi
145441073:     	movq	0x330(%rbp), %rax
14544107a:     	leaq	(%rax,%rax,2), %rcx
14544107e:     	leaq	(%rsi,%rcx,8), %r14
145441082:     	movq	%rsi, 0x80(%rbp)
145441089:     	movq	%rbx, 0x90(%rbp)
145441090:     	movq	%r14, 0x98(%rbp)
145441097:     	movq	%rsi, %r13
14544109a:     	testq	%rax, %rax
14544109d:     	je	0x145441133 <.text+0x5440133>
1454410a3:     	movq	0x4f8(%rbp), %rax
1454410aa:     	movq	0xf70(%rax), %rdi
1454410b1:     	movq	0xf78(%rax), %r15
1454410b8:     	leaq	0x18(%rsi), %r13
1454410bc:     	jmp	0x1454410df <.text+0x54400df>
1454410be:     	nop
1454410c0:     	movq	0x4d8(%rbp), %r13
1454410c7:     	addq	$0x18, %r13
1454410cb:     	addq	$0x18, %r12
1454410cf:     	cmpq	%r14, %r12
1454410d2:     	movq	0x488(%rbp), %r12
1454410d9:     	je	0x145441183 <.text+0x5440183>
1454410df:     	movq	-0x18(%r13), %rax
1454410e3:     	cmpq	$-0x1, %rax
1454410e7:     	je	0x145441133 <.text+0x5440133>
1454410e9:     	movq	%rax, 0x4e8(%rbp)
1454410f0:     	leaq	-0x18(%r13), %r12
1454410f4:     	movq	%r13, 0x4d8(%rbp)
1454410fb:     	movq	-0x10(%r13), %rdx
1454410ff:     	movq	0x10(%r12), %r8
145441104:     	movq	%rdi, %rcx
145441107:     	movq	%rdx, 0x4c8(%rbp)
14544110e:     	callq	*0x18(%r15)
145441112:     	nop
145441113:     	movq	0x4e8(%rbp), %rdx
14544111a:     	testq	%rdx, %rdx
14544111d:     	je	0x1454410c0 <.text+0x54400c0>
14544111f:     	movl	$0x1, %r8d
145441125:     	movq	0x4c8(%rbp), %rcx
14544112c:     	callq	0x1400021d0 <.text+0x11d0>
145441131:     	jmp	0x1454410c0 <.text+0x54400c0>
145441133:     	movq	%r14, %rax
145441136:     	subq	%r13, %rax
145441139:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
145441143:     	mulq	%rcx
145441146:     	movq	%r13, 0x88(%rbp)
14544114d:     	cmpq	%r13, %r14
145441150:     	je	0x145441183 <.text+0x5440183>
145441152:     	movq	%rdx, %rdi
145441155:     	shrq	$0x4, %rdi
145441159:     	addq	$0x8, %r13
14544115d:     	jmp	0x145441169 <.text+0x5440169>
14544115f:     	nop
145441160:     	addq	$0x18, %r13
145441164:     	decq	%rdi
145441167:     	je	0x145441183 <.text+0x5440183>
145441169:     	movq	-0x8(%r13), %rdx
14544116d:     	testq	%rdx, %rdx
145441170:     	je	0x145441160 <.text+0x5440160>
145441172:     	movq	(%r13), %rcx
145441176:     	movl	$0x1, %r8d
14544117c:     	callq	0x1400021d0 <.text+0x11d0>
145441181:     	jmp	0x145441160 <.text+0x5440160>
145441183:     	testq	%rbx, %rbx
145441186:     	je	0x14544119e <.text+0x544019e>
145441188:     	shlq	$0x3, %rbx
14544118c:     	leaq	(%rbx,%rbx,2), %rdx
145441190:     	movl	$0x8, %r8d
145441196:     	movq	%rsi, %rcx
145441199:     	callq	0x1400021d0 <.text+0x11d0>
14544119e:     	movq	0x498(%rbp), %rsi
1454411a5:     	movq	0x4a0(%rbp), %rdi
1454411ac:     	testq	%rdi, %rdi
1454411af:     	je	0x1454411e2 <.text+0x54401e2>
1454411b1:     	leaq	0x8(%rsi), %rbx
1454411b5:     	jmp	0x1454411c9 <.text+0x54401c9>
1454411b7:     	nopw	(%rax,%rax)
1454411c0:     	addq	$0x20, %rbx
1454411c4:     	decq	%rdi
1454411c7:     	je	0x1454411e2 <.text+0x54401e2>
1454411c9:     	movq	-0x8(%rbx), %rdx
1454411cd:     	testq	%rdx, %rdx
1454411d0:     	je	0x1454411c0 <.text+0x54401c0>
1454411d2:     	movq	(%rbx), %rcx
1454411d5:     	movl	$0x1, %r8d
1454411db:     	callq	0x1400021d0 <.text+0x11d0>
1454411e0:     	jmp	0x1454411c0 <.text+0x54401c0>
1454411e2:     	movq	0x490(%rbp), %rdx
1454411e9:     	testq	%rdx, %rdx
1454411ec:     	je	0x145441200 <.text+0x5440200>
1454411ee:     	shlq	$0x5, %rdx
1454411f2:     	movl	$0x8, %r8d
1454411f8:     	movq	%rsi, %rcx
1454411fb:     	callq	0x1400021d0 <.text+0x11d0>
145441200:     	movq	0x4f8(%rbp), %rsi
145441207:     	movapd	%xmm6, %xmm0
14544120b:     	subsd	0xfc0(%rsi), %xmm0
145441213:     	ucomisd	0x12fcc9d(%rip), %xmm0  # 0x14673deb8
14544121b:     	jb	0x1454421a1 <.text+0x54411a1>
145441221:     	movsd	%xmm6, 0xfc0(%rsi)
145441229:     	cmpl	$0x2, 0x10(%rsi)
14544122d:     	je	0x1454412a3 <.text+0x54402a3>
14544122f:     	leaq	0x80(%rbp), %rcx
145441236:     	movq	%r12, %rdx
145441239:     	callq	0x1454a80f0 <.text+0x54a70f0>
14544123e:     	movq	0x80(%rbp), %rax
145441245:     	movq	%rax, 0x4e8(%rbp)
14544124c:     	movq	0x88(%rbp), %rdx
145441253:     	movq	0x90(%rbp), %r8
14544125a:     	movq	0x4f8(%rbp), %rax
145441261:     	movq	0xf70(%rax), %rcx
145441268:     	movq	0xf78(%rax), %rax
14544126f:     	movq	%rdx, 0x4d8(%rbp)
145441276:     	callq	*0x20(%rax)
145441279:     	nop
14544127a:     	movq	0x4e8(%rbp), %rdx
145441281:     	testq	%rdx, %rdx
145441284:     	je	0x145441298 <.text+0x5440298>
145441286:     	movl	$0x1, %r8d
14544128c:     	movq	0x4d8(%rbp), %rcx
145441293:     	callq	0x1400021d0 <.text+0x11d0>
145441298:     	cmpq	$0x2, (%r12)
14544129d:     	jne	0x145441487 <.text+0x5440487>
1454412a3:     	movq	$0x0, 0x418(%rbp)
1454412ae:     	movq	$0x8, 0x420(%rbp)
1454412b9:     	movq	$0x0, 0x428(%rbp)
1454412c4:     	movl	$0x8, %esi
1454412c9:     	xorl	%edi, %edi
1454412cb:     	movq	0x4f8(%rbp), %rax
1454412d2:     	cmpq	0xc38(%rax), %rdi
1454412d9:     	je	0x1454414b4 <.text+0x54404b4>
1454412df:     	jmp	0x1454414df <.text+0x54404df>
1454412e4:     	movb	%al, 0x1045(%rsi)
1454412ea:     	movq	%rsi, %rcx
1454412ed:     	callq	0x14544a260 <.text+0x5449260>
1454412f2:     	cmpl	$0x2, 0x10(%rsi)
1454412f6:     	je	0x145441207 <.text+0x5440207>
1454412fc:     	cmpq	$0xffffff, 0xf80(%rsi)  # imm = 0xFFFFFF
145441307:     	je	0x14544236a <.text+0x544136a>
14544130d:     	cmpb	$0x0, 0x9c2(%rsi)
145441314:     	jne	0x14544236a <.text+0x544136a>
14544131a:     	movl	0x684(%rsi), %edi
145441320:     	movl	0x694(%rsi), %r14d
145441327:     	movl	0x68c(%rsi), %r15d
14544132e:     	movl	0x690(%rsi), %r12d
145441335:     	movl	0x698(%rsi), %r13d
14544133c:     	movzbl	0x2ac(%rsi), %ebx
145441343:     	movq	0x238(%rsi), %rcx
14544134a:     	movq	0x240(%rsi), %rdx
145441351:     	callq	0x145420480 <.text+0x541f480>
145441356:     	xorl	%ecx, %ecx
145441358:     	movl	%edi, %r8d
14544135b:     	subl	0x1004(%rsi), %r8d
145441362:     	cmovbl	%ecx, %r8d
145441366:     	addq	0xba8(%rsi), %r8
14544136d:     	leaq	0xa18(%rsi), %r9
145441374:     	movq	$-0x1, %rdx
14544137b:     	cmovbq	%rdx, %r8
14544137f:     	movq	%r8, 0xba8(%rsi)
145441386:     	movl	%r14d, %r8d
145441389:     	subl	0x1008(%rsi), %r8d
145441390:     	cmovbl	%ecx, %r8d
145441394:     	addq	0xbb0(%rsi), %r8
14544139b:     	cmovbq	%rdx, %r8
14544139f:     	movq	%r8, 0xbb0(%rsi)
1454413a6:     	movl	%r15d, %r8d
1454413a9:     	subl	0x100c(%rsi), %r8d
1454413b0:     	cmovbl	%ecx, %r8d
1454413b4:     	addq	0xbb8(%rsi), %r8
1454413bb:     	cmovbq	%rdx, %r8
1454413bf:     	movq	%r8, 0xbb8(%rsi)
1454413c6:     	movl	%r12d, %r8d
1454413c9:     	subl	0x1010(%rsi), %r8d
1454413d0:     	cmovbl	%ecx, %r8d
1454413d4:     	addq	0xbc0(%rsi), %r8
1454413db:     	cmovbq	%rdx, %r8
1454413df:     	movq	%r8, 0xbc0(%rsi)
1454413e6:     	movl	%r13d, %r8d
1454413e9:     	subl	0x1014(%rsi), %r8d
1454413f0:     	cmovbl	%ecx, %r8d
1454413f4:     	addq	0xbd8(%rsi), %r8
1454413fb:     	cmovbq	%rdx, %r8
1454413ff:     	cmpl	$0x0, 0x880(%rsi)
145441406:     	movq	%r8, 0xbd8(%rsi)
14544140d:     	movl	%edi, 0x1004(%rsi)
145441413:     	movl	%r14d, 0x1008(%rsi)
14544141a:     	movl	%r15d, 0x100c(%rsi)
145441421:     	movl	%r12d, 0x1010(%rsi)
145441428:     	movl	%r13d, 0x1014(%rsi)
14544142f:     	movq	%r9, %rsi
145441432:     	je	0x145441441 <.text+0x5440441>
145441434:     	movq	%rsi, %rcx
145441437:     	movl	%ebx, %edx
145441439:     	movq	%rax, %r8
14544143c:     	callq	0x14542f800 <.text+0x542e800>
145441441:     	leaq	0x320(%rbp), %rcx
145441448:     	movq	0x4f8(%rbp), %rdx
14544144f:     	callq	0x1454502d0 <.text+0x544f2d0>
145441454:     	cmpb	$0x2, 0x332(%rbp)
14544145b:     	jne	0x14544220d <.text+0x544120d>
145441461:     	movq	$0x0, 0x3d8(%rbp)
14544146c:     	movq	$0x8, 0x3e0(%rbp)
145441477:     	movq	$0x0, 0x3e8(%rbp)
145441482:     	jmp	0x14544223d <.text+0x544123d>
145441487:     	leaq	0x418(%rbp), %rcx
14544148e:     	movq	%r12, %rdx
145441491:     	callq	0x14549bb00 <.text+0x549ab00>
145441496:     	movq	0x420(%rbp), %rsi
14544149d:     	movq	0x428(%rbp), %rdi
1454414a4:     	movq	0x4f8(%rbp), %rax
1454414ab:     	cmpq	0xc38(%rax), %rdi
1454414b2:     	jne	0x1454414df <.text+0x54404df>
1454414b4:     	movq	0x4f8(%rbp), %rax
1454414bb:     	movq	0xc30(%rax), %rdx
1454414c2:     	movb	$0x1, 0x4f6(%rbp)
1454414c9:     	movq	%rsi, %rcx
1454414cc:     	movq	%rdi, %r8
1454414cf:     	callq	0x1454957b0 <.text+0x54947b0>
1454414d4:     	nop
1454414d5:     	movb	$0x1, %cl
1454414d7:     	testb	%al, %al
1454414d9:     	jne	0x1454415b4 <.text+0x54405b4>
1454414df:     	movq	0x4f8(%rbp), %rbx
1454414e6:     	movq	0xf70(%rbx), %rcx
1454414ed:     	movq	0xf78(%rbx), %rax
1454414f4:     	movq	0x30(%rax), %rax
1454414f8:     	movb	$0x1, 0x4f6(%rbp)
1454414ff:     	movq	%rsi, %rdx
145441502:     	movq	%rdi, %r8
145441505:     	callq	*%rax
145441507:     	nop
145441508:     	leaq	0xc28(%rbx), %rax
14544150f:     	movq	%rax, 0x4c8(%rbp)
145441516:     	movq	0xc30(%rbx), %rcx
14544151d:     	movq	0xc38(%rbx), %rax
145441524:     	movq	%rax, 0x4d8(%rbp)
14544152b:     	movq	$0x0, 0x4e8(%rbp)
145441536:     	movq	%rcx, 0x4b8(%rbp)
14544153d:     	nopl	(%rax)
145441540:     	movq	0x4e8(%rbp), %rax
145441547:     	cmpq	%rax, 0x4d8(%rbp)
14544154e:     	je	0x14544156c <.text+0x544056c>
145441550:     	incq	%rax
145441553:     	movq	%rax, 0x4e8(%rbp)
14544155a:     	leaq	0xb0(%rcx), %rsi
145441561:     	callq	0x14007b010 <.text+0x7a010>
145441566:     	nop
145441567:     	movq	%rsi, %rcx
14544156a:     	jmp	0x145441540 <.text+0x5440540>
14544156c:     	movq	0x4c8(%rbp), %rsi
145441573:     	movq	(%rsi), %rax
145441576:     	testq	%rax, %rax
145441579:     	je	0x14544159b <.text+0x544059b>
14544157b:     	movq	0x4f8(%rbp), %rcx
145441582:     	movq	0xc30(%rcx), %rcx
145441589:     	imulq	$0xb0, %rax, %rdx
145441590:     	movl	$0x8, %r8d
145441596:     	callq	0x1400021d0 <.text+0x11d0>
14544159b:     	movq	0x428(%rbp), %rax
1454415a2:     	movq	%rax, 0x10(%rsi)
1454415a6:     	movupd	0x418(%rbp), %xmm0
1454415ae:     	movupd	%xmm0, (%rsi)
1454415b2:     	xorl	%ecx, %ecx
1454415b4:     	cmpl	$0x2, (%r12)
1454415b9:     	movl	%ecx, 0x4b8(%rbp)
1454415bf:     	jne	0x1454415e9 <.text+0x54405e9>
1454415c1:     	movl	$0x4, %r14d
1454415c7:     	xorl	%esi, %esi
1454415c9:     	movq	0x4f8(%rbp), %rax
1454415d0:     	cmpq	$0x0, 0xc50(%rax)
1454415d8:     	movl	$0x0, %r15d
1454415de:     	jne	0x145441682 <.text+0x5440682>
1454415e4:     	jmp	0x145441670 <.text+0x5440670>
1454415e9:     	movb	%cl, 0x4f6(%rbp)
1454415ef:     	leaq	0x80(%rbp), %rcx
1454415f6:     	movq	%r12, %rdx
1454415f9:     	callq	0x1454ff500 <.text+0x54fe500>
1454415fe:     	nop
1454415ff:     	movq	0x4f8(%rbp), %rax
145441606:     	movq	0x80(%rbp), %r15
14544160d:     	movq	0x88(%rbp), %r14
145441614:     	movq	0x90(%rbp), %rsi
14544161b:     	cmpq	0xc50(%rax), %rsi
145441622:     	jne	0x145441682 <.text+0x5440682>
145441624:     	testq	%rsi, %rsi
145441627:     	je	0x145441670 <.text+0x5440670>
145441629:     	movq	0x4f8(%rbp), %rax
145441630:     	movq	0xc48(%rax), %rax
145441637:     	movl	$0x8, %ecx
14544163c:     	movq	%rsi, %rdx
14544163f:     	nop
145441640:     	movl	-0x8(%r14,%rcx), %r8d
145441645:     	cmpl	-0x8(%rax,%rcx), %r8d
14544164a:     	jne	0x145441682 <.text+0x5440682>
14544164c:     	movss	-0x4(%r14,%rcx), %xmm0
145441653:     	ucomiss	-0x4(%rax,%rcx), %xmm0
145441658:     	jne	0x145441682 <.text+0x5440682>
14544165a:     	jp	0x145441682 <.text+0x5440682>
14544165c:     	movzbl	(%r14,%rcx), %r8d
145441661:     	cmpb	(%rax,%rcx), %r8b
145441665:     	jne	0x145441682 <.text+0x5440682>
145441667:     	addq	$0xc, %rcx
14544166b:     	decq	%rdx
14544166e:     	jne	0x145441640 <.text+0x5440640>
145441670:     	movb	$0x1, %al
145441672:     	cmpl	$0x2, (%r12)
145441677:     	jne	0x145441700 <.text+0x5440700>
14544167d:     	jmp	0x145442104 <.text+0x5441104>
145441682:     	movq	0x4f8(%rbp), %rdi
145441689:     	movq	0xf70(%rdi), %rcx
145441690:     	movq	0xf78(%rdi), %rax
145441697:     	movq	0x38(%rax), %rax
14544169b:     	movq	%r14, 0x410(%rbp)
1454416a2:     	movq	%r15, 0x408(%rbp)
1454416a9:     	movb	$0x1, 0x4d7(%rbp)
1454416b0:     	movq	%r14, %rdx
1454416b3:     	movq	%rsi, %r8
1454416b6:     	callq	*%rax
1454416b8:     	nop
1454416b9:     	movq	0xc40(%rdi), %rax
1454416c0:     	testq	%rax, %rax
1454416c3:     	je	0x1454416df <.text+0x54406df>
1454416c5:     	movq	0xc48(%rdi), %rcx
1454416cc:     	shlq	$0x2, %rax
1454416d0:     	leaq	(%rax,%rax,2), %rdx
1454416d4:     	movl	$0x4, %r8d
1454416da:     	callq	0x1400021d0 <.text+0x11d0>
1454416df:     	movq	%r15, 0xc40(%rdi)
1454416e6:     	movq	%r14, 0xc48(%rdi)
1454416ed:     	movq	%rsi, 0xc50(%rdi)
1454416f4:     	cmpl	$0x2, 0x10(%rdi)
1454416f8:     	je	0x14544211f <.text+0x544111f>
1454416fe:     	xorl	%eax, %eax
145441700:     	movq	%r14, 0x410(%rbp)
145441707:     	movq	%r15, 0x408(%rbp)
14544170e:     	movl	%eax, 0x470(%rbp)
145441714:     	movb	%al, 0x4d7(%rbp)
14544171a:     	leaq	0x10(%rbp), %rcx
14544171e:     	movq	%r12, %rdx
145441721:     	callq	0x14549da80 <.text+0x549ca80>
145441726:     	nop
145441727:     	movq	0x4f8(%rbp), %rbx
14544172e:     	movq	0x18(%rbp), %rsi
145441732:     	movq	0x20(%rbp), %rdi
145441736:     	cmpq	0xc68(%rbx), %rdi
14544173d:     	movq	%r14, 0x480(%rbp)
145441744:     	movq	%r15, 0x478(%rbp)
14544174b:     	jne	0x145441767 <.text+0x5440767>
14544174d:     	movq	0xc60(%rbx), %rdx
145441754:     	movq	%rsi, %rcx
145441757:     	movq	%rdi, %r8
14544175a:     	callq	0x1457731e7 <.text+0x57721e7>
14544175f:     	testl	%eax, %eax
145441761:     	je	0x145442206 <.text+0x5441206>
145441767:     	movq	0x3f8(%rbx), %rdx
14544176e:     	movb	$0x1, 0x4e7(%rbp)
145441775:     	movq	%rdi, 0x28(%rsp)
14544177a:     	movq	%rsi, 0x20(%rsp)
14544177f:     	leaq	0x12fca52(%rip), %r8    # 0x14673e1d8
145441786:     	leaq	0x80(%rbp), %rcx
14544178d:     	movl	$0x3, %r9d
145441793:     	callq	0x14545c030 <.text+0x545b030>
145441798:     	nop
145441799:     	movq	0x4f8(%rbp), %rbx
1454417a0:     	movq	0x570(%rbx), %rdi
1454417a7:     	cmpq	0x560(%rbx), %rdi
1454417ae:     	jne	0x1454417bd <.text+0x54407bd>
1454417b0:     	leaq	0x560(%rbx), %rcx
1454417b7:     	callq	0x145774710 <.text+0x5773710>
1454417bc:     	nop
1454417bd:     	leaq	0xc58(%rbx), %rsi
1454417c4:     	movq	0x568(%rbx), %rax
1454417cb:     	movq	%rdi, %rcx
1454417ce:     	shlq	$0x5, %rcx
1454417d2:     	movups	0x80(%rbp), %xmm0
1454417d9:     	movupd	0x90(%rbp), %xmm1
1454417e1:     	movupd	%xmm1, 0x10(%rax,%rcx)
1454417e7:     	movups	%xmm0, (%rax,%rcx)
1454417eb:     	incq	%rdi
1454417ee:     	movq	%rdi, 0x570(%rbx)
1454417f5:     	movq	0xc58(%rbx), %rdx
1454417fc:     	testq	%rdx, %rdx
1454417ff:     	je	0x145441813 <.text+0x5440813>
145441801:     	movq	0xc60(%rbx), %rcx
145441808:     	movl	$0x1, %r8d
14544180e:     	callq	0x1400021d0 <.text+0x11d0>
145441813:     	movq	0x20(%rbp), %rax
145441817:     	movq	%rax, 0x10(%rsi)
14544181b:     	movupd	0x10(%rbp), %xmm0
145441820:     	movupd	%xmm0, (%rsi)
145441824:     	xorl	%eax, %eax
145441826:     	movl	%eax, 0x440(%rbp)
14544182c:     	movb	%al, 0x4e7(%rbp)
145441832:     	leaq	0x80(%rbp), %rcx
145441839:     	movq	%r12, %rdx
14544183c:     	callq	0x1454989b0 <.text+0x54979b0>
145441841:     	nop
145441842:     	movq	0x80(%rbp), %rax
145441849:     	movq	%rax, 0x4e8(%rbp)
145441850:     	movq	0x88(%rbp), %rax
145441857:     	movq	%rax, 0x430(%rbp)
14544185e:     	movq	0x90(%rbp), %r15
145441865:     	leaq	0x80(%rbp), %rcx
14544186c:     	movq	%r12, %rdx
14544186f:     	callq	0x145497b20 <.text+0x5496b20>
145441874:     	nop
145441875:     	movq	0x80(%rbp), %rax
14544187c:     	movq	%rax, 0x4d8(%rbp)
145441883:     	movq	0x88(%rbp), %rax
14544188a:     	movq	%rax, 0x28(%rbp)
14544188e:     	movq	0x90(%rbp), %rsi
145441895:     	leaq	0x80(%rbp), %rcx
14544189c:     	movq	%r12, %rdx
14544189f:     	callq	0x14549b4b0 <.text+0x549a4b0>
1454418a4:     	nop
1454418a5:     	movq	0x80(%rbp), %rax
1454418ac:     	movq	%rax, 0x4c8(%rbp)
1454418b3:     	movq	0x88(%rbp), %rax
1454418ba:     	movq	%rax, 0x30(%rbp)
1454418be:     	movq	0x90(%rbp), %rdi
1454418c5:     	leaq	0x80(%rbp), %rcx
1454418cc:     	movq	%r12, %rdx
1454418cf:     	callq	0x145499e60 <.text+0x5498e60>
1454418d4:     	nop
1454418d5:     	movq	0x80(%rbp), %rax
1454418dc:     	movq	%rax, 0x450(%rbp)
1454418e3:     	movq	0x88(%rbp), %rax
1454418ea:     	movq	%rax, 0x38(%rbp)
1454418ee:     	movq	0x90(%rbp), %rbx
1454418f5:     	leaq	0x80(%rbp), %rcx
1454418fc:     	movq	%r12, %rdx
1454418ff:     	callq	0x14549a750 <.text+0x5499750>
145441904:     	nop
145441905:     	movq	0x80(%rbp), %rax
14544190c:     	movq	%rax, 0x448(%rbp)
145441913:     	movq	0x88(%rbp), %rax
14544191a:     	movq	%rax, 0x40(%rbp)
14544191e:     	movq	0x90(%rbp), %r13
145441925:     	movq	0x4f8(%rbp), %rax
14544192c:     	movq	0xfc8(%rax), %r8
145441933:     	leaq	0x80(%rbp), %rcx
14544193a:     	movq	%r12, %rdx
14544193d:     	callq	0x14549a300 <.text+0x5499300>
145441942:     	nop
145441943:     	movq	0x80(%rbp), %rax
14544194a:     	movq	%rax, 0x2e0(%rbp)
145441951:     	movq	0x88(%rbp), %rax
145441958:     	movq	%rax, 0x48(%rbp)
14544195c:     	movq	0x90(%rbp), %r14
145441963:     	leaq	0x80(%rbp), %rcx
14544196a:     	movq	%r12, %rdx
14544196d:     	callq	0x14549a1d0 <.text+0x54991d0>
145441972:     	nop
145441973:     	movq	%r14, -0x50(%rbp)
145441977:     	movq	0x80(%rbp), %rax
14544197e:     	movq	%rax, 0x2e8(%rbp)
145441985:     	movq	0x88(%rbp), %rax
14544198c:     	movq	%rax, 0x50(%rbp)
145441990:     	movq	0x90(%rbp), %rax
145441997:     	movq	%rax, -0x48(%rbp)
14544199b:     	leaq	0x80(%rbp), %rcx
1454419a2:     	movq	%r12, %rdx
1454419a5:     	callq	0x1454998a0 <.text+0x54988a0>
1454419aa:     	nop
1454419ab:     	movq	0x80(%rbp), %rax
1454419b2:     	movq	%rax, 0x2f0(%rbp)
1454419b9:     	movq	0x88(%rbp), %rax
1454419c0:     	movq	%rax, 0x58(%rbp)
1454419c4:     	movq	0x90(%rbp), %rax
1454419cb:     	movq	%rax, -0x40(%rbp)
1454419cf:     	movq	0x4f8(%rbp), %r14
1454419d6:     	movq	0x5f8(%r14), %rdx
1454419dd:     	movq	0x600(%r14), %r8
1454419e4:     	movss	0x944(%r14), %xmm3
1454419ed:     	leaq	0x80(%rbp), %rcx
1454419f4:     	callq	0x145471830 <.text+0x5470830>
1454419f9:     	nop
1454419fa:     	movq	0x80(%rbp), %rax
145441a01:     	movq	%rax, 0x2f8(%rbp)
145441a08:     	movq	0x88(%rbp), %rax
145441a0f:     	movq	%rax, 0x60(%rbp)
145441a13:     	movq	0x90(%rbp), %rax
145441a1a:     	movq	%rax, -0x38(%rbp)
145441a1e:     	movq	0x610(%r14), %rdx
145441a25:     	movq	0x618(%r14), %r8
145441a2c:     	movss	0x944(%r14), %xmm3
145441a35:     	leaq	0x80(%rbp), %rcx
145441a3c:     	callq	0x145471830 <.text+0x5470830>
145441a41:     	nop
145441a42:     	movq	0x80(%rbp), %rax
145441a49:     	movq	%rax, 0x300(%rbp)
145441a50:     	movq	0x88(%rbp), %rax
145441a57:     	movq	%rax, 0x68(%rbp)
145441a5b:     	movq	0x90(%rbp), %rax
145441a62:     	movq	%rax, -0x30(%rbp)
145441a66:     	movl	0x67c(%r14), %eax
145441a6d:     	cmpl	$0x2, %eax
145441a70:     	jne	0x145441a8e <.text+0x5440a8e>
145441a72:     	movl	$0x1, %eax
145441a77:     	movq	%rax, 0x310(%rbp)
145441a7e:     	xorl	%r14d, %r14d
145441a81:     	movq	$0x0, 0x438(%rbp)
145441a8c:     	jmp	0x145441aee <.text+0x5440aee>
145441a8e:     	movq	0x628(%r14), %rdx
145441a95:     	leaq	0x934(%r14), %rcx
145441a9c:     	leaq	0x670(%r14), %r8
145441aa3:     	testb	$0x1, %al
145441aa5:     	cmovneq	%r8, %rcx
145441aa9:     	movq	0x630(%r14), %r8
145441ab0:     	movss	0x10(%rcx), %xmm3
145441ab5:     	subss	0x678(%r14), %xmm3
145441abe:     	leaq	0x80(%rbp), %rcx
145441ac5:     	callq	0x145471830 <.text+0x5470830>
145441aca:     	nop
145441acb:     	movq	0x80(%rbp), %rax
145441ad2:     	movq	%rax, 0x438(%rbp)
145441ad9:     	movq	0x88(%rbp), %rax
145441ae0:     	movq	%rax, 0x310(%rbp)
145441ae7:     	movq	0x90(%rbp), %r14
145441aee:     	leaq	0x80(%rbp), %rcx
145441af5:     	movq	0x488(%rbp), %r12
145441afc:     	movq	%r12, %rdx
145441aff:     	callq	0x14549a090 <.text+0x5499090>
145441b04:     	nop
145441b05:     	movq	0x80(%rbp), %rax
145441b0c:     	movq	%rax, 0x308(%rbp)
145441b13:     	movq	0x88(%rbp), %rax
145441b1a:     	movq	%rax, 0x70(%rbp)
145441b1e:     	movq	0x90(%rbp), %rax
145441b25:     	movq	%rax, -0x28(%rbp)
145441b29:     	leaq	0x80(%rbp), %rcx
145441b30:     	movq	%r12, %rdx
145441b33:     	callq	0x1454999c0 <.text+0x54989c0>
145441b38:     	nop
145441b39:     	movq	0x80(%rbp), %rax
145441b40:     	movq	%rax, 0x318(%rbp)
145441b47:     	movq	0x88(%rbp), %rax
145441b4e:     	movq	%rax, 0x78(%rbp)
145441b52:     	movq	0x90(%rbp), %rax
145441b59:     	movq	%rax, -0x20(%rbp)
145441b5d:     	leaq	0x320(%rbp), %rcx
145441b64:     	movq	%r12, %rdx
145441b67:     	callq	0x145499b40 <.text+0x5498b40>
145441b6c:     	nop
145441b6d:     	movq	0x330(%rbp), %rax
145441b74:     	movq	%rax, 0x2c8(%rbp)
145441b7b:     	movupd	0x320(%rbp), %xmm0
145441b83:     	movupd	%xmm0, 0x2b8(%rbp)
145441b8b:     	leaq	0x12fc649(%rip), %rax   # 0x14673e1db
145441b92:     	movq	%rax, 0xa0(%rbp)
145441b99:     	movq	$0x7, 0xa8(%rbp)
145441ba4:     	movq	0x4e8(%rbp), %rax
145441bab:     	movq	%rax, 0xb0(%rbp)
145441bb2:     	movq	0x430(%rbp), %rax
145441bb9:     	movq	%rax, 0xb8(%rbp)
145441bc0:     	movq	%r15, 0xc0(%rbp)
145441bc7:     	leaq	0x12fc614(%rip), %rax   # 0x14673e1e2
145441bce:     	movq	%rax, 0xc8(%rbp)
145441bd5:     	movq	$0x6, 0xd0(%rbp)
145441be0:     	movq	0x4d8(%rbp), %rax
145441be7:     	movq	%rax, 0xd8(%rbp)
145441bee:     	movq	0x28(%rbp), %rax
145441bf2:     	movq	%rax, 0xe0(%rbp)
145441bf9:     	movq	%rsi, 0xe8(%rbp)
145441c00:     	leaq	0x12fc5e1(%rip), %rax   # 0x14673e1e8
145441c07:     	movq	%rax, 0xf0(%rbp)
145441c0e:     	movq	$0x9, 0xf8(%rbp)
145441c19:     	movq	0x4c8(%rbp), %rax
145441c20:     	movq	%rax, 0x100(%rbp)
145441c27:     	movq	0x30(%rbp), %rax
145441c2b:     	movq	%rax, 0x108(%rbp)
145441c32:     	movq	%rdi, 0x110(%rbp)
145441c39:     	leaq	0x12fc5b1(%rip), %rax   # 0x14673e1f1
145441c40:     	movq	%rax, 0x118(%rbp)
145441c47:     	movq	$0x8, 0x120(%rbp)
145441c52:     	movq	0x450(%rbp), %rax
145441c59:     	movq	%rax, 0x128(%rbp)
145441c60:     	movq	0x38(%rbp), %rax
145441c64:     	movq	%rax, 0x130(%rbp)
145441c6b:     	movq	%rbx, 0x138(%rbp)
145441c72:     	leaq	0x12fc580(%rip), %rax   # 0x14673e1f9
145441c79:     	movq	%rax, 0x140(%rbp)
145441c80:     	movq	$0xa, 0x148(%rbp)
145441c8b:     	movq	0x448(%rbp), %rax
145441c92:     	movq	%rax, 0x150(%rbp)
145441c99:     	movq	0x40(%rbp), %rax
145441c9d:     	movq	%rax, 0x158(%rbp)
145441ca4:     	movq	%r13, 0x160(%rbp)
145441cab:     	leaq	0x12fc551(%rip), %rax   # 0x14673e203
145441cb2:     	movq	%rax, 0x168(%rbp)
145441cb9:     	movq	$0x6, 0x170(%rbp)
145441cc4:     	movq	0x2e0(%rbp), %rax
145441ccb:     	movq	%rax, 0x178(%rbp)
145441cd2:     	movq	0x48(%rbp), %rax
145441cd6:     	movq	%rax, 0x180(%rbp)
145441cdd:     	movq	-0x50(%rbp), %rax
145441ce1:     	movq	%rax, 0x188(%rbp)
145441ce8:     	leaq	0x12fc51a(%rip), %rax   # 0x14673e209
145441cef:     	movq	%rax, 0x190(%rbp)
145441cf6:     	movq	$0x9, 0x198(%rbp)
145441d01:     	movq	0x2e8(%rbp), %rax
145441d08:     	movq	%rax, 0x1a0(%rbp)
145441d0f:     	movq	0x50(%rbp), %rax
145441d13:     	movq	%rax, 0x1a8(%rbp)
145441d1a:     	movq	-0x48(%rbp), %rax
145441d1e:     	movq	%rax, 0x1b0(%rbp)
145441d25:     	leaq	0x12fc4e6(%rip), %rax   # 0x14673e212
145441d2c:     	movq	%rax, 0x1b8(%rbp)
145441d33:     	movq	$0x8, 0x1c0(%rbp)
145441d3e:     	movq	0x2f0(%rbp), %rax
145441d45:     	movq	%rax, 0x1c8(%rbp)
145441d4c:     	movq	0x58(%rbp), %rax
145441d50:     	movq	%rax, 0x1d0(%rbp)
145441d57:     	movq	-0x40(%rbp), %rax
145441d5b:     	movq	%rax, 0x1d8(%rbp)
145441d62:     	leaq	0x12fc4b1(%rip), %rax   # 0x14673e21a
145441d69:     	movq	%rax, 0x1e0(%rbp)
145441d70:     	movq	$0x8, 0x1e8(%rbp)
145441d7b:     	movq	0x2f8(%rbp), %rax
145441d82:     	movq	%rax, 0x1f0(%rbp)
145441d89:     	movq	0x60(%rbp), %rax
145441d8d:     	movq	%rax, 0x1f8(%rbp)
145441d94:     	movq	-0x38(%rbp), %rax
145441d98:     	movq	%rax, 0x200(%rbp)
145441d9f:     	leaq	0x12fc47c(%rip), %rax   # 0x14673e222
145441da6:     	movq	%rax, 0x208(%rbp)
145441dad:     	movq	$0x7, 0x210(%rbp)
145441db8:     	movq	0x300(%rbp), %rax
145441dbf:     	movq	%rax, 0x218(%rbp)
145441dc6:     	movq	0x68(%rbp), %rax
145441dca:     	movq	%rax, 0x220(%rbp)
145441dd1:     	movq	-0x30(%rbp), %rax
145441dd5:     	movq	%rax, 0x228(%rbp)
145441ddc:     	leaq	0x12fc446(%rip), %rax   # 0x14673e229
145441de3:     	movq	%rax, 0x230(%rbp)
145441dea:     	movq	$0xa, 0x238(%rbp)
145441df5:     	movq	0x438(%rbp), %rax
145441dfc:     	movq	%rax, 0x240(%rbp)
145441e03:     	movq	0x310(%rbp), %rax
145441e0a:     	movq	%rax, 0x248(%rbp)
145441e11:     	movq	%r14, 0x250(%rbp)
145441e18:     	leaq	0x12fc414(%rip), %rax   # 0x14673e233
145441e1f:     	movq	%rax, 0x258(%rbp)
145441e26:     	movq	0x4f8(%rbp), %rdx
145441e2d:     	leaq	0xc70(%rdx), %r12
145441e34:     	movq	$0x9, 0x260(%rbp)
145441e3f:     	movq	0x308(%rbp), %rax
145441e46:     	movq	%rax, 0x268(%rbp)
145441e4d:     	leaq	0xdc0(%rdx), %rax
145441e54:     	movq	0x70(%rbp), %rcx
145441e58:     	movq	%rcx, 0x270(%rbp)
145441e5f:     	leaq	0xa0(%rbp), %r13
145441e66:     	movq	-0x28(%rbp), %rcx
145441e6a:     	movq	%rcx, 0x278(%rbp)
145441e71:     	leaq	0x12fc3c4(%rip), %rcx   # 0x14673e23c
145441e78:     	movq	%rcx, 0x280(%rbp)
145441e7f:     	movq	$0x8, 0x288(%rbp)
145441e8a:     	movq	0x318(%rbp), %rcx
145441e91:     	movq	%rcx, 0x290(%rbp)
145441e98:     	movq	0x78(%rbp), %rcx
145441e9c:     	movq	%rcx, 0x298(%rbp)
145441ea3:     	movq	-0x20(%rbp), %rcx
145441ea7:     	movq	%rcx, 0x2a0(%rbp)
145441eae:     	xorpd	%xmm0, %xmm0
145441eb2:     	movupd	%xmm0, 0x2d0(%rbp)
145441eba:     	movq	%r12, 0x80(%rbp)
145441ec1:     	movq	%rax, 0x88(%rbp)
145441ec8:     	movq	$0x0, 0x90(%rbp)
145441ed3:     	movq	$0xe, 0x98(%rbp)
145441ede:     	leaq	0x12fc35f(%rip), %rcx   # 0x14673e244
145441ee5:     	movq	%rcx, 0x2a8(%rbp)
145441eec:     	movq	$0x8, 0x2b0(%rbp)
145441ef7:     	leaq	0x560(%rdx), %rcx
145441efe:     	movq	%rcx, 0x4c8(%rbp)
145441f05:     	movl	$0xe, %ebx
145441f0a:     	xorl	%ecx, %ecx
145441f0c:     	leaq	0x320(%rbp), %rdi
145441f13:     	jmp	0x145441f5f <.text+0x5440f5f>
145441f15:     	nopw	%cs:(%rax,%rax)
145441f20:     	movq	0x4e8(%rbp), %rax
145441f27:     	movq	%rax, (%r12)
145441f2b:     	movq	0x4d8(%rbp), %rax
145441f32:     	movq	%rax, 0x8(%r12)
145441f37:     	movq	%rbx, 0x10(%r12)
145441f3c:     	leaq	0xa0(%rbp), %r13
145441f43:     	movq	0x80(%rbp), %r12
145441f4a:     	movq	0x88(%rbp), %rax
145441f51:     	movq	0x90(%rbp), %rcx
145441f58:     	movq	0x98(%rbp), %rbx
145441f5f:     	cmpq	%rax, %r12
145441f62:     	je	0x1454420a5 <.text+0x54410a5>
145441f68:     	leaq	0x18(%r12), %rax
145441f6d:     	movq	%rax, 0x80(%rbp)
145441f74:     	cmpq	%rcx, %rbx
145441f77:     	je	0x1454420c0 <.text+0x54410c0>
145441f7d:     	leaq	0x1(%rcx), %rax
145441f81:     	movq	%rax, 0x90(%rbp)
145441f88:     	leaq	(%rcx,%rcx,4), %rcx
145441f8c:     	movq	0x10(%r13,%rcx,8), %rdx
145441f91:     	cmpq	$-0x1, %rdx
145441f95:     	je	0x1454420a8 <.text+0x54410a8>
145441f9b:     	movq	%rdx, 0x4e8(%rbp)
145441fa2:     	leaq	(,%rcx,8), %rax
145441faa:     	addq	%r13, %rax
145441fad:     	movq	(%rax), %r14
145441fb0:     	movq	0x8(%rax), %r15
145441fb4:     	movq	0x18(%rax), %rsi
145441fb8:     	movq	0x20(%rax), %rbx
145441fbc:     	cmpq	0x10(%r12), %rbx
145441fc1:     	jne	0x145441fdb <.text+0x5440fdb>
145441fc3:     	movq	0x8(%r12), %rdx
145441fc8:     	movq	%rsi, %rcx
145441fcb:     	movq	%rbx, %r8
145441fce:     	callq	0x1457731e7 <.text+0x57721e7>
145441fd3:     	testl	%eax, %eax
145441fd5:     	je	0x145442082 <.text+0x5441082>
145441fdb:     	movq	0x4f8(%rbp), %r13
145441fe2:     	movq	0x3f8(%r13), %rdx
145441fe9:     	movq	%rbx, 0x28(%rsp)
145441fee:     	movq	%rsi, 0x4d8(%rbp)
145441ff5:     	movq	%rsi, 0x20(%rsp)
145441ffa:     	movq	%rdi, %rcx
145441ffd:     	movq	%r14, %r8
145442000:     	movq	%r15, %r9
145442003:     	callq	0x14545c030 <.text+0x545b030>
145442008:     	nop
145442009:     	movq	0x570(%r13), %r14
145442010:     	cmpq	0x560(%r13), %r14
145442017:     	jne	0x145442026 <.text+0x5441026>
145442019:     	movq	0x4c8(%rbp), %rcx
145442020:     	callq	0x145774710 <.text+0x5773710>
145442025:     	nop
145442026:     	movq	0x4f8(%rbp), %rdx
14544202d:     	movq	0x568(%rdx), %rax
145442034:     	movq	%r14, %rcx
145442037:     	shlq	$0x5, %rcx
14544203b:     	movupd	0x320(%rbp), %xmm0
145442043:     	movupd	0x330(%rbp), %xmm1
14544204b:     	movupd	%xmm1, 0x10(%rax,%rcx)
145442051:     	movupd	%xmm0, (%rax,%rcx)
145442056:     	incq	%r14
145442059:     	movq	%r14, 0x570(%rdx)
145442060:     	movq	(%r12), %rdx
145442064:     	testq	%rdx, %rdx
145442067:     	je	0x145441f20 <.text+0x5440f20>
14544206d:     	movq	0x8(%r12), %rcx
145442072:     	movl	$0x1, %r8d
145442078:     	callq	0x1400021d0 <.text+0x11d0>
14544207d:     	jmp	0x145441f20 <.text+0x5440f20>
145442082:     	movq	0x4e8(%rbp), %rdx
145442089:     	testq	%rdx, %rdx
14544208c:     	je	0x145441f43 <.text+0x5440f43>
145442092:     	movl	$0x1, %r8d
145442098:     	movq	%rsi, %rcx
14544209b:     	callq	0x1400021d0 <.text+0x11d0>
1454420a0:     	jmp	0x145441f43 <.text+0x5440f43>
1454420a5:     	movq	%rcx, %rax
1454420a8:     	subq	%rax, %rbx
1454420ab:     	movq	0x480(%rbp), %r14
1454420b2:     	movq	0x478(%rbp), %r15
1454420b9:     	je	0x1454420da <.text+0x54410da>
1454420bb:     	jmp	0x1454421c3 <.text+0x54411c3>
1454420c0:     	movq	%rbx, %rax
1454420c3:     	subq	%rax, %rbx
1454420c6:     	movq	0x480(%rbp), %r14
1454420cd:     	movq	0x478(%rbp), %r15
1454420d4:     	jne	0x1454421c3 <.text+0x54411c3>
1454420da:     	cmpb	$0x0, 0x440(%rbp)
1454420e1:     	je	0x1454420fb <.text+0x54410fb>
1454420e3:     	movq	0x10(%rbp), %rdx
1454420e7:     	testq	%rdx, %rdx
1454420ea:     	je	0x1454420fb <.text+0x54410fb>
1454420ec:     	movq	0x18(%rbp), %rcx
1454420f0:     	movl	$0x1, %r8d
1454420f6:     	callq	0x1400021d0 <.text+0x11d0>
1454420fb:     	cmpb	$0x0, 0x470(%rbp)
145442102:     	je	0x14544211f <.text+0x544111f>
145442104:     	testq	%r15, %r15
145442107:     	je	0x14544211f <.text+0x544111f>
145442109:     	shlq	$0x2, %r15
14544210d:     	leaq	(%r15,%r15,2), %rdx
145442111:     	movl	$0x4, %r8d
145442117:     	movq	%r14, %rcx
14544211a:     	callq	0x1400021d0 <.text+0x11d0>
14544211f:     	cmpb	$0x0, 0x4b8(%rbp)
145442126:     	je	0x1454421a1 <.text+0x54411a1>
145442128:     	movq	0x420(%rbp), %rcx
14544212f:     	movq	0x428(%rbp), %rax
145442136:     	movq	%rax, 0x4e8(%rbp)
14544213d:     	movq	$0x0, 0x4f8(%rbp)
145442148:     	movq	%rcx, 0x4d8(%rbp)
14544214f:     	nop
145442150:     	movq	0x4f8(%rbp), %rax
145442157:     	cmpq	%rax, 0x4e8(%rbp)
14544215e:     	je	0x14544217c <.text+0x544117c>
145442160:     	incq	%rax
145442163:     	movq	%rax, 0x4f8(%rbp)
14544216a:     	leaq	0xb0(%rcx), %rsi
145442171:     	callq	0x14007b010 <.text+0x7a010>
145442176:     	nop
145442177:     	movq	%rsi, %rcx
14544217a:     	jmp	0x145442150 <.text+0x5441150>
14544217c:     	movq	0x418(%rbp), %rax
145442183:     	testq	%rax, %rax
145442186:     	je	0x1454421a1 <.text+0x54411a1>
145442188:     	imulq	$0xb0, %rax, %rdx
14544218f:     	movl	$0x8, %r8d
145442195:     	movq	0x4d8(%rbp), %rcx
14544219c:     	callq	0x1400021d0 <.text+0x11d0>
1454421a1:     	movaps	0x510(%rbp), %xmm6
1454421a8:     	movaps	0x520(%rbp), %xmm7
1454421af:     	addq	$0x5b8, %rsp            # imm = 0x5B8
1454421b6:     	popq	%rbx
1454421b7:     	popq	%rdi
1454421b8:     	popq	%rsi
1454421b9:     	popq	%r12
1454421bb:     	popq	%r13
1454421bd:     	popq	%r14
1454421bf:     	popq	%r15
1454421c1:     	popq	%rbp
1454421c2:     	retq
1454421c3:     	leaq	(%rax,%rax,4), %rax
1454421c7:     	leaq	0xb8(,%rax,8), %rsi
1454421cf:     	addq	%rbp, %rsi
1454421d2:     	jmp	0x1454421ed <.text+0x54411ed>
1454421d4:     	nopw	%cs:(%rax,%rax)
1454421e0:     	addq	$0x28, %rsi
1454421e4:     	decq	%rbx
1454421e7:     	je	0x1454420da <.text+0x54410da>
1454421ed:     	movq	-0x8(%rsi), %rdx
1454421f1:     	testq	%rdx, %rdx
1454421f4:     	je	0x1454421e0 <.text+0x54411e0>
1454421f6:     	movq	(%rsi), %rcx
1454421f9:     	movl	$0x1, %r8d
1454421ff:     	callq	0x1400021d0 <.text+0x11d0>
145442204:     	jmp	0x1454421e0 <.text+0x54411e0>
145442206:     	movb	$0x1, %al
145442208:     	jmp	0x145441826 <.text+0x5440826>
14544220d:     	movl	0x330(%rbp), %eax
145442213:     	movl	%eax, 0x90(%rbp)
145442219:     	movups	0x320(%rbp), %xmm0
145442220:     	movaps	%xmm0, 0x80(%rbp)
145442227:     	leaq	0x3d8(%rbp), %rcx
14544222e:     	leaq	0x80(%rbp), %r8
145442235:     	movq	%rsi, %rdx
145442238:     	callq	0x14552f770 <.text+0x552e770>
14544223d:     	movq	0x488(%rbp), %r12
145442244:     	movb	$0x1, 0x4f7(%rbp)
14544224b:     	callq	0x145703e20 <.text+0x5702e20>
145442250:     	nop
145442251:     	movl	%eax, 0x320(%rbp)
145442257:     	movl	%edx, 0x324(%rbp)
14544225d:     	movb	$0x1, 0x4f7(%rbp)
145442264:     	leaq	0x80(%rbp), %rcx
14544226b:     	leaq	0x320(%rbp), %rdx
145442272:     	movl	$0xd53e8000, %r8d       # imm = 0xD53E8000
145442278:     	movl	$0x19db1de, %r9d        # imm = 0x19DB1DE
14544227e:     	callq	0x145703dd0 <.text+0x5702dd0>
145442283:     	nop
145442284:     	cmpb	$0x0, 0x80(%rbp)
14544228b:     	jne	0x145442296 <.text+0x5441296>
14544228d:     	movq	0x88(%rbp), %r9
145442294:     	jmp	0x145442299 <.text+0x5441299>
145442296:     	xorl	%r9d, %r9d
145442299:     	movb	$0x1, 0x4f7(%rbp)
1454422a0:     	leaq	0x80(%rbp), %rcx
1454422a7:     	movl	$0x1, %r8d
1454422ad:     	movq	%rsi, %rdx
1454422b0:     	callq	0x14552fae0 <.text+0x552eae0>
1454422b5:     	nop
1454422b6:     	movq	0x80(%rbp), %r14
1454422bd:     	movq	0x88(%rbp), %r15
1454422c4:     	movq	0x90(%rbp), %rdi
1454422cb:     	movq	0x3d8(%rbp), %rax
1454422d2:     	movq	0x3e8(%rbp), %rbx
1454422d9:     	subq	%rbx, %rax
1454422dc:     	cmpq	%rax, %rdi
1454422df:     	ja	0x1454423d9 <.text+0x54413d9>
1454422e5:     	testq	%rdi, %rdi
1454422e8:     	je	0x145442309 <.text+0x5441309>
1454422ea:     	leaq	(,%rdi,8), %r8
1454422f2:     	leaq	(,%rbx,8), %rcx
1454422fa:     	addq	0x3e0(%rbp), %rcx
145442301:     	movq	%r15, %rdx
145442304:     	callq	0x1457731ed <.text+0x57721ed>
145442309:     	addq	%rdi, %rbx
14544230c:     	movq	%rbx, 0x3e8(%rbp)
145442313:     	testq	%r14, %r14
145442316:     	je	0x14544232d <.text+0x544132d>
145442318:     	shlq	$0x3, %r14
14544231c:     	movl	$0x8, %r8d
145442322:     	movq	%r15, %rcx
145442325:     	movq	%r14, %rdx
145442328:     	callq	0x1400021d0 <.text+0x11d0>
14544232d:     	movb	$0x1, 0x4f7(%rbp)
145442334:     	movq	%rsi, %rcx
145442337:     	callq	0x1454356a0 <.text+0x54346a0>
14544233c:     	nop
14544233d:     	movb	$0x0, 0x4f7(%rbp)
145442344:     	leaq	0x3d8(%rbp), %rdx
14544234b:     	movq	0x4f8(%rbp), %rcx
145442352:     	callq	0x14544f390 <.text+0x544e390>
145442357:     	nop
145442358:     	cmpq	$0x2, (%r12)
14544235d:     	movq	0x4f8(%rbp), %rsi
145442364:     	je	0x145441207 <.text+0x5440207>
14544236a:     	movq	%r12, %rcx
14544236d:     	callq	0x1454f0640 <.text+0x54ef640>
145442372:     	cmpq	$0x2, (%r12)
145442377:     	jne	0x145440f05 <.text+0x543ff05>
14544237d:     	jmp	0x145441207 <.text+0x5440207>
145442382:     	leaq	0x12fbedf(%rip), %r8    # 0x14673e268
145442389:     	movq	%r14, %rcx
14544238c:     	callq	0x145903b33 <.text+0x5902b33>
145442391:     	nop
145442392:     	jmp	0x145442492 <.text+0x5441492>
145442397:     	leaq	0x12fbeb2(%rip), %r8    # 0x14673e250
14544239e:     	movq	%r14, %rcx
1454423a1:     	callq	0x145903b33 <.text+0x5902b33>
1454423a6:     	nop
1454423a7:     	jmp	0x145442492 <.text+0x5441492>
1454423ac:     	leaq	0x12fbecd(%rip), %r8    # 0x14673e280
1454423b3:     	movq	%r14, %rcx
1454423b6:     	callq	0x145903b33 <.text+0x5902b33>
1454423bb:     	nop
1454423bc:     	jmp	0x145442492 <.text+0x5441492>
1454423c1:     	leaq	0x12fbed0(%rip), %r8    # 0x14673e298
1454423c8:     	movq	%r14, %rcx
1454423cb:     	movq	%rsi, %rdx
1454423ce:     	callq	0x14590386b <.text+0x590286b>
1454423d3:     	nop
1454423d4:     	jmp	0x145442492 <.text+0x5441492>
1454423d9:     	movq	%r15, 0x4d8(%rbp)
1454423e0:     	movq	%r14, 0x4e8(%rbp)
1454423e7:     	movq	$0x8, 0x20(%rsp)
1454423f0:     	leaq	0x3d8(%rbp), %rcx
1454423f7:     	movl	$0x8, %r9d
1454423fd:     	movq	%rbx, %rdx
145442400:     	movq	%rdi, %r8
145442403:     	callq	0x1457744b0 <.text+0x57734b0>
145442408:     	nop
145442409:     	movq	0x3e8(%rbp), %rbx
145442410:     	movq	0x488(%rbp), %r12
145442417:     	movq	0x4e8(%rbp), %r14
14544241e:     	movq	0x4d8(%rbp), %r15
145442425:     	jmp	0x1454422ea <.text+0x54412ea>
14544242a:     	movl	$0x1, %ecx
14544242f:     	movl	$0x8, %edx
145442434:     	callq	0x14590379b <.text+0x590279b>
145442439:     	nop
14544243a:     	jmp	0x145442492 <.text+0x5441492>
14544243c:     	movb	$0x1, 0x507(%rbp)
145442443:     	movl	$0x8, %ecx
145442448:     	movl	$0x2a0, %edx            # imm = 0x2A0
14544244d:     	callq	0x14590379b <.text+0x590279b>
145442452:     	nop
145442453:     	jmp	0x145442492 <.text+0x5441492>
145442455:     	movb	$0x1, 0x4e6(%rbp)
14544245c:     	movl	$0x1, %ecx
145442461:     	movl	$0x20, %edx
145442466:     	callq	0x14590379b <.text+0x590279b>
14544246b:     	nop
14544246c:     	jmp	0x145442492 <.text+0x5441492>
14544246e:     	movl	$0x1, %ecx
145442473:     	movl	$0x1, %edx
145442478:     	callq	0x14590379b <.text+0x590279b>
14544247d:     	nop
14544247e:     	jmp	0x145442492 <.text+0x5441492>
145442480:     	leaq	0x1590461(%rip), %r8    # 0x1469d28e8
145442487:     	movl	$0x6, %edx
14544248c:     	callq	0x145903b33 <.text+0x5902b33>
145442491:     	nop
145442492:     	ud2
