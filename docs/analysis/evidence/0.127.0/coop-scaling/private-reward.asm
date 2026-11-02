145be27f3:     	xorl	%ecx, %ecx
145be27f5:     	cmpl	$0x3, %eax
145be27f8:     	setb	%cl
145be27fb:     	movq	0xc88(%rbx), %rax
145be2802:     	decq	%rax
145be2805:     	js	0x145be2818 <.text+0x5be1818>
145be2807:     	cvtsi2ss	%rax, %xmm0
145be280c:     	jmp	0x145be282d <.text+0x5be182d>
145be280e:     	movss	0x6506aa(%rip), %xmm1   # 0x146232ec0
145be2816:     	jmp	0x145be2851 <.text+0x5be1851>
145be2818:     	movq	%rax, %rdx
145be281b:     	shrq	%rdx
145be281e:     	andl	$0x1, %eax
145be2821:     	orq	%rdx, %rax
145be2824:     	cvtsi2ss	%rax, %xmm0
145be2829:     	addss	%xmm0, %xmm0
145be282d:     	leaq	0x14a36d4(%rip), %rax   # 0x147085f08
145be2834:     	mulss	(%rax,%rcx,4), %xmm0
145be2839:     	mulss	0x14a36cf(%rip), %xmm0  # 0x147085f10
145be2841:     	movss	0x650677(%rip), %xmm1   # 0x146232ec0
145be2849:     	addss	%xmm1, %xmm0
145be284d:     	divss	%xmm0, %xmm1
