145c09d38:     	xorl	%ecx, %ecx
145c09d3a:     	cmpl	$0x3, %eax
145c09d3d:     	setb	%cl
145c09d40:     	movq	0xc88(%rsi), %rax
145c09d47:     	decq	%rax
145c09d4a:     	js	0x145c09d56 <.text+0x5c08d56>
145c09d4c:     	xorps	%xmm0, %xmm0
145c09d4f:     	cvtsi2ss	%rax, %xmm0
145c09d54:     	jmp	0x145c09d6e <.text+0x5c08d6e>
145c09d56:     	movq	%rax, %rdx
145c09d59:     	shrq	%rdx
145c09d5c:     	andl	$0x1, %eax
145c09d5f:     	orq	%rdx, %rax
145c09d62:     	xorps	%xmm0, %xmm0
145c09d65:     	cvtsi2ss	%rax, %xmm0
145c09d6a:     	addss	%xmm0, %xmm0
145c09d6e:     	leaq	0x147c193(%rip), %rax   # 0x147085f08
145c09d75:     	mulss	(%rax,%rcx,4), %xmm0
145c09d7a:     	xorl	%eax, %eax
145c09d7c:     	cmpq	$0x0, 0xa58(%rsi)
145c09d84:     	sete	%al
145c09d87:     	movsldup	%xmm0, %xmm0            # xmm0 = xmm0[0,0,2,2]
145c09d8b:     	mulps	0x17d3dce(%rip), %xmm0  # 0x1473ddb60
145c09d92:     	addps	0x629137(%rip), %xmm0   # 0x146232ed0
145c09d99:     	leaq	0x17d3dd0(%rip), %rcx   # 0x1473ddb70
145c09da0:     	movss	(%rcx,%rax,4), %xmm1
145c09da5:     	movsldup	%xmm1, %xmm7            # xmm7 = xmm1[0,0,2,2]
145c09da9:     	mulps	%xmm0, %xmm7
