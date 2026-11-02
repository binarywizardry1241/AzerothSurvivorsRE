
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454dc230:     	pushq	%rbp
1454dc231:     	pushq	%r15
1454dc233:     	pushq	%r14
1454dc235:     	pushq	%r13
1454dc237:     	pushq	%r12
1454dc239:     	pushq	%rsi
1454dc23a:     	pushq	%rdi
1454dc23b:     	pushq	%rbx
1454dc23c:     	subq	$0x108, %rsp            # imm = 0x108
1454dc243:     	leaq	0x80(%rsp), %rbp
1454dc24b:     	movaps	%xmm6, 0x70(%rbp)
1454dc24f:     	movq	$-0x2, 0x68(%rbp)
1454dc257:     	movq	%rcx, %rsi
1454dc25a:     	movq	(%rdx), %r13
1454dc25d:     	movq	0x8(%rdx), %r12
1454dc261:     	cmpq	%r12, %r13
1454dc264:     	je	0x1454dc5ac <.text+0x54db5ac>
1454dc26a:     	addq	$0x48, %r13
1454dc26e:     	nop
1454dc270:     	cmpl	$0x2, -0x28(%r13)
1454dc275:     	je	0x1454dc28d <.text+0x54db28d>
1454dc277:     	leaq	-0x48(%r13), %rax
1454dc27b:     	addq	$0x48, %r13
1454dc27f:     	addq	$0x48, %rax
1454dc283:     	cmpq	%r12, %rax
1454dc286:     	jne	0x1454dc270 <.text+0x54db270>
1454dc288:     	jmp	0x1454dc5ac <.text+0x54db5ac>
1454dc28d:     	movq	%r13, (%rdx)
1454dc290:     	movq	0x10(%rdx), %rbx
1454dc294:     	movl	-0x20(%r13), %eax
1454dc298:     	movl	%eax, 0x64(%rbp)
1454dc29b:     	movl	-0xc(%r13), %eax
1454dc29f:     	movl	%eax, 0x50(%rbp)
1454dc2a2:     	movq	-0x14(%r13), %rax
1454dc2a6:     	movq	%rax, 0x48(%rbp)
1454dc2aa:     	leaq	0x4c(%rbp), %rcx
1454dc2ae:     	cmpl	$0x1, (%rbx)
1454dc2b1:     	jne	0x1454dc2d5 <.text+0x54db2d5>
1454dc2b3:     	movups	0x4(%rbx), %xmm1
1454dc2b7:     	movaps	%xmm1, %xmm0
1454dc2ba:     	shufps	$0xe2, %xmm1, %xmm0     # xmm0 = xmm0[2,0],xmm1[2,3]
1454dc2be:     	shufps	$0xe7, %xmm1, %xmm1     # xmm1 = xmm1[3,1,2,3]
1454dc2c2:     	movaps	%xmm0, %xmm2
1454dc2c5:     	subps	%xmm1, %xmm2
1454dc2c8:     	movsd	0x48(%rbp), %xmm1
1454dc2cd:     	subps	%xmm1, %xmm0
1454dc2d0:     	divps	%xmm2, %xmm0
1454dc2d3:     	jmp	0x1454dc2dc <.text+0x54db2dc>
1454dc2d5:     	movaps	0x3e0de4(%rip), %xmm0   # 0x1458bd0c0
1454dc2dc:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454dc2e0:     	movss	%xmm1, 0x60(%rbp)
1454dc2e5:     	movss	%xmm0, 0x20(%rbp)
1454dc2ea:     	leaq	0x50(%rbp), %rdx
1454dc2ee:     	leaq	0x48(%rbp), %rax
1454dc2f2:     	movq	%rax, -0x50(%rbp)
1454dc2f6:     	leaq	0x1fec03(%rip), %r8     # 0x1456daf00 <.text+0x56d9f00>
1454dc2fd:     	movq	%r8, -0x48(%rbp)
1454dc301:     	movq	%rcx, -0x40(%rbp)
1454dc305:     	movq	%r8, -0x38(%rbp)
1454dc309:     	movq	%rdx, -0x30(%rbp)
1454dc30d:     	movq	%r8, -0x28(%rbp)
1454dc311:     	leaq	0x60(%rbp), %rax
1454dc315:     	movq	%rax, -0x20(%rbp)
1454dc319:     	movq	%r8, -0x18(%rbp)
1454dc31d:     	leaq	0x20(%rbp), %rax
1454dc321:     	movq	%rax, -0x10(%rbp)
1454dc325:     	movq	%r8, -0x8(%rbp)
1454dc329:     	leaq	0x13d629b(%rip), %rdx   # 0x1468b25cb
1454dc330:     	movq	%rbp, %r14
1454dc333:     	leaq	-0x50(%rbp), %r8
1454dc337:     	movq	%r14, %rcx
1454dc33a:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1454dc33f:     	leaq	0x64(%rbp), %rax
1454dc343:     	movq	%rax, -0x50(%rbp)
1454dc347:     	leaq	0x1ff912(%rip), %rax    # 0x1456dbc60 <.text+0x56dac60>
1454dc34e:     	movq	%rax, -0x48(%rbp)
1454dc352:     	movq	%r14, -0x40(%rbp)
1454dc356:     	leaq	-0x54da27d(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454dc35d:     	movq	%rax, -0x38(%rbp)
1454dc361:     	leaq	0x15d6000(%rip), %rdx   # 0x146ab2368
1454dc368:     	leaq	0x48(%rbp), %rcx
1454dc36c:     	leaq	-0x50(%rbp), %r8
1454dc370:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1454dc375:     	nop
1454dc376:     	movq	(%rbp), %rdx
1454dc37a:     	testq	%rdx, %rdx
1454dc37d:     	je	0x1454dc38e <.text+0x54db38e>
1454dc37f:     	movq	0x8(%rbp), %rcx
1454dc383:     	movl	$0x1, %r8d
1454dc389:     	callq	0x1400021d0 <.text+0x11d0>
1454dc38e:     	movq	0x48(%rbp), %rdi
1454dc392:     	cmpq	$-0x1, %rdi
1454dc396:     	je	0x1454dc5ac <.text+0x54db5ac>
1454dc39c:     	movq	%rbx, 0x38(%rbp)
1454dc3a0:     	movq	0x50(%rbp), %r14
1454dc3a4:     	movq	0x58(%rbp), %rbx
1454dc3a8:     	callq	0x140002200 <.text+0x1200>
1454dc3ad:     	movl	$0x60, %ecx
1454dc3b2:     	movl	$0x8, %edx
1454dc3b7:     	callq	0x1400021c0 <.text+0x11c0>
1454dc3bc:     	testq	%rax, %rax
1454dc3bf:     	je	0x1454dc5de <.text+0x54db5de>
1454dc3c5:     	movq	%rax, %r15
1454dc3c8:     	movq	%rdi, (%rax)
1454dc3cb:     	movq	%r14, 0x8(%rax)
1454dc3cf:     	movq	%rbx, 0x10(%rax)
1454dc3d3:     	movq	$0x4, 0x20(%rbp)
1454dc3db:     	movq	%rax, 0x28(%rbp)
1454dc3df:     	movq	$0x1, 0x30(%rbp)
1454dc3e7:     	cmpq	%r12, %r13
1454dc3ea:     	je	0x1454dc593 <.text+0x54db593>
1454dc3f0:     	movl	$0x1, %r14d
1454dc3f6:     	movaps	0x3e0cc3(%rip), %xmm6   # 0x1458bd0c0
1454dc3fd:     	leaq	-0x50(%rbp), %rdi
1454dc401:     	addq	$0x48, %r13
1454dc405:     	nopw	%cs:(%rax,%rax)
1454dc410:     	cmpl	$0x2, -0x28(%r13)
1454dc415:     	je	0x1454dc425 <.text+0x54db425>
1454dc417:     	cmpq	%r12, %r13
1454dc41a:     	leaq	0x48(%r13), %r13
1454dc41e:     	jne	0x1454dc410 <.text+0x54db410>
1454dc420:     	jmp	0x1454dc593 <.text+0x54db593>
1454dc425:     	movq	%rdi, %r8
1454dc428:     	movl	-0x20(%r13), %eax
1454dc42c:     	movl	%eax, 0x1c(%rbp)
1454dc42f:     	movl	-0xc(%r13), %eax
1454dc433:     	movl	%eax, 0x50(%rbp)
1454dc436:     	movq	-0x14(%r13), %rax
1454dc43a:     	movq	%rax, 0x48(%rbp)
1454dc43e:     	movq	0x38(%rbp), %rax
1454dc442:     	cmpl	$0x1, (%rax)
1454dc445:     	movaps	%xmm6, %xmm0
1454dc448:     	jne	0x1454dc46e <.text+0x54db46e>
1454dc44a:     	movq	0x38(%rbp), %rax
1454dc44e:     	movups	0x4(%rax), %xmm1
1454dc452:     	movaps	%xmm1, %xmm0
1454dc455:     	shufps	$0xe2, %xmm1, %xmm0     # xmm0 = xmm0[2,0],xmm1[2,3]
1454dc459:     	shufps	$0xe7, %xmm1, %xmm1     # xmm1 = xmm1[3,1,2,3]
1454dc45d:     	movaps	%xmm0, %xmm2
1454dc460:     	subps	%xmm1, %xmm2
1454dc463:     	movsd	0x48(%rbp), %xmm1
1454dc468:     	subps	%xmm1, %xmm0
1454dc46b:     	divps	%xmm2, %xmm0
1454dc46e:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454dc472:     	movss	%xmm1, 0x64(%rbp)
1454dc477:     	movss	%xmm0, 0x60(%rbp)
1454dc47c:     	leaq	0x48(%rbp), %rdi
1454dc480:     	movq	%rdi, -0x50(%rbp)
1454dc484:     	leaq	0x1fea75(%rip), %rcx    # 0x1456daf00 <.text+0x56d9f00>
1454dc48b:     	movq	%rcx, -0x48(%rbp)
1454dc48f:     	leaq	0x4c(%rbp), %rax
1454dc493:     	movq	%rax, -0x40(%rbp)
1454dc497:     	movq	%rcx, -0x38(%rbp)
1454dc49b:     	leaq	0x50(%rbp), %rax
1454dc49f:     	movq	%rax, -0x30(%rbp)
1454dc4a3:     	movq	%rcx, -0x28(%rbp)
1454dc4a7:     	leaq	0x64(%rbp), %rax
1454dc4ab:     	movq	%rax, -0x20(%rbp)
1454dc4af:     	movq	%rcx, -0x18(%rbp)
1454dc4b3:     	leaq	0x60(%rbp), %rax
1454dc4b7:     	movq	%rax, -0x10(%rbp)
1454dc4bb:     	movq	%rcx, -0x8(%rbp)
1454dc4bf:     	movq	%rbp, %rbx
1454dc4c2:     	movq	%rbx, %rcx
1454dc4c5:     	leaq	0x13d60ff(%rip), %rdx   # 0x1468b25cb
1454dc4cc:     	movq	%r8, %rdi
1454dc4cf:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1454dc4d4:     	nop
1454dc4d5:     	leaq	0x1c(%rbp), %rax
1454dc4d9:     	movq	%rax, -0x50(%rbp)
1454dc4dd:     	leaq	0x1ff77c(%rip), %rax    # 0x1456dbc60 <.text+0x56dac60>
1454dc4e4:     	movq	%rax, -0x48(%rbp)
1454dc4e8:     	movq	%rbx, -0x40(%rbp)
1454dc4ec:     	leaq	-0x54da413(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454dc4f3:     	movq	%rax, -0x38(%rbp)
1454dc4f7:     	leaq	0x48(%rbp), %rcx
1454dc4fb:     	leaq	0x15d5e66(%rip), %rdx   # 0x146ab2368
1454dc502:     	movq	%rdi, %r8
1454dc505:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1454dc50a:     	nop
1454dc50b:     	movq	(%rbp), %rdx
1454dc50f:     	testq	%rdx, %rdx
1454dc512:     	je	0x1454dc523 <.text+0x54db523>
1454dc514:     	movq	0x8(%rbp), %rcx
1454dc518:     	movl	$0x1, %r8d
1454dc51e:     	callq	0x1400021d0 <.text+0x11d0>
1454dc523:     	movq	0x48(%rbp), %rax
1454dc527:     	cmpq	$-0x1, %rax
1454dc52b:     	je	0x1454dc593 <.text+0x54db593>
1454dc52d:     	movq	%rax, 0x40(%rbp)
1454dc531:     	movq	0x50(%rbp), %rax
1454dc535:     	movq	%rax, -0x58(%rbp)
1454dc539:     	movq	0x58(%rbp), %rbx
1454dc53d:     	cmpq	0x20(%rbp), %r14
1454dc541:     	jne	0x1454dc569 <.text+0x54db569>
1454dc543:     	movq	$0x18, 0x20(%rsp)
1454dc54c:     	movl	$0x1, %r8d
1454dc552:     	movl	$0x8, %r9d
1454dc558:     	leaq	0x20(%rbp), %rcx
1454dc55c:     	movq	%r14, %rdx
1454dc55f:     	callq	0x145717840 <.text+0x5716840>
1454dc564:     	nop
1454dc565:     	movq	0x28(%rbp), %r15
1454dc569:     	leaq	(%r14,%r14,2), %rax
1454dc56d:     	movq	0x40(%rbp), %rcx
1454dc571:     	movq	%rcx, (%r15,%rax,8)
1454dc575:     	movq	-0x58(%rbp), %rcx
1454dc579:     	movq	%rcx, 0x8(%r15,%rax,8)
1454dc57e:     	movq	%rbx, 0x10(%r15,%rax,8)
1454dc583:     	incq	%r14
1454dc586:     	movq	%r14, 0x30(%rbp)
1454dc58a:     	cmpq	%r12, %r13
1454dc58d:     	jne	0x1454dc401 <.text+0x54db401>
1454dc593:     	movq	0x30(%rbp), %rax
1454dc597:     	movq	%rax, 0x10(%rsi)
1454dc59b:     	movq	0x20(%rbp), %rax
1454dc59f:     	movq	%rax, (%rsi)
1454dc5a2:     	movq	0x28(%rbp), %rax
1454dc5a6:     	movq	%rax, 0x8(%rsi)
1454dc5aa:     	jmp	0x1454dc5c3 <.text+0x54db5c3>
1454dc5ac:     	movq	$0x0, (%rsi)
1454dc5b3:     	movq	$0x8, 0x8(%rsi)
1454dc5bb:     	movq	$0x0, 0x10(%rsi)
1454dc5c3:     	movq	%rsi, %rax
1454dc5c6:     	movaps	0x70(%rbp), %xmm6
1454dc5ca:     	addq	$0x108, %rsp            # imm = 0x108
1454dc5d1:     	popq	%rbx
1454dc5d2:     	popq	%rdi
1454dc5d3:     	popq	%rsi
1454dc5d4:     	popq	%r12
1454dc5d6:     	popq	%r13
1454dc5d8:     	popq	%r14
1454dc5da:     	popq	%r15
1454dc5dc:     	popq	%rbp
1454dc5dd:     	retq
1454dc5de:     	movq	%r14, 0x40(%rbp)
1454dc5e2:     	movq	%rdi, 0x38(%rbp)
1454dc5e6:     	movl	$0x8, %ecx
1454dc5eb:     	movl	$0x60, %edx
1454dc5f0:     	callq	0x1458a3b8b <.text+0x58a2b8b>
1454dc5f5:     	nop
1454dc5f6:     	ud2
