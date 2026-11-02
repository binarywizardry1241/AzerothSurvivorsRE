
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458be720:     	pushq	%r15
1458be722:     	pushq	%r14
1458be724:     	pushq	%r13
1458be726:     	pushq	%r12
1458be728:     	pushq	%rsi
1458be729:     	pushq	%rdi
1458be72a:     	pushq	%rbp
1458be72b:     	pushq	%rbx
1458be72c:     	subq	$0x68, %rsp
1458be730:     	movdqa	%xmm8, 0x50(%rsp)
1458be737:     	movdqa	%xmm7, 0x40(%rsp)
1458be73d:     	movdqa	%xmm6, 0x30(%rsp)
1458be743:     	movq	%rdx, %rsi
1458be746:     	movq	%rcx, %rdi
1458be749:     	movl	0x278dcb1(%rip), %eax   # 0x14804c400
1458be74f:     	testl	%eax, %eax
1458be751:     	jne	0x1458be94b <.text+0x58bd94b>
1458be757:     	movq	0x278dc92(%rip), %rbx   # 0x14804c3f0
1458be75e:     	movq	0x278dc93(%rip), %rdx   # 0x14804c3f8
1458be765:     	movq	0x2790964(%rip), %rcx   # 0x14804f0d0
1458be76c:     	leaq	-0x1(%rdx), %rax
1458be770:     	cmpq	%rcx, %rax
1458be773:     	cmovbq	%rax, %rcx
1458be777:     	cmpq	%rdx, %rcx
1458be77a:     	jae	0x1458be95c <.text+0x58bd95c>
1458be780:     	leaq	(%rcx,%rcx,2), %r15
1458be784:     	shlq	$0x4, %r15
1458be788:     	cmpq	$0x0, 0x18(%rbx,%r15)
1458be78e:     	je	0x1458be85e <.text+0x58bd85e>
1458be794:     	addq	%rbx, %r15
1458be797:     	leaq	0x20(%r15), %rcx
1458be79b:     	movq	%rdi, %rdx
1458be79e:     	movq	%rsi, %r8
1458be7a1:     	callq	0x140185d50 <.text+0x184d50>
1458be7a6:     	movq	%rax, %rcx
1458be7a9:     	shrq	$0x39, %rcx
1458be7ad:     	movq	(%r15), %r14
1458be7b0:     	movq	0x8(%r15), %r15
1458be7b4:     	movd	%ecx, %xmm0
1458be7b8:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1458be7bc:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1458be7c1:     	pshufd	$0x44, %xmm0, %xmm6     # xmm6 = xmm0[0,1,0,1]
1458be7c6:     	xorl	%edx, %edx
1458be7c8:     	pcmpeqd	%xmm7, %xmm7
1458be7cc:     	andq	%r15, %rax
1458be7cf:     	movdqu	(%r14,%rax), %xmm8
1458be7d5:     	movdqa	%xmm8, %xmm0
1458be7da:     	pcmpeqb	%xmm6, %xmm0
1458be7de:     	pmovmskb	%xmm0, %r13d
1458be7e3:     	testl	%r13d, %r13d
1458be7e6:     	je	0x1458be840 <.text+0x58bd840>
1458be7e8:     	movq	%rdx, 0x28(%rsp)
1458be7ed:     	tzcntl	%r13d, %ecx
1458be7f2:     	movq	%rax, %r12
1458be7f5:     	addq	%rax, %rcx
1458be7f8:     	andq	%r15, %rcx
1458be7fb:     	negq	%rcx
1458be7fe:     	leaq	(%rcx,%rcx,4), %rax
1458be802:     	cmpq	-0x18(%r14,%rax,8), %rsi
1458be807:     	jne	0x1458be824 <.text+0x58bd824>
1458be809:     	leaq	(%r14,%rax,8), %rbp
1458be80d:     	movq	-0x20(%rbp), %rdx
1458be811:     	movq	%rdi, %rcx
1458be814:     	movq	%rsi, %r8
1458be817:     	callq	0x145bf1d47 <.text+0x5bf0d47>
1458be81c:     	testl	%eax, %eax
1458be81e:     	je	0x1458be91a <.text+0x58bd91a>
1458be824:     	leal	-0x1(%r13), %eax
1458be828:     	andw	%r13w, %ax
1458be82c:     	movl	%eax, %r13d
1458be82f:     	movq	%r12, %rax
1458be832:     	movq	0x28(%rsp), %rdx
1458be837:     	jne	0x1458be7ed <.text+0x58bd7ed>
1458be839:     	nopl	(%rax)
1458be840:     	pcmpeqb	%xmm7, %xmm8
1458be845:     	pmovmskb	%xmm8, %ecx
1458be84a:     	testl	%ecx, %ecx
1458be84c:     	jne	0x1458be85e <.text+0x58bd85e>
1458be84e:     	addq	%rdx, %rax
1458be851:     	addq	$0x10, %rax
1458be855:     	addq	$0x10, %rdx
1458be859:     	jmp	0x1458be7cc <.text+0x58bd7cc>
1458be85e:     	cmpq	$0x0, 0x18(%rbx)
1458be863:     	je	0x1458be924 <.text+0x58bd924>
1458be869:     	leaq	0x20(%rbx), %rcx
1458be86d:     	movq	%rdi, %rdx
1458be870:     	movq	%rsi, %r8
1458be873:     	callq	0x140185d50 <.text+0x184d50>
1458be878:     	movq	%rax, %rcx
1458be87b:     	shrq	$0x39, %rcx
1458be87f:     	movq	(%rbx), %r14
1458be882:     	movq	0x8(%rbx), %rbx
1458be886:     	movd	%ecx, %xmm0
1458be88a:     	punpcklbw	%xmm0, %xmm0    # xmm0 = xmm0[0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7]
1458be88e:     	pshuflw	$0x0, %xmm0, %xmm0      # xmm0 = xmm0[0,0,0,0,4,5,6,7]
1458be893:     	pshufd	$0x44, %xmm0, %xmm6     # xmm6 = xmm0[0,1,0,1]
1458be898:     	pcmpeqd	%xmm7, %xmm7
1458be89c:     	xorl	%r15d, %r15d
1458be89f:     	andq	%rbx, %rax
1458be8a2:     	movdqu	(%r14,%rax), %xmm8
1458be8a8:     	movdqa	%xmm8, %xmm0
1458be8ad:     	pcmpeqb	%xmm6, %xmm0
1458be8b1:     	pmovmskb	%xmm0, %r12d
1458be8b6:     	testl	%r12d, %r12d
1458be8b9:     	je	0x1458be8ff <.text+0x58bd8ff>
1458be8bb:     	tzcntl	%r12d, %ecx
1458be8c0:     	movq	%rax, %r13
1458be8c3:     	addq	%rax, %rcx
1458be8c6:     	andq	%rbx, %rcx
1458be8c9:     	negq	%rcx
1458be8cc:     	leaq	(%rcx,%rcx,4), %rax
1458be8d0:     	cmpq	-0x18(%r14,%rax,8), %rsi
1458be8d5:     	jne	0x1458be8ee <.text+0x58bd8ee>
1458be8d7:     	leaq	(%r14,%rax,8), %rbp
1458be8db:     	movq	-0x20(%rbp), %rdx
1458be8df:     	movq	%rdi, %rcx
1458be8e2:     	movq	%rsi, %r8
1458be8e5:     	callq	0x145bf1d47 <.text+0x5bf0d47>
1458be8ea:     	testl	%eax, %eax
1458be8ec:     	je	0x1458be91a <.text+0x58bd91a>
1458be8ee:     	leal	-0x1(%r12), %eax
1458be8f3:     	andw	%r12w, %ax
1458be8f7:     	movl	%eax, %r12d
1458be8fa:     	movq	%r13, %rax
1458be8fd:     	jne	0x1458be8bb <.text+0x58bd8bb>
1458be8ff:     	pcmpeqb	%xmm7, %xmm8
1458be904:     	pmovmskb	%xmm8, %ecx
1458be909:     	testl	%ecx, %ecx
1458be90b:     	jne	0x1458be928 <.text+0x58bd928>
1458be90d:     	addq	%r15, %rax
1458be910:     	addq	$0x10, %rax
1458be914:     	addq	$0x10, %r15
1458be918:     	jmp	0x1458be89f <.text+0x58bd89f>
1458be91a:     	movq	-0x10(%rbp), %rax
1458be91e:     	movq	-0x8(%rbp), %rdx
1458be922:     	jmp	0x1458be92a <.text+0x58bd92a>
1458be924:     	xorl	%eax, %eax
1458be926:     	jmp	0x1458be92a <.text+0x58bd92a>
1458be928:     	xorl	%eax, %eax
1458be92a:     	movaps	0x30(%rsp), %xmm6
1458be92f:     	movaps	0x40(%rsp), %xmm7
1458be934:     	movaps	0x50(%rsp), %xmm8
1458be93a:     	addq	$0x68, %rsp
1458be93e:     	popq	%rbx
1458be93f:     	popq	%rbp
1458be940:     	popq	%rdi
1458be941:     	popq	%rsi
1458be942:     	popq	%r12
1458be944:     	popq	%r13
1458be946:     	popq	%r14
1458be948:     	popq	%r15
1458be94a:     	retq
1458be94b:     	leaq	0x278da96(%rip), %rcx   # 0x14804c3e8
1458be952:     	callq	0x145d786cf <.text+0x5d776cf>
1458be957:     	jmp	0x1458be757 <.text+0x58bd757>
1458be95c:     	leaq	0x132afbd(%rip), %r8    # 0x146be9920
1458be963:     	callq	0x145d93aa3 <.text+0x5d92aa3>
1458be968:     	ud2
