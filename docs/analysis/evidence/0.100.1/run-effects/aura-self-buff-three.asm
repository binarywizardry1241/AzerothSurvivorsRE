1454fd3a6:     	movq	0xd0(%rbp), %rcx
1454fd3ad:     	movq	0x310(%rcx), %rax
1454fd3b4:     	leaq	(%rdi,%rdi,2), %r8
1454fd3b8:     	movl	0xe8(%rbp), %edx
1454fd3be:     	movl	%edx, 0x8(%rax,%r8,8)
1454fd3c3:     	movq	0xe0(%rbp), %rdx
1454fd3ca:     	movq	%rdx, (%rax,%r8,8)
1454fd3ce:     	movl	%esi, 0xc(%rax,%r8,8)
1454fd3d3:     	movss	%xmm7, 0x10(%rax,%r8,8)
1454fd3da:     	movl	$0x0, 0x14(%rax,%r8,8)
1454fd3e3:     	incq	%rdi
1454fd3e6:     	movq	%rdi, 0x318(%rcx)
1454fd3ed:     	callq	0x14549e650 <.text+0x549d650>
1454fd3f2:     	jmp	0x1454fd7c3 <.text+0x54fc7c3>
1454fd3f7:     	movss	0x70(%rsi), %xmm6
1454fd3fc:     	cmpl	$0xc, %r14d
1454fd400:     	jne	0x1454fac77 <.text+0x54f9c77>
