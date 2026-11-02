
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454af732:     	movq	$0x0, 0x2f0(%rbp)
1454af73d:     	movq	$0x4, 0x2f8(%rbp)
1454af748:     	movq	$0x0, 0x300(%rbp)
1454af753:     	movq	$0x0, 0x2b8(%rbp)
1454af75e:     	movq	$0x4, 0x2c0(%rbp)
1454af769:     	movq	$0x0, 0x2c8(%rbp)
1454af774:     	movq	0x310(%r13), %r14
1454af77b:     	movq	0x318(%r13), %rax
1454af782:     	leaq	(%rax,%rax,2), %rax
1454af786:     	leaq	(%r14,%rax,8), %rdi
1454af78a:     	xorps	%xmm9, %xmm9
1454af78e:     	xorps	%xmm8, %xmm8
1454af792:     	jmp	0x1454af7b4 <.text+0x54ae7b4>
1454af794:     	nopw	%cs:(%rax,%rax)
1454af7a0:     	movq	0x2c0(%rbp), %rax
1454af7a7:     	movl	%ebx, (%rax,%rsi,4)
1454af7aa:     	incq	%rsi
1454af7ad:     	movq	%rsi, 0x2c8(%rbp)
1454af7b4:     	cmpq	%rdi, %r14
1454af7b7:     	je	0x1454af899 <.text+0x54ae899>
1454af7bd:     	movq	%r14, %rbx
1454af7c0:     	movss	0x14(%r14), %xmm0
1454af7c6:     	ucomiss	%xmm9, %xmm0
1454af7ca:     	jbe	0x1454af85b <.text+0x54ae85b>
1454af7d0:     	movss	0x10(%rbx), %xmm1
1454af7d5:     	subss	%xmm7, %xmm1
1454af7d9:     	movaps	%xmm1, %xmm2
1454af7dc:     	maxss	%xmm6, %xmm2
1454af7e0:     	movaps	%xmm2, %xmm3
1454af7e3:     	cmpunordss	%xmm2, %xmm3
1454af7e8:     	andps	%xmm3, %xmm1
1454af7eb:     	andnps	%xmm2, %xmm3
1454af7ee:     	orps	%xmm1, %xmm3
1454af7f1:     	movaps	%xmm6, %xmm10
1454af7f5:     	divss	%xmm3, %xmm10
1454af7fa:     	minss	0x457c8d(%rip), %xmm10  # 0x145907490
1454af803:     	mulss	%xmm0, %xmm10
1454af808:     	subss	%xmm10, %xmm0
1454af80d:     	movss	%xmm0, 0x14(%rbx)
1454af812:     	movl	0xc(%rbx), %r14d
1454af816:     	movq	0x300(%rbp), %rsi
1454af81d:     	cmpq	0x2f0(%rbp), %rsi
1454af824:     	jne	0x1454af83a <.text+0x54ae83a>
1454af826:     	movb	$0x1, 0x377(%rbp)
1454af82d:     	leaq	0x2f0(%rbp), %rcx
1454af834:     	callq	0x145780180 <.text+0x577f180>
1454af839:     	nop
1454af83a:     	addss	%xmm10, %xmm8
1454af83f:     	movq	0x2f8(%rbp), %rax
1454af846:     	movl	%r14d, (%rax,%rsi,8)
1454af84a:     	movss	%xmm10, 0x4(%rax,%rsi,8)
1454af851:     	incq	%rsi
1454af854:     	movq	%rsi, 0x300(%rbp)
1454af85b:     	leaq	0x18(%rbx), %r14
1454af85f:     	ucomiss	0x10(%rbx), %xmm7
1454af863:     	jb	0x1454af7b4 <.text+0x54ae7b4>
1454af869:     	movl	0xc(%rbx), %ebx
1454af86c:     	movq	0x2c8(%rbp), %rsi
1454af873:     	cmpq	0x2b8(%rbp), %rsi
1454af87a:     	jne	0x1454af7a0 <.text+0x54ae7a0>
1454af880:     	movb	$0x1, 0x377(%rbp)
1454af887:     	leaq	0x2b8(%rbp), %rcx
1454af88e:     	callq	0x145777a50 <.text+0x5776a50>
1454af893:     	nop
1454af894:     	jmp	0x1454af7a0 <.text+0x54ae7a0>
1454af899:     	movq	0x2c8(%rbp), %rax
1454af8a0:     	testq	%rax, %rax
1454af8a3:     	je	0x1454af9ee <.text+0x54ae9ee>
1454af8a9:     	movl	0x3f0(%r13), %ecx
1454af8b0:     	testl	%ecx, %ecx
1454af8b2:     	je	0x1454af987 <.text+0x54ae987>
1454af8b8:     	movss	0x3f4(%r13), %xmm0
1454af8c1:     	movq	0x2c0(%rbp), %r8
1454af8c8:     	movabsq	$0x1ffffffffffffff0, %r9 # imm = 0x1FFFFFFFFFFFFFF0
1454af8d2:     	andq	%rax, %r9
1454af8d5:     	leaq	(%r8,%r9,4), %rdx
1454af8d9:     	andl	$0xf, %eax
1454af8dc:     	movd	%ecx, %xmm1
1454af8e0:     	pshufd	$0x0, %xmm1, %xmm1      # xmm1 = xmm1[0,0,0,0]
1454af8e5:     	xorl	%r10d, %r10d
1454af8e8:     	nopl	(%rax,%rax)
1454af8f0:     	cmpq	%r10, %r9
1454af8f3:     	je	0x1454af93c <.text+0x54ae93c>
1454af8f5:     	movdqu	(%r8,%r10,4), %xmm2
1454af8fb:     	movdqu	0x10(%r8,%r10,4), %xmm3
1454af902:     	movdqu	0x20(%r8,%r10,4), %xmm4
1454af909:     	movdqu	0x30(%r8,%r10,4), %xmm5
1454af910:     	pcmpeqd	%xmm1, %xmm3
1454af914:     	pcmpeqd	%xmm1, %xmm2
1454af918:     	packssdw	%xmm3, %xmm2
1454af91c:     	pcmpeqd	%xmm1, %xmm4
1454af920:     	pcmpeqd	%xmm1, %xmm5
1454af924:     	packssdw	%xmm5, %xmm4
1454af928:     	packsswb	%xmm4, %xmm2
1454af92c:     	pmovmskb	%xmm2, %r11d
1454af931:     	addq	$0x10, %r10
1454af935:     	testl	%r11d, %r11d
1454af938:     	je	0x1454af8f0 <.text+0x54ae8f0>
1454af93a:     	jmp	0x1454af95f <.text+0x54ae95f>
1454af93c:     	shll	$0x2, %eax
1454af93f:     	xorl	%r8d, %r8d
1454af942:     	nopw	%cs:(%rax,%rax)
1454af950:     	cmpq	%r8, %rax
1454af953:     	je	0x1454af987 <.text+0x54ae987>
1454af955:     	cmpl	%ecx, (%rdx,%r8)
1454af959:     	leaq	0x4(%r8), %r8
1454af95d:     	jne	0x1454af950 <.text+0x54ae950>
1454af95f:     	movss	0x41c(%r13), %xmm1
1454af968:     	subss	%xmm0, %xmm1
1454af96c:     	xorps	%xmm0, %xmm0
1454af96f:     	maxss	%xmm0, %xmm1
1454af973:     	movss	%xmm1, 0x41c(%r13)
1454af97c:     	movq	$0x0, 0x3f0(%r13)
1454af987:     	movq	0x318(%r13), %rax
1454af98e:     	testq	%rax, %rax
1454af991:     	je	0x1454af9ce <.text+0x54ae9ce>
1454af993:     	movq	0x310(%r13), %rcx
1454af99a:     	leaq	0x28(%rcx), %r9
1454af99e:     	movq	%rax, %rdx
1454af9a1:     	negq	%rdx
1454af9a4:     	xorl	%r8d, %r8d
1454af9a7:     	nopw	(%rax,%rax)
1454af9b0:     	movss	-0x18(%r9), %xmm0
1454af9b6:     	ucomiss	%xmm7, %xmm0
1454af9b9:     	jbe	0x1454b38db <.text+0x54b28db>
1454af9bf:     	incq	%r8
1454af9c2:     	addq	$0x18, %r9
1454af9c6:     	movq	%rdx, %r10
1454af9c9:     	addq	%r8, %r10
1454af9cc:     	jne	0x1454af9b0 <.text+0x54ae9b0>
1454af9ce:     	movb	$0x1, 0x377(%rbp)
1454af9d5:     	movq	%r13, %rcx
1454af9d8:     	callq	0x1454a6a40 <.text+0x54a5a40>
1454af9dd:     	nop
1454af9de:     	movb	$0x1, 0x377(%rbp)
1454af9e5:     	movq	%r13, %rcx
1454af9e8:     	callq	0x14549e650 <.text+0x549d650>
1454af9ed:     	nop
1454af9ee:     	movss	0x494(%r13), %xmm9
1454af9f7:     	mulss	%xmm6, %xmm9
1454af9fc:     	movss	0x418(%r13), %xmm10
1454afa05:     	movss	0x470(%r13), %xmm7
1454afa0e:     	ucomiss	%xmm10, %xmm7
1454afa12:     	movaps	%xmm10, %xmm11
1454afa16:     	jbe	0x1454afc20 <.text+0x54aec20>
1454afa1c:     	movaps	%xmm9, %xmm1
1454afa20:     	addss	%xmm10, %xmm1
1454afa25:     	addss	%xmm8, %xmm1
1454afa2a:     	movaps	%xmm1, %xmm2
1454afa2d:     	minss	%xmm7, %xmm2
1454afa31:     	movaps	%xmm2, %xmm0
1454afa34:     	cmpunordss	%xmm2, %xmm0
1454afa39:     	andps	%xmm0, %xmm1
1454afa3c:     	andnps	%xmm2, %xmm0
1454afa3f:     	orps	%xmm1, %xmm0
1454afa42:     	movss	%xmm0, 0x418(%r13)
1454afa4b:     	xorps	%xmm11, %xmm11
1454afa4f:     	maxss	%xmm11, %xmm0
1454afa54:     	callq	0x14577327d <.text+0x577227d>
1454afa59:     	cvttss2si	%xmm0, %rax
1454afa5e:     	xorl	%ecx, %ecx
1454afa60:     	ucomiss	%xmm11, %xmm0
1454afa64:     	cmovbl	%ecx, %eax
1454afa67:     	ucomiss	0x457abe(%rip), %xmm0   # 0x14590752c
1454afa6e:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454afa74:     	cmovbel	%eax, %r8d
1454afa78:     	leaq	0x8d8(%r13), %rdi
1454afa7f:     	movq	0x8d8(%r13), %rax
1454afa86:     	testq	%rax, %rax
1454afa89:     	je	0x1454afaef <.text+0x54aeaef>
1454afa8b:     	movq	0x8e0(%r13), %rcx
1454afa92:     	movw	$0x16, %dx
1454afa96:     	movzwl	0x36(%rax), %r10d
1454afa9b:     	movl	%r10d, %r11d
1454afa9e:     	addl	%r11d, %r11d
1454afaa1:     	movq	$-0x1, %r9
1454afaa8:     	nopl	(%rax,%rax)
1454afab0:     	testq	%r11, %r11
1454afab3:     	je	0x1454afad8 <.text+0x54aead8>
1454afab5:     	cmpw	0x3a(%rax,%r9,2), %dx
1454afabb:     	seta	%bl
1454afabe:     	sbbb	$0x0, %bl
1454afac1:     	incq	%r9
1454afac4:     	addq	$-0x2, %r11
1454afac8:     	cmpb	$0x1, %bl
1454afacb:     	je	0x1454afab0 <.text+0x54aeab0>
1454afacd:     	movzbl	%bl, %r10d
1454afad1:     	testl	%r10d, %r10d
1454afad4:     	jne	0x1454afadb <.text+0x54aeadb>
1454afad6:     	jmp	0x1454afae8 <.text+0x54aeae8>
1454afad8:     	movq	%r10, %r9
1454afadb:     	subq	$0x1, %rcx
1454afadf:     	jb	0x1454afaf1 <.text+0x54aeaf1>
1454afae1:     	movq	0x50(%rax,%r9,8), %rax
1454afae6:     	jmp	0x1454afa96 <.text+0x54aea96>
1454afae8:     	movl	%r8d, 0x8(%rax,%r9,4)
1454afaed:     	jmp	0x1454afb37 <.text+0x54aeb37>
1454afaef:     	xorl	%eax, %eax
1454afaf1:     	movq	%rdi, 0xb0(%rbp)
1454afaf8:     	movq	%rax, 0xb8(%rbp)
1454afaff:     	movq	$0x0, 0xc0(%rbp)
1454afb0a:     	movq	%r9, 0xc8(%rbp)
1454afb11:     	movq	$0x16, 0xd0(%rbp)
1454afb1c:     	movb	$0x1, 0x377(%rbp)
1454afb23:     	leaq	0x240(%rbp), %rcx
1454afb2a:     	leaq	0xb0(%rbp), %rdx
1454afb31:     	callq	0x14552a730 <.text+0x5529730>
1454afb36:     	nop
1454afb37:     	movaps	%xmm7, %xmm0
1454afb3a:     	callq	0x14577327d <.text+0x577227d>
1454afb3f:     	cvttss2si	%xmm0, %rax
1454afb44:     	xorl	%ecx, %ecx
1454afb46:     	xorps	%xmm1, %xmm1
1454afb49:     	ucomiss	%xmm1, %xmm0
1454afb4c:     	cmovbl	%ecx, %eax
1454afb4f:     	ucomiss	0x4579d6(%rip), %xmm0   # 0x14590752c
1454afb56:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
1454afb5c:     	cmovbel	%eax, %r8d
1454afb60:     	movq	(%rdi), %rax
1454afb63:     	testq	%rax, %rax
1454afb66:     	je	0x1454afbcf <.text+0x54aebcf>
1454afb68:     	movq	0x8e0(%r13), %rcx
1454afb6f:     	movw	$0x1c, %dx
1454afb73:     	movzwl	0x36(%rax), %r10d
1454afb78:     	movl	%r10d, %r11d
1454afb7b:     	addl	%r11d, %r11d
1454afb7e:     	movq	$-0x1, %r9
1454afb85:     	nopw	%cs:(%rax,%rax)
1454afb90:     	testq	%r11, %r11
1454afb93:     	je	0x1454afbb8 <.text+0x54aebb8>
1454afb95:     	cmpw	0x3a(%rax,%r9,2), %dx
1454afb9b:     	seta	%bl
1454afb9e:     	sbbb	$0x0, %bl
1454afba1:     	incq	%r9
1454afba4:     	addq	$-0x2, %r11
1454afba8:     	cmpb	$0x1, %bl
1454afbab:     	je	0x1454afb90 <.text+0x54aeb90>
1454afbad:     	movzbl	%bl, %r10d
1454afbb1:     	testl	%r10d, %r10d
1454afbb4:     	jne	0x1454afbbb <.text+0x54aebbb>
1454afbb6:     	jmp	0x1454afbc8 <.text+0x54aebc8>
1454afbb8:     	movq	%r10, %r9
1454afbbb:     	subq	$0x1, %rcx
1454afbbf:     	jb	0x1454afbd1 <.text+0x54aebd1>
1454afbc1:     	movq	0x50(%rax,%r9,8), %rax
1454afbc6:     	jmp	0x1454afb73 <.text+0x54aeb73>
1454afbc8:     	movl	%r8d, 0x8(%rax,%r9,4)
1454afbcd:     	jmp	0x1454afc17 <.text+0x54aec17>
1454afbcf:     	xorl	%eax, %eax
1454afbd1:     	movq	%rdi, 0xb0(%rbp)
1454afbd8:     	movq	%rax, 0xb8(%rbp)
1454afbdf:     	movq	$0x0, 0xc0(%rbp)
1454afbea:     	movq	%r9, 0xc8(%rbp)
1454afbf1:     	movq	$0x1c, 0xd0(%rbp)
1454afbfc:     	movb	$0x1, 0x377(%rbp)
1454afc03:     	leaq	0x240(%rbp), %rcx
1454afc0a:     	leaq	0xb0(%rbp), %rdx
1454afc11:     	callq	0x14552a730 <.text+0x5529730>
1454afc16:     	nop
1454afc17:     	movss	0x418(%r13), %xmm11
1454afc20:     	movb	$0x1, 0x377(%rbp)
1454afc27:     	leaq	0x1546cca(%rip), %rdi   # 0x1469f68f8
1454afc2e:     	movl	$0xc, %edx
1454afc33:     	movq	%rdi, %rcx
1454afc36:     	callq	0x145457cb0 <.text+0x5456cb0>
1454afc3b:     	nop
1454afc3c:     	subss	%xmm10, %xmm11
1454afc41:     	xorps	%xmm7, %xmm7
1454afc44:     	maxss	%xmm7, %xmm11
1454afc49:     	movaps	%xmm9, %xmm0
1454afc4d:     	minss	%xmm11, %xmm0
1454afc52:     	ucomiss	%xmm0, %xmm7
1454afc55:     	jae	0x1454afcc2 <.text+0x54aecc2>
1454afc57:     	testq	%rax, %rax
1454afc5a:     	movl	$0xc, %ecx
1454afc5f:     	cmoveq	%rcx, %rdx
1454afc63:     	cmovneq	%rax, %rdi
1454afc67:     	movq	$-0x1, 0xb0(%rbp)
1454afc72:     	movq	%rdi, 0xb8(%rbp)
1454afc79:     	movq	%rdx, 0xc0(%rbp)
1454afc80:     	leaq	0x1546c7d(%rip), %rax   # 0x1469f6904
1454afc87:     	movq	%rax, 0xc8(%rbp)
1454afc8e:     	movq	$0x19, 0xd0(%rbp)
1454afc99:     	movb	$0x0, 0xd8(%rbp)
1454afca0:     	leaq	0x5f8(%r13), %rcx
1454afca7:     	xorps	%xmm2, %xmm2
1454afcaa:     	cvtss2sd	%xmm0, %xmm2
1454afcae:     	movb	$0x1, 0x377(%rbp)
1454afcb5:     	leaq	0xb0(%rbp), %rdx
1454afcbc:     	callq	0x1455021b0 <.text+0x55011b0>
1454afcc1:     	nop
1454afcc2:     	movb	$0x1, %r12b
1454afcc5:     	ucomiss	%xmm7, %xmm8
1454afcc9:     	jbe	0x1454aff2d <.text+0x54aef2d>
1454afccf:     	movss	0x418(%r13), %xmm0
1454afcd8:     	subss	%xmm10, %xmm0
1454afcdd:     	subss	%xmm9, %xmm0
1454afce2:     	xorps	%xmm9, %xmm9
1454afce6:     	xorps	%xmm1, %xmm1
1454afce9:     	maxss	%xmm0, %xmm1
1454afced:     	movaps	%xmm8, %xmm7
1454afcf1:     	minss	%xmm1, %xmm7
1454afcf5:     	movq	0x2f0(%rbp), %rax
1454afcfc:     	movq	%rax, 0x340(%rbp)
1454afd03:     	movq	0x2f8(%rbp), %rax
1454afd0a:     	movq	%rax, 0x358(%rbp)
1454afd11:     	movq	0x300(%rbp), %rax
1454afd18:     	testq	%rax, %rax
1454afd1b:     	je	0x1454afdfd <.text+0x54aedfd>
1454afd21:     	movq	0x358(%rbp), %r12
1454afd28:     	leaq	(%r12,%rax,8), %rbx
1454afd2c:     	movq	0x368(%rbp), %rax
1454afd33:     	leaq	0x5f8(%rax), %rdi
1454afd3a:     	leaq	0x1546d17(%rip), %r14   # 0x1469f6a58
1454afd41:     	movl	$0x5, %esi
1454afd46:     	leaq	0x1546d10(%rip), %r13   # 0x1469f6a5d
1454afd4d:     	leaq	0xb0(%rbp), %r15
1454afd54:     	jmp	0x1454afd8d <.text+0x54aed8d>
1454afd56:     	nopw	%cs:(%rax,%rax)
1454afd60:     	movq	%r15, %rcx
1454afd63:     	movq	0x368(%rbp), %rdx
1454afd6a:     	callq	0x1454a0520 <.text+0x549f520>
1454afd6f:     	nop
1454afd70:     	xorps	%xmm2, %xmm2
1454afd73:     	cvtss2sd	%xmm10, %xmm2
1454afd78:     	movq	%rdi, %rcx
1454afd7b:     	movq	%r15, %rdx
1454afd7e:     	callq	0x1455021b0 <.text+0x55011b0>
1454afd83:     	nop
1454afd84:     	addq	$0x8, %r12
1454afd88:     	cmpq	%rbx, %r12
1454afd8b:     	je	0x1454afdfd <.text+0x54aedfd>
1454afd8d:     	movss	0x4(%r12), %xmm10
1454afd94:     	mulss	%xmm7, %xmm10
1454afd99:     	divss	%xmm8, %xmm10
1454afd9e:     	ucomiss	%xmm10, %xmm9
1454afda2:     	jae	0x1454afd84 <.text+0x54aed84>
1454afda4:     	movl	(%r12), %r8d
1454afda8:     	testl	%r8d, %r8d
1454afdab:     	jne	0x1454afd60 <.text+0x54aed60>
1454afdad:     	movl	$0x5, %edx
1454afdb2:     	movq	%r14, %rcx
1454afdb5:     	callq	0x145457cb0 <.text+0x5456cb0>
1454afdba:     	nop
1454afdbb:     	testq	%rax, %rax
1454afdbe:     	cmoveq	%r14, %rax
1454afdc2:     	cmoveq	%rsi, %rdx
1454afdc6:     	movq	$-0x1, 0xb0(%rbp)
1454afdd1:     	movq	%rax, 0xb8(%rbp)
1454afdd8:     	movq	%rdx, 0xc0(%rbp)
1454afddf:     	movq	%r13, 0xc8(%rbp)
1454afde6:     	movq	$0x18, 0xd0(%rbp)
1454afdf1:     	movb	$0x0, 0xd8(%rbp)
1454afdf8:     	jmp	0x1454afd70 <.text+0x54aed70>
1454afdfd:     	movq	0x340(%rbp), %rdx
1454afe04:     	testq	%rdx, %rdx
1454afe07:     	je	0x1454afe1f <.text+0x54aee1f>
1454afe09:     	shlq	$0x3, %rdx
1454afe0d:     	movl	$0x4, %r8d
1454afe13:     	movq	0x358(%rbp), %rcx
1454afe1a:     	callq	0x1400021d0 <.text+0x11d0>
1454afe1f:     	subss	%xmm7, %xmm8
1454afe24:     	xorps	%xmm0, %xmm0
1454afe27:     	ucomiss	%xmm0, %xmm8
1454afe2b:     	movq	0x368(%rbp), %r13
1454afe32:     	jbe	0x1454afeb8 <.text+0x54aeeb8>
1454afe38:     	movq	0x710(%r13), %rcx
1454afe3f:     	movq	0x718(%r13), %rdx
1454afe46:     	shlq	$0x6, %rdx
1454afe4a:     	xorl	%eax, %eax
1454afe4c:     	xorl	%r8d, %r8d
1454afe4f:     	nop
1454afe50:     	cmpq	%r8, %rdx
1454afe53:     	je	0x1454afe76 <.text+0x54aee76>
1454afe55:     	leaq	0x40(%r8), %r9
1454afe59:     	cmpb	$0x14, (%rcx,%r8)
1454afe5e:     	movq	%r9, %r8
1454afe61:     	jne	0x1454afe50 <.text+0x54aee50>
1454afe63:     	movss	-0x3c(%rcx,%r9), %xmm1
1454afe6a:     	movl	$0x1, %eax
1454afe6f:     	cmpl	$0x1, %eax
1454afe72:     	je	0x1454afe7b <.text+0x54aee7b>
1454afe74:     	jmp	0x1454afeb8 <.text+0x54aeeb8>
1454afe76:     	cmpl	$0x1, %eax
1454afe79:     	jne	0x1454afeb8 <.text+0x54aeeb8>
1454afe7b:     	mulss	0x470(%r13), %xmm1
1454afe84:     	movss	0x41c(%r13), %xmm2
1454afe8d:     	ucomiss	%xmm2, %xmm1
1454afe90:     	jbe	0x1454afeb8 <.text+0x54aeeb8>
1454afe92:     	addss	%xmm8, %xmm2
1454afe97:     	movaps	%xmm2, %xmm3
1454afe9a:     	minss	%xmm1, %xmm3
1454afe9e:     	movaps	%xmm3, %xmm1
1454afea1:     	cmpunordss	%xmm3, %xmm1
1454afea6:     	andps	%xmm1, %xmm2
1454afea9:     	andnps	%xmm3, %xmm1
1454afeac:     	orps	%xmm2, %xmm1
1454afeaf:     	movss	%xmm1, 0x41c(%r13)
1454afeb8:     	addss	%xmm8, %xmm7
1454afebd:     	ucomiss	%xmm0, %xmm7
1454afec0:     	jbe	0x1454aff2a <.text+0x54aef2a>
1454afec2:     	movq	0x710(%r13), %rax
1454afec9:     	movq	0x718(%r13), %rcx
1454afed0:     	shlq	$0x6, %rcx
1454afed4:     	xorl	%edx, %edx
1454afed6:     	nopw	%cs:(%rax,%rax)
1454afee0:     	cmpq	%rdx, %rcx
1454afee3:     	je	0x1454aff01 <.text+0x54aef01>
1454afee5:     	cmpb	$0x15, (%rax,%rdx)
1454afee9:     	leaq	0x40(%rdx), %rdx
1454afeed:     	jne	0x1454afee0 <.text+0x54aeee0>
1454afeef:     	addss	0x120(%r13), %xmm7
1454afef8:     	movss	%xmm7, 0x120(%r13)
