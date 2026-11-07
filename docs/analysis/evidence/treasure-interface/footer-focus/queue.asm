14010bd58:     	movq	0x520(%rbp), %rsi
14010bd5f:     	movq	0x538(%rbp), %r15
14010bd66:     	movq	0x540(%rbp), %r12
14010bd6d:     	testq	%r15, %r15
14010bd70:     	movq	%r15, %rbx
14010bd73:     	cmoveq	%r12, %rbx
14010bd77:     	movq	(%rbx), %rax
14010bd7a:     	movq	0x10(%rbx), %r13
14010bd7e:     	subq	%r13, %rax
14010bd81:     	cmpq	$0x17, %rax
14010bd85:     	jbe	0x14010c245 <.text+0x10b245>
14010bd8b:     	movq	0x8(%rbx), %rax
14010bd8f:     	leaq	0x6ba9a(%rip), %rcx     # 0x140177830 <.text+0x176830>
14010bd96:     	movq	%rcx, (%rax,%r13)
14010bd9a:     	movq	%rsi, 0x8(%rax,%r13)
14010bd9f:     	movb	$0x1, 0x12(%rax,%r13)
14010bda5:     	movw	$0x200, 0x10(%rax,%r13) # imm = 0x200
14010bdad:     	addq	$0x18, %r13
14010bdb1:     	movq	%r13, 0x10(%rbx)
14010bdb5:     	movq	0x548(%rbp), %rax
14010bdbc:     	movq	%rsi, 0x340(%rbp)
14010bdc3:     	movdqu	0x528(%rbp), %xmm0
14010bdcb:     	movdqu	%xmm0, 0x348(%rbp)
