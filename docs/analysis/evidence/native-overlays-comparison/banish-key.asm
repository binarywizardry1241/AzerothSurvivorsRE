
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454da3d0:     	pushq	%r15
1454da3d2:     	pushq	%r14
1454da3d4:     	pushq	%r12
1454da3d6:     	pushq	%rsi
1454da3d7:     	pushq	%rdi
1454da3d8:     	pushq	%rbx
1454da3d9:     	subq	$0x48, %rsp
1454da3dd:     	movq	0x78(%r8), %rax
1454da3e1:     	movabsq	$-0x8000000000000000, %r9 # imm = 0x8000000000000000
1454da3eb:     	xorq	%rax, %r9
1454da3ee:     	testq	%rax, %rax
1454da3f1:     	movl	$0x1, %eax
1454da3f6:     	cmovsq	%r9, %rax
1454da3fa:     	movq	%rcx, %rsi
1454da3fd:     	leaq	0x14d29f4(%rip), %rcx   # 0x1469acdf8
1454da404:     	movslq	(%rcx,%rax,4), %rax
1454da408:     	addq	%rcx, %rax
1454da40b:     	jmpq	*%rax
1454da40d:     	movq	0x88(%r8), %rdi
1454da414:     	testq	%rdi, %rdi
1454da417:     	js	0x1454da573 <.text+0x54d9573>
1454da41d:     	je	0x1454da5b5 <.text+0x54d95b5>
1454da423:     	movq	0x80(%r8), %r14
1454da42a:     	callq	0x140002200 <.text+0x1200>
1454da42f:     	movl	$0x1, %r15d
1454da435:     	movl	$0x1, %edx
1454da43a:     	movq	%rdi, %rcx
1454da43d:     	callq	0x1400021c0 <.text+0x11c0>
1454da442:     	testq	%rax, %rax
1454da445:     	je	0x1454da576 <.text+0x54d9576>
1454da44b:     	movq	%rax, %rbx
1454da44e:     	movq	%rax, %rcx
1454da451:     	movq	%r14, %rdx
1454da454:     	movq	%rdi, %r8
1454da457:     	callq	0x145756ddd <.text+0x5755ddd>
1454da45c:     	jmp	0x1454da5ba <.text+0x54d95ba>
1454da461:     	cmpq	$-0x1, 0x308(%rdx)
1454da469:     	movq	0x80(%r8), %rdi
1454da470:     	je	0x1454da49a <.text+0x54d949a>
1454da472:     	movq	0x318(%rdx), %r8
1454da479:     	cmpq	0x10(%rdi), %r8
1454da47d:     	jne	0x1454da49a <.text+0x54d949a>
1454da47f:     	movq	0x8(%rdi), %rax
1454da483:     	movq	0x310(%rdx), %rcx
1454da48a:     	movq	%rax, %rdx
1454da48d:     	callq	0x145756dd7 <.text+0x5755dd7>
1454da492:     	testl	%eax, %eax
1454da494:     	je	0x1454da565 <.text+0x54d9565>
1454da49a:     	movq	%rsi, %rcx
1454da49d:     	movq	%rdi, %rdx
1454da4a0:     	addq	$0x48, %rsp
1454da4a4:     	popq	%rbx
1454da4a5:     	popq	%rdi
1454da4a6:     	popq	%rsi
1454da4a7:     	popq	%r12
1454da4a9:     	popq	%r14
1454da4ab:     	popq	%r15
1454da4ad:     	jmp	0x14570c440 <.text+0x570b440>
1454da4b2:     	movq	0x90(%r8), %rax
1454da4b9:     	cmpq	0x2a0(%rdx), %rax
1454da4c0:     	jae	0x1454da565 <.text+0x54d9565>
1454da4c6:     	movq	0x298(%rdx), %rcx
1454da4cd:     	imulq	$0x58, %rax, %rax
1454da4d1:     	movq	(%rcx,%rax), %rax
1454da4d5:     	movups	(%rax), %xmm0
1454da4d8:     	movups	%xmm0, 0x38(%rsp)
1454da4dd:     	leaq	0x38(%rsp), %rax
1454da4e2:     	movq	%rax, 0x28(%rsp)
1454da4e7:     	leaq	-0x54d842e(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454da4ee:     	movq	%rax, 0x30(%rsp)
1454da4f3:     	leaq	0x1242ade(%rip), %rdx   # 0x14671cfd8
1454da4fa:     	leaq	0x28(%rsp), %r8
1454da4ff:     	movq	%rsi, %rcx
1454da502:     	callq	0x14570bf80 <.text+0x570af80>
1454da507:     	jmp	0x1454da5d4 <.text+0x54d95d4>
1454da50c:     	movq	0x2b8(%rdx), %rax
1454da513:     	movq	0x80(%r8), %rcx
1454da51a:     	movq	(%rcx), %rbx
1454da51d:     	movq	0x8(%rcx), %rdi
1454da521:     	testq	%rax, %rax
1454da524:     	je	0x1454da56e <.text+0x54d956e>
1454da526:     	movq	0x2b0(%rdx), %r14
1454da52d:     	shlq	$0x3, %rax
1454da531:     	leaq	(%rax,%rax,2), %r15
1454da535:     	xorl	%r12d, %r12d
1454da538:     	jmp	0x1454da549 <.text+0x54d9549>
1454da53a:     	nopw	(%rax,%rax)
1454da540:     	addq	$0x18, %r12
1454da544:     	cmpq	%r12, %r15
1454da547:     	je	0x1454da56e <.text+0x54d956e>
1454da549:     	movq	(%r14,%r12), %rax
1454da54d:     	cmpq	%rdi, 0x8(%rax)
1454da551:     	jne	0x1454da540 <.text+0x54d9540>
1454da553:     	movq	(%rax), %rcx
1454da556:     	movq	%rbx, %rdx
1454da559:     	movq	%rdi, %r8
1454da55c:     	callq	0x145756dd7 <.text+0x5755dd7>
1454da561:     	testl	%eax, %eax
1454da563:     	jne	0x1454da540 <.text+0x54d9540>
1454da565:     	movq	$-0x1, (%rsi)
1454da56c:     	jmp	0x1454da5d4 <.text+0x54d95d4>
1454da56e:     	testq	%rdi, %rdi
1454da571:     	jns	0x1454da583 <.text+0x54d9583>
1454da573:     	xorl	%r15d, %r15d
1454da576:     	movq	%r15, %rcx
1454da579:     	movq	%rdi, %rdx
1454da57c:     	callq	0x1458e721b <.text+0x58e621b>
1454da581:     	ud2
1454da583:     	je	0x1454da5c3 <.text+0x54d95c3>
1454da585:     	callq	0x140002200 <.text+0x1200>
1454da58a:     	movl	$0x1, %r15d
1454da590:     	movl	$0x1, %edx
1454da595:     	movq	%rdi, %rcx
1454da598:     	callq	0x1400021c0 <.text+0x11c0>
1454da59d:     	testq	%rax, %rax
1454da5a0:     	je	0x1454da576 <.text+0x54d9576>
1454da5a2:     	movq	%rax, %r14
1454da5a5:     	movq	%rax, %rcx
1454da5a8:     	movq	%rbx, %rdx
1454da5ab:     	movq	%rdi, %r8
1454da5ae:     	callq	0x145756ddd <.text+0x5755ddd>
1454da5b3:     	jmp	0x1454da5c9 <.text+0x54d95c9>
1454da5b5:     	movl	$0x1, %ebx
1454da5ba:     	movq	%rdi, (%rsi)
1454da5bd:     	movq	%rbx, 0x8(%rsi)
1454da5c1:     	jmp	0x1454da5d0 <.text+0x54d95d0>
1454da5c3:     	movl	$0x1, %r14d
1454da5c9:     	movq	%rdi, (%rsi)
1454da5cc:     	movq	%r14, 0x8(%rsi)
1454da5d0:     	movq	%rdi, 0x10(%rsi)
1454da5d4:     	addq	$0x48, %rsp
1454da5d8:     	popq	%rbx
1454da5d9:     	popq	%rdi
1454da5da:     	popq	%rsi
1454da5db:     	popq	%r12
1454da5dd:     	popq	%r14
1454da5df:     	popq	%r15
1454da5e1:     	retq
