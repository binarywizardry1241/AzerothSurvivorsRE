
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403926d0:     	pushq	%rbp
1403926d1:     	pushq	%r15
1403926d3:     	pushq	%r14
1403926d5:     	pushq	%r13
1403926d7:     	pushq	%r12
1403926d9:     	pushq	%rsi
1403926da:     	pushq	%rdi
1403926db:     	pushq	%rbx
1403926dc:     	subq	$0x308, %rsp            # imm = 0x308
1403926e3:     	leaq	0x80(%rsp), %rbp
1403926eb:     	movq	$-0x2, 0x280(%rbp)
1403926f6:     	movq	%rdx, %rdi
1403926f9:     	movq	%rcx, %rsi
1403926fc:     	movq	%rdx, %rcx
1403926ff:     	callq	0x1402a0dc0 <.text+0x29fdc0>
140392704:     	movq	%rax, %rbx
140392707:     	movq	%rdi, %rcx
14039270a:     	callq	0x140295cf0 <.text+0x294cf0>
14039270f:     	movq	%rax, %r14
140392712:     	movq	%rdi, %rcx
140392715:     	callq	0x140299340 <.text+0x298340>
14039271a:     	movq	%rax, %r15
14039271d:     	movq	%rdi, %rcx
140392720:     	callq	0x1402967d0 <.text+0x2957d0>
140392725:     	movq	%rax, %r12
140392728:     	movq	%rdi, %rcx
14039272b:     	callq	0x140299940 <.text+0x298940>
140392730:     	movq	%rax, %r13
140392733:     	movq	%rdi, %rcx
140392736:     	callq	0x140294c10 <.text+0x293c10>
14039273b:     	movq	%rbx, 0x248(%rbp)
140392742:     	movq	%r14, 0x250(%rbp)
140392749:     	movq	%r15, 0x258(%rbp)
140392750:     	movq	%r12, 0x260(%rbp)
140392757:     	movq	%r13, 0x268(%rbp)
14039275e:     	movq	%rax, 0x270(%rbp)
140392765:     	leaq	0x58(%rbp), %rbx
140392769:     	movq	%rbx, %rcx
14039276c:     	callq	0x144e68fa0 <.text+0x4e67fa0>
140392771:     	movb	$0x1, 0x27f(%rbp)
140392778:     	leaq	0x248(%rbp), %rcx
14039277f:     	movq	%rbx, %rdx
140392782:     	callq	0x14027f250 <.text+0x27e250>
140392787:     	nop
140392788:     	movb	$0x1, 0x27f(%rbp)
14039278f:     	leaq	-0x58(%rbp), %rcx
140392793:     	callq	0x144e68fa0 <.text+0x4e67fa0>
140392798:     	nop
140392799:     	leaq	0x58(%rbp), %rcx
14039279d:     	leaq	-0x58(%rbp), %rdx
1403927a1:     	callq	0x144e629e0 <.text+0x4e619e0>
1403927a6:     	nop
1403927a7:     	movb	$0x1, %bl
1403927a9:     	cmpq	$0x0, 0x90(%rdi)
1403927b1:     	je	0x1403928b4 <.text+0x3918b4>
1403927b7:     	movq	0x78(%rdi), %rax
1403927bb:     	movq	0x80(%rdi), %rcx
1403927c2:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
1403927cc:     	xorl	%r8d, %r8d
1403927cf:     	movdqa	0x5a30739(%rip), %xmm0  # 0x145dc2f10
1403927d7:     	pcmpeqd	%xmm1, %xmm1
1403927db:     	movdqa	0x5a3b24d(%rip), %xmm2  # 0x145dcda30
1403927e3:     	andq	%rcx, %rdx
1403927e6:     	movdqu	(%rax,%rdx), %xmm3
1403927eb:     	movdqa	%xmm3, %xmm4
1403927ef:     	pcmpeqb	%xmm0, %xmm4
1403927f3:     	pmovmskb	%xmm4, %r9d
1403927f8:     	testl	%r9d, %r9d
1403927fb:     	je	0x140392840 <.text+0x391840>
1403927fd:     	tzcntl	%r9d, %r10d
140392802:     	addq	%rdx, %r10
140392805:     	andq	%rcx, %r10
140392808:     	negq	%r10
14039280b:     	leaq	(%r10,%r10,2), %r10
14039280f:     	movdqu	-0x18(%rax,%r10,8), %xmm4
140392816:     	pcmpeqb	%xmm2, %xmm4
14039281a:     	pmovmskb	%xmm4, %r11d
14039281f:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
140392826:     	je	0x14039285b <.text+0x39185b>
140392828:     	leal	-0x1(%r9), %r10d
14039282c:     	andw	%r9w, %r10w
140392830:     	movl	%r10d, %r9d
140392833:     	jne	0x1403927fd <.text+0x3917fd>
140392835:     	nopw	%cs:(%rax,%rax)
140392840:     	pcmpeqb	%xmm1, %xmm3
140392844:     	pmovmskb	%xmm3, %r9d
140392849:     	testl	%r9d, %r9d
14039284c:     	jne	0x1403928b4 <.text+0x3918b4>
14039284e:     	addq	%r8, %rdx
140392851:     	addq	$0x10, %rdx
140392855:     	addq	$0x10, %r8
140392859:     	jmp	0x1403927e3 <.text+0x3917e3>
14039285b:     	leaq	(%rax,%r10,8), %rax
14039285f:     	movq	-0x8(%rax), %rax
140392863:     	cmpq	0x218(%rdi), %rax
14039286a:     	jae	0x1403928b4 <.text+0x3918b4>
14039286c:     	movq	0x210(%rdi), %rcx
140392873:     	movq	(%rcx,%rax,8), %rcx
140392877:     	testq	%rcx, %rcx
14039287a:     	je	0x1403928b4 <.text+0x3918b4>
14039287c:     	movq	0x1e0(%rdi), %rax
140392883:     	notq	%rcx
140392886:     	imulq	$0x38, %rcx, %rcx
14039288a:     	cmpb	$0x1, 0x30(%rax,%rcx)
14039288f:     	jne	0x1403928b4 <.text+0x3918b4>
140392891:     	addq	%rcx, %rax
140392894:     	movq	0x10(%rax), %rbx
140392898:     	leaq	0x58(%rbp), %rdx
14039289c:     	movq	%rbx, %rcx
14039289f:     	callq	0x144df2410 <.text+0x4df1410>
1403928a4:     	nop
1403928a5:     	leaq	0x40(%rdi), %rdx
1403928a9:     	movq	%rbx, %rcx
1403928ac:     	callq	0x144df2570 <.text+0x4df1570>
1403928b1:     	nop
1403928b2:     	movl	%eax, %ebx
1403928b4:     	movq	0x5a0(%rdi), %r14
1403928bb:     	leaq	0x148(%rbp), %rcx
1403928c2:     	leaq	0x58(%rbp), %rdx
1403928c6:     	movl	$0xb0, %r8d
1403928cc:     	callq	0x145bc977b <.text+0x5bc877b>
1403928d1:     	movq	%r14, 0x108(%rbp)
1403928d8:     	movl	$0x0, 0x110(%rbp)
1403928e2:     	movq	$0x10, 0x118(%rbp)
1403928ed:     	pxor	%xmm0, %xmm0
1403928f1:     	movdqu	%xmm0, 0x120(%rbp)
1403928f9:     	movq	$0x10, 0x130(%rbp)
140392904:     	movdqu	%xmm0, 0x138(%rbp)
14039290c:     	movq	$0x0, 0x1f8(%rbp)
140392917:     	movq	$0x4, 0x200(%rbp)
140392922:     	movq	$0x0, 0x208(%rbp)
14039292d:     	movb	%bl, 0x210(%rbp)
140392933:     	movdqu	0x248(%rbp), %xmm0
14039293b:     	movdqu	0x258(%rbp), %xmm1
140392943:     	movdqu	0x268(%rbp), %xmm2
14039294b:     	movdqu	%xmm0, 0x218(%rbp)
140392953:     	movdqu	%xmm1, 0x228(%rbp)
14039295b:     	movdqu	%xmm2, 0x238(%rbp)
140392963:     	movb	$0x0, 0x27f(%rbp)
14039296a:     	leaq	-0x58(%rbp), %rcx
14039296e:     	callq	0x1403721e0 <.text+0x3711e0>
140392973:     	nop
140392974:     	leaq	0x108(%rbp), %rcx
14039297b:     	movq	%rdi, %rdx
14039297e:     	callq	0x1403922b0 <.text+0x3912b0>
140392983:     	nop
140392984:     	leaq	0x108(%rbp), %rdx
14039298b:     	movl	$0x140, %r8d            # imm = 0x140
140392991:     	movq	%rsi, %rcx
140392994:     	callq	0x145bc977b <.text+0x5bc877b>
140392999:     	movq	%rsi, %rax
14039299c:     	addq	$0x308, %rsp            # imm = 0x308
1403929a3:     	popq	%rbx
1403929a4:     	popq	%rdi
1403929a5:     	popq	%rsi
1403929a6:     	popq	%r12
1403929a8:     	popq	%r13
1403929aa:     	popq	%r14
1403929ac:     	popq	%r15
1403929ae:     	popq	%rbp
1403929af:     	retq
