
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454cc3a0:     	movq	0x2a0(%rbp), %rcx
1454cc3a7:     	movq	0x4c8(%rcx), %rax
1454cc3ae:     	imulq	$0x160, 0x4d0(%rcx), %rdx # imm = 0x160
1454cc3b9:     	xorl	%ecx, %ecx
1454cc3bb:     	movq	%rax, %r8
1454cc3be:     	nop
1454cc3c0:     	cmpq	%rcx, %rdx
1454cc3c3:     	je	0x1454cc430 <.text+0x54cb430>
1454cc3c5:     	addq	$0x160, %rcx            # imm = 0x160
1454cc3cc:     	cmpq	%r14, 0x88(%r8)
1454cc3d3:     	leaq	0x160(%r8), %r8
1454cc3da:     	jne	0x1454cc3c0 <.text+0x54cb3c0>
1454cc3dc:     	movss	-0x38(%rax,%rcx), %xmm0
1454cc3e2:     	ucomiss	%xmm0, %xmm7
1454cc3e5:     	jae	0x1454cc43f <.text+0x54cb43f>
1454cc3e7:     	movaps	%xmm6, %xmm1
1454cc3ea:     	subss	-0x3c(%rax,%rcx), %xmm1
1454cc3f0:     	divss	%xmm0, %xmm1
1454cc3f4:     	xorps	%xmm0, %xmm0
1454cc3f7:     	maxss	%xmm1, %xmm0
1454cc3fb:     	movaps	%xmm12, %xmm1
1454cc3ff:     	minss	%xmm0, %xmm1
1454cc403:     	movsd	-0x54(%rax,%rcx), %xmm0
1454cc409:     	movsd	-0x48(%rax,%rcx), %xmm2
1454cc40f:     	subps	%xmm0, %xmm2
1454cc412:     	movsldup	%xmm1, %xmm10           # xmm10 = xmm1[0,0,2,2]
1454cc417:     	mulps	%xmm2, %xmm10
1454cc41b:     	addps	%xmm0, %xmm10
1454cc41f:     	jmp	0x1454cc446 <.text+0x54cb446>
1454cc421:     	nopw	%cs:(%rax,%rax)
1454cc430:     	movq	%r12, %rax
1454cc433:     	movq	0x2a0(%rbp), %r13
1454cc43a:     	jmp	0x1454cc2f2 <.text+0x54cb2f2>
1454cc43f:     	movsd	-0x48(%rax,%rcx), %xmm10
1454cc446:     	movq	0x2a0(%rbp), %rdi
1454cc44d:     	movq	0x3d0(%rdi), %rax
1454cc454:     	movq	%rax, 0x130(%rbp)
1454cc45b:     	movq	%rax, 0x198(%rbp)
1454cc462:     	movl	$0x0, 0x190(%rbp)
1454cc46c:     	movl	$0x0, 0x1b8(%rbp)
1454cc476:     	leaq	0x1b8(%rbp), %rax
1454cc47d:     	movq	%rax, 0x30(%rsp)
1454cc482:     	leaq	0x190(%rbp), %rax
1454cc489:     	movq	%rax, 0x28(%rsp)
1454cc48e:     	movq	$0x1, 0x20(%rsp)
1454cc497:     	leaq	0x1f0(%rbp), %rcx
1454cc49e:     	movq	%r14, %rdx
1454cc4a1:     	movl	%r15d, %r8d
1454cc4a4:     	leaq	0x130(%rbp), %r9
1454cc4ab:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454cc4b0:     	nop
1454cc4b1:     	movq	0x548(%rdi), %rsi
1454cc4b8:     	cmpq	0x538(%rdi), %rsi
1454cc4bf:     	jne	0x1454cc4ce <.text+0x54cb4ce>
1454cc4c1:     	movq	0x290(%rbp), %rcx
1454cc4c8:     	callq	0x1457580b0 <.text+0x57570b0>
1454cc4cd:     	nop
1454cc4ce:     	movq	0x2a0(%rbp), %r13
1454cc4d5:     	movq	0x540(%r13), %rax
1454cc4dc:     	movq	%rsi, %rcx
1454cc4df:     	shlq	$0x5, %rcx
1454cc4e3:     	movups	0x1f0(%rbp), %xmm0
1454cc4ea:     	movups	0x200(%rbp), %xmm1
1454cc4f1:     	movups	%xmm1, 0x10(%rax,%rcx)
1454cc4f6:     	movups	%xmm0, (%rax,%rcx)
1454cc4fa:     	incq	%rsi
1454cc4fd:     	movq	%rsi, 0x548(%r13)
1454cc504:     	movl	%r15d, %ecx
1454cc507:     	callq	0x1454f08d0 <.text+0x54ef8d0>
1454cc50c:     	xorps	%xmm11, %xmm11
1454cc510:     	ucomiss	%xmm11, %xmm0
1454cc514:     	jbe	0x1454cc53f <.text+0x54cb53f>
1454cc516:     	movsd	0x3e8(%r13), %xmm1
1454cc51f:     	subps	%xmm1, %xmm10
1454cc523:     	mulps	%xmm10, %xmm10
1454cc527:     	movshdup	%xmm10, %xmm1           # xmm1 = xmm10[1,1,3,3]
1454cc52c:     	addss	%xmm10, %xmm1
1454cc531:     	xorps	%xmm11, %xmm11
1454cc535:     	sqrtss	%xmm1, %xmm11
1454cc53a:     	divss	%xmm0, %xmm11
1454cc53f:     	movq	0x3d0(%r13), %rdi
1454cc546:     	movq	0x500(%r13), %rsi
1454cc54d:     	cmpq	0x4f0(%r13), %rsi
1454cc554:     	jne	0x1454cc563 <.text+0x54cb563>
1454cc556:     	movq	0x260(%rbp), %rcx
1454cc55d:     	callq	0x1457642b0 <.text+0x57632b0>
1454cc562:     	nop
1454cc563:     	addss	%xmm6, %xmm11
1454cc568:     	movq	0x4f8(%r13), %rax
1454cc56f:     	leaq	(%rsi,%rsi,4), %rcx
1454cc573:     	shlq	$0x4, %rcx
1454cc577:     	movq	$0x0, (%rax,%rcx)
1454cc57f:     	movl	$0x0, 0x10(%rax,%rcx)
1454cc587:     	movq	%rdi, 0x20(%rax,%rcx)
1454cc58c:     	movq	%r14, 0x28(%rax,%rcx)
1454cc591:     	movl	$0x0, 0x30(%rax,%rcx)
1454cc599:     	movss	%xmm11, 0x3c(%rax,%rcx)
1454cc5a0:     	movl	%r15d, 0x40(%rax,%rcx)
1454cc5a5:     	movss	%xmm9, 0x44(%rax,%rcx)
1454cc5ac:     	movl	$0x5000100, 0x48(%rax,%rcx) # imm = 0x5000100
1454cc5b4:     	incq	%rsi
1454cc5b7:     	movq	%rsi, 0x500(%r13)
1454cc5be:     	movq	%r12, %rax
1454cc5c1:     	jmp	0x1454cc2f2 <.text+0x54cb2f2>
