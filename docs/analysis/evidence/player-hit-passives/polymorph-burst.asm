
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c5687:     	movq	0x2a0(%rsi), %rax
1454c568e:     	testq	%rax, %rax
1454c5691:     	je	0x1454c4fd9 <.text+0x54c3fd9>
1454c5697:     	movq	0x298(%rsi), %rcx
1454c569e:     	imulq	$0x58, %rax, %r8
1454c56a2:     	xorl	%edx, %edx
1454c56a4:     	movabsq	$0x70726f6d796c6f70, %r9 # imm = 0x70726F6D796C6F70
1454c56ae:     	jmp	0x1454c56bd <.text+0x54c46bd>
1454c56b0:     	addq	$0x58, %rdx
1454c56b4:     	cmpq	%rdx, %r8
1454c56b7:     	je	0x1454c4fd9 <.text+0x54c3fd9>
1454c56bd:     	movq	(%rcx,%rdx), %rax
1454c56c1:     	cmpq	$0x9, 0x8(%rax)
1454c56c6:     	jne	0x1454c56b0 <.text+0x54c46b0>
1454c56c8:     	movq	(%rax), %r10
1454c56cb:     	movq	(%r10), %r11
1454c56ce:     	xorq	%r9, %r11
1454c56d1:     	movzbl	0x8(%r10), %r10d
1454c56d6:     	xorq	$0x68, %r10
1454c56da:     	orq	%r11, %r10
1454c56dd:     	jne	0x1454c56b0 <.text+0x54c46b0>
1454c56df:     	movl	0x8(%rcx,%rdx), %r8d
1454c56e4:     	movss	0x14(%rcx,%rdx), %xmm0
1454c56ea:     	movl	0x18(%rcx,%rdx), %r9d
1454c56ef:     	movl	0x34(%rcx,%rdx), %r10d
1454c56f4:     	movl	%r10d, 0x124(%rbp)
1454c56fb:     	movups	0x24(%rcx,%rdx), %xmm1
1454c5700:     	movups	%xmm1, 0x114(%rbp)
1454c5707:     	movups	0x38(%rcx,%rdx), %xmm1
1454c570c:     	movups	0x44(%rcx,%rdx), %xmm2
1454c5711:     	movups	%xmm2, 0x134(%rbp)
1454c5718:     	movups	%xmm1, 0x128(%rbp)
1454c571f:     	movq	%rax, 0xf0(%rbp)
1454c5726:     	movl	%r8d, 0xf8(%rbp)
1454c572d:     	movss	0x10(%rcx,%rdx), %xmm8
1454c5734:     	movsd	0xc(%rcx,%rdx), %xmm1
1454c573a:     	movsd	%xmm1, 0xfc(%rbp)
1454c5742:     	movss	%xmm0, 0x104(%rbp)
1454c574a:     	movl	%r9d, 0x108(%rbp)
1454c5751:     	movsd	0x1c(%rcx,%rdx), %xmm0
1454c5757:     	movsd	%xmm0, 0x10c(%rbp)
1454c575f:     	leaq	0x458(%rsi), %rdx
1454c5766:     	movss	0x458(%rsi), %xmm12
1454c576f:     	movzbl	0x75(%rax), %ecx
1454c5773:     	addb	$-0x2, %cl
1454c5776:     	cmpb	$0x6, %cl
1454c5779:     	ja	0x1454c578d <.text+0x54c478d>
1454c577b:     	movzbl	%cl, %ecx
1454c577e:     	leaq	0x14e7317(%rip), %r8    # 0x1469aca9c
1454c5785:     	movss	(%r8,%rcx,4), %xmm0
1454c578b:     	jmp	0x1454c5795 <.text+0x54c4795>
1454c578d:     	movss	0x425ceb(%rip), %xmm0   # 0x1458eb480
1454c5795:     	movss	%xmm0, 0xe8(%rbp)
1454c579d:     	movss	0x45c(%rsi), %xmm14
1454c57a6:     	movss	0x44(%rax), %xmm13
1454c57ac:     	movss	0x128(%rbp), %xmm15
1454c57b5:     	mulss	0x13c(%rbp), %xmm12
1454c57be:     	leaq	0xf0(%rbp), %rcx
1454c57c5:     	callq	0x1454f96d0 <.text+0x54f86d0>
1454c57ca:     	movb	$0x1, 0x176(%rbp)
1454c57d1:     	movq	$0x0, 0x28(%rsp)
1454c57da:     	movq	$0x8, 0x20(%rsp)
1454c57e3:     	leaq	0x88(%rbp), %rcx
1454c57ea:     	leaq	0x158(%rbp), %r8
1454c57f1:     	movq	%rsi, %rdx
1454c57f4:     	movaps	%xmm0, %xmm3
1454c57f7:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454c57fc:     	nop
1454c57fd:     	movl	%r15d, 0xb0(%rbp)
1454c5804:     	movq	0x90(%rbp), %r9
1454c580b:     	movq	0x98(%rbp), %r14
1454c5812:     	movl	$0x2, 0x48(%rbp)
1454c5819:     	movl	$0x0, (%rbp)
1454c5820:     	movq	%rbp, %rax
1454c5823:     	movq	%rax, 0x30(%rsp)
1454c5828:     	leaq	0x48(%rbp), %rax
1454c582c:     	movq	%rax, 0x28(%rsp)
1454c5831:     	movq	%r14, 0x20(%rsp)
1454c5836:     	leaq	0xb8(%rbp), %rcx
1454c583d:     	movq	%rdi, %rdx
1454c5840:     	movl	$0x5a9, %r8d            # imm = 0x5A9
1454c5846:     	movq	%r9, 0x168(%rbp)
1454c584d:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454c5852:     	nop
1454c5853:     	movq	0x548(%rsi), %r15
1454c585a:     	cmpq	0x538(%rsi), %r15
1454c5861:     	jne	0x1454c5870 <.text+0x54c4870>
1454c5863:     	leaq	0x538(%rsi), %rcx
1454c586a:     	callq	0x1457580b0 <.text+0x57570b0>
1454c586f:     	nop
1454c5870:     	mulss	0x425cb0(%rip), %xmm7   # 0x1458eb528
1454c5878:     	xorps	%xmm0, %xmm0
1454c587b:     	cmpltss	%xmm13, %xmm0
1454c5881:     	andps	%xmm12, %xmm0
1454c5885:     	mulss	0x4334b2(%rip), %xmm13  # 0x1458f8d40
1454c588e:     	mulss	%xmm13, %xmm8
1454c5893:     	mulss	%xmm8, %xmm15
1454c5898:     	mulss	0xe8(%rbp), %xmm15
1454c58a1:     	addss	%xmm0, %xmm15
1454c58a6:     	mulss	%xmm15, %xmm14
1454c58ab:     	movaps	%xmm7, %xmm0
1454c58ae:     	minss	%xmm14, %xmm0
1454c58b3:     	movaps	%xmm0, %xmm1
1454c58b6:     	cmpunordss	%xmm0, %xmm1
1454c58bb:     	movaps	%xmm1, %xmm2
1454c58be:     	andnps	%xmm0, %xmm2
1454c58c1:     	andps	%xmm7, %xmm1
1454c58c4:     	orps	%xmm2, %xmm1
1454c58c7:     	movq	0x540(%rsi), %rax
1454c58ce:     	movq	%r15, %rcx
1454c58d1:     	shlq	$0x5, %rcx
1454c58d5:     	movups	0xb8(%rbp), %xmm0
1454c58dc:     	movups	0xc8(%rbp), %xmm2
1454c58e3:     	movups	%xmm2, 0x10(%rax,%rcx)
1454c58e8:     	movups	%xmm0, (%rax,%rcx)
1454c58ec:     	incq	%r15
1454c58ef:     	movq	%r15, 0x548(%rsi)
1454c58f6:     	movss	%xmm1, 0x30(%rsp)
1454c58fc:     	movq	%r14, 0x28(%rsp)
1454c5901:     	movq	0x168(%rbp), %rax
1454c5908:     	movq	%rax, 0x20(%rsp)
1454c590d:     	leaq	0xf0(%rbp), %rdx
1454c5914:     	movq	%rsi, %rcx
1454c5917:     	movq	%rdi, %r8
1454c591a:     	movl	$0x5a9, %r9d            # imm = 0x5A9
1454c5920:     	callq	0x1454d43d0 <.text+0x54d33d0>
1454c5925:     	nop
1454c5926:     	movq	0x88(%rbp), %rdx
1454c592d:     	testq	%rdx, %rdx
1454c5930:     	je	0x1454c5948 <.text+0x54c4948>
1454c5932:     	shlq	$0x3, %rdx
1454c5936:     	movl	$0x8, %r8d
1454c593c:     	movq	0x168(%rbp), %rcx
1454c5943:     	callq	0x1400021d0 <.text+0x11d0>
1454c5948:     	movl	0xb0(%rbp), %r15d
1454c594f:     	jmp	0x1454c4fd9 <.text+0x54c3fd9>
1454c5954:     	xorps	%xmm0, %xmm0
1454c5957:     	ucomiss	%xmm0, %xmm8
1454c595b:     	ja	0x1454c622b <.text+0x54c522b>
1454c5961:     	movq	0x78(%rbp), %rdx
1454c5965:     	testq	%rdx, %rdx
1454c5968:     	movl	0xb0(%rbp), %r15d
1454c596f:     	je	0x1454c5984 <.text+0x54c4984>
1454c5971:     	shlq	$0x3, %rdx
1454c5975:     	movl	$0x8, %r8d
1454c597b:     	movq	0x40(%rbp), %rcx
1454c597f:     	callq	0x1400021d0 <.text+0x11d0>
