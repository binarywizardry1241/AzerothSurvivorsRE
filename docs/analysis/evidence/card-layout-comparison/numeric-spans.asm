
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401c73c0:     	pushq	%rbp
1401c73c1:     	pushq	%r15
1401c73c3:     	pushq	%r14
1401c73c5:     	pushq	%r13
1401c73c7:     	pushq	%r12
1401c73c9:     	pushq	%rsi
1401c73ca:     	pushq	%rdi
1401c73cb:     	pushq	%rbx
1401c73cc:     	subq	$0x178, %rsp            # imm = 0x178
1401c73d3:     	leaq	0x80(%rsp), %rbp
1401c73db:     	movq	$-0x2, 0xf0(%rbp)
1401c73e6:     	movq	%rcx, %rsi
1401c73e9:     	movq	(%rcx), %rdi
1401c73ec:     	movq	0x28(%rcx), %rax
1401c73f0:     	movq	%rdi, -0x60(%rbp)
1401c73f4:     	movups	0x8(%rcx), %xmm0
1401c73f8:     	movups	%xmm0, -0x58(%rbp)
1401c73fc:     	movups	0x18(%rcx), %xmm0
1401c7400:     	movups	%xmm0, -0x48(%rbp)
1401c7404:     	movq	%rax, -0x38(%rbp)
1401c7408:     	movq	(%rdx), %rbx
1401c740b:     	movq	0x8(%rdx), %r15
1401c740f:     	movq	0x10(%rdx), %rax
1401c7413:     	movq	%rax, %r13
1401c7416:     	shlq	$0x5, %r13
1401c741a:     	addq	%r15, %r13
1401c741d:     	movq	%r15, 0xa8(%rbp)
1401c7424:     	movq	%r15, 0xb0(%rbp)
1401c742b:     	movq	%rbx, 0xb8(%rbp)
1401c7432:     	movq	%r13, 0xc0(%rbp)
1401c7439:     	movq	%r15, %r9
1401c743c:     	testq	%rax, %rax
1401c743f:     	je	0x1401c75c4 <.text+0x1c65c4>
1401c7445:     	movq	%rbx, 0xd0(%rbp)
1401c744c:     	movq	%rsi, 0xc8(%rbp)
1401c7453:     	movq	0x18(%rdx), %rsi
1401c7457:     	leaq	0x5c(%rbp), %r14
1401c745b:     	leaq	-0x20(%rbp), %rbx
1401c745f:     	movq	%r15, 0xd8(%rbp)
1401c7466:     	leaq	0x20(%r15), %r9
1401c746a:     	leaq	-0x30(%rbp), %r12
1401c746e:     	nop
1401c7470:     	movq	-0x20(%r9), %rax
1401c7474:     	cmpq	$-0x1, %rax
1401c7478:     	je	0x1401c75a8 <.text+0x1c65a8>
1401c747e:     	leaq	-0x20(%r9), %r15
1401c7482:     	testb	$0x1, 0x18(%r15)
1401c7487:     	movups	0x8(%r15), %xmm0
1401c748c:     	movaps	%xmm0, 0x40(%rbp)
1401c7490:     	je	0x1401c74a0 <.text+0x1c64a0>
1401c7492:     	movups	0x5bf15a7(%rip), %xmm0  # 0x145db8a40
1401c7499:     	jmp	0x1401c74a7 <.text+0x1c64a7>
1401c749b:     	nopl	(%rax,%rax)
1401c74a0:     	movups	0x5bf18ad(%rip), %xmm0  # 0x145db8d54
1401c74a7:     	movaps	%xmm0, 0x70(%rbp)
1401c74ab:     	movl	$0x3f800000, 0x80(%rbp) # imm = 0x3F800000
1401c74b5:     	cmpb	$0x1, (%rsi)
1401c74b8:     	movq	%r9, 0xe0(%rbp)
1401c74bf:     	jne	0x1401c74f0 <.text+0x1c64f0>
1401c74c1:     	leaq	0x1(%rsi), %rdx
1401c74c5:     	movl	(%rdx), %ecx
1401c74c7:     	movl	0x3(%rdx), %edx
1401c74ca:     	movl	%edx, 0xeb(%rbp)
1401c74d0:     	movl	%ecx, 0xe8(%rbp)
1401c74d6:     	movq	0x8(%rsi), %rcx
1401c74da:     	movzbl	0x10(%rsi), %r8d
1401c74df:     	movb	$0x1, %dl
1401c74e1:     	jmp	0x1401c7500 <.text+0x1c6500>
1401c74e3:     	nopw	%cs:(%rax,%rax)
1401c74f0:     	movq	0x8(%rsi), %rcx
1401c74f4:     	lock
1401c74f5:     	incq	(%rcx)
1401c74f8:     	jle	0x1401c7639 <.text+0x1c6639>
1401c74fe:     	xorl	%edx, %edx
1401c7500:     	movaps	0x40(%rbp), %xmm0
1401c7504:     	movups	%xmm0, (%rbx)
1401c7507:     	movl	0xe8(%rbp), %r9d
1401c750e:     	movl	0xeb(%rbp), %r10d
1401c7515:     	movl	%r10d, 0x2c(%rbx)
1401c7519:     	movl	%r9d, 0x29(%rbx)
1401c751d:     	movl	0x80(%rbp), %r9d
1401c7524:     	movl	%r9d, 0x10(%r14)
1401c7528:     	movaps	0x70(%rbp), %xmm0
1401c752c:     	movups	%xmm0, (%r14)
1401c7530:     	movq	%rax, -0x28(%rbp)
1401c7534:     	movq	$0x0, -0x10(%rbp)
1401c753c:     	movq	$0x4, -0x8(%rbp)
1401c7544:     	movq	$0x0, (%rbp)
1401c754c:     	movb	%dl, 0x8(%rbp)
1401c754f:     	movq	%rcx, 0x10(%rbp)
1401c7553:     	movq	%r8, 0x18(%rbp)
1401c7557:     	movl	$0x41700000, 0x20(%rbp) # imm = 0x41700000
1401c755e:     	movw	$0x190, 0x24(%rbp)      # imm = 0x190
1401c7564:     	movb	$0x1, 0x26(%rbp)
1401c7568:     	movq	0x68(%rbp), %rax
1401c756c:     	movq	%rax, 0x54(%rbx)
1401c7570:     	movups	0x5b(%rbp), %xmm0
1401c7574:     	movups	%xmm0, 0x47(%rbx)
1401c7578:     	movq	%rdi, -0x30(%rbp)
1401c757c:     	leaq	0x70(%rbp), %rcx
1401c7580:     	leaq	-0x58(%rbp), %rdx
1401c7584:     	movq	%r12, %r8
1401c7587:     	callq	0x14018ec00 <.text+0x18dc00>
1401c758c:     	nop
1401c758d:     	movq	0xe0(%rbp), %r9
1401c7594:     	addq	$0x20, %r9
1401c7598:     	addq	$0x20, %r15
1401c759c:     	cmpq	%r13, %r15
1401c759f:     	jne	0x1401c7470 <.text+0x1c6470>
1401c75a5:     	movq	%r13, %r9
1401c75a8:     	movq	%r9, 0xb0(%rbp)
1401c75af:     	movq	0xc8(%rbp), %rsi
1401c75b6:     	movq	0xd0(%rbp), %rbx
1401c75bd:     	movq	0xd8(%rbp), %r15
1401c75c4:     	subq	%r9, %r13
1401c75c7:     	je	0x1401c7608 <.text+0x1c6608>
1401c75c9:     	shrq	$0x5, %r13
1401c75cd:     	addq	$0x8, %r9
1401c75d1:     	jmp	0x1401c75e9 <.text+0x1c65e9>
1401c75d3:     	nopw	%cs:(%rax,%rax)
1401c75e0:     	addq	$0x20, %r9
1401c75e4:     	decq	%r13
1401c75e7:     	je	0x1401c7608 <.text+0x1c6608>
1401c75e9:     	movq	-0x8(%r9), %rdx
1401c75ed:     	testq	%rdx, %rdx
1401c75f0:     	je	0x1401c75e0 <.text+0x1c65e0>
1401c75f2:     	movq	(%r9), %rcx
1401c75f5:     	movl	$0x1, %r8d
1401c75fb:     	movq	%r9, %rdi
1401c75fe:     	callq	0x1400021d0 <.text+0x11d0>
1401c7603:     	movq	%rdi, %r9
1401c7606:     	jmp	0x1401c75e0 <.text+0x1c65e0>
1401c7608:     	testq	%rbx, %rbx
1401c760b:     	je	0x1401c7622 <.text+0x1c6622>
1401c760d:     	shlq	$0x5, %rbx
1401c7611:     	movl	$0x8, %r8d
1401c7617:     	movq	%r15, %rcx
1401c761a:     	movq	%rbx, %rdx
1401c761d:     	callq	0x1400021d0 <.text+0x11d0>
1401c7622:     	movq	%rsi, %rax
1401c7625:     	addq	$0x178, %rsp            # imm = 0x178
1401c762c:     	popq	%rbx
1401c762d:     	popq	%rdi
1401c762e:     	popq	%rsi
1401c762f:     	popq	%r12
1401c7631:     	popq	%r13
1401c7633:     	popq	%r14
1401c7635:     	popq	%r15
1401c7637:     	popq	%rbp
1401c7638:     	retq
1401c7639:     	ud2
