
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454356a0:     	pushq	%rbp
1454356a1:     	pushq	%r15
1454356a3:     	pushq	%r14
1454356a5:     	pushq	%rsi
1454356a6:     	pushq	%rdi
1454356a7:     	pushq	%rbx
1454356a8:     	subq	$0x258, %rsp            # imm = 0x258
1454356af:     	leaq	0x80(%rsp), %rbp
1454356b7:     	movq	$-0x2, 0x1d0(%rbp)
1454356c2:     	movq	%rcx, %rdi
1454356c5:     	leaq	0x188(%rbp), %rcx
1454356cc:     	movq	%rdi, %rdx
1454356cf:     	callq	0x145436620 <.text+0x5435620>
1454356d4:     	movq	0x190(%rbp), %rdx
1454356db:     	movq	0x198(%rbp), %rbx
1454356e2:     	leaq	0x170(%rbp), %rcx
1454356e9:     	movq	%rdx, 0x1b0(%rbp)
1454356f0:     	movq	%rbx, %r8
1454356f3:     	callq	0x145515c90 <.text+0x5514c90>
1454356f8:     	nop
1454356f9:     	movq	0x178(%rbp), %rdx
145435700:     	movq	0x180(%rbp), %rsi
145435707:     	leaq	-0x60(%rbp), %rcx
14543570b:     	movq	%rdx, 0x1b8(%rbp)
145435712:     	movq	%rsi, %r8
145435715:     	callq	0x145515850 <.text+0x5514850>
14543571a:     	nop
14543571b:     	movq	-0x60(%rbp), %r14
14543571f:     	cmpq	$-0x1, %r14
145435723:     	je	0x145435760 <.text+0x5434760>
145435725:     	cmpq	%rbx, -0x50(%rbp)
145435729:     	jne	0x145435749 <.text+0x5434749>
14543572b:     	movq	-0x58(%rbp), %r15
14543572f:     	movq	%r15, %rcx
145435732:     	movq	0x1b0(%rbp), %rdx
145435739:     	movq	%rbx, %r8
14543573c:     	callq	0x1457731e7 <.text+0x57721e7>
145435741:     	testl	%eax, %eax
145435743:     	je	0x145435c84 <.text+0x5434c84>
145435749:     	testq	%r14, %r14
14543574c:     	je	0x145435760 <.text+0x5434760>
14543574e:     	movq	-0x58(%rbp), %rcx
145435752:     	movl	$0x1, %r8d
145435758:     	movq	%r14, %rdx
14543575b:     	callq	0x1400021d0 <.text+0x11d0>
145435760:     	leaq	0x1308249(%rip), %rax   # 0x14673d9b0
145435767:     	movq	%rax, 0x1a0(%rbp)
14543576e:     	movq	$0x33, 0x1a8(%rbp)
145435779:     	leaq	0x1a0(%rbp), %rax
145435780:     	movq	%rax, -0x60(%rbp)
145435784:     	leaq	-0x54336cb(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14543578b:     	movq	%rax, -0x58(%rbp)
14543578f:     	leaq	0x130aa40(%rip), %rcx   # 0x1467401d6
145435796:     	leaq	-0x60(%rbp), %rdx
14543579a:     	callq	0x145711f90 <.text+0x5710f90>
14543579f:     	nop
1454357a0:     	movq	0x1b0(%rbp), %rcx
1454357a7:     	movq	%rbx, %rdx
1454357aa:     	callq	0x145469260 <.text+0x5468260>
1454357af:     	nop
1454357b0:     	xorps	%xmm0, %xmm0
1454357b3:     	movups	%xmm0, 0x150(%rbp)
1454357ba:     	movups	%xmm0, 0x140(%rbp)
1454357c1:     	movups	%xmm0, 0x130(%rbp)
1454357c8:     	movq	$0x0, 0x160(%rbp)
1454357d3:     	movq	$0x0, -0x60(%rbp)
1454357db:     	movq	$0x8, -0x58(%rbp)
1454357e3:     	movups	%xmm0, -0x50(%rbp)
1454357e7:     	movq	$-0x1, 0xf0(%rbp)
1454357f2:     	movq	$0x8, -0x40(%rbp)
1454357fa:     	movups	%xmm0, -0x38(%rbp)
1454357fe:     	movq	$0x4, -0x28(%rbp)
145435806:     	movups	%xmm0, -0x20(%rbp)
14543580a:     	movq	$0x4, -0x10(%rbp)
145435812:     	movups	%xmm0, -0x8(%rbp)
145435816:     	movq	$0x8, 0x8(%rbp)
14543581e:     	movups	%xmm0, 0x10(%rbp)
145435822:     	movq	$0x8, 0x20(%rbp)
14543582a:     	movups	%xmm0, 0x28(%rbp)
14543582e:     	movq	$0x8, 0x38(%rbp)
145435836:     	movups	%xmm0, 0x40(%rbp)
14543583a:     	movq	$0x8, 0x50(%rbp)
145435842:     	movups	%xmm0, 0x58(%rbp)
145435846:     	movq	$0x8, 0x68(%rbp)
14543584e:     	movups	%xmm0, 0x70(%rbp)
145435852:     	movq	$0x8, 0x80(%rbp)
14543585d:     	movups	%xmm0, 0x88(%rbp)
145435864:     	movq	$0x8, 0x98(%rbp)
14543586f:     	movups	%xmm0, 0xa0(%rbp)
145435876:     	movq	$0x4, 0xb0(%rbp)
145435881:     	movl	$0x0, 0x168(%rbp)
14543588b:     	movups	%xmm0, 0xb8(%rbp)
145435892:     	movq	$0x8, 0xc8(%rbp)
14543589d:     	movups	%xmm0, 0xd0(%rbp)
1454358a4:     	movq	$0x1, 0xe0(%rbp)
1454358af:     	movq	$0x0, 0xe8(%rbp)
1454358ba:     	cmpl	$0x0, 0x1c8(%rdi)
1454358c1:     	jne	0x145435a8f <.text+0x5434a8f>
1454358c7:     	cmpq	$0x0, 0x10(%rdi)
1454358cc:     	jne	0x145435a8f <.text+0x5434a8f>
1454358d2:     	cmpq	$-0x1, 0x150(%rdi)
1454358da:     	jne	0x145435a8f <.text+0x5434a8f>
1454358e0:     	cmpq	$0x0, 0x28(%rdi)
1454358e5:     	jne	0x145435a8f <.text+0x5434a8f>
1454358eb:     	cmpq	$0x0, 0x40(%rdi)
1454358f0:     	jne	0x145435a8f <.text+0x5434a8f>
1454358f6:     	cmpq	$0x0, 0x58(%rdi)
1454358fb:     	jne	0x145435a8f <.text+0x5434a8f>
145435901:     	movq	0x50(%rdi), %rcx
145435905:     	movl	$0x4, %edx
14543590a:     	xorl	%r8d, %r8d
14543590d:     	callq	0x14543c630 <.text+0x543b630>
145435912:     	testb	%al, %al
145435914:     	je	0x145435a8f <.text+0x5434a8f>
14543591a:     	cmpq	$0x0, 0x70(%rdi)
14543591f:     	jne	0x145435a8f <.text+0x5434a8f>
145435925:     	movq	0x68(%rdi), %rcx
145435929:     	movl	$0x8, %edx
14543592e:     	xorl	%r8d, %r8d
145435931:     	callq	0x145495c60 <.text+0x5494c60>
145435936:     	testb	%al, %al
145435938:     	je	0x145435a8f <.text+0x5434a8f>
14543593e:     	cmpq	$0x0, 0x88(%rdi)
145435946:     	jne	0x145435a8f <.text+0x5434a8f>
14543594c:     	movq	0x80(%rdi), %rcx
145435953:     	movl	$0x8, %edx
145435958:     	xorl	%r8d, %r8d
14543595b:     	callq	0x1454959b0 <.text+0x54949b0>
145435960:     	nop
145435961:     	cmpq	$0x0, 0xa0(%rdi)
145435969:     	sete	%cl
14543596c:     	andb	%cl, %al
14543596e:     	cmpb	$0x1, %al
145435970:     	jne	0x145435a8f <.text+0x5434a8f>
145435976:     	movq	0x98(%rdi), %rcx
14543597d:     	movl	$0x8, %edx
145435982:     	xorl	%r8d, %r8d
145435985:     	callq	0x14546a4a0 <.text+0x54694a0>
14543598a:     	testb	%al, %al
14543598c:     	je	0x145435a8f <.text+0x5434a8f>
145435992:     	cmpq	$0x0, 0xb8(%rdi)
14543599a:     	jne	0x145435a8f <.text+0x5434a8f>
1454359a0:     	movq	0xb0(%rdi), %rcx
1454359a7:     	movl	$0x8, %edx
1454359ac:     	xorl	%r8d, %r8d
1454359af:     	callq	0x140c72770 <.text+0xc71770>
1454359b4:     	testb	%al, %al
1454359b6:     	je	0x145435a8f <.text+0x5434a8f>
1454359bc:     	cmpq	$0x0, 0xd0(%rdi)
1454359c4:     	jne	0x145435a8f <.text+0x5434a8f>
1454359ca:     	movq	0xc8(%rdi), %rcx
1454359d1:     	movl	$0x8, %edx
1454359d6:     	xorl	%r8d, %r8d
1454359d9:     	callq	0x14546a520 <.text+0x5469520>
1454359de:     	testb	%al, %al
1454359e0:     	je	0x145435a8f <.text+0x5434a8f>
1454359e6:     	leaq	0x130(%rbp), %rdx
1454359ed:     	leaq	0x190(%rdi), %rcx
1454359f4:     	movl	$0x38, %r8d
1454359fa:     	callq	0x1457731e7 <.text+0x57721e7>
1454359ff:     	testl	%eax, %eax
145435a01:     	jne	0x145435a8f <.text+0x5434a8f>
145435a07:     	cmpq	$0x0, 0xe8(%rdi)
145435a0f:     	jne	0x145435a8f <.text+0x5434a8f>
145435a11:     	cmpq	$0x0, 0x100(%rdi)
145435a19:     	jne	0x145435a8f <.text+0x5434a8f>
145435a1b:     	movq	0xf8(%rdi), %rcx
145435a22:     	movl	$0x8, %edx
145435a27:     	xorl	%r8d, %r8d
145435a2a:     	callq	0x14546a4a0 <.text+0x54694a0>
145435a2f:     	testb	%al, %al
145435a31:     	je	0x145435a8f <.text+0x5434a8f>
145435a33:     	cmpq	$0x0, 0x118(%rdi)
145435a3b:     	jne	0x145435a8f <.text+0x5434a8f>
145435a3d:     	cmpq	$0x0, 0x130(%rdi)
145435a45:     	jne	0x145435a8f <.text+0x5434a8f>
145435a47:     	movq	0x128(%rdi), %rcx
145435a4e:     	movl	$0x8, %edx
145435a53:     	xorl	%r8d, %r8d
145435a56:     	callq	0x140c72770 <.text+0xc71770>
145435a5b:     	testb	%al, %al
145435a5d:     	je	0x145435a8f <.text+0x5434a8f>
145435a5f:     	cmpq	$0x0, 0x148(%rdi)
145435a67:     	jne	0x145435a8f <.text+0x5434a8f>
145435a69:     	movq	0x140(%rdi), %rcx
145435a70:     	movl	$0x1, %edx
145435a75:     	xorl	%r8d, %r8d
145435a78:     	callq	0x14543ca60 <.text+0x543ba60>
145435a7d:     	testb	%al, %al
145435a7f:     	je	0x145435a8f <.text+0x5434a8f>
145435a81:     	leaq	-0x60(%rbp), %rcx
145435a85:     	callq	0x1400a96c0 <.text+0xa86c0>
145435a8a:     	jmp	0x145435d3d <.text+0x5434d3d>
145435a8f:     	leaq	-0x60(%rbp), %rcx
145435a93:     	callq	0x1400a96c0 <.text+0xa86c0>
145435a98:     	nop
145435a99:     	callq	0x145703e20 <.text+0x5702e20>
145435a9e:     	nop
145435a9f:     	movl	%eax, 0x1a0(%rbp)
145435aa5:     	movl	%edx, 0x1a4(%rbp)
145435aab:     	leaq	-0x60(%rbp), %rcx
145435aaf:     	leaq	0x1a0(%rbp), %rdx
145435ab6:     	movl	$0xd53e8000, %r8d       # imm = 0xD53E8000
145435abc:     	movl	$0x19db1de, %r9d        # imm = 0x19DB1DE
145435ac2:     	callq	0x145703dd0 <.text+0x5702dd0>
145435ac7:     	nop
145435ac8:     	cmpb	$0x0, -0x60(%rbp)
145435acc:     	jne	0x145435ad4 <.text+0x5434ad4>
145435ace:     	movq	-0x58(%rbp), %rdi
145435ad2:     	jmp	0x145435ad6 <.text+0x5434ad6>
145435ad4:     	xorl	%edi, %edi
145435ad6:     	leaq	0x1308110(%rip), %rdx   # 0x14673dbed
145435add:     	leaq	-0x60(%rbp), %rcx
145435ae1:     	movl	$0x14, %r8d
145435ae7:     	callq	0x145469db0 <.text+0x5468db0>
145435aec:     	nop
145435aed:     	movq	-0x60(%rbp), %rax
145435af1:     	cmpq	$-0x1, %rax
145435af5:     	je	0x145435c07 <.text+0x5434c07>
145435afb:     	movq	%rax, 0x1c8(%rbp)
145435b02:     	movq	-0x58(%rbp), %rcx
145435b06:     	movq	-0x50(%rbp), %rdx
145435b0a:     	movq	%rcx, 0x1c0(%rbp)
145435b11:     	callq	0x1400a4890 <.text+0xa3890>
145435b16:     	nop
145435b17:     	movq	%rdx, %rcx
145435b1a:     	testq	%rdx, %rdx
145435b1d:     	je	0x145435be8 <.text+0x5434be8>
145435b23:     	cmpq	$0x1, %rcx
145435b27:     	jne	0x145435b40 <.text+0x5434b40>
145435b29:     	movzbl	(%rax), %edx
145435b2c:     	cmpl	$0x2b, %edx
145435b2f:     	je	0x145435be8 <.text+0x5434be8>
145435b35:     	cmpl	$0x2d, %edx
145435b38:     	je	0x145435be8 <.text+0x5434be8>
145435b3e:     	jmp	0x145435b43 <.text+0x5434b43>
145435b40:     	movzbl	(%rax), %edx
145435b43:     	xorl	%r8d, %r8d
145435b46:     	cmpb	$0x2b, %dl
145435b49:     	sete	%r8b
145435b4d:     	movq	%r8, %rdx
145435b50:     	negq	%rdx
145435b53:     	movq	%rcx, %r9
145435b56:     	subq	%r8, %r9
145435b59:     	addq	%rax, %r8
145435b5c:     	cmpq	$0x11, %r9
145435b60:     	jae	0x145435baa <.text+0x5434baa>
145435b62:     	testq	%r9, %r9
145435b65:     	je	0x145435cfc <.text+0x5434cfc>
145435b6b:     	addq	%rdx, %rcx
145435b6e:     	negq	%rcx
145435b71:     	xorl	%eax, %eax
145435b73:     	xorl	%edx, %edx
145435b75:     	nopw	%cs:(%rax,%rax)
145435b80:     	movzbl	(%r8,%rdx), %r9d
145435b85:     	addl	$-0x30, %r9d
145435b89:     	cmpl	$0x9, %r9d
145435b8d:     	ja	0x145435be8 <.text+0x5434be8>
145435b8f:     	leaq	(%rax,%rax,4), %rax
145435b93:     	movl	%r9d, %r9d
145435b96:     	leaq	(%r9,%rax,2), %rax
145435b9a:     	incq	%rdx
145435b9d:     	movq	%rcx, %r9
145435ba0:     	addq	%rdx, %r9
145435ba3:     	jne	0x145435b80 <.text+0x5434b80>
145435ba5:     	jmp	0x145435cfe <.text+0x5434cfe>
145435baa:     	addq	%rdx, %rcx
145435bad:     	negq	%rcx
145435bb0:     	xorl	%eax, %eax
145435bb2:     	movl	$0xa, %r9d
145435bb8:     	xorl	%r10d, %r10d
145435bbb:     	movq	%rcx, %rdx
145435bbe:     	addq	%r10, %rdx
145435bc1:     	je	0x145435cfe <.text+0x5434cfe>
145435bc7:     	mulq	%r9
145435bca:     	jo	0x145435be8 <.text+0x5434be8>
145435bcc:     	movzbl	(%r8,%r10), %r11d
145435bd1:     	addl	$-0x30, %r11d
145435bd5:     	addq	%r11, %rax
145435bd8:     	setb	%dl
145435bdb:     	cmpl	$0x9, %r11d
145435bdf:     	ja	0x145435be8 <.text+0x5434be8>
145435be1:     	incq	%r10
145435be4:     	testb	%dl, %dl
145435be6:     	je	0x145435bbb <.text+0x5434bbb>
145435be8:     	movq	0x1c8(%rbp), %rdx
145435bef:     	testq	%rdx, %rdx
145435bf2:     	je	0x145435c07 <.text+0x5434c07>
145435bf4:     	movl	$0x1, %r8d
145435bfa:     	movq	0x1c0(%rbp), %rcx
145435c01:     	callq	0x1400021d0 <.text+0x11d0>
145435c06:     	nop
145435c07:     	movq	0x1b8(%rbp), %rcx
145435c0e:     	movq	%rsi, %rdx
145435c11:     	movq	%rdi, %r8
145435c14:     	callq	0x145469450 <.text+0x5468450>
145435c19:     	nop
145435c1a:     	testb	%al, %al
145435c1c:     	je	0x145435d3d <.text+0x5434d3d>
145435c22:     	leaq	-0x60(%rbp), %rdx
145435c26:     	movl	$0x14, %r8d
145435c2c:     	movq	%rdi, %rcx
145435c2f:     	callq	0x14572f900 <.text+0x572e900>
145435c34:     	nop
145435c35:     	movq	%rdx, %rbx
145435c38:     	testq	%rdx, %rdx
145435c3b:     	jns	0x145435c4d <.text+0x5434c4d>
145435c3d:     	xorl	%edi, %edi
145435c3f:     	movq	%rdi, %rcx
145435c42:     	movq	%rbx, %rdx
145435c45:     	callq	0x14590379b <.text+0x590279b>
145435c4a:     	nop
145435c4b:     	ud2
145435c4d:     	testq	%rbx, %rbx
145435c50:     	je	0x145435cb0 <.text+0x5434cb0>
145435c52:     	movq	%rax, %rsi
145435c55:     	callq	0x140002200 <.text+0x1200>
145435c5a:     	movl	$0x1, %edi
145435c5f:     	movl	$0x1, %edx
145435c64:     	movq	%rbx, %rcx
145435c67:     	callq	0x1400021c0 <.text+0x11c0>
145435c6c:     	testq	%rax, %rax
145435c6f:     	je	0x145435c3f <.text+0x5434c3f>
145435c71:     	movq	%rax, %r14
145435c74:     	movq	%rax, %rcx
145435c77:     	movq	%rsi, %rdx
145435c7a:     	movq	%rbx, %r8
145435c7d:     	callq	0x1457731ed <.text+0x57721ed>
145435c82:     	jmp	0x145435cb6 <.text+0x5434cb6>
145435c84:     	testq	%r14, %r14
145435c87:     	je	0x145435c9b <.text+0x5434c9b>
145435c89:     	movl	$0x1, %r8d
145435c8f:     	movq	%r15, %rcx
145435c92:     	movq	%r14, %rdx
145435c95:     	callq	0x1400021d0 <.text+0x11d0>
145435c9a:     	nop
145435c9b:     	movq	0x1b8(%rbp), %rcx
145435ca2:     	movq	%rsi, %rdx
145435ca5:     	callq	0x145469260 <.text+0x5468260>
145435caa:     	nop
145435cab:     	jmp	0x1454357b0 <.text+0x54347b0>
145435cb0:     	movl	$0x1, %r14d
145435cb6:     	leaq	0x1307f30(%rip), %rcx   # 0x14673dbed
145435cbd:     	movl	$0x14, %edx
145435cc2:     	movq	%r14, 0x1c0(%rbp)
145435cc9:     	movq	%r14, %r8
145435ccc:     	movq	%rbx, %r9
145435ccf:     	movq	%rbx, 0x1c8(%rbp)
145435cd6:     	callq	0x145468b20 <.text+0x5467b20>
145435cdb:     	nop
145435cdc:     	movq	0x1c8(%rbp), %rdx
145435ce3:     	testq	%rdx, %rdx
145435ce6:     	je	0x145435d3d <.text+0x5434d3d>
145435ce8:     	movl	$0x1, %r8d
145435cee:     	movq	0x1c0(%rbp), %rcx
145435cf5:     	callq	0x1400021d0 <.text+0x11d0>
145435cfa:     	jmp	0x145435d3d <.text+0x5434d3d>
145435cfc:     	xorl	%eax, %eax
145435cfe:     	movq	0x1c8(%rbp), %rdx
145435d05:     	testq	%rdx, %rdx
145435d08:     	je	0x145435d22 <.text+0x5434d22>
145435d0a:     	movl	$0x1, %r8d
145435d10:     	movq	0x1c0(%rbp), %rcx
145435d17:     	movq	%rax, %rbx
145435d1a:     	callq	0x1400021d0 <.text+0x11d0>
145435d1f:     	movq	%rbx, %rax
145435d22:     	movq	%rdi, %rcx
145435d25:     	subq	%rax, %rcx
145435d28:     	setae	%al
145435d2b:     	cmpq	$0xe10, %rcx            # imm = 0xE10
145435d32:     	setb	%cl
145435d35:     	testb	%cl, %al
145435d37:     	je	0x145435c07 <.text+0x5434c07>
145435d3d:     	movq	0x170(%rbp), %rdx
145435d44:     	testq	%rdx, %rdx
145435d47:     	je	0x145435d5b <.text+0x5434d5b>
145435d49:     	movl	$0x1, %r8d
145435d4f:     	movq	0x1b8(%rbp), %rcx
145435d56:     	callq	0x1400021d0 <.text+0x11d0>
145435d5b:     	movq	0x188(%rbp), %rdx
145435d62:     	testq	%rdx, %rdx
145435d65:     	je	0x145435d7a <.text+0x5434d7a>
145435d67:     	movl	$0x1, %r8d
145435d6d:     	movq	0x1b0(%rbp), %rcx
145435d74:     	callq	0x1400021d0 <.text+0x11d0>
145435d79:     	nop
145435d7a:     	addq	$0x258, %rsp            # imm = 0x258
145435d81:     	popq	%rbx
145435d82:     	popq	%rdi
145435d83:     	popq	%rsi
145435d84:     	popq	%r14
145435d86:     	popq	%r15
145435d88:     	popq	%rbp
145435d89:     	retq
