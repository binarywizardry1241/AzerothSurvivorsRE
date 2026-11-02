
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
145981f70:     	pushq	%rsi
145981f71:     	pushq	%rdi
145981f72:     	pushq	%rbx
145981f73:     	leaq	-0x1(%r8), %rax
145981f77:     	cmpq	%rdx, %rax
145981f7a:     	jae	0x145982028 <.text+0x5981028>
145981f80:     	cmpq	%rdx, %r8
145981f83:     	jne	0x145981f89 <.text+0x5980f89>
145981f85:     	popq	%rbx
145981f86:     	popq	%rdi
145981f87:     	popq	%rsi
145981f88:     	retq
145981f89:     	shlq	$0x4, %rdx
145981f8d:     	addq	%rcx, %rdx
145981f90:     	shlq	$0x4, %r8
145981f94:     	leaq	(%rcx,%r8), %rax
145981f98:     	jmp	0x145981fb8 <.text+0x5980fb8>
145981f9a:     	nopw	(%rax,%rax)
145981fa0:     	movq	%rcx, %rdi
145981fa3:     	movq	%r11, (%rdi)
145981fa6:     	movq	%r9, -0x8(%rcx,%rsi)
145981fab:     	addq	$0x10, %rax
145981faf:     	addq	$0x10, %r8
145981fb3:     	cmpq	%rdx, %rax
145981fb6:     	je	0x145981f85 <.text+0x5980f85>
145981fb8:     	movq	-0x8(%rax), %r10
145981fbc:     	movq	0x8(%rax), %r9
145981fc0:     	movq	(%r10), %r10
145981fc3:     	movq	(%r9), %r11
145981fc6:     	movq	%r10, %rsi
145981fc9:     	sarq	$0x3f, %rsi
145981fcd:     	shrq	%rsi
145981fd0:     	xorq	%r10, %rsi
145981fd3:     	movq	%r11, %r10
145981fd6:     	sarq	$0x3f, %r10
145981fda:     	shrq	%r10
145981fdd:     	xorq	%r11, %r10
145981fe0:     	cmpq	%r10, %rsi
145981fe3:     	jge	0x145981fab <.text+0x5980fab>
145981fe5:     	movq	(%rax), %r11
145981fe8:     	movq	%r8, %rdi
145981feb:     	nopl	(%rax,%rax)
145981ff0:     	movq	%rdi, %rsi
145981ff3:     	movups	-0x10(%rcx,%rdi), %xmm0
145981ff8:     	movups	%xmm0, (%rcx,%rdi)
145981ffc:     	cmpq	$0x10, %rdi
145982000:     	je	0x145981fa0 <.text+0x5980fa0>
145982002:     	movq	-0x18(%rcx,%rsi), %rdi
145982007:     	movq	(%rdi), %rdi
14598200a:     	movq	%rdi, %rbx
14598200d:     	sarq	$0x3f, %rbx
145982011:     	shrq	%rbx
145982014:     	xorq	%rdi, %rbx
145982017:     	leaq	-0x10(%rsi), %rdi
14598201b:     	cmpq	%r10, %rbx
14598201e:     	jl	0x145981ff0 <.text+0x5980ff0>
145982020:     	addq	%rcx, %rdi
145982023:     	jmp	0x145981fa3 <.text+0x5980fa3>
145982028:     	ud2
