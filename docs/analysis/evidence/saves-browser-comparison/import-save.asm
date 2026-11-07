
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14543a760:     	pushq	%rbp
14543a761:     	pushq	%rsi
14543a762:     	pushq	%rdi
14543a763:     	pushq	%rbx
14543a764:     	subq	$0x238, %rsp            # imm = 0x238
14543a76b:     	leaq	0x80(%rsp), %rbp
14543a773:     	movq	$-0x2, 0x1b0(%rbp)
14543a77e:     	movq	%r8, %rdi
14543a781:     	movq	%rdx, %rbx
14543a784:     	movq	%rcx, %rsi
14543a787:     	movq	%rdx, %rcx
14543a78a:     	movq	%r8, %rdx
14543a78d:     	callq	0x140ab0000 <.text+0xaaf000>
14543a792:     	cmpq	$0x5, %rdx
14543a796:     	jb	0x14543a7b1 <.text+0x54397b1>
14543a798:     	movl	0x15bf61c(%rip), %ecx   # 0x1469f9dba
14543a79e:     	xorl	(%rax), %ecx
14543a7a0:     	movzbl	0x15bf617(%rip), %edx   # 0x1469f9dbe
14543a7a7:     	xorb	0x4(%rax), %dl
14543a7aa:     	movzbl	%dl, %eax
14543a7ad:     	orl	%ecx, %eax
14543a7af:     	je	0x14543a7da <.text+0x54397da>
14543a7b1:     	leaq	0x1303394(%rip), %rax   # 0x14673db4c
14543a7b8:     	movq	%rax, 0x8(%rsi)
14543a7bc:     	movq	$0xf, 0x10(%rsi)
14543a7c4:     	movq	$-0x1, (%rsi)
14543a7cb:     	movq	%rsi, %rax
14543a7ce:     	addq	$0x238, %rsp            # imm = 0x238
14543a7d5:     	popq	%rbx
14543a7d6:     	popq	%rdi
14543a7d7:     	popq	%rsi
14543a7d8:     	popq	%rbp
14543a7d9:     	retq
14543a7da:     	leaq	-0x58(%rbp), %rcx
14543a7de:     	movq	%rbx, %rdx
14543a7e1:     	movq	%rdi, %r8
14543a7e4:     	callq	0x145515850 <.text+0x5514850>
14543a7e9:     	movq	-0x58(%rbp), %rax
14543a7ed:     	cmpq	$-0x1, %rax
14543a7f1:     	je	0x14543a8cb <.text+0x54398cb>
14543a7f7:     	movq	%rax, 0x1a0(%rbp)
14543a7fe:     	movq	-0x50(%rbp), %rdx
14543a802:     	movq	-0x48(%rbp), %r8
14543a806:     	leaq	-0x58(%rbp), %rcx
14543a80a:     	movq	%rdx, 0x190(%rbp)
14543a811:     	callq	0x145430740 <.text+0x542f740>
14543a816:     	nop
14543a817:     	movl	$0x0, 0x170(%rbp)
14543a821:     	leaq	0x178(%rbp), %rcx
14543a828:     	callq	0x145469160 <.text+0x5468160>
14543a82d:     	nop
14543a82e:     	movq	0x178(%rbp), %rax
14543a835:     	cmpq	$-0x1, %rax
14543a839:     	je	0x14543a888 <.text+0x5439888>
14543a83b:     	movq	%rax, 0x1a8(%rbp)
14543a842:     	movq	0x180(%rbp), %r8
14543a849:     	movq	0x188(%rbp), %r9
14543a850:     	leaq	0x1303310(%rip), %rcx   # 0x14673db67
14543a857:     	movl	$0x18, %edx
14543a85c:     	movq	%r8, 0x198(%rbp)
14543a863:     	callq	0x145468b20 <.text+0x5467b20>
14543a868:     	nop
14543a869:     	movq	0x1a8(%rbp), %rdx
14543a870:     	testq	%rdx, %rdx
14543a873:     	je	0x14543a888 <.text+0x5439888>
14543a875:     	movl	$0x1, %r8d
14543a87b:     	movq	0x198(%rbp), %rcx
14543a882:     	callq	0x1400021d0 <.text+0x11d0>
14543a887:     	nop
14543a888:     	leaq	-0x58(%rbp), %rcx
14543a88c:     	callq	0x1454356a0 <.text+0x54346a0>
14543a891:     	nop
14543a892:     	leaq	-0x58(%rbp), %rdx
14543a896:     	movl	$0x1d0, %r8d            # imm = 0x1D0
14543a89c:     	movq	%rsi, %rcx
14543a89f:     	callq	0x1457731ed <.text+0x57721ed>
14543a8a4:     	movq	0x1a0(%rbp), %rdx
14543a8ab:     	testq	%rdx, %rdx
14543a8ae:     	je	0x14543a7cb <.text+0x54397cb>
14543a8b4:     	movl	$0x1, %r8d
14543a8ba:     	movq	0x190(%rbp), %rcx
14543a8c1:     	callq	0x1400021d0 <.text+0x11d0>
14543a8c6:     	jmp	0x14543a7cb <.text+0x54397cb>
14543a8cb:     	leaq	0x1303289(%rip), %rax   # 0x14673db5b
14543a8d2:     	movq	%rax, 0x8(%rsi)
14543a8d6:     	movq	$0xc, 0x10(%rsi)
14543a8de:     	jmp	0x14543a7c4 <.text+0x54397c4>
