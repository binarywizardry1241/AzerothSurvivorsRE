Disassembly of section .text:

0000000140001000 <.text>:
1458ddb50:     	pushq	%rbp
1458ddb51:     	pushq	%rsi
1458ddb52:     	pushq	%rdi
1458ddb53:     	subq	$0xd0, %rsp
1458ddb5a:     	leaq	0x80(%rsp), %rbp
1458ddb62:     	movq	$-0x2, 0x48(%rbp)
1458ddb6a:     	movq	%rcx, %rsi
1458ddb6d:     	movq	%rdx, -0x30(%rbp)
1458ddb71:     	movq	%r8, -0x28(%rbp)
1458ddb75:     	leaq	0x10(%rbp), %rcx
1458ddb79:     	callq	0x1458dcb00 <.text+0x58dbb00>
1458ddb7e:     	movq	0x10(%rbp), %rax
1458ddb82:     	cmpq	$-0x1, %rax
1458ddb86:     	je	0x1458ddc44 <.text+0x58dcc44>
1458ddb8c:     	movq	%rax, 0x38(%rbp)
1458ddb90:     	movq	0x18(%rbp), %rax
1458ddb94:     	movq	%rax, 0x30(%rbp)
1458ddb98:     	movq	0x20(%rbp), %rdi
1458ddb9c:     	leaq	-0x30(%rbp), %rax
1458ddba0:     	movq	%rax, 0x10(%rbp)
1458ddba4:     	leaq	-0x58dbaeb(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
1458ddbab:     	movq	%rax, 0x18(%rbp)
1458ddbaf:     	leaq	0x157cb2a(%rip), %rdx   # 0x146e5a6e0
1458ddbb6:     	leaq	-0x20(%rbp), %rcx
1458ddbba:     	leaq	0x10(%rbp), %r8
1458ddbbe:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
1458ddbc3:     	nop
1458ddbc4:     	movq	-0x18(%rbp), %r9
1458ddbc8:     	movq	-0x10(%rbp), %rax
1458ddbcc:     	movq	%rax, 0x20(%rsp)
1458ddbd1:     	leaq	-0x50(%rbp), %rcx
1458ddbd5:     	movq	0x30(%rbp), %rdx
1458ddbd9:     	movq	%rdi, %r8
1458ddbdc:     	movq	%r9, 0x40(%rbp)
1458ddbe0:     	callq	0x145b763e0 <.text+0x5b753e0>
1458ddbe5:     	nop
1458ddbe6:     	movq	-0x20(%rbp), %rdx
1458ddbea:     	testq	%rdx, %rdx
1458ddbed:     	je	0x1458ddbfe <.text+0x58dcbfe>
1458ddbef:     	movl	$0x1, %r8d
1458ddbf5:     	movq	0x40(%rbp), %rcx
1458ddbf9:     	callq	0x1400021d0 <.text+0x11d0>
1458ddbfe:     	movq	-0x48(%rbp), %rdx
1458ddc02:     	movq	-0x40(%rbp), %r8
1458ddc06:     	leaq	-0x8(%rbp), %rcx
1458ddc0a:     	movq	%rdx, 0x40(%rbp)
1458ddc0e:     	callq	0x145b8c930 <.text+0x5b8b930>
1458ddc13:     	nop
1458ddc14:     	movq	-0x50(%rbp), %rdx
1458ddc18:     	testq	%rdx, %rdx
1458ddc1b:     	je	0x1458ddc2c <.text+0x58dcc2c>
1458ddc1d:     	movl	$0x1, %r8d
1458ddc23:     	movq	0x40(%rbp), %rcx
1458ddc27:     	callq	0x1400021d0 <.text+0x11d0>
1458ddc2c:     	cmpq	$-0x1, -0x8(%rbp)
1458ddc31:     	je	0x1458ddc4d <.text+0x58dcc4d>
1458ddc33:     	movq	0x8(%rbp), %rax
1458ddc37:     	movq	%rax, 0x10(%rsi)
1458ddc3b:     	movups	-0x8(%rbp), %xmm0
1458ddc3f:     	movups	%xmm0, (%rsi)
1458ddc42:     	jmp	0x1458ddc7f <.text+0x58dcc7f>
1458ddc44:     	movq	$-0x1, (%rsi)
1458ddc4b:     	jmp	0x1458ddc97 <.text+0x58dcc97>
1458ddc4d:     	movq	$-0x1, (%rsi)
1458ddc54:     	movq	(%rbp), %rax
1458ddc58:     	movl	%eax, %ecx
1458ddc5a:     	andl	$0x3, %ecx
1458ddc5d:     	leal	-0x2(%rcx), %edx
1458ddc60:     	cmpl	$0x2, %edx
1458ddc63:     	jb	0x1458ddc7f <.text+0x58dcc7f>
1458ddc65:     	testq	%rcx, %rcx
1458ddc68:     	je	0x1458ddc7f <.text+0x58dcc7f>
1458ddc6a:     	decq	%rax
1458ddc6d:     	leaq	0x18(%rbp), %rcx
1458ddc71:     	movq	%rax, 0x18(%rbp)
1458ddc75:     	movb	$0x3, 0x10(%rbp)
1458ddc79:     	callq	0x145baee60 <.text+0x5bade60>
1458ddc7e:     	nop
1458ddc7f:     	movq	0x38(%rbp), %rdx
1458ddc83:     	testq	%rdx, %rdx
1458ddc86:     	je	0x1458ddc97 <.text+0x58dcc97>
1458ddc88:     	movl	$0x1, %r8d
1458ddc8e:     	movq	0x30(%rbp), %rcx
1458ddc92:     	callq	0x1400021d0 <.text+0x11d0>
1458ddc97:     	movq	%rsi, %rax
1458ddc9a:     	addq	$0xd0, %rsp
1458ddca1:     	popq	%rdi
1458ddca2:     	popq	%rsi
1458ddca3:     	popq	%rbp
1458ddca4:     	retq
