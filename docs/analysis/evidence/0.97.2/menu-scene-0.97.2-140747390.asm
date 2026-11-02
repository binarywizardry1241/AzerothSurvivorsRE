
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140747390:     	pushq	%r15
140747392:     	pushq	%r14
140747394:     	pushq	%r13
140747396:     	pushq	%r12
140747398:     	pushq	%rsi
140747399:     	pushq	%rdi
14074739a:     	pushq	%rbp
14074739b:     	pushq	%rbx
14074739c:     	subq	$0xa8, %rsp
1407473a3:     	movl	$0x1, %ebx
1407473a8:     	lock
1407473a9:     	xaddl	%ebx, 0x5b0(%r8)
1407473b1:     	cmpl	$0x2, 0x28(%rdx)
1407473b5:     	je	0x14074755a <.text+0x74655a>
1407473bb:     	movq	%rdx, %rsi
1407473be:     	movq	0x5a0(%r8), %rax
1407473c5:     	movq	%rax, 0x40(%rsp)
1407473ca:     	cmpq	%rax, 0x8(%rdx)
1407473ce:     	jne	0x140747574 <.text+0x746574>
1407473d4:     	movq	0x10(%rsi), %rax
1407473d8:     	movq	0x218(%r8), %r15
1407473df:     	cmpq	%r15, %rax
1407473e2:     	jae	0x1407475a5 <.text+0x7465a5>
1407473e8:     	movq	0x210(%r8), %r10
1407473ef:     	movq	(%r10,%rax,8), %rax
1407473f3:     	testq	%rax, %rax
1407473f6:     	je	0x1407475a5 <.text+0x7465a5>
1407473fc:     	movq	%rcx, %rdi
1407473ff:     	movq	0x1e0(%r8), %rdx
140747406:     	notq	%rax
140747409:     	imulq	$0x38, %rax, %rcx
14074740d:     	cmpb	$0x0, 0x30(%rdx,%rcx)
140747412:     	je	0x1407475a5 <.text+0x7465a5>
140747418:     	addq	%rdx, %rcx
14074741b:     	movq	0x10(%rcx), %r9
14074741f:     	movl	(%rsi), %eax
140747421:     	movq	0x18(%rsi), %r11
140747425:     	cmpq	%r15, %r11
140747428:     	jae	0x14074746e <.text+0x74646e>
14074742a:     	movq	(%r10,%r11,8), %r10
14074742e:     	testq	%r10, %r10
140747431:     	je	0x14074746e <.text+0x74646e>
140747433:     	notq	%r10
140747436:     	imulq	$0x38, %r10, %r10
14074743a:     	cmpb	$0x1, 0x30(%rdx,%r10)
140747440:     	jne	0x14074746e <.text+0x74646e>
140747442:     	addq	%r10, %rdx
140747445:     	movq	0x10(%rdx), %r10
140747449:     	leaq	0x28(%rdx), %r11
14074744d:     	addq	$0x2c, %rdx
140747451:     	movl	0x5b0(%r8), %ebp
140747458:     	movq	0x218(%r8), %r15
14074745f:     	leaq	0x28(%rsi), %r14
140747463:     	movq	0x20(%rsi), %r12
140747467:     	cmpq	%r15, %r12
14074746a:     	jb	0x14074747e <.text+0x74647e>
14074746c:     	jmp	0x1407474b7 <.text+0x7464b7>
14074746e:     	xorl	%r10d, %r10d
140747471:     	leaq	0x28(%rsi), %r14
140747475:     	movq	0x20(%rsi), %r12
140747479:     	cmpq	%r15, %r12
14074747c:     	jae	0x1407474b7 <.text+0x7464b7>
14074747e:     	movq	0x210(%r8), %r15
140747485:     	movq	(%r15,%r12,8), %r15
140747489:     	testq	%r15, %r15
14074748c:     	je	0x1407474b7 <.text+0x7464b7>
14074748e:     	movq	0x1e0(%r8), %r12
140747495:     	notq	%r15
140747498:     	imulq	$0x38, %r15, %r8
14074749c:     	cmpb	$0x1, 0x30(%r12,%r8)
1407474a2:     	jne	0x1407474b7 <.text+0x7464b7>
1407474a4:     	addq	%r8, %r12
1407474a7:     	movq	0x10(%r12), %r15
1407474ac:     	leaq	0x28(%r12), %r13
1407474b1:     	addq	$0x2c, %r12
1407474b5:     	jmp	0x1407474ba <.text+0x7464ba>
1407474b7:     	xorl	%r15d, %r15d
1407474ba:     	leaq	0x2c(%rcx), %r8
1407474be:     	addq	$0x28, %rcx
1407474c2:     	movq	%r9, 0x40(%rsp)
1407474c7:     	movq	%rcx, 0x48(%rsp)
1407474cc:     	movq	%r8, 0x50(%rsp)
1407474d1:     	movl	%eax, 0x58(%rsp)
1407474d5:     	movl	%ebx, 0x5c(%rsp)
1407474d9:     	leaq	0x60(%rsp), %r8
1407474de:     	movq	%r10, 0x60(%rsp)
1407474e3:     	movq	%r11, 0x68(%rsp)
1407474e8:     	movq	%rdx, 0x70(%rsp)
1407474ed:     	movl	%eax, 0x78(%rsp)
1407474f1:     	movl	%ebx, 0x7c(%rsp)
1407474f5:     	leaq	0x80(%rsp), %r9
1407474fd:     	movq	%r15, 0x80(%rsp)
140747505:     	movq	%r13, 0x88(%rsp)
14074750d:     	movq	%r12, 0x90(%rsp)
140747515:     	movl	%eax, 0x98(%rsp)
14074751c:     	movl	%ebx, 0x9c(%rsp)
140747523:     	movq	%r14, 0xa0(%rsp)
14074752b:     	movq	%r14, 0x20(%rsp)
140747530:     	leaq	0x40(%rsp), %rdx
140747535:     	callq	0x14070f550 <.text+0x70e550>
14074753a:     	movl	%ebx, (%rsi)
14074753c:     	movq	$-0x3, (%rdi)
140747543:     	movq	%rdi, %rax
140747546:     	addq	$0xa8, %rsp
14074754d:     	popq	%rbx
14074754e:     	popq	%rbp
14074754f:     	popq	%rdi
140747550:     	popq	%rsi
140747551:     	popq	%r12
140747553:     	popq	%r13
140747555:     	popq	%r14
140747557:     	popq	%r15
140747559:     	retq
14074755a:     	leaq	0x52aebbf(%rip), %rcx   # 0x1459f6120
140747561:     	leaq	0x52aec18(%rip), %r8    # 0x1459f6180
140747568:     	movl	$0x59, %edx
14074756d:     	callq	0x1458e74d0 <.text+0x58e64d0>
140747572:     	ud2
140747574:     	addq	$0x8, %rsi
140747578:     	leaq	0x52aec89(%rip), %rax   # 0x1459f6208
14074757f:     	movq	%rax, 0x28(%rsp)
140747584:     	movq	$0xdf, 0x20(%rsp)
14074758d:     	leaq	0x52aec04(%rip), %r9    # 0x1459f6198
140747594:     	leaq	0x40(%rsp), %r8
140747599:     	xorl	%ecx, %ecx
14074759b:     	movq	%rsi, %rdx
14074759e:     	callq	0x14589fabd <.text+0x589eabd>
1407475a3:     	ud2
1407475a5:     	addq	$0x4, %rsi
1407475a9:     	movq	%rsi, 0x40(%rsp)
1407475ae:     	leaq	0x48b19fb(%rip), %rax   # 0x144ff8fb0 <.text+0x4ff7fb0>
1407475b5:     	movq	%rax, 0x48(%rsp)
1407475ba:     	leaq	0x3f(%rsp), %rcx
1407475bf:     	movq	%rcx, 0x50(%rsp)
1407475c4:     	movq	%rax, 0x58(%rsp)
1407475c9:     	leaq	0x52adece(%rip), %rcx   # 0x1459f549e
1407475d0:     	leaq	0x52adef9(%rip), %r8    # 0x1459f54d0
1407475d7:     	leaq	0x40(%rsp), %rdx
1407475dc:     	callq	0x1458e7790 <.text+0x58e6790>
1407475e1:     	ud2
