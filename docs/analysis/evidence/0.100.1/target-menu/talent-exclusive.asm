
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454834e0:     	pushq	%r15
1454834e2:     	pushq	%r14
1454834e4:     	pushq	%r13
1454834e6:     	pushq	%r12
1454834e8:     	pushq	%rsi
1454834e9:     	pushq	%rdi
1454834ea:     	pushq	%rbp
1454834eb:     	pushq	%rbx
1454834ec:     	subq	$0x38, %rsp
1454834f0:     	movq	%r9, %rsi
1454834f3:     	movq	%r8, %rdi
1454834f6:     	movl	%edx, %ebp
1454834f8:     	movq	%rcx, %rbx
1454834fb:     	movl	%edx, %ecx
1454834fd:     	movq	%r8, %rdx
145483500:     	movq	%r9, %r8
145483503:     	callq	0x145486f60 <.text+0x5485f60>
145483508:     	testq	%rdx, %rdx
14548350b:     	je	0x14548356e <.text+0x548256e>
14548350d:     	cmpb	$0x6, 0x60(%rdx)
145483511:     	jne	0x14548356e <.text+0x548256e>
145483513:     	decb	%bpl
145483516:     	cmpb	$0xa, %bpl
14548351a:     	ja	0x14548356e <.text+0x548256e>
14548351c:     	movzbl	%bpl, %ecx
145483520:     	movl	$0x5df, %edx            # imm = 0x5DF
145483525:     	btl	%ecx, %edx
145483528:     	jae	0x14548356e <.text+0x548256e>
14548352a:     	leaq	0x1572347(%rip), %rdx   # 0x1469f5878
145483531:     	movq	(%rdx,%rcx,8), %rcx
145483535:     	shlq	$0x6, %rax
145483539:     	movq	0x38(%rcx,%rax), %rdx
14548353e:     	testq	%rdx, %rdx
145483541:     	je	0x14548356e <.text+0x548256e>
145483543:     	movq	0x10(%rbx), %r12
145483547:     	testq	%r12, %r12
14548354a:     	je	0x14548356e <.text+0x548256e>
14548354c:     	movq	%rdi, 0x28(%rsp)
145483551:     	movq	0x30(%rcx,%rax), %r13
145483556:     	imulq	$0x68, %rdx, %rax
14548355a:     	addq	%r13, %rax
14548355d:     	movq	%rax, 0x30(%rsp)
145483562:     	movq	0x8(%rbx), %rbp
145483566:     	shlq	$0x4, %r12
14548356a:     	xorl	%ebx, %ebx
14548356c:     	jmp	0x14548359b <.text+0x548259b>
14548356e:     	xorl	%ebx, %ebx
145483570:     	movq	%rbx, %rax
145483573:     	addq	$0x38, %rsp
145483577:     	popq	%rbx
145483578:     	popq	%rbp
145483579:     	popq	%rdi
14548357a:     	popq	%rsi
14548357b:     	popq	%r12
14548357d:     	popq	%r13
14548357f:     	popq	%r14
145483581:     	popq	%r15
145483583:     	retq
145483584:     	nopw	%cs:(%rax,%rax)
145483590:     	addq	$0x68, %r13
145483594:     	cmpq	0x30(%rsp), %r13
145483599:     	je	0x145483570 <.text+0x5482570>
14548359b:     	cmpb	$0x6, 0x60(%r13)
1454835a0:     	jne	0x145483590 <.text+0x5482590>
1454835a2:     	movq	(%r13), %r14
1454835a6:     	movq	0x8(%r13), %r15
1454835aa:     	cmpq	%rsi, %r15
1454835ad:     	jne	0x1454835c3 <.text+0x54825c3>
1454835af:     	movq	%r14, %rcx
1454835b2:     	movq	0x28(%rsp), %rdx
1454835b7:     	movq	%rsi, %r8
1454835ba:     	callq	0x1457731e7 <.text+0x57721e7>
1454835bf:     	testl	%eax, %eax
1454835c1:     	je	0x145483590 <.text+0x5482590>
1454835c3:     	xorl	%edi, %edi
1454835c5:     	jmp	0x1454835d9 <.text+0x54825d9>
1454835c7:     	nopw	(%rax,%rax)
1454835d0:     	addq	$0x10, %rdi
1454835d4:     	cmpq	%rdi, %r12
1454835d7:     	je	0x145483590 <.text+0x5482590>
1454835d9:     	movq	(%rbp,%rdi), %rax
1454835de:     	cmpq	%r15, 0x8(%rax)
1454835e2:     	jne	0x1454835d0 <.text+0x54825d0>
1454835e4:     	movq	(%rax), %rcx
1454835e7:     	movq	%r14, %rdx
1454835ea:     	movq	%r15, %r8
1454835ed:     	callq	0x1457731e7 <.text+0x57721e7>
1454835f2:     	testl	%eax, %eax
1454835f4:     	jne	0x1454835d0 <.text+0x54825d0>
1454835f6:     	cmpb	$0x0, 0x8(%rbp,%rdi)
1454835fb:     	je	0x145483590 <.text+0x5482590>
1454835fd:     	movq	%r13, %rbx
145483600:     	jmp	0x145483570 <.text+0x5482570>
