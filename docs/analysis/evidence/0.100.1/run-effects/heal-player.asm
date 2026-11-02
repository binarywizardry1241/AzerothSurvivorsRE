
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a54c0:     	pushq	%rbp
1454a54c1:     	pushq	%r15
1454a54c3:     	pushq	%r14
1454a54c5:     	pushq	%rsi
1454a54c6:     	pushq	%rdi
1454a54c7:     	pushq	%rbx
1454a54c8:     	subq	$0xb8, %rsp
1454a54cf:     	leaq	0x80(%rsp), %rbp
1454a54d7:     	movaps	%xmm8, 0x20(%rbp)
1454a54dc:     	movaps	%xmm7, 0x10(%rbp)
1454a54e0:     	movaps	%xmm6, (%rbp)
1454a54e4:     	movq	$-0x2, -0x8(%rbp)
1454a54ec:     	movaps	%xmm1, %xmm7
1454a54ef:     	movq	%rcx, %rsi
1454a54f2:     	movss	0x418(%rcx), %xmm0
1454a54fa:     	addss	%xmm0, %xmm1
1454a54fe:     	movaps	%xmm1, %xmm2
1454a5501:     	minss	0x470(%rcx), %xmm2
1454a5509:     	movl	%r8d, %edi
1454a550c:     	movaps	%xmm2, %xmm6
1454a550f:     	cmpunordss	%xmm2, %xmm6
1454a5514:     	andps	%xmm6, %xmm1
1454a5517:     	andnps	%xmm2, %xmm6
1454a551a:     	orps	%xmm1, %xmm6
1454a551d:     	movss	%xmm6, 0x418(%rcx)
1454a5525:     	subss	%xmm0, %xmm6
1454a5529:     	movaps	%xmm6, %xmm1
1454a552c:     	callq	0x1454a53b0 <.text+0x54a43b0>
1454a5531:     	testl	%edi, %edi
1454a5533:     	je	0x1454a56b0 <.text+0x54a46b0>
1454a5539:     	xorps	%xmm1, %xmm1
1454a553c:     	movaps	%xmm6, %xmm0
1454a553f:     	maxss	%xmm1, %xmm0
1454a5543:     	subss	%xmm6, %xmm7
1454a5547:     	maxss	%xmm1, %xmm7
1454a554b:     	ucomiss	%xmm1, %xmm7
1454a554e:     	jbe	0x1454a55d4 <.text+0x54a45d4>
1454a5554:     	movq	0x710(%rsi), %rcx
1454a555b:     	movq	0x718(%rsi), %rdx
1454a5562:     	shlq	$0x6, %rdx
1454a5566:     	xorl	%eax, %eax
1454a5568:     	xorl	%r8d, %r8d
1454a556b:     	nopl	(%rax,%rax)
1454a5570:     	cmpq	%r8, %rdx
1454a5573:     	je	0x1454a5596 <.text+0x54a4596>
1454a5575:     	leaq	0x40(%r8), %r9
1454a5579:     	cmpb	$0x14, (%rcx,%r8)
1454a557e:     	movq	%r9, %r8
1454a5581:     	jne	0x1454a5570 <.text+0x54a4570>
1454a5583:     	movss	-0x3c(%rcx,%r9), %xmm2
1454a558a:     	movl	$0x1, %eax
1454a558f:     	cmpl	$0x1, %eax
1454a5592:     	je	0x1454a559b <.text+0x54a459b>
1454a5594:     	jmp	0x1454a55d4 <.text+0x54a45d4>
1454a5596:     	cmpl	$0x1, %eax
1454a5599:     	jne	0x1454a55d4 <.text+0x54a45d4>
1454a559b:     	mulss	0x470(%rsi), %xmm2
1454a55a3:     	movss	0x41c(%rsi), %xmm3
1454a55ab:     	ucomiss	%xmm3, %xmm2
1454a55ae:     	jbe	0x1454a55d4 <.text+0x54a45d4>
1454a55b0:     	addss	%xmm7, %xmm3
1454a55b4:     	movaps	%xmm3, %xmm4
1454a55b7:     	minss	%xmm2, %xmm4
1454a55bb:     	movaps	%xmm4, %xmm2
1454a55be:     	cmpunordss	%xmm4, %xmm2
1454a55c3:     	andps	%xmm2, %xmm3
1454a55c6:     	andnps	%xmm4, %xmm2
1454a55c9:     	orps	%xmm3, %xmm2
1454a55cc:     	movss	%xmm2, 0x41c(%rsi)
1454a55d4:     	addss	%xmm7, %xmm0
1454a55d8:     	ucomiss	%xmm1, %xmm0
1454a55db:     	jbe	0x1454a561f <.text+0x54a461f>
1454a55dd:     	movq	0x710(%rsi), %rax
1454a55e4:     	movq	0x718(%rsi), %rcx
1454a55eb:     	shlq	$0x6, %rcx
1454a55ef:     	xorl	%edx, %edx
1454a55f1:     	nopw	%cs:(%rax,%rax)
1454a5600:     	cmpq	%rdx, %rcx
1454a5603:     	je	0x1454a561f <.text+0x54a461f>
1454a5605:     	cmpb	$0x15, (%rax,%rdx)
1454a5609:     	leaq	0x40(%rdx), %rdx
1454a560d:     	jne	0x1454a5600 <.text+0x54a4600>
1454a560f:     	addss	0x120(%rsi), %xmm0
1454a5617:     	movss	%xmm0, 0x120(%rsi)
1454a561f:     	ucomiss	0x461e6a(%rip), %xmm6   # 0x145907490
1454a5626:     	jb	0x1454a56b0 <.text+0x54a46b0>
1454a562c:     	cvttss2si	%xmm6, %rax
1454a5631:     	xorl	%ecx, %ecx
1454a5633:     	xorps	%xmm0, %xmm0
1454a5636:     	ucomiss	%xmm0, %xmm6
1454a5639:     	cmovael	%eax, %ecx
1454a563c:     	movq	0x3e8(%rsi), %rdx
1454a5643:     	ucomiss	0x461ee2(%rip), %xmm6   # 0x14590752c
1454a564a:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454a564f:     	cmovbel	%ecx, %eax
1454a5652:     	movl	%eax, 0x20(%rsp)
1454a5656:     	movb	$0x0, 0x28(%rsp)
1454a565b:     	leaq	-0x30(%rbp), %rcx
1454a565f:     	movq	%rdx, %r8
1454a5662:     	movl	%edi, %r9d
1454a5665:     	callq	0x14545d980 <.text+0x545c980>
1454a566a:     	movq	0x560(%rsi), %rdi
1454a5671:     	cmpq	0x550(%rsi), %rdi
1454a5678:     	jne	0x1454a5687 <.text+0x54a4687>
1454a567a:     	leaq	0x550(%rsi), %rcx
1454a5681:     	callq	0x145774710 <.text+0x5773710>
1454a5686:     	nop
1454a5687:     	movq	0x558(%rsi), %rax
1454a568e:     	movq	%rdi, %rcx
1454a5691:     	shlq	$0x5, %rcx
1454a5695:     	movups	-0x30(%rbp), %xmm0
1454a5699:     	movups	-0x20(%rbp), %xmm1
1454a569d:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a56a2:     	movups	%xmm0, (%rax,%rcx)
1454a56a6:     	incq	%rdi
1454a56a9:     	movq	%rdi, 0x560(%rsi)
1454a56b0:     	movss	0x418(%rsi), %xmm0
1454a56b8:     	movss	0x470(%rsi), %xmm6
1454a56c0:     	xorps	%xmm7, %xmm7
1454a56c3:     	maxss	%xmm7, %xmm0
1454a56c7:     	callq	0x14577327d <.text+0x577227d>
1454a56cc:     	cvttss2si	%xmm0, %rbx
1454a56d1:     	xorl	%r14d, %r14d
1454a56d4:     	ucomiss	%xmm7, %xmm0
1454a56d7:     	cmovbl	%r14d, %ebx
1454a56db:     	movss	0x461e48(%rip), %xmm8   # 0x14590752c
1454a56e4:     	ucomiss	%xmm8, %xmm0
1454a56e8:     	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
1454a56ee:     	cmoval	%r15d, %ebx
1454a56f2:     	movaps	%xmm6, %xmm0
1454a56f5:     	callq	0x14577327d <.text+0x577227d>
1454a56fa:     	cvttss2si	%xmm0, %rdi
1454a56ff:     	ucomiss	%xmm7, %xmm0
1454a5702:     	cmovbl	%r14d, %edi
1454a5706:     	ucomiss	%xmm8, %xmm0
1454a570a:     	cmoval	%r15d, %edi
1454a570e:     	leaq	0x8d8(%rsi), %r14
1454a5715:     	movq	0x8d8(%rsi), %rax
1454a571c:     	testq	%rax, %rax
1454a571f:     	je	0x1454a5817 <.text+0x54a4817>
1454a5725:     	movq	0x8e0(%rsi), %rcx
1454a572c:     	movw	$0x16, %dx
1454a5730:     	movzwl	0x36(%rax), %r9d
1454a5735:     	movl	%r9d, %r10d
1454a5738:     	addl	%r10d, %r10d
1454a573b:     	movq	$-0x1, %r8
1454a5742:     	nopw	%cs:(%rax,%rax)
1454a5750:     	testq	%r10, %r10
1454a5753:     	je	0x1454a5780 <.text+0x54a4780>
1454a5755:     	cmpw	0x3a(%rax,%r8,2), %dx
1454a575b:     	seta	%r11b
1454a575f:     	sbbb	$0x0, %r11b
1454a5763:     	incq	%r8
1454a5766:     	addq	$-0x2, %r10
1454a576a:     	cmpb	$0x1, %r11b
1454a576e:     	je	0x1454a5750 <.text+0x54a4750>
1454a5770:     	movzbl	%r11b, %r9d
1454a5774:     	testl	%r9d, %r9d
1454a5777:     	je	0x1454a5794 <.text+0x54a4794>
1454a5779:     	jmp	0x1454a5783 <.text+0x54a4783>
1454a577b:     	nopl	(%rax,%rax)
1454a5780:     	movq	%r9, %r8
1454a5783:     	subq	$0x1, %rcx
1454a5787:     	jb	0x1454a5819 <.text+0x54a4819>
1454a578d:     	movq	0x50(%rax,%r8,8), %rax
1454a5792:     	jmp	0x1454a5730 <.text+0x54a4730>
1454a5794:     	movl	%ebx, 0x8(%rax,%r8,4)
1454a5799:     	movq	(%r14), %rax
1454a579c:     	testq	%rax, %rax
1454a579f:     	je	0x1454a5851 <.text+0x54a4851>
1454a57a5:     	movq	0x8e0(%rsi), %rcx
1454a57ac:     	movw	$0x1c, %dx
1454a57b0:     	movzwl	0x36(%rax), %r9d
1454a57b5:     	movl	%r9d, %r10d
1454a57b8:     	addl	%r10d, %r10d
1454a57bb:     	movq	$-0x1, %r8
1454a57c2:     	nopw	%cs:(%rax,%rax)
1454a57d0:     	testq	%r10, %r10
1454a57d3:     	je	0x1454a5800 <.text+0x54a4800>
1454a57d5:     	cmpw	0x3a(%rax,%r8,2), %dx
1454a57db:     	seta	%r11b
1454a57df:     	sbbb	$0x0, %r11b
1454a57e3:     	incq	%r8
1454a57e6:     	addq	$-0x2, %r10
1454a57ea:     	cmpb	$0x1, %r11b
1454a57ee:     	je	0x1454a57d0 <.text+0x54a47d0>
1454a57f0:     	movzbl	%r11b, %r9d
1454a57f4:     	testl	%r9d, %r9d
1454a57f7:     	je	0x1454a5810 <.text+0x54a4810>
1454a57f9:     	jmp	0x1454a5803 <.text+0x54a4803>
1454a57fb:     	nopl	(%rax,%rax)
1454a5800:     	movq	%r9, %r8
1454a5803:     	subq	$0x1, %rcx
1454a5807:     	jb	0x1454a5853 <.text+0x54a4853>
1454a5809:     	movq	0x50(%rax,%r8,8), %rax
1454a580e:     	jmp	0x1454a57b0 <.text+0x54a47b0>
1454a5810:     	movl	%edi, 0x8(%rax,%r8,4)
1454a5815:     	jmp	0x1454a587f <.text+0x54a487f>
1454a5817:     	xorl	%eax, %eax
1454a5819:     	movq	%r14, -0x30(%rbp)
1454a581d:     	movq	%rax, -0x28(%rbp)
1454a5821:     	movq	$0x0, -0x20(%rbp)
1454a5829:     	movq	%r8, -0x18(%rbp)
1454a582d:     	movq	$0x16, -0x10(%rbp)
1454a5835:     	leaq	-0x50(%rbp), %rcx
1454a5839:     	leaq	-0x30(%rbp), %rdx
1454a583d:     	movl	%ebx, %r8d
1454a5840:     	callq	0x14552a730 <.text+0x5529730>
1454a5845:     	movq	(%r14), %rax
1454a5848:     	testq	%rax, %rax
1454a584b:     	jne	0x1454a57a5 <.text+0x54a47a5>
1454a5851:     	xorl	%eax, %eax
1454a5853:     	movq	%r14, -0x30(%rbp)
1454a5857:     	movq	%rax, -0x28(%rbp)
1454a585b:     	movq	$0x0, -0x20(%rbp)
1454a5863:     	movq	%r8, -0x18(%rbp)
1454a5867:     	movq	$0x1c, -0x10(%rbp)
1454a586f:     	leaq	-0x50(%rbp), %rcx
1454a5873:     	leaq	-0x30(%rbp), %rdx
1454a5877:     	movl	%edi, %r8d
1454a587a:     	callq	0x14552a730 <.text+0x5529730>
1454a587f:     	movaps	(%rbp), %xmm6
1454a5883:     	movaps	0x10(%rbp), %xmm7
1454a5887:     	movaps	0x20(%rbp), %xmm8
1454a588c:     	addq	$0xb8, %rsp
1454a5893:     	popq	%rbx
1454a5894:     	popq	%rdi
1454a5895:     	popq	%rsi
1454a5896:     	popq	%r14
1454a5898:     	popq	%r15
1454a589a:     	popq	%rbp
1454a589b:     	retq
