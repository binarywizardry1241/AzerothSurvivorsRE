
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454e6580:     	pushq	%rbp
1454e6581:     	pushq	%r15
1454e6583:     	pushq	%r14
1454e6585:     	pushq	%r13
1454e6587:     	pushq	%r12
1454e6589:     	pushq	%rsi
1454e658a:     	pushq	%rdi
1454e658b:     	pushq	%rbx
1454e658c:     	subq	$0x108, %rsp            # imm = 0x108
1454e6593:     	leaq	0x80(%rsp), %rbp
1454e659b:     	movaps	%xmm9, 0x70(%rbp)
1454e65a0:     	movaps	%xmm8, 0x60(%rbp)
1454e65a5:     	movaps	%xmm7, 0x50(%rbp)
1454e65a9:     	movaps	%xmm6, 0x40(%rbp)
1454e65ad:     	movq	$-0x2, 0x38(%rbp)
1454e65b5:     	movl	%r9d, 0x20(%rbp)
1454e65b9:     	movq	%r8, 0x28(%rbp)
1454e65bd:     	movq	%rcx, %rsi
1454e65c0:     	movss	0x100(%rbp), %xmm6
1454e65c8:     	movq	0xf0(%rbp), %r13
1454e65cf:     	movq	0xf8(%rbp), %rbx
1454e65d6:     	movq	(%rdx), %r12
1454e65d9:     	testq	%rbx, %rbx
1454e65dc:     	je	0x1454e66fd <.text+0x54e56fd>
1454e65e2:     	leaq	(,%rbx,8), %r15
1454e65ea:     	movzbl	0x129(%rsi), %edi
1454e65f1:     	movups	0x20(%rsi), %xmm7
1454e65f5:     	movups	0x40(%rsi), %xmm8
1454e65fa:     	xorl	%r14d, %r14d
1454e65fd:     	movss	0x521d9a(%rip), %xmm9   # 0x145a083a0
1454e6606:     	jmp	0x1454e6643 <.text+0x54e5643>
1454e6608:     	nopl	(%rax,%rax)
1454e6610:     	seta	0x28(%rsp)
1454e6615:     	movb	%al, 0x20(%rsp)
1454e6619:     	movb	$0x0, 0x30(%rsp)
1454e661e:     	movq	%rsi, %rcx
1454e6621:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454e6626:     	movb	%dil, 0x129(%rsi)
1454e662d:     	movups	%xmm7, 0x20(%rsi)
1454e6631:     	movups	%xmm8, 0x40(%rsi)
1454e6636:     	addq	$0x8, %r14
1454e663a:     	cmpq	%r14, %r15
1454e663d:     	je	0x1454e66fd <.text+0x54e56fd>
1454e6643:     	movq	(%r13,%r14), %rdx
1454e6648:     	movq	0x8a0(%rsi), %rax
1454e664f:     	movq	0x8b8(%rsi), %rcx
1454e6656:     	leaq	(%rcx,%rax), %r8
1454e665a:     	rolq	$0x17, %r8
1454e665e:     	addq	%rax, %r8
1454e6661:     	movq	0x8a8(%rsi), %r9
1454e6668:     	movq	%r9, %r10
1454e666b:     	shlq	$0x11, %r10
1454e666f:     	movq	0x8b0(%rsi), %r11
1454e6676:     	xorq	%rax, %r11
1454e6679:     	xorq	%r9, %rcx
1454e667c:     	xorq	%r11, %r9
1454e667f:     	movq	%r9, 0x8a8(%rsi)
1454e6686:     	xorq	%rcx, %rax
1454e6689:     	movq	%rax, 0x8a0(%rsi)
1454e6690:     	xorq	%r10, %r11
1454e6693:     	movq	%r11, 0x8b0(%rsi)
1454e669a:     	rolq	$0x2d, %rcx
1454e669e:     	movq	%rcx, 0x8b8(%rsi)
1454e66a5:     	shrq	$0x28, %r8
1454e66a9:     	xorps	%xmm0, %xmm0
1454e66ac:     	cvtsi2ss	%r8d, %xmm0
1454e66b1:     	mulss	%xmm9, %xmm0
1454e66b6:     	movss	0x47c(%rsi), %xmm1
1454e66be:     	movss	0x480(%rsi), %xmm2
1454e66c6:     	mulss	%xmm6, %xmm2
1454e66ca:     	movl	0x40(%r12), %r9d
1454e66cf:     	movzbl	0x74(%r12), %eax
1454e66d5:     	movb	$0x3, 0x129(%rsi)
1454e66dc:     	movq	$0x0, 0x20(%rsi)
1454e66e4:     	movq	$0x0, 0x40(%rsi)
1454e66ec:     	ucomiss	%xmm0, %xmm1
1454e66ef:     	ja	0x1454e6610 <.text+0x54e5610>
1454e66f5:     	movaps	%xmm6, %xmm2
1454e66f8:     	jmp	0x1454e6610 <.text+0x54e5610>
1454e66fd:     	movq	0x718(%rsi), %rdi
1454e6704:     	testq	%rdi, %rdi
1454e6707:     	je	0x1454e69d3 <.text+0x54e59d3>
1454e670d:     	leaq	(,%rbx,8), %rax
1454e6715:     	addq	%r13, %rax
1454e6718:     	movq	%rax, -0x28(%rbp)
1454e671c:     	movq	(%r12), %r14
1454e6720:     	movq	0x8(%r12), %r15
1454e6725:     	movq	0x710(%rsi), %rbx
1454e672c:     	addq	$0x10, %rbx
1454e6730:     	movss	0x42cc14(%rip), %xmm7   # 0x14591334c
1454e6738:     	jmp	0x1454e6749 <.text+0x54e5749>
1454e673a:     	nopw	(%rax,%rax)
1454e6740:     	addq	$0x40, %rbx
1454e6744:     	decq	%rdi
1454e6747:     	je	0x1454e676e <.text+0x54e576e>
1454e6749:     	cmpb	$0xd, -0x10(%rbx)
1454e674d:     	jne	0x1454e6740 <.text+0x54e5740>
1454e674f:     	cmpq	%r15, (%rbx)
1454e6752:     	jne	0x1454e6740 <.text+0x54e5740>
1454e6754:     	movq	-0x8(%rbx), %rcx
1454e6758:     	movq	%r14, %rdx
1454e675b:     	movq	%r15, %r8
1454e675e:     	callq	0x1457731e7 <.text+0x57721e7>
1454e6763:     	testl	%eax, %eax
1454e6765:     	jne	0x1454e6740 <.text+0x54e5740>
1454e6767:     	addss	-0xc(%rbx), %xmm7
1454e676c:     	jmp	0x1454e6740 <.text+0x54e5740>
1454e676e:     	xorps	%xmm0, %xmm0
1454e6771:     	ucomiss	%xmm7, %xmm0
1454e6774:     	jae	0x1454e69d3 <.text+0x54e59d3>
1454e677a:     	leaq	0x4d8(%rsi), %rax
1454e6781:     	movq	%r13, -0x20(%rbp)
1454e6785:     	movq	-0x28(%rbp), %rcx
1454e6789:     	movq	%rcx, -0x18(%rbp)
1454e678d:     	movq	%rax, -0x10(%rbp)
1454e6791:     	movq	%rbp, %rcx
1454e6794:     	leaq	-0x20(%rbp), %rdx
1454e6798:     	callq	0x145541170 <.text+0x5540170>
1454e679d:     	movq	0x10(%rbp), %r14
1454e67a1:     	testq	%r14, %r14
1454e67a4:     	je	0x1454e67dd <.text+0x54e57dd>
1454e67a6:     	movq	0x4e0(%rsi), %rcx
1454e67ad:     	imulq	$0x160, 0x4e8(%rsi), %rax # imm = 0x160
1454e67b8:     	movq	0x28(%rbp), %rdx
1454e67bc:     	nopl	(%rax)
1454e67c0:     	testq	%rax, %rax
1454e67c3:     	je	0x1454e67f7 <.text+0x54e57f7>
1454e67c5:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454e67cb:     	cmpq	%rdx, 0x88(%rcx)
1454e67d2:     	leaq	0x160(%rcx), %rcx
1454e67d9:     	jne	0x1454e67c0 <.text+0x54e57c0>
1454e67db:     	jmp	0x1454e6804 <.text+0x54e5804>
1454e67dd:     	movq	(%rbp), %rdx
1454e67e1:     	testq	%rdx, %rdx
1454e67e4:     	je	0x1454e69d3 <.text+0x54e59d3>
1454e67ea:     	movq	0x8(%rbp), %rax
1454e67ee:     	movq	%rax, 0x28(%rbp)
1454e67f2:     	jmp	0x1454e69c0 <.text+0x54e59c0>
1454e67f7:     	cmpq	0x3e8(%rsi), %rdx
1454e67fe:     	jne	0x1454e688f <.text+0x54e588f>
1454e6804:     	movq	0x8(%rbp), %r9
1454e6808:     	movl	$0x2, -0x48(%rbp)
1454e680f:     	movl	$0x0, -0x34(%rbp)
1454e6816:     	movq	%r9, 0x18(%rbp)
1454e681a:     	movb	$0x1, 0x37(%rbp)
1454e681e:     	leaq	-0x34(%rbp), %rax
1454e6822:     	movq	%rax, 0x30(%rsp)
1454e6827:     	leaq	-0x48(%rbp), %rax
1454e682b:     	movq	%rax, 0x28(%rsp)
1454e6830:     	movq	%r14, 0x20(%rsp)
1454e6835:     	leaq	-0x20(%rbp), %rcx
1454e6839:     	movl	0x20(%rbp), %r8d
1454e683d:     	movq	%r9, 0x28(%rbp)
1454e6841:     	callq	0x145466ab0 <.text+0x5465ab0>
1454e6846:     	nop
1454e6847:     	movq	0x560(%rsi), %rdi
1454e684e:     	cmpq	0x550(%rsi), %rdi
1454e6855:     	jne	0x1454e6864 <.text+0x54e5864>
1454e6857:     	leaq	0x550(%rsi), %rcx
1454e685e:     	callq	0x145774710 <.text+0x5773710>
1454e6863:     	nop
1454e6864:     	movq	0x558(%rsi), %rax
1454e686b:     	movq	%rdi, %rcx
1454e686e:     	shlq	$0x5, %rcx
1454e6872:     	movups	-0x20(%rbp), %xmm0
1454e6876:     	movups	-0x10(%rbp), %xmm1
1454e687a:     	movups	%xmm1, 0x10(%rax,%rcx)
1454e687f:     	movups	%xmm0, (%rax,%rcx)
1454e6883:     	incq	%rdi
1454e6886:     	movq	%rdi, 0x560(%rsi)
1454e688d:     	jmp	0x1454e6897 <.text+0x54e5897>
1454e688f:     	movq	0x8(%rbp), %rax
1454e6893:     	movq	%rax, 0x28(%rbp)
1454e6897:     	movq	(%rbp), %rax
1454e689b:     	movq	%rax, 0x20(%rbp)
1454e689f:     	shlq	$0x3, %r14
1454e68a3:     	mulss	%xmm7, %xmm6
1454e68a7:     	movzbl	0x129(%rsi), %ebx
1454e68ae:     	movups	0x20(%rsi), %xmm7
1454e68b2:     	movups	0x40(%rsi), %xmm8
1454e68b7:     	xorl	%edi, %edi
1454e68b9:     	movss	0x521ade(%rip), %xmm9   # 0x145a083a0
1454e68c2:     	nopw	%cs:(%rax,%rax)
1454e68d0:     	movq	0x28(%rbp), %rax
1454e68d4:     	movq	(%rax,%rdi), %rdx
1454e68d8:     	movq	0x8a0(%rsi), %rax
1454e68df:     	movq	0x8b8(%rsi), %rcx
1454e68e6:     	leaq	(%rcx,%rax), %r8
1454e68ea:     	rolq	$0x17, %r8
1454e68ee:     	addq	%rax, %r8
1454e68f1:     	movq	0x8a8(%rsi), %r9
1454e68f8:     	movq	%r9, %r10
1454e68fb:     	shlq	$0x11, %r10
1454e68ff:     	movq	0x8b0(%rsi), %r11
1454e6906:     	xorq	%rax, %r11
1454e6909:     	xorq	%r9, %rcx
1454e690c:     	xorq	%r11, %r9
1454e690f:     	movq	%r9, 0x8a8(%rsi)
1454e6916:     	xorq	%rcx, %rax
1454e6919:     	movq	%rax, 0x8a0(%rsi)
1454e6920:     	xorq	%r10, %r11
1454e6923:     	movq	%r11, 0x8b0(%rsi)
1454e692a:     	rolq	$0x2d, %rcx
1454e692e:     	movq	%rcx, 0x8b8(%rsi)
1454e6935:     	shrq	$0x28, %r8
1454e6939:     	xorps	%xmm0, %xmm0
1454e693c:     	cvtsi2ss	%r8d, %xmm0
1454e6941:     	mulss	%xmm9, %xmm0
1454e6946:     	movss	0x47c(%rsi), %xmm1
1454e694e:     	movss	0x480(%rsi), %xmm2
1454e6956:     	mulss	%xmm6, %xmm2
1454e695a:     	movl	0x40(%r12), %r9d
1454e695f:     	movzbl	0x74(%r12), %eax
1454e6965:     	movb	$0x3, 0x129(%rsi)
1454e696c:     	movq	$0x0, 0x20(%rsi)
1454e6974:     	movq	$0x0, 0x40(%rsi)
1454e697c:     	ucomiss	%xmm0, %xmm1
1454e697f:     	ja	0x1454e6984 <.text+0x54e5984>
1454e6981:     	movaps	%xmm6, %xmm2
1454e6984:     	seta	0x28(%rsp)
1454e6989:     	movb	%al, 0x20(%rsp)
1454e698d:     	movb	$0x0, 0x30(%rsp)
1454e6992:     	movq	%rsi, %rcx
1454e6995:     	callq	0x1454d4ff0 <.text+0x54d3ff0>
1454e699a:     	nop
1454e699b:     	movb	%bl, 0x129(%rsi)
1454e69a1:     	movups	%xmm7, 0x20(%rsi)
1454e69a5:     	movups	%xmm8, 0x40(%rsi)
1454e69aa:     	addq	$0x8, %rdi
1454e69ae:     	cmpq	%rdi, %r14
1454e69b1:     	jne	0x1454e68d0 <.text+0x54e58d0>
1454e69b7:     	movq	0x20(%rbp), %rdx
1454e69bb:     	testq	%rdx, %rdx
1454e69be:     	je	0x1454e69d3 <.text+0x54e59d3>
1454e69c0:     	shlq	$0x3, %rdx
1454e69c4:     	movl	$0x8, %r8d
1454e69ca:     	movq	0x28(%rbp), %rcx
1454e69ce:     	callq	0x1400021d0 <.text+0x11d0>
1454e69d3:     	movaps	0x40(%rbp), %xmm6
1454e69d7:     	movaps	0x50(%rbp), %xmm7
1454e69db:     	movaps	0x60(%rbp), %xmm8
1454e69e0:     	movaps	0x70(%rbp), %xmm9
1454e69e5:     	addq	$0x108, %rsp            # imm = 0x108
1454e69ec:     	popq	%rbx
1454e69ed:     	popq	%rdi
1454e69ee:     	popq	%rsi
1454e69ef:     	popq	%r12
1454e69f1:     	popq	%r13
1454e69f3:     	popq	%r14
1454e69f5:     	popq	%r15
1454e69f7:     	popq	%rbp
1454e69f8:     	retq
