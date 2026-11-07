
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14541b390:     	pushq	%rbp
14541b391:     	pushq	%r15
14541b393:     	pushq	%r14
14541b395:     	pushq	%r13
14541b397:     	pushq	%r12
14541b399:     	pushq	%rsi
14541b39a:     	pushq	%rdi
14541b39b:     	pushq	%rbx
14541b39c:     	subq	$0x148, %rsp            # imm = 0x148
14541b3a3:     	leaq	0x80(%rsp), %rbp
14541b3ab:     	movaps	%xmm13, 0xb0(%rbp)
14541b3b3:     	movaps	%xmm12, 0xa0(%rbp)
14541b3bb:     	movaps	%xmm11, 0x90(%rbp)
14541b3c3:     	movaps	%xmm10, 0x80(%rbp)
14541b3cb:     	movaps	%xmm9, 0x70(%rbp)
14541b3d0:     	movaps	%xmm8, 0x60(%rbp)
14541b3d5:     	movaps	%xmm7, 0x50(%rbp)
14541b3d9:     	movaps	%xmm6, 0x40(%rbp)
14541b3dd:     	movq	$-0x2, 0x38(%rbp)
14541b3e5:     	movq	%rcx, %rsi
14541b3e8:     	movq	(%rdx), %r12
14541b3eb:     	cmpq	$0xa, 0x8(%r12)
14541b3f1:     	jne	0x14541b413 <.text+0x541a413>
14541b3f3:     	movq	(%r12), %rax
14541b3f7:     	movabsq	$0x6974706d65646572, %rcx # imm = 0x6974706D65646572
14541b401:     	xorq	(%rax), %rcx
14541b404:     	movzwl	0x8(%rax), %eax
14541b408:     	xorq	$0x6e6f, %rax           # imm = 0x6E6F
14541b40e:     	orq	%rcx, %rax
14541b411:     	je	0x14541b463 <.text+0x541a463>
14541b413:     	movq	$-0x1, (%rsi)
14541b41a:     	movq	%rsi, %rax
14541b41d:     	movaps	0x40(%rbp), %xmm6
14541b421:     	movaps	0x50(%rbp), %xmm7
14541b425:     	movaps	0x60(%rbp), %xmm8
14541b42a:     	movaps	0x70(%rbp), %xmm9
14541b42f:     	movaps	0x80(%rbp), %xmm10
14541b437:     	movaps	0x90(%rbp), %xmm11
14541b43f:     	movaps	0xa0(%rbp), %xmm12
14541b447:     	movaps	0xb0(%rbp), %xmm13
14541b44f:     	addq	$0x148, %rsp            # imm = 0x148
14541b456:     	popq	%rbx
14541b457:     	popq	%rdi
14541b458:     	popq	%rsi
14541b459:     	popq	%r12
14541b45b:     	popq	%r13
14541b45d:     	popq	%r14
14541b45f:     	popq	%r15
14541b461:     	popq	%rbp
14541b462:     	retq
14541b463:     	movss	0x14(%rdx), %xmm11
14541b469:     	movss	0x3c(%rdx), %xmm8
14541b46f:     	movss	0x50(%rdx), %xmm7
14541b474:     	movaps	%xmm11, %xmm9
14541b478:     	subss	%xmm3, %xmm9
14541b47d:     	leaq	0x1305005(%rip), %rdi   # 0x146720489
14541b484:     	movl	$0x22, %r13d
14541b48a:     	movl	$0x22, %edx
14541b48f:     	movq	%rdi, %rcx
14541b492:     	movq	%r8, %r15
14541b495:     	callq	0x145452400 <.text+0x5451400>
14541b49a:     	movq	%rax, %r14
14541b49d:     	movq	%rdx, %rbx
14541b4a0:     	movss	0x48(%r12), %xmm0
14541b4a7:     	movss	0x4db171(%rip), %xmm6   # 0x1458f6620
14541b4af:     	movaps	%xmm0, %xmm1
14541b4b2:     	mulss	%xmm6, %xmm1
14541b4b6:     	movss	0x4dd881(%rip), %xmm10  # 0x1458f8d40
14541b4bf:     	mulss	%xmm10, %xmm1
14541b4c4:     	mulss	%xmm10, %xmm0
14541b4c9:     	mulss	%xmm11, %xmm0
14541b4ce:     	mulss	%xmm8, %xmm0
14541b4d3:     	movss	0x8(%r15), %xmm11
14541b4d9:     	mulss	%xmm11, %xmm0
14541b4de:     	movss	0x4d1b29(%rip), %xmm12  # 0x1458ed010
14541b4e7:     	maxss	%xmm12, %xmm0
14541b4ec:     	divss	%xmm0, %xmm1
14541b4f0:     	movss	0x4d0013(%rip), %xmm13  # 0x1458eb50c
14541b4f9:     	minss	%xmm13, %xmm1
14541b4fe:     	mulss	%xmm7, %xmm1
14541b502:     	leaq	0x20(%rbp), %r15
14541b506:     	movq	%r15, %rcx
14541b509:     	callq	0x1454116e0 <.text+0x54106e0>
14541b50e:     	movss	0x48(%r12), %xmm0
14541b515:     	mulss	%xmm0, %xmm6
14541b519:     	mulss	%xmm10, %xmm6
14541b51e:     	mulss	%xmm10, %xmm0
14541b523:     	mulss	%xmm9, %xmm0
14541b528:     	mulss	%xmm8, %xmm0
14541b52d:     	mulss	%xmm11, %xmm0
14541b532:     	maxss	%xmm12, %xmm0
14541b537:     	divss	%xmm0, %xmm6
14541b53b:     	minss	%xmm13, %xmm6
14541b540:     	mulss	%xmm7, %xmm6
14541b544:     	leaq	0x8(%rbp), %r12
14541b548:     	movq	%r12, %rcx
14541b54b:     	movaps	%xmm6, %xmm1
14541b54e:     	callq	0x1454116e0 <.text+0x54106e0>
14541b553:     	nop
14541b554:     	testq	%r14, %r14
14541b557:     	cmoveq	%r13, %rbx
14541b55b:     	cmovneq	%r14, %rdi
14541b55f:     	leaq	0x1304f45(%rip), %rax   # 0x1467204ab
14541b566:     	movq	%rax, -0x38(%rbp)
14541b56a:     	movq	$0x6, -0x30(%rbp)
14541b572:     	movq	%r15, -0x28(%rbp)
14541b576:     	leaq	0x13022b3(%rip), %rax   # 0x14671d830
14541b57d:     	movq	%rax, -0x20(%rbp)
14541b581:     	leaq	0x1304f29(%rip), %rcx   # 0x1467204b1
14541b588:     	movq	%rcx, -0x18(%rbp)
14541b58c:     	movq	$0x5, -0x10(%rbp)
14541b594:     	movq	%r12, -0x8(%rbp)
14541b598:     	movq	%rax, (%rbp)
14541b59c:     	movq	$0x2, 0x20(%rsp)
14541b5a5:     	leaq	-0x50(%rbp), %rcx
14541b5a9:     	leaq	-0x38(%rbp), %r9
14541b5ad:     	movq	%rdi, %rdx
14541b5b0:     	movq	%rbx, %r8
14541b5b3:     	callq	0x145452790 <.text+0x5451790>
14541b5b8:     	nop
14541b5b9:     	movq	-0x40(%rbp), %rax
14541b5bd:     	movq	%rax, 0x10(%rsi)
14541b5c1:     	movups	-0x50(%rbp), %xmm0
14541b5c5:     	movups	%xmm0, (%rsi)
14541b5c8:     	movq	0x8(%rbp), %rdx
14541b5cc:     	testq	%rdx, %rdx
14541b5cf:     	je	0x14541b5e0 <.text+0x541a5e0>
14541b5d1:     	movq	0x10(%rbp), %rcx
14541b5d5:     	movl	$0x1, %r8d
14541b5db:     	callq	0x1400021d0 <.text+0x11d0>
14541b5e0:     	movq	0x20(%rbp), %rdx
14541b5e4:     	testq	%rdx, %rdx
14541b5e7:     	je	0x14541b41a <.text+0x541a41a>
14541b5ed:     	movq	0x28(%rbp), %rcx
14541b5f1:     	movl	$0x1, %r8d
14541b5f7:     	callq	0x1400021d0 <.text+0x11d0>
14541b5fc:     	jmp	0x14541b41a <.text+0x541a41a>
