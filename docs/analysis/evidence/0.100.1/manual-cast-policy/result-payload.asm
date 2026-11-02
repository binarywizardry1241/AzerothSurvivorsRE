
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454f0640:     	pushq	%rbp
1454f0641:     	pushq	%r15
1454f0643:     	pushq	%r14
1454f0645:     	pushq	%r13
1454f0647:     	pushq	%r12
1454f0649:     	pushq	%rsi
1454f064a:     	pushq	%rdi
1454f064b:     	pushq	%rbx
1454f064c:     	subq	$0x178, %rsp            # imm = 0x178
1454f0653:     	leaq	0x80(%rsp), %rbp
1454f065b:     	movaps	%xmm7, 0xe0(%rbp)
1454f0662:     	movaps	%xmm6, 0xd0(%rbp)
1454f0669:     	movq	$-0x2, 0xc8(%rbp)
1454f0674:     	cmpb	$0x1, 0x9a8(%rcx)
1454f067b:     	jne	0x1454f0c2c <.text+0x54efc2c>
1454f0681:     	movq	%rcx, %rsi
1454f0684:     	movzbl	0x9b9(%rcx), %r13d
1454f068c:     	cmpb	$0x5, %r13b
1454f0690:     	jne	0x1454f06a5 <.text+0x54ef6a5>
1454f0692:     	leaq	0x15078af(%rip), %rdi   # 0x1469f7f48
1454f0699:     	movl	$0x1b, %ebx
1454f069e:     	movl	$0x1b, %edx
1454f06a3:     	jmp	0x1454f06d2 <.text+0x54ef6d2>
1454f06a5:     	cmpb	$0x0, 0x9a9(%rsi)
1454f06ac:     	je	0x1454f06c1 <.text+0x54ef6c1>
1454f06ae:     	leaq	0x15078be(%rip), %rdi   # 0x1469f7f73
1454f06b5:     	movl	$0x11, %ebx
1454f06ba:     	movl	$0x11, %edx
1454f06bf:     	jmp	0x1454f06d2 <.text+0x54ef6d2>
1454f06c1:     	leaq	0x150789b(%rip), %rdi   # 0x1469f7f63
1454f06c8:     	movl	$0x10, %ebx
1454f06cd:     	movl	$0x10, %edx
1454f06d2:     	movq	%rdi, %rcx
1454f06d5:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f06da:     	testq	%rax, %rax
1454f06dd:     	cmoveq	%rbx, %rdx
1454f06e1:     	cmoveq	%rdi, %rax
1454f06e5:     	movq	%rax, -0x38(%rbp)
1454f06e9:     	movq	%rdx, -0x30(%rbp)
1454f06ed:     	leaq	0x1507890(%rip), %rdi   # 0x1469f7f84
1454f06f4:     	movl	$0x45, %ebx
1454f06f9:     	movl	$0x45, %edx
1454f06fe:     	movq	%rdi, %rcx
1454f0701:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f0706:     	testq	%rax, %rax
1454f0709:     	cmovneq	%rax, %rdi
1454f070d:     	cmovneq	%rdx, %rbx
1454f0711:     	movss	0x934(%rsi), %xmm0
1454f0719:     	movss	0x425183(%rip), %xmm1   # 0x1459158a4
1454f0721:     	movaps	%xmm0, %xmm2
1454f0724:     	divss	%xmm1, %xmm2
1454f0728:     	cvttss2si	%xmm2, %rax
1454f072d:     	xorl	%r14d, %r14d
1454f0730:     	xorps	%xmm6, %xmm6
1454f0733:     	ucomiss	%xmm6, %xmm2
1454f0736:     	cmovbl	%r14d, %eax
1454f073a:     	movss	0x416dea(%rip), %xmm7   # 0x14590752c
1454f0742:     	ucomiss	%xmm7, %xmm2
1454f0745:     	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
1454f074b:     	cmoval	%r15d, %eax
1454f074f:     	movl	%eax, -0x8(%rbp)
1454f0752:     	callq	0x14577325f <.text+0x577225f>
1454f0757:     	cvttss2si	%xmm0, %rax
1454f075c:     	ucomiss	%xmm6, %xmm0
1454f075f:     	cmovbl	%r14d, %eax
1454f0763:     	ucomiss	%xmm7, %xmm0
1454f0766:     	cmoval	%r15d, %eax
1454f076a:     	movl	%eax, 0x90(%rbp)
1454f0770:     	leaq	-0x8(%rbp), %rax
1454f0774:     	movq	%rax, 0x10(%rbp)
1454f0778:     	leaq	0x249cd1(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454f077f:     	movq	%rax, 0x18(%rbp)
1454f0783:     	leaq	0x90(%rbp), %r14
1454f078a:     	movq	%r14, 0x20(%rbp)
1454f078e:     	movq	%rax, 0x28(%rbp)
1454f0792:     	leaq	0x1507830(%rip), %rdx   # 0x1469f7fc9
1454f0799:     	leaq	-0x28(%rbp), %rcx
1454f079d:     	leaq	0x10(%rbp), %r8
1454f07a1:     	callq	0x145728390 <.text+0x5727390>
1454f07a6:     	movups	-0x28(%rbp), %xmm0
1454f07aa:     	movaps	%xmm0, 0x90(%rbp)
1454f07b1:     	movq	-0x18(%rbp), %rax
1454f07b5:     	movq	%rax, 0xa0(%rbp)
1454f07bc:     	leaq	0x410(%rsi), %rax
1454f07c3:     	leaq	0x674(%rsi), %rcx
1454f07ca:     	leaq	0x680(%rsi), %rdx
1454f07d1:     	leaq	0x1506308(%rip), %r8    # 0x1469f6ae0
1454f07d8:     	movq	%r8, 0x10(%rbp)
1454f07dc:     	movq	$0x4, 0x18(%rbp)
1454f07e4:     	movq	%r14, 0x20(%rbp)
1454f07e8:     	leaq	0x1506461(%rip), %r8    # 0x1469f6c50
1454f07ef:     	movq	%r8, 0x28(%rbp)
1454f07f3:     	leaq	0x15062ea(%rip), %r8    # 0x1469f6ae4
1454f07fa:     	movq	%r8, 0x30(%rbp)
1454f07fe:     	movq	$0x5, 0x38(%rbp)
1454f0806:     	movq	%rax, 0x40(%rbp)
1454f080a:     	leaq	0x1505c3f(%rip), %rax   # 0x1469f6450
1454f0811:     	movq	%rax, 0x48(%rbp)
1454f0815:     	leaq	0x15062ef(%rip), %r8    # 0x1469f6b0b
1454f081c:     	movq	%r8, 0x50(%rbp)
1454f0820:     	movq	$0x5, 0x58(%rbp)
1454f0828:     	movq	%rcx, 0x60(%rbp)
1454f082c:     	movq	%rax, 0x68(%rbp)
1454f0830:     	leaq	0x150635b(%rip), %rcx   # 0x1469f6b92
1454f0837:     	movq	%rcx, 0x70(%rbp)
1454f083b:     	movq	$0x6, 0x78(%rbp)
1454f0843:     	movq	%rdx, 0x80(%rbp)
1454f084a:     	movq	%rax, 0x88(%rbp)
1454f0851:     	movq	$0x4, 0x20(%rsp)
1454f085a:     	leaq	-0x8(%rbp), %r14
1454f085e:     	leaq	0x10(%rbp), %r9
1454f0862:     	movq	%r14, %rcx
1454f0865:     	movq	%rdi, %rdx
1454f0868:     	movq	%rbx, %r8
1454f086b:     	callq	0x145458060 <.text+0x5457060>
1454f0870:     	nop
1454f0871:     	leaq	-0x38(%rbp), %rax
1454f0875:     	movq	%rax, -0x28(%rbp)
1454f0879:     	leaq	-0x54ee7c0(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454f0880:     	movq	%rax, -0x20(%rbp)
1454f0884:     	movq	%r14, -0x18(%rbp)
1454f0888:     	leaq	-0x54ee7af(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1454f088f:     	movq	%rax, -0x10(%rbp)
1454f0893:     	leaq	0x1507740(%rip), %rdx   # 0x1469f7fda
1454f089a:     	leaq	-0x50(%rbp), %rcx
1454f089e:     	leaq	-0x28(%rbp), %r8
1454f08a2:     	callq	0x145728390 <.text+0x5727390>
1454f08a7:     	nop
1454f08a8:     	movq	-0x8(%rbp), %rdx
1454f08ac:     	testq	%rdx, %rdx
1454f08af:     	je	0x1454f08c0 <.text+0x54ef8c0>
1454f08b1:     	movq	(%rbp), %rcx
1454f08b5:     	movl	$0x1, %r8d
1454f08bb:     	callq	0x1400021d0 <.text+0x11d0>
1454f08c0:     	movq	0x90(%rbp), %rdx
1454f08c7:     	testq	%rdx, %rdx
1454f08ca:     	je	0x1454f08de <.text+0x54ef8de>
1454f08cc:     	movq	0x98(%rbp), %rcx
1454f08d3:     	movl	$0x1, %r8d
1454f08d9:     	callq	0x1400021d0 <.text+0x11d0>
1454f08de:     	movq	-0x50(%rbp), %rax
1454f08e2:     	movq	%rax, 0xa8(%rbp)
1454f08e9:     	movq	-0x48(%rbp), %rax
1454f08ed:     	movq	%rax, 0xb0(%rbp)
1454f08f4:     	movq	-0x40(%rbp), %rdi
1454f08f8:     	callq	0x140002200 <.text+0x1200>
1454f08fd:     	movl	$0x20, %ecx
1454f0902:     	movl	$0x8, %edx
1454f0907:     	callq	0x1400021c0 <.text+0x11c0>
1454f090c:     	movq	%rax, 0xc0(%rbp)
1454f0913:     	testq	%rax, %rax
1454f0916:     	je	0x1454f0c4e <.text+0x54efc4e>
1454f091c:     	leaq	0x15076bf(%rip), %r14   # 0x1469f7fe2
1454f0923:     	movl	$0x9, %r15d
1454f0929:     	movl	$0x9, %edx
1454f092e:     	movq	%r14, %rcx
1454f0931:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f0936:     	nop
1454f0937:     	movq	%rdx, %rbx
1454f093a:     	testq	%rax, %rax
1454f093d:     	cmovneq	%rax, %r14
1454f0941:     	cmoveq	%r15, %rbx
1454f0945:     	testq	%rbx, %rbx
1454f0948:     	jns	0x1454f095e <.text+0x54ef95e>
1454f094a:     	xorl	%r12d, %r12d
1454f094d:     	movq	%r12, %rcx
1454f0950:     	movq	%rbx, %rdx
1454f0953:     	callq	0x14590379b <.text+0x590279b>
1454f0958:     	nop
1454f0959:     	jmp	0x1454f0c5e <.text+0x54efc5e>
1454f095e:     	je	0x1454f0990 <.text+0x54ef990>
1454f0960:     	callq	0x140002200 <.text+0x1200>
1454f0965:     	movl	$0x1, %r12d
1454f096b:     	movl	$0x1, %edx
1454f0970:     	movq	%rbx, %rcx
1454f0973:     	callq	0x1400021c0 <.text+0x11c0>
1454f0978:     	testq	%rax, %rax
1454f097b:     	je	0x1454f094d <.text+0x54ef94d>
1454f097d:     	movq	%rax, %r15
1454f0980:     	movq	%rax, %rcx
1454f0983:     	movq	%r14, %rdx
1454f0986:     	movq	%rbx, %r8
1454f0989:     	callq	0x1457731ed <.text+0x57721ed>
1454f098e:     	jmp	0x1454f0996 <.text+0x54ef996>
1454f0990:     	movl	$0x1, %r15d
1454f0996:     	movq	0xc0(%rbp), %rax
1454f099d:     	movl	$0x14, (%rax)
1454f09a3:     	movb	$0x0, 0x4(%rax)
1454f09a7:     	movq	%rbx, 0x8(%rax)
1454f09ab:     	movq	%r15, 0x10(%rax)
1454f09af:     	movq	%rbx, 0x18(%rax)
1454f09b3:     	movq	$0x1, 0x10(%rbp)
1454f09bb:     	movq	%rax, 0x18(%rbp)
1454f09bf:     	movq	$0x1, 0x20(%rbp)
1454f09c7:     	cmpb	$0x5, %r13b
1454f09cb:     	jne	0x1454f0ab5 <.text+0x54efab5>
1454f09d1:     	leaq	0x1507613(%rip), %rbx   # 0x1469f7feb
1454f09d8:     	movl	$0x17, %r14d
1454f09de:     	movl	$0x17, %edx
1454f09e3:     	movq	%rbx, %rcx
1454f09e6:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f09eb:     	nop
1454f09ec:     	movq	%rdx, %r15
1454f09ef:     	testq	%rax, %rax
1454f09f2:     	cmovneq	%rax, %rbx
1454f09f6:     	cmoveq	%r14, %r15
1454f09fa:     	testq	%r15, %r15
1454f09fd:     	jns	0x1454f0a13 <.text+0x54efa13>
1454f09ff:     	xorl	%r14d, %r14d
1454f0a02:     	movq	%r14, %rcx
1454f0a05:     	movq	%r15, %rdx
1454f0a08:     	callq	0x14590379b <.text+0x590279b>
1454f0a0d:     	nop
1454f0a0e:     	jmp	0x1454f0c5e <.text+0x54efc5e>
1454f0a13:     	movq	%r15, 0xc0(%rbp)
1454f0a1a:     	je	0x1454f0a5a <.text+0x54efa5a>
1454f0a1c:     	callq	0x140002200 <.text+0x1200>
1454f0a21:     	movl	$0x1, %r14d
1454f0a27:     	movl	$0x1, %edx
1454f0a2c:     	movq	%r15, %rcx
1454f0a2f:     	callq	0x1400021c0 <.text+0x11c0>
1454f0a34:     	testq	%rax, %rax
1454f0a37:     	je	0x1454f0a02 <.text+0x54efa02>
1454f0a39:     	movq	%rax, 0xb8(%rbp)
1454f0a40:     	movq	%rax, %rcx
1454f0a43:     	movq	%rbx, %rdx
1454f0a46:     	movq	%r15, %r8
1454f0a49:     	callq	0x1457731ed <.text+0x57721ed>
1454f0a4e:     	movq	0x20(%rbp), %rbx
1454f0a52:     	cmpq	0x10(%rbp), %rbx
1454f0a56:     	je	0x1454f0a70 <.text+0x54efa70>
1454f0a58:     	jmp	0x1454f0a7a <.text+0x54efa7a>
1454f0a5a:     	movl	$0x1, %eax
1454f0a5f:     	movq	%rax, 0xb8(%rbp)
1454f0a66:     	movq	0x20(%rbp), %rbx
1454f0a6a:     	cmpq	0x10(%rbp), %rbx
1454f0a6e:     	jne	0x1454f0a7a <.text+0x54efa7a>
1454f0a70:     	leaq	0x10(%rbp), %rcx
1454f0a74:     	callq	0x145774710 <.text+0x5773710>
1454f0a79:     	nop
1454f0a7a:     	movq	0x18(%rbp), %rax
1454f0a7e:     	movq	%rbx, %rcx
1454f0a81:     	shlq	$0x5, %rcx
1454f0a85:     	movl	$0x15, (%rax,%rcx)
1454f0a8c:     	movb	$0x9, 0x4(%rax,%rcx)
1454f0a91:     	movq	0xc0(%rbp), %rdx
1454f0a98:     	movq	%rdx, 0x8(%rax,%rcx)
1454f0a9d:     	movq	0xb8(%rbp), %r8
1454f0aa4:     	movq	%r8, 0x10(%rax,%rcx)
1454f0aa9:     	movq	%rdx, 0x18(%rax,%rcx)
1454f0aae:     	incq	%rbx
1454f0ab1:     	movq	%rbx, 0x20(%rbp)
1454f0ab5:     	leaq	0x1507546(%rip), %rbx   # 0x1469f8002
1454f0abc:     	movl	$0x1a, %r14d
1454f0ac2:     	movl	$0x1a, %edx
1454f0ac7:     	movq	%rbx, %rcx
1454f0aca:     	callq	0x145457cb0 <.text+0x5456cb0>
1454f0acf:     	nop
1454f0ad0:     	movq	%rdx, %r15
1454f0ad3:     	testq	%rax, %rax
1454f0ad6:     	cmovneq	%rax, %rbx
1454f0ada:     	cmoveq	%r14, %r15
1454f0ade:     	testq	%r15, %r15
1454f0ae1:     	jns	0x1454f0af7 <.text+0x54efaf7>
1454f0ae3:     	xorl	%r14d, %r14d
1454f0ae6:     	movq	%r14, %rcx
1454f0ae9:     	movq	%r15, %rdx
1454f0aec:     	callq	0x14590379b <.text+0x590279b>
1454f0af1:     	nop
1454f0af2:     	jmp	0x1454f0c5e <.text+0x54efc5e>
1454f0af7:     	movq	%r15, 0xc0(%rbp)
1454f0afe:     	je	0x1454f0b3e <.text+0x54efb3e>
1454f0b00:     	callq	0x140002200 <.text+0x1200>
1454f0b05:     	movl	$0x1, %r14d
1454f0b0b:     	movl	$0x1, %edx
1454f0b10:     	movq	%r15, %rcx
1454f0b13:     	callq	0x1400021c0 <.text+0x11c0>
1454f0b18:     	testq	%rax, %rax
1454f0b1b:     	je	0x1454f0ae6 <.text+0x54efae6>
1454f0b1d:     	movq	%rax, 0xb8(%rbp)
1454f0b24:     	movq	%rax, %rcx
1454f0b27:     	movq	%rbx, %rdx
1454f0b2a:     	movq	%r15, %r8
1454f0b2d:     	callq	0x1457731ed <.text+0x57721ed>
1454f0b32:     	movq	0x20(%rbp), %rbx
1454f0b36:     	cmpq	0x10(%rbp), %rbx
1454f0b3a:     	je	0x1454f0b54 <.text+0x54efb54>
1454f0b3c:     	jmp	0x1454f0b5e <.text+0x54efb5e>
1454f0b3e:     	movl	$0x1, %eax
1454f0b43:     	movq	%rax, 0xb8(%rbp)
1454f0b4a:     	movq	0x20(%rbp), %rbx
1454f0b4e:     	cmpq	0x10(%rbp), %rbx
1454f0b52:     	jne	0x1454f0b5e <.text+0x54efb5e>
1454f0b54:     	leaq	0x10(%rbp), %rcx
1454f0b58:     	callq	0x145774710 <.text+0x5773710>
1454f0b5d:     	nop
1454f0b5e:     	movq	0x18(%rbp), %r9
1454f0b62:     	movq	%rbx, %rax
1454f0b65:     	shlq	$0x5, %rax
1454f0b69:     	movl	$0x16, (%r9,%rax)
1454f0b71:     	movb	$0x0, 0x4(%r9,%rax)
1454f0b77:     	movq	0xc0(%rbp), %rcx
1454f0b7e:     	movq	%rcx, 0x8(%r9,%rax)
1454f0b83:     	movq	0xb8(%rbp), %rdx
1454f0b8a:     	movq	%rdx, 0x10(%r9,%rax)
1454f0b8f:     	movq	%rcx, 0x18(%r9,%rax)
1454f0b94:     	incq	%rbx
1454f0b97:     	movq	%rbx, 0x20(%rbp)
1454f0b9b:     	movq	%rbx, 0x20(%rsp)
1454f0ba0:     	movq	%rsi, %rcx
1454f0ba3:     	movq	0xb0(%rbp), %rdx
1454f0baa:     	movq	%rdi, %r8
1454f0bad:     	callq	0x1454f9790 <.text+0x54f8790>
1454f0bb2:     	nop
1454f0bb3:     	movq	0x20(%rbp), %rsi
1454f0bb7:     	testq	%rsi, %rsi
1454f0bba:     	je	0x1454f0bf2 <.text+0x54efbf2>
1454f0bbc:     	movq	0x18(%rbp), %rdi
1454f0bc0:     	addq	$0x10, %rdi
1454f0bc4:     	jmp	0x1454f0bd9 <.text+0x54efbd9>
1454f0bc6:     	nopw	%cs:(%rax,%rax)
1454f0bd0:     	addq	$0x20, %rdi
1454f0bd4:     	decq	%rsi
1454f0bd7:     	je	0x1454f0bf2 <.text+0x54efbf2>
1454f0bd9:     	movq	-0x8(%rdi), %rdx
1454f0bdd:     	testq	%rdx, %rdx
1454f0be0:     	je	0x1454f0bd0 <.text+0x54efbd0>
1454f0be2:     	movq	(%rdi), %rcx
1454f0be5:     	movl	$0x1, %r8d
1454f0beb:     	callq	0x1400021d0 <.text+0x11d0>
1454f0bf0:     	jmp	0x1454f0bd0 <.text+0x54efbd0>
1454f0bf2:     	movq	0x10(%rbp), %rdx
1454f0bf6:     	testq	%rdx, %rdx
1454f0bf9:     	je	0x1454f0c0e <.text+0x54efc0e>
1454f0bfb:     	movq	0x18(%rbp), %rcx
1454f0bff:     	shlq	$0x5, %rdx
1454f0c03:     	movl	$0x8, %r8d
1454f0c09:     	callq	0x1400021d0 <.text+0x11d0>
1454f0c0e:     	movq	0xa8(%rbp), %rdx
1454f0c15:     	testq	%rdx, %rdx
1454f0c18:     	je	0x1454f0c2c <.text+0x54efc2c>
1454f0c1a:     	movl	$0x1, %r8d
1454f0c20:     	movq	0xb0(%rbp), %rcx
1454f0c27:     	callq	0x1400021d0 <.text+0x11d0>
1454f0c2c:     	movaps	0xd0(%rbp), %xmm6
1454f0c33:     	movaps	0xe0(%rbp), %xmm7
1454f0c3a:     	addq	$0x178, %rsp            # imm = 0x178
1454f0c41:     	popq	%rbx
1454f0c42:     	popq	%rdi
1454f0c43:     	popq	%rsi
1454f0c44:     	popq	%r12
1454f0c46:     	popq	%r13
1454f0c48:     	popq	%r14
1454f0c4a:     	popq	%r15
1454f0c4c:     	popq	%rbp
1454f0c4d:     	retq
1454f0c4e:     	movl	$0x8, %ecx
1454f0c53:     	movl	$0x20, %edx
1454f0c58:     	callq	0x145903781 <.text+0x5902781>
1454f0c5d:     	nop
1454f0c5e:     	ud2
