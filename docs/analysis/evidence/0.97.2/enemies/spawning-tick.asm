
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a701a:     	cmpb	$0x0, 0x95b(%r13)
1454a7022:     	jne	0x1454aa103 <.text+0x54a9103>
1454a7028:     	movss	0x8e4(%r13), %xmm0
1454a7031:     	divss	0x489ec7(%rip), %xmm0   # 0x145930f00
1454a7039:     	movss	%xmm0, 0x68(%rbp)
1454a703e:     	movq	0x210(%r13), %rcx
1454a7045:     	movq	0x218(%r13), %rdx
1454a704c:     	callq	0x14540e820 <.text+0x540d820>
1454a7051:     	imulq	$0xf0, %rax, %rax
1454a7058:     	movq	%rax, 0x338(%rbp)
1454a705f:     	leaq	0x126f3d2(%rip), %r12   # 0x146716438
1454a7066:     	movsd	0x3e8(%r13), %xmm8
1454a706f:     	movl	0x3f0(%r13), %edi
1454a7076:     	xorps	%xmm0, %xmm0
1454a7079:     	ucomiss	%xmm0, %xmm6
1454a707c:     	jbe	0x1454a70e7 <.text+0x54a60e7>
1454a707e:     	movsd	0x918(%r13), %xmm0
1454a7087:     	movaps	%xmm8, %xmm7
1454a708b:     	subps	%xmm0, %xmm7
1454a708e:     	movsldup	%xmm6, %xmm0            # xmm0 = xmm6[0,0,2,2]
1454a7092:     	divps	%xmm0, %xmm7
1454a7095:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1454a7099:     	movaps	%xmm7, %xmm0
1454a709c:     	callq	0x145756e67 <.text+0x5755e67>
1454a70a1:     	movss	0x44f5d7(%rip), %xmm1   # 0x1458f6680
1454a70a9:     	ucomiss	%xmm0, %xmm1
1454a70ac:     	jbe	0x1454a70e7 <.text+0x54a60e7>
1454a70ae:     	movaps	0x451e9b(%rip), %xmm0   # 0x1458f8f50
1454a70b5:     	xorps	%xmm6, %xmm0
1454a70b8:     	callq	0x145756e49 <.text+0x5755e49>
1454a70bd:     	movss	0x4443bb(%rip), %xmm1   # 0x1458eb480
1454a70c5:     	subss	%xmm0, %xmm1
1454a70c9:     	movsd	0x8a8(%r13), %xmm0
1454a70d2:     	subps	%xmm0, %xmm7
1454a70d5:     	movsldup	%xmm1, %xmm1            # xmm1 = xmm1[0,0,2,2]
1454a70d9:     	mulps	%xmm7, %xmm1
1454a70dc:     	addps	%xmm0, %xmm1
1454a70df:     	movlps	%xmm1, 0x8a8(%r13)
1454a70e7:     	addq	%r12, 0x338(%rbp)
1454a70ee:     	movlps	%xmm8, 0x918(%r13)
1454a70f6:     	movl	%edi, 0x920(%r13)
1454a70fd:     	movss	0x8e4(%r13), %xmm0
1454a7106:     	movss	%xmm0, 0x210(%rbp)
1454a710e:     	movq	0x2a0(%rbp), %rcx
1454a7115:     	movl	0x8(%rcx), %eax
1454a7118:     	movl	%eax, 0x2b8(%rbp)
1454a711e:     	movq	(%rcx), %rax
1454a7121:     	movq	%rax, 0x2b0(%rbp)
1454a7128:     	movq	0x4c8(%r13), %rax
1454a712f:     	imulq	$0x160, 0x4d0(%r13), %rcx # imm = 0x160
1454a713a:     	addq	%rax, %rcx
1454a713d:     	movq	%rax, 0xa0(%rbp)
1454a7144:     	movq	%rcx, 0xa8(%rbp)
1454a714b:     	leaq	0x210(%rbp), %rax
1454a7152:     	movq	%rax, 0xb0(%rbp)
1454a7159:     	leaq	0x2b0(%rbp), %rax
1454a7160:     	movq	%rax, 0xb8(%rbp)
1454a7167:     	movq	$0x4, 0xc0(%rbp)
1454a7172:     	leaq	0x230(%rbp), %rcx
1454a7179:     	leaq	0xa0(%rbp), %rbx
1454a7180:     	movq	%rbx, %rdx
1454a7183:     	callq	0x145531cb0 <.text+0x5530cb0>
1454a7188:     	movq	0x230(%rbp), %rax
1454a718f:     	movq	%rax, 0x358(%rbp)
1454a7196:     	movq	0x238(%rbp), %r15
1454a719d:     	movq	0x240(%rbp), %rax
1454a71a4:     	leaq	(%r15,%rax,8), %rdi
1454a71a8:     	leaq	0x2d8(%rbp), %rsi
1454a71af:     	movss	0x497368(%rip), %xmm12  # 0x14593e520
1454a71b8:     	movss	0x463d07(%rip), %xmm8   # 0x14590aec8
1454a71c1:     	movq	%r15, 0x348(%rbp)
1454a71c8:     	movss	0x44f45b(%rip), %xmm9   # 0x1458f662c
1454a71d1:     	movss	0x4442a6(%rip), %xmm10  # 0x1458eb480
1454a71da:     	jmp	0x1454a7212 <.text+0x54a6212>
1454a71dc:     	nopl	(%rax)
1454a71e0:     	movq	0x540(%r13), %rax
1454a71e7:     	movq	%rsi, %rcx
1454a71ea:     	shlq	$0x5, %rcx
1454a71ee:     	movups	0xa0(%rbp), %xmm0
1454a71f5:     	movups	0xb0(%rbp), %xmm1
1454a71fc:     	movups	%xmm1, 0x10(%rax,%rcx)
1454a7201:     	movups	%xmm0, (%rax,%rcx)
1454a7205:     	incq	%rsi
1454a7208:     	movq	%rsi, 0x548(%r13)
1454a720f:     	movq	%r14, %rsi
1454a7212:     	cmpq	%rdi, %r15
1454a7215:     	je	0x1454a7317 <.text+0x54a6317>
1454a721b:     	movq	(%r15), %r14
1454a721e:     	movl	$0x3f800000, 0x20(%rsp) # imm = 0x3F800000
1454a7226:     	movq	%rsi, %rcx
1454a7229:     	movq	%r13, %rdx
1454a722c:     	movaps	%xmm12, %xmm2
1454a7230:     	movaps	%xmm8, %xmm3
1454a7234:     	callq	0x1454c17b0 <.text+0x54c07b0>
1454a7239:     	nop
1454a723a:     	addq	$0x8, %r15
1454a723e:     	movq	0x4c8(%r13), %rax
1454a7245:     	imulq	$0x160, 0x4d0(%r13), %rdx # imm = 0x160
1454a7250:     	xorl	%ecx, %ecx
1454a7252:     	movq	%rax, %r8
1454a7255:     	nopw	%cs:(%rax,%rax)
1454a7260:     	cmpq	%rcx, %rdx
1454a7263:     	je	0x1454a7212 <.text+0x54a6212>
1454a7265:     	addq	$0x160, %rcx            # imm = 0x160
1454a726c:     	cmpq	%r14, 0x88(%r8)
1454a7273:     	leaq	0x160(%r8), %r8
1454a727a:     	jne	0x1454a7260 <.text+0x54a6260>
1454a727c:     	movl	0x2e0(%rbp), %edx
1454a7282:     	movl	%edx, -0x4c(%rax,%rcx)
1454a7286:     	movq	0x2d8(%rbp), %rdx
1454a728d:     	movq	%rdx, -0x54(%rax,%rcx)
1454a7292:     	movq	0x2d8(%rbp), %rdx
1454a7299:     	movq	%rdx, -0x48(%rax,%rcx)
1454a729e:     	movl	0x2e0(%rbp), %edx
1454a72a4:     	movl	%edx, -0x40(%rax,%rcx)
1454a72a8:     	movss	0x210(%rbp), %xmm0
1454a72b0:     	movss	0x210(%rbp), %xmm1
1454a72b8:     	movlps	%xmm1, -0x3c(%rax,%rcx)
1454a72bd:     	movss	%xmm0, -0x34(%rax,%rcx)
1454a72c3:     	movl	$0x0, -0xf0(%rax,%rcx)
1454a72ce:     	movl	0x908(%r13), %r9d
1454a72d5:     	incl	%r9d
1454a72d8:     	movl	%r9d, 0x908(%r13)
1454a72df:     	movq	%rbx, %rcx
1454a72e2:     	movq	%r14, %rdx
1454a72e5:     	movq	%rsi, %r8
1454a72e8:     	callq	0x1454451b0 <.text+0x54441b0>
1454a72ed:     	nop
1454a72ee:     	movq	%rsi, %r14
1454a72f1:     	movq	0x548(%r13), %rsi
1454a72f8:     	cmpq	0x538(%r13), %rsi
1454a72ff:     	jne	0x1454a71e0 <.text+0x54a61e0>
1454a7305:     	movq	0x340(%rbp), %rcx
1454a730c:     	callq	0x1457580b0 <.text+0x57570b0>
1454a7311:     	nop
1454a7312:     	jmp	0x1454a71e0 <.text+0x54a61e0>
1454a7317:     	movq	0x358(%rbp), %rdx
1454a731e:     	testq	%rdx, %rdx
1454a7321:     	je	0x1454a7339 <.text+0x54a6339>
1454a7323:     	shlq	$0x3, %rdx
1454a7327:     	movl	$0x8, %r8d
1454a732d:     	movq	0x348(%rbp), %rcx
1454a7334:     	callq	0x1400021d0 <.text+0x11d0>
1454a7339:     	movaps	%xmm6, %xmm0
1454a733c:     	divss	0x451c54(%rip), %xmm0   # 0x1458f8f98
1454a7344:     	callq	0x145756e49 <.text+0x5755e49>
1454a7349:     	mulss	0x910(%r13), %xmm0
1454a7352:     	movss	%xmm0, 0x910(%r13)
1454a735b:     	movss	0x8e4(%r13), %xmm1
1454a7364:     	movzwl	0x230(%r13), %r8d
1454a736c:     	movq	0x4c8(%r13), %rax
1454a7373:     	movq	0x4d0(%r13), %rdx
1454a737a:     	imulq	$0x160, %rdx, %rcx      # imm = 0x160
1454a7381:     	addq	%rax, %rcx
1454a7384:     	testq	%rdx, %rdx
1454a7387:     	je	0x1454a73dd <.text+0x54a63dd>
1454a7389:     	movss	0x4440ee(%rip), %xmm10  # 0x1458eb480
1454a7392:     	movss	0x463aaa(%rip), %xmm2   # 0x14590ae44
1454a739a:     	movss	0x44416e(%rip), %xmm3   # 0x1458eb510
1454a73a2:     	movq	%rax, %r9
1454a73a5:     	jmp	0x1454a73bc <.text+0x54a63bc>
1454a73a7:     	minss	%xmm4, %xmm10
1454a73ac:     	nopl	(%rax)
1454a73b0:     	addq	$0x160, %r9             # imm = 0x160
1454a73b7:     	cmpq	%rcx, %r9
1454a73ba:     	je	0x1454a73dd <.text+0x54a63dd>
1454a73bc:     	cmpb	$0x0, 0x68(%r9)
1454a73c1:     	jne	0x1454a73b0 <.text+0x54a63b0>
1454a73c3:     	cmpq	$-0x1, 0x18(%r9)
1454a73c8:     	je	0x1454a73b0 <.text+0x54a63b0>
1454a73ca:     	movq	0x30(%r9), %r10
1454a73ce:     	cmpb	$0x0, 0x54(%r10)
1454a73d3:     	movaps	%xmm2, %xmm4
1454a73d6:     	jne	0x1454a73a7 <.text+0x54a63a7>
1454a73d8:     	movaps	%xmm3, %xmm4
1454a73db:     	jmp	0x1454a73a7 <.text+0x54a63a7>
1454a73dd:     	movaps	%xmm1, %xmm2
1454a73e0:     	divss	0x489b18(%rip), %xmm2   # 0x145930f00
1454a73e8:     	movss	0x455990(%rip), %xmm3   # 0x1458fcd80
1454a73f0:     	mulss	%xmm2, %xmm3
1454a73f4:     	addss	0x444118(%rip), %xmm3   # 0x1458eb514
1454a73fc:     	movss	0x52fecc(%rip), %xmm4   # 0x1459d72d0
1454a7404:     	mulss	%xmm2, %xmm4
1454a7408:     	mulss	%xmm2, %xmm4
1454a740c:     	addss	%xmm3, %xmm4
1454a7410:     	movzwl	%r8w, %r8d
1454a7414:     	xorps	%xmm2, %xmm2
1454a7417:     	cvtsi2ss	%r8d, %xmm2
1454a741c:     	mulss	0x444100(%rip), %xmm4   # 0x1458eb524
1454a7424:     	divss	0x444100(%rip), %xmm2   # 0x1458eb52c
1454a742c:     	mulss	%xmm4, %xmm2
1454a7430:     	mulss	%xmm2, %xmm10
1454a7435:     	movzbl	0x952(%r13), %r8d
1454a743d:     	cmpb	$0x1, %r8b
1454a7441:     	jne	0x1454a7487 <.text+0x54a6487>
1454a7443:     	cmpl	$0x1, 0x858(%r13)
1454a744b:     	jne	0x1454a747a <.text+0x54a647a>
1454a744d:     	movaps	%xmm1, %xmm3
1454a7450:     	subss	0x85c(%r13), %xmm3
1454a7459:     	divss	0x489a9f(%rip), %xmm3   # 0x145930f00
1454a7461:     	xorps	%xmm4, %xmm4
1454a7464:     	maxss	%xmm4, %xmm3
1454a7468:     	mulss	0x44f1b0(%rip), %xmm3   # 0x1458f6620
1454a7470:     	addss	0x4557c0(%rip), %xmm3   # 0x1458fcc38
1454a7478:     	jmp	0x1454a7482 <.text+0x54a6482>
1454a747a:     	movss	0x4557b6(%rip), %xmm3   # 0x1458fcc38
1454a7482:     	mulss	%xmm3, %xmm10
1454a7487:     	movss	0x443ff1(%rip), %xmm3   # 0x1458eb480
1454a748f:     	testq	%rdx, %rdx
1454a7492:     	je	0x1454a74da <.text+0x54a64da>
1454a7494:     	movss	0x4639a8(%rip), %xmm4   # 0x14590ae44
1454a749c:     	movss	0x44406c(%rip), %xmm5   # 0x1458eb510
1454a74a4:     	jmp	0x1454a74bb <.text+0x54a64bb>
1454a74a6:     	minss	%xmm7, %xmm3
1454a74aa:     	nopw	(%rax,%rax)
1454a74b0:     	addq	$0x160, %rax            # imm = 0x160
1454a74b6:     	cmpq	%rcx, %rax
1454a74b9:     	je	0x1454a74da <.text+0x54a64da>
1454a74bb:     	cmpb	$0x0, 0x68(%rax)
1454a74bf:     	jne	0x1454a74b0 <.text+0x54a64b0>
1454a74c1:     	cmpq	$-0x1, 0x18(%rax)
1454a74c6:     	je	0x1454a74b0 <.text+0x54a64b0>
1454a74c8:     	movq	0x30(%rax), %rdx
1454a74cc:     	cmpb	$0x0, 0x54(%rdx)
1454a74d0:     	movaps	%xmm4, %xmm7
1454a74d3:     	jne	0x1454a74a6 <.text+0x54a64a6>
1454a74d5:     	movaps	%xmm5, %xmm7
1454a74d8:     	jmp	0x1454a74a6 <.text+0x54a64a6>
1454a74da:     	mulss	%xmm3, %xmm2
1454a74de:     	testb	%r8b, %r8b
1454a74e1:     	je	0x1454a7523 <.text+0x54a6523>
1454a74e3:     	cmpl	$0x1, 0x858(%r13)
1454a74eb:     	jne	0x1454a7517 <.text+0x54a6517>
1454a74ed:     	subss	0x85c(%r13), %xmm1
1454a74f6:     	divss	0x489a02(%rip), %xmm1   # 0x145930f00
1454a74fe:     	xorps	%xmm3, %xmm3
1454a7501:     	maxss	%xmm3, %xmm1
1454a7505:     	mulss	0x44f113(%rip), %xmm1   # 0x1458f6620
1454a750d:     	addss	0x455723(%rip), %xmm1   # 0x1458fcc38
1454a7515:     	jmp	0x1454a751f <.text+0x54a651f>
1454a7517:     	movss	0x455719(%rip), %xmm1   # 0x1458fcc38
1454a751f:     	mulss	%xmm1, %xmm2
1454a7523:     	divss	0x443fd5(%rip), %xmm0   # 0x1458eb500
1454a752b:     	mulss	0x54ffa1(%rip), %xmm0   # 0x1459f74d4
1454a7533:     	maxss	0x44f14d(%rip), %xmm2   # 0x1458f6688
1454a753b:     	divss	%xmm2, %xmm0
1454a753f:     	movss	0x443f38(%rip), %xmm8   # 0x1458eb480
1454a7548:     	movaps	%xmm8, %xmm1
1454a754c:     	maxss	%xmm0, %xmm1
1454a7550:     	movaps	%xmm9, %xmm0
1454a7554:     	minss	%xmm1, %xmm0
1454a7558:     	mulss	%xmm0, %xmm10
1454a755d:     	mulss	%xmm10, %xmm6
1454a7562:     	addss	0x90c(%r13), %xmm6
1454a756b:     	movss	%xmm6, 0x90c(%r13)
1454a7574:     	movq	0x338(%rbp), %rax
1454a757b:     	movq	0x78(%rax), %rdi
1454a757f:     	movq	0x80(%rax), %rax
1454a7586:     	movq	%rax, 0x348(%rbp)
1454a758d:     	leaq	(%rax,%rax,4), %rax
1454a7591:     	shlq	$0x4, %rax
1454a7595:     	addq	%rdi, %rax
1454a7598:     	movq	%rdi, 0xa0(%rbp)
1454a759f:     	movq	%rax, 0x318(%rbp)
1454a75a6:     	movq	%rax, 0xa8(%rbp)
1454a75ad:     	movq	$0x0, 0xb0(%rbp)
1454a75b8:     	leaq	0x68(%rbp), %rax
1454a75bc:     	movq	%rax, 0xb8(%rbp)
1454a75c3:     	leaq	0x2b0(%rbp), %rcx
1454a75ca:     	leaq	0xa0(%rbp), %rbx
1454a75d1:     	movq	%rbx, %rdx
1454a75d4:     	callq	0x14552ef30 <.text+0x552df30>
1454a75d9:     	movss	0x90c(%r13), %xmm0
1454a75e2:     	movq	0x2b8(%rbp), %rax
1454a75e9:     	movq	%rax, 0x358(%rbp)
1454a75f0:     	movq	0x2c0(%rbp), %r14
1454a75f7:     	xorl	%r13d, %r13d
1454a75fa:     	movq	0x368(%rbp), %rsi
1454a7601:     	ucomiss	%xmm8, %xmm0
1454a7605:     	jb	0x1454a76c6 <.text+0x54a66c6>
1454a760b:     	nopl	(%rax,%rax)
1454a7610:     	cmpl	$0x8, %r13d
1454a7614:     	jae	0x1454a76c6 <.text+0x54a66c6>
1454a761a:     	movss	0x68(%rbp), %xmm3
1454a761f:     	movq	0x368(%rbp), %rcx
1454a7626:     	movq	0x358(%rbp), %rdx
1454a762d:     	movq	%r14, %r8
1454a7630:     	callq	0x1454beef0 <.text+0x54bdef0>
1454a7635:     	nop
1454a7636:     	cmpq	0x348(%rbp), %rax
1454a763d:     	jae	0x1454aab4f <.text+0x54a9b4f>
1454a7643:     	leaq	(%rax,%rax,4), %rcx
1454a7647:     	shlq	$0x4, %rcx
1454a764b:     	movss	0x44(%rdi,%rcx), %xmm6
1454a7651:     	movq	0x368(%rbp), %rcx
1454a7658:     	ucomiss	0x90c(%rcx), %xmm6
1454a765f:     	ja	0x1454a76c6 <.text+0x54a66c6>
1454a7661:     	movl	$0x0, 0xa0(%rbp)
1454a766b:     	movq	%rsi, %rcx
1454a766e:     	movq	%rax, %rdx
1454a7671:     	movq	%rbx, %r8
1454a7674:     	callq	0x1454c2040 <.text+0x54c1040>
1454a7679:     	nop
1454a767a:     	movss	0x90c(%rsi), %xmm0
1454a7682:     	cmpq	$0x1, %rax
1454a7686:     	jne	0x1454a76a3 <.text+0x54a66a3>
1454a7688:     	incl	%r13d
1454a768b:     	subss	%xmm6, %xmm0
1454a768f:     	movss	%xmm0, 0x90c(%rsi)
1454a7697:     	ucomiss	%xmm8, %xmm0
1454a769b:     	jae	0x1454a7610 <.text+0x54a6610>
1454a76a1:     	jmp	0x1454a76c6 <.text+0x54a66c6>
1454a76a3:     	movaps	%xmm0, %xmm1
1454a76a6:     	minss	%xmm6, %xmm1
1454a76aa:     	movaps	%xmm1, %xmm2
1454a76ad:     	cmpunordss	%xmm1, %xmm2
1454a76b2:     	movaps	%xmm2, %xmm3
1454a76b5:     	andnps	%xmm1, %xmm3
1454a76b8:     	andps	%xmm0, %xmm2
1454a76bb:     	orps	%xmm3, %xmm2
1454a76be:     	movss	%xmm2, 0x90c(%rsi)
1454a76c6:     	movq	0x368(%rbp), %rcx
1454a76cd:     	movzwl	0x230(%rcx), %eax
1454a76d4:     	xorps	%xmm0, %xmm0
1454a76d7:     	cvtsi2ss	%eax, %xmm0
1454a76db:     	divss	0x443e49(%rip), %xmm0   # 0x1458eb52c
1454a76e3:     	movss	0x68(%rbp), %xmm1
1454a76e8:     	movq	0x4d0(%rcx), %rdx
1454a76ef:     	testq	%rdx, %rdx
1454a76f2:     	je	0x1454a7723 <.text+0x54a6723>
1454a76f4:     	movq	0x4c8(%rcx), %rcx
1454a76fb:     	imulq	$0x160, %rdx, %rax      # imm = 0x160
1454a7702:     	addq	%rcx, %rax
1454a7705:     	movss	0x443d72(%rip), %xmm8   # 0x1458eb480
1454a770e:     	movss	0x46372e(%rip), %xmm2   # 0x14590ae44
1454a7716:     	movss	0x443df2(%rip), %xmm3   # 0x1458eb510
1454a771e:     	movq	%rcx, %r8
1454a7721:     	jmp	0x1454a773c <.text+0x54a673c>
1454a7723:     	xorl	%eax, %eax
1454a7725:     	jmp	0x1454a780d <.text+0x54a680d>
1454a772a:     	minss	%xmm4, %xmm8
1454a772f:     	nop
1454a7730:     	addq	$0x160, %r8             # imm = 0x160
1454a7737:     	cmpq	%rax, %r8
1454a773a:     	je	0x1454a775d <.text+0x54a675d>
1454a773c:     	cmpb	$0x0, 0x68(%r8)
1454a7741:     	jne	0x1454a7730 <.text+0x54a6730>
1454a7743:     	cmpq	$-0x1, 0x18(%r8)
1454a7748:     	je	0x1454a7730 <.text+0x54a6730>
1454a774a:     	movq	0x30(%r8), %r9
1454a774e:     	cmpb	$0x0, 0x54(%r9)
1454a7753:     	movaps	%xmm2, %xmm4
1454a7756:     	jne	0x1454a772a <.text+0x54a672a>
1454a7758:     	movaps	%xmm3, %xmm4
1454a775b:     	jmp	0x1454a772a <.text+0x54a672a>
1454a775d:     	cmpq	$0x1, %rdx
1454a7761:     	jne	0x1454a776a <.text+0x54a676a>
1454a7763:     	xorl	%r8d, %r8d
1454a7766:     	xorl	%eax, %eax
1454a7768:     	jmp	0x1454a77e1 <.text+0x54a67e1>
1454a776a:     	movq	%rdx, %r9
1454a776d:     	andq	$-0x2, %r9
1454a7771:     	leaq	0x1f0(%rcx), %r10
1454a7778:     	xorl	%r8d, %r8d
1454a777b:     	xorl	%eax, %eax
1454a777d:     	jmp	0x1454a779e <.text+0x54a679e>
1454a777f:     	nop
1454a7780:     	movzbl	0x4c(%rsi), %esi
1454a7784:     	xorq	$0x1, %rsi
1454a7788:     	addq	%r11, %rax
1454a778b:     	addq	%rsi, %rax
1454a778e:     	addq	$0x2, %r8
1454a7792:     	addq	$0x2c0, %r10            # imm = 0x2C0
1454a7799:     	cmpq	%r8, %r9
1454a779c:     	je	0x1454a77dc <.text+0x54a67dc>
1454a779e:     	movq	-0x160(%r10), %r11
1454a77a5:     	testq	%r11, %r11
1454a77a8:     	sete	%bl
1454a77ab:     	orb	-0x188(%r10), %bl
1454a77b2:     	je	0x1454a77c0 <.text+0x54a67c0>
1454a77b4:     	xorl	%r11d, %r11d
1454a77b7:     	jmp	0x1454a77c9 <.text+0x54a67c9>
1454a77b9:     	nopl	(%rax)
1454a77c0:     	movzbl	0x4c(%r11), %r11d
1454a77c5:     	xorq	$0x1, %r11
1454a77c9:     	movq	(%r10), %rsi
1454a77cc:     	testq	%rsi, %rsi
1454a77cf:     	sete	%bl
1454a77d2:     	orb	-0x28(%r10), %bl
1454a77d6:     	je	0x1454a7780 <.text+0x54a6780>
1454a77d8:     	xorl	%esi, %esi
1454a77da:     	jmp	0x1454a7788 <.text+0x54a6788>
1454a77dc:     	testb	$0x1, %dl
1454a77df:     	je	0x1454a780d <.text+0x54a680d>
1454a77e1:     	imulq	$0x160, %r8, %r8        # imm = 0x160
1454a77e8:     	movq	0x90(%rcx,%r8), %rdx
1454a77f0:     	testq	%rdx, %rdx
1454a77f3:     	sete	%r9b
1454a77f7:     	orb	0x68(%rcx,%r8), %r9b
1454a77fc:     	je	0x1454a7802 <.text+0x54a6802>
1454a77fe:     	xorl	%ecx, %ecx
1454a7800:     	jmp	0x1454a780a <.text+0x54a680a>
1454a7802:     	movzbl	0x4c(%rdx), %ecx
1454a7806:     	xorq	$0x1, %rcx
1454a780a:     	addq	%rcx, %rax
1454a780d:     	mulss	0x127976b(%rip), %xmm1  # 0x146720f80
1454a7815:     	addss	0x443cdb(%rip), %xmm1   # 0x1458eb4f8
1454a781d:     	mulss	%xmm0, %xmm1
1454a7821:     	mulss	%xmm8, %xmm1
1454a7826:     	movss	0x46369a(%rip), %xmm2   # 0x14590aec8
1454a782e:     	mulss	%xmm0, %xmm2
1454a7832:     	movaps	%xmm1, %xmm3
1454a7835:     	minss	%xmm2, %xmm3
1454a7839:     	movaps	%xmm3, %xmm2
1454a783c:     	cmpunordss	%xmm3, %xmm2
1454a7841:     	andps	%xmm2, %xmm1
1454a7844:     	andnps	%xmm3, %xmm2
1454a7847:     	orps	%xmm1, %xmm2
1454a784a:     	cvttss2si	%xmm2, %rcx
1454a784f:     	movq	%rcx, %rdx
1454a7852:     	sarq	$0x3f, %rdx
1454a7856:     	movss	0x443982(%rip), %xmm7   # 0x1458eb1e0
1454a785e:     	movaps	%xmm2, %xmm1
1454a7861:     	subss	%xmm7, %xmm1
1454a7865:     	cvttss2si	%xmm1, %r13
1454a786a:     	andq	%rdx, %r13
1454a786d:     	orq	%rcx, %r13
1454a7870:     	xorl	%ebx, %ebx
1454a7872:     	xorps	%xmm6, %xmm6
1454a7875:     	ucomiss	%xmm6, %xmm2
1454a7878:     	cmovbq	%rbx, %r13
1454a787c:     	movss	0x44395f(%rip), %xmm8   # 0x1458eb1e4
1454a7885:     	ucomiss	%xmm8, %xmm2
1454a7889:     	movq	$-0x1, %rsi
1454a7890:     	cmovaq	%rsi, %r13
1454a7894:     	subq	%rax, %r13
1454a7897:     	cmovbq	%rbx, %r13
1454a789b:     	callq	0x145756e6d <.text+0x5755e6d>
1454a78a0:     	movaps	%xmm0, %xmm1
1454a78a3:     	subss	%xmm7, %xmm1
1454a78a7:     	cvttss2si	%xmm1, %rax
1454a78ac:     	cvttss2si	%xmm0, %rcx
1454a78b1:     	movq	%rcx, %rdx
1454a78b4:     	sarq	$0x3f, %rdx
1454a78b8:     	andq	%rax, %rdx
1454a78bb:     	orq	%rcx, %rdx
1454a78be:     	ucomiss	%xmm6, %xmm0
1454a78c1:     	cmovbq	%rbx, %rdx
1454a78c5:     	ucomiss	%xmm8, %xmm0
1454a78c9:     	cmovaq	%rsi, %rdx
1454a78cd:     	leaq	(%rdx,%rdx,2), %rax
1454a78d1:     	cmpq	%r13, %rax
1454a78d4:     	cmovbq	%rax, %r13
1454a78d8:     	testq	%r13, %r13
1454a78db:     	je	0x1454a792f <.text+0x54a692f>
1454a78dd:     	xorl	%r15d, %r15d
1454a78e0:     	leaq	0xa0(%rbp), %rbx
1454a78e7:     	movq	0x368(%rbp), %rsi
1454a78ee:     	nop
1454a78f0:     	movss	0x68(%rbp), %xmm3
1454a78f5:     	movq	%rsi, %rcx
1454a78f8:     	movq	0x358(%rbp), %rdx
1454a78ff:     	movq	%r14, %r8
1454a7902:     	callq	0x1454beef0 <.text+0x54bdef0>
1454a7907:     	nop
1454a7908:     	movl	$0x0, 0xa0(%rbp)
1454a7912:     	movq	%rsi, %rcx
1454a7915:     	movq	%rax, %rdx
1454a7918:     	movq	%rbx, %r8
1454a791b:     	callq	0x1454c2040 <.text+0x54c1040>
1454a7920:     	nop
1454a7921:     	cmpq	$0x1, %rax
1454a7925:     	jne	0x1454a792f <.text+0x54a692f>
1454a7927:     	incq	%r15
1454a792a:     	cmpq	%r13, %r15
1454a792d:     	jb	0x1454a78f0 <.text+0x54a68f0>
