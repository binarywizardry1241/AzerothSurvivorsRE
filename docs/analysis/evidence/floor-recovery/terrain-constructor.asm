
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145526fa0:     	pushq	%rbp
145526fa1:     	pushq	%r15
145526fa3:     	pushq	%r14
145526fa5:     	pushq	%r13
145526fa7:     	pushq	%r12
145526fa9:     	pushq	%rsi
145526faa:     	pushq	%rdi
145526fab:     	pushq	%rbx
145526fac:     	subq	$0x478, %rsp            # imm = 0x478
145526fb3:     	leaq	0x80(%rsp), %rbp
145526fbb:     	movaps	%xmm15, 0x3e0(%rbp)
145526fc3:     	movaps	%xmm14, 0x3d0(%rbp)
145526fcb:     	movaps	%xmm13, 0x3c0(%rbp)
145526fd3:     	movaps	%xmm12, 0x3b0(%rbp)
145526fdb:     	movaps	%xmm11, 0x3a0(%rbp)
145526fe3:     	movaps	%xmm10, 0x390(%rbp)
145526feb:     	movaps	%xmm9, 0x380(%rbp)
145526ff3:     	movaps	%xmm8, 0x370(%rbp)
145526ffb:     	movaps	%xmm7, 0x360(%rbp)
145527002:     	movaps	%xmm6, 0x350(%rbp)
145527009:     	movq	$-0x2, 0x348(%rbp)
145527014:     	movq	%r9, %rbx
145527017:     	movq	%r8, %rsi
14552701a:     	movq	%rdx, %rdi
14552701d:     	movq	%rcx, %r14
145527020:     	leaq	0x40(%rbp), %rcx
145527024:     	callq	0x1455d63c0 <.text+0x55d53c0>
145527029:     	movq	0x40(%rbp), %rax
14552702d:     	xorl	%r8d, %r8d
145527030:     	cmpq	$-0x1, %rax
145527034:     	movl	$0x1, %edx
145527039:     	cmovneq	0x48(%rbp), %rdx
14552703e:     	cmoveq	%r8, %rax
145527042:     	movq	%rax, 0x338(%rbp)
145527049:     	cmovneq	0x50(%rbp), %r8
14552704e:     	leaq	0x40(%rbp), %rcx
145527052:     	movq	%rdx, 0x2c0(%rbp)
145527059:     	callq	0x145687e90 <.text+0x5686e90>
14552705e:     	nop
14552705f:     	cmpq	$-0x1, 0x40(%rbp)
145527064:     	je	0x14552707e <.text+0x552607e>
145527066:     	movq	0x50(%rbp), %rax
14552706a:     	movq	%rax, 0x2b0(%rbp)
145527071:     	movups	0x40(%rbp), %xmm0
145527075:     	movaps	%xmm0, 0x2a0(%rbp)
14552707c:     	jmp	0x145527093 <.text+0x5526093>
14552707e:     	movq	$-0x1, 0x2a0(%rbp)
145527089:     	leaq	0x48(%rbp), %rcx
14552708d:     	callq	0x1456f8fa0 <.text+0x56f7fa0>
145527092:     	nop
145527093:     	movq	0x338(%rbp), %rdx
14552709a:     	testq	%rdx, %rdx
14552709d:     	je	0x1455270b1 <.text+0x55260b1>
14552709f:     	movl	$0x1, %r8d
1455270a5:     	movq	0x2c0(%rbp), %rcx
1455270ac:     	callq	0x1400021d0 <.text+0x11d0>
1455270b1:     	cmpq	$-0x1, 0x2a0(%rbp)
1455270b9:     	je	0x145527160 <.text+0x5526160>
1455270bf:     	movss	(%rbx), %xmm0
1455270c3:     	movss	0x4(%rbx), %xmm1
1455270c8:     	movss	%xmm1, 0x28(%rsp)
1455270ce:     	movss	%xmm0, 0x20(%rsp)
1455270d4:     	movl	$0x1, 0x30(%rsp)
1455270dc:     	leaq	0x40(%rbp), %rcx
1455270e0:     	leaq	0x2a0(%rbp), %rdx
1455270e7:     	movq	%rdi, %r8
1455270ea:     	movq	%rsi, %r9
1455270ed:     	callq	0x14568ed20 <.text+0x568dd20>
1455270f2:     	nop
1455270f3:     	movq	0x40(%rbp), %rax
1455270f7:     	cmpq	$-0x1, %rax
1455270fb:     	je	0x145527156 <.text+0x5526156>
1455270fd:     	movq	0x48(%rbp), %rcx
145527101:     	movq	0x50(%rbp), %rdx
145527105:     	leaq	(%rdx,%rdx,4), %rdx
145527109:     	shlq	$0x4, %rdx
14552710d:     	addq	%rcx, %rdx
145527110:     	movq	%rcx, 0x40(%rbp)
145527114:     	movq	%rcx, 0x48(%rbp)
145527118:     	movq	%rax, 0x50(%rbp)
14552711c:     	movq	%rdx, 0x58(%rbp)
145527120:     	leaq	0x150(%rbp), %rcx
145527127:     	leaq	0x40(%rbp), %rdx
14552712b:     	callq	0x145558a60 <.text+0x5557a60>
145527130:     	nop
145527131:     	movups	0x150(%rbp), %xmm0
145527138:     	movaps	%xmm0, 0x130(%rbp)
14552713f:     	movq	0x160(%rbp), %rax
145527146:     	movq	%rax, 0x140(%rbp)
14552714d:     	movq	0x138(%rbp), %rdx
145527154:     	jmp	0x145527188 <.text+0x5526188>
145527156:     	leaq	0x48(%rbp), %rcx
14552715a:     	callq	0x1456f8fa0 <.text+0x56f7fa0>
14552715f:     	nop
145527160:     	movq	$0x0, 0x130(%rbp)
14552716b:     	movq	$0x8, 0x138(%rbp)
145527176:     	movq	$0x0, 0x140(%rbp)
145527181:     	movl	$0x8, %edx
145527186:     	xorl	%eax, %eax
145527188:     	leaq	(%rax,%rax,8), %rax
14552718c:     	leaq	(%rdx,%rax,8), %r8
145527190:     	movb	$0x1, 0x337(%rbp)
145527197:     	leaq	-0x48(%rbp), %rcx
14552719b:     	callq	0x145542ce0 <.text+0x5541ce0>
1455271a0:     	nop
1455271a1:     	movq	0x140(%rbp), %rdi
1455271a8:     	movq	%rdi, 0x50(%rbp)
1455271ac:     	movaps	0x130(%rbp), %xmm0
1455271b3:     	movaps	%xmm0, 0x40(%rbp)
1455271b7:     	movss	0x8(%rbx), %xmm0
1455271bc:     	movups	-0x48(%rbp), %xmm1
1455271c0:     	movups	%xmm1, 0x58(%rbp)
1455271c4:     	movq	-0x38(%rbp), %rax
1455271c8:     	movq	%rax, 0x68(%rbp)
1455271cc:     	movq	$-0x1, 0x70(%rbp)
1455271d4:     	movss	%xmm0, 0xe8(%rbp)
1455271dc:     	movb	$0x0, 0xec(%rbp)
1455271e3:     	movq	$-0x1, 0x98(%rbp)
1455271ee:     	movq	$-0x1, 0xc0(%rbp)
1455271f9:     	cmpq	$-0x1, 0x2a0(%rbp)
145527201:     	je	0x14552728a <.text+0x552628a>
145527207:     	testq	%rdi, %rdi
14552720a:     	je	0x145528d98 <.text+0x5527d98>
145527210:     	movq	%r14, 0x120(%rbp)
145527217:     	movss	0x460(%rbp), %xmm7
14552721f:     	cmpq	$0x0, 0x468(%rbp)
145527227:     	je	0x1455272a1 <.text+0x55262a1>
145527229:     	movq	0x48(%rbp), %r14
14552722d:     	movss	%xmm7, 0x28(%rsp)
145527233:     	movq	%rbx, 0x20(%rsp)
145527238:     	leaq	0x150(%rbp), %rcx
14552723f:     	leaq	0x2a0(%rbp), %rdx
145527246:     	movq	%r14, %r8
145527249:     	movq	%rdi, %r9
14552724c:     	callq	0x14552b670 <.text+0x552a670>
145527251:     	nop
145527252:     	movq	0x470(%rbp), %rax
145527259:     	movq	%rax, 0x18(%rbp)
14552725d:     	leaq	0x98(%rbp), %rax
145527264:     	movq	0x170(%rbp), %rcx
14552726b:     	movq	%rcx, 0x20(%rax)
14552726f:     	movups	0x150(%rbp), %xmm0
145527276:     	movups	0x160(%rbp), %xmm1
14552727d:     	movups	%xmm1, 0x10(%rax)
145527281:     	movups	%xmm0, (%rax)
145527284:     	movsd	(%rbx), %xmm6
145527288:     	jmp	0x1455272a9 <.text+0x55262a9>
14552728a:     	leaq	0x40(%rbp), %rdx
14552728e:     	movl	$0xb0, %r8d
145527294:     	movq	%r14, %rcx
145527297:     	callq	0x1457731ed <.text+0x57721ed>
14552729c:     	jmp	0x145528e4b <.text+0x5527e4b>
1455272a1:     	movsd	(%rbx), %xmm6
1455272a5:     	movq	0x48(%rbp), %r14
1455272a9:     	movaps	%xmm7, %xmm0
1455272ac:     	addss	%xmm7, %xmm0
1455272b0:     	movaps	%xmm0, -0x30(%rbp)
1455272b4:     	callq	0x14577327d <.text+0x577227d>
1455272b9:     	cvttss2si	%xmm0, %rax
1455272be:     	movq	%rax, %rcx
1455272c1:     	sarq	$0x3f, %rcx
1455272c5:     	movaps	%xmm0, %xmm1
1455272c8:     	subss	0x3dff10(%rip), %xmm1   # 0x1459071e0
1455272d0:     	cvttss2si	%xmm1, %rdx
1455272d5:     	andq	%rcx, %rdx
1455272d8:     	orq	%rax, %rdx
1455272db:     	xorl	%r13d, %r13d
1455272de:     	xorps	%xmm1, %xmm1
1455272e1:     	ucomiss	%xmm1, %xmm0
1455272e4:     	cmovbq	%r13, %rdx
1455272e8:     	ucomiss	0x3dfef5(%rip), %xmm0   # 0x1459071e4
1455272ef:     	movq	$-0x1, %r15
1455272f6:     	cmovbeq	%rdx, %r15
1455272fa:     	movq	%r15, 0x338(%rbp)
145527301:     	imulq	%r15, %r15
145527305:     	leaq	(,%r15,4), %r12
14552730d:     	movq	%r15, %rax
145527310:     	shrq	$0x3e, %rax
145527314:     	setne	%al
145527317:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
145527321:     	cmpq	%rcx, %r12
145527324:     	seta	%cl
145527327:     	orb	%al, %cl
145527329:     	je	0x14552733c <.text+0x552633c>
14552732b:     	movq	%r13, %rcx
14552732e:     	movq	%r12, %rdx
145527331:     	callq	0x14590379b <.text+0x590279b>
145527336:     	nop
145527337:     	jmp	0x14552901f <.text+0x552801f>
14552733c:     	testq	%r12, %r12
14552733f:     	je	0x145527382 <.text+0x5526382>
145527341:     	callq	0x140002200 <.text+0x1200>
145527346:     	movl	$0x4, %r13d
14552734c:     	movl	$0x4, %edx
145527351:     	movq	%r12, %rcx
145527354:     	callq	0x1400021c0 <.text+0x11c0>
145527359:     	testq	%rax, %rax
14552735c:     	je	0x14552732b <.text+0x552632b>
14552735e:     	movq	%r15, %rcx
145527361:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
145527365:     	cmpq	$0x2, %r15
145527369:     	movq	%rcx, 0x128(%rbp)
145527370:     	jb	0x14552739a <.text+0x552639a>
145527372:     	cmpq	$0x9, %r15
145527376:     	jae	0x1455273a4 <.text+0x55263a4>
145527378:     	movl	$0x1, %ecx
14552737d:     	movq	%rax, %r10
145527380:     	jmp	0x1455273e9 <.text+0x55263e9>
145527382:     	movl	$0x4, %eax
145527387:     	xorl	%ecx, %ecx
145527389:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
14552738d:     	cmpq	$0x2, %r15
145527391:     	movq	%rcx, 0x128(%rbp)
145527398:     	jae	0x145527372 <.text+0x5526372>
14552739a:     	movq	%rax, %r10
14552739d:     	testq	%r15, %r15
1455273a0:     	jne	0x145527400 <.text+0x5526400>
1455273a2:     	jmp	0x145527407 <.text+0x5526407>
1455273a4:     	leaq	-0x1(%r15), %rdx
1455273a8:     	movq	%rdx, %r8
1455273ab:     	andq	$-0x8, %r8
1455273af:     	leaq	(%rax,%r8,4), %r10
1455273b3:     	leaq	0x1(%r8), %rcx
1455273b7:     	xorl	%r9d, %r9d
1455273ba:     	movaps	0x6c0a1f(%rip), %xmm1   # 0x145be7de0
1455273c1:     	nopw	%cs:(%rax,%rax)
1455273d0:     	movups	%xmm1, (%rax,%r9,4)
1455273d5:     	movups	%xmm1, 0x10(%rax,%r9,4)
1455273db:     	addq	$0x8, %r9
1455273df:     	cmpq	%r9, %r8
1455273e2:     	jne	0x1455273d0 <.text+0x55263d0>
1455273e4:     	cmpq	%r8, %rdx
1455273e7:     	je	0x145527400 <.text+0x5526400>
1455273e9:     	movq	%r15, %rdx
1455273ec:     	subq	%rcx, %rdx
1455273ef:     	nop
1455273f0:     	movl	$0x7fc00000, (%r10)     # imm = 0x7FC00000
1455273f7:     	addq	$0x4, %r10
1455273fb:     	decq	%rdx
1455273fe:     	jne	0x1455273f0 <.text+0x55263f0>
145527400:     	movl	$0x7fc00000, (%r10)     # imm = 0x7FC00000
145527407:     	movaps	%xmm6, %xmm1
14552740a:     	subps	%xmm0, %xmm1
14552740d:     	movaps	%xmm1, 0x2c0(%rbp)
145527414:     	movq	0xb0(%rbp), %r8
14552741b:     	testq	%r8, %r8
14552741e:     	movaps	%xmm6, 0x280(%rbp)
145527425:     	js	0x14552742e <.text+0x552642e>
145527427:     	cvtsi2ss	%r8, %xmm14
14552742c:     	jmp	0x145527447 <.text+0x5526447>
14552742e:     	movq	%r8, %rdx
145527431:     	shrq	%rdx
145527434:     	movl	%r8d, %ecx
145527437:     	andl	$0x1, %ecx
14552743a:     	orq	%rdx, %rcx
14552743d:     	cvtsi2ss	%rcx, %xmm14
145527442:     	addss	%xmm14, %xmm14
145527447:     	movq	0x98(%rbp), %rcx
14552744e:     	movq	%rcx, 0x318(%rbp)
145527455:     	movss	0xb8(%rbp), %xmm15
14552745e:     	movss	0xbc(%rbp), %xmm0
145527466:     	movss	%xmm0, 0x1f8(%rbp)
14552746e:     	movq	0xa8(%rbp), %rcx
145527475:     	movq	%rcx, 0x320(%rbp)
14552747c:     	movq	0xa0(%rbp), %rcx
145527483:     	movq	%rcx, 0x300(%rbp)
14552748a:     	movq	0x60(%rbp), %rsi
14552748e:     	movq	0x68(%rbp), %rcx
145527492:     	cmpq	%rdi, %rcx
145527495:     	movq	%rdi, 0x238(%rbp)
14552749c:     	movq	%rcx, 0x310(%rbp)
1455274a3:     	cmovbq	%rcx, %rdi
1455274a7:     	movshdup	0x2c0(%rbp), %xmm0      # xmm0 = mem[1,1,3,3]
1455274af:     	movaps	%xmm0, -0x20(%rbp)
1455274b3:     	xorps	%xmm10, %xmm10
1455274b7:     	movss	0x3dffd5(%rip), %xmm6   # 0x145907494
1455274bf:     	leaq	0x150(%rbp), %r13
1455274c6:     	xorl	%r12d, %r12d
1455274c9:     	movq	%rax, 0x308(%rbp)
1455274d0:     	movq	%r15, 0x298(%rbp)
1455274d7:     	movq	%r8, 0x30(%rbp)
1455274db:     	cmpq	0x338(%rbp), %r12
1455274e2:     	jae	0x1455278fc <.text+0x55268fc>
1455274e8:     	nopl	(%rax,%rax)
1455274f0:     	testq	%r12, %r12
1455274f3:     	js	0x145527500 <.text+0x5526500>
1455274f5:     	xorps	%xmm12, %xmm12
1455274f9:     	cvtsi2ss	%r12, %xmm12
1455274fe:     	jmp	0x14552751d <.text+0x552651d>
145527500:     	movq	%r12, %rdx
145527503:     	shrq	%rdx
145527506:     	movl	%r12d, %ecx
145527509:     	andl	$0x1, %ecx
14552750c:     	orq	%rdx, %rcx
14552750f:     	xorps	%xmm12, %xmm12
145527513:     	cvtsi2ss	%rcx, %xmm12
145527518:     	addss	%xmm12, %xmm12
14552751d:     	addss	0x3dff72(%rip), %xmm12  # 0x145907498
145527526:     	addss	-0x20(%rbp), %xmm12
14552752c:     	movaps	%xmm12, %xmm9
145527530:     	subss	0x1f8(%rbp), %xmm9
145527539:     	addss	%xmm9, %xmm9
14552753e:     	cvttss2si	%xmm9, %rdx
145527543:     	movq	%rdx, %rcx
145527546:     	sarq	$0x3f, %rcx
14552754a:     	movaps	%xmm9, %xmm0
14552754e:     	subss	0x3dfc8a(%rip), %xmm0   # 0x1459071e0
145527556:     	cvttss2si	%xmm0, %r9
14552755b:     	andq	%rcx, %r9
14552755e:     	orq	%rdx, %r9
145527561:     	ucomiss	%xmm10, %xmm9
145527565:     	movl	$0x0, %ecx
14552756a:     	cmovbq	%rcx, %r9
14552756e:     	ucomiss	0x3dfc6e(%rip), %xmm9   # 0x1459071e4
145527576:     	movq	$-0x1, %rcx
14552757d:     	cmovaq	%rcx, %r9
145527581:     	leaq	0x1(%r12), %rcx
145527586:     	movq	%rcx, 0x1f0(%rbp)
14552758d:     	imulq	%r8, %r9
145527591:     	movq	%r9, 0x328(%rbp)
145527598:     	imulq	0x338(%rbp), %r12
1455275a0:     	movaps	%xmm12, %xmm8
1455275a4:     	addss	0x423f73(%rip), %xmm8   # 0x14594b520
1455275ad:     	movaps	%xmm12, %xmm13
1455275b1:     	addss	0x180d226(%rip), %xmm13 # 0x146d347e0
1455275ba:     	xorl	%ebx, %ebx
1455275bc:     	cmpq	0x338(%rbp), %rbx
1455275c3:     	jae	0x1455278e4 <.text+0x55268e4>
1455275c9:     	nopl	(%rax)
1455275d0:     	testq	%rbx, %rbx
1455275d3:     	js	0x1455276d0 <.text+0x55266d0>
1455275d9:     	xorps	%xmm11, %xmm11
1455275dd:     	cvtsi2ss	%rbx, %xmm11
1455275e2:     	addss	0x3dfead(%rip), %xmm11  # 0x145907498
1455275eb:     	addss	0x2c0(%rbp), %xmm11
1455275f4:     	cmpq	$-0x1, 0x318(%rbp)
1455275fc:     	je	0x14552770c <.text+0x552670c>
145527602:     	ucomiss	%xmm9, %xmm10
145527606:     	movaps	%xmm6, %xmm0
145527609:     	ja	0x1455278c2 <.text+0x55268c2>
14552760f:     	subss	%xmm15, %xmm11
145527614:     	addss	%xmm11, %xmm11
145527619:     	ucomiss	%xmm11, %xmm10
14552761d:     	movaps	%xmm6, %xmm0
145527620:     	ja	0x1455278c2 <.text+0x55268c2>
145527626:     	ucomiss	%xmm14, %xmm9
14552762a:     	movaps	%xmm6, %xmm0
14552762d:     	jae	0x1455278c2 <.text+0x55268c2>
145527633:     	ucomiss	%xmm14, %xmm11
145527637:     	movaps	%xmm6, %xmm0
14552763a:     	jae	0x1455278c2 <.text+0x55268c2>
145527640:     	cvttss2si	%xmm11, %r8
145527645:     	movq	%r8, %rcx
145527648:     	sarq	$0x3f, %rcx
14552764c:     	movaps	%xmm11, %xmm0
145527650:     	subss	0x3dfb88(%rip), %xmm0   # 0x1459071e0
145527658:     	cvttss2si	%xmm0, %rdx
14552765d:     	andq	%rcx, %rdx
145527660:     	orq	%r8, %rdx
145527663:     	ucomiss	%xmm10, %xmm11
145527667:     	movl	$0x0, %ecx
14552766c:     	cmovaeq	%rdx, %rcx
145527670:     	ucomiss	0x3dfb6c(%rip), %xmm11  # 0x1459071e4
145527678:     	movq	$-0x1, %rdx
14552767f:     	cmovaq	%rdx, %rcx
145527683:     	addq	0x328(%rbp), %rcx
14552768a:     	cmpq	0x320(%rbp), %rcx
145527691:     	jae	0x145528f15 <.text+0x5527f15>
145527697:     	movq	0x300(%rbp), %rdx
14552769e:     	movss	(%rdx,%rcx,4), %xmm1
1455276a3:     	movaps	%xmm1, %xmm0
1455276a6:     	cmpordss	%xmm1, %xmm0
1455276ab:     	andps	%xmm0, %xmm1
1455276ae:     	movss	0x3dfdde(%rip), %xmm2   # 0x145907494
1455276b6:     	andnps	%xmm2, %xmm0
1455276b9:     	orps	%xmm1, %xmm0
1455276bc:     	jmp	0x1455278c2 <.text+0x55268c2>
1455276c1:     	nopw	%cs:(%rax,%rax)
1455276d0:     	movq	%rbx, %rdx
1455276d3:     	shrq	%rdx
1455276d6:     	movl	%ebx, %ecx
1455276d8:     	andl	$0x1, %ecx
1455276db:     	orq	%rdx, %rcx
1455276de:     	xorps	%xmm11, %xmm11
1455276e2:     	cvtsi2ss	%rcx, %xmm11
1455276e7:     	addss	%xmm11, %xmm11
1455276ec:     	addss	0x3dfda3(%rip), %xmm11  # 0x145907498
1455276f5:     	addss	0x2c0(%rbp), %xmm11
1455276fe:     	cmpq	$-0x1, 0x318(%rbp)
145527706:     	jne	0x145527602 <.text+0x5526602>
14552770c:     	movaps	%xmm6, %xmm0
14552770f:     	cmpq	$0x0, 0x310(%rbp)
145527717:     	je	0x1455278c2 <.text+0x55268c2>
14552771d:     	xorl	%r15d, %r15d
145527720:     	jmp	0x145527738 <.text+0x5526738>
145527722:     	nopw	%cs:(%rax,%rax)
145527730:     	incq	%r15
145527733:     	cmpq	%rdi, %r15
145527736:     	je	0x1455277a4 <.text+0x55267a4>
145527738:     	movq	%r15, %rax
14552773b:     	shlq	$0x4, %rax
14552773f:     	ucomiss	(%rsi,%rax), %xmm11
145527744:     	jb	0x145527730 <.text+0x5526730>
145527746:     	addq	%rsi, %rax
145527749:     	ucomiss	0x4(%rax), %xmm12
14552774e:     	jb	0x145527730 <.text+0x5526730>
145527750:     	movss	0x8(%rax), %xmm0
145527755:     	ucomiss	%xmm11, %xmm0
145527759:     	jb	0x145527730 <.text+0x5526730>
14552775b:     	movss	0xc(%rax), %xmm0
145527760:     	ucomiss	%xmm12, %xmm0
145527764:     	jb	0x145527730 <.text+0x5526730>
145527766:     	leaq	(%r15,%r15,8), %rax
14552776a:     	leaq	(%r14,%rax,8), %rax
14552776e:     	movq	0x8(%rax), %rcx
145527772:     	movq	0x10(%rax), %rdx
145527776:     	movss	%xmm11, 0x150(%rbp)
14552777f:     	movss	%xmm12, 0x154(%rbp)
145527788:     	movl	$0x0, 0x158(%rbp)
145527792:     	movq	%r13, %r8
145527795:     	callq	0x14568f2e0 <.text+0x568e2e0>
14552779a:     	nop
14552779b:     	testb	$0x1, %al
14552779d:     	je	0x145527730 <.text+0x5526730>
14552779f:     	jmp	0x1455278b4 <.text+0x55268b4>
1455277a4:     	movaps	%xmm11, %xmm7
1455277a8:     	addss	0x423d70(%rip), %xmm7   # 0x14594b520
1455277b0:     	xorl	%r15d, %r15d
1455277b3:     	jmp	0x1455277c8 <.text+0x55267c8>
1455277b5:     	nopw	%cs:(%rax,%rax)
1455277c0:     	incq	%r15
1455277c3:     	cmpq	%rdi, %r15
1455277c6:     	je	0x145527831 <.text+0x5526831>
1455277c8:     	movq	%r15, %rax
1455277cb:     	shlq	$0x4, %rax
1455277cf:     	ucomiss	(%rsi,%rax), %xmm7
1455277d3:     	jb	0x1455277c0 <.text+0x55267c0>
1455277d5:     	addq	%rsi, %rax
1455277d8:     	ucomiss	0x4(%rax), %xmm8
1455277dd:     	jb	0x1455277c0 <.text+0x55267c0>
1455277df:     	movss	0x8(%rax), %xmm0
1455277e4:     	ucomiss	%xmm7, %xmm0
1455277e7:     	jb	0x1455277c0 <.text+0x55267c0>
1455277e9:     	movss	0xc(%rax), %xmm0
1455277ee:     	ucomiss	%xmm8, %xmm0
1455277f2:     	jb	0x1455277c0 <.text+0x55267c0>
1455277f4:     	leaq	(%r15,%r15,8), %rax
1455277f8:     	leaq	(%r14,%rax,8), %rax
1455277fc:     	movq	0x8(%rax), %rcx
145527800:     	movq	0x10(%rax), %rdx
145527804:     	movss	%xmm7, 0x150(%rbp)
14552780c:     	movss	%xmm8, 0x154(%rbp)
145527815:     	movl	$0x0, 0x158(%rbp)
14552781f:     	movq	%r13, %r8
145527822:     	callq	0x14568f2e0 <.text+0x568e2e0>
145527827:     	nop
145527828:     	testb	$0x1, %al
14552782a:     	je	0x1455277c0 <.text+0x55267c0>
14552782c:     	jmp	0x1455278b4 <.text+0x55268b4>
145527831:     	addss	0x180cfa6(%rip), %xmm11 # 0x146d347e0
14552783a:     	xorl	%r15d, %r15d
14552783d:     	jmp	0x145527848 <.text+0x5526848>
14552783f:     	nop
145527840:     	incq	%r15
145527843:     	cmpq	%rdi, %r15
145527846:     	je	0x1455278b1 <.text+0x55268b1>
145527848:     	movq	%r15, %rax
14552784b:     	shlq	$0x4, %rax
14552784f:     	ucomiss	(%rsi,%rax), %xmm11
145527854:     	jb	0x145527840 <.text+0x5526840>
145527856:     	addq	%rsi, %rax
145527859:     	ucomiss	0x4(%rax), %xmm13
14552785e:     	jb	0x145527840 <.text+0x5526840>
145527860:     	movss	0x8(%rax), %xmm0
145527865:     	ucomiss	%xmm11, %xmm0
145527869:     	jb	0x145527840 <.text+0x5526840>
14552786b:     	movss	0xc(%rax), %xmm0
145527870:     	ucomiss	%xmm13, %xmm0
145527874:     	jb	0x145527840 <.text+0x5526840>
145527876:     	leaq	(%r15,%r15,8), %rax
14552787a:     	leaq	(%r14,%rax,8), %rax
14552787e:     	movq	0x8(%rax), %rcx
145527882:     	movq	0x10(%rax), %rdx
145527886:     	movss	%xmm11, 0x150(%rbp)
14552788f:     	movss	%xmm13, 0x154(%rbp)
145527898:     	movl	$0x0, 0x158(%rbp)
1455278a2:     	movq	%r13, %r8
1455278a5:     	callq	0x14568f2e0 <.text+0x568e2e0>
1455278aa:     	nop
1455278ab:     	testb	$0x1, %al
1455278ad:     	je	0x145527840 <.text+0x5526840>
1455278af:     	jmp	0x1455278b4 <.text+0x55268b4>
1455278b1:     	movaps	%xmm6, %xmm0
1455278b4:     	movq	0x308(%rbp), %rax
1455278bb:     	movq	0x298(%rbp), %r15
1455278c2:     	leaq	(%rbx,%r12), %rcx
1455278c6:     	cmpq	%r15, %rcx
1455278c9:     	jae	0x145528ec4 <.text+0x5527ec4>
1455278cf:     	incq	%rbx
1455278d2:     	movss	%xmm0, (%rax,%rcx,4)
1455278d7:     	cmpq	0x338(%rbp), %rbx
1455278de:     	jb	0x1455275d0 <.text+0x55265d0>
1455278e4:     	movq	0x1f0(%rbp), %r12
1455278eb:     	movq	0x30(%rbp), %r8
1455278ef:     	cmpq	0x338(%rbp), %r12
1455278f6:     	jb	0x1455274f0 <.text+0x55264f0>
1455278fc:     	testq	%r15, %r15
1455278ff:     	je	0x145527941 <.text+0x5526941>
145527901:     	callq	0x140002200 <.text+0x1200>
145527906:     	movl	$0x1, %edx
14552790b:     	movq	%r15, %rcx
14552790e:     	callq	0x1400021f0 <.text+0x11f0>
145527913:     	testq	%rax, %rax
145527916:     	movaps	0x280(%rbp), %xmm7
14552791d:     	movss	0x460(%rbp), %xmm6
145527925:     	movq	0x238(%rbp), %rdi
14552792c:     	jne	0x14552795c <.text+0x552695c>
14552792e:     	movl	$0x1, %ecx
145527933:     	movq	%r15, %rdx
145527936:     	callq	0x14590379b <.text+0x590279b>
14552793b:     	nop
14552793c:     	jmp	0x14552901f <.text+0x552801f>
145527941:     	movl	$0x1, %eax
145527946:     	movaps	0x280(%rbp), %xmm7
14552794d:     	movss	0x460(%rbp), %xmm6
145527955:     	movq	0x238(%rbp), %rdi
14552795c:     	movapd	0x2c0(%rbp), %xmm0
145527964:     	movlpd	%xmm0, 0x2f8(%rbp)
14552796c:     	movq	0x338(%rbp), %rcx
145527973:     	movq	%rcx, 0x2f0(%rbp)
14552797a:     	movq	%r15, 0x2d8(%rbp)
145527981:     	movq	%rax, 0x2e0(%rbp)
145527988:     	movq	%r15, 0x2e8(%rbp)
14552798f:     	movb	$0x1, 0x346(%rbp)
145527996:     	callq	0x1456ff6a0 <.text+0x56fe6a0>
14552799b:     	nop
14552799c:     	cmpb	$0x1, 0x10(%rax)
1455279a0:     	jne	0x145528ed9 <.text+0x5527ed9>
1455279a6:     	movq	(%rax), %rcx
1455279a9:     	movq	0x8(%rax), %rdx
1455279ad:     	leaq	0x1(%rcx), %r8
1455279b1:     	movq	%r8, (%rax)
1455279b4:     	movups	0x180ce84(%rip), %xmm9  # 0x146d34840
1455279bc:     	movaps	%xmm9, 0x100(%rbp)
1455279c4:     	movups	0x180ce64(%rip), %xmm10 # 0x146d34830
1455279cc:     	movaps	%xmm10, 0xf0(%rbp)
1455279d4:     	movq	%rcx, 0x110(%rbp)
1455279db:     	movq	%rdx, 0x118(%rbp)
1455279e2:     	callq	0x1456ff6a0 <.text+0x56fe6a0>
1455279e7:     	nop
1455279e8:     	movq	%rax, %rbx
1455279eb:     	cmpb	$0x1, 0x10(%rax)
1455279ef:     	jne	0x145528eff <.text+0x5527eff>
1455279f5:     	movq	(%rbx), %rax
1455279f8:     	movq	0x8(%rbx), %rdx
1455279fc:     	leaq	0x1(%rax), %rcx
145527a00:     	movq	%rcx, (%rbx)
145527a03:     	movaps	%xmm9, 0x210(%rbp)
145527a0b:     	movaps	%xmm10, 0x200(%rbp)
145527a13:     	movq	%rax, 0x220(%rbp)
145527a1a:     	movq	%rdx, 0x228(%rbp)
145527a21:     	leaq	(%rdi,%rdi,8), %rax
145527a25:     	movq	%rax, 0x318(%rbp)
145527a2c:     	leaq	(%r14,%rax,8), %rbx
145527a30:     	movshdup	%xmm7, %xmm14           # xmm14 = xmm7[1,1,3,3]
145527a35:     	movss	0x3dfa52(%rip), %xmm8   # 0x145907490
145527a3e:     	movss	0x3eb909(%rip), %xmm11  # 0x145913350
145527a47:     	movaps	0x3edd31(%rip), %xmm15  # 0x145915780
145527a4f:     	leaq	0x200(%rbp), %rsi
145527a56:     	leaq	0x150(%rbp), %rdi
145527a5d:     	leaq	0xf0(%rbp), %r15
145527a64:     	movdqa	0x3e23f3(%rip), %xmm13  # 0x145909e60
145527a6d:     	movdqa	0x3e23ba(%rip), %xmm12  # 0x145909e30
145527a76:     	xorl	%r8d, %r8d
145527a79:     	movq	%r14, %r12
145527a7c:     	movq	0x338(%rbp), %rax
145527a83:     	testq	%r8, %r8
145527a86:     	je	0x145527aa0 <.text+0x5526aa0>
145527a88:     	cmpq	%rax, %r8
145527a8b:     	je	0x145527aa0 <.text+0x5526aa0>
145527a8d:     	movq	%r8, %r13
145527a90:     	jmp	0x145527ac3 <.text+0x5526ac3>
145527a92:     	nopw	%cs:(%rax,%rax)
145527aa0:     	cmpq	%rbx, %r12
145527aa3:     	je	0x145528026 <.text+0x5527026>
145527aa9:     	movq	0x28(%r12), %rax
145527aae:     	addq	$0x48, %r12
145527ab2:     	testq	%rax, %rax
145527ab5:     	je	0x145527aa0 <.text+0x5526aa0>
145527ab7:     	movq	-0x28(%r12), %r13
145527abc:     	imulq	$0x38, %rax, %rax
145527ac0:     	addq	%r13, %rax
145527ac3:     	leaq	0x38(%r13), %r8
145527ac7:     	movss	0x18(%r13), %xmm1
145527acd:     	movss	0x30(%r13), %xmm0
145527ad3:     	maxss	%xmm8, %xmm0
145527ad8:     	mulss	%xmm11, %xmm0
145527add:     	subss	%xmm7, %xmm1
145527ae1:     	andps	%xmm15, %xmm1
145527ae5:     	addss	%xmm6, %xmm0
145527ae9:     	ucomiss	%xmm1, %xmm0
145527aec:     	jbe	0x145527a83 <.text+0x5526a83>
145527aee:     	movss	0x1c(%r13), %xmm1
145527af4:     	subss	%xmm14, %xmm1
145527af9:     	andps	%xmm15, %xmm1
145527afd:     	ucomiss	%xmm1, %xmm0
145527b00:     	jbe	0x145527a83 <.text+0x5526a83>
145527b02:     	movq	%r8, 0x310(%rbp)
145527b09:     	movq	%rax, 0x338(%rbp)
145527b10:     	movl	0x34(%r13), %edx
145527b14:     	movq	%rsi, %rcx
145527b17:     	callq	0x14546cf80 <.text+0x546bf80>
145527b1c:     	nop
145527b1d:     	testb	%al, %al
145527b1f:     	movdqa	0x280(%rbp), %xmm7
145527b27:     	movd	0x460(%rbp), %xmm6
145527b2f:     	movq	0x338(%rbp), %rax
145527b36:     	leaq	0x38(%r13), %r8
145527b3a:     	jne	0x145527a83 <.text+0x5526a83>
145527b40:     	movq	0x10(%r13), %r9
145527b44:     	testq	%r9, %r9
145527b47:     	js	0x145528eb0 <.text+0x5527eb0>
145527b4d:     	je	0x145527bc1 <.text+0x5526bc1>
145527b4f:     	movq	0x8(%r13), %rax
145527b53:     	movq	%rax, 0x300(%rbp)
145527b5a:     	movq	%r9, 0x320(%rbp)
145527b61:     	callq	0x140002200 <.text+0x1200>
145527b66:     	movl	$0x1, %edx
145527b6b:     	movq	0x320(%rbp), %rcx
145527b72:     	callq	0x1400021c0 <.text+0x11c0>
145527b77:     	testq	%rax, %rax
145527b7a:     	je	0x145529021 <.text+0x5528021>
145527b80:     	movq	%rax, 0x328(%rbp)
145527b87:     	movq	%rax, %rcx
145527b8a:     	movq	0x300(%rbp), %rdx
145527b91:     	movq	0x320(%rbp), %r8
145527b98:     	callq	0x1457731ed <.text+0x57721ed>
145527b9d:     	movq	0x320(%rbp), %r9
145527ba4:     	cmpq	$0x8, %r9
145527ba8:     	movdqa	0x3e22c0(%rip), %xmm5   # 0x145909e70
145527bb0:     	movdqa	0x3e22c8(%rip), %xmm6   # 0x145909e80
145527bb8:     	jae	0x145527bcb <.text+0x5526bcb>
145527bba:     	xorl	%eax, %eax
145527bbc:     	jmp	0x145527cd6 <.text+0x5526cd6>
145527bc1:     	movl	$0x1, %ecx
145527bc6:     	jmp	0x145527d01 <.text+0x5526d01>
145527bcb:     	cmpq	$0x20, %r9
145527bcf:     	jae	0x145527bdf <.text+0x5526bdf>
145527bd1:     	xorl	%eax, %eax
145527bd3:     	movq	0x328(%rbp), %rcx
145527bda:     	jmp	0x145527c86 <.text+0x5526c86>
145527bdf:     	movdqa	%xmm12, %xmm7
145527be4:     	movq	%r9, %rax
145527be7:     	movabsq	$0x7fffffffffffffe0, %rcx # imm = 0x7FFFFFFFFFFFFFE0
145527bf1:     	andq	%rcx, %rax
145527bf4:     	xorl	%ecx, %ecx
145527bf6:     	movdqa	0x3e2242(%rip), %xmm5   # 0x145909e40
145527bfe:     	movdqa	0x3e224a(%rip), %xmm6   # 0x145909e50
145527c06:     	movq	0x328(%rbp), %rdx
145527c0d:     	movdqu	(%rdx,%rcx), %xmm0
145527c12:     	movdqu	0x10(%rdx,%rcx), %xmm1
145527c18:     	movdqa	%xmm0, %xmm2
145527c1c:     	paddb	%xmm7, %xmm2
145527c20:     	movdqa	%xmm1, %xmm3
145527c24:     	paddb	%xmm7, %xmm3
145527c28:     	movdqa	%xmm2, %xmm4
145527c2c:     	pminub	%xmm5, %xmm4
145527c30:     	pcmpeqb	%xmm2, %xmm4
145527c34:     	pand	%xmm6, %xmm4
145527c38:     	movdqa	%xmm3, %xmm2
145527c3c:     	pminub	%xmm5, %xmm2
145527c40:     	pcmpeqb	%xmm3, %xmm2
145527c44:     	pand	%xmm6, %xmm2
145527c48:     	por	%xmm0, %xmm4
145527c4c:     	por	%xmm1, %xmm2
145527c50:     	movdqu	%xmm4, (%rdx,%rcx)
145527c55:     	movdqu	%xmm2, 0x10(%rdx,%rcx)
145527c5b:     	addq	$0x20, %rcx
145527c5f:     	cmpq	%rcx, %rax
145527c62:     	jne	0x145527c0d <.text+0x5526c0d>
145527c64:     	cmpq	%rax, %r9
145527c67:     	movq	%rdx, %rcx
145527c6a:     	movdqa	0x3e21fe(%rip), %xmm5   # 0x145909e70
145527c72:     	movdqa	0x3e2206(%rip), %xmm6   # 0x145909e80
145527c7a:     	je	0x145527d01 <.text+0x5526d01>
145527c80:     	testb	$0x18, %r9b
145527c84:     	je	0x145527cd6 <.text+0x5526cd6>
145527c86:     	movq	%rcx, %r8
145527c89:     	movq	%rax, %rcx
145527c8c:     	movq	%r9, %rax
145527c8f:     	movabsq	$0x7ffffffffffffff8, %rdx # imm = 0x7FFFFFFFFFFFFFF8
145527c99:     	andq	%rdx, %rax
145527c9c:     	movq	(%r8,%rcx), %xmm0
145527ca2:     	movdqa	%xmm0, %xmm1
145527ca6:     	paddb	%xmm13, %xmm1
145527cab:     	movdqa	%xmm1, %xmm2
145527caf:     	pmaxub	%xmm5, %xmm2
145527cb3:     	pcmpeqb	%xmm1, %xmm2
145527cb7:     	pandn	%xmm6, %xmm2
145527cbb:     	por	%xmm0, %xmm2
145527cbf:     	movq	%xmm2, (%r8,%rcx)
145527cc5:     	addq	$0x8, %rcx
145527cc9:     	cmpq	%rcx, %rax
145527ccc:     	jne	0x145527c9c <.text+0x5526c9c>
145527cce:     	cmpq	%rax, %r9
145527cd1:     	movq	%r8, %rcx
145527cd4:     	je	0x145527d01 <.text+0x5526d01>
145527cd6:     	movq	0x328(%rbp), %rcx
145527cdd:     	movzbl	(%rcx,%rax), %ecx
145527ce1:     	leal	-0x41(%rcx), %edx
145527ce4:     	cmpb	$0x1a, %dl
145527ce7:     	setb	%dl
145527cea:     	shlb	$0x5, %dl
145527ced:     	orb	%cl, %dl
145527cef:     	movq	0x328(%rbp), %rcx
145527cf6:     	movb	%dl, (%rcx,%rax)
145527cf9:     	incq	%rax
145527cfc:     	cmpq	%rax, %r9
145527cff:     	jne	0x145527cd6 <.text+0x5526cd6>
145527d01:     	movq	%r9, 0x240(%rbp)
145527d08:     	movq	%rcx, 0x328(%rbp)
145527d0f:     	movq	%rcx, 0x248(%rbp)
145527d16:     	movq	%r9, 0x250(%rbp)
145527d1d:     	movq	%rdi, %rcx
145527d20:     	movq	%r15, %rdx
145527d23:     	leaq	0x240(%rbp), %r8
145527d2a:     	callq	0x14546bc10 <.text+0x546ac10>
145527d2f:     	nop
145527d30:     	movq	0x150(%rbp), %rax
145527d37:     	movq	0x158(%rbp), %rdx
145527d3e:     	cmpq	$-0x1, %rax
145527d42:     	je	0x145527dd4 <.text+0x5526dd4>
145527d48:     	movq	%rax, 0x320(%rbp)
145527d4f:     	movq	%rdx, 0x300(%rbp)
145527d56:     	movq	0x160(%rbp), %rax
145527d5d:     	movq	%rax, 0x1f0(%rbp)
145527d64:     	movq	0x168(%rbp), %rsi
145527d6b:     	movq	0x170(%rbp), %r15
145527d72:     	movq	0x8(%r13), %r8
145527d76:     	movq	0x10(%r13), %r9
145527d7a:     	movq	%rdi, %rcx
145527d7d:     	leaq	0x2a0(%rbp), %rdx
145527d84:     	callq	0x145682080 <.text+0x5681080>
145527d89:     	nop
145527d8a:     	movq	0x150(%rbp), %rdi
145527d91:     	cmpq	$-0x1, %rdi
145527d95:     	je	0x145527de8 <.text+0x5526de8>
145527d97:     	movq	0x158(%rbp), %rcx
145527d9e:     	movq	0x170(%rbp), %rdx
145527da5:     	movq	0x178(%rbp), %rax
145527dac:     	testq	%rax, %rax
145527daf:     	je	0x145527f84 <.text+0x5526f84>
145527db5:     	movups	0x160(%rbp), %xmm0
145527dbc:     	movaps	%xmm0, 0x30(%rbp)
145527dc0:     	movq	%rcx, 0x1f8(%rbp)
145527dc7:     	movq	%rdx, 0x238(%rbp)
145527dce:     	movq	%rax, 0x20(%rbp)
145527dd2:     	jmp	0x145527dfc <.text+0x5526dfc>
145527dd4:     	movaps	0x280(%rbp), %xmm7
145527ddb:     	movss	0x460(%rbp), %xmm6
145527de3:     	jmp	0x145527eee <.text+0x5526eee>
145527de8:     	leaq	0x158(%rbp), %rcx
145527def:     	callq	0x1456f8fa0 <.text+0x56f7fa0>
145527df4:     	nop
145527df5:     	movq	$-0x1, %rdi
145527dfc:     	movaps	0x280(%rbp), %xmm7
145527e03:     	movss	0x460(%rbp), %xmm6
145527e0b:     	movq	(%rsi), %rax
145527e0e:     	movq	0x8(%rsi), %rcx
145527e12:     	movq	%rcx, %rdx
145527e15:     	andq	%r15, %rdx
145527e18:     	movdqu	(%rax,%rdx), %xmm0
145527e1d:     	pmovmskb	%xmm0, %r8d
145527e22:     	testl	%r8d, %r8d
145527e25:     	je	0x145527fea <.text+0x5526fea>
145527e2b:     	tzcntl	%r8d, %r8d
145527e30:     	addq	%rdx, %r8
145527e33:     	andq	%rcx, %r8
145527e36:     	movzbl	(%rax,%r8), %edx
145527e3b:     	testb	%dl, %dl
145527e3d:     	jns	0x14552800f <.text+0x552700f>
145527e43:     	leaq	-0x10(%r8), %r9
145527e47:     	andq	%rcx, %r9
145527e4a:     	shrq	$0x39, %r15
145527e4e:     	movb	%r15b, (%rax,%r8)
145527e52:     	movb	%r15b, 0x10(%rax,%r9)
145527e57:     	negq	%r8
145527e5a:     	leaq	(%r8,%r8,8), %rcx
145527e5e:     	movq	0x320(%rbp), %r8
145527e65:     	movq	%r8, -0x48(%rax,%rcx,8)
145527e6a:     	movq	0x300(%rbp), %r8
145527e71:     	movq	%r8, -0x40(%rax,%rcx,8)
145527e76:     	movq	0x1f0(%rbp), %r8
145527e7d:     	movq	%r8, -0x38(%rax,%rcx,8)
145527e82:     	movq	%rdi, -0x30(%rax,%rcx,8)
145527e87:     	movq	0x1f8(%rbp), %r8
145527e8e:     	movq	%r8, -0x28(%rax,%rcx,8)
145527e93:     	movaps	0x30(%rbp), %xmm0
145527e97:     	movups	%xmm0, -0x20(%rax,%rcx,8)
145527e9c:     	movq	0x238(%rbp), %r8
145527ea3:     	movq	%r8, -0x10(%rax,%rcx,8)
145527ea8:     	movq	0x20(%rbp), %r8
145527eac:     	movq	%r8, -0x8(%rax,%rcx,8)
145527eb1:     	leaq	(%rax,%rcx,8), %rax
145527eb5:     	andb	$0x1, %dl
145527eb8:     	movzbl	%dl, %ecx
145527ebb:     	movd	%ecx, %xmm0
145527ebf:     	movdqu	0x10(%rsi), %xmm1
145527ec4:     	shufpd	$0x2, 0x3df2c3(%rip), %xmm0 # xmm0 = xmm0[0],mem[1]
                                                # 0x145907190
