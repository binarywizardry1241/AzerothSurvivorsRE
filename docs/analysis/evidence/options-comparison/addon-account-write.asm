Disassembly of section .text:

0000000140001000 <.text>:
1411cf760:     	pushq	%rbp
1411cf761:     	pushq	%r15
1411cf763:     	pushq	%r14
1411cf765:     	pushq	%r13
1411cf767:     	pushq	%r12
1411cf769:     	pushq	%rsi
1411cf76a:     	pushq	%rdi
1411cf76b:     	pushq	%rbx
1411cf76c:     	subq	$0xe8, %rsp
1411cf773:     	leaq	0x80(%rsp), %rbp
1411cf77b:     	movq	$-0x2, 0x60(%rbp)
1411cf783:     	movl	%r8d, %ebx
1411cf786:     	movq	%rdx, %rsi
1411cf789:     	movq	%rcx, %rdi
1411cf78c:     	leaq	0x38(%rbp), %rcx
1411cf790:     	callq	0x1411cf3a0 <.text+0x11ce3a0>
1411cf795:     	movq	0x38(%rbp), %rax
1411cf799:     	cmpq	$-0x1, %rax
1411cf79d:     	je	0x1411cfc35 <.text+0x11cec35>
1411cf7a3:     	movq	%rsi, 0x58(%rbp)
1411cf7a7:     	movq	%rax, 0x28(%rbp)
1411cf7ab:     	movq	0x40(%rbp), %rax
1411cf7af:     	movq	%rax, 0x20(%rbp)
1411cf7b3:     	movq	0x48(%rbp), %rax
1411cf7b7:     	movq	%rax, -0x8(%rbp)
1411cf7bb:     	leaq	0x8(%rbp), %rcx
1411cf7bf:     	callq	0x1411cf500 <.text+0x11ce500>
1411cf7c4:     	nop
1411cf7c5:     	movq	0x10(%rbp), %r12
1411cf7c9:     	movq	0x18(%rbp), %r15
1411cf7cd:     	testq	%r15, %r15
1411cf7d0:     	je	0x1411cf8ad <.text+0x11ce8ad>
1411cf7d6:     	movq	%r15, %r14
1411cf7d9:     	shlq	$0x5, %r14
1411cf7dd:     	leaq	(%r12,%r14), %r13
1411cf7e1:     	cmpq	$0xf, 0x58(%rbp)
1411cf7e6:     	jbe	0x1411cf83b <.text+0x11ce83b>
1411cf7e8:     	movq	%r12, %rsi
1411cf7eb:     	jmp	0x1411cf7fe <.text+0x11ce7fe>
1411cf7ed:     	nopl	(%rax)
1411cf7f0:     	addq	$0x20, %rsi
1411cf7f4:     	addq	$-0x20, %r14
1411cf7f8:     	je	0x1411cf8ad <.text+0x11ce8ad>
1411cf7fe:     	movq	0x58(%rbp), %rdx
1411cf802:     	cmpq	%rdx, 0x10(%rsi)
1411cf806:     	jne	0x1411cf7f0 <.text+0x11ce7f0>
1411cf808:     	movq	0x8(%rsi), %rcx
1411cf80c:     	movq	%rdi, %r8
1411cf80f:     	movq	%rdx, %r9
1411cf812:     	callq	0x140002210 <.text+0x1210>
1411cf817:     	testb	%al, %al
1411cf819:     	je	0x1411cf7f0 <.text+0x11ce7f0>
1411cf81b:     	movb	%bl, 0x18(%rsi)
1411cf81e:     	movq	$0x0, 0x38(%rbp)
1411cf826:     	movq	$0x1, 0x40(%rbp)
1411cf82e:     	movq	$0x0, 0x48(%rbp)
1411cf836:     	jmp	0x1411cf980 <.text+0x11ce980>
1411cf83b:     	movq	%r12, %rsi
1411cf83e:     	movq	0x58(%rbp), %r10
1411cf842:     	jmp	0x1411cf859 <.text+0x11ce859>
1411cf844:     	nopw	%cs:(%rax,%rax)
1411cf850:     	addq	$0x20, %rsi
1411cf854:     	cmpq	%r13, %rsi
1411cf857:     	je	0x1411cf8ad <.text+0x11ce8ad>
1411cf859:     	cmpq	%r10, 0x10(%rsi)
1411cf85d:     	jne	0x1411cf850 <.text+0x11ce850>
1411cf85f:     	movq	0x8(%rsi), %rax
1411cf863:     	xorl	%ecx, %ecx
1411cf865:     	nopw	%cs:(%rax,%rax)
1411cf870:     	cmpq	%rcx, %r10
1411cf873:     	je	0x1411cf81b <.text+0x11ce81b>
1411cf875:     	movzbl	(%rax,%rcx), %edx
1411cf879:     	leal	-0x41(%rdx), %r8d
1411cf87d:     	cmpb	$0x1a, %r8b
1411cf881:     	setb	%r8b
1411cf885:     	shlb	$0x5, %r8b
1411cf889:     	orb	%dl, %r8b
1411cf88c:     	movzbl	(%rdi,%rcx), %edx
1411cf890:     	leal	-0x41(%rdx), %r9d
1411cf894:     	cmpb	$0x1a, %r9b
1411cf898:     	setb	%r9b
1411cf89c:     	shlb	$0x5, %r9b
1411cf8a0:     	orb	%dl, %r9b
1411cf8a3:     	incq	%rcx
1411cf8a6:     	cmpb	%r9b, %r8b
1411cf8a9:     	je	0x1411cf870 <.text+0x11ce870>
1411cf8ab:     	jmp	0x1411cf850 <.text+0x11ce850>
1411cf8ad:     	movq	0x58(%rbp), %rsi
1411cf8b1:     	testq	%rsi, %rsi
1411cf8b4:     	jns	0x1411cf8c7 <.text+0x11ce8c7>
1411cf8b6:     	xorl	%r14d, %r14d
1411cf8b9:     	movq	%r14, %rcx
1411cf8bc:     	movq	%rsi, %rdx
1411cf8bf:     	callq	0x145d6944b <.text+0x5d6844b>
1411cf8c4:     	nop
1411cf8c5:     	ud2
1411cf8c7:     	je	0x1411cf900 <.text+0x11ce900>
1411cf8c9:     	callq	0x140002200 <.text+0x1200>
1411cf8ce:     	movl	$0x1, %r14d
1411cf8d4:     	movl	$0x1, %edx
1411cf8d9:     	movq	%rsi, %rcx
1411cf8dc:     	callq	0x1400021c0 <.text+0x11c0>
1411cf8e1:     	testq	%rax, %rax
1411cf8e4:     	je	0x1411cf8b9 <.text+0x11ce8b9>
1411cf8e6:     	movq	%rax, 0x30(%rbp)
1411cf8ea:     	movq	%rax, %rcx
1411cf8ed:     	movq	%rdi, %rdx
1411cf8f0:     	movq	%rsi, %r8
1411cf8f3:     	callq	0x145bc977b <.text+0x5bc877b>
1411cf8f8:     	cmpq	0x8(%rbp), %r15
1411cf8fc:     	je	0x1411cf90f <.text+0x11ce90f>
1411cf8fe:     	jmp	0x1411cf921 <.text+0x11ce921>
1411cf900:     	movl	$0x1, %eax
1411cf905:     	movq	%rax, 0x30(%rbp)
1411cf909:     	cmpq	0x8(%rbp), %r15
1411cf90d:     	jne	0x1411cf921 <.text+0x11ce921>
1411cf90f:     	leaq	0x8(%rbp), %rcx
1411cf913:     	callq	0x145bcb530 <.text+0x5bca530>
1411cf918:     	nop
1411cf919:     	movq	0x10(%rbp), %r12
1411cf91d:     	movq	0x58(%rbp), %rsi
1411cf921:     	movq	%r15, %rax
1411cf924:     	shlq	$0x5, %rax
1411cf928:     	leaq	0x1(%r15), %r13
1411cf92c:     	movq	%rsi, (%r12,%rax)
1411cf930:     	movq	0x30(%rbp), %rcx
1411cf934:     	movq	%rcx, 0x8(%r12,%rax)
1411cf939:     	movq	%rsi, 0x10(%r12,%rax)
1411cf93e:     	movb	%bl, 0x18(%r12,%rax)
1411cf943:     	movq	$0x0, 0x38(%rbp)
1411cf94b:     	movq	$0x1, 0x40(%rbp)
1411cf953:     	movq	$0x0, 0x48(%rbp)
1411cf95b:     	incq	%r15
1411cf95e:     	movq	%r15, 0x18(%rbp)
1411cf962:     	jne	0x1411cf979 <.text+0x11ce979>
1411cf964:     	xorl	%edi, %edi
1411cf966:     	movl	$0x1, %r15d
1411cf96c:     	movq	$0x0, 0x58(%rbp)
1411cf974:     	jmp	0x1411cfa77 <.text+0x11cea77>
1411cf979:     	shlq	$0x5, %r13
1411cf97d:     	addq	%r12, %r13
1411cf980:     	movl	$0x1, %r15d
1411cf986:     	xorl	%edi, %edi
1411cf988:     	leaq	0x4e0aad8(%rip), %rbx   # 0x145fda467
1411cf98f:     	leaq	0x4e0aac6(%rip), %rsi   # 0x145fda45c
1411cf996:     	nopw	%cs:(%rax,%rax)
1411cf9a0:     	movq	%r15, %rdx
1411cf9a3:     	movq	0x8(%r12), %r15
1411cf9a8:     	movq	0x10(%r12), %r14
1411cf9ad:     	movq	0x38(%rbp), %rax
1411cf9b1:     	movq	%rax, %rcx
1411cf9b4:     	subq	%rdi, %rcx
1411cf9b7:     	cmpq	%rcx, %r14
1411cf9ba:     	ja	0x1411cfa1e <.text+0x11cea1e>
1411cf9bc:     	testq	%r14, %r14
1411cf9bf:     	je	0x1411cf9d6 <.text+0x11ce9d6>
1411cf9c1:     	movq	%rdx, %rcx
1411cf9c4:     	addq	%rdi, %rcx
1411cf9c7:     	movq	%r15, %rdx
1411cf9ca:     	movq	%r14, %r8
1411cf9cd:     	callq	0x145bc977b <.text+0x5bc877b>
1411cf9d2:     	movq	0x38(%rbp), %rax
1411cf9d6:     	addq	%r14, %rdi
1411cf9d9:     	movq	%rdi, 0x48(%rbp)
1411cf9dd:     	movzbl	0x18(%r12), %r15d
1411cf9e3:     	movq	%r15, %r14
1411cf9e6:     	xorq	$0xb, %r14
1411cf9ea:     	subq	%rdi, %rax
1411cf9ed:     	cmpq	%rax, %r14
1411cf9f0:     	ja	0x1411cfa4a <.text+0x11cea4a>
1411cf9f2:     	addq	$0x20, %r12
1411cf9f6:     	testb	%r15b, %r15b
1411cf9f9:     	movq	%rsi, %rdx
1411cf9fc:     	cmovneq	%rbx, %rdx
1411cfa00:     	movq	0x40(%rbp), %r15
1411cfa04:     	leaq	(%r15,%rdi), %rcx
1411cfa08:     	movq	%r14, %r8
1411cfa0b:     	callq	0x145bc977b <.text+0x5bc877b>
1411cfa10:     	addq	%r14, %rdi
1411cfa13:     	movq	%rdi, 0x48(%rbp)
1411cfa17:     	cmpq	%r13, %r12
1411cfa1a:     	jne	0x1411cf9a0 <.text+0x11ce9a0>
1411cfa1c:     	jmp	0x1411cfa6f <.text+0x11cea6f>
1411cfa1e:     	movq	$0x1, 0x20(%rsp)
1411cfa27:     	movl	$0x1, %r9d
1411cfa2d:     	leaq	0x38(%rbp), %rcx
1411cfa31:     	movq	%rdi, %rdx
1411cfa34:     	movq	%r14, %r8
1411cfa37:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1411cfa3c:     	nop
1411cfa3d:     	movq	0x40(%rbp), %rdx
1411cfa41:     	movq	0x48(%rbp), %rdi
1411cfa45:     	jmp	0x1411cf9c1 <.text+0x11ce9c1>
1411cfa4a:     	movq	$0x1, 0x20(%rsp)
1411cfa53:     	movl	$0x1, %r9d
1411cfa59:     	leaq	0x38(%rbp), %rcx
1411cfa5d:     	movq	%rdi, %rdx
1411cfa60:     	movq	%r14, %r8
1411cfa63:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1411cfa68:     	nop
1411cfa69:     	movq	0x48(%rbp), %rdi
1411cfa6d:     	jmp	0x1411cf9f2 <.text+0x11ce9f2>
1411cfa6f:     	movq	0x38(%rbp), %rax
1411cfa73:     	movq	%rax, 0x58(%rbp)
1411cfa77:     	movq	0x20(%rbp), %rcx
1411cfa7b:     	movq	-0x8(%rbp), %rsi
1411cfa7f:     	movq	%rsi, %rdx
1411cfa82:     	movq	%r15, 0x30(%rbp)
1411cfa86:     	movq	%r15, %r8
1411cfa89:     	movq	%rdi, %r9
1411cfa8c:     	callq	0x141188250 <.text+0x1187250>
1411cfa91:     	nop
1411cfa92:     	movq	%rax, %rdi
1411cfa95:     	testq	%rax, %rax
1411cfa98:     	je	0x1411cfb9e <.text+0x11ceb9e>
1411cfa9e:     	movq	%rdi, (%rbp)
1411cfaa2:     	movq	0x6e274ff(%rip), %rax   # 0x147ff6fa8
1411cfaa9:     	movq	(%rax), %rax
1411cfaac:     	cmpq	$0x3, %rax
1411cfab0:     	ja	0x1411cfb77 <.text+0x11ceb77>
1411cfab6:     	movzbl	0x6df3b5b(%rip), %edx   # 0x147fc3618
1411cfabd:     	movzbl	%dl, %eax
1411cfac0:     	leal	-0x1(%rax), %ecx
1411cfac3:     	cmpl	$0x2, %ecx
1411cfac6:     	jae	0x1411cfb6f <.text+0x11ceb6f>
1411cfacc:     	movq	0x6df3b35(%rip), %rcx   # 0x147fc3608
1411cfad3:     	callq	0x144c46ce0 <.text+0x4c45ce0>
1411cfad8:     	nop
1411cfad9:     	testb	%al, %al
1411cfadb:     	je	0x1411cfb77 <.text+0x11ceb77>
1411cfae1:     	movq	0x6df3b20(%rip), %rcx   # 0x147fc3608
1411cfae8:     	leaq	0x30(%rcx), %rax
1411cfaec:     	movq	0x20(%rbp), %rdx
1411cfaf0:     	movq	%rdx, -0x38(%rbp)
1411cfaf4:     	movq	%rsi, -0x30(%rbp)
1411cfaf8:     	leaq	-0x38(%rbp), %rdx
1411cfafc:     	movq	%rdx, -0x58(%rbp)
1411cfb00:     	leaq	0x49bf879(%rip), %rdx   # 0x145b8f380 <.text+0x5b8e380>
1411cfb07:     	movq	%rdx, -0x50(%rbp)
1411cfb0b:     	movq	%rbp, %rdx
1411cfb0e:     	movq	%rdx, -0x48(%rbp)
1411cfb12:     	leaq	0x49dd677(%rip), %rdx   # 0x145bad190 <.text+0x5bac190>
1411cfb19:     	movq	%rdx, -0x40(%rbp)
1411cfb1d:     	leaq	0x4e0a91c(%rip), %rdx   # 0x145fda440
1411cfb24:     	movq	%rdx, -0x28(%rbp)
1411cfb28:     	leaq	-0x58(%rbp), %rdx
1411cfb2c:     	movq	%rdx, -0x20(%rbp)
1411cfb30:     	leaq	-0x28(%rbp), %rdx
1411cfb34:     	movq	%rdx, -0x18(%rbp)
1411cfb38:     	leaq	0x4e02319(%rip), %rdx   # 0x145fd1e58
1411cfb3f:     	movq	%rdx, -0x10(%rbp)
1411cfb43:     	movq	$0x1, 0x38(%rbp)
1411cfb4b:     	leaq	-0x18(%rbp), %rdx
1411cfb4f:     	movq	%rdx, 0x40(%rbp)
1411cfb53:     	movq	$0x1, 0x48(%rbp)
1411cfb5b:     	movq	%rax, 0x50(%rbp)
1411cfb5f:     	leaq	0x38(%rbp), %rdx
1411cfb63:     	callq	0x144c48500 <.text+0x4c47500>
1411cfb68:     	nop
1411cfb69:     	movq	(%rbp), %rdi
1411cfb6d:     	jmp	0x1411cfb77 <.text+0x11ceb77>
1411cfb6f:     	testl	%eax, %eax
1411cfb71:     	jne	0x1411cfc49 <.text+0x11cec49>
1411cfb77:     	movl	%edi, %eax
1411cfb79:     	andl	$0x3, %eax
1411cfb7c:     	leal	-0x2(%rax), %ecx
1411cfb7f:     	cmpl	$0x2, %ecx
1411cfb82:     	jb	0x1411cfb9e <.text+0x11ceb9e>
1411cfb84:     	testq	%rax, %rax
1411cfb87:     	je	0x1411cfb9e <.text+0x11ceb9e>
1411cfb89:     	decq	%rdi
1411cfb8c:     	leaq	0x40(%rbp), %rcx
1411cfb90:     	movq	%rdi, 0x40(%rbp)
1411cfb94:     	movb	$0x3, 0x38(%rbp)
1411cfb98:     	callq	0x145baee60 <.text+0x5bade60>
1411cfb9d:     	nop
1411cfb9e:     	movq	0x18(%rbp), %rsi
1411cfba2:     	testq	%rsi, %rsi
1411cfba5:     	je	0x1411cfbe2 <.text+0x11cebe2>
1411cfba7:     	movq	0x10(%rbp), %rdi
1411cfbab:     	addq	$0x8, %rdi
1411cfbaf:     	jmp	0x1411cfbc9 <.text+0x11cebc9>
1411cfbb1:     	nopw	%cs:(%rax,%rax)
1411cfbc0:     	addq	$0x20, %rdi
1411cfbc4:     	decq	%rsi
1411cfbc7:     	je	0x1411cfbe2 <.text+0x11cebe2>
1411cfbc9:     	movq	-0x8(%rdi), %rdx
1411cfbcd:     	testq	%rdx, %rdx
1411cfbd0:     	je	0x1411cfbc0 <.text+0x11cebc0>
1411cfbd2:     	movq	(%rdi), %rcx
1411cfbd5:     	movl	$0x1, %r8d
1411cfbdb:     	callq	0x1400021d0 <.text+0x11d0>
1411cfbe0:     	jmp	0x1411cfbc0 <.text+0x11cebc0>
1411cfbe2:     	movq	0x8(%rbp), %rdx
1411cfbe6:     	testq	%rdx, %rdx
1411cfbe9:     	je	0x1411cfbfe <.text+0x11cebfe>
1411cfbeb:     	movq	0x10(%rbp), %rcx
1411cfbef:     	shlq	$0x5, %rdx
1411cfbf3:     	movl	$0x8, %r8d
1411cfbf9:     	callq	0x1400021d0 <.text+0x11d0>
1411cfbfe:     	movq	0x28(%rbp), %rdx
1411cfc02:     	testq	%rdx, %rdx
1411cfc05:     	movq	0x30(%rbp), %rsi
1411cfc09:     	movq	0x58(%rbp), %rdi
1411cfc0d:     	je	0x1411cfc1e <.text+0x11cec1e>
1411cfc0f:     	movl	$0x1, %r8d
1411cfc15:     	movq	0x20(%rbp), %rcx
1411cfc19:     	callq	0x1400021d0 <.text+0x11d0>
1411cfc1e:     	testq	%rdi, %rdi
1411cfc21:     	je	0x1411cfc35 <.text+0x11cec35>
1411cfc23:     	movl	$0x1, %r8d
1411cfc29:     	movq	%rsi, %rcx
1411cfc2c:     	movq	%rdi, %rdx
1411cfc2f:     	callq	0x1400021d0 <.text+0x11d0>
1411cfc34:     	nop
1411cfc35:     	addq	$0xe8, %rsp
1411cfc3c:     	popq	%rbx
1411cfc3d:     	popq	%rdi
1411cfc3e:     	popq	%rsi
1411cfc3f:     	popq	%r12
1411cfc41:     	popq	%r13
1411cfc43:     	popq	%r14
1411cfc45:     	popq	%r15
1411cfc47:     	popq	%rbp
1411cfc48:     	retq
1411cfc49:     	leaq	0x6df39b8(%rip), %rcx   # 0x147fc3608
1411cfc50:     	callq	0x145d15470 <.text+0x5d14470>
1411cfc55:     	nop
1411cfc56:     	movl	%eax, %edx
1411cfc58:     	testb	%al, %al
1411cfc5a:     	jne	0x1411cfacc <.text+0x11ceacc>
1411cfc60:     	jmp	0x1411cfb77 <.text+0x11ceb77>
