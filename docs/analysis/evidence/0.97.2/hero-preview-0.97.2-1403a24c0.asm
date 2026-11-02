
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1403a24c0:     	pushq	%r15
1403a24c2:     	pushq	%r14
1403a24c4:     	pushq	%r13
1403a24c6:     	pushq	%r12
1403a24c8:     	pushq	%rsi
1403a24c9:     	pushq	%rdi
1403a24ca:     	pushq	%rbp
1403a24cb:     	pushq	%rbx
1403a24cc:     	subq	$0x58, %rsp
1403a24d0:     	movq	0xc8(%rsp), %r10
1403a24d8:     	movq	0xc0(%rsp), %r11
1403a24e0:     	movq	(%rdx), %rax
1403a24e3:     	movq	0x8(%rdx), %rcx
1403a24e7:     	movq	(%r8), %rdx
1403a24ea:     	movq	%rdx, 0x38(%rsp)
1403a24ef:     	movq	0x8(%r8), %r15
1403a24f3:     	movq	(%r9), %rdx
1403a24f6:     	movq	%rdx, 0x40(%rsp)
1403a24fb:     	movq	0x8(%r9), %r8
1403a24ff:     	movq	(%r11), %rdx
1403a2502:     	movq	(%r10), %rsi
1403a2505:     	movq	0x10(%r10), %r9
1403a2509:     	movq	%r9, 0x30(%rsp)
1403a250e:     	movl	0x1c(%r10), %r9d
1403a2512:     	movl	%r9d, 0x2c(%rsp)
1403a2517:     	movq	0xf8(%rax), %r11
1403a251e:     	movq	0x100(%rax), %r9
1403a2525:     	leaq	(%r11,%r9,4), %r10
1403a2529:     	cmpb	$0x0, 0x108(%rax)
1403a2530:     	je	0x1403a264a <.text+0x3a164a>
1403a2536:     	xorl	%edi, %edi
1403a2538:     	xorl	%r13d, %r13d
1403a253b:     	xorl	%ebp, %ebp
1403a253d:     	xorl	%r12d, %r12d
1403a2540:     	cmpl	%r12d, %ebp
1403a2543:     	jne	0x1403a2609 <.text+0x3a1609>
1403a2549:     	nopl	(%rax)
1403a2550:     	cmpq	%r10, %r11
1403a2553:     	je	0x1403a25c0 <.text+0x3a15c0>
1403a2555:     	movl	(%r11), %ebx
1403a2558:     	addq	$0x4, %r11
1403a255c:     	movq	0x1a8(%rcx), %r9
1403a2563:     	leaq	(%rbx,%rbx,8), %rbx
1403a2567:     	movq	0x10(%r9,%rbx,8), %r12
1403a256c:     	testq	%r12, %r12
1403a256f:     	je	0x1403a2550 <.text+0x3a1550>
1403a2571:     	leaq	(%r9,%rbx,8), %rdi
1403a2575:     	movq	0x110(%rax), %r9
1403a257c:     	movq	0x40(%rdi), %rbx
1403a2580:     	cmpq	%rbx, %r9
1403a2583:     	jae	0x1403a25d3 <.text+0x3a15d3>
1403a2585:     	movq	0x38(%rdi), %r14
1403a2589:     	movq	(%r14,%r9,8), %r9
1403a258d:     	testq	%r9, %r9
1403a2590:     	je	0x1403a25d3 <.text+0x3a15d3>
1403a2592:     	movq	0x18(%rdi), %r14
1403a2596:     	notq	%r9
1403a2599:     	leaq	(%r9,%r9,2), %r9
1403a259d:     	shlq	$0x4, %r9
1403a25a1:     	movq	0x10(%r14,%r9), %r13
1403a25a6:     	movq	0x118(%rax), %r9
1403a25ad:     	cmpq	%rbx, %r9
1403a25b0:     	jb	0x1403a25e2 <.text+0x3a15e2>
1403a25b2:     	jmp	0x1403a2605 <.text+0x3a1605>
1403a25b4:     	nopw	%cs:(%rax,%rax)
1403a25c0:     	movl	%ebp, %r12d
1403a25c3:     	movq	%r10, %r11
1403a25c6:     	xorl	%r9d, %r9d
1403a25c9:     	testq	%r9, %r9
1403a25cc:     	jne	0x1403a261e <.text+0x3a161e>
1403a25ce:     	jmp	0x1403a278d <.text+0x3a178d>
1403a25d3:     	xorl	%r13d, %r13d
1403a25d6:     	movq	0x118(%rax), %r9
1403a25dd:     	cmpq	%rbx, %r9
1403a25e0:     	jae	0x1403a2605 <.text+0x3a1605>
1403a25e2:     	movq	0x38(%rdi), %rbx
1403a25e6:     	movq	(%rbx,%r9,8), %r9
1403a25ea:     	testq	%r9, %r9
1403a25ed:     	je	0x1403a2605 <.text+0x3a1605>
1403a25ef:     	movq	0x18(%rdi), %rdi
1403a25f3:     	notq	%r9
1403a25f6:     	leaq	(%r9,%r9,2), %r9
1403a25fa:     	shlq	$0x4, %r9
1403a25fe:     	movq	0x10(%rdi,%r9), %rdi
1403a2603:     	jmp	0x1403a2607 <.text+0x3a1607>
1403a2605:     	xorl	%edi, %edi
1403a2607:     	xorl	%ebp, %ebp
1403a2609:     	movl	%ebp, %ebx
1403a260b:     	incl	%ebp
1403a260d:     	leaq	(%rbx,%r13), %r9
1403a2611:     	leaq	(%rdi,%rbx,4), %rbx
1403a2615:     	testq	%r9, %r9
1403a2618:     	je	0x1403a278d <.text+0x3a178d>
1403a261e:     	cmpb	$0x0, (%r9)
1403a2622:     	jne	0x1403a2540 <.text+0x3a1540>
1403a2628:     	movss	(%rbx), %xmm0
1403a262c:     	mulss	0x58(%rdx), %xmm0
1403a2631:     	movq	0x30(%rsp), %r9
1403a2636:     	movl	0x2c(%rsp), %ebx
1403a263a:     	movl	%ebx, (%r9)
1403a263d:     	addss	(%rsi), %xmm0
1403a2641:     	movss	%xmm0, (%rsi)
1403a2645:     	jmp	0x1403a2540 <.text+0x3a1540>
1403a264a:     	movl	$0x8, %r14d
1403a2650:     	xorl	%ebp, %ebp
1403a2652:     	xorl	%r13d, %r13d
1403a2655:     	xorl	%edi, %edi
1403a2657:     	xorl	%r12d, %r12d
1403a265a:     	nopw	(%rax,%rax)
1403a2660:     	cmpl	%r12d, %edi
1403a2663:     	jne	0x1403a273d <.text+0x3a173d>
1403a2669:     	nopl	(%rax)
1403a2670:     	cmpq	%r10, %r11
1403a2673:     	je	0x1403a26f0 <.text+0x3a16f0>
1403a2675:     	movl	(%r11), %r9d
1403a2678:     	addq	$0x4, %r11
1403a267c:     	movq	0x108(%rcx), %rbx
1403a2683:     	leaq	(%r9,%r9,4), %r9
1403a2687:     	shlq	$0x5, %r9
1403a268b:     	movq	0x58(%rbx,%r9), %r12
1403a2690:     	testq	%r12, %r12
1403a2693:     	je	0x1403a2670 <.text+0x3a1670>
1403a2695:     	addq	%r9, %rbx
1403a2698:     	movl	0x94(%rbx), %r9d
1403a269f:     	movq	0x1a8(%rcx), %r14
1403a26a6:     	leaq	(%r9,%r9,8), %r13
1403a26aa:     	leaq	(%r14,%r13,8), %rdi
1403a26ae:     	movq	0x110(%rax), %r9
1403a26b5:     	movq	0x40(%r14,%r13,8), %r14
1403a26ba:     	cmpq	%r14, %r9
1403a26bd:     	jae	0x1403a2703 <.text+0x3a1703>
1403a26bf:     	movq	0x38(%rdi), %r13
1403a26c3:     	movq	(%r13,%r9,8), %r9
1403a26c8:     	testq	%r9, %r9
1403a26cb:     	je	0x1403a2703 <.text+0x3a1703>
1403a26cd:     	movq	0x18(%rdi), %r13
1403a26d1:     	notq	%r9
1403a26d4:     	leaq	(%r9,%r9,2), %r9
1403a26d8:     	shlq	$0x4, %r9
1403a26dc:     	movq	0x10(%r13,%r9), %r13
1403a26e1:     	movq	0x118(%rax), %r9
1403a26e8:     	cmpq	%r14, %r9
1403a26eb:     	jb	0x1403a2712 <.text+0x3a1712>
1403a26ed:     	jmp	0x1403a2735 <.text+0x3a1735>
1403a26ef:     	nop
1403a26f0:     	movl	%edi, %r12d
1403a26f3:     	movq	%r10, %r11
1403a26f6:     	xorl	%r9d, %r9d
1403a26f9:     	testq	%r9, %r9
1403a26fc:     	jne	0x1403a2761 <.text+0x3a1761>
1403a26fe:     	jmp	0x1403a278d <.text+0x3a178d>
1403a2703:     	xorl	%r13d, %r13d
1403a2706:     	movq	0x118(%rax), %r9
1403a270d:     	cmpq	%r14, %r9
1403a2710:     	jae	0x1403a2735 <.text+0x3a1735>
1403a2712:     	movq	0x38(%rdi), %r14
1403a2716:     	movq	(%r14,%r9,8), %r9
1403a271a:     	testq	%r9, %r9
1403a271d:     	je	0x1403a2735 <.text+0x3a1735>
1403a271f:     	movq	0x18(%rdi), %rdi
1403a2723:     	notq	%r9
1403a2726:     	leaq	(%r9,%r9,2), %r9
1403a272a:     	shlq	$0x4, %r9
1403a272e:     	movq	0x10(%rdi,%r9), %rbp
1403a2733:     	jmp	0x1403a2737 <.text+0x3a1737>
1403a2735:     	xorl	%ebp, %ebp
1403a2737:     	movq	0x50(%rbx), %r14
1403a273b:     	xorl	%edi, %edi
1403a273d:     	movl	%edi, %r9d
1403a2740:     	shlq	$0x4, %r9
1403a2744:     	incl	%edi
1403a2746:     	movl	0x8(%r14,%r9), %ebx
1403a274b:     	notl	%ebx
1403a274d:     	leaq	(%rbx,%r13), %r9
1403a2751:     	leaq	(,%rbx,4), %rbx
1403a2759:     	addq	%rbp, %rbx
1403a275c:     	testq	%r9, %r9
1403a275f:     	je	0x1403a278d <.text+0x3a178d>
1403a2761:     	cmpb	$0x0, (%r9)
1403a2765:     	jne	0x1403a2660 <.text+0x3a1660>
1403a276b:     	movss	(%rbx), %xmm0
1403a276f:     	mulss	0x58(%rdx), %xmm0
1403a2774:     	movq	0x30(%rsp), %r9
1403a2779:     	movl	0x2c(%rsp), %ebx
1403a277d:     	movl	%ebx, (%r9)
1403a2780:     	addss	(%rsi), %xmm0
1403a2784:     	movss	%xmm0, (%rsi)
1403a2788:     	jmp	0x1403a2660 <.text+0x3a1660>
1403a278d:     	leaq	0x48(%rsp), %rcx
1403a2792:     	movq	0x40(%rsp), %rdx
1403a2797:     	callq	0x140391f00 <.text+0x390f00>
1403a279c:     	cmpb	$0x1, 0x48(%rsp)
1403a27a1:     	jne	0x1403a27ac <.text+0x3a17ac>
1403a27a3:     	xorl	%eax, %eax
1403a27a5:     	movq	0x38(%rsp), %r14
1403a27aa:     	jmp	0x1403a2828 <.text+0x3a1828>
1403a27ac:     	movq	0x50(%rsp), %rcx
1403a27b1:     	cmpl	$0x1, (%rcx)
1403a27b4:     	movq	0x38(%rsp), %r14
1403a27b9:     	jne	0x1403a2826 <.text+0x3a1826>
1403a27bb:     	movsd	0x8(%rcx), %xmm1
1403a27c0:     	xorl	%eax, %eax
1403a27c2:     	xorps	%xmm0, %xmm0
1403a27c5:     	ucomisd	%xmm0, %xmm1
1403a27c9:     	jb	0x1403a2828 <.text+0x3a1828>
1403a27cb:     	movsd	0x10(%rcx), %xmm2
1403a27d0:     	ucomisd	%xmm0, %xmm2
1403a27d4:     	jb	0x1403a2828 <.text+0x3a1828>
1403a27d6:     	movl	0xc0(%rcx), %eax
1403a27dc:     	xorps	%xmm0, %xmm0
1403a27df:     	cvtsi2sd	%rax, %xmm0
1403a27e4:     	ucomisd	%xmm1, %xmm0
1403a27e8:     	jbe	0x1403a2826 <.text+0x3a1826>
1403a27ea:     	movl	0xc4(%rcx), %eax
1403a27f0:     	xorps	%xmm0, %xmm0
1403a27f3:     	cvtsi2sd	%rax, %xmm0
1403a27f8:     	ucomisd	%xmm2, %xmm0
1403a27fc:     	jbe	0x1403a2826 <.text+0x3a1826>
1403a27fe:     	xorps	%xmm0, %xmm0
1403a2801:     	cvtsd2ss	%xmm1, %xmm0
1403a2805:     	leaq	0xc8(%rcx), %rax
1403a280c:     	leaq	0xbc(%rcx), %rdx
1403a2813:     	cmpb	$0x0, 0xb8(%rcx)
1403a281a:     	cmovneq	%rdx, %rax
1403a281e:     	divss	(%rax), %xmm0
1403a2822:     	movb	$0x1, %al
1403a2824:     	jmp	0x1403a2828 <.text+0x3a1828>
1403a2826:     	xorl	%eax, %eax
1403a2828:     	movq	0xd0(%rsp), %rcx
1403a2830:     	movq	0xf8(%r14), %rdx
1403a2837:     	movq	0x100(%r14), %r8
1403a283e:     	leaq	(%rdx,%r8,4), %r8
1403a2842:     	cmpb	$0x0, 0x108(%r14)
1403a284a:     	je	0x1403a2857 <.text+0x3a1857>
1403a284c:     	xorl	%r9d, %r9d
1403a284f:     	xorl	%r10d, %r10d
1403a2852:     	xorl	%r11d, %r11d
1403a2855:     	jmp	0x1403a2881 <.text+0x3a1881>
1403a2857:     	xorl	%r9d, %r9d
1403a285a:     	movl	$0x8, %r11d
1403a2860:     	xorl	%r10d, %r10d
1403a2863:     	xorl	%edi, %edi
1403a2865:     	jmp	0x1403a290c <.text+0x3a190c>
1403a286a:     	xorl	%r10d, %r10d
1403a286d:     	xorl	%r11d, %r11d
1403a2870:     	movl	%r11d, %edi
1403a2873:     	incl	%r11d
1403a2876:     	cmpb	$0x0, (%r10,%rdi)
1403a287b:     	je	0x1403a299e <.text+0x3a199e>
1403a2881:     	cmpl	%r9d, %r11d
1403a2884:     	jne	0x1403a2870 <.text+0x3a1870>
1403a2886:     	nopw	%cs:(%rax,%rax)
1403a2890:     	cmpq	%r8, %rdx
1403a2893:     	je	0x1403a29d7 <.text+0x3a19d7>
1403a2899:     	movl	(%rdx), %r9d
1403a289c:     	addq	$0x4, %rdx
1403a28a0:     	movq	0x1a8(%r15), %r10
1403a28a7:     	leaq	(%r9,%r9,8), %r11
1403a28ab:     	movq	0x10(%r10,%r11,8), %r9
1403a28b0:     	testq	%r9, %r9
1403a28b3:     	je	0x1403a2890 <.text+0x3a1890>
1403a28b5:     	leaq	(%r10,%r11,8), %r10
1403a28b9:     	movq	0x110(%r14), %r11
1403a28c0:     	cmpq	0x40(%r10), %r11
1403a28c4:     	jae	0x1403a286a <.text+0x3a186a>
1403a28c6:     	movq	0x38(%r10), %rdi
1403a28ca:     	movq	(%rdi,%r11,8), %r11
1403a28ce:     	testq	%r11, %r11
1403a28d1:     	je	0x1403a286a <.text+0x3a186a>
1403a28d3:     	movq	0x18(%r10), %r10
1403a28d7:     	notq	%r11
1403a28da:     	leaq	(%r11,%r11,2), %r11
1403a28de:     	shlq	$0x4, %r11
1403a28e2:     	movq	0x10(%r10,%r11), %r10
1403a28e7:     	jmp	0x1403a286d <.text+0x3a186d>
1403a28e9:     	xorl	%r10d, %r10d
1403a28ec:     	movq	0x50(%r11), %r11
1403a28f0:     	xorl	%edi, %edi
1403a28f2:     	movl	%edi, %ebx
1403a28f4:     	shlq	$0x4, %rbx
1403a28f8:     	incl	%edi
1403a28fa:     	movl	0x8(%r11,%rbx), %ebx
1403a28ff:     	notl	%ebx
1403a2901:     	cmpb	$0x0, (%r10,%rbx)
1403a2906:     	je	0x1403a299e <.text+0x3a199e>
1403a290c:     	cmpl	%r9d, %edi
1403a290f:     	jne	0x1403a28f2 <.text+0x3a18f2>
1403a2911:     	nopw	%cs:(%rax,%rax)
1403a2920:     	cmpq	%r8, %rdx
1403a2923:     	je	0x1403a29d7 <.text+0x3a19d7>
1403a2929:     	movl	(%rdx), %r9d
1403a292c:     	addq	$0x4, %rdx
1403a2930:     	movq	0x108(%r15), %r11
1403a2937:     	leaq	(%r9,%r9,4), %r10
1403a293b:     	shlq	$0x5, %r10
1403a293f:     	movq	0x58(%r11,%r10), %r9
1403a2944:     	testq	%r9, %r9
1403a2947:     	je	0x1403a2920 <.text+0x3a1920>
1403a2949:     	addq	%r10, %r11
1403a294c:     	movl	0x94(%r11), %r10d
1403a2953:     	movq	0x1a8(%r15), %rdi
1403a295a:     	leaq	(%r10,%r10,8), %rbx
1403a295e:     	movq	0x110(%r14), %r10
1403a2965:     	cmpq	0x40(%rdi,%rbx,8), %r10
1403a296a:     	jae	0x1403a28e9 <.text+0x3a18e9>
1403a2970:     	leaq	(%rdi,%rbx,8), %rdi
1403a2974:     	movq	0x38(%rdi), %rbx
1403a2978:     	movq	(%rbx,%r10,8), %r10
1403a297c:     	testq	%r10, %r10
1403a297f:     	je	0x1403a28e9 <.text+0x3a18e9>
1403a2985:     	movq	0x18(%rdi), %rdi
1403a2989:     	notq	%r10
1403a298c:     	leaq	(%r10,%r10,2), %r10
1403a2990:     	shlq	$0x4, %r10
1403a2994:     	movq	0x10(%rdi,%r10), %r10
1403a2999:     	jmp	0x1403a28ec <.text+0x3a18ec>
1403a299e:     	testb	%al, %al
1403a29a0:     	je	0x1403a29d7 <.text+0x3a19d7>
1403a29a2:     	cmpl	$0x1, (%rcx)
1403a29a5:     	jne	0x1403a29ca <.text+0x3a19ca>
1403a29a7:     	movaps	%xmm0, %xmm1
1403a29aa:     	subss	0x4(%rcx), %xmm1
1403a29af:     	mulss	0x55ac9b9(%rip), %xmm1  # 0x14594f370
1403a29b7:     	movq	0x30(%rsp), %rax
1403a29bc:     	movl	0x2c(%rsp), %edx
1403a29c0:     	movl	%edx, (%rax)
1403a29c2:     	addss	(%rsi), %xmm1
1403a29c6:     	movss	%xmm1, (%rsi)
1403a29ca:     	movl	$0x1, (%rcx)
1403a29d0:     	movss	%xmm0, 0x4(%rcx)
1403a29d5:     	jmp	0x1403a29dd <.text+0x3a19dd>
1403a29d7:     	movl	$0x0, (%rcx)
1403a29dd:     	addq	$0x58, %rsp
1403a29e1:     	popq	%rbx
1403a29e2:     	popq	%rbp
1403a29e3:     	popq	%rdi
1403a29e4:     	popq	%rsi
1403a29e5:     	popq	%r12
1403a29e7:     	popq	%r13
1403a29e9:     	popq	%r14
1403a29eb:     	popq	%r15
1403a29ed:     	retq
