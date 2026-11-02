
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14599e640:     	pushq	%rbp
14599e641:     	pushq	%r15
14599e643:     	pushq	%r14
14599e645:     	pushq	%r13
14599e647:     	pushq	%r12
14599e649:     	pushq	%rsi
14599e64a:     	pushq	%rdi
14599e64b:     	pushq	%rbx
14599e64c:     	subq	$0x68, %rsp
14599e650:     	leaq	0x60(%rsp), %rbp
14599e655:     	movaps	%xmm6, -0x10(%rbp)
14599e659:     	movq	$-0x2, -0x18(%rbp)
14599e661:     	movq	%r8, %rdi
14599e664:     	movq	%rcx, %rsi
14599e667:     	nopw	(%rax,%rax)
14599e670:     	cmpq	%rdi, %rdx
14599e673:     	je	0x14599e742 <.text+0x599d742>
14599e679:     	leaq	0x40(%rdx), %r15
14599e67d:     	cmpb	$0x1a, (%rdx)
14599e680:     	movq	%r15, %rdx
14599e683:     	jne	0x14599e670 <.text+0x599d670>
14599e685:     	movq	-0x38(%r15), %rbx
14599e689:     	movq	-0x30(%r15), %r14
14599e68d:     	movss	-0x3c(%r15), %xmm6
14599e693:     	callq	0x140002200 <.text+0x1200>
14599e698:     	movl	$0x60, %ecx
14599e69d:     	movl	$0x8, %edx
14599e6a2:     	callq	0x1400021c0 <.text+0x11c0>
14599e6a7:     	testq	%rax, %rax
14599e6aa:     	je	0x14599e782 <.text+0x599d782>
14599e6b0:     	movq	%rbx, (%rax)
14599e6b3:     	movq	%r14, 0x8(%rax)
14599e6b7:     	movss	%xmm6, 0x10(%rax)
14599e6bc:     	movq	$0x4, -0x30(%rbp)
14599e6c4:     	movq	%rax, -0x28(%rbp)
14599e6c8:     	movl	$0x1, %ebx
14599e6cd:     	leaq	-0x30(%rbp), %r14
14599e6d1:     	movq	%rbx, -0x20(%rbp)
14599e6d5:     	movq	%r15, %rcx
14599e6d8:     	nopl	(%rax,%rax)
14599e6e0:     	cmpq	%rdi, %rcx
14599e6e3:     	je	0x14599e75b <.text+0x599d75b>
14599e6e5:     	leaq	0x40(%rcx), %r15
14599e6e9:     	cmpb	$0x1a, (%rcx)
14599e6ec:     	movq	%r15, %rcx
14599e6ef:     	jne	0x14599e6e0 <.text+0x599d6e0>
14599e6f1:     	movq	-0x38(%r15), %r12
14599e6f5:     	movq	-0x30(%r15), %r13
14599e6f9:     	movss	-0x3c(%r15), %xmm6
14599e6ff:     	cmpq	-0x30(%rbp), %rbx
14599e703:     	jne	0x14599e72a <.text+0x599d72a>
14599e705:     	movq	$0x18, 0x20(%rsp)
14599e70e:     	movl	$0x1, %r8d
14599e714:     	movl	$0x8, %r9d
14599e71a:     	movq	%r14, %rcx
14599e71d:     	movq	%rbx, %rdx
14599e720:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
14599e725:     	nop
14599e726:     	movq	-0x28(%rbp), %rax
14599e72a:     	leaq	(%rbx,%rbx,2), %rcx
14599e72e:     	movq	%r12, (%rax,%rcx,8)
14599e732:     	movq	%r13, 0x8(%rax,%rcx,8)
14599e737:     	movss	%xmm6, 0x10(%rax,%rcx,8)
14599e73d:     	incq	%rbx
14599e740:     	jmp	0x14599e6d1 <.text+0x599d6d1>
14599e742:     	movq	$0x0, (%rsi)
14599e749:     	movq	$0x8, 0x8(%rsi)
14599e751:     	movq	$0x0, 0x10(%rsi)
14599e759:     	jmp	0x14599e76a <.text+0x599d76a>
14599e75b:     	movq	-0x20(%rbp), %rax
14599e75f:     	movq	%rax, 0x10(%rsi)
14599e763:     	movups	-0x30(%rbp), %xmm0
14599e767:     	movups	%xmm0, (%rsi)
14599e76a:     	movq	%rsi, %rax
14599e76d:     	movaps	-0x10(%rbp), %xmm6
14599e771:     	addq	$0x68, %rsp
14599e775:     	popq	%rbx
14599e776:     	popq	%rdi
14599e777:     	popq	%rsi
14599e778:     	popq	%r12
14599e77a:     	popq	%r13
14599e77c:     	popq	%r14
14599e77e:     	popq	%r15
14599e780:     	popq	%rbp
14599e781:     	retq
14599e782:     	movl	$0x8, %ecx
14599e787:     	movl	$0x60, %edx
14599e78c:     	callq	0x145d6944b <.text+0x5d6844b>
14599e791:     	ud2
