Disassembly of section .text:

0000000140001000 <.text>:
1458dc8c0:     	pushq	%rbp
1458dc8c1:     	pushq	%rsi
1458dc8c2:     	pushq	%rdi
1458dc8c3:     	pushq	%rbx
1458dc8c4:     	subq	$0x98, %rsp
1458dc8cb:     	leaq	0x80(%rsp), %rbp
1458dc8d3:     	movq	$-0x2, 0x10(%rbp)
1458dc8db:     	movq	%r9, %rsi
1458dc8de:     	movq	%r8, %rdi
1458dc8e1:     	movq	%rcx, -0x50(%rbp)
1458dc8e5:     	movq	%rdx, -0x48(%rbp)
1458dc8e9:     	leaq	-0x18(%rbp), %rcx
1458dc8ed:     	callq	0x1458dcb00 <.text+0x58dbb00>
1458dc8f2:     	movq	-0x18(%rbp), %rax
1458dc8f6:     	cmpq	$-0x1, %rax
1458dc8fa:     	je	0x1458dca27 <.text+0x58dba27>
1458dc900:     	movq	%rax, -0x20(%rbp)
1458dc904:     	movq	-0x10(%rbp), %rdx
1458dc908:     	movq	-0x8(%rbp), %rbx
1458dc90c:     	movb	$0x1, -0x18(%rbp)
1458dc910:     	leaq	-0x18(%rbp), %rcx
1458dc914:     	movq	%rdx, -0x28(%rbp)
1458dc918:     	movq	%rbx, %r8
1458dc91b:     	callq	0x145b7d7e0 <.text+0x5b7c7e0>
1458dc920:     	nop
1458dc921:     	testq	%rax, %rax
1458dc924:     	je	0x1458dc94d <.text+0x58db94d>
1458dc926:     	movl	%eax, %ecx
1458dc928:     	andl	$0x3, %ecx
1458dc92b:     	leal	-0x2(%rcx), %edx
1458dc92e:     	cmpl	$0x2, %edx
1458dc931:     	jb	0x1458dc94d <.text+0x58db94d>
1458dc933:     	testq	%rcx, %rcx
1458dc936:     	je	0x1458dc94d <.text+0x58db94d>
1458dc938:     	decq	%rax
1458dc93b:     	leaq	-0x10(%rbp), %rcx
1458dc93f:     	movq	%rax, -0x10(%rbp)
1458dc943:     	movb	$0x3, -0x18(%rbp)
1458dc947:     	callq	0x145baee60 <.text+0x5bade60>
1458dc94c:     	nop
1458dc94d:     	leaq	-0x50(%rbp), %rax
1458dc951:     	movq	%rax, -0x18(%rbp)
1458dc955:     	leaq	-0x58da89c(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458dc95c:     	movq	%rax, -0x10(%rbp)
1458dc960:     	leaq	0x157dd79(%rip), %rdx   # 0x146e5a6e0
1458dc967:     	leaq	-0x40(%rbp), %rcx
1458dc96b:     	leaq	-0x18(%rbp), %r8
1458dc96f:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458dc974:     	nop
1458dc975:     	movq	-0x38(%rbp), %r9
1458dc979:     	movq	-0x30(%rbp), %rax
1458dc97d:     	movq	%rax, 0x20(%rsp)
1458dc982:     	leaq	-0x18(%rbp), %rcx
1458dc986:     	movq	-0x28(%rbp), %rdx
1458dc98a:     	movq	%rbx, %r8
1458dc98d:     	movq	%r9, 0x8(%rbp)
1458dc991:     	callq	0x145b763e0 <.text+0x5b753e0>
1458dc996:     	nop
1458dc997:     	movq	-0x40(%rbp), %rdx
1458dc99b:     	testq	%rdx, %rdx
1458dc99e:     	je	0x1458dc9af <.text+0x58db9af>
1458dc9a0:     	movl	$0x1, %r8d
1458dc9a6:     	movq	0x8(%rbp), %rcx
1458dc9aa:     	callq	0x1400021d0 <.text+0x11d0>
1458dc9af:     	movq	-0x10(%rbp), %rcx
1458dc9b3:     	movq	-0x8(%rbp), %rdx
1458dc9b7:     	movq	%rcx, 0x8(%rbp)
1458dc9bb:     	movq	%rdi, %r8
1458dc9be:     	movq	%rsi, %r9
1458dc9c1:     	callq	0x145b8cdf0 <.text+0x5b8bdf0>
1458dc9c6:     	nop
1458dc9c7:     	movq	%rax, %rsi
1458dc9ca:     	movq	-0x18(%rbp), %rdx
1458dc9ce:     	testq	%rdx, %rdx
1458dc9d1:     	je	0x1458dc9e2 <.text+0x58db9e2>
1458dc9d3:     	movl	$0x1, %r8d
1458dc9d9:     	movq	0x8(%rbp), %rcx
1458dc9dd:     	callq	0x1400021d0 <.text+0x11d0>
1458dc9e2:     	testq	%rsi, %rsi
1458dc9e5:     	je	0x1458dca0e <.text+0x58dba0e>
1458dc9e7:     	movl	%esi, %eax
1458dc9e9:     	andl	$0x3, %eax
1458dc9ec:     	leal	-0x2(%rax), %ecx
1458dc9ef:     	cmpl	$0x2, %ecx
1458dc9f2:     	jb	0x1458dca0e <.text+0x58dba0e>
1458dc9f4:     	testq	%rax, %rax
1458dc9f7:     	je	0x1458dca0e <.text+0x58dba0e>
1458dc9f9:     	decq	%rsi
1458dc9fc:     	leaq	-0x10(%rbp), %rcx
1458dca00:     	movq	%rsi, -0x10(%rbp)
1458dca04:     	movb	$0x3, -0x18(%rbp)
1458dca08:     	callq	0x145baee60 <.text+0x5bade60>
1458dca0d:     	nop
1458dca0e:     	movq	-0x20(%rbp), %rdx
1458dca12:     	testq	%rdx, %rdx
1458dca15:     	je	0x1458dca27 <.text+0x58dba27>
1458dca17:     	movl	$0x1, %r8d
1458dca1d:     	movq	-0x28(%rbp), %rcx
1458dca21:     	callq	0x1400021d0 <.text+0x11d0>
1458dca26:     	nop
1458dca27:     	addq	$0x98, %rsp
1458dca2e:     	popq	%rbx
1458dca2f:     	popq	%rdi
1458dca30:     	popq	%rsi
1458dca31:     	popq	%rbp
1458dca32:     	retq
