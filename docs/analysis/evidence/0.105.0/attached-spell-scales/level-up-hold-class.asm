
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140e0f5a9:     	movq	$0x1, 0x10(%rbp)
140e0f5b1:     	movq	%rdx, 0x18(%rbp)
140e0f5b5:     	movq	$0x1, 0x20(%rbp)
140e0f5bd:     	movq	%rsi, 0x28(%rbp)
140e0f5c1:     	leaq	0x30(%rbp), %rax
140e0f5c5:     	movl	$0x0, 0x3(%rax)
140e0f5cc:     	movl	$0x0, (%rax)
140e0f5d2:     	movq	0x30(%rcx), %rsi
140e0f5d6:     	cmpq	0x20(%rcx), %rsi
140e0f5da:     	movq	-0x10(%rbp), %rbx
140e0f5de:     	movq	-0x8(%rbp), %rdi
140e0f5e2:     	jne	0x140e0f5ee <.text+0xe0e5ee>
140e0f5e4:     	movq	-0x18(%rbp), %rcx
140e0f5e8:     	callq	0x145bcb610 <.text+0x5bca610>
140e0f5ed:     	nop
140e0f5ee:     	movq	(%rbp), %rdx
140e0f5f2:     	movq	0x28(%rdx), %rax
140e0f5f6:     	leaq	(%rsi,%rsi,2), %rcx
140e0f5fa:     	shlq	$0x4, %rcx
140e0f5fe:     	movups	0x10(%rbp), %xmm0
140e0f602:     	movups	0x20(%rbp), %xmm1
140e0f606:     	movups	0x30(%rbp), %xmm2
140e0f60a:     	movups	%xmm2, 0x20(%rax,%rcx)
140e0f60f:     	movups	%xmm1, 0x10(%rax,%rcx)
140e0f614:     	movups	%xmm0, (%rax,%rcx)
140e0f618:     	incq	%rsi
140e0f61b:     	movq	%rsi, 0x30(%rdx)
140e0f61f:     	incq	0x40(%rdx)
