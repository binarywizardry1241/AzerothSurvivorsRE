145c455ca:     	movw	$0x1, 0x1b4(%rbp)
145c455d3:     	movq	$-0x1, 0x18(%rbp)
145c455db:     	movl	$0x0, 0x80(%rbp)
145c455e5:     	movups	%xmm1, 0x198(%rbp)
145c455ec:     	movb	$0x0, 0x1b6(%rbp)
145c455f3:     	movl	$0xffffffff, 0x90(%rbp) # imm = 0xFFFFFFFF
145c455fd:     	movq	$0x0, 0x1a8(%rbp)
145c45608:     	movl	$0x0, 0x1b0(%rbp)
145c45612:     	movq	0x5c0(%rsi), %rdi
145c45619:     	cmpq	0x5b0(%rsi), %rdi
145c45620:     	jne	0x145c4562f <.text+0x5c4462f>
145c45622:     	leaq	0x5b0(%rsi), %rcx
145c45629:     	callq	0x146092690 <.text+0x6091690>
145c4562e:     	nop
145c4562f:     	leaq	0x40(%rbx), %r14
145c45633:     	imulq	$0x1f8, %rdi, %rcx      # imm = 0x1F8
145c4563a:     	addq	0x5b8(%rsi), %rcx
145c45641:     	leaq	-0x40(%rbp), %rdx
145c45645:     	movl	$0x1f8, %r8d            # imm = 0x1F8
145c4564b:     	callq	0x14606171b <.text+0x606071b>
