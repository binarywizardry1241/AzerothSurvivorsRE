
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ee470:     	pushq	%rbp
1454ee471:     	pushq	%r15
1454ee473:     	pushq	%r14
1454ee475:     	pushq	%rsi
1454ee476:     	pushq	%rdi
1454ee477:     	pushq	%rbx
1454ee478:     	subq	$0xc8, %rsp
1454ee47f:     	leaq	0x80(%rsp), %rbp
1454ee487:     	movq	$-0x2, 0x40(%rbp)
1454ee48f:     	movzbl	0x9b7(%rcx), %eax
1454ee496:     	cmpl	$0xff, %eax
1454ee49b:     	je	0x1454eea16 <.text+0x54eda16>
1454ee4a1:     	movq	%rcx, %rsi
1454ee4a4:     	cmpb	$0x0, 0x9a8(%rcx)
1454ee4ab:     	je	0x1454eea16 <.text+0x54eda16>
1454ee4b1:     	testl	%eax, %eax
1454ee4b3:     	je	0x1454ee4d1 <.text+0x54ed4d1>
1454ee4b5:     	cmpl	$0x2, %eax
1454ee4b8:     	jne	0x1454ee53f <.text+0x54ed53f>
1454ee4be:     	leaq	0x1509921(%rip), %rdi   # 0x1469f7de6
1454ee4c5:     	movl	$0x38, %ebx
1454ee4ca:     	movl	$0x38, %edx
1454ee4cf:     	jmp	0x1454ee550 <.text+0x54ed550>
1454ee4d1:     	leaq	0x15098c8(%rip), %rdi   # 0x1469f7da0
1454ee4d8:     	movl	$0x46, %ebx
1454ee4dd:     	movl	$0x46, %edx
1454ee4e2:     	movq	%rdi, %rcx
1454ee4e5:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ee4ea:     	testq	%rax, %rax
1454ee4ed:     	cmovneq	%rax, %rdi
1454ee4f1:     	cmovneq	%rdx, %rbx
1454ee4f5:     	leaq	0x410(%rsi), %rax
1454ee4fc:     	leaq	0x15085e1(%rip), %rcx   # 0x1469f6ae4
1454ee503:     	movq	%rcx, -0x28(%rbp)
1454ee507:     	movq	$0x5, -0x20(%rbp)
1454ee50f:     	movq	%rax, -0x18(%rbp)
1454ee513:     	leaq	0x1507f36(%rip), %rax   # 0x1469f6450
1454ee51a:     	movq	%rax, -0x10(%rbp)
1454ee51e:     	movq	$0x1, 0x20(%rsp)
1454ee527:     	leaq	-0x40(%rbp), %rcx
1454ee52b:     	leaq	-0x28(%rbp), %r9
1454ee52f:     	movq	%rdi, %rdx
1454ee532:     	movq	%rbx, %r8
1454ee535:     	callq	0x145458060 <.text+0x5457060>
1454ee53a:     	jmp	0x1454ee5c1 <.text+0x54ed5c1>
1454ee53f:     	leaq	0x15098d8(%rip), %rdi   # 0x1469f7e1e
1454ee546:     	movl	$0x3c, %ebx
1454ee54b:     	movl	$0x3c, %edx
1454ee550:     	movq	%rdi, %rcx
1454ee553:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ee558:     	testq	%rax, %rax
1454ee55b:     	cmoveq	%rdi, %rax
1454ee55f:     	movq	%rdx, %rdi
1454ee562:     	cmoveq	%rbx, %rdi
1454ee566:     	testq	%rdi, %rdi
1454ee569:     	jns	0x1454ee57b <.text+0x54ed57b>
1454ee56b:     	xorl	%r15d, %r15d
1454ee56e:     	movq	%r15, %rcx
1454ee571:     	movq	%rdi, %rdx
1454ee574:     	callq	0x14590379b <.text+0x590279b>
1454ee579:     	ud2
1454ee57b:     	je	0x1454ee5b0 <.text+0x54ed5b0>
1454ee57d:     	movq	%rax, %r14
1454ee580:     	callq	0x140002200 <.text+0x1200>
1454ee585:     	movl	$0x1, %r15d
1454ee58b:     	movl	$0x1, %edx
1454ee590:     	movq	%rdi, %rcx
1454ee593:     	callq	0x1400021c0 <.text+0x11c0>
1454ee598:     	testq	%rax, %rax
1454ee59b:     	je	0x1454ee56e <.text+0x54ed56e>
1454ee59d:     	movq	%rax, %rbx
1454ee5a0:     	movq	%rax, %rcx
1454ee5a3:     	movq	%r14, %rdx
1454ee5a6:     	movq	%rdi, %r8
1454ee5a9:     	callq	0x1457731ed <.text+0x57721ed>
1454ee5ae:     	jmp	0x1454ee5b5 <.text+0x54ed5b5>
1454ee5b0:     	movl	$0x1, %ebx
1454ee5b5:     	movq	%rdi, -0x40(%rbp)
1454ee5b9:     	movq	%rbx, -0x38(%rbp)
1454ee5bd:     	movq	%rdi, -0x30(%rbp)
1454ee5c1:     	movq	0x588(%rsi), %rax
1454ee5c8:     	movq	0x590(%rsi), %rbx
1454ee5cf:     	leaq	(%rbx,%rbx,4), %rcx
1454ee5d3:     	shlq	$0x5, %rcx
1454ee5d7:     	addq	%rax, %rcx
1454ee5da:     	movq	%rax, -0x58(%rbp)
1454ee5de:     	movq	%rcx, -0x50(%rbp)
1454ee5e2:     	movq	$0x0, -0x48(%rbp)
1454ee5ea:     	testq	%rbx, %rbx
1454ee5ed:     	je	0x1454ee61d <.text+0x54ed61d>
1454ee5ef:     	movq	%rbx, %rdi
1454ee5f2:     	shlq	$0x5, %rdi
1454ee5f6:     	callq	0x140002200 <.text+0x1200>
1454ee5fb:     	movl	$0x8, %edx
1454ee600:     	movq	%rdi, %rcx
1454ee603:     	callq	0x1400021c0 <.text+0x11c0>
1454ee608:     	testq	%rax, %rax
1454ee60b:     	jne	0x1454ee622 <.text+0x54ed622>
1454ee60d:     	movl	$0x8, %ecx
1454ee612:     	movq	%rdi, %rdx
1454ee615:     	callq	0x14590379b <.text+0x590279b>
1454ee61a:     	nop
1454ee61b:     	ud2
1454ee61d:     	movl	$0x8, %eax
1454ee622:     	movq	%rbx, -0x8(%rbp)
1454ee626:     	movq	%rax, (%rbp)
1454ee62a:     	leaq	0x8(%rbp), %rcx
1454ee62e:     	movq	$0x0, 0x8(%rbp)
1454ee636:     	movq	%rax, -0x18(%rbp)
1454ee63a:     	movq	%rcx, -0x28(%rbp)
1454ee63e:     	movq	$0x0, -0x20(%rbp)
1454ee646:     	leaq	-0x58(%rbp), %rdi
1454ee64a:     	leaq	-0x28(%rbp), %rdx
1454ee64e:     	movq	%rdi, %rcx
1454ee651:     	callq	0x14554a860 <.text+0x5549860>
1454ee656:     	nop
1454ee657:     	movups	-0x8(%rbp), %xmm0
1454ee65b:     	movaps	%xmm0, 0x10(%rbp)
1454ee65f:     	movq	0x8(%rbp), %rax
1454ee663:     	movq	%rax, 0x20(%rbp)
1454ee667:     	cmpb	$0x0, 0x226(%rsi)
1454ee66e:     	je	0x1454ee74d <.text+0x54ed74d>
1454ee674:     	leaq	0x15097df(%rip), %rbx   # 0x1469f7e5a
1454ee67b:     	movl	$0x18, %r14d
1454ee681:     	movl	$0x18, %edx
1454ee686:     	movq	%rbx, %rcx
1454ee689:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ee68e:     	nop
1454ee68f:     	movq	%rdx, %r8
1454ee692:     	movl	0x980(%rsi), %ecx
1454ee698:     	shrl	$0x2, %ecx
1454ee69b:     	cmpl	$0xb, %ecx
1454ee69e:     	movl	$0xa, %edx
1454ee6a3:     	cmovael	%ecx, %edx
1454ee6a6:     	testq	%rax, %rax
1454ee6a9:     	cmoveq	%r14, %r8
1454ee6ad:     	cmovneq	%rax, %rbx
1454ee6b1:     	movl	%edx, -0x58(%rbp)
1454ee6b4:     	leaq	0x15097b7(%rip), %rax   # 0x1469f7e72
1454ee6bb:     	movq	%rax, -0x28(%rbp)
1454ee6bf:     	movq	$0x9, -0x20(%rbp)
1454ee6c7:     	movq	%rdi, -0x18(%rbp)
1454ee6cb:     	leaq	0x1507d7e(%rip), %rax   # 0x1469f6450
1454ee6d2:     	movq	%rax, -0x10(%rbp)
1454ee6d6:     	movq	$0x1, 0x20(%rsp)
1454ee6df:     	leaq	-0x8(%rbp), %rcx
1454ee6e3:     	leaq	-0x28(%rbp), %r9
1454ee6e7:     	movq	%rbx, %rdx
1454ee6ea:     	callq	0x145458060 <.text+0x5457060>
1454ee6ef:     	nop
1454ee6f0:     	movq	-0x8(%rbp), %rax
1454ee6f4:     	movq	%rax, 0x38(%rbp)
1454ee6f8:     	movq	(%rbp), %rax
1454ee6fc:     	movq	%rax, 0x30(%rbp)
1454ee700:     	movq	0x8(%rbp), %r14
1454ee704:     	movq	0x20(%rbp), %rbx
1454ee708:     	cmpq	0x10(%rbp), %rbx
1454ee70c:     	jne	0x1454ee718 <.text+0x54ed718>
1454ee70e:     	leaq	0x10(%rbp), %rcx
1454ee712:     	callq	0x145774710 <.text+0x5773710>
1454ee717:     	nop
1454ee718:     	movq	0x18(%rbp), %rax
1454ee71c:     	movq	%rbx, %rcx
1454ee71f:     	shlq	$0x5, %rcx
1454ee723:     	movl	$0xa, (%rax,%rcx)
1454ee72a:     	movb	$0x0, 0x4(%rax,%rcx)
1454ee72f:     	movq	0x38(%rbp), %rdx
1454ee733:     	movq	%rdx, 0x8(%rax,%rcx)
1454ee738:     	movq	0x30(%rbp), %rdx
1454ee73c:     	movq	%rdx, 0x10(%rax,%rcx)
1454ee741:     	movq	%r14, 0x18(%rax,%rcx)
1454ee746:     	incq	%rbx
1454ee749:     	movq	%rbx, 0x20(%rbp)
1454ee74d:     	cmpl	$0x0, 0x4c4(%rsi)
1454ee754:     	je	0x1454ee7fd <.text+0x54ed7fd>
1454ee75a:     	movl	$0x0, -0x58(%rbp)
1454ee761:     	leaq	0x150972b(%rip), %rdi   # 0x1469f7e93
1454ee768:     	movl	$0x17, %ebx
1454ee76d:     	movl	$0x17, %edx
1454ee772:     	movq	%rdi, %rcx
1454ee775:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ee77a:     	nop
1454ee77b:     	movq	%rdx, %r8
1454ee77e:     	leaq	0x4c4(%rsi), %rcx
1454ee785:     	testq	%rax, %rax
1454ee788:     	cmovneq	%rax, %rdi
1454ee78c:     	cmoveq	%rbx, %r8
1454ee790:     	leaq	0x1508380(%rip), %rax   # 0x1469f6b17
1454ee797:     	movq	%rax, -0x28(%rbp)
1454ee79b:     	movq	$0x7, -0x20(%rbp)
1454ee7a3:     	movq	%rcx, -0x18(%rbp)
1454ee7a7:     	leaq	0x1507ca2(%rip), %rax   # 0x1469f6450
1454ee7ae:     	movq	%rax, -0x10(%rbp)
1454ee7b2:     	movq	$0x1, 0x20(%rsp)
1454ee7bb:     	leaq	-0x8(%rbp), %rcx
1454ee7bf:     	leaq	-0x28(%rbp), %r9
1454ee7c3:     	movq	%rdi, %rdx
1454ee7c6:     	callq	0x145458060 <.text+0x5457060>
1454ee7cb:     	nop
1454ee7cc:     	movq	-0x8(%rbp), %rax
1454ee7d0:     	movq	%rax, 0x38(%rbp)
1454ee7d4:     	movq	(%rbp), %rax
1454ee7d8:     	movq	%rax, 0x30(%rbp)
1454ee7dc:     	movq	0x8(%rbp), %rdi
1454ee7e0:     	movq	0x20(%rbp), %rbx
1454ee7e4:     	cmpq	0x10(%rbp), %rbx
1454ee7e8:     	jne	0x1454ee94f <.text+0x54ed94f>
1454ee7ee:     	leaq	0x10(%rbp), %rcx
1454ee7f2:     	callq	0x145774710 <.text+0x5773710>
1454ee7f7:     	nop
1454ee7f8:     	jmp	0x1454ee94f <.text+0x54ed94f>
1454ee7fd:     	movl	0x4c8(%rsi), %r8d
1454ee804:     	movl	$0x1, %eax
1454ee809:     	testl	%r8d, %r8d
1454ee80c:     	je	0x1454ee887 <.text+0x54ed887>
1454ee80e:     	testb	$0x1, %r8b
1454ee812:     	je	0x1454ee81f <.text+0x54ed81f>
1454ee814:     	movl	$0x3, %eax
1454ee819:     	cmpl	$0x1, %r8d
1454ee81d:     	je	0x1454ee887 <.text+0x54ed887>
1454ee81f:     	testb	$0x2, %r8b
1454ee823:     	je	0x1454ee833 <.text+0x54ed833>
1454ee825:     	leal	(%rax,%rax,8), %eax
1454ee828:     	movl	%r8d, %ecx
1454ee82b:     	andl	$-0x2, %ecx
1454ee82e:     	cmpl	$0x2, %ecx
1454ee831:     	je	0x1454ee887 <.text+0x54ed887>
1454ee833:     	testb	$0x4, %r8b
1454ee837:     	je	0x1454ee84a <.text+0x54ed84a>
1454ee839:     	leal	(%rax,%rax,8), %eax
1454ee83c:     	leal	(%rax,%rax,8), %eax
1454ee83f:     	movl	%r8d, %ecx
1454ee842:     	andl	$-0x4, %ecx
1454ee845:     	cmpl	$0x4, %ecx
1454ee848:     	je	0x1454ee887 <.text+0x54ed887>
1454ee84a:     	testb	$0x8, %r8b
1454ee84e:     	je	0x1454ee861 <.text+0x54ed861>
1454ee850:     	imull	$0x19a1, %eax, %eax     # imm = 0x19A1
1454ee856:     	movl	%r8d, %ecx
1454ee859:     	andl	$-0x8, %ecx
1454ee85c:     	cmpl	$0x8, %ecx
1454ee85f:     	je	0x1454ee887 <.text+0x54ed887>
1454ee861:     	movb	$0x1, %r9b
1454ee864:     	movl	$0xffffff9c, %ecx       # imm = 0xFFFFFF9C
1454ee869:     	testb	$0x10, %r8b
1454ee86d:     	je	0x1454ee894 <.text+0x54ed894>
1454ee86f:     	movl	$0x290d741, %edx        # imm = 0x290D741
1454ee874:     	mull	%edx
1454ee876:     	seto	%dl
1454ee879:     	andl	$-0x10, %r8d
1454ee87d:     	cmpl	$0x10, %r8d
1454ee881:     	jne	0x1454ee894 <.text+0x54ed894>
1454ee883:     	testb	%dl, %dl
1454ee885:     	jne	0x1454ee894 <.text+0x54ed894>
1454ee887:     	movl	$0x64, %ecx
1454ee88c:     	mull	%ecx
1454ee88e:     	movl	%eax, %ecx
1454ee890:     	seto	%r9b
1454ee894:     	testb	$0x1, %r9b
1454ee898:     	jne	0x1454ee8b2 <.text+0x54ed8b2>
1454ee89a:     	movl	%ecx, -0x58(%rbp)
1454ee89d:     	cmpl	%ecx, 0x420(%rsi)
1454ee8a3:     	jae	0x1454ee8c2 <.text+0x54ed8c2>
1454ee8a5:     	movq	0x18(%rbp), %r9
1454ee8a9:     	movq	0x20(%rbp), %rbx
1454ee8ad:     	jmp	0x1454ee986 <.text+0x54ed986>
1454ee8b2:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
1454ee8b7:     	movl	%ecx, -0x58(%rbp)
1454ee8ba:     	cmpl	%ecx, 0x420(%rsi)
1454ee8c0:     	jb	0x1454ee8a5 <.text+0x54ed8a5>
1454ee8c2:     	leaq	0x15095b2(%rip), %rbx   # 0x1469f7e7b
1454ee8c9:     	movl	$0x14, %r14d
1454ee8cf:     	movl	$0x14, %edx
1454ee8d4:     	movq	%rbx, %rcx
1454ee8d7:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ee8dc:     	nop
1454ee8dd:     	movq	%rdx, %r8
1454ee8e0:     	testq	%rax, %rax
1454ee8e3:     	cmovneq	%rax, %rbx
1454ee8e7:     	cmoveq	%r14, %r8
1454ee8eb:     	leaq	0x150959d(%rip), %rax   # 0x1469f7e8f
1454ee8f2:     	movq	%rax, -0x28(%rbp)
1454ee8f6:     	movq	$0x4, -0x20(%rbp)
1454ee8fe:     	movq	%rdi, -0x18(%rbp)
1454ee902:     	leaq	0x1507b47(%rip), %rax   # 0x1469f6450
1454ee909:     	movq	%rax, -0x10(%rbp)
1454ee90d:     	movq	$0x1, 0x20(%rsp)
1454ee916:     	leaq	-0x8(%rbp), %rcx
1454ee91a:     	leaq	-0x28(%rbp), %r9
1454ee91e:     	movq	%rbx, %rdx
1454ee921:     	callq	0x145458060 <.text+0x5457060>
1454ee926:     	nop
1454ee927:     	movq	-0x8(%rbp), %rax
1454ee92b:     	movq	%rax, 0x38(%rbp)
1454ee92f:     	movq	(%rbp), %rax
1454ee933:     	movq	%rax, 0x30(%rbp)
1454ee937:     	movq	0x8(%rbp), %rdi
1454ee93b:     	movq	0x20(%rbp), %rbx
1454ee93f:     	cmpq	0x10(%rbp), %rbx
1454ee943:     	jne	0x1454ee94f <.text+0x54ed94f>
1454ee945:     	leaq	0x10(%rbp), %rcx
1454ee949:     	callq	0x145774710 <.text+0x5773710>
1454ee94e:     	nop
1454ee94f:     	movq	0x18(%rbp), %r9
1454ee953:     	movq	%rbx, %rax
1454ee956:     	shlq	$0x5, %rax
1454ee95a:     	movl	$0x9, (%r9,%rax)
1454ee962:     	movb	$0x0, 0x4(%r9,%rax)
1454ee968:     	movq	0x38(%rbp), %rcx
1454ee96c:     	movq	%rcx, 0x8(%r9,%rax)
1454ee971:     	movq	0x30(%rbp), %rcx
1454ee975:     	movq	%rcx, 0x10(%r9,%rax)
1454ee97a:     	movq	%rdi, 0x18(%r9,%rax)
1454ee97f:     	incq	%rbx
1454ee982:     	movq	%rbx, 0x20(%rbp)
1454ee986:     	movq	-0x38(%rbp), %rdi
1454ee98a:     	movq	-0x30(%rbp), %r8
1454ee98e:     	movq	%rbx, 0x20(%rsp)
1454ee993:     	movq	%rsi, %rcx
1454ee996:     	movq	%rdi, %rdx
1454ee999:     	callq	0x1454f9790 <.text+0x54f8790>
1454ee99e:     	nop
1454ee99f:     	movq	0x20(%rbp), %rsi
1454ee9a3:     	testq	%rsi, %rsi
1454ee9a6:     	je	0x1454ee9e2 <.text+0x54ed9e2>
1454ee9a8:     	movq	0x18(%rbp), %rbx
1454ee9ac:     	addq	$0x10, %rbx
1454ee9b0:     	jmp	0x1454ee9c9 <.text+0x54ed9c9>
1454ee9b2:     	nopw	%cs:(%rax,%rax)
1454ee9c0:     	addq	$0x20, %rbx
1454ee9c4:     	decq	%rsi
1454ee9c7:     	je	0x1454ee9e2 <.text+0x54ed9e2>
1454ee9c9:     	movq	-0x8(%rbx), %rdx
1454ee9cd:     	testq	%rdx, %rdx
1454ee9d0:     	je	0x1454ee9c0 <.text+0x54ed9c0>
1454ee9d2:     	movq	(%rbx), %rcx
1454ee9d5:     	movl	$0x1, %r8d
1454ee9db:     	callq	0x1400021d0 <.text+0x11d0>
1454ee9e0:     	jmp	0x1454ee9c0 <.text+0x54ed9c0>
1454ee9e2:     	movq	0x10(%rbp), %rdx
1454ee9e6:     	testq	%rdx, %rdx
1454ee9e9:     	je	0x1454ee9fe <.text+0x54ed9fe>
1454ee9eb:     	movq	0x18(%rbp), %rcx
1454ee9ef:     	shlq	$0x5, %rdx
1454ee9f3:     	movl	$0x8, %r8d
1454ee9f9:     	callq	0x1400021d0 <.text+0x11d0>
1454ee9fe:     	movq	-0x40(%rbp), %rdx
1454eea02:     	testq	%rdx, %rdx
1454eea05:     	je	0x1454eea16 <.text+0x54eda16>
1454eea07:     	movl	$0x1, %r8d
1454eea0d:     	movq	%rdi, %rcx
1454eea10:     	callq	0x1400021d0 <.text+0x11d0>
1454eea15:     	nop
1454eea16:     	addq	$0xc8, %rsp
1454eea1d:     	popq	%rbx
1454eea1e:     	popq	%rdi
1454eea1f:     	popq	%rsi
1454eea20:     	popq	%r14
1454eea22:     	popq	%r15
1454eea24:     	popq	%rbp
1454eea25:     	retq
