AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458c0250:     	pushq	%rbp
1458c0251:     	pushq	%rsi
1458c0252:     	pushq	%rdi
1458c0253:     	pushq	%rbx
1458c0254:     	subq	$0x198, %rsp            # imm = 0x198
1458c025b:     	leaq	0x80(%rsp), %rbp
1458c0263:     	movaps	%xmm7, 0x100(%rbp)
1458c026a:     	movaps	%xmm6, 0xf0(%rbp)
1458c0271:     	movq	$-0x2, 0xe8(%rbp)
1458c027c:     	movl	%ecx, %esi
1458c027e:     	movl	%ecx, 0x8c(%rbp)
1458c0284:     	movl	0x27443ae(%rip), %eax   # 0x148004638
1458c028a:     	testl	%eax, %eax
1458c028c:     	je	0x1458c076d <.text+0x58bf76d>
1458c0292:     	leaq	0xa0(%rbp), %rcx
1458c0299:     	callq	0x145a36150 <.text+0x5a35150>
1458c029e:     	movq	0xa0(%rbp), %rax
1458c02a5:     	xorl	%r8d, %r8d
1458c02a8:     	cmpq	$-0x1, %rax
1458c02ac:     	movl	$0x1, %edx
1458c02b1:     	cmovneq	0xa8(%rbp), %rdx
1458c02b9:     	cmoveq	%r8, %rax
1458c02bd:     	movq	%rax, 0xe0(%rbp)
1458c02c4:     	cmovneq	0xb0(%rbp), %r8
1458c02cc:     	leaq	0x50(%rbp), %rcx
1458c02d0:     	movq	%rdx, 0xd8(%rbp)
1458c02d7:     	callq	0x145aa6bf0 <.text+0x5aa5bf0>
1458c02dc:     	nop
1458c02dd:     	movq	0x50(%rbp), %rbx
1458c02e1:     	leaq	0x58(%rbp), %rcx
1458c02e5:     	cmpq	$-0x1, %rbx
1458c02e9:     	je	0x1458c0726 <.text+0x58bf726>
1458c02ef:     	movq	0x10(%rcx), %rax
1458c02f3:     	movq	%rax, 0x48(%rbp)
1458c02f7:     	movdqu	(%rcx), %xmm0
1458c02fb:     	movdqu	%xmm0, 0x38(%rbp)
1458c0300:     	movq	%rbx, 0x30(%rbp)
1458c0304:     	movq	0xe0(%rbp), %rdx
1458c030b:     	testq	%rdx, %rdx
1458c030e:     	je	0x1458c0323 <.text+0x58bf323>
1458c0310:     	movl	$0x1, %r8d
1458c0316:     	movq	0xd8(%rbp), %rcx
1458c031d:     	callq	0x1400021d0 <.text+0x11d0>
1458c0322:     	nop
1458c0323:     	leaq	0x12fe1d7(%rip), %r8    # 0x146bbe501
1458c032a:     	leaq	0xa0(%rbp), %rcx
1458c0331:     	leaq	0x30(%rbp), %rdx
1458c0335:     	movl	$0x17, %r9d
1458c033b:     	callq	0x145aa7f80 <.text+0x5aa6f80>
1458c0340:     	nop
1458c0341:     	movq	0xa0(%rbp), %r10
1458c0348:     	leaq	0xa8(%rbp), %rdi
1458c034f:     	cmpq	$-0x1, %r10
1458c0353:     	movq	%rbx, 0x98(%rbp)
1458c035a:     	je	0x1458c083d <.text+0x58bf83d>
1458c0360:     	movq	0xa8(%rbp), %r11
1458c0367:     	movq	0xb0(%rbp), %rax
1458c036e:     	cmpq	$0x14, %rax
1458c0372:     	jb	0x1458c0911 <.text+0x58bf911>
1458c0378:     	cmpl	$0x43424457, (%r11)     # imm = 0x43424457
1458c037f:     	jne	0x1458c0911 <.text+0x58bf911>
1458c0385:     	movl	0x4(%r11), %edx
1458c0389:     	movl	0xc(%r11), %ecx
1458c038d:     	movl	0x10(%r11), %r9d
1458c0391:     	movl	%ecx, %r8d
1458c0394:     	imull	%edx, %r8d
1458c0398:     	addq	%r8, %r9
1458c039b:     	addq	$0x14, %r9
1458c039f:     	cmpq	%r9, %rax
1458c03a2:     	jb	0x1458c0955 <.text+0x58bf955>
1458c03a8:     	addq	$0x14, %r8
1458c03ac:     	movl	0x8(%r11), %r9d
1458c03b0:     	movq	%r11, 0xa8(%rbp)
1458c03b7:     	movq	%rax, 0xb0(%rbp)
1458c03be:     	movq	%r8, 0xb8(%rbp)
1458c03c5:     	movl	%edx, 0xc0(%rbp)
1458c03cb:     	movl	%r9d, 0xc4(%rbp)
1458c03d2:     	movl	%ecx, 0xc8(%rbp)
1458c03d8:     	movq	0xa8(%rbp), %rax
1458c03df:     	movq	%rax, 0x8(%rbp)
1458c03e3:     	movq	0xb0(%rbp), %rax
1458c03ea:     	movq	%rax, 0x10(%rbp)
1458c03ee:     	movq	0xb8(%rbp), %rax
1458c03f5:     	movq	%rax, 0x18(%rbp)
1458c03f9:     	movl	0xc0(%rbp), %eax
1458c03ff:     	movl	%eax, 0x20(%rbp)
1458c0402:     	movl	0xc4(%rbp), %eax
1458c0408:     	movl	%eax, 0x24(%rbp)
1458c040b:     	movq	0xc8(%rbp), %rax
1458c0412:     	movq	%rax, 0x28(%rbp)
1458c0416:     	movq	%r10, (%rbp)
1458c041a:     	leaq	0x12fe0f7(%rip), %r8    # 0x146bbe518
1458c0421:     	leaq	0xa0(%rbp), %rcx
1458c0428:     	leaq	0x30(%rbp), %rdx
1458c042c:     	movl	$0x1b, %r9d
1458c0432:     	callq	0x145aa7f80 <.text+0x5aa6f80>
1458c0437:     	nop
1458c0438:     	movq	0xa0(%rbp), %r10
1458c043f:     	cmpq	$-0x1, %r10
1458c0443:     	je	0x1458c0848 <.text+0x58bf848>
1458c0449:     	movq	0xa8(%rbp), %r11
1458c0450:     	movq	0xb0(%rbp), %rax
1458c0457:     	cmpq	$0x14, %rax
1458c045b:     	jb	0x1458c0933 <.text+0x58bf933>
1458c0461:     	cmpl	$0x43424457, (%r11)     # imm = 0x43424457
1458c0468:     	jne	0x1458c0933 <.text+0x58bf933>
1458c046e:     	movl	0x4(%r11), %edx
1458c0472:     	movl	0xc(%r11), %ecx
1458c0476:     	movl	0x10(%r11), %r9d
1458c047a:     	movl	%ecx, %r8d
1458c047d:     	imull	%edx, %r8d
1458c0481:     	addq	%r8, %r9
1458c0484:     	addq	$0x14, %r9
1458c0488:     	cmpq	%r9, %rax
1458c048b:     	jb	0x1458c09b4 <.text+0x58bf9b4>
1458c0491:     	addq	$0x14, %r8
1458c0495:     	movl	0x8(%r11), %r9d
1458c0499:     	movq	%r11, 0xa8(%rbp)
1458c04a0:     	movq	%rax, 0xb0(%rbp)
1458c04a7:     	movq	%r8, 0xb8(%rbp)
1458c04ae:     	movl	%edx, 0xc0(%rbp)
1458c04b4:     	movl	%r9d, 0xc4(%rbp)
1458c04bb:     	movl	%ecx, 0xc8(%rbp)
1458c04c1:     	movq	0xb8(%rbp), %rax
1458c04c8:     	movq	%rax, -0x18(%rbp)
1458c04cc:     	movl	0xc0(%rbp), %eax
1458c04d2:     	movl	%eax, -0x10(%rbp)
1458c04d5:     	movl	0xc4(%rbp), %eax
1458c04db:     	movl	%eax, -0xc(%rbp)
1458c04de:     	movq	0xa8(%rbp), %rax
1458c04e5:     	movq	%rax, -0x28(%rbp)
1458c04e9:     	movq	0xb0(%rbp), %rax
1458c04f0:     	movq	%rax, -0x20(%rbp)
1458c04f4:     	movq	0xc8(%rbp), %rax
1458c04fb:     	movq	%rax, -0x8(%rbp)
1458c04ff:     	movq	%r10, -0x30(%rbp)
1458c0503:     	movl	-0x10(%rbp), %eax
1458c0506:     	movl	$0x0, 0x58(%rbp)
1458c050d:     	movl	%eax, 0x5c(%rbp)
1458c0510:     	leaq	-0x30(%rbp), %rax
1458c0514:     	movq	%rax, 0x50(%rbp)
1458c0518:     	xorl	%ecx, %ecx
1458c051a:     	callq	0x143d98020 <.text+0x3d97020>
1458c051f:     	nop
1458c0520:     	movdqu	(%rax), %xmm0
1458c0524:     	incq	(%rax)
1458c0527:     	movups	0x12f2e52(%rip), %xmm6  # 0x146bb3380
1458c052e:     	movaps	%xmm6, 0xb0(%rbp)
1458c0535:     	movups	0x12f2e34(%rip), %xmm7  # 0x146bb3370
1458c053c:     	movaps	%xmm7, 0xa0(%rbp)
1458c0543:     	movdqa	%xmm0, 0xc0(%rbp)
1458c054b:     	leaq	0xa0(%rbp), %rcx
1458c0552:     	leaq	0x50(%rbp), %rdx
1458c0556:     	callq	0x1458b9140 <.text+0x58b8140>
1458c055b:     	nop
1458c055c:     	movdqa	0xa0(%rbp), %xmm0
1458c0564:     	movdqa	0xb0(%rbp), %xmm1
1458c056c:     	movdqa	0xc0(%rbp), %xmm2
1458c0574:     	movdqa	%xmm2, -0x40(%rbp)
1458c0579:     	movdqa	%xmm1, -0x50(%rbp)
1458c057e:     	movdqa	%xmm0, -0x60(%rbp)
1458c0583:     	movl	0x20(%rbp), %edi
1458c0586:     	xorl	%ecx, %ecx
1458c0588:     	callq	0x143d98020 <.text+0x3d97020>
1458c058d:     	nop
1458c058e:     	movdqu	(%rax), %xmm0
1458c0592:     	incq	(%rax)
1458c0595:     	movaps	%xmm6, 0xb0(%rbp)
1458c059c:     	movaps	%xmm7, 0xa0(%rbp)
1458c05a3:     	movdqa	%xmm0, 0xc0(%rbp)
1458c05ab:     	testl	%edi, %edi
1458c05ad:     	jne	0x1458c0a13 <.text+0x58bfa13>
1458c05b3:     	movq	%rbp, %rax
1458c05b6:     	movq	%rax, 0x50(%rbp)
1458c05ba:     	leaq	-0x60(%rbp), %rax
1458c05be:     	movq	%rax, 0x58(%rbp)
1458c05c2:     	movl	$0x0, 0x60(%rbp)
1458c05c9:     	movl	%edi, 0x64(%rbp)
1458c05cc:     	leaq	0x50(%rbp), %rcx
1458c05d0:     	leaq	0xa0(%rbp), %rdx
1458c05d7:     	callq	0x1459b2e30 <.text+0x59b1e30>
1458c05dc:     	nop
1458c05dd:     	movdqa	0xa0(%rbp), %xmm0
1458c05e5:     	movdqa	0xb0(%rbp), %xmm1
1458c05ed:     	movdqa	0xc0(%rbp), %xmm2
1458c05f5:     	movdqa	%xmm2, 0x70(%rbp)
1458c05fa:     	movdqa	%xmm1, 0x60(%rbp)
1458c05ff:     	movdqa	%xmm0, 0x50(%rbp)
1458c0604:     	movl	0x274402e(%rip), %eax   # 0x148004638
1458c060a:     	testl	%eax, %eax
1458c060c:     	jne	0x1458c0a32 <.text+0x58bfa32>
1458c0612:     	movq	0x50(%rbp), %rax
1458c0616:     	testq	%rax, %rax
1458c0619:     	je	0x1458c0654 <.text+0x58bf654>
1458c061b:     	movq	0x78(%rbp), %rcx
1458c061f:     	movq	%rcx, 0xc8(%rbp)
1458c0626:     	movdqu	0x58(%rbp), %xmm0
1458c062b:     	movdqu	0x68(%rbp), %xmm1
1458c0630:     	movdqu	%xmm1, 0xb8(%rbp)
1458c0638:     	movdqu	%xmm0, 0xa8(%rbp)
1458c0640:     	movq	%rax, 0xa0(%rbp)
1458c0647:     	leaq	0xa0(%rbp), %rcx
1458c064e:     	callq	0x1405d2cc0 <.text+0x5d1cc0>
1458c0653:     	nop
1458c0654:     	movq	-0x58(%rbp), %rdx
1458c0658:     	testq	%rdx, %rdx
1458c065b:     	je	0x1458c0688 <.text+0x58bf688>
1458c065d:     	leaq	(%rdx,%rdx,2), %rax
1458c0661:     	leaq	0x27(,%rax,8), %rax
1458c0669:     	andq	$-0x10, %rax
1458c066d:     	addq	%rax, %rdx
1458c0670:     	addq	$0x11, %rdx
1458c0674:     	je	0x1458c0688 <.text+0x58bf688>
1458c0676:     	movq	-0x60(%rbp), %rcx
1458c067a:     	subq	%rax, %rcx
1458c067d:     	movl	$0x10, %r8d
1458c0683:     	callq	0x1400021d0 <.text+0x11d0>
1458c0688:     	movq	-0x30(%rbp), %rdx
1458c068c:     	testq	%rdx, %rdx
1458c068f:     	je	0x1458c06a0 <.text+0x58bf6a0>
1458c0691:     	movq	-0x28(%rbp), %rcx
1458c0695:     	movl	$0x1, %r8d
1458c069b:     	callq	0x1400021d0 <.text+0x11d0>
1458c06a0:     	movq	(%rbp), %rdx
1458c06a4:     	testq	%rdx, %rdx
1458c06a7:     	je	0x1458c06b8 <.text+0x58bf6b8>
1458c06a9:     	movq	0x8(%rbp), %rcx
1458c06ad:     	movl	$0x1, %r8d
1458c06b3:     	callq	0x1400021d0 <.text+0x11d0>
1458c06b8:     	movq	0x40(%rbp), %rax
1458c06bc:     	movq	%rax, 0xd8(%rbp)
1458c06c3:     	testq	%rax, %rax
1458c06c6:     	je	0x1458c074e <.text+0x58bf74e>
1458c06cc:     	movq	0x38(%rbp), %rdi
1458c06d0:     	movq	0xd8(%rbp), %rbx
1458c06d7:     	negq	%rbx
1458c06da:     	movl	$0x1, %ecx
1458c06df:     	movq	%rdi, 0x90(%rbp)
1458c06e6:     	jmp	0x1458c070b <.text+0x58bf70b>
1458c06e8:     	nopl	(%rax,%rax)
1458c06f0:     	movq	0xe0(%rbp), %rcx
1458c06f7:     	leaq	(%rbx,%rcx), %rax
1458c06fb:     	incq	%rax
1458c06fe:     	incq	%rcx
1458c0701:     	addq	$0x8, %rdi
1458c0705:     	cmpq	$0x1, %rax
1458c0709:     	je	0x1458c074e <.text+0x58bf74e>
1458c070b:     	movq	%rcx, 0xe0(%rbp)
1458c0712:     	movq	(%rdi), %rax
1458c0715:     	lock
1458c0716:     	decq	(%rax)
1458c0719:     	jne	0x1458c06f0 <.text+0x58bf6f0>
1458c071b:     	movq	%rdi, %rcx
1458c071e:     	callq	0x145a41300 <.text+0x5a40300>
1458c0723:     	nop
1458c0724:     	jmp	0x1458c06f0 <.text+0x58bf6f0>
1458c0726:     	callq	0x145b6c710 <.text+0x5b6b710>
1458c072b:     	nop
1458c072c:     	movq	0xe0(%rbp), %rdx
1458c0733:     	testq	%rdx, %rdx
1458c0736:     	je	0x1458c08f5 <.text+0x58bf8f5>
1458c073c:     	movl	$0x1, %r8d
1458c0742:     	movq	0xd8(%rbp), %rcx
1458c0749:     	jmp	0x1458c08f0 <.text+0x58bf8f0>
1458c074e:     	movq	0x98(%rbp), %rdx
1458c0755:     	testq	%rdx, %rdx
1458c0758:     	je	0x1458c076d <.text+0x58bf76d>
1458c075a:     	movq	0x38(%rbp), %rcx
1458c075e:     	shlq	$0x3, %rdx
1458c0762:     	movl	$0x8, %r8d
1458c0768:     	callq	0x1400021d0 <.text+0x11d0>
1458c076d:     	movl	0x2743ec5(%rip), %ecx   # 0x148004638
1458c0773:     	xorl	%eax, %eax
1458c0775:     	testl	%ecx, %ecx
1458c0777:     	jne	0x1458c08f7 <.text+0x58bf8f7>
1458c077d:     	cmpq	$0x0, 0x2743e9b(%rip)   # 0x148004620
1458c0785:     	je	0x1458c08f7 <.text+0x58bf8f7>
1458c078b:     	leaq	0x2743e96(%rip), %rcx   # 0x148004628
1458c0792:     	leaq	0x8c(%rbp), %rdx
1458c0799:     	callq	0x140d8aa00 <.text+0xd89a00>
1458c079e:     	movq	%rax, %rcx
1458c07a1:     	shrq	$0x39, %rcx
1458c07a5:     	movq	0x2743e64(%rip), %r8    # 0x148004610
1458c07ac:     	movq	0x2743e55(%rip), %rdx   # 0x148004608
1458c07b3:     	movd	%ecx, %xmm0
1458c07b7:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1458c07bb:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1458c07c0:     	pshufd	$0x44, %xmm0, %xmm0     # xmm0 = xmm0[0,1,0,1]
1458c07c5:     	xorl	%ecx, %ecx
1458c07c7:     	pcmpeqd	%xmm1, %xmm1
1458c07cb:     	xorl	%r9d, %r9d
1458c07ce:     	andq	%r8, %rax
1458c07d1:     	movdqu	(%rdx,%rax), %xmm2
1458c07d6:     	movdqa	%xmm2, %xmm3
1458c07da:     	pcmpeqb	%xmm0, %xmm3
1458c07de:     	pmovmskb	%xmm3, %r10d
1458c07e3:     	testl	%r10d, %r10d
1458c07e6:     	je	0x1458c080e <.text+0x58bf80e>
1458c07e8:     	tzcntl	%r10d, %r11d
1458c07ed:     	addq	%rax, %r11
1458c07f0:     	andq	%r8, %r11
1458c07f3:     	negq	%r11
1458c07f6:     	leaq	(%r11,%r11,8), %r11
1458c07fa:     	cmpl	-0x48(%rdx,%r11,8), %esi
1458c07ff:     	je	0x1458c0829 <.text+0x58bf829>
1458c0801:     	leal	-0x1(%r10), %r11d
1458c0805:     	andw	%r10w, %r11w
1458c0809:     	movl	%r11d, %r10d
1458c080c:     	jne	0x1458c07e8 <.text+0x58bf7e8>
1458c080e:     	pcmpeqb	%xmm1, %xmm2
1458c0812:     	pmovmskb	%xmm2, %r10d
1458c0817:     	testl	%r10d, %r10d
1458c081a:     	jne	0x1458c082d <.text+0x58bf82d>
1458c081c:     	addq	%r9, %rax
1458c081f:     	addq	$0x10, %rax
1458c0823:     	addq	$0x10, %r9
1458c0827:     	jmp	0x1458c07ce <.text+0x58bf7ce>
1458c0829:     	leaq	(%rdx,%r11,8), %rcx
1458c082d:     	leaq	-0x40(%rcx), %rax
1458c0831:     	testq	%rcx, %rcx
1458c0834:     	cmoveq	%rcx, %rax
1458c0838:     	jmp	0x1458c08f7 <.text+0x58bf8f7>
1458c083d:     	movq	%rdi, %rcx
1458c0840:     	callq	0x145b6c710 <.text+0x5b6b710>
1458c0845:     	nop
1458c0846:     	jmp	0x1458c0869 <.text+0x58bf869>
1458c0848:     	movq	%rdi, %rcx
1458c084b:     	callq	0x145b6c710 <.text+0x5b6b710>
1458c0850:     	nop
1458c0851:     	movq	(%rbp), %rdx
1458c0855:     	testq	%rdx, %rdx
1458c0858:     	je	0x1458c0869 <.text+0x58bf869>
1458c085a:     	movq	0x8(%rbp), %rcx
1458c085e:     	movl	$0x1, %r8d
1458c0864:     	callq	0x1400021d0 <.text+0x11d0>
1458c0869:     	movq	0x40(%rbp), %rax
1458c086d:     	movq	%rax, 0xd8(%rbp)
1458c0874:     	testq	%rax, %rax
1458c0877:     	je	0x1458c08d6 <.text+0x58bf8d6>
1458c0879:     	movq	0x38(%rbp), %rsi
1458c087d:     	movq	0xd8(%rbp), %rdi
1458c0884:     	negq	%rdi
1458c0887:     	movl	$0x1, %ecx
1458c088c:     	movq	%rsi, 0x90(%rbp)
1458c0893:     	jmp	0x1458c08bb <.text+0x58bf8bb>
1458c0895:     	nopw	%cs:(%rax,%rax)
1458c08a0:     	movq	0xe0(%rbp), %rcx
1458c08a7:     	leaq	(%rdi,%rcx), %rax
1458c08ab:     	incq	%rax
1458c08ae:     	incq	%rcx
1458c08b1:     	addq	$0x8, %rsi
1458c08b5:     	cmpq	$0x1, %rax
1458c08b9:     	je	0x1458c08d6 <.text+0x58bf8d6>
1458c08bb:     	movq	%rcx, 0xe0(%rbp)
1458c08c2:     	movq	(%rsi), %rax
1458c08c5:     	lock
1458c08c6:     	decq	(%rax)
1458c08c9:     	jne	0x1458c08a0 <.text+0x58bf8a0>
1458c08cb:     	movq	%rsi, %rcx
1458c08ce:     	callq	0x145a41300 <.text+0x5a40300>
1458c08d3:     	nop
1458c08d4:     	jmp	0x1458c08a0 <.text+0x58bf8a0>
1458c08d6:     	movq	0x98(%rbp), %rdx
1458c08dd:     	testq	%rdx, %rdx
1458c08e0:     	je	0x1458c08f5 <.text+0x58bf8f5>
1458c08e2:     	movq	0x38(%rbp), %rcx
1458c08e6:     	shlq	$0x3, %rdx
1458c08ea:     	movl	$0x8, %r8d
1458c08f0:     	callq	0x1400021d0 <.text+0x11d0>
1458c08f5:     	xorl	%eax, %eax
1458c08f7:     	movaps	0xf0(%rbp), %xmm6
1458c08fe:     	movaps	0x100(%rbp), %xmm7
1458c0905:     	addq	$0x198, %rsp            # imm = 0x198
1458c090c:     	popq	%rbx
1458c090d:     	popq	%rdi
1458c090e:     	popq	%rsi
1458c090f:     	popq	%rbp
1458c0910:     	retq
1458c0911:     	movq	%r11, 0xd8(%rbp)
1458c0918:     	movq	%r10, 0xe0(%rbp)
1458c091f:     	leaq	0x12e03ed(%rip), %rcx   # 0x146ba0d13
1458c0926:     	movl	$0xf, %edx
1458c092b:     	callq	0x145d4cf00 <.text+0x5d4bf00>
1458c0930:     	nop
1458c0931:     	jmp	0x1458c0975 <.text+0x58bf975>
1458c0933:     	movq	%r11, 0xd8(%rbp)
1458c093a:     	movq	%r10, 0xe0(%rbp)
1458c0941:     	leaq	0x12e03cb(%rip), %rcx   # 0x146ba0d13
1458c0948:     	movl	$0xf, %edx
1458c094d:     	callq	0x145d4cf00 <.text+0x5d4bf00>
1458c0952:     	nop
1458c0953:     	jmp	0x1458c09d4 <.text+0x58bf9d4>
1458c0955:     	movq	%r11, 0xd8(%rbp)
1458c095c:     	movq	%r10, 0xe0(%rbp)
1458c0963:     	leaq	0x12e0396(%rip), %rcx   # 0x146ba0d00
1458c096a:     	movl	$0x13, %edx
1458c096f:     	callq	0x145d4cf00 <.text+0x5d4bf00>
1458c0974:     	nop
1458c0975:     	movq	%rax, 0xa8(%rbp)
1458c097c:     	movq	$-0x1, 0xa0(%rbp)
1458c0987:     	movq	0xe0(%rbp), %rdx
1458c098e:     	testq	%rdx, %rdx
1458c0991:     	movq	0xd8(%rbp), %rcx
1458c0998:     	je	0x1458c09a6 <.text+0x58bf9a6>
1458c099a:     	movl	$0x1, %r8d
1458c09a0:     	callq	0x1400021d0 <.text+0x11d0>
1458c09a5:     	nop
1458c09a6:     	movq	%rdi, %rcx
1458c09a9:     	callq	0x145b6c710 <.text+0x5b6b710>
1458c09ae:     	nop
1458c09af:     	jmp	0x1458c0869 <.text+0x58bf869>
1458c09b4:     	movq	%r11, 0xd8(%rbp)
1458c09bb:     	movq	%r10, 0xe0(%rbp)
1458c09c2:     	leaq	0x12e0337(%rip), %rcx   # 0x146ba0d00
1458c09c9:     	movl	$0x13, %edx
1458c09ce:     	callq	0x145d4cf00 <.text+0x5d4bf00>
1458c09d3:     	nop
1458c09d4:     	movq	%rax, 0xa8(%rbp)
1458c09db:     	movq	$-0x1, 0xa0(%rbp)
1458c09e6:     	movq	0xe0(%rbp), %rdx
1458c09ed:     	testq	%rdx, %rdx
1458c09f0:     	movq	0xd8(%rbp), %rcx
1458c09f7:     	je	0x1458c0a05 <.text+0x58bfa05>
1458c09f9:     	movl	$0x1, %r8d
1458c09ff:     	callq	0x1400021d0 <.text+0x11d0>
1458c0a04:     	nop
1458c0a05:     	movq	%rdi, %rcx
1458c0a08:     	callq	0x145b6c710 <.text+0x5b6b710>
1458c0a0d:     	nop
1458c0a0e:     	jmp	0x1458c0851 <.text+0x58bf851>
1458c0a13:     	leaq	0xc0(%rbp), %r8
1458c0a1a:     	leaq	0xa0(%rbp), %rcx
1458c0a21:     	movq	%rdi, %rdx
1458c0a24:     	movb	$0x1, %r9b
1458c0a27:     	callq	0x145d4da10 <.text+0x5d4ca10>
1458c0a2c:     	nop
1458c0a2d:     	jmp	0x1458c05b3 <.text+0x58bf5b3>
1458c0a32:     	leaq	0x50(%rbp), %rcx
1458c0a36:     	callq	0x145d4d231 <.text+0x5d4c231>
1458c0a3b:     	nop
1458c0a3c:     	jmp	0x1458c0612 <.text+0x58bf612>
