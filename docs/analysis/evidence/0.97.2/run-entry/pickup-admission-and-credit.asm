
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a5850:     	movsd	0x34(%rcx), %xmm0
1454a5855:     	subps	%xmm7, %xmm0
1454a5858:     	mulps	%xmm0, %xmm0
1454a585b:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a585f:     	addss	%xmm0, %xmm1
1454a5863:     	xorps	%xmm0, %xmm0
1454a5866:     	sqrtss	%xmm1, %xmm0
1454a586a:     	ucomiss	%xmm0, %xmm10
1454a586e:     	jae	0x1454a58b9 <.text+0x54a48b9>
1454a5870:     	addq	$0x48, %rcx
1454a5874:     	incq	%r14
1454a5877:     	cmpq	%rdx, %rcx
1454a587a:     	je	0x1454a5905 <.text+0x54a4905>
1454a5880:     	movl	0x20(%rcx), %eax
1454a5883:     	testl	%eax, %eax
1454a5885:     	je	0x1454a58ac <.text+0x54a48ac>
1454a5887:     	cmpl	$0x1, %eax
1454a588a:     	jne	0x1454a5850 <.text+0x54a4850>
1454a588c:     	movsd	0x34(%rcx), %xmm0
1454a5891:     	subps	%xmm7, %xmm0
1454a5894:     	mulps	%xmm0, %xmm0
1454a5897:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1454a589b:     	addss	%xmm0, %xmm1
1454a589f:     	xorps	%xmm0, %xmm0
1454a58a2:     	sqrtss	%xmm1, %xmm0
1454a58a6:     	ucomiss	%xmm0, %xmm9
1454a58aa:     	jae	0x1454a58b9 <.text+0x54a48b9>
1454a58ac:     	cmpl	$0x1, 0x18(%rcx)
1454a58b0:     	jne	0x1454a5870 <.text+0x54a4870>
1454a58b2:     	ucomiss	0x1c(%rcx), %xmm8
1454a58b7:     	jb	0x1454a5870 <.text+0x54a4870>
1454a58b9:     	movq	%rcx, 0x290(%rbp)
1454a58c0:     	cmpq	0x2d8(%rbp), %rbx
1454a58c7:     	jne	0x1454a58d2 <.text+0x54a48d2>
1454a58c9:     	movq	%rdi, %rcx
1454a58cc:     	callq	0x145757ef0 <.text+0x5756ef0>
1454a58d1:     	nop
1454a58d2:     	movq	0x290(%rbp), %rcx
1454a58d9:     	addq	$0x48, %rcx
1454a58dd:     	movq	0x2e0(%rbp), %rax
1454a58e4:     	movq	%r14, (%rax,%rbx,8)
1454a58e8:     	incq	%r14
1454a58eb:     	incq	%rbx
1454a58ee:     	movq	%rbx, 0x2e8(%rbp)
1454a58f5:     	movq	0x328(%rbp), %rdx
1454a58fc:     	cmpq	%rdx, %rcx
1454a58ff:     	jne	0x1454a5880 <.text+0x54a4880>
1454a5905:     	movq	%rcx, 0x290(%rbp)
1454a590c:     	movq	0x2d8(%rbp), %rax
1454a5913:     	movq	%rax, 0x80(%rbp)
1454a591a:     	movq	0x2e0(%rbp), %rax
1454a5921:     	movq	%rax, 0x358(%rbp)
1454a5928:     	leaq	(%rax,%rbx,8), %r15
1454a592c:     	leaq	0x1507321(%rip), %r13   # 0x1469acc54
1454a5933:     	xorps	%xmm7, %xmm7
1454a5936:     	movl	$0x498, %edi            # imm = 0x498
1454a593b:     	movss	0x445be4(%rip), %xmm8   # 0x1458eb528
1454a5944:     	jmp	0x1454a59a0 <.text+0x54a49a0>
1454a5946:     	movl	%r14d, %eax
1454a5949:     	xorps	%xmm0, %xmm0
1454a594c:     	cvtsi2ss	%rax, %xmm0
1454a5951:     	movq	0x368(%rbp), %rsi
1454a5958:     	mulss	0x474(%rsi), %xmm0
1454a5960:     	callq	0x145756e1f <.text+0x5755e1f>
1454a5965:     	maxss	0x445b13(%rip), %xmm0   # 0x1458eb480
1454a596d:     	cvttss2si	%xmm0, %rdx
1454a5972:     	ucomiss	%xmm7, %xmm0
1454a5975:     	movl	$0x0, %eax
1454a597a:     	cmovbl	%eax, %edx
1454a597d:     	ucomiss	%xmm13, %xmm0
1454a5981:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454a5986:     	cmoval	%eax, %edx
1454a5989:     	movq	%rsi, %rcx
1454a598c:     	callq	0x1454b4920 <.text+0x54b3920>
