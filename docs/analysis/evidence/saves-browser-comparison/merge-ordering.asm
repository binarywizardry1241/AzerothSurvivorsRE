
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14000a660:     	pushq	%r15
14000a662:     	pushq	%r14
14000a664:     	pushq	%r13
14000a666:     	pushq	%r12
14000a668:     	pushq	%rsi
14000a669:     	pushq	%rdi
14000a66a:     	pushq	%rbp
14000a66b:     	pushq	%rbx
14000a66c:     	subq	$0x2e8, %rsp            # imm = 0x2E8
14000a673:     	movq	%r9, 0x48(%rsp)
14000a678:     	movq	%r8, 0x50(%rsp)
14000a67d:     	movq	%rcx, 0x60(%rsp)
14000a682:     	cmpq	$0x2, %rdx
14000a686:     	jb	0x14000ac6c <.text+0x9c6c>
14000a68c:     	movq	%rdx, %r14
14000a68f:     	movabsq	$0x4000000000000000, %rax # imm = 0x4000000000000000
14000a699:     	xorl	%edx, %edx
14000a69b:     	divq	%r14
14000a69e:     	cmpq	$0x1, %rdx
14000a6a2:     	sbbq	$-0x1, %rax
14000a6a6:     	movq	%rax, 0x80(%rsp)
14000a6ae:     	cmpq	$0x1001, %r14           # imm = 0x1001
14000a6b5:     	jae	0x14000a6d2 <.text+0x96d2>
14000a6b7:     	movq	%r14, %rax
14000a6ba:     	shrq	%rax
14000a6bd:     	movq	%r14, %rcx
14000a6c0:     	subq	%rax, %rcx
14000a6c3:     	cmpq	$0x40, %rcx
14000a6c7:     	movl	$0x40, %eax
14000a6cc:     	cmovbq	%rcx, %rax
14000a6d0:     	jmp	0x14000a6da <.text+0x96da>
14000a6d2:     	movq	%r14, %rcx
14000a6d5:     	callq	0x145732bd0 <.text+0x5731bd0>
14000a6da:     	movq	%rax, 0x58(%rsp)
14000a6df:     	movq	0x60(%rsp), %rax
14000a6e4:     	leaq	0xb0(%rax), %rcx
14000a6eb:     	movq	%rcx, 0x68(%rsp)
14000a6f0:     	leaq	0x40(%rax), %rcx
14000a6f4:     	movq	%rcx, 0x78(%rsp)
14000a6f9:     	addq	$-0x8, %rax
14000a6fd:     	movq	%rax, 0x70(%rsp)
14000a702:     	movl	$0x1, %r13d
14000a708:     	xorl	%r10d, %r10d
14000a70b:     	xorl	%edi, %edi
14000a70d:     	movq	%r14, 0x88(%rsp)
14000a715:     	subq	%r10, %r14
14000a718:     	jbe	0x14000a7a0 <.text+0x97a0>
14000a71e:     	nop
14000a720:     	leaq	(%r10,%r10,8), %r12
14000a724:     	movq	0x60(%rsp), %rax
14000a729:     	leaq	(%rax,%r12,8), %rbp
14000a72d:     	cmpq	0x58(%rsp), %r14
14000a732:     	jae	0x14000a7c0 <.text+0x97c0>
14000a738:     	cmpb	$0x0, 0x350(%rsp)
14000a740:     	je	0x14000a7f0 <.text+0x97f0>
14000a746:     	cmpq	$0x20, %r14
14000a74a:     	movl	$0x20, %eax
14000a74f:     	cmovaeq	%rax, %r14
14000a753:     	movq	0x358(%rsp), %rax
14000a75b:     	movq	%rax, 0x30(%rsp)
14000a760:     	movq	$0x0, 0x28(%rsp)
14000a769:     	movl	$0x0, 0x20(%rsp)
14000a771:     	movq	%rbp, %rcx
14000a774:     	movq	%r14, %rdx
14000a777:     	movq	0x50(%rsp), %r8
14000a77c:     	movq	0x48(%rsp), %r9
14000a781:     	movq	%r10, %rsi
14000a784:     	callq	0x14017ce30 <.text+0x17be30>
14000a789:     	movq	%rsi, %r10
14000a78c:     	movl	%r14d, %eax
14000a78f:     	leaq	0x1(,%rax,2), %r14
14000a797:     	jmp	0x14000aa44 <.text+0x9a44>
14000a79c:     	nopl	(%rax)
14000a7a0:     	xorl	%r14d, %r14d
14000a7a3:     	movl	$0x1, %eax
14000a7a8:     	movq	%rax, 0x40(%rsp)
14000a7ad:     	cmpq	$0x2, %rdi
14000a7b1:     	jae	0x14000aacc <.text+0x9acc>
14000a7b7:     	jmp	0x14000abe5 <.text+0x9be5>
14000a7bc:     	nopl	(%rax)
14000a7c0:     	cmpq	$0x2, %r14
14000a7c4:     	jb	0x14000aa3c <.text+0x9a3c>
14000a7ca:     	movl	0x60(%rbp), %r15d
14000a7ce:     	cmpl	$0x1, 0x18(%rbp)
14000a7d2:     	movq	%r14, 0x40(%rsp)
14000a7d7:     	jne	0x14000a804 <.text+0x9804>
14000a7d9:     	testb	%r15b, %r15b
14000a7dc:     	je	0x14000a83b <.text+0x983b>
14000a7de:     	movq	0x64(%rbp), %rax
14000a7e2:     	cmpq	%rax, 0x1c(%rbp)
14000a7e6:     	je	0x14000a809 <.text+0x9809>
14000a7e8:     	jge	0x14000a83b <.text+0x983b>
14000a7ea:     	jmp	0x14000a851 <.text+0x9851>
14000a7ec:     	nopl	(%rax)
14000a7f0:     	movq	0x58(%rsp), %rax
14000a7f5:     	cmpq	%rax, %r14
14000a7f8:     	cmovaeq	%rax, %r14
14000a7fc:     	addq	%r14, %r14
14000a7ff:     	jmp	0x14000aa44 <.text+0x9a44>
14000a804:     	testb	%r15b, %r15b
14000a807:     	jne	0x14000a851 <.text+0x9851>
14000a809:     	movq	0x50(%rbp), %rcx
14000a80d:     	movq	0x58(%rbp), %rax
14000a811:     	movq	0x8(%rbp), %rdx
14000a815:     	movq	0x10(%rbp), %r8
14000a819:     	movq	%rax, %rbx
14000a81c:     	subq	%r8, %rbx
14000a81f:     	cmovbq	%rax, %r8
14000a823:     	movq	%r10, %rsi
14000a826:     	callq	0x1457731e7 <.text+0x57721e7>
14000a82b:     	movq	%rsi, %r10
14000a82e:     	cltq
14000a830:     	testl	%eax, %eax
14000a832:     	cmovneq	%rax, %rbx
14000a836:     	testq	%rbx, %rbx
14000a839:     	js	0x14000a851 <.text+0x9851>
14000a83b:     	cmpq	$0x2, %r14
14000a83f:     	jne	0x14000a8f5 <.text+0x98f5>
14000a845:     	movl	$0x2, %ebx
14000a84a:     	xorl	%eax, %eax
14000a84c:     	jmp	0x14000a991 <.text+0x9991>
14000a851:     	movl	$0x2, %ebx
14000a856:     	cmpq	$0x2, %r14
14000a85a:     	je	0x14000a98f <.text+0x998f>
14000a860:     	movq	0x68(%rsp), %rax
14000a865:     	leaq	(%rax,%r12,8), %r12
14000a869:     	jmp	0x14000a886 <.text+0x9886>
14000a86b:     	nopl	(%rax,%rax)
14000a870:     	jge	0x14000a98f <.text+0x998f>
14000a876:     	incq	%rbx
14000a879:     	addq	$0x48, %r12
14000a87d:     	cmpq	%rbx, %r14
14000a880:     	je	0x14000a98c <.text+0x998c>
14000a886:     	cmpl	$0x1, %r15d
14000a88a:     	movl	-0x8(%r12), %r15d
14000a88f:     	jne	0x14000a8b0 <.text+0x98b0>
14000a891:     	testb	%r15b, %r15b
14000a894:     	je	0x14000a98f <.text+0x998f>
14000a89a:     	movq	-0x4(%r12), %rax
14000a89f:     	cmpq	%rax, -0x4c(%r12)
14000a8a4:     	jne	0x14000a870 <.text+0x9870>
14000a8a6:     	jmp	0x14000a8b5 <.text+0x98b5>
14000a8a8:     	nopl	(%rax,%rax)
14000a8b0:     	testb	%r15b, %r15b
14000a8b3:     	jne	0x14000a876 <.text+0x9876>
14000a8b5:     	movq	-0x18(%r12), %rcx
14000a8ba:     	movq	-0x10(%r12), %rax
14000a8bf:     	movq	-0x60(%r12), %rdx
14000a8c4:     	movq	-0x58(%r12), %r8
14000a8c9:     	movq	%rax, %r14
14000a8cc:     	subq	%r8, %r14
14000a8cf:     	cmovbq	%rax, %r8
14000a8d3:     	movq	%r10, %rsi
14000a8d6:     	callq	0x1457731e7 <.text+0x57721e7>
14000a8db:     	movq	%rsi, %r10
14000a8de:     	cltq
14000a8e0:     	testl	%eax, %eax
14000a8e2:     	cmovneq	%rax, %r14
14000a8e6:     	testq	%r14, %r14
14000a8e9:     	movq	0x40(%rsp), %r14
14000a8ee:     	js	0x14000a876 <.text+0x9876>
14000a8f0:     	jmp	0x14000a98f <.text+0x998f>
14000a8f5:     	movq	0x68(%rsp), %rax
14000a8fa:     	leaq	(%rax,%r12,8), %r14
14000a8fe:     	movl	$0x2, %ebx
14000a903:     	jmp	0x14000a91e <.text+0x991e>
14000a905:     	jl	0x14000a977 <.text+0x9977>
14000a907:     	nopw	(%rax,%rax)
14000a910:     	incq	%rbx
14000a913:     	addq	$0x48, %r14
14000a917:     	cmpq	%rbx, 0x40(%rsp)
14000a91c:     	je	0x14000a980 <.text+0x9980>
14000a91e:     	cmpl	$0x1, %r15d
14000a922:     	movl	-0x8(%r14), %r15d
14000a926:     	jne	0x14000a940 <.text+0x9940>
14000a928:     	testb	%r15b, %r15b
14000a92b:     	je	0x14000a910 <.text+0x9910>
14000a92d:     	movq	-0x4c(%r14), %rax
14000a931:     	movq	-0x4(%r14), %rcx
14000a935:     	cmpq	%rcx, %rax
14000a938:     	jne	0x14000a905 <.text+0x9905>
14000a93a:     	jmp	0x14000a945 <.text+0x9945>
14000a93c:     	nopl	(%rax)
14000a940:     	testb	%r15b, %r15b
14000a943:     	jne	0x14000a977 <.text+0x9977>
14000a945:     	movq	-0x18(%r14), %rcx
14000a949:     	movq	-0x10(%r14), %rax
14000a94d:     	movq	-0x60(%r14), %rdx
14000a951:     	movq	-0x58(%r14), %r8
14000a955:     	movq	%rax, %r12
14000a958:     	subq	%r8, %r12
14000a95b:     	cmovbq	%rax, %r8
14000a95f:     	movq	%r10, %rsi
14000a962:     	callq	0x1457731e7 <.text+0x57721e7>
14000a967:     	movq	%rsi, %r10
14000a96a:     	cltq
14000a96c:     	testl	%eax, %eax
14000a96e:     	cmovneq	%rax, %r12
14000a972:     	testq	%r12, %r12
14000a975:     	jns	0x14000a910 <.text+0x9910>
14000a977:     	xorl	%eax, %eax
14000a979:     	movq	0x40(%rsp), %r14
14000a97e:     	jmp	0x14000a991 <.text+0x9991>
14000a980:     	xorl	%eax, %eax
14000a982:     	movq	0x40(%rsp), %r14
14000a987:     	movq	%r14, %rbx
14000a98a:     	jmp	0x14000a991 <.text+0x9991>
14000a98c:     	movq	%r14, %rbx
14000a98f:     	movb	$0x1, %al
14000a991:     	cmpq	0x58(%rsp), %rbx
14000a996:     	jb	0x14000a738 <.text+0x9738>
14000a99c:     	testb	%al, %al
14000a99e:     	je	0x14000aa39 <.text+0x9a39>
14000a9a4:     	movq	%rbx, %rax
14000a9a7:     	shrq	%rax
14000a9aa:     	je	0x14000aa39 <.text+0x9a39>
14000a9b0:     	leaq	(,%r10,8), %rcx
14000a9b8:     	leaq	(%rcx,%rcx,8), %rdx
14000a9bc:     	movq	0x78(%rsp), %rcx
14000a9c1:     	addq	%rdx, %rcx
14000a9c4:     	leaq	(%rbx,%rbx,8), %r8
14000a9c8:     	leaq	(%rdx,%r8,8), %rdx
14000a9cc:     	addq	0x70(%rsp), %rdx
14000a9d1:     	nopw	%cs:(%rax,%rax)
14000a9e0:     	movups	-0x40(%rcx), %xmm0
14000a9e4:     	movups	-0x40(%rdx), %xmm1
14000a9e8:     	movups	%xmm1, -0x40(%rcx)
14000a9ec:     	movups	%xmm0, -0x40(%rdx)
14000a9f0:     	movups	-0x30(%rcx), %xmm0
14000a9f4:     	movups	-0x30(%rdx), %xmm1
14000a9f8:     	movups	%xmm1, -0x30(%rcx)
14000a9fc:     	movups	%xmm0, -0x30(%rdx)
14000aa00:     	movups	-0x20(%rcx), %xmm0
14000aa04:     	movups	-0x20(%rdx), %xmm1
14000aa08:     	movups	%xmm1, -0x20(%rcx)
14000aa0c:     	movups	%xmm0, -0x20(%rdx)
14000aa10:     	movups	-0x10(%rcx), %xmm0
14000aa14:     	movups	-0x10(%rdx), %xmm1
14000aa18:     	movups	%xmm1, -0x10(%rcx)
14000aa1c:     	movups	%xmm0, -0x10(%rdx)
14000aa20:     	movq	(%rcx), %r8
14000aa23:     	movq	(%rdx), %r9
14000aa26:     	movq	%r9, (%rcx)
14000aa29:     	movq	%r8, (%rdx)
14000aa2c:     	addq	$0x48, %rcx
14000aa30:     	addq	$-0x48, %rdx
14000aa34:     	decq	%rax
14000aa37:     	jne	0x14000a9e0 <.text+0x99e0>
14000aa39:     	movq	%rbx, %r14
14000aa3c:     	leaq	0x1(,%r14,2), %r14
14000aa44:     	movq	%r13, %rax
14000aa47:     	shrq	%rax
14000aa4a:     	movq	%r14, 0x40(%rsp)
14000aa4f:     	shrq	%r14
14000aa52:     	leaq	(%r10,%r10), %rdx
14000aa56:     	subq	%rax, %rdx
14000aa59:     	leaq	(%r14,%r10,2), %rax
14000aa5d:     	movq	0x80(%rsp), %rcx
14000aa65:     	imulq	%rcx, %rdx
14000aa69:     	imulq	%rcx, %rax
14000aa6d:     	xorq	%rdx, %rax
14000aa70:     	movl	$0x7f, %r14d
14000aa76:     	bsrq	%rax, %r14
14000aa7a:     	xorl	$0x3f, %r14d
14000aa7e:     	cmpq	$0x2, %rdi
14000aa82:     	jae	0x14000aacc <.text+0x9acc>
14000aa84:     	jmp	0x14000abe5 <.text+0x9be5>
14000aa89:     	nopl	(%rax)
14000aa90:     	movq	0x358(%rsp), %rax
14000aa98:     	movq	%rax, 0x28(%rsp)
14000aa9d:     	movq	%r12, 0x20(%rsp)
14000aaa2:     	movq	%rbx, %rcx
14000aaa5:     	movq	%rbp, %rdx
14000aaa8:     	movq	0x50(%rsp), %r8
14000aaad:     	movq	0x48(%rsp), %r9
14000aab2:     	callq	0x1401f0bd0 <.text+0x1efbd0>
14000aab7:     	leaq	0x1(,%rbp,2), %r13
14000aabf:     	movq	%rsi, %r10
14000aac2:     	cmpq	$0x1, %rdi
14000aac6:     	jbe	0x14000abe0 <.text+0x9be0>
14000aacc:     	cmpb	%r14b, 0x95(%rsp,%rdi)
14000aad4:     	jb	0x14000abe5 <.text+0x9be5>
14000aada:     	decq	%rdi
14000aadd:     	movq	0xd8(%rsp,%rdi,8), %rax
14000aae5:     	movq	%rax, %r12
14000aae8:     	shrq	%r12
14000aaeb:     	movq	%r13, %r15
14000aaee:     	shrq	%r15
14000aaf1:     	leaq	(%r12,%r15), %rbp
14000aaf5:     	cmpq	0x48(%rsp), %rbp
14000aafa:     	ja	0x14000ab20 <.text+0x9b20>
14000aafc:     	movl	%eax, %ecx
14000aafe:     	orl	%r13d, %ecx
14000ab01:     	andl	$0x1, %ecx
14000ab04:     	jne	0x14000ab20 <.text+0x9b20>
14000ab06:     	addq	%rbp, %rbp
14000ab09:     	movq	%rbp, %r13
14000ab0c:     	cmpq	$0x1, %rdi
14000ab10:     	ja	0x14000aacc <.text+0x9acc>
14000ab12:     	jmp	0x14000abe0 <.text+0x9be0>
14000ab17:     	nopw	(%rax,%rax)
14000ab20:     	movq	%r10, %rsi
14000ab23:     	movq	%r10, %rcx
14000ab26:     	subq	%rbp, %rcx
14000ab29:     	leaq	(%rcx,%rcx,8), %rcx
14000ab2d:     	movq	0x60(%rsp), %rdx
14000ab32:     	leaq	(%rdx,%rcx,8), %rbx
14000ab36:     	testb	$0x1, %al
14000ab38:     	jne	0x14000ab7c <.text+0x9b7c>
14000ab3a:     	movq	%r12, %rax
14000ab3d:     	orq	$0x1, %rax
14000ab41:     	bsrq	%rax, %rax
14000ab45:     	xorl	$0x3f, %eax
14000ab48:     	addl	%eax, %eax
14000ab4a:     	xorl	$0x7e, %eax
14000ab4d:     	movq	0x358(%rsp), %rcx
14000ab55:     	movq	%rcx, 0x30(%rsp)
14000ab5a:     	movl	%eax, 0x20(%rsp)
14000ab5e:     	movq	$0x0, 0x28(%rsp)
14000ab67:     	movq	%rbx, %rcx
14000ab6a:     	movq	%r12, %rdx
14000ab6d:     	movq	0x50(%rsp), %r8
14000ab72:     	movq	0x48(%rsp), %r9
14000ab77:     	callq	0x14017ce30 <.text+0x17be30>
14000ab7c:     	testb	$0x1, %r13b
14000ab80:     	jne	0x14000aa90 <.text+0x9a90>
14000ab86:     	leaq	(%r12,%r12,8), %rax
14000ab8a:     	leaq	(%rbx,%rax,8), %rcx
14000ab8e:     	movq	%r15, %rax
14000ab91:     	orq	$0x1, %rax
14000ab95:     	bsrq	%rax, %rax
14000ab99:     	xorl	$0x3f, %eax
14000ab9c:     	addl	%eax, %eax
14000ab9e:     	xorl	$0x7e, %eax
14000aba1:     	movq	0x358(%rsp), %rdx
14000aba9:     	movq	%rdx, 0x30(%rsp)
14000abae:     	movl	%eax, 0x20(%rsp)
14000abb2:     	movq	$0x0, 0x28(%rsp)
14000abbb:     	movq	%r15, %rdx
14000abbe:     	movq	0x50(%rsp), %r8
14000abc3:     	movq	0x48(%rsp), %r9
14000abc8:     	callq	0x14017ce30 <.text+0x17be30>
14000abcd:     	jmp	0x14000aa90 <.text+0x9a90>
14000abd2:     	nopw	%cs:(%rax,%rax)
14000abe0:     	movl	$0x1, %edi
14000abe5:     	movq	%r13, 0xd8(%rsp,%rdi,8)
14000abed:     	movb	%r14b, 0x96(%rsp,%rdi)
14000abf5:     	movq	0x88(%rsp), %r14
14000abfd:     	cmpq	%r10, %r14
14000ac00:     	jbe	0x14000ac21 <.text+0x9c21>
14000ac02:     	incq	%rdi
14000ac05:     	movq	0x40(%rsp), %r13
14000ac0a:     	movq	%r13, %rax
14000ac0d:     	shrq	%rax
14000ac10:     	addq	%rax, %r10
14000ac13:     	subq	%r10, %r14
14000ac16:     	jbe	0x14000a7a0 <.text+0x97a0>
14000ac1c:     	jmp	0x14000a720 <.text+0x9720>
14000ac21:     	testb	$0x1, %r13b
14000ac25:     	jne	0x14000ac6c <.text+0x9c6c>
14000ac27:     	movq	%r14, %rax
14000ac2a:     	orq	$0x1, %rax
14000ac2e:     	bsrq	%rax, %rax
14000ac32:     	xorl	$0x3f, %eax
14000ac35:     	addl	%eax, %eax
14000ac37:     	xorl	$0x7e, %eax
14000ac3a:     	movq	0x358(%rsp), %rcx
14000ac42:     	movq	%rcx, 0x30(%rsp)
14000ac47:     	movl	%eax, 0x20(%rsp)
14000ac4b:     	movq	$0x0, 0x28(%rsp)
14000ac54:     	movq	0x60(%rsp), %rcx
14000ac59:     	movq	%r14, %rdx
14000ac5c:     	movq	0x50(%rsp), %r8
14000ac61:     	movq	0x48(%rsp), %r9
14000ac66:     	callq	0x14017ce30 <.text+0x17be30>
14000ac6b:     	nop
14000ac6c:     	addq	$0x2e8, %rsp            # imm = 0x2E8
14000ac73:     	popq	%rbx
14000ac74:     	popq	%rbp
14000ac75:     	popq	%rdi
14000ac76:     	popq	%rsi
14000ac77:     	popq	%r12
14000ac79:     	popq	%r13
14000ac7b:     	popq	%r14
14000ac7d:     	popq	%r15
14000ac7f:     	retq
