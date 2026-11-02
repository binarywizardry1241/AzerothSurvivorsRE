
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547c301:     	movq	0x318(%rbp), %rax
14547c308:     	testq	%rax, %rax
14547c30b:     	je	0x14547c327 <.text+0x547b327>
14547c30d:     	shlq	$0x3, %rax
14547c311:     	leaq	(%rax,%rax,2), %rdx
14547c315:     	movl	$0x8, %r8d
14547c31b:     	movq	0x280(%rbp), %rcx
14547c322:     	callq	0x1400021d0 <.text+0x11d0>
14547c327:     	movq	$0x0, 0x2c0(%rbp)
14547c332:     	movq	$0x8, 0x2c8(%rbp)
14547c33d:     	movq	$0x0, 0x2d0(%rbp)
14547c348:     	movq	0x338(%rbp), %rax
14547c34f:     	movq	0x528(%rax), %rcx
14547c356:     	movq	0x530(%rax), %rax
14547c35d:     	leaq	(%rax,%rax,8), %rax
14547c361:     	leaq	(%rcx,%rax,8), %rdx
14547c365:     	xorl	%ebx, %ebx
14547c367:     	leaq	0x2c0(%rbp), %rdi
14547c36e:     	movss	0x42c239(%rip), %xmm10  # 0x1458a85b0
14547c377:     	xorl	%r14d, %r14d
14547c37a:     	movq	%rdx, 0x300(%rbp)
14547c381:     	cmpq	%rdx, %rcx
14547c384:     	jne	0x14547c3c0 <.text+0x547b3c0>
14547c386:     	jmp	0x14547c445 <.text+0x547b445>
14547c38b:     	nopl	(%rax,%rax)
14547c390:     	movsd	0x34(%rcx), %xmm0
14547c395:     	subps	%xmm7, %xmm0
14547c398:     	mulps	%xmm0, %xmm0
14547c39b:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14547c39f:     	addss	%xmm0, %xmm1
14547c3a3:     	xorps	%xmm0, %xmm0
14547c3a6:     	sqrtss	%xmm1, %xmm0
14547c3aa:     	ucomiss	%xmm0, %xmm10
14547c3ae:     	jae	0x14547c3f9 <.text+0x547b3f9>
14547c3b0:     	addq	$0x48, %rcx
14547c3b4:     	incq	%r14
14547c3b7:     	cmpq	%rdx, %rcx
14547c3ba:     	je	0x14547c445 <.text+0x547b445>
14547c3c0:     	movl	0x20(%rcx), %eax
14547c3c3:     	testl	%eax, %eax
14547c3c5:     	je	0x14547c3ec <.text+0x547b3ec>
14547c3c7:     	cmpl	$0x1, %eax
14547c3ca:     	jne	0x14547c390 <.text+0x547b390>
14547c3cc:     	movsd	0x34(%rcx), %xmm0
14547c3d1:     	subps	%xmm7, %xmm0
14547c3d4:     	mulps	%xmm0, %xmm0
14547c3d7:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14547c3db:     	addss	%xmm0, %xmm1
14547c3df:     	xorps	%xmm0, %xmm0
14547c3e2:     	sqrtss	%xmm1, %xmm0
14547c3e6:     	ucomiss	%xmm0, %xmm9
14547c3ea:     	jae	0x14547c3f9 <.text+0x547b3f9>
14547c3ec:     	cmpl	$0x1, 0x18(%rcx)
14547c3f0:     	jne	0x14547c3b0 <.text+0x547b3b0>
14547c3f2:     	ucomiss	0x1c(%rcx), %xmm8
14547c3f7:     	jb	0x14547c3b0 <.text+0x547b3b0>
14547c3f9:     	movq	%rcx, 0x280(%rbp)
14547c400:     	cmpq	0x2c0(%rbp), %rbx
14547c407:     	jne	0x14547c412 <.text+0x547b412>
14547c409:     	movq	%rdi, %rcx
14547c40c:     	callq	0x145717ba0 <.text+0x5716ba0>
14547c411:     	nop
14547c412:     	movq	0x280(%rbp), %rcx
14547c419:     	addq	$0x48, %rcx
14547c41d:     	movq	0x2c8(%rbp), %rax
14547c424:     	movq	%r14, (%rax,%rbx,8)
14547c428:     	incq	%r14
14547c42b:     	incq	%rbx
14547c42e:     	movq	%rbx, 0x2d0(%rbp)
14547c435:     	movq	0x300(%rbp), %rdx
14547c43c:     	cmpq	%rdx, %rcx
14547c43f:     	jne	0x14547c3c0 <.text+0x547b3c0>
14547c445:     	movq	%rcx, 0x280(%rbp)
14547c44c:     	movq	0x2c0(%rbp), %rax
14547c453:     	movq	%rax, 0x70(%rbp)
14547c457:     	movq	0x2c8(%rbp), %rax
14547c45e:     	movq	%rax, 0x328(%rbp)
14547c465:     	leaq	(%rax,%rbx,8), %r15
14547c469:     	leaq	0x1634dc8(%rip), %r13   # 0x146ab1238
14547c470:     	xorps	%xmm7, %xmm7
14547c473:     	movl	$0x498, %edi            # imm = 0x498
14547c478:     	movss	0x42e603(%rip), %xmm8   # 0x1458aaa84
14547c481:     	jmp	0x14547c4d0 <.text+0x547b4d0>
14547c483:     	movl	%r14d, %eax
14547c486:     	xorps	%xmm0, %xmm0
14547c489:     	cvtsi2ss	%rax, %xmm0
14547c48e:     	movq	0x338(%rbp), %rsi
14547c495:     	mulss	0x474(%rsi), %xmm0
14547c49d:     	callq	0x145714a5d <.text+0x5713a5d>
14547c4a2:     	maxss	0x42bf76(%rip), %xmm0   # 0x1458a8420
14547c4aa:     	cvttss2si	%xmm0, %rdx
14547c4af:     	ucomiss	%xmm7, %xmm0
14547c4b2:     	movl	$0x0, %eax
14547c4b7:     	cmovbl	%eax, %edx
14547c4ba:     	ucomiss	%xmm13, %xmm0
14547c4be:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14547c4c3:     	cmoval	%eax, %edx
14547c4c6:     	movq	%rsi, %rcx
14547c4c9:     	callq	0x14548ac90 <.text+0x5489c90>
14547c4ce:     	nop
14547c4cf:     	nop
14547c4d0:     	cmpq	%r15, 0x328(%rbp)
14547c4d7:     	je	0x14547c96d <.text+0x547b96d>
14547c4dd:     	movq	-0x8(%r15), %r12
14547c4e1:     	movq	0x338(%rbp), %rax
14547c4e8:     	movq	0x530(%rax), %rdx
14547c4ef:     	cmpq	%rdx, %r12
14547c4f2:     	jae	0x1454814fb <.text+0x54804fb>
14547c4f8:     	addq	$-0x8, %r15
14547c4fc:     	movq	0x528(%rax), %rax
14547c503:     	leaq	(%r12,%r12,8), %rcx
14547c507:     	movl	0x20(%rax,%rcx,8), %ebx
14547c50b:     	movl	0x24(%rax,%rcx,8), %r14d
14547c510:     	cmpl	$0x2, %ebx
14547c513:     	jne	0x14547c590 <.text+0x547b590>
14547c515:     	movq	0x338(%rbp), %rcx
14547c51c:     	cmpb	$0x0, 0x944(%rcx)
14547c523:     	je	0x14547c580 <.text+0x547b580>
14547c525:     	cmpb	$0x0, 0x945(%rcx)
14547c52c:     	movb	$0x1, 0x945(%rcx)
14547c533:     	jne	0x14547c4d0 <.text+0x547b4d0>
14547c535:     	movl	$0x1e, %edx
14547c53a:     	leaq	0x163387f(%rip), %rcx   # 0x146aafdc0
14547c541:     	callq	0x14541f0e0 <.text+0x541e0e0>
14547c546:     	nop
14547c547:     	movq	%rdx, %r8
14547c54a:     	testq	%rax, %rax
14547c54d:     	leaq	0x163386c(%rip), %rcx   # 0x146aafdc0
14547c554:     	cmoveq	%rcx, %rax
14547c558:     	movl	$0x1e, %ecx
14547c55d:     	cmoveq	%rcx, %r8
14547c561:     	movq	0x338(%rbp), %rcx
14547c568:     	movq	%rax, %rdx
14547c56b:     	callq	0x1454a6e80 <.text+0x54a5e80>
14547c570:     	nop
14547c571:     	jmp	0x14547c4d0 <.text+0x547b4d0>
14547c576:     	nopw	%cs:(%rax,%rax)
14547c580:     	callq	0x1454a81a0 <.text+0x54a71a0>
14547c585:     	nop
14547c586:     	testb	%al, %al
14547c588:     	je	0x14547c4d0 <.text+0x547b4d0>
14547c58e:     	nop
14547c590:     	movq	0x338(%rbp), %rcx
14547c597:     	movq	%r12, %rdx
14547c59a:     	callq	0x1454a5d50 <.text+0x54a4d50>
14547c59f:     	nop
14547c5a0:     	movl	%ebx, %eax
14547c5a2:     	movslq	(%r13,%rax,4), %rax
14547c5a7:     	addq	%r13, %rax
14547c5aa:     	jmpq	*%rax
14547c5ac:     	movq	0x338(%rbp), %rcx
14547c5b3:     	movl	%ebx, %edx
14547c5b5:     	callq	0x1454a8680 <.text+0x54a7680>
14547c5ba:     	nop
14547c5bb:     	jmp	0x14547c4d0 <.text+0x547b4d0>
14547c5c0:     	callq	0x140002200 <.text+0x1200>
14547c5c5:     	movl	$0x20, %ecx
14547c5ca:     	movl	$0x1, %edx
14547c5cf:     	callq	0x1400021c0 <.text+0x11c0>
14547c5d4:     	testq	%rax, %rax
14547c5d7:     	je	0x145481700 <.text+0x5480700>
14547c5dd:     	movq	%rax, 0x318(%rbp)
14547c5e4:     	movl	$0x4b4, (%rax)          # imm = 0x4B4
14547c5ea:     	movq	0x338(%rbp), %rax
14547c5f1:     	movq	0x548(%rax), %rsi
14547c5f8:     	cmpq	0x538(%rax), %rsi
14547c5ff:     	jne	0x14547c60e <.text+0x547b60e>
14547c601:     	movq	0x320(%rbp), %rcx
14547c608:     	callq	0x145717d60 <.text+0x5716d60>
14547c60d:     	nop
14547c60e:     	movq	0x338(%rbp), %rdx
14547c615:     	movq	0x540(%rdx), %rax
14547c61c:     	movq	%rsi, %rcx
14547c61f:     	shlq	$0x5, %rcx
14547c623:     	movq	$0x20, (%rax,%rcx)
14547c62b:     	movq	0x318(%rbp), %r8
14547c632:     	movq	%r8, 0x8(%rax,%rcx)
14547c637:     	movq	$0x4, 0x10(%rax,%rcx)
14547c640:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
14547c647:     	incq	%rsi
14547c64a:     	movq	%rsi, 0x548(%rdx)
14547c651:     	cmpb	$0x1, 0x94e(%rdx)
14547c658:     	jne	0x14547c4d0 <.text+0x547b4d0>
14547c65e:     	movq	0x338(%rbp), %rax
14547c665:     	cmpl	$0x0, 0x8e0(%rax)
14547c66c:     	je	0x14547c4d0 <.text+0x547b4d0>
14547c672:     	movq	0x338(%rbp), %rax
14547c679:     	cmpb	$0x0, 0x947(%rax)
14547c680:     	jne	0x14547c4d0 <.text+0x547b4d0>
14547c686:     	movq	0x338(%rbp), %rcx
14547c68d:     	movb	$0x1, %dl
14547c68f:     	movb	$0x1, %r8b
14547c692:     	callq	0x1454af2b0 <.text+0x54ae2b0>
14547c697:     	nop
