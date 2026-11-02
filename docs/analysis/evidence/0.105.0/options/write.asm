Disassembly of section .text:

0000000140001000 <.text>:
1400f2100:     	pushq	%rbp
1400f2101:     	pushq	%r15
1400f2103:     	pushq	%r14
1400f2105:     	pushq	%r13
1400f2107:     	pushq	%r12
1400f2109:     	pushq	%rsi
1400f210a:     	pushq	%rdi
1400f210b:     	pushq	%rbx
1400f210c:     	subq	$0xa8, %rsp
1400f2113:     	leaq	0x80(%rsp), %rbp
1400f211b:     	movaps	%xmm6, 0x10(%rbp)
1400f211f:     	movq	$-0x2, 0x8(%rbp)
1400f2127:     	movq	%r8, -0x50(%rbp)
1400f212b:     	movq	%r9, -0x48(%rbp)
1400f212f:     	cmpq	$0x5f, %rdx
1400f2133:     	ja	0x1400f2652 <.text+0xf1652>
1400f2139:     	movq	%r9, %r13
1400f213c:     	movq	%r8, %r14
1400f213f:     	movq	%rcx, %rsi
1400f2142:     	imulq	$0x98, %rdx, %rax
1400f2149:     	leaq	0x5caf758(%rip), %rcx   # 0x145da18a8
1400f2150:     	leaq	(%rcx,%rax), %r15
1400f2154:     	movq	0x18(%rax,%rcx), %rax
1400f2159:     	leaq	0x5cb6790(%rip), %rcx   # 0x145da88f0
1400f2160:     	movslq	(%rcx,%rax,4), %rax
1400f2164:     	addq	%rcx, %rax
1400f2167:     	jmpq	*%rax
1400f2169:     	movq	0x20(%r15), %rax
1400f216d:     	movq	0x28(%r15), %r8
1400f2171:     	movq	%r13, 0x20(%rsp)
1400f2176:     	movq	%rsi, %rcx
1400f2179:     	movq	%rdx, %rdi
1400f217c:     	movq	%rax, %rdx
1400f217f:     	movq	%r14, %r9
1400f2182:     	callq	0x14063d3f0 <.text+0x63c3f0>
1400f2187:     	movq	%rdi, %rax
1400f218a:     	movq	0x78(%r15), %rdi
1400f218e:     	cmpq	$0xe, %rax
1400f2192:     	je	0x1400f219e <.text+0xf119e>
1400f2194:     	cmpq	$0x3d, %rax
1400f2198:     	jne	0x1400f263a <.text+0xf163a>
1400f219e:     	movq	0x80(%r15), %rbx
1400f21a5:     	movss	0x88(%r15), %xmm6
1400f21ae:     	movq	%r14, %rcx
1400f21b1:     	movq	%r13, %rdx
1400f21b4:     	callq	0x145baaf70 <.text+0x5ba9f70>
1400f21b9:     	testq	%r13, %r13
1400f21bc:     	jns	0x1400f256f <.text+0xf156f>
1400f21c2:     	xorl	%r15d, %r15d
1400f21c5:     	movq	%r15, %rcx
1400f21c8:     	movq	%r13, %rdx
1400f21cb:     	callq	0x145d6944b <.text+0x5d6844b>
1400f21d0:     	ud2
1400f21d2:     	movq	0x20(%r15), %rdi
1400f21d6:     	movq	0x28(%r15), %rbx
1400f21da:     	cmpq	$0x1, %r13
1400f21de:     	jne	0x1400f23ec <.text+0xf13ec>
1400f21e4:     	xorl	%eax, %eax
1400f21e6:     	cmpb	$0x31, (%r14)
1400f21ea:     	setne	%al
1400f21ed:     	leaq	0x1(%rax,%rax), %r15
1400f21f2:     	leaq	0x5cad47c(%rip), %rax   # 0x145d9f675
1400f21f9:     	leaq	0x5cacb4c(%rip), %r14   # 0x145d9ed4c
1400f2200:     	cmoveq	%rax, %r14
1400f2204:     	jmp	0x1400f23f9 <.text+0xf13f9>
1400f2209:     	movq	%r14, %rcx
1400f220c:     	movq	%r13, %rdx
1400f220f:     	callq	0x145baaf70 <.text+0x5ba9f70>
1400f2214:     	movss	0x5c7b150(%rip), %xmm0  # 0x145d6d36c
1400f221c:     	testb	$0x1, %al
1400f221e:     	jne	0x1400f222c <.text+0xf122c>
1400f2220:     	shrq	$0x20, %rax
1400f2224:     	movd	%eax, %xmm1
1400f2228:     	subss	%xmm1, %xmm0
1400f222c:     	movss	%xmm0, -0x3c(%rbp)
1400f2231:     	leaq	-0x3c(%rbp), %rax
1400f2235:     	movq	%rax, -0x30(%rbp)
1400f2239:     	leaq	0x5abb040(%rip), %rax   # 0x145bad280 <.text+0x5bac280>
1400f2240:     	movq	%rax, -0x28(%rbp)
1400f2244:     	leaq	0x5cb3145(%rip), %rdx   # 0x145da5390
1400f224b:     	leaq	-0x20(%rbp), %rcx
1400f224f:     	leaq	-0x30(%rbp), %r8
1400f2253:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1400f2258:     	movq	-0x18(%rbp), %r9
1400f225c:     	movq	-0x10(%rbp), %rax
1400f2260:     	movq	%rax, 0x20(%rsp)
1400f2265:     	leaq	0x5cad459(%rip), %rdx   # 0x145d9f6c5
1400f226c:     	movl	$0x5, %r8d
1400f2272:     	movq	%rsi, %rcx
1400f2275:     	movq	%r9, -0x8(%rbp)
1400f2279:     	callq	0x14063d3f0 <.text+0x63c3f0>
1400f227e:     	nop
1400f227f:     	jmp	0x1400f2622 <.text+0xf1622>
1400f2284:     	movq	0x20(%r15), %rdi
1400f2288:     	movq	0x28(%r15), %rbx
1400f228c:     	leaq	-0x50(%rbp), %rax
1400f2290:     	movq	%rax, -0x30(%rbp)
1400f2294:     	leaq	0x60a15(%rip), %rax     # 0x140152cb0 <.text+0x151cb0>
1400f229b:     	movq	%rax, -0x28(%rbp)
1400f229f:     	leaq	0x5cb30b2(%rip), %rdx   # 0x145da5358
1400f22a6:     	leaq	-0x20(%rbp), %rcx
1400f22aa:     	leaq	-0x30(%rbp), %r8
1400f22ae:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1400f22b3:     	movq	-0x18(%rbp), %r8
1400f22b7:     	movq	-0x10(%rbp), %r14
1400f22bb:     	movq	%rdi, %rcx
1400f22be:     	movq	%rbx, %rdx
1400f22c1:     	movq	%r8, -0x8(%rbp)
1400f22c5:     	movq	%r14, %r9
1400f22c8:     	callq	0x14063adf0 <.text+0x639df0>
1400f22cd:     	nop
1400f22ce:     	cmpq	$0x0, 0x90(%rsi)
1400f22d6:     	je	0x1400f2542 <.text+0xf1542>
1400f22dc:     	movq	0x78(%rsi), %rax
1400f22e0:     	movq	0x80(%rsi), %rcx
1400f22e7:     	movabsq	$0x2de17139914c53c, %rdx # imm = 0x2DE17139914C53C
1400f22f1:     	xorl	%r8d, %r8d
1400f22f4:     	movdqa	0x5c7b774(%rip), %xmm0  # 0x145d6da70
1400f22fc:     	pcmpeqd	%xmm1, %xmm1
1400f2300:     	movdqa	0x5c7e858(%rip), %xmm2  # 0x145d70b60
1400f2308:     	andq	%rcx, %rdx
1400f230b:     	movdqu	(%rax,%rdx), %xmm3
1400f2310:     	movdqa	%xmm3, %xmm4
1400f2314:     	pcmpeqb	%xmm0, %xmm4
1400f2318:     	pmovmskb	%xmm4, %r9d
1400f231d:     	testl	%r9d, %r9d
1400f2320:     	je	0x1400f235a <.text+0xf135a>
1400f2322:     	tzcntl	%r9d, %r10d
1400f2327:     	addq	%rdx, %r10
1400f232a:     	andq	%rcx, %r10
1400f232d:     	negq	%r10
1400f2330:     	leaq	(%r10,%r10,2), %r10
1400f2334:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1400f233b:     	pcmpeqb	%xmm2, %xmm4
1400f233f:     	pmovmskb	%xmm4, %r11d
1400f2344:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1400f234b:     	je	0x1400f2379 <.text+0xf1379>
1400f234d:     	leal	-0x1(%r9), %r10d
1400f2351:     	andw	%r9w, %r10w
1400f2355:     	movl	%r10d, %r9d
1400f2358:     	jne	0x1400f2322 <.text+0xf1322>
1400f235a:     	pcmpeqb	%xmm1, %xmm3
1400f235e:     	pmovmskb	%xmm3, %r9d
1400f2363:     	testl	%r9d, %r9d
1400f2366:     	jne	0x1400f2542 <.text+0xf1542>
1400f236c:     	addq	%r8, %rdx
1400f236f:     	addq	$0x10, %rdx
1400f2373:     	addq	$0x10, %r8
1400f2377:     	jmp	0x1400f2308 <.text+0xf1308>
1400f2379:     	leaq	(%rax,%r10,8), %rax
1400f237d:     	movq	-0x8(%rax), %rax
1400f2381:     	cmpq	0x218(%rsi), %rax
1400f2388:     	jae	0x1400f2542 <.text+0xf1542>
1400f238e:     	movq	0x210(%rsi), %rcx
1400f2395:     	movq	(%rcx,%rax,8), %rcx
1400f2399:     	testq	%rcx, %rcx
1400f239c:     	je	0x1400f2542 <.text+0xf1542>
1400f23a2:     	movq	0x1e0(%rsi), %rax
1400f23a9:     	notq	%rcx
1400f23ac:     	imulq	$0x38, %rcx, %rcx
1400f23b0:     	cmpb	$0x0, 0x30(%rax,%rcx)
1400f23b5:     	je	0x1400f2542 <.text+0xf1542>
1400f23bb:     	addq	%rcx, %rax
1400f23be:     	movq	0x10(%rax), %rax
1400f23c2:     	cmpb	$0x1, 0xe8(%rax)
1400f23c9:     	jne	0x1400f2622 <.text+0xf1622>
1400f23cf:     	movq	%r14, 0x20(%rsp)
1400f23d4:     	movq	%rsi, %rcx
1400f23d7:     	movq	%rdi, %rdx
1400f23da:     	movq	%rbx, %r8
1400f23dd:     	movq	-0x8(%rbp), %r9
1400f23e1:     	callq	0x14063a4e0 <.text+0x6394e0>
1400f23e6:     	nop
1400f23e7:     	jmp	0x1400f2622 <.text+0xf1622>
1400f23ec:     	leaq	0x5cac959(%rip), %r14   # 0x145d9ed4c
1400f23f3:     	movl	$0x3, %r15d
1400f23f9:     	movq	%rdi, %rcx
1400f23fc:     	movq	%rbx, %rdx
1400f23ff:     	movq	%r14, %r8
1400f2402:     	movq	%r15, %r9
1400f2405:     	callq	0x14063adf0 <.text+0x639df0>
1400f240a:     	cmpq	$0x0, 0x90(%rsi)
1400f2412:     	je	0x1400f2516 <.text+0xf1516>
1400f2418:     	movq	0x78(%rsi), %rax
1400f241c:     	movq	0x80(%rsi), %rcx
1400f2423:     	movabsq	$0x2de17139914c53c, %rdx # imm = 0x2DE17139914C53C
1400f242d:     	xorl	%r8d, %r8d
1400f2430:     	movdqa	0x5c7b638(%rip), %xmm0  # 0x145d6da70
1400f2438:     	pcmpeqd	%xmm1, %xmm1
1400f243c:     	movdqa	0x5c7e71c(%rip), %xmm2  # 0x145d70b60
1400f2444:     	andq	%rcx, %rdx
1400f2447:     	movdqu	(%rax,%rdx), %xmm3
1400f244c:     	movdqa	%xmm3, %xmm4
1400f2450:     	pcmpeqb	%xmm0, %xmm4
1400f2454:     	pmovmskb	%xmm4, %r9d
1400f2459:     	testl	%r9d, %r9d
1400f245c:     	je	0x1400f2496 <.text+0xf1496>
1400f245e:     	tzcntl	%r9d, %r10d
1400f2463:     	addq	%rdx, %r10
1400f2466:     	andq	%rcx, %r10
1400f2469:     	negq	%r10
1400f246c:     	leaq	(%r10,%r10,2), %r10
1400f2470:     	movdqu	-0x18(%rax,%r10,8), %xmm4
1400f2477:     	pcmpeqb	%xmm2, %xmm4
1400f247b:     	pmovmskb	%xmm4, %r11d
1400f2480:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
1400f2487:     	je	0x1400f24b1 <.text+0xf14b1>
1400f2489:     	leal	-0x1(%r9), %r10d
1400f248d:     	andw	%r9w, %r10w
1400f2491:     	movl	%r10d, %r9d
1400f2494:     	jne	0x1400f245e <.text+0xf145e>
1400f2496:     	pcmpeqb	%xmm1, %xmm3
1400f249a:     	pmovmskb	%xmm3, %r9d
1400f249f:     	testl	%r9d, %r9d
1400f24a2:     	jne	0x1400f2516 <.text+0xf1516>
1400f24a4:     	addq	%r8, %rdx
1400f24a7:     	addq	$0x10, %rdx
1400f24ab:     	addq	$0x10, %r8
1400f24af:     	jmp	0x1400f2444 <.text+0xf1444>
1400f24b1:     	leaq	(%rax,%r10,8), %rax
1400f24b5:     	movq	-0x8(%rax), %rax
1400f24b9:     	cmpq	0x218(%rsi), %rax
1400f24c0:     	jae	0x1400f2516 <.text+0xf1516>
1400f24c2:     	movq	0x210(%rsi), %rcx
1400f24c9:     	movq	(%rcx,%rax,8), %rcx
1400f24cd:     	testq	%rcx, %rcx
1400f24d0:     	je	0x1400f2516 <.text+0xf1516>
1400f24d2:     	movq	0x1e0(%rsi), %rax
1400f24d9:     	notq	%rcx
1400f24dc:     	imulq	$0x38, %rcx, %rcx
1400f24e0:     	cmpb	$0x0, 0x30(%rax,%rcx)
1400f24e5:     	je	0x1400f2516 <.text+0xf1516>
1400f24e7:     	addq	%rcx, %rax
1400f24ea:     	movq	0x10(%rax), %rax
1400f24ee:     	cmpb	$0x1, 0xe8(%rax)
1400f24f5:     	jne	0x1400f263a <.text+0xf163a>
1400f24fb:     	movq	%r15, 0x20(%rsp)
1400f2500:     	movq	%rsi, %rcx
1400f2503:     	movq	%rdi, %rdx
1400f2506:     	movq	%rbx, %r8
1400f2509:     	movq	%r14, %r9
1400f250c:     	callq	0x14063a4e0 <.text+0x6394e0>
1400f2511:     	jmp	0x1400f263a <.text+0xf163a>
1400f2516:     	leaq	0x7(%rbp), %rax
1400f251a:     	movq	%rax, -0x20(%rbp)
1400f251e:     	leaq	0x4ef414b(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
1400f2525:     	movq	%rax, -0x18(%rbp)
1400f2529:     	leaq	0x5cabb80(%rip), %rcx   # 0x145d9e0b0
1400f2530:     	leaq	0x5cb2e41(%rip), %r8    # 0x145da5378
1400f2537:     	leaq	-0x20(%rbp), %rdx
1400f253b:     	callq	0x145d699c0 <.text+0x5d689c0>
1400f2540:     	ud2
1400f2542:     	leaq	0x7(%rbp), %rax
1400f2546:     	movq	%rax, -0x30(%rbp)
1400f254a:     	leaq	0x4ef411f(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
1400f2551:     	movq	%rax, -0x28(%rbp)
1400f2555:     	leaq	0x5cabb54(%rip), %rcx   # 0x145d9e0b0
1400f255c:     	leaq	0x5cb2dfd(%rip), %r8    # 0x145da5360
1400f2563:     	leaq	-0x30(%rbp), %rdx
1400f2567:     	callq	0x145d699c0 <.text+0x5d689c0>
1400f256c:     	nop
1400f256d:     	ud2
1400f256f:     	je	0x1400f25c0 <.text+0xf15c0>
1400f2571:     	movq	%rax, %r12
1400f2574:     	callq	0x140002200 <.text+0x1200>
1400f2579:     	movl	$0x1, %r15d
1400f257f:     	movl	$0x1, %edx
1400f2584:     	movq	%r13, %rcx
1400f2587:     	callq	0x1400021c0 <.text+0x11c0>
1400f258c:     	testq	%rax, %rax
1400f258f:     	je	0x1400f21c5 <.text+0xf11c5>
1400f2595:     	movq	%rax, -0x8(%rbp)
1400f2599:     	movq	%rax, %rcx
1400f259c:     	movq	%r14, %rdx
1400f259f:     	movq	%r13, %r8
1400f25a2:     	callq	0x145bc977b <.text+0x5bc877b>
1400f25a7:     	movq	%r12, %rax
1400f25aa:     	testb	$0x1, %al
1400f25ac:     	je	0x1400f25cd <.text+0xf15cd>
1400f25ae:     	movq	%r13, -0x20(%rbp)
1400f25b2:     	movq	-0x8(%rbp), %rax
1400f25b6:     	movq	%rax, -0x18(%rbp)
1400f25ba:     	movq	%r13, -0x10(%rbp)
1400f25be:     	jmp	0x1400f2602 <.text+0xf1602>
1400f25c0:     	movl	$0x1, %ecx
1400f25c5:     	movq	%rcx, -0x8(%rbp)
1400f25c9:     	testb	$0x1, %al
1400f25cb:     	jne	0x1400f25ae <.text+0xf15ae>
1400f25cd:     	movq	%r13, -0x38(%rbp)
1400f25d1:     	shrq	$0x20, %rax
1400f25d5:     	movd	%eax, %xmm0
1400f25d9:     	mulss	%xmm0, %xmm6
1400f25dd:     	leaq	-0x20(%rbp), %rcx
1400f25e1:     	movaps	%xmm6, %xmm1
1400f25e4:     	callq	0x1400f0bf0 <.text+0xefbf0>
1400f25e9:     	nop
1400f25ea:     	movq	-0x38(%rbp), %rdx
1400f25ee:     	testq	%rdx, %rdx
1400f25f1:     	je	0x1400f2602 <.text+0xf1602>
1400f25f3:     	movl	$0x1, %r8d
1400f25f9:     	movq	-0x8(%rbp), %rcx
1400f25fd:     	callq	0x1400021d0 <.text+0x11d0>
1400f2602:     	movq	-0x18(%rbp), %r9
1400f2606:     	movq	-0x10(%rbp), %rax
1400f260a:     	movq	%rax, 0x20(%rsp)
1400f260f:     	movq	%rsi, %rcx
1400f2612:     	movq	%rdi, %rdx
1400f2615:     	movq	%rbx, %r8
1400f2618:     	movq	%r9, -0x8(%rbp)
1400f261c:     	callq	0x14063d3f0 <.text+0x63c3f0>
1400f2621:     	nop
1400f2622:     	movq	-0x20(%rbp), %rdx
1400f2626:     	testq	%rdx, %rdx
1400f2629:     	je	0x1400f263a <.text+0xf163a>
1400f262b:     	movl	$0x1, %r8d
1400f2631:     	movq	-0x8(%rbp), %rcx
1400f2635:     	callq	0x1400021d0 <.text+0x11d0>
1400f263a:     	movaps	0x10(%rbp), %xmm6
1400f263e:     	addq	$0xa8, %rsp
1400f2645:     	popq	%rbx
1400f2646:     	popq	%rdi
1400f2647:     	popq	%rsi
1400f2648:     	popq	%r12
1400f264a:     	popq	%r13
1400f264c:     	popq	%r14
1400f264e:     	popq	%r15
1400f2650:     	popq	%rbp
1400f2651:     	retq
1400f2652:     	leaq	0x5cb2ce7(%rip), %r8    # 0x145da5340
1400f2659:     	movq	%rdx, %rcx
1400f265c:     	movl	$0x60, %edx
1400f2661:     	callq	0x145d697e3 <.text+0x5d687e3>
1400f2666:     	ud2
