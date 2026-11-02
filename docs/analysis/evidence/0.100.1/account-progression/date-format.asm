
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552d690:     	pushq	%r15
14552d692:     	pushq	%r14
14552d694:     	pushq	%r13
14552d696:     	pushq	%r12
14552d698:     	pushq	%rsi
14552d699:     	pushq	%rdi
14552d69a:     	pushq	%rbp
14552d69b:     	pushq	%rbx
14552d69c:     	subq	$0x1d8, %rsp            # imm = 0x1D8
14552d6a3:     	movq	%rdx, %rax
14552d6a6:     	movabsq	$-0x3dd1baf98d76b549, %rdx # imm = 0xC22E450672894AB7
14552d6b0:     	mulq	%rdx
14552d6b3:     	movq	%rdx, %r9
14552d6b6:     	shrq	$0x10, %r9
14552d6ba:     	leaq	0xafa6c(%r9), %rax
14552d6c1:     	movabsq	$0x396b06bcc8f87, %rdx  # imm = 0x396B06BCC8F87
14552d6cb:     	mulq	%rdx
14552d6ce:     	movq	%rdx, %r8
14552d6d1:     	shrq	$0x3, %r8
14552d6d5:     	imulq	$-0x23ab1, %r8, %rax    # imm = 0xFFFDC54F
14552d6dc:     	addq	%rax, %r9
14552d6df:     	addq	$0xafa6c, %r9           # imm = 0xAFA6C
14552d6e6:     	movabsq	$-0x2ce33e6c02ce33e7, %r11 # imm = 0xD31CC193FD31CC19
14552d6f0:     	movq	%r9, %rax
14552d6f3:     	imulq	%r11
14552d6f6:     	movq	%rdx, %r10
14552d6f9:     	shrq	$0x3f, %r10
14552d6fd:     	sarq	$0x8, %rdx
14552d701:     	addq	%rdx, %r10
14552d704:     	addq	%r9, %r10
14552d707:     	movabsq	$-0x1a537e05fff1a537, %rdx # imm = 0xE5AC81FA000E5AC9
14552d711:     	movq	%r9, %rax
14552d714:     	imulq	%rdx
14552d717:     	leaq	(%rdx,%r9), %rdi
14552d71b:     	movq	%rdi, %rax
14552d71e:     	shrq	$0x3f, %rax
14552d722:     	sarq	$0xf, %rdi
14552d726:     	addq	%rax, %rdi
14552d729:     	movabsq	$0x1a537e05fff1a537, %rdx # imm = 0x1A537E05FFF1A537
14552d733:     	movq	%r9, %rax
14552d736:     	imulq	%rdx
14552d739:     	addq	%r10, %rdi
14552d73c:     	subq	%r9, %rdx
14552d73f:     	movq	%rdx, %rsi
14552d742:     	shrq	$0x3f, %rsi
14552d746:     	sarq	$0x11, %rdx
14552d74a:     	addq	%rdx, %rsi
14552d74d:     	addq	%rdi, %rsi
14552d750:     	movabsq	$0x2ce33e6c02ce33e7, %rdx # imm = 0x2CE33E6C02CE33E7
14552d75a:     	movq	%rsi, %rax
14552d75d:     	imulq	%rdx
14552d760:     	movq	%rdx, %r10
14552d763:     	movq	%rdx, %rax
14552d766:     	shrq	$0x3f, %rax
14552d76a:     	sarq	$0x6, %r10
14552d76e:     	addq	%rax, %r10
14552d771:     	imulq	$-0x16d, %r10, %rdi     # imm = 0xFE93
14552d778:     	movq	%rsi, %rax
14552d77b:     	imulq	%r11
14552d77e:     	movq	%rdx, %r11
14552d781:     	movq	%rdx, %rax
14552d784:     	shrq	$0x3f, %rax
14552d788:     	sarq	$0x8, %r11
14552d78c:     	addq	%rax, %r11
14552d78f:     	movabsq	$0x1cba6563d8d5e3c7, %rdx # imm = 0x1CBA6563D8D5E3C7
14552d799:     	movq	%rsi, %rax
14552d79c:     	imulq	%rdx
14552d79f:     	movq	%rdx, %rax
14552d7a2:     	shrq	$0x3f, %rax
14552d7a6:     	sarq	$0xc, %rdx
14552d7aa:     	addq	%rax, %rdx
14552d7ad:     	addq	%r9, %r11
14552d7b0:     	addq	%rdx, %r11
14552d7b3:     	addq	%rdi, %r11
14552d7b6:     	leaq	(%r11,%r11,4), %rax
14552d7ba:     	addq	$0x2, %rax
14552d7be:     	movabsq	$0x358ae0358ae0358b, %rdx # imm = 0x358AE0358AE0358B
14552d7c8:     	imulq	%rdx
14552d7cb:     	movq	%rdx, %r9
14552d7ce:     	movq	%rdx, %rsi
14552d7d1:     	shrq	$0x3f, %rsi
14552d7d5:     	sarq	$0x5, %r9
14552d7d9:     	leaq	(%r9,%rsi), %rax
14552d7dd:     	imulq	$0x99, %rax, %rax
14552d7e4:     	addq	$0x2, %rax
14552d7e8:     	movabsq	$-0x6666666666666667, %rdx # imm = 0x9999999999999999
14552d7f2:     	imulq	%rdx
14552d7f5:     	movq	%rcx, 0x28(%rsp)
14552d7fa:     	movq	%rdx, %rax
14552d7fd:     	shrq	$0x3f, %rax
14552d801:     	sarq	%rdx
14552d804:     	addq	%rax, %rdx
14552d807:     	leaq	(%r11,%rdx), %rax
14552d80b:     	incq	%rax
14552d80e:     	cmpq	$0x132, %r11            # imm = 0x132
14552d815:     	leaq	0x3(%r9,%rsi), %rcx
14552d81a:     	leaq	-0x9(%r9,%rsi), %rdx
14552d81f:     	cmovlq	%rcx, %rdx
14552d823:     	movq	%rdx, 0xa0(%rsp)
14552d82b:     	movq	%rax, 0xa8(%rsp)
14552d833:     	imulq	$0x190, %r8, %rax       # imm = 0x190
14552d83a:     	addq	%r10, %rax
14552d83d:     	xorl	%ecx, %ecx
14552d83f:     	cmpq	$0x3, %rdx
14552d843:     	setl	%cl
14552d846:     	addq	%rax, %rcx
14552d849:     	movq	%rcx, 0xb0(%rsp)
14552d851:     	leaq	0x180784e(%rip), %rsi   # 0x146d350a6
14552d858:     	movl	$0x3, %edi
14552d85d:     	movl	$0x3, %edx
14552d862:     	movq	%rsi, %rcx
14552d865:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d86a:     	testq	%rax, %rax
14552d86d:     	cmoveq	%rsi, %rax
14552d871:     	movq	%rax, 0x98(%rsp)
14552d879:     	cmoveq	%rdi, %rdx
14552d87d:     	movq	%rdx, 0x90(%rsp)
14552d885:     	movl	$0x3, %edi
14552d88a:     	leaq	0x1807818(%rip), %rsi   # 0x146d350a9
14552d891:     	movl	$0x3, %edx
14552d896:     	movq	%rsi, %rcx
14552d899:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d89e:     	testq	%rax, %rax
14552d8a1:     	cmoveq	%rsi, %rax
14552d8a5:     	movq	%rax, 0x88(%rsp)
14552d8ad:     	cmoveq	%rdi, %rdx
14552d8b1:     	movq	%rdx, 0x80(%rsp)
14552d8b9:     	movl	$0x3, %edi
14552d8be:     	leaq	0x18077e7(%rip), %rsi   # 0x146d350ac
14552d8c5:     	movl	$0x3, %edx
14552d8ca:     	movq	%rsi, %rcx
14552d8cd:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d8d2:     	testq	%rax, %rax
14552d8d5:     	cmoveq	%rsi, %rax
14552d8d9:     	movq	%rax, 0x78(%rsp)
14552d8de:     	cmoveq	%rdi, %rdx
14552d8e2:     	movq	%rdx, 0x70(%rsp)
14552d8e7:     	movl	$0x3, %edi
14552d8ec:     	leaq	0x18077bc(%rip), %rsi   # 0x146d350af
14552d8f3:     	movl	$0x3, %edx
14552d8f8:     	movq	%rsi, %rcx
14552d8fb:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d900:     	testq	%rax, %rax
14552d903:     	cmoveq	%rsi, %rax
14552d907:     	movq	%rax, 0x68(%rsp)
14552d90c:     	cmoveq	%rdi, %rdx
14552d910:     	movq	%rdx, 0x60(%rsp)
14552d915:     	movl	$0x3, %edi
14552d91a:     	leaq	0x1807791(%rip), %rsi   # 0x146d350b2
14552d921:     	movl	$0x3, %edx
14552d926:     	movq	%rsi, %rcx
14552d929:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d92e:     	testq	%rax, %rax
14552d931:     	cmoveq	%rsi, %rax
14552d935:     	movq	%rax, 0x58(%rsp)
14552d93a:     	cmoveq	%rdi, %rdx
14552d93e:     	movq	%rdx, 0x50(%rsp)
14552d943:     	movl	$0x3, %edi
14552d948:     	leaq	0x1807766(%rip), %rsi   # 0x146d350b5
14552d94f:     	movl	$0x3, %edx
14552d954:     	movq	%rsi, %rcx
14552d957:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d95c:     	testq	%rax, %rax
14552d95f:     	cmoveq	%rsi, %rax
14552d963:     	movq	%rax, 0x48(%rsp)
14552d968:     	cmoveq	%rdi, %rdx
14552d96c:     	movq	%rdx, 0x40(%rsp)
14552d971:     	leaq	0x1807740(%rip), %rsi   # 0x146d350b8
14552d978:     	movl	$0x3, %edx
14552d97d:     	movq	%rsi, %rcx
14552d980:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d985:     	movq	%rax, %r15
14552d988:     	testq	%rax, %rax
14552d98b:     	cmoveq	%rsi, %r15
14552d98f:     	cmoveq	%rdi, %rdx
14552d993:     	movq	%rdx, 0x38(%rsp)
14552d998:     	leaq	0x180771c(%rip), %rsi   # 0x146d350bb
14552d99f:     	movl	$0x3, %edx
14552d9a4:     	movq	%rsi, %rcx
14552d9a7:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d9ac:     	movq	%rax, %r13
14552d9af:     	testq	%rax, %rax
14552d9b2:     	cmoveq	%rsi, %r13
14552d9b6:     	cmoveq	%rdi, %rdx
14552d9ba:     	movq	%rdx, 0x30(%rsp)
14552d9bf:     	movl	$0x3, %ebx
14552d9c4:     	leaq	0x18076f3(%rip), %rdi   # 0x146d350be
14552d9cb:     	movl	$0x3, %edx
14552d9d0:     	movq	%rdi, %rcx
14552d9d3:     	callq	0x145457cb0 <.text+0x5456cb0>
14552d9d8:     	movq	%rax, %rsi
14552d9db:     	movq	%rdx, %rbp
14552d9de:     	testq	%rax, %rax
14552d9e1:     	cmoveq	%rdi, %rsi
14552d9e5:     	cmoveq	%rbx, %rbp
14552d9e9:     	movl	$0x3, %r14d
14552d9ef:     	leaq	0x18076cb(%rip), %rbx   # 0x146d350c1
14552d9f6:     	movl	$0x3, %edx
14552d9fb:     	movq	%rbx, %rcx
14552d9fe:     	callq	0x145457cb0 <.text+0x5456cb0>
14552da03:     	movq	%rax, %r12
14552da06:     	movq	%rdx, %rdi
14552da09:     	testq	%rax, %rax
14552da0c:     	cmoveq	%rbx, %r12
14552da10:     	cmoveq	%r14, %rdi
14552da14:     	leaq	0x18076a9(%rip), %rcx   # 0x146d350c4
14552da1b:     	movl	$0x3, %edx
14552da20:     	callq	0x145457cb0 <.text+0x5456cb0>
14552da25:     	movq	%rax, %rbx
14552da28:     	movq	%rdx, %r14
14552da2b:     	testq	%rax, %rax
14552da2e:     	leaq	0x180768f(%rip), %rax   # 0x146d350c4
14552da35:     	cmoveq	%rax, %rbx
14552da39:     	movl	$0x3, %eax
14552da3e:     	cmoveq	%rax, %r14
14552da42:     	leaq	0x180767e(%rip), %rcx   # 0x146d350c7
14552da49:     	movl	$0x3, %edx
14552da4e:     	callq	0x145457cb0 <.text+0x5456cb0>
14552da53:     	testq	%rax, %rax
14552da56:     	leaq	0x180766a(%rip), %rcx   # 0x146d350c7
14552da5d:     	cmoveq	%rcx, %rax
14552da61:     	movl	$0x3, %ecx
14552da66:     	cmoveq	%rcx, %rdx
14552da6a:     	movq	0x98(%rsp), %rcx
14552da72:     	movq	%rcx, 0x118(%rsp)
14552da7a:     	movq	0x90(%rsp), %rcx
14552da82:     	movq	%rcx, 0x120(%rsp)
14552da8a:     	movq	0x88(%rsp), %rcx
14552da92:     	movq	%rcx, 0x128(%rsp)
14552da9a:     	movq	0x80(%rsp), %rcx
14552daa2:     	movq	%rcx, 0x130(%rsp)
14552daaa:     	movq	0x78(%rsp), %rcx
14552daaf:     	movq	%rcx, 0x138(%rsp)
14552dab7:     	movq	0x70(%rsp), %rcx
14552dabc:     	movq	%rcx, 0x140(%rsp)
14552dac4:     	movq	0x68(%rsp), %rcx
14552dac9:     	movq	%rcx, 0x148(%rsp)
14552dad1:     	movq	0x60(%rsp), %rcx
14552dad6:     	movq	%rcx, 0x150(%rsp)
14552dade:     	movq	0x58(%rsp), %rcx
14552dae3:     	movq	%rcx, 0x158(%rsp)
14552daeb:     	movq	0x50(%rsp), %rcx
14552daf0:     	movq	%rcx, 0x160(%rsp)
14552daf8:     	movq	0x48(%rsp), %rcx
14552dafd:     	movq	%rcx, 0x168(%rsp)
14552db05:     	movq	0x40(%rsp), %rcx
14552db0a:     	movq	%rcx, 0x170(%rsp)
14552db12:     	movq	%r15, 0x178(%rsp)
14552db1a:     	movq	0x38(%rsp), %rcx
14552db1f:     	movq	%rcx, 0x180(%rsp)
14552db27:     	movq	%r13, 0x188(%rsp)
14552db2f:     	movq	0x30(%rsp), %rcx
14552db34:     	movq	%rcx, 0x190(%rsp)
14552db3c:     	movq	%rsi, 0x198(%rsp)
14552db44:     	movq	%rbp, 0x1a0(%rsp)
14552db4c:     	movq	%r12, 0x1a8(%rsp)
14552db54:     	movq	%rdi, 0x1b0(%rsp)
14552db5c:     	movq	%rbx, 0x1b8(%rsp)
14552db64:     	movq	%r14, 0x1c0(%rsp)
14552db6c:     	movq	%rax, 0x1c8(%rsp)
14552db74:     	movq	%rdx, 0x1d0(%rsp)
14552db7c:     	leaq	0x1807547(%rip), %rsi   # 0x146d350ca
14552db83:     	movl	$0xf, %edi
14552db88:     	movl	$0xf, %edx
14552db8d:     	movq	%rsi, %rcx
14552db90:     	callq	0x145457cb0 <.text+0x5456cb0>
14552db95:     	movq	0xa0(%rsp), %rcx
14552db9d:     	decq	%rcx
14552dba0:     	cmpq	$0xb, %rcx
14552dba4:     	ja	0x14552dc9d <.text+0x552cc9d>
14552dbaa:     	movq	%rdx, %r8
14552dbad:     	testq	%rax, %rax
14552dbb0:     	cmoveq	%rdi, %r8
14552dbb4:     	cmovneq	%rax, %rsi
14552dbb8:     	shlq	$0x4, %rcx
14552dbbc:     	leaq	(%rsp,%rcx), %rax
14552dbc0:     	addq	$0x118, %rax            # imm = 0x118
14552dbc6:     	leaq	0x1807533(%rip), %rcx   # 0x146d35100
14552dbcd:     	movq	%rcx, 0xb8(%rsp)
14552dbd5:     	movq	$0x1, 0xc0(%rsp)
14552dbe1:     	leaq	0xa8(%rsp), %rcx
14552dbe9:     	movq	%rcx, 0xc8(%rsp)
14552dbf1:     	leaq	0x18074e8(%rip), %rcx   # 0x146d350e0
14552dbf8:     	movq	%rcx, 0xd0(%rsp)
14552dc00:     	leaq	0x1807539(%rip), %rdx   # 0x146d35140
14552dc07:     	movq	%rdx, 0xd8(%rsp)
14552dc0f:     	movq	$0x5, 0xe0(%rsp)
14552dc1b:     	movq	%rax, 0xe8(%rsp)
14552dc23:     	leaq	0x18074f6(%rip), %rax   # 0x146d35120
14552dc2a:     	movq	%rax, 0xf0(%rsp)
14552dc32:     	leaq	0x180750c(%rip), %rax   # 0x146d35145
14552dc39:     	movq	%rax, 0xf8(%rsp)
14552dc41:     	movq	$0x1, 0x100(%rsp)
14552dc4d:     	leaq	0xb0(%rsp), %rax
14552dc55:     	movq	%rax, 0x108(%rsp)
14552dc5d:     	movq	%rcx, 0x110(%rsp)
14552dc65:     	movq	$0x3, 0x20(%rsp)
14552dc6e:     	leaq	0xb8(%rsp), %r9
14552dc76:     	movq	0x28(%rsp), %rdi
14552dc7b:     	movq	%rdi, %rcx
14552dc7e:     	movq	%rsi, %rdx
14552dc81:     	callq	0x145458060 <.text+0x5457060>
14552dc86:     	movq	%rdi, %rax
14552dc89:     	addq	$0x1d8, %rsp            # imm = 0x1D8
14552dc90:     	popq	%rbx
14552dc91:     	popq	%rbp
14552dc92:     	popq	%rdi
14552dc93:     	popq	%rsi
14552dc94:     	popq	%r12
14552dc96:     	popq	%r13
14552dc98:     	popq	%r14
14552dc9a:     	popq	%r15
14552dc9c:     	retq
14552dc9d:     	leaq	0x1807464(%rip), %r8    # 0x146d35108
14552dca4:     	movl	$0xc, %edx
14552dca9:     	callq	0x145903b33 <.text+0x5902b33>
14552dcae:     	ud2
