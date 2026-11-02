
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14545b540:     	pushq	%rbp
14545b541:     	pushq	%r14
14545b543:     	pushq	%rsi
14545b544:     	pushq	%rdi
14545b545:     	pushq	%rbx
14545b546:     	subq	$0x80, %rsp
14545b54d:     	leaq	0x80(%rsp), %rbp
14545b555:     	movq	$-0x2, -0x8(%rbp)
14545b55d:     	movq	%r9, %rdi
14545b560:     	movq	%r8, %rbx
14545b563:     	movq	%rdx, %r14
14545b566:     	movq	%rcx, %rsi
14545b569:     	callq	0x140002200 <.text+0x1200>
14545b56e:     	movl	$0x20, %ecx
14545b573:     	movl	$0x1, %edx
14545b578:     	callq	0x1400021c0 <.text+0x11c0>
14545b57d:     	testq	%rax, %rax
14545b580:     	je	0x14545b7cc <.text+0x545a7cc>
14545b586:     	movw	$0xdd, -0x18(%rbp)
14545b58c:     	movq	$0x20, -0x30(%rbp)
14545b594:     	movq	%rax, -0x28(%rbp)
14545b598:     	movq	$0x0, -0x20(%rbp)
14545b5a0:     	leaq	-0x30(%rbp), %rdx
14545b5a4:     	movq	%r14, %rcx
14545b5a7:     	callq	0x14551c6a0 <.text+0x551b6a0>
14545b5ac:     	nop
14545b5ad:     	movups	-0x30(%rbp), %xmm0
14545b5b1:     	movups	-0x20(%rbp), %xmm1
14545b5b5:     	movaps	%xmm1, -0x40(%rbp)
14545b5b9:     	movaps	%xmm0, -0x50(%rbp)
14545b5bd:     	leaq	-0x30(%rbp), %rcx
14545b5c1:     	leaq	-0x50(%rbp), %rdx
14545b5c5:     	movq	%rbx, %r8
14545b5c8:     	callq	0x14550db10 <.text+0x550cb10>
14545b5cd:     	movq	-0x30(%rbp), %rax
14545b5d1:     	movq	-0x20(%rbp), %rdx
14545b5d5:     	subq	%rdx, %rax
14545b5d8:     	cmpq	$0x3, %rax
14545b5dc:     	jbe	0x14545b72c <.text+0x545a72c>
14545b5e2:     	movl	0x50(%rbp), %eax
14545b5e5:     	movq	-0x28(%rbp), %rcx
14545b5e9:     	movl	%eax, (%rcx,%rdx)
14545b5ec:     	addq	$0x4, %rdx
14545b5f0:     	movq	%rdx, -0x20(%rbp)
14545b5f4:     	movups	-0x30(%rbp), %xmm0
14545b5f8:     	movaps	%xmm0, -0x50(%rbp)
14545b5fc:     	movq	-0x20(%rbp), %rax
14545b600:     	movq	%rax, -0x40(%rbp)
14545b604:     	movq	-0x18(%rbp), %rax
14545b608:     	movq	%rax, -0x38(%rbp)
14545b60c:     	movq	-0x40(%rbp), %rbx
14545b610:     	cmpq	-0x50(%rbp), %rbx
14545b614:     	jne	0x14545b620 <.text+0x545a620>
14545b616:     	leaq	-0x50(%rbp), %rcx
14545b61a:     	callq	0x145903690 <.text+0x5902690>
14545b61f:     	nop
14545b620:     	movq	-0x48(%rbp), %rax
14545b624:     	movb	$0x0, (%rax,%rbx)
14545b628:     	incq	%rbx
14545b62b:     	movq	%rbx, -0x40(%rbp)
14545b62f:     	movaps	-0x50(%rbp), %xmm0
14545b633:     	movaps	%xmm0, -0x30(%rbp)
14545b637:     	movq	-0x40(%rbp), %rax
14545b63b:     	movq	%rax, -0x20(%rbp)
14545b63f:     	movq	-0x38(%rbp), %rax
14545b643:     	movq	%rax, -0x18(%rbp)
14545b647:     	movq	-0x20(%rbp), %rdx
14545b64b:     	movq	-0x30(%rbp), %rax
14545b64f:     	subq	%rdx, %rax
14545b652:     	cmpq	$0x3, %rax
14545b656:     	jbe	0x14545b754 <.text+0x545a754>
14545b65c:     	movl	0x58(%rbp), %ebx
14545b65f:     	movq	-0x28(%rbp), %rax
14545b663:     	movl	$0x100, (%rax,%rdx)     # imm = 0x100
14545b66a:     	addq	$0x4, %rdx
14545b66e:     	movq	%rdx, -0x20(%rbp)
14545b672:     	movaps	-0x30(%rbp), %xmm0
14545b676:     	movaps	%xmm0, -0x50(%rbp)
14545b67a:     	movq	-0x20(%rbp), %rax
14545b67e:     	movq	%rax, -0x40(%rbp)
14545b682:     	movq	-0x18(%rbp), %rax
14545b686:     	movq	%rax, -0x38(%rbp)
14545b68a:     	cmpl	$0x1, %ebx
14545b68d:     	adcl	$0x0, %ebx
14545b690:     	movq	-0x40(%rbp), %rdx
14545b694:     	movq	-0x50(%rbp), %rax
14545b698:     	subq	%rdx, %rax
14545b69b:     	cmpq	$0x3, %rax
14545b69f:     	jbe	0x14545b77c <.text+0x545a77c>
14545b6a5:     	movq	-0x48(%rbp), %rax
14545b6a9:     	movl	%ebx, (%rax,%rdx)
14545b6ac:     	addq	$0x4, %rdx
14545b6b0:     	movq	%rdx, -0x40(%rbp)
14545b6b4:     	movaps	-0x50(%rbp), %xmm0
14545b6b8:     	movaps	%xmm0, -0x30(%rbp)
14545b6bc:     	movq	-0x40(%rbp), %rax
14545b6c0:     	movq	%rax, -0x20(%rbp)
14545b6c4:     	movq	-0x38(%rbp), %rax
14545b6c8:     	movq	%rax, -0x18(%rbp)
14545b6cc:     	movq	-0x20(%rbp), %rdx
14545b6d0:     	movq	-0x30(%rbp), %rax
14545b6d4:     	subq	%rdx, %rax
14545b6d7:     	cmpq	$0x3, %rax
14545b6db:     	jbe	0x14545b7a4 <.text+0x545a7a4>
14545b6e1:     	movq	-0x28(%rbp), %rax
14545b6e5:     	movl	$0x1, (%rax,%rdx)
14545b6ec:     	addq	$0x4, %rdx
14545b6f0:     	movq	%rdx, -0x20(%rbp)
14545b6f4:     	movaps	-0x30(%rbp), %xmm0
14545b6f8:     	movaps	%xmm0, -0x50(%rbp)
14545b6fc:     	movq	-0x20(%rbp), %rax
14545b700:     	movq	%rax, -0x40(%rbp)
14545b704:     	movq	-0x18(%rbp), %rax
14545b708:     	movq	%rax, -0x38(%rbp)
14545b70c:     	leaq	-0x50(%rbp), %rdx
14545b710:     	movq	%rsi, %rcx
14545b713:     	movq	%rdi, %r8
14545b716:     	callq	0x14550db10 <.text+0x550cb10>
14545b71b:     	movq	%rsi, %rax
14545b71e:     	addq	$0x80, %rsp
14545b725:     	popq	%rbx
14545b726:     	popq	%rdi
14545b727:     	popq	%rsi
14545b728:     	popq	%r14
14545b72a:     	popq	%rbp
14545b72b:     	retq
14545b72c:     	movq	$0x1, 0x20(%rsp)
14545b735:     	leaq	-0x30(%rbp), %rcx
14545b739:     	movl	$0x4, %r8d
14545b73f:     	movl	$0x1, %r9d
14545b745:     	callq	0x1457744b0 <.text+0x57734b0>
14545b74a:     	nop
14545b74b:     	movq	-0x20(%rbp), %rdx
14545b74f:     	jmp	0x14545b5e2 <.text+0x545a5e2>
14545b754:     	movq	$0x1, 0x20(%rsp)
14545b75d:     	leaq	-0x30(%rbp), %rcx
14545b761:     	movl	$0x4, %r8d
14545b767:     	movl	$0x1, %r9d
14545b76d:     	callq	0x1457744b0 <.text+0x57734b0>
14545b772:     	nop
14545b773:     	movq	-0x20(%rbp), %rdx
14545b777:     	jmp	0x14545b65c <.text+0x545a65c>
14545b77c:     	movq	$0x1, 0x20(%rsp)
14545b785:     	leaq	-0x50(%rbp), %rcx
14545b789:     	movl	$0x4, %r8d
14545b78f:     	movl	$0x1, %r9d
14545b795:     	callq	0x1457744b0 <.text+0x57734b0>
14545b79a:     	nop
14545b79b:     	movq	-0x40(%rbp), %rdx
14545b79f:     	jmp	0x14545b6a5 <.text+0x545a6a5>
14545b7a4:     	movq	$0x1, 0x20(%rsp)
14545b7ad:     	leaq	-0x30(%rbp), %rcx
14545b7b1:     	movl	$0x4, %r8d
14545b7b7:     	movl	$0x1, %r9d
14545b7bd:     	callq	0x1457744b0 <.text+0x57734b0>
14545b7c2:     	nop
14545b7c3:     	movq	-0x20(%rbp), %rdx
14545b7c7:     	jmp	0x14545b6e1 <.text+0x545a6e1>
14545b7cc:     	movl	$0x1, %ecx
14545b7d1:     	movl	$0x20, %edx
14545b7d6:     	callq	0x14590379b <.text+0x590279b>
14545b7db:     	ud2
