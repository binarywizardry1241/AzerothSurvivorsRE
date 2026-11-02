
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552b8f0:     	pushq	%rbp
14552b8f1:     	pushq	%r15
14552b8f3:     	pushq	%r14
14552b8f5:     	pushq	%r13
14552b8f7:     	pushq	%r12
14552b8f9:     	pushq	%rsi
14552b8fa:     	pushq	%rdi
14552b8fb:     	pushq	%rbx
14552b8fc:     	subq	$0xb8, %rsp
14552b903:     	leaq	0x80(%rsp), %rbp
14552b90b:     	movaps	%xmm6, 0x20(%rbp)
14552b90f:     	movq	$-0x2, 0x18(%rbp)
14552b917:     	movq	%rdx, %rbx
14552b91a:     	movq	%rcx, %rsi
14552b91d:     	leaq	0x30(%rdx), %r8
14552b921:     	leaq	-0x40(%rbp), %rcx
14552b925:     	callq	0x1455149f0 <.text+0x55139f0>
14552b92a:     	cmpl	$0x1, -0x40(%rbp)
14552b92e:     	jne	0x14552ba20 <.text+0x552aa20>
14552b934:     	movq	%rsi, -0x8(%rbp)
14552b938:     	movss	-0x38(%rbp), %xmm6
14552b93d:     	movq	-0x30(%rbp), %rsi
14552b941:     	callq	0x140002200 <.text+0x1200>
14552b946:     	movl	$0x40, %ecx
14552b94b:     	movl	$0x8, %edx
14552b950:     	callq	0x1400021c0 <.text+0x11c0>
14552b955:     	testq	%rax, %rax
14552b958:     	je	0x14552ba67 <.text+0x552aa67>
14552b95e:     	movq	%rax, %rdi
14552b961:     	movss	%xmm6, (%rax)
14552b965:     	movq	%rsi, 0x8(%rax)
14552b969:     	movq	$0x4, (%rbp)
14552b971:     	movq	%rax, 0x8(%rbp)
14552b975:     	movq	$0x1, 0x10(%rbp)
14552b97d:     	movq	0x30(%rbx), %rax
14552b981:     	movq	%rax, -0x10(%rbp)
14552b985:     	movups	(%rbx), %xmm0
14552b988:     	movups	0x10(%rbx), %xmm1
14552b98c:     	movups	0x20(%rbx), %xmm2
14552b990:     	movaps	%xmm2, -0x20(%rbp)
14552b994:     	movaps	%xmm1, -0x30(%rbp)
14552b998:     	movaps	%xmm0, -0x40(%rbp)
14552b99c:     	leaq	-0x10(%rbp), %rbx
14552b9a0:     	movl	$0x1, %r14d
14552b9a6:     	movl	$0x18, %esi
14552b9ab:     	leaq	-0x58(%rbp), %r15
14552b9af:     	leaq	-0x40(%rbp), %r12
14552b9b3:     	jmp	0x14552b9d5 <.text+0x552a9d5>
14552b9b5:     	nopw	%cs:(%rax,%rax)
14552b9c0:     	movss	%xmm6, -0x8(%rdi,%rsi)
14552b9c6:     	movq	%r13, (%rdi,%rsi)
14552b9ca:     	incq	%r14
14552b9cd:     	movq	%r14, 0x10(%rbp)
14552b9d1:     	addq	$0x10, %rsi
14552b9d5:     	movq	%r15, %rcx
14552b9d8:     	movq	%r12, %rdx
14552b9db:     	movq	%rbx, %r8
14552b9de:     	callq	0x1455149f0 <.text+0x55139f0>
14552b9e3:     	nop
14552b9e4:     	cmpl	$0x1, -0x58(%rbp)
14552b9e8:     	jne	0x14552ba39 <.text+0x552aa39>
14552b9ea:     	movss	-0x50(%rbp), %xmm6
14552b9ef:     	movq	-0x48(%rbp), %r13
14552b9f3:     	cmpq	(%rbp), %r14
14552b9f7:     	jne	0x14552b9c0 <.text+0x552a9c0>
14552b9f9:     	movq	$0x10, 0x20(%rsp)
14552ba02:     	movl	$0x1, %r8d
14552ba08:     	movl	$0x8, %r9d
14552ba0e:     	movq	%rbp, %rcx
14552ba11:     	movq	%r14, %rdx
14552ba14:     	callq	0x145757d40 <.text+0x5756d40>
14552ba19:     	nop
14552ba1a:     	movq	0x8(%rbp), %rdi
14552ba1e:     	jmp	0x14552b9c0 <.text+0x552a9c0>
14552ba20:     	movq	$0x0, (%rsi)
14552ba27:     	movq	$0x8, 0x8(%rsi)
14552ba2f:     	movq	$0x0, 0x10(%rsi)
14552ba37:     	jmp	0x14552ba4c <.text+0x552aa4c>
14552ba39:     	movq	0x10(%rbp), %rax
14552ba3d:     	movq	-0x8(%rbp), %rsi
14552ba41:     	movq	%rax, 0x10(%rsi)
14552ba45:     	movups	(%rbp), %xmm0
14552ba49:     	movups	%xmm0, (%rsi)
14552ba4c:     	movq	%rsi, %rax
14552ba4f:     	movaps	0x20(%rbp), %xmm6
14552ba53:     	addq	$0xb8, %rsp
14552ba5a:     	popq	%rbx
14552ba5b:     	popq	%rdi
14552ba5c:     	popq	%rsi
14552ba5d:     	popq	%r12
14552ba5f:     	popq	%r13
14552ba61:     	popq	%r14
14552ba63:     	popq	%r15
14552ba65:     	popq	%rbp
14552ba66:     	retq
14552ba67:     	movl	$0x8, %ecx
14552ba6c:     	movl	$0x40, %edx
14552ba71:     	callq	0x1458e721b <.text+0x58e621b>
14552ba76:     	ud2
