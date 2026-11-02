
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145538730:     	pushq	%rbp
145538731:     	pushq	%r15
145538733:     	pushq	%r14
145538735:     	pushq	%r13
145538737:     	pushq	%r12
145538739:     	pushq	%rsi
14553873a:     	pushq	%rdi
14553873b:     	pushq	%rbx
14553873c:     	subq	$0x68, %rsp
145538740:     	leaq	0x60(%rsp), %rbp
145538745:     	movaps	%xmm6, -0x10(%rbp)
145538749:     	movq	$-0x2, -0x18(%rbp)
145538751:     	movq	%rcx, %rsi
145538754:     	movq	(%rdx), %rax
145538757:     	movq	0x8(%rdx), %r14
14553875b:     	cmpq	%r14, %rax
14553875e:     	je	0x145538783 <.text+0x5537783>
145538760:     	movq	0x10(%rdx), %r15
145538764:     	movss	(%r15), %xmm0
145538769:     	nopl	(%rax)
145538770:     	movss	0x10(%rax), %xmm6
145538775:     	ucomiss	%xmm0, %xmm6
145538778:     	ja	0x14553879f <.text+0x553779f>
14553877a:     	addq	$0x18, %rax
14553877e:     	cmpq	%r14, %rax
145538781:     	jne	0x145538770 <.text+0x5537770>
145538783:     	movq	$0x0, (%rsi)
14553878a:     	movq	$0x4, 0x8(%rsi)
145538792:     	movq	$0x0, 0x10(%rsi)
14553879a:     	jmp	0x145538891 <.text+0x5537891>
14553879f:     	leaq	0x18(%rax), %r12
1455387a3:     	movq	%r12, (%rdx)
1455387a6:     	movl	0xc(%rax), %edi
1455387a9:     	callq	0x140002200 <.text+0x1200>
1455387ae:     	movl	$0x30, %ecx
1455387b3:     	movl	$0x4, %edx
1455387b8:     	callq	0x1400021c0 <.text+0x11c0>
1455387bd:     	testq	%rax, %rax
1455387c0:     	je	0x1455388a9 <.text+0x55378a9>
1455387c6:     	movl	%edi, (%rax)
1455387c8:     	movss	%xmm6, 0x4(%rax)
1455387cd:     	movl	$0x1, 0x8(%rax)
1455387d4:     	movq	$0x4, -0x30(%rbp)
1455387dc:     	movq	%rax, -0x28(%rbp)
1455387e0:     	movq	$0x1, -0x20(%rbp)
1455387e8:     	cmpq	%r14, %r12
1455387eb:     	je	0x14553887a <.text+0x553787a>
1455387f1:     	movl	$0x1, %edi
1455387f6:     	leaq	-0x30(%rbp), %rbx
1455387fa:     	movss	(%r15), %xmm0
1455387ff:     	addq	$0x18, %r12
145538803:     	nopw	%cs:(%rax,%rax)
145538810:     	movss	-0x8(%r12), %xmm6
145538817:     	ucomiss	%xmm0, %xmm6
14553881a:     	ja	0x145538828 <.text+0x5537828>
14553881c:     	cmpq	%r14, %r12
14553881f:     	leaq	0x18(%r12), %r12
145538824:     	jne	0x145538810 <.text+0x5537810>
145538826:     	jmp	0x14553887a <.text+0x553787a>
145538828:     	movl	-0xc(%r12), %r13d
14553882d:     	cmpq	-0x30(%rbp), %rdi
145538831:     	jne	0x145538858 <.text+0x5537858>
145538833:     	movq	$0xc, 0x20(%rsp)
14553883c:     	movl	$0x1, %r8d
145538842:     	movl	$0x4, %r9d
145538848:     	movq	%rbx, %rcx
14553884b:     	movq	%rdi, %rdx
14553884e:     	callq	0x1457744b0 <.text+0x57734b0>
145538853:     	nop
145538854:     	movq	-0x28(%rbp), %rax
145538858:     	leaq	(%rdi,%rdi,2), %rcx
14553885c:     	movl	%r13d, (%rax,%rcx,4)
145538860:     	movss	%xmm6, 0x4(%rax,%rcx,4)
145538866:     	movl	$0x1, 0x8(%rax,%rcx,4)
14553886e:     	incq	%rdi
145538871:     	movq	%rdi, -0x20(%rbp)
145538875:     	cmpq	%r14, %r12
145538878:     	jne	0x1455387fa <.text+0x55377fa>
14553887a:     	movq	-0x20(%rbp), %rax
14553887e:     	movq	%rax, 0x10(%rsi)
145538882:     	movq	-0x30(%rbp), %rax
145538886:     	movq	%rax, (%rsi)
145538889:     	movq	-0x28(%rbp), %rax
14553888d:     	movq	%rax, 0x8(%rsi)
145538891:     	movq	%rsi, %rax
145538894:     	movaps	-0x10(%rbp), %xmm6
145538898:     	addq	$0x68, %rsp
14553889c:     	popq	%rbx
14553889d:     	popq	%rdi
14553889e:     	popq	%rsi
14553889f:     	popq	%r12
1455388a1:     	popq	%r13
1455388a3:     	popq	%r14
1455388a5:     	popq	%r15
1455388a7:     	popq	%rbp
1455388a8:     	retq
