
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1459b9b70:     	pushq	%r15
1459b9b72:     	pushq	%r14
1459b9b74:     	pushq	%r13
1459b9b76:     	pushq	%r12
1459b9b78:     	pushq	%rsi
1459b9b79:     	pushq	%rdi
1459b9b7a:     	pushq	%rbp
1459b9b7b:     	pushq	%rbx
1459b9b7c:     	subq	$0x28, %rsp
1459b9b80:     	cmpq	%rdx, %rcx
1459b9b83:     	je	0x1459b9dab <.text+0x59b8dab>
1459b9b89:     	movl	$0x2, %ebx
1459b9b8e:     	movabsq	$0x2800100000000200, %r14 # imm = 0x2800100000000200
1459b9b98:     	jmp	0x1459b9bc0 <.text+0x59b8bc0>
1459b9b9a:     	orb	$-0x40, %r9b
1459b9b9e:     	movb	%r9b, (%r10,%rsi)
1459b9ba2:     	movb	%al, 0x1(%r10,%rsi)
1459b9ba7:     	movl	$0x2, %eax
1459b9bac:     	nopl	(%rax)
1459b9bb0:     	addq	%rsi, %rax
1459b9bb3:     	movq	%rax, 0x10(%r8)
1459b9bb7:     	cmpq	%rdx, %rcx
1459b9bba:     	je	0x1459b9dab <.text+0x59b8dab>
1459b9bc0:     	movzbl	(%rcx), %r9d
1459b9bc4:     	movzbl	%r9b, %edi
1459b9bc8:     	testb	%dil, %dil
1459b9bcb:     	js	0x1459b9bf0 <.text+0x59b8bf0>
1459b9bcd:     	incq	%rcx
1459b9bd0:     	movq	0x10(%r8), %rsi
1459b9bd4:     	cmpl	$0x3d, %edi
1459b9bd7:     	jbe	0x1459b9c70 <.text+0x59b8c70>
1459b9bdd:     	jmp	0x1459b9c94 <.text+0x59b8c94>
1459b9be2:     	nopw	%cs:(%rax,%rax)
1459b9bf0:     	movl	%edi, %eax
1459b9bf2:     	andl	$0x1f, %eax
1459b9bf5:     	movzbl	0x1(%rcx), %r10d
1459b9bfa:     	andl	$0x3f, %r10d
1459b9bfe:     	cmpb	$-0x21, %dil
1459b9c02:     	jbe	0x1459b9c42 <.text+0x59b8c42>
1459b9c04:     	movzbl	0x2(%rcx), %edi
1459b9c08:     	shll	$0x6, %r10d
1459b9c0c:     	andl	$0x3f, %edi
1459b9c0f:     	orl	%r10d, %edi
1459b9c12:     	cmpb	$-0x10, %r9b
1459b9c16:     	jb	0x1459b9c59 <.text+0x59b8c59>
1459b9c18:     	movzbl	0x3(%rcx), %r9d
1459b9c1d:     	addq	$0x4, %rcx
1459b9c21:     	andl	$0x7, %eax
1459b9c24:     	shll	$0x12, %eax
1459b9c27:     	shll	$0x6, %edi
1459b9c2a:     	andl	$0x3f, %r9d
1459b9c2e:     	orl	%edi, %r9d
1459b9c31:     	orl	%eax, %r9d
1459b9c34:     	movl	%r9d, %edi
1459b9c37:     	movq	0x10(%r8), %rsi
1459b9c3b:     	cmpl	$0x3d, %edi
1459b9c3e:     	jbe	0x1459b9c70 <.text+0x59b8c70>
1459b9c40:     	jmp	0x1459b9c94 <.text+0x59b8c94>
1459b9c42:     	addq	$0x2, %rcx
1459b9c46:     	shll	$0x6, %eax
1459b9c49:     	orl	%r10d, %eax
1459b9c4c:     	movl	%eax, %edi
1459b9c4e:     	movq	0x10(%r8), %rsi
1459b9c52:     	cmpl	$0x3d, %edi
1459b9c55:     	jbe	0x1459b9c70 <.text+0x59b8c70>
1459b9c57:     	jmp	0x1459b9c94 <.text+0x59b8c94>
1459b9c59:     	addq	$0x3, %rcx
1459b9c5d:     	shll	$0xc, %eax
1459b9c60:     	orl	%eax, %edi
1459b9c62:     	movq	0x10(%r8), %rsi
1459b9c66:     	cmpl	$0x3d, %edi
1459b9c69:     	ja	0x1459b9c94 <.text+0x59b8c94>
1459b9c6b:     	nopl	(%rax,%rax)
1459b9c70:     	movl	$0x20, %ebp
1459b9c75:     	movl	%edi, %eax
1459b9c77:     	btq	%rax, %r14
1459b9c7b:     	jae	0x1459b9c94 <.text+0x59b8c94>
1459b9c7d:     	cmpq	%rsi, (%r8)
1459b9c80:     	je	0x1459b9ca3 <.text+0x59b8ca3>
1459b9c82:     	movq	0x8(%r8), %rax
1459b9c86:     	movb	%bpl, (%rax,%rsi)
1459b9c8a:     	movl	$0x1, %eax
1459b9c8f:     	jmp	0x1459b9bb0 <.text+0x59b8bb0>
1459b9c94:     	cmpl	$0x80, %edi
1459b9c9a:     	jae	0x1459b9cd7 <.text+0x59b8cd7>
1459b9c9c:     	movl	%edi, %ebp
1459b9c9e:     	cmpq	%rsi, (%r8)
1459b9ca1:     	jne	0x1459b9c82 <.text+0x59b8c82>
1459b9ca3:     	movq	$0x1, 0x20(%rsp)
1459b9cac:     	movq	%r8, %rdi
1459b9caf:     	movl	$0x1, %r8d
1459b9cb5:     	movl	$0x1, %r9d
1459b9cbb:     	movq	%rcx, %r15
1459b9cbe:     	movq	%rdi, %rcx
1459b9cc1:     	movq	%rdx, %r12
1459b9cc4:     	movq	%rsi, %rdx
1459b9cc7:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459b9ccc:     	movq	%r15, %rcx
1459b9ccf:     	movq	%r12, %rdx
1459b9cd2:     	movq	%rdi, %r8
1459b9cd5:     	jmp	0x1459b9c82 <.text+0x59b8c82>
1459b9cd7:     	cmpl	$0x10000, %edi          # imm = 0x10000
1459b9cdd:     	movl	$0x4, %eax
1459b9ce2:     	sbbq	$0x0, %rax
1459b9ce6:     	cmpl	$0x800, %edi            # imm = 0x800
1459b9cec:     	cmovbq	%rbx, %rax
1459b9cf0:     	movq	(%r8), %r9
1459b9cf3:     	subq	%rsi, %r9
1459b9cf6:     	cmpq	%r9, %rax
1459b9cf9:     	ja	0x1459b9d77 <.text+0x59b8d77>
1459b9cfb:     	movl	%edi, %eax
1459b9cfd:     	andb	$0x3f, %al
1459b9cff:     	orb	$-0x80, %al
1459b9d01:     	movl	%edi, %r9d
1459b9d04:     	shrl	$0x6, %r9d
1459b9d08:     	movq	0x8(%r8), %r10
1459b9d0c:     	cmpl	$0x800, %edi            # imm = 0x800
1459b9d12:     	jb	0x1459b9b9a <.text+0x59b8b9a>
1459b9d18:     	andb	$0x3f, %r9b
1459b9d1c:     	orb	$-0x80, %r9b
1459b9d20:     	movl	%edi, %r11d
1459b9d23:     	shrl	$0xc, %r11d
1459b9d27:     	cmpl	$0xffff, %edi           # imm = 0xFFFF
1459b9d2d:     	ja	0x1459b9d4b <.text+0x59b8d4b>
1459b9d2f:     	orb	$-0x20, %r11b
1459b9d33:     	movb	%r11b, (%r10,%rsi)
1459b9d37:     	movb	%r9b, 0x1(%r10,%rsi)
1459b9d3c:     	movb	%al, 0x2(%r10,%rsi)
1459b9d41:     	movl	$0x3, %eax
1459b9d46:     	jmp	0x1459b9bb0 <.text+0x59b8bb0>
1459b9d4b:     	andb	$0x3f, %r11b
1459b9d4f:     	orb	$-0x80, %r11b
1459b9d53:     	shrl	$0x12, %edi
1459b9d56:     	orb	$-0x10, %dil
1459b9d5a:     	movb	%dil, (%r10,%rsi)
1459b9d5e:     	movb	%r11b, 0x1(%r10,%rsi)
1459b9d63:     	movb	%r9b, 0x2(%r10,%rsi)
1459b9d68:     	movb	%al, 0x3(%r10,%rsi)
1459b9d6d:     	movl	$0x4, %eax
1459b9d72:     	jmp	0x1459b9bb0 <.text+0x59b8bb0>
1459b9d77:     	movq	$0x1, 0x20(%rsp)
1459b9d80:     	movl	$0x1, %r9d
1459b9d86:     	movq	%rcx, %r15
1459b9d89:     	movq	%r8, %rcx
1459b9d8c:     	movq	%rdx, %r12
1459b9d8f:     	movq	%rsi, %rdx
1459b9d92:     	movq	%r8, %r13
1459b9d95:     	movq	%rax, %r8
1459b9d98:     	callq	0x145bcb2d0 <.text+0x5bca2d0>
1459b9d9d:     	movq	%r15, %rcx
1459b9da0:     	movq	%r12, %rdx
1459b9da3:     	movq	%r13, %r8
1459b9da6:     	jmp	0x1459b9cfb <.text+0x59b8cfb>
1459b9dab:     	addq	$0x28, %rsp
1459b9daf:     	popq	%rbx
1459b9db0:     	popq	%rbp
1459b9db1:     	popq	%rdi
1459b9db2:     	popq	%rsi
1459b9db3:     	popq	%r12
1459b9db5:     	popq	%r13
1459b9db7:     	popq	%r14
1459b9db9:     	popq	%r15
1459b9dbb:     	retq
