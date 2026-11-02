
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145534b20:     	pushq	%rbp
145534b21:     	pushq	%r15
145534b23:     	pushq	%r14
145534b25:     	pushq	%r13
145534b27:     	pushq	%r12
145534b29:     	pushq	%rsi
145534b2a:     	pushq	%rdi
145534b2b:     	pushq	%rbx
145534b2c:     	subq	$0xe8, %rsp
145534b33:     	leaq	0x80(%rsp), %rbp
145534b3b:     	movq	$-0x2, 0x60(%rbp)
145534b43:     	movq	%rdx, %r14
145534b46:     	movq	%rcx, %rsi
145534b49:     	leaq	0x88(%rdx), %rax
145534b50:     	movq	%rax, -0x50(%rbp)
145534b54:     	cmpl	$0x1, (%rdx)
145534b57:     	jne	0x145534ba1 <.text+0x5533ba1>
145534b59:     	movq	0x8(%r14), %rdx
145534b5d:     	movq	0x10(%r14), %rax
145534b61:     	movq	0x88(%r14), %rcx
145534b68:     	nopl	(%rax,%rax)
145534b70:     	cmpq	%rdx, %rax
145534b73:     	je	0x145534ba1 <.text+0x5533ba1>
145534b75:     	leaq	0x1(%rdx), %r8
145534b79:     	movq	%r8, 0x8(%r14)
145534b7d:     	movq	0x18(%r14,%rdx,8), %rdi
145534b82:     	movq	0x10(%rcx), %rdx
145534b86:     	cmpq	%rdx, %rdi
145534b89:     	jae	0x145534de0 <.text+0x5533de0>
145534b8f:     	movq	0x8(%rcx), %rdx
145534b93:     	cmpb	$0x0, (%rdx,%rdi)
145534b97:     	movq	%r8, %rdx
145534b9a:     	jne	0x145534b70 <.text+0x5533b70>
145534b9c:     	jmp	0x145534c23 <.text+0x5533c23>
145534ba1:     	movq	$0x0, (%r14)
145534ba8:     	cmpq	$0x0, 0x70(%r14)
145534bad:     	je	0x145534bc8 <.text+0x5533bc8>
145534baf:     	leaq	0x70(%r14), %rcx
145534bb3:     	leaq	-0x50(%rbp), %rdx
145534bb7:     	movq	%r14, %r8
145534bba:     	callq	0x14554b380 <.text+0x554a380>
145534bbf:     	testb	$0x1, %al
145534bc1:     	je	0x145534bc8 <.text+0x5533bc8>
145534bc3:     	movq	%rdx, %rdi
145534bc6:     	jmp	0x145534c23 <.text+0x5533c23>
145534bc8:     	movq	$0x0, (%r14)
145534bcf:     	cmpl	$0x1, 0x38(%r14)
145534bd4:     	jne	0x145534d8e <.text+0x5533d8e>
145534bda:     	movq	0x40(%r14), %rdx
145534bde:     	movq	0x48(%r14), %rax
145534be2:     	movq	-0x50(%rbp), %rcx
145534be6:     	nopw	%cs:(%rax,%rax)
145534bf0:     	cmpq	%rdx, %rax
145534bf3:     	je	0x145534d8e <.text+0x5533d8e>
145534bf9:     	leaq	0x1(%rdx), %r8
145534bfd:     	movq	%r8, 0x40(%r14)
145534c01:     	movq	0x50(%r14,%rdx,8), %rdi
145534c06:     	movq	(%rcx), %r9
145534c09:     	movq	0x10(%r9), %rdx
145534c0d:     	cmpq	%rdx, %rdi
145534c10:     	jae	0x145534de0 <.text+0x5533de0>
145534c16:     	movq	0x8(%r9), %rdx
145534c1a:     	cmpb	$0x0, (%rdx,%rdi)
145534c1e:     	movq	%r8, %rdx
145534c21:     	jne	0x145534bf0 <.text+0x5533bf0>
145534c23:     	callq	0x140002200 <.text+0x1200>
145534c28:     	movl	$0x20, %ecx
145534c2d:     	movl	$0x8, %edx
145534c32:     	callq	0x1400021c0 <.text+0x11c0>
145534c37:     	testq	%rax, %rax
145534c3a:     	je	0x145534df1 <.text+0x5533df1>
145534c40:     	movq	%rax, %rbx
145534c43:     	movq	%rdi, (%rax)
145534c46:     	movq	$0x4, 0x48(%rbp)
145534c4e:     	movq	%rax, 0x50(%rbp)
145534c52:     	movq	$0x1, 0x58(%rbp)
145534c5a:     	leaq	-0x50(%rbp), %rdi
145534c5e:     	movl	$0x90, %r8d
145534c64:     	movq	%rdi, %rcx
145534c67:     	movq	%r14, %rdx
145534c6a:     	callq	0x1457731ed <.text+0x57721ed>
145534c6f:     	leaq	0x38(%rbp), %r15
145534c73:     	movl	$0x1, %r14d
145534c79:     	leaq	0x40(%rbp), %r12
145534c7d:     	jmp	0x145534c8f <.text+0x5533c8f>
145534c7f:     	nop
145534c80:     	movq	0x50(%rbp), %rbx
145534c84:     	movq	%r13, (%rbx,%r14,8)
145534c88:     	incq	%r14
145534c8b:     	movq	%r14, 0x58(%rbp)
145534c8f:     	movq	%r15, 0x40(%rbp)
145534c93:     	cmpl	$0x1, -0x50(%rbp)
145534c97:     	jne	0x145534ce0 <.text+0x5533ce0>
145534c99:     	movq	-0x48(%rbp), %rdx
145534c9d:     	movq	-0x40(%rbp), %rax
145534ca1:     	movq	0x38(%rbp), %rcx
145534ca5:     	nopw	%cs:(%rax,%rax)
145534cb0:     	cmpq	%rdx, %rax
145534cb3:     	je	0x145534ce0 <.text+0x5533ce0>
145534cb5:     	leaq	0x1(%rdx), %r8
145534cb9:     	movq	%r8, -0x48(%rbp)
145534cbd:     	movq	-0x38(%rbp,%rdx,8), %r13
145534cc2:     	movq	0x10(%rcx), %rdx
145534cc6:     	cmpq	%rdx, %r13
145534cc9:     	jae	0x145534dce <.text+0x5533dce>
145534ccf:     	movq	0x8(%rcx), %rdx
145534cd3:     	cmpb	$0x0, (%rdx,%r13)
145534cd8:     	movq	%r8, %rdx
145534cdb:     	jne	0x145534cb0 <.text+0x5533cb0>
145534cdd:     	jmp	0x145534d4c <.text+0x5533d4c>
145534cdf:     	nop
145534ce0:     	movq	$0x0, -0x50(%rbp)
145534ce8:     	cmpq	$0x0, 0x20(%rbp)
145534ced:     	je	0x145534d06 <.text+0x5533d06>
145534cef:     	leaq	0x20(%rbp), %rcx
145534cf3:     	movq	%r12, %rdx
145534cf6:     	movq	%rdi, %r8
145534cf9:     	callq	0x14554b380 <.text+0x554a380>
145534cfe:     	nop
145534cff:     	movq	%rdx, %r13
145534d02:     	testb	$0x1, %al
145534d04:     	jne	0x145534d4c <.text+0x5533d4c>
145534d06:     	movq	$0x0, -0x50(%rbp)
145534d0e:     	cmpl	$0x1, -0x18(%rbp)
145534d12:     	jne	0x145534d7d <.text+0x5533d7d>
145534d14:     	movq	-0x10(%rbp), %rdx
145534d18:     	movq	-0x8(%rbp), %rax
145534d1c:     	movq	0x40(%rbp), %rcx
145534d20:     	cmpq	%rdx, %rax
145534d23:     	je	0x145534d7d <.text+0x5533d7d>
145534d25:     	leaq	0x1(%rdx), %r8
145534d29:     	movq	%r8, -0x10(%rbp)
145534d2d:     	movq	(%rbp,%rdx,8), %r13
145534d32:     	movq	(%rcx), %r9
145534d35:     	movq	0x10(%r9), %rdx
145534d39:     	cmpq	%rdx, %r13
145534d3c:     	jae	0x145534dbc <.text+0x5533dbc>
145534d3e:     	movq	0x8(%r9), %rdx
145534d42:     	cmpb	$0x0, (%rdx,%r13)
145534d47:     	movq	%r8, %rdx
145534d4a:     	jne	0x145534d20 <.text+0x5533d20>
145534d4c:     	cmpq	0x48(%rbp), %r14
145534d50:     	jne	0x145534c84 <.text+0x5533c84>
145534d56:     	movq	$0x8, 0x20(%rsp)
145534d5f:     	movl	$0x1, %r8d
145534d65:     	movl	$0x8, %r9d
145534d6b:     	leaq	0x48(%rbp), %rcx
145534d6f:     	movq	%r14, %rdx
145534d72:     	callq	0x1457744b0 <.text+0x57734b0>
145534d77:     	nop
145534d78:     	jmp	0x145534c80 <.text+0x5533c80>
145534d7d:     	movq	0x58(%rbp), %rax
145534d81:     	movq	%rax, 0x10(%rsi)
145534d85:     	movups	0x48(%rbp), %xmm0
145534d89:     	movups	%xmm0, (%rsi)
145534d8c:     	jmp	0x145534da5 <.text+0x5533da5>
145534d8e:     	movq	$0x0, (%rsi)
145534d95:     	movq	$0x8, 0x8(%rsi)
145534d9d:     	movq	$0x0, 0x10(%rsi)
145534da5:     	movq	%rsi, %rax
145534da8:     	addq	$0xe8, %rsp
145534daf:     	popq	%rbx
145534db0:     	popq	%rdi
145534db1:     	popq	%rsi
145534db2:     	popq	%r12
145534db4:     	popq	%r13
145534db6:     	popq	%r14
145534db8:     	popq	%r15
145534dba:     	popq	%rbp
145534dbb:     	retq
145534dbc:     	leaq	0x17ffd05(%rip), %r8    # 0x146d34ac8
145534dc3:     	movq	%r13, %rcx
145534dc6:     	callq	0x145903b33 <.text+0x5902b33>
145534dcb:     	nop
145534dcc:     	jmp	0x145534dde <.text+0x5533dde>
145534dce:     	leaq	0x17ffcf3(%rip), %r8    # 0x146d34ac8
145534dd5:     	movq	%r13, %rcx
145534dd8:     	callq	0x145903b33 <.text+0x5902b33>
145534ddd:     	nop
145534dde:     	ud2
145534de0:     	leaq	0x17ffce1(%rip), %r8    # 0x146d34ac8
145534de7:     	movq	%rdi, %rcx
145534dea:     	callq	0x145903b33 <.text+0x5902b33>
145534def:     	ud2
145534df1:     	movl	$0x8, %ecx
145534df6:     	movl	$0x20, %edx
145534dfb:     	callq	0x14590379b <.text+0x590279b>
145534e00:     	ud2
