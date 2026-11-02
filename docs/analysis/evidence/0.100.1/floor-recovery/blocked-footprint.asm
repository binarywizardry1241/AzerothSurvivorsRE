
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1455257a0:     	pushq	%r14
1455257a2:     	pushq	%rsi
1455257a3:     	pushq	%rdi
1455257a4:     	pushq	%rbx
1455257a5:     	subq	$0x58, %rsp
1455257a9:     	movaps	%xmm8, 0x40(%rsp)
1455257af:     	movaps	%xmm7, 0x30(%rsp)
1455257b4:     	movaps	%xmm6, 0x20(%rsp)
1455257b9:     	movq	%rcx, %rax
1455257bc:     	movss	0x20(%rcx), %xmm0
1455257c1:     	movss	0x3e1d43(%rip), %xmm4   # 0x14590750c
1455257c9:     	addss	%xmm1, %xmm4
1455257cd:     	subss	%xmm0, %xmm4
1455257d1:     	cvttss2si	%xmm4, %rdx
1455257d6:     	movq	%rdx, %r8
1455257d9:     	sarq	$0x3f, %r8
1455257dd:     	movss	0x3e19fb(%rip), %xmm6   # 0x1459071e0
1455257e5:     	movaps	%xmm4, %xmm3
1455257e8:     	subss	%xmm6, %xmm3
1455257ec:     	cvttss2si	%xmm3, %rcx
1455257f1:     	andq	%r8, %rcx
1455257f4:     	orq	%rdx, %rcx
1455257f7:     	xorl	%edx, %edx
1455257f9:     	xorps	%xmm5, %xmm5
1455257fc:     	ucomiss	%xmm5, %xmm4
1455257ff:     	cmovbq	%rdx, %rcx
145525803:     	movss	0x3e19d9(%rip), %xmm7   # 0x1459071e4
14552580b:     	ucomiss	%xmm7, %xmm4
14552580e:     	movq	$-0x1, %r9
145525815:     	cmovaq	%r9, %rcx
145525819:     	movaps	%xmm1, %xmm3
14552581c:     	addss	%xmm5, %xmm3
145525820:     	subss	%xmm0, %xmm3
145525824:     	cvttss2si	%xmm3, %r10
145525829:     	movq	%r10, %r11
14552582c:     	sarq	$0x3f, %r11
145525830:     	movaps	%xmm3, %xmm8
145525834:     	subss	%xmm6, %xmm8
145525839:     	cvttss2si	%xmm8, %r8
14552583e:     	andq	%r11, %r8
145525841:     	orq	%r10, %r8
145525844:     	ucomiss	%xmm5, %xmm3
145525847:     	cmovbq	%rdx, %r8
14552584b:     	ucomiss	%xmm7, %xmm3
14552584e:     	cmovaq	%r9, %r8
145525852:     	addss	0x3e1c36(%rip), %xmm1   # 0x145907490
14552585a:     	subss	%xmm0, %xmm1
14552585e:     	cvttss2si	%xmm1, %r10
145525863:     	movq	%r10, %rsi
145525866:     	sarq	$0x3f, %rsi
14552586a:     	movaps	%xmm1, %xmm0
14552586d:     	subss	%xmm6, %xmm0
145525871:     	cvttss2si	%xmm0, %r11
145525876:     	andq	%rsi, %r11
145525879:     	orq	%r10, %r11
14552587c:     	ucomiss	%xmm5, %xmm1
14552587f:     	cmovbq	%rdx, %r11
145525883:     	ucomiss	%xmm7, %xmm1
145525886:     	cmovaq	%r9, %r11
14552588a:     	movss	0x24(%rax), %xmm0
14552588f:     	ucomiss	%xmm4, %xmm5
145525892:     	jbe	0x1455258a1 <.text+0x55248a1>
145525894:     	addss	0x3e1c70(%rip), %xmm2   # 0x14590750c
14552589c:     	ucomiss	%xmm2, %xmm0
14552589f:     	jmp	0x14552590d <.text+0x552490d>
1455258a1:     	movq	0x18(%rax), %r9
1455258a5:     	movss	0x3e1c5f(%rip), %xmm4   # 0x14590750c
1455258ad:     	addss	%xmm2, %xmm4
1455258b1:     	cmpq	%r9, %rcx
1455258b4:     	jae	0x14552590a <.text+0x552490a>
1455258b6:     	subss	%xmm0, %xmm4
1455258ba:     	cvttss2si	%xmm4, %rdx
1455258bf:     	movq	%rdx, %r10
1455258c2:     	sarq	$0x3f, %r10
1455258c6:     	movaps	%xmm4, %xmm5
1455258c9:     	subss	0x3e190f(%rip), %xmm5   # 0x1459071e0
1455258d1:     	cvttss2si	%xmm5, %rsi
1455258d6:     	andq	%r10, %rsi
1455258d9:     	orq	%rdx, %rsi
1455258dc:     	xorl	%edx, %edx
1455258de:     	xorps	%xmm5, %xmm5
1455258e1:     	ucomiss	%xmm5, %xmm4
1455258e4:     	cmovaeq	%rsi, %rdx
1455258e8:     	ucomiss	0x3e18f5(%rip), %xmm4   # 0x1459071e4
1455258ef:     	movq	$-0x1, %r10
1455258f6:     	cmovbeq	%rdx, %r10
1455258fa:     	movq	0x10(%rax), %rdx
1455258fe:     	ucomiss	%xmm3, %xmm5
145525901:     	jbe	0x145525929 <.text+0x5524929>
145525903:     	ucomiss	%xmm4, %xmm5
145525906:     	ja	0x14552590d <.text+0x552490d>
145525908:     	jmp	0x14552594c <.text+0x552494c>
14552590a:     	ucomiss	%xmm4, %xmm0
14552590d:     	xorl	%eax, %eax
14552590f:     	movaps	0x20(%rsp), %xmm6
145525914:     	movaps	0x30(%rsp), %xmm7
145525919:     	movaps	0x40(%rsp), %xmm8
14552591f:     	addq	$0x58, %rsp
145525923:     	popq	%rbx
145525924:     	popq	%rdi
145525925:     	popq	%rsi
145525926:     	popq	%r14
145525928:     	retq
145525929:     	cmpq	%r9, %r8
14552592c:     	jae	0x145525944 <.text+0x5524944>
14552592e:     	movq	0x8(%rax), %rsi
145525932:     	xorps	%xmm3, %xmm3
145525935:     	ucomiss	%xmm1, %xmm3
145525938:     	jbe	0x145525962 <.text+0x5524962>
14552593a:     	ucomiss	%xmm4, %xmm3
14552593d:     	ja	0x14552590d <.text+0x552490d>
14552593f:     	jmp	0x145525b1b <.text+0x5524b1b>
145525944:     	xorps	%xmm0, %xmm0
145525947:     	ucomiss	%xmm4, %xmm0
14552594a:     	ja	0x14552590d <.text+0x552490d>
14552594c:     	cmpq	%r9, %r10
14552594f:     	jae	0x14552590d <.text+0x552490d>
145525951:     	imulq	%r10, %r9
145525955:     	addq	%r9, %rcx
145525958:     	cmpq	%rdx, %rcx
14552595b:     	jb	0x14552590d <.text+0x552490d>
14552595d:     	jmp	0x145525b4b <.text+0x5524b4b>
145525962:     	cmpq	%r9, %r11
145525965:     	jae	0x145525b0f <.text+0x5524b0f>
14552596b:     	xorps	%xmm1, %xmm1
14552596e:     	ucomiss	%xmm4, %xmm1
145525971:     	ja	0x14552590d <.text+0x552490d>
145525973:     	cmpq	%r9, %r10
145525976:     	jae	0x14552590d <.text+0x552490d>
145525978:     	imulq	%r9, %r10
14552597c:     	leaq	(%r10,%rcx), %rax
145525980:     	cmpq	%rdx, %rax
145525983:     	jae	0x145525b59 <.text+0x5524b59>
145525989:     	cmpb	$0x1, (%rsi,%rax)
14552598d:     	jne	0x14552590d <.text+0x552490d>
145525993:     	leaq	(%r10,%r8), %rax
145525997:     	cmpq	%rdx, %rax
14552599a:     	jae	0x145525b6a <.text+0x5524b6a>
1455259a0:     	cmpb	$0x1, (%rsi,%rax)
1455259a4:     	jne	0x14552590d <.text+0x552490d>
1455259aa:     	addq	%r11, %r10
1455259ad:     	cmpq	%rdx, %r10
1455259b0:     	jae	0x145525b7b <.text+0x5524b7b>
1455259b6:     	cmpb	$0x1, (%rsi,%r10)
1455259bb:     	jne	0x14552590d <.text+0x552490d>
1455259c1:     	movaps	%xmm2, %xmm3
1455259c4:     	addss	%xmm1, %xmm3
1455259c8:     	subss	%xmm0, %xmm3
1455259cc:     	cvttss2si	%xmm3, %rax
1455259d1:     	movq	%rax, %r10
1455259d4:     	movaps	%xmm3, %xmm4
1455259d7:     	subss	0x3e1801(%rip), %xmm4   # 0x1459071e0
1455259df:     	cvttss2si	%xmm4, %rdi
1455259e4:     	sarq	$0x3f, %r10
1455259e8:     	andq	%r10, %rdi
1455259eb:     	orq	%rax, %rdi
1455259ee:     	xorl	%eax, %eax
1455259f0:     	ucomiss	%xmm1, %xmm3
1455259f3:     	cmovaeq	%rdi, %rax
1455259f7:     	ucomiss	0x3e17e6(%rip), %xmm3   # 0x1459071e4
1455259fe:     	movq	$-0x1, %r10
145525a05:     	cmovbeq	%rax, %r10
145525a09:     	ucomiss	%xmm3, %xmm1
145525a0c:     	ja	0x14552590d <.text+0x552490d>
145525a12:     	cmpq	%r9, %r10
145525a15:     	jae	0x14552590d <.text+0x552490d>
145525a1b:     	imulq	%r9, %r10
145525a1f:     	leaq	(%r10,%rcx), %rax
145525a23:     	cmpq	%rdx, %rax
145525a26:     	jae	0x145525b59 <.text+0x5524b59>
145525a2c:     	cmpb	$0x1, (%rsi,%rax)
145525a30:     	jne	0x14552590d <.text+0x552490d>
145525a36:     	leaq	(%r10,%r8), %rax
145525a3a:     	cmpq	%rdx, %rax
145525a3d:     	jae	0x145525b59 <.text+0x5524b59>
145525a43:     	cmpb	$0x1, (%rsi,%rax)
145525a47:     	jne	0x14552590d <.text+0x552490d>
145525a4d:     	addq	%r11, %r10
145525a50:     	cmpq	%rdx, %r10
145525a53:     	jae	0x145525b7b <.text+0x5524b7b>
145525a59:     	cmpb	$0x0, (%rsi,%r10)
145525a5e:     	je	0x14552590d <.text+0x552490d>
145525a64:     	addss	0x3e1a24(%rip), %xmm2   # 0x145907490
145525a6c:     	subss	%xmm0, %xmm2
145525a70:     	xorps	%xmm0, %xmm0
145525a73:     	ucomiss	%xmm2, %xmm0
145525a76:     	seta	%bl
145525a79:     	cvttss2si	%xmm2, %rax
145525a7e:     	movq	%rax, %r10
145525a81:     	movaps	%xmm2, %xmm1
145525a84:     	subss	0x3e1754(%rip), %xmm1   # 0x1459071e0
145525a8c:     	sarq	$0x3f, %r10
145525a90:     	cvttss2si	%xmm1, %rdi
145525a95:     	andq	%r10, %rdi
145525a98:     	orq	%rax, %rdi
145525a9b:     	xorl	%eax, %eax
145525a9d:     	ucomiss	%xmm0, %xmm2
145525aa0:     	movl	$0x0, %r14d
145525aa6:     	cmovaeq	%rdi, %r14
145525aaa:     	ucomiss	0x3e1733(%rip), %xmm2   # 0x1459071e4
145525ab1:     	movq	$-0x1, %r10
145525ab8:     	cmovbeq	%r14, %r10
145525abc:     	cmpq	%r9, %r10
145525abf:     	setae	%dil
145525ac3:     	orb	%bl, %dil
145525ac6:     	jne	0x14552590f <.text+0x552490f>
145525acc:     	imulq	%r10, %r9
145525ad0:     	addq	%r9, %rcx
145525ad3:     	cmpq	%rdx, %rcx
145525ad6:     	jae	0x145525b4b <.text+0x5524b4b>
145525ad8:     	cmpb	$0x1, (%rsi,%rcx)
145525adc:     	jne	0x14552590d <.text+0x552490d>
145525ae2:     	addq	%r9, %r8
145525ae5:     	cmpq	%rdx, %r8
145525ae8:     	jae	0x145525b8c <.text+0x5524b8c>
145525aee:     	cmpb	$0x1, (%rsi,%r8)
145525af3:     	jne	0x14552590d <.text+0x552490d>
145525af9:     	addq	%r11, %r9
145525afc:     	cmpq	%rdx, %r9
145525aff:     	jae	0x145525b9d <.text+0x5524b9d>
145525b05:     	movzbl	(%rsi,%r9), %eax
145525b0a:     	jmp	0x14552590f <.text+0x552490f>
145525b0f:     	xorps	%xmm0, %xmm0
145525b12:     	ucomiss	%xmm4, %xmm0
145525b15:     	ja	0x14552590d <.text+0x552490d>
145525b1b:     	cmpq	%r9, %r10
145525b1e:     	jae	0x14552590d <.text+0x552490d>
145525b24:     	imulq	%r10, %r9
145525b28:     	addq	%r9, %rcx
145525b2b:     	cmpq	%rdx, %rcx
145525b2e:     	jae	0x145525b4b <.text+0x5524b4b>
145525b30:     	xorl	%eax, %eax
145525b32:     	cmpb	$0x1, (%rsi,%rcx)
145525b36:     	jne	0x14552590f <.text+0x552490f>
145525b3c:     	addq	%r8, %r9
145525b3f:     	movq	%r9, %rcx
145525b42:     	cmpq	%rdx, %r9
145525b45:     	jb	0x14552590f <.text+0x552490f>
145525b4b:     	leaq	0x180f18e(%rip), %r8    # 0x146d34ce0
145525b52:     	callq	0x145903b33 <.text+0x5902b33>
145525b57:     	ud2
145525b59:     	movq	%rax, %rcx
145525b5c:     	leaq	0x180f17d(%rip), %r8    # 0x146d34ce0
145525b63:     	callq	0x145903b33 <.text+0x5902b33>
145525b68:     	ud2
145525b6a:     	movq	%rax, %rcx
145525b6d:     	leaq	0x180f16c(%rip), %r8    # 0x146d34ce0
145525b74:     	callq	0x145903b33 <.text+0x5902b33>
145525b79:     	ud2
145525b7b:     	leaq	0x180f15e(%rip), %r8    # 0x146d34ce0
145525b82:     	movq	%r10, %rcx
145525b85:     	callq	0x145903b33 <.text+0x5902b33>
145525b8a:     	ud2
145525b8c:     	movq	%r8, %rcx
145525b8f:     	leaq	0x180f14a(%rip), %r8    # 0x146d34ce0
145525b96:     	callq	0x145903b33 <.text+0x5902b33>
145525b9b:     	ud2
145525b9d:     	leaq	0x180f13c(%rip), %r8    # 0x146d34ce0
145525ba4:     	movq	%r9, %rcx
145525ba7:     	callq	0x145903b33 <.text+0x5902b33>
145525bac:     	ud2
