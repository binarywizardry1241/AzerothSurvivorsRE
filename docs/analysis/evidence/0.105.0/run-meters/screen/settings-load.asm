
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1401664a7:     	leaq	0x5c5020f(%rip), %rdx   # 0x145db66bd
1401664ae:     	leaq	0x240(%rbp), %rcx
1401664b5:     	movl	$0x5, %r8d
1401664bb:     	callq	0x1458ddb50 <.text+0x58dcb50>
1401664c0:     	movq	0x240(%rbp), %rax
1401664c7:     	cmpq	$-0x1, %rax
1401664cb:     	je	0x1401665a9 <.text+0x1655a9>
1401664d1:     	movq	%rax, 0xa90(%rbp)
1401664d8:     	movq	0x248(%rbp), %rdx
1401664df:     	movq	0x250(%rbp), %rax
1401664e6:     	leaq	(%rdx,%rax), %rcx
1401664ea:     	movq	$0x0, 0x240(%rbp)
1401664f5:     	movq	%rax, 0x248(%rbp)
1401664fc:     	movq	%rdx, 0x250(%rbp)
140166503:     	movq	%rax, 0x258(%rbp)
14016650a:     	movq	%rdx, 0x998(%rbp)
140166511:     	movq	%rdx, 0x260(%rbp)
140166518:     	movq	%rcx, 0x268(%rbp)
14016651f:     	movq	$0x0, 0x270(%rbp)
14016652a:     	movw	$0x1, 0x278(%rbp)
140166533:     	leaq	0xa10(%rbp), %rcx
14016653a:     	leaq	0x240(%rbp), %rdx
140166541:     	callq	0x1402603c0 <.text+0x25f3c0>
140166546:     	nop
140166547:     	movq	0xa20(%rbp), %rax
14016654e:     	cmpq	$0x5, %rax
140166552:     	jb	0x1401665bc <.text+0x1655bc>
140166554:     	movq	0xa18(%rbp), %rcx
14016655b:     	movsd	0x4(%rcx), %xmm7
140166560:     	movsd	0xc(%rcx), %xmm6
140166565:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
140166569:     	xorps	%xmm0, %xmm0
14016656c:     	movss	(%rcx), %xmm2
140166570:     	cmpneqss	%xmm0, %xmm2
140166575:     	movd	%xmm2, %r15d
14016657a:     	andl	$0x1, %r15d
14016657e:     	movaps	%xmm7, %xmm2
140166581:     	minss	%xmm1, %xmm2
140166585:     	ucomiss	%xmm0, %xmm2
140166588:     	maxps	0x5c4f861(%rip), %xmm6  # 0x145db5df0
14016658f:     	setae	%r12b
140166593:     	minps	0x5c4f866(%rip), %xmm6  # 0x145db5e00
14016659a:     	cmpq	$0x5, %rax
14016659e:     	jne	0x140168f0c <.text+0x167f0c>
1401665a4:     	xorl	%r13d, %r13d
1401665a7:     	jmp	0x1401665cd <.text+0x1655cd>
1401665a9:     	movsd	0x5c4f82f(%rip), %xmm6  # 0x145db5de0
1401665b1:     	xorl	%r15d, %r15d
1401665b4:     	xorl	%r13d, %r13d
1401665b7:     	xorl	%r12d, %r12d
1401665ba:     	jmp	0x14016660d <.text+0x16560d>
1401665bc:     	movsd	0x5c4f81c(%rip), %xmm6  # 0x145db5de0
1401665c4:     	xorl	%r15d, %r15d
1401665c7:     	xorl	%r13d, %r13d
1401665ca:     	xorl	%r12d, %r12d
1401665cd:     	movq	0xa10(%rbp), %rdx
1401665d4:     	testq	%rdx, %rdx
1401665d7:     	je	0x1401665ef <.text+0x1655ef>
1401665d9:     	movq	0xa18(%rbp), %rcx
1401665e0:     	shlq	$0x2, %rdx
1401665e4:     	movl	$0x4, %r8d
1401665ea:     	callq	0x1400021d0 <.text+0x11d0>
1401665ef:     	movq	0xa90(%rbp), %rdx
1401665f6:     	testq	%rdx, %rdx
1401665f9:     	je	0x14016660d <.text+0x16560d>
1401665fb:     	movl	$0x1, %r8d
140166601:     	movq	0x998(%rbp), %rcx
140166608:     	callq	0x1400021d0 <.text+0x11d0>
