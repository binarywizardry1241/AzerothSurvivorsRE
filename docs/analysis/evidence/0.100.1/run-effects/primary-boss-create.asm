
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454d11f0:     	pushq	%rbp
1454d11f1:     	pushq	%r15
1454d11f3:     	pushq	%r14
1454d11f5:     	pushq	%r13
1454d11f7:     	pushq	%r12
1454d11f9:     	pushq	%rsi
1454d11fa:     	pushq	%rdi
1454d11fb:     	pushq	%rbx
1454d11fc:     	subq	$0x288, %rsp            # imm = 0x288
1454d1203:     	leaq	0x80(%rsp), %rbp
1454d120b:     	movaps	%xmm10, 0x1f0(%rbp)
1454d1213:     	movaps	%xmm9, 0x1e0(%rbp)
1454d121b:     	movaps	%xmm8, 0x1d0(%rbp)
1454d1223:     	movdqa	%xmm7, 0x1c0(%rbp)
1454d122b:     	movaps	%xmm6, 0x1b0(%rbp)
1454d1232:     	movq	$-0x2, 0x1a8(%rbp)
1454d123d:     	movq	%rdx, %r13
1454d1240:     	movq	%rcx, %rsi
1454d1243:     	movq	0x228(%rcx), %rcx
1454d124a:     	movq	0x230(%rsi), %rdx
1454d1251:     	callq	0x145420480 <.text+0x541f480>
1454d1256:     	movq	%rax, %rbx
1454d1259:     	imulq	$0xf0, %rax, %rax
1454d1260:     	leaq	0x12622b1(%rip), %rdi   # 0x146733518
1454d1267:     	movl	0x408(%rsi), %ecx
1454d126d:     	movl	%ecx, 0x130(%rbp)
1454d1273:     	movq	0x400(%rsi), %rcx
1454d127a:     	movq	%rcx, 0x128(%rbp)
1454d1281:     	leaq	0x128(%rbp), %rcx
1454d1288:     	movq	%rcx, 0x148(%rbp)
1454d128f:     	movq	0x68(%rax,%rdi), %r14
1454d1294:     	movq	0x70(%rax,%rdi), %r12
1454d1299:     	leaq	(%r14,%r12,8), %rax
1454d129d:     	movq	%r14, -0x38(%rbp)
1454d12a1:     	movq	%rax, -0x30(%rbp)
1454d12a5:     	leaq	0x148(%rbp), %rax
1454d12ac:     	movq	%rax, -0x28(%rbp)
1454d12b0:     	leaq	0x160(%rbp), %rcx
1454d12b7:     	leaq	-0x38(%rbp), %rdx
1454d12bb:     	callq	0x145538ae0 <.text+0x5537ae0>
1454d12c0:     	movq	0x170(%rbp), %r9
1454d12c7:     	testq	%r9, %r9
1454d12ca:     	je	0x1454d1581 <.text+0x54d0581>
1454d12d0:     	bsrq	%r9, %rcx
1454d12d4:     	notl	%ecx
1454d12d6:     	movq	%r9, %r8
1454d12d9:     	shlq	%cl, %r8
1454d12dc:     	decq	%r8
1454d12df:     	movq	0x8a0(%rsi), %r11
1454d12e6:     	movq	0x8a8(%rsi), %rcx
1454d12ed:     	movq	0x8b8(%rsi), %rbx
1454d12f4:     	movq	0x8b0(%rsi), %r10
1454d12fb:     	nopl	(%rax,%rax)
1454d1300:     	leaq	(%r11,%rbx), %rax
1454d1304:     	rolq	$0x17, %rax
1454d1308:     	addq	%r11, %rax
1454d130b:     	movq	%rcx, %r14
1454d130e:     	shlq	$0x11, %r14
1454d1312:     	xorq	%r11, %r10
1454d1315:     	xorq	%rcx, %rbx
1454d1318:     	xorq	%rbx, %r11
1454d131b:     	rolq	$0x2d, %rbx
1454d131f:     	xorq	%r10, %rcx
1454d1322:     	mulq	%r9
1454d1325:     	xorq	%r14, %r10
1454d1328:     	cmpq	%rax, %r8
1454d132b:     	jb	0x1454d1300 <.text+0x54d0300>
1454d132d:     	movq	%r11, 0x8a0(%rsi)
1454d1334:     	movq	%rbx, 0x8b8(%rsi)
1454d133b:     	movq	%rcx, 0x8a8(%rsi)
1454d1342:     	movq	%r10, 0x8b0(%rsi)
1454d1349:     	cmpq	%rdx, %r9
1454d134c:     	jbe	0x1454d1fb8 <.text+0x54d0fb8>
1454d1352:     	movq	0x168(%rbp), %rax
1454d1359:     	movq	(%rax,%rdx,8), %r14
1454d135d:     	movsd	(%r14), %xmm6
1454d1362:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454d1367:     	movq	0x898(%rsi), %rbx
1454d136e:     	leaq	0x10(%rbx), %rcx
1454d1372:     	movaps	%xmm6, %xmm1
1454d1375:     	movaps	%xmm8, %xmm2
1454d1379:     	callq	0x14552a140 <.text+0x5529140>
1454d137e:     	nop
1454d137f:     	testb	$0x1, %al
1454d1381:     	je	0x1454d153d <.text+0x54d053d>
1454d1387:     	movdqa	%xmm0, %xmm7
1454d138b:     	movq	0x160(%rbp), %rdx
1454d1392:     	testq	%rdx, %rdx
1454d1395:     	je	0x1454d13ad <.text+0x54d03ad>
1454d1397:     	movq	0x168(%rbp), %rcx
1454d139e:     	shlq	$0x3, %rdx
1454d13a2:     	movl	$0x8, %r8d
1454d13a8:     	callq	0x1400021d0 <.text+0x11d0>
1454d13ad:     	movlps	%xmm6, 0x150(%rbp)
1454d13b4:     	movd	%xmm7, 0x158(%rbp)
1454d13bc:     	movq	0x228(%rsi), %rcx
1454d13c3:     	movq	0x230(%rsi), %rdx
1454d13ca:     	callq	0x145420480 <.text+0x541f480>
1454d13cf:     	imulq	$0xf0, %rax, %rax
1454d13d6:     	addq	%rax, %rdi
1454d13d9:     	xorps	%xmm6, %xmm6
1454d13dc:     	cmpl	$0x1, 0x870(%rsi)
1454d13e3:     	jne	0x1454d140e <.text+0x54d040e>
1454d13e5:     	cmpb	$0x0, 0x9aa(%rsi)
1454d13ec:     	je	0x1454d140e <.text+0x54d040e>
1454d13ee:     	movss	0x934(%rsi), %xmm6
1454d13f6:     	subss	0x874(%rsi), %xmm6
1454d13fe:     	divss	0x44449e(%rip), %xmm6   # 0x1459158a4
1454d1406:     	pxor	%xmm0, %xmm0
1454d140a:     	maxss	%xmm0, %xmm6
1454d140e:     	movzwl	0x24a(%rsi), %ebx
1454d1415:     	movd	0x24c(%rsi), %xmm8
1454d141e:     	movss	0x44(%r13), %xmm7
1454d1424:     	mulss	0x1524a64(%rip), %xmm7  # 0x1469f5e90
1454d142c:     	movss	0xe0(%rdi), %xmm10
1454d1435:     	mulss	%xmm10, %xmm7
1454d143a:     	mulss	0x99c(%rsi), %xmm7
1454d1442:     	movss	0x1524a4a(%rip), %xmm0  # 0x1469f5e94
1454d144a:     	movaps	%xmm6, %xmm1
1454d144d:     	callq	0x145773283 <.text+0x5772283>
1454d1452:     	mulss	%xmm7, %xmm0
1454d1456:     	xorps	%xmm7, %xmm7
1454d1459:     	cvtsi2ss	%ebx, %xmm7
1454d145d:     	divss	0x4360d7(%rip), %xmm7   # 0x14590753c
1454d1465:     	mulss	%xmm0, %xmm7
1454d1469:     	movl	0x30(%r13), %r8d
1454d146d:     	movl	0x954(%rsi), %eax
1454d1473:     	incl	%eax
1454d1475:     	movl	%eax, 0x954(%rsi)
1454d147b:     	movl	%r8d, %ecx
1454d147e:     	andl	$0xffffff, %ecx         # imm = 0xFFFFFF
1454d1484:     	shlq	$0x18, %rcx
1454d1488:     	andl	$0xffffff, %eax         # imm = 0xFFFFFF
1454d148d:     	orq	%rcx, %rax
1454d1490:     	movabsq	$-0xed0000000000000, %rbx # imm = 0xF130000000000000
1454d149a:     	orq	%rax, %rbx
1454d149d:     	movl	0x34(%r13), %r9d
1454d14a1:     	movss	0x38(%r13), %xmm9
1454d14a7:     	leaq	0x150(%rbp), %rax
1454d14ae:     	movq	%rax, 0x38(%rsp)
1454d14b3:     	movss	%xmm7, 0x28(%rsp)
1454d14b9:     	movss	%xmm9, 0x20(%rsp)
1454d14c0:     	movb	$0x1, 0x30(%rsp)
1454d14c5:     	movq	%rsi, %rcx
1454d14c8:     	movq	%rbx, %rdx
1454d14cb:     	callq	0x1454d2910 <.text+0x54d1910>
1454d14d0:     	movq	0x18(%r13), %rdi
1454d14d4:     	testq	%rdi, %rdi
1454d14d7:     	je	0x1454d1628 <.text+0x54d0628>
1454d14dd:     	movq	0x10(%r13), %r15
1454d14e1:     	leaq	(,%rdi,4), %r14
1454d14e9:     	callq	0x140002200 <.text+0x1200>
1454d14ee:     	movl	$0x4, %edx
1454d14f3:     	movq	%r14, %rcx
1454d14f6:     	callq	0x1400021c0 <.text+0x11c0>
1454d14fb:     	testq	%rax, %rax
1454d14fe:     	je	0x1454d1fcd <.text+0x54d0fcd>
1454d1504:     	cmpq	$0xc, %rdi
1454d1508:     	jbe	0x1454d1536 <.text+0x54d0536>
1454d150a:     	leaq	(%rax,%rdi,4), %rcx
1454d150e:     	leaq	0x18(%r15), %rdx
1454d1512:     	leaq	(%rdi,%rdi,8), %r8
1454d1516:     	leaq	(%r8,%r8,2), %r8
1454d151a:     	addq	%r15, %r8
1454d151d:     	addq	%rdi, %r8
1454d1520:     	cmpq	%r8, %rax
1454d1523:     	setb	%r8b
1454d1527:     	cmpq	%rcx, %rdx
1454d152a:     	setb	%cl
1454d152d:     	testb	%cl, %r8b
1454d1530:     	je	0x1454d164f <.text+0x54d064f>
1454d1536:     	xorl	%ecx, %ecx
1454d1538:     	jmp	0x1454d16e3 <.text+0x54d06e3>
1454d153d:     	cmpq	$-0x1, 0x68(%rbx)
1454d1542:     	je	0x1454d1632 <.text+0x54d0632>
1454d1548:     	leaq	0x68(%rbx), %rdx
1454d154c:     	leaq	-0x38(%rbp), %rcx
1454d1550:     	movaps	%xmm6, %xmm2
1454d1553:     	movaps	%xmm8, %xmm3
1454d1557:     	callq	0x14552d220 <.text+0x552c220>
1454d155c:     	nop
1454d155d:     	cmpl	$0x1, -0x38(%rbp)
1454d1561:     	jne	0x1454d1632 <.text+0x54d0632>
1454d1567:     	movd	-0x2c(%rbp), %xmm7
1454d156c:     	movq	0x160(%rbp), %rdx
1454d1573:     	testq	%rdx, %rdx
1454d1576:     	jne	0x1454d1397 <.text+0x54d0397>
1454d157c:     	jmp	0x1454d13ad <.text+0x54d03ad>
1454d1581:     	cmpl	$0xb, %ebx
1454d1584:     	je	0x1454d158f <.text+0x54d058f>
1454d1586:     	cmpl	$0x7, %ebx
1454d1589:     	jne	0x1454d1eef <.text+0x54d0eef>
1454d158f:     	leaq	0x8(%r14), %rbx
1454d1593:     	decq	%r12
1454d1596:     	movabsq	$0x1fffffffffffffff, %r15 # imm = 0x1FFFFFFFFFFFFFFF
1454d15a0:     	andq	%r12, %r15
1454d15a3:     	jmp	0x1454d15bd <.text+0x54d05bd>
1454d15a5:     	nopw	%cs:(%rax,%rax)
1454d15b0:     	addq	$0x8, %rbx
1454d15b4:     	decq	%r15
1454d15b7:     	je	0x1454d135d <.text+0x54d035d>
1454d15bd:     	movq	0x148(%rbp), %rax
1454d15c4:     	movss	(%r14), %xmm0
1454d15c9:     	movss	0x4(%r14), %xmm1
1454d15cf:     	subss	(%rax), %xmm0
1454d15d3:     	subss	0x4(%rax), %xmm1
1454d15d8:     	callq	0x145773277 <.text+0x5772277>
1454d15dd:     	movaps	%xmm0, %xmm6
1454d15e0:     	movq	0x148(%rbp), %rax
1454d15e7:     	movss	(%rbx), %xmm0
1454d15eb:     	movss	0x4(%rbx), %xmm1
1454d15f0:     	subss	(%rax), %xmm0
1454d15f4:     	subss	0x4(%rax), %xmm1
1454d15f9:     	callq	0x145773277 <.text+0x5772277>
1454d15fe:     	unpcklps	%xmm0, %xmm6            # xmm6 = xmm6[0],xmm0[0],xmm6[1],xmm0[1]
1454d1601:     	movaps	%xmm6, %xmm0
1454d1604:     	psrad	$0x1f, %xmm0
1454d1609:     	psrld	$0x1, %xmm0
1454d160e:     	pxor	%xmm6, %xmm0
1454d1612:     	pshufd	$0x55, %xmm0, %xmm1     # xmm1 = xmm0[1,1,1,1]
1454d1617:     	pcmpgtd	%xmm1, %xmm0
1454d161b:     	movd	%xmm0, %eax
1454d161f:     	testb	$0x1, %al
1454d1621:     	jne	0x1454d15b0 <.text+0x54d05b0>
1454d1623:     	movq	%rbx, %r14
1454d1626:     	jmp	0x1454d15b0 <.text+0x54d05b0>
1454d1628:     	movl	$0x4, %eax
1454d162d:     	jmp	0x1454d17a7 <.text+0x54d07a7>
1454d1632:     	movd	0xb8(%rbx), %xmm7
1454d163a:     	movq	0x160(%rbp), %rdx
1454d1641:     	testq	%rdx, %rdx
1454d1644:     	jne	0x1454d1397 <.text+0x54d0397>
1454d164a:     	jmp	0x1454d13ad <.text+0x54d03ad>
1454d164f:     	movl	%edi, %ecx
1454d1651:     	andl	$0x7, %ecx
1454d1654:     	movl	$0x8, %edx
1454d1659:     	cmovneq	%rcx, %rdx
1454d165d:     	movq	%rdi, %rcx
1454d1660:     	subq	%rdx, %rcx
1454d1663:     	leaq	0xdc(%r15), %rdx
1454d166a:     	xorl	%r8d, %r8d
1454d166d:     	movaps	0x152482c(%rip), %xmm0  # 0x1469f5ea0
1454d1674:     	nopw	%cs:(%rax,%rax)
1454d1680:     	movss	-0xc4(%rdx), %xmm1
1454d1688:     	movss	-0xa8(%rdx), %xmm2
1454d1690:     	unpcklps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
1454d1693:     	movss	-0x8c(%rdx), %xmm2
1454d169b:     	movss	-0x70(%rdx), %xmm3
1454d16a0:     	unpcklps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
1454d16a3:     	movlhps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0]
1454d16a6:     	movss	(%rdx), %xmm2
1454d16aa:     	movss	-0x1c(%rdx), %xmm3
1454d16af:     	unpcklps	%xmm2, %xmm3            # xmm3 = xmm3[0],xmm2[0],xmm3[1],xmm2[1]
1454d16b2:     	movss	-0x38(%rdx), %xmm2
1454d16b7:     	movss	-0x54(%rdx), %xmm4
1454d16bc:     	unpcklps	%xmm2, %xmm4            # xmm4 = xmm4[0],xmm2[0],xmm4[1],xmm2[1]
1454d16bf:     	movlhps	%xmm3, %xmm4            # xmm4 = xmm4[0],xmm3[0]
1454d16c2:     	mulps	%xmm0, %xmm1
1454d16c5:     	mulps	%xmm0, %xmm4
1454d16c8:     	movups	%xmm1, (%rax,%r8,4)
1454d16cd:     	movups	%xmm4, 0x10(%rax,%r8,4)
1454d16d3:     	addq	$0x8, %r8
1454d16d7:     	addq	$0xe0, %rdx
1454d16de:     	cmpq	%r8, %rcx
1454d16e1:     	jne	0x1454d1680 <.text+0x54d0680>
1454d16e3:     	movl	%edi, %r10d
1454d16e6:     	subl	%ecx, %r10d
1454d16e9:     	movq	%rcx, %rdx
1454d16ec:     	andl	$0x3, %r10d
1454d16f0:     	je	0x1454d173b <.text+0x54d073b>
1454d16f2:     	leaq	(%rcx,%rcx,8), %rdx
1454d16f6:     	leaq	(%rdx,%rdx,2), %rdx
1454d16fa:     	addq	%rcx, %rdx
1454d16fd:     	leaq	(%r15,%rdx), %r8
1454d1701:     	addq	$0x18, %r8
1454d1705:     	leaq	(,%r10,8), %r9
1454d170d:     	subq	%r10, %r9
1454d1710:     	xorl	%r10d, %r10d
1454d1713:     	movss	0x435e19(%rip), %xmm0   # 0x145907534
1454d171b:     	movq	%rcx, %rdx
1454d171e:     	nop
1454d1720:     	movss	(%r8,%r10,4), %xmm1
1454d1726:     	mulss	%xmm0, %xmm1
1454d172a:     	movss	%xmm1, (%rax,%rdx,4)
1454d172f:     	incq	%rdx
1454d1732:     	addq	$0x7, %r10
1454d1736:     	cmpq	%r10, %r9
1454d1739:     	jne	0x1454d1720 <.text+0x54d0720>
1454d173b:     	subq	%rdi, %rcx
1454d173e:     	cmpq	$-0x4, %rcx
1454d1742:     	ja	0x1454d17a7 <.text+0x54d07a7>
1454d1744:     	leaq	(%rdx,%rdx,8), %rcx
1454d1748:     	leaq	(%rcx,%rcx,2), %rcx
1454d174c:     	addq	%rdx, %rcx
1454d174f:     	addq	%r15, %rcx
1454d1752:     	addq	$0x6c, %rcx
1454d1756:     	movss	0x435dd6(%rip), %xmm0   # 0x145907534
1454d175e:     	nop
1454d1760:     	movss	-0x54(%rcx), %xmm1
1454d1765:     	mulss	%xmm0, %xmm1
1454d1769:     	movss	%xmm1, (%rax,%rdx,4)
1454d176e:     	movss	-0x38(%rcx), %xmm1
1454d1773:     	mulss	%xmm0, %xmm1
1454d1777:     	movss	%xmm1, 0x4(%rax,%rdx,4)
1454d177d:     	movss	-0x1c(%rcx), %xmm1
1454d1782:     	mulss	%xmm0, %xmm1
1454d1786:     	movss	%xmm1, 0x8(%rax,%rdx,4)
1454d178c:     	movss	(%rcx), %xmm1
1454d1790:     	mulss	%xmm0, %xmm1
1454d1794:     	movss	%xmm1, 0xc(%rax,%rdx,4)
1454d179a:     	addq	$0x4, %rdx
1454d179e:     	addq	$0x70, %rcx
1454d17a2:     	cmpq	%rdx, %rdi
1454d17a5:     	jne	0x1454d1760 <.text+0x54d0760>
1454d17a7:     	movq	%rdi, -0x20(%rbp)
1454d17ab:     	movq	%rax, -0x18(%rbp)
1454d17af:     	mulss	0x99c(%rsi), %xmm10
1454d17b8:     	movq	%rdi, -0x10(%rbp)
1454d17bc:     	sqrtss	%xmm10, %xmm10
1454d17c1:     	mulss	0x48(%r13), %xmm10
1454d17c7:     	movss	0x15246e1(%rip), %xmm0  # 0x1469f5eb0
1454d17cf:     	movaps	%xmm6, %xmm1
1454d17d2:     	callq	0x145773283 <.text+0x5772283>
1454d17d7:     	mulss	%xmm10, %xmm0
1454d17dc:     	xorps	%xmm1, %xmm1
1454d17df:     	punpcklwd	%xmm1, %xmm8    # xmm8 = xmm8[0],xmm1[0],xmm8[1],xmm1[1],xmm8[2],xmm1[2],xmm8[3],xmm1[3]
1454d17e4:     	movss	0x479bec(%rip), %xmm2   # 0x14594b3d8
1454d17ec:     	movaps	%xmm9, %xmm5
1454d17f0:     	mulss	%xmm2, %xmm5
1454d17f4:     	addss	0x75fce8(%rip), %xmm5   # 0x145c314e4
1454d17fc:     	cvtdq2ps	%xmm8, %xmm6
1454d1800:     	minss	0x46dfb8(%rip), %xmm5   # 0x14593f7c0
1454d1808:     	movss	0x934(%rsi), %xmm3
1454d1810:     	movss	0x435c78(%rip), %xmm4   # 0x145907490
1454d1818:     	addss	%xmm3, %xmm4
1454d181c:     	addss	%xmm3, %xmm2
1454d1820:     	movss	0x4c(%r13), %xmm8
1454d1826:     	unpcklps	%xmm8, %xmm0            # xmm0 = xmm0[0],xmm8[0],xmm0[1],xmm8[1]
1454d182a:     	movups	%xmm1, 0xa8(%rbp)
1454d1831:     	movups	%xmm1, 0x98(%rbp)
1454d1838:     	movups	%xmm1, 0x88(%rbp)
1454d183f:     	movups	%xmm1, 0x78(%rbp)
1454d1843:     	movq	%rbx, 0x50(%rbp)
1454d1847:     	movq	$0x0, 0x58(%rbp)
1454d184f:     	movq	%r13, -0x8(%rbp)
1454d1853:     	movb	$0x0, (%rbp)
1454d1857:     	movss	%xmm7, 0xb8(%rbp)
1454d185f:     	divps	0x117367a(%rip), %xmm6  # 0x146644ee0
1454d1866:     	movss	%xmm7, 0xbc(%rbp)
1454d186e:     	mulps	%xmm0, %xmm6
1454d1871:     	movlps	%xmm6, 0xc0(%rbp)
1454d1878:     	movl	$0x40000000, 0xc8(%rbp) # imm = 0x40000000
1454d1882:     	movss	%xmm5, 0xcc(%rbp)
1454d188a:     	movss	%xmm9, 0xd0(%rbp)
1454d1893:     	movq	0x150(%rbp), %rax
1454d189a:     	movq	%rax, 0xd4(%rbp)
1454d18a1:     	movl	0x158(%rbp), %eax
1454d18a7:     	movl	%eax, 0xdc(%rbp)
1454d18ad:     	movl	0x158(%rbp), %eax
1454d18b3:     	movl	%eax, 0xe8(%rbp)
1454d18b9:     	movq	0x150(%rbp), %rax
1454d18c0:     	movq	%rax, 0xe0(%rbp)
1454d18c7:     	movss	%xmm3, 0xec(%rbp)
1454d18cf:     	movl	$0x0, 0xf0(%rbp)
1454d18d9:     	movss	%xmm4, 0xf4(%rbp)
1454d18e1:     	movl	$0x40000000, 0xf8(%rbp) # imm = 0x40000000
1454d18eb:     	movups	%xmm1, 0x60(%rbp)
1454d18ef:     	movq	$0x0, 0x70(%rbp)
1454d18f7:     	movups	%xmm1, 0xfc(%rbp)
1454d18fe:     	movss	%xmm2, 0x10c(%rbp)
1454d1906:     	movss	%xmm3, 0x110(%rbp)
1454d190e:     	movq	$0x0, 0x114(%rbp)
1454d1919:     	movq	$0x0, -0x38(%rbp)
1454d1921:     	movq	$0x8, -0x30(%rbp)
1454d1929:     	movq	$0x0, -0x28(%rbp)
1454d1931:     	movl	$0x0, 0x11c(%rbp)
1454d193b:     	movl	$0x0, 0x30(%rbp)
1454d1942:     	movl	$0x0, 0x38(%rbp)
1454d1949:     	movb	$0x1, 0x120(%rbp)
1454d1950:     	movq	$-0x1, 0x8(%rbp)
1454d1958:     	movl	$0x0, 0x40(%rbp)
1454d195f:     	movq	0x4e8(%rsi), %rdi
1454d1966:     	cmpq	0x4d8(%rsi), %rdi
1454d196d:     	jne	0x1454d197c <.text+0x54d097c>
1454d196f:     	leaq	0x4d8(%rsi), %rcx
1454d1976:     	callq	0x145827b30 <.text+0x5826b30>
1454d197b:     	nop
1454d197c:     	leaq	0x30(%r13), %r14
1454d1980:     	imulq	$0x160, %rdi, %rcx      # imm = 0x160
1454d1987:     	addq	0x4e0(%rsi), %rcx
1454d198e:     	leaq	-0x38(%rbp), %rdx
1454d1992:     	movl	$0x160, %r8d            # imm = 0x160
1454d1998:     	callq	0x1457731ed <.text+0x57721ed>
1454d199d:     	incq	%rdi
1454d19a0:     	movq	%rdi, 0x4e8(%rsi)
1454d19a7:     	movq	%r14, 0x198(%rbp)
1454d19ae:     	movq	%r14, 0x160(%rbp)
1454d19b5:     	leaq	0x268a94(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454d19bc:     	movq	%rax, 0x168(%rbp)
1454d19c3:     	leaq	0x1259f57(%rip), %rdx   # 0x14672b921
1454d19ca:     	leaq	-0x38(%rbp), %rcx
1454d19ce:     	leaq	0x160(%rbp), %r8
1454d19d5:     	callq	0x145728390 <.text+0x5727390>
1454d19da:     	movq	-0x30(%rbp), %rcx
1454d19de:     	movq	-0x28(%rbp), %rdx
1454d19e2:     	movq	(%r13), %rdi
1454d19e6:     	movq	0x8(%r13), %r14
1454d19ea:     	movq	%rcx, 0x190(%rbp)
1454d19f1:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d19f6:     	nop
1454d19f7:     	movq	%rax, %r15
1454d19fa:     	movq	%rdx, %r12
1454d19fd:     	movq	%rbx, 0x188(%rbp)
1454d1a04:     	movq	-0x38(%rbp), %rdx
1454d1a08:     	testq	%rdx, %rdx
1454d1a0b:     	je	0x1454d1a1f <.text+0x54d0a1f>
1454d1a0d:     	movl	$0x1, %r8d
1454d1a13:     	movq	0x190(%rbp), %rcx
1454d1a1a:     	callq	0x1400021d0 <.text+0x11d0>
1454d1a1f:     	testq	%r15, %r15
1454d1a22:     	movq	%rdi, 0x190(%rbp)
1454d1a29:     	cmoveq	%rdi, %r15
1454d1a2d:     	movq	%r14, 0x138(%rbp)
1454d1a34:     	cmoveq	%r14, %r12
1454d1a38:     	leaq	0x30(%r13), %rax
1454d1a3c:     	movq	%rax, 0x160(%rbp)
1454d1a43:     	leaq	0x268a06(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454d1a4a:     	movq	%rax, 0x168(%rbp)
1454d1a51:     	leaq	0x1259ed7(%rip), %rdx   # 0x14672b92f
1454d1a58:     	leaq	-0x38(%rbp), %rcx
1454d1a5c:     	leaq	0x160(%rbp), %r8
1454d1a63:     	callq	0x145728390 <.text+0x5727390>
1454d1a68:     	movq	-0x30(%rbp), %rcx
1454d1a6c:     	movq	-0x28(%rbp), %rdx
1454d1a70:     	movq	0x20(%r13), %rbx
1454d1a74:     	movq	%r13, -0x40(%rbp)
1454d1a78:     	movq	0x28(%r13), %rdi
1454d1a7c:     	movq	%rcx, 0x140(%rbp)
1454d1a83:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d1a88:     	nop
1454d1a89:     	movq	%rax, %r14
1454d1a8c:     	movq	%rdx, %r13
1454d1a8f:     	movq	-0x38(%rbp), %rdx
1454d1a93:     	testq	%rdx, %rdx
1454d1a96:     	je	0x1454d1aaa <.text+0x54d0aaa>
1454d1a98:     	movl	$0x1, %r8d
1454d1a9e:     	movq	0x140(%rbp), %rcx
1454d1aa5:     	callq	0x1400021d0 <.text+0x11d0>
1454d1aaa:     	leaq	0x550(%rsi), %rax
1454d1ab1:     	testq	%r14, %r14
1454d1ab4:     	cmovneq	%r14, %rbx
1454d1ab8:     	cmoveq	%rdi, %r13
1454d1abc:     	movq	%r13, 0x28(%rsp)
1454d1ac1:     	movq	%rax, %r13
1454d1ac4:     	movq	%rbx, 0x20(%rsp)
1454d1ac9:     	leaq	-0x38(%rbp), %rcx
1454d1acd:     	movq	0x188(%rbp), %rdx
1454d1ad4:     	movq	%r15, %r8
1454d1ad7:     	movq	%r12, %r9
1454d1ada:     	callq	0x14545b960 <.text+0x545a960>
1454d1adf:     	movq	0x560(%rsi), %rdi
1454d1ae6:     	cmpq	0x550(%rsi), %rdi
1454d1aed:     	jne	0x1454d1af8 <.text+0x54d0af8>
1454d1aef:     	movq	%r13, %rcx
1454d1af2:     	callq	0x145774710 <.text+0x5773710>
1454d1af7:     	nop
1454d1af8:     	movq	0x558(%rsi), %rax
1454d1aff:     	movq	%rdi, %rcx
1454d1b02:     	shlq	$0x5, %rcx
1454d1b06:     	movups	-0x38(%rbp), %xmm0
1454d1b0a:     	movups	-0x28(%rbp), %xmm1
1454d1b0e:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d1b13:     	movups	%xmm0, (%rax,%rcx)
1454d1b17:     	incq	%rdi
1454d1b1a:     	movq	%rdi, 0x560(%rsi)
1454d1b21:     	movq	0x198(%rbp), %rax
1454d1b28:     	movq	%rax, 0x160(%rbp)
1454d1b2f:     	leaq	0x26891a(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454d1b36:     	movq	%rax, 0x168(%rbp)
1454d1b3d:     	leaq	0x1259ddd(%rip), %rdx   # 0x14672b921
1454d1b44:     	leaq	-0x38(%rbp), %rcx
1454d1b48:     	leaq	0x160(%rbp), %r8
1454d1b4f:     	callq	0x145728390 <.text+0x5727390>
1454d1b54:     	movq	-0x30(%rbp), %rcx
1454d1b58:     	movq	-0x28(%rbp), %rdx
1454d1b5c:     	movq	%rcx, 0x188(%rbp)
1454d1b63:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d1b68:     	nop
1454d1b69:     	movq	-0x40(%rbp), %r12
1454d1b6d:     	movq	0x190(%rbp), %rdi
1454d1b74:     	movq	0x138(%rbp), %r14
1454d1b7b:     	movq	%rax, %rbx
1454d1b7e:     	movq	%rdx, %r15
1454d1b81:     	movq	-0x38(%rbp), %rdx
1454d1b85:     	testq	%rdx, %rdx
1454d1b88:     	je	0x1454d1b9c <.text+0x54d0b9c>
1454d1b8a:     	movl	$0x1, %r8d
1454d1b90:     	movq	0x188(%rbp), %rcx
1454d1b97:     	callq	0x1400021d0 <.text+0x11d0>
1454d1b9c:     	testq	%rbx, %rbx
1454d1b9f:     	cmoveq	%rdi, %rbx
1454d1ba3:     	cmoveq	%r14, %r15
1454d1ba7:     	leaq	0x15254b2(%rip), %r14   # 0x1469f7060
1454d1bae:     	movl	$0x1a, %edi
1454d1bb3:     	movl	$0x1a, %edx
1454d1bb8:     	movq	%r14, %rcx
1454d1bbb:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d1bc0:     	testq	%rax, %rax
1454d1bc3:     	cmovneq	%rax, %r14
1454d1bc7:     	cmoveq	%rdi, %rdx
1454d1bcb:     	movq	%rdx, 0x20(%rsp)
1454d1bd0:     	leaq	-0x38(%rbp), %rcx
1454d1bd4:     	movq	%rbx, %rdx
1454d1bd7:     	movq	%r15, %r8
1454d1bda:     	movq	%r14, %r9
1454d1bdd:     	callq	0x145459d40 <.text+0x5458d40>
1454d1be2:     	movq	0x560(%rsi), %rdi
1454d1be9:     	cmpq	0x550(%rsi), %rdi
1454d1bf0:     	jne	0x1454d1bfb <.text+0x54d0bfb>
1454d1bf2:     	movq	%r13, %rcx
1454d1bf5:     	callq	0x145774710 <.text+0x5773710>
1454d1bfa:     	nop
1454d1bfb:     	movq	0x558(%rsi), %rax
1454d1c02:     	movq	%rdi, %rcx
1454d1c05:     	shlq	$0x5, %rcx
1454d1c09:     	movups	-0x38(%rbp), %xmm0
1454d1c0d:     	movups	-0x28(%rbp), %xmm1
1454d1c11:     	movups	%xmm1, 0x10(%rax,%rcx)
1454d1c16:     	movups	%xmm0, (%rax,%rcx)
1454d1c1a:     	incq	%rdi
1454d1c1d:     	movq	%rdi, 0x560(%rsi)
1454d1c24:     	callq	0x140002200 <.text+0x1200>
1454d1c29:     	movl	$0x20, %ecx
1454d1c2e:     	movl	$0x1, %edx
1454d1c33:     	callq	0x1400021c0 <.text+0x11c0>
1454d1c38:     	testq	%rax, %rax
1454d1c3b:     	je	0x1454d1f96 <.text+0x54d0f96>
1454d1c41:     	movq	%rax, 0x188(%rbp)
1454d1c48:     	movl	$0x1fee, (%rax)         # imm = 0x1FEE
1454d1c4e:     	movq	0x560(%rsi), %rdi
1454d1c55:     	cmpq	0x550(%rsi), %rdi
1454d1c5c:     	jne	0x1454d1c67 <.text+0x54d0c67>
1454d1c5e:     	movq	%r13, %rcx
1454d1c61:     	callq	0x145774710 <.text+0x5773710>
1454d1c66:     	nop
1454d1c67:     	movq	0x558(%rsi), %rax
1454d1c6e:     	movq	%rdi, %rcx
1454d1c71:     	shlq	$0x5, %rcx
1454d1c75:     	movq	$0x20, (%rax,%rcx)
1454d1c7d:     	movq	0x188(%rbp), %rdx
1454d1c84:     	movq	%rdx, 0x8(%rax,%rcx)
1454d1c89:     	movq	$0x4, 0x10(%rax,%rcx)
1454d1c92:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
1454d1c99:     	incq	%rdi
1454d1c9c:     	movq	%rdi, 0x560(%rsi)
1454d1ca3:     	callq	0x140002200 <.text+0x1200>
1454d1ca8:     	movl	$0x1, %ecx
1454d1cad:     	movl	$0x1, %edx
1454d1cb2:     	callq	0x1400021c0 <.text+0x11c0>
1454d1cb7:     	testq	%rax, %rax
1454d1cba:     	je	0x1454d1fa7 <.text+0x54d0fa7>
1454d1cc0:     	movb	$0x7b, (%rax)
1454d1cc3:     	movq	$0x1, -0x38(%rbp)
1454d1ccb:     	movq	%rax, -0x30(%rbp)
1454d1ccf:     	movq	$0x1, -0x28(%rbp)
1454d1cd7:     	movb	$0x1, -0x20(%rbp)
1454d1cdb:     	leaq	0x15245bf(%rip), %rax   # 0x1469f62a1
1454d1ce2:     	movq	%rax, 0x20(%rsp)
1454d1ce7:     	movq	$0x4, 0x28(%rsp)
1454d1cf0:     	leaq	0x1524ddd(%rip), %r8    # 0x1469f6ad4
1454d1cf7:     	leaq	0x160(%rbp), %rcx
1454d1cfe:     	leaq	-0x38(%rbp), %rdx
1454d1d02:     	movl	$0x4, %r9d
1454d1d08:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d1d0d:     	movq	0x198(%rbp), %rax
1454d1d14:     	movq	%rax, 0x128(%rbp)
1454d1d1b:     	leaq	0x26872e(%rip), %rax    # 0x14573a450 <.text+0x5739450>
1454d1d22:     	movq	%rax, 0x130(%rbp)
1454d1d29:     	movb	$0x1, 0x1a7(%rbp)
1454d1d30:     	leaq	0x1259bea(%rip), %rdx   # 0x14672b921
1454d1d37:     	leaq	-0x38(%rbp), %rcx
1454d1d3b:     	leaq	0x128(%rbp), %r8
1454d1d42:     	callq	0x145728390 <.text+0x5727390>
1454d1d47:     	nop
1454d1d48:     	movq	-0x30(%rbp), %rcx
1454d1d4c:     	movq	-0x28(%rbp), %rdx
1454d1d50:     	movq	%rcx, 0x198(%rbp)
1454d1d57:     	callq	0x145457cb0 <.text+0x5456cb0>
1454d1d5c:     	nop
1454d1d5d:     	movq	%rax, %r14
1454d1d60:     	movq	%rdx, %rbx
1454d1d63:     	movq	-0x38(%rbp), %rdx
1454d1d67:     	testq	%rdx, %rdx
1454d1d6a:     	je	0x1454d1d7e <.text+0x54d0d7e>
1454d1d6c:     	movl	$0x1, %r8d
1454d1d72:     	movq	0x198(%rbp), %rcx
1454d1d79:     	callq	0x1400021d0 <.text+0x11d0>
1454d1d7e:     	testq	%r14, %r14
1454d1d81:     	movq	0x190(%rbp), %rax
1454d1d88:     	cmovneq	%r14, %rax
1454d1d8c:     	cmoveq	0x138(%rbp), %rbx
1454d1d94:     	movb	$0x0, 0x1a7(%rbp)
1454d1d9b:     	movq	%rbx, 0x28(%rsp)
1454d1da0:     	movq	%rax, 0x20(%rsp)
1454d1da5:     	leaq	0x1524cfd(%rip), %r8    # 0x1469f6aa9
1454d1dac:     	leaq	-0x38(%rbp), %rcx
1454d1db0:     	leaq	0x160(%rbp), %rdx
1454d1db7:     	movl	$0x4, %r9d
1454d1dbd:     	callq	0x145456ed0 <.text+0x5455ed0>
1454d1dc2:     	nop
1454d1dc3:     	movb	0x54(%r12), %bl
1454d1dc8:     	leaq	0x15244d6(%rip), %rdx   # 0x1469f62a5
1454d1dcf:     	leaq	-0x38(%rbp), %rcx
1454d1dd3:     	movl	$0x5, %r8d
1454d1dd9:     	callq	0x145456c20 <.text+0x5455c20>
1454d1dde:     	nop
1454d1ddf:     	movzbl	%bl, %edi
1454d1de2:     	xorq	$0x5, %rdi
1454d1de6:     	movq	-0x38(%rbp), %rax
1454d1dea:     	movq	-0x28(%rbp), %rcx
1454d1dee:     	subq	%rcx, %rax
1454d1df1:     	cmpq	%rax, %rdi
1454d1df4:     	ja	0x1454d1f3d <.text+0x54d0f3d>
1454d1dfa:     	leaq	0x126e486(%rip), %rax   # 0x146740287
1454d1e01:     	leaq	0x126e47a(%rip), %rdx   # 0x146740282
1454d1e08:     	testb	%bl, %bl
1454d1e0a:     	cmovneq	%rax, %rdx
1454d1e0e:     	addq	-0x30(%rbp), %rcx
1454d1e12:     	movq	%rdi, %r8
1454d1e15:     	callq	0x1457731ed <.text+0x57721ed>
1454d1e1a:     	addq	%rdi, -0x28(%rbp)
1454d1e1e:     	movups	-0x38(%rbp), %xmm0
1454d1e22:     	movaps	%xmm0, 0x160(%rbp)
1454d1e29:     	movups	-0x28(%rbp), %xmm0
1454d1e2d:     	movaps	%xmm0, 0x170(%rbp)
1454d1e34:     	movq	0x170(%rbp), %rdi
1454d1e3b:     	movq	0x160(%rbp), %rax
1454d1e42:     	cmpq	%rdi, %rax
1454d1e45:     	je	0x1454d1f65 <.text+0x54d0f65>
1454d1e4b:     	movq	%rax, 0x198(%rbp)
1454d1e52:     	movq	0x168(%rbp), %rax
1454d1e59:     	movq	%rax, 0x190(%rbp)
1454d1e60:     	movb	$0x7d, (%rax,%rdi)
1454d1e64:     	movq	0x578(%rsi), %rbx
1454d1e6b:     	cmpq	0x568(%rsi), %rbx
1454d1e72:     	jne	0x1454d1e81 <.text+0x54d0e81>
1454d1e74:     	leaq	0x568(%rsi), %rcx
1454d1e7b:     	callq	0x1457745c0 <.text+0x57735c0>
1454d1e80:     	nop
1454d1e81:     	incq	%rdi
1454d1e84:     	movq	0x570(%rsi), %rax
1454d1e8b:     	leaq	(%rbx,%rbx,2), %rcx
1454d1e8f:     	movq	0x198(%rbp), %rdx
1454d1e96:     	movq	%rdx, (%rax,%rcx,8)
1454d1e9a:     	movq	0x190(%rbp), %rdx
1454d1ea1:     	movq	%rdx, 0x8(%rax,%rcx,8)
1454d1ea6:     	movq	%rdi, 0x10(%rax,%rcx,8)
1454d1eab:     	incq	%rbx
1454d1eae:     	movq	%rbx, 0x578(%rsi)
1454d1eb5:     	movaps	0x1b0(%rbp), %xmm6
1454d1ebc:     	movaps	0x1c0(%rbp), %xmm7
1454d1ec3:     	movaps	0x1d0(%rbp), %xmm8
1454d1ecb:     	movaps	0x1e0(%rbp), %xmm9
1454d1ed3:     	movaps	0x1f0(%rbp), %xmm10
1454d1edb:     	addq	$0x288, %rsp            # imm = 0x288
1454d1ee2:     	popq	%rbx
1454d1ee3:     	popq	%rdi
1454d1ee4:     	popq	%rsi
1454d1ee5:     	popq	%r12
1454d1ee7:     	popq	%r13
1454d1ee9:     	popq	%r14
1454d1eeb:     	popq	%r15
1454d1eed:     	popq	%rbp
1454d1eee:     	retq
1454d1eef:     	movq	0x160(%rbp), %rdx
1454d1ef6:     	testq	%rdx, %rdx
1454d1ef9:     	je	0x1454d1f11 <.text+0x54d0f11>
1454d1efb:     	movq	0x168(%rbp), %rcx
1454d1f02:     	shlq	$0x3, %rdx
1454d1f06:     	movl	$0x8, %r8d
1454d1f0c:     	callq	0x1400021d0 <.text+0x11d0>
1454d1f11:     	movl	$0x0, 0x20(%rsp)
1454d1f19:     	leaq	0x150(%rbp), %rcx
1454d1f20:     	movss	0x46d9fc(%rip), %xmm2   # 0x14593f924
1454d1f28:     	movss	0x47f340(%rip), %xmm3   # 0x145951270
1454d1f30:     	movq	%rsi, %rdx
1454d1f33:     	callq	0x1454d38a0 <.text+0x54d28a0>
1454d1f38:     	jmp	0x1454d13bc <.text+0x54d03bc>
1454d1f3d:     	movq	$0x1, 0x20(%rsp)
1454d1f46:     	movq	%rcx, %rdx
1454d1f49:     	leaq	-0x38(%rbp), %rcx
1454d1f4d:     	movl	$0x1, %r9d
1454d1f53:     	movq	%rdi, %r8
1454d1f56:     	callq	0x1457744b0 <.text+0x57734b0>
1454d1f5b:     	nop
1454d1f5c:     	movq	-0x28(%rbp), %rcx
1454d1f60:     	jmp	0x1454d1dfa <.text+0x54d0dfa>
1454d1f65:     	movq	$0x1, 0x20(%rsp)
1454d1f6e:     	leaq	0x160(%rbp), %rcx
1454d1f75:     	movl	$0x1, %r8d
1454d1f7b:     	movl	$0x1, %r9d
1454d1f81:     	movq	%rdi, %rdx
1454d1f84:     	callq	0x1457744b0 <.text+0x57734b0>
1454d1f89:     	nop
1454d1f8a:     	movq	0x160(%rbp), %rax
1454d1f91:     	jmp	0x1454d1e4b <.text+0x54d0e4b>
1454d1f96:     	movl	$0x1, %ecx
1454d1f9b:     	movl	$0x20, %edx
1454d1fa0:     	callq	0x14590379b <.text+0x590279b>
1454d1fa5:     	ud2
1454d1fa7:     	movl	$0x1, %ecx
1454d1fac:     	movl	$0x1, %edx
1454d1fb1:     	callq	0x14590379b <.text+0x590279b>
1454d1fb6:     	ud2
1454d1fb8:     	leaq	0x1525349(%rip), %r8    # 0x1469f7308
1454d1fbf:     	movq	%rdx, %rcx
1454d1fc2:     	movq	%r9, %rdx
1454d1fc5:     	callq	0x145903b33 <.text+0x5902b33>
1454d1fca:     	nop
1454d1fcb:     	ud2
1454d1fcd:     	movl	$0x4, %ecx
1454d1fd2:     	movq	%r14, %rdx
1454d1fd5:     	callq	0x14590379b <.text+0x590279b>
1454d1fda:     	ud2
