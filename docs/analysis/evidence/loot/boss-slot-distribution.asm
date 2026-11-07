
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455287e0:     	pushq	%rbp
1455287e1:     	pushq	%r15
1455287e3:     	pushq	%r14
1455287e5:     	pushq	%r13
1455287e7:     	pushq	%r12
1455287e9:     	pushq	%rsi
1455287ea:     	pushq	%rdi
1455287eb:     	pushq	%rbx
1455287ec:     	subq	$0x88, %rsp
1455287f3:     	leaq	0x80(%rsp), %rbp
1455287fb:     	movaps	%xmm6, -0x10(%rbp)
1455287ff:     	movq	$-0x2, -0x18(%rbp)
145528807:     	movq	%rdx, %r8
14552880a:     	movq	0x18(%rdx), %r15
14552880e:     	movq	0x10(%rdx), %rdi
145528812:     	movq	(%rdx), %r12
145528815:     	movq	0x8(%rdx), %r13
145528819:     	imull	$0x64, %edi, %ebx
14552881c:     	addl	$0x1863c, %ebx          # imm = 0x1863C
145528822:     	jmp	0x145528844 <.text+0x5527844>
145528824:     	nopw	%cs:(%rax,%rax)
145528830:     	movq	%rdi, %rax
145528833:     	xorl	%edx, %edx
145528835:     	divq	%r9
145528838:     	incq	%rdi
14552883b:     	addl	$0x64, %ebx
14552883e:     	cmpq	(%r13), %rdx
145528842:     	je	0x14552887a <.text+0x552787a>
145528844:     	cmpq	%r15, %rdi
145528847:     	jae	0x1455289d1 <.text+0x55279d1>
14552884d:     	movq	0x10(%r12), %r9
145528852:     	testq	%r9, %r9
145528855:     	je	0x145528a18 <.text+0x5527a18>
14552885b:     	movq	%rdi, %rax
14552885e:     	orq	%r9, %rax
145528861:     	shrq	$0x20, %rax
145528865:     	jne	0x145528830 <.text+0x5527830>
145528867:     	movl	%edi, %eax
145528869:     	xorl	%edx, %edx
14552886b:     	divl	%r9d
14552886e:     	incq	%rdi
145528871:     	addl	$0x64, %ebx
145528874:     	cmpq	(%r13), %rdx
145528878:     	jne	0x145528844 <.text+0x5527844>
14552887a:     	movq	%rcx, -0x58(%rbp)
14552887e:     	movq	0x20(%r8), %rax
145528882:     	movq	0x28(%r8), %rcx
145528886:     	movq	%rax, -0x50(%rbp)
14552888a:     	movzbl	(%rax), %r14d
14552888e:     	movq	%rcx, -0x48(%rbp)
145528892:     	movq	(%rcx), %rsi
145528895:     	movq	0x30(%r8), %rax
145528899:     	movq	%rax, -0x40(%rbp)
14552889d:     	movss	(%rax), %xmm6
1455288a1:     	callq	0x140002200 <.text+0x1200>
1455288a6:     	movl	$0x20, %ecx
1455288ab:     	movl	$0x4, %edx
1455288b0:     	callq	0x1400021c0 <.text+0x11c0>
1455288b5:     	testq	%rax, %rax
1455288b8:     	je	0x145528a35 <.text+0x5527a35>
1455288be:     	movq	%rax, %r9
1455288c1:     	imull	$0x3e8, %r14d, %eax     # imm = 0x3E8
1455288c8:     	cmpq	$0x5, %rsi
1455288cc:     	movl	$0x5, %edx
1455288d1:     	cmovaeq	%rdx, %rsi
1455288d5:     	leal	(%rsi,%rsi,4), %edx
1455288d8:     	leal	(%rax,%rdx,2), %eax
1455288db:     	addl	%ebx, %eax
1455288dd:     	movl	%eax, (%r9)
1455288e0:     	movss	%xmm6, 0x4(%r9)
1455288e6:     	movq	$0x4, -0x38(%rbp)
1455288ee:     	movq	%r9, -0x30(%rbp)
1455288f2:     	movl	$0x1, %ebx
1455288f7:     	leaq	-0x38(%rbp), %rcx
1455288fb:     	movq	%rbx, -0x28(%rbp)
1455288ff:     	imull	$0x64, %edi, %r14d
145528903:     	addl	$0x1863c, %r14d         # imm = 0x1863C
14552890a:     	jmp	0x145528925 <.text+0x5527925>
14552890c:     	nopl	(%rax)
145528910:     	movq	%rdi, %rax
145528913:     	xorl	%edx, %edx
145528915:     	divq	%r8
145528918:     	incq	%rdi
14552891b:     	addl	$0x64, %r14d
14552891f:     	cmpq	(%r13), %rdx
145528923:     	je	0x14552895c <.text+0x552795c>
145528925:     	cmpq	%r15, %rdi
145528928:     	jae	0x1455289ea <.text+0x55279ea>
14552892e:     	movq	0x10(%r12), %r8
145528933:     	testq	%r8, %r8
145528936:     	je	0x145528a26 <.text+0x5527a26>
14552893c:     	movq	%rdi, %rax
14552893f:     	orq	%r8, %rax
145528942:     	shrq	$0x20, %rax
145528946:     	jne	0x145528910 <.text+0x5527910>
145528948:     	movl	%edi, %eax
14552894a:     	xorl	%edx, %edx
14552894c:     	divl	%r8d
14552894f:     	incq	%rdi
145528952:     	addl	$0x64, %r14d
145528956:     	cmpq	(%r13), %rdx
14552895a:     	jne	0x145528925 <.text+0x5527925>
14552895c:     	movq	-0x48(%rbp), %rax
145528960:     	movq	(%rax), %rsi
145528963:     	cmpq	$0x5, %rsi
145528967:     	movl	$0x5, %eax
14552896c:     	cmovaeq	%rax, %rsi
145528970:     	movq	-0x50(%rbp), %rax
145528974:     	movzbl	(%rax), %eax
145528977:     	movl	%eax, -0x1c(%rbp)
14552897a:     	movq	-0x40(%rbp), %rax
14552897e:     	movss	(%rax), %xmm6
145528982:     	cmpq	-0x38(%rbp), %rbx
145528986:     	jne	0x1455289ae <.text+0x55279ae>
145528988:     	movq	$0x8, 0x20(%rsp)
145528991:     	movl	$0x1, %r8d
145528997:     	movl	$0x4, %r9d
14552899d:     	movq	%rbx, %rdx
1455289a0:     	callq	0x145757d40 <.text+0x5756d40>
1455289a5:     	nop
1455289a6:     	movq	-0x30(%rbp), %r9
1455289aa:     	leaq	-0x38(%rbp), %rcx
1455289ae:     	imull	$0x3e8, -0x1c(%rbp), %eax # imm = 0x3E8
1455289b5:     	leal	(%rsi,%rsi,4), %edx
1455289b8:     	leal	(%rax,%rdx,2), %eax
1455289bb:     	addl	%r14d, %eax
1455289be:     	movl	%eax, (%r9,%rbx,8)
1455289c2:     	movss	%xmm6, 0x4(%r9,%rbx,8)
1455289c9:     	incq	%rbx
1455289cc:     	jmp	0x1455288fb <.text+0x55278fb>
1455289d1:     	movq	$0x0, (%rcx)
1455289d8:     	movq	$0x4, 0x8(%rcx)
1455289e0:     	movq	$0x0, 0x10(%rcx)
1455289e8:     	jmp	0x1455289fd <.text+0x55279fd>
1455289ea:     	movq	-0x28(%rbp), %rax
1455289ee:     	movq	-0x58(%rbp), %rcx
1455289f2:     	movq	%rax, 0x10(%rcx)
1455289f6:     	movups	-0x38(%rbp), %xmm0
1455289fa:     	movups	%xmm0, (%rcx)
1455289fd:     	movq	%rcx, %rax
145528a00:     	movaps	-0x10(%rbp), %xmm6
145528a04:     	addq	$0x88, %rsp
145528a0b:     	popq	%rbx
145528a0c:     	popq	%rdi
145528a0d:     	popq	%rsi
145528a0e:     	popq	%r12
145528a10:     	popq	%r13
145528a12:     	popq	%r14
145528a14:     	popq	%r15
145528a16:     	popq	%rbp
145528a17:     	retq
145528a18:     	leaq	0x145cf79(%rip), %rcx   # 0x146985998
145528a1f:     	callq	0x1458e78b0 <.text+0x58e68b0>
145528a24:     	ud2
145528a26:     	leaq	0x145cf6b(%rip), %rcx   # 0x146985998
145528a2d:     	callq	0x1458e78b0 <.text+0x58e68b0>
145528a32:     	nop
145528a33:     	ud2
145528a35:     	movl	$0x4, %ecx
145528a3a:     	movl	$0x20, %edx
145528a3f:     	callq	0x1458e721b <.text+0x58e621b>
145528a44:     	ud2
