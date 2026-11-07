
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454253b0:     	pushq	%rbp
1454253b1:     	pushq	%r14
1454253b3:     	pushq	%rsi
1454253b4:     	pushq	%rdi
1454253b5:     	pushq	%rbx
1454253b6:     	subq	$0xa0, %rsp
1454253bd:     	leaq	0x80(%rsp), %rbp
1454253c5:     	movq	$-0x2, 0x18(%rbp)
1454253cd:     	movq	%rdx, %rbx
1454253d0:     	movq	%rcx, %rsi
1454253d3:     	movq	%rbp, %rcx
1454253d6:     	callq	0x145425910 <.text+0x5424910>
1454253db:     	movq	0x8(%rbp), %rdi
1454253df:     	movq	0x10(%rbp), %r14
1454253e3:     	leaq	-0x18(%rbp), %rcx
1454253e7:     	movq	%rbx, %rdx
1454253ea:     	callq	0x1454251d0 <.text+0x54241d0>
1454253ef:     	nop
1454253f0:     	leaq	(%r14,%r14,2), %rax
1454253f4:     	leaq	(%rdi,%rax,8), %rax
1454253f8:     	movq	-0x18(%rbp), %rcx
1454253fc:     	movq	-0x10(%rbp), %rdx
145425400:     	movq	-0x8(%rbp), %r8
145425404:     	leaq	(%r8,%r8,2), %r8
145425408:     	leaq	(%rdx,%r8,8), %r8
14542540c:     	xorps	%xmm0, %xmm0
14542540f:     	movups	%xmm0, -0x28(%rbp)
145425413:     	movq	%rdi, -0x58(%rbp)
145425417:     	movq	%rax, -0x50(%rbp)
14542541b:     	movq	%rdx, -0x48(%rbp)
14542541f:     	movq	%rdx, -0x40(%rbp)
145425423:     	movq	%rcx, -0x38(%rbp)
145425427:     	movq	%r8, -0x30(%rbp)
14542542b:     	leaq	-0x58(%rbp), %rdx
14542542f:     	movq	%rsi, %rcx
145425432:     	callq	0x145542df0 <.text+0x5541df0>
145425437:     	nop
145425438:     	testq	%r14, %r14
14542543b:     	je	0x145425472 <.text+0x5424472>
14542543d:     	leaq	0x8(%rdi), %rbx
145425441:     	jmp	0x145425459 <.text+0x5424459>
145425443:     	nopw	%cs:(%rax,%rax)
145425450:     	addq	$0x18, %rbx
145425454:     	decq	%r14
145425457:     	je	0x145425472 <.text+0x5424472>
145425459:     	movq	-0x8(%rbx), %rdx
14542545d:     	testq	%rdx, %rdx
145425460:     	je	0x145425450 <.text+0x5424450>
145425462:     	movq	(%rbx), %rcx
145425465:     	movl	$0x1, %r8d
14542546b:     	callq	0x1400021d0 <.text+0x11d0>
145425470:     	jmp	0x145425450 <.text+0x5424450>
145425472:     	movq	(%rbp), %rax
145425476:     	testq	%rax, %rax
145425479:     	je	0x145425491 <.text+0x5424491>
14542547b:     	shlq	$0x3, %rax
14542547f:     	leaq	(%rax,%rax,2), %rdx
145425483:     	movl	$0x8, %r8d
145425489:     	movq	%rdi, %rcx
14542548c:     	callq	0x1400021d0 <.text+0x11d0>
145425491:     	movq	%rsi, %rax
145425494:     	addq	$0xa0, %rsp
14542549b:     	popq	%rbx
14542549c:     	popq	%rdi
14542549d:     	popq	%rsi
14542549e:     	popq	%r14
1454254a0:     	popq	%rbp
1454254a1:     	retq
