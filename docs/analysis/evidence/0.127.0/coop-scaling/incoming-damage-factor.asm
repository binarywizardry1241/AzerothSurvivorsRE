145c123d8:     	xorl	%ecx, %ecx
145c123da:     	cmpl	$0x3, %eax
145c123dd:     	setb	%cl
145c123e0:     	movq	0xc88(%r13), %rax
145c123e7:     	decq	%rax
145c123ea:     	js	0x145c123f3 <.text+0x5c113f3>
145c123ec:     	cvtsi2ss	%rax, %xmm0
145c123f1:     	jmp	0x145c12408 <.text+0x5c11408>
145c123f3:     	movq	%rax, %rdx
145c123f6:     	shrq	%rdx
145c123f9:     	andl	$0x1, %eax
145c123fc:     	orq	%rdx, %rax
145c123ff:     	cvtsi2ss	%rax, %xmm0
145c12404:     	addss	%xmm0, %xmm0
145c12408:     	leaq	0x1473af9(%rip), %rax   # 0x147085f08
145c1240f:     	mulss	(%rax,%rcx,4), %xmm0
145c12414:     	mulss	0x17cb764(%rip), %xmm0  # 0x1473ddb80
145c1241c:     	addss	0x620a9c(%rip), %xmm0   # 0x146232ec0
145c12424:     	xorl	%eax, %eax
145c12426:     	cmpq	$0x0, 0xa58(%r13)
145c1242e:     	sete	%al
145c12431:     	leaq	0x17cb738(%rip), %rcx   # 0x1473ddb70
145c12438:     	mulss	(%rcx,%rax,4), %xmm0
145c1243d:     	mulss	%xmm0, %xmm7
