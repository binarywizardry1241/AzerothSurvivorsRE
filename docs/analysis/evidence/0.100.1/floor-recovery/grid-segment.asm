
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455246f0:     	pushq	%r15
1455246f2:     	pushq	%r14
1455246f4:     	pushq	%r12
1455246f6:     	pushq	%rsi
1455246f7:     	pushq	%rdi
1455246f8:     	pushq	%rbx
1455246f9:     	subq	$0xc8, %rsp
145524700:     	movaps	%xmm15, 0xb0(%rsp)
145524709:     	movaps	%xmm14, 0xa0(%rsp)
145524712:     	movaps	%xmm13, 0x90(%rsp)
14552471b:     	movaps	%xmm12, 0x80(%rsp)
145524724:     	movaps	%xmm11, 0x70(%rsp)
14552472a:     	movaps	%xmm10, 0x60(%rsp)
145524730:     	movaps	%xmm9, 0x50(%rsp)
145524736:     	movaps	%xmm8, 0x40(%rsp)
14552473c:     	movaps	%xmm7, 0x30(%rsp)
145524741:     	movaps	%xmm6, 0x20(%rsp)
145524746:     	movd	%edx, %xmm6
14552474a:     	shrq	$0x20, %rdx
14552474e:     	movd	%edx, %xmm7
145524752:     	movd	%r8d, %xmm8
145524757:     	shrq	$0x20, %r8
14552475b:     	movd	%r8d, %xmm9
145524760:     	subss	%xmm6, %xmm8
145524765:     	subss	%xmm7, %xmm9
14552476a:     	movaps	%xmm8, %xmm0
14552476e:     	mulss	%xmm8, %xmm0
145524773:     	movaps	%xmm9, %xmm1
145524777:     	mulss	%xmm9, %xmm1
14552477c:     	addss	%xmm0, %xmm1
145524780:     	xorps	%xmm0, %xmm0
145524783:     	sqrtss	%xmm1, %xmm0
145524787:     	movss	0x3e2d00(%rip), %xmm10  # 0x145907490
145524790:     	movss	0x3eebc0(%rip), %xmm1   # 0x145913358
145524798:     	ucomiss	%xmm0, %xmm1
14552479b:     	ja	0x145524a52 <.text+0x5523a52>
1455247a1:     	movq	%rcx, %rsi
1455247a4:     	divss	0x3f1124(%rip), %xmm0   # 0x1459158d0
1455247ac:     	callq	0x14577327d <.text+0x577227d>
1455247b1:     	cvttss2si	%xmm0, %rax
1455247b6:     	movq	%rax, %rcx
1455247b9:     	sarq	$0x3f, %rcx
1455247bd:     	movaps	%xmm0, %xmm1
1455247c0:     	subss	0x3e2a18(%rip), %xmm1   # 0x1459071e0
1455247c8:     	cvttss2si	%xmm1, %rdx
1455247cd:     	andq	%rcx, %rdx
1455247d0:     	orq	%rax, %rdx
1455247d3:     	xorl	%r8d, %r8d
1455247d6:     	xorps	%xmm4, %xmm4
1455247d9:     	ucomiss	%xmm4, %xmm0
1455247dc:     	movl	$0x0, %ecx
1455247e1:     	cmovaeq	%rdx, %rcx
1455247e5:     	ucomiss	0x3e29f8(%rip), %xmm0   # 0x1459071e4
1455247ec:     	movq	$-0x1, %rax
1455247f3:     	cmovbeq	%rcx, %rax
1455247f7:     	movss	0x20(%rsi), %xmm1
1455247fc:     	movss	0x24(%rsi), %xmm2
145524801:     	movaps	%xmm6, %xmm3
145524804:     	subss	%xmm1, %xmm3
145524808:     	ucomiss	%xmm3, %xmm4
14552480b:     	ja	0x1455248c4 <.text+0x55238c4>
145524811:     	movaps	%xmm7, %xmm0
145524814:     	subss	%xmm2, %xmm0
145524818:     	ucomiss	%xmm0, %xmm4
14552481b:     	ja	0x1455248c4 <.text+0x55238c4>
145524821:     	movss	0x3e29b7(%rip), %xmm4   # 0x1459071e0
145524829:     	movaps	%xmm3, %xmm5
14552482c:     	subss	%xmm4, %xmm5
145524830:     	cvttss2si	%xmm5, %rcx
145524835:     	cvttss2si	%xmm3, %r8
14552483a:     	movq	%r8, %rdx
14552483d:     	sarq	$0x3f, %rdx
145524841:     	andq	%rcx, %rdx
145524844:     	orq	%r8, %rdx
145524847:     	xorl	%r8d, %r8d
14552484a:     	xorps	%xmm5, %xmm5
14552484d:     	ucomiss	%xmm5, %xmm3
145524850:     	cmovbq	%r8, %rdx
145524854:     	movss	0x3e2987(%rip), %xmm11  # 0x1459071e4
14552485d:     	ucomiss	%xmm11, %xmm3
145524861:     	movq	$-0x1, %rcx
145524868:     	cmovaq	%rcx, %rdx
14552486c:     	movaps	%xmm0, %xmm3
14552486f:     	subss	%xmm4, %xmm3
145524873:     	cvttss2si	%xmm3, %r10
145524878:     	cvttss2si	%xmm0, %r11
14552487d:     	movq	%r11, %r9
145524880:     	sarq	$0x3f, %r9
145524884:     	andq	%r10, %r9
145524887:     	orq	%r11, %r9
14552488a:     	ucomiss	%xmm5, %xmm0
14552488d:     	cmovbq	%r8, %r9
145524891:     	ucomiss	%xmm11, %xmm0
145524895:     	cmovaq	%rcx, %r9
145524899:     	movq	0x18(%rsi), %rcx
14552489d:     	cmpq	%rcx, %rdx
1455248a0:     	jae	0x1455248c4 <.text+0x55238c4>
1455248a2:     	cmpq	%rcx, %r9
1455248a5:     	jae	0x1455248c4 <.text+0x55238c4>
1455248a7:     	imulq	%r9, %rcx
1455248ab:     	addq	%rdx, %rcx
1455248ae:     	movq	0x10(%rsi), %rdx
1455248b2:     	cmpq	%rdx, %rcx
1455248b5:     	jae	0x145524aad <.text+0x5523aad>
1455248bb:     	movq	0x8(%rsi), %rdx
1455248bf:     	movzbl	(%rdx,%rcx), %r8d
1455248c4:     	testq	%rax, %rax
1455248c7:     	je	0x145524a52 <.text+0x5523a52>
1455248cd:     	js	0x1455248d9 <.text+0x55238d9>
1455248cf:     	xorps	%xmm3, %xmm3
1455248d2:     	cvtsi2ss	%rax, %xmm3
1455248d7:     	jmp	0x1455248f3 <.text+0x55238f3>
1455248d9:     	movq	%rax, %rcx
1455248dc:     	shrq	%rcx
1455248df:     	movl	%eax, %edx
1455248e1:     	andl	$0x1, %edx
1455248e4:     	orq	%rcx, %rdx
1455248e7:     	xorps	%xmm3, %xmm3
1455248ea:     	cvtsi2ss	%rdx, %xmm3
1455248ef:     	addss	%xmm3, %xmm3
1455248f3:     	movq	0x18(%rsi), %r9
1455248f7:     	movq	0x8(%rsi), %r10
1455248fb:     	movq	0x10(%rsi), %rdx
1455248ff:     	movl	$0x1, %esi
145524904:     	xorps	%xmm4, %xmm4
145524907:     	movss	0x3e28d1(%rip), %xmm5   # 0x1459071e0
14552490f:     	movss	0x3e28cc(%rip), %xmm11  # 0x1459071e4
145524918:     	movq	$-0x1, %r11
14552491f:     	xorps	%xmm0, %xmm0
145524922:     	movl	$0x1, %edi
145524927:     	nopw	(%rax,%rax)
145524930:     	cmpq	%rax, %rsi
145524933:     	adcq	$0x0, %rdi
145524937:     	testq	%rsi, %rsi
14552493a:     	js	0x145524950 <.text+0x5523950>
14552493c:     	xorps	%xmm12, %xmm12
145524940:     	cvtsi2ss	%rsi, %xmm12
145524945:     	jmp	0x14552496c <.text+0x552396c>
145524947:     	nopw	(%rax,%rax)
145524950:     	movq	%rsi, %rcx
145524953:     	shrq	%rcx
145524956:     	movl	%esi, %ebx
145524958:     	andl	$0x1, %ebx
14552495b:     	orq	%rcx, %rbx
14552495e:     	xorps	%xmm12, %xmm12
145524962:     	cvtsi2ss	%rbx, %xmm12
145524967:     	addss	%xmm12, %xmm12
14552496c:     	divss	%xmm3, %xmm12
145524971:     	movaps	%xmm8, %xmm14
145524975:     	mulss	%xmm12, %xmm14
14552497a:     	addss	%xmm6, %xmm14
14552497f:     	subss	%xmm1, %xmm14
145524984:     	xorl	%ebx, %ebx
145524986:     	ucomiss	%xmm14, %xmm4
14552498a:     	ja	0x145524a3a <.text+0x5523a3a>
145524990:     	movaps	%xmm9, %xmm13
145524994:     	mulss	%xmm12, %xmm13
145524999:     	addss	%xmm7, %xmm13
14552499e:     	subss	%xmm2, %xmm13
1455249a3:     	ucomiss	%xmm13, %xmm4
1455249a7:     	ja	0x145524a3a <.text+0x5523a3a>
1455249ad:     	movaps	%xmm14, %xmm15
1455249b1:     	subss	%xmm5, %xmm15
1455249b6:     	cvttss2si	%xmm15, %rcx
1455249bb:     	cvttss2si	%xmm14, %rbx
1455249c0:     	movq	%rbx, %r14
1455249c3:     	sarq	$0x3f, %r14
1455249c7:     	andq	%rcx, %r14
1455249ca:     	orq	%rbx, %r14
1455249cd:     	xorl	%ebx, %ebx
1455249cf:     	ucomiss	%xmm4, %xmm14
1455249d3:     	cmovbq	%rbx, %r14
1455249d7:     	ucomiss	%xmm11, %xmm14
1455249db:     	cmovaq	%r11, %r14
1455249df:     	movaps	%xmm13, %xmm14
1455249e3:     	subss	%xmm5, %xmm14
1455249e8:     	cvttss2si	%xmm14, %r15
1455249ed:     	cvttss2si	%xmm13, %r12
1455249f2:     	movq	%r12, %rcx
1455249f5:     	sarq	$0x3f, %rcx
1455249f9:     	andq	%r15, %rcx
1455249fc:     	orq	%r12, %rcx
1455249ff:     	ucomiss	%xmm4, %xmm13
145524a03:     	cmovbq	%rbx, %rcx
145524a07:     	ucomiss	%xmm11, %xmm13
145524a0b:     	cmovaq	%r11, %rcx
145524a0f:     	cmpq	%r9, %r14
145524a12:     	jae	0x145524a3a <.text+0x5523a3a>
145524a14:     	cmpq	%r9, %rcx
145524a17:     	jae	0x145524a3a <.text+0x5523a3a>
145524a19:     	imulq	%r9, %rcx
145524a1d:     	addq	%r14, %rcx
145524a20:     	cmpq	%rdx, %rcx
145524a23:     	jae	0x145524aad <.text+0x5523aad>
145524a29:     	movzbl	(%r10,%rcx), %ebx
145524a2e:     	movl	%ebx, %ecx
145524a30:     	notb	%cl
145524a32:     	orb	%r8b, %cl
145524a35:     	testb	$0x1, %cl
145524a38:     	je	0x145524a56 <.text+0x5523a56>
145524a3a:     	cmpq	%rax, %rsi
145524a3d:     	jae	0x145524a52 <.text+0x5523a52>
145524a3f:     	andb	%bl, %r8b
145524a42:     	movaps	%xmm12, %xmm0
145524a46:     	movq	%rdi, %rsi
145524a49:     	cmpq	%rax, %rdi
145524a4c:     	jbe	0x145524930 <.text+0x5523930>
145524a52:     	movaps	%xmm10, %xmm0
145524a56:     	movaps	0x20(%rsp), %xmm6
145524a5b:     	movaps	0x30(%rsp), %xmm7
145524a60:     	movaps	0x40(%rsp), %xmm8
145524a66:     	movaps	0x50(%rsp), %xmm9
145524a6c:     	movaps	0x60(%rsp), %xmm10
145524a72:     	movaps	0x70(%rsp), %xmm11
145524a78:     	movaps	0x80(%rsp), %xmm12
145524a81:     	movaps	0x90(%rsp), %xmm13
145524a8a:     	movaps	0xa0(%rsp), %xmm14
145524a93:     	movaps	0xb0(%rsp), %xmm15
145524a9c:     	addq	$0xc8, %rsp
145524aa3:     	popq	%rbx
145524aa4:     	popq	%rdi
145524aa5:     	popq	%rsi
145524aa6:     	popq	%r12
145524aa8:     	popq	%r14
145524aaa:     	popq	%r15
145524aac:     	retq
145524aad:     	leaq	0x181022c(%rip), %r8    # 0x146d34ce0
145524ab4:     	callq	0x145903b33 <.text+0x5902b33>
145524ab9:     	ud2
