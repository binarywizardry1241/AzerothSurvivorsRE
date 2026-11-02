
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14005a2f0:     	pushq	%r15
14005a2f2:     	pushq	%r14
14005a2f4:     	pushq	%r13
14005a2f6:     	pushq	%r12
14005a2f8:     	pushq	%rsi
14005a2f9:     	pushq	%rdi
14005a2fa:     	pushq	%rbp
14005a2fb:     	pushq	%rbx
14005a2fc:     	subq	$0xb8, %rsp
14005a303:     	movaps	%xmm10, 0xa0(%rsp)
14005a30c:     	movaps	%xmm9, 0x90(%rsp)
14005a315:     	movaps	%xmm8, 0x80(%rsp)
14005a31e:     	movaps	%xmm7, 0x70(%rsp)
14005a323:     	movaps	%xmm6, 0x60(%rsp)
14005a328:     	movq	(%rdx), %rax
14005a32b:     	movq	0x8(%rdx), %r9
14005a32f:     	movq	(%r8), %rsi
14005a332:     	movq	0x8(%r8), %rdi
14005a336:     	movl	0x14(%r8), %ecx
14005a33a:     	movl	%ecx, 0x44(%rsp)
14005a33e:     	leaq	0x50(%rsp), %rcx
14005a343:     	movq	%rax, %rdx
14005a346:     	movq	%r9, %r8
14005a349:     	callq	0x14003e4e0 <.text+0x3d4e0>
14005a34e:     	cmpb	$0x1, 0x50(%rsp)
14005a353:     	jne	0x14005a38e <.text+0x5938e>
14005a355:     	movaps	0x60(%rsp), %xmm6
14005a35a:     	movaps	0x70(%rsp), %xmm7
14005a35f:     	movaps	0x80(%rsp), %xmm8
14005a368:     	movaps	0x90(%rsp), %xmm9
14005a371:     	movaps	0xa0(%rsp), %xmm10
14005a37a:     	addq	$0xb8, %rsp
14005a381:     	popq	%rbx
14005a382:     	popq	%rbp
14005a383:     	popq	%rdi
14005a384:     	popq	%rsi
14005a385:     	popq	%r12
14005a387:     	popq	%r13
14005a389:     	popq	%r14
14005a38b:     	popq	%r15
14005a38d:     	retq
14005a38e:     	movq	0x58(%rsp), %rax
14005a393:     	movq	0xf8(%rsi), %rcx
14005a39a:     	movq	0x100(%rsi), %rdx
14005a3a1:     	leaq	(%rcx,%rdx,4), %rdx
14005a3a5:     	movzbl	0x108(%rsi), %r8d
14005a3ad:     	movb	%r8b, 0x2f(%rsp)
14005a3b2:     	xorl	%r9d, %r9d
14005a3b5:     	movl	$0x8, %r8d
14005a3bb:     	movq	%r8, 0x48(%rsp)
14005a3c0:     	movss	0x5d1686c(%rip), %xmm0  # 0x145d70c34
14005a3c8:     	movss	0x5d13384(%rip), %xmm1  # 0x145d6d754
14005a3d0:     	xorps	%xmm2, %xmm2
14005a3d3:     	xorl	%r15d, %r15d
14005a3d6:     	movq	$0x0, 0x30(%rsp)
14005a3df:     	xorl	%ebp, %ebp
14005a3e1:     	jmp	0x14005a419 <.text+0x59419>
14005a3e3:     	nopw	%cs:(%rax,%rax)
14005a3f0:     	movl	$0x1, 0x68(%r12)
14005a3f9:     	movss	%xmm4, 0x6c(%r12)
14005a400:     	movl	0x44(%rsp), %r8d
14005a405:     	movl	%r8d, (%r13)
14005a409:     	movl	$0x1, 0x78(%r12)
14005a412:     	movss	%xmm3, 0x7c(%r12)
14005a419:     	cmpb	$0x0, 0x2f(%rsp)
14005a41e:     	je	0x14005a4a0 <.text+0x594a0>
14005a424:     	cmpl	%r9d, %ebp
14005a427:     	jne	0x14005a55d <.text+0x5955d>
14005a42d:     	nopl	(%rax)
14005a430:     	cmpq	%rdx, %rcx
14005a433:     	je	0x14005a355 <.text+0x59355>
14005a439:     	movl	(%rcx), %r9d
14005a43c:     	addq	$0x4, %rcx
14005a440:     	movq	0x1a8(%rdi), %r10
14005a447:     	leaq	(%r9,%r9,8), %r11
14005a44b:     	movq	0x10(%r10,%r11,8), %r9
14005a450:     	testq	%r9, %r9
14005a453:     	je	0x14005a430 <.text+0x59430>
14005a455:     	leaq	(%r10,%r11,8), %r11
14005a459:     	movq	0x110(%rsi), %r14
14005a460:     	movq	0x38(%r11), %r10
14005a464:     	cmpq	0x40(%r11), %r14
14005a468:     	jae	0x14005a529 <.text+0x59529>
14005a46e:     	movq	(%r10,%r14,8), %r15
14005a472:     	movq	0x18(%r11), %r14
14005a476:     	testq	%r15, %r15
14005a479:     	je	0x14005a52d <.text+0x5952d>
14005a47f:     	notq	%r15
14005a482:     	leaq	(%r15,%r15,2), %r11
14005a486:     	shlq	$0x4, %r11
14005a48a:     	movq	0x10(%r14,%r11), %r8
14005a48f:     	movq	%r8, 0x30(%rsp)
14005a494:     	jmp	0x14005a536 <.text+0x59536>
14005a499:     	nopl	(%rax)
14005a4a0:     	cmpl	%r9d, %ebp
14005a4a3:     	jne	0x14005a59f <.text+0x5959f>
14005a4a9:     	nopl	(%rax)
14005a4b0:     	cmpq	%rdx, %rcx
14005a4b3:     	je	0x14005a355 <.text+0x59355>
14005a4b9:     	movl	(%rcx), %r9d
14005a4bc:     	addq	$0x4, %rcx
14005a4c0:     	movq	0x108(%rdi), %r10
14005a4c7:     	leaq	(%r9,%r9,4), %r11
14005a4cb:     	shlq	$0x5, %r11
14005a4cf:     	movq	0x58(%r10,%r11), %r9
14005a4d4:     	testq	%r9, %r9
14005a4d7:     	je	0x14005a4b0 <.text+0x594b0>
14005a4d9:     	addq	%r11, %r10
14005a4dc:     	movl	0x94(%r10), %r11d
14005a4e3:     	movq	0x1a8(%rdi), %r12
14005a4ea:     	leaq	(%r11,%r11,8), %r13
14005a4ee:     	leaq	(%r12,%r13,8), %r11
14005a4f2:     	movq	0x110(%rsi), %r15
14005a4f9:     	movq	0x38(%r12,%r13,8), %r14
14005a4fe:     	cmpq	0x40(%r12,%r13,8), %r15
14005a503:     	jae	0x14005a562 <.text+0x59562>
14005a505:     	movq	(%r14,%r15,8), %r15
14005a509:     	movq	0x18(%r11), %r12
14005a50d:     	testq	%r15, %r15
14005a510:     	je	0x14005a566 <.text+0x59566>
14005a512:     	notq	%r15
14005a515:     	leaq	(%r15,%r15,2), %r11
14005a519:     	shlq	$0x4, %r11
14005a51d:     	movq	0x10(%r12,%r11), %r8
14005a522:     	movq	%r8, 0x30(%rsp)
14005a527:     	jmp	0x14005a56f <.text+0x5956f>
14005a529:     	movq	0x18(%r11), %r14
14005a52d:     	movq	$0x0, 0x30(%rsp)
14005a536:     	movq	0x118(%rsi), %r15
14005a53d:     	movq	(%r10,%r15,8), %r10
14005a541:     	notq	%r10
14005a544:     	leaq	(%r10,%r10,2), %r10
14005a548:     	shlq	$0x4, %r10
14005a54c:     	movq	0x10(%r14,%r10), %r15
14005a551:     	movq	0x28(%r14,%r10), %r8
14005a556:     	movq	%r8, 0x38(%rsp)
14005a55b:     	xorl	%ebp, %ebp
14005a55d:     	movl	%ebp, %r13d
14005a560:     	jmp	0x14005a5b3 <.text+0x595b3>
14005a562:     	movq	0x18(%r11), %r12
14005a566:     	movq	$0x0, 0x30(%rsp)
14005a56f:     	movq	0x118(%rsi), %r15
14005a576:     	movq	(%r14,%r15,8), %r14
14005a57a:     	notq	%r14
14005a57d:     	leaq	(%r14,%r14,2), %r14
14005a581:     	shlq	$0x4, %r14
14005a585:     	movq	0x10(%r12,%r14), %r15
14005a58a:     	movq	0x28(%r12,%r14), %r8
14005a58f:     	movq	%r8, 0x38(%rsp)
14005a594:     	movq	0x50(%r10), %r8
14005a598:     	movq	%r8, 0x48(%rsp)
14005a59d:     	xorl	%ebp, %ebp
14005a59f:     	movl	%ebp, %r10d
14005a5a2:     	shlq	$0x4, %r10
14005a5a6:     	movq	0x48(%rsp), %r8
14005a5ab:     	movl	0x8(%r8,%r10), %r13d
14005a5b0:     	notl	%r13d
14005a5b3:     	leaq	(,%r13,2), %r12
14005a5bb:     	addq	%r13, %r12
14005a5be:     	movq	0x30(%rsp), %r8
14005a5c3:     	leaq	(%r8,%r12,4), %r10
14005a5c7:     	shlq	$0x7, %r12
14005a5cb:     	addq	%r15, %r12
14005a5ce:     	movq	0x38(%rsp), %r8
14005a5d3:     	leaq	(%r8,%r13,4), %r13
14005a5d7:     	incl	%ebp
14005a5d9:     	movl	0xc0(%rax), %ebx
14005a5df:     	movl	0xc4(%rax), %r8d
14005a5e6:     	leaq	0xc8(%rax), %r14
14005a5ed:     	leaq	0xbc(%rax), %r11
14005a5f4:     	cmpb	$0x0, 0xb8(%rax)
14005a5fb:     	cmovneq	%r11, %r14
14005a5ff:     	movss	(%r14), %xmm7
14005a604:     	xorps	%xmm3, %xmm3
14005a607:     	cvtsi2ss	%r8, %xmm3
14005a60c:     	xorps	%xmm4, %xmm4
14005a60f:     	cvtsi2ss	%rbx, %xmm4
14005a614:     	divss	%xmm7, %xmm4
14005a618:     	movss	(%r10), %xmm6
14005a61d:     	movss	0x4(%r10), %xmm5
14005a623:     	movaps	%xmm4, %xmm8
14005a627:     	divss	%xmm6, %xmm8
14005a62c:     	divss	%xmm7, %xmm3
14005a630:     	movaps	%xmm3, %xmm7
14005a633:     	divss	%xmm5, %xmm7
14005a637:     	movaps	%xmm8, %xmm9
14005a63b:     	minss	%xmm7, %xmm9
14005a640:     	movaps	%xmm9, %xmm7
14005a644:     	cmpunordss	%xmm9, %xmm7
14005a64a:     	movaps	%xmm7, %xmm10
14005a64e:     	andnps	%xmm9, %xmm10
14005a652:     	andps	%xmm8, %xmm7
14005a656:     	orps	%xmm10, %xmm7
14005a65a:     	movss	0x8(%r10), %xmm8
14005a660:     	movaps	%xmm7, %xmm9
14005a664:     	minss	%xmm8, %xmm9
14005a669:     	movaps	%xmm9, %xmm8
14005a66d:     	cmpunordss	%xmm9, %xmm8
14005a673:     	andps	%xmm8, %xmm7
14005a677:     	andnps	%xmm9, %xmm8
14005a67b:     	orps	%xmm7, %xmm8
14005a67f:     	maxss	%xmm0, %xmm8
14005a684:     	divss	%xmm8, %xmm4
14005a689:     	subss	%xmm6, %xmm4
14005a68d:     	mulss	%xmm1, %xmm4
14005a691:     	divss	%xmm8, %xmm3
14005a696:     	subss	%xmm5, %xmm3
14005a69a:     	mulss	%xmm1, %xmm3
14005a69e:     	movl	0x68(%r12), %r10d
14005a6a3:     	testl	%r10d, %r10d
14005a6a6:     	je	0x14005a3f0 <.text+0x593f0>
14005a6ac:     	cmpl	$0x1, %r10d
14005a6b0:     	jne	0x14005a6d0 <.text+0x596d0>
14005a6b2:     	movss	0x6c(%r12), %xmm5
14005a6b9:     	ucomiss	%xmm4, %xmm5
14005a6bc:     	jne	0x14005a3f0 <.text+0x593f0>
14005a6c2:     	jnp	0x14005a6f5 <.text+0x596f5>
14005a6c4:     	jmp	0x14005a3f0 <.text+0x593f0>
14005a6c9:     	nopl	(%rax)
14005a6d0:     	movss	0x6c(%r12), %xmm5
14005a6d7:     	ucomiss	%xmm2, %xmm5
14005a6da:     	jne	0x14005a3f0 <.text+0x593f0>
14005a6e0:     	jp	0x14005a3f0 <.text+0x593f0>
14005a6e6:     	ucomiss	%xmm2, %xmm4
14005a6e9:     	jne	0x14005a3f0 <.text+0x593f0>
14005a6ef:     	jp	0x14005a3f0 <.text+0x593f0>
14005a6f5:     	movl	0x78(%r12), %r10d
14005a6fa:     	testl	%r10d, %r10d
14005a6fd:     	je	0x14005a3f0 <.text+0x593f0>
14005a703:     	cmpl	$0x1, %r10d
14005a707:     	jne	0x14005a724 <.text+0x59724>
14005a709:     	movss	0x7c(%r12), %xmm5
14005a710:     	ucomiss	%xmm3, %xmm5
14005a713:     	jne	0x14005a3f0 <.text+0x593f0>
14005a719:     	jnp	0x14005a419 <.text+0x59419>
14005a71f:     	jmp	0x14005a3f0 <.text+0x593f0>
14005a724:     	movss	0x7c(%r12), %xmm5
14005a72b:     	ucomiss	%xmm2, %xmm5
14005a72e:     	jne	0x14005a3f0 <.text+0x593f0>
14005a734:     	jp	0x14005a3f0 <.text+0x593f0>
14005a73a:     	ucomiss	%xmm2, %xmm3
14005a73d:     	jne	0x14005a3f0 <.text+0x593f0>
14005a743:     	jnp	0x14005a419 <.text+0x59419>
14005a749:     	jmp	0x14005a3f0 <.text+0x593f0>
