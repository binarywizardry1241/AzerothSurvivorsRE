145c3138c:     	xorl	%ecx, %ecx
145c3138e:     	cmpl	$0x3, %eax
145c31391:     	setb	%cl
145c31394:     	movq	0xc88(%rsi), %rax
145c3139b:     	decq	%rax
145c3139e:     	js	0x145c313a7 <.text+0x5c303a7>
145c313a0:     	cvtsi2ss	%rax, %xmm0
145c313a5:     	jmp	0x145c313bc <.text+0x5c303bc>
145c313a7:     	movq	%rax, %rdx
145c313aa:     	shrq	%rdx
145c313ad:     	andl	$0x1, %eax
145c313b0:     	orq	%rdx, %rax
145c313b3:     	cvtsi2ss	%rax, %xmm0
145c313b8:     	addss	%xmm0, %xmm0
145c313bc:     	leaq	0x1454b45(%rip), %rax   # 0x147085f08
145c313c3:     	mulss	(%rax,%rcx,4), %xmm0
145c313c8:     	mulss	0x1454b40(%rip), %xmm0  # 0x147085f10
145c313d0:     	addss	0x601ae8(%rip), %xmm0   # 0x146232ec0
145c313d8:     	mulss	0x684930(%rip), %xmm0   # 0x1462b5d10
