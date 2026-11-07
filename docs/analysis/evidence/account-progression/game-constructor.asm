
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ad570:     	pushq	%rbp
1454ad571:     	pushq	%r15
1454ad573:     	pushq	%r14
1454ad575:     	pushq	%r13
1454ad577:     	pushq	%r12
1454ad579:     	pushq	%rsi
1454ad57a:     	pushq	%rdi
1454ad57b:     	pushq	%rbx
1454ad57c:     	subq	$0xd28, %rsp            # imm = 0xD28
1454ad583:     	leaq	0x80(%rsp), %rbp
1454ad58b:     	movaps	%xmm15, 0xc90(%rbp)
1454ad593:     	movaps	%xmm14, 0xc80(%rbp)
1454ad59b:     	movaps	%xmm13, 0xc70(%rbp)
1454ad5a3:     	movaps	%xmm12, 0xc60(%rbp)
1454ad5ab:     	movaps	%xmm11, 0xc50(%rbp)
1454ad5b3:     	movaps	%xmm10, 0xc40(%rbp)
1454ad5bb:     	movaps	%xmm9, 0xc30(%rbp)
1454ad5c3:     	movaps	%xmm8, 0xc20(%rbp)
1454ad5cb:     	movaps	%xmm7, 0xc10(%rbp)
1454ad5d2:     	movaps	%xmm6, 0xc00(%rbp)
1454ad5d9:     	movq	$-0x2, 0xbf8(%rbp)
1454ad5e4:     	movq	%r8, 0xbb0(%rbp)
1454ad5eb:     	movq	%rdx, %rsi
1454ad5ee:     	movq	%r8, 0xb18(%rbp)
1454ad5f5:     	movzbl	0x16c(%rdx), %edx
1454ad5fc:     	leal	-0x2(%rdx), %eax
1454ad5ff:     	cmpb	$0x9, %al
1454ad601:     	movq	%rcx, 0xb00(%rbp)
1454ad608:     	movq	%rdx, 0xbd8(%rbp)
1454ad60f:     	ja	0x1454ad621 <.text+0x54ac621>
1454ad611:     	movzbl	%al, %eax
1454ad614:     	leaq	0x154aea5(%rip), %rcx   # 0x1469f84c0
1454ad61b:     	movq	(%rcx,%rax,8), %rdi
1454ad61f:     	jmp	0x1454ad628 <.text+0x54ac628>
1454ad621:     	leaq	0x1288220(%rip), %rdi   # 0x146735848
1454ad628:     	movl	0xec(%rsi), %r12d
1454ad62f:     	movq	0xf8(%rsi), %rcx
1454ad636:     	movq	0x100(%rsi), %rdx
1454ad63d:     	callq	0x145420480 <.text+0x541f480>
1454ad642:     	movq	%rax, %r14
1454ad645:     	movq	%rsi, 0xbe8(%rbp)
1454ad64c:     	leaq	0x18(%rsi), %rdx
1454ad650:     	movb	$0x1, 0xbf4(%rbp)
1454ad657:     	leaq	-0x58(%rbp), %rcx
1454ad65b:     	callq	0x145451a00 <.text+0x5450a00>
1454ad660:     	nop
1454ad661:     	imulq	$0xf0, %r14, %rax
1454ad668:     	leaq	0x1285ea9(%rip), %rbx   # 0x146733518
1454ad66f:     	addq	%rax, %rbx
1454ad672:     	movq	0x40(%rdi), %r14
1454ad676:     	movq	%rdi, 0xbe0(%rbp)
1454ad67d:     	movq	0x48(%rdi), %r15
1454ad681:     	movq	%r14, 0xb50(%rbp)
1454ad688:     	movq	%r15, 0xb58(%rbp)
1454ad68f:     	xorl	%r13d, %r13d
1454ad692:     	leaq	0x12894af(%rip), %rsi   # 0x146736b48
1454ad699:     	jmp	0x1454ad6b1 <.text+0x54ac6b1>
1454ad69b:     	nopl	(%rax,%rax)
1454ad6a0:     	addq	$0x78, %r13
1454ad6a4:     	cmpq	$0x3480, %r13           # imm = 0x3480
1454ad6ab:     	je	0x1454ae8a3 <.text+0x54ad8a3>
1454ad6b1:     	cmpq	%r15, 0x8(%r13,%rsi)
1454ad6b6:     	jne	0x1454ad6a0 <.text+0x54ac6a0>
1454ad6b8:     	movq	(%r13,%rsi), %rcx
1454ad6bd:     	movq	%r14, %rdx
1454ad6c0:     	movq	%r15, %r8
1454ad6c3:     	callq	0x1457731e7 <.text+0x57721e7>
1454ad6c8:     	testl	%eax, %eax
1454ad6ca:     	jne	0x1454ad6a0 <.text+0x54ac6a0>
1454ad6cc:     	movq	0xbe8(%rbp), %rax
1454ad6d3:     	movzbl	0x16d(%rax), %r14d
1454ad6db:     	leal	-0x2(%r14), %eax
1454ad6df:     	cmpb	$0x6, %al
1454ad6e1:     	movl	%r12d, 0xb4c(%rbp)
1454ad6e8:     	ja	0x1454ad6fa <.text+0x54ac6fa>
1454ad6ea:     	movzbl	%al, %eax
1454ad6ed:     	leaq	0x154ad94(%rip), %rcx   # 0x1469f8488
1454ad6f4:     	movq	(%rcx,%rax,8), %rax
1454ad6f8:     	jmp	0x1454ad701 <.text+0x54ac701>
1454ad6fa:     	leaq	0x1286fd7(%rip), %rax   # 0x1467346d8
1454ad701:     	addq	%rsi, %r13
1454ad704:     	movq	0x30(%rax), %r15
1454ad708:     	movq	0x38(%rax), %r12
1454ad70c:     	movq	%r15, 0xb50(%rbp)
1454ad713:     	movq	%r12, 0xb58(%rbp)
1454ad71a:     	xorl	%edi, %edi
1454ad71c:     	jmp	0x1454ad731 <.text+0x54ac731>
1454ad71e:     	nop
1454ad720:     	addq	$0x78, %rdi
1454ad724:     	cmpq	$0x3480, %rdi           # imm = 0x3480
1454ad72b:     	je	0x1454ae8e1 <.text+0x54ad8e1>
1454ad731:     	cmpq	%r12, 0x8(%rdi,%rsi)
1454ad736:     	jne	0x1454ad720 <.text+0x54ac720>
1454ad738:     	movq	(%rdi,%rsi), %rcx
1454ad73c:     	movq	%r15, %rdx
1454ad73f:     	movq	%r12, %r8
1454ad742:     	callq	0x1457731e7 <.text+0x57721e7>
1454ad747:     	testl	%eax, %eax
1454ad749:     	jne	0x1454ad720 <.text+0x54ac720>
1454ad74b:     	movsd	0xc8(%rbx), %xmm6
1454ad753:     	movshdup	%xmm6, %xmm8            # xmm8 = xmm6[1,1,3,3]
1454ad758:     	movq	0xbb0(%rbp), %r15
1454ad75f:     	leaq	0x10(%r15), %rcx
1454ad763:     	movb	$0x1, 0xbf6(%rbp)
1454ad76a:     	movb	$0x1, 0xbf5(%rbp)
1454ad771:     	movaps	%xmm6, %xmm1
1454ad774:     	movaps	%xmm8, %xmm2
1454ad778:     	callq	0x14552a140 <.text+0x5529140>
1454ad77d:     	nop
1454ad77e:     	testb	$0x1, %al
1454ad780:     	je	0x1454ad787 <.text+0x54ac787>
1454ad782:     	movaps	%xmm0, %xmm7
1454ad785:     	jmp	0x1454ad7c7 <.text+0x54ac7c7>
1454ad787:     	cmpq	$-0x1, 0x68(%r15)
1454ad78c:     	je	0x1454ad7be <.text+0x54ac7be>
1454ad78e:     	leaq	0x68(%r15), %rdx
1454ad792:     	movb	$0x1, 0xbf6(%rbp)
1454ad799:     	movb	$0x1, 0xbf5(%rbp)
1454ad7a0:     	leaq	0x28(%rbp), %rcx
1454ad7a4:     	movaps	%xmm6, %xmm2
1454ad7a7:     	movaps	%xmm8, %xmm3
1454ad7ab:     	callq	0x14552d220 <.text+0x552c220>
1454ad7b0:     	nop
1454ad7b1:     	cmpl	$0x1, 0x28(%rbp)
1454ad7b5:     	jne	0x1454ad7be <.text+0x54ac7be>
1454ad7b7:     	movss	0x34(%rbp), %xmm7
1454ad7bc:     	jmp	0x1454ad7c7 <.text+0x54ac7c7>
1454ad7be:     	movss	0xb8(%r15), %xmm7
1454ad7c7:     	movq	0xbe8(%rbp), %rax
1454ad7ce:     	movq	0x110(%rax), %rdx
1454ad7d5:     	movb	$0x1, 0xbf6(%rbp)
1454ad7dc:     	movb	$0x1, 0xbf5(%rbp)
1454ad7e3:     	leaq	0x8(%rbp), %rcx
1454ad7e7:     	callq	0x14551da20 <.text+0x551ca20>
1454ad7ec:     	nop
1454ad7ed:     	movq	0xbe8(%rbp), %r15
1454ad7f4:     	movq	0x108(%r15), %r12
1454ad7fb:     	movss	0xd4(%rbx), %xmm10
1454ad804:     	movq	0xbe0(%rbp), %rax
1454ad80b:     	movss	0x80(%rax), %xmm9
1454ad814:     	callq	0x140002200 <.text+0x1200>
1454ad819:     	movl	$0x58, %ecx
1454ad81e:     	movl	$0x8, %edx
1454ad823:     	callq	0x1400021c0 <.text+0x11c0>
1454ad828:     	testq	%rax, %rax
1454ad82b:     	je	0x1454ae86b <.text+0x54ad86b>
1454ad831:     	movq	%r13, (%rax)
1454ad834:     	movl	$0x1, 0x8(%rax)
1454ad83b:     	movsd	0x46ae8c(%rip), %xmm12  # 0x1459186d0
1454ad844:     	movsd	%xmm12, 0xc(%rax)
1454ad84a:     	movq	$0x3f800000, 0x14(%rax) # imm = 0x3F800000
1454ad852:     	movsd	0x459cf5(%rip), %xmm13  # 0x145907550
1454ad85b:     	movsd	%xmm13, 0x1c(%rax)
1454ad861:     	xorps	%xmm0, %xmm0
1454ad864:     	movups	%xmm0, 0x24(%rax)
1454ad868:     	movl	$0x0, 0x34(%rax)
1454ad86f:     	movsd	%xmm13, 0x38(%rax)
1454ad875:     	movl	$0x0, 0x40(%rax)
1454ad87c:     	movaps	0x46ae5c(%rip), %xmm11  # 0x1459186e0
1454ad884:     	movq	%rax, 0xb20(%rbp)
1454ad88b:     	movups	%xmm11, 0x44(%rax)
1454ad890:     	movq	$0x0, 0xbb8(%rbp)
1454ad89b:     	movq	$0x8, 0xbc0(%rbp)
1454ad8a6:     	movq	$0x0, 0xbc8(%rbp)
1454ad8b1:     	movq	%r15, %rax
1454ad8b4:     	addq	$0x120, %r15            # imm = 0x120
1454ad8bb:     	addq	$0x30, %rax
1454ad8bf:     	movq	%rax, 0x20(%rsp)
1454ad8c4:     	leaq	0xb50(%rbp), %rcx
1454ad8cb:     	movl	%r14d, %edx
1454ad8ce:     	movq	0xbd8(%rbp), %r8
1454ad8d5:     	movq	%r15, %r9
1454ad8d8:     	callq	0x14546ec80 <.text+0x546dc80>
1454ad8dd:     	nop
1454ad8de:     	leaq	0xb28(%rbp), %rcx
1454ad8e5:     	movq	%r15, %rdx
1454ad8e8:     	callq	0x145470530 <.text+0x546f530>
1454ad8ed:     	nop
1454ad8ee:     	addq	%rdi, %rsi
1454ad8f1:     	movq	0xbe0(%rbp), %rbx
1454ad8f8:     	movss	0x80(%rbx), %xmm15
1454ad901:     	movss	0x84(%rbx), %xmm14
1454ad90a:     	movq	0xbe8(%rbp), %rdx
1454ad911:     	movl	0xe8(%rdx), %edi
1454ad917:     	addl	$0x3, %edi
1454ad91a:     	movq	$-0x1, 0x348(%rbp)
1454ad925:     	movups	0xbb8(%rbp), %xmm0
1454ad92c:     	movups	%xmm0, 0x300(%rbp)
1454ad933:     	movq	0xbc8(%rbp), %rax
1454ad93a:     	movq	%rax, 0x310(%rbp)
1454ad941:     	movups	0xb50(%rbp), %xmm0
1454ad948:     	movups	0xb60(%rbp), %xmm1
1454ad94f:     	movups	0xb70(%rbp), %xmm2
1454ad956:     	movups	0xb80(%rbp), %xmm3
1454ad95d:     	movups	%xmm0, 0x44c(%rbp)
1454ad964:     	movups	%xmm1, 0x45c(%rbp)
1454ad96b:     	movups	%xmm2, 0x46c(%rbp)
1454ad972:     	movups	%xmm3, 0x47c(%rbp)
1454ad979:     	movups	0xb8c(%rbp), %xmm0
1454ad980:     	movups	%xmm0, 0x488(%rbp)
1454ad987:     	movups	0xb28(%rbp), %xmm0
1454ad98e:     	movups	%xmm0, 0x318(%rbp)
1454ad995:     	movq	0xb38(%rbp), %rax
1454ad99c:     	movq	%rax, 0x328(%rbp)
1454ad9a3:     	xorps	%xmm8, %xmm8
1454ad9a7:     	movups	%xmm8, 0x3dc(%rbp)
1454ad9af:     	movl	$0x0, 0x3ec(%rbp)
1454ad9b9:     	leaq	0x158(%rbp), %rcx
1454ad9c0:     	movl	$0x178, %r8d            # imm = 0x178
1454ad9c6:     	callq	0x1457731ed <.text+0x57721ed>
1454ad9cb:     	movaps	%xmm8, 0xae0(%rbp)
1454ad9d3:     	movq	$0x0, 0xaf0(%rbp)
1454ad9de:     	movups	%xmm8, 0x9f0(%rbp)
1454ad9e6:     	movups	%xmm8, 0xbbc(%rbp)
1454ad9ee:     	movups	%xmm8, 0xbc8(%rbp)
1454ad9f6:     	movaps	%xmm8, 0xac0(%rbp)
1454ad9fe:     	movaps	%xmm8, 0xad0(%rbp)
1454ada06:     	movl	$0x0, 0xb10(%rbp)
1454ada10:     	movq	$0x0, 0xb08(%rbp)
1454ada1b:     	movups	-0x8(%rbp), %xmm0
1454ada1f:     	movaps	%xmm0, 0xba0(%rbp)
1454ada26:     	movups	-0x18(%rbp), %xmm0
1454ada2a:     	movaps	%xmm0, 0xb90(%rbp)
1454ada31:     	movups	-0x58(%rbp), %xmm0
1454ada35:     	movups	-0x48(%rbp), %xmm1
1454ada39:     	movups	-0x38(%rbp), %xmm2
1454ada3d:     	movups	-0x28(%rbp), %xmm3
1454ada41:     	movaps	%xmm3, 0xb80(%rbp)
1454ada48:     	movaps	%xmm2, 0xb70(%rbp)
1454ada4f:     	movaps	%xmm1, 0xb60(%rbp)
1454ada56:     	movaps	%xmm0, 0xb50(%rbp)
1454ada5d:     	movaps	%xmm8, 0xa50(%rbp)
1454ada65:     	movaps	%xmm8, 0xa60(%rbp)
1454ada6d:     	movaps	%xmm8, 0xa70(%rbp)
1454ada75:     	movaps	%xmm8, 0xa80(%rbp)
1454ada7d:     	movaps	%xmm8, 0xa90(%rbp)
1454ada85:     	movaps	%xmm8, 0xaa0(%rbp)
1454ada8d:     	movaps	%xmm8, 0xab0(%rbp)
1454ada95:     	movaps	%xmm8, 0xa00(%rbp)
1454ada9d:     	movups	%xmm8, 0xb30(%rbp)
1454adaa5:     	movups	%xmm8, 0xb3c(%rbp)
1454adaad:     	movaps	%xmm8, 0xa10(%rbp)
1454adab5:     	movaps	%xmm8, 0xa20(%rbp)
1454adabd:     	movaps	%xmm8, 0xa30(%rbp)
1454adac5:     	movaps	%xmm8, 0xa40(%rbp)
1454adacd:     	movups	0x8(%rbp), %xmm0
1454adad1:     	movups	0x18(%rbp), %xmm1
1454adad5:     	movups	%xmm1, 0x8d8(%rbp)
1454adadc:     	movups	%xmm0, 0x8c8(%rbp)
1454adae3:     	movb	$0x0, 0x9e1(%rbp)
1454adaea:     	movq	$0x1, 0x2d0(%rbp)
1454adaf5:     	movq	0xb20(%rbp), %rax
1454adafc:     	movq	%rax, 0x2d8(%rbp)
1454adb03:     	movq	$0x1, 0x2e0(%rbp)
1454adb0e:     	movq	$0x0, 0x2e8(%rbp)
1454adb19:     	movq	$0x8, 0x2f0(%rbp)
1454adb24:     	movq	$0x0, 0x2f8(%rbp)
1454adb2f:     	movq	$0x0, 0x330(%rbp)
1454adb3a:     	movq	$0x4, 0x338(%rbp)
1454adb45:     	movq	$0x0, 0x340(%rbp)
1454adb50:     	movq	%rsi, 0x3b8(%rbp)
1454adb57:     	movl	$0x1, 0x3c0(%rbp)
1454adb61:     	movsd	%xmm12, 0x3c4(%rbp)
1454adb6a:     	movq	$0x3f800000, 0x3cc(%rbp) # imm = 0x3F800000
1454adb75:     	movsd	%xmm13, 0x3d4(%rbp)
1454adb7e:     	movsd	%xmm13, 0x3f0(%rbp)
1454adb87:     	movl	$0x0, 0x3f8(%rbp)
1454adb91:     	movups	%xmm11, 0x3fc(%rbp)
1454adb99:     	movq	%r12, 0x410(%rbp)
1454adba0:     	movl	$0x0, 0x418(%rbp)
1454adbaa:     	movsd	0x53730e(%rip), %xmm0   # 0x1459e4ec0
1454adbb2:     	movsd	%xmm0, 0x41c(%rbp)
1454adbba:     	movl	$0x0, 0x424(%rbp)
1454adbc4:     	movlps	%xmm6, 0x428(%rbp)
1454adbcb:     	movss	%xmm7, 0x430(%rbp)
1454adbd3:     	movss	%xmm10, 0x434(%rbp)
1454adbdc:     	movq	$0x1, 0x438(%rbp)
1454adbe7:     	movss	%xmm9, 0x440(%rbp)
1454adbf0:     	movq	$0x0, 0x444(%rbp)
1454adbfb:     	movss	%xmm15, 0x498(%rbp)
1454adc04:     	movaps	0x1548045(%rip), %xmm1  # 0x1469f5c50
1454adc0b:     	movups	%xmm1, 0x49c(%rbp)
1454adc12:     	movsd	0x1548046(%rip), %xmm1  # 0x1469f5c60
1454adc1a:     	movsd	%xmm1, 0x4ac(%rbp)
1454adc22:     	movl	$0x3f800000, 0x4b4(%rbp) # imm = 0x3F800000
1454adc2c:     	movss	%xmm14, 0x4b8(%rbp)
1454adc35:     	movups	%xmm11, 0x4bc(%rbp)
1454adc3d:     	movups	%xmm8, 0x4dc(%rbp)
1454adc45:     	movups	%xmm8, 0x4cc(%rbp)
1454adc4d:     	movl	%edi, 0x4ec(%rbp)
1454adc53:     	movabsq	$0x100000000, %rax      # imm = 0x100000000
1454adc5d:     	movq	%rax, 0x4f0(%rbp)
1454adc64:     	movsd	0x1548004(%rip), %xmm1  # 0x1469f5c70
1454adc6c:     	movsd	%xmm1, 0x4f8(%rbp)
1454adc74:     	movq	$0x0, 0x500(%rbp)
1454adc7f:     	movq	$0x8, 0x508(%rbp)
1454adc8a:     	movups	%xmm8, 0x510(%rbp)
1454adc92:     	movq	$0x8, 0x520(%rbp)
1454adc9d:     	movups	%xmm8, 0x528(%rbp)
1454adca5:     	movq	$0x8, 0x538(%rbp)
1454adcb0:     	movups	%xmm8, 0x540(%rbp)
1454adcb8:     	movq	$0x8, 0x550(%rbp)
1454adcc3:     	movups	%xmm8, 0x558(%rbp)
1454adccb:     	movq	$0x8, 0x568(%rbp)
1454adcd6:     	movq	$0x0, 0x570(%rbp)
1454adce1:     	movq	0xbb0(%rbp), %rax
1454adce8:     	movq	%rax, 0x8c0(%rbp)
1454adcef:     	movq	$0x0, 0x8e8(%rbp)
1454adcfa:     	movq	$0x0, 0x95c(%rbp)
1454add05:     	movq	$0x0, 0x578(%rbp)
1454add10:     	movq	$0x8, 0x580(%rbp)
1454add1b:     	movups	%xmm8, 0x588(%rbp)
1454add23:     	movq	$0x8, 0x598(%rbp)
1454add2e:     	movups	%xmm8, 0x5a0(%rbp)
1454add36:     	movq	$0x8, 0x5b0(%rbp)
1454add41:     	movups	%xmm8, 0x5b8(%rbp)
1454add49:     	movups	%xmm8, 0x964(%rbp)
1454add51:     	movq	$0x8, 0x5c8(%rbp)
1454add5c:     	movq	$0x0, 0x28(%rbp)
1454add64:     	movabsq	$0x232800000000, %rax   # imm = 0x232800000000
1454add6e:     	movq	%rax, 0x974(%rbp)
1454add75:     	movups	%xmm8, 0x5d0(%rbp)
1454add7d:     	movq	$0x4, 0x5e0(%rbp)
1454add88:     	movups	%xmm8, 0x5e8(%rbp)
1454add90:     	movq	$0x8, 0x5f8(%rbp)
1454add9b:     	movq	$0x0, 0x600(%rbp)
1454adda6:     	movq	$0x0, 0x38(%rbp)
1454addae:     	movl	$0x0, 0x878(%rbp)
1454addb8:     	movq	$0x0, 0x880(%rbp)
1454addc3:     	movq	$0x1, 0x888(%rbp)
1454addce:     	movq	$0x0, 0x890(%rbp)
1454addd9:     	movq	$0x0, 0x608(%rbp)
1454adde4:     	movq	$0x8, 0x610(%rbp)
1454addef:     	movaps	0xac0(%rbp), %xmm1
1454addf6:     	movups	%xmm1, 0x618(%rbp)
1454addfd:     	movq	$0x8, 0x628(%rbp)
1454ade08:     	movaps	0xad0(%rbp), %xmm1
1454ade0f:     	movups	%xmm1, 0x630(%rbp)
1454ade16:     	movq	$0x8, 0x640(%rbp)
1454ade21:     	movq	$0x0, 0x648(%rbp)
1454ade2c:     	movaps	0xae0(%rbp), %xmm1
1454ade33:     	movups	%xmm1, 0x650(%rbp)
1454ade3a:     	movq	0xaf0(%rbp), %rax
1454ade41:     	movq	%rax, 0x660(%rbp)
1454ade48:     	movq	0x9f8(%rbp), %rax
1454ade4f:     	movq	%rax, 0x678(%rbp)
1454ade56:     	movups	0x9e8(%rbp), %xmm1
1454ade5d:     	movups	%xmm1, 0x668(%rbp)
1454ade64:     	movq	$0x0, 0x688(%rbp)
1454ade6f:     	movl	$0x2, 0x694(%rbp)
1454ade79:     	movups	0xbb8(%rbp), %xmm1
1454ade80:     	movups	0xbc8(%rbp), %xmm2
1454ade87:     	movups	%xmm2, 0x6a8(%rbp)
1454ade8e:     	movups	%xmm1, 0x698(%rbp)
1454ade95:     	movabsq	$0x10000000a, %rax      # imm = 0x10000000A
1454ade9f:     	movq	%rax, 0x97c(%rbp)
1454adea6:     	movss	0x46544e(%rip), %xmm1   # 0x1459132fc
1454adeae:     	movlps	%xmm1, 0x984(%rbp)
1454adeb5:     	movl	$0x42700000, 0x98c(%rbp) # imm = 0x42700000
1454adebf:     	movb	$-0x1, 0x9e0(%rbp)
1454adec6:     	movq	$0x0, 0x8f0(%rbp)
1454aded1:     	movl	0xb10(%rbp), %eax
1454aded7:     	movl	%eax, 0x998(%rbp)
1454adedd:     	movq	0xb08(%rbp), %rax
1454adee4:     	movq	%rax, 0x990(%rbp)
1454adeeb:     	movsd	0x1547d8d(%rip), %xmm1  # 0x1469f5c80
1454adef3:     	movsd	%xmm1, 0x99c(%rbp)
1454adefb:     	movabsq	$0x1442700000, %rax     # imm = 0x1442700000
1454adf05:     	movq	%rax, 0x9a4(%rbp)
1454adf0c:     	movq	$0x0, 0x6b8(%rbp)
1454adf17:     	movq	$0x4, 0x6c0(%rbp)
1454adf22:     	movq	$0x0, 0x6c8(%rbp)
1454adf2d:     	movl	$0x0, 0x898(%rbp)
1454adf37:     	movl	$0x0, 0x8a0(%rbp)
1454adf41:     	movq	$0x0, 0x910(%rbp)
1454adf4c:     	movups	%xmm8, 0x8f8(%rbp)
1454adf54:     	movsd	%xmm0, 0x9ac(%rbp)
1454adf5c:     	movq	$0x0, 0x6d0(%rbp)
1454adf67:     	movq	$0x4, 0x6d8(%rbp)
1454adf72:     	movups	%xmm8, 0x6e0(%rbp)
1454adf7a:     	movq	$0x4, 0x6f0(%rbp)
1454adf85:     	movq	$0x0, 0x6f8(%rbp)
1454adf90:     	movl	$0x0, 0x9d0(%rbp)
1454adf9a:     	movb	$0x0, 0x9d4(%rbp)
1454adfa1:     	movl	$0xc1200000, 0x9b4(%rbp) # imm = 0xC1200000
1454adfab:     	movl	$0x0, 0x920(%rbp)
1454adfb5:     	movl	$0x0, 0x8a8(%rbp)
1454adfbf:     	movl	$0x0, 0x8b0(%rbp)
1454adfc9:     	movl	$0x0, 0x9b8(%rbp)
1454adfd3:     	movl	$0x0, 0x934(%rbp)
1454adfdd:     	movl	$0x0, 0x948(%rbp)
1454adfe7:     	movl	$0x0, 0x8b8(%rbp)
1454adff1:     	movl	$0x0, 0x9d8(%rbp)
1454adffb:     	movl	$0x0, 0x9d5(%rbp)
1454ae005:     	movsd	0x491a83(%rip), %xmm0   # 0x14593fa90
1454ae00d:     	movsd	%xmm0, 0x9bc(%rbp)
1454ae015:     	movq	$0x0, 0x918(%rbp)
1454ae020:     	movaps	0xba0(%rbp), %xmm0
1454ae027:     	movups	%xmm0, 0x750(%rbp)
1454ae02e:     	movaps	0xb90(%rbp), %xmm0
1454ae035:     	movups	%xmm0, 0x740(%rbp)
1454ae03c:     	movaps	0xb50(%rbp), %xmm0
1454ae043:     	movaps	0xb60(%rbp), %xmm1
1454ae04a:     	movaps	0xb70(%rbp), %xmm2
1454ae051:     	movaps	0xb80(%rbp), %xmm3
1454ae058:     	movups	%xmm3, 0x730(%rbp)
1454ae05f:     	movups	%xmm2, 0x720(%rbp)
1454ae066:     	movups	%xmm1, 0x710(%rbp)
1454ae06d:     	movups	%xmm0, 0x700(%rbp)
1454ae074:     	movq	$0x0, 0x48(%rbp)
1454ae07c:     	movq	$0x0, 0x58(%rbp)
1454ae084:     	movq	$0x0, 0x68(%rbp)
1454ae08c:     	movq	$0x0, 0x78(%rbp)
1454ae094:     	movq	$0x8, 0x80(%rbp)
1454ae09f:     	movaps	0xa50(%rbp), %xmm0
1454ae0a6:     	movups	%xmm0, 0x88(%rbp)
1454ae0ad:     	movq	$0x4, 0x98(%rbp)
1454ae0b8:     	movaps	0xa60(%rbp), %xmm0
1454ae0bf:     	movups	%xmm0, 0xa0(%rbp)
1454ae0c6:     	movq	$0x4, 0xb0(%rbp)
1454ae0d1:     	movaps	0xa70(%rbp), %xmm0
1454ae0d8:     	movups	%xmm0, 0xb8(%rbp)
1454ae0df:     	movq	$0x8, 0xc8(%rbp)
1454ae0ea:     	movaps	0xa80(%rbp), %xmm0
1454ae0f1:     	movups	%xmm0, 0xd0(%rbp)
1454ae0f8:     	movq	$0x8, 0xe0(%rbp)
1454ae103:     	movaps	0xa90(%rbp), %xmm0
1454ae10a:     	movups	%xmm0, 0xe8(%rbp)
1454ae111:     	movq	$0x8, 0xf8(%rbp)
1454ae11c:     	movaps	0xaa0(%rbp), %xmm0
1454ae123:     	movups	%xmm0, 0x100(%rbp)
1454ae12a:     	movq	$0x4, 0x110(%rbp)
1454ae135:     	movaps	0xab0(%rbp), %xmm0
1454ae13c:     	movups	%xmm0, 0x118(%rbp)
1454ae143:     	movq	$0x4, 0x128(%rbp)
1454ae14e:     	movq	$0x0, 0x760(%rbp)
1454ae159:     	movups	%xmm8, 0x140(%rbp)
1454ae161:     	movups	%xmm8, 0x130(%rbp)
1454ae169:     	movw	$0x0, 0x150(%rbp)
1454ae172:     	movq	$0x8, 0x768(%rbp)
1454ae17d:     	movaps	0xa00(%rbp), %xmm0
1454ae184:     	movups	%xmm0, 0x770(%rbp)
1454ae18b:     	movq	$0x8, 0x780(%rbp)
1454ae196:     	movaps	0xa10(%rbp), %xmm0
1454ae19d:     	movups	%xmm0, 0x788(%rbp)
1454ae1a4:     	movq	$0x8, 0x798(%rbp)
1454ae1af:     	movaps	0xa20(%rbp), %xmm0
1454ae1b6:     	movups	%xmm0, 0x7a0(%rbp)
1454ae1bd:     	movq	$0x8, 0x7b0(%rbp)
1454ae1c8:     	movaps	0xa30(%rbp), %xmm0
1454ae1cf:     	movups	%xmm0, 0x7b8(%rbp)
1454ae1d6:     	movq	$0x8, 0x7c8(%rbp)
1454ae1e1:     	movaps	0xa40(%rbp), %xmm0
1454ae1e8:     	movups	%xmm0, 0x7d0(%rbp)
1454ae1ef:     	movq	$0x8, 0x7e0(%rbp)
1454ae1fa:     	movups	%xmm8, 0x7e8(%rbp)
1454ae202:     	movl	$0x0, 0x7f8(%rbp)
1454ae20c:     	movl	0xb48(%rbp), %eax
1454ae212:     	movl	%eax, 0x81c(%rbp)
1454ae218:     	movups	0xb28(%rbp), %xmm0
1454ae21f:     	movups	0xb38(%rbp), %xmm1
1454ae226:     	movups	%xmm1, 0x80c(%rbp)
1454ae22d:     	movups	%xmm0, 0x7fc(%rbp)
1454ae234:     	movq	$0x0, 0x825(%rbp)
1454ae23f:     	movq	$0x0, 0x820(%rbp)
1454ae24a:     	movl	$0x3f800000, 0x9c4(%rbp) # imm = 0x3F800000
1454ae254:     	movq	$0x0, 0x830(%rbp)
1454ae25f:     	movq	$0x8, 0x838(%rbp)
1454ae26a:     	movups	%xmm8, 0x840(%rbp)
1454ae272:     	movq	$0x8, 0x850(%rbp)
1454ae27d:     	movq	$0x0, 0x858(%rbp)
1454ae288:     	movl	0xb4c(%rbp), %eax
1454ae28e:     	movl	%eax, 0x9c8(%rbp)
1454ae294:     	movl	$0xff000000, 0x9dc(%rbp) # imm = 0xFF000000
1454ae29e:     	movq	$0x0, 0x860(%rbp)
1454ae2a9:     	movq	$0x8, 0x868(%rbp)
1454ae2b4:     	movq	$0x0, 0x870(%rbp)
1454ae2bf:     	movl	$0x0, 0x9cc(%rbp)
1454ae2c9:     	callq	0x140002200 <.text+0x1200>
1454ae2ce:     	movl	$0x10, %ecx
1454ae2d3:     	movl	$0x8, %edx
1454ae2d8:     	callq	0x1400021c0 <.text+0x11c0>
1454ae2dd:     	testq	%rax, %rax
1454ae2e0:     	je	0x1454ae88e <.text+0x54ad88e>
1454ae2e6:     	movq	0x738(%rbp), %rdx
1454ae2ed:     	movq	0x740(%rbp), %rcx
1454ae2f4:     	movq	%rcx, %r8
1454ae2f7:     	shlq	$0x6, %r8
1454ae2fb:     	testq	%rcx, %rcx
1454ae2fe:     	je	0x1454ae32b <.text+0x54ad32b>
1454ae300:     	xorl	%ecx, %ecx
1454ae302:     	xorl	%r9d, %r9d
1454ae305:     	nopw	%cs:(%rax,%rax)
1454ae310:     	cmpb	$0x1c, (%rdx,%r9)
1454ae315:     	je	0x1454ae853 <.text+0x54ad853>
1454ae31b:     	addq	$0x40, %r9
1454ae31f:     	cmpq	%r9, %r8
1454ae322:     	jne	0x1454ae310 <.text+0x54ad310>
1454ae324:     	testq	%rcx, %rcx
1454ae327:     	je	0x1454ae332 <.text+0x54ad332>
1454ae329:     	jmp	0x1454ae33a <.text+0x54ad33a>
1454ae32b:     	xorl	%ecx, %ecx
1454ae32d:     	testq	%rcx, %rcx
1454ae330:     	jne	0x1454ae33a <.text+0x54ad33a>
1454ae332:     	movq	0x40(%rbx), %rcx
1454ae336:     	movq	0x48(%rbx), %r9
1454ae33a:     	movq	%rcx, (%rax)
1454ae33d:     	movq	%r9, 0x8(%rax)
1454ae341:     	movq	$0x1, 0xbb8(%rbp)
1454ae34c:     	movq	%rax, 0xbc0(%rbp)
1454ae353:     	movq	$0x1, 0xbc8(%rbp)
1454ae35e:     	addq	%rdx, %r8
1454ae361:     	movb	$0x1, 0xbf7(%rbp)
1454ae368:     	leaq	0xb50(%rbp), %rcx
1454ae36f:     	callq	0x145539880 <.text+0x5538880>
1454ae374:     	nop
1454ae375:     	movq	0xb50(%rbp), %rax
1454ae37c:     	movq	%rax, 0xbd8(%rbp)
1454ae383:     	movq	0xb58(%rbp), %rax
1454ae38a:     	movq	%rax, 0xbe0(%rbp)
1454ae391:     	movq	0xb60(%rbp), %rcx
1454ae398:     	testq	%rcx, %rcx
1454ae39b:     	je	0x1454ae468 <.text+0x54ad468>
1454ae3a1:     	movq	%rcx, %rax
1454ae3a4:     	shlq	$0x4, %rax
1454ae3a8:     	movq	0xbe0(%rbp), %r12
1454ae3af:     	addq	%r12, %rax
1454ae3b2:     	movq	%rax, 0xbb0(%rbp)
1454ae3b9:     	movq	0xbc8(%rbp), %r15
1454ae3c0:     	jmp	0x1454ae3f0 <.text+0x54ad3f0>
1454ae3c2:     	nopw	%cs:(%rax,%rax)
1454ae3d0:     	movq	%rbx, (%rdi,%r13)
1454ae3d4:     	movq	%r14, 0x8(%rdi,%r13)
1454ae3d9:     	incq	%r15
1454ae3dc:     	movq	%r15, 0xbc8(%rbp)
1454ae3e3:     	addq	$0x10, %r12
1454ae3e7:     	cmpq	0xbb0(%rbp), %r12
1454ae3ee:     	je	0x1454ae468 <.text+0x54ad468>
1454ae3f0:     	movq	(%r12), %rbx
1454ae3f4:     	movq	0x8(%r12), %r14
1454ae3f9:     	movq	0xbc0(%rbp), %rdi
1454ae400:     	movq	%r15, %r13
1454ae403:     	shlq	$0x4, %r13
1454ae407:     	testq	%r15, %r15
1454ae40a:     	je	0x1454ae446 <.text+0x54ad446>
1454ae40c:     	xorl	%esi, %esi
1454ae40e:     	jmp	0x1454ae419 <.text+0x54ad419>
1454ae410:     	addq	$0x10, %rsi
1454ae414:     	cmpq	%rsi, %r13
1454ae417:     	je	0x1454ae440 <.text+0x54ad440>
1454ae419:     	cmpq	%r14, 0x8(%rdi,%rsi)
1454ae41e:     	jne	0x1454ae410 <.text+0x54ad410>
1454ae420:     	movq	(%rdi,%rsi), %rcx
1454ae424:     	movq	%rbx, %rdx
1454ae427:     	movq	%r14, %r8
1454ae42a:     	callq	0x1457731e7 <.text+0x57721e7>
1454ae42f:     	testl	%eax, %eax
1454ae431:     	jne	0x1454ae410 <.text+0x54ad410>
1454ae433:     	jmp	0x1454ae3e3 <.text+0x54ad3e3>
1454ae435:     	nopw	%cs:(%rax,%rax)
1454ae440:     	cmpq	$0x5, %r15
1454ae444:     	ja	0x1454ae3e3 <.text+0x54ad3e3>
1454ae446:     	cmpq	0xbb8(%rbp), %r15
1454ae44d:     	jne	0x1454ae3d0 <.text+0x54ad3d0>
1454ae44f:     	leaq	0xbb8(%rbp), %rcx
1454ae456:     	callq	0x145774860 <.text+0x5773860>
1454ae45b:     	nop
1454ae45c:     	movq	0xbc0(%rbp), %rdi
1454ae463:     	jmp	0x1454ae3d0 <.text+0x54ad3d0>
1454ae468:     	movq	0xbd8(%rbp), %rdx
1454ae46f:     	testq	%rdx, %rdx
1454ae472:     	je	0x1454ae48a <.text+0x54ad48a>
1454ae474:     	shlq	$0x4, %rdx
1454ae478:     	movl	$0x8, %r8d
1454ae47e:     	movq	0xbe0(%rbp), %rcx
1454ae485:     	callq	0x1400021d0 <.text+0x11d0>
1454ae48a:     	movq	0xbb8(%rbp), %rax
1454ae491:     	movq	0xbc0(%rbp), %rcx
1454ae498:     	movq	0xbc8(%rbp), %rdx
1454ae49f:     	shlq	$0x4, %rdx
1454ae4a3:     	addq	%rcx, %rdx
1454ae4a6:     	movq	%rcx, 0xb50(%rbp)
1454ae4ad:     	movq	%rcx, 0xb58(%rbp)
1454ae4b4:     	movq	%rax, 0xb60(%rbp)
1454ae4bb:     	movq	%rdx, 0xb68(%rbp)
1454ae4c2:     	leaq	0x28(%rbp), %rsi
1454ae4c6:     	movq	%rsi, 0xb70(%rbp)
1454ae4cd:     	movb	$0x0, 0xbf7(%rbp)
1454ae4d4:     	leaq	0xb28(%rbp), %rcx
1454ae4db:     	leaq	0xb50(%rbp), %rdx
1454ae4e2:     	callq	0x1455452b0 <.text+0x55442b0>
1454ae4e7:     	nop
1454ae4e8:     	leaq	0x2d0(%rbp), %rdi
1454ae4ef:     	movq	0x2d0(%rbp), %rax
1454ae4f6:     	testq	%rax, %rax
1454ae4f9:     	je	0x1454ae511 <.text+0x54ad511>
1454ae4fb:     	movq	0x2d8(%rbp), %rcx
1454ae502:     	imulq	$0x58, %rax, %rdx
1454ae506:     	movl	$0x8, %r8d
1454ae50c:     	callq	0x1400021d0 <.text+0x11d0>
1454ae511:     	movq	0xb38(%rbp), %rax
1454ae518:     	movq	%rax, 0x10(%rdi)
1454ae51c:     	movups	0xb28(%rbp), %xmm0
1454ae523:     	movups	%xmm0, (%rdi)
1454ae526:     	movq	0x740(%rbp), %rdi
1454ae52d:     	leaq	(,%rdi,4), %rbx
1454ae535:     	testq	%rdi, %rdi
1454ae538:     	je	0x1454ae81d <.text+0x54ad81d>
1454ae53e:     	callq	0x140002200 <.text+0x1200>
1454ae543:     	movl	$0x4, %edx
1454ae548:     	movq	%rbx, %rcx
1454ae54b:     	callq	0x1400021f0 <.text+0x11f0>
1454ae550:     	testq	%rax, %rax
1454ae553:     	je	0x1454ae91f <.text+0x54ad91f>
1454ae559:     	movq	%rax, %r14
1454ae55c:     	movq	0x90(%rbp), %rdx
1454ae563:     	testq	%rdx, %rdx
1454ae566:     	je	0x1454ae57e <.text+0x54ad57e>
1454ae568:     	movq	0x98(%rbp), %rcx
1454ae56f:     	shlq	$0x2, %rdx
1454ae573:     	movl	$0x4, %r8d
1454ae579:     	callq	0x1400021d0 <.text+0x11d0>
1454ae57e:     	movq	%rdi, 0x90(%rbp)
1454ae585:     	movq	%r14, 0x98(%rbp)
1454ae58c:     	movq	%rdi, 0xa0(%rbp)
1454ae593:     	testq	%rdi, %rdi
1454ae596:     	je	0x1454ae838 <.text+0x54ad838>
1454ae59c:     	callq	0x140002200 <.text+0x1200>
1454ae5a1:     	movl	$0x4, %edx
1454ae5a6:     	movq	%rbx, %rcx
1454ae5a9:     	callq	0x1400021f0 <.text+0x11f0>
1454ae5ae:     	testq	%rax, %rax
1454ae5b1:     	je	0x1454ae936 <.text+0x54ad936>
1454ae5b7:     	movq	%rax, %r14
1454ae5ba:     	movq	0xa8(%rbp), %rdx
1454ae5c1:     	testq	%rdx, %rdx
1454ae5c4:     	je	0x1454ae5dc <.text+0x54ad5dc>
1454ae5c6:     	movq	0xb0(%rbp), %rcx
1454ae5cd:     	shlq	$0x2, %rdx
1454ae5d1:     	movl	$0x4, %r8d
1454ae5d7:     	callq	0x1400021d0 <.text+0x11d0>
1454ae5dc:     	movq	%rdi, 0xa8(%rbp)
1454ae5e3:     	movq	%r14, 0xb0(%rbp)
1454ae5ea:     	movq	%rdi, 0xb8(%rbp)
1454ae5f1:     	movq	$0x0, 0xb50(%rbp)
1454ae5fc:     	movq	$0x4, 0xb58(%rbp)
1454ae607:     	movq	$0x0, 0xb60(%rbp)
1454ae612:     	movb	$0x0, 0xbf7(%rbp)
1454ae619:     	leaq	0xb28(%rbp), %rcx
1454ae620:     	leaq	0xb50(%rbp), %rdx
1454ae627:     	movq	%rdi, %r8
1454ae62a:     	callq	0x145533810 <.text+0x5532810>
1454ae62f:     	nop
1454ae630:     	movq	0xd0(%rbp), %rdi
1454ae637:     	testq	%rdi, %rdi
1454ae63a:     	je	0x1454ae676 <.text+0x54ad676>
1454ae63c:     	movq	0xc8(%rbp), %rbx
1454ae643:     	addq	$0x8, %rbx
1454ae647:     	jmp	0x1454ae659 <.text+0x54ad659>
1454ae649:     	nopl	(%rax)
1454ae650:     	addq	$0x18, %rbx
1454ae654:     	decq	%rdi
1454ae657:     	je	0x1454ae676 <.text+0x54ad676>
1454ae659:     	movq	-0x8(%rbx), %rdx
1454ae65d:     	testq	%rdx, %rdx
1454ae660:     	je	0x1454ae650 <.text+0x54ad650>
1454ae662:     	movq	(%rbx), %rcx
1454ae665:     	shlq	$0x2, %rdx
1454ae669:     	movl	$0x4, %r8d
1454ae66f:     	callq	0x1400021d0 <.text+0x11d0>
1454ae674:     	jmp	0x1454ae650 <.text+0x54ad650>
1454ae676:     	leaq	0xc0(%rbp), %rdi
1454ae67d:     	movq	0xc0(%rbp), %rax
1454ae684:     	testq	%rax, %rax
1454ae687:     	je	0x1454ae6a3 <.text+0x54ad6a3>
1454ae689:     	movq	0xc8(%rbp), %rcx
1454ae690:     	shlq	$0x3, %rax
1454ae694:     	leaq	(%rax,%rax,2), %rdx
1454ae698:     	movl	$0x8, %r8d
1454ae69e:     	callq	0x1400021d0 <.text+0x11d0>
1454ae6a3:     	movq	0xb38(%rbp), %rax
1454ae6aa:     	movq	%rax, 0x10(%rdi)
1454ae6ae:     	movups	0xb28(%rbp), %xmm0
1454ae6b5:     	movups	%xmm0, (%rdi)
1454ae6b8:     	movq	0x738(%rbp), %rdx
1454ae6bf:     	movq	0x740(%rbp), %r8
1454ae6c6:     	shlq	$0x6, %r8
1454ae6ca:     	addq	%rdx, %r8
1454ae6cd:     	movb	$0x0, 0xbf7(%rbp)
1454ae6d4:     	leaq	0xb50(%rbp), %rcx
1454ae6db:     	callq	0x14553a530 <.text+0x5539530>
1454ae6e0:     	nop
1454ae6e1:     	movq	0xb50(%rbp), %rax
1454ae6e8:     	movq	0xb58(%rbp), %rcx
1454ae6ef:     	movq	0xb60(%rbp), %rdx
1454ae6f6:     	leaq	(%rdx,%rdx,2), %rdx
1454ae6fa:     	leaq	(%rcx,%rdx,8), %rdx
1454ae6fe:     	movq	%rcx, 0xb50(%rbp)
1454ae705:     	movq	%rcx, 0xb58(%rbp)
1454ae70c:     	movq	%rax, 0xb60(%rbp)
1454ae713:     	movq	%rdx, 0xb68(%rbp)
1454ae71a:     	movq	%rsi, 0xb70(%rbp)
1454ae721:     	movb	$0x0, 0xbf7(%rbp)
1454ae728:     	leaq	0xb28(%rbp), %rcx
1454ae72f:     	leaq	0xb50(%rbp), %rdx
1454ae736:     	callq	0x145545650 <.text+0x5544650>
1454ae73b:     	nop
1454ae73c:     	leaq	0xd8(%rbp), %rsi
1454ae743:     	movq	0xd8(%rbp), %rax
1454ae74a:     	testq	%rax, %rax
1454ae74d:     	je	0x1454ae769 <.text+0x54ad769>
1454ae74f:     	movq	0xe0(%rbp), %rcx
1454ae756:     	shlq	$0x5, %rax
1454ae75a:     	leaq	(%rax,%rax,2), %rdx
1454ae75e:     	movl	$0x8, %r8d
1454ae764:     	callq	0x1400021d0 <.text+0x11d0>
1454ae769:     	movq	0xb38(%rbp), %rax
1454ae770:     	movq	%rax, 0x10(%rsi)
1454ae774:     	movups	0xb28(%rbp), %xmm0
1454ae77b:     	movups	%xmm0, (%rsi)
1454ae77e:     	movb	$0x0, 0xbf7(%rbp)
1454ae785:     	leaq	0x28(%rbp), %rcx
1454ae789:     	callq	0x1454a6a40 <.text+0x54a5a40>
1454ae78e:     	nop
1454ae78f:     	movss	0x498(%rbp), %xmm0
1454ae797:     	movss	%xmm0, 0x440(%rbp)
1454ae79f:     	leaq	0x28(%rbp), %rdx
1454ae7a3:     	movl	$0x9c0, %r8d            # imm = 0x9C0
1454ae7a9:     	movq	0xb00(%rbp), %rsi
1454ae7b0:     	movq	%rsi, %rcx
1454ae7b3:     	callq	0x1457731ed <.text+0x57721ed>
1454ae7b8:     	movq	%rsi, %rax
1454ae7bb:     	movaps	0xc00(%rbp), %xmm6
1454ae7c2:     	movaps	0xc10(%rbp), %xmm7
1454ae7c9:     	movaps	0xc20(%rbp), %xmm8
1454ae7d1:     	movaps	0xc30(%rbp), %xmm9
1454ae7d9:     	movaps	0xc40(%rbp), %xmm10
1454ae7e1:     	movaps	0xc50(%rbp), %xmm11
1454ae7e9:     	movaps	0xc60(%rbp), %xmm12
1454ae7f1:     	movaps	0xc70(%rbp), %xmm13
1454ae7f9:     	movaps	0xc80(%rbp), %xmm14
1454ae801:     	movaps	0xc90(%rbp), %xmm15
1454ae809:     	addq	$0xd28, %rsp            # imm = 0xD28
1454ae810:     	popq	%rbx
1454ae811:     	popq	%rdi
1454ae812:     	popq	%rsi
1454ae813:     	popq	%r12
1454ae815:     	popq	%r13
1454ae817:     	popq	%r14
1454ae819:     	popq	%r15
1454ae81b:     	popq	%rbp
1454ae81c:     	retq
1454ae81d:     	movl	$0x4, %r14d
1454ae823:     	movq	0x90(%rbp), %rdx
1454ae82a:     	testq	%rdx, %rdx
1454ae82d:     	jne	0x1454ae568 <.text+0x54ad568>
1454ae833:     	jmp	0x1454ae57e <.text+0x54ad57e>
1454ae838:     	movl	$0x4, %r14d
1454ae83e:     	movq	0xa8(%rbp), %rdx
1454ae845:     	testq	%rdx, %rdx
1454ae848:     	jne	0x1454ae5c6 <.text+0x54ad5c6>
1454ae84e:     	jmp	0x1454ae5dc <.text+0x54ad5dc>
1454ae853:     	movq	0x8(%rdx,%r9), %rcx
1454ae858:     	movq	0x10(%rdx,%r9), %r9
1454ae85d:     	testq	%rcx, %rcx
1454ae860:     	je	0x1454ae332 <.text+0x54ad332>
1454ae866:     	jmp	0x1454ae33a <.text+0x54ad33a>
1454ae86b:     	movb	$0x1, 0xbf6(%rbp)
1454ae872:     	movb	$0x1, 0xbf5(%rbp)
1454ae879:     	movl	$0x8, %ecx
1454ae87e:     	movl	$0x58, %edx
1454ae883:     	callq	0x145903781 <.text+0x5902781>
1454ae888:     	nop
1454ae889:     	jmp	0x1454ae94b <.text+0x54ad94b>
1454ae88e:     	movl	$0x8, %ecx
1454ae893:     	movl	$0x10, %edx
1454ae898:     	callq	0x145903781 <.text+0x5902781>
1454ae89d:     	nop
1454ae89e:     	jmp	0x1454ae94b <.text+0x54ad94b>
1454ae8a3:     	leaq	0xb50(%rbp), %rax
1454ae8aa:     	movq	%rax, 0x28(%rbp)
1454ae8ae:     	leaq	-0x54ac7f5(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454ae8b5:     	movq	%rax, 0x30(%rbp)
1454ae8b9:     	movb	$0x1, 0xbf6(%rbp)
1454ae8c0:     	movb	$0x1, 0xbf5(%rbp)
1454ae8c7:     	leaq	0x128748a(%rip), %rcx   # 0x146735d58
1454ae8ce:     	leaq	0x1287493(%rip), %r8    # 0x146735d68
1454ae8d5:     	leaq	0x28(%rbp), %rdx
1454ae8d9:     	callq	0x145903d10 <.text+0x5902d10>
1454ae8de:     	nop
1454ae8df:     	jmp	0x1454ae94b <.text+0x54ad94b>
1454ae8e1:     	leaq	0xb50(%rbp), %rax
1454ae8e8:     	movq	%rax, 0x28(%rbp)
1454ae8ec:     	leaq	-0x54ac833(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1454ae8f3:     	movq	%rax, 0x30(%rbp)
1454ae8f7:     	movb	$0x1, 0xbf6(%rbp)
1454ae8fe:     	movb	$0x1, 0xbf5(%rbp)
1454ae905:     	leaq	0x128744c(%rip), %rcx   # 0x146735d58
1454ae90c:     	leaq	0x1287455(%rip), %r8    # 0x146735d68
1454ae913:     	leaq	0x28(%rbp), %rdx
1454ae917:     	callq	0x145903d10 <.text+0x5902d10>
1454ae91c:     	nop
1454ae91d:     	jmp	0x1454ae94b <.text+0x54ad94b>
1454ae91f:     	movb	$0x0, 0xbf7(%rbp)
1454ae926:     	movl	$0x4, %ecx
1454ae92b:     	movq	%rbx, %rdx
1454ae92e:     	callq	0x14590379b <.text+0x590279b>
1454ae933:     	nop
1454ae934:     	jmp	0x1454ae94b <.text+0x54ad94b>
1454ae936:     	movb	$0x0, 0xbf7(%rbp)
1454ae93d:     	movl	$0x4, %ecx
1454ae942:     	movq	%rbx, %rdx
1454ae945:     	callq	0x14590379b <.text+0x590279b>
1454ae94a:     	nop
1454ae94b:     	ud2
