
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14546f110:     	pushq	%rbp
14546f111:     	pushq	%r15
14546f113:     	pushq	%r14
14546f115:     	pushq	%r13
14546f117:     	pushq	%r12
14546f119:     	pushq	%rsi
14546f11a:     	pushq	%rdi
14546f11b:     	pushq	%rbx
14546f11c:     	subq	$0x188, %rsp            # imm = 0x188
14546f123:     	leaq	0x80(%rsp), %rbp
14546f12b:     	movq	$-0x2, 0x100(%rbp)
14546f136:     	movq	%rcx, %rsi
14546f139:     	leal	-0x15f91(%rdx), %ecx
14546f13f:     	cmpl	$0x18, %ecx
14546f142:     	setb	%al
14546f145:     	movl	$0xfffc3f, %r8d         # imm = 0xFFFC3F
14546f14b:     	shrl	%cl, %r8d
14546f14e:     	andb	%al, %r8b
14546f151:     	cmpb	$0x1, %r8b
14546f155:     	jne	0x14546f1fa <.text+0x546e1fa>
14546f15b:     	movl	%ecx, %eax
14546f15d:     	leaq	0x156866c(%rip), %rcx   # 0x1469d77d0
14546f164:     	movq	(%rcx,%rax,8), %r13
14546f168:     	leaq	0x30(%r13), %rax
14546f16c:     	movl	0x30(%r13), %r12d
14546f170:     	movq	%rax, 0xb8(%rbp)
14546f177:     	leaq	0x2cb2d2(%rip), %rax    # 0x14573a450 <.text+0x5739450>
14546f17e:     	movq	%rax, 0xc0(%rbp)
14546f185:     	leaq	0x15636f4(%rip), %rdx   # 0x1469d2880
14546f18c:     	leaq	0x10(%rbp), %rcx
14546f190:     	leaq	0xb8(%rbp), %r8
14546f197:     	callq	0x145728390 <.text+0x5727390>
14546f19c:     	movq	0x18(%rbp), %rcx
14546f1a0:     	movq	0x20(%rbp), %rdx
14546f1a4:     	movq	(%r13), %rbx
14546f1a8:     	movq	0x8(%r13), %r15
14546f1ac:     	movq	%rcx, 0xf0(%rbp)
14546f1b3:     	callq	0x145457cb0 <.text+0x5456cb0>
14546f1b8:     	nop
14546f1b9:     	movq	%rax, %r14
14546f1bc:     	movq	%rdx, %rdi
14546f1bf:     	movq	0x10(%rbp), %rdx
14546f1c3:     	testq	%rdx, %rdx
14546f1c6:     	je	0x14546f1da <.text+0x546e1da>
14546f1c8:     	movl	$0x1, %r8d
14546f1ce:     	movq	0xf0(%rbp), %rcx
14546f1d5:     	callq	0x1400021d0 <.text+0x11d0>
14546f1da:     	testq	%r14, %r14
14546f1dd:     	cmovneq	%r14, %rbx
14546f1e1:     	cmoveq	%r15, %rdi
14546f1e5:     	testq	%rdi, %rdi
14546f1e8:     	jns	0x14546f225 <.text+0x546e225>
14546f1ea:     	xorl	%r15d, %r15d
14546f1ed:     	movq	%r15, %rcx
14546f1f0:     	movq	%rdi, %rdx
14546f1f3:     	callq	0x14590379b <.text+0x590279b>
14546f1f8:     	ud2
14546f1fa:     	leal	-0x1(%rdx), %eax
14546f1fd:     	cmpl	$0x1869f, %eax          # imm = 0x1869F
14546f202:     	jae	0x14546f211 <.text+0x546e211>
14546f204:     	movq	%rsi, %rcx
14546f207:     	callq	0x14546e6c0 <.text+0x546d6c0>
14546f20c:     	jmp	0x14546f3b0 <.text+0x546e3b0>
14546f211:     	cmpl	$0x186a0, %edx          # imm = 0x186A0
14546f217:     	jae	0x14546f25e <.text+0x546e25e>
14546f219:     	movq	$-0x1, (%rsi)
14546f220:     	jmp	0x14546f3b0 <.text+0x546e3b0>
14546f225:     	je	0x14546f349 <.text+0x546e349>
14546f22b:     	callq	0x140002200 <.text+0x1200>
14546f230:     	movl	$0x1, %r15d
14546f236:     	movl	$0x1, %edx
14546f23b:     	movq	%rdi, %rcx
14546f23e:     	callq	0x1400021c0 <.text+0x11c0>
14546f243:     	testq	%rax, %rax
14546f246:     	je	0x14546f1ed <.text+0x546e1ed>
14546f248:     	movq	%rax, %r14
14546f24b:     	movq	%rax, %rcx
14546f24e:     	movq	%rbx, %rdx
14546f251:     	movq	%rdi, %r8
14546f254:     	callq	0x1457731ed <.text+0x57721ed>
14546f259:     	jmp	0x14546f34f <.text+0x546e34f>
14546f25e:     	leal	-0x186a0(%rdx), %eax
14546f264:     	imulq	$0x51eb851f, %rax, %r12 # imm = 0x51EB851F
14546f26b:     	shrq	$0x25, %r12
14546f26f:     	imulq	$0x1999999a, %r12, %rcx # imm = 0x1999999A
14546f276:     	shrq	$0x20, %rcx
14546f27a:     	addl	%ecx, %ecx
14546f27c:     	leal	(%rcx,%rcx,4), %ecx
14546f27f:     	subl	%ecx, %r12d
14546f282:     	movq	%r12, -0x40(%rbp)
14546f286:     	imull	$0xcccccccd, %eax, %ecx # imm = 0xCCCCCCCD
14546f28c:     	rorl	%ecx
14546f28e:     	cmpl	$0x19999999, %ecx       # imm = 0x19999999
14546f294:     	ja	0x14546f219 <.text+0x546e219>
14546f296:     	cmpl	$0x2edf, %eax           # imm = 0x2EDF
14546f29b:     	ja	0x14546f219 <.text+0x546e219>
14546f2a1:     	movl	$0xcccccccd, %r15d      # imm = 0xCCCCCCCD
14546f2a7:     	imulq	%rax, %r15
14546f2ab:     	shrq	$0x23, %r15
14546f2af:     	imulq	$0x1999999a, %r15, %rcx # imm = 0x1999999A
14546f2b6:     	shrq	$0x20, %rcx
14546f2ba:     	addl	%ecx, %ecx
14546f2bc:     	leal	(%rcx,%rcx,4), %ecx
14546f2bf:     	subl	%ecx, %r15d
14546f2c2:     	cmpl	$0x7, %r15d
14546f2c6:     	jae	0x14546f219 <.text+0x546e219>
14546f2cc:     	imulq	$0x10624dd3, %rax, %rdi # imm = 0x10624DD3
14546f2d3:     	shrq	$0x26, %rdi
14546f2d7:     	leal	-0x1(%rdi), %eax
14546f2da:     	cmpb	$0xa, %al
14546f2dc:     	ja	0x14546f219 <.text+0x546e219>
14546f2e2:     	movzbl	%al, %eax
14546f2e5:     	movl	$0x5df, %ecx            # imm = 0x5DF
14546f2ea:     	btl	%eax, %ecx
14546f2ed:     	jae	0x14546f219 <.text+0x546e219>
14546f2f3:     	leaq	0x1568826(%rip), %rcx   # 0x1469d7b20
14546f2fa:     	movq	(%rcx,%rax,8), %rbx
14546f2fe:     	cmpl	$0x6, %r15d
14546f302:     	movl	$0x5, %eax
14546f307:     	cmovnel	%r15d, %eax
14546f30b:     	movq	%rax, 0xd0(%rbp)
14546f312:     	cmpl	$0x5, %eax
14546f315:     	jne	0x14546f3c7 <.text+0x546e3c7>
14546f31b:     	movq	%rdx, %r14
14546f31e:     	movl	%edi, %ecx
14546f320:     	callq	0x1454704f0 <.text+0x546f4f0>
14546f325:     	testq	%rax, %rax
14546f328:     	je	0x14546f219 <.text+0x546e219>
14546f32e:     	movq	%rax, %r13
14546f331:     	xorl	%eax, %eax
14546f333:     	cmpl	$0x6, %r15d
14546f337:     	sete	%al
14546f33a:     	movq	%rax, 0xf0(%rbp)
14546f341:     	movq	%r14, %rdx
14546f344:     	jmp	0x14546f3ca <.text+0x546e3ca>
14546f349:     	movl	$0x1, %r14d
14546f34f:     	movl	0x34(%r13), %eax
14546f353:     	cmpq	$0x1, 0x20(%r13)
14546f358:     	movl	$0x2, %ecx
14546f35d:     	sbbq	$0x0, %rcx
14546f361:     	movq	%rdi, (%rsi)
14546f364:     	movq	%r14, 0x8(%rsi)
14546f368:     	movq	%rdi, 0x10(%rsi)
14546f36c:     	movq	$0x0, 0x18(%rsi)
14546f374:     	movq	$0x4, 0x20(%rsi)
14546f37c:     	movq	$0x0, 0x28(%rsi)
14546f384:     	movq	%rcx, 0x30(%rsi)
14546f388:     	movq	$0x0, 0x38(%rsi)
14546f390:     	movq	$0x0, 0x48(%rsi)
14546f398:     	movl	%r12d, 0x50(%rsi)
14546f39c:     	movl	%eax, 0x54(%rsi)
14546f39f:     	movaps	0x1562b5a(%rip), %xmm0  # 0x1469d1f00
14546f3a6:     	movups	%xmm0, 0x58(%rsi)
14546f3aa:     	movw	$0x12, 0x68(%rsi)
14546f3b0:     	movq	%rsi, %rax
14546f3b3:     	addq	$0x188, %rsp            # imm = 0x188
14546f3ba:     	popq	%rbx
14546f3bb:     	popq	%rdi
14546f3bc:     	popq	%rsi
14546f3bd:     	popq	%r12
14546f3bf:     	popq	%r13
14546f3c1:     	popq	%r14
14546f3c3:     	popq	%r15
14546f3c5:     	popq	%rbp
14546f3c6:     	retq
14546f3c7:     	xorl	%r13d, %r13d
14546f3ca:     	movq	$0x0, -0x30(%rbp)
14546f3d2:     	movq	$0x4, -0x28(%rbp)
14546f3da:     	movq	$0x0, -0x20(%rbp)
14546f3e2:     	cmpl	$0x8, %r12d
14546f3e6:     	jae	0x14546f7b0 <.text+0x546e7b0>
14546f3ec:     	movq	%rdx, -0x38(%rbp)
14546f3f0:     	movzbl	0x128(%rbx), %eax
14546f3f7:     	decb	%al
14546f3f9:     	movzbl	%al, %eax
14546f3fc:     	shll	$0x3, %eax
14546f3ff:     	leaq	0x156848a(%rip), %rcx   # 0x1469d7890
14546f406:     	movq	(%rax,%rcx), %rcx
14546f40a:     	leaq	0x156849f(%rip), %rdx   # 0x1469d78b0
14546f411:     	movq	(%rax,%rdx), %rax
14546f415:     	movq	%rcx, 0x98(%rbp)
14546f41c:     	movq	%rax, 0xa0(%rbp)
14546f423:     	leaq	0x98(%rbp), %rax
14546f42a:     	movq	%rax, 0x10(%rbp)
14546f42e:     	leaq	-0x546d375(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14546f435:     	movq	%rax, 0x18(%rbp)
14546f439:     	leaq	-0x40(%rbp), %rax
14546f43d:     	movq	%rax, 0x20(%rbp)
14546f441:     	leaq	0x2cbef8(%rip), %rax    # 0x14573b340 <.text+0x573a340>
14546f448:     	movq	%rax, 0x28(%rbp)
14546f44c:     	movb	$0x1, 0xff(%rbp)
14546f453:     	movb	$0x1, 0xfe(%rbp)
14546f45a:     	leaq	0x1564b6d(%rip), %rdx   # 0x1469d3fce
14546f461:     	leaq	0xb8(%rbp), %rcx
14546f468:     	leaq	0x10(%rbp), %r8
14546f46c:     	callq	0x145728390 <.text+0x5727390>
14546f471:     	nop
14546f472:     	movq	%r13, -0x8(%rbp)
14546f476:     	movq	%rbx, 0xe0(%rbp)
14546f47d:     	movzbl	0x128(%rbx), %eax
14546f484:     	decb	%al
14546f486:     	movzbl	%al, %eax
14546f489:     	shll	$0x3, %eax
14546f48c:     	leaq	0x156843d(%rip), %rcx   # 0x1469d78d0
14546f493:     	movq	(%rax,%rcx), %rcx
14546f497:     	movq	%rcx, 0xe8(%rbp)
14546f49e:     	leaq	0x156844b(%rip), %rdx   # 0x1469d78f0
14546f4a5:     	movq	(%rax,%rdx), %rcx
14546f4a9:     	movq	%rcx, 0xd8(%rbp)
14546f4b0:     	leaq	0x1568459(%rip), %r8    # 0x1469d7910
14546f4b7:     	movq	(%rax,%r8), %rcx
14546f4bb:     	movq	%rcx, (%rbp)
14546f4bf:     	leaq	0x156846a(%rip), %r9    # 0x1469d7930
14546f4c6:     	movq	(%rax,%r9), %rcx
14546f4ca:     	movq	%rcx, 0x8(%rbp)
14546f4ce:     	leaq	0x156847b(%rip), %r10   # 0x1469d7950
14546f4d5:     	movq	(%rax,%r10), %rcx
14546f4d9:     	movq	%rcx, -0x18(%rbp)
14546f4dd:     	leaq	0x156848c(%rip), %r11   # 0x1469d7970
14546f4e4:     	movq	(%rax,%r11), %rcx
14546f4e8:     	movq	%rcx, -0x10(%rbp)
14546f4ec:     	leaq	0x156849d(%rip), %r14   # 0x1469d7990
14546f4f3:     	movq	(%rax,%r14), %r14
14546f4f7:     	leaq	0x15684b2(%rip), %r15   # 0x1469d79b0
14546f4fe:     	movq	(%rax,%r15), %r15
14546f502:     	leaq	0x15684c7(%rip), %r13   # 0x1469d79d0
14546f509:     	movq	(%rax,%r13), %r13
14546f50d:     	leaq	0x15684dc(%rip), %rbx   # 0x1469d79f0
14546f514:     	movq	(%rax,%rbx), %rbx
14546f518:     	leaq	0x15684f1(%rip), %rcx   # 0x1469d7a10
14546f51f:     	movq	(%rax,%rcx), %rcx
14546f523:     	leaq	0x1568506(%rip), %rdx   # 0x1469d7a30
14546f52a:     	movq	(%rax,%rdx), %rdx
14546f52e:     	leaq	0x156851b(%rip), %r8    # 0x1469d7a50
14546f535:     	movq	(%rax,%r8), %r8
14546f539:     	leaq	0x1568530(%rip), %r9    # 0x1469d7a70
14546f540:     	movq	(%rax,%r9), %r9
14546f544:     	leaq	0x1568545(%rip), %r10   # 0x1469d7a90
14546f54b:     	movq	(%rax,%r10), %r10
14546f54f:     	leaq	0x156855a(%rip), %r11   # 0x1469d7ab0
14546f556:     	movq	(%rax,%r11), %rax
14546f55a:     	movq	0xe8(%rbp), %r11
14546f561:     	movq	%r11, 0x10(%rbp)
14546f565:     	movq	0xd8(%rbp), %r11
14546f56c:     	movq	%r11, 0x18(%rbp)
14546f570:     	movq	(%rbp), %r11
14546f574:     	movq	%r11, 0x20(%rbp)
14546f578:     	movq	0x8(%rbp), %r11
14546f57c:     	movq	%r11, 0x28(%rbp)
14546f580:     	movq	-0x18(%rbp), %r11
14546f584:     	movq	%r11, 0x30(%rbp)
14546f588:     	movq	-0x10(%rbp), %r11
14546f58c:     	movq	%r11, 0x38(%rbp)
14546f590:     	movq	%r14, 0x40(%rbp)
14546f594:     	movq	%r15, 0x48(%rbp)
14546f598:     	movq	%r13, 0x50(%rbp)
14546f59c:     	movq	%rbx, 0x58(%rbp)
14546f5a0:     	movq	%rcx, 0x60(%rbp)
14546f5a4:     	movq	%rdx, 0x68(%rbp)
14546f5a8:     	movq	0xb8(%rbp), %rcx
14546f5af:     	movq	%rcx, 0xe8(%rbp)
14546f5b6:     	movq	%r8, 0x70(%rbp)
14546f5ba:     	movq	0xc0(%rbp), %rcx
14546f5c1:     	movq	%r9, 0x78(%rbp)
14546f5c5:     	movq	0xc8(%rbp), %rdx
14546f5cc:     	movq	%r10, 0x80(%rbp)
14546f5d3:     	movq	%rax, 0x88(%rbp)
14546f5da:     	movq	%r12, %rax
14546f5dd:     	shlq	$0x4, %rax
14546f5e1:     	movq	0x10(%rbp,%rax), %r15
14546f5e6:     	movq	0x18(%rbp,%rax), %r14
14546f5eb:     	movq	%rcx, 0xd8(%rbp)
14546f5f2:     	callq	0x145457cb0 <.text+0x5456cb0>
14546f5f7:     	nop
14546f5f8:     	testq	%rax, %rax
14546f5fb:     	cmovneq	%rax, %r15
14546f5ff:     	cmoveq	%r14, %rdx
14546f603:     	movq	%r15, -0x50(%rbp)
14546f607:     	movq	%rdx, -0x48(%rbp)
14546f60b:     	movq	0xe8(%rbp), %rdx
14546f612:     	testq	%rdx, %rdx
14546f615:     	movq	-0x8(%rbp), %rbx
14546f619:     	je	0x14546f62d <.text+0x546e62d>
14546f61b:     	movl	$0x1, %r8d
14546f621:     	movq	0xd8(%rbp), %rcx
14546f628:     	callq	0x1400021d0 <.text+0x11d0>
14546f62d:     	testq	%rbx, %rbx
14546f630:     	movq	0xe0(%rbp), %r14
14546f637:     	je	0x14546f900 <.text+0x546e900>
14546f63d:     	movq	0xf0(%rbp), %r15
14546f644:     	shlq	$0x4, %r15
14546f648:     	addq	%rbx, %r15
14546f64b:     	movq	%r15, 0xb8(%rbp)
14546f652:     	leaq	-0x546d599(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14546f659:     	movq	%rax, 0xc0(%rbp)
14546f660:     	movb	$0x1, 0xff(%rbp)
14546f667:     	movb	$0x1, 0xfe(%rbp)
14546f66e:     	leaq	0x156492e(%rip), %rdx   # 0x1469d3fa3
14546f675:     	leaq	0x10(%rbp), %rcx
14546f679:     	leaq	0xb8(%rbp), %r8
14546f680:     	callq	0x145728390 <.text+0x5727390>
14546f685:     	nop
14546f686:     	movq	0x10(%rbp), %rax
14546f68a:     	movq	%rax, 0xe8(%rbp)
14546f691:     	movq	0x18(%rbp), %rcx
14546f695:     	movq	0x20(%rbp), %rdx
14546f699:     	movq	(%r15), %r14
14546f69c:     	movq	0x8(%r15), %r15
14546f6a0:     	movq	%rcx, 0xd8(%rbp)
14546f6a7:     	callq	0x145457cb0 <.text+0x5456cb0>
14546f6ac:     	nop
14546f6ad:     	testq	%rax, %rax
14546f6b0:     	cmovneq	%rax, %r14
14546f6b4:     	cmoveq	%r15, %rdx
14546f6b8:     	movq	%r14, 0x98(%rbp)
14546f6bf:     	movq	%rdx, 0xa0(%rbp)
14546f6c6:     	movq	0xe8(%rbp), %rdx
14546f6cd:     	testq	%rdx, %rdx
14546f6d0:     	je	0x14546f6e4 <.text+0x546e6e4>
14546f6d2:     	movl	$0x1, %r8d
14546f6d8:     	movq	0xd8(%rbp), %rcx
14546f6df:     	callq	0x1400021d0 <.text+0x11d0>
14546f6e4:     	leaq	0x1566db5(%rip), %rax   # 0x1469d64a0
14546f6eb:     	movq	%rax, 0x10(%rbp)
14546f6ef:     	movq	$0x4, 0x18(%rbp)
14546f6f7:     	leaq	-0x50(%rbp), %rax
14546f6fb:     	movq	%rax, 0x20(%rbp)
14546f6ff:     	leaq	0x1566d7a(%rip), %rax   # 0x1469d6480
14546f706:     	movq	%rax, 0x28(%rbp)
14546f70a:     	leaq	0x1566d93(%rip), %rcx   # 0x1469d64a4
14546f711:     	movq	%rcx, 0x30(%rbp)
14546f715:     	movq	$0x3, 0x38(%rbp)
14546f71d:     	leaq	0x98(%rbp), %rcx
14546f724:     	movq	%rcx, 0x40(%rbp)
14546f728:     	movq	%rax, 0x48(%rbp)
14546f72c:     	movb	$0x1, 0xff(%rbp)
14546f733:     	movb	$0x1, 0xfe(%rbp)
14546f73a:     	movq	$0x2, 0x20(%rsp)
14546f743:     	leaq	0x1566d5d(%rip), %rdx   # 0x1469d64a7
14546f74a:     	leaq	0xb8(%rbp), %rcx
14546f751:     	leaq	0x10(%rbp), %r9
14546f755:     	movl	$0x10, %r8d
14546f75b:     	callq	0x145457c60 <.text+0x5456c60>
14546f760:     	nop
14546f761:     	movq	0xe0(%rbp), %r14
14546f768:     	movq	0xf0(%rbp), %rax
14546f76f:     	shlq	$0x5, %rax
14546f773:     	addq	%rax, %rbx
14546f776:     	movl	0x30(%rbx,%r12,4), %r8d
14546f77b:     	testl	%r8d, %r8d
14546f77e:     	jne	0x14546f788 <.text+0x546e788>
14546f780:     	movl	0xe8(%r14,%r12,4), %r8d
14546f788:     	movq	0xb8(%rbp), %rax
14546f78f:     	movq	%rax, 0xf0(%rbp)
14546f796:     	movq	0xc0(%rbp), %rdx
14546f79d:     	movq	0xc8(%rbp), %rax
14546f7a4:     	movq	%rax, 0xd8(%rbp)
14546f7ab:     	jmp	0x14546fb91 <.text+0x546eb91>
14546f7b0:     	leaq	-0x8(%r12), %rax
14546f7b5:     	cmpq	0x80(%rbx), %rax
14546f7bc:     	jae	0x14546f219 <.text+0x546e219>
14546f7c2:     	leaq	(%rax,%rax,8), %r15
14546f7c6:     	shlq	$0x4, %r15
14546f7ca:     	addq	0x78(%rbx), %r15
14546f7ce:     	testq	%r13, %r13
14546f7d1:     	je	0x14546f92d <.text+0x546e92d>
14546f7d7:     	cmpq	0x28(%r13), %rax
14546f7db:     	jae	0x14546f219 <.text+0x546e219>
14546f7e1:     	movq	%rdx, -0x38(%rbp)
14546f7e5:     	leaq	(%rax,%rax,2), %rax
14546f7e9:     	shlq	$0x4, %rax
14546f7ed:     	addq	0x20(%r13), %rax
14546f7f1:     	movq	0xf0(%rbp), %rcx
14546f7f8:     	leaq	(%rcx,%rcx,2), %rcx
14546f7fc:     	movl	(%rax,%rcx,8), %edx
14546f7ff:     	movl	%edx, 0xe8(%rbp)
14546f805:     	movups	0x8(%rax,%rcx,8), %xmm0
14546f80a:     	movups	%xmm0, 0x98(%rbp)
14546f811:     	leaq	0x98(%rbp), %rax
14546f818:     	movq	%rax, 0xb8(%rbp)
14546f81f:     	leaq	-0x546d766(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14546f826:     	movq	%rax, 0xc0(%rbp)
14546f82d:     	movb	$0x1, 0xff(%rbp)
14546f834:     	movb	$0x1, 0xfe(%rbp)
14546f83b:     	leaq	0x1564753(%rip), %rdx   # 0x1469d3f95
14546f842:     	leaq	0x10(%rbp), %rcx
14546f846:     	leaq	0xb8(%rbp), %r8
14546f84d:     	callq	0x145728390 <.text+0x5727390>
14546f852:     	nop
14546f853:     	movq	0x10(%rbp), %rax
14546f857:     	movq	%rax, 0xe0(%rbp)
14546f85e:     	movq	0x18(%rbp), %rcx
14546f862:     	movq	0x20(%rbp), %rdx
14546f866:     	movq	0x98(%rbp), %r14
14546f86d:     	movq	0xa0(%rbp), %rbx
14546f874:     	movq	%rcx, 0xd8(%rbp)
14546f87b:     	callq	0x145457cb0 <.text+0x5456cb0>
14546f880:     	nop
14546f881:     	testq	%rax, %rax
14546f884:     	cmovneq	%rax, %r14
14546f888:     	cmoveq	%rbx, %rdx
14546f88c:     	movq	%rdx, %rbx
14546f88f:     	movq	$0x1, 0x20(%rsp)
14546f898:     	leaq	0x10(%rbp), %rcx
14546f89c:     	movl	$0x1, %r9d
14546f8a2:     	xorl	%r8d, %r8d
14546f8a5:     	callq	0x140188f20 <.text+0x187f20>
14546f8aa:     	movq	0x18(%rbp), %rax
14546f8ae:     	movq	%rax, 0xf0(%rbp)
14546f8b5:     	cmpl	$0x1, 0x10(%rbp)
14546f8b9:     	je	0x1454700d5 <.text+0x546f0d5>
14546f8bf:     	movq	0x20(%rbp), %r13
14546f8c3:     	testq	%rbx, %rbx
14546f8c6:     	je	0x14546f8d6 <.text+0x546e8d6>
14546f8c8:     	movq	%r13, %rcx
14546f8cb:     	movq	%r14, %rdx
14546f8ce:     	movq	%rbx, %r8
14546f8d1:     	callq	0x1457731ed <.text+0x57721ed>
14546f8d6:     	movq	0xe0(%rbp), %rdx
14546f8dd:     	testq	%rdx, %rdx
14546f8e0:     	je	0x14546f8f4 <.text+0x546e8f4>
14546f8e2:     	movl	$0x1, %r8d
14546f8e8:     	movq	0xd8(%rbp), %rcx
14546f8ef:     	callq	0x1400021d0 <.text+0x11d0>
14546f8f4:     	movq	0xd0(%rbp), %rcx
14546f8fb:     	jmp	0x14546fdcb <.text+0x546edcb>
14546f900:     	movq	0xd0(%rbp), %rcx
14546f907:     	cmpq	$0x5, %rcx
14546f90b:     	jae	0x1454700e8 <.text+0x546f0e8>
14546f911:     	leaq	(%rcx,%rcx,2), %rax
14546f915:     	leal	-0x2(%rdi), %ecx
14546f918:     	cmpb	$0x9, %cl
14546f91b:     	ja	0x14546f950 <.text+0x546e950>
14546f91d:     	movzbl	%cl, %ecx
14546f920:     	leaq	0x15681a9(%rip), %rdx   # 0x1469d7ad0
14546f927:     	movq	(%rdx,%rcx,8), %rcx
14546f92b:     	jmp	0x14546f957 <.text+0x546e957>
14546f92d:     	leal	-0x2(%rdi), %ecx
14546f930:     	cmpb	$0x9, %cl
14546f933:     	movq	%rdx, -0x38(%rbp)
14546f937:     	ja	0x14546fc85 <.text+0x546ec85>
14546f93d:     	movzbl	%cl, %ecx
14546f940:     	leaq	0x1568189(%rip), %rdx   # 0x1469d7ad0
14546f947:     	movq	(%rdx,%rcx,8), %rcx
14546f94b:     	jmp	0x14546fc8c <.text+0x546ec8c>
14546f950:     	leaq	0x12c5ef1(%rip), %rcx   # 0x146735848
14546f957:     	movq	(%r14,%rax,8), %rbx
14546f95b:     	movq	0x8(%r14,%rax,8), %r15
14546f960:     	movb	0x10(%r14,%rax,8), %r13b
14546f965:     	addq	$0x10, %rcx
14546f969:     	movq	%rcx, 0x10(%rbp)
14546f96d:     	leaq	-0x546d8b4(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14546f974:     	movq	%rax, 0x18(%rbp)
14546f978:     	leaq	0xd0(%rbp), %rax
14546f97f:     	movq	%rax, 0x20(%rbp)
14546f983:     	leaq	0x2cb9b6(%rip), %rax    # 0x14573b340 <.text+0x573a340>
14546f98a:     	movq	%rax, 0x28(%rbp)
14546f98e:     	movb	$0x1, 0xff(%rbp)
14546f995:     	movb	$0x1, 0xfe(%rbp)
14546f99c:     	leaq	0x15645e8(%rip), %rdx   # 0x1469d3f8b
14546f9a3:     	leaq	0xb8(%rbp), %rcx
14546f9aa:     	leaq	0x10(%rbp), %r8
14546f9ae:     	callq	0x145728390 <.text+0x5727390>
14546f9b3:     	nop
14546f9b4:     	movq	0xb8(%rbp), %rax
14546f9bb:     	movq	%rax, 0xf0(%rbp)
14546f9c2:     	movq	0xc0(%rbp), %rcx
14546f9c9:     	movq	0xc8(%rbp), %rdx
14546f9d0:     	movq	%rcx, 0xe8(%rbp)
14546f9d7:     	callq	0x145457cb0 <.text+0x5456cb0>
14546f9dc:     	nop
14546f9dd:     	testq	%rax, %rax
14546f9e0:     	cmovneq	%rax, %rbx
14546f9e4:     	cmoveq	%r15, %rdx
14546f9e8:     	movq	%rbx, 0x98(%rbp)
14546f9ef:     	movq	%rdx, 0xa0(%rbp)
14546f9f6:     	movq	0xf0(%rbp), %rdx
14546f9fd:     	testq	%rdx, %rdx
14546fa00:     	je	0x14546fa14 <.text+0x546ea14>
14546fa02:     	movl	$0x1, %r8d
14546fa08:     	movq	0xe8(%rbp), %rcx
14546fa0f:     	callq	0x1400021d0 <.text+0x11d0>
14546fa14:     	leaq	0x1566a85(%rip), %rax   # 0x1469d64a0
14546fa1b:     	testb	%r13b, %r13b
14546fa1e:     	je	0x14546fa98 <.text+0x546ea98>
14546fa20:     	movq	%rax, 0x10(%rbp)
14546fa24:     	movq	$0x4, 0x18(%rbp)
14546fa2c:     	leaq	-0x50(%rbp), %rax
14546fa30:     	movq	%rax, 0x20(%rbp)
14546fa34:     	leaq	0x1566a45(%rip), %rax   # 0x1469d6480
14546fa3b:     	movq	%rax, 0x28(%rbp)
14546fa3f:     	leaq	0x1566a5e(%rip), %rcx   # 0x1469d64a4
14546fa46:     	movq	%rcx, 0x30(%rbp)
14546fa4a:     	movq	$0x3, 0x38(%rbp)
14546fa52:     	leaq	0x98(%rbp), %rcx
14546fa59:     	movq	%rcx, 0x40(%rbp)
14546fa5d:     	movq	%rax, 0x48(%rbp)
14546fa61:     	movb	$0x1, 0xff(%rbp)
14546fa68:     	movb	$0x1, 0xfe(%rbp)
14546fa6f:     	movq	$0x2, 0x20(%rsp)
14546fa78:     	leaq	0x1566a51(%rip), %rdx   # 0x1469d64d0
14546fa7f:     	leaq	0xb8(%rbp), %rcx
14546fa86:     	leaq	0x10(%rbp), %r9
14546fa8a:     	movl	$0xc, %r8d
14546fa90:     	callq	0x145457c60 <.text+0x5456c60>
14546fa95:     	nop
14546fa96:     	jmp	0x14546fb0e <.text+0x546eb0e>
14546fa98:     	movq	%rax, 0x10(%rbp)
14546fa9c:     	movq	$0x4, 0x18(%rbp)
14546faa4:     	leaq	-0x50(%rbp), %rax
14546faa8:     	movq	%rax, 0x20(%rbp)
14546faac:     	leaq	0x15669cd(%rip), %rax   # 0x1469d6480
14546fab3:     	movq	%rax, 0x28(%rbp)
14546fab7:     	leaq	0x15669e6(%rip), %rcx   # 0x1469d64a4
14546fabe:     	movq	%rcx, 0x30(%rbp)
14546fac2:     	movq	$0x3, 0x38(%rbp)
14546faca:     	leaq	0x98(%rbp), %rcx
14546fad1:     	movq	%rcx, 0x40(%rbp)
14546fad5:     	movq	%rax, 0x48(%rbp)
14546fad9:     	movb	$0x1, 0xff(%rbp)
14546fae0:     	movb	$0x1, 0xfe(%rbp)
14546fae7:     	movq	$0x2, 0x20(%rsp)
14546faf0:     	leaq	0x15669b0(%rip), %rdx   # 0x1469d64a7
14546faf7:     	leaq	0xb8(%rbp), %rcx
14546fafe:     	leaq	0x10(%rbp), %r9
14546fb02:     	movl	$0x10, %r8d
14546fb08:     	callq	0x145457c60 <.text+0x5456c60>
14546fb0d:     	nop
14546fb0e:     	movq	0xb8(%rbp), %rcx
14546fb15:     	movq	0xc0(%rbp), %r8
14546fb1c:     	movq	0xc8(%rbp), %rax
14546fb23:     	movq	%rax, 0xd8(%rbp)
14546fb2a:     	leaq	0xd0(%rbp), %rax
14546fb31:     	movq	%rax, 0x10(%rbp)
14546fb35:     	movq	$0x0, 0x18(%rbp)
14546fb3d:     	movq	$0x5, 0x20(%rbp)
14546fb45:     	leaq	0x28(%rbp), %rdx
14546fb49:     	movq	%r14, 0x28(%rbp)
14546fb4d:     	leaq	-0x40(%rbp), %rax
14546fb51:     	movq	%rax, 0x30(%rbp)
14546fb55:     	movq	%r8, %rbx
14546fb58:     	movq	%r8, 0xb0(%rbp)
14546fb5f:     	movq	%rcx, 0xf0(%rbp)
14546fb66:     	movq	%rcx, 0xa8(%rbp)
14546fb6d:     	movb	$0x0, 0xff(%rbp)
14546fb74:     	movb	$0x1, 0xfe(%rbp)
14546fb7b:     	leaq	0x10(%rbp), %rcx
14546fb7f:     	callq	0x14554b660 <.text+0x554a660>
14546fb84:     	nop
14546fb85:     	xorl	%r8d, %r8d
14546fb88:     	testb	$0x1, %al
14546fb8a:     	cmovnel	%edx, %r8d
14546fb8e:     	movq	%rbx, %rdx
14546fb91:     	movzbl	0x128(%r14), %ebx
14546fb99:     	cmpl	$0x2, %r12d
14546fb9d:     	movl	%r8d, 0xe8(%rbp)
14546fba4:     	jne	0x14546fc38 <.text+0x546ec38>
14546fbaa:     	cmpb	$0x1, %bl
14546fbad:     	jne	0x14546fc38 <.text+0x546ec38>
14546fbb3:     	leaq	0x1566942(%rip), %rax   # 0x1469d64fc
14546fbba:     	movzbl	(%r12,%rax), %eax
14546fbbf:     	movb	%al, (%rbp)
14546fbc2:     	movl	$0x2, %eax
14546fbc7:     	leaq	0x1566956(%rip), %rcx   # 0x1469d6524
14546fbce:     	movl	$0x14, 0x8(%rbp)
14546fbd5:     	leaq	(%rcx,%rax,8), %rax
14546fbd9:     	movq	%rcx, 0x10(%rbp)
14546fbdd:     	movq	%rax, 0x18(%rbp)
14546fbe1:     	leaq	0xd0(%rbp), %rax
14546fbe8:     	movq	%rax, 0x20(%rbp)
14546fbec:     	movq	%rdx, 0xe0(%rbp)
14546fbf3:     	movq	%rdx, 0xb0(%rbp)
14546fbfa:     	movq	0xf0(%rbp), %rax
14546fc01:     	movq	%rax, 0xa8(%rbp)
14546fc08:     	movb	$0x0, 0xff(%rbp)
14546fc0f:     	movb	$0x1, 0xfe(%rbp)
14546fc16:     	leaq	-0x30(%rbp), %rcx
14546fc1a:     	leaq	0x10(%rbp), %rdx
14546fc1e:     	callq	0x1455327e0 <.text+0x55317e0>
14546fc23:     	nop
14546fc24:     	movzbl	%bl, %eax
14546fc27:     	movl	%eax, -0x18(%rbp)
14546fc2a:     	xorl	%ebx, %ebx
14546fc2c:     	movl	$0x4, -0x10(%rbp)
14546fc33:     	jmp	0x14546fe66 <.text+0x546ee66>
14546fc38:     	leaq	0x156689d(%rip), %rax   # 0x1469d64dc
14546fc3f:     	movl	(%rax,%r12,4), %r10d
14546fc43:     	leaq	0x15668b2(%rip), %rax   # 0x1469d64fc
14546fc4a:     	movzbl	(%r12,%rax), %r9d
14546fc4f:     	cmpl	$0x6, %r12d
14546fc53:     	movb	%r9b, (%rbp)
14546fc57:     	movl	%r10d, 0x8(%rbp)
14546fc5b:     	ja	0x14547007e <.text+0x546f07e>
14546fc61:     	movl	%r12d, %eax
14546fc64:     	leaq	0x15684f5(%rip), %rcx   # 0x1469d8160
14546fc6b:     	movslq	(%rcx,%rax,4), %rax
14546fc6f:     	addq	%rcx, %rax
14546fc72:     	jmpq	*%rax
14546fc74:     	movl	$0x2, %eax
14546fc79:     	leaq	0x1566884(%rip), %rcx   # 0x1469d6504
14546fc80:     	jmp	0x14546fbd5 <.text+0x546ebd5>
14546fc85:     	leaq	0x12c5bbc(%rip), %rcx   # 0x146735848
14546fc8c:     	addq	$0x10, %rcx
14546fc90:     	movq	%rax, 0x98(%rbp)
14546fc97:     	movq	%rcx, 0x10(%rbp)
14546fc9b:     	leaq	-0x546dbe2(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
14546fca2:     	movq	%rax, 0x18(%rbp)
14546fca6:     	leaq	0x98(%rbp), %rax
14546fcad:     	movq	%rax, 0x20(%rbp)
14546fcb1:     	leaq	0x2cb688(%rip), %rax    # 0x14573b340 <.text+0x573a340>
14546fcb8:     	movq	%rax, 0x28(%rbp)
14546fcbc:     	leaq	0xd0(%rbp), %rcx
14546fcc3:     	movq	%rcx, 0x30(%rbp)
14546fcc7:     	movq	%rax, 0x38(%rbp)
14546fccb:     	movb	$0x1, 0xff(%rbp)
14546fcd2:     	movb	$0x1, 0xfe(%rbp)
14546fcd9:     	leaq	0x156429b(%rip), %rdx   # 0x1469d3f7b
14546fce0:     	leaq	0xb8(%rbp), %rcx
14546fce7:     	leaq	0x10(%rbp), %r8
14546fceb:     	callq	0x145728390 <.text+0x5727390>
14546fcf0:     	nop
14546fcf1:     	movq	0xb8(%rbp), %rax
14546fcf8:     	movq	%rax, 0xe0(%rbp)
14546fcff:     	movq	0xc0(%rbp), %rax
14546fd06:     	movq	0xd0(%rbp), %rcx
14546fd0d:     	cmpq	$0x4, %rcx
14546fd11:     	movq	%rax, 0xe8(%rbp)
14546fd18:     	ja	0x14547010a <.text+0x546f10a>
14546fd1e:     	movq	0xc8(%rbp), %rdx
14546fd25:     	shlq	$0x4, %rcx
14546fd29:     	movq	0x8(%r15,%rcx), %r14
14546fd2e:     	movq	0x10(%r15,%rcx), %rbx
14546fd33:     	movq	%rax, %rcx
14546fd36:     	callq	0x145457cb0 <.text+0x5456cb0>
14546fd3b:     	nop
14546fd3c:     	testq	%rax, %rax
14546fd3f:     	cmovneq	%rax, %r14
14546fd43:     	cmoveq	%rbx, %rdx
14546fd47:     	movq	%rdx, %rbx
14546fd4a:     	movq	$0x1, 0x20(%rsp)
14546fd53:     	leaq	0x10(%rbp), %rcx
14546fd57:     	movl	$0x1, %r9d
14546fd5d:     	xorl	%r8d, %r8d
14546fd60:     	callq	0x140188f20 <.text+0x187f20>
14546fd65:     	movq	0x18(%rbp), %rax
14546fd69:     	movq	%rax, 0xf0(%rbp)
14546fd70:     	cmpl	$0x1, 0x10(%rbp)
14546fd74:     	je	0x1454700c2 <.text+0x546f0c2>
14546fd7a:     	movq	0x20(%rbp), %r13
14546fd7e:     	testq	%rbx, %rbx
14546fd81:     	je	0x14546fd91 <.text+0x546ed91>
14546fd83:     	movq	%r13, %rcx
14546fd86:     	movq	%r14, %rdx
14546fd89:     	movq	%rbx, %r8
14546fd8c:     	callq	0x1457731ed <.text+0x57721ed>
14546fd91:     	movq	0xe0(%rbp), %rdx
14546fd98:     	testq	%rdx, %rdx
14546fd9b:     	je	0x14546fdaf <.text+0x546edaf>
14546fd9d:     	movl	$0x1, %r8d
14546fda3:     	movq	0xe8(%rbp), %rcx
14546fdaa:     	callq	0x1400021d0 <.text+0x11d0>
14546fdaf:     	movq	0xd0(%rbp), %rcx
14546fdb6:     	cmpq	$0x4, %rcx
14546fdba:     	ja	0x14547011e <.text+0x546f11e>
14546fdc0:     	movl	0x78(%r15,%rcx,4), %eax
14546fdc5:     	movl	%eax, 0xe8(%rbp)
14546fdcb:     	cmpl	$0x1, (%r15)
14546fdcf:     	movq	%rbx, 0xd8(%rbp)
14546fdd6:     	jne	0x14546fde9 <.text+0x546ede9>
14546fdd8:     	cmpq	$0x4, %rcx
14546fddc:     	jne	0x14546fde9 <.text+0x546ede9>
14546fdde:     	leaq	0x4(%r15), %rax
14546fde2:     	movl	$0x1, %ebx
14546fde7:     	jmp	0x14546fdf1 <.text+0x546edf1>
14546fde9:     	leaq	0x6c(%r15), %rax
14546fded:     	movl	0x74(%r15), %ebx
14546fdf1:     	movl	0x68(%r15), %ecx
14546fdf5:     	movl	%ecx, -0x10(%rbp)
14546fdf8:     	movl	(%rax), %eax
14546fdfa:     	movl	%eax, -0x18(%rbp)
14546fdfd:     	movl	0x70(%r15), %eax
14546fe01:     	movl	%eax, 0x8(%rbp)
14546fe04:     	movzbl	0x8c(%r15), %eax
14546fe0c:     	movb	%al, (%rbp)
14546fe0f:     	movq	0x58(%r15), %rax
14546fe13:     	movq	0x60(%r15), %rcx
14546fe17:     	leaq	(%rax,%rcx,8), %rcx
14546fe1b:     	movq	%rax, 0x10(%rbp)
14546fe1f:     	movq	%rcx, 0x18(%rbp)
14546fe23:     	leaq	0xd0(%rbp), %rax
14546fe2a:     	movq	%rax, 0x20(%rbp)
14546fe2e:     	movq	%r13, 0xe0(%rbp)
14546fe35:     	movq	%r13, 0xb0(%rbp)
14546fe3c:     	movq	0xf0(%rbp), %rax
14546fe43:     	movq	%rax, 0xa8(%rbp)
14546fe4a:     	movb	$0x0, 0xff(%rbp)
14546fe51:     	movb	$0x1, 0xfe(%rbp)
14546fe58:     	leaq	-0x30(%rbp), %rcx
14546fe5c:     	leaq	0x10(%rbp), %rdx
14546fe60:     	callq	0x145532860 <.text+0x5531860>
14546fe65:     	nop
14546fe66:     	cmpq	$0x0, 0xd0(%rbp)
14546fe6e:     	je	0x14546ffa9 <.text+0x546efa9>
14546fe74:     	movl	%ebx, -0x8(%rbp)
14546fe77:     	leal	(%rdi,%rdi,2), %r14d
14546fe7b:     	addl	%r12d, %r14d
14546fe7e:     	andl	$0x7, %r14d
14546fe82:     	movl	%r14d, %eax
14546fe85:     	shll	$0x4, %eax
14546fe88:     	leaq	0x15666ed(%rip), %rcx   # 0x1469d657c
14546fe8f:     	leaq	(%rcx,%rax), %rdx
14546fe93:     	addq	%rcx, %rax
14546fe96:     	addq	$0x10, %rax
14546fe9a:     	movq	%rdx, 0x10(%rbp)
14546fe9e:     	movq	%rax, 0x18(%rbp)
14546fea2:     	leaq	0xd0(%rbp), %rax
14546fea9:     	movq	%rax, 0x20(%rbp)
14546fead:     	movq	0xe0(%rbp), %rax
14546feb4:     	movq	%rax, 0xb0(%rbp)
14546febb:     	movq	0xf0(%rbp), %rax
14546fec2:     	movq	%rax, 0xa8(%rbp)
14546fec9:     	movb	$0x0, 0xff(%rbp)
14546fed0:     	movb	$0x1, 0xfe(%rbp)
14546fed7:     	leaq	-0x30(%rbp), %rcx
14546fedb:     	leaq	0x10(%rbp), %rdx
14546fedf:     	callq	0x1455328e0 <.text+0x55318e0>
14546fee4:     	nop
14546fee5:     	movq	0xd0(%rbp), %r8
14546feec:     	movq	0xe0(%rbp), %rax
14546fef3:     	movq	%rax, 0xb0(%rbp)
14546fefa:     	movq	0xf0(%rbp), %rax
14546ff01:     	movq	%rax, 0xa8(%rbp)
14546ff08:     	movb	$0x0, 0xff(%rbp)
14546ff0f:     	movb	$0x1, 0xfe(%rbp)
14546ff16:     	movl	%edi, %ecx
14546ff18:     	movq	%r14, %rdx
14546ff1b:     	callq	0x14546d400 <.text+0x546c400>
14546ff20:     	nop
14546ff21:     	movq	%rax, %r15
14546ff24:     	movq	%rdx, %r14
14546ff27:     	movq	0xd0(%rbp), %r13
14546ff2e:     	cmpq	$0x4, %r13
14546ff32:     	jne	0x14546ffa4 <.text+0x546efa4>
14546ff34:     	cmpl	$0x8, %r12d
14546ff38:     	movabsq	$0x10000000b, %rax      # imm = 0x10000000B
14546ff42:     	movabsq	$0x3d2c08310000000c, %r13 # imm = 0x3D2C08310000000C
14546ff4c:     	cmovaeq	%rax, %r13
14546ff50:     	movq	-0x20(%rbp), %rbx
14546ff54:     	cmpq	-0x30(%rbp), %rbx
14546ff58:     	jne	0x14546ff8e <.text+0x546ef8e>
14546ff5a:     	movq	0xe0(%rbp), %rax
14546ff61:     	movq	%rax, 0xb0(%rbp)
14546ff68:     	movq	0xf0(%rbp), %rax
14546ff6f:     	movq	%rax, 0xa8(%rbp)
14546ff76:     	movb	$0x0, 0xff(%rbp)
14546ff7d:     	movb	$0x1, 0xfe(%rbp)
14546ff84:     	leaq	-0x30(%rbp), %rcx
14546ff88:     	callq	0x145780180 <.text+0x577f180>
14546ff8d:     	nop
14546ff8e:     	movq	-0x28(%rbp), %rax
14546ff92:     	movq	%r13, (%rax,%rbx,8)
14546ff96:     	incq	%rbx
14546ff99:     	movq	%rbx, -0x20(%rbp)
14546ff9d:     	movq	0xd0(%rbp), %r13
14546ffa4:     	movl	-0x8(%rbp), %ebx
14546ffa7:     	jmp	0x14546ffaf <.text+0x546efaf>
14546ffa9:     	xorl	%r13d, %r13d
14546ffac:     	xorl	%r15d, %r15d
14546ffaf:     	movq	-0x20(%rbp), %rax
14546ffb3:     	movq	%rax, 0x20(%rbp)
14546ffb7:     	movups	-0x30(%rbp), %xmm0
14546ffbb:     	movaps	%xmm0, 0x10(%rbp)
14546ffbf:     	leaq	0xb8(%rbp), %rcx
14546ffc6:     	leaq	0x10(%rbp), %rdx
14546ffca:     	callq	0x14546a920 <.text+0x5469920>
14546ffcf:     	nop
14546ffd0:     	movq	0xd8(%rbp), %rcx
14546ffd7:     	movq	0xc8(%rbp), %rax
14546ffde:     	movq	%rax, 0x28(%rsi)
14546ffe2:     	movups	0xb8(%rbp), %xmm0
14546ffe9:     	movups	%xmm0, 0x18(%rsi)
14546ffed:     	movq	0xf0(%rbp), %rax
14546fff4:     	movq	%rax, (%rsi)
14546fff7:     	movq	0xe0(%rbp), %rax
14546fffe:     	movq	%rax, 0x8(%rsi)
145470002:     	movq	%rcx, 0x10(%rsi)
145470006:     	movq	%r13, 0x30(%rsi)
14547000a:     	movq	%r15, 0x38(%rsi)
14547000e:     	movq	%r14, 0x40(%rsi)
145470012:     	movq	%r12, 0x48(%rsi)
145470016:     	movq	-0x38(%rbp), %rax
14547001a:     	movl	%eax, 0x50(%rsi)
14547001d:     	movl	0xe8(%rbp), %eax
145470023:     	movl	%eax, 0x54(%rsi)
145470026:     	movl	-0x10(%rbp), %eax
145470029:     	movl	%eax, 0x58(%rsi)
14547002c:     	movl	-0x18(%rbp), %eax
14547002f:     	movl	%eax, 0x5c(%rsi)
145470032:     	movl	0x8(%rbp), %eax
145470035:     	movl	%eax, 0x60(%rsi)
145470038:     	movl	%ebx, 0x64(%rsi)
14547003b:     	movzbl	(%rbp), %eax
14547003f:     	movb	%al, 0x68(%rsi)
145470042:     	movb	%dil, 0x69(%rsi)
145470046:     	jmp	0x14546f3b0 <.text+0x546e3b0>
14547004b:     	movl	$0x2, %eax
145470050:     	leaq	0x15664ed(%rip), %rcx   # 0x1469d6544
145470057:     	jmp	0x14546fbd5 <.text+0x546ebd5>
14547005c:     	movl	$0x2, %eax
145470061:     	leaq	0x15664bc(%rip), %rcx   # 0x1469d6524
145470068:     	jmp	0x14546fbd5 <.text+0x546ebd5>
14547006d:     	movl	$0x2, %eax
145470072:     	leaq	0x15664bb(%rip), %rcx   # 0x1469d6534
145470079:     	jmp	0x14546fbd5 <.text+0x546ebd5>
14547007e:     	movl	$0x3, %eax
145470083:     	leaq	0x15664da(%rip), %rcx   # 0x1469d6564
14547008a:     	jmp	0x14546fbd5 <.text+0x546ebd5>
14547008f:     	movl	$0x2, %eax
145470094:     	leaq	0x1566479(%rip), %rcx   # 0x1469d6514
14547009b:     	jmp	0x14546fbd5 <.text+0x546ebd5>
1454700a0:     	movl	$0x1, %eax
1454700a5:     	leaq	0x15664a8(%rip), %rcx   # 0x1469d6554
1454700ac:     	jmp	0x14546fbd5 <.text+0x546ebd5>
1454700b1:     	movl	$0x1, %eax
1454700b6:     	leaq	0x156649f(%rip), %rcx   # 0x1469d655c
1454700bd:     	jmp	0x14546fbd5 <.text+0x546ebd5>
1454700c2:     	movq	0x20(%rbp), %rdx
1454700c6:     	movq	0xf0(%rbp), %rcx
1454700cd:     	callq	0x14590379b <.text+0x590279b>
1454700d2:     	nop
1454700d3:     	jmp	0x145470153 <.text+0x546f153>
1454700d5:     	movq	0x20(%rbp), %rdx
1454700d9:     	movq	0xf0(%rbp), %rcx
1454700e0:     	callq	0x14590379b <.text+0x590279b>
1454700e5:     	nop
1454700e6:     	jmp	0x145470153 <.text+0x546f153>
1454700e8:     	movb	$0x1, 0xff(%rbp)
1454700ef:     	movb	$0x1, 0xfe(%rbp)
1454700f6:     	leaq	0x15663bb(%rip), %r8    # 0x1469d64b8
1454700fd:     	movl	$0x5, %edx
145470102:     	callq	0x145903b33 <.text+0x5902b33>
145470107:     	nop
145470108:     	jmp	0x145470153 <.text+0x546f153>
14547010a:     	leaq	0x156633f(%rip), %r8    # 0x1469d6450
145470111:     	movl	$0x5, %edx
145470116:     	callq	0x145903b33 <.text+0x5902b33>
14547011b:     	nop
14547011c:     	jmp	0x145470153 <.text+0x546f153>
14547011e:     	movq	%r13, 0xb0(%rbp)
145470125:     	movq	0xf0(%rbp), %rax
14547012c:     	movq	%rax, 0xa8(%rbp)
145470133:     	movb	$0x0, 0xff(%rbp)
14547013a:     	movb	$0x1, 0xfe(%rbp)
145470141:     	leaq	0x1566320(%rip), %r8    # 0x1469d6468
145470148:     	movl	$0x5, %edx
14547014d:     	callq	0x145903b33 <.text+0x5902b33>
145470152:     	nop
145470153:     	ud2
