
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14008e4e0:     	pushq	%rbp
14008e4e1:     	pushq	%rsi
14008e4e2:     	subq	$0x78, %rsp
14008e4e6:     	leaq	0x70(%rsp), %rbp
14008e4eb:     	movq	$-0x2, (%rbp)
14008e4f3:     	movq	%rcx, %rsi
14008e4f6:     	callq	0x1456e7d60 <.text+0x56e6d60>
14008e4fb:     	movl	%eax, -0x20(%rbp)
14008e4fe:     	movl	%edx, -0x1c(%rbp)
14008e501:     	leaq	-0x50(%rbp), %rcx
14008e505:     	leaq	-0x20(%rbp), %rdx
14008e509:     	movl	$0xd53e8000, %r8d       # imm = 0xD53E8000
14008e50f:     	movl	$0x19db1de, %r9d        # imm = 0x19DB1DE
14008e515:     	callq	0x1456e7d10 <.text+0x56e6d10>
14008e51a:     	cmpb	$0x0, -0x50(%rbp)
14008e51e:     	je	0x14008e52c <.text+0x8d52c>
14008e520:     	movabsq	$-0x61c8864680b583ee, %rax # imm = 0x9E3779B97F4A7C12
14008e52a:     	jmp	0x14008e547 <.text+0x8d547>
14008e52c:     	imulq	$0x3b9aca00, -0x48(%rbp), %rcx # imm = 0x3B9ACA00
14008e534:     	movl	-0x40(%rbp), %eax
14008e537:     	addq	%rax, %rcx
14008e53a:     	movabsq	$-0x61c8864680b583eb, %rax # imm = 0x9E3779B97F4A7C15
14008e544:     	xorq	%rcx, %rax
14008e547:     	movq	%rax, %rcx
14008e54a:     	shlq	$0xd, %rcx
14008e54e:     	xorq	%rax, %rcx
14008e551:     	movq	%rcx, %rax
14008e554:     	shrq	$0x7, %rax
14008e558:     	xorq	%rcx, %rax
14008e55b:     	movq	%rax, %rcx
14008e55e:     	shlq	$0x11, %rcx
14008e562:     	xorq	%rax, %rcx
14008e565:     	movabsq	$-0x3333333333333333, %r8 # imm = 0xCCCCCCCCCCCCCCCD
14008e56f:     	movq	%rcx, %rax
14008e572:     	mulq	%r8
14008e575:     	shrl	$0x2, %edx
14008e578:     	andl	$-0x4, %edx
14008e57b:     	leal	(%rdx,%rdx,4), %eax
14008e57e:     	movq	%rcx, %rdx
14008e581:     	shlq	$0xd, %rdx
14008e585:     	xorq	%rcx, %rdx
14008e588:     	movl	%ecx, %r10d
14008e58b:     	subl	%eax, %r10d
14008e58e:     	shll	$0x4, %r10d
14008e592:     	movq	%rdx, %r9
14008e595:     	shrq	$0x7, %r9
14008e599:     	xorq	%rdx, %r9
14008e59c:     	movq	%r9, %rax
14008e59f:     	shlq	$0x11, %rax
14008e5a3:     	xorq	%r9, %rax
14008e5a6:     	movq	%rax, %rcx
14008e5a9:     	shlq	$0xd, %rcx
14008e5ad:     	xorq	%rax, %rcx
14008e5b0:     	movq	%rcx, %rax
14008e5b3:     	shrq	$0x7, %rax
14008e5b7:     	xorq	%rcx, %rax
14008e5ba:     	movq	%rax, %rcx
14008e5bd:     	shlq	$0x11, %rcx
14008e5c1:     	xorq	%rax, %rcx
14008e5c4:     	movq	%rcx, %rax
14008e5c7:     	mulq	%r8
14008e5ca:     	leaq	0x586c04f(%rip), %rax   # 0x1458fa620
14008e5d1:     	addq	%r10, %rax
14008e5d4:     	shrl	$0x2, %edx
14008e5d7:     	andl	$-0x2, %edx
14008e5da:     	leal	(%rdx,%rdx,4), %edx
14008e5dd:     	subl	%edx, %ecx
14008e5df:     	andl	$0xf, %r9d
14008e5e3:     	shll	$0x4, %r9d
14008e5e7:     	leaq	0x586c19a(%rip), %rdx   # 0x1458fa788
14008e5ee:     	addq	%r9, %rdx
14008e5f1:     	shll	$0x4, %ecx
14008e5f4:     	leaq	0x586c29d(%rip), %r8    # 0x1458fa898
14008e5fb:     	addq	%rcx, %r8
14008e5fe:     	movq	%rax, -0x50(%rbp)
14008e602:     	leaq	-0x8c549(%rip), %rax    # 0x1400020c0 <.text+0x10c0>
14008e609:     	movq	%rax, -0x48(%rbp)
14008e60d:     	movq	%rdx, -0x40(%rbp)
14008e611:     	movq	%rax, -0x38(%rbp)
14008e615:     	movq	%r8, -0x30(%rbp)
14008e619:     	movq	%rax, -0x28(%rbp)
14008e61d:     	leaq	0x586c314(%rip), %rdx   # 0x1458fa938
14008e624:     	leaq	-0x20(%rbp), %rcx
14008e628:     	leaq	-0x50(%rbp), %r8
14008e62c:     	callq	0x14570bf80 <.text+0x570af80>
14008e631:     	movq	-0x18(%rbp), %rcx
14008e635:     	movq	-0x10(%rbp), %rax
14008e639:     	addq	%rcx, %rax
14008e63c:     	movq	%rcx, -0x8(%rbp)
14008e640:     	movq	%rcx, -0x50(%rbp)
14008e644:     	movq	%rax, -0x48(%rbp)
14008e648:     	movq	$0xc, -0x40(%rbp)
14008e650:     	leaq	-0x50(%rbp), %rdx
14008e654:     	movq	%rsi, %rcx
14008e657:     	callq	0x14018ec00 <.text+0x18dc00>
14008e65c:     	nop
14008e65d:     	movq	-0x20(%rbp), %rdx
14008e661:     	testq	%rdx, %rdx
14008e664:     	je	0x14008e676 <.text+0x8d676>
14008e666:     	movl	$0x1, %r8d
14008e66c:     	movq	-0x8(%rbp), %rcx
14008e670:     	callq	0x1400021d0 <.text+0x11d0>
14008e675:     	nop
14008e676:     	addq	$0x78, %rsp
14008e67a:     	popq	%rsi
14008e67b:     	popq	%rbp
14008e67c:     	retq
