
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cc572:     	movq	%rdi, %r15
1454cc575:     	movq	%r14, 0x120(%rbp)
1454cc57c:     	movq	%rdx, 0x128(%rbp)
1454cc583:     	movq	%r10, 0x130(%rbp)
1454cc58a:     	movq	%rax, 0x138(%rbp)
1454cc591:     	movq	%r12, %rcx
1454cc594:     	leaq	0x120(%rbp), %rdx
1454cc59b:     	movq	0x178(%rbp), %r8
1454cc5a2:     	callq	0x1454cb900 <.text+0x54ca900>
1454cc5a7:     	nop
1454cc5a8:     	testb	%al, %al
1454cc5aa:     	je	0x1454cc630 <.text+0x54cb630>
1454cc5b0:     	movd	%ebx, %xmm0
1454cc5b4:     	movq	0x8b8(%r12), %rax
1454cc5bc:     	movq	0x8a0(%r12), %rcx
1454cc5c4:     	movq	0x8a8(%r12), %rdx
1454cc5cc:     	leaq	(%rax,%rcx), %r8
1454cc5d0:     	rolq	$0x17, %r8
1454cc5d4:     	addq	%rcx, %r8
1454cc5d7:     	movq	%rdx, %r9
1454cc5da:     	shlq	$0x11, %r9
1454cc5de:     	movq	0x8b0(%r12), %r10
1454cc5e6:     	xorq	%rcx, %r10
1454cc5e9:     	xorq	%rdx, %rax
1454cc5ec:     	xorq	%r10, %rdx
1454cc5ef:     	movq	%rdx, 0x8a8(%r12)
1454cc5f7:     	xorq	%rax, %rcx
1454cc5fa:     	movq	%rcx, 0x8a0(%r12)
1454cc602:     	xorq	%r9, %r10
1454cc605:     	movq	%r10, 0x8b0(%r12)
1454cc60d:     	rolq	$0x2d, %rax
1454cc611:     	shrq	$0x28, %r8
1454cc615:     	cvtsi2ss	%r8d, %xmm1
1454cc61a:     	movq	%rax, 0x8b8(%r12)
1454cc622:     	mulss	%xmm14, %xmm1
1454cc627:     	ucomiss	%xmm0, %xmm1
1454cc62a:     	jb	0x1454ce02d <.text+0x54cd02d>
