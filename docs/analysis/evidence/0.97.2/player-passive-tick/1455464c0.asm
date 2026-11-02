
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455464c0:     	pushq	%rbp
1455464c1:     	pushq	%r15
1455464c3:     	pushq	%r14
1455464c5:     	pushq	%r13
1455464c7:     	pushq	%r12
1455464c9:     	pushq	%rsi
1455464ca:     	pushq	%rdi
1455464cb:     	pushq	%rbx
1455464cc:     	subq	$0xa8, %rsp
1455464d3:     	leaq	0x80(%rsp), %rbp
1455464db:     	movaps	%xmm7, 0x10(%rbp)
1455464df:     	movaps	%xmm6, (%rbp)
1455464e3:     	movq	$-0x2, -0x8(%rbp)
1455464eb:     	movq	%rcx, %rsi
1455464ee:     	movq	$0x0, -0x28(%rbp)
1455464f6:     	movq	$0x8, -0x20(%rbp)
1455464fe:     	movq	$0x0, -0x18(%rbp)
145546506:     	movq	$0x0, -0x40(%rbp)
14554650e:     	movq	$0x8, -0x38(%rbp)
145546516:     	movq	$0x0, -0x30(%rbp)
14554651e:     	movq	(%rdx), %rax
145546521:     	movq	%rax, -0x58(%rbp)
145546525:     	movq	0x8(%rdx), %r14
145546529:     	movq	0x10(%rdx), %rax
14554652d:     	movq	%rax, -0x10(%rbp)
145546531:     	movq	0x18(%rdx), %r15
145546535:     	cmpq	%r15, %r14
145546538:     	je	0x14554661c <.text+0x554561c>
14554653e:     	movss	(%r8), %xmm6
145546543:     	leaq	-0x40(%rbp), %rdi
145546547:     	leaq	-0x28(%rbp), %rbx
14554654b:     	jmp	0x14554658d <.text+0x554558d>
14554654d:     	nopl	(%rax)
145546550:     	movq	-0x20(%rbp), %rax
145546554:     	leaq	(,%r13,2), %rcx
14554655c:     	addq	%r13, %rcx
14554655f:     	movq	%r12, (%rax,%rcx,8)
145546563:     	movss	%xmm7, 0x8(%rax,%rcx,8)
145546569:     	movq	-0x50(%rbp), %rdx
14554656d:     	movq	%rdx, 0xc(%rax,%rcx,8)
145546572:     	movl	-0x48(%rbp), %edx
145546575:     	movl	%edx, 0x14(%rax,%rcx,8)
145546579:     	incq	%r13
14554657c:     	movq	%r13, -0x18(%rbp)
145546580:     	addq	$0x18, %r14
145546584:     	cmpq	%r15, %r14
145546587:     	je	0x14554661c <.text+0x554561c>
14554658d:     	movq	(%r14), %r12
145546590:     	movss	0x8(%r14), %xmm7
145546596:     	movl	0x14(%r14), %eax
14554659a:     	movl	%eax, -0x48(%rbp)
14554659d:     	movq	0xc(%r14), %rax
1455465a1:     	movq	%rax, -0x50(%rbp)
1455465a5:     	ucomiss	%xmm7, %xmm6
1455465a8:     	jae	0x145546600 <.text+0x5545600>
1455465aa:     	movq	-0x30(%rbp), %r13
1455465ae:     	cmpq	-0x40(%rbp), %r13
1455465b2:     	jne	0x1455465bd <.text+0x55455bd>
1455465b4:     	movq	%rdi, %rcx
1455465b7:     	callq	0x145757f60 <.text+0x5756f60>
1455465bc:     	nop
1455465bd:     	movq	-0x38(%rbp), %rax
1455465c1:     	leaq	(,%r13,2), %rcx
1455465c9:     	addq	%r13, %rcx
1455465cc:     	movq	%r12, (%rax,%rcx,8)
1455465d0:     	movss	%xmm7, 0x8(%rax,%rcx,8)
1455465d6:     	movq	-0x50(%rbp), %rdx
1455465da:     	movq	%rdx, 0xc(%rax,%rcx,8)
1455465df:     	movl	-0x48(%rbp), %edx
1455465e2:     	movl	%edx, 0x14(%rax,%rcx,8)
1455465e6:     	incq	%r13
1455465e9:     	movq	%r13, -0x30(%rbp)
1455465ed:     	addq	$0x18, %r14
1455465f1:     	cmpq	%r15, %r14
1455465f4:     	jne	0x14554658d <.text+0x554558d>
1455465f6:     	jmp	0x14554661c <.text+0x554561c>
1455465f8:     	nopl	(%rax,%rax)
145546600:     	movq	-0x18(%rbp), %r13
145546604:     	cmpq	-0x28(%rbp), %r13
145546608:     	jne	0x145546550 <.text+0x5545550>
14554660e:     	movq	%rbx, %rcx
145546611:     	callq	0x145757f60 <.text+0x5756f60>
145546616:     	nop
145546617:     	jmp	0x145546550 <.text+0x5545550>
14554661c:     	movq	-0x10(%rbp), %rax
145546620:     	testq	%rax, %rax
145546623:     	je	0x14554663c <.text+0x554563c>
145546625:     	shlq	$0x3, %rax
145546629:     	leaq	(%rax,%rax,2), %rdx
14554662d:     	movl	$0x8, %r8d
145546633:     	movq	-0x58(%rbp), %rcx
145546637:     	callq	0x1400021d0 <.text+0x11d0>
14554663c:     	movq	-0x18(%rbp), %rax
145546640:     	movq	%rax, 0x10(%rsi)
145546644:     	movups	-0x28(%rbp), %xmm0
145546648:     	movups	%xmm0, (%rsi)
14554664b:     	movups	-0x40(%rbp), %xmm0
14554664f:     	movups	%xmm0, 0x18(%rsi)
145546653:     	movq	-0x30(%rbp), %rax
145546657:     	movq	%rax, 0x28(%rsi)
14554665b:     	movq	%rsi, %rax
14554665e:     	movaps	(%rbp), %xmm6
145546662:     	movaps	0x10(%rbp), %xmm7
145546666:     	addq	$0xa8, %rsp
14554666d:     	popq	%rbx
14554666e:     	popq	%rdi
14554666f:     	popq	%rsi
145546670:     	popq	%r12
145546672:     	popq	%r13
145546674:     	popq	%r14
145546676:     	popq	%r15
145546678:     	popq	%rbp
145546679:     	retq
