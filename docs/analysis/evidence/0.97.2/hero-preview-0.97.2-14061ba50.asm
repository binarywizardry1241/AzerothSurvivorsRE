
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14061ba50:     	pushq	%rbp
14061ba51:     	pushq	%r15
14061ba53:     	pushq	%r14
14061ba55:     	pushq	%r13
14061ba57:     	pushq	%r12
14061ba59:     	pushq	%rsi
14061ba5a:     	pushq	%rdi
14061ba5b:     	pushq	%rbx
14061ba5c:     	subq	$0xe8, %rsp
14061ba63:     	leaq	0x80(%rsp), %rbp
14061ba6b:     	movq	$-0x2, 0x60(%rbp)
14061ba73:     	movq	(%rcx), %r14
14061ba76:     	movq	0x8(%rcx), %r15
14061ba7a:     	movq	(%rdx), %rax
14061ba7d:     	movq	0x8(%rdx), %r8
14061ba81:     	cmpq	%r15, %r14
14061ba84:     	je	0x14061bbe3 <.text+0x61abe3>
14061ba8a:     	movq	%rax, 0x38(%rbp)
14061ba8e:     	movq	0x10(%rcx), %rax
14061ba92:     	movq	%rax, 0x10(%rbp)
14061ba96:     	movq	0x18(%rcx), %rdi
14061ba9a:     	movq	0x10(%rdx), %rax
14061ba9e:     	subq	%r14, %r15
14061baa1:     	shrq	$0x3, %r15
14061baa5:     	leaq	-0x8(%rbp), %r12
14061baa9:     	leaq	-0x44(%rbp), %r13
14061baad:     	movq	%r8, 0x50(%rbp)
14061bab1:     	imulq	$0x70, %r8, %rcx
14061bab5:     	leaq	(%rcx,%rax), %rbx
14061bab9:     	addq	$0x6e, %rbx
14061babd:     	xorl	%ecx, %ecx
14061babf:     	jmp	0x14061bb6c <.text+0x61ab6c>
14061bac4:     	nopw	%cs:(%rax,%rax)
14061bad0:     	movl	$0x0, 0x48(%rbp)
14061bad7:     	movq	$0x0, 0x40(%rbp)
14061badf:     	movzwl	0x44(%rsi), %eax
14061bae3:     	movzbl	0x46(%rsi), %ecx
14061bae7:     	movq	0x28(%rbp), %rdx
14061baeb:     	movq	%rdx, -0x10(%rbp)
14061baef:     	movups	0x18(%rbp), %xmm0
14061baf3:     	movaps	%xmm0, -0x20(%rbp)
14061baf7:     	movq	-0x28(%rbp), %rdx
14061bafb:     	movq	%rdx, 0x10(%r12)
14061bb00:     	movups	-0x38(%rbp), %xmm0
14061bb04:     	movups	%xmm0, (%r12)
14061bb09:     	movl	0x48(%rbp), %edx
14061bb0c:     	movl	%edx, 0x8(%r13)
14061bb10:     	movq	0x40(%rbp), %rdx
14061bb14:     	movq	%rdx, (%r13)
14061bb18:     	movaps	-0x20(%rbp), %xmm0
14061bb1c:     	movq	-0x10(%rbp), %rdx
14061bb20:     	movq	-0x8(%rbp), %r8
14061bb24:     	movaps	(%rbp), %xmm1
14061bb28:     	movups	%xmm1, -0x4e(%rbx)
14061bb2c:     	movq	%rdx, -0x5e(%rbx)
14061bb30:     	movq	%r8, -0x56(%rbx)
14061bb34:     	movups	%xmm0, -0x6e(%rbx)
14061bb38:     	movb	$0x2, -0x3e(%rbx)
14061bb3c:     	movb	$0x2, -0x26(%rbx)
14061bb40:     	movups	-0x5b(%rbp), %xmm0
14061bb44:     	movups	-0x4b(%rbp), %xmm1
14061bb48:     	movups	%xmm0, -0x25(%rbx)
14061bb4c:     	movups	%xmm1, -0x15(%rbx)
14061bb50:     	movl	-0x3c(%rbp), %edx
14061bb53:     	movl	%edx, -0x6(%rbx)
14061bb56:     	movw	%ax, -0x2(%rbx)
14061bb5a:     	movb	%cl, (%rbx)
14061bb5c:     	movq	0x30(%rbp), %rcx
14061bb60:     	incq	%rcx
14061bb63:     	addq	$0x70, %rbx
14061bb67:     	cmpq	%rcx, %r15
14061bb6a:     	je	0x14061bbd8 <.text+0x61abd8>
14061bb6c:     	movq	(%r14,%rcx,8), %rsi
14061bb70:     	movzbl	0x10(%rsi), %edx
14061bb74:     	cmpb	$0x1, %dl
14061bb77:     	movq	%rcx, 0x30(%rbp)
14061bb7b:     	movb	%dl, 0x5f(%rbp)
14061bb7e:     	jne	0x14061bb90 <.text+0x61ab90>
14061bb80:     	movups	0x11(%rsi), %xmm0
14061bb84:     	leaq	0x20(%rbp), %rax
14061bb88:     	movups	%xmm0, -0x7(%rax)
14061bb8c:     	movb	$0x1, %al
14061bb8e:     	jmp	0x14061bba4 <.text+0x61aba4>
14061bb90:     	movq	0x18(%rsi), %rax
14061bb94:     	lock
14061bb95:     	incq	(%rax)
14061bb98:     	jle	0x14061bbfa <.text+0x61abfa>
14061bb9a:     	movq	0x18(%rsi), %rax
14061bb9e:     	movq	%rax, 0x20(%rbp)
14061bba2:     	xorl	%eax, %eax
14061bba4:     	movb	%al, 0x18(%rbp)
14061bba7:     	leaq	0x28(%rsi), %r8
14061bbab:     	leaq	-0x38(%rbp), %rcx
14061bbaf:     	movq	0x10(%rbp), %rdx
14061bbb3:     	movq	%rdi, %r9
14061bbb6:     	callq	0x14079da50 <.text+0x79ca50>
14061bbbb:     	nop
14061bbbc:     	testb	$0x1, (%rsi)
14061bbbf:     	je	0x14061bad0 <.text+0x61aad0>
14061bbc5:     	movl	0xc(%rsi), %eax
14061bbc8:     	movl	%eax, 0x48(%rbp)
14061bbcb:     	movq	0x4(%rsi), %rax
14061bbcf:     	movq	%rax, 0x40(%rbp)
14061bbd3:     	jmp	0x14061badf <.text+0x61aadf>
14061bbd8:     	movq	0x50(%rbp), %r8
14061bbdc:     	addq	%rcx, %r8
14061bbdf:     	movq	0x38(%rbp), %rax
14061bbe3:     	movq	%r8, (%rax)
14061bbe6:     	addq	$0xe8, %rsp
14061bbed:     	popq	%rbx
14061bbee:     	popq	%rdi
14061bbef:     	popq	%rsi
14061bbf0:     	popq	%r12
14061bbf2:     	popq	%r13
14061bbf4:     	popq	%r14
14061bbf6:     	popq	%r15
14061bbf8:     	popq	%rbp
14061bbf9:     	retq
14061bbfa:     	ud2
