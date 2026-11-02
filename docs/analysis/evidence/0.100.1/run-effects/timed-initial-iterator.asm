
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145545650:     	pushq	%rbp
145545651:     	pushq	%r15
145545653:     	pushq	%r14
145545655:     	pushq	%rsi
145545656:     	pushq	%rdi
145545657:     	pushq	%rbx
145545658:     	subq	$0x78, %rsp
14554565c:     	leaq	0x70(%rsp), %rbp
145545661:     	movq	$-0x2, (%rbp)
145545669:     	movq	0x18(%rdx), %r14
14554566d:     	subq	0x8(%rdx), %r14
145545671:     	movabsq	$0x1ffffffffffffff8, %rax # imm = 0x1FFFFFFFFFFFFFF8
14554567b:     	cmpq	%rax, %r14
14554567e:     	movq	%rdx, -0x28(%rbp)
145545682:     	jbe	0x145545698 <.text+0x5544698>
145545684:     	xorl	%ebx, %ebx
145545686:     	movb	$0x1, -0x1(%rbp)
14554568a:     	movq	%rbx, %rcx
14554568d:     	movq	%rdi, %rdx
145545690:     	callq	0x14590379b <.text+0x590279b>
145545695:     	nop
145545696:     	ud2
145545698:     	movq	%rdx, %r15
14554569b:     	movq	%rcx, %rsi
14554569e:     	leaq	(,%r14,4), %rdi
1455456a6:     	testq	%rdi, %rdi
1455456a9:     	je	0x1455456db <.text+0x55446db>
1455456ab:     	callq	0x140002200 <.text+0x1200>
1455456b0:     	movl	$0x8, %ebx
1455456b5:     	movl	$0x8, %edx
1455456ba:     	movq	%rdi, %rcx
1455456bd:     	callq	0x1400021c0 <.text+0x11c0>
1455456c2:     	testq	%rax, %rax
1455456c5:     	je	0x145545686 <.text+0x5544686>
1455456c7:     	shrq	$0x3, %r14
1455456cb:     	movabsq	$-0x5555555555555555, %rcx # imm = 0xAAAAAAAAAAAAAAAB
1455456d5:     	imulq	%r14, %rcx
1455456d9:     	jmp	0x1455456e2 <.text+0x55446e2>
1455456db:     	movl	$0x8, %eax
1455456e0:     	xorl	%ecx, %ecx
1455456e2:     	movq	%rcx, -0x20(%rbp)
1455456e6:     	movq	%rax, -0x18(%rbp)
1455456ea:     	leaq	-0x10(%rbp), %rcx
1455456ee:     	movq	$0x0, -0x10(%rbp)
1455456f6:     	movq	0x20(%r15), %rdx
1455456fa:     	movq	%rcx, -0x48(%rbp)
1455456fe:     	movq	$0x0, -0x40(%rbp)
145545706:     	movq	%rax, -0x38(%rbp)
14554570a:     	movq	%rdx, -0x30(%rbp)
14554570e:     	leaq	-0x48(%rbp), %rdx
145545712:     	movq	%r15, %rcx
145545715:     	callq	0x145559c90 <.text+0x5558c90>
14554571a:     	nop
14554571b:     	movq	-0x10(%rbp), %rax
14554571f:     	movq	%rax, 0x10(%rsi)
145545723:     	movups	-0x20(%rbp), %xmm0
145545727:     	movups	%xmm0, (%rsi)
14554572a:     	movq	%rsi, %rax
14554572d:     	addq	$0x78, %rsp
145545731:     	popq	%rbx
145545732:     	popq	%rdi
145545733:     	popq	%rsi
145545734:     	popq	%r14
145545736:     	popq	%r15
145545738:     	popq	%rbp
145545739:     	retq
