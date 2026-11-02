
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455405b0:     	pushq	%rbp
1455405b1:     	pushq	%r15
1455405b3:     	pushq	%r14
1455405b5:     	pushq	%r13
1455405b7:     	pushq	%r12
1455405b9:     	pushq	%rsi
1455405ba:     	pushq	%rdi
1455405bb:     	pushq	%rbx
1455405bc:     	subq	$0x88, %rsp
1455405c3:     	leaq	0x80(%rsp), %rbp
1455405cb:     	movaps	%xmm8, -0x10(%rbp)
1455405d0:     	movaps	%xmm7, -0x20(%rbp)
1455405d4:     	movaps	%xmm6, -0x30(%rbp)
1455405d8:     	movq	$-0x2, -0x38(%rbp)
1455405e0:     	movq	%rcx, %rsi
1455405e3:     	movq	(%rdx), %r15
1455405e6:     	movq	0x8(%rdx), %r14
1455405ea:     	cmpq	%r14, %r15
1455405ed:     	je	0x1455406a4 <.text+0x553f6a4>
1455405f3:     	movq	0x10(%rdx), %r12
1455405f7:     	movq	0x18(%rdx), %r13
1455405fb:     	addq	$0x160, %r15            # imm = 0x160
145540602:     	xorps	%xmm0, %xmm0
145540605:     	movss	0x3c6e83(%rip), %xmm6   # 0x145907490
14554060d:     	movss	0x14b597b(%rip), %xmm7  # 0x1469f5f90
145540615:     	jmp	0x145540653 <.text+0x553f653>
145540617:     	movsd	-0x48(%r15), %xmm1
14554061d:     	movsd	(%r13), %xmm2
145540623:     	subps	%xmm2, %xmm1
145540626:     	mulps	%xmm1, %xmm1
145540629:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14554062d:     	addss	%xmm1, %xmm2
145540631:     	ucomiss	%xmm2, %xmm7
145540634:     	ja	0x1455406df <.text+0x553f6df>
14554063a:     	leaq	-0x160(%r15), %rax
145540641:     	addq	$0x160, %r15            # imm = 0x160
145540648:     	addq	$0x160, %rax            # imm = 0x160
14554064e:     	cmpq	%r14, %rax
145540651:     	je	0x1455406a4 <.text+0x553f6a4>
145540653:     	cmpb	$0x0, -0xf8(%r15)
14554065b:     	jne	0x14554063a <.text+0x553f63a>
14554065d:     	movss	-0x38(%r15), %xmm1
145540663:     	ucomiss	%xmm1, %xmm0
145540666:     	jae	0x145540617 <.text+0x553f617>
145540668:     	movss	(%r12), %xmm2
14554066e:     	subss	-0x3c(%r15), %xmm2
145540674:     	divss	%xmm1, %xmm2
145540678:     	xorps	%xmm1, %xmm1
14554067b:     	maxss	%xmm2, %xmm1
14554067f:     	movaps	%xmm6, %xmm2
145540682:     	minss	%xmm1, %xmm2
145540686:     	movsd	-0x54(%r15), %xmm3
14554068c:     	movsd	-0x48(%r15), %xmm4
145540692:     	subps	%xmm3, %xmm4
145540695:     	movsldup	%xmm2, %xmm1            # xmm1 = xmm2[0,0,2,2]
145540699:     	mulps	%xmm4, %xmm1
14554069c:     	addps	%xmm3, %xmm1
14554069f:     	jmp	0x14554061d <.text+0x553f61d>
1455406a4:     	movq	$0x0, (%rsi)
1455406ab:     	movq	$0x8, 0x8(%rsi)
1455406b3:     	movq	$0x0, 0x10(%rsi)
1455406bb:     	movq	%rsi, %rax
1455406be:     	movaps	-0x30(%rbp), %xmm6
1455406c2:     	movaps	-0x20(%rbp), %xmm7
1455406c6:     	movaps	-0x10(%rbp), %xmm8
1455406cb:     	addq	$0x88, %rsp
1455406d2:     	popq	%rbx
1455406d3:     	popq	%rdi
1455406d4:     	popq	%rsi
1455406d5:     	popq	%r12
1455406d7:     	popq	%r13
1455406d9:     	popq	%r14
1455406db:     	popq	%r15
1455406dd:     	popq	%rbp
1455406de:     	retq
1455406df:     	movq	%r15, (%rdx)
1455406e2:     	movq	-0xd8(%r15), %rdi
1455406e9:     	callq	0x140002200 <.text+0x1200>
1455406ee:     	movl	$0x20, %ecx
1455406f3:     	movl	$0x8, %edx
1455406f8:     	callq	0x1400021c0 <.text+0x11c0>
1455406fd:     	testq	%rax, %rax
145540700:     	je	0x145540827 <.text+0x553f827>
145540706:     	movq	%rdi, (%rax)
145540709:     	movq	$0x4, -0x50(%rbp)
145540711:     	movq	%rax, -0x48(%rbp)
145540715:     	movq	$0x1, -0x40(%rbp)
14554071d:     	cmpq	%r14, %r15
145540720:     	je	0x14554080b <.text+0x553f80b>
145540726:     	movl	$0x1, %edi
14554072b:     	xorps	%xmm8, %xmm8
14554072f:     	leaq	-0x50(%rbp), %rcx
145540733:     	addq	$0x160, %r15            # imm = 0x160
14554073a:     	jmp	0x14554076b <.text+0x553f76b>
14554073c:     	movsd	-0x48(%r15), %xmm0
145540742:     	movsd	(%r13), %xmm1
145540748:     	subps	%xmm1, %xmm0
14554074b:     	mulps	%xmm0, %xmm0
14554074e:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
145540752:     	addss	%xmm0, %xmm1
145540756:     	ucomiss	%xmm1, %xmm7
145540759:     	ja	0x1455407ba <.text+0x553f7ba>
14554075b:     	cmpq	%r14, %r15
14554075e:     	leaq	0x160(%r15), %r15
145540765:     	je	0x14554080b <.text+0x553f80b>
14554076b:     	cmpb	$0x0, -0xf8(%r15)
145540773:     	jne	0x14554075b <.text+0x553f75b>
145540775:     	movss	-0x38(%r15), %xmm0
14554077b:     	ucomiss	%xmm0, %xmm8
14554077f:     	jae	0x14554073c <.text+0x553f73c>
145540781:     	movss	(%r12), %xmm1
145540787:     	subss	-0x3c(%r15), %xmm1
14554078d:     	divss	%xmm0, %xmm1
145540791:     	xorps	%xmm0, %xmm0
145540794:     	maxss	%xmm1, %xmm0
145540798:     	movaps	%xmm6, %xmm1
14554079b:     	minss	%xmm0, %xmm1
14554079f:     	movsd	-0x54(%r15), %xmm2
1455407a5:     	movsd	-0x48(%r15), %xmm3
1455407ab:     	subps	%xmm2, %xmm3
1455407ae:     	movsldup	%xmm1, %xmm0            # xmm0 = xmm1[0,0,2,2]
1455407b2:     	mulps	%xmm3, %xmm0
1455407b5:     	addps	%xmm2, %xmm0
1455407b8:     	jmp	0x145540742 <.text+0x553f742>
1455407ba:     	movq	-0xd8(%r15), %rdx
1455407c1:     	movq	%rdx, -0x58(%rbp)
1455407c5:     	cmpq	-0x50(%rbp), %rdi
1455407c9:     	jne	0x1455407f3 <.text+0x553f7f3>
1455407cb:     	movq	$0x8, 0x20(%rsp)
1455407d4:     	movl	$0x1, %r8d
1455407da:     	movl	$0x8, %r9d
1455407e0:     	movq	%rcx, %rbx
1455407e3:     	movq	%rdi, %rdx
1455407e6:     	callq	0x1457744b0 <.text+0x57734b0>
1455407eb:     	nop
1455407ec:     	movq	-0x48(%rbp), %rax
1455407f0:     	movq	%rbx, %rcx
1455407f3:     	movq	-0x58(%rbp), %rdx
1455407f7:     	movq	%rdx, (%rax,%rdi,8)
1455407fb:     	incq	%rdi
1455407fe:     	movq	%rdi, -0x40(%rbp)
145540802:     	cmpq	%r14, %r15
145540805:     	jne	0x145540733 <.text+0x553f733>
14554080b:     	movq	-0x40(%rbp), %rax
14554080f:     	movq	%rax, 0x10(%rsi)
145540813:     	movq	-0x50(%rbp), %rax
145540817:     	movq	%rax, (%rsi)
14554081a:     	movq	-0x48(%rbp), %rax
14554081e:     	movq	%rax, 0x8(%rsi)
145540822:     	jmp	0x1455406bb <.text+0x553f6bb>
145540827:     	movl	$0x8, %ecx
14554082c:     	movl	$0x20, %edx
145540831:     	callq	0x14590379b <.text+0x590279b>
145540836:     	ud2
