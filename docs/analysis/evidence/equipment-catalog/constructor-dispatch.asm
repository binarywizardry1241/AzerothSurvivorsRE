AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14587b8e0:     	pushq	%rbp
14587b8e1:     	pushq	%r15
14587b8e3:     	pushq	%r14
14587b8e5:     	pushq	%r13
14587b8e7:     	pushq	%r12
14587b8e9:     	pushq	%rsi
14587b8ea:     	pushq	%rdi
14587b8eb:     	pushq	%rbx
14587b8ec:     	subq	$0xe8, %rsp
14587b8f3:     	leaq	0x80(%rsp), %rbp
14587b8fb:     	movaps	%xmm6, 0x50(%rbp)
14587b8ff:     	movq	$-0x2, 0x48(%rbp)
14587b907:     	movq	%rdx, %rdi
14587b90a:     	movq	%rcx, %r13
14587b90d:     	movq	(%rdx), %r14
14587b910:     	movq	0x8(%rdx), %r15
14587b914:     	movq	$0x0, 0x30(%rbp)
14587b91c:     	movq	$0x8, 0x38(%rbp)
14587b924:     	movq	$0x0, 0x40(%rbp)
14587b92c:     	movzbl	0x75(%rdx), %eax
14587b930:     	leaq	0x133ad71(%rip), %rcx   # 0x146bb66a8
14587b937:     	movslq	(%rcx,%rax,4), %rax
14587b93b:     	addq	%rcx, %rax
14587b93e:     	jmpq	*%rax
14587b940:     	cmpl	$0x0, 0x54(%rdi)
14587b944:     	je	0x14587c41b <.text+0x587b41b>
14587b94a:     	leaq	0x30(%rbp), %rcx
14587b94e:     	callq	0x145bfb270 <.text+0x5bfa270>
14587b953:     	nop
14587b954:     	movq	0x38(%rbp), %rax
14587b958:     	movb	$0x24, (%rax)
14587b95b:     	movb	$0x1, 0x8(%rax)
14587b95f:     	movq	%r14, 0x10(%rax)
14587b963:     	movq	%r15, 0x18(%rax)
14587b967:     	movl	$0x3f800000, 0x20(%rax) # imm = 0x3F800000
14587b96e:     	movb	$0x2, 0x24(%rax)
14587b972:     	movq	$0x1, 0x40(%rbp)
14587b97a:     	cmpq	$0x1, 0x30(%rbp)
14587b97f:     	movl	$0x1, %esi
14587b984:     	je	0x14587c41d <.text+0x587b41d>
14587b98a:     	jmp	0x14587c427 <.text+0x587b427>
14587b98f:     	leaq	0x30(%rbp), %rcx
14587b993:     	callq	0x145bfb270 <.text+0x5bfa270>
14587b998:     	nop
14587b999:     	movq	0x38(%rbp), %rax
14587b99d:     	movb	$0x24, (%rax)
14587b9a0:     	movb	$0x1, 0x8(%rax)
14587b9a4:     	movq	%r14, 0x10(%rax)
14587b9a8:     	movq	%r15, 0x18(%rax)
14587b9ac:     	movl	$0x3f19999a, 0x20(%rax) # imm = 0x3F19999A
14587b9b3:     	movb	$0x0, 0x24(%rax)
14587b9b7:     	movq	$0x1, 0x40(%rbp)
14587b9bf:     	movq	0x30(%rdi), %rax
14587b9c3:     	movq	0x38(%rdi), %rcx
14587b9c7:     	xorl	%edx, %edx
14587b9c9:     	nopl	(%rax)
14587b9d0:     	cmpq	%rdx, %rcx
14587b9d3:     	je	0x14587c2cb <.text+0x587b2cb>
14587b9d9:     	cmpb	$0x3, (%rax,%rdx)
14587b9dd:     	leaq	0x1(%rdx), %rdx
14587b9e1:     	jne	0x14587b9d0 <.text+0x587a9d0>
14587b9e3:     	cmpq	$0x1, 0x30(%rbp)
14587b9e8:     	jne	0x14587b9f4 <.text+0x587a9f4>
14587b9ea:     	leaq	0x30(%rbp), %rcx
14587b9ee:     	callq	0x145bfb270 <.text+0x5bfa270>
14587b9f3:     	nop
14587b9f4:     	movq	0x38(%rbp), %rax
14587b9f8:     	movb	$0x24, 0x40(%rax)
14587b9fc:     	movb	$0x1, 0x48(%rax)
14587ba00:     	movq	%r14, 0x50(%rax)
14587ba04:     	movq	%r15, 0x58(%rax)
14587ba08:     	movl	$0x3ecccccd, 0x60(%rax) # imm = 0x3ECCCCCD
14587ba0f:     	movb	$0x3, 0x64(%rax)
14587ba13:     	movq	$0x2, 0x40(%rbp)
14587ba1b:     	movl	$0x2, %ebx
14587ba20:     	jmp	0x14587c2d0 <.text+0x587b2d0>
14587ba25:     	cmpl	$0x0, 0x54(%rdi)
14587ba29:     	je	0x14587c385 <.text+0x587b385>
14587ba2f:     	leaq	0x30(%rbp), %rcx
14587ba33:     	callq	0x145bfb270 <.text+0x5bfa270>
14587ba38:     	nop
14587ba39:     	movq	0x38(%rbp), %rax
14587ba3d:     	movb	$0x24, (%rax)
14587ba40:     	movb	$0x1, 0x8(%rax)
14587ba44:     	movq	%r14, 0x10(%rax)
14587ba48:     	movq	%r15, 0x18(%rax)
14587ba4c:     	movl	$0x40800000, 0x20(%rax) # imm = 0x40800000
14587ba53:     	movb	$0x2, 0x24(%rax)
14587ba57:     	movq	$0x1, 0x40(%rbp)
14587ba5f:     	cmpq	$0x1, 0x30(%rbp)
14587ba64:     	movl	$0x1, %esi
14587ba69:     	je	0x14587c387 <.text+0x587b387>
14587ba6f:     	jmp	0x14587c391 <.text+0x587b391>
