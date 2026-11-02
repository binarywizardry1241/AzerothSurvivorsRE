145c475e0:     	xorl	%ecx, %ecx
145c475e2:     	cmpl	$0x3, %eax
145c475e5:     	setb	%cl
145c475e8:     	movq	0xc88(%r12), %rax
145c475f0:     	decq	%rax
145c475f3:     	js	0x145c475ff <.text+0x5c465ff>
145c475f5:     	xorps	%xmm0, %xmm0
145c475f8:     	cvtsi2ss	%rax, %xmm0
145c475fd:     	jmp	0x145c47617 <.text+0x5c46617>
145c475ff:     	movq	%rax, %rdx
145c47602:     	shrq	%rdx
145c47605:     	andl	$0x1, %eax
145c47608:     	orq	%rdx, %rax
145c4760b:     	xorps	%xmm0, %xmm0
145c4760e:     	cvtsi2ss	%rax, %xmm0
145c47613:     	addss	%xmm0, %xmm0
145c47617:     	leaq	0x143e8ea(%rip), %rax   # 0x147085f08
145c4761e:     	mulss	(%rax,%rcx,4), %xmm0
145c47623:     	mulss	0x143e8e5(%rip), %xmm0  # 0x147085f10
145c4762b:     	addss	0x5eb88d(%rip), %xmm0   # 0x146232ec0
