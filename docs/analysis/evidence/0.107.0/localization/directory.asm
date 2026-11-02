
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458d0c40:     	pushq	%rbp
1458d0c41:     	pushq	%rsi
1458d0c42:     	subq	$0xa8, %rsp
1458d0c49:     	leaq	0x80(%rsp), %rbp
1458d0c51:     	movq	$-0x2, 0x20(%rbp)
1458d0c59:     	movq	%rcx, %rsi
1458d0c5c:     	leaq	0x15c32b4(%rip), %rdx   # 0x146e93f17
1458d0c63:     	leaq	-0x38(%rbp), %rcx
1458d0c67:     	movl	$0xe, %r8d
1458d0c6d:     	callq	0x145bb15f0 <.text+0x5bb05f0>
1458d0c72:     	movq	-0x38(%rbp), %rax
1458d0c76:     	cmpq	$-0x1, %rax
1458d0c7a:     	je	0x1458d0cad <.text+0x58cfcad>
1458d0c7c:     	movq	%rax, 0x18(%rbp)
1458d0c80:     	movq	-0x30(%rbp), %rcx
1458d0c84:     	movq	-0x28(%rbp), %rdx
1458d0c88:     	movq	%rcx, 0x10(%rbp)
1458d0c8c:     	callq	0x145b9ead0 <.text+0x5b9dad0>
1458d0c91:     	nop
1458d0c92:     	testq	%rax, %rax
1458d0c95:     	je	0x1458d0d31 <.text+0x58cfd31>
1458d0c9b:     	movq	%rdx, %r8
1458d0c9e:     	leaq	-0x10(%rbp), %rcx
1458d0ca2:     	movq	%rax, %rdx
1458d0ca5:     	callq	0x145bc4210 <.text+0x5bc3210>
1458d0caa:     	nop
1458d0cab:     	jmp	0x1458d0d17 <.text+0x58cfd17>
1458d0cad:     	leaq	0x15c3271(%rip), %rdx   # 0x146e93f25
1458d0cb4:     	leaq	-0x10(%rbp), %rcx
1458d0cb8:     	movl	$0x7, %r8d
1458d0cbe:     	callq	0x145bb15f0 <.text+0x5bb05f0>
1458d0cc3:     	movq	-0x10(%rbp), %rax
1458d0cc7:     	cmpq	$-0x1, %rax
1458d0ccb:     	jne	0x1458d0ced <.text+0x58cfced>
1458d0ccd:     	leaq	0x1318b9b(%rip), %rdx   # 0x146be986f
1458d0cd4:     	leaq	-0x10(%rbp), %rcx
1458d0cd8:     	movl	$0xd, %r8d
1458d0cde:     	callq	0x145bb15f0 <.text+0x5bb05f0>
1458d0ce3:     	movq	-0x10(%rbp), %rax
1458d0ce7:     	cmpq	$-0x1, %rax
1458d0ceb:     	je	0x1458d0d5d <.text+0x58cfd5d>
1458d0ced:     	movq	%rax, 0x18(%rbp)
1458d0cf1:     	movq	-0x8(%rbp), %rdx
1458d0cf5:     	movq	(%rbp), %r8
1458d0cf9:     	movq	$0xd, 0x20(%rsp)
1458d0d02:     	leaq	0x15c3223(%rip), %r9    # 0x146e93f2c
1458d0d09:     	leaq	-0x10(%rbp), %rcx
1458d0d0d:     	movq	%rdx, 0x10(%rbp)
1458d0d11:     	callq	0x145b9e9a0 <.text+0x5b9d9a0>
1458d0d16:     	nop
1458d0d17:     	movups	-0x10(%rbp), %xmm0
1458d0d1b:     	movups	(%rbp), %xmm1
1458d0d1f:     	movups	%xmm1, 0x10(%rsi)
1458d0d23:     	movups	%xmm0, (%rsi)
1458d0d26:     	movq	0x18(%rbp), %rdx
1458d0d2a:     	testq	%rdx, %rdx
1458d0d2d:     	jne	0x1458d0d41 <.text+0x58cfd41>
1458d0d2f:     	jmp	0x1458d0d50 <.text+0x58cfd50>
1458d0d31:     	movq	$-0x1, (%rsi)
1458d0d38:     	movq	0x18(%rbp), %rdx
1458d0d3c:     	testq	%rdx, %rdx
1458d0d3f:     	je	0x1458d0d50 <.text+0x58cfd50>
1458d0d41:     	movl	$0x1, %r8d
1458d0d47:     	movq	0x10(%rbp), %rcx
1458d0d4b:     	callq	0x1400021d0 <.text+0x11d0>
1458d0d50:     	movq	%rsi, %rax
1458d0d53:     	addq	$0xa8, %rsp
1458d0d5a:     	popq	%rsi
1458d0d5b:     	popq	%rbp
1458d0d5c:     	retq
1458d0d5d:     	leaq	0x1318a8d(%rip), %rdx   # 0x146be97f1
1458d0d64:     	leaq	-0x58(%rbp), %rcx
1458d0d68:     	movl	$0x4, %r8d
1458d0d6e:     	callq	0x145bb15f0 <.text+0x5bb05f0>
1458d0d73:     	movq	-0x58(%rbp), %rax
1458d0d77:     	cmpq	$-0x1, %rax
1458d0d7b:     	je	0x1458d0e1c <.text+0x58cfe1c>
1458d0d81:     	movq	%rax, 0x18(%rbp)
1458d0d85:     	movq	-0x50(%rbp), %rdx
1458d0d89:     	movq	-0x48(%rbp), %r8
1458d0d8d:     	movq	$0x6, 0x20(%rsp)
1458d0d96:     	leaq	0x1318a49(%rip), %r9    # 0x146be97e6
1458d0d9d:     	leaq	-0x10(%rbp), %rcx
1458d0da1:     	movq	%rdx, 0x10(%rbp)
1458d0da5:     	callq	0x145b9e9a0 <.text+0x5b9d9a0>
1458d0daa:     	nop
1458d0dab:     	movq	-0x8(%rbp), %rdx
1458d0daf:     	movq	(%rbp), %r8
1458d0db3:     	movq	$0x5, 0x20(%rsp)
1458d0dbc:     	leaq	0x1318a29(%rip), %r9    # 0x146be97ec
1458d0dc3:     	leaq	-0x38(%rbp), %rcx
1458d0dc7:     	movq	%rdx, -0x18(%rbp)
1458d0dcb:     	callq	0x145b9e9a0 <.text+0x5b9d9a0>
1458d0dd0:     	nop
1458d0dd1:     	movq	-0x10(%rbp), %rdx
1458d0dd5:     	testq	%rdx, %rdx
1458d0dd8:     	je	0x1458d0de9 <.text+0x58cfde9>
1458d0dda:     	movl	$0x1, %r8d
1458d0de0:     	movq	-0x18(%rbp), %rcx
1458d0de4:     	callq	0x1400021d0 <.text+0x11d0>
1458d0de9:     	movq	0x18(%rbp), %rdx
1458d0ded:     	testq	%rdx, %rdx
1458d0df0:     	je	0x1458d0e01 <.text+0x58cfe01>
1458d0df2:     	movl	$0x1, %r8d
1458d0df8:     	movq	0x10(%rbp), %rcx
1458d0dfc:     	callq	0x1400021d0 <.text+0x11d0>
1458d0e01:     	movq	-0x38(%rbp), %rax
1458d0e05:     	cmpq	$-0x1, %rax
1458d0e09:     	je	0x1458d0e1c <.text+0x58cfe1c>
1458d0e0b:     	movq	%rax, 0x18(%rbp)
1458d0e0f:     	movq	-0x30(%rbp), %rdx
1458d0e13:     	movq	-0x28(%rbp), %r8
1458d0e17:     	jmp	0x1458d0cf9 <.text+0x58cfcf9>
1458d0e1c:     	movq	$-0x1, (%rsi)
1458d0e23:     	jmp	0x1458d0d50 <.text+0x58cfd50>
