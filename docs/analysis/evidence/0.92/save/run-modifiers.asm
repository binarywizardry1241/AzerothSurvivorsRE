
AzerothSurvivors/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145424520:     	pushq	%rsi
145424521:     	subq	$0x80, %rsp
145424528:     	movq	$0x0, 0x38(%rsp)
145424531:     	movq	%rdx, 0x40(%rsp)
145424536:     	movq	%rcx, 0x48(%rsp)
14542453b:     	movq	%rdx, 0x50(%rsp)
145424540:     	movq	$0x0, 0x58(%rsp)
145424549:     	movq	%rdx, 0x60(%rsp)
14542454e:     	movabsq	$0x2c0000002c, %rax     # imm = 0x2C0000002C
145424558:     	movq	%rax, 0x68(%rsp)
14542455d:     	movb	$0x1, 0x70(%rsp)
145424562:     	movw	$0x1, 0x78(%rsp)
145424569:     	leaq	0x20(%rsp), %rcx
14542456e:     	leaq	0x38(%rsp), %rdx
145424573:     	callq	0x1454e4ab0 <.text+0x54e3ab0>
145424578:     	cmpq	$0x4, 0x30(%rsp)
14542457e:     	jne	0x1454245a2 <.text+0x54235a2>
145424580:     	movq	0x20(%rsp), %rdx
145424585:     	movq	0x28(%rsp), %rcx
14542458a:     	movq	(%rcx), %rsi
14542458d:     	testq	%rdx, %rdx
145424590:     	je	0x1454245d2 <.text+0x54235d2>
145424592:     	addq	%rdx, %rdx
145424595:     	movl	$0x2, %r8d
14542459b:     	callq	0x1400021d0 <.text+0x11d0>
1454245a0:     	jmp	0x1454245d2 <.text+0x54235d2>
1454245a2:     	movq	0x20(%rsp), %rdx
1454245a7:     	movq	0x28(%rsp), %rsi
1454245ac:     	cmpq	$-0x1, %rdx
1454245b0:     	je	0x1454245d2 <.text+0x54235d2>
1454245b2:     	testq	%rdx, %rdx
1454245b5:     	je	0x1454245c8 <.text+0x54235c8>
1454245b7:     	addq	%rdx, %rdx
1454245ba:     	movl	$0x2, %r8d
1454245c0:     	movq	%rsi, %rcx
1454245c3:     	callq	0x1400021d0 <.text+0x11d0>
1454245c8:     	movabsq	$0x64006400640064, %rsi # imm = 0x64006400640064
1454245d2:     	movq	%rsi, %rcx
1454245d5:     	shrq	$0x30, %rcx
1454245d9:     	movq	%rsi, %rdx
1454245dc:     	shrq	$0x20, %rdx
1454245e0:     	movl	%esi, %r8d
1454245e3:     	shrl	$0x10, %r8d
1454245e7:     	movd	%r8d, %xmm0
1454245ec:     	pinsrw	$0x1, %edx, %xmm0
1454245f1:     	pxor	0x5c9627(%rip), %xmm0   # 0x1459edc20
1454245f9:     	movdqa	0x1470aef(%rip), %xmm1  # 0x1468950f0
145424601:     	pcmpgtw	%xmm0, %xmm1
145424605:     	xorl	%eax, %eax
145424607:     	cmpw	$0x64, %si
14542460b:     	setb	%al
14542460e:     	movq	%rsi, %r9
145424611:     	shrq	$0x32, %r9
145424615:     	movd	%ecx, %xmm2
145424619:     	pinsrw	$0x1, %edx, %xmm2
14542461e:     	pinsrw	$0x2, %r8d, %xmm2
145424624:     	pinsrw	$0x3, %esi, %xmm2
145424629:     	xorl	%ecx, %ecx
14542462b:     	movdqa	%xmm2, %xmm0
14542462f:     	psubusw	0x1470ac9(%rip), %xmm0  # 0x146895100
145424637:     	cmpl	$0x19, %r9d
14542463b:     	psubw	%xmm0, %xmm2
14542463f:     	paddw	0x1470ac9(%rip), %xmm2  # 0x146895110
145424647:     	setb	%cl
14542464a:     	pextrw	$0x1, %xmm1, %edx
14542464f:     	movd	%ecx, %xmm0
145424653:     	pinsrw	$0x1, %edx, %xmm0
145424658:     	pextrw	$0x0, %xmm1, %ecx
14542465d:     	pinsrw	$0x2, %ecx, %xmm0
145424662:     	pinsrw	$0x3, %eax, %xmm0
145424667:     	psllw	$0xf, %xmm0
14542466c:     	psraw	$0xf, %xmm0
145424671:     	pandn	%xmm2, %xmm0
145424675:     	pextrw	$0x1, %xmm0, %eax
14542467a:     	imull	$0xcccd, %eax, %ecx     # imm = 0xCCCD
145424680:     	shrl	$0x12, %ecx
145424683:     	andl	$-0x2, %ecx
145424686:     	leal	(%rcx,%rcx,4), %ecx
145424689:     	subl	%ecx, %eax
14542468b:     	movd	%xmm0, %ecx
14542468f:     	movzwl	%cx, %edx
145424692:     	imull	$0xcccd, %edx, %edx     # imm = 0xCCCD
145424698:     	shrl	$0x12, %edx
14542469b:     	leal	(%rdx,%rdx,4), %edx
14542469e:     	subl	%edx, %ecx
1454246a0:     	movd	%ecx, %xmm1
1454246a4:     	pinsrw	$0x1, %eax, %xmm1
1454246a9:     	pextrw	$0x2, %xmm0, %eax
1454246ae:     	imull	$0x47af, %eax, %ecx     # imm = 0x47AF
1454246b4:     	shrl	$0x10, %ecx
1454246b7:     	movl	%eax, %edx
1454246b9:     	subl	%ecx, %edx
1454246bb:     	movzwl	%dx, %edx
1454246be:     	shrl	%edx
1454246c0:     	addl	%ecx, %edx
1454246c2:     	shrl	$0x4, %edx
1454246c5:     	leal	(%rdx,%rdx,4), %ecx
1454246c8:     	leal	(%rcx,%rcx,4), %ecx
1454246cb:     	subl	%ecx, %eax
1454246cd:     	pinsrw	$0x2, %eax, %xmm1
1454246d2:     	pextrw	$0x3, %xmm0, %eax
1454246d7:     	imull	$0x47af, %eax, %ecx     # imm = 0x47AF
1454246dd:     	shrl	$0x10, %ecx
1454246e0:     	movl	%eax, %edx
1454246e2:     	subl	%ecx, %edx
1454246e4:     	movzwl	%dx, %edx
1454246e7:     	shrl	%edx
1454246e9:     	addl	%ecx, %edx
1454246eb:     	shrl	$0x4, %edx
1454246ee:     	leal	(%rdx,%rdx,4), %ecx
1454246f1:     	leal	(%rcx,%rcx,4), %ecx
1454246f4:     	subl	%ecx, %eax
1454246f6:     	pinsrw	$0x3, %eax, %xmm1
1454246fb:     	psubw	%xmm1, %xmm0
1454246ff:     	paddw	0x1470a19(%rip), %xmm0  # 0x146895120
145424707:     	pxor	%xmm1, %xmm1
14542470b:     	movdqa	%xmm0, %xmm2
14542470f:     	punpcklwd	%xmm1, %xmm2    # xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1],xmm2[2],xmm1[2],xmm2[3],xmm1[3]
145424713:     	movdqa	%xmm2, %xmm3
145424717:     	punpckhdq	%xmm1, %xmm3    # xmm3 = xmm3[2],xmm1[2],xmm3[3],xmm1[3]
14542471b:     	punpckldq	%xmm2, %xmm1    # xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
14542471f:     	psllq	$0x30, %xmm0
145424724:     	shufps	$0xe4, %xmm1, %xmm0     # xmm0 = xmm0[0,1],xmm1[2,3]
145424728:     	movdqa	%xmm3, %xmm1
14542472c:     	psllq	$0x10, %xmm1
145424731:     	shufps	$0xe4, %xmm3, %xmm1     # xmm1 = xmm1[0,1],xmm3[2,3]
145424735:     	orps	%xmm0, %xmm1
145424738:     	pshufd	$0xee, %xmm1, %xmm0     # xmm0 = xmm1[2,3,2,3]
14542473d:     	por	%xmm1, %xmm0
145424741:     	movq	%xmm0, %rax
145424746:     	addq	$0x80, %rsp
14542474d:     	popq	%rsi
14542474e:     	retq
