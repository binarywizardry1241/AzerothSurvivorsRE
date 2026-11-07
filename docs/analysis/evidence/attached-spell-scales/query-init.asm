
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1414165b0:     	pushq	%rbp
1414165b1:     	pushq	%r15
1414165b3:     	pushq	%r14
1414165b5:     	pushq	%rsi
1414165b6:     	pushq	%rdi
1414165b7:     	pushq	%rbx
1414165b8:     	subq	$0x2a8, %rsp            # imm = 0x2A8
1414165bf:     	leaq	0x80(%rsp), %rbp
1414165c7:     	movq	$-0x2, 0x220(%rbp)
1414165d2:     	movq	%rdx, %rdi
1414165d5:     	movq	%rcx, %rsi
1414165d8:     	movq	%rdx, %rcx
1414165db:     	callq	0x140c8f2a0 <.text+0xc8e2a0>
1414165e0:     	movq	%rax, %rbx
1414165e3:     	leaq	0x50(%rbp), %rcx
1414165e7:     	callq	0x144e68fa0 <.text+0x4e67fa0>
1414165ec:     	movb	$0x1, 0x21f(%rbp)
1414165f3:     	leaq	-0x60(%rbp), %rcx
1414165f7:     	callq	0x144e68fa0 <.text+0x4e67fa0>
1414165fc:     	nop
1414165fd:     	leaq	-0x60(%rbp), %rcx
141416601:     	movq	%rbx, %rdx
141416604:     	callq	0x144e63060 <.text+0x4e62060>
141416609:     	nop
14141660a:     	leaq	0x50(%rbp), %rcx
14141660e:     	leaq	-0x60(%rbp), %rdx
141416612:     	callq	0x144e629e0 <.text+0x4e619e0>
141416617:     	nop
141416618:     	movb	$0x1, %r14b
14141661b:     	cmpq	$0x0, 0x90(%rdi)
141416623:     	je	0x141416725 <.text+0x1415725>
141416629:     	movq	0x78(%rdi), %rax
14141662d:     	movq	0x80(%rdi), %rcx
141416634:     	movabsq	$0xe592096a8ce4219, %rdx # imm = 0xE592096A8CE4219
14141663e:     	xorl	%r8d, %r8d
141416641:     	movdqa	0x49ac8c7(%rip), %xmm0  # 0x145dc2f10
141416649:     	pcmpeqd	%xmm1, %xmm1
14141664d:     	movdqa	0x49b73db(%rip), %xmm2  # 0x145dcda30
141416655:     	andq	%rcx, %rdx
141416658:     	movdqu	(%rax,%rdx), %xmm3
14141665d:     	movdqa	%xmm3, %xmm4
141416661:     	pcmpeqb	%xmm0, %xmm4
141416665:     	pmovmskb	%xmm4, %r9d
14141666a:     	testl	%r9d, %r9d
14141666d:     	je	0x1414166b0 <.text+0x14156b0>
14141666f:     	tzcntl	%r9d, %r10d
141416674:     	addq	%rdx, %r10
141416677:     	andq	%rcx, %r10
14141667a:     	negq	%r10
14141667d:     	leaq	(%r10,%r10,2), %r10
141416681:     	movdqu	-0x18(%rax,%r10,8), %xmm4
141416688:     	pcmpeqb	%xmm2, %xmm4
14141668c:     	pmovmskb	%xmm4, %r11d
141416691:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
141416698:     	je	0x1414166cb <.text+0x14156cb>
14141669a:     	leal	-0x1(%r9), %r10d
14141669e:     	andw	%r9w, %r10w
1414166a2:     	movl	%r10d, %r9d
1414166a5:     	jne	0x14141666f <.text+0x141566f>
1414166a7:     	nopw	(%rax,%rax)
1414166b0:     	pcmpeqb	%xmm1, %xmm3
1414166b4:     	pmovmskb	%xmm3, %r9d
1414166b9:     	testl	%r9d, %r9d
1414166bc:     	jne	0x141416725 <.text+0x1415725>
1414166be:     	addq	%r8, %rdx
1414166c1:     	addq	$0x10, %rdx
1414166c5:     	addq	$0x10, %r8
1414166c9:     	jmp	0x141416655 <.text+0x1415655>
1414166cb:     	leaq	(%rax,%r10,8), %rax
1414166cf:     	movq	-0x8(%rax), %rax
1414166d3:     	cmpq	0x218(%rdi), %rax
1414166da:     	jae	0x141416725 <.text+0x1415725>
1414166dc:     	movq	0x210(%rdi), %rcx
1414166e3:     	movq	(%rcx,%rax,8), %rcx
1414166e7:     	testq	%rcx, %rcx
1414166ea:     	je	0x141416725 <.text+0x1415725>
1414166ec:     	movq	0x1e0(%rdi), %rax
1414166f3:     	notq	%rcx
1414166f6:     	imulq	$0x38, %rcx, %rcx
1414166fa:     	cmpb	$0x1, 0x30(%rax,%rcx)
1414166ff:     	jne	0x141416725 <.text+0x1415725>
141416701:     	addq	%rcx, %rax
141416704:     	movq	0x10(%rax), %r14
141416708:     	leaq	0x50(%rbp), %rdx
14141670c:     	movq	%r14, %rcx
14141670f:     	callq	0x144df2410 <.text+0x4df1410>
141416714:     	nop
141416715:     	leaq	0x40(%rdi), %rdx
141416719:     	movq	%r14, %rcx
14141671c:     	callq	0x144df2570 <.text+0x4df1570>
141416721:     	nop
141416722:     	movl	%eax, %r14d
141416725:     	movq	0x5a0(%rdi), %r15
14141672c:     	leaq	0x140(%rbp), %rcx
141416733:     	leaq	0x50(%rbp), %rdx
141416737:     	movl	$0xb0, %r8d
14141673d:     	callq	0x145bc977b <.text+0x5bc877b>
141416742:     	movq	%r15, 0x100(%rbp)
141416749:     	movl	$0x0, 0x108(%rbp)
141416753:     	movq	$0x10, 0x110(%rbp)
14141675e:     	pxor	%xmm0, %xmm0
141416762:     	movdqu	%xmm0, 0x118(%rbp)
14141676a:     	movq	$0x10, 0x128(%rbp)
141416775:     	movdqu	%xmm0, 0x130(%rbp)
14141677d:     	movq	$0x0, 0x1f0(%rbp)
141416788:     	movq	$0x4, 0x1f8(%rbp)
141416793:     	movq	$0x0, 0x200(%rbp)
14141679e:     	movb	%r14b, 0x208(%rbp)
1414167a5:     	movq	%rbx, 0x210(%rbp)
1414167ac:     	movb	$0x0, 0x21f(%rbp)
1414167b3:     	leaq	-0x60(%rbp), %rcx
1414167b7:     	callq	0x1403721e0 <.text+0x3711e0>
1414167bc:     	nop
1414167bd:     	leaq	0x100(%rbp), %rcx
1414167c4:     	movq	%rdi, %rdx
1414167c7:     	callq	0x141416190 <.text+0x1415190>
1414167cc:     	nop
1414167cd:     	leaq	0x100(%rbp), %rdx
1414167d4:     	movl	$0x118, %r8d            # imm = 0x118
1414167da:     	movq	%rsi, %rcx
1414167dd:     	callq	0x145bc977b <.text+0x5bc877b>
1414167e2:     	movq	%rsi, %rax
1414167e5:     	addq	$0x2a8, %rsp            # imm = 0x2A8
1414167ec:     	popq	%rbx
1414167ed:     	popq	%rdi
1414167ee:     	popq	%rsi
1414167ef:     	popq	%r14
1414167f1:     	popq	%r15
1414167f3:     	popq	%rbp
1414167f4:     	retq
