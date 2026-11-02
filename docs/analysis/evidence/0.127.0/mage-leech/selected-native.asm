; leech-scalar
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c27310:     	movq	0x60(%rcx), %rax
145c27314:     	testq	%rax, %rax
145c27317:     	je	0x145c27398 <.text+0x5c26398>
145c27319:     	movss	0xcc0(%rcx), %xmm1
145c27321:     	movq	0x58(%rcx), %rdx
145c27325:     	movq	0x8f0(%rcx), %r8
145c2732c:     	movq	0x8f8(%rcx), %r9
145c27333:     	addq	$0xc, %rdx
145c27337:     	movss	0x625771(%rip), %xmm0   # 0x14624cab0
145c2733f:     	jmp	0x145c27359 <.text+0x5c26359>
145c27341:     	nopw	%cs:(%rax,%rax)
145c27350:     	addq	$0x10, %rdx
145c27354:     	decq	%rax
145c27357:     	je	0x145c273a0 <.text+0x5c263a0>
145c27359:     	movss	(%rdx), %xmm2
145c2735d:     	ucomiss	%xmm1, %xmm2
145c27360:     	jbe	0x145c27350 <.text+0x5c26350>
145c27362:     	movq	-0xc(%rdx), %r10
145c27366:     	cmpq	%r9, %r10
145c27369:     	jae	0x145c27350 <.text+0x5c26350>
145c2736b:     	shlq	$0x6, %r10
145c2736f:     	cmpb	$0xf, (%r8,%r10)
145c27374:     	jne	0x145c27350 <.text+0x5c26350>
145c27376:     	addq	%r8, %r10
145c27379:     	cmpb	$0xe, 0x1(%r10)
145c2737e:     	jne	0x145c27350 <.text+0x5c26350>
145c27380:     	movl	-0x4(%rdx), %r11d
145c27384:     	xorps	%xmm2, %xmm2
145c27387:     	cvtsi2ss	%r11, %xmm2
145c2738c:     	mulss	0x4(%r10), %xmm2
145c27392:     	addss	%xmm2, %xmm0
145c27396:     	jmp	0x145c27350 <.text+0x5c26350>
145c27398:     	movss	0x625710(%rip), %xmm0   # 0x14624cab0
145c273a0:     	movzbl	0x354(%rcx), %eax
145c273a7:     	addb	$-0x2, %al
145c273a9:     	cmpb	$0x9, %al
145c273ab:     	ja	0x145c273bd <.text+0x5c263bd>
145c273ad:     	movzbl	%al, %eax
145c273b0:     	leaq	0x17ba099(%rip), %rdx   # 0x1473e1450
145c273b7:     	movq	(%rdx,%rax,8), %rax
145c273bb:     	jmp	0x145c273c4 <.text+0x5c263c4>
145c273bd:     	leaq	0x1415544(%rip), %rax   # 0x14703c908
145c273c4:     	movq	0x8c8(%rcx), %r9
145c273cb:     	movss	0x6256dd(%rip), %xmm1   # 0x14624cab0
145c273d3:     	movaps	%xmm1, %xmm2
145c273d6:     	testq	%r9, %r9
145c273d9:     	je	0x145c2745c <.text+0x5c2645c>
145c273df:     	movq	0x8c0(%rcx), %rdx
145c273e6:     	cmpq	$0x1, %r9
145c273ea:     	jne	0x145c273f9 <.text+0x5c263f9>
145c273ec:     	movss	0x6256bc(%rip), %xmm2   # 0x14624cab0
145c273f4:     	xorl	%r8d, %r8d
145c273f7:     	jmp	0x145c2744e <.text+0x5c2644e>
145c273f9:     	movq	%r9, %r10
145c273fc:     	andq	$-0x2, %r10
145c27400:     	movss	0x6256a8(%rip), %xmm2   # 0x14624cab0
145c27408:     	xorl	%r8d, %r8d
145c2740b:     	jmp	0x145c27419 <.text+0x5c26419>
145c2740d:     	nopl	(%rax)
145c27410:     	addq	$0x2, %r8
145c27414:     	cmpq	%r8, %r10
145c27417:     	je	0x145c27448 <.text+0x5c26448>
145c27419:     	cmpb	$0xe, (%rdx,%r8,8)
145c2741e:     	je	0x145c27430 <.text+0x5c26430>
145c27420:     	cmpb	$0xe, 0x8(%rdx,%r8,8)
145c27426:     	jne	0x145c27410 <.text+0x5c26410>
145c27428:     	jmp	0x145c2743f <.text+0x5c2643f>
145c2742a:     	nopw	(%rax,%rax)
145c27430:     	addss	0x4(%rdx,%r8,8), %xmm2
145c27437:     	cmpb	$0xe, 0x8(%rdx,%r8,8)
145c2743d:     	jne	0x145c27410 <.text+0x5c26410>
145c2743f:     	addss	0xc(%rdx,%r8,8), %xmm2
145c27446:     	jmp	0x145c27410 <.text+0x5c26410>
145c27448:     	testb	$0x1, %r9b
145c2744c:     	je	0x145c2745c <.text+0x5c2645c>
145c2744e:     	cmpb	$0xe, (%rdx,%r8,8)
145c27453:     	jne	0x145c2745c <.text+0x5c2645c>
145c27455:     	addss	0x4(%rdx,%r8,8), %xmm2
145c2745c:     	movss	0x88(%rax), %xmm3
145c27464:     	movq	0x398(%rcx), %rdx
145c2746b:     	testq	%rdx, %rdx
145c2746e:     	je	0x145c27511 <.text+0x5c26511>
145c27474:     	movq	0x390(%rcx), %rax
145c2747b:     	cmpq	$0x1, %rdx
145c2747f:     	jne	0x145c2748d <.text+0x5c2648d>
145c27481:     	movss	0x625627(%rip), %xmm1   # 0x14624cab0
145c27489:     	xorl	%ecx, %ecx
145c2748b:     	jmp	0x145c274fd <.text+0x5c264fd>
145c2748d:     	movq	%rdx, %r8
145c27490:     	andq	$-0x2, %r8
145c27494:     	leaq	0x28(%rax), %r9
145c27498:     	movss	0x625610(%rip), %xmm1   # 0x14624cab0
145c274a0:     	xorl	%ecx, %ecx
145c274a2:     	jmp	0x145c274bd <.text+0x5c264bd>
145c274a4:     	nopw	%cs:(%rax,%rax)
145c274b0:     	addq	$0x2, %rcx
145c274b4:     	addq	$0x30, %r9
145c274b8:     	cmpq	%rcx, %r8
145c274bb:     	je	0x145c274f8 <.text+0x5c264f8>
145c274bd:     	movq	-0x28(%r9), %r10
145c274c1:     	cmpb	$0x12, 0x44(%r10)
145c274c6:     	je	0x145c274e0 <.text+0x5c264e0>
145c274c8:     	movq	-0x10(%r9), %r10
145c274cc:     	cmpb	$0x12, 0x44(%r10)
145c274d1:     	jne	0x145c274b0 <.text+0x5c264b0>
145c274d3:     	jmp	0x145c274f1 <.text+0x5c264f1>
145c274d5:     	nopw	%cs:(%rax,%rax)
145c274e0:     	addss	-0x18(%r9), %xmm1
145c274e6:     	movq	-0x10(%r9), %r10
145c274ea:     	cmpb	$0x12, 0x44(%r10)
145c274ef:     	jne	0x145c274b0 <.text+0x5c264b0>
145c274f1:     	addss	(%r9), %xmm1
145c274f6:     	jmp	0x145c274b0 <.text+0x5c264b0>
145c274f8:     	testb	$0x1, %dl
145c274fb:     	je	0x145c27511 <.text+0x5c26511>
145c274fd:     	leaq	(%rcx,%rcx,2), %rcx
145c27501:     	movq	(%rax,%rcx,8), %rdx
145c27505:     	cmpb	$0x12, 0x44(%rdx)
145c27509:     	jne	0x145c27511 <.text+0x5c26511>
145c2750b:     	addss	0x10(%rax,%rcx,8), %xmm1
145c27511:     	addss	%xmm3, %xmm0
145c27515:     	addss	%xmm2, %xmm0
145c27519:     	addss	%xmm1, %xmm0
145c2751d:     	retq

