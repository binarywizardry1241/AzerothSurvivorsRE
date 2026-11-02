
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145514650:     	pushq	%rbp
145514651:     	pushq	%r15
145514653:     	pushq	%r14
145514655:     	pushq	%r13
145514657:     	pushq	%r12
145514659:     	pushq	%rsi
14551465a:     	pushq	%rdi
14551465b:     	pushq	%rbx
14551465c:     	subq	$0x118, %rsp            # imm = 0x118
145514663:     	leaq	0x80(%rsp), %rbp
14551466b:     	movaps	%xmm6, 0x80(%rbp)
145514672:     	movq	$-0x2, 0x78(%rbp)
14551467a:     	movq	(%rdx), %rax
14551467d:     	movq	%rax, 0x60(%rbp)
145514681:     	movq	0x8(%rdx), %r8
145514685:     	movq	0x10(%rdx), %r15
145514689:     	movq	(%rcx), %r12
14551468c:     	movq	0x8(%rcx), %r13
145514690:     	subq	%r12, %r13
145514693:     	shrq	$0x3, %r13
145514697:     	movq	0x10(%rcx), %rax
14551469b:     	cmpq	%rax, %r13
14551469e:     	cmovaeq	%rax, %r13
1455146a2:     	xorl	%edi, %edi
1455146a4:     	leaq	-0x30(%rbp), %rsi
1455146a8:     	xorps	%xmm6, %xmm6
1455146ab:     	leaq	0x208c2e(%rip), %rbx    # 0x14571d2e0 <.text+0x571c2e0>
1455146b2:     	jmp	0x1455146e0 <.text+0x55136e0>
1455146b4:     	nopw	%cs:(%rax,%rax)
1455146c0:     	incq	%rdi
1455146c3:     	movq	0x58(%rbp), %r8
1455146c7:     	leaq	(%r8,%r8,2), %rax
1455146cb:     	movq	-0x48(%rbp), %rcx
1455146cf:     	movq	%rcx, 0x10(%r15,%rax,8)
1455146d4:     	movups	-0x58(%rbp), %xmm0
1455146d8:     	movups	%xmm0, (%r15,%rax,8)
1455146dd:     	incq	%r8
1455146e0:     	cmpq	%r13, %rdi
1455146e3:     	jae	0x1455148d6 <.text+0x55138d6>
1455146e9:     	movq	(%r12,%rdi,8), %r14
1455146ed:     	cmpq	$-0x1, 0x18(%r14)
1455146f2:     	movq	%r8, 0x58(%rbp)
1455146f6:     	je	0x145514720 <.text+0x5513720>
1455146f8:     	movq	0x30(%r14), %rax
1455146fc:     	movzbl	0x54(%rax), %eax
145514700:     	testq	%rax, %rax
145514703:     	leaq	0x17d4e37(%rip), %rcx   # 0x146ce9541
14551470a:     	leaq	0x17d4e34(%rip), %rdx   # 0x146ce9545
145514711:     	cmovneq	%rdx, %rcx
145514715:     	orq	$0x4, %rax
145514719:     	jmp	0x145514760 <.text+0x5513760>
14551471b:     	nopl	(%rax,%rax)
145514720:     	movl	$0x8, %eax
145514725:     	cmpq	$-0x1, 0x40(%r14)
14551472a:     	leaq	0x17d4dfd(%rip), %rcx   # 0x146ce952e
145514731:     	jne	0x145514760 <.text+0x5513760>
145514733:     	movzbl	0x158(%r14), %edx
14551473b:     	testq	%rdx, %rdx
14551473e:     	leaq	0x17d4df1(%rip), %rcx   # 0x146ce9536
145514745:     	leaq	0x17d4df0(%rip), %rax   # 0x146ce953c
14551474c:     	cmovneq	%rax, %rcx
145514750:     	movl	$0x6, %eax
145514755:     	subq	%rdx, %rax
145514758:     	nopl	(%rax,%rax)
145514760:     	movq	%rcx, -0x40(%rbp)
145514764:     	movq	%rax, -0x38(%rbp)
145514768:     	movl	0x88(%r14), %eax
14551476f:     	movl	%eax, 0x70(%rbp)
145514772:     	movq	%r14, %rcx
145514775:     	callq	0x14540d290 <.text+0x540c290>
14551477a:     	nop
14551477b:     	movq	$0x0, -0x30(%rbp)
145514783:     	movq	$0x1, -0x28(%rbp)
14551478b:     	movq	$0x0, -0x20(%rbp)
145514793:     	testq	%rdx, %rdx
145514796:     	jne	0x145514894 <.text+0x5513894>
14551479c:     	addq	%rax, %rdx
14551479f:     	movq	%rax, %rcx
1455147a2:     	movq	%rsi, %r8
1455147a5:     	callq	0x14551d550 <.text+0x551c550>
1455147aa:     	nop
1455147ab:     	movq	-0x20(%rbp), %rax
1455147af:     	movq	%rax, 0x50(%rbp)
1455147b3:     	movups	-0x30(%rbp), %xmm0
1455147b7:     	movaps	%xmm0, 0x40(%rbp)
1455147bb:     	movss	0xf0(%r14), %xmm0
1455147c4:     	maxss	%xmm6, %xmm0
1455147c8:     	movss	%xmm0, 0x6c(%rbp)
1455147cd:     	leaq	0xf4(%r14), %rax
1455147d4:     	movl	$0x38, %ecx
1455147d9:     	cmpq	$-0x1, 0x18(%r14)
1455147de:     	jne	0x1455147f0 <.text+0x55137f0>
1455147e0:     	movl	$0x60, %ecx
1455147e5:     	cmpq	$-0x1, 0x40(%r14)
1455147ea:     	je	0x14551488d <.text+0x551388d>
1455147f0:     	movzbl	(%r14,%rcx), %ecx
1455147f5:     	movb	%cl, 0x77(%rbp)
1455147f8:     	leaq	-0x40(%rbp), %rcx
1455147fc:     	movq	%rcx, -0x30(%rbp)
145514800:     	leaq	-0x5512747(%rip), %rcx  # 0x1400020c0 <.text+0x10c0>
145514807:     	movq	%rcx, -0x28(%rbp)
14551480b:     	leaq	0x70(%rbp), %rcx
14551480f:     	movq	%rcx, -0x20(%rbp)
145514813:     	leaq	0x209826(%rip), %rcx    # 0x14571e040 <.text+0x571d040>
14551481a:     	movq	%rcx, -0x18(%rbp)
14551481e:     	leaq	0x40(%rbp), %rcx
145514822:     	movq	%rcx, -0x10(%rbp)
145514826:     	leaq	-0x551274d(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
14551482d:     	movq	%rcx, -0x8(%rbp)
145514831:     	leaq	0x6c(%rbp), %rcx
145514835:     	movq	%rcx, (%rbp)
145514839:     	movq	%rbx, 0x8(%rbp)
14551483d:     	movq	%rax, 0x10(%rbp)
145514841:     	movq	%rbx, 0x18(%rbp)
145514845:     	leaq	0x77(%rbp), %rax
145514849:     	movq	%rax, 0x20(%rbp)
14551484d:     	leaq	0x2060bc(%rip), %rax    # 0x14571a910 <.text+0x5719910>
145514854:     	movq	%rax, 0x28(%rbp)
145514858:     	leaq	-0x58(%rbp), %rcx
14551485c:     	leaq	0x17d4ce7(%rip), %rdx   # 0x146ce954a
145514863:     	movq	%rsi, %r8
145514866:     	callq	0x14570bf80 <.text+0x570af80>
14551486b:     	nop
14551486c:     	movq	0x40(%rbp), %rdx
145514870:     	testq	%rdx, %rdx
145514873:     	je	0x1455146c0 <.text+0x55136c0>
145514879:     	movq	0x48(%rbp), %rcx
14551487d:     	movl	$0x1, %r8d
145514883:     	callq	0x1400021d0 <.text+0x11d0>
145514888:     	jmp	0x1455146c0 <.text+0x55136c0>
14551488d:     	xorl	%ecx, %ecx
14551488f:     	jmp	0x1455147f5 <.text+0x55137f5>
145514894:     	movq	%rdx, %r8
145514897:     	shrq	$0x2, %r8
14551489b:     	movl	%edx, %ecx
14551489d:     	andl	$0x3, %ecx
1455148a0:     	cmpq	$0x1, %rcx
1455148a4:     	sbbq	$-0x1, %r8
1455148a8:     	movq	$0x1, 0x20(%rsp)
1455148b1:     	movl	$0x1, %r9d
1455148b7:     	movq	%rsi, %rcx
1455148ba:     	movq	%rdx, 0x30(%rbp)
1455148be:     	xorl	%edx, %edx
1455148c0:     	movq	%rax, 0x38(%rbp)
1455148c4:     	callq	0x145757d40 <.text+0x5756d40>
1455148c9:     	movq	0x30(%rbp), %rdx
1455148cd:     	movq	0x38(%rbp), %rax
1455148d1:     	jmp	0x14551479c <.text+0x551379c>
1455148d6:     	movq	0x60(%rbp), %rax
1455148da:     	movq	%r8, (%rax)
1455148dd:     	movaps	0x80(%rbp), %xmm6
