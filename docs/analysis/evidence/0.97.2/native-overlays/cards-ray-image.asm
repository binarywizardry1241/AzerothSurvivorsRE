
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1400da210:     	pushq	%rbp
1400da211:     	pushq	%r14
1400da213:     	pushq	%rsi
1400da214:     	pushq	%rdi
1400da215:     	pushq	%rbx
1400da216:     	subq	$0x290, %rsp            # imm = 0x290
1400da21d:     	leaq	0x80(%rsp), %rbp
1400da225:     	movaps	%xmm15, 0x200(%rbp)
1400da22d:     	movaps	%xmm14, 0x1f0(%rbp)
1400da235:     	movaps	%xmm13, 0x1e0(%rbp)
1400da23d:     	movaps	%xmm12, 0x1d0(%rbp)
1400da245:     	movaps	%xmm11, 0x1c0(%rbp)
1400da24d:     	movaps	%xmm10, 0x1b0(%rbp)
1400da255:     	movaps	%xmm9, 0x1a0(%rbp)
1400da25d:     	movaps	%xmm8, 0x190(%rbp)
1400da265:     	movaps	%xmm7, 0x180(%rbp)
1400da26c:     	movaps	%xmm6, 0x170(%rbp)
1400da273:     	movq	$-0x2, 0x168(%rbp)
1400da27e:     	movq	0x20(%rdx), %rax
1400da282:     	movq	%rax, 0x110(%rbp)
1400da289:     	movups	(%rdx), %xmm0
1400da28c:     	movups	0x10(%rdx), %xmm1
1400da290:     	movaps	%xmm1, 0x100(%rbp)
1400da297:     	movaps	%xmm0, 0xf0(%rbp)
1400da29e:     	movups	(%r8), %xmm0
1400da2a2:     	movups	0x10(%r8), %xmm1
1400da2a7:     	movups	%xmm0, 0x118(%rbp)
1400da2ae:     	movups	%xmm1, 0x128(%rbp)
1400da2b5:     	callq	0x140002200 <.text+0x1200>
1400da2ba:     	movl	$0x400000, %ecx         # imm = 0x400000
1400da2bf:     	movl	$0x1, %edx
1400da2c4:     	callq	0x1400021c0 <.text+0x11c0>
1400da2c9:     	testq	%rax, %rax
1400da2cc:     	je	0x1400da5d9 <.text+0xd95d9>
1400da2d2:     	movq	%rax, %rsi
1400da2d5:     	movq	$0x400000, 0x138(%rbp)  # imm = 0x400000
1400da2e0:     	movq	%rax, 0x140(%rbp)
1400da2e7:     	movl	$0x400000, %r8d         # imm = 0x400000
1400da2ed:     	movq	%rax, %rcx
1400da2f0:     	movb	$-0x1, %dl
1400da2f2:     	callq	0x145756dcb <.text+0x5755dcb>
1400da2f7:     	movq	$0x400000, 0x148(%rbp)  # imm = 0x400000
1400da302:     	addq	$0x3, %rsi
1400da306:     	xorl	%edi, %edi
1400da308:     	movss	0x5811177(%rip), %xmm8  # 0x1458eb488
1400da311:     	movss	0x5822b22(%rip), %xmm9  # 0x1458fce3c
1400da31a:     	movss	0x5822b1e(%rip), %xmm6  # 0x1458fce40
1400da322:     	xorps	%xmm11, %xmm11
1400da326:     	movss	0x58225f1(%rip), %xmm12 # 0x1458fc920
1400da32f:     	movss	0x5822b14(%rip), %xmm13 # 0x1458fce4c
1400da338:     	movss	0x581113f(%rip), %xmm14 # 0x1458eb480
1400da341:     	movss	0x5822afa(%rip), %xmm15 # 0x1458fce44
1400da34a:     	movss	0x5822af5(%rip), %xmm10 # 0x1458fce48
1400da353:     	jmp	0x1400da377 <.text+0xd9377>
1400da355:     	nopw	%cs:(%rax,%rax)
1400da360:     	incq	%rdi
1400da363:     	addq	$0x1000, %rsi           # imm = 0x1000
1400da36a:     	cmpq	$0x400, %rdi            # imm = 0x400
1400da371:     	je	0x1400da465 <.text+0xd9465>
1400da377:     	testq	%rdi, %rdi
1400da37a:     	js	0x1400da390 <.text+0xd9390>
1400da37c:     	xorps	%xmm7, %xmm7
1400da37f:     	cvtsi2ss	%rdi, %xmm7
1400da384:     	jmp	0x1400da3aa <.text+0xd93aa>
1400da386:     	nopw	%cs:(%rax,%rax)
1400da390:     	movq	%rdi, %rax
1400da393:     	shrq	%rax
1400da396:     	movl	%edi, %ecx
1400da398:     	andl	$0x1, %ecx
1400da39b:     	orq	%rax, %rcx
1400da39e:     	xorps	%xmm7, %xmm7
1400da3a1:     	cvtsi2ss	%rcx, %xmm7
1400da3a6:     	addss	%xmm7, %xmm7
1400da3aa:     	addss	%xmm8, %xmm7
1400da3af:     	addss	%xmm9, %xmm7
1400da3b4:     	xorps	0x581eb95(%rip), %xmm7  # 0x1458f8f50
1400da3bb:     	xorl	%ebx, %ebx
1400da3bd:     	jmp	0x1400da3fc <.text+0xd93fc>
1400da3bf:     	nop
1400da3c0:     	divss	%xmm12, %xmm1
1400da3c5:     	movaps	%xmm1, %xmm0
1400da3c8:     	leaq	0x1(%rbx), %r14
1400da3cc:     	mulss	%xmm13, %xmm0
1400da3d1:     	callq	0x145756e1f <.text+0x5755e1f>
1400da3d6:     	xorps	%xmm1, %xmm1
1400da3d9:     	maxss	%xmm0, %xmm1
1400da3dd:     	movaps	%xmm13, %xmm0
1400da3e1:     	minss	%xmm1, %xmm0
1400da3e5:     	cvttss2si	%xmm0, %eax
1400da3e9:     	movb	%al, (%rsi,%rbx,4)
1400da3ec:     	movq	%r14, %rbx
1400da3ef:     	cmpq	$0x400, %r14            # imm = 0x400
1400da3f6:     	je	0x1400da360 <.text+0xd9360>
1400da3fc:     	xorps	%xmm0, %xmm0
1400da3ff:     	cvtsi2ss	%ebx, %xmm0
1400da403:     	addss	%xmm8, %xmm0
1400da408:     	addss	%xmm9, %xmm0
1400da40d:     	movaps	%xmm7, %xmm1
1400da410:     	callq	0x145756e37 <.text+0x5755e37>
1400da415:     	movaps	%xmm6, %xmm1
1400da418:     	callq	0x145756e3d <.text+0x5755e3d>
1400da41d:     	movaps	%xmm0, %xmm2
1400da420:     	addss	%xmm6, %xmm2
1400da424:     	movaps	%xmm0, %xmm1
1400da427:     	cmpltss	%xmm11, %xmm1
1400da42d:     	andps	%xmm1, %xmm2
1400da430:     	andnps	%xmm0, %xmm1
1400da433:     	orps	%xmm2, %xmm1
1400da436:     	ucomiss	%xmm1, %xmm12
1400da43a:     	ja	0x1400da3c0 <.text+0xd93c0>
1400da43c:     	ucomiss	%xmm1, %xmm15
1400da440:     	movaps	%xmm14, %xmm0
1400da444:     	ja	0x1400da3c8 <.text+0xd93c8>
1400da446:     	xorps	%xmm0, %xmm0
1400da449:     	ucomiss	%xmm1, %xmm10
1400da44d:     	jbe	0x1400da3c8 <.text+0xd93c8>
1400da453:     	movaps	%xmm10, %xmm0
1400da457:     	subss	%xmm1, %xmm0
1400da45b:     	divss	%xmm12, %xmm0
1400da460:     	jmp	0x1400da3c8 <.text+0xd93c8>
1400da465:     	leaq	-0x40(%rbp), %r14
1400da469:     	leaq	0x138(%rbp), %r9
1400da470:     	movq	%r14, %rcx
1400da473:     	movl	$0x400, %edx            # imm = 0x400
1400da478:     	movl	$0x400, %r8d            # imm = 0x400
1400da47e:     	callq	0x1422899a0 <.text+0x22889a0>
1400da483:     	movl	0x134(%rbp), %eax
1400da489:     	movq	0x128(%rbp), %rcx
1400da490:     	movl	%eax, (%rcx)
1400da492:     	movq	0x118(%rbp), %rsi
1400da499:     	movq	0x50(%rsi), %rcx
1400da49d:     	addq	$0x10, %rcx
1400da4a1:     	movb	$0x1, 0x167(%rbp)
1400da4a8:     	callq	0x144966220 <.text+0x4965220>
1400da4ad:     	nop
1400da4ae:     	movl	%eax, %edi
1400da4b0:     	movl	%edx, %ebx
1400da4b2:     	movb	$0x0, 0x167(%rbp)
1400da4b9:     	movq	%r14, 0x20(%rsp)
1400da4be:     	leaq	0x154(%rbp), %rcx
1400da4c5:     	movq	%rsi, %rdx
1400da4c8:     	movl	%eax, %r8d
1400da4cb:     	movl	%ebx, %r9d
1400da4ce:     	callq	0x1400bdbe0 <.text+0xbcbe0>
1400da4d3:     	nop
1400da4d4:     	cmpl	$0x2, 0x154(%rbp)
1400da4db:     	jne	0x1400da596 <.text+0xd9596>
1400da4e1:     	movq	$-0x1, 0xa0(%rbp)
1400da4ec:     	movb	$0x0, 0x167(%rbp)
1400da4f3:     	leaq	0xa0(%rbp), %rax
1400da4fa:     	movq	%rax, 0x20(%rsp)
1400da4ff:     	movq	$0x0, 0x28(%rsp)
1400da508:     	movq	%rsi, %rcx
1400da50b:     	movl	%edi, %edx
1400da50d:     	movl	%ebx, %r8d
1400da510:     	xorl	%r9d, %r9d
1400da513:     	callq	0x144978da0 <.text+0x4977da0>
1400da518:     	nop
1400da519:     	movb	$0x0, 0xa0(%rbp)
1400da520:     	movq	%rax, 0xa8(%rbp)
1400da527:     	leaq	0xf0(%rbp), %rcx
1400da52e:     	leaq	0xa0(%rbp), %rdx
1400da535:     	callq	0x1401e37a0 <.text+0x1e27a0>
1400da53a:     	movaps	0x170(%rbp), %xmm6
1400da541:     	movaps	0x180(%rbp), %xmm7
1400da548:     	movaps	0x190(%rbp), %xmm8
1400da550:     	movaps	0x1a0(%rbp), %xmm9
1400da558:     	movaps	0x1b0(%rbp), %xmm10
1400da560:     	movaps	0x1c0(%rbp), %xmm11
1400da568:     	movaps	0x1d0(%rbp), %xmm12
1400da570:     	movaps	0x1e0(%rbp), %xmm13
1400da578:     	movaps	0x1f0(%rbp), %xmm14
1400da580:     	movaps	0x200(%rbp), %xmm15
1400da588:     	addq	$0x290, %rsp            # imm = 0x290
1400da58f:     	popq	%rbx
1400da590:     	popq	%rdi
1400da591:     	popq	%rsi
1400da592:     	popq	%r14
1400da594:     	popq	%rbp
1400da595:     	retq
1400da596:     	movups	0x154(%rbp), %xmm0
1400da59d:     	movaps	%xmm0, 0xa0(%rbp)
1400da5a4:     	movb	$0x0, 0x167(%rbp)
1400da5ab:     	leaq	0x5822fae(%rip), %rax   # 0x1458fd560
1400da5b2:     	movq	%rax, 0x20(%rsp)
1400da5b7:     	leaq	0x582382a(%rip), %rcx   # 0x1458fdde8
1400da5be:     	leaq	0x5823803(%rip), %r9    # 0x1458fddc8
1400da5c5:     	leaq	0xa0(%rbp), %r8
1400da5cc:     	movl	$0x2b, %edx
1400da5d1:     	callq	0x1458e7530 <.text+0x58e6530>
1400da5d6:     	nop
1400da5d7:     	ud2
1400da5d9:     	movl	$0x1, %ecx
1400da5de:     	movl	$0x400000, %edx         # imm = 0x400000
1400da5e3:     	callq	0x1458e721b <.text+0x58e621b>
1400da5e8:     	ud2