145527ecd:     	psubq	%xmm0, %xmm1
145527ed1:     	movdqu	%xmm1, 0x10(%rsi)
145527ed6:     	movq	%rax, %rdx
145527ed9:     	leaq	0x200(%rbp), %rsi
145527ee0:     	leaq	0x150(%rbp), %rdi
145527ee7:     	leaq	0xf0(%rbp), %r15
145527eee:     	cmpq	$-0x1, -0x30(%rdx)
145527ef3:     	movq	0x308(%rbp), %rcx
145527efa:     	movq	0x298(%rbp), %r9
145527f01:     	leaq	0x38(%r13), %r8
145527f05:     	je	0x145527a7c <.text+0x5526a7c>
145527f0b:     	addq	$-0x30, %rdx
145527f0f:     	leaq	0x18(%r13), %r8
145527f13:     	movl	0x8(%r8), %eax
145527f17:     	movl	%eax, 0x248(%rbp)
145527f1d:     	movq	(%r8), %rax
145527f20:     	movq	%rax, 0x240(%rbp)
145527f27:     	movl	0x2c(%r13), %eax
145527f2b:     	movl	%eax, 0x158(%rbp)
145527f31:     	movq	0x24(%r13), %rax
145527f35:     	movq	%rax, 0x150(%rbp)
145527f3c:     	movss	0x30(%r13), %xmm0
145527f42:     	movq	%r9, 0x30(%rsp)
145527f47:     	movq	%rcx, 0x28(%rsp)
145527f4c:     	movss	%xmm0, 0x20(%rsp)
145527f52:     	leaq	0x2d8(%rbp), %rcx
145527f59:     	leaq	0x240(%rbp), %r8
145527f60:     	movq	%rdi, %r9
145527f63:     	callq	0x145524fa0 <.text+0x5523fa0>
145527f68:     	nop
145527f69:     	movaps	0x280(%rbp), %xmm7
145527f70:     	movss	0x460(%rbp), %xmm6
145527f78:     	movq	0x310(%rbp), %r8
145527f7f:     	jmp	0x145527a7c <.text+0x5526a7c>
145527f84:     	movq	0x168(%rbp), %rax
145527f8b:     	testq	%rdi, %rdi
145527f8e:     	movaps	0x280(%rbp), %xmm7
145527f95:     	movss	0x460(%rbp), %xmm6
145527f9d:     	je	0x145527fc0 <.text+0x5526fc0>
145527f9f:     	shlq	$0x2, %rdi
145527fa3:     	movq	%rdx, 0x28(%rbp)
145527fa7:     	leaq	(%rdi,%rdi,2), %rdx
145527fab:     	movl	$0x4, %r8d
145527fb1:     	movq	%rax, %rdi
145527fb4:     	callq	0x1400021d0 <.text+0x11d0>
145527fb9:     	movq	%rdi, %rax
145527fbc:     	movq	0x28(%rbp), %rdx
145527fc0:     	movq	$-0x1, %rdi
145527fc7:     	testq	%rax, %rax
145527fca:     	je	0x145527e0b <.text+0x5526e0b>
145527fd0:     	shlq	$0x2, %rax
145527fd4:     	movl	$0x4, %r8d
145527fda:     	movq	%rdx, %rcx
145527fdd:     	movq	%rax, %rdx
145527fe0:     	callq	0x1400021d0 <.text+0x11d0>
145527fe5:     	jmp	0x145527e0b <.text+0x5526e0b>
145527fea:     	movl	$0x10, %r9d
145527ff0:     	addq	%r9, %rdx
145527ff3:     	andq	%rcx, %rdx
145527ff6:     	movdqu	(%rax,%rdx), %xmm0
145527ffb:     	pmovmskb	%xmm0, %r8d
145528000:     	addq	$0x10, %r9
145528004:     	testl	%r8d, %r8d
145528007:     	jne	0x145527e2b <.text+0x5526e2b>
14552800d:     	jmp	0x145527ff0 <.text+0x5526ff0>
14552800f:     	movdqa	(%rax), %xmm0
145528013:     	pmovmskb	%xmm0, %edx
145528017:     	tzcntl	%edx, %r8d
14552801c:     	movzbl	(%rax,%r8), %edx
145528021:     	jmp	0x145527e43 <.text+0x5526e43>
145528026:     	cmpq	$0x0, 0x218(%rbp)
14552802e:     	je	0x14552807e <.text+0x552707e>
145528030:     	movq	0x208(%rbp), %rsi
145528037:     	testq	%rsi, %rsi
14552803a:     	je	0x14552806a <.text+0x552706a>
14552803c:     	movq	0x200(%rbp), %rcx
145528043:     	leaq	0x11(%rsi), %r8
145528047:     	movb	$-0x1, %dl
145528049:     	callq	0x1457731db <.text+0x57721db>
14552804e:     	leaq	0x1(%rsi), %rax
145528052:     	movq	%rax, %rcx
145528055:     	shrq	$0x3, %rcx
145528059:     	andq	$-0x8, %rax
14552805d:     	subq	%rcx, %rax
145528060:     	cmpq	$0x8, %rsi
145528064:     	cmovbq	%rsi, %rax
145528068:     	jmp	0x14552806c <.text+0x552706c>
14552806a:     	xorl	%eax, %eax
14552806c:     	movq	$0x0, 0x218(%rbp)
145528077:     	movq	%rax, 0x210(%rbp)
14552807e:     	addss	0x4cc232(%rip), %xmm6   # 0x1459f42b8
145528086:     	xorl	%esi, %esi
145528088:     	leaq	0x200(%rbp), %r13
14552808f:     	leaq	0x2d8(%rbp), %r12
145528096:     	testq	%rsi, %rsi
145528099:     	je	0x1455280b0 <.text+0x55270b0>
14552809b:     	cmpq	%rdi, %rsi
14552809e:     	je	0x1455280b0 <.text+0x55270b0>
1455280a0:     	movq	%rsi, %r15
1455280a3:     	jmp	0x1455280f1 <.text+0x55270f1>
1455280a5:     	nopw	%cs:(%rax,%rax)
1455280b0:     	movq	0x308(%rbp), %rsi
1455280b7:     	movq	0x468(%rbp), %rdi
1455280be:     	movq	0x298(%rbp), %r15
1455280c5:     	nopw	%cs:(%rax,%rax)
1455280d0:     	cmpq	%rbx, %r14
1455280d3:     	je	0x145528271 <.text+0x5527271>
1455280d9:     	movq	0x40(%r14), %rax
1455280dd:     	addq	$0x48, %r14
1455280e1:     	testq	%rax, %rax
1455280e4:     	je	0x1455280d0 <.text+0x55270d0>
1455280e6:     	movq	-0x10(%r14), %r15
1455280ea:     	imulq	$0x38, %rax, %rdi
1455280ee:     	addq	%r15, %rdi
1455280f1:     	leaq	0x38(%r15), %rsi
1455280f5:     	movss	0x18(%r15), %xmm0
1455280fb:     	subss	%xmm7, %xmm0
1455280ff:     	andps	%xmm15, %xmm0
145528103:     	ucomiss	%xmm0, %xmm6
145528106:     	jbe	0x145528096 <.text+0x5527096>
145528108:     	movss	0x1c(%r15), %xmm0
14552810e:     	subss	%xmm14, %xmm0
145528113:     	andps	%xmm15, %xmm0
145528117:     	ucomiss	%xmm0, %xmm6
14552811a:     	jbe	0x145528096 <.text+0x5527096>
145528120:     	movaps	%xmm6, %xmm8
145528124:     	movl	0x30(%r15), %edx
145528128:     	movq	%r13, %rcx
14552812b:     	callq	0x14546cf80 <.text+0x546bf80>
145528130:     	nop
145528131:     	testb	%al, %al
145528133:     	movaps	0x280(%rbp), %xmm7
14552813a:     	movaps	%xmm8, %xmm6
14552813e:     	jne	0x145528096 <.text+0x5527096>
145528144:     	movq	0x8(%r15), %r8
145528148:     	movq	0x10(%r15), %r9
14552814c:     	leaq	0x240(%rbp), %rcx
145528153:     	leaq	0x2a0(%rbp), %rdx
14552815a:     	callq	0x145682320 <.text+0x5681320>
14552815f:     	nop
145528160:     	cmpq	$-0x1, 0x240(%rbp)
145528168:     	je	0x145528254 <.text+0x5527254>
14552816e:     	leaq	0x18(%r15), %rax
145528172:     	movups	0x240(%rbp), %xmm0
145528179:     	movups	0x250(%rbp), %xmm1
145528180:     	movups	0x260(%rbp), %xmm2
145528187:     	movaps	%xmm2, 0x170(%rbp)
14552818e:     	movaps	%xmm1, 0x160(%rbp)
145528195:     	movaps	%xmm0, 0x150(%rbp)
14552819c:     	movl	0x8(%rax), %ecx
14552819f:     	movl	%ecx, 0x1e8(%rbp)
1455281a5:     	movq	(%rax), %rax
1455281a8:     	movq	%rax, 0x1e0(%rbp)
1455281af:     	movl	0x2c(%r15), %eax
1455281b3:     	movl	%eax, 0x278(%rbp)
1455281b9:     	movq	0x24(%r15), %rax
1455281bd:     	movq	%rax, 0x270(%rbp)
1455281c4:     	movq	0x298(%rbp), %rax
1455281cb:     	movq	%rax, 0x30(%rsp)
1455281d0:     	movq	0x308(%rbp), %rax
1455281d7:     	movq	%rax, 0x28(%rsp)
1455281dc:     	movl	$0x3f800000, 0x20(%rsp) # imm = 0x3F800000
1455281e4:     	movq	%r12, %rcx
1455281e7:     	leaq	0x150(%rbp), %rdx
1455281ee:     	leaq	0x1e0(%rbp), %r8
1455281f5:     	leaq	0x270(%rbp), %r9
1455281fc:     	callq	0x145524fa0 <.text+0x5523fa0>
145528201:     	nop
145528202:     	movq	0x150(%rbp), %rax
145528209:     	testq	%rax, %rax
14552820c:     	je	0x145528228 <.text+0x5527228>
14552820e:     	movq	0x158(%rbp), %rcx
145528215:     	shlq	$0x2, %rax
145528219:     	leaq	(%rax,%rax,2), %rdx
14552821d:     	movl	$0x4, %r8d
145528223:     	callq	0x1400021d0 <.text+0x11d0>
145528228:     	movq	0x168(%rbp), %rdx
14552822f:     	testq	%rdx, %rdx
145528232:     	je	0x14552824a <.text+0x552724a>
145528234:     	movq	0x170(%rbp), %rcx
14552823b:     	shlq	$0x2, %rdx
14552823f:     	movl	$0x4, %r8d
145528245:     	callq	0x1400021d0 <.text+0x11d0>
14552824a:     	cmpq	$-0x1, 0x240(%rbp)
145528252:     	jne	0x145528261 <.text+0x5527261>
145528254:     	leaq	0x248(%rbp), %rcx
14552825b:     	callq	0x1456f8fa0 <.text+0x56f7fa0>
145528260:     	nop
145528261:     	movaps	0x280(%rbp), %xmm7
145528268:     	movaps	%xmm8, %xmm6
14552826c:     	jmp	0x145528096 <.text+0x5527096>
145528271:     	movq	0x2f0(%rbp), %r8
145528278:     	movq	%r8, 0x270(%rbp)
14552827f:     	testq	%rdi, %rdi
145528282:     	je	0x14552852d <.text+0x552752d>
145528288:     	imulq	%r8, %r8
14552828c:     	testq	%r8, %r8
14552828f:     	movq	0x18(%rbp), %rbx
145528293:     	je	0x14552842f <.text+0x552742f>
145528299:     	leaq	-0x1(%rbx), %r10
14552829d:     	xorl	%r9d, %r9d
1455282a0:     	movq	0x2f0(%rbp), %rcx
1455282a7:     	testq	%rcx, %rcx
1455282aa:     	je	0x145528f69 <.text+0x5527f69>
1455282b0:     	movq	%r9, %rax
1455282b3:     	orq	%rcx, %rax
1455282b6:     	shrq	$0x20, %rax
1455282ba:     	je	0x145528300 <.text+0x5527300>
1455282bc:     	movq	%r9, %rax
1455282bf:     	xorl	%edx, %edx
1455282c1:     	divq	%rcx
1455282c4:     	testq	%rdx, %rdx
1455282c7:     	js	0x14552830c <.text+0x552730c>
1455282c9:     	xorps	%xmm0, %xmm0
1455282cc:     	cvtsi2ss	%rdx, %xmm0
1455282d1:     	addss	0x3df1bf(%rip), %xmm0   # 0x145907498
1455282d9:     	addss	0x2f8(%rbp), %xmm0
1455282e1:     	testq	%rax, %rax
1455282e4:     	jns	0x145528339 <.text+0x5527339>
1455282e6:     	movq	%rax, %rcx
1455282e9:     	shrq	%rcx
1455282ec:     	andl	$0x1, %eax
1455282ef:     	orq	%rcx, %rax
1455282f2:     	xorps	%xmm1, %xmm1
1455282f5:     	cvtsi2ss	%rax, %xmm1
1455282fa:     	addss	%xmm1, %xmm1
1455282fe:     	jmp	0x145528341 <.text+0x5527341>
145528300:     	movl	%r9d, %eax
145528303:     	xorl	%edx, %edx
145528305:     	divl	%ecx
145528307:     	testq	%rdx, %rdx
14552830a:     	jns	0x1455282c9 <.text+0x55272c9>
14552830c:     	movq	%rdx, %rcx
14552830f:     	shrq	%rcx
145528312:     	andl	$0x1, %edx
145528315:     	orq	%rcx, %rdx
145528318:     	xorps	%xmm0, %xmm0
14552831b:     	cvtsi2ss	%rdx, %xmm0
145528320:     	addss	%xmm0, %xmm0
145528324:     	addss	0x3df16c(%rip), %xmm0   # 0x145907498
14552832c:     	addss	0x2f8(%rbp), %xmm0
145528334:     	testq	%rax, %rax
145528337:     	js	0x1455282e6 <.text+0x55272e6>
145528339:     	xorps	%xmm1, %xmm1
14552833c:     	cvtsi2ss	%rax, %xmm1
145528341:     	cmpq	%r15, %r9
145528344:     	je	0x145528f7b <.text+0x5527f7b>
14552834a:     	movss	(%rsi,%r9,4), %xmm2
145528350:     	ucomiss	%xmm2, %xmm2
145528353:     	setp	%al
145528356:     	testq	%rbx, %rbx
145528359:     	je	0x145528402 <.text+0x5527402>
14552835f:     	ucomiss	%xmm2, %xmm2
145528362:     	jp	0x145528402 <.text+0x5527402>
145528368:     	addss	0x3df128(%rip), %xmm1   # 0x145907498
145528370:     	addss	0x2fc(%rbp), %xmm1
145528378:     	xorl	%eax, %eax
14552837a:     	movq	%r10, %rcx
14552837d:     	xorl	%edx, %edx
14552837f:     	jmp	0x14552839b <.text+0x552739b>
145528381:     	nopw	%cs:(%rax,%rax)
145528390:     	movq	%rdx, %rcx
145528393:     	incq	%rdx
145528396:     	cmpq	%rdx, %rbx
145528399:     	je	0x145528400 <.text+0x5527400>
14552839b:     	cmpq	%rbx, %rcx
14552839e:     	jae	0x145528f2e <.text+0x5527f2e>
1455283a4:     	movss	0x4(%rdi,%rdx,8), %xmm3
1455283aa:     	movss	0x4(%rdi,%rcx,8), %xmm2
1455283b0:     	movaps	%xmm1, %xmm4
1455283b3:     	cmpltss	%xmm3, %xmm4
1455283b8:     	movaps	%xmm1, %xmm5
1455283bb:     	cmpltss	%xmm2, %xmm5
1455283c0:     	xorps	%xmm4, %xmm5
1455283c3:     	movd	%xmm5, %r11d
1455283c8:     	testb	$0x1, %r11b
1455283cc:     	je	0x145528390 <.text+0x5527390>
1455283ce:     	movss	(%rdi,%rdx,8), %xmm4
1455283d3:     	movss	(%rdi,%rcx,8), %xmm5
1455283d8:     	subss	%xmm4, %xmm5
1455283dc:     	movaps	%xmm1, %xmm6
1455283df:     	subss	%xmm3, %xmm6
1455283e3:     	mulss	%xmm5, %xmm6
1455283e7:     	subss	%xmm3, %xmm2
1455283eb:     	divss	%xmm2, %xmm6
1455283ef:     	addss	%xmm4, %xmm6
1455283f3:     	ucomiss	%xmm0, %xmm6
1455283f6:     	jbe	0x145528390 <.text+0x5527390>
1455283f8:     	xorb	$0x1, %al
1455283fa:     	jmp	0x145528390 <.text+0x5527390>
1455283fc:     	nopl	(%rax)
145528400:     	xorb	$0x1, %al
145528402:     	movq	0x2e8(%rbp), %rdx
145528409:     	cmpq	%rdx, %r9
14552840c:     	jae	0x145528f93 <.text+0x5527f93>
145528412:     	movq	0x2e0(%rbp), %rcx
145528419:     	orb	(%rcx,%r9), %al
14552841d:     	andb	$0x1, %al
14552841f:     	movb	%al, (%rcx,%r9)
145528423:     	incq	%r9
145528426:     	cmpq	%r8, %r9
145528429:     	jne	0x1455282a0 <.text+0x55272a0>
14552842f:     	movsd	0x2f8(%rbp), %xmm0
145528437:     	subps	%xmm0, %xmm7
14552843a:     	xorps	%xmm0, %xmm0
14552843d:     	movaps	%xmm7, %xmm1
145528440:     	cmpltps	%xmm0, %xmm1
145528444:     	unpcklps	%xmm1, %xmm1            # xmm1 = xmm1[0,0,1,1]
145528447:     	movmskpd	%xmm1, %ecx
14552844b:     	movl	$0x8, %eax
145528450:     	testl	%ecx, %ecx
145528452:     	jne	0x145528514 <.text+0x5527514>
145528458:     	movaps	%xmm7, %xmm0
14552845b:     	movss	0x3ded7d(%rip), %xmm4   # 0x1459071e0
145528463:     	subss	%xmm4, %xmm0
145528467:     	cvttss2si	%xmm0, %rcx
14552846c:     	cvttss2si	%xmm7, %r8
145528471:     	movq	%r8, %rdx
145528474:     	sarq	$0x3f, %rdx
145528478:     	andq	%rcx, %rdx
14552847b:     	orq	%r8, %rdx
14552847e:     	xorl	%ecx, %ecx
145528480:     	xorps	%xmm0, %xmm0
145528483:     	ucomiss	%xmm0, %xmm7
145528486:     	cmovbq	%rcx, %rdx
14552848a:     	movss	0x3ded52(%rip), %xmm3   # 0x1459071e4
145528492:     	ucomiss	%xmm3, %xmm7
145528495:     	movq	$-0x1, %r9
14552849c:     	cmovaq	%r9, %rdx
1455284a0:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1455284a4:     	movaps	%xmm1, %xmm2
1455284a7:     	subss	%xmm4, %xmm2
1455284ab:     	cvttss2si	%xmm2, %r10
1455284b0:     	cvttss2si	%xmm1, %r11
1455284b5:     	movq	%r11, %r8
1455284b8:     	sarq	$0x3f, %r8
1455284bc:     	andq	%r10, %r8
1455284bf:     	orq	%r11, %r8
1455284c2:     	ucomiss	%xmm0, %xmm1
1455284c5:     	cmovbq	%rcx, %r8
1455284c9:     	ucomiss	%xmm3, %xmm1
1455284cc:     	cmovaq	%r9, %r8
1455284d0:     	movq	0x2f0(%rbp), %rsi
1455284d7:     	cmpq	%rsi, %rdx
1455284da:     	setb	%r9b
1455284de:     	cmpq	%rsi, %r8
1455284e1:     	setb	%r10b
1455284e5:     	testb	%r10b, %r9b
1455284e8:     	je	0x145528516 <.text+0x5527516>
1455284ea:     	imulq	%r8, %rsi
1455284ee:     	addq	%rdx, %rsi
1455284f1:     	movq	0x2e8(%rbp), %rdx
1455284f8:     	cmpq	%rdx, %rsi
1455284fb:     	jae	0x145528fea <.text+0x5527fea>
145528501:     	movq	0x2e0(%rbp), %rcx
145528508:     	movzbl	(%rcx,%rsi), %edi
14552850c:     	testl	%edi, %edi
14552850e:     	je	0x145528afc <.text+0x5527afc>
145528514:     	xorl	%ecx, %ecx
145528516:     	movq	%rcx, 0x240(%rbp)
14552851d:     	movq	%rax, 0x248(%rbp)
145528524:     	movq	%rcx, 0x250(%rbp)
14552852b:     	jmp	0x14552857e <.text+0x552757e>
14552852d:     	movq	$0x0, 0x150(%rbp)
145528538:     	movq	$0x0, 0x188(%rbp)
145528543:     	leaq	0x270(%rbp), %rax
14552854a:     	movq	%rax, 0x1c0(%rbp)
145528551:     	movq	$0x0, 0x1c8(%rbp)
14552855c:     	movq	%r8, 0x1d0(%rbp)
145528563:     	movq	%r12, 0x1d8(%rbp)
14552856a:     	leaq	0x240(%rbp), %rcx
145528571:     	leaq	0x150(%rbp), %rdx
145528578:     	callq	0x145534b20 <.text+0x5533b20>
14552857d:     	nop
14552857e:     	leaq	0x2d8(%rbp), %rcx
145528585:     	leaq	0x240(%rbp), %rdx
14552858c:     	callq	0x145524ac0 <.text+0x5523ac0>
145528591:     	nop
145528592:     	movq	0x2e0(%rbp), %rcx
145528599:     	movq	0x2e8(%rbp), %rax
1455285a0:     	xorl	%edx, %edx
1455285a2:     	nopw	%cs:(%rax,%rax)
1455285b0:     	cmpq	%rdx, %rax
1455285b3:     	je	0x1455285e4 <.text+0x55275e4>
1455285b5:     	cmpb	$0x0, (%rcx,%rdx)
1455285b9:     	leaq	0x1(%rdx), %rdx
1455285bd:     	je	0x1455285b0 <.text+0x55275b0>
1455285bf:     	movq	0x2d8(%rbp), %rsi
1455285c6:     	leaq	0x2e0(%rbp), %rax
1455285cd:     	movups	(%rax), %xmm0
1455285d0:     	movups	0x10(%rax), %xmm1
1455285d4:     	movaps	%xmm0, 0x150(%rbp)
1455285db:     	movaps	%xmm1, 0x160(%rbp)
1455285e2:     	jmp	0x145528602 <.text+0x5527602>
1455285e4:     	movq	0x2d8(%rbp), %rdx
1455285eb:     	movq	$-0x1, %rsi
1455285f2:     	testq	%rdx, %rdx
1455285f5:     	je	0x145528602 <.text+0x5527602>
1455285f7:     	movl	$0x1, %r8d
1455285fd:     	callq	0x1400021d0 <.text+0x11d0>
145528602:     	movq	0x468(%rbp), %rdi
145528609:     	movq	0x208(%rbp), %rdx
145528610:     	testq	%rdx, %rdx
145528613:     	je	0x14552863f <.text+0x552763f>
145528615:     	leaq	0x13(,%rdx,4), %rax
14552861d:     	andq	$-0x10, %rax
145528621:     	addq	%rax, %rdx
145528624:     	addq	$0x11, %rdx
145528628:     	je	0x14552863f <.text+0x552763f>
14552862a:     	movq	0x200(%rbp), %rcx
145528631:     	subq	%rax, %rcx
145528634:     	movl	$0x10, %r8d
14552863a:     	callq	0x1400021d0 <.text+0x11d0>
14552863f:     	movb	$0x0, 0x346(%rbp)
145528646:     	leaq	0xf0(%rbp), %rcx
14552864d:     	callq	0x14542d8e0 <.text+0x542c8e0>
145528652:     	nop
145528653:     	movq	0x128(%rbp), %rdx
14552865a:     	testq	%rdx, %rdx
14552865d:     	je	0x145528675 <.text+0x5527675>
14552865f:     	shlq	$0x2, %rdx
145528663:     	movl	$0x4, %r8d
145528669:     	movq	0x308(%rbp), %rcx
145528670:     	callq	0x1400021d0 <.text+0x11d0>
145528675:     	movq	%rsi, 0x70(%rbp)
145528679:     	movaps	0x150(%rbp), %xmm0
145528680:     	movaps	0x160(%rbp), %xmm1
145528687:     	movups	%xmm0, 0x78(%rbp)
14552868b:     	movups	%xmm1, 0x88(%rbp)
145528692:     	testq	%rdi, %rdi
145528695:     	movq	0x120(%rbp), %r14
14552869c:     	jne	0x145528d98 <.text+0x5527d98>
1455286a2:     	movq	0x48(%rbp), %r14
1455286a6:     	movaps	-0x30(%rbp), %xmm0
1455286aa:     	addss	%xmm0, %xmm0
1455286ae:     	callq	0x14577327d <.text+0x577227d>
1455286b3:     	cvttss2si	%xmm0, %rax
1455286b8:     	movq	%rax, %rcx
1455286bb:     	sarq	$0x3f, %rcx
1455286bf:     	movaps	%xmm0, %xmm1
1455286c2:     	subss	0x3deb16(%rip), %xmm1   # 0x1459071e0
1455286ca:     	cvttss2si	%xmm1, %rdx
1455286cf:     	andq	%rcx, %rdx
1455286d2:     	orq	%rax, %rdx
1455286d5:     	xorl	%eax, %eax
1455286d7:     	xorps	%xmm1, %xmm1
1455286da:     	ucomiss	%xmm1, %xmm0
1455286dd:     	cmovaeq	%rdx, %rax
1455286e1:     	ucomiss	0x3deafc(%rip), %xmm0   # 0x1459071e4
1455286e8:     	movq	$-0x1, %rdi
1455286ef:     	cmovbeq	%rax, %rdi
1455286f3:     	movq	$0x0, 0xf0(%rbp)
1455286fe:     	movq	$0x4, 0xf8(%rbp)
145528709:     	movq	$0x0, 0x100(%rbp)
145528714:     	movb	$0x1, 0x345(%rbp)
14552871b:     	callq	0x1456ff6a0 <.text+0x56fe6a0>
145528720:     	nop
145528721:     	cmpb	$0x1, 0x10(%rax)
145528725:     	jne	0x145528f43 <.text+0x5527f43>
14552872b:     	movq	(%rax), %rcx
14552872e:     	movq	0x8(%rax), %rdx
145528732:     	leaq	0x1(%rcx), %r8
145528736:     	movq	%r8, (%rax)
145528739:     	movaps	%xmm9, 0x210(%rbp)
145528741:     	movaps	%xmm10, 0x200(%rbp)
145528749:     	movq	%rcx, 0x220(%rbp)
145528750:     	movq	%rdx, 0x228(%rbp)
145528757:     	movq	0x318(%rbp), %rax
14552875e:     	leaq	(%r14,%rax,8), %rsi
145528762:     	xorl	%ecx, %ecx
145528764:     	leaq	0x200(%rbp), %r15
14552876b:     	leaq	0x150(%rbp), %r13
145528772:     	leaq	0x1e0(%rbp), %r12
145528779:     	testq	%rcx, %rcx
14552877c:     	je	0x145528790 <.text+0x5527790>
14552877e:     	cmpq	0x318(%rbp), %rcx
145528785:     	je	0x145528790 <.text+0x5527790>
145528787:     	movq	%rcx, %rbx
14552878a:     	jmp	0x1455287b8 <.text+0x55277b8>
14552878c:     	nopl	(%rax)
145528790:     	cmpq	%rsi, %r14
145528793:     	je	0x145528a3d <.text+0x5527a3d>
145528799:     	movq	0x40(%r14), %rax
14552879d:     	addq	$0x48, %r14
1455287a1:     	testq	%rax, %rax
1455287a4:     	je	0x145528790 <.text+0x5527790>
1455287a6:     	movq	-0x10(%r14), %rbx
1455287aa:     	imulq	$0x38, %rax, %rax
1455287ae:     	addq	%rbx, %rax
1455287b1:     	movq	%rax, 0x318(%rbp)
1455287b8:     	movl	0x30(%rbx), %edx
1455287bb:     	movb	$0x1, 0x347(%rbp)
1455287c2:     	movq	%r15, %rcx
1455287c5:     	callq	0x14546cf80 <.text+0x546bf80>
1455287ca:     	nop
1455287cb:     	leaq	0x38(%rbx), %rcx
1455287cf:     	testb	%al, %al
1455287d1:     	jne	0x145528779 <.text+0x5527779>
1455287d3:     	movq	%rcx, 0x310(%rbp)
1455287da:     	movq	0x8(%rbx), %r8
1455287de:     	movq	0x10(%rbx), %r9
1455287e2:     	movb	$0x1, 0x347(%rbp)
1455287e9:     	movq	%r13, %rcx
1455287ec:     	leaq	0x2a0(%rbp), %rdx
1455287f3:     	callq	0x145682320 <.text+0x5681320>
1455287f8:     	nop
1455287f9:     	cmpq	$-0x1, 0x150(%rbp)
145528801:     	je	0x145528a1d <.text+0x5527a1d>
145528807:     	movups	0x150(%rbp), %xmm0
14552880e:     	movups	0x160(%rbp), %xmm1
145528815:     	movups	0x170(%rbp), %xmm2
14552881c:     	movaps	%xmm2, 0x260(%rbp)
145528823:     	movaps	%xmm1, 0x250(%rbp)
14552882a:     	movaps	%xmm0, 0x240(%rbp)
145528831:     	movl	0x20(%rbx), %eax
145528834:     	movl	%eax, 0x10(%rbp)
145528837:     	movq	0x18(%rbx), %rax
14552883b:     	movq	%rax, 0x8(%rbp)
14552883f:     	movl	0x2c(%rbx), %eax
145528842:     	movl	%eax, 0x2e0(%rbp)
145528848:     	movq	0x24(%rbx), %rax
14552884c:     	movq	%rax, 0x2d8(%rbp)
145528853:     	movq	0x248(%rbp), %rdx
14552885a:     	movq	0x250(%rbp), %r8
145528861:     	leaq	0x2d8(%rbp), %rax
145528868:     	movq	%rax, 0x20(%rsp)
14552886d:     	movl	$0x3f800000, 0x28(%rsp) # imm = 0x3F800000
145528875:     	movq	%r13, %rcx
145528878:     	movq	%rdx, 0x328(%rbp)
14552887f:     	leaq	0x8(%rbp), %r9
145528883:     	callq	0x145530130 <.text+0x552f130>
145528888:     	nop
145528889:     	movabsq	$-0x5555555555555555, %rax # imm = 0xAAAAAAAAAAAAAAAB
145528893:     	mulq	0x268(%rbp)
14552889a:     	movq	0x260(%rbp), %r13
1455288a1:     	shrq	%rdx
1455288a4:     	leaq	(%rdx,%rdx,2), %rbx
1455288a8:     	movq	0x158(%rbp), %rcx
1455288af:     	movq	0x160(%rbp), %r15
1455288b6:     	movq	%r13, 0x320(%rbp)
1455288bd:     	movq	%rcx, 0x338(%rbp)
1455288c4:     	subq	$0x3, %rbx
1455288c8:     	jb	0x14552899c <.text+0x552799c>
1455288ce:     	nop
1455288d0:     	movl	(%r13), %ecx
1455288d4:     	cmpq	%rcx, %r15
1455288d7:     	jbe	0x145528fc9 <.text+0x5527fc9>
1455288dd:     	leaq	(%rcx,%rcx,2), %rax
1455288e1:     	movq	0x338(%rbp), %rdx
1455288e8:     	movl	0x8(%rdx,%rax,4), %ecx
1455288ec:     	movl	%ecx, (%rbp)
1455288ef:     	movq	(%rdx,%rax,4), %rax
1455288f3:     	movq	%rax, -0x8(%rbp)
1455288f7:     	movl	0x4(%r13), %ecx
1455288fb:     	cmpq	%rcx, %r15
1455288fe:     	jbe	0x145528fb7 <.text+0x5527fb7>
145528904:     	leaq	(%rcx,%rcx,2), %rax
145528908:     	movl	0x8(%rdx,%rax,4), %ecx
14552890c:     	movl	%ecx, 0x1e8(%rbp)
145528912:     	movq	(%rdx,%rax,4), %rax
145528916:     	movq	%rax, 0x1e0(%rbp)
14552891d:     	movl	0x8(%r13), %ecx
145528921:     	cmpq	%rcx, %r15
145528924:     	jbe	0x145528fa5 <.text+0x5527fa5>
14552892a:     	leaq	(%rcx,%rcx,2), %rax
14552892e:     	movl	0x8(%rdx,%rax,4), %ecx
145528932:     	movl	%ecx, 0x278(%rbp)
145528938:     	movq	(%rdx,%rax,4), %rax
14552893c:     	movq	%rax, 0x270(%rbp)
145528943:     	movaps	0x2c0(%rbp), %xmm0
14552894a:     	movlps	%xmm0, 0x2d8(%rbp)
145528951:     	movq	%rdi, 0x2e0(%rbp)
145528958:     	leaq	0x270(%rbp), %rax
14552895f:     	movq	%rax, 0x20(%rsp)
145528964:     	movl	$0x7f7fffff, 0x28(%rsp) # imm = 0x7F7FFFFF
14552896c:     	leaq	0xf0(%rbp), %rcx
145528973:     	leaq	0x2d8(%rbp), %rdx
14552897a:     	leaq	-0x8(%rbp), %r8
14552897e:     	movq	%r12, %r9
145528981:     	callq	0x145530800 <.text+0x552f800>
145528986:     	nop
145528987:     	addq	$0xc, %r13
14552898b:     	movq	0x338(%rbp), %rcx
145528992:     	subq	$0x3, %rbx
145528996:     	jae	0x1455288d0 <.text+0x55278d0>
14552899c:     	movq	0x150(%rbp), %rax
1455289a3:     	testq	%rax, %rax
1455289a6:     	je	0x1455289bb <.text+0x55279bb>
1455289a8:     	shlq	$0x2, %rax
1455289ac:     	leaq	(%rax,%rax,2), %rdx
1455289b0:     	movl	$0x4, %r8d
1455289b6:     	callq	0x1400021d0 <.text+0x11d0>
1455289bb:     	movq	0x240(%rbp), %rax
1455289c2:     	testq	%rax, %rax
1455289c5:     	leaq	0x200(%rbp), %r15
1455289cc:     	leaq	0x150(%rbp), %r13
1455289d3:     	je	0x1455289ef <.text+0x55279ef>
1455289d5:     	shlq	$0x2, %rax
1455289d9:     	leaq	(%rax,%rax,2), %rdx
1455289dd:     	movl	$0x4, %r8d
1455289e3:     	movq	0x328(%rbp), %rcx
1455289ea:     	callq	0x1400021d0 <.text+0x11d0>
1455289ef:     	movq	0x258(%rbp), %rdx
1455289f6:     	testq	%rdx, %rdx
1455289f9:     	je	0x145528a11 <.text+0x5527a11>
1455289fb:     	shlq	$0x2, %rdx
1455289ff:     	movl	$0x4, %r8d
145528a05:     	movq	0x320(%rbp), %rcx
145528a0c:     	callq	0x1400021d0 <.text+0x11d0>
145528a11:     	movq	0x310(%rbp), %rcx
145528a18:     	jmp	0x145528779 <.text+0x5527779>
145528a1d:     	movb	$0x1, 0x347(%rbp)
145528a24:     	leaq	0x158(%rbp), %rcx
145528a2b:     	callq	0x1456f8fa0 <.text+0x56f7fa0>
145528a30:     	nop
145528a31:     	movq	0x310(%rbp), %rcx
145528a38:     	jmp	0x145528779 <.text+0x5527779>
145528a3d:     	movq	%rdi, %r14
145528a40:     	imulq	%rdi, %r14
145528a44:     	leaq	(,%r14,4), %rsi
145528a4c:     	movq	%r14, %rax
145528a4f:     	shrq	$0x3e, %rax
145528a53:     	setne	%al
145528a56:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
145528a60:     	cmpq	%rcx, %rsi
145528a63:     	seta	%cl
145528a66:     	orb	%al, %cl
145528a68:     	je	0x145528a84 <.text+0x5527a84>
145528a6a:     	xorl	%ebx, %ebx
145528a6c:     	movb	$0x1, 0x347(%rbp)
145528a73:     	movq	%rbx, %rcx
145528a76:     	movq	%rsi, %rdx
145528a79:     	callq	0x14590379b <.text+0x590279b>
145528a7e:     	nop
145528a7f:     	jmp	0x14552901f <.text+0x552801f>
145528a84:     	testq	%rsi, %rsi
145528a87:     	je	0x145528acf <.text+0x5527acf>
145528a89:     	callq	0x140002200 <.text+0x1200>
145528a8e:     	movl	$0x4, %ebx
145528a93:     	movl	$0x4, %edx
145528a98:     	movq	%rsi, %rcx
145528a9b:     	callq	0x1400021c0 <.text+0x11c0>
145528aa0:     	testq	%rax, %rax
145528aa3:     	je	0x145528a6c <.text+0x5527a6c>
145528aa5:     	movq	%r14, %r11
145528aa8:     	cmpq	$0x2, %r14
145528aac:     	movq	%rax, 0x338(%rbp)
145528ab3:     	movq	%r11, 0x318(%rbp)
145528aba:     	jb	0x145528aeb <.text+0x5527aeb>
145528abc:     	cmpq	$0x9, %r14
145528ac0:     	jae	0x145528b2b <.text+0x5527b2b>
145528ac2:     	movl	$0x1, %ecx
145528ac7:     	movq	%rax, %r10
145528aca:     	jmp	0x145528b69 <.text+0x5527b69>
145528acf:     	movl	$0x4, %eax
145528ad4:     	xorl	%r11d, %r11d
145528ad7:     	cmpq	$0x2, %r14
145528adb:     	movq	%rax, 0x338(%rbp)
145528ae2:     	movq	%r11, 0x318(%rbp)
145528ae9:     	jae	0x145528abc <.text+0x5527abc>
145528aeb:     	movq	%rax, %r10
145528aee:     	testq	%r14, %r14
145528af1:     	jne	0x145528b80 <.text+0x5527b80>
145528af7:     	jmp	0x145528b87 <.text+0x5527b87>
145528afc:     	shll	$0x3, %edi
145528aff:     	xorq	$0x8, %rdi
145528b03:     	callq	0x140002200 <.text+0x1200>
145528b08:     	movl	$0x8, %edx
145528b0d:     	movq	%rdi, %rcx
145528b10:     	callq	0x1400021c0 <.text+0x11c0>
145528b15:     	testq	%rax, %rax
145528b18:     	je	0x145529011 <.text+0x5528011>
145528b1e:     	movq	%rsi, (%rax)
145528b21:     	movl	$0x1, %ecx
145528b26:     	jmp	0x145528516 <.text+0x5527516>
145528b2b:     	leaq	-0x1(%r14), %rdx
145528b2f:     	movq	%rdx, %r8
145528b32:     	andq	$-0x8, %r8
145528b36:     	leaq	(%rax,%r8,4), %r10
145528b3a:     	leaq	0x1(%r8), %rcx
145528b3e:     	xorl	%r9d, %r9d
145528b41:     	movaps	0x6bf298(%rip), %xmm0   # 0x145be7de0
145528b48:     	nopl	(%rax,%rax)
145528b50:     	movups	%xmm0, (%rax,%r9,4)
145528b55:     	movups	%xmm0, 0x10(%rax,%r9,4)
145528b5b:     	addq	$0x8, %r9
145528b5f:     	cmpq	%r9, %r8
145528b62:     	jne	0x145528b50 <.text+0x5527b50>
145528b64:     	cmpq	%r8, %rdx
145528b67:     	je	0x145528b80 <.text+0x5527b80>
145528b69:     	movq	%r14, %rdx
145528b6c:     	subq	%rcx, %rdx
145528b6f:     	nop
145528b70:     	movl	$0x7fc00000, (%r10)     # imm = 0x7FC00000
145528b77:     	addq	$0x4, %r10
145528b7b:     	decq	%rdx
145528b7e:     	jne	0x145528b70 <.text+0x5527b70>
145528b80:     	movl	$0x7fc00000, (%r10)     # imm = 0x7FC00000
145528b87:     	movq	0xf0(%rbp), %rax
145528b8e:     	movq	%rax, 0x310(%rbp)
145528b95:     	movq	0xf8(%rbp), %r13
145528b9c:     	movq	0x100(%rbp), %rax
145528ba3:     	leaq	(,%rax,8), %r12
145528bab:     	addq	%r13, %r12
145528bae:     	xorl	%r15d, %r15d
145528bb1:     	leaq	0x40(%rbp), %rsi
145528bb5:     	movss	0x3ea733(%rip), %xmm6   # 0x1459132f0
145528bbd:     	movss	0x3ea736(%rip), %xmm8   # 0x1459132fc
145528bc6:     	movq	%r13, 0x328(%rbp)
145528bcd:     	nopl	(%rax)
145528bd0:     	cmpq	%r12, %r13
145528bd3:     	je	0x145528ca5 <.text+0x5527ca5>
145528bd9:     	testq	%rdi, %rdi
145528bdc:     	je	0x145528fdb <.text+0x5527fdb>
145528be2:     	movl	(%r13), %ebx
145528be6:     	movss	0x4(%r13), %xmm9
145528bec:     	cmpq	%rdi, %rbx
145528bef:     	jb	0x145528c00 <.text+0x5527c00>
145528bf1:     	movl	%ebx, %eax
145528bf3:     	xorl	%edx, %edx
145528bf5:     	divl	%edi
145528bf7:     	jmp	0x145528c05 <.text+0x5527c05>
145528bf9:     	nopl	(%rax)
145528c00:     	xorl	%eax, %eax
145528c02:     	movq	%rbx, %rdx
145528c05:     	xorps	%xmm1, %xmm1
145528c08:     	cvtsi2ss	%rdx, %xmm1
145528c0d:     	movss	0x3de883(%rip), %xmm0   # 0x145907498
145528c15:     	addss	%xmm0, %xmm1
145528c19:     	mulss	%xmm0, %xmm1
145528c1d:     	xorps	%xmm2, %xmm2
145528c20:     	cvtsi2ss	%rax, %xmm2
145528c25:     	addss	0x2c0(%rbp), %xmm1
145528c2d:     	addss	%xmm0, %xmm2
145528c31:     	mulss	%xmm0, %xmm2
145528c35:     	addss	-0x20(%rbp), %xmm2
145528c3a:     	movq	%rsi, %rcx
145528c3d:     	callq	0x1455264f0 <.text+0x55254f0>
145528c42:     	nop
145528c43:     	addq	$0x8, %r13
145528c47:     	cmpl	$0x1, %eax
145528c4a:     	jne	0x145528bd0 <.text+0x5527bd0>
145528c4c:     	movaps	%xmm0, %xmm1
145528c4f:     	addss	%xmm6, %xmm1
145528c53:     	ucomiss	%xmm1, %xmm9
145528c57:     	addss	%xmm8, %xmm0
145528c5c:     	jbe	0x145528bd0 <.text+0x5527bd0>
145528c62:     	ucomiss	%xmm9, %xmm0
145528c66:     	jb	0x145528bd0 <.text+0x5527bd0>
145528c6c:     	cmpq	%rbx, %r14
145528c6f:     	jbe	0x145528ffc <.text+0x5527ffc>
145528c75:     	movq	0x338(%rbp), %rax
145528c7c:     	movss	(%rax,%rbx,4), %xmm0
145528c81:     	ucomiss	%xmm0, %xmm0
145528c84:     	jp	0x145528c90 <.text+0x5527c90>
145528c86:     	ucomiss	%xmm0, %xmm9
145528c8a:     	jbe	0x145528bd0 <.text+0x5527bd0>
145528c90:     	movq	0x338(%rbp), %rax
145528c97:     	movss	%xmm9, (%rax,%rbx,4)
145528c9d:     	movb	$0x1, %r15b
145528ca0:     	jmp	0x145528bd0 <.text+0x5527bd0>
145528ca5:     	movq	0x310(%rbp), %rdx
145528cac:     	testq	%rdx, %rdx
145528caf:     	je	0x145528cc7 <.text+0x5527cc7>
145528cb1:     	shlq	$0x3, %rdx
145528cb5:     	movl	$0x4, %r8d
145528cbb:     	movq	0x328(%rbp), %rcx
145528cc2:     	callq	0x1400021d0 <.text+0x11d0>
145528cc7:     	testb	$0x1, %r15b
145528ccb:     	je	0x145528cdd <.text+0x5527cdd>
145528ccd:     	movq	0x318(%rbp), %rsi
145528cd4:     	movq	0x338(%rbp), %rbx
145528cdb:     	jmp	0x145528d09 <.text+0x5527d09>
145528cdd:     	movq	$-0x1, %rsi
145528ce4:     	movq	0x318(%rbp), %rdx
145528ceb:     	testq	%rdx, %rdx
145528cee:     	movq	0x338(%rbp), %rbx
145528cf5:     	je	0x145528d09 <.text+0x5527d09>
145528cf7:     	shlq	$0x2, %rdx
145528cfb:     	movl	$0x4, %r8d
145528d01:     	movq	%rbx, %rcx
145528d04:     	callq	0x1400021d0 <.text+0x11d0>
145528d09:     	movq	0x208(%rbp), %rdx
145528d10:     	testq	%rdx, %rdx
145528d13:     	je	0x145528d3f <.text+0x5527d3f>
145528d15:     	leaq	0x13(,%rdx,4), %rax
145528d1d:     	andq	$-0x10, %rax
145528d21:     	addq	%rax, %rdx
145528d24:     	addq	$0x11, %rdx
145528d28:     	je	0x145528d3f <.text+0x5527d3f>
145528d2a:     	movq	0x200(%rbp), %rcx
145528d31:     	subq	%rax, %rcx
145528d34:     	movl	$0x10, %r8d
145528d3a:     	callq	0x1400021d0 <.text+0x11d0>
145528d3f:     	movq	0xc0(%rbp), %rdx
145528d46:     	cmpq	$-0x1, %rdx
145528d4a:     	je	0x145528d67 <.text+0x5527d67>
145528d4c:     	testq	%rdx, %rdx
145528d4f:     	je	0x145528d67 <.text+0x5527d67>
145528d51:     	movq	0xc8(%rbp), %rcx
145528d58:     	shlq	$0x2, %rdx
145528d5c:     	movl	$0x4, %r8d
145528d62:     	callq	0x1400021d0 <.text+0x11d0>
145528d67:     	movq	%rsi, 0xc0(%rbp)
145528d6e:     	movq	%rbx, 0xc8(%rbp)
145528d75:     	movq	%r14, 0xd0(%rbp)
145528d7c:     	movq	%rdi, 0xd8(%rbp)
145528d83:     	movaps	0x2c0(%rbp), %xmm0
145528d8a:     	movlps	%xmm0, 0xe0(%rbp)
145528d91:     	movq	0x120(%rbp), %r14
145528d98:     	movq	0x2a0(%rbp), %rsi
145528d9f:     	leaq	0x40(%rbp), %rdx
145528da3:     	movl	$0xb0, %r8d
145528da9:     	movq	%r14, %rcx
145528dac:     	callq	0x1457731ed <.text+0x57721ed>
145528db1:     	cmpq	$-0x1, %rsi
145528db5:     	je	0x145528e4b <.text+0x5527e4b>
145528dbb:     	movq	0x2b0(%rbp), %rdi
145528dc2:     	testq	%rdi, %rdi
145528dc5:     	je	0x145528e2d <.text+0x5527e2d>
145528dc7:     	movq	0x2a8(%rbp), %rsi
145528dce:     	movq	%rdi, 0x2c0(%rbp)
145528dd5:     	negq	%rdi
145528dd8:     	movl	$0x1, %ecx
145528ddd:     	movq	%rsi, 0x318(%rbp)
145528de4:     	jmp	0x145528e0b <.text+0x5527e0b>
145528de6:     	nopw	%cs:(%rax,%rax)
145528df0:     	movq	0x338(%rbp), %rcx
145528df7:     	leaq	(%rdi,%rcx), %rax
145528dfb:     	incq	%rax
145528dfe:     	incq	%rcx
145528e01:     	addq	$0x8, %rsi
145528e05:     	cmpq	$0x1, %rax
145528e09:     	je	0x145528e26 <.text+0x5527e26>
145528e0b:     	movq	%rcx, 0x338(%rbp)
145528e12:     	movq	(%rsi), %rax
145528e15:     	lock
145528e16:     	decq	(%rax)
145528e19:     	jne	0x145528df0 <.text+0x5527df0>
145528e1b:     	movq	%rsi, %rcx
145528e1e:     	callq	0x1455dae10 <.text+0x55d9e10>
145528e23:     	nop
145528e24:     	jmp	0x145528df0 <.text+0x5527df0>
145528e26:     	movq	0x2a0(%rbp), %rsi
145528e2d:     	testq	%rsi, %rsi
145528e30:     	je	0x145528e4b <.text+0x5527e4b>
145528e32:     	movq	0x2a8(%rbp), %rcx
145528e39:     	shlq	$0x3, %rsi
145528e3d:     	movl	$0x8, %r8d
145528e43:     	movq	%rsi, %rdx
145528e46:     	callq	0x1400021d0 <.text+0x11d0>
145528e4b:     	movq	%r14, %rax
145528e4e:     	movaps	0x350(%rbp), %xmm6
145528e55:     	movaps	0x360(%rbp), %xmm7
145528e5c:     	movaps	0x370(%rbp), %xmm8
145528e64:     	movaps	0x380(%rbp), %xmm9
145528e6c:     	movaps	0x390(%rbp), %xmm10
145528e74:     	movaps	0x3a0(%rbp), %xmm11
145528e7c:     	movaps	0x3b0(%rbp), %xmm12
145528e84:     	movaps	0x3c0(%rbp), %xmm13
145528e8c:     	movaps	0x3d0(%rbp), %xmm14
145528e94:     	movaps	0x3e0(%rbp), %xmm15
145528e9c:     	addq	$0x478, %rsp            # imm = 0x478
145528ea3:     	popq	%rbx
145528ea4:     	popq	%rdi
145528ea5:     	popq	%rsi
145528ea6:     	popq	%r12
145528ea8:     	popq	%r13
145528eaa:     	popq	%r14
145528eac:     	popq	%r15
145528eae:     	popq	%rbp
145528eaf:     	retq
145528eb0:     	xorl	%ecx, %ecx
145528eb2:     	movq	0x328(%rbp), %rdx
145528eb9:     	callq	0x14590379b <.text+0x590279b>
145528ebe:     	nop
145528ebf:     	jmp	0x14552901f <.text+0x552801f>
145528ec4:     	leaq	0x180b9d5(%rip), %r8    # 0x146d348a0
145528ecb:     	movq	%r15, %rdx
145528ece:     	callq	0x145903b33 <.text+0x5902b33>
145528ed3:     	nop
145528ed4:     	jmp	0x14552901f <.text+0x552801f>
145528ed9:     	movb	$0x1, 0x346(%rbp)
145528ee0:     	movq	%rax, %rsi
145528ee3:     	callq	0x145712ca0 <.text+0x5711ca0>
145528ee8:     	nop
145528ee9:     	movq	%rax, %rcx
145528eec:     	movq	%rsi, %rax
145528eef:     	movq	%rcx, (%rsi)
145528ef2:     	movq	%rdx, 0x8(%rsi)
145528ef6:     	movb	$0x1, 0x10(%rsi)
145528efa:     	jmp	0x1455279ad <.text+0x55269ad>
145528eff:     	callq	0x145712ca0 <.text+0x5711ca0>
145528f04:     	nop
145528f05:     	movq	%rax, (%rbx)
145528f08:     	movq	%rdx, 0x8(%rbx)
145528f0c:     	movb	$0x1, 0x10(%rbx)
145528f10:     	jmp	0x1455279fc <.text+0x55269fc>
145528f15:     	leaq	0x180c044(%rip), %r8    # 0x146d34f60
145528f1c:     	movq	0x320(%rbp), %rdx
145528f23:     	callq	0x145903b33 <.text+0x5902b33>
145528f28:     	nop
145528f29:     	jmp	0x14552901f <.text+0x552801f>
145528f2e:     	leaq	0x180ce6b(%rip), %r8    # 0x146d35da0
145528f35:     	movq	%rbx, %rdx
145528f38:     	callq	0x145903b33 <.text+0x5902b33>
145528f3d:     	nop
145528f3e:     	jmp	0x14552901f <.text+0x552801f>
145528f43:     	movb	$0x1, 0x345(%rbp)
145528f4a:     	movq	%rax, %rsi
145528f4d:     	callq	0x145712ca0 <.text+0x5711ca0>
145528f52:     	nop
145528f53:     	movq	%rax, %rcx
145528f56:     	movq	%rsi, %rax
145528f59:     	movq	%rcx, (%rsi)
145528f5c:     	movq	%rdx, 0x8(%rsi)
145528f60:     	movb	$0x1, 0x10(%rsi)
145528f64:     	jmp	0x145528732 <.text+0x5527732>
145528f69:     	leaq	0x180bd58(%rip), %rcx   # 0x146d34cc8
145528f70:     	callq	0x145903e30 <.text+0x5902e30>
145528f75:     	nop
145528f76:     	jmp	0x14552901f <.text+0x552801f>
145528f7b:     	leaq	0x180b8ee(%rip), %r8    # 0x146d34870
145528f82:     	movq	%r15, %rcx
145528f85:     	movq	%r15, %rdx
145528f88:     	callq	0x145903b33 <.text+0x5902b33>
145528f8d:     	nop
145528f8e:     	jmp	0x14552901f <.text+0x552801f>
145528f93:     	leaq	0x180b8ee(%rip), %r8    # 0x146d34888
145528f9a:     	movq	%r9, %rcx
145528f9d:     	callq	0x145903b33 <.text+0x5902b33>
145528fa2:     	nop
145528fa3:     	jmp	0x14552901f <.text+0x552801f>
145528fa5:     	leaq	0x180b994(%rip), %r8    # 0x146d34940
145528fac:     	movq	%r15, %rdx
145528faf:     	callq	0x145903b33 <.text+0x5902b33>
145528fb4:     	nop
145528fb5:     	jmp	0x14552901f <.text+0x552801f>
145528fb7:     	leaq	0x180b96a(%rip), %r8    # 0x146d34928
145528fbe:     	movq	%r15, %rdx
145528fc1:     	callq	0x145903b33 <.text+0x5902b33>
145528fc6:     	nop
145528fc7:     	jmp	0x14552901f <.text+0x552801f>
145528fc9:     	leaq	0x180b940(%rip), %r8    # 0x146d34910
145528fd0:     	movq	%r15, %rdx
145528fd3:     	callq	0x145903b33 <.text+0x5902b33>
145528fd8:     	nop
145528fd9:     	jmp	0x14552901f <.text+0x552801f>
145528fdb:     	leaq	0x180b8fe(%rip), %rcx   # 0x146d348e0
145528fe2:     	callq	0x145903e30 <.text+0x5902e30>
145528fe7:     	nop
145528fe8:     	jmp	0x14552901f <.text+0x552801f>
145528fea:     	leaq	0x180babf(%rip), %r8    # 0x146d34ab0
145528ff1:     	movq	%rsi, %rcx
145528ff4:     	callq	0x145903b33 <.text+0x5902b33>
145528ff9:     	nop
145528ffa:     	jmp	0x14552901f <.text+0x552801f>
145528ffc:     	leaq	0x180b8f5(%rip), %r8    # 0x146d348f8
145529003:     	movq	%rbx, %rcx
145529006:     	movq	%r14, %rdx
145529009:     	callq	0x145903b33 <.text+0x5902b33>
14552900e:     	nop
14552900f:     	jmp	0x14552901f <.text+0x552801f>
145529011:     	movl	$0x8, %ecx
145529016:     	movq	%rdi, %rdx
145529019:     	callq	0x14590379b <.text+0x590279b>
14552901e:     	nop
14552901f:     	ud2
145529021:     	movq	0x320(%rbp), %rax
145529028:     	movq	%rax, 0x328(%rbp)
14552902f:     	movl	$0x1, %ecx
145529034:     	jmp	0x145528eb2 <.text+0x5527eb2>
