
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14016d2b5:     	movq	0x60(%rsp), %r8
14016d2ba:     	addq	%rdx, %r8
14016d2bd:     	addq	0x78(%rsp), %rdx
14016d2c2:     	testb	$0x1, 0x28(%rsp)
14016d2c7:     	movl	$0x0, %r9d
14016d2cd:     	cmoveq	%r9, %rdx
14016d2d1:     	cmpb	$0x0, (%r8)
14016d2d5:     	jne	0x14016cdd7 <.text+0x16bdd7>
14016d2db:     	testb	$0x1, 0x30(%rsp)
14016d2e0:     	jne	0x14016d3a5 <.text+0x16c3a5>
14016d2e6:     	testq	%rdx, %rdx
14016d2e9:     	jne	0x14016d3c4 <.text+0x16c3c4>
14016d2ef:     	movl	0x54(%rsp), %edx
14016d2f3:     	movq	0x70(%rsp), %r8
14016d2f8:     	movl	%edx, (%r8)
14016d2fb:     	movq	0x68(%rsp), %rdx
14016d300:     	movb	$0x0, 0x31(%rdx)
14016d304:     	testb	$0x1, 0x48(%rsp)
14016d309:     	jne	0x14016d502 <.text+0x16c502>
14016d30f:     	testb	$0x1, 0x58(%rsp)
14016d314:     	jne	0x14016d564 <.text+0x16c564>
14016d31a:     	movl	0x3c(%rsp), %r8d
14016d31f:     	cmpb	0x40(%rsp), %r8b
14016d324:     	setne	%dl
14016d327:     	orb	%r8b, %dl
14016d32a:     	movl	$0x0, 0x58(%rsp)
14016d332:     	movl	$0x0, 0x48(%rsp)
14016d33a:     	movl	$0x0, 0x30(%rsp)
14016d342:     	testb	$0x1, %dl
14016d345:     	je	0x14016cdd7 <.text+0x16bdd7>
14016d34b:     	xorpd	%xmm0, %xmm0
14016d34f:     	movq	0x68(%rsp), %rdx
14016d354:     	testb	$0x1, (%rdx)
14016d357:     	je	0x14016d35e <.text+0x16c35e>
14016d359:     	movsd	0x4(%rdx), %xmm0
14016d35e:     	movaps	%xmm6, %xmm1
14016d361:     	movlhps	%xmm0, %xmm1            # xmm1 = xmm1[0],xmm0[0]
14016d364:     	movsd	0x28(%rdx), %xmm0
14016d369:     	movl	0x54(%rsp), %r8d
14016d36e:     	movq	0x70(%rsp), %r9
14016d373:     	movl	%r8d, (%r9)
14016d376:     	movups	%xmm1, 0xc(%rdx)
14016d37a:     	movsd	%xmm0, 0x1c(%rdx)
14016d37f:     	movl	0x40(%rsp), %r8d
14016d384:     	movb	%r8b, 0x24(%rdx)
14016d388:     	movl	$0x0, 0x58(%rsp)
14016d390:     	movl	$0x0, 0x48(%rsp)
14016d398:     	movl	$0x0, 0x30(%rsp)
14016d3a0:     	jmp	0x14016cdd7 <.text+0x16bdd7>
14016d3a5:     	movq	0x68(%rsp), %rcx
14016d3aa:     	movzbl	0x31(%rcx), %eax
14016d3ae:     	movl	0x54(%rsp), %edx
14016d3b2:     	movq	0x70(%rsp), %r8
14016d3b7:     	movl	%edx, (%r8)
14016d3ba:     	xorb	$0x1, %al
14016d3bc:     	movb	%al, 0x31(%rcx)
14016d3bf:     	jmp	0x14016d540 <.text+0x16c540>
14016d3c4:     	movzbl	(%rdx), %ebp
14016d3c7:     	movl	0x54(%rsp), %eax
14016d3cb:     	movq	0x70(%rsp), %rcx
14016d3d0:     	movl	%eax, (%rcx)
14016d3d2:     	movq	0x68(%rsp), %rax
14016d3d7:     	movb	$0x0, 0x31(%rax)
14016d3db:     	cmpb	%bpl, 0x32(%rax)
14016d3df:     	je	0x14016d540 <.text+0x16c540>
14016d3e5:     	movl	0x54(%rsp), %eax
14016d3e9:     	movq	0x70(%rsp), %rcx
14016d3ee:     	movl	%eax, (%rcx)
14016d3f0:     	movq	0x68(%rsp), %rcx
14016d3f5:     	movb	%bpl, 0x32(%rcx)
14016d3f9:     	callq	0x1401661e0 <.text+0x1651e0>
14016d3fe:     	leaq	0x90(%rsp), %rcx
14016d406:     	leaq	0x120(%rsp), %rdx
14016d40e:     	callq	0x140165cd0 <.text+0x164cd0>
14016d413:     	movq	0x90(%rsp), %rsi
14016d41b:     	testq	%rsi, %rsi
14016d41e:     	je	0x14016d4b7 <.text+0x16c4b7>
14016d424:     	movq	0xa0(%rsp), %r12
14016d42c:     	movl	0xac(%rsp), %r13d
14016d434:     	movl	%ebp, %ecx
14016d436:     	callq	0x140164fa0 <.text+0x163fa0>
14016d43b:     	movq	%rax, %r15
14016d43e:     	movq	%rdx, %rdi
14016d441:     	movq	$0x1, 0x20(%rsp)
14016d44a:     	leaq	0xd8(%rsp), %rcx
14016d452:     	movl	$0x1, %r9d
14016d458:     	xorl	%r8d, %r8d
14016d45b:     	callq	0x14023ff50 <.text+0x23ef50>
14016d460:     	movq	0xe0(%rsp), %rbx
14016d468:     	cmpl	$0x1, 0xd8(%rsp)
14016d470:     	je	0x14016d5a4 <.text+0x16c5a4>
14016d476:     	movq	0xe8(%rsp), %r14
14016d47e:     	testq	%rdi, %rdi
14016d481:     	je	0x14016d491 <.text+0x16c491>
14016d483:     	movq	%r14, %rcx
14016d486:     	movq	%r15, %rdx
14016d489:     	movq	%rdi, %r8
14016d48c:     	callq	0x145bc977b <.text+0x5bc877b>
14016d491:     	movl	%r13d, (%r12)
14016d495:     	movq	(%rsi), %rdx
14016d498:     	testq	%rdx, %rdx
14016d49b:     	je	0x14016d4ac <.text+0x16c4ac>
14016d49d:     	movq	0x8(%rsi), %rcx
14016d4a1:     	movl	$0x1, %r8d
14016d4a7:     	callq	0x1400021d0 <.text+0x11d0>
14016d4ac:     	movq	%rbx, (%rsi)
14016d4af:     	movq	%r14, 0x8(%rsi)
14016d4b3:     	movq	%rdi, 0x10(%rsi)
14016d4b7:     	leaq	0x90(%rsp), %rcx
14016d4bf:     	leaq	0x150(%rsp), %rdx
14016d4c7:     	callq	0x140165af0 <.text+0x164af0>
14016d4cc:     	movq	0x90(%rsp), %rax
14016d4d4:     	testq	%rax, %rax
14016d4d7:     	je	0x14016d540 <.text+0x16c540>
14016d4d9:     	movq	0xa0(%rsp), %rcx
14016d4e1:     	movl	0xac(%rsp), %edx
14016d4e8:     	xorl	%r8d, %r8d
14016d4eb:     	cmpb	$0x2, %bpl
14016d4ef:     	sete	%r8b
14016d4f3:     	leal	(%r8,%r8,2), %r8d
14016d4f7:     	movl	%edx, (%rcx)
14016d4f9:     	movb	%r8b, 0x175(%rax)
14016d500:     	jmp	0x14016d540 <.text+0x16c540>
14016d502:     	movl	0x1a4(%rsp), %eax
14016d509:     	movq	0x198(%rsp), %rcx
14016d511:     	movl	%eax, (%rcx)
14016d513:     	movq	0x188(%rsp), %rax
14016d51b:     	movb	$0x1, 0x48(%rax)
14016d51f:     	movl	0x1c4(%rsp), %eax
14016d526:     	movq	0x1b8(%rsp), %rcx
14016d52e:     	movl	%eax, (%rcx)
14016d530:     	movq	0x1a8(%rsp), %rax
14016d538:     	movq	$0x0, 0x10(%rax)
14016d540:     	movaps	0x200(%rsp), %xmm6
14016d548:     	movaps	0x210(%rsp), %xmm7
14016d550:     	addq	$0x228, %rsp            # imm = 0x228
14016d557:     	popq	%rbx
14016d558:     	popq	%rbp
14016d559:     	popq	%rdi
14016d55a:     	popq	%rsi
14016d55b:     	popq	%r12
14016d55d:     	popq	%r13
14016d55f:     	popq	%r14
14016d561:     	popq	%r15
14016d563:     	retq
14016d564:     	movq	0x68(%rsp), %rcx
14016d569:     	movb	$0x0, 0x30(%rcx)
14016d56d:     	movl	0x54(%rsp), %eax
14016d571:     	movq	0x70(%rsp), %rdx
14016d576:     	movl	%eax, (%rdx)
14016d578:     	movb	$0x2, 0x24(%rcx)
14016d57c:     	movaps	0x200(%rsp), %xmm6
14016d584:     	movaps	0x210(%rsp), %xmm7
14016d58c:     	addq	$0x228, %rsp            # imm = 0x228
14016d593:     	popq	%rbx
14016d594:     	popq	%rbp
14016d595:     	popq	%rdi
14016d596:     	popq	%rsi
14016d597:     	popq	%r12
14016d599:     	popq	%r13
14016d59b:     	popq	%r14
14016d59d:     	popq	%r15
