
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403ad2b0:     	pushq	%r15
1403ad2b2:     	pushq	%r14
1403ad2b4:     	pushq	%r13
1403ad2b6:     	pushq	%r12
1403ad2b8:     	pushq	%rsi
1403ad2b9:     	pushq	%rdi
1403ad2ba:     	pushq	%rbp
1403ad2bb:     	pushq	%rbx
1403ad2bc:     	subq	$0xd8, %rsp
1403ad2c3:     	movl	$0x1, %ebp
1403ad2c8:     	lock
1403ad2c9:     	xaddl	%ebp, 0x5b0(%r8)
1403ad2d1:     	cmpq	$-0x1, (%rdx)
1403ad2d5:     	je	0x1403ad49b <.text+0x3ac49b>
1403ad2db:     	movq	%r8, %rbx
1403ad2de:     	movq	%rdx, %rsi
1403ad2e1:     	movq	0x5a0(%r8), %rax
1403ad2e8:     	movq	%rax, 0x40(%rsp)
1403ad2ed:     	cmpq	%rax, 0x160(%rdx)
1403ad2f4:     	jne	0x1403ad4b5 <.text+0x3ac4b5>
1403ad2fa:     	movq	0x38(%rsi), %rax
1403ad2fe:     	movq	0x218(%rbx), %r9
1403ad305:     	cmpq	%r9, %rax
1403ad308:     	jae	0x1403ad4e9 <.text+0x3ac4e9>
1403ad30e:     	movq	0x210(%rbx), %rdx
1403ad315:     	movq	(%rdx,%rax,8), %r8
1403ad319:     	testq	%r8, %r8
1403ad31c:     	je	0x1403ad4e9 <.text+0x3ac4e9>
1403ad322:     	movq	0x1e0(%rbx), %rax
1403ad329:     	notq	%r8
1403ad32c:     	imulq	$0x38, %r8, %r15
1403ad330:     	cmpb	$0x0, 0x30(%rax,%r15)
1403ad336:     	je	0x1403ad4e9 <.text+0x3ac4e9>
1403ad33c:     	movq	%rcx, 0xd0(%rsp)
1403ad344:     	movq	0x40(%rsi), %r8
1403ad348:     	cmpq	%r9, %r8
1403ad34b:     	jae	0x1403ad52a <.text+0x3ac52a>
1403ad351:     	movq	(%rdx,%r8,8), %rcx
1403ad355:     	testq	%rcx, %rcx
1403ad358:     	je	0x1403ad52a <.text+0x3ac52a>
1403ad35e:     	notq	%rcx
1403ad361:     	imulq	$0x38, %rcx, %r12
1403ad365:     	cmpb	$0x0, 0x30(%rax,%r12)
1403ad36b:     	je	0x1403ad52a <.text+0x3ac52a>
1403ad371:     	addq	%rax, %r15
1403ad374:     	movq	0x10(%r15), %rcx
1403ad378:     	movq	%rcx, 0xc8(%rsp)
1403ad380:     	movl	0x168(%rsi), %r13d
1403ad387:     	addq	%rax, %r12
1403ad38a:     	leaq	0x2c(%r15), %rax
1403ad38e:     	movq	%rax, 0xc0(%rsp)
1403ad396:     	addq	$0x28, %r15
1403ad39a:     	leaq	0x48(%rsi), %rcx
1403ad39e:     	movq	0x10(%r12), %rdi
1403ad3a3:     	leaq	0x28(%r12), %r14
1403ad3a8:     	addq	$0x2c, %r12
1403ad3ac:     	movl	0x5b0(%rbx), %eax
1403ad3b2:     	movq	%rbx, %rdx
1403ad3b5:     	callq	0x140313ec0 <.text+0x312ec0>
1403ad3ba:     	movq	%rbx, 0x40(%rsp)
1403ad3bf:     	leaq	0x18(%rbx), %rax
1403ad3c3:     	movq	%rax, 0x48(%rsp)
1403ad3c8:     	movq	$0x0, 0x50(%rsp)
1403ad3d1:     	movq	%rsi, 0x58(%rsp)
1403ad3d6:     	leaq	0x68(%rsp), %r8
1403ad3db:     	movq	0xc8(%rsp), %rax
1403ad3e3:     	movq	%rax, 0x68(%rsp)
1403ad3e8:     	movq	%r15, 0x70(%rsp)
1403ad3ed:     	movq	0xc0(%rsp), %rax
1403ad3f5:     	movq	%rax, 0x78(%rsp)
1403ad3fa:     	movl	%r13d, 0x80(%rsp)
1403ad402:     	movl	%ebp, 0x84(%rsp)
1403ad409:     	leaq	0x88(%rsp), %r9
1403ad411:     	movq	%rdi, 0x88(%rsp)
1403ad419:     	movq	%r14, 0x90(%rsp)
1403ad421:     	movq	%r12, 0x98(%rsp)
1403ad429:     	movl	%r13d, 0xa0(%rsp)
1403ad431:     	movl	%ebp, 0xa4(%rsp)
1403ad438:     	leaq	0xa8(%rsp), %rax
1403ad440:     	leaq	0x48(%rsi), %rcx
1403ad444:     	movq	%rcx, 0xa8(%rsp)
1403ad44c:     	movq	%rbx, 0xb0(%rsp)
1403ad454:     	movl	%r13d, 0xb8(%rsp)
1403ad45c:     	movl	%ebp, 0xbc(%rsp)
1403ad463:     	movq	%rax, 0x20(%rsp)
1403ad468:     	leaq	0x40(%rsp), %rdx
1403ad46d:     	callq	0x1403a1cc0 <.text+0x3a0cc0>
1403ad472:     	movl	%ebp, 0x168(%rsi)
1403ad478:     	movq	0xd0(%rsp), %rax
1403ad480:     	movq	$-0x3, (%rax)
1403ad487:     	addq	$0xd8, %rsp
1403ad48e:     	popq	%rbx
1403ad48f:     	popq	%rbp
1403ad490:     	popq	%rdi
1403ad491:     	popq	%rsi
1403ad492:     	popq	%r12
1403ad494:     	popq	%r13
1403ad496:     	popq	%r14
1403ad498:     	popq	%r15
1403ad49a:     	retq
1403ad49b:     	leaq	0x55a4096(%rip), %rcx   # 0x145951538
1403ad4a2:     	leaq	0x55a40ef(%rip), %r8    # 0x145951598
1403ad4a9:     	movl	$0x59, %edx
1403ad4ae:     	callq	0x1458e74d0 <.text+0x58e64d0>
1403ad4b3:     	ud2
1403ad4b5:     	addq	$0x160, %rsi            # imm = 0x160
1403ad4bc:     	leaq	0x55a415d(%rip), %rax   # 0x145951620
1403ad4c3:     	movq	%rax, 0x28(%rsp)
1403ad4c8:     	movq	$0xdf, 0x20(%rsp)
1403ad4d1:     	leaq	0x55a40d8(%rip), %r9    # 0x1459515b0
1403ad4d8:     	leaq	0x40(%rsp), %r8
1403ad4dd:     	xorl	%ecx, %ecx
1403ad4df:     	movq	%rsi, %rdx
1403ad4e2:     	callq	0x14589fabd <.text+0x589eabd>
1403ad4e7:     	ud2
1403ad4e9:     	addq	$0x16c, %rsi            # imm = 0x16C
1403ad4f0:     	movq	%rsi, 0x40(%rsp)
1403ad4f5:     	leaq	0x4c4bab4(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1403ad4fc:     	movq	%rax, 0x48(%rsp)
1403ad501:     	leaq	0x3f(%rsp), %rcx
1403ad506:     	movq	%rcx, 0x50(%rsp)
1403ad50b:     	movq	%rax, 0x58(%rsp)
1403ad510:     	leaq	0x55a3d19(%rip), %rcx   # 0x145951230
1403ad517:     	leaq	0x55a3db2(%rip), %r8    # 0x1459512d0
1403ad51e:     	leaq	0x40(%rsp), %rdx
1403ad523:     	callq	0x1458e7790 <.text+0x58e6790>
1403ad528:     	ud2
1403ad52a:     	addq	$0x16c, %rsi            # imm = 0x16C
1403ad531:     	movq	%rsi, 0x40(%rsp)
1403ad536:     	leaq	0x4c4ba73(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1403ad53d:     	movq	%rax, 0x48(%rsp)
1403ad542:     	leaq	0x3f(%rsp), %rcx
1403ad547:     	movq	%rcx, 0x50(%rsp)
1403ad54c:     	movq	%rax, 0x58(%rsp)
1403ad551:     	leaq	0x55a3cd8(%rip), %rcx   # 0x145951230
1403ad558:     	leaq	0x55a3d89(%rip), %r8    # 0x1459512e8
1403ad55f:     	leaq	0x40(%rsp), %rdx
1403ad564:     	callq	0x1458e7790 <.text+0x58e6790>
1403ad569:     	ud2
