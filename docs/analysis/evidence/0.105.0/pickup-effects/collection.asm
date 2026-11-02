
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14590c4bf:     	movq	0x348(%rbp), %rax
14590c4c6:     	testq	%rax, %rax
14590c4c9:     	je	0x14590c4e5 <.text+0x590b4e5>
14590c4cb:     	shlq	$0x3, %rax
14590c4cf:     	leaq	(%rax,%rax,2), %rdx
14590c4d3:     	movl	$0x8, %r8d
14590c4d9:     	movq	0x328(%rbp), %rcx
14590c4e0:     	callq	0x1400021d0 <.text+0x11d0>
14590c4e5:     	movq	$0x0, 0x2e0(%rbp)
14590c4f0:     	movq	$0x8, 0x2e8(%rbp)
14590c4fb:     	movq	$0x0, 0x2f0(%rbp)
14590c506:     	movq	0x378(%rbp), %rax
14590c50d:     	movq	0x5c0(%rax), %rcx
14590c514:     	movq	0x5c8(%rax), %rax
14590c51b:     	leaq	(%rax,%rax,8), %rax
14590c51f:     	leaq	(%rcx,%rax,8), %rdx
14590c523:     	xorl	%ebx, %ebx
14590c525:     	leaq	0x2e0(%rbp), %rdi
14590c52c:     	movss	0x464707(%rip), %xmm10  # 0x145d70c3c
14590c535:     	xorl	%r14d, %r14d
14590c538:     	movq	%rdx, 0x60(%rbp)
14590c53c:     	cmpq	%rdx, %rcx
14590c53f:     	jne	0x14590c57c <.text+0x590b57c>
14590c541:     	jmp	0x14590c5fa <.text+0x590b5fa>
14590c546:     	nopw	%cs:(%rax,%rax)
14590c550:     	movsd	0x34(%rcx), %xmm0
14590c555:     	subps	%xmm7, %xmm0
14590c558:     	mulps	%xmm0, %xmm0
14590c55b:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14590c55f:     	addss	%xmm0, %xmm1
14590c563:     	xorps	%xmm0, %xmm0
14590c566:     	sqrtss	%xmm1, %xmm0
14590c56a:     	ucomiss	%xmm0, %xmm10
14590c56e:     	jae	0x14590c5b5 <.text+0x590b5b5>
14590c570:     	addq	$0x48, %rcx
14590c574:     	incq	%r14
14590c577:     	cmpq	%rdx, %rcx
14590c57a:     	je	0x14590c5fa <.text+0x590b5fa>
14590c57c:     	movl	0x20(%rcx), %eax
14590c57f:     	testl	%eax, %eax
14590c581:     	je	0x14590c5a8 <.text+0x590b5a8>
14590c583:     	cmpl	$0x1, %eax
14590c586:     	jne	0x14590c550 <.text+0x590b550>
14590c588:     	movsd	0x34(%rcx), %xmm0
14590c58d:     	subps	%xmm7, %xmm0
14590c590:     	mulps	%xmm0, %xmm0
14590c593:     	movshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
14590c597:     	addss	%xmm0, %xmm1
14590c59b:     	xorps	%xmm0, %xmm0
14590c59e:     	sqrtss	%xmm1, %xmm0
14590c5a2:     	ucomiss	%xmm0, %xmm9
14590c5a6:     	jae	0x14590c5b5 <.text+0x590b5b5>
14590c5a8:     	cmpl	$0x1, 0x18(%rcx)
14590c5ac:     	jne	0x14590c570 <.text+0x590b570>
14590c5ae:     	ucomiss	0x1c(%rcx), %xmm8
14590c5b3:     	jb	0x14590c570 <.text+0x590b570>
14590c5b5:     	movq	%rcx, 0x328(%rbp)
14590c5bc:     	cmpq	0x2e0(%rbp), %rbx
14590c5c3:     	jne	0x14590c5ce <.text+0x590b5ce>
14590c5c5:     	movq	%rdi, %rcx
14590c5c8:     	callq	0x145bcb370 <.text+0x5bca370>
14590c5cd:     	nop
14590c5ce:     	movq	0x328(%rbp), %rcx
14590c5d5:     	addq	$0x48, %rcx
14590c5d9:     	movq	0x2e8(%rbp), %rax
14590c5e0:     	movq	%r14, (%rax,%rbx,8)
14590c5e4:     	incq	%r14
14590c5e7:     	incq	%rbx
14590c5ea:     	movq	%rbx, 0x2f0(%rbp)
14590c5f1:     	movq	0x60(%rbp), %rdx
14590c5f5:     	cmpq	%rdx, %rcx
14590c5f8:     	jne	0x14590c57c <.text+0x590b57c>
14590c5fa:     	movq	%rcx, 0x328(%rbp)
14590c601:     	movq	0x2e0(%rbp), %rax
14590c608:     	movq	%rax, 0x330(%rbp)
14590c60f:     	movq	0x2e8(%rbp), %rax
14590c616:     	movq	%rax, 0x370(%rbp)
14590c61d:     	leaq	(%rax,%rbx,8), %r15
14590c621:     	leaq	0x156eda8(%rip), %r12   # 0x146e7b3d0
14590c628:     	xorps	%xmm7, %xmm7
14590c62b:     	movl	$0x498, %r13d           # imm = 0x498
14590c631:     	movss	0x460dea(%rip), %xmm8   # 0x145d6d424
14590c63a:     	jmp	0x14590c690 <.text+0x590b690>
14590c63c:     	movl	%edi, %eax
14590c63e:     	xorps	%xmm0, %xmm0
14590c641:     	cvtsi2ss	%rax, %xmm0
14590c646:     	movq	0x378(%rbp), %rsi
14590c64d:     	mulss	0x494(%rsi), %xmm0
14590c655:     	callq	0x145bc97b1 <.text+0x5bc87b1>
14590c65a:     	maxss	0x460d0a(%rip), %xmm0   # 0x145d6d36c
14590c662:     	cvttss2si	%xmm0, %rdx
14590c667:     	ucomiss	%xmm7, %xmm0
14590c66a:     	movl	$0x0, %eax
14590c66f:     	cmovbl	%eax, %edx
14590c672:     	ucomiss	%xmm13, %xmm0
14590c676:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
14590c67b:     	cmoval	%eax, %edx
14590c67e:     	movq	%rsi, %rcx
14590c681:     	callq	0x14591c3a0 <.text+0x591b3a0>
14590c686:     	nop
14590c687:     	nopw	(%rax,%rax)
14590c690:     	cmpq	%r15, 0x370(%rbp)
14590c697:     	je	0x14590cb2d <.text+0x590bb2d>
14590c69d:     	movq	-0x8(%r15), %rbx
14590c6a1:     	movq	0x378(%rbp), %rax
14590c6a8:     	movq	0x5c8(%rax), %rdx
14590c6af:     	cmpq	%rdx, %rbx
14590c6b2:     	jae	0x14591136e <.text+0x591036e>
14590c6b8:     	addq	$-0x8, %r15
14590c6bc:     	movq	0x5c0(%rax), %rax
14590c6c3:     	leaq	(%rbx,%rbx,8), %rcx
14590c6c7:     	movl	0x20(%rax,%rcx,8), %r14d
14590c6cc:     	movl	0x24(%rax,%rcx,8), %edi
14590c6d0:     	cmpl	$0x2, %r14d
14590c6d4:     	jne	0x14590c750 <.text+0x590b750>
14590c6d6:     	movq	0x378(%rbp), %rcx
14590c6dd:     	cmpb	$0x0, 0xa67(%rcx)
14590c6e4:     	je	0x14590c740 <.text+0x590b740>
14590c6e6:     	cmpb	$0x0, 0xa6a(%rcx)
14590c6ed:     	movb	$0x1, 0xa6a(%rcx)
14590c6f4:     	jne	0x14590c690 <.text+0x590b690>
14590c6f6:     	movl	$0x1e, %edx
14590c6fb:     	leaq	0x156d566(%rip), %rcx   # 0x146e79c68
14590c702:     	callq	0x1458da590 <.text+0x58d9590>
14590c707:     	nop
14590c708:     	movq	%rdx, %r8
14590c70b:     	testq	%rax, %rax
14590c70e:     	leaq	0x156d553(%rip), %rcx   # 0x146e79c68
14590c715:     	cmoveq	%rcx, %rax
14590c719:     	movl	$0x1e, %ecx
14590c71e:     	cmoveq	%rcx, %r8
14590c722:     	movq	0x378(%rbp), %rcx
14590c729:     	movq	%rax, %rdx
14590c72c:     	callq	0x1459439c0 <.text+0x59429c0>
14590c731:     	nop
14590c732:     	jmp	0x14590c690 <.text+0x590b690>
14590c737:     	nopw	(%rax,%rax)
14590c740:     	callq	0x145944ce0 <.text+0x5943ce0>
14590c745:     	nop
14590c746:     	testb	%al, %al
14590c748:     	je	0x14590c690 <.text+0x590b690>
14590c74e:     	nop
14590c750:     	movq	0x378(%rbp), %rcx
14590c757:     	movq	%rbx, %rdx
14590c75a:     	callq	0x145942890 <.text+0x5941890>
14590c75f:     	nop
14590c760:     	movl	%r14d, %eax
14590c763:     	movslq	(%r12,%rax,4), %rax
14590c767:     	addq	%r12, %rax
14590c76a:     	jmpq	*%rax
14590c76c:     	movq	0x378(%rbp), %rcx
14590c773:     	movl	%r14d, %edx
14590c776:     	callq	0x1459451c0 <.text+0x59441c0>
14590c77b:     	nop
14590c77c:     	jmp	0x14590c690 <.text+0x590b690>
14590c781:     	callq	0x140002200 <.text+0x1200>
14590c786:     	movl	$0x20, %ecx
14590c78b:     	movl	$0x1, %edx
14590c790:     	callq	0x1400021c0 <.text+0x11c0>
14590c795:     	testq	%rax, %rax
14590c798:     	je	0x1459115f1 <.text+0x59105f1>
14590c79e:     	movq	%rax, 0x348(%rbp)
14590c7a5:     	movl	$0x4b4, (%rax)          # imm = 0x4B4
14590c7ab:     	movq	0x378(%rbp), %rax
14590c7b2:     	movq	0x5e0(%rax), %rsi
14590c7b9:     	cmpq	0x5d0(%rax), %rsi
14590c7c0:     	jne	0x14590c7cf <.text+0x590b7cf>
14590c7c2:     	movq	0x350(%rbp), %rcx
14590c7c9:     	callq	0x145bcb530 <.text+0x5bca530>
14590c7ce:     	nop
14590c7cf:     	movq	0x378(%rbp), %rdx
14590c7d6:     	movq	0x5d8(%rdx), %rax
14590c7dd:     	movq	%rsi, %rcx
14590c7e0:     	shlq	$0x5, %rcx
14590c7e4:     	movq	$0x20, (%rax,%rcx)
14590c7ec:     	movq	0x348(%rbp), %r8
14590c7f3:     	movq	%r8, 0x8(%rax,%rcx)
14590c7f8:     	movq	$0x4, 0x10(%rax,%rcx)
14590c801:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
14590c808:     	incq	%rsi
14590c80b:     	movq	%rsi, 0x5e0(%rdx)
14590c812:     	cmpb	$0x1, 0xa73(%rdx)
14590c819:     	jne	0x14590c690 <.text+0x590b690>
14590c81f:     	movq	0x378(%rbp), %rax
14590c826:     	cmpl	$0x0, 0x9f8(%rax)
14590c82d:     	je	0x14590c690 <.text+0x590b690>
14590c833:     	movq	0x378(%rbp), %rax
14590c83a:     	cmpb	$0x0, 0xa6c(%rax)
14590c841:     	jne	0x14590c690 <.text+0x590b690>
14590c847:     	movq	0x378(%rbp), %rcx
14590c84e:     	movb	$0x1, %dl
14590c850:     	movb	$0x1, %r8b
14590c853:     	callq	0x145951c10 <.text+0x5950c10>
14590c858:     	nop
14590c859:     	jmp	0x14590c690 <.text+0x590b690>
14590c85e:     	movq	0x378(%rbp), %rcx
14590c865:     	incl	0x724(%rcx)
14590c86b:     	callq	0x145943bb0 <.text+0x5942bb0>
14590c870:     	nop
14590c871:     	movq	0x378(%rbp), %rax
14590c878:     	movq	0x5c8(%rax), %rcx
14590c87f:     	testq	%rcx, %rcx
14590c882:     	je	0x14590ca04 <.text+0x590ba04>
14590c888:     	movq	0x378(%rbp), %rax
14590c88f:     	movss	0x4c8(%rax), %xmm0
14590c897:     	movss	0x4cc(%rax), %xmm1
14590c89f:     	movss	0x9ec(%rax), %xmm2
14590c8a7:     	movq	0x5c0(%rax), %rax
14590c8ae:     	shlq	$0x3, %rcx
14590c8b2:     	leaq	(%rcx,%rcx,8), %rcx
14590c8b6:     	xorl	%edx, %edx
14590c8b8:     	jmp	0x14590c8cd <.text+0x590b8cd>
14590c8ba:     	nopw	(%rax,%rax)
14590c8c0:     	addq	$0x48, %rdx
14590c8c4:     	cmpq	%rdx, %rcx
14590c8c7:     	je	0x14590ca04 <.text+0x590ba04>
14590c8cd:     	cmpl	$0x1, 0x20(%rax,%rdx)
14590c8d2:     	jne	0x14590c8c0 <.text+0x590b8c0>
14590c8d4:     	cmpl	$0x0, 0x18(%rax,%rdx)
14590c8d9:     	jne	0x14590c8c0 <.text+0x590b8c0>
14590c8db:     	movss	0x34(%rax,%rdx), %xmm3
14590c8e1:     	subss	%xmm0, %xmm3
14590c8e5:     	movss	0x38(%rax,%rdx), %xmm4
14590c8eb:     	subss	%xmm1, %xmm4
14590c8ef:     	mulss	%xmm3, %xmm3
14590c8f3:     	mulss	%xmm4, %xmm4
14590c8f7:     	addss	%xmm3, %xmm4
14590c8fb:     	xorps	%xmm3, %xmm3
14590c8fe:     	sqrtss	%xmm4, %xmm3
14590c902:     	divss	0x46436a(%rip), %xmm3   # 0x145d70c74
14590c90a:     	maxss	%xmm8, %xmm3
14590c90f:     	addss	%xmm2, %xmm3
14590c913:     	movl	$0x1, 0x18(%rax,%rdx)
14590c91b:     	movss	%xmm3, 0x1c(%rax,%rdx)
14590c921:     	jmp	0x14590c8c0 <.text+0x590b8c0>
14590c923:     	movl	%edi, %eax
14590c925:     	xorps	%xmm0, %xmm0
14590c928:     	cvtsi2ss	%rax, %xmm0
14590c92d:     	movq	0x378(%rbp), %rsi
14590c934:     	mulss	0x4a8(%rsi), %xmm0
14590c93c:     	callq	0x145bc97b1 <.text+0x5bc87b1>
14590c941:     	cvttss2si	%xmm0, %rax
14590c946:     	ucomiss	%xmm7, %xmm0
14590c949:     	movl	$0x0, %ecx
14590c94e:     	cmovbl	%ecx, %eax
14590c951:     	ucomiss	%xmm13, %xmm0
14590c955:     	movl	$0xffffffff, %ecx       # imm = 0xFFFFFFFF
14590c95a:     	cmoval	%ecx, %eax
14590c95d:     	movl	0x4e8(%rsi), %ecx
14590c963:     	addl	%eax, %ecx
14590c965:     	movl	%ecx, 0x4e8(%rsi)
14590c96b:     	addl	%eax, 0x71c(%rsi)
14590c971:     	imull	$0x2710, %ecx, %r8d     # imm = 0x2710
14590c978:     	movq	0x990(%rsi), %rax
14590c97f:     	testq	%rax, %rax
14590c982:     	je	0x14590cae0 <.text+0x590bae0>
14590c988:     	movq	0x998(%rsi), %rcx
14590c98f:     	movzwl	0x36(%rax), %r9d
14590c994:     	movl	%r9d, %r10d
14590c997:     	addl	%r10d, %r10d
14590c99a:     	movq	$-0x1, %rdx
14590c9a1:     	nopw	%cs:(%rax,%rax)
14590c9b0:     	testq	%r10, %r10
14590c9b3:     	je	0x14590c9f0 <.text+0x590b9f0>
14590c9b5:     	movzwl	0x3a(%rax,%rdx,2), %r11d
14590c9bb:     	cmpl	%r11d, %r13d
14590c9be:     	seta	%r11b
14590c9c2:     	sbbb	$0x0, %r11b
14590c9c6:     	incq	%rdx
14590c9c9:     	addq	$-0x2, %r10
14590c9cd:     	cmpb	$0x1, %r11b
14590c9d1:     	je	0x14590c9b0 <.text+0x590b9b0>
14590c9d3:     	movzbl	%r11b, %r9d
14590c9d7:     	testl	%r9d, %r9d
14590c9da:     	jne	0x14590c9f3 <.text+0x590b9f3>
14590c9dc:     	jmp	0x14590cad6 <.text+0x590bad6>
14590c9e1:     	nopw	%cs:(%rax,%rax)
14590c9f0:     	movq	%r9, %rdx
14590c9f3:     	subq	$0x1, %rcx
14590c9f7:     	jb	0x14590cae2 <.text+0x590bae2>
14590c9fd:     	movq	0x50(%rax,%rdx,8), %rax
14590ca02:     	jmp	0x14590c98f <.text+0x590b98f>
14590ca04:     	callq	0x140002200 <.text+0x1200>
14590ca09:     	movl	$0x20, %ecx
14590ca0e:     	movl	$0x1, %edx
14590ca13:     	callq	0x1400021c0 <.text+0x11c0>
14590ca18:     	testq	%rax, %rax
14590ca1b:     	je	0x1459115dc <.text+0x59105dc>
14590ca21:     	movq	%rax, 0x348(%rbp)
14590ca28:     	movl	$0x78, (%rax)
14590ca2e:     	movq	0x378(%rbp), %rax
14590ca35:     	movq	0x5e0(%rax), %rsi
14590ca3c:     	cmpq	0x5d0(%rax), %rsi
14590ca43:     	jne	0x14590ca52 <.text+0x590ba52>
14590ca45:     	movq	0x350(%rbp), %rcx
14590ca4c:     	callq	0x145bcb530 <.text+0x5bca530>
14590ca51:     	nop
14590ca52:     	movq	0x378(%rbp), %rdx
14590ca59:     	movq	0x5d8(%rdx), %rax
14590ca60:     	movq	%rsi, %rcx
14590ca63:     	shlq	$0x5, %rcx
14590ca67:     	movq	$0x20, (%rax,%rcx)
14590ca6f:     	movq	0x348(%rbp), %r8
14590ca76:     	movq	%r8, 0x8(%rax,%rcx)
14590ca7b:     	movq	$0x4, 0x10(%rax,%rcx)
14590ca84:     	movw	$0x2d2, 0x18(%rax,%rcx) # imm = 0x2D2
14590ca8b:     	incq	%rsi
14590ca8e:     	movq	%rsi, 0x5e0(%rdx)
14590ca95:     	movl	$0x2d, %edx
14590ca9a:     	leaq	0x156d077(%rip), %rcx   # 0x146e79b18
14590caa1:     	callq	0x1458da590 <.text+0x58d9590>
14590caa6:     	nop
14590caa7:     	movq	%rdx, %r8
14590caaa:     	testq	%rax, %rax
14590caad:     	leaq	0x156d064(%rip), %rcx   # 0x146e79b18
14590cab4:     	cmoveq	%rcx, %rax
14590cab8:     	movl	$0x2d, %ecx
14590cabd:     	cmoveq	%rcx, %r8
14590cac1:     	movq	0x378(%rbp), %rcx
14590cac8:     	movq	%rax, %rdx
14590cacb:     	callq	0x1459439c0 <.text+0x59429c0>
14590cad0:     	nop
14590cad1:     	jmp	0x14590c690 <.text+0x590b690>
14590cad6:     	movl	%r8d, 0x8(%rax,%rdx,4)
14590cadb:     	jmp	0x14590c690 <.text+0x590b690>
14590cae0:     	xorl	%eax, %eax
14590cae2:     	movq	0x338(%rbp), %rcx
14590cae9:     	movq	%rcx, 0xa0(%rbp)
14590caf0:     	movq	%rax, 0xa8(%rbp)
14590caf7:     	movq	$0x0, 0xb0(%rbp)
14590cb02:     	movq	%rdx, 0xb8(%rbp)
14590cb09:     	movq	$0x498, 0xc0(%rbp)      # imm = 0x498
14590cb14:     	leaq	0x230(%rbp), %rcx
14590cb1b:     	leaq	0xa0(%rbp), %rdx
14590cb22:     	callq	0x1458e1710 <.text+0x58e0710>
14590cb27:     	nop
14590cb28:     	jmp	0x14590c690 <.text+0x590b690>
