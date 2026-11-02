
AzerothSurvivors/AzerothSurvivors-0.100.1.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
14544f73d:     	movq	%rcx, %rdi
14544f740:     	cmpq	$-0x1, 0xdf8(%rdx)
14544f748:     	je	0x14544f7c2 <.text+0x544e7c2>
14544f74a:     	movq	%rdx, %rbx
14544f74d:     	addq	$0xdf8, %rdx            # imm = 0xDF8
14544f754:     	movq	0xf00(%rbx), %rax
14544f75b:     	movq	%rax, 0xc88(%rbp)
14544f762:     	movzbl	0xf64(%rbx), %r14d
14544f76a:     	movzbl	0xf65(%rbx), %r15d
14544f772:     	movzbl	0xf66(%rbx), %r13d
14544f77a:     	leaq	-0x40(%rbp), %rcx
14544f77e:     	callq	0x145728850 <.text+0x5727850>
14544f783:     	movq	0xe20(%rbx), %rsi
14544f78a:     	movq	%rsi, %r12
14544f78d:     	shlq	$0x4, %r12
14544f791:     	movq	%rsi, %rax
14544f794:     	shrq	$0x3c, %rax
14544f798:     	setne	%al
14544f79b:     	movabsq	$0x7ffffffffffffff8, %rcx # imm = 0x7FFFFFFFFFFFFFF8
14544f7a5:     	cmpq	%rcx, %r12
14544f7a8:     	seta	%cl
14544f7ab:     	orb	%al, %cl
14544f7ad:     	je	0x14544f7ce <.text+0x544e7ce>
14544f7af:     	xorl	%ebx, %ebx
14544f7b1:     	movq	%rbx, %rcx
14544f7b4:     	movq	%r12, %rdx
14544f7b7:     	callq	0x14590379b <.text+0x590279b>
14544f7bc:     	nop
14544f7bd:     	jmp	0x14544ffe8 <.text+0x544efe8>
14544f7c2:     	movq	$0x2, (%rdi)
14544f7c9:     	jmp	0x14544ff51 <.text+0x544ef51>
