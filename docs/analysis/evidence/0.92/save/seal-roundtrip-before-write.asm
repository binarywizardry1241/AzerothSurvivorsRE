
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453fe8c0:     	pushq	%rbp
1453fe8c1:     	pushq	%r14
1453fe8c3:     	pushq	%rsi
1453fe8c4:     	pushq	%rdi
1453fe8c5:     	pushq	%rbx
1453fe8c6:     	subq	$0x90, %rsp
1453fe8cd:     	leaq	0x80(%rsp), %rbp
1453fe8d5:     	movq	$-0x2, 0x8(%rbp)
1453fe8dd:     	movq	%rcx, %rdx
1453fe8e0:     	leaq	-0x38(%rbp), %rcx
1453fe8e4:     	callq	0x1453ff1b0 <.text+0x53fe1b0>
1453fe8e9:     	movq	-0x30(%rbp), %rdx
1453fe8ed:     	movq	-0x28(%rbp), %rsi
1453fe8f1:     	leaq	-0x50(%rbp), %rcx
1453fe8f5:     	movq	%rdx, (%rbp)
1453fe8f9:     	movq	%rsi, %r8
1453fe8fc:     	callq	0x145456e30 <.text+0x5455e30>
1453fe901:     	nop
1453fe902:     	movq	-0x48(%rbp), %rdx
1453fe906:     	movq	-0x40(%rbp), %rdi
1453fe90a:     	leaq	-0x20(%rbp), %rcx
1453fe90e:     	movq	%rdx, -0x8(%rbp)
1453fe912:     	movq	%rdi, %r8
1453fe915:     	callq	0x1454569f0 <.text+0x54559f0>
1453fe91a:     	nop
1453fe91b:     	movq	-0x20(%rbp), %rbx
1453fe91f:     	cmpq	$-0x1, %rbx
1453fe923:     	je	0x1453fe95d <.text+0x53fd95d>
1453fe925:     	cmpq	%rsi, -0x10(%rbp)
1453fe929:     	jne	0x1453fe946 <.text+0x53fd946>
1453fe92b:     	movq	-0x18(%rbp), %r14
1453fe92f:     	movq	%r14, %rcx
1453fe932:     	movq	(%rbp), %rdx
1453fe936:     	movq	%rsi, %r8
1453fe939:     	callq	0x1457149f7 <.text+0x57139f7>
1453fe93e:     	testl	%eax, %eax
1453fe940:     	je	0x1453fe9e0 <.text+0x53fd9e0>
1453fe946:     	testq	%rbx, %rbx
1453fe949:     	je	0x1453fe95d <.text+0x53fd95d>
1453fe94b:     	movq	-0x18(%rbp), %rcx
1453fe94f:     	movl	$0x1, %r8d
1453fe955:     	movq	%rbx, %rdx
1453fe958:     	callq	0x1400021d0 <.text+0x11d0>
1453fe95d:     	leaq	0x12dd4a4(%rip), %rax   # 0x1466dbe08
1453fe964:     	movq	%rax, -0x60(%rbp)
1453fe968:     	movq	$0x33, -0x58(%rbp)
1453fe970:     	leaq	-0x60(%rbp), %rax
1453fe974:     	movq	%rax, -0x20(%rbp)
1453fe978:     	leaq	-0x53fc8bf(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1453fe97f:     	movq	%rax, -0x18(%rbp)
1453fe983:     	leaq	0x12e1e2c(%rip), %rcx   # 0x1466e07b6
1453fe98a:     	leaq	-0x20(%rbp), %rdx
1453fe98e:     	callq	0x1456b37a0 <.text+0x56b27a0>
1453fe993:     	nop
1453fe994:     	movq	(%rbp), %rcx
1453fe998:     	movq	%rsi, %rdx
1453fe99b:     	callq	0x145421430 <.text+0x5420430>
1453fe9a0:     	nop
1453fe9a1:     	movq	-0x50(%rbp), %rdx
1453fe9a5:     	testq	%rdx, %rdx
1453fe9a8:     	je	0x1453fe9b9 <.text+0x53fd9b9>
1453fe9aa:     	movl	$0x1, %r8d
1453fe9b0:     	movq	-0x8(%rbp), %rcx
1453fe9b4:     	callq	0x1400021d0 <.text+0x11d0>
1453fe9b9:     	movq	-0x38(%rbp), %rdx
1453fe9bd:     	testq	%rdx, %rdx
1453fe9c0:     	je	0x1453fe9d2 <.text+0x53fd9d2>
1453fe9c2:     	movl	$0x1, %r8d
1453fe9c8:     	movq	(%rbp), %rcx
1453fe9cc:     	callq	0x1400021d0 <.text+0x11d0>
1453fe9d1:     	nop
1453fe9d2:     	addq	$0x90, %rsp
1453fe9d9:     	popq	%rbx
1453fe9da:     	popq	%rdi
1453fe9db:     	popq	%rsi
1453fe9dc:     	popq	%r14
1453fe9de:     	popq	%rbp
1453fe9df:     	retq
1453fe9e0:     	testq	%rbx, %rbx
1453fe9e3:     	je	0x1453fe9f7 <.text+0x53fd9f7>
1453fe9e5:     	movl	$0x1, %r8d
1453fe9eb:     	movq	%r14, %rcx
1453fe9ee:     	movq	%rbx, %rdx
1453fe9f1:     	callq	0x1400021d0 <.text+0x11d0>
1453fe9f6:     	nop
1453fe9f7:     	movq	-0x8(%rbp), %rcx
1453fe9fb:     	movq	%rdi, %rdx
1453fe9fe:     	callq	0x145421430 <.text+0x5420430>
1453fea03:     	nop
1453fea04:     	jmp	0x1453fe9a1 <.text+0x53fd9a1>
