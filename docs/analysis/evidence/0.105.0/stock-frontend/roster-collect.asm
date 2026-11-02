
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458df270:     	pushq	%rbp
1458df271:     	pushq	%r15
1458df273:     	pushq	%r14
1458df275:     	pushq	%r12
1458df277:     	pushq	%rsi
1458df278:     	pushq	%rdi
1458df279:     	pushq	%rbx
1458df27a:     	subq	$0x80, %rsp
1458df281:     	leaq	0x80(%rsp), %rbp
1458df289:     	movq	$-0x2, -0x8(%rbp)
1458df291:     	movq	(%r8), %rax
1458df294:     	movq	0x8(%r8), %r9
1458df298:     	cmpq	%rdx, %rcx
1458df29b:     	je	0x1458df365 <.text+0x58de365>
1458df2a1:     	movq	%rcx, %rsi
1458df2a4:     	movq	%rax, -0x18(%rbp)
1458df2a8:     	subq	%rcx, %rdx
1458df2ab:     	shrq	$0x3, %rdx
1458df2af:     	movabsq	$0x2492492492492493, %rcx # imm = 0x2492492492492493
1458df2b9:     	movq	%rdx, %rax
1458df2bc:     	mulq	%rcx
1458df2bf:     	movq	%rdx, %rdi
1458df2c2:     	leaq	-0x25(%rbp), %r14
1458df2c6:     	movq	%r9, -0x10(%rbp)
1458df2ca:     	imulq	$0x38, %r9, %r15
1458df2ce:     	addq	0x10(%r8), %r15
1458df2d2:     	negq	%rdi
1458df2d5:     	xorl	%eax, %eax
1458df2d7:     	leaq	-0x58(%rbp), %rbx
1458df2db:     	nopl	(%rax,%rax)
1458df2e0:     	movq	%rax, -0x20(%rbp)
1458df2e4:     	movq	0x18(%rsi), %r12
1458df2e8:     	movq	%rbx, %rcx
1458df2eb:     	movq	%rsi, %rdx
1458df2ee:     	callq	0x145b9c990 <.text+0x5b9b990>
1458df2f3:     	nop
1458df2f4:     	movzwl	0x30(%rsi), %eax
1458df2f8:     	movzbl	0x32(%rsi), %ecx
1458df2fc:     	movzbl	0x37(%rsi), %edx
1458df300:     	movb	%dl, 0x4(%r14)
1458df304:     	movl	0x33(%rsi), %edx
1458df307:     	movl	%edx, (%r14)
1458df30a:     	movq	%r12, -0x40(%rbp)
1458df30e:     	movw	%ax, -0x28(%rbp)
1458df312:     	movb	%cl, -0x26(%rbp)
1458df315:     	movups	0x20(%rsi), %xmm0
1458df319:     	movups	%xmm0, -0x38(%rbp)
1458df31d:     	movq	-0x28(%rbp), %rax
1458df321:     	movq	%rax, 0x30(%r15)
1458df325:     	movq	-0x48(%rbp), %rax
1458df329:     	movq	%rax, 0x10(%r15)
1458df32d:     	movq	-0x40(%rbp), %rax
1458df331:     	movq	%rax, 0x18(%r15)
1458df335:     	movups	-0x58(%rbp), %xmm0
1458df339:     	movups	%xmm0, (%r15)
1458df33d:     	movups	-0x38(%rbp), %xmm0
1458df341:     	movups	%xmm0, 0x20(%r15)
1458df346:     	movq	-0x20(%rbp), %rax
1458df34a:     	decq	%rax
1458df34d:     	addq	$0x38, %r15
1458df351:     	addq	$0x38, %rsi
1458df355:     	cmpq	%rax, %rdi
1458df358:     	jne	0x1458df2e0 <.text+0x58de2e0>
1458df35a:     	movq	-0x10(%rbp), %r9
1458df35e:     	subq	%rax, %r9
1458df361:     	movq	-0x18(%rbp), %rax
1458df365:     	movq	%r9, (%rax)
1458df368:     	addq	$0x80, %rsp
1458df36f:     	popq	%rbx
1458df370:     	popq	%rdi
1458df371:     	popq	%rsi
1458df372:     	popq	%r12
1458df374:     	popq	%r14
1458df376:     	popq	%r15
1458df378:     	popq	%rbp
1458df379:     	retq
