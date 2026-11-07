
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454205d0:     	subq	$0x58, %rsp
1454205d4:     	movaps	%xmm10, 0x40(%rsp)
1454205da:     	movaps	%xmm9, 0x30(%rsp)
1454205e0:     	movaps	%xmm8, 0x20(%rsp)
1454205e6:     	movaps	%xmm7, 0x10(%rsp)
1454205eb:     	movaps	%xmm6, (%rsp)
1454205ef:     	unpcklps	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
1454205f2:     	testq	%rdx, %rdx
1454205f5:     	je	0x145420774 <.text+0x541f774>
1454205fb:     	cmpq	$0x1, %rdx
1454205ff:     	jne	0x145420615 <.text+0x541f615>
145420601:     	movsd	(%rcx), %xmm0
145420605:     	movss	0x5e7c9f(%rip), %xmm1   # 0x145a082ac
14542060d:     	movaps	%xmm2, %xmm3
145420610:     	jmp	0x1454206f0 <.text+0x541f6f0>
145420615:     	movsd	(%rcx), %xmm0
145420619:     	movss	0x5e7c8b(%rip), %xmm1   # 0x145a082ac
145420621:     	movl	$0x1, %eax
145420626:     	movss	0x5c49e2(%rip), %xmm4   # 0x1459e5010
14542062e:     	movss	0x4e6e5a(%rip), %xmm5   # 0x145907490
145420636:     	movaps	%xmm2, %xmm6
145420639:     	nopl	(%rax)
145420640:     	movaps	%xmm0, %xmm7
145420643:     	movaps	%xmm1, %xmm3
145420646:     	movsd	(%rcx,%rax,8), %xmm0
14542064b:     	movaps	%xmm0, %xmm1
14542064e:     	subps	%xmm7, %xmm1
145420651:     	movaps	%xmm1, %xmm8
145420655:     	mulps	%xmm1, %xmm8
145420659:     	movshdup	%xmm8, %xmm9            # xmm9 = xmm8[1,1,3,3]
14542065e:     	addss	%xmm8, %xmm9
145420663:     	maxss	%xmm4, %xmm9
145420668:     	movaps	%xmm2, %xmm8
14542066c:     	subps	%xmm7, %xmm8
145420670:     	mulps	%xmm1, %xmm8
145420674:     	movshdup	%xmm8, %xmm10           # xmm10 = xmm8[1,1,3,3]
145420679:     	addss	%xmm8, %xmm10
14542067e:     	divss	%xmm9, %xmm10
145420683:     	xorps	%xmm8, %xmm8
145420687:     	maxss	%xmm10, %xmm8
14542068c:     	movaps	%xmm5, %xmm9
145420690:     	minss	%xmm8, %xmm9
145420695:     	movsldup	%xmm9, %xmm8            # xmm8 = xmm9[0,0,2,2]
14542069a:     	mulps	%xmm1, %xmm8
14542069e:     	addps	%xmm7, %xmm8
1454206a2:     	movaps	%xmm8, %xmm7
1454206a6:     	subps	%xmm2, %xmm7
1454206a9:     	mulps	%xmm7, %xmm7
1454206ac:     	movshdup	%xmm7, %xmm1            # xmm1 = xmm7[1,1,3,3]
1454206b0:     	addss	%xmm7, %xmm1
1454206b4:     	xorl	%r8d, %r8d
1454206b7:     	ucomiss	%xmm1, %xmm3
1454206ba:     	seta	%r8b
1454206be:     	minss	%xmm3, %xmm1
1454206c2:     	movd	%r8d, %xmm3
1454206c7:     	pshufd	$0x0, %xmm3, %xmm3      # xmm3 = xmm3[0,0,0,0]
1454206cc:     	pslld	$0x1f, %xmm3
1454206d1:     	psrad	$0x1f, %xmm3
1454206d6:     	andps	%xmm3, %xmm8
1454206da:     	andnps	%xmm6, %xmm3
1454206dd:     	orps	%xmm8, %xmm3
1454206e1:     	incq	%rax
1454206e4:     	movaps	%xmm3, %xmm6
1454206e7:     	cmpq	%rax, %rdx
1454206ea:     	jne	0x145420640 <.text+0x541f640>
1454206f0:     	movsd	(%rcx), %xmm4
1454206f4:     	subps	%xmm0, %xmm4
1454206f7:     	movaps	%xmm4, %xmm5
1454206fa:     	mulps	%xmm4, %xmm5
1454206fd:     	movshdup	%xmm5, %xmm6            # xmm6 = xmm5[1,1,3,3]
145420701:     	addss	%xmm5, %xmm6
145420705:     	maxss	0x5c4903(%rip), %xmm6   # 0x1459e5010
14542070d:     	movaps	%xmm2, %xmm5
145420710:     	subps	%xmm0, %xmm5
145420713:     	mulps	%xmm4, %xmm5
145420716:     	movshdup	%xmm5, %xmm7            # xmm7 = xmm5[1,1,3,3]
14542071a:     	addss	%xmm5, %xmm7
14542071e:     	divss	%xmm6, %xmm7
145420722:     	xorps	%xmm5, %xmm5
145420725:     	maxss	%xmm7, %xmm5
145420729:     	movss	0x4e6d5f(%rip), %xmm6   # 0x145907490
145420731:     	minss	%xmm5, %xmm6
145420735:     	movsldup	%xmm6, %xmm5            # xmm5 = xmm6[0,0,2,2]
145420739:     	mulps	%xmm4, %xmm5
14542073c:     	addps	%xmm0, %xmm5
14542073f:     	movaps	%xmm5, %xmm0
145420742:     	subps	%xmm2, %xmm0
145420745:     	mulps	%xmm0, %xmm0
145420748:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
14542074c:     	addss	%xmm0, %xmm2
145420750:     	xorl	%eax, %eax
145420752:     	ucomiss	%xmm2, %xmm1
145420755:     	seta	%al
145420758:     	movd	%eax, %xmm0
14542075c:     	pshufd	$0x0, %xmm0, %xmm2      # xmm2 = xmm0[0,0,0,0]
145420761:     	pslld	$0x1f, %xmm2
145420766:     	psrad	$0x1f, %xmm2
14542076b:     	andps	%xmm2, %xmm5
14542076e:     	andnps	%xmm3, %xmm2
145420771:     	orps	%xmm5, %xmm2
145420774:     	movd	%xmm2, %eax
145420778:     	movshdup	%xmm2, %xmm0            # xmm0 = xmm2[1,1,3,3]
14542077c:     	movd	%xmm0, %ecx
145420780:     	shlq	$0x20, %rcx
145420784:     	orq	%rcx, %rax
145420787:     	movaps	(%rsp), %xmm6
14542078b:     	movaps	0x10(%rsp), %xmm7
145420790:     	movaps	0x20(%rsp), %xmm8
145420796:     	movaps	0x30(%rsp), %xmm9
14542079c:     	movaps	0x40(%rsp), %xmm10
1454207a2:     	addq	$0x58, %rsp
1454207a6:     	retq
