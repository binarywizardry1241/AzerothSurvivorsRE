
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454ca041:     	movq	0x90(%rsi), %rbx
1454ca048:     	cmpq	%rbx, %r15
1454ca04b:     	ja	0x1454ca057 <.text+0x54c9057>
1454ca04d:     	movq	%r15, 0x90(%rsi)
1454ca054:     	movq	%r15, %rbx
1454ca057:     	movq	0x718(%rsi), %rdi
1454ca05e:     	movq	%rdi, %r14
1454ca061:     	subq	%rbx, %r14
1454ca064:     	jbe	0x1454ca0d6 <.text+0x54c90d6>
1454ca066:     	leaq	0x80(%rsi), %rcx
1454ca06d:     	movq	(%rcx), %rax
1454ca070:     	subq	%rbx, %rax
1454ca073:     	movq	%rbx, %r15
1454ca076:     	cmpq	%rax, %r14
1454ca079:     	ja	0x1454ca7d1 <.text+0x54c97d1>
1454ca07f:     	movq	0x88(%rsi), %r12
1454ca086:     	leaq	(%r12,%r15,4), %rcx
1454ca08a:     	cmpq	$0x2, %r14
1454ca08e:     	jb	0x1454ca0bc <.text+0x54c90bc>
1454ca090:     	movq	%rbx, %r8
1454ca093:     	notq	%r8
1454ca096:     	addq	%rdi, %r8
1454ca099:     	shlq	$0x2, %r8
1454ca09d:     	xorl	%edx, %edx
1454ca09f:     	callq	0x1457731db <.text+0x57721db>
1454ca0a4:     	addq	%r15, %rdi
1454ca0a7:     	shlq	$0x2, %rbx
1454ca0ab:     	leaq	(%r12,%rdi,4), %rcx
1454ca0af:     	subq	%rbx, %rcx
1454ca0b2:     	addq	$-0x4, %rcx
1454ca0b6:     	addq	%r14, %r15
1454ca0b9:     	decq	%r15
1454ca0bc:     	movl	$0x0, (%rcx)
1454ca0c2:     	incq	%r15
1454ca0c5:     	movq	%r15, %rdi
1454ca0c8:     	movq	0x178(%rbp), %r12
1454ca0cf:     	movq	0x188(%rbp), %r15
1454ca0d6:     	movq	%rdi, 0x90(%rsi)
