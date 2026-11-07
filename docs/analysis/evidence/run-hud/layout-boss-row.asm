
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401b5730:     	pushq	%r15
1401b5732:     	pushq	%r14
1401b5734:     	pushq	%r13
1401b5736:     	pushq	%r12
1401b5738:     	pushq	%rsi
1401b5739:     	pushq	%rdi
1401b573a:     	pushq	%rbp
1401b573b:     	pushq	%rbx
1401b573c:     	subq	$0x418, %rsp            # imm = 0x418
1401b5743:     	movaps	%xmm15, 0x400(%rsp)
1401b574c:     	movaps	%xmm14, 0x3f0(%rsp)
1401b5755:     	movaps	%xmm13, 0x3e0(%rsp)
1401b575e:     	movaps	%xmm12, 0x3d0(%rsp)
1401b5767:     	movaps	%xmm11, 0x3c0(%rsp)
1401b5770:     	movaps	%xmm10, 0x3b0(%rsp)
1401b5779:     	movaps	%xmm9, 0x3a0(%rsp)
1401b5782:     	movaps	%xmm8, 0x390(%rsp)
1401b578b:     	movaps	%xmm7, 0x380(%rsp)
1401b5793:     	movaps	%xmm6, 0x370(%rsp)
1401b579b:     	movq	(%rcx), %r8
1401b579e:     	movq	0x28(%rcx), %rax
1401b57a2:     	movq	%r8, 0x38(%rsp)
1401b57a7:     	movq	%r8, 0x48(%rsp)
1401b57ac:     	movups	0x8(%rcx), %xmm0
1401b57b0:     	movups	%xmm0, 0x50(%rsp)
1401b57b5:     	movq	%rcx, 0x28(%rsp)
1401b57ba:     	movups	0x18(%rcx), %xmm0
1401b57be:     	movups	%xmm0, 0x60(%rsp)
1401b57c3:     	movq	%rax, 0x70(%rsp)
1401b57c8:     	movq	(%rdx), %rax
1401b57cb:     	movq	0x10(%rax), %rbp
1401b57cf:     	testq	%rbp, %rbp
1401b57d2:     	je	0x1401b5a1c <.text+0x1b4a1c>
1401b57d8:     	movq	0x8(%rdx), %rax
1401b57dc:     	movq	%rax, 0x30(%rsp)
1401b57e1:     	movq	0x10(%rdx), %rdi
1401b57e5:     	leaq	0x2e8(%rsp), %r14
1401b57ed:     	leaq	0x80(%rsp), %rbx
1401b57f5:     	xorl	%r13d, %r13d
1401b57f8:     	xorps	%xmm6, %xmm6
1401b57fb:     	movups	0x5c0ad15(%rip), %xmm11 # 0x145dc0518
1401b5803:     	movups	0x5c0acfd(%rip), %xmm12 # 0x145dc0508
1401b580b:     	movups	0x5c0ad25(%rip), %xmm13 # 0x145dc0538
1401b5813:     	movups	0x5c0ad0d(%rip), %xmm14 # 0x145dc0528
1401b581b:     	movups	0x5c0abed(%rip), %xmm15 # 0x145dc0410
1401b5823:     	movups	0x5c0abfe(%rip), %xmm7  # 0x145dc0428
1401b582a:     	movups	0x5c0ac0e(%rip), %xmm8  # 0x145dc0440
1401b5832:     	movups	0x5c0ac1e(%rip), %xmm9  # 0x145dc0458
1401b583a:     	movaps	0x5c0236e(%rip), %xmm10 # 0x145db7bb0
1401b5842:     	leaq	0x200(%rsp), %r15
1401b584a:     	leaq	0x78(%rsp), %r12
1401b584f:     	nop
1401b5850:     	movq	0x30(%rsp), %rax
1401b5855:     	movq	(%rax), %rsi
1401b5858:     	movss	(%rdi), %xmm0
1401b585c:     	movq	%r13, 0x40(%rsp)
1401b5861:     	incq	%r13
1401b5864:     	movss	%xmm0, 0x24(%rsp)
1401b586a:     	movups	%xmm6, -0x18(%r14)
1401b586f:     	movups	%xmm6, -0x28(%r14)
1401b5874:     	movups	%xmm6, -0x38(%r14)
1401b5879:     	movups	%xmm6, -0x48(%r14)
1401b587e:     	movups	%xmm6, -0x58(%r14)
1401b5883:     	movq	$0x0, -0x8(%r14)
1401b588b:     	movups	0x5c0ac46(%rip), %xmm0  # 0x145dc04d8
1401b5892:     	movups	%xmm0, 0x10(%r14)
1401b5897:     	movups	0x5c0ac2a(%rip), %xmm0  # 0x145dc04c8
1401b589e:     	movups	%xmm0, (%r14)
1401b58a2:     	movups	0x5c0ac4f(%rip), %xmm0  # 0x145dc04f8
1401b58a9:     	movups	%xmm0, 0x30(%r14)
1401b58ae:     	movups	0x5c0ac33(%rip), %xmm0  # 0x145dc04e8
1401b58b5:     	movups	%xmm0, 0x20(%r14)
1401b58ba:     	movups	%xmm11, 0x50(%r14)
1401b58bf:     	movups	%xmm12, 0x40(%r14)
1401b58c4:     	movups	%xmm13, 0x70(%r14)
1401b58c9:     	movups	%xmm14, 0x60(%r14)
1401b58ce:     	movq	0x5c0ab4b(%rip), %rax   # 0x145dc0420
1401b58d5:     	movq	%rax, 0x240(%rsp)
1401b58dd:     	movaps	%xmm15, 0x230(%rsp)
1401b58e6:     	movups	%xmm7, -0xa0(%r14)
1401b58ee:     	movq	0x5c0ab43(%rip), %rax   # 0x145dc0438
1401b58f5:     	movq	%rax, -0x90(%r14)
1401b58fc:     	movq	0x5c0ab4d(%rip), %rax   # 0x145dc0450
1401b5903:     	movq	%rax, -0x78(%r14)
1401b5907:     	movups	%xmm8, -0x88(%r14)
1401b590f:     	movq	0x5c0ab52(%rip), %rax   # 0x145dc0468
1401b5916:     	movq	%rax, -0x60(%r14)
1401b591a:     	movups	%xmm9, -0x70(%r14)
1401b591f:     	movl	$0x138, %r8d            # imm = 0x138
1401b5925:     	movq	%rbx, %rcx
1401b5928:     	leaq	0x230(%rsp), %rdx
1401b5930:     	callq	0x145bc977b <.text+0x5bc877b>
1401b5935:     	movups	%xmm10, 0x1b8(%rsp)
1401b593e:     	movl	$0x1, 0x1c8(%rsp)
1401b5949:     	movq	$0x0, 0x1cc(%rsp)
1401b5955:     	movb	$0x1, 0x1d4(%rsp)
1401b595d:     	movq	$0x0, 0x1d8(%rsp)
1401b5969:     	movl	$0x3f800000, 0x1e0(%rsp) # imm = 0x3F800000
1401b5974:     	movw	$0x0, 0x1e4(%rsp)
1401b597e:     	movl	0x5c0abf2(%rip), %eax   # 0x145dc0576
1401b5984:     	movl	%eax, 0x166(%rbx)
1401b598a:     	movzwl	0x5c0abe9(%rip), %eax   # 0x145dc057a
1401b5991:     	movw	%ax, 0x16a(%rbx)
1401b5998:     	movl	0x5c0abde(%rip), %eax   # 0x145dc057c
1401b599e:     	movl	%eax, 0x16c(%rbx)
1401b59a4:     	movzwl	0x5c0abd5(%rip), %eax   # 0x145dc0580
1401b59ab:     	movw	%ax, 0x170(%rbx)
1401b59b2:     	movl	$0x0, 0x1f2(%rsp)
1401b59bd:     	movabsq	$0x500000001, %rax      # imm = 0x500000001
1401b59c7:     	movq	%rax, 0x1f6(%rsp)
1401b59cf:     	movq	0x38(%rsp), %rax
1401b59d4:     	movq	%rax, 0x78(%rsp)
1401b59d9:     	movq	%r15, %rcx
1401b59dc:     	leaq	0x50(%rsp), %rdx
1401b59e1:     	movq	%r12, %r8
1401b59e4:     	callq	0x140189f40 <.text+0x188f40>
1401b59e9:     	leaq	0x40(%rsp), %rax
1401b59ee:     	movq	%rax, 0x78(%rsp)
1401b59f3:     	movq	%rsi, 0x80(%rsp)
1401b59fb:     	leaq	0x24(%rsp), %rax
1401b5a00:     	movq	%rax, 0x88(%rsp)
1401b5a08:     	movq	%r15, %rcx
1401b5a0b:     	movq	%r12, %rdx
1401b5a0e:     	callq	0x1401b6c20 <.text+0x1b5c20>
1401b5a13:     	cmpq	%r13, %rbp
1401b5a16:     	jne	0x1401b5850 <.text+0x1b4850>
1401b5a1c:     	movq	0x28(%rsp), %rax
1401b5a21:     	movaps	0x370(%rsp), %xmm6
1401b5a29:     	movaps	0x380(%rsp), %xmm7
1401b5a31:     	movaps	0x390(%rsp), %xmm8
1401b5a3a:     	movaps	0x3a0(%rsp), %xmm9
1401b5a43:     	movaps	0x3b0(%rsp), %xmm10
1401b5a4c:     	movaps	0x3c0(%rsp), %xmm11
1401b5a55:     	movaps	0x3d0(%rsp), %xmm12
1401b5a5e:     	movaps	0x3e0(%rsp), %xmm13
1401b5a67:     	movaps	0x3f0(%rsp), %xmm14
1401b5a70:     	movaps	0x400(%rsp), %xmm15
1401b5a79:     	addq	$0x418, %rsp            # imm = 0x418
1401b5a80:     	popq	%rbx
1401b5a81:     	popq	%rbp
1401b5a82:     	popq	%rdi
1401b5a83:     	popq	%rsi
1401b5a84:     	popq	%r12
1401b5a86:     	popq	%r13
1401b5a88:     	popq	%r14
1401b5a8a:     	popq	%r15
1401b5a8c:     	retq
