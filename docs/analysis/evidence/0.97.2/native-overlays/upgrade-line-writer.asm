
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455187c0:     	pushq	%rbp
1455187c1:     	pushq	%r15
1455187c3:     	pushq	%r14
1455187c5:     	pushq	%r13
1455187c7:     	pushq	%r12
1455187c9:     	pushq	%rsi
1455187ca:     	pushq	%rdi
1455187cb:     	pushq	%rbx
1455187cc:     	subq	$0x108, %rsp            # imm = 0x108
1455187d3:     	leaq	0x80(%rsp), %rbp
1455187db:     	movaps	%xmm9, 0x70(%rbp)
1455187e0:     	movaps	%xmm8, 0x60(%rbp)
1455187e5:     	movaps	%xmm7, 0x50(%rbp)
1455187e9:     	movaps	%xmm6, 0x40(%rbp)
1455187ed:     	movq	$-0x2, 0x38(%rbp)
1455187f5:     	movq	(%rcx), %r14
1455187f8:     	movq	0x8(%rcx), %rbx
1455187fc:     	movq	(%rdx), %rax
1455187ff:     	movq	%rax, -0x28(%rbp)
145518803:     	movq	0x8(%rdx), %r8
145518807:     	cmpq	%rbx, %r14
14551880a:     	je	0x145518b91 <.text+0x5517b91>
145518810:     	movq	0x10(%rcx), %rsi
145518814:     	movq	0x18(%rcx), %rax
145518818:     	movq	%rax, -0x58(%rbp)
14551881c:     	movq	0x20(%rcx), %rax
145518820:     	movq	%rax, -0x50(%rbp)
145518824:     	movq	0x10(%rdx), %r15
145518828:     	subq	%r14, %rbx
14551882b:     	movss	0x3d2cf9(%rip), %xmm7   # 0x1458eb52c
145518833:     	xorps	%xmm8, %xmm8
145518837:     	movss	0x3d2cdc(%rip), %xmm9   # 0x1458eb51c
145518840:     	xorl	%r13d, %r13d
145518843:     	jmp	0x14551887e <.text+0x551787e>
145518845:     	movq	(%rsi), %rdx
145518848:     	leaq	-0x20(%rbp), %rcx
14551884c:     	movaps	%xmm6, %xmm2
14551884f:     	callq	0x14540ee70 <.text+0x540de70>
145518854:     	nop
145518855:     	movq	-0x30(%rbp), %r8
145518859:     	leaq	(%r8,%r8,2), %rax
14551885d:     	movq	-0x10(%rbp), %rcx
145518861:     	movq	%rcx, 0x10(%r15,%rax,8)
145518866:     	movaps	-0x20(%rbp), %xmm0
14551886a:     	movups	%xmm0, (%r15,%rax,8)
14551886f:     	incq	%r8
145518872:     	incq	%r13
145518875:     	cmpq	%rbx, %r13
145518878:     	je	0x145518b91 <.text+0x5517b91>
14551887e:     	movq	%r8, -0x30(%rbp)
145518882:     	movb	(%r14,%r13), %dil
145518886:     	movq	-0x58(%rbp), %rax
14551888a:     	movq	(%rax), %r8
14551888d:     	movq	%rsi, %rcx
145518890:     	movl	%edi, %edx
145518892:     	callq	0x1454f94c0 <.text+0x54f84c0>
145518897:     	nop
145518898:     	movaps	%xmm0, %xmm6
14551889b:     	movzbl	%dil, %eax
14551889f:     	movl	%eax, %eax
1455188a1:     	leaq	0x17d19c4(%rip), %rcx   # 0x146cea26c
1455188a8:     	movslq	(%rcx,%rax,4), %rax
1455188ac:     	addq	%rcx, %rax
1455188af:     	jmpq	*%rax
1455188b1:     	leaq	-0x48(%rbp), %rcx
1455188b5:     	movq	%rsi, %rdx
1455188b8:     	movq	-0x50(%rbp), %r8
1455188bc:     	movaps	%xmm6, %xmm3
1455188bf:     	callq	0x14541b390 <.text+0x541a390>
1455188c4:     	nop
1455188c5:     	cmpq	$-0x1, -0x48(%rbp)
1455188ca:     	je	0x145518ac1 <.text+0x5517ac1>
1455188d0:     	movq	-0x38(%rbp), %rax
1455188d4:     	movq	%rax, -0x10(%rbp)
1455188d8:     	movups	-0x48(%rbp), %xmm0
1455188dc:     	movaps	%xmm0, -0x20(%rbp)
1455188e0:     	jmp	0x145518855 <.text+0x5517855>
1455188e5:     	movl	$0xe, %edx
1455188ea:     	leaq	0x17d0e5a(%rip), %rcx   # 0x146ce974b
1455188f1:     	callq	0x145452400 <.text+0x5451400>
1455188f6:     	nop
1455188f7:     	movq	%rax, %r12
1455188fa:     	movq	%rdx, %rdi
1455188fd:     	mulss	%xmm7, %xmm6
145518901:     	movss	%xmm6, -0x48(%rbp)
145518906:     	leaq	-0x48(%rbp), %rax
14551890a:     	movq	%rax, 0x18(%rbp)
14551890e:     	leaq	0x2049cb(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145518915:     	movq	%rax, 0x20(%rbp)
145518919:     	movq	%rbp, %rcx
14551891c:     	leaq	0x17d03cb(%rip), %rdx   # 0x146ce8cee
145518923:     	leaq	0x18(%rbp), %r8
145518927:     	callq	0x14570bf80 <.text+0x570af80>
14551892c:     	nop
14551892d:     	testq	%r12, %r12
145518930:     	movl	$0xe, %eax
145518935:     	cmoveq	%rax, %rdi
145518939:     	leaq	0x17d0e0b(%rip), %rax   # 0x146ce974b
145518940:     	cmoveq	%rax, %r12
145518944:     	leaq	0x17d03cd(%rip), %rax   # 0x146ce8d18
14551894b:     	movq	%rax, 0x18(%rbp)
14551894f:     	movq	$0x1, 0x20(%rbp)
145518957:     	movq	%rbp, %rax
14551895a:     	movq	%rax, 0x28(%rbp)
14551895e:     	leaq	0x17d0393(%rip), %rax   # 0x146ce8cf8
145518965:     	movq	%rax, 0x30(%rbp)
145518969:     	movq	$0x1, 0x20(%rsp)
145518972:     	leaq	-0x20(%rbp), %rcx
145518976:     	movq	%r12, %rdx
145518979:     	movq	%rdi, %r8
14551897c:     	leaq	0x18(%rbp), %r9
145518980:     	callq	0x145452790 <.text+0x5451790>
145518985:     	nop
145518986:     	jmp	0x145518b70 <.text+0x5517b70>
14551898b:     	movl	$0xc, %edx
145518990:     	leaq	0x17d0d7b(%rip), %rcx   # 0x146ce9712
145518997:     	callq	0x145452400 <.text+0x5451400>
14551899c:     	nop
14551899d:     	movq	%rdx, %r8
1455189a0:     	testq	%rax, %rax
1455189a3:     	leaq	0x17d0d68(%rip), %rcx   # 0x146ce9712
1455189aa:     	cmoveq	%rcx, %rax
1455189ae:     	movl	$0xc, %ecx
1455189b3:     	cmoveq	%rcx, %r8
1455189b7:     	cvttss2si	%xmm6, %rcx
1455189bc:     	ucomiss	%xmm8, %xmm6
1455189c0:     	movl	$0x0, %edx
1455189c5:     	cmovbl	%edx, %ecx
1455189c8:     	ucomiss	%xmm9, %xmm6
1455189cc:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1455189d1:     	cmoval	%edx, %ecx
1455189d4:     	movl	%ecx, (%rbp)
1455189d7:     	leaq	0x17d0d62(%rip), %rcx   # 0x146ce9740
1455189de:     	movq	%rcx, 0x18(%rbp)
1455189e2:     	movq	$0x1, 0x20(%rbp)
1455189ea:     	movq	%rbp, %rcx
1455189ed:     	movq	%rcx, 0x28(%rbp)
1455189f1:     	leaq	0x17d0d28(%rip), %rcx   # 0x146ce9720
1455189f8:     	movq	%rcx, 0x30(%rbp)
1455189fc:     	movq	$0x1, 0x20(%rsp)
145518a05:     	leaq	-0x20(%rbp), %rcx
145518a09:     	movq	%rax, %rdx
145518a0c:     	leaq	0x18(%rbp), %r9
145518a10:     	callq	0x145452790 <.text+0x5451790>
145518a15:     	nop
145518a16:     	jmp	0x145518855 <.text+0x5517855>
145518a1b:     	movl	$0xa, %edx
145518a20:     	leaq	0x17d0d1a(%rip), %rcx   # 0x146ce9741
145518a27:     	callq	0x145452400 <.text+0x5451400>
145518a2c:     	nop
145518a2d:     	movq	%rax, %r12
145518a30:     	movq	%rdx, %rdi
145518a33:     	mulss	%xmm7, %xmm6
145518a37:     	movss	%xmm6, -0x48(%rbp)
145518a3c:     	leaq	-0x48(%rbp), %rax
145518a40:     	movq	%rax, 0x18(%rbp)
145518a44:     	leaq	0x204895(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145518a4b:     	movq	%rax, 0x20(%rbp)
145518a4f:     	movq	%rbp, %rcx
145518a52:     	leaq	0x17d0295(%rip), %rdx   # 0x146ce8cee
145518a59:     	leaq	0x18(%rbp), %r8
145518a5d:     	callq	0x14570bf80 <.text+0x570af80>
145518a62:     	nop
145518a63:     	testq	%r12, %r12
145518a66:     	movl	$0xa, %eax
145518a6b:     	cmoveq	%rax, %rdi
145518a6f:     	leaq	0x17d0ccb(%rip), %rax   # 0x146ce9741
145518a76:     	cmoveq	%rax, %r12
145518a7a:     	leaq	0x17d0297(%rip), %rax   # 0x146ce8d18
145518a81:     	movq	%rax, 0x18(%rbp)
145518a85:     	movq	$0x1, 0x20(%rbp)
145518a8d:     	movq	%rbp, %rax
145518a90:     	movq	%rax, 0x28(%rbp)
145518a94:     	leaq	0x17d025d(%rip), %rax   # 0x146ce8cf8
145518a9b:     	movq	%rax, 0x30(%rbp)
145518a9f:     	movq	$0x1, 0x20(%rsp)
145518aa8:     	leaq	-0x20(%rbp), %rcx
145518aac:     	movq	%r12, %rdx
145518aaf:     	movq	%rdi, %r8
145518ab2:     	leaq	0x18(%rbp), %r9
145518ab6:     	callq	0x145452790 <.text+0x5451790>
145518abb:     	nop
145518abc:     	jmp	0x145518b70 <.text+0x5517b70>
145518ac1:     	movl	$0xe, %edx
145518ac6:     	leaq	0x17d0213(%rip), %rcx   # 0x146ce8ce0
145518acd:     	callq	0x145452400 <.text+0x5451400>
145518ad2:     	nop
145518ad3:     	movq	%rax, %r12
145518ad6:     	movq	%rdx, %rdi
145518ad9:     	mulss	%xmm7, %xmm6
145518add:     	movss	%xmm6, -0x20(%rbp)
145518ae2:     	leaq	-0x20(%rbp), %rax
145518ae6:     	movq	%rax, 0x18(%rbp)
145518aea:     	leaq	0x2047ef(%rip), %rax    # 0x14571d2e0 <.text+0x571c2e0>
145518af1:     	movq	%rax, 0x20(%rbp)
145518af5:     	movq	%rbp, %rcx
145518af8:     	leaq	0x17d01ef(%rip), %rdx   # 0x146ce8cee
145518aff:     	leaq	0x18(%rbp), %r8
145518b03:     	callq	0x14570bf80 <.text+0x570af80>
145518b08:     	nop
145518b09:     	testq	%r12, %r12
145518b0c:     	movl	$0xe, %eax
145518b11:     	cmoveq	%rax, %rdi
145518b15:     	leaq	0x17d01c4(%rip), %rax   # 0x146ce8ce0
145518b1c:     	cmoveq	%rax, %r12
145518b20:     	leaq	0x17d01f1(%rip), %rax   # 0x146ce8d18
145518b27:     	movq	%rax, 0x18(%rbp)
145518b2b:     	movq	$0x1, 0x20(%rbp)
145518b33:     	movq	%rbp, %rax
145518b36:     	movq	%rax, 0x28(%rbp)
145518b3a:     	leaq	0x17d01b7(%rip), %rax   # 0x146ce8cf8
145518b41:     	movq	%rax, 0x30(%rbp)
145518b45:     	movq	$0x1, 0x20(%rsp)
145518b4e:     	leaq	-0x20(%rbp), %rcx
145518b52:     	movq	%r12, %rdx
145518b55:     	movq	%rdi, %r8
145518b58:     	leaq	0x18(%rbp), %r9
145518b5c:     	callq	0x145452790 <.text+0x5451790>
145518b61:     	nop
145518b62:     	nopw	%cs:(%rax,%rax)
145518b70:     	movq	(%rbp), %rdx
145518b74:     	testq	%rdx, %rdx
145518b77:     	je	0x145518855 <.text+0x5517855>
145518b7d:     	movq	0x8(%rbp), %rcx
145518b81:     	movl	$0x1, %r8d
145518b87:     	callq	0x1400021d0 <.text+0x11d0>
145518b8c:     	jmp	0x145518855 <.text+0x5517855>
145518b91:     	movq	-0x28(%rbp), %rax
145518b95:     	movq	%r8, (%rax)
145518b98:     	movaps	0x40(%rbp), %xmm6
145518b9c:     	movaps	0x50(%rbp), %xmm7
145518ba0:     	movaps	0x60(%rbp), %xmm8
145518ba5:     	movaps	0x70(%rbp), %xmm9
145518baa:     	addq	$0x108, %rsp            # imm = 0x108
145518bb1:     	popq	%rbx
145518bb2:     	popq	%rdi
145518bb3:     	popq	%rsi
145518bb4:     	popq	%r12
145518bb6:     	popq	%r13
145518bb8:     	popq	%r14
145518bba:     	popq	%r15
145518bbc:     	popq	%rbp
145518bbd:     	retq
