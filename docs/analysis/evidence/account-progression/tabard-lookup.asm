
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454304f0:     	pushq	%rbp
1454304f1:     	pushq	%r15
1454304f3:     	pushq	%r14
1454304f5:     	pushq	%r13
1454304f7:     	pushq	%r12
1454304f9:     	pushq	%rsi
1454304fa:     	pushq	%rdi
1454304fb:     	pushq	%rbx
1454304fc:     	subq	$0x98, %rsp
145430503:     	leaq	0x80(%rsp), %rbp
14543050b:     	movq	$-0x2, 0x10(%rbp)
145430513:     	movq	%rcx, %rsi
145430516:     	movq	0x40(%rdx), %rdi
14543051a:     	leaq	(,%rdi,4), %r15
145430522:     	movq	%rdi, %rax
145430525:     	shrq	$0x3e, %rax
145430529:     	setne	%al
14543052c:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
145430536:     	cmpq	%rcx, %r15
145430539:     	seta	%cl
14543053c:     	orb	%al, %cl
14543053e:     	je	0x145430550 <.text+0x542f550>
145430540:     	xorl	%r13d, %r13d
145430543:     	movq	%r13, %rcx
145430546:     	movq	%r15, %rdx
145430549:     	callq	0x14590379b <.text+0x590279b>
14543054e:     	ud2
145430550:     	movq	%rdx, %r14
145430553:     	movq	0x38(%rdx), %r12
145430557:     	testq	%r15, %r15
14543055a:     	je	0x145430581 <.text+0x542f581>
14543055c:     	callq	0x140002200 <.text+0x1200>
145430561:     	movl	$0x4, %r13d
145430567:     	movl	$0x4, %edx
14543056c:     	movq	%r15, %rcx
14543056f:     	callq	0x1400021c0 <.text+0x11c0>
145430574:     	testq	%rax, %rax
145430577:     	je	0x145430543 <.text+0x542f543>
145430579:     	movq	%rax, %rbx
14543057c:     	movq	%rdi, %r13
14543057f:     	jmp	0x145430589 <.text+0x542f589>
145430581:     	movl	$0x4, %ebx
145430586:     	xorl	%r13d, %r13d
145430589:     	movq	%r13, -0x10(%rbp)
14543058d:     	movq	%rbx, -0x8(%rbp)
145430591:     	movq	$0x0, (%rbp)
145430599:     	testq	%rdi, %rdi
14543059c:     	je	0x1454305b0 <.text+0x542f5b0>
14543059e:     	movq	%rbx, %rcx
1454305a1:     	movq	%r12, %rdx
1454305a4:     	movq	%r15, %r8
1454305a7:     	callq	0x1457731ed <.text+0x57721ed>
1454305ac:     	movq	%rdi, (%rbp)
1454305b0:     	leaq	0x15a8f01(%rip), %rax   # 0x1469d94b8
1454305b7:     	movq	%rax, -0x50(%rbp)
1454305bb:     	leaq	0x15a93f6(%rip), %rax   # 0x1469d99b8
1454305c2:     	movq	%rax, -0x48(%rbp)
1454305c6:     	movq	%r14, -0x40(%rbp)
1454305ca:     	movq	%r13, -0x20(%rbp)
1454305ce:     	leaq	-0x38(%rbp), %rcx
1454305d2:     	leaq	-0x50(%rbp), %rdx
1454305d6:     	callq	0x14553e640 <.text+0x553d640>
1454305db:     	nop
1454305dc:     	movq	-0x38(%rbp), %r15
1454305e0:     	movq	-0x30(%rbp), %r12
1454305e4:     	movq	-0x28(%rbp), %r14
1454305e8:     	subq	%rdi, %r13
1454305eb:     	cmpq	%r13, %r14
1454305ee:     	ja	0x145430650 <.text+0x542f650>
1454305f0:     	testq	%r14, %r14
1454305f3:     	je	0x145430609 <.text+0x542f609>
1454305f5:     	leaq	(,%r14,4), %r8
1454305fd:     	leaq	(%rbx,%rdi,4), %rcx
145430601:     	movq	%r12, %rdx
145430604:     	callq	0x1457731ed <.text+0x57721ed>
145430609:     	addq	%r14, %rdi
14543060c:     	movq	%rdi, (%rbp)
145430610:     	testq	%r15, %r15
145430613:     	je	0x14543062a <.text+0x542f62a>
145430615:     	shlq	$0x2, %r15
145430619:     	movl	$0x4, %r8d
14543061f:     	movq	%r12, %rcx
145430622:     	movq	%r15, %rdx
145430625:     	callq	0x1400021d0 <.text+0x11d0>
14543062a:     	movq	(%rbp), %rax
14543062e:     	movq	%rax, 0x10(%rsi)
145430632:     	movups	-0x10(%rbp), %xmm0
145430636:     	movups	%xmm0, (%rsi)
145430639:     	movq	%rsi, %rax
14543063c:     	addq	$0x98, %rsp
145430643:     	popq	%rbx
145430644:     	popq	%rdi
145430645:     	popq	%rsi
145430646:     	popq	%r12
145430648:     	popq	%r13
14543064a:     	popq	%r14
14543064c:     	popq	%r15
14543064e:     	popq	%rbp
14543064f:     	retq
145430650:     	movq	%r12, -0x18(%rbp)
145430654:     	movq	%r15, 0x8(%rbp)
145430658:     	movq	$0x4, 0x20(%rsp)
145430661:     	leaq	-0x10(%rbp), %rcx
145430665:     	movl	$0x4, %r9d
14543066b:     	movq	%rdi, %rdx
14543066e:     	movq	%r14, %r8
145430671:     	callq	0x1457744b0 <.text+0x57734b0>
145430676:     	nop
145430677:     	movq	-0x8(%rbp), %rbx
14543067b:     	movq	(%rbp), %rdi
14543067f:     	movq	0x8(%rbp), %r15
145430683:     	movq	-0x18(%rbp), %r12
145430687:     	jmp	0x1454305f5 <.text+0x542f5f5>
