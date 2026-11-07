
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145483ba0:     	pushq	%r15
145483ba2:     	pushq	%r14
145483ba4:     	pushq	%r13
145483ba6:     	pushq	%r12
145483ba8:     	pushq	%rsi
145483ba9:     	pushq	%rdi
145483baa:     	pushq	%rbp
145483bab:     	pushq	%rbx
145483bac:     	subq	$0x28, %rsp
145483bb0:     	movq	%r9, %r14
145483bb3:     	movq	%r8, %r15
145483bb6:     	movl	%edx, %ebx
145483bb8:     	movq	%rcx, %rsi
145483bbb:     	movl	%edx, %ecx
145483bbd:     	movq	%r8, %rdx
145483bc0:     	movq	%r9, %r8
145483bc3:     	callq	0x145486f60 <.text+0x5485f60>
145483bc8:     	testq	%rdx, %rdx
145483bcb:     	je	0x145483d13 <.text+0x5482d13>
145483bd1:     	movq	%rax, %r8
145483bd4:     	movq	%rdx, %rdi
145483bd7:     	movl	0x90(%rsp), %ecx
145483bde:     	movq	0x10(%rsi), %r13
145483be2:     	testq	%r13, %r13
145483be5:     	je	0x145483c03 <.text+0x5482c03>
145483be7:     	movq	%r8, 0x20(%rsp)
145483bec:     	movq	0x8(%rsi), %rbp
145483bf0:     	movl	%r13d, %eax
145483bf3:     	andl	$0x3, %eax
145483bf6:     	cmpq	$0x4, %r13
145483bfa:     	jae	0x145483c1b <.text+0x5482c1b>
145483bfc:     	xorl	%r8d, %r8d
145483bff:     	xorl	%edx, %edx
145483c01:     	jmp	0x145483c61 <.text+0x5482c61>
145483c03:     	xorl	%eax, %eax
145483c05:     	testl	%ecx, %ecx
145483c07:     	je	0x145483d15 <.text+0x5482d15>
145483c0d:     	cmpb	0x62(%rdi), %al
145483c10:     	jae	0x145483d13 <.text+0x5482d13>
145483c16:     	jmp	0x145483ce4 <.text+0x5482ce4>
145483c1b:     	movq	%r13, %r9
145483c1e:     	andq	$-0x4, %r9
145483c22:     	leaq	0x38(%rbp), %r10
145483c26:     	xorl	%r8d, %r8d
145483c29:     	xorl	%edx, %edx
145483c2b:     	nopl	(%rax,%rax)
145483c30:     	movzbl	-0x30(%r10), %r11d
145483c35:     	addl	%edx, %r11d
145483c38:     	movzbl	-0x20(%r10), %edx
145483c3d:     	movzbl	-0x10(%r10), %r12d
145483c42:     	addl	%edx, %r12d
145483c45:     	addl	%r11d, %r12d
145483c48:     	movzbl	(%r10), %edx
145483c4c:     	addl	%r12d, %edx
145483c4f:     	addq	$0x4, %r8
145483c53:     	addq	$0x40, %r10
145483c57:     	cmpq	%r8, %r9
145483c5a:     	jne	0x145483c30 <.text+0x5482c30>
145483c5c:     	testq	%rax, %rax
145483c5f:     	je	0x145483c91 <.text+0x5482c91>
145483c61:     	shlq	$0x4, %r8
145483c65:     	addq	%rbp, %r8
145483c68:     	addq	$0x8, %r8
145483c6c:     	shll	$0x4, %eax
145483c6f:     	xorl	%r9d, %r9d
145483c72:     	nopw	%cs:(%rax,%rax)
145483c80:     	movzbl	(%r8,%r9), %r10d
145483c85:     	addl	%r10d, %edx
145483c88:     	addq	$0x10, %r9
145483c8c:     	cmpq	%r9, %rax
145483c8f:     	jne	0x145483c80 <.text+0x5482c80>
145483c91:     	cmpl	%ecx, %edx
145483c93:     	jae	0x145483d13 <.text+0x5482d13>
145483c95:     	shlq	$0x4, %r13
145483c99:     	xorl	%r12d, %r12d
145483c9c:     	jmp	0x145483ca9 <.text+0x5482ca9>
145483c9e:     	nop
145483ca0:     	addq	$0x10, %r12
145483ca4:     	cmpq	%r12, %r13
145483ca7:     	je	0x145483cd8 <.text+0x5482cd8>
145483ca9:     	movq	(%rbp,%r12), %rax
145483cae:     	cmpq	%r14, 0x8(%rax)
145483cb2:     	jne	0x145483ca0 <.text+0x5482ca0>
145483cb4:     	movq	(%rax), %rcx
145483cb7:     	movq	%r15, %rdx
145483cba:     	movq	%r14, %r8
145483cbd:     	callq	0x1457731e7 <.text+0x57721e7>
145483cc2:     	testl	%eax, %eax
145483cc4:     	jne	0x145483ca0 <.text+0x5482ca0>
145483cc6:     	movzbl	0x8(%rbp,%r12), %eax
145483ccc:     	movq	0x20(%rsp), %r8
145483cd1:     	cmpb	0x62(%rdi), %al
145483cd4:     	jb	0x145483ce4 <.text+0x5482ce4>
145483cd6:     	jmp	0x145483d13 <.text+0x5482d13>
145483cd8:     	xorl	%eax, %eax
145483cda:     	movq	0x20(%rsp), %r8
145483cdf:     	cmpb	0x62(%rdi), %al
145483ce2:     	jae	0x145483d13 <.text+0x5482d13>
145483ce4:     	movzbl	0x60(%rdi), %r9d
145483ce9:     	movq	%rsi, %rcx
145483cec:     	movl	%ebx, %edx
145483cee:     	callq	0x145483d70 <.text+0x5482d70>
145483cf3:     	movzbl	0x60(%rdi), %ecx
145483cf7:     	leal	(%rcx,%rcx,4), %ecx
145483cfa:     	cmpl	%ecx, %eax
145483cfc:     	jb	0x145483d13 <.text+0x5482d13>
145483cfe:     	movq	%rsi, %rcx
145483d01:     	movl	%ebx, %edx
145483d03:     	movq	%r15, %r8
145483d06:     	movq	%r14, %r9
145483d09:     	callq	0x1454834e0 <.text+0x54824e0>
145483d0e:     	testq	%rax, %rax
145483d11:     	je	0x145483d26 <.text+0x5482d26>
145483d13:     	xorl	%eax, %eax
145483d15:     	addq	$0x28, %rsp
145483d19:     	popq	%rbx
145483d1a:     	popq	%rbp
145483d1b:     	popq	%rdi
145483d1c:     	popq	%rsi
145483d1d:     	popq	%r12
145483d1f:     	popq	%r13
145483d21:     	popq	%r14
145483d23:     	popq	%r15
145483d25:     	retq
145483d26:     	movq	0x50(%rdi), %r14
145483d2a:     	testq	%r14, %r14
145483d2d:     	je	0x145483d5e <.text+0x5482d5e>
145483d2f:     	movq	0x58(%rdi), %rdi
145483d33:     	movl	%ebx, %ecx
145483d35:     	movq	%r14, %rdx
145483d38:     	movq	%rdi, %r8
145483d3b:     	callq	0x145486f60 <.text+0x5485f60>
145483d40:     	testq	%rdx, %rdx
145483d43:     	je	0x145483d13 <.text+0x5482d13>
145483d45:     	movq	%rdx, %rbx
145483d48:     	movq	%rsi, %rcx
145483d4b:     	movq	%r14, %rdx
145483d4e:     	movq	%rdi, %r8
145483d51:     	callq	0x145483400 <.text+0x5482400>
145483d56:     	cmpb	0x62(%rbx), %al
145483d59:     	setae	%al
145483d5c:     	jmp	0x145483d15 <.text+0x5482d15>
145483d5e:     	movb	$0x1, %al
145483d60:     	jmp	0x145483d15 <.text+0x5482d15>
