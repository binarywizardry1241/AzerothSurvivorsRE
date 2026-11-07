
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145469450:     	pushq	%rbp
145469451:     	pushq	%r15
145469453:     	pushq	%r14
145469455:     	pushq	%r13
145469457:     	pushq	%r12
145469459:     	pushq	%rsi
14546945a:     	pushq	%rdi
14546945b:     	pushq	%rbx
14546945c:     	subq	$0xf28, %rsp            # imm = 0xF28
145469463:     	leaq	0x80(%rsp), %rbp
14546946b:     	movq	$-0x2, 0xea0(%rbp)
145469476:     	movq	%r8, %rsi
145469479:     	movq	%rdx, %rdi
14546947c:     	movq	%rcx, %rbx
14546947f:     	leaq	-0x58(%rbp), %rcx
145469483:     	callq	0x145468d60 <.text+0x5467d60>
145469488:     	movq	-0x58(%rbp), %rax
14546948c:     	cmpq	$-0x1, %rax
145469490:     	je	0x145469928 <.text+0x5468928>
145469496:     	movq	%rax, 0xe98(%rbp)
14546949d:     	movq	-0x50(%rbp), %rdx
1454694a1:     	movq	-0x48(%rbp), %r8
1454694a5:     	movq	$0x5, 0x20(%rsp)
1454694ae:     	leaq	0x12d46ca(%rip), %r9    # 0x14673db7f
1454694b5:     	leaq	0xbb8(%rbp), %rcx
1454694bc:     	movq	%rdx, 0xe80(%rbp)
1454694c3:     	callq	0x145702c70 <.text+0x5701c70>
1454694c8:     	nop
1454694c9:     	movq	0xbb8(%rbp), %rax
1454694d0:     	movq	0xbc0(%rbp), %rcx
1454694d7:     	movq	%rcx, 0xe88(%rbp)
1454694de:     	movq	0xbc8(%rbp), %r14
1454694e5:     	movq	0xe98(%rbp), %rdx
1454694ec:     	testq	%rdx, %rdx
1454694ef:     	je	0x145469509 <.text+0x5468509>
1454694f1:     	movl	$0x1, %r8d
1454694f7:     	movq	0xe80(%rbp), %rcx
1454694fe:     	movq	%rax, %r15
145469501:     	callq	0x1400021d0 <.text+0x11d0>
145469506:     	movq	%r15, %rax
145469509:     	cmpq	$-0x1, %rax
14546950d:     	je	0x145469928 <.text+0x5468928>
145469513:     	movq	%rax, 0xe98(%rbp)
14546951a:     	movabsq	$-0x3dd1baf98d76b549, %rcx # imm = 0xC22E450672894AB7
145469524:     	movq	%rsi, %rax
145469527:     	mulq	%rcx
14546952a:     	movq	%rdx, %r8
14546952d:     	shrq	$0x10, %r8
145469531:     	imulq	$0x15180, %r8, %rax     # imm = 0x15180
145469538:     	subq	%rax, %rsi
14546953b:     	leaq	0xafa6c(%r8), %rax
145469542:     	movabsq	$0x396b06bcc8f87, %rcx  # imm = 0x396B06BCC8F87
14546954c:     	mulq	%rcx
14546954f:     	movq	%rdx, %rcx
145469552:     	shrq	$0x3, %rcx
145469556:     	imulq	$-0x23ab1, %rcx, %rax   # imm = 0xFFFDC54F
14546955d:     	addq	%rax, %r8
145469560:     	addq	$0xafa6c, %r8           # imm = 0xAFA6C
145469567:     	movabsq	$-0x2ce33e6c02ce33e7, %r10 # imm = 0xD31CC193FD31CC19
145469571:     	movq	%r8, %rax
145469574:     	imulq	%r10
145469577:     	movq	%rdx, %r9
14546957a:     	shrq	$0x3f, %r9
14546957e:     	sarq	$0x8, %rdx
145469582:     	addq	%rdx, %r9
145469585:     	addq	%r8, %r9
145469588:     	movabsq	$-0x1a537e05fff1a537, %rdx # imm = 0xE5AC81FA000E5AC9
145469592:     	movq	%r8, %rax
145469595:     	imulq	%rdx
145469598:     	leaq	(%rdx,%r8), %r15
14546959c:     	movq	%r15, %rax
14546959f:     	shrq	$0x3f, %rax
1454695a3:     	sarq	$0xf, %r15
1454695a7:     	addq	%rax, %r15
1454695aa:     	movabsq	$0x1a537e05fff1a537, %rdx # imm = 0x1A537E05FFF1A537
1454695b4:     	movq	%r8, %rax
1454695b7:     	imulq	%rdx
1454695ba:     	addq	%r9, %r15
1454695bd:     	subq	%r8, %rdx
1454695c0:     	movq	%rdx, %r11
1454695c3:     	shrq	$0x3f, %r11
1454695c7:     	sarq	$0x11, %rdx
1454695cb:     	addq	%rdx, %r11
1454695ce:     	addq	%r15, %r11
1454695d1:     	movabsq	$0x2ce33e6c02ce33e7, %rdx # imm = 0x2CE33E6C02CE33E7
1454695db:     	movq	%r11, %rax
1454695de:     	imulq	%rdx
1454695e1:     	movq	%rdx, %r9
1454695e4:     	movq	%rdx, %rax
1454695e7:     	shrq	$0x3f, %rax
1454695eb:     	sarq	$0x6, %r9
1454695ef:     	addq	%rax, %r9
1454695f2:     	movq	%r11, %rax
1454695f5:     	imulq	%r10
1454695f8:     	movq	%rdx, %r10
1454695fb:     	imulq	$-0x16d, %r9, %r15      # imm = 0xFE93
145469602:     	movq	%rdx, %rax
145469605:     	shrq	$0x3f, %rax
145469609:     	sarq	$0x8, %r10
14546960d:     	addq	%rax, %r10
145469610:     	movabsq	$0x1cba6563d8d5e3c7, %rdx # imm = 0x1CBA6563D8D5E3C7
14546961a:     	movq	%r11, %rax
14546961d:     	imulq	%rdx
145469620:     	movq	%rdx, %rax
145469623:     	shrq	$0x3f, %rax
145469627:     	sarq	$0xc, %rdx
14546962b:     	addq	%rax, %rdx
14546962e:     	addq	%r8, %r10
145469631:     	addq	%rdx, %r10
145469634:     	addq	%r15, %r10
145469637:     	leaq	(%r10,%r10,4), %rax
14546963b:     	addq	$0x2, %rax
14546963f:     	movabsq	$0x358ae0358ae0358b, %rdx # imm = 0x358AE0358AE0358B
145469649:     	imulq	%rdx
14546964c:     	movq	%rdx, %r8
14546964f:     	movq	%rdx, %r11
145469652:     	shrq	$0x3f, %r11
145469656:     	sarq	$0x5, %r8
14546965a:     	leaq	(%r8,%r11), %rax
14546965e:     	imulq	$0x99, %rax, %rax
145469665:     	addq	$0x2, %rax
145469669:     	movabsq	$-0x6666666666666667, %rdx # imm = 0x9999999999999999
145469673:     	imulq	%rdx
145469676:     	movq	%rdx, %rax
145469679:     	shrq	$0x3f, %rax
14546967d:     	sarq	%rdx
145469680:     	addq	%rax, %rdx
145469683:     	leaq	(%r10,%rdx), %rax
145469687:     	incq	%rax
14546968a:     	movq	%rax, 0xe70(%rbp)
145469691:     	cmpq	$0x132, %r10            # imm = 0x132
145469698:     	leaq	0x3(%r8,%r11), %rax
14546969d:     	leaq	-0x9(%r8,%r11), %rdx
1454696a2:     	cmovlq	%rax, %rdx
1454696a6:     	movq	%rdx, 0xe68(%rbp)
1454696ad:     	imulq	$0x190, %rcx, %rax      # imm = 0x190
1454696b4:     	addq	%r9, %rax
1454696b7:     	xorl	%ecx, %ecx
1454696b9:     	cmpq	$0x3, %rdx
1454696bd:     	setl	%cl
1454696c0:     	addq	%rax, %rcx
1454696c3:     	movq	%rcx, 0xe60(%rbp)
1454696ca:     	imulq	$0x123457, %rsi, %rax   # imm = 0x123457
1454696d1:     	shrq	$0x20, %rax
1454696d5:     	movq	%rax, 0xe58(%rbp)
1454696dc:     	imulq	$0x4444445, %rsi, %rax  # imm = 0x4444445
1454696e3:     	shrq	$0x20, %rax
1454696e7:     	imull	$0x889, %eax, %ecx      # imm = 0x889
1454696ed:     	shrl	$0x11, %ecx
1454696f0:     	imull	$0x3c, %ecx, %ecx
1454696f3:     	imull	$0x3c, %eax, %edx
1454696f6:     	subl	%ecx, %eax
1454696f8:     	movzwl	%ax, %eax
1454696fb:     	movq	%rax, 0xe50(%rbp)
145469702:     	subl	%edx, %esi
145469704:     	movq	%rsi, 0xe78(%rbp)
14546970b:     	leaq	0xe60(%rbp), %rax
145469712:     	movq	%rax, -0x58(%rbp)
145469716:     	leaq	0x2d1cf3(%rip), %rax    # 0x14573b410 <.text+0x573a410>
14546971d:     	movq	%rax, -0x50(%rbp)
145469721:     	leaq	0xe68(%rbp), %rcx
145469728:     	movq	%rcx, -0x48(%rbp)
14546972c:     	movq	%rax, -0x40(%rbp)
145469730:     	leaq	0xe70(%rbp), %rcx
145469737:     	movq	%rcx, -0x38(%rbp)
14546973b:     	movq	%rax, -0x30(%rbp)
14546973f:     	leaq	0xe58(%rbp), %rax
145469746:     	movq	%rax, -0x28(%rbp)
14546974a:     	leaq	0x2d1bef(%rip), %rax    # 0x14573b340 <.text+0x573a340>
145469751:     	movq	%rax, -0x20(%rbp)
145469755:     	leaq	0xe50(%rbp), %rcx
14546975c:     	movq	%rcx, -0x18(%rbp)
145469760:     	movq	%rax, -0x10(%rbp)
145469764:     	leaq	0xe78(%rbp), %r13
14546976b:     	movq	%r13, -0x8(%rbp)
14546976f:     	movq	%rax, (%rbp)
145469773:     	leaq	0x12d443e(%rip), %rdx   # 0x14673dbb8
14546977a:     	leaq	0xbb8(%rbp), %r15
145469781:     	leaq	-0x58(%rbp), %r8
145469785:     	movq	%r15, %rcx
145469788:     	callq	0x145728390 <.text+0x5727390>
14546978d:     	nop
14546978e:     	leaq	0x1568243(%rip), %rax   # 0x1469d19d8
145469795:     	movq	%rax, -0x58(%rbp)
145469799:     	leaq	-0x54676e0(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454697a0:     	movq	%rax, -0x50(%rbp)
1454697a4:     	movq	%r15, -0x48(%rbp)
1454697a8:     	leaq	-0x54676cf(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454697af:     	movq	%rax, -0x40(%rbp)
1454697b3:     	leaq	0x156822e(%rip), %rdx   # 0x1469d19e8
1454697ba:     	leaq	0xe18(%rbp), %rcx
1454697c1:     	leaq	-0x58(%rbp), %r8
1454697c5:     	callq	0x145728390 <.text+0x5727390>
1454697ca:     	nop
1454697cb:     	movq	0xbb8(%rbp), %rdx
1454697d2:     	testq	%rdx, %rdx
1454697d5:     	je	0x1454697e9 <.text+0x54687e9>
1454697d7:     	movq	0xbc0(%rbp), %rcx
1454697de:     	movl	$0x1, %r8d
1454697e4:     	callq	0x1400021d0 <.text+0x11d0>
1454697e9:     	movq	0xe20(%rbp), %r9
1454697f0:     	movq	0xe28(%rbp), %rax
1454697f7:     	movq	%rax, 0x20(%rsp)
1454697fc:     	leaq	0xe30(%rbp), %rcx
145469803:     	movq	0xe88(%rbp), %rdx
14546980a:     	movq	%r14, %r8
14546980d:     	movq	%r9, 0xe80(%rbp)
145469814:     	callq	0x145702c70 <.text+0x5701c70>
145469819:     	nop
14546981a:     	movq	0xe18(%rbp), %rdx
145469821:     	testq	%rdx, %rdx
145469824:     	je	0x145469838 <.text+0x5468838>
145469826:     	movl	$0x1, %r8d
14546982c:     	movq	0xe80(%rbp), %rcx
145469833:     	callq	0x1400021d0 <.text+0x11d0>
145469838:     	movb	$0x1, -0x58(%rbp)
14546983c:     	leaq	-0x58(%rbp), %rcx
145469840:     	movq	0xe88(%rbp), %rdx
145469847:     	movq	%r14, %r8
14546984a:     	callq	0x145709fb0 <.text+0x5708fb0>
14546984f:     	nop
145469850:     	movq	0xe38(%rbp), %rsi
145469857:     	movq	0xe40(%rbp), %r12
14546985e:     	testq	%rax, %rax
145469861:     	jne	0x14546987e <.text+0x546887e>
145469863:     	movq	%rsi, %rcx
145469866:     	movq	%r12, %rdx
145469869:     	movq	%rbx, %r8
14546986c:     	movq	%rdi, %r9
14546986f:     	callq	0x145718cb0 <.text+0x5717cb0>
145469874:     	nop
145469875:     	testq	%rax, %rax
145469878:     	je	0x14546993e <.text+0x546893e>
14546987e:     	movq	%rax, 0xe78(%rbp)
145469885:     	movq	%rsi, 0xbb8(%rbp)
14546988c:     	movq	%r12, 0xbc0(%rbp)
145469893:     	movq	%r15, -0x58(%rbp)
145469897:     	leaq	0x2b19a2(%rip), %rax    # 0x14571b240 <.text+0x571a240>
14546989e:     	movq	%rax, -0x50(%rbp)
1454698a2:     	movq	%r13, -0x48(%rbp)
1454698a6:     	leaq	0x2cfd53(%rip), %rax    # 0x145739600 <.text+0x5738600>
1454698ad:     	movq	%rax, -0x40(%rbp)
1454698b1:     	leaq	0x1568138(%rip), %rcx   # 0x1469d19f0
1454698b8:     	leaq	-0x58(%rbp), %rdx
1454698bc:     	callq	0x145711f90 <.text+0x5710f90>
1454698c1:     	nop
1454698c2:     	movq	0xe78(%rbp), %rax
1454698c9:     	movl	%eax, %ecx
1454698cb:     	andl	$0x3, %ecx
1454698ce:     	leal	-0x2(%rcx), %edx
1454698d1:     	cmpl	$0x2, %edx
1454698d4:     	jb	0x1454698f0 <.text+0x54688f0>
1454698d6:     	testq	%rcx, %rcx
1454698d9:     	je	0x1454698f0 <.text+0x54688f0>
1454698db:     	decq	%rax
1454698de:     	leaq	-0x50(%rbp), %rcx
1454698e2:     	movq	%rax, -0x50(%rbp)
1454698e6:     	movb	$0x3, -0x58(%rbp)
1454698ea:     	callq	0x14573b330 <.text+0x573a330>
1454698ef:     	nop
1454698f0:     	movq	0xe30(%rbp), %rdx
1454698f7:     	testq	%rdx, %rdx
1454698fa:     	je	0x14546990a <.text+0x546890a>
1454698fc:     	movl	$0x1, %r8d
145469902:     	movq	%rsi, %rcx
145469905:     	callq	0x1400021d0 <.text+0x11d0>
14546990a:     	movq	0xe98(%rbp), %rdx
145469911:     	testq	%rdx, %rdx
145469914:     	je	0x145469928 <.text+0x5468928>
145469916:     	movl	$0x1, %r8d
14546991c:     	movq	0xe88(%rbp), %rcx
145469923:     	callq	0x1400021d0 <.text+0x11d0>
145469928:     	xorl	%eax, %eax
14546992a:     	addq	$0xf28, %rsp            # imm = 0xF28
145469931:     	popq	%rbx
145469932:     	popq	%rdi
145469933:     	popq	%rsi
145469934:     	popq	%r12
145469936:     	popq	%r13
145469938:     	popq	%r14
14546993a:     	popq	%r15
14546993c:     	popq	%rbp
14546993d:     	retq
14546993e:     	leaq	-0x58(%rbp), %rcx
145469942:     	movq	0xe88(%rbp), %rdx
145469949:     	movq	%r14, %r8
14546994c:     	callq	0x145712640 <.text+0x5711640>
145469951:     	nop
145469952:     	movq	-0x58(%rbp), %rdi
145469956:     	movq	-0x50(%rbp), %rbx
14546995a:     	cmpq	$0x2, %rdi
14546995e:     	jne	0x145469989 <.text+0x5468989>
145469960:     	movl	%ebx, %eax
145469962:     	andl	$0x3, %eax
145469965:     	leal	-0x2(%rax), %ecx
145469968:     	cmpl	$0x2, %ecx
14546996b:     	jb	0x145469987 <.text+0x5468987>
14546996d:     	testq	%rax, %rax
145469970:     	je	0x145469987 <.text+0x5468987>
145469972:     	decq	%rbx
145469975:     	leaq	-0x50(%rbp), %rcx
145469979:     	movq	%rbx, -0x50(%rbp)
14546997d:     	movb	$0x3, -0x58(%rbp)
145469981:     	callq	0x14573b330 <.text+0x573a330>
145469986:     	nop
145469987:     	jmp	0x14546999f <.text+0x546899f>
145469989:     	leaq	-0x48(%rbp), %rdx
14546998d:     	leaq	0xbb8(%rbp), %rcx
145469994:     	movl	$0x260, %r8d            # imm = 0x260
14546999a:     	callq	0x1457731ed <.text+0x57721ed>
14546999f:     	leaq	0x958(%rbp), %rcx
1454699a6:     	leaq	0xbb8(%rbp), %rdx
1454699ad:     	movl	$0x260, %r8d            # imm = 0x260
1454699b3:     	callq	0x1457731ed <.text+0x57721ed>
1454699b8:     	movq	$0x0, -0x58(%rbp)
1454699c0:     	movq	$0x0, 0x208(%rbp)
1454699cb:     	movq	$0x2, 0x468(%rbp)
1454699d6:     	movq	$0x2, 0x6d8(%rbp)
1454699e1:     	movq	%rdi, 0x948(%rbp)
1454699e8:     	movq	%rbx, 0x950(%rbp)
1454699ef:     	leaq	0xbb8(%rbp), %rcx
1454699f6:     	leaq	-0x58(%rbp), %rdx
1454699fa:     	callq	0x145538370 <.text+0x5537370>
1454699ff:     	nop
145469a00:     	movq	0xbc0(%rbp), %rdi
145469a07:     	movq	0xbc8(%rbp), %rbx
145469a0e:     	cmpq	$0x2, %rbx
145469a12:     	jae	0x145469b35 <.text+0x5468b35>
145469a18:     	movq	%rbx, %r15
145469a1b:     	shlq	$0x5, %r15
145469a1f:     	addq	%rdi, %r15
145469a22:     	movl	$0x5, %ecx
145469a27:     	leaq	-0x50(%rbp), %r14
145469a2b:     	xorl	%r12d, %r12d
145469a2e:     	jmp	0x145469a32 <.text+0x5468a32>
145469a30:     	xorl	%ecx, %ecx
145469a32:     	testb	$0x1, %r12b
145469a36:     	je	0x145469a84 <.text+0x5468a84>
145469a38:     	cmpq	%r15, %rdi
145469a3b:     	je	0x145469a9c <.text+0x5468a9c>
145469a3d:     	movq	-0x18(%r15), %rcx
145469a41:     	movq	-0x10(%r15), %rdx
145469a45:     	callq	0x1457121a0 <.text+0x57111a0>
145469a4a:     	nop
145469a4b:     	addq	$-0x20, %r15
145469a4f:     	movb	$0x1, %r12b
145469a52:     	movl	$0x0, %ecx
145469a57:     	testq	%rax, %rax
145469a5a:     	je	0x145469a32 <.text+0x5468a32>
145469a5c:     	movl	%eax, %ecx
145469a5e:     	andl	$0x3, %ecx
145469a61:     	leal	-0x2(%rcx), %edx
145469a64:     	cmpl	$0x2, %edx
145469a67:     	jb	0x145469a30 <.text+0x5468a30>
145469a69:     	testq	%rcx, %rcx
145469a6c:     	je	0x145469a30 <.text+0x5468a30>
145469a6e:     	decq	%rax
145469a71:     	movq	%rax, -0x50(%rbp)
145469a75:     	movb	$0x3, -0x58(%rbp)
145469a79:     	movq	%r14, %rcx
145469a7c:     	callq	0x14573b330 <.text+0x573a330>
145469a81:     	nop
145469a82:     	jmp	0x145469a30 <.text+0x5468a30>
145469a84:     	movq	%r15, %rax
145469a87:     	subq	%rdi, %rax
145469a8a:     	shrq	$0x5, %rax
145469a8e:     	cmpq	%rax, %rcx
145469a91:     	jae	0x145469a9c <.text+0x5468a9c>
145469a93:     	shlq	$0x5, %rcx
145469a97:     	subq	%rcx, %r15
145469a9a:     	jmp	0x145469a3d <.text+0x5468a3d>
145469a9c:     	testq	%rbx, %rbx
145469a9f:     	je	0x145469ad2 <.text+0x5468ad2>
145469aa1:     	leaq	0x8(%rdi), %r14
145469aa5:     	jmp	0x145469ab9 <.text+0x5468ab9>
145469aa7:     	nopw	(%rax,%rax)
145469ab0:     	addq	$0x20, %r14
145469ab4:     	decq	%rbx
145469ab7:     	je	0x145469ad2 <.text+0x5468ad2>
145469ab9:     	movq	-0x8(%r14), %rdx
145469abd:     	testq	%rdx, %rdx
145469ac0:     	je	0x145469ab0 <.text+0x5468ab0>
145469ac2:     	movq	(%r14), %rcx
145469ac5:     	movl	$0x1, %r8d
145469acb:     	callq	0x1400021d0 <.text+0x11d0>
145469ad0:     	jmp	0x145469ab0 <.text+0x5468ab0>
145469ad2:     	movq	0xbb8(%rbp), %rdx
145469ad9:     	testq	%rdx, %rdx
145469adc:     	je	0x145469af0 <.text+0x5468af0>
145469ade:     	shlq	$0x5, %rdx
145469ae2:     	movl	$0x8, %r8d
145469ae8:     	movq	%rdi, %rcx
145469aeb:     	callq	0x1400021d0 <.text+0x11d0>
145469af0:     	movq	0xe30(%rbp), %rdx
145469af7:     	testq	%rdx, %rdx
145469afa:     	je	0x145469b0a <.text+0x5468b0a>
145469afc:     	movl	$0x1, %r8d
145469b02:     	movq	%rsi, %rcx
145469b05:     	callq	0x1400021d0 <.text+0x11d0>
145469b0a:     	movb	$0x1, %al
145469b0c:     	movq	0xe98(%rbp), %rdx
145469b13:     	testq	%rdx, %rdx
145469b16:     	je	0x14546992a <.text+0x546892a>
145469b1c:     	movl	$0x1, %r8d
145469b22:     	movq	0xe88(%rbp), %rcx
145469b29:     	callq	0x1400021d0 <.text+0x11d0>
145469b2e:     	movb	$0x1, %al
145469b30:     	jmp	0x14546992a <.text+0x546892a>
145469b35:     	cmpq	$0x15, %rbx
145469b39:     	jae	0x145469b63 <.text+0x5468b63>
145469b3b:     	movq	%rbx, %r15
145469b3e:     	shlq	$0x5, %r15
145469b42:     	addq	%rdi, %r15
145469b45:     	leaq	0x20(%rdi), %r14
145469b49:     	movq	%rdi, %rcx
145469b4c:     	movq	%r14, %rdx
145469b4f:     	callq	0x145502f00 <.text+0x5501f00>
145469b54:     	nop
145469b55:     	addq	$0x20, %r14
145469b59:     	cmpq	%r15, %r14
145469b5c:     	jne	0x145469b49 <.text+0x5468b49>
145469b5e:     	jmp	0x145469a18 <.text+0x5468a18>
145469b63:     	leaq	0xe97(%rbp), %r8
145469b6a:     	movq	%rdi, %rcx
145469b6d:     	movq	%rbx, %rdx
145469b70:     	callq	0x145480980 <.text+0x547f980>
145469b75:     	nop
145469b76:     	jmp	0x145469a18 <.text+0x5468a18>
