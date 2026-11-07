
AzerothSurvivors/AzerothSurvivors-0.97.2.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454a9f24:     	leaq	(%rcx,%rcx,4), %r15
1454a9f28:     	movq	0x210(%r13), %rcx
1454a9f2f:     	movq	0x218(%r13), %rdx
1454a9f36:     	callq	0x14540e820 <.text+0x540d820>
1454a9f3b:     	imulq	$0xf0, %rax, %rax
1454a9f42:     	movq	0x10(%r14,%r15,8), %rcx
1454a9f47:     	movq	0x80(%rax,%r12), %rdx
1454a9f4f:     	cmpq	%rdx, %rcx
1454a9f52:     	jae	0x1454aaed1 <.text+0x54a9ed1>
1454a9f58:     	addq	%rax, %r12
1454a9f5b:     	movq	0x78(%r12), %rsi
1454a9f60:     	leaq	(%rcx,%rcx,4), %rdi
1454a9f64:     	shlq	$0x4, %rdi
1454a9f68:     	leaq	(%rsi,%rdi), %rax
1454a9f6c:     	addq	$0x20, %rax
1454a9f70:     	movq	%rax, 0x230(%rbp)
1454a9f77:     	leaq	0x2740c2(%rip), %rax    # 0x14571e040 <.text+0x571d040>
1454a9f7e:     	movq	%rax, 0x238(%rbp)
1454a9f85:     	leaq	0x12649da(%rip), %rdx   # 0x14670e966
1454a9f8c:     	leaq	0xa0(%rbp), %rcx
1454a9f93:     	leaq	0x230(%rbp), %r8
1454a9f9a:     	callq	0x14570bf80 <.text+0x570af80>
1454a9f9f:     	movq	0xa8(%rbp), %rcx
1454a9fa6:     	movq	0xb0(%rbp), %rdx
1454a9fad:     	movq	0x10(%rsi,%rdi), %r12
1454a9fb2:     	movq	0x18(%rsi,%rdi), %r13
1454a9fb7:     	movq	%rcx, 0x358(%rbp)
1454a9fbe:     	callq	0x145452400 <.text+0x5451400>
1454a9fc3:     	nop
1454a9fc4:     	movq	%rax, %rbx
1454a9fc7:     	movq	%rdx, %rdi
1454a9fca:     	leaq	(%r14,%r15,8), %r14
1454a9fce:     	movq	0xa0(%rbp), %rdx
1454a9fd5:     	testq	%rdx, %rdx
1454a9fd8:     	leaq	0x2d8(%rbp), %rsi
1454a9fdf:     	je	0x1454a9ff3 <.text+0x54a8ff3>
1454a9fe1:     	movl	$0x1, %r8d
1454a9fe7:     	movq	0x358(%rbp), %rcx
1454a9fee:     	callq	0x1400021d0 <.text+0x11d0>
1454a9ff3:     	testq	%rbx, %rbx
1454a9ff6:     	cmovneq	%rbx, %r12
1454a9ffa:     	cmoveq	%r13, %rdi
1454a9ffe:     	movq	%r12, 0x2d8(%rbp)
1454aa005:     	movq	%rdi, 0x2e0(%rbp)
