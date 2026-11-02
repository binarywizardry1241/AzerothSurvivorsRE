
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145461740:     	pushq	%rbp
145461741:     	pushq	%r14
145461743:     	pushq	%rsi
145461744:     	pushq	%rdi
145461745:     	pushq	%rbx
145461746:     	subq	$0x80, %rsp
14546174d:     	leaq	0x80(%rsp), %rbp
145461755:     	movq	$-0x2, -0x8(%rbp)
14546175d:     	movq	%rdx, %rdi
145461760:     	movq	%rcx, %rsi
145461763:     	movq	0x210(%rdx), %rdx
14546176a:     	movq	0x218(%rdi), %r8
145461771:     	leaq	-0x4c(%rbp), %rbx
145461775:     	movq	%rbx, %rcx
145461778:     	callq	0x145461fe0 <.text+0x5460fe0>
14546177d:     	movq	0x528(%rdi), %rax
145461784:     	movq	0x530(%rdi), %rcx
14546178b:     	leaq	(%rcx,%rcx,8), %rcx
14546178f:     	leaq	(%rax,%rcx,8), %rcx
145461793:     	movq	%rax, -0x20(%rbp)
145461797:     	movq	%rcx, -0x18(%rbp)
14546179b:     	movq	%rbx, -0x10(%rbp)
14546179f:     	leaq	-0x38(%rbp), %rcx
1454617a3:     	leaq	-0x20(%rbp), %rdx
1454617a7:     	callq	0x1454dc230 <.text+0x54db230>
1454617ac:     	movq	-0x30(%rbp), %rdi
1454617b0:     	movq	-0x28(%rbp), %rbx
1454617b4:     	movq	$0x1, 0x20(%rsp)
1454617bd:     	leaq	0x164d88d(%rip), %r9    # 0x146aaf051
1454617c4:     	leaq	-0x20(%rbp), %rcx
1454617c8:     	movq	%rdi, %rdx
1454617cb:     	movq	%rbx, %r8
1454617ce:     	callq	0x145422a70 <.text+0x5421a70>
1454617d3:     	nop
1454617d4:     	movq	-0x10(%rbp), %rax
1454617d8:     	movq	%rax, 0x10(%rsi)
1454617dc:     	movups	-0x20(%rbp), %xmm0
1454617e0:     	movups	%xmm0, (%rsi)
1454617e3:     	testq	%rbx, %rbx
1454617e6:     	je	0x145461812 <.text+0x5460812>
1454617e8:     	leaq	0x8(%rdi), %r14
1454617ec:     	jmp	0x1454617f9 <.text+0x54607f9>
1454617ee:     	nop
1454617f0:     	addq	$0x18, %r14
1454617f4:     	decq	%rbx
1454617f7:     	je	0x145461812 <.text+0x5460812>
1454617f9:     	movq	-0x8(%r14), %rdx
1454617fd:     	testq	%rdx, %rdx
145461800:     	je	0x1454617f0 <.text+0x54607f0>
145461802:     	movq	(%r14), %rcx
145461805:     	movl	$0x1, %r8d
14546180b:     	callq	0x1400021d0 <.text+0x11d0>
145461810:     	jmp	0x1454617f0 <.text+0x54607f0>
145461812:     	movq	-0x38(%rbp), %rax
145461816:     	testq	%rax, %rax
145461819:     	je	0x145461831 <.text+0x5460831>
14546181b:     	shlq	$0x3, %rax
14546181f:     	leaq	(%rax,%rax,2), %rdx
145461823:     	movl	$0x8, %r8d
145461829:     	movq	%rdi, %rcx
14546182c:     	callq	0x1400021d0 <.text+0x11d0>
145461831:     	movq	%rsi, %rax
145461834:     	addq	$0x80, %rsp
14546183b:     	popq	%rbx
14546183c:     	popq	%rdi
14546183d:     	popq	%rsi
14546183e:     	popq	%r14
145461840:     	popq	%rbp
145461841:     	retq
