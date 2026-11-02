1459ad750:     	pushq	%rbp
1459ad751:     	pushq	%r15
1459ad753:     	pushq	%r14
1459ad755:     	pushq	%r13
1459ad757:     	pushq	%r12
1459ad759:     	pushq	%rsi
1459ad75a:     	pushq	%rdi
1459ad75b:     	pushq	%rbx
1459ad75c:     	subq	$0x98, %rsp
1459ad763:     	leaq	0x80(%rsp), %rbp
1459ad76b:     	movq	$-0x2, 0x10(%rbp)
1459ad773:     	movq	%r8, -0x18(%rbp)
1459ad777:     	movq	0x8(%rcx), %rdi
1459ad77b:     	movq	%rcx, -0x8(%rbp)
1459ad77f:     	movq	0x18(%rcx), %rax
1459ad783:     	movq	%rax, -0x28(%rbp)
1459ad787:     	movl	0x20(%rdx), %eax
1459ad78a:     	movq	%rax, -0x20(%rbp)
1459ad78e:     	movl	0x28(%rdx), %r14d
1459ad792:     	movq	0x8(%rdx), %rsi
1459ad796:     	movq	%rdx, -0x10(%rbp)
1459ad79a:     	movq	0x10(%rdx), %rbx
1459ad79e:     	nop
1459ad7a0:     	cmpq	-0x28(%rbp), %rdi
1459ad7a4:     	je	0x1459ad8dd <.text+0x59ac8dd>
1459ad7aa:     	movl	(%rdi), %r13d
1459ad7ad:     	addq	$0x4, %rdi
1459ad7b1:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
1459ad7b6:     	xorl	%r8d, %r8d
1459ad7b9:     	movq	-0x20(%rbp), %r9
1459ad7bd:     	nopl	(%rax)
1459ad7c0:     	subq	$0x1, %r9
1459ad7c4:     	jb	0x1459ad860 <.text+0x59ac860>
1459ad7ca:     	movl	%r8d, %eax
1459ad7cd:     	leaq	0x14(%rax), %rcx
1459ad7d1:     	addq	$0x18, %rax
1459ad7d5:     	cmpq	%rbx, %rax
1459ad7d8:     	ja	0x1459ad911 <.text+0x59ac911>
1459ad7de:     	incl	%edx
1459ad7e0:     	addl	%r14d, %r8d
1459ad7e3:     	cmpl	%r13d, (%rsi,%rcx)
1459ad7e7:     	jne	0x1459ad7c0 <.text+0x59ac7c0>
1459ad7e9:     	movq	-0x10(%rbp), %rcx
1459ad7ed:     	movl	$0x5, %r8d
1459ad7f3:     	callq	0x145873b10 <.text+0x5872b10>
1459ad7f8:     	nop
1459ad7f9:     	movq	%rdx, %r12
1459ad7fc:     	testq	%rdx, %rdx
1459ad7ff:     	je	0x1459ad860 <.text+0x59ac860>
1459ad801:     	testq	%r12, %r12
1459ad804:     	js	0x1459ad8cf <.text+0x59ac8cf>
1459ad80a:     	movq	%rax, %r15
1459ad80d:     	callq	0x140002200 <.text+0x1200>
1459ad812:     	movl	$0x1, %edx
1459ad817:     	movq	%r12, %rcx
1459ad81a:     	callq	0x1400021c0 <.text+0x11c0>
1459ad81f:     	testq	%rax, %rax
1459ad822:     	je	0x1459ad926 <.text+0x59ac926>
1459ad828:     	movq	%rax, 0x8(%rbp)
1459ad82c:     	movq	%rax, %rcx
1459ad82f:     	movq	%r15, %rdx
1459ad832:     	movq	%r12, %r8
1459ad835:     	callq	0x145bc977b <.text+0x5bc877b>
1459ad83a:     	movq	%r12, (%rbp)
1459ad83e:     	leaq	-0x30(%rbp), %rax
1459ad842:     	movq	%r12, (%rax)
1459ad845:     	movq	(%rbp), %rax
1459ad849:     	cmpq	$-0x1, %rax
1459ad84d:     	jne	0x1459ad87b <.text+0x59ac87b>
1459ad84f:     	jmp	0x1459ad7a0 <.text+0x59ac7a0>
1459ad854:     	nopw	%cs:(%rax,%rax)
1459ad860:     	movq	%rbp, %rax
1459ad863:     	movq	$-0x1, %r12
1459ad86a:     	movq	%r12, (%rax)
1459ad86d:     	movq	(%rbp), %rax
1459ad871:     	cmpq	$-0x1, %rax
1459ad875:     	je	0x1459ad7a0 <.text+0x59ac7a0>
1459ad87b:     	movq	-0x30(%rbp), %rcx
1459ad87f:     	movq	%rax, -0x48(%rbp)
1459ad883:     	movq	0x8(%rbp), %rax
1459ad887:     	movq	%rax, -0x40(%rbp)
1459ad88b:     	movq	%rcx, -0x38(%rbp)
1459ad88f:     	leaq	-0x60(%rbp), %rcx
1459ad893:     	movq	-0x18(%rbp), %rdx
1459ad897:     	movl	%r13d, %r8d
1459ad89a:     	leaq	-0x48(%rbp), %r9
1459ad89e:     	callq	0x1407cf030 <.text+0x7ce030>
1459ad8a3:     	nop
1459ad8a4:     	movq	-0x60(%rbp), %rdx
1459ad8a8:     	cmpq	$-0x1, %rdx
1459ad8ac:     	je	0x1459ad7a0 <.text+0x59ac7a0>
1459ad8b2:     	testq	%rdx, %rdx
1459ad8b5:     	je	0x1459ad7a0 <.text+0x59ac7a0>
1459ad8bb:     	movq	-0x58(%rbp), %rcx
1459ad8bf:     	movl	$0x1, %r8d
1459ad8c5:     	callq	0x1400021d0 <.text+0x11d0>
1459ad8ca:     	jmp	0x1459ad7a0 <.text+0x59ac7a0>
1459ad8cf:     	xorl	%ecx, %ecx
1459ad8d1:     	movq	0x8(%rbp), %rdx
1459ad8d5:     	callq	0x145d6944b <.text+0x5d6844b>
1459ad8da:     	nop
1459ad8db:     	jmp	0x1459ad924 <.text+0x59ac924>
1459ad8dd:     	movq	-0x8(%rbp), %rax
1459ad8e1:     	movq	0x10(%rax), %rdx
1459ad8e5:     	testq	%rdx, %rdx
1459ad8e8:     	je	0x1459ad8fd <.text+0x59ac8fd>
1459ad8ea:     	movq	(%rax), %rcx
1459ad8ed:     	shlq	$0x2, %rdx
1459ad8f1:     	movl	$0x4, %r8d
1459ad8f7:     	callq	0x1400021d0 <.text+0x11d0>
1459ad8fc:     	nop
1459ad8fd:     	addq	$0x98, %rsp
1459ad904:     	popq	%rbx
1459ad905:     	popq	%rdi
1459ad906:     	popq	%rsi
1459ad907:     	popq	%r12
1459ad909:     	popq	%r13
1459ad90b:     	popq	%r14
1459ad90d:     	popq	%r15
1459ad90f:     	popq	%rbp
1459ad910:     	retq
1459ad911:     	leaq	0x11f33d0(%rip), %r9    # 0x146ba0ce8
1459ad918:     	movq	%rax, %rdx
1459ad91b:     	movq	%rbx, %r8
1459ad91e:     	callq	0x145d699f0 <.text+0x5d689f0>
1459ad923:     	nop
1459ad924:     	ud2
1459ad926:     	movq	%r12, 0x8(%rbp)
1459ad92a:     	movl	$0x1, %ecx
1459ad92f:     	jmp	0x1459ad8d1 <.text+0x59ac8d1>
