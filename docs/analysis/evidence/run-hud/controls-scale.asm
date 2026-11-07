Disassembly of section .text:

0000000140001000 <.text>:
14003db10:     	pushq	%rbp
14003db11:     	pushq	%r14
14003db13:     	pushq	%rsi
14003db14:     	pushq	%rdi
14003db15:     	pushq	%rbx
14003db16:     	subq	$0x60, %rsp
14003db1a:     	leaq	0x60(%rsp), %rbp
14003db1f:     	movq	$-0x2, -0x8(%rbp)
14003db27:     	movq	%rdx, %rsi
14003db2a:     	cmpb	$0x0, (%r8)
14003db2e:     	movb	$0x1, (%r8)
14003db32:     	jne	0x14003db59 <.text+0x3cb59>
14003db34:     	movq	$0x1, 0x20(%rsp)
14003db3d:     	leaq	0x5d336ac(%rip), %rdx   # 0x145d711f0
14003db44:     	leaq	0x5d333a5(%rip), %r9    # 0x145d70ef0
14003db4b:     	movl	$0x8, %r8d
14003db51:     	movq	%rsi, %rcx
14003db54:     	callq	0x14063a3d0 <.text+0x6393d0>
14003db59:     	leaq	0x5d33690(%rip), %r8    # 0x145d711f0
14003db60:     	leaq	-0x30(%rbp), %rcx
14003db64:     	movl	$0x8, %r9d
14003db6a:     	movq	%rsi, %rdx
14003db6d:     	callq	0x14063cd20 <.text+0x63bd20>
14003db72:     	movq	-0x30(%rbp), %rax
14003db76:     	cmpq	$-0x1, %rax
14003db7a:     	je	0x14003dbf4 <.text+0x3cbf4>
14003db7c:     	movq	%rax, -0x18(%rbp)
14003db80:     	movq	-0x28(%rbp), %rcx
14003db84:     	movq	-0x20(%rbp), %rdx
14003db88:     	movq	%rcx, -0x38(%rbp)
14003db8c:     	callq	0x14006f550 <.text+0x6e550>
14003db91:     	nop
14003db92:     	movq	%rax, %rcx
14003db95:     	callq	0x145baaf70 <.text+0x5ba9f70>
14003db9a:     	nop
14003db9b:     	movq	%rax, %rdi
14003db9e:     	movq	-0x18(%rbp), %rdx
14003dba2:     	testq	%rdx, %rdx
14003dba5:     	je	0x14003dbb6 <.text+0x3cbb6>
14003dba7:     	movl	$0x1, %r8d
14003dbad:     	movq	-0x38(%rbp), %rcx
14003dbb1:     	callq	0x1400021d0 <.text+0x11d0>
14003dbb6:     	movss	0x5d2f7ae(%rip), %xmm0  # 0x145d6d36c
14003dbbe:     	testb	$0x1, %dil
14003dbc2:     	jne	0x14003dbfc <.text+0x3cbfc>
14003dbc4:     	shrq	$0x20, %rdi
14003dbc8:     	movl	%edi, %eax
14003dbca:     	andl	$0x7fffffff, %eax       # imm = 0x7FFFFFFF
14003dbcf:     	cmpl	$0x7f7fffff, %eax       # imm = 0x7F7FFFFF
14003dbd4:     	jg	0x14003dbfc <.text+0x3cbfc>
14003dbd6:     	movd	%edi, %xmm0
14003dbda:     	movss	0x5d2fb72(%rip), %xmm1  # 0x145d6d754
14003dbe2:     	maxss	%xmm0, %xmm1
14003dbe6:     	movss	0x5d2f83e(%rip), %xmm0  # 0x145d6d42c
14003dbee:     	minss	%xmm1, %xmm0
14003dbf2:     	jmp	0x14003dbfc <.text+0x3cbfc>
14003dbf4:     	movss	0x5d2f770(%rip), %xmm0  # 0x145d6d36c
14003dbfc:     	cmpq	$0x0, 0x90(%rsi)
14003dc04:     	je	0x14003dd82 <.text+0x3cd82>
14003dc0a:     	movq	0x78(%rsi), %rax
14003dc0e:     	movq	0x80(%rsi), %rcx
14003dc15:     	movabsq	$-0x688f462dff8d0ebb, %rdx # imm = 0x9770B9D20072F145
14003dc1f:     	xorl	%r8d, %r8d
14003dc22:     	movdqa	0x5d2fcb6(%rip), %xmm1  # 0x145d6d8e0
14003dc2a:     	pcmpeqd	%xmm3, %xmm3
14003dc2e:     	movdqa	0x5d2fd7a(%rip), %xmm2  # 0x145d6d9b0
14003dc36:     	andq	%rcx, %rdx
14003dc39:     	movdqu	(%rax,%rdx), %xmm4
14003dc3e:     	movdqa	%xmm4, %xmm5
14003dc42:     	pcmpeqb	%xmm1, %xmm5
14003dc46:     	pmovmskb	%xmm5, %r9d
14003dc4b:     	testl	%r9d, %r9d
14003dc4e:     	je	0x14003dc90 <.text+0x3cc90>
14003dc50:     	tzcntl	%r9d, %r10d
14003dc55:     	addq	%rdx, %r10
14003dc58:     	andq	%rcx, %r10
14003dc5b:     	negq	%r10
14003dc5e:     	leaq	(%r10,%r10,2), %r10
14003dc62:     	movdqu	-0x18(%rax,%r10,8), %xmm5
14003dc69:     	pcmpeqb	%xmm2, %xmm5
14003dc6d:     	pmovmskb	%xmm5, %r11d
14003dc72:     	cmpl	$0xffff, %r11d          # imm = 0xFFFF
14003dc79:     	je	0x14003dcaf <.text+0x3ccaf>
14003dc7b:     	leal	-0x1(%r9), %r10d
14003dc7f:     	andw	%r9w, %r10w
14003dc83:     	movl	%r10d, %r9d
14003dc86:     	jne	0x14003dc50 <.text+0x3cc50>
14003dc88:     	nopl	(%rax,%rax)
14003dc90:     	pcmpeqb	%xmm3, %xmm4
14003dc94:     	pmovmskb	%xmm4, %r9d
14003dc99:     	testl	%r9d, %r9d
14003dc9c:     	jne	0x14003dd82 <.text+0x3cd82>
14003dca2:     	addq	%r8, %rdx
14003dca5:     	addq	$0x10, %rdx
14003dca9:     	addq	$0x10, %r8
14003dcad:     	jmp	0x14003dc36 <.text+0x3cc36>
14003dcaf:     	leaq	(%rax,%r10,8), %rdx
14003dcb3:     	movq	-0x8(%rdx), %rdx
14003dcb7:     	movq	0x218(%rsi), %r8
14003dcbe:     	cmpq	%r8, %rdx
14003dcc1:     	jae	0x14003dd82 <.text+0x3cd82>
14003dcc7:     	movq	0x210(%rsi), %r9
14003dcce:     	movq	(%r9,%rdx,8), %r10
14003dcd2:     	testq	%r10, %r10
14003dcd5:     	je	0x14003dd82 <.text+0x3cd82>
14003dcdb:     	movq	0x1e0(%rsi), %rdx
14003dce2:     	notq	%r10
14003dce5:     	imulq	$0x38, %r10, %r10
14003dce9:     	cmpb	$0x0, 0x30(%rdx,%r10)
14003dcef:     	je	0x14003dd82 <.text+0x3cd82>
14003dcf5:     	addq	%rdx, %r10
14003dcf8:     	movq	0x10(%r10), %r10
14003dcfc:     	movss	(%r10), %xmm3
14003dd01:     	ucomiss	%xmm0, %xmm3
14003dd04:     	jne	0x14003dd0c <.text+0x3cd0c>
14003dd06:     	jnp	0x14003dde6 <.text+0x3cde6>
14003dd0c:     	movabsq	$-0x688f462dff8d0ebb, %r10 # imm = 0x9770B9D20072F145
14003dd16:     	xorl	%r11d, %r11d
14003dd19:     	pcmpeqd	%xmm3, %xmm3
14003dd1d:     	andq	%rcx, %r10
14003dd20:     	movdqu	(%rax,%r10), %xmm4
14003dd26:     	movdqa	%xmm4, %xmm5
14003dd2a:     	pcmpeqb	%xmm1, %xmm5
14003dd2e:     	pmovmskb	%xmm5, %edi
14003dd32:     	testl	%edi, %edi
14003dd34:     	je	0x14003dd69 <.text+0x3cd69>
14003dd36:     	tzcntl	%edi, %ebx
14003dd3a:     	addq	%r10, %rbx
14003dd3d:     	andq	%rcx, %rbx
14003dd40:     	negq	%rbx
14003dd43:     	leaq	(%rbx,%rbx,2), %rbx
14003dd47:     	movdqu	-0x18(%rax,%rbx,8), %xmm5
14003dd4d:     	pcmpeqb	%xmm2, %xmm5
14003dd51:     	pmovmskb	%xmm5, %r14d
14003dd56:     	cmpl	$0xffff, %r14d          # imm = 0xFFFF
14003dd5d:     	je	0x14003ddae <.text+0x3cdae>
14003dd5f:     	leal	-0x1(%rdi), %ebx
14003dd62:     	andw	%di, %bx
14003dd65:     	movl	%ebx, %edi
14003dd67:     	jne	0x14003dd36 <.text+0x3cd36>
14003dd69:     	pcmpeqb	%xmm3, %xmm4
14003dd6d:     	pmovmskb	%xmm4, %edi
14003dd71:     	testl	%edi, %edi
14003dd73:     	jne	0x14003ddf1 <.text+0x3cdf1>
14003dd75:     	addq	%r11, %r10
14003dd78:     	addq	$0x10, %r10
14003dd7c:     	addq	$0x10, %r11
14003dd80:     	jmp	0x14003dd1d <.text+0x3cd1d>
14003dd82:     	leaq	-0x9(%rbp), %rax
14003dd86:     	movq	%rax, -0x30(%rbp)
14003dd8a:     	leaq	0x4fa88df(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
14003dd91:     	movq	%rax, -0x28(%rbp)
14003dd95:     	leaq	0x5d32f54(%rip), %rcx   # 0x145d70cf0
14003dd9c:     	leaq	0x5d33455(%rip), %r8    # 0x145d711f8
14003dda3:     	leaq	-0x30(%rbp), %rdx
14003dda7:     	callq	0x145d699c0 <.text+0x5d689c0>
14003ddac:     	ud2
14003ddae:     	leaq	(%rax,%rbx,8), %rax
14003ddb2:     	movq	-0x8(%rax), %rax
14003ddb6:     	cmpq	%r8, %rax
14003ddb9:     	jae	0x14003ddf1 <.text+0x3cdf1>
14003ddbb:     	movq	(%r9,%rax,8), %rax
14003ddbf:     	testq	%rax, %rax
14003ddc2:     	je	0x14003ddf1 <.text+0x3cdf1>
14003ddc4:     	notq	%rax
14003ddc7:     	imulq	$0x38, %rax, %rax
14003ddcb:     	cmpb	$0x0, 0x30(%rdx,%rax)
14003ddd0:     	je	0x14003ddf1 <.text+0x3cdf1>
14003ddd2:     	addq	%rax, %rdx
14003ddd5:     	movq	0x10(%rdx), %rax
14003ddd9:     	movl	0x5b0(%rsi), %ecx
14003dddf:     	movl	%ecx, 0x2c(%rdx)
14003dde2:     	movss	%xmm0, (%rax)
14003dde6:     	addq	$0x60, %rsp
14003ddea:     	popq	%rbx
14003ddeb:     	popq	%rdi
14003ddec:     	popq	%rsi
14003dded:     	popq	%r14
14003ddef:     	popq	%rbp
14003ddf0:     	retq
14003ddf1:     	leaq	-0x9(%rbp), %rax
14003ddf5:     	movq	%rax, -0x30(%rbp)
14003ddf9:     	leaq	0x4fa8870(%rip), %rax   # 0x144fe6670 <.text+0x4fe5670>
14003de00:     	movq	%rax, -0x28(%rbp)
14003de04:     	leaq	0x5d32ee5(%rip), %rcx   # 0x145d70cf0
14003de0b:     	leaq	0x5d333fe(%rip), %r8    # 0x145d71210
14003de12:     	leaq	-0x30(%rbp), %rdx
14003de16:     	callq	0x145d699c0 <.text+0x5d689c0>
14003de1b:     	ud2
