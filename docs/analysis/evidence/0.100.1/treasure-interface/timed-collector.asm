
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14553a530:     	pushq	%rbp
14553a531:     	pushq	%r15
14553a533:     	pushq	%r14
14553a535:     	pushq	%r13
14553a537:     	pushq	%r12
14553a539:     	pushq	%rsi
14553a53a:     	pushq	%rdi
14553a53b:     	pushq	%rbx
14553a53c:     	subq	$0x68, %rsp
14553a540:     	leaq	0x60(%rsp), %rbp
14553a545:     	movaps	%xmm6, -0x10(%rbp)
14553a549:     	movq	$-0x2, -0x18(%rbp)
14553a551:     	movq	%r8, %rdi
14553a554:     	movq	%rcx, %rsi
14553a557:     	nopw	(%rax,%rax)
14553a560:     	cmpq	%rdi, %rdx
14553a563:     	je	0x14553a632 <.text+0x5539632>
14553a569:     	leaq	0x40(%rdx), %r15
14553a56d:     	cmpb	$0x1a, (%rdx)
14553a570:     	movq	%r15, %rdx
14553a573:     	jne	0x14553a560 <.text+0x5539560>
14553a575:     	movq	-0x38(%r15), %rbx
14553a579:     	movq	-0x30(%r15), %r14
14553a57d:     	movss	-0x3c(%r15), %xmm6
14553a583:     	callq	0x140002200 <.text+0x1200>
14553a588:     	movl	$0x60, %ecx
14553a58d:     	movl	$0x8, %edx
14553a592:     	callq	0x1400021c0 <.text+0x11c0>
14553a597:     	testq	%rax, %rax
14553a59a:     	je	0x14553a672 <.text+0x5539672>
14553a5a0:     	movq	%rbx, (%rax)
14553a5a3:     	movq	%r14, 0x8(%rax)
14553a5a7:     	movss	%xmm6, 0x10(%rax)
14553a5ac:     	movq	$0x4, -0x30(%rbp)
14553a5b4:     	movq	%rax, -0x28(%rbp)
14553a5b8:     	movl	$0x1, %ebx
14553a5bd:     	leaq	-0x30(%rbp), %r14
14553a5c1:     	movq	%rbx, -0x20(%rbp)
14553a5c5:     	movq	%r15, %rcx
14553a5c8:     	nopl	(%rax,%rax)
14553a5d0:     	cmpq	%rdi, %rcx
14553a5d3:     	je	0x14553a64b <.text+0x553964b>
14553a5d5:     	leaq	0x40(%rcx), %r15
14553a5d9:     	cmpb	$0x1a, (%rcx)
14553a5dc:     	movq	%r15, %rcx
14553a5df:     	jne	0x14553a5d0 <.text+0x55395d0>
14553a5e1:     	movq	-0x38(%r15), %r12
14553a5e5:     	movq	-0x30(%r15), %r13
14553a5e9:     	movss	-0x3c(%r15), %xmm6
14553a5ef:     	cmpq	-0x30(%rbp), %rbx
14553a5f3:     	jne	0x14553a61a <.text+0x553961a>
14553a5f5:     	movq	$0x18, 0x20(%rsp)
14553a5fe:     	movl	$0x1, %r8d
14553a604:     	movl	$0x8, %r9d
14553a60a:     	movq	%r14, %rcx
14553a60d:     	movq	%rbx, %rdx
14553a610:     	callq	0x1457744b0 <.text+0x57734b0>
14553a615:     	nop
14553a616:     	movq	-0x28(%rbp), %rax
14553a61a:     	leaq	(%rbx,%rbx,2), %rcx
14553a61e:     	movq	%r12, (%rax,%rcx,8)
14553a622:     	movq	%r13, 0x8(%rax,%rcx,8)
14553a627:     	movss	%xmm6, 0x10(%rax,%rcx,8)
14553a62d:     	incq	%rbx
14553a630:     	jmp	0x14553a5c1 <.text+0x55395c1>
14553a632:     	movq	$0x0, (%rsi)
14553a639:     	movq	$0x8, 0x8(%rsi)
14553a641:     	movq	$0x0, 0x10(%rsi)
14553a649:     	jmp	0x14553a65a <.text+0x553965a>
14553a64b:     	movq	-0x20(%rbp), %rax
14553a64f:     	movq	%rax, 0x10(%rsi)
14553a653:     	movups	-0x30(%rbp), %xmm0
14553a657:     	movups	%xmm0, (%rsi)
14553a65a:     	movq	%rsi, %rax
14553a65d:     	movaps	-0x10(%rbp), %xmm6
14553a661:     	addq	$0x68, %rsp
14553a665:     	popq	%rbx
14553a666:     	popq	%rdi
14553a667:     	popq	%rsi
14553a668:     	popq	%r12
14553a66a:     	popq	%r13
14553a66c:     	popq	%r14
14553a66e:     	popq	%r15
14553a670:     	popq	%rbp
14553a671:     	retq
14553a672:     	movl	$0x8, %ecx
14553a677:     	movl	$0x60, %edx
14553a67c:     	callq	0x14590379b <.text+0x590279b>
14553a681:     	ud2
