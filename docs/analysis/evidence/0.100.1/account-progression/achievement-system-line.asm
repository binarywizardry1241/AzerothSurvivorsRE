
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14552f600:     	pushq	%rbp
14552f601:     	pushq	%r15
14552f603:     	pushq	%r14
14552f605:     	pushq	%rsi
14552f606:     	pushq	%rdi
14552f607:     	pushq	%rbx
14552f608:     	subq	$0xa8, %rsp
14552f60f:     	leaq	0x80(%rsp), %rbp
14552f617:     	movq	$-0x2, 0x20(%rbp)
14552f61f:     	movq	%rdx, %rdi
14552f622:     	movq	%rcx, %rsi
14552f625:     	leaq	0x1806688(%rip), %rbx   # 0x146d35cb4
14552f62c:     	movl	$0x13, %r14d
14552f632:     	movl	$0x13, %edx
14552f637:     	movq	%rbx, %rcx
14552f63a:     	callq	0x145457cb0 <.text+0x5456cb0>
14552f63f:     	testq	%rax, %rax
14552f642:     	cmoveq	%rbx, %rax
14552f646:     	cmoveq	%r14, %rdx
14552f64a:     	movq	%rax, -0x8(%rbp)
14552f64e:     	movq	%rdx, (%rbp)
14552f652:     	leaq	0x18(%rdi), %r15
14552f656:     	leaq	0x180666a(%rip), %rbx   # 0x146d35cc7
14552f65d:     	movl	$0xa, %r14d
14552f663:     	movl	$0xa, %edx
14552f668:     	movq	%rbx, %rcx
14552f66b:     	callq	0x145457cb0 <.text+0x5456cb0>
14552f670:     	testq	%rax, %rax
14552f673:     	cmovneq	%rax, %rbx
14552f677:     	cmovneq	%rdx, %r14
14552f67b:     	addq	$0x68, %rdi
14552f67f:     	leaq	0x1805b87(%rip), %rax   # 0x146d3520d
14552f686:     	movq	%rax, -0x28(%rbp)
14552f68a:     	movq	$0x1, -0x20(%rbp)
14552f692:     	movq	%rdi, -0x18(%rbp)
14552f696:     	leaq	0x1805b7b(%rip), %rax   # 0x146d35218
14552f69d:     	movq	%rax, -0x10(%rbp)
14552f6a1:     	movq	$0x1, 0x20(%rsp)
14552f6aa:     	leaq	0x8(%rbp), %rdi
14552f6ae:     	leaq	-0x28(%rbp), %r9
14552f6b2:     	movq	%rdi, %rcx
14552f6b5:     	movq	%rbx, %rdx
14552f6b8:     	movq	%r14, %r8
14552f6bb:     	callq	0x145458060 <.text+0x5457060>
14552f6c0:     	leaq	-0x8(%rbp), %rax
14552f6c4:     	movq	%rax, -0x58(%rbp)
14552f6c8:     	leaq	-0x552d60f(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14552f6cf:     	movq	%rax, -0x50(%rbp)
14552f6d3:     	movq	%r15, -0x48(%rbp)
14552f6d7:     	leaq	-0x552d5fe(%rip), %rax  # 0x1400020e0 <.text+0x10e0>
14552f6de:     	movq	%rax, -0x40(%rbp)
14552f6e2:     	movq	%rdi, -0x38(%rbp)
14552f6e6:     	movq	%rax, -0x30(%rbp)
14552f6ea:     	leaq	0x18065e0(%rip), %rdx   # 0x146d35cd1
14552f6f1:     	leaq	-0x58(%rbp), %r8
14552f6f5:     	movq	%rsi, %rcx
14552f6f8:     	callq	0x145728390 <.text+0x5727390>
14552f6fd:     	nop
14552f6fe:     	movq	0x8(%rbp), %rdx
14552f702:     	testq	%rdx, %rdx
14552f705:     	je	0x14552f716 <.text+0x552e716>
14552f707:     	movq	0x10(%rbp), %rcx
14552f70b:     	movl	$0x1, %r8d
14552f711:     	callq	0x1400021d0 <.text+0x11d0>
14552f716:     	movq	%rsi, %rax
14552f719:     	addq	$0xa8, %rsp
14552f720:     	popq	%rbx
14552f721:     	popq	%rdi
14552f722:     	popq	%rsi
14552f723:     	popq	%r14
14552f725:     	popq	%r15
14552f727:     	popq	%rbp
14552f728:     	retq
