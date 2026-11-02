
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14553b8e0:     	pushq	%rbp
14553b8e1:     	pushq	%r15
14553b8e3:     	pushq	%r14
14553b8e5:     	pushq	%r13
14553b8e7:     	pushq	%r12
14553b8e9:     	pushq	%rsi
14553b8ea:     	pushq	%rdi
14553b8eb:     	pushq	%rbx
14553b8ec:     	subq	$0x58, %rsp
14553b8f0:     	leaq	0x50(%rsp), %rbp
14553b8f5:     	movq	$-0x2, (%rbp)
14553b8fd:     	movq	%rdx, %rdi
14553b900:     	movq	%rcx, %rbx
14553b903:     	movq	(%rdx), %rcx
14553b906:     	movq	0x8(%rdx), %r13
14553b90a:     	movq	0x10(%rdx), %r14
14553b90e:     	nop
14553b910:     	cmpq	%r13, %rcx
14553b913:     	je	0x14553ba29 <.text+0x553aa29>
14553b919:     	leaq	0x10(%rcx), %rsi
14553b91d:     	movq	%rsi, (%rdi)
14553b920:     	movq	(%rcx), %rax
14553b923:     	movzbl	(%r14), %ecx
14553b927:     	movq	(%rax), %rdx
14553b92a:     	movq	0x8(%rax), %r8
14553b92e:     	callq	0x145486f60 <.text+0x5485f60>
14553b933:     	movq	%rsi, %rcx
14553b936:     	testq	%rdx, %rdx
14553b939:     	je	0x14553b910 <.text+0x553a910>
14553b93b:     	movq	%rbx, -0x28(%rbp)
14553b93f:     	movq	%rax, -0x8(%rbp)
14553b943:     	movzbl	-0x8(%rsi), %r12d
14553b948:     	movq	%rdx, %r15
14553b94b:     	movzbl	0x62(%rdx), %ebx
14553b94f:     	callq	0x140002200 <.text+0x1200>
14553b954:     	movl	$0x60, %ecx
14553b959:     	movl	$0x8, %edx
14553b95e:     	callq	0x1400021c0 <.text+0x11c0>
14553b963:     	testq	%rax, %rax
14553b966:     	je	0x14553ba69 <.text+0x553aa69>
14553b96c:     	movq	%rax, %rdi
14553b96f:     	movzbl	%bl, %eax
14553b972:     	movzbl	%r12b, %ecx
14553b976:     	cmpb	%cl, %al
14553b978:     	cmovbl	%eax, %ecx
14553b97b:     	movq	%r15, (%rdi)
14553b97e:     	movq	-0x8(%rbp), %rax
14553b982:     	movq	%rax, 0x8(%rdi)
14553b986:     	movb	%cl, 0x10(%rdi)
14553b989:     	movq	$0x4, -0x20(%rbp)
14553b991:     	movq	%rdi, -0x18(%rbp)
14553b995:     	movl	$0x1, %ebx
14553b99a:     	movq	%rbx, -0x10(%rbp)
14553b99e:     	nop
14553b9a0:     	cmpq	%r13, %rsi
14553b9a3:     	je	0x14553ba42 <.text+0x553aa42>
14553b9a9:     	movq	(%rsi), %rax
14553b9ac:     	addq	$0x10, %rsi
14553b9b0:     	movzbl	(%r14), %ecx
14553b9b4:     	movq	(%rax), %rdx
14553b9b7:     	movq	0x8(%rax), %r8
14553b9bb:     	callq	0x145486f60 <.text+0x5485f60>
14553b9c0:     	testq	%rdx, %rdx
14553b9c3:     	je	0x14553b9a0 <.text+0x553a9a0>
14553b9c5:     	movq	%rax, %r15
14553b9c8:     	movq	%rdx, %r12
14553b9cb:     	movq	%rbx, %rdx
14553b9ce:     	movl	-0x8(%rsi), %ebx
14553b9d1:     	movzbl	0x62(%r12), %eax
14553b9d7:     	cmpb	%bl, %al
14553b9d9:     	cmovbl	%eax, %ebx
14553b9dc:     	cmpq	-0x20(%rbp), %rdx
14553b9e0:     	jne	0x14553ba0d <.text+0x553aa0d>
14553b9e2:     	movq	$0x18, 0x20(%rsp)
14553b9eb:     	movl	$0x1, %r8d
14553b9f1:     	movl	$0x8, %r9d
14553b9f7:     	leaq	-0x20(%rbp), %rcx
14553b9fb:     	movq	%rdx, -0x8(%rbp)
14553b9ff:     	callq	0x1457744b0 <.text+0x57734b0>
14553ba04:     	nop
14553ba05:     	movq	-0x18(%rbp), %rdi
14553ba09:     	movq	-0x8(%rbp), %rdx
14553ba0d:     	leaq	(%rdx,%rdx,2), %rax
14553ba11:     	movq	%r12, (%rdi,%rax,8)
14553ba15:     	movq	%r15, 0x8(%rdi,%rax,8)
14553ba1a:     	movb	%bl, 0x10(%rdi,%rax,8)
14553ba1e:     	incq	%rdx
14553ba21:     	movq	%rdx, %rbx
14553ba24:     	jmp	0x14553b99a <.text+0x553a99a>
14553ba29:     	movq	$0x0, (%rbx)
14553ba30:     	movq	$0x8, 0x8(%rbx)
14553ba38:     	movq	$0x0, 0x10(%rbx)
14553ba40:     	jmp	0x14553ba55 <.text+0x553aa55>
14553ba42:     	movq	-0x10(%rbp), %rax
14553ba46:     	movq	-0x28(%rbp), %rbx
14553ba4a:     	movq	%rax, 0x10(%rbx)
14553ba4e:     	movups	-0x20(%rbp), %xmm0
14553ba52:     	movups	%xmm0, (%rbx)
14553ba55:     	movq	%rbx, %rax
14553ba58:     	addq	$0x58, %rsp
14553ba5c:     	popq	%rbx
14553ba5d:     	popq	%rdi
14553ba5e:     	popq	%rsi
14553ba5f:     	popq	%r12
14553ba61:     	popq	%r13
14553ba63:     	popq	%r14
14553ba65:     	popq	%r15
14553ba67:     	popq	%rbp
14553ba68:     	retq
14553ba69:     	movl	$0x8, %ecx
14553ba6e:     	movl	$0x60, %edx
14553ba73:     	callq	0x14590379b <.text+0x590279b>
14553ba78:     	ud2
