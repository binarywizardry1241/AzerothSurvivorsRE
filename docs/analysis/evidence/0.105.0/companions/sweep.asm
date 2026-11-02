
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14592f560:     	pushq	%rbp
14592f561:     	pushq	%r15
14592f563:     	pushq	%r14
14592f565:     	pushq	%r13
14592f567:     	pushq	%r12
14592f569:     	pushq	%rsi
14592f56a:     	pushq	%rdi
14592f56b:     	pushq	%rbx
14592f56c:     	subq	$0xa8, %rsp
14592f573:     	leaq	0x80(%rsp), %rbp
14592f57b:     	movaps	%xmm6, 0x10(%rbp)
14592f57f:     	movq	$-0x2, 0x8(%rbp)
14592f587:     	movq	%rdx, %rsi
14592f58a:     	movq	0x900(%rcx), %rdx
14592f591:     	cmpq	%rdx, %rsi
14592f594:     	jae	0x14592f72a <.text+0x592e72a>
14592f59a:     	movq	%rcx, %rdi
14592f59d:     	movq	0x8f8(%rcx), %rax
14592f5a4:     	imulq	$0x70, %rsi, %r14
14592f5a8:     	movzbl	0x30(%rax,%r14), %eax
14592f5ae:     	movss	0x490(%rcx), %xmm0
14592f5b6:     	mulss	0x444786(%rip), %xmm0   # 0x145d73d44
14592f5be:     	movb	%al, 0x7(%rbp)
14592f5c1:     	maxss	0x46b903(%rip), %xmm0   # 0x145d9aecc
14592f5c9:     	movss	%xmm0, -0xc(%rbp)
14592f5ce:     	movq	0x5c0(%rcx), %rax
14592f5d5:     	movq	0x5c8(%rcx), %rcx
14592f5dc:     	leaq	(%rcx,%rcx,8), %rcx
14592f5e0:     	leaq	(%rax,%rcx,8), %rcx
14592f5e4:     	movq	%rax, -0x60(%rbp)
14592f5e8:     	movq	%rcx, -0x58(%rbp)
14592f5ec:     	leaq	0x7(%rbp), %rax
14592f5f0:     	movq	%rax, -0x50(%rbp)
14592f5f4:     	movq	%rax, -0x48(%rbp)
14592f5f8:     	movq	%r8, -0x40(%rbp)
14592f5fc:     	leaq	-0xc(%rbp), %rax
14592f600:     	movq	%rax, -0x38(%rbp)
14592f604:     	leaq	-0x30(%rbp), %rcx
14592f608:     	leaq	-0x60(%rbp), %rdx
14592f60c:     	callq	0x1459a3e50 <.text+0x59a2e50>
14592f611:     	movq	-0x30(%rbp), %rax
14592f615:     	movq	%rax, -0x8(%rbp)
14592f619:     	movq	-0x28(%rbp), %r12
14592f61d:     	movq	-0x20(%rbp), %rax
14592f621:     	leaq	(%r12,%rax,8), %r15
14592f625:     	movq	%r12, -0x18(%rbp)
14592f629:     	jmp	0x14592f640 <.text+0x592e640>
14592f62b:     	nopl	(%rax,%rax)
14592f630:     	movq	0x8(%rbx), %rax
14592f634:     	movlps	%xmm6, (%rax,%r13,8)
14592f639:     	incq	%r13
14592f63c:     	movq	%r13, 0x10(%rbx)
14592f640:     	cmpq	%r15, %r12
14592f643:     	je	0x14592f6e4 <.text+0x592e6e4>
14592f649:     	movq	%r12, %rax
14592f64c:     	addq	$0x8, %r12
14592f650:     	movq	0x5c8(%rdi), %rdx
14592f657:     	testq	%rdx, %rdx
14592f65a:     	je	0x14592f640 <.text+0x592e640>
14592f65c:     	movq	(%rax), %rcx
14592f65f:     	movq	0x5c0(%rdi), %rax
14592f666:     	shlq	$0x3, %rdx
14592f66a:     	leaq	(%rdx,%rdx,8), %r8
14592f66e:     	xorl	%r9d, %r9d
14592f671:     	xorl	%edx, %edx
14592f673:     	nopw	%cs:(%rax,%rax)
14592f680:     	cmpq	%rcx, 0x28(%rax,%r9)
14592f685:     	je	0x14592f6a0 <.text+0x592e6a0>
14592f687:     	incq	%rdx
14592f68a:     	addq	$0x48, %r9
14592f68e:     	cmpq	%r9, %r8
14592f691:     	jne	0x14592f680 <.text+0x592e680>
14592f693:     	jmp	0x14592f640 <.text+0x592e640>
14592f695:     	nopw	%cs:(%rax,%rax)
14592f6a0:     	movsd	0x20(%rax,%r9), %xmm6
14592f6a7:     	movq	%rdi, %rcx
14592f6aa:     	callq	0x145942890 <.text+0x5941890>
14592f6af:     	nop
14592f6b0:     	movq	0x900(%rdi), %rdx
14592f6b7:     	cmpq	%rdx, %rsi
14592f6ba:     	jae	0x14592f718 <.text+0x592e718>
14592f6bc:     	movq	0x8f8(%rdi), %rax
14592f6c3:     	leaq	(%rax,%r14), %rbx
14592f6c7:     	movq	0x10(%rax,%r14), %r13
14592f6cc:     	cmpq	(%rax,%r14), %r13
14592f6d0:     	jne	0x14592f630 <.text+0x592e630>
14592f6d6:     	movq	%rbx, %rcx
14592f6d9:     	callq	0x145bfb120 <.text+0x5bfa120>
14592f6de:     	nop
14592f6df:     	jmp	0x14592f630 <.text+0x592e630>
14592f6e4:     	movq	-0x8(%rbp), %rdx
14592f6e8:     	testq	%rdx, %rdx
14592f6eb:     	je	0x14592f700 <.text+0x592e700>
14592f6ed:     	shlq	$0x3, %rdx
14592f6f1:     	movl	$0x8, %r8d
14592f6f7:     	movq	-0x18(%rbp), %rcx
14592f6fb:     	callq	0x1400021d0 <.text+0x11d0>
14592f700:     	movaps	0x10(%rbp), %xmm6
14592f704:     	addq	$0xa8, %rsp
14592f70b:     	popq	%rbx
14592f70c:     	popq	%rdi
14592f70d:     	popq	%rsi
14592f70e:     	popq	%r12
14592f710:     	popq	%r13
14592f712:     	popq	%r14
14592f714:     	popq	%r15
14592f716:     	popq	%rbp
14592f717:     	retq
14592f718:     	leaq	0x154a1b9(%rip), %r8    # 0x146e798d8
14592f71f:     	movq	%rsi, %rcx
14592f722:     	callq	0x145d697e3 <.text+0x5d687e3>
14592f727:     	nop
14592f728:     	ud2
14592f72a:     	leaq	0x154a1ef(%rip), %r8    # 0x146e79920
14592f731:     	movq	%rsi, %rcx
14592f734:     	callq	0x145d697e3 <.text+0x5d687e3>
14592f739:     	ud2
