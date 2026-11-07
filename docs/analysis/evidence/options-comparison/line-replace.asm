Disassembly of section .text:

0000000140001000 <.text>:
1408f96c0:     	pushq	%rbp
1408f96c1:     	pushq	%r15
1408f96c3:     	pushq	%r14
1408f96c5:     	pushq	%r12
1408f96c7:     	pushq	%rsi
1408f96c8:     	pushq	%rdi
1408f96c9:     	pushq	%rbx
1408f96ca:     	subq	$0x100, %rsp            # imm = 0x100
1408f96d1:     	leaq	0x80(%rsp), %rbp
1408f96d9:     	movq	$-0x2, 0x78(%rbp)
1408f96e1:     	movq	%rdx, %rbx
1408f96e4:     	movq	%rcx, %rsi
1408f96e7:     	leaq	0x38(%rbp), %rcx
1408f96eb:     	callq	0x14091a860 <.text+0x919860>
1408f96f0:     	movq	0x38(%rbp), %r14
1408f96f4:     	cmpq	$-0x1, %r14
1408f96f8:     	je	0x1408f980c <.text+0x8f880c>
1408f96fe:     	movq	0x40(%rbp), %r15
1408f9702:     	callq	0x140002200 <.text+0x1200>
1408f9707:     	movl	$0x60, %ecx
1408f970c:     	movl	$0x8, %edx
1408f9711:     	callq	0x1400021c0 <.text+0x11c0>
1408f9716:     	testq	%rax, %rax
1408f9719:     	je	0x1408f9838 <.text+0x8f8838>
1408f971f:     	movq	%rax, %rdi
1408f9722:     	movq	0x48(%rbp), %rax
1408f9726:     	movq	%rax, 0x10(%rdi)
1408f972a:     	movups	0x38(%rbp), %xmm0
1408f972e:     	movups	%xmm0, (%rdi)
1408f9731:     	movq	$0x4, 0x50(%rbp)
1408f9739:     	movq	%rdi, 0x58(%rbp)
1408f973d:     	movq	$0x1, 0x60(%rbp)
1408f9745:     	movq	0x60(%rbx), %rax
1408f9749:     	movq	%rax, 0x10(%rbp)
1408f974d:     	movups	0x50(%rbx), %xmm0
1408f9751:     	movaps	%xmm0, (%rbp)
1408f9755:     	movups	0x40(%rbx), %xmm0
1408f9759:     	movaps	%xmm0, -0x10(%rbp)
1408f975d:     	movups	(%rbx), %xmm0
1408f9760:     	movups	0x10(%rbx), %xmm1
1408f9764:     	movups	0x20(%rbx), %xmm2
1408f9768:     	movups	0x30(%rbx), %xmm3
1408f976c:     	movaps	%xmm3, -0x20(%rbp)
1408f9770:     	movaps	%xmm2, -0x30(%rbp)
1408f9774:     	movaps	%xmm1, -0x40(%rbp)
1408f9778:     	movaps	%xmm0, -0x50(%rbp)
1408f977c:     	movl	$0x1, %ebx
1408f9781:     	leaq	0x20(%rbp), %r14
1408f9785:     	leaq	-0x50(%rbp), %r15
1408f9789:     	leaq	0x50(%rbp), %r12
1408f978d:     	jmp	0x1408f97ac <.text+0x8f87ac>
1408f978f:     	nop
1408f9790:     	leaq	(%rbx,%rbx,2), %rax
1408f9794:     	movq	0x30(%rbp), %rcx
1408f9798:     	movq	%rcx, 0x10(%rdi,%rax,8)
1408f979d:     	movups	0x20(%rbp), %xmm0
1408f97a1:     	movups	%xmm0, (%rdi,%rax,8)
1408f97a5:     	incq	%rbx
1408f97a8:     	movq	%rbx, 0x60(%rbp)
1408f97ac:     	movq	%r14, %rcx
1408f97af:     	movq	%r15, %rdx
1408f97b2:     	callq	0x14091a860 <.text+0x919860>
1408f97b7:     	nop
1408f97b8:     	movq	0x20(%rbp), %rax
1408f97bc:     	cmpq	$-0x1, %rax
1408f97c0:     	je	0x1408f97fb <.text+0x8f87fb>
1408f97c2:     	cmpq	0x50(%rbp), %rbx
1408f97c6:     	jne	0x1408f9790 <.text+0x8f8790>
1408f97c8:     	movq	%rax, 0x70(%rbp)
1408f97cc:     	movq	0x28(%rbp), %rax
1408f97d0:     	movq	%rax, 0x68(%rbp)
1408f97d4:     	movq	$0x18, 0x20(%rsp)
1408f97dd:     	movl	$0x1, %r8d
1408f97e3:     	movl	$0x8, %r9d
1408f97e9:     	movq	%r12, %rcx
1408f97ec:     	movq	%rbx, %rdx
1408f97ef:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1408f97f4:     	nop
1408f97f5:     	movq	0x58(%rbp), %rdi
1408f97f9:     	jmp	0x1408f9790 <.text+0x8f8790>
1408f97fb:     	movq	0x60(%rbp), %rax
1408f97ff:     	movq	%rax, 0x10(%rsi)
1408f9803:     	movups	0x50(%rbp), %xmm0
1408f9807:     	movups	%xmm0, (%rsi)
1408f980a:     	jmp	0x1408f9823 <.text+0x8f8823>
1408f980c:     	movq	$0x0, (%rsi)
1408f9813:     	movq	$0x8, 0x8(%rsi)
1408f981b:     	movq	$0x0, 0x10(%rsi)
1408f9823:     	movq	%rsi, %rax
1408f9826:     	addq	$0x100, %rsp            # imm = 0x100
1408f982d:     	popq	%rbx
1408f982e:     	popq	%rdi
1408f982f:     	popq	%rsi
1408f9830:     	popq	%r12
1408f9832:     	popq	%r14
1408f9834:     	popq	%r15
1408f9836:     	popq	%rbp
1408f9837:     	retq
1408f9838:     	movq	%r15, 0x68(%rbp)
1408f983c:     	movq	%r14, 0x70(%rbp)
1408f9840:     	movl	$0x8, %ecx
1408f9845:     	movl	$0x60, %edx
1408f984a:     	callq	0x145d6944b <.text+0x5d6844b>
1408f984f:     	nop
1408f9850:     	ud2
