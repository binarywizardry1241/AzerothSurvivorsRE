
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
140272060:     	pushq	%rbp
140272061:     	pushq	%r15
140272063:     	pushq	%r14
140272065:     	pushq	%r13
140272067:     	pushq	%r12
140272069:     	pushq	%rsi
14027206a:     	pushq	%rdi
14027206b:     	pushq	%rbx
14027206c:     	movl	$0x10b8, %eax           # imm = 0x10B8
140272071:     	callq	0x145bc8c10 <.text+0x5bc7c10>
140272076:     	subq	%rax, %rsp
140272079:     	leaq	0x80(%rsp), %rbp
140272081:     	movq	$-0x2, 0x1030(%rbp)
14027208c:     	movq	%rcx, %r14
14027208f:     	leaq	0x5b4e0da(%rip), %rdx   # 0x145dc0170
140272096:     	leaq	-0x60(%rbp), %rcx
14027209a:     	movl	$0x3, %r8d
1402720a0:     	callq	0x1458ddb50 <.text+0x58dcb50>
1402720a5:     	movq	-0x60(%rbp), %rax
1402720a9:     	cmpq	$-0x1, %rax
1402720ad:     	je	0x14027244e <.text+0x27144e>
1402720b3:     	movq	%rax, 0xf90(%rbp)
1402720ba:     	movq	%r14, 0xf80(%rbp)
1402720c1:     	movq	-0x58(%rbp), %rbx
1402720c5:     	movq	-0x50(%rbp), %rdi
1402720c9:     	movq	$0x0, 0xf88(%rbp)
1402720d4:     	leaq	0xfa0(%rbp), %r12
1402720db:     	movl	$0x0, 0x1018(%rbp)
1402720e5:     	xorl	%r15d, %r15d
1402720e8:     	xorl	%esi, %esi
1402720ea:     	xorl	%r14d, %r14d
1402720ed:     	movq	%rbx, 0x1020(%rbp)
1402720f4:     	testb	$0x1, %r14b
1402720f8:     	je	0x140272157 <.text+0x271157>
1402720fa:     	movq	0xf90(%rbp), %rdx
140272101:     	testq	%rdx, %rdx
140272104:     	je	0x140272114 <.text+0x271114>
140272106:     	movl	$0x1, %r8d
14027210c:     	movq	%rbx, %rcx
14027210f:     	callq	0x1400021d0 <.text+0x11d0>
140272114:     	movq	0xf80(%rbp), %r14
14027211b:     	movq	0xf88(%rbp), %r15
140272122:     	movl	0xf98(%rbp), %r12d
140272129:     	movl	0xf9c(%rbp), %r13d
140272130:     	jmp	0x14027245b <.text+0x27145b>
140272135:     	nopw	%cs:(%rax,%rax)
140272140:     	movq	0x1020(%rbp), %rbx
140272147:     	movl	0x1014(%rbp), %r14d
14027214e:     	movq	%r13, %r15
140272151:     	testb	$0x1, %r14b
140272155:     	jne	0x1402720fa <.text+0x2710fa>
140272157:     	cmpq	%rsi, %rdi
14027215a:     	jae	0x14027217c <.text+0x27117c>
14027215c:     	movq	%rsi, %r13
14027215f:     	jmp	0x140272223 <.text+0x271223>
140272164:     	nopw	%cs:(%rax,%rax)
140272170:     	movq	%r13, %rsi
140272173:     	cmpq	%rdi, %r13
140272176:     	ja	0x140272223 <.text+0x271223>
14027217c:     	movq	%rdi, %r8
14027217f:     	subq	%rsi, %r8
140272182:     	leaq	(%rbx,%rsi), %r14
140272186:     	cmpq	$0x10, %r8
14027218a:     	jae	0x1402721c0 <.text+0x2711c0>
14027218c:     	xorl	%edx, %edx
14027218e:     	testq	%r8, %r8
140272191:     	je	0x1402721b2 <.text+0x2711b2>
140272193:     	nopw	%cs:(%rax,%rax)
1402721a0:     	cmpb	$0xa, (%r14,%rdx)
1402721a5:     	je	0x1402721da <.text+0x2711da>
1402721a7:     	incq	%rdx
1402721aa:     	cmpq	%rdx, %r8
1402721ad:     	jne	0x1402721a0 <.text+0x2711a0>
1402721af:     	movq	%r8, %rdx
1402721b2:     	xorl	%eax, %eax
1402721b4:     	cmpq	$0x1, %rax
1402721b8:     	je	0x1402721f0 <.text+0x2711f0>
1402721ba:     	jmp	0x140272220 <.text+0x271220>
1402721bc:     	nopl	(%rax)
1402721c0:     	movb	$0xa, %cl
1402721c2:     	movq	%r14, %rdx
1402721c5:     	callq	0x145ba4f00 <.text+0x5ba3f00>
1402721ca:     	nop
1402721cb:     	movq	0x1020(%rbp), %rbx
1402721d2:     	cmpq	$0x1, %rax
1402721d6:     	je	0x1402721f0 <.text+0x2711f0>
1402721d8:     	jmp	0x140272220 <.text+0x271220>
1402721da:     	movl	$0x1, %eax
1402721df:     	cmpq	$0x1, %rax
1402721e3:     	jne	0x140272220 <.text+0x271220>
1402721e5:     	nopw	%cs:(%rax,%rax)
1402721f0:     	leaq	(%rdx,%rsi), %r13
1402721f4:     	incq	%r13
1402721f7:     	addq	%rdx, %rsi
1402721fa:     	cmpq	%rdi, %rsi
1402721fd:     	jae	0x140272170 <.text+0x271170>
140272203:     	cmpb	$0xa, (%r14,%rdx)
140272208:     	jne	0x140272170 <.text+0x271170>
14027220e:     	xorl	%r9d, %r9d
140272211:     	movq	%r13, %rsi
140272214:     	movq	%r13, %rdx
140272217:     	jmp	0x140272238 <.text+0x271238>
140272219:     	nopl	(%rax)
140272220:     	movq	%rdi, %r13
140272223:     	movq	%r13, %rsi
140272226:     	movb	$0x1, %r9b
140272229:     	movq	%r15, %r13
14027222c:     	movq	%rdi, %rdx
14027222f:     	cmpq	%r15, %rdi
140272232:     	je	0x1402720fa <.text+0x2710fa>
140272238:     	leaq	(%rbx,%r15), %rax
14027223c:     	movq	%rdx, %rcx
14027223f:     	subq	%r15, %rcx
140272242:     	je	0x140272270 <.text+0x271270>
140272244:     	cmpb	$0xa, -0x1(%rbx,%rdx)
140272249:     	jne	0x140272270 <.text+0x271270>
14027224b:     	movq	%rcx, %r8
14027224e:     	decq	%r8
140272251:     	je	0x140272260 <.text+0x271260>
140272253:     	cmpb	$0xd, -0x2(%rbx,%rdx)
140272258:     	jne	0x140272264 <.text+0x271264>
14027225a:     	addq	$-0x2, %rcx
14027225e:     	jmp	0x140272270 <.text+0x271270>
140272260:     	xorl	%ecx, %ecx
140272262:     	jmp	0x140272270 <.text+0x271270>
140272264:     	movq	%r8, %rcx
140272267:     	nopw	(%rax,%rax)
140272270:     	movl	%r9d, 0x1014(%rbp)
140272277:     	leaq	(%rax,%rcx), %rdx
14027227b:     	movq	$0x0, -0x60(%rbp)
140272283:     	movq	%rcx, -0x58(%rbp)
140272287:     	movq	%rax, -0x50(%rbp)
14027228b:     	movq	%rcx, -0x48(%rbp)
14027228f:     	movq	%rax, -0x40(%rbp)
140272293:     	movq	%rdx, -0x38(%rbp)
140272297:     	movq	$0x0, -0x30(%rbp)
14027229f:     	movw	$0x1, -0x28(%rbp)
1402722a5:     	movq	%r12, %rcx
1402722a8:     	leaq	-0x60(%rbp), %rdx
1402722ac:     	callq	0x14025ede0 <.text+0x25dde0>
1402722b1:     	nop
1402722b2:     	cmpq	$0x3, 0xfb0(%rbp)
1402722ba:     	jne	0x140272314 <.text+0x271314>
1402722bc:     	movq	%r12, %rbx
1402722bf:     	movq	0xfa8(%rbp), %rax
1402722c6:     	movq	(%rax), %rcx
1402722c9:     	movq	%rcx, 0xf70(%rbp)
1402722d0:     	movq	0x8(%rax), %rcx
1402722d4:     	movq	%rcx, 0xf68(%rbp)
1402722db:     	movq	0x10(%rax), %rcx
1402722df:     	movq	0x18(%rax), %rdx
1402722e3:     	movq	0x20(%rax), %r15
1402722e7:     	movq	%rax, 0xf78(%rbp)
1402722ee:     	movq	0x28(%rax), %r12
1402722f2:     	callq	0x145baaf70 <.text+0x5ba9f70>
1402722f7:     	nop
1402722f8:     	movq	%rax, %r14
1402722fb:     	movq	%r15, %rcx
1402722fe:     	movq	%r12, %rdx
140272301:     	callq	0x145baaf70 <.text+0x5ba9f70>
140272306:     	nop
140272307:     	movl	%r14d, %ecx
14027230a:     	orl	%eax, %ecx
14027230c:     	testb	$0x1, %cl
14027230f:     	movq	%rbx, %r12
140272312:     	je	0x140272360 <.text+0x271360>
140272314:     	movq	0xfa0(%rbp), %rdx
14027231b:     	testq	%rdx, %rdx
14027231e:     	je	0x140272140 <.text+0x271140>
140272324:     	movq	0xfa8(%rbp), %rcx
14027232b:     	movq	0x1020(%rbp), %rbx
140272332:     	movl	0x1014(%rbp), %r14d
140272339:     	shlq	$0x4, %rdx
14027233d:     	movl	$0x8, %r8d
140272343:     	callq	0x1400021d0 <.text+0x11d0>
140272348:     	movq	%r13, %r15
14027234b:     	testb	$0x1, %r14b
14027234f:     	je	0x140272157 <.text+0x271157>
140272355:     	jmp	0x1402720fa <.text+0x2710fa>
14027235a:     	nopw	(%rax,%rax)
140272360:     	shrq	$0x20, %r14
140272364:     	shrq	$0x20, %rax
140272368:     	movl	%r14d, %edx
14027236b:     	andl	$0x7fffffff, %edx       # imm = 0x7FFFFFFF
140272371:     	movl	%eax, %ecx
140272373:     	andl	$0x7fffffff, %ecx       # imm = 0x7FFFFFFF
140272379:     	cmpl	$0x7f800000, %ecx       # imm = 0x7F800000
14027237f:     	setl	%cl
140272382:     	cmpl	$0x7f7fffff, %edx       # imm = 0x7F7FFFFF
140272388:     	jg	0x140272314 <.text+0x271314>
14027238a:     	testb	%cl, %cl
14027238c:     	je	0x140272314 <.text+0x271314>
14027238e:     	cmpq	$0x5, 0xf68(%rbp)
140272396:     	jne	0x1402723fc <.text+0x2713fc>
140272398:     	movq	0xf70(%rbp), %r8
14027239f:     	movl	(%r8), %ecx
1402723a2:     	movl	$0x6c6c6174, %edx       # imm = 0x6C6C6174
1402723a7:     	xorl	%edx, %ecx
1402723a9:     	movzbl	0x4(%r8), %edx
1402723ae:     	xorl	$0x79, %edx
1402723b1:     	orl	%ecx, %edx
1402723b3:     	movq	0x1020(%rbp), %rbx
1402723ba:     	je	0x140272414 <.text+0x271414>
1402723bc:     	movl	(%r8), %ecx
1402723bf:     	movl	$0x6c697562, %edx       # imm = 0x6C697562
1402723c4:     	xorl	%edx, %ecx
1402723c6:     	movzbl	0x4(%r8), %edx
1402723cb:     	xorl	$0x64, %edx
1402723ce:     	orl	%ecx, %edx
1402723d0:     	jne	0x1402723eb <.text+0x2713eb>
1402723d2:     	movl	$0x1, %ecx
1402723d7:     	movq	%rcx, 0xf88(%rbp)
1402723de:     	movl	%eax, 0xf98(%rbp)
1402723e4:     	movl	%r14d, 0xf9c(%rbp)
1402723eb:     	movl	0x1028(%rbp), %eax
1402723f1:     	movl	0x101c(%rbp), %ecx
1402723f7:     	movl	%ecx, %r14d
1402723fa:     	jmp	0x14027241e <.text+0x27141e>
1402723fc:     	movl	0x1028(%rbp), %eax
140272402:     	movl	0x101c(%rbp), %ecx
140272408:     	movl	%ecx, %r14d
14027240b:     	movq	0x1020(%rbp), %rbx
140272412:     	jmp	0x14027241e <.text+0x27141e>
140272414:     	movl	$0x1, 0x1018(%rbp)
14027241e:     	movq	0xfa0(%rbp), %rdx
140272425:     	movl	%eax, 0x1028(%rbp)
14027242b:     	movl	%r14d, 0x101c(%rbp)
140272432:     	testq	%rdx, %rdx
140272435:     	movl	0x1014(%rbp), %r14d
14027243c:     	movq	0xf78(%rbp), %rcx
140272443:     	jne	0x140272339 <.text+0x271339>
140272449:     	jmp	0x140272348 <.text+0x271348>
14027244e:     	xorl	%r15d, %r15d
140272451:     	movl	$0x0, 0x1018(%rbp)
14027245b:     	leaq	0x40(%r14), %rdi
14027245f:     	leaq	0x5a8(%r14), %rax
140272466:     	movq	%rdi, 0xfb8(%rbp)
14027246d:     	movq	%rax, 0xfc0(%rbp)
140272474:     	movq	$0x0, 0xfa0(%rbp)
14027247f:     	movq	$0x8, 0xfa8(%rbp)
14027248a:     	movq	$0x0, 0xfb0(%rbp)
140272495:     	cmpq	$0x0, 0x90(%r14)
14027249d:     	je	0x14027254b <.text+0x27154b>
1402724a3:     	movabsq	$-0x482eb6960cf569d8, %rdx # imm = 0xB7D14969F30A9628
1402724ad:     	movq	0x78(%r14), %rcx
1402724b1:     	movq	0x80(%r14), %r8
1402724b8:     	xorl	%r9d, %r9d
1402724bb:     	movdqa	0x5b28a9d(%rip), %xmm0  # 0x145d9af60
1402724c3:     	pcmpeqd	%xmm1, %xmm1
1402724c7:     	movdqa	0x5b4d031(%rip), %xmm2  # 0x145dbf500
1402724cf:     	andq	%r8, %rdx
1402724d2:     	movdqu	(%rcx,%rdx), %xmm3
1402724d7:     	movdqa	%xmm3, %xmm4
1402724db:     	pcmpeqb	%xmm0, %xmm4
1402724df:     	pmovmskb	%xmm4, %r10d
1402724e4:     	testl	%r10d, %r10d
1402724e7:     	je	0x140272530 <.text+0x271530>
1402724e9:     	tzcntl	%r10d, %r11d
1402724ee:     	addq	%rdx, %r11
1402724f1:     	andq	%r8, %r11
1402724f4:     	negq	%r11
1402724f7:     	leaq	(%r11,%r11,2), %r11
1402724fb:     	movdqu	-0x18(%rcx,%r11,8), %xmm4
140272502:     	pcmpeqb	%xmm2, %xmm4
140272506:     	pmovmskb	%xmm4, %esi
14027250a:     	cmpl	$0xffff, %esi           # imm = 0xFFFF
140272510:     	je	0x140272608 <.text+0x271608>
140272516:     	leal	-0x1(%r10), %r11d
14027251a:     	andw	%r10w, %r11w
14027251e:     	movl	%r11d, %r10d
140272521:     	jne	0x1402724e9 <.text+0x2714e9>
140272523:     	nopw	%cs:(%rax,%rax)
140272530:     	pcmpeqb	%xmm1, %xmm3
140272534:     	pmovmskb	%xmm3, %r10d
140272539:     	testl	%r10d, %r10d
14027253c:     	jne	0x14027254b <.text+0x27154b>
14027253e:     	addq	%r9, %rdx
140272541:     	addq	$0x10, %rdx
140272545:     	addq	$0x10, %r9
140272549:     	jmp	0x1402724cf <.text+0x2714cf>
14027254b:     	movzbl	0xa0(%r14), %ecx
140272553:     	movq	0xe0(%r14), %rcx
14027255a:     	movq	0xe8(%r14), %rdx
140272561:     	movabsq	$-0x482eb6960cf569d8, %r8 # imm = 0xB7D14969F30A9628
14027256b:     	xorl	%r9d, %r9d
14027256e:     	movdqa	0x5b289ea(%rip), %xmm0  # 0x145d9af60
140272576:     	pcmpeqd	%xmm1, %xmm1
14027257a:     	movdqa	0x5b4cf7e(%rip), %xmm2  # 0x145dbf500
140272582:     	andq	%rdx, %r8
140272585:     	movdqu	(%rcx,%r8), %xmm3
14027258b:     	movdqa	%xmm3, %xmm4
14027258f:     	pcmpeqb	%xmm0, %xmm4
140272593:     	pmovmskb	%xmm4, %esi
140272597:     	testl	%esi, %esi
140272599:     	je	0x1402725e0 <.text+0x2715e0>
14027259b:     	tzcntl	%esi, %r11d
1402725a0:     	addq	%r8, %r11
1402725a3:     	andq	%rdx, %r11
1402725a6:     	movq	%r11, %rbx
1402725a9:     	shlq	$0x7, %rbx
1402725ad:     	movq	%rcx, %r10
1402725b0:     	subq	%rbx, %r10
1402725b3:     	movdqu	-0x80(%r10), %xmm4
1402725b9:     	pcmpeqb	%xmm2, %xmm4
1402725bd:     	pmovmskb	%xmm4, %ebx
1402725c1:     	cmpl	$0xffff, %ebx           # imm = 0xFFFF
1402725c7:     	je	0x14027262b <.text+0x27162b>
1402725c9:     	leal	-0x1(%rsi), %r10d
1402725cd:     	andw	%si, %r10w
1402725d1:     	movl	%r10d, %esi
1402725d4:     	jne	0x14027259b <.text+0x27159b>
1402725d6:     	nopw	%cs:(%rax,%rax)
1402725e0:     	pcmpeqb	%xmm1, %xmm3
1402725e4:     	pmovmskb	%xmm3, %r10d
1402725e9:     	testl	%r10d, %r10d
1402725ec:     	movl	0x1028(%rbp), %esi
1402725f2:     	jne	0x1402726a3 <.text+0x2716a3>
1402725f8:     	addq	%r9, %r8
1402725fb:     	addq	$0x10, %r8
1402725ff:     	addq	$0x10, %r9
140272603:     	jmp	0x140272582 <.text+0x271582>
140272608:     	leaq	(%rcx,%r11,8), %rax
14027260c:     	movq	-0x8(%rax), %rbx
140272610:     	movl	0x1028(%rbp), %esi
140272616:     	movq	0xfa0(%rbp), %rdx
14027261d:     	testq	%rdx, %rdx
140272620:     	jne	0x140272720 <.text+0x271720>
140272626:     	jmp	0x140272736 <.text+0x271736>
14027262b:     	leaq	-0x10(%r11), %r8
14027262f:     	andq	%rdx, %r8
140272632:     	movdqu	(%rcx,%r8), %xmm0
140272638:     	pcmpeqd	%xmm1, %xmm1
14027263c:     	pcmpeqb	%xmm1, %xmm0
140272640:     	pmovmskb	%xmm0, %edx
140272644:     	movdqu	(%rcx,%r11), %xmm0
14027264a:     	pcmpeqb	%xmm1, %xmm0
14027264e:     	pmovmskb	%xmm0, %r9d
140272653:     	movw	$0x1f, %si
140272657:     	bsrw	%dx, %si
14027265b:     	xorl	$0xf, %esi
14027265e:     	orl	$0x10000, %r9d          # imm = 0x10000
140272665:     	tzcntl	%r9d, %r9d
14027266a:     	addl	%esi, %r9d
14027266d:     	movb	$-0x80, %dl
14027266f:     	cmpw	$0xf, %r9w
140272674:     	ja	0x14027267f <.text+0x27167f>
140272676:     	incq	0xf0(%r14)
14027267d:     	movb	$-0x1, %dl
14027267f:     	movb	%dl, (%rcx,%r11)
140272683:     	movb	%dl, 0x10(%rcx,%r8)
140272688:     	decq	0xf8(%r14)
14027268f:     	movq	-0x70(%r10), %rcx
140272693:     	cmpq	$0x2, %rcx
140272697:     	movl	0x1028(%rbp), %esi
14027269d:     	jne	0x14027365b <.text+0x27265b>
1402726a3:     	movq	(%rax), %rbx
1402726a6:     	leaq	0x1(%rbx), %rcx
1402726aa:     	movq	%rcx, (%rax)
1402726ad:     	movw	$0x100, -0x10(%rbp)     # imm = 0x100
1402726b3:     	movq	$0x1, -0x60(%rbp)
1402726bb:     	movdqu	0x5b4d34d(%rip), %xmm0  # 0x145dbfa10
1402726c3:     	movdqu	%xmm0, -0x58(%rbp)
1402726c8:     	movq	$0x4, -0x38(%rbp)
1402726d0:     	movq	$0x2c, -0x30(%rbp)
1402726d8:     	movq	$0x0, -0x18(%rbp)
1402726e0:     	movb	$0x1, -0xe(%rbp)
1402726e4:     	movq	$0x0, -0x48(%rbp)
1402726ec:     	movb	$0x2, -0x28(%rbp)
1402726f0:     	leaq	-0x60(%rbp), %r8
1402726f4:     	movq	%rdi, %rcx
1402726f7:     	movq	%rbx, %rdx
1402726fa:     	callq	0x140011c70 <.text+0x10c70>
1402726ff:     	nop
140272700:     	leaq	0x78(%r14), %rcx
140272704:     	leaq	0x5b4d305(%rip), %rdx   # 0x145dbfa10
14027270b:     	movq	%rbx, %r8
14027270e:     	callq	0x140011ac0 <.text+0x10ac0>
140272713:     	nop
140272714:     	movq	0xfa0(%rbp), %rdx
14027271b:     	testq	%rdx, %rdx
14027271e:     	je	0x140272736 <.text+0x271736>
140272720:     	movq	0xfa8(%rbp), %rcx
140272727:     	shlq	$0x3, %rdx
14027272b:     	movl	$0x8, %r8d
140272731:     	callq	0x1400021d0 <.text+0x11d0>
140272736:     	movl	0x1018(%rbp), %eax
14027273c:     	movl	%eax, -0x60(%rbp)
14027273f:     	movl	0x101c(%rbp), %eax
140272745:     	movl	%eax, -0x5c(%rbp)
140272748:     	movl	%esi, -0x58(%rbp)
14027274b:     	movl	%r15d, -0x54(%rbp)
14027274f:     	movl	%r13d, -0x50(%rbp)
140272753:     	movl	%r12d, -0x4c(%rbp)
140272757:     	movb	$0x2, -0x40(%rbp)
14027275b:     	movl	0x5b0(%r14), %esi
140272762:     	movq	%r14, %rcx
140272765:     	callq	0x144e7b3e0 <.text+0x4e7a3e0>
14027276a:     	movq	%rbx, 0xfa0(%rbp)
140272771:     	leaq	0x1d8(%r14), %rcx
140272778:     	leaq	0xfa0(%rbp), %r9
14027277f:     	movq	%rbx, %rdx
140272782:     	movq	%rdi, %r8
140272785:     	callq	0x14000a130 <.text+0x9130>
14027278a:     	movq	%rax, %rdi
14027278d:     	cmpb	$0x1, 0x30(%rax)
140272791:     	jne	0x1402727a3 <.text+0x2717a3>
140272793:     	leaq	-0x60(%rbp), %r8
140272797:     	movq	%rdi, %rcx
14027279a:     	xorl	%edx, %edx
14027279c:     	callq	0x144e5dc40 <.text+0x4e5cc40>
1402727a1:     	jmp	0x1402727bb <.text+0x2717bb>
1402727a3:     	movq	0x8(%rdi), %r8
1402727a7:     	movq	0x10(%rdi), %rcx
1402727ab:     	leaq	-0x60(%rbp), %rdx
1402727af:     	callq	0x145bc978d <.text+0x5bc878d>
1402727b4:     	movl	%esi, 0x28(%rdi)
1402727b7:     	movb	$0x1, 0x30(%rdi)
1402727bb:     	movl	%esi, 0x2c(%rdi)
1402727be:     	callq	0x140002200 <.text+0x1200>
1402727c3:     	movl	$0x28, %ecx
1402727c8:     	movl	$0x8, %edx
1402727cd:     	callq	0x1400021c0 <.text+0x11c0>
1402727d2:     	testq	%rax, %rax
1402727d5:     	je	0x1402736ce <.text+0x2726ce>
1402727db:     	movq	$0x0, (%rax)
1402727e2:     	movl	$0x0, 0x20(%rax)
1402727e9:     	movb	$0x0, 0x24(%rax)
1402727ed:     	leaq	0x5b4e0e4(%rip), %r8    # 0x145dc08d8
1402727f4:     	leaq	-0x60(%rbp), %rcx
1402727f8:     	movq	%rax, %rdx
1402727fb:     	callq	0x144e09040 <.text+0x4e08040>
140272800:     	nop
140272801:     	movq	0x7d8ae98(%rip), %rcx   # 0x147ffd6a0
140272808:     	leaq	0x5b28229(%rip), %r8    # 0x145d9aa38
14027280f:     	leaq	0x102f(%rbp), %rdx
140272816:     	callq	0x140119ae0 <.text+0x118ae0>
14027281b:     	nop
14027281c:     	movq	%rdx, %r8
14027281f:     	leaq	-0x60(%rbp), %rcx
140272823:     	movq	%rax, %rdx
140272826:     	callq	0x140011470 <.text+0x10470>
14027282b:     	nop
14027282c:     	movups	(%rbp), %xmm0
140272830:     	movaps	%xmm0, 0x1000(%rbp)
140272837:     	movups	-0x10(%rbp), %xmm0
14027283b:     	movaps	%xmm0, 0xff0(%rbp)
140272842:     	movups	-0x20(%rbp), %xmm0
140272846:     	movaps	%xmm0, 0xfe0(%rbp)
14027284d:     	movups	-0x60(%rbp), %xmm0
140272851:     	movups	-0x50(%rbp), %xmm1
140272855:     	movups	-0x40(%rbp), %xmm2
140272859:     	movups	-0x30(%rbp), %xmm3
14027285d:     	movaps	%xmm3, 0xfd0(%rbp)
140272864:     	movaps	%xmm2, 0xfc0(%rbp)
14027286b:     	movaps	%xmm1, 0xfb0(%rbp)
140272872:     	movaps	%xmm0, 0xfa0(%rbp)
140272879:     	movb	$0x0, 0xef8(%rbp)
140272880:     	movq	0x7d8ae19(%rip), %rcx   # 0x147ffd6a0
140272887:     	leaq	0x5afe122(%rip), %r8    # 0x145d709b0
14027288e:     	leaq	0xef8(%rbp), %rdx
140272895:     	callq	0x140119ae0 <.text+0x118ae0>
14027289a:     	nop
14027289b:     	movq	%rdx, %r8
14027289e:     	leaq	0xfa0(%rbp), %rcx
1402728a5:     	movq	%rax, %rdx
1402728a8:     	callq	0x140011470 <.text+0x10470>
1402728ad:     	nop
1402728ae:     	movaps	0x1000(%rbp), %xmm0
1402728b5:     	movaps	%xmm0, (%rbp)
1402728b9:     	movaps	0xff0(%rbp), %xmm0
1402728c0:     	movaps	%xmm0, -0x10(%rbp)
1402728c4:     	movaps	0xfe0(%rbp), %xmm0
1402728cb:     	movaps	%xmm0, -0x20(%rbp)
1402728cf:     	movaps	0xfa0(%rbp), %xmm0
1402728d6:     	movaps	0xfb0(%rbp), %xmm1
1402728dd:     	movaps	0xfc0(%rbp), %xmm2
1402728e4:     	movaps	0xfd0(%rbp), %xmm3
1402728eb:     	movaps	%xmm3, -0x30(%rbp)
1402728ef:     	movaps	%xmm2, -0x40(%rbp)
1402728f3:     	movaps	%xmm1, -0x50(%rbp)
1402728f7:     	movaps	%xmm0, -0x60(%rbp)
1402728fb:     	leaq	-0x60(%rbp), %rdx
1402728ff:     	movq	%r14, %rcx
140272902:     	callq	0x1401597c0 <.text+0x1587c0>
140272907:     	callq	0x140002200 <.text+0x1200>
14027290c:     	movl	$0x4d0, %ecx            # imm = 0x4D0
140272911:     	movl	$0x8, %edx
140272916:     	callq	0x1400021c0 <.text+0x11c0>
14027291b:     	testq	%rax, %rax
14027291e:     	je	0x1402736df <.text+0x2726df>
140272924:     	movq	%rax, 0x1020(%rbp)
14027292b:     	movq	$-0x1, -0x60(%rbp)
140272933:     	movl	$0x0, 0xb68(%rbp)
14027293d:     	movb	$0x0, 0xb6c(%rbp)
140272944:     	callq	0x140002200 <.text+0x1200>
140272949:     	movl	$0xbd0, %ecx            # imm = 0xBD0
14027294e:     	movl	$0x8, %edx
140272953:     	callq	0x1400021c0 <.text+0x11c0>
140272958:     	testq	%rax, %rax
14027295b:     	je	0x1402736f0 <.text+0x2726f0>
140272961:     	movq	%rax, %rdi
140272964:     	leaq	-0x60(%rbp), %rdx
140272968:     	movl	$0xbd0, %r8d            # imm = 0xBD0
14027296e:     	movq	%rax, %rcx
140272971:     	callq	0x145bc977b <.text+0x5bc877b>
140272976:     	nop
140272977:     	leaq	0x5b4e7e2(%rip), %r8    # 0x145dc1160
14027297e:     	leaq	0xe88(%rbp), %rcx
140272985:     	movq	%rdi, %rdx
140272988:     	callq	0x144e09040 <.text+0x4e08040>
14027298d:     	nop
14027298e:     	movq	$-0x1, -0x60(%rbp)
140272996:     	movl	$0x0, 0x240(%rbp)
1402729a0:     	movb	$0x0, 0x244(%rbp)
1402729a7:     	callq	0x140002200 <.text+0x1200>
1402729ac:     	movl	$0x2a8, %ecx            # imm = 0x2A8
1402729b1:     	movl	$0x8, %edx
1402729b6:     	callq	0x1400021c0 <.text+0x11c0>
1402729bb:     	testq	%rax, %rax
1402729be:     	je	0x140273705 <.text+0x272705>
1402729c4:     	movq	%rax, %rdi
1402729c7:     	leaq	-0x60(%rbp), %rdx
1402729cb:     	movl	$0x2a8, %r8d            # imm = 0x2A8
1402729d1:     	movq	%rax, %rcx
1402729d4:     	callq	0x145bc977b <.text+0x5bc877b>
1402729d9:     	nop
1402729da:     	leaq	0x5b4e827(%rip), %r8    # 0x145dc1208
1402729e1:     	leaq	0xe18(%rbp), %rcx
1402729e8:     	movq	%rdi, %rdx
1402729eb:     	callq	0x144e09040 <.text+0x4e08040>
1402729f0:     	nop
1402729f1:     	movq	$-0x1, -0x60(%rbp)
1402729f9:     	movl	$0x0, 0x258(%rbp)
140272a03:     	movb	$0x0, 0x25c(%rbp)
140272a0a:     	callq	0x140002200 <.text+0x1200>
140272a0f:     	movl	$0x2c0, %ecx            # imm = 0x2C0
140272a14:     	movl	$0x8, %edx
140272a19:     	callq	0x1400021c0 <.text+0x11c0>
140272a1e:     	testq	%rax, %rax
140272a21:     	je	0x14027371a <.text+0x27271a>
140272a27:     	movq	%rax, %rdi
140272a2a:     	leaq	-0x60(%rbp), %rdx
140272a2e:     	movl	$0x2c0, %r8d            # imm = 0x2C0
140272a34:     	movq	%rax, %rcx
140272a37:     	callq	0x145bc977b <.text+0x5bc877b>
140272a3c:     	nop
140272a3d:     	leaq	0x5b4e284(%rip), %r8    # 0x145dc0cc8
140272a44:     	leaq	0xda8(%rbp), %rcx
140272a4b:     	movq	%rdi, %rdx
140272a4e:     	callq	0x144e09040 <.text+0x4e08040>
140272a53:     	nop
140272a54:     	movq	$-0x1, -0x60(%rbp)
140272a5c:     	movl	$0x0, 0x120(%rbp)
140272a66:     	movb	$0x0, 0x124(%rbp)
140272a6d:     	callq	0x140002200 <.text+0x1200>
140272a72:     	movl	$0x188, %ecx            # imm = 0x188
140272a77:     	movl	$0x8, %edx
140272a7c:     	callq	0x1400021c0 <.text+0x11c0>
140272a81:     	testq	%rax, %rax
140272a84:     	je	0x14027372f <.text+0x27272f>
140272a8a:     	movq	%rax, %rdi
140272a8d:     	leaq	-0x60(%rbp), %rdx
140272a91:     	movl	$0x188, %r8d            # imm = 0x188
140272a97:     	movq	%rax, %rcx
140272a9a:     	callq	0x145bc977b <.text+0x5bc877b>
140272a9f:     	nop
140272aa0:     	leaq	0x5b4e371(%rip), %r8    # 0x145dc0e18
140272aa7:     	leaq	0xd38(%rbp), %rcx
140272aae:     	movq	%rdi, %rdx
140272ab1:     	callq	0x144e09040 <.text+0x4e08040>
140272ab6:     	nop
140272ab7:     	callq	0x140002200 <.text+0x1200>
140272abc:     	movl	$0x168, %ecx            # imm = 0x168
140272ac1:     	movl	$0x8, %edx
140272ac6:     	callq	0x1400021c0 <.text+0x11c0>
140272acb:     	testq	%rax, %rax
140272ace:     	je	0x140273744 <.text+0x272744>
140272ad4:     	movl	$0x0, (%rax)
140272ada:     	movb	$0x0, 0x4(%rax)
140272ade:     	movq	$-0x1, 0x100(%rax)
140272ae9:     	leaq	0x5b4e280(%rip), %r8    # 0x145dc0d70
140272af0:     	leaq	0xcc8(%rbp), %rcx
140272af7:     	movq	%rax, %rdx
140272afa:     	callq	0x144e09040 <.text+0x4e08040>
140272aff:     	nop
140272b00:     	movq	$-0x1, -0x60(%rbp)
140272b08:     	movl	$0x0, 0x128(%rbp)
140272b12:     	movb	$0x0, 0x12c(%rbp)
140272b19:     	callq	0x140002200 <.text+0x1200>
140272b1e:     	movl	$0x190, %ecx            # imm = 0x190
140272b23:     	movl	$0x8, %edx
140272b28:     	callq	0x1400021c0 <.text+0x11c0>
140272b2d:     	testq	%rax, %rax
140272b30:     	je	0x140273759 <.text+0x272759>
140272b36:     	movq	%rax, %rdi
140272b39:     	leaq	-0x60(%rbp), %rdx
140272b3d:     	movl	$0x190, %r8d            # imm = 0x190
140272b43:     	movq	%rax, %rcx
140272b46:     	callq	0x145bc977b <.text+0x5bc877b>
140272b4b:     	nop
140272b4c:     	leaq	0x5b4df7d(%rip), %r8    # 0x145dc0ad0
140272b53:     	leaq	0xc58(%rbp), %rcx
140272b5a:     	movq	%rdi, %rdx
140272b5d:     	callq	0x144e09040 <.text+0x4e08040>
140272b62:     	nop
140272b63:     	callq	0x140002200 <.text+0x1200>
140272b68:     	movl	$0x158, %ecx            # imm = 0x158
140272b6d:     	movl	$0x8, %edx
140272b72:     	callq	0x1400021c0 <.text+0x11c0>
140272b77:     	testq	%rax, %rax
140272b7a:     	je	0x14027376e <.text+0x27276e>
140272b80:     	movl	$0x0, (%rax)
140272b86:     	movb	$0x0, 0x4(%rax)
140272b8a:     	movq	$-0x1, 0x100(%rax)
140272b95:     	leaq	0x5b4de8c(%rip), %r8    # 0x145dc0a28
140272b9c:     	leaq	0xbe8(%rbp), %rcx
140272ba3:     	movq	%rax, %rdx
140272ba6:     	callq	0x144e09040 <.text+0x4e08040>
140272bab:     	nop
140272bac:     	movq	$-0x1, 0x90(%rbp)
140272bb7:     	movl	$0x0, 0x1f0(%rbp)
140272bc1:     	movb	$0x0, 0x1f4(%rbp)
140272bc8:     	callq	0x140002200 <.text+0x1200>
140272bcd:     	movl	$0x258, %ecx            # imm = 0x258
140272bd2:     	movl	$0x8, %edx
140272bd7:     	callq	0x1400021c0 <.text+0x11c0>
140272bdc:     	testq	%rax, %rax
140272bdf:     	je	0x140273783 <.text+0x272783>
140272be5:     	movq	%rax, %rdi
140272be8:     	leaq	-0x60(%rbp), %rdx
140272bec:     	movl	$0x258, %r8d            # imm = 0x258
140272bf2:     	movq	%rax, %rcx
140272bf5:     	callq	0x145bc977b <.text+0x5bc877b>
140272bfa:     	nop
140272bfb:     	leaq	0x5b4e40e(%rip), %r8    # 0x145dc1010
140272c02:     	leaq	0xb78(%rbp), %rcx
140272c09:     	movq	%rdi, %rdx
140272c0c:     	callq	0x144e09040 <.text+0x4e08040>
140272c11:     	nop
140272c12:     	movq	$-0x1, -0x20(%rbp)
140272c1a:     	movl	$0x0, 0x340(%rbp)
140272c24:     	movb	$0x0, 0x344(%rbp)
140272c2b:     	callq	0x140002200 <.text+0x1200>
140272c30:     	movl	$0x3a8, %ecx            # imm = 0x3A8
140272c35:     	movl	$0x8, %edx
140272c3a:     	callq	0x1400021c0 <.text+0x11c0>
140272c3f:     	testq	%rax, %rax
140272c42:     	je	0x140273798 <.text+0x272798>
140272c48:     	movq	%rax, %rdi
140272c4b:     	leaq	-0x60(%rbp), %rdx
140272c4f:     	movl	$0x3a8, %r8d            # imm = 0x3A8
140272c55:     	movq	%rax, %rcx
140272c58:     	callq	0x145bc977b <.text+0x5bc877b>
140272c5d:     	nop
140272c5e:     	leaq	0x5b4e303(%rip), %r8    # 0x145dc0f68
140272c65:     	leaq	0xef8(%rbp), %rcx
140272c6c:     	movq	%rdi, %rdx
140272c6f:     	callq	0x144e09040 <.text+0x4e08040>
140272c74:     	nop
140272c75:     	callq	0x140002200 <.text+0x1200>
140272c7a:     	movl	$0x140, %ecx            # imm = 0x140
140272c7f:     	movl	$0x8, %edx
140272c84:     	callq	0x1400021c0 <.text+0x11c0>
140272c89:     	testq	%rax, %rax
140272c8c:     	je	0x1402737aa <.text+0x2727aa>
140272c92:     	movl	$0x0, (%rax)
140272c98:     	movb	$0x0, 0x4(%rax)
140272c9c:     	movq	$-0x1, 0x100(%rax)
140272ca7:     	leaq	0x5b4e212(%rip), %r8    # 0x145dc0ec0
140272cae:     	leaq	0xfa0(%rbp), %rcx
140272cb5:     	movq	%rax, %rdx
140272cb8:     	callq	0x144e09040 <.text+0x4e08040>
140272cbd:     	nop
140272cbe:     	movq	$-0x1, -0x20(%rbp)
140272cc6:     	movl	$0x0, 0x268(%rbp)
140272cd0:     	movb	$0x0, 0x26c(%rbp)
140272cd7:     	callq	0x140002200 <.text+0x1200>
140272cdc:     	movl	$0x2d0, %ecx            # imm = 0x2D0
140272ce1:     	movl	$0x8, %edx
140272ce6:     	callq	0x1400021c0 <.text+0x11c0>
140272ceb:     	testq	%rax, %rax
140272cee:     	je	0x1402737bc <.text+0x2727bc>
140272cf4:     	movq	%rax, %rdi
140272cf7:     	leaq	-0x60(%rbp), %rdx
140272cfb:     	movl	$0x2d0, %r8d            # imm = 0x2D0
140272d01:     	movq	%rax, %rcx
140272d04:     	callq	0x145bc977b <.text+0x5bc877b>
140272d09:     	nop
140272d0a:     	leaq	0x5b4e3a7(%rip), %r8    # 0x145dc10b8
140272d11:     	leaq	-0x60(%rbp), %rcx
140272d15:     	movq	%rdi, %rdx
140272d18:     	callq	0x144e09040 <.text+0x4e08040>
140272d1d:     	nop
140272d1e:     	movups	0xee8(%rbp), %xmm0
140272d25:     	movq	0x1020(%rbp), %rax
140272d2c:     	movups	%xmm0, 0x60(%rax)
140272d30:     	movups	0xed8(%rbp), %xmm0
140272d37:     	movups	%xmm0, 0x50(%rax)
140272d3b:     	movups	0xec8(%rbp), %xmm0
140272d42:     	movups	%xmm0, 0x40(%rax)
140272d46:     	movups	0xe88(%rbp), %xmm0
140272d4d:     	movups	0xe98(%rbp), %xmm1
140272d54:     	movups	0xea8(%rbp), %xmm2
140272d5b:     	movups	0xeb8(%rbp), %xmm3
140272d62:     	movups	%xmm3, 0x30(%rax)
140272d66:     	movups	%xmm2, 0x20(%rax)
140272d6a:     	movups	%xmm1, 0x10(%rax)
140272d6e:     	movups	%xmm0, (%rax)
140272d71:     	movups	0xe18(%rbp), %xmm0
140272d78:     	movups	0xe28(%rbp), %xmm1
140272d7f:     	movups	0xe38(%rbp), %xmm2
140272d86:     	movups	0xe48(%rbp), %xmm3
140272d8d:     	movups	%xmm0, 0x70(%rax)
140272d91:     	movups	%xmm1, 0x80(%rax)
140272d98:     	movups	%xmm2, 0x90(%rax)
140272d9f:     	movups	%xmm3, 0xa0(%rax)
140272da6:     	movups	0xe58(%rbp), %xmm0
140272dad:     	movups	%xmm0, 0xb0(%rax)
140272db4:     	movups	0xe68(%rbp), %xmm0
140272dbb:     	movups	%xmm0, 0xc0(%rax)
140272dc2:     	movups	0xe78(%rbp), %xmm0
140272dc9:     	movups	%xmm0, 0xd0(%rax)
140272dd0:     	movups	0xe08(%rbp), %xmm0
140272dd7:     	movups	%xmm0, 0x140(%rax)
140272dde:     	movups	0xdf8(%rbp), %xmm0
140272de5:     	movups	%xmm0, 0x130(%rax)
140272dec:     	movups	0xde8(%rbp), %xmm0
140272df3:     	movups	%xmm0, 0x120(%rax)
140272dfa:     	movups	0xda8(%rbp), %xmm0
140272e01:     	movups	0xdb8(%rbp), %xmm1
140272e08:     	movups	0xdc8(%rbp), %xmm2
140272e0f:     	movups	0xdd8(%rbp), %xmm3
140272e16:     	movups	%xmm3, 0x110(%rax)
140272e1d:     	movups	%xmm2, 0x100(%rax)
140272e24:     	movups	%xmm1, 0xf0(%rax)
140272e2b:     	movups	%xmm0, 0xe0(%rax)
140272e32:     	movups	0xd38(%rbp), %xmm0
140272e39:     	movups	0xd48(%rbp), %xmm1
140272e40:     	movups	0xd58(%rbp), %xmm2
140272e47:     	movups	0xd68(%rbp), %xmm3
140272e4e:     	movups	%xmm0, 0x150(%rax)
140272e55:     	movups	%xmm1, 0x160(%rax)
140272e5c:     	movups	%xmm2, 0x170(%rax)
140272e63:     	movups	%xmm3, 0x180(%rax)
140272e6a:     	movups	0xd78(%rbp), %xmm0
140272e71:     	movups	%xmm0, 0x190(%rax)
140272e78:     	movups	0xd88(%rbp), %xmm0
140272e7f:     	movups	%xmm0, 0x1a0(%rax)
140272e86:     	movups	0xd98(%rbp), %xmm0
140272e8d:     	movups	%xmm0, 0x1b0(%rax)
140272e94:     	movups	0xcc8(%rbp), %xmm0
140272e9b:     	movups	0xcd8(%rbp), %xmm1
140272ea2:     	movups	0xce8(%rbp), %xmm2
140272ea9:     	movups	0xcf8(%rbp), %xmm3
140272eb0:     	movups	%xmm0, 0x1c0(%rax)
140272eb7:     	movups	%xmm1, 0x1d0(%rax)
140272ebe:     	movups	%xmm2, 0x1e0(%rax)
140272ec5:     	movups	%xmm3, 0x1f0(%rax)
140272ecc:     	movups	0xd08(%rbp), %xmm0
140272ed3:     	movups	%xmm0, 0x200(%rax)
140272eda:     	movups	0xd28(%rbp), %xmm0
140272ee1:     	movups	%xmm0, 0x220(%rax)
140272ee8:     	movups	0xd18(%rbp), %xmm0
140272eef:     	movups	%xmm0, 0x210(%rax)
140272ef6:     	movups	0xcb8(%rbp), %xmm0
140272efd:     	movups	%xmm0, 0x290(%rax)
140272f04:     	movups	0xca8(%rbp), %xmm0
140272f0b:     	movups	%xmm0, 0x280(%rax)
140272f12:     	movups	0xc98(%rbp), %xmm0
140272f19:     	movups	%xmm0, 0x270(%rax)
140272f20:     	movups	0xc58(%rbp), %xmm0
140272f27:     	movups	0xc68(%rbp), %xmm1
140272f2e:     	movups	0xc78(%rbp), %xmm2
140272f35:     	movups	0xc88(%rbp), %xmm3
140272f3c:     	movups	%xmm3, 0x260(%rax)
140272f43:     	movups	%xmm2, 0x250(%rax)
140272f4a:     	movups	%xmm1, 0x240(%rax)
140272f51:     	movups	%xmm0, 0x230(%rax)
140272f58:     	movups	0xbe8(%rbp), %xmm0
140272f5f:     	movups	0xbf8(%rbp), %xmm1
140272f66:     	movups	0xc08(%rbp), %xmm2
140272f6d:     	movups	0xc18(%rbp), %xmm3
140272f74:     	movups	%xmm0, 0x2a0(%rax)
140272f7b:     	movups	%xmm1, 0x2b0(%rax)
140272f82:     	movups	%xmm2, 0x2c0(%rax)
140272f89:     	movups	%xmm3, 0x2d0(%rax)
140272f90:     	movups	0xc28(%rbp), %xmm0
140272f97:     	movups	%xmm0, 0x2e0(%rax)
140272f9e:     	movups	0xc38(%rbp), %xmm0
140272fa5:     	movups	%xmm0, 0x2f0(%rax)
140272fac:     	movups	0xc48(%rbp), %xmm0
140272fb3:     	movups	%xmm0, 0x300(%rax)
140272fba:     	movups	0xb78(%rbp), %xmm0
140272fc1:     	movups	0xb88(%rbp), %xmm1
140272fc8:     	movups	0xb98(%rbp), %xmm2
140272fcf:     	movups	0xba8(%rbp), %xmm3
140272fd6:     	movups	%xmm0, 0x310(%rax)
140272fdd:     	movups	%xmm1, 0x320(%rax)
140272fe4:     	movups	%xmm2, 0x330(%rax)
140272feb:     	movups	%xmm3, 0x340(%rax)
140272ff2:     	movups	0xbb8(%rbp), %xmm0
140272ff9:     	movups	%xmm0, 0x350(%rax)
140273000:     	movups	0xbc8(%rbp), %xmm0
140273007:     	movups	%xmm0, 0x360(%rax)
14027300e:     	movups	0xbd8(%rbp), %xmm0
140273015:     	movups	%xmm0, 0x370(%rax)
14027301c:     	movups	0xef8(%rbp), %xmm0
140273023:     	movups	0xf08(%rbp), %xmm1
14027302a:     	movups	0xf18(%rbp), %xmm2
140273031:     	movups	0xf28(%rbp), %xmm3
140273038:     	movups	%xmm0, 0x380(%rax)
14027303f:     	movups	%xmm1, 0x390(%rax)
140273046:     	movups	%xmm2, 0x3a0(%rax)
14027304d:     	movups	%xmm3, 0x3b0(%rax)
140273054:     	movups	0xf38(%rbp), %xmm0
14027305b:     	movups	%xmm0, 0x3c0(%rax)
140273062:     	movups	0xf48(%rbp), %xmm0
140273069:     	movups	%xmm0, 0x3d0(%rax)
140273070:     	movups	0xf58(%rbp), %xmm0
140273077:     	movups	%xmm0, 0x3e0(%rax)
14027307e:     	movups	0xfa0(%rbp), %xmm0
140273085:     	movups	0xfb0(%rbp), %xmm1
14027308c:     	movups	0xfc0(%rbp), %xmm2
140273093:     	movups	0xfd0(%rbp), %xmm3
14027309a:     	movups	%xmm0, 0x3f0(%rax)
1402730a1:     	movups	%xmm1, 0x400(%rax)
1402730a8:     	movups	%xmm2, 0x410(%rax)
1402730af:     	movups	%xmm3, 0x420(%rax)
1402730b6:     	movups	0xfe0(%rbp), %xmm0
1402730bd:     	movups	%xmm0, 0x430(%rax)
1402730c4:     	movups	0xff0(%rbp), %xmm0
1402730cb:     	movups	%xmm0, 0x440(%rax)
1402730d2:     	movups	0x1000(%rbp), %xmm0
1402730d9:     	movups	%xmm0, 0x450(%rax)
1402730e0:     	movups	-0x60(%rbp), %xmm0
1402730e4:     	movups	-0x50(%rbp), %xmm1
1402730e8:     	movups	-0x40(%rbp), %xmm2
1402730ec:     	movups	-0x30(%rbp), %xmm3
1402730f0:     	movups	%xmm0, 0x460(%rax)
1402730f7:     	movups	%xmm1, 0x470(%rax)
1402730fe:     	movups	%xmm2, 0x480(%rax)
140273105:     	movups	%xmm3, 0x490(%rax)
14027310c:     	movups	-0x20(%rbp), %xmm0
140273110:     	movups	%xmm0, 0x4a0(%rax)
140273117:     	movups	-0x10(%rbp), %xmm0
14027311b:     	movups	%xmm0, 0x4b0(%rax)
140273122:     	movups	(%rbp), %xmm0
140273126:     	movups	%xmm0, 0x4c0(%rax)
14027312d:     	movq	$0xb, -0x58(%rbp)
140273135:     	movq	%rax, -0x50(%rbp)
140273139:     	movq	$0xb, -0x48(%rbp)
140273141:     	movq	$0x0, -0x40(%rbp)
140273149:     	movq	$0x8, -0x38(%rbp)
140273151:     	xorps	%xmm0, %xmm0
140273154:     	movups	%xmm0, -0x30(%rbp)
140273158:     	movq	$-0x1, -0x60(%rbp)
140273160:     	leaq	-0x28(%rbp), %rcx
140273164:     	callq	0x144e4f960 <.text+0x4e4e960>
140273169:     	nop
14027316a:     	movups	(%rbp), %xmm0
14027316e:     	movaps	%xmm0, 0x1000(%rbp)
140273175:     	movups	-0x10(%rbp), %xmm0
140273179:     	movaps	%xmm0, 0xff0(%rbp)
140273180:     	movups	-0x20(%rbp), %xmm0
140273184:     	movaps	%xmm0, 0xfe0(%rbp)
14027318b:     	movups	-0x60(%rbp), %xmm0
14027318f:     	movups	-0x50(%rbp), %xmm1
140273193:     	movups	-0x40(%rbp), %xmm2
140273197:     	movups	-0x30(%rbp), %xmm3
14027319b:     	movaps	%xmm3, 0xfd0(%rbp)
1402731a2:     	movaps	%xmm2, 0xfc0(%rbp)
1402731a9:     	movaps	%xmm1, 0xfb0(%rbp)
1402731b0:     	movaps	%xmm0, 0xfa0(%rbp)
1402731b7:     	movq	0x7d8a4e2(%rip), %rcx   # 0x147ffd6a0
1402731be:     	leaq	0x5b3dcb3(%rip), %r8    # 0x145db0e78
1402731c5:     	leaq	0x102f(%rbp), %rdx
1402731cc:     	callq	0x140119ae0 <.text+0x118ae0>
1402731d1:     	nop
1402731d2:     	movq	%rdx, %r8
1402731d5:     	leaq	0xfa0(%rbp), %rcx
1402731dc:     	movq	%rax, %rdx
1402731df:     	callq	0x140011470 <.text+0x10470>
1402731e4:     	nop
1402731e5:     	movaps	0x1000(%rbp), %xmm0
1402731ec:     	movaps	%xmm0, (%rbp)
1402731f0:     	movaps	0xff0(%rbp), %xmm0
1402731f7:     	movaps	%xmm0, -0x10(%rbp)
1402731fb:     	movaps	0xfe0(%rbp), %xmm0
140273202:     	movaps	%xmm0, -0x20(%rbp)
140273206:     	movaps	0xfa0(%rbp), %xmm0
14027320d:     	movaps	0xfb0(%rbp), %xmm1
140273214:     	movaps	0xfc0(%rbp), %xmm2
14027321b:     	movaps	0xfd0(%rbp), %xmm3
140273222:     	movaps	%xmm3, -0x30(%rbp)
140273226:     	movaps	%xmm2, -0x40(%rbp)
14027322a:     	movaps	%xmm1, -0x50(%rbp)
14027322e:     	movaps	%xmm0, -0x60(%rbp)
140273232:     	leaq	-0x60(%rbp), %rdx
140273236:     	movq	%r14, %rcx
140273239:     	callq	0x140159570 <.text+0x158570>
14027323e:     	callq	0x140002200 <.text+0x1200>
140273243:     	movl	$0x150, %ecx            # imm = 0x150
140273248:     	movl	$0x8, %edx
14027324d:     	callq	0x1400021c0 <.text+0x11c0>
140273252:     	testq	%rax, %rax
140273255:     	je	0x1402737ce <.text+0x2727ce>
14027325b:     	movq	%rax, 0x1020(%rbp)
140273262:     	movq	$-0x1, -0x20(%rbp)
14027326a:     	movl	$0x0, 0x218(%rbp)
140273274:     	movb	$0x0, 0x21c(%rbp)
14027327b:     	callq	0x140002200 <.text+0x1200>
140273280:     	movl	$0x280, %ecx            # imm = 0x280
140273285:     	movl	$0x8, %edx
14027328a:     	callq	0x1400021c0 <.text+0x11c0>
14027328f:     	testq	%rax, %rax
140273292:     	je	0x1402737df <.text+0x2727df>
140273298:     	movq	%rax, %rdi
14027329b:     	leaq	-0x60(%rbp), %rdx
14027329f:     	movl	$0x280, %r8d            # imm = 0x280
1402732a5:     	movq	%rax, %rcx
1402732a8:     	callq	0x145bc977b <.text+0x5bc877b>
1402732ad:     	nop
1402732ae:     	leaq	0x5b4d96b(%rip), %r8    # 0x145dc0c20
1402732b5:     	leaq	0xef8(%rbp), %rcx
1402732bc:     	movq	%rdi, %rdx
1402732bf:     	callq	0x144e09040 <.text+0x4e08040>
1402732c4:     	nop
1402732c5:     	callq	0x140002200 <.text+0x1200>
1402732ca:     	movl	$0x148, %ecx            # imm = 0x148
1402732cf:     	movl	$0x8, %edx
1402732d4:     	callq	0x1400021c0 <.text+0x11c0>
1402732d9:     	testq	%rax, %rax
1402732dc:     	je	0x1402737f1 <.text+0x2727f1>
1402732e2:     	movl	$0x0, (%rax)
1402732e8:     	movb	$0x0, 0x4(%rax)
1402732ec:     	movq	$-0x1, 0x118(%rax)
1402732f7:     	leaq	0x5b4d682(%rip), %r8    # 0x145dc0980
1402732fe:     	leaq	0xfa0(%rbp), %rcx
140273305:     	movq	%rax, %rdx
140273308:     	callq	0x144e09040 <.text+0x4e08040>
14027330d:     	nop
14027330e:     	callq	0x140002200 <.text+0x1200>
140273313:     	movl	$0xc, %ecx
140273318:     	movl	$0x4, %edx
14027331d:     	callq	0x1400021c0 <.text+0x11c0>
140273322:     	testq	%rax, %rax
140273325:     	je	0x140273803 <.text+0x272803>
14027332b:     	movl	$0x0, (%rax)
140273331:     	movb	$0x0, 0x4(%rax)
140273335:     	movb	$0x0, 0x8(%rax)
140273339:     	leaq	0x5b4d838(%rip), %r8    # 0x145dc0b78
140273340:     	leaq	-0x60(%rbp), %rcx
140273344:     	movq	%rax, %rdx
140273347:     	callq	0x144e09040 <.text+0x4e08040>
14027334c:     	nop
14027334d:     	movups	0xf58(%rbp), %xmm0
140273354:     	movq	0x1020(%rbp), %rax
14027335b:     	movups	%xmm0, 0x60(%rax)
14027335f:     	movups	0xf48(%rbp), %xmm0
140273366:     	movups	%xmm0, 0x50(%rax)
14027336a:     	movups	0xf38(%rbp), %xmm0
140273371:     	movups	%xmm0, 0x40(%rax)
140273375:     	movups	0xef8(%rbp), %xmm0
14027337c:     	movups	0xf08(%rbp), %xmm1
140273383:     	movups	0xf18(%rbp), %xmm2
14027338a:     	movups	0xf28(%rbp), %xmm3
140273391:     	movups	%xmm3, 0x30(%rax)
140273395:     	movups	%xmm2, 0x20(%rax)
140273399:     	movups	%xmm1, 0x10(%rax)
14027339d:     	movups	%xmm0, (%rax)
1402733a0:     	movups	0xfa0(%rbp), %xmm0
1402733a7:     	movups	0xfb0(%rbp), %xmm1
1402733ae:     	movups	0xfc0(%rbp), %xmm2
1402733b5:     	movups	0xfd0(%rbp), %xmm3
1402733bc:     	movups	%xmm0, 0x70(%rax)
1402733c0:     	movups	%xmm1, 0x80(%rax)
1402733c7:     	movups	%xmm2, 0x90(%rax)
1402733ce:     	movups	%xmm3, 0xa0(%rax)
1402733d5:     	movups	0xfe0(%rbp), %xmm0
1402733dc:     	movups	%xmm0, 0xb0(%rax)
1402733e3:     	movups	0xff0(%rbp), %xmm0
1402733ea:     	movups	%xmm0, 0xc0(%rax)
1402733f1:     	movups	0x1000(%rbp), %xmm0
1402733f8:     	movups	%xmm0, 0xd0(%rax)
1402733ff:     	movups	-0x60(%rbp), %xmm0
140273403:     	movups	-0x50(%rbp), %xmm1
140273407:     	movups	-0x40(%rbp), %xmm2
14027340b:     	movups	-0x30(%rbp), %xmm3
14027340f:     	movups	%xmm0, 0xe0(%rax)
140273416:     	movups	%xmm1, 0xf0(%rax)
14027341d:     	movups	%xmm2, 0x100(%rax)
140273424:     	movups	%xmm3, 0x110(%rax)
14027342b:     	movups	-0x20(%rbp), %xmm0
14027342f:     	movups	%xmm0, 0x120(%rax)
140273436:     	movups	-0x10(%rbp), %xmm0
14027343a:     	movups	%xmm0, 0x130(%rax)
140273441:     	movups	(%rbp), %xmm0
140273445:     	movups	%xmm0, 0x140(%rax)
14027344c:     	movq	$0x3, -0x58(%rbp)
140273454:     	movq	%rax, -0x50(%rbp)
140273458:     	movq	$0x3, -0x48(%rbp)
140273460:     	movq	$0x0, -0x40(%rbp)
140273468:     	movq	$0x8, -0x38(%rbp)
140273470:     	xorps	%xmm0, %xmm0
140273473:     	movups	%xmm0, -0x30(%rbp)
140273477:     	movq	$-0x1, -0x60(%rbp)
14027347f:     	leaq	-0x28(%rbp), %rcx
140273483:     	callq	0x144e4f960 <.text+0x4e4e960>
140273488:     	nop
140273489:     	movups	(%rbp), %xmm0
14027348d:     	movaps	%xmm0, 0x1000(%rbp)
140273494:     	movups	-0x10(%rbp), %xmm0
140273498:     	movaps	%xmm0, 0xff0(%rbp)
14027349f:     	movups	-0x20(%rbp), %xmm0
1402734a3:     	movaps	%xmm0, 0xfe0(%rbp)
1402734aa:     	movups	-0x60(%rbp), %xmm0
1402734ae:     	movups	-0x50(%rbp), %xmm1
1402734b2:     	movups	-0x40(%rbp), %xmm2
1402734b6:     	movups	-0x30(%rbp), %xmm3
1402734ba:     	movaps	%xmm3, 0xfd0(%rbp)
1402734c1:     	movaps	%xmm2, 0xfc0(%rbp)
1402734c8:     	movaps	%xmm1, 0xfb0(%rbp)
1402734cf:     	movaps	%xmm0, 0xfa0(%rbp)
1402734d6:     	movq	0x7d8a1c3(%rip), %rcx   # 0x147ffd6a0
1402734dd:     	leaq	0x5b400f4(%rip), %r8    # 0x145db35d8
1402734e4:     	leaq	0x102f(%rbp), %rdx
1402734eb:     	callq	0x140119ae0 <.text+0x118ae0>
1402734f0:     	nop
1402734f1:     	movq	%rdx, %r8
1402734f4:     	leaq	0xfa0(%rbp), %rcx
1402734fb:     	movq	%rax, %rdx
1402734fe:     	callq	0x140011470 <.text+0x10470>
140273503:     	nop
140273504:     	movaps	0x1000(%rbp), %xmm0
14027350b:     	movaps	%xmm0, (%rbp)
14027350f:     	movaps	0xff0(%rbp), %xmm0
140273516:     	movaps	%xmm0, -0x10(%rbp)
14027351a:     	movaps	0xfe0(%rbp), %xmm0
140273521:     	movaps	%xmm0, -0x20(%rbp)
140273525:     	movaps	0xfa0(%rbp), %xmm0
14027352c:     	movaps	0xfb0(%rbp), %xmm1
140273533:     	movaps	0xfc0(%rbp), %xmm2
14027353a:     	movaps	0xfd0(%rbp), %xmm3
140273541:     	movaps	%xmm3, -0x30(%rbp)
140273545:     	movaps	%xmm2, -0x40(%rbp)
140273549:     	movaps	%xmm1, -0x50(%rbp)
14027354d:     	movaps	%xmm0, -0x60(%rbp)
140273551:     	leaq	-0x60(%rbp), %rdx
140273555:     	movq	%r14, %rcx
140273558:     	callq	0x140159570 <.text+0x158570>
14027355d:     	movq	$-0x1, 0x90(%rbp)
140273568:     	movl	$0x0, 0x1f0(%rbp)
140273572:     	movb	$0x0, 0x1f4(%rbp)
140273579:     	callq	0x140002200 <.text+0x1200>
14027357e:     	movl	$0x258, %ecx            # imm = 0x258
140273583:     	movl	$0x8, %edx
140273588:     	callq	0x1400021c0 <.text+0x11c0>
14027358d:     	testq	%rax, %rax
140273590:     	je	0x140273815 <.text+0x272815>
140273596:     	movq	%rax, %rdi
140273599:     	leaq	-0x60(%rbp), %rdx
14027359d:     	movl	$0x258, %r8d            # imm = 0x258
1402735a3:     	movq	%rax, %rcx
1402735a6:     	callq	0x145bc977b <.text+0x5bc877b>
1402735ab:     	leaq	0x5b4dcfe(%rip), %r8    # 0x145dc12b0
1402735b2:     	leaq	-0x60(%rbp), %rcx
1402735b6:     	movq	%rdi, %rdx
1402735b9:     	callq	0x144e09040 <.text+0x4e08040>
1402735be:     	nop
1402735bf:     	movq	0x7d8a0da(%rip), %rcx   # 0x147ffd6a0
1402735c6:     	leaq	0x5b3fb5b(%rip), %r8    # 0x145db3128
1402735cd:     	leaq	0x102f(%rbp), %rdx
1402735d4:     	callq	0x140119ae0 <.text+0x118ae0>
1402735d9:     	nop
1402735da:     	movq	%rdx, %r8
1402735dd:     	leaq	-0x60(%rbp), %rcx
1402735e1:     	movq	%rax, %rdx
1402735e4:     	callq	0x140011470 <.text+0x10470>
1402735e9:     	nop
1402735ea:     	movups	(%rbp), %xmm0
1402735ee:     	movaps	%xmm0, 0x1000(%rbp)
1402735f5:     	movups	-0x10(%rbp), %xmm0
1402735f9:     	movaps	%xmm0, 0xff0(%rbp)
140273600:     	movups	-0x20(%rbp), %xmm0
140273604:     	movaps	%xmm0, 0xfe0(%rbp)
14027360b:     	movups	-0x60(%rbp), %xmm0
14027360f:     	movups	-0x50(%rbp), %xmm1
140273613:     	movups	-0x40(%rbp), %xmm2
140273617:     	movups	-0x30(%rbp), %xmm3
14027361b:     	movaps	%xmm3, 0xfd0(%rbp)
140273622:     	movaps	%xmm2, 0xfc0(%rbp)
140273629:     	movaps	%xmm1, 0xfb0(%rbp)
140273630:     	movaps	%xmm0, 0xfa0(%rbp)
140273637:     	leaq	0xfa0(%rbp), %rdx
14027363e:     	movq	%r14, %rcx
140273641:     	callq	0x140159570 <.text+0x158570>
140273646:     	nop
140273647:     	addq	$0x10b8, %rsp           # imm = 0x10B8
14027364e:     	popq	%rbx
14027364f:     	popq	%rdi
140273650:     	popq	%rsi
140273651:     	popq	%r12
140273653:     	popq	%r13
140273655:     	popq	%r14
140273657:     	popq	%r15
140273659:     	popq	%rbp
14027365a:     	retq
14027365b:     	movq	-0x8(%r10), %rax
14027365f:     	movq	%rax, 0x8(%rbp)
140273663:     	movups	-0x18(%r10), %xmm0
140273668:     	movups	%xmm0, -0x8(%rbp)
14027366c:     	movups	-0x28(%r10), %xmm0
140273671:     	movups	%xmm0, -0x18(%rbp)
140273675:     	movdqu	-0x68(%r10), %xmm0
14027367b:     	movdqu	-0x58(%r10), %xmm1
140273681:     	movdqu	-0x48(%r10), %xmm2
140273687:     	movdqu	-0x38(%r10), %xmm3
14027368d:     	movdqu	%xmm3, -0x28(%rbp)
140273692:     	movdqu	%xmm2, -0x38(%rbp)
140273697:     	movdqu	%xmm1, -0x48(%rbp)
14027369c:     	movdqu	%xmm0, -0x58(%rbp)
1402736a1:     	movq	%rcx, -0x60(%rbp)
1402736a5:     	leaq	-0x60(%rbp), %rcx
1402736a9:     	leaq	0xfa0(%rbp), %rdx
1402736b0:     	callq	0x144df2330 <.text+0x4df1330>
1402736b5:     	nop
1402736b6:     	movq	%rax, %rbx
1402736b9:     	movq	0xfa0(%rbp), %rdx
1402736c0:     	testq	%rdx, %rdx
1402736c3:     	jne	0x140272720 <.text+0x271720>
1402736c9:     	jmp	0x140272736 <.text+0x271736>
1402736ce:     	movl	$0x8, %ecx
1402736d3:     	movl	$0x28, %edx
1402736d8:     	callq	0x145d69431 <.text+0x5d68431>
1402736dd:     	ud2
1402736df:     	movl	$0x8, %ecx
1402736e4:     	movl	$0x4d0, %edx            # imm = 0x4D0
1402736e9:     	callq	0x145d69431 <.text+0x5d68431>
1402736ee:     	ud2
1402736f0:     	movl	$0x8, %ecx
1402736f5:     	movl	$0xbd0, %edx            # imm = 0xBD0
1402736fa:     	callq	0x145d69431 <.text+0x5d68431>
1402736ff:     	nop
140273700:     	jmp	0x140273825 <.text+0x272825>
140273705:     	movl	$0x8, %ecx
14027370a:     	movl	$0x2a8, %edx            # imm = 0x2A8
14027370f:     	callq	0x145d69431 <.text+0x5d68431>
140273714:     	nop
140273715:     	jmp	0x140273825 <.text+0x272825>
14027371a:     	movl	$0x8, %ecx
14027371f:     	movl	$0x2c0, %edx            # imm = 0x2C0
140273724:     	callq	0x145d69431 <.text+0x5d68431>
140273729:     	nop
14027372a:     	jmp	0x140273825 <.text+0x272825>
14027372f:     	movl	$0x8, %ecx
140273734:     	movl	$0x188, %edx            # imm = 0x188
140273739:     	callq	0x145d69431 <.text+0x5d68431>
14027373e:     	nop
14027373f:     	jmp	0x140273825 <.text+0x272825>
140273744:     	movl	$0x8, %ecx
140273749:     	movl	$0x168, %edx            # imm = 0x168
14027374e:     	callq	0x145d69431 <.text+0x5d68431>
140273753:     	nop
140273754:     	jmp	0x140273825 <.text+0x272825>
140273759:     	movl	$0x8, %ecx
14027375e:     	movl	$0x190, %edx            # imm = 0x190
140273763:     	callq	0x145d69431 <.text+0x5d68431>
140273768:     	nop
140273769:     	jmp	0x140273825 <.text+0x272825>
14027376e:     	movl	$0x8, %ecx
140273773:     	movl	$0x158, %edx            # imm = 0x158
140273778:     	callq	0x145d69431 <.text+0x5d68431>
14027377d:     	nop
14027377e:     	jmp	0x140273825 <.text+0x272825>
140273783:     	movl	$0x8, %ecx
140273788:     	movl	$0x258, %edx            # imm = 0x258
14027378d:     	callq	0x145d69431 <.text+0x5d68431>
140273792:     	nop
140273793:     	jmp	0x140273825 <.text+0x272825>
140273798:     	movl	$0x8, %ecx
14027379d:     	movl	$0x3a8, %edx            # imm = 0x3A8
1402737a2:     	callq	0x145d69431 <.text+0x5d68431>
1402737a7:     	nop
1402737a8:     	jmp	0x140273825 <.text+0x272825>
1402737aa:     	movl	$0x8, %ecx
1402737af:     	movl	$0x140, %edx            # imm = 0x140
1402737b4:     	callq	0x145d69431 <.text+0x5d68431>
1402737b9:     	nop
1402737ba:     	jmp	0x140273825 <.text+0x272825>
1402737bc:     	movl	$0x8, %ecx
1402737c1:     	movl	$0x2d0, %edx            # imm = 0x2D0
1402737c6:     	callq	0x145d69431 <.text+0x5d68431>
1402737cb:     	nop
1402737cc:     	jmp	0x140273825 <.text+0x272825>
1402737ce:     	movl	$0x8, %ecx
1402737d3:     	movl	$0x150, %edx            # imm = 0x150
1402737d8:     	callq	0x145d69431 <.text+0x5d68431>
1402737dd:     	ud2
1402737df:     	movl	$0x8, %ecx
1402737e4:     	movl	$0x280, %edx            # imm = 0x280
1402737e9:     	callq	0x145d69431 <.text+0x5d68431>
1402737ee:     	nop
1402737ef:     	jmp	0x140273825 <.text+0x272825>
1402737f1:     	movl	$0x8, %ecx
1402737f6:     	movl	$0x148, %edx            # imm = 0x148
1402737fb:     	callq	0x145d69431 <.text+0x5d68431>
140273800:     	nop
140273801:     	jmp	0x140273825 <.text+0x272825>
140273803:     	movl	$0x4, %ecx
140273808:     	movl	$0xc, %edx
14027380d:     	callq	0x145d69431 <.text+0x5d68431>
140273812:     	nop
140273813:     	jmp	0x140273825 <.text+0x272825>
140273815:     	movl	$0x8, %ecx
14027381a:     	movl	$0x258, %edx            # imm = 0x258
14027381f:     	callq	0x145d69431 <.text+0x5d68431>
140273824:     	nop
140273825:     	ud2
