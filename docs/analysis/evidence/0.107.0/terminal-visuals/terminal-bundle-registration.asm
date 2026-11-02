
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402ef760:     	pushq	%rbp
1402ef761:     	pushq	%r15
1402ef763:     	pushq	%r14
1402ef765:     	pushq	%rsi
1402ef766:     	pushq	%rdi
1402ef767:     	pushq	%rbx
1402ef768:     	subq	$0x108, %rsp            # imm = 0x108
1402ef76f:     	leaq	0x80(%rsp), %rbp
1402ef777:     	movq	$-0x2, 0x80(%rbp)
1402ef782:     	movq	%rcx, %rsi
1402ef785:     	movq	0x18(%rcx), %rax
1402ef789:     	movq	0x20(%rcx), %rcx
1402ef78d:     	movabsq	$0x31b13e1c80860d3f, %r9 # imm = 0x31B13E1C80860D3F
1402ef797:     	xorl	%r10d, %r10d
1402ef79a:     	movdqa	0x5aae6ce(%rip), %xmm0  # 0x145d9de70
1402ef7a2:     	pcmpeqd	%xmm1, %xmm1
1402ef7a6:     	movdqa	0x5b05962(%rip), %xmm2  # 0x145df5110
1402ef7ae:     	andq	%rcx, %r9
1402ef7b1:     	movdqu	(%rax,%r9), %xmm3
1402ef7b7:     	movdqa	%xmm3, %xmm4
1402ef7bb:     	pcmpeqb	%xmm0, %xmm4
1402ef7bf:     	pmovmskb	%xmm4, %r11d
1402ef7c4:     	testl	%r11d, %r11d
1402ef7c7:     	je	0x1402ef800 <.text+0x2ee800>
1402ef7c9:     	tzcntl	%r11d, %edi
1402ef7ce:     	addq	%r9, %rdi
1402ef7d1:     	andq	%rcx, %rdi
1402ef7d4:     	negq	%rdi
1402ef7d7:     	leaq	(%rdi,%rdi,2), %rdi
1402ef7db:     	movdqu	-0x18(%rax,%rdi,8), %xmm4
1402ef7e1:     	pcmpeqb	%xmm2, %xmm4
1402ef7e5:     	pmovmskb	%xmm4, %ebx
1402ef7e9:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
1402ef7ef:     	je	0x1402ef81b <.text+0x2ee81b>
1402ef7f1:     	leal	-0x1(%r11), %edi
1402ef7f5:     	andw	%r11w, %di
1402ef7f9:     	movl	%edi, %r11d
1402ef7fc:     	jne	0x1402ef7c9 <.text+0x2ee7c9>
1402ef7fe:     	nop
1402ef800:     	pcmpeqb	%xmm1, %xmm3
1402ef804:     	pmovmskb	%xmm3, %r11d
1402ef809:     	testl	%r11d, %r11d
1402ef80c:     	jne	0x1402ef828 <.text+0x2ee828>
1402ef80e:     	addq	%r10, %r9
1402ef811:     	addq	$0x10, %r9
1402ef815:     	addq	$0x10, %r10
1402ef819:     	jmp	0x1402ef7ae <.text+0x2ee7ae>
1402ef81b:     	leaq	(%rax,%rdi,8), %rax
1402ef81f:     	movq	-0x8(%rax), %rdi
1402ef823:     	jmp	0x1402ef967 <.text+0x2ee967>
1402ef828:     	movq	%rdx, %rcx
1402ef82b:     	movq	%r8, %rbx
1402ef82e:     	movq	%rdx, %r14
1402ef831:     	callq	0x1403132c0 <.text+0x3122c0>
1402ef836:     	movq	%rdx, %rdi
1402ef839:     	leaq	-0x30(%rbp), %rcx
1402ef83d:     	movq	%r14, %rdx
1402ef840:     	callq	0x140123b80 <.text+0x122b80>
1402ef845:     	movq	$0x1, -0x48(%rbp)
1402ef84d:     	movq	%rdi, -0x40(%rbp)
1402ef851:     	movb	$0x1, -0x38(%rbp)
1402ef855:     	leaq	0x40(%rbp), %r15
1402ef859:     	leaq	-0x48(%rbp), %rdx
1402ef85d:     	movq	%r15, %rcx
1402ef860:     	callq	0x1400df2d0 <.text+0xde2d0>
1402ef865:     	movq	0x10(%rsi), %rdi
1402ef869:     	movq	0x18(%r14), %rax
1402ef86d:     	movq	%rdi, 0x30(%rsp)
1402ef872:     	movq	%r15, 0x28(%rsp)
1402ef877:     	movq	%rax, 0x20(%rsp)
1402ef87c:     	leaq	0x5b08727(%rip), %rdx   # 0x145df7faa
1402ef883:     	leaq	0x58(%rbp), %rcx
1402ef887:     	movl	$0xe7, %r8d
1402ef88d:     	movq	%rbx, %r9
1402ef890:     	callq	0x144e53540 <.text+0x4e52540>
1402ef895:     	cmpq	(%rsi), %rdi
1402ef898:     	jne	0x1402ef8a3 <.text+0x2ee8a3>
1402ef89a:     	movq	%rsi, %rcx
1402ef89d:     	callq	0x145bf3cf0 <.text+0x5bf2cf0>
1402ef8a2:     	nop
1402ef8a3:     	movq	0x8(%rsi), %rax
1402ef8a7:     	leaq	(%rdi,%rdi,4), %rcx
1402ef8ab:     	movq	0x78(%rbp), %rdx
1402ef8af:     	movq	%rdx, 0x20(%rax,%rcx,8)
1402ef8b4:     	movups	0x58(%rbp), %xmm0
1402ef8b8:     	movdqu	0x68(%rbp), %xmm1
1402ef8bd:     	movdqu	%xmm1, 0x10(%rax,%rcx,8)
1402ef8c3:     	movups	%xmm0, (%rax,%rcx,8)
1402ef8c7:     	leaq	0x1(%rdi), %rax
1402ef8cb:     	movq	%rax, 0x10(%rsi)
1402ef8cf:     	movq	0x18(%rsi), %rbx
1402ef8d3:     	movq	0x20(%rsi), %r14
1402ef8d7:     	movabsq	$0x31b13e1c80860d3f, %r15 # imm = 0x31B13E1C80860D3F
1402ef8e1:     	movq	%r14, %rcx
1402ef8e4:     	andq	%r15, %rcx
1402ef8e7:     	movdqu	(%rbx,%rcx), %xmm0
1402ef8ec:     	pmovmskb	%xmm0, %eax
1402ef8f0:     	testl	%eax, %eax
1402ef8f2:     	je	0x1402ef97a <.text+0x2ee97a>
1402ef8f8:     	tzcntl	%eax, %eax
1402ef8fc:     	addq	%rcx, %rax
1402ef8ff:     	andq	%r14, %rax
1402ef902:     	movzbl	(%rbx,%rax), %ecx
1402ef906:     	testb	%cl, %cl
1402ef908:     	jns	0x1402ef99c <.text+0x2ee99c>
1402ef90e:     	movq	0x28(%rsi), %rdx
1402ef912:     	testq	%rdx, %rdx
1402ef915:     	setne	%r8b
1402ef919:     	andb	$0x1, %cl
1402ef91c:     	sete	%r9b
1402ef920:     	orb	%r8b, %r9b
1402ef923:     	je	0x1402ef9b1 <.text+0x2ee9b1>
1402ef929:     	movzbl	%cl, %ecx
1402ef92c:     	subq	%rcx, %rdx
1402ef92f:     	movq	%rdx, 0x28(%rsi)
1402ef933:     	leaq	-0x10(%rax), %rcx
1402ef937:     	andq	%r14, %rcx
1402ef93a:     	movb	$0x18, (%rbx,%rax)
1402ef93e:     	movb	$0x18, 0x10(%rbx,%rcx)
1402ef943:     	incq	0x30(%rsi)
1402ef947:     	negq	%rax
1402ef94a:     	leaq	(%rax,%rax,2), %rax
1402ef94e:     	movabsq	$-0x4af0508ca559ec49, %rcx # imm = 0xB50FAF735AA613B7
1402ef958:     	movq	%rcx, -0x18(%rbx,%rax,8)
1402ef95d:     	movq	%r15, -0x10(%rbx,%rax,8)
1402ef962:     	movq	%rdi, -0x8(%rbx,%rax,8)
1402ef967:     	movq	%rdi, %rax
1402ef96a:     	addq	$0x108, %rsp            # imm = 0x108
1402ef971:     	popq	%rbx
1402ef972:     	popq	%rdi
1402ef973:     	popq	%rsi
1402ef974:     	popq	%r14
1402ef976:     	popq	%r15
1402ef978:     	popq	%rbp
1402ef979:     	retq
1402ef97a:     	movl	$0x10, %edx
1402ef97f:     	addq	%rdx, %rcx
1402ef982:     	andq	%r14, %rcx
1402ef985:     	movdqu	(%rbx,%rcx), %xmm0
1402ef98a:     	pmovmskb	%xmm0, %eax
1402ef98e:     	addq	$0x10, %rdx
1402ef992:     	testl	%eax, %eax
1402ef994:     	jne	0x1402ef8f8 <.text+0x2ee8f8>
1402ef99a:     	jmp	0x1402ef97f <.text+0x2ee97f>
1402ef99c:     	movdqa	(%rbx), %xmm0
1402ef9a0:     	pmovmskb	%xmm0, %eax
1402ef9a4:     	tzcntl	%eax, %eax
1402ef9a8:     	movzbl	(%rbx,%rax), %ecx
1402ef9ac:     	jmp	0x1402ef90e <.text+0x2ee90e>
1402ef9b1:     	leaq	0x18(%rsi), %rcx
1402ef9b5:     	leaq	0x38(%rsi), %r8
1402ef9b9:     	movl	$0x1, %edx
1402ef9be:     	movb	$0x1, %r9b
1402ef9c1:     	callq	0x145d48630 <.text+0x5d47630>
1402ef9c6:     	movq	0x18(%rsi), %rbx
1402ef9ca:     	movq	0x20(%rsi), %r14
1402ef9ce:     	movabsq	$0x31b13e1c80860d3f, %r8 # imm = 0x31B13E1C80860D3F
1402ef9d8:     	movq	%rbx, %rcx
1402ef9db:     	movq	%r14, %rdx
1402ef9de:     	callq	0x140041680 <.text+0x40680>
1402ef9e3:     	movzbl	(%rbx,%rax), %ecx
1402ef9e7:     	movq	0x28(%rsi), %rdx
1402ef9eb:     	andb	$0x1, %cl
1402ef9ee:     	jmp	0x1402ef929 <.text+0x2ee929>
