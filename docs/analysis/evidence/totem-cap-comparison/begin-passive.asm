
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145946220:     	pushq	%rbp
145946221:     	pushq	%r15
145946223:     	pushq	%r14
145946225:     	pushq	%r13
145946227:     	pushq	%r12
145946229:     	pushq	%rsi
14594622a:     	pushq	%rdi
14594622b:     	pushq	%rbx
14594622c:     	subq	$0x88, %rsp
145946233:     	leaq	0x80(%rsp), %rbp
14594623b:     	movaps	%xmm7, -0x10(%rbp)
14594623f:     	movaps	%xmm6, -0x20(%rbp)
145946243:     	movq	$-0x2, -0x28(%rbp)
14594624b:     	movq	%rcx, %rsi
14594624e:     	movq	(%rdx), %r8
145946251:     	movq	(%r8), %rbx
145946254:     	movq	0x8(%r8), %rdi
145946258:     	cmpq	$0xb, %rdi
14594625c:     	je	0x145946286 <.text+0x5945286>
14594625e:     	cmpq	$0xa, %rdi
145946262:     	jne	0x1459462a4 <.text+0x59452a4>
145946264:     	movq	(%rbx), %rax
145946267:     	xorq	0x126d430(%rip), %rax   # 0x146bb369e
14594626e:     	movzwl	0x8(%rbx), %ecx
145946272:     	xorw	0x126d42d(%rip), %cx    # 0x146bb36a6
145946279:     	movzwl	%cx, %ecx
14594627c:     	orq	%rax, %rcx
14594627f:     	jne	0x1459462a4 <.text+0x59452a4>
145946281:     	jmp	0x145946514 <.text+0x5945514>
145946286:     	movq	(%rbx), %rax
145946289:     	xorq	0x126d418(%rip), %rax   # 0x146bb36a8
145946290:     	movq	0x3(%rbx), %rcx
145946294:     	xorq	0x126d410(%rip), %rcx   # 0x146bb36ab
14594629b:     	orq	%rax, %rcx
14594629e:     	je	0x145946514 <.text+0x5945514>
1459462a4:     	movq	%r8, -0x30(%rbp)
1459462a8:     	movss	0x48(%r8), %xmm7
1459462ae:     	mulss	0x42da8a(%rip), %xmm7   # 0x145d73d40
1459462b6:     	mulss	0x2c(%rdx), %xmm7
1459462bb:     	mulss	0x48(%rdx), %xmm7
1459462c0:     	mulss	0x480(%rsi), %xmm7
1459462c8:     	mulss	0x64(%rdx), %xmm7
1459462cd:     	maxss	0x42da6f(%rip), %xmm7   # 0x145d73d44
1459462d5:     	movq	%rbx, %rcx
1459462d8:     	movq	%rdx, %r14
1459462db:     	movq	%rdi, %rdx
1459462de:     	callq	0x145882c60 <.text+0x5881c60>
1459462e3:     	movaps	%xmm0, %xmm6
1459462e6:     	maxss	%xmm7, %xmm6
1459462ea:     	movss	0x5c(%r14), %xmm0
1459462f0:     	maxss	0x42a93c(%rip), %xmm0   # 0x145d70c34
1459462f8:     	divss	%xmm0, %xmm6
1459462fc:     	movss	0x9ec(%rsi), %xmm7
145946304:     	addss	%xmm6, %xmm7
145946308:     	movq	0x7d8(%rsi), %r12
14594630f:     	movq	0x7e0(%rsi), %r15
145946316:     	testq	%r15, %r15
145946319:     	je	0x14594636f <.text+0x594536f>
14594631b:     	leaq	(,%r15,8), %rax
145946323:     	leaq	(%rax,%rax,2), %r14
145946327:     	xorl	%r13d, %r13d
14594632a:     	jmp	0x145946339 <.text+0x5945339>
14594632c:     	nopl	(%rax)
145946330:     	addq	$0x18, %r13
145946334:     	cmpq	%r13, %r14
145946337:     	je	0x14594636f <.text+0x594536f>
145946339:     	cmpq	%rdi, 0x8(%r12,%r13)
14594633e:     	jne	0x145946330 <.text+0x5945330>
145946340:     	movq	(%r12,%r13), %rcx
145946344:     	movq	%rbx, %rdx
145946347:     	movq	%rdi, %r8
14594634a:     	callq	0x145bc9787 <.text+0x5bc8787>
14594634f:     	testl	%eax, %eax
145946351:     	jne	0x145946330 <.text+0x5945330>
145946353:     	movss	%xmm7, 0x10(%r12,%r13)
14594635a:     	movq	-0x30(%rbp), %r14
14594635e:     	movq	0x320(%rsi), %rax
145946365:     	testq	%rax, %rax
145946368:     	jne	0x1459463aa <.text+0x59453aa>
14594636a:     	jmp	0x1459463fc <.text+0x59453fc>
14594636f:     	cmpq	0x7d0(%rsi), %r15
145946376:     	je	0x145946530 <.text+0x5945530>
14594637c:     	leaq	(%r15,%r15,2), %rax
145946380:     	movq	%rbx, (%r12,%rax,8)
145946384:     	movq	%rdi, 0x8(%r12,%rax,8)
145946389:     	movss	%xmm7, 0x10(%r12,%rax,8)
145946390:     	incq	%r15
145946393:     	movq	%r15, 0x7e0(%rsi)
14594639a:     	movq	-0x30(%rbp), %r14
14594639e:     	movq	0x320(%rsi), %rax
1459463a5:     	testq	%rax, %rax
1459463a8:     	je	0x1459463fc <.text+0x59453fc>
1459463aa:     	movq	0x318(%rsi), %r15
1459463b1:     	imulq	$0x68, %rax, %r12
1459463b5:     	movq	(%r14), %rdi
1459463b8:     	movq	0x8(%r14), %rbx
1459463bc:     	xorl	%r13d, %r13d
1459463bf:     	jmp	0x1459463d9 <.text+0x59453d9>
1459463c1:     	nopw	%cs:(%rax,%rax)
1459463d0:     	addq	$0x68, %r13
1459463d4:     	cmpq	%r13, %r12
1459463d7:     	je	0x1459463fc <.text+0x59453fc>
1459463d9:     	movq	(%r15,%r13), %rax
1459463dd:     	cmpq	%rbx, 0x8(%rax)
1459463e1:     	jne	0x1459463d0 <.text+0x59453d0>
1459463e3:     	movq	(%rax), %rcx
1459463e6:     	movq	%rdi, %rdx
1459463e9:     	movq	%rbx, %r8
1459463ec:     	callq	0x145bc9787 <.text+0x5bc8787>
1459463f1:     	testl	%eax, %eax
1459463f3:     	jne	0x1459463d0 <.text+0x59453d0>
1459463f5:     	movss	%xmm6, 0x24(%r15,%r13)
1459463fc:     	mulss	0x4791a0(%rip), %xmm6   # 0x145dbf5a4
145946404:     	cvttss2si	%xmm6, %rax
145946409:     	xorl	%ecx, %ecx
14594640b:     	xorps	%xmm0, %xmm0
14594640e:     	ucomiss	%xmm0, %xmm6
145946411:     	cmovael	%eax, %ecx
145946414:     	leaq	0x5d0(%rsi), %rdi
14594641b:     	ucomiss	0x427452(%rip), %xmm6   # 0x145d6d874
145946422:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
145946427:     	cmovbel	%ecx, %eax
14594642a:     	movq	0x460(%rsi), %rdx
145946431:     	movl	0x40(%r14), %ecx
145946435:     	movl	%ecx, -0x38(%rbp)
145946438:     	movl	%eax, -0x34(%rbp)
14594643b:     	leaq	-0x58(%rbp), %rcx
14594643f:     	leaq	-0x38(%rbp), %r8
145946443:     	movl	$0x1, %r9d
145946449:     	callq	0x1458acb30 <.text+0x58abb30>
14594644e:     	movq	0x5e0(%rsi), %rbx
145946455:     	cmpq	0x5d0(%rsi), %rbx
14594645c:     	jne	0x145946467 <.text+0x5945467>
14594645e:     	movq	%rdi, %rcx
145946461:     	callq	0x145bcb530 <.text+0x5bca530>
145946466:     	nop
145946467:     	movq	0x5d8(%rsi), %rax
14594646e:     	movq	%rbx, %rcx
145946471:     	shlq	$0x5, %rcx
145946475:     	movups	-0x58(%rbp), %xmm0
145946479:     	movups	-0x48(%rbp), %xmm1
14594647d:     	movups	%xmm1, 0x10(%rax,%rcx)
145946482:     	movups	%xmm0, (%rax,%rcx)
145946486:     	incq	%rbx
145946489:     	movq	%rbx, 0x5e0(%rsi)
145946490:     	movl	0x40(%r14), %ebx
145946494:     	movq	0x460(%rsi), %r14
14594649b:     	callq	0x140002200 <.text+0x1200>
1459464a0:     	movl	$0x20, %ecx
1459464a5:     	movl	$0x1, %edx
1459464aa:     	callq	0x1400021c0 <.text+0x11c0>
1459464af:     	testq	%rax, %rax
1459464b2:     	je	0x145946548 <.text+0x5945548>
1459464b8:     	movl	%ebx, (%rax)
1459464ba:     	movq	%rax, -0x30(%rbp)
1459464be:     	movq	%r14, 0x4(%rax)
1459464c2:     	movq	0x5e0(%rsi), %rbx
1459464c9:     	cmpq	0x5d0(%rsi), %rbx
1459464d0:     	jne	0x1459464db <.text+0x59454db>
1459464d2:     	movq	%rdi, %rcx
1459464d5:     	callq	0x145bcb530 <.text+0x5bca530>
1459464da:     	nop
1459464db:     	movq	0x5d8(%rsi), %rax
1459464e2:     	movq	%rbx, %rcx
1459464e5:     	shlq	$0x5, %rcx
1459464e9:     	movq	$0x20, (%rax,%rcx)
1459464f1:     	movq	-0x30(%rbp), %rdx
1459464f5:     	movq	%rdx, 0x8(%rax,%rcx)
1459464fa:     	movq	$0xc, 0x10(%rax,%rcx)
145946503:     	movw	$0x135, 0x18(%rax,%rcx) # imm = 0x135
14594650a:     	incq	%rbx
14594650d:     	movq	%rbx, 0x5e0(%rsi)
145946514:     	movaps	-0x20(%rbp), %xmm6
145946518:     	movaps	-0x10(%rbp), %xmm7
14594651c:     	addq	$0x88, %rsp
145946523:     	popq	%rbx
145946524:     	popq	%rdi
145946525:     	popq	%rsi
145946526:     	popq	%r12
145946528:     	popq	%r13
14594652a:     	popq	%r14
14594652c:     	popq	%r15
14594652e:     	popq	%rbp
14594652f:     	retq
145946530:     	leaq	0x7d0(%rsi), %rcx
145946537:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
14594653c:     	movq	0x7d8(%rsi), %r12
145946543:     	jmp	0x14594637c <.text+0x594537c>
145946548:     	movl	$0x1, %ecx
14594654d:     	movl	$0x20, %edx
145946552:     	callq	0x145d6944b <.text+0x5d6844b>
145946557:     	ud2
