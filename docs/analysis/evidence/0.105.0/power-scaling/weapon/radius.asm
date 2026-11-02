
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145925c80:     	pushq	%rbp
145925c81:     	pushq	%rsi
145925c82:     	pushq	%rdi
145925c83:     	subq	$0x90, %rsp
145925c8a:     	leaq	0x80(%rsp), %rbp
145925c92:     	movq	$-0x2, 0x8(%rbp)
145925c9a:     	movq	%rcx, %rsi
145925c9d:     	movaps	0x50(%rbp), %xmm0
145925ca1:     	movss	0x9ec(%rdx), %xmm1
145925ca9:     	movss	%xmm1, (%rbp)
145925cae:     	mulss	%xmm3, %xmm3
145925cb2:     	movss	%xmm3, -0x4(%rbp)
145925cb7:     	movq	0x560(%rdx), %rax
145925cbe:     	imulq	$0x160, 0x568(%rdx), %rcx # imm = 0x160
145925cc9:     	addq	%rax, %rcx
145925ccc:     	movq	%rax, -0x60(%rbp)
145925cd0:     	movq	%rcx, -0x58(%rbp)
145925cd4:     	movups	%xmm0, -0x50(%rbp)
145925cd8:     	movq	%rbp, %rax
145925cdb:     	movq	%rax, -0x40(%rbp)
145925cdf:     	movq	%r8, -0x38(%rbp)
145925ce3:     	leaq	-0x4(%rbp), %rax
145925ce7:     	movq	%rax, -0x30(%rbp)
145925ceb:     	leaq	-0x28(%rbp), %rcx
145925cef:     	leaq	-0x60(%rbp), %rdx
145925cf3:     	callq	0x14599e990 <.text+0x599d990>
145925cf8:     	movq	-0x20(%rbp), %rcx
145925cfc:     	movq	-0x18(%rbp), %rdi
145925d00:     	leaq	0x7(%rbp), %rax
145925d04:     	movq	%rax, -0x60(%rbp)
145925d08:     	cmpq	$0x2, %rdi
145925d0c:     	jae	0x145925dca <.text+0x5924dca>
145925d12:     	movq	-0x28(%rbp), %rax
145925d16:     	testq	%rdi, %rdi
145925d19:     	je	0x145925db1 <.text+0x5924db1>
145925d1f:     	leaq	-0x1(%rdi), %rdx
145925d23:     	movl	%edi, %r11d
145925d26:     	andl	$0x3, %r11d
145925d2a:     	cmpq	$0x3, %rdx
145925d2e:     	jae	0x145925d34 <.text+0x5924d34>
145925d30:     	xorl	%edx, %edx
145925d32:     	jmp	0x145925d84 <.text+0x5924d84>
145925d34:     	movq	%rdi, %r8
145925d37:     	andq	$-0x4, %r8
145925d3b:     	leaq	0x38(%rcx), %r9
145925d3f:     	xorl	%edx, %edx
145925d41:     	nopw	%cs:(%rax,%rax)
145925d50:     	movq	-0x30(%r9), %r10
145925d54:     	movq	%r10, (%rcx,%rdx,8)
145925d58:     	movq	-0x20(%r9), %r10
145925d5c:     	movq	%r10, 0x8(%rcx,%rdx,8)
145925d61:     	movq	-0x10(%r9), %r10
145925d65:     	movq	%r10, 0x10(%rcx,%rdx,8)
145925d6a:     	movq	(%r9), %r10
145925d6d:     	movq	%r10, 0x18(%rcx,%rdx,8)
145925d72:     	addq	$0x4, %rdx
145925d76:     	addq	$0x40, %r9
145925d7a:     	cmpq	%rdx, %r8
145925d7d:     	jne	0x145925d50 <.text+0x5924d50>
145925d7f:     	testq	%r11, %r11
145925d82:     	je	0x145925db1 <.text+0x5924db1>
145925d84:     	leaq	(%rcx,%rdx,8), %r8
145925d88:     	shlq	$0x4, %rdx
145925d8c:     	addq	%rcx, %rdx
145925d8f:     	addq	$0x8, %rdx
145925d93:     	shll	$0x3, %r11d
145925d97:     	xorl	%r9d, %r9d
145925d9a:     	nopw	(%rax,%rax)
145925da0:     	movq	(%rdx,%r9,2), %r10
145925da4:     	movq	%r10, (%r8,%r9)
145925da8:     	addq	$0x8, %r9
145925dac:     	cmpq	%r9, %r11
145925daf:     	jne	0x145925da0 <.text+0x5924da0>
145925db1:     	addq	%rax, %rax
145925db4:     	movq	%rax, (%rsi)
145925db7:     	movq	%rcx, 0x8(%rsi)
145925dbb:     	movq	%rdi, 0x10(%rsi)
145925dbf:     	addq	$0x90, %rsp
145925dc6:     	popq	%rdi
145925dc7:     	popq	%rsi
145925dc8:     	popq	%rbp
145925dc9:     	retq
145925dca:     	cmpq	$0x15, %rdi
145925dce:     	movq	%rcx, -0x10(%rbp)
145925dd2:     	jae	0x145925df3 <.text+0x5924df3>
145925dd4:     	leaq	-0x60(%rbp), %r9
145925dd8:     	movl	$0x1, %r8d
145925dde:     	movq	%rdi, %rdx
145925de1:     	callq	0x141578ce0 <.text+0x1577ce0>
145925de6:     	movq	-0x28(%rbp), %rax
145925dea:     	movq	-0x10(%rbp), %rcx
145925dee:     	jmp	0x145925d1f <.text+0x5924d1f>
145925df3:     	leaq	-0x60(%rbp), %r8
145925df7:     	movq	%rdi, %rdx
145925dfa:     	callq	0x1459883b0 <.text+0x59873b0>
145925dff:     	nop
145925e00:     	jmp	0x145925de6 <.text+0x5924de6>
