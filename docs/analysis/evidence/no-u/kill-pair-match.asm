
AzerothSurvivors-0.105.0.exe:	file format coff-x86-64

Disassembly of section .text:

0000000140001000 <.text>:
1458d49ad:     	movq	-0x18(%rbp), %rcx
1458d49b1:     	movq	-0x20(%rbp), %rdx
1458d49b5:     	movl	0x3c(%rbp), %r9d
1458d49b9:     	movl	0xc(%rbp), %r10d
1458d49bd:     	nopl	(%rax)
1458d49c0:     	movq	%rcx, %rax
1458d49c3:     	testq	%rcx, %rcx
1458d49c6:     	je	0x1458d49de <.text+0x58d39de>
1458d49c8:     	movq	%rdx, %r8
1458d49cb:     	addq	$0x8, %rdx
1458d49cf:     	leaq	-0x8(%rax), %rcx
1458d49d3:     	cmpl	%r9d, (%r8)
1458d49d6:     	jne	0x1458d49c0 <.text+0x58d39c0>
1458d49d8:     	cmpl	%r10d, 0x4(%r8)
1458d49dc:     	jne	0x1458d49c0 <.text+0x58d39c0>
1458d49de:     	testq	%rax, %rax
1458d49e1:     	setne	%al
