
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140399720:     	pushq	%rbp
140399721:     	pushq	%r15
140399723:     	pushq	%r14
140399725:     	pushq	%rsi
140399726:     	pushq	%rdi
140399727:     	pushq	%rbx
140399728:     	subq	$0x2e8, %rsp            # imm = 0x2E8
14039972f:     	leaq	0x80(%rsp), %rbp
140399737:     	movq	$-0x2, 0x260(%rbp)
140399742:     	movq	%rdx, %rdi
140399745:     	movq	%rcx, %rsi
140399748:     	movq	%rdx, %rcx
14039974b:     	callq	0x140295cf0 <.text+0x294cf0>
140399750:     	movq	%rax, %rbx
140399753:     	movq	%rdi, %rcx
140399756:     	callq	0x1402b80e0 <.text+0x2b70e0>
14039975b:     	movq	%rax, %r14
14039975e:     	movq	%rdi, %rcx
140399761:     	callq	0x1402967d0 <.text+0x2957d0>
140399766:     	movq	%rax, %r15
140399769:     	movq	%rdi, %rcx
14039976c:     	callq	0x140294c10 <.text+0x293c10>
140399771:     	movq	%rbx, 0x238(%rbp)
140399778:     	movq	%r14, 0x240(%rbp)
14039977f:     	movq	%r15, 0x248(%rbp)
140399786:     	movq	%rax, 0x250(%rbp)
14039978d:     	movq	%rdi, %rcx
140399790:     	callq	0x140295cf0 <.text+0x294cf0>
140399795:     	movq	%rax, %rbx
140399798:     	leaq	-0x60(%rbp), %r14
14039979c:     	movq	%r14, %rcx
14039979f:     	callq	0x144e68fa0 <.text+0x4e67fa0>
1403997a4:     	movb	$0x1, 0x25f(%rbp)
1403997ab:     	leaq	0x238(%rbp), %rcx
1403997b2:     	movq	%r14, %rdx
1403997b5:     	callq	0x140095270 <.text+0x94270>
1403997ba:     	nop
1403997bb:     	movb	$0x1, 0x25f(%rbp)
1403997c2:     	leaq	0x50(%rbp), %rcx
1403997c6:     	callq	0x144e68fa0 <.text+0x4e67fa0>
1403997cb:     	nop
1403997cc:     	movzbl	0xe1(%rbp), %eax
1403997d3:     	cmpq	0x90(%rbp), %rbx
1403997da:     	jae	0x1403998cf <.text+0x3988cf>
1403997e0:     	movq	0x80(%rbp), %rcx
1403997e7:     	movq	%rbx, %rdx
1403997ea:     	shrq	$0x6, %rdx
1403997ee:     	movq	(%rcx,%rdx,8), %rcx
1403997f2:     	btq	%rbx, %rcx
1403997f6:     	sbbb	$0x0, %al
1403997f8:     	jne	0x1403998d7 <.text+0x3988d7>
1403997fe:     	leaq	0x50(%rbp), %rcx
140399802:     	movq	%rbx, %rdx
140399805:     	callq	0x144e62670 <.text+0x4e61670>
14039980a:     	nop
14039980b:     	leaq	-0x60(%rbp), %rcx
14039980f:     	leaq	0x50(%rbp), %rdx
140399813:     	callq	0x144e629e0 <.text+0x4e619e0>
140399818:     	nop
140399819:     	movb	$0x1, %r14b
14039981c:     	cmpq	$0x0, 0x90(%rdi)
140399824:     	je	0x14039996a <.text+0x39896a>
14039982a:     	movq	0x78(%rdi), %rax
14039982e:     	movq	0x80(%rdi), %rcx
140399835:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
14039983f:     	xorl	%r8d, %r8d
140399842:     	movdqa	0x5a296c6(%rip), %xmm0  # 0x145dc2f10
14039984a:     	pcmpeqd	%xmm1, %xmm1
14039984e:     	movdqa	0x5a341da(%rip), %xmm2  # 0x145dcda30
140399856:     	andq	%rcx, %rdx
140399859:     	movdqu	(%rax,%rdx), %xmm3
14039985e:     	movdqa	%xmm3, %xmm4
140399862:     	pcmpeqb	%xmm0, %xmm4
140399866:     	pmovmskb	%xmm4, %r9d
14039986b:     	testl	%r9d, %r9d
14039986e:     	je	0x1403998b0 <.text+0x3988b0>
140399870:     	tzcntl	%r9d, %r10d
140399875:     	addq	%rdx, %r10
140399878:     	andq	%rcx, %r10
14039987b:     	negq	%r10
14039987e:     	leaq	(%r10,%r10,2), %r10
140399882:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140399889:     	pcmpeqb	%xmm2, %xmm4
14039988d:     	pmovmskb	%xmm4, %r11d
140399892:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140399899:     	je	0x140399910 <.text+0x398910>
14039989b:     	leal	-0x1(%r9), %r10d
14039989f:     	andw	%r9w, %r10w
1403998a3:     	movl	%r10d, %r9d
1403998a6:     	jne	0x140399870 <.text+0x398870>
1403998a8:     	nopl	(%rax,%rax)
1403998b0:     	pcmpeqb	%xmm1, %xmm3
1403998b4:     	pmovmskb	%xmm3, %r9d
1403998b9:     	testl	%r9d, %r9d
1403998bc:     	jne	0x14039996a <.text+0x39896a>
1403998c2:     	addq	%r8, %rdx
1403998c5:     	addq	$0x10, %rdx
1403998c9:     	addq	$0x10, %r8
1403998cd:     	jmp	0x140399856 <.text+0x398856>
1403998cf:     	testb	%al, %al
1403998d1:     	je	0x1403997fe <.text+0x3987fe>
1403998d7:     	leaq	0x25e(%rbp), %rax
1403998de:     	movq	%rax, 0x100(%rbp)
1403998e5:     	leaq	0x4c4cd84(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
1403998ec:     	movq	%rax, 0x108(%rbp)
1403998f3:     	leaq	0x5a34296(%rip), %rcx   # 0x145dcdb90
1403998fa:     	leaq	0x5a3436f(%rip), %r8    # 0x145dcdc70
140399901:     	leaq	0x100(%rbp), %rdx
140399908:     	callq	0x145d699c0 <.text+0x5d689c0>
14039990d:     	nop
14039990e:     	ud2
140399910:     	leaq	(%rax,%r10,8), %rax
140399914:     	movq	-0x8(%rax), %rax
140399918:     	cmpq	0x218(%rdi), %rax
14039991f:     	jae	0x14039996a <.text+0x39896a>
140399921:     	movq	0x210(%rdi), %rcx
140399928:     	movq	(%rcx,%rax,8), %rcx
14039992c:     	testq	%rcx, %rcx
14039992f:     	je	0x14039996a <.text+0x39896a>
140399931:     	movq	0x1e0(%rdi), %rax
140399938:     	notq	%rcx
14039993b:     	imulq	$0x38, %rcx, %rcx
14039993f:     	cmpb	$0x1, 0x30(%rax,%rcx)
140399944:     	jne	0x14039996a <.text+0x39896a>
140399946:     	addq	%rcx, %rax
140399949:     	movq	0x10(%rax), %r14
14039994d:     	leaq	-0x60(%rbp), %rdx
140399951:     	movq	%r14, %rcx
140399954:     	callq	0x144df2410 <.text+0x4df1410>
140399959:     	nop
14039995a:     	leaq	0x40(%rdi), %rdx
14039995e:     	movq	%r14, %rcx
140399961:     	callq	0x144df2570 <.text+0x4df1570>
140399966:     	nop
140399967:     	movl	%eax, %r14d
14039996a:     	movq	0x5a0(%rdi), %r15
140399971:     	leaq	0x140(%rbp), %rcx
140399978:     	leaq	-0x60(%rbp), %rdx
14039997c:     	movl	$0xb0, %r8d
140399982:     	callq	0x145bc977b <.text+0x5bc877b>
140399987:     	movq	%r15, 0x100(%rbp)
14039998e:     	movl	$0x0, 0x108(%rbp)
140399998:     	movq	$0x10, 0x110(%rbp)
1403999a3:     	pxor	%xmm0, %xmm0
1403999a7:     	movdqu	%xmm0, 0x118(%rbp)
1403999af:     	movq	$0x10, 0x128(%rbp)
1403999ba:     	movdqu	%xmm0, 0x130(%rbp)
1403999c2:     	movq	$0x0, 0x1f0(%rbp)
1403999cd:     	movq	$0x4, 0x1f8(%rbp)
1403999d8:     	movq	$0x0, 0x200(%rbp)
1403999e3:     	movb	%r14b, 0x208(%rbp)
1403999ea:     	movdqu	0x238(%rbp), %xmm0
1403999f2:     	movdqu	0x248(%rbp), %xmm1
1403999fa:     	movdqu	%xmm0, 0x210(%rbp)
140399a02:     	movdqu	%xmm1, 0x220(%rbp)
140399a0a:     	movq	%rbx, 0x230(%rbp)
140399a11:     	movb	$0x0, 0x25f(%rbp)
140399a18:     	leaq	0x50(%rbp), %rcx
140399a1c:     	callq	0x1403721e0 <.text+0x3711e0>
140399a21:     	nop
140399a22:     	leaq	0x100(%rbp), %rcx
140399a29:     	movq	%rdi, %rdx
140399a2c:     	callq	0x140399300 <.text+0x398300>
140399a31:     	nop
140399a32:     	leaq	0x100(%rbp), %rdx
140399a39:     	movl	$0x138, %r8d            # imm = 0x138
140399a3f:     	movq	%rsi, %rcx
140399a42:     	callq	0x145bc977b <.text+0x5bc877b>
140399a47:     	movq	%rsi, %rax
140399a4a:     	addq	$0x2e8, %rsp            # imm = 0x2E8
140399a51:     	popq	%rbx
140399a52:     	popq	%rdi
140399a53:     	popq	%rsi
140399a54:     	popq	%r14
140399a56:     	popq	%r15
140399a58:     	popq	%rbp
140399a59:     	retq
