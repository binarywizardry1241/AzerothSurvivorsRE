
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140399640:     	pushq	%rbp
140399641:     	pushq	%r15
140399643:     	pushq	%r14
140399645:     	pushq	%r12
140399647:     	pushq	%rsi
140399648:     	pushq	%rdi
140399649:     	pushq	%rbx
14039964a:     	subq	$0x6a0, %rsp            # imm = 0x6A0
140399651:     	leaq	0x80(%rsp), %rbp
140399659:     	movq	$-0x2, 0x618(%rbp)
140399664:     	movq	%rcx, %rsi
140399667:     	leaq	0x40(%rcx), %rdi
14039966b:     	leaq	0x5a8(%rcx), %r15
140399672:     	movq	%rdi, 0x5b8(%rbp)
140399679:     	movq	%r15, 0x5c0(%rbp)
140399680:     	movq	$0x0, 0x5a0(%rbp)
14039968b:     	movq	$0x8, 0x5a8(%rbp)
140399696:     	movq	$0x0, 0x5b0(%rbp)
1403996a1:     	cmpq	$0x0, 0x90(%rcx)
1403996a9:     	je	0x14039975b <.text+0x39875b>
1403996af:     	movabsq	$0x5a04a5c0f708fc7f, %rcx # imm = 0x5A04A5C0F708FC7F
1403996b9:     	movq	0x78(%rsi), %rax
1403996bd:     	movq	0x80(%rsi), %rdx
1403996c4:     	xorl	%r8d, %r8d
1403996c7:     	movdqa	0x55ab541(%rip), %xmm0  # 0x145944c10
1403996cf:     	pcmpeqd	%xmm1, %xmm1
1403996d3:     	movdqa	0x55b5bf5(%rip), %xmm2  # 0x14594f2d0
1403996db:     	andq	%rdx, %rcx
1403996de:     	movdqu	(%rax,%rcx), %xmm3
1403996e3:     	movdqa	%xmm3, %xmm4
1403996e7:     	pcmpeqb	%xmm0, %xmm4
1403996eb:     	pmovmskb	%xmm4, %r9d
1403996f0:     	testl	%r9d, %r9d
1403996f3:     	je	0x140399740 <.text+0x398740>
1403996f5:     	tzcntl	%r9d, %r10d
1403996fa:     	addq	%rcx, %r10
1403996fd:     	andq	%rdx, %r10
140399700:     	negq	%r10
140399703:     	leaq	(%r10,%r10,2), %r10
140399707:     	movdqu	-0x18(%rax,%r10,8), %xmm4
14039970e:     	pcmpeqb	%xmm2, %xmm4
140399712:     	pmovmskb	%xmm4, %r11d
140399717:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14039971e:     	je	0x14039980f <.text+0x39880f>
140399724:     	leal	-0x1(%r9), %r10d
140399728:     	andw	%r9w, %r10w
14039972c:     	movl	%r10d, %r9d
14039972f:     	jne	0x1403996f5 <.text+0x3986f5>
140399731:     	nopw	%cs:(%rax,%rax)
140399740:     	pcmpeqb	%xmm1, %xmm3
140399744:     	pmovmskb	%xmm3, %r9d
140399749:     	testl	%r9d, %r9d
14039974c:     	jne	0x14039975b <.text+0x39875b>
14039974e:     	addq	%r8, %rcx
140399751:     	addq	$0x10, %rcx
140399755:     	addq	$0x10, %r8
140399759:     	jmp	0x1403996db <.text+0x3986db>
14039975b:     	movzbl	0xa0(%rsi), %eax
140399762:     	movq	0xe0(%rsi), %rax
140399769:     	movq	0xe8(%rsi), %rcx
140399770:     	movabsq	$0x5a04a5c0f708fc7f, %rdx # imm = 0x5A04A5C0F708FC7F
14039977a:     	xorl	%r8d, %r8d
14039977d:     	movdqa	0x55ab48b(%rip), %xmm0  # 0x145944c10
140399785:     	pcmpeqd	%xmm1, %xmm1
140399789:     	movdqa	0x55b5b3f(%rip), %xmm2  # 0x14594f2d0
140399791:     	andq	%rcx, %rdx
140399794:     	movdqu	(%rax,%rdx), %xmm3
140399799:     	movdqa	%xmm3, %xmm4
14039979d:     	pcmpeqb	%xmm0, %xmm4
1403997a1:     	pmovmskb	%xmm4, %r11d
1403997a6:     	testl	%r11d, %r11d
1403997a9:     	je	0x1403997f0 <.text+0x3987f0>
1403997ab:     	tzcntl	%r11d, %r10d
1403997b0:     	addq	%rdx, %r10
1403997b3:     	andq	%rcx, %r10
1403997b6:     	movq	%r10, %rbx
1403997b9:     	shlq	$0x7, %rbx
1403997bd:     	movq	%rax, %r9
1403997c0:     	subq	%rbx, %r9
1403997c3:     	movdqu	-0x80(%r9), %xmm4
1403997c9:     	pcmpeqb	%xmm2, %xmm4
1403997cd:     	pmovmskb	%xmm4, %ebx
1403997d1:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
1403997d7:     	je	0x14039982c <.text+0x39882c>
1403997d9:     	leal	-0x1(%r11), %r9d
1403997dd:     	andw	%r11w, %r9w
1403997e1:     	movl	%r9d, %r11d
1403997e4:     	jne	0x1403997ab <.text+0x3987ab>
1403997e6:     	nopw	%cs:(%rax,%rax)
1403997f0:     	pcmpeqb	%xmm1, %xmm3
1403997f4:     	pmovmskb	%xmm3, %r9d
1403997f9:     	testl	%r9d, %r9d
1403997fc:     	jne	0x14039989f <.text+0x39889f>
140399802:     	addq	%r8, %rdx
140399805:     	addq	$0x10, %rdx
140399809:     	addq	$0x10, %r8
14039980d:     	jmp	0x140399791 <.text+0x398791>
14039980f:     	leaq	(%rax,%r10,8), %rax
140399813:     	movq	-0x8(%rax), %r14
140399817:     	movq	0x5a0(%rbp), %rdx
14039981e:     	testq	%rdx, %rdx
140399821:     	jne	0x14039993d <.text+0x39893d>
140399827:     	jmp	0x140399953 <.text+0x398953>
14039982c:     	leaq	-0x10(%r10), %rdx
140399830:     	andq	%rcx, %rdx
140399833:     	movdqu	(%rax,%rdx), %xmm0
140399838:     	pcmpeqd	%xmm1, %xmm1
14039983c:     	pcmpeqb	%xmm1, %xmm0
140399840:     	pmovmskb	%xmm0, %ecx
140399844:     	movdqu	(%rax,%r10), %xmm0
14039984a:     	pcmpeqb	%xmm1, %xmm0
14039984e:     	pmovmskb	%xmm0, %r8d
140399853:     	movw	$0x1f, %r11w
140399858:     	bsrw	%cx, %r11w
14039985d:     	xorl	$0xf, %r11d
140399861:     	orl	$0x10000, %r8d          # imm = 0x10000
140399868:     	tzcntl	%r8d, %r8d
14039986d:     	addl	%r11d, %r8d
140399870:     	movb	$-0x80, %cl
140399872:     	cmpw	$0xf, %r8w
140399877:     	ja	0x140399882 <.text+0x398882>
140399879:     	incq	0xf0(%rsi)
140399880:     	movb	$-0x1, %cl
140399882:     	movb	%cl, (%rax,%r10)
140399886:     	movb	%cl, 0x10(%rax,%rdx)
14039988a:     	decq	0xf8(%rsi)
140399891:     	movq	-0x70(%r9), %rax
140399895:     	cmpq	$0x2, %rax
140399899:     	jne	0x14039a487 <.text+0x399487>
14039989f:     	movq	(%r15), %r14
1403998a2:     	leaq	0x1(%r14), %rax
1403998a6:     	movq	%rax, (%r15)
1403998a9:     	movw	$0x100, 0x220(%rbp)     # imm = 0x100
1403998b2:     	movq	$0x1, 0x1d0(%rbp)
1403998bd:     	movdqu	0x55b5c0b(%rip), %xmm0  # 0x14594f4d0
1403998c5:     	movdqu	%xmm0, 0x1d8(%rbp)
1403998cd:     	movq	$0x8, 0x1f8(%rbp)
1403998d8:     	movq	$0x78, 0x200(%rbp)
1403998e3:     	leaq	-0x1e8e3a(%rip), %rax   # 0x1401b0ab0 <.text+0x1afab0>
1403998ea:     	movq	%rax, 0x218(%rbp)
1403998f1:     	movb	$0x1, 0x222(%rbp)
1403998f8:     	movq	$0x0, 0x1e8(%rbp)
140399903:     	movb	$0x2, 0x208(%rbp)
14039990a:     	leaq	0x1d0(%rbp), %r8
140399911:     	movq	%rdi, %rcx
140399914:     	movq	%r14, %rdx
140399917:     	callq	0x14004abc0 <.text+0x49bc0>
14039991c:     	nop
14039991d:     	leaq	0x78(%rsi), %rcx
140399921:     	leaq	0x55b5ba8(%rip), %rdx   # 0x14594f4d0
140399928:     	movq	%r14, %r8
14039992b:     	callq	0x14000e640 <.text+0xd640>
140399930:     	nop
140399931:     	movq	0x5a0(%rbp), %rdx
140399938:     	testq	%rdx, %rdx
14039993b:     	je	0x140399953 <.text+0x398953>
14039993d:     	movq	0x5a8(%rbp), %rcx
140399944:     	shlq	$0x3, %rdx
140399948:     	movl	$0x8, %r8d
14039994e:     	callq	0x1400021d0 <.text+0x11d0>
140399953:     	leaq	0x1d8(%rsi), %rbx
14039995a:     	cmpq	0x218(%rsi), %r14
140399961:     	jae	0x14039998c <.text+0x39898c>
140399963:     	movq	0x210(%rsi), %rax
14039996a:     	movq	(%rax,%r14,8), %rax
14039996e:     	testq	%rax, %rax
140399971:     	je	0x14039998c <.text+0x39898c>
140399973:     	movq	0x1e0(%rsi), %rcx
14039997a:     	notq	%rax
14039997d:     	imulq	$0x38, %rax, %rax
140399981:     	cmpb	$0x0, 0x30(%rcx,%rax)
140399986:     	jne	0x140399a5f <.text+0x398a5f>
14039998c:     	pxor	%xmm0, %xmm0
140399990:     	movdqu	%xmm0, 0x5a4(%rbp)
140399998:     	movq	$-0x1, 0x1d0(%rbp)
1403999a3:     	movq	$-0x1, 0x1e8(%rbp)
1403999ae:     	movl	$0x0, 0x218(%rbp)
1403999b8:     	movdqu	0x5a0(%rbp), %xmm0
1403999c0:     	movdqu	%xmm0, 0x21c(%rbp)
1403999c8:     	movl	0x5b0(%rbp), %eax
1403999ce:     	movl	%eax, 0x22c(%rbp)
1403999d4:     	movq	$0x0, 0x238(%rbp)
1403999df:     	movb	$0x0, 0x240(%rbp)
1403999e6:     	movl	$0xff000000, 0x242(%rbp) # imm = 0xFF000000
1403999f0:     	movb	$0x0, 0x246(%rbp)
1403999f7:     	movl	0x5b0(%rsi), %r12d
1403999fe:     	movq	%rsi, %rcx
140399a01:     	callq	0x144e76860 <.text+0x4e75860>
140399a06:     	movq	%r14, 0x160(%rbp)
140399a0d:     	leaq	0x160(%rbp), %r9
140399a14:     	movq	%rbx, %rcx
140399a17:     	movq	%r14, %rdx
140399a1a:     	movq	%rdi, %r8
140399a1d:     	callq	0x1400430d0 <.text+0x420d0>
140399a22:     	movq	%rax, %r14
140399a25:     	cmpb	$0x1, 0x30(%rax)
140399a29:     	jne	0x140399a3e <.text+0x398a3e>
140399a2b:     	leaq	0x1d0(%rbp), %r8
140399a32:     	movq	%r14, %rcx
140399a35:     	xorl	%edx, %edx
140399a37:     	callq	0x144e617b0 <.text+0x4e607b0>
140399a3c:     	jmp	0x140399a5b <.text+0x398a5b>
140399a3e:     	movq	0x8(%r14), %r8
140399a42:     	movq	0x10(%r14), %rcx
140399a46:     	leaq	0x1d0(%rbp), %rdx
140399a4d:     	callq	0x145756dd1 <.text+0x5755dd1>
140399a52:     	movl	%r12d, 0x28(%r14)
140399a56:     	movb	$0x1, 0x30(%r14)
140399a5b:     	movl	%r12d, 0x2c(%r14)
140399a5f:     	movq	%rdi, 0x5b8(%rbp)
140399a66:     	movq	%r15, 0x5c0(%rbp)
140399a6d:     	movq	$0x0, 0x5a0(%rbp)
140399a78:     	movq	$0x8, 0x5a8(%rbp)
140399a83:     	movq	$0x0, 0x5b0(%rbp)
140399a8e:     	cmpq	$0x0, 0x90(%rsi)
140399a96:     	je	0x140399b3b <.text+0x398b3b>
140399a9c:     	movabsq	$0x259b1a8fb48cf22, %rcx # imm = 0x259B1A8FB48CF22
140399aa6:     	movq	0x78(%rsi), %rax
140399aaa:     	movq	0x80(%rsi), %rdx
140399ab1:     	xorl	%r8d, %r8d
140399ab4:     	movdqa	0x5551bc4(%rip), %xmm0  # 0x1458eb680
140399abc:     	pcmpeqd	%xmm1, %xmm1
140399ac0:     	movdqa	0x55b5818(%rip), %xmm2  # 0x14594f2e0
140399ac8:     	andq	%rdx, %rcx
140399acb:     	movdqu	(%rax,%rcx), %xmm3
140399ad0:     	movdqa	%xmm3, %xmm4
140399ad4:     	pcmpeqb	%xmm0, %xmm4
140399ad8:     	pmovmskb	%xmm4, %r9d
140399add:     	testl	%r9d, %r9d
140399ae0:     	je	0x140399b20 <.text+0x398b20>
140399ae2:     	tzcntl	%r9d, %r10d
140399ae7:     	addq	%rcx, %r10
140399aea:     	andq	%rdx, %r10
140399aed:     	negq	%r10
140399af0:     	leaq	(%r10,%r10,2), %r10
140399af4:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140399afb:     	pcmpeqb	%xmm2, %xmm4
140399aff:     	pmovmskb	%xmm4, %r11d
140399b04:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140399b0b:     	je	0x140399bef <.text+0x398bef>
140399b11:     	leal	-0x1(%r9), %r10d
140399b15:     	andw	%r9w, %r10w
140399b19:     	movl	%r10d, %r9d
140399b1c:     	jne	0x140399ae2 <.text+0x398ae2>
140399b1e:     	nop
140399b20:     	pcmpeqb	%xmm1, %xmm3
140399b24:     	pmovmskb	%xmm3, %r9d
140399b29:     	testl	%r9d, %r9d
140399b2c:     	jne	0x140399b3b <.text+0x398b3b>
140399b2e:     	addq	%r8, %rcx
140399b31:     	addq	$0x10, %rcx
140399b35:     	addq	$0x10, %r8
140399b39:     	jmp	0x140399ac8 <.text+0x398ac8>
140399b3b:     	movzbl	0xa0(%rsi), %eax
140399b42:     	movq	0xe0(%rsi), %rax
140399b49:     	movq	0xe8(%rsi), %rcx
140399b50:     	movabsq	$0x259b1a8fb48cf22, %rdx # imm = 0x259B1A8FB48CF22
140399b5a:     	xorl	%r8d, %r8d
140399b5d:     	movdqa	0x5551b1b(%rip), %xmm0  # 0x1458eb680
140399b65:     	pcmpeqd	%xmm1, %xmm1
140399b69:     	movdqa	0x55b576f(%rip), %xmm2  # 0x14594f2e0
140399b71:     	andq	%rcx, %rdx
140399b74:     	movdqu	(%rax,%rdx), %xmm3
140399b79:     	movdqa	%xmm3, %xmm4
140399b7d:     	pcmpeqb	%xmm0, %xmm4
140399b81:     	pmovmskb	%xmm4, %r11d
140399b86:     	testl	%r11d, %r11d
140399b89:     	je	0x140399bd0 <.text+0x398bd0>
140399b8b:     	tzcntl	%r11d, %r10d
140399b90:     	addq	%rdx, %r10
140399b93:     	andq	%rcx, %r10
140399b96:     	movq	%r10, %r14
140399b99:     	shlq	$0x7, %r14
140399b9d:     	movq	%rax, %r9
140399ba0:     	subq	%r14, %r9
140399ba3:     	movdqu	-0x80(%r9), %xmm4
140399ba9:     	pcmpeqb	%xmm2, %xmm4
140399bad:     	pmovmskb	%xmm4, %r14d
140399bb2:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
140399bb9:     	je	0x140399c0c <.text+0x398c0c>
140399bbb:     	leal	-0x1(%r11), %r9d
140399bbf:     	andw	%r11w, %r9w
140399bc3:     	movl	%r9d, %r11d
140399bc6:     	jne	0x140399b8b <.text+0x398b8b>
140399bc8:     	nopl	(%rax,%rax)
140399bd0:     	pcmpeqb	%xmm1, %xmm3
140399bd4:     	pmovmskb	%xmm3, %r9d
140399bd9:     	testl	%r9d, %r9d
140399bdc:     	jne	0x140399c7f <.text+0x398c7f>
140399be2:     	addq	%r8, %rdx
140399be5:     	addq	$0x10, %rdx
140399be9:     	addq	$0x10, %r8
140399bed:     	jmp	0x140399b71 <.text+0x398b71>
140399bef:     	leaq	(%rax,%r10,8), %rax
140399bf3:     	movq	-0x8(%rax), %r14
140399bf7:     	movq	0x5a0(%rbp), %rdx
140399bfe:     	testq	%rdx, %rdx
140399c01:     	jne	0x140399d1a <.text+0x398d1a>
140399c07:     	jmp	0x140399d30 <.text+0x398d30>
140399c0c:     	leaq	-0x10(%r10), %rdx
140399c10:     	andq	%rcx, %rdx
140399c13:     	movdqu	(%rax,%rdx), %xmm0
140399c18:     	pcmpeqd	%xmm1, %xmm1
140399c1c:     	pcmpeqb	%xmm1, %xmm0
140399c20:     	pmovmskb	%xmm0, %ecx
140399c24:     	movdqu	(%rax,%r10), %xmm0
140399c2a:     	pcmpeqb	%xmm1, %xmm0
140399c2e:     	pmovmskb	%xmm0, %r8d
140399c33:     	movw	$0x1f, %r11w
140399c38:     	bsrw	%cx, %r11w
140399c3d:     	xorl	$0xf, %r11d
140399c41:     	orl	$0x10000, %r8d          # imm = 0x10000
140399c48:     	tzcntl	%r8d, %r8d
140399c4d:     	addl	%r11d, %r8d
140399c50:     	movb	$-0x80, %cl
140399c52:     	cmpw	$0xf, %r8w
140399c57:     	ja	0x140399c62 <.text+0x398c62>
140399c59:     	incq	0xf0(%rsi)
140399c60:     	movb	$-0x1, %cl
140399c62:     	movb	%cl, (%rax,%r10)
140399c66:     	movb	%cl, 0x10(%rax,%rdx)
140399c6a:     	decq	0xf8(%rsi)
140399c71:     	movq	-0x70(%r9), %rax
140399c75:     	cmpq	$0x2, %rax
140399c79:     	jne	0x14039a515 <.text+0x399515>
140399c7f:     	movq	(%r15), %r14
140399c82:     	leaq	0x1(%r14), %rax
140399c86:     	movq	%rax, (%r15)
140399c89:     	movw	$0x100, 0x220(%rbp)     # imm = 0x100
140399c92:     	movq	$0x1, 0x1d0(%rbp)
140399c9d:     	movdqu	0x55b581b(%rip), %xmm0  # 0x14594f4c0
140399ca5:     	movdqu	%xmm0, 0x1d8(%rbp)
140399cad:     	movq	$0x4, 0x1f8(%rbp)
140399cb8:     	movq	$0x4, 0x200(%rbp)
140399cc3:     	movq	$0x0, 0x218(%rbp)
140399cce:     	movb	$0x1, 0x222(%rbp)
140399cd5:     	movq	$0x0, 0x1e8(%rbp)
140399ce0:     	movb	$0x2, 0x208(%rbp)
140399ce7:     	leaq	0x1d0(%rbp), %r8
140399cee:     	movq	%rdi, %rcx
140399cf1:     	movq	%r14, %rdx
140399cf4:     	callq	0x14004abc0 <.text+0x49bc0>
140399cf9:     	nop
140399cfa:     	leaq	0x78(%rsi), %rcx
140399cfe:     	leaq	0x55b57bb(%rip), %rdx   # 0x14594f4c0
140399d05:     	movq	%r14, %r8
140399d08:     	callq	0x14000e640 <.text+0xd640>
140399d0d:     	nop
140399d0e:     	movq	0x5a0(%rbp), %rdx
140399d15:     	testq	%rdx, %rdx
140399d18:     	je	0x140399d30 <.text+0x398d30>
140399d1a:     	movq	0x5a8(%rbp), %rcx
140399d21:     	shlq	$0x3, %rdx
140399d25:     	movl	$0x8, %r8d
140399d2b:     	callq	0x1400021d0 <.text+0x11d0>
140399d30:     	cmpq	0x218(%rsi), %r14
140399d37:     	jae	0x140399d5e <.text+0x398d5e>
140399d39:     	movq	0x210(%rsi), %rax
140399d40:     	movq	(%rax,%r14,8), %rax
140399d44:     	testq	%rax, %rax
140399d47:     	je	0x140399d5e <.text+0x398d5e>
140399d49:     	movq	0x1e0(%rsi), %rcx
140399d50:     	notq	%rax
140399d53:     	imulq	$0x38, %rax, %rax
140399d57:     	cmpb	$0x0, 0x30(%rcx,%rax)
140399d5c:     	jne	0x140399dcf <.text+0x398dcf>
140399d5e:     	movl	$0x3f1c28f6, 0x5a0(%rbp) # imm = 0x3F1C28F6
140399d68:     	movl	0x5b0(%rsi), %r15d
140399d6f:     	movq	%rsi, %rcx
140399d72:     	callq	0x144e76860 <.text+0x4e75860>
140399d77:     	movq	%r14, 0x1d0(%rbp)
140399d7e:     	leaq	0x1d0(%rbp), %r9
140399d85:     	movq	%rbx, %rcx
140399d88:     	movq	%r14, %rdx
140399d8b:     	movq	%rdi, %r8
140399d8e:     	callq	0x1400430d0 <.text+0x420d0>
140399d93:     	movq	%rax, %rdi
140399d96:     	cmpb	$0x1, 0x30(%rax)
140399d9a:     	jne	0x140399daf <.text+0x398daf>
140399d9c:     	leaq	0x5a0(%rbp), %r8
140399da3:     	movq	%rdi, %rcx
140399da6:     	xorl	%edx, %edx
140399da8:     	callq	0x144e617b0 <.text+0x4e607b0>
140399dad:     	jmp	0x140399dcb <.text+0x398dcb>
140399daf:     	movq	0x8(%rdi), %r8
140399db3:     	movq	0x10(%rdi), %rcx
140399db7:     	leaq	0x5a0(%rbp), %rdx
140399dbe:     	callq	0x145756dd1 <.text+0x5755dd1>
140399dc3:     	movl	%r15d, 0x28(%rdi)
140399dc7:     	movb	$0x1, 0x30(%rdi)
140399dcb:     	movl	%r15d, 0x2c(%rdi)
140399dcf:     	callq	0x140002200 <.text+0x1200>
140399dd4:     	movl	$0x310, %ecx            # imm = 0x310
140399dd9:     	movl	$0x8, %edx
140399dde:     	callq	0x1400021c0 <.text+0x11c0>
140399de3:     	testq	%rax, %rax
140399de6:     	je	0x14039a5a3 <.text+0x3995a3>
140399dec:     	movq	%rax, 0x598(%rbp)
140399df3:     	movq	$-0x1, 0x1d0(%rbp)
140399dfe:     	movl	$0x0, 0x338(%rbp)
140399e08:     	movb	$0x0, 0x33c(%rbp)
140399e0f:     	callq	0x140002200 <.text+0x1200>
140399e14:     	movl	$0x170, %ecx            # imm = 0x170
140399e19:     	movl	$0x8, %edx
140399e1e:     	callq	0x1400021c0 <.text+0x11c0>
140399e23:     	testq	%rax, %rax
140399e26:     	je	0x14039a5b4 <.text+0x3995b4>
140399e2c:     	movq	%rax, %rdi
140399e2f:     	leaq	0x1d0(%rbp), %rdx
140399e36:     	movl	$0x170, %r8d            # imm = 0x170
140399e3c:     	movq	%rax, %rcx
140399e3f:     	callq	0x145756ddd <.text+0x5755ddd>
140399e44:     	nop
140399e45:     	leaq	0x55b6fdc(%rip), %r8    # 0x145950e28
140399e4c:     	leaq	0xf0(%rbp), %rcx
140399e53:     	movq	%rdi, %rdx
140399e56:     	callq	0x144e1b980 <.text+0x4e1a980>
140399e5b:     	nop
140399e5c:     	movq	$-0x1, 0x1d0(%rbp)
140399e67:     	movl	$0x0, 0x358(%rbp)
140399e71:     	movb	$0x0, 0x35c(%rbp)
140399e78:     	callq	0x140002200 <.text+0x1200>
140399e7d:     	movl	$0x190, %ecx            # imm = 0x190
140399e82:     	movl	$0x8, %edx
140399e87:     	callq	0x1400021c0 <.text+0x11c0>
140399e8c:     	testq	%rax, %rax
140399e8f:     	je	0x14039a5c6 <.text+0x3995c6>
140399e95:     	movq	%rax, %rdi
140399e98:     	leaq	0x1d0(%rbp), %rdx
140399e9f:     	movl	$0x190, %r8d            # imm = 0x190
140399ea5:     	movq	%rax, %rcx
140399ea8:     	callq	0x145756ddd <.text+0x5755ddd>
140399ead:     	nop
140399eae:     	leaq	0x55b7213(%rip), %r8    # 0x1459510c8
140399eb5:     	leaq	0x80(%rbp), %rcx
140399ebc:     	movq	%rdi, %rdx
140399ebf:     	callq	0x144e1b980 <.text+0x4e1a980>
140399ec4:     	nop
140399ec5:     	callq	0x140002200 <.text+0x1200>
140399eca:     	movl	$0x158, %ecx            # imm = 0x158
140399ecf:     	movl	$0x8, %edx
140399ed4:     	callq	0x1400021c0 <.text+0x11c0>
140399ed9:     	testq	%rax, %rax
140399edc:     	je	0x14039a5d8 <.text+0x3995d8>
140399ee2:     	movl	$0x0, (%rax)
140399ee8:     	movb	$0x0, 0x4(%rax)
140399eec:     	movq	$-0x1, 0x100(%rax)
140399ef7:     	leaq	0x55b7122(%rip), %r8    # 0x145951020
140399efe:     	leaq	0x10(%rbp), %rcx
140399f02:     	movq	%rax, %rdx
140399f05:     	callq	0x144e1b980 <.text+0x4e1a980>
140399f0a:     	nop
140399f0b:     	movq	$-0x1, 0x2c0(%rbp)
140399f16:     	movl	$0x0, 0x550(%rbp)
140399f20:     	movb	$0x0, 0x554(%rbp)
140399f27:     	callq	0x140002200 <.text+0x1200>
140399f2c:     	movl	$0x388, %ecx            # imm = 0x388
140399f31:     	movl	$0x8, %edx
140399f36:     	callq	0x1400021c0 <.text+0x11c0>
140399f3b:     	testq	%rax, %rax
140399f3e:     	je	0x14039a5ea <.text+0x3995ea>
140399f44:     	movq	%rax, %rdi
140399f47:     	leaq	0x1d0(%rbp), %rdx
140399f4e:     	movl	$0x388, %r8d            # imm = 0x388
140399f54:     	movq	%rax, %rcx
140399f57:     	callq	0x145756ddd <.text+0x5755ddd>
140399f5c:     	nop
140399f5d:     	leaq	0x55b6f6c(%rip), %r8    # 0x145950ed0
140399f64:     	leaq	-0x60(%rbp), %rcx
140399f68:     	movq	%rdi, %rdx
140399f6b:     	callq	0x144e1b980 <.text+0x4e1a980>
140399f70:     	nop
140399f71:     	movq	$-0x1, 0x2c0(%rbp)
140399f7c:     	movl	$0x0, 0x500(%rbp)
140399f86:     	movb	$0x0, 0x504(%rbp)
140399f8d:     	callq	0x140002200 <.text+0x1200>
140399f92:     	movl	$0x338, %ecx            # imm = 0x338
140399f97:     	movl	$0x8, %edx
140399f9c:     	callq	0x1400021c0 <.text+0x11c0>
140399fa1:     	testq	%rax, %rax
140399fa4:     	je	0x14039a5fc <.text+0x3995fc>
140399faa:     	movq	%rax, %rdi
140399fad:     	leaq	0x1d0(%rbp), %rdx
140399fb4:     	movl	$0x338, %r8d            # imm = 0x338
140399fba:     	movq	%rax, %rcx
140399fbd:     	callq	0x145756ddd <.text+0x5755ddd>
140399fc2:     	nop
140399fc3:     	leaq	0x55b6fae(%rip), %r8    # 0x145950f78
140399fca:     	leaq	0x160(%rbp), %rcx
140399fd1:     	movq	%rdi, %rdx
140399fd4:     	callq	0x144e1b980 <.text+0x4e1a980>
140399fd9:     	nop
140399fda:     	movq	$-0x1, 0x2d0(%rbp)
140399fe5:     	movl	$0x0, 0x1d0(%rbp)
140399fef:     	movb	$0x0, 0x1d4(%rbp)
140399ff6:     	callq	0x140002200 <.text+0x1200>
140399ffb:     	movl	$0x138, %ecx            # imm = 0x138
14039a000:     	movl	$0x8, %edx
14039a005:     	callq	0x1400021c0 <.text+0x11c0>
14039a00a:     	testq	%rax, %rax
14039a00d:     	je	0x14039a60e <.text+0x39960e>
14039a013:     	movq	%rax, %rdi
14039a016:     	leaq	0x1d0(%rbp), %rdx
14039a01d:     	movl	$0x138, %r8d            # imm = 0x138
14039a023:     	movq	%rax, %rcx
14039a026:     	callq	0x145756ddd <.text+0x5755ddd>
14039a02b:     	nop
14039a02c:     	leaq	0x55b6d4d(%rip), %r8    # 0x145950d80
14039a033:     	leaq	0x5a0(%rbp), %rcx
14039a03a:     	movq	%rdi, %rdx
14039a03d:     	callq	0x144e1b980 <.text+0x4e1a980>
14039a042:     	nop
14039a043:     	movq	$-0x1, 0x1d0(%rbp)
14039a04e:     	movl	$0x0, 0x590(%rbp)
14039a058:     	movb	$0x0, 0x594(%rbp)
14039a05f:     	callq	0x140002200 <.text+0x1200>
14039a064:     	movl	$0x3c8, %ecx            # imm = 0x3C8
14039a069:     	movl	$0x8, %edx
14039a06e:     	callq	0x1400021c0 <.text+0x11c0>
14039a073:     	testq	%rax, %rax
14039a076:     	je	0x14039a620 <.text+0x399620>
14039a07c:     	movq	%rax, %rdi
14039a07f:     	leaq	0x1d0(%rbp), %rdx
14039a086:     	movl	$0x3c8, %r8d            # imm = 0x3C8
14039a08c:     	movq	%rax, %rcx
14039a08f:     	callq	0x145756ddd <.text+0x5755ddd>
14039a094:     	nop
14039a095:     	leaq	0x55b70d4(%rip), %r8    # 0x145951170
14039a09c:     	leaq	0x1d0(%rbp), %rcx
14039a0a3:     	movq	%rdi, %rdx
14039a0a6:     	callq	0x144e1b980 <.text+0x4e1a980>
14039a0ab:     	nop
14039a0ac:     	movups	0x150(%rbp), %xmm0
14039a0b3:     	movq	0x598(%rbp), %rax
14039a0ba:     	movups	%xmm0, 0x60(%rax)
14039a0be:     	movups	0x140(%rbp), %xmm0
14039a0c5:     	movups	%xmm0, 0x50(%rax)
14039a0c9:     	movups	0x130(%rbp), %xmm0
14039a0d0:     	movups	%xmm0, 0x40(%rax)
14039a0d4:     	movups	0xf0(%rbp), %xmm0
14039a0db:     	movups	0x100(%rbp), %xmm1
14039a0e2:     	movups	0x110(%rbp), %xmm2
14039a0e9:     	movups	0x120(%rbp), %xmm3
14039a0f0:     	movups	%xmm3, 0x30(%rax)
14039a0f4:     	movups	%xmm2, 0x20(%rax)
14039a0f8:     	movups	%xmm1, 0x10(%rax)
14039a0fc:     	movups	%xmm0, (%rax)
14039a0ff:     	movups	0x80(%rbp), %xmm0
14039a106:     	movups	0x90(%rbp), %xmm1
14039a10d:     	movups	0xa0(%rbp), %xmm2
14039a114:     	movups	0xb0(%rbp), %xmm3
14039a11b:     	movups	%xmm0, 0x70(%rax)
14039a11f:     	movups	%xmm1, 0x80(%rax)
14039a126:     	movups	%xmm2, 0x90(%rax)
14039a12d:     	movups	%xmm3, 0xa0(%rax)
14039a134:     	movups	0xc0(%rbp), %xmm0
14039a13b:     	movups	%xmm0, 0xb0(%rax)
14039a142:     	movups	0xd0(%rbp), %xmm0
14039a149:     	movups	%xmm0, 0xc0(%rax)
14039a150:     	movups	0xe0(%rbp), %xmm0
14039a157:     	movups	%xmm0, 0xd0(%rax)
14039a15e:     	movups	0x70(%rbp), %xmm0
14039a162:     	movups	%xmm0, 0x140(%rax)
14039a169:     	movups	0x60(%rbp), %xmm0
14039a16d:     	movups	%xmm0, 0x130(%rax)
14039a174:     	movups	0x50(%rbp), %xmm0
14039a178:     	movups	%xmm0, 0x120(%rax)
14039a17f:     	movups	0x10(%rbp), %xmm0
14039a183:     	movups	0x20(%rbp), %xmm1
14039a187:     	movups	0x30(%rbp), %xmm2
14039a18b:     	movups	0x40(%rbp), %xmm3
14039a18f:     	movups	%xmm3, 0x110(%rax)
14039a196:     	movups	%xmm2, 0x100(%rax)
14039a19d:     	movups	%xmm1, 0xf0(%rax)
14039a1a4:     	movups	%xmm0, 0xe0(%rax)
14039a1ab:     	movups	-0x60(%rbp), %xmm0
14039a1af:     	movups	-0x50(%rbp), %xmm1
14039a1b3:     	movups	-0x40(%rbp), %xmm2
14039a1b7:     	movups	-0x30(%rbp), %xmm3
14039a1bb:     	movups	%xmm0, 0x150(%rax)
14039a1c2:     	movups	%xmm1, 0x160(%rax)
14039a1c9:     	movups	%xmm2, 0x170(%rax)
14039a1d0:     	movups	%xmm3, 0x180(%rax)
14039a1d7:     	movups	-0x20(%rbp), %xmm0
14039a1db:     	movups	%xmm0, 0x190(%rax)
14039a1e2:     	movups	-0x10(%rbp), %xmm0
14039a1e6:     	movups	%xmm0, 0x1a0(%rax)
14039a1ed:     	movups	(%rbp), %xmm0
14039a1f1:     	movups	%xmm0, 0x1b0(%rax)
14039a1f8:     	movups	0x160(%rbp), %xmm0
14039a1ff:     	movups	0x170(%rbp), %xmm1
14039a206:     	movups	0x180(%rbp), %xmm2
14039a20d:     	movups	0x190(%rbp), %xmm3
14039a214:     	movups	%xmm0, 0x1c0(%rax)
14039a21b:     	movups	%xmm1, 0x1d0(%rax)
14039a222:     	movups	%xmm2, 0x1e0(%rax)
14039a229:     	movups	%xmm3, 0x1f0(%rax)
14039a230:     	movups	0x1a0(%rbp), %xmm0
14039a237:     	movups	%xmm0, 0x200(%rax)
14039a23e:     	movups	0x1c0(%rbp), %xmm0
14039a245:     	movups	%xmm0, 0x220(%rax)
14039a24c:     	movups	0x1b0(%rbp), %xmm0
14039a253:     	movups	%xmm0, 0x210(%rax)
14039a25a:     	movups	0x600(%rbp), %xmm0
14039a261:     	movups	%xmm0, 0x290(%rax)
14039a268:     	movups	0x5f0(%rbp), %xmm0
14039a26f:     	movups	%xmm0, 0x280(%rax)
14039a276:     	movups	0x5e0(%rbp), %xmm0
14039a27d:     	movups	%xmm0, 0x270(%rax)
14039a284:     	movups	0x5a0(%rbp), %xmm0
14039a28b:     	movups	0x5b0(%rbp), %xmm1
14039a292:     	movups	0x5c0(%rbp), %xmm2
14039a299:     	movups	0x5d0(%rbp), %xmm3
14039a2a0:     	movups	%xmm3, 0x260(%rax)
14039a2a7:     	movups	%xmm2, 0x250(%rax)
14039a2ae:     	movups	%xmm1, 0x240(%rax)
14039a2b5:     	movups	%xmm0, 0x230(%rax)
14039a2bc:     	movups	0x1d0(%rbp), %xmm0
14039a2c3:     	movups	0x1e0(%rbp), %xmm1
14039a2ca:     	movups	0x1f0(%rbp), %xmm2
14039a2d1:     	movups	0x200(%rbp), %xmm3
14039a2d8:     	movups	%xmm0, 0x2a0(%rax)
14039a2df:     	movups	%xmm1, 0x2b0(%rax)
14039a2e6:     	movups	%xmm2, 0x2c0(%rax)
14039a2ed:     	movups	%xmm3, 0x2d0(%rax)
14039a2f4:     	movups	0x210(%rbp), %xmm0
14039a2fb:     	movups	%xmm0, 0x2e0(%rax)
14039a302:     	movups	0x220(%rbp), %xmm0
14039a309:     	movups	%xmm0, 0x2f0(%rax)
14039a310:     	movups	0x230(%rbp), %xmm0
14039a317:     	movups	%xmm0, 0x300(%rax)
14039a31e:     	movq	$0x7, 0x1d8(%rbp)
14039a329:     	movq	%rax, 0x1e0(%rbp)
14039a330:     	movq	$0x7, 0x1e8(%rbp)
14039a33b:     	movq	$0x0, 0x1f0(%rbp)
14039a346:     	movq	$0x8, 0x1f8(%rbp)
14039a351:     	xorps	%xmm0, %xmm0
14039a354:     	movups	%xmm0, 0x200(%rbp)
14039a35b:     	movq	$-0x1, 0x1d0(%rbp)
14039a366:     	leaq	0x208(%rbp), %rcx
14039a36d:     	callq	0x144e8e920 <.text+0x4e8d920>
14039a372:     	nop
14039a373:     	movups	0x230(%rbp), %xmm0
14039a37a:     	movaps	%xmm0, 0x600(%rbp)
14039a381:     	movups	0x220(%rbp), %xmm0
14039a388:     	movaps	%xmm0, 0x5f0(%rbp)
14039a38f:     	movups	0x210(%rbp), %xmm0
14039a396:     	movaps	%xmm0, 0x5e0(%rbp)
14039a39d:     	movups	0x1d0(%rbp), %xmm0
14039a3a4:     	movups	0x1e0(%rbp), %xmm1
14039a3ab:     	movups	0x1f0(%rbp), %xmm2
14039a3b2:     	movups	0x200(%rbp), %xmm3
14039a3b9:     	movaps	%xmm3, 0x5d0(%rbp)
14039a3c0:     	movaps	%xmm2, 0x5c0(%rbp)
14039a3c7:     	movaps	%xmm1, 0x5b0(%rbp)
14039a3ce:     	movaps	%xmm0, 0x5a0(%rbp)
14039a3d5:     	movq	0x7645774(%rip), %rcx   # 0x1479dfb50
14039a3dc:     	leaq	0x55573c5(%rip), %r8    # 0x1458f17a8
14039a3e3:     	leaq	0x617(%rbp), %rdx
14039a3ea:     	callq	0x1400be670 <.text+0xbd670>
14039a3ef:     	nop
14039a3f0:     	movq	%rdx, %r8
14039a3f3:     	leaq	0x5a0(%rbp), %rcx
14039a3fa:     	movq	%rax, %rdx
14039a3fd:     	callq	0x14000d0b0 <.text+0xc0b0>
14039a402:     	nop
14039a403:     	movaps	0x600(%rbp), %xmm0
14039a40a:     	movaps	%xmm0, 0x230(%rbp)
14039a411:     	movaps	0x5f0(%rbp), %xmm0
14039a418:     	movaps	%xmm0, 0x220(%rbp)
14039a41f:     	movaps	0x5e0(%rbp), %xmm0
14039a426:     	movaps	%xmm0, 0x210(%rbp)
14039a42d:     	movaps	0x5a0(%rbp), %xmm0
14039a434:     	movaps	0x5b0(%rbp), %xmm1
14039a43b:     	movaps	0x5c0(%rbp), %xmm2
14039a442:     	movaps	0x5d0(%rbp), %xmm3
14039a449:     	movaps	%xmm3, 0x200(%rbp)
14039a450:     	movaps	%xmm2, 0x1f0(%rbp)
14039a457:     	movaps	%xmm1, 0x1e0(%rbp)
14039a45e:     	movaps	%xmm0, 0x1d0(%rbp)
14039a465:     	leaq	0x1d0(%rbp), %rdx
14039a46c:     	movq	%rsi, %rcx
14039a46f:     	callq	0x1400034a0 <.text+0x24a0>
14039a474:     	nop
14039a475:     	addq	$0x6a0, %rsp            # imm = 0x6A0
14039a47c:     	popq	%rbx
14039a47d:     	popq	%rdi
14039a47e:     	popq	%rsi
14039a47f:     	popq	%r12
14039a481:     	popq	%r14
14039a483:     	popq	%r15
14039a485:     	popq	%rbp
14039a486:     	retq
14039a487:     	movq	-0x8(%r9), %rcx
14039a48b:     	movq	%rcx, 0x238(%rbp)
14039a492:     	movups	-0x18(%r9), %xmm0
14039a497:     	movups	%xmm0, 0x228(%rbp)
14039a49e:     	movups	-0x28(%r9), %xmm0
14039a4a3:     	movups	%xmm0, 0x218(%rbp)
14039a4aa:     	movdqu	-0x68(%r9), %xmm0
14039a4b0:     	movdqu	-0x58(%r9), %xmm1
14039a4b6:     	movdqu	-0x48(%r9), %xmm2
14039a4bc:     	movdqu	-0x38(%r9), %xmm3
14039a4c2:     	movdqu	%xmm3, 0x208(%rbp)
14039a4ca:     	movdqu	%xmm2, 0x1f8(%rbp)
14039a4d2:     	movdqu	%xmm1, 0x1e8(%rbp)
14039a4da:     	movdqu	%xmm0, 0x1d8(%rbp)
14039a4e2:     	movq	%rax, 0x1d0(%rbp)
14039a4e9:     	leaq	0x1d0(%rbp), %rcx
14039a4f0:     	leaq	0x5a0(%rbp), %rdx
14039a4f7:     	callq	0x144e04c70 <.text+0x4e03c70>
14039a4fc:     	nop
14039a4fd:     	movq	%rax, %r14
14039a500:     	movq	0x5a0(%rbp), %rdx
14039a507:     	testq	%rdx, %rdx
14039a50a:     	jne	0x14039993d <.text+0x39893d>
14039a510:     	jmp	0x140399953 <.text+0x398953>
14039a515:     	movq	-0x8(%r9), %rcx
14039a519:     	movq	%rcx, 0x238(%rbp)
14039a520:     	movups	-0x18(%r9), %xmm0
14039a525:     	movups	%xmm0, 0x228(%rbp)
14039a52c:     	movups	-0x28(%r9), %xmm0
14039a531:     	movups	%xmm0, 0x218(%rbp)
14039a538:     	movdqu	-0x68(%r9), %xmm0
14039a53e:     	movdqu	-0x58(%r9), %xmm1
14039a544:     	movdqu	-0x48(%r9), %xmm2
14039a54a:     	movdqu	-0x38(%r9), %xmm3
14039a550:     	movdqu	%xmm3, 0x208(%rbp)
14039a558:     	movdqu	%xmm2, 0x1f8(%rbp)
14039a560:     	movdqu	%xmm1, 0x1e8(%rbp)
14039a568:     	movdqu	%xmm0, 0x1d8(%rbp)
14039a570:     	movq	%rax, 0x1d0(%rbp)
14039a577:     	leaq	0x1d0(%rbp), %rcx
14039a57e:     	leaq	0x5a0(%rbp), %rdx
14039a585:     	callq	0x144e04c70 <.text+0x4e03c70>
14039a58a:     	nop
14039a58b:     	movq	%rax, %r14
14039a58e:     	movq	0x5a0(%rbp), %rdx
14039a595:     	testq	%rdx, %rdx
14039a598:     	jne	0x140399d1a <.text+0x398d1a>
14039a59e:     	jmp	0x140399d30 <.text+0x398d30>
14039a5a3:     	movl	$0x8, %ecx
14039a5a8:     	movl	$0x310, %edx            # imm = 0x310
14039a5ad:     	callq	0x1458e7201 <.text+0x58e6201>
14039a5b2:     	ud2
14039a5b4:     	movl	$0x8, %ecx
14039a5b9:     	movl	$0x170, %edx            # imm = 0x170
14039a5be:     	callq	0x1458e7201 <.text+0x58e6201>
14039a5c3:     	nop
14039a5c4:     	jmp	0x14039a630 <.text+0x399630>
14039a5c6:     	movl	$0x8, %ecx
14039a5cb:     	movl	$0x190, %edx            # imm = 0x190
14039a5d0:     	callq	0x1458e7201 <.text+0x58e6201>
14039a5d5:     	nop
14039a5d6:     	jmp	0x14039a630 <.text+0x399630>
14039a5d8:     	movl	$0x8, %ecx
14039a5dd:     	movl	$0x158, %edx            # imm = 0x158
14039a5e2:     	callq	0x1458e7201 <.text+0x58e6201>
14039a5e7:     	nop
14039a5e8:     	jmp	0x14039a630 <.text+0x399630>
14039a5ea:     	movl	$0x8, %ecx
14039a5ef:     	movl	$0x388, %edx            # imm = 0x388
14039a5f4:     	callq	0x1458e7201 <.text+0x58e6201>
14039a5f9:     	nop
14039a5fa:     	jmp	0x14039a630 <.text+0x399630>
14039a5fc:     	movl	$0x8, %ecx
14039a601:     	movl	$0x338, %edx            # imm = 0x338
14039a606:     	callq	0x1458e7201 <.text+0x58e6201>
14039a60b:     	nop
14039a60c:     	jmp	0x14039a630 <.text+0x399630>
14039a60e:     	movl	$0x8, %ecx
14039a613:     	movl	$0x138, %edx            # imm = 0x138
14039a618:     	callq	0x1458e7201 <.text+0x58e6201>
14039a61d:     	nop
14039a61e:     	jmp	0x14039a630 <.text+0x399630>
14039a620:     	movl	$0x8, %ecx
14039a625:     	movl	$0x3c8, %edx            # imm = 0x3C8
14039a62a:     	callq	0x1458e7201 <.text+0x58e6201>
14039a62f:     	nop
14039a630:     	ud2
