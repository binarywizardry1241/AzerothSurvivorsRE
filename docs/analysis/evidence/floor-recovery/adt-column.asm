
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145689130:     	pushq	%rsi
145689131:     	subq	$0x190, %rsp            # imm = 0x190
145689138:     	movaps	%xmm11, 0x180(%rsp)
145689141:     	movaps	%xmm10, 0x170(%rsp)
14568914a:     	movaps	%xmm9, 0x160(%rsp)
145689153:     	movaps	%xmm8, 0x150(%rsp)
14568915c:     	movaps	%xmm7, 0x140(%rsp)
145689164:     	movaps	%xmm6, 0x130(%rsp)
14568916c:     	movq	0x10(%rcx), %r10
145689170:     	xorl	%eax, %eax
145689172:     	testq	%r10, %r10
145689175:     	je	0x14568966e <.text+0x568866e>
14568917b:     	movq	0x8(%rcx), %r9
14568917f:     	movss	(%r9), %xmm3
145689184:     	movsd	(%rdx), %xmm2
145689188:     	subss	%xmm2, %xmm3
14568918c:     	movss	0x3be66c(%rip), %xmm0   # 0x145a47800
145689194:     	divss	%xmm0, %xmm3
145689198:     	movss	0x2b6870(%rip), %xmm5   # 0x14593fa10
1456891a0:     	mulss	%xmm5, %xmm3
1456891a4:     	xorps	%xmm1, %xmm1
1456891a7:     	ucomiss	%xmm1, %xmm3
1456891aa:     	jb	0x14568966e <.text+0x568866e>
1456891b0:     	movss	0x27e2d8(%rip), %xmm1   # 0x145907490
1456891b8:     	ucomiss	%xmm3, %xmm1
1456891bb:     	jb	0x14568966e <.text+0x568866e>
1456891c1:     	movss	0x4(%r9), %xmm4
1456891c7:     	movshdup	%xmm2, %xmm6            # xmm6 = xmm2[1,1,3,3]
1456891cb:     	subss	%xmm6, %xmm4
1456891cf:     	divss	%xmm0, %xmm4
1456891d3:     	mulss	%xmm5, %xmm4
1456891d7:     	xorps	%xmm0, %xmm0
1456891da:     	ucomiss	%xmm0, %xmm4
1456891dd:     	jb	0x14568966e <.text+0x568866e>
1456891e3:     	ucomiss	%xmm4, %xmm1
1456891e6:     	jb	0x14568966e <.text+0x568866e>
1456891ec:     	cmpq	$0x91, %r10
1456891f3:     	jne	0x145689652 <.text+0x5688652>
1456891f9:     	movss	0x28c6d3(%rip), %xmm0   # 0x1459158d4
145689201:     	mulss	%xmm0, %xmm3
145689205:     	cvttss2si	%xmm3, %rdx
14568920a:     	xorl	%eax, %eax
14568920c:     	xorps	%xmm5, %xmm5
14568920f:     	ucomiss	%xmm5, %xmm3
145689212:     	cmovbl	%eax, %edx
145689215:     	movss	0x27e30f(%rip), %xmm6   # 0x14590752c
14568921d:     	ucomiss	%xmm6, %xmm3
145689220:     	movl	$0xffffffff, %r10d      # imm = 0xFFFFFFFF
145689226:     	cmoval	%r10d, %edx
14568922a:     	cmpl	$0x7, %edx
14568922d:     	movl	$0x7, %r11d
145689233:     	cmovael	%r11d, %edx
145689237:     	mulss	%xmm0, %xmm4
14568923b:     	cvttss2si	%xmm4, %r8
145689240:     	ucomiss	%xmm5, %xmm4
145689243:     	cmovbl	%eax, %r8d
145689247:     	ucomiss	%xmm6, %xmm4
14568924a:     	cmoval	%r10d, %r8d
14568924e:     	cmpl	$0x7, %r8d
145689252:     	cmovael	%r11d, %r8d
145689256:     	movl	%edx, %r10d
145689259:     	andl	$0x6, %r10d
14568925d:     	movl	%r8d, %r11d
145689260:     	shrl	%r11d
145689263:     	leal	(%r11,%r10,2), %r10d
145689267:     	movl	0x17c(%rcx), %ecx
14568926d:     	btl	%r10d, %ecx
145689271:     	jb	0x14568966e <.text+0x568866e>
145689277:     	movl	%edx, %eax
145689279:     	shll	$0x4, %eax
14568927c:     	addl	%edx, %eax
14568927e:     	leal	(%rax,%r8), %edx
145689282:     	addl	%r8d, %eax
145689285:     	addl	$0x9, %eax
145689288:     	leaq	(%rax,%rax,2), %rcx
14568928c:     	movl	0x8(%r9,%rcx,4), %eax
145689291:     	movl	%eax, 0x98(%rsp)
145689298:     	movq	(%r9,%rcx,4), %rax
14568929c:     	movq	%rax, 0x90(%rsp)
1456892a4:     	leaq	(%rdx,%rdx,2), %rax
1456892a8:     	movq	(%r9,%rax,4), %rdx
1456892ac:     	movq	%rdx, 0x9c(%rsp)
1456892b4:     	movl	0x8(%r9,%rax,4), %edx
1456892b9:     	movl	%edx, 0xa4(%rsp)
1456892c0:     	movq	0xcc(%r9,%rax,4), %rdx
1456892c8:     	movq	%rdx, 0xa8(%rsp)
1456892d0:     	movl	0xd4(%r9,%rax,4), %edx
1456892d8:     	movl	%edx, 0xb0(%rsp)
1456892df:     	movl	0x8(%r9,%rcx,4), %edx
1456892e4:     	movl	%edx, 0xc0(%rsp)
1456892eb:     	movq	(%r9,%rcx,4), %rdx
1456892ef:     	movq	%rdx, 0xb8(%rsp)
1456892f7:     	movq	0xcc(%r9,%rax,4), %rdx
1456892ff:     	movq	%rdx, 0xc4(%rsp)
145689307:     	movl	0xd4(%r9,%rax,4), %edx
14568930f:     	movl	%edx, 0xcc(%rsp)
145689316:     	movq	0xd8(%r9,%rax,4), %rdx
14568931e:     	movq	%rdx, 0xd0(%rsp)
145689326:     	movl	0xe0(%r9,%rax,4), %edx
14568932e:     	movl	%edx, 0xd8(%rsp)
145689335:     	movl	0x8(%r9,%rcx,4), %edx
14568933a:     	movl	%edx, 0xe8(%rsp)
145689341:     	movq	(%r9,%rcx,4), %rdx
145689345:     	movq	%rdx, 0xe0(%rsp)
14568934d:     	movq	0xd8(%r9,%rax,4), %rdx
145689355:     	movq	%rdx, 0xec(%rsp)
14568935d:     	movl	0xe0(%r9,%rax,4), %edx
145689365:     	movl	%edx, 0xf4(%rsp)
14568936c:     	movq	0xc(%r9,%rax,4), %rdx
145689371:     	movq	%rdx, 0xf8(%rsp)
145689379:     	movl	0x14(%r9,%rax,4), %edx
14568937e:     	movl	%edx, 0x100(%rsp)
145689385:     	movl	0x8(%r9,%rcx,4), %edx
14568938a:     	movl	%edx, 0x110(%rsp)
145689391:     	movq	(%r9,%rcx,4), %rcx
145689395:     	movq	%rcx, 0x108(%rsp)
14568939d:     	movq	0xc(%r9,%rax,4), %rcx
1456893a2:     	movq	%rcx, 0x114(%rsp)
1456893aa:     	movl	0x14(%r9,%rax,4), %ecx
1456893af:     	movl	%ecx, 0x11c(%rsp)
1456893b6:     	movl	0x8(%r9,%rax,4), %ecx
1456893bb:     	movl	%ecx, 0x128(%rsp)
1456893c2:     	movq	(%r9,%rax,4), %rax
1456893c6:     	movq	%rax, 0x120(%rsp)
1456893ce:     	movups	0x90(%rsp), %xmm0
1456893d6:     	movups	0xa0(%rsp), %xmm3
1456893de:     	movaps	%xmm0, (%rsp)
1456893e2:     	movaps	%xmm3, 0x10(%rsp)
1456893e7:     	movl	0xb0(%rsp), %eax
1456893ee:     	movl	%eax, 0x20(%rsp)
1456893f2:     	movl	0xd8(%rsp), %eax
1456893f9:     	movl	%eax, 0x44(%rsp)
1456893fd:     	movups	0xb8(%rsp), %xmm0
145689405:     	movups	0xc8(%rsp), %xmm3
14568940d:     	movups	%xmm3, 0x34(%rsp)
145689412:     	movups	%xmm0, 0x24(%rsp)
145689417:     	movl	0x100(%rsp), %eax
14568941e:     	movl	%eax, 0x68(%rsp)
145689422:     	movups	0xe0(%rsp), %xmm0
14568942a:     	movups	0xf0(%rsp), %xmm3
145689432:     	movups	%xmm3, 0x58(%rsp)
145689437:     	movups	%xmm0, 0x48(%rsp)
14568943c:     	movl	0x128(%rsp), %eax
145689443:     	movl	%eax, 0x8c(%rsp)
14568944a:     	movups	0x108(%rsp), %xmm0
145689452:     	movups	0x118(%rsp), %xmm3
14568945a:     	movups	%xmm3, 0x7c(%rsp)
14568945f:     	movups	%xmm0, 0x6c(%rsp)
145689464:     	movaps	(%rsp), %xmm4
145689468:     	movss	0x4(%rsp), %xmm6
14568946e:     	movsd	0x18(%rsp), %xmm5
145689474:     	movshdup	%xmm5, %xmm3            # xmm3 = xmm5[1,1,3,3]
145689478:     	movss	0x10(%rsp), %xmm0
14568947e:     	movlhps	%xmm4, %xmm0            # xmm0 = xmm0[0],xmm4[0]
145689481:     	shufps	$0xe2, %xmm4, %xmm0     # xmm0 = xmm0[2,0],xmm4[2,3]
145689485:     	subps	%xmm5, %xmm0
145689488:     	movshdup	%xmm0, %xmm4            # xmm4 = xmm0[1,1,3,3]
14568948c:     	mulss	%xmm0, %xmm4
145689490:     	movss	0xc(%rsp), %xmm7
145689496:     	movaps	%xmm5, %xmm8
14568949a:     	subss	%xmm7, %xmm8
14568949f:     	movaps	%xmm6, %xmm7
1456894a2:     	subss	%xmm3, %xmm7
1456894a6:     	mulss	%xmm8, %xmm7
1456894ab:     	addss	%xmm4, %xmm7
1456894af:     	movaps	0x28c2c9(%rip), %xmm9   # 0x145915780
1456894b7:     	andps	%xmm7, %xmm9
1456894bb:     	movss	0x57668d(%rip), %xmm4   # 0x145bffb50
1456894c3:     	ucomiss	%xmm9, %xmm4
1456894c7:     	jbe	0x1456897f1 <.text+0x56887f1>
1456894cd:     	movups	0x24(%rsp), %xmm7
1456894d2:     	movss	0x28(%rsp), %xmm6
1456894d8:     	movsd	0x3c(%rsp), %xmm5
1456894de:     	movshdup	%xmm5, %xmm3            # xmm3 = xmm5[1,1,3,3]
1456894e2:     	movss	0x34(%rsp), %xmm0
1456894e8:     	movlhps	%xmm7, %xmm0            # xmm0 = xmm0[0],xmm7[0]
1456894eb:     	shufps	$0xe2, %xmm7, %xmm0     # xmm0 = xmm0[2,0],xmm7[2,3]
1456894ef:     	subps	%xmm5, %xmm0
1456894f2:     	movshdup	%xmm0, %xmm9            # xmm9 = xmm0[1,1,3,3]
1456894f7:     	mulss	%xmm0, %xmm9
1456894fc:     	movss	0x30(%rsp), %xmm7
145689502:     	movaps	%xmm5, %xmm8
145689506:     	subss	%xmm7, %xmm8
14568950b:     	movaps	%xmm6, %xmm7
14568950e:     	subss	%xmm3, %xmm7
145689512:     	mulss	%xmm8, %xmm7
145689517:     	addss	%xmm9, %xmm7
14568951c:     	movaps	0x28c25c(%rip), %xmm9   # 0x145915780
145689524:     	andps	%xmm7, %xmm9
145689528:     	ucomiss	%xmm9, %xmm4
14568952c:     	jbe	0x145689853 <.text+0x5688853>
145689532:     	movups	0x48(%rsp), %xmm7
145689537:     	movss	0x4c(%rsp), %xmm6
14568953d:     	movsd	0x60(%rsp), %xmm5
145689543:     	movshdup	%xmm5, %xmm3            # xmm3 = xmm5[1,1,3,3]
145689547:     	movss	0x58(%rsp), %xmm0
14568954d:     	movlhps	%xmm7, %xmm0            # xmm0 = xmm0[0],xmm7[0]
145689550:     	shufps	$0xe2, %xmm7, %xmm0     # xmm0 = xmm0[2,0],xmm7[2,3]
145689554:     	subps	%xmm5, %xmm0
145689557:     	movshdup	%xmm0, %xmm9            # xmm9 = xmm0[1,1,3,3]
14568955c:     	mulss	%xmm0, %xmm9
145689561:     	movss	0x54(%rsp), %xmm7
145689567:     	movaps	%xmm5, %xmm8
14568956b:     	subss	%xmm7, %xmm8
145689570:     	movaps	%xmm6, %xmm7
145689573:     	subss	%xmm3, %xmm7
145689577:     	mulss	%xmm8, %xmm7
14568957c:     	addss	%xmm9, %xmm7
145689581:     	movaps	0x28c1f7(%rip), %xmm9   # 0x145915780
145689589:     	andps	%xmm7, %xmm9
14568958d:     	ucomiss	%xmm9, %xmm4
145689591:     	jbe	0x1456898b4 <.text+0x56888b4>
145689597:     	movups	0x6c(%rsp), %xmm7
14568959c:     	movss	0x70(%rsp), %xmm6
1456895a2:     	movsd	0x84(%rsp), %xmm5
1456895ab:     	movshdup	%xmm5, %xmm3            # xmm3 = xmm5[1,1,3,3]
1456895af:     	movss	0x7c(%rsp), %xmm0
1456895b5:     	movlhps	%xmm7, %xmm0            # xmm0 = xmm0[0],xmm7[0]
1456895b8:     	shufps	$0xe2, %xmm7, %xmm0     # xmm0 = xmm0[2,0],xmm7[2,3]
1456895bc:     	subps	%xmm5, %xmm0
1456895bf:     	movshdup	%xmm0, %xmm9            # xmm9 = xmm0[1,1,3,3]
1456895c4:     	mulss	%xmm0, %xmm9
1456895c9:     	movss	0x78(%rsp), %xmm7
1456895cf:     	movaps	%xmm5, %xmm8
1456895d3:     	subss	%xmm7, %xmm8
1456895d8:     	movaps	%xmm6, %xmm7
1456895db:     	subss	%xmm3, %xmm7
1456895df:     	mulss	%xmm8, %xmm7
1456895e4:     	addss	%xmm9, %xmm7
1456895e9:     	movaps	0x28c18f(%rip), %xmm9   # 0x145915780
1456895f1:     	andps	%xmm7, %xmm9
1456895f5:     	xorl	%eax, %eax
1456895f7:     	ucomiss	%xmm9, %xmm4
1456895fb:     	ja	0x14568966e <.text+0x568866e>
1456895fd:     	shufps	$0xe1, %xmm0, %xmm0     # xmm0 = xmm0[1,0,2,3]
145689601:     	subss	%xmm6, %xmm3
145689605:     	subps	%xmm5, %xmm2
145689608:     	unpcklps	%xmm8, %xmm3            # xmm3 = xmm3[0],xmm8[0],xmm3[1],xmm8[1]
14568960c:     	mulps	%xmm2, %xmm0
14568960f:     	shufps	$0xe1, %xmm2, %xmm2     # xmm2 = xmm2[1,0,2,3]
145689613:     	shufps	$0xe1, %xmm3, %xmm3     # xmm3 = xmm3[1,0,2,3]
145689617:     	mulps	%xmm2, %xmm3
14568961a:     	addps	%xmm0, %xmm3
14568961d:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
145689621:     	divps	%xmm0, %xmm3
145689624:     	xorps	%xmm0, %xmm0
145689627:     	ucomiss	%xmm3, %xmm0
14568962a:     	ja	0x14568966e <.text+0x568866e>
14568962c:     	movshdup	%xmm3, %xmm2            # xmm2 = xmm3[1,1,3,3]
145689630:     	ucomiss	%xmm2, %xmm0
145689633:     	ja	0x14568966e <.text+0x568866e>
145689635:     	subss	%xmm3, %xmm1
145689639:     	movaps	%xmm1, %xmm0
14568963c:     	subss	%xmm2, %xmm0
145689640:     	xorps	%xmm1, %xmm1
145689643:     	ucomiss	%xmm0, %xmm1
145689646:     	ja	0x14568966e <.text+0x568866e>
145689648:     	leaq	0x6c(%rsp), %rax
14568964d:     	jmp	0x145689913 <.text+0x5688913>
145689652:     	movq	0x58(%rcx), %r8
145689656:     	movabsq	$-0x5555555555555555, %rdx # imm = 0xAAAAAAAAAAAAAAAB
145689660:     	movq	%r8, %rax
145689663:     	mulq	%rdx
145689666:     	cmpq	$0x3, %r8
14568966a:     	jae	0x1456896ab <.text+0x56886ab>
14568966c:     	xorl	%eax, %eax
14568966e:     	movaps	0x130(%rsp), %xmm6
145689676:     	movaps	0x140(%rsp), %xmm7
14568967e:     	movaps	0x150(%rsp), %xmm8
145689687:     	movaps	0x160(%rsp), %xmm9
145689690:     	movaps	0x170(%rsp), %xmm10
145689699:     	movaps	0x180(%rsp), %xmm11
1456896a2:     	addq	$0x190, %rsp            # imm = 0x190
1456896a9:     	popq	%rsi
1456896aa:     	retq
1456896ab:     	movq	0x50(%rcx), %rax
1456896af:     	addq	%rdx, %rdx
1456896b2:     	andq	$-0x4, %rdx
1456896b6:     	leaq	(%rdx,%rdx,2), %rcx
1456896ba:     	xorl	%edx, %edx
1456896bc:     	movaps	0x28c0bd(%rip), %xmm3   # 0x145915780
1456896c3:     	movss	0x576485(%rip), %xmm4   # 0x145bffb50
1456896cb:     	xorps	%xmm5, %xmm5
1456896ce:     	jmp	0x1456896d9 <.text+0x56886d9>
1456896d0:     	addq	$0xc, %rdx
1456896d4:     	cmpq	%rdx, %rcx
1456896d7:     	je	0x14568966c <.text+0x568866c>
1456896d9:     	movl	(%rax,%rdx), %r8d
1456896dd:     	cmpq	%r8, %r10
1456896e0:     	jbe	0x1456896d0 <.text+0x56886d0>
1456896e2:     	movl	0x4(%rax,%rdx), %r11d
1456896e7:     	cmpq	%r11, %r10
1456896ea:     	jbe	0x1456896d0 <.text+0x56886d0>
1456896ec:     	movl	0x8(%rax,%rdx), %esi
1456896f0:     	cmpq	%rsi, %r10
1456896f3:     	jbe	0x1456896d0 <.text+0x56886d0>
1456896f5:     	leaq	(%r8,%r8,2), %r8
1456896f9:     	movss	(%r9,%r8,4), %xmm0
1456896ff:     	movss	0x4(%r9,%r8,4), %xmm7
145689706:     	leaq	(%r11,%r11,2), %r11
14568970a:     	leaq	(%r9,%r11,4), %r11
14568970e:     	leaq	(%rsi,%rsi,2), %rsi
145689712:     	movsd	(%r9,%rsi,4), %xmm9
145689718:     	movshdup	%xmm9, %xmm6            # xmm6 = xmm9[1,1,3,3]
14568971d:     	movss	0x4(%r11), %xmm8
145689723:     	unpcklps	%xmm8, %xmm0            # xmm0 = xmm0[0],xmm8[0],xmm0[1],xmm8[1]
145689727:     	subps	%xmm9, %xmm0
14568972b:     	movshdup	%xmm0, %xmm11           # xmm11 = xmm0[1,1,3,3]
145689730:     	mulss	%xmm0, %xmm11
145689735:     	movss	(%r11), %xmm8
14568973a:     	movaps	%xmm9, %xmm10
14568973e:     	subss	%xmm8, %xmm10
145689743:     	movaps	%xmm7, %xmm8
145689747:     	subss	%xmm6, %xmm8
14568974c:     	mulss	%xmm10, %xmm8
145689751:     	addss	%xmm11, %xmm8
145689756:     	movaps	%xmm8, %xmm11
14568975a:     	andps	%xmm3, %xmm11
14568975e:     	ucomiss	%xmm11, %xmm4
145689762:     	ja	0x1456896d0 <.text+0x56886d0>
145689768:     	shufps	$0xe1, %xmm0, %xmm0     # xmm0 = xmm0[1,0,2,3]
14568976c:     	movaps	%xmm2, %xmm11
145689770:     	subps	%xmm9, %xmm11
145689774:     	subss	%xmm7, %xmm6
145689778:     	unpcklps	%xmm10, %xmm6           # xmm6 = xmm6[0],xmm10[0],xmm6[1],xmm10[1]
14568977c:     	mulps	%xmm11, %xmm0
145689780:     	shufps	$0xe1, %xmm11, %xmm11   # xmm11 = xmm11[1,0,2,3]
145689785:     	shufps	$0xe1, %xmm6, %xmm6     # xmm6 = xmm6[1,0,2,3]
145689789:     	mulps	%xmm11, %xmm6
14568978d:     	addps	%xmm0, %xmm6
145689790:     	movsldup	%xmm8, %xmm0            # xmm0 = xmm8[0,0,2,2]
145689795:     	divps	%xmm0, %xmm6
145689798:     	ucomiss	%xmm6, %xmm5
14568979b:     	ja	0x1456896d0 <.text+0x56886d0>
1456897a1:     	movshdup	%xmm6, %xmm7            # xmm7 = xmm6[1,1,3,3]
1456897a5:     	ucomiss	%xmm7, %xmm5
1456897a8:     	ja	0x1456896d0 <.text+0x56886d0>
1456897ae:     	movaps	%xmm1, %xmm0
1456897b1:     	subss	%xmm6, %xmm0
1456897b5:     	subss	%xmm7, %xmm0
1456897b9:     	ucomiss	%xmm0, %xmm5
1456897bc:     	ja	0x1456896d0 <.text+0x56886d0>
1456897c2:     	leaq	(%r9,%r8,4), %rax
1456897c6:     	leaq	(%r9,%rsi,4), %rcx
1456897ca:     	movss	0x8(%r11), %xmm1
1456897d0:     	movss	0x8(%rax), %xmm2
1456897d5:     	unpcklps	%xmm1, %xmm2            # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
1456897d8:     	mulps	%xmm2, %xmm6
1456897db:     	movshdup	%xmm6, %xmm1            # xmm1 = xmm6[1,1,3,3]
1456897df:     	addss	%xmm6, %xmm1
1456897e3:     	mulss	0x8(%rcx), %xmm0
1456897e8:     	addss	%xmm1, %xmm0
1456897ec:     	jmp	0x145689934 <.text+0x5688934>
1456897f1:     	shufps	$0xe1, %xmm0, %xmm0     # xmm0 = xmm0[1,0,2,3]
1456897f5:     	subss	%xmm6, %xmm3
1456897f9:     	movaps	%xmm2, %xmm6
1456897fc:     	subps	%xmm5, %xmm6
1456897ff:     	unpcklps	%xmm8, %xmm3            # xmm3 = xmm3[0],xmm8[0],xmm3[1],xmm8[1]
145689803:     	mulps	%xmm6, %xmm0
145689806:     	shufps	$0xe1, %xmm6, %xmm6     # xmm6 = xmm6[1,0,2,3]
14568980a:     	shufps	$0xe1, %xmm3, %xmm3     # xmm3 = xmm3[1,0,2,3]
14568980e:     	mulps	%xmm6, %xmm3
145689811:     	addps	%xmm0, %xmm3
145689814:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
145689818:     	divps	%xmm0, %xmm3
14568981b:     	xorps	%xmm0, %xmm0
14568981e:     	ucomiss	%xmm3, %xmm0
145689821:     	ja	0x1456894cd <.text+0x56884cd>
145689827:     	movshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
14568982b:     	ucomiss	%xmm5, %xmm0
14568982e:     	ja	0x1456894cd <.text+0x56884cd>
145689834:     	movaps	%xmm1, %xmm0
145689837:     	subss	%xmm3, %xmm0
14568983b:     	subss	%xmm5, %xmm0
14568983f:     	xorps	%xmm5, %xmm5
145689842:     	ucomiss	%xmm0, %xmm5
145689845:     	ja	0x1456894cd <.text+0x56884cd>
14568984b:     	movq	%rsp, %rax
14568984e:     	jmp	0x145689913 <.text+0x5688913>
145689853:     	shufps	$0xe1, %xmm0, %xmm0     # xmm0 = xmm0[1,0,2,3]
145689857:     	subss	%xmm6, %xmm3
14568985b:     	movaps	%xmm2, %xmm6
14568985e:     	subps	%xmm5, %xmm6
145689861:     	unpcklps	%xmm8, %xmm3            # xmm3 = xmm3[0],xmm8[0],xmm3[1],xmm8[1]
145689865:     	mulps	%xmm6, %xmm0
145689868:     	shufps	$0xe1, %xmm6, %xmm6     # xmm6 = xmm6[1,0,2,3]
14568986c:     	shufps	$0xe1, %xmm3, %xmm3     # xmm3 = xmm3[1,0,2,3]
145689870:     	mulps	%xmm6, %xmm3
145689873:     	addps	%xmm0, %xmm3
145689876:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
14568987a:     	divps	%xmm0, %xmm3
14568987d:     	xorps	%xmm0, %xmm0
145689880:     	ucomiss	%xmm3, %xmm0
145689883:     	ja	0x145689532 <.text+0x5688532>
145689889:     	movshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
14568988d:     	ucomiss	%xmm5, %xmm0
145689890:     	ja	0x145689532 <.text+0x5688532>
145689896:     	movaps	%xmm1, %xmm0
145689899:     	subss	%xmm3, %xmm0
14568989d:     	subss	%xmm5, %xmm0
1456898a1:     	xorps	%xmm5, %xmm5
1456898a4:     	ucomiss	%xmm0, %xmm5
1456898a7:     	ja	0x145689532 <.text+0x5688532>
1456898ad:     	leaq	0x24(%rsp), %rax
1456898b2:     	jmp	0x145689913 <.text+0x5688913>
1456898b4:     	shufps	$0xe1, %xmm0, %xmm0     # xmm0 = xmm0[1,0,2,3]
1456898b8:     	subss	%xmm6, %xmm3
1456898bc:     	movaps	%xmm2, %xmm6
1456898bf:     	subps	%xmm5, %xmm6
1456898c2:     	unpcklps	%xmm8, %xmm3            # xmm3 = xmm3[0],xmm8[0],xmm3[1],xmm8[1]
1456898c6:     	mulps	%xmm6, %xmm0
1456898c9:     	shufps	$0xe1, %xmm6, %xmm6     # xmm6 = xmm6[1,0,2,3]
1456898cd:     	shufps	$0xe1, %xmm3, %xmm3     # xmm3 = xmm3[1,0,2,3]
1456898d1:     	mulps	%xmm6, %xmm3
1456898d4:     	addps	%xmm0, %xmm3
1456898d7:     	movsldup	%xmm7, %xmm0            # xmm0 = xmm7[0,0,2,2]
1456898db:     	divps	%xmm0, %xmm3
1456898de:     	xorps	%xmm0, %xmm0
1456898e1:     	ucomiss	%xmm3, %xmm0
1456898e4:     	ja	0x145689597 <.text+0x5688597>
1456898ea:     	movshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
1456898ee:     	ucomiss	%xmm5, %xmm0
1456898f1:     	ja	0x145689597 <.text+0x5688597>
1456898f7:     	movaps	%xmm1, %xmm0
1456898fa:     	subss	%xmm3, %xmm0
1456898fe:     	subss	%xmm5, %xmm0
145689902:     	xorps	%xmm5, %xmm5
145689905:     	ucomiss	%xmm0, %xmm5
145689908:     	ja	0x145689597 <.text+0x5688597>
14568990e:     	leaq	0x48(%rsp), %rax
145689913:     	movss	0x8(%rax), %xmm1
145689918:     	movss	0x14(%rax), %xmm2
14568991d:     	unpcklps	%xmm2, %xmm1            # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
145689920:     	mulps	%xmm3, %xmm1
145689923:     	movshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
145689927:     	addss	%xmm1, %xmm2
14568992b:     	mulss	0x20(%rax), %xmm0
145689930:     	addss	%xmm2, %xmm0
145689934:     	movl	$0x1, %eax
145689939:     	jmp	0x14568966e <.text+0x568866e>
