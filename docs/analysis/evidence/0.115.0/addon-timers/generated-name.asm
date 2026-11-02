
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14583e84a:     	movq	%rax, 0x28(%rbp)
14583e84e:     	movq	%rbx, -0x38(%rbp)
14583e852:     	movq	%rdx, -0x30(%rbp)
14583e856:     	movq	%rdi, 0x8(%rbp)
14583e85a:     	leaq	-0x583c7a1(%rip), %r12  # 0x1400020c0 <.text+0x10c0>
14583e861:     	movq	%r12, 0x10(%rbp)
14583e865:     	leaq	0x148e52b(%rip), %rdx   # 0x146cccd97
14583e86c:     	leaq	-0x18(%rbp), %rcx
14583e870:     	leaq	0x8(%rbp), %rbx
14583e874:     	movq	%rbx, %r8
14583e877:     	callq	0x145ce7350 <.text+0x5ce6350>
14583e87c:     	nop
14583e87d:     	movq	%rsi, -0x28(%rbp)
14583e881:     	movq	-0x18(%rbp), %rax
14583e885:     	movq	%rax, 0x20(%rbp)
14583e889:     	movq	-0x10(%rbp), %rax
14583e88d:     	movq	%rax, 0x18(%rbp)
14583e891:     	movq	-0x8(%rbp), %rsi
14583e895:     	cmpq	$0xc, %r15
14583e899:     	je	0x14583e8d5 <.text+0x583d8d5>
14583e89b:     	cmpq	$0x5, %r15
14583e89f:     	jne	0x14583e8f2 <.text+0x583d8f2>
14583e8a1:     	movl	$0x656e6572, %eax       # imm = 0x656E6572
14583e8a6:     	xorl	(%r14), %eax
14583e8a9:     	movzbl	0x4(%r14), %ecx
14583e8ae:     	xorl	$0x77, %ecx
14583e8b1:     	orl	%eax, %ecx
14583e8b3:     	jne	0x14583e8f2 <.text+0x583d8f2>
14583e8b5:     	leaq	0x148e572(%rip), %r14   # 0x146ccce2e
14583e8bc:     	movl	$0xe, %r15d
14583e8c2:     	movl	$0xe, %edx
14583e8c7:     	movq	%r14, %rcx
14583e8ca:     	callq	0x1458dff90 <.text+0x58def90>
14583e8cf:     	nop
14583e8d0:     	jmp	0x14583e979 <.text+0x583d979>
14583e8d5:     	movabsq	$0x616e6576756a6572, %rax # imm = 0x616E6576756A6572
14583e8df:     	xorq	(%r14), %rax
14583e8e2:     	movl	0x8(%r14), %ecx
14583e8e6:     	xorq	$0x6e6f6974, %rcx       # imm = 0x6E6F6974
14583e8ed:     	orq	%rax, %rcx
14583e8f0:     	je	0x14583e95e <.text+0x583d95e>
14583e8f2:     	movq	%rdi, 0x8(%rbp)
14583e8f6:     	movq	%r12, 0x10(%rbp)
14583e8fa:     	leaq	0x147657f(%rip), %rdx   # 0x146cb4e80
14583e901:     	leaq	-0x18(%rbp), %rcx
14583e905:     	leaq	0x8(%rbp), %r8
14583e909:     	callq	0x145ce7350 <.text+0x5ce6350>
14583e90e:     	nop
14583e90f:     	movq	%r13, %rbx
14583e912:     	movq	-0x10(%rbp), %rcx
14583e916:     	movq	-0x8(%rbp), %rdx
14583e91a:     	movq	0x10(%rdi), %r14
14583e91e:     	movq	0x18(%rdi), %r13
14583e922:     	movq	%rcx, -0x20(%rbp)
14583e926:     	callq	0x1458dff90 <.text+0x58def90>
14583e92b:     	nop
14583e92c:     	movq	%rax, %r15
14583e92f:     	movq	%rdx, %rdi
14583e932:     	movq	-0x18(%rbp), %rdx
14583e936:     	testq	%rdx, %rdx
14583e939:     	je	0x14583e94a <.text+0x583d94a>
14583e93b:     	movl	$0x1, %r8d
14583e941:     	movq	-0x20(%rbp), %rcx
14583e945:     	callq	0x1400021d0 <.text+0x11d0>
14583e94a:     	testq	%r15, %r15
14583e94d:     	cmoveq	%r13, %rdi
14583e951:     	cmovneq	%r15, %r14
14583e955:     	movq	%rbx, %r13
14583e958:     	leaq	0x8(%rbp), %rbx
14583e95c:     	jmp	0x14583e987 <.text+0x583d987>
14583e95e:     	leaq	0x148e4b4(%rip), %r14   # 0x146ccce19
14583e965:     	movl	$0x15, %r15d
14583e96b:     	movl	$0x15, %edx
14583e970:     	movq	%r14, %rcx
14583e973:     	callq	0x1458dff90 <.text+0x58def90>
14583e978:     	nop
14583e979:     	movq	%rdx, %rdi
14583e97c:     	testq	%rax, %rax
14583e97f:     	cmoveq	%r15, %rdi
14583e983:     	cmovneq	%rax, %r14
14583e987:     	movq	%r14, 0x8(%rbp)
14583e98b:     	movq	%rdi, 0x10(%rbp)
14583e98f:     	leaq	-0x38(%rbp), %rax
14583e993:     	movq	%rax, -0x18(%rbp)
14583e997:     	movq	%r12, -0x10(%rbp)
14583e99b:     	movq	%rbx, -0x8(%rbp)
14583e99f:     	movq	%r12, (%rbp)
14583e9a3:     	leaq	0x148e492(%rip), %rdx   # 0x146ccce3c
14583e9aa:     	leaq	-0x50(%rbp), %rcx
14583e9ae:     	leaq	-0x18(%rbp), %r8
14583e9b2:     	callq	0x145ce7350 <.text+0x5ce6350>
14583e9b7:     	nop
14583e9b8:     	movq	0x40(%rbp), %rax
14583e9bc:     	movq	%rax, 0x40(%r13)
14583e9c0:     	movups	0x30(%rbp), %xmm0
14583e9c4:     	movups	%xmm0, 0x30(%r13)
14583e9c9:     	movq	0x20(%rbp), %rax
14583e9cd:     	movq	%rax, (%r13)
14583e9d1:     	movq	0x18(%rbp), %rax
14583e9d5:     	movq	%rax, 0x8(%r13)
14583e9d9:     	movq	%rsi, 0x10(%r13)
14583e9dd:     	movups	-0x50(%rbp), %xmm0
14583e9e1:     	movups	%xmm0, 0x18(%r13)
14583e9e6:     	movq	-0x40(%rbp), %rax
14583e9ea:     	movq	%rax, 0x28(%r13)
14583e9ee:     	movq	0x28(%rbp), %rax
14583e9f2:     	movq	%rax, 0x48(%r13)
14583e9f6:     	movq	-0x28(%rbp), %rax
14583e9fa:     	movq	%rax, 0x50(%r13)
