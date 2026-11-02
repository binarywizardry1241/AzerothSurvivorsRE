
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145467450:     	pushq	%rbp
145467451:     	pushq	%r14
145467453:     	pushq	%rsi
145467454:     	pushq	%rdi
145467455:     	pushq	%rbx
145467456:     	subq	$0x80, %rsp
14546745d:     	leaq	0x80(%rsp), %rbp
145467465:     	movq	$-0x2, -0x8(%rbp)
14546746d:     	movq	%r9, %rdi
145467470:     	movl	%r8d, %ebx
145467473:     	movq	%rdx, %r14
145467476:     	movq	%rcx, %rsi
145467479:     	callq	0x140002200 <.text+0x1200>
14546747e:     	movl	$0x20, %ecx
145467483:     	movl	$0x1, %edx
145467488:     	callq	0x1400021c0 <.text+0x11c0>
14546748d:     	testq	%rax, %rax
145467490:     	je	0x1454676f4 <.text+0x54666f4>
145467496:     	movw	$0xc7, -0x18(%rbp)
14546749c:     	movq	$0x20, -0x30(%rbp)
1454674a4:     	movq	%rax, -0x28(%rbp)
1454674a8:     	movq	$0x0, -0x20(%rbp)
1454674b0:     	leaq	-0x30(%rbp), %rdx
1454674b4:     	movq	%r14, %rcx
1454674b7:     	callq	0x14551c6a0 <.text+0x551b6a0>
1454674bc:     	nop
1454674bd:     	movups	-0x30(%rbp), %xmm0
1454674c1:     	movups	-0x20(%rbp), %xmm1
1454674c5:     	movaps	%xmm1, -0x40(%rbp)
1454674c9:     	movaps	%xmm0, -0x50(%rbp)
1454674cd:     	movq	-0x40(%rbp), %rdx
1454674d1:     	movq	-0x50(%rbp), %rax
1454674d5:     	subq	%rdx, %rax
1454674d8:     	cmpq	$0x3, %rax
1454674dc:     	jbe	0x14546762c <.text+0x546662c>
1454674e2:     	movq	-0x48(%rbp), %rax
1454674e6:     	movl	%ebx, (%rax,%rdx)
1454674e9:     	addq	$0x4, %rdx
1454674ed:     	movq	%rdx, -0x40(%rbp)
1454674f1:     	movaps	-0x50(%rbp), %xmm0
1454674f5:     	movaps	%xmm0, -0x30(%rbp)
1454674f9:     	movq	-0x40(%rbp), %rax
1454674fd:     	movq	%rax, -0x20(%rbp)
145467501:     	movq	-0x38(%rbp), %rax
145467505:     	movq	%rax, -0x18(%rbp)
145467509:     	movq	-0x20(%rbp), %rdx
14546750d:     	movq	-0x30(%rbp), %rax
145467511:     	subq	%rdx, %rax
145467514:     	cmpq	$0x3, %rax
145467518:     	jbe	0x145467654 <.text+0x5466654>
14546751e:     	movq	-0x28(%rbp), %rax
145467522:     	movl	$0x0, (%rax,%rdx)
145467529:     	addq	$0x4, %rdx
14546752d:     	movq	%rdx, -0x20(%rbp)
145467531:     	movaps	-0x30(%rbp), %xmm0
145467535:     	movaps	%xmm0, -0x50(%rbp)
145467539:     	movq	-0x20(%rbp), %rax
14546753d:     	movq	%rax, -0x40(%rbp)
145467541:     	movq	-0x18(%rbp), %rax
145467545:     	movq	%rax, -0x38(%rbp)
145467549:     	movq	-0x40(%rbp), %rdx
14546754d:     	movq	-0x50(%rbp), %rax
145467551:     	subq	%rdx, %rax
145467554:     	cmpq	$0x3, %rax
145467558:     	jbe	0x14546767c <.text+0x546667c>
14546755e:     	movq	-0x48(%rbp), %rax
145467562:     	movl	$0x0, (%rax,%rdx)
145467569:     	addq	$0x4, %rdx
14546756d:     	movq	%rdx, -0x40(%rbp)
145467571:     	movaps	-0x50(%rbp), %xmm0
145467575:     	movaps	%xmm0, -0x30(%rbp)
145467579:     	movq	-0x40(%rbp), %rax
14546757d:     	movq	%rax, -0x20(%rbp)
145467581:     	movq	-0x38(%rbp), %rax
145467585:     	movq	%rax, -0x18(%rbp)
145467589:     	leaq	-0x50(%rbp), %rcx
14546758d:     	leaq	-0x30(%rbp), %rdx
145467591:     	movq	%rdi, %r8
145467594:     	callq	0x14550db10 <.text+0x550cb10>
145467599:     	movq	-0x50(%rbp), %rax
14546759d:     	movq	-0x40(%rbp), %rdx
1454675a1:     	subq	%rdx, %rax
1454675a4:     	cmpq	$0x3, %rax
1454675a8:     	jbe	0x1454676a4 <.text+0x54666a4>
1454675ae:     	movss	0x50(%rbp), %xmm0
1454675b3:     	movq	-0x48(%rbp), %rax
1454675b7:     	movss	%xmm0, (%rax,%rdx)
1454675bc:     	addq	$0x4, %rdx
1454675c0:     	movq	%rdx, -0x40(%rbp)
1454675c4:     	movups	-0x50(%rbp), %xmm0
1454675c8:     	movaps	%xmm0, -0x30(%rbp)
1454675cc:     	movq	-0x40(%rbp), %rax
1454675d0:     	movq	%rax, -0x20(%rbp)
1454675d4:     	movq	-0x38(%rbp), %rax
1454675d8:     	movq	%rax, -0x18(%rbp)
1454675dc:     	movq	-0x20(%rbp), %rdx
1454675e0:     	movq	-0x30(%rbp), %rax
1454675e4:     	subq	%rdx, %rax
1454675e7:     	cmpq	$0x3, %rax
1454675eb:     	jbe	0x1454676cc <.text+0x54666cc>
1454675f1:     	movq	-0x28(%rbp), %rax
1454675f5:     	movl	$0x0, (%rax,%rdx)
1454675fc:     	addq	$0x4, %rdx
145467600:     	movq	%rdx, -0x20(%rbp)
145467604:     	movaps	-0x30(%rbp), %xmm0
145467608:     	movups	%xmm0, (%rsi)
14546760b:     	movq	-0x20(%rbp), %rax
14546760f:     	movq	%rax, 0x10(%rsi)
145467613:     	movq	-0x18(%rbp), %rax
145467617:     	movq	%rax, 0x18(%rsi)
14546761b:     	movq	%rsi, %rax
14546761e:     	addq	$0x80, %rsp
145467625:     	popq	%rbx
145467626:     	popq	%rdi
145467627:     	popq	%rsi
145467628:     	popq	%r14
14546762a:     	popq	%rbp
14546762b:     	retq
14546762c:     	movq	$0x1, 0x20(%rsp)
145467635:     	leaq	-0x50(%rbp), %rcx
145467639:     	movl	$0x4, %r8d
14546763f:     	movl	$0x1, %r9d
145467645:     	callq	0x1457744b0 <.text+0x57734b0>
14546764a:     	nop
14546764b:     	movq	-0x40(%rbp), %rdx
14546764f:     	jmp	0x1454674e2 <.text+0x54664e2>
145467654:     	movq	$0x1, 0x20(%rsp)
14546765d:     	leaq	-0x30(%rbp), %rcx
145467661:     	movl	$0x4, %r8d
145467667:     	movl	$0x1, %r9d
14546766d:     	callq	0x1457744b0 <.text+0x57734b0>
145467672:     	nop
145467673:     	movq	-0x20(%rbp), %rdx
145467677:     	jmp	0x14546751e <.text+0x546651e>
14546767c:     	movq	$0x1, 0x20(%rsp)
145467685:     	leaq	-0x50(%rbp), %rcx
145467689:     	movl	$0x4, %r8d
14546768f:     	movl	$0x1, %r9d
145467695:     	callq	0x1457744b0 <.text+0x57734b0>
14546769a:     	nop
14546769b:     	movq	-0x40(%rbp), %rdx
14546769f:     	jmp	0x14546755e <.text+0x546655e>
1454676a4:     	movq	$0x1, 0x20(%rsp)
1454676ad:     	leaq	-0x50(%rbp), %rcx
1454676b1:     	movl	$0x4, %r8d
1454676b7:     	movl	$0x1, %r9d
1454676bd:     	callq	0x1457744b0 <.text+0x57734b0>
1454676c2:     	nop
1454676c3:     	movq	-0x40(%rbp), %rdx
1454676c7:     	jmp	0x1454675ae <.text+0x54665ae>
1454676cc:     	movq	$0x1, 0x20(%rsp)
1454676d5:     	leaq	-0x30(%rbp), %rcx
1454676d9:     	movl	$0x4, %r8d
1454676df:     	movl	$0x1, %r9d
1454676e5:     	callq	0x1457744b0 <.text+0x57734b0>
1454676ea:     	nop
1454676eb:     	movq	-0x20(%rbp), %rdx
1454676ef:     	jmp	0x1454675f1 <.text+0x54665f1>
1454676f4:     	movl	$0x1, %ecx
1454676f9:     	movl	$0x20, %edx
1454676fe:     	callq	0x14590379b <.text+0x590279b>
145467703:     	ud2
