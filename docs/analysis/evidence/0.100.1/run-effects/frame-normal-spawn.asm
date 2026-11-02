1454b9406:     	cmpq	0x348(%rbp), %rax
1454b940d:     	jae	0x1454bc92f <.text+0x54bb92f>
1454b9413:     	leaq	(%rax,%rax,4), %rcx
1454b9417:     	shlq	$0x4, %rcx
1454b941b:     	movss	0x44(%rdi,%rcx), %xmm6
1454b9421:     	movq	0x368(%rbp), %rcx
1454b9428:     	ucomiss	0x95c(%rcx), %xmm6
1454b942f:     	ja	0x1454b9496 <.text+0x54b8496>
1454b9431:     	movl	$0x0, 0xb0(%rbp)
1454b943b:     	movq	%rsi, %rcx
1454b943e:     	movq	%rax, %rdx
1454b9441:     	movq	%rbx, %r8
1454b9444:     	callq	0x1454d4130 <.text+0x54d3130>
1454b9449:     	nop
1454b944a:     	movss	0x95c(%rsi), %xmm0
1454b9452:     	cmpq	$0x1, %rax
1454b9456:     	jne	0x1454b9473 <.text+0x54b8473>
