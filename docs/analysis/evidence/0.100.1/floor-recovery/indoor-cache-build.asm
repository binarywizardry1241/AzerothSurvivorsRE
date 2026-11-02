
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552b670:     	pushq	%rbp
14552b671:     	pushq	%r15
14552b673:     	pushq	%r14
14552b675:     	pushq	%r13
14552b677:     	pushq	%r12
14552b679:     	pushq	%rsi
14552b67a:     	pushq	%rdi
14552b67b:     	pushq	%rbx
14552b67c:     	subq	$0x2b8, %rsp            # imm = 0x2B8
14552b683:     	leaq	0x80(%rsp), %rbp
14552b68b:     	movaps	%xmm15, 0x220(%rbp)
14552b693:     	movaps	%xmm14, 0x210(%rbp)
14552b69b:     	movaps	%xmm13, 0x200(%rbp)
14552b6a3:     	movaps	%xmm12, 0x1f0(%rbp)
14552b6ab:     	movaps	%xmm11, 0x1e0(%rbp)
14552b6b3:     	movaps	%xmm10, 0x1d0(%rbp)
14552b6bb:     	movaps	%xmm9, 0x1c0(%rbp)
14552b6c3:     	movaps	%xmm8, 0x1b0(%rbp)
14552b6cb:     	movaps	%xmm7, 0x1a0(%rbp)
14552b6d2:     	movaps	%xmm6, 0x190(%rbp)
14552b6d9:     	movq	$-0x2, 0x188(%rbp)
14552b6e4:     	movq	%r9, %r14
14552b6e7:     	movq	%r8, 0x178(%rbp)
14552b6ee:     	movq	%rdx, %rsi
14552b6f1:     	movq	%rcx, 0xc0(%rbp)
14552b6f8:     	movq	0x2a0(%rbp), %rdi
14552b6ff:     	movss	0x2a8(%rbp), %xmm6
14552b707:     	movaps	%xmm6, %xmm0
14552b70a:     	addss	%xmm6, %xmm0
14552b70e:     	addss	%xmm0, %xmm0
14552b712:     	callq	0x14577327d <.text+0x577227d>
14552b717:     	cvttss2si	%xmm0, %rax
14552b71c:     	movq	%rax, %rcx
14552b71f:     	sarq	$0x3f, %rcx
14552b723:     	movaps	%xmm0, %xmm1
14552b726:     	subss	0x3dbab2(%rip), %xmm1   # 0x1459071e0
14552b72e:     	cvttss2si	%xmm1, %rdx
14552b733:     	andq	%rcx, %rdx
14552b736:     	orq	%rax, %rdx
14552b739:     	xorl	%eax, %eax
14552b73b:     	xorps	%xmm1, %xmm1
14552b73e:     	ucomiss	%xmm1, %xmm0
14552b741:     	cmovaeq	%rdx, %rax
14552b745:     	ucomiss	0x3dba98(%rip), %xmm0   # 0x1459071e4
14552b74c:     	movq	$-0x1, %rcx
14552b753:     	cmovbeq	%rax, %rcx
14552b757:     	movq	%rcx, 0x170(%rbp)
14552b75e:     	movsd	(%rdi), %xmm7
14552b762:     	movss	0x8(%rdi), %xmm0
14552b767:     	movss	%xmm0, 0x164(%rbp)
14552b76f:     	movq	$0x0, 0x138(%rbp)
14552b77a:     	movq	$0x4, 0x140(%rbp)
14552b785:     	movq	$0x0, 0x148(%rbp)
14552b790:     	callq	0x1456ff6a0 <.text+0x56fe6a0>
14552b795:     	nop
14552b796:     	movq	%rax, %rbx
14552b799:     	cmpb	$0x1, 0x10(%rax)
14552b79d:     	jne	0x14552ca53 <.text+0x552ba53>
14552b7a3:     	movq	(%rbx), %rax
14552b7a6:     	movq	0x8(%rbx), %rdx
14552b7aa:     	movsldup	%xmm6, %xmm0            # xmm0 = xmm6[0,0,2,2]
14552b7ae:     	movaps	%xmm7, 0xa0(%rbp)
14552b7b5:     	subps	%xmm0, %xmm7
14552b7b8:     	movss	0x3ea113(%rip), %xmm10  # 0x1459158d4
14552b7c1:     	addss	0x164(%rbp), %xmm10
14552b7ca:     	leaq	0x1(%rax), %rcx
14552b7ce:     	movq	%rcx, (%rbx)
14552b7d1:     	movups	0x1809068(%rip), %xmm0  # 0x146d34840
14552b7d8:     	movaps	%xmm0, 0x40(%rbp)
14552b7dc:     	movups	0x180904d(%rip), %xmm0  # 0x146d34830
14552b7e3:     	movaps	%xmm0, 0x30(%rbp)
14552b7e7:     	movq	%rax, 0x50(%rbp)
14552b7eb:     	movq	%rdx, 0x58(%rbp)
14552b7ef:     	leaq	(%r14,%r14,8), %rax
14552b7f3:     	movq	0x178(%rbp), %rdi
14552b7fa:     	leaq	(%rdi,%rax,8), %rax
14552b7fe:     	movq	%rax, 0x110(%rbp)
14552b805:     	xorl	%ecx, %ecx
14552b807:     	leaq	0x30(%rbp), %r15
14552b80b:     	leaq	-0x48(%rbp), %r13
14552b80f:     	leaq	0xb0(%rbp), %rbx
14552b816:     	leaq	0x70(%rbp), %r12
14552b81a:     	testq	%rcx, %rcx
14552b81d:     	je	0x14552b830 <.text+0x552a830>
14552b81f:     	cmpq	0x168(%rbp), %rcx
14552b826:     	je	0x14552b830 <.text+0x552a830>
14552b828:     	movq	%rcx, %r14
14552b82b:     	jmp	0x14552b85c <.text+0x552a85c>
14552b82d:     	nopl	(%rax)
14552b830:     	cmpq	0x110(%rbp), %rdi
14552b837:     	je	0x14552bab4 <.text+0x552aab4>
14552b83d:     	movq	0x40(%rdi), %rax
14552b841:     	addq	$0x48, %rdi
14552b845:     	testq	%rax, %rax
14552b848:     	je	0x14552b830 <.text+0x552a830>
14552b84a:     	movq	-0x10(%rdi), %r14
14552b84e:     	imulq	$0x38, %rax, %rax
14552b852:     	addq	%r14, %rax
14552b855:     	movq	%rax, 0x168(%rbp)
14552b85c:     	movl	0x30(%r14), %edx
14552b860:     	movq	%r15, %rcx
14552b863:     	callq	0x14546cf80 <.text+0x546bf80>
14552b868:     	nop
14552b869:     	leaq	0x38(%r14), %rcx
14552b86d:     	testb	%al, %al
14552b86f:     	jne	0x14552b81a <.text+0x552a81a>
14552b871:     	movq	%rcx, 0x118(%rbp)
14552b878:     	movq	0x8(%r14), %r8
14552b87c:     	movq	0x10(%r14), %r9
14552b880:     	movq	%r13, %rcx
14552b883:     	movq	%rsi, %rdx
14552b886:     	callq	0x145682320 <.text+0x5681320>
14552b88b:     	nop
14552b88c:     	cmpq	$-0x1, -0x48(%rbp)
14552b891:     	je	0x14552ba9e <.text+0x552aa9e>
14552b897:     	movq	%rsi, 0x120(%rbp)
14552b89e:     	movups	-0x48(%rbp), %xmm0
14552b8a2:     	movups	-0x38(%rbp), %xmm1
14552b8a6:     	movups	-0x28(%rbp), %xmm2
14552b8aa:     	movaps	%xmm2, 0x100(%rbp)
14552b8b1:     	movaps	%xmm1, 0xf0(%rbp)
14552b8b8:     	movaps	%xmm0, 0xe0(%rbp)
14552b8bf:     	movl	0x20(%r14), %eax
14552b8c3:     	movl	%eax, 0x98(%rbp)
14552b8c9:     	movq	0x18(%r14), %rax
14552b8cd:     	movq	%rax, 0x90(%rbp)
14552b8d4:     	movl	0x2c(%r14), %eax
14552b8d8:     	movl	%eax, 0xb8(%rbp)
14552b8de:     	movq	0x24(%r14), %rax
14552b8e2:     	movq	%rax, 0xb0(%rbp)
14552b8e9:     	movq	0xe8(%rbp), %rdx
14552b8f0:     	movq	0xf0(%rbp), %r8
14552b8f7:     	movq	%rbx, 0x20(%rsp)
14552b8fc:     	movl	$0x3f800000, 0x28(%rsp) # imm = 0x3F800000
14552b904:     	movq	%r13, %rsi
14552b907:     	movq	%r13, %rcx
14552b90a:     	movq	%rdx, 0x128(%rbp)
14552b911:     	leaq	0x90(%rbp), %r9
14552b918:     	callq	0x145530130 <.text+0x552f130>
14552b91d:     	nop
14552b91e:     	movabsq	$-0x5555555555555555, %rax # imm = 0xAAAAAAAAAAAAAAAB
14552b928:     	mulq	0x108(%rbp)
14552b92f:     	movq	0x100(%rbp), %r14
14552b936:     	shrq	%rdx
14552b939:     	leaq	(%rdx,%rdx,2), %r13
14552b93d:     	movq	-0x40(%rbp), %rcx
14552b941:     	movq	-0x38(%rbp), %r15
14552b945:     	movq	%r14, 0xd0(%rbp)
14552b94c:     	movq	%rcx, 0x150(%rbp)
14552b953:     	subq	$0x3, %r13
14552b957:     	jb	0x14552ba20 <.text+0x552aa20>
14552b95d:     	nopl	(%rax)
14552b960:     	movl	(%r14), %ecx
14552b963:     	cmpq	%rcx, %r15
14552b966:     	jbe	0x14552cab1 <.text+0x552bab1>
14552b96c:     	leaq	(%rcx,%rcx,2), %rax
14552b970:     	movq	0x150(%rbp), %rdx
14552b977:     	movl	0x8(%rdx,%rax,4), %ecx
14552b97b:     	movl	%ecx, 0x88(%rbp)
14552b981:     	movq	(%rdx,%rax,4), %rax
14552b985:     	movq	%rax, 0x80(%rbp)
14552b98c:     	movl	0x4(%r14), %ecx
14552b990:     	cmpq	%rcx, %r15
14552b993:     	jbe	0x14552ca9c <.text+0x552ba9c>
14552b999:     	leaq	(%rcx,%rcx,2), %rax
14552b99d:     	movl	0x8(%rdx,%rax,4), %ecx
14552b9a1:     	movl	%ecx, 0x78(%rbp)
14552b9a4:     	movq	(%rdx,%rax,4), %rax
14552b9a8:     	movq	%rax, 0x70(%rbp)
14552b9ac:     	movl	0x8(%r14), %ecx
14552b9b0:     	cmpq	%rcx, %r15
14552b9b3:     	jbe	0x14552ca87 <.text+0x552ba87>
14552b9b9:     	leaq	(%rcx,%rcx,2), %rax
14552b9bd:     	movl	0x8(%rdx,%rax,4), %ecx
14552b9c1:     	movl	%ecx, 0x68(%rbp)
14552b9c4:     	movq	(%rdx,%rax,4), %rax
14552b9c8:     	movq	%rax, 0x60(%rbp)
14552b9cc:     	movlps	%xmm7, 0xb0(%rbp)
14552b9d3:     	movq	0x170(%rbp), %rax
14552b9da:     	movq	%rax, 0xb8(%rbp)
14552b9e1:     	movss	%xmm10, 0x28(%rsp)
14552b9e8:     	leaq	0x60(%rbp), %rax
14552b9ec:     	movq	%rax, 0x20(%rsp)
14552b9f1:     	leaq	0x138(%rbp), %rcx
14552b9f8:     	movq	%rbx, %rdx
14552b9fb:     	leaq	0x80(%rbp), %r8
14552ba02:     	movq	%r12, %r9
14552ba05:     	callq	0x145530800 <.text+0x552f800>
14552ba0a:     	nop
14552ba0b:     	addq	$0xc, %r14
14552ba0f:     	movq	0x150(%rbp), %rcx
14552ba16:     	subq	$0x3, %r13
14552ba1a:     	jae	0x14552b960 <.text+0x552a960>
14552ba20:     	movq	-0x48(%rbp), %rax
14552ba24:     	testq	%rax, %rax
14552ba27:     	je	0x14552ba3c <.text+0x552aa3c>
14552ba29:     	shlq	$0x2, %rax
14552ba2d:     	leaq	(%rax,%rax,2), %rdx
14552ba31:     	movl	$0x4, %r8d
14552ba37:     	callq	0x1400021d0 <.text+0x11d0>
14552ba3c:     	movq	0xe0(%rbp), %rax
14552ba43:     	testq	%rax, %rax
14552ba46:     	leaq	0x30(%rbp), %r15
14552ba4a:     	movq	%rsi, %r13
14552ba4d:     	je	0x14552ba69 <.text+0x552aa69>
14552ba4f:     	shlq	$0x2, %rax
14552ba53:     	leaq	(%rax,%rax,2), %rdx
14552ba57:     	movl	$0x4, %r8d
14552ba5d:     	movq	0x128(%rbp), %rcx
14552ba64:     	callq	0x1400021d0 <.text+0x11d0>
14552ba69:     	movq	0xf8(%rbp), %rdx
14552ba70:     	testq	%rdx, %rdx
14552ba73:     	movq	0x120(%rbp), %rsi
14552ba7a:     	je	0x14552ba92 <.text+0x552aa92>
14552ba7c:     	shlq	$0x2, %rdx
14552ba80:     	movl	$0x4, %r8d
14552ba86:     	movq	0xd0(%rbp), %rcx
14552ba8d:     	callq	0x1400021d0 <.text+0x11d0>
14552ba92:     	movq	0x118(%rbp), %rcx
14552ba99:     	jmp	0x14552b81a <.text+0x552a81a>
14552ba9e:     	leaq	-0x40(%rbp), %rcx
14552baa2:     	callq	0x1456f8fa0 <.text+0x56f7fa0>
14552baa7:     	nop
14552baa8:     	movq	0x118(%rbp), %rcx
14552baaf:     	jmp	0x14552b81a <.text+0x552a81a>
14552bab4:     	movshdup	%xmm7, %xmm11           # xmm11 = xmm7[1,1,3,3]
14552bab9:     	movss	0x3db9d6(%rip), %xmm14  # 0x145907498
14552bac2:     	movl	$0x8, %esi
14552bac7:     	movss	%xmm10, 0x184(%rbp)
14552bad0:     	movaps	%xmm11, 0x150(%rbp)
14552bad8:     	jmp	0x14552bae5 <.text+0x552aae5>
14552bada:     	nopw	(%rax,%rax)
14552bae0:     	movl	$0x8, %esi
14552bae5:     	movq	0x178(%rbp), %r11
14552baec:     	cmpq	0x110(%rbp), %r11
14552baf3:     	je	0x14552c147 <.text+0x552b147>
14552baf9:     	movq	0x8(%r11), %r15
14552bafd:     	movq	0x10(%r11), %r12
14552bb01:     	movss	0x4dc7a2(%rip), %xmm13  # 0x145a082ac
14552bb0a:     	movaps	%xmm13, %xmm9
14552bb0e:     	movaps	0x4e911a(%rip), %xmm12  # 0x145a14c30
14552bb16:     	testq	%r12, %r12
14552bb19:     	je	0x14552bfe5 <.text+0x552afe5>
14552bb1f:     	xorl	%eax, %eax
14552bb21:     	movaps	0x4e9107(%rip), %xmm12  # 0x145a14c30
14552bb29:     	movaps	0x4e910f(%rip), %xmm13  # 0x145a14c40
14552bb31:     	jmp	0x14552bb4c <.text+0x552ab4c>
14552bb33:     	nopw	%cs:(%rax,%rax)
14552bb40:     	incq	%rax
14552bb43:     	cmpq	%r12, %rax
14552bb46:     	je	0x14552bfe0 <.text+0x552afe0>
14552bb4c:     	leaq	(%rax,%rax,2), %rdx
14552bb50:     	shlq	$0x7, %rdx
14552bb54:     	movq	0x10(%r15,%rdx), %rcx
14552bb59:     	testq	%rcx, %rcx
14552bb5c:     	je	0x14552bb40 <.text+0x552ab40>
14552bb5e:     	movq	0x8(%r15,%rdx), %rdx
14552bb63:     	cmpq	$0x9, %rcx
14552bb67:     	jae	0x14552bb80 <.text+0x552ab80>
14552bb69:     	xorl	%r8d, %r8d
14552bb6c:     	jmp	0x14552bf7c <.text+0x552af7c>
14552bb71:     	nopw	%cs:(%rax,%rax)
14552bb80:     	movl	%ecx, %r9d
14552bb83:     	andl	$0x7, %r9d
14552bb87:     	cmoveq	%rsi, %r9
14552bb8b:     	movq	%rcx, %r8
14552bb8e:     	subq	%r9, %r8
14552bb91:     	movaps	%xmm12, %xmm4
14552bb95:     	shufps	$0x55, %xmm12, %xmm4    # xmm4 = xmm4[1,1],xmm12[1,1]
14552bb9a:     	shufps	$0x0, %xmm12, %xmm12    # xmm12 = xmm12[0,0,0,0]
14552bb9f:     	movaps	%xmm13, %xmm1
14552bba3:     	shufps	$0x55, %xmm13, %xmm1    # xmm1 = xmm1[1,1],xmm13[1,1]
14552bba8:     	shufps	$0x0, %xmm13, %xmm13    # xmm13 = xmm13[0,0,0,0]
14552bbad:     	leaq	0x58(%rdx), %r9
14552bbb1:     	movq	%r8, %r10
14552bbb4:     	movaps	%xmm4, %xmm5
14552bbb7:     	movaps	%xmm12, %xmm3
14552bbbb:     	movaps	%xmm1, %xmm2
14552bbbe:     	movaps	%xmm13, %xmm0
14552bbc2:     	nopw	%cs:(%rax,%rax)
14552bbd0:     	movss	-0x34(%r9), %xmm6
14552bbd6:     	movss	-0x40(%r9), %xmm8
14552bbdc:     	unpcklps	%xmm6, %xmm8            # xmm8 = xmm8[0],xmm6[0],xmm8[1],xmm6[1]
14552bbe0:     	movss	-0x58(%r9), %xmm9
14552bbe6:     	movss	-0x54(%r9), %xmm6
14552bbec:     	movss	-0x4c(%r9), %xmm15
14552bbf2:     	unpcklps	%xmm15, %xmm9           # xmm9 = xmm9[0],xmm15[0],xmm9[1],xmm15[1]
14552bbf6:     	movlhps	%xmm8, %xmm9            # xmm9 = xmm9[0],xmm8[0]
14552bbfa:     	movss	-0x48(%r9), %xmm8
14552bc00:     	unpcklps	%xmm8, %xmm6            # xmm6 = xmm6[0],xmm8[0],xmm6[1],xmm8[1]
14552bc04:     	movss	-0x4(%r9), %xmm8
14552bc0a:     	movss	-0x10(%r9), %xmm11
14552bc10:     	unpcklps	%xmm8, %xmm11           # xmm11 = xmm11[0],xmm8[0],xmm11[1],xmm8[1]
14552bc14:     	movss	-0x1c(%r9), %xmm8
14552bc1a:     	movss	-0x28(%r9), %xmm15
14552bc20:     	unpcklps	%xmm8, %xmm15           # xmm15 = xmm15[0],xmm8[0],xmm15[1],xmm8[1]
14552bc24:     	movlhps	%xmm11, %xmm15          # xmm15 = xmm15[0],xmm11[0]
14552bc28:     	movss	-0x30(%r9), %xmm8
14552bc2e:     	movss	-0x3c(%r9), %xmm11
14552bc34:     	unpcklps	%xmm8, %xmm11           # xmm11 = xmm11[0],xmm8[0],xmm11[1],xmm8[1]
14552bc38:     	movlhps	%xmm11, %xmm6           # xmm6 = xmm6[0],xmm11[0]
14552bc3c:     	movss	(%r9), %xmm8
14552bc41:     	movss	-0xc(%r9), %xmm11
14552bc47:     	unpcklps	%xmm8, %xmm11           # xmm11 = xmm11[0],xmm8[0],xmm11[1],xmm8[1]
14552bc4b:     	movss	-0x18(%r9), %xmm10
14552bc51:     	movss	-0x24(%r9), %xmm8
14552bc57:     	unpcklps	%xmm10, %xmm8           # xmm8 = xmm8[0],xmm10[0],xmm8[1],xmm10[1]
14552bc5b:     	movlhps	%xmm11, %xmm8           # xmm8 = xmm8[0],xmm11[0]
14552bc5f:     	movaps	%xmm13, %xmm10
14552bc63:     	minps	%xmm9, %xmm13
14552bc67:     	movaps	%xmm13, %xmm11
14552bc6b:     	cmpunordps	%xmm13, %xmm11
14552bc70:     	andps	%xmm11, %xmm10
14552bc74:     	andnps	%xmm13, %xmm11
14552bc78:     	movaps	%xmm11, %xmm13
14552bc7c:     	orps	%xmm10, %xmm13
14552bc80:     	movaps	%xmm0, %xmm10
14552bc84:     	minps	%xmm15, %xmm0
14552bc88:     	movaps	%xmm0, %xmm11
14552bc8c:     	cmpunordps	%xmm0, %xmm11
14552bc91:     	andps	%xmm11, %xmm10
14552bc95:     	andnps	%xmm0, %xmm11
14552bc99:     	movaps	%xmm11, %xmm0
14552bc9d:     	orps	%xmm10, %xmm0
14552bca1:     	movaps	%xmm1, %xmm10
14552bca5:     	minps	%xmm6, %xmm1
14552bca8:     	movaps	%xmm1, %xmm11
14552bcac:     	cmpunordps	%xmm1, %xmm11
14552bcb1:     	andps	%xmm11, %xmm10
14552bcb5:     	andnps	%xmm1, %xmm11
14552bcb9:     	movaps	%xmm11, %xmm1
14552bcbd:     	orps	%xmm10, %xmm1
14552bcc1:     	movaps	%xmm2, %xmm10
14552bcc5:     	minps	%xmm8, %xmm2
14552bcc9:     	movaps	%xmm2, %xmm11
14552bccd:     	cmpunordps	%xmm2, %xmm11
14552bcd2:     	andps	%xmm11, %xmm10
14552bcd6:     	andnps	%xmm2, %xmm11
14552bcda:     	movaps	%xmm11, %xmm2
14552bcde:     	orps	%xmm10, %xmm2
14552bce2:     	movaps	%xmm12, %xmm10
14552bce6:     	maxps	%xmm9, %xmm12
14552bcea:     	movaps	%xmm12, %xmm9
14552bcee:     	cmpunordps	%xmm12, %xmm9
14552bcf3:     	andps	%xmm9, %xmm10
14552bcf7:     	andnps	%xmm12, %xmm9
14552bcfb:     	movaps	%xmm9, %xmm12
14552bcff:     	orps	%xmm10, %xmm12
14552bd03:     	movaps	%xmm3, %xmm9
14552bd07:     	maxps	%xmm15, %xmm3
14552bd0b:     	movaps	%xmm3, %xmm10
14552bd0f:     	cmpunordps	%xmm3, %xmm10
14552bd14:     	andps	%xmm10, %xmm9
14552bd18:     	andnps	%xmm3, %xmm10
14552bd1c:     	movaps	%xmm10, %xmm3
14552bd20:     	orps	%xmm9, %xmm3
14552bd24:     	movaps	%xmm4, %xmm9
14552bd28:     	maxps	%xmm6, %xmm4
14552bd2b:     	movaps	%xmm4, %xmm6
14552bd2e:     	cmpunordps	%xmm4, %xmm6
14552bd32:     	andps	%xmm6, %xmm9
14552bd36:     	andnps	%xmm4, %xmm6
14552bd39:     	movaps	%xmm6, %xmm4
14552bd3c:     	orps	%xmm9, %xmm4
14552bd40:     	movaps	%xmm5, %xmm6
14552bd43:     	maxps	%xmm8, %xmm5
14552bd47:     	movaps	%xmm5, %xmm8
14552bd4b:     	cmpunordps	%xmm5, %xmm8
14552bd50:     	andps	%xmm8, %xmm6
14552bd54:     	andnps	%xmm5, %xmm8
14552bd58:     	movaps	%xmm8, %xmm5
14552bd5c:     	orps	%xmm6, %xmm5
14552bd5f:     	addq	$0x60, %r9
14552bd63:     	addq	$-0x8, %r10
14552bd67:     	jne	0x14552bbd0 <.text+0x552abd0>
14552bd6d:     	movaps	%xmm4, %xmm6
14552bd70:     	maxps	%xmm5, %xmm6
14552bd73:     	movaps	%xmm6, %xmm5
14552bd76:     	cmpunordps	%xmm6, %xmm5
14552bd7a:     	andps	%xmm5, %xmm4
14552bd7d:     	andnps	%xmm6, %xmm5
14552bd80:     	orps	%xmm4, %xmm5
14552bd83:     	pshufd	$0xff, %xmm5, %xmm6     # xmm6 = xmm5[3,3,3,3]
14552bd88:     	pshufd	$0xee, %xmm5, %xmm8     # xmm8 = xmm5[2,3,2,3]
14552bd8e:     	pshufd	$0xf5, %xmm5, %xmm9     # xmm9 = xmm5[1,1,3,3]
14552bd94:     	movaps	%xmm5, %xmm4
14552bd97:     	cmpunordss	%xmm5, %xmm4
14552bd9c:     	movaps	%xmm4, %xmm10
14552bda0:     	andps	%xmm9, %xmm10
14552bda4:     	maxss	%xmm5, %xmm9
14552bda9:     	andnps	%xmm9, %xmm4
14552bdad:     	orps	%xmm10, %xmm4
14552bdb1:     	movdqa	%xmm8, %xmm5
14552bdb6:     	maxss	%xmm4, %xmm5
14552bdba:     	cmpunordss	%xmm4, %xmm4
14552bdbf:     	movaps	%xmm4, %xmm9
14552bdc3:     	andnps	%xmm5, %xmm9
14552bdc7:     	andps	%xmm8, %xmm4
14552bdcb:     	orps	%xmm9, %xmm4
14552bdcf:     	movdqa	%xmm6, %xmm5
14552bdd3:     	maxss	%xmm4, %xmm5
14552bdd7:     	cmpunordss	%xmm4, %xmm4
14552bddc:     	movaps	%xmm4, %xmm8
14552bde0:     	andnps	%xmm5, %xmm8
14552bde4:     	andps	%xmm6, %xmm4
14552bde7:     	orps	%xmm8, %xmm4
14552bdeb:     	movaps	%xmm12, %xmm5
14552bdef:     	maxps	%xmm3, %xmm5
14552bdf2:     	movaps	%xmm5, %xmm3
14552bdf5:     	cmpunordps	%xmm5, %xmm3
14552bdf9:     	andps	%xmm3, %xmm12
14552bdfd:     	andnps	%xmm5, %xmm3
14552be00:     	orps	%xmm12, %xmm3
14552be04:     	pshufd	$0xff, %xmm3, %xmm5     # xmm5 = xmm3[3,3,3,3]
14552be09:     	pshufd	$0xee, %xmm3, %xmm6     # xmm6 = xmm3[2,3,2,3]
14552be0e:     	pshufd	$0xf5, %xmm3, %xmm8     # xmm8 = xmm3[1,1,3,3]
14552be14:     	movaps	%xmm3, %xmm12
14552be18:     	cmpunordss	%xmm3, %xmm12
14552be1e:     	movaps	%xmm12, %xmm9
14552be22:     	andps	%xmm8, %xmm9
14552be26:     	maxss	%xmm3, %xmm8
14552be2b:     	andnps	%xmm8, %xmm12
14552be2f:     	orps	%xmm9, %xmm12
14552be33:     	movdqa	%xmm6, %xmm3
14552be37:     	maxss	%xmm12, %xmm3
14552be3c:     	cmpunordss	%xmm12, %xmm12
14552be42:     	movaps	%xmm12, %xmm8
14552be46:     	andnps	%xmm3, %xmm8
14552be4a:     	andps	%xmm6, %xmm12
14552be4e:     	orps	%xmm8, %xmm12
14552be52:     	movdqa	%xmm5, %xmm3
14552be56:     	maxss	%xmm12, %xmm3
14552be5b:     	cmpunordss	%xmm12, %xmm12
14552be61:     	movaps	%xmm12, %xmm6
14552be65:     	andnps	%xmm3, %xmm6
14552be68:     	andps	%xmm5, %xmm12
14552be6c:     	orps	%xmm6, %xmm12
14552be70:     	movaps	%xmm1, %xmm3
14552be73:     	minps	%xmm2, %xmm3
14552be76:     	movaps	%xmm3, %xmm2
14552be79:     	cmpunordps	%xmm3, %xmm2
14552be7d:     	andps	%xmm2, %xmm1
14552be80:     	andnps	%xmm3, %xmm2
14552be83:     	orps	%xmm1, %xmm2
14552be86:     	pshufd	$0xff, %xmm2, %xmm3     # xmm3 = xmm2[3,3,3,3]
14552be8b:     	pshufd	$0xee, %xmm2, %xmm5     # xmm5 = xmm2[2,3,2,3]
14552be90:     	pshufd	$0xf5, %xmm2, %xmm6     # xmm6 = xmm2[1,1,3,3]
14552be95:     	movaps	%xmm2, %xmm1
14552be98:     	cmpunordss	%xmm2, %xmm1
14552be9d:     	movaps	%xmm1, %xmm8
14552bea1:     	andps	%xmm6, %xmm8
14552bea5:     	minss	%xmm2, %xmm6
14552bea9:     	andnps	%xmm6, %xmm1
14552beac:     	orps	%xmm8, %xmm1
14552beb0:     	movdqa	%xmm5, %xmm2
14552beb4:     	minss	%xmm1, %xmm2
14552beb8:     	cmpunordss	%xmm1, %xmm1
14552bebd:     	movaps	%xmm1, %xmm6
14552bec0:     	andnps	%xmm2, %xmm6
14552bec3:     	andps	%xmm5, %xmm1
14552bec6:     	orps	%xmm6, %xmm1
14552bec9:     	movdqa	%xmm3, %xmm2
14552becd:     	minss	%xmm1, %xmm2
14552bed1:     	cmpunordss	%xmm1, %xmm1
14552bed6:     	movaps	%xmm1, %xmm5
14552bed9:     	andnps	%xmm2, %xmm5
14552bedc:     	andps	%xmm3, %xmm1
14552bedf:     	orps	%xmm5, %xmm1
14552bee2:     	movaps	%xmm13, %xmm2
14552bee6:     	minps	%xmm0, %xmm2
14552bee9:     	movaps	%xmm2, %xmm0
14552beec:     	cmpunordps	%xmm2, %xmm0
14552bef0:     	andps	%xmm0, %xmm13
14552bef4:     	andnps	%xmm2, %xmm0
14552bef7:     	orps	%xmm13, %xmm0
14552befb:     	pshufd	$0xff, %xmm0, %xmm2     # xmm2 = xmm0[3,3,3,3]
14552bf00:     	pshufd	$0xee, %xmm0, %xmm3     # xmm3 = xmm0[2,3,2,3]
14552bf05:     	pshufd	$0xf5, %xmm0, %xmm5     # xmm5 = xmm0[1,1,3,3]
14552bf0a:     	movaps	%xmm0, %xmm13
14552bf0e:     	cmpunordss	%xmm0, %xmm13
14552bf14:     	movaps	%xmm13, %xmm6
14552bf18:     	andps	%xmm5, %xmm6
14552bf1b:     	minss	%xmm0, %xmm5
14552bf1f:     	andnps	%xmm5, %xmm13
14552bf23:     	orps	%xmm6, %xmm13
14552bf27:     	movdqa	%xmm3, %xmm0
14552bf2b:     	minss	%xmm13, %xmm0
14552bf30:     	cmpunordss	%xmm13, %xmm13
14552bf36:     	movaps	%xmm13, %xmm5
14552bf3a:     	andnps	%xmm0, %xmm5
14552bf3d:     	andps	%xmm3, %xmm13
14552bf41:     	orps	%xmm5, %xmm13
14552bf45:     	movdqa	%xmm2, %xmm0
14552bf49:     	minss	%xmm13, %xmm0
14552bf4e:     	cmpunordss	%xmm13, %xmm13
14552bf54:     	movaps	%xmm13, %xmm3
14552bf58:     	andnps	%xmm0, %xmm3
14552bf5b:     	andps	%xmm2, %xmm13
14552bf5f:     	orps	%xmm3, %xmm13
14552bf63:     	unpcklps	%xmm4, %xmm12           # xmm12 = xmm12[0],xmm4[0],xmm12[1],xmm4[1]
14552bf67:     	unpcklps	%xmm1, %xmm13           # xmm13 = xmm13[0],xmm1[0],xmm13[1],xmm1[1]
14552bf6b:     	movss	0x184(%rbp), %xmm10
14552bf74:     	movaps	0x150(%rbp), %xmm11
14552bf7c:     	subq	%r8, %rcx
14552bf7f:     	leaq	(%r8,%r8,2), %r8
14552bf83:     	leaq	(%rdx,%r8,4), %rdx
14552bf87:     	movaps	%xmm12, %xmm0
14552bf8b:     	movaps	%xmm13, %xmm1
14552bf8f:     	nop
14552bf90:     	movsd	(%rdx), %xmm2
14552bf94:     	movaps	%xmm1, %xmm3
14552bf97:     	minps	%xmm2, %xmm3
14552bf9a:     	movaps	%xmm3, %xmm13
14552bf9e:     	cmpunordps	%xmm3, %xmm13
14552bfa3:     	andps	%xmm13, %xmm1
14552bfa7:     	andnps	%xmm3, %xmm13
14552bfab:     	orps	%xmm1, %xmm13
14552bfaf:     	movaps	%xmm0, %xmm1
14552bfb2:     	maxps	%xmm2, %xmm1
14552bfb5:     	movaps	%xmm1, %xmm12
14552bfb9:     	cmpunordps	%xmm1, %xmm12
14552bfbe:     	andps	%xmm12, %xmm0
14552bfc2:     	andnps	%xmm1, %xmm12
14552bfc6:     	orps	%xmm0, %xmm12
14552bfca:     	addq	$0xc, %rdx
14552bfce:     	movaps	%xmm12, %xmm0
14552bfd2:     	movaps	%xmm13, %xmm1
14552bfd6:     	decq	%rcx
14552bfd9:     	jne	0x14552bf90 <.text+0x552af90>
14552bfdb:     	jmp	0x14552bb40 <.text+0x552ab40>
14552bfe0:     	movshdup	%xmm13, %xmm9           # xmm9 = xmm13[1,1,3,3]
14552bfe5:     	addq	$0x48, %r11
14552bfe9:     	movq	%r11, 0x178(%rbp)
14552bff0:     	movshdup	%xmm12, %xmm15          # xmm15 = xmm12[1,1,3,3]
14552bff5:     	xorl	%r13d, %r13d
14552bff8:     	nopl	(%rax,%rax)
14552c000:     	cmpq	0x170(%rbp), %r13
14552c007:     	jae	0x14552bae0 <.text+0x552aae0>
14552c00d:     	movq	%r13, %rdi
14552c010:     	testq	%r13, %r13
14552c013:     	js	0x14552c020 <.text+0x552b020>
14552c015:     	xorps	%xmm8, %xmm8
14552c019:     	cvtsi2ss	%rdi, %xmm8
14552c01e:     	jmp	0x14552c03c <.text+0x552b03c>
14552c020:     	movq	%rdi, %rax
14552c023:     	shrq	%rax
14552c026:     	movl	%edi, %ecx
14552c028:     	andl	$0x1, %ecx
14552c02b:     	orq	%rax, %rcx
14552c02e:     	xorps	%xmm8, %xmm8
14552c032:     	cvtsi2ss	%rcx, %xmm8
14552c037:     	addss	%xmm8, %xmm8
14552c03c:     	leaq	0x1(%rdi), %r13
14552c040:     	addss	%xmm14, %xmm8
14552c045:     	mulss	%xmm14, %xmm8
14552c04a:     	addss	%xmm11, %xmm8
14552c04f:     	ucomiss	%xmm8, %xmm9
14552c053:     	ja	0x14552c000 <.text+0x552b000>
14552c055:     	ucomiss	%xmm15, %xmm8
14552c059:     	ja	0x14552c000 <.text+0x552b000>
14552c05b:     	imulq	0x170(%rbp), %rdi
14552c063:     	xorl	%ebx, %ebx
14552c065:     	jmp	0x14552c08e <.text+0x552b08e>
14552c067:     	nopw	(%rax,%rax)
14552c070:     	addl	%edi, %r14d
14552c073:     	movq	0x140(%rbp), %rax
14552c07a:     	movl	%r14d, (%rax,%rsi,8)
14552c07e:     	movss	%xmm6, 0x4(%rax,%rsi,8)
14552c084:     	incq	%rsi
14552c087:     	movq	%rsi, 0x148(%rbp)
14552c08e:     	cmpq	0x170(%rbp), %rbx
14552c095:     	jae	0x14552c000 <.text+0x552b000>
14552c09b:     	movq	%rbx, %r14
14552c09e:     	testq	%rbx, %rbx
14552c0a1:     	js	0x14552c0b0 <.text+0x552b0b0>
14552c0a3:     	xorps	%xmm0, %xmm0
14552c0a6:     	cvtsi2ss	%r14, %xmm0
14552c0ab:     	jmp	0x14552c0cb <.text+0x552b0cb>
14552c0ad:     	nopl	(%rax)
14552c0b0:     	movq	%r14, %rax
14552c0b3:     	shrq	%rax
14552c0b6:     	movl	%r14d, %ecx
14552c0b9:     	andl	$0x1, %ecx
14552c0bc:     	orq	%rax, %rcx
14552c0bf:     	xorps	%xmm0, %xmm0
14552c0c2:     	cvtsi2ss	%rcx, %xmm0
14552c0c7:     	addss	%xmm0, %xmm0
14552c0cb:     	leaq	0x1(%r14), %rbx
14552c0cf:     	addss	%xmm14, %xmm0
14552c0d4:     	mulss	%xmm14, %xmm0
14552c0d9:     	addss	%xmm7, %xmm0
14552c0dd:     	ucomiss	%xmm0, %xmm13
14552c0e1:     	ja	0x14552c08e <.text+0x552b08e>
14552c0e3:     	ucomiss	%xmm12, %xmm0
14552c0e7:     	ja	0x14552c08e <.text+0x552b08e>
14552c0e9:     	movss	%xmm0, -0x48(%rbp)
14552c0ee:     	movss	%xmm8, -0x44(%rbp)
14552c0f4:     	movl	$0x0, -0x40(%rbp)
14552c0fb:     	movq	%r15, %rcx
14552c0fe:     	movq	%r12, %rdx
14552c101:     	leaq	-0x48(%rbp), %r8
14552c105:     	callq	0x14568f2e0 <.text+0x568e2e0>
14552c10a:     	nop
14552c10b:     	cmpl	$0x1, %eax
14552c10e:     	jne	0x14552c08e <.text+0x552b08e>
14552c114:     	movaps	%xmm0, %xmm6
14552c117:     	ucomiss	%xmm0, %xmm10
14552c11b:     	jb	0x14552c08e <.text+0x552b08e>
14552c121:     	movq	0x148(%rbp), %rsi
14552c128:     	cmpq	0x138(%rbp), %rsi
14552c12f:     	jne	0x14552c070 <.text+0x552b070>
14552c135:     	leaq	0x138(%rbp), %rcx
14552c13c:     	callq	0x145780180 <.text+0x577f180>
14552c141:     	nop
14552c142:     	jmp	0x14552c070 <.text+0x552b070>
14552c147:     	movq	0x140(%rbp), %rcx
14552c14e:     	movq	0x148(%rbp), %rdx
14552c155:     	leaq	0x163(%rbp), %rax
14552c15c:     	movq	%rax, -0x48(%rbp)
14552c160:     	cmpq	$0x2, %rdx
14552c164:     	jae	0x14552ca69 <.text+0x552ba69>
14552c16a:     	movq	0x170(%rbp), %r15
14552c171:     	imulq	%r15, %r15
14552c175:     	leaq	0x4(,%r15,4), %r14
14552c17d:     	movabsq	$0x3ffffffffffffffe, %rax # imm = 0x3FFFFFFFFFFFFFFE
14552c187:     	cmpq	%rax, %r15
14552c18a:     	seta	%al
14552c18d:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
14552c197:     	cmpq	%rcx, %r14
14552c19a:     	seta	%cl
14552c19d:     	orb	%al, %cl
14552c19f:     	je	0x14552c1b4 <.text+0x552b1b4>
14552c1a1:     	xorl	%ebx, %ebx
14552c1a3:     	movq	%rbx, %rcx
14552c1a6:     	movq	%r14, %rdx
14552c1a9:     	callq	0x14590379b <.text+0x590279b>
14552c1ae:     	nop
14552c1af:     	jmp	0x14552cb82 <.text+0x552bb82>
14552c1b4:     	leaq	0x1(%r15), %rsi
14552c1b8:     	testq	%r14, %r14
14552c1bb:     	je	0x14552c1de <.text+0x552b1de>
14552c1bd:     	callq	0x140002200 <.text+0x1200>
14552c1c2:     	movl	$0x4, %ebx
14552c1c7:     	movl	$0x4, %edx
14552c1cc:     	movq	%r14, %rcx
14552c1cf:     	callq	0x1400021f0 <.text+0x11f0>
14552c1d4:     	testq	%rax, %rax
14552c1d7:     	je	0x14552c1a3 <.text+0x552b1a3>
14552c1d9:     	movq	%rsi, %r10
14552c1dc:     	jmp	0x14552c1e6 <.text+0x552b1e6>
14552c1de:     	movl	$0x4, %eax
14552c1e3:     	xorl	%r10d, %r10d
14552c1e6:     	movq	0x148(%rbp), %r9
14552c1ed:     	testq	%r9, %r9
14552c1f0:     	movq	%rax, 0x168(%rbp)
14552c1f7:     	movq	%r10, 0xd8(%rbp)
14552c1fe:     	je	0x14552c22c <.text+0x552b22c>
14552c200:     	movq	0x140(%rbp), %rdx
14552c207:     	shlq	$0x3, %r9
14552c20b:     	xorl	%r8d, %r8d
14552c20e:     	nop
14552c210:     	movl	(%rdx,%r8), %ecx
14552c214:     	cmpq	%rcx, %r15
14552c217:     	jbe	0x14552cac6 <.text+0x552bac6>
14552c21d:     	incl	0x4(%rax,%rcx,4)
14552c221:     	addq	$0x8, %r8
14552c225:     	cmpq	%r8, %r9
14552c228:     	jne	0x14552c210 <.text+0x552b210>
14552c22a:     	jmp	0x14552c235 <.text+0x552b235>
14552c22c:     	testq	%r15, %r15
14552c22f:     	je	0x14552c385 <.text+0x552b385>
14552c235:     	movl	(%rax), %r9d
14552c238:     	leaq	-0x1(%r15), %rdi
14552c23c:     	movl	%r15d, %ecx
14552c23f:     	andl	$0x3, %ecx
14552c242:     	cmpq	$0x3, %rdi
14552c246:     	jae	0x14552c24d <.text+0x552b24d>
14552c248:     	xorl	%r8d, %r8d
14552c24b:     	jmp	0x14552c296 <.text+0x552b296>
14552c24d:     	movabsq	$0x3ffffffffffffffc, %rdx # imm = 0x3FFFFFFFFFFFFFFC
14552c257:     	andq	%r15, %rdx
14552c25a:     	xorl	%r8d, %r8d
14552c25d:     	nopl	(%rax)
14552c260:     	addl	0x4(%rax,%r8,4), %r9d
14552c265:     	movl	%r9d, 0x4(%rax,%r8,4)
14552c26a:     	addl	0x8(%rax,%r8,4), %r9d
14552c26f:     	movl	%r9d, 0x8(%rax,%r8,4)
14552c274:     	addl	0xc(%rax,%r8,4), %r9d
14552c279:     	movl	%r9d, 0xc(%rax,%r8,4)
14552c27e:     	addl	0x10(%rax,%r8,4), %r9d
14552c283:     	movl	%r9d, 0x10(%rax,%r8,4)
14552c288:     	addq	$0x4, %r8
14552c28c:     	cmpq	%r8, %rdx
14552c28f:     	jne	0x14552c260 <.text+0x552b260>
14552c291:     	testq	%rcx, %rcx
14552c294:     	je	0x14552c2c0 <.text+0x552b2c0>
14552c296:     	leaq	(%rax,%r8,4), %rdx
14552c29a:     	addq	$0x4, %rdx
14552c29e:     	xorl	%r8d, %r8d
14552c2a1:     	nopw	%cs:(%rax,%rax)
14552c2b0:     	addl	(%rdx,%r8,4), %r9d
14552c2b4:     	movl	%r9d, (%rdx,%r8,4)
14552c2b8:     	incq	%r8
14552c2bb:     	cmpq	%r8, %rcx
14552c2be:     	jne	0x14552c2b0 <.text+0x552b2b0>
14552c2c0:     	leaq	(,%r15,4), %r14
14552c2c8:     	movq	%r15, %rax
14552c2cb:     	shrq	$0x3d, %rax
14552c2cf:     	je	0x14552c2e4 <.text+0x552b2e4>
14552c2d1:     	xorl	%ebx, %ebx
14552c2d3:     	movq	%rbx, %rcx
14552c2d6:     	movq	%r14, %rdx
14552c2d9:     	callq	0x14590379b <.text+0x590279b>
14552c2de:     	nop
14552c2df:     	jmp	0x14552cb82 <.text+0x552bb82>
14552c2e4:     	callq	0x140002200 <.text+0x1200>
14552c2e9:     	movl	$0x4, %ebx
14552c2ee:     	movl	$0x4, %edx
14552c2f3:     	movq	%r14, %rcx
14552c2f6:     	callq	0x1400021c0 <.text+0x11c0>
14552c2fb:     	testq	%rax, %rax
14552c2fe:     	je	0x14552c2d3 <.text+0x552b2d3>
14552c300:     	movq	%rax, %r9
14552c303:     	cmpq	$0x2, %r15
14552c307:     	jb	0x14552c360 <.text+0x552b360>
14552c309:     	movl	$0x1, %ecx
14552c30e:     	movq	%rax, %r9
14552c311:     	cmpq	$0x9, %r15
14552c315:     	jb	0x14552c349 <.text+0x552b349>
14552c317:     	movq	%rdi, %rdx
14552c31a:     	andq	$-0x8, %rdx
14552c31e:     	leaq	(%rax,%rdx,4), %r9
14552c322:     	leaq	0x1(%rdx), %rcx
14552c326:     	xorl	%r8d, %r8d
14552c329:     	movaps	0x6bbab0(%rip), %xmm0   # 0x145be7de0
14552c330:     	movups	%xmm0, (%rax,%r8,4)
14552c335:     	movups	%xmm0, 0x10(%rax,%r8,4)
14552c33b:     	addq	$0x8, %r8
14552c33f:     	cmpq	%r8, %rdx
14552c342:     	jne	0x14552c330 <.text+0x552b330>
14552c344:     	cmpq	%rdx, %rdi
14552c347:     	je	0x14552c360 <.text+0x552b360>
14552c349:     	movq	%r15, %rdx
14552c34c:     	subq	%rcx, %rdx
14552c34f:     	nop
14552c350:     	movl	$0x7fc00000, (%r9)      # imm = 0x7FC00000
14552c357:     	addq	$0x4, %r9
14552c35b:     	decq	%rdx
14552c35e:     	jne	0x14552c350 <.text+0x552b350>
14552c360:     	movq	%rax, 0x150(%rbp)
14552c367:     	movq	%rsi, 0x130(%rbp)
14552c36e:     	movl	$0x7fc00000, (%r9)      # imm = 0x7FC00000
14552c375:     	movq	%r15, 0x128(%rbp)
14552c37c:     	movq	%r15, 0x178(%rbp)
14552c383:     	jmp	0x14552c3aa <.text+0x552b3aa>
14552c385:     	movq	%r15, 0x128(%rbp)
14552c38c:     	movq	%rsi, 0x130(%rbp)
14552c393:     	movl	$0x4, %eax
14552c398:     	movq	%rax, 0x150(%rbp)
14552c39f:     	movq	$0x0, 0x178(%rbp)
14552c3aa:     	movaps	0xa0(%rbp), %xmm2
14552c3b1:     	subps	%xmm7, %xmm2
14552c3b4:     	movshdup	%xmm2, %xmm0            # xmm0 = xmm2[1,1,3,3]
14552c3b8:     	addss	%xmm2, %xmm2
14552c3bc:     	cvttss2si	%xmm2, %r9d
14552c3c1:     	movss	0x4b8e17(%rip), %xmm1   # 0x1459e51e0
14552c3c9:     	ucomiss	%xmm1, %xmm2
14552c3cc:     	movl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
14552c3d1:     	cmoval	%eax, %r9d
14552c3d5:     	xorl	%r8d, %r8d
14552c3d8:     	ucomiss	%xmm2, %xmm2
14552c3db:     	cmovpl	%r8d, %r9d
14552c3df:     	addss	%xmm0, %xmm0
14552c3e3:     	cvttss2si	%xmm0, %ecx
14552c3e7:     	ucomiss	%xmm1, %xmm0
14552c3ea:     	cmoval	%eax, %ecx
14552c3ed:     	ucomiss	%xmm0, %xmm0
14552c3f0:     	cmovpl	%r8d, %ecx
14552c3f4:     	movq	%rcx, 0x110(%rbp)
14552c3fb:     	movq	0x140(%rbp), %rax
14552c402:     	movq	%rax, 0xa0(%rbp)
14552c409:     	movq	0x148(%rbp), %rax
14552c410:     	movq	%rax, 0x120(%rbp)
14552c417:     	movl	$0xfffffff0, %r12d      # imm = 0xFFFFFFF0
14552c41d:     	movaps	0x3e935c(%rip), %xmm0   # 0x145915780
14552c424:     	movss	0x1211aa4(%rip), %xmm1  # 0x14673ded0
14552c42c:     	nopl	(%rax)
14552c430:     	leal	0x1(%r12), %ecx
14552c435:     	cmpl	$0x10, %r12d
14552c439:     	cmovel	%r12d, %ecx
14552c43d:     	movq	0x110(%rbp), %rax
14552c444:     	leal	(%r12,%rax), %edi
14552c448:     	movq	0x170(%rbp), %rax
14552c44f:     	cmpl	%eax, %edi
14552c451:     	jge	0x14552c66c <.text+0x552b66c>
14552c457:     	movl	%r12d, %r14d
14552c45a:     	imull	%r12d, %r14d
14552c45e:     	imulq	%rdi, %rax
14552c462:     	movq	%rax, 0x118(%rbp)
14552c469:     	movl	$0xfffffff0, %r11d      # imm = 0xFFFFFFF0
14552c46f:     	movl	%ecx, 0x184(%rbp)
14552c475:     	movl	%r11d, %r15d
14552c478:     	movl	%r11d, %ecx
14552c47b:     	testb	$0x1, %r8b
14552c47f:     	je	0x14552c4e0 <.text+0x552b4e0>
14552c481:     	nopw	%cs:(%rax,%rax)
14552c490:     	leal	0x1(%rcx), %r11d
14552c494:     	cmpl	$0x10, %ecx
14552c497:     	sete	%r10b
14552c49b:     	cmovel	%ecx, %r11d
14552c49f:     	leal	(%rcx,%r9), %eax
14552c4a3:     	cmpl	0x170(%rbp), %eax
14552c4a9:     	jge	0x14552c4c0 <.text+0x552b4c0>
14552c4ab:     	movl	%eax, %edx
14552c4ad:     	orl	%edi, %edx
14552c4af:     	js	0x14552c4c0 <.text+0x552b4c0>
14552c4b1:     	movl	%ecx, %r15d
14552c4b4:     	imull	%r15d, %r15d
14552c4b8:     	addl	%r14d, %r15d
14552c4bb:     	cmpl	%ebx, %r15d
14552c4be:     	jl	0x14552c527 <.text+0x552b527>
14552c4c0:     	cmpl	$0x10, %ecx
14552c4c3:     	je	0x14552c660 <.text+0x552b660>
14552c4c9:     	movl	%r11d, %ecx
14552c4cc:     	cmpl	$0x10, %r11d
14552c4d0:     	jle	0x14552c490 <.text+0x552b490>
14552c4d2:     	jmp	0x14552c660 <.text+0x552b660>
14552c4d7:     	nopw	(%rax,%rax)
14552c4e0:     	leal	0x1(%r15), %r11d
14552c4e4:     	cmpl	$0x10, %r15d
14552c4e8:     	sete	%r10b
14552c4ec:     	cmovel	%r15d, %r11d
14552c4f0:     	leal	(%r15,%r9), %eax
14552c4f4:     	cmpl	0x170(%rbp), %eax
14552c4fa:     	jge	0x14552c502 <.text+0x552b502>
14552c4fc:     	movl	%eax, %ecx
14552c4fe:     	orl	%edi, %ecx
14552c500:     	jns	0x14552c520 <.text+0x552b520>
14552c502:     	cmpl	$0x10, %r15d
14552c506:     	je	0x14552c680 <.text+0x552b680>
14552c50c:     	movl	%r11d, %r15d
14552c50f:     	cmpl	$0x10, %r11d
14552c513:     	jle	0x14552c4e0 <.text+0x552b4e0>
14552c515:     	jmp	0x14552c680 <.text+0x552b680>
14552c51a:     	nopw	(%rax,%rax)
14552c520:     	imull	%r15d, %r15d
14552c524:     	addl	%r14d, %r15d
14552c527:     	movl	%eax, %ecx
14552c529:     	addq	0x118(%rbp), %rcx
14552c530:     	cmpq	0x128(%rbp), %rcx
14552c537:     	ja	0x14552cb1f <.text+0x552bb1f>
14552c53d:     	jae	0x14552cb35 <.text+0x552bb35>
14552c543:     	movq	0x168(%rbp), %rdx
14552c54a:     	movl	(%rdx,%rcx,4), %eax
14552c54d:     	movl	0x4(%rdx,%rcx,4), %edx
14552c551:     	cmpl	%eax, %edx
14552c553:     	jb	0x14552ca37 <.text+0x552ba37>
14552c559:     	cmpq	%rdx, 0x120(%rbp)
14552c560:     	jb	0x14552ca37 <.text+0x552ba37>
14552c566:     	cmpl	%edx, %eax
14552c568:     	je	0x14552c63d <.text+0x552b63d>
14552c56e:     	movq	%r8, 0xd0(%rbp)
14552c575:     	movq	0xa0(%rbp), %r8
14552c57c:     	leaq	(%r8,%rdx,8), %r13
14552c580:     	leaq	(%r8,%rax,8), %r8
14552c584:     	leaq	(,%rax,8), %rsi
14552c58c:     	leaq	(,%rdx,8), %rax
14552c594:     	subq	%rsi, %rax
14552c597:     	addq	$-0x8, %rax
14552c59b:     	nopl	(%rax,%rax)
14552c5a0:     	leaq	0x8(%r8), %rdx
14552c5a4:     	movss	0x4(%r8), %xmm3
14552c5aa:     	movaps	%xmm3, %xmm4
14552c5ad:     	subss	0x164(%rbp), %xmm4
14552c5b5:     	andps	%xmm0, %xmm4
14552c5b8:     	ucomiss	%xmm4, %xmm1
14552c5bb:     	jae	0x14552c5d2 <.text+0x552b5d2>
14552c5bd:     	addq	$-0x8, %rax
14552c5c1:     	movq	%rdx, %r8
14552c5c4:     	cmpq	%r13, %rdx
14552c5c7:     	jne	0x14552c5a0 <.text+0x552b5a0>
14552c5c9:     	movq	0xd0(%rbp), %r8
14552c5d0:     	jmp	0x14552c63d <.text+0x552b63d>
14552c5d2:     	cmpq	%r13, %rdx
14552c5d5:     	je	0x14552c62a <.text+0x552b62a>
14552c5d7:     	shrq	$0x3, %rax
14552c5db:     	xorl	%edx, %edx
14552c5dd:     	jmp	0x14552c5ee <.text+0x552b5ee>
14552c5df:     	nop
14552c5e0:     	movaps	%xmm5, %xmm3
14552c5e3:     	movaps	%xmm2, %xmm4
14552c5e6:     	incq	%rdx
14552c5e9:     	cmpq	%rdx, %rax
14552c5ec:     	je	0x14552c62a <.text+0x552b62a>
14552c5ee:     	movss	0xc(%r8,%rdx,8), %xmm5
14552c5f5:     	movaps	%xmm5, %xmm2
14552c5f8:     	subss	0x164(%rbp), %xmm2
14552c600:     	andps	%xmm0, %xmm2
14552c603:     	ucomiss	%xmm2, %xmm1
14552c606:     	jb	0x14552c5e6 <.text+0x552b5e6>
14552c608:     	movd	%xmm4, %esi
14552c60c:     	movd	%xmm2, %ebx
14552c610:     	movl	%esi, %r13d
14552c613:     	sarl	$0x1f, %r13d
14552c617:     	shrl	%r13d
14552c61a:     	xorl	%esi, %r13d
14552c61d:     	cmpl	%ebx, %r13d
14552c620:     	jg	0x14552c5e0 <.text+0x552b5e0>
14552c622:     	movaps	%xmm4, %xmm2
14552c625:     	movaps	%xmm3, %xmm5
14552c628:     	jmp	0x14552c5e0 <.text+0x552b5e0>
14552c62a:     	movq	%rcx, 0xc8(%rbp)
14552c631:     	movaps	%xmm3, %xmm2
14552c634:     	movl	%r15d, %ebx
14552c637:     	movl	$0x1, %r8d
14552c63d:     	cmpl	$0x11, %r11d
14552c641:     	setge	%al
14552c644:     	orb	%al, %r10b
14552c647:     	movl	0x184(%rbp), %ecx
14552c64d:     	je	0x14552c475 <.text+0x552b475>
14552c653:     	jmp	0x14552c66c <.text+0x552b66c>
14552c655:     	nopw	%cs:(%rax,%rax)
14552c660:     	movl	$0x1, %r8d
14552c666:     	movl	0x184(%rbp), %ecx
14552c66c:     	cmpl	$0x10, %r12d
14552c670:     	je	0x14552c68f <.text+0x552b68f>
14552c672:     	movl	%ecx, %r12d
14552c675:     	cmpl	$0x10, %ecx
14552c678:     	jle	0x14552c430 <.text+0x552b430>
14552c67e:     	jmp	0x14552c68f <.text+0x552b68f>
14552c680:     	xorl	%r8d, %r8d
14552c683:     	movl	0x184(%rbp), %ecx
14552c689:     	cmpl	$0x10, %r12d
14552c68d:     	jne	0x14552c672 <.text+0x552b672>
14552c68f:     	cmpq	$0x1, %r8
14552c693:     	movq	0x168(%rbp), %rbx
14552c69a:     	jne	0x14552c8e7 <.text+0x552b8e7>
14552c6a0:     	movq	0x178(%rbp), %r12
14552c6a7:     	movq	0xc8(%rbp), %rsi
14552c6ae:     	cmpq	%r12, %rsi
14552c6b1:     	movq	0x150(%rbp), %rax
14552c6b8:     	jae	0x14552cb5d <.text+0x552bb5d>
14552c6be:     	movss	%xmm2, (%rax,%rsi,4)
14552c6c3:     	callq	0x140002200 <.text+0x1200>
14552c6c8:     	movl	$0x8, %ecx
14552c6cd:     	movl	$0x8, %edx
14552c6d2:     	callq	0x1400021c0 <.text+0x11c0>
14552c6d7:     	testq	%rax, %rax
14552c6da:     	je	0x14552cb72 <.text+0x552bb72>
14552c6e0:     	movq	$0x1, 0xe0(%rbp)
14552c6eb:     	movq	%rax, 0xe8(%rbp)
14552c6f2:     	movq	%rsi, (%rax)
14552c6f5:     	movq	$0x0, 0xf0(%rbp)
14552c700:     	movq	$0x1, 0xf8(%rbp)
14552c70b:     	movl	$0x1, %eax
14552c710:     	leaq	-0x28(%rbp), %rdi
14552c714:     	xorl	%r15d, %r15d
14552c717:     	leaq	0xe0(%rbp), %r14
14552c71e:     	jmp	0x14552c735 <.text+0x552b735>
14552c720:     	movq	0xf8(%rbp), %rax
14552c727:     	movq	0x168(%rbp), %rbx
14552c72e:     	movq	0x178(%rbp), %r12
14552c735:     	testq	%rax, %rax
14552c738:     	je	0x14552c918 <.text+0x552b918>
14552c73e:     	movq	0xf0(%rbp), %rcx
14552c745:     	leaq	0x1(%rcx), %r8
14552c749:     	movq	0xe0(%rbp), %r9
14552c750:     	movq	0xe8(%rbp), %rdx
14552c757:     	cmpq	%r9, %r8
14552c75a:     	cmovbq	%r15, %r9
14552c75e:     	negq	%r9
14552c761:     	decq	%rax
14552c764:     	leaq	(%rcx,%r9), %r8
14552c768:     	incq	%r8
14552c76b:     	movq	%r8, 0xf0(%rbp)
14552c772:     	movq	%rax, 0xf8(%rbp)
14552c779:     	cmpq	$0x0, 0x170(%rbp)
14552c781:     	je	0x14552cade <.text+0x552bade>
14552c787:     	movq	(%rdx,%rcx,8), %rcx
14552c78b:     	cmpq	%r12, %rcx
14552c78e:     	jae	0x14552caf0 <.text+0x552baf0>
14552c794:     	movq	%rcx, %rax
14552c797:     	movq	0x170(%rbp), %r12
14552c79e:     	orq	%r12, %rax
14552c7a1:     	shrq	$0x20, %rax
14552c7a5:     	je	0x14552c7c0 <.text+0x552b7c0>
14552c7a7:     	movq	%rcx, %rax
14552c7aa:     	xorl	%edx, %edx
14552c7ac:     	divq	%r12
14552c7af:     	jmp	0x14552c7c7 <.text+0x552b7c7>
14552c7b1:     	nopw	%cs:(%rax,%rax)
14552c7c0:     	movl	%ecx, %eax
14552c7c2:     	xorl	%edx, %edx
14552c7c4:     	divl	%r12d
14552c7c7:     	movq	0x150(%rbp), %r8
14552c7ce:     	movss	(%r8,%rcx,4), %xmm6
14552c7d4:     	xorl	%r8d, %r8d
14552c7d7:     	testq	%rdx, %rdx
14552c7da:     	setne	%r8b
14552c7de:     	leaq	-0x1(%rcx), %r9
14552c7e2:     	incq	%rdx
14552c7e5:     	xorl	%r10d, %r10d
14552c7e8:     	cmpq	%r12, %rdx
14552c7eb:     	setb	%r10b
14552c7ef:     	leaq	0x1(%rcx), %rdx
14552c7f3:     	xorl	%r11d, %r11d
14552c7f6:     	movq	%rcx, %rsi
14552c7f9:     	subq	%r12, %rsi
14552c7fc:     	setae	%r11b
14552c800:     	incq	%rax
14552c803:     	xorl	%ebx, %ebx
14552c805:     	cmpq	%r12, %rax
14552c808:     	setb	%bl
14552c80b:     	addq	%r12, %rcx
14552c80e:     	movq	%r8, -0x30(%rbp)
14552c812:     	movq	%r9, -0x28(%rbp)
14552c816:     	movq	%r10, -0x20(%rbp)
14552c81a:     	movq	%rdx, -0x18(%rbp)
14552c81e:     	movq	%r11, -0x10(%rbp)
14552c822:     	movq	%rsi, -0x8(%rbp)
14552c826:     	movq	%rbx, (%rbp)
14552c82a:     	movq	%rcx, 0x8(%rbp)
14552c82e:     	xorl	%r12d, %r12d
14552c831:     	cmpq	$0x4, %r12
14552c835:     	je	0x14552c720 <.text+0x552b720>
14552c83b:     	movq	%r12, %rax
14552c83e:     	shlq	$0x4, %rax
14552c842:     	addq	%rdi, %rax
14552c845:     	nopw	%cs:(%rax,%rax)
14552c850:     	cmpl	$0x1, -0x8(%rax)
14552c854:     	je	0x14552c870 <.text+0x552b870>
14552c856:     	incq	%r12
14552c859:     	addq	$0x10, %rax
14552c85d:     	cmpq	$0x4, %r12
14552c861:     	jne	0x14552c850 <.text+0x552b850>
14552c863:     	jmp	0x14552c720 <.text+0x552b720>
14552c868:     	nopl	(%rax,%rax)
14552c870:     	movq	(%rax), %rbx
14552c873:     	cmpq	0x178(%rbp), %rbx
14552c87a:     	jae	0x14552cb06 <.text+0x552bb06>
14552c880:     	incq	%r12
14552c883:     	movq	0x150(%rbp), %rax
14552c88a:     	movss	(%rax,%rbx,4), %xmm0
14552c88f:     	ucomiss	%xmm0, %xmm0
14552c892:     	jnp	0x14552c831 <.text+0x552b831>
14552c894:     	movq	0x140(%rbp), %rcx
14552c89b:     	movq	0x148(%rbp), %rdx
14552c8a2:     	movss	%xmm6, 0x28(%rsp)
14552c8a8:     	movq	%rbx, 0x20(%rsp)
14552c8ad:     	movq	0x168(%rbp), %r8
14552c8b4:     	movq	0x130(%rbp), %r9
14552c8bb:     	callq	0x1455244e0 <.text+0x55234e0>
14552c8c0:     	nop
14552c8c1:     	cmpl	$0x1, %eax
14552c8c4:     	jne	0x14552c831 <.text+0x552b831>
14552c8ca:     	movq	0x150(%rbp), %rax
14552c8d1:     	movss	%xmm0, (%rax,%rbx,4)
14552c8d6:     	movq	%r14, %rcx
14552c8d9:     	movq	%rbx, %rdx
14552c8dc:     	callq	0x14546d100 <.text+0x546c100>
14552c8e1:     	nop
14552c8e2:     	jmp	0x14552c831 <.text+0x552b831>
14552c8e7:     	movq	0xc0(%rbp), %rsi
14552c8ee:     	movq	0x178(%rbp), %rcx
14552c8f5:     	movq	%rcx, (%rsi)
14552c8f8:     	movq	0x150(%rbp), %rax
14552c8ff:     	movq	%rax, 0x8(%rsi)
14552c903:     	movq	%rcx, 0x10(%rsi)
14552c907:     	movq	0x170(%rbp), %rax
14552c90e:     	movq	%rax, 0x18(%rsi)
14552c912:     	movlps	%xmm7, 0x20(%rsi)
14552c916:     	jmp	0x14552c962 <.text+0x552b962>
14552c918:     	movq	0xc0(%rbp), %rsi
14552c91f:     	movq	%r12, (%rsi)
14552c922:     	movq	0x150(%rbp), %rax
14552c929:     	movq	%rax, 0x8(%rsi)
14552c92d:     	movq	%r12, 0x10(%rsi)
14552c931:     	movq	0x170(%rbp), %rax
14552c938:     	movq	%rax, 0x18(%rsi)
14552c93c:     	movlps	%xmm7, 0x20(%rsi)
14552c940:     	movq	0xe0(%rbp), %rdx
14552c947:     	testq	%rdx, %rdx
14552c94a:     	je	0x14552c962 <.text+0x552b962>
14552c94c:     	movq	0xe8(%rbp), %rcx
14552c953:     	shlq	$0x3, %rdx
14552c957:     	movl	$0x8, %r8d
14552c95d:     	callq	0x1400021d0 <.text+0x11d0>
14552c962:     	movq	0xd8(%rbp), %rdx
14552c969:     	testq	%rdx, %rdx
14552c96c:     	je	0x14552c980 <.text+0x552b980>
14552c96e:     	shlq	$0x2, %rdx
14552c972:     	movl	$0x4, %r8d
14552c978:     	movq	%rbx, %rcx
14552c97b:     	callq	0x1400021d0 <.text+0x11d0>
14552c980:     	movq	0x38(%rbp), %rdx
14552c984:     	testq	%rdx, %rdx
14552c987:     	je	0x14552c9b0 <.text+0x552b9b0>
14552c989:     	leaq	0x13(,%rdx,4), %rax
14552c991:     	andq	$-0x10, %rax
14552c995:     	addq	%rax, %rdx
14552c998:     	addq	$0x11, %rdx
14552c99c:     	je	0x14552c9b0 <.text+0x552b9b0>
14552c99e:     	movq	0x30(%rbp), %rcx
14552c9a2:     	subq	%rax, %rcx
14552c9a5:     	movl	$0x10, %r8d
14552c9ab:     	callq	0x1400021d0 <.text+0x11d0>
14552c9b0:     	movq	0x138(%rbp), %rdx
14552c9b7:     	testq	%rdx, %rdx
14552c9ba:     	je	0x14552c9d2 <.text+0x552b9d2>
14552c9bc:     	movq	0x140(%rbp), %rcx
14552c9c3:     	shlq	$0x3, %rdx
14552c9c7:     	movl	$0x4, %r8d
14552c9cd:     	callq	0x1400021d0 <.text+0x11d0>
14552c9d2:     	movq	%rsi, %rax
14552c9d5:     	movaps	0x190(%rbp), %xmm6
14552c9dc:     	movaps	0x1a0(%rbp), %xmm7
14552c9e3:     	movaps	0x1b0(%rbp), %xmm8
14552c9eb:     	movaps	0x1c0(%rbp), %xmm9
14552c9f3:     	movaps	0x1d0(%rbp), %xmm10
14552c9fb:     	movaps	0x1e0(%rbp), %xmm11
14552ca03:     	movaps	0x1f0(%rbp), %xmm12
14552ca0b:     	movaps	0x200(%rbp), %xmm13
14552ca13:     	movaps	0x210(%rbp), %xmm14
14552ca1b:     	movaps	0x220(%rbp), %xmm15
14552ca23:     	addq	$0x2b8, %rsp            # imm = 0x2B8
14552ca2a:     	popq	%rbx
14552ca2b:     	popq	%rdi
14552ca2c:     	popq	%rsi
14552ca2d:     	popq	%r12
14552ca2f:     	popq	%r13
14552ca31:     	popq	%r14
14552ca33:     	popq	%r15
14552ca35:     	popq	%rbp
14552ca36:     	retq
14552ca37:     	leaq	0x1808172(%rip), %r9    # 0x146d34bb0
14552ca3e:     	movq	%rax, %rcx
14552ca41:     	movq	0x120(%rbp), %r8
14552ca48:     	callq	0x145903d40 <.text+0x5902d40>
14552ca4d:     	nop
14552ca4e:     	jmp	0x14552cb82 <.text+0x552bb82>
14552ca53:     	callq	0x145712ca0 <.text+0x5711ca0>
14552ca58:     	nop
14552ca59:     	movq	%rax, (%rbx)
14552ca5c:     	movq	%rdx, 0x8(%rbx)
14552ca60:     	movb	$0x1, 0x10(%rbx)
14552ca64:     	jmp	0x14552b7aa <.text+0x552a7aa>
14552ca69:     	cmpq	$0x15, %rdx
14552ca6d:     	jae	0x14552cb4e <.text+0x552bb4e>
14552ca73:     	leaq	-0x48(%rbp), %r9
14552ca77:     	movl	$0x1, %r8d
14552ca7d:     	callq	0x145507780 <.text+0x5506780>
14552ca82:     	jmp	0x14552c16a <.text+0x552b16a>
14552ca87:     	leaq	0x1808592(%rip), %r8    # 0x146d35020
14552ca8e:     	movq	%r15, %rdx
14552ca91:     	callq	0x145903b33 <.text+0x5902b33>
14552ca96:     	nop
14552ca97:     	jmp	0x14552cb82 <.text+0x552bb82>
14552ca9c:     	leaq	0x1808565(%rip), %r8    # 0x146d35008
14552caa3:     	movq	%r15, %rdx
14552caa6:     	callq	0x145903b33 <.text+0x5902b33>
14552caab:     	nop
14552caac:     	jmp	0x14552cb82 <.text+0x552bb82>
14552cab1:     	leaq	0x1808538(%rip), %r8    # 0x146d34ff0
14552cab8:     	movq	%r15, %rdx
14552cabb:     	callq	0x145903b33 <.text+0x5902b33>
14552cac0:     	nop
14552cac1:     	jmp	0x14552cb82 <.text+0x552bb82>
14552cac6:     	incq	%rcx
14552cac9:     	leaq	0x18084a8(%rip), %r8    # 0x146d34f78
14552cad0:     	movq	%rsi, %rdx
14552cad3:     	callq	0x145903b33 <.text+0x5902b33>
14552cad8:     	nop
14552cad9:     	jmp	0x14552cb82 <.text+0x552bb82>
14552cade:     	leaq	0x18084c3(%rip), %rcx   # 0x146d34fa8
14552cae5:     	callq	0x145903e30 <.text+0x5902e30>
14552caea:     	nop
14552caeb:     	jmp	0x14552cb82 <.text+0x552bb82>
14552caf0:     	leaq	0x18084c9(%rip), %r8    # 0x146d34fc0
14552caf7:     	movq	0x178(%rbp), %rdx
14552cafe:     	callq	0x145903b33 <.text+0x5902b33>
14552cb03:     	nop
14552cb04:     	jmp	0x14552cb82 <.text+0x552bb82>
14552cb06:     	leaq	0x18084cb(%rip), %r8    # 0x146d34fd8
14552cb0d:     	movq	%rbx, %rcx
14552cb10:     	movq	0x178(%rbp), %rdx
14552cb17:     	callq	0x145903b33 <.text+0x5902b33>
14552cb1c:     	nop
14552cb1d:     	jmp	0x14552cb82 <.text+0x552bb82>
14552cb1f:     	leaq	0x180805a(%rip), %r8    # 0x146d34b80
14552cb26:     	movq	0x130(%rbp), %rdx
14552cb2d:     	callq	0x145903b33 <.text+0x5902b33>
14552cb32:     	nop
14552cb33:     	jmp	0x14552cb82 <.text+0x552bb82>
14552cb35:     	incq	%rcx
14552cb38:     	leaq	0x1808059(%rip), %r8    # 0x146d34b98
14552cb3f:     	movq	0x130(%rbp), %rdx
14552cb46:     	callq	0x145903b33 <.text+0x5902b33>
14552cb4b:     	nop
14552cb4c:     	jmp	0x14552cb82 <.text+0x552bb82>
14552cb4e:     	leaq	-0x48(%rbp), %r8
14552cb52:     	callq	0x145482040 <.text+0x5481040>
14552cb57:     	nop
14552cb58:     	jmp	0x14552c16a <.text+0x552b16a>
14552cb5d:     	leaq	0x180842c(%rip), %r8    # 0x146d34f90
14552cb64:     	movq	%rsi, %rcx
14552cb67:     	movq	%r12, %rdx
14552cb6a:     	callq	0x145903b33 <.text+0x5902b33>
14552cb6f:     	nop
14552cb70:     	jmp	0x14552cb82 <.text+0x552bb82>
14552cb72:     	movl	$0x8, %ecx
14552cb77:     	movl	$0x8, %edx
14552cb7c:     	callq	0x14590379b <.text+0x590279b>
14552cb81:     	nop
14552cb82:     	ud2
