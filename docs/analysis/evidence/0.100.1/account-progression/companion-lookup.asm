
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14547fd70:     	pushq	%r15
14547fd72:     	pushq	%r14
14547fd74:     	pushq	%r13
14547fd76:     	pushq	%r12
14547fd78:     	pushq	%rsi
14547fd79:     	pushq	%rdi
14547fd7a:     	pushq	%rbp
14547fd7b:     	pushq	%rbx
14547fd7c:     	subq	$0x28, %rsp
14547fd80:     	cmpq	0x130(%rcx), %rdx
14547fd87:     	jae	0x14547fe69 <.text+0x547ee69>
14547fd8d:     	movq	%rcx, %rdi
14547fd90:     	movq	0x128(%rcx), %rax
14547fd97:     	leaq	(%rdx,%rdx,2), %rdx
14547fd9b:     	movq	0x8(%rax,%rdx,8), %rcx
14547fda0:     	movq	0x10(%rax,%rdx,8), %rdx
14547fda5:     	callq	0x145514d60 <.text+0x5513d60>
14547fdaa:     	testq	%rax, %rax
14547fdad:     	je	0x14547fe69 <.text+0x547ee69>
14547fdb3:     	movq	0x40(%rax), %rsi
14547fdb7:     	testq	%rsi, %rsi
14547fdba:     	je	0x14547fe6b <.text+0x547ee6b>
14547fdc0:     	movq	0xb8(%rdi), %r14
14547fdc7:     	xorl	%r12d, %r12d
14547fdca:     	testq	%r14, %r14
14547fdcd:     	je	0x14547fe69 <.text+0x547ee69>
14547fdd3:     	movq	%rdi, %rcx
14547fdd6:     	movq	%rax, 0x20(%rsp)
14547fddb:     	movq	0x48(%rax), %rdi
14547fddf:     	movq	0xb0(%rcx), %r15
14547fde6:     	cmpq	$0x1, %r14
14547fdea:     	je	0x14547fe34 <.text+0x547ee34>
14547fdec:     	xorl	%r12d, %r12d
14547fdef:     	nop
14547fdf0:     	movq	%r12, %r13
14547fdf3:     	movq	%r14, %rbp
14547fdf6:     	shrq	%rbp
14547fdf9:     	addq	%rbp, %r12
14547fdfc:     	leaq	(%r12,%r12,2), %rax
14547fe00:     	movq	0x8(%r15,%rax,8), %rcx
14547fe05:     	movq	0x10(%r15,%rax,8), %r8
14547fe0a:     	movq	%r8, %rbx
14547fe0d:     	subq	%rdi, %rbx
14547fe10:     	cmovaeq	%rdi, %r8
14547fe14:     	movq	%rsi, %rdx
14547fe17:     	callq	0x1457731e7 <.text+0x57721e7>
14547fe1c:     	cltq
14547fe1e:     	testl	%eax, %eax
14547fe20:     	cmovneq	%rax, %rbx
14547fe24:     	testq	%rbx, %rbx
14547fe27:     	cmovgq	%r13, %r12
14547fe2b:     	subq	%rbp, %r14
14547fe2e:     	cmpq	$0x1, %r14
14547fe32:     	ja	0x14547fdf0 <.text+0x547edf0>
14547fe34:     	leaq	(%r12,%r12,2), %rax
14547fe38:     	movq	0x8(%r15,%rax,8), %rcx
14547fe3d:     	movq	0x10(%r15,%rax,8), %rax
14547fe42:     	movq	%rax, %rbx
14547fe45:     	subq	%rdi, %rbx
14547fe48:     	cmovbq	%rax, %rdi
14547fe4c:     	movq	%rsi, %rdx
14547fe4f:     	movq	%rdi, %r8
14547fe52:     	callq	0x1457731e7 <.text+0x57721e7>
14547fe57:     	cltq
14547fe59:     	testl	%eax, %eax
14547fe5b:     	cmovneq	%rax, %rbx
14547fe5f:     	testq	%rbx, %rbx
14547fe62:     	movq	0x20(%rsp), %rax
14547fe67:     	je	0x14547fe6b <.text+0x547ee6b>
14547fe69:     	xorl	%eax, %eax
14547fe6b:     	testq	%rax, %rax
14547fe6e:     	leaq	0x1559df3(%rip), %rcx   # 0x1469d9c68
14547fe75:     	cmovneq	%rax, %rcx
14547fe79:     	movq	%rcx, %rax
14547fe7c:     	addq	$0x28, %rsp
14547fe80:     	popq	%rbx
14547fe81:     	popq	%rbp
14547fe82:     	popq	%rdi
14547fe83:     	popq	%rsi
14547fe84:     	popq	%r12
14547fe86:     	popq	%r13
14547fe88:     	popq	%r14
14547fe8a:     	popq	%r15
14547fe8c:     	retq
