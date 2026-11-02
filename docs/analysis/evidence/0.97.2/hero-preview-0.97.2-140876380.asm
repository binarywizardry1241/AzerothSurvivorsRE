
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140876380:     	pushq	%rbp
140876381:     	pushq	%r15
140876383:     	pushq	%r14
140876385:     	pushq	%r13
140876387:     	pushq	%r12
140876389:     	pushq	%rsi
14087638a:     	pushq	%rdi
14087638b:     	pushq	%rbx
14087638c:     	subq	$0xd8, %rsp
140876393:     	leaq	0x80(%rsp), %rbp
14087639b:     	movq	$-0x2, 0x50(%rbp)
1408763a3:     	movq	%r8, %rdi
1408763a6:     	movq	%rcx, %rsi
1408763a9:     	cmpb	$0x2, 0x38(%rdx)
1408763ad:     	jne	0x140876533 <.text+0x875533>
1408763b3:     	movq	%rdx, -0x50(%rbp)
1408763b7:     	leaq	0x40(%rdi), %r12
1408763bb:     	leaq	0x5a8(%rdi), %r13
1408763c2:     	movq	%r12, -0x30(%rbp)
1408763c6:     	movq	%r13, -0x28(%rbp)
1408763ca:     	movq	$0x0, -0x48(%rbp)
1408763d2:     	movq	$0x8, -0x40(%rbp)
1408763da:     	movq	$0x0, -0x38(%rbp)
1408763e2:     	leaq	0x523b7d7(%rip), %rdx   # 0x145ab1bc0
1408763e9:     	leaq	-0x48(%rbp), %rcx
1408763ed:     	callq	0x140cf5eb0 <.text+0xcf4eb0>
1408763f2:     	nop
1408763f3:     	movq	%rax, %rbx
1408763f6:     	movq	-0x48(%rbp), %rdx
1408763fa:     	testq	%rdx, %rdx
1408763fd:     	je	0x140876412 <.text+0x875412>
1408763ff:     	movq	-0x40(%rbp), %rcx
140876403:     	shlq	$0x3, %rdx
140876407:     	movl	$0x8, %r8d
14087640d:     	callq	0x1400021d0 <.text+0x11d0>
140876412:     	movq	%r12, -0x30(%rbp)
140876416:     	movq	%r13, -0x28(%rbp)
14087641a:     	movq	$0x0, -0x48(%rbp)
140876422:     	movq	$0x8, -0x40(%rbp)
14087642a:     	movq	$0x0, -0x38(%rbp)
140876432:     	leaq	0x523ac97(%rip), %rdx   # 0x145ab10d0
140876439:     	leaq	-0x48(%rbp), %rcx
14087643d:     	callq	0x140cde8f0 <.text+0xcdd8f0>
140876442:     	nop
140876443:     	movq	%rax, %r14
140876446:     	movq	-0x48(%rbp), %rdx
14087644a:     	testq	%rdx, %rdx
14087644d:     	je	0x140876462 <.text+0x875462>
14087644f:     	movq	-0x40(%rbp), %rcx
140876453:     	shlq	$0x3, %rdx
140876457:     	movl	$0x8, %r8d
14087645d:     	callq	0x1400021d0 <.text+0x11d0>
140876462:     	movq	%r12, -0x30(%rbp)
140876466:     	movq	%r13, -0x28(%rbp)
14087646a:     	movq	$0x0, -0x48(%rbp)
140876472:     	movq	$0x8, -0x40(%rbp)
14087647a:     	movq	$0x0, -0x38(%rbp)
140876482:     	leaq	0x523acb7(%rip), %rdx   # 0x145ab1140
140876489:     	leaq	-0x48(%rbp), %rcx
14087648d:     	callq	0x140cdfaa0 <.text+0xcdeaa0>
140876492:     	nop
140876493:     	movq	%rax, %r15
140876496:     	movq	-0x48(%rbp), %rdx
14087649a:     	testq	%rdx, %rdx
14087649d:     	je	0x1408764b2 <.text+0x8754b2>
14087649f:     	movq	-0x40(%rbp), %rcx
1408764a3:     	shlq	$0x3, %rdx
1408764a7:     	movl	$0x8, %r8d
1408764ad:     	callq	0x1400021d0 <.text+0x11d0>
1408764b2:     	movq	%r12, -0x30(%rbp)
1408764b6:     	movq	%r13, -0x28(%rbp)
1408764ba:     	movq	$0x0, -0x48(%rbp)
1408764c2:     	movq	$0x8, -0x40(%rbp)
1408764ca:     	movq	$0x0, -0x38(%rbp)
1408764d2:     	leaq	0x5239e07(%rip), %rdx   # 0x145ab02e0
1408764d9:     	leaq	-0x48(%rbp), %rcx
1408764dd:     	callq	0x140cb7be0 <.text+0xcb6be0>
1408764e2:     	nop
1408764e3:     	movq	%rax, %r12
1408764e6:     	movq	-0x48(%rbp), %rdx
1408764ea:     	testq	%rdx, %rdx
1408764ed:     	je	0x140876502 <.text+0x875502>
1408764ef:     	movq	-0x40(%rbp), %rcx
1408764f3:     	shlq	$0x3, %rdx
1408764f7:     	movl	$0x8, %r8d
1408764fd:     	callq	0x1400021d0 <.text+0x11d0>
140876502:     	movq	%rdi, %rcx
140876505:     	callq	0x140d9e590 <.text+0xd9d590>
14087650a:     	movq	0x5a0(%rdi), %rcx
140876511:     	movq	-0x50(%rbp), %rdx
140876515:     	movq	%rcx, 0x8(%rdx)
140876519:     	movq	%rbx, 0x10(%rdx)
14087651d:     	movq	%r14, 0x18(%rdx)
140876521:     	movq	%r15, 0x20(%rdx)
140876525:     	movq	%r12, 0x28(%rdx)
140876529:     	movq	%rax, 0x30(%rdx)
14087652d:     	movb	$0x0, 0x38(%rdx)
140876531:     	jmp	0x140876548 <.text+0x875548>
140876533:     	movq	0x5a0(%rdi), %rax
14087653a:     	movq	%rax, -0x48(%rbp)
14087653e:     	cmpq	%rax, 0x8(%rdx)
140876542:     	jne	0x1408765ed <.text+0x8755ed>
140876548:     	movl	$0x3dcc5000, %eax       # imm = 0x3DCC5000
14087654d:     	addl	0x5b0(%rdi), %eax
140876553:     	movl	%eax, (%rdx)
140876555:     	movq	$0x10, -0x30(%rbp)
14087655d:     	xorps	%xmm0, %xmm0
140876560:     	movups	%xmm0, -0x28(%rbp)
140876564:     	movq	$0x10, -0x18(%rbp)
14087656c:     	movups	%xmm0, -0x10(%rbp)
140876570:     	movq	$0x10, (%rbp)
140876578:     	movups	%xmm0, 0x8(%rbp)
14087657c:     	movq	$0x10, 0x18(%rbp)
140876584:     	movups	%xmm0, 0x20(%rbp)
140876588:     	movq	$0x10, 0x30(%rbp)
140876590:     	movq	$0x0, -0x48(%rbp)
140876598:     	movups	%xmm0, 0x38(%rbp)
14087659c:     	movl	$0x0, 0x48(%rbp)
1408765a3:     	movq	$0x8, -0x40(%rbp)
1408765ab:     	movq	$0x0, -0x38(%rbp)
1408765b3:     	leaq	0x10(%rdx), %rcx
1408765b7:     	leaq	-0x48(%rbp), %r8
1408765bb:     	movq	%rdi, %r9
1408765be:     	callq	0x140d68900 <.text+0xd67900>
1408765c3:     	nop
1408765c4:     	leaq	-0x48(%rbp), %rdx
1408765c8:     	movl	$0x98, %r8d
1408765ce:     	movq	%rsi, %rcx
1408765d1:     	callq	0x145756ddd <.text+0x5755ddd>
1408765d6:     	movq	%rsi, %rax
1408765d9:     	addq	$0xd8, %rsp
1408765e0:     	popq	%rbx
1408765e1:     	popq	%rdi
1408765e2:     	popq	%rsi
1408765e3:     	popq	%r12
1408765e5:     	popq	%r13
1408765e7:     	popq	%r14
1408765e9:     	popq	%r15
1408765eb:     	popq	%rbp
1408765ec:     	retq
1408765ed:     	addq	$0x8, %rdx
1408765f1:     	leaq	0x51992e0(%rip), %rax   # 0x145a0f8d8
1408765f8:     	movq	%rax, 0x28(%rsp)
1408765fd:     	movq	$0x83, 0x20(%rsp)
140876606:     	leaq	0x5199283(%rip), %r9    # 0x145a0f890
14087660d:     	leaq	-0x48(%rbp), %r8
140876611:     	xorl	%ecx, %ecx
140876613:     	callq	0x14589fabd <.text+0x589eabd>
140876618:     	ud2
