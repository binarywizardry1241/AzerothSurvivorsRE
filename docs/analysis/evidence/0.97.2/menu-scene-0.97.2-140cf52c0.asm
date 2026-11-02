
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140cf52c0:     	pushq	%r15
140cf52c2:     	pushq	%r14
140cf52c4:     	pushq	%r13
140cf52c6:     	pushq	%r12
140cf52c8:     	pushq	%rsi
140cf52c9:     	pushq	%rdi
140cf52ca:     	pushq	%rbp
140cf52cb:     	pushq	%rbx
140cf52cc:     	subq	$0x98, %rsp
140cf52d3:     	movq	0x18(%rcx), %rsi
140cf52d7:     	cmpq	$0x0, 0x50(%rsi)
140cf52dc:     	je	0x140cf5386 <.text+0xcf4386>
140cf52e2:     	movq	(%rdx), %rax
140cf52e5:     	movq	0x8(%rdx), %r8
140cf52e9:     	movq	%r8, %r11
140cf52ec:     	shrq	$0x39, %r11
140cf52f0:     	movq	0x38(%rsi), %r9
140cf52f4:     	movq	0x40(%rsi), %r10
140cf52f8:     	movd	%r11d, %xmm0
140cf52fd:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
140cf5301:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
140cf5306:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
140cf530b:     	xorl	%r11d, %r11d
140cf530e:     	pcmpeqd	%xmm1, %xmm1
140cf5312:     	movq	%r8, %rdi
140cf5315:     	andq	%r10, %rdi
140cf5318:     	movdqu	(%r9,%rdi), %xmm2
140cf531e:     	movdqa	%xmm2, %xmm3
140cf5322:     	pcmpeqb	%xmm0, %xmm3
140cf5326:     	pmovmskb	%xmm3, %ebx
140cf532a:     	testl	%ebx, %ebx
140cf532c:     	je	0x140cf5360 <.text+0xcf4360>
140cf532e:     	tzcntl	%ebx, %r14d
140cf5333:     	addq	%rdi, %r14
140cf5336:     	andq	%r10, %r14
140cf5339:     	negq	%r14
140cf533c:     	leaq	(%r14,%r14,2), %r14
140cf5340:     	movq	-0x10(%r9,%r14,8), %r15
140cf5345:     	xorq	%r8, %r15
140cf5348:     	movq	-0x18(%r9,%r14,8), %r12
140cf534d:     	xorq	%rax, %r12
140cf5350:     	orq	%r15, %r12
140cf5353:     	je	0x140cf5379 <.text+0xcf4379>
140cf5355:     	leal	-0x1(%rbx), %ebp
140cf5358:     	andw	%bx, %bp
140cf535b:     	movl	%ebp, %ebx
140cf535d:     	jne	0x140cf532e <.text+0xcf432e>
140cf535f:     	nop
140cf5360:     	pcmpeqb	%xmm1, %xmm2
140cf5364:     	pmovmskb	%xmm2, %ebx
140cf5368:     	testl	%ebx, %ebx
140cf536a:     	jne	0x140cf538d <.text+0xcf438d>
140cf536c:     	addq	%r11, %rdi
140cf536f:     	addq	$0x10, %rdi
140cf5373:     	addq	$0x10, %r11
140cf5377:     	jmp	0x140cf5315 <.text+0xcf4315>
140cf5379:     	leaq	(%r9,%r14,8), %rax
140cf537d:     	movq	-0x8(%rax), %rax
140cf5381:     	jmp	0x140cf559c <.text+0xcf459c>
140cf5386:     	movq	(%rdx), %rax
140cf5389:     	movq	0x8(%rdx), %r8
140cf538d:     	movzbl	0x60(%rsi), %r9d
140cf5392:     	movq	%r8, %r11
140cf5395:     	shrq	$0x39, %r11
140cf5399:     	movq	0xa0(%rsi), %r9
140cf53a0:     	movq	0xa8(%rsi), %r10
140cf53a7:     	movd	%r11d, %xmm0
140cf53ac:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
140cf53b0:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
140cf53b5:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
140cf53ba:     	xorl	%r11d, %r11d
140cf53bd:     	pcmpeqd	%xmm1, %xmm1
140cf53c1:     	movq	%r8, %rbx
140cf53c4:     	andq	%r10, %rbx
140cf53c7:     	movdqu	(%r9,%rbx), %xmm2
140cf53cd:     	movdqa	%xmm2, %xmm3
140cf53d1:     	pcmpeqb	%xmm0, %xmm3
140cf53d5:     	pmovmskb	%xmm3, %r15d
140cf53da:     	testl	%r15d, %r15d
140cf53dd:     	je	0x140cf5420 <.text+0xcf4420>
140cf53df:     	tzcntl	%r15d, %r14d
140cf53e4:     	addq	%rbx, %r14
140cf53e7:     	andq	%r10, %r14
140cf53ea:     	movq	%r14, %r12
140cf53ed:     	shlq	$0x7, %r12
140cf53f1:     	movq	%r9, %rdi
140cf53f4:     	subq	%r12, %rdi
140cf53f7:     	movq	-0x78(%rdi), %r12
140cf53fb:     	xorq	%r8, %r12
140cf53fe:     	movq	-0x80(%rdi), %r13
140cf5402:     	xorq	%rax, %r13
140cf5405:     	orq	%r12, %r13
140cf5408:     	je	0x140cf543d <.text+0xcf443d>
140cf540a:     	leal	-0x1(%r15), %edi
140cf540e:     	andw	%r15w, %di
140cf5412:     	movl	%edi, %r15d
140cf5415:     	jne	0x140cf53df <.text+0xcf43df>
140cf5417:     	nopw	(%rax,%rax)
140cf5420:     	pcmpeqb	%xmm1, %xmm2
140cf5424:     	pmovmskb	%xmm2, %edi
140cf5428:     	testl	%edi, %edi
140cf542a:     	jne	0x140cf54b5 <.text+0xcf44b5>
140cf5430:     	addq	%r11, %rbx
140cf5433:     	addq	$0x10, %rbx
140cf5437:     	addq	$0x10, %r11
140cf543b:     	jmp	0x140cf53c4 <.text+0xcf43c4>
140cf543d:     	leaq	-0x10(%r14), %rax
140cf5441:     	andq	%r10, %rax
140cf5444:     	movdqu	(%r9,%rax), %xmm0
140cf544a:     	pcmpeqd	%xmm1, %xmm1
140cf544e:     	pcmpeqb	%xmm1, %xmm0
140cf5452:     	pmovmskb	%xmm0, %r8d
140cf5457:     	movdqu	(%r9,%r14), %xmm0
140cf545d:     	pcmpeqb	%xmm1, %xmm0
140cf5461:     	pmovmskb	%xmm0, %r10d
140cf5466:     	movw	$0x1f, %r11w
140cf546b:     	bsrw	%r8w, %r11w
140cf5470:     	xorl	$0xf, %r11d
140cf5474:     	orl	$0x10000, %r10d         # imm = 0x10000
140cf547b:     	tzcntl	%r10d, %r10d
140cf5480:     	addl	%r11d, %r10d
140cf5483:     	movb	$-0x80, %r8b
140cf5486:     	cmpw	$0xf, %r10w
140cf548b:     	ja	0x140cf5497 <.text+0xcf4497>
140cf548d:     	incq	0xb0(%rsi)
140cf5494:     	movb	$-0x1, %r8b
140cf5497:     	movb	%r8b, (%r9,%r14)
140cf549b:     	movb	%r8b, 0x10(%r9,%rax)
140cf54a0:     	decq	0xb8(%rsi)
140cf54a7:     	movq	-0x70(%rdi), %rax
140cf54ab:     	cmpq	$0x2, %rax
140cf54af:     	jne	0x140cf5539 <.text+0xcf4539>
140cf54b5:     	movq	0x20(%rcx), %rax
140cf54b9:     	movq	(%rax), %rdi
140cf54bc:     	leaq	0x1(%rdi), %rcx
140cf54c0:     	movq	%rcx, (%rax)
140cf54c3:     	movw	$0x100, 0x78(%rsp)      # imm = 0x100
140cf54ca:     	movq	$0x1, 0x28(%rsp)
140cf54d3:     	movdqu	0x4dbc6a5(%rip), %xmm0  # 0x145ab1b80
140cf54db:     	movdqu	%xmm0, 0x30(%rsp)
140cf54e1:     	movq	$0x4, 0x50(%rsp)
140cf54ea:     	movq	$0xbc, 0x58(%rsp)
140cf54f3:     	movq	$0x0, 0x70(%rsp)
140cf54fc:     	movb	$0x1, 0x7a(%rsp)
140cf5501:     	movq	$0x0, 0x40(%rsp)
140cf550a:     	movb	$0x2, 0x60(%rsp)
140cf550f:     	leaq	0x28(%rsp), %r8
140cf5514:     	movq	%rsi, %rcx
140cf5517:     	movq	%rdx, %rbx
140cf551a:     	movq	%rdi, %rdx
140cf551d:     	callq	0x14004abc0 <.text+0x49bc0>
140cf5522:     	addq	$0x38, %rsi
140cf5526:     	movq	%rsi, %rcx
140cf5529:     	movq	%rbx, %rdx
140cf552c:     	movq	%rdi, %r8
140cf552f:     	callq	0x14000e640 <.text+0xd640>
140cf5534:     	movq	%rdi, %rax
140cf5537:     	jmp	0x140cf559c <.text+0xcf459c>
140cf5539:     	movq	-0x8(%rdi), %rdx
140cf553d:     	movq	%rdx, 0x90(%rsp)
140cf5545:     	movups	-0x18(%rdi), %xmm0
140cf5549:     	movups	%xmm0, 0x80(%rsp)
140cf5551:     	movups	-0x28(%rdi), %xmm0
140cf5555:     	movups	%xmm0, 0x70(%rsp)
140cf555a:     	movdqu	-0x68(%rdi), %xmm0
140cf555f:     	movdqu	-0x58(%rdi), %xmm1
140cf5564:     	movdqu	-0x48(%rdi), %xmm2
140cf5569:     	movdqu	-0x38(%rdi), %xmm3
140cf556e:     	movdqu	%xmm3, 0x60(%rsp)
140cf5574:     	movdqu	%xmm2, 0x50(%rsp)
140cf557a:     	movdqu	%xmm1, 0x40(%rsp)
140cf5580:     	movdqu	%xmm0, 0x30(%rsp)
140cf5586:     	movq	%rax, 0x28(%rsp)
140cf558b:     	leaq	0x28(%rsp), %rax
140cf5590:     	movq	%rcx, %rdx
140cf5593:     	movq	%rax, %rcx
140cf5596:     	callq	0x144e04c70 <.text+0x4e03c70>
140cf559b:     	nop
140cf559c:     	addq	$0x98, %rsp
140cf55a3:     	popq	%rbx
140cf55a4:     	popq	%rbp
140cf55a5:     	popq	%rdi
140cf55a6:     	popq	%rsi
140cf55a7:     	popq	%r12
140cf55a9:     	popq	%r13
140cf55ab:     	popq	%r14
140cf55ad:     	popq	%r15
140cf55af:     	retq
