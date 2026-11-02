145c9dcf4:     	xorl	%ecx, %ecx
145c9dcf6:     	cmpl	$0x3, %eax
145c9dcf9:     	setb	%cl
145c9dcfc:     	movq	0xc88(%rsi), %rax
145c9dd03:     	decq	%rax
145c9dd06:     	js	0x145c9dd12 <.text+0x5c9cd12>
145c9dd08:     	xorps	%xmm7, %xmm7
145c9dd0b:     	cvtsi2ss	%rax, %xmm7
145c9dd10:     	jmp	0x145c9dd2a <.text+0x5c9cd2a>
145c9dd12:     	movq	%rax, %rdx
145c9dd15:     	shrq	%rdx
145c9dd18:     	andl	$0x1, %eax
145c9dd1b:     	orq	%rdx, %rax
145c9dd1e:     	xorps	%xmm7, %xmm7
145c9dd21:     	cvtsi2ss	%rax, %xmm7
145c9dd26:     	addss	%xmm7, %xmm7
145c9dd2a:     	leaq	0x13e81d7(%rip), %rax   # 0x147085f08
145c9dd31:     	mulss	(%rax,%rcx,4), %xmm7
145c9dd36:     	mulss	0x1740062(%rip), %xmm7  # 0x1473ddda0
145c9dd3e:     	addss	0x59517a(%rip), %xmm7   # 0x146232ec0
145c9dd46:     	xorl	%eax, %eax
145c9dd48:     	cmpq	$0x0, 0xa58(%rsi)
145c9dd50:     	sete	%al
145c9dd53:     	leaq	0x173fe16(%rip), %rcx   # 0x1473ddb70
145c9dd5a:     	mulss	(%rcx,%rax,4), %xmm7
