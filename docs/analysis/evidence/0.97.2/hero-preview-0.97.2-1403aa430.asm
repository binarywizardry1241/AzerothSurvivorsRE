
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403aa430:     	pushq	%rbp
1403aa431:     	pushq	%r15
1403aa433:     	pushq	%r14
1403aa435:     	pushq	%r13
1403aa437:     	pushq	%r12
1403aa439:     	pushq	%rsi
1403aa43a:     	pushq	%rdi
1403aa43b:     	pushq	%rbx
1403aa43c:     	subq	$0x728, %rsp            # imm = 0x728
1403aa443:     	leaq	0x80(%rsp), %rbp
1403aa44b:     	movq	$-0x2, 0x6a0(%rbp)
1403aa456:     	movq	%r8, %rbx
1403aa459:     	movq	%rdx, %rdi
1403aa45c:     	movq	%rcx, %rsi
1403aa45f:     	cmpq	$-0x1, 0xf0(%rdx)
1403aa467:     	je	0x1403aa4ba <.text+0x3a94ba>
1403aa469:     	movq	0x5a0(%rbx), %rax
1403aa470:     	movq	%rax, 0x318(%rbp)
1403aa477:     	cmpq	%rax, 0x378(%rdi)
1403aa47e:     	je	0x1403aa5e8 <.text+0x3a95e8>
1403aa484:     	addq	$0x378, %rdi            # imm = 0x378
1403aa48b:     	leaq	0x55a708e(%rip), %rax   # 0x145951520
1403aa492:     	movq	%rax, 0x28(%rsp)
1403aa497:     	movq	$0x83, 0x20(%rsp)
1403aa4a0:     	leaq	0x55a7033(%rip), %r9    # 0x1459514da
1403aa4a7:     	leaq	0x318(%rbp), %r8
1403aa4ae:     	xorl	%ecx, %ecx
1403aa4b0:     	movq	%rdi, %rdx
1403aa4b3:     	callq	0x14589fabd <.text+0x589eabd>
1403aa4b8:     	ud2
1403aa4ba:     	leaq	0x1f8(%rbp), %rcx
1403aa4c1:     	movq	%rbx, %rdx
1403aa4c4:     	callq	0x140338320 <.text+0x337320>
1403aa4c9:     	nop
1403aa4ca:     	leaq	0xd8(%rbp), %rcx
1403aa4d1:     	movq	%rbx, %rdx
1403aa4d4:     	callq	0x140323ac0 <.text+0x322ac0>
1403aa4d9:     	nop
1403aa4da:     	leaq	-0x48(%rbp), %rcx
1403aa4de:     	movq	%rbx, %rdx
1403aa4e1:     	callq	0x140325e80 <.text+0x324e80>
1403aa4e6:     	nop
1403aa4e7:     	movq	%rbx, %rcx
1403aa4ea:     	callq	0x1400a1250 <.text+0xa0250>
1403aa4ef:     	nop
1403aa4f0:     	movq	%rax, %r14
1403aa4f3:     	leaq	0x40(%rbx), %rax
1403aa4f7:     	leaq	0x5a8(%rbx), %rcx
1403aa4fe:     	movq	%rax, 0x690(%rbp)
1403aa505:     	movq	%rcx, 0x698(%rbp)
1403aa50c:     	movq	$0x0, 0x678(%rbp)
1403aa517:     	movq	$0x8, 0x680(%rbp)
1403aa522:     	movq	$0x0, 0x688(%rbp)
1403aa52d:     	leaq	0x554f674(%rip), %rdx   # 0x1458f9ba8
1403aa534:     	leaq	0x678(%rbp), %rcx
1403aa53b:     	callq	0x140083530 <.text+0x82530>
1403aa540:     	nop
1403aa541:     	movq	%rax, %r15
1403aa544:     	movq	0x678(%rbp), %rdx
1403aa54b:     	testq	%rdx, %rdx
1403aa54e:     	je	0x1403aa566 <.text+0x3a9566>
1403aa550:     	movq	0x680(%rbp), %rcx
1403aa557:     	shlq	$0x3, %rdx
1403aa55b:     	movl	$0x8, %r8d
1403aa561:     	callq	0x1400021d0 <.text+0x11d0>
1403aa566:     	leaq	0x318(%rbp), %r12
1403aa56d:     	leaq	0x1f8(%rbp), %rdx
1403aa574:     	movl	$0x120, %r8d            # imm = 0x120
1403aa57a:     	movq	%r12, %rcx
1403aa57d:     	callq	0x145756ddd <.text+0x5755ddd>
1403aa582:     	leaq	0x438(%rbp), %rcx
1403aa589:     	leaq	0xd8(%rbp), %rdx
1403aa590:     	movl	$0x120, %r8d            # imm = 0x120
1403aa596:     	callq	0x145756ddd <.text+0x5755ddd>
1403aa59b:     	leaq	0x558(%rbp), %rcx
1403aa5a2:     	leaq	-0x48(%rbp), %rdx
1403aa5a6:     	movl	$0x120, %r8d            # imm = 0x120
1403aa5ac:     	callq	0x145756ddd <.text+0x5755ddd>
1403aa5b1:     	movq	0x5a0(%rbx), %r13
1403aa5b8:     	movl	$0x360, %r8d            # imm = 0x360
1403aa5be:     	movq	%rdi, %rcx
1403aa5c1:     	movq	%r12, %rdx
1403aa5c4:     	callq	0x145756ddd <.text+0x5755ddd>
1403aa5c9:     	movq	%r14, 0x360(%rdi)
1403aa5d0:     	movq	%r15, 0x368(%rdi)
1403aa5d7:     	movl	$0x0, 0x370(%rdi)
1403aa5e1:     	movq	%r13, 0x378(%rdi)
1403aa5e8:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
1403aa5ed:     	addl	0x5b0(%rbx), %eax
1403aa5f3:     	leaq	0x380(%rdi), %rdx
1403aa5fa:     	movl	%eax, 0x380(%rdi)
1403aa600:     	movq	$0x10, 0x330(%rbp)
1403aa60b:     	xorps	%xmm0, %xmm0
1403aa60e:     	movups	%xmm0, 0x338(%rbp)
1403aa615:     	movq	$0x10, 0x348(%rbp)
1403aa620:     	movups	%xmm0, 0x350(%rbp)
1403aa627:     	movq	$0x10, 0x360(%rbp)
1403aa632:     	movups	%xmm0, 0x368(%rbp)
1403aa639:     	movq	$0x10, 0x378(%rbp)
1403aa644:     	movups	%xmm0, 0x380(%rbp)
1403aa64b:     	movq	$0x10, 0x390(%rbp)
1403aa656:     	movq	$0x0, 0x318(%rbp)
1403aa661:     	movups	%xmm0, 0x398(%rbp)
1403aa668:     	movl	$0x0, 0x3a8(%rbp)
1403aa672:     	movq	$0x8, 0x320(%rbp)
1403aa67d:     	movq	$0x0, 0x328(%rbp)
1403aa688:     	leaq	0x318(%rbp), %r8
1403aa68f:     	movq	%rdi, %rcx
1403aa692:     	movq	%rbx, %r9
1403aa695:     	callq	0x140067390 <.text+0x66390>
1403aa69a:     	nop
1403aa69b:     	leaq	0x318(%rbp), %rdx
1403aa6a2:     	movl	$0x98, %r8d
1403aa6a8:     	movq	%rsi, %rcx
1403aa6ab:     	callq	0x145756ddd <.text+0x5755ddd>
1403aa6b0:     	movq	%rsi, %rax
1403aa6b3:     	addq	$0x728, %rsp            # imm = 0x728
1403aa6ba:     	popq	%rbx
1403aa6bb:     	popq	%rdi
1403aa6bc:     	popq	%rsi
1403aa6bd:     	popq	%r12
1403aa6bf:     	popq	%r13
1403aa6c1:     	popq	%r14
1403aa6c3:     	popq	%r15
1403aa6c5:     	popq	%rbp
1403aa6c6:     	retq
