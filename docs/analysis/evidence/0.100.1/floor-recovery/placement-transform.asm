
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145530130:     	pushq	%r14
145530132:     	pushq	%rsi
145530133:     	pushq	%rdi
145530134:     	pushq	%rbx
145530135:     	subq	$0x178, %rsp            # imm = 0x178
14553013c:     	movaps	%xmm15, 0x160(%rsp)
145530145:     	movaps	%xmm14, 0x150(%rsp)
14553014e:     	movaps	%xmm13, 0x140(%rsp)
145530157:     	movaps	%xmm12, 0x130(%rsp)
145530160:     	movaps	%xmm11, 0x120(%rsp)
145530169:     	movaps	%xmm10, 0x110(%rsp)
145530172:     	movaps	%xmm9, 0x100(%rsp)
14553017b:     	movaps	%xmm8, 0xf0(%rsp)
145530184:     	movaps	%xmm7, 0xe0(%rsp)
14553018c:     	movaps	%xmm6, 0xd0(%rsp)
145530194:     	movq	%r9, %rdi
145530197:     	movq	%r8, %r14
14553019a:     	movq	%rdx, %rbx
14553019d:     	movq	%rcx, %rsi
1455301a0:     	movq	0x1c0(%rsp), %rax
1455301a8:     	movss	(%rax), %xmm11
1455301ad:     	movss	0x4b45be(%rip), %xmm10  # 0x1459e4774
1455301b6:     	movss	0x4(%rax), %xmm6
1455301bb:     	mulss	%xmm10, %xmm6
1455301c0:     	mulss	0x8(%rax), %xmm10
1455301c6:     	addss	0x4d821a(%rip), %xmm6   # 0x145a083e8
1455301ce:     	movaps	%xmm6, %xmm0
1455301d1:     	callq	0x145773235 <.text+0x5772235>
1455301d6:     	movaps	%xmm0, %xmm9
1455301da:     	movaps	%xmm6, %xmm0
1455301dd:     	callq	0x145773247 <.text+0x5772247>
1455301e2:     	movaps	%xmm9, %xmm7
1455301e6:     	mulss	0x18045f6(%rip), %xmm7  # 0x146d347e4
1455301ee:     	xorps	%xmm12, %xmm12
1455301f2:     	movaps	%xmm0, %xmm1
1455301f5:     	movaps	%xmm0, %xmm15
1455301f9:     	addss	%xmm12, %xmm1
1455301fe:     	movaps	%xmm1, 0x60(%rsp)
145530203:     	mulss	0x4c3e34(%rip), %xmm11  # 0x1459f4040
14553020c:     	movaps	%xmm11, %xmm0
145530210:     	callq	0x145773247 <.text+0x5772247>
145530215:     	movaps	%xmm0, %xmm6
145530218:     	addss	0x4b4d4f(%rip), %xmm10  # 0x1459e4f70
145530221:     	movaps	%xmm10, %xmm0
145530225:     	callq	0x145773235 <.text+0x5772235>
14553022a:     	movaps	%xmm0, %xmm8
14553022e:     	movaps	%xmm10, %xmm0
145530232:     	callq	0x145773247 <.text+0x5772247>
145530237:     	movaps	%xmm0, %xmm10
14553023b:     	movaps	%xmm0, 0x50(%rsp)
145530240:     	movaps	%xmm11, %xmm0
145530244:     	callq	0x145773235 <.text+0x5772235>
145530249:     	movaps	%xmm0, %xmm14
14553024d:     	movaps	%xmm0, %xmm3
145530250:     	mulss	%xmm12, %xmm3
145530255:     	xorps	%xmm13, %xmm13
145530259:     	movss	%xmm3, %xmm13           # xmm13 = xmm3[0],xmm13[1,2,3]
14553025e:     	movaps	%xmm6, %xmm0
145530261:     	unpcklps	%xmm8, %xmm0            # xmm0 = xmm0[0],xmm8[0],xmm0[1],xmm8[1]
145530265:     	movaps	%xmm15, %xmm2
145530269:     	movaps	%xmm15, 0x90(%rsp)
145530272:     	movaps	%xmm15, %xmm1
145530276:     	movlhps	%xmm10, %xmm1           # xmm1 = xmm1[0],xmm10[0]
14553027a:     	shufps	$0x24, %xmm1, %xmm0     # xmm0 = xmm0[0,1],xmm1[2,0]
14553027e:     	movaps	%xmm6, %xmm1
145530281:     	movaps	%xmm6, %xmm4
145530284:     	subps	%xmm3, %xmm1
145530287:     	mulps	%xmm0, %xmm13
14553028b:     	movaps	%xmm13, %xmm15
14553028f:     	movaps	%xmm13, %xmm5
145530293:     	movss	%xmm1, %xmm5            # xmm5 = xmm1[0],xmm5[1,2,3]
145530297:     	movaps	%xmm5, 0x80(%rsp)
14553029f:     	shufps	$0x2, %xmm9, %xmm15     # xmm15 = xmm15[2,0],xmm9[0,0]
1455302a4:     	movaps	%xmm2, %xmm1
1455302a7:     	shufps	$0xf4, %xmm9, %xmm1     # xmm1 = xmm1[0,1],xmm9[3,3]
1455302ac:     	movaps	%xmm9, 0x70(%rsp)
1455302b2:     	movaps	%xmm15, %xmm5
1455302b6:     	shufps	$0x82, %xmm1, %xmm15    # xmm15 = xmm15[2,0],xmm1[0,2]
1455302bb:     	shufps	$0x24, %xmm15, %xmm15   # xmm15 = xmm15[0,1,2,0]
1455302c0:     	xorps	%xmm1, %xmm1
1455302c3:     	mulps	%xmm1, %xmm15
1455302c7:     	movaps	%xmm15, %xmm2
1455302cb:     	unpckhpd	%xmm15, %xmm2           # xmm2 = xmm2[1],xmm15[1]
1455302d0:     	addss	%xmm12, %xmm2
1455302d5:     	addss	%xmm7, %xmm2
1455302d9:     	shufps	$0xe2, %xmm9, %xmm5     # xmm5 = xmm5[2,0],xmm9[2,3]
1455302de:     	addps	%xmm1, %xmm5
1455302e1:     	shufps	$0xe4, %xmm15, %xmm5    # xmm5 = xmm5[0,1],xmm15[2,3]
1455302e6:     	movaps	%xmm5, %xmm7
1455302e9:     	shufps	$0xd2, %xmm0, %xmm7     # xmm7 = xmm7[2,0],xmm0[1,3]
1455302ed:     	shufps	$0xd8, %xmm7, %xmm7     # xmm7 = xmm7[0,2,1,3]
1455302f1:     	movaps	%xmm5, %xmm9
1455302f5:     	addps	%xmm7, %xmm9
1455302f9:     	subps	%xmm7, %xmm5
1455302fc:     	xorps	%xmm11, %xmm11
145530300:     	shufps	$0x9c, %xmm13, %xmm11   # xmm11 = xmm11[0,3],xmm13[1,2]
145530305:     	movshdup	%xmm13, %xmm7           # xmm7 = xmm13[1,1,3,3]
14553030a:     	shufps	$0xff, %xmm15, %xmm15   # xmm15 = xmm15[3,3,3,3]
14553030f:     	movaps	0x60(%rsp), %xmm10
145530315:     	subss	%xmm15, %xmm10
14553031a:     	addss	%xmm12, %xmm15
14553031f:     	subss	%xmm7, %xmm12
145530324:     	movaps	0x50(%rsp), %xmm6
145530329:     	addss	%xmm6, %xmm12
14553032e:     	movaps	%xmm12, %xmm13
145530332:     	shufps	$0xf4, %xmm5, %xmm13    # xmm13 = xmm13[0,1],xmm5[3,3]
145530337:     	movaps	%xmm5, %xmm7
14553033a:     	shufps	$0x23, %xmm9, %xmm7     # xmm7 = xmm7[3,0],xmm9[2,0]
14553033f:     	movaps	%xmm9, %xmm5
145530343:     	shufps	$0x24, %xmm7, %xmm5     # xmm5 = xmm5[0,1],xmm7[2,0]
145530347:     	movq	%xmm6, %xmm7            # xmm7 = xmm6[0],zero
14553034b:     	shufps	$0xe2, %xmm1, %xmm7     # xmm7 = xmm7[2,0],xmm1[2,3]
14553034f:     	movsldup	%xmm4, %xmm0            # xmm0 = xmm4[0,0,2,2]
145530353:     	mulps	%xmm7, %xmm0
145530356:     	movaps	%xmm4, %xmm7
145530359:     	mulss	%xmm8, %xmm7
14553035e:     	movaps	%xmm14, %xmm4
145530362:     	unpcklps	%xmm3, %xmm4            # xmm4 = xmm4[0],xmm3[0],xmm4[1],xmm3[1]
145530365:     	subss	%xmm7, %xmm3
145530369:     	addps	%xmm0, %xmm4
14553036c:     	shufps	$0x30, %xmm4, %xmm3     # xmm3 = xmm3[0,0],xmm4[3,0]
145530370:     	shufps	$0x84, %xmm3, %xmm4     # xmm4 = xmm4[0,1],xmm3[0,2]
145530374:     	shufps	$0x24, %xmm4, %xmm4     # xmm4 = xmm4[0,1,2,0]
145530378:     	shufps	$0x78, %xmm11, %xmm11   # xmm11 = xmm11[0,2,3,1]
14553037d:     	addps	%xmm4, %xmm11
145530381:     	mulss	%xmm14, %xmm8
145530386:     	mulss	%xmm6, %xmm14
14553038b:     	addss	%xmm0, %xmm8
145530390:     	subss	%xmm14, %xmm0
145530395:     	unpcklps	0x70(%rsp), %xmm8       # xmm8 = xmm8[0],mem[0],xmm8[1],mem[1]
14553039b:     	movss	%xmm0, %xmm1            # xmm1 = xmm0[0],xmm1[1,2,3]
14553039f:     	shufps	$0x41, %xmm8, %xmm1     # xmm1 = xmm1[1,0],xmm8[0,1]
1455303a4:     	addps	0x80(%rsp), %xmm1
1455303ac:     	movaps	%xmm1, %xmm0
1455303af:     	shufps	$0xe3, %xmm1, %xmm0     # xmm0 = xmm0[3,0],xmm1[2,3]
1455303b3:     	movss	%xmm10, %xmm0           # xmm0 = xmm10[0],xmm0[1,2,3]
1455303b8:     	shufps	$0x40, %xmm0, %xmm0     # xmm0 = xmm0[0,0,0,1]
1455303bc:     	mulps	%xmm1, %xmm0
1455303bf:     	movaps	0x180442a(%rip), %xmm3  # 0x146d347f0
1455303c6:     	mulps	%xmm11, %xmm3
1455303ca:     	movaps	%xmm0, %xmm4
1455303cd:     	addps	%xmm3, %xmm4
1455303d0:     	subps	%xmm3, %xmm0
1455303d3:     	movaps	%xmm1, %xmm3
1455303d6:     	unpckhpd	%xmm1, %xmm3            # xmm3 = xmm3[1],xmm1[1]
1455303da:     	shufps	$0x23, %xmm4, %xmm0     # xmm0 = xmm0[3,0],xmm4[2,0]
1455303de:     	shufps	$0x24, %xmm0, %xmm4     # xmm4 = xmm4[0,1],xmm0[2,0]
1455303e2:     	movaps	%xmm11, %xmm0
1455303e6:     	unpckhpd	%xmm11, %xmm0           # xmm0 = xmm0[1],xmm11[1]
1455303eb:     	mulss	%xmm2, %xmm3
1455303ef:     	addss	%xmm0, %xmm3
1455303f3:     	movaps	0x90(%rsp), %xmm0
1455303fb:     	mulss	0x18043e1(%rip), %xmm0  # 0x146d347e4
145530403:     	subss	%xmm0, %xmm15
145530408:     	shufps	$0xf4, %xmm1, %xmm2     # xmm2 = xmm2[0,1],xmm1[3,3]
14553040c:     	shufps	$0x64, %xmm1, %xmm1     # xmm1 = xmm1[0,1,2,1]
145530410:     	shufps	$0x28, %xmm2, %xmm2     # xmm2 = xmm2[0,2,2,0]
145530414:     	shufps	$0x64, %xmm11, %xmm11   # xmm11 = xmm11[0,1,2,1]
145530419:     	mulps	0x18043df(%rip), %xmm11 # 0x146d34800
145530421:     	mulps	%xmm1, %xmm2
145530424:     	movaps	%xmm2, %xmm0
145530427:     	subps	%xmm11, %xmm0
14553042b:     	addps	%xmm2, %xmm11
14553042f:     	movaps	%xmm15, %xmm1
145530433:     	shufps	$0xd4, %xmm9, %xmm1     # xmm1 = xmm1[0,1],xmm9[1,3]
145530438:     	movq	%xmm9, %xmm2            # xmm2 = xmm9[0],zero
14553043d:     	shufps	$0xc9, %xmm11, %xmm0    # xmm0 = xmm0[1,2],xmm11[0,3]
145530442:     	movq	%xmm12, %xmm6           # xmm6 = xmm12[0],zero
145530447:     	shufps	$0x82, %xmm6, %xmm2     # xmm2 = xmm2[2,0],xmm6[0,2]
14553044b:     	movq	%xmm15, %xmm6           # xmm6 = xmm15[0],zero
145530450:     	mulps	%xmm5, %xmm2
145530453:     	shufps	$0x2d, %xmm6, %xmm5     # xmm5 = xmm5[1,3],xmm6[2,0]
145530457:     	shufps	$0x82, %xmm1, %xmm13    # xmm13 = xmm13[2,0],xmm1[0,2]
14553045c:     	mulps	%xmm5, %xmm13
145530460:     	addps	%xmm0, %xmm13
145530464:     	addps	%xmm4, %xmm2
145530467:     	mulss	%xmm12, %xmm15
14553046c:     	addss	%xmm3, %xmm15
145530471:     	movaps	%xmm2, 0xa0(%rsp)
145530479:     	movaps	%xmm13, 0xb0(%rsp)
145530482:     	movss	%xmm15, 0xc0(%rsp)
14553048c:     	leaq	(%r14,%r14,2), %rax
145530490:     	leaq	(%rbx,%rax,4), %rax
145530494:     	movq	%rbx, 0x28(%rsp)
145530499:     	movq	%rax, 0x30(%rsp)
14553049e:     	leaq	0xa0(%rsp), %rax
1455304a6:     	movq	%rax, 0x38(%rsp)
1455304ab:     	movq	%rdi, 0x40(%rsp)
1455304b0:     	leaq	0x1c8(%rsp), %rax
1455304b8:     	movq	%rax, 0x48(%rsp)
1455304bd:     	leaq	0x28(%rsp), %rdx
1455304c2:     	movq	%rsi, %rcx
1455304c5:     	callq	0x145542830 <.text+0x5541830>
1455304ca:     	movaps	0xd0(%rsp), %xmm6
1455304d2:     	movaps	0xe0(%rsp), %xmm7
1455304da:     	movaps	0xf0(%rsp), %xmm8
1455304e3:     	movaps	0x100(%rsp), %xmm9
1455304ec:     	movaps	0x110(%rsp), %xmm10
1455304f5:     	movaps	0x120(%rsp), %xmm11
1455304fe:     	movaps	0x130(%rsp), %xmm12
145530507:     	movaps	0x140(%rsp), %xmm13
145530510:     	movaps	0x150(%rsp), %xmm14
145530519:     	movaps	0x160(%rsp), %xmm15
145530522:     	addq	$0x178, %rsp            # imm = 0x178
145530529:     	popq	%rbx
14553052a:     	popq	%rdi
14553052b:     	popq	%rsi
14553052c:     	popq	%r14
14553052e:     	retq
