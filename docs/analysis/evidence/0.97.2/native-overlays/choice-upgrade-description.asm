
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455347d0:     	pushq	%rbp
1455347d1:     	pushq	%r15
1455347d3:     	pushq	%r14
1455347d5:     	pushq	%rsi
1455347d6:     	pushq	%rdi
1455347d7:     	pushq	%rbx
1455347d8:     	subq	$0x58, %rsp
1455347dc:     	leaq	0x50(%rsp), %rbp
1455347e1:     	movq	$-0x2, (%rbp)
1455347e9:     	movq	0x8(%rdx), %r14
1455347ed:     	subq	(%rdx), %r14
1455347f0:     	leaq	(,%r14,8), %rax
1455347f8:     	leaq	(%rax,%rax,2), %rdi
1455347fc:     	movabsq	$0x555555555555555, %rax # imm = 0x555555555555555
145534806:     	cmpq	%rax, %r14
145534809:     	jbe	0x14553481a <.text+0x553381a>
14553480b:     	xorl	%ebx, %ebx
14553480d:     	movq	%rbx, %rcx
145534810:     	movq	%rdi, %rdx
145534813:     	callq	0x1458e721b <.text+0x58e621b>
145534818:     	ud2
14553481a:     	movq	%rcx, %rsi
14553481d:     	testq	%rdi, %rdi
145534820:     	je	0x145534846 <.text+0x5533846>
145534822:     	movq	%rdx, %r15
145534825:     	callq	0x140002200 <.text+0x1200>
14553482a:     	movl	$0x8, %ebx
14553482f:     	movl	$0x8, %edx
145534834:     	movq	%rdi, %rcx
145534837:     	callq	0x1400021c0 <.text+0x11c0>
14553483c:     	testq	%rax, %rax
14553483f:     	je	0x14553480d <.text+0x553380d>
145534841:     	movq	%r15, %rdx
145534844:     	jmp	0x14553484e <.text+0x553384e>
145534846:     	movl	$0x8, %eax
14553484b:     	xorl	%r14d, %r14d
14553484e:     	movq	%r14, -0x18(%rbp)
145534852:     	movq	%rax, -0x10(%rbp)
145534856:     	leaq	-0x8(%rbp), %rcx
14553485a:     	movq	$0x0, -0x8(%rbp)
145534862:     	movq	%rax, -0x20(%rbp)
145534866:     	movq	%rcx, -0x30(%rbp)
14553486a:     	movq	$0x0, -0x28(%rbp)
145534872:     	leaq	-0x30(%rbp), %rax
145534876:     	movq	%rdx, %rcx
145534879:     	movq	%rax, %rdx
14553487c:     	callq	0x1455187c0 <.text+0x55177c0>
145534881:     	nop
145534882:     	movq	-0x8(%rbp), %rax
145534886:     	movq	%rax, 0x10(%rsi)
14553488a:     	movups	-0x18(%rbp), %xmm0
14553488e:     	movups	%xmm0, (%rsi)
145534891:     	movq	%rsi, %rax
145534894:     	addq	$0x58, %rsp
145534898:     	popq	%rbx
145534899:     	popq	%rdi
14553489a:     	popq	%rsi
14553489b:     	popq	%r14
14553489d:     	popq	%r15
14553489f:     	popq	%rbp
1455348a0:     	retq