; leech-health
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c3351d:     	xorps	%xmm9, %xmm9
145c33521:     	ucomiss	%xmm9, %xmm0
145c33525:     	jbe	0x145c3380a <.text+0x5c3280a>
145c3352b:     	mulss	%xmm0, %xmm8
145c33530:     	xorl	%eax, %eax
145c33532:     	cmpb	$0x5, 0x36f(%rdi)
145c33539:     	setae	%al
145c3353c:     	leaq	0x17aa635(%rip), %rcx   # 0x1473ddb78
145c33543:     	mulss	(%rcx,%rax,4), %xmm8
145c33549:     	movss	0x4c8(%rdi), %xmm7
145c33551:     	movss	0x538(%rdi), %xmm1
145c33559:     	addss	%xmm1, %xmm8
145c3355e:     	movaps	%xmm8, %xmm2
145c33562:     	minss	%xmm7, %xmm2
145c33566:     	movaps	%xmm2, %xmm0
145c33569:     	cmpunordss	%xmm2, %xmm0
145c3356e:     	andps	%xmm0, %xmm8
145c33572:     	andnps	%xmm2, %xmm0
145c33575:     	orps	%xmm8, %xmm0
145c33579:     	movss	%xmm0, 0x538(%rdi)
145c33581:     	movaps	%xmm0, %xmm8
145c33585:     	subss	%xmm1, %xmm8
145c3358a:     	ucomiss	%xmm8, %xmm9
145c3358e:     	jae	0x145c3363b <.text+0x5c3263b>

