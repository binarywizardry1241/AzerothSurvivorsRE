
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145532400:     	pushq	%rbp
145532401:     	pushq	%r15
145532403:     	pushq	%r14
145532405:     	pushq	%r13
145532407:     	pushq	%r12
145532409:     	pushq	%rsi
14553240a:     	pushq	%rdi
14553240b:     	pushq	%rbx
14553240c:     	subq	$0x58, %rsp
145532410:     	leaq	0x50(%rsp), %rbp
145532415:     	movq	$-0x2, (%rbp)
14553241d:     	movq	(%rdx), %rax
145532420:     	movq	0x8(%rdx), %r14
145532424:     	movq	0x10(%rdx), %r15
145532428:     	movq	0x18(%rdx), %r12
14553242c:     	cmpq	%r14, %rax
14553242f:     	je	0x1455325a7 <.text+0x55315a7>
145532435:     	leaq	0x8(%rax), %r13
145532439:     	movq	%r13, (%rdx)
14553243c:     	movq	(%rax), %rsi
14553243f:     	movq	0x8(%r15), %rax
145532443:     	imulq	$0x160, 0x10(%r15), %r8 # imm = 0x160
14553244b:     	xorl	%r10d, %r10d
14553244e:     	movq	%rax, %r9
145532451:     	nopw	%cs:(%rax,%rax)
145532460:     	cmpq	%r10, %r8
145532463:     	je	0x145532498 <.text+0x5531498>
145532465:     	addq	$0x160, %r10            # imm = 0x160
14553246c:     	cmpq	%rsi, 0x88(%r9)
145532473:     	leaq	0x160(%r9), %r9
14553247a:     	jne	0x145532460 <.text+0x5531460>
14553247c:     	cmpb	$0x0, -0xf8(%rax,%r10)
145532485:     	jne	0x145532498 <.text+0x5531498>
145532487:     	movss	(%r12), %xmm0
14553248d:     	ucomiss	-0x20(%rax,%r10), %xmm0
145532493:     	movq	%r13, %rax
145532496:     	jb	0x14553242c <.text+0x553142c>
145532498:     	movq	%rcx, -0x20(%rbp)
14553249c:     	callq	0x140002200 <.text+0x1200>
1455324a1:     	movl	$0x20, %ecx
1455324a6:     	movl	$0x8, %edx
1455324ab:     	callq	0x1400021c0 <.text+0x11c0>
1455324b0:     	testq	%rax, %rax
1455324b3:     	je	0x1455325c0 <.text+0x55315c0>
1455324b9:     	movq	%rsi, (%rax)
1455324bc:     	movq	$0x4, -0x18(%rbp)
1455324c4:     	movq	%rax, -0x10(%rbp)
1455324c8:     	movl	$0x1, %edi
1455324cd:     	leaq	-0x18(%rbp), %rbx
1455324d1:     	jmp	0x1455324e7 <.text+0x55314e7>
1455324d3:     	nopw	%cs:(%rax,%rax)
1455324e0:     	movq	%rsi, (%rax,%rdi,8)
1455324e4:     	incq	%rdi
1455324e7:     	movq	%rdi, -0x8(%rbp)
1455324eb:     	cmpq	%r14, %r13
1455324ee:     	je	0x145532580 <.text+0x5531580>
1455324f4:     	movq	(%r13), %rsi
1455324f8:     	addq	$0x8, %r13
1455324fc:     	movq	0x8(%r15), %rcx
145532500:     	imulq	$0x160, 0x10(%r15), %r8 # imm = 0x160
145532508:     	xorl	%edx, %edx
14553250a:     	movq	%rcx, %r9
14553250d:     	nopl	(%rax)
145532510:     	cmpq	%rdx, %r8
145532513:     	je	0x145532550 <.text+0x5531550>
145532515:     	addq	$0x160, %rdx            # imm = 0x160
14553251c:     	cmpq	%rsi, 0x88(%r9)
145532523:     	leaq	0x160(%r9), %r9
14553252a:     	jne	0x145532510 <.text+0x5531510>
14553252c:     	cmpb	$0x0, -0xf8(%rcx,%rdx)
145532534:     	jne	0x145532550 <.text+0x5531550>
145532536:     	movss	(%r12), %xmm0
14553253c:     	ucomiss	-0x20(%rcx,%rdx), %xmm0
145532541:     	jb	0x1455324eb <.text+0x55314eb>
145532543:     	nopw	%cs:(%rax,%rax)
145532550:     	cmpq	-0x18(%rbp), %rdi
145532554:     	jne	0x1455324e0 <.text+0x55314e0>
145532556:     	movq	$0x8, 0x20(%rsp)
14553255f:     	movl	$0x1, %r8d
145532565:     	movl	$0x8, %r9d
14553256b:     	movq	%rbx, %rcx
14553256e:     	movq	%rdi, %rdx
145532571:     	callq	0x145757d40 <.text+0x5756d40>
145532576:     	nop
145532577:     	movq	-0x10(%rbp), %rax
14553257b:     	jmp	0x1455324e0 <.text+0x55314e0>
145532580:     	movq	-0x8(%rbp), %rax
145532584:     	movq	-0x20(%rbp), %rcx
145532588:     	movq	%rax, 0x10(%rcx)
14553258c:     	movups	-0x18(%rbp), %xmm0
145532590:     	movups	%xmm0, (%rcx)
145532593:     	movq	%rcx, %rax
145532596:     	addq	$0x58, %rsp
14553259a:     	popq	%rbx
14553259b:     	popq	%rdi
14553259c:     	popq	%rsi
14553259d:     	popq	%r12
14553259f:     	popq	%r13
1455325a1:     	popq	%r14
1455325a3:     	popq	%r15
1455325a5:     	popq	%rbp
1455325a6:     	retq
1455325a7:     	movq	$0x0, (%rcx)
1455325ae:     	movq	$0x8, 0x8(%rcx)
1455325b6:     	movq	$0x0, 0x10(%rcx)
1455325be:     	jmp	0x145532593 <.text+0x5531593>
1455325c0:     	movl	$0x8, %ecx
1455325c5:     	movl	$0x20, %edx
1455325ca:     	callq	0x1458e721b <.text+0x58e621b>
1455325cf:     	ud2
