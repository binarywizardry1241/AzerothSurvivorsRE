
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458df590:     	movq	0x10(%rdx), %rax
1458df594:     	testq	%rax, %rax
1458df597:     	je	0x1458df6bd <.text+0x58de6bd>
1458df59d:     	movq	0x8(%rdx), %r9
1458df5a1:     	shlq	$0x4, %rax
1458df5a5:     	leaq	(%rax,%rax,2), %rax
1458df5a9:     	addq	$-0x30, %rax
1458df5ad:     	addq	$0x54, %r9
1458df5b1:     	jmp	0x1458df5d2 <.text+0x58de5d2>
1458df5b3:     	nopw	%cs:(%rax,%rax)
1458df5c0:     	addq	$-0x30, %rax
1458df5c4:     	addq	$0x30, %r9
1458df5c8:     	cmpq	$-0x30, %rax
1458df5cc:     	je	0x1458df6bd <.text+0x58de6bd>
1458df5d2:     	cmpl	%r8d, -0x44(%r9)
1458df5d6:     	jne	0x1458df5c0 <.text+0x58de5c0>
1458df5d8:     	movl	-0x34(%r9), %r10d
1458df5dc:     	testl	%r10d, %r10d
1458df5df:     	je	0x1458df5c0 <.text+0x58de5c0>
1458df5e1:     	decl	%r10d
1458df5e4:     	cvtsi2ss	%r10, %xmm0
1458df5e9:     	movss	-0x3c(%r9), %xmm2
1458df5ef:     	movl	-0x30(%r9), %edx
1458df5f3:     	cmpl	$0x1, %edx
1458df5f6:     	adcl	$-0x1, %edx
1458df5f9:     	mulss	%xmm2, %xmm0
1458df5fd:     	cvtsi2ss	%rdx, %xmm1
1458df602:     	addss	-0x38(%r9), %xmm0
1458df608:     	mulss	%xmm2, %xmm1
1458df60c:     	testq	%rax, %rax
1458df60f:     	je	0x1458df714 <.text+0x58de714>
1458df615:     	movabsq	$-0x5555555555555555, %rdx # imm = 0xAAAAAAAAAAAAAAAB
1458df61f:     	mulq	%rdx
1458df622:     	shrq	$0x5, %rdx
1458df626:     	jmp	0x1458df63d <.text+0x58de63d>
1458df628:     	nopl	(%rax,%rax)
1458df630:     	addq	$0x30, %r9
1458df634:     	decq	%rdx
1458df637:     	je	0x1458df714 <.text+0x58de714>
1458df63d:     	movl	-0x4(%r9), %eax
1458df641:     	cmpl	%r8d, -0x14(%r9)
1458df645:     	sete	%r10b
1458df649:     	testl	%eax, %eax
1458df64b:     	setne	%r11b
1458df64f:     	andb	%r10b, %r11b
1458df652:     	cmpb	$0x1, %r11b
1458df656:     	jne	0x1458df630 <.text+0x58de630>
1458df658:     	decl	%eax
1458df65a:     	xorps	%xmm2, %xmm2
1458df65d:     	cvtsi2ss	%rax, %xmm2
1458df662:     	movss	-0xc(%r9), %xmm3
1458df668:     	mulss	%xmm3, %xmm2
1458df66c:     	addss	-0x8(%r9), %xmm2
1458df672:     	movl	(%r9), %eax
1458df675:     	cmpl	$0x1, %eax
1458df678:     	adcl	$-0x1, %eax
1458df67b:     	movaps	%xmm0, %xmm4
1458df67e:     	unpcklps	%xmm2, %xmm4            # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
1458df681:     	movaps	%xmm4, %xmm5
1458df684:     	psrad	$0x1f, %xmm5
1458df689:     	psrld	$0x1, %xmm5
1458df68e:     	pxor	%xmm4, %xmm5
1458df692:     	pshufd	$0x55, %xmm5, %xmm4     # xmm4 = xmm5[1,1,1,1]
1458df697:     	pcmpgtd	%xmm4, %xmm5
1458df69b:     	movd	%xmm5, %r10d
1458df6a0:     	testb	$0x1, %r10b
1458df6a4:     	jne	0x1458df630 <.text+0x58de630>
1458df6a6:     	xorps	%xmm0, %xmm0
1458df6a9:     	cvtsi2ss	%rax, %xmm0
1458df6ae:     	mulss	%xmm0, %xmm3
1458df6b2:     	movaps	%xmm3, %xmm1
1458df6b5:     	movaps	%xmm2, %xmm0
1458df6b8:     	jmp	0x1458df630 <.text+0x58de630>
1458df6bd:     	cmpl	0x134(%rdx), %r8d
1458df6c4:     	jne	0x1458df6dd <.text+0x58de6dd>
1458df6c6:     	movss	0xa4(%rdx), %xmm0
1458df6ce:     	ucomiss	%xmm3, %xmm0
1458df6d1:     	jbe	0x1458df6dd <.text+0x58de6dd>
1458df6d3:     	movss	0x138(%rdx), %xmm1
1458df6db:     	jmp	0x1458df714 <.text+0x58de714>
1458df6dd:     	cmpl	$0x76, %r8d
1458df6e1:     	jne	0x1458df6fa <.text+0x58de6fa>
1458df6e3:     	movss	0x140(%rdx), %xmm0
1458df6eb:     	ucomiss	%xmm3, %xmm0
1458df6ee:     	jbe	0x1458df6fa <.text+0x58de6fa>
1458df6f0:     	movss	0x48df58(%rip), %xmm1   # 0x145d6d650
1458df6f8:     	jmp	0x1458df714 <.text+0x58de714>
1458df6fa:     	movss	0x144(%rdx), %xmm0
1458df702:     	xorl	%eax, %eax
1458df704:     	ucomiss	%xmm3, %xmm0
1458df707:     	jbe	0x1458df723 <.text+0x58de723>
1458df709:     	movaps	%xmm0, %xmm1
1458df70c:     	subss	0x148(%rdx), %xmm1
1458df714:     	movss	%xmm0, 0x4(%rcx)
1458df719:     	movss	%xmm1, 0x8(%rcx)
1458df71e:     	movl	$0x1, %eax
1458df723:     	movl	%eax, (%rcx)
1458df725:     	movq	%rcx, %rax
1458df728:     	retq
1458df729:     	int3
1458df72a:     	int3
1458df72b:     	int3
1458df72c:     	int3
1458df72d:     	int3
1458df72e:     	int3
1458df72f:     	int3
