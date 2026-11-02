
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403ab340:     	pushq	%rbp
1403ab341:     	pushq	%r15
1403ab343:     	pushq	%r14
1403ab345:     	pushq	%r13
1403ab347:     	pushq	%r12
1403ab349:     	pushq	%rsi
1403ab34a:     	pushq	%rdi
1403ab34b:     	pushq	%rbx
1403ab34c:     	subq	$0x508, %rsp            # imm = 0x508
1403ab353:     	leaq	0x80(%rsp), %rbp
1403ab35b:     	movq	$-0x2, 0x480(%rbp)
1403ab366:     	movq	%r8, %rbx
1403ab369:     	movq	%rdx, %rdi
1403ab36c:     	movq	%rcx, %rsi
1403ab36f:     	cmpq	$-0x1, 0xf0(%rdx)
1403ab377:     	je	0x1403ab3ca <.text+0x3aa3ca>
1403ab379:     	movq	0x5a0(%rbx), %rax
1403ab380:     	movq	%rax, 0xe0(%rbp)
1403ab387:     	cmpq	%rax, 0x328(%rdi)
1403ab38e:     	je	0x1403ab69d <.text+0x3aa69d>
1403ab394:     	addq	$0x328, %rdi            # imm = 0x328
1403ab39b:     	leaq	0x55a617e(%rip), %rax   # 0x145951520
1403ab3a2:     	movq	%rax, 0x28(%rsp)
1403ab3a7:     	movq	$0x83, 0x20(%rsp)
1403ab3b0:     	leaq	0x55a6123(%rip), %r9    # 0x1459514da
1403ab3b7:     	leaq	0xe0(%rbp), %r8
1403ab3be:     	xorl	%ecx, %ecx
1403ab3c0:     	movq	%rdi, %rdx
1403ab3c3:     	callq	0x14589fabd <.text+0x589eabd>
1403ab3c8:     	ud2
1403ab3ca:     	leaq	0x40(%rbx), %r14
1403ab3ce:     	leaq	0x5a8(%rbx), %r15
1403ab3d5:     	movq	%r14, 0x350(%rbp)
1403ab3dc:     	movq	%r15, 0x358(%rbp)
1403ab3e3:     	movq	$0x0, 0x338(%rbp)
1403ab3ee:     	movq	$0x8, 0x340(%rbp)
1403ab3f9:     	movq	$0x0, 0x348(%rbp)
1403ab404:     	leaq	0x554e7ad(%rip), %rdx   # 0x1458f9bb8
1403ab40b:     	leaq	0x338(%rbp), %rcx
1403ab412:     	callq	0x140083820 <.text+0x82820>
1403ab417:     	nop
1403ab418:     	movq	%rax, %r12
1403ab41b:     	movq	0x338(%rbp), %rdx
1403ab422:     	testq	%rdx, %rdx
1403ab425:     	je	0x1403ab43d <.text+0x3aa43d>
1403ab427:     	movq	0x340(%rbp), %rcx
1403ab42e:     	shlq	$0x3, %rdx
1403ab432:     	movl	$0x8, %r8d
1403ab438:     	callq	0x1400021d0 <.text+0x11d0>
1403ab43d:     	movq	%r14, 0x350(%rbp)
1403ab444:     	movq	%r15, 0x358(%rbp)
1403ab44b:     	movq	$0x0, 0x338(%rbp)
1403ab456:     	movq	$0x8, 0x340(%rbp)
1403ab461:     	movq	$0x0, 0x348(%rbp)
1403ab46c:     	leaq	0x554e615(%rip), %rdx   # 0x1458f9a88
1403ab473:     	leaq	0x338(%rbp), %rcx
1403ab47a:     	callq	0x140081da0 <.text+0x80da0>
1403ab47f:     	nop
1403ab480:     	movq	%rax, %r13
1403ab483:     	movq	0x338(%rbp), %rdx
1403ab48a:     	testq	%rdx, %rdx
1403ab48d:     	je	0x1403ab4a5 <.text+0x3aa4a5>
1403ab48f:     	movq	0x340(%rbp), %rcx
1403ab496:     	shlq	$0x3, %rdx
1403ab49a:     	movl	$0x8, %r8d
1403ab4a0:     	callq	0x1400021d0 <.text+0x11d0>
1403ab4a5:     	movq	%r14, 0x350(%rbp)
1403ab4ac:     	movq	%r15, 0x358(%rbp)
1403ab4b3:     	movq	$0x0, 0x338(%rbp)
1403ab4be:     	movq	$0x8, 0x340(%rbp)
1403ab4c9:     	movq	$0x0, 0x348(%rbp)
1403ab4d4:     	leaq	0x554df15(%rip), %rdx   # 0x1458f93f0
1403ab4db:     	leaq	0x338(%rbp), %rcx
1403ab4e2:     	callq	0x140083e10 <.text+0x82e10>
1403ab4e7:     	movq	%rax, 0x468(%rbp)
1403ab4ee:     	movq	0x338(%rbp), %rdx
1403ab4f5:     	testq	%rdx, %rdx
1403ab4f8:     	je	0x1403ab510 <.text+0x3aa510>
1403ab4fa:     	movq	0x340(%rbp), %rcx
1403ab501:     	shlq	$0x3, %rdx
1403ab505:     	movl	$0x8, %r8d
1403ab50b:     	callq	0x1400021d0 <.text+0x11d0>
1403ab510:     	movq	%r14, 0x350(%rbp)
1403ab517:     	movq	%r15, 0x358(%rbp)
1403ab51e:     	movq	$0x0, 0x338(%rbp)
1403ab529:     	movq	$0x8, 0x340(%rbp)
1403ab534:     	movq	$0x0, 0x348(%rbp)
1403ab53f:     	leaq	0x554deba(%rip), %rdx   # 0x1458f9400
1403ab546:     	leaq	0x338(%rbp), %rcx
1403ab54d:     	callq	0x140084110 <.text+0x83110>
1403ab552:     	movq	%rax, 0x470(%rbp)
1403ab559:     	movq	0x338(%rbp), %rdx
1403ab560:     	testq	%rdx, %rdx
1403ab563:     	je	0x1403ab57b <.text+0x3aa57b>
1403ab565:     	movq	0x340(%rbp), %rcx
1403ab56c:     	shlq	$0x3, %rdx
1403ab570:     	movl	$0x8, %r8d
1403ab576:     	callq	0x1400021d0 <.text+0x11d0>
1403ab57b:     	movq	%r14, 0x350(%rbp)
1403ab582:     	movq	%r15, 0x358(%rbp)
1403ab589:     	movq	$0x0, 0x338(%rbp)
1403ab594:     	movq	$0x8, 0x340(%rbp)
1403ab59f:     	movq	$0x0, 0x348(%rbp)
1403ab5aa:     	leaq	0x554e5f7(%rip), %rdx   # 0x1458f9ba8
1403ab5b1:     	leaq	0x338(%rbp), %rcx
1403ab5b8:     	callq	0x140083530 <.text+0x82530>
1403ab5bd:     	nop
1403ab5be:     	movq	%rax, %r14
1403ab5c1:     	movq	%r13, 0x478(%rbp)
1403ab5c8:     	movq	0x338(%rbp), %rdx
1403ab5cf:     	testq	%rdx, %rdx
1403ab5d2:     	je	0x1403ab5ea <.text+0x3aa5ea>
1403ab5d4:     	movq	0x340(%rbp), %rcx
1403ab5db:     	shlq	$0x3, %rdx
1403ab5df:     	movl	$0x8, %r8d
1403ab5e5:     	callq	0x1400021d0 <.text+0x11d0>
1403ab5ea:     	movq	%r12, %r13
1403ab5ed:     	leaq	-0x48(%rbp), %rcx
1403ab5f1:     	movq	%rbx, %rdx
1403ab5f4:     	callq	0x14033bb10 <.text+0x33ab10>
1403ab5f9:     	nop
1403ab5fa:     	leaq	0x338(%rbp), %rcx
1403ab601:     	movq	%rbx, %rdx
1403ab604:     	callq	0x14033c1f0 <.text+0x33b1f0>
1403ab609:     	nop
1403ab60a:     	leaq	0xe0(%rbp), %r15
1403ab611:     	leaq	-0x48(%rbp), %rdx
1403ab615:     	movl	$0x128, %r8d            # imm = 0x128
1403ab61b:     	movq	%r15, %rcx
1403ab61e:     	callq	0x145756ddd <.text+0x5755ddd>
1403ab623:     	leaq	0x208(%rbp), %rcx
1403ab62a:     	leaq	0x338(%rbp), %rdx
1403ab631:     	movl	$0x130, %r8d            # imm = 0x130
1403ab637:     	callq	0x145756ddd <.text+0x5755ddd>
1403ab63c:     	movq	0x5a0(%rbx), %r12
1403ab643:     	movl	$0x258, %r8d            # imm = 0x258
1403ab649:     	movq	%rdi, %rcx
1403ab64c:     	movq	%r15, %rdx
1403ab64f:     	callq	0x145756ddd <.text+0x5755ddd>
1403ab654:     	movq	%r13, 0x258(%rdi)
1403ab65b:     	movq	0x478(%rbp), %rax
1403ab662:     	movq	%rax, 0x260(%rdi)
1403ab669:     	movq	0x468(%rbp), %rax
1403ab670:     	movq	%rax, 0x268(%rdi)
1403ab677:     	movq	0x470(%rbp), %rax
1403ab67e:     	movq	%rax, 0x270(%rdi)
1403ab685:     	movq	%r14, 0x278(%rdi)
1403ab68c:     	movl	$0x0, 0x280(%rdi)
1403ab696:     	movq	%r12, 0x328(%rdi)
1403ab69d:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
1403ab6a2:     	addl	0x5b0(%rbx), %eax
1403ab6a8:     	leaq	0x330(%rdi), %rdx
1403ab6af:     	movl	%eax, 0x330(%rdi)
1403ab6b5:     	movq	$0x10, 0xf8(%rbp)
1403ab6c0:     	xorps	%xmm0, %xmm0
1403ab6c3:     	movups	%xmm0, 0x100(%rbp)
1403ab6ca:     	movq	$0x10, 0x110(%rbp)
1403ab6d5:     	movups	%xmm0, 0x118(%rbp)
1403ab6dc:     	movq	$0x10, 0x128(%rbp)
1403ab6e7:     	movups	%xmm0, 0x130(%rbp)
1403ab6ee:     	movq	$0x10, 0x140(%rbp)
1403ab6f9:     	movups	%xmm0, 0x148(%rbp)
1403ab700:     	movq	$0x10, 0x158(%rbp)
1403ab70b:     	movq	$0x0, 0xe0(%rbp)
1403ab716:     	movups	%xmm0, 0x160(%rbp)
1403ab71d:     	movl	$0x0, 0x170(%rbp)
1403ab727:     	movq	$0x8, 0xe8(%rbp)
1403ab732:     	movq	$0x0, 0xf0(%rbp)
1403ab73d:     	leaq	0xe0(%rbp), %r8
1403ab744:     	movq	%rdi, %rcx
1403ab747:     	movq	%rbx, %r9
1403ab74a:     	callq	0x140095b80 <.text+0x94b80>
1403ab74f:     	nop
1403ab750:     	leaq	0xe0(%rbp), %rdx
1403ab757:     	movl	$0x98, %r8d
1403ab75d:     	movq	%rsi, %rcx
1403ab760:     	callq	0x145756ddd <.text+0x5755ddd>
1403ab765:     	movq	%rsi, %rax
1403ab768:     	addq	$0x508, %rsp            # imm = 0x508
1403ab76f:     	popq	%rbx
1403ab770:     	popq	%rdi
1403ab771:     	popq	%rsi
1403ab772:     	popq	%r12
1403ab774:     	popq	%r13
1403ab776:     	popq	%r14
1403ab778:     	popq	%r15
1403ab77a:     	popq	%rbp
1403ab77b:     	retq
