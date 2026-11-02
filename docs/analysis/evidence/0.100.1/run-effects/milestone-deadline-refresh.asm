
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1454c9fb4:     	movq	0x78(%rsi), %rbx
1454c9fb8:     	cmpq	%rbx, %r15
1454c9fbb:     	ja	0x1454c9fc4 <.text+0x54c8fc4>
1454c9fbd:     	movq	%r15, 0x78(%rsi)
1454c9fc1:     	movq	%r15, %rbx
1454c9fc4:     	movq	0x718(%rsi), %rdi
1454c9fcb:     	movq	%rdi, %r14
1454c9fce:     	subq	%rbx, %r14
1454c9fd1:     	jbe	0x1454ca03d <.text+0x54c903d>
1454c9fd3:     	leaq	0x68(%rsi), %rcx
1454c9fd7:     	movq	(%rcx), %rax
1454c9fda:     	subq	%rbx, %rax
1454c9fdd:     	movq	%rbx, %r15
1454c9fe0:     	cmpq	%rax, %r14
1454c9fe3:     	ja	0x1454ca794 <.text+0x54c9794>
1454c9fe9:     	movq	0x70(%rsi), %r12
1454c9fed:     	leaq	(%r12,%r15,4), %rcx
1454c9ff1:     	cmpq	$0x2, %r14
1454c9ff5:     	jb	0x1454ca023 <.text+0x54c9023>
1454c9ff7:     	movq	%rbx, %r8
1454c9ffa:     	notq	%r8
1454c9ffd:     	addq	%rdi, %r8
1454ca000:     	shlq	$0x2, %r8
1454ca004:     	xorl	%edx, %edx
1454ca006:     	callq	0x1457731db <.text+0x57721db>
1454ca00b:     	addq	%r15, %rdi
1454ca00e:     	shlq	$0x2, %rbx
1454ca012:     	leaq	(%r12,%rdi,4), %rcx
1454ca016:     	subq	%rbx, %rcx
1454ca019:     	addq	$-0x4, %rcx
1454ca01d:     	addq	%r14, %r15
1454ca020:     	decq	%r15
1454ca023:     	movl	$0x0, (%rcx)
1454ca029:     	incq	%r15
1454ca02c:     	movq	%r15, %rdi
1454ca02f:     	movq	0x178(%rbp), %r12
1454ca036:     	movq	0x188(%rbp), %r15
1454ca03d:     	movq	%rdi, 0x78(%rsi)
