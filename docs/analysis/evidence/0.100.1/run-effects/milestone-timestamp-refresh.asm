
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ca0dd:     	movq	0xa8(%rsi), %rdi
1454ca0e4:     	movq	%rdi, %rbx
1454ca0e7:     	subq	%r15, %rbx
1454ca0ea:     	jb	0x1454ca13d <.text+0x54c913d>
1454ca0ec:     	movq	0xa0(%rsi), %rax
1454ca0f3:     	movq	%r15, 0xa8(%rsi)
1454ca0fa:     	movq	%r15, %rdi
1454ca0fd:     	je	0x1454ca13d <.text+0x54c913d>
1454ca0ff:     	leaq	(%r15,%r15,2), %rcx
1454ca103:     	leaq	(%rax,%rcx,8), %rdi
1454ca107:     	addq	$0x8, %rdi
1454ca10b:     	jmp	0x1454ca119 <.text+0x54c9119>
1454ca10d:     	nopl	(%rax)
1454ca110:     	addq	$0x18, %rdi
1454ca114:     	decq	%rbx
1454ca117:     	je	0x1454ca136 <.text+0x54c9136>
1454ca119:     	movq	-0x8(%rdi), %rdx
1454ca11d:     	testq	%rdx, %rdx
1454ca120:     	je	0x1454ca110 <.text+0x54c9110>
1454ca122:     	movq	(%rdi), %rcx
1454ca125:     	shlq	$0x2, %rdx
1454ca129:     	movl	$0x4, %r8d
1454ca12f:     	callq	0x1400021d0 <.text+0x11d0>
1454ca134:     	jmp	0x1454ca110 <.text+0x54c9110>
1454ca136:     	movq	0xa8(%rsi), %rdi
1454ca13d:     	movq	0x718(%rsi), %rax
1454ca144:     	movq	%rax, %rdx
1454ca147:     	subq	%rdi, %rdx
1454ca14a:     	jbe	0x1454ca18a <.text+0x54c918a>
1454ca14c:     	leaq	0x98(%rsi), %rcx
1454ca153:     	movq	$0x0, 0x110(%rbp)
1454ca15e:     	movq	$0x4, 0x118(%rbp)
1454ca169:     	movq	$0x0, 0x120(%rbp)
1454ca174:     	movb	$0x0, 0x197(%rbp)
1454ca17b:     	leaq	0x110(%rbp), %r8
1454ca182:     	callq	0x145533c70 <.text+0x5532c70>
1454ca187:     	nop
1454ca188:     	jmp	0x1454ca1a1 <.text+0x54c91a1>
1454ca18a:     	movq	0xa0(%rsi), %rcx
1454ca191:     	movq	%rax, 0xa8(%rsi)
1454ca198:     	subq	%rax, %rdi
1454ca19b:     	jne	0x1454ca266 <.text+0x54c9266>
