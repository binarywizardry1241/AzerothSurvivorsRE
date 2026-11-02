
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14027ca30:     	pushq	%r15
14027ca32:     	pushq	%r14
14027ca34:     	pushq	%r13
14027ca36:     	pushq	%r12
14027ca38:     	pushq	%rsi
14027ca39:     	pushq	%rdi
14027ca3a:     	pushq	%rbp
14027ca3b:     	pushq	%rbx
14027ca3c:     	subq	$0x38, %rsp
14027ca40:     	movq	0xa0(%rsp), %rax
14027ca48:     	movq	(%rdx), %r10
14027ca4b:     	movq	(%r8), %rcx
14027ca4e:     	movq	%rcx, 0x18(%rsp)
14027ca53:     	movq	(%r9), %r11
14027ca56:     	movq	0x8(%r9), %rsi
14027ca5a:     	movl	0x14(%r9), %ecx
14027ca5e:     	movl	%ecx, 0x4(%rsp)
14027ca62:     	movq	(%rax), %rcx
14027ca65:     	movq	%rcx, 0x8(%rsp)
14027ca6a:     	movq	0x8(%rax), %rdx
14027ca6e:     	movl	0x14(%rax), %eax
14027ca71:     	movl	%eax, 0x24(%rsp)
14027ca75:     	movq	0xf8(%r11), %rdi
14027ca7c:     	movq	0x100(%r11), %rax
14027ca83:     	leaq	(%rdi,%rax,4), %rbx
14027ca87:     	cmpb	$0x0, 0x108(%r11)
14027ca8f:     	je	0x14027cba6 <.text+0x27bba6>
14027ca95:     	xorl	%r8d, %r8d
14027ca98:     	xorl	%r12d, %r12d
14027ca9b:     	xorl	%r9d, %r9d
14027ca9e:     	xorl	%ebp, %ebp
14027caa0:     	xorl	%r14d, %r14d
14027caa3:     	cmpl	%r8d, %r14d
14027caa6:     	jne	0x14027cb3c <.text+0x27bb3c>
14027caac:     	nopl	(%rax)
14027cab0:     	cmpq	%rbx, %rdi
14027cab3:     	je	0x14027cd0f <.text+0x27bd0f>
14027cab9:     	movl	(%rdi), %r8d
14027cabc:     	addq	$0x4, %rdi
14027cac0:     	movq	0x1a8(%rsi), %rax
14027cac7:     	leaq	(%r8,%r8,8), %r9
14027cacb:     	movq	0x10(%rax,%r9,8), %r8
14027cad0:     	testq	%r8, %r8
14027cad3:     	je	0x14027cab0 <.text+0x27bab0>
14027cad5:     	leaq	(%rax,%r9,8), %rax
14027cad9:     	movq	0x40(%rax), %r12
14027cadd:     	movq	0x38(%rax), %r15
14027cae1:     	movq	0x118(%r11), %r9
14027cae8:     	cmpq	%r12, %r9
14027caeb:     	jae	0x14027caf8 <.text+0x27baf8>
14027caed:     	cmpq	$0x0, (%r15,%r9,8)
14027caf2:     	setne	%bpl
14027caf6:     	jmp	0x14027cafa <.text+0x27bafa>
14027caf8:     	xorl	%ebp, %ebp
14027cafa:     	movq	0x120(%r11), %r13
14027cb01:     	xorl	%r14d, %r14d
14027cb04:     	movl	$0x0, %r9d
14027cb0a:     	cmpq	%r12, %r13
14027cb0d:     	jae	0x14027cb18 <.text+0x27bb18>
14027cb0f:     	cmpq	$0x0, (%r15,%r13,8)
14027cb14:     	setne	%r9b
14027cb18:     	movq	0x18(%rax), %rax
14027cb1c:     	movq	0x110(%r11), %r12
14027cb23:     	movq	(%r15,%r12,8), %r15
14027cb27:     	notq	%r15
14027cb2a:     	leaq	(%r15,%r15,2), %r15
14027cb2e:     	shlq	$0x4, %r15
14027cb32:     	movq	0x10(%rax,%r15), %r12
14027cb37:     	movq	0x28(%rax,%r15), %rcx
14027cb3c:     	cmpb	$0x0, (%r10)
14027cb40:     	je	0x14027cb60 <.text+0x27bb60>
14027cb42:     	movb	$0x1, %al
14027cb44:     	movl	%r14d, %r13d
14027cb47:     	incl	%r14d
14027cb4a:     	cmpb	%al, (%r12,%r13)
14027cb4e:     	je	0x14027caa3 <.text+0x27baa3>
14027cb54:     	jmp	0x14027cb94 <.text+0x27bb94>
14027cb56:     	nopw	%cs:(%rax,%rax)
14027cb60:     	cmpb	$0x1, %bpl
14027cb64:     	jne	0x14027cb71 <.text+0x27bb71>
14027cb66:     	movq	0x18(%rsp), %rax
14027cb6b:     	cmpb	$0x1, 0x4(%rax)
14027cb6f:     	jne	0x14027cb42 <.text+0x27bb42>
14027cb71:     	cmpb	$0x1, %r9b
14027cb75:     	jne	0x14027cb82 <.text+0x27bb82>
14027cb77:     	movq	0x18(%rsp), %rax
14027cb7c:     	cmpb	$0x0, 0x5(%rax)
14027cb80:     	je	0x14027cb42 <.text+0x27bb42>
14027cb82:     	xorl	%eax, %eax
14027cb84:     	movl	%r14d, %r13d
14027cb87:     	incl	%r14d
14027cb8a:     	cmpb	%al, (%r12,%r13)
14027cb8e:     	je	0x14027caa3 <.text+0x27baa3>
14027cb94:     	movl	0x4(%rsp), %r15d
14027cb99:     	movl	%r15d, (%rcx,%r13,4)
14027cb9d:     	movb	%al, (%r12,%r13)
14027cba1:     	jmp	0x14027caa3 <.text+0x27baa3>
14027cba6:     	xorl	%r8d, %r8d
14027cba9:     	movl	$0x8, %ecx
14027cbae:     	xorl	%r9d, %r9d
14027cbb1:     	xorl	%r15d, %r15d
14027cbb4:     	xorl	%ebp, %ebp
14027cbb6:     	xorl	%r14d, %r14d
14027cbb9:     	movq	%rdx, 0x30(%rsp)
14027cbbe:     	cmpl	%r8d, %r14d
14027cbc1:     	jne	0x14027cc86 <.text+0x27bc86>
14027cbc7:     	nopw	(%rax,%rax)
14027cbd0:     	cmpq	%rbx, %rdi
14027cbd3:     	je	0x14027cd0f <.text+0x27bd0f>
14027cbd9:     	movl	(%rdi), %r8d
14027cbdc:     	addq	$0x4, %rdi
14027cbe0:     	movq	0x108(%rsi), %rax
14027cbe7:     	leaq	(%r8,%r8,4), %r9
14027cbeb:     	shlq	$0x5, %r9
14027cbef:     	movq	0x58(%rax,%r9), %r8
14027cbf4:     	testq	%r8, %r8
14027cbf7:     	je	0x14027cbd0 <.text+0x27bbd0>
14027cbf9:     	addq	%r9, %rax
14027cbfc:     	movq	0x80(%rax), %r9
14027cc03:     	movq	0x88(%rax), %r12
14027cc0a:     	movq	0x118(%r11), %r14
14027cc11:     	cmpq	%r12, %r14
14027cc14:     	jae	0x14027cc21 <.text+0x27bc21>
14027cc16:     	cmpq	$0x0, (%r9,%r14,8)
14027cc1b:     	setne	%bpl
14027cc1f:     	jmp	0x14027cc23 <.text+0x27bc23>
14027cc21:     	xorl	%ebp, %ebp
14027cc23:     	movq	0x120(%r11), %r13
14027cc2a:     	xorl	%r14d, %r14d
14027cc2d:     	movl	$0x0, %r15d
14027cc33:     	cmpq	%r12, %r13
14027cc36:     	jae	0x14027cc41 <.text+0x27bc41>
14027cc38:     	cmpq	$0x0, (%r9,%r13,8)
14027cc3d:     	setne	%r15b
14027cc41:     	movl	0x94(%rax), %r9d
14027cc48:     	movq	0x1a8(%rsi), %r12
14027cc4f:     	leaq	(%r9,%r9,8), %r9
14027cc53:     	movq	0x18(%r12,%r9,8), %r13
14027cc58:     	movq	0x38(%r12,%r9,8), %r9
14027cc5d:     	movq	0x110(%r11), %r12
14027cc64:     	movq	(%r9,%r12,8), %r9
14027cc68:     	notq	%r9
14027cc6b:     	leaq	(%r9,%r9,2), %r12
14027cc6f:     	shlq	$0x4, %r12
14027cc73:     	movq	0x10(%r13,%r12), %r9
14027cc78:     	movq	0x28(%r13,%r12), %rcx
14027cc7d:     	movq	%rcx, 0x10(%rsp)
14027cc82:     	movq	0x50(%rax), %rcx
14027cc86:     	cmpb	$0x0, (%r10)
14027cc8a:     	je	0x14027cc90 <.text+0x27bc90>
14027cc8c:     	movb	$0x1, %al
14027cc8e:     	jmp	0x14027ccb4 <.text+0x27bcb4>
14027cc90:     	testb	$0x1, %bpl
14027cc94:     	je	0x14027cca1 <.text+0x27bca1>
14027cc96:     	movq	0x18(%rsp), %rax
14027cc9b:     	cmpb	$0x0, 0x4(%rax)
14027cc9f:     	je	0x14027cc8c <.text+0x27bc8c>
14027cca1:     	testb	$0x1, %r15b
14027cca5:     	je	0x14027ccb2 <.text+0x27bcb2>
14027cca7:     	movq	0x18(%rsp), %rax
14027ccac:     	cmpb	$0x0, 0x5(%rax)
14027ccb0:     	je	0x14027cc8c <.text+0x27bc8c>
14027ccb2:     	xorl	%eax, %eax
14027ccb4:     	movl	%r14d, %r13d
14027ccb7:     	shlq	$0x4, %r13
14027ccbb:     	incl	%r14d
14027ccbe:     	movl	0x8(%rcx,%r13), %r13d
14027ccc3:     	notl	%r13d
14027ccc6:     	cmpb	%al, (%r9,%r13)
14027ccca:     	je	0x14027cbbe <.text+0x27bbbe>
14027ccd0:     	movq	%r9, %rdx
14027ccd3:     	movq	%r11, %r9
14027ccd6:     	movq	%rcx, %r11
14027ccd9:     	movl	%r15d, %ecx
14027ccdc:     	movq	%r10, %r15
14027ccdf:     	movl	%ebp, %r10d
14027cce2:     	movl	0x4(%rsp), %ebp
14027cce6:     	movq	0x10(%rsp), %r12
14027cceb:     	movl	%ebp, (%r12,%r13,4)
14027ccef:     	movl	%r10d, %ebp
14027ccf2:     	movq	%r15, %r10
14027ccf5:     	movl	%ecx, %r15d
14027ccf8:     	movq	%r11, %rcx
14027ccfb:     	movq	%r9, %r11
14027ccfe:     	movq	%rdx, %r9
14027cd01:     	movq	0x30(%rsp), %rdx
14027cd06:     	movb	%al, (%r9,%r13)
14027cd0a:     	jmp	0x14027cbbe <.text+0x27bbbe>
14027cd0f:     	movq	0x8(%rsp), %rcx
14027cd14:     	movq	0xf8(%rcx), %r9
14027cd1b:     	movq	0x100(%rcx), %rax
14027cd22:     	leaq	(%r9,%rax,4), %r10
14027cd26:     	movzbl	0x108(%rcx), %r11d
14027cd2e:     	movq	0x18(%rsp), %rax
14027cd33:     	leaq	0x1(%rax), %r15
14027cd37:     	xorl	%ebx, %ebx
14027cd39:     	movl	$0x8, %eax
14027cd3e:     	movq	%rax, 0x28(%rsp)
14027cd43:     	xorl	%r8d, %r8d
14027cd46:     	xorl	%ebp, %ebp
14027cd48:     	movl	$0x0, 0x10(%rsp)
14027cd50:     	movl	$0x0, 0x4(%rsp)
14027cd58:     	xorl	%r12d, %r12d
14027cd5b:     	testb	%r11b, %r11b
14027cd5e:     	je	0x14027cdf0 <.text+0x27bdf0>
14027cd64:     	cmpl	%ebx, %r12d
14027cd67:     	jne	0x14027cef0 <.text+0x27bef0>
14027cd6d:     	nopl	(%rax)
14027cd70:     	cmpq	%r10, %r9
14027cd73:     	je	0x14027cff3 <.text+0x27bff3>
14027cd79:     	movl	(%r9), %r8d
14027cd7c:     	addq	$0x4, %r9
14027cd80:     	movq	0x1a8(%rdx), %rax
14027cd87:     	leaq	(%r8,%r8,8), %r8
14027cd8b:     	movq	0x10(%rax,%r8,8), %rbx
14027cd90:     	testq	%rbx, %rbx
14027cd93:     	je	0x14027cd70 <.text+0x27bd70>
14027cd95:     	leaq	(%rax,%r8,8), %rax
14027cd99:     	movq	0x40(%rax), %rsi
14027cd9d:     	movq	0x38(%rax), %r8
14027cda1:     	movq	0x8(%rsp), %rcx
14027cda6:     	movq	0x118(%rcx), %rdi
14027cdad:     	cmpq	%rsi, %rdi
14027cdb0:     	jae	0x14027ce7a <.text+0x27be7a>
14027cdb6:     	cmpq	$0x0, (%r8,%rdi,8)
14027cdbb:     	setne	%bpl
14027cdbf:     	movq	0x8(%rsp), %rcx
14027cdc4:     	movq	0x120(%rcx), %rdi
14027cdcb:     	cmpq	%rsi, %rdi
14027cdce:     	jb	0x14027ce91 <.text+0x27be91>
14027cdd4:     	movl	$0x0, 0x10(%rsp)
14027cddc:     	jmp	0x14027ce9e <.text+0x27be9e>
14027cde1:     	nopw	%cs:(%rax,%rax)
14027cdf0:     	cmpl	%ebx, %r12d
14027cdf3:     	jne	0x14027cf90 <.text+0x27bf90>
14027cdf9:     	nopl	(%rax)
14027ce00:     	cmpq	%r10, %r9
14027ce03:     	je	0x14027cff3 <.text+0x27bff3>
14027ce09:     	movl	(%r9), %r8d
14027ce0c:     	addq	$0x4, %r9
14027ce10:     	movq	0x108(%rdx), %rax
14027ce17:     	leaq	(%r8,%r8,4), %r8
14027ce1b:     	shlq	$0x5, %r8
14027ce1f:     	movq	0x58(%rax,%r8), %rbx
14027ce24:     	testq	%rbx, %rbx
14027ce27:     	je	0x14027ce00 <.text+0x27be00>
14027ce29:     	addq	%r8, %rax
14027ce2c:     	movq	0x80(%rax), %r8
14027ce33:     	movq	0x88(%rax), %rsi
14027ce3a:     	movq	0x8(%rsp), %rcx
14027ce3f:     	movq	0x118(%rcx), %rdi
14027ce46:     	cmpq	%rsi, %rdi
14027ce49:     	jae	0x14027cef8 <.text+0x27bef8>
14027ce4f:     	cmpq	$0x0, (%r8,%rdi,8)
14027ce54:     	setne	%bpl
14027ce58:     	movq	0x8(%rsp), %rcx
14027ce5d:     	movq	0x120(%rcx), %rdi
14027ce64:     	cmpq	%rsi, %rdi
14027ce67:     	jb	0x14027cf0f <.text+0x27bf0f>
14027ce6d:     	movl	$0x0, 0x10(%rsp)
14027ce75:     	jmp	0x14027cf1c <.text+0x27bf1c>
14027ce7a:     	xorl	%ebp, %ebp
14027ce7c:     	movq	0x8(%rsp), %rcx
14027ce81:     	movq	0x120(%rcx), %rdi
14027ce88:     	cmpq	%rsi, %rdi
14027ce8b:     	jae	0x14027cdd4 <.text+0x27bdd4>
14027ce91:     	cmpq	$0x0, (%r8,%rdi,8)
14027ce96:     	setne	%dil
14027ce9a:     	movl	%edi, 0x10(%rsp)
14027ce9e:     	movq	0x8(%rsp), %rcx
14027cea3:     	movq	0x128(%rcx), %rdi
14027ceaa:     	xorl	%r12d, %r12d
14027cead:     	movl	$0x0, 0x4(%rsp)
14027ceb5:     	cmpq	%rsi, %rdi
14027ceb8:     	jae	0x14027cec7 <.text+0x27bec7>
14027ceba:     	cmpq	$0x0, (%r8,%rdi,8)
14027cebf:     	setne	%sil
14027cec3:     	movl	%esi, 0x4(%rsp)
14027cec7:     	movq	0x18(%rax), %rax
14027cecb:     	movq	0x8(%rsp), %rcx
14027ced0:     	movq	0x110(%rcx), %rsi
14027ced7:     	movq	(%r8,%rsi,8), %r8
14027cedb:     	notq	%r8
14027cede:     	leaq	(%r8,%r8,2), %rsi
14027cee2:     	shlq	$0x4, %rsi
14027cee6:     	movq	0x10(%rax,%rsi), %r8
14027ceeb:     	movq	0x28(%rax,%rsi), %rdi
14027cef0:     	movl	%r12d, %eax
14027cef3:     	jmp	0x14027cfa2 <.text+0x27bfa2>
14027cef8:     	xorl	%ebp, %ebp
14027cefa:     	movq	0x8(%rsp), %rcx
14027ceff:     	movq	0x120(%rcx), %rdi
14027cf06:     	cmpq	%rsi, %rdi
14027cf09:     	jae	0x14027ce6d <.text+0x27be6d>
14027cf0f:     	cmpq	$0x0, (%r8,%rdi,8)
14027cf14:     	setne	%dil
14027cf18:     	movl	%edi, 0x10(%rsp)
14027cf1c:     	movq	0x8(%rsp), %rcx
14027cf21:     	movq	0x128(%rcx), %rdi
14027cf28:     	xorl	%r12d, %r12d
14027cf2b:     	movl	$0x0, 0x4(%rsp)
14027cf33:     	cmpq	%rsi, %rdi
14027cf36:     	jae	0x14027cf46 <.text+0x27bf46>
14027cf38:     	cmpq	$0x0, (%r8,%rdi,8)
14027cf3d:     	setne	%r8b
14027cf41:     	movl	%r8d, 0x4(%rsp)
14027cf46:     	movl	0x94(%rax), %r8d
14027cf4d:     	movq	0x1a8(%rdx), %rsi
14027cf54:     	leaq	(%r8,%r8,8), %r8
14027cf58:     	movq	0x18(%rsi,%r8,8), %rdi
14027cf5d:     	movq	0x38(%rsi,%r8,8), %r8
14027cf62:     	movq	0x8(%rsp), %rcx
14027cf67:     	movq	0x110(%rcx), %rsi
14027cf6e:     	movq	(%r8,%rsi,8), %r8
14027cf72:     	notq	%r8
14027cf75:     	leaq	(%r8,%r8,2), %rsi
14027cf79:     	shlq	$0x4, %rsi
14027cf7d:     	movq	0x10(%rdi,%rsi), %r8
14027cf82:     	movq	0x28(%rdi,%rsi), %rdi
14027cf87:     	movq	0x50(%rax), %rax
14027cf8b:     	movq	%rax, 0x28(%rsp)
14027cf90:     	movl	%r12d, %eax
14027cf93:     	shlq	$0x4, %rax
14027cf97:     	movq	0x28(%rsp), %rsi
14027cf9c:     	movl	0x8(%rsi,%rax), %eax
14027cfa0:     	notl	%eax
14027cfa2:     	leaq	(%r8,%rax), %rsi
14027cfa6:     	leaq	(%rdi,%rax,4), %rax
14027cfaa:     	movq	%r15, %r14
14027cfad:     	testb	$0x1, %bpl
14027cfb1:     	jne	0x14027cfd1 <.text+0x27bfd1>
14027cfb3:     	movzbl	0x4(%rsp), %r14d
14027cfb9:     	leaq	(%r14,%r14,2), %r14
14027cfbd:     	testb	$0x1, 0x10(%rsp)
14027cfc2:     	movl	$0x2, %r13d
14027cfc8:     	cmovneq	%r13, %r14
14027cfcc:     	addq	0x18(%rsp), %r14
14027cfd1:     	incl	%r12d
14027cfd4:     	movzbl	(%r14), %r14d
14027cfd8:     	xorb	$0x1, %r14b
14027cfdc:     	cmpb	%r14b, (%rsi)
14027cfdf:     	je	0x14027cd5b <.text+0x27bd5b>
14027cfe5:     	movl	0x24(%rsp), %ecx
14027cfe9:     	movl	%ecx, (%rax)
14027cfeb:     	movb	%r14b, (%rsi)
14027cfee:     	jmp	0x14027cd5b <.text+0x27bd5b>
14027cff3:     	addq	$0x38, %rsp
14027cff7:     	popq	%rbx
14027cff8:     	popq	%rbp
14027cff9:     	popq	%rdi
14027cffa:     	popq	%rsi
14027cffb:     	popq	%r12
14027cffd:     	popq	%r13
14027cfff:     	popq	%r14
14027d001:     	popq	%r15
14027d003:     	retq
