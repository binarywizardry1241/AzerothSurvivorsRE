
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545c420:     	pushq	%rbp
14545c421:     	pushq	%r15
14545c423:     	pushq	%r14
14545c425:     	pushq	%r13
14545c427:     	pushq	%r12
14545c429:     	pushq	%rsi
14545c42a:     	pushq	%rdi
14545c42b:     	pushq	%rbx
14545c42c:     	subq	$0x428, %rsp            # imm = 0x428
14545c433:     	leaq	0x80(%rsp), %rbp
14545c43b:     	movq	$-0x2, 0x3a0(%rbp)
14545c446:     	movq	%r8, %rbx
14545c449:     	movq	%rdx, %rdi
14545c44c:     	movq	%rcx, %rsi
14545c44f:     	leaq	0x198(%rbp), %rcx
14545c456:     	movl	$0x1e0, %r8d            # imm = 0x1E0
14545c45c:     	xorl	%edx, %edx
14545c45e:     	callq	0x1457731db <.text+0x57721db>
14545c463:     	testq	%rbx, %rbx
14545c466:     	je	0x14545c4e0 <.text+0x545b4e0>
14545c468:     	shlq	$0x4, %rbx
14545c46c:     	leaq	-0x10(%rbx), %rcx
14545c470:     	movq	%rdi, %rax
14545c473:     	testb	$0x10, %cl
14545c476:     	jne	0x14545c491 <.text+0x545b491>
14545c478:     	leaq	0x10(%rdi), %rax
14545c47c:     	movq	(%rdi), %rdx
14545c47f:     	cmpq	$0x77, %rdx
14545c483:     	ja	0x14545c491 <.text+0x545b491>
14545c485:     	movl	0x8(%rdi), %r8d
14545c489:     	movl	%r8d, 0x198(%rbp,%rdx,4)
14545c491:     	testq	%rcx, %rcx
14545c494:     	je	0x14545c4e0 <.text+0x545b4e0>
14545c496:     	addq	%rbx, %rdi
14545c499:     	jmp	0x14545c4a9 <.text+0x545b4a9>
14545c49b:     	nopl	(%rax,%rax)
14545c4a0:     	addq	$0x20, %rax
14545c4a4:     	cmpq	%rdi, %rax
14545c4a7:     	je	0x14545c4e0 <.text+0x545b4e0>
14545c4a9:     	movq	(%rax), %rcx
14545c4ac:     	cmpq	$0x78, %rcx
14545c4b0:     	jb	0x14545c4c0 <.text+0x545b4c0>
14545c4b2:     	movq	0x10(%rax), %rcx
14545c4b6:     	cmpq	$0x77, %rcx
14545c4ba:     	ja	0x14545c4a0 <.text+0x545b4a0>
14545c4bc:     	jmp	0x14545c4d4 <.text+0x545b4d4>
14545c4be:     	nop
14545c4c0:     	movl	0x8(%rax), %edx
14545c4c3:     	movl	%edx, 0x198(%rbp,%rcx,4)
14545c4ca:     	movq	0x10(%rax), %rcx
14545c4ce:     	cmpq	$0x77, %rcx
14545c4d2:     	ja	0x14545c4a0 <.text+0x545b4a0>
14545c4d4:     	movl	0x18(%rax), %edx
14545c4d7:     	movl	%edx, 0x198(%rbp,%rcx,4)
14545c4de:     	jmp	0x14545c4a0 <.text+0x545b4a0>
14545c4e0:     	callq	0x140002200 <.text+0x1200>
14545c4e5:     	movl	$0x20, %r14d
14545c4eb:     	movl	$0x20, %ecx
14545c4f0:     	movl	$0x1, %edx
14545c4f5:     	callq	0x1400021c0 <.text+0x11c0>
14545c4fa:     	testq	%rax, %rax
14545c4fd:     	je	0x14545c624 <.text+0x545b624>
14545c503:     	movq	%rax, %rdi
14545c506:     	leaq	-0x48(%rbp), %rcx
14545c50a:     	leaq	0x198(%rbp), %rdx
14545c511:     	movl	$0x1e0, %r8d            # imm = 0x1E0
14545c517:     	callq	0x1457731ed <.text+0x57721ed>
14545c51c:     	movw	$0x129, %ax             # imm = 0x129
14545c520:     	movl	$0x4, %r15d
14545c526:     	leaq	0x392(%rbp), %r12
14545c52d:     	xorl	%edx, %edx
14545c52f:     	leaq	0x378(%rbp), %rbx
14545c536:     	nopw	%cs:(%rax,%rax)
14545c540:     	movl	-0x58(%rbp,%r15,4), %r13d
14545c545:     	movq	%r14, 0x378(%rbp)
14545c54c:     	movq	%rdi, 0x380(%rbp)
14545c553:     	movq	%rdx, 0x388(%rbp)
14545c55a:     	movw	%ax, 0x390(%rbp)
14545c561:     	movzwl	0x39c(%rbp), %ecx
14545c568:     	movw	%cx, 0x4(%r12)
14545c56e:     	movl	0x398(%rbp), %ecx
14545c574:     	movl	%ecx, (%r12)
14545c578:     	movq	%r14, %rcx
14545c57b:     	subq	%rdx, %rcx
14545c57e:     	cmpq	$0x3, %rcx
14545c582:     	jbe	0x14545c5ae <.text+0x545b5ae>
14545c584:     	movl	%r13d, (%rdi,%rdx)
14545c588:     	addq	$0x4, %rdx
14545c58c:     	movzwl	0x4(%r12), %ecx
14545c592:     	movw	%cx, 0x39c(%rbp)
14545c599:     	movl	(%r12), %ecx
14545c59d:     	movl	%ecx, 0x398(%rbp)
14545c5a3:     	incq	%r15
14545c5a6:     	cmpq	$0x7c, %r15
14545c5aa:     	jne	0x14545c540 <.text+0x545b540>
14545c5ac:     	jmp	0x14545c5ea <.text+0x545b5ea>
14545c5ae:     	movq	$0x1, 0x20(%rsp)
14545c5b7:     	movl	$0x4, %r8d
14545c5bd:     	movl	$0x1, %r9d
14545c5c3:     	movq	%rbx, %rcx
14545c5c6:     	callq	0x1457744b0 <.text+0x57734b0>
14545c5cb:     	nop
14545c5cc:     	movq	0x388(%rbp), %rdx
14545c5d3:     	movq	0x378(%rbp), %r14
14545c5da:     	movq	0x380(%rbp), %rdi
14545c5e1:     	movzwl	0x390(%rbp), %eax
14545c5e8:     	jmp	0x14545c584 <.text+0x545b584>
14545c5ea:     	movq	%r14, (%rsi)
14545c5ed:     	movq	%rdi, 0x8(%rsi)
14545c5f1:     	movq	%rdx, 0x10(%rsi)
14545c5f5:     	movw	%ax, 0x18(%rsi)
14545c5f9:     	movl	0x398(%rbp), %eax
14545c5ff:     	movl	%eax, 0x1a(%rsi)
14545c602:     	movzwl	0x39c(%rbp), %eax
14545c609:     	movw	%ax, 0x1e(%rsi)
14545c60d:     	movq	%rsi, %rax
14545c610:     	addq	$0x428, %rsp            # imm = 0x428
14545c617:     	popq	%rbx
14545c618:     	popq	%rdi
14545c619:     	popq	%rsi
14545c61a:     	popq	%r12
14545c61c:     	popq	%r13
14545c61e:     	popq	%r14
14545c620:     	popq	%r15
14545c622:     	popq	%rbp
14545c623:     	retq
14545c624:     	movl	$0x1, %ecx
14545c629:     	movl	$0x20, %edx
14545c62e:     	callq	0x14590379b <.text+0x590279b>
14545c633:     	ud2
