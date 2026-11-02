145873b10:     	subq	$0x38, %rsp
145873b14:     	movl	%r8d, %r9d
145873b17:     	movq	%rcx, %rax
145873b1a:     	imull	0x28(%rcx), %edx
145873b1e:     	movq	0x10(%rcx), %r8
145873b22:     	leal	(%rdx,%r9,4), %ecx
145873b26:     	leaq	0x18(%rcx), %rdx
145873b2a:     	cmpq	%r8, %rdx
145873b2d:     	ja	0x145873bc7 <.text+0x5872bc7>
145873b33:     	movq	0x8(%rax), %rdx
145873b37:     	movl	0x14(%rdx,%rcx), %ecx
145873b3b:     	addq	0x18(%rax), %rcx
145873b3f:     	cmpq	%r8, %rcx
145873b42:     	ja	0x145873bd9 <.text+0x5872bd9>
145873b48:     	movq	%rcx, %r9
145873b4b:     	movq	%r8, %rax
145873b4e:     	subq	%r8, %r9
145873b51:     	je	0x145873b7c <.text+0x5872b7c>
145873b53:     	xorl	%r10d, %r10d
145873b56:     	movq	%rdx, %rax
145873b59:     	nopl	(%rax)
145873b60:     	cmpb	$0x0, (%rax,%rcx)
145873b64:     	je	0x145873b76 <.text+0x5872b76>
145873b66:     	decq	%r10
145873b69:     	incq	%rax
145873b6c:     	cmpq	%r10, %r9
145873b6f:     	jne	0x145873b60 <.text+0x5872b60>
145873b71:     	movq	%r8, %rax
145873b74:     	jmp	0x145873b7c <.text+0x5872b7c>
145873b76:     	movq	%rcx, %rax
145873b79:     	subq	%r10, %rax
145873b7c:     	movq	%rax, %r9
145873b7f:     	subq	%rcx, %r9
145873b82:     	jb	0x145873bb6 <.text+0x5872bb6>
145873b84:     	cmpq	%r8, %rax
145873b87:     	ja	0x145873bb6 <.text+0x5872bb6>
145873b89:     	addq	%rcx, %rdx
145873b8c:     	leaq	0x20(%rsp), %rcx
145873b91:     	movq	%r9, %r8
145873b94:     	callq	0x145ba4cf0 <.text+0x5ba3cf0>
145873b99:     	xorl	%edx, %edx
145873b9b:     	cmpb	$0x0, 0x20(%rsp)
145873ba0:     	cmoveq	0x30(%rsp), %rdx
145873ba6:     	movl	$0x1, %eax
145873bab:     	cmoveq	0x28(%rsp), %rax
145873bb1:     	addq	$0x38, %rsp
145873bb5:     	retq
145873bb6:     	leaq	0x132d0fb(%rip), %r9    # 0x146ba0cb8
145873bbd:     	movq	%rax, %rdx
145873bc0:     	callq	0x145d699f0 <.text+0x5d689f0>
145873bc5:     	ud2
145873bc7:     	addq	$0x14, %rcx
145873bcb:     	leaq	0x132d116(%rip), %r9    # 0x146ba0ce8
145873bd2:     	callq	0x145d699f0 <.text+0x5d689f0>
145873bd7:     	ud2
145873bd9:     	leaq	0x132d0f0(%rip), %r9    # 0x146ba0cd0
145873be0:     	movq	%r8, %rdx
145873be3:     	callq	0x145d699f0 <.text+0x5d689f0>
145873be8:     	ud2
