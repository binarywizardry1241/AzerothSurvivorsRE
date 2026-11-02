
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459451c0:     	pushq	%rbp
1459451c1:     	pushq	%r15
1459451c3:     	pushq	%r14
1459451c5:     	pushq	%rsi
1459451c6:     	pushq	%rdi
1459451c7:     	pushq	%rbx
1459451c8:     	subq	$0x118, %rsp            # imm = 0x118
1459451cf:     	leaq	0x80(%rsp), %rbp
1459451d7:     	movaps	%xmm8, 0x80(%rbp)
1459451df:     	movaps	%xmm7, 0x70(%rbp)
1459451e3:     	movaps	%xmm6, 0x60(%rbp)
1459451e7:     	movq	$-0x2, 0x58(%rbp)
1459451ef:     	movq	%rcx, %rsi
1459451f2:     	movss	0x9ec(%rcx), %xmm6
1459451fa:     	cmpl	$0x3, %edx
1459451fd:     	je	0x145945217 <.text+0x5944217>
1459451ff:     	cmpl	$0x4, %edx
145945202:     	jne	0x14594527b <.text+0x594427b>
145945204:     	movl	$0xa, %eax
145945209:     	leaq	0x1533c49(%rip), %rcx   # 0x146e78e59
145945210:     	movl	$0x5bd1, %edi           # imm = 0x5BD1
145945215:     	jmp	0x145945228 <.text+0x5944228>
145945217:     	movl	$0x5, %eax
14594521c:     	leaq	0x1533c11(%rip), %rcx   # 0x146e78e34
145945223:     	movl	$0x5b9b, %edi           # imm = 0x5B9B
145945228:     	movq	%rcx, -0x20(%rbp)
14594522c:     	movq	%rax, -0x18(%rbp)
145945230:     	leaq	0x370(%rsi), %rcx
145945237:     	movq	0x380(%rsi), %rbx
14594523e:     	testq	%rbx, %rbx
145945241:     	je	0x145945433 <.text+0x5944433>
145945247:     	movq	0x378(%rsi), %rax
14594524e:     	xorl	%r8d, %r8d
145945251:     	movq	%rax, %r9
145945254:     	nopw	%cs:(%rax,%rax)
145945260:     	cmpl	%edi, 0xc(%r9)
145945264:     	je	0x1459457fb <.text+0x59447fb>
14594526a:     	incq	%r8
14594526d:     	addq	$0x18, %r9
145945271:     	cmpq	%r8, %rbx
145945274:     	jne	0x145945260 <.text+0x5944260>
145945276:     	jmp	0x145945435 <.text+0x5944435>
14594527b:     	leaq	0x1534b4e(%rip), %rax   # 0x146e79dd0
145945282:     	movq	%rax, -0x20(%rbp)
145945286:     	movq	$0xb, -0x18(%rbp)
14594528e:     	movl	$0x2330, %edi           # imm = 0x2330
145945293:     	cmpl	$0x5, %edx
145945296:     	jne	0x145945230 <.text+0x5944230>
145945298:     	movss	0x478(%rsi), %xmm7
1459452a0:     	mulss	0x4284ac(%rip), %xmm7   # 0x145d6d754
1459452a8:     	leaq	0x1534b21(%rip), %rdi   # 0x146e79dd0
1459452af:     	movl	$0xb, %ebx
1459452b4:     	movl	$0xb, %edx
1459452b9:     	movq	%rdi, %rcx
1459452bc:     	callq	0x1458da590 <.text+0x58d9590>
1459452c1:     	movss	0x478(%rsi), %xmm6
1459452c9:     	movss	0x4e0(%rsi), %xmm2
1459452d1:     	addss	%xmm2, %xmm7
1459452d5:     	movaps	%xmm7, %xmm1
1459452d8:     	minss	%xmm6, %xmm1
1459452dc:     	movaps	%xmm1, %xmm0
1459452df:     	cmpunordss	%xmm1, %xmm0
1459452e4:     	andps	%xmm0, %xmm7
1459452e7:     	andnps	%xmm1, %xmm0
1459452ea:     	orps	%xmm7, %xmm0
1459452ed:     	movss	%xmm0, 0x4e0(%rsi)
1459452f5:     	movaps	%xmm0, %xmm1
1459452f8:     	subss	%xmm2, %xmm1
1459452fc:     	xorps	%xmm7, %xmm7
1459452ff:     	ucomiss	%xmm1, %xmm7
145945302:     	jae	0x14594536c <.text+0x594436c>
145945304:     	testq	%rax, %rax
145945307:     	cmoveq	%rbx, %rdx
14594530b:     	cmovneq	%rax, %rdi
14594530f:     	movq	$-0x1, 0x28(%rbp)
145945317:     	movq	%rdi, 0x30(%rbp)
14594531b:     	movq	%rdx, 0x38(%rbp)
14594531f:     	leaq	0x1534ab5(%rip), %rax   # 0x146e79ddb
145945326:     	movq	%rax, 0x40(%rbp)
14594532a:     	movq	$0xf, 0x48(%rbp)
145945332:     	movb	$0x0, 0x50(%rbp)
145945336:     	leaq	0x678(%rsi), %rcx
14594533d:     	xorps	%xmm2, %xmm2
145945340:     	cvtss2sd	%xmm1, %xmm2
145945344:     	movq	$0x0, 0x20(%rsp)
14594534d:     	leaq	0x28(%rbp), %rdx
145945351:     	movl	$0x8, %r9d
145945357:     	callq	0x14595f3c0 <.text+0x595e3c0>
14594535c:     	movss	0x478(%rsi), %xmm6
145945364:     	movss	0x4e0(%rsi), %xmm0
14594536c:     	maxss	%xmm7, %xmm0
145945370:     	callq	0x145bc981d <.text+0x5bc881d>
145945375:     	cvttss2si	%xmm0, %rbx
14594537a:     	xorl	%r14d, %r14d
14594537d:     	ucomiss	%xmm7, %xmm0
145945380:     	cmovbl	%r14d, %ebx
145945384:     	movss	0x4284e7(%rip), %xmm8   # 0x145d6d874
14594538d:     	ucomiss	%xmm8, %xmm0
145945391:     	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
145945397:     	cmoval	%r15d, %ebx
14594539b:     	movaps	%xmm6, %xmm0
14594539e:     	callq	0x145bc981d <.text+0x5bc881d>
1459453a3:     	cvttss2si	%xmm0, %rdi
1459453a8:     	ucomiss	%xmm7, %xmm0
1459453ab:     	cmovbl	%r14d, %edi
1459453af:     	ucomiss	%xmm8, %xmm0
1459453b3:     	cmoval	%r15d, %edi
1459453b7:     	leaq	0x990(%rsi), %r14
1459453be:     	movq	0x990(%rsi), %rax
1459453c5:     	testq	%rax, %rax
1459453c8:     	je	0x145945702 <.text+0x5944702>
1459453ce:     	movq	0x998(%rsi), %rcx
1459453d5:     	movw	$0x16, %dx
1459453d9:     	movzwl	0x36(%rax), %r9d
1459453de:     	movl	%r9d, %r10d
1459453e1:     	addl	%r10d, %r10d
1459453e4:     	movq	$-0x1, %r8
1459453eb:     	nopl	(%rax,%rax)
1459453f0:     	testq	%r10, %r10
1459453f3:     	je	0x14594541f <.text+0x594441f>
1459453f5:     	cmpw	0x3a(%rax,%r8,2), %dx
1459453fb:     	seta	%r11b
1459453ff:     	sbbb	$0x0, %r11b
145945403:     	incq	%r8
145945406:     	addq	$-0x2, %r10
14594540a:     	cmpb	$0x1, %r11b
14594540e:     	je	0x1459453f0 <.text+0x59443f0>
145945410:     	movzbl	%r11b, %r9d
145945414:     	testl	%r9d, %r9d
145945417:     	je	0x145945685 <.text+0x5944685>
14594541d:     	jmp	0x145945422 <.text+0x5944422>
14594541f:     	movq	%r9, %r8
145945422:     	subq	$0x1, %rcx
145945426:     	jb	0x145945704 <.text+0x5944704>
14594542c:     	movq	0x50(%rax,%r8,8), %rax
145945431:     	jmp	0x1459453d9 <.text+0x59443d9>
145945433:     	xorl	%ebx, %ebx
145945435:     	xorl	%eax, %eax
145945437:     	cmpl	$0x3, %edx
14594543a:     	sete	%al
14594543d:     	leaq	0x153328c(%rip), %rdx   # 0x146e786d0
145945444:     	addss	(%rdx,%rax,4), %xmm6
145945449:     	cmpq	(%rcx), %rbx
14594544c:     	jne	0x145945453 <.text+0x5944453>
14594544e:     	callq	0x145bfaf60 <.text+0x5bf9f60>
145945453:     	movq	0x378(%rsi), %rax
14594545a:     	leaq	(%rbx,%rbx,2), %rcx
14594545e:     	movl	$0x0, (%rax,%rcx,8)
145945465:     	movl	%edi, 0xc(%rax,%rcx,8)
145945469:     	movss	%xmm6, 0x10(%rax,%rcx,8)
14594546f:     	movl	$0x0, 0x14(%rax,%rcx,8)
145945477:     	incq	%rbx
14594547a:     	movq	%rbx, 0x380(%rsi)
145945481:     	movq	0x460(%rsi), %rdx
145945488:     	movq	%rdx, 0x10(%rbp)
14594548c:     	movl	$0x2, -0x40(%rbp)
145945493:     	movl	$0x0, (%rbp)
14594549a:     	movq	%rbp, %rax
14594549d:     	movq	%rax, 0x30(%rsp)
1459454a2:     	leaq	-0x40(%rbp), %rax
1459454a6:     	movq	%rax, 0x28(%rsp)
1459454ab:     	movq	$0x1, 0x20(%rsp)
1459454b4:     	leaq	0x28(%rbp), %rcx
1459454b8:     	leaq	0x10(%rbp), %r9
1459454bc:     	movl	%edi, %r8d
1459454bf:     	callq	0x1458b5100 <.text+0x58b4100>
1459454c4:     	movq	0x5e0(%rsi), %rdi
1459454cb:     	cmpq	0x5d0(%rsi), %rdi
1459454d2:     	jne	0x1459454e1 <.text+0x59444e1>
1459454d4:     	leaq	0x5d0(%rsi), %rcx
1459454db:     	callq	0x145bcb530 <.text+0x5bca530>
1459454e0:     	nop
1459454e1:     	movq	0x5d8(%rsi), %rax
1459454e8:     	movq	%rdi, %rcx
1459454eb:     	shlq	$0x5, %rcx
1459454ef:     	movups	0x28(%rbp), %xmm0
1459454f3:     	movups	0x38(%rbp), %xmm1
1459454f7:     	movups	%xmm1, 0x10(%rax,%rcx)
1459454fc:     	movups	%xmm0, (%rax,%rcx)
145945500:     	incq	%rdi
145945503:     	movq	%rdi, 0x5e0(%rsi)
14594550a:     	movq	%rsi, %rcx
14594550d:     	callq	0x1458f96f0 <.text+0x58f86f0>
145945512:     	movq	%rsi, %rcx
145945515:     	callq	0x1458f0ed0 <.text+0x58efed0>
14594551a:     	callq	0x140002200 <.text+0x1200>
14594551f:     	movl	$0x1, %ecx
145945524:     	movl	$0x1, %edx
145945529:     	callq	0x1400021c0 <.text+0x11c0>
14594552e:     	testq	%rax, %rax
145945531:     	je	0x1459458df <.text+0x59448df>
145945537:     	movb	$0x7b, (%rax)
14594553a:     	movq	$0x1, 0x28(%rbp)
145945542:     	movq	%rax, 0x30(%rbp)
145945546:     	movq	$0x1, 0x38(%rbp)
14594554e:     	movb	$0x1, 0x40(%rbp)
145945552:     	leaq	0x153480b(%rip), %rax   # 0x146e79d64
145945559:     	movq	%rax, 0x20(%rsp)
14594555e:     	movq	$0x5, 0x28(%rsp)
145945567:     	leaq	0x1533df4(%rip), %r8    # 0x146e79362
14594556e:     	leaq	-0x40(%rbp), %rcx
145945572:     	leaq	0x28(%rbp), %rdx
145945576:     	movl	$0x4, %r9d
14594557c:     	callq	0x1458d97b0 <.text+0x58d87b0>
145945581:     	leaq	-0x20(%rbp), %rax
145945585:     	movq	%rax, (%rbp)
145945589:     	leaq	-0x59434d0(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145945590:     	movq	%rax, 0x8(%rbp)
145945594:     	leaq	0x153484f(%rip), %rdx   # 0x146e79dea
14594559b:     	leaq	0x28(%rbp), %rcx
14594559f:     	movq	%rbp, %r8
1459455a2:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1459455a7:     	nop
1459455a8:     	movq	0x28(%rbp), %rax
1459455ac:     	movq	%rax, 0x18(%rbp)
1459455b0:     	movq	0x30(%rbp), %rcx
1459455b4:     	movq	0x38(%rbp), %rax
1459455b8:     	movq	%rax, 0x28(%rsp)
1459455bd:     	movq	%rcx, -0x8(%rbp)
1459455c1:     	movq	%rcx, 0x20(%rsp)
1459455c6:     	leaq	0x1533d91(%rip), %r8    # 0x146e7935e
1459455cd:     	leaq	0x28(%rbp), %rcx
1459455d1:     	leaq	-0x40(%rbp), %rdx
1459455d5:     	movl	$0x4, %r9d
1459455db:     	callq	0x1458d97b0 <.text+0x58d87b0>
1459455e0:     	nop
1459455e1:     	movq	0x28(%rbp), %rax
1459455e5:     	movq	0x38(%rbp), %rdi
1459455e9:     	cmpq	%rdi, %rax
1459455ec:     	je	0x1459458b4 <.text+0x59448b4>
1459455f2:     	movq	%rax, 0x20(%rbp)
1459455f6:     	movq	0x30(%rbp), %rax
1459455fa:     	movq	%rax, -0x10(%rbp)
1459455fe:     	movb	$0x7d, (%rax,%rdi)
145945602:     	movq	0x5f8(%rsi), %rbx
145945609:     	cmpq	0x5e8(%rsi), %rbx
145945610:     	jne	0x14594561f <.text+0x594461f>
145945612:     	leaq	0x5e8(%rsi), %rcx
145945619:     	callq	0x145bcb3e0 <.text+0x5bca3e0>
14594561e:     	nop
14594561f:     	incq	%rdi
145945622:     	movq	0x5f0(%rsi), %rax
145945629:     	leaq	(%rbx,%rbx,2), %rcx
14594562d:     	movq	0x20(%rbp), %rdx
145945631:     	movq	%rdx, (%rax,%rcx,8)
145945635:     	movq	-0x10(%rbp), %rdx
145945639:     	movq	%rdx, 0x8(%rax,%rcx,8)
14594563e:     	movq	%rdi, 0x10(%rax,%rcx,8)
145945643:     	incq	%rbx
145945646:     	movq	%rbx, 0x5f8(%rsi)
14594564d:     	movq	0x18(%rbp), %rdx
145945651:     	testq	%rdx, %rdx
145945654:     	je	0x145945665 <.text+0x5944665>
145945656:     	movl	$0x1, %r8d
14594565c:     	movq	-0x8(%rbp), %rcx
145945660:     	callq	0x1400021d0 <.text+0x11d0>
145945665:     	movaps	0x60(%rbp), %xmm6
145945669:     	movaps	0x70(%rbp), %xmm7
14594566d:     	movaps	0x80(%rbp), %xmm8
145945675:     	addq	$0x118, %rsp            # imm = 0x118
14594567c:     	popq	%rbx
14594567d:     	popq	%rdi
14594567e:     	popq	%rsi
14594567f:     	popq	%r14
145945681:     	popq	%r15
145945683:     	popq	%rbp
145945684:     	retq
145945685:     	movl	%ebx, 0x8(%rax,%r8,4)
14594568a:     	movq	(%r14), %rax
14594568d:     	testq	%rax, %rax
145945690:     	je	0x14594573c <.text+0x594473c>
145945696:     	movq	0x998(%rsi), %rcx
14594569d:     	movw	$0x1c, %dx
1459456a1:     	movzwl	0x36(%rax), %r9d
1459456a6:     	movl	%r9d, %r10d
1459456a9:     	addl	%r10d, %r10d
1459456ac:     	movq	$-0x1, %r8
1459456b3:     	nopw	%cs:(%rax,%rax)
1459456c0:     	testq	%r10, %r10
1459456c3:     	je	0x1459456eb <.text+0x59446eb>
1459456c5:     	cmpw	0x3a(%rax,%r8,2), %dx
1459456cb:     	seta	%r11b
1459456cf:     	sbbb	$0x0, %r11b
1459456d3:     	incq	%r8
1459456d6:     	addq	$-0x2, %r10
1459456da:     	cmpb	$0x1, %r11b
1459456de:     	je	0x1459456c0 <.text+0x59446c0>
1459456e0:     	movzbl	%r11b, %r9d
1459456e4:     	testl	%r9d, %r9d
1459456e7:     	je	0x1459456fb <.text+0x59446fb>
1459456e9:     	jmp	0x1459456ee <.text+0x59446ee>
1459456eb:     	movq	%r9, %r8
1459456ee:     	subq	$0x1, %rcx
1459456f2:     	jb	0x14594573e <.text+0x594473e>
1459456f4:     	movq	0x50(%rax,%r8,8), %rax
1459456f9:     	jmp	0x1459456a1 <.text+0x59446a1>
1459456fb:     	movl	%edi, 0x8(%rax,%r8,4)
145945700:     	jmp	0x14594576a <.text+0x594476a>
145945702:     	xorl	%eax, %eax
145945704:     	movq	%r14, 0x28(%rbp)
145945708:     	movq	%rax, 0x30(%rbp)
14594570c:     	movq	$0x0, 0x38(%rbp)
145945714:     	movq	%r8, 0x40(%rbp)
145945718:     	movq	$0x16, 0x48(%rbp)
145945720:     	leaq	-0x40(%rbp), %rcx
145945724:     	leaq	0x28(%rbp), %rdx
145945728:     	movl	%ebx, %r8d
14594572b:     	callq	0x1458e1710 <.text+0x58e0710>
145945730:     	movq	(%r14), %rax
145945733:     	testq	%rax, %rax
145945736:     	jne	0x145945696 <.text+0x5944696>
14594573c:     	xorl	%eax, %eax
14594573e:     	movq	%r14, 0x28(%rbp)
145945742:     	movq	%rax, 0x30(%rbp)
145945746:     	movq	$0x0, 0x38(%rbp)
14594574e:     	movq	%r8, 0x40(%rbp)
145945752:     	movq	$0x1c, 0x48(%rbp)
14594575a:     	leaq	-0x40(%rbp), %rcx
14594575e:     	leaq	0x28(%rbp), %rdx
145945762:     	movl	%edi, %r8d
145945765:     	callq	0x1458e1710 <.text+0x58e0710>
14594576a:     	movq	0x460(%rsi), %rdx
145945771:     	movq	%rdx, 0x10(%rbp)
145945775:     	movl	$0x2, -0x40(%rbp)
14594577c:     	movl	$0x0, (%rbp)
145945783:     	movq	%rbp, %rax
145945786:     	movq	%rax, 0x30(%rsp)
14594578b:     	leaq	-0x40(%rbp), %rax
14594578f:     	movq	%rax, 0x28(%rsp)
145945794:     	movq	$0x1, 0x20(%rsp)
14594579d:     	leaq	0x28(%rbp), %rcx
1459457a1:     	leaq	0x10(%rbp), %r9
1459457a5:     	movl	$0x5bc5, %r8d           # imm = 0x5BC5
1459457ab:     	callq	0x1458b5100 <.text+0x58b4100>
1459457b0:     	movq	0x5e0(%rsi), %rdi
1459457b7:     	cmpq	0x5d0(%rsi), %rdi
1459457be:     	jne	0x1459457cd <.text+0x59447cd>
1459457c0:     	leaq	0x5d0(%rsi), %rcx
1459457c7:     	callq	0x145bcb530 <.text+0x5bca530>
1459457cc:     	nop
1459457cd:     	movq	0x5d8(%rsi), %rax
1459457d4:     	movq	%rdi, %rcx
1459457d7:     	shlq	$0x5, %rcx
1459457db:     	movups	0x28(%rbp), %xmm0
1459457df:     	movups	0x38(%rbp), %xmm1
1459457e3:     	movups	%xmm1, 0x10(%rax,%rcx)
1459457e8:     	movups	%xmm0, (%rax,%rcx)
1459457ec:     	incq	%rdi
1459457ef:     	movq	%rdi, 0x5e0(%rsi)
1459457f6:     	jmp	0x14594551a <.text+0x594451a>
1459457fb:     	leaq	0x1(%r8), %r11
1459457ff:     	cmpq	%rbx, %r11
145945802:     	jae	0x145945842 <.text+0x5944842>
145945804:     	leaq	-0x2(%rbx), %r10
145945808:     	leal	(%rbx,%r8), %r15d
14594580c:     	movq	%r8, %r14
14594580f:     	testb	$0x1, %r15b
145945813:     	jne	0x14594583a <.text+0x594483a>
145945815:     	movq	%r8, %r14
145945818:     	cmpl	%edi, 0x24(%r9)
14594581c:     	je	0x145945836 <.text+0x5944836>
14594581e:     	leaq	0x18(%r9), %r11
145945822:     	movq	0x10(%r11), %r14
145945826:     	movq	%r14, 0x10(%r9)
14594582a:     	movups	(%r11), %xmm0
14594582e:     	movups	%xmm0, (%r9)
145945832:     	leaq	0x1(%r8), %r14
145945836:     	leaq	0x2(%r8), %r11
14594583a:     	cmpq	%r8, %r10
14594583d:     	movq	%r14, %r8
145945840:     	jne	0x145945851 <.text+0x5944851>
145945842:     	movq	%r8, 0x380(%rsi)
145945849:     	movq	%r8, %rbx
14594584c:     	jmp	0x145945435 <.text+0x5944435>
145945851:     	leaq	(%r11,%r11,2), %r8
145945855:     	leaq	(%rax,%r8,8), %r9
145945859:     	subq	%r11, %rbx
14594585c:     	movq	%r14, %r8
14594585f:     	jmp	0x14594586b <.text+0x594486b>
145945861:     	addq	$0x30, %r9
145945865:     	addq	$-0x2, %rbx
145945869:     	je	0x145945842 <.text+0x5944842>
14594586b:     	cmpl	%edi, 0xc(%r9)
14594586f:     	jne	0x145945879 <.text+0x5944879>
145945871:     	cmpl	%edi, 0x24(%r9)
145945875:     	je	0x145945861 <.text+0x5944861>
145945877:     	jmp	0x145945898 <.text+0x5944898>
145945879:     	leaq	(%r8,%r8,2), %r10
14594587d:     	movq	0x10(%r9), %r11
145945881:     	movq	%r11, 0x10(%rax,%r10,8)
145945886:     	movups	(%r9), %xmm0
14594588a:     	movups	%xmm0, (%rax,%r10,8)
14594588f:     	incq	%r8
145945892:     	cmpl	%edi, 0x24(%r9)
145945896:     	je	0x145945861 <.text+0x5944861>
145945898:     	leaq	(%r8,%r8,2), %r10
14594589c:     	movq	0x28(%r9), %r11
1459458a0:     	movq	%r11, 0x10(%rax,%r10,8)
1459458a5:     	movups	0x18(%r9), %xmm0
1459458aa:     	movups	%xmm0, (%rax,%r10,8)
1459458af:     	incq	%r8
1459458b2:     	jmp	0x145945861 <.text+0x5944861>
1459458b4:     	movq	$0x1, 0x20(%rsp)
1459458bd:     	leaq	0x28(%rbp), %rcx
1459458c1:     	movl	$0x1, %r8d
1459458c7:     	movl	$0x1, %r9d
1459458cd:     	movq	%rdi, %rdx
1459458d0:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459458d5:     	nop
1459458d6:     	movq	0x28(%rbp), %rax
1459458da:     	jmp	0x1459455f2 <.text+0x59445f2>
1459458df:     	movl	$0x1, %ecx
1459458e4:     	movl	$0x1, %edx
1459458e9:     	callq	0x145d6944b <.text+0x5d6844b>
1459458ee:     	ud2
