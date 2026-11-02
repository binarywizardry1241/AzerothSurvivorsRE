
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1453ff1b0:     	pushq	%rbp
1453ff1b1:     	pushq	%r15
1453ff1b3:     	pushq	%r14
1453ff1b5:     	pushq	%r13
1453ff1b7:     	pushq	%r12
1453ff1b9:     	pushq	%rsi
1453ff1ba:     	pushq	%rdi
1453ff1bb:     	pushq	%rbx
1453ff1bc:     	subq	$0x198, %rsp            # imm = 0x198
1453ff1c3:     	leaq	0x80(%rsp), %rbp
1453ff1cb:     	movq	$-0x2, 0x110(%rbp)
1453ff1d6:     	movq	%rcx, -0x58(%rbp)
1453ff1da:     	movq	$0x0, 0xe8(%rbp)
1453ff1e5:     	movq	$0x1, 0xf0(%rbp)
1453ff1f0:     	movq	$0x0, 0xf8(%rbp)
1453ff1fb:     	movq	0x8(%rdx), %r15
1453ff1ff:     	movq	%rdx, 0xa8(%rbp)
1453ff206:     	imulq	$0x38, 0x10(%rdx), %rsi
1453ff20b:     	addq	%r15, %rsi
1453ff20e:     	leaq	-0x10(%rbp), %rbx
1453ff212:     	leaq	0x12dcc22(%rip), %r12   # 0x1466dbe3b
1453ff219:     	jmp	0x1453ff223 <.text+0x53fe223>
1453ff21b:     	nopl	(%rax,%rax)
1453ff220:     	movq	%r13, %r15
1453ff223:     	cmpq	%rsi, %r15
1453ff226:     	je	0x1453ff476 <.text+0x53fe476>
1453ff22c:     	leaq	0x38(%r15), %r13
1453ff230:     	leaq	0x33(%r15), %rdx
1453ff234:     	leaq	0x90(%rbp), %rcx
1453ff23b:     	movq	%r13, %r8
1453ff23e:     	callq	0x1454e9760 <.text+0x54e8760>
1453ff243:     	nop
1453ff244:     	movq	0x98(%rbp), %rdi
1453ff24b:     	movq	0xa0(%rbp), %r14
1453ff252:     	movq	$0x1, 0x20(%rsp)
1453ff25b:     	movq	%rbx, %rcx
1453ff25e:     	movq	%rdi, %rdx
1453ff261:     	movq	%r14, %r8
1453ff264:     	leaq	0x12dc9a1(%rip), %r9    # 0x1466dbc0c
1453ff26b:     	callq	0x145422a70 <.text+0x5421a70>
1453ff270:     	nop
1453ff271:     	leaq	0x32(%r15), %rax
1453ff275:     	leaq	0x31(%r15), %rcx
1453ff279:     	leaq	0x30(%r15), %rdx
1453ff27d:     	leaq	0x18(%r15), %r8
1453ff281:     	movq	(%rbp), %r9
1453ff285:     	movq	%r9, 0xe0(%rbp)
1453ff28c:     	movdqu	-0x10(%rbp), %xmm0
1453ff291:     	movdqa	%xmm0, 0xd0(%rbp)
1453ff299:     	leaq	0x20(%r15), %r9
1453ff29d:     	leaq	0x24(%r15), %r10
1453ff2a1:     	leaq	0x28(%r15), %r11
1453ff2a5:     	movq	%r8, -0x10(%rbp)
1453ff2a9:     	leaq	0x2dd8a0(%rip), %r8     # 0x1456dcb50 <.text+0x56dbb50>
1453ff2b0:     	movq	%r8, -0x8(%rbp)
1453ff2b4:     	movq	%r15, (%rbp)
1453ff2b8:     	addq	$0x2c, %r15
1453ff2bc:     	leaq	-0x53fd1e3(%rip), %r8   # 0x1400020e0 <.text+0x10e0>
1453ff2c3:     	movq	%r8, 0x8(%rbp)
1453ff2c7:     	movq	%rdx, 0x10(%rbp)
1453ff2cb:     	leaq	0x2d925e(%rip), %rdx    # 0x1456d8530 <.text+0x56d7530>
1453ff2d2:     	movq	%rdx, 0x18(%rbp)
1453ff2d6:     	movq	%rcx, 0x20(%rbp)
1453ff2da:     	movq	%rdx, 0x28(%rbp)
1453ff2de:     	movq	%rax, 0x30(%rbp)
1453ff2e2:     	movq	%rdx, 0x38(%rbp)
1453ff2e6:     	leaq	0xd0(%rbp), %rax
1453ff2ed:     	movq	%rax, 0x40(%rbp)
1453ff2f1:     	movq	%r8, 0x48(%rbp)
1453ff2f5:     	movq	%r9, 0x50(%rbp)
1453ff2f9:     	leaq	0x2dc960(%rip), %rax    # 0x1456dbc60 <.text+0x56dac60>
1453ff300:     	movq	%rax, 0x58(%rbp)
1453ff304:     	movq	%r10, 0x60(%rbp)
1453ff308:     	movq	%rax, 0x68(%rbp)
1453ff30c:     	movq	%r11, 0x70(%rbp)
1453ff310:     	movq	%rax, 0x78(%rbp)
1453ff314:     	movq	%r15, 0x80(%rbp)
1453ff31b:     	movq	%rax, 0x88(%rbp)
1453ff322:     	leaq	0xb0(%rbp), %rcx
1453ff329:     	movq	%r12, %rdx
1453ff32c:     	movq	%rbx, %r8
1453ff32f:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453ff334:     	nop
1453ff335:     	movq	0xd0(%rbp), %rdx
1453ff33c:     	testq	%rdx, %rdx
1453ff33f:     	je	0x1453ff353 <.text+0x53fe353>
1453ff341:     	movq	0xd8(%rbp), %rcx
1453ff348:     	movl	$0x1, %r8d
1453ff34e:     	callq	0x1400021d0 <.text+0x11d0>
1453ff353:     	movq	0xb0(%rbp), %rax
1453ff35a:     	movq	%rax, 0x100(%rbp)
1453ff361:     	movq	0xb8(%rbp), %rax
1453ff368:     	movq	%rax, 0x108(%rbp)
1453ff36f:     	movq	0xc0(%rbp), %r15
1453ff376:     	movq	0xe8(%rbp), %rax
1453ff37d:     	movq	0xf8(%rbp), %rdx
1453ff384:     	subq	%rdx, %rax
1453ff387:     	cmpq	%rax, %r15
1453ff38a:     	ja	0x1453ff44b <.text+0x53fe44b>
1453ff390:     	testq	%r15, %r15
1453ff393:     	je	0x1453ff3b5 <.text+0x53fe3b5>
1453ff395:     	addq	0xf0(%rbp), %rdx
1453ff39c:     	movq	%rdx, %rcx
1453ff39f:     	movq	0x108(%rbp), %rdx
1453ff3a6:     	movq	%r15, %r8
1453ff3a9:     	callq	0x1457149fd <.text+0x57139fd>
1453ff3ae:     	movq	0xf8(%rbp), %rdx
1453ff3b5:     	addq	%r15, %rdx
1453ff3b8:     	movq	%rdx, 0xf8(%rbp)
1453ff3bf:     	movq	0x100(%rbp), %rdx
1453ff3c6:     	testq	%rdx, %rdx
1453ff3c9:     	je	0x1453ff3dd <.text+0x53fe3dd>
1453ff3cb:     	movl	$0x1, %r8d
1453ff3d1:     	movq	0x108(%rbp), %rcx
1453ff3d8:     	callq	0x1400021d0 <.text+0x11d0>
1453ff3dd:     	testq	%r14, %r14
1453ff3e0:     	je	0x1453ff420 <.text+0x53fe420>
1453ff3e2:     	leaq	0x8(%rdi), %r15
1453ff3e6:     	jmp	0x1453ff3f9 <.text+0x53fe3f9>
1453ff3e8:     	nopl	(%rax,%rax)
1453ff3f0:     	addq	$0x18, %r15
1453ff3f4:     	decq	%r14
1453ff3f7:     	je	0x1453ff420 <.text+0x53fe420>
1453ff3f9:     	movq	-0x8(%r15), %rdx
1453ff3fd:     	testq	%rdx, %rdx
1453ff400:     	je	0x1453ff3f0 <.text+0x53fe3f0>
1453ff402:     	movq	(%r15), %rcx
1453ff405:     	movl	$0x1, %r8d
1453ff40b:     	callq	0x1400021d0 <.text+0x11d0>
1453ff410:     	jmp	0x1453ff3f0 <.text+0x53fe3f0>
1453ff412:     	nopw	%cs:(%rax,%rax)
1453ff420:     	movq	0x90(%rbp), %rax
1453ff427:     	testq	%rax, %rax
1453ff42a:     	je	0x1453ff220 <.text+0x53fe220>
1453ff430:     	shlq	$0x3, %rax
1453ff434:     	leaq	(%rax,%rax,2), %rdx
1453ff438:     	movl	$0x8, %r8d
1453ff43e:     	movq	%rdi, %rcx
1453ff441:     	callq	0x1400021d0 <.text+0x11d0>
1453ff446:     	jmp	0x1453ff220 <.text+0x53fe220>
1453ff44b:     	movq	$0x1, 0x20(%rsp)
1453ff454:     	movl	$0x1, %r9d
1453ff45a:     	leaq	0xe8(%rbp), %rcx
1453ff461:     	movq	%r15, %r8
1453ff464:     	callq	0x145717840 <.text+0x5716840>
1453ff469:     	nop
1453ff46a:     	movq	0xf8(%rbp), %rdx
1453ff471:     	jmp	0x1453ff395 <.text+0x53fe395>
1453ff476:     	movq	0xa8(%rbp), %r14
1453ff47d:     	cmpq	$-0x1, 0x138(%r14)
1453ff485:     	je	0x1453ff688 <.text+0x53fe688>
1453ff48b:     	leaq	0x173(%r14), %rdx
1453ff492:     	leaq	0x178(%r14), %r8
1453ff499:     	leaq	0x90(%rbp), %rcx
1453ff4a0:     	callq	0x1454e9760 <.text+0x54e8760>
1453ff4a5:     	nop
1453ff4a6:     	movq	0x98(%rbp), %rsi
1453ff4ad:     	movq	0xa0(%rbp), %rdi
1453ff4b4:     	movq	$0x1, 0x20(%rsp)
1453ff4bd:     	leaq	0x12dc748(%rip), %r9    # 0x1466dbc0c
1453ff4c4:     	leaq	-0x10(%rbp), %rcx
1453ff4c8:     	movq	%rsi, %rdx
1453ff4cb:     	movq	%rdi, %r8
1453ff4ce:     	callq	0x145422a70 <.text+0x5421a70>
1453ff4d3:     	nop
1453ff4d4:     	movq	(%rbp), %rax
1453ff4d8:     	movq	%rax, 0xc0(%rbp)
1453ff4df:     	movdqu	-0x10(%rbp), %xmm0
1453ff4e4:     	movdqa	%xmm0, 0xb0(%rbp)
1453ff4ec:     	movq	0xa8(%rbp), %r14
1453ff4f3:     	leaq	0x168(%r14), %rdx
1453ff4fa:     	leaq	0xd0(%rbp), %rbx
1453ff501:     	movq	%rbx, %rcx
1453ff504:     	callq	0x1454248a0 <.text+0x54238a0>
1453ff509:     	nop
1453ff50a:     	leaq	0x138(%r14), %rax
1453ff511:     	leaq	0x170(%r14), %rcx
1453ff518:     	leaq	0x171(%r14), %rdx
1453ff51f:     	leaq	0x172(%r14), %r8
1453ff526:     	leaq	0x150(%r14), %r9
1453ff52d:     	movq	%rcx, -0x10(%rbp)
1453ff531:     	leaq	0x2d8ff8(%rip), %rcx    # 0x1456d8530 <.text+0x56d7530>
1453ff538:     	movq	%rcx, -0x8(%rbp)
1453ff53c:     	movq	%rdx, (%rbp)
1453ff540:     	movq	%rcx, 0x8(%rbp)
1453ff544:     	movq	%r8, 0x10(%rbp)
1453ff548:     	movq	%rcx, 0x18(%rbp)
1453ff54c:     	movq	%r9, 0x20(%rbp)
1453ff550:     	leaq	-0x53fd477(%rip), %rcx  # 0x1400020e0 <.text+0x10e0>
1453ff557:     	movq	%rcx, 0x28(%rbp)
1453ff55b:     	movq	%rax, 0x30(%rbp)
1453ff55f:     	movq	%rcx, 0x38(%rbp)
1453ff563:     	leaq	0xb0(%rbp), %rax
1453ff56a:     	movq	%rax, 0x40(%rbp)
1453ff56e:     	movq	%rcx, 0x48(%rbp)
1453ff572:     	movq	%rbx, 0x50(%rbp)
1453ff576:     	movq	%rcx, 0x58(%rbp)
1453ff57a:     	leaq	0x12dc9c7(%rip), %rdx   # 0x1466dbf48
1453ff581:     	leaq	-0x30(%rbp), %rcx
1453ff585:     	leaq	-0x10(%rbp), %r8
1453ff589:     	callq	0x1456c9ba0 <.text+0x56c8ba0>
1453ff58e:     	nop
1453ff58f:     	movq	0xd0(%rbp), %rdx
1453ff596:     	testq	%rdx, %rdx
1453ff599:     	je	0x1453ff5ad <.text+0x53fe5ad>
1453ff59b:     	movq	0xd8(%rbp), %rcx
1453ff5a2:     	movl	$0x1, %r8d
1453ff5a8:     	callq	0x1400021d0 <.text+0x11d0>
1453ff5ad:     	movq	0xb0(%rbp), %rdx
1453ff5b4:     	testq	%rdx, %rdx
1453ff5b7:     	je	0x1453ff5cb <.text+0x53fe5cb>
1453ff5b9:     	movq	0xb8(%rbp), %rcx
1453ff5c0:     	movl	$0x1, %r8d
1453ff5c6:     	callq	0x1400021d0 <.text+0x11d0>
1453ff5cb:     	testq	%rdi, %rdi
1453ff5ce:     	je	0x1453ff602 <.text+0x53fe602>
1453ff5d0:     	leaq	0x8(%rsi), %rbx
1453ff5d4:     	jmp	0x1453ff5e9 <.text+0x53fe5e9>
1453ff5d6:     	nopw	%cs:(%rax,%rax)
1453ff5e0:     	addq	$0x18, %rbx
1453ff5e4:     	decq	%rdi
1453ff5e7:     	je	0x1453ff602 <.text+0x53fe602>
1453ff5e9:     	movq	-0x8(%rbx), %rdx
1453ff5ed:     	testq	%rdx, %rdx
1453ff5f0:     	je	0x1453ff5e0 <.text+0x53fe5e0>
1453ff5f2:     	movq	(%rbx), %rcx
1453ff5f5:     	movl	$0x1, %r8d
1453ff5fb:     	callq	0x1400021d0 <.text+0x11d0>
1453ff600:     	jmp	0x1453ff5e0 <.text+0x53fe5e0>
1453ff602:     	movq	0x90(%rbp), %rax
1453ff609:     	testq	%rax, %rax
1453ff60c:     	je	0x1453ff624 <.text+0x53fe624>
1453ff60e:     	shlq	$0x3, %rax
1453ff612:     	leaq	(%rax,%rax,2), %rdx
1453ff616:     	movl	$0x8, %r8d
1453ff61c:     	movq	%rsi, %rcx
1453ff61f:     	callq	0x1400021d0 <.text+0x11d0>
1453ff624:     	movq	-0x28(%rbp), %rdi
1453ff628:     	movq	-0x20(%rbp), %rsi
1453ff62c:     	movq	0xe8(%rbp), %rax
1453ff633:     	movq	0xf8(%rbp), %rdx
1453ff63a:     	subq	%rdx, %rax
1453ff63d:     	cmpq	%rax, %rsi
1453ff640:     	ja	0x1454010d3 <.text+0x54000d3>
1453ff646:     	testq	%rsi, %rsi
1453ff649:     	je	0x1453ff667 <.text+0x53fe667>
1453ff64b:     	addq	0xf0(%rbp), %rdx
1453ff652:     	movq	%rdx, %rcx
1453ff655:     	movq	%rdi, %rdx
1453ff658:     	movq	%rsi, %r8
1453ff65b:     	callq	0x1457149fd <.text+0x57139fd>
1453ff660:     	movq	0xf8(%rbp), %rdx
1453ff667:     	addq	%rsi, %rdx
1453ff66a:     	movq	%rdx, 0xf8(%rbp)
1453ff671:     	movq	-0x30(%rbp), %rdx
1453ff675:     	testq	%rdx, %rdx
1453ff678:     	je	0x1453ff688 <.text+0x53fe688>
1453ff67a:     	movl	$0x1, %r8d
1453ff680:     	movq	%rdi, %rcx
1453ff683:     	callq	0x1400021d0 <.text+0x11d0>
