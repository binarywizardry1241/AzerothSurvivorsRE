
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458d1c90:     	pushq	%rbp
1458d1c91:     	pushq	%rsi
1458d1c92:     	pushq	%rdi
1458d1c93:     	subq	$0xd0, %rsp
1458d1c9a:     	leaq	0x80(%rsp), %rbp
1458d1ca2:     	movq	$-0x2, 0x48(%rbp)
1458d1caa:     	movq	%rcx, %rsi
1458d1cad:     	movq	%rdx, -0x30(%rbp)
1458d1cb1:     	movq	%r8, -0x28(%rbp)
1458d1cb5:     	leaq	0x10(%rbp), %rcx
1458d1cb9:     	callq	0x1458d0c40 <.text+0x58cfc40>
1458d1cbe:     	movq	0x10(%rbp), %rax
1458d1cc2:     	cmpq	$-0x1, %rax
1458d1cc6:     	je	0x1458d1d84 <.text+0x58d0d84>
1458d1ccc:     	movq	%rax, 0x38(%rbp)
1458d1cd0:     	movq	0x18(%rbp), %rax
1458d1cd4:     	movq	%rax, 0x30(%rbp)
1458d1cd8:     	movq	0x20(%rbp), %rdi
1458d1cdc:     	leaq	-0x30(%rbp), %rax
1458d1ce0:     	movq	%rax, 0x10(%rbp)
1458d1ce4:     	leaq	-0x58cfc2b(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458d1ceb:     	movq	%rax, 0x18(%rbp)
1458d1cef:     	leaq	0x15c221a(%rip), %rdx   # 0x146e93f10
1458d1cf6:     	leaq	-0x20(%rbp), %rcx
1458d1cfa:     	leaq	0x10(%rbp), %r8
1458d1cfe:     	callq	0x145bc4a90 <.text+0x5bc3a90>
1458d1d03:     	nop
1458d1d04:     	movq	-0x18(%rbp), %r9
1458d1d08:     	movq	-0x10(%rbp), %rax
1458d1d0c:     	movq	%rax, 0x20(%rsp)
1458d1d11:     	leaq	-0x50(%rbp), %rcx
1458d1d15:     	movq	0x30(%rbp), %rdx
1458d1d19:     	movq	%rdi, %r8
1458d1d1c:     	movq	%r9, 0x40(%rbp)
1458d1d20:     	callq	0x145b9e9a0 <.text+0x5b9d9a0>
1458d1d25:     	nop
1458d1d26:     	movq	-0x20(%rbp), %rdx
1458d1d2a:     	testq	%rdx, %rdx
1458d1d2d:     	je	0x1458d1d3e <.text+0x58d0d3e>
1458d1d2f:     	movl	$0x1, %r8d
1458d1d35:     	movq	0x40(%rbp), %rcx
1458d1d39:     	callq	0x1400021d0 <.text+0x11d0>
1458d1d3e:     	movq	-0x48(%rbp), %rdx
1458d1d42:     	movq	-0x40(%rbp), %r8
1458d1d46:     	leaq	-0x8(%rbp), %rcx
1458d1d4a:     	movq	%rdx, 0x40(%rbp)
1458d1d4e:     	callq	0x145bb4ef0 <.text+0x5bb3ef0>
1458d1d53:     	nop
1458d1d54:     	movq	-0x50(%rbp), %rdx
1458d1d58:     	testq	%rdx, %rdx
1458d1d5b:     	je	0x1458d1d6c <.text+0x58d0d6c>
1458d1d5d:     	movl	$0x1, %r8d
1458d1d63:     	movq	0x40(%rbp), %rcx
1458d1d67:     	callq	0x1400021d0 <.text+0x11d0>
1458d1d6c:     	cmpq	$-0x1, -0x8(%rbp)
1458d1d71:     	je	0x1458d1d8d <.text+0x58d0d8d>
1458d1d73:     	movq	0x8(%rbp), %rax
1458d1d77:     	movq	%rax, 0x10(%rsi)
1458d1d7b:     	movups	-0x8(%rbp), %xmm0
1458d1d7f:     	movups	%xmm0, (%rsi)
1458d1d82:     	jmp	0x1458d1dbf <.text+0x58d0dbf>
1458d1d84:     	movq	$-0x1, (%rsi)
1458d1d8b:     	jmp	0x1458d1dd7 <.text+0x58d0dd7>
1458d1d8d:     	movq	$-0x1, (%rsi)
1458d1d94:     	movq	(%rbp), %rax
1458d1d98:     	movl	%eax, %ecx
1458d1d9a:     	andl	$0x3, %ecx
1458d1d9d:     	leal	-0x2(%rcx), %edx
1458d1da0:     	cmpl	$0x2, %edx
1458d1da3:     	jb	0x1458d1dbf <.text+0x58d0dbf>
1458d1da5:     	testq	%rcx, %rcx
1458d1da8:     	je	0x1458d1dbf <.text+0x58d0dbf>
1458d1daa:     	decq	%rax
1458d1dad:     	leaq	0x18(%rbp), %rcx
1458d1db1:     	movq	%rax, 0x18(%rbp)
1458d1db5:     	movb	$0x3, 0x10(%rbp)
1458d1db9:     	callq	0x145bd7420 <.text+0x5bd6420>
1458d1dbe:     	nop
1458d1dbf:     	movq	0x38(%rbp), %rdx
1458d1dc3:     	testq	%rdx, %rdx
1458d1dc6:     	je	0x1458d1dd7 <.text+0x58d0dd7>
1458d1dc8:     	movl	$0x1, %r8d
1458d1dce:     	movq	0x30(%rbp), %rcx
1458d1dd2:     	callq	0x1400021d0 <.text+0x11d0>
1458d1dd7:     	movq	%rsi, %rax
1458d1dda:     	addq	$0xd0, %rsp
1458d1de1:     	popq	%rdi
1458d1de2:     	popq	%rsi
1458d1de3:     	popq	%rbp
1458d1de4:     	retq
