
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b98d0:     	pushq	%rbp
1459b98d1:     	pushq	%r15
1459b98d3:     	pushq	%r14
1459b98d5:     	pushq	%r13
1459b98d7:     	pushq	%r12
1459b98d9:     	pushq	%rsi
1459b98da:     	pushq	%rdi
1459b98db:     	pushq	%rbx
1459b98dc:     	subq	$0xb8, %rsp
1459b98e3:     	leaq	0x80(%rsp), %rbp
1459b98eb:     	movq	$-0x2, 0x30(%rbp)
1459b98f3:     	movq	%rcx, %rdi
1459b98f6:     	movq	(%r8), %rax
1459b98f9:     	movq	0x8(%r8), %rcx
1459b98fd:     	cmpq	%rdx, %rdi
1459b9900:     	je	0x1459b9a6c <.text+0x59b8a6c>
1459b9906:     	movq	%rdx, %rsi
1459b9909:     	movq	%rax, 0x20(%rbp)
1459b990d:     	movq	0x10(%r8), %rax
1459b9911:     	subq	%rdi, %rsi
1459b9914:     	shrq	$0x4, %rsi
1459b9918:     	movq	%rcx, 0x28(%rbp)
1459b991c:     	leaq	(%rcx,%rcx,2), %rcx
1459b9920:     	leaq	(%rax,%rcx,8), %r12
1459b9924:     	negq	%rsi
1459b9927:     	addq	$0x8, %rdi
1459b992b:     	xorl	%eax, %eax
1459b992d:     	leaq	-0x8(%rbp), %rbx
1459b9931:     	leaq	0x17fc210(%rip), %r14   # 0x1471b5b48
1459b9938:     	leaq	-0x50(%rbp), %r15
1459b993c:     	jmp	0x1459b996a <.text+0x59b896a>
1459b993e:     	nop
1459b9940:     	movq	-0x40(%rbp), %rax
1459b9944:     	movq	%rax, 0x10(%r12)
1459b9949:     	movups	-0x50(%rbp), %xmm0
1459b994d:     	movups	%xmm0, (%r12)
1459b9952:     	movq	0x18(%rbp), %rax
1459b9956:     	decq	%rax
1459b9959:     	addq	$0x18, %r12
1459b995d:     	addq	$0x10, %rdi
1459b9961:     	cmpq	%rax, %rsi
1459b9964:     	je	0x1459b9a61 <.text+0x59b8a61>
1459b996a:     	movq	%rax, 0x18(%rbp)
1459b996e:     	movq	-0x8(%rdi), %rax
1459b9972:     	movq	(%rdi), %r13
1459b9975:     	movq	(%rax), %rcx
1459b9978:     	movq	0x8(%rax), %rdx
1459b997c:     	movq	$0x0, -0x8(%rbp)
1459b9984:     	movq	$0x1, (%rbp)
1459b998c:     	movq	$0x0, 0x8(%rbp)
1459b9994:     	testq	%rdx, %rdx
1459b9997:     	jne	0x1459b9a1f <.text+0x59b8a1f>
1459b999d:     	addq	%rcx, %rdx
1459b99a0:     	movq	%rbx, %r8
1459b99a3:     	callq	0x1459b9b70 <.text+0x59b8b70>
1459b99a8:     	nop
1459b99a9:     	movq	0x8(%rbp), %rax
1459b99ad:     	movq	%rax, -0x10(%rbp)
1459b99b1:     	movups	-0x8(%rbp), %xmm0
1459b99b5:     	movaps	%xmm0, -0x20(%rbp)
1459b99b9:     	movsd	(%r13), %xmm0
1459b99bf:     	callq	0x145bc97db <.text+0x5bc87db>
1459b99c4:     	movsd	%xmm0, -0x38(%rbp)
1459b99c9:     	leaq	-0x20(%rbp), %rax
1459b99cd:     	movq	%rax, -0x8(%rbp)
1459b99d1:     	leaq	-0x59b78f8(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
1459b99d8:     	movq	%rax, (%rbp)
1459b99dc:     	leaq	-0x38(%rbp), %rax
1459b99e0:     	movq	%rax, 0x8(%rbp)
1459b99e4:     	leaq	0x1f4125(%rip), %rax    # 0x145badb10 <.text+0x5bacb10>
1459b99eb:     	movq	%rax, 0x10(%rbp)
1459b99ef:     	movq	%r15, %rcx
1459b99f2:     	movq	%r14, %rdx
1459b99f5:     	movq	%rbx, %r8
1459b99f8:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459b99fd:     	nop
1459b99fe:     	movq	-0x20(%rbp), %rdx
1459b9a02:     	testq	%rdx, %rdx
1459b9a05:     	je	0x1459b9940 <.text+0x59b8940>
1459b9a0b:     	movq	-0x18(%rbp), %rcx
1459b9a0f:     	movl	$0x1, %r8d
1459b9a15:     	callq	0x1400021d0 <.text+0x11d0>
1459b9a1a:     	jmp	0x1459b9940 <.text+0x59b8940>
1459b9a1f:     	movq	%rdx, %r8
1459b9a22:     	shrq	$0x2, %r8
1459b9a26:     	movl	%edx, %eax
1459b9a28:     	andl	$0x3, %eax
1459b9a2b:     	cmpq	$0x1, %rax
1459b9a2f:     	sbbq	$-0x1, %r8
1459b9a33:     	movq	$0x1, 0x20(%rsp)
1459b9a3c:     	movl	$0x1, %r9d
1459b9a42:     	movq	%rcx, -0x30(%rbp)
1459b9a46:     	movq	%rbx, %rcx
1459b9a49:     	movq	%rdx, -0x28(%rbp)
1459b9a4d:     	xorl	%edx, %edx
1459b9a4f:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459b9a54:     	movq	-0x28(%rbp), %rdx
1459b9a58:     	movq	-0x30(%rbp), %rcx
1459b9a5c:     	jmp	0x1459b999d <.text+0x59b899d>
1459b9a61:     	movq	0x28(%rbp), %rcx
1459b9a65:     	subq	%rax, %rcx
1459b9a68:     	movq	0x20(%rbp), %rax
1459b9a6c:     	movq	%rcx, (%rax)
1459b9a6f:     	addq	$0xb8, %rsp
1459b9a76:     	popq	%rbx
1459b9a77:     	popq	%rdi
1459b9a78:     	popq	%rsi
1459b9a79:     	popq	%r12
1459b9a7b:     	popq	%r13
1459b9a7d:     	popq	%r14
1459b9a7f:     	popq	%r15
1459b9a81:     	popq	%rbp
1459b9a82:     	retq
