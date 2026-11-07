
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455244e0:     	subq	$0x38, %rsp
1455244e4:     	movaps	%xmm6, 0x20(%rsp)
1455244e9:     	movq	0x60(%rsp), %rax
1455244ee:     	cmpq	%r9, %rax
1455244f1:     	jae	0x14552460c <.text+0x552360c>
1455244f7:     	movq	%rdx, %r10
1455244fa:     	leaq	0x1(%rax), %rdx
1455244fe:     	cmpq	%r9, %rdx
145524501:     	jae	0x145524620 <.text+0x5523620>
145524507:     	movl	(%r8,%rax,4), %r11d
14552450b:     	movl	0x4(%r8,%rax,4), %edx
145524510:     	cmpl	%r11d, %edx
145524513:     	jb	0x1455245f8 <.text+0x55235f8>
145524519:     	cmpq	%rdx, %r10
14552451c:     	jb	0x1455245f8 <.text+0x55235f8>
145524522:     	xorl	%eax, %eax
145524524:     	cmpl	%edx, %r11d
145524527:     	je	0x145524585 <.text+0x5523585>
145524529:     	movss	0x68(%rsp), %xmm1
14552452f:     	leaq	(%rcx,%rdx,8), %r9
145524533:     	leaq	(%rcx,%r11,8), %r8
145524537:     	leaq	(,%r11,8), %r10
14552453f:     	leaq	(,%rdx,8), %rcx
145524547:     	subq	%r10, %rcx
14552454a:     	addq	$-0x8, %rcx
14552454e:     	movaps	0x3f122b(%rip), %xmm2   # 0x145915780
145524555:     	movss	0x1219973(%rip), %xmm3  # 0x14673ded0
14552455d:     	nopl	(%rax)
145524560:     	leaq	0x8(%r8), %rdx
145524564:     	movss	0x4(%r8), %xmm0
14552456a:     	movaps	%xmm0, %xmm4
14552456d:     	subss	%xmm1, %xmm4
145524571:     	andps	%xmm2, %xmm4
145524574:     	ucomiss	%xmm4, %xmm3
145524577:     	jae	0x14552458f <.text+0x552358f>
145524579:     	addq	$-0x8, %rcx
14552457d:     	movq	%rdx, %r8
145524580:     	cmpq	%r9, %rdx
145524583:     	jne	0x145524560 <.text+0x5523560>
145524585:     	movaps	0x20(%rsp), %xmm6
14552458a:     	addq	$0x38, %rsp
14552458e:     	retq
14552458f:     	movl	$0x1, %eax
145524594:     	cmpq	%r9, %rdx
145524597:     	je	0x145524585 <.text+0x5523585>
145524599:     	shrq	$0x3, %rcx
14552459d:     	xorl	%edx, %edx
14552459f:     	jmp	0x1455245be <.text+0x55235be>
1455245a1:     	nopw	%cs:(%rax,%rax)
1455245b0:     	movaps	%xmm6, %xmm0
1455245b3:     	movaps	%xmm5, %xmm4
1455245b6:     	incq	%rdx
1455245b9:     	cmpq	%rdx, %rcx
1455245bc:     	je	0x145524585 <.text+0x5523585>
1455245be:     	movss	0xc(%r8,%rdx,8), %xmm6
1455245c5:     	movaps	%xmm6, %xmm5
1455245c8:     	subss	%xmm1, %xmm5
1455245cc:     	andps	%xmm2, %xmm5
1455245cf:     	ucomiss	%xmm5, %xmm3
1455245d2:     	jb	0x1455245b6 <.text+0x55235b6>
1455245d4:     	movd	%xmm4, %r9d
1455245d9:     	movd	%xmm5, %r10d
1455245de:     	movl	%r9d, %r11d
1455245e1:     	sarl	$0x1f, %r11d
1455245e5:     	shrl	%r11d
1455245e8:     	xorl	%r9d, %r11d
1455245eb:     	cmpl	%r10d, %r11d
1455245ee:     	jg	0x1455245b0 <.text+0x55235b0>
1455245f0:     	movaps	%xmm4, %xmm5
1455245f3:     	movaps	%xmm0, %xmm6
1455245f6:     	jmp	0x1455245b0 <.text+0x55235b0>
1455245f8:     	leaq	0x18105b1(%rip), %r9    # 0x146d34bb0
1455245ff:     	movq	%r11, %rcx
145524602:     	movq	%r10, %r8
145524605:     	callq	0x145903d40 <.text+0x5902d40>
14552460a:     	ud2
14552460c:     	leaq	0x181056d(%rip), %r8    # 0x146d34b80
145524613:     	movq	%rax, %rcx
145524616:     	movq	%r9, %rdx
145524619:     	callq	0x145903b33 <.text+0x5902b33>
14552461e:     	ud2
145524620:     	leaq	0x1810571(%rip), %r8    # 0x146d34b98
145524627:     	movq	%rdx, %rcx
14552462a:     	movq	%r9, %rdx
14552462d:     	callq	0x145903b33 <.text+0x5902b33>
145524632:     	ud2
