
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14595f3c0:     	pushq	%rbp
14595f3c1:     	pushq	%r15
14595f3c3:     	pushq	%r14
14595f3c5:     	pushq	%r13
14595f3c7:     	pushq	%r12
14595f3c9:     	pushq	%rsi
14595f3ca:     	pushq	%rdi
14595f3cb:     	pushq	%rbx
14595f3cc:     	subq	$0xd8, %rsp
14595f3d3:     	leaq	0x80(%rsp), %rbp
14595f3db:     	movaps	%xmm6, 0x40(%rbp)
14595f3df:     	movq	$-0x2, 0x38(%rbp)
14595f3e7:     	movq	%r9, %rsi
14595f3ea:     	movapd	%xmm2, %xmm6
14595f3ee:     	movq	%rdx, %r14
14595f3f1:     	movq	0xc0(%rbp), %rax
14595f3f8:     	movq	%rax, -0x10(%rbp)
14595f3fc:     	movq	(%rdx), %rax
14595f3ff:     	movq	%rax, 0x10(%rbp)
14595f403:     	movq	0x8(%rdx), %rax
14595f407:     	movq	%rax, 0x8(%rbp)
14595f40b:     	movq	0x18(%rdx), %rax
14595f40f:     	movq	%rax, 0x28(%rbp)
14595f413:     	movq	0x20(%rdx), %rax
14595f417:     	movq	%rax, -0x8(%rbp)
14595f41b:     	movzbl	0x28(%rdx), %eax
14595f41f:     	movb	%al, 0x18(%rbp)
14595f422:     	movq	0x8(%rcx), %r12
14595f426:     	movq	%rcx, (%rbp)
14595f42a:     	movq	0x10(%rcx), %rax
14595f42e:     	movq	%rax, 0x20(%rbp)
14595f432:     	testq	%rax, %rax
14595f435:     	je	0x14595f495 <.text+0x595e495>
14595f437:     	movq	0x10(%r14), %r15
14595f43b:     	movq	0x20(%rbp), %rax
14595f43f:     	shlq	$0x4, %rax
14595f443:     	leaq	(%rax,%rax,4), %rdi
14595f447:     	xorl	%ebx, %ebx
14595f449:     	xorl	%r13d, %r13d
14595f44c:     	jmp	0x14595f45c <.text+0x595e45c>
14595f44e:     	nop
14595f450:     	incq	%rbx
14595f453:     	addq	$0x50, %r13
14595f457:     	cmpq	%r13, %rdi
14595f45a:     	je	0x14595f495 <.text+0x595e495>
14595f45c:     	cmpq	%r15, 0x28(%r12,%r13)
14595f461:     	jne	0x14595f450 <.text+0x595e450>
14595f463:     	movq	0x20(%r12,%r13), %rcx
14595f468:     	movq	0x8(%rbp), %rdx
14595f46c:     	movq	%r15, %r8
14595f46f:     	callq	0x145bc9787 <.text+0x5bc8787>
14595f474:     	testl	%eax, %eax
14595f476:     	jne	0x14595f450 <.text+0x595e450>
14595f478:     	movzbl	0x18(%rbp), %eax
14595f47c:     	cmpb	%al, 0x48(%r12,%r13)
14595f481:     	jne	0x14595f450 <.text+0x595e450>
14595f483:     	movb	$0x1, %al
14595f485:     	movl	%eax, 0x28(%rbp)
14595f488:     	movq	0x20(%rbp), %rdx
14595f48c:     	movq	(%rbp), %rdi
14595f490:     	jmp	0x14595f540 <.text+0x595e540>
14595f495:     	movq	0x10(%r14), %rax
14595f499:     	movq	%rax, -0x38(%rbp)
14595f49d:     	movups	(%r14), %xmm0
14595f4a1:     	movups	%xmm0, -0x48(%rbp)
14595f4a5:     	movq	0x28(%rbp), %rax
14595f4a9:     	movq	%rax, -0x30(%rbp)
14595f4ad:     	movq	-0x8(%rbp), %rax
14595f4b1:     	movq	%rax, -0x28(%rbp)
14595f4b5:     	movq	$0x0, -0x20(%rbp)
14595f4bd:     	movzbl	0x18(%rbp), %eax
14595f4c1:     	movb	%al, -0x18(%rbp)
14595f4c4:     	movq	$0x0, -0x60(%rbp)
14595f4cc:     	movq	$0x8, -0x58(%rbp)
14595f4d4:     	movq	$0x0, -0x50(%rbp)
14595f4dc:     	movq	(%rbp), %rdi
14595f4e0:     	movq	0x20(%rbp), %rbx
14595f4e4:     	cmpq	(%rdi), %rbx
14595f4e7:     	jne	0x14595f4f6 <.text+0x595e4f6>
14595f4e9:     	movq	%rdi, %rcx
14595f4ec:     	callq	0x145bfb510 <.text+0x5bfa510>
14595f4f1:     	nop
14595f4f2:     	movq	0x8(%rdi), %r12
14595f4f6:     	leaq	(%rbx,%rbx,4), %rax
14595f4fa:     	shlq	$0x4, %rax
14595f4fe:     	movups	-0x20(%rbp), %xmm0
14595f502:     	movups	%xmm0, 0x40(%r12,%rax)
14595f508:     	movups	-0x60(%rbp), %xmm0
14595f50c:     	movups	-0x50(%rbp), %xmm1
14595f510:     	movupd	-0x40(%rbp), %xmm2
14595f515:     	movups	-0x30(%rbp), %xmm3
14595f519:     	movups	%xmm3, 0x30(%r12,%rax)
14595f51f:     	movupd	%xmm2, 0x20(%r12,%rax)
14595f526:     	movups	%xmm1, 0x10(%r12,%rax)
14595f52c:     	movups	%xmm0, (%r12,%rax)
14595f531:     	leaq	0x1(%rbx), %rdx
14595f535:     	movq	%rdx, 0x10(%rdi)
14595f539:     	movl	$0x0, 0x28(%rbp)
14595f540:     	cmpq	%rdx, %rbx
14595f543:     	jae	0x14595f6cd <.text+0x595e6cd>
14595f549:     	movq	0x8(%rdi), %rax
14595f54d:     	leaq	(%rbx,%rbx,4), %rcx
14595f551:     	shlq	$0x4, %rcx
14595f555:     	addsd	0x40(%rax,%rcx), %xmm6
14595f55b:     	leaq	(%rax,%rcx), %rdi
14595f55f:     	movsd	%xmm6, 0x40(%rax,%rcx)
14595f565:     	movq	-0x10(%rbp), %rax
14595f569:     	leaq	(%rax,%rax,2), %rax
14595f56d:     	leaq	(%rsi,%rax,8), %rax
14595f571:     	movq	%rax, 0x20(%rbp)
14595f575:     	cmpq	0x20(%rbp), %rsi
14595f579:     	jne	0x14595f5e6 <.text+0x595e5e6>
14595f57b:     	movq	0x10(%rbp), %rdx
14595f57f:     	leaq	-0x1(%rdx), %rax
14595f583:     	cmpq	$-0x2, %rax
14595f587:     	setb	%al
14595f58a:     	testb	%al, 0x28(%rbp)
14595f58d:     	je	0x14595f6b5 <.text+0x595e6b5>
14595f593:     	movl	$0x1, %r8d
14595f599:     	movq	0x8(%rbp), %rcx
14595f59d:     	movaps	0x40(%rbp), %xmm6
14595f5a1:     	addq	$0xd8, %rsp
14595f5a8:     	popq	%rbx
14595f5a9:     	popq	%rdi
14595f5aa:     	popq	%rsi
14595f5ab:     	popq	%r12
14595f5ad:     	popq	%r13
14595f5af:     	popq	%r14
14595f5b1:     	popq	%r15
14595f5b3:     	popq	%rbp
14595f5b4:     	jmp	0x1400021d0 <.text+0x11d0>
14595f5b9:     	nopl	(%rax)
14595f5c0:     	movq	$-0x1, (%r12,%r15)
14595f5c8:     	movq	%rbx, 0x8(%r12,%r15)
14595f5cd:     	movq	%r14, 0x10(%r12,%r15)
14595f5d2:     	movsd	%xmm6, 0x18(%r12,%r15)
14595f5d9:     	incq	%r13
14595f5dc:     	movq	%r13, 0x10(%rdi)
14595f5e0:     	cmpq	0x20(%rbp), %rsi
14595f5e4:     	je	0x14595f57b <.text+0x595e57b>
14595f5e6:     	movq	(%rsi), %rbx
14595f5e9:     	movq	0x8(%rsi), %r15
14595f5ed:     	movsd	0x10(%rsi), %xmm6
14595f5f2:     	movl	0x28(%rbp), %eax
14595f5f5:     	movb	%al, 0x37(%rbp)
14595f5f8:     	movq	%rbx, %rcx
14595f5fb:     	movq	%r15, %rdx
14595f5fe:     	callq	0x1458da590 <.text+0x58d9590>
14595f603:     	nop
14595f604:     	movq	%rdx, %r14
14595f607:     	addq	$0x18, %rsi
14595f60b:     	movq	%rsi, 0x18(%rbp)
14595f60f:     	testq	%rax, %rax
14595f612:     	cmovneq	%rax, %rbx
14595f616:     	cmoveq	%r15, %r14
14595f61a:     	movq	0x8(%rdi), %r12
14595f61e:     	movq	0x10(%rdi), %r13
14595f622:     	movq	%r13, %r15
14595f625:     	shlq	$0x5, %r15
14595f629:     	testq	%r13, %r13
14595f62c:     	je	0x14595f690 <.text+0x595e690>
14595f62e:     	xorl	%esi, %esi
14595f630:     	jmp	0x14595f649 <.text+0x595e649>
14595f632:     	nopw	%cs:(%rax,%rax)
14595f640:     	addq	$0x20, %rsi
14595f644:     	cmpq	%rsi, %r15
14595f647:     	je	0x14595f690 <.text+0x595e690>
14595f649:     	cmpq	%r14, 0x10(%r12,%rsi)
14595f64e:     	jne	0x14595f640 <.text+0x595e640>
14595f650:     	movq	0x8(%r12,%rsi), %rcx
14595f655:     	movq	%rbx, %rdx
14595f658:     	movq	%r14, %r8
14595f65b:     	callq	0x145bc9787 <.text+0x5bc8787>
14595f660:     	testl	%eax, %eax
14595f662:     	jne	0x14595f640 <.text+0x595e640>
14595f664:     	addsd	0x18(%r12,%rsi), %xmm6
14595f66b:     	movsd	%xmm6, 0x18(%r12,%rsi)
14595f672:     	movq	0x18(%rbp), %rsi
14595f676:     	cmpq	0x20(%rbp), %rsi
14595f67a:     	jne	0x14595f5e6 <.text+0x595e5e6>
14595f680:     	jmp	0x14595f57b <.text+0x595e57b>
14595f685:     	nopw	%cs:(%rax,%rax)
14595f690:     	cmpq	(%rdi), %r13
14595f693:     	movq	0x18(%rbp), %rsi
14595f697:     	jne	0x14595f5c0 <.text+0x595e5c0>
14595f69d:     	movl	0x28(%rbp), %eax
14595f6a0:     	movb	%al, 0x37(%rbp)
14595f6a3:     	movq	%rdi, %rcx
14595f6a6:     	callq	0x145bcb530 <.text+0x5bca530>
14595f6ab:     	nop
14595f6ac:     	movq	0x8(%rdi), %r12
14595f6b0:     	jmp	0x14595f5c0 <.text+0x595e5c0>
14595f6b5:     	movaps	0x40(%rbp), %xmm6
14595f6b9:     	addq	$0xd8, %rsp
14595f6c0:     	popq	%rbx
14595f6c1:     	popq	%rdi
14595f6c2:     	popq	%rsi
14595f6c3:     	popq	%r12
14595f6c5:     	popq	%r13
14595f6c7:     	popq	%r14
14595f6c9:     	popq	%r15
14595f6cb:     	popq	%rbp
14595f6cc:     	retq
14595f6cd:     	movl	0x28(%rbp), %eax
14595f6d0:     	movb	%al, 0x37(%rbp)
14595f6d3:     	leaq	0x151b95e(%rip), %r8    # 0x146e7b038
14595f6da:     	movq	%rbx, %rcx
14595f6dd:     	callq	0x145d697e3 <.text+0x5d687e3>
14595f6e2:     	nop
14595f6e3:     	ud2
