1454fcbce:     	leaq	(%rbx,%rbx,2), %rcx
1454fcbd2:     	movl	%r14d, (%rax,%rcx,8)
1454fcbd6:     	movss	%xmm10, 0x4(%rax,%rcx,8)
1454fcbdd:     	movss	%xmm6, 0x8(%rax,%rcx,8)
1454fcbe3:     	movl	%r15d, 0xc(%rax,%rcx,8)
1454fcbe8:     	movss	%xmm7, 0x10(%rax,%rcx,8)
1454fcbee:     	movl	$0x0, 0x14(%rax,%rcx,8)
1454fcbf6:     	incq	%rbx
1454fcbf9:     	movq	%rbx, 0x318(%rdi)
1454fcc00:     	movq	%rdi, %rcx
1454fcc03:     	callq	0x1454a6a40 <.text+0x54a5a40>
1454fcc08:     	movq	%rdi, %rcx
1454fcc0b:     	callq	0x14549e650 <.text+0x549d650>
1454fcc10:     	jmp	0x1454fd7c3 <.text+0x54fc7c3>
1454fcc15:     	movsd	-0x48(%r8,%r9), %xmm1
1454fcc1c:     	movss	-0x40(%r8,%r9), %xmm2
1454fcc23:     	movq	0x90(%rbp), %r8
