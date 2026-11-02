
AzerothSurvivors/AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145873d60:     	pushq	%rbp
145873d61:     	pushq	%r14
145873d63:     	pushq	%rsi
145873d64:     	pushq	%rdi
145873d65:     	pushq	%rbx
145873d66:     	subq	$0x60, %rsp
145873d6a:     	leaq	0x60(%rsp), %rbp
145873d6f:     	movq	$-0x2, -0x8(%rbp)
145873d77:     	movq	%rcx, %rdi
145873d7a:     	leaq	0x10(%rcx), %rax
145873d7e:     	movq	%rax, -0x38(%rbp)
145873d82:     	leaq	-0x5871cc9(%rip), %rax  # 0x1400020c0 <.text+0x10c0>
145873d89:     	movq	%rax, -0x30(%rbp)
145873d8d:     	leaq	0x132cf8e(%rip), %rdx   # 0x146ba0d22
145873d94:     	leaq	-0x28(%rbp), %rcx
145873d98:     	leaq	-0x38(%rbp), %r8
145873d9c:     	callq	0x145b9c4d0 <.text+0x5b9b4d0>
145873da1:     	movq	-0x20(%rbp), %rcx
145873da5:     	movq	-0x18(%rbp), %rdx
145873da9:     	movq	0x20(%rdi), %rsi
145873dad:     	movq	0x28(%rdi), %rbx
145873db1:     	movq	%rcx, -0x10(%rbp)
145873db5:     	callq	0x1458da590 <.text+0x58d9590>
145873dba:     	nop
145873dbb:     	movq	%rax, %rdi
145873dbe:     	movq	-0x28(%rbp), %rax
145873dc2:     	testq	%rax, %rax
145873dc5:     	je	0x145873ddf <.text+0x5872ddf>
145873dc7:     	movl	$0x1, %r8d
145873dcd:     	movq	-0x10(%rbp), %rcx
145873dd1:     	movq	%rdx, %r14
145873dd4:     	movq	%rax, %rdx
145873dd7:     	callq	0x1400021d0 <.text+0x11d0>
145873ddc:     	movq	%r14, %rdx
145873ddf:     	testq	%rdi, %rdi
145873de2:     	cmovneq	%rdi, %rsi
145873de6:     	cmoveq	%rbx, %rdx
145873dea:     	movq	%rsi, %rax
145873ded:     	addq	$0x60, %rsp
145873df1:     	popq	%rbx
145873df2:     	popq	%rdi
145873df3:     	popq	%rsi
145873df4:     	popq	%r14
145873df6:     	popq	%rbp
145873df7:     	retq
