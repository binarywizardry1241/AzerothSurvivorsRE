
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145483d70:     	pushq	%r15
145483d72:     	pushq	%r14
145483d74:     	pushq	%r13
145483d76:     	pushq	%r12
145483d78:     	pushq	%rsi
145483d79:     	pushq	%rdi
145483d7a:     	pushq	%rbp
145483d7b:     	pushq	%rbx
145483d7c:     	subq	$0x38, %rsp
145483d80:     	decb	%dl
145483d82:     	xorl	%eax, %eax
145483d84:     	cmpb	$0xa, %dl
145483d87:     	ja	0x145483de7 <.text+0x5482de7>
145483d89:     	movzbl	%dl, %r10d
145483d8d:     	movl	$0x5df, %edx            # imm = 0x5DF
145483d92:     	btl	%r10d, %edx
145483d96:     	jae	0x145483de7 <.text+0x5482de7>
145483d98:     	movq	0x10(%rcx), %rdx
145483d9c:     	testq	%rdx, %rdx
145483d9f:     	je	0x145483de7 <.text+0x5482de7>
145483da1:     	movq	0x8(%rcx), %r13
145483da5:     	cmpq	$0x3, %r8
145483da9:     	jae	0x145483dd0 <.text+0x5482dd0>
145483dab:     	leaq	0x1571ac6(%rip), %rcx   # 0x1469f5878
145483db2:     	shlq	$0x6, %r8
145483db6:     	addq	(%rcx,%r10,8), %r8
145483dba:     	xorl	%ebp, %ebp
145483dbc:     	xorl	%eax, %eax
145483dbe:     	movq	%r8, 0x30(%rsp)
145483dc3:     	movb	%r9b, 0x23(%rsp)
145483dc8:     	movq	%rdx, 0x28(%rsp)
145483dcd:     	jmp	0x145483e1c <.text+0x5482e1c>
145483dcf:     	nop
145483dd0:     	movq	(%r13), %rcx
145483dd4:     	cmpb	%r9b, 0x60(%rcx)
145483dd8:     	jb	0x145483e9d <.text+0x5482e9d>
145483dde:     	addq	$0x10, %r13
145483de2:     	decq	%rdx
145483de5:     	jne	0x145483dd0 <.text+0x5482dd0>
145483de7:     	addq	$0x38, %rsp
145483deb:     	popq	%rbx
145483dec:     	popq	%rbp
145483ded:     	popq	%rdi
145483dee:     	popq	%rsi
145483def:     	popq	%r12
145483df1:     	popq	%r13
145483df3:     	popq	%r14
145483df5:     	popq	%r15
145483df7:     	retq
145483df8:     	nopl	(%rax,%rax)
145483e00:     	movq	0x30(%rsp), %r8
145483e05:     	movzbl	0x23(%rsp), %r9d
145483e0b:     	movl	0x24(%rsp), %eax
145483e0f:     	movq	0x28(%rsp), %rdx
145483e14:     	incq	%rbp
145483e17:     	cmpq	%rdx, %rbp
145483e1a:     	je	0x145483de7 <.text+0x5482de7>
145483e1c:     	movq	%rbp, %rdi
145483e1f:     	shlq	$0x4, %rdi
145483e23:     	movq	(%r13,%rdi), %r10
145483e28:     	cmpb	%r9b, 0x60(%r10)
145483e2c:     	jae	0x145483e14 <.text+0x5482e14>
145483e2e:     	movq	0x38(%r8), %rcx
145483e32:     	testq	%rcx, %rcx
145483e35:     	je	0x145483e14 <.text+0x5482e14>
145483e37:     	movl	%eax, 0x24(%rsp)
145483e3b:     	addq	%r13, %rdi
145483e3e:     	movq	0x30(%r8), %rsi
145483e42:     	imulq	$0x68, %rcx, %rbx
145483e46:     	movq	(%r10), %r14
145483e49:     	movq	0x8(%r10), %r15
145483e4d:     	xorl	%r12d, %r12d
145483e50:     	jmp	0x145483e69 <.text+0x5482e69>
145483e52:     	nopw	%cs:(%rax,%rax)
145483e60:     	addq	$0x68, %r12
145483e64:     	cmpq	%r12, %rbx
145483e67:     	je	0x145483e00 <.text+0x5482e00>
145483e69:     	cmpq	%r15, 0x8(%rsi,%r12)
145483e6e:     	jne	0x145483e60 <.text+0x5482e60>
145483e70:     	movq	(%rsi,%r12), %rcx
145483e74:     	movq	%r14, %rdx
145483e77:     	movq	%r15, %r8
145483e7a:     	callq	0x1457731e7 <.text+0x57721e7>
145483e7f:     	testl	%eax, %eax
145483e81:     	jne	0x145483e60 <.text+0x5482e60>
145483e83:     	movzbl	0x8(%rdi), %ecx
145483e87:     	movl	0x24(%rsp), %eax
145483e8b:     	addl	%ecx, %eax
145483e8d:     	movq	0x30(%rsp), %r8
145483e92:     	movzbl	0x23(%rsp), %r9d
145483e98:     	jmp	0x145483e0f <.text+0x5482e0f>
145483e9d:     	movq	%r8, %rcx
145483ea0:     	leaq	0x15563f9(%rip), %r8    # 0x1469da2a0
145483ea7:     	movl	$0x3, %edx
145483eac:     	callq	0x145903b33 <.text+0x5902b33>
145483eb1:     	ud2
