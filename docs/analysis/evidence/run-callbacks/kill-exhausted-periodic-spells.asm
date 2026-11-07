
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14553e800:     	pushq	%rbp
14553e801:     	pushq	%r15
14553e803:     	pushq	%r14
14553e805:     	pushq	%r12
14553e807:     	pushq	%rsi
14553e808:     	pushq	%rdi
14553e809:     	pushq	%rbx
14553e80a:     	subq	$0x50, %rsp
14553e80e:     	leaq	0x50(%rsp), %rbp
14553e813:     	movq	$-0x2, -0x8(%rbp)
14553e81b:     	movq	%rcx, %rsi
14553e81e:     	cmpq	%r8, %rdx
14553e821:     	je	0x14553e83f <.text+0x553d83f>
14553e823:     	movq	%r8, %rdi
14553e826:     	movq	%rdx, %rbx
14553e829:     	addq	$0x30, %rbx
14553e82d:     	nopl	(%rax)
14553e830:     	cmpl	$0x0, -0x10(%rbx)
14553e834:     	je	0x14553e85b <.text+0x553d85b>
14553e836:     	cmpq	%rdi, %rbx
14553e839:     	leaq	0x30(%rbx), %rbx
14553e83d:     	jne	0x14553e830 <.text+0x553d830>
14553e83f:     	movq	$0x0, (%rsi)
14553e846:     	movq	$0x4, 0x8(%rsi)
14553e84e:     	movq	$0x0, 0x10(%rsi)
14553e856:     	jmp	0x14553e917 <.text+0x553d917>
14553e85b:     	movl	-0x20(%rbx), %r14d
14553e85f:     	callq	0x140002200 <.text+0x1200>
14553e864:     	movl	$0x10, %ecx
14553e869:     	movl	$0x4, %edx
14553e86e:     	callq	0x1400021c0 <.text+0x11c0>
14553e873:     	testq	%rax, %rax
14553e876:     	je	0x14553e929 <.text+0x553d929>
14553e87c:     	movl	%r14d, (%rax)
14553e87f:     	movq	$0x4, -0x20(%rbp)
14553e887:     	movq	%rax, -0x18(%rbp)
14553e88b:     	movq	$0x1, -0x10(%rbp)
14553e893:     	cmpq	%rdi, %rbx
14553e896:     	je	0x14553e900 <.text+0x553d900>
14553e898:     	movl	$0x1, %r14d
14553e89e:     	leaq	-0x20(%rbp), %r15
14553e8a2:     	addq	$0x30, %rbx
14553e8a6:     	nopw	%cs:(%rax,%rax)
14553e8b0:     	cmpl	$0x0, -0x10(%rbx)
14553e8b4:     	je	0x14553e8c1 <.text+0x553d8c1>
14553e8b6:     	cmpq	%rdi, %rbx
14553e8b9:     	leaq	0x30(%rbx), %rbx
14553e8bd:     	jne	0x14553e8b0 <.text+0x553d8b0>
14553e8bf:     	jmp	0x14553e900 <.text+0x553d900>
14553e8c1:     	movl	-0x20(%rbx), %r12d
14553e8c5:     	cmpq	-0x20(%rbp), %r14
14553e8c9:     	jne	0x14553e8f0 <.text+0x553d8f0>
14553e8cb:     	movq	$0x4, 0x20(%rsp)
14553e8d4:     	movl	$0x1, %r8d
14553e8da:     	movl	$0x4, %r9d
14553e8e0:     	movq	%r15, %rcx
14553e8e3:     	movq	%r14, %rdx
14553e8e6:     	callq	0x1457744b0 <.text+0x57734b0>
14553e8eb:     	nop
14553e8ec:     	movq	-0x18(%rbp), %rax
14553e8f0:     	movl	%r12d, (%rax,%r14,4)
14553e8f4:     	incq	%r14
14553e8f7:     	movq	%r14, -0x10(%rbp)
14553e8fb:     	cmpq	%rdi, %rbx
14553e8fe:     	jne	0x14553e8a2 <.text+0x553d8a2>
14553e900:     	movq	-0x10(%rbp), %rax
14553e904:     	movq	%rax, 0x10(%rsi)
14553e908:     	movq	-0x20(%rbp), %rax
14553e90c:     	movq	%rax, (%rsi)
14553e90f:     	movq	-0x18(%rbp), %rax
14553e913:     	movq	%rax, 0x8(%rsi)
14553e917:     	movq	%rsi, %rax
14553e91a:     	addq	$0x50, %rsp
14553e91e:     	popq	%rbx
14553e91f:     	popq	%rdi
14553e920:     	popq	%rsi
14553e921:     	popq	%r12
14553e923:     	popq	%r14
14553e925:     	popq	%r15
14553e927:     	popq	%rbp
14553e928:     	retq
14553e929:     	movl	$0x4, %ecx
14553e92e:     	movl	$0x10, %edx
14553e933:     	callq	0x14590379b <.text+0x590279b>
14553e938:     	ud2
