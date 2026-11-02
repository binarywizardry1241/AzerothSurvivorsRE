
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459343f2:     	mulss	%xmm6, %xmm8
1459343f7:     	maxss	0x438f6c(%rip), %xmm8   # 0x145d6d36c
145934400:     	movss	0xf0(%r14,%r13), %xmm3
14593440a:     	movss	0x128(%r14,%r13), %xmm2
145934414:     	xorps	%xmm1, %xmm1
145934417:     	movaps	%xmm3, %xmm0
14593441a:     	maxss	%xmm1, %xmm0
14593441e:     	subss	%xmm8, %xmm3
145934423:     	movss	%xmm3, 0xf0(%r14,%r13)
14593442d:     	ucomiss	%xmm2, %xmm1
145934430:     	jae	0x1459344a1 <.text+0x59334a1>
145934432:     	movss	0x9ec(%rdi), %xmm3
14593443a:     	subss	0x124(%r14,%r13), %xmm3
145934444:     	divss	%xmm2, %xmm3
145934448:     	maxss	%xmm3, %xmm1
14593444c:     	movss	0x438f18(%rip), %xmm2   # 0x145d6d36c
145934454:     	minss	%xmm1, %xmm2
145934458:     	movsd	0x10c(%r14,%r13), %xmm1
145934462:     	movsd	0x118(%r14,%r13), %xmm3
14593446c:     	subps	%xmm1, %xmm3
14593446f:     	movsldup	%xmm2, %xmm9            # xmm9 = xmm2[0,0,2,2]
145934474:     	mulps	%xmm3, %xmm9
145934478:     	addps	%xmm1, %xmm9
14593447c:     	movss	0x114(%r14,%r13), %xmm1
145934486:     	movss	0x120(%r14,%r13), %xmm10
145934490:     	subss	%xmm1, %xmm10
145934495:     	mulss	%xmm2, %xmm10
14593449a:     	addss	%xmm1, %xmm10
14593449f:     	jmp	0x1459344b5 <.text+0x59334b5>
1459344a1:     	movsd	0x118(%r14,%r13), %xmm9
1459344ab:     	movss	0x120(%r14,%r13), %xmm10
1459344b5:     	movaps	%xmm8, %xmm1
1459344b9:     	minss	%xmm0, %xmm1
1459344bd:     	movq	0x18(%r14,%r13), %r15
1459344c2:     	cmpq	$-0x1, %r15
1459344c6:     	je	0x1459344d3 <.text+0x59334d3>
1459344c8:     	movq	0x30(%r14,%r13), %rax
1459344cd:     	movl	0x30(%rax), %r12d
1459344d1:     	jmp	0x1459344d3 <.text+0x59334d3>
1459344d3:     	cvtss2sd	%xmm1, %xmm7
1459344d7:     	movsd	0x6c0(%rdi), %xmm0
1459344df:     	addsd	%xmm7, %xmm0
1459344e3:     	movsd	%xmm0, 0x6c0(%rdi)
1459344eb:     	leaq	0x6e8(%rdi), %rax
1459344f2:     	movq	0x6e8(%rdi), %rcx
1459344f9:     	testq	%rcx, %rcx
1459344fc:     	je	0x145934591 <.text+0x5933591>
145934502:     	movq	0x6f0(%rdi), %rdx
145934509:     	movzwl	0x8e(%rcx), %r9d
145934511:     	movl	%r9d, %r10d
145934514:     	shll	$0x2, %r10d
145934518:     	movq	$-0x1, %r8
14593451f:     	nop
145934520:     	testq	%r10, %r10
145934523:     	je	0x145934551 <.text+0x5933551>
145934525:     	movl	0x15c(%rbp), %r11d
14593452c:     	cmpl	0x64(%rcx,%r8,4), %r11d
145934531:     	seta	%r11b
145934535:     	sbbb	$0x0, %r11b
145934539:     	incq	%r8
14593453c:     	addq	$-0x4, %r10
145934540:     	cmpb	$0x1, %r11b
145934544:     	je	0x145934520 <.text+0x5933520>
145934546:     	movzbl	%r11b, %r9d
14593454a:     	testl	%r9d, %r9d
14593454d:     	jne	0x145934554 <.text+0x5933554>
14593454f:     	jmp	0x145934568 <.text+0x5933568>
145934551:     	movq	%r9, %r8
145934554:     	subq	$0x1, %rdx
145934558:     	jb	0x145935a9f <.text+0x5934a9f>
14593455e:     	movq	0x90(%rcx,%r8,8), %rcx
145934566:     	jmp	0x145934509 <.text+0x5933509>
145934568:     	movq	%rcx, 0xb8(%rbp)
14593456f:     	movq	%rdx, 0xc0(%rbp)
145934576:     	movq	%r8, 0xc8(%rbp)
14593457d:     	movq	%rax, 0xd0(%rbp)
145934584:     	movq	$0x0, 0xb0(%rbp)
14593458f:     	jmp	0x1459345af <.text+0x59335af>
145934591:     	movq	%rax, 0xb0(%rbp)
145934598:     	movq	$0x0, 0xb8(%rbp)
1459345a3:     	movl	0x15c(%rbp), %eax
1459345a9:     	movl	%eax, 0xd0(%rbp)
1459345af:     	leaq	0xb0(%rbp), %rcx
1459345b6:     	callq	0x1458e1520 <.text+0x58e0520>
1459345bb:     	movsd	(%rax), %xmm0
1459345bf:     	addsd	%xmm7, %xmm0
1459345c3:     	movsd	%xmm0, (%rax)
1459345c7:     	movss	0xf0(%r14,%r13), %xmm11
1459345d1:     	xorps	%xmm12, %xmm12
1459345d5:     	movaps	%xmm11, %xmm0
1459345d9:     	maxss	%xmm12, %xmm0
1459345de:     	callq	0x145bc981d <.text+0x5bc881d>
1459345e3:     	cvttss2si	%xmm0, %rax
1459345e8:     	xorl	%ecx, %ecx
1459345ea:     	ucomiss	%xmm12, %xmm0
1459345ee:     	cmovael	%eax, %ecx
1459345f1:     	ucomiss	0x43927c(%rip), %xmm0   # 0x145d6d874
1459345f8:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1459345fd:     	cmovbel	%ecx, %eax
145934600:     	movl	%eax, 0xa8(%rbp)
145934606:     	cmpq	$-0x1, %r15
14593460a:     	movq	%rsi, 0x170(%rbp)
145934611:     	movl	0x15c(%rbp), %r14d
145934618:     	je	0x145934699 <.text+0x5933699>
14593461a:     	ucomiss	%xmm11, %xmm12
14593461e:     	jb	0x145934699 <.text+0x5933699>
145934620:     	movl	%ebx, %r13d
145934623:     	cmpl	$0x3ea6, %r14d          # imm = 0x3EA6
14593462a:     	je	0x14593464f <.text+0x593364f>
14593462c:     	cmpl	$0x376a, %r14d          # imm = 0x376A
145934633:     	je	0x145934648 <.text+0x5933648>
145934635:     	movl	%r14d, %esi
145934638:     	cmpl	$0x14bc, %r14d          # imm = 0x14BC
14593463f:     	jne	0x145934654 <.text+0x5933654>
145934641:     	movl	$0x50a7, %esi           # imm = 0x50A7
145934646:     	jmp	0x145934654 <.text+0x5933654>
145934648:     	movl	$0x832, %esi            # imm = 0x832
14593464d:     	jmp	0x145934654 <.text+0x5933654>
14593464f:     	movl	$0x209d, %esi           # imm = 0x209D
145934654:     	movq	%rdi, %rbx
145934657:     	movq	0x6b8(%rdi), %rdi
14593465e:     	cmpq	0x6a8(%rbx), %rdi
145934665:     	jne	0x145934673 <.text+0x5933673>
145934667:     	leaq	0x6a8(%rbx), %rcx
14593466e:     	callq	0x145bfb120 <.text+0x5bfa120>
145934673:     	movq	0x6b0(%rbx), %rax
14593467a:     	movl	%r12d, (%rax,%rdi,8)
14593467e:     	movl	%esi, 0x4(%rax,%rdi,8)
145934682:     	incq	%rdi
145934685:     	movq	%rdi, 0x6b8(%rbx)
14593468c:     	movq	%rbx, %rdi
14593468f:     	movq	0x170(%rbp), %rsi
145934696:     	movl	%r13d, %ebx
145934699:     	leaq	0xb0(%rbp), %rcx
1459346a0:     	movq	%rdi, %rdx
1459346a3:     	movl	%r14d, %r8d
1459346a6:     	callq	0x1458f2ee0 <.text+0x58f1ee0>
1459346ab:     	movb	$0x1, 0x16f(%rbp)
1459346b2:     	leaq	0x120(%rbp), %rcx
1459346b9:     	movq	%rdi, %rdx
1459346bc:     	movaps	%xmm7, %xmm2
1459346bf:     	callq	0x1458f27a0 <.text+0x58f17a0>
1459346c4:     	nop
1459346c5:     	leaq	0x660(%rdi), %rcx
1459346cc:     	movq	0x128(%rbp), %r9
1459346d3:     	movq	0x130(%rbp), %rax
1459346da:     	movq	%rax, 0x20(%rsp)
1459346df:     	leaq	0xb0(%rbp), %rdx
1459346e6:     	movaps	%xmm7, %xmm2
1459346e9:     	movq	%r9, 0x160(%rbp)
1459346f0:     	callq	0x14595f3c0 <.text+0x595e3c0>
1459346f5:     	nop
1459346f6:     	movq	0x120(%rbp), %rax
1459346fd:     	testq	%rax, %rax
145934700:     	je	0x14593471c <.text+0x593371c>
145934702:     	shlq	$0x3, %rax
145934706:     	leaq	(%rax,%rax,2), %rdx
14593470a:     	movl	$0x8, %r8d
145934710:     	movq	0x160(%rbp), %rcx
145934717:     	callq	0x1400021d0 <.text+0x11d0>
14593471c:     	cmpq	$-0x1, %r15
145934720:     	je	0x1459348cb <.text+0x59338cb>
145934726:     	cmpl	$0x0, 0x704(%rdi)
14593472d:     	je	0x14593483a <.text+0x593383a>
145934733:     	movss	0x9ec(%rdi), %xmm0
14593473b:     	movss	%xmm0, 0x700(%rdi)
145934743:     	movl	$0x0, 0x704(%rdi)
14593474d:     	movq	0x698(%rdi), %r12
145934754:     	movq	0x6a0(%rdi), %rax
14593475b:     	movq	$0x0, 0x6a0(%rdi)
145934766:     	movq	%rax, 0x160(%rbp)
14593476d:     	testq	%rax, %rax
145934770:     	je	0x14593483a <.text+0x593383a>
145934776:     	xorl	%ebx, %ebx
145934778:     	jmp	0x145934793 <.text+0x5933793>
14593477a:     	nopw	(%rax,%rax)
145934780:     	incq	%rbx
145934783:     	cmpq	0x160(%rbp), %rbx
14593478a:     	movq	%r13, %rdi
14593478d:     	je	0x14593483a <.text+0x593383a>
145934793:     	movq	%rdi, %r13
145934796:     	leaq	(%rbx,%rbx,4), %rax
14593479a:     	shlq	$0x4, %rax
14593479e:     	leaq	(%r12,%rax), %r14
1459347a2:     	movq	0x18(%r12,%rax), %rdx
1459347a7:     	cmpq	$-0x1, %rdx
1459347ab:     	je	0x1459347c1 <.text+0x59337c1>
1459347ad:     	testq	%rdx, %rdx
1459347b0:     	je	0x1459347c1 <.text+0x59337c1>
1459347b2:     	movq	0x20(%r14), %rcx
1459347b6:     	movl	$0x1, %r8d
1459347bc:     	callq	0x1400021d0 <.text+0x11d0>
1459347c1:     	movq	0x8(%r14), %r15
1459347c5:     	movq	0x10(%r14), %rsi
1459347c9:     	testq	%rsi, %rsi
1459347cc:     	je	0x145934810 <.text+0x5933810>
1459347ce:     	leaq	0x8(%r15), %rdi
1459347d2:     	jmp	0x1459347e9 <.text+0x59337e9>
1459347d4:     	nopw	%cs:(%rax,%rax)
1459347e0:     	addq	$0x20, %rdi
1459347e4:     	decq	%rsi
1459347e7:     	je	0x145934810 <.text+0x5933810>
1459347e9:     	movq	-0x8(%rdi), %rdx
1459347ed:     	cmpq	$-0x1, %rdx
1459347f1:     	je	0x1459347e0 <.text+0x59337e0>
1459347f3:     	testq	%rdx, %rdx
1459347f6:     	je	0x1459347e0 <.text+0x59337e0>
1459347f8:     	movq	(%rdi), %rcx
1459347fb:     	movl	$0x1, %r8d
145934801:     	callq	0x1400021d0 <.text+0x11d0>
145934806:     	jmp	0x1459347e0 <.text+0x59337e0>
145934808:     	nopl	(%rax,%rax)
145934810:     	movq	(%r14), %rdx
145934813:     	testq	%rdx, %rdx
145934816:     	movq	0x170(%rbp), %rsi
14593481d:     	je	0x145934780 <.text+0x5933780>
145934823:     	shlq	$0x5, %rdx
145934827:     	movl	$0x8, %r8d
14593482d:     	movq	%r15, %rcx
145934830:     	callq	0x1400021d0 <.text+0x11d0>
145934835:     	jmp	0x145934780 <.text+0x5933780>
14593483a:     	leaq	0xb0(%rbp), %rcx
145934841:     	movq	%rdi, %rdx
145934844:     	movl	0x15c(%rbp), %r14d
14593484b:     	movl	%r14d, %r8d
14593484e:     	callq	0x1458f2ee0 <.text+0x58f1ee0>
145934853:     	movb	$0x1, 0x16e(%rbp)
14593485a:     	leaq	0x120(%rbp), %rcx
145934861:     	movq	%rdi, %rdx
145934864:     	movaps	%xmm7, %xmm2
145934867:     	callq	0x1458f27a0 <.text+0x58f17a0>
14593486c:     	nop
14593486d:     	leaq	0x690(%rdi), %rcx
145934874:     	movq	0x128(%rbp), %r9
14593487b:     	movq	0x130(%rbp), %rax
145934882:     	movq	%rax, 0x20(%rsp)
145934887:     	leaq	0xb0(%rbp), %rdx
14593488e:     	movaps	%xmm7, %xmm2
145934891:     	movq	%r9, 0x160(%rbp)
145934898:     	callq	0x14595f3c0 <.text+0x595e3c0>
