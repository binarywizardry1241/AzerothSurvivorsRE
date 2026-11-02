Disassembly of section .text:

0000000140001000 <.text>:
1458dcb00:     	pushq	%rbp
1458dcb01:     	pushq	%rsi
1458dcb02:     	subq	$0xa8, %rsp
1458dcb09:     	leaq	0x80(%rsp), %rbp
1458dcb11:     	movq	$-0x2, 0x20(%rbp)
1458dcb19:     	movq	%rcx, %rsi
1458dcb1c:     	leaq	0x157dbc4(%rip), %rdx   # 0x146e5a6e7
1458dcb23:     	leaq	-0x38(%rbp), %rcx
1458dcb27:     	movl	$0xe, %r8d
1458dcb2d:     	callq	0x145b89030 <.text+0x5b88030>
1458dcb32:     	movq	-0x38(%rbp), %rax
1458dcb36:     	cmpq	$-0x1, %rax
1458dcb3a:     	je	0x1458dcb6d <.text+0x58dbb6d>
1458dcb3c:     	movq	%rax, 0x18(%rbp)
1458dcb40:     	movq	-0x30(%rbp), %rcx
1458dcb44:     	movq	-0x28(%rbp), %rdx
1458dcb48:     	movq	%rcx, 0x10(%rbp)
1458dcb4c:     	callq	0x145b76510 <.text+0x5b75510>
1458dcb51:     	nop
1458dcb52:     	testq	%rax, %rax
1458dcb55:     	je	0x1458dcbf1 <.text+0x58dbbf1>
1458dcb5b:     	movq	%rdx, %r8
1458dcb5e:     	leaq	-0x10(%rbp), %rcx
1458dcb62:     	movq	%rax, %rdx
1458dcb65:     	callq	0x145b9bc50 <.text+0x5b9ac50>
1458dcb6a:     	nop
1458dcb6b:     	jmp	0x1458dcbd7 <.text+0x58dbbd7>
1458dcb6d:     	leaq	0x157db81(%rip), %rdx   # 0x146e5a6f5
1458dcb74:     	leaq	-0x10(%rbp), %rcx
1458dcb78:     	movl	$0x7, %r8d
1458dcb7e:     	callq	0x145b89030 <.text+0x5b88030>
1458dcb83:     	movq	-0x10(%rbp), %rax
1458dcb87:     	cmpq	$-0x1, %rax
1458dcb8b:     	jne	0x1458dcbad <.text+0x58dbbad>
1458dcb8d:     	leaq	0x12e6219(%rip), %rdx   # 0x146bc2dad
1458dcb94:     	leaq	-0x10(%rbp), %rcx
1458dcb98:     	movl	$0xd, %r8d
1458dcb9e:     	callq	0x145b89030 <.text+0x5b88030>
1458dcba3:     	movq	-0x10(%rbp), %rax
1458dcba7:     	cmpq	$-0x1, %rax
1458dcbab:     	je	0x1458dcc1d <.text+0x58dbc1d>
1458dcbad:     	movq	%rax, 0x18(%rbp)
1458dcbb1:     	movq	-0x8(%rbp), %rdx
1458dcbb5:     	movq	(%rbp), %r8
1458dcbb9:     	movq	$0xd, 0x20(%rsp)
1458dcbc2:     	leaq	0x157db33(%rip), %r9    # 0x146e5a6fc
1458dcbc9:     	leaq	-0x10(%rbp), %rcx
1458dcbcd:     	movq	%rdx, 0x10(%rbp)
1458dcbd1:     	callq	0x145b763e0 <.text+0x5b753e0>
1458dcbd6:     	nop
1458dcbd7:     	movups	-0x10(%rbp), %xmm0
1458dcbdb:     	movups	(%rbp), %xmm1
1458dcbdf:     	movups	%xmm1, 0x10(%rsi)
1458dcbe3:     	movups	%xmm0, (%rsi)
1458dcbe6:     	movq	0x18(%rbp), %rdx
1458dcbea:     	testq	%rdx, %rdx
1458dcbed:     	jne	0x1458dcc01 <.text+0x58dbc01>
1458dcbef:     	jmp	0x1458dcc10 <.text+0x58dbc10>
1458dcbf1:     	movq	$-0x1, (%rsi)
1458dcbf8:     	movq	0x18(%rbp), %rdx
1458dcbfc:     	testq	%rdx, %rdx
1458dcbff:     	je	0x1458dcc10 <.text+0x58dbc10>
1458dcc01:     	movl	$0x1, %r8d
1458dcc07:     	movq	0x10(%rbp), %rcx
1458dcc0b:     	callq	0x1400021d0 <.text+0x11d0>
1458dcc10:     	movq	%rsi, %rax
1458dcc13:     	addq	$0xa8, %rsp
1458dcc1a:     	popq	%rsi
1458dcc1b:     	popq	%rbp
1458dcc1c:     	retq
1458dcc1d:     	leaq	0x12e614d(%rip), %rdx   # 0x146bc2d71
1458dcc24:     	leaq	-0x58(%rbp), %rcx
1458dcc28:     	movl	$0x4, %r8d
1458dcc2e:     	callq	0x145b89030 <.text+0x5b88030>
1458dcc33:     	movq	-0x58(%rbp), %rax
1458dcc37:     	cmpq	$-0x1, %rax
1458dcc3b:     	je	0x1458dccdc <.text+0x58dbcdc>
1458dcc41:     	movq	%rax, 0x18(%rbp)
1458dcc45:     	movq	-0x50(%rbp), %rdx
1458dcc49:     	movq	-0x48(%rbp), %r8
1458dcc4d:     	movq	$0x6, 0x20(%rsp)
1458dcc56:     	leaq	0x12e6109(%rip), %r9    # 0x146bc2d66
1458dcc5d:     	leaq	-0x10(%rbp), %rcx
1458dcc61:     	movq	%rdx, 0x10(%rbp)
1458dcc65:     	callq	0x145b763e0 <.text+0x5b753e0>
1458dcc6a:     	nop
1458dcc6b:     	movq	-0x8(%rbp), %rdx
1458dcc6f:     	movq	(%rbp), %r8
1458dcc73:     	movq	$0x5, 0x20(%rsp)
1458dcc7c:     	leaq	0x12e60e9(%rip), %r9    # 0x146bc2d6c
1458dcc83:     	leaq	-0x38(%rbp), %rcx
1458dcc87:     	movq	%rdx, -0x18(%rbp)
1458dcc8b:     	callq	0x145b763e0 <.text+0x5b753e0>
1458dcc90:     	nop
1458dcc91:     	movq	-0x10(%rbp), %rdx
1458dcc95:     	testq	%rdx, %rdx
1458dcc98:     	je	0x1458dcca9 <.text+0x58dbca9>
1458dcc9a:     	movl	$0x1, %r8d
1458dcca0:     	movq	-0x18(%rbp), %rcx
1458dcca4:     	callq	0x1400021d0 <.text+0x11d0>
1458dcca9:     	movq	0x18(%rbp), %rdx
1458dccad:     	testq	%rdx, %rdx
1458dccb0:     	je	0x1458dccc1 <.text+0x58dbcc1>
1458dccb2:     	movl	$0x1, %r8d
1458dccb8:     	movq	0x10(%rbp), %rcx
1458dccbc:     	callq	0x1400021d0 <.text+0x11d0>
1458dccc1:     	movq	-0x38(%rbp), %rax
1458dccc5:     	cmpq	$-0x1, %rax
1458dccc9:     	je	0x1458dccdc <.text+0x58dbcdc>
1458dcccb:     	movq	%rax, 0x18(%rbp)
1458dcccf:     	movq	-0x30(%rbp), %rdx
1458dccd3:     	movq	-0x28(%rbp), %r8
1458dccd7:     	jmp	0x1458dcbb9 <.text+0x58dbbb9>
1458dccdc:     	movq	$-0x1, (%rsi)
1458dcce3:     	jmp	0x1458dcc10 <.text+0x58dbc10>
