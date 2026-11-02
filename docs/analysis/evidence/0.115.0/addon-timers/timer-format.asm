
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458e4220:     	pushq	%rbp
1458e4221:     	pushq	%r15
1458e4223:     	pushq	%r14
1458e4225:     	pushq	%r13
1458e4227:     	pushq	%r12
1458e4229:     	pushq	%rsi
1458e422a:     	pushq	%rdi
1458e422b:     	pushq	%rbx
1458e422c:     	subq	$0x158, %rsp            # imm = 0x158
1458e4233:     	leaq	0x80(%rsp), %rbp
1458e423b:     	movaps	%xmm7, 0xc0(%rbp)
1458e4242:     	movaps	%xmm6, 0xb0(%rbp)
1458e4249:     	movq	$-0x2, 0xa8(%rbp)
1458e4254:     	movq	%rdx, %r8
1458e4257:     	movq	%rcx, -0x8(%rbp)
1458e425b:     	movq	0x10(%rdx), %rax
1458e425f:     	movq	(%rdx), %rcx
1458e4262:     	movq	0x8(%rdx), %r13
1458e4266:     	movq	%rax, -0x10(%rbp)
1458e426a:     	shlq	$0x5, %rax
1458e426e:     	movabsq	$-0x5555555555555555, %rdx # imm = 0xAAAAAAAAAAAAAAAB
1458e4278:     	movq	%rax, -0x18(%rbp)
1458e427c:     	mulq	%rdx
1458e427f:     	movq	%rdx, -0x20(%rbp)
1458e4283:     	movq	%r8, 0x98(%rbp)
1458e428a:     	movq	0x18(%r8), %rsi
1458e428e:     	movq	%rcx, 0x90(%rbp)
1458e4295:     	movq	%rcx, 0xa0(%rbp)
1458e429c:     	cmpq	%rsi, %r13
1458e429f:     	je	0x1458e447c <.text+0x58e347c>
1458e42a5:     	movq	0x98(%rbp), %rax
1458e42ac:     	movq	0x20(%rax), %rbx
1458e42b0:     	leaq	0x30(%rbp), %r14
1458e42b4:     	xorps	%xmm6, %xmm6
1458e42b7:     	leaq	0x413e42(%rip), %rdi    # 0x145cf8100 <.text+0x5cf7100>
1458e42be:     	leaq	0x1a4ab33(%rip), %r15   # 0x14732edf8
1458e42c5:     	leaq	-0x50(%rbp), %r12
1458e42c9:     	movq	0x90(%rbp), %rax
1458e42d0:     	movq	%rax, 0xa0(%rbp)
1458e42d7:     	jmp	0x1458e42ed <.text+0x58e32ed>
1458e42d9:     	nopl	(%rax)
1458e42e0:     	addq	$0x20, %r13
1458e42e4:     	cmpq	%rsi, %r13
1458e42e7:     	je	0x1458e447c <.text+0x58e347c>
1458e42ed:     	movups	(%r13), %xmm0
1458e42f2:     	movq	0x10(%r13), %rax
1458e42f6:     	movss	0x18(%r13), %xmm7
1458e42fc:     	movss	0x1c(%r13), %xmm1
1458e4302:     	movups	%xmm0, -0x38(%rbp)
1458e4306:     	movss	%xmm1, 0x8c(%rbp)
1458e430e:     	cmpq	0x858(%rbx), %rax
1458e4315:     	jae	0x1458e42e0 <.text+0x58e32e0>
1458e4317:     	movq	0x850(%rbx), %rdx
1458e431e:     	leaq	(%rax,%rax,4), %rax
1458e4322:     	leaq	(%rdx,%rax,8), %rcx
1458e4326:     	addq	$0x18, %rcx
1458e432a:     	movq	%rcx, -0x28(%rbp)
1458e432e:     	movq	0x8(%rdx,%rax,8), %rcx
1458e4333:     	movq	0x10(%rdx,%rax,8), %rdx
1458e4338:     	movq	$0x0, 0x30(%rbp)
1458e4340:     	movq	$0x1, 0x38(%rbp)
1458e4348:     	movq	$0x0, 0x40(%rbp)
1458e4350:     	testq	%rdx, %rdx
1458e4353:     	jne	0x1458e443a <.text+0x58e343a>
1458e4359:     	addq	%rcx, %rdx
1458e435c:     	movq	%r14, %r8
1458e435f:     	callq	0x1459e6cb0 <.text+0x59e5cb0>
1458e4364:     	nop
1458e4365:     	movq	0x40(%rbp), %rax
1458e4369:     	movq	%rax, 0x20(%rbp)
1458e436d:     	movups	0x30(%rbp), %xmm0
1458e4371:     	movaps	%xmm0, 0x10(%rbp)
1458e4375:     	maxss	%xmm6, %xmm7
1458e4379:     	movss	%xmm7, 0x88(%rbp)
1458e4381:     	leaq	0x10(%rbp), %rax
1458e4385:     	movq	%rax, 0x30(%rbp)
1458e4389:     	leaq	-0x58e22b0(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1458e4390:     	movq	%rax, 0x38(%rbp)
1458e4394:     	leaq	-0x28(%rbp), %rax
1458e4398:     	movq	%rax, 0x40(%rbp)
1458e439c:     	leaq	-0x4c53203(%rip), %rax  # 0x140c911a0 <.text+0xc901a0>
1458e43a3:     	movq	%rax, 0x48(%rbp)
1458e43a7:     	leaq	-0x38(%rbp), %rax
1458e43ab:     	movq	%rax, 0x50(%rbp)
1458e43af:     	leaq	-0x58e22f6(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458e43b6:     	movq	%rax, 0x58(%rbp)
1458e43ba:     	leaq	0x88(%rbp), %rax
1458e43c1:     	movq	%rax, 0x60(%rbp)
1458e43c5:     	movq	%rdi, 0x68(%rbp)
1458e43c9:     	leaq	0x8c(%rbp), %rax
1458e43d0:     	movq	%rax, 0x70(%rbp)
1458e43d4:     	movq	%rdi, 0x78(%rbp)
1458e43d8:     	movq	%r12, %rcx
1458e43db:     	movq	%r15, %rdx
1458e43de:     	movq	%r14, %r8
1458e43e1:     	callq	0x145ce7350 <.text+0x5ce6350>
1458e43e6:     	nop
1458e43e7:     	movq	0x10(%rbp), %rdx
1458e43eb:     	testq	%rdx, %rdx
1458e43ee:     	je	0x1458e43ff <.text+0x58e33ff>
1458e43f0:     	movq	0x18(%rbp), %rcx
1458e43f4:     	movl	$0x1, %r8d
1458e43fa:     	callq	0x1400021d0 <.text+0x11d0>
1458e43ff:     	movq	-0x50(%rbp), %rax
1458e4403:     	leaq	-0x48(%rbp), %rcx
1458e4407:     	movups	(%rcx), %xmm0
1458e440a:     	movaps	%xmm0, 0x30(%rbp)
1458e440e:     	cmpq	$-0x1, %rax
1458e4412:     	je	0x1458e42e0 <.text+0x58e32e0>
1458e4418:     	movq	0xa0(%rbp), %rcx
1458e441f:     	movq	%rax, (%rcx)
1458e4422:     	movaps	0x30(%rbp), %xmm0
1458e4426:     	movups	%xmm0, 0x8(%rcx)
1458e442a:     	addq	$0x18, %rcx
1458e442e:     	movq	%rcx, 0xa0(%rbp)
1458e4435:     	jmp	0x1458e42e0 <.text+0x58e32e0>
1458e443a:     	movq	%rdx, %r8
1458e443d:     	shrq	$0x2, %r8
1458e4441:     	movl	%edx, %eax
1458e4443:     	andl	$0x3, %eax
1458e4446:     	cmpq	$0x1, %rax
1458e444a:     	sbbq	$-0x1, %r8
1458e444e:     	movq	$0x1, 0x20(%rsp)
1458e4457:     	movl	$0x1, %r9d
1458e445d:     	movq	%rcx, (%rbp)
1458e4461:     	movq	%r14, %rcx
1458e4464:     	movq	%rdx, 0x8(%rbp)
1458e4468:     	xorl	%edx, %edx
1458e446a:     	callq	0x145d14a10 <.text+0x5d13a10>
1458e446f:     	movq	0x8(%rbp), %rdx
1458e4473:     	movq	(%rbp), %rcx
1458e4477:     	jmp	0x1458e4359 <.text+0x58e3359>
1458e447c:     	movq	-0x20(%rbp), %rdi
1458e4480:     	shrq	$0x4, %rdi
1458e4484:     	movq	0x90(%rbp), %r9
1458e448b:     	movq	0xa0(%rbp), %rsi
1458e4492:     	subq	%r9, %rsi
1458e4495:     	shrq	$0x3, %rsi
1458e4499:     	movabsq	$-0x5555555555555555, %rax # imm = 0xAAAAAAAAAAAAAAAB
1458e44a3:     	imulq	%rax, %rsi
1458e44a7:     	movq	%r9, 0x30(%rbp)
1458e44ab:     	movq	%rsi, 0x38(%rbp)
1458e44af:     	movq	-0x10(%rbp), %rcx
1458e44b3:     	movq	%rcx, 0x40(%rbp)
1458e44b7:     	movq	0x98(%rbp), %rax
1458e44be:     	movq	$0x8, (%rax)
1458e44c5:     	testq	%rcx, %rcx
1458e44c8:     	setne	%al
1458e44cb:     	leaq	(,%rdi,8), %rcx
1458e44d3:     	leaq	(%rcx,%rcx,2), %r14
1458e44d7:     	movq	-0x18(%rbp), %rdx
1458e44db:     	cmpq	%r14, %rdx
1458e44de:     	setne	%cl
1458e44e1:     	testb	%cl, %al
1458e44e3:     	je	0x1458e4519 <.text+0x58e3519>
1458e44e5:     	testq	%rdx, %rdx
1458e44e8:     	je	0x1458e4513 <.text+0x58e3513>
1458e44ea:     	movl	$0x8, %r8d
1458e44f0:     	movq	%r9, %rcx
1458e44f3:     	movq	%r14, %r9
1458e44f6:     	callq	0x1400021e0 <.text+0x11e0>
1458e44fb:     	movq	%rax, %r9
1458e44fe:     	testq	%rax, %rax
1458e4501:     	jne	0x1458e4519 <.text+0x58e3519>
1458e4503:     	movl	$0x8, %ecx
1458e4508:     	movq	%r14, %rdx
1458e450b:     	callq	0x145eb6fb1 <.text+0x5eb5fb1>
1458e4510:     	nop
1458e4511:     	ud2
1458e4513:     	movl	$0x8, %r9d
1458e4519:     	movq	-0x8(%rbp), %rax
1458e451d:     	movq	%rdi, (%rax)
1458e4520:     	movq	%r9, 0x8(%rax)
1458e4524:     	movq	%rsi, 0x10(%rax)
1458e4528:     	movaps	0xb0(%rbp), %xmm6
1458e452f:     	movaps	0xc0(%rbp), %xmm7
1458e4536:     	addq	$0x158, %rsp            # imm = 0x158
1458e453d:     	popq	%rbx
1458e453e:     	popq	%rdi
1458e453f:     	popq	%rsi
1458e4540:     	popq	%r12
1458e4542:     	popq	%r13
1458e4544:     	popq	%r14
1458e4546:     	popq	%r15
1458e4548:     	popq	%rbp
1458e4549:     	retq
