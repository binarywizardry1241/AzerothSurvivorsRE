Disassembly of section .text:

0000000140001000 <.text>:
14000f4c0:     	pushq	%rbp
14000f4c1:     	pushq	%r15
14000f4c3:     	pushq	%r14
14000f4c5:     	pushq	%rsi
14000f4c6:     	pushq	%rdi
14000f4c7:     	pushq	%rbx
14000f4c8:     	subq	$0xa8, %rsp
14000f4cf:     	leaq	0x80(%rsp), %rbp
14000f4d7:     	movq	$-0x2, 0x20(%rbp)
14000f4df:     	movq	%rdx, %rdi
14000f4e2:     	movq	%rcx, %rsi
14000f4e5:     	cmpq	$-0x1, (%rdx)
14000f4e9:     	je	0x14000f50d <.text+0xe50d>
14000f4eb:     	movq	0x8(%rdi), %r14
14000f4ef:     	movq	0x10(%rdi), %rbx
14000f4f3:     	cmpq	$-0x1, 0x18(%rdi)
14000f4f8:     	jne	0x14000f51b <.text+0xe51b>
14000f4fa:     	movq	%r14, %rcx
14000f4fd:     	movq	%rbx, %rdx
14000f500:     	callq	0x1458ab720 <.text+0x58aa720>
14000f505:     	movq	%rdx, %r8
14000f508:     	jmp	0x14000f607 <.text+0xe607>
14000f50d:     	cmpq	$-0x1, 0x18(%rdi)
14000f512:     	je	0x14000f5ff <.text+0xe5ff>
14000f518:     	xorl	%r14d, %r14d
14000f51b:     	movq	0x20(%rdi), %rdx
14000f51f:     	xorl	%eax, %eax
14000f521:     	cmpq	$-0x1, 0x30(%rdi)
14000f526:     	movq	0x28(%rdi), %r8
14000f52a:     	cmovneq	0x40(%rdi), %rax
14000f52f:     	movl	$0x1, %r15d
14000f535:     	movq	0x38(%rdi), %r9
14000f539:     	cmoveq	%r15, %r9
14000f53d:     	movq	%rax, 0x20(%rsp)
14000f542:     	leaq	-0x20(%rbp), %rcx
14000f546:     	callq	0x1458aa470 <.text+0x58a9470>
14000f54b:     	cmpq	$-0x1, 0x48(%rdi)
14000f550:     	je	0x14000f593 <.text+0xe593>
14000f552:     	movq	0x50(%rdi), %rdx
14000f556:     	movq	0x58(%rdi), %r8
14000f55a:     	leaq	-0x38(%rbp), %rcx
14000f55e:     	callq	0x1458b8970 <.text+0x58b7970>
14000f563:     	nop
14000f564:     	cmpq	$-0x1, -0x38(%rbp)
14000f569:     	je	0x14000f593 <.text+0xe593>
14000f56b:     	movq	-0x20(%rbp), %rdx
14000f56f:     	testq	%rdx, %rdx
14000f572:     	je	0x14000f583 <.text+0xe583>
14000f574:     	movq	-0x18(%rbp), %rcx
14000f578:     	movl	$0x1, %r8d
14000f57e:     	callq	0x1400021d0 <.text+0x11d0>
14000f583:     	movq	-0x28(%rbp), %rax
14000f587:     	movq	%rax, -0x10(%rbp)
14000f58b:     	movups	-0x38(%rbp), %xmm0
14000f58f:     	movaps	%xmm0, -0x20(%rbp)
14000f593:     	movzbl	0x60(%rdi), %eax
14000f597:     	movb	%al, 0x12(%rbp)
14000f59a:     	testq	%r14, %r14
14000f59d:     	cmovneq	%r14, %r15
14000f5a1:     	cmoveq	%r14, %rbx
14000f5a5:     	movq	%r15, %rcx
14000f5a8:     	movq	%rbx, %rdx
14000f5ab:     	callq	0x1458ab720 <.text+0x58aa720>
14000f5b0:     	nop
14000f5b1:     	movq	%rdx, %r8
14000f5b4:     	movq	-0x18(%rbp), %r9
14000f5b8:     	movq	-0x10(%rbp), %rcx
14000f5bc:     	movq	%rcx, 0x20(%rsp)
14000f5c1:     	leaq	-0x50(%rbp), %rcx
14000f5c5:     	movq	%rax, %rdx
14000f5c8:     	callq	0x145889110 <.text+0x5888110>
14000f5cd:     	nop
14000f5ce:     	movq	0x10(%rbp), %rax
14000f5d2:     	movq	%rax, 0x48(%rsi)
14000f5d6:     	movaps	-0x20(%rbp), %xmm0
14000f5da:     	movaps	-0x10(%rbp), %xmm1
14000f5de:     	movaps	(%rbp), %xmm2
14000f5e2:     	movups	%xmm2, 0x38(%rsi)
14000f5e6:     	movups	%xmm1, 0x28(%rsi)
14000f5ea:     	movups	%xmm0, 0x18(%rsi)
14000f5ee:     	movups	-0x50(%rbp), %xmm0
14000f5f2:     	movups	%xmm0, (%rsi)
14000f5f5:     	movq	-0x40(%rbp), %rax
14000f5f9:     	movq	%rax, 0x10(%rsi)
14000f5fd:     	jmp	0x14000f623 <.text+0xe623>
14000f5ff:     	cmpb	$0x0, 0x61(%rdi)
14000f603:     	je	0x14000f636 <.text+0xe636>
14000f605:     	xorl	%eax, %eax
14000f607:     	movq	%rsi, %rcx
14000f60a:     	movq	%rax, %rdx
14000f60d:     	xorl	%r9d, %r9d
14000f610:     	callq	0x145889110 <.text+0x5888110>
14000f615:     	movabsq	$-0x7fffffffffffffff, %rax # imm = 0x8000000000000001
14000f61f:     	movq	%rax, 0x18(%rsi)
14000f623:     	movq	%rsi, %rax
14000f626:     	addq	$0xa8, %rsp
14000f62d:     	popq	%rbx
14000f62e:     	popq	%rdi
14000f62f:     	popq	%rsi
14000f630:     	popq	%r14
14000f632:     	popq	%r15
14000f634:     	popq	%rbp
14000f635:     	retq
14000f636:     	movl	$0x1, %ecx
14000f63b:     	xorl	%edx, %edx
14000f63d:     	callq	0x1458ab720 <.text+0x58aa720>
14000f642:     	movq	%rdx, %r8
14000f645:     	movq	%rsi, %rcx
14000f648:     	movq	%rax, %rdx
14000f64b:     	xorl	%r9d, %r9d
14000f64e:     	callq	0x145889110 <.text+0x5888110>
14000f653:     	movabsq	$-0x8000000000000000, %rax # imm = 0x8000000000000000
14000f65d:     	jmp	0x14000f61f <.text+0xe61f>
