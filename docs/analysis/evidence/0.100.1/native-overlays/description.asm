
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145487680:     	pushq	%rbp
145487681:     	pushq	%r15
145487683:     	pushq	%r14
145487685:     	pushq	%r13
145487687:     	pushq	%r12
145487689:     	pushq	%rsi
14548768a:     	pushq	%rdi
14548768b:     	pushq	%rbx
14548768c:     	subq	$0x318, %rsp            # imm = 0x318
145487693:     	leaq	0x80(%rsp), %rbp
14548769b:     	movaps	%xmm14, 0x280(%rbp)
1454876a3:     	movaps	%xmm13, 0x270(%rbp)
1454876ab:     	movaps	%xmm12, 0x260(%rbp)
1454876b3:     	movaps	%xmm11, 0x250(%rbp)
1454876bb:     	movaps	%xmm10, 0x240(%rbp)
1454876c3:     	movaps	%xmm9, 0x230(%rbp)
1454876cb:     	movaps	%xmm8, 0x220(%rbp)
1454876d3:     	movaps	%xmm7, 0x210(%rbp)
1454876da:     	movaps	%xmm6, 0x200(%rbp)
1454876e1:     	movq	$-0x2, 0x1f8(%rbp)
1454876ec:     	movq	%r8, %r12
1454876ef:     	movq	%rcx, 0x8(%rbp)
1454876f3:     	movq	(%rdx), %rdi
1454876f6:     	movss	(%r8), %xmm6
1454876fb:     	movss	0x4(%r8), %xmm8
145487701:     	movss	0x44(%rdi), %xmm7
145487706:     	movss	0x10(%rdx), %xmm11
14548770c:     	movq	%rdx, 0x1b8(%rbp)
145487713:     	movss	0x38(%rdx), %xmm10
145487719:     	movzbl	0x75(%rdi), %eax
14548771d:     	addb	$-0x2, %al
14548771f:     	cmpb	$0x6, %al
145487721:     	ja	0x145487734 <.text+0x5486734>
145487723:     	movzbl	%al, %eax
145487726:     	leaq	0x156e1af(%rip), %rcx   # 0x1469f58dc
14548772d:     	movss	(%rcx,%rax,4), %xmm0
145487732:     	jmp	0x14548773c <.text+0x548673c>
145487734:     	movss	0x47fd54(%rip), %xmm0   # 0x145907490
14548773c:     	movq	0x1b8(%rbp), %rax
145487743:     	movss	0x4c(%rax), %xmm1
145487748:     	mulss	%xmm6, %xmm1
14548774c:     	xorps	%xmm2, %xmm2
14548774f:     	cmpltss	%xmm7, %xmm2
145487754:     	andps	%xmm1, %xmm2
145487757:     	mulss	0x490f91(%rip), %xmm7   # 0x1459186f0
14548775f:     	mulss	%xmm11, %xmm7
145487764:     	mulss	%xmm10, %xmm7
145487769:     	mulss	%xmm0, %xmm7
14548776d:     	addss	%xmm2, %xmm7
145487771:     	mulss	%xmm8, %xmm7
145487776:     	leaq	0x156d089(%rip), %rbx   # 0x1469f4806
14548777d:     	movl	$0x15, %r15d
145487783:     	movl	$0x15, %edx
145487788:     	movq	%rbx, %rcx
14548778b:     	callq	0x145457cb0 <.text+0x5456cb0>
145487790:     	movq	%rax, %r14
145487793:     	movq	%rdx, %rsi
145487796:     	leaq	0x1e0(%rbp), %r13
14548779d:     	movq	%r13, %rcx
1454877a0:     	movaps	%xmm7, %xmm1
1454877a3:     	callq	0x14548d390 <.text+0x548c390>
1454877a8:     	movzbl	0x74(%rdi), %ecx
1454877ac:     	callq	0x1454875e0 <.text+0x54865e0>
1454877b1:     	nop
1454877b2:     	testq	%r14, %r14
1454877b5:     	cmoveq	%r15, %rsi
1454877b9:     	cmovneq	%r14, %rbx
1454877bd:     	movq	%rax, 0x1c0(%rbp)
1454877c4:     	movq	%rdx, 0x1c8(%rbp)
1454877cb:     	leaq	0x156d049(%rip), %r14   # 0x1469f481b
1454877d2:     	movq	%r14, 0xb0(%rbp)
1454877d9:     	movq	$0x3, 0xb8(%rbp)
1454877e4:     	movq	%r13, 0xc0(%rbp)
1454877eb:     	leaq	0x1552ae6(%rip), %rax   # 0x1469da2d8
1454877f2:     	movq	%rax, 0xc8(%rbp)
1454877f9:     	leaq	0x156d01e(%rip), %rax   # 0x1469f481e
145487800:     	movq	%rax, 0xd0(%rbp)
145487807:     	movq	$0x6, 0xd8(%rbp)
145487812:     	leaq	0x1c0(%rbp), %rax
145487819:     	movq	%rax, 0xe0(%rbp)
145487820:     	leaq	0x1552b81(%rip), %rax   # 0x1469da3a8
145487827:     	movq	%rax, 0xe8(%rbp)
14548782e:     	movq	$0x2, 0x20(%rsp)
145487837:     	leaq	-0x40(%rbp), %r15
14548783b:     	leaq	0xb0(%rbp), %r9
145487842:     	movq	%r15, %rcx
145487845:     	movq	%rbx, %rdx
145487848:     	movq	%rsi, %r8
14548784b:     	callq	0x145458060 <.text+0x5457060>
145487850:     	nop
145487851:     	movq	0x1e0(%rbp), %rdx
145487858:     	testq	%rdx, %rdx
14548785b:     	je	0x14548786f <.text+0x548686f>
14548785d:     	movq	0x1e8(%rbp), %rcx
145487864:     	movl	$0x1, %r8d
14548786a:     	callq	0x1400021d0 <.text+0x11d0>
14548786f:     	movl	0x54(%rdi), %eax
145487872:     	testl	%eax, %eax
145487874:     	je	0x145487892 <.text+0x5486892>
145487876:     	movq	0x1b8(%rbp), %rcx
14548787d:     	addl	0x18(%rcx), %eax
145487880:     	addl	0x40(%rcx), %eax
145487883:     	movl	0x34(%r12), %ecx
145487888:     	leal	(%rax,%rcx), %edx
14548788b:     	cmpl	$0x1, %edx
14548788e:     	adcl	%ecx, %eax
145487890:     	jmp	0x145487897 <.text+0x5486897>
145487892:     	movl	$0x1, %eax
145487897:     	movl	%eax, 0x1dc(%rbp)
14548789d:     	movss	0x4c(%rdi), %xmm1
1454878a2:     	leaq	0x18(%rbp), %rcx
1454878a6:     	callq	0x14548d390 <.text+0x548c390>
1454878ab:     	nop
1454878ac:     	movq	0x1b8(%rbp), %rax
1454878b3:     	movss	0x1c(%rax), %xmm12
1454878b9:     	mulss	0x44(%rax), %xmm12
1454878bf:     	movss	0x50(%rdi), %xmm0
1454878c4:     	mulss	%xmm12, %xmm0
1454878c9:     	movss	0x28(%r12), %xmm9
1454878d0:     	mulss	%xmm9, %xmm0
1454878d5:     	movss	0x791b06(%rip), %xmm13  # 0x145c193e4
1454878de:     	ucomiss	%xmm0, %xmm13
1454878e2:     	jae	0x14548790c <.text+0x548690c>
1454878e4:     	addss	0x1552914(%rip), %xmm0  # 0x1469da200
1454878ec:     	movss	0x48df0b(%rip), %xmm14  # 0x145915800
1454878f5:     	divss	%xmm14, %xmm0
1454878fa:     	callq	0x145773367 <.text+0x5772367>
1454878ff:     	mulss	%xmm14, %xmm0
145487904:     	addss	0x791ad8(%rip), %xmm0   # 0x145c193e4
14548790c:     	leaq	-0x58(%rbp), %r13
145487910:     	movq	%r13, %rcx
145487913:     	movaps	%xmm0, %xmm1
145487916:     	callq	0x14548d390 <.text+0x548c390>
14548791b:     	nop
14548791c:     	leaq	0x156cf01(%rip), %rsi   # 0x1469f4824
145487923:     	movl	$0x26, %ebx
145487928:     	movl	$0x26, %edx
14548792d:     	movq	%rsi, %rcx
145487930:     	callq	0x145457cb0 <.text+0x5456cb0>
145487935:     	nop
145487936:     	testq	%rax, %rax
145487939:     	cmovneq	%rax, %rsi
14548793d:     	cmoveq	%rbx, %rdx
145487941:     	movq	%rsi, 0x38(%rbp)
145487945:     	movq	%rdx, 0x40(%rbp)
145487949:     	movzbl	0x75(%rdi), %eax
14548794d:     	leaq	0x156e138(%rip), %rcx   # 0x1469f5a8c
145487954:     	movslq	(%rcx,%rax,4), %rax
145487958:     	addq	%rcx, %rax
14548795b:     	jmpq	*%rax
14548795d:     	movl	$0x1, %ebx
145487962:     	cmpq	$0xa, 0x8(%rdi)
145487967:     	jne	0x14548798c <.text+0x548698c>
145487969:     	movq	(%rdi), %rax
14548796c:     	movabsq	$0x68735f64656d6961, %rcx # imm = 0x68735F64656D6961
145487976:     	xorq	(%rax), %rcx
145487979:     	movzwl	0x8(%rax), %eax
14548797d:     	xorq	$0x746f, %rax           # imm = 0x746F
145487983:     	orq	%rcx, %rax
145487986:     	je	0x145488fa5 <.text+0x5487fa5>
14548798c:     	xorl	%edx, %edx
14548798e:     	movq	%rbx, 0x1c0(%rbp)
145487995:     	movq	%rdx, 0x1c8(%rbp)
14548799c:     	cmpl	$0x1, 0x1dc(%rbp)
1454879a3:     	jbe	0x145488fe5 <.text+0x5487fe5>
1454879a9:     	leaq	0x156cf22(%rip), %r12   # 0x1469f48d2
1454879b0:     	movl	$0x40, %edx
1454879b5:     	movq	%r12, %rcx
1454879b8:     	callq	0x145457cb0 <.text+0x5456cb0>
1454879bd:     	nop
1454879be:     	movq	%rax, %rsi
1454879c1:     	movq	%rdx, %rbx
1454879c4:     	movl	0x1dc(%rbp), %edx
1454879ca:     	leaq	0x1e0(%rbp), %r14
1454879d1:     	movq	%r14, %rcx
1454879d4:     	xorl	%r8d, %r8d
1454879d7:     	callq	0x1454952c0 <.text+0x54942c0>
1454879dc:     	nop
1454879dd:     	testq	%rsi, %rsi
1454879e0:     	movl	$0x40, %eax
1454879e5:     	cmoveq	%rax, %rbx
1454879e9:     	cmovneq	%rsi, %r12
1454879ed:     	leaq	0x156cec6(%rip), %rax   # 0x1469f48ba
1454879f4:     	movq	%rax, 0xb0(%rbp)
1454879fb:     	movq	$0x7, 0xb8(%rbp)
145487a06:     	movq	%r14, 0xc0(%rbp)
145487a0d:     	leaq	0x15528c4(%rip), %rcx   # 0x1469da2d8
145487a14:     	movq	%rcx, 0xc8(%rbp)
145487a1b:     	leaq	0x156ce9f(%rip), %rax   # 0x1469f48c1
145487a22:     	movq	%rax, 0xd0(%rbp)
145487a29:     	movq	$0x5, 0xd8(%rbp)
145487a34:     	leaq	0x18(%rbp), %rax
145487a38:     	movq	%rax, 0xe0(%rbp)
145487a3f:     	movq	%rcx, 0xe8(%rbp)
145487a46:     	leaq	0x156ce79(%rip), %rax   # 0x1469f48c6
145487a4d:     	movq	%rax, 0xf0(%rbp)
145487a54:     	movq	$0x3, 0xf8(%rbp)
145487a5f:     	movq	%r15, 0x100(%rbp)
145487a66:     	movq	%rcx, 0x108(%rbp)
145487a6d:     	leaq	0x156ce55(%rip), %rax   # 0x1469f48c9
145487a74:     	movq	%rax, 0x110(%rbp)
145487a7b:     	movq	$0x5, 0x118(%rbp)
145487a86:     	leaq	0x38(%rbp), %rax
145487a8a:     	movq	%rax, 0x120(%rbp)
145487a91:     	leaq	0x1552910(%rip), %rcx   # 0x1469da3a8
145487a98:     	movq	%rcx, 0x128(%rbp)
145487a9f:     	leaq	0x156ce28(%rip), %rax   # 0x1469f48ce
145487aa6:     	movq	%rax, 0x130(%rbp)
145487aad:     	movq	$0x4, 0x138(%rbp)
145487ab8:     	leaq	0x1c0(%rbp), %rax
145487abf:     	movq	%rax, 0x140(%rbp)
145487ac6:     	movq	%rcx, 0x148(%rbp)
145487acd:     	movq	$0x5, 0x20(%rsp)
145487ad6:     	leaq	0x90(%rbp), %rcx
145487add:     	leaq	0xb0(%rbp), %r9
145487ae4:     	movq	%r12, %rdx
145487ae7:     	movq	%rbx, %r8
145487aea:     	callq	0x145458060 <.text+0x5457060>
145487aef:     	nop
145487af0:     	jmp	0x14548912c <.text+0x548812c>
145487af5:     	leaq	0x90(%rbp), %rcx
145487afc:     	movq	0x1b8(%rbp), %rdx
145487b03:     	movq	%r12, %r8
145487b06:     	callq	0x1454e9d90 <.text+0x54e8d90>
145487b0b:     	nop
145487b0c:     	jmp	0x1454898d6 <.text+0x54888d6>
145487b11:     	leaq	0x156d093(%rip), %rbx   # 0x1469f4bab
145487b18:     	movl	$0x90, %esi
145487b1d:     	movl	$0x90, %edx
145487b22:     	movq	%rbx, %rcx
145487b25:     	callq	0x145457cb0 <.text+0x5456cb0>
145487b2a:     	nop
145487b2b:     	movq	%rdx, %r8
145487b2e:     	testq	%rax, %rax
145487b31:     	cmovneq	%rax, %rbx
145487b35:     	cmoveq	%rsi, %r8
145487b39:     	movl	0x1dc(%rbp), %eax
145487b3f:     	decl	%eax
145487b41:     	movl	%eax, 0x1c0(%rbp)
145487b47:     	leaq	0x156cd73(%rip), %rax   # 0x1469f48c1
145487b4e:     	movq	%rax, 0xb0(%rbp)
145487b55:     	movq	$0x5, 0xb8(%rbp)
145487b60:     	leaq	0x18(%rbp), %rax
145487b64:     	movq	%rax, 0xc0(%rbp)
145487b6b:     	leaq	0x1552766(%rip), %rcx   # 0x1469da2d8
145487b72:     	movq	%rcx, 0xc8(%rbp)
145487b79:     	leaq	0x156cd46(%rip), %rax   # 0x1469f48c6
145487b80:     	movq	%rax, 0xd0(%rbp)
145487b87:     	movq	$0x3, 0xd8(%rbp)
145487b92:     	movq	%r15, 0xe0(%rbp)
145487b99:     	movq	%rcx, 0xe8(%rbp)
145487ba0:     	leaq	0x1552751(%rip), %rax   # 0x1469da2f8
145487ba7:     	movq	%rax, 0xf0(%rbp)
145487bae:     	movq	$0x1, 0xf8(%rbp)
145487bb9:     	leaq	0x1c0(%rbp), %rax
145487bc0:     	movq	%rax, 0x100(%rbp)
145487bc7:     	leaq	0x156cbf2(%rip), %rax   # 0x1469f47c0
145487bce:     	movq	%rax, 0x108(%rbp)
145487bd5:     	leaq	0x156cec3(%rip), %rax   # 0x1469f4a9f
145487bdc:     	movq	%rax, 0x110(%rbp)
145487be3:     	movq	$0x1, 0x118(%rbp)
145487bee:     	movq	%r13, 0x120(%rbp)
145487bf5:     	movq	%rcx, 0x128(%rbp)
145487bfc:     	movq	$0x4, 0x20(%rsp)
145487c05:     	leaq	0x1e0(%rbp), %rcx
145487c0c:     	leaq	0xb0(%rbp), %r9
145487c13:     	movq	%rbx, %rdx
145487c16:     	callq	0x145458060 <.text+0x5457060>
145487c1b:     	nop
145487c1c:     	movq	0x38(%rbp), %r14
145487c20:     	movq	0x40(%rbp), %rbx
145487c24:     	movq	0x1e0(%rbp), %rax
145487c2b:     	movq	0x1f0(%rbp), %rsi
145487c32:     	subq	%rsi, %rax
145487c35:     	cmpq	%rax, %rbx
145487c38:     	ja	0x14548a6ec <.text+0x54896ec>
145487c3e:     	testq	%rbx, %rbx
145487c41:     	je	0x145487c58 <.text+0x5486c58>
145487c43:     	movq	0x1e8(%rbp), %rcx
145487c4a:     	addq	%rsi, %rcx
145487c4d:     	movq	%r14, %rdx
145487c50:     	movq	%rbx, %r8
145487c53:     	callq	0x1457731ed <.text+0x57721ed>
145487c58:     	addq	%rbx, %rsi
145487c5b:     	movups	0x1e0(%rbp), %xmm0
145487c62:     	movaps	%xmm0, 0x90(%rbp)
145487c69:     	movq	%rsi, 0xa0(%rbp)
145487c70:     	jmp	0x1454898d6 <.text+0x54888d6>
145487c75:     	movss	0x58(%rdi), %xmm1
145487c7a:     	mulss	0x490a6e(%rip), %xmm1   # 0x1459186f0
145487c82:     	movq	0x1b8(%rbp), %rax
145487c89:     	mulss	0x20(%rax), %xmm1
145487c8e:     	mulss	0x48(%rax), %xmm1
145487c93:     	leaq	0x60(%rbp), %r14
145487c97:     	movq	%r14, %rcx
145487c9a:     	callq	0x14548d390 <.text+0x548c390>
145487c9f:     	nop
145487ca0:     	leaq	0x156d87f(%rip), %rsi   # 0x1469f5526
145487ca7:     	movl	$0x24, %ebx
145487cac:     	movl	$0x24, %edx
145487cb1:     	movq	%rsi, %rcx
145487cb4:     	callq	0x145457cb0 <.text+0x5456cb0>
145487cb9:     	nop
145487cba:     	testq	%rax, %rax
145487cbd:     	cmovneq	%rax, %rsi
145487cc1:     	cmoveq	%rbx, %rdx
145487cc5:     	movq	%rsi, 0x48(%rbp)
145487cc9:     	movq	%rdx, 0x50(%rbp)
145487ccd:     	movl	0x68(%rdi), %eax
145487cd0:     	leal	-0x1(%rax), %ecx
145487cd3:     	cmpl	$0x9, %ecx
145487cd6:     	ja	0x145489184 <.text+0x5488184>
145487cdc:     	movq	0x1b8(%rbp), %rdx
145487ce3:     	movss	0x50(%rdx), %xmm7
145487ce8:     	leaq	0x156ddcd(%rip), %rdx   # 0x1469f5abc
145487cef:     	movslq	(%rdx,%rcx,4), %rcx
145487cf3:     	addq	%rdx, %rcx
145487cf6:     	jmpq	*%rcx
145487cf8:     	leaq	0x156da50(%rip), %rsi   # 0x1469f574f
145487cff:     	movl	$0x10, %ebx
145487d04:     	movl	$0x10, %edx
145487d09:     	movq	%rsi, %rcx
145487d0c:     	callq	0x145457cb0 <.text+0x5456cb0>
145487d11:     	nop
145487d12:     	movq	%rdx, %r8
145487d15:     	testq	%rax, %rax
145487d18:     	cmovneq	%rax, %rsi
145487d1c:     	cmoveq	%rbx, %r8
145487d20:     	leaq	0x156ce7c(%rip), %rax   # 0x1469f4ba3
145487d27:     	movq	%rax, 0xb0(%rbp)
145487d2e:     	movq	$0x3, 0xb8(%rbp)
145487d39:     	movq	%r14, 0xc0(%rbp)
145487d40:     	leaq	0x1552591(%rip), %rax   # 0x1469da2d8
145487d47:     	movq	%rax, 0xc8(%rbp)
145487d4e:     	movq	$0x1, 0x20(%rsp)
145487d57:     	leaq	0x90(%rbp), %rcx
145487d5e:     	leaq	0xb0(%rbp), %r9
145487d65:     	movq	%rsi, %rdx
145487d68:     	callq	0x145458060 <.text+0x5457060>
145487d6d:     	nop
145487d6e:     	jmp	0x145488f0c <.text+0x5487f0c>
145487d73:     	leaq	0x156ccf5(%rip), %rsi   # 0x1469f4a6f
145487d7a:     	movl	$0x30, %ebx
145487d7f:     	movl	$0x30, %edx
145487d84:     	movq	%rsi, %rcx
145487d87:     	callq	0x145457cb0 <.text+0x5456cb0>
145487d8c:     	nop
145487d8d:     	movq	%rdx, %r8
145487d90:     	testq	%rax, %rax
145487d93:     	cmovneq	%rax, %rsi
145487d97:     	cmoveq	%rbx, %r8
145487d9b:     	leaq	0x156ccfd(%rip), %rax   # 0x1469f4a9f
145487da2:     	movq	%rax, 0xb0(%rbp)
145487da9:     	movq	$0x1, 0xb8(%rbp)
145487db4:     	movq	%r13, 0xc0(%rbp)
145487dbb:     	leaq	0x1552516(%rip), %rcx   # 0x1469da2d8
145487dc2:     	movq	%rcx, 0xc8(%rbp)
145487dc9:     	leaq	0x156caf6(%rip), %rax   # 0x1469f48c6
145487dd0:     	movq	%rax, 0xd0(%rbp)
145487dd7:     	movq	$0x3, 0xd8(%rbp)
145487de2:     	movq	%r15, 0xe0(%rbp)
145487de9:     	movq	%rcx, 0xe8(%rbp)
145487df0:     	movq	$0x2, 0x20(%rsp)
145487df9:     	leaq	0x90(%rbp), %rcx
145487e00:     	leaq	0xb0(%rbp), %r9
145487e07:     	movq	%rsi, %rdx
145487e0a:     	callq	0x145458060 <.text+0x5457060>
145487e0f:     	nop
145487e10:     	jmp	0x1454898d6 <.text+0x54888d6>
145487e15:     	movss	0x58(%rdi), %xmm1
145487e1a:     	movss	0x4908cd(%rip), %xmm8   # 0x1459186f0
145487e23:     	mulss	%xmm1, %xmm8
145487e28:     	movq	0x1b8(%rbp), %rax
145487e2f:     	mulss	0x20(%rax), %xmm8
145487e35:     	mulss	0x48(%rax), %xmm8
145487e3b:     	movl	0x5c(%rdi), %eax
145487e3e:     	cmpl	$0x1, %eax
145487e41:     	adcl	$0x0, %eax
145487e44:     	cvtsi2ss	%rax, %xmm10
145487e49:     	movaps	%xmm8, %xmm0
145487e4d:     	mulss	%xmm10, %xmm0
145487e52:     	maxss	0x4c67b6(%rip), %xmm1   # 0x14594e610
145487e5a:     	divss	%xmm1, %xmm0
145487e5e:     	callq	0x14577322f <.text+0x577222f>
145487e63:     	movaps	%xmm0, %xmm9
145487e67:     	xorps	%xmm0, %xmm0
145487e6a:     	ucomiss	0x4c(%rdi), %xmm0
145487e6e:     	jae	0x14548870e <.text+0x548770e>
145487e74:     	leaq	0x156cc25(%rip), %rsi   # 0x1469f4aa0
145487e7b:     	movl	$0x38, %ebx
145487e80:     	movl	$0x38, %edx
145487e85:     	movq	%rsi, %rcx
145487e88:     	callq	0x145457cb0 <.text+0x5456cb0>
145487e8d:     	nop
145487e8e:     	movq	%rdx, %r8
145487e91:     	testq	%rax, %rax
145487e94:     	cmovneq	%rax, %rsi
145487e98:     	cmoveq	%rbx, %r8
145487e9c:     	leaq	0x156ca1e(%rip), %rax   # 0x1469f48c1
145487ea3:     	movq	%rax, 0xb0(%rbp)
145487eaa:     	movq	$0x5, 0xb8(%rbp)
145487eb5:     	leaq	0x18(%rbp), %rax
145487eb9:     	movq	%rax, 0xc0(%rbp)
145487ec0:     	leaq	0x1552411(%rip), %rax   # 0x1469da2d8
145487ec7:     	movq	%rax, 0xc8(%rbp)
145487ece:     	movq	$0x1, 0x20(%rsp)
145487ed7:     	leaq	0x48(%rbp), %rcx
145487edb:     	leaq	0xb0(%rbp), %r9
145487ee2:     	movq	%rsi, %rdx
145487ee5:     	callq	0x145458060 <.text+0x5457060>
145487eea:     	nop
145487eeb:     	jmp	0x145488781 <.text+0x5487781>
145487ef0:     	leaq	0x156cf0b(%rip), %r12   # 0x1469f4e02
145487ef7:     	movl	$0xb0, %esi
145487efc:     	movl	$0xb0, %edx
145487f01:     	movq	%r12, %rcx
145487f04:     	callq	0x145457cb0 <.text+0x5456cb0>
145487f09:     	nop
145487f0a:     	movq	%rdx, %r13
145487f0d:     	testq	%rax, %rax
145487f10:     	cmovneq	%rax, %r12
145487f14:     	cmoveq	%rsi, %r13
145487f18:     	cmpl	$0x1, 0x1dc(%rbp)
145487f1f:     	jne	0x145488bd9 <.text+0x5487bd9>
145487f25:     	leaq	0x156cf86(%rip), %rsi   # 0x1469f4eb2
145487f2c:     	movl	$0x8, %edx
145487f31:     	movq	%rsi, %rcx
145487f34:     	callq	0x145457cb0 <.text+0x5456cb0>
145487f39:     	nop
145487f3a:     	movq	%rdx, %rbx
145487f3d:     	testq	%rax, %rax
145487f40:     	cmovneq	%rax, %rsi
145487f44:     	movl	$0x8, %eax
145487f49:     	cmoveq	%rax, %rbx
145487f4d:     	testq	%rbx, %rbx
145487f50:     	jns	0x145488f66 <.text+0x5487f66>
145487f56:     	xorl	%ecx, %ecx
145487f58:     	movq	%rbx, %rdx
145487f5b:     	callq	0x14590379b <.text+0x590279b>
145487f60:     	nop
145487f61:     	jmp	0x14548a76a <.text+0x548976a>
145487f66:     	cmpl	$0x1, 0x1dc(%rbp)
145487f6d:     	jne	0x1454889c3 <.text+0x54879c3>
145487f73:     	leaq	0x156c998(%rip), %rsi   # 0x1469f4912
145487f7a:     	movl	$0x33, %ebx
145487f7f:     	movl	$0x33, %edx
145487f84:     	movq	%rsi, %rcx
145487f87:     	callq	0x145457cb0 <.text+0x5456cb0>
145487f8c:     	nop
145487f8d:     	movq	%rdx, %r8
145487f90:     	testq	%rax, %rax
145487f93:     	cmovneq	%rax, %rsi
145487f97:     	cmoveq	%rbx, %r8
145487f9b:     	leaq	0x156c91f(%rip), %rax   # 0x1469f48c1
145487fa2:     	movq	%rax, 0xb0(%rbp)
145487fa9:     	movq	$0x5, 0xb8(%rbp)
145487fb4:     	leaq	0x18(%rbp), %rax
145487fb8:     	movq	%rax, 0xc0(%rbp)
145487fbf:     	leaq	0x1552312(%rip), %rcx   # 0x1469da2d8
145487fc6:     	movq	%rcx, 0xc8(%rbp)
145487fcd:     	leaq	0x156c8f2(%rip), %rax   # 0x1469f48c6
145487fd4:     	movq	%rax, 0xd0(%rbp)
145487fdb:     	movq	$0x3, 0xd8(%rbp)
145487fe6:     	movq	%r15, 0xe0(%rbp)
145487fed:     	movq	%rcx, 0xe8(%rbp)
145487ff4:     	movq	$0x2, 0x20(%rsp)
145487ffd:     	leaq	0x90(%rbp), %rcx
145488004:     	leaq	0xb0(%rbp), %r9
14548800b:     	movq	%rsi, %rdx
14548800e:     	callq	0x145458060 <.text+0x5457060>
145488013:     	nop
145488014:     	jmp	0x1454898d6 <.text+0x54888d6>
145488019:     	cmpl	$0x1, 0x1dc(%rbp)
145488020:     	jne	0x145488acc <.text+0x5487acc>
145488026:     	leaq	0x156cc0e(%rip), %rsi   # 0x1469f4c3b
14548802d:     	movl	$0x3d, %ebx
145488032:     	movl	$0x3d, %edx
145488037:     	movq	%rsi, %rcx
14548803a:     	callq	0x145457cb0 <.text+0x5456cb0>
14548803f:     	nop
145488040:     	movq	%rdx, %r8
145488043:     	testq	%rax, %rax
145488046:     	cmovneq	%rax, %rsi
14548804a:     	cmoveq	%rbx, %r8
14548804e:     	leaq	0x156c86c(%rip), %rax   # 0x1469f48c1
145488055:     	movq	%rax, 0xb0(%rbp)
14548805c:     	movq	$0x5, 0xb8(%rbp)
145488067:     	leaq	0x18(%rbp), %rax
14548806b:     	movq	%rax, 0xc0(%rbp)
145488072:     	leaq	0x155225f(%rip), %rcx   # 0x1469da2d8
145488079:     	movq	%rcx, 0xc8(%rbp)
145488080:     	leaq	0x156c83f(%rip), %rax   # 0x1469f48c6
145488087:     	movq	%rax, 0xd0(%rbp)
14548808e:     	movq	$0x3, 0xd8(%rbp)
145488099:     	movq	%r15, 0xe0(%rbp)
1454880a0:     	movq	%rcx, 0xe8(%rbp)
1454880a7:     	leaq	0x156c81b(%rip), %rax   # 0x1469f48c9
1454880ae:     	movq	%rax, 0xf0(%rbp)
1454880b5:     	movq	$0x5, 0xf8(%rbp)
1454880c0:     	leaq	0x38(%rbp), %rax
1454880c4:     	movq	%rax, 0x100(%rbp)
1454880cb:     	leaq	0x15522d6(%rip), %rax   # 0x1469da3a8
1454880d2:     	movq	%rax, 0x108(%rbp)
1454880d9:     	movq	$0x3, 0x20(%rsp)
1454880e2:     	leaq	0x90(%rbp), %rcx
1454880e9:     	leaq	0xb0(%rbp), %r9
1454880f0:     	movq	%rsi, %rdx
1454880f3:     	callq	0x145458060 <.text+0x5457060>
1454880f8:     	nop
1454880f9:     	jmp	0x1454898d6 <.text+0x54888d6>
1454880fe:     	movss	0x58(%rdi), %xmm12
145488104:     	movss	0x4905e3(%rip), %xmm13  # 0x1459186f0
14548810d:     	mulss	%xmm12, %xmm13
145488112:     	movq	0x1b8(%rbp), %rax
145488119:     	mulss	0x20(%rax), %xmm13
14548811f:     	mulss	0x48(%rax), %xmm13
145488125:     	movss	0x4c64e2(%rip), %xmm14  # 0x14594e610
14548812e:     	movl	0x5c(%rdi), %eax
145488131:     	cmpl	$0x1, %eax
145488134:     	adcl	$0x0, %eax
145488137:     	movss	0x47f350(%rip), %xmm10  # 0x145907490
145488140:     	xorps	%xmm0, %xmm0
145488143:     	cvtsi2ss	%rax, %xmm0
145488148:     	movss	0x48(%r12), %xmm9
14548814f:     	addss	%xmm10, %xmm9
145488154:     	movaps	%xmm12, %xmm11
145488158:     	divss	%xmm0, %xmm11
14548815d:     	movaps	%xmm11, %xmm1
145488161:     	maxss	%xmm14, %xmm1
145488166:     	movaps	%xmm13, %xmm0
14548816a:     	divss	%xmm1, %xmm0
14548816e:     	callq	0x14577322f <.text+0x577222f>
145488173:     	movaps	%xmm0, %xmm8
145488177:     	maxss	%xmm10, %xmm8
14548817c:     	movaps	%xmm9, %xmm0
145488180:     	mulss	%xmm8, %xmm0
145488185:     	callq	0x14577322f <.text+0x577222f>
14548818a:     	movaps	%xmm0, %xmm10
14548818e:     	cvttss2si	%xmm0, %rax
145488193:     	xorl	%ecx, %ecx
145488195:     	xorps	%xmm0, %xmm0
145488198:     	ucomiss	%xmm0, %xmm10
14548819c:     	cmovael	%eax, %ecx
14548819f:     	ucomiss	0x47f385(%rip), %xmm10  # 0x14590752c
1454881a7:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1454881ac:     	cmovbel	%ecx, %eax
1454881af:     	movl	0x44(%r12), %ecx
1454881b4:     	cmpl	$0x3, %ecx
1454881b7:     	movl	$0x3, %edx
1454881bc:     	cmovbl	%ecx, %edx
1454881bf:     	movl	%eax, 0x34(%rbp)
1454881c2:     	incl	%edx
1454881c4:     	movq	%rdx, -0x28(%rbp)
1454881c8:     	testl	%ecx, %ecx
1454881ca:     	je	0x145488f22 <.text+0x5487f22>
1454881d0:     	leaq	0x156cb02(%rip), %rsi   # 0x1469f4cd9
1454881d7:     	movl	$0x80, %ebx
1454881dc:     	movl	$0x80, %edx
1454881e1:     	movq	%rsi, %rcx
1454881e4:     	callq	0x145457cb0 <.text+0x5456cb0>
1454881e9:     	nop
1454881ea:     	movq	%rdx, %r8
1454881ed:     	testq	%rax, %rax
1454881f0:     	cmovneq	%rax, %rsi
1454881f4:     	cmoveq	%rbx, %r8
1454881f8:     	leaq	0x156cb81(%rip), %rax   # 0x1469f4d80
1454881ff:     	movq	%rax, 0xb0(%rbp)
145488206:     	movq	$0x3, 0xb8(%rbp)
145488211:     	leaq	-0x28(%rbp), %rax
145488215:     	movq	%rax, 0xc0(%rbp)
14548821c:     	leaq	0x156cb3d(%rip), %rax   # 0x1469f4d60
145488223:     	movq	%rax, 0xc8(%rbp)
14548822a:     	movq	$0x1, 0x20(%rsp)
145488233:     	leaq	-0x20(%rbp), %rcx
145488237:     	leaq	0xb0(%rbp), %r9
14548823e:     	movq	%rsi, %rdx
145488241:     	callq	0x145458060 <.text+0x5457060>
145488246:     	nop
145488247:     	movl	$0x1, %r13d
14548824d:     	xorl	%r12d, %r12d
145488250:     	movq	%r12, 0x48(%rbp)
145488254:     	movq	%r13, 0x50(%rbp)
145488258:     	movq	%r12, 0x58(%rbp)
14548825c:     	movq	-0x10(%rbp), %rax
145488260:     	movq	%rax, 0x70(%rbp)
145488264:     	movq	-0x20(%rbp), %rax
145488268:     	movq	%rax, 0x60(%rbp)
14548826c:     	movq	-0x18(%rbp), %rax
145488270:     	movq	%rax, 0x68(%rbp)
145488274:     	leaq	0x156cb08(%rip), %r15   # 0x1469f4d83
14548827b:     	movl	$0x6d, %esi
145488280:     	movl	$0x6d, %edx
145488285:     	movq	%r15, %rcx
145488288:     	callq	0x145457cb0 <.text+0x5456cb0>
14548828d:     	nop
14548828e:     	movq	%rdx, %r12
145488291:     	testq	%rax, %rax
145488294:     	cmovneq	%rax, %r15
145488298:     	cmoveq	%rsi, %r12
14548829c:     	movl	0x1dc(%rbp), %edx
1454882a2:     	leaq	0x78(%rbp), %r13
1454882a6:     	movq	%r13, %rcx
1454882a9:     	movb	$0x1, %r8b
1454882ac:     	callq	0x1454952c0 <.text+0x54942c0>
1454882b1:     	nop
1454882b2:     	mulss	%xmm13, %xmm7
1454882b7:     	maxss	%xmm14, %xmm12
1454882bc:     	divss	%xmm12, %xmm7
1454882c1:     	mulss	%xmm7, %xmm9
1454882c6:     	leaq	0x1c0(%rbp), %rbx
1454882cd:     	movq	%rbx, %rcx
1454882d0:     	movaps	%xmm9, %xmm1
1454882d4:     	callq	0x14548d390 <.text+0x548c390>
1454882d9:     	nop
1454882da:     	movzbl	0x74(%rdi), %ecx
1454882de:     	callq	0x1454875e0 <.text+0x54865e0>
1454882e3:     	nop
1454882e4:     	mulss	%xmm8, %xmm11
1454882e9:     	divss	%xmm10, %xmm11
1454882ee:     	movq	%rax, -0x8(%rbp)
1454882f2:     	movq	%rdx, (%rbp)
1454882f6:     	movl	0x34(%rbp), %eax
1454882f9:     	xorps	%xmm1, %xmm1
1454882fc:     	cvtsi2ss	%rax, %xmm1
145488301:     	mulss	%xmm11, %xmm1
145488306:     	leaq	0x1e0(%rbp), %rsi
14548830d:     	movq	%rsi, %rcx
145488310:     	callq	0x14548d390 <.text+0x548c390>
145488315:     	nop
145488316:     	leaq	0x156c59d(%rip), %rax   # 0x1469f48ba
14548831d:     	movq	%rax, 0xb0(%rbp)
145488324:     	movq	$0x7, 0xb8(%rbp)
14548832f:     	movq	%r13, 0xc0(%rbp)
145488336:     	leaq	0x1551f9b(%rip), %rcx   # 0x1469da2d8
14548833d:     	movq	%rcx, 0xc8(%rbp)
145488344:     	leaq	0x156c576(%rip), %rax   # 0x1469f48c1
14548834b:     	movq	%rax, 0xd0(%rbp)
145488352:     	movq	$0x5, 0xd8(%rbp)
14548835d:     	leaq	0x18(%rbp), %rax
145488361:     	movq	%rax, 0xe0(%rbp)
145488368:     	movq	%rcx, 0xe8(%rbp)
14548836f:     	leaq	0x156ca7a(%rip), %rax   # 0x1469f4df0
145488376:     	movq	%rax, 0xf0(%rbp)
14548837d:     	movq	$0x4, 0xf8(%rbp)
145488388:     	leaq	0x48(%rbp), %rax
14548838c:     	movq	%rax, 0x100(%rbp)
145488393:     	movq	%rcx, 0x108(%rbp)
14548839a:     	leaq	0x156c805(%rip), %rax   # 0x1469f4ba6
1454883a1:     	movq	%rax, 0x110(%rbp)
1454883a8:     	movq	$0x5, 0x118(%rbp)
1454883b3:     	movq	%rbx, 0x120(%rbp)
1454883ba:     	movq	%rcx, 0x128(%rbp)
1454883c1:     	leaq	0x156c456(%rip), %rax   # 0x1469f481e
1454883c8:     	movq	%rax, 0x130(%rbp)
1454883cf:     	movq	$0x6, 0x138(%rbp)
1454883da:     	leaq	-0x8(%rbp), %rax
1454883de:     	movq	%rax, 0x140(%rbp)
1454883e5:     	leaq	0x1551fbc(%rip), %rax   # 0x1469da3a8
1454883ec:     	movq	%rax, 0x148(%rbp)
1454883f3:     	leaq	0x156c9fa(%rip), %rax   # 0x1469f4df4
1454883fa:     	movq	%rax, 0x150(%rbp)
145488401:     	movq	$0x4, 0x158(%rbp)
14548840c:     	movq	%rsi, 0x160(%rbp)
145488413:     	movq	%rcx, 0x168(%rbp)
14548841a:     	leaq	0x156c9d7(%rip), %rax   # 0x1469f4df8
145488421:     	movq	%rax, 0x170(%rbp)
145488428:     	movq	$0x5, 0x178(%rbp)
145488433:     	leaq	0x34(%rbp), %rax
145488437:     	movq	%rax, 0x180(%rbp)
14548843e:     	leaq	0x156c37b(%rip), %rax   # 0x1469f47c0
145488445:     	movq	%rax, 0x188(%rbp)
14548844c:     	leaq	0x156c9aa(%rip), %rax   # 0x1469f4dfd
145488453:     	movq	%rax, 0x190(%rbp)
14548845a:     	movq	$0x5, 0x198(%rbp)
145488465:     	leaq	0x60(%rbp), %rax
145488469:     	movq	%rax, 0x1a0(%rbp)
145488470:     	movq	%rcx, 0x1a8(%rbp)
145488477:     	movq	$0x8, 0x20(%rsp)
145488480:     	leaq	0x90(%rbp), %rcx
145488487:     	leaq	0xb0(%rbp), %r9
14548848e:     	movq	%r15, %rdx
145488491:     	movq	%r12, %r8
145488494:     	callq	0x145458060 <.text+0x5457060>
145488499:     	nop
14548849a:     	movq	0x60(%rbp), %rdx
14548849e:     	testq	%rdx, %rdx
1454884a1:     	je	0x1454884b2 <.text+0x54874b2>
1454884a3:     	movq	0x68(%rbp), %rcx
1454884a7:     	movl	$0x1, %r8d
1454884ad:     	callq	0x1400021d0 <.text+0x11d0>
1454884b2:     	movq	0x48(%rbp), %rdx
1454884b6:     	testq	%rdx, %rdx
1454884b9:     	je	0x1454884ca <.text+0x54874ca>
1454884bb:     	movq	0x50(%rbp), %rcx
1454884bf:     	movl	$0x1, %r8d
1454884c5:     	callq	0x1400021d0 <.text+0x11d0>
1454884ca:     	movq	0x1e0(%rbp), %rdx
1454884d1:     	testq	%rdx, %rdx
1454884d4:     	je	0x1454884e8 <.text+0x54874e8>
1454884d6:     	movq	0x1e8(%rbp), %rcx
1454884dd:     	movl	$0x1, %r8d
1454884e3:     	callq	0x1400021d0 <.text+0x11d0>
1454884e8:     	movq	0x1c0(%rbp), %rdx
1454884ef:     	testq	%rdx, %rdx
1454884f2:     	je	0x145488506 <.text+0x5487506>
1454884f4:     	movq	0x1c8(%rbp), %rcx
1454884fb:     	movl	$0x1, %r8d
145488501:     	callq	0x1400021d0 <.text+0x11d0>
145488506:     	movq	0x78(%rbp), %rdx
14548850a:     	testq	%rdx, %rdx
14548850d:     	je	0x1454898d6 <.text+0x54888d6>
145488513:     	movq	0x80(%rbp), %rcx
14548851a:     	jmp	0x1454898cb <.text+0x54888cb>
14548851f:     	movss	0x58(%rdi), %xmm1
145488524:     	movss	0x4901c4(%rip), %xmm7   # 0x1459186f0
14548852c:     	mulss	%xmm1, %xmm7
145488530:     	movq	0x1b8(%rbp), %rax
145488537:     	mulss	0x20(%rax), %xmm7
14548853c:     	mulss	0x48(%rax), %xmm7
145488541:     	movl	0x5c(%rdi), %eax
145488544:     	cmpl	$0x1, %eax
145488547:     	adcl	$0x0, %eax
14548854a:     	xorps	%xmm0, %xmm0
14548854d:     	cvtsi2ss	%rax, %xmm0
145488552:     	divss	%xmm0, %xmm1
145488556:     	leaq	0x60(%rbp), %r12
14548855a:     	movq	%r12, %rcx
14548855d:     	callq	0x14548d390 <.text+0x548c390>
145488562:     	nop
145488563:     	movss	0x50(%rdi), %xmm0
145488568:     	xorps	%xmm1, %xmm1
14548856b:     	ucomiss	%xmm1, %xmm0
14548856e:     	jbe	0x145488c5b <.text+0x5487c5b>
145488574:     	leaq	0x156c9c6(%rip), %rsi   # 0x1469f4f41
14548857b:     	movl	$0x2e, %ebx
145488580:     	movl	$0x2e, %edx
145488585:     	movq	%rsi, %rcx
145488588:     	callq	0x145457cb0 <.text+0x5456cb0>
14548858d:     	nop
14548858e:     	movq	%rdx, %r8
145488591:     	testq	%rax, %rax
145488594:     	cmovneq	%rax, %rsi
145488598:     	cmoveq	%rbx, %r8
14548859c:     	leaq	0x156c323(%rip), %rax   # 0x1469f48c6
1454885a3:     	movq	%rax, 0xb0(%rbp)
1454885aa:     	movq	$0x3, 0xb8(%rbp)
1454885b5:     	movq	%r15, 0xc0(%rbp)
1454885bc:     	leaq	0x1551d15(%rip), %rcx   # 0x1469da2d8
1454885c3:     	movq	%rcx, 0xc8(%rbp)
1454885ca:     	leaq	0x156c4ce(%rip), %rax   # 0x1469f4a9f
1454885d1:     	movq	%rax, 0xd0(%rbp)
1454885d8:     	movq	$0x1, 0xd8(%rbp)
1454885e3:     	movq	%r13, 0xe0(%rbp)
1454885ea:     	movq	%rcx, 0xe8(%rbp)
1454885f1:     	movq	$0x2, 0x20(%rsp)
1454885fa:     	leaq	0x78(%rbp), %rcx
1454885fe:     	leaq	0xb0(%rbp), %r9
145488605:     	movq	%rsi, %rdx
145488608:     	callq	0x145458060 <.text+0x5457060>
14548860d:     	nop
14548860e:     	jmp	0x145488d5e <.text+0x5487d5e>
145488613:     	leaq	0x156c8b8(%rip), %r14   # 0x1469f4ed2
14548861a:     	movl	$0x3f, %esi
14548861f:     	movl	$0x3f, %edx
145488624:     	movq	%r14, %rcx
145488627:     	callq	0x145457cb0 <.text+0x5456cb0>
14548862c:     	nop
14548862d:     	movq	%rdx, %r12
145488630:     	testq	%rax, %rax
145488633:     	cmovneq	%rax, %r14
145488637:     	cmoveq	%rsi, %r12
14548863b:     	mulss	0x4c(%rdi), %xmm12
145488641:     	mulss	%xmm12, %xmm9
145488646:     	ucomiss	%xmm9, %xmm13
14548864a:     	jae	0x14548867d <.text+0x548767d>
14548864c:     	addss	0x1551bab(%rip), %xmm9  # 0x1469da200
145488655:     	movss	0x48d1a3(%rip), %xmm7   # 0x145915800
14548865d:     	divss	%xmm7, %xmm9
145488662:     	movaps	%xmm9, %xmm0
145488666:     	callq	0x145773367 <.text+0x5772367>
14548866b:     	movaps	%xmm0, %xmm9
14548866f:     	mulss	%xmm7, %xmm9
145488674:     	addss	0x790d67(%rip), %xmm9   # 0x145c193e4
14548867d:     	leaq	0x1e0(%rbp), %rsi
145488684:     	movq	%rsi, %rcx
145488687:     	movaps	%xmm9, %xmm1
14548868b:     	callq	0x14548d390 <.text+0x548c390>
145488690:     	nop
145488691:     	leaq	0x156c879(%rip), %rax   # 0x1469f4f11
145488698:     	movq	%rax, 0xb0(%rbp)
14548869f:     	movq	$0x4, 0xb8(%rbp)
1454886aa:     	movq	%rsi, 0xc0(%rbp)
1454886b1:     	leaq	0x1551c20(%rip), %rcx   # 0x1469da2d8
1454886b8:     	movq	%rcx, 0xc8(%rbp)
1454886bf:     	leaq	0x156c200(%rip), %rax   # 0x1469f48c6
1454886c6:     	movq	%rax, 0xd0(%rbp)
1454886cd:     	movq	$0x3, 0xd8(%rbp)
1454886d8:     	movq	%r15, 0xe0(%rbp)
1454886df:     	movq	%rcx, 0xe8(%rbp)
1454886e6:     	movq	$0x2, 0x20(%rsp)
1454886ef:     	leaq	0x90(%rbp), %rcx
1454886f6:     	leaq	0xb0(%rbp), %r9
1454886fd:     	movq	%r14, %rdx
145488700:     	movq	%r12, %r8
145488703:     	callq	0x145458060 <.text+0x5457060>
145488708:     	nop
145488709:     	jmp	0x14548912c <.text+0x548812c>
14548870e:     	leaq	0x156c3c3(%rip), %rsi   # 0x1469f4ad8
145488715:     	movl	$0x40, %ebx
14548871a:     	movl	$0x40, %edx
14548871f:     	movq	%rsi, %rcx
145488722:     	callq	0x145457cb0 <.text+0x5456cb0>
145488727:     	nop
145488728:     	movq	%rdx, %r8
14548872b:     	testq	%rax, %rax
14548872e:     	cmovneq	%rax, %rsi
145488732:     	cmoveq	%rbx, %r8
145488736:     	leaq	0x156c362(%rip), %rax   # 0x1469f4a9f
14548873d:     	movq	%rax, 0xb0(%rbp)
145488744:     	movq	$0x1, 0xb8(%rbp)
14548874f:     	movq	%r13, 0xc0(%rbp)
145488756:     	leaq	0x1551b7b(%rip), %rax   # 0x1469da2d8
14548875d:     	movq	%rax, 0xc8(%rbp)
145488764:     	movq	$0x1, 0x20(%rsp)
14548876d:     	leaq	0x48(%rbp), %rcx
145488771:     	leaq	0xb0(%rbp), %r9
145488778:     	movq	%rsi, %rdx
14548877b:     	callq	0x145458060 <.text+0x5457060>
145488780:     	nop
145488781:     	leaq	0x156c390(%rip), %r14   # 0x1469f4b18
145488788:     	movl	$0x7d, %esi
14548878d:     	movl	$0x7d, %edx
145488792:     	movq	%r14, %rcx
145488795:     	callq	0x145457cb0 <.text+0x5456cb0>
14548879a:     	nop
14548879b:     	movq	%rdx, %r15
14548879e:     	divss	%xmm10, %xmm7
1454887a3:     	testq	%rax, %rax
1454887a6:     	cmovneq	%rax, %r14
1454887aa:     	cmoveq	%rsi, %r15
1454887ae:     	leaq	0x60(%rbp), %rcx
1454887b2:     	movaps	%xmm7, %xmm1
1454887b5:     	callq	0x14548d390 <.text+0x548c390>
1454887ba:     	nop
1454887bb:     	movzbl	0x74(%rdi), %ecx
1454887bf:     	callq	0x1454875e0 <.text+0x54865e0>
1454887c4:     	nop
1454887c5:     	maxss	0x47ecc2(%rip), %xmm9   # 0x145907490
1454887ce:     	movq	%rax, -0x8(%rbp)
1454887d2:     	movq	%rdx, (%rbp)
1454887d6:     	movaps	%xmm8, %xmm1
1454887da:     	divss	%xmm9, %xmm1
1454887df:     	leaq	0x78(%rbp), %rbx
1454887e3:     	movq	%rbx, %rcx
1454887e6:     	callq	0x14548d390 <.text+0x548c390>
1454887eb:     	nop
1454887ec:     	leaq	0x1c0(%rbp), %rsi
1454887f3:     	movq	%rsi, %rcx
1454887f6:     	movaps	%xmm8, %xmm1
1454887fa:     	callq	0x14548d390 <.text+0x548c390>
1454887ff:     	nop
145488800:     	mulss	%xmm9, %xmm7
145488805:     	leaq	0x1e0(%rbp), %r12
14548880c:     	movq	%r12, %rcx
14548880f:     	movaps	%xmm7, %xmm1
145488812:     	callq	0x14548d390 <.text+0x548c390>
145488817:     	nop
145488818:     	leaq	0x156c376(%rip), %rax   # 0x1469f4b95
14548881f:     	movq	%rax, 0xb0(%rbp)
145488826:     	movq	$0x5, 0xb8(%rbp)
145488831:     	leaq	0x48(%rbp), %rax
145488835:     	movq	%rax, 0xc0(%rbp)
14548883c:     	leaq	0x1551a95(%rip), %rcx   # 0x1469da2d8
145488843:     	movq	%rcx, 0xc8(%rbp)
14548884a:     	leaq	0x156c24e(%rip), %rax   # 0x1469f4a9f
145488851:     	movq	%rax, 0xd0(%rbp)
145488858:     	movq	$0x1, 0xd8(%rbp)
145488863:     	movq	%r13, 0xe0(%rbp)
14548886a:     	movq	%rcx, 0xe8(%rbp)
145488871:     	leaq	0x156c322(%rip), %rax   # 0x1469f4b9a
145488878:     	movq	%rax, 0xf0(%rbp)
14548887f:     	movq	$0x4, 0xf8(%rbp)
14548888a:     	leaq	0x60(%rbp), %rax
14548888e:     	movq	%rax, 0x100(%rbp)
145488895:     	movq	%rcx, 0x108(%rbp)
14548889c:     	leaq	0x156bf7b(%rip), %rax   # 0x1469f481e
1454888a3:     	movq	%rax, 0x110(%rbp)
1454888aa:     	movq	$0x6, 0x118(%rbp)
1454888b5:     	leaq	-0x8(%rbp), %rax
1454888b9:     	movq	%rax, 0x120(%rbp)
1454888c0:     	leaq	0x1551ae1(%rip), %rax   # 0x1469da3a8
1454888c7:     	movq	%rax, 0x128(%rbp)
1454888ce:     	leaq	0x156c2c9(%rip), %rax   # 0x1469f4b9e
1454888d5:     	movq	%rax, 0x130(%rbp)
1454888dc:     	movq	$0x5, 0x138(%rbp)
1454888e7:     	movq	%rbx, 0x140(%rbp)
1454888ee:     	movq	%rcx, 0x148(%rbp)
1454888f5:     	leaq	0x156c2a7(%rip), %rax   # 0x1469f4ba3
1454888fc:     	movq	%rax, 0x150(%rbp)
145488903:     	movq	$0x3, 0x158(%rbp)
14548890e:     	movq	%rsi, 0x160(%rbp)
145488915:     	movq	%rcx, 0x168(%rbp)
14548891c:     	leaq	0x156c283(%rip), %rax   # 0x1469f4ba6
145488923:     	movq	%rax, 0x170(%rbp)
14548892a:     	movq	$0x5, 0x178(%rbp)
145488935:     	movq	%r12, 0x180(%rbp)
14548893c:     	movq	%rcx, 0x188(%rbp)
145488943:     	movq	$0x7, 0x20(%rsp)
14548894c:     	leaq	0x90(%rbp), %rcx
145488953:     	leaq	0xb0(%rbp), %r9
14548895a:     	movq	%r14, %rdx
14548895d:     	movq	%r15, %r8
145488960:     	callq	0x145458060 <.text+0x5457060>
145488965:     	nop
145488966:     	movq	0x48(%rbp), %rdx
14548896a:     	testq	%rdx, %rdx
14548896d:     	je	0x14548897e <.text+0x548797e>
14548896f:     	movq	0x50(%rbp), %rcx
145488973:     	movl	$0x1, %r8d
145488979:     	callq	0x1400021d0 <.text+0x11d0>
14548897e:     	movq	0x1e0(%rbp), %rdx
145488985:     	testq	%rdx, %rdx
145488988:     	je	0x14548899c <.text+0x548799c>
14548898a:     	movq	0x1e8(%rbp), %rcx
145488991:     	movl	$0x1, %r8d
145488997:     	callq	0x1400021d0 <.text+0x11d0>
14548899c:     	movq	0x1c0(%rbp), %rdx
1454889a3:     	testq	%rdx, %rdx
1454889a6:     	je	0x145488ef1 <.text+0x5487ef1>
1454889ac:     	movq	0x1c8(%rbp), %rcx
1454889b3:     	movl	$0x1, %r8d
1454889b9:     	callq	0x1400021d0 <.text+0x11d0>
1454889be:     	jmp	0x145488ef1 <.text+0x5487ef1>
1454889c3:     	cmpq	$0xf, 0x8(%rdi)
1454889c8:     	jne	0x1454889f1 <.text+0x54879f1>
1454889ca:     	movq	(%rdi), %rax
1454889cd:     	movabsq	$0x6d5f656e61637261, %rcx # imm = 0x6D5F656E61637261
1454889d7:     	xorq	(%rax), %rcx
1454889da:     	movabsq	$0x73656c697373696d, %rdx # imm = 0x73656C697373696D
1454889e4:     	xorq	0x7(%rax), %rdx
1454889e8:     	orq	%rcx, %rdx
1454889eb:     	je	0x1454896c4 <.text+0x54886c4>
1454889f1:     	leaq	0x156bf4d(%rip), %rsi   # 0x1469f4945
1454889f8:     	movl	$0x7b, %ebx
1454889fd:     	movl	$0x7b, %edx
145488a02:     	movq	%rsi, %rcx
145488a05:     	callq	0x145457cb0 <.text+0x5456cb0>
145488a0a:     	nop
145488a0b:     	movq	%rdx, %r8
145488a0e:     	testq	%rax, %rax
145488a11:     	cmovneq	%rax, %rsi
145488a15:     	cmoveq	%rbx, %r8
145488a19:     	leaq	0x15518d8(%rip), %rax   # 0x1469da2f8
145488a20:     	movq	%rax, 0xb0(%rbp)
145488a27:     	movq	$0x1, 0xb8(%rbp)
145488a32:     	leaq	0x1dc(%rbp), %rax
145488a39:     	movq	%rax, 0xc0(%rbp)
145488a40:     	leaq	0x156bd79(%rip), %rax   # 0x1469f47c0
145488a47:     	movq	%rax, 0xc8(%rbp)
145488a4e:     	leaq	0x156be6c(%rip), %rax   # 0x1469f48c1
145488a55:     	movq	%rax, 0xd0(%rbp)
145488a5c:     	movq	$0x5, 0xd8(%rbp)
145488a67:     	leaq	0x18(%rbp), %rax
145488a6b:     	movq	%rax, 0xe0(%rbp)
145488a72:     	leaq	0x155185f(%rip), %rcx   # 0x1469da2d8
145488a79:     	movq	%rcx, 0xe8(%rbp)
145488a80:     	leaq	0x156be3f(%rip), %rax   # 0x1469f48c6
145488a87:     	movq	%rax, 0xf0(%rbp)
145488a8e:     	movq	$0x3, 0xf8(%rbp)
145488a99:     	movq	%r15, 0x100(%rbp)
145488aa0:     	movq	%rcx, 0x108(%rbp)
145488aa7:     	movq	$0x3, 0x20(%rsp)
145488ab0:     	leaq	0x90(%rbp), %rcx
145488ab7:     	leaq	0xb0(%rbp), %r9
145488abe:     	movq	%rsi, %rdx
145488ac1:     	callq	0x145458060 <.text+0x5457060>
145488ac6:     	nop
145488ac7:     	jmp	0x1454898d6 <.text+0x54888d6>
145488acc:     	leaq	0x156c1a5(%rip), %rsi   # 0x1469f4c78
145488ad3:     	movl	$0x42, %ebx
145488ad8:     	movl	$0x42, %edx
145488add:     	movq	%rsi, %rcx
145488ae0:     	callq	0x145457cb0 <.text+0x5456cb0>
145488ae5:     	nop
145488ae6:     	movq	%rdx, %r8
145488ae9:     	testq	%rax, %rax
145488aec:     	cmovneq	%rax, %rsi
145488af0:     	cmoveq	%rbx, %r8
145488af4:     	leaq	0x15517fd(%rip), %rax   # 0x1469da2f8
145488afb:     	movq	%rax, 0xb0(%rbp)
145488b02:     	movq	$0x1, 0xb8(%rbp)
145488b0d:     	leaq	0x1dc(%rbp), %rax
145488b14:     	movq	%rax, 0xc0(%rbp)
145488b1b:     	leaq	0x156bc9e(%rip), %rax   # 0x1469f47c0
145488b22:     	movq	%rax, 0xc8(%rbp)
145488b29:     	leaq	0x156bd91(%rip), %rax   # 0x1469f48c1
145488b30:     	movq	%rax, 0xd0(%rbp)
145488b37:     	movq	$0x5, 0xd8(%rbp)
145488b42:     	leaq	0x18(%rbp), %rax
145488b46:     	movq	%rax, 0xe0(%rbp)
145488b4d:     	leaq	0x1551784(%rip), %rcx   # 0x1469da2d8
145488b54:     	movq	%rcx, 0xe8(%rbp)
145488b5b:     	leaq	0x156bd64(%rip), %rax   # 0x1469f48c6
145488b62:     	movq	%rax, 0xf0(%rbp)
145488b69:     	movq	$0x3, 0xf8(%rbp)
145488b74:     	movq	%r15, 0x100(%rbp)
145488b7b:     	movq	%rcx, 0x108(%rbp)
145488b82:     	leaq	0x156bd40(%rip), %rax   # 0x1469f48c9
145488b89:     	movq	%rax, 0x110(%rbp)
145488b90:     	movq	$0x5, 0x118(%rbp)
145488b9b:     	leaq	0x38(%rbp), %rax
145488b9f:     	movq	%rax, 0x120(%rbp)
145488ba6:     	leaq	0x15517fb(%rip), %rax   # 0x1469da3a8
145488bad:     	movq	%rax, 0x128(%rbp)
145488bb4:     	movq	$0x4, 0x20(%rsp)
145488bbd:     	leaq	0x90(%rbp), %rcx
145488bc4:     	leaq	0xb0(%rbp), %r9
145488bcb:     	movq	%rsi, %rdx
145488bce:     	callq	0x145458060 <.text+0x5457060>
145488bd3:     	nop
145488bd4:     	jmp	0x1454898d6 <.text+0x54888d6>
145488bd9:     	leaq	0x156c2da(%rip), %rsi   # 0x1469f4eba
145488be0:     	movl	$0x11, %ebx
145488be5:     	movl	$0x11, %edx
145488bea:     	movq	%rsi, %rcx
145488bed:     	callq	0x145457cb0 <.text+0x5456cb0>
145488bf2:     	nop
145488bf3:     	movq	%rdx, %r8
145488bf6:     	testq	%rax, %rax
145488bf9:     	cmovneq	%rax, %rsi
145488bfd:     	cmoveq	%rbx, %r8
145488c01:     	leaq	0x15516f0(%rip), %rax   # 0x1469da2f8
145488c08:     	movq	%rax, 0xb0(%rbp)
145488c0f:     	movq	$0x1, 0xb8(%rbp)
145488c1a:     	leaq	0x1dc(%rbp), %rax
145488c21:     	movq	%rax, 0xc0(%rbp)
145488c28:     	leaq	0x156bb91(%rip), %rax   # 0x1469f47c0
145488c2f:     	movq	%rax, 0xc8(%rbp)
145488c36:     	movq	$0x1, 0x20(%rsp)
145488c3f:     	leaq	0x1c0(%rbp), %rcx
145488c46:     	leaq	0xb0(%rbp), %r9
145488c4d:     	movq	%rsi, %rdx
145488c50:     	callq	0x145458060 <.text+0x5457060>
145488c55:     	nop
145488c56:     	jmp	0x1454897b9 <.text+0x54887b9>
145488c5b:     	leaq	0x156c2b3(%rip), %rbx   # 0x1469f4f15
145488c62:     	movl	$0x2c, %edx
145488c67:     	movq	%rbx, %rcx
145488c6a:     	callq	0x145457cb0 <.text+0x5456cb0>
145488c6f:     	nop
145488c70:     	movq	%rax, %r13
145488c73:     	movq	%rdx, %rsi
145488c76:     	movl	0x1dc(%rbp), %edx
145488c7c:     	leaq	0x1e0(%rbp), %r14
145488c83:     	movq	%r14, %rcx
145488c86:     	xorl	%r8d, %r8d
145488c89:     	callq	0x1454952c0 <.text+0x54942c0>
145488c8e:     	nop
145488c8f:     	testq	%r13, %r13
145488c92:     	movl	$0x2c, %eax
145488c97:     	cmoveq	%rax, %rsi
145488c9b:     	cmovneq	%r13, %rbx
145488c9f:     	leaq	0x156bc14(%rip), %rax   # 0x1469f48ba
145488ca6:     	movq	%rax, 0xb0(%rbp)
145488cad:     	movq	$0x7, 0xb8(%rbp)
145488cb8:     	movq	%r14, 0xc0(%rbp)
145488cbf:     	leaq	0x1551612(%rip), %rcx   # 0x1469da2d8
145488cc6:     	movq	%rcx, 0xc8(%rbp)
145488ccd:     	leaq	0x156bbed(%rip), %rax   # 0x1469f48c1
145488cd4:     	movq	%rax, 0xd0(%rbp)
145488cdb:     	movq	$0x5, 0xd8(%rbp)
145488ce6:     	leaq	0x18(%rbp), %rax
145488cea:     	movq	%rax, 0xe0(%rbp)
145488cf1:     	movq	%rcx, 0xe8(%rbp)
145488cf8:     	leaq	0x156bbc7(%rip), %rax   # 0x1469f48c6
145488cff:     	movq	%rax, 0xf0(%rbp)
145488d06:     	movq	$0x3, 0xf8(%rbp)
145488d11:     	movq	%r15, 0x100(%rbp)
145488d18:     	movq	%rcx, 0x108(%rbp)
145488d1f:     	movq	$0x3, 0x20(%rsp)
145488d28:     	leaq	0x78(%rbp), %rcx
145488d2c:     	leaq	0xb0(%rbp), %r9
145488d33:     	movq	%rbx, %rdx
145488d36:     	movq	%rsi, %r8
145488d39:     	callq	0x145458060 <.text+0x5457060>
145488d3e:     	nop
145488d3f:     	movq	0x1e0(%rbp), %rdx
145488d46:     	testq	%rdx, %rdx
145488d49:     	je	0x145488d5e <.text+0x5487d5e>
145488d4b:     	movq	0x1e8(%rbp), %rcx
145488d52:     	movl	$0x1, %r8d
145488d58:     	callq	0x1400021d0 <.text+0x11d0>
145488d5d:     	nop
145488d5e:     	leaq	0x156c20a(%rip), %rbx   # 0x1469f4f6f
145488d65:     	movl	$0x62, %edx
145488d6a:     	movq	%rbx, %rcx
145488d6d:     	callq	0x145457cb0 <.text+0x5456cb0>
145488d72:     	nop
145488d73:     	movq	%rax, %r14
145488d76:     	movq	%rdx, %rsi
145488d79:     	leaq	0x1e0(%rbp), %r15
145488d80:     	movq	%r15, %rcx
145488d83:     	movaps	%xmm7, %xmm1
145488d86:     	callq	0x14548d390 <.text+0x548c390>
145488d8b:     	nop
145488d8c:     	testq	%r14, %r14
145488d8f:     	movl	$0x62, %eax
145488d94:     	cmoveq	%rax, %rsi
145488d98:     	cmovneq	%r14, %rbx
145488d9c:     	leaq	0x156be00(%rip), %rax   # 0x1469f4ba3
145488da3:     	movq	%rax, 0xb0(%rbp)
145488daa:     	movq	$0x3, 0xb8(%rbp)
145488db5:     	movq	%r15, 0xc0(%rbp)
145488dbc:     	leaq	0x1551515(%rip), %rcx   # 0x1469da2d8
145488dc3:     	movq	%rcx, 0xc8(%rbp)
145488dca:     	leaq	0x156bdcd(%rip), %rax   # 0x1469f4b9e
145488dd1:     	movq	%rax, 0xd0(%rbp)
145488dd8:     	movq	$0x5, 0xd8(%rbp)
145488de3:     	movq	%r12, 0xe0(%rbp)
145488dea:     	movq	%rcx, 0xe8(%rbp)
145488df1:     	leaq	0x156c1d9(%rip), %rax   # 0x1469f4fd1
145488df8:     	movq	%rax, 0xf0(%rbp)
145488dff:     	movq	$0x4, 0xf8(%rbp)
145488e0a:     	leaq	0x78(%rbp), %rax
145488e0e:     	movq	%rax, 0x100(%rbp)
145488e15:     	movq	%rcx, 0x108(%rbp)
145488e1c:     	movq	$0x3, 0x20(%rsp)
145488e25:     	leaq	0x1c0(%rbp), %rcx
145488e2c:     	leaq	0xb0(%rbp), %r9
145488e33:     	movq	%rbx, %rdx
145488e36:     	movq	%rsi, %r8
145488e39:     	callq	0x145458060 <.text+0x5457060>
145488e3e:     	nop
145488e3f:     	movq	0x1e0(%rbp), %rdx
145488e46:     	testq	%rdx, %rdx
145488e49:     	je	0x145488e5d <.text+0x5487e5d>
145488e4b:     	movq	0x1e8(%rbp), %rcx
145488e52:     	movl	$0x1, %r8d
145488e58:     	callq	0x1400021d0 <.text+0x11d0>
145488e5d:     	movss	0x50(%rdi), %xmm0
145488e62:     	xorps	%xmm1, %xmm1
145488e65:     	ucomiss	%xmm1, %xmm0
145488e68:     	jbe	0x145488e88 <.text+0x5487e88>
145488e6a:     	movq	0x1d0(%rbp), %rax
145488e71:     	movq	%rax, 0xa0(%rbp)
145488e78:     	movups	0x1c0(%rbp), %xmm0
145488e7f:     	movaps	%xmm0, 0x90(%rbp)
145488e86:     	jmp	0x145488ef1 <.text+0x5487ef1>
145488e88:     	movups	0x1c0(%rbp), %xmm0
145488e8f:     	movaps	%xmm0, 0xb0(%rbp)
145488e96:     	movq	0x1d0(%rbp), %rsi
145488e9d:     	movq	%rsi, 0xc0(%rbp)
145488ea4:     	movq	0x38(%rbp), %r14
145488ea8:     	movq	0x40(%rbp), %rbx
145488eac:     	movq	0xb0(%rbp), %rax
145488eb3:     	subq	%rsi, %rax
145488eb6:     	cmpq	%rax, %rbx
145488eb9:     	ja	0x14548a71a <.text+0x548971a>
145488ebf:     	testq	%rbx, %rbx
145488ec2:     	je	0x145488ed9 <.text+0x5487ed9>
145488ec4:     	movq	0xb8(%rbp), %rcx
145488ecb:     	addq	%rsi, %rcx
145488ece:     	movq	%r14, %rdx
145488ed1:     	movq	%rbx, %r8
145488ed4:     	callq	0x1457731ed <.text+0x57721ed>
145488ed9:     	addq	%rbx, %rsi
145488edc:     	movaps	0xb0(%rbp), %xmm0
145488ee3:     	movaps	%xmm0, 0x90(%rbp)
145488eea:     	movq	%rsi, 0xa0(%rbp)
145488ef1:     	movq	0x78(%rbp), %rdx
145488ef5:     	testq	%rdx, %rdx
145488ef8:     	je	0x145488f0c <.text+0x5487f0c>
145488efa:     	movq	0x80(%rbp), %rcx
145488f01:     	movl	$0x1, %r8d
145488f07:     	callq	0x1400021d0 <.text+0x11d0>
145488f0c:     	movq	0x60(%rbp), %rdx
145488f10:     	testq	%rdx, %rdx
145488f13:     	je	0x1454898d6 <.text+0x54888d6>
145488f19:     	movq	0x68(%rbp), %rcx
145488f1d:     	jmp	0x1454898cb <.text+0x54888cb>
145488f22:     	leaq	0x156bd91(%rip), %rsi   # 0x1469f4cba
145488f29:     	movl	$0x1f, %ebx
145488f2e:     	movl	$0x1f, %edx
145488f33:     	movq	%rsi, %rcx
145488f36:     	callq	0x145457cb0 <.text+0x5456cb0>
145488f3b:     	nop
145488f3c:     	testq	%rax, %rax
145488f3f:     	cmovneq	%rax, %rsi
145488f43:     	cmoveq	%rbx, %rdx
145488f47:     	testq	%rdx, %rdx
145488f4a:     	movq	%rdx, %r12
145488f4d:     	jns	0x145489148 <.text+0x5488148>
145488f53:     	xorl	%ebx, %ebx
145488f55:     	movq	%rbx, %rcx
145488f58:     	movq	%r12, %rdx
145488f5b:     	callq	0x14590379b <.text+0x590279b>
145488f60:     	nop
145488f61:     	jmp	0x14548a76a <.text+0x548976a>
145488f66:     	je	0x14548979f <.text+0x548879f>
145488f6c:     	callq	0x140002200 <.text+0x1200>
145488f71:     	movl	$0x1, %edx
145488f76:     	movq	%rbx, %rcx
145488f79:     	callq	0x1400021c0 <.text+0x11c0>
145488f7e:     	movl	$0x1, %ecx
145488f83:     	testq	%rax, %rax
145488f86:     	je	0x145487f58 <.text+0x5486f58>
145488f8c:     	movq	%rax, %rcx
145488f8f:     	movq	%rsi, %rdx
145488f92:     	movq	%rbx, %r8
145488f95:     	movq	%rax, %rsi
145488f98:     	callq	0x1457731ed <.text+0x57721ed>
145488f9d:     	movq	%rsi, %rax
145488fa0:     	jmp	0x1454897a4 <.text+0x54887a4>
145488fa5:     	leaq	0x156b89e(%rip), %rbx   # 0x1469f484a
145488fac:     	movl	$0x35, %esi
145488fb1:     	movl	$0x35, %edx
145488fb6:     	movq	%rbx, %rcx
145488fb9:     	callq	0x145457cb0 <.text+0x5456cb0>
145488fbe:     	nop
145488fbf:     	testq	%rax, %rax
145488fc2:     	cmovneq	%rax, %rbx
145488fc6:     	cmoveq	%rsi, %rdx
145488fca:     	movq	%rbx, 0x1c0(%rbp)
145488fd1:     	movq	%rdx, 0x1c8(%rbp)
145488fd8:     	cmpl	$0x1, 0x1dc(%rbp)
145488fdf:     	ja	0x1454879a9 <.text+0x54869a9>
145488fe5:     	leaq	0x156b893(%rip), %r12   # 0x1469f487f
145488fec:     	movl	$0x3b, %edx
145488ff1:     	movq	%r12, %rcx
145488ff4:     	callq	0x145457cb0 <.text+0x5456cb0>
145488ff9:     	nop
145488ffa:     	movq	%rax, %rsi
145488ffd:     	movq	%rdx, %rbx
145489000:     	movl	0x1dc(%rbp), %edx
145489006:     	leaq	0x1e0(%rbp), %r14
14548900d:     	movq	%r14, %rcx
145489010:     	xorl	%r8d, %r8d
145489013:     	callq	0x1454952c0 <.text+0x54942c0>
145489018:     	nop
145489019:     	testq	%rsi, %rsi
14548901c:     	movl	$0x3b, %eax
145489021:     	cmoveq	%rax, %rbx
145489025:     	cmovneq	%rsi, %r12
145489029:     	leaq	0x156b88a(%rip), %rax   # 0x1469f48ba
145489030:     	movq	%rax, 0xb0(%rbp)
145489037:     	movq	$0x7, 0xb8(%rbp)
145489042:     	movq	%r14, 0xc0(%rbp)
145489049:     	leaq	0x1551288(%rip), %rcx   # 0x1469da2d8
145489050:     	movq	%rcx, 0xc8(%rbp)
145489057:     	leaq	0x156b863(%rip), %rax   # 0x1469f48c1
14548905e:     	movq	%rax, 0xd0(%rbp)
145489065:     	movq	$0x5, 0xd8(%rbp)
145489070:     	leaq	0x18(%rbp), %rax
145489074:     	movq	%rax, 0xe0(%rbp)
14548907b:     	movq	%rcx, 0xe8(%rbp)
145489082:     	leaq	0x156b83d(%rip), %rax   # 0x1469f48c6
145489089:     	movq	%rax, 0xf0(%rbp)
145489090:     	movq	$0x3, 0xf8(%rbp)
14548909b:     	movq	%r15, 0x100(%rbp)
1454890a2:     	movq	%rcx, 0x108(%rbp)
1454890a9:     	leaq	0x156b819(%rip), %rax   # 0x1469f48c9
1454890b0:     	movq	%rax, 0x110(%rbp)
1454890b7:     	movq	$0x5, 0x118(%rbp)
1454890c2:     	leaq	0x38(%rbp), %rax
1454890c6:     	movq	%rax, 0x120(%rbp)
1454890cd:     	leaq	0x15512d4(%rip), %rcx   # 0x1469da3a8
1454890d4:     	movq	%rcx, 0x128(%rbp)
1454890db:     	leaq	0x156b7ec(%rip), %rax   # 0x1469f48ce
1454890e2:     	movq	%rax, 0x130(%rbp)
1454890e9:     	movq	$0x4, 0x138(%rbp)
1454890f4:     	leaq	0x1c0(%rbp), %rax
1454890fb:     	movq	%rax, 0x140(%rbp)
145489102:     	movq	%rcx, 0x148(%rbp)
145489109:     	movq	$0x5, 0x20(%rsp)
145489112:     	leaq	0x90(%rbp), %rcx
145489119:     	leaq	0xb0(%rbp), %r9
145489120:     	movq	%r12, %rdx
145489123:     	movq	%rbx, %r8
145489126:     	callq	0x145458060 <.text+0x5457060>
14548912b:     	nop
14548912c:     	movq	0x1e0(%rbp), %rdx
145489133:     	testq	%rdx, %rdx
145489136:     	je	0x1454898d6 <.text+0x54888d6>
14548913c:     	movq	0x1e8(%rbp), %rcx
145489143:     	jmp	0x1454898cb <.text+0x54888cb>
145489148:     	je	0x14548a1a4 <.text+0x54891a4>
14548914e:     	callq	0x140002200 <.text+0x1200>
145489153:     	movl	$0x1, %ebx
145489158:     	movl	$0x1, %edx
14548915d:     	movq	%r12, %rcx
145489160:     	callq	0x1400021c0 <.text+0x11c0>
145489165:     	testq	%rax, %rax
145489168:     	je	0x145488f55 <.text+0x5487f55>
14548916e:     	movq	%rax, %r13
145489171:     	movq	%rax, %rcx
145489174:     	movq	%rsi, %rdx
145489177:     	movq	%r12, %r8
14548917a:     	callq	0x1457731ed <.text+0x57721ed>
14548917f:     	jmp	0x14548a1aa <.text+0x54891aa>
145489184:     	movss	0x6c(%rdi), %xmm9
14548918a:     	cmpl	$0x6, %eax
14548918d:     	je	0x14548a3b1 <.text+0x54893b1>
145489193:     	cmpl	$0xb, %eax
145489196:     	je	0x14548a336 <.text+0x5489336>
14548919c:     	cmpl	$0xc, %eax
14548919f:     	jne	0x145487cf8 <.text+0x5486cf8>
1454891a5:     	leaq	0x156c55c(%rip), %r15   # 0x1469f5708
1454891ac:     	movl	$0x47, %edx
1454891b1:     	movq	%r15, %rcx
1454891b4:     	callq	0x145457cb0 <.text+0x5456cb0>
1454891b9:     	nop
1454891ba:     	movq	%rax, %rsi
1454891bd:     	movq	%rdx, %rbx
1454891c0:     	mulss	%xmm9, %xmm11
1454891c5:     	mulss	%xmm11, %xmm10
1454891ca:     	movss	0x40(%r12), %xmm0
1454891d1:     	addss	0x47e2b7(%rip), %xmm0   # 0x145907490
1454891d9:     	mulss	%xmm10, %xmm0
1454891de:     	mulss	%xmm0, %xmm8
1454891e3:     	leaq	0x1e0(%rbp), %r12
1454891ea:     	movq	%r12, %rcx
1454891ed:     	movaps	%xmm8, %xmm1
1454891f1:     	callq	0x14548d390 <.text+0x548c390>
1454891f6:     	nop
1454891f7:     	testq	%rsi, %rsi
1454891fa:     	movl	$0x47, %eax
1454891ff:     	cmoveq	%rax, %rbx
145489203:     	cmovneq	%rsi, %r15
145489207:     	leaq	0x156b995(%rip), %rax   # 0x1469f4ba3
14548920e:     	movq	%rax, 0xb0(%rbp)
145489215:     	movq	$0x3, 0xb8(%rbp)
145489220:     	movq	%r14, 0xc0(%rbp)
145489227:     	leaq	0x15510aa(%rip), %rcx   # 0x1469da2d8
14548922e:     	movq	%rcx, 0xc8(%rbp)
145489235:     	leaq	0x15510bc(%rip), %rax   # 0x1469da2f8
14548923c:     	movq	%rax, 0xd0(%rbp)
145489243:     	movq	$0x1, 0xd8(%rbp)
14548924e:     	movq	%r12, 0xe0(%rbp)
145489255:     	movq	%rcx, 0xe8(%rbp)
14548925c:     	leaq	0x156c410(%rip), %rax   # 0x1469f5673
145489263:     	movq	%rax, 0xf0(%rbp)
14548926a:     	movq	$0x8, 0xf8(%rbp)
145489275:     	leaq	0x48(%rbp), %rax
145489279:     	movq	%rax, 0x100(%rbp)
145489280:     	leaq	0x1551121(%rip), %rax   # 0x1469da3a8
145489287:     	movq	%rax, 0x108(%rbp)
14548928e:     	movq	$0x3, 0x20(%rsp)
145489297:     	leaq	0x90(%rbp), %rcx
14548929e:     	leaq	0xb0(%rbp), %r9
1454892a5:     	movq	%r15, %rdx
1454892a8:     	movq	%rbx, %r8
1454892ab:     	callq	0x145458060 <.text+0x5457060>
1454892b0:     	nop
1454892b1:     	jmp	0x145489535 <.text+0x5488535>
1454892b6:     	movss	0x6c(%rdi), %xmm8
1454892bc:     	leaq	0x156c376(%rip), %r15   # 0x1469f5639
1454892c3:     	movl	$0x3a, %edx
1454892c8:     	movq	%r15, %rcx
1454892cb:     	callq	0x145457cb0 <.text+0x5456cb0>
1454892d0:     	nop
1454892d1:     	movq	%rax, %rsi
1454892d4:     	movq	%rdx, %r13
1454892d7:     	movss	0x40(%r12), %xmm0
1454892de:     	addss	0x47e1aa(%rip), %xmm0   # 0x145907490
1454892e6:     	mulss	%xmm8, %xmm7
1454892eb:     	mulss	%xmm7, %xmm0
1454892ef:     	mulss	0x47e245(%rip), %xmm0   # 0x14590753c
1454892f7:     	movss	%xmm0, 0x1c0(%rbp)
1454892ff:     	leaq	0x1c0(%rbp), %rax
145489306:     	movq	%rax, 0xb0(%rbp)
14548930d:     	leaq	0x2b03dc(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145489314:     	movq	%rax, 0xb8(%rbp)
14548931b:     	leaq	0x156bcb3(%rip), %rdx   # 0x1469f4fd5
145489322:     	leaq	0x1e0(%rbp), %rbx
145489329:     	leaq	0xb0(%rbp), %r8
145489330:     	movq	%rbx, %rcx
145489333:     	callq	0x145728390 <.text+0x5727390>
145489338:     	nop
145489339:     	testq	%rsi, %rsi
14548933c:     	movl	$0x3a, %eax
145489341:     	cmoveq	%rax, %r13
145489345:     	cmovneq	%rsi, %r15
145489349:     	leaq	0x156b430(%rip), %rax   # 0x1469f4780
145489350:     	movq	%rax, 0xb0(%rbp)
145489357:     	movq	$0x1, 0xb8(%rbp)
145489362:     	movq	%rbx, 0xc0(%rbp)
145489369:     	leaq	0x1550f68(%rip), %rcx   # 0x1469da2d8
145489370:     	movq	%rcx, 0xc8(%rbp)
145489377:     	leaq	0x156b825(%rip), %rax   # 0x1469f4ba3
14548937e:     	movq	%rax, 0xd0(%rbp)
145489385:     	movq	$0x3, 0xd8(%rbp)
145489390:     	movq	%r14, 0xe0(%rbp)
145489397:     	movq	%rcx, 0xe8(%rbp)
14548939e:     	leaq	0x156c2ce(%rip), %rax   # 0x1469f5673
1454893a5:     	movq	%rax, 0xf0(%rbp)
1454893ac:     	movq	$0x8, 0xf8(%rbp)
1454893b7:     	leaq	0x48(%rbp), %rax
1454893bb:     	movq	%rax, 0x100(%rbp)
1454893c2:     	leaq	0x1550fdf(%rip), %rax   # 0x1469da3a8
1454893c9:     	movq	%rax, 0x108(%rbp)
1454893d0:     	movq	$0x3, 0x20(%rsp)
1454893d9:     	leaq	0x90(%rbp), %rcx
1454893e0:     	leaq	0xb0(%rbp), %r9
1454893e7:     	movq	%r15, %rdx
1454893ea:     	movq	%r13, %r8
1454893ed:     	callq	0x145458060 <.text+0x5457060>
1454893f2:     	nop
1454893f3:     	jmp	0x145489535 <.text+0x5488535>
1454893f8:     	movss	0x6c(%rdi), %xmm8
1454893fe:     	leaq	0x156c276(%rip), %r15   # 0x1469f567b
145489405:     	movl	$0x3b, %edx
14548940a:     	movq	%r15, %rcx
14548940d:     	callq	0x145457cb0 <.text+0x5456cb0>
145489412:     	nop
145489413:     	movq	%rax, %rsi
145489416:     	movq	%rdx, %r13
145489419:     	movss	0x40(%r12), %xmm0
145489420:     	addss	0x47e068(%rip), %xmm0   # 0x145907490
145489428:     	mulss	%xmm8, %xmm7
14548942d:     	mulss	%xmm7, %xmm0
145489431:     	mulss	0x47e103(%rip), %xmm0   # 0x14590753c
145489439:     	movss	%xmm0, 0x1c0(%rbp)
145489441:     	leaq	0x1c0(%rbp), %rax
145489448:     	movq	%rax, 0xb0(%rbp)
14548944f:     	leaq	0x2b029a(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145489456:     	movq	%rax, 0xb8(%rbp)
14548945d:     	leaq	0x156bb71(%rip), %rdx   # 0x1469f4fd5
145489464:     	leaq	0x1e0(%rbp), %rbx
14548946b:     	leaq	0xb0(%rbp), %r8
145489472:     	movq	%rbx, %rcx
145489475:     	callq	0x145728390 <.text+0x5727390>
14548947a:     	nop
14548947b:     	testq	%rsi, %rsi
14548947e:     	movl	$0x3b, %eax
145489483:     	cmoveq	%rax, %r13
145489487:     	cmovneq	%rsi, %r15
14548948b:     	leaq	0x156b2ee(%rip), %rax   # 0x1469f4780
145489492:     	movq	%rax, 0xb0(%rbp)
145489499:     	movq	$0x1, 0xb8(%rbp)
1454894a4:     	movq	%rbx, 0xc0(%rbp)
1454894ab:     	leaq	0x1550e26(%rip), %rcx   # 0x1469da2d8
1454894b2:     	movq	%rcx, 0xc8(%rbp)
1454894b9:     	leaq	0x156b6e3(%rip), %rax   # 0x1469f4ba3
1454894c0:     	movq	%rax, 0xd0(%rbp)
1454894c7:     	movq	$0x3, 0xd8(%rbp)
1454894d2:     	movq	%r14, 0xe0(%rbp)
1454894d9:     	movq	%rcx, 0xe8(%rbp)
1454894e0:     	leaq	0x156c18c(%rip), %rax   # 0x1469f5673
1454894e7:     	movq	%rax, 0xf0(%rbp)
1454894ee:     	movq	$0x8, 0xf8(%rbp)
1454894f9:     	leaq	0x48(%rbp), %rax
1454894fd:     	movq	%rax, 0x100(%rbp)
145489504:     	leaq	0x1550e9d(%rip), %rax   # 0x1469da3a8
14548950b:     	movq	%rax, 0x108(%rbp)
145489512:     	movq	$0x3, 0x20(%rsp)
14548951b:     	leaq	0x90(%rbp), %rcx
145489522:     	leaq	0xb0(%rbp), %r9
145489529:     	movq	%r15, %rdx
14548952c:     	movq	%r13, %r8
14548952f:     	callq	0x145458060 <.text+0x5457060>
145489534:     	nop
145489535:     	movq	0x1e0(%rbp), %rdx
14548953c:     	testq	%rdx, %rdx
14548953f:     	je	0x145488f0c <.text+0x5487f0c>
145489545:     	movq	0x1e8(%rbp), %rcx
14548954c:     	jmp	0x145488f01 <.text+0x5487f01>
145489551:     	mulss	0x6c(%rdi), %xmm7
145489556:     	leaq	0x156c072(%rip), %r14   # 0x1469f55cf
14548955d:     	movl	$0x6a, %esi
145489562:     	movl	$0x6a, %edx
145489567:     	movq	%r14, %rcx
14548956a:     	callq	0x145457cb0 <.text+0x5456cb0>
14548956f:     	nop
145489570:     	movq	%rdx, %r15
145489573:     	testq	%rax, %rax
145489576:     	cmovneq	%rax, %r14
14548957a:     	cmoveq	%rsi, %r15
14548957e:     	movaps	%xmm6, %xmm1
145489581:     	mulss	%xmm7, %xmm1
145489585:     	mulss	%xmm10, %xmm11
14548958a:     	sqrtss	%xmm11, %xmm8
14548958f:     	mulss	0x48f158(%rip), %xmm8   # 0x1459186f0
145489598:     	mulss	%xmm8, %xmm1
14548959d:     	movss	0x40(%r12), %xmm9
1454895a4:     	addss	0x47dee3(%rip), %xmm9   # 0x145907490
1454895ad:     	mulss	%xmm9, %xmm1
1454895b2:     	leaq	0x1c0(%rbp), %rsi
1454895b9:     	movq	%rsi, %rcx
1454895bc:     	callq	0x14548d390 <.text+0x548c390>
1454895c1:     	nop
1454895c2:     	mulss	%xmm7, %xmm8
1454895c7:     	mulss	%xmm9, %xmm8
1454895cc:     	mulss	0x47df67(%rip), %xmm8   # 0x14590753c
1454895d5:     	movss	%xmm8, 0x78(%rbp)
1454895db:     	leaq	0x78(%rbp), %rax
1454895df:     	movq	%rax, 0xb0(%rbp)
1454895e6:     	leaq	0x2b0103(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
1454895ed:     	movq	%rax, 0xb8(%rbp)
1454895f4:     	leaq	0x156b9da(%rip), %rdx   # 0x1469f4fd5
1454895fb:     	leaq	0x1e0(%rbp), %rbx
145489602:     	leaq	0xb0(%rbp), %r8
145489609:     	movq	%rbx, %rcx
14548960c:     	callq	0x145728390 <.text+0x5727390>
145489611:     	nop
145489612:     	leaq	0x156bfa7(%rip), %rax   # 0x1469f55c0
145489619:     	movq	%rax, 0xb0(%rbp)
145489620:     	movq	$0x6, 0xb8(%rbp)
14548962b:     	movq	%rsi, 0xc0(%rbp)
145489632:     	leaq	0x1550c9f(%rip), %rcx   # 0x1469da2d8
145489639:     	movq	%rcx, 0xc8(%rbp)
145489640:     	leaq	0x156bf7f(%rip), %rax   # 0x1469f55c6
145489647:     	movq	%rax, 0xd0(%rbp)
14548964e:     	movq	$0x5, 0xd8(%rbp)
145489659:     	movq	%rbx, 0xe0(%rbp)
145489660:     	movq	%rcx, 0xe8(%rbp)
145489667:     	movq	$0x2, 0x20(%rsp)
145489670:     	leaq	0x90(%rbp), %rcx
145489677:     	leaq	0xb0(%rbp), %r9
14548967e:     	movq	%r14, %rdx
145489681:     	movq	%r15, %r8
145489684:     	callq	0x145458060 <.text+0x5457060>
145489689:     	nop
14548968a:     	movq	0x1e0(%rbp), %rdx
145489691:     	testq	%rdx, %rdx
145489694:     	je	0x1454896a8 <.text+0x54886a8>
145489696:     	movq	0x1e8(%rbp), %rcx
14548969d:     	movl	$0x1, %r8d
1454896a3:     	callq	0x1400021d0 <.text+0x11d0>
1454896a8:     	movq	0x1c0(%rbp), %rdx
1454896af:     	testq	%rdx, %rdx
1454896b2:     	je	0x145488f0c <.text+0x5487f0c>
1454896b8:     	movq	0x1c8(%rbp), %rcx
1454896bf:     	jmp	0x145488f01 <.text+0x5487f01>
1454896c4:     	leaq	0x156b2f5(%rip), %rsi   # 0x1469f49c0
1454896cb:     	movl	$0xaf, %ebx
1454896d0:     	movl	$0xaf, %edx
1454896d5:     	movq	%rsi, %rcx
1454896d8:     	callq	0x145457cb0 <.text+0x5456cb0>
1454896dd:     	nop
1454896de:     	movq	%rdx, %r8
1454896e1:     	testq	%rax, %rax
1454896e4:     	cmovneq	%rax, %rsi
1454896e8:     	cmoveq	%rbx, %r8
1454896ec:     	leaq	0x1550c05(%rip), %rax   # 0x1469da2f8
1454896f3:     	movq	%rax, 0xb0(%rbp)
1454896fa:     	movq	$0x1, 0xb8(%rbp)
145489705:     	leaq	0x1dc(%rbp), %rax
14548970c:     	movq	%rax, 0xc0(%rbp)
145489713:     	leaq	0x156b0a6(%rip), %rax   # 0x1469f47c0
14548971a:     	movq	%rax, 0xc8(%rbp)
145489721:     	leaq	0x156b199(%rip), %rax   # 0x1469f48c1
145489728:     	movq	%rax, 0xd0(%rbp)
14548972f:     	movq	$0x5, 0xd8(%rbp)
14548973a:     	leaq	0x18(%rbp), %rax
14548973e:     	movq	%rax, 0xe0(%rbp)
145489745:     	leaq	0x1550b8c(%rip), %rcx   # 0x1469da2d8
14548974c:     	movq	%rcx, 0xe8(%rbp)
145489753:     	leaq	0x156b16c(%rip), %rax   # 0x1469f48c6
14548975a:     	movq	%rax, 0xf0(%rbp)
145489761:     	movq	$0x3, 0xf8(%rbp)
14548976c:     	movq	%r15, 0x100(%rbp)
145489773:     	movq	%rcx, 0x108(%rbp)
14548977a:     	movq	$0x3, 0x20(%rsp)
145489783:     	leaq	0x90(%rbp), %rcx
14548978a:     	leaq	0xb0(%rbp), %r9
145489791:     	movq	%rsi, %rdx
145489794:     	callq	0x145458060 <.text+0x5457060>
145489799:     	nop
14548979a:     	jmp	0x1454898d6 <.text+0x54888d6>
14548979f:     	movl	$0x1, %eax
1454897a4:     	movq	%rbx, 0x1c0(%rbp)
1454897ab:     	movq	%rax, 0x1c8(%rbp)
1454897b2:     	movq	%rbx, 0x1d0(%rbp)
1454897b9:     	addss	%xmm7, %xmm7
1454897bd:     	leaq	0x1e0(%rbp), %rsi
1454897c4:     	movq	%rsi, %rcx
1454897c7:     	movaps	%xmm7, %xmm1
1454897ca:     	callq	0x14548d390 <.text+0x548c390>
1454897cf:     	nop
1454897d0:     	leaq	0x156b6f4(%rip), %rax   # 0x1469f4ecb
1454897d7:     	movq	%rax, 0xb0(%rbp)
1454897de:     	movq	$0x7, 0xb8(%rbp)
1454897e9:     	leaq	0x1c0(%rbp), %rax
1454897f0:     	movq	%rax, 0xc0(%rbp)
1454897f7:     	leaq	0x1550ada(%rip), %rcx   # 0x1469da2d8
1454897fe:     	movq	%rcx, 0xc8(%rbp)
145489805:     	leaq	0x156b0b5(%rip), %rax   # 0x1469f48c1
14548980c:     	movq	%rax, 0xd0(%rbp)
145489813:     	movq	$0x5, 0xd8(%rbp)
14548981e:     	leaq	0x18(%rbp), %rax
145489822:     	movq	%rax, 0xe0(%rbp)
145489829:     	movq	%rcx, 0xe8(%rbp)
145489830:     	leaq	0x156b08f(%rip), %rax   # 0x1469f48c6
145489837:     	movq	%rax, 0xf0(%rbp)
14548983e:     	movq	$0x3, 0xf8(%rbp)
145489849:     	movq	%r15, 0x100(%rbp)
145489850:     	movq	%rcx, 0x108(%rbp)
145489857:     	movq	%r14, 0x110(%rbp)
14548985e:     	movq	$0x3, 0x118(%rbp)
145489869:     	movq	%rsi, 0x120(%rbp)
145489870:     	movq	%rcx, 0x128(%rbp)
145489877:     	movq	$0x4, 0x20(%rsp)
145489880:     	leaq	0x90(%rbp), %rcx
145489887:     	leaq	0xb0(%rbp), %r9
14548988e:     	movq	%r12, %rdx
145489891:     	movq	%r13, %r8
145489894:     	callq	0x145458060 <.text+0x5457060>
145489899:     	nop
14548989a:     	movq	0x1e0(%rbp), %rdx
1454898a1:     	testq	%rdx, %rdx
1454898a4:     	je	0x1454898b8 <.text+0x54888b8>
1454898a6:     	movq	0x1e8(%rbp), %rcx
1454898ad:     	movl	$0x1, %r8d
1454898b3:     	callq	0x1400021d0 <.text+0x11d0>
1454898b8:     	movq	0x1c0(%rbp), %rdx
1454898bf:     	testq	%rdx, %rdx
1454898c2:     	je	0x1454898d6 <.text+0x54888d6>
1454898c4:     	movq	0x1c8(%rbp), %rcx
1454898cb:     	movl	$0x1, %r8d
1454898d1:     	callq	0x1400021d0 <.text+0x11d0>
1454898d6:     	movzbl	0x75(%rdi), %eax
1454898da:     	orl	$0x2, %eax
1454898dd:     	cmpl	$0xb, %eax
1454898e0:     	jne	0x1454899a5 <.text+0x54889a5>
1454898e6:     	movq	0xa0(%rbp), %rax
1454898ed:     	movq	0x8(%rbp), %rcx
1454898f1:     	movq	%rax, 0x10(%rcx)
1454898f5:     	movaps	0x90(%rbp), %xmm0
1454898fc:     	movups	%xmm0, (%rcx)
1454898ff:     	movq	-0x58(%rbp), %rdx
145489903:     	testq	%rdx, %rdx
145489906:     	je	0x145489917 <.text+0x5488917>
145489908:     	movq	-0x50(%rbp), %rcx
14548990c:     	movl	$0x1, %r8d
145489912:     	callq	0x1400021d0 <.text+0x11d0>
145489917:     	movq	0x18(%rbp), %rdx
14548991b:     	testq	%rdx, %rdx
14548991e:     	je	0x14548992f <.text+0x548892f>
145489920:     	movq	0x20(%rbp), %rcx
145489924:     	movl	$0x1, %r8d
14548992a:     	callq	0x1400021d0 <.text+0x11d0>
14548992f:     	movq	-0x40(%rbp), %rdx
145489933:     	testq	%rdx, %rdx
145489936:     	je	0x145489947 <.text+0x5488947>
145489938:     	movq	-0x38(%rbp), %rcx
14548993c:     	movl	$0x1, %r8d
145489942:     	callq	0x1400021d0 <.text+0x11d0>
145489947:     	movq	0x8(%rbp), %rax
14548994b:     	movaps	0x200(%rbp), %xmm6
145489952:     	movaps	0x210(%rbp), %xmm7
145489959:     	movaps	0x220(%rbp), %xmm8
145489961:     	movaps	0x230(%rbp), %xmm9
145489969:     	movaps	0x240(%rbp), %xmm10
145489971:     	movaps	0x250(%rbp), %xmm11
145489979:     	movaps	0x260(%rbp), %xmm12
145489981:     	movaps	0x270(%rbp), %xmm13
145489989:     	movaps	0x280(%rbp), %xmm14
145489991:     	addq	$0x318, %rsp            # imm = 0x318
145489998:     	popq	%rbx
145489999:     	popq	%rdi
14548999a:     	popq	%rsi
14548999b:     	popq	%r12
14548999d:     	popq	%r13
14548999f:     	popq	%r14
1454899a1:     	popq	%r15
1454899a3:     	popq	%rbp
1454899a4:     	retq
1454899a5:     	leaq	0x156b8aa(%rip), %rsi   # 0x1469f5256
1454899ac:     	movl	$0x1f, %ebx
1454899b1:     	movl	$0x1f, %edx
1454899b6:     	movq	%rsi, %rcx
1454899b9:     	callq	0x145457cb0 <.text+0x5456cb0>
1454899be:     	nop
1454899bf:     	testq	%rax, %rax
1454899c2:     	cmovneq	%rax, %rsi
1454899c6:     	cmoveq	%rbx, %rdx
1454899ca:     	movq	%rsi, 0x60(%rbp)
1454899ce:     	movq	%rdx, 0x68(%rbp)
1454899d2:     	movl	0x68(%rdi), %eax
1454899d5:     	leal	-0x1(%rax), %ecx
1454899d8:     	cmpl	$0x9, %ecx
1454899db:     	movq	0x1b8(%rbp), %r8
1454899e2:     	ja	0x145489b10 <.text+0x5488b10>
1454899e8:     	movss	0x50(%r8), %xmm7
1454899ee:     	leaq	0x156c0ef(%rip), %rdx   # 0x1469f5ae4
1454899f5:     	movslq	(%rdx,%rcx,4), %rcx
1454899f9:     	addq	%rdx, %rcx
1454899fc:     	jmpq	*%rcx
1454899fe:     	movss	0x6c(%rdi), %xmm7
145489a03:     	movss	0x70(%rdi), %xmm6
145489a08:     	mulss	0x48(%r8), %xmm6
145489a0e:     	leaq	0x156b860(%rip), %rdi   # 0x1469f5275
145489a15:     	movl	$0x1f, %edx
145489a1a:     	movq	%rdi, %rcx
145489a1d:     	callq	0x145457cb0 <.text+0x5456cb0>
145489a22:     	nop
145489a23:     	movq	%rax, %rsi
145489a26:     	movq	%rdx, %rbx
145489a29:     	mulss	0x47db0b(%rip), %xmm7   # 0x14590753c
145489a31:     	movss	%xmm7, 0x1e0(%rbp)
145489a39:     	leaq	0x1e0(%rbp), %rax
145489a40:     	movq	%rax, 0xb0(%rbp)
145489a47:     	leaq	0x2afca2(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145489a4e:     	movq	%rax, 0xb8(%rbp)
145489a55:     	leaq	0x156b579(%rip), %rdx   # 0x1469f4fd5
145489a5c:     	leaq	0x1c0(%rbp), %r14
145489a63:     	leaq	0xb0(%rbp), %r8
145489a6a:     	movq	%r14, %rcx
145489a6d:     	callq	0x145728390 <.text+0x5727390>
145489a72:     	nop
145489a73:     	leaq	0x1e0(%rbp), %r15
145489a7a:     	movq	%r15, %rcx
145489a7d:     	movaps	%xmm6, %xmm1
145489a80:     	callq	0x14548d390 <.text+0x548c390>
145489a85:     	nop
145489a86:     	testq	%rsi, %rsi
145489a89:     	movl	$0x1f, %eax
145489a8e:     	cmoveq	%rax, %rbx
145489a92:     	cmovneq	%rsi, %rdi
145489a96:     	leaq	0x156ace3(%rip), %rax   # 0x1469f4780
145489a9d:     	movq	%rax, 0xb0(%rbp)
145489aa4:     	movq	$0x1, 0xb8(%rbp)
145489aaf:     	movq	%r14, 0xc0(%rbp)
145489ab6:     	leaq	0x155081b(%rip), %rcx   # 0x1469da2d8
145489abd:     	movq	%rcx, 0xc8(%rbp)
145489ac4:     	leaq	0x156b7c9(%rip), %rax   # 0x1469f5294
145489acb:     	movq	%rax, 0xd0(%rbp)
145489ad2:     	movq	$0x1, 0xd8(%rbp)
145489add:     	movq	%r15, 0xe0(%rbp)
145489ae4:     	movq	%rcx, 0xe8(%rbp)
145489aeb:     	movq	$0x2, 0x20(%rsp)
145489af4:     	leaq	0x78(%rbp), %rcx
145489af8:     	leaq	0xb0(%rbp), %r9
145489aff:     	movq	%rdi, %rdx
145489b02:     	movq	%rbx, %r8
145489b05:     	callq	0x145458060 <.text+0x5457060>
145489b0a:     	nop
145489b0b:     	jmp	0x145489db5 <.text+0x5488db5>
145489b10:     	movss	0x6c(%rdi), %xmm7
145489b15:     	movl	%eax, %eax
145489b17:     	leaq	0x156bfee(%rip), %rcx   # 0x1469f5b0c
145489b1e:     	movslq	(%rcx,%rax,4), %rax
145489b22:     	addq	%rcx, %rax
145489b25:     	jmpq	*%rax
145489b27:     	leaq	0x156b7a3(%rip), %rsi   # 0x1469f52d1
145489b2e:     	movl	$0x2d, %edx
145489b33:     	movq	%rsi, %rcx
145489b36:     	callq	0x145457cb0 <.text+0x5456cb0>
145489b3b:     	nop
145489b3c:     	movq	%rax, %rbx
145489b3f:     	movq	%rdx, %rdi
145489b42:     	leaq	0x1e0(%rbp), %r14
145489b49:     	movq	%r14, %rcx
145489b4c:     	movaps	%xmm7, %xmm1
145489b4f:     	callq	0x14548d390 <.text+0x548c390>
145489b54:     	nop
145489b55:     	testq	%rbx, %rbx
145489b58:     	movl	$0x2d, %eax
145489b5d:     	cmoveq	%rax, %rdi
145489b61:     	cmovneq	%rbx, %rsi
145489b65:     	leaq	0x156b728(%rip), %rax   # 0x1469f5294
145489b6c:     	movq	%rax, 0xb0(%rbp)
145489b73:     	movq	$0x1, 0xb8(%rbp)
145489b7e:     	movq	%r14, 0xc0(%rbp)
145489b85:     	leaq	0x155074c(%rip), %rax   # 0x1469da2d8
145489b8c:     	movq	%rax, 0xc8(%rbp)
145489b93:     	movq	$0x1, 0x20(%rsp)
145489b9c:     	leaq	0x78(%rbp), %rcx
145489ba0:     	leaq	0xb0(%rbp), %r9
145489ba7:     	movq	%rsi, %rdx
145489baa:     	movq	%rdi, %r8
145489bad:     	callq	0x145458060 <.text+0x5457060>
145489bb2:     	nop
145489bb3:     	jmp	0x145489f82 <.text+0x5488f82>
145489bb8:     	movss	0x6c(%rdi), %xmm8
145489bbe:     	leaq	0x156b7ce(%rip), %rdi   # 0x1469f5393
145489bc5:     	movl	$0x51, %edx
145489bca:     	movq	%rdi, %rcx
145489bcd:     	callq	0x145457cb0 <.text+0x5456cb0>
145489bd2:     	nop
145489bd3:     	movq	%rax, %rsi
145489bd6:     	movq	%rdx, %rbx
145489bd9:     	mulss	%xmm8, %xmm7
145489bde:     	mulss	%xmm7, %xmm6
145489be2:     	leaq	0x1c0(%rbp), %r14
145489be9:     	movq	%r14, %rcx
145489bec:     	movaps	%xmm6, %xmm1
145489bef:     	callq	0x14548d390 <.text+0x548c390>
145489bf4:     	nop
145489bf5:     	mulss	0x48ec43(%rip), %xmm6   # 0x145918840
145489bfd:     	leaq	0x1e0(%rbp), %r15
145489c04:     	movq	%r15, %rcx
145489c07:     	movaps	%xmm6, %xmm1
145489c0a:     	callq	0x14548d390 <.text+0x548c390>
145489c0f:     	nop
145489c10:     	testq	%rsi, %rsi
145489c13:     	movl	$0x51, %eax
145489c18:     	cmoveq	%rax, %rbx
145489c1c:     	cmovneq	%rsi, %rdi
145489c20:     	leaq	0x15506d1(%rip), %rax   # 0x1469da2f8
145489c27:     	movq	%rax, 0xb0(%rbp)
145489c2e:     	movq	$0x1, 0xb8(%rbp)
145489c39:     	movq	%r14, 0xc0(%rbp)
145489c40:     	leaq	0x1550691(%rip), %rcx   # 0x1469da2d8
145489c47:     	movq	%rcx, 0xc8(%rbp)
145489c4e:     	leaq	0x156b78f(%rip), %rax   # 0x1469f53e4
145489c55:     	movq	%rax, 0xd0(%rbp)
145489c5c:     	movq	$0x3, 0xd8(%rbp)
145489c67:     	movq	%r15, 0xe0(%rbp)
145489c6e:     	movq	%rcx, 0xe8(%rbp)
145489c75:     	movq	$0x2, 0x20(%rsp)
145489c7e:     	leaq	0x78(%rbp), %rcx
145489c82:     	leaq	0xb0(%rbp), %r9
145489c89:     	movq	%rdi, %rdx
145489c8c:     	movq	%rbx, %r8
145489c8f:     	callq	0x145458060 <.text+0x5457060>
145489c94:     	nop
145489c95:     	jmp	0x145489db5 <.text+0x5488db5>
145489c9a:     	movss	0x6c(%rdi), %xmm8
145489ca0:     	movss	0x70(%rdi), %xmm6
145489ca5:     	mulss	0x48(%r8), %xmm6
145489cab:     	leaq	0x156b735(%rip), %rdi   # 0x1469f53e7
145489cb2:     	movl	$0x2e, %edx
145489cb7:     	movq	%rdi, %rcx
145489cba:     	callq	0x145457cb0 <.text+0x5456cb0>
145489cbf:     	nop
145489cc0:     	movq	%rax, %rsi
145489cc3:     	movq	%rdx, %r14
145489cc6:     	mulss	%xmm8, %xmm7
145489ccb:     	minss	0x47d851(%rip), %xmm7   # 0x145907524
145489cd3:     	mulss	0x47d861(%rip), %xmm7   # 0x14590753c
145489cdb:     	movss	%xmm7, 0x1e0(%rbp)
145489ce3:     	leaq	0x1e0(%rbp), %rax
145489cea:     	movq	%rax, 0xb0(%rbp)
145489cf1:     	leaq	0x2af9f8(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
145489cf8:     	movq	%rax, 0xb8(%rbp)
145489cff:     	leaq	0x156b2cf(%rip), %rdx   # 0x1469f4fd5
145489d06:     	leaq	0x1c0(%rbp), %rbx
145489d0d:     	leaq	0xb0(%rbp), %r8
145489d14:     	movq	%rbx, %rcx
145489d17:     	callq	0x145728390 <.text+0x5727390>
145489d1c:     	nop
145489d1d:     	leaq	0x1e0(%rbp), %r15
145489d24:     	movq	%r15, %rcx
145489d27:     	movaps	%xmm6, %xmm1
145489d2a:     	callq	0x14548d390 <.text+0x548c390>
145489d2f:     	nop
145489d30:     	testq	%rsi, %rsi
145489d33:     	movl	$0x2e, %eax
145489d38:     	cmoveq	%rax, %r14
145489d3c:     	cmovneq	%rsi, %rdi
145489d40:     	leaq	0x156aa39(%rip), %rax   # 0x1469f4780
145489d47:     	movq	%rax, 0xb0(%rbp)
145489d4e:     	movq	$0x1, 0xb8(%rbp)
145489d59:     	movq	%rbx, 0xc0(%rbp)
145489d60:     	leaq	0x1550571(%rip), %rcx   # 0x1469da2d8
145489d67:     	movq	%rcx, 0xc8(%rbp)
145489d6e:     	leaq	0x156b51f(%rip), %rax   # 0x1469f5294
145489d75:     	movq	%rax, 0xd0(%rbp)
145489d7c:     	movq	$0x1, 0xd8(%rbp)
145489d87:     	movq	%r15, 0xe0(%rbp)
145489d8e:     	movq	%rcx, 0xe8(%rbp)
145489d95:     	movq	$0x2, 0x20(%rsp)
145489d9e:     	leaq	0x78(%rbp), %rcx
145489da2:     	leaq	0xb0(%rbp), %r9
145489da9:     	movq	%rdi, %rdx
145489dac:     	movq	%r14, %r8
145489daf:     	callq	0x145458060 <.text+0x5457060>
145489db4:     	nop
145489db5:     	movq	0x1e0(%rbp), %rdx
145489dbc:     	testq	%rdx, %rdx
145489dbf:     	je	0x145489dd3 <.text+0x5488dd3>
145489dc1:     	movq	0x1e8(%rbp), %rcx
145489dc8:     	movl	$0x1, %r8d
145489dce:     	callq	0x1400021d0 <.text+0x11d0>
145489dd3:     	movq	0x1c0(%rbp), %rdx
145489dda:     	testq	%rdx, %rdx
145489ddd:     	je	0x145489fa0 <.text+0x5488fa0>
145489de3:     	movq	0x1c8(%rbp), %rcx
145489dea:     	jmp	0x145489f95 <.text+0x5488f95>
145489def:     	movss	0x6c(%rdi), %xmm6
145489df4:     	leaq	0x156b49a(%rip), %rsi   # 0x1469f5295
145489dfb:     	movl	$0x1c, %edx
145489e00:     	movq	%rsi, %rcx
145489e03:     	callq	0x145457cb0 <.text+0x5456cb0>
145489e08:     	nop
145489e09:     	movq	%rax, %rbx
145489e0c:     	movq	%rdx, %rdi
145489e0f:     	mulss	%xmm6, %xmm7
145489e13:     	leaq	0x1e0(%rbp), %r14
145489e1a:     	movq	%r14, %rcx
145489e1d:     	movaps	%xmm7, %xmm1
145489e20:     	callq	0x14548d390 <.text+0x548c390>
145489e25:     	nop
145489e26:     	testq	%rbx, %rbx
145489e29:     	movl	$0x1c, %eax
145489e2e:     	cmoveq	%rax, %rdi
145489e32:     	cmovneq	%rbx, %rsi
145489e36:     	leaq	0x156b457(%rip), %rax   # 0x1469f5294
145489e3d:     	movq	%rax, 0xb0(%rbp)
145489e44:     	movq	$0x1, 0xb8(%rbp)
145489e4f:     	movq	%r14, 0xc0(%rbp)
145489e56:     	leaq	0x155047b(%rip), %rax   # 0x1469da2d8
145489e5d:     	movq	%rax, 0xc8(%rbp)
145489e64:     	leaq	0x156b446(%rip), %rax   # 0x1469f52b1
145489e6b:     	movq	%rax, 0xd0(%rbp)
145489e72:     	movq	$0x4, 0xd8(%rbp)
145489e7d:     	leaq	0x60(%rbp), %rax
145489e81:     	movq	%rax, 0xe0(%rbp)
145489e88:     	leaq	0x1550519(%rip), %rax   # 0x1469da3a8
145489e8f:     	movq	%rax, 0xe8(%rbp)
145489e96:     	movq	$0x2, 0x20(%rsp)
145489e9f:     	leaq	0x78(%rbp), %rcx
145489ea3:     	leaq	0xb0(%rbp), %r9
145489eaa:     	movq	%rsi, %rdx
145489ead:     	movq	%rdi, %r8
145489eb0:     	callq	0x145458060 <.text+0x5457060>
145489eb5:     	nop
145489eb6:     	jmp	0x145489f82 <.text+0x5488f82>
145489ebb:     	movss	0x6c(%rdi), %xmm6
145489ec0:     	leaq	0x156b3ee(%rip), %rsi   # 0x1469f52b5
145489ec7:     	movl	$0x1c, %edx
145489ecc:     	movq	%rsi, %rcx
145489ecf:     	callq	0x145457cb0 <.text+0x5456cb0>
145489ed4:     	nop
145489ed5:     	movq	%rax, %rbx
145489ed8:     	movq	%rdx, %rdi
145489edb:     	mulss	%xmm6, %xmm7
145489edf:     	leaq	0x1e0(%rbp), %r14
145489ee6:     	movq	%r14, %rcx
145489ee9:     	movaps	%xmm7, %xmm1
145489eec:     	callq	0x14548d390 <.text+0x548c390>
145489ef1:     	nop
145489ef2:     	testq	%rbx, %rbx
145489ef5:     	movl	$0x1c, %eax
145489efa:     	cmoveq	%rax, %rdi
145489efe:     	cmovneq	%rbx, %rsi
145489f02:     	leaq	0x156b38b(%rip), %rax   # 0x1469f5294
145489f09:     	movq	%rax, 0xb0(%rbp)
145489f10:     	movq	$0x1, 0xb8(%rbp)
145489f1b:     	movq	%r14, 0xc0(%rbp)
145489f22:     	leaq	0x15503af(%rip), %rax   # 0x1469da2d8
145489f29:     	movq	%rax, 0xc8(%rbp)
145489f30:     	leaq	0x156b37a(%rip), %rax   # 0x1469f52b1
145489f37:     	movq	%rax, 0xd0(%rbp)
145489f3e:     	movq	$0x4, 0xd8(%rbp)
145489f49:     	leaq	0x60(%rbp), %rax
145489f4d:     	movq	%rax, 0xe0(%rbp)
145489f54:     	leaq	0x155044d(%rip), %rax   # 0x1469da3a8
145489f5b:     	movq	%rax, 0xe8(%rbp)
145489f62:     	movq	$0x2, 0x20(%rsp)
145489f6b:     	leaq	0x78(%rbp), %rcx
145489f6f:     	leaq	0xb0(%rbp), %r9
145489f76:     	movq	%rsi, %rdx
145489f79:     	movq	%rdi, %r8
145489f7c:     	callq	0x145458060 <.text+0x5457060>
145489f81:     	nop
145489f82:     	movq	0x1e0(%rbp), %rdx
145489f89:     	testq	%rdx, %rdx
145489f8c:     	je	0x145489fa0 <.text+0x5488fa0>
145489f8e:     	movq	0x1e8(%rbp), %rcx
145489f95:     	movl	$0x1, %r8d
145489f9b:     	callq	0x1400021d0 <.text+0x11d0>
145489fa0:     	movq	0x78(%rbp), %r14
145489fa4:     	cmpq	$-0x1, %r14
145489fa8:     	je	0x1454898e6 <.text+0x54888e6>
145489fae:     	movq	0x80(%rbp), %r15
145489fb5:     	movq	0x88(%rbp), %rdi
145489fbc:     	movq	0x90(%rbp), %rax
145489fc3:     	movq	0xa0(%rbp), %rbx
145489fca:     	cmpq	%rbx, %rax
145489fcd:     	je	0x14548a65a <.text+0x548965a>
145489fd3:     	movq	0x98(%rbp), %rcx
145489fda:     	movb	$0x20, (%rcx,%rbx)
145489fde:     	incq	%rbx
145489fe1:     	movq	%rbx, 0xa0(%rbp)
145489fe8:     	subq	%rbx, %rax
145489feb:     	cmpq	%rax, %rdi
145489fee:     	ja	0x14548a6a1 <.text+0x54896a1>
145489ff4:     	testq	%rdi, %rdi
145489ff7:     	je	0x14548a007 <.text+0x5489007>
145489ff9:     	addq	%rbx, %rcx
145489ffc:     	movq	%r15, %rdx
145489fff:     	movq	%rdi, %r8
14548a002:     	callq	0x1457731ed <.text+0x57721ed>
14548a007:     	addq	%rdi, %rbx
14548a00a:     	movq	%rbx, 0xa0(%rbp)
14548a011:     	testq	%r14, %r14
14548a014:     	je	0x1454898e6 <.text+0x54888e6>
14548a01a:     	movl	$0x1, %r8d
14548a020:     	movq	%r15, %rcx
14548a023:     	movq	%r14, %rdx
14548a026:     	callq	0x1400021d0 <.text+0x11d0>
14548a02b:     	jmp	0x1454898e6 <.text+0x54888e6>
14548a030:     	cmpb	$0x2, 0x75(%rdi)
14548a034:     	mulss	%xmm7, %xmm6
14548a038:     	jne	0x14548a20f <.text+0x548920f>
14548a03e:     	leaq	0x156b303(%rip), %rsi   # 0x1469f5348
14548a045:     	movl	$0x30, %edx
14548a04a:     	movq	%rsi, %rcx
14548a04d:     	callq	0x145457cb0 <.text+0x5456cb0>
14548a052:     	nop
14548a053:     	movq	%rax, %rbx
14548a056:     	movq	%rdx, %rdi
14548a059:     	leaq	0x1e0(%rbp), %r14
14548a060:     	movq	%r14, %rcx
14548a063:     	movaps	%xmm6, %xmm1
14548a066:     	callq	0x14548d390 <.text+0x548c390>
14548a06b:     	nop
14548a06c:     	testq	%rbx, %rbx
14548a06f:     	movl	$0x30, %eax
14548a074:     	cmoveq	%rax, %rdi
14548a078:     	cmovneq	%rbx, %rsi
14548a07c:     	leaq	0x1550275(%rip), %rax   # 0x1469da2f8
14548a083:     	movq	%rax, 0xb0(%rbp)
14548a08a:     	movq	$0x1, 0xb8(%rbp)
14548a095:     	movq	%r14, 0xc0(%rbp)
14548a09c:     	leaq	0x1550235(%rip), %rax   # 0x1469da2d8
14548a0a3:     	movq	%rax, 0xc8(%rbp)
14548a0aa:     	movq	$0x1, 0x20(%rsp)
14548a0b3:     	leaq	0x78(%rbp), %rcx
14548a0b7:     	leaq	0xb0(%rbp), %r9
14548a0be:     	movq	%rsi, %rdx
14548a0c1:     	movq	%rdi, %r8
14548a0c4:     	callq	0x145458060 <.text+0x5457060>
14548a0c9:     	nop
14548a0ca:     	jmp	0x145489f82 <.text+0x5488f82>
14548a0cf:     	ucomiss	0x47d3ba(%rip), %xmm7   # 0x145907490
14548a0d6:     	jae	0x14548a2a0 <.text+0x54892a0>
14548a0dc:     	leaq	0x156b21b(%rip), %rsi   # 0x1469f52fe
14548a0e3:     	movl	$0x27, %edx
14548a0e8:     	movq	%rsi, %rcx
14548a0eb:     	callq	0x145457cb0 <.text+0x5456cb0>
14548a0f0:     	nop
14548a0f1:     	movq	%rax, %rbx
14548a0f4:     	movq	%rdx, %rdi
14548a0f7:     	mulss	0x47d43d(%rip), %xmm7   # 0x14590753c
14548a0ff:     	movss	%xmm7, 0x1c0(%rbp)
14548a107:     	leaq	0x1c0(%rbp), %rax
14548a10e:     	movq	%rax, 0xb0(%rbp)
14548a115:     	leaq	0x2af5d4(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14548a11c:     	movq	%rax, 0xb8(%rbp)
14548a123:     	leaq	0x156aeab(%rip), %rdx   # 0x1469f4fd5
14548a12a:     	leaq	0x1e0(%rbp), %r14
14548a131:     	leaq	0xb0(%rbp), %r8
14548a138:     	movq	%r14, %rcx
14548a13b:     	callq	0x145728390 <.text+0x5727390>
14548a140:     	nop
14548a141:     	testq	%rbx, %rbx
14548a144:     	movl	$0x27, %eax
14548a149:     	cmoveq	%rax, %rdi
14548a14d:     	cmovneq	%rbx, %rsi
14548a151:     	leaq	0x156a628(%rip), %rax   # 0x1469f4780
14548a158:     	movq	%rax, 0xb0(%rbp)
14548a15f:     	movq	$0x1, 0xb8(%rbp)
14548a16a:     	movq	%r14, 0xc0(%rbp)
14548a171:     	leaq	0x1550160(%rip), %rax   # 0x1469da2d8
14548a178:     	movq	%rax, 0xc8(%rbp)
14548a17f:     	movq	$0x1, 0x20(%rsp)
14548a188:     	leaq	0x78(%rbp), %rcx
14548a18c:     	leaq	0xb0(%rbp), %r9
14548a193:     	movq	%rsi, %rdx
14548a196:     	movq	%rdi, %r8
14548a199:     	callq	0x145458060 <.text+0x5457060>
14548a19e:     	nop
14548a19f:     	jmp	0x145489f82 <.text+0x5488f82>
14548a1a4:     	movl	$0x1, %r13d
14548a1aa:     	movq	0x40(%rbp), %rbx
14548a1ae:     	testq	%rbx, %rbx
14548a1b1:     	jns	0x14548a1d2 <.text+0x54891d2>
14548a1b3:     	xorl	%r15d, %r15d
14548a1b6:     	movq	%r13, 0x8(%rbp)
14548a1ba:     	movq	%r15, %rcx
14548a1bd:     	movq	%rbx, %rdx
14548a1c0:     	movq	%r12, 0x1b8(%rbp)
14548a1c7:     	callq	0x14590379b <.text+0x590279b>
14548a1cc:     	nop
14548a1cd:     	jmp	0x14548a76a <.text+0x548976a>
14548a1d2:     	je	0x14548a320 <.text+0x5489320>
14548a1d8:     	movq	0x38(%rbp), %r14
14548a1dc:     	callq	0x140002200 <.text+0x1200>
14548a1e1:     	movl	$0x1, %r15d
14548a1e7:     	movl	$0x1, %edx
14548a1ec:     	movq	%rbx, %rcx
14548a1ef:     	callq	0x1400021c0 <.text+0x11c0>
14548a1f4:     	testq	%rax, %rax
14548a1f7:     	je	0x14548a1b6 <.text+0x54891b6>
14548a1f9:     	movq	%rax, %rsi
14548a1fc:     	movq	%rax, %rcx
14548a1ff:     	movq	%r14, %rdx
14548a202:     	movq	%rbx, %r8
14548a205:     	callq	0x1457731ed <.text+0x57721ed>
14548a20a:     	jmp	0x14548a325 <.text+0x5489325>
14548a20f:     	leaq	0x156b162(%rip), %rsi   # 0x1469f5378
14548a216:     	movl	$0x1b, %edx
14548a21b:     	movq	%rsi, %rcx
14548a21e:     	callq	0x145457cb0 <.text+0x5456cb0>
14548a223:     	nop
14548a224:     	movq	%rax, %rbx
14548a227:     	movq	%rdx, %rdi
14548a22a:     	leaq	0x1e0(%rbp), %r14
14548a231:     	movq	%r14, %rcx
14548a234:     	movaps	%xmm6, %xmm1
14548a237:     	callq	0x14548d390 <.text+0x548c390>
14548a23c:     	nop
14548a23d:     	testq	%rbx, %rbx
14548a240:     	movl	$0x1b, %eax
14548a245:     	cmoveq	%rax, %rdi
14548a249:     	cmovneq	%rbx, %rsi
14548a24d:     	leaq	0x15500a4(%rip), %rax   # 0x1469da2f8
14548a254:     	movq	%rax, 0xb0(%rbp)
14548a25b:     	movq	$0x1, 0xb8(%rbp)
14548a266:     	movq	%r14, 0xc0(%rbp)
14548a26d:     	leaq	0x1550064(%rip), %rax   # 0x1469da2d8
14548a274:     	movq	%rax, 0xc8(%rbp)
14548a27b:     	movq	$0x1, 0x20(%rsp)
14548a284:     	leaq	0x78(%rbp), %rcx
14548a288:     	leaq	0xb0(%rbp), %r9
14548a28f:     	movq	%rsi, %rdx
14548a292:     	movq	%rdi, %r8
14548a295:     	callq	0x145458060 <.text+0x5457060>
14548a29a:     	nop
14548a29b:     	jmp	0x145489f82 <.text+0x5488f82>
14548a2a0:     	leaq	0x156b07e(%rip), %rsi   # 0x1469f5325
14548a2a7:     	movl	$0x23, %ebx
14548a2ac:     	movl	$0x23, %edx
14548a2b1:     	movq	%rsi, %rcx
14548a2b4:     	callq	0x145457cb0 <.text+0x5456cb0>
14548a2b9:     	nop
14548a2ba:     	movq	%rdx, %rdi
14548a2bd:     	testq	%rax, %rax
14548a2c0:     	cmovneq	%rax, %rsi
14548a2c4:     	cmoveq	%rbx, %rdi
14548a2c8:     	movq	$0x1, 0x20(%rsp)
14548a2d1:     	leaq	0xb0(%rbp), %rcx
14548a2d8:     	movl	$0x1, %r9d
14548a2de:     	movq	%rdi, %rdx
14548a2e1:     	xorl	%r8d, %r8d
14548a2e4:     	callq	0x140188f20 <.text+0x187f20>
14548a2e9:     	movq	0xb8(%rbp), %r14
14548a2f0:     	cmpb	$0x0, 0xb0(%rbp)
14548a2f7:     	jne	0x14548a748 <.text+0x5489748>
14548a2fd:     	movq	0xc0(%rbp), %r15
14548a304:     	testq	%rdi, %rdi
14548a307:     	je	0x145489fbc <.text+0x5488fbc>
14548a30d:     	movq	%r15, %rcx
14548a310:     	movq	%rsi, %rdx
14548a313:     	movq	%rdi, %r8
14548a316:     	callq	0x1457731ed <.text+0x57721ed>
14548a31b:     	jmp	0x145489fbc <.text+0x5488fbc>
14548a320:     	movl	$0x1, %esi
14548a325:     	movq	%rbx, -0x20(%rbp)
14548a329:     	movq	%rsi, -0x18(%rbp)
14548a32d:     	movq	%rbx, -0x10(%rbp)
14548a331:     	jmp	0x145488250 <.text+0x5487250>
14548a336:     	leaq	0x156b379(%rip), %rsi   # 0x1469f56b6
14548a33d:     	movl	$0x52, %ebx
14548a342:     	movl	$0x52, %edx
14548a347:     	movq	%rsi, %rcx
14548a34a:     	callq	0x145457cb0 <.text+0x5456cb0>
14548a34f:     	nop
14548a350:     	movq	%rdx, %r8
14548a353:     	testq	%rax, %rax
14548a356:     	cmovneq	%rax, %rsi
14548a35a:     	cmoveq	%rbx, %r8
14548a35e:     	leaq	0x156a83e(%rip), %rax   # 0x1469f4ba3
14548a365:     	movq	%rax, 0xb0(%rbp)
14548a36c:     	movq	$0x3, 0xb8(%rbp)
14548a377:     	movq	%r14, 0xc0(%rbp)
14548a37e:     	leaq	0x154ff53(%rip), %rax   # 0x1469da2d8
14548a385:     	movq	%rax, 0xc8(%rbp)
14548a38c:     	movq	$0x1, 0x20(%rsp)
14548a395:     	leaq	0x90(%rbp), %rcx
14548a39c:     	leaq	0xb0(%rbp), %r9
14548a3a3:     	movq	%rsi, %rdx
14548a3a6:     	callq	0x145458060 <.text+0x5457060>
14548a3ab:     	nop
14548a3ac:     	jmp	0x145488f0c <.text+0x5487f0c>
14548a3b1:     	mulss	%xmm10, %xmm11
14548a3b6:     	xorps	%xmm7, %xmm7
14548a3b9:     	sqrtss	%xmm11, %xmm7
14548a3be:     	mulss	0x48e32a(%rip), %xmm7   # 0x1459186f0
14548a3c6:     	movaps	%xmm7, %xmm0
14548a3c9:     	mulss	%xmm9, %xmm0
14548a3ce:     	mulss	0x47d166(%rip), %xmm0   # 0x14590753c
14548a3d6:     	movss	%xmm0, 0x1e0(%rbp)
14548a3de:     	leaq	0x1e0(%rbp), %rax
14548a3e5:     	movq	%rax, 0xb0(%rbp)
14548a3ec:     	leaq	0x2af2fd(%rip), %rax    # 0x1457396f0 <.text+0x57386f0>
14548a3f3:     	movq	%rax, 0xb8(%rbp)
14548a3fa:     	leaq	0x156abd4(%rip), %rdx   # 0x1469f4fd5
14548a401:     	leaq	0x78(%rbp), %r15
14548a405:     	leaq	0xb0(%rbp), %r8
14548a40c:     	movq	%r15, %rcx
14548a40f:     	callq	0x145728390 <.text+0x5727390>
14548a414:     	nop
14548a415:     	movss	0x58(%rdi), %xmm0
14548a41a:     	xorps	%xmm1, %xmm1
14548a41d:     	ucomiss	%xmm1, %xmm0
14548a420:     	jbe	0x14548a49d <.text+0x548949d>
14548a422:     	leaq	0x156b128(%rip), %rsi   # 0x1469f5551
14548a429:     	movl	$0xe, %ebx
14548a42e:     	movl	$0xe, %edx
14548a433:     	movq	%rsi, %rcx
14548a436:     	callq	0x145457cb0 <.text+0x5456cb0>
14548a43b:     	nop
14548a43c:     	movq	%rdx, %r8
14548a43f:     	testq	%rax, %rax
14548a442:     	cmovneq	%rax, %rsi
14548a446:     	cmoveq	%rbx, %r8
14548a44a:     	leaq	0x156a752(%rip), %rax   # 0x1469f4ba3
14548a451:     	movq	%rax, 0xb0(%rbp)
14548a458:     	movq	$0x3, 0xb8(%rbp)
14548a463:     	movq	%r14, 0xc0(%rbp)
14548a46a:     	leaq	0x154fe67(%rip), %rax   # 0x1469da2d8
14548a471:     	movq	%rax, 0xc8(%rbp)
14548a478:     	movq	$0x1, 0x20(%rsp)
14548a481:     	leaq	0x1c0(%rbp), %rcx
14548a488:     	leaq	0xb0(%rbp), %r9
14548a48f:     	movq	%rsi, %rdx
14548a492:     	callq	0x145458060 <.text+0x5457060>
14548a497:     	nop
14548a498:     	jmp	0x14548a52a <.text+0x548952a>
14548a49d:     	leaq	0x156b0a6(%rip), %rsi   # 0x1469f554a
14548a4a4:     	movl	$0x7, %r14d
14548a4aa:     	movl	$0x7, %edx
14548a4af:     	movq	%rsi, %rcx
14548a4b2:     	callq	0x145457cb0 <.text+0x5456cb0>
14548a4b7:     	nop
14548a4b8:     	movq	%rdx, %rbx
14548a4bb:     	testq	%rax, %rax
14548a4be:     	cmovneq	%rax, %rsi
14548a4c2:     	cmoveq	%r14, %rbx
14548a4c6:     	movq	$0x1, 0x20(%rsp)
14548a4cf:     	leaq	0xb0(%rbp), %rcx
14548a4d6:     	movl	$0x1, %r9d
14548a4dc:     	movq	%rbx, %rdx
14548a4df:     	xorl	%r8d, %r8d
14548a4e2:     	callq	0x140188f20 <.text+0x187f20>
14548a4e7:     	movq	0xb8(%rbp), %r14
14548a4ee:     	cmpl	$0x1, 0xb0(%rbp)
14548a4f5:     	je	0x14548a75a <.text+0x548975a>
14548a4fb:     	movq	0xc0(%rbp), %r12
14548a502:     	testq	%rbx, %rbx
14548a505:     	je	0x14548a515 <.text+0x5489515>
14548a507:     	movq	%r12, %rcx
14548a50a:     	movq	%rsi, %rdx
14548a50d:     	movq	%rbx, %r8
14548a510:     	callq	0x1457731ed <.text+0x57721ed>
14548a515:     	movq	%r14, 0x1c0(%rbp)
14548a51c:     	movq	%r12, 0x1c8(%rbp)
14548a523:     	movq	%rbx, 0x1d0(%rbp)
14548a52a:     	leaq	0x156b02e(%rip), %rbx   # 0x1469f555f
14548a531:     	movl	$0x61, %edx
14548a536:     	movq	%rbx, %rcx
14548a539:     	callq	0x145457cb0 <.text+0x5456cb0>
14548a53e:     	nop
14548a53f:     	movq	%rax, %r14
14548a542:     	movq	%rdx, %rsi
14548a545:     	mulss	%xmm6, %xmm9
14548a54a:     	mulss	%xmm9, %xmm7
14548a54f:     	leaq	0x1e0(%rbp), %r12
14548a556:     	movq	%r12, %rcx
14548a559:     	movaps	%xmm7, %xmm1
14548a55c:     	callq	0x14548d390 <.text+0x548c390>
14548a561:     	nop
14548a562:     	testq	%r14, %r14
14548a565:     	movl	$0x61, %eax
14548a56a:     	cmoveq	%rax, %rsi
14548a56e:     	cmovneq	%r14, %rbx
14548a572:     	leaq	0x156b047(%rip), %rax   # 0x1469f55c0
14548a579:     	movq	%rax, 0xb0(%rbp)
14548a580:     	movq	$0x6, 0xb8(%rbp)
14548a58b:     	movq	%r12, 0xc0(%rbp)
14548a592:     	leaq	0x154fd3f(%rip), %rcx   # 0x1469da2d8
14548a599:     	movq	%rcx, 0xc8(%rbp)
14548a5a0:     	leaq	0x156b01f(%rip), %rax   # 0x1469f55c6
14548a5a7:     	movq	%rax, 0xd0(%rbp)
14548a5ae:     	movq	$0x5, 0xd8(%rbp)
14548a5b9:     	movq	%r15, 0xe0(%rbp)
14548a5c0:     	movq	%rcx, 0xe8(%rbp)
14548a5c7:     	leaq	0x156affd(%rip), %rax   # 0x1469f55cb
14548a5ce:     	movq	%rax, 0xf0(%rbp)
14548a5d5:     	movq	$0x4, 0xf8(%rbp)
14548a5e0:     	leaq	0x1c0(%rbp), %rax
14548a5e7:     	movq	%rax, 0x100(%rbp)
14548a5ee:     	movq	%rcx, 0x108(%rbp)
14548a5f5:     	movq	$0x3, 0x20(%rsp)
14548a5fe:     	leaq	0x90(%rbp), %rcx
14548a605:     	leaq	0xb0(%rbp), %r9
14548a60c:     	movq	%rbx, %rdx
14548a60f:     	movq	%rsi, %r8
14548a612:     	callq	0x145458060 <.text+0x5457060>
14548a617:     	nop
14548a618:     	movq	0x1c0(%rbp), %rdx
14548a61f:     	testq	%rdx, %rdx
14548a622:     	je	0x14548a636 <.text+0x5489636>
14548a624:     	movq	0x1c8(%rbp), %rcx
14548a62b:     	movl	$0x1, %r8d
14548a631:     	callq	0x1400021d0 <.text+0x11d0>
14548a636:     	movq	0x78(%rbp), %rdx
14548a63a:     	testq	%rdx, %rdx
14548a63d:     	je	0x145489535 <.text+0x5488535>
14548a643:     	movq	0x80(%rbp), %rcx
14548a64a:     	movl	$0x1, %r8d
14548a650:     	callq	0x1400021d0 <.text+0x11d0>
14548a655:     	jmp	0x145489535 <.text+0x5488535>
14548a65a:     	movq	%r15, 0x10(%rbp)
14548a65e:     	movq	%r14, 0x1b8(%rbp)
14548a665:     	movq	$0x1, 0x20(%rsp)
14548a66e:     	leaq	0x90(%rbp), %rcx
14548a675:     	movl	$0x1, %r8d
14548a67b:     	movl	$0x1, %r9d
14548a681:     	movq	%rbx, %rdx
14548a684:     	callq	0x1457744b0 <.text+0x57734b0>
14548a689:     	nop
14548a68a:     	movq	0x90(%rbp), %rax
14548a691:     	movq	0x1b8(%rbp), %r14
14548a698:     	movq	0x10(%rbp), %r15
14548a69c:     	jmp	0x145489fd3 <.text+0x5488fd3>
14548a6a1:     	movq	%r15, 0x10(%rbp)
14548a6a5:     	movq	%r14, 0x1b8(%rbp)
14548a6ac:     	movq	$0x1, 0x20(%rsp)
14548a6b5:     	leaq	0x90(%rbp), %rcx
14548a6bc:     	movl	$0x1, %r9d
14548a6c2:     	movq	%rbx, %rdx
14548a6c5:     	movq	%rdi, %r8
14548a6c8:     	callq	0x1457744b0 <.text+0x57734b0>
14548a6cd:     	nop
14548a6ce:     	movq	0x98(%rbp), %rcx
14548a6d5:     	movq	0xa0(%rbp), %rbx
14548a6dc:     	movq	0x1b8(%rbp), %r14
14548a6e3:     	movq	0x10(%rbp), %r15
14548a6e7:     	jmp	0x145489ff9 <.text+0x5488ff9>
14548a6ec:     	movq	$0x1, 0x20(%rsp)
14548a6f5:     	leaq	0x1e0(%rbp), %rcx
14548a6fc:     	movl	$0x1, %r9d
14548a702:     	movq	%rsi, %rdx
14548a705:     	movq	%rbx, %r8
14548a708:     	callq	0x1457744b0 <.text+0x57734b0>
14548a70d:     	nop
14548a70e:     	movq	0x1f0(%rbp), %rsi
14548a715:     	jmp	0x145487c43 <.text+0x5486c43>
14548a71a:     	movq	$0x1, 0x20(%rsp)
14548a723:     	leaq	0xb0(%rbp), %rcx
14548a72a:     	movl	$0x1, %r9d
14548a730:     	movq	%rsi, %rdx
14548a733:     	movq	%rbx, %r8
14548a736:     	callq	0x1457744b0 <.text+0x57734b0>
14548a73b:     	nop
14548a73c:     	movq	0xc0(%rbp), %rsi
14548a743:     	jmp	0x145488ec4 <.text+0x5487ec4>
14548a748:     	movq	0xc0(%rbp), %rdx
14548a74f:     	movq	%r14, %rcx
14548a752:     	callq	0x14590379b <.text+0x590279b>
14548a757:     	nop
14548a758:     	jmp	0x14548a76a <.text+0x548976a>
14548a75a:     	movq	0xc0(%rbp), %rdx
14548a761:     	movq	%r14, %rcx
14548a764:     	callq	0x14590379b <.text+0x590279b>
14548a769:     	nop
14548a76a:     	ud2
