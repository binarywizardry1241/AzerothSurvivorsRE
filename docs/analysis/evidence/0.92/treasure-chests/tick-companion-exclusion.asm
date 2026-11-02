
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547d360:     	cmpq	%rdi, 0x20(%rcx,%rax,8)
14547d365:     	je	0x14547d320 <.text+0x547c320>
14547d367:     	cmpq	%rdi, 0x28(%rcx,%rax,8)
14547d36c:     	je	0x14547d320 <.text+0x547c320>
14547d36e:     	cmpq	%rdi, 0x30(%rcx,%rax,8)
14547d373:     	je	0x14547d320 <.text+0x547c320>
14547d375:     	cmpq	%rdi, 0x38(%rcx,%rax,8)
14547d37a:     	leaq	0x8(%rax), %rax
14547d37e:     	jne	0x14547d340 <.text+0x547c340>
14547d380:     	jmp	0x14547d320 <.text+0x547c320>
14547d382:     	testq	%r9, %r9
14547d385:     	je	0x14547d393 <.text+0x547c393>
14547d387:     	cmpq	%rdi, (%rcx,%r10,8)
14547d38b:     	je	0x14547d320 <.text+0x547c320>
14547d38d:     	cmpl	$0x8, %r9d
14547d391:     	jne	0x14547d3f7 <.text+0x547c3f7>
14547d393:     	movsd	0x34(%rbx), %xmm0
14547d398:     	movaps	%xmm0, %xmm1
14547d39b:     	subps	%xmm10, %xmm1
14547d39f:     	mulps	%xmm1, %xmm1
14547d3a2:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
14547d3a6:     	addss	%xmm1, %xmm2
14547d3aa:     	xorps	%xmm1, %xmm1
14547d3ad:     	sqrtss	%xmm2, %xmm1
14547d3b1:     	ucomiss	%xmm1, %xmm12
14547d3b5:     	jb	0x14547d320 <.text+0x547c320>
14547d3bb:     	ucomiss	%xmm14, %xmm1
14547d3bf:     	jbe	0x14547d320 <.text+0x547c320>
14547d3c5:     	movl	0x20(%rbx), %eax
14547d3c8:     	testl	%eax, %eax
14547d3ca:     	je	0x14547d6da <.text+0x547c6da>
14547d3d0:     	cmpl	$0x1, %eax
14547d3d3:     	je	0x14547d6e7 <.text+0x547c6e7>
14547d3d9:     	cmpb	$0x3, 0x328(%rbp)
14547d3e0:     	jne	0x14547d320 <.text+0x547c320>
14547d3e6:     	addl	$-0x3, %eax
14547d3e9:     	cmpl	$0x3, %eax
14547d3ec:     	jae	0x14547d320 <.text+0x547c320>
14547d3f2:     	jmp	0x14547d6e3 <.text+0x547c6e3>
14547d3f7:     	cmpq	%rdi, 0x8(%rcx,%r10,8)
14547d3fc:     	je	0x14547d320 <.text+0x547c320>
14547d402:     	cmpl	$0x10, %r9d
14547d406:     	je	0x14547d393 <.text+0x547c393>
14547d408:     	cmpq	%rdi, 0x10(%rcx,%r10,8)
14547d40d:     	je	0x14547d320 <.text+0x547c320>
14547d413:     	cmpl	$0x18, %r9d
14547d417:     	je	0x14547d393 <.text+0x547c393>
14547d41d:     	cmpq	%rdi, 0x18(%rcx,%r10,8)
14547d422:     	je	0x14547d320 <.text+0x547c320>
14547d428:     	cmpl	$0x20, %r9d
14547d42c:     	je	0x14547d393 <.text+0x547c393>
14547d432:     	cmpq	%rdi, 0x20(%rcx,%r10,8)
14547d437:     	je	0x14547d320 <.text+0x547c320>
14547d43d:     	cmpl	$0x28, %r9d
14547d441:     	je	0x14547d393 <.text+0x547c393>
14547d447:     	cmpq	%rdi, 0x28(%rcx,%r10,8)
14547d44c:     	je	0x14547d320 <.text+0x547c320>
14547d452:     	cmpl	$0x30, %r9d
14547d456:     	je	0x14547d393 <.text+0x547c393>
14547d45c:     	cmpq	%rdi, 0x30(%rcx,%r10,8)
14547d461:     	je	0x14547d320 <.text+0x547c320>
14547d467:     	cmpl	$0x38, %r9d
14547d46b:     	je	0x14547d393 <.text+0x547c393>
14547d471:     	jmp	0x14547d320 <.text+0x547c320>
14547d476:     	movq	0x220(%rbp), %rdx
14547d47d:     	testq	%rdx, %rdx
14547d480:     	je	0x14547d498 <.text+0x547c498>
14547d482:     	movq	0x228(%rbp), %rcx
14547d489:     	shlq	$0x3, %rdx
14547d48d:     	movl	$0x8, %r8d
14547d493:     	callq	0x1400021d0 <.text+0x11d0>
14547d498:     	movss	0x42af7f(%rip), %xmm12  # 0x1458a8420
14547d4a1:     	movss	0x300(%rbp), %xmm14
14547d4aa:     	leaq	0x1(%r15), %rbx
14547d4ae:     	movq	0x338(%rbp), %rsi
14547d4b5:     	movq	0x830(%rsi), %rdx
14547d4bc:     	cmpq	%rdx, %r15
14547d4bf:     	jae	0x1454817c9 <.text+0x54807c9>
14547d4c5:     	movq	0x828(%rsi), %rax
14547d4cc:     	movss	0x3f4(%rsi), %xmm10
14547d4d5:     	addss	0x64(%rax,%r13), %xmm10
14547d4dc:     	movaps	%xmm10, %xmm0
14547d4e0:     	callq	0x145714a63 <.text+0x5713a63>
14547d4e5:     	movaps	%xmm0, %xmm9
14547d4e9:     	movaps	%xmm10, %xmm0
14547d4ed:     	callq	0x145714a4b <.text+0x5713a4b>
14547d4f2:     	unpcklps	%xmm0, %xmm9            # xmm9 = xmm9[0],xmm0[0],xmm9[1],xmm0[1]
14547d4f6:     	mulps	0x16315b2(%rip), %xmm9  # 0x146aaeab0
14547d4fe:     	addps	%xmm7, %xmm9
14547d502:     	movaps	%xmm15, %xmm0
14547d506:     	subps	%xmm7, %xmm0
14547d509:     	mulps	%xmm0, %xmm0
14547d50c:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14547d510:     	addss	%xmm0, %xmm1
14547d514:     	xorps	%xmm0, %xmm0
14547d517:     	sqrtss	%xmm1, %xmm0
14547d51b:     	ucomiss	0x48d61e(%rip), %xmm0   # 0x14590ab40
14547d522:     	ja	0x14547ca74 <.text+0x547ba74>
14547d528:     	subps	%xmm9, %xmm15
14547d52c:     	mulps	%xmm15, %xmm15
14547d530:     	movshdup	%xmm15, %xmm0           # xmm0 = xmm15[1,1,3,3]
14547d535:     	addss	%xmm15, %xmm0
14547d53a:     	sqrtss	%xmm0, %xmm0
14547d53e:     	ucomiss	0x73306f(%rip), %xmm0   # 0x145bb05b4
14547d545:     	jbe	0x14547caa0 <.text+0x547baa0>
14547d54b:     	movshdup	%xmm9, %xmm3            # xmm3 = xmm9[1,1,3,3]
14547d550:     	movss	0x280(%rbp), %xmm0
14547d558:     	movss	%xmm0, 0x20(%rsp)
14547d55e:     	movq	0x338(%rbp), %rcx
14547d565:     	jmp	0x14547ca8a <.text+0x547ba8a>
14547d56a:     	movl	$0x1, %ecx
14547d56f:     	movq	%rcx, 0x310(%rbp)
14547d576:     	leaq	(%rax,%r12,8), %rbx
14547d57a:     	movq	%rax, 0x218(%rbp)
14547d581:     	movq	%rax, %r12
14547d584:     	jmp	0x14547d5a0 <.text+0x547c5a0>
14547d586:     	nopw	%cs:(%rax,%rax)
14547d590:     	movq	0x8(%rdi), %rax
14547d594:     	movlps	%xmm9, (%rax,%rsi,8)
14547d599:     	incq	%rsi
14547d59c:     	movq	%rsi, 0x10(%rdi)
14547d5a0:     	cmpq	%rbx, %r12
14547d5a3:     	je	0x14547d663 <.text+0x547c663>
14547d5a9:     	movq	%r12, %rax
14547d5ac:     	addq	$0x8, %r12
14547d5b0:     	movq	0x338(%rbp), %rcx
14547d5b7:     	movq	0x530(%rcx), %rdx
14547d5be:     	testq	%rdx, %rdx
14547d5c1:     	je	0x14547d5a0 <.text+0x547c5a0>
14547d5c3:     	movq	(%rax), %rcx
14547d5c6:     	movq	0x338(%rbp), %rax
14547d5cd:     	movq	0x528(%rax), %rax
14547d5d4:     	shlq	$0x3, %rdx
14547d5d8:     	leaq	(%rdx,%rdx,8), %r8
14547d5dc:     	xorl	%r9d, %r9d
14547d5df:     	xorl	%edx, %edx
14547d5e1:     	nopw	%cs:(%rax,%rax)
14547d5f0:     	cmpq	%rcx, 0x28(%rax,%r9)
14547d5f5:     	je	0x14547d610 <.text+0x547c610>
14547d5f7:     	incq	%rdx
14547d5fa:     	addq	$0x48, %r9
14547d5fe:     	cmpq	%r9, %r8
14547d601:     	jne	0x14547d5f0 <.text+0x547c5f0>
14547d603:     	jmp	0x14547d5a0 <.text+0x547c5a0>
14547d605:     	nopw	%cs:(%rax,%rax)
14547d610:     	movsd	0x20(%rax,%r9), %xmm9
14547d617:     	movq	0x338(%rbp), %rcx
14547d61e:     	callq	0x1454a5d50 <.text+0x54a4d50>
14547d623:     	nop
14547d624:     	movq	0x338(%rbp), %rax
14547d62b:     	movq	0x830(%rax), %rdx
14547d632:     	cmpq	%rdx, %r15
14547d635:     	jae	0x145481678 <.text+0x5480678>
