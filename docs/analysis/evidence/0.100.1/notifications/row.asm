
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401034a0:     	pushq	%r15
1401034a2:     	pushq	%r14
1401034a4:     	pushq	%r13
1401034a6:     	pushq	%r12
1401034a8:     	pushq	%rsi
1401034a9:     	pushq	%rdi
1401034aa:     	pushq	%rbp
1401034ab:     	pushq	%rbx
1401034ac:     	subq	$0x1c8, %rsp            # imm = 0x1C8
1401034b3:     	movaps	%xmm10, 0x1b0(%rsp)
1401034bc:     	movaps	%xmm9, 0x1a0(%rsp)
1401034c5:     	movaps	%xmm8, 0x190(%rsp)
1401034ce:     	movaps	%xmm7, 0x180(%rsp)
1401034d6:     	movaps	%xmm6, 0x170(%rsp)
1401034de:     	movq	(%rcx), %r12
1401034e1:     	movq	0x28(%rcx), %rax
1401034e5:     	movq	%r12, 0x70(%rsp)
1401034ea:     	movups	0x8(%rcx), %xmm0
1401034ee:     	movups	%xmm0, 0x78(%rsp)
1401034f3:     	movq	%rcx, 0x50(%rsp)
1401034f8:     	movups	0x18(%rcx), %xmm0
1401034fc:     	movups	%xmm0, 0x88(%rsp)
140103504:     	movq	%rax, 0x98(%rsp)
14010350c:     	movq	(%rdx), %rax
14010350f:     	movq	0x10(%rax), %r13
140103513:     	testq	%r13, %r13
140103516:     	je	0x1401036f4 <.text+0x1026f4>
14010351c:     	movq	(%r8), %rbp
14010351f:     	movq	0x8(%rax), %rbx
140103523:     	shlq	$0x5, %r13
140103527:     	leaq	0x5c(%rsp), %rdi
14010352c:     	leaq	0xa8(%rsp), %rsi
140103534:     	movss	0x583c444(%rip), %xmm6  # 0x14593f980
14010353c:     	leaq	0x140(%rsp), %r14
140103544:     	movsd	0x5812284(%rip), %xmm7  # 0x1459157d0
14010354c:     	leaq	0xa0(%rsp), %r15
140103554:     	movss	0x583c3c7(%rip), %xmm8  # 0x14593f924
14010355d:     	jmp	0x14010368c <.text+0x10268c>
140103562:     	nopw	%cs:(%rax,%rax)
140103570:     	leaq	0x1(%rbp), %rcx
140103574:     	movl	(%rcx), %eax
140103576:     	movl	0x3(%rcx), %ecx
140103579:     	movl	%ecx, 0x2b(%rsp)
14010357d:     	movl	%eax, 0x28(%rsp)
140103581:     	movq	0x8(%rbp), %rax
140103585:     	movzbl	0x10(%rbp), %edx
140103589:     	movb	$0x1, %cl
14010358b:     	addq	$0x20, %rbx
14010358f:     	movq	0x150(%rsp), %r8
140103597:     	movq	%r8, 0x28(%rsi)
14010359b:     	movups	0x140(%rsp), %xmm0
1401035a3:     	movups	%xmm0, 0x18(%rsi)
1401035a7:     	movl	0x28(%rsp), %r8d
1401035ac:     	movl	0x2b(%rsp), %r9d
1401035b1:     	movl	%r9d, 0x4c(%rsi)
1401035b5:     	movl	%r8d, 0x49(%rsi)
1401035b9:     	movl	0x40(%rsp), %r8d
1401035be:     	movl	%r8d, 0x10(%rdi)
1401035c2:     	movaps	0x30(%rsp), %xmm0
1401035c7:     	movups	%xmm0, (%rdi)
1401035ca:     	movl	0x40(%rsp), %r8d
1401035cf:     	movl	%r8d, 0x10(%rsi)
1401035d3:     	movaps	0x30(%rsp), %xmm0
1401035d8:     	movups	%xmm0, (%rsi)
1401035db:     	movss	%xmm10, 0xbc(%rsp)
1401035e5:     	movq	$0x0, 0xd8(%rsp)
1401035f1:     	movq	$0x4, 0xe0(%rsp)
1401035fd:     	movq	$0x0, 0xe8(%rsp)
140103609:     	movb	%cl, 0xf0(%rsp)
140103610:     	movq	%rax, 0xf8(%rsp)
140103618:     	movq	%rdx, 0x100(%rsp)
140103620:     	movss	%xmm9, 0x108(%rsp)
14010362a:     	movw	$0x190, 0x10c(%rsp)     # imm = 0x190
140103634:     	movb	$0x1, 0x10e(%rsp)
14010363c:     	movq	0x68(%rsp), %rax
140103641:     	movq	%rax, 0x74(%rsi)
140103645:     	movups	0x5b(%rsp), %xmm0
14010364a:     	movups	%xmm0, 0x67(%rsi)
14010364e:     	movl	0x5815b2c(%rip), %eax   # 0x145919180
140103654:     	movl	%eax, 0x8c(%rsi)
14010365a:     	movups	0x5815b0f(%rip), %xmm0  # 0x145919170
140103661:     	movups	%xmm0, 0x7c(%rsi)
140103665:     	movsd	%xmm7, 0x138(%rsp)
14010366e:     	movq	%r12, 0xa0(%rsp)
140103676:     	movq	%r14, %rcx
140103679:     	leaq	0x78(%rsp), %rdx
14010367e:     	movq	%r15, %r8
140103681:     	callq	0x1400dcfa0 <.text+0xdbfa0>
140103686:     	addq	$-0x20, %r13
14010368a:     	je	0x1401036f4 <.text+0x1026f4>
14010368c:     	cmpb	$0x0, 0x18(%rbx)
140103690:     	je	0x1401036b0 <.text+0x1026b0>
140103692:     	movups	0x583d04f(%rip), %xmm0  # 0x1459406e8
140103699:     	movaps	%xmm0, 0x30(%rsp)
14010369e:     	movl	$0x3f800000, 0x40(%rsp) # imm = 0x3F800000
1401036a6:     	movaps	%xmm6, %xmm9
1401036aa:     	jmp	0x1401036c8 <.text+0x1026c8>
1401036ac:     	nopl	(%rax)
1401036b0:     	movups	0x583cfd1(%rip), %xmm0  # 0x145940688
1401036b7:     	movaps	%xmm0, 0x30(%rsp)
1401036bc:     	movl	$0x3f800000, 0x40(%rsp) # imm = 0x3F800000
1401036c4:     	movaps	%xmm8, %xmm9
1401036c8:     	movss	0x1c(%rbx), %xmm10
1401036ce:     	movq	%r14, %rcx
1401036d1:     	movq	%rbx, %rdx
1401036d4:     	callq	0x145728850 <.text+0x5727850>
1401036d9:     	cmpb	$0x1, (%rbp)
1401036dd:     	je	0x140103570 <.text+0x102570>
1401036e3:     	movq	0x8(%rbp), %rax
1401036e7:     	lock
1401036e8:     	incq	(%rax)
1401036eb:     	jle	0x140103738 <.text+0x102738>
1401036ed:     	xorl	%ecx, %ecx
1401036ef:     	jmp	0x14010358b <.text+0x10258b>
1401036f4:     	movq	0x50(%rsp), %rax
1401036f9:     	movaps	0x170(%rsp), %xmm6
140103701:     	movaps	0x180(%rsp), %xmm7
140103709:     	movaps	0x190(%rsp), %xmm8
140103712:     	movaps	0x1a0(%rsp), %xmm9
14010371b:     	movaps	0x1b0(%rsp), %xmm10
140103724:     	addq	$0x1c8, %rsp            # imm = 0x1C8
14010372b:     	popq	%rbx
14010372c:     	popq	%rbp
14010372d:     	popq	%rdi
14010372e:     	popq	%rsi
14010372f:     	popq	%r12
140103731:     	popq	%r13
140103733:     	popq	%r14
140103735:     	popq	%r15
140103737:     	retq
140103738:     	ud2