; run-admission
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c32335:     	cmpb	$0x1, 0xd83(%rcx)
145c3233c:     	jne	0x145c36705 <.text+0x5c35705>
145c32342:     	movaps	%xmm2, %xmm6
145c32345:     	movq	%rcx, %rdi

; actor-admission-full-amount
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c32a58:     	testq	%r14, %r14
145c32a5b:     	je	0x145c36705 <.text+0x5c35705>
145c32a61:     	xorl	%r15d, %r15d
145c32a64:     	jmp	0x145c32a80 <.text+0x5c31a80>
145c32a66:     	nopw	%cs:(%rax,%rax)
145c32a70:     	addq	$0x1f8, %r15            # imm = 0x1F8
145c32a77:     	cmpq	%r15, %rbx
145c32a7a:     	je	0x145c36705 <.text+0x5c35705>
145c32a80:     	cmpq	%rdx, 0xf0(%r12,%r15)
145c32a88:     	jne	0x145c32a70 <.text+0x5c31a70>
145c32a8a:     	cmpl	$0x1, 0xb0(%r12,%r15)
145c32a93:     	je	0x145c32a70 <.text+0x5c31a70>
145c32a95:     	maxss	0x600422(%rip), %xmm8   # 0x146232ec0
145c32a9e:     	movss	0x178(%r12,%r15), %xmm3
145c32aa8:     	movss	0x1b0(%r12,%r15), %xmm2
145c32ab2:     	xorps	%xmm1, %xmm1
145c32ab5:     	movaps	%xmm3, %xmm0
145c32ab8:     	maxss	%xmm1, %xmm0
145c32abc:     	subss	%xmm8, %xmm3
145c32ac1:     	movss	%xmm3, 0x178(%r12,%r15)

; scalar-call
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c33515:     	movq	%rdi, %rcx
145c33518:     	callq	0x145c27310 <.text+0x5c26310>

; leech-meter
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145c33594:     	movb	$0x0, 0x235(%rbp)
145c3359b:     	leaq	0x17ab91e(%rip), %r14   # 0x1473deec0
145c335a2:     	movl	$0x5, %esi
145c335a7:     	movl	$0x5, %edx
145c335ac:     	movq	%r14, %rcx
145c335af:     	callq	0x145be82d0 <.text+0x5be72d0>
145c335b4:     	nop
145c335b5:     	testq	%rax, %rax
145c335b8:     	cmovneq	%rax, %r14
145c335bc:     	cmoveq	%rsi, %rdx
145c335c0:     	movq	$-0x1, 0x1a0(%rbp)
145c335cb:     	movq	%r14, 0x1a8(%rbp)
145c335d2:     	movq	%rdx, 0x1b0(%rbp)
145c335d9:     	leaq	0x17ab8e5(%rip), %rax   # 0x1473deec5
145c335e0:     	movq	%rax, 0x1b8(%rbp)
145c335e7:     	movq	$0x18, 0x1c0(%rbp)
145c335f2:     	movb	$0x0, 0x1c8(%rbp)
145c335f9:     	leaq	0x750(%rdi), %rcx
145c33600:     	xorps	%xmm2, %xmm2
145c33603:     	cvtss2sd	%xmm8, %xmm2
145c33608:     	movb	$0x0, 0x235(%rbp)
145c3360f:     	movq	$0x0, 0x20(%rsp)
145c33618:     	leaq	0x1a0(%rbp), %rdx
145c3361f:     	movl	$0x8, %r9d
145c33625:     	callq	0x145c9e440 <.text+0x5c9d440>
145c3362a:     	nop
