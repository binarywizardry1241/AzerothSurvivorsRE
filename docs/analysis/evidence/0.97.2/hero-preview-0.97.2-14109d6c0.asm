
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14109d6c0:     	pushq	%rbp
14109d6c1:     	pushq	%r15
14109d6c3:     	pushq	%r14
14109d6c5:     	pushq	%rsi
14109d6c6:     	pushq	%rdi
14109d6c7:     	pushq	%rbx
14109d6c8:     	subq	$0x58, %rsp
14109d6cc:     	leaq	0x50(%rsp), %rbp
14109d6d1:     	movq	$-0x2, (%rbp)
14109d6d9:     	movq	0x8(%rdx), %r14
14109d6dd:     	subq	(%rdx), %r14
14109d6e0:     	movabsq	$0x924924924924920, %rax # imm = 0x924924924924920
14109d6ea:     	cmpq	%rax, %r14
14109d6ed:     	jbe	0x14109d6fe <.text+0x109c6fe>
14109d6ef:     	xorl	%ebx, %ebx
14109d6f1:     	movq	%rbx, %rcx
14109d6f4:     	movq	%rdi, %rdx
14109d6f7:     	callq	0x1458e721b <.text+0x58e621b>
14109d6fc:     	ud2
14109d6fe:     	movq	%rcx, %rsi
14109d701:     	shrq	$0x3, %r14
14109d705:     	imulq	$0x70, %r14, %rdi
14109d709:     	testq	%rdi, %rdi
14109d70c:     	je	0x14109d732 <.text+0x109c732>
14109d70e:     	movq	%rdx, %r15
14109d711:     	callq	0x140002200 <.text+0x1200>
14109d716:     	movl	$0x8, %ebx
14109d71b:     	movl	$0x8, %edx
14109d720:     	movq	%rdi, %rcx
14109d723:     	callq	0x1400021c0 <.text+0x11c0>
14109d728:     	testq	%rax, %rax
14109d72b:     	je	0x14109d6f1 <.text+0x109c6f1>
14109d72d:     	movq	%r15, %rdx
14109d730:     	jmp	0x14109d73a <.text+0x109c73a>
14109d732:     	movl	$0x8, %eax
14109d737:     	xorl	%r14d, %r14d
14109d73a:     	movq	%r14, -0x18(%rbp)
14109d73e:     	movq	%rax, -0x10(%rbp)
14109d742:     	leaq	-0x8(%rbp), %rcx
14109d746:     	movq	$0x0, -0x8(%rbp)
14109d74e:     	movq	%rax, -0x20(%rbp)
14109d752:     	movq	%rcx, -0x30(%rbp)
14109d756:     	movq	$0x0, -0x28(%rbp)
14109d75e:     	leaq	-0x30(%rbp), %rax
14109d762:     	movq	%rdx, %rcx
14109d765:     	movq	%rax, %rdx
14109d768:     	callq	0x14061ba50 <.text+0x61aa50>
14109d76d:     	nop
14109d76e:     	movq	-0x8(%rbp), %rax
14109d772:     	movq	%rax, 0x10(%rsi)
14109d776:     	movups	-0x18(%rbp), %xmm0
14109d77a:     	movups	%xmm0, (%rsi)
14109d77d:     	movq	%rsi, %rax
14109d780:     	addq	$0x58, %rsp
14109d784:     	popq	%rbx
14109d785:     	popq	%rdi
14109d786:     	popq	%rsi
14109d787:     	popq	%r14
14109d789:     	popq	%r15
14109d78b:     	popq	%rbp
14109d78c:     	retq
