
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14594c4e0:     	pushq	%rbp
14594c4e1:     	pushq	%r15
14594c4e3:     	pushq	%r14
14594c4e5:     	pushq	%r13
14594c4e7:     	pushq	%r12
14594c4e9:     	pushq	%rsi
14594c4ea:     	pushq	%rdi
14594c4eb:     	pushq	%rbx
14594c4ec:     	subq	$0x158, %rsp            # imm = 0x158
14594c4f3:     	leaq	0x80(%rsp), %rbp
14594c4fb:     	movaps	%xmm14, 0xc0(%rbp)
14594c503:     	movaps	%xmm13, 0xb0(%rbp)
14594c50b:     	movaps	%xmm12, 0xa0(%rbp)
14594c513:     	movaps	%xmm11, 0x90(%rbp)
14594c51b:     	movaps	%xmm10, 0x80(%rbp)
14594c523:     	movaps	%xmm9, 0x70(%rbp)
14594c528:     	movaps	%xmm8, 0x60(%rbp)
14594c52d:     	movaps	%xmm7, 0x50(%rbp)
14594c531:     	movaps	%xmm6, 0x40(%rbp)
14594c535:     	movq	$-0x2, 0x38(%rbp)
14594c53d:     	movq	%rdx, %r14
14594c540:     	movq	0xd8(%rcx), %rdx
14594c547:     	cmpq	%rdx, %r14
14594c54a:     	jae	0x14594ccd8 <.text+0x594bcd8>
14594c550:     	movq	%r8, %r13
14594c553:     	movq	%rcx, %rbx
14594c556:     	movq	0xd0(%rcx), %rax
14594c55d:     	imulq	$0x78, %r14, %rcx
14594c561:     	movq	0x18(%rax,%rcx), %rdx
14594c566:     	movq	0x20(%rax,%rcx), %rax
14594c56b:     	movq	%rax, -0x20(%rbp)
14594c56f:     	movl	0x4d8(%rbx), %eax
14594c575:     	xorps	%xmm6, %xmm6
14594c578:     	cvtsi2ss	%rax, %xmm6
14594c57d:     	addss	0x42778f(%rip), %xmm6   # 0x145d73d14
14594c585:     	mulss	0x469967(%rip), %xmm6   # 0x145db5ef4
14594c58d:     	addss	0x420dd7(%rip), %xmm6   # 0x145d6d36c
14594c595:     	movq	%rdx, -0x8(%rbp)
14594c599:     	mulss	0x2c(%rdx), %xmm6
14594c59e:     	mulss	0x47c(%rbx), %xmm6
14594c5a6:     	mulss	0x148(%rbp), %xmm6
14594c5ae:     	movq	0x7a8(%rbx), %rax
14594c5b5:     	movq	0x7b0(%rbx), %rcx
14594c5bc:     	shlq	$0x6, %rcx
14594c5c0:     	xorl	%edx, %edx
14594c5c2:     	nopw	%cs:(%rax,%rax)
14594c5d0:     	cmpq	%rdx, %rcx
14594c5d3:     	je	0x14594c5f8 <.text+0x594b5f8>
14594c5d5:     	leaq	0x40(%rdx), %r8
14594c5d9:     	cmpb	$0x1e, (%rax,%rdx)
14594c5dd:     	movq	%r8, %rdx
14594c5e0:     	jne	0x14594c5d0 <.text+0x594b5d0>
14594c5e2:     	cmpb	$0x3, -0x3f(%rax,%r8)
14594c5e8:     	setae	%al
14594c5eb:     	movl	%eax, 0x34(%rbp)
14594c5ee:     	testq	%r9, %r9
14594c5f1:     	jne	0x14594c608 <.text+0x594b608>
14594c5f3:     	jmp	0x14594cc8a <.text+0x594bc8a>
14594c5f8:     	movl	$0x0, 0x34(%rbp)
14594c5ff:     	testq	%r9, %r9
14594c602:     	je	0x14594cc8a <.text+0x594bc8a>
14594c608:     	leaq	(,%r9,8), %rax
14594c610:     	addq	%r13, %rax
14594c613:     	movq	%rax, -0x18(%rbp)
14594c617:     	xorps	%xmm9, %xmm9
14594c61b:     	movss	0x421250(%rip), %xmm10  # 0x145d6d874
14594c624:     	movss	0x427717(%rip), %xmm11  # 0x145d73d44
14594c62d:     	movss	0x4277da(%rip), %xmm12  # 0x145d73e10
14594c636:     	movss	0x424631(%rip), %xmm13  # 0x145d70c70
14594c63f:     	movss	0x46bfd8(%rip), %xmm14  # 0x145db8620
14594c648:     	movq	%r14, -0x10(%rbp)
14594c64c:     	jmp	0x14594c66a <.text+0x594b66a>
14594c64e:     	addss	%xmm12, %xmm0
14594c653:     	movss	%xmm0, -0x8(%rax,%rdx)
14594c659:     	nopl	(%rax)
14594c660:     	cmpq	-0x18(%rbp), %r13
14594c664:     	je	0x14594cc8a <.text+0x594bc8a>
14594c66a:     	movq	(%r13), %r12
14594c66e:     	movq	%rbx, %rcx
14594c671:     	movq	%r14, %rdx
14594c674:     	movaps	%xmm6, %xmm2
14594c677:     	movq	%r12, %r9
14594c67a:     	callq	0x145950e90 <.text+0x594fe90>
14594c67f:     	movl	%eax, %r15d
14594c682:     	movaps	%xmm0, %xmm7
14594c685:     	cvttss2si	%xmm0, %r9
14594c68a:     	ucomiss	%xmm9, %xmm0
14594c68e:     	movl	$0x0, %eax
14594c693:     	cmovbl	%eax, %r9d
14594c697:     	ucomiss	%xmm10, %xmm0
14594c69b:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14594c6a0:     	cmoval	%eax, %r9d
14594c6a4:     	andb	$0x1, %r15b
14594c6a8:     	movb	%r15b, 0x20(%rsp)
14594c6ad:     	movq	%rbp, %rcx
14594c6b0:     	movq	-0x20(%rbp), %rdx
14594c6b4:     	movq	%r12, %r8
14594c6b7:     	callq	0x1458ab9e0 <.text+0x58aa9e0>
14594c6bc:     	movq	0x5e0(%rbx), %r14
14594c6c3:     	cmpq	0x5d0(%rbx), %r14
14594c6ca:     	jne	0x14594c6d9 <.text+0x594b6d9>
14594c6cc:     	leaq	0x5d0(%rbx), %rcx
14594c6d3:     	callq	0x145bcb530 <.text+0x5bca530>
14594c6d8:     	nop
14594c6d9:     	addq	$0x8, %r13
14594c6dd:     	movq	%r13, %rsi
14594c6e0:     	movq	0x5d8(%rbx), %rax
14594c6e7:     	movq	%r14, %rcx
14594c6ea:     	shlq	$0x5, %rcx
14594c6ee:     	movups	(%rbp), %xmm0
14594c6f2:     	movups	0x10(%rbp), %xmm1
14594c6f6:     	movups	%xmm1, 0x10(%rax,%rcx)
14594c6fb:     	movups	%xmm0, (%rax,%rcx)
14594c6ff:     	incq	%r14
14594c702:     	movq	%r14, 0x5e0(%rbx)
14594c709:     	movzbl	0x195(%rbx), %r13d
14594c711:     	movb	$0x2, 0x195(%rbx)
14594c718:     	movq	0x170(%rbx), %r14
14594c71f:     	movq	-0x8(%rbp), %rcx
14594c723:     	movq	%rcx, 0x170(%rbx)
14594c72a:     	leaq	0x140(%rbx), %rdi
14594c731:     	movups	(%rdi), %xmm0
14594c734:     	movups	0x10(%rdi), %xmm1
14594c738:     	movups	0x20(%rdi), %xmm2
14594c73c:     	movaps	%xmm2, 0x20(%rbp)
14594c740:     	movaps	%xmm1, 0x10(%rbp)
14594c744:     	movaps	%xmm0, (%rbp)
14594c748:     	movq	0x140(%rbp), %rax
14594c74f:     	movups	(%rax), %xmm0
14594c752:     	movups	0x10(%rax), %xmm1
14594c756:     	movups	0x20(%rax), %xmm2
14594c75a:     	movups	%xmm0, (%rdi)
14594c75d:     	movups	%xmm1, 0x10(%rdi)
14594c761:     	movups	%xmm2, 0x20(%rdi)
14594c765:     	movzbl	0x38(%rcx), %eax
14594c769:     	movb	%r15b, 0x28(%rsp)
14594c76e:     	movb	%al, 0x20(%rsp)
14594c772:     	movb	$0x1, 0x30(%rsp)
14594c777:     	movq	%rbx, %rcx
14594c77a:     	movq	%r12, %rdx
14594c77d:     	movaps	%xmm7, %xmm2
14594c780:     	xorl	%r9d, %r9d
14594c783:     	callq	0x145933ec0 <.text+0x5932ec0>
14594c788:     	movaps	(%rbp), %xmm0
14594c78c:     	movaps	0x10(%rbp), %xmm1
14594c790:     	movaps	0x20(%rbp), %xmm2
14594c794:     	movups	%xmm2, 0x20(%rdi)
14594c798:     	movups	%xmm1, 0x10(%rdi)
14594c79c:     	movups	%xmm0, (%rdi)
14594c79f:     	movq	%r14, 0x170(%rbx)
14594c7a6:     	movb	%r13b, 0x195(%rbx)
14594c7ad:     	movq	0x560(%rbx), %rax
14594c7b4:     	movq	0x568(%rbx), %rdx
14594c7bb:     	imulq	$0x160, %rdx, %rcx      # imm = 0x160
14594c7c2:     	movq	%rcx, %r9
14594c7c5:     	movq	%rax, %r10
14594c7c8:     	nopl	(%rax,%rax)
14594c7d0:     	movq	%r9, %r8
14594c7d3:     	testq	%r9, %r9
14594c7d6:     	je	0x14594c7f9 <.text+0x594b7f9>
14594c7d8:     	movq	%r10, %r11
14594c7db:     	addq	$0x160, %r10            # imm = 0x160
14594c7e2:     	leaq	-0x160(%r8), %r9
14594c7e9:     	cmpq	%r12, 0x88(%r11)
14594c7f0:     	jne	0x14594c7d0 <.text+0x594b7d0>
14594c7f2:     	testb	$0x1, 0x68(%r11)
14594c7f7:     	jne	0x14594c7d0 <.text+0x594b7d0>
14594c7f9:     	movq	-0x8(%rbp), %r9
14594c7fd:     	movzbl	0x39(%r9), %r9d
14594c802:     	cmpl	$0x2, %r9d
14594c806:     	je	0x14594c9d0 <.text+0x594b9d0>
14594c80c:     	cmpl	$0x3, %r9d
14594c810:     	movq	-0x10(%rbp), %r14
14594c814:     	movq	%rsi, %r13
14594c817:     	jne	0x14594c660 <.text+0x594b660>
14594c81d:     	testq	%r8, %r8
14594c820:     	jne	0x14594cb09 <.text+0x594bb09>
14594c826:     	movl	$0xa, %edx
14594c82b:     	leaq	0x152e0b6(%rip), %rcx   # 0x146e7a8e8
14594c832:     	callq	0x1458da590 <.text+0x58d9590>
14594c837:     	movq	-0x8(%rbp), %r8
14594c83b:     	movq	0x10(%r8), %rcx
14594c83f:     	movq	0x18(%r8), %r8
14594c843:     	movss	0x478(%rbx), %xmm8
14594c84c:     	movss	0x4e0(%rbx), %xmm2
14594c854:     	movaps	%xmm2, %xmm1
14594c857:     	addss	%xmm14, %xmm1
14594c85c:     	movaps	%xmm1, %xmm3
14594c85f:     	minss	%xmm8, %xmm3
14594c864:     	movaps	%xmm3, %xmm0
14594c867:     	cmpunordss	%xmm3, %xmm0
14594c86c:     	movaps	%xmm0, %xmm4
14594c86f:     	andnps	%xmm3, %xmm4
14594c872:     	andps	%xmm1, %xmm0
14594c875:     	orps	%xmm4, %xmm0
14594c878:     	movss	%xmm0, 0x4e0(%rbx)
14594c880:     	movaps	%xmm0, %xmm1
14594c883:     	subss	%xmm2, %xmm1
14594c887:     	ucomiss	%xmm1, %xmm9
14594c88b:     	jae	0x14594c8f7 <.text+0x594b8f7>
14594c88d:     	testq	%rax, %rax
14594c890:     	movl	$0xa, %r9d
14594c896:     	cmoveq	%r9, %rdx
14594c89a:     	leaq	0x152e047(%rip), %r9    # 0x146e7a8e8
14594c8a1:     	cmoveq	%r9, %rax
14594c8a5:     	movq	$-0x1, (%rbp)
14594c8ad:     	movq	%rax, 0x8(%rbp)
14594c8b1:     	movq	%rdx, 0x10(%rbp)
14594c8b5:     	movq	%rcx, 0x18(%rbp)
14594c8b9:     	movq	%r8, 0x20(%rbp)
14594c8bd:     	movb	$0x0, 0x28(%rbp)
14594c8c1:     	xorps	%xmm2, %xmm2
14594c8c4:     	cvtss2sd	%xmm1, %xmm2
14594c8c8:     	movq	$0x0, 0x20(%rsp)
14594c8d1:     	movl	$0x8, %r9d
14594c8d7:     	leaq	0x678(%rbx), %rcx
14594c8de:     	movq	%rbp, %rdx
14594c8e1:     	callq	0x14595f3c0 <.text+0x595e3c0>
14594c8e6:     	movss	0x478(%rbx), %xmm8
14594c8ef:     	movss	0x4e0(%rbx), %xmm0
14594c8f7:     	maxss	%xmm9, %xmm0
14594c8fc:     	callq	0x145bc981d <.text+0x5bc881d>
14594c901:     	cvttss2si	%xmm0, %r15
14594c906:     	ucomiss	%xmm9, %xmm0
14594c90a:     	movl	$0x0, %esi
14594c90f:     	cmovbl	%esi, %r15d
14594c913:     	ucomiss	%xmm10, %xmm0
14594c917:     	movl	$0xffffffff, %edi       # imm = 0xFFFFFFFF
14594c91c:     	cmoval	%edi, %r15d
14594c920:     	movaps	%xmm8, %xmm0
14594c924:     	callq	0x145bc981d <.text+0x5bc881d>
14594c929:     	cvttss2si	%xmm0, %r12
14594c92e:     	ucomiss	%xmm9, %xmm0
14594c932:     	cmovbl	%esi, %r12d
14594c936:     	ucomiss	%xmm10, %xmm0
14594c93a:     	cmoval	%edi, %r12d
14594c93e:     	leaq	0x990(%rbx), %rcx
14594c945:     	movq	(%rcx), %rax
14594c948:     	testq	%rax, %rax
14594c94b:     	je	0x14594cbf4 <.text+0x594bbf4>
14594c951:     	movq	0x998(%rbx), %rcx
14594c958:     	movw	$0x16, %r11w
14594c95d:     	movzwl	0x36(%rax), %r8d
14594c962:     	movl	%r8d, %r9d
14594c965:     	addl	%r9d, %r9d
14594c968:     	movq	$-0x1, %rdx
14594c96f:     	nop
14594c970:     	testq	%r9, %r9
14594c973:     	je	0x14594c9b0 <.text+0x594b9b0>
14594c975:     	cmpw	0x3a(%rax,%rdx,2), %r11w
14594c97b:     	seta	%r10b
14594c97f:     	sbbb	$0x0, %r10b
14594c983:     	incq	%rdx
14594c986:     	addq	$-0x2, %r9
14594c98a:     	cmpb	$0x1, %r10b
14594c98e:     	je	0x14594c970 <.text+0x594b970>
14594c990:     	movzbl	%r10b, %r8d
14594c994:     	testl	%r8d, %r8d
14594c997:     	je	0x14594ca75 <.text+0x594ba75>
14594c99d:     	subq	$0x1, %rcx
14594c9a1:     	jae	0x14594c9bd <.text+0x594b9bd>
14594c9a3:     	jmp	0x14594cc75 <.text+0x594bc75>
14594c9a8:     	nopl	(%rax,%rax)
14594c9b0:     	movq	%r8, %rdx
14594c9b3:     	subq	$0x1, %rcx
14594c9b7:     	jb	0x14594cc75 <.text+0x594bc75>
14594c9bd:     	movq	0x50(%rax,%rdx,8), %rax
14594c9c2:     	jmp	0x14594c95d <.text+0x594b95d>
14594c9c4:     	nopw	%cs:(%rax,%rax)
14594c9d0:     	testq	%r8, %r8
14594c9d3:     	setne	%r8b
14594c9d7:     	testb	%r8b, 0x34(%rbp)
14594c9db:     	movq	-0x10(%rbp), %r14
14594c9df:     	movq	%rsi, %r13
14594c9e2:     	je	0x14594c660 <.text+0x594b660>
14594c9e8:     	testq	%rdx, %rdx
14594c9eb:     	je	0x14594c660 <.text+0x594b660>
14594c9f1:     	xorl	%edx, %edx
14594c9f3:     	jmp	0x14594ca10 <.text+0x594ba10>
14594c9f5:     	nopw	%cs:(%rax,%rax)
14594ca00:     	addq	$0x160, %rdx            # imm = 0x160
14594ca07:     	cmpq	%rdx, %rcx
14594ca0a:     	je	0x14594c660 <.text+0x594b660>
14594ca10:     	cmpq	%r12, 0x88(%rax,%rdx)
14594ca18:     	jne	0x14594ca00 <.text+0x594ba00>
14594ca1a:     	cmpl	$0x0, 0x68(%rax,%rdx)
14594ca1f:     	jne	0x14594ca00 <.text+0x594ba00>
14594ca21:     	movss	0xf4(%rax,%rdx), %xmm0
14594ca2a:     	mulss	%xmm11, %xmm0
14594ca2f:     	ucomiss	0xf0(%rax,%rdx), %xmm0
14594ca37:     	jbe	0x14594ca00 <.text+0x594ba00>
14594ca39:     	movss	0x9ec(%rbx), %xmm0
14594ca41:     	xorl	%edx, %edx
14594ca43:     	movq	%rax, %r8
14594ca46:     	nopw	%cs:(%rax,%rax)
14594ca50:     	cmpq	%rdx, %rcx
14594ca53:     	je	0x14594c660 <.text+0x594b660>
14594ca59:     	addq	$0x160, %rdx            # imm = 0x160
14594ca60:     	cmpq	%r12, 0x88(%r8)
14594ca67:     	leaq	0x160(%r8), %r8
14594ca6e:     	jne	0x14594ca50 <.text+0x594ba50>
14594ca70:     	jmp	0x14594c64e <.text+0x594b64e>
14594ca75:     	movl	%r15d, 0x8(%rax,%rdx,4)
14594ca7a:     	leaq	0x990(%rbx), %rsi
14594ca81:     	movq	(%rsi), %rax
14594ca84:     	testq	%rax, %rax
14594ca87:     	je	0x14594cc30 <.text+0x594bc30>
14594ca8d:     	movq	0x998(%rbx), %rcx
14594ca94:     	movw	$0x1c, %r11w
14594ca99:     	movzwl	0x36(%rax), %r8d
14594ca9e:     	movl	%r8d, %r9d
14594caa1:     	addl	%r9d, %r9d
14594caa4:     	movq	$-0x1, %rdx
14594caab:     	nopl	(%rax,%rax)
14594cab0:     	testq	%r9, %r9
14594cab3:     	je	0x14594caf0 <.text+0x594baf0>
14594cab5:     	cmpw	0x3a(%rax,%rdx,2), %r11w
14594cabb:     	seta	%r10b
14594cabf:     	sbbb	$0x0, %r10b
14594cac3:     	incq	%rdx
14594cac6:     	addq	$-0x2, %r9
14594caca:     	cmpb	$0x1, %r10b
14594cace:     	je	0x14594cab0 <.text+0x594bab0>
14594cad0:     	movzbl	%r10b, %r8d
14594cad4:     	testl	%r8d, %r8d
14594cad7:     	je	0x14594cb04 <.text+0x594bb04>
14594cad9:     	subq	$0x1, %rcx
14594cadd:     	jae	0x14594cafd <.text+0x594bafd>
14594cadf:     	jmp	0x14594cc81 <.text+0x594bc81>
14594cae4:     	nopw	%cs:(%rax,%rax)
14594caf0:     	movq	%r8, %rdx
14594caf3:     	subq	$0x1, %rcx
14594caf7:     	jb	0x14594cc81 <.text+0x594bc81>
14594cafd:     	movq	0x50(%rax,%rdx,8), %rax
14594cb02:     	jmp	0x14594ca99 <.text+0x594ba99>
14594cb04:     	movl	%r12d, 0x8(%rax,%rdx,4)
14594cb09:     	movq	0x7b0(%rbx), %rdx
14594cb10:     	testq	%rdx, %rdx
14594cb13:     	je	0x14594c660 <.text+0x594b660>
14594cb19:     	movq	0x7a8(%rbx), %rax
14594cb20:     	cmpq	$0x1, %rdx
14594cb24:     	jne	0x14594cb2e <.text+0x594bb2e>
14594cb26:     	xorl	%ecx, %ecx
14594cb28:     	movaps	%xmm13, %xmm0
14594cb2c:     	jmp	0x14594cb89 <.text+0x594bb89>
14594cb2e:     	movq	%rdx, %r8
14594cb31:     	andq	$-0x2, %r8
14594cb35:     	leaq	0x44(%rax), %r9
14594cb39:     	xorl	%ecx, %ecx
14594cb3b:     	movaps	%xmm13, %xmm0
14594cb3f:     	jmp	0x14594cb5d <.text+0x594bb5d>
14594cb41:     	nopw	%cs:(%rax,%rax)
14594cb50:     	addq	$0x2, %rcx
14594cb54:     	subq	$-0x80, %r9
14594cb58:     	cmpq	%rcx, %r8
14594cb5b:     	je	0x14594cb84 <.text+0x594bb84>
14594cb5d:     	cmpb	$0x1f, -0x44(%r9)
14594cb62:     	je	0x14594cb70 <.text+0x594bb70>
14594cb64:     	cmpb	$0x1f, -0x4(%r9)
14594cb69:     	jne	0x14594cb50 <.text+0x594bb50>
14594cb6b:     	jmp	0x14594cb7d <.text+0x594bb7d>
14594cb6d:     	nopl	(%rax)
14594cb70:     	addss	-0x40(%r9), %xmm0
14594cb76:     	cmpb	$0x1f, -0x4(%r9)
14594cb7b:     	jne	0x14594cb50 <.text+0x594bb50>
14594cb7d:     	addss	(%r9), %xmm0
14594cb82:     	jmp	0x14594cb50 <.text+0x594bb50>
14594cb84:     	testb	$0x1, %dl
14594cb87:     	je	0x14594cb99 <.text+0x594bb99>
14594cb89:     	shlq	$0x6, %rcx
14594cb8d:     	cmpb	$0x1f, (%rax,%rcx)
14594cb91:     	jne	0x14594cb99 <.text+0x594bb99>
14594cb93:     	addss	0x4(%rax,%rcx), %xmm0
14594cb99:     	ucomiss	%xmm0, %xmm9
14594cb9d:     	jae	0x14594c660 <.text+0x594b660>
14594cba3:     	movss	0x478(%rbx), %xmm1
14594cbab:     	mulss	%xmm11, %xmm1
14594cbb0:     	mulss	%xmm0, %xmm7
14594cbb4:     	movss	0x190(%rbx), %xmm0
14594cbbc:     	subss	%xmm0, %xmm1
14594cbc0:     	maxss	%xmm9, %xmm1
14594cbc5:     	minss	%xmm1, %xmm7
14594cbc9:     	ucomiss	%xmm9, %xmm7
14594cbcd:     	jbe	0x14594c660 <.text+0x594b660>
14594cbd3:     	addss	%xmm7, %xmm0
14594cbd7:     	movss	%xmm0, 0x190(%rbx)
14594cbdf:     	addss	0x4e4(%rbx), %xmm7
14594cbe7:     	movss	%xmm7, 0x4e4(%rbx)
14594cbef:     	jmp	0x14594c660 <.text+0x594b660>
14594cbf4:     	xorl	%eax, %eax
14594cbf6:     	movq	%rcx, (%rbp)
14594cbfa:     	movq	%rax, 0x8(%rbp)
14594cbfe:     	movq	$0x0, 0x10(%rbp)
14594cc06:     	movq	%rdx, 0x18(%rbp)
14594cc0a:     	movq	$0x16, 0x20(%rbp)
14594cc12:     	movq	%rcx, %rsi
14594cc15:     	leaq	-0x40(%rbp), %rcx
14594cc19:     	movq	%rbp, %rdx
14594cc1c:     	movl	%r15d, %r8d
14594cc1f:     	callq	0x1458e1710 <.text+0x58e0710>
14594cc24:     	movq	(%rsi), %rax
14594cc27:     	testq	%rax, %rax
14594cc2a:     	jne	0x14594ca8d <.text+0x594ba8d>
14594cc30:     	movq	%rsi, %rcx
14594cc33:     	xorl	%eax, %eax
14594cc35:     	movq	%rcx, (%rbp)
14594cc39:     	movq	%rax, 0x8(%rbp)
14594cc3d:     	movq	$0x0, 0x10(%rbp)
14594cc45:     	movq	%rdx, 0x18(%rbp)
14594cc49:     	movq	$0x1c, 0x20(%rbp)
14594cc51:     	leaq	-0x40(%rbp), %rcx
14594cc55:     	movq	%rbp, %rdx
14594cc58:     	movl	%r12d, %r8d
14594cc5b:     	callq	0x1458e1710 <.text+0x58e0710>
14594cc60:     	movq	0x7b0(%rbx), %rdx
14594cc67:     	testq	%rdx, %rdx
14594cc6a:     	jne	0x14594cb19 <.text+0x594bb19>
14594cc70:     	jmp	0x14594c660 <.text+0x594b660>
14594cc75:     	leaq	0x990(%rbx), %rcx
14594cc7c:     	jmp	0x14594cbf6 <.text+0x594bbf6>
14594cc81:     	leaq	0x990(%rbx), %rcx
14594cc88:     	jmp	0x14594cc35 <.text+0x594bc35>
14594cc8a:     	movaps	0x40(%rbp), %xmm6
14594cc8e:     	movaps	0x50(%rbp), %xmm7
14594cc92:     	movaps	0x60(%rbp), %xmm8
14594cc97:     	movaps	0x70(%rbp), %xmm9
14594cc9c:     	movaps	0x80(%rbp), %xmm10
14594cca4:     	movaps	0x90(%rbp), %xmm11
14594ccac:     	movaps	0xa0(%rbp), %xmm12
14594ccb4:     	movaps	0xb0(%rbp), %xmm13
14594ccbc:     	movaps	0xc0(%rbp), %xmm14
14594ccc4:     	addq	$0x158, %rsp            # imm = 0x158
14594cccb:     	popq	%rbx
14594cccc:     	popq	%rdi
14594cccd:     	popq	%rsi
14594ccce:     	popq	%r12
14594ccd0:     	popq	%r13
14594ccd2:     	popq	%r14
14594ccd4:     	popq	%r15
14594ccd6:     	popq	%rbp
14594ccd7:     	retq
14594ccd8:     	leaq	0x152dbf1(%rip), %r8    # 0x146e7a8d0
14594ccdf:     	movq	%r14, %rcx
14594cce2:     	callq	0x145d697e3 <.text+0x5d687e3>
14594cce7:     	ud2
