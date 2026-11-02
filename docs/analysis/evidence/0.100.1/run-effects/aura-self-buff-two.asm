1454fcd19:     	movq	0x310(%rbx), %rax
1454fcd20:     	leaq	(%rdi,%rdi,2), %rcx
1454fcd24:     	movl	0xe8(%rbp), %edx
1454fcd2a:     	movl	%edx, 0x8(%rax,%rcx,8)
1454fcd2e:     	movq	0xe0(%rbp), %rdx
1454fcd35:     	movq	%rdx, (%rax,%rcx,8)
1454fcd39:     	movl	%esi, 0xc(%rax,%rcx,8)
1454fcd3d:     	movss	%xmm7, 0x10(%rax,%rcx,8)
1454fcd43:     	movl	$0x0, 0x14(%rax,%rcx,8)
1454fcd4b:     	incq	%rdi
1454fcd4e:     	movq	%rdi, 0x318(%rbx)
1454fcd55:     	movq	%rbx, %rcx
1454fcd58:     	callq	0x14549e650 <.text+0x549d650>
1454fcd5d:     	jmp	0x1454fd7c3 <.text+0x54fc7c3>
1454fcd62:     	xorl	%r11d, %r11d
1454fcd65:     	jmp	0x1454fce93 <.text+0x54fbe93>
1454fcd6a:     	movl	%r8d, %r10d
