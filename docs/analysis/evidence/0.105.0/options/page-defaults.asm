Disassembly of section .text:

0000000140001000 <.text>:
1400fadff:     	xorl	%esi, %esi
1400fae01:     	xorl	%r13d, %r13d
1400fae04:     	movq	0xf90(%rbp), %r12
1400fae0b:     	leaq	0x5ca6a96(%rip), %r14   # 0x145da18a8
1400fae12:     	leaq	0x360(%rbp), %rdi
1400fae19:     	nopl	(%rax)
1400fae20:     	cmpq	$0x3900, %r13           # imm = 0x3900
1400fae27:     	je	0x1400fa710 <.text+0xf9710>
1400fae2d:     	movq	%r13, %rax
1400fae30:     	movq	%rsi, %rbx
1400fae33:     	addq	$0x98, %r13
1400fae3a:     	incq	%rsi
1400fae3d:     	cmpb	%r15b, 0x91(%rax,%r14)
1400fae45:     	jne	0x1400fae20 <.text+0xf9e20>
1400fae47:     	movq	0x18(%rax,%r14), %rcx
1400fae4c:     	leaq	0x5cadb29(%rip), %rdx   # 0x145da897c
1400fae53:     	movslq	(%rdx,%rcx,4), %rcx
1400fae57:     	addq	%rdx, %rcx
1400fae5a:     	jmpq	*%rcx
1400fae5c:     	movq	0x20(%rax,%r14), %r8
1400fae61:     	movq	0x28(%rax,%r14), %r9
1400fae66:     	movq	%rdi, %rcx
1400fae69:     	movq	%r12, %rdx
1400fae6c:     	callq	0x1406398c0 <.text+0x6388c0>
1400fae71:     	nop
1400fae72:     	cmpq	$-0x1, 0x360(%rbp)
1400fae7a:     	je	0x1400fb019 <.text+0xfa019>
1400fae80:     	movq	0x370(%rbp), %rax
1400fae87:     	movq	%rax, 0xaa0(%rbp)
1400fae8e:     	movups	0x360(%rbp), %xmm0
1400fae95:     	movaps	%xmm0, 0xa90(%rbp)
1400fae9c:     	jmp	0x1400fb040 <.text+0xfa040>
1400faea1:     	callq	0x140002200 <.text+0x1200>
1400faea6:     	movl	$0x1, %ecx
1400faeab:     	movl	$0x1, %edx
1400faeb0:     	callq	0x1400021c0 <.text+0x11c0>
1400faeb5:     	testq	%rax, %rax
1400faeb8:     	je	0x1400fc582 <.text+0xfb582>
1400faebe:     	movb	$0x30, (%rax)
1400faec1:     	movq	$0x1, 0xa90(%rbp)
1400faecc:     	movq	%rax, 0xa98(%rbp)
1400faed3:     	movq	$0x1, 0xaa0(%rbp)
1400faede:     	jmp	0x1400fb040 <.text+0xfa040>
1400faee3:     	movl	$0x5, %r9d
1400faee9:     	movq	%rdi, %rcx
1400faeec:     	movq	%r12, %rdx
1400faeef:     	leaq	0x5ca47cf(%rip), %r8    # 0x145d9f6c5
1400faef6:     	callq	0x1406398c0 <.text+0x6388c0>
1400faefb:     	nop
1400faefc:     	movq	0x360(%rbp), %rax
1400faf03:     	cmpq	$-0x1, %rax
1400faf07:     	je	0x1400faff5 <.text+0xf9ff5>
1400faf0d:     	movq	%rax, 0xfa8(%rbp)
1400faf14:     	movq	0x368(%rbp), %rcx
1400faf1b:     	movq	0x370(%rbp), %rdx
1400faf22:     	movq	%rcx, 0xf80(%rbp)
1400faf29:     	callq	0x145baaf70 <.text+0x5ba9f70>
1400faf2e:     	nop
1400faf2f:     	movq	%rax, %r15
1400faf32:     	movq	0xfa8(%rbp), %rdx
1400faf39:     	testq	%rdx, %rdx
1400faf3c:     	je	0x1400faf50 <.text+0xf9f50>
1400faf3e:     	movl	$0x1, %r8d
1400faf44:     	movq	0xf80(%rbp), %rcx
1400faf4b:     	callq	0x1400021d0 <.text+0x11d0>
1400faf50:     	movdqa	%xmm8, %xmm0
1400faf55:     	testb	$0x1, %r15b
1400faf59:     	jne	0x1400faffa <.text+0xf9ffa>
1400faf5f:     	shrq	$0x20, %r15
1400faf63:     	movd	%r15d, %xmm0
1400faf68:     	jmp	0x1400faffa <.text+0xf9ffa>
1400faf6d:     	movq	0x30(%rax,%r14), %r15
1400faf72:     	movq	0x38(%rax,%r14), %r12
1400faf77:     	movq	$0x1, 0x20(%rsp)
1400faf80:     	movl	$0x1, %r9d
1400faf86:     	movq	%rdi, %rcx
1400faf89:     	movq	%r12, %rdx
1400faf8c:     	xorl	%r8d, %r8d
1400faf8f:     	callq	0x14023ff50 <.text+0x23ef50>
1400faf94:     	movq	0x368(%rbp), %rdi
1400faf9b:     	cmpb	$0x0, 0x360(%rbp)
1400fafa2:     	jne	0x1400fc4ee <.text+0xfb4ee>
1400fafa8:     	movq	0x370(%rbp), %r14
1400fafaf:     	testq	%r12, %r12
1400fafb2:     	je	0x1400fafc2 <.text+0xf9fc2>
1400fafb4:     	movq	%r14, %rcx
1400fafb7:     	movq	%r15, %rdx
1400fafba:     	movq	%r12, %r8
1400fafbd:     	callq	0x145bc977b <.text+0x5bc877b>
1400fafc2:     	movq	%rdi, 0xa90(%rbp)
1400fafc9:     	movq	%r14, 0xa98(%rbp)
1400fafd0:     	movq	%r12, 0xaa0(%rbp)
1400fafd7:     	movq	0xf90(%rbp), %r12
1400fafde:     	leaq	0x5ca68c3(%rip), %r14   # 0x145da18a8
1400fafe5:     	leaq	0x360(%rbp), %rdi
1400fafec:     	movq	0xfb8(%rbp), %r15
1400faff3:     	jmp	0x1400fb040 <.text+0xfa040>
1400faff5:     	movdqa	%xmm8, %xmm0
1400faffa:     	movdqa	%xmm8, %xmm1
1400fafff:     	subss	%xmm0, %xmm1
1400fb003:     	leaq	0xa90(%rbp), %rcx
1400fb00a:     	callq	0x1400f0bf0 <.text+0xefbf0>
1400fb00f:     	nop
1400fb010:     	movq	0xfb8(%rbp), %r15
1400fb017:     	jmp	0x1400fb040 <.text+0xfa040>
1400fb019:     	movq	$0x0, 0xa90(%rbp)
1400fb024:     	movq	$0x1, 0xa98(%rbp)
1400fb02f:     	movq	$0x0, 0xaa0(%rbp)
1400fb03a:     	nopw	(%rax,%rax)
1400fb040:     	movq	0xa98(%rbp), %r8
1400fb047:     	movq	0xaa0(%rbp), %r9
1400fb04e:     	movq	%r12, %rcx
1400fb051:     	movq	%rbx, %rdx
1400fb054:     	movq	%r8, 0xfa8(%rbp)
1400fb05b:     	callq	0x1400f2100 <.text+0xf1100>
1400fb060:     	nop
1400fb061:     	movq	0xa90(%rbp), %rdx
1400fb068:     	testq	%rdx, %rdx
1400fb06b:     	je	0x1400fae20 <.text+0xf9e20>
1400fb071:     	movl	$0x1, %r8d
1400fb077:     	movq	0xfa8(%rbp), %rcx
1400fb07e:     	callq	0x1400021d0 <.text+0x11d0>
1400fb083:     	jmp	0x1400fae20 <.text+0xf9e20>
