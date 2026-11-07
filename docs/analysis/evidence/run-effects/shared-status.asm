
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ff860:     	pushq	%rbp
1454ff861:     	pushq	%r15
1454ff863:     	pushq	%r14
1454ff865:     	pushq	%rsi
1454ff866:     	pushq	%rdi
1454ff867:     	pushq	%rbx
1454ff868:     	subq	$0xf8, %rsp
1454ff86f:     	leaq	0x80(%rsp), %rbp
1454ff877:     	movaps	%xmm8, 0x60(%rbp)
1454ff87c:     	movaps	%xmm7, 0x50(%rbp)
1454ff880:     	movaps	%xmm6, 0x40(%rbp)
1454ff884:     	movq	$-0x2, 0x38(%rbp)
1454ff88c:     	movq	%rcx, %rsi
1454ff88f:     	movl	0xd0(%rbp), %edi
1454ff895:     	movss	0x934(%rcx), %xmm6
1454ff89d:     	movl	(%r8), %eax
1454ff8a0:     	leaq	0x14f9259(%rip), %rcx   # 0x1469f8b00
1454ff8a7:     	movslq	(%rcx,%rax,4), %rax
1454ff8ab:     	addq	%rcx, %rax
1454ff8ae:     	jmpq	*%rax
1454ff8b0:     	movaps	0x40(%rbp), %xmm6
1454ff8b4:     	movaps	0x50(%rbp), %xmm7
1454ff8b8:     	movaps	0x60(%rbp), %xmm8
1454ff8bd:     	addq	$0xf8, %rsp
1454ff8c4:     	popq	%rbx
1454ff8c5:     	popq	%rdi
1454ff8c6:     	popq	%rsi
1454ff8c7:     	popq	%r14
1454ff8c9:     	popq	%r15
1454ff8cb:     	popq	%rbp
1454ff8cc:     	retq
1454ff8cd:     	movq	0x4e8(%rsi), %rax
1454ff8d4:     	testq	%rax, %rax
1454ff8d7:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ff8d9:     	movss	0x4(%r8), %xmm0
1454ff8df:     	movq	0x4e0(%rsi), %rbx
1454ff8e6:     	imulq	$0x160, %rax, %rax      # imm = 0x160
1454ff8ed:     	jmp	0x1454ff8ff <.text+0x54fe8ff>
1454ff8ef:     	nop
1454ff8f0:     	addq	$0x160, %rbx            # imm = 0x160
1454ff8f7:     	addq	$-0x160, %rax           # imm = 0xFEA0
1454ff8fd:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ff8ff:     	cmpq	%rdx, 0x88(%rbx)
1454ff906:     	jne	0x1454ff8f0 <.text+0x54fe8f0>
1454ff908:     	cmpl	$0x1, 0x68(%rbx)
1454ff90c:     	je	0x1454ff8f0 <.text+0x54fe8f0>
1454ff90e:     	movss	0x144(%rbx), %xmm1
1454ff916:     	ucomiss	%xmm1, %xmm6
1454ff919:     	jae	0x145500122 <.text+0x54ff122>
1454ff91f:     	movss	0x148(%rbx), %xmm2
1454ff927:     	jmp	0x14550013e <.text+0x54ff13e>
1454ff92c:     	movss	0x4(%r8), %xmm0
1454ff932:     	movl	0x3fc(%rsi), %eax
1454ff938:     	incl	%eax
1454ff93a:     	ucomiss	0x3f8(%rsi), %xmm6
1454ff941:     	movl	$0x1, %ecx
1454ff946:     	cmovnel	%ecx, %eax
1454ff949:     	cmovpl	%ecx, %eax
1454ff94c:     	movl	%eax, 0x3fc(%rsi)
1454ff952:     	movss	%xmm6, 0x3f8(%rsi)
1454ff95a:     	mulss	0x470(%rsi), %xmm0
1454ff962:     	cmpl	$0x5, %eax
1454ff965:     	movl	$0x5, %ecx
1454ff96a:     	cmovbl	%eax, %ecx
1454ff96d:     	cvtsi2ss	%ecx, %xmm1
1454ff971:     	mulss	%xmm0, %xmm1
1454ff975:     	movss	0x41c(%rsi), %xmm0
1454ff97d:     	movaps	%xmm0, %xmm2
1454ff980:     	maxss	%xmm1, %xmm2
1454ff984:     	movaps	%xmm2, %xmm1
1454ff987:     	cmpunordss	%xmm2, %xmm1
1454ff98c:     	movaps	%xmm1, %xmm3
1454ff98f:     	andnps	%xmm2, %xmm3
1454ff992:     	andps	%xmm0, %xmm1
1454ff995:     	orps	%xmm3, %xmm1
1454ff998:     	movss	%xmm1, 0x41c(%rsi)
1454ff9a0:     	testl	%edi, %edi
1454ff9a2:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ff9a8:     	movq	0x310(%rsi), %rax
1454ff9af:     	movq	0x318(%rsi), %rbx
1454ff9b6:     	leaq	(,%rbx,8), %rcx
1454ff9be:     	leaq	(%rcx,%rcx,2), %rcx
1454ff9c2:     	movq	%rax, %rdx
1454ff9c5:     	nopw	%cs:(%rax,%rax)
1454ff9d0:     	testq	%rcx, %rcx
1454ff9d3:     	je	0x1454ffec7 <.text+0x54feec7>
1454ff9d9:     	addq	$-0x18, %rcx
1454ff9dd:     	cmpl	%edi, 0xc(%rdx)
1454ff9e0:     	leaq	0x18(%rdx), %rdx
1454ff9e4:     	jne	0x1454ff9d0 <.text+0x54fe9d0>
1454ff9e6:     	jmp	0x1454ff8b0 <.text+0x54fe8b0>
1454ff9eb:     	movq	0x4e8(%rsi), %rcx
1454ff9f2:     	testq	%rcx, %rcx
1454ff9f5:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ff9fb:     	movss	0x4(%r8), %xmm0
1454ffa01:     	movss	0x8(%r8), %xmm1
1454ffa07:     	movq	0x4e0(%rsi), %rax
1454ffa0e:     	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454ffa15:     	xorl	%ecx, %ecx
1454ffa17:     	jmp	0x1454ffa30 <.text+0x54fea30>
1454ffa19:     	nopl	(%rax)
1454ffa20:     	addq	$0x160, %rcx            # imm = 0x160
1454ffa27:     	cmpq	%rcx, %r8
1454ffa2a:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ffa30:     	cmpq	%rdx, 0x88(%rax,%rcx)
1454ffa38:     	jne	0x1454ffa20 <.text+0x54fea20>
1454ffa3a:     	cmpl	$0x1, 0x68(%rax,%rcx)
1454ffa3f:     	je	0x1454ffa20 <.text+0x54fea20>
1454ffa41:     	addss	%xmm1, %xmm6
1454ffa45:     	movss	%xmm0, 0x98(%rax,%rcx)
1454ffa4e:     	movss	%xmm6, 0x9c(%rax,%rcx)
1454ffa57:     	jmp	0x1454ff8b0 <.text+0x54fe8b0>
1454ffa5c:     	movq	0x4e8(%rsi), %rcx
1454ffa63:     	testq	%rcx, %rcx
1454ffa66:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ffa6c:     	movss	0x4(%r8), %xmm1
1454ffa72:     	movss	0x8(%r8), %xmm0
1454ffa78:     	movq	0x4e0(%rsi), %rax
1454ffa7f:     	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454ffa86:     	xorl	%ecx, %ecx
1454ffa88:     	jmp	0x1454ffaa0 <.text+0x54feaa0>
1454ffa8a:     	nopw	(%rax,%rax)
1454ffa90:     	addq	$0x160, %rcx            # imm = 0x160
1454ffa97:     	cmpq	%rcx, %r8
1454ffa9a:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ffaa0:     	cmpq	%rdx, 0x88(%rax,%rcx)
1454ffaa8:     	jne	0x1454ffa90 <.text+0x54fea90>
1454ffaaa:     	cmpl	$0x1, 0x68(%rax,%rcx)
1454ffaaf:     	je	0x1454ffa90 <.text+0x54fea90>
1454ffab1:     	addss	%xmm0, %xmm6
1454ffab5:     	movss	%xmm1, 0xa0(%rax,%rcx)
1454ffabe:     	movss	%xmm6, 0xa4(%rax,%rcx)
1454ffac7:     	movss	%xmm0, 0x138(%rax,%rcx)
1454ffad0:     	testl	%edi, %edi
1454ffad2:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ffad8:     	movl	0x134(%rax,%rcx), %r8d
1454ffae0:     	cmpl	%edi, %r8d
1454ffae3:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ffae9:     	movl	%edi, 0x134(%rax,%rcx)
1454ffaf0:     	testl	%r8d, %r8d
1454ffaf3:     	je	0x1454ffb06 <.text+0x54feb06>
1454ffaf5:     	movq	%rsi, %rcx
1454ffaf8:     	movq	%rdx, %rbx
1454ffafb:     	xorl	%r9d, %r9d
1454ffafe:     	callq	0x1454e3550 <.text+0x54e2550>
1454ffb03:     	movq	%rbx, %rdx
1454ffb06:     	movq	%rsi, %rcx
1454ffb09:     	jmp	0x145500270 <.text+0x54ff270>
1454ffb0e:     	mulss	0x4(%r8), %xmm3
1454ffb14:     	leaq	-0x38(%rbp), %rcx
1454ffb18:     	movq	%rsi, %rdx
1454ffb1b:     	movl	%edi, %r8d
1454ffb1e:     	movaps	%xmm3, %xmm7
1454ffb21:     	callq	0x1454a0520 <.text+0x549f520>
1454ffb26:     	movss	0x418(%rsi), %xmm0
1454ffb2e:     	addss	%xmm0, %xmm7
1454ffb32:     	movaps	%xmm7, %xmm1
1454ffb35:     	minss	0x470(%rsi), %xmm1
1454ffb3d:     	movaps	%xmm1, %xmm6
1454ffb40:     	cmpunordss	%xmm1, %xmm6
1454ffb45:     	andps	%xmm6, %xmm7
1454ffb48:     	andnps	%xmm1, %xmm6
1454ffb4b:     	orps	%xmm7, %xmm6
1454ffb4e:     	movss	%xmm6, 0x418(%rsi)
1454ffb56:     	subss	%xmm0, %xmm6
1454ffb5a:     	xorps	%xmm0, %xmm0
1454ffb5d:     	ucomiss	%xmm6, %xmm0
1454ffb60:     	movq	-0x38(%rbp), %rdx
1454ffb64:     	jae	0x1454ffe3f <.text+0x54fee3f>
1454ffb6a:     	cmpq	$-0x2, %rdx
1454ffb6e:     	jne	0x1454fff3b <.text+0x54fef3b>
1454ffb74:     	leaq	0x14f6edd(%rip), %rdi   # 0x1469f6a58
1454ffb7b:     	movl	$0x5, %ebx
1454ffb80:     	movl	$0x5, %edx
1454ffb85:     	movq	%rdi, %rcx
1454ffb88:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ffb8d:     	testq	%rax, %rax
1454ffb90:     	cmoveq	%rdi, %rax
1454ffb94:     	cmoveq	%rbx, %rdx
1454ffb98:     	movq	%rax, 0x10(%rbp)
1454ffb9c:     	movq	%rdx, 0x18(%rbp)
1454ffba0:     	leaq	0x14f6eb6(%rip), %rax   # 0x1469f6a5d
1454ffba7:     	movq	%rax, 0x20(%rbp)
1454ffbab:     	movq	$0x18, 0x28(%rbp)
1454ffbb3:     	movb	$0x0, 0x30(%rbp)
1454ffbb7:     	movq	$-0x1, %rdx
1454ffbbe:     	jmp	0x1454fff53 <.text+0x54fef53>
1454ffbc3:     	movss	0x418(%rsi), %xmm1
1454ffbcb:     	movss	0x470(%rsi), %xmm6
1454ffbd3:     	movss	0x4(%r8), %xmm2
1454ffbd9:     	mulss	%xmm6, %xmm2
1454ffbdd:     	addss	%xmm1, %xmm2
1454ffbe1:     	movaps	%xmm2, %xmm3
1454ffbe4:     	minss	%xmm6, %xmm3
1454ffbe8:     	movaps	%xmm3, %xmm0
1454ffbeb:     	cmpunordss	%xmm3, %xmm0
1454ffbf0:     	andps	%xmm0, %xmm2
1454ffbf3:     	andnps	%xmm3, %xmm0
1454ffbf6:     	orps	%xmm2, %xmm0
1454ffbf9:     	movss	%xmm0, 0x418(%rsi)
1454ffc01:     	movaps	%xmm0, %xmm8
1454ffc05:     	subss	%xmm1, %xmm8
1454ffc0a:     	xorps	%xmm7, %xmm7
1454ffc0d:     	ucomiss	%xmm8, %xmm7
1454ffc11:     	jae	0x1454ffc86 <.text+0x54fec86>
1454ffc13:     	leaq	0x14f6e3e(%rip), %rdi   # 0x1469f6a58
1454ffc1a:     	movl	$0x5, %ebx
1454ffc1f:     	movl	$0x5, %edx
1454ffc24:     	movq	%rdi, %rcx
1454ffc27:     	callq	0x145457cb0 <.text+0x5456cb0>
1454ffc2c:     	testq	%rax, %rax
1454ffc2f:     	cmoveq	%rdi, %rax
1454ffc33:     	cmoveq	%rbx, %rdx
1454ffc37:     	movq	$-0x1, 0x8(%rbp)
1454ffc3f:     	movq	%rax, 0x10(%rbp)
1454ffc43:     	movq	%rdx, 0x18(%rbp)
1454ffc47:     	leaq	0x14f6e0f(%rip), %rax   # 0x1469f6a5d
1454ffc4e:     	movq	%rax, 0x20(%rbp)
1454ffc52:     	movq	$0x18, 0x28(%rbp)
1454ffc5a:     	movb	$0x0, 0x30(%rbp)
1454ffc5e:     	leaq	0x5f8(%rsi), %rcx
1454ffc65:     	xorps	%xmm2, %xmm2
1454ffc68:     	cvtss2sd	%xmm8, %xmm2
1454ffc6d:     	leaq	0x8(%rbp), %rdx
1454ffc71:     	callq	0x1455021b0 <.text+0x55011b0>
1454ffc76:     	movss	0x418(%rsi), %xmm0
1454ffc7e:     	movss	0x470(%rsi), %xmm6
1454ffc86:     	maxss	%xmm7, %xmm0
1454ffc8a:     	callq	0x14577327d <.text+0x577227d>
1454ffc8f:     	cvttss2si	%xmm0, %rbx
1454ffc94:     	xorl	%r14d, %r14d
1454ffc97:     	ucomiss	%xmm7, %xmm0
1454ffc9a:     	cmovbl	%r14d, %ebx
1454ffc9e:     	movss	0x407885(%rip), %xmm8   # 0x14590752c
1454ffca7:     	ucomiss	%xmm8, %xmm0
1454ffcab:     	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
1454ffcb1:     	cmoval	%r15d, %ebx
1454ffcb5:     	movaps	%xmm6, %xmm0
1454ffcb8:     	callq	0x14577327d <.text+0x577227d>
1454ffcbd:     	cvttss2si	%xmm0, %rdi
1454ffcc2:     	ucomiss	%xmm7, %xmm0
1454ffcc5:     	cmovbl	%r14d, %edi
1454ffcc9:     	ucomiss	%xmm8, %xmm0
1454ffccd:     	cmoval	%r15d, %edi
1454ffcd1:     	leaq	0x8d8(%rsi), %r14
1454ffcd8:     	movq	0x8d8(%rsi), %rax
1454ffcdf:     	testq	%rax, %rax
1454ffce2:     	je	0x1454ffe66 <.text+0x54fee66>
1454ffce8:     	movq	0x8e0(%rsi), %rcx
1454ffcef:     	movw	$0x16, %dx
1454ffcf3:     	movzwl	0x36(%rax), %r9d
1454ffcf8:     	movl	%r9d, %r10d
1454ffcfb:     	addl	%r10d, %r10d
1454ffcfe:     	movq	$-0x1, %r8
1454ffd05:     	nopw	%cs:(%rax,%rax)
1454ffd10:     	testq	%r10, %r10
1454ffd13:     	je	0x1454ffd3f <.text+0x54fed3f>
1454ffd15:     	cmpw	0x3a(%rax,%r8,2), %dx
1454ffd1b:     	seta	%r11b
1454ffd1f:     	sbbb	$0x0, %r11b
1454ffd23:     	incq	%r8
1454ffd26:     	addq	$-0x2, %r10
1454ffd2a:     	cmpb	$0x1, %r11b
1454ffd2e:     	je	0x1454ffd10 <.text+0x54fed10>
1454ffd30:     	movzbl	%r11b, %r9d
1454ffd34:     	testl	%r9d, %r9d
1454ffd37:     	je	0x1454ffdc8 <.text+0x54fedc8>
1454ffd3d:     	jmp	0x1454ffd42 <.text+0x54fed42>
1454ffd3f:     	movq	%r9, %r8
1454ffd42:     	subq	$0x1, %rcx
1454ffd46:     	jb	0x1454ffe68 <.text+0x54fee68>
1454ffd4c:     	movq	0x50(%rax,%r8,8), %rax
1454ffd51:     	jmp	0x1454ffcf3 <.text+0x54fecf3>
1454ffd53:     	movq	0x4e8(%rsi), %rcx
1454ffd5a:     	testq	%rcx, %rcx
1454ffd5d:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ffd63:     	movss	0x4(%r8), %xmm0
1454ffd69:     	movq	0x4e0(%rsi), %rax
1454ffd70:     	imulq	$0x160, %rcx, %r8       # imm = 0x160
1454ffd77:     	xorl	%ecx, %ecx
1454ffd79:     	jmp	0x1454ffd90 <.text+0x54fed90>
1454ffd7b:     	nopl	(%rax,%rax)
1454ffd80:     	addq	$0x160, %rcx            # imm = 0x160
1454ffd87:     	cmpq	%rcx, %r8
1454ffd8a:     	je	0x1454ff8b0 <.text+0x54fe8b0>
1454ffd90:     	cmpq	%rdx, 0x88(%rax,%rcx)
1454ffd98:     	jne	0x1454ffd80 <.text+0x54fed80>
1454ffd9a:     	cmpl	$0x1, 0x68(%rax,%rcx)
1454ffd9f:     	je	0x1454ffd80 <.text+0x54fed80>
1454ffda1:     	cmpq	$-0x1, 0x18(%rax,%rcx)
1454ffda7:     	jne	0x1454ff8b0 <.text+0x54fe8b0>
1454ffdad:     	addss	%xmm6, %xmm0
1454ffdb1:     	movss	%xmm0, 0x150(%rax,%rcx)
1454ffdba:     	movss	%xmm6, 0x12c(%rax,%rcx)
1454ffdc3:     	jmp	0x1454ff8b0 <.text+0x54fe8b0>
1454ffdc8:     	movl	%ebx, 0x8(%rax,%r8,4)
1454ffdcd:     	movq	(%r14), %rax
1454ffdd0:     	testq	%rax, %rax
1454ffdd3:     	je	0x1454ffea0 <.text+0x54feea0>
1454ffdd9:     	movq	0x8e0(%rsi), %rcx
1454ffde0:     	movw	$0x1c, %dx
1454ffde4:     	movzwl	0x36(%rax), %r9d
1454ffde9:     	movl	%r9d, %r10d
1454ffdec:     	addl	%r10d, %r10d
1454ffdef:     	movq	$-0x1, %r8
1454ffdf6:     	nopw	%cs:(%rax,%rax)
1454ffe00:     	testq	%r10, %r10
1454ffe03:     	je	0x1454ffe2f <.text+0x54fee2f>
1454ffe05:     	cmpw	0x3a(%rax,%r8,2), %dx
1454ffe0b:     	seta	%r11b
1454ffe0f:     	sbbb	$0x0, %r11b
1454ffe13:     	incq	%r8
1454ffe16:     	addq	$-0x2, %r10
1454ffe1a:     	cmpb	$0x1, %r11b
1454ffe1e:     	je	0x1454ffe00 <.text+0x54fee00>
1454ffe20:     	movzbl	%r11b, %r9d
1454ffe24:     	testl	%r9d, %r9d
1454ffe27:     	je	0x1455000ab <.text+0x54ff0ab>
1454ffe2d:     	jmp	0x1454ffe32 <.text+0x54fee32>
1454ffe2f:     	movq	%r9, %r8
1454ffe32:     	subq	$0x1, %rcx
1454ffe36:     	jb	0x1454ffea2 <.text+0x54feea2>
1454ffe38:     	movq	0x50(%rax,%r8,8), %rax
1454ffe3d:     	jmp	0x1454ffde4 <.text+0x54fede4>
1454ffe3f:     	cmpq	$-0x3, %rdx
1454ffe43:     	ja	0x1454fff6b <.text+0x54fef6b>
1454ffe49:     	testq	%rdx, %rdx
1454ffe4c:     	je	0x1454fff6b <.text+0x54fef6b>
1454ffe52:     	movq	-0x30(%rbp), %rcx
1454ffe56:     	movl	$0x1, %r8d
1454ffe5c:     	callq	0x1400021d0 <.text+0x11d0>
1454ffe61:     	jmp	0x1454fff6b <.text+0x54fef6b>
1454ffe66:     	xorl	%eax, %eax
1454ffe68:     	movq	%r14, 0x8(%rbp)
1454ffe6c:     	movq	%rax, 0x10(%rbp)
1454ffe70:     	movq	$0x0, 0x18(%rbp)
1454ffe78:     	movq	%r8, 0x20(%rbp)
1454ffe7c:     	movq	$0x16, 0x28(%rbp)
1454ffe84:     	leaq	-0x38(%rbp), %rcx
1454ffe88:     	leaq	0x8(%rbp), %rdx
1454ffe8c:     	movl	%ebx, %r8d
1454ffe8f:     	callq	0x14552a730 <.text+0x5529730>
1454ffe94:     	movq	(%r14), %rax
1454ffe97:     	testq	%rax, %rax
1454ffe9a:     	jne	0x1454ffdd9 <.text+0x54fedd9>
1454ffea0:     	xorl	%eax, %eax
1454ffea2:     	movq	%r14, 0x8(%rbp)
1454ffea6:     	movq	%rax, 0x10(%rbp)
1454ffeaa:     	movq	$0x0, 0x18(%rbp)
1454ffeb2:     	movq	%r8, 0x20(%rbp)
1454ffeb6:     	movq	$0x1c, 0x28(%rbp)
1454ffebe:     	leaq	-0x38(%rbp), %rcx
1454ffec2:     	jmp	0x145500111 <.text+0x54ff111>
1454ffec7:     	cmpq	0x308(%rsi), %rbx
1454ffece:     	jne	0x1454ffee9 <.text+0x54feee9>
1454ffed0:     	leaq	0x308(%rsi), %rcx
1454ffed7:     	movq	%r8, %r14
1454ffeda:     	callq	0x14577ffc0 <.text+0x577efc0>
1454ffedf:     	movq	%r14, %r8
1454ffee2:     	movq	0x310(%rsi), %rax
1454ffee9:     	leaq	(%rbx,%rbx,2), %rcx
1454ffeed:     	movl	0x8(%r8), %edx
1454ffef1:     	movl	%edx, 0x8(%rax,%rcx,8)
1454ffef5:     	movq	(%r8), %rdx
1454ffef8:     	movq	%rdx, (%rax,%rcx,8)
1454ffefc:     	movl	%edi, 0xc(%rax,%rcx,8)
1454fff00:     	movss	0x43fe38(%rip), %xmm0   # 0x14593fd40
1454fff08:     	movlps	%xmm0, 0x10(%rax,%rcx,8)
1454fff0d:     	incq	%rbx
1454fff10:     	movq	%rbx, 0x318(%rsi)
1454fff17:     	movq	%rsi, %rcx
1454fff1a:     	movaps	0x40(%rbp), %xmm6
1454fff1e:     	movaps	0x50(%rbp), %xmm7
1454fff22:     	movaps	0x60(%rbp), %xmm8
1454fff27:     	addq	$0xf8, %rsp
1454fff2e:     	popq	%rbx
1454fff2f:     	popq	%rdi
1454fff30:     	popq	%rsi
1454fff31:     	popq	%r14
1454fff33:     	popq	%r15
1454fff35:     	popq	%rbp
1454fff36:     	jmp	0x14549e650 <.text+0x549d650>
1454fff3b:     	movq	-0x10(%rbp), %rax
1454fff3f:     	movq	%rax, 0x30(%rbp)
1454fff43:     	movups	-0x30(%rbp), %xmm0
1454fff47:     	movups	-0x20(%rbp), %xmm1
1454fff4b:     	movups	%xmm1, 0x20(%rbp)
1454fff4f:     	movups	%xmm0, 0x10(%rbp)
1454fff53:     	movq	%rdx, 0x8(%rbp)
1454fff57:     	leaq	0x5f8(%rsi), %rcx
1454fff5e:     	cvtss2sd	%xmm6, %xmm2
1454fff62:     	leaq	0x8(%rbp), %rdx
1454fff66:     	callq	0x1455021b0 <.text+0x55011b0>
1454fff6b:     	movss	0x418(%rsi), %xmm0
1454fff73:     	movss	0x470(%rsi), %xmm6
1454fff7b:     	xorps	%xmm7, %xmm7
1454fff7e:     	maxss	%xmm7, %xmm0
1454fff82:     	callq	0x14577327d <.text+0x577227d>
1454fff87:     	cvttss2si	%xmm0, %rbx
1454fff8c:     	xorl	%r14d, %r14d
1454fff8f:     	ucomiss	%xmm7, %xmm0
1454fff92:     	cmovbl	%r14d, %ebx
1454fff96:     	movss	0x40758d(%rip), %xmm8   # 0x14590752c
1454fff9f:     	ucomiss	%xmm8, %xmm0
1454fffa3:     	movl	$0xffffffff, %r15d      # imm = 0xFFFFFFFF
1454fffa9:     	cmoval	%r15d, %ebx
1454fffad:     	movaps	%xmm6, %xmm0
1454fffb0:     	callq	0x14577327d <.text+0x577227d>
1454fffb5:     	cvttss2si	%xmm0, %rdi
1454fffba:     	ucomiss	%xmm7, %xmm0
1454fffbd:     	cmovbl	%r14d, %edi
1454fffc1:     	ucomiss	%xmm8, %xmm0
1454fffc5:     	cmoval	%r15d, %edi
1454fffc9:     	leaq	0x8d8(%rsi), %r14
1454fffd0:     	movq	0x8d8(%rsi), %rax
1454fffd7:     	testq	%rax, %rax
1454fffda:     	je	0x1455000b5 <.text+0x54ff0b5>
1454fffe0:     	movq	0x8e0(%rsi), %rcx
1454fffe7:     	movw	$0x16, %dx
1454fffeb:     	movzwl	0x36(%rax), %r9d
1454ffff0:     	movl	%r9d, %r10d
1454ffff3:     	addl	%r10d, %r10d
1454ffff6:     	movq	$-0x1, %r8
1454ffffd:     	nopl	(%rax)
145500000:     	testq	%r10, %r10
145500003:     	je	0x14550002b <.text+0x54ff02b>
145500005:     	cmpw	0x3a(%rax,%r8,2), %dx
14550000b:     	seta	%r11b
14550000f:     	sbbb	$0x0, %r11b
145500013:     	incq	%r8
145500016:     	addq	$-0x2, %r10
14550001a:     	cmpb	$0x1, %r11b
14550001e:     	je	0x145500000 <.text+0x54ff000>
145500020:     	movzbl	%r11b, %r9d
145500024:     	testl	%r9d, %r9d
145500027:     	je	0x14550003f <.text+0x54ff03f>
145500029:     	jmp	0x14550002e <.text+0x54ff02e>
14550002b:     	movq	%r9, %r8
14550002e:     	subq	$0x1, %rcx
145500032:     	jb	0x1455000b7 <.text+0x54ff0b7>
145500038:     	movq	0x50(%rax,%r8,8), %rax
14550003d:     	jmp	0x1454fffeb <.text+0x54fefeb>
14550003f:     	movl	%ebx, 0x8(%rax,%r8,4)
145500044:     	movq	(%r14), %rax
145500047:     	testq	%rax, %rax
14550004a:     	je	0x1455000ef <.text+0x54ff0ef>
145500050:     	movq	0x8e0(%rsi), %rcx
145500057:     	movw	$0x1c, %dx
14550005b:     	movzwl	0x36(%rax), %r9d
145500060:     	movl	%r9d, %r10d
145500063:     	addl	%r10d, %r10d
145500066:     	movq	$-0x1, %r8
14550006d:     	nopl	(%rax)
145500070:     	testq	%r10, %r10
145500073:     	je	0x14550009b <.text+0x54ff09b>
145500075:     	cmpw	0x3a(%rax,%r8,2), %dx
14550007b:     	seta	%r11b
14550007f:     	sbbb	$0x0, %r11b
145500083:     	incq	%r8
145500086:     	addq	$-0x2, %r10
14550008a:     	cmpb	$0x1, %r11b
14550008e:     	je	0x145500070 <.text+0x54ff070>
145500090:     	movzbl	%r11b, %r9d
145500094:     	testl	%r9d, %r9d
145500097:     	je	0x1455000ab <.text+0x54ff0ab>
145500099:     	jmp	0x14550009e <.text+0x54ff09e>
14550009b:     	movq	%r9, %r8
14550009e:     	subq	$0x1, %rcx
1455000a2:     	jb	0x1455000f1 <.text+0x54ff0f1>
1455000a4:     	movq	0x50(%rax,%r8,8), %rax
1455000a9:     	jmp	0x14550005b <.text+0x54ff05b>
1455000ab:     	movl	%edi, 0x8(%rax,%r8,4)
1455000b0:     	jmp	0x1454ff8b0 <.text+0x54fe8b0>
1455000b5:     	xorl	%eax, %eax
1455000b7:     	movq	%r14, 0x8(%rbp)
1455000bb:     	movq	%rax, 0x10(%rbp)
1455000bf:     	movq	$0x0, 0x18(%rbp)
1455000c7:     	movq	%r8, 0x20(%rbp)
1455000cb:     	movq	$0x16, 0x28(%rbp)
1455000d3:     	leaq	-0x58(%rbp), %rcx
1455000d7:     	leaq	0x8(%rbp), %rdx
1455000db:     	movl	%ebx, %r8d
1455000de:     	callq	0x14552a730 <.text+0x5529730>
1455000e3:     	movq	(%r14), %rax
1455000e6:     	testq	%rax, %rax
1455000e9:     	jne	0x145500050 <.text+0x54ff050>
1455000ef:     	xorl	%eax, %eax
1455000f1:     	movq	%r14, 0x8(%rbp)
1455000f5:     	movq	%rax, 0x10(%rbp)
1455000f9:     	movq	$0x0, 0x18(%rbp)
145500101:     	movq	%r8, 0x20(%rbp)
145500105:     	movq	$0x1c, 0x28(%rbp)
14550010d:     	leaq	-0x58(%rbp), %rcx
145500111:     	leaq	0x8(%rbp), %rdx
145500115:     	movl	%edi, %r8d
145500118:     	callq	0x14552a730 <.text+0x5529730>
14550011d:     	jmp	0x1454ff8b0 <.text+0x54fe8b0>
145500122:     	movss	0x14c(%rbx), %xmm2
14550012a:     	ucomiss	%xmm6, %xmm2
14550012d:     	ja	0x1454ff8b0 <.text+0x54fe8b0>
145500133:     	movss	%xmm6, 0x148(%rbx)
14550013b:     	movaps	%xmm6, %xmm2
14550013e:     	xorl	%eax, %eax
145500140:     	cmpq	$-0x1, 0x18(%rbx)
145500145:     	sete	%al
145500148:     	leaq	0x43ff31(%rip), %rcx    # 0x145940080
14550014f:     	mulss	(%rcx,%rax,4), %xmm0
145500154:     	addss	%xmm6, %xmm0
145500158:     	addss	0x41319c(%rip), %xmm2   # 0x1459132fc
145500160:     	movaps	%xmm0, %xmm3
145500163:     	minss	%xmm2, %xmm3
145500167:     	movaps	%xmm3, %xmm2
14550016a:     	cmpunordss	%xmm3, %xmm2
14550016f:     	andps	%xmm2, %xmm0
145500172:     	andnps	%xmm3, %xmm2
145500175:     	orps	%xmm0, %xmm2
145500178:     	ucomiss	%xmm2, %xmm1
14550017b:     	jae	0x1454ff8b0 <.text+0x54fe8b0>
145500181:     	movq	%rdx, %r14
145500184:     	movss	%xmm2, 0x144(%rbx)
14550018c:     	movq	0x898(%rsi), %r15
145500193:     	addq	$0x10, %r15
145500197:     	leaq	0x8(%rbp), %rcx
14550019b:     	movq	%rbx, %rdx
14550019e:     	movaps	%xmm6, %xmm2
1455001a1:     	callq	0x145450a50 <.text+0x544fa50>
1455001a6:     	movsd	0x8(%rbp), %xmm7
1455001ab:     	movshdup	%xmm7, %xmm2            # xmm2 = xmm7[1,1,3,3]
1455001af:     	movq	%r15, %rcx
1455001b2:     	movaps	%xmm7, %xmm1
1455001b5:     	callq	0x14552a140 <.text+0x5529140>
1455001ba:     	testb	$0x1, %al
1455001bc:     	jne	0x1455001c3 <.text+0x54ff1c3>
1455001be:     	movss	0x10(%rbp), %xmm0
1455001c3:     	movsd	%xmm7, -0x8(%rbp)
1455001c8:     	movss	%xmm0, (%rbp)
1455001cd:     	movl	(%rbp), %eax
1455001d0:     	movl	%eax, 0x114(%rbx)
1455001d6:     	movq	-0x8(%rbp), %rax
1455001da:     	movq	%rax, 0x10c(%rbx)
1455001e1:     	movq	-0x8(%rbp), %rax
1455001e5:     	movq	%rax, 0x118(%rbx)
1455001ec:     	movl	(%rbp), %eax
1455001ef:     	movl	%eax, 0x120(%rbx)
1455001f5:     	xorps	%xmm0, %xmm0
1455001f8:     	movss	%xmm6, %xmm0            # xmm0 = xmm6[0],xmm0[1,2,3]
1455001fc:     	movlps	%xmm0, 0x124(%rbx)
145500203:     	movl	0x958(%rsi), %r9d
14550020a:     	incl	%r9d
14550020d:     	movl	%r9d, 0x958(%rsi)
145500214:     	leaq	0x8(%rbp), %rcx
145500218:     	leaq	-0x8(%rbp), %r8
14550021c:     	movq	%r14, %rdx
14550021f:     	callq	0x14545ff20 <.text+0x545ef20>
145500224:     	movq	0x560(%rsi), %rbx
14550022b:     	cmpq	0x550(%rsi), %rbx
145500232:     	jne	0x145500241 <.text+0x54ff241>
145500234:     	leaq	0x550(%rsi), %rcx
14550023b:     	callq	0x145774710 <.text+0x5773710>
145500240:     	nop
145500241:     	movq	0x558(%rsi), %rax
145500248:     	movq	%rbx, %rcx
14550024b:     	shlq	$0x5, %rcx
14550024f:     	movups	0x8(%rbp), %xmm0
145500253:     	movups	0x18(%rbp), %xmm1
145500257:     	movups	%xmm1, 0x10(%rax,%rcx)
14550025c:     	movups	%xmm0, (%rax,%rcx)
145500260:     	incq	%rbx
145500263:     	movq	%rbx, 0x560(%rsi)
14550026a:     	movq	%rsi, %rcx
14550026d:     	movq	%r14, %rdx
145500270:     	movl	%edi, %r8d
145500273:     	movb	$0x1, %r9b
145500276:     	movaps	0x40(%rbp), %xmm6
14550027a:     	movaps	0x50(%rbp), %xmm7
14550027e:     	movaps	0x60(%rbp), %xmm8
145500283:     	addq	$0xf8, %rsp
14550028a:     	popq	%rbx
14550028b:     	popq	%rdi
14550028c:     	popq	%rsi
14550028d:     	popq	%r14
14550028f:     	popq	%r15
145500291:     	popq	%rbp
145500292:     	jmp	0x1454e3550 <.text+0x54e2550>
