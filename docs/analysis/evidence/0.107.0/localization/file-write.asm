
installed-game/AzerothSurvivors.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458d0a00:     	pushq	%rbp
1458d0a01:     	pushq	%rsi
1458d0a02:     	pushq	%rdi
1458d0a03:     	pushq	%rbx
1458d0a04:     	subq	$0x98, %rsp
1458d0a0b:     	leaq	0x80(%rsp), %rbp
1458d0a13:     	movq	$-0x2, 0x10(%rbp)
1458d0a1b:     	movq	%r9, %rsi
1458d0a1e:     	movq	%r8, %rdi
1458d0a21:     	movq	%rcx, -0x50(%rbp)
1458d0a25:     	movq	%rdx, -0x48(%rbp)
1458d0a29:     	leaq	-0x18(%rbp), %rcx
1458d0a2d:     	callq	0x1458d0c40 <.text+0x58cfc40>
1458d0a32:     	movq	-0x18(%rbp), %rax
1458d0a36:     	cmpq	$-0x1, %rax
1458d0a3a:     	je	0x1458d0b67 <.text+0x58cfb67>
1458d0a40:     	movq	%rax, -0x20(%rbp)
1458d0a44:     	movq	-0x10(%rbp), %rdx
1458d0a48:     	movq	-0x8(%rbp), %rbx
1458d0a4c:     	movb	$0x1, -0x18(%rbp)
1458d0a50:     	leaq	-0x18(%rbp), %rcx
1458d0a54:     	movq	%rdx, -0x28(%rbp)
1458d0a58:     	movq	%rbx, %r8
1458d0a5b:     	callq	0x145ba5da0 <.text+0x5ba4da0>
1458d0a60:     	nop
1458d0a61:     	testq	%rax, %rax
1458d0a64:     	je	0x1458d0a8d <.text+0x58cfa8d>
1458d0a66:     	movl	%eax, %ecx
1458d0a68:     	andl	$0x3, %ecx
1458d0a6b:     	leal	-0x2(%rcx), %edx
1458d0a6e:     	cmpl	$0x2, %edx
1458d0a71:     	jb	0x1458d0a8d <.text+0x58cfa8d>
1458d0a73:     	testq	%rcx, %rcx
1458d0a76:     	je	0x1458d0a8d <.text+0x58cfa8d>
1458d0a78:     	decq	%rax
1458d0a7b:     	leaq	-0x10(%rbp), %rcx
1458d0a7f:     	movq	%rax, -0x10(%rbp)
1458d0a83:     	movb	$0x3, -0x18(%rbp)
1458d0a87:     	callq	0x145bd7420 <.text+0x5bd6420>
1458d0a8c:     	nop
1458d0a8d:     	leaq	-0x50(%rbp), %rax
1458d0a91:     	movq	%rax, -0x18(%rbp)
1458d0a95:     	leaq	-0x58ce9dc(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458d0a9c:     	movq	%rax, -0x10(%rbp)
1458d0aa0:     	leaq	0x15c3469(%rip), %rdx   # 0x146e93f10
1458d0aa7:     	leaq	-0x40(%rbp), %rcx
1458d0aab:     	leaq	-0x18(%rbp), %r8
1458d0aaf:     	callq	0x145bc4a90 <.text+0x5bc3a90>
1458d0ab4:     	nop
1458d0ab5:     	movq	-0x38(%rbp), %r9
1458d0ab9:     	movq	-0x30(%rbp), %rax
1458d0abd:     	movq	%rax, 0x20(%rsp)
1458d0ac2:     	leaq	-0x18(%rbp), %rcx
1458d0ac6:     	movq	-0x28(%rbp), %rdx
1458d0aca:     	movq	%rbx, %r8
1458d0acd:     	movq	%r9, 0x8(%rbp)
1458d0ad1:     	callq	0x145b9e9a0 <.text+0x5b9d9a0>
1458d0ad6:     	nop
1458d0ad7:     	movq	-0x40(%rbp), %rdx
1458d0adb:     	testq	%rdx, %rdx
1458d0ade:     	je	0x1458d0aef <.text+0x58cfaef>
1458d0ae0:     	movl	$0x1, %r8d
1458d0ae6:     	movq	0x8(%rbp), %rcx
1458d0aea:     	callq	0x1400021d0 <.text+0x11d0>
1458d0aef:     	movq	-0x10(%rbp), %rcx
1458d0af3:     	movq	-0x8(%rbp), %rdx
1458d0af7:     	movq	%rcx, 0x8(%rbp)
1458d0afb:     	movq	%rdi, %r8
1458d0afe:     	movq	%rsi, %r9
1458d0b01:     	callq	0x145bb53b0 <.text+0x5bb43b0>
1458d0b06:     	nop
1458d0b07:     	movq	%rax, %rsi
1458d0b0a:     	movq	-0x18(%rbp), %rdx
1458d0b0e:     	testq	%rdx, %rdx
1458d0b11:     	je	0x1458d0b22 <.text+0x58cfb22>
1458d0b13:     	movl	$0x1, %r8d
1458d0b19:     	movq	0x8(%rbp), %rcx
1458d0b1d:     	callq	0x1400021d0 <.text+0x11d0>
1458d0b22:     	testq	%rsi, %rsi
1458d0b25:     	je	0x1458d0b4e <.text+0x58cfb4e>
1458d0b27:     	movl	%esi, %eax
1458d0b29:     	andl	$0x3, %eax
1458d0b2c:     	leal	-0x2(%rax), %ecx
1458d0b2f:     	cmpl	$0x2, %ecx
1458d0b32:     	jb	0x1458d0b4e <.text+0x58cfb4e>
1458d0b34:     	testq	%rax, %rax
1458d0b37:     	je	0x1458d0b4e <.text+0x58cfb4e>
1458d0b39:     	decq	%rsi
1458d0b3c:     	leaq	-0x10(%rbp), %rcx
1458d0b40:     	movq	%rsi, -0x10(%rbp)
1458d0b44:     	movb	$0x3, -0x18(%rbp)
1458d0b48:     	callq	0x145bd7420 <.text+0x5bd6420>
1458d0b4d:     	nop
1458d0b4e:     	movq	-0x20(%rbp), %rdx
1458d0b52:     	testq	%rdx, %rdx
1458d0b55:     	je	0x1458d0b67 <.text+0x58cfb67>
1458d0b57:     	movl	$0x1, %r8d
1458d0b5d:     	movq	-0x28(%rbp), %rcx
1458d0b61:     	callq	0x1400021d0 <.text+0x11d0>
1458d0b66:     	nop
1458d0b67:     	addq	$0x98, %rsp
1458d0b6e:     	popq	%rbx
1458d0b6f:     	popq	%rdi
1458d0b70:     	popq	%rsi
1458d0b71:     	popq	%rbp
1458d0b72:     	retq
