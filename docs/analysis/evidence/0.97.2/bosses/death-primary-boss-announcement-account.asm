
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c450f:     	movb	$0x0, 0x177(%rbp)
1454c4516:     	callq	0x14540e4a0 <.text+0x540d4a0>
1454c451b:     	nop
1454c451c:     	movq	%rax, %r14
1454c451f:     	movq	%rdx, %r15
1454c4522:     	movb	$0x0, 0x177(%rbp)
1454c4529:     	leaq	0x14e7347(%rip), %r13   # 0x1469ab877
1454c4530:     	movl	$0xd, %r12d
1454c4536:     	movl	$0xd, %edx
1454c453b:     	movq	%r13, %rcx
1454c453e:     	callq	0x145452400 <.text+0x5451400>
1454c4543:     	nop
1454c4544:     	testq	%rax, %rax
1454c4547:     	cmovneq	%rax, %r13
1454c454b:     	cmoveq	%r12, %rdx
1454c454f:     	movb	$0x0, 0x177(%rbp)
1454c4556:     	movq	%rdx, 0x28(%rsp)
1454c455b:     	movq	%r13, 0x20(%rsp)
1454c4560:     	leaq	0xf0(%rbp), %rcx
1454c4567:     	movq	%rdi, %rdx
1454c456a:     	movq	%r14, %r8
1454c456d:     	movq	%r15, %r9
1454c4570:     	callq	0x145441160 <.text+0x5440160>
1454c4575:     	nop
1454c4576:     	movq	0x548(%rsi), %r14
1454c457d:     	cmpq	0x538(%rsi), %r14
1454c4584:     	jne	0x1454c4593 <.text+0x54c3593>
1454c4586:     	leaq	0x538(%rsi), %rcx
1454c458d:     	callq	0x1457580b0 <.text+0x57570b0>
1454c4592:     	nop
1454c4593:     	movq	0x540(%rsi), %rax
1454c459a:     	movq	%r14, %rcx
1454c459d:     	shlq	$0x5, %rcx
1454c45a1:     	movups	0xf0(%rbp), %xmm0
1454c45a8:     	movups	0x100(%rbp), %xmm1
1454c45af:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c45b4:     	movups	%xmm0, (%rax,%rcx)
1454c45b8:     	incq	%r14
1454c45bb:     	movq	%r14, 0x548(%rsi)
1454c45c2:     	movb	$0x0, 0x177(%rbp)
1454c45c9:     	leaq	0xf0(%rbp), %rcx
1454c45d0:     	callq	0x145450bf0 <.text+0x544fbf0>
1454c45d5:     	nop
1454c45d6:     	movb	$0x0, 0x177(%rbp)
1454c45dd:     	leaq	0x14e72a0(%rip), %rax   # 0x1469ab884
1454c45e4:     	movq	%rax, 0x20(%rsp)
1454c45e9:     	movq	$0x8, 0x28(%rsp)
1454c45f2:     	leaq	0x14e6a58(%rip), %r8    # 0x1469ab051
1454c45f9:     	leaq	0xb8(%rbp), %rcx
1454c4600:     	leaq	0xf0(%rbp), %rdx
1454c4607:     	movl	$0x4, %r9d
1454c460d:     	callq	0x145451620 <.text+0x5450620>
1454c4612:     	nop
1454c4613:     	movb	$0x1, 0x173(%rbp)
1454c461a:     	movq	0x150(%rbp), %rcx
1454c4621:     	callq	0x14540e4a0 <.text+0x540d4a0>
1454c4626:     	nop
1454c4627:     	movb	$0x0, 0x173(%rbp)
1454c462e:     	movq	%rdx, 0x28(%rsp)
1454c4633:     	movq	%rax, 0x20(%rsp)
1454c4638:     	leaq	0x14e69e7(%rip), %r8    # 0x1469ab026
1454c463f:     	leaq	0xf0(%rbp), %rcx
1454c4646:     	leaq	0xb8(%rbp), %rdx
1454c464d:     	movl	$0x4, %r9d
1454c4653:     	callq	0x145451620 <.text+0x5450620>
1454c4658:     	nop
1454c4659:     	movb	$0x0, 0x177(%rbp)
1454c4660:     	leaq	0xb8(%rbp), %rcx
1454c4667:     	leaq	0xf0(%rbp), %rdx
1454c466e:     	callq	0x1454512c0 <.text+0x54502c0>
1454c4673:     	nop
1454c4674:     	movq	0x560(%rsi), %r14
1454c467b:     	cmpq	0x550(%rsi), %r14
1454c4682:     	jne	0x1454c46ad <.text+0x54c36ad>
1454c4684:     	leaq	0x550(%rsi), %rcx
1454c468b:     	movq	0xb8(%rbp), %rax
1454c4692:     	movq	%rax, 0x168(%rbp)
1454c4699:     	movq	0xc0(%rbp), %rax
1454c46a0:     	movq	%rax, 0xe8(%rbp)
1454c46a7:     	callq	0x145757f60 <.text+0x5756f60>
1454c46ac:     	nop
1454c46ad:     	movq	0x558(%rsi), %rax
1454c46b4:     	leaq	(%r14,%r14,2), %rcx
1454c46b8:     	movq	0xc8(%rbp), %rdx
1454c46bf:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454c46c4:     	movups	0xb8(%rbp), %xmm0
1454c46cb:     	movups	%xmm0, (%rax,%rcx,8)
1454c46cf:     	incq	%r14
1454c46d2:     	movq	%r14, 0x560(%rsi)
