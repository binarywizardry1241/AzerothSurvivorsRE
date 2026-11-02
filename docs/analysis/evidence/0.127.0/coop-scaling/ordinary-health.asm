145c31628:     	xorl	%ecx, %ecx
145c3162a:     	cmpl	$0x3, %eax
145c3162d:     	setb	%cl
145c31630:     	movq	0xc88(%rsi), %rax
145c31637:     	decq	%rax
145c3163a:     	js	0x145c31650 <.text+0x5c30650>
145c3163c:     	xorps	%xmm0, %xmm0
145c3163f:     	cvtsi2ss	%rax, %xmm0
145c31644:     	jmp	0x145c31668 <.text+0x5c30668>
145c31646:     	movss	0x601872(%rip), %xmm0   # 0x146232ec0
145c3164e:     	jmp	0x145c3169d <.text+0x5c3069d>
145c31650:     	movq	%rax, %rdx
145c31653:     	shrq	%rdx
145c31656:     	andl	$0x1, %eax
145c31659:     	orq	%rdx, %rax
145c3165c:     	xorps	%xmm0, %xmm0
145c3165f:     	cvtsi2ss	%rax, %xmm0
145c31664:     	addss	%xmm0, %xmm0
145c31668:     	leaq	0x1454899(%rip), %rax   # 0x147085f08
145c3166f:     	mulss	(%rax,%rcx,4), %xmm0
145c31674:     	mulss	0x17ac690(%rip), %xmm0  # 0x1473ddd0c
145c3167c:     	addss	0x60183c(%rip), %xmm0   # 0x146232ec0
145c31684:     	xorl	%eax, %eax
145c31686:     	cmpq	$0x0, 0xa58(%rsi)
145c3168e:     	sete	%al
145c31691:     	leaq	0x17ac4d8(%rip), %rcx   # 0x1473ddb70
145c31698:     	mulss	(%rcx,%rax,4), %xmm0
