
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145524fa0:     	pushq	%rbp
145524fa1:     	pushq	%r15
145524fa3:     	pushq	%r14
145524fa5:     	pushq	%r13
145524fa7:     	pushq	%r12
145524fa9:     	pushq	%rsi
145524faa:     	pushq	%rdi
145524fab:     	pushq	%rbx
145524fac:     	subq	$0x178, %rsp            # imm = 0x178
145524fb3:     	leaq	0x80(%rsp), %rbp
145524fbb:     	movaps	%xmm15, 0xe0(%rbp)
145524fc3:     	movaps	%xmm14, 0xd0(%rbp)
145524fcb:     	movaps	%xmm13, 0xc0(%rbp)
145524fd3:     	movaps	%xmm12, 0xb0(%rbp)
145524fdb:     	movaps	%xmm11, 0xa0(%rbp)
145524fe3:     	movaps	%xmm10, 0x90(%rbp)
145524feb:     	movaps	%xmm9, 0x80(%rbp)
145524ff3:     	movaps	%xmm8, 0x70(%rbp)
145524ff8:     	movaps	%xmm7, 0x60(%rbp)
145524ffc:     	movaps	%xmm6, 0x50(%rbp)
145525000:     	movq	$-0x2, 0x48(%rbp)
145525008:     	movq	%r8, %rax
14552500b:     	movq	%rdx, %rbx
14552500e:     	movq	%rcx, %rdi
145525011:     	movq	0x170(%rbp), %rsi
145525018:     	movq	0x168(%rbp), %r14
14552501f:     	movss	0x160(%rbp), %xmm0
145525027:     	movq	0x8(%rdx), %rdx
14552502b:     	movq	0x10(%rbx), %r8
14552502f:     	movss	%xmm0, 0x28(%rsp)
145525035:     	movq	%r9, 0x20(%rsp)
14552503a:     	leaq	-0x20(%rbp), %rcx
14552503e:     	movq	%rax, %r9
145525041:     	callq	0x145530130 <.text+0x552f130>
145525046:     	movabsq	$-0x5555555555555555, %rax # imm = 0xAAAAAAAAAAAAAAAB
145525050:     	mulq	0x28(%rbx)
145525054:     	shrq	%rdx
145525057:     	leaq	(%rdx,%rdx,2), %r8
14552505b:     	cmpq	$0x3, %r8
14552505f:     	jae	0x1455250dd <.text+0x55240dd>
145525061:     	movq	-0x20(%rbp), %rax
145525065:     	testq	%rax, %rax
145525068:     	je	0x1455250f5 <.text+0x55240f5>
14552506e:     	movq	-0x18(%rbp), %rcx
145525072:     	shlq	$0x2, %rax
145525076:     	leaq	(%rax,%rax,2), %rdx
14552507a:     	movl	$0x4, %r8d
145525080:     	movaps	0x50(%rbp), %xmm6
145525084:     	movaps	0x60(%rbp), %xmm7
145525088:     	movaps	0x70(%rbp), %xmm8
14552508d:     	movaps	0x80(%rbp), %xmm9
145525095:     	movaps	0x90(%rbp), %xmm10
14552509d:     	movaps	0xa0(%rbp), %xmm11
1455250a5:     	movaps	0xb0(%rbp), %xmm12
1455250ad:     	movaps	0xc0(%rbp), %xmm13
1455250b5:     	movaps	0xd0(%rbp), %xmm14
1455250bd:     	movaps	0xe0(%rbp), %xmm15
1455250c5:     	addq	$0x178, %rsp            # imm = 0x178
1455250cc:     	popq	%rbx
1455250cd:     	popq	%rdi
1455250ce:     	popq	%rsi
1455250cf:     	popq	%r12
1455250d1:     	popq	%r13
1455250d3:     	popq	%r14
1455250d5:     	popq	%r15
1455250d7:     	popq	%rbp
1455250d8:     	jmp	0x1400021d0 <.text+0x11d0>
1455250dd:     	movsd	0x20(%rdi), %xmm6
1455250e2:     	movq	0x18(%rdi), %r12
1455250e6:     	testq	%r12, %r12
1455250e9:     	js	0x14552514e <.text+0x552414e>
1455250eb:     	xorps	%xmm0, %xmm0
1455250ee:     	cvtsi2ss	%r12, %xmm0
1455250f3:     	jmp	0x145525169 <.text+0x5524169>
1455250f5:     	movaps	0x50(%rbp), %xmm6
1455250f9:     	movaps	0x60(%rbp), %xmm7
1455250fd:     	movaps	0x70(%rbp), %xmm8
145525102:     	movaps	0x80(%rbp), %xmm9
14552510a:     	movaps	0x90(%rbp), %xmm10
145525112:     	movaps	0xa0(%rbp), %xmm11
14552511a:     	movaps	0xb0(%rbp), %xmm12
145525122:     	movaps	0xc0(%rbp), %xmm13
14552512a:     	movaps	0xd0(%rbp), %xmm14
145525132:     	movaps	0xe0(%rbp), %xmm15
14552513a:     	addq	$0x178, %rsp            # imm = 0x178
145525141:     	popq	%rbx
145525142:     	popq	%rdi
145525143:     	popq	%rsi
145525144:     	popq	%r12
145525146:     	popq	%r13
145525148:     	popq	%r14
14552514a:     	popq	%r15
14552514c:     	popq	%rbp
14552514d:     	retq
14552514e:     	movq	%r12, %rax
145525151:     	shrq	%rax
145525154:     	movl	%r12d, %ecx
145525157:     	andl	$0x1, %ecx
14552515a:     	orq	%rax, %rcx
14552515d:     	xorps	%xmm0, %xmm0
145525160:     	cvtsi2ss	%rcx, %xmm0
145525165:     	addss	%xmm0, %xmm0
145525169:     	movq	0x20(%rbx), %r9
14552516d:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
145525171:     	addps	%xmm6, %xmm0
145525174:     	movaps	%xmm0, -0x50(%rbp)
145525178:     	movq	0x8(%rdi), %rax
14552517c:     	movq	%rax, -0x8(%rbp)
145525180:     	movq	0x10(%rdi), %rax
145525184:     	movq	%rax, 0x20(%rbp)
145525188:     	movq	-0x18(%rbp), %rax
14552518c:     	movq	%rax, 0x40(%rbp)
145525190:     	movq	-0x10(%rbp), %rdx
145525194:     	movss	0x3e2043(%rip), %xmm12  # 0x1459071e0
14552519d:     	xorl	%r15d, %r15d
1455251a0:     	xorps	%xmm13, %xmm13
1455251a4:     	movss	0x3e2037(%rip), %xmm14  # 0x1459071e4
1455251ad:     	movq	$-0x1, %r13
1455251b4:     	xorps	%xmm15, %xmm15
1455251b8:     	movss	0x3e2357(%rip), %xmm11  # 0x145907518
1455251c1:     	movss	0x422d26(%rip), %xmm9   # 0x145947ef0
1455251ca:     	movq	%rdx, 0x28(%rbp)
1455251ce:     	jmp	0x1455251ee <.text+0x55241ee>
1455251d0:     	movq	0x8(%rbp), %r9
1455251d4:     	addq	$0xc, %r9
1455251d8:     	movq	(%rbp), %r8
1455251dc:     	addq	$-0x3, %r8
1455251e0:     	cmpq	$0x3, %r8
1455251e4:     	movq	0x28(%rbp), %rdx
1455251e8:     	jb	0x145525061 <.text+0x5524061>
1455251ee:     	movl	(%r9), %ecx
1455251f1:     	cmpq	%rcx, %rdx
1455251f4:     	jbe	0x14552569c <.text+0x552469c>
1455251fa:     	movl	0x4(%r9), %eax
1455251fe:     	cmpq	%rax, %rdx
145525201:     	jbe	0x14552568a <.text+0x552468a>
145525207:     	movq	%r8, (%rbp)
14552520b:     	movq	%r9, 0x8(%rbp)
14552520f:     	movl	0x8(%r9), %r9d
145525213:     	cmpq	%r9, %rdx
145525216:     	jbe	0x145525674 <.text+0x5524674>
14552521c:     	leaq	(%rcx,%rcx,2), %rcx
145525220:     	movq	0x40(%rbp), %r8
145525224:     	movsd	(%r8,%rcx,4), %xmm10
14552522a:     	leaq	(%rax,%rax,2), %rax
14552522e:     	movsd	(%r8,%rax,4), %xmm1
145525234:     	leaq	(%r9,%r9,2), %rdx
145525238:     	movsd	(%r8,%rdx,4), %xmm0
14552523e:     	movaps	%xmm10, %xmm2
145525242:     	maxps	%xmm1, %xmm2
145525245:     	movaps	%xmm2, %xmm3
145525248:     	cmpunordps	%xmm2, %xmm3
14552524c:     	movaps	%xmm10, %xmm4
145525250:     	andps	%xmm3, %xmm4
145525253:     	andnps	%xmm2, %xmm3
145525256:     	orps	%xmm4, %xmm3
145525259:     	movaps	%xmm3, %xmm4
14552525c:     	maxps	%xmm0, %xmm4
14552525f:     	movaps	%xmm4, %xmm2
145525262:     	cmpunordps	%xmm4, %xmm2
145525266:     	andps	%xmm2, %xmm3
145525269:     	andnps	%xmm4, %xmm2
14552526c:     	orps	%xmm3, %xmm2
14552526f:     	cmpltps	%xmm6, %xmm2
145525273:     	movaps	%xmm10, %xmm3
145525277:     	movaps	%xmm1, 0x10(%rbp)
14552527b:     	minps	%xmm1, %xmm3
14552527e:     	movaps	%xmm3, %xmm4
145525281:     	cmpunordps	%xmm3, %xmm4
145525285:     	movaps	%xmm10, %xmm5
145525289:     	andps	%xmm4, %xmm5
14552528c:     	andnps	%xmm3, %xmm4
14552528f:     	orps	%xmm5, %xmm4
145525292:     	movaps	%xmm4, %xmm3
145525295:     	minps	%xmm0, %xmm3
145525298:     	movaps	%xmm3, %xmm5
14552529b:     	cmpunordps	%xmm3, %xmm5
14552529f:     	andps	%xmm5, %xmm4
1455252a2:     	andnps	%xmm3, %xmm5
1455252a5:     	orps	%xmm4, %xmm5
1455252a8:     	movaps	-0x50(%rbp), %xmm3
1455252ac:     	cmpltps	%xmm5, %xmm3
1455252b0:     	orps	%xmm2, %xmm3
1455252b3:     	pshufd	$0x50, %xmm3, %xmm2     # xmm2 = xmm3[0,0,1,1]
1455252b8:     	movmskpd	%xmm2, %r8d
1455252bd:     	testl	%r8d, %r8d
1455252c0:     	jne	0x1455251d0 <.text+0x55241d0>
1455252c6:     	movq	0x40(%rbp), %r8
1455252ca:     	movss	0x8(%r8,%rcx,4), %xmm1
1455252d1:     	movss	0x8(%r8,%rax,4), %xmm3
1455252d8:     	movss	0x8(%r8,%rdx,4), %xmm7
1455252df:     	movaps	0x10(%rbp), %xmm2
1455252e3:     	subps	%xmm10, %xmm2
1455252e7:     	movss	%xmm3, 0x3c(%rbp)
1455252ec:     	subss	%xmm1, %xmm3
1455252f0:     	movaps	%xmm0, %xmm8
1455252f4:     	subps	%xmm10, %xmm8
1455252f8:     	movss	%xmm7, 0x38(%rbp)
1455252fd:     	movss	%xmm1, 0x34(%rbp)
145525302:     	subss	%xmm1, %xmm7
145525306:     	movaps	%xmm3, %xmm5
145525309:     	mulss	%xmm8, %xmm5
14552530e:     	movaps	%xmm2, %xmm4
145525311:     	mulss	%xmm7, %xmm4
145525315:     	subss	%xmm4, %xmm5
145525319:     	mulss	%xmm5, %xmm5
14552531d:     	movaps	%xmm7, %xmm4
145525320:     	shufps	$0xd4, %xmm8, %xmm4     # xmm4 = xmm4[0,1],xmm8[1,3]
145525325:     	shufps	$0xf2, %xmm8, %xmm4     # xmm4 = xmm4[2,0],xmm8[3,3]
14552532a:     	mulps	%xmm2, %xmm4
14552532d:     	movaps	%xmm3, -0x30(%rbp)
145525331:     	shufps	$0xd4, %xmm2, %xmm3     # xmm3 = xmm3[0,1],xmm2[1,3]
145525335:     	movaps	%xmm2, -0x40(%rbp)
145525339:     	shufps	$0xf2, %xmm2, %xmm3     # xmm3 = xmm3[2,0],xmm2[3,3]
14552533d:     	mulps	%xmm8, %xmm3
145525341:     	subps	%xmm3, %xmm4
145525344:     	movaps	%xmm4, %xmm3
145525347:     	mulps	%xmm4, %xmm3
14552534a:     	movshdup	%xmm3, %xmm1            # xmm1 = xmm3[1,1,3,3]
14552534e:     	addss	%xmm5, %xmm1
145525352:     	addss	%xmm3, %xmm1
145525356:     	xorps	%xmm5, %xmm5
145525359:     	sqrtss	%xmm1, %xmm5
14552535d:     	movss	0x4bfcab(%rip), %xmm1   # 0x1459e5010
145525365:     	ucomiss	%xmm5, %xmm1
145525368:     	ja	0x1455251d0 <.text+0x55241d0>
14552536e:     	andps	0x3f040b(%rip), %xmm4   # 0x145915780
145525375:     	divss	%xmm5, %xmm4
145525379:     	ucomiss	0x422b54(%rip), %xmm4   # 0x145947ed4
145525380:     	ja	0x1455251d0 <.text+0x55241d0>
145525386:     	movaps	-0x40(%rbp), %xmm1
14552538a:     	mulps	%xmm1, %xmm1
14552538d:     	movshdup	%xmm1, %xmm3            # xmm3 = xmm1[1,1,3,3]
145525391:     	addss	%xmm1, %xmm3
145525395:     	movaps	-0x30(%rbp), %xmm1
145525399:     	mulss	%xmm1, %xmm1
14552539d:     	addss	%xmm3, %xmm1
1455253a1:     	sqrtss	%xmm1, %xmm1
1455253a5:     	movaps	%xmm8, %xmm3
1455253a9:     	mulps	%xmm8, %xmm3
1455253ad:     	movshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
1455253b1:     	addss	%xmm3, %xmm4
1455253b5:     	movaps	%xmm7, %xmm3
1455253b8:     	mulss	%xmm7, %xmm3
1455253bc:     	addss	%xmm4, %xmm3
1455253c0:     	sqrtss	%xmm3, %xmm3
1455253c4:     	movaps	%xmm1, %xmm4
1455253c7:     	maxss	%xmm3, %xmm4
1455253cb:     	movaps	%xmm4, %xmm3
1455253ce:     	cmpunordss	%xmm4, %xmm3
1455253d3:     	movaps	%xmm3, %xmm5
1455253d6:     	andnps	%xmm4, %xmm5
1455253d9:     	andps	%xmm1, %xmm3
1455253dc:     	orps	%xmm5, %xmm3
1455253df:     	movss	0x38(%rbp), %xmm2
1455253e4:     	subss	0x3c(%rbp), %xmm2
1455253e9:     	subps	0x10(%rbp), %xmm0
1455253ed:     	mulps	%xmm0, %xmm0
1455253f0:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
1455253f4:     	addss	%xmm0, %xmm1
1455253f8:     	mulss	%xmm2, %xmm2
1455253fc:     	addss	%xmm1, %xmm2
145525400:     	xorps	%xmm0, %xmm0
145525403:     	sqrtss	%xmm2, %xmm0
145525407:     	movaps	%xmm3, %xmm1
14552540a:     	maxss	%xmm0, %xmm1
14552540e:     	movaps	%xmm1, %xmm0
145525411:     	cmpunordss	%xmm1, %xmm0
145525416:     	andps	%xmm0, %xmm3
145525419:     	andnps	%xmm1, %xmm0
14552541c:     	orps	%xmm3, %xmm0
14552541f:     	divss	0x41a84d(%rip), %xmm0   # 0x14593fc74
145525427:     	callq	0x14577327d <.text+0x577227d>
14552542c:     	cvttss2si	%xmm0, %rax
145525431:     	movq	%rax, %rcx
145525434:     	sarq	$0x3f, %rcx
145525438:     	movaps	%xmm0, %xmm1
14552543b:     	subss	%xmm12, %xmm1
145525440:     	cvttss2si	%xmm1, %rdx
145525445:     	andq	%rcx, %rdx
145525448:     	orq	%rax, %rdx
14552544b:     	ucomiss	%xmm13, %xmm0
14552544f:     	cmovbq	%r15, %rdx
145525453:     	ucomiss	%xmm14, %xmm0
145525457:     	cmovaq	%r13, %rdx
14552545b:     	cmpq	$0x190, %rdx            # imm = 0x190
145525462:     	movl	$0x190, %r9d            # imm = 0x190
145525468:     	cmovbq	%rdx, %r9
14552546c:     	testq	%rdx, %rdx
14552546f:     	movl	$0x1, %eax
145525474:     	cmoveq	%rax, %r9
145525478:     	xorps	%xmm0, %xmm0
14552547b:     	cvtsi2ss	%r9, %xmm0
145525480:     	xorl	%edx, %edx
145525482:     	movq	%r9, 0x10(%rbp)
145525486:     	nopw	%cs:(%rax,%rax)
145525490:     	xorl	%r8d, %r8d
145525493:     	subq	%rdx, %r9
145525496:     	seta	%cl
145525499:     	testq	%rdx, %rdx
14552549c:     	js	0x1455254b0 <.text+0x55244b0>
14552549e:     	xorps	%xmm1, %xmm1
1455254a1:     	cvtsi2ss	%rdx, %xmm1
1455254a6:     	jmp	0x1455254cc <.text+0x55244cc>
1455254a8:     	nopl	(%rax,%rax)
1455254b0:     	movq	%rdx, %r10
1455254b3:     	shrq	%r10
1455254b6:     	movl	%edx, %r11d
1455254b9:     	andl	$0x1, %r11d
1455254bd:     	orq	%r10, %r11
1455254c0:     	xorps	%xmm1, %xmm1
1455254c3:     	cvtsi2ss	%r11, %xmm1
1455254c8:     	addss	%xmm1, %xmm1
1455254cc:     	movb	%cl, %r8b
1455254cf:     	addq	%rdx, %r8
1455254d2:     	divss	%xmm0, %xmm1
1455254d6:     	movsldup	%xmm1, %xmm2            # xmm2 = xmm1[0,0,2,2]
1455254da:     	mulps	-0x40(%rbp), %xmm2
1455254de:     	addps	%xmm10, %xmm2
1455254e2:     	mulss	-0x30(%rbp), %xmm1
1455254e7:     	addss	0x34(%rbp), %xmm1
1455254ec:     	xorl	%r11d, %r11d
1455254ef:     	xorl	%r10d, %r10d
1455254f2:     	nopw	%cs:(%rax,%rax)
145525500:     	cmpq	%r9, %r11
145525503:     	adcq	$0x0, %r10
145525507:     	testq	%r11, %r11
14552550a:     	js	0x145525520 <.text+0x5524520>
14552550c:     	xorps	%xmm3, %xmm3
14552550f:     	cvtsi2ss	%r11, %xmm3
145525514:     	jmp	0x14552553b <.text+0x552453b>
145525516:     	nopw	%cs:(%rax,%rax)
145525520:     	movq	%r11, %rcx
145525523:     	shrq	%rcx
145525526:     	movl	%r11d, %edi
145525529:     	andl	$0x1, %edi
14552552c:     	orq	%rcx, %rdi
14552552f:     	xorps	%xmm3, %xmm3
145525532:     	cvtsi2ss	%rdi, %xmm3
145525537:     	addss	%xmm3, %xmm3
14552553b:     	divss	%xmm0, %xmm3
14552553f:     	movsldup	%xmm3, %xmm4            # xmm4 = xmm3[0,0,2,2]
145525543:     	mulps	%xmm8, %xmm4
145525547:     	addps	%xmm2, %xmm4
14552554a:     	subps	%xmm6, %xmm4
14552554d:     	movaps	%xmm4, %xmm5
145525550:     	cmpltps	%xmm15, %xmm5
145525555:     	unpcklps	%xmm5, %xmm5            # xmm5 = xmm5[0,0,1,1]
145525558:     	movmskpd	%xmm5, %ecx
14552555c:     	testl	%ecx, %ecx
14552555e:     	jne	0x145525620 <.text+0x5524620>
145525564:     	movaps	%xmm4, %xmm5
145525567:     	subss	%xmm12, %xmm5
14552556c:     	cvttss2si	%xmm5, %rcx
145525571:     	cvttss2si	%xmm4, %rbx
145525576:     	movq	%rbx, %rdi
145525579:     	sarq	$0x3f, %rdi
14552557d:     	andq	%rcx, %rdi
145525580:     	orq	%rbx, %rdi
145525583:     	ucomiss	%xmm13, %xmm4
145525587:     	cmovbq	%r15, %rdi
14552558b:     	ucomiss	%xmm14, %xmm4
14552558f:     	cmovaq	%r13, %rdi
145525593:     	movshdup	%xmm4, %xmm4            # xmm4 = xmm4[1,1,3,3]
145525597:     	movaps	%xmm4, %xmm5
14552559a:     	subss	%xmm12, %xmm5
14552559f:     	cvttss2si	%xmm5, %rbx
1455255a4:     	cvttss2si	%xmm4, %rax
1455255a9:     	movq	%rax, %rcx
1455255ac:     	sarq	$0x3f, %rcx
1455255b0:     	andq	%rbx, %rcx
1455255b3:     	orq	%rax, %rcx
1455255b6:     	ucomiss	%xmm13, %xmm4
1455255ba:     	cmovbq	%r15, %rcx
1455255be:     	ucomiss	%xmm14, %xmm4
1455255c2:     	cmovaq	%r13, %rcx
1455255c6:     	cmpq	%r12, %rdi
1455255c9:     	setae	%al
1455255cc:     	cmpq	%r12, %rcx
1455255cf:     	setae	%bl
1455255d2:     	orb	%al, %bl
1455255d4:     	jne	0x145525620 <.text+0x5524620>
1455255d6:     	imulq	%r12, %rcx
1455255da:     	addq	%rdi, %rcx
1455255dd:     	cmpq	%rsi, %rcx
1455255e0:     	jae	0x14552564f <.text+0x552464f>
1455255e2:     	movss	(%r14,%rcx,4), %xmm4
1455255e8:     	ucomiss	%xmm4, %xmm4
1455255eb:     	jp	0x145525620 <.text+0x5524620>
1455255ed:     	mulss	%xmm7, %xmm3
1455255f1:     	addss	%xmm1, %xmm3
1455255f5:     	movaps	%xmm4, %xmm5
1455255f8:     	addss	%xmm11, %xmm5
1455255fd:     	ucomiss	%xmm5, %xmm3
145525600:     	addss	%xmm9, %xmm4
145525605:     	jbe	0x145525620 <.text+0x5524620>
145525607:     	ucomiss	%xmm3, %xmm4
14552560a:     	jbe	0x145525620 <.text+0x5524620>
14552560c:     	cmpq	0x20(%rbp), %rcx
145525610:     	jae	0x145525661 <.text+0x5524661>
145525612:     	movq	-0x8(%rbp), %rax
145525616:     	movb	$0x1, (%rax,%rcx)
14552561a:     	nopw	(%rax,%rax)
145525620:     	cmpq	%r9, %r11
145525623:     	jae	0x145525631 <.text+0x5524631>
145525625:     	movq	%r10, %r11
145525628:     	cmpq	%r9, %r10
14552562b:     	jbe	0x145525500 <.text+0x5524500>
145525631:     	movq	0x10(%rbp), %r9
145525635:     	cmpq	%rdx, %r9
145525638:     	jbe	0x1455251d0 <.text+0x55241d0>
14552563e:     	movq	%r8, %rdx
145525641:     	cmpq	%r9, %r8
145525644:     	jbe	0x145525490 <.text+0x5524490>
14552564a:     	jmp	0x1455251d0 <.text+0x55241d0>
14552564f:     	leaq	0x180f642(%rip), %r8    # 0x146d34c98
145525656:     	movq	%rsi, %rdx
145525659:     	callq	0x145903b33 <.text+0x5902b33>
14552565e:     	nop
14552565f:     	jmp	0x1455256a9 <.text+0x55246a9>
145525661:     	leaq	0x180f648(%rip), %r8    # 0x146d34cb0
145525668:     	movq	0x20(%rbp), %rdx
14552566c:     	callq	0x145903b33 <.text+0x5902b33>
145525671:     	nop
145525672:     	jmp	0x1455256a9 <.text+0x55246a9>
145525674:     	leaq	0x180f605(%rip), %r8    # 0x146d34c80
14552567b:     	movq	%r9, %rcx
14552567e:     	movq	0x28(%rbp), %rdx
145525682:     	callq	0x145903b33 <.text+0x5902b33>
145525687:     	nop
145525688:     	jmp	0x1455256a9 <.text+0x55246a9>
14552568a:     	leaq	0x180f5d7(%rip), %r8    # 0x146d34c68
145525691:     	movq	%rax, %rcx
145525694:     	callq	0x145903b33 <.text+0x5902b33>
145525699:     	nop
14552569a:     	jmp	0x1455256a9 <.text+0x55246a9>
14552569c:     	leaq	0x180f5ad(%rip), %r8    # 0x146d34c50
1455256a3:     	callq	0x145903b33 <.text+0x5902b33>
1455256a8:     	nop
1455256a9:     	ud2
