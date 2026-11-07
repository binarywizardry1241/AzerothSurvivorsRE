
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145424750:     	movd	(%rcx), %xmm0
145424754:     	pxor	%xmm1, %xmm1
145424758:     	punpcklwd	%xmm1, %xmm0    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3]
14542475c:     	cvtdq2ps	%xmm0, %xmm0
14542475f:     	movaps	0x12b5c9a(%rip), %xmm2  # 0x1466da400
145424766:     	addps	%xmm2, %xmm0
145424769:     	movaps	0x11bdc60(%rip), %xmm3  # 0x1465e23d0
145424770:     	divps	%xmm3, %xmm0
145424773:     	mulps	0x12b5c96(%rip), %xmm0  # 0x1466da410
14542477a:     	movd	0x4(%rcx), %xmm4
14542477f:     	punpcklwd	%xmm1, %xmm4    # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1],xmm4[2],xmm1[2],xmm4[3],xmm1[3]
145424783:     	cvtdq2ps	%xmm4, %xmm1
145424786:     	addps	%xmm2, %xmm1
145424789:     	divps	%xmm3, %xmm1
14542478c:     	mulps	0x12b5c8d(%rip), %xmm1  # 0x1466da420
145424793:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
145424797:     	addss	%xmm0, %xmm2
14542479b:     	addss	%xmm1, %xmm2
14542479f:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
1454247a3:     	addss	%xmm2, %xmm0
1454247a7:     	addss	0x483c71(%rip), %xmm0   # 0x1458a8420
1454247af:     	retq
1454247b0:     	subq	$0x28, %rsp
1454247b4:     	cmpq	$0x3, %rdx
1454247b8:     	ja	0x145424810 <.text+0x5423810>
1454247ba:     	leaq	(%rdx,%rdx,2), %rax
1454247be:     	shlq	$0x4, %rax
1454247c2:     	leaq	0x1470c7f(%rip), %r9    # 0x146895448
1454247c9:     	movzwl	0x26(%rax,%r9), %r10d
1454247cf:     	testl	%r8d, %r8d
1454247d2:     	sets	%r8b
1454247d6:     	setg	%r11b
1454247da:     	subb	%r8b, %r11b
1454247dd:     	movsbl	%r11b, %r8d
1454247e1:     	movzwl	0x28(%rax,%r9), %eax
1454247e7:     	imull	%r8d, %eax
1454247eb:     	movzwl	(%rcx,%rdx,2), %r8d
1454247f0:     	addl	%eax, %r8d
1454247f3:     	cmpl	%r10d, %r8d
1454247f6:     	cmovbl	%r8d, %r10d
1454247fa:     	cmpl	$0x64, %r8d
1454247fe:     	movl	$0x64, %eax
145424803:     	cmovgel	%r10d, %eax
145424807:     	movw	%ax, (%rcx,%rdx,2)
14542480b:     	addq	$0x28, %rsp
14542480f:     	retq
145424810:     	leaq	0x1470d19(%rip), %r8    # 0x146895530
145424817:     	movq	%rdx, %rcx
14542481a:     	movl	$0x4, %edx
14542481f:     	callq	0x1458a3f23 <.text+0x58a2f23>
145424824:     	ud2
145424826:     	int3
145424827:     	int3
145424828:     	int3
145424829:     	int3
14542482a:     	int3
14542482b:     	int3
14542482c:     	int3
14542482d:     	int3
14542482e:     	int3
14542482f:     	int3
145424830:     	movd	(%rcx), %xmm0
145424834:     	pxor	%xmm1, %xmm1
145424838:     	punpcklwd	%xmm1, %xmm0    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3]
14542483c:     	cvtdq2ps	%xmm0, %xmm0
14542483f:     	movaps	0x12b5bba(%rip), %xmm2  # 0x1466da400
145424846:     	addps	%xmm2, %xmm0
145424849:     	movaps	0x11bdb80(%rip), %xmm3  # 0x1465e23d0
145424850:     	divps	%xmm3, %xmm0
145424853:     	mulps	0x12b5bb6(%rip), %xmm0  # 0x1466da410
14542485a:     	movd	0x4(%rcx), %xmm4
14542485f:     	punpcklwd	%xmm1, %xmm4    # xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1],xmm4[2],xmm1[2],xmm4[3],xmm1[3]
145424863:     	cvtdq2ps	%xmm4, %xmm1
145424866:     	addps	%xmm2, %xmm1
145424869:     	divps	%xmm3, %xmm1
14542486c:     	mulps	0x12b5bad(%rip), %xmm1  # 0x1466da420
145424873:     	movshdup	%xmm0, %xmm2            # xmm2 = xmm0[1,1,3,3]
145424877:     	addss	%xmm0, %xmm2
14542487b:     	addss	%xmm1, %xmm2
14542487f:     	movshdup	%xmm1, %xmm0            # xmm0 = xmm1[1,1,3,3]
145424883:     	addss	%xmm2, %xmm0
145424887:     	addss	0x483b91(%rip), %xmm0   # 0x1458a8420
14542488f:     	minss	0x483a39(%rip), %xmm0   # 0x1458a82d0
145424897:     	retq
