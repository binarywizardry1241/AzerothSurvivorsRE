145ba4cf0:     	pushq	%r15
145ba4cf2:     	pushq	%r14
145ba4cf4:     	pushq	%rsi
145ba4cf5:     	pushq	%rdi
145ba4cf6:     	pushq	%rbx
145ba4cf7:     	movq	%rcx, %rax
145ba4cfa:     	xorl	%r9d, %r9d
145ba4cfd:     	movq	%r8, %rcx
145ba4d00:     	subq	$0xf, %rcx
145ba4d04:     	cmovaeq	%rcx, %r9
145ba4d08:     	testq	%r8, %r8
145ba4d0b:     	je	0x145ba4ec7 <.text+0x5ba3ec7>
145ba4d11:     	leaq	0x7(%rdx), %r10
145ba4d15:     	andq	$-0x8, %r10
145ba4d19:     	subq	%rdx, %r10
145ba4d1c:     	xorl	%ecx, %ecx
145ba4d1e:     	leaq	0x1647ad0(%rip), %rsi   # 0x1471ec7f5
145ba4d25:     	movabsq	$-0x7f7f7f7f7f7f7f80, %rdi # imm = 0x8080808080808080
145ba4d2f:     	jmp	0x145ba4d4f <.text+0x5ba3d4f>
145ba4d31:     	nopw	%cs:(%rax,%rax)
145ba4d40:     	incq	%r14
145ba4d43:     	movq	%r14, %rcx
145ba4d46:     	cmpq	%r8, %rcx
145ba4d49:     	jae	0x145ba4ec7 <.text+0x5ba3ec7>
145ba4d4f:     	movzbl	(%rdx,%rcx), %ebx
145ba4d53:     	testb	%bl, %bl
145ba4d55:     	js	0x145ba4db0 <.text+0x5ba3db0>
145ba4d57:     	movl	%r10d, %r11d
145ba4d5a:     	subl	%ecx, %r11d
145ba4d5d:     	testb	$0x7, %r11b
145ba4d61:     	je	0x145ba4d74 <.text+0x5ba3d74>
145ba4d63:     	incq	%rcx
145ba4d66:     	jmp	0x145ba4d46 <.text+0x5ba3d46>
145ba4d68:     	nopl	(%rax,%rax)
145ba4d70:     	addq	$0x10, %rcx
145ba4d74:     	cmpq	%r9, %rcx
145ba4d77:     	jae	0x145ba4d87 <.text+0x5ba3d87>
145ba4d79:     	movq	0x8(%rdx,%rcx), %r11
145ba4d7e:     	orq	(%rdx,%rcx), %r11
145ba4d82:     	testq	%rdi, %r11
145ba4d85:     	je	0x145ba4d70 <.text+0x5ba3d70>
145ba4d87:     	cmpq	%r8, %rcx
145ba4d8a:     	jae	0x145ba4d46 <.text+0x5ba3d46>
145ba4d8c:     	nopl	(%rax)
145ba4d90:     	cmpb	$0x0, (%rdx,%rcx)
145ba4d94:     	js	0x145ba4d46 <.text+0x5ba3d46>
145ba4d96:     	incq	%rcx
145ba4d99:     	cmpq	%rcx, %r8
145ba4d9c:     	jne	0x145ba4d90 <.text+0x5ba3d90>
145ba4d9e:     	jmp	0x145ba4ec7 <.text+0x5ba3ec7>
145ba4da3:     	nopw	%cs:(%rax,%rax)
145ba4db0:     	movzbl	(%rbx,%rsi), %r14d
145ba4db5:     	movb	$0x1, %r11b
145ba4db8:     	cmpl	$0x4, %r14d
145ba4dbc:     	je	0x145ba4e1b <.text+0x5ba3e1b>
145ba4dbe:     	cmpl	$0x3, %r14d
145ba4dc2:     	je	0x145ba4ded <.text+0x5ba3ded>
145ba4dc4:     	cmpl	$0x2, %r14d
145ba4dc8:     	jne	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4dce:     	leaq	0x1(%rcx), %r14
145ba4dd2:     	cmpq	%r8, %r14
145ba4dd5:     	jae	0x145ba4ed3 <.text+0x5ba3ed3>
145ba4ddb:     	cmpb	$-0x41, (%rdx,%r14)
145ba4de0:     	movb	$0x1, %bl
145ba4de2:     	jle	0x145ba4d40 <.text+0x5ba3d40>
145ba4de8:     	jmp	0x145ba4ede <.text+0x5ba3ede>
145ba4ded:     	leaq	0x1(%rcx), %r14
145ba4df1:     	cmpq	%r8, %r14
145ba4df4:     	jae	0x145ba4ed3 <.text+0x5ba3ed3>
145ba4dfa:     	movzbl	(%rdx,%r14), %r14d
145ba4dff:     	cmpq	$0xe0, %rbx
145ba4e06:     	je	0x145ba4e49 <.text+0x5ba3e49>
145ba4e08:     	cmpl	$0xed, %ebx
145ba4e0e:     	jne	0x145ba4e64 <.text+0x5ba3e64>
145ba4e10:     	cmpb	$-0x61, %r14b
145ba4e14:     	jle	0x145ba4e7c <.text+0x5ba3e7c>
145ba4e16:     	jmp	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4e1b:     	leaq	0x1(%rcx), %r14
145ba4e1f:     	cmpq	%r8, %r14
145ba4e22:     	jae	0x145ba4ed3 <.text+0x5ba3ed3>
145ba4e28:     	movzbl	(%rdx,%r14), %r14d
145ba4e2d:     	cmpq	$0xf0, %rbx
145ba4e34:     	je	0x145ba4e58 <.text+0x5ba3e58>
145ba4e36:     	cmpl	$0xf4, %ebx
145ba4e3c:     	jne	0x145ba4e92 <.text+0x5ba3e92>
145ba4e3e:     	cmpb	$-0x71, %r14b
145ba4e42:     	jle	0x145ba4ea0 <.text+0x5ba3ea0>
145ba4e44:     	jmp	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4e49:     	andb	$-0x20, %r14b
145ba4e4d:     	cmpb	$-0x60, %r14b
145ba4e51:     	je	0x145ba4e7c <.text+0x5ba3e7c>
145ba4e53:     	jmp	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4e58:     	addb	$0x70, %r14b
145ba4e5c:     	cmpb	$0x30, %r14b
145ba4e60:     	jb	0x145ba4ea0 <.text+0x5ba3ea0>
145ba4e62:     	jmp	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4e64:     	leal	0x1f(%rbx), %r15d
145ba4e68:     	cmpb	$0xc, %r15b
145ba4e6c:     	jb	0x145ba4e76 <.text+0x5ba3e76>
145ba4e6e:     	andb	$-0x2, %bl
145ba4e71:     	cmpb	$-0x12, %bl
145ba4e74:     	jne	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4e76:     	cmpb	$-0x40, %r14b
145ba4e7a:     	jge	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4e7c:     	leaq	0x2(%rcx), %r14
145ba4e80:     	cmpq	%r8, %r14
145ba4e83:     	jae	0x145ba4ed3 <.text+0x5ba3ed3>
145ba4e85:     	cmpb	$-0x41, (%rdx,%r14)
145ba4e8a:     	jle	0x145ba4d40 <.text+0x5ba3d40>
145ba4e90:     	jmp	0x145ba4edc <.text+0x5ba3edc>
145ba4e92:     	addb	$0xf, %bl
145ba4e95:     	cmpb	$0x2, %bl
145ba4e98:     	ja	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4e9a:     	cmpb	$-0x40, %r14b
145ba4e9e:     	jge	0x145ba4ed8 <.text+0x5ba3ed8>
145ba4ea0:     	leaq	0x2(%rcx), %rbx
145ba4ea4:     	cmpq	%r8, %rbx
145ba4ea7:     	jae	0x145ba4ed3 <.text+0x5ba3ed3>
145ba4ea9:     	cmpb	$-0x41, (%rdx,%rbx)
145ba4ead:     	jg	0x145ba4edc <.text+0x5ba3edc>
145ba4eaf:     	leaq	0x3(%rcx), %r14
145ba4eb3:     	cmpq	%r8, %r14
145ba4eb6:     	jae	0x145ba4ed3 <.text+0x5ba3ed3>
145ba4eb8:     	cmpb	$-0x40, (%rdx,%r14)
145ba4ebd:     	jl	0x145ba4d40 <.text+0x5ba3d40>
145ba4ec3:     	movb	$0x3, %bl
145ba4ec5:     	jmp	0x145ba4ede <.text+0x5ba3ede>
145ba4ec7:     	movq	%rdx, 0x8(%rax)
145ba4ecb:     	movq	%r8, 0x10(%rax)
145ba4ecf:     	xorl	%ecx, %ecx
145ba4ed1:     	jmp	0x145ba4eee <.text+0x5ba3eee>
145ba4ed3:     	xorl	%r11d, %r11d
145ba4ed6:     	jmp	0x145ba4ede <.text+0x5ba3ede>
145ba4ed8:     	movb	$0x1, %bl
145ba4eda:     	jmp	0x145ba4ede <.text+0x5ba3ede>
145ba4edc:     	movb	$0x2, %bl
145ba4ede:     	movq	%rcx, 0x8(%rax)
145ba4ee2:     	movb	%r11b, 0x10(%rax)
145ba4ee6:     	movb	%bl, 0x11(%rax)
145ba4ee9:     	movl	$0x1, %ecx
145ba4eee:     	movq	%rcx, (%rax)
145ba4ef1:     	popq	%rbx
145ba4ef2:     	popq	%rdi
145ba4ef3:     	popq	%rsi
145ba4ef4:     	popq	%r14
145ba4ef6:     	popq	%r15
145ba4ef8:     	retq
