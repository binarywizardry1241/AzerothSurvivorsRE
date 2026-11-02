
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c51eb:     	movq	0x770(%rsi), %rax
1454c51f2:     	movq	0x778(%rsi), %rcx
1454c51f9:     	shlq	$0x4, %rcx
1454c51fd:     	xorl	%r8d, %r8d
1454c5200:     	cmpq	%r8, %rcx
1454c5203:     	je	0x1454c5984 <.text+0x54c4984>
1454c5209:     	leaq	0x10(%r8), %rdx
1454c520d:     	cmpq	%rdi, (%rax,%r8)
1454c5211:     	movq	%rdx, %r8
1454c5214:     	jne	0x1454c5200 <.text+0x54c4200>
1454c5216:     	movss	-0x8(%rax,%rdx), %xmm0
1454c521c:     	movss	0x42625c(%rip), %xmm7   # 0x1458eb480
1454c5224:     	ucomiss	%xmm0, %xmm7
1454c5227:     	ja	0x1454c5984 <.text+0x54c4984>
1454c522d:     	addss	0x4262c7(%rip), %xmm0   # 0x1458eb4fc
1454c5235:     	movss	%xmm0, -0x8(%rax,%rdx)
1454c523b:     	movq	0x2a0(%rsi), %rcx
1454c5242:     	testq	%rcx, %rcx
1454c5245:     	je	0x1454c5984 <.text+0x54c4984>
1454c524b:     	movq	0x298(%rsi), %rax
1454c5252:     	imulq	$0x58, %rcx, %rdx
1454c5256:     	xorl	%ecx, %ecx
1454c5258:     	movabsq	$0x665f656972656166, %r8 # imm = 0x665F656972656166
1454c5262:     	movabsq	$0x657269665f656972, %r9 # imm = 0x657269665F656972
1454c526c:     	jmp	0x1454c527b <.text+0x54c427b>
1454c526e:     	addq	$0x58, %rcx
1454c5272:     	cmpq	%rcx, %rdx
1454c5275:     	je	0x1454c5984 <.text+0x54c4984>
1454c527b:     	movq	(%rax,%rcx), %r14
1454c527f:     	cmpq	$0xb, 0x8(%r14)
1454c5284:     	jne	0x1454c526e <.text+0x54c426e>
1454c5286:     	movq	(%r14), %r10
1454c5289:     	movq	(%r10), %r11
1454c528c:     	xorq	%r8, %r11
1454c528f:     	movq	0x3(%r10), %r10
1454c5293:     	xorq	%r9, %r10
1454c5296:     	orq	%r11, %r10
1454c5299:     	jne	0x1454c526e <.text+0x54c426e>
1454c529b:     	movl	0x8(%rax,%rcx), %edx
1454c529f:     	movss	0x14(%rax,%rcx), %xmm0
1454c52a5:     	movl	0x18(%rax,%rcx), %r8d
1454c52aa:     	movl	0x34(%rax,%rcx), %r9d
1454c52af:     	movl	%r9d, 0x124(%rbp)
1454c52b6:     	movups	0x24(%rax,%rcx), %xmm1
1454c52bb:     	movups	%xmm1, 0x114(%rbp)
1454c52c2:     	movups	0x38(%rax,%rcx), %xmm1
1454c52c7:     	movups	0x44(%rax,%rcx), %xmm2
1454c52cc:     	movups	%xmm1, 0x128(%rbp)
1454c52d3:     	movups	%xmm2, 0x134(%rbp)
1454c52da:     	movq	%r14, 0xf0(%rbp)
1454c52e1:     	movl	%edx, 0xf8(%rbp)
1454c52e7:     	movss	0x10(%rax,%rcx), %xmm8
1454c52ee:     	movsd	0xc(%rax,%rcx), %xmm1
1454c52f4:     	movsd	%xmm1, 0xfc(%rbp)
1454c52fc:     	movss	%xmm0, 0x104(%rbp)
1454c5304:     	movl	%r8d, 0x108(%rbp)
1454c530b:     	movsd	0x1c(%rax,%rcx), %xmm0
1454c5311:     	movsd	%xmm0, 0x10c(%rbp)
1454c5319:     	movss	0x8e4(%rsi), %xmm2
1454c5321:     	movq	$-0x160, %rax           # imm = 0xFEA0
1454c5328:     	addq	0x4c8(%rsi), %rax
1454c532f:     	imulq	$0x160, 0x4d0(%rsi), %rcx # imm = 0x160
1454c533a:     	testq	%rcx, %rcx
1454c533d:     	je	0x1454c5984 <.text+0x54c4984>
1454c5343:     	leaq	0x160(%rax), %rdx
1454c534a:     	addq	$-0x160, %rcx           # imm = 0xFEA0
1454c5351:     	cmpq	%rdi, 0x1e8(%rax)
1454c5358:     	movq	%rdx, %rax
1454c535b:     	jne	0x1454c533a <.text+0x54c433a>
1454c535d:     	leaq	0xbc(%rbp), %rcx
1454c5364:     	callq	0x14540d200 <.text+0x540c200>
1454c5369:     	movl	0xc4(%rbp), %eax
1454c536f:     	movl	%eax, 0x8(%rbp)
1454c5372:     	movq	0xbc(%rbp), %rax
1454c5379:     	movq	%rax, (%rbp)
1454c537d:     	leaq	0x458(%rsi), %rdx
1454c5384:     	movss	0x458(%rsi), %xmm12
1454c538d:     	movzbl	0x75(%r14), %eax
1454c5392:     	addb	$-0x2, %al
1454c5394:     	cmpb	$0x6, %al
1454c5396:     	ja	0x1454c53a7 <.text+0x54c43a7>
1454c5398:     	movzbl	%al, %eax
1454c539b:     	leaq	0x14e76fa(%rip), %rcx   # 0x1469aca9c
1454c53a2:     	movss	(%rcx,%rax,4), %xmm7
1454c53a7:     	movss	0x128(%rbp), %xmm15
1454c53b0:     	movss	0x45c(%rsi), %xmm13
1454c53b9:     	movss	0x44(%r14), %xmm14
1454c53bf:     	mulss	0x13c(%rbp), %xmm12
1454c53c8:     	leaq	0xf0(%rbp), %rcx
1454c53cf:     	callq	0x1454f96d0 <.text+0x54f86d0>
1454c53d4:     	movq	%rdi, 0x88(%rbp)
1454c53db:     	movb	$0x1, 0x176(%rbp)
1454c53e2:     	leaq	0x88(%rbp), %rax
1454c53e9:     	movq	%rax, 0x20(%rsp)
1454c53ee:     	movq	$0x1, 0x28(%rsp)
1454c53f7:     	leaq	0xb8(%rbp), %rcx
1454c53fe:     	movq	%rbp, %r8
1454c5401:     	movq	%rsi, %rdx
1454c5404:     	movaps	%xmm0, %xmm3
1454c5407:     	callq	0x1454ee0d0 <.text+0x54ed0d0>
1454c540c:     	nop
1454c540d:     	movl	%r15d, 0xb0(%rbp)
1454c5414:     	movaps	%xmm8, %xmm0
1454c5418:     	mulss	%xmm15, %xmm0
1454c541d:     	sqrtss	%xmm0, %xmm0
1454c5421:     	mulss	0x4311ff(%rip), %xmm0   # 0x1458f6628
1454c5429:     	minss	0x4379bb(%rip), %xmm0   # 0x1458fcdec
1454c5431:     	mulss	%xmm6, %xmm0
1454c5435:     	xorps	%xmm1, %xmm1
1454c5438:     	cmpltss	%xmm14, %xmm1
1454c543e:     	andps	%xmm12, %xmm1
1454c5442:     	mulss	0x4338f5(%rip), %xmm14  # 0x1458f8d40
1454c544b:     	mulss	%xmm8, %xmm14
1454c5450:     	mulss	%xmm15, %xmm14
1454c5455:     	mulss	%xmm7, %xmm14
1454c545a:     	addss	%xmm1, %xmm14
1454c545f:     	mulss	%xmm14, %xmm13
1454c5464:     	movaps	%xmm0, %xmm1
1454c5467:     	minss	%xmm13, %xmm1
1454c546c:     	movaps	%xmm1, %xmm7
1454c546f:     	cmpunordss	%xmm1, %xmm7
1454c5474:     	movaps	%xmm7, %xmm2
1454c5477:     	andnps	%xmm1, %xmm2
1454c547a:     	andps	%xmm0, %xmm7
1454c547d:     	orps	%xmm2, %xmm7
1454c5480:     	movq	0xb8(%rbp), %rax
1454c5487:     	movq	%rax, 0x78(%rbp)
1454c548b:     	movq	0xc0(%rbp), %rdx
1454c5492:     	movq	0xc8(%rbp), %rax
1454c5499:     	xorl	%ecx, %ecx
1454c549b:     	cmpq	$0x1, %rax
1454c549f:     	setne	%cl
1454c54a2:     	testq	%rax, %rax
1454c54a5:     	leaq	0x8(,%rcx,8), %rcx
1454c54ad:     	cmoveq	%rax, %rcx
1454c54b1:     	addq	%rdx, %rcx
1454c54b4:     	movq	%rcx, 0xe8(%rbp)
1454c54bb:     	movq	%rdx, 0x40(%rbp)
1454c54bf:     	cmpq	0xe8(%rbp), %rdx
1454c54c6:     	movq	%rdx, 0x168(%rbp)
1454c54cd:     	je	0x1454c55fa <.text+0x54c45fa>
1454c54d3:     	movq	(%rdx), %r13
1454c54d6:     	movq	%r13, 0x158(%rbp)
1454c54dd:     	movq	%r13, 0x90(%rbp)
1454c54e4:     	movl	$0x0, 0x88(%rbp)
1454c54ee:     	movl	$0x0, 0x48(%rbp)
1454c54f5:     	leaq	0x48(%rbp), %rax
1454c54f9:     	movq	%rax, 0x30(%rsp)
1454c54fe:     	leaq	0x88(%rbp), %rax
1454c5505:     	movq	%rax, 0x28(%rsp)
1454c550a:     	movq	$0x1, 0x20(%rsp)
1454c5513:     	leaq	0xb8(%rbp), %rcx
1454c551a:     	movq	%rdi, %rdx
1454c551d:     	movl	$0x22d9, %r8d           # imm = 0x22D9
1454c5523:     	leaq	0x158(%rbp), %r9
1454c552a:     	callq	0x14544b1a0 <.text+0x544a1a0>
1454c552f:     	nop
1454c5530:     	movq	0x548(%rsi), %r15
1454c5537:     	cmpq	0x538(%rsi), %r15
1454c553e:     	jne	0x1454c554d <.text+0x54c454d>
1454c5540:     	leaq	0x538(%rsi), %rcx
1454c5547:     	callq	0x1457580b0 <.text+0x57570b0>
1454c554c:     	nop
1454c554d:     	movq	0x540(%rsi), %rax
1454c5554:     	movq	%r15, %rcx
1454c5557:     	shlq	$0x5, %rcx
1454c555b:     	movups	0xb8(%rbp), %xmm0
1454c5562:     	movups	0xc8(%rbp), %xmm1
1454c5569:     	movups	%xmm1, 0x10(%rax,%rcx)
1454c556e:     	movups	%xmm0, (%rax,%rcx)
1454c5572:     	incq	%r15
1454c5575:     	movq	%r15, 0x548(%rsi)
1454c557c:     	movl	0x40(%r14), %r9d
1454c5580:     	movzbl	0x74(%r14), %eax
1454c5585:     	movb	0x111(%rsi), %r15b
1454c558c:     	movb	$0x3, 0x111(%rsi)
1454c5593:     	movups	0x20(%rsi), %xmm8
1454c5598:     	movups	0x40(%rsi), %xmm12
1454c559d:     	movq	$0x0, 0x20(%rsi)
1454c55a5:     	movq	$0x0, 0x40(%rsi)
1454c55ad:     	movb	%al, 0x20(%rsp)
1454c55b1:     	movb	$0x0, 0x30(%rsp)
1454c55b6:     	movb	$0x0, 0x28(%rsp)
1454c55bb:     	movq	%rsi, %rcx
1454c55be:     	movq	%r13, %rdx
1454c55c1:     	movaps	%xmm7, %xmm2
1454c55c4:     	callq	0x1454c2eb0 <.text+0x54c1eb0>
1454c55c9:     	nop
1454c55ca:     	movq	0x168(%rbp), %rdx
1454c55d1:     	addq	$0x8, %rdx
1454c55d5:     	movb	%r15b, 0x111(%rsi)
1454c55dc:     	movups	%xmm8, 0x20(%rsi)
1454c55e1:     	movups	%xmm12, 0x40(%rsi)
1454c55e6:     	cmpq	0xe8(%rbp), %rdx
1454c55ed:     	movq	%rdx, 0x168(%rbp)
1454c55f4:     	jne	0x1454c54d3 <.text+0x54c44d3>
1454c55fa:     	movq	0x700(%rsi), %r15
1454c5601:     	testq	%r15, %r15
1454c5604:     	je	0x1454c5961 <.text+0x54c4961>
1454c560a:     	movq	(%r14), %rax
1454c560d:     	movq	%rax, 0x70(%rbp)
1454c5611:     	movq	0x8(%r14), %r8
1454c5615:     	movq	0x6f8(%rsi), %r13
1454c561c:     	addq	$0x10, %r13
1454c5620:     	movss	0x431053(%rip), %xmm8   # 0x1458f667c
1454c5629:     	movq	%r8, -0x8(%rbp)
1454c562d:     	jmp	0x1454c5640 <.text+0x54c4640>
1454c562f:     	movq	-0x8(%rbp), %r8
1454c5633:     	addq	$0x40, %r13
1454c5637:     	decq	%r15
1454c563a:     	je	0x1454c5954 <.text+0x54c4954>
1454c5640:     	cmpb	$0xd, -0x10(%r13)
1454c5645:     	jne	0x1454c5633 <.text+0x54c4633>
1454c5647:     	cmpq	%r8, (%r13)
1454c564b:     	jne	0x1454c5633 <.text+0x54c4633>
1454c564d:     	movq	-0x8(%r13), %rcx
1454c5651:     	movq	0x70(%rbp), %rdx
1454c5655:     	callq	0x145756dd7 <.text+0x5755dd7>
1454c565a:     	testl	%eax, %eax
1454c565c:     	jne	0x1454c562f <.text+0x54c462f>
1454c565e:     	addss	-0xc(%r13), %xmm8
1454c5664:     	jmp	0x1454c562f <.text+0x54c462f>
1454c5666:     	testl	%r8d, %r8d
1454c5669:     	jne	0x1454c5687 <.text+0x54c4687>
1454c566b:     	movb	$0x1, 0x176(%rbp)
1454c5672:     	movq	%rsi, %rcx
1454c5675:     	movq	%rdi, %rdx
1454c5678:     	movl	$0x76, %r8d
1454c567e:     	xorl	%r9d, %r9d
1454c5681:     	callq	0x1454d13a0 <.text+0x54d03a0>
1454c5686:     	nop
