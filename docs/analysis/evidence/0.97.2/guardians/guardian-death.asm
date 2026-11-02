
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c422b:     	cmpq	$-0x1, %r13
1454c422f:     	je	0x1454c487e <.text+0x54c387e>
1454c4235:     	movq	0x70(%rbp), %rcx
1454c4239:     	cmpq	0x590(%rsi), %rcx
1454c4240:     	jae	0x1454c426b <.text+0x54c326b>
1454c4242:     	movq	0x588(%rsi), %rax
1454c4249:     	leaq	(%rcx,%rcx,4), %rcx
1454c424d:     	movq	$0x0, (%rax,%rcx,8)
1454c4255:     	movss	0x8e4(%rsi), %xmm0
1454c425d:     	addss	0x5039bf(%rip), %xmm0   # 0x1459c7c24
1454c4265:     	movss	%xmm0, 0x24(%rax,%rcx,8)
1454c426b:     	movq	$0x0, (%rsi)
1454c4272:     	incl	0x664(%rsi)
1454c4278:     	movb	$0x0, 0x177(%rbp)
1454c427f:     	leaq	0x14e863a(%rip), %r15   # 0x1469ac8c0
1454c4286:     	movl	$0x5e, %r14d
1454c428c:     	movl	$0x5e, %edx
1454c4291:     	movq	%r15, %rcx
1454c4294:     	callq	0x145452400 <.text+0x5451400>
1454c4299:     	nop
1454c429a:     	testq	%rax, %rax
1454c429d:     	cmovneq	%rax, %r15
1454c42a1:     	cmoveq	%r14, %rdx
1454c42a5:     	movb	$0x0, 0x177(%rbp)
1454c42ac:     	movq	%rdx, 0x20(%rsp)
1454c42b1:     	leaq	0xf0(%rbp), %rcx
1454c42b8:     	movq	0x168(%rbp), %rdx
1454c42bf:     	movq	0xe8(%rbp), %r8
1454c42c6:     	movq	%r15, %r9
1454c42c9:     	callq	0x14543f640 <.text+0x543e640>
1454c42ce:     	nop
1454c42cf:     	movq	0x548(%rsi), %r14
1454c42d6:     	cmpq	0x538(%rsi), %r14
1454c42dd:     	jne	0x1454c42ec <.text+0x54c32ec>
1454c42df:     	leaq	0x538(%rsi), %rcx
1454c42e6:     	callq	0x1457580b0 <.text+0x57570b0>
1454c42eb:     	nop
1454c42ec:     	movq	0x540(%rsi), %rax
1454c42f3:     	movq	%r14, %rcx
1454c42f6:     	shlq	$0x5, %rcx
1454c42fa:     	movups	0xf0(%rbp), %xmm0
1454c4301:     	movups	0x100(%rbp), %xmm1
1454c4308:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c430d:     	movups	%xmm0, (%rax,%rcx)
1454c4311:     	incq	%r14
1454c4314:     	movq	%r14, 0x548(%rsi)
1454c431b:     	movb	$0x0, 0x177(%rbp)
1454c4322:     	leaq	0xf0(%rbp), %rcx
1454c4329:     	movl	$0x1fee, %edx           # imm = 0x1FEE
1454c432e:     	callq	0x145440110 <.text+0x543f110>
1454c4333:     	nop
1454c4334:     	movq	0x548(%rsi), %r14
1454c433b:     	cmpq	0x538(%rsi), %r14
1454c4342:     	jne	0x1454c4351 <.text+0x54c3351>
1454c4344:     	leaq	0x538(%rsi), %rcx
1454c434b:     	callq	0x1457580b0 <.text+0x57570b0>
1454c4350:     	nop
1454c4351:     	movq	0x540(%rsi), %rax
1454c4358:     	movq	%r14, %rcx
1454c435b:     	shlq	$0x5, %rcx
1454c435f:     	movups	0xf0(%rbp), %xmm0
1454c4366:     	movups	0x100(%rbp), %xmm1
1454c436d:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c4372:     	movups	%xmm0, (%rax,%rcx)
1454c4376:     	incq	%r14
1454c4379:     	movq	%r14, 0x548(%rsi)
1454c4380:     	movb	$0x0, 0x177(%rbp)
1454c4387:     	leaq	0xf0(%rbp), %rcx
1454c438e:     	callq	0x145450bf0 <.text+0x544fbf0>
1454c4393:     	nop
1454c4394:     	movb	$0x0, 0x177(%rbp)
1454c439b:     	leaq	0x14e6596(%rip), %rax   # 0x1469aa938
1454c43a2:     	movq	%rax, 0x20(%rsp)
1454c43a7:     	movq	$0x8, 0x28(%rsp)
1454c43b0:     	leaq	0x14e6c9a(%rip), %r8    # 0x1469ab051
1454c43b7:     	leaq	0xb8(%rbp), %rcx
1454c43be:     	leaq	0xf0(%rbp), %rdx
1454c43c5:     	movl	$0x4, %r9d
1454c43cb:     	callq	0x145451620 <.text+0x5450620>
1454c43d0:     	nop
1454c43d1:     	movb	$0x0, 0x177(%rbp)
1454c43d8:     	movq	0xe8(%rbp), %rax
1454c43df:     	movq	%rax, 0x28(%rsp)
1454c43e4:     	movq	0x168(%rbp), %rax
1454c43eb:     	movq	%rax, 0x20(%rsp)
1454c43f0:     	leaq	0x14e6c2f(%rip), %r8    # 0x1469ab026
1454c43f7:     	leaq	0xf0(%rbp), %rcx
1454c43fe:     	leaq	0xb8(%rbp), %rdx
1454c4405:     	movl	$0x4, %r9d
1454c440b:     	callq	0x145451620 <.text+0x5450620>
1454c4410:     	nop
1454c4411:     	movb	$0x0, 0x177(%rbp)
1454c4418:     	leaq	0xb8(%rbp), %rcx
1454c441f:     	leaq	0xf0(%rbp), %rdx
1454c4426:     	callq	0x1454512c0 <.text+0x54502c0>
1454c442b:     	nop
1454c442c:     	movq	0x560(%rsi), %r14
1454c4433:     	cmpq	0x550(%rsi), %r14
1454c443a:     	jne	0x1454c4465 <.text+0x54c3465>
1454c443c:     	leaq	0x550(%rsi), %rcx
1454c4443:     	movq	0xb8(%rbp), %rax
1454c444a:     	movq	%rax, 0x150(%rbp)
1454c4451:     	movq	0xc0(%rbp), %rax
1454c4458:     	movq	%rax, 0x168(%rbp)
1454c445f:     	callq	0x145757f60 <.text+0x5756f60>
1454c4464:     	nop
1454c4465:     	movq	0x558(%rsi), %rax
1454c446c:     	leaq	(%r14,%r14,2), %rcx
1454c4470:     	movq	0xc8(%rbp), %rdx
1454c4477:     	movq	%rdx, 0x10(%rax,%rcx,8)
1454c447c:     	movups	0xb8(%rbp), %xmm0
1454c4483:     	movups	%xmm0, (%rax,%rcx,8)
1454c4487:     	incq	%r14
1454c448a:     	movq	%r14, 0x560(%rsi)
1454c4491:     	movl	0x664(%rsi), %eax
1454c4497:     	leal	(%rax,%rax,4), %r8d
1454c449b:     	addl	$0x19, %r8d
1454c449f:     	movb	$0x0, 0x177(%rbp)
1454c44a6:     	leaq	0x158(%rbp), %r9
1454c44ad:     	movq	%rsi, %rcx
1454c44b0:     	movl	$0x1, %edx
1454c44b5:     	callq	0x1454c8110 <.text+0x54c7110>
1454c44ba:     	nop
1454c44bb:     	movb	$0x0, 0x177(%rbp)
1454c44c2:     	leaq	0x158(%rbp), %rdx
1454c44c9:     	movq	%rsi, %rcx
1454c44cc:     	callq	0x1454c16a0 <.text+0x54c06a0>
1454c44d1:     	nop
1454c44d2:     	incl	0x8f8(%rsi)
1454c44d8:     	jmp	0x1454c4d46 <.text+0x54c3d46>
