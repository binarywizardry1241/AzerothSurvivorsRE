
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1402f9940:     	pushq	%rbp
1402f9941:     	pushq	%r15
1402f9943:     	pushq	%r14
1402f9945:     	pushq	%r13
1402f9947:     	pushq	%r12
1402f9949:     	pushq	%rsi
1402f994a:     	pushq	%rdi
1402f994b:     	pushq	%rbx
1402f994c:     	subq	$0x138, %rsp            # imm = 0x138
1402f9953:     	leaq	0x80(%rsp), %rbp
1402f995b:     	movq	$-0x2, 0xb0(%rbp)
1402f9966:     	movq	%r8, %r13
1402f9969:     	movq	%rdx, %rbx
1402f996c:     	movq	%rcx, %rdi
1402f996f:     	movq	%r8, %r15
1402f9972:     	shrq	$0x20, %r15
1402f9976:     	movl	%r13d, %r12d
1402f9979:     	movl	$0xffffffff, %eax       # imm = 0xFFFFFFFF
1402f997e:     	xorq	%r12, %rax
1402f9981:     	leaq	(%rax,%rax,2), %r8
1402f9985:     	shlq	$0x3, %r8
1402f9989:     	movq	0x8(%rdx), %rcx
1402f998d:     	addq	%r8, %rcx
1402f9990:     	movq	%rax, 0x40(%rbp)
1402f9994:     	cmpq	0x10(%rdx), %rax
1402f9998:     	leaq	0x5662a51(%rip), %rax   # 0x14595c3f0
1402f999f:     	cmovaeq	%rax, %rcx
1402f99a3:     	movl	0x10(%rcx), %eax
1402f99a6:     	cmpl	%r15d, %eax
1402f99a9:     	jne	0x1402f99d8 <.text+0x2f89d8>
1402f99ab:     	xorl	%edx, %edx
1402f99ad:     	cmpl	$0x0, (%rcx)
1402f99b0:     	je	0x1402f99e0 <.text+0x2f89e0>
1402f99b2:     	movl	%edx, 0x8(%rdi)
1402f99b5:     	movl	%r15d, 0xc(%rdi)
1402f99b9:     	movq	%rax, 0x10(%rdi)
1402f99bd:     	movq	$0x0, (%rdi)
1402f99c4:     	addq	$0x8, %r9
1402f99c8:     	movq	%r9, %rcx
1402f99cb:     	callq	0x140269ab0 <.text+0x268ab0>
1402f99d0:     	movq	%rdi, %rax
1402f99d3:     	jmp	0x1402fa2eb <.text+0x2f92eb>
1402f99d8:     	movl	%r13d, %edx
1402f99db:     	testl	%r13d, %r13d
1402f99de:     	jne	0x1402f99b2 <.text+0x2f89b2>
1402f99e0:     	movq	%r8, 0x8(%rbp)
1402f99e4:     	movq	%r9, 0x50(%rbp)
1402f99e8:     	movl	0x5b0(%rbx), %eax
1402f99ee:     	movl	%eax, 0xa8(%rbp)
1402f99f4:     	leaq	0x40(%rbx), %rsi
1402f99f8:     	leaq	0x5a8(%rbx), %rax
1402f99ff:     	movq	%rsi, 0x78(%rbp)
1402f9a03:     	movq	%rax, 0x80(%rbp)
1402f9a0a:     	movq	$0x0, 0x60(%rbp)
1402f9a12:     	movq	$0x8, 0x68(%rbp)
1402f9a1a:     	movq	$0x0, 0x70(%rbp)
1402f9a22:     	leaq	0x268(%rbx), %rcx
1402f9a29:     	leaq	0x158(%rbx), %r8
1402f9a30:     	leaq	0x60(%rbp), %rdx
1402f9a34:     	callq	0x140342b20 <.text+0x341b20>
1402f9a39:     	nop
1402f9a3a:     	movq	%rax, %r14
1402f9a3d:     	movq	%r12, 0x18(%rbp)
1402f9a41:     	movq	%r15, 0x10(%rbp)
1402f9a45:     	movq	%rdi, 0x58(%rbp)
1402f9a49:     	movq	0x60(%rbp), %rdx
1402f9a4d:     	testq	%rdx, %rdx
1402f9a50:     	je	0x1402f9a65 <.text+0x2f8a65>
1402f9a52:     	movq	0x68(%rbp), %rcx
1402f9a56:     	shlq	$0x3, %rdx
1402f9a5a:     	movl	$0x8, %r8d
1402f9a60:     	callq	0x1400021d0 <.text+0x11d0>
1402f9a65:     	leaq	(%r14,%r14,4), %rcx
1402f9a69:     	shlq	$0x3, %rcx
1402f9a6d:     	addq	0x270(%rbx), %rcx
1402f9a74:     	leaq	0x100(%rbx), %rdx
1402f9a7b:     	leaq	0x388(%rbx), %rax
1402f9a82:     	movb	$0x1, 0xae(%rbp)
1402f9a89:     	movq	%rax, 0x20(%rsp)
1402f9a8e:     	movl	$0x0, 0x28(%rsp)
1402f9a96:     	movq	%rcx, 0x88(%rbp)
1402f9a9d:     	leaq	0x158(%rbx), %r8
1402f9aa4:     	movq	%rsi, %r9
1402f9aa7:     	callq	0x144e6de40 <.text+0x4e6ce40>
1402f9aac:     	nop
1402f9aad:     	movl	%eax, %ecx
1402f9aaf:     	movq	0x110(%rbx), %r9
1402f9ab6:     	cmpq	%rcx, %r9
1402f9ab9:     	jbe	0x1402fa35a <.text+0x2f935a>
1402f9abf:     	leaq	(%rcx,%rcx,4), %r15
1402f9ac3:     	shlq	$0x5, %r15
1402f9ac7:     	movq	0x108(%rbx), %rcx
1402f9ace:     	movq	0x1b0(%rbx), %r9
1402f9ad5:     	movq	%rcx, 0x98(%rbp)
1402f9adc:     	movl	0x94(%rcx,%r15), %ecx
1402f9ae4:     	cmpq	%rcx, %r9
1402f9ae7:     	jbe	0x1402fa373 <.text+0x2f9373>
1402f9aed:     	leaq	(%rcx,%rcx,8), %r12
1402f9af1:     	shlq	$0x3, %r12
1402f9af5:     	addq	0x1a8(%rbx), %r12
1402f9afc:     	testb	$0x1, %dl
1402f9aff:     	je	0x1402f9b38 <.text+0x2f8b38>
1402f9b01:     	movq	0x588(%rbx), %rsi
1402f9b08:     	movq	(%rsi), %rcx
1402f9b0b:     	movq	0x10(%rsi), %r14
1402f9b0f:     	subq	%r14, %rcx
1402f9b12:     	cmpq	$0xb, %rcx
1402f9b16:     	jbe	0x1402fa322 <.text+0x2f9322>
1402f9b1c:     	movq	0x8(%rsi), %rcx
1402f9b20:     	leaq	-0x18a0f7(%rip), %rdx   # 0x14016fa30 <.text+0x16ea30>
1402f9b27:     	movq	%rdx, (%rcx,%r14)
1402f9b2b:     	movl	%eax, 0x8(%rcx,%r14)
1402f9b30:     	addq	$0xc, %r14
1402f9b34:     	movq	%r14, 0x10(%rsi)
1402f9b38:     	movb	$0x1, 0xaf(%rbp)
1402f9b3f:     	movq	%r12, %rcx
1402f9b42:     	movq	%r13, %rdx
1402f9b45:     	callq	0x144e5ea00 <.text+0x4e5da00>
1402f9b4a:     	nop
1402f9b4b:     	movl	%eax, %edi
1402f9b4d:     	movq	0x98(%rbp), %rcx
1402f9b54:     	addq	%r15, %rcx
1402f9b57:     	movq	0x58(%rcx), %rax
1402f9b5b:     	movq	%rax, 0x28(%rbp)
1402f9b5f:     	movq	%rcx, 0x98(%rbp)
1402f9b66:     	cmpq	0x48(%rcx), %rax
1402f9b6a:     	jne	0x1402f9b84 <.text+0x2f8b84>
1402f9b6c:     	movq	0x98(%rbp), %rax
1402f9b73:     	leaq	0x48(%rax), %rcx
1402f9b77:     	movb	$0x1, 0xaf(%rbp)
1402f9b7e:     	callq	0x145774860 <.text+0x5773860>
1402f9b83:     	nop
1402f9b84:     	movq	0x98(%rbp), %r8
1402f9b8b:     	movq	0x50(%r8), %rax
1402f9b8f:     	movq	0x28(%rbp), %rdx
1402f9b93:     	movq	%rdx, %rcx
1402f9b96:     	shlq	$0x4, %rcx
1402f9b9a:     	movq	%r13, (%rax,%rcx)
1402f9b9e:     	movl	%edi, 0x8(%rax,%rcx)
1402f9ba2:     	leaq	0x1(%rdx), %rax
1402f9ba6:     	movq	%rax, 0x58(%r8)
1402f9baa:     	movl	0x90(%r8), %eax
1402f9bb1:     	movq	%rax, 0x48(%rbp)
1402f9bb5:     	movl	0x94(%r8), %eax
1402f9bbc:     	movl	%eax, 0x94(%rbp)
1402f9bc2:     	movq	0x88(%rbp), %rax
1402f9bc9:     	movq	(%rax), %rcx
1402f9bcc:     	movq	%rcx, 0xa0(%rbp)
1402f9bd3:     	movq	0x10(%rax), %rsi
1402f9bd7:     	movq	0x18(%rax), %rax
1402f9bdb:     	movq	%rax, -0x40(%rbp)
1402f9bdf:     	movq	%r13, -0x48(%rbp)
1402f9be3:     	movq	0x50(%rbp), %r13
1402f9be7:     	leaq	0x8(%r13), %rax
1402f9beb:     	movq	%rax, -0x18(%rbp)
1402f9bef:     	movq	(%rcx), %rax
1402f9bf2:     	movq	%rdi, 0x20(%rbp)
1402f9bf6:     	movq	0x18(%r12), %rdi
1402f9bfb:     	movq	0x38(%r12), %rcx
1402f9c00:     	movq	(%rcx,%rax,8), %rax
1402f9c04:     	notq	%rax
1402f9c07:     	leaq	(%rax,%rax,2), %r15
1402f9c0b:     	shlq	$0x4, %r15
1402f9c0f:     	movq	0x20(%rbp), %r14
1402f9c13:     	notl	%r14d
1402f9c16:     	movq	0x8(%rdi,%r15), %r8
1402f9c1b:     	movq	%r8, %rcx
1402f9c1e:     	imulq	%r14, %rcx
1402f9c22:     	addq	0x10(%rdi,%r15), %rcx
1402f9c27:     	movq	%r13, %rdx
1402f9c2a:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9c2f:     	movq	0x20(%rdi,%r15), %rax
1402f9c34:     	movl	0xa8(%rbp), %ecx
1402f9c3a:     	movl	%ecx, (%rax,%r14,4)
1402f9c3e:     	movq	0x28(%rdi,%r15), %rax
1402f9c43:     	movl	0xa8(%rbp), %ecx
1402f9c49:     	movl	%ecx, (%rax,%r14,4)
1402f9c4d:     	leaq	0x2c8(%r13), %rax
1402f9c54:     	movq	%rax, (%rbp)
1402f9c58:     	leaq	0x288(%r13), %rax
1402f9c5f:     	movq	%rax, -0x8(%rbp)
1402f9c63:     	leaq	0x228(%r13), %rax
1402f9c6a:     	movq	%rax, -0x10(%rbp)
1402f9c6e:     	leaq	0x2b4(%r13), %rax
1402f9c75:     	movq	%rax, -0x20(%rbp)
1402f9c79:     	leaq	0x1a0(%r13), %rax
1402f9c80:     	movq	%rax, -0x28(%rbp)
1402f9c84:     	leaq	0x188(%r13), %rax
1402f9c8b:     	movq	%rax, -0x30(%rbp)
1402f9c8f:     	leaq	0x2cc(%r13), %rax
1402f9c96:     	movq	%rax, -0x38(%rbp)
1402f9c9a:     	movq	0xa0(%rbp), %rax
1402f9ca1:     	movq	0x8(%rax), %rax
1402f9ca5:     	movq	0x18(%r12), %rdi
1402f9caa:     	movq	0x38(%r12), %rcx
1402f9caf:     	movq	(%rcx,%rax,8), %rax
1402f9cb3:     	notq	%rax
1402f9cb6:     	leaq	(%rax,%rax,2), %r15
1402f9cba:     	shlq	$0x4, %r15
1402f9cbe:     	leaq	0x278(%r13), %rdx
1402f9cc5:     	movq	-0x48(%rbp), %r13
1402f9cc9:     	movq	0x8(%rdi,%r15), %r8
1402f9cce:     	movq	%r8, %rcx
1402f9cd1:     	imulq	%r14, %rcx
1402f9cd5:     	addq	0x10(%rdi,%r15), %rcx
1402f9cda:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9cdf:     	movq	0x20(%rdi,%r15), %rax
1402f9ce4:     	movl	0xa8(%rbp), %ecx
1402f9cea:     	movl	%ecx, (%rax,%r14,4)
1402f9cee:     	movq	0x28(%rdi,%r15), %rax
1402f9cf3:     	movl	0xa8(%rbp), %ecx
1402f9cf9:     	movl	%ecx, (%rax,%r14,4)
1402f9cfd:     	movq	0xa0(%rbp), %rax
1402f9d04:     	movq	0x10(%rax), %rax
1402f9d08:     	movq	0x18(%r12), %rdi
1402f9d0d:     	movq	0x38(%r12), %rcx
1402f9d12:     	movq	(%rcx,%rax,8), %rax
1402f9d16:     	notq	%rax
1402f9d19:     	leaq	(%rax,%rax,2), %r15
1402f9d1d:     	shlq	$0x4, %r15
1402f9d21:     	movq	0x8(%rdi,%r15), %r8
1402f9d26:     	movq	%r8, %rcx
1402f9d29:     	imulq	%r14, %rcx
1402f9d2d:     	addq	0x10(%rdi,%r15), %rcx
1402f9d32:     	movq	(%rbp), %rdx
1402f9d36:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9d3b:     	movq	0x20(%rdi,%r15), %rax
1402f9d40:     	movl	0xa8(%rbp), %ecx
1402f9d46:     	movl	%ecx, (%rax,%r14,4)
1402f9d4a:     	movq	0x28(%rdi,%r15), %rax
1402f9d4f:     	movl	0xa8(%rbp), %ecx
1402f9d55:     	movl	%ecx, (%rax,%r14,4)
1402f9d59:     	movq	0xa0(%rbp), %rax
1402f9d60:     	movq	0x18(%rax), %rax
1402f9d64:     	movq	0x18(%r12), %rdi
1402f9d69:     	movq	0x38(%r12), %rcx
1402f9d6e:     	movq	(%rcx,%rax,8), %rax
1402f9d72:     	notq	%rax
1402f9d75:     	leaq	(%rax,%rax,2), %r15
1402f9d79:     	shlq	$0x4, %r15
1402f9d7d:     	movq	0x8(%rdi,%r15), %r8
1402f9d82:     	movq	%r8, %rcx
1402f9d85:     	imulq	%r14, %rcx
1402f9d89:     	addq	0x10(%rdi,%r15), %rcx
1402f9d8e:     	movq	-0x8(%rbp), %rdx
1402f9d92:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9d97:     	movq	0x20(%rdi,%r15), %rax
1402f9d9c:     	movl	0xa8(%rbp), %ecx
1402f9da2:     	movl	%ecx, (%rax,%r14,4)
1402f9da6:     	movq	0x28(%rdi,%r15), %rax
1402f9dab:     	movl	0xa8(%rbp), %ecx
1402f9db1:     	movl	%ecx, (%rax,%r14,4)
1402f9db5:     	movq	0xa0(%rbp), %rax
1402f9dbc:     	movq	0x20(%rax), %rax
1402f9dc0:     	movq	0x18(%r12), %rdi
1402f9dc5:     	movq	0x38(%r12), %rcx
1402f9dca:     	movq	(%rcx,%rax,8), %rax
1402f9dce:     	notq	%rax
1402f9dd1:     	leaq	(%rax,%rax,2), %r15
1402f9dd5:     	shlq	$0x4, %r15
1402f9dd9:     	movq	0x8(%rdi,%r15), %r8
1402f9dde:     	movq	%r8, %rcx
1402f9de1:     	imulq	%r14, %rcx
1402f9de5:     	addq	0x10(%rdi,%r15), %rcx
1402f9dea:     	movq	-0x18(%rbp), %rdx
1402f9dee:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9df3:     	movq	0x20(%rdi,%r15), %rax
1402f9df8:     	movl	0xa8(%rbp), %ecx
1402f9dfe:     	movl	%ecx, (%rax,%r14,4)
1402f9e02:     	movq	0x28(%rdi,%r15), %rax
1402f9e07:     	movl	0xa8(%rbp), %ecx
1402f9e0d:     	movl	%ecx, (%rax,%r14,4)
1402f9e11:     	movq	0xa0(%rbp), %rax
1402f9e18:     	movq	0x28(%rax), %rax
1402f9e1c:     	movq	0x18(%r12), %rdi
1402f9e21:     	movq	0x38(%r12), %rcx
1402f9e26:     	movq	(%rcx,%rax,8), %rax
1402f9e2a:     	notq	%rax
1402f9e2d:     	leaq	(%rax,%rax,2), %r15
1402f9e31:     	shlq	$0x4, %r15
1402f9e35:     	movq	0x8(%rdi,%r15), %r8
1402f9e3a:     	movq	%r8, %rcx
1402f9e3d:     	imulq	%r14, %rcx
1402f9e41:     	addq	0x10(%rdi,%r15), %rcx
1402f9e46:     	movq	-0x10(%rbp), %rdx
1402f9e4a:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9e4f:     	movq	0x20(%rdi,%r15), %rax
1402f9e54:     	movl	0xa8(%rbp), %ecx
1402f9e5a:     	movl	%ecx, (%rax,%r14,4)
1402f9e5e:     	movq	0x28(%rdi,%r15), %rax
1402f9e63:     	movl	0xa8(%rbp), %ecx
1402f9e69:     	movl	%ecx, (%rax,%r14,4)
1402f9e6d:     	movq	0xa0(%rbp), %rax
1402f9e74:     	movq	0x30(%rax), %rax
1402f9e78:     	movq	0x18(%r12), %rdi
1402f9e7d:     	movq	0x38(%r12), %rcx
1402f9e82:     	movq	(%rcx,%rax,8), %rax
1402f9e86:     	notq	%rax
1402f9e89:     	leaq	(%rax,%rax,2), %r15
1402f9e8d:     	shlq	$0x4, %r15
1402f9e91:     	movq	0x8(%rdi,%r15), %r8
1402f9e96:     	movq	%r8, %rcx
1402f9e99:     	imulq	%r14, %rcx
1402f9e9d:     	addq	0x10(%rdi,%r15), %rcx
1402f9ea2:     	movq	-0x20(%rbp), %rdx
1402f9ea6:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9eab:     	movq	0x20(%rdi,%r15), %rax
1402f9eb0:     	movl	0xa8(%rbp), %ecx
1402f9eb6:     	movl	%ecx, (%rax,%r14,4)
1402f9eba:     	movq	0x28(%rdi,%r15), %rax
1402f9ebf:     	movl	0xa8(%rbp), %ecx
1402f9ec5:     	movl	%ecx, (%rax,%r14,4)
1402f9ec9:     	movq	0xa0(%rbp), %rax
1402f9ed0:     	movq	0x38(%rax), %rax
1402f9ed4:     	movq	0x18(%r12), %rdi
1402f9ed9:     	movq	0x38(%r12), %rcx
1402f9ede:     	movq	(%rcx,%rax,8), %rax
1402f9ee2:     	notq	%rax
1402f9ee5:     	leaq	(%rax,%rax,2), %r15
1402f9ee9:     	shlq	$0x4, %r15
1402f9eed:     	movq	0x8(%rdi,%r15), %r8
1402f9ef2:     	movq	%r8, %rcx
1402f9ef5:     	imulq	%r14, %rcx
1402f9ef9:     	addq	0x10(%rdi,%r15), %rcx
1402f9efe:     	movq	-0x28(%rbp), %rdx
1402f9f02:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9f07:     	movq	0x20(%rdi,%r15), %rax
1402f9f0c:     	movl	0xa8(%rbp), %ecx
1402f9f12:     	movl	%ecx, (%rax,%r14,4)
1402f9f16:     	movq	0x28(%rdi,%r15), %rax
1402f9f1b:     	movl	0xa8(%rbp), %ecx
1402f9f21:     	movl	%ecx, (%rax,%r14,4)
1402f9f25:     	movq	0xa0(%rbp), %rax
1402f9f2c:     	movq	0x40(%rax), %rax
1402f9f30:     	movq	0x18(%r12), %rdi
1402f9f35:     	movq	0x38(%r12), %rcx
1402f9f3a:     	movq	(%rcx,%rax,8), %rax
1402f9f3e:     	notq	%rax
1402f9f41:     	leaq	(%rax,%rax,2), %r15
1402f9f45:     	shlq	$0x4, %r15
1402f9f49:     	movq	0x8(%rdi,%r15), %r8
1402f9f4e:     	movq	%r8, %rcx
1402f9f51:     	imulq	%r14, %rcx
1402f9f55:     	addq	0x10(%rdi,%r15), %rcx
1402f9f5a:     	movq	-0x30(%rbp), %rdx
1402f9f5e:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9f63:     	movq	0x20(%rdi,%r15), %rax
1402f9f68:     	movl	0xa8(%rbp), %ecx
1402f9f6e:     	movl	%ecx, (%rax,%r14,4)
1402f9f72:     	movq	0x28(%rdi,%r15), %rax
1402f9f77:     	movl	0xa8(%rbp), %ecx
1402f9f7d:     	movl	%ecx, (%rax,%r14,4)
1402f9f81:     	movq	0xa0(%rbp), %rax
1402f9f88:     	movq	0x48(%rax), %rax
1402f9f8c:     	movq	0x18(%r12), %rdi
1402f9f91:     	movq	0x38(%r12), %rcx
1402f9f96:     	movq	(%rcx,%rax,8), %rax
1402f9f9a:     	notq	%rax
1402f9f9d:     	leaq	(%rax,%rax,2), %r15
1402f9fa1:     	shlq	$0x4, %r15
1402f9fa5:     	movq	0x8(%rdi,%r15), %r8
1402f9faa:     	movq	%r8, %rcx
1402f9fad:     	imulq	%r14, %rcx
1402f9fb1:     	addq	0x10(%rdi,%r15), %rcx
1402f9fb6:     	movq	-0x38(%rbp), %rdx
1402f9fba:     	callq	0x1457731e1 <.text+0x57721e1>
1402f9fbf:     	movq	0x20(%rdi,%r15), %rax
1402f9fc4:     	movl	0xa8(%rbp), %ecx
1402f9fca:     	movl	%ecx, (%rax,%r14,4)
1402f9fce:     	movq	0x28(%rdi,%r15), %rax
1402f9fd3:     	movq	-0x40(%rbp), %r15
1402f9fd7:     	movq	0x20(%rbp), %rdi
1402f9fdb:     	movl	0xa8(%rbp), %ecx
1402f9fe1:     	movl	%ecx, (%rax,%r14,4)
1402f9fe5:     	movl	0xa8(%rbp), %r14d
1402f9fec:     	testq	%r15, %r15
1402f9fef:     	je	0x1402fa02f <.text+0x2f902f>
1402f9ff1:     	shlq	$0x4, %r15
1402f9ff5:     	addq	%rsi, %r15
1402f9ff8:     	nopl	(%rax,%rax)
1402fa000:     	movb	$0x0, 0xaf(%rbp)
1402fa007:     	movq	%r13, 0x28(%rsp)
1402fa00c:     	movl	%edi, 0x20(%rsp)
1402fa010:     	movq	%rsi, %rcx
1402fa013:     	movq	%r12, %rdx
1402fa016:     	leaq	0x158(%rbx), %r8
1402fa01d:     	movl	%r14d, %r9d
1402fa020:     	callq	0x144e998e0 <.text+0x4e988e0>
1402fa025:     	nop
1402fa026:     	addq	$0x10, %rsi
1402fa02a:     	cmpq	%r15, %rsi
1402fa02d:     	jne	0x1402fa000 <.text+0x2f9000>
1402fa02f:     	movq	0x40(%rbp), %rax
1402fa033:     	cmpq	%rax, 0x10(%rbx)
1402fa037:     	jbe	0x1402fa2ff <.text+0x2f92ff>
1402fa03d:     	movq	0x28(%rbp), %rdx
1402fa041:     	notl	%edx
1402fa043:     	movq	0x8(%rbx), %rax
1402fa047:     	movq	0x40(%rbp), %rcx
1402fa04b:     	leaq	(,%rcx,8), %rcx
1402fa053:     	leaq	(%rcx,%rcx,2), %rcx
1402fa057:     	movq	%rdx, %r12
1402fa05a:     	movl	%edx, (%rax,%rcx)
1402fa05d:     	movl	%edi, 0x4(%rax,%rcx)
1402fa061:     	movq	0x48(%rbp), %rdx
1402fa065:     	movl	%edx, 0x8(%rax,%rcx)
1402fa069:     	movl	0x94(%rbp), %edx
1402fa06f:     	movl	%edx, 0xc(%rax,%rcx)
1402fa073:     	movq	0x8(%rbx), %rax
1402fa077:     	movl	%r14d, 0x14(%rax,%rcx)
1402fa07c:     	movq	0x98(%rbp), %rax
1402fa083:     	movl	0x98(%rax), %eax
1402fa089:     	testb	$0x1, %al
1402fa08b:     	je	0x1402fa0ff <.text+0x2f90ff>
1402fa08d:     	movq	0x88(%rbp), %rax
1402fa094:     	movq	(%rax), %r14
1402fa097:     	movq	0x8(%rax), %rax
1402fa09b:     	leaq	(%r14,%rax,8), %r15
1402fa09f:     	leaq	0x60(%rbp), %rsi
1402fa0a3:     	nopw	%cs:(%rax,%rax)
1402fa0b0:     	cmpq	%r15, %r14
1402fa0b3:     	je	0x1402fa0f2 <.text+0x2f90f2>
1402fa0b5:     	movq	(%r14), %rcx
1402fa0b8:     	addq	$0x8, %r14
1402fa0bc:     	movq	0x48(%rbx), %rax
1402fa0c0:     	imulq	$0x130, %rcx, %rdx      # imm = 0x130
1402fa0c7:     	movq	0x108(%rax,%rdx), %rax
1402fa0cf:     	testq	%rax, %rax
1402fa0d2:     	je	0x1402fa0b0 <.text+0x2f90b0>
1402fa0d4:     	movq	%r13, 0x60(%rbp)
1402fa0d8:     	movq	%rcx, 0x68(%rbp)
1402fa0dc:     	movb	$0x0, 0x70(%rbp)
1402fa0e0:     	movb	$0x0, 0xaf(%rbp)
1402fa0e7:     	movq	%rbx, %rcx
1402fa0ea:     	movq	%rsi, %rdx
1402fa0ed:     	callq	*%rax
1402fa0ef:     	nop
1402fa0f0:     	jmp	0x1402fa0b0 <.text+0x2f90b0>
1402fa0f2:     	movq	0x98(%rbp), %rax
1402fa0f9:     	movl	0x98(%rax), %eax
1402fa0ff:     	testb	$0x20, %al
1402fa101:     	je	0x1402fa16e <.text+0x2f916e>
1402fa103:     	movq	%r13, 0x38(%rbp)
1402fa107:     	movq	0x88(%rbp), %rax
1402fa10e:     	movups	(%rax), %xmm0
1402fa111:     	movups	%xmm0, 0x60(%rbp)
1402fa115:     	movb	$0x0, 0xaf(%rbp)
1402fa11c:     	leaq	0x388(%rbx), %rcx
1402fa123:     	xorl	%edx, %edx
1402fa125:     	callq	0x144e14720 <.text+0x4e13720>
1402fa12a:     	nop
1402fa12b:     	testq	%rax, %rax
1402fa12e:     	je	0x1402fa161 <.text+0x2f9161>
1402fa130:     	movq	$0x0, 0x30(%rbp)
1402fa138:     	movb	$0x0, 0xaf(%rbp)
1402fa13f:     	leaq	0x30(%rbp), %rcx
1402fa143:     	movq	%rcx, 0x28(%rsp)
1402fa148:     	movq	%r13, 0x20(%rsp)
1402fa14d:     	leaq	0x60(%rbp), %rcx
1402fa151:     	leaq	0x38(%rbp), %r9
1402fa155:     	movq	%rbx, %rdx
1402fa158:     	movq	%rax, %r8
1402fa15b:     	callq	0x144e8adb0 <.text+0x4e89db0>
1402fa160:     	nop
1402fa161:     	movq	0x98(%rbp), %rax
1402fa168:     	movl	0x98(%rax), %eax
1402fa16e:     	testb	$0x2, %al
1402fa170:     	je	0x1402fa1df <.text+0x2f91df>
1402fa172:     	movq	0x88(%rbp), %rax
1402fa179:     	movq	(%rax), %r14
1402fa17c:     	movq	0x8(%rax), %rax
1402fa180:     	leaq	(%r14,%rax,8), %r15
1402fa184:     	leaq	0x60(%rbp), %rsi
1402fa188:     	nopl	(%rax,%rax)
1402fa190:     	cmpq	%r15, %r14
1402fa193:     	je	0x1402fa1d2 <.text+0x2f91d2>
1402fa195:     	movq	(%r14), %rcx
1402fa198:     	addq	$0x8, %r14
1402fa19c:     	movq	0x48(%rbx), %rax
1402fa1a0:     	imulq	$0x130, %rcx, %rdx      # imm = 0x130
1402fa1a7:     	movq	0x110(%rax,%rdx), %rax
1402fa1af:     	testq	%rax, %rax
1402fa1b2:     	je	0x1402fa190 <.text+0x2f9190>
1402fa1b4:     	movq	%r13, 0x60(%rbp)
1402fa1b8:     	movq	%rcx, 0x68(%rbp)
1402fa1bc:     	movb	$0x0, 0x70(%rbp)
1402fa1c0:     	movb	$0x0, 0xaf(%rbp)
1402fa1c7:     	movq	%rbx, %rcx
1402fa1ca:     	movq	%rsi, %rdx
1402fa1cd:     	callq	*%rax
1402fa1cf:     	nop
1402fa1d0:     	jmp	0x1402fa190 <.text+0x2f9190>
1402fa1d2:     	movq	0x98(%rbp), %rax
1402fa1d9:     	movl	0x98(%rax), %eax
1402fa1df:     	testb	$0x40, %al
1402fa1e1:     	je	0x1402fa244 <.text+0x2f9244>
1402fa1e3:     	movq	%r13, 0x38(%rbp)
1402fa1e7:     	movq	0x88(%rbp), %rax
1402fa1ee:     	movups	(%rax), %xmm0
1402fa1f1:     	movups	%xmm0, 0x60(%rbp)
1402fa1f5:     	movb	$0x0, 0xaf(%rbp)
1402fa1fc:     	movl	$0x1, %edx
1402fa201:     	leaq	0x388(%rbx), %rcx
1402fa208:     	callq	0x144e14720 <.text+0x4e13720>
1402fa20d:     	nop
1402fa20e:     	testq	%rax, %rax
1402fa211:     	je	0x1402fa244 <.text+0x2f9244>
1402fa213:     	movq	$0x1, 0x30(%rbp)
1402fa21b:     	movb	$0x0, 0xaf(%rbp)
1402fa222:     	leaq	0x30(%rbp), %rcx
1402fa226:     	movq	%rcx, 0x28(%rsp)
1402fa22b:     	movq	%r13, 0x20(%rsp)
1402fa230:     	leaq	0x60(%rbp), %rcx
1402fa234:     	leaq	0x38(%rbp), %r9
1402fa238:     	movq	%rbx, %rdx
1402fa23b:     	movq	%rax, %r8
1402fa23e:     	callq	0x144e8adb0 <.text+0x4e89db0>
1402fa243:     	nop
1402fa244:     	movq	0x588(%rbx), %rax
1402fa24b:     	movq	0x590(%rbx), %rcx
1402fa252:     	movq	(%rcx), %rcx
1402fa255:     	cmpq	0x10(%rax), %rcx
1402fa259:     	jae	0x1402fa2c9 <.text+0x2f92c9>
1402fa25b:     	movb	$0x0, 0xae(%rbp)
1402fa262:     	movq	%rbx, %rcx
1402fa265:     	callq	0x144e89050 <.text+0x4e88050>
1402fa26a:     	nop
1402fa26b:     	movb	$0x0, 0xae(%rbp)
1402fa272:     	movq	%rbx, %rcx
1402fa275:     	callq	0x144e89000 <.text+0x4e88000>
1402fa27a:     	nop
1402fa27b:     	movq	0x8(%rbp), %rcx
1402fa27f:     	addq	0x8(%rbx), %rcx
1402fa283:     	movq	0x40(%rbp), %rax
1402fa287:     	cmpq	0x10(%rbx), %rax
1402fa28b:     	leaq	0x566215e(%rip), %rdx   # 0x14595c3f0
1402fa292:     	cmovbq	%rcx, %rdx
1402fa296:     	xorl	%r12d, %r12d
1402fa299:     	movq	0x10(%rbp), %rax
1402fa29d:     	cmpl	%eax, 0x10(%rdx)
1402fa2a0:     	jne	0x1402fa2c9 <.text+0x2f92c9>
1402fa2a2:     	movl	(%rdx), %ecx
1402fa2a4:     	testl	%ecx, %ecx
1402fa2a6:     	movq	0x58(%rbp), %rax
1402fa2aa:     	je	0x1402fa2cd <.text+0x2f92cd>
1402fa2ac:     	movq	0x4(%rdx), %rdi
1402fa2b0:     	movl	0xc(%rdx), %edx
1402fa2b3:     	movl	%edx, 0x94(%rbp)
1402fa2b9:     	movq	%rdi, %rdx
1402fa2bc:     	shrq	$0x20, %rdx
1402fa2c0:     	movq	%rdx, 0x48(%rbp)
1402fa2c4:     	movl	%ecx, %r12d
1402fa2c7:     	jmp	0x1402fa2cd <.text+0x2f92cd>
1402fa2c9:     	movq	0x58(%rbp), %rax
1402fa2cd:     	movq	%rbx, (%rax)
1402fa2d0:     	movq	%r13, 0x8(%rax)
1402fa2d4:     	movl	%r12d, 0x10(%rax)
1402fa2d8:     	movl	%edi, 0x14(%rax)
1402fa2db:     	movq	0x48(%rbp), %rcx
1402fa2df:     	movl	%ecx, 0x18(%rax)
1402fa2e2:     	movl	0x94(%rbp), %ecx
1402fa2e8:     	movl	%ecx, 0x1c(%rax)
1402fa2eb:     	addq	$0x138, %rsp            # imm = 0x138
1402fa2f2:     	popq	%rbx
1402fa2f3:     	popq	%rdi
1402fa2f4:     	popq	%rsi
1402fa2f5:     	popq	%r12
1402fa2f7:     	popq	%r13
1402fa2f9:     	popq	%r14
1402fa2fb:     	popq	%r15
1402fa2fd:     	popq	%rbp
1402fa2fe:     	retq
1402fa2ff:     	movabsq	$0x100000000, %rdx      # imm = 0x100000000
1402fa309:     	subq	0x18(%rbp), %rdx
1402fa30d:     	movb	$0x0, 0xaf(%rbp)
1402fa314:     	movq	%rbx, %rcx
1402fa317:     	callq	0x1458bcf10 <.text+0x58bbf10>
1402fa31c:     	nop
1402fa31d:     	jmp	0x1402fa03d <.text+0x2f903d>
1402fa322:     	movb	$0x1, 0xae(%rbp)
1402fa329:     	movq	$0x1, 0x20(%rsp)
1402fa332:     	movl	$0xc, %r8d
1402fa338:     	movl	$0x1, %r9d
1402fa33e:     	movq	%rsi, %rcx
1402fa341:     	movq	%r14, %rdx
1402fa344:     	movl	%eax, 0xa0(%rbp)
1402fa34a:     	callq	0x1457744b0 <.text+0x57734b0>
1402fa34f:     	movl	0xa0(%rbp), %eax
1402fa355:     	jmp	0x1402f9b1c <.text+0x2f8b1c>
1402fa35a:     	movb	$0x1, 0xae(%rbp)
1402fa361:     	leaq	0x5662020(%rip), %r8    # 0x14595c388
1402fa368:     	movq	%r9, %rdx
1402fa36b:     	callq	0x145903b33 <.text+0x5902b33>
1402fa370:     	nop
1402fa371:     	jmp	0x1402fa38a <.text+0x2f938a>
1402fa373:     	movb	$0x1, 0xae(%rbp)
1402fa37a:     	leaq	0x566201f(%rip), %r8    # 0x14595c3a0
1402fa381:     	movq	%r9, %rdx
1402fa384:     	callq	0x145903b33 <.text+0x5902b33>
1402fa389:     	nop
1402fa38a:     	ud2
