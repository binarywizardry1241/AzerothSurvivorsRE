
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454950d0:     	pushq	%rbp
1454950d1:     	pushq	%r15
1454950d3:     	pushq	%r14
1454950d5:     	pushq	%r13
1454950d7:     	pushq	%r12
1454950d9:     	pushq	%rsi
1454950da:     	pushq	%rdi
1454950db:     	pushq	%rbx
1454950dc:     	subq	$0x1e8, %rsp            # imm = 0x1E8
1454950e3:     	leaq	0x80(%rsp), %rbp
1454950eb:     	movaps	%xmm15, 0x150(%rbp)
1454950f3:     	movaps	%xmm14, 0x140(%rbp)
1454950fb:     	movaps	%xmm13, 0x130(%rbp)
145495103:     	movaps	%xmm12, 0x120(%rbp)
14549510b:     	movaps	%xmm11, 0x110(%rbp)
145495113:     	movaps	%xmm10, 0x100(%rbp)
14549511b:     	movaps	%xmm9, 0xf0(%rbp)
145495123:     	movaps	%xmm8, 0xe0(%rbp)
14549512b:     	movaps	%xmm7, 0xd0(%rbp)
145495132:     	movaps	%xmm6, 0xc0(%rbp)
145495139:     	movq	$-0x2, 0xb8(%rbp)
145495144:     	movq	%rcx, %r12
145495147:     	movzbl	0x284(%rcx), %eax
14549514e:     	addb	$-0x2, %al
145495150:     	cmpb	$0x9, %al
145495152:     	ja	0x14549517a <.text+0x549417a>
145495154:     	movzbl	%al, %eax
145495157:     	leaq	0x15178ca(%rip), %rcx   # 0x1469aca28
14549515e:     	movq	(%rcx,%rax,8), %rsi
145495162:     	movzbl	0x285(%r12), %eax
14549516b:     	addb	$-0x2, %al
14549516d:     	cmpb	$0x6, %al
14549516f:     	jbe	0x145495190 <.text+0x5494190>
145495171:     	leaq	0x1282480(%rip), %rdx   # 0x1467175f8
145495178:     	jmp	0x14549519e <.text+0x549419e>
14549517a:     	leaq	0x12835e7(%rip), %rsi   # 0x146718768
145495181:     	movzbl	0x285(%r12), %eax
14549518a:     	addb	$-0x2, %al
14549518c:     	cmpb	$0x6, %al
14549518e:     	ja	0x145495171 <.text+0x5494171>
145495190:     	movzbl	%al, %eax
145495193:     	leaq	0x1517856(%rip), %rcx   # 0x1469ac9f0
14549519a:     	movq	(%rcx,%rax,8), %rdx
14549519e:     	movq	0x6d0(%r12), %r15
1454951a6:     	leaq	(,%r15,8), %rdi
1454951ae:     	movq	%r15, %rax
1454951b1:     	shrq	$0x3d, %rax
1454951b5:     	setne	%al
1454951b8:     	movabsq	$0x7ffffffffffffffc, %rcx # imm = 0x7FFFFFFFFFFFFFFC
1454951c2:     	cmpq	%rcx, %rdi
1454951c5:     	seta	%cl
1454951c8:     	orb	%al, %cl
1454951ca:     	je	0x1454951dc <.text+0x54941dc>
1454951cc:     	xorl	%r14d, %r14d
1454951cf:     	movq	%r14, %rcx
1454951d2:     	movq	%rdi, %rdx
1454951d5:     	callq	0x1458e721b <.text+0x58e621b>
1454951da:     	ud2
1454951dc:     	movq	%rdx, 0x90(%rbp)
1454951e3:     	movq	0x6c8(%r12), %rbx
1454951eb:     	testq	%rdi, %rdi
1454951ee:     	je	0x145495215 <.text+0x5494215>
1454951f0:     	callq	0x140002200 <.text+0x1200>
1454951f5:     	movl	$0x4, %r14d
1454951fb:     	movl	$0x4, %edx
145495200:     	movq	%rdi, %rcx
145495203:     	callq	0x1400021c0 <.text+0x11c0>
145495208:     	testq	%rax, %rax
14549520b:     	je	0x1454951cf <.text+0x54941cf>
14549520d:     	movq	%rax, %r13
145495210:     	movq	%r15, %rax
145495213:     	jmp	0x14549521d <.text+0x549421d>
145495215:     	movl	$0x4, %r13d
14549521b:     	xorl	%eax, %eax
14549521d:     	movq	%rsi, 0x40(%rbp)
145495221:     	movq	%rax, 0x68(%rbp)
145495225:     	movq	%r13, 0x70(%rbp)
145495229:     	movq	$0x0, 0x78(%rbp)
145495231:     	testq	%r15, %r15
145495234:     	je	0x14549524e <.text+0x549424e>
145495236:     	movq	%r13, %rcx
145495239:     	movq	%rax, %rsi
14549523c:     	movq	%rbx, %rdx
14549523f:     	movq	%rdi, %r8
145495242:     	callq	0x145756ddd <.text+0x5755ddd>
145495247:     	movq	%rsi, %rax
14549524a:     	movq	%r15, 0x78(%rbp)
14549524e:     	movq	0x60(%r12), %rbx
145495253:     	testq	%rbx, %rbx
145495256:     	je	0x145495305 <.text+0x5494305>
14549525c:     	movss	0x8e4(%r12), %xmm6
145495266:     	movq	0x58(%r12), %r14
14549526b:     	shlq	$0x4, %rbx
14549526f:     	addq	%r14, %rbx
145495272:     	movq	%r12, %rax
145495275:     	movq	0x6f8(%r12), %r12
14549527d:     	movq	%rax, 0x50(%rbp)
145495281:     	movq	0x700(%rax), %rsi
145495288:     	leaq	0x68(%rbp), %rdi
14549528c:     	jmp	0x1454952af <.text+0x54942af>
14549528e:     	nop
145495290:     	movq	0x70(%rbp), %rax
145495294:     	movb	%r13b, (%rax,%r15,8)
145495298:     	movss	%xmm7, 0x4(%rax,%r15,8)
14549529f:     	incq	%r15
1454952a2:     	movq	%r15, 0x78(%rbp)
1454952a6:     	addq	$0x10, %r14
1454952aa:     	cmpq	%rbx, %r14
1454952ad:     	je	0x1454952f3 <.text+0x54942f3>
1454952af:     	ucomiss	0xc(%r14), %xmm6
1454952b4:     	jae	0x1454952a6 <.text+0x54942a6>
1454952b6:     	movq	(%r14), %rax
1454952b9:     	cmpq	%rsi, %rax
1454952bc:     	jae	0x1454952a6 <.text+0x54942a6>
1454952be:     	shlq	$0x6, %rax
1454952c2:     	cmpb	$0xf, (%r12,%rax)
1454952c7:     	jne	0x1454952a6 <.text+0x54942a6>
1454952c9:     	addq	%r12, %rax
1454952cc:     	movzbl	0x1(%rax), %r13d
1454952d1:     	movl	0x8(%r14), %ecx
1454952d5:     	xorps	%xmm7, %xmm7
1454952d8:     	cvtsi2ss	%rcx, %xmm7
1454952dd:     	mulss	0x4(%rax), %xmm7
1454952e2:     	cmpq	0x68(%rbp), %r15
1454952e6:     	jne	0x145495290 <.text+0x5494290>
1454952e8:     	movq	%rdi, %rcx
1454952eb:     	callq	0x145763de0 <.text+0x5762de0>
1454952f0:     	nop
1454952f1:     	jmp	0x145495290 <.text+0x5494290>
1454952f3:     	movq	0x68(%rbp), %rax
1454952f7:     	movq	%rax, 0x38(%rbp)
1454952fb:     	movq	0x70(%rbp), %r13
1454952ff:     	movq	0x50(%rbp), %r12
145495303:     	jmp	0x145495309 <.text+0x5494309>
145495305:     	movq	%rax, 0x38(%rbp)
145495309:     	movl	0x3f8(%r12), %eax
145495311:     	cvtsi2ss	%rax, %xmm4
145495316:     	addss	0x4561de(%rip), %xmm4   # 0x1458eb4fc
14549531e:     	movss	0x475bd9(%rip), %xmm13  # 0x14590af00
145495327:     	movss	0x72c311(%rip), %xmm6   # 0x145bc1640
14549532f:     	mulss	%xmm4, %xmm6
145495333:     	movss	0x456144(%rip), %xmm15  # 0x1458eb480
14549533c:     	addss	%xmm15, %xmm6
145495341:     	movq	0x40(%rbp), %rsi
145495345:     	movss	0x84(%rsi), %xmm0
14549534d:     	movaps	%xmm0, 0x50(%rbp)
145495351:     	movss	0x4612d7(%rip), %xmm0   # 0x1458f6630
145495359:     	cvttss2si	%xmm4, %rcx
14549535e:     	xorl	%eax, %eax
145495360:     	xorps	%xmm2, %xmm2
145495363:     	xorps	%xmm1, %xmm1
145495366:     	movaps	%xmm1, 0x20(%rbp)
14549536a:     	ucomiss	%xmm2, %xmm4
14549536d:     	cmovbl	%eax, %ecx
145495370:     	mulss	%xmm4, %xmm0
145495374:     	ucomiss	0x4561a1(%rip), %xmm4   # 0x1458eb51c
14549537b:     	movl	$0xffffffff, %edx       # imm = 0xFFFFFFFF
145495380:     	cmovbel	%ecx, %edx
145495383:     	addss	0x46129d(%rip), %xmm0   # 0x1458f6628
14549538b:     	incl	%edx
14549538d:     	movl	$0x88888889, %r8d       # imm = 0x88888889
145495393:     	imulq	%rdx, %r8
145495397:     	shrq	$0x23, %r8
14549539b:     	cmpl	$0x3, %r8d
14549539f:     	movl	$0x3, %ecx
1454953a4:     	cmovbl	%r8d, %ecx
1454953a8:     	movq	0x90(%rbp), %rdx
1454953af:     	movq	0x28(%rdx), %r8
1454953b3:     	testq	%r8, %r8
1454953b6:     	je	0x145495498 <.text+0x5494498>
1454953bc:     	movaps	%xmm15, %xmm8
1454953c0:     	movq	0x20(%rdx), %rdx
1454953c4:     	leaq	(%rdx,%r8,8), %r8
1454953c8:     	movss	0x475b2f(%rip), %xmm14  # 0x14590af00
1454953d1:     	movss	0x46396b(%rip), %xmm1   # 0x1458f8d44
1454953d9:     	movaps	%xmm2, 0x90(%rbp)
1454953e0:     	movss	0x456097(%rip), %xmm9   # 0x1458eb480
1454953e9:     	leaq	0x1517740(%rip), %r9    # 0x1469acb30
1454953f0:     	movaps	%xmm9, %xmm15
1454953f4:     	movaps	%xmm9, %xmm11
1454953f8:     	movaps	%xmm9, %xmm3
1454953fc:     	xorps	%xmm5, %xmm5
1454953ff:     	movaps	%xmm9, %xmm7
145495403:     	xorps	%xmm10, %xmm10
145495407:     	jmp	0x14549541d <.text+0x549441d>
145495409:     	addss	%xmm2, %xmm10
14549540e:     	nop
145495410:     	addq	$0x8, %rdx
145495414:     	cmpq	%r8, %rdx
145495417:     	je	0x1454954c2 <.text+0x54944c2>
14549541d:     	movl	(%rdx), %r10d
145495420:     	movss	0x4(%rdx), %xmm2
145495425:     	movslq	(%r9,%r10,4), %r10
145495429:     	addq	%r9, %r10
14549542c:     	jmpq	*%r10
14549542f:     	addss	%xmm2, %xmm15
145495434:     	jmp	0x145495410 <.text+0x5494410>
145495436:     	addss	%xmm2, %xmm1
14549543a:     	jmp	0x145495410 <.text+0x5494410>
14549543c:     	addss	%xmm2, %xmm7
145495440:     	jmp	0x145495410 <.text+0x5494410>
145495442:     	movaps	0x90(%rbp), %xmm12
14549544a:     	addss	%xmm2, %xmm12
14549544f:     	movaps	%xmm12, 0x90(%rbp)
145495457:     	jmp	0x145495410 <.text+0x5494410>
145495459:     	addss	%xmm2, %xmm11
14549545e:     	jmp	0x145495410 <.text+0x5494410>
145495460:     	addss	%xmm9, %xmm2
145495465:     	mulss	%xmm2, %xmm14
14549546a:     	jmp	0x145495410 <.text+0x5494410>
14549546c:     	addss	%xmm2, %xmm6
145495470:     	jmp	0x145495410 <.text+0x5494410>
145495472:     	movaps	0x50(%rbp), %xmm12
145495477:     	addss	%xmm2, %xmm12
14549547c:     	movaps	%xmm12, 0x50(%rbp)
145495481:     	jmp	0x145495410 <.text+0x5494410>
145495483:     	addss	%xmm2, %xmm0
145495487:     	jmp	0x145495410 <.text+0x5494410>
145495489:     	addss	%xmm2, %xmm5
14549548d:     	jmp	0x145495410 <.text+0x5494410>
14549548f:     	addss	%xmm2, %xmm3
145495493:     	jmp	0x145495410 <.text+0x5494410>
145495498:     	movss	0x4638a4(%rip), %xmm1   # 0x1458f8d44
1454954a0:     	xorps	%xmm10, %xmm10
1454954a4:     	movaps	%xmm15, %xmm7
1454954a8:     	xorps	%xmm5, %xmm5
1454954ab:     	movaps	%xmm15, %xmm3
1454954af:     	movaps	%xmm13, %xmm14
1454954b3:     	movaps	%xmm15, %xmm11
1454954b7:     	movaps	%xmm2, 0x90(%rbp)
1454954be:     	movaps	%xmm15, %xmm8
1454954c2:     	mulss	%xmm13, %xmm4
1454954c7:     	movq	0x2e8(%r12), %rdx
1454954cf:     	testq	%rdx, %rdx
1454954d2:     	movaps	%xmm5, (%rbp)
1454954d6:     	je	0x14549551e <.text+0x549451e>
1454954d8:     	movq	0x2e0(%r12), %r8
1454954e0:     	shlq	$0x3, %rdx
1454954e4:     	xorl	%eax, %eax
1454954e6:     	movss	0x455f91(%rip), %xmm13  # 0x1458eb480
1454954ef:     	movss	0x46112d(%rip), %xmm5   # 0x1458f6624
1454954f7:     	xorps	%xmm2, %xmm2
1454954fa:     	movaps	%xmm2, 0x20(%rbp)
1454954fe:     	movl	(%r8,%rax), %r10d
145495502:     	leaq	0x1517657(%rip), %r9    # 0x1469acb60
145495509:     	movslq	(%r9,%r10,4), %r11
14549550d:     	addq	%r9, %r11
145495510:     	movss	%xmm2, 0xac(%rbp)
145495518:     	xorl	%r10d, %r10d
14549551b:     	jmpq	*%r11
14549551e:     	movss	0x4610fe(%rip), %xmm2   # 0x1458f6624
145495526:     	xorps	%xmm9, %xmm9
14549552a:     	movss	%xmm9, 0xac(%rbp)
145495533:     	movaps	%xmm8, %xmm13
145495537:     	jmp	0x145495539 <.text+0x5494539>
145495539:     	addss	0x80(%rsi), %xmm4
145495541:     	movq	0x2b8(%r12), %r8
145495549:     	xorps	%xmm5, %xmm5
14549554c:     	movss	%xmm5, 0xb0(%rbp)
145495554:     	testq	%r8, %r8
145495557:     	je	0x1454955a2 <.text+0x54945a2>
145495559:     	movaps	%xmm7, 0x10(%rbp)
14549555d:     	movss	%xmm4, 0xb4(%rbp)
145495565:     	movq	0x2b0(%r12), %rdx
14549556d:     	shlq	$0x3, %r8
145495571:     	leaq	(%r8,%r8,2), %r8
145495575:     	xorps	%xmm4, %xmm4
145495578:     	movaps	%xmm4, 0x40(%rbp)
14549557c:     	xorl	%r9d, %r9d
14549557f:     	movss	0x10(%rdx,%r9), %xmm7
145495586:     	movq	(%rdx,%r9), %r11
14549558a:     	movzbl	0x44(%r11), %esi
14549558f:     	leaq	0x15175fe(%rip), %r10   # 0x1469acb94
145495596:     	movslq	(%r10,%rsi,4), %rsi
14549559a:     	addq	%r10, %rsi
14549559d:     	movaps	%xmm2, %xmm5
1454955a0:     	jmpq	*%rsi
1454955a2:     	movaps	%xmm5, 0x40(%rbp)
1454955a6:     	movaps	%xmm5, -0x10(%rbp)
1454955aa:     	movaps	%xmm2, %xmm5
1454955ad:     	movss	0x455f6e(%rip), %xmm9   # 0x1458eb524
1454955b6:     	testq	%r15, %r15
1454955b9:     	jne	0x145495792 <.text+0x5494792>
1454955bf:     	movaps	%xmm5, %xmm8
1454955c3:     	movaps	%xmm3, -0x20(%rbp)
1454955c7:     	movaps	%xmm1, %xmm3
1454955ca:     	movaps	%xmm7, 0x10(%rbp)
1454955ce:     	movaps	%xmm13, -0x30(%rbp)
1454955d3:     	movaps	%xmm10, -0x40(%rbp)
1454955d8:     	movss	%xmm9, 0xb4(%rbp)
1454955e1:     	xorps	%xmm1, %xmm1
1454955e4:     	xorps	%xmm5, %xmm5
1454955e7:     	movaps	%xmm9, %xmm13
1454955eb:     	jmp	0x1454957d2 <.text+0x54947d2>
1454955f0:     	movl	(%r8,%r10), %r11d
1454955f4:     	movslq	(%r9,%r11,4), %r11
1454955f8:     	addq	%r9, %r11
1454955fb:     	jmpq	*%r11
1454955fe:     	addss	0x4(%r8,%r10), %xmm6
145495605:     	addq	$0x8, %r10
145495609:     	cmpq	%r10, %rdx
14549560c:     	jne	0x1454955f0 <.text+0x54945f0>
14549560e:     	jmp	0x145495760 <.text+0x5494760>
145495613:     	addss	0x4(%r8,%r10), %xmm11
14549561a:     	addq	$0x8, %r10
14549561e:     	cmpq	%r10, %rdx
145495621:     	jne	0x1454955f0 <.text+0x54945f0>
145495623:     	jmp	0x145495760 <.text+0x5494760>
145495628:     	addss	0x4(%r8,%r10), %xmm5
14549562f:     	addq	$0x8, %r10
145495633:     	cmpq	%r10, %rdx
145495636:     	jne	0x1454955f0 <.text+0x54945f0>
145495638:     	jmp	0x145495760 <.text+0x5494760>
14549563d:     	movaps	%xmm14, %xmm2
145495641:     	movss	0x4(%r8,%r10), %xmm14
145495648:     	addss	0x455e2f(%rip), %xmm14  # 0x1458eb480
145495651:     	mulss	%xmm2, %xmm14
145495656:     	addq	$0x8, %r10
14549565a:     	cmpq	%r10, %rdx
14549565d:     	jne	0x1454955f0 <.text+0x54945f0>
14549565f:     	jmp	0x145495760 <.text+0x5494760>
145495664:     	addss	0x4(%r8,%r10), %xmm1
14549566b:     	addq	$0x8, %r10
14549566f:     	cmpq	%r10, %rdx
145495672:     	jne	0x1454955f0 <.text+0x54945f0>
145495678:     	jmp	0x145495760 <.text+0x5494760>
14549567d:     	movaps	0x20(%rbp), %xmm2
145495681:     	addss	0x4(%r8,%r10), %xmm2
145495688:     	movaps	%xmm2, 0x20(%rbp)
14549568c:     	addq	$0x8, %r10
145495690:     	cmpq	%r10, %rdx
145495693:     	jne	0x1454955f0 <.text+0x54945f0>
145495699:     	jmp	0x145495760 <.text+0x5494760>
14549569e:     	addss	0x4(%r8,%r10), %xmm13
1454956a5:     	addq	$0x8, %r10
1454956a9:     	cmpq	%r10, %rdx
1454956ac:     	jne	0x1454955f0 <.text+0x54945f0>
1454956b2:     	jmp	0x145495760 <.text+0x5494760>
1454956b7:     	addl	0x4(%r8,%r10), %eax
1454956bc:     	addq	$0x8, %r10
1454956c0:     	cmpq	%r10, %rdx
1454956c3:     	jne	0x1454955f0 <.text+0x54945f0>
1454956c9:     	jmp	0x145495760 <.text+0x5494760>
1454956ce:     	addss	0x4(%r8,%r10), %xmm7
1454956d5:     	addq	$0x8, %r10
1454956d9:     	cmpq	%r10, %rdx
1454956dc:     	jne	0x1454955f0 <.text+0x54945f0>
1454956e2:     	jmp	0x145495760 <.text+0x5494760>
1454956e4:     	movaps	0x90(%rbp), %xmm2
1454956eb:     	addss	0x4(%r8,%r10), %xmm2
1454956f2:     	movaps	%xmm2, 0x90(%rbp)
1454956f9:     	addq	$0x8, %r10
1454956fd:     	cmpq	%r10, %rdx
145495700:     	jne	0x1454955f0 <.text+0x54945f0>
145495706:     	jmp	0x145495760 <.text+0x5494760>
145495708:     	movss	0xac(%rbp), %xmm2
145495710:     	addss	0x4(%r8,%r10), %xmm2
145495717:     	movss	%xmm2, 0xac(%rbp)
14549571f:     	addq	$0x8, %r10
145495723:     	cmpq	%r10, %rdx
145495726:     	jne	0x1454955f0 <.text+0x54945f0>
14549572c:     	jmp	0x145495760 <.text+0x5494760>
14549572e:     	movaps	0x50(%rbp), %xmm2
145495732:     	addss	0x4(%r8,%r10), %xmm2
145495739:     	movaps	%xmm2, 0x50(%rbp)
14549573d:     	addq	$0x8, %r10
145495741:     	cmpq	%r10, %rdx
145495744:     	jne	0x1454955f0 <.text+0x54945f0>
14549574a:     	jmp	0x145495760 <.text+0x5494760>
14549574c:     	addss	0x4(%r8,%r10), %xmm0
145495753:     	addq	$0x8, %r10
145495757:     	cmpq	%r10, %rdx
14549575a:     	jne	0x1454955f0 <.text+0x54945f0>
145495760:     	movaps	%xmm5, %xmm2
145495763:     	jmp	0x145495539 <.text+0x5494539>
145495768:     	minss	0x47578c(%rip), %xmm4   # 0x14590aefc
145495770:     	movaps	%xmm4, -0x10(%rbp)
145495774:     	movss	0xb4(%rbp), %xmm4
14549577c:     	movaps	0x10(%rbp), %xmm7
145495780:     	movss	0x455d9b(%rip), %xmm9   # 0x1458eb524
145495789:     	testq	%r15, %r15
14549578c:     	je	0x1454955bf <.text+0x54945bf>
145495792:     	shlq	$0x3, %r15
145495796:     	movss	0x455d86(%rip), %xmm2   # 0x1458eb524
14549579e:     	movss	%xmm2, 0xb4(%rbp)
1454957a6:     	xorps	%xmm2, %xmm2
1454957a9:     	movss	%xmm2, 0xb0(%rbp)
1454957b1:     	xorl	%edx, %edx
1454957b3:     	movzbl	(%r13,%rdx), %r9d
1454957b9:     	leaq	0x1517420(%rip), %r8    # 0x1469acbe0
1454957c0:     	movslq	(%r8,%r9,4), %r9
1454957c4:     	addq	%r8, %r9
1454957c7:     	xorps	%xmm9, %xmm9
1454957cb:     	xorps	%xmm12, %xmm12
1454957cf:     	jmpq	*%r9
1454957d2:     	movss	0x8e4(%r12), %xmm10
1454957dc:     	movq	0x2f8(%r12), %r8
1454957e4:     	movq	0x300(%r12), %rdx
1454957ec:     	leaq	(%rdx,%rdx,2), %rdx
1454957f0:     	leaq	(%r8,%rdx,8), %rdx
1454957f4:     	movss	0x455c84(%rip), %xmm2   # 0x1458eb480
1454957fc:     	addss	0x40(%rbp), %xmm2
145495801:     	movss	0x455c7e(%rip), %xmm12  # 0x1458eb488
14549580a:     	movq	%r8, %r9
14549580d:     	nopl	(%rax)
145495810:     	cmpq	%rdx, %r9
145495813:     	je	0x145495899 <.text+0x5494899>
145495819:     	leaq	0x18(%r9), %r8
14549581d:     	ucomiss	0x10(%r9), %xmm10
145495822:     	movq	%r8, %r9
145495825:     	jae	0x145495810 <.text+0x5494810>
145495827:     	movl	-0x18(%r8), %r9d
14549582b:     	cmpl	$0x8, %r9d
14549582f:     	je	0x145495872 <.text+0x5494872>
145495831:     	cmpl	$0x9, %r9d
145495835:     	jne	0x145495855 <.text+0x5494855>
145495837:     	movss	-0x14(%r8), %xmm9
14549583d:     	mulss	%xmm2, %xmm9
145495842:     	movaps	0x90(%rbp), %xmm7
145495849:     	addss	%xmm9, %xmm7
14549584e:     	movaps	%xmm7, 0x90(%rbp)
145495855:     	movl	-0xc(%r8), %r9d
145495859:     	cmpl	$0x5bd1, %r9d           # imm = 0x5BD1
145495860:     	je	0x14549588f <.text+0x549488f>
145495862:     	cmpl	$0x5b9b, %r9d           # imm = 0x5B9B
145495869:     	jne	0x14549580a <.text+0x549480a>
14549586b:     	addss	%xmm13, %xmm11
145495870:     	jmp	0x14549580a <.text+0x549480a>
145495872:     	movss	-0x14(%r8), %xmm9
145495878:     	mulss	%xmm2, %xmm9
14549587d:     	addss	%xmm9, %xmm6
145495882:     	movl	-0xc(%r8), %r9d
145495886:     	cmpl	$0x5bd1, %r9d           # imm = 0x5BD1
14549588d:     	jne	0x145495862 <.text+0x5494862>
14549588f:     	addss	%xmm12, %xmm6
145495894:     	jmp	0x14549580a <.text+0x549480a>
145495899:     	addss	0xac(%rbp), %xmm4
1454958a1:     	mulss	%xmm15, %xmm4
1454958a6:     	mulss	%xmm4, %xmm5
1454958aa:     	addss	%xmm5, %xmm0
1454958ae:     	movss	0x455bc9(%rip), %xmm10  # 0x1458eb480
1454958b7:     	movaps	0x90(%rbp), %xmm7
1454958be:     	addss	%xmm10, %xmm7
1454958c3:     	xorl	%edx, %edx
1454958c5:     	ucomiss	%xmm10, %xmm3
1454958c9:     	divss	%xmm7, %xmm10
1454958ce:     	movaps	0x50(%rbp), %xmm12
1454958d3:     	movaps	%xmm12, %xmm13
1454958d7:     	movss	0xb4(%rbp), %xmm7
1454958df:     	subss	%xmm7, %xmm13
1454958e4:     	movaps	%xmm12, %xmm2
1454958e8:     	minss	%xmm7, %xmm2
1454958ec:     	movaps	%xmm2, %xmm9
1454958f0:     	cmpunordss	%xmm2, %xmm9
1454958f6:     	movaps	%xmm9, %xmm7
1454958fa:     	andnps	%xmm2, %xmm7
1454958fd:     	andps	%xmm12, %xmm9
145495901:     	orps	%xmm7, %xmm9
145495905:     	movaps	%xmm9, %xmm7
145495909:     	mulss	%xmm1, %xmm9
14549590e:     	xorps	%xmm2, %xmm2
145495911:     	maxss	%xmm2, %xmm13
145495916:     	divss	0x4634c1(%rip), %xmm9   # 0x1458f8de0
14549591f:     	movss	0xb0(%rbp), %xmm12
145495928:     	mulss	%xmm13, %xmm12
14549592d:     	addss	%xmm12, %xmm9
145495932:     	addss	%xmm6, %xmm9
145495937:     	movaps	%xmm4, %xmm13
14549593b:     	subss	0x458(%r12), %xmm13
145495945:     	movaps	%xmm4, %xmm6
145495948:     	movss	%xmm4, 0x458(%r12)
145495952:     	movss	%xmm9, 0x45c(%r12)
14549595c:     	movss	%xmm10, 0x460(%r12)
145495966:     	movss	0x455b8d(%rip), %xmm9   # 0x1458eb4fc
14549596f:     	addss	%xmm3, %xmm9
145495974:     	addss	%xmm8, %xmm9
145495979:     	movaps	0x594ccf(%rip), %xmm10  # 0x145a2a650
145495981:     	unpcklps	%xmm9, %xmm10           # xmm10 = xmm10[0],xmm9[0],xmm10[1],xmm9[1]
145495985:     	seta	%dl
145495988:     	unpcklps	%xmm8, %xmm3            # xmm3 = xmm3[0],xmm8[0],xmm3[1],xmm8[1]
14549598c:     	movd	%edx, %xmm9
145495991:     	pshufd	$0x0, %xmm9, %xmm9      # xmm9 = xmm9[0,0,0,0]
145495997:     	pslld	$0x1f, %xmm9
14549599d:     	psrad	$0x1f, %xmm9
1454959a3:     	andps	%xmm9, %xmm10
1454959a7:     	andnps	%xmm3, %xmm9
1454959ab:     	orps	%xmm10, %xmm9
1454959af:     	movlps	%xmm9, 0x464(%r12)
1454959b8:     	minss	0x57bd17(%rip), %xmm11  # 0x145a116d8
1454959c1:     	movaps	%xmm11, %xmm5
1454959c5:     	movss	%xmm11, 0x46c(%r12)
1454959cf:     	movss	%xmm14, 0x470(%r12)
1454959d9:     	movaps	-0x20(%rbp), %xmm1
1454959dd:     	movss	%xmm1, 0x474(%r12)
1454959e7:     	movss	%xmm7, 0x478(%r12)
1454959f1:     	movss	%xmm0, 0x47c(%r12)
1454959fb:     	movaps	-0x30(%rbp), %xmm0
1454959ff:     	movss	%xmm0, 0x480(%r12)
145495a09:     	movaps	(%rbp), %xmm0
145495a0d:     	movss	%xmm0, 0x484(%r12)
145495a17:     	movaps	0x10(%rbp), %xmm0
145495a1b:     	movss	%xmm0, 0x488(%r12)
145495a25:     	movl	%eax, 0x48c(%r12)
145495a2d:     	movaps	0x20(%rbp), %xmm0
145495a31:     	movss	%xmm0, 0x490(%r12)
145495a3b:     	movaps	-0x40(%rbp), %xmm0
145495a3f:     	movss	%xmm0, 0x494(%r12)
145495a49:     	movaps	0x40(%rbp), %xmm0
145495a4d:     	movss	%xmm0, 0x498(%r12)
145495a57:     	movl	%ecx, 0x49c(%r12)
145495a5f:     	movaps	-0x10(%rbp), %xmm0
145495a63:     	movss	%xmm0, 0x4a0(%r12)
145495a6d:     	ucomiss	%xmm2, %xmm13
145495a71:     	movss	0x400(%r12), %xmm1
145495a7b:     	jbe	0x145495a8c <.text+0x5494a8c>
145495a7d:     	addss	%xmm13, %xmm1
145495a82:     	movss	%xmm1, 0x400(%r12)
145495a8c:     	movq	%r13, 0x90(%rbp)
145495a93:     	movaps	%xmm1, %xmm2
145495a96:     	minss	%xmm6, %xmm2
145495a9a:     	movaps	%xmm2, %xmm0
145495a9d:     	cmpunordss	%xmm2, %xmm0
145495aa2:     	movaps	%xmm0, %xmm4
145495aa5:     	andnps	%xmm2, %xmm4
145495aa8:     	andps	%xmm1, %xmm0
145495aab:     	orps	%xmm4, %xmm0
145495aae:     	movss	%xmm0, 0x400(%r12)
145495ab8:     	movaps	%xmm5, %xmm3
145495abb:     	mulss	0x46a5cd(%rip), %xmm3   # 0x145900090
145495ac3:     	movaps	%xmm3, %xmm1
145495ac6:     	subss	0x4b8(%r12), %xmm1
145495ad0:     	andps	0x475459(%rip), %xmm1   # 0x14590af30
145495ad7:     	ucomiss	0x4b9832(%rip), %xmm1   # 0x14594f310
145495ade:     	jbe	0x145495b73 <.text+0x5494b73>
145495ae4:     	movss	%xmm3, 0x4b8(%r12)
145495aee:     	movl	0x4b4(%r12), %r8d
145495af6:     	leal	0x1(%r8), %eax
145495afa:     	movl	%eax, 0x4b4(%r12)
145495b02:     	movq	0x3d0(%r12), %rdx
145495b0a:     	leaq	0x68(%rbp), %rcx
145495b0e:     	callq	0x1454437e0 <.text+0x54427e0>
145495b13:     	nop
145495b14:     	movq	0x548(%r12), %rsi
145495b1c:     	cmpq	0x538(%r12), %rsi
145495b24:     	jne	0x145495b34 <.text+0x5494b34>
145495b26:     	leaq	0x538(%r12), %rcx
145495b2e:     	callq	0x1457580b0 <.text+0x57570b0>
145495b33:     	nop
145495b34:     	movq	0x540(%r12), %rax
145495b3c:     	movq	%rsi, %rcx
145495b3f:     	shlq	$0x5, %rcx
145495b43:     	movups	0x68(%rbp), %xmm0
145495b47:     	movups	0x78(%rbp), %xmm1
145495b4b:     	movups	%xmm1, 0x10(%rax,%rcx)
145495b50:     	movups	%xmm0, (%rax,%rcx)
145495b54:     	incq	%rsi
145495b57:     	movq	%rsi, 0x548(%r12)
145495b5f:     	movss	0x400(%r12), %xmm0
145495b69:     	movss	0x458(%r12), %xmm6
145495b73:     	xorps	%xmm7, %xmm7
145495b76:     	maxss	%xmm7, %xmm0
145495b7a:     	callq	0x145756e6d <.text+0x5755e6d>
145495b7f:     	cvttss2si	%xmm0, %rax
145495b84:     	xorl	%ecx, %ecx
145495b86:     	ucomiss	%xmm7, %xmm0
145495b89:     	cmovbl	%ecx, %eax
145495b8c:     	ucomiss	0x455989(%rip), %xmm0   # 0x1458eb51c
145495b93:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
145495b99:     	cmovbel	%eax, %r8d
145495b9d:     	leaq	0x8b8(%r12), %rdi
145495ba5:     	movq	0x8b8(%r12), %rax
145495bad:     	testq	%rax, %rax
145495bb0:     	je	0x145495c17 <.text+0x5494c17>
145495bb2:     	movq	0x8c0(%r12), %rcx
145495bba:     	movw	$0x16, %dx
145495bbe:     	movzwl	0x36(%rax), %r10d
145495bc3:     	movl	%r10d, %r11d
145495bc6:     	addl	%r11d, %r11d
145495bc9:     	movq	$-0x1, %r9
145495bd0:     	testq	%r11, %r11
145495bd3:     	je	0x145495c00 <.text+0x5494c00>
145495bd5:     	cmpw	0x3a(%rax,%r9,2), %dx
145495bdb:     	seta	%bl
145495bde:     	sbbb	$0x0, %bl
145495be1:     	incq	%r9
145495be4:     	addq	$-0x2, %r11
145495be8:     	cmpb	$0x1, %bl
145495beb:     	je	0x145495bd0 <.text+0x5494bd0>
145495bed:     	movzbl	%bl, %r10d
145495bf1:     	testl	%r10d, %r10d
145495bf4:     	je	0x145495c10 <.text+0x5494c10>
145495bf6:     	jmp	0x145495c03 <.text+0x5494c03>
145495bf8:     	nopl	(%rax,%rax)
145495c00:     	movq	%r10, %r9
145495c03:     	subq	$0x1, %rcx
145495c07:     	jb	0x145495c19 <.text+0x5494c19>
145495c09:     	movq	0x50(%rax,%r9,8), %rax
145495c0e:     	jmp	0x145495bbe <.text+0x5494bbe>
145495c10:     	movl	%r8d, 0x8(%rax,%r9,4)
145495c15:     	jmp	0x145495c49 <.text+0x5494c49>
145495c17:     	xorl	%eax, %eax
145495c19:     	movq	%rdi, 0x68(%rbp)
145495c1d:     	movq	%rax, 0x70(%rbp)
145495c21:     	movq	$0x0, 0x78(%rbp)
145495c29:     	movq	%r9, 0x80(%rbp)
145495c30:     	movq	$0x16, 0x88(%rbp)
145495c3b:     	leaq	-0x60(%rbp), %rcx
145495c3f:     	leaq	0x68(%rbp), %rdx
145495c43:     	callq	0x145427a50 <.text+0x5426a50>
145495c48:     	nop
145495c49:     	movaps	%xmm6, %xmm0
145495c4c:     	callq	0x145756e6d <.text+0x5755e6d>
145495c51:     	cvttss2si	%xmm0, %rax
145495c56:     	xorl	%ecx, %ecx
145495c58:     	xorps	%xmm1, %xmm1
145495c5b:     	ucomiss	%xmm1, %xmm0
145495c5e:     	cmovbl	%ecx, %eax
145495c61:     	ucomiss	0x4558b4(%rip), %xmm0   # 0x1458eb51c
145495c68:     	movl	$0xffffffff, %r8d       # imm = 0xFFFFFFFF
145495c6e:     	cmovbel	%eax, %r8d
145495c72:     	movq	(%rdi), %rax
145495c75:     	testq	%rax, %rax
145495c78:     	je	0x145495ce7 <.text+0x5494ce7>
145495c7a:     	movq	0x8c0(%r12), %rcx
145495c82:     	movw	$0x1c, %dx
145495c86:     	movzwl	0x36(%rax), %r10d
145495c8b:     	movl	%r10d, %r11d
145495c8e:     	addl	%r11d, %r11d
145495c91:     	movq	$-0x1, %r9
145495c98:     	nopl	(%rax,%rax)
145495ca0:     	testq	%r11, %r11
145495ca3:     	je	0x145495cd0 <.text+0x5494cd0>
145495ca5:     	cmpw	0x3a(%rax,%r9,2), %dx
145495cab:     	seta	%bl
145495cae:     	sbbb	$0x0, %bl
145495cb1:     	incq	%r9
145495cb4:     	addq	$-0x2, %r11
145495cb8:     	cmpb	$0x1, %bl
145495cbb:     	je	0x145495ca0 <.text+0x5494ca0>
145495cbd:     	movzbl	%bl, %r10d
145495cc1:     	testl	%r10d, %r10d
145495cc4:     	je	0x145495ce0 <.text+0x5494ce0>
145495cc6:     	jmp	0x145495cd3 <.text+0x5494cd3>
145495cc8:     	nopl	(%rax,%rax)
145495cd0:     	movq	%r10, %r9
145495cd3:     	subq	$0x1, %rcx
145495cd7:     	jb	0x145495ce9 <.text+0x5494ce9>
145495cd9:     	movq	0x50(%rax,%r9,8), %rax
145495cde:     	jmp	0x145495c86 <.text+0x5494c86>
145495ce0:     	movl	%r8d, 0x8(%rax,%r9,4)
145495ce5:     	jmp	0x145495d19 <.text+0x5494d19>
145495ce7:     	xorl	%eax, %eax
145495ce9:     	movq	%rdi, 0x68(%rbp)
145495ced:     	movq	%rax, 0x70(%rbp)
145495cf1:     	movq	$0x0, 0x78(%rbp)
145495cf9:     	movq	%r9, 0x80(%rbp)
145495d00:     	movq	$0x1c, 0x88(%rbp)
145495d0b:     	leaq	-0x60(%rbp), %rcx
145495d0f:     	leaq	0x68(%rbp), %rdx
145495d13:     	callq	0x145427a50 <.text+0x5426a50>
145495d18:     	nop
145495d19:     	movss	0x464(%r12), %xmm0
145495d23:     	mulss	0x455801(%rip), %xmm0   # 0x1458eb52c
145495d2b:     	movq	0x8b8(%r12), %rax
145495d33:     	testq	%rax, %rax
145495d36:     	je	0x145495e35 <.text+0x5494e35>
145495d3c:     	movq	0x8c0(%r12), %rsi
145495d44:     	movl	$0x455, %edx            # imm = 0x455
145495d49:     	movq	0x90(%rbp), %rcx
145495d50:     	movzwl	0x36(%rax), %r8d
145495d55:     	movl	%r8d, %r10d
145495d58:     	addl	%r10d, %r10d
145495d5b:     	movq	$-0x1, %r9
145495d62:     	nopw	%cs:(%rax,%rax)
145495d70:     	testq	%r10, %r10
145495d73:     	je	0x145495da0 <.text+0x5494da0>
145495d75:     	movzwl	0x3a(%rax,%r9,2), %r11d
145495d7b:     	cmpl	%r11d, %edx
145495d7e:     	seta	%r11b
145495d82:     	sbbb	$0x0, %r11b
145495d86:     	incq	%r9
145495d89:     	addq	$-0x2, %r10
145495d8d:     	cmpb	$0x1, %r11b
145495d91:     	je	0x145495d70 <.text+0x5494d70>
145495d93:     	movzbl	%r11b, %r8d
145495d97:     	testl	%r8d, %r8d
145495d9a:     	je	0x145495db4 <.text+0x5494db4>
145495d9c:     	jmp	0x145495da3 <.text+0x5494da3>
145495d9e:     	nop
145495da0:     	movq	%r8, %r9
145495da3:     	subq	$0x1, %rsi
145495da7:     	jb	0x145495e37 <.text+0x5494e37>
145495dad:     	movq	0x50(%rax,%r9,8), %rax
145495db2:     	jmp	0x145495d50 <.text+0x5494d50>
145495db4:     	movss	%xmm0, 0x8(%rax,%r9,4)
145495dbb:     	movq	0x38(%rbp), %rdx
145495dbf:     	testq	%rdx, %rdx
145495dc2:     	je	0x145495dd3 <.text+0x5494dd3>
145495dc4:     	shlq	$0x3, %rdx
145495dc8:     	movl	$0x4, %r8d
145495dce:     	callq	0x1400021d0 <.text+0x11d0>
145495dd3:     	movaps	0xc0(%rbp), %xmm6
145495dda:     	movaps	0xd0(%rbp), %xmm7
145495de1:     	movaps	0xe0(%rbp), %xmm8
145495de9:     	movaps	0xf0(%rbp), %xmm9
145495df1:     	movaps	0x100(%rbp), %xmm10
145495df9:     	movaps	0x110(%rbp), %xmm11
145495e01:     	movaps	0x120(%rbp), %xmm12
145495e09:     	movaps	0x130(%rbp), %xmm13
145495e11:     	movaps	0x140(%rbp), %xmm14
145495e19:     	movaps	0x150(%rbp), %xmm15
145495e21:     	addq	$0x1e8, %rsp            # imm = 0x1E8
145495e28:     	popq	%rbx
145495e29:     	popq	%rdi
145495e2a:     	popq	%rsi
145495e2b:     	popq	%r12
145495e2d:     	popq	%r13
145495e2f:     	popq	%r14
145495e31:     	popq	%r15
145495e33:     	popq	%rbp
145495e34:     	retq
145495e35:     	xorl	%eax, %eax
145495e37:     	movd	%xmm0, %r8d
145495e3c:     	movq	%rdi, 0x68(%rbp)
145495e40:     	movq	%rax, 0x70(%rbp)
145495e44:     	movq	$0x0, 0x78(%rbp)
145495e4c:     	movq	%r9, 0x80(%rbp)
145495e53:     	movq	$0x455, 0x88(%rbp)      # imm = 0x455
145495e5e:     	leaq	-0x60(%rbp), %rcx
145495e62:     	leaq	0x68(%rbp), %rdx
145495e66:     	callq	0x145427a50 <.text+0x5426a50>
145495e6b:     	nop
145495e6c:     	movq	0x90(%rbp), %rcx
145495e73:     	movq	0x38(%rbp), %rdx
145495e77:     	testq	%rdx, %rdx
145495e7a:     	jne	0x145495dc4 <.text+0x5494dc4>
145495e80:     	jmp	0x145495dd3 <.text+0x5494dd3>
145495e85:     	addss	%xmm7, %xmm6
145495e89:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495e8e:     	movaps	0x90(%rbp), %xmm2
145495e95:     	addss	%xmm7, %xmm2
145495e99:     	movaps	%xmm2, 0x90(%rbp)
145495ea0:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495ea5:     	addss	%xmm7, %xmm15
145495eaa:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495eaf:     	addss	%xmm7, %xmm1
145495eb3:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495eb8:     	addss	%xmm7, %xmm5
145495ebc:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495ec1:     	movaps	%xmm4, -0x10(%rbp)
145495ec5:     	movaps	0x50(%rbp), %xmm12
145495eca:     	movss	0x40(%r11), %xmm9
145495ed0:     	mulss	0x460753(%rip), %xmm9   # 0x1458f662c
145495ed9:     	movaps	%xmm15, %xmm8
145495edd:     	movaps	%xmm14, %xmm15
145495ee1:     	movaps	%xmm3, %xmm14
145495ee5:     	movaps	%xmm11, %xmm3
145495ee9:     	movaps	%xmm6, %xmm11
145495eed:     	movaps	%xmm0, %xmm6
145495ef0:     	movaps	%xmm7, %xmm0
145495ef3:     	minss	%xmm9, %xmm0
145495ef8:     	movaps	%xmm10, %xmm2
145495efc:     	movaps	%xmm0, %xmm10
145495f00:     	cmpunordss	%xmm0, %xmm10
145495f06:     	movaps	%xmm10, %xmm9
145495f0a:     	andnps	%xmm0, %xmm9
145495f0e:     	movaps	%xmm6, %xmm0
145495f11:     	movaps	%xmm11, %xmm6
145495f15:     	movaps	%xmm3, %xmm11
145495f19:     	movaps	%xmm14, %xmm3
145495f1d:     	movaps	%xmm15, %xmm14
145495f21:     	movaps	%xmm8, %xmm15
145495f25:     	andps	%xmm7, %xmm10
145495f29:     	orps	%xmm9, %xmm10
145495f2d:     	movaps	%xmm10, %xmm4
145495f31:     	movaps	%xmm2, %xmm10
145495f35:     	addss	%xmm12, %xmm4
145495f3a:     	movaps	%xmm4, 0x50(%rbp)
145495f3e:     	movaps	-0x10(%rbp), %xmm4
145495f42:     	mulss	0x4555ae(%rip), %xmm7   # 0x1458eb4f8
145495f4a:     	addss	%xmm7, %xmm15
145495f4f:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495f51:     	addss	%xmm7, %xmm0
145495f55:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495f57:     	addss	%xmm7, %xmm13
145495f5c:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495f5e:     	movaps	0x20(%rbp), %xmm2
145495f62:     	addss	%xmm7, %xmm2
145495f66:     	movaps	%xmm2, 0x20(%rbp)
145495f6a:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495f6c:     	addss	%xmm7, %xmm11
145495f71:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495f73:     	addss	0x455505(%rip), %xmm7   # 0x1458eb480
145495f7b:     	mulss	%xmm7, %xmm14
145495f80:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495f82:     	addss	%xmm7, %xmm3
145495f86:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495f88:     	movaps	0x10(%rbp), %xmm2
145495f8c:     	addss	%xmm7, %xmm2
145495f90:     	movaps	%xmm2, 0x10(%rbp)
145495f94:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495f96:     	movaps	(%rbp), %xmm2
145495f9a:     	addss	%xmm7, %xmm2
145495f9e:     	movaps	%xmm2, (%rbp)
145495fa2:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495fa4:     	addss	%xmm7, %xmm10
145495fa9:     	nopl	(%rax)
145495fb0:     	addq	$0x18, %r9
145495fb4:     	cmpq	%r9, %r8
145495fb7:     	je	0x145495768 <.text+0x5494768>
145495fbd:     	movss	0x10(%rdx,%r9), %xmm7
145495fc4:     	movq	(%rdx,%r9), %r11
145495fc8:     	movzbl	0x44(%r11), %esi
145495fcd:     	movslq	(%r10,%rsi,4), %rsi
145495fd1:     	addq	%r10, %rsi
145495fd4:     	jmpq	*%rsi
145495fd6:     	movaps	0x40(%rbp), %xmm2
145495fda:     	addss	%xmm7, %xmm2
145495fde:     	movaps	%xmm2, 0x40(%rbp)
145495fe2:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495fe4:     	addss	%xmm7, %xmm4
145495fe8:     	jmp	0x145495fb0 <.text+0x5494fb0>
145495fea:     	nopw	(%rax,%rax)
145495ff0:     	addq	$0x8, %rdx
145495ff4:     	cmpq	%rdx, %r15
145495ff7:     	je	0x145496148 <.text+0x5495148>
145495ffd:     	movzbl	(%r13,%rdx), %r9d
145496003:     	movslq	(%r8,%r9,4), %r9
145496007:     	addq	%r8, %r9
14549600a:     	jmpq	*%r9
14549600d:     	addss	0x4(%r13,%rdx), %xmm6
145496014:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496016:     	addss	0x4(%r13,%rdx), %xmm9
14549601d:     	jmp	0x145495ff0 <.text+0x5494ff0>
14549601f:     	movaps	0x40(%rbp), %xmm2
145496023:     	addss	0x4(%r13,%rdx), %xmm2
14549602a:     	movaps	%xmm2, 0x40(%rbp)
14549602e:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496030:     	movaps	(%rbp), %xmm2
145496034:     	addss	0x4(%r13,%rdx), %xmm2
14549603b:     	movaps	%xmm2, (%rbp)
14549603f:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496041:     	movaps	0x50(%rbp), %xmm2
145496045:     	addss	0x4(%r13,%rdx), %xmm2
14549604c:     	movaps	%xmm2, 0x50(%rbp)
145496050:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496052:     	movaps	0x20(%rbp), %xmm2
145496056:     	addss	0x4(%r13,%rdx), %xmm2
14549605d:     	movaps	%xmm2, 0x20(%rbp)
145496061:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496063:     	addss	0x4(%r13,%rdx), %xmm3
14549606a:     	jmp	0x145495ff0 <.text+0x5494ff0>
14549606c:     	addss	0x4(%r13,%rdx), %xmm1
145496073:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496078:     	addss	0x4(%r13,%rdx), %xmm12
14549607f:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496084:     	addss	0x4(%r13,%rdx), %xmm5
14549608b:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496090:     	addss	0x4(%r13,%rdx), %xmm13
145496097:     	jmp	0x145495ff0 <.text+0x5494ff0>
14549609c:     	movaps	0x90(%rbp), %xmm2
1454960a3:     	addss	0x4(%r13,%rdx), %xmm2
1454960aa:     	movaps	%xmm2, 0x90(%rbp)
1454960b1:     	jmp	0x145495ff0 <.text+0x5494ff0>
1454960b6:     	addss	0x4(%r13,%rdx), %xmm15
1454960bd:     	jmp	0x145495ff0 <.text+0x5494ff0>
1454960c2:     	movss	0xb0(%rbp), %xmm2
1454960ca:     	addss	0x4(%r13,%rdx), %xmm2
1454960d1:     	movss	%xmm2, 0xb0(%rbp)
1454960d9:     	jmp	0x145495ff0 <.text+0x5494ff0>
1454960de:     	addss	0x4(%r13,%rdx), %xmm0
1454960e5:     	jmp	0x145495ff0 <.text+0x5494ff0>
1454960ea:     	addss	0x4(%r13,%rdx), %xmm10
1454960f1:     	jmp	0x145495ff0 <.text+0x5494ff0>
1454960f6:     	addss	0x4(%r13,%rdx), %xmm11
1454960fd:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496102:     	movss	0xb4(%rbp), %xmm2
14549610a:     	addss	0x4(%r13,%rdx), %xmm2
145496111:     	movss	%xmm2, 0xb4(%rbp)
145496119:     	jmp	0x145495ff0 <.text+0x5494ff0>
14549611e:     	addss	0x4(%r13,%rdx), %xmm7
145496125:     	jmp	0x145495ff0 <.text+0x5494ff0>
14549612a:     	movaps	%xmm14, %xmm2
14549612e:     	movss	0x4(%r13,%rdx), %xmm14
145496135:     	addss	0x455342(%rip), %xmm14  # 0x1458eb480
14549613e:     	mulss	%xmm2, %xmm14
145496143:     	jmp	0x145495ff0 <.text+0x5494ff0>
145496148:     	movaps	%xmm5, %xmm8
14549614c:     	movaps	%xmm12, %xmm5
145496150:     	movaps	%xmm1, %xmm12
145496154:     	movaps	%xmm9, %xmm1
145496158:     	movaps	%xmm3, -0x20(%rbp)
14549615c:     	movaps	%xmm12, %xmm3
145496160:     	movaps	%xmm7, 0x10(%rbp)
145496164:     	movaps	%xmm13, -0x30(%rbp)
145496169:     	movaps	%xmm10, -0x40(%rbp)
14549616e:     	movss	0x4553ad(%rip), %xmm13  # 0x1458eb524
145496177:     	jmp	0x1454957d2 <.text+0x54947d2>
