
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145502f00:     	pushq	%rbp
145502f01:     	pushq	%r15
145502f03:     	pushq	%r14
145502f05:     	pushq	%r12
145502f07:     	pushq	%rsi
145502f08:     	pushq	%rdi
145502f09:     	pushq	%rbx
145502f0a:     	subq	$0xe0, %rsp
145502f11:     	leaq	0x80(%rsp), %rbp
145502f19:     	movq	$-0x2, 0x58(%rbp)
145502f21:     	movq	%rdx, %rdi
145502f24:     	movq	%rcx, %rsi
145502f27:     	movq	0x8(%rdx), %rdx
145502f2b:     	movq	0x10(%rdi), %r8
145502f2f:     	movq	-0x18(%rdi), %rbx
145502f33:     	movq	-0x10(%rdi), %r14
145502f37:     	leaq	-0x20(%rbp), %r15
145502f3b:     	movq	%r15, %rcx
145502f3e:     	callq	0x1457023c0 <.text+0x57013c0>
145502f43:     	leaq	-0x60(%rbp), %r12
145502f47:     	movq	%r12, %rcx
145502f4a:     	movq	%rbx, %rdx
145502f4d:     	movq	%r14, %r8
145502f50:     	callq	0x1457023c0 <.text+0x57013c0>
145502f55:     	movq	%r15, %rcx
145502f58:     	movq	%r12, %rdx
145502f5b:     	callq	0x145710a90 <.text+0x570fa90>
145502f60:     	testb	%al, %al
145502f62:     	jns	0x145503003 <.text+0x5502003>
145502f68:     	movq	(%rdi), %rax
145502f6b:     	movq	%rax, 0x48(%rbp)
145502f6f:     	movq	0x8(%rdi), %rax
145502f73:     	movq	%rax, 0x50(%rbp)
145502f77:     	movups	0x10(%rdi), %xmm0
145502f7b:     	movaps	%xmm0, 0x20(%rbp)
145502f7f:     	movq	0x10(%rdi), %rax
145502f83:     	movq	%rax, 0x40(%rbp)
145502f87:     	leaq	-0x20(%rbp), %rbx
145502f8b:     	leaq	-0x60(%rbp), %r14
145502f8f:     	nop
145502f90:     	movq	%rdi, %rcx
145502f93:     	addq	$-0x20, %rdi
145502f97:     	movups	-0x20(%rcx), %xmm0
145502f9b:     	movups	-0x10(%rcx), %xmm1
145502f9f:     	movups	%xmm1, 0x10(%rcx)
145502fa3:     	movups	%xmm0, (%rcx)
145502fa6:     	cmpq	%rsi, %rdi
145502fa9:     	je	0x145502feb <.text+0x5501feb>
145502fab:     	movq	-0x38(%rcx), %r15
145502faf:     	movq	%rcx, 0x38(%rbp)
145502fb3:     	movq	-0x30(%rcx), %r12
145502fb7:     	movq	%rbx, %rcx
145502fba:     	movq	0x50(%rbp), %rdx
145502fbe:     	movq	0x40(%rbp), %r8
145502fc2:     	callq	0x1457023c0 <.text+0x57013c0>
145502fc7:     	nop
145502fc8:     	movq	%r14, %rcx
145502fcb:     	movq	%r15, %rdx
145502fce:     	movq	%r12, %r8
145502fd1:     	callq	0x1457023c0 <.text+0x57013c0>
145502fd6:     	nop
145502fd7:     	movq	%rbx, %rcx
145502fda:     	movq	%r14, %rdx
145502fdd:     	callq	0x145710a90 <.text+0x570fa90>
145502fe2:     	nop
145502fe3:     	testb	%al, %al
145502fe5:     	movq	0x38(%rbp), %rcx
145502fe9:     	js	0x145502f90 <.text+0x5501f90>
145502feb:     	movq	0x48(%rbp), %rax
145502fef:     	movq	%rax, -0x20(%rcx)
145502ff3:     	movq	0x50(%rbp), %rax
145502ff7:     	movq	%rax, -0x18(%rcx)
145502ffb:     	movaps	0x20(%rbp), %xmm0
145502fff:     	movups	%xmm0, -0x10(%rcx)
145503003:     	addq	$0xe0, %rsp
14550300a:     	popq	%rbx
14550300b:     	popq	%rdi
14550300c:     	popq	%rsi
14550300d:     	popq	%r12
14550300f:     	popq	%r14
145503011:     	popq	%r15
145503013:     	popq	%rbp
145503014:     	retq
