
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14070f550:     	pushq	%r15
14070f552:     	pushq	%r14
14070f554:     	pushq	%r12
14070f556:     	pushq	%rsi
14070f557:     	pushq	%rdi
14070f558:     	pushq	%rbp
14070f559:     	pushq	%rbx
14070f55a:     	subq	$0x20, %rsp
14070f55e:     	movq	0x80(%rsp), %rdi
14070f566:     	movq	(%rdx), %r12
14070f569:     	movq	(%r8), %r14
14070f56c:     	movq	0x10(%r8), %r15
14070f570:     	movl	0x1c(%r8), %ebp
14070f574:     	movq	(%r9), %rbx
14070f577:     	movl	0x728ffcb(%rip), %eax   # 0x14799f548
14070f57d:     	testl	%eax, %eax
14070f57f:     	jne	0x14070f685 <.text+0x70e685>
14070f585:     	movb	$0x1, %cl
14070f587:     	xorl	%eax, %eax
14070f589:     	lock
14070f58a:     	cmpxchgb	%cl, 0x728ff87(%rip)    # 0x14799f518
14070f591:     	jne	0x14070f6a3 <.text+0x70e6a3>
14070f597:     	movq	0x72d780a(%rip), %rsi   # 0x1479e6da8
14070f59e:     	movq	(%rsi), %rax
14070f5a1:     	shlq	%rax
14070f5a4:     	testq	%rax, %rax
14070f5a7:     	jne	0x14070f6b4 <.text+0x70e6b4>
14070f5ad:     	xorl	%eax, %eax
14070f5af:     	movzbl	0x728ff63(%rip), %ecx   # 0x14799f519
14070f5b6:     	cmpb	$0x1, (%r12)
14070f5bb:     	jne	0x14070f6cd <.text+0x70e6cd>
14070f5c1:     	testb	$0x1, 0x728ff54(%rip)   # 0x14799f51c
14070f5c8:     	je	0x14070f6cd <.text+0x70e6cd>
14070f5ce:     	movl	0x728ff50(%rip), %edx   # 0x14799f524
14070f5d4:     	movl	0x728ff46(%rip), %ecx   # 0x14799f520
14070f5da:     	movl	$0x1, %r8d
14070f5e0:     	cmpl	$0x1, (%rdi)
14070f5e3:     	jne	0x14070f6d5 <.text+0x70e6d5>
14070f5e9:     	cmpl	%ecx, 0x4(%rdi)
14070f5ec:     	jne	0x14070f6d5 <.text+0x70e6d5>
14070f5f2:     	cmpl	%edx, 0x8(%rdi)
14070f5f5:     	jne	0x14070f6d5 <.text+0x70e6d5>
14070f5fb:     	movl	0xc(%rdi), %r8d
14070f5ff:     	incl	%r8d
14070f602:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
14070f607:     	cmovnel	%r8d, %edx
14070f60b:     	movl	%edx, 0xc(%rdi)
14070f60e:     	cmpl	$0x3, %edx
14070f611:     	jb	0x14070f6f7 <.text+0x70e6f7>
14070f617:     	testq	%r14, %r14
14070f61a:     	je	0x14070f627 <.text+0x70e627>
14070f61c:     	cmpl	%ecx, (%r14)
14070f61f:     	je	0x14070f627 <.text+0x70e627>
14070f621:     	movl	%ebp, (%r15)
14070f624:     	movl	%ecx, (%r14)
14070f627:     	movb	$0x1, 0x728ff17(%rip)   # 0x14799f545
14070f62e:     	movb	$0x1, %cl
14070f630:     	cmpb	$0x0, 0x728ff0f(%rip)   # 0x14799f546
14070f637:     	jne	0x14070f700 <.text+0x70e700>
14070f63d:     	cmpl	$0x12, %edx
14070f640:     	setb	%cl
14070f643:     	testq	%rbx, %rbx
14070f646:     	sete	%dl
14070f649:     	orb	%cl, %dl
14070f64b:     	jne	0x14070f6fe <.text+0x70e6fe>
14070f651:     	cmpb	$0x1, 0x3c(%rbx)
14070f655:     	jne	0x14070f6fe <.text+0x70e6fe>
14070f65b:     	cmpb	$0x1, 0x3d(%rbx)
14070f65f:     	jne	0x14070f6fe <.text+0x70e6fe>
14070f665:     	cmpq	$0x0, 0x10(%rbx)
14070f66a:     	jne	0x14070f6fe <.text+0x70e6fe>
14070f670:     	cmpq	$0x0, 0x18(%rbx)
14070f675:     	jne	0x14070f6fe <.text+0x70e6fe>
14070f67b:     	cmpq	$0x0, 0x28(%rbx)
14070f680:     	sete	%cl
14070f683:     	jmp	0x14070f700 <.text+0x70e700>
14070f685:     	leaq	0x728fe8c(%rip), %rcx   # 0x14799f518
14070f68c:     	callq	0x145762bb1 <.text+0x5761bb1>
14070f691:     	movb	$0x1, %cl
14070f693:     	xorl	%eax, %eax
14070f695:     	lock
14070f696:     	cmpxchgb	%cl, 0x728fe7b(%rip)    # 0x14799f518
14070f69d:     	je	0x14070f597 <.text+0x70e597>
14070f6a3:     	leaq	0x728fe6e(%rip), %rcx   # 0x14799f518
14070f6aa:     	callq	0x1458e58c0 <.text+0x58e48c0>
14070f6af:     	jmp	0x14070f597 <.text+0x70e597>
14070f6b4:     	callq	0x1458e6650 <.text+0x58e5650>
14070f6b9:     	xorb	$0x1, %al
14070f6bb:     	movzbl	0x728fe57(%rip), %ecx   # 0x14799f519
14070f6c2:     	cmpb	$0x1, (%r12)
14070f6c7:     	je	0x14070f5c1 <.text+0x70e5c1>
14070f6cd:     	cmpb	$0x0, (%rdi)
14070f6d0:     	je	0x14070f6e7 <.text+0x70e6e7>
14070f6d2:     	xorl	%r8d, %r8d
14070f6d5:     	movl	%r8d, (%rdi)
14070f6d8:     	movl	%ecx, 0x4(%rdi)
14070f6db:     	movl	%edx, 0x8(%rdi)
14070f6de:     	movl	$0x0, 0xc(%rdi)
14070f6e5:     	jmp	0x14070f6f7 <.text+0x70e6f7>
14070f6e7:     	movl	0xc(%rdi), %ecx
14070f6ea:     	incl	%ecx
14070f6ec:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
14070f6f1:     	cmovnel	%ecx, %edx
14070f6f4:     	movl	%edx, 0xc(%rdi)
14070f6f7:     	movb	$0x0, 0x728fe47(%rip)   # 0x14799f545
14070f6fe:     	xorl	%ecx, %ecx
14070f700:     	movb	%cl, 0x728fe40(%rip)    # 0x14799f546
14070f706:     	testb	%al, %al
14070f708:     	jne	0x14070f715 <.text+0x70e715>
14070f70a:     	movq	(%rsi), %rax
14070f70d:     	shlq	%rax
14070f710:     	testq	%rax, %rax
14070f713:     	jne	0x14070f74a <.text+0x70e74a>
14070f715:     	xorl	%eax, %eax
14070f717:     	xchgb	%al, 0x728fdfb(%rip)    # 0x14799f518
14070f71d:     	cmpb	$0x2, %al
14070f71f:     	je	0x14070f730 <.text+0x70e730>
14070f721:     	addq	$0x20, %rsp
14070f725:     	popq	%rbx
14070f726:     	popq	%rbp
14070f727:     	popq	%rdi
14070f728:     	popq	%rsi
14070f729:     	popq	%r12
14070f72b:     	popq	%r14
14070f72d:     	popq	%r15
14070f72f:     	retq
14070f730:     	leaq	0x728fde1(%rip), %rcx   # 0x14799f518
14070f737:     	addq	$0x20, %rsp
14070f73b:     	popq	%rbx
14070f73c:     	popq	%rbp
14070f73d:     	popq	%rdi
14070f73e:     	popq	%rsi
14070f73f:     	popq	%r12
14070f741:     	popq	%r14
14070f743:     	popq	%r15
14070f745:     	jmp	0x1458e5980 <.text+0x58e4980>
14070f74a:     	callq	0x1458e6650 <.text+0x58e5650>
14070f74f:     	testb	%al, %al
14070f751:     	jne	0x14070f715 <.text+0x70e715>
14070f753:     	movb	$0x1, 0x728fdbf(%rip)   # 0x14799f519
14070f75a:     	jmp	0x14070f715 <.text+0x70e715>
