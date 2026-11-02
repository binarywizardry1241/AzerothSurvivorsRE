
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454506a0:     	pushq	%r15
1454506a2:     	pushq	%r14
1454506a4:     	pushq	%r13
1454506a6:     	pushq	%r12
1454506a8:     	pushq	%rsi
1454506a9:     	pushq	%rdi
1454506aa:     	pushq	%rbp
1454506ab:     	pushq	%rbx
1454506ac:     	subq	$0x28, %rsp
1454506b0:     	movq	%rcx, %r8
1454506b3:     	shlq	$0x2, %rdx
1454506b7:     	movq	0x10(%rcx), %r9
1454506bb:     	testq	%r9, %r9
1454506be:     	je	0x14545098a <.text+0x544f98a>
1454506c4:     	movq	0x8(%r8), %r10
1454506c8:     	leaq	-0x1(%r9), %r11
1454506cc:     	movq	%r9, %rsi
1454506cf:     	andq	$-0x2, %rsi
1454506d3:     	xorl	%r15d, %r15d
1454506d6:     	xorl	%eax, %eax
1454506d8:     	jmp	0x145450712 <.text+0x544f712>
1454506da:     	nopw	(%rax,%rax)
1454506e0:     	testq	%r15, %r15
1454506e3:     	je	0x14545089f <.text+0x544f89f>
1454506e9:     	cmpq	$0xff, %r15
1454506f0:     	movl	$0xff, %edi
1454506f5:     	cmovbq	%r15, %rdi
1454506f9:     	decl	%edi
1454506fb:     	testq	%r15, %r15
1454506fe:     	movl	$0x0, %ebx
145450703:     	cmovel	%ebx, %edi
145450706:     	shll	$0x3, %ecx
145450709:     	shll	%cl, %edi
14545070b:     	orl	%eax, %edi
14545070d:     	movq	%r14, %r15
145450710:     	movl	%edi, %eax
145450712:     	cmpq	$0x4, %r15
145450716:     	jae	0x145450a0e <.text+0x544fa0e>
14545071c:     	movq	%r15, %rdi
14545071f:     	orq	%rdx, %rdi
145450722:     	cmpq	$0xf, %rdi
145450726:     	ja	0x145450a1f <.text+0x544fa1f>
14545072c:     	leaq	0x1(%r15), %rcx
145450730:     	movl	0xb0(%r8,%rdi,4), %ebp
145450738:     	testl	%ebp, %ebp
14545073a:     	je	0x145450750 <.text+0x544f750>
14545073c:     	movq	%rcx, %r14
14545073f:     	movq	%r15, %rcx
145450742:     	jmp	0x1454507e0 <.text+0x544f7e0>
145450747:     	nopw	(%rax,%rax)
145450750:     	cmpq	$0x3, %r15
145450754:     	je	0x145450a0e <.text+0x544fa0e>
14545075a:     	movq	%rcx, %rbx
14545075d:     	orq	%rdx, %rbx
145450760:     	cmpq	$0xf, %rbx
145450764:     	ja	0x145450a1f <.text+0x544fa1f>
14545076a:     	leaq	0x2(%r15), %rdi
14545076e:     	movl	0xb0(%r8,%rbx,4), %ebp
145450776:     	testl	%ebp, %ebp
145450778:     	je	0x14545077f <.text+0x544f77f>
14545077a:     	movq	%rdi, %r14
14545077d:     	jmp	0x1454507e0 <.text+0x544f7e0>
14545077f:     	cmpq	$0x1, %r15
145450783:     	ja	0x145450a0e <.text+0x544fa0e>
145450789:     	movq	%rdi, %rbx
14545078c:     	orq	%rdx, %rbx
14545078f:     	cmpq	$0xf, %rbx
145450793:     	ja	0x145450a1f <.text+0x544fa1f>
145450799:     	leaq	0x3(%r15), %rcx
14545079d:     	movl	0xb0(%r8,%rbx,4), %ebp
1454507a5:     	testl	%ebp, %ebp
1454507a7:     	je	0x1454507b1 <.text+0x544f7b1>
1454507a9:     	movq	%rcx, %r14
1454507ac:     	movq	%rdi, %rcx
1454507af:     	jmp	0x1454507e0 <.text+0x544f7e0>
1454507b1:     	testq	%r15, %r15
1454507b4:     	jne	0x145450a0e <.text+0x544fa0e>
1454507ba:     	cmpq	$0xf, %rdx
1454507be:     	ja	0x145450a1f <.text+0x544fa1f>
1454507c4:     	movl	0xbc(%r8,%rdx,4), %ebp
1454507cc:     	movl	$0x4, %r14d
1454507d2:     	testl	%ebp, %ebp
1454507d4:     	je	0x145450a0e <.text+0x544fa0e>
1454507da:     	nopw	(%rax,%rax)
1454507e0:     	testq	%r11, %r11
1454507e3:     	je	0x145450870 <.text+0x544f870>
1454507e9:     	leaq	0x50(%r10), %r13
1454507ed:     	xorl	%r12d, %r12d
1454507f0:     	xorl	%r15d, %r15d
1454507f3:     	jmp	0x145450815 <.text+0x544f815>
1454507f5:     	nopw	%cs:(%rax,%rax)
145450800:     	xorl	%ebx, %ebx
145450802:     	addq	%rdi, %r15
145450805:     	addq	%rbx, %r15
145450808:     	addq	$0x2, %r12
14545080c:     	addq	$0x60, %r13
145450810:     	cmpq	%r12, %rsi
145450813:     	je	0x145450850 <.text+0x544f850>
145450815:     	cmpl	%ebp, -0x40(%r13)
145450819:     	jne	0x145450822 <.text+0x544f822>
14545081b:     	cmpb	$0x0, -0x50(%r13)
145450820:     	je	0x14545083d <.text+0x544f83d>
145450822:     	xorl	%edi, %edi
145450824:     	cmpl	%ebp, -0x10(%r13)
145450828:     	jne	0x145450800 <.text+0x544f800>
14545082a:     	cmpb	$0x0, -0x20(%r13)
14545082f:     	jne	0x145450800 <.text+0x544f800>
145450831:     	xorl	%ebx, %ebx
145450833:     	cmpl	$0x0, (%r13)
145450838:     	setne	%bl
14545083b:     	jmp	0x145450802 <.text+0x544f802>
14545083d:     	xorl	%edi, %edi
14545083f:     	cmpl	$0x0, -0x30(%r13)
145450844:     	setne	%dil
145450848:     	cmpl	%ebp, -0x10(%r13)
14545084c:     	jne	0x145450800 <.text+0x544f800>
14545084e:     	jmp	0x14545082a <.text+0x544f82a>
145450850:     	testb	$0x1, %r9b
145450854:     	je	0x1454506e0 <.text+0x544f6e0>
14545085a:     	leaq	(%r12,%r12,2), %rbx
14545085e:     	shlq	$0x4, %rbx
145450862:     	cmpl	%ebp, 0x10(%r10,%rbx)
145450867:     	jne	0x145450891 <.text+0x544f891>
145450869:     	jmp	0x145450885 <.text+0x544f885>
14545086b:     	nopl	(%rax,%rax)
145450870:     	xorl	%r12d, %r12d
145450873:     	xorl	%r15d, %r15d
145450876:     	leaq	(%r12,%r12,2), %rbx
14545087a:     	shlq	$0x4, %rbx
14545087e:     	cmpl	%ebp, 0x10(%r10,%rbx)
145450883:     	jne	0x145450891 <.text+0x544f891>
145450885:     	addq	%r10, %rbx
145450888:     	cmpb	$0x0, (%rbx)
14545088b:     	je	0x14545096f <.text+0x544f96f>
145450891:     	xorl	%edi, %edi
145450893:     	addq	%rdi, %r15
145450896:     	testq	%r15, %r15
145450899:     	jne	0x1454506e9 <.text+0x544f6e9>
14545089f:     	testq	%r11, %r11
1454508a2:     	je	0x14545093b <.text+0x544f93b>
1454508a8:     	leaq	0x50(%r10), %r13
1454508ac:     	xorl	%r12d, %r12d
1454508af:     	xorl	%r15d, %r15d
1454508b2:     	jmp	0x1454508d5 <.text+0x544f8d5>
1454508b4:     	nopw	%cs:(%rax,%rax)
1454508c0:     	xorl	%ebx, %ebx
1454508c2:     	addq	%rdi, %r15
1454508c5:     	addq	%rbx, %r15
1454508c8:     	addq	$0x2, %r12
1454508cc:     	addq	$0x60, %r13
1454508d0:     	cmpq	%r12, %rsi
1454508d3:     	je	0x145450920 <.text+0x544f920>
1454508d5:     	cmpl	%ebp, -0x40(%r13)
1454508d9:     	jne	0x145450900 <.text+0x544f900>
1454508db:     	cmpq	$0x0, -0x50(%r13)
1454508e0:     	je	0x145450900 <.text+0x544f900>
1454508e2:     	xorl	%edi, %edi
1454508e4:     	cmpl	$0x0, -0x30(%r13)
1454508e9:     	setne	%dil
1454508ed:     	cmpl	%ebp, -0x10(%r13)
1454508f1:     	jne	0x1454508c0 <.text+0x544f8c0>
1454508f3:     	jmp	0x145450908 <.text+0x544f908>
1454508f5:     	nopw	%cs:(%rax,%rax)
145450900:     	xorl	%edi, %edi
145450902:     	cmpl	%ebp, -0x10(%r13)
145450906:     	jne	0x1454508c0 <.text+0x544f8c0>
145450908:     	cmpq	$0x0, -0x20(%r13)
14545090d:     	je	0x1454508c0 <.text+0x544f8c0>
14545090f:     	xorl	%ebx, %ebx
145450911:     	cmpl	$0x0, (%r13)
145450916:     	setne	%bl
145450919:     	jmp	0x1454508c2 <.text+0x544f8c2>
14545091b:     	nopl	(%rax,%rax)
145450920:     	testb	$0x1, %r9b
145450924:     	je	0x1454506e9 <.text+0x544f6e9>
14545092a:     	leaq	(%r12,%r12,2), %rbx
14545092e:     	shlq	$0x4, %rbx
145450932:     	cmpl	%ebp, 0x10(%r10,%rbx)
145450937:     	jne	0x145450965 <.text+0x544f965>
145450939:     	jmp	0x145450950 <.text+0x544f950>
14545093b:     	xorl	%r12d, %r12d
14545093e:     	xorl	%r15d, %r15d
145450941:     	leaq	(%r12,%r12,2), %rbx
145450945:     	shlq	$0x4, %rbx
145450949:     	cmpl	%ebp, 0x10(%r10,%rbx)
14545094e:     	jne	0x145450965 <.text+0x544f965>
145450950:     	addq	%r10, %rbx
145450953:     	cmpq	$0x0, (%rbx)
145450957:     	je	0x145450965 <.text+0x544f965>
145450959:     	xorl	%edi, %edi
14545095b:     	cmpl	$0x0, 0x20(%rbx)
14545095f:     	setne	%dil
145450963:     	jmp	0x145450967 <.text+0x544f967>
145450965:     	xorl	%edi, %edi
145450967:     	addq	%rdi, %r15
14545096a:     	jmp	0x1454506e9 <.text+0x544f6e9>
14545096f:     	xorl	%edi, %edi
145450971:     	cmpl	$0x0, 0x20(%rbx)
145450975:     	setne	%dil
145450979:     	addq	%rdi, %r15
14545097c:     	testq	%r15, %r15
14545097f:     	jne	0x1454506e9 <.text+0x544f6e9>
145450985:     	jmp	0x14545089f <.text+0x544f89f>
14545098a:     	xorl	%eax, %eax
14545098c:     	xorl	%ecx, %ecx
14545098e:     	nop
145450990:     	cmpq	$0x3, %rcx
145450994:     	ja	0x145450a0e <.text+0x544fa0e>
145450996:     	movq	%rcx, %r15
145450999:     	movq	%rcx, %r9
14545099c:     	orq	%rdx, %r9
14545099f:     	cmpq	$0xf, %r9
1454509a3:     	ja	0x145450a1f <.text+0x544fa1f>
1454509a5:     	leaq	0x1(%r15), %rcx
1454509a9:     	cmpl	$0x0, 0xb0(%r8,%r9,4)
1454509b2:     	jne	0x145450990 <.text+0x544f990>
1454509b4:     	cmpq	$0x3, %r15
1454509b8:     	je	0x145450a0e <.text+0x544fa0e>
1454509ba:     	orq	%rdx, %rcx
1454509bd:     	cmpq	$0xf, %rcx
1454509c1:     	ja	0x145450a1f <.text+0x544fa1f>
1454509c3:     	leaq	0x2(%r15), %r9
1454509c7:     	cmpl	$0x0, 0xb0(%r8,%rcx,4)
1454509d0:     	movq	%r9, %rcx
1454509d3:     	jne	0x145450990 <.text+0x544f990>
1454509d5:     	cmpq	$0x1, %r15
1454509d9:     	ja	0x145450a0e <.text+0x544fa0e>
1454509db:     	orq	%rdx, %r9
1454509de:     	cmpq	$0xf, %r9
1454509e2:     	ja	0x145450a1f <.text+0x544fa1f>
1454509e4:     	leaq	0x3(%r15), %rcx
1454509e8:     	cmpl	$0x0, 0xb0(%r8,%r9,4)
1454509f1:     	jne	0x145450990 <.text+0x544f990>
1454509f3:     	testq	%r15, %r15
1454509f6:     	jne	0x145450a0e <.text+0x544fa0e>
1454509f8:     	cmpq	$0xf, %rdx
1454509fc:     	ja	0x145450a1f <.text+0x544fa1f>
1454509fe:     	movl	$0x4, %ecx
145450a03:     	cmpl	$0x0, 0xbc(%r8,%rdx,4)
145450a0c:     	jne	0x145450990 <.text+0x544f990>
145450a0e:     	addq	$0x28, %rsp
145450a12:     	popq	%rbx
145450a13:     	popq	%rbp
145450a14:     	popq	%rdi
145450a15:     	popq	%rsi
145450a16:     	popq	%r12
145450a18:     	popq	%r13
145450a1a:     	popq	%r14
145450a1c:     	popq	%r15
145450a1e:     	retq
