
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400d8f40:     	pushq	%rbp
1400d8f41:     	pushq	%r15
1400d8f43:     	pushq	%r14
1400d8f45:     	pushq	%r13
1400d8f47:     	pushq	%r12
1400d8f49:     	pushq	%rsi
1400d8f4a:     	pushq	%rdi
1400d8f4b:     	pushq	%rbx
1400d8f4c:     	subq	$0x2f8, %rsp            # imm = 0x2F8
1400d8f53:     	leaq	0x80(%rsp), %rbp
1400d8f5b:     	movaps	%xmm15, 0x260(%rbp)
1400d8f63:     	movaps	%xmm14, 0x250(%rbp)
1400d8f6b:     	movaps	%xmm13, 0x240(%rbp)
1400d8f73:     	movaps	%xmm12, 0x230(%rbp)
1400d8f7b:     	movaps	%xmm11, 0x220(%rbp)
1400d8f83:     	movaps	%xmm10, 0x210(%rbp)
1400d8f8b:     	movaps	%xmm9, 0x200(%rbp)
1400d8f93:     	movaps	%xmm8, 0x1f0(%rbp)
1400d8f9b:     	movaps	%xmm7, 0x1e0(%rbp)
1400d8fa2:     	movaps	%xmm6, 0x1d0(%rbp)
1400d8fa9:     	movq	$-0x2, 0x1c8(%rbp)
1400d8fb4:     	movq	0x2f0(%rbp), %rcx
1400d8fbb:     	movq	0x2e8(%rbp), %r10
1400d8fc2:     	movq	0x2e0(%rbp), %r11
1400d8fc9:     	movq	(%rdx), %rdx
1400d8fcc:     	movq	(%r8), %rsi
1400d8fcf:     	movq	(%r9), %r8
1400d8fd2:     	movq	0x8(%r9), %rbx
1400d8fd6:     	movl	0x10(%r9), %eax
1400d8fda:     	movl	0x14(%r9), %edi
1400d8fde:     	movq	(%r11), %r9
1400d8fe1:     	movq	%r9, 0x108(%rbp)
1400d8fe8:     	movq	0x8(%r11), %r9
1400d8fec:     	movq	%r9, 0xd0(%rbp)
1400d8ff3:     	movl	0x14(%r11), %r9d
1400d8ff7:     	movl	%r9d, 0xfc(%rbp)
1400d8ffe:     	movq	(%r10), %r9
1400d9001:     	movq	%r9, 0x118(%rbp)
1400d9008:     	movq	0x8(%r10), %r9
1400d900c:     	movq	%r9, 0x100(%rbp)
1400d9013:     	movl	0x14(%r10), %r9d
1400d9017:     	movl	%r9d, 0x190(%rbp)
1400d901e:     	movss	0x58(%rdx), %xmm8
1400d9024:     	movss	0x5c(%rdx), %xmm6
1400d9029:     	movq	(%rcx), %rdx
1400d902c:     	movq	%rdx, 0x110(%rbp)
1400d9033:     	movq	0x8(%rcx), %rdx
1400d9037:     	movq	%rdx, 0xe0(%rbp)
1400d903e:     	movl	0x14(%rcx), %ecx
1400d9041:     	movl	%ecx, 0x194(%rbp)
1400d9047:     	movaps	%xmm6, %xmm9
1400d904b:     	movq	%rsi, 0x1a0(%rbp)
1400d9052:     	subss	0x44(%rsi), %xmm9
1400d9058:     	movl	%edi, 0x20(%rsp)
1400d905c:     	leaq	-0x50(%rbp), %rcx
1400d9060:     	movq	%rbx, %rdx
1400d9063:     	movq	%r8, 0x188(%rbp)
1400d906a:     	movl	%eax, %r9d
1400d906d:     	callq	0x140392550 <.text+0x391550>
1400d9072:     	movq	-0x50(%rbp), %rdi
1400d9076:     	movq	-0x48(%rbp), %r14
1400d907a:     	movq	-0x30(%rbp), %rax
1400d907e:     	movq	%rax, 0xd8(%rbp)
1400d9085:     	movq	-0x20(%rbp), %rax
1400d9089:     	movq	%rax, 0x148(%rbp)
1400d9090:     	movq	-0x10(%rbp), %rax
1400d9094:     	movq	%rax, 0x150(%rbp)
1400d909b:     	movl	-0x4(%rbp), %eax
1400d909e:     	movl	%eax, 0xec(%rbp)
1400d90a4:     	movq	(%rbp), %rax
1400d90a8:     	movq	%rax, 0x158(%rbp)
1400d90af:     	movq	0x10(%rbp), %rax
1400d90b3:     	movq	%rax, 0x160(%rbp)
1400d90ba:     	movl	0x1c(%rbp), %eax
1400d90bd:     	movl	%eax, 0xf0(%rbp)
1400d90c3:     	movq	0x20(%rbp), %rax
1400d90c7:     	movq	%rax, 0x168(%rbp)
1400d90ce:     	movq	0x30(%rbp), %rax
1400d90d2:     	movq	%rax, 0x170(%rbp)
1400d90d9:     	movl	0x3c(%rbp), %eax
1400d90dc:     	movl	%eax, 0xf4(%rbp)
1400d90e2:     	mulss	0x5823cf9(%rip), %xmm8  # 0x1458fcde4
1400d90eb:     	minss	0x581238c(%rip), %xmm8  # 0x1458eb480
1400d90f4:     	movq	0x40(%rbp), %rax
1400d90f8:     	movq	%rax, 0x1b8(%rbp)
1400d90ff:     	movss	0x581fe3c(%rip), %xmm10 # 0x1458f8f44
1400d9108:     	movss	0x581236f(%rip), %xmm13 # 0x1458eb480
1400d9111:     	movaps	0x5823cf7(%rip), %xmm15 # 0x1458fce10
1400d9119:     	movaps	0x58239bf(%rip), %xmm14 # 0x1458fcae0
1400d9121:     	movzbl	0x70(%rbp), %eax
1400d9125:     	movb	%al, 0x1c7(%rbp)
1400d912b:     	movq	0x48(%rbp), %rax
1400d912f:     	movq	%rax, 0x178(%rbp)
1400d9136:     	movq	0x58(%rbp), %rax
1400d913a:     	movq	%rax, 0x180(%rbp)
1400d9141:     	movl	0x64(%rbp), %eax
1400d9144:     	movl	%eax, 0xf8(%rbp)
1400d914a:     	movl	0x68(%rbp), %esi
1400d914d:     	movl	0x6c(%rbp), %r15d
1400d9151:     	movaps	0x5823cc7(%rip), %xmm12 # 0x1458fce20
1400d9159:     	movq	%r14, 0x78(%rbp)
1400d915d:     	jmp	0x1400d9243 <.text+0xd8243>
1400d9162:     	nopw	%cs:(%rax,%rax)
1400d9170:     	incl	%r15d
1400d9173:     	leaq	0x8(%r12), %r8
1400d9178:     	movq	$0x2, (%rbx)
1400d917f:     	movq	%r13, 0x8(%rbx)
1400d9183:     	movq	$0x2, 0x10(%rbx)
1400d918b:     	addq	$0x1c, %r12
1400d918f:     	leaq	0x120(%rbp), %rcx
1400d9196:     	movq	%r12, %rdx
1400d9199:     	movaps	%xmm7, %xmm3
1400d919c:     	callq	0x144c80a50 <.text+0x4c7fa50>
1400d91a1:     	movl	0x130(%rbp), %eax
1400d91a7:     	movl	%eax, 0x90(%rbp)
1400d91ad:     	movups	0x120(%rbp), %xmm0
1400d91b4:     	movaps	%xmm0, 0x80(%rbp)
1400d91bb:     	leaq	0x94(%rbp), %rcx
1400d91c2:     	movl	%eax, 0x10(%rcx)
1400d91c5:     	movups	%xmm0, (%rcx)
1400d91c8:     	movl	0x130(%rbp), %eax
1400d91ce:     	movl	%eax, 0x24(%rcx)
1400d91d1:     	movups	0x120(%rbp), %xmm0
1400d91d8:     	movups	%xmm0, 0x14(%rcx)
1400d91dc:     	movl	0x130(%rbp), %eax
1400d91e2:     	movl	%eax, 0x38(%rcx)
1400d91e5:     	movups	0x120(%rbp), %xmm0
1400d91ec:     	movups	%xmm0, 0x28(%rcx)
1400d91f0:     	movl	0xf8(%rbp), %eax
1400d91f6:     	movq	0x140(%rbp), %rcx
1400d91fd:     	movl	%eax, (%rcx)
1400d91ff:     	movaps	0xc0(%rbp), %xmm0
1400d9206:     	movq	0x138(%rbp), %rax
1400d920d:     	movups	%xmm0, 0x40(%rax)
1400d9211:     	movaps	0x80(%rbp), %xmm0
1400d9218:     	movaps	0x90(%rbp), %xmm1
1400d921f:     	movaps	0xa0(%rbp), %xmm2
1400d9226:     	movaps	0xb0(%rbp), %xmm3
1400d922d:     	movups	%xmm3, 0x30(%rax)
1400d9231:     	movups	%xmm2, 0x20(%rax)
1400d9235:     	movups	%xmm1, 0x10(%rax)
1400d9239:     	movups	%xmm0, (%rax)
1400d923c:     	movq	%r14, %rbx
1400d923f:     	movq	0x78(%rbp), %r14
1400d9243:     	testb	$0x1, 0x1c7(%rbp)
1400d924a:     	je	0x1400d92e0 <.text+0xd82e0>
1400d9250:     	cmpl	%esi, %r15d
1400d9253:     	movq	0x1a0(%rbp), %r10
1400d925a:     	jne	0x1400d945b <.text+0xd845b>
1400d9260:     	cmpq	%r14, %rdi
1400d9263:     	je	0x1400d98a6 <.text+0xd88a6>
1400d9269:     	movl	(%rdi), %ecx
1400d926b:     	addq	$0x4, %rdi
1400d926f:     	movq	0x1a8(%rbx), %rax
1400d9276:     	leaq	(%rcx,%rcx,8), %rcx
1400d927a:     	movq	0x10(%rax,%rcx,8), %rsi
1400d927f:     	testq	%rsi, %rsi
1400d9282:     	je	0x1400d9260 <.text+0xd8260>
1400d9284:     	leaq	(%rax,%rcx,8), %r8
1400d9288:     	movq	0x18(%r8), %rax
1400d928c:     	movq	0x38(%r8), %rcx
1400d9290:     	movq	0x188(%rbp), %rdx
1400d9297:     	movq	0x118(%rdx), %rdx
1400d929e:     	cmpq	0x40(%r8), %rdx
1400d92a2:     	jae	0x1400d938e <.text+0xd838e>
1400d92a8:     	movq	(%rcx,%rdx,8), %rdx
1400d92ac:     	testq	%rdx, %rdx
1400d92af:     	je	0x1400d938e <.text+0xd838e>
1400d92b5:     	notq	%rdx
1400d92b8:     	leaq	(%rdx,%rdx,2), %rdx
1400d92bc:     	shlq	$0x4, %rdx
1400d92c0:     	movq	0x10(%rax,%rdx), %rdx
1400d92c5:     	movq	%rdx, 0x1b8(%rbp)
1400d92cc:     	jmp	0x1400d9399 <.text+0xd8399>
1400d92d1:     	nopw	%cs:(%rax,%rax)
1400d92e0:     	cmpl	%esi, %r15d
1400d92e3:     	movq	0x1a0(%rbp), %r10
1400d92ea:     	jne	0x1400d952c <.text+0xd852c>
1400d92f0:     	cmpq	%r14, %rdi
1400d92f3:     	je	0x1400d98a6 <.text+0xd88a6>
1400d92f9:     	movl	(%rdi), %ecx
1400d92fb:     	addq	$0x4, %rdi
1400d92ff:     	movq	0x108(%rbx), %rax
1400d9306:     	leaq	(%rcx,%rcx,4), %rcx
1400d930a:     	shlq	$0x5, %rcx
1400d930e:     	movq	0x58(%rax,%rcx), %rsi
1400d9313:     	testq	%rsi, %rsi
1400d9316:     	je	0x1400d92f0 <.text+0xd82f0>
1400d9318:     	addq	%rcx, %rax
1400d931b:     	movl	0x94(%rax), %ecx
1400d9321:     	movq	0x1a8(%rbx), %r10
1400d9328:     	leaq	(%rcx,%rcx,8), %r11
1400d932c:     	movq	0x18(%r10,%r11,8), %rcx
1400d9331:     	movq	0x38(%r10,%r11,8), %rdx
1400d9336:     	movq	0x188(%rbp), %r9
1400d933d:     	movq	0x110(%r9), %r8
1400d9344:     	movq	0x118(%r9), %r9
1400d934b:     	movq	(%rdx,%r8,8), %r8
1400d934f:     	notq	%r8
1400d9352:     	leaq	(%r8,%r8,2), %r8
1400d9356:     	shlq	$0x4, %r8
1400d935a:     	cmpq	0x40(%r10,%r11,8), %r9
1400d935f:     	jae	0x1400d9463 <.text+0xd8463>
1400d9365:     	movq	(%rdx,%r9,8), %r9
1400d9369:     	testq	%r9, %r9
1400d936c:     	je	0x1400d9463 <.text+0xd8463>
1400d9372:     	notq	%r9
1400d9375:     	leaq	(%r9,%r9,2), %r9
1400d9379:     	shlq	$0x4, %r9
1400d937d:     	movq	0x10(%rcx,%r9), %r9
1400d9382:     	movq	%r9, 0x1b8(%rbp)
1400d9389:     	jmp	0x1400d946e <.text+0xd846e>
1400d938e:     	movq	$0x0, 0x1b8(%rbp)
1400d9399:     	movq	0x188(%rbp), %r9
1400d93a0:     	movq	0x110(%r9), %rdx
1400d93a7:     	movq	(%rcx,%rdx,8), %rdx
1400d93ab:     	notq	%rdx
1400d93ae:     	leaq	(%rdx,%rdx,2), %rdx
1400d93b2:     	shlq	$0x4, %rdx
1400d93b6:     	movq	0x10(%rax,%rdx), %r8
1400d93bb:     	movq	%r8, 0x148(%rbp)
1400d93c2:     	movq	0x28(%rax,%rdx), %rdx
1400d93c7:     	movq	%rdx, 0x150(%rbp)
1400d93ce:     	movq	0x120(%r9), %rdx
1400d93d5:     	movq	0x128(%r9), %r8
1400d93dc:     	movq	(%rcx,%rdx,8), %rdx
1400d93e0:     	notq	%rdx
1400d93e3:     	leaq	(%rdx,%rdx,2), %rdx
1400d93e7:     	shlq	$0x4, %rdx
1400d93eb:     	movq	0x10(%rax,%rdx), %r11
1400d93f0:     	movq	%r11, 0x158(%rbp)
1400d93f7:     	movq	0x28(%rax,%rdx), %rdx
1400d93fc:     	movq	%rdx, 0x160(%rbp)
1400d9403:     	movq	(%rcx,%r8,8), %rdx
1400d9407:     	notq	%rdx
1400d940a:     	leaq	(%rdx,%rdx,2), %rdx
1400d940e:     	shlq	$0x4, %rdx
1400d9412:     	movq	0x10(%rax,%rdx), %r8
1400d9417:     	movq	%r8, 0x168(%rbp)
1400d941e:     	movq	0x28(%rax,%rdx), %rdx
1400d9423:     	movq	%rdx, 0x170(%rbp)
1400d942a:     	movq	0x130(%r9), %rdx
1400d9431:     	movq	(%rcx,%rdx,8), %rcx
1400d9435:     	notq	%rcx
1400d9438:     	leaq	(%rcx,%rcx,2), %rcx
1400d943c:     	shlq	$0x4, %rcx
1400d9440:     	movq	0x10(%rax,%rcx), %rdx
1400d9445:     	movq	%rdx, 0x178(%rbp)
1400d944c:     	movq	0x28(%rax,%rcx), %rax
1400d9451:     	movq	%rax, 0x180(%rbp)
1400d9458:     	xorl	%r15d, %r15d
1400d945b:     	movl	%r15d, %ecx
1400d945e:     	jmp	0x1400d9540 <.text+0xd8540>
1400d9463:     	movq	$0x0, 0x1b8(%rbp)
1400d946e:     	movq	0x1a0(%rbp), %r10
1400d9475:     	movq	0x10(%rcx,%r8), %r9
1400d947a:     	movq	%r9, 0x148(%rbp)
1400d9481:     	movq	0x28(%rcx,%r8), %r8
1400d9486:     	movq	%r8, 0x150(%rbp)
1400d948d:     	movq	0x188(%rbp), %r11
1400d9494:     	movq	0x120(%r11), %r8
1400d949b:     	movq	0x128(%r11), %r9
1400d94a2:     	movq	(%rdx,%r8,8), %r8
1400d94a6:     	notq	%r8
1400d94a9:     	leaq	(%r8,%r8,2), %r8
1400d94ad:     	shlq	$0x4, %r8
1400d94b1:     	movq	0x10(%rcx,%r8), %r15
1400d94b6:     	movq	%r15, 0x158(%rbp)
1400d94bd:     	movq	0x28(%rcx,%r8), %r8
1400d94c2:     	movq	%r8, 0x160(%rbp)
1400d94c9:     	movq	(%rdx,%r9,8), %r8
1400d94cd:     	notq	%r8
1400d94d0:     	leaq	(%r8,%r8,2), %r8
1400d94d4:     	shlq	$0x4, %r8
1400d94d8:     	movq	0x10(%rcx,%r8), %r9
1400d94dd:     	movq	%r9, 0x168(%rbp)
1400d94e4:     	movq	0x28(%rcx,%r8), %r8
1400d94e9:     	movq	%r8, 0x170(%rbp)
1400d94f0:     	movq	0x130(%r11), %r8
1400d94f7:     	movq	(%rdx,%r8,8), %rdx
1400d94fb:     	notq	%rdx
1400d94fe:     	leaq	(%rdx,%rdx,2), %rdx
1400d9502:     	shlq	$0x4, %rdx
1400d9506:     	movq	0x10(%rcx,%rdx), %r8
1400d950b:     	movq	%r8, 0x178(%rbp)
1400d9512:     	movq	0x28(%rcx,%rdx), %rcx
1400d9517:     	movq	%rcx, 0x180(%rbp)
1400d951e:     	movq	0x50(%rax), %rax
1400d9522:     	movq	%rax, 0xd8(%rbp)
1400d9529:     	xorl	%r15d, %r15d
1400d952c:     	movl	%r15d, %eax
1400d952f:     	shlq	$0x4, %rax
1400d9533:     	movq	0xd8(%rbp), %rcx
1400d953a:     	movl	0x8(%rcx,%rax), %ecx
1400d953e:     	notl	%ecx
1400d9540:     	imulq	$0x38, %rcx, %r12
1400d9544:     	addq	0x148(%rbp), %r12
1400d954b:     	movq	0x150(%rbp), %rax
1400d9552:     	leaq	(%rax,%rcx,4), %rdx
1400d9556:     	movq	0x1b8(%rbp), %rax
1400d955d:     	leaq	(%rax,%rcx), %r8
1400d9561:     	movq	0x160(%rbp), %rax
1400d9568:     	leaq	(%rax,%rcx,4), %r13
1400d956c:     	leaq	(%rcx,%rcx,2), %r9
1400d9570:     	movq	0x170(%rbp), %r11
1400d9577:     	leaq	(%r11,%rcx,4), %rax
1400d957b:     	movq	%rax, 0x1a8(%rbp)
1400d9582:     	leaq	(%rcx,%rcx,4), %rax
1400d9586:     	movq	0x180(%rbp), %r11
1400d958d:     	leaq	(%r11,%rcx,4), %r11
1400d9591:     	movq	%r11, 0x140(%rbp)
1400d9598:     	shlq	$0x5, %rcx
1400d959c:     	addq	0x158(%rbp), %rcx
1400d95a3:     	movq	0x168(%rbp), %r11
1400d95aa:     	leaq	(%r11,%r9,8), %r9
1400d95ae:     	movq	%r9, 0x1b0(%rbp)
1400d95b5:     	shlq	$0x4, %rax
1400d95b9:     	addq	0x178(%rbp), %rax
1400d95c0:     	movq	%rax, 0x138(%rbp)
1400d95c7:     	movaps	%xmm9, %xmm0
1400d95cb:     	subss	0x30(%r12), %xmm0
1400d95d2:     	divss	%xmm10, %xmm0
1400d95d7:     	xorps	%xmm1, %xmm1
1400d95da:     	xorps	%xmm2, %xmm2
1400d95dd:     	maxss	%xmm0, %xmm2
1400d95e1:     	movaps	%xmm13, %xmm0
1400d95e5:     	minss	%xmm2, %xmm0
1400d95e9:     	ucomiss	%xmm0, %xmm1
1400d95ec:     	jae	0x1400d961d <.text+0xd861d>
1400d95ee:     	movaps	%xmm0, %xmm2
1400d95f1:     	addss	0x5811f03(%rip), %xmm2  # 0x1458eb4fc
1400d95f9:     	movaps	%xmm2, %xmm1
1400d95fc:     	mulss	%xmm2, %xmm1
1400d9600:     	mulss	%xmm1, %xmm2
1400d9604:     	mulss	0x58237dc(%rip), %xmm2  # 0x1458fcde8
1400d960c:     	addss	%xmm13, %xmm2
1400d9611:     	mulss	0x581f727(%rip), %xmm1  # 0x1458f8d40
1400d9619:     	addss	%xmm2, %xmm1
1400d961d:     	cmpl	$0x1, (%r10)
1400d9621:     	jne	0x1400d9640 <.text+0xd8640>
1400d9623:     	movq	0x8(%r10), %r8
1400d9627:     	cmpq	(%r12), %r8
1400d962b:     	sete	%r9b
1400d962f:     	xorps	%xmm0, %xmm0
1400d9632:     	jmp	0x1400d9656 <.text+0xd8656>
1400d9634:     	nopw	%cs:(%rax,%rax)
1400d9640:     	ucomiss	%xmm13, %xmm0
1400d9644:     	xorps	%xmm0, %xmm0
1400d9647:     	movb	$0x2, %r9b
1400d964a:     	jb	0x1400d9656 <.text+0xd8656>
1400d964c:     	cmpb	$0x2, (%r8)
1400d9650:     	je	0x1400d9656 <.text+0xd8656>
1400d9652:     	movaps	%xmm13, %xmm0
1400d9656:     	subss	0x34(%r12), %xmm0
1400d965d:     	mulss	%xmm8, %xmm0
1400d9662:     	movl	0xec(%rbp), %r8d
1400d9669:     	movl	%r8d, (%rdx)
1400d966c:     	addss	0x34(%r12), %xmm0
1400d9673:     	movss	%xmm0, 0x34(%r12)
1400d967a:     	xorps	%xmm2, %xmm2
1400d967d:     	maxss	%xmm1, %xmm2
1400d9681:     	movss	0x5823763(%rip), %xmm3  # 0x1458fcdec
1400d9689:     	minss	%xmm2, %xmm3
1400d968d:     	movaps	%xmm13, %xmm2
1400d9691:     	subss	%xmm1, %xmm2
1400d9695:     	mulss	0x5811e8b(%rip), %xmm1  # 0x1458eb528
1400d969d:     	addss	0x582374b(%rip), %xmm1  # 0x1458fcdf0
1400d96a5:     	unpcklps	%xmm1, %xmm3            # xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1]
1400d96a8:     	mulss	0x5823744(%rip), %xmm2  # 0x1458fcdf4
1400d96b0:     	movaps	%xmm0, %xmm1
1400d96b3:     	mulss	0x582373d(%rip), %xmm1  # 0x1458fcdf8
1400d96bb:     	addss	%xmm13, %xmm1
1400d96c0:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1400d96c4:     	mulps	%xmm3, %xmm1
1400d96c7:     	mulss	0x582372d(%rip), %xmm0  # 0x1458fcdfc
1400d96cf:     	addss	%xmm2, %xmm0
1400d96d3:     	cmpb	$0x2, %r9b
1400d96d7:     	je	0x1400d9747 <.text+0xd8747>
1400d96d9:     	cmpb	$0x0, 0x10(%r10)
1400d96de:     	je	0x1400d9747 <.text+0xd8747>
1400d96e0:     	movaps	%xmm6, %xmm2
1400d96e3:     	subss	0x14(%r10), %xmm2
1400d96e9:     	divss	0x582368f(%rip), %xmm2  # 0x1458fcd80
1400d96f1:     	xorps	%xmm3, %xmm3
1400d96f4:     	maxss	%xmm2, %xmm3
1400d96f8:     	movaps	%xmm13, %xmm2
1400d96fc:     	minss	%xmm3, %xmm2
1400d9700:     	movaps	%xmm2, %xmm3
1400d9703:     	testb	$0x1, %r9b
1400d9707:     	je	0x1400d9727 <.text+0xd8727>
1400d9709:     	mulss	0x581cf0f(%rip), %xmm3  # 0x1458f6620
1400d9711:     	addss	%xmm13, %xmm3
1400d9716:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
1400d971a:     	mulps	%xmm3, %xmm1
1400d971d:     	mulss	0x58236df(%rip), %xmm2  # 0x1458fce04
1400d9725:     	jmp	0x1400d9743 <.text+0xd8743>
1400d9727:     	mulss	0x58236d1(%rip), %xmm3  # 0x1458fce00
1400d972f:     	addss	%xmm13, %xmm3
1400d9734:     	movsldup	%xmm3, %xmm3            # xmm3 = xmm3[0,0,2,2]
1400d9738:     	mulps	%xmm3, %xmm1
1400d973b:     	mulss	0x581cf3d(%rip), %xmm2  # 0x1458f6680
1400d9743:     	addss	%xmm2, %xmm0
1400d9747:     	movlps	%xmm1, 0x10(%rcx)
1400d974b:     	movl	0xf0(%rbp), %edx
1400d9751:     	movl	%edx, (%r13)
1400d9755:     	movq	$0x1, (%rcx)
1400d975c:     	movl	$0x1, 0x8(%rcx)
1400d9763:     	movss	%xmm0, 0xc(%rcx)
1400d9768:     	movss	0x34(%r12), %xmm7
1400d976f:     	xorps	%xmm11, %xmm11
1400d9773:     	testb	$0x1, %r9b
1400d9777:     	je	0x1400d977d <.text+0xd877d>
1400d9779:     	movaps	%xmm13, %xmm11
1400d977d:     	callq	0x140002200 <.text+0x1200>
1400d9782:     	movl	$0x68, %ecx
1400d9787:     	movl	$0x4, %edx
1400d978c:     	callq	0x1400021c0 <.text+0x11c0>
1400d9791:     	testq	%rax, %rax
1400d9794:     	je	0x1400da01b <.text+0xd901b>
1400d979a:     	movq	%rax, 0x198(%rbp)
1400d97a1:     	leaq	0x80(%rbp), %r13
1400d97a8:     	movq	%rbx, %r14
1400d97ab:     	movaps	0x582327e(%rip), %xmm0  # 0x1458fca30
1400d97b2:     	movups	%xmm0, 0x84(%rbp)
1400d97b9:     	movl	$0x0, 0x80(%rbp)
1400d97c3:     	leaq	0x120(%rbp), %rbx
1400d97ca:     	movq	%rbx, %rcx
1400d97cd:     	movq	%r13, %rdx
1400d97d0:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400d97d5:     	nop
1400d97d6:     	maxss	%xmm11, %xmm7
1400d97db:     	movaps	0x120(%rbp), %xmm11
1400d97e3:     	movaps	%xmm7, %xmm0
1400d97e6:     	mulss	%xmm10, %xmm0
1400d97eb:     	movups	0x8(%r12), %xmm1
1400d97f1:     	movaps	%xmm1, 0x80(%rbp)
1400d97f8:     	movss	%xmm0, 0x90(%rbp)
1400d9800:     	movq	%rbx, %rcx
1400d9803:     	movq	%r13, %rdx
1400d9806:     	callq	0x144c79aa0 <.text+0x4c78aa0>
1400d980b:     	nop
1400d980c:     	movaps	%xmm7, %xmm0
1400d980f:     	mulss	0x5823095(%rip), %xmm0  # 0x1458fc8ac
1400d9817:     	addss	0x581f771(%rip), %xmm0  # 0x1458f8f90
1400d981f:     	movaps	0x120(%rbp), %xmm1
1400d9826:     	movq	0x198(%rbp), %r13
1400d982d:     	movq	$0x1, (%r13)
1400d9835:     	movl	$0x1, 0x8(%r13)
1400d983d:     	movss	%xmm0, 0xc(%r13)
1400d9843:     	movups	%xmm15, 0x10(%r13)
1400d9848:     	movl	$0x1, 0x20(%r13)
1400d9850:     	movups	%xmm11, 0x24(%r13)
1400d9855:     	movups	%xmm14, 0x34(%r13)
1400d985a:     	movups	%xmm12, 0x44(%r13)
1400d985f:     	movl	$0x1, 0x54(%r13)
1400d9867:     	movups	%xmm1, 0x58(%r13)
1400d986c:     	movl	0xf4(%rbp), %eax
1400d9872:     	movq	0x1a8(%rbp), %rcx
1400d9879:     	movl	%eax, (%rcx)
1400d987b:     	movq	0x1b0(%rbp), %rbx
1400d9882:     	movq	(%rbx), %rax
1400d9885:     	testq	%rax, %rax
1400d9888:     	je	0x1400d9170 <.text+0xd8170>
1400d988e:     	movq	0x8(%rbx), %rcx
1400d9892:     	imulq	$0x34, %rax, %rdx
1400d9896:     	movl	$0x4, %r8d
1400d989c:     	callq	0x1400021d0 <.text+0x11d0>
1400d98a1:     	jmp	0x1400d9170 <.text+0xd8170>
1400d98a6:     	movq	0x108(%rbp), %rcx
1400d98ad:     	movq	0xf8(%rcx), %rsi
1400d98b4:     	movq	0x100(%rcx), %rax
1400d98bb:     	leaq	(%rsi,%rax,4), %r12
1400d98bf:     	movzbl	0x108(%rcx), %eax
1400d98c6:     	movb	%al, 0x140(%rbp)
1400d98cc:     	movss	0x582355c(%rip), %xmm7  # 0x1458fce30
1400d98d4:     	mulss	%xmm6, %xmm7
1400d98d8:     	xorl	%r15d, %r15d
1400d98db:     	movl	$0x8, %eax
1400d98e0:     	movq	%rax, 0x198(%rbp)
1400d98e7:     	movaps	0x5823161(%rip), %xmm8  # 0x1458fca50
1400d98ef:     	movaps	0x5823169(%rip), %xmm9  # 0x1458fca60
1400d98f7:     	movaps	0x5823171(%rip), %xmm10 # 0x1458fca70
1400d98ff:     	movaps	0x5823179(%rip), %xmm11 # 0x1458fca80
1400d9907:     	movq	$0x0, 0x1b0(%rbp)
1400d9912:     	xorl	%edi, %edi
1400d9914:     	jmp	0x1400d993c <.text+0xd893c>
1400d9916:     	nopw	%cs:(%rax,%rax)
1400d9920:     	movl	0x138(%rbp), %edi
1400d9926:     	incl	%edi
1400d9928:     	movq	$0x1, (%r13)
1400d9930:     	movq	%r14, 0x8(%r13)
1400d9934:     	movq	$0x1, 0x10(%r13)
1400d993c:     	movq	0xd0(%rbp), %rdx
1400d9943:     	cmpb	$0x0, 0x140(%rbp)
1400d994a:     	je	0x1400d99d0 <.text+0xd89d0>
1400d9950:     	cmpl	%r15d, %edi
1400d9953:     	jne	0x1400d99c7 <.text+0xd89c7>
1400d9955:     	nopw	%cs:(%rax,%rax)
1400d9960:     	cmpq	%r12, %rsi
1400d9963:     	je	0x1400d9c49 <.text+0xd8c49>
1400d9969:     	movl	(%rsi), %ecx
1400d996b:     	addq	$0x4, %rsi
1400d996f:     	movq	0x1a8(%rdx), %rax
1400d9976:     	leaq	(%rcx,%rcx,8), %rcx
1400d997a:     	movq	0x10(%rax,%rcx,8), %r15
1400d997f:     	testq	%r15, %r15
1400d9982:     	je	0x1400d9960 <.text+0xd8960>
1400d9984:     	leaq	(%rax,%rcx,8), %rax
1400d9988:     	movq	0x108(%rbp), %rcx
1400d998f:     	movq	0x110(%rcx), %rcx
1400d9996:     	movq	0x18(%rax), %rdx
1400d999a:     	movq	0x38(%rax), %rax
1400d999e:     	movq	(%rax,%rcx,8), %rax
1400d99a2:     	notq	%rax
1400d99a5:     	leaq	(%rax,%rax,2), %rax
1400d99a9:     	shlq	$0x4, %rax
1400d99ad:     	movq	0x10(%rdx,%rax), %rcx
1400d99b2:     	movq	%rcx, 0x1b0(%rbp)
1400d99b9:     	movq	0x28(%rdx,%rax), %rax
1400d99be:     	movq	%rax, 0x1a8(%rbp)
1400d99c5:     	xorl	%edi, %edi
1400d99c7:     	movl	%edi, %eax
1400d99c9:     	jmp	0x1400d9a7b <.text+0xd8a7b>
1400d99ce:     	nop
1400d99d0:     	cmpl	%r15d, %edi
1400d99d3:     	jne	0x1400d9a68 <.text+0xd8a68>
1400d99d9:     	nopl	(%rax)
1400d99e0:     	cmpq	%r12, %rsi
1400d99e3:     	je	0x1400d9c49 <.text+0xd8c49>
1400d99e9:     	movl	(%rsi), %ecx
1400d99eb:     	addq	$0x4, %rsi
1400d99ef:     	movq	0x108(%rdx), %rax
1400d99f6:     	leaq	(%rcx,%rcx,4), %rcx
1400d99fa:     	shlq	$0x5, %rcx
1400d99fe:     	movq	0x58(%rax,%rcx), %r15
1400d9a03:     	testq	%r15, %r15
1400d9a06:     	je	0x1400d99e0 <.text+0xd89e0>
1400d9a08:     	addq	%rcx, %rax
1400d9a0b:     	movl	0x94(%rax), %ecx
1400d9a11:     	movq	0x1a8(%rdx), %rdx
1400d9a18:     	leaq	(%rcx,%rcx,8), %rcx
1400d9a1c:     	movq	0x108(%rbp), %r8
1400d9a23:     	movq	0x110(%r8), %r8
1400d9a2a:     	movq	0x18(%rdx,%rcx,8), %r9
1400d9a2f:     	movq	0x38(%rdx,%rcx,8), %rcx
1400d9a34:     	movq	(%rcx,%r8,8), %rcx
1400d9a38:     	notq	%rcx
1400d9a3b:     	leaq	(%rcx,%rcx,2), %rcx
1400d9a3f:     	shlq	$0x4, %rcx
1400d9a43:     	movq	0x10(%r9,%rcx), %rdx
1400d9a48:     	movq	%rdx, 0x1b0(%rbp)
1400d9a4f:     	movq	0x28(%r9,%rcx), %rcx
1400d9a54:     	movq	%rcx, 0x1a8(%rbp)
1400d9a5b:     	movq	0x50(%rax), %rax
1400d9a5f:     	movq	%rax, 0x198(%rbp)
1400d9a66:     	xorl	%edi, %edi
1400d9a68:     	movl	%edi, %eax
1400d9a6a:     	shlq	$0x4, %rax
1400d9a6e:     	movq	0x198(%rbp), %rcx
1400d9a75:     	movl	0x8(%rcx,%rax), %eax
1400d9a79:     	notl	%eax
1400d9a7b:     	leaq	(%rax,%rax,2), %rcx
1400d9a7f:     	movq	0x1b0(%rbp), %rdx
1400d9a86:     	leaq	(%rdx,%rcx,8), %r13
1400d9a8a:     	movq	0x1a8(%rbp), %rcx
1400d9a91:     	leaq	(%rcx,%rax,4), %rbx
1400d9a95:     	movl	$0x0, -0x50(%rbp)
1400d9a9c:     	movups	%xmm8, -0x4c(%rbp)
1400d9aa1:     	movl	$0x0, -0x3c(%rbp)
1400d9aa8:     	movups	%xmm9, -0x38(%rbp)
1400d9aad:     	movl	$0x0, -0x28(%rbp)
1400d9ab4:     	movups	%xmm10, -0x24(%rbp)
1400d9ab9:     	movl	$0x0, -0x14(%rbp)
1400d9ac0:     	movups	%xmm11, -0x10(%rbp)
1400d9ac5:     	movl	$0x0, (%rbp)
1400d9acc:     	movups	%xmm8, 0x4(%rbp)
1400d9ad1:     	leaq	-0x50(%rbp), %rax
1400d9ad5:     	movq	%rax, 0x120(%rbp)
1400d9adc:     	leaq	0x14(%rbp), %rax
1400d9ae0:     	movq	%rax, 0x128(%rbp)
1400d9ae7:     	movq	$0x0, 0x130(%rbp)
1400d9af2:     	leaq	0x80(%rbp), %rcx
1400d9af9:     	leaq	0x120(%rbp), %rdx
1400d9b00:     	callq	0x14010a9f0 <.text+0x1099f0>
1400d9b05:     	movb	$0x0, 0xb4(%rbp)
1400d9b0c:     	movups	0x58244e1(%rip), %xmm0  # 0x1458fdff4
1400d9b13:     	leaq	0x98(%rbp), %rax
1400d9b1a:     	movups	%xmm0, (%rax)
1400d9b1d:     	movq	$0x0, 0x10(%rax)
1400d9b25:     	movss	%xmm7, 0xb0(%rbp)
1400d9b2d:     	callq	0x140002200 <.text+0x1200>
1400d9b32:     	movl	$0x48, %ecx
1400d9b37:     	movl	$0x8, %edx
1400d9b3c:     	callq	0x1400021c0 <.text+0x11c0>
1400d9b41:     	testq	%rax, %rax
1400d9b44:     	je	0x1400da02c <.text+0xd902c>
1400d9b4a:     	movq	%rax, %r14
1400d9b4d:     	movl	%edi, 0x138(%rbp)
1400d9b53:     	movq	0xb0(%rbp), %rax
1400d9b5a:     	movq	%rax, 0x38(%r14)
1400d9b5e:     	movups	0x80(%rbp), %xmm0
1400d9b65:     	movups	0x90(%rbp), %xmm1
1400d9b6c:     	movups	0xa0(%rbp), %xmm2
1400d9b73:     	movups	%xmm2, 0x28(%r14)
1400d9b78:     	movups	%xmm1, 0x18(%r14)
1400d9b7d:     	movups	%xmm0, 0x8(%r14)
1400d9b82:     	movabsq	$-0x7ffffffffffffffe, %rax # imm = 0x8000000000000002
1400d9b8c:     	movq	%rax, (%r14)
1400d9b8f:     	movl	0xfc(%rbp), %eax
1400d9b95:     	movl	%eax, (%rbx)
1400d9b97:     	movq	0x10(%r13), %rbx
1400d9b9b:     	testq	%rbx, %rbx
1400d9b9e:     	je	0x1400d9c20 <.text+0xd8c20>
1400d9ba4:     	movq	0x8(%r13), %rdi
1400d9ba8:     	addq	$0x8, %rdi
1400d9bac:     	jmp	0x1400d9bda <.text+0xd8bda>
1400d9bae:     	nop
1400d9bb0:     	movq	(%rdi), %rdx
1400d9bb3:     	movl	$0x10, %eax
1400d9bb8:     	testq	%rdx, %rdx
1400d9bbb:     	je	0x1400d9bd1 <.text+0xd8bd1>
1400d9bbd:     	movq	-0x8(%rdi,%rax), %rcx
1400d9bc2:     	shlq	$0x5, %rdx
1400d9bc6:     	movl	$0x4, %r8d
1400d9bcc:     	callq	0x1400021d0 <.text+0x11d0>
1400d9bd1:     	addq	$0x48, %rdi
1400d9bd5:     	decq	%rbx
1400d9bd8:     	je	0x1400d9c20 <.text+0xd8c20>
1400d9bda:     	movq	-0x8(%rdi), %rdx
1400d9bde:     	movq	%rdx, %rax
1400d9be1:     	movabsq	$-0x8000000000000000, %rcx # imm = 0x8000000000000000
1400d9beb:     	xorq	%rcx, %rax
1400d9bee:     	testq	%rdx, %rdx
1400d9bf1:     	movl	$0x1, %ecx
1400d9bf6:     	cmovnsq	%rcx, %rax
1400d9bfa:     	testq	%rax, %rax
1400d9bfd:     	je	0x1400d9bb0 <.text+0xd8bb0>
1400d9bff:     	cmpq	$0x1, %rax
1400d9c03:     	jne	0x1400d9bb0 <.text+0xd8bb0>
1400d9c05:     	movl	$0x8, %eax
1400d9c0a:     	testq	%rdx, %rdx
1400d9c0d:     	jne	0x1400d9bbd <.text+0xd8bbd>
1400d9c0f:     	jmp	0x1400d9bd1 <.text+0xd8bd1>
1400d9c11:     	nopw	%cs:(%rax,%rax)
1400d9c20:     	movq	(%r13), %rax
1400d9c24:     	testq	%rax, %rax
1400d9c27:     	je	0x1400d9920 <.text+0xd8920>
1400d9c2d:     	movq	0x8(%r13), %rcx
1400d9c31:     	shlq	$0x3, %rax
1400d9c35:     	leaq	(%rax,%rax,8), %rdx
1400d9c39:     	movl	$0x8, %r8d
1400d9c3f:     	callq	0x1400021d0 <.text+0x11d0>
1400d9c44:     	jmp	0x1400d9920 <.text+0xd8920>
1400d9c49:     	movss	0x58231e3(%rip), %xmm0  # 0x1458fce34
1400d9c51:     	mulss	%xmm6, %xmm0
1400d9c55:     	callq	0x145756e2b <.text+0x5755e2b>
1400d9c5a:     	mulss	0x58231d6(%rip), %xmm0  # 0x1458fce38
1400d9c62:     	addss	0x5811816(%rip), %xmm0  # 0x1458eb480
1400d9c6a:     	movq	0x118(%rbp), %rdx
1400d9c71:     	movq	0xf8(%rdx), %rax
1400d9c78:     	movq	0x100(%rdx), %rcx
1400d9c7f:     	leaq	(%rax,%rcx,4), %rcx
1400d9c83:     	cmpb	$0x0, 0x108(%rdx)
1400d9c8a:     	je	0x1400d9ca3 <.text+0xd8ca3>
1400d9c8c:     	xorl	%edx, %edx
1400d9c8e:     	xorl	%r9d, %r9d
1400d9c91:     	xorl	%r10d, %r10d
1400d9c94:     	movq	0x100(%rbp), %rsi
1400d9c9b:     	movl	0x190(%rbp), %edi
1400d9ca1:     	jmp	0x1400d9d22 <.text+0xd8d22>
1400d9ca3:     	xorl	%edx, %edx
1400d9ca5:     	movl	$0x8, %r8d
1400d9cab:     	xorl	%r10d, %r10d
1400d9cae:     	xorl	%r11d, %r11d
1400d9cb1:     	movq	0x100(%rbp), %rsi
1400d9cb8:     	movl	0x190(%rbp), %edi
1400d9cbe:     	jmp	0x1400d9ddb <.text+0xd8ddb>
1400d9cc3:     	nopw	%cs:(%rax,%rax)
1400d9cd0:     	leaq	(%r8,%r9,8), %r8
1400d9cd4:     	movq	0x118(%rbp), %r9
1400d9cdb:     	movq	0x110(%r9), %r9
1400d9ce2:     	movq	0x18(%r8), %r10
1400d9ce6:     	movq	0x38(%r8), %r8
1400d9cea:     	movq	(%r8,%r9,8), %r8
1400d9cee:     	notq	%r8
1400d9cf1:     	leaq	(%r8,%r8,2), %r8
1400d9cf5:     	shlq	$0x4, %r8
1400d9cf9:     	movq	0x10(%r10,%r8), %r9
1400d9cfe:     	movq	0x28(%r10,%r8), %r8
1400d9d03:     	xorl	%r10d, %r10d
1400d9d06:     	movl	%r10d, %r11d
1400d9d09:     	incl	%r10d
1400d9d0c:     	movl	%edi, (%r8,%r11,4)
1400d9d10:     	shlq	$0x5, %r11
1400d9d14:     	movss	%xmm0, 0x10(%r9,%r11)
1400d9d1b:     	movss	%xmm0, 0x14(%r9,%r11)
1400d9d22:     	cmpl	%edx, %r10d
1400d9d25:     	jne	0x1400d9d06 <.text+0xd8d06>
1400d9d27:     	nopw	(%rax,%rax)
1400d9d30:     	cmpq	%rcx, %rax
1400d9d33:     	je	0x1400d9e09 <.text+0xd8e09>
1400d9d39:     	movl	(%rax), %edx
1400d9d3b:     	addq	$0x4, %rax
1400d9d3f:     	movq	0x1a8(%rsi), %r8
1400d9d46:     	leaq	(%rdx,%rdx,8), %r9
1400d9d4a:     	movq	0x10(%r8,%r9,8), %rdx
1400d9d4f:     	testq	%rdx, %rdx
1400d9d52:     	je	0x1400d9d30 <.text+0xd8d30>
1400d9d54:     	jmp	0x1400d9cd0 <.text+0xd8cd0>
1400d9d59:     	nopl	(%rax)
1400d9d60:     	addq	%r9, %r8
1400d9d63:     	movl	0x94(%r8), %r9d
1400d9d6a:     	movq	0x1a8(%rsi), %r10
1400d9d71:     	leaq	(%r9,%r9,8), %r9
1400d9d75:     	movq	0x118(%rbp), %r11
1400d9d7c:     	movq	0x110(%r11), %r11
1400d9d83:     	movq	0x18(%r10,%r9,8), %rsi
1400d9d88:     	movq	0x38(%r10,%r9,8), %r9
1400d9d8d:     	movq	(%r9,%r11,8), %r9
1400d9d91:     	notq	%r9
1400d9d94:     	leaq	(%r9,%r9,2), %r9
1400d9d98:     	shlq	$0x4, %r9
1400d9d9c:     	movq	0x10(%rsi,%r9), %r10
1400d9da1:     	movq	0x28(%rsi,%r9), %r9
1400d9da6:     	movq	0x50(%r8), %r8
1400d9daa:     	xorl	%r11d, %r11d
1400d9dad:     	movl	%r11d, %esi
1400d9db0:     	shlq	$0x4, %rsi
1400d9db4:     	incl	%r11d
1400d9db7:     	movl	0x8(%r8,%rsi), %esi
1400d9dbc:     	notl	%esi
1400d9dbe:     	movl	%edi, (%r9,%rsi,4)
1400d9dc2:     	shlq	$0x5, %rsi
1400d9dc6:     	movss	%xmm0, 0x10(%r10,%rsi)
1400d9dcd:     	movss	%xmm0, 0x14(%r10,%rsi)
1400d9dd4:     	movq	0x100(%rbp), %rsi
1400d9ddb:     	cmpl	%edx, %r11d
1400d9dde:     	jne	0x1400d9dad <.text+0xd8dad>
1400d9de0:     	cmpq	%rcx, %rax
1400d9de3:     	je	0x1400d9e09 <.text+0xd8e09>
1400d9de5:     	movl	(%rax), %edx
1400d9de7:     	addq	$0x4, %rax
1400d9deb:     	movq	0x108(%rsi), %r8
1400d9df2:     	leaq	(%rdx,%rdx,4), %r9
1400d9df6:     	shlq	$0x5, %r9
1400d9dfa:     	movq	0x58(%r8,%r9), %rdx
1400d9dff:     	testq	%rdx, %rdx
1400d9e02:     	je	0x1400d9de0 <.text+0xd8de0>
1400d9e04:     	jmp	0x1400d9d60 <.text+0xd8d60>
1400d9e09:     	movq	0x110(%rbp), %rbx
1400d9e10:     	movq	0xf8(%rbx), %rsi
1400d9e17:     	movq	0x100(%rbx), %rax
1400d9e1e:     	leaq	(%rsi,%rax,4), %rdi
1400d9e22:     	mulss	0x581c7f6(%rip), %xmm6  # 0x1458f6620
1400d9e2a:     	movaps	%xmm6, %xmm0
1400d9e2d:     	callq	0x145756e2b <.text+0x5755e2b>
1400d9e32:     	movaps	%xmm0, %xmm7
1400d9e35:     	movaps	%xmm6, %xmm0
1400d9e38:     	callq	0x145756e31 <.text+0x5755e31>
1400d9e3d:     	cmpb	$0x0, 0x108(%rbx)
1400d9e44:     	je	0x1400d9e5d <.text+0xd8e5d>
1400d9e46:     	xorl	%eax, %eax
1400d9e48:     	xorl	%edx, %edx
1400d9e4a:     	xorl	%r8d, %r8d
1400d9e4d:     	movq	0xe0(%rbp), %r10
1400d9e54:     	movl	0x194(%rbp), %r11d
1400d9e5b:     	jmp	0x1400d9ed2 <.text+0xd8ed2>
1400d9e5d:     	xorl	%eax, %eax
1400d9e5f:     	movl	$0x8, %ecx
1400d9e64:     	xorl	%r8d, %r8d
1400d9e67:     	xorl	%r9d, %r9d
1400d9e6a:     	movq	0xe0(%rbp), %r11
1400d9e71:     	movl	0x194(%rbp), %ebx
1400d9e77:     	jmp	0x1400d9f84 <.text+0xd8f84>
1400d9e7c:     	nopl	(%rax)
1400d9e80:     	leaq	(%rcx,%rdx,8), %rcx
1400d9e84:     	movq	0x110(%rbp), %rdx
1400d9e8b:     	movq	0x110(%rdx), %rdx
1400d9e92:     	movq	0x18(%rcx), %r8
1400d9e96:     	movq	0x38(%rcx), %rcx
1400d9e9a:     	movq	(%rcx,%rdx,8), %rcx
1400d9e9e:     	notq	%rcx
1400d9ea1:     	leaq	(%rcx,%rcx,2), %rcx
1400d9ea5:     	shlq	$0x4, %rcx
1400d9ea9:     	movq	0x10(%r8,%rcx), %rdx
1400d9eae:     	movq	0x28(%r8,%rcx), %rcx
1400d9eb3:     	xorl	%r8d, %r8d
1400d9eb6:     	movl	%r8d, %r9d
1400d9eb9:     	incl	%r8d
1400d9ebc:     	movl	%r11d, (%rcx,%r9,4)
1400d9ec0:     	shlq	$0x5, %r9
1400d9ec4:     	movss	%xmm0, 0x18(%rdx,%r9)
1400d9ecb:     	movss	%xmm7, 0x1c(%rdx,%r9)
1400d9ed2:     	cmpl	%eax, %r8d
1400d9ed5:     	jne	0x1400d9eb6 <.text+0xd8eb6>
1400d9ed7:     	nopw	(%rax,%rax)
1400d9ee0:     	cmpq	%rdi, %rsi
1400d9ee3:     	je	0x1400d9fb9 <.text+0xd8fb9>
1400d9ee9:     	movl	(%rsi), %eax
1400d9eeb:     	addq	$0x4, %rsi
1400d9eef:     	movq	0x1a8(%r10), %rcx
1400d9ef6:     	leaq	(%rax,%rax,8), %rdx
1400d9efa:     	movq	0x10(%rcx,%rdx,8), %rax
1400d9eff:     	testq	%rax, %rax
1400d9f02:     	je	0x1400d9ee0 <.text+0xd8ee0>
1400d9f04:     	jmp	0x1400d9e80 <.text+0xd8e80>
1400d9f09:     	nopl	(%rax)
1400d9f10:     	addq	%rdx, %rcx
1400d9f13:     	movl	0x94(%rcx), %edx
1400d9f19:     	movq	0x1a8(%r11), %r8
1400d9f20:     	leaq	(%rdx,%rdx,8), %rdx
1400d9f24:     	movq	0x110(%rbp), %r9
1400d9f2b:     	movq	0x110(%r9), %r9
1400d9f32:     	movq	0x18(%r8,%rdx,8), %r10
1400d9f37:     	movq	0x38(%r8,%rdx,8), %rdx
1400d9f3c:     	movq	(%rdx,%r9,8), %rdx
1400d9f40:     	notq	%rdx
1400d9f43:     	leaq	(%rdx,%rdx,2), %rdx
1400d9f47:     	shlq	$0x4, %rdx
1400d9f4b:     	movq	0x10(%r10,%rdx), %r8
1400d9f50:     	movq	0x28(%r10,%rdx), %rdx
1400d9f55:     	movq	0x50(%rcx), %rcx
1400d9f59:     	xorl	%r9d, %r9d
1400d9f5c:     	movl	%r9d, %r10d
1400d9f5f:     	shlq	$0x4, %r10
1400d9f63:     	incl	%r9d
1400d9f66:     	movl	0x8(%rcx,%r10), %r10d
1400d9f6b:     	notl	%r10d
1400d9f6e:     	movl	%ebx, (%rdx,%r10,4)
1400d9f72:     	shlq	$0x5, %r10
1400d9f76:     	movss	%xmm0, 0x18(%r8,%r10)
1400d9f7d:     	movss	%xmm7, 0x1c(%r8,%r10)
1400d9f84:     	cmpl	%eax, %r9d
1400d9f87:     	jne	0x1400d9f5c <.text+0xd8f5c>
1400d9f89:     	nopl	(%rax)
1400d9f90:     	cmpq	%rdi, %rsi
1400d9f93:     	je	0x1400d9fb9 <.text+0xd8fb9>
1400d9f95:     	movl	(%rsi), %eax
1400d9f97:     	addq	$0x4, %rsi
1400d9f9b:     	movq	0x108(%r11), %rcx
1400d9fa2:     	leaq	(%rax,%rax,4), %rdx
1400d9fa6:     	shlq	$0x5, %rdx
1400d9faa:     	movq	0x58(%rcx,%rdx), %rax
1400d9faf:     	testq	%rax, %rax
1400d9fb2:     	je	0x1400d9f90 <.text+0xd8f90>
1400d9fb4:     	jmp	0x1400d9f10 <.text+0xd8f10>
1400d9fb9:     	movaps	0x1d0(%rbp), %xmm6
1400d9fc0:     	movaps	0x1e0(%rbp), %xmm7
1400d9fc7:     	movaps	0x1f0(%rbp), %xmm8
1400d9fcf:     	movaps	0x200(%rbp), %xmm9
1400d9fd7:     	movaps	0x210(%rbp), %xmm10
1400d9fdf:     	movaps	0x220(%rbp), %xmm11
1400d9fe7:     	movaps	0x230(%rbp), %xmm12
1400d9fef:     	movaps	0x240(%rbp), %xmm13
1400d9ff7:     	movaps	0x250(%rbp), %xmm14
1400d9fff:     	movaps	0x260(%rbp), %xmm15
1400da007:     	addq	$0x2f8, %rsp            # imm = 0x2F8
1400da00e:     	popq	%rbx
1400da00f:     	popq	%rdi
1400da010:     	popq	%rsi
1400da011:     	popq	%r12
1400da013:     	popq	%r13
1400da015:     	popq	%r14
1400da017:     	popq	%r15
1400da019:     	popq	%rbp
1400da01a:     	retq
1400da01b:     	movl	$0x4, %ecx
1400da020:     	movl	$0x68, %edx
1400da025:     	callq	0x1458e7201 <.text+0x58e6201>
1400da02a:     	ud2
1400da02c:     	movl	$0x8, %ecx
1400da031:     	movl	$0x48, %edx
1400da036:     	callq	0x1458e7201 <.text+0x58e6201>
1400da03b:     	nop
1400da03c:     	ud2
