
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d7810:     	pushq	%rbp
1454d7811:     	pushq	%rsi
1454d7812:     	pushq	%rdi
1454d7813:     	pushq	%rbx
1454d7814:     	subq	$0x88, %rsp
1454d781b:     	leaq	0x80(%rsp), %rbp
1454d7823:     	movq	$-0x2, (%rbp)
1454d782b:     	movq	%rdx, %rsi
1454d782e:     	movq	%rcx, %rdi
1454d7831:     	movq	0x778(%rcx), %rbx
1454d7838:     	cmpq	0x768(%rcx), %rbx
1454d783f:     	jne	0x1454d784d <.text+0x54d684d>
1454d7841:     	leaq	0x768(%rdi), %rcx
1454d7848:     	callq	0x145758200 <.text+0x5757200>
1454d784d:     	movq	0x770(%rdi), %rax
1454d7854:     	movq	%rbx, %rcx
1454d7857:     	shlq	$0x4, %rcx
1454d785b:     	movq	%rsi, (%rax,%rcx)
1454d785f:     	movl	$0x40800000, 0x8(%rax,%rcx) # imm = 0x40800000
1454d7867:     	incq	%rbx
1454d786a:     	movq	%rbx, 0x778(%rdi)
1454d7871:     	movq	0x3d0(%rdi), %rdx
1454d7878:     	movq	%rsi, -0x8(%rbp)
1454d787c:     	movq	%rsi, -0x10(%rbp)
1454d7880:     	movl	$0x0, -0x18(%rbp)
1454d7887:     	movl	$0x0, -0x24(%rbp)
1454d788e:     	leaq	-0x24(%rbp), %rax
1454d7892:     	movq	%rax, 0x30(%rsp)
1454d7897:     	leaq	-0x18(%rbp), %rax
1454d789b:     	movq	%rax, 0x28(%rsp)
1454d78a0:     	movq	$0x1, 0x20(%rsp)
1454d78a9:     	leaq	-0x48(%rbp), %rcx
1454d78ad:     	leaq	-0x8(%rbp), %r9
1454d78b1:     	movl	$0x302, %r8d            # imm = 0x302
1454d78b7:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454d78bc:     	movq	0x548(%rdi), %rbx
1454d78c3:     	cmpq	0x538(%rdi), %rbx
1454d78ca:     	jne	0x1454d78d9 <.text+0x54d68d9>
1454d78cc:     	leaq	0x538(%rdi), %rcx
1454d78d3:     	callq	0x1457580b0 <.text+0x57570b0>
1454d78d8:     	nop
1454d78d9:     	movq	0x540(%rdi), %rax
1454d78e0:     	movq	%rbx, %rcx
1454d78e3:     	shlq	$0x5, %rcx
1454d78e7:     	movups	-0x48(%rbp), %xmm0
1454d78eb:     	movups	-0x38(%rbp), %xmm1
1454d78ef:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d78f4:     	movups	%xmm0, (%rax,%rcx)
1454d78f8:     	incq	%rbx
1454d78fb:     	movq	%rbx, 0x548(%rdi)
1454d7902:     	movq	%rdi, %rcx
1454d7905:     	movq	%rsi, %rdx
1454d7908:     	movl	$0x302, %r8d            # imm = 0x302
1454d790e:     	movb	$0x1, %r9b
1454d7911:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454d7916:     	nop
1454d7917:     	addq	$0x88, %rsp
1454d791e:     	popq	%rbx
1454d791f:     	popq	%rdi
1454d7920:     	popq	%rsi
1454d7921:     	popq	%rbp
1454d7922:     	retq
