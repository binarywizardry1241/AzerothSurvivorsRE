1454a1654:     	callq	0x14577ffc0 <.text+0x577efc0>
1454a1659:     	nop
1454a165a:     	addss	%xmm8, %xmm6
1454a165f:     	movq	0x310(%r12), %rax
1454a1667:     	leaq	(%rsi,%rsi,2), %rcx
1454a166b:     	movl	$0xb, (%rax,%rcx,8)
1454a1672:     	movl	$0x740, 0xc(%rax,%rcx,8) # imm = 0x740
1454a167a:     	movss	%xmm6, 0x10(%rax,%rcx,8)
1454a1680:     	movl	$0x0, 0x14(%rax,%rcx,8)
1454a1688:     	incq	%rsi
1454a168b:     	movq	%rsi, 0x318(%r12)
1454a1693:     	movq	%r12, %rcx
1454a1696:     	callq	0x14549e650 <.text+0x549d650>
1454a169b:     	nop
1454a169c:     	movq	0x18(%rbp), %rdi
1454a16a0:     	movq	0x20(%rbp), %r14
1454a16a4:     	leaq	0x1555708(%rip), %r15   # 0x1469f6db3
